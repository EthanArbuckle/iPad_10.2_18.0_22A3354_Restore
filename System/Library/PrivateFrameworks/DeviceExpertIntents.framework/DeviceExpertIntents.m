uint64_t FeedbackModel.question.getter()
{
  uint64_t *v0;
  uint64_t v1;

  v1 = *v0;
  OUTLINED_FUNCTION_7();
  return v1;
}

void FeedbackModel.question.setter(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;

  swift_bridgeObjectRelease();
  *v2 = a1;
  v2[1] = a2;
  OUTLINED_FUNCTION_5();
}

uint64_t (*FeedbackModel.question.modify())()
{
  return nullsub_1;
}

uint64_t FeedbackModel.answer.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 16);
  OUTLINED_FUNCTION_7();
  return v1;
}

void FeedbackModel.answer.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  swift_bridgeObjectRelease();
  *(_QWORD *)(v2 + 16) = a1;
  *(_QWORD *)(v2 + 24) = a2;
  OUTLINED_FUNCTION_5();
}

uint64_t (*FeedbackModel.answer.modify())()
{
  return nullsub_1;
}

uint64_t FeedbackModel.init(result:)@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
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
  char *v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;
  uint64_t result;
  uint64_t v23;

  v4 = sub_23A4AA210();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  OUTLINED_FUNCTION_4();
  v8 = v7 - v6;
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_25697FF70);
  v10 = MEMORY[0x24BDAC7A8](v9);
  v12 = (char *)&v23 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v10);
  v14 = (char *)&v23 - v13;
  sub_23A4726B0(a1, (uint64_t)&v23 - v13);
  v15 = sub_23A4AA27C();
  if (__swift_getEnumTagSinglePayload((uint64_t)v14, 1, v15) == 1)
  {
    sub_23A472704((uint64_t)v14);
    v16 = 0;
    v17 = 0xE000000000000000;
  }
  else
  {
    v16 = sub_23A4AA240();
    v17 = v18;
    (*(void (**)(char *, uint64_t))(*(_QWORD *)(v15 - 8) + 8))(v14, v15);
  }
  sub_23A4726B0(a1, (uint64_t)v12);
  if (__swift_getEnumTagSinglePayload((uint64_t)v12, 1, v15) == 1)
  {
    sub_23A472704((uint64_t)v12);
    v19 = 0;
    v20 = 0xE000000000000000;
  }
  else
  {
    sub_23A4AA21C();
    (*(void (**)(char *, uint64_t))(*(_QWORD *)(v15 - 8) + 8))(v12, v15);
    sub_23A472744();
    v19 = sub_23A4AA6A8();
    v20 = v21;
    (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v8, v4);
  }
  result = sub_23A472704(a1);
  *a2 = v16;
  a2[1] = v17;
  a2[2] = v19;
  a2[3] = v20;
  return result;
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x23B84E298]((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t sub_23A4726B0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_25697FF70);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t __swift_getEnumTagSinglePayload(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a3 - 8) + 48))();
}

uint64_t sub_23A472704(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_25697FF70);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_23A472744()
{
  unint64_t result;
  uint64_t v1;

  result = qword_25697FF78;
  if (!qword_25697FF78)
  {
    v1 = sub_23A4AA210();
    result = MEMORY[0x23B84E2B0](MEMORY[0x24BE6FEC8], v1);
    atomic_store(result, (unint64_t *)&qword_25697FF78);
  }
  return result;
}

BOOL sub_23A472784(int a1, int a2)
{
  return ((a2 ^ a1) & 1) == 0;
}

uint64_t sub_23A472794()
{
  return sub_23A4AAAD4();
}

uint64_t sub_23A4727B8(uint64_t a1, uint64_t a2)
{
  BOOL v3;
  char v7;

  v3 = a1 == 0x6E6F697473657571 && a2 == 0xE800000000000000;
  if (v3 || (sub_23A4AAAB0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x726577736E61 && a2 == 0xE600000000000000)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    v7 = sub_23A4AAAB0();
    swift_bridgeObjectRelease();
    if ((v7 & 1) != 0)
      return 1;
    else
      return 2;
  }
}

uint64_t sub_23A472894()
{
  return 2;
}

uint64_t sub_23A47289C()
{
  sub_23A4AAAC8();
  sub_23A4AAAD4();
  return sub_23A4AAAE0();
}

uint64_t sub_23A4728E0()
{
  return 0;
}

uint64_t sub_23A4728EC(char a1)
{
  if ((a1 & 1) != 0)
    return 0x726577736E61;
  else
    return 0x6E6F697473657571;
}

BOOL sub_23A472920(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return sub_23A472784(*a1, *a2);
}

uint64_t sub_23A47292C()
{
  return sub_23A47289C();
}

uint64_t sub_23A472934()
{
  return sub_23A472794();
}

uint64_t sub_23A47293C()
{
  sub_23A4AAAC8();
  sub_23A4AAAD4();
  return sub_23A4AAAE0();
}

uint64_t sub_23A47297C()
{
  char *v0;

  return sub_23A4728EC(*v0);
}

uint64_t sub_23A472984@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_23A4727B8(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_23A4729A8()
{
  return sub_23A4728E0();
}

uint64_t sub_23A4729C4@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = sub_23A472894();
  *a1 = result;
  return result;
}

uint64_t sub_23A4729E8()
{
  sub_23A472B5C();
  return sub_23A4AAB04();
}

uint64_t sub_23A472A10()
{
  sub_23A472B5C();
  return sub_23A4AAB10();
}

void FeedbackModel.encode(to:)(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_25697FF80);
  v7 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8]();
  OUTLINED_FUNCTION_4();
  v6 = v5 - v4;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_23A472B5C();
  sub_23A4AAAF8();
  OUTLINED_FUNCTION_3();
  if (!v1)
    OUTLINED_FUNCTION_3();
  (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v6, v3);
  OUTLINED_FUNCTION_0();
}

_QWORD *__swift_project_boxed_opaque_existential_1(_QWORD *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) & 0x20000) != 0)
    return (_QWORD *)(*result
                    + ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80)));
  return result;
}

unint64_t sub_23A472B5C()
{
  unint64_t result;

  result = qword_25697FF88;
  if (!qword_25697FF88)
  {
    result = MEMORY[0x23B84E2B0](&unk_23A4AB108, &type metadata for FeedbackModel.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_25697FF88);
  }
  return result;
}

void FeedbackModel.init(from:)(_QWORD *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  uint64_t v13;

  v5 = *(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_25697FF90) - 8);
  MEMORY[0x24BDAC7A8]();
  OUTLINED_FUNCTION_4();
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_23A472B5C();
  sub_23A4AAAEC();
  if (v2)
  {
    OUTLINED_FUNCTION_6();
  }
  else
  {
    v6 = OUTLINED_FUNCTION_2();
    v8 = v7;
    swift_bridgeObjectRetain();
    v9 = OUTLINED_FUNCTION_2();
    v11 = v10;
    v12 = *(uint64_t (**)(uint64_t, uint64_t))(v5 + 8);
    v13 = v9;
    OUTLINED_FUNCTION_1(v12);
    *a2 = v6;
    a2[1] = v8;
    a2[2] = v13;
    a2[3] = v11;
    OUTLINED_FUNCTION_7();
    OUTLINED_FUNCTION_6();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  OUTLINED_FUNCTION_0();
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

void sub_23A472CFC(_QWORD *a1@<X0>, uint64_t *a2@<X8>)
{
  FeedbackModel.init(from:)(a1, a2);
}

void sub_23A472D10(_QWORD *a1)
{
  FeedbackModel.encode(to:)(a1);
}

uint64_t initializeBufferWithCopyOfBuffer for FeedbackModel(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *a2;
  *a1 = *a2;
  v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t destroy for FeedbackModel()
{
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

_QWORD *initializeWithCopy for FeedbackModel(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;
  uint64_t v4;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  v4 = a2[3];
  a1[2] = a2[2];
  a1[3] = v4;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

_QWORD *assignWithCopy for FeedbackModel(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  a1[3] = a2[3];
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

_QWORD *assignWithTake for FeedbackModel(_QWORD *a1, _QWORD *a2)
{
  uint64_t v4;
  uint64_t v5;

  v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  swift_bridgeObjectRelease();
  v5 = a2[3];
  a1[2] = a2[2];
  a1[3] = v5;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for FeedbackModel(uint64_t a1, int a2)
{
  unint64_t v2;

  if (a2)
  {
    if (a2 < 0 && *(_BYTE *)(a1 + 32))
    {
      LODWORD(v2) = *(_DWORD *)a1 + 0x7FFFFFFF;
    }
    else
    {
      v2 = *(_QWORD *)(a1 + 8);
      if (v2 >= 0xFFFFFFFF)
        LODWORD(v2) = -1;
    }
  }
  else
  {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for FeedbackModel(uint64_t result, int a2, int a3)
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
      *(_QWORD *)(result + 8) = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 32) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for FeedbackModel()
{
  return &type metadata for FeedbackModel;
}

_BYTE *__swift_memcpy1_1(_BYTE *result, _BYTE *a2)
{
  *result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for FeedbackModel.CodingKeys(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  int v5;
  unsigned int v6;
  BOOL v7;

  if (!a2)
  {
    v5 = -1;
    return (v5 + 1);
  }
  if (a2 >= 0xFF)
  {
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
      if (!v4)
        goto LABEL_17;
    }
    else if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
    }
    else
    {
      v4 = a1[1];
      if (!a1[1])
        goto LABEL_17;
    }
    v5 = (*a1 | (v4 << 8)) - 2;
    return (v5 + 1);
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 2;
  v5 = v6 - 2;
  if (!v7)
    v5 = -1;
  return (v5 + 1);
}

uint64_t storeEnumTagSinglePayload for FeedbackModel.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_23A472FE8 + 4 * byte_23A4AAFB5[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_23A47301C + 4 * byte_23A4AAFB0[v4]))();
}

uint64_t sub_23A47301C(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_23A473024(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x23A47302CLL);
  return result;
}

uint64_t sub_23A473038(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x23A473040);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_23A473044(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23A47304C(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23A473058(unsigned __int8 *a1)
{
  return *a1;
}

_BYTE *sub_23A473060(_BYTE *result, char a2)
{
  *result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for FeedbackModel.CodingKeys()
{
  return &type metadata for FeedbackModel.CodingKeys;
}

unint64_t sub_23A473080()
{
  unint64_t result;

  result = qword_25697FF98;
  if (!qword_25697FF98)
  {
    result = MEMORY[0x23B84E2B0](&unk_23A4AB0E0, &type metadata for FeedbackModel.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_25697FF98);
  }
  return result;
}

unint64_t sub_23A4730C0()
{
  unint64_t result;

  result = qword_25697FFA0;
  if (!qword_25697FFA0)
  {
    result = MEMORY[0x23B84E2B0](&unk_23A4AB050, &type metadata for FeedbackModel.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_25697FFA0);
  }
  return result;
}

unint64_t sub_23A473100()
{
  unint64_t result;

  result = qword_25697FFA8;
  if (!qword_25697FFA8)
  {
    result = MEMORY[0x23B84E2B0](&unk_23A4AB078, &type metadata for FeedbackModel.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_25697FFA8);
  }
  return result;
}

uint64_t sub_23A47313C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  result = sub_23A481790();
  *a1 = result;
  return result;
}

_QWORD *sub_23A473160@<X0>(_QWORD *result@<X0>, _QWORD *a2@<X8>)
{
  *a2 = *result;
  return result;
}

uint64_t OUTLINED_FUNCTION_1@<X0>(uint64_t (*a1)(uint64_t, uint64_t)@<X8>)
{
  uint64_t v1;
  uint64_t v2;

  return a1(v2, v1);
}

uint64_t OUTLINED_FUNCTION_2()
{
  return sub_23A4AAA2C();
}

uint64_t OUTLINED_FUNCTION_3()
{
  return sub_23A4AAA80();
}

uint64_t OUTLINED_FUNCTION_6()
{
  uint64_t v0;

  return __swift_destroy_boxed_opaque_existential_1(v0);
}

uint64_t OUTLINED_FUNCTION_7()
{
  return swift_bridgeObjectRetain();
}

uint64_t sub_23A4731E0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v6;
  _QWORD *v13;
  uint64_t (*v15)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t);

  v15 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(**(int **)(a6 + 8)
                                                                                     + *(_QWORD *)(a6 + 8));
  v13 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v6 + 16) = v13;
  *v13 = v6;
  v13[1] = sub_23A473280;
  return v15(a1, a2, a3, a4, a5, a6);
}

uint64_t sub_23A473280()
{
  uint64_t v0;

  OUTLINED_FUNCTION_47();
  OUTLINED_FUNCTION_45();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

_QWORD *sub_23A4732B4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _QWORD *v3;

  v3[2] = a1;
  v3[3] = a2;
  v3[4] = a3;
  return v3;
}

uint64_t sub_23A4732C4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v5[36] = a4;
  v5[37] = v4;
  v5[34] = a2;
  v5[35] = a3;
  v5[33] = a1;
  type metadata accessor for SupplementarySnippetModel();
  v5[38] = OUTLINED_FUNCTION_35();
  v6 = sub_23A4AA210();
  v5[39] = v6;
  v5[40] = *(_QWORD *)(v6 - 8);
  v5[41] = OUTLINED_FUNCTION_35();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256980070);
  v5[42] = OUTLINED_FUNCTION_6_0();
  v5[43] = OUTLINED_FUNCTION_6_0();
  v5[44] = OUTLINED_FUNCTION_6_0();
  v5[45] = OUTLINED_FUNCTION_6_0();
  v5[46] = OUTLINED_FUNCTION_6_0();
  sub_23A4A9E20();
  v5[47] = OUTLINED_FUNCTION_35();
  v7 = sub_23A4A9DF0();
  v5[48] = v7;
  v5[49] = *(_QWORD *)(v7 - 8);
  v5[50] = OUTLINED_FUNCTION_6_0();
  v5[51] = OUTLINED_FUNCTION_6_0();
  v8 = sub_23A4AA06C();
  v5[52] = v8;
  v5[53] = *(_QWORD *)(v8 - 8);
  v5[54] = OUTLINED_FUNCTION_6_0();
  v5[55] = OUTLINED_FUNCTION_6_0();
  v5[56] = OUTLINED_FUNCTION_6_0();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256980078);
  v5[57] = OUTLINED_FUNCTION_6_0();
  v5[58] = OUTLINED_FUNCTION_6_0();
  v5[59] = OUTLINED_FUNCTION_6_0();
  v9 = sub_23A4AA27C();
  v5[60] = v9;
  v5[61] = *(_QWORD *)(v9 - 8);
  v5[62] = OUTLINED_FUNCTION_6_0();
  v5[63] = OUTLINED_FUNCTION_6_0();
  v5[64] = OUTLINED_FUNCTION_6_0();
  v5[65] = OUTLINED_FUNCTION_6_0();
  v5[66] = OUTLINED_FUNCTION_6_0();
  v5[67] = OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_24();
  return OUTLINED_FUNCTION_1_0();
}

uint64_t sub_23A47346C()
{
  NSObject *v0;
  os_log_type_t v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;
  uint64_t (*v6)();
  uint64_t v7;
  uint64_t v8;
  uint64_t v10;
  uint64_t v11;
  os_log_type_t v12;
  uint64_t v13;
  float *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;

  swift_bridgeObjectRetain();
  v2[68] = sub_23A4AA270();
  v2[69] = v3;
  sub_23A4AA174();
  OUTLINED_FUNCTION_34();
  OUTLINED_FUNCTION_37();
  if (v4)
  {
    v5 = (_QWORD *)swift_task_alloc();
    v2[70] = v5;
    v6 = sub_23A47367C;
LABEL_5:
    *v5 = v2;
    v5[1] = v6;
    v8 = OUTLINED_FUNCTION_22();
    return sub_23A474C04(v8);
  }
  sub_23A4AA0FC();
  OUTLINED_FUNCTION_34();
  OUTLINED_FUNCTION_37();
  if (v7)
  {
    v5 = (_QWORD *)swift_task_alloc();
    v2[72] = v5;
    v6 = sub_23A473B98;
    goto LABEL_5;
  }
  if (qword_25697FF48 != -1)
    swift_once();
  v10 = OUTLINED_FUNCTION_19();
  v11 = __swift_project_value_buffer(v10, (uint64_t)qword_2569815D0);
  OUTLINED_FUNCTION_7_0(v11);
  OUTLINED_FUNCTION_58();
  v12 = OUTLINED_FUNCTION_56();
  if (OUTLINED_FUNCTION_53(v12))
  {
    v13 = v2[56];
    v20 = v2[53];
    v21 = v2[52];
    v14 = (float *)OUTLINED_FUNCTION_3_0();
    OUTLINED_FUNCTION_38(v14, 3.852e-34);
    OUTLINED_FUNCTION_89();
    v15 = OUTLINED_FUNCTION_50();
    (*(void (**)(uint64_t, uint64_t))(v20 + 8))(v13, v21);
    OUTLINED_FUNCTION_13();
    v2[28] = v15;
    OUTLINED_FUNCTION_48();
    OUTLINED_FUNCTION_12(&dword_23A470000, v0, v1, "Result with preferred template type %ld", (uint8_t *)v14);
    OUTLINED_FUNCTION_0_0();
  }
  OUTLINED_FUNCTION_13();

  v16 = OUTLINED_FUNCTION_27();
  OUTLINED_FUNCTION_26(v16);
  v17 = OUTLINED_FUNCTION_40();
  v2[77] = OUTLINED_FUNCTION_101(v17);
  v18 = (_QWORD *)swift_task_alloc();
  v2[78] = v18;
  *v18 = v2;
  v18[1] = sub_23A4740A8;
  v19 = OUTLINED_FUNCTION_22();
  return sub_23A4A1120(v19);
}

uint64_t sub_23A47367C()
{
  uint64_t v0;
  uint64_t v1;

  OUTLINED_FUNCTION_23();
  OUTLINED_FUNCTION_20();
  *(_QWORD *)(v1 + 568) = v0;
  OUTLINED_FUNCTION_42();
  OUTLINED_FUNCTION_24();
  return OUTLINED_FUNCTION_1_0();
}

uint64_t sub_23A4736B8(int a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, os_log_type_t type, uint64_t a20,uint64_t a21,__int128 a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35)
{
  NSObject *v35;
  os_log_type_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  uint64_t v41;
  void *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  id v48;
  NSObject *v49;
  os_log_type_t v50;
  _BOOL4 v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  id v56;
  uint64_t v57;
  unint64_t v58;
  unint64_t v59;
  uint64_t v60;
  unint64_t v61;
  uint64_t v62;
  _QWORD *v63;
  uint64_t v64;
  uint64_t v66;
  uint64_t v67;
  os_log_type_t v68;
  uint64_t v69;
  float *v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  _QWORD *v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  os_log_type_t v82;
  uint64_t v83;
  uint64_t v84;
  __int128 v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;

  OUTLINED_FUNCTION_55();
  v89 = v38;
  v90 = v39;
  v88 = v37;
  v40 = *(void **)(v37 + 568);
  if (v40)
  {
    objc_opt_self();
    v41 = OUTLINED_FUNCTION_33();
    if (v41)
    {
      v42 = (void *)v41;
      if (qword_25697FF48 != -1)
        swift_once();
      v43 = *(_QWORD *)(v37 + 536);
      v44 = *(_QWORD *)(v37 + 480);
      v45 = *(_QWORD *)(v37 + 488);
      v46 = *(_QWORD *)(v37 + 272);
      v47 = OUTLINED_FUNCTION_39();
      __swift_project_value_buffer(v47, (uint64_t)qword_2569815D0);
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v45 + 16))(v43, v46, v44);
      v48 = v40;
      v49 = sub_23A4AA6D8();
      v50 = sub_23A4AA8C4();
      v51 = OUTLINED_FUNCTION_67(v49);
      v52 = *(_QWORD *)(v37 + 536);
      v53 = *(_QWORD *)(v37 + 480);
      v54 = *(_QWORD *)(v37 + 488);
      if (v51)
      {
        v83 = *(_QWORD *)(v37 + 480);
        v55 = OUTLINED_FUNCTION_3_0();
        *(_QWORD *)&v85 = OUTLINED_FUNCTION_3_0();
        *(_DWORD *)v55 = 136315394;
        v80 = v54;
        v56 = objc_msgSend(v42, sel_identifier);
        v57 = sub_23A4AA7C8();
        v82 = v50;
        v59 = v58;

        *(_QWORD *)(v37 + 248) = sub_23A49D6D8(v57, v59, (uint64_t *)&v85);
        sub_23A4AA900();
        swift_bridgeObjectRelease();

        *(_WORD *)(v55 + 12) = 2080;
        v60 = sub_23A4AA15C();
        *(_QWORD *)(v37 + 256) = sub_23A49D6D8(v60, v61, (uint64_t *)&v85);
        sub_23A4AA900();
        swift_bridgeObjectRelease();
        (*(void (**)(uint64_t, uint64_t))(v80 + 8))(v52, v83);
        _os_log_impl(&dword_23A470000, v49, v82, "Found eligible tip %s for result %s", (uint8_t *)v55, 0x16u);
        OUTLINED_FUNCTION_96();
        OUTLINED_FUNCTION_0_0();
      }

      (*(void (**)(uint64_t, uint64_t))(v54 + 8))(v52, v53);
      v72 = *(_QWORD *)(v37 + 552);
      v73 = *(_QWORD *)(v37 + 544);
      v74 = *(_QWORD *)(v37 + 264);
      v85 = *(_OWORD *)(v37 + 280);
      v86 = v73;
      v87 = v72;
      TipSnippetModel.init(tip:context:)(v42, &v85, v74);
      OUTLINED_FUNCTION_92();
      OUTLINED_FUNCTION_95();
      swift_storeEnumTagMultiPayload();
      OUTLINED_FUNCTION_25(v74, 0);
      v75 = OUTLINED_FUNCTION_91();
      OUTLINED_FUNCTION_25(v74 + *(int *)(v75 + 20), 1);
      swift_task_dealloc();
      OUTLINED_FUNCTION_99();
      OUTLINED_FUNCTION_83();
      OUTLINED_FUNCTION_76();
      OUTLINED_FUNCTION_85();
      OUTLINED_FUNCTION_61();
      OUTLINED_FUNCTION_74();
      OUTLINED_FUNCTION_82();
      OUTLINED_FUNCTION_79();
      OUTLINED_FUNCTION_93();
      OUTLINED_FUNCTION_78();
      OUTLINED_FUNCTION_73();
      OUTLINED_FUNCTION_72();
      OUTLINED_FUNCTION_68();
      OUTLINED_FUNCTION_71();
      OUTLINED_FUNCTION_69();
      OUTLINED_FUNCTION_66();
      OUTLINED_FUNCTION_65();
      OUTLINED_FUNCTION_64();
      OUTLINED_FUNCTION_63();
      OUTLINED_FUNCTION_62();
      OUTLINED_FUNCTION_70();
      return OUTLINED_FUNCTION_4_0(*(uint64_t (**)(void))(v37 + 8));
    }

  }
  sub_23A4AA0FC();
  OUTLINED_FUNCTION_34();
  OUTLINED_FUNCTION_37();
  if (v62)
  {
    v63 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v37 + 576) = v63;
    *v63 = v37;
    v63[1] = sub_23A473B98;
    v64 = OUTLINED_FUNCTION_22();
    return sub_23A474C04(v64);
  }
  else
  {
    if (qword_25697FF48 != -1)
      swift_once();
    v66 = OUTLINED_FUNCTION_19();
    v67 = __swift_project_value_buffer(v66, (uint64_t)qword_2569815D0);
    OUTLINED_FUNCTION_7_0(v67);
    OUTLINED_FUNCTION_58();
    v68 = OUTLINED_FUNCTION_56();
    if (OUTLINED_FUNCTION_53(v68))
    {
      v69 = *(_QWORD *)(v37 + 448);
      v81 = *(_QWORD *)(v37 + 424);
      v84 = *(_QWORD *)(v37 + 416);
      v70 = (float *)OUTLINED_FUNCTION_3_0();
      OUTLINED_FUNCTION_38(v70, 3.852e-34);
      OUTLINED_FUNCTION_89();
      v71 = OUTLINED_FUNCTION_50();
      (*(void (**)(uint64_t, uint64_t))(v81 + 8))(v69, v84);
      OUTLINED_FUNCTION_13();
      *(_QWORD *)(v37 + 224) = v71;
      OUTLINED_FUNCTION_48();
      OUTLINED_FUNCTION_12(&dword_23A470000, v35, v36, "Result with preferred template type %ld", (uint8_t *)v70);
      OUTLINED_FUNCTION_0_0();
    }
    OUTLINED_FUNCTION_13();

    v76 = OUTLINED_FUNCTION_27();
    OUTLINED_FUNCTION_26(v76);
    v77 = OUTLINED_FUNCTION_40();
    *(_QWORD *)(v37 + 616) = OUTLINED_FUNCTION_101(v77);
    v78 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v37 + 624) = v78;
    *v78 = v37;
    v78[1] = sub_23A4740A8;
    v79 = OUTLINED_FUNCTION_22();
    return OUTLINED_FUNCTION_14(v79);
  }
}

uint64_t sub_23A473B98()
{
  uint64_t v0;
  uint64_t v1;

  OUTLINED_FUNCTION_23();
  OUTLINED_FUNCTION_20();
  *(_QWORD *)(v1 + 584) = v0;
  OUTLINED_FUNCTION_42();
  OUTLINED_FUNCTION_24();
  return OUTLINED_FUNCTION_1_0();
}

uint64_t sub_23A473BD4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36)
{
  NSObject *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  uint64_t v41;
  void *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  id v48;
  NSObject *v49;
  os_log_type_t v50;
  _BOOL4 v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  id v56;
  uint64_t v57;
  unint64_t v58;
  unint64_t v59;
  uint64_t v60;
  unint64_t v61;
  uint64_t v62;
  uint64_t v63;
  os_log_type_t v64;
  _BOOL4 v65;
  uint64_t v66;
  uint64_t v67;
  float *v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  _QWORD *v72;
  uint64_t v73;
  uint64_t v75;
  void (*v76)(uint64_t);
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  id v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  void *v89;
  uint64_t v90;
  void *v91;
  uint64_t v92;
  void (*v93)(uint64_t, uint64_t, uint64_t);
  uint64_t v94;

  OUTLINED_FUNCTION_55();
  a35 = v38;
  a36 = v39;
  a34 = v37;
  v40 = *(void **)(v37 + 584);
  if (v40)
  {
    objc_opt_self();
    v41 = OUTLINED_FUNCTION_33();
    if (v41)
    {
      v42 = (void *)v41;
      if (qword_25697FF48 != -1)
        swift_once();
      v43 = *(_QWORD *)(v37 + 528);
      v45 = *(_QWORD *)(v37 + 480);
      v44 = *(_QWORD *)(v37 + 488);
      v46 = *(_QWORD *)(v37 + 272);
      v47 = OUTLINED_FUNCTION_39();
      __swift_project_value_buffer(v47, (uint64_t)qword_2569815D0);
      v93 = *(void (**)(uint64_t, uint64_t, uint64_t))(v44 + 16);
      v93(v43, v46, v45);
      v48 = v40;
      v49 = sub_23A4AA6D8();
      v50 = sub_23A4AA8C4();
      v51 = os_log_type_enabled(v49, v50);
      v52 = *(_QWORD *)(v37 + 528);
      v53 = *(_QWORD *)(v37 + 480);
      v54 = *(_QWORD *)(v37 + 488);
      v89 = v48;
      v91 = v42;
      if (v51)
      {
        v55 = OUTLINED_FUNCTION_3_0();
        a22 = OUTLINED_FUNCTION_3_0();
        *(_DWORD *)v55 = 136315394;
        v86 = v54;
        v56 = objc_msgSend(v42, sel_identifier);
        v57 = sub_23A4AA7C8();
        v59 = v58;

        *(_QWORD *)(v37 + 232) = sub_23A49D6D8(v57, v59, &a22);
        sub_23A4AA900();
        swift_bridgeObjectRelease();

        *(_WORD *)(v55 + 12) = 2080;
        v60 = sub_23A4AA15C();
        *(_QWORD *)(v37 + 240) = sub_23A49D6D8(v60, v61, &a22);
        sub_23A4AA900();
        swift_bridgeObjectRelease();
        (*(void (**)(uint64_t, uint64_t))(v86 + 8))(v52, v53);
        _os_log_impl(&dword_23A470000, v49, v50, "Found eligible collection %s for result %s", (uint8_t *)v55, 0x16u);
        OUTLINED_FUNCTION_96();
        OUTLINED_FUNCTION_0_0();
      }

      v75 = OUTLINED_FUNCTION_95();
      v76(v75);

      v77 = *(_QWORD *)(v37 + 552);
      v78 = *(_QWORD *)(v37 + 544);
      v79 = *(_QWORD *)(v37 + 520);
      v80 = *(_QWORD *)(v37 + 472);
      v94 = *(_QWORD *)(v37 + 480);
      v82 = *(_QWORD *)(v37 + 280);
      v81 = *(_QWORD *)(v37 + 288);
      v87 = v82;
      v83 = *(_QWORD *)(v37 + 264);
      v88 = *(_QWORD *)(v37 + 272);
      ((void (*)(uint64_t))v93)(v79);
      type metadata accessor for AttributionModel();
      OUTLINED_FUNCTION_25(v80, 1);
      a22 = v82;
      a23 = v81;
      a24 = v78;
      a25 = v77;
      v84 = v89;
      OUTLINED_FUNCTION_30();
      OUTLINED_FUNCTION_87();
      sub_23A489E9C(v79, v80, v91, &a22, v83);
      OUTLINED_FUNCTION_92();
      swift_storeEnumTagMultiPayload();
      OUTLINED_FUNCTION_43();
      v85 = v83 + *(int *)(OUTLINED_FUNCTION_91() + 20);
      v93(v79, v88, v94);
      OUTLINED_FUNCTION_25(v80, 1);
      a22 = v87;
      a23 = v81;
      a24 = v78;
      a25 = v77;
      sub_23A494D04(v79, v80, &a22, v85);

      swift_storeEnumTagMultiPayload();
      OUTLINED_FUNCTION_43();
      OUTLINED_FUNCTION_2_0();
      OUTLINED_FUNCTION_99();
      OUTLINED_FUNCTION_83();
      OUTLINED_FUNCTION_76();
      OUTLINED_FUNCTION_85();
      OUTLINED_FUNCTION_61();
      OUTLINED_FUNCTION_74();
      OUTLINED_FUNCTION_82();
      OUTLINED_FUNCTION_79();
      OUTLINED_FUNCTION_93();
      OUTLINED_FUNCTION_78();
      OUTLINED_FUNCTION_73();
      OUTLINED_FUNCTION_72();
      OUTLINED_FUNCTION_68();
      OUTLINED_FUNCTION_71();
      OUTLINED_FUNCTION_69();
      OUTLINED_FUNCTION_66();
      OUTLINED_FUNCTION_65();
      OUTLINED_FUNCTION_64();
      OUTLINED_FUNCTION_63();
      OUTLINED_FUNCTION_62();
      OUTLINED_FUNCTION_70();
      return OUTLINED_FUNCTION_4_0(*(uint64_t (**)(void))(v37 + 8));
    }

  }
  if (qword_25697FF48 != -1)
    swift_once();
  v62 = OUTLINED_FUNCTION_19();
  v63 = __swift_project_value_buffer(v62, (uint64_t)qword_2569815D0);
  OUTLINED_FUNCTION_7_0(v63);
  OUTLINED_FUNCTION_58();
  v64 = OUTLINED_FUNCTION_56();
  v65 = OUTLINED_FUNCTION_67(v36);
  v66 = *(_QWORD *)(v37 + 488);
  if (v65)
  {
    v67 = *(_QWORD *)(v37 + 448);
    v90 = *(_QWORD *)(v37 + 424);
    v92 = *(_QWORD *)(v37 + 416);
    v68 = (float *)OUTLINED_FUNCTION_3_0();
    OUTLINED_FUNCTION_38(v68, 3.852e-34);
    OUTLINED_FUNCTION_88();
    v69 = OUTLINED_FUNCTION_50();
    (*(void (**)(uint64_t, uint64_t))(v90 + 8))(v67, v92);
    OUTLINED_FUNCTION_31(*(uint64_t (**)(uint64_t, uint64_t))(v66 + 8));
    *(_QWORD *)(v37 + 224) = v69;
    OUTLINED_FUNCTION_48();
    OUTLINED_FUNCTION_12(&dword_23A470000, v36, v64, "Result with preferred template type %ld", (uint8_t *)v68);
    OUTLINED_FUNCTION_0_0();
  }
  OUTLINED_FUNCTION_31(*(uint64_t (**)(uint64_t, uint64_t))(v66 + 8));

  v70 = OUTLINED_FUNCTION_27();
  OUTLINED_FUNCTION_26(v70);
  v71 = OUTLINED_FUNCTION_40();
  *(_QWORD *)(v37 + 616) = OUTLINED_FUNCTION_101(v71);
  v72 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v37 + 624) = v72;
  *v72 = v37;
  v72[1] = sub_23A4740A8;
  v73 = OUTLINED_FUNCTION_22();
  return OUTLINED_FUNCTION_14(v73);
}

uint64_t sub_23A4740A8()
{
  OUTLINED_FUNCTION_47();
  OUTLINED_FUNCTION_45();
  OUTLINED_FUNCTION_24();
  return OUTLINED_FUNCTION_1_0();
}

uint64_t sub_23A4740DC()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD *inited;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  uint64_t (*v12)(uint64_t, uint64_t);

  v1 = v0[77];
  v2 = v0[76];
  v3 = v0[37];
  v4 = *(_QWORD *)(v3 + 24);
  v0[79] = v4;
  v5 = *(_QWORD *)(v3 + 32);
  type metadata accessor for AttributionItemFactory();
  inited = (_QWORD *)swift_initStackObject();
  v0[80] = inited;
  inited[5] = v2;
  inited[6] = &off_250B60A80;
  inited[2] = v1;
  inited[7] = v4;
  inited[8] = v5;
  swift_retain();
  swift_retain();
  swift_retain();
  v7 = sub_23A4AA078();
  v8 = sub_23A49331C(v7);
  v0[81] = v8;
  swift_bridgeObjectRelease();
  v9 = Array<A>.asAttributionGroups()(v8);
  v0[82] = v9;
  v12 = (uint64_t (*)(uint64_t, uint64_t))((char *)&dword_256981AA0 + dword_256981AA0);
  swift_retain();
  v10 = (_QWORD *)swift_task_alloc();
  v0[83] = v10;
  *v10 = v0;
  v10[1] = sub_23A4741F4;
  return v12(v9, v0[37]);
}

uint64_t sub_23A4741F4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  OUTLINED_FUNCTION_23();
  OUTLINED_FUNCTION_20();
  *(_QWORD *)(v2 + 672) = v1;
  *(_QWORD *)(v2 + 680) = v0;
  OUTLINED_FUNCTION_42();
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_24();
  return swift_task_switch();
}

uint64_t sub_23A474248()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;

  v1 = v0[84];
  v2 = v0[58];
  v3 = type metadata accessor for AttributionModel();
  v0[86] = v3;
  OUTLINED_FUNCTION_98(v2, v4, v5, v3);
  v6 = sub_23A4753F0(v1);
  v0[87] = v6;
  v7 = (_QWORD *)swift_task_alloc();
  v0[88] = v7;
  *v7 = v0;
  v7[1] = sub_23A4742E0;
  return sub_23A486C94(v6);
}

uint64_t sub_23A4742E0()
{
  _QWORD *v0;
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;
  _QWORD *v4;

  OUTLINED_FUNCTION_47();
  v2[19] = v0;
  v2[20] = v1;
  v2[21] = v3;
  *v4 = *v0;
  v2[89] = v3;
  swift_task_dealloc();
  OUTLINED_FUNCTION_52();
  OUTLINED_FUNCTION_24();
  return OUTLINED_FUNCTION_1_0();
}

#error "23A4743F4: call analysis failed (funcsize=542)"

uint64_t sub_23A474C04(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v2 + 32) = a1;
  *(_QWORD *)(v2 + 40) = v1;
  return swift_task_switch();
}

uint64_t sub_23A474C1C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  os_log_type_t v7;
  uint8_t *v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  uint64_t v12;
  _QWORD *v13;
  uint64_t v14;
  _QWORD *v15;
  os_log_type_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;

  *(_QWORD *)(v0 + 48) = sub_23A4AA0FC();
  *(_QWORD *)(v0 + 56) = v1;
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_97();
  if (v2)
    v3 = sub_23A4AA0FC();
  else
    v3 = sub_23A4AA174();
  *(_QWORD *)(v0 + 64) = v4;
  *(_QWORD *)(v0 + 72) = v3;
  if (qword_25697FF48 != -1)
    swift_once();
  v5 = OUTLINED_FUNCTION_39();
  *(_QWORD *)(v0 + 80) = __swift_project_value_buffer(v5, (uint64_t)qword_2569815D0);
  swift_bridgeObjectRetain_n();
  v6 = sub_23A4AA6D8();
  v7 = sub_23A4AA8C4();
  if (os_log_type_enabled(v6, v7))
  {
    v8 = (uint8_t *)OUTLINED_FUNCTION_3_0();
    v20 = OUTLINED_FUNCTION_3_0();
    *(_DWORD *)v8 = 136315138;
    v9 = OUTLINED_FUNCTION_87();
    *(_QWORD *)(v0 + 24) = OUTLINED_FUNCTION_77(v9, v10, &v20);
    sub_23A4AA900();
    OUTLINED_FUNCTION_86();
    OUTLINED_FUNCTION_12(&dword_23A470000, v6, v7, "Evaluating %s eligibility...", v8);
    swift_arrayDestroy();
    OUTLINED_FUNCTION_0_0();
  }
  swift_bridgeObjectRelease_n();

  v11 = sub_23A4AA174();
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_97();
  if (v12)
  {
    OUTLINED_FUNCTION_81();
    v13 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 88) = v13;
    *v13 = v0;
    v13[1] = sub_23A474F38;
    return sub_23A4AA720();
  }
  OUTLINED_FUNCTION_21();
  if (v14)
  {
    OUTLINED_FUNCTION_81();
    v15 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 104) = v15;
    OUTLINED_FUNCTION_36(v15, (uint64_t)sub_23A4750A8);
    return sub_23A4AA720();
  }
  OUTLINED_FUNCTION_18();
  sub_23A4AA6D8();
  v17 = OUTLINED_FUNCTION_44();
  if (OUTLINED_FUNCTION_67(v11))
  {
    OUTLINED_FUNCTION_3_0();
    v20 = OUTLINED_FUNCTION_3_0();
    v18 = OUTLINED_FUNCTION_8(4.8149e-34);
    *(_QWORD *)(v0 + 16) = OUTLINED_FUNCTION_32(v18, v19, &v20);
    sub_23A4AA900();
    OUTLINED_FUNCTION_29();
    OUTLINED_FUNCTION_10(&dword_23A470000, v11, v17, "Error fetching or evaluating tip document: %s");
    OUTLINED_FUNCTION_15();
    OUTLINED_FUNCTION_0_0();
  }
  OUTLINED_FUNCTION_28();

  return (*(uint64_t (**)(_QWORD))(v0 + 8))(0);
}

uint64_t sub_23A474F38()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;

  OUTLINED_FUNCTION_23();
  OUTLINED_FUNCTION_20();
  *(_QWORD *)(v2 + 96) = v1;
  OUTLINED_FUNCTION_42();
  if (v0)

  OUTLINED_FUNCTION_24();
  return OUTLINED_FUNCTION_1_0();
}

uint64_t sub_23A474F8C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20)
{
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  _QWORD *v26;
  os_log_type_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;

  OUTLINED_FUNCTION_54();
  a19 = v22;
  a20 = v23;
  a18 = v21;
  v24 = *(void **)(v21 + 96);
  if (v24)
  {
    objc_opt_self();
    if (OUTLINED_FUNCTION_33())
    {
      OUTLINED_FUNCTION_57();
      return OUTLINED_FUNCTION_5_0(v20, *(uint64_t (**)(void))(v21 + 8));
    }

  }
  OUTLINED_FUNCTION_21();
  if (v25)
  {
    OUTLINED_FUNCTION_81();
    v26 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v21 + 104) = v26;
    OUTLINED_FUNCTION_36(v26, (uint64_t)sub_23A4750A8);
    return OUTLINED_FUNCTION_16();
  }
  OUTLINED_FUNCTION_18();
  sub_23A4AA6D8();
  v28 = OUTLINED_FUNCTION_44();
  if (OUTLINED_FUNCTION_17(v28))
  {
    OUTLINED_FUNCTION_3_0();
    a9 = OUTLINED_FUNCTION_3_0();
    v29 = OUTLINED_FUNCTION_8(4.8149e-34);
    v31 = OUTLINED_FUNCTION_32(v29, v30, &a9);
    OUTLINED_FUNCTION_11(v31);
    OUTLINED_FUNCTION_29();
    OUTLINED_FUNCTION_9(&dword_23A470000, v32, v33, "Error fetching or evaluating tip document: %s");
    OUTLINED_FUNCTION_15();
    OUTLINED_FUNCTION_0_0();
  }
  OUTLINED_FUNCTION_28();

  v20 = 0;
  return OUTLINED_FUNCTION_5_0(v20, *(uint64_t (**)(void))(v21 + 8));
}

uint64_t sub_23A4750A8()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;

  OUTLINED_FUNCTION_23();
  OUTLINED_FUNCTION_20();
  *(_QWORD *)(v2 + 112) = v1;
  OUTLINED_FUNCTION_42();
  if (v0)

  OUTLINED_FUNCTION_24();
  return OUTLINED_FUNCTION_1_0();
}

uint64_t sub_23A4750FC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20)
{
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  os_log_type_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;

  OUTLINED_FUNCTION_54();
  a19 = v22;
  a20 = v23;
  a18 = v21;
  v24 = *(void **)(v21 + 112);
  if (v24)
  {
    objc_opt_self();
    if (OUTLINED_FUNCTION_33())
    {
      OUTLINED_FUNCTION_57();
      return OUTLINED_FUNCTION_5_0(v20, *(uint64_t (**)(void))(v21 + 8));
    }

  }
  OUTLINED_FUNCTION_18();
  sub_23A4AA6D8();
  v25 = OUTLINED_FUNCTION_44();
  if (OUTLINED_FUNCTION_17(v25))
  {
    OUTLINED_FUNCTION_3_0();
    a9 = OUTLINED_FUNCTION_3_0();
    v26 = OUTLINED_FUNCTION_8(4.8149e-34);
    v28 = OUTLINED_FUNCTION_32(v26, v27, &a9);
    OUTLINED_FUNCTION_11(v28);
    OUTLINED_FUNCTION_29();
    OUTLINED_FUNCTION_9(&dword_23A470000, v29, v30, "Error fetching or evaluating tip document: %s");
    OUTLINED_FUNCTION_15();
    OUTLINED_FUNCTION_0_0();
  }
  OUTLINED_FUNCTION_28();

  v20 = 0;
  return OUTLINED_FUNCTION_5_0(v20, *(uint64_t (**)(void))(v21 + 8));
}

uint64_t sub_23A4751E4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20)
{
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  _QWORD *v25;
  os_log_type_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;

  OUTLINED_FUNCTION_54();
  a19 = v22;
  a20 = v23;
  a18 = v21;
  OUTLINED_FUNCTION_21();
  if (v24)
  {
    OUTLINED_FUNCTION_81();
    v25 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v21 + 104) = v25;
    OUTLINED_FUNCTION_36(v25, (uint64_t)sub_23A4750A8);
    return OUTLINED_FUNCTION_16();
  }
  else
  {
    OUTLINED_FUNCTION_18();
    sub_23A4AA6D8();
    v27 = OUTLINED_FUNCTION_44();
    if (OUTLINED_FUNCTION_17(v27))
    {
      OUTLINED_FUNCTION_3_0();
      a9 = OUTLINED_FUNCTION_3_0();
      v28 = OUTLINED_FUNCTION_8(4.8149e-34);
      v30 = OUTLINED_FUNCTION_32(v28, v29, &a9);
      OUTLINED_FUNCTION_11(v30);
      OUTLINED_FUNCTION_29();
      OUTLINED_FUNCTION_9(&dword_23A470000, v31, v32, "Error fetching or evaluating tip document: %s");
      OUTLINED_FUNCTION_15();
      OUTLINED_FUNCTION_0_0();
    }

    swift_bridgeObjectRelease_n();
    return OUTLINED_FUNCTION_5_0(0, *(uint64_t (**)(void))(v21 + 8));
  }
}

uint64_t sub_23A4752E4()
{
  void *v0;
  uint64_t v1;
  os_log_type_t v2;
  _DWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v9;

  OUTLINED_FUNCTION_18();
  sub_23A4AA6D8();
  v2 = OUTLINED_FUNCTION_44();
  if (OUTLINED_FUNCTION_17(v2))
  {
    v3 = (_DWORD *)OUTLINED_FUNCTION_3_0();
    v9 = OUTLINED_FUNCTION_3_0();
    *v3 = 136315138;
    v4 = OUTLINED_FUNCTION_87();
    *(_QWORD *)(v1 + 16) = OUTLINED_FUNCTION_77(v4, v5, &v9);
    sub_23A4AA900();
    OUTLINED_FUNCTION_86();
    OUTLINED_FUNCTION_9(&dword_23A470000, v6, v7, "Error fetching or evaluating tip document: %s");
    swift_arrayDestroy();
    OUTLINED_FUNCTION_0_0();
  }
  OUTLINED_FUNCTION_28();

  return (*(uint64_t (**)(_QWORD))(v1 + 8))(0);
}

uint64_t sub_23A4753F0(uint64_t a1)
{
  int64_t v1;
  uint64_t v2;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v11;

  v1 = *(_QWORD *)(a1 + 16);
  v2 = MEMORY[0x24BEE4AF8];
  if (v1)
  {
    v11 = MEMORY[0x24BEE4AF8];
    sub_23A4A88C8(0, v1, 0);
    v2 = v11;
    v4 = (uint64_t *)(a1 + 56);
    do
    {
      v6 = *(v4 - 1);
      v5 = *v4;
      v8 = *(_QWORD *)(v11 + 16);
      v7 = *(_QWORD *)(v11 + 24);
      swift_bridgeObjectRetain();
      if (v8 >= v7 >> 1)
        sub_23A4A88C8((char *)(v7 > 1), v8 + 1, 1);
      *(_QWORD *)(v11 + 16) = v8 + 1;
      v9 = v11 + 16 * v8;
      *(_QWORD *)(v9 + 32) = v6;
      *(_QWORD *)(v9 + 40) = v5;
      v4 += 5;
      --v1;
    }
    while (v1);
  }
  return v2;
}

uint64_t sub_23A4754C4()
{
  uint64_t v0;

  swift_release();
  swift_release();
  swift_release();
  return v0;
}

uint64_t sub_23A4754F0()
{
  sub_23A4754C4();
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for SnippetModelProvider()
{
  return objc_opt_self();
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(_BYTE *)(*(_QWORD *)(a1 - 8) + 82) & 2) != 0)
    return *(_QWORD *)a2;
  return a2;
}

uint64_t __swift_storeEnumTagSinglePayload(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a4 - 8) + 56))();
}

unint64_t sub_23A475554()
{
  unint64_t result;
  uint64_t v1;

  result = qword_256980088;
  if (!qword_256980088)
  {
    v1 = sub_23A4AA06C();
    result = MEMORY[0x23B84E2B0](MEMORY[0x24BE6FD90], v1);
    atomic_store(result, (unint64_t *)&qword_256980088);
  }
  return result;
}

void sub_23A475594(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  OUTLINED_FUNCTION_60();
}

uint64_t sub_23A4755CC(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata accessor for SupplementarySnippetModel();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_23A475608(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for SupplementarySnippetModel();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

void sub_23A47564C(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v3;

  v3 = OUTLINED_FUNCTION_51(a1, a2, a3);
  OUTLINED_FUNCTION_100(*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 16));
  OUTLINED_FUNCTION_60();
}

void sub_23A475678(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v3;

  v3 = OUTLINED_FUNCTION_51(a1, a2, a3);
  OUTLINED_FUNCTION_100(*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 32));
  OUTLINED_FUNCTION_60();
}

void OUTLINED_FUNCTION_0_0()
{
  JUMPOUT(0x23B84E358);
}

uint64_t OUTLINED_FUNCTION_1_0()
{
  return swift_task_switch();
}

uint64_t OUTLINED_FUNCTION_2_0()
{
  return swift_task_dealloc();
}

uint64_t OUTLINED_FUNCTION_3_0()
{
  return swift_slowAlloc();
}

uint64_t OUTLINED_FUNCTION_4_0(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t OUTLINED_FUNCTION_5_0(uint64_t a1, uint64_t (*a2)(void))
{
  return a2();
}

uint64_t OUTLINED_FUNCTION_6_0()
{
  return swift_task_alloc();
}

uint64_t OUTLINED_FUNCTION_7_0(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t (*v6)(uint64_t, uint64_t, uint64_t);

  *(_QWORD *)(v4 + 592) = a1;
  v6 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v5 + 16);
  *(_QWORD *)(v4 + 600) = v6;
  return v6(v2, v3, v1);
}

uint64_t OUTLINED_FUNCTION_8(float a1)
{
  float *v1;

  *v1 = a1;
  return swift_bridgeObjectRetain();
}

void OUTLINED_FUNCTION_9(void *a1, uint64_t a2, uint64_t a3, const char *a4)
{
  uint8_t *v4;
  NSObject *v5;
  os_log_type_t v6;

  _os_log_impl(a1, v5, v6, a4, v4, 0xCu);
}

void OUTLINED_FUNCTION_10(void *a1, NSObject *a2, os_log_type_t a3, const char *a4)
{
  uint8_t *v4;

  _os_log_impl(a1, a2, a3, a4, v4, 0xCu);
}

uint64_t OUTLINED_FUNCTION_11(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(v1 + 16) = a1;
  return sub_23A4AA900();
}

void OUTLINED_FUNCTION_12(void *a1, NSObject *a2, os_log_type_t a3, const char *a4, uint8_t *a5)
{
  _os_log_impl(a1, a2, a3, a4, a5, 0xCu);
}

uint64_t OUTLINED_FUNCTION_13()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 8))(v0, v1);
}

uint64_t OUTLINED_FUNCTION_14(uint64_t a1)
{
  return sub_23A4A1120(a1);
}

uint64_t OUTLINED_FUNCTION_15()
{
  return swift_arrayDestroy();
}

uint64_t OUTLINED_FUNCTION_16()
{
  return sub_23A4AA720();
}

BOOL OUTLINED_FUNCTION_17(os_log_type_t a1)
{
  NSObject *v1;

  return os_log_type_enabled(v1, a1);
}

uint64_t OUTLINED_FUNCTION_18()
{
  return swift_bridgeObjectRetain();
}

uint64_t OUTLINED_FUNCTION_19()
{
  return sub_23A4AA6F0();
}

void OUTLINED_FUNCTION_20()
{
  _QWORD *v0;
  uint64_t v1;

  *(_QWORD *)(v1 - 8) = *v0;
}

uint64_t OUTLINED_FUNCTION_22()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + 272);
}

void OUTLINED_FUNCTION_23()
{
  _QWORD *v0;
  uint64_t v1;

  *(_QWORD *)(v1 - 8) = *v0;
}

uint64_t OUTLINED_FUNCTION_25(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  return __swift_storeEnumTagSinglePayload(a1, a2, 1, v2);
}

uint64_t OUTLINED_FUNCTION_26(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(v1 + 608) = a1;
  return swift_allocObject();
}

uint64_t OUTLINED_FUNCTION_27()
{
  return type metadata accessor for TipsApp();
}

uint64_t OUTLINED_FUNCTION_28()
{
  return swift_bridgeObjectRelease_n();
}

uint64_t OUTLINED_FUNCTION_29()
{
  return swift_bridgeObjectRelease_n();
}

uint64_t OUTLINED_FUNCTION_30()
{
  return swift_bridgeObjectRetain();
}

uint64_t OUTLINED_FUNCTION_31@<X0>(uint64_t (*a1)(uint64_t, uint64_t)@<X8>)
{
  uint64_t v1;
  uint64_t v2;

  return a1(v1, v2);
}

uint64_t OUTLINED_FUNCTION_32(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v3;
  unint64_t v4;

  return sub_23A49D6D8(v3, v4, a3);
}

uint64_t OUTLINED_FUNCTION_33()
{
  return swift_dynamicCastObjCClass();
}

uint64_t OUTLINED_FUNCTION_34()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_35()
{
  return swift_task_alloc();
}

uint64_t OUTLINED_FUNCTION_36@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;

  *a1 = v2;
  a1[1] = a2;
  return *(_QWORD *)(v2 + 72);
}

float *OUTLINED_FUNCTION_38(float *result, float a2)
{
  *result = a2;
  return result;
}

uint64_t OUTLINED_FUNCTION_39()
{
  return sub_23A4AA6F0();
}

uint64_t OUTLINED_FUNCTION_40()
{
  return swift_retain();
}

uint64_t OUTLINED_FUNCTION_41(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  return __swift_storeEnumTagSinglePayload(a1, a2, 1, v2);
}

uint64_t OUTLINED_FUNCTION_42()
{
  return swift_task_dealloc();
}

uint64_t OUTLINED_FUNCTION_43()
{
  uint64_t v0;
  uint64_t v1;

  return __swift_storeEnumTagSinglePayload(v1, 0, 1, v0);
}

uint64_t OUTLINED_FUNCTION_44()
{
  return sub_23A4AA8D0();
}

uint64_t OUTLINED_FUNCTION_45()
{
  _QWORD *v0;
  uint64_t v1;

  *(_QWORD *)(v1 - 8) = *v0;
  return swift_task_dealloc();
}

uint64_t OUTLINED_FUNCTION_46(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21)
{
  return __swift_storeEnumTagSinglePayload(a1, 0, 1, a21);
}

void OUTLINED_FUNCTION_47()
{
  _QWORD *v0;
  uint64_t v1;

  *(_QWORD *)(v1 - 8) = *v0;
}

uint64_t OUTLINED_FUNCTION_48()
{
  return sub_23A4AA900();
}

uint64_t OUTLINED_FUNCTION_49()
{
  uint64_t v0;
  uint64_t v1;

  __swift_storeEnumTagSinglePayload(v0, 0, 1, v1);
  return v0;
}

uint64_t OUTLINED_FUNCTION_50()
{
  return sub_23A4AA060();
}

uint64_t OUTLINED_FUNCTION_51(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  return __swift_instantiateConcreteTypeFromMangledName(a3);
}

uint64_t OUTLINED_FUNCTION_52()
{
  return swift_bridgeObjectRelease();
}

BOOL OUTLINED_FUNCTION_53(os_log_type_t a1)
{
  NSObject *v1;

  return os_log_type_enabled(v1, a1);
}

uint64_t OUTLINED_FUNCTION_56()
{
  return sub_23A4AA8C4();
}

uint64_t OUTLINED_FUNCTION_57()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_58()
{
  return sub_23A4AA6D8();
}

void OUTLINED_FUNCTION_59(uint64_t a1)
{
  uint64_t *v1;
  uint64_t v2;

  sub_23A475678(a1, v2, v1);
}

uint64_t OUTLINED_FUNCTION_61()
{
  return swift_task_dealloc();
}

uint64_t OUTLINED_FUNCTION_62()
{
  return swift_task_dealloc();
}

uint64_t OUTLINED_FUNCTION_63()
{
  return swift_task_dealloc();
}

uint64_t OUTLINED_FUNCTION_64()
{
  return swift_task_dealloc();
}

uint64_t OUTLINED_FUNCTION_65()
{
  return swift_task_dealloc();
}

uint64_t OUTLINED_FUNCTION_66()
{
  return swift_task_dealloc();
}

BOOL OUTLINED_FUNCTION_67(NSObject *a1)
{
  os_log_type_t v1;

  return os_log_type_enabled(a1, v1);
}

uint64_t OUTLINED_FUNCTION_68()
{
  return swift_task_dealloc();
}

uint64_t OUTLINED_FUNCTION_69()
{
  return swift_task_dealloc();
}

uint64_t OUTLINED_FUNCTION_70()
{
  return swift_task_dealloc();
}

uint64_t OUTLINED_FUNCTION_71()
{
  return swift_task_dealloc();
}

uint64_t OUTLINED_FUNCTION_72()
{
  return swift_task_dealloc();
}

uint64_t OUTLINED_FUNCTION_73()
{
  return swift_task_dealloc();
}

uint64_t OUTLINED_FUNCTION_74()
{
  return swift_task_dealloc();
}

uint64_t OUTLINED_FUNCTION_75()
{
  return sub_23A4AA834();
}

uint64_t OUTLINED_FUNCTION_76()
{
  return swift_task_dealloc();
}

uint64_t OUTLINED_FUNCTION_77(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v3;
  unint64_t v4;

  return sub_23A49D6D8(v3, v4, a3);
}

uint64_t OUTLINED_FUNCTION_78()
{
  return swift_task_dealloc();
}

uint64_t OUTLINED_FUNCTION_79()
{
  return swift_task_dealloc();
}

uint64_t OUTLINED_FUNCTION_80()
{
  return swift_bridgeObjectRetain();
}

uint64_t OUTLINED_FUNCTION_82()
{
  return swift_task_dealloc();
}

uint64_t OUTLINED_FUNCTION_83()
{
  return swift_task_dealloc();
}

void OUTLINED_FUNCTION_84()
{
  uint64_t *v0;
  uint64_t v1;

  sub_23A475594(v1, v0);
}

uint64_t OUTLINED_FUNCTION_85()
{
  return swift_task_dealloc();
}

uint64_t OUTLINED_FUNCTION_86()
{
  return swift_bridgeObjectRelease_n();
}

uint64_t OUTLINED_FUNCTION_87()
{
  return swift_bridgeObjectRetain();
}

uint64_t OUTLINED_FUNCTION_88()
{
  return sub_23A4AA084();
}

uint64_t OUTLINED_FUNCTION_89()
{
  return sub_23A4AA084();
}

uint64_t OUTLINED_FUNCTION_90()
{
  return swift_bridgeObjectRetain();
}

uint64_t OUTLINED_FUNCTION_91()
{
  return type metadata accessor for SnippetResponseComponents();
}

uint64_t OUTLINED_FUNCTION_92()
{
  return type metadata accessor for TellMeGeneratedSnippetModels();
}

uint64_t OUTLINED_FUNCTION_93()
{
  return swift_task_dealloc();
}

void OUTLINED_FUNCTION_94()
{
  uint64_t v0;
  uint64_t *v1;

  sub_23A475594(v0, v1);
}

uint64_t OUTLINED_FUNCTION_95()
{
  uint64_t v0;

  return v0;
}

uint64_t OUTLINED_FUNCTION_96()
{
  return swift_arrayDestroy();
}

uint64_t OUTLINED_FUNCTION_98(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_storeEnumTagSinglePayload(a1, 1, 1, a4);
}

uint64_t OUTLINED_FUNCTION_99()
{
  return swift_task_dealloc();
}

uint64_t OUTLINED_FUNCTION_100@<X0>(uint64_t (*a1)(uint64_t, uint64_t)@<X8>)
{
  uint64_t v1;
  uint64_t v2;

  return a1(v1, v2);
}

uint64_t OUTLINED_FUNCTION_101(uint64_t a1)
{
  return sub_23A4A0E80(a1);
}

uint64_t OUTLINED_FUNCTION_102()
{
  uint64_t v0;

  return v0;
}

uint64_t *sub_23A475C5C(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  char *v12;
  char *v13;
  uint64_t v15;
  char *v16;

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
    v7 = type metadata accessor for TellMeGeneratedSnippetModels();
    if (!__swift_getEnumTagSinglePayload((uint64_t)a2, 1, v7))
    {
      v10 = (char *)&loc_23A475D20 + 4 * byte_23A4AB1F0[swift_getEnumCaseMultiPayload()];
      __asm { BR              X10 }
    }
    v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_256980070);
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v8 - 8) + 64));
    v11 = *(int *)(a3 + 20);
    v12 = (char *)a1 + v11;
    v13 = (char *)a2 + v11;
    if (!__swift_getEnumTagSinglePayload((uint64_t)a2 + v11, 1, v7))
    {
      v16 = (char *)&loc_23A47615C + 4 * byte_23A4AB1F6[swift_getEnumCaseMultiPayload()];
      __asm { BR              X10 }
    }
    v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_256980070);
    memcpy(v12, v13, *(_QWORD *)(*(_QWORD *)(v15 - 8) + 64));
  }
  return a1;
}

uint64_t sub_23A476548(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(uint64_t, uint64_t);
  int *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(uint64_t, uint64_t);
  int *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  int *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void (*v28)(uint64_t, uint64_t);
  int *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t result;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  void (*v45)(uint64_t, uint64_t);
  int *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  void (*v52)(uint64_t, uint64_t);
  int *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  int *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  void (*v63)(uint64_t, uint64_t);
  int *v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;

  v4 = type metadata accessor for TellMeGeneratedSnippetModels();
  if (!__swift_getEnumTagSinglePayload(a1, 1, v4))
  {
    switch(swift_getEnumCaseMultiPayload())
    {
      case 0u:
        v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569800A0);
        (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(a1, v5);
        v6 = type metadata accessor for AttributionListSnippetModel();
        goto LABEL_5;
      case 1u:
        v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569800B0);
        (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 8))(a1, v7);
        v6 = type metadata accessor for LearnMoreSnippetModel();
LABEL_5:
        v8 = *(int *)(v6 + 20);
        goto LABEL_10;
      case 2u:
        v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569800B0);
        v10 = *(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 8);
        v10(a1, v9);
        v11 = (int *)type metadata accessor for ListStyleAnswerSnippetModel();
        v10(a1 + v11[5], v9);
        v12 = a1 + v11[6];
        v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569800B8);
        (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v13 - 8) + 8))(v12, v13);
        v10(a1 + v11[7], v9);
        v10(a1 + v11[8], v9);
        v14 = a1 + v11[9];
        v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569800C0);
        (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v15 - 8) + 8))(v14, v15);
        v8 = v11[10];
        goto LABEL_10;
      case 3u:
        v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569800B0);
        v17 = *(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v16 - 8) + 8);
        v17(a1, v16);
        v18 = (int *)type metadata accessor for SummarizedAnswerSnippetModel();
        v17(a1 + v18[5], v16);
        v17(a1 + v18[6], v16);
        v19 = a1 + v18[7];
        v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569800C0);
        (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v20 - 8) + 8))(v19, v20);
        v8 = v18[8];
        goto LABEL_10;
      case 4u:
        v21 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569800C8);
        (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v21 - 8) + 8))(a1, v21);
        v22 = (int *)type metadata accessor for SupplementarySnippetModel();
        v23 = a1 + v22[5];
        v24 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569800C0);
        (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v24 - 8) + 8))(v23, v24);
        v25 = a1 + v22[6];
        v26 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569800D0);
        (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v26 - 8) + 8))(v25, v26);
        v8 = v22[7];
        goto LABEL_10;
      case 5u:
        v27 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569800D8);
        v28 = *(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v27 - 8) + 8);
        v28(a1, v27);
        v29 = (int *)type metadata accessor for TipSnippetModel(0);
        v30 = a1 + v29[5];
        v31 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569800E0);
        (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v31 - 8) + 8))(v30, v31);
        v32 = a1 + v29[6];
        v33 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569800E8);
        (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v33 - 8) + 8))(v32, v33);
        v28(a1 + v29[7], v27);
        v34 = a1 + v29[8];
        v35 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569800F0);
        (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v35 - 8) + 8))(v34, v35);
        v8 = v29[9];
LABEL_10:
        v36 = a1 + v8;
        v37 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569800A8);
        (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v37 - 8) + 8))(v36, v37);
        break;
      default:
        break;
    }
  }
  v38 = a1 + *(int *)(a2 + 20);
  result = __swift_getEnumTagSinglePayload(v38, 1, v4);
  if (!(_DWORD)result)
  {
    result = swift_getEnumCaseMultiPayload();
    switch((int)result)
    {
      case 0:
        v40 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569800A0);
        (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v40 - 8) + 8))(v38, v40);
        v41 = type metadata accessor for AttributionListSnippetModel();
        goto LABEL_15;
      case 1:
        v42 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569800B0);
        (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v42 - 8) + 8))(v38, v42);
        v41 = type metadata accessor for LearnMoreSnippetModel();
LABEL_15:
        v43 = *(int *)(v41 + 20);
        goto LABEL_20;
      case 2:
        v44 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569800B0);
        v45 = *(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v44 - 8) + 8);
        v45(v38, v44);
        v46 = (int *)type metadata accessor for ListStyleAnswerSnippetModel();
        v45(v38 + v46[5], v44);
        v47 = v38 + v46[6];
        v48 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569800B8);
        (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v48 - 8) + 8))(v47, v48);
        v45(v38 + v46[7], v44);
        v45(v38 + v46[8], v44);
        v49 = v38 + v46[9];
        v50 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569800C0);
        (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v50 - 8) + 8))(v49, v50);
        v43 = v46[10];
        goto LABEL_20;
      case 3:
        v51 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569800B0);
        v52 = *(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v51 - 8) + 8);
        v52(v38, v51);
        v53 = (int *)type metadata accessor for SummarizedAnswerSnippetModel();
        v52(v38 + v53[5], v51);
        v52(v38 + v53[6], v51);
        v54 = v38 + v53[7];
        v55 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569800C0);
        (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v55 - 8) + 8))(v54, v55);
        v43 = v53[8];
        goto LABEL_20;
      case 4:
        v56 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569800C8);
        (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v56 - 8) + 8))(v38, v56);
        v57 = (int *)type metadata accessor for SupplementarySnippetModel();
        v58 = v38 + v57[5];
        v59 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569800C0);
        (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v59 - 8) + 8))(v58, v59);
        v60 = v38 + v57[6];
        v61 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569800D0);
        (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v61 - 8) + 8))(v60, v61);
        v43 = v57[7];
        goto LABEL_20;
      case 5:
        v62 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569800D8);
        v63 = *(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v62 - 8) + 8);
        v63(v38, v62);
        v64 = (int *)type metadata accessor for TipSnippetModel(0);
        v65 = v38 + v64[5];
        v66 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569800E0);
        (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v66 - 8) + 8))(v65, v66);
        v67 = v38 + v64[6];
        v68 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569800E8);
        (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v68 - 8) + 8))(v67, v68);
        v63(v38 + v64[7], v62);
        v69 = v38 + v64[8];
        v70 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569800F0);
        (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v70 - 8) + 8))(v69, v70);
        v43 = v64[9];
LABEL_20:
        v71 = v38 + v43;
        v72 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569800A8);
        result = (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v72 - 8) + 8))(v71, v72);
        break;
      default:
        return result;
    }
  }
  return result;
}

char *sub_23A476C20(char *a1, char *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  char *v10;
  char *v11;
  uint64_t v13;
  char *v14;

  v6 = type metadata accessor for TellMeGeneratedSnippetModels();
  if (!__swift_getEnumTagSinglePayload((uint64_t)a2, 1, v6))
  {
    v8 = (char *)&loc_23A476CB8 + 4 * byte_23A4AB208[swift_getEnumCaseMultiPayload()];
    __asm { BR              X10 }
  }
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_256980070);
  memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v7 - 8) + 64));
  v9 = *(int *)(a3 + 20);
  v10 = &a1[v9];
  v11 = &a2[v9];
  if (!__swift_getEnumTagSinglePayload((uint64_t)&a2[v9], 1, v6))
  {
    v14 = (char *)&loc_23A4770F4 + 4 * byte_23A4AB20E[swift_getEnumCaseMultiPayload()];
    __asm { BR              X10 }
  }
  v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_256980070);
  memcpy(v10, v11, *(_QWORD *)(*(_QWORD *)(v13 - 8) + 64));
  return a1;
}

char *sub_23A4774E0(char *a1, char *a2, uint64_t a3)
{
  uint64_t v6;
  int EnumTagSinglePayload;
  int v8;
  char *v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  char *v13;
  char *v14;
  int v15;
  int v16;
  char *v17;
  uint64_t v18;
  char *v19;

  v6 = type metadata accessor for TellMeGeneratedSnippetModels();
  EnumTagSinglePayload = __swift_getEnumTagSinglePayload((uint64_t)a1, 1, v6);
  v8 = __swift_getEnumTagSinglePayload((uint64_t)a2, 1, v6);
  if (EnumTagSinglePayload)
  {
    if (!v8)
    {
      v9 = (char *)&loc_23A47756C + 4 * byte_23A4AB214[swift_getEnumCaseMultiPayload()];
      __asm { BR              X10 }
    }
    goto LABEL_6;
  }
  if (v8)
  {
    sub_23A47AA0C((uint64_t)a1, (uint64_t (*)(_QWORD))type metadata accessor for TellMeGeneratedSnippetModels);
LABEL_6:
    v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_256980070);
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v10 - 8) + 64));
    goto LABEL_9;
  }
  if (a1 != a2)
  {
    sub_23A47AA0C((uint64_t)a1, (uint64_t (*)(_QWORD))type metadata accessor for TellMeGeneratedSnippetModels);
    v11 = (char *)&loc_23A477614 + 4 * word_23A4AB21A[swift_getEnumCaseMultiPayload()];
    __asm { BR              X10 }
  }
LABEL_9:
  v12 = *(int *)(a3 + 20);
  v13 = &a1[v12];
  v14 = &a2[v12];
  v15 = __swift_getEnumTagSinglePayload((uint64_t)&a1[v12], 1, v6);
  v16 = __swift_getEnumTagSinglePayload((uint64_t)v14, 1, v6);
  if (v15)
  {
    if (!v16)
    {
      v17 = (char *)&loc_23A477EC0 + 4 * byte_23A4AB226[swift_getEnumCaseMultiPayload()];
      __asm { BR              X10 }
    }
    goto LABEL_14;
  }
  if (v16)
  {
    sub_23A47AA0C((uint64_t)v13, (uint64_t (*)(_QWORD))type metadata accessor for TellMeGeneratedSnippetModels);
LABEL_14:
    v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_256980070);
    memcpy(v13, v14, *(_QWORD *)(*(_QWORD *)(v18 - 8) + 64));
    return a1;
  }
  if (a1 != a2)
  {
    sub_23A47AA0C((uint64_t)v13, (uint64_t (*)(_QWORD))type metadata accessor for TellMeGeneratedSnippetModels);
    v19 = (char *)&loc_23A477F68 + 4 * word_23A4AB22C[swift_getEnumCaseMultiPayload()];
    __asm { BR              X10 }
  }
  return a1;
}

char *sub_23A4787D0(char *a1, char *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  char *v10;
  char *v11;
  uint64_t v13;
  char *v14;

  v6 = type metadata accessor for TellMeGeneratedSnippetModels();
  if (!__swift_getEnumTagSinglePayload((uint64_t)a2, 1, v6))
  {
    v8 = (char *)&loc_23A478868 + 4 * byte_23A4AB238[swift_getEnumCaseMultiPayload()];
    __asm { BR              X10 }
  }
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_256980070);
  memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v7 - 8) + 64));
  v9 = *(int *)(a3 + 20);
  v10 = &a1[v9];
  v11 = &a2[v9];
  if (!__swift_getEnumTagSinglePayload((uint64_t)&a2[v9], 1, v6))
  {
    v14 = (char *)&loc_23A478CA4 + 4 * byte_23A4AB23E[swift_getEnumCaseMultiPayload()];
    __asm { BR              X10 }
  }
  v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_256980070);
  memcpy(v10, v11, *(_QWORD *)(*(_QWORD *)(v13 - 8) + 64));
  return a1;
}

char *sub_23A479090(char *a1, char *a2, uint64_t a3)
{
  uint64_t v6;
  int EnumTagSinglePayload;
  int v8;
  char *v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  char *v13;
  char *v14;
  int v15;
  int v16;
  char *v17;
  uint64_t v18;
  char *v19;

  v6 = type metadata accessor for TellMeGeneratedSnippetModels();
  EnumTagSinglePayload = __swift_getEnumTagSinglePayload((uint64_t)a1, 1, v6);
  v8 = __swift_getEnumTagSinglePayload((uint64_t)a2, 1, v6);
  if (EnumTagSinglePayload)
  {
    if (!v8)
    {
      v9 = (char *)&loc_23A47911C + 4 * byte_23A4AB244[swift_getEnumCaseMultiPayload()];
      __asm { BR              X10 }
    }
    goto LABEL_6;
  }
  if (v8)
  {
    sub_23A47AA0C((uint64_t)a1, (uint64_t (*)(_QWORD))type metadata accessor for TellMeGeneratedSnippetModels);
LABEL_6:
    v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_256980070);
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v10 - 8) + 64));
    goto LABEL_9;
  }
  if (a1 != a2)
  {
    sub_23A47AA0C((uint64_t)a1, (uint64_t (*)(_QWORD))type metadata accessor for TellMeGeneratedSnippetModels);
    v11 = (char *)&loc_23A4791C4 + 4 * word_23A4AB24A[swift_getEnumCaseMultiPayload()];
    __asm { BR              X10 }
  }
LABEL_9:
  v12 = *(int *)(a3 + 20);
  v13 = &a1[v12];
  v14 = &a2[v12];
  v15 = __swift_getEnumTagSinglePayload((uint64_t)&a1[v12], 1, v6);
  v16 = __swift_getEnumTagSinglePayload((uint64_t)v14, 1, v6);
  if (v15)
  {
    if (!v16)
    {
      v17 = (char *)&loc_23A479A70 + 4 * byte_23A4AB256[swift_getEnumCaseMultiPayload()];
      __asm { BR              X10 }
    }
    goto LABEL_14;
  }
  if (v16)
  {
    sub_23A47AA0C((uint64_t)v13, (uint64_t (*)(_QWORD))type metadata accessor for TellMeGeneratedSnippetModels);
LABEL_14:
    v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_256980070);
    memcpy(v13, v14, *(_QWORD *)(*(_QWORD *)(v18 - 8) + 64));
    return a1;
  }
  if (a1 != a2)
  {
    sub_23A47AA0C((uint64_t)v13, (uint64_t (*)(_QWORD))type metadata accessor for TellMeGeneratedSnippetModels);
    v19 = (char *)&loc_23A479B18 + 4 * word_23A4AB25C[swift_getEnumCaseMultiPayload()];
    __asm { BR              X10 }
  }
  return a1;
}

uint64_t sub_23A47A380()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_23A47A38C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_256980070);
  return __swift_getEnumTagSinglePayload(a1, a2, v4);
}

uint64_t sub_23A47A3C4()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_23A47A3D0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_256980070);
  return __swift_storeEnumTagSinglePayload(a1, a2, a2, v4);
}

uint64_t type metadata accessor for SnippetResponseComponents()
{
  uint64_t result;

  result = qword_256980150;
  if (!qword_256980150)
    return swift_getSingletonMetadata();
  return result;
}

void sub_23A47A444()
{
  unint64_t v0;

  sub_23A47A4AC();
  if (v0 <= 0x3F)
    swift_initStructMetadata();
}

void sub_23A47A4AC()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_256980160)
  {
    type metadata accessor for TellMeGeneratedSnippetModels();
    v0 = sub_23A4AA8E8();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_256980160);
  }
}

uint64_t sub_23A47A500()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  char v14;
  char v15;
  uint64_t v16;
  char v17;
  uint64_t EnumTagSinglePayload;
  uint64_t v19;
  uint64_t v21;

  v1 = v0;
  v2 = type metadata accessor for SnippetResponseComponents();
  OUTLINED_FUNCTION_0_1();
  MEMORY[0x24BDAC7A8](v3);
  v5 = (char *)&v21 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_256980070);
  OUTLINED_FUNCTION_0_1();
  MEMORY[0x24BDAC7A8](v6);
  OUTLINED_FUNCTION_1_1();
  v9 = v7 - v8;
  MEMORY[0x24BDAC7A8](v10);
  v12 = (char *)&v21 - v11;
  sub_23A47A8FC(v1 + *(int *)(v2 + 20), (uint64_t)&v21 - v11);
  v13 = type metadata accessor for TellMeGeneratedSnippetModels();
  if (__swift_getEnumTagSinglePayload((uint64_t)v12, 1, v13) == 1)
  {
    sub_23A47A944((uint64_t)v12);
    OUTLINED_FUNCTION_3_1();
  }
  else
  {
    sub_23A48DF38();
    v15 = v14;
    sub_23A47AA0C((uint64_t)v12, (uint64_t (*)(_QWORD))type metadata accessor for TellMeGeneratedSnippetModels);
    v16 = OUTLINED_FUNCTION_3_1();
    if ((v15 & 1) != 0)
    {
      OUTLINED_FUNCTION_2_1(v16, (uint64_t (*)(_QWORD))type metadata accessor for SnippetResponseComponents);
      v17 = 1;
      return v17 & 1;
    }
  }
  sub_23A47A8FC((uint64_t)v5, v9);
  EnumTagSinglePayload = __swift_getEnumTagSinglePayload(v9, 1, v13);
  if ((_DWORD)EnumTagSinglePayload == 1)
  {
    OUTLINED_FUNCTION_2_1(EnumTagSinglePayload, (uint64_t (*)(_QWORD))type metadata accessor for SnippetResponseComponents);
    sub_23A47A944(v9);
    v17 = 0;
  }
  else
  {
    sub_23A48DF38();
    v17 = v19;
    OUTLINED_FUNCTION_2_1(v19, (uint64_t (*)(_QWORD))type metadata accessor for SnippetResponseComponents);
    sub_23A47AA0C(v9, (uint64_t (*)(_QWORD))type metadata accessor for TellMeGeneratedSnippetModels);
  }
  return v17 & 1;
}

uint64_t sub_23A47A688()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
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
  char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  char *v23;
  int EnumCaseMultiPayload;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  int v28;
  uint64_t v30;

  v1 = v0;
  v2 = type metadata accessor for ListStyleAnswerSnippetModel();
  OUTLINED_FUNCTION_0_1();
  MEMORY[0x24BDAC7A8](v3);
  v5 = (char *)&v30 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_256980070);
  OUTLINED_FUNCTION_0_1();
  MEMORY[0x24BDAC7A8](v6);
  OUTLINED_FUNCTION_1_1();
  v9 = v7 - v8;
  v11 = MEMORY[0x24BDAC7A8](v10);
  v13 = (char *)&v30 - v12;
  MEMORY[0x24BDAC7A8](v11);
  v15 = (char *)&v30 - v14;
  v16 = type metadata accessor for TellMeGeneratedSnippetModels();
  OUTLINED_FUNCTION_0_1();
  MEMORY[0x24BDAC7A8](v17);
  OUTLINED_FUNCTION_1_1();
  v20 = v18 - v19;
  MEMORY[0x24BDAC7A8](v21);
  v23 = (char *)&v30 - v22;
  sub_23A47A8FC(v1, (uint64_t)v15);
  if (__swift_getEnumTagSinglePayload((uint64_t)v15, 1, v16) == 1)
  {
    sub_23A47A944((uint64_t)v15);
    goto LABEL_5;
  }
  sub_23A47A984((uint64_t)v15, (uint64_t)v23, (uint64_t (*)(_QWORD))type metadata accessor for TellMeGeneratedSnippetModels);
  sub_23A47A984((uint64_t)v23, v20, (uint64_t (*)(_QWORD))type metadata accessor for TellMeGeneratedSnippetModels);
  EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  sub_23A47AA0C(v20, (uint64_t (*)(_QWORD))type metadata accessor for TellMeGeneratedSnippetModels);
  if (EnumCaseMultiPayload != 5)
  {
LABEL_5:
    v26 = type metadata accessor for SnippetResponseComponents();
    sub_23A47A8FC(v1 + *(int *)(v26 + 20), (uint64_t)v13);
    if (__swift_getEnumTagSinglePayload((uint64_t)v13, 1, v16) != 1)
    {
      sub_23A47A8FC((uint64_t)v13, v9);
      v27 = swift_getEnumCaseMultiPayload();
      switch((_DWORD)v27)
      {
        case 3:
          OUTLINED_FUNCTION_4_1(v27, (uint64_t (*)(_QWORD))type metadata accessor for TellMeGeneratedSnippetModels);
          v25 = 3;
          goto LABEL_16;
        case 2:
          sub_23A47A984(v9, (uint64_t)v5, (uint64_t (*)(_QWORD))type metadata accessor for ListStyleAnswerSnippetModel);
          v28 = v5[*(int *)(v2 + 44)];
          sub_23A47AA0C((uint64_t)v5, (uint64_t (*)(_QWORD))type metadata accessor for ListStyleAnswerSnippetModel);
          if (v28)
            v25 = 2;
          else
            v25 = 1;
          goto LABEL_16;
        case 1:
          OUTLINED_FUNCTION_4_1(v27, (uint64_t (*)(_QWORD))type metadata accessor for TellMeGeneratedSnippetModels);
          v25 = 4;
LABEL_16:
          sub_23A47A944((uint64_t)v13);
          return v25;
      }
      OUTLINED_FUNCTION_4_1(v27, (uint64_t (*)(_QWORD))type metadata accessor for TellMeGeneratedSnippetModels);
    }
    v25 = 0;
    goto LABEL_16;
  }
  return 5;
}

uint64_t sub_23A47A8FC(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_256980070);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_23A47A944(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_256980070);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_23A47A984(uint64_t a1, uint64_t a2, uint64_t (*a3)(_QWORD))
{
  uint64_t v5;

  v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_23A47A9C8(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for SnippetResponseComponents();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_23A47AA0C(uint64_t a1, uint64_t (*a2)(_QWORD))
{
  uint64_t v3;

  v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t OUTLINED_FUNCTION_2_1(uint64_t a1, uint64_t (*a2)(_QWORD))
{
  uint64_t v2;

  return sub_23A47AA0C(v2, a2);
}

uint64_t OUTLINED_FUNCTION_3_1()
{
  uint64_t v0;
  uint64_t v1;

  return sub_23A47A9C8(v1, v0);
}

uint64_t OUTLINED_FUNCTION_4_1(uint64_t a1, uint64_t (*a2)(_QWORD))
{
  uint64_t v2;

  return sub_23A47AA0C(v2, a2);
}

void TipCollectionModel.collectionIdentifier.getter()
{
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_11_0();
  OUTLINED_FUNCTION_60();
}

void TipCollectionModel.collectionIdentifier.setter()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;

  OUTLINED_FUNCTION_10_0();
  swift_bridgeObjectRelease();
  *v1 = v2;
  v1[1] = v0;
  OUTLINED_FUNCTION_5();
}

uint64_t (*TipCollectionModel.collectionIdentifier.modify())()
{
  return nullsub_1;
}

void TipCollectionModel.collectionSymbol.getter()
{
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_11_0();
  OUTLINED_FUNCTION_60();
}

void TipCollectionModel.collectionSymbol.setter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  OUTLINED_FUNCTION_10_0();
  swift_bridgeObjectRelease();
  *(_QWORD *)(v1 + 16) = v2;
  *(_QWORD *)(v1 + 24) = v0;
  OUTLINED_FUNCTION_5();
}

uint64_t (*TipCollectionModel.collectionSymbol.modify())()
{
  return nullsub_1;
}

void TipCollectionModel.title.getter()
{
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_11_0();
  OUTLINED_FUNCTION_60();
}

void TipCollectionModel.title.setter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  OUTLINED_FUNCTION_10_0();
  swift_bridgeObjectRelease();
  *(_QWORD *)(v1 + 32) = v2;
  *(_QWORD *)(v1 + 40) = v0;
  OUTLINED_FUNCTION_5();
}

uint64_t (*TipCollectionModel.title.modify())()
{
  return nullsub_1;
}

void TipCollectionModel.bodyText.getter()
{
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_11_0();
  OUTLINED_FUNCTION_60();
}

void TipCollectionModel.bodyText.setter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  OUTLINED_FUNCTION_10_0();
  swift_bridgeObjectRelease();
  *(_QWORD *)(v1 + 48) = v2;
  *(_QWORD *)(v1 + 56) = v0;
  OUTLINED_FUNCTION_5();
}

uint64_t (*TipCollectionModel.bodyText.modify())()
{
  return nullsub_1;
}

uint64_t TipCollectionModel.init(result:collection:)@<X0>(uint64_t a1@<X0>, void *a2@<X1>, uint64_t *a3@<X8>)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  id v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v27;
  uint64_t v28;

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_25697FF70);
  MEMORY[0x24BDAC7A8](v6);
  OUTLINED_FUNCTION_4();
  v9 = v8 - v7;
  sub_23A4726B0(a1, v8 - v7);
  v10 = sub_23A4AA27C();
  if (__swift_getEnumTagSinglePayload(v9, 1, v10) == 1)
  {
    sub_23A472704(v9);
    v11 = 0;
    v12 = 0;
  }
  else
  {
    v11 = sub_23A4AA0FC();
    v12 = v13;
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 8))(v9, v10);
  }
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_8_0();
  if (a2 && (v14 = objc_msgSend(a2, sel_tocAssets)) != 0)
  {
    v28 = sub_23A47B584(v14, (SEL *)&selRef_symbolId);
    v16 = v15;
  }
  else
  {
    v28 = 0;
    v16 = 0;
  }
  swift_bridgeObjectRetain();
  OUTLINED_FUNCTION_8_0();
  if (a2)
  {
    v17 = sub_23A47B584(a2, (SEL *)&selRef_title);
    v19 = v18;
  }
  else
  {
    v17 = 0;
    v19 = 0;
  }
  swift_bridgeObjectRetain();
  OUTLINED_FUNCTION_8_0();
  if (a2)
  {
    v27 = v11;
    v20 = a1;
    v21 = objc_msgSend(a2, sel_tileContent);
    v22 = objc_msgSend(v21, sel_bodyText);

    if (v22)
    {
      v23 = sub_23A4AA7C8();
      v25 = v24;

    }
    else
    {

      v23 = 0;
      v25 = 0;
    }
    a1 = v20;
    v11 = v27;
  }
  else
  {
    v23 = 0;
    v25 = 0;
  }
  sub_23A472704(a1);
  swift_bridgeObjectRetain();
  OUTLINED_FUNCTION_8_0();
  *a3 = v11;
  a3[1] = v12;
  a3[2] = v28;
  a3[3] = v16;
  a3[4] = v17;
  a3[5] = v19;
  a3[6] = v23;
  a3[7] = v25;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

void TipCollectionModel.punchOutUrl.getter()
{
  uint64_t v0;
  void *v1;
  id v2;

  if (*(_QWORD *)(v0 + 8))
    v1 = (void *)sub_23A4AA7BC();
  else
    v1 = 0;
  v2 = objc_msgSend((id)objc_opt_self(), sel_URLWithTipIdentifier_collectionIdentifier_referrer_, 0, v1, 0);

  sub_23A4A9F28();
}

BOOL sub_23A47AEA0(char a1, char a2)
{
  return a1 == a2;
}

uint64_t sub_23A47AEB0()
{
  return sub_23A4AAAD4();
}

uint64_t sub_23A47AED4(uint64_t a1, uint64_t a2)
{
  BOOL v5;
  char v7;

  if (a1 == 0xD000000000000014 && a2 == 0x800000023A4AEB10 || (sub_23A4AAAB0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0xD000000000000010 && a2 == 0x800000023A4AEB30 || (sub_23A4AAAB0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    v5 = a1 == 0x656C746974 && a2 == 0xE500000000000000;
    if (v5 || (sub_23A4AAAB0() & 1) != 0)
    {
      swift_bridgeObjectRelease();
      return 2;
    }
    else if (a1 == 0x7478655479646F62 && a2 == 0xE800000000000000)
    {
      swift_bridgeObjectRelease();
      return 3;
    }
    else
    {
      v7 = sub_23A4AAAB0();
      swift_bridgeObjectRelease();
      if ((v7 & 1) != 0)
        return 3;
      else
        return 4;
    }
  }
}

uint64_t sub_23A47B068()
{
  return 4;
}

uint64_t sub_23A47B070()
{
  sub_23A4AAAC8();
  sub_23A4AAAD4();
  return sub_23A4AAAE0();
}

uint64_t sub_23A47B0B4(unsigned __int8 a1)
{
  return ((uint64_t (*)(unint64_t, unint64_t))((char *)sub_23A47B0F0 + 4 * byte_23A4AB2C0[a1]))(0xD000000000000014, 0x800000023A4AEB10);
}

unint64_t sub_23A47B0F0()
{
  return 0xD000000000000010;
}

uint64_t sub_23A47B10C()
{
  return 0x656C746974;
}

uint64_t sub_23A47B120()
{
  return 0x7478655479646F62;
}

BOOL sub_23A47B138(char *a1, char *a2)
{
  return sub_23A47AEA0(*a1, *a2);
}

uint64_t sub_23A47B144()
{
  return sub_23A47B070();
}

uint64_t sub_23A47B14C()
{
  return sub_23A47AEB0();
}

uint64_t sub_23A47B154()
{
  unsigned __int8 *v0;

  return sub_23A47B0B4(*v0);
}

uint64_t sub_23A47B15C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_23A47AED4(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_23A47B180@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = sub_23A47B068();
  *a1 = result;
  return result;
}

uint64_t sub_23A47B1A4()
{
  sub_23A47B5EC();
  return sub_23A4AAB04();
}

uint64_t sub_23A47B1CC()
{
  sub_23A47B5EC();
  return sub_23A4AAB10();
}

void TipCollectionModel.encode(to:)(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_256980190);
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8]();
  OUTLINED_FUNCTION_4();
  v6 = v5 - v4;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_23A47B5EC();
  sub_23A4AAAF8();
  sub_23A4AAA68();
  if (!v7)
  {
    OUTLINED_FUNCTION_3_2();
    OUTLINED_FUNCTION_3_2();
    OUTLINED_FUNCTION_3_2();
  }
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v6, v2);
  OUTLINED_FUNCTION_0();
}

void TipCollectionModel.init(from:)(_QWORD *a1@<X0>, uint64_t *a2@<X8>)
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
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void (*v22)(uint64_t, uint64_t);
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569801A0);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8]();
  OUTLINED_FUNCTION_4();
  v9 = v8 - v7;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_23A47B5EC();
  sub_23A4AAAEC();
  if (v2)
  {
    __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
    swift_bridgeObjectRelease();
    OUTLINED_FUNCTION_14_0();
    OUTLINED_FUNCTION_6_1();
  }
  else
  {
    v10 = OUTLINED_FUNCTION_1_2();
    v12 = v11;
    v27 = v10;
    OUTLINED_FUNCTION_13_0();
    v13 = OUTLINED_FUNCTION_1_2();
    v15 = v14;
    v25 = v13;
    v26 = a2;
    OUTLINED_FUNCTION_13_0();
    v16 = OUTLINED_FUNCTION_1_2();
    v18 = v17;
    v24 = v16;
    OUTLINED_FUNCTION_13_0();
    v19 = OUTLINED_FUNCTION_1_2();
    v21 = v20;
    v22 = *(void (**)(uint64_t, uint64_t))(v6 + 8);
    v23 = v19;
    v22(v9, v5);
    OUTLINED_FUNCTION_7();
    swift_bridgeObjectRelease();
    *v26 = v27;
    v26[1] = v12;
    v26[2] = v25;
    v26[3] = v15;
    v26[4] = v24;
    v26[5] = v18;
    v26[6] = v23;
    v26[7] = v21;
    __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
    swift_bridgeObjectRelease();
    OUTLINED_FUNCTION_14_0();
    OUTLINED_FUNCTION_12_0();
  }
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_0();
}

void sub_23A47B55C(_QWORD *a1@<X0>, uint64_t *a2@<X8>)
{
  TipCollectionModel.init(from:)(a1, a2);
}

void sub_23A47B570(_QWORD *a1)
{
  TipCollectionModel.encode(to:)(a1);
}

uint64_t sub_23A47B584(void *a1, SEL *a2)
{
  id v3;
  uint64_t v4;

  v3 = objc_msgSend(a1, *a2);

  if (!v3)
    return 0;
  v4 = sub_23A4AA7C8();

  return v4;
}

unint64_t sub_23A47B5EC()
{
  unint64_t result;

  result = qword_256980198;
  if (!qword_256980198)
  {
    result = MEMORY[0x23B84E2B0](&unk_23A4AB438, &type metadata for TipCollectionModel.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256980198);
  }
  return result;
}

uint64_t destroy for TipCollectionModel()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

_QWORD *initializeWithCopy for TipCollectionModel(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

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
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

_QWORD *assignWithCopy for TipCollectionModel(_QWORD *a1, _QWORD *a2)
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

_QWORD *assignWithTake for TipCollectionModel(_QWORD *a1, _QWORD *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

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
  return a1;
}

uint64_t getEnumTagSinglePayload for TipCollectionModel(uint64_t a1, unsigned int a2)
{
  int v2;
  unint64_t v3;

  if (a2)
  {
    if (a2 >= 0x7FFFFFFF && *(_BYTE *)(a1 + 64))
    {
      v2 = *(_DWORD *)a1 + 2147483646;
    }
    else
    {
      v3 = *(_QWORD *)(a1 + 8);
      if (v3 >= 0xFFFFFFFF)
        LODWORD(v3) = -1;
      v2 = v3 - 1;
      if (v2 < 0)
        v2 = -1;
    }
  }
  else
  {
    v2 = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for TipCollectionModel(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(_QWORD *)(result + 56) = 0;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_QWORD *)result = a2 - 0x7FFFFFFF;
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 64) = 1;
  }
  else
  {
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 64) = 0;
    if (a2)
      *(_QWORD *)(result + 8) = a2;
  }
  return result;
}

ValueMetadata *type metadata accessor for TipCollectionModel()
{
  return &type metadata for TipCollectionModel;
}

uint64_t getEnumTagSinglePayload for TipCollectionModel.CodingKeys(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  int v5;
  unsigned int v6;
  BOOL v7;

  if (!a2)
  {
    v5 = -1;
    return (v5 + 1);
  }
  if (a2 >= 0xFD)
  {
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
      if (!v4)
        goto LABEL_17;
    }
    else if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
    }
    else
    {
      v4 = a1[1];
      if (!a1[1])
        goto LABEL_17;
    }
    v5 = (*a1 | (v4 << 8)) - 4;
    return (v5 + 1);
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 4;
  v5 = v6 - 4;
  if (!v7)
    v5 = -1;
  return (v5 + 1);
}

uint64_t storeEnumTagSinglePayload for TipCollectionModel.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_23A47B984 + 4 * byte_23A4AB2C9[v4]))();
  *a1 = a2 + 3;
  return ((uint64_t (*)(void))((char *)sub_23A47B9B8 + 4 * byte_23A4AB2C4[v4]))();
}

uint64_t sub_23A47B9B8(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_23A47B9C0(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x23A47B9C8);
  return result;
}

uint64_t sub_23A47B9D4(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x23A47B9DCLL);
  *(_BYTE *)result = a2 + 3;
  return result;
}

uint64_t sub_23A47B9E0(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23A47B9E8(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

_BYTE *sub_23A47B9F4(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

ValueMetadata *type metadata accessor for TipCollectionModel.CodingKeys()
{
  return &type metadata for TipCollectionModel.CodingKeys;
}

unint64_t sub_23A47BA10()
{
  unint64_t result;

  result = qword_2569801A8;
  if (!qword_2569801A8)
  {
    result = MEMORY[0x23B84E2B0](&unk_23A4AB410, &type metadata for TipCollectionModel.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2569801A8);
  }
  return result;
}

unint64_t sub_23A47BA50()
{
  unint64_t result;

  result = qword_2569801B0;
  if (!qword_2569801B0)
  {
    result = MEMORY[0x23B84E2B0](&unk_23A4AB380, &type metadata for TipCollectionModel.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2569801B0);
  }
  return result;
}

unint64_t sub_23A47BA90()
{
  unint64_t result;

  result = qword_2569801B8;
  if (!qword_2569801B8)
  {
    result = MEMORY[0x23B84E2B0](&unk_23A4AB3A8, &type metadata for TipCollectionModel.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2569801B8);
  }
  return result;
}

uint64_t OUTLINED_FUNCTION_0_2()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(v0 + 8))(v2, v1);
}

uint64_t OUTLINED_FUNCTION_1_2()
{
  return sub_23A4AAA14();
}

uint64_t OUTLINED_FUNCTION_3_2()
{
  return sub_23A4AAA68();
}

uint64_t OUTLINED_FUNCTION_6_1()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_8_0()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_11_0()
{
  uint64_t v0;

  return v0;
}

uint64_t OUTLINED_FUNCTION_12_0()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_13_0()
{
  return swift_bridgeObjectRetain();
}

uint64_t OUTLINED_FUNCTION_14_0()
{
  return swift_bridgeObjectRelease();
}

id sub_23A47BB3C(uint64_t a1)
{
  _QWORD *v1;
  _QWORD *v2;
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
  char *v17;
  uint64_t v18;
  uint64_t (**v19)(uint64_t, uint64_t);
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  int v23;
  void *v24;
  id v25;
  id v26;
  uint64_t v27;
  id v28;
  void *v29;
  id result;
  void *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  id v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  _QWORD v44[2];
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  unint64_t v52;
  uint64_t v53;
  unint64_t v54;
  uint64_t v55;
  uint64_t v56;

  v2 = v1;
  v44[1] = *v2;
  v4 = sub_23A4A9ED4();
  v46 = *(_QWORD *)(v4 - 8);
  v47 = v4;
  MEMORY[0x24BDAC7A8](v4);
  OUTLINED_FUNCTION_4();
  v45 = v6 - v5;
  v7 = sub_23A4A9FA0();
  v48 = *(_QWORD *)(v7 - 8);
  v49 = v7;
  MEMORY[0x24BDAC7A8](v7);
  OUTLINED_FUNCTION_4();
  v10 = v9 - v8;
  v11 = sub_23A4A9F40();
  v12 = *(_QWORD *)(v11 - 8);
  v13 = MEMORY[0x24BDAC7A8](v11);
  v15 = (char *)v44 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v13);
  v17 = (char *)v44 - v16;
  v18 = sub_23A4A9EA4();
  v19 = *(uint64_t (***)(uint64_t, uint64_t))(v18 - 8);
  MEMORY[0x24BDAC7A8](v18);
  OUTLINED_FUNCTION_4();
  v22 = v21 - v20;
  v50 = a1;
  sub_23A4A9EC8();
  v23 = v19[11](v22, v18);
  if (v23 == *MEMORY[0x24BDCD338])
  {
    OUTLINED_FUNCTION_0_3(v19[12]);
    swift_getObjCClassFromMetadata();
    v24 = (void *)objc_opt_self();
    v25 = OUTLINED_FUNCTION_2_2(v24, sel_bundleForClass_);
    goto LABEL_3;
  }
  if (v23 != *MEMORY[0x24BDCD330])
  {
    if (v23 != *MEMORY[0x24BDCD328])
    {
      swift_getObjCClassFromMetadata();
      v43 = (void *)objc_opt_self();
      v26 = OUTLINED_FUNCTION_2_2(v43, sel_bundleForClass_);
      OUTLINED_FUNCTION_0_3(v19[1]);
      goto LABEL_4;
    }
    v25 = objc_msgSend((id)objc_opt_self(), sel_mainBundle);
LABEL_3:
    v26 = v25;
LABEL_4:
    v27 = v50;
    goto LABEL_9;
  }
  OUTLINED_FUNCTION_0_3(v19[12]);
  (*(void (**)(char *, uint64_t, uint64_t))(v12 + 32))(v17, v22, v11);
  sub_23A47C1D4();
  (*(void (**)(char *, char *, uint64_t))(v12 + 16))(v15, v17, v11);
  v28 = sub_23A47BF80((uint64_t)v15);
  if (!v28)
  {
    swift_getObjCClassFromMetadata();
    v29 = (void *)objc_opt_self();
    v28 = OUTLINED_FUNCTION_2_2(v29, sel_bundleForClass_);
  }
  v26 = v28;
  v27 = v50;
  (*(void (**)(char *, uint64_t))(v12 + 8))(v17, v11);
LABEL_9:
  result = objc_msgSend((id)objc_opt_self(), sel_sharedInstance);
  if (result)
  {
    v31 = result;
    sub_23A4A9EB0();
    v32 = (void *)sub_23A4AA7BC();
    swift_bridgeObjectRelease();
    sub_23A4A9EBC();
    if (v33)
    {
      v34 = (void *)sub_23A4AA7BC();
      swift_bridgeObjectRelease();
    }
    else
    {
      v34 = 0;
    }
    __swift_project_boxed_opaque_existential_1(v2 + 2, v2[5]);
    v35 = v26;
    sub_23A4AA42C();
    v55 = sub_23A4A9F88();
    v56 = v36;
    v53 = 45;
    v54 = 0xE100000000000000;
    v51 = 95;
    v52 = 0xE100000000000000;
    sub_23A47C0E8();
    v37 = sub_23A4AA918();
    v39 = v38;
    swift_bridgeObjectRelease();
    (*(void (**)(uint64_t, uint64_t))(v48 + 8))(v10, v49);
    v40 = sub_23A47C124((uint64_t)v32, (uint64_t)v34, (uint64_t)v35, v37, v39, v31);
    v42 = v41;

    if (!v42)
    {
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v46 + 16))(v45, v27, v47);
      v40 = sub_23A4AA7D4();
    }

    return (id)v40;
  }
  else
  {
    __break(1u);
  }
  return result;
}

id sub_23A47BF80(uint64_t a1)
{
  id v2;
  void *v3;
  id v4;
  uint64_t v5;

  v2 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  v3 = (void *)sub_23A4A9F1C();
  v4 = objc_msgSend(v2, sel_initWithURL_, v3);

  v5 = sub_23A4A9F40();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(a1, v5);
  return v4;
}

uint64_t sub_23A47BFFC()
{
  uint64_t v0;

  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for LocalizedResourceProvider()
{
  return objc_opt_self();
}

uint64_t sub_23A47C040()
{
  uint64_t v0;
  _QWORD *v1;

  v0 = sub_23A4A9EA4();
  __swift_allocate_value_buffer(v0, qword_256988510);
  v1 = (_QWORD *)__swift_project_value_buffer(v0, (uint64_t)qword_256988510);
  *v1 = type metadata accessor for LocalizedResourceProvider();
  return (*(uint64_t (**)(_QWORD *, _QWORD, uint64_t))(*(_QWORD *)(v0 - 8) + 104))(v1, *MEMORY[0x24BDCD338], v0);
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

unint64_t sub_23A47C0E8()
{
  unint64_t result;

  result = qword_256980268;
  if (!qword_256980268)
  {
    result = MEMORY[0x23B84E2B0](MEMORY[0x24BEE0D50], MEMORY[0x24BEE0D00]);
    atomic_store(result, (unint64_t *)&qword_256980268);
  }
  return result;
}

uint64_t sub_23A47C124(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, void *a6)
{
  void *v10;
  id v11;
  uint64_t v12;

  v10 = (void *)sub_23A4AA7BC();
  swift_bridgeObjectRelease();
  v11 = objc_msgSend(a6, sel_localizedStringForKey_table_bundle_languageCode_, a1, a2, a3, v10);

  if (!v11)
    return 0;
  v12 = sub_23A4AA7C8();

  return v12;
}

unint64_t sub_23A47C1D4()
{
  unint64_t result;

  result = qword_256980270;
  if (!qword_256980270)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_256980270);
  }
  return result;
}

uint64_t OUTLINED_FUNCTION_0_3@<X0>(uint64_t (*a1)(uint64_t, uint64_t)@<X8>)
{
  uint64_t v1;
  uint64_t v2;

  return a1(v2, v1);
}

id OUTLINED_FUNCTION_2_2(id a1, SEL a2)
{
  uint64_t v2;

  return objc_msgSend(a1, a2, v2);
}

void sub_23A47C224()
{
  sub_23A4AA234();
  __asm { BR              X10 }
}

uint64_t sub_23A47C41C(uint64_t a1, unint64_t a2)
{
  uint64_t result;

  if (a2 >> 62 != 1)
  {
    if (a2 >> 62 != 2)
      return result;
    swift_release();
  }
  return swift_release();
}

double sub_23A47C460@<D0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, _OWORD *a4@<X8>)
{
  unint64_t v6;
  char v7;
  double result;

  if (*(_QWORD *)(a3 + 16) && (v6 = sub_23A47C4F0(a1, a2), (v7 & 1) != 0))
  {
    sub_23A47C554(*(_QWORD *)(a3 + 56) + 32 * v6, (uint64_t)a4);
  }
  else
  {
    result = 0.0;
    *a4 = 0u;
    a4[1] = 0u;
  }
  return result;
}

uint64_t sub_23A47C4B0(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_256980280);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_23A47C4F0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  sub_23A4AAAC8();
  sub_23A4AA7F8();
  v4 = sub_23A4AAAE0();
  return sub_23A47C590(a1, a2, v4);
}

uint64_t sub_23A47C554(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

unint64_t sub_23A47C590(uint64_t a1, uint64_t a2, uint64_t a3)
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
    if (!v11 && (sub_23A4AAAB0() & 1) == 0)
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
      while (!v14 && (sub_23A4AAAB0() & 1) == 0);
    }
  }
  return v6;
}

uint64_t OUTLINED_FUNCTION_0_4()
{
  uint64_t v0;
  unint64_t v1;

  return sub_23A47C41C(v0, v1);
}

uint64_t OUTLINED_FUNCTION_1_3()
{
  return swift_dynamicCast();
}

uint64_t initializeWithCopy for OutputHelper(uint64_t a1, uint64_t a2)
{
  __int128 v3;

  v3 = *(_OWORD *)(a2 + 24);
  *(_OWORD *)(a1 + 24) = v3;
  (**(void (***)(void))(v3 - 8))();
  return a1;
}

uint64_t *assignWithCopy for OutputHelper(uint64_t *a1, uint64_t *a2)
{
  __swift_assign_boxed_opaque_existential_1(a1, a2);
  return a1;
}

uint64_t *__swift_assign_boxed_opaque_existential_1(uint64_t *result, uint64_t *a2)
{
  uint64_t *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  uint64_t v10;
  _BYTE v11[24];

  if (result != a2)
  {
    v3 = result;
    v4 = result[3];
    v5 = a2[3];
    if (v4 == v5)
    {
      v9 = *(_QWORD *)(v4 - 8);
      if ((*(_BYTE *)(v9 + 82) & 2) != 0)
      {
        v10 = *a2;
        swift_retain();
        result = (uint64_t *)swift_release();
        *v3 = v10;
      }
      else
      {
        return (uint64_t *)(*(uint64_t (**)(uint64_t *, uint64_t *, uint64_t))(v9 + 24))(result, a2, result[3]);
      }
    }
    else
    {
      result[3] = v5;
      result[4] = a2[4];
      v6 = *(_QWORD *)(v4 - 8);
      v7 = *(_QWORD *)(v5 - 8);
      v8 = *(_DWORD *)(v7 + 80);
      if ((*(_BYTE *)(v6 + 82) & 2) != 0)
      {
        if ((v8 & 0x20000) != 0)
        {
          *result = *a2;
          swift_retain();
        }
        else
        {
          (*(void (**)(uint64_t *, uint64_t *, uint64_t))(v7 + 16))(result, a2, v5);
        }
        return (uint64_t *)swift_release();
      }
      else
      {
        (*(void (**)(_BYTE *, uint64_t *, uint64_t))(v6 + 32))(v11, result, v4);
        if ((v8 & 0x20000) != 0)
        {
          *v3 = *a2;
          swift_retain();
        }
        else
        {
          (*(void (**)(uint64_t *, uint64_t *, uint64_t))(v7 + 16))(v3, a2, v5);
        }
        return (uint64_t *)(*(uint64_t (**)(_BYTE *, uint64_t))(v6 + 8))(v11, v4);
      }
    }
  }
  return result;
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

uint64_t assignWithTake for OutputHelper(uint64_t a1, uint64_t a2)
{
  __int128 v4;

  __swift_destroy_boxed_opaque_existential_1(a1);
  v4 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v4;
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  return a1;
}

uint64_t getEnumTagSinglePayload for OutputHelper(uint64_t a1, int a2)
{
  unint64_t v2;

  if (a2)
  {
    if (a2 < 0 && *(_BYTE *)(a1 + 40))
    {
      LODWORD(v2) = *(_DWORD *)a1 + 0x7FFFFFFF;
    }
    else
    {
      v2 = *(_QWORD *)(a1 + 24);
      if (v2 >= 0xFFFFFFFF)
        LODWORD(v2) = -1;
    }
  }
  else
  {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for OutputHelper(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for OutputHelper()
{
  return &type metadata for OutputHelper;
}

uint64_t sub_23A47C93C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, char a8)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  char v14;
  _OWORD *v15;

  *(_BYTE *)(v9 + 409) = v14;
  *(_BYTE *)(v9 + 408) = a8;
  *(_QWORD *)(v9 + 224) = a7;
  *(_QWORD *)(v9 + 232) = v8;
  *(_QWORD *)(v9 + 208) = a5;
  *(_QWORD *)(v9 + 216) = a6;
  *(_QWORD *)(v9 + 192) = a3;
  *(_QWORD *)(v9 + 200) = a4;
  *(_QWORD *)(v9 + 176) = a1;
  *(_QWORD *)(v9 + 184) = a2;
  *(_QWORD *)(v9 + 240) = type metadata accessor for TellMeGeneratedSnippetModels();
  *(_QWORD *)(v9 + 248) = OUTLINED_FUNCTION_5_1();
  *(_QWORD *)(v9 + 256) = swift_task_alloc();
  *(_QWORD *)(v9 + 264) = __swift_instantiateConcreteTypeFromMangledName(&qword_256980290);
  *(_QWORD *)(v9 + 272) = OUTLINED_FUNCTION_35();
  v10 = sub_23A4AA444();
  *(_QWORD *)(v9 + 280) = v10;
  *(_QWORD *)(v9 + 288) = *(_QWORD *)(v10 - 8);
  *(_QWORD *)(v9 + 296) = OUTLINED_FUNCTION_35();
  v11 = sub_23A4AA528();
  *(_QWORD *)(v9 + 304) = v11;
  *(_QWORD *)(v9 + 312) = *(_QWORD *)(v11 - 8);
  *(_QWORD *)(v9 + 320) = OUTLINED_FUNCTION_35();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256980070);
  *(_QWORD *)(v9 + 328) = OUTLINED_FUNCTION_5_1();
  *(_QWORD *)(v9 + 336) = swift_task_alloc();
  v12 = v15[1];
  *(_OWORD *)(v9 + 344) = *v15;
  *(_OWORD *)(v9 + 360) = v12;
  OUTLINED_FUNCTION_24();
  return swift_task_switch();
}

uint64_t sub_23A47CA34()
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
  uint64_t v11;
  int EnumTagSinglePayload;
  int v13;
  _QWORD *v14;
  uint64_t v16;
  uint64_t *v17;
  _QWORD *v18;
  _QWORD *v19;
  uint64_t v20;
  uint64_t *v21;
  _QWORD *v22;
  uint64_t v23;
  uint64_t v24;
  _QWORD *v25;
  uint64_t v26;
  unint64_t v27;
  uint64_t *boxed_opaque_existential_1;
  uint64_t *v29;
  _QWORD *v30;
  __int128 v31;
  uint64_t v32;
  char v33;
  char v34;
  uint64_t v35;
  __int128 v36;
  __int128 v37;
  uint64_t v38;
  uint64_t v39;

  v37 = *(_OWORD *)(v0 + 360);
  v36 = *(_OWORD *)(v0 + 344);
  v1 = *(_QWORD *)(v0 + 328);
  v2 = *(_QWORD *)(v0 + 336);
  v3 = *(_QWORD *)(v0 + 288);
  v4 = *(_QWORD *)(v0 + 296);
  v5 = *(_QWORD *)(v0 + 272);
  v6 = *(_QWORD *)(v0 + 280);
  v38 = *(_QWORD *)(v0 + 264);
  v39 = *(_QWORD *)(v0 + 240);
  v7 = *(_QWORD *)(v0 + 224);
  v35 = *(_QWORD *)(v0 + 232);
  v33 = *(_BYTE *)(v0 + 409);
  v34 = *(_BYTE *)(v0 + 408);
  v32 = *(_QWORD *)(v0 + 216);
  v31 = *(_OWORD *)(v0 + 200);
  v8 = *(_QWORD *)(v0 + 184);
  v9 = type metadata accessor for SnippetResponseComponents();
  OUTLINED_FUNCTION_9_0(v8 + *(int *)(v9 + 20), v2);
  OUTLINED_FUNCTION_9_0(v8, v1);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16))(v4, v7, v6);
  v10 = swift_task_alloc();
  *(_BYTE *)(v10 + 16) = v33;
  *(_OWORD *)(v10 + 24) = v31;
  *(_QWORD *)(v10 + 40) = v32;
  *(_BYTE *)(v10 + 48) = v34;
  *(_QWORD *)(v10 + 56) = v2;
  *(_OWORD *)(v10 + 64) = v36;
  *(_OWORD *)(v10 + 80) = v37;
  *(_QWORD *)(v10 + 96) = v35;
  sub_23A4AA4BC();
  swift_task_dealloc();
  v11 = v5 + *(int *)(v38 + 48);
  OUTLINED_FUNCTION_9_0(v1, v5);
  OUTLINED_FUNCTION_9_0(v2, v11);
  LODWORD(v5) = __swift_getEnumTagSinglePayload(v5, 1, v39);
  EnumTagSinglePayload = __swift_getEnumTagSinglePayload(v11, 1, v39);
  v13 = EnumTagSinglePayload;
  if ((_DWORD)v5 == 1)
  {
    if (EnumTagSinglePayload == 1)
    {
      __swift_project_boxed_opaque_existential_1(*(_QWORD **)(v0 + 232), *(_QWORD *)(*(_QWORD *)(v0 + 232) + 24));
      v14 = (_QWORD *)swift_task_alloc();
      *(_QWORD *)(v0 + 400) = v14;
      *v14 = v0;
      v14[1] = sub_23A47CF80;
      OUTLINED_FUNCTION_8_1();
      return sub_23A4AA498();
    }
    v19 = *(_QWORD **)(v0 + 232);
    v20 = *(_QWORD *)(v0 + 240);
    sub_23A47D1F4(v11, *(_QWORD *)(v0 + 256));
    __swift_project_boxed_opaque_existential_1(v19, v19[3]);
    *(_QWORD *)(v0 + 40) = v20;
    *(_QWORD *)(v0 + 48) = sub_23A47D238();
    v21 = OUTLINED_FUNCTION_22_0();
    OUTLINED_FUNCTION_18_0((uint64_t)v21);
    v22 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 392) = v22;
    OUTLINED_FUNCTION_7_1(v22);
    goto LABEL_7;
  }
  sub_23A47D1F4(*(_QWORD *)(v0 + 272), *(_QWORD *)(v0 + 256));
  if (v13 == 1)
  {
    v16 = *(_QWORD *)(v0 + 240);
    __swift_project_boxed_opaque_existential_1(*(_QWORD **)(v0 + 232), *(_QWORD *)(*(_QWORD *)(v0 + 232) + 24));
    *(_QWORD *)(v0 + 80) = v16;
    *(_QWORD *)(v0 + 88) = sub_23A47D238();
    v17 = OUTLINED_FUNCTION_22_0();
    OUTLINED_FUNCTION_18_0((uint64_t)v17);
    v18 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 384) = v18;
    OUTLINED_FUNCTION_7_1(v18);
LABEL_7:
    OUTLINED_FUNCTION_8_1();
    return sub_23A4AA48C();
  }
  v24 = *(_QWORD *)(v0 + 248);
  v23 = *(_QWORD *)(v0 + 256);
  v25 = *(_QWORD **)(v0 + 232);
  v26 = *(_QWORD *)(v0 + 240);
  sub_23A47D1F4(v11, v24);
  __swift_project_boxed_opaque_existential_1(v25, v25[3]);
  *(_QWORD *)(v0 + 120) = v26;
  v27 = sub_23A47D238();
  *(_QWORD *)(v0 + 128) = v27;
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1((uint64_t *)(v0 + 96));
  sub_23A47D2B4(v24, (uint64_t)boxed_opaque_existential_1);
  *(_QWORD *)(v0 + 160) = v26;
  *(_QWORD *)(v0 + 168) = v27;
  v29 = OUTLINED_FUNCTION_22_0();
  sub_23A47D2B4(v23, (uint64_t)v29);
  v30 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 376) = v30;
  *v30 = v0;
  v30[1] = sub_23A47CDE0;
  OUTLINED_FUNCTION_8_1();
  return sub_23A4AA480();
}

uint64_t sub_23A47CDE0()
{
  uint64_t v0;
  uint64_t v1;

  OUTLINED_FUNCTION_47();
  v1 = v0 + 136;
  OUTLINED_FUNCTION_45();
  __swift_destroy_boxed_opaque_existential_1(v1);
  OUTLINED_FUNCTION_20_0();
  OUTLINED_FUNCTION_24();
  return swift_task_switch();
}

uint64_t sub_23A47CE30()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v1 = *(_QWORD *)(v0 + 312);
  v2 = *(_QWORD *)(v0 + 256);
  sub_23A47D2F8(*(_QWORD *)(v0 + 248));
  sub_23A47D2F8(v2);
  OUTLINED_FUNCTION_16_0(*(uint64_t (**)(uint64_t, uint64_t))(v1 + 8));
  OUTLINED_FUNCTION_13_1();
  OUTLINED_FUNCTION_21_0();
  OUTLINED_FUNCTION_2_3();
  OUTLINED_FUNCTION_93();
  OUTLINED_FUNCTION_99();
  OUTLINED_FUNCTION_83();
  OUTLINED_FUNCTION_76();
  OUTLINED_FUNCTION_85();
  OUTLINED_FUNCTION_61();
  return OUTLINED_FUNCTION_0_5(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_23A47CEA0()
{
  OUTLINED_FUNCTION_47();
  OUTLINED_FUNCTION_45();
  OUTLINED_FUNCTION_20_0();
  OUTLINED_FUNCTION_24();
  return OUTLINED_FUNCTION_1_0();
}

uint64_t sub_23A47CEDC()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 312);
  sub_23A47D2F8(*(_QWORD *)(v0 + 256));
  OUTLINED_FUNCTION_16_0(*(uint64_t (**)(uint64_t, uint64_t))(v1 + 8));
  OUTLINED_FUNCTION_13_1();
  OUTLINED_FUNCTION_21_0();
  OUTLINED_FUNCTION_2_3();
  OUTLINED_FUNCTION_93();
  OUTLINED_FUNCTION_99();
  OUTLINED_FUNCTION_83();
  OUTLINED_FUNCTION_76();
  OUTLINED_FUNCTION_85();
  OUTLINED_FUNCTION_61();
  return OUTLINED_FUNCTION_0_5(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_23A47CF44()
{
  OUTLINED_FUNCTION_47();
  OUTLINED_FUNCTION_45();
  OUTLINED_FUNCTION_20_0();
  OUTLINED_FUNCTION_24();
  return OUTLINED_FUNCTION_1_0();
}

uint64_t sub_23A47CF80()
{
  OUTLINED_FUNCTION_47();
  OUTLINED_FUNCTION_45();
  OUTLINED_FUNCTION_24();
  return OUTLINED_FUNCTION_1_0();
}

uint64_t sub_23A47CFB4()
{
  uint64_t v0;

  (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 312) + 8))(*(_QWORD *)(v0 + 320), *(_QWORD *)(v0 + 304));
  OUTLINED_FUNCTION_13_1();
  OUTLINED_FUNCTION_21_0();
  OUTLINED_FUNCTION_2_3();
  OUTLINED_FUNCTION_93();
  OUTLINED_FUNCTION_99();
  OUTLINED_FUNCTION_83();
  OUTLINED_FUNCTION_76();
  OUTLINED_FUNCTION_85();
  OUTLINED_FUNCTION_61();
  return OUTLINED_FUNCTION_0_5(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_23A47D014(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, unsigned __int8 a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11)
{
  int v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v22;
  uint64_t v23;

  v23 = a8;
  v13 = a6;
  v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569802A0);
  MEMORY[0x24BDAC7A8](v14);
  v16 = (char *)&v22 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23A4AA4E0();
  swift_bridgeObjectRetain();
  sub_23A4AA4D4();
  sub_23A47D334(a5, (uint64_t)v16, &qword_2569802A0);
  sub_23A4AA4EC();
  if (v13 == 2)
    sub_23A4AA4F8();
  sub_23A4AA504();
  v17 = type metadata accessor for TellMeGeneratedSnippetModels();
  __swift_getEnumTagSinglePayload(a7, 1, v17);
  sub_23A4AA51C();
  __swift_getEnumTagSinglePayload(a7, 1, v17);
  sub_23A4AA510();
  if (a9)
  {
    v18 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BE818F0]), sel_init);
    sub_23A47D378(v23, a9, v18);
    sub_23A47D3BC(a10, a11, v18);
    v19 = sub_23A4AA7C8();
    sub_23A47D400(v19, v20, v18);
  }
  return sub_23A4AA4C8();
}

uint64_t sub_23A47D1B4(uint64_t a1)
{
  uint64_t v1;

  return sub_23A47D014(a1, *(unsigned __int8 *)(v1 + 16), *(_QWORD *)(v1 + 24), *(_QWORD *)(v1 + 32), *(_QWORD *)(v1 + 40), *(_BYTE *)(v1 + 48), *(_QWORD *)(v1 + 56), *(_QWORD *)(v1 + 64), *(_QWORD *)(v1 + 72), *(_QWORD *)(v1 + 80), *(_QWORD *)(v1 + 88));
}

uint64_t sub_23A47D1F4(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for TellMeGeneratedSnippetModels();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

unint64_t sub_23A47D238()
{
  unint64_t result;
  uint64_t v1;

  result = qword_256980298;
  if (!qword_256980298)
  {
    v1 = type metadata accessor for TellMeGeneratedSnippetModels();
    result = MEMORY[0x23B84E2B0](&protocol conformance descriptor for TellMeGeneratedSnippetModels, v1);
    atomic_store(result, (unint64_t *)&qword_256980298);
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

uint64_t sub_23A47D2B4(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for TellMeGeneratedSnippetModels();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_23A47D2F8(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata accessor for TellMeGeneratedSnippetModels();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_23A47D334(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

void sub_23A47D378(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;

  v4 = (id)sub_23A4AA7BC();
  objc_msgSend(a3, sel_setInput_, v4);

}

void sub_23A47D3BC(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;

  v4 = (id)sub_23A4AA7BC();
  objc_msgSend(a3, sel_setOutput_, v4);

}

void sub_23A47D400(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;

  v4 = (id)sub_23A4AA7BC();
  swift_bridgeObjectRelease();
  objc_msgSend(a3, sel_setDomain_, v4);

}

uint64_t OUTLINED_FUNCTION_0_5(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t OUTLINED_FUNCTION_2_3()
{
  return swift_task_dealloc();
}

uint64_t OUTLINED_FUNCTION_5_1()
{
  return swift_task_alloc();
}

uint64_t OUTLINED_FUNCTION_7_1(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;

  *a1 = v2;
  a1[1] = v1;
  return *(_QWORD *)(v2 + 176);
}

uint64_t OUTLINED_FUNCTION_9_0(uint64_t a1, uint64_t a2)
{
  uint64_t *v2;

  return sub_23A47D334(a1, a2, v2);
}

uint64_t OUTLINED_FUNCTION_13_1()
{
  uint64_t v0;

  return sub_23A47A944(v0);
}

uint64_t OUTLINED_FUNCTION_16_0@<X0>(uint64_t (*a1)(uint64_t, uint64_t)@<X8>)
{
  uint64_t v1;
  uint64_t v2;

  return a1(v1, v2);
}

uint64_t OUTLINED_FUNCTION_18_0(uint64_t a1)
{
  uint64_t v1;

  return sub_23A47D2B4(v1, a1);
}

uint64_t OUTLINED_FUNCTION_20_0()
{
  uint64_t v0;

  return __swift_destroy_boxed_opaque_existential_1(v0);
}

uint64_t OUTLINED_FUNCTION_21_0()
{
  uint64_t v0;

  return sub_23A47A944(v0);
}

uint64_t *OUTLINED_FUNCTION_22_0()
{
  uint64_t *v0;

  return __swift_allocate_boxed_opaque_existential_1(v0);
}

uint64_t AttributionListSnippetModel.init(attributions:context:)()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_256980098);
  sub_23A4AA354();
  OUTLINED_FUNCTION_2_4();
  return sub_23A4AA354();
}

uint64_t type metadata accessor for AttributionListSnippetModel()
{
  uint64_t result;

  result = qword_256980378;
  if (!qword_256980378)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t AttributionListSnippetModel.attributions.getter()
{
  uint64_t v1;

  __swift_instantiateConcreteTypeFromMangledName(&qword_2569800A0);
  sub_23A4AA36C();
  return v1;
}

uint64_t sub_23A47D5F8()
{
  swift_bridgeObjectRetain();
  return AttributionListSnippetModel.attributions.setter();
}

uint64_t AttributionListSnippetModel.attributions.setter()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_2569800A0);
  return sub_23A4AA378();
}

void AttributionListSnippetModel.attributions.modify()
{
  _QWORD *v0;
  _QWORD *v1;

  v1 = OUTLINED_FUNCTION_6_2();
  *v0 = v1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2569800A0);
  v1[4] = OUTLINED_FUNCTION_7_2();
  OUTLINED_FUNCTION_5();
}

uint64_t AttributionListSnippetModel.context.getter()
{
  OUTLINED_FUNCTION_2_4();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2569800A8);
  return sub_23A4AA36C();
}

double sub_23A47D6D4@<D0>(uint64_t a1@<X8>)
{
  double result;
  __int128 v3;
  uint64_t v4;
  uint64_t v5;

  AttributionListSnippetModel.context.getter();
  result = *(double *)&v3;
  *(_OWORD *)a1 = v3;
  *(_QWORD *)(a1 + 16) = v4;
  *(_QWORD *)(a1 + 24) = v5;
  return result;
}

uint64_t sub_23A47D714()
{
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return AttributionListSnippetModel.context.setter();
}

uint64_t AttributionListSnippetModel.context.setter()
{
  OUTLINED_FUNCTION_2_4();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2569800A8);
  return sub_23A4AA378();
}

void AttributionListSnippetModel.context.modify()
{
  _QWORD *v0;
  _QWORD *v1;

  v1 = OUTLINED_FUNCTION_6_2();
  *v0 = v1;
  OUTLINED_FUNCTION_2_4();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2569800A8);
  v1[4] = OUTLINED_FUNCTION_7_2();
  OUTLINED_FUNCTION_5();
}

void sub_23A47D800(_QWORD *a1)
{
  void *v1;

  v1 = (void *)*a1;
  (*(void (**)(_QWORD, _QWORD))(*a1 + 32))(*a1, 0);
  free(v1);
}

uint64_t sub_23A47D830(uint64_t a1, uint64_t a2)
{
  BOOL v3;
  char v7;

  v3 = a1 == 0x7475626972747461 && a2 == 0xEC000000736E6F69;
  if (v3 || (sub_23A4AAAB0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x747865746E6F63 && a2 == 0xE700000000000000)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    v7 = sub_23A4AAAB0();
    swift_bridgeObjectRelease();
    if ((v7 & 1) != 0)
      return 1;
    else
      return 2;
  }
}

uint64_t sub_23A47D924(char a1)
{
  if ((a1 & 1) != 0)
    return 0x747865746E6F63;
  else
    return 0x7475626972747461;
}

uint64_t sub_23A47D964()
{
  char *v0;

  return sub_23A47D924(*v0);
}

uint64_t sub_23A47D96C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_23A47D830(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_23A47D990()
{
  sub_23A47DB3C();
  return sub_23A4AAB04();
}

uint64_t sub_23A47D9B8()
{
  sub_23A47DB3C();
  return sub_23A4AAB10();
}

uint64_t AttributionListSnippetModel.encode(to:)(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569802A8);
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8]();
  OUTLINED_FUNCTION_4_2();
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_23A47DB3C();
  sub_23A4AAAF8();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2569800A0);
  sub_23A47DF3C((uint64_t)&unk_2569802B8);
  OUTLINED_FUNCTION_9_1();
  if (!v1)
  {
    type metadata accessor for AttributionListSnippetModel();
    __swift_instantiateConcreteTypeFromMangledName(&qword_2569800A8);
    sub_23A47DFC8((uint64_t)&unk_2569802E0);
    OUTLINED_FUNCTION_9_1();
  }
  return (*(uint64_t (**)(uint64_t, uint64_t))(v5 + 8))(v2, v4);
}

unint64_t sub_23A47DB3C()
{
  unint64_t result;

  result = qword_2569802B0;
  if (!qword_2569802B0)
  {
    result = MEMORY[0x23B84E2B0](&unk_23A4AB6B0, &type metadata for AttributionListSnippetModel.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2569802B0);
  }
  return result;
}

uint64_t __swift_instantiateConcreteTypeFromMangledNameAbstract(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x23B84E2A4](255, (char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

unint64_t sub_23A47DBBC(uint64_t a1)
{
  unint64_t *v1;
  unint64_t result;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;

  result = OUTLINED_FUNCTION_5_2(a1);
  if (!result)
  {
    v5 = v4;
    v6 = v3;
    v7 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256980098);
    v8 = sub_23A47E0EC(v6);
    result = MEMORY[0x23B84E2B0](v5, v7, &v8);
    atomic_store(result, v1);
  }
  return result;
}

unint64_t sub_23A47DC3C()
{
  unint64_t result;

  result = qword_2569802E8;
  if (!qword_2569802E8)
  {
    result = MEMORY[0x23B84E2B0](&protocol conformance descriptor for FlowContext, &type metadata for FlowContext);
    atomic_store(result, (unint64_t *)&qword_2569802E8);
  }
  return result;
}

unint64_t sub_23A47DC78()
{
  unint64_t result;

  result = qword_2569802F0;
  if (!qword_2569802F0)
  {
    result = MEMORY[0x23B84E2B0](&protocol conformance descriptor for FlowContext, &type metadata for FlowContext);
    atomic_store(result, (unint64_t *)&qword_2569802F0);
  }
  return result;
}

uint64_t AttributionListSnippetModel.init(from:)@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
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
  uint64_t v16;
  uint64_t v17;
  _QWORD *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  char v28;
  char v29;

  v21 = a2;
  v23 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569800A8);
  v20 = *(_QWORD *)(v23 - 8);
  MEMORY[0x24BDAC7A8]();
  OUTLINED_FUNCTION_8_2();
  v22 = v4;
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569800A0);
  v26 = *(_QWORD *)(v5 - 8);
  v27 = v5;
  MEMORY[0x24BDAC7A8]();
  OUTLINED_FUNCTION_8_2();
  v24 = v6;
  v25 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569802F8);
  v7 = *(_QWORD *)(v25 - 8);
  MEMORY[0x24BDAC7A8]();
  OUTLINED_FUNCTION_4_2();
  v8 = type metadata accessor for AttributionListSnippetModel();
  MEMORY[0x24BDAC7A8]();
  v10 = (char *)&v16 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_23A47DB3C();
  sub_23A4AAAEC();
  if (v2)
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  v17 = v8;
  v18 = a1;
  v19 = v7;
  v11 = v26;
  v12 = v22;
  v13 = v23;
  v29 = 0;
  sub_23A47DF3C((uint64_t)&unk_256980300);
  v14 = v24;
  OUTLINED_FUNCTION_10_1();
  (*(void (**)(char *, uint64_t, uint64_t))(v11 + 32))(v10, v14, v27);
  v28 = 1;
  sub_23A47DFC8((uint64_t)&unk_256980308);
  OUTLINED_FUNCTION_10_1();
  OUTLINED_FUNCTION_1_4();
  (*(void (**)(char *, uint64_t, uint64_t))(v20 + 32))(&v10[*(int *)(v17 + 20)], v12, v13);
  sub_23A47E014((uint64_t)v10, v21);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v18);
  return sub_23A47E058((uint64_t)v10);
}

void sub_23A47DF3C(uint64_t a1)
{
  if (!OUTLINED_FUNCTION_5_2(a1))
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2569800A0);
    sub_23A47DBBC((uint64_t)&unk_2569802C0);
    sub_23A47DBBC((uint64_t)&unk_2569802D0);
    OUTLINED_FUNCTION_0_6();
  }
  OUTLINED_FUNCTION_3_3();
}

void sub_23A47DFC8(uint64_t a1)
{
  if (!OUTLINED_FUNCTION_5_2(a1))
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2569800A8);
    sub_23A47DC3C();
    sub_23A47DC78();
    OUTLINED_FUNCTION_0_6();
  }
  OUTLINED_FUNCTION_3_3();
}

uint64_t sub_23A47E014(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for AttributionListSnippetModel();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_23A47E058(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata accessor for AttributionListSnippetModel();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_23A47E094()
{
  return sub_23A47E0EC((uint64_t)&unk_256980310);
}

unint64_t sub_23A47E0C0()
{
  return sub_23A47E0EC((uint64_t)&unk_256980318);
}

unint64_t sub_23A47E0EC(uint64_t a1)
{
  unint64_t *v1;
  unint64_t result;
  uint64_t (*v3)(uint64_t);
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  result = OUTLINED_FUNCTION_5_2(a1);
  if (!result)
  {
    v5 = v4;
    v6 = v3(255);
    result = MEMORY[0x23B84E2B0](v5, v6);
    atomic_store(result, v1);
  }
  return result;
}

uint64_t sub_23A47E128@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  return AttributionListSnippetModel.init(from:)(a1, a2);
}

uint64_t sub_23A47E13C(_QWORD *a1)
{
  return AttributionListSnippetModel.encode(to:)(a1);
}

uint64_t sub_23A47E150@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  result = AttributionListSnippetModel.attributions.getter();
  *a1 = result;
  return result;
}

uint64_t *initializeBufferWithCopyOfBuffer for AttributionListSnippetModel(uint64_t *a1, uint64_t *a2, uint64_t a3)
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
    v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569800A0);
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a1, a2, v7);
    v8 = *(int *)(a3 + 20);
    v9 = (char *)a1 + v8;
    v10 = (char *)a2 + v8;
    v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569800A8);
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v11 - 8) + 16))(v9, v10, v11);
  }
  return a1;
}

uint64_t destroy for AttributionListSnippetModel(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569800A0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(a1, v4);
  v5 = a1 + *(int *)(a2 + 20);
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569800A8);
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 8))(v5, v6);
}

uint64_t initializeWithCopy for AttributionListSnippetModel(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569800A0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(a1, a2, v6);
  v7 = *(int *)(a3 + 20);
  v8 = a1 + v7;
  v9 = a2 + v7;
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569800A8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 16))(v8, v9, v10);
  return a1;
}

uint64_t assignWithCopy for AttributionListSnippetModel(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569800A0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 24))(a1, a2, v6);
  v7 = *(int *)(a3 + 20);
  v8 = a1 + v7;
  v9 = a2 + v7;
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569800A8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 24))(v8, v9, v10);
  return a1;
}

uint64_t initializeWithTake for AttributionListSnippetModel(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569800A0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 32))(a1, a2, v6);
  v7 = *(int *)(a3 + 20);
  v8 = a1 + v7;
  v9 = a2 + v7;
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569800A8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 32))(v8, v9, v10);
  return a1;
}

uint64_t assignWithTake for AttributionListSnippetModel(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569800A0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 40))(a1, a2, v6);
  v7 = *(int *)(a3 + 20);
  v8 = a1 + v7;
  v9 = a2 + v7;
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569800A8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 40))(v8, v9, v10);
  return a1;
}

uint64_t getEnumTagSinglePayload for AttributionListSnippetModel()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_23A47E4B4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569800A0);
  if (*(_DWORD *)(*(_QWORD *)(v6 - 8) + 84) == (_DWORD)a2)
  {
    v7 = v6;
    v8 = a1;
  }
  else
  {
    v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569800A8);
    v8 = a1 + *(int *)(a3 + 20);
  }
  return __swift_getEnumTagSinglePayload(v8, a2, v7);
}

uint64_t storeEnumTagSinglePayload for AttributionListSnippetModel()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_23A47E530(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569800A0);
  if (*(_DWORD *)(*(_QWORD *)(v8 - 8) + 84) == a3)
  {
    v9 = v8;
    v10 = a1;
  }
  else
  {
    v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569800A8);
    v10 = a1 + *(int *)(a4 + 20);
  }
  return __swift_storeEnumTagSinglePayload(v10, a2, a2, v9);
}

void sub_23A47E5A8()
{
  unint64_t v0;
  unint64_t v1;

  sub_23A47E62C();
  if (v0 <= 0x3F)
  {
    sub_23A47E684();
    if (v1 <= 0x3F)
      swift_initStructMetadata();
  }
}

void sub_23A47E62C()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_256980388)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256980098);
    v0 = sub_23A4AA384();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_256980388);
  }
}

void sub_23A47E684()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_256980390)
  {
    v0 = sub_23A4AA384();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_256980390);
  }
}

uint64_t storeEnumTagSinglePayload for AttributionListSnippetModel.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_23A47E718 + 4 * byte_23A4AB515[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_23A47E74C + 4 * asc_23A4AB510[v4]))();
}

uint64_t sub_23A47E74C(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_23A47E754(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x23A47E75CLL);
  return result;
}

uint64_t sub_23A47E768(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x23A47E770);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_23A47E774(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23A47E77C(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for AttributionListSnippetModel.CodingKeys()
{
  return &type metadata for AttributionListSnippetModel.CodingKeys;
}

unint64_t sub_23A47E79C()
{
  unint64_t result;

  result = qword_2569803C0;
  if (!qword_2569803C0)
  {
    result = MEMORY[0x23B84E2B0](&unk_23A4AB688, &type metadata for AttributionListSnippetModel.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2569803C0);
  }
  return result;
}

unint64_t sub_23A47E7DC()
{
  unint64_t result;

  result = qword_2569803C8;
  if (!qword_2569803C8)
  {
    result = MEMORY[0x23B84E2B0](&unk_23A4AB5F8, &type metadata for AttributionListSnippetModel.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2569803C8);
  }
  return result;
}

unint64_t sub_23A47E81C()
{
  unint64_t result;

  result = qword_2569803D0;
  if (!qword_2569803D0)
  {
    result = MEMORY[0x23B84E2B0](&unk_23A4AB620, &type metadata for AttributionListSnippetModel.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2569803D0);
  }
  return result;
}

void OUTLINED_FUNCTION_0_6()
{
  JUMPOUT(0x23B84E2B0);
}

uint64_t OUTLINED_FUNCTION_1_4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 152) + 8))(v0, v1);
}

uint64_t OUTLINED_FUNCTION_2_4()
{
  return type metadata accessor for AttributionListSnippetModel();
}

uint64_t OUTLINED_FUNCTION_5_2(uint64_t a1)
{
  return *(_QWORD *)a1;
}

void *OUTLINED_FUNCTION_6_2()
{
  return malloc(0x28uLL);
}

uint64_t OUTLINED_FUNCTION_7_2()
{
  return sub_23A4AA360();
}

uint64_t OUTLINED_FUNCTION_9_1()
{
  return sub_23A4AAA98();
}

uint64_t OUTLINED_FUNCTION_10_1()
{
  return sub_23A4AAA44();
}

void sub_23A47E900(uint64_t a1@<X0>, unint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  CodableMessage.init(serializedData:)(a1, a2, a3, a4, a5);
}

void CodableMessage.init(serializedData:)(uint64_t a1@<X0>, unint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t AssociatedTypeWitness;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  _QWORD v16[2];
  uint64_t v17;
  __int128 v18;
  __int128 v19;
  uint64_t v20;
  uint64_t v21;

  v16[1] = a5;
  sub_23A4AA684();
  ((void (*)(void))MEMORY[0x24BDAC7A8])();
  OUTLINED_FUNCTION_4();
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v17 = *(_QWORD *)(AssociatedTypeWitness - 8);
  v10 = ((uint64_t (*)(void))MEMORY[0x24BDAC7A8])();
  v12 = (char *)v16 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v10);
  v14 = (char *)v16 - v13;
  swift_getAssociatedConformanceWitness();
  v18 = 0u;
  v19 = 0u;
  v20 = 0;
  sub_23A47EBB8(a1, a2);
  sub_23A4AA678();
  v15 = v21;
  sub_23A4AA690();
  if (v15)
  {
    OUTLINED_FUNCTION_4_3();
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v17 + 16))(v12, v14, AssociatedTypeWitness);
    (*(void (**)(char *, uint64_t, uint64_t))(a4 + 32))(v12, a3, a4);
    OUTLINED_FUNCTION_4_3();
    (*(void (**)(char *, uint64_t))(v17 + 8))(v14, AssociatedTypeWitness);
  }
  OUTLINED_FUNCTION_0();
}

uint64_t sub_23A47EAB8(uint64_t a1, uint64_t a2)
{
  return CodableMessage.serializedData()(a1, a2);
}

uint64_t CodableMessage.serializedData()(uint64_t a1, uint64_t a2)
{
  uint64_t AssociatedTypeWitness;
  uint64_t v5;
  uint64_t v6;

  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v5 = *(_QWORD *)(AssociatedTypeWitness - 8);
  MEMORY[0x24BDAC7A8](AssociatedTypeWitness);
  (*(void (**)(uint64_t, uint64_t))(a2 + 24))(a1, a2);
  swift_getAssociatedConformanceWitness();
  v6 = sub_23A4AA69C();
  OUTLINED_FUNCTION_3_4(*(uint64_t (**)(uint64_t, uint64_t))(v5 + 8));
  return v6;
}

uint64_t sub_23A47EBB8(uint64_t a1, unint64_t a2)
{
  uint64_t result;

  if (a2 >> 62 != 1)
  {
    if (a2 >> 62 != 2)
      return result;
    swift_retain();
  }
  return swift_retain();
}

uint64_t sub_23A47EBFC()
{
  return 1;
}

uint64_t sub_23A47EC04()
{
  return sub_23A4AAAD4();
}

uint64_t sub_23A47EC28(uint64_t a1, uint64_t a2)
{
  char v3;
  char v4;

  if (a1 == 0x7A696C6169726573 && a2 == 0xEF6F746F72506465)
  {
    swift_bridgeObjectRelease();
    v4 = 0;
  }
  else
  {
    v3 = sub_23A4AAAB0();
    swift_bridgeObjectRelease();
    v4 = v3 ^ 1;
  }
  return v4 & 1;
}

uint64_t sub_23A47ECC4()
{
  sub_23A4AAAC8();
  sub_23A4AAAD4();
  return sub_23A4AAAE0();
}

uint64_t sub_23A47ED04()
{
  return 0x7A696C6169726573;
}

uint64_t sub_23A47ED34()
{
  sub_23A4AAAC8();
  sub_23A4AAAD4();
  return sub_23A4AAAE0();
}

uint64_t sub_23A47ED74@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_23A47EC28(a1, a2);
  *a3 = result & 1;
  return result;
}

uint64_t sub_23A47ED9C()
{
  return sub_23A4728E0();
}

uint64_t sub_23A47EDB4@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = sub_23A47EBFC();
  *a1 = result & 1;
  return result;
}

uint64_t sub_23A47EDDC()
{
  sub_23A47EF90();
  return sub_23A4AAB04();
}

uint64_t sub_23A47EE04()
{
  sub_23A47EF90();
  return sub_23A4AAB10();
}

void Decodable<>.init(from:)(_QWORD *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v4;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  v6 = *(_QWORD *)(a2 - 8);
  MEMORY[0x24BDAC7A8](a1);
  OUTLINED_FUNCTION_4();
  v9 = v8 - v7;
  v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569803D8);
  MEMORY[0x24BDAC7A8](v15);
  OUTLINED_FUNCTION_4();
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_23A47EF90();
  sub_23A4AAAEC();
  if (!v4)
  {
    sub_23A47EFCC();
    sub_23A4AAA44();
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(a3 + 40))(v13, v14, a2, a3);
    OUTLINED_FUNCTION_2_5();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v6 + 32))(a4, v9, a2);
  }
  __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  OUTLINED_FUNCTION_0();
}

unint64_t sub_23A47EF90()
{
  unint64_t result;

  result = qword_2569803E0;
  if (!qword_2569803E0)
  {
    result = MEMORY[0x23B84E2B0](&unk_23A4AB824, &type metadata for CodableMessageCodingKeys);
    atomic_store(result, (unint64_t *)&qword_2569803E0);
  }
  return result;
}

unint64_t sub_23A47EFCC()
{
  unint64_t result;

  result = qword_2569803E8;
  if (!qword_2569803E8)
  {
    result = MEMORY[0x23B84E2B0](MEMORY[0x24BDCDE38], MEMORY[0x24BDCDDE8]);
    atomic_store(result, (unint64_t *)&qword_2569803E8);
  }
  return result;
}

void Encodable<>.encode(to:)(_QWORD *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569803F0);
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  OUTLINED_FUNCTION_4();
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_23A47EF90();
  sub_23A4AAAF8();
  v8 = (*(uint64_t (**)(uint64_t, uint64_t))(a3 + 48))(a2, a3);
  if (!v12)
  {
    v10 = v8;
    v11 = v9;
    sub_23A47F120();
    sub_23A4AAA98();
    sub_23A47C41C(v10, v11);
  }
  OUTLINED_FUNCTION_3_4(*(uint64_t (**)(uint64_t, uint64_t))(v7 + 8));
  OUTLINED_FUNCTION_0();
}

unint64_t sub_23A47F120()
{
  unint64_t result;

  result = qword_2569803F8;
  if (!qword_2569803F8)
  {
    result = MEMORY[0x23B84E2B0](MEMORY[0x24BDCDDF8], MEMORY[0x24BDCDDE8]);
    atomic_store(result, (unint64_t *)&qword_2569803F8);
  }
  return result;
}

uint64_t dispatch thunk of CodableMessage.proto.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 24))();
}

uint64_t dispatch thunk of CodableMessage.init(proto:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 32))();
}

uint64_t dispatch thunk of CodableMessage.init(serializedData:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 40))();
}

uint64_t dispatch thunk of CodableMessage.serializedData()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 48))();
}

uint64_t getEnumTagSinglePayload for CodableMessageCodingKeys(unsigned int *a1, int a2)
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

uint64_t storeEnumTagSinglePayload for CodableMessageCodingKeys(uint64_t a1, int a2, int a3)
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
    return ((uint64_t (*)(void))((char *)sub_23A47F230 + 4 * byte_23A4AB710[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_23A47F250 + 4 * byte_23A4AB715[v4]))();
}

_BYTE *sub_23A47F230(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_23A47F250(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_23A47F258(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_23A47F260(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_23A47F268(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_23A47F270(_DWORD *result)
{
  *result = 0;
  return result;
}

uint64_t sub_23A47F27C()
{
  return 0;
}

ValueMetadata *type metadata accessor for CodableMessageCodingKeys()
{
  return &type metadata for CodableMessageCodingKeys;
}

unint64_t sub_23A47F298()
{
  unint64_t result;

  result = qword_256980400;
  if (!qword_256980400)
  {
    result = MEMORY[0x23B84E2B0](&unk_23A4AB7FC, &type metadata for CodableMessageCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256980400);
  }
  return result;
}

unint64_t sub_23A47F2D8()
{
  unint64_t result;

  result = qword_256980408;
  if (!qword_256980408)
  {
    result = MEMORY[0x23B84E2B0](&unk_23A4AB76C, &type metadata for CodableMessageCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256980408);
  }
  return result;
}

unint64_t sub_23A47F318()
{
  unint64_t result;

  result = qword_256980410;
  if (!qword_256980410)
  {
    result = MEMORY[0x23B84E2B0](&unk_23A4AB794, &type metadata for CodableMessageCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256980410);
  }
  return result;
}

void sub_23A47F354(uint64_t a1@<X0>, unint64_t a2@<X1>, uint64_t a3@<X8>)
{
  sub_23A4A6350(a1, a2, a3);
}

uint64_t sub_23A47F368()
{
  return sub_23A4A6584();
}

void sub_23A47F37C(uint64_t a1@<X0>, unint64_t a2@<X1>, uint64_t a3@<X8>)
{
  sub_23A4A62F8(a1, a2, a3);
}

uint64_t sub_23A47F390()
{
  return sub_23A4A652C();
}

void sub_23A47F3A4(uint64_t a1@<X0>, unint64_t a2@<X1>, uint64_t a3@<X8>)
{
  sub_23A4A6324(a1, a2, a3);
}

uint64_t sub_23A47F3B8()
{
  return sub_23A4A6558();
}

void sub_23A47F3CC(uint64_t a1@<X0>, unint64_t a2@<X1>, uint64_t a3@<X8>)
{
  sub_23A4A63D4(a1, a2, a3);
}

uint64_t sub_23A47F3E0()
{
  return sub_23A4A6608();
}

void sub_23A47F3F4(uint64_t a1@<X0>, unint64_t a2@<X1>, uint64_t a3@<X8>)
{
  sub_23A4A637C(a1, a2, a3);
}

uint64_t sub_23A47F408()
{
  return sub_23A4A65B0();
}

void sub_23A47F41C(uint64_t a1@<X0>, unint64_t a2@<X1>, uint64_t a3@<X8>)
{
  sub_23A4A63A8(a1, a2, a3);
}

uint64_t sub_23A47F430()
{
  return sub_23A4A65DC();
}

uint64_t OUTLINED_FUNCTION_2_5()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, _QWORD))(v1 + 8))(v0, *(_QWORD *)(v2 - 72));
}

uint64_t OUTLINED_FUNCTION_3_4@<X0>(uint64_t (*a1)(uint64_t, uint64_t)@<X8>)
{
  uint64_t v1;
  uint64_t v2;

  return a1(v2, v1);
}

uint64_t OUTLINED_FUNCTION_4_3()
{
  unint64_t v0;
  uint64_t v1;

  return sub_23A47C41C(v1, v0);
}

void TipSnippetModel.init(tip:context:)(void *a1@<X0>, __int128 *a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void (*v19)(uint64_t);
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void (*v24)(uint64_t);
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  __int128 v31;
  __int128 v32;
  uint64_t v33;
  uint64_t v34;

  v28 = __swift_instantiateConcreteTypeFromMangledName(&qword_256980418);
  v6 = MEMORY[0x24BDAC7A8](v28);
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)&v25 - v7;
  v31 = *a2;
  v9 = *((_QWORD *)a2 + 2);
  v29 = *((_QWORD *)a2 + 3);
  v30 = v9;
  v10 = type metadata accessor for TipSnippetModel(0);
  v32 = 0uLL;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256980420);
  OUTLINED_FUNCTION_24_0();
  v27 = a3 + *(int *)(v10 + 32);
  v26 = type metadata accessor for TipSnippetModel.AssetConfiguration(0);
  __swift_storeEnumTagSinglePayload((uint64_t)v8, 1, 1, v26);
  sub_23A4817F8();
  sub_23A4AA354();
  sub_23A47F77C((uint64_t)v8);
  v11 = objc_msgSend(a1, sel_identifier);
  v12 = sub_23A4AA7C8();
  v14 = v13;

  *(_QWORD *)&v32 = v12;
  *((_QWORD *)&v32 + 1) = v14;
  sub_23A4AA354();
  v15 = sub_23A481798(a1);
  v17 = v16;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2569800E0);
  v18 = OUTLINED_FUNCTION_42_0();
  v19(v18);
  *(_QWORD *)&v32 = v15;
  *((_QWORD *)&v32 + 1) = v17;
  OUTLINED_FUNCTION_24_0();
  *(_QWORD *)&v32 = TPSTip.bodyContentOrText.getter();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256980428);
  sub_23A4AA354();
  v20 = objc_msgSend(a1, sel_language);
  v21 = sub_23A4AA7C8();
  v23 = v22;

  *(_QWORD *)&v32 = v21;
  *((_QWORD *)&v32 + 1) = v23;
  sub_23A4AA354();
  sub_23A4A1AA4((uint64_t)v8);
  __swift_storeEnumTagSinglePayload((uint64_t)v8, 0, 1, v26);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2569800F0);
  OUTLINED_FUNCTION_15_0();
  v24(v27);
  sub_23A4817F8();
  sub_23A4AA354();
  sub_23A47F77C((uint64_t)v8);
  v32 = v31;
  v33 = v30;
  v34 = v29;
  sub_23A4AA354();

}

uint64_t type metadata accessor for TipSnippetModel(uint64_t a1)
{
  return sub_23A47F74C(a1, (uint64_t *)&unk_256980508);
}

uint64_t type metadata accessor for TipSnippetModel.AssetConfiguration(uint64_t a1)
{
  return sub_23A47F74C(a1, (uint64_t *)&unk_2569805C8);
}

uint64_t sub_23A47F74C(uint64_t a1, uint64_t *a2)
{
  uint64_t result;

  result = *a2;
  if (!*a2)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_23A47F77C(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_256980418);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_23A47F7BC(unsigned __int8 a1)
{
  sub_23A4AAAC8();
  sub_23A4813D0(a1);
  sub_23A4AA7F8();
  swift_bridgeObjectRelease();
  return sub_23A4AAAE0();
}

void sub_23A47F81C()
{
  OUTLINED_FUNCTION_23_0();
}

void sub_23A47F834()
{
  OUTLINED_FUNCTION_23_0();
}

void sub_23A47F84C()
{
  OUTLINED_FUNCTION_33_0();
  OUTLINED_FUNCTION_45_0();
  OUTLINED_FUNCTION_30_0();
  OUTLINED_FUNCTION_29_0();
  OUTLINED_FUNCTION_10_2();
}

void sub_23A47F874()
{
  OUTLINED_FUNCTION_45_0();
  OUTLINED_FUNCTION_37_0();
  OUTLINED_FUNCTION_29_0();
  OUTLINED_FUNCTION_10_2();
}

void sub_23A47F89C()
{
  sub_23A4AAAD4();
  OUTLINED_FUNCTION_60();
}

uint64_t sub_23A47F8BC(uint64_t a1, unsigned __int8 a2)
{
  sub_23A4813D0(a2);
  sub_23A4AA7F8();
  return swift_bridgeObjectRelease();
}

uint64_t sub_23A47F8FC()
{
  return OUTLINED_FUNCTION_19_0();
}

uint64_t sub_23A47F914()
{
  return OUTLINED_FUNCTION_19_0();
}

void sub_23A47F92C()
{
  OUTLINED_FUNCTION_18_1();
}

void sub_23A47F944()
{
  OUTLINED_FUNCTION_18_1();
}

void sub_23A47F95C()
{
  sub_23A4AAAC8();
  OUTLINED_FUNCTION_30_0();
  OUTLINED_FUNCTION_29_0();
  OUTLINED_FUNCTION_10_2();
}

uint64_t sub_23A47F98C(uint64_t a1, unsigned __int8 a2)
{
  sub_23A4AAAC8();
  sub_23A4813D0(a2);
  sub_23A4AA7F8();
  swift_bridgeObjectRelease();
  return sub_23A4AAAE0();
}

void sub_23A47F9E8()
{
  sub_23A4AAAC8();
  OUTLINED_FUNCTION_37_0();
  OUTLINED_FUNCTION_29_0();
  OUTLINED_FUNCTION_10_2();
}

void TipSnippetModel.AssetConfiguration.lightThumbnailURL.getter()
{
  sub_23A4817F8();
}

uint64_t TipSnippetModel.AssetConfiguration.lightThumbnailURL.setter(uint64_t a1)
{
  uint64_t v1;

  return sub_23A481820(a1, v1);
}

uint64_t (*TipSnippetModel.AssetConfiguration.lightThumbnailURL.modify())()
{
  return nullsub_1;
}

void TipSnippetModel.AssetConfiguration.darkThumbnailURL.getter()
{
  type metadata accessor for TipSnippetModel.AssetConfiguration(0);
  sub_23A4817F8();
  OUTLINED_FUNCTION_60();
}

uint64_t TipSnippetModel.AssetConfiguration.darkThumbnailURL.setter(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;

  v3 = v1 + *(int *)(type metadata accessor for TipSnippetModel.AssetConfiguration(0) + 20);
  return sub_23A481820(a1, v3);
}

uint64_t (*TipSnippetModel.AssetConfiguration.darkThumbnailURL.modify())()
{
  type metadata accessor for TipSnippetModel.AssetConfiguration(0);
  return nullsub_1;
}

double TipSnippetModel.AssetConfiguration.heightToWidthRatio.getter()
{
  uint64_t v0;

  return *(double *)(v0 + *(int *)(type metadata accessor for TipSnippetModel.AssetConfiguration(0) + 24));
}

uint64_t TipSnippetModel.AssetConfiguration.heightToWidthRatio.setter(double a1)
{
  uint64_t v1;
  uint64_t result;

  result = type metadata accessor for TipSnippetModel.AssetConfiguration(0);
  *(double *)(v1 + *(int *)(result + 24)) = a1;
  return result;
}

uint64_t (*TipSnippetModel.AssetConfiguration.heightToWidthRatio.modify())()
{
  type metadata accessor for TipSnippetModel.AssetConfiguration(0);
  return nullsub_1;
}

uint64_t sub_23A47FB54(uint64_t a1, uint64_t a2)
{
  char v5;

  if (a1 == 0xD000000000000011 && a2 == 0x800000023A4AEB90 || (sub_23A4AAAB0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0xD000000000000010 && a2 == 0x800000023A4AEBB0 || (sub_23A4AAAB0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0xD000000000000012 && a2 == 0x800000023A4AEBD0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else
  {
    v5 = sub_23A4AAAB0();
    swift_bridgeObjectRelease();
    if ((v5 & 1) != 0)
      return 2;
    else
      return 3;
  }
}

uint64_t sub_23A47FC90()
{
  return 3;
}

unint64_t sub_23A47FC98(char a1)
{
  if (!a1)
    return 0xD000000000000011;
  if (a1 == 1)
    return 0xD000000000000010;
  return 0xD000000000000012;
}

unint64_t sub_23A47FCF4()
{
  char *v0;

  return sub_23A47FC98(*v0);
}

uint64_t sub_23A47FCFC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_23A47FB54(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_23A47FD20@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = sub_23A47FC90();
  *a1 = result;
  return result;
}

uint64_t sub_23A47FD44()
{
  sub_23A481868();
  return sub_23A4AAB04();
}

uint64_t sub_23A47FD6C()
{
  sub_23A481868();
  return sub_23A4AAB10();
}

void TipSnippetModel.AssetConfiguration.encode(to:)(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_256980438);
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  OUTLINED_FUNCTION_4_2();
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_23A481868();
  sub_23A4AAAF8();
  sub_23A4A9F40();
  sub_23A4818A4(&qword_256980448, (void (*)(uint64_t))MEMORY[0x24BDCDAC0]);
  OUTLINED_FUNCTION_13_2();
  if (!v1)
  {
    OUTLINED_FUNCTION_34_0();
    OUTLINED_FUNCTION_13_2();
    sub_23A4AAA8C();
  }
  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v2, v4);
  OUTLINED_FUNCTION_0();
}

void TipSnippetModel.AssetConfiguration.init(from:)(_QWORD *a1@<X0>, uint64_t a2@<X8>)
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
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  char *v28;
  uint64_t v29;
  uint64_t v30;
  char v31;
  char v32;
  char v33;

  v24 = a2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256980430);
  OUTLINED_FUNCTION_0_1();
  MEMORY[0x24BDAC7A8](v4);
  OUTLINED_FUNCTION_40_0();
  v26 = v5;
  MEMORY[0x24BDAC7A8](v6);
  v28 = (char *)&v22 - v7;
  v29 = __swift_instantiateConcreteTypeFromMangledName(&qword_256980450);
  v25 = *(_QWORD *)(v29 - 8);
  MEMORY[0x24BDAC7A8](v29);
  OUTLINED_FUNCTION_4_2();
  v8 = OUTLINED_FUNCTION_34_0();
  OUTLINED_FUNCTION_0_1();
  MEMORY[0x24BDAC7A8](v9);
  OUTLINED_FUNCTION_4();
  v12 = v11 - v10;
  sub_23A4A9F40();
  OUTLINED_FUNCTION_31_0(v12);
  v13 = v12 + *(int *)(v8 + 20);
  OUTLINED_FUNCTION_31_0(v13);
  v14 = *(int *)(v8 + 24);
  *(_QWORD *)(v12 + v14) = 0x3FF0000000000000;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_23A481868();
  v27 = v2;
  v15 = v30;
  sub_23A4AAAEC();
  if (!v15)
  {
    v23 = v13;
    v30 = v14;
    v16 = v26;
    v33 = 0;
    sub_23A4818A4(&qword_256980458, (void (*)(uint64_t))MEMORY[0x24BDCDAC0]);
    v17 = (uint64_t)v28;
    v18 = v27;
    sub_23A4AAA20();
    sub_23A481820(v17, v12);
    v32 = 1;
    sub_23A4AAA20();
    sub_23A481820(v16, v23);
    v31 = 2;
    v19 = v29;
    sub_23A4AAA38();
    v21 = v20;
    (*(void (**)(uint64_t, uint64_t))(v25 + 8))(v18, v19);
    *(_QWORD *)(v12 + v30) = v21;
    sub_23A481918();
  }
  __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  sub_23A481940(v12, (void (*)(_QWORD))type metadata accessor for TipSnippetModel.AssetConfiguration);
}

void sub_23A480184(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  TipSnippetModel.AssetConfiguration.init(from:)(a1, a2);
}

void sub_23A480198(_QWORD *a1)
{
  TipSnippetModel.AssetConfiguration.encode(to:)(a1);
}

uint64_t TipSnippetModel.identifier.getter()
{
  uint64_t v1;

  __swift_instantiateConcreteTypeFromMangledName(&qword_2569800D8);
  OUTLINED_FUNCTION_28_0();
  return v1;
}

uint64_t sub_23A4801D8()
{
  swift_bridgeObjectRetain();
  return TipSnippetModel.identifier.setter();
}

uint64_t TipSnippetModel.identifier.setter()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_2569800D8);
  return OUTLINED_FUNCTION_11_1();
}

void TipSnippetModel.identifier.modify()
{
  _QWORD *v0;
  _QWORD *v1;

  v1 = OUTLINED_FUNCTION_6_2();
  *v0 = v1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2569800D8);
  v1[4] = OUTLINED_FUNCTION_7_2();
  OUTLINED_FUNCTION_5();
}

void TipSnippetModel.title.getter()
{
  type metadata accessor for TipSnippetModel(0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2569800E0);
  OUTLINED_FUNCTION_28_0();
  OUTLINED_FUNCTION_21_1();
}

void sub_23A4802BC()
{
  swift_bridgeObjectRetain();
  TipSnippetModel.title.setter();
}

void TipSnippetModel.title.setter()
{
  OUTLINED_FUNCTION_52_0();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2569800E0);
  OUTLINED_FUNCTION_11_1();
  OUTLINED_FUNCTION_21_1();
}

void TipSnippetModel.title.modify()
{
  uint64_t v0;
  void *v1;

  v1 = OUTLINED_FUNCTION_6_2();
  OUTLINED_FUNCTION_0_7((uint64_t)v1);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2569800E0);
  *(_QWORD *)(v0 + 32) = OUTLINED_FUNCTION_7_2();
  OUTLINED_FUNCTION_5();
}

uint64_t TipSnippetModel.bodyContent.getter()
{
  uint64_t v1;

  OUTLINED_FUNCTION_8_3();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2569800E8);
  sub_23A4AA36C();
  return v1;
}

void sub_23A4803AC()
{
  swift_bridgeObjectRetain();
  TipSnippetModel.bodyContent.setter();
}

void TipSnippetModel.bodyContent.setter()
{
  OUTLINED_FUNCTION_8_3();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2569800E8);
  sub_23A4AA378();
  OUTLINED_FUNCTION_21_1();
}

void TipSnippetModel.bodyContent.modify()
{
  uint64_t v0;
  void *v1;

  v1 = OUTLINED_FUNCTION_6_2();
  OUTLINED_FUNCTION_0_7((uint64_t)v1);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2569800E8);
  *(_QWORD *)(v0 + 32) = OUTLINED_FUNCTION_7_2();
  OUTLINED_FUNCTION_5();
}

void TipSnippetModel.language.getter()
{
  type metadata accessor for TipSnippetModel(0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2569800D8);
  OUTLINED_FUNCTION_28_0();
  OUTLINED_FUNCTION_21_1();
}

void sub_23A48048C()
{
  swift_bridgeObjectRetain();
  TipSnippetModel.language.setter();
}

void TipSnippetModel.language.setter()
{
  OUTLINED_FUNCTION_52_0();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2569800D8);
  OUTLINED_FUNCTION_11_1();
  OUTLINED_FUNCTION_21_1();
}

void TipSnippetModel.language.modify()
{
  uint64_t v0;
  void *v1;

  v1 = OUTLINED_FUNCTION_6_2();
  OUTLINED_FUNCTION_0_7((uint64_t)v1);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2569800D8);
  *(_QWORD *)(v0 + 32) = OUTLINED_FUNCTION_7_2();
  OUTLINED_FUNCTION_5();
}

void TipSnippetModel.thumbnailAssetConfiguration.getter()
{
  OUTLINED_FUNCTION_48_0();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2569800F0);
  sub_23A4AA36C();
  OUTLINED_FUNCTION_60();
}

uint64_t sub_23A480574()
{
  uint64_t v0;
  uint64_t v1;
  char *v2;
  uint64_t v4;

  v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_256980418);
  MEMORY[0x24BDAC7A8](v0);
  v2 = (char *)&v4 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23A4817F8();
  return TipSnippetModel.thumbnailAssetConfiguration.setter((uint64_t)v2);
}

uint64_t TipSnippetModel.thumbnailAssetConfiguration.setter(uint64_t a1)
{
  uint64_t v2;

  __swift_instantiateConcreteTypeFromMangledName(&qword_256980418);
  OUTLINED_FUNCTION_0_1();
  MEMORY[0x24BDAC7A8](v2);
  OUTLINED_FUNCTION_4_2();
  sub_23A4817F8();
  type metadata accessor for TipSnippetModel(0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2569800F0);
  sub_23A4AA378();
  return sub_23A47F77C(a1);
}

void TipSnippetModel.thumbnailAssetConfiguration.modify()
{
  uint64_t v0;
  void *v1;

  v1 = OUTLINED_FUNCTION_6_2();
  OUTLINED_FUNCTION_0_7((uint64_t)v1);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2569800F0);
  *(_QWORD *)(v0 + 32) = OUTLINED_FUNCTION_7_2();
  OUTLINED_FUNCTION_5();
}

void TipSnippetModel.context.getter()
{
  OUTLINED_FUNCTION_48_0();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2569800A8);
  sub_23A4AA36C();
  OUTLINED_FUNCTION_60();
}

double sub_23A4806F8@<D0>(uint64_t a1@<X8>)
{
  double result;
  __int128 v3;
  uint64_t v4;
  uint64_t v5;

  TipSnippetModel.context.getter();
  result = *(double *)&v3;
  *(_OWORD *)a1 = v3;
  *(_QWORD *)(a1 + 16) = v4;
  *(_QWORD *)(a1 + 24) = v5;
  return result;
}

uint64_t sub_23A480738()
{
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return TipSnippetModel.context.setter();
}

uint64_t TipSnippetModel.context.setter()
{
  type metadata accessor for TipSnippetModel(0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2569800A8);
  return OUTLINED_FUNCTION_11_1();
}

void TipSnippetModel.context.modify()
{
  uint64_t v0;
  void *v1;

  v1 = OUTLINED_FUNCTION_6_2();
  OUTLINED_FUNCTION_0_7((uint64_t)v1);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2569800A8);
  *(_QWORD *)(v0 + 32) = OUTLINED_FUNCTION_7_2();
  OUTLINED_FUNCTION_5();
}

void TipSnippetModel.init(from:)(_QWORD *a1@<X0>, uint64_t a2@<X8>)
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
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  _QWORD *v22;
  uint64_t v23;
  void (*v24)(uint64_t);
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void (*v30)(uint64_t);
  __int128 v31;
  void *v32;
  void *v33;
  id v34;
  id v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  void *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  _DWORD v45[2];
  char *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  _QWORD *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  __int128 v59;
  uint64_t v60;
  uint64_t v61;
  __int128 v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;

  v50 = a2;
  v65 = *MEMORY[0x24BDAC8D0];
  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_256980460);
  v52 = *(_QWORD *)(v3 - 8);
  v53 = v3;
  MEMORY[0x24BDAC7A8](v3);
  OUTLINED_FUNCTION_4();
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_256980418);
  OUTLINED_FUNCTION_0_1();
  MEMORY[0x24BDAC7A8](v5);
  OUTLINED_FUNCTION_40_0();
  v51 = v6;
  v8 = MEMORY[0x24BDAC7A8](v7);
  MEMORY[0x24BDAC7A8](v8);
  v10 = (char *)v45 - v9;
  v11 = type metadata accessor for TipSnippetModel(0);
  OUTLINED_FUNCTION_0_1();
  MEMORY[0x24BDAC7A8](v12);
  OUTLINED_FUNCTION_4();
  v15 = v14 - v13;
  v17 = v14 - v13 + *(int *)(v16 + 20);
  v62 = 0uLL;
  v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_256980420);
  v57 = v17;
  sub_23A4AA354();
  v55 = v11;
  v19 = *(int *)(v11 + 32);
  v58 = v15;
  v20 = v15 + v19;
  v21 = OUTLINED_FUNCTION_34_0();
  __swift_storeEnumTagSinglePayload((uint64_t)v10, 1, 1, v21);
  sub_23A4817F8();
  v56 = v20;
  sub_23A4AA354();
  sub_23A47F77C((uint64_t)v10);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_23A4818DC();
  v22 = v54;
  sub_23A4AAAEC();
  if (!v22)
  {
    v48 = v21;
    v49 = v18;
    v47 = v4;
    v54 = a1;
    LOBYTE(v62) = 0;
    v23 = sub_23A4AAA2C();
    v46 = v10;
    *(_QWORD *)&v62 = v23;
    *((_QWORD *)&v62 + 1) = v26;
    sub_23A4AA354();
    LOBYTE(v62) = 1;
    v27 = sub_23A4AAA2C();
    v29 = v28;
    v45[1] = 1;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2569800E0);
    OUTLINED_FUNCTION_15_0();
    v30(v57);
    *(_QWORD *)&v62 = v27;
    *((_QWORD *)&v62 + 1) = v29;
    sub_23A4AA354();
    LOBYTE(v59) = 2;
    sub_23A47EFCC();
    OUTLINED_FUNCTION_35_0();
    v31 = v62;
    v32 = (void *)objc_opt_self();
    v49 = v31;
    v33 = (void *)sub_23A4A9F4C();
    *(_QWORD *)&v59 = 0;
    v34 = OUTLINED_FUNCTION_38_0(v32, sel_JSONObjectWithData_options_error_);

    v35 = (id)v59;
    v36 = (uint64_t)v54;
    if (v34)
    {
      sub_23A4AA924();
      swift_unknownObjectRelease();
      __swift_instantiateConcreteTypeFromMangledName(&qword_256980428);
      if (swift_dynamicCast())
      {
        v37 = v59;
LABEL_10:
        *(_QWORD *)&v62 = v37;
        __swift_instantiateConcreteTypeFromMangledName(&qword_256980428);
        sub_23A4AA354();
        sub_23A47C41C(v49, *((unint64_t *)&v31 + 1));
        LOBYTE(v62) = 3;
        *(_QWORD *)&v62 = sub_23A4AAA2C();
        *((_QWORD *)&v62 + 1) = v40;
        sub_23A4AA354();
        LOBYTE(v62) = 4;
        sub_23A4818A4(&qword_256980478, (void (*)(uint64_t))type metadata accessor for TipSnippetModel.AssetConfiguration);
        v41 = v51;
        v42 = v48;
        OUTLINED_FUNCTION_35_0();
        __swift_storeEnumTagSinglePayload(v41, 0, 1, v42);
        v43 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569800F0);
        OUTLINED_FUNCTION_20_1(v43);
        sub_23A4817F8();
        sub_23A4AA354();
        sub_23A47F77C(v41);
        LOBYTE(v59) = 5;
        sub_23A47DC3C();
        OUTLINED_FUNCTION_35_0();
        v44 = v58;
        v59 = v62;
        v60 = v63;
        v61 = v64;
        sub_23A4AA354();
        OUTLINED_FUNCTION_27_0();
        sub_23A481918();
        __swift_destroy_boxed_opaque_existential_1(v36);
        sub_23A481940(v44, (void (*)(_QWORD))type metadata accessor for TipSnippetModel);
        goto LABEL_4;
      }
    }
    else
    {
      v38 = v35;
      v39 = (void *)sub_23A4A9E98();

      swift_willThrow();
    }
    __swift_instantiateConcreteTypeFromMangledName(&qword_256980470);
    v37 = OUTLINED_FUNCTION_51_0();
    *(_OWORD *)(v37 + 16) = xmmword_23A4AB880;
    *(_QWORD *)(v37 + 32) = sub_23A4AA774();
    goto LABEL_10;
  }
  __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2569800E0);
  OUTLINED_FUNCTION_15_0();
  v24(v57);
  v25 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569800F0);
  OUTLINED_FUNCTION_20_1(v25);
LABEL_4:
  OUTLINED_FUNCTION_0();
}

void TipSnippetModel.encode(to:)(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  uint64_t v15;

  __swift_instantiateConcreteTypeFromMangledName(&qword_256980418);
  OUTLINED_FUNCTION_0_1();
  MEMORY[0x24BDAC7A8](v3);
  OUTLINED_FUNCTION_4();
  v6 = v5 - v4;
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_256980480);
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7);
  OUTLINED_FUNCTION_4_2();
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_23A4818DC();
  sub_23A4AAAF8();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2569800D8);
  sub_23A4AA36C();
  OUTLINED_FUNCTION_36_0();
  sub_23A4AAA80();
  if (v15)
  {
    OUTLINED_FUNCTION_32_0(*(uint64_t (**)(uint64_t, uint64_t))(v8 + 8));
    OUTLINED_FUNCTION_22_1();
  }
  else
  {
    OUTLINED_FUNCTION_22_1();
    type metadata accessor for TipSnippetModel(0);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2569800E0);
    OUTLINED_FUNCTION_39_0();
    __swift_instantiateConcreteTypeFromMangledName(&qword_256980420);
    sub_23A48196C();
    OUTLINED_FUNCTION_9_2();
    OUTLINED_FUNCTION_22_1();
    v9 = (void *)objc_opt_self();
    __swift_instantiateConcreteTypeFromMangledName(&qword_2569800E8);
    OUTLINED_FUNCTION_39_0();
    __swift_instantiateConcreteTypeFromMangledName(&qword_256980278);
    OUTLINED_FUNCTION_41_0();
    v10 = (void *)sub_23A4AA84C();
    swift_bridgeObjectRelease();
    v11 = OUTLINED_FUNCTION_38_0(v9, sel_dataWithJSONObject_options_error_);

    v12 = 0;
    if (v11)
    {
      sub_23A4A9F58();

      sub_23A47F120();
      OUTLINED_FUNCTION_9_2();
      OUTLINED_FUNCTION_50_0();
    }
    else
    {
      v13 = v12;
      v14 = (void *)sub_23A4A9E98();

      swift_willThrow();
    }
    sub_23A4AA36C();
    OUTLINED_FUNCTION_36_0();
    sub_23A4AAA80();
    OUTLINED_FUNCTION_22_1();
    __swift_instantiateConcreteTypeFromMangledName(&qword_2569800F0);
    sub_23A4AA36C();
    sub_23A4819C8();
    OUTLINED_FUNCTION_9_2();
    sub_23A47F77C(v6);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2569800A8);
    OUTLINED_FUNCTION_39_0();
    sub_23A47DC78();
    OUTLINED_FUNCTION_9_2();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v1, v7);
  }
  OUTLINED_FUNCTION_0();
}

uint64_t sub_23A48137C()
{
  unint64_t v0;

  v0 = sub_23A4AA9F0();
  swift_bridgeObjectRelease();
  if (v0 >= 6)
    return 6;
  else
    return v0;
}

uint64_t sub_23A4813C8()
{
  return 6;
}

uint64_t sub_23A4813D0(unsigned __int8 a1)
{
  return ((uint64_t (*)(unint64_t, unint64_t))((char *)sub_23A481408 + 4 * byte_23A4AB890[a1]))(0xD00000000000001BLL, 0x800000023A4AEA40);
}

uint64_t sub_23A481408()
{
  return 0x696669746E656469;
}

uint64_t sub_23A481424()
{
  return 0x656C746974;
}

uint64_t sub_23A481438()
{
  return 0x746E6F4379646F62;
}

uint64_t sub_23A48145C()
{
  return 0x65676175676E616CLL;
}

uint64_t sub_23A481474()
{
  return 0x747865746E6F63;
}

uint64_t sub_23A48148C(unsigned __int8 a1)
{
  return ((uint64_t (*)(unint64_t, unint64_t))((char *)sub_23A4814C4 + 4 * byte_23A4AB896[a1]))(0xD00000000000001BLL, 0x800000023A4AEA40);
}

uint64_t sub_23A4814C4()
{
  return 0x696669746E656469;
}

uint64_t sub_23A4814E0()
{
  return 0x656C746974;
}

uint64_t sub_23A4814F4()
{
  return 0x746E6F4379646F62;
}

uint64_t sub_23A481518()
{
  return 0x65676175676E616CLL;
}

uint64_t sub_23A481530()
{
  return 0x747865746E6F63;
}

uint64_t sub_23A481548(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return sub_23A498D84(*a1, *a2);
}

uint64_t sub_23A481554()
{
  unsigned __int8 *v0;

  return sub_23A47F7BC(*v0);
}

uint64_t sub_23A48155C(uint64_t a1)
{
  unsigned __int8 *v1;

  return sub_23A47F8BC(a1, *v1);
}

uint64_t sub_23A481564(uint64_t a1)
{
  unsigned __int8 *v1;

  return sub_23A47F98C(a1, *v1);
}

uint64_t sub_23A48156C@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = sub_23A48137C();
  *a1 = result;
  return result;
}

void sub_23A481598(uint64_t *a1@<X8>)
{
  unsigned __int8 *v1;
  uint64_t v3;

  *a1 = sub_23A4813D0(*v1);
  a1[1] = v3;
  OUTLINED_FUNCTION_60();
}

uint64_t sub_23A4815BC()
{
  unsigned __int8 *v0;

  return sub_23A48148C(*v0);
}

uint64_t sub_23A4815C4@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = sub_23A4813C4();
  *a1 = result;
  return result;
}

uint64_t sub_23A4815E8@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = sub_23A4813C8();
  *a1 = result;
  return result;
}

uint64_t sub_23A48160C()
{
  sub_23A4818DC();
  return sub_23A4AAB04();
}

uint64_t sub_23A481634()
{
  sub_23A4818DC();
  return sub_23A4AAB10();
}

void TipSnippetModel.altBodyRepresentation.getter()
{
  uint64_t v0;

  objc_opt_self();
  OUTLINED_FUNCTION_8_3();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2569800E8);
  sub_23A4AA36C();
  sub_23A4A1CFC(v0);
  OUTLINED_FUNCTION_44_0();
  sub_23A481A44();
}

void TipSnippetModel.punchOutUrl.getter()
{
  void *v0;
  void *v1;
  id v2;

  v0 = (void *)objc_opt_self();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2569800D8);
  OUTLINED_FUNCTION_28_0();
  v1 = (void *)sub_23A4AA7BC();
  swift_bridgeObjectRelease();
  v2 = objc_msgSend(v0, sel_URLWithTipIdentifier_collectionIdentifier_referrer_, v1, 0, 0);

  sub_23A4A9F28();
}

void sub_23A481768(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  TipSnippetModel.init(from:)(a1, a2);
}

void sub_23A48177C(_QWORD *a1)
{
  TipSnippetModel.encode(to:)(a1);
}

uint64_t sub_23A481790()
{
  return 0;
}

uint64_t sub_23A481798(void *a1)
{
  id v1;
  void *v2;
  uint64_t v3;

  v1 = objc_msgSend(a1, sel_title);
  if (!v1)
    return 0;
  v2 = v1;
  v3 = sub_23A4AA7C8();

  return v3;
}

void sub_23A4817F8()
{
  uint64_t *v0;
  uint64_t v1;

  OUTLINED_FUNCTION_33_0();
  v1 = __swift_instantiateConcreteTypeFromMangledName(v0);
  OUTLINED_FUNCTION_14_1(v1);
  OUTLINED_FUNCTION_60();
}

uint64_t sub_23A481820(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_256980430);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

unint64_t sub_23A481868()
{
  unint64_t result;

  result = qword_256980440;
  if (!qword_256980440)
  {
    result = MEMORY[0x23B84E2B0](&unk_23A4ABBF8, &type metadata for TipSnippetModel.AssetConfiguration.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256980440);
  }
  return result;
}

void sub_23A4818A4(unint64_t *a1, void (*a2)(uint64_t))
{
  uint64_t v3;

  if (!*a1)
  {
    a2(255);
    v3 = OUTLINED_FUNCTION_41_0();
    atomic_store(MEMORY[0x23B84E2B0](v3), a1);
  }
  OUTLINED_FUNCTION_60();
}

unint64_t sub_23A4818DC()
{
  unint64_t result;

  result = qword_256980468;
  if (!qword_256980468)
  {
    result = MEMORY[0x23B84E2B0](&unk_23A4ABBA8, &type metadata for TipSnippetModel.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256980468);
  }
  return result;
}

void sub_23A481918()
{
  uint64_t (*v0)(_QWORD);
  uint64_t v1;

  OUTLINED_FUNCTION_33_0();
  v1 = v0(0);
  OUTLINED_FUNCTION_14_1(v1);
  OUTLINED_FUNCTION_60();
}

void sub_23A481940(uint64_t a1, void (*a2)(_QWORD))
{
  uint64_t v2;
  void (*v3)(uint64_t);

  a2(0);
  v2 = OUTLINED_FUNCTION_43_0();
  v3(v2);
  OUTLINED_FUNCTION_60();
}

unint64_t sub_23A48196C()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;

  result = qword_256980488;
  if (!qword_256980488)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256980420);
    v2 = MEMORY[0x24BEE0D08];
    result = MEMORY[0x23B84E2B0](MEMORY[0x24BEE4AA8], v1, &v2);
    atomic_store(result, (unint64_t *)&qword_256980488);
  }
  return result;
}

unint64_t sub_23A4819C8()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  result = qword_256980490;
  if (!qword_256980490)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256980418);
    sub_23A4818A4(&qword_256980498, (void (*)(uint64_t))type metadata accessor for TipSnippetModel.AssetConfiguration);
    v3 = v2;
    result = MEMORY[0x23B84E2B0](MEMORY[0x24BEE4AA8], v1, &v3);
    atomic_store(result, (unint64_t *)&qword_256980490);
  }
  return result;
}

void sub_23A481A44()
{
  void *v0;
  void *v1;
  id v2;

  OUTLINED_FUNCTION_33_0();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256980640);
  OUTLINED_FUNCTION_41_0();
  sub_23A4AA84C();
  OUTLINED_FUNCTION_44_0();
  v2 = objc_msgSend(v0, sel_altTextRepresentationForContent_, v1);

  if (v2)
  {
    sub_23A4AA7C8();

  }
  OUTLINED_FUNCTION_5();
}

void sub_23A481AC8()
{
  sub_23A4818A4(&qword_2569804A0, (void (*)(uint64_t))type metadata accessor for TipSnippetModel);
}

void sub_23A481AF4()
{
  sub_23A4818A4(&qword_2569804A8, (void (*)(uint64_t))type metadata accessor for TipSnippetModel);
}

void sub_23A481B20()
{
  uint64_t *v0;
  uint64_t v1;

  OUTLINED_FUNCTION_49_0();
  *v0 = TipSnippetModel.identifier.getter();
  v0[1] = v1;
  OUTLINED_FUNCTION_60();
}

void sub_23A481B44()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;

  OUTLINED_FUNCTION_49_0();
  TipSnippetModel.title.getter();
  *v0 = v1;
  v0[1] = v2;
  OUTLINED_FUNCTION_60();
}

void sub_23A481B68()
{
  uint64_t *v0;

  OUTLINED_FUNCTION_49_0();
  *v0 = TipSnippetModel.bodyContent.getter();
  OUTLINED_FUNCTION_60();
}

void sub_23A481B8C()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;

  OUTLINED_FUNCTION_49_0();
  TipSnippetModel.language.getter();
  *v0 = v1;
  v0[1] = v2;
  OUTLINED_FUNCTION_60();
}

void sub_23A481BB0()
{
  TipSnippetModel.thumbnailAssetConfiguration.getter();
  OUTLINED_FUNCTION_60();
}

uint64_t *initializeBufferWithCopyOfBuffer for TipSnippetModel(uint64_t *a1, uint64_t *a2, int *a3)
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
  char *v22;
  char *v23;
  uint64_t v24;
  uint64_t v25;

  v5 = *(_DWORD *)(*((_QWORD *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v25 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v25 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569800D8);
    v8 = *(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v7 - 8) + 16);
    v8(a1, a2, v7);
    v9 = a3[5];
    v10 = (char *)a1 + v9;
    v11 = (char *)a2 + v9;
    v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569800E0);
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v12 - 8) + 16))(v10, v11, v12);
    v13 = a3[6];
    v14 = (char *)a1 + v13;
    v15 = (char *)a2 + v13;
    v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569800E8);
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v16 - 8) + 16))(v14, v15, v16);
    v8((uint64_t *)((char *)a1 + a3[7]), (uint64_t *)((char *)a2 + a3[7]), v7);
    v17 = a3[8];
    v18 = (char *)a1 + v17;
    v19 = (char *)a2 + v17;
    v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569800F0);
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v20 - 8) + 16))(v18, v19, v20);
    v21 = a3[9];
    v22 = (char *)a1 + v21;
    v23 = (char *)a2 + v21;
    v24 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569800A8);
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v24 - 8) + 16))(v22, v23, v24);
  }
  return a1;
}

uint64_t destroy for TipSnippetModel(uint64_t a1, int *a2)
{
  uint64_t v4;
  void (*v5)(uint64_t, uint64_t);
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569800D8);
  v5 = *(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8);
  v5(a1, v4);
  v6 = a1 + a2[5];
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569800E0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 8))(v6, v7);
  v8 = a1 + a2[6];
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569800E8);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 8))(v8, v9);
  v5(a1 + a2[7], v4);
  v10 = a1 + a2[8];
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569800F0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 8))(v10, v11);
  v12 = a1 + a2[9];
  v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569800A8);
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v13 - 8) + 8))(v12, v13);
}

uint64_t initializeWithCopy for TipSnippetModel(uint64_t a1, uint64_t a2, int *a3)
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
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569800D8);
  v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 16);
  v7(a1, a2, v6);
  v8 = a3[5];
  v9 = a1 + v8;
  v10 = a2 + v8;
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569800E0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 16))(v9, v10, v11);
  v12 = a3[6];
  v13 = a1 + v12;
  v14 = a2 + v12;
  v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569800E8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v15 - 8) + 16))(v13, v14, v15);
  v7(a1 + a3[7], a2 + a3[7], v6);
  v16 = a3[8];
  v17 = a1 + v16;
  v18 = a2 + v16;
  v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569800F0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v19 - 8) + 16))(v17, v18, v19);
  v20 = a3[9];
  v21 = a1 + v20;
  v22 = a2 + v20;
  v23 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569800A8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v23 - 8) + 16))(v21, v22, v23);
  return a1;
}

uint64_t assignWithCopy for TipSnippetModel(uint64_t a1, uint64_t a2, int *a3)
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
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569800D8);
  v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 24);
  v7(a1, a2, v6);
  v8 = a3[5];
  v9 = a1 + v8;
  v10 = a2 + v8;
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569800E0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 24))(v9, v10, v11);
  v12 = a3[6];
  v13 = a1 + v12;
  v14 = a2 + v12;
  v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569800E8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v15 - 8) + 24))(v13, v14, v15);
  v7(a1 + a3[7], a2 + a3[7], v6);
  v16 = a3[8];
  v17 = a1 + v16;
  v18 = a2 + v16;
  v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569800F0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v19 - 8) + 24))(v17, v18, v19);
  v20 = a3[9];
  v21 = a1 + v20;
  v22 = a2 + v20;
  v23 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569800A8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v23 - 8) + 24))(v21, v22, v23);
  return a1;
}

uint64_t initializeWithTake for TipSnippetModel(uint64_t a1, uint64_t a2, int *a3)
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
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569800D8);
  v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 32);
  v7(a1, a2, v6);
  v8 = a3[5];
  v9 = a1 + v8;
  v10 = a2 + v8;
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569800E0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 32))(v9, v10, v11);
  v12 = a3[6];
  v13 = a1 + v12;
  v14 = a2 + v12;
  v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569800E8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v15 - 8) + 32))(v13, v14, v15);
  v7(a1 + a3[7], a2 + a3[7], v6);
  v16 = a3[8];
  v17 = a1 + v16;
  v18 = a2 + v16;
  v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569800F0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v19 - 8) + 32))(v17, v18, v19);
  v20 = a3[9];
  v21 = a1 + v20;
  v22 = a2 + v20;
  v23 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569800A8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v23 - 8) + 32))(v21, v22, v23);
  return a1;
}

uint64_t assignWithTake for TipSnippetModel(uint64_t a1, uint64_t a2, int *a3)
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
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569800D8);
  v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 40);
  v7(a1, a2, v6);
  v8 = a3[5];
  v9 = a1 + v8;
  v10 = a2 + v8;
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569800E0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 40))(v9, v10, v11);
  v12 = a3[6];
  v13 = a1 + v12;
  v14 = a2 + v12;
  v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569800E8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v15 - 8) + 40))(v13, v14, v15);
  v7(a1 + a3[7], a2 + a3[7], v6);
  v16 = a3[8];
  v17 = a1 + v16;
  v18 = a2 + v16;
  v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569800F0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v19 - 8) + 40))(v17, v18, v19);
  v20 = a3[9];
  v21 = a1 + v20;
  v22 = a2 + v20;
  v23 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569800A8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v23 - 8) + 40))(v21, v22, v23);
  return a1;
}

uint64_t getEnumTagSinglePayload for TipSnippetModel()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_23A48233C(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char v9;
  uint64_t v10;
  uint64_t v11;
  char v12;
  uint64_t v13;
  char v14;
  uint64_t v15;

  OUTLINED_FUNCTION_33_0();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2569800D8);
  OUTLINED_FUNCTION_17_0();
  if (v9)
  {
    v7 = v6;
    v8 = v4;
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_2569800E0);
    OUTLINED_FUNCTION_17_0();
    if (v9)
    {
      v7 = v10;
      v11 = a3[5];
    }
    else
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_2569800E8);
      OUTLINED_FUNCTION_17_0();
      if (v12)
      {
        v7 = v13;
        v11 = a3[6];
      }
      else
      {
        __swift_instantiateConcreteTypeFromMangledName(&qword_2569800F0);
        OUTLINED_FUNCTION_17_0();
        if (v14)
        {
          v7 = v15;
          v11 = a3[8];
        }
        else
        {
          v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569800A8);
          v11 = a3[9];
        }
      }
    }
    v8 = v4 + v11;
  }
  return __swift_getEnumTagSinglePayload(v8, v3, v7);
}

uint64_t storeEnumTagSinglePayload for TipSnippetModel()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_23A48240C(uint64_t a1, uint64_t a2, uint64_t a3, int *a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char v10;
  uint64_t v11;
  uint64_t v12;
  char v13;
  uint64_t v14;
  char v15;
  uint64_t v16;

  OUTLINED_FUNCTION_33_0();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2569800D8);
  OUTLINED_FUNCTION_16_1();
  if (v10)
  {
    v8 = v7;
    v9 = v5;
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_2569800E0);
    OUTLINED_FUNCTION_16_1();
    if (v10)
    {
      v8 = v11;
      v12 = a4[5];
    }
    else
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_2569800E8);
      OUTLINED_FUNCTION_16_1();
      if (v13)
      {
        v8 = v14;
        v12 = a4[6];
      }
      else
      {
        __swift_instantiateConcreteTypeFromMangledName(&qword_2569800F0);
        OUTLINED_FUNCTION_16_1();
        if (v15)
        {
          v8 = v16;
          v12 = a4[8];
        }
        else
        {
          v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569800A8);
          v12 = a4[9];
        }
      }
    }
    v9 = v5 + v12;
  }
  return __swift_storeEnumTagSinglePayload(v9, v4, v4, v8);
}

void sub_23A4824D8()
{
  unint64_t v0;
  unint64_t v1;
  unint64_t v2;
  unint64_t v3;
  unint64_t v4;

  sub_23A482648(319, &qword_256980518);
  if (v0 <= 0x3F)
  {
    sub_23A482600(319, &qword_256980520, &qword_256980420);
    if (v1 <= 0x3F)
    {
      sub_23A482600(319, &qword_256980528, &qword_256980428);
      if (v2 <= 0x3F)
      {
        sub_23A482600(319, qword_256980530, &qword_256980418);
        if (v3 <= 0x3F)
        {
          sub_23A482648(319, (unint64_t *)&qword_256980390);
          if (v4 <= 0x3F)
            swift_initStructMetadata();
        }
      }
    }
  }
}

void sub_23A482600(uint64_t a1, unint64_t *a2, uint64_t *a3)
{
  unint64_t v4;
  uint64_t v5;

  if (!*a2)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(a3);
    OUTLINED_FUNCTION_41_0();
    v4 = sub_23A4AA384();
    if (!v5)
      atomic_store(v4, a2);
  }
}

void sub_23A482648(uint64_t a1, unint64_t *a2)
{
  unint64_t v3;
  uint64_t v4;

  if (!*a2)
  {
    v3 = sub_23A4AA384();
    if (!v4)
      atomic_store(v3, a2);
  }
}

uint64_t *initializeBufferWithCopyOfBuffer for TipSnippetModel.AssetConfiguration(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  char *v12;
  uint64_t v13;

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
    v7 = sub_23A4A9F40();
    if (__swift_getEnumTagSinglePayload((uint64_t)a2, 1, v7))
    {
      v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_256980430);
      memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v8 - 8) + 64));
    }
    else
    {
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a1, a2, v7);
      __swift_storeEnumTagSinglePayload((uint64_t)a1, 0, 1, v7);
    }
    v10 = *(int *)(a3 + 20);
    v11 = (char *)a1 + v10;
    v12 = (char *)a2 + v10;
    if (__swift_getEnumTagSinglePayload((uint64_t)a2 + v10, 1, v7))
    {
      v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_256980430);
      memcpy(v11, v12, *(_QWORD *)(*(_QWORD *)(v13 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(v11, v12, v7);
      __swift_storeEnumTagSinglePayload((uint64_t)v11, 0, 1, v7);
    }
    *(uint64_t *)((char *)a1 + *(int *)(a3 + 24)) = *(uint64_t *)((char *)a2 + *(int *)(a3 + 24));
  }
  return a1;
}

uint64_t destroy for TipSnippetModel.AssetConfiguration(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t result;

  v4 = sub_23A4A9F40();
  if (!__swift_getEnumTagSinglePayload(a1, 1, v4))
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(a1, v4);
  v5 = a1 + *(int *)(a2 + 20);
  result = __swift_getEnumTagSinglePayload(v5, 1, v4);
  if (!(_DWORD)result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v5, v4);
  return result;
}

char *initializeWithCopy for TipSnippetModel.AssetConfiguration(char *a1, char *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  char *v10;
  uint64_t v11;

  v6 = sub_23A4A9F40();
  if (__swift_getEnumTagSinglePayload((uint64_t)a2, 1, v6))
  {
    v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_256980430);
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v7 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(a1, a2, v6);
    __swift_storeEnumTagSinglePayload((uint64_t)a1, 0, 1, v6);
  }
  v8 = *(int *)(a3 + 20);
  v9 = &a1[v8];
  v10 = &a2[v8];
  if (__swift_getEnumTagSinglePayload((uint64_t)&a2[v8], 1, v6))
  {
    v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_256980430);
    memcpy(v9, v10, *(_QWORD *)(*(_QWORD *)(v11 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(v9, v10, v6);
    __swift_storeEnumTagSinglePayload((uint64_t)v9, 0, 1, v6);
  }
  *(_QWORD *)&a1[*(int *)(a3 + 24)] = *(_QWORD *)&a2[*(int *)(a3 + 24)];
  return a1;
}

char *assignWithCopy for TipSnippetModel.AssetConfiguration(char *a1, char *a2, uint64_t a3)
{
  uint64_t v6;
  int EnumTagSinglePayload;
  int v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  char *v13;
  int v14;
  int v15;
  uint64_t v16;
  uint64_t v17;

  v6 = sub_23A4A9F40();
  EnumTagSinglePayload = __swift_getEnumTagSinglePayload((uint64_t)a1, 1, v6);
  v8 = __swift_getEnumTagSinglePayload((uint64_t)a2, 1, v6);
  if (EnumTagSinglePayload)
  {
    if (!v8)
    {
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(a1, a2, v6);
      __swift_storeEnumTagSinglePayload((uint64_t)a1, 0, 1, v6);
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  v9 = *(_QWORD *)(v6 - 8);
  if (v8)
  {
    (*(void (**)(char *, uint64_t))(v9 + 8))(a1, v6);
LABEL_6:
    v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_256980430);
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v10 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(char *, char *, uint64_t))(v9 + 24))(a1, a2, v6);
LABEL_7:
  v11 = *(int *)(a3 + 20);
  v12 = &a1[v11];
  v13 = &a2[v11];
  v14 = __swift_getEnumTagSinglePayload((uint64_t)&a1[v11], 1, v6);
  v15 = __swift_getEnumTagSinglePayload((uint64_t)v13, 1, v6);
  if (!v14)
  {
    v16 = *(_QWORD *)(v6 - 8);
    if (!v15)
    {
      (*(void (**)(char *, char *, uint64_t))(v16 + 24))(v12, v13, v6);
      goto LABEL_13;
    }
    (*(void (**)(char *, uint64_t))(v16 + 8))(v12, v6);
    goto LABEL_12;
  }
  if (v15)
  {
LABEL_12:
    v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_256980430);
    memcpy(v12, v13, *(_QWORD *)(*(_QWORD *)(v17 - 8) + 64));
    goto LABEL_13;
  }
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(v12, v13, v6);
  __swift_storeEnumTagSinglePayload((uint64_t)v12, 0, 1, v6);
LABEL_13:
  *(_QWORD *)&a1[*(int *)(a3 + 24)] = *(_QWORD *)&a2[*(int *)(a3 + 24)];
  return a1;
}

char *initializeWithTake for TipSnippetModel.AssetConfiguration(char *a1, char *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  char *v10;
  uint64_t v11;

  v6 = sub_23A4A9F40();
  if (__swift_getEnumTagSinglePayload((uint64_t)a2, 1, v6))
  {
    v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_256980430);
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v7 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v6 - 8) + 32))(a1, a2, v6);
    __swift_storeEnumTagSinglePayload((uint64_t)a1, 0, 1, v6);
  }
  v8 = *(int *)(a3 + 20);
  v9 = &a1[v8];
  v10 = &a2[v8];
  if (__swift_getEnumTagSinglePayload((uint64_t)&a2[v8], 1, v6))
  {
    v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_256980430);
    memcpy(v9, v10, *(_QWORD *)(*(_QWORD *)(v11 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v6 - 8) + 32))(v9, v10, v6);
    __swift_storeEnumTagSinglePayload((uint64_t)v9, 0, 1, v6);
  }
  *(_QWORD *)&a1[*(int *)(a3 + 24)] = *(_QWORD *)&a2[*(int *)(a3 + 24)];
  return a1;
}

char *assignWithTake for TipSnippetModel.AssetConfiguration(char *a1, char *a2, uint64_t a3)
{
  uint64_t v6;
  int EnumTagSinglePayload;
  int v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  char *v13;
  int v14;
  int v15;
  uint64_t v16;
  uint64_t v17;

  v6 = sub_23A4A9F40();
  EnumTagSinglePayload = __swift_getEnumTagSinglePayload((uint64_t)a1, 1, v6);
  v8 = __swift_getEnumTagSinglePayload((uint64_t)a2, 1, v6);
  if (EnumTagSinglePayload)
  {
    if (!v8)
    {
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v6 - 8) + 32))(a1, a2, v6);
      __swift_storeEnumTagSinglePayload((uint64_t)a1, 0, 1, v6);
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  v9 = *(_QWORD *)(v6 - 8);
  if (v8)
  {
    (*(void (**)(char *, uint64_t))(v9 + 8))(a1, v6);
LABEL_6:
    v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_256980430);
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v10 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(char *, char *, uint64_t))(v9 + 40))(a1, a2, v6);
LABEL_7:
  v11 = *(int *)(a3 + 20);
  v12 = &a1[v11];
  v13 = &a2[v11];
  v14 = __swift_getEnumTagSinglePayload((uint64_t)&a1[v11], 1, v6);
  v15 = __swift_getEnumTagSinglePayload((uint64_t)v13, 1, v6);
  if (!v14)
  {
    v16 = *(_QWORD *)(v6 - 8);
    if (!v15)
    {
      (*(void (**)(char *, char *, uint64_t))(v16 + 40))(v12, v13, v6);
      goto LABEL_13;
    }
    (*(void (**)(char *, uint64_t))(v16 + 8))(v12, v6);
    goto LABEL_12;
  }
  if (v15)
  {
LABEL_12:
    v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_256980430);
    memcpy(v12, v13, *(_QWORD *)(*(_QWORD *)(v17 - 8) + 64));
    goto LABEL_13;
  }
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v6 - 8) + 32))(v12, v13, v6);
  __swift_storeEnumTagSinglePayload((uint64_t)v12, 0, 1, v6);
LABEL_13:
  *(_QWORD *)&a1[*(int *)(a3 + 24)] = *(_QWORD *)&a2[*(int *)(a3 + 24)];
  return a1;
}

uint64_t getEnumTagSinglePayload for TipSnippetModel.AssetConfiguration()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_23A482E40()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  OUTLINED_FUNCTION_33_0();
  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_256980430);
  return __swift_getEnumTagSinglePayload(v1, v0, v2);
}

uint64_t storeEnumTagSinglePayload for TipSnippetModel.AssetConfiguration()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_23A482E80()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  OUTLINED_FUNCTION_33_0();
  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_256980430);
  return __swift_storeEnumTagSinglePayload(v1, v0, v0, v2);
}

void sub_23A482EB8()
{
  unint64_t v0;

  sub_23A482F30();
  if (v0 <= 0x3F)
    swift_initStructMetadata();
}

void sub_23A482F30()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_2569805D8[0])
  {
    sub_23A4A9F40();
    v0 = sub_23A4AA8E8();
    if (!v1)
      atomic_store(v0, qword_2569805D8);
  }
}

uint64_t getEnumTagSinglePayload for TipSnippetModel.CodingKeys(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  int v5;
  unsigned int v6;
  BOOL v7;

  if (!a2)
  {
    v5 = -1;
    return (v5 + 1);
  }
  if (a2 >= 0xFB)
  {
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
      if (!v4)
        goto LABEL_17;
    }
    else if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
    }
    else
    {
      v4 = a1[1];
      if (!a1[1])
        goto LABEL_17;
    }
    v5 = (*a1 | (v4 << 8)) - 6;
    return (v5 + 1);
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 6;
  v5 = v6 - 6;
  if (!v7)
    v5 = -1;
  return (v5 + 1);
}

uint64_t storeEnumTagSinglePayload for TipSnippetModel.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_23A483058 + 4 * byte_23A4AB8A1[v4]))();
  *a1 = a2 + 5;
  return ((uint64_t (*)(void))((char *)sub_23A48308C + 4 * byte_23A4AB89C[v4]))();
}

uint64_t sub_23A48308C(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_23A483094(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x23A48309CLL);
  return result;
}

uint64_t sub_23A4830A8(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x23A4830B0);
  *(_BYTE *)result = a2 + 5;
  return result;
}

uint64_t sub_23A4830B4(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23A4830BC(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for TipSnippetModel.CodingKeys()
{
  return &type metadata for TipSnippetModel.CodingKeys;
}

uint64_t getEnumTagSinglePayload for TipSnippetModel.AssetConfiguration.CodingKeys(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  int v5;
  unsigned int v6;
  BOOL v7;

  if (!a2)
  {
    v5 = -1;
    return (v5 + 1);
  }
  if (a2 >= 0xFE)
  {
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
      if (!v4)
        goto LABEL_17;
    }
    else if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
    }
    else
    {
      v4 = a1[1];
      if (!a1[1])
        goto LABEL_17;
    }
    v5 = (*a1 | (v4 << 8)) - 3;
    return (v5 + 1);
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 3;
  v5 = v6 - 3;
  if (!v7)
    v5 = -1;
  return (v5 + 1);
}

uint64_t storeEnumTagSinglePayload for TipSnippetModel.AssetConfiguration.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_23A4831AC + 4 * byte_23A4AB8AB[v4]))();
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)sub_23A4831E0 + 4 * byte_23A4AB8A6[v4]))();
}

uint64_t sub_23A4831E0(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_23A4831E8(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x23A4831F0);
  return result;
}

uint64_t sub_23A4831FC(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x23A483204);
  *(_BYTE *)result = a2 + 2;
  return result;
}

uint64_t sub_23A483208(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23A483210(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for TipSnippetModel.AssetConfiguration.CodingKeys()
{
  return &type metadata for TipSnippetModel.AssetConfiguration.CodingKeys;
}

unint64_t sub_23A483230()
{
  unint64_t result;

  result = qword_256980610;
  if (!qword_256980610)
  {
    result = MEMORY[0x23B84E2B0](&unk_23A4ABA90, &type metadata for TipSnippetModel.AssetConfiguration.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256980610);
  }
  return result;
}

unint64_t sub_23A483270()
{
  unint64_t result;

  result = qword_256980618;
  if (!qword_256980618)
  {
    result = MEMORY[0x23B84E2B0](&unk_23A4ABB80, &type metadata for TipSnippetModel.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256980618);
  }
  return result;
}

unint64_t sub_23A4832B0()
{
  unint64_t result;

  result = qword_256980620;
  if (!qword_256980620)
  {
    result = MEMORY[0x23B84E2B0](&unk_23A4ABAB8, &type metadata for TipSnippetModel.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256980620);
  }
  return result;
}

unint64_t sub_23A4832F0()
{
  unint64_t result;

  result = qword_256980628;
  if (!qword_256980628)
  {
    result = MEMORY[0x23B84E2B0](&unk_23A4ABAE0, &type metadata for TipSnippetModel.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256980628);
  }
  return result;
}

unint64_t sub_23A483330()
{
  unint64_t result;

  result = qword_256980630;
  if (!qword_256980630)
  {
    result = MEMORY[0x23B84E2B0](&unk_23A4ABA00, &type metadata for TipSnippetModel.AssetConfiguration.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256980630);
  }
  return result;
}

unint64_t sub_23A483370()
{
  unint64_t result;

  result = qword_256980638;
  if (!qword_256980638)
  {
    result = MEMORY[0x23B84E2B0](&unk_23A4ABA28, &type metadata for TipSnippetModel.AssetConfiguration.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256980638);
  }
  return result;
}

uint64_t OUTLINED_FUNCTION_0_7(uint64_t a1)
{
  _QWORD *v1;

  *v1 = a1;
  return type metadata accessor for TipSnippetModel(0);
}

uint64_t OUTLINED_FUNCTION_8_3()
{
  return type metadata accessor for TipSnippetModel(0);
}

uint64_t OUTLINED_FUNCTION_9_2()
{
  return sub_23A4AAA98();
}

uint64_t OUTLINED_FUNCTION_11_1()
{
  return sub_23A4AA378();
}

uint64_t OUTLINED_FUNCTION_13_2()
{
  return sub_23A4AAA74();
}

uint64_t OUTLINED_FUNCTION_14_1(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(a1 - 8) + 16))(v1, v2, a1);
}

void OUTLINED_FUNCTION_18_1()
{
  sub_23A47F95C();
}

uint64_t OUTLINED_FUNCTION_19_0()
{
  return sub_23A4AA7F8();
}

uint64_t OUTLINED_FUNCTION_20_1(uint64_t a1)
{
  uint64_t v1;

  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(a1 - 8) + 8))(v1, a1);
}

uint64_t OUTLINED_FUNCTION_22_1()
{
  return swift_bridgeObjectRelease();
}

void OUTLINED_FUNCTION_23_0()
{
  sub_23A47F84C();
}

uint64_t OUTLINED_FUNCTION_24_0()
{
  return sub_23A4AA354();
}

uint64_t OUTLINED_FUNCTION_26_0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 8))(v1, v0);
}

uint64_t OUTLINED_FUNCTION_27_0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(v1 + 8))(v0, v2);
}

uint64_t OUTLINED_FUNCTION_28_0()
{
  return sub_23A4AA36C();
}

uint64_t OUTLINED_FUNCTION_29_0()
{
  return sub_23A4AAAE0();
}

uint64_t OUTLINED_FUNCTION_30_0()
{
  return sub_23A4AA7F8();
}

uint64_t OUTLINED_FUNCTION_31_0(uint64_t a1)
{
  uint64_t v1;

  return __swift_storeEnumTagSinglePayload(a1, 1, 1, v1);
}

uint64_t OUTLINED_FUNCTION_32_0@<X0>(uint64_t (*a1)(uint64_t, uint64_t)@<X8>)
{
  uint64_t v1;
  uint64_t v2;

  return a1(v1, v2);
}

uint64_t OUTLINED_FUNCTION_34_0()
{
  return type metadata accessor for TipSnippetModel.AssetConfiguration(0);
}

uint64_t OUTLINED_FUNCTION_35_0()
{
  return sub_23A4AAA44();
}

uint64_t OUTLINED_FUNCTION_37_0()
{
  return sub_23A4AAAD4();
}

id OUTLINED_FUNCTION_38_0(id a1, SEL a2)
{
  uint64_t v2;

  return objc_msgSend(a1, a2, v2, 0);
}

uint64_t OUTLINED_FUNCTION_39_0()
{
  return sub_23A4AA36C();
}

uint64_t OUTLINED_FUNCTION_41_0()
{
  uint64_t v0;

  return v0;
}

uint64_t OUTLINED_FUNCTION_42_0()
{
  uint64_t v0;

  return v0;
}

uint64_t OUTLINED_FUNCTION_43_0()
{
  uint64_t v0;

  return v0;
}

uint64_t OUTLINED_FUNCTION_44_0()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_45_0()
{
  return sub_23A4AAAC8();
}

uint64_t OUTLINED_FUNCTION_48_0()
{
  return type metadata accessor for TipSnippetModel(0);
}

uint64_t OUTLINED_FUNCTION_50_0()
{
  unint64_t v0;
  uint64_t v1;

  return sub_23A47C41C(v1, v0);
}

uint64_t OUTLINED_FUNCTION_51_0()
{
  return swift_allocObject();
}

uint64_t OUTLINED_FUNCTION_52_0()
{
  return type metadata accessor for TipSnippetModel(0);
}

uint64_t Array<A>.asAttributionGroups()(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  BOOL v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  unint64_t v23;
  char *v24;
  uint64_t result;
  char *v26;
  uint64_t v27;
  char isUniquelyReferenced_nonNull_native;
  unint64_t v29;
  unint64_t v30;
  _QWORD v31[2];
  __int128 v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;

  v2 = OUTLINED_FUNCTION_6_3();
  v3 = MEMORY[0x24BDAC7A8](v2);
  v35 = (uint64_t)v31 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v3);
  v7 = (char *)v31 - v6;
  v37 = *(_QWORD *)(a1 + 16);
  if (v37)
  {
    v8 = *(unsigned __int8 *)(v5 + 80);
    v9 = (v8 + 32) & ~v8;
    v36 = a1 + v9;
    v10 = *(_QWORD *)(v5 + 72);
    v33 = v8 | 7;
    v34 = v10 + v9;
    v31[1] = a1;
    swift_bridgeObjectRetain();
    v11 = 0;
    v12 = (char *)MEMORY[0x24BEE4AF8];
    v32 = xmmword_23A4AB880;
    while (1)
    {
      sub_23A484964(v36 + v10 * v11, (uint64_t)v7);
      v13 = *((_QWORD *)v12 + 2);
      if (v13)
      {
        v14 = 0;
        v15 = 0;
        v16 = *((_QWORD *)v7 + 2);
        v17 = *((_QWORD *)v7 + 3);
        while (1)
        {
          v18 = *(_QWORD *)&v12[v14 + 32] == v16 && *(_QWORD *)&v12[v14 + 40] == v17;
          if (v18 || (sub_23A4AAAB0() & 1) != 0)
            break;
          ++v15;
          v14 += 40;
          if (v13 == v15)
            goto LABEL_11;
        }
        sub_23A484964((uint64_t)v7, v35);
        result = swift_isUniquelyReferenced_nonNull_native();
        if ((result & 1) == 0)
        {
          result = (uint64_t)sub_23A4857A4((uint64_t)v12);
          v12 = (char *)result;
        }
        if (v15 >= *((_QWORD *)v12 + 2))
        {
          __break(1u);
          return result;
        }
        v26 = &v12[v14];
        v27 = *((_QWORD *)v26 + 8);
        isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
        *((_QWORD *)v26 + 8) = v27;
        if ((isUniquelyReferenced_nonNull_native & 1) == 0)
        {
          v27 = OUTLINED_FUNCTION_32_1(0, *(_QWORD *)(v27 + 16) + 1);
          *((_QWORD *)v26 + 8) = v27;
        }
        v30 = *(_QWORD *)(v27 + 16);
        v29 = *(_QWORD *)(v27 + 24);
        if (v30 >= v29 >> 1)
        {
          v27 = OUTLINED_FUNCTION_32_1(v29 > 1, v30 + 1);
          *((_QWORD *)v26 + 8) = v27;
        }
        *(_QWORD *)(v27 + 16) = v30 + 1;
        sub_23A4857B8(v35, v27 + v9 + v30 * v10);
      }
      else
      {
LABEL_11:
        v19 = *((_QWORD *)v7 + 2);
        v20 = *((_QWORD *)v7 + 3);
        __swift_instantiateConcreteTypeFromMangledName(&qword_256980648);
        v21 = swift_allocObject();
        *(_OWORD *)(v21 + 16) = v32;
        sub_23A484964((uint64_t)v7, v21 + v9);
        swift_bridgeObjectRetain_n();
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
          v12 = OUTLINED_FUNCTION_31_1(0, *((_QWORD *)v12 + 2) + 1);
        v23 = *((_QWORD *)v12 + 2);
        v22 = *((_QWORD *)v12 + 3);
        if (v23 >= v22 >> 1)
          v12 = OUTLINED_FUNCTION_31_1((char *)(v22 > 1), v23 + 1);
        *((_QWORD *)v12 + 2) = v23 + 1;
        v24 = &v12[40 * v23];
        *((_QWORD *)v24 + 4) = v19;
        *((_QWORD *)v24 + 5) = v20;
        *((_QWORD *)v24 + 6) = v19;
        *((_QWORD *)v24 + 7) = v20;
        *((_QWORD *)v24 + 8) = v21;
      }
      ++v11;
      sub_23A48554C((uint64_t)v7);
      if (v11 == v37)
      {
        swift_bridgeObjectRelease();
        return (uint64_t)v12;
      }
    }
  }
  return MEMORY[0x24BEE4AF8];
}

uint64_t AttributionGroup.set<A>(_:_:)@<X0>(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t *v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12;

  MEMORY[0x24BDAC7A8](a1);
  v4 = *v2;
  v5 = v2[1];
  v6 = v2[2];
  v7 = v2[3];
  v8 = v2[4];
  *a2 = v4;
  a2[1] = v5;
  a2[2] = v6;
  a2[3] = v7;
  a2[4] = v8;
  (*(void (**)(char *))(v9 + 16))((char *)&v12 - v10);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  OUTLINED_FUNCTION_7();
  return swift_setAtWritableKeyPath();
}

void AttributionItem.id.getter()
{
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_11_0();
  OUTLINED_FUNCTION_60();
}

void AttributionItem.id.setter(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;

  swift_bridgeObjectRelease();
  *v2 = a1;
  v2[1] = a2;
  OUTLINED_FUNCTION_5();
}

uint64_t (*AttributionItem.id.modify())()
{
  return nullsub_1;
}

void AttributionItem.group.getter()
{
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_11_0();
  OUTLINED_FUNCTION_60();
}

void AttributionItem.group.setter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  OUTLINED_FUNCTION_21_2();
  *(_QWORD *)(v1 + 16) = v2;
  *(_QWORD *)(v1 + 24) = v0;
  OUTLINED_FUNCTION_5();
}

uint64_t (*AttributionItem.group.modify())()
{
  return nullsub_1;
}

void AttributionItem.title.getter()
{
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_11_0();
  OUTLINED_FUNCTION_60();
}

void AttributionItem.title.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  swift_bridgeObjectRelease();
  *(_QWORD *)(v2 + 32) = a1;
  *(_QWORD *)(v2 + 40) = a2;
  OUTLINED_FUNCTION_5();
}

uint64_t (*AttributionItem.title.modify())()
{
  return nullsub_1;
}

void AttributionItem.subtitle.getter()
{
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_11_0();
  OUTLINED_FUNCTION_60();
}

void AttributionItem.subtitle.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  swift_bridgeObjectRelease();
  *(_QWORD *)(v2 + 48) = a1;
  *(_QWORD *)(v2 + 56) = a2;
  OUTLINED_FUNCTION_5();
}

uint64_t (*AttributionItem.subtitle.modify())()
{
  return nullsub_1;
}

uint64_t AttributionItem.thumbnailImage.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t (*v3)(void);

  OUTLINED_FUNCTION_6_3();
  OUTLINED_FUNCTION_14_2();
  v0 = OUTLINED_FUNCTION_11_0();
  return OUTLINED_FUNCTION_16_2(v0, v1, v2, v3);
}

uint64_t AttributionItem.thumbnailImage.setter(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;

  v3 = v1 + *(int *)(OUTLINED_FUNCTION_6_3() + 32);
  v4 = OUTLINED_FUNCTION_14_2();
  return OUTLINED_FUNCTION_16_2(v3, a1, v4, *(uint64_t (**)(void))(*(_QWORD *)(v4 - 8) + 40));
}

uint64_t (*AttributionItem.thumbnailImage.modify())()
{
  OUTLINED_FUNCTION_6_3();
  return nullsub_1;
}

void AttributionItem.appPunchOut.getter()
{
  OUTLINED_FUNCTION_6_3();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256980650);
  sub_23A4AA2DC();
  OUTLINED_FUNCTION_60();
}

void sub_23A483BB0(id *a1)
{
  id v1;

  v1 = *a1;
  AttributionItem.appPunchOut.setter();
}

void AttributionItem.appPunchOut.setter()
{
  OUTLINED_FUNCTION_6_3();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256980650);
  sub_23A4AA2E8();
  OUTLINED_FUNCTION_60();
}

void (*AttributionItem.appPunchOut.modify(_QWORD *a1))(_QWORD *a1)
{
  _QWORD *v2;

  v2 = malloc(0x28uLL);
  *a1 = v2;
  OUTLINED_FUNCTION_6_3();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256980650);
  v2[4] = sub_23A4AA2D0();
  return sub_23A47D800;
}

uint64_t AttributionItem.init(id:group:title:subtitle:thumbnailImage:punchOutUri:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, _QWORD *a9@<X8>, uint64_t a10, uint64_t a11)
{
  char *v11;
  uint64_t v12;
  uint64_t v13;

  *a9 = a1;
  a9[1] = a2;
  a9[2] = a3;
  a9[3] = a4;
  a9[4] = a5;
  a9[5] = a6;
  a9[6] = a7;
  a9[7] = a8;
  v11 = (char *)a9 + *(int *)(OUTLINED_FUNCTION_6_3() + 32);
  v12 = OUTLINED_FUNCTION_14_2();
  v13 = *(_QWORD *)(v12 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v13 + 16))(v11, a10, v12);
  sub_23A483D30(a11);
  sub_23A4857FC();
  sub_23A4AA2C4();
  sub_23A485838(a11);
  return (*(uint64_t (**)(uint64_t, uint64_t))(v13 + 8))(a10, v12);
}

id sub_23A483D30(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_256980430);
  MEMORY[0x24BDAC7A8](v3);
  OUTLINED_FUNCTION_19_1();
  v4 = sub_23A4A9F7C();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  OUTLINED_FUNCTION_4();
  v8 = v7 - v6;
  v9 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BE81860]), sel_init);
  sub_23A4A9F70();
  v10 = sub_23A4A9F64();
  v12 = v11;
  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v8, v4);
  sub_23A4859AC(v10, v12, v9);

  objc_msgSend(v9, sel_setAppAvailableInStorefront_, 1);
  sub_23A4867E8(a1, v1);
  v13 = sub_23A4A9F40();
  v14 = 0;
  if (__swift_getEnumTagSinglePayload(v1, 1, v13) != 1)
  {
    v14 = (void *)sub_23A4A9F1C();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v13 - 8) + 8))(v1, v13);
  }
  objc_msgSend(v9, sel_setPunchOutUri_, v14);

  return v9;
}

uint64_t sub_23A483E9C(uint64_t a1, uint64_t a2)
{
  BOOL v3;
  BOOL v6;
  BOOL v7;
  BOOL v8;
  BOOL v9;
  char v11;

  v3 = a1 == 25705 && a2 == 0xE200000000000000;
  if (v3 || (sub_23A4AAAB0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else
  {
    v6 = a1 == 0x70756F7267 && a2 == 0xE500000000000000;
    if (v6 || (sub_23A4AAAB0() & 1) != 0)
    {
      swift_bridgeObjectRelease();
      return 1;
    }
    else
    {
      v7 = a1 == 0x656C746974 && a2 == 0xE500000000000000;
      if (v7 || (sub_23A4AAAB0() & 1) != 0)
      {
        swift_bridgeObjectRelease();
        return 2;
      }
      else
      {
        v8 = a1 == 0x656C746974627573 && a2 == 0xE800000000000000;
        if (v8 || (sub_23A4AAAB0() & 1) != 0)
        {
          swift_bridgeObjectRelease();
          return 3;
        }
        else
        {
          v9 = a1 == 0x69616E626D756874 && a2 == 0xEE006567616D496CLL;
          if (v9 || (sub_23A4AAAB0() & 1) != 0)
          {
            swift_bridgeObjectRelease();
            return 4;
          }
          else if (a1 == 0x68636E7550707061 && a2 == 0xEB0000000074754FLL)
          {
            swift_bridgeObjectRelease();
            return 5;
          }
          else
          {
            v11 = sub_23A4AAAB0();
            swift_bridgeObjectRelease();
            if ((v11 & 1) != 0)
              return 5;
            else
              return 6;
          }
        }
      }
    }
  }
}

uint64_t sub_23A4840E8(char a1)
{
  return qword_23A4AC0B0[a1];
}

void sub_23A484108()
{
  sub_23A484B14();
}

uint64_t sub_23A484124()
{
  char *v0;

  return sub_23A4840E8(*v0);
}

uint64_t sub_23A48412C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_23A483E9C(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_23A484150()
{
  sub_23A485878();
  return sub_23A4AAB04();
}

uint64_t sub_23A484178()
{
  sub_23A485878();
  return sub_23A4AAB10();
}

uint64_t AttributionItem.encode(to:)(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_256980660);
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  OUTLINED_FUNCTION_4_2();
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_23A485878();
  sub_23A4AAAF8();
  OUTLINED_FUNCTION_3();
  if (!v1)
  {
    OUTLINED_FUNCTION_3();
    OUTLINED_FUNCTION_26_1();
    OUTLINED_FUNCTION_3();
    OUTLINED_FUNCTION_3();
    type metadata accessor for AttributionItem();
    sub_23A4AA348();
    sub_23A485AE0(&qword_256980670, (void (*)(uint64_t))MEMORY[0x24BEAD2E8]);
    OUTLINED_FUNCTION_9_2();
    __swift_instantiateConcreteTypeFromMangledName(&qword_256980650);
    sub_23A4858B4(&qword_256980678);
    OUTLINED_FUNCTION_9_2();
  }
  return (*(uint64_t (**)(uint64_t, uint64_t))(v5 + 8))(v2, v4);
}

void AttributionItem.init(from:)(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;

  v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_256980650);
  v5 = *(_QWORD *)(v14 - 8);
  MEMORY[0x24BDAC7A8](v14);
  OUTLINED_FUNCTION_4_2();
  v17 = sub_23A4AA348();
  v13 = *(_QWORD *)(v17 - 8);
  MEMORY[0x24BDAC7A8](v17);
  OUTLINED_FUNCTION_19_1();
  v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_256980680);
  MEMORY[0x24BDAC7A8](v15);
  OUTLINED_FUNCTION_4();
  v16 = type metadata accessor for AttributionItem();
  MEMORY[0x24BDAC7A8](v16);
  OUTLINED_FUNCTION_4();
  v18 = (uint64_t *)(v7 - v6);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_23A485878();
  sub_23A4AAAEC();
  if (v19)
  {
    OUTLINED_FUNCTION_23_1();
  }
  else
  {
    *v18 = OUTLINED_FUNCTION_9_3();
    v18[1] = v8;
    v18[2] = OUTLINED_FUNCTION_9_3();
    v18[3] = v9;
    OUTLINED_FUNCTION_26_1();
    v18[4] = OUTLINED_FUNCTION_9_3();
    v18[5] = v10;
    v18[6] = OUTLINED_FUNCTION_9_3();
    v18[7] = v11;
    sub_23A485AE0(&qword_256980688, (void (*)(uint64_t))MEMORY[0x24BEAD2E8]);
    sub_23A4AAA44();
    (*(void (**)(char *, uint64_t, uint64_t))(v13 + 32))((char *)v18 + *(int *)(v16 + 32), v2, v17);
    sub_23A4858B4(&qword_256980690);
    sub_23A4AAA44();
    OUTLINED_FUNCTION_3_5();
    (*(void (**)(char *, uint64_t, uint64_t))(v5 + 32))((char *)v18 + *(int *)(v16 + 36), v3, v14);
    sub_23A484964((uint64_t)v18, a2);
    OUTLINED_FUNCTION_23_1();
    sub_23A48554C((uint64_t)v18);
  }
  OUTLINED_FUNCTION_0();
}

void sub_23A484728(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  AttributionItem.init(from:)(a1, a2);
}

uint64_t sub_23A48473C(_QWORD *a1)
{
  return AttributionItem.encode(to:)(a1);
}

uint64_t static AttributionItem.== infix(_:_:)(_QWORD *a1, _QWORD *a2)
{
  if (*a1 == *a2 && a1[1] == a2[1])
    return 1;
  else
    return sub_23A4AAAB0();
}

uint64_t AttributionItem.hash(into:)()
{
  OUTLINED_FUNCTION_7();
  sub_23A4AA7F8();
  return OUTLINED_FUNCTION_11_2();
}

void AttributionItem.hashValue.getter()
{
  OUTLINED_FUNCTION_45_0();
  OUTLINED_FUNCTION_7();
  sub_23A4AA7F8();
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_29_0();
  OUTLINED_FUNCTION_10_2();
}

uint64_t sub_23A484800()
{
  sub_23A4AAAC8();
  swift_bridgeObjectRetain();
  sub_23A4AA7F8();
  swift_bridgeObjectRelease();
  return sub_23A4AAAE0();
}

void AttributionGroup.displayLabel.getter()
{
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_11_0();
  OUTLINED_FUNCTION_60();
}

void AttributionGroup.displayLabel.setter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  OUTLINED_FUNCTION_21_2();
  *(_QWORD *)(v1 + 16) = v2;
  *(_QWORD *)(v1 + 24) = v0;
  OUTLINED_FUNCTION_5();
}

uint64_t (*AttributionGroup.displayLabel.modify())()
{
  return nullsub_1;
}

uint64_t AttributionGroup.attributions.getter()
{
  return swift_bridgeObjectRetain();
}

void AttributionGroup.attributions.setter(uint64_t a1)
{
  uint64_t v1;

  swift_bridgeObjectRelease();
  *(_QWORD *)(v1 + 32) = a1;
  OUTLINED_FUNCTION_60();
}

uint64_t (*AttributionGroup.attributions.modify())()
{
  return nullsub_1;
}

void __swiftcall AttributionGroup.init(name:displayLabel:attributions:)(DeviceExpertIntents::AttributionGroup *__return_ptr retstr, Swift::String name, Swift::String_optional displayLabel, Swift::OpaquePointer attributions)
{
  void *object;
  uint64_t countAndFlagsBits;

  object = name._object;
  countAndFlagsBits = name._countAndFlagsBits;
  if (!displayLabel.value._object)
  {
    swift_bridgeObjectRetain();
    displayLabel.value._countAndFlagsBits = countAndFlagsBits;
    displayLabel.value._object = object;
  }
  retstr->name._countAndFlagsBits = countAndFlagsBits;
  retstr->name._object = object;
  retstr->displayLabel = displayLabel.value;
  retstr->attributions = attributions;
  OUTLINED_FUNCTION_5();
}

uint64_t type metadata accessor for AttributionItem()
{
  uint64_t result;

  result = qword_256980718;
  if (!qword_256980718)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_23A484964(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for AttributionItem();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

void AttributionGroup.id.getter()
{
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_11_0();
  OUTLINED_FUNCTION_60();
}

uint64_t sub_23A4849C8(uint64_t a1, uint64_t a2)
{
  BOOL v3;
  BOOL v6;
  char v8;

  v3 = a1 == 1701667182 && a2 == 0xE400000000000000;
  if (v3 || (sub_23A4AAAB0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else
  {
    v6 = a1 == 0x4C79616C70736964 && a2 == 0xEC0000006C656261;
    if (v6 || (sub_23A4AAAB0() & 1) != 0)
    {
      swift_bridgeObjectRelease();
      return 1;
    }
    else if (a1 == 0x7475626972747461 && a2 == 0xEC000000736E6F69)
    {
      swift_bridgeObjectRelease();
      return 2;
    }
    else
    {
      v8 = sub_23A4AAAB0();
      swift_bridgeObjectRelease();
      if ((v8 & 1) != 0)
        return 2;
      else
        return 3;
    }
  }
}

void sub_23A484B14()
{
  OUTLINED_FUNCTION_45_0();
  sub_23A4AAAD4();
  OUTLINED_FUNCTION_29_0();
  OUTLINED_FUNCTION_10_2();
}

uint64_t sub_23A484B44(char a1)
{
  return *(_QWORD *)&aName_2[8 * a1];
}

void sub_23A484B64()
{
  sub_23A4AAAC8();
  sub_23A4AAAD4();
  OUTLINED_FUNCTION_29_0();
  OUTLINED_FUNCTION_10_2();
}

uint64_t sub_23A484B98()
{
  char *v0;

  return sub_23A484B44(*v0);
}

uint64_t sub_23A484BA0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_23A4849C8(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_23A484BC4()
{
  sub_23A4858EC();
  return sub_23A4AAB04();
}

uint64_t sub_23A484BEC()
{
  sub_23A4858EC();
  return sub_23A4AAB10();
}

void AttributionGroup.encode(to:)(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_256980698);
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  OUTLINED_FUNCTION_4_2();
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_23A4858EC();
  sub_23A4AAAF8();
  sub_23A4AAA80();
  if (!v5)
  {
    sub_23A4AAA80();
    OUTLINED_FUNCTION_26_1();
    __swift_instantiateConcreteTypeFromMangledName(&qword_256980098);
    sub_23A485928(&qword_2569802D0, &qword_2569802D8, (uint64_t)&protocol conformance descriptor for AttributionItem, MEMORY[0x24BEE12A0]);
    OUTLINED_FUNCTION_9_2();
  }
  (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v1, v3);
  OUTLINED_FUNCTION_0();
}

void AttributionGroup.init(from:)(_QWORD *a1@<X0>, uint64_t *a2@<X8>)
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
  uint64_t v14;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569806A8);
  MEMORY[0x24BDAC7A8](v5);
  OUTLINED_FUNCTION_4();
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_23A4858EC();
  sub_23A4AAAEC();
  if (v2)
  {
    OUTLINED_FUNCTION_6();
  }
  else
  {
    v6 = OUTLINED_FUNCTION_9_3();
    v8 = v7;
    v13 = v6;
    swift_bridgeObjectRetain();
    v9 = OUTLINED_FUNCTION_9_3();
    v11 = v10;
    v12 = v9;
    __swift_instantiateConcreteTypeFromMangledName(&qword_256980098);
    OUTLINED_FUNCTION_26_1();
    sub_23A485928(&qword_2569802C0, &qword_2569802C8, (uint64_t)&protocol conformance descriptor for AttributionItem, MEMORY[0x24BEE12D0]);
    swift_bridgeObjectRetain();
    sub_23A4AAA44();
    OUTLINED_FUNCTION_4_4();
    swift_bridgeObjectRetain();
    OUTLINED_FUNCTION_7();
    OUTLINED_FUNCTION_12_0();
    *a2 = v13;
    a2[1] = v8;
    a2[2] = v12;
    a2[3] = v11;
    a2[4] = v14;
    OUTLINED_FUNCTION_6();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  OUTLINED_FUNCTION_0();
}

void sub_23A484F90(_QWORD *a1@<X0>, uint64_t *a2@<X8>)
{
  AttributionGroup.init(from:)(a1, a2);
}

void sub_23A484FA4(_QWORD *a1)
{
  AttributionGroup.encode(to:)(a1);
}

void sub_23A484FB8(_QWORD *a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;

  AttributionGroup.id.getter();
  *a1 = v2;
  a1[1] = v3;
}

uint64_t static AttributionGroup.== infix(_:_:)(_QWORD *a1, _QWORD *a2)
{
  BOOL v2;
  uint64_t v3;
  uint64_t v4;

  v2 = *a1 == *a2 && a1[1] == a2[1];
  if (!v2 && (sub_23A4AAAB0() & 1) == 0)
    return 0;
  v3 = OUTLINED_FUNCTION_11_0();
  return sub_23A48503C(v3, v4);
}

uint64_t sub_23A48503C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  char v15;
  uint64_t v17;

  v4 = type metadata accessor for AttributionItem();
  v5 = MEMORY[0x24BDAC7A8](v4);
  v7 = (uint64_t *)((char *)&v17 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0));
  MEMORY[0x24BDAC7A8](v5);
  v10 = (uint64_t *)((char *)&v17 - v9);
  v11 = *(_QWORD *)(a1 + 16);
  if (v11 != *(_QWORD *)(a2 + 16))
    return 0;
  if (v11 && a1 != a2)
  {
    v12 = (*(unsigned __int8 *)(v8 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80);
    v13 = *(_QWORD *)(v8 + 72);
    do
    {
      sub_23A484964(a1 + v12, (uint64_t)v10);
      sub_23A484964(a2 + v12, (uint64_t)v7);
      if (*v10 == *v7 && v10[1] == v7[1])
      {
        sub_23A48554C((uint64_t)v7);
        sub_23A48554C((uint64_t)v10);
      }
      else
      {
        v15 = sub_23A4AAAB0();
        sub_23A48554C((uint64_t)v7);
        sub_23A48554C((uint64_t)v10);
        if ((v15 & 1) == 0)
          return 0;
      }
      v12 += v13;
      --v11;
    }
    while (v11);
  }
  return 1;
}

uint64_t AttributionGroup.hash(into:)()
{
  uint64_t v0;
  uint64_t v1;

  swift_bridgeObjectRetain();
  sub_23A4AA7F8();
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_7();
  v0 = OUTLINED_FUNCTION_11_0();
  sub_23A4859FC(v0, v1);
  return OUTLINED_FUNCTION_11_2();
}

uint64_t AttributionGroup.hashValue.getter()
{
  uint64_t v0;
  uint64_t v1;
  _BYTE v3[72];

  v1 = *(_QWORD *)(v0 + 32);
  OUTLINED_FUNCTION_45_0();
  swift_bridgeObjectRetain();
  sub_23A4AA7F8();
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_7();
  sub_23A4859FC((uint64_t)v3, v1);
  swift_bridgeObjectRelease();
  return OUTLINED_FUNCTION_29_0();
}

uint64_t sub_23A485238()
{
  uint64_t v0;
  uint64_t v1;
  _BYTE v3[72];

  v1 = *(_QWORD *)(v0 + 32);
  sub_23A4AAAC8();
  swift_bridgeObjectRetain();
  sub_23A4AA7F8();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_23A4859FC((uint64_t)v3, v1);
  swift_bridgeObjectRelease();
  return sub_23A4AAAE0();
}

uint64_t sub_23A4852B8(char a1, int64_t a2, char a3, uint64_t a4)
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
  uint64_t v17;
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
        goto LABEL_24;
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_256980648);
  v10 = *(_QWORD *)(OUTLINED_FUNCTION_6_3() - 8);
  v11 = *(_QWORD *)(v10 + 72);
  v12 = (*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  v13 = (_QWORD *)swift_allocObject();
  v14 = _swift_stdlib_malloc_size(v13);
  if (!v11 || (v14 - v12 == 0x8000000000000000 ? (v15 = v11 == -1) : (v15 = 0), v15))
  {
LABEL_24:
    OUTLINED_FUNCTION_27_1();
    result = sub_23A4AA9C0();
    __break(1u);
    return result;
  }
  v13[2] = v8;
  v13[3] = 2 * ((uint64_t)(v14 - v12) / v11);
LABEL_19:
  v16 = *(unsigned __int8 *)(*(_QWORD *)(OUTLINED_FUNCTION_6_3() - 8) + 80);
  v17 = (v16 + 32) & ~v16;
  v18 = (unint64_t)v13 + v17;
  if ((a1 & 1) != 0)
  {
    sub_23A4A7A84(a4 + v17, v8, v18);
    OUTLINED_FUNCTION_28_1();
  }
  else
  {
    sub_23A485588(0, v8, v18, a4);
  }
  return (uint64_t)v13;
}

char *sub_23A485460(char *result, int64_t a2, char a3, uint64_t a4)
{
  char v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  size_t v11;
  char *v12;

  v5 = (char)result;
  if ((a3 & 1) != 0)
  {
    v6 = *(_QWORD *)(a4 + 24);
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
  v8 = *(_QWORD *)(a4 + 16);
  if (v7 <= v8)
    v9 = *(_QWORD *)(a4 + 16);
  else
    v9 = v7;
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_256980798);
    v10 = (char *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    *((_QWORD *)v10 + 2) = v8;
    *((_QWORD *)v10 + 3) = 2 * ((uint64_t)(v11 - 32) / 40);
  }
  else
  {
    v10 = (char *)MEMORY[0x24BEE4AF8];
  }
  v12 = v10 + 32;
  if ((v5 & 1) != 0)
  {
    sub_23A4A7A90((char *)(a4 + 32), v8, v12);
    OUTLINED_FUNCTION_28_1();
  }
  else
  {
    sub_23A4856A8(0, v8, (unint64_t)v12, a4);
  }
  return v10;
}

uint64_t sub_23A48554C(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata accessor for AttributionItem();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_23A485588(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
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
    v8 = *(_QWORD *)(type metadata accessor for AttributionItem() - 8);
    v9 = *(unsigned __int8 *)(v8 + 80);
    v10 = *(_QWORD *)(v8 + 72);
    v11 = a4 + ((v9 + 32) & ~v9) + v10 * a1;
    v12 = v10 * v4;
    v13 = a3 + v12;
    v14 = v11 + v12;
    if (v11 >= v13 || v14 <= a3)
    {
      swift_arrayInitWithCopy();
      swift_bridgeObjectRelease();
      return v13;
    }
  }
  result = sub_23A4AA9E4();
  __break(1u);
  return result;
}

uint64_t sub_23A4856A8(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
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
      swift_arrayInitWithCopy();
      swift_bridgeObjectRelease();
      return v6;
    }
  }
  result = sub_23A4AA9E4();
  __break(1u);
  return result;
}

char *sub_23A4857A4(uint64_t a1)
{
  return sub_23A485460(0, *(_QWORD *)(a1 + 16), 0, a1);
}

uint64_t sub_23A4857B8(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for AttributionItem();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

unint64_t sub_23A4857FC()
{
  unint64_t result;

  result = qword_256980658;
  if (!qword_256980658)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_256980658);
  }
  return result;
}

uint64_t sub_23A485838(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_256980430);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_23A485878()
{
  unint64_t result;

  result = qword_256980668;
  if (!qword_256980668)
  {
    result = MEMORY[0x23B84E2B0](&unk_23A4AC05C, &type metadata for AttributionItem.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256980668);
  }
  return result;
}

void sub_23A4858B4(_QWORD *a1)
{
  if (!*a1)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256980650);
    OUTLINED_FUNCTION_25_0();
  }
  OUTLINED_FUNCTION_60();
}

unint64_t sub_23A4858EC()
{
  unint64_t result;

  result = qword_2569806A0;
  if (!qword_2569806A0)
  {
    result = MEMORY[0x23B84E2B0](&unk_23A4AC00C, &type metadata for AttributionGroup.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2569806A0);
  }
  return result;
}

uint64_t sub_23A485928(unint64_t *a1, _QWORD *a2, uint64_t a3, uint64_t a4)
{
  uint64_t result;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  result = *a1;
  if (!result)
  {
    v8 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256980098);
    sub_23A485AE0(a2, (void (*)(uint64_t))type metadata accessor for AttributionItem);
    v10 = v9;
    result = MEMORY[0x23B84E2B0](a4, v8, &v10);
    atomic_store(result, a1);
  }
  return result;
}

void sub_23A4859AC(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;

  v4 = (id)sub_23A4AA7BC();
  swift_bridgeObjectRelease();
  objc_msgSend(a3, sel_setAceId_, v4);

}

uint64_t sub_23A4859FC(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t result;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v3 = type metadata accessor for AttributionItem();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v6 = (char *)&v11 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = *(_QWORD *)(a2 + 16);
  result = sub_23A4AAAD4();
  if (v7)
  {
    v9 = a2 + ((*(unsigned __int8 *)(v4 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80));
    v10 = *(_QWORD *)(v4 + 72);
    do
    {
      sub_23A484964(v9, (uint64_t)v6);
      sub_23A4AA7F8();
      result = sub_23A48554C((uint64_t)v6);
      v9 += v10;
      --v7;
    }
    while (v7);
  }
  return result;
}

void sub_23A485AB4()
{
  sub_23A485AE0(&qword_2569806B0, (void (*)(uint64_t))type metadata accessor for AttributionItem);
}

void sub_23A485AE0(_QWORD *a1, void (*a2)(uint64_t))
{
  if (!*a1)
  {
    a2(255);
    OUTLINED_FUNCTION_25_0();
  }
  OUTLINED_FUNCTION_60();
}

uint64_t sub_23A485B14()
{
  return MEMORY[0x24BEE0D10];
}

unint64_t sub_23A485B24()
{
  unint64_t result;

  result = qword_2569806B8;
  if (!qword_2569806B8)
  {
    result = MEMORY[0x23B84E2B0](&protocol conformance descriptor for AttributionGroup, &type metadata for AttributionGroup);
    atomic_store(result, (unint64_t *)&qword_2569806B8);
  }
  return result;
}

void sub_23A485B60(_QWORD *a1@<X8>)
{
  uint64_t v2;

  AttributionItem.appPunchOut.getter();
  *a1 = v2;
  OUTLINED_FUNCTION_60();
}

uint64_t *initializeBufferWithCopyOfBuffer for AttributionItem(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t *v4;
  int v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  void (*v14)(char *, char *, uint64_t);
  uint64_t v15;
  char *v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  char *v21;

  v4 = a1;
  v5 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v19 = *a2;
    *v4 = *a2;
    v4 = (uint64_t *)(v19 + ((v5 + 16) & ~(unint64_t)v5));
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
    a1[4] = a2[4];
    a1[5] = v9;
    v10 = a2[7];
    v11 = *(int *)(a3 + 32);
    v21 = (char *)a1 + v11;
    v12 = (char *)a2 + v11;
    a1[6] = a2[6];
    a1[7] = v10;
    v13 = sub_23A4AA348();
    v14 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v13 - 8) + 16);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v14(v21, v12, v13);
    v15 = *(int *)(a3 + 36);
    v16 = (char *)v4 + v15;
    v17 = (char *)a2 + v15;
    v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_256980650);
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v18 - 8) + 16))(v16, v17, v18);
  }
  return v4;
}

uint64_t destroy for AttributionItem(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v4 = a1 + *(int *)(a2 + 32);
  v5 = sub_23A4AA348();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(v4, v5);
  v6 = a1 + *(int *)(a2 + 36);
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_256980650);
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 8))(v6, v7);
}

_QWORD *initializeWithCopy for AttributionItem(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  void (*v13)(char *, char *, uint64_t);
  uint64_t v14;
  char *v15;
  char *v16;
  uint64_t v17;
  char *v19;

  v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  v7 = a2[3];
  a1[2] = a2[2];
  a1[3] = v7;
  v8 = a2[5];
  a1[4] = a2[4];
  a1[5] = v8;
  v9 = a2[7];
  v10 = *(int *)(a3 + 32);
  v19 = (char *)a1 + v10;
  v11 = (char *)a2 + v10;
  a1[6] = a2[6];
  a1[7] = v9;
  v12 = sub_23A4AA348();
  v13 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v12 - 8) + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v13(v19, v11, v12);
  v14 = *(int *)(a3 + 36);
  v15 = (char *)a1 + v14;
  v16 = (char *)a2 + v14;
  v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_256980650);
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v17 - 8) + 16))(v15, v16, v17);
  return a1;
}

_QWORD *assignWithCopy for AttributionItem(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v6;
  char *v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  char *v12;
  uint64_t v13;

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
  v6 = *(int *)(a3 + 32);
  v7 = (char *)a1 + v6;
  v8 = (char *)a2 + v6;
  v9 = sub_23A4AA348();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v9 - 8) + 24))(v7, v8, v9);
  v10 = *(int *)(a3 + 36);
  v11 = (char *)a1 + v10;
  v12 = (char *)a2 + v10;
  v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_256980650);
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v13 - 8) + 24))(v11, v12, v13);
  return a1;
}

_OWORD *initializeWithTake for AttributionItem(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  __int128 v6;
  __int128 v7;
  uint64_t v8;
  char *v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  char *v14;
  uint64_t v15;

  v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  v7 = a2[3];
  a1[2] = a2[2];
  a1[3] = v7;
  v8 = *(int *)(a3 + 32);
  v9 = (char *)a1 + v8;
  v10 = (char *)a2 + v8;
  v11 = sub_23A4AA348();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v11 - 8) + 32))(v9, v10, v11);
  v12 = *(int *)(a3 + 36);
  v13 = (char *)a1 + v12;
  v14 = (char *)a2 + v12;
  v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_256980650);
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v15 - 8) + 32))(v13, v14, v15);
  return a1;
}

_QWORD *assignWithTake for AttributionItem(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  char *v16;
  uint64_t v17;

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
  v9 = a2[7];
  a1[6] = a2[6];
  a1[7] = v9;
  swift_bridgeObjectRelease();
  v10 = *(int *)(a3 + 32);
  v11 = (char *)a1 + v10;
  v12 = (char *)a2 + v10;
  v13 = sub_23A4AA348();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v13 - 8) + 40))(v11, v12, v13);
  v14 = *(int *)(a3 + 36);
  v15 = (char *)a1 + v14;
  v16 = (char *)a2 + v14;
  v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_256980650);
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v17 - 8) + 40))(v15, v16, v17);
  return a1;
}

uint64_t getEnumTagSinglePayload for AttributionItem()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_23A4860C4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v4;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  if ((_DWORD)a2 == 0x7FFFFFFF)
  {
    v4 = *(_QWORD *)(a1 + 8);
    if (v4 >= 0xFFFFFFFF)
      LODWORD(v4) = -1;
    return (v4 + 1);
  }
  else
  {
    v8 = OUTLINED_FUNCTION_14_2();
    if (*(_DWORD *)(*(_QWORD *)(v8 - 8) + 84) == (_DWORD)a2)
    {
      v9 = v8;
      v10 = *(int *)(a3 + 32);
    }
    else
    {
      v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_256980650);
      v10 = *(int *)(a3 + 36);
    }
    return __swift_getEnumTagSinglePayload(a1 + v10, a2, v9);
  }
}

uint64_t storeEnumTagSinglePayload for AttributionItem()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

void sub_23A486168(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  if (a3 == 0x7FFFFFFF)
  {
    *(_QWORD *)(a1 + 8) = (a2 - 1);
    OUTLINED_FUNCTION_5();
  }
  else
  {
    v8 = OUTLINED_FUNCTION_14_2();
    if (*(_DWORD *)(*(_QWORD *)(v8 - 8) + 84) == a3)
    {
      v9 = v8;
      v10 = *(int *)(a4 + 32);
    }
    else
    {
      v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_256980650);
      v10 = *(int *)(a4 + 36);
    }
    __swift_storeEnumTagSinglePayload(a1 + v10, a2, a2, v9);
  }
}

void sub_23A4861F4()
{
  unint64_t v0;
  unint64_t v1;

  sub_23A4AA348();
  if (v0 <= 0x3F)
  {
    sub_23A486288();
    if (v1 <= 0x3F)
      swift_initStructMetadata();
  }
}

void sub_23A486288()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_256980728[0])
  {
    sub_23A4857FC();
    v0 = sub_23A4AA2F4();
    if (!v1)
      atomic_store(v0, qword_256980728);
  }
}

uint64_t destroy for AttributionGroup()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

_QWORD *initializeWithCopy for AttributionGroup(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;
  uint64_t v4;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  v4 = a2[3];
  a1[2] = a2[2];
  a1[3] = v4;
  a1[4] = a2[4];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

_QWORD *assignWithCopy for AttributionGroup(_QWORD *a1, _QWORD *a2)
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
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t assignWithTake for AttributionGroup(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for AttributionGroup(uint64_t a1, int a2)
{
  unint64_t v2;

  if (a2)
  {
    if (a2 < 0 && *(_BYTE *)(a1 + 40))
    {
      LODWORD(v2) = *(_DWORD *)a1 + 0x7FFFFFFF;
    }
    else
    {
      v2 = *(_QWORD *)(a1 + 8);
      if (v2 >= 0xFFFFFFFF)
        LODWORD(v2) = -1;
    }
  }
  else
  {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for AttributionGroup(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for AttributionGroup()
{
  return &type metadata for AttributionGroup;
}

uint64_t storeEnumTagSinglePayload for AttributionGroup.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_23A48651C + 4 * byte_23A4ABC55[v4]))();
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)sub_23A486550 + 4 * byte_23A4ABC50[v4]))();
}

uint64_t sub_23A486550(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_23A486558(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x23A486560);
  return result;
}

uint64_t sub_23A48656C(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x23A486574);
  *(_BYTE *)result = a2 + 2;
  return result;
}

uint64_t sub_23A486578(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23A486580(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for AttributionGroup.CodingKeys()
{
  return &type metadata for AttributionGroup.CodingKeys;
}

uint64_t storeEnumTagSinglePayload for AttributionItem.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_23A4865E8 + 4 * byte_23A4ABC5F[v4]))();
  *a1 = a2 + 5;
  return ((uint64_t (*)(void))((char *)sub_23A48661C + 4 * byte_23A4ABC5A[v4]))();
}

uint64_t sub_23A48661C(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_23A486624(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x23A48662CLL);
  return result;
}

uint64_t sub_23A486638(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x23A486640);
  *(_BYTE *)result = a2 + 5;
  return result;
}

uint64_t sub_23A486644(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23A48664C(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for AttributionItem.CodingKeys()
{
  return &type metadata for AttributionItem.CodingKeys;
}

unint64_t sub_23A48666C()
{
  unint64_t result;

  result = qword_256980768;
  if (!qword_256980768)
  {
    result = MEMORY[0x23B84E2B0](&unk_23A4ABF2C, &type metadata for AttributionItem.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256980768);
  }
  return result;
}

unint64_t sub_23A4866AC()
{
  unint64_t result;

  result = qword_256980770;
  if (!qword_256980770)
  {
    result = MEMORY[0x23B84E2B0](&unk_23A4ABFE4, &type metadata for AttributionGroup.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256980770);
  }
  return result;
}

unint64_t sub_23A4866EC()
{
  unint64_t result;

  result = qword_256980778;
  if (!qword_256980778)
  {
    result = MEMORY[0x23B84E2B0](&unk_23A4ABF54, &type metadata for AttributionGroup.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256980778);
  }
  return result;
}

unint64_t sub_23A48672C()
{
  unint64_t result;

  result = qword_256980780;
  if (!qword_256980780)
  {
    result = MEMORY[0x23B84E2B0](&unk_23A4ABF7C, &type metadata for AttributionGroup.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256980780);
  }
  return result;
}

unint64_t sub_23A48676C()
{
  unint64_t result;

  result = qword_256980788;
  if (!qword_256980788)
  {
    result = MEMORY[0x23B84E2B0](&unk_23A4ABE9C, &type metadata for AttributionItem.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256980788);
  }
  return result;
}

unint64_t sub_23A4867AC()
{
  unint64_t result;

  result = qword_256980790;
  if (!qword_256980790)
  {
    result = MEMORY[0x23B84E2B0](&unk_23A4ABEC4, &type metadata for AttributionItem.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256980790);
  }
  return result;
}

uint64_t sub_23A4867E8(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_256980430);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t OUTLINED_FUNCTION_3_5()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, _QWORD))(v1 + 8))(v0, *(_QWORD *)(v2 - 128));
}

uint64_t OUTLINED_FUNCTION_4_4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 8))(v1, v0);
}

uint64_t OUTLINED_FUNCTION_6_3()
{
  return type metadata accessor for AttributionItem();
}

uint64_t OUTLINED_FUNCTION_9_3()
{
  return sub_23A4AAA2C();
}

uint64_t OUTLINED_FUNCTION_11_2()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_14_2()
{
  return sub_23A4AA348();
}

uint64_t OUTLINED_FUNCTION_16_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(void))
{
  return a4();
}

uint64_t OUTLINED_FUNCTION_18_2()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 8))(v0, v1);
}

uint64_t OUTLINED_FUNCTION_21_2()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_23_1()
{
  uint64_t v0;

  return __swift_destroy_boxed_opaque_existential_1(*(_QWORD *)(v0 - 96));
}

void OUTLINED_FUNCTION_25_0()
{
  JUMPOUT(0x23B84E2B0);
}

void OUTLINED_FUNCTION_26_1()
{
  uint64_t v0;

  *(_BYTE *)(v0 - 67) = 2;
}

uint64_t OUTLINED_FUNCTION_28_1()
{
  uint64_t v0;

  *(_QWORD *)(v0 + 16) = 0;
  return swift_bridgeObjectRelease();
}

char *OUTLINED_FUNCTION_31_1(char *a1, int64_t a2)
{
  uint64_t v2;

  return sub_23A485460(a1, a2, 1, v2);
}

uint64_t OUTLINED_FUNCTION_32_1(char a1, int64_t a2)
{
  uint64_t v2;

  return sub_23A4852B8(a1, a2, 1, v2);
}

uint64_t sub_23A486920(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  _QWORD *v4;
  uint64_t v5;

  v4[5] = a3;
  v4[6] = v3;
  v4[3] = a1;
  v4[4] = a2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2569807B8);
  v4[7] = OUTLINED_FUNCTION_35();
  v5 = sub_23A4AA588();
  v4[8] = v5;
  v4[9] = *(_QWORD *)(v5 - 8);
  v4[10] = OUTLINED_FUNCTION_35();
  OUTLINED_FUNCTION_24();
  return OUTLINED_FUNCTION_1_0();
}

uint64_t sub_23A486984()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;

  v2 = v0[9];
  v1 = v0[10];
  v4 = v0[7];
  v3 = v0[8];
  v5 = v0[5];
  swift_bridgeObjectRetain();
  OUTLINED_FUNCTION_13_3();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v2 + 16))(v4, v1, v3);
  __swift_storeEnumTagSinglePayload(v4, 0, 1, v3);
  v6 = (_QWORD *)swift_task_alloc();
  v0[11] = v6;
  *v6 = v0;
  v6[1] = sub_23A486A48;
  return sub_23A48D0F0(v0[7], COERCE__INT64((double)v5), 0);
}

uint64_t sub_23A486A48(uint64_t a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v4;
  uint64_t v5;

  v4 = *v2;
  *(_QWORD *)(*v2 + 96) = v1;
  swift_task_dealloc();
  v5 = *(_QWORD *)(v4 + 56);
  if (!v1)
    *(_QWORD *)(v4 + 104) = a1;
  sub_23A487024(v5);
  OUTLINED_FUNCTION_24();
  return swift_task_switch();
}

uint64_t sub_23A486AC4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v2 = *(_QWORD *)(v0 + 72);
  v1 = *(_QWORD *)(v0 + 80);
  v3 = *(_QWORD *)(v0 + 64);
  v4 = sub_23A4AA5C4();
  v6 = v5;
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  OUTLINED_FUNCTION_12_1();
  swift_task_dealloc();
  return (*(uint64_t (**)(uint64_t, uint64_t))(v0 + 8))(v4, v6);
}

uint64_t sub_23A486B40()
{
  _DWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  NSObject *v4;
  os_log_type_t v5;
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;

  if (qword_25697FF48 != -1)
    swift_once();
  v3 = sub_23A4AA6F0();
  __swift_project_value_buffer(v3, (uint64_t)qword_2569815D0);
  OUTLINED_FUNCTION_8_4();
  OUTLINED_FUNCTION_8_4();
  v4 = sub_23A4AA6D8();
  v5 = sub_23A4AA8D0();
  if (os_log_type_enabled(v4, v5))
  {
    OUTLINED_FUNCTION_6_4();
    v6 = (_QWORD *)OUTLINED_FUNCTION_11_3();
    *v0 = 138412290;
    OUTLINED_FUNCTION_8_4();
    v7 = _swift_stdlib_bridgeErrorToNSError();
    OUTLINED_FUNCTION_3_6(v7);
    *v6 = v2;
    OUTLINED_FUNCTION_7_3();
    OUTLINED_FUNCTION_7_3();
    OUTLINED_FUNCTION_10_3(&dword_23A470000, v4, v8, "Error getting attributionGroupAsLabels : %@");
    __swift_instantiateConcreteTypeFromMangledName(&qword_2569807A8);
    OUTLINED_FUNCTION_9_4();
    OUTLINED_FUNCTION_0_0();
  }

  OUTLINED_FUNCTION_7_3();
  OUTLINED_FUNCTION_7_3();
  OUTLINED_FUNCTION_7_3();
  (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v1 + 72) + 8))(*(_QWORD *)(v1 + 80), *(_QWORD *)(v1 + 64));
  OUTLINED_FUNCTION_12_1();
  swift_task_dealloc();
  return OUTLINED_FUNCTION_0_8(0, 0, *(uint64_t (**)(void))(v1 + 8));
}

uint64_t sub_23A486C94(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;

  v2[3] = a1;
  v2[4] = v1;
  v3 = sub_23A4AA588();
  v2[5] = v3;
  v2[6] = *(_QWORD *)(v3 - 8);
  v2[7] = OUTLINED_FUNCTION_35();
  OUTLINED_FUNCTION_24();
  return OUTLINED_FUNCTION_1_0();
}

uint64_t sub_23A486CDC()
{
  _QWORD *v0;
  uint64_t v1;
  int64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  uint64_t v12;

  v1 = v0[3];
  v2 = *(_QWORD *)(v1 + 16);
  v3 = MEMORY[0x24BEE4AF8];
  if (v2)
  {
    v4 = v0[6];
    v12 = MEMORY[0x24BEE4AF8];
    sub_23A4A889C(0, v2, 0);
    v3 = v12;
    v5 = v1 + 40;
    do
    {
      swift_bridgeObjectRetain();
      OUTLINED_FUNCTION_13_3();
      v7 = *(_QWORD *)(v12 + 16);
      v6 = *(_QWORD *)(v12 + 24);
      if (v7 >= v6 >> 1)
        sub_23A4A889C(v6 > 1, v7 + 1, 1);
      v8 = v0[7];
      v9 = v0[5];
      *(_QWORD *)(v12 + 16) = v7 + 1;
      (*(void (**)(unint64_t, uint64_t, uint64_t))(v4 + 32))(v12+ ((*(unsigned __int8 *)(v4 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80))+ *(_QWORD *)(v4 + 72) * v7, v8, v9);
      v5 += 16;
      --v2;
    }
    while (v2);
  }
  v0[8] = v3;
  v10 = (_QWORD *)swift_task_alloc();
  v0[9] = v10;
  *v10 = v0;
  v10[1] = sub_23A486E0C;
  return sub_23A48D434(v3);
}

uint64_t sub_23A486E0C(uint64_t a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v4;

  v4 = *v2;
  *(_QWORD *)(*v2 + 80) = v1;
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  if (!v1)
    *(_QWORD *)(v4 + 88) = a1;
  OUTLINED_FUNCTION_24();
  return swift_task_switch();
}

uint64_t sub_23A486E84()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v1 = sub_23A4AA5C4();
  v3 = v2;
  swift_release();
  swift_task_dealloc();
  return (*(uint64_t (**)(uint64_t, uint64_t))(v0 + 8))(v1, v3);
}

uint64_t sub_23A486EDC()
{
  _DWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  NSObject *v4;
  os_log_type_t v5;
  _BOOL4 v6;
  void *v7;
  _QWORD *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;

  if (qword_25697FF48 != -1)
    swift_once();
  v3 = sub_23A4AA6F0();
  __swift_project_value_buffer(v3, (uint64_t)qword_2569815D0);
  OUTLINED_FUNCTION_8_4();
  OUTLINED_FUNCTION_8_4();
  v4 = sub_23A4AA6D8();
  v5 = sub_23A4AA8D0();
  v6 = os_log_type_enabled(v4, v5);
  v7 = *(void **)(v1 + 80);
  if (v6)
  {
    OUTLINED_FUNCTION_6_4();
    v8 = (_QWORD *)OUTLINED_FUNCTION_11_3();
    *v0 = 138412290;
    v9 = v7;
    v10 = _swift_stdlib_bridgeErrorToNSError();
    OUTLINED_FUNCTION_3_6(v10);
    *v8 = v2;
    OUTLINED_FUNCTION_5_3();
    OUTLINED_FUNCTION_5_3();
    OUTLINED_FUNCTION_10_3(&dword_23A470000, v4, v11, "Error calling attributionListAsLabels: %@");
    __swift_instantiateConcreteTypeFromMangledName(&qword_2569807A8);
    OUTLINED_FUNCTION_9_4();
    OUTLINED_FUNCTION_0_0();
  }
  OUTLINED_FUNCTION_5_3();
  OUTLINED_FUNCTION_5_3();
  OUTLINED_FUNCTION_5_3();

  swift_task_dealloc();
  return OUTLINED_FUNCTION_0_8(0, 0, *(uint64_t (**)(void))(v1 + 8));
}

uint64_t sub_23A487024(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569807B8);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t OUTLINED_FUNCTION_0_8(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  return a3();
}

uint64_t OUTLINED_FUNCTION_3_6(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(v1 + 16) = a1;
  return sub_23A4AA900();
}

void OUTLINED_FUNCTION_5_3()
{
  void *v0;

}

uint64_t OUTLINED_FUNCTION_6_4()
{
  return swift_slowAlloc();
}

void OUTLINED_FUNCTION_7_3()
{
  void *v0;

}

id OUTLINED_FUNCTION_8_4()
{
  void *v0;

  return v0;
}

uint64_t OUTLINED_FUNCTION_9_4()
{
  return swift_arrayDestroy();
}

void OUTLINED_FUNCTION_10_3(void *a1, NSObject *a2, uint64_t a3, const char *a4)
{
  uint8_t *v4;
  os_log_type_t v5;

  _os_log_impl(a1, a2, v5, a4, v4, 0xCu);
}

uint64_t OUTLINED_FUNCTION_11_3()
{
  return swift_slowAlloc();
}

uint64_t OUTLINED_FUNCTION_12_1()
{
  return swift_task_dealloc();
}

uint64_t OUTLINED_FUNCTION_13_3()
{
  return sub_23A4AA57C();
}

uint64_t sub_23A487110@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
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
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t result;
  uint64_t v19;
  uint64_t *v20;
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
  uint64_t KeyPath;
  void (*v33)(char *, _QWORD);
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  char *v39;
  uint64_t (*v40)(uint64_t, uint64_t, uint64_t);
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  char v48[32];
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;

  __swift_instantiateConcreteTypeFromMangledName(&qword_2569807C0);
  OUTLINED_FUNCTION_0_1();
  MEMORY[0x24BDAC7A8](v5);
  OUTLINED_FUNCTION_8_2();
  v44 = v6;
  v7 = sub_23A4A9DF0();
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7);
  OUTLINED_FUNCTION_8_2();
  v41 = v9;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2569807C8);
  OUTLINED_FUNCTION_0_1();
  MEMORY[0x24BDAC7A8](v10);
  v12 = (char *)&v34 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569807D0);
  OUTLINED_FUNCTION_0_1();
  v15 = MEMORY[0x24BDAC7A8](v14);
  v36 = (uint64_t)&v34 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v15);
  v35 = (uint64_t)&v34 - v17;
  v42 = v8;
  v43 = v7;
  v40 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v8 + 16);
  result = v40(a2, v2, v7);
  v19 = *(_QWORD *)(a1 + 16);
  if (v19)
  {
    v38 = v13;
    v39 = v12;
    swift_bridgeObjectRetain();
    v34 = a1;
    v20 = (uint64_t *)(a1 + 64);
    v37 = a2;
    do
    {
      v21 = *(v20 - 3);
      v46 = *(v20 - 4);
      v23 = *(v20 - 2);
      v22 = *(v20 - 1);
      v24 = *v20;
      v25 = v41;
      v26 = v43;
      v40(v41, a2, v43);
      v45 = v23;
      v49 = v23;
      v50 = v22;
      v27 = sub_23A4A9FA0();
      v28 = v44;
      __swift_storeEnumTagSinglePayload(v44, 1, 1, v27);
      sub_23A4874A4();
      sub_23A47C0E8();
      v47 = v21;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain_n();
      swift_bridgeObjectRetain();
      v29 = (uint64_t)v39;
      sub_23A4A9EEC();
      sub_23A48762C(v28, &qword_2569807C0);
      swift_bridgeObjectRelease();
      (*(void (**)(uint64_t, uint64_t))(v42 + 8))(v25, v26);
      if (__swift_getEnumTagSinglePayload(v29, 1, v38) == 1)
      {
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        sub_23A48762C(v29, &qword_2569807C8);
        a2 = v37;
      }
      else
      {
        v30 = v35;
        sub_23A4874E4(v29, v35);
        v31 = v36;
        sub_23A48752C(v30, v36);
        KeyPath = swift_getKeyPath();
        *(&v34 - 2) = MEMORY[0x24BDAC7A8](KeyPath);
        swift_getKeyPath();
        v49 = v46;
        v50 = v47;
        v51 = v45;
        v52 = v22;
        v53 = v24;
        sub_23A4875AC();
        a2 = v37;
        v33 = (void (*)(char *, _QWORD))sub_23A4A9E08();
        sub_23A4875F0();
        sub_23A4A9E50();
        v33(v48, 0);
        sub_23A48762C(v31, &qword_2569807D0);
        sub_23A48762C(v30, &qword_2569807D0);
      }
      v20 += 5;
      --v19;
    }
    while (v19);
    return swift_bridgeObjectRelease();
  }
  return result;
}

unint64_t sub_23A4874A4()
{
  unint64_t result;
  uint64_t v1;

  result = qword_2569807D8;
  if (!qword_2569807D8)
  {
    v1 = sub_23A4A9DF0();
    result = MEMORY[0x23B84E2B0](MEMORY[0x24BDCC588], v1);
    atomic_store(result, (unint64_t *)&qword_2569807D8);
  }
  return result;
}

uint64_t sub_23A4874E4(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569807D0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_23A48752C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569807D0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_23A487578()
{
  return 8;
}

uint64_t sub_23A487584()
{
  return swift_release();
}

uint64_t sub_23A48758C(_QWORD *a1, _QWORD *a2)
{
  *a2 = *a1;
  return swift_retain();
}

_QWORD *sub_23A4875A0(_QWORD *result, _QWORD *a2)
{
  *a2 = *result;
  return result;
}

unint64_t sub_23A4875AC()
{
  unint64_t result;
  uint64_t v1;

  result = qword_2569807E0;
  if (!qword_2569807E0)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2569807D0);
    result = MEMORY[0x23B84E2B0](MEMORY[0x24BEE1BC0], v1);
    atomic_store(result, (unint64_t *)&qword_2569807E0);
  }
  return result;
}

unint64_t sub_23A4875F0()
{
  unint64_t result;

  result = qword_2569807E8;
  if (!qword_2569807E8)
  {
    result = MEMORY[0x23B84E2B0](&protocol conformance descriptor for AttributeScopes.DeviceExpertIntentAttributes.AttributionGroupKey, &type metadata for AttributeScopes.DeviceExpertIntentAttributes.AttributionGroupKey);
    atomic_store(result, (unint64_t *)&qword_2569807E8);
  }
  return result;
}

uint64_t sub_23A48762C(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t AttributionModel.init(label:)(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  void (*v7)(char *, uint64_t, uint64_t);
  uint64_t v9;

  v2 = OUTLINED_FUNCTION_6_5();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  OUTLINED_FUNCTION_2_6();
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)&v9 - v5;
  sub_23A4A9DE4();
  v7 = *(void (**)(char *, uint64_t, uint64_t))(v3 + 16);
  OUTLINED_FUNCTION_7_4();
  swift_getKeyPath();
  type metadata accessor for AttributeScopes.DeviceExpertIntentAttributes();
  sub_23A488B3C(&qword_2569807F0);
  sub_23A4A9E74();
  OUTLINED_FUNCTION_10_4((uint64_t)v6);
  v7(v6, a1, v2);
  OUTLINED_FUNCTION_7_4();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2569807F8);
  OUTLINED_FUNCTION_14_3();
  OUTLINED_FUNCTION_10_4((uint64_t)v6);
  return OUTLINED_FUNCTION_10_4(a1);
}

uint64_t sub_23A487794()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_256980918);
  return sub_23A4AA798() & 1;
}

uint64_t sub_23A4877EC()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_256980918);
  return sub_23A4AA78C();
}

void sub_23A487830()
{
  sub_23A4875F0();
  sub_23A4A9E8C();
  __break(1u);
}

void sub_23A487860()
{
  sub_23A487830();
}

uint64_t sub_23A487874@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  AttributeScopes.deviceExpert.getter();
  result = type metadata accessor for AttributeScopes.DeviceExpertIntentAttributes();
  *a1 = result;
  return result;
}

uint64_t AttributionModel.label.getter()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_2569807F8);
  return sub_23A4A9E5C();
}

uint64_t sub_23A4878D0(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v7;

  v2 = sub_23A4A9DF0();
  MEMORY[0x24BDAC7A8](v2);
  v4 = (char *)&v7 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t))(v5 + 16))(v4, a1);
  return AttributionModel.label.setter((uint64_t)v4);
}

uint64_t AttributionModel.label.setter(uint64_t a1)
{
  char *v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  void (*v8)(char *, uint64_t, uint64_t);
  void (*v9)(char *, uint64_t);
  uint64_t v11;

  v3 = OUTLINED_FUNCTION_6_5();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  OUTLINED_FUNCTION_2_6();
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)&v11 - v6;
  v8 = *(void (**)(char *, uint64_t, uint64_t))(v4 + 16);
  v8((char *)&v11 - v6, a1, v3);
  v8(v1, (uint64_t)v7, v3);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2569807F8);
  OUTLINED_FUNCTION_14_3();
  v9 = *(void (**)(char *, uint64_t))(v4 + 8);
  v9(v7, v3);
  return ((uint64_t (*)(uint64_t, uint64_t))v9)(a1, v3);
}

void (*AttributionModel.label.modify(_QWORD *a1))(uint64_t a1, char a2)
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t v4;

  v3 = malloc(0x40uLL);
  *a1 = v3;
  *v3 = v1;
  v4 = OUTLINED_FUNCTION_6_5();
  v3[1] = v4;
  v3[2] = *(_QWORD *)(v4 - 8);
  v3[3] = OUTLINED_FUNCTION_9_5();
  v3[4] = OUTLINED_FUNCTION_9_5();
  v3[5] = OUTLINED_FUNCTION_9_5();
  v3[6] = OUTLINED_FUNCTION_9_5();
  v3[7] = __swift_instantiateConcreteTypeFromMangledName(&qword_2569807F8);
  sub_23A4A9E5C();
  return sub_23A487AA4;
}

void sub_23A487AA4(uint64_t a1, char a2)
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void (*v6)(uint64_t, uint64_t, uint64_t);
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v2 = *(_QWORD **)a1;
  v3 = *(_QWORD *)(*(_QWORD *)a1 + 40);
  v4 = *(_QWORD *)(*(_QWORD *)a1 + 32);
  v5 = *(_QWORD *)(*(_QWORD *)a1 + 8);
  v6 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(*(_QWORD *)a1 + 16) + 16);
  v6(v3, *(_QWORD *)(*(_QWORD *)a1 + 48), v5);
  v6(v4, v3, v5);
  v7 = (void *)v2[6];
  v8 = (void *)v2[4];
  v9 = (void *)v2[5];
  v10 = (void *)v2[3];
  if ((a2 & 1) != 0)
  {
    v6(v2[3], v2[4], v2[1]);
    sub_23A4A9E68();
    OUTLINED_FUNCTION_11_4((uint64_t)v8);
  }
  else
  {
    sub_23A4A9E68();
  }
  OUTLINED_FUNCTION_11_4((uint64_t)v9);
  OUTLINED_FUNCTION_11_4((uint64_t)v7);
  free(v7);
  free(v9);
  free(v8);
  free(v10);
  free(v2);
}

char *AttributionModel.attributionGroups.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t *v7;
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
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void (*v26)(uint64_t, uint64_t);
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  int v30;
  char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  unint64_t v39;
  unint64_t v40;
  char *v41;
  uint64_t v43;
  char *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t KeyPath;

  v48 = __swift_instantiateConcreteTypeFromMangledName(&qword_256980800);
  OUTLINED_FUNCTION_1_5();
  MEMORY[0x24BDAC7A8](v1);
  OUTLINED_FUNCTION_1_1();
  v4 = (uint64_t *)(v2 - v3);
  MEMORY[0x24BDAC7A8](v5);
  v7 = (uint64_t *)((char *)&v43 - v6);
  __swift_instantiateConcreteTypeFromMangledName(&qword_256980808);
  OUTLINED_FUNCTION_1_5();
  MEMORY[0x24BDAC7A8](v8);
  OUTLINED_FUNCTION_8_2();
  v50 = v9;
  v52 = __swift_instantiateConcreteTypeFromMangledName(&qword_256980810);
  v47 = *(_QWORD *)(v52 - 8);
  OUTLINED_FUNCTION_1_5();
  MEMORY[0x24BDAC7A8](v10);
  OUTLINED_FUNCTION_8_2();
  v51 = v11;
  v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_256980818);
  v13 = *(_QWORD *)(v12 - 8);
  MEMORY[0x24BDAC7A8](v12);
  OUTLINED_FUNCTION_1_1();
  v49 = v14 - v15;
  MEMORY[0x24BDAC7A8](v16);
  v18 = (char *)&v43 - v17;
  v19 = sub_23A4A9DC0();
  v45 = *(_QWORD *)(v19 - 8);
  v46 = v19;
  OUTLINED_FUNCTION_1_5();
  MEMORY[0x24BDAC7A8](v20);
  OUTLINED_FUNCTION_5_4();
  v21 = OUTLINED_FUNCTION_6_5();
  v22 = *(_QWORD *)(v21 - 8);
  MEMORY[0x24BDAC7A8](v21);
  OUTLINED_FUNCTION_4();
  v25 = v24 - v23;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2569807F8);
  sub_23A4A9E5C();
  sub_23A4A9DD8();
  v26 = *(void (**)(uint64_t, uint64_t))(v22 + 8);
  v27 = v48;
  v26(v25, v21);
  KeyPath = swift_getKeyPath();
  swift_getKeyPath();
  sub_23A4875F0();
  sub_23A4A9DCC();
  v28 = v50;
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v45 + 8))(v0, v46);
  v44 = v18;
  v45 = v13;
  (*(void (**)(uint64_t, char *, uint64_t))(v13 + 16))(v49, v18, v12);
  sub_23A488758(&qword_256980820, &qword_256980818);
  v46 = v12;
  sub_23A4AA828();
  sub_23A488758(&qword_256980828, &qword_256980810);
  v49 = v29;
  sub_23A4AA8F4();
  v30 = OUTLINED_FUNCTION_8_5();
  v31 = (char *)MEMORY[0x24BEE4AF8];
  while (v30 != 1)
  {
    sub_23A487FB8(v28, (uint64_t)v7);
    v32 = *(int *)(v27 + 48);
    v33 = (uint64_t)v4 + v32;
    v34 = *v7;
    v35 = v7[1];
    v37 = v7[2];
    v36 = v7[3];
    v38 = v7[4];
    *v4 = *v7;
    v4[1] = v35;
    v4[2] = v37;
    v4[3] = v36;
    v4[4] = v38;
    sub_23A48752C((uint64_t)v7 + v32, (uint64_t)v4 + v32);
    sub_23A488000(v34, v35);
    sub_23A475594(v33, &qword_2569807D0);
    sub_23A475594((uint64_t)v7, &qword_256980800);
    if (v35)
    {
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        v31 = OUTLINED_FUNCTION_12_2(0, *((_QWORD *)v31 + 2) + 1);
      v40 = *((_QWORD *)v31 + 2);
      v39 = *((_QWORD *)v31 + 3);
      if (v40 >= v39 >> 1)
        v31 = OUTLINED_FUNCTION_12_2((char *)(v39 > 1), v40 + 1);
      *((_QWORD *)v31 + 2) = v40 + 1;
      v41 = &v31[40 * v40];
      *((_QWORD *)v41 + 4) = v34;
      *((_QWORD *)v41 + 5) = v35;
      *((_QWORD *)v41 + 6) = v37;
      *((_QWORD *)v41 + 7) = v36;
      *((_QWORD *)v41 + 8) = v38;
      v27 = v48;
    }
    v28 = v50;
    sub_23A4AA8F4();
    v30 = OUTLINED_FUNCTION_8_5();
  }
  (*(void (**)(uint64_t, uint64_t))(v47 + 8))(v51, v52);
  (*(void (**)(char *, uint64_t))(v45 + 8))(v44, v46);
  return v31;
}

void sub_23A487F70()
{
  sub_23A487830();
}

uint64_t sub_23A487F84()
{
  return 8;
}

uint64_t sub_23A487F90()
{
  return swift_release();
}

uint64_t sub_23A487F98(_QWORD *a1, _QWORD *a2)
{
  *a2 = *a1;
  return swift_retain();
}

_QWORD *sub_23A487FAC(_QWORD *result, _QWORD *a2)
{
  *a2 = *result;
  return result;
}

uint64_t sub_23A487FB8(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_256980800);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_23A488000(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  if (a2)
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    return swift_bridgeObjectRetain();
  }
  return result;
}

uint64_t AttributionModel.attributionItems.getter()
{
  char *v0;
  uint64_t v1;
  char *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  int64_t v6;
  int64_t v7;
  int isUniquelyReferenced_nonNull_native;
  int64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  uint64_t v18;
  unint64_t v19;
  unint64_t v20;
  uint64_t v22;
  BOOL v23;
  uint64_t v24;
  uint64_t result;

  v0 = AttributionModel.attributionGroups.getter();
  v1 = *((_QWORD *)v0 + 2);
  if (v1)
  {
    v2 = v0 + 64;
    v3 = MEMORY[0x24BEE4AF8];
    while (1)
    {
      v4 = *(_QWORD *)v2;
      v5 = *(_QWORD *)(*(_QWORD *)v2 + 16);
      v6 = *(_QWORD *)(v3 + 16);
      v7 = v6 + v5;
      if (__OFADD__(v6, v5))
        break;
      swift_bridgeObjectRetain();
      isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      if (!isUniquelyReferenced_nonNull_native || v7 > *(_QWORD *)(v3 + 24) >> 1)
      {
        if (v6 <= v7)
          v9 = v6 + v5;
        else
          v9 = v6;
        v3 = sub_23A4852B8(isUniquelyReferenced_nonNull_native, v9, 1, v3);
      }
      if (*(_QWORD *)(v4 + 16))
      {
        v10 = *(_QWORD *)(v3 + 16);
        v11 = (*(_QWORD *)(v3 + 24) >> 1) - v10;
        v12 = type metadata accessor for AttributionItem();
        if (v11 < v5)
          goto LABEL_27;
        v13 = *(_QWORD *)(v12 - 8);
        v14 = (*(unsigned __int8 *)(v13 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v13 + 80);
        v15 = *(_QWORD *)(v13 + 72);
        v16 = v3 + v14 + v15 * v10;
        v17 = v4 + v14;
        v18 = v15 * v5;
        v19 = v16 + v18;
        v20 = v17 + v18;
        if (v17 < v19 && v16 < v20)
          goto LABEL_29;
        swift_arrayInitWithCopy();
        if (v5)
        {
          v22 = *(_QWORD *)(v3 + 16);
          v23 = __OFADD__(v22, v5);
          v24 = v22 + v5;
          if (v23)
            goto LABEL_28;
          *(_QWORD *)(v3 + 16) = v24;
        }
      }
      else if (v5)
      {
        goto LABEL_26;
      }
      swift_bridgeObjectRelease();
      v2 += 40;
      if (!--v1)
        goto LABEL_24;
    }
    __break(1u);
LABEL_26:
    __break(1u);
LABEL_27:
    __break(1u);
LABEL_28:
    __break(1u);
LABEL_29:
    result = sub_23A4AA9E4();
    __break(1u);
  }
  else
  {
    v3 = MEMORY[0x24BEE4AF8];
LABEL_24:
    swift_bridgeObjectRelease();
    return v3;
  }
  return result;
}

uint64_t sub_23A4881E4(uint64_t a1, uint64_t a2)
{
  char v2;
  char v3;

  if (a1 == 0xD000000000000011 && a2 == 0x800000023A4AED00)
  {
    swift_bridgeObjectRelease();
    v2 = 0;
  }
  else
  {
    v3 = sub_23A4AAAB0();
    swift_bridgeObjectRelease();
    v2 = v3 ^ 1;
  }
  return v2 & 1;
}

unint64_t sub_23A488268()
{
  return 0xD000000000000011;
}

uint64_t sub_23A488288@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_23A4881E4(a1, a2);
  *a3 = result & 1;
  return result;
}

uint64_t sub_23A4882B0()
{
  sub_23A4886A8();
  return sub_23A4AAB04();
}

uint64_t sub_23A4882D8()
{
  sub_23A4886A8();
  return sub_23A4AAB10();
}

uint64_t AttributionModel.encode(to:)(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_256980830);
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  OUTLINED_FUNCTION_5_4();
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_23A4886A8();
  sub_23A4AAAF8();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2569807F8);
  sub_23A488758(&qword_256980840, &qword_2569807F8);
  sub_23A4AAA98();
  return (*(uint64_t (**)(uint64_t, uint64_t))(v4 + 8))(v1, v3);
}

uint64_t AttributionModel.init(from:)@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
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
  char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;

  v26 = a2;
  v30 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569807F8);
  v25 = *(_QWORD *)(v30 - 8);
  OUTLINED_FUNCTION_1_5();
  MEMORY[0x24BDAC7A8](v3);
  OUTLINED_FUNCTION_8_2();
  v29 = v4;
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_256980848);
  v27 = *(_QWORD *)(v5 - 8);
  v28 = v5;
  OUTLINED_FUNCTION_1_5();
  MEMORY[0x24BDAC7A8](v6);
  OUTLINED_FUNCTION_4();
  v9 = v8 - v7;
  v10 = sub_23A4A9DF0();
  v11 = *(_QWORD *)(v10 - 8);
  MEMORY[0x24BDAC7A8](v10);
  OUTLINED_FUNCTION_1_1();
  v14 = v12 - v13;
  MEMORY[0x24BDAC7A8](v15);
  v17 = (char *)&v25 - v16;
  type metadata accessor for AttributionModel();
  OUTLINED_FUNCTION_1_5();
  MEMORY[0x24BDAC7A8](v18);
  OUTLINED_FUNCTION_4();
  v21 = v20 - v19;
  sub_23A4A9DE4();
  (*(void (**)(uint64_t, char *, uint64_t))(v11 + 16))(v14, v17, v10);
  swift_getKeyPath();
  type metadata accessor for AttributeScopes.DeviceExpertIntentAttributes();
  sub_23A488B3C(&qword_2569807F0);
  sub_23A4A9E74();
  (*(void (**)(char *, uint64_t))(v11 + 8))(v17, v10);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_23A4886A8();
  v22 = v31;
  sub_23A4AAAEC();
  if (!v22)
  {
    sub_23A488758(&qword_256980850, &qword_2569807F8);
    v23 = v28;
    sub_23A4AAA44();
    (*(void (**)(uint64_t, uint64_t))(v27 + 8))(v9, v23);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v25 + 40))(v21, v29, v30);
    sub_23A48878C(v21, v26);
  }
  __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  return sub_23A48871C(v21);
}

uint64_t sub_23A488680@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  return AttributionModel.init(from:)(a1, a2);
}

uint64_t sub_23A488694(_QWORD *a1)
{
  return AttributionModel.encode(to:)(a1);
}

unint64_t sub_23A4886A8()
{
  unint64_t result;

  result = qword_256980838;
  if (!qword_256980838)
  {
    result = MEMORY[0x23B84E2B0](&unk_23A4AC374, &type metadata for AttributionModel.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256980838);
  }
  return result;
}

uint64_t type metadata accessor for AttributionModel()
{
  uint64_t result;

  result = qword_2569808B0;
  if (!qword_2569808B0)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_23A48871C(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata accessor for AttributionModel();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

void sub_23A488758(_QWORD *a1, uint64_t *a2)
{
  if (!*a1)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    OUTLINED_FUNCTION_25_0();
  }
  OUTLINED_FUNCTION_60();
}

uint64_t sub_23A48878C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for AttributionModel();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_23A4887D0()
{
  return AttributionModel.label.getter();
}

uint64_t initializeBufferWithCopyOfBuffer for AttributionModel(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569807F8);
  return (**(uint64_t (***)(uint64_t, uint64_t, uint64_t))(v4 - 8))(a1, a2, v4);
}

uint64_t destroy for AttributionModel(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569807F8);
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
}

uint64_t initializeWithCopy for AttributionModel(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569807F8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a1, a2, v4);
  return a1;
}

uint64_t assignWithCopy for AttributionModel(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569807F8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 24))(a1, a2, v4);
  return a1;
}

uint64_t initializeWithTake for AttributionModel(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569807F8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a1, a2, v4);
  return a1;
}

uint64_t assignWithTake for AttributionModel(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569807F8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 40))(a1, a2, v4);
  return a1;
}

uint64_t getEnumTagSinglePayload for AttributionModel()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_23A488998(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569807F8);
  return __swift_getEnumTagSinglePayload(a1, a2, v4);
}

uint64_t storeEnumTagSinglePayload for AttributionModel()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_23A4889DC(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569807F8);
  return __swift_storeEnumTagSinglePayload(a1, a2, a2, v4);
}

void sub_23A488A18()
{
  unint64_t v0;

  sub_23A488A80();
  if (v0 <= 0x3F)
    swift_initStructMetadata();
}

void sub_23A488A80()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_2569808C0)
  {
    sub_23A4A9DF0();
    type metadata accessor for AttributeScopes.DeviceExpertIntentAttributes();
    sub_23A488B3C(&qword_2569808C8);
    sub_23A488B3C(qword_2569808D0);
    v0 = sub_23A4A9E80();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_2569808C0);
  }
}

void sub_23A488B3C(_QWORD *a1)
{
  if (!*a1)
  {
    type metadata accessor for AttributeScopes.DeviceExpertIntentAttributes();
    OUTLINED_FUNCTION_25_0();
  }
  OUTLINED_FUNCTION_60();
}

uint64_t storeEnumTagSinglePayload for AttributionModel.CodingKeys(uint64_t a1, int a2, int a3)
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
    return ((uint64_t (*)(void))((char *)sub_23A488BB0 + 4 * byte_23A4AC1A0[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_23A488BD0 + 4 * byte_23A4AC1A5[v4]))();
}

_BYTE *sub_23A488BB0(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_23A488BD0(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_23A488BD8(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_23A488BE0(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_23A488BE8(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_23A488BF0(_DWORD *result)
{
  *result = 0;
  return result;
}

ValueMetadata *type metadata accessor for AttributionModel.CodingKeys()
{
  return &type metadata for AttributionModel.CodingKeys;
}

unint64_t sub_23A488C10()
{
  unint64_t result;

  result = qword_256980900;
  if (!qword_256980900)
  {
    result = MEMORY[0x23B84E2B0](&unk_23A4AC34C, &type metadata for AttributionModel.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256980900);
  }
  return result;
}

unint64_t sub_23A488C50()
{
  unint64_t result;

  result = qword_256980908;
  if (!qword_256980908)
  {
    result = MEMORY[0x23B84E2B0](&unk_23A4AC2BC, &type metadata for AttributionModel.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256980908);
  }
  return result;
}

unint64_t sub_23A488C90()
{
  unint64_t result;

  result = qword_256980910;
  if (!qword_256980910)
  {
    result = MEMORY[0x23B84E2B0](&unk_23A4AC2E4, &type metadata for AttributionModel.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256980910);
  }
  return result;
}

uint64_t OUTLINED_FUNCTION_6_5()
{
  return sub_23A4A9DF0();
}

uint64_t OUTLINED_FUNCTION_7_4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t (*v3)(uint64_t, uint64_t, uint64_t);

  return v3(v1, v2, v0);
}

uint64_t OUTLINED_FUNCTION_8_5()
{
  uint64_t v0;
  uint64_t v1;

  return __swift_getEnumTagSinglePayload(v0, 1, v1);
}

void *OUTLINED_FUNCTION_9_5()
{
  size_t v0;

  return malloc(v0);
}

uint64_t OUTLINED_FUNCTION_10_4(uint64_t a1)
{
  uint64_t v1;
  uint64_t (*v2)(uint64_t, uint64_t);

  return v2(a1, v1);
}

uint64_t OUTLINED_FUNCTION_11_4(uint64_t a1)
{
  uint64_t (*v1)(uint64_t, uint64_t);
  uint64_t v2;

  return v1(a1, v2);
}

char *OUTLINED_FUNCTION_12_2(char *a1, int64_t a2)
{
  uint64_t v2;

  return sub_23A485460(a1, a2, 1, v2);
}

uint64_t OUTLINED_FUNCTION_14_3()
{
  return sub_23A4A9E68();
}

uint64_t sub_23A488D64()
{
  uint64_t result;

  result = os_variant_has_internal_diagnostics();
  byte_256988528 = result;
  return result;
}

void static DeviceExpertPreferences.shouldShowFeedback.getter()
{
  id v0;
  void *v1;
  id v2;
  uint64_t v3;
  uint64_t v4;
  _BYTE v5[24];
  uint64_t v6;

  if (qword_25697FF20 != -1)
    swift_once();
  if (byte_256988528 == 1)
  {
    v0 = objc_msgSend((id)objc_opt_self(), sel_standardUserDefaults);
    v1 = (void *)sub_23A4AA7BC();
    v2 = OUTLINED_FUNCTION_2_7((uint64_t)v1, sel_objectForKey_);

    if (v2)
    {
      OUTLINED_FUNCTION_4_5();
      v3 = swift_unknownObjectRelease();
    }
    OUTLINED_FUNCTION_3_7(v3, v4);
    if (v6)
      OUTLINED_FUNCTION_0_9();
    else
      sub_23A47C4B0((uint64_t)v5);
  }
  OUTLINED_FUNCTION_1_6();
}

uint64_t sub_23A488E9C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_256980280);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

void static DeviceExpertPreferences.shouldSendAnalytics.getter()
{
  id v0;
  void *v1;
  id v2;
  uint64_t v3;
  uint64_t v4;
  _BYTE v5[24];
  uint64_t v6;

  if (qword_25697FF20 != -1)
    swift_once();
  if (byte_256988528 == 1)
  {
    v0 = objc_msgSend((id)objc_opt_self(), sel_standardUserDefaults);
    v1 = (void *)sub_23A4AA7BC();
    v2 = OUTLINED_FUNCTION_2_7((uint64_t)v1, sel_objectForKey_);

    if (v2)
    {
      OUTLINED_FUNCTION_4_5();
      v3 = swift_unknownObjectRelease();
    }
    OUTLINED_FUNCTION_3_7(v3, v4);
    if (v6)
      OUTLINED_FUNCTION_0_9();
    else
      sub_23A47C4B0((uint64_t)v5);
  }
  OUTLINED_FUNCTION_1_6();
}

ValueMetadata *type metadata accessor for DeviceExpertPreferences()
{
  return &type metadata for DeviceExpertPreferences;
}

uint64_t OUTLINED_FUNCTION_0_9()
{
  return swift_dynamicCast();
}

id OUTLINED_FUNCTION_2_7(uint64_t a1, const char *a2)
{
  void *v2;
  uint64_t v3;

  return objc_msgSend(v2, a2, v3);
}

uint64_t OUTLINED_FUNCTION_3_7(uint64_t a1, uint64_t a2, ...)
{
  uint64_t v3;
  va_list va;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  va_list va1;

  va_start(va1, a2);
  va_start(va, a2);
  v3 = va_arg(va1, _QWORD);
  v5 = va_arg(va1, _QWORD);
  v6 = va_arg(va1, _QWORD);
  v7 = va_arg(va1, _QWORD);
  return sub_23A488E9C((uint64_t)va, (uint64_t)va1);
}

uint64_t OUTLINED_FUNCTION_4_5()
{
  return sub_23A4AA924();
}

uint64_t Action.proto.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_23A4894D8((void (*)(_QWORD))MEMORY[0x24BE6FEB0], a1);
}

uint64_t Action.init(proto:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return sub_23A48926C(a1, (void (*)(_QWORD))MEMORY[0x24BE6FEB0], a2);
}

uint64_t Action.value.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t (**v9)(uint64_t, uint64_t);
  int v10;
  uint64_t v11;
  uint64_t result;
  uint64_t v13;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_256980920);
  v3 = MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v13 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v3);
  v7 = (char *)&v13 - v6;
  sub_23A4AA1B0();
  v8 = sub_23A4AA180();
  if (__swift_getEnumTagSinglePayload((uint64_t)v7, 1, v8) != 1)
  {
    sub_23A48920C((uint64_t)v7, (uint64_t)v5);
    v9 = *(uint64_t (***)(uint64_t, uint64_t))(v8 - 8);
    v10 = v9[11]((uint64_t)v5, v8);
    if (v10 == *MEMORY[0x24BE6FE68])
    {
      OUTLINED_FUNCTION_8_6(v9[12]);
      v11 = sub_23A4AA258();
LABEL_6:
      (*(void (**)(uint64_t, char *))(*(_QWORD *)(v11 - 8) + 32))(a1, v5);
      type metadata accessor for Action.Value(0);
      swift_storeEnumTagMultiPayload();
      return sub_23A4892B4((uint64_t)v7);
    }
    if (v10 == *MEMORY[0x24BE6FE70])
    {
      OUTLINED_FUNCTION_8_6(v9[12]);
      v11 = sub_23A4AA054();
      goto LABEL_6;
    }
    OUTLINED_FUNCTION_8_6(v9[1]);
  }
  result = sub_23A4AA9CC();
  __break(1u);
  return result;
}

uint64_t sub_23A48920C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_256980920);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t Action.URLConfiguration.init(proto:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return sub_23A48926C(a1, (void (*)(_QWORD))MEMORY[0x24BE6FF38], a2);
}

uint64_t Action.AppIntentConfiguration.init(proto:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return sub_23A48926C(a1, (void (*)(_QWORD))MEMORY[0x24BE6FD58], a2);
}

uint64_t sub_23A48926C@<X0>(uint64_t a1@<X0>, void (*a2)(_QWORD)@<X1>, uint64_t a3@<X8>)
{
  uint64_t v5;
  uint64_t v6;

  a2(0);
  OUTLINED_FUNCTION_5_5();
  return OUTLINED_FUNCTION_16_2(a3, a1, v6, *(uint64_t (**)(void))(v5 + 32));
}

uint64_t type metadata accessor for Action.Value(uint64_t a1)
{
  return sub_23A47F74C(a1, qword_256980AF8);
}

uint64_t sub_23A4892B4(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_256980920);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t Action.hash(into:)()
{
  sub_23A4AA1BC();
  sub_23A489544(&qword_256980928, (uint64_t (*)(uint64_t))MEMORY[0x24BE6FEB0], MEMORY[0x24BE6FEC0]);
  return sub_23A4AA780();
}

uint64_t Action.hashValue.getter()
{
  sub_23A4AAAC8();
  sub_23A4AA1BC();
  sub_23A489544(&qword_256980928, (uint64_t (*)(uint64_t))MEMORY[0x24BE6FEB0], MEMORY[0x24BE6FEC0]);
  sub_23A4AA780();
  return sub_23A4AAAE0();
}

void sub_23A4893CC(uint64_t a1@<X8>)
{
  sub_23A4A669C(a1);
}

void sub_23A4893E0(_QWORD *a1)
{
  sub_23A4A68B0(a1);
}

uint64_t sub_23A4893F4@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;

  result = Action.id.getter();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_23A489420()
{
  sub_23A4AAAC8();
  sub_23A4AA1BC();
  sub_23A489544(&qword_256980928, (uint64_t (*)(uint64_t))MEMORY[0x24BE6FEB0], MEMORY[0x24BE6FEC0]);
  sub_23A4AA780();
  return sub_23A4AAAE0();
}

uint64_t Action.URLConfiguration.proto.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_23A4894D8((void (*)(_QWORD))MEMORY[0x24BE6FF38], a1);
}

void sub_23A4894A4(uint64_t a1@<X8>)
{
  sub_23A4A66D0(a1);
}

void sub_23A4894B8(_QWORD *a1)
{
  sub_23A4A68DC(a1);
}

uint64_t Action.AppIntentConfiguration.proto.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_23A4894D8((void (*)(_QWORD))MEMORY[0x24BE6FD58], a1);
}

uint64_t sub_23A4894D8@<X0>(void (*a1)(_QWORD)@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;

  a1(0);
  OUTLINED_FUNCTION_5_5();
  return OUTLINED_FUNCTION_16_2(a2, v2, v5, *(uint64_t (**)(void))(v4 + 16));
}

void sub_23A489518()
{
  sub_23A489544(&qword_256980930, (uint64_t (*)(uint64_t))MEMORY[0x24BE6FEB0], MEMORY[0x24BE6FE88]);
}

void sub_23A489544(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
{
  uint64_t v5;

  if (!*a1)
  {
    v5 = a2(255);
    atomic_store(MEMORY[0x23B84E2B0](a3, v5), a1);
  }
  OUTLINED_FUNCTION_60();
}

void sub_23A489580()
{
  sub_23A489544(&qword_256980970, type metadata accessor for Action, (uint64_t)&protocol conformance descriptor for Action);
}

uint64_t type metadata accessor for Action(uint64_t a1)
{
  return sub_23A47F74C(a1, qword_256980A50);
}

void sub_23A4895C0()
{
  sub_23A489544(&qword_256980978, (uint64_t (*)(uint64_t))MEMORY[0x24BE6FF38], MEMORY[0x24BE6FF28]);
}

void sub_23A4895EC()
{
  sub_23A489544(&qword_2569809B8, (uint64_t (*)(uint64_t))MEMORY[0x24BE6FD58], MEMORY[0x24BE6FD40]);
}

void sub_23A489620(uint64_t a1@<X8>)
{
  sub_23A4A687C(a1);
}

void sub_23A489634(_QWORD *a1)
{
  sub_23A4A6908(a1);
}

uint64_t initializeBufferWithCopyOfBuffer for Action(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_23A489BF4(a1, a2, a3, (uint64_t (*)(_QWORD))MEMORY[0x24BE6FEB0]);
}

uint64_t destroy for Action(uint64_t a1, uint64_t a2)
{
  return sub_23A489C28(a1, a2, (uint64_t (*)(_QWORD))MEMORY[0x24BE6FEB0]);
}

void initializeWithCopy for Action(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_23A489C68(a1, a2, a3, (uint64_t (*)(_QWORD))MEMORY[0x24BE6FEB0]);
}

void assignWithCopy for Action(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_23A489C9C(a1, a2, a3, (uint64_t (*)(_QWORD))MEMORY[0x24BE6FEB0]);
}

void initializeWithTake for Action(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_23A489CD0(a1, a2, a3, (uint64_t (*)(_QWORD))MEMORY[0x24BE6FEB0]);
}

void assignWithTake for Action(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_23A489D04(a1, a2, a3, (uint64_t (*)(_QWORD))MEMORY[0x24BE6FEB0]);
}

uint64_t getEnumTagSinglePayload for Action()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_23A48969C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  OUTLINED_FUNCTION_12_3();
  v0 = OUTLINED_FUNCTION_9_6();
  return OUTLINED_FUNCTION_1_7(v0, v1, v2);
}

uint64_t storeEnumTagSinglePayload for Action()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_23A4896C4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  OUTLINED_FUNCTION_12_3();
  v0 = OUTLINED_FUNCTION_6_6();
  return OUTLINED_FUNCTION_2_8(v0, v1, v2, v3);
}

uint64_t sub_23A4896E0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_23A489D9C(a1, a2, a3, (uint64_t (*)(uint64_t))MEMORY[0x24BE6FEB0]);
}

uint64_t *initializeBufferWithCopyOfBuffer for Action.Value(uint64_t *a1, uint64_t *a2, uint64_t a3)
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
    if (swift_getEnumCaseMultiPayload() == 1)
      v6 = sub_23A4AA054();
    else
      v6 = sub_23A4AA258();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(a1, a2, v6);
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

uint64_t destroy for Action.Value(uint64_t a1)
{
  uint64_t v2;

  if (swift_getEnumCaseMultiPayload() == 1)
    v2 = sub_23A4AA054();
  else
    v2 = sub_23A4AA258();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
}

uint64_t initializeWithCopy for Action.Value(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  if (swift_getEnumCaseMultiPayload() == 1)
    v4 = sub_23A4AA054();
  else
    v4 = sub_23A4AA258();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a1, a2);
  swift_storeEnumTagMultiPayload();
  return a1;
}

uint64_t assignWithCopy for Action.Value(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  if (a1 != a2)
  {
    sub_23A489930(a1);
    if (swift_getEnumCaseMultiPayload() == 1)
      v4 = sub_23A4AA054();
    else
      v4 = sub_23A4AA258();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a1, a2);
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

uint64_t sub_23A489930(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata accessor for Action.Value(0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t initializeWithTake for Action.Value(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  if (swift_getEnumCaseMultiPayload() == 1)
    v4 = sub_23A4AA054();
  else
    v4 = sub_23A4AA258();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a1, a2);
  swift_storeEnumTagMultiPayload();
  return a1;
}

uint64_t assignWithTake for Action.Value(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  if (a1 != a2)
  {
    sub_23A489930(a1);
    if (swift_getEnumCaseMultiPayload() == 1)
      v4 = sub_23A4AA054();
    else
      v4 = sub_23A4AA258();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a1, a2);
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

uint64_t sub_23A489AA0()
{
  return swift_storeEnumTagMultiPayload();
}

uint64_t sub_23A489AB0()
{
  uint64_t result;
  unint64_t v1;
  unint64_t v2;

  result = sub_23A4AA258();
  if (v1 <= 0x3F)
  {
    result = sub_23A4AA054();
    if (v2 <= 0x3F)
    {
      swift_initEnumMetadataMultiPayload();
      return 0;
    }
  }
  return result;
}

uint64_t initializeBufferWithCopyOfBuffer for Action.URLConfiguration(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_23A489BF4(a1, a2, a3, (uint64_t (*)(_QWORD))MEMORY[0x24BE6FF38]);
}

uint64_t destroy for Action.URLConfiguration(uint64_t a1, uint64_t a2)
{
  return sub_23A489C28(a1, a2, (uint64_t (*)(_QWORD))MEMORY[0x24BE6FF38]);
}

void initializeWithCopy for Action.URLConfiguration(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_23A489C68(a1, a2, a3, (uint64_t (*)(_QWORD))MEMORY[0x24BE6FF38]);
}

void assignWithCopy for Action.URLConfiguration(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_23A489C9C(a1, a2, a3, (uint64_t (*)(_QWORD))MEMORY[0x24BE6FF38]);
}

void initializeWithTake for Action.URLConfiguration(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_23A489CD0(a1, a2, a3, (uint64_t (*)(_QWORD))MEMORY[0x24BE6FF38]);
}

void assignWithTake for Action.URLConfiguration(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_23A489D04(a1, a2, a3, (uint64_t (*)(_QWORD))MEMORY[0x24BE6FF38]);
}

uint64_t getEnumTagSinglePayload for Action.URLConfiguration()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_23A489B84()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  OUTLINED_FUNCTION_10_5();
  v0 = OUTLINED_FUNCTION_9_6();
  return OUTLINED_FUNCTION_1_7(v0, v1, v2);
}

uint64_t storeEnumTagSinglePayload for Action.URLConfiguration()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_23A489BAC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  OUTLINED_FUNCTION_10_5();
  v0 = OUTLINED_FUNCTION_6_6();
  return OUTLINED_FUNCTION_2_8(v0, v1, v2, v3);
}

uint64_t type metadata accessor for Action.URLConfiguration(uint64_t a1)
{
  return sub_23A47F74C(a1, qword_256980B88);
}

uint64_t sub_23A489BDC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_23A489D9C(a1, a2, a3, (uint64_t (*)(uint64_t))MEMORY[0x24BE6FF38]);
}

uint64_t initializeBufferWithCopyOfBuffer for Action.AppIntentConfiguration(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_23A489BF4(a1, a2, a3, (uint64_t (*)(_QWORD))MEMORY[0x24BE6FD58]);
}

uint64_t sub_23A489BF4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(_QWORD))
{
  uint64_t v4;
  uint64_t v5;
  uint64_t (**v6)(void);
  uint64_t v7;

  OUTLINED_FUNCTION_0_10(a1, a2, a3, a4);
  OUTLINED_FUNCTION_5_5();
  return OUTLINED_FUNCTION_16_2(v5, v4, v7, *v6);
}

uint64_t destroy for Action.AppIntentConfiguration(uint64_t a1, uint64_t a2)
{
  return sub_23A489C28(a1, a2, (uint64_t (*)(_QWORD))MEMORY[0x24BE6FD58]);
}

uint64_t sub_23A489C28(uint64_t a1, uint64_t a2, uint64_t (*a3)(_QWORD))
{
  uint64_t v4;

  v4 = a3(0);
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(a1, v4);
}

void initializeWithCopy for Action.AppIntentConfiguration(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_23A489C68(a1, a2, a3, (uint64_t (*)(_QWORD))MEMORY[0x24BE6FD58]);
}

void sub_23A489C68(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(_QWORD))
{
  uint64_t v4;

  OUTLINED_FUNCTION_0_10(a1, a2, a3, a4);
  OUTLINED_FUNCTION_5_5();
  OUTLINED_FUNCTION_4_6(*(uint64_t (**)(uint64_t, uint64_t))(v4 + 16));
  OUTLINED_FUNCTION_60();
}

void assignWithCopy for Action.AppIntentConfiguration(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_23A489C9C(a1, a2, a3, (uint64_t (*)(_QWORD))MEMORY[0x24BE6FD58]);
}

void sub_23A489C9C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(_QWORD))
{
  uint64_t v4;

  OUTLINED_FUNCTION_0_10(a1, a2, a3, a4);
  OUTLINED_FUNCTION_5_5();
  OUTLINED_FUNCTION_4_6(*(uint64_t (**)(uint64_t, uint64_t))(v4 + 24));
  OUTLINED_FUNCTION_60();
}

void initializeWithTake for Action.AppIntentConfiguration(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_23A489CD0(a1, a2, a3, (uint64_t (*)(_QWORD))MEMORY[0x24BE6FD58]);
}

void sub_23A489CD0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(_QWORD))
{
  uint64_t v4;

  OUTLINED_FUNCTION_0_10(a1, a2, a3, a4);
  OUTLINED_FUNCTION_5_5();
  OUTLINED_FUNCTION_4_6(*(uint64_t (**)(uint64_t, uint64_t))(v4 + 32));
  OUTLINED_FUNCTION_60();
}

void assignWithTake for Action.AppIntentConfiguration(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_23A489D04(a1, a2, a3, (uint64_t (*)(_QWORD))MEMORY[0x24BE6FD58]);
}

void sub_23A489D04(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(_QWORD))
{
  uint64_t v4;

  OUTLINED_FUNCTION_0_10(a1, a2, a3, a4);
  OUTLINED_FUNCTION_5_5();
  OUTLINED_FUNCTION_4_6(*(uint64_t (**)(uint64_t, uint64_t))(v4 + 40));
  OUTLINED_FUNCTION_60();
}

uint64_t getEnumTagSinglePayload for Action.AppIntentConfiguration()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_23A489D38()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  OUTLINED_FUNCTION_11_5();
  v0 = OUTLINED_FUNCTION_9_6();
  return OUTLINED_FUNCTION_1_7(v0, v1, v2);
}

uint64_t storeEnumTagSinglePayload for Action.AppIntentConfiguration()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_23A489D60()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  OUTLINED_FUNCTION_11_5();
  v0 = OUTLINED_FUNCTION_6_6();
  return OUTLINED_FUNCTION_2_8(v0, v1, v2, v3);
}

uint64_t type metadata accessor for Action.AppIntentConfiguration(uint64_t a1)
{
  return sub_23A47F74C(a1, qword_256980C18);
}

uint64_t sub_23A489D90(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_23A489D9C(a1, a2, a3, (uint64_t (*)(uint64_t))MEMORY[0x24BE6FD58]);
}

uint64_t sub_23A489D9C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(uint64_t))
{
  uint64_t result;
  unint64_t v5;

  result = a4(319);
  if (v5 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t OUTLINED_FUNCTION_0_10(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(_QWORD))
{
  return a4(0);
}

uint64_t OUTLINED_FUNCTION_1_7(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return __swift_getEnumTagSinglePayload(a1, a2, a3);
}

uint64_t OUTLINED_FUNCTION_2_8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_storeEnumTagSinglePayload(a1, a2, a3, a4);
}

uint64_t OUTLINED_FUNCTION_4_6@<X0>(uint64_t (*a1)(uint64_t, uint64_t)@<X8>)
{
  uint64_t v1;
  uint64_t v2;

  return a1(v2, v1);
}

uint64_t OUTLINED_FUNCTION_6_6()
{
  uint64_t v0;

  return v0;
}

uint64_t OUTLINED_FUNCTION_8_6@<X0>(uint64_t (*a1)(uint64_t, uint64_t)@<X8>)
{
  uint64_t v1;
  uint64_t v2;

  return a1(v2, v1);
}

uint64_t OUTLINED_FUNCTION_9_6()
{
  uint64_t v0;

  return v0;
}

uint64_t OUTLINED_FUNCTION_10_5()
{
  return sub_23A4AA258();
}

uint64_t OUTLINED_FUNCTION_11_5()
{
  return sub_23A4AA054();
}

uint64_t OUTLINED_FUNCTION_12_3()
{
  return sub_23A4AA1BC();
}

void sub_23A489E9C(uint64_t a1@<X0>, uint64_t a2@<X1>, void *a3@<X2>, uint64_t *a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t v5;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  int64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  uint64_t v25;
  void (*v26)(uint64_t, unint64_t, uint64_t);
  unint64_t v27;
  unint64_t v28;
  uint64_t v29;
  id v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  void (*v35)(uint64_t);
  uint64_t v36;
  uint64_t v37;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  _QWORD v46[4];
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;

  __swift_instantiateConcreteTypeFromMangledName(&qword_25697FF70);
  OUTLINED_FUNCTION_0_1();
  MEMORY[0x24BDAC7A8](v11);
  OUTLINED_FUNCTION_8_2();
  v41 = v12;
  v13 = type metadata accessor for Action(0);
  v14 = *(_QWORD *)(v13 - 8);
  MEMORY[0x24BDAC7A8](v13);
  OUTLINED_FUNCTION_21_3();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256980078);
  OUTLINED_FUNCTION_0_1();
  MEMORY[0x24BDAC7A8](v15);
  OUTLINED_FUNCTION_4();
  v18 = v17 - v16;
  v44 = a4[1];
  v45 = *a4;
  v42 = a4[3];
  v43 = a4[2];
  v19 = sub_23A4AA228();
  v20 = *(_QWORD *)(v19 + 16);
  if (v20)
  {
    v36 = v18;
    v37 = a5;
    v38 = a3;
    v39 = a2;
    v40 = a1;
    *(_QWORD *)&v47 = MEMORY[0x24BEE4AF8];
    sub_23A4A7F88(0, v20, 0);
    v21 = v47;
    v22 = sub_23A4AA1BC();
    v23 = *(_QWORD *)(v22 - 8);
    v24 = v19 + ((*(unsigned __int8 *)(v23 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v23 + 80));
    v25 = *(_QWORD *)(v23 + 72);
    v26 = *(void (**)(uint64_t, unint64_t, uint64_t))(v23 + 16);
    do
    {
      v26(v5, v24, v22);
      *(_QWORD *)&v47 = v21;
      v28 = *(_QWORD *)(v21 + 16);
      v27 = *(_QWORD *)(v21 + 24);
      if (v28 >= v27 >> 1)
      {
        sub_23A4A7F88(v27 > 1, v28 + 1, 1);
        v21 = v47;
      }
      *(_QWORD *)(v21 + 16) = v28 + 1;
      sub_23A48C244(v5, v21+ ((*(unsigned __int8 *)(v14 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v14 + 80))+ *(_QWORD *)(v14 + 72) * v28);
      v24 += v25;
      --v20;
    }
    while (v20);
    swift_bridgeObjectRelease();
    a2 = v39;
    a1 = v40;
    a3 = v38;
    a5 = v37;
    v18 = v36;
  }
  else
  {
    swift_bridgeObjectRelease();
    v21 = MEMORY[0x24BEE4AF8];
  }
  sub_23A48A488(a2, v18);
  if (a3)
  {
    v29 = sub_23A4AA27C();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v29 - 8) + 16))(v41, a1, v29);
    __swift_storeEnumTagSinglePayload(v41, 0, 1, v29);
    v30 = a3;
    TipCollectionModel.init(result:collection:)(v41, a3, (uint64_t *)&v47);
    v31 = v47;
    v32 = v48;
    a3 = v30;
    v33 = v49;
    v34 = v50;
  }
  else
  {
    v31 = xmmword_23A4AC680;
    v32 = 0uLL;
    v33 = 0uLL;
    v34 = 0uLL;
  }
  v47 = v31;
  v48 = v32;
  v49 = v33;
  v50 = v34;
  v46[0] = v45;
  v46[1] = v44;
  v46[2] = v43;
  v46[3] = v42;
  SupplementarySnippetModel.init(actions:attributionModel:tipCollectionModel:context:)(v21, v18, (uint64_t)&v47, (uint64_t)v46, a5);

  sub_23A48A4D0(a2);
  sub_23A4AA27C();
  OUTLINED_FUNCTION_15_0();
  v35(a1);
  OUTLINED_FUNCTION_14_4();
}

uint64_t sub_23A48A178()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _BOOL8 v6;
  uint64_t v8;
  uint64_t v9;

  OUTLINED_FUNCTION_5_6();
  OUTLINED_FUNCTION_0_1();
  MEMORY[0x24BDAC7A8](v1);
  OUTLINED_FUNCTION_4();
  v4 = v3 - v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2569800C8);
  sub_23A4AA36C();
  v5 = *(_QWORD *)(v8 + 16);
  swift_bridgeObjectRelease();
  sub_23A48B6C8(v0, v4);
  if (v5)
  {
    sub_23A4755CC(v4);
    return 1;
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_2569800D0);
    sub_23A4AA36C();
    sub_23A4755CC(v4);
    v6 = v9 != 1;
    if (v9 != 1)
      sub_23A48C1F0(v8, v9);
  }
  return v6;
}

uint64_t SupplementarySnippetModel.actions.getter()
{
  uint64_t v1;

  __swift_instantiateConcreteTypeFromMangledName(&qword_2569800C8);
  sub_23A4AA36C();
  return v1;
}

uint64_t sub_23A48A280()
{
  swift_bridgeObjectRetain();
  return SupplementarySnippetModel.actions.setter();
}

uint64_t SupplementarySnippetModel.actions.setter()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_2569800C8);
  return sub_23A4AA378();
}

void SupplementarySnippetModel.actions.modify()
{
  _QWORD *v0;
  _QWORD *v1;

  v1 = OUTLINED_FUNCTION_6_2();
  *v0 = v1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2569800C8);
  v1[4] = OUTLINED_FUNCTION_7_2();
  OUTLINED_FUNCTION_5();
}

void SupplementarySnippetModel.attributionModel.getter()
{
  OUTLINED_FUNCTION_5_6();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2569800C0);
  OUTLINED_FUNCTION_26_2();
  OUTLINED_FUNCTION_60();
}

uint64_t type metadata accessor for SupplementarySnippetModel()
{
  uint64_t result;

  result = qword_256980D70;
  if (!qword_256980D70)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_23A48A388(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v6;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_256980078);
  MEMORY[0x24BDAC7A8](v2);
  v4 = (char *)&v6 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23A48A488(a1, (uint64_t)v4);
  return SupplementarySnippetModel.attributionModel.setter((uint64_t)v4);
}

uint64_t SupplementarySnippetModel.attributionModel.setter(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  __swift_instantiateConcreteTypeFromMangledName(&qword_256980078);
  OUTLINED_FUNCTION_0_1();
  MEMORY[0x24BDAC7A8](v2);
  OUTLINED_FUNCTION_4();
  sub_23A48A488(a1, v4 - v3);
  OUTLINED_FUNCTION_5_6();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2569800C0);
  sub_23A4AA378();
  return sub_23A48A4D0(a1);
}

uint64_t sub_23A48A488(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_256980078);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_23A48A4D0(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_256980078);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

void SupplementarySnippetModel.attributionModel.modify()
{
  _QWORD *v0;
  _QWORD *v1;

  v1 = OUTLINED_FUNCTION_6_2();
  *v0 = v1;
  OUTLINED_FUNCTION_5_6();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2569800C0);
  v1[4] = OUTLINED_FUNCTION_7_2();
  OUTLINED_FUNCTION_5();
}

void SupplementarySnippetModel.tipCollectionModel.getter()
{
  OUTLINED_FUNCTION_5_6();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2569800D0);
  OUTLINED_FUNCTION_26_2();
  OUTLINED_FUNCTION_60();
}

double sub_23A48A590@<D0>(_OWORD *a1@<X8>)
{
  double result;
  __int128 v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;

  SupplementarySnippetModel.tipCollectionModel.getter();
  *a1 = v3;
  a1[1] = v4;
  result = *(double *)&v5;
  a1[2] = v5;
  a1[3] = v6;
  return result;
}

uint64_t sub_23A48A5D0(uint64_t *a1)
{
  sub_23A48C19C(*a1, a1[1]);
  return SupplementarySnippetModel.tipCollectionModel.setter();
}

uint64_t SupplementarySnippetModel.tipCollectionModel.setter()
{
  OUTLINED_FUNCTION_5_6();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2569800D0);
  return OUTLINED_FUNCTION_11_1();
}

void SupplementarySnippetModel.tipCollectionModel.modify()
{
  _QWORD *v0;
  _QWORD *v1;

  v1 = OUTLINED_FUNCTION_6_2();
  *v0 = v1;
  OUTLINED_FUNCTION_5_6();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2569800D0);
  v1[4] = OUTLINED_FUNCTION_7_2();
  OUTLINED_FUNCTION_5();
}

void SupplementarySnippetModel.context.getter()
{
  OUTLINED_FUNCTION_5_6();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2569800A8);
  OUTLINED_FUNCTION_26_2();
  OUTLINED_FUNCTION_60();
}

double sub_23A48A6F0@<D0>(uint64_t a1@<X8>)
{
  double result;
  __int128 v3;
  uint64_t v4;
  uint64_t v5;

  SupplementarySnippetModel.context.getter();
  result = *(double *)&v3;
  *(_OWORD *)a1 = v3;
  *(_QWORD *)(a1 + 16) = v4;
  *(_QWORD *)(a1 + 24) = v5;
  return result;
}

uint64_t sub_23A48A730()
{
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return SupplementarySnippetModel.context.setter();
}

uint64_t SupplementarySnippetModel.context.setter()
{
  OUTLINED_FUNCTION_5_6();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2569800A8);
  return OUTLINED_FUNCTION_11_1();
}

void SupplementarySnippetModel.context.modify()
{
  _QWORD *v0;
  _QWORD *v1;

  v1 = OUTLINED_FUNCTION_6_2();
  *v0 = v1;
  OUTLINED_FUNCTION_5_6();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2569800A8);
  v1[4] = OUTLINED_FUNCTION_7_2();
  OUTLINED_FUNCTION_5();
}

void SupplementarySnippetModel.init(actions:attributionModel:tipCollectionModel:context:)(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  __int128 v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void (*v21)(uint64_t);
  void (*v22)(uint64_t);
  uint64_t v23;
  uint64_t v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  uint64_t v28;
  uint64_t v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;

  __swift_instantiateConcreteTypeFromMangledName(&qword_256980078);
  OUTLINED_FUNCTION_0_1();
  v11 = MEMORY[0x24BDAC7A8](v10);
  MEMORY[0x24BDAC7A8](v11);
  v13 = (char *)&v23 - v12;
  v14 = *(_OWORD *)a3;
  v26 = *(_OWORD *)(a3 + 16);
  v27 = v14;
  v25 = *(_OWORD *)(a3 + 32);
  v15 = *(_QWORD *)(a3 + 48);
  v23 = *(_QWORD *)(a3 + 56);
  v24 = v15;
  v30 = *(_OWORD *)a4;
  v16 = *(_QWORD *)(a4 + 16);
  v28 = *(_QWORD *)(a4 + 24);
  v29 = v16;
  v17 = OUTLINED_FUNCTION_5_6();
  v18 = a5 + *(int *)(v17 + 20);
  v19 = type metadata accessor for AttributionModel();
  __swift_storeEnumTagSinglePayload((uint64_t)v13, 1, 1, v19);
  OUTLINED_FUNCTION_28_2();
  OUTLINED_FUNCTION_19_2();
  sub_23A48A4D0((uint64_t)v13);
  v20 = a5 + *(int *)(v17 + 24);
  v31 = xmmword_23A4AC680;
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256980C50);
  OUTLINED_FUNCTION_18_3();
  *(_QWORD *)&v31 = a1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256980C58);
  sub_23A4AA354();
  sub_23A48A488(a2, (uint64_t)v13);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2569800C0);
  OUTLINED_FUNCTION_15_0();
  v21(v18);
  OUTLINED_FUNCTION_28_2();
  OUTLINED_FUNCTION_19_2();
  sub_23A48A4D0((uint64_t)v13);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2569800D0);
  OUTLINED_FUNCTION_15_0();
  v22(v20);
  v31 = v27;
  v32 = v26;
  v33 = v25;
  *(_QWORD *)&v34 = v24;
  *((_QWORD *)&v34 + 1) = v23;
  OUTLINED_FUNCTION_18_3();
  v31 = v30;
  *(_QWORD *)&v32 = v29;
  *((_QWORD *)&v32 + 1) = v28;
  sub_23A4AA354();
  sub_23A48A4D0(a2);
  OUTLINED_FUNCTION_14_4();
}

uint64_t sub_23A48AA08(uint64_t a1, uint64_t a2)
{
  BOOL v3;
  char v7;

  v3 = a1 == 0x736E6F69746361 && a2 == 0xE700000000000000;
  if (v3 || (sub_23A4AAAB0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0xD000000000000010 && a2 == 0x800000023A4AEDC0 || (sub_23A4AAAB0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0xD000000000000012 && a2 == 0x800000023A4AEDE0 || (sub_23A4AAAB0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0x747865746E6F63 && a2 == 0xE700000000000000)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else
  {
    v7 = sub_23A4AAAB0();
    swift_bridgeObjectRelease();
    if ((v7 & 1) != 0)
      return 3;
    else
      return 4;
  }
}

uint64_t sub_23A48ABA8(unsigned __int8 a1)
{
  return ((uint64_t (*)(unint64_t, unint64_t))((char *)sub_23A48ABE0 + 4 * byte_23A4AC690[a1]))(0xD000000000000010, 0x800000023A4AEDC0);
}

uint64_t sub_23A48ABE0()
{
  return 0x736E6F69746361;
}

uint64_t sub_23A48ABF8(uint64_t a1)
{
  return a1 + 2;
}

uint64_t sub_23A48AC10()
{
  return 0x747865746E6F63;
}

uint64_t sub_23A48AC28()
{
  unsigned __int8 *v0;

  return sub_23A48ABA8(*v0);
}

uint64_t sub_23A48AC30@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_23A48AA08(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_23A48AC54()
{
  sub_23A48AEB4();
  return sub_23A4AAB04();
}

uint64_t sub_23A48AC7C()
{
  sub_23A48AEB4();
  return sub_23A4AAB10();
}

uint64_t SupplementarySnippetModel.encode(to:)(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_256980C60);
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  OUTLINED_FUNCTION_4();
  v7 = v6 - v5;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_23A48AEB4();
  sub_23A4AAAF8();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2569800C8);
  sub_23A48B5C0((uint64_t)&unk_256980C70);
  OUTLINED_FUNCTION_9_1();
  if (!v1)
  {
    type metadata accessor for SupplementarySnippetModel();
    __swift_instantiateConcreteTypeFromMangledName(&qword_2569800C0);
    sub_23A48AF48((uint64_t)&unk_256980C98);
    OUTLINED_FUNCTION_9_1();
    __swift_instantiateConcreteTypeFromMangledName(&qword_2569800D0);
    sub_23A48B64C((uint64_t)&unk_256980CC0);
    OUTLINED_FUNCTION_9_1();
    __swift_instantiateConcreteTypeFromMangledName(&qword_2569800A8);
    sub_23A47DFC8((uint64_t)&unk_2569802E0);
    OUTLINED_FUNCTION_9_1();
  }
  return (*(uint64_t (**)(uint64_t, uint64_t))(v4 + 8))(v7, v3);
}

unint64_t sub_23A48AEB4()
{
  unint64_t result;

  result = qword_256980C68;
  if (!qword_256980C68)
  {
    result = MEMORY[0x23B84E2B0](&unk_23A4AC830, &type metadata for SupplementarySnippetModel.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256980C68);
  }
  return result;
}

void sub_23A48AEF0(uint64_t a1)
{
  if (!OUTLINED_FUNCTION_5_2(a1))
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256980C58);
    OUTLINED_FUNCTION_24_1();
    OUTLINED_FUNCTION_16_3();
  }
  OUTLINED_FUNCTION_17_1();
}

void sub_23A48AF48(uint64_t a1)
{
  if (!OUTLINED_FUNCTION_5_2(a1))
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2569800C0);
    sub_23A48AFD4((uint64_t)&unk_256980CA0);
    sub_23A48AFD4((uint64_t)&unk_256980CB0);
    OUTLINED_FUNCTION_0_6();
  }
  OUTLINED_FUNCTION_3_3();
}

void sub_23A48AFD4(uint64_t a1)
{
  if (!OUTLINED_FUNCTION_5_2(a1))
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256980078);
    OUTLINED_FUNCTION_24_1();
    OUTLINED_FUNCTION_16_3();
  }
  OUTLINED_FUNCTION_17_1();
}

void sub_23A48B02C(uint64_t a1)
{
  unint64_t *v1;
  uint64_t (*v2)(void);
  uint64_t v3;
  uint64_t v4;
  uint64_t (*v5)(void);
  uint64_t v6;
  uint64_t v7;

  if (!OUTLINED_FUNCTION_5_2(a1))
  {
    v4 = v3;
    v5 = v2;
    v6 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256980C50);
    v7 = v5();
    atomic_store(MEMORY[0x23B84E2B0](v4, v6, &v7), v1);
  }
  OUTLINED_FUNCTION_3_3();
}

unint64_t sub_23A48B084()
{
  unint64_t result;

  result = qword_256980CD0;
  if (!qword_256980CD0)
  {
    result = MEMORY[0x23B84E2B0](&protocol conformance descriptor for TipCollectionModel, &type metadata for TipCollectionModel);
    atomic_store(result, (unint64_t *)&qword_256980CD0);
  }
  return result;
}

unint64_t sub_23A48B0C0()
{
  unint64_t result;

  result = qword_256980CE0;
  if (!qword_256980CE0)
  {
    result = MEMORY[0x23B84E2B0](&protocol conformance descriptor for TipCollectionModel, &type metadata for TipCollectionModel);
    atomic_store(result, (unint64_t *)&qword_256980CE0);
  }
  return result;
}

uint64_t SupplementarySnippetModel.init(from:)@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
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
  char *v17;
  uint64_t v18;
  char *v19;
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
  _QWORD *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  uint64_t v64;

  v44 = a2;
  v46 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569800A8);
  v43 = *(_QWORD *)(v46 - 8);
  OUTLINED_FUNCTION_1_5();
  MEMORY[0x24BDAC7A8](v3);
  OUTLINED_FUNCTION_8_2();
  v45 = v4;
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569800D0);
  v55 = *(_QWORD *)(v5 - 8);
  v56 = v5;
  OUTLINED_FUNCTION_1_5();
  MEMORY[0x24BDAC7A8](v6);
  OUTLINED_FUNCTION_8_2();
  v50 = v7;
  v64 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569800C0);
  v59 = *(_QWORD *)(v64 - 8);
  OUTLINED_FUNCTION_1_5();
  MEMORY[0x24BDAC7A8](v8);
  OUTLINED_FUNCTION_8_2();
  v49 = v9;
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569800C8);
  v47 = *(_QWORD *)(v10 - 8);
  OUTLINED_FUNCTION_1_5();
  MEMORY[0x24BDAC7A8](v11);
  OUTLINED_FUNCTION_8_2();
  v52 = v12;
  v51 = __swift_instantiateConcreteTypeFromMangledName(&qword_256980CE8);
  v48 = *(_QWORD *)(v51 - 8);
  OUTLINED_FUNCTION_1_5();
  MEMORY[0x24BDAC7A8](v13);
  OUTLINED_FUNCTION_21_3();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256980078);
  OUTLINED_FUNCTION_0_1();
  v15 = MEMORY[0x24BDAC7A8](v14);
  v17 = (char *)&v42 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v15);
  v19 = (char *)&v42 - v18;
  v20 = type metadata accessor for SupplementarySnippetModel();
  OUTLINED_FUNCTION_0_1();
  MEMORY[0x24BDAC7A8](v21);
  OUTLINED_FUNCTION_4();
  v24 = v23 - v22;
  v26 = v23 - v22 + *(int *)(v25 + 20);
  v27 = type metadata accessor for AttributionModel();
  __swift_storeEnumTagSinglePayload((uint64_t)v19, 1, 1, v27);
  sub_23A48A488((uint64_t)v19, (uint64_t)v17);
  v58 = v26;
  sub_23A4AA354();
  sub_23A48A4D0((uint64_t)v19);
  v28 = v24 + *(int *)(v20 + 24);
  v60 = xmmword_23A4AC680;
  v61 = 0u;
  v62 = 0u;
  v63 = 0u;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256980C50);
  v53 = v28;
  sub_23A4AA354();
  v29 = a1[3];
  v54 = a1;
  __swift_project_boxed_opaque_existential_1(a1, v29);
  sub_23A48AEB4();
  v30 = v57;
  sub_23A4AAAEC();
  if (v30)
  {
    v34 = v55;
    v33 = v56;
    v35 = v53;
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v54);
    (*(void (**)(uint64_t, uint64_t))(v59 + 8))(v58, v64);
    return (*(uint64_t (**)(uint64_t, uint64_t))(v34 + 8))(v35, v33);
  }
  else
  {
    v31 = v49;
    v32 = v50;
    v57 = v20;
    LOBYTE(v60) = 0;
    sub_23A48B5C0((uint64_t)&unk_256980CF0);
    OUTLINED_FUNCTION_25_1();
    OUTLINED_FUNCTION_11_6();
    v36 = v24;
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v47 + 32))(v24, v52, v10);
    LOBYTE(v60) = 1;
    sub_23A48AF48((uint64_t)&unk_256980CF8);
    OUTLINED_FUNCTION_25_1();
    v37 = v31;
    v38 = v64;
    OUTLINED_FUNCTION_11_6();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v59 + 40))(v58, v37, v38);
    LOBYTE(v60) = 2;
    sub_23A48B64C((uint64_t)&unk_256980D00);
    OUTLINED_FUNCTION_25_1();
    v39 = v56;
    OUTLINED_FUNCTION_11_6();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v55 + 40))(v53, v32, v39);
    LOBYTE(v60) = 3;
    sub_23A47DFC8((uint64_t)&unk_256980308);
    OUTLINED_FUNCTION_25_1();
    OUTLINED_FUNCTION_11_6();
    OUTLINED_FUNCTION_1_8();
    v40 = (uint64_t)v54;
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v43 + 32))(v36 + *(int *)(v57 + 28), v45, v46);
    sub_23A48B6C8(v36, v44);
    __swift_destroy_boxed_opaque_existential_1(v40);
    return sub_23A4755CC(v36);
  }
}

void sub_23A48B5C0(uint64_t a1)
{
  if (!OUTLINED_FUNCTION_5_2(a1))
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2569800C8);
    sub_23A48AEF0((uint64_t)&unk_256980C78);
    sub_23A48AEF0((uint64_t)&unk_256980C88);
    OUTLINED_FUNCTION_0_6();
  }
  OUTLINED_FUNCTION_3_3();
}

void sub_23A48B64C(uint64_t a1)
{
  if (!OUTLINED_FUNCTION_5_2(a1))
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2569800D0);
    sub_23A48B02C((uint64_t)&unk_256980CC8);
    sub_23A48B02C((uint64_t)&unk_256980CD8);
    OUTLINED_FUNCTION_0_6();
  }
  OUTLINED_FUNCTION_3_3();
}

uint64_t sub_23A48B6C8(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for SupplementarySnippetModel();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

unint64_t sub_23A48B70C()
{
  return sub_23A47E0EC((uint64_t)&unk_256980D08);
}

unint64_t sub_23A48B738()
{
  return sub_23A47E0EC((uint64_t)&unk_256980D10);
}

uint64_t sub_23A48B764@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  return SupplementarySnippetModel.init(from:)(a1, a2);
}

uint64_t sub_23A48B778(_QWORD *a1)
{
  return SupplementarySnippetModel.encode(to:)(a1);
}

void sub_23A48B78C(uint64_t *a1@<X8>)
{
  *a1 = SupplementarySnippetModel.actions.getter();
  OUTLINED_FUNCTION_60();
}

void sub_23A48B7B4()
{
  SupplementarySnippetModel.attributionModel.getter();
  OUTLINED_FUNCTION_60();
}

uint64_t *initializeBufferWithCopyOfBuffer for SupplementarySnippetModel(uint64_t *a1, uint64_t *a2, int *a3)
{
  int v5;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;

  v5 = *(_DWORD *)(*((_QWORD *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v20 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v20 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569800C8);
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a1, a2, v7);
    v8 = a3[5];
    v9 = (char *)a1 + v8;
    v10 = (char *)a2 + v8;
    v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569800C0);
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v11 - 8) + 16))(v9, v10, v11);
    v12 = a3[6];
    v13 = (char *)a1 + v12;
    v14 = (char *)a2 + v12;
    v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569800D0);
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v15 - 8) + 16))(v13, v14, v15);
    v16 = a3[7];
    v17 = (char *)a1 + v16;
    v18 = (char *)a2 + v16;
    v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569800A8);
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v19 - 8) + 16))(v17, v18, v19);
  }
  return a1;
}

uint64_t destroy for SupplementarySnippetModel(uint64_t a1, int *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569800C8);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(a1, v4);
  v5 = a1 + a2[5];
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569800C0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 8))(v5, v6);
  v7 = a1 + a2[6];
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569800D0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 8))(v7, v8);
  v9 = a1 + a2[7];
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569800A8);
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 8))(v9, v10);
}

uint64_t initializeWithCopy for SupplementarySnippetModel(uint64_t a1, uint64_t a2, int *a3)
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

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569800C8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(a1, a2, v6);
  v7 = a3[5];
  v8 = a1 + v7;
  v9 = a2 + v7;
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569800C0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 16))(v8, v9, v10);
  v11 = a3[6];
  v12 = a1 + v11;
  v13 = a2 + v11;
  v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569800D0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 16))(v12, v13, v14);
  v15 = a3[7];
  v16 = a1 + v15;
  v17 = a2 + v15;
  v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569800A8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v18 - 8) + 16))(v16, v17, v18);
  return a1;
}

uint64_t assignWithCopy for SupplementarySnippetModel(uint64_t a1, uint64_t a2, int *a3)
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

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569800C8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 24))(a1, a2, v6);
  v7 = a3[5];
  v8 = a1 + v7;
  v9 = a2 + v7;
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569800C0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 24))(v8, v9, v10);
  v11 = a3[6];
  v12 = a1 + v11;
  v13 = a2 + v11;
  v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569800D0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 24))(v12, v13, v14);
  v15 = a3[7];
  v16 = a1 + v15;
  v17 = a2 + v15;
  v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569800A8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v18 - 8) + 24))(v16, v17, v18);
  return a1;
}

uint64_t initializeWithTake for SupplementarySnippetModel(uint64_t a1, uint64_t a2, int *a3)
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

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569800C8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 32))(a1, a2, v6);
  v7 = a3[5];
  v8 = a1 + v7;
  v9 = a2 + v7;
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569800C0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 32))(v8, v9, v10);
  v11 = a3[6];
  v12 = a1 + v11;
  v13 = a2 + v11;
  v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569800D0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 32))(v12, v13, v14);
  v15 = a3[7];
  v16 = a1 + v15;
  v17 = a2 + v15;
  v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569800A8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v18 - 8) + 32))(v16, v17, v18);
  return a1;
}

uint64_t assignWithTake for SupplementarySnippetModel(uint64_t a1, uint64_t a2, int *a3)
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

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569800C8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 40))(a1, a2, v6);
  v7 = a3[5];
  v8 = a1 + v7;
  v9 = a2 + v7;
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569800C0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 40))(v8, v9, v10);
  v11 = a3[6];
  v12 = a1 + v11;
  v13 = a2 + v11;
  v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569800D0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 40))(v12, v13, v14);
  v15 = a3[7];
  v16 = a1 + v15;
  v17 = a2 + v15;
  v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569800A8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v18 - 8) + 40))(v16, v17, v18);
  return a1;
}

uint64_t getEnumTagSinglePayload for SupplementarySnippetModel()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_23A48BD74(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char v9;
  uint64_t v10;
  uint64_t v11;
  char v12;
  uint64_t v13;

  __swift_instantiateConcreteTypeFromMangledName(&qword_2569800C8);
  OUTLINED_FUNCTION_17_0();
  if (v9)
  {
    v7 = v6;
    v8 = a1;
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_2569800C0);
    OUTLINED_FUNCTION_17_0();
    if (v9)
    {
      v7 = v10;
      v11 = a3[5];
    }
    else
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_2569800D0);
      OUTLINED_FUNCTION_17_0();
      if (v12)
      {
        v7 = v13;
        v11 = a3[6];
      }
      else
      {
        v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569800A8);
        v11 = a3[7];
      }
    }
    v8 = a1 + v11;
  }
  return __swift_getEnumTagSinglePayload(v8, a2, v7);
}

uint64_t storeEnumTagSinglePayload for SupplementarySnippetModel()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_23A48BE28(uint64_t a1, uint64_t a2, uint64_t a3, int *a4)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char v10;
  uint64_t v11;
  uint64_t v12;
  char v13;
  uint64_t v14;

  __swift_instantiateConcreteTypeFromMangledName(&qword_2569800C8);
  OUTLINED_FUNCTION_16_1();
  if (v10)
  {
    v8 = v7;
    v9 = a1;
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_2569800C0);
    OUTLINED_FUNCTION_16_1();
    if (v10)
    {
      v8 = v11;
      v12 = a4[5];
    }
    else
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_2569800D0);
      OUTLINED_FUNCTION_16_1();
      if (v13)
      {
        v8 = v14;
        v12 = a4[6];
      }
      else
      {
        v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569800A8);
        v12 = a4[7];
      }
    }
    v9 = a1 + v12;
  }
  return __swift_storeEnumTagSinglePayload(v9, a2, a2, v8);
}

void sub_23A48BED8()
{
  unint64_t v0;
  unint64_t v1;
  unint64_t v2;
  unint64_t v3;

  sub_23A48BFC4(319, &qword_256980D80, &qword_256980C58);
  if (v0 <= 0x3F)
  {
    sub_23A48BFC4(319, &qword_256980D88, &qword_256980078);
    if (v1 <= 0x3F)
    {
      sub_23A48BFC4(319, qword_256980D90, &qword_256980C50);
      if (v2 <= 0x3F)
      {
        sub_23A47E684();
        if (v3 <= 0x3F)
          swift_initStructMetadata();
      }
    }
  }
}

void sub_23A48BFC4(uint64_t a1, unint64_t *a2, uint64_t *a3)
{
  unint64_t v4;
  uint64_t v5;

  if (!*a2)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(a3);
    v4 = sub_23A4AA384();
    if (!v5)
      atomic_store(v4, a2);
  }
}

uint64_t storeEnumTagSinglePayload for SupplementarySnippetModel.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_23A48C05C + 4 * byte_23A4AC699[v4]))();
  *a1 = a2 + 3;
  return ((uint64_t (*)(void))((char *)sub_23A48C090 + 4 * byte_23A4AC694[v4]))();
}

uint64_t sub_23A48C090(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_23A48C098(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x23A48C0A0);
  return result;
}

uint64_t sub_23A48C0AC(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x23A48C0B4);
  *(_BYTE *)result = a2 + 3;
  return result;
}

uint64_t sub_23A48C0B8(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23A48C0C0(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for SupplementarySnippetModel.CodingKeys()
{
  return &type metadata for SupplementarySnippetModel.CodingKeys;
}

unint64_t sub_23A48C0E0()
{
  unint64_t result;

  result = qword_256980DC8;
  if (!qword_256980DC8)
  {
    result = MEMORY[0x23B84E2B0](&unk_23A4AC808, &type metadata for SupplementarySnippetModel.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256980DC8);
  }
  return result;
}

unint64_t sub_23A48C120()
{
  unint64_t result;

  result = qword_256980DD0;
  if (!qword_256980DD0)
  {
    result = MEMORY[0x23B84E2B0](&unk_23A4AC778, &type metadata for SupplementarySnippetModel.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256980DD0);
  }
  return result;
}

unint64_t sub_23A48C160()
{
  unint64_t result;

  result = qword_256980DD8;
  if (!qword_256980DD8)
  {
    result = MEMORY[0x23B84E2B0](&unk_23A4AC7A0, &type metadata for SupplementarySnippetModel.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256980DD8);
  }
  return result;
}

uint64_t sub_23A48C19C(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  if (a2 != 1)
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    return swift_bridgeObjectRetain();
  }
  return result;
}

uint64_t sub_23A48C1F0(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  if (a2 != 1)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_23A48C244(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for Action(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t OUTLINED_FUNCTION_1_8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 256) + 8))(v0, v1);
}

uint64_t OUTLINED_FUNCTION_5_6()
{
  return type metadata accessor for SupplementarySnippetModel();
}

uint64_t OUTLINED_FUNCTION_11_6()
{
  return sub_23A4AAA44();
}

void OUTLINED_FUNCTION_16_3()
{
  JUMPOUT(0x23B84E2B0);
}

uint64_t OUTLINED_FUNCTION_18_3()
{
  return sub_23A4AA354();
}

uint64_t OUTLINED_FUNCTION_19_2()
{
  return sub_23A4AA354();
}

unint64_t OUTLINED_FUNCTION_24_1()
{
  uint64_t v0;

  return sub_23A47E0EC(v0);
}

uint64_t OUTLINED_FUNCTION_26_2()
{
  return sub_23A4AA36C();
}

uint64_t OUTLINED_FUNCTION_28_2()
{
  uint64_t v0;
  uint64_t v1;

  return sub_23A48A488(v1, v0);
}

uint64_t sub_23A48C354(unsigned __int8 a1)
{
  return ((uint64_t (*)(unint64_t, unint64_t))((char *)sub_23A48C38C + 4 * byte_23A4AC880[a1]))(0xD000000000000012, 0x800000023A4AEE00);
}

uint64_t sub_23A48C38C()
{
  return 0x5F72657473756C63;
}

uint64_t sub_23A48C3A8()
{
  return 0x747865746E6F63;
}

uint64_t sub_23A48C3C0()
{
  return 0x626D79735F736168;
}

uint64_t sub_23A48C3E0()
{
  return 0x6574616C706D6574;
}

uint64_t sub_23A48C404()
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
  uint64_t v10;
  _BYTE v11[16];
  _BYTE v12[16];
  _QWORD v13[2];
  _QWORD v14[2];

  v1 = v0;
  sub_23A48C69C();
  sub_23A4AA774();
  sub_23A4AA7BC();
  OUTLINED_FUNCTION_2_9();
  v2 = OUTLINED_FUNCTION_0_11();
  sub_23A4923F4(v2, 0x5F72657473756C63, 0xEA00000000006469);
  OUTLINED_FUNCTION_1_9();
  sub_23A48C710(v0 + 48, (uint64_t)v12);
  sub_23A48C710((uint64_t)v12, (uint64_t)v13);
  if (v13[1])
  {
    sub_23A4AA7BC();
    OUTLINED_FUNCTION_2_9();
    v3 = OUTLINED_FUNCTION_0_11();
    sub_23A4923F4(v3, 0x747865746E6F63, 0xE700000000000000);
    OUTLINED_FUNCTION_1_9();
  }
  else
  {

  }
  sub_23A4AA8B8();
  OUTLINED_FUNCTION_2_9();
  v4 = OUTLINED_FUNCTION_0_11();
  sub_23A4923F4(v4, 0x626D79735F736168, 0xEB00000000736C6FLL);
  OUTLINED_FUNCTION_1_9();
  sub_23A49FD90(*(_BYTE *)(v0 + 65));
  sub_23A4AA7BC();
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_2_9();
  v5 = OUTLINED_FUNCTION_0_11();
  sub_23A4923F4(v5, 0x6574616C706D6574, 0xED0000657079745FLL);
  v6 = v14[0];
  v10 = v14[0];
  OUTLINED_FUNCTION_1_9();
  sub_23A48C710(v1 + 72, (uint64_t)v11);
  sub_23A48C710((uint64_t)v11, (uint64_t)v14);
  if (v14[1])
  {
    v7 = sub_23A4AA7BC();
    OUTLINED_FUNCTION_2_9();
    sub_23A4923F4(v7, 0xD000000000000012, 0x800000023A4AEE00);
    v8 = v6;
    OUTLINED_FUNCTION_1_9();
  }
  else
  {

    return v10;
  }
  return v8;
}

uint64_t sub_23A48C644()
{
  uint64_t *v0;
  uint64_t v1;

  v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_23A48C670()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 16);
  swift_bridgeObjectRetain();
  return v1;
}

unint64_t sub_23A48C69C()
{
  unint64_t result;

  result = qword_256980DE0;
  if (!qword_256980DE0)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_256980DE0);
  }
  return result;
}

uint64_t sub_23A48C6D8()
{
  const void *v0;
  _BYTE __dst[88];

  memcpy(__dst, v0, sizeof(__dst));
  return sub_23A48C404();
}

uint64_t sub_23A48C710(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_256980420);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t destroy for ContentViewedEvent()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for ContentViewedEvent(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v3 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v3;
  v4 = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = v4;
  v5 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v5;
  v6 = *(_QWORD *)(a2 + 56);
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(a1 + 56) = v6;
  *(_BYTE *)(a1 + 64) = *(_BYTE *)(a2 + 64);
  *(_BYTE *)(a1 + 65) = *(_BYTE *)(a2 + 65);
  v7 = *(_QWORD *)(a2 + 80);
  *(_QWORD *)(a1 + 72) = *(_QWORD *)(a2 + 72);
  *(_QWORD *)(a1 + 80) = v7;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for ContentViewedEvent(uint64_t a1, uint64_t a2)
{
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
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(a1 + 56) = *(_QWORD *)(a2 + 56);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + 64) = *(_BYTE *)(a2 + 64);
  *(_BYTE *)(a1 + 65) = *(_BYTE *)(a2 + 65);
  *(_QWORD *)(a1 + 72) = *(_QWORD *)(a2 + 72);
  *(_QWORD *)(a1 + 80) = *(_QWORD *)(a2 + 80);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

void *__swift_memcpy88_8(void *a1, const void *a2)
{
  return memcpy(a1, a2, 0x58uLL);
}

uint64_t assignWithTake for ContentViewedEvent(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

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
  v7 = *(_QWORD *)(a2 + 56);
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(a1 + 56) = v7;
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + 64) = *(_BYTE *)(a2 + 64);
  *(_BYTE *)(a1 + 65) = *(_BYTE *)(a2 + 65);
  v8 = *(_QWORD *)(a2 + 80);
  *(_QWORD *)(a1 + 72) = *(_QWORD *)(a2 + 72);
  *(_QWORD *)(a1 + 80) = v8;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for ContentViewedEvent(uint64_t a1, int a2)
{
  unint64_t v2;

  if (a2)
  {
    if (a2 < 0 && *(_BYTE *)(a1 + 88))
    {
      LODWORD(v2) = *(_DWORD *)a1 + 0x7FFFFFFF;
    }
    else
    {
      v2 = *(_QWORD *)(a1 + 8);
      if (v2 >= 0xFFFFFFFF)
        LODWORD(v2) = -1;
    }
  }
  else
  {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for ContentViewedEvent(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 88) = 1;
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
    *(_BYTE *)(result + 88) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for ContentViewedEvent()
{
  return &type metadata for ContentViewedEvent;
}

uint64_t OUTLINED_FUNCTION_0_11()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v2 - 48) = v0;
  return v1;
}

uint64_t OUTLINED_FUNCTION_1_9()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_2_9()
{
  return swift_isUniquelyReferenced_nonNull_native();
}

unint64_t sub_23A48CA54()
{
  return 0xD000000000000022;
}

uint64_t sub_23A48CA70(char a1)
{
  if (a1)
    return 0xD000000000000016;
  else
    return 0x6F4E746C75736572;
}

uint64_t sub_23A48CAD0(uint64_t a1, uint64_t a2, uint64_t a3, int a4)
{
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
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  int v26;
  uint64_t v27;

  v27 = a2;
  v26 = a4;
  v24 = a3;
  v25 = a1;
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_256980DE8);
  v7 = *(_QWORD *)(v6 - 8);
  v8 = *(_QWORD *)(v7 + 64);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v23 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_256980DF0);
  MEMORY[0x24BDAC7A8](v10);
  v12 = (char *)&v23 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = sub_23A4AA450();
  v14 = *(_QWORD *)(v13 - 8);
  MEMORY[0x24BDAC7A8](v13);
  (*(void (**)(char *, uint64_t, uint64_t))(v14 + 16))((char *)&v23 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v13);
  v16 = sub_23A4AA3E4();
  v17 = *(_QWORD *)(v16 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v17 + 16))(v12, a3, v16);
  __swift_storeEnumTagSinglePayload((uint64_t)v12, 0, 1, v16);
  sub_23A48CE34(v27, (uint64_t)v9);
  v18 = (*(unsigned __int8 *)(v7 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
  v19 = v18 + v8;
  v20 = swift_allocObject();
  sub_23A48CF0C((uint64_t)v9, v20 + v18);
  *(_BYTE *)(v20 + v19) = v26;
  v21 = sub_23A4AA408();
  (*(void (**)(uint64_t, uint64_t))(v17 + 8))(v24, v16);
  sub_23A48CFA0(v27);
  (*(void (**)(uint64_t, uint64_t))(v14 + 8))(v25, v13);
  return v21;
}

void sub_23A48CCC4(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_256980DE8);
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23A48CE34(a2, (uint64_t)v7);
  v8 = sub_23A4AA570();
  if (__swift_getEnumTagSinglePayload((uint64_t)v7, 1, v8) == 1)
  {
    sub_23A48CFA0((uint64_t)v7);
  }
  else
  {
    sub_23A4AA564();
    (*(void (**)(char *, uint64_t))(*(_QWORD *)(v8 - 8) + 8))(v7, v8);
  }
  sub_23A4AA3FC();
  __asm { BR              X11 }
}

uint64_t sub_23A48CDD8()
{
  return sub_23A4AA3F0();
}

uint64_t sub_23A48CE34(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_256980DE8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_23A48CE7C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v1 = *(unsigned __int8 *)(*(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_256980DE8) - 8) + 80);
  v2 = (v1 + 16) & ~v1;
  v3 = sub_23A4AA570();
  if (!__swift_getEnumTagSinglePayload(v0 + v2, 1, v3))
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(v0 + v2, v3);
  return swift_deallocObject();
}

uint64_t sub_23A48CF0C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_256980DE8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

void sub_23A48CF54(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  unint64_t v4;

  v3 = *(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_256980DE8) - 8);
  v4 = (*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  sub_23A48CCC4(a1, v1 + v4, *(_BYTE *)(v1 + v4 + *(_QWORD *)(v3 + 64)));
}

uint64_t sub_23A48CFA0(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_256980DE8);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t type metadata accessor for DeviceExpertCATsSimple()
{
  uint64_t result;

  result = qword_256980DF8;
  if (!qword_256980DF8)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_23A48D018()
{
  return swift_initClassMetadata2();
}

BOOL sub_23A48D054()
{
  return sub_23A48D364();
}

unint64_t sub_23A48D060()
{
  return 0xD00000000000001BLL;
}

BOOL sub_23A48D088@<W0>(_BYTE *a1@<X8>)
{
  _BOOL8 result;

  result = sub_23A48D364();
  *a1 = result;
  return result;
}

unint64_t sub_23A48D0C4@<X0>(_QWORD *a1@<X8>)
{
  unint64_t result;
  uint64_t v3;

  result = sub_23A48D060();
  *a1 = 0xD00000000000001BLL;
  a1[1] = v3;
  return result;
}

uint64_t sub_23A48D0F0(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t v3;
  uint64_t v4;

  *(_QWORD *)(v4 + 24) = a2;
  *(_QWORD *)(v4 + 32) = v3;
  *(_BYTE *)(v4 + 72) = a3;
  *(_QWORD *)(v4 + 16) = a1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2569807B8);
  *(_QWORD *)(v4 + 40) = OUTLINED_FUNCTION_12_4();
  OUTLINED_FUNCTION_24();
  return OUTLINED_FUNCTION_1_0();
}

uint64_t sub_23A48D138()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t *boxed_opaque_existential_1;
  char v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  unint64_t v11;
  uint64_t (*v13)(unint64_t, unint64_t, uint64_t, ValueMetadata *, unint64_t);

  v1 = *(_QWORD *)(v0 + 16);
  __swift_instantiateConcreteTypeFromMangledName(&qword_256980E70);
  v2 = OUTLINED_FUNCTION_9_7();
  *(_QWORD *)(v0 + 48) = v2;
  *(_OWORD *)(v2 + 16) = xmmword_23A4AC930;
  v3 = (uint64_t *)(v2 + 48);
  *(_QWORD *)(v2 + 32) = 0xD000000000000014;
  *(_QWORD *)(v2 + 40) = 0x800000023A4AEF70;
  OUTLINED_FUNCTION_19_3(v2, v4, &qword_2569807B8);
  v5 = sub_23A4AA588();
  if (OUTLINED_FUNCTION_11_7(v5) == 1)
  {
    sub_23A48762C(*(_QWORD *)(v0 + 40), &qword_2569807B8);
    *(_OWORD *)v3 = 0u;
    *(_OWORD *)(v2 + 64) = 0u;
  }
  else
  {
    *(_QWORD *)(v2 + 72) = v1;
    boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v3);
    OUTLINED_FUNCTION_10_6((uint64_t)boxed_opaque_existential_1);
  }
  v7 = *(_BYTE *)(v0 + 72);
  *(_QWORD *)(v2 + 80) = 0xD000000000000019;
  *(_QWORD *)(v2 + 88) = 0x800000023A4AEF90;
  if ((v7 & 1) != 0)
  {
    v9 = 0;
    v8 = 0;
    *(_QWORD *)(v2 + 104) = 0;
    *(_QWORD *)(v2 + 112) = 0;
  }
  else
  {
    v8 = *(_QWORD *)(v0 + 24);
    v9 = MEMORY[0x24BEE13C8];
  }
  *(_QWORD *)(v2 + 120) = v9;
  *(_QWORD *)(v2 + 96) = v8;
  v13 = (uint64_t (*)(unint64_t, unint64_t, uint64_t, ValueMetadata *, unint64_t))((int)*MEMORY[0x24BE929F8] + MEMORY[0x24BE929F8]);
  v10 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 56) = v10;
  v11 = sub_23A48DC9C();
  *v10 = v0;
  v10[1] = sub_23A48D2B4;
  return v13(0xD00000000000001DLL, 0x800000023A4AEFB0, v2, &type metadata for DeviceExpertCATsSimple.AttributionGroupDialogIds, v11);
}

uint64_t sub_23A48D2B4(uint64_t a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v4;

  v4 = *v2;
  *(_QWORD *)(v4 + 64) = v1;
  swift_task_dealloc();
  if (v1)
  {
    OUTLINED_FUNCTION_24();
    return OUTLINED_FUNCTION_0_12();
  }
  else
  {
    swift_bridgeObjectRelease();
    OUTLINED_FUNCTION_93();
    return OUTLINED_FUNCTION_1_10(a1, *(uint64_t (**)(void))(v4 + 8));
  }
}

uint64_t sub_23A48D328()
{
  uint64_t v0;

  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_93();
  return OUTLINED_FUNCTION_2_10(*(uint64_t (**)(void))(v0 + 8));
}

BOOL sub_23A48D358()
{
  return sub_23A48D364();
}

BOOL sub_23A48D364()
{
  uint64_t v0;

  v0 = sub_23A4AA9F0();
  swift_bridgeObjectRelease();
  return v0 != 0;
}

unint64_t sub_23A48D3A4()
{
  return 0xD00000000000001CLL;
}

BOOL sub_23A48D3CC@<W0>(_BYTE *a1@<X8>)
{
  _BOOL8 result;

  result = sub_23A48D364();
  *a1 = result;
  return result;
}

unint64_t sub_23A48D408@<X0>(_QWORD *a1@<X8>)
{
  unint64_t result;
  uint64_t v3;

  result = sub_23A48D3A4();
  *a1 = 0xD00000000000001CLL;
  a1[1] = v3;
  return result;
}

uint64_t sub_23A48D434(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v2 + 16) = a1;
  *(_QWORD *)(v2 + 24) = v1;
  return OUTLINED_FUNCTION_3_8();
}

uint64_t sub_23A48D444()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;
  unint64_t v4;
  uint64_t (*v6)(unint64_t, unint64_t, uint64_t, ValueMetadata *, unint64_t);

  v1 = v0[2];
  __swift_instantiateConcreteTypeFromMangledName(&qword_256980E70);
  v2 = OUTLINED_FUNCTION_17_2();
  v0[4] = v2;
  *(_OWORD *)(v2 + 16) = xmmword_23A4AB880;
  *(_QWORD *)(v2 + 32) = 0xD000000000000015;
  *(_QWORD *)(v2 + 40) = 0x800000023A4AEF50;
  *(_QWORD *)(v2 + 72) = __swift_instantiateConcreteTypeFromMangledName(&qword_256980E80);
  *(_QWORD *)(v2 + 48) = v1;
  v6 = (uint64_t (*)(unint64_t, unint64_t, uint64_t, ValueMetadata *, unint64_t))((int)*MEMORY[0x24BE929F8] + MEMORY[0x24BE929F8]);
  swift_bridgeObjectRetain();
  v3 = (_QWORD *)swift_task_alloc();
  v0[5] = v3;
  v4 = sub_23A48DC60();
  *v3 = v0;
  v3[1] = sub_23A48D53C;
  return v6(0xD00000000000001CLL, 0x800000023A4AEF30, v2, &type metadata for DeviceExpertCATsSimple.AttributionListDialogIds, v4);
}

uint64_t sub_23A48D53C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  OUTLINED_FUNCTION_4_7();
  if (v1)
  {
    OUTLINED_FUNCTION_24();
    return OUTLINED_FUNCTION_0_12();
  }
  else
  {
    swift_bridgeObjectRelease();
    return OUTLINED_FUNCTION_1_10(v0, *(uint64_t (**)(void))(v2 + 8));
  }
}

uint64_t sub_23A48D588(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v2 + 16) = a1;
  *(_QWORD *)(v2 + 24) = v1;
  return OUTLINED_FUNCTION_3_8();
}

uint64_t sub_23A48D598()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;
  uint64_t (*v7)(unint64_t);

  v1 = v0[2];
  __swift_instantiateConcreteTypeFromMangledName(&qword_256980E70);
  v2 = OUTLINED_FUNCTION_17_2();
  v0[4] = v2;
  *(_OWORD *)(v2 + 16) = xmmword_23A4AB880;
  OUTLINED_FUNCTION_18_4();
  *(_QWORD *)(v3 + 32) = v4;
  *(_QWORD *)(v3 + 40) = 0xE700000000000000;
  *(_QWORD *)(v2 + 72) = __swift_instantiateConcreteTypeFromMangledName(&qword_256980E80);
  *(_QWORD *)(v2 + 48) = v1;
  v7 = (uint64_t (*)(unint64_t))((int)*MEMORY[0x24BE92A08] + MEMORY[0x24BE92A08]);
  swift_bridgeObjectRetain();
  v5 = (_QWORD *)swift_task_alloc();
  v0[5] = v5;
  *v5 = v0;
  v5[1] = sub_23A48D664;
  OUTLINED_FUNCTION_16_4();
  return v7(0xD00000000000001ALL);
}

uint64_t sub_23A48D664()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  OUTLINED_FUNCTION_4_7();
  if (v1)
  {
    OUTLINED_FUNCTION_24();
    return OUTLINED_FUNCTION_0_12();
  }
  else
  {
    swift_bridgeObjectRelease();
    return OUTLINED_FUNCTION_1_10(v0, *(uint64_t (**)(void))(v2 + 8));
  }
}

uint64_t sub_23A48D6B0()
{
  uint64_t v0;

  swift_bridgeObjectRelease();
  return OUTLINED_FUNCTION_2_10(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_23A48D6DC(char a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;

  *(_QWORD *)(v3 + 16) = a2;
  *(_QWORD *)(v3 + 24) = v2;
  *(_BYTE *)(v3 + 64) = a1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2569807B8);
  *(_QWORD *)(v3 + 32) = OUTLINED_FUNCTION_12_4();
  OUTLINED_FUNCTION_24();
  return OUTLINED_FUNCTION_1_0();
}

uint64_t sub_23A48D720()
{
  uint64_t v0;
  uint64_t v1;
  char v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t *boxed_opaque_existential_1;
  _QWORD *v9;
  uint64_t v10;
  uint64_t (*v12)(void);

  v1 = *(_QWORD *)(v0 + 16);
  v2 = *(_BYTE *)(v0 + 64);
  __swift_instantiateConcreteTypeFromMangledName(&qword_256980E70);
  v3 = OUTLINED_FUNCTION_9_7();
  *(_QWORD *)(v0 + 40) = v3;
  *(_OWORD *)(v3 + 16) = xmmword_23A4AC930;
  *(_QWORD *)(v3 + 32) = 0x7069547369;
  *(_QWORD *)(v3 + 40) = 0xE500000000000000;
  v4 = MEMORY[0x24BEE1328];
  *(_BYTE *)(v3 + 48) = v2;
  v5 = (uint64_t *)(v3 + 96);
  *(_QWORD *)(v3 + 72) = v4;
  *(_QWORD *)(v3 + 80) = 0x74706D6F7270;
  *(_QWORD *)(v3 + 88) = 0xE600000000000000;
  OUTLINED_FUNCTION_19_3(v3, v6, &qword_2569807B8);
  v7 = sub_23A4AA588();
  if (OUTLINED_FUNCTION_11_7(v7) == 1)
  {
    sub_23A48762C(*(_QWORD *)(v0 + 32), &qword_2569807B8);
    *(_OWORD *)v5 = 0u;
    *(_OWORD *)(v3 + 112) = 0u;
  }
  else
  {
    *(_QWORD *)(v3 + 120) = v1;
    boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v5);
    OUTLINED_FUNCTION_10_6((uint64_t)boxed_opaque_existential_1);
  }
  v12 = (uint64_t (*)(void))((int)*MEMORY[0x24BE92A08] + MEMORY[0x24BE92A08]);
  v9 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 48) = v9;
  *v9 = v0;
  v9[1] = sub_23A48D84C;
  OUTLINED_FUNCTION_16_4();
  return OUTLINED_FUNCTION_6_7(0xD000000000000014, v10, v3, v12);
}

uint64_t sub_23A48D84C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  OUTLINED_FUNCTION_5_7();
  if (v1)
  {
    OUTLINED_FUNCTION_24();
    return OUTLINED_FUNCTION_0_12();
  }
  else
  {
    swift_bridgeObjectRelease();
    OUTLINED_FUNCTION_93();
    return OUTLINED_FUNCTION_1_10(v0, *(uint64_t (**)(void))(v2 + 8));
  }
}

uint64_t sub_23A48D8A0()
{
  uint64_t v0;

  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_93();
  return OUTLINED_FUNCTION_2_10(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_23A48D8D0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v3;

  v3[3] = a2;
  v3[4] = v2;
  v3[2] = a1;
  return OUTLINED_FUNCTION_3_8();
}

uint64_t sub_23A48D8E4()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;
  uint64_t v7;
  uint64_t (*v9)(void);

  v2 = v0[2];
  v1 = v0[3];
  __swift_instantiateConcreteTypeFromMangledName(&qword_256980E70);
  v3 = OUTLINED_FUNCTION_9_7();
  v0[5] = v3;
  *(_OWORD *)(v3 + 16) = xmmword_23A4AC930;
  *(_QWORD *)(v3 + 32) = 0x7370657473;
  *(_QWORD *)(v3 + 40) = 0xE500000000000000;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256980E78);
  *(_QWORD *)(v3 + 48) = v2;
  OUTLINED_FUNCTION_18_4();
  *(_QWORD *)(v3 + 72) = v4;
  *(_QWORD *)(v3 + 80) = v5;
  *(_QWORD *)(v3 + 88) = 0xE700000000000000;
  *(_QWORD *)(v3 + 120) = __swift_instantiateConcreteTypeFromMangledName(&qword_256980E80);
  *(_QWORD *)(v3 + 96) = v1;
  v9 = (uint64_t (*)(void))((int)*MEMORY[0x24BE92A08] + MEMORY[0x24BE92A08]);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v6 = (_QWORD *)swift_task_alloc();
  v0[6] = v6;
  *v6 = v0;
  v6[1] = sub_23A48D9D8;
  OUTLINED_FUNCTION_16_4();
  return OUTLINED_FUNCTION_6_7(0xD000000000000017, v7, v3, v9);
}

uint64_t sub_23A48D9D8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  OUTLINED_FUNCTION_5_7();
  if (v1)
  {
    OUTLINED_FUNCTION_24();
    return OUTLINED_FUNCTION_0_12();
  }
  else
  {
    swift_bridgeObjectRelease();
    return OUTLINED_FUNCTION_1_10(v0, *(uint64_t (**)(void))(v2 + 8));
  }
}

uint64_t sub_23A48DA24()
{
  uint64_t v0;

  swift_bridgeObjectRelease();
  return OUTLINED_FUNCTION_2_10(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_23A48DA50(uint64_t a1, uint64_t a2)
{
  OUTLINED_FUNCTION_14_5();
  return sub_23A48DA94(a1, a2);
}

uint64_t sub_23A48DA94(uint64_t a1, uint64_t a2)
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

  v4 = sub_23A4AA5DC();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  OUTLINED_FUNCTION_4();
  v8 = v7 - v6;
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_256980430);
  MEMORY[0x24BDAC7A8](v9);
  OUTLINED_FUNCTION_4();
  sub_23A47D334(a1, v11 - v10, &qword_256980430);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 16))(v8, a2, v4);
  v12 = sub_23A4AA594();
  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(a2, v4);
  sub_23A48762C(a1, &qword_256980430);
  return v12;
}

uint64_t sub_23A48DB98(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v3 = sub_23A4AA5DC();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  OUTLINED_FUNCTION_4();
  v7 = v6 - v5;
  OUTLINED_FUNCTION_14_5();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v4 + 16))(v7, a2, v3);
  v8 = sub_23A4AA5A0();
  (*(void (**)(uint64_t, uint64_t))(v4 + 8))(a2, v3);
  return v8;
}

uint64_t sub_23A48DC3C()
{
  sub_23A4AA5B8();
  return swift_deallocClassInstance();
}

uint64_t sub_23A48DC58()
{
  return type metadata accessor for DeviceExpertCATsSimple();
}

unint64_t sub_23A48DC60()
{
  unint64_t result;

  result = qword_256980E88;
  if (!qword_256980E88)
  {
    result = MEMORY[0x23B84E2B0](&unk_23A4ACAE4, &type metadata for DeviceExpertCATsSimple.AttributionListDialogIds);
    atomic_store(result, (unint64_t *)&qword_256980E88);
  }
  return result;
}

unint64_t sub_23A48DC9C()
{
  unint64_t result;

  result = qword_256980E90;
  if (!qword_256980E90)
  {
    result = MEMORY[0x23B84E2B0](&unk_23A4ACAAC, &type metadata for DeviceExpertCATsSimple.AttributionGroupDialogIds);
    atomic_store(result, (unint64_t *)&qword_256980E90);
  }
  return result;
}

ValueMetadata *type metadata accessor for DeviceExpertCATsSimple.AttributionGroupDialogIds()
{
  return &type metadata for DeviceExpertCATsSimple.AttributionGroupDialogIds;
}

uint64_t _s19DeviceExpertIntents22DeviceExpertCATsSimpleC25AttributionGroupDialogIdsOwst_0(uint64_t a1, int a2, int a3)
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
    return ((uint64_t (*)(void))((char *)sub_23A48DD30 + 4 * byte_23A4AC940[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_23A48DD50 + 4 * byte_23A4AC945[v4]))();
}

_BYTE *sub_23A48DD30(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_23A48DD50(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_23A48DD58(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_23A48DD60(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_23A48DD68(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_23A48DD70(_DWORD *result)
{
  *result = 0;
  return result;
}

ValueMetadata *type metadata accessor for DeviceExpertCATsSimple.AttributionListDialogIds()
{
  return &type metadata for DeviceExpertCATsSimple.AttributionListDialogIds;
}

unint64_t sub_23A48DD90()
{
  unint64_t result;

  result = qword_256980E98;
  if (!qword_256980E98)
  {
    result = MEMORY[0x23B84E2B0](&unk_23A4ACA1C, &type metadata for DeviceExpertCATsSimple.AttributionListDialogIds);
    atomic_store(result, (unint64_t *)&qword_256980E98);
  }
  return result;
}

unint64_t sub_23A48DDD0()
{
  unint64_t result;

  result = qword_256980EA0;
  if (!qword_256980EA0)
  {
    result = MEMORY[0x23B84E2B0](&unk_23A4ACA84, &type metadata for DeviceExpertCATsSimple.AttributionGroupDialogIds);
    atomic_store(result, (unint64_t *)&qword_256980EA0);
  }
  return result;
}

uint64_t OUTLINED_FUNCTION_0_12()
{
  return swift_task_switch();
}

uint64_t OUTLINED_FUNCTION_1_10(uint64_t a1, uint64_t (*a2)(void))
{
  return a2();
}

uint64_t OUTLINED_FUNCTION_2_10(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t OUTLINED_FUNCTION_3_8()
{
  return swift_task_switch();
}

uint64_t OUTLINED_FUNCTION_4_7()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t *v4;

  v3 = *v1;
  v4 = (uint64_t *)(v2 - 8);
  *v4 = *v1;
  *v4 = *v1;
  *(_QWORD *)(v3 + 48) = v0;
  return swift_task_dealloc();
}

uint64_t OUTLINED_FUNCTION_5_7()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t *v4;

  v3 = *v1;
  v4 = (uint64_t *)(v2 - 8);
  *v4 = *v1;
  *v4 = *v1;
  *(_QWORD *)(v3 + 56) = v0;
  return swift_task_dealloc();
}

uint64_t OUTLINED_FUNCTION_6_7(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(void))
{
  return a4();
}

uint64_t OUTLINED_FUNCTION_9_7()
{
  return swift_allocObject();
}

uint64_t OUTLINED_FUNCTION_10_6(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v1 - 8) + 32))(a1, v2, v1);
}

uint64_t OUTLINED_FUNCTION_11_7(uint64_t a1)
{
  uint64_t v1;

  return __swift_getEnumTagSinglePayload(v1, 1, a1);
}

uint64_t OUTLINED_FUNCTION_12_4()
{
  return swift_task_alloc();
}

uint64_t OUTLINED_FUNCTION_14_5()
{
  return swift_allocObject();
}

uint64_t OUTLINED_FUNCTION_17_2()
{
  return swift_allocObject();
}

uint64_t OUTLINED_FUNCTION_19_3(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v3;
  uint64_t v4;

  return sub_23A47D334(v3, v4, a3);
}

void sub_23A48DF38()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;

  type metadata accessor for TellMeGeneratedSnippetModels();
  OUTLINED_FUNCTION_1_5();
  MEMORY[0x24BDAC7A8](v1);
  OUTLINED_FUNCTION_4();
  sub_23A47D2B4(v0, v3 - v2);
  v4 = (char *)sub_23A48DFAC + 4 * byte_23A4ACB20[swift_getEnumCaseMultiPayload()];
  __asm { BR              X10 }
}

uint64_t sub_23A48DFAC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t *boxed_opaque_existential_1;
  uint64_t v3;
  uint64_t v4;

  *(_QWORD *)(v1 - 48) = type metadata accessor for AttributionListSnippetModel();
  *(_QWORD *)(v1 - 40) = &off_250B5F1D8;
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1((uint64_t *)(v1 - 72));
  sub_23A48F9FC(v0, (uint64_t)boxed_opaque_existential_1, (uint64_t (*)(_QWORD))type metadata accessor for AttributionListSnippetModel);
  v3 = *(_QWORD *)(v1 - 48);
  v4 = *(_QWORD *)(v1 - 40);
  __swift_project_boxed_opaque_existential_1((_QWORD *)(v1 - 72), v3);
  LOBYTE(v3) = (*(uint64_t (**)(uint64_t, uint64_t))(v4 + 8))(v3, v4);
  __swift_destroy_boxed_opaque_existential_1(v1 - 72);
  return v3 & 1;
}

unint64_t static TellMeGeneratedSnippetModels.bundleName.getter()
{
  return 0xD000000000000014;
}

uint64_t sub_23A48E0D0(uint64_t a1, uint64_t a2)
{
  BOOL v3;
  BOOL v6;
  BOOL v7;
  BOOL v8;
  char v10;

  v3 = a1 == 0x7475626972747461 && a2 == 0xEF7473694C6E6F69;
  if (v3 || (sub_23A4AAAB0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else
  {
    v6 = a1 == 0x726F4D6E7261656CLL && a2 == 0xE900000000000065;
    if (v6 || (sub_23A4AAAB0() & 1) != 0)
    {
      swift_bridgeObjectRelease();
      return 1;
    }
    else
    {
      v7 = a1 == 0x6C7974537473696CLL && a2 == 0xEF726577736E4165;
      if (v7 || (sub_23A4AAAB0() & 1) != 0)
      {
        swift_bridgeObjectRelease();
        return 2;
      }
      else if (a1 == 0xD000000000000010 && a2 == 0x800000023A4AF020 || (sub_23A4AAAB0() & 1) != 0)
      {
        swift_bridgeObjectRelease();
        return 3;
      }
      else
      {
        v8 = a1 == 0x656D656C70707573 && a2 == 0xED0000797261746ELL;
        if (v8 || (sub_23A4AAAB0() & 1) != 0)
        {
          swift_bridgeObjectRelease();
          return 4;
        }
        else if (a1 == 7367028 && a2 == 0xE300000000000000)
        {
          swift_bridgeObjectRelease();
          return 5;
        }
        else
        {
          v10 = sub_23A4AAAB0();
          swift_bridgeObjectRelease();
          if ((v10 & 1) != 0)
            return 5;
          else
            return 6;
        }
      }
    }
  }
}

uint64_t sub_23A48E358(unsigned __int8 a1)
{
  return ((uint64_t (*)(unint64_t, unint64_t))((char *)sub_23A48E390 + 4 * byte_23A4ACB26[a1]))(0xD000000000000010, 0x800000023A4AF020);
}

uint64_t sub_23A48E390()
{
  return 0x7475626972747461;
}

uint64_t sub_23A48E3B4()
{
  return 0x726F4D6E7261656CLL;
}

uint64_t sub_23A48E3D0()
{
  return 0x6C7974537473696CLL;
}

uint64_t sub_23A48E3F4()
{
  return 0x656D656C70707573;
}

uint64_t sub_23A48E418()
{
  return 7367028;
}

uint64_t sub_23A48E428(uint64_t a1, uint64_t a2)
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
    v3 = sub_23A4AAAB0();
    swift_bridgeObjectRelease();
    v4 = v3 ^ 1;
  }
  return v4 & 1;
}

void sub_23A48E494()
{
  sub_23A4AAAC8();
  OUTLINED_FUNCTION_23_2();
  sub_23A4AAAE0();
  OUTLINED_FUNCTION_10_2();
}

uint64_t sub_23A48E4C4()
{
  return 12383;
}

void sub_23A48E4D0()
{
  sub_23A48E494();
}

uint64_t sub_23A48E4EC()
{
  sub_23A48EFE8();
  return sub_23A4AAB04();
}

uint64_t sub_23A48E514()
{
  sub_23A48EFE8();
  return sub_23A4AAB10();
}

uint64_t sub_23A48E53C()
{
  unsigned __int8 *v0;

  return sub_23A48E358(*v0);
}

uint64_t sub_23A48E544@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_23A48E0D0(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_23A48E568()
{
  sub_23A48EE80();
  return sub_23A4AAB04();
}

uint64_t sub_23A48E590()
{
  sub_23A48EE80();
  return sub_23A4AAB10();
}

uint64_t sub_23A48E5B8()
{
  sub_23A48EFAC();
  return sub_23A4AAB04();
}

uint64_t sub_23A48E5E0()
{
  sub_23A48EFAC();
  return sub_23A4AAB10();
}

uint64_t sub_23A48E608()
{
  sub_23A48EF70();
  return sub_23A4AAB04();
}

uint64_t sub_23A48E630()
{
  sub_23A48EF70();
  return sub_23A4AAB10();
}

uint64_t sub_23A48E658()
{
  sub_23A48EF34();
  return sub_23A4AAB04();
}

uint64_t sub_23A48E680()
{
  sub_23A48EF34();
  return sub_23A4AAB10();
}

uint64_t sub_23A48E6A8()
{
  sub_23A48EEF8();
  return sub_23A4AAB04();
}

uint64_t sub_23A48E6D0()
{
  sub_23A48EEF8();
  return sub_23A4AAB10();
}

void sub_23A48E6F8()
{
  sub_23A4AAAC8();
  OUTLINED_FUNCTION_23_2();
  sub_23A4AAAE0();
  OUTLINED_FUNCTION_10_2();
}

uint64_t sub_23A48E724@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_23A48E428(a1, a2);
  *a3 = result & 1;
  return result;
}

uint64_t sub_23A48E74C()
{
  sub_23A48EEBC();
  return sub_23A4AAB04();
}

uint64_t sub_23A48E774()
{
  sub_23A48EEBC();
  return sub_23A4AAB10();
}

void TellMeGeneratedSnippetModels.encode(to:)(_QWORD *a1)
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
  char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;

  __swift_instantiateConcreteTypeFromMangledName(&qword_256980EA8);
  OUTLINED_FUNCTION_1_5();
  MEMORY[0x24BDAC7A8](v2);
  OUTLINED_FUNCTION_8_2();
  v3 = OUTLINED_FUNCTION_17_3();
  type metadata accessor for TipSnippetModel(v3);
  OUTLINED_FUNCTION_1_5();
  MEMORY[0x24BDAC7A8](v4);
  OUTLINED_FUNCTION_14_6(v5, v25);
  __swift_instantiateConcreteTypeFromMangledName(&qword_256980EB0);
  OUTLINED_FUNCTION_1_5();
  MEMORY[0x24BDAC7A8](v6);
  OUTLINED_FUNCTION_15_1(v7, v26);
  type metadata accessor for SupplementarySnippetModel();
  OUTLINED_FUNCTION_1_5();
  MEMORY[0x24BDAC7A8](v8);
  OUTLINED_FUNCTION_8_2();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256980EB8);
  OUTLINED_FUNCTION_1_5();
  MEMORY[0x24BDAC7A8](v9);
  OUTLINED_FUNCTION_8_2();
  OUTLINED_FUNCTION_17_3();
  type metadata accessor for SummarizedAnswerSnippetModel();
  OUTLINED_FUNCTION_1_5();
  MEMORY[0x24BDAC7A8](v10);
  OUTLINED_FUNCTION_8_2();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256980EC0);
  OUTLINED_FUNCTION_1_5();
  MEMORY[0x24BDAC7A8](v11);
  OUTLINED_FUNCTION_8_2();
  OUTLINED_FUNCTION_17_3();
  type metadata accessor for ListStyleAnswerSnippetModel();
  OUTLINED_FUNCTION_1_5();
  MEMORY[0x24BDAC7A8](v12);
  OUTLINED_FUNCTION_8_2();
  v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_256980EC8);
  OUTLINED_FUNCTION_28_3(v13, (uint64_t)&v29);
  OUTLINED_FUNCTION_1_5();
  MEMORY[0x24BDAC7A8](v14);
  OUTLINED_FUNCTION_8_2();
  OUTLINED_FUNCTION_17_3();
  type metadata accessor for LearnMoreSnippetModel();
  OUTLINED_FUNCTION_1_5();
  MEMORY[0x24BDAC7A8](v15);
  OUTLINED_FUNCTION_8_2();
  v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_256980ED0);
  OUTLINED_FUNCTION_28_3(v16, (uint64_t)&v28);
  OUTLINED_FUNCTION_1_5();
  MEMORY[0x24BDAC7A8](v17);
  OUTLINED_FUNCTION_4();
  type metadata accessor for AttributionListSnippetModel();
  OUTLINED_FUNCTION_1_5();
  MEMORY[0x24BDAC7A8](v18);
  OUTLINED_FUNCTION_4();
  type metadata accessor for TellMeGeneratedSnippetModels();
  OUTLINED_FUNCTION_1_5();
  MEMORY[0x24BDAC7A8](v19);
  OUTLINED_FUNCTION_4();
  v22 = v21 - v20;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256980ED8);
  OUTLINED_FUNCTION_1_5();
  MEMORY[0x24BDAC7A8](v23);
  OUTLINED_FUNCTION_4();
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_23A48EE80();
  sub_23A4AAAF8();
  sub_23A47D2B4(v27, v22);
  v24 = (char *)sub_23A48EAD4 + 4 * byte_23A4ACB2C[swift_getEnumCaseMultiPayload()];
  __asm { BR              X10 }
}

void sub_23A48EAD4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  OUTLINED_FUNCTION_7_5(v1, v2);
  *(_BYTE *)(v3 - 70) = 0;
  sub_23A48EFE8();
  v4 = *(_QWORD *)(v3 - 120);
  sub_23A4AAA5C();
  OUTLINED_FUNCTION_12_5(&qword_256980318, v5, (uint64_t)&protocol conformance descriptor for AttributionListSnippetModel);
  v6 = *(_QWORD *)(v3 - 336);
  OUTLINED_FUNCTION_13_4();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 344) + 8))(v0, v6);
  sub_23A490B9C(v2, (uint64_t (*)(_QWORD))type metadata accessor for AttributionListSnippetModel);
  OUTLINED_FUNCTION_11_8(v4, *(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 128) + 8));
  OUTLINED_FUNCTION_0();
}

uint64_t type metadata accessor for TellMeGeneratedSnippetModels()
{
  uint64_t result;

  result = qword_256981008;
  if (!qword_256981008)
    return swift_getSingletonMetadata();
  return result;
}

unint64_t sub_23A48EE80()
{
  unint64_t result;

  result = qword_256980EE0;
  if (!qword_256980EE0)
  {
    result = MEMORY[0x23B84E2B0](&unk_23A4AD410, &type metadata for TellMeGeneratedSnippetModels.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256980EE0);
  }
  return result;
}

unint64_t sub_23A48EEBC()
{
  unint64_t result;

  result = qword_256980EE8;
  if (!qword_256980EE8)
  {
    result = MEMORY[0x23B84E2B0](&unk_23A4AD3C0, &type metadata for TellMeGeneratedSnippetModels.TipCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256980EE8);
  }
  return result;
}

unint64_t sub_23A48EEF8()
{
  unint64_t result;

  result = qword_256980EF0;
  if (!qword_256980EF0)
  {
    result = MEMORY[0x23B84E2B0](&unk_23A4AD370, &type metadata for TellMeGeneratedSnippetModels.SupplementaryCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256980EF0);
  }
  return result;
}

unint64_t sub_23A48EF34()
{
  unint64_t result;

  result = qword_256980EF8;
  if (!qword_256980EF8)
  {
    result = MEMORY[0x23B84E2B0](&unk_23A4AD320, &type metadata for TellMeGeneratedSnippetModels.SummarizedAnswerCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256980EF8);
  }
  return result;
}

unint64_t sub_23A48EF70()
{
  unint64_t result;

  result = qword_256980F08;
  if (!qword_256980F08)
  {
    result = MEMORY[0x23B84E2B0](&unk_23A4AD2D0, &type metadata for TellMeGeneratedSnippetModels.ListStyleAnswerCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256980F08);
  }
  return result;
}

unint64_t sub_23A48EFAC()
{
  unint64_t result;

  result = qword_256980F18;
  if (!qword_256980F18)
  {
    result = MEMORY[0x23B84E2B0](&unk_23A4AD280, &type metadata for TellMeGeneratedSnippetModels.LearnMoreCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256980F18);
  }
  return result;
}

unint64_t sub_23A48EFE8()
{
  unint64_t result;

  result = qword_256980F28;
  if (!qword_256980F28)
  {
    result = MEMORY[0x23B84E2B0](&unk_23A4AD230, &type metadata for TellMeGeneratedSnippetModels.AttributionListCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256980F28);
  }
  return result;
}

void TellMeGeneratedSnippetModels.init(from:)(_QWORD *a1@<X0>, uint64_t a2@<X8>)
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
  char *v35;
  uint64_t v36;
  uint64_t v37;
  char *v38;
  uint64_t v39;
  uint64_t v40;
  char *v41;
  uint64_t v42;
  uint64_t v43;
  char *v44;
  uint64_t v45;
  char *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  unint64_t v55;
  unint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t *v60;
  uint64_t *v61;
  uint64_t v62;
  uint64_t v63[26];
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  _QWORD *v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;

  v67 = a2;
  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_256980F30);
  v4 = *(_QWORD *)(v3 - 8);
  v63[18] = v3;
  v63[19] = v4;
  OUTLINED_FUNCTION_1_5();
  MEMORY[0x24BDAC7A8](v5);
  OUTLINED_FUNCTION_14_6(v6, v63[0]);
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_256980F38);
  v63[16] = *(_QWORD *)(v7 - 8);
  v63[17] = v7;
  OUTLINED_FUNCTION_1_5();
  MEMORY[0x24BDAC7A8](v8);
  OUTLINED_FUNCTION_8_2();
  v66 = v9;
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_256980F40);
  v63[14] = *(_QWORD *)(v10 - 8);
  v63[15] = v10;
  OUTLINED_FUNCTION_1_5();
  MEMORY[0x24BDAC7A8](v11);
  OUTLINED_FUNCTION_8_2();
  v63[23] = v12;
  v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_256980F48);
  v63[12] = *(_QWORD *)(v13 - 8);
  v63[13] = v13;
  OUTLINED_FUNCTION_1_5();
  MEMORY[0x24BDAC7A8](v14);
  OUTLINED_FUNCTION_8_2();
  v63[22] = v15;
  v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_256980F50);
  OUTLINED_FUNCTION_28_3(v16, (uint64_t)&v72);
  v63[10] = v17;
  OUTLINED_FUNCTION_1_5();
  MEMORY[0x24BDAC7A8](v18);
  OUTLINED_FUNCTION_8_2();
  v63[21] = v19;
  v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_256980F58);
  OUTLINED_FUNCTION_28_3(v20, (uint64_t)&v71);
  v63[8] = v21;
  OUTLINED_FUNCTION_1_5();
  MEMORY[0x24BDAC7A8](v22);
  OUTLINED_FUNCTION_15_1(v23, v63[0]);
  v68 = __swift_instantiateConcreteTypeFromMangledName(&qword_256980F60);
  v65 = *(_QWORD *)(v68 - 8);
  OUTLINED_FUNCTION_1_5();
  MEMORY[0x24BDAC7A8](v24);
  OUTLINED_FUNCTION_4();
  v27 = v26 - v25;
  v64 = type metadata accessor for TellMeGeneratedSnippetModels();
  OUTLINED_FUNCTION_1_5();
  v29 = MEMORY[0x24BDAC7A8](v28);
  v63[7] = (uint64_t)v63 - ((v30 + 15) & 0xFFFFFFFFFFFFFFF0);
  v31 = MEMORY[0x24BDAC7A8](v29);
  v63[25] = (uint64_t)v63 - v32;
  v33 = MEMORY[0x24BDAC7A8](v31);
  v35 = (char *)v63 - v34;
  v36 = MEMORY[0x24BDAC7A8](v33);
  v38 = (char *)v63 - v37;
  v39 = MEMORY[0x24BDAC7A8](v36);
  v41 = (char *)v63 - v40;
  v42 = MEMORY[0x24BDAC7A8](v39);
  v44 = (char *)v63 - v43;
  MEMORY[0x24BDAC7A8](v42);
  v46 = (char *)v63 - v45;
  v47 = a1[3];
  v69 = a1;
  __swift_project_boxed_opaque_existential_1(a1, v47);
  sub_23A48EE80();
  v48 = v70;
  sub_23A4AAAEC();
  if (!v48)
  {
    v63[3] = (uint64_t)v41;
    v63[4] = (uint64_t)v38;
    v63[5] = (uint64_t)v35;
    v63[2] = (uint64_t)v44;
    v63[6] = (uint64_t)v46;
    v49 = v68;
    v70 = v27;
    v50 = sub_23A4AAA50();
    v51 = *(_QWORD *)(v50 + 16);
    if (v51)
    {
      v63[1] = 0;
      v52 = *(unsigned __int8 *)(v50 + 32);
      sub_23A491C34(1, v51, v50, v50 + 32, 0, (2 * v51) | 1);
      v54 = v53;
      v56 = v55;
      swift_bridgeObjectRelease();
      if (v54 == v56 >> 1)
        __asm { BR              X9 }
      v57 = v68;
    }
    else
    {
      v57 = v49;
    }
    v58 = v64;
    v59 = sub_23A4AA954();
    swift_allocError();
    v61 = v60;
    __swift_instantiateConcreteTypeFromMangledName(&qword_256980F68);
    *v61 = v58;
    v62 = v70;
    sub_23A4AAA08();
    sub_23A4AA948();
    (*(void (**)(uint64_t *, _QWORD, uint64_t))(*(_QWORD *)(v59 - 8) + 104))(v61, *MEMORY[0x24BEE26D0], v59);
    swift_willThrow();
    OUTLINED_FUNCTION_6_8();
    (*(void (**)(uint64_t, uint64_t))(v65 + 8))(v62, v57);
  }
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v69);
  OUTLINED_FUNCTION_0();
}

void sub_23A48F508()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  void (*v4)(uint64_t);

  OUTLINED_FUNCTION_30_1();
  OUTLINED_FUNCTION_4_8();
  if (!v0)
  {
    type metadata accessor for LearnMoreSnippetModel();
    sub_23A489544(&qword_256980F80, (uint64_t (*)(uint64_t))type metadata accessor for LearnMoreSnippetModel, (uint64_t)&protocol conformance descriptor for LearnMoreSnippetModel);
    v2 = *(_QWORD *)(v1 - 184);
    OUTLINED_FUNCTION_10_7();
    OUTLINED_FUNCTION_11_8(v2, *(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v1 - 272) + 8));
    swift_unknownObjectRelease();
    v3 = OUTLINED_FUNCTION_22_2();
    v4(v3);
    OUTLINED_FUNCTION_18_5(v1 - 72);
    swift_storeEnumTagMultiPayload();
    JUMPOUT(0x23A48F990);
  }
  swift_unknownObjectRelease();
  OUTLINED_FUNCTION_22_2();
  JUMPOUT(0x23A48F4ECLL);
}

void sub_23A48F5C0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  OUTLINED_FUNCTION_27_2();
  v2 = *(_QWORD *)(v1 - 96);
  OUTLINED_FUNCTION_4_8();
  if (!v0)
  {
    type metadata accessor for ListStyleAnswerSnippetModel();
    sub_23A489544(&qword_256980F78, (uint64_t (*)(uint64_t))type metadata accessor for ListStyleAnswerSnippetModel, (uint64_t)&protocol conformance descriptor for ListStyleAnswerSnippetModel);
    OUTLINED_FUNCTION_24_2();
    OUTLINED_FUNCTION_10_7();
    OUTLINED_FUNCTION_2_11(*(_QWORD *)(v1 - 256));
    swift_unknownObjectRelease();
    OUTLINED_FUNCTION_11_8(v2, *(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v1 - 136) + 8));
    OUTLINED_FUNCTION_18_5(v1 - 64);
    swift_storeEnumTagMultiPayload();
    JUMPOUT(0x23A48F990);
  }
  swift_unknownObjectRelease();
  JUMPOUT(0x23A48F70CLL);
}

void sub_23A48F66C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  OUTLINED_FUNCTION_20_2();
  v2 = *(_QWORD *)(v1 - 96);
  OUTLINED_FUNCTION_4_8();
  if (!v0)
  {
    type metadata accessor for SummarizedAnswerSnippetModel();
    sub_23A489544(&qword_256980F70, (uint64_t (*)(uint64_t))type metadata accessor for SummarizedAnswerSnippetModel, (uint64_t)&protocol conformance descriptor for SummarizedAnswerSnippetModel);
    OUTLINED_FUNCTION_24_2();
    OUTLINED_FUNCTION_10_7();
    OUTLINED_FUNCTION_2_11(*(_QWORD *)(v1 - 240));
    OUTLINED_FUNCTION_6_8();
    OUTLINED_FUNCTION_11_8(v2, *(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v1 - 136) + 8));
    OUTLINED_FUNCTION_18_5(v1 - 56);
    swift_storeEnumTagMultiPayload();
    JUMPOUT(0x23A48F990);
  }
  JUMPOUT(0x23A48F6FCLL);
}

void sub_23A48F714()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_29_1();
  v2 = *(_QWORD *)(v1 - 112);
  v3 = *(_QWORD *)(v1 - 96);
  OUTLINED_FUNCTION_4_8();
  if (v0)
  {
    OUTLINED_FUNCTION_6_8();
    JUMPOUT(0x23A48F4ECLL);
  }
  type metadata accessor for SupplementarySnippetModel();
  sub_23A489544(&qword_256980D08, (uint64_t (*)(uint64_t))type metadata accessor for SupplementarySnippetModel, (uint64_t)&protocol conformance descriptor for SupplementarySnippetModel);
  OUTLINED_FUNCTION_10_7();
  v4 = *(_QWORD *)(v1 - 136);
  OUTLINED_FUNCTION_16_5();
  OUTLINED_FUNCTION_6_8();
  (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v3, v2);
  JUMPOUT(0x23A48F988);
}

unint64_t sub_23A48F9B0()
{
  static TellMeGeneratedSnippetModels.bundleName.getter();
  return 0xD000000000000014;
}

void sub_23A48F9D4(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  TellMeGeneratedSnippetModels.init(from:)(a1, a2);
}

void sub_23A48F9E8(_QWORD *a1)
{
  TellMeGeneratedSnippetModels.encode(to:)(a1);
}

void sub_23A48F9FC(uint64_t a1, uint64_t a2, uint64_t (*a3)(_QWORD))
{
  uint64_t v5;

  v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 32))(a2, a1, v5);
  OUTLINED_FUNCTION_60();
}

void sub_23A48FA3C()
{
  sub_23A489544(&qword_256980F88, (uint64_t (*)(uint64_t))type metadata accessor for TellMeGeneratedSnippetModels, (uint64_t)&protocol conformance descriptor for TellMeGeneratedSnippetModels);
}

void sub_23A48FA68()
{
  sub_23A489544(&qword_256980F90, (uint64_t (*)(uint64_t))type metadata accessor for TellMeGeneratedSnippetModels, (uint64_t)&protocol conformance descriptor for TellMeGeneratedSnippetModels);
}

uint64_t initializeBufferWithCopyOfBuffer for TellMeGeneratedSnippetModels(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v4 & 0x20000) == 0)
  {
    v5 = (char *)&loc_23A48FAEC + 4 * byte_23A4ACB38[swift_getEnumCaseMultiPayload()];
    __asm { BR              X10 }
  }
  v6 = *a2;
  *a1 = *a2;
  v7 = v6 + ((v4 + 16) & ~(unint64_t)v4);
  swift_retain();
  return v7;
}

uint64_t destroy for TellMeGeneratedSnippetModels(uint64_t a1)
{
  uint64_t result;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void (*v8)(uint64_t, uint64_t);
  int *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(uint64_t, uint64_t);
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
  void (*v26)(uint64_t, uint64_t);
  int *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;

  result = swift_getEnumCaseMultiPayload();
  switch((int)result)
  {
    case 0:
      v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569800A0);
      (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
      v4 = type metadata accessor for AttributionListSnippetModel();
      goto LABEL_4;
    case 1:
      v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569800B0);
      (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(a1, v5);
      v4 = type metadata accessor for LearnMoreSnippetModel();
LABEL_4:
      v6 = *(int *)(v4 + 20);
      goto LABEL_9;
    case 2:
      v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569800B0);
      v8 = *(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 8);
      v8(a1, v7);
      v9 = (int *)type metadata accessor for ListStyleAnswerSnippetModel();
      v8(a1 + v9[5], v7);
      v10 = a1 + v9[6];
      v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569800B8);
      (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 8))(v10, v11);
      v8(a1 + v9[7], v7);
      v8(a1 + v9[8], v7);
      v12 = a1 + v9[9];
      v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569800C0);
      (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v13 - 8) + 8))(v12, v13);
      v6 = v9[10];
      goto LABEL_9;
    case 3:
      v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569800B0);
      v15 = *(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 8);
      v15(a1, v14);
      v16 = (int *)type metadata accessor for SummarizedAnswerSnippetModel();
      v15(a1 + v16[5], v14);
      v15(a1 + v16[6], v14);
      v17 = a1 + v16[7];
      v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569800C0);
      (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v18 - 8) + 8))(v17, v18);
      v6 = v16[8];
      goto LABEL_9;
    case 4:
      v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569800C8);
      (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v19 - 8) + 8))(a1, v19);
      v20 = (int *)type metadata accessor for SupplementarySnippetModel();
      v21 = a1 + v20[5];
      v22 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569800C0);
      (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v22 - 8) + 8))(v21, v22);
      v23 = a1 + v20[6];
      v24 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569800D0);
      (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v24 - 8) + 8))(v23, v24);
      v6 = v20[7];
      goto LABEL_9;
    case 5:
      v25 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569800D8);
      v26 = *(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v25 - 8) + 8);
      v26(a1, v25);
      v27 = (int *)type metadata accessor for TipSnippetModel(0);
      v28 = a1 + v27[5];
      v29 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569800E0);
      (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v29 - 8) + 8))(v28, v29);
      v30 = a1 + v27[6];
      v31 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569800E8);
      (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v31 - 8) + 8))(v30, v31);
      v26(a1 + v27[7], v25);
      v32 = a1 + v27[8];
      v33 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569800F0);
      (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v33 - 8) + 8))(v32, v33);
      v6 = v27[9];
LABEL_9:
      v34 = a1 + v6;
      v35 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569800A8);
      result = (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v35 - 8) + 8))(v34, v35);
      break;
    default:
      return result;
  }
  return result;
}

void initializeWithCopy for TellMeGeneratedSnippetModels()
{
  char *v0;

  v0 = (char *)sub_23A490380 + 4 * byte_23A4ACB44[swift_getEnumCaseMultiPayload()];
  __asm { BR              X10 }
}

uint64_t sub_23A490380()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569800A0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 16))(v0, v1, v2);
  v3 = *(int *)(type metadata accessor for AttributionListSnippetModel() + 20);
  v4 = v0 + v3;
  v5 = v1 + v3;
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569800A8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(v4, v5, v6);
  swift_storeEnumTagMultiPayload();
  return v0;
}

uint64_t assignWithCopy for TellMeGeneratedSnippetModels(uint64_t result, uint64_t a2)
{
  char *v2;

  if (result != a2)
  {
    sub_23A490B9C(result, (uint64_t (*)(_QWORD))type metadata accessor for TellMeGeneratedSnippetModels);
    v2 = (char *)&loc_23A4907C4 + 4 * byte_23A4ACB4A[swift_getEnumCaseMultiPayload()];
    __asm { BR              X10 }
  }
  return result;
}

void sub_23A490B9C(uint64_t a1, uint64_t (*a2)(_QWORD))
{
  uint64_t v3;

  v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  OUTLINED_FUNCTION_60();
}

void initializeWithTake for TellMeGeneratedSnippetModels()
{
  char *v0;

  v0 = (char *)sub_23A490C28 + 4 * byte_23A4ACB50[swift_getEnumCaseMultiPayload()];
  __asm { BR              X10 }
}

uint64_t sub_23A490C28()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569800A0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 32))(v0, v1, v2);
  v3 = *(int *)(type metadata accessor for AttributionListSnippetModel() + 20);
  v4 = v0 + v3;
  v5 = v1 + v3;
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569800A8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 32))(v4, v5, v6);
  swift_storeEnumTagMultiPayload();
  return v0;
}

uint64_t assignWithTake for TellMeGeneratedSnippetModels(uint64_t result, uint64_t a2)
{
  char *v2;

  if (result != a2)
  {
    sub_23A490B9C(result, (uint64_t (*)(_QWORD))type metadata accessor for TellMeGeneratedSnippetModels);
    v2 = (char *)&loc_23A49106C + 4 * byte_23A4ACB56[swift_getEnumCaseMultiPayload()];
    __asm { BR              X10 }
  }
  return result;
}

uint64_t sub_23A491444()
{
  uint64_t result;
  unint64_t v1;
  unint64_t v2;
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;

  result = type metadata accessor for AttributionListSnippetModel();
  if (v1 <= 0x3F)
  {
    result = type metadata accessor for LearnMoreSnippetModel();
    if (v2 <= 0x3F)
    {
      result = type metadata accessor for ListStyleAnswerSnippetModel();
      if (v3 <= 0x3F)
      {
        result = type metadata accessor for SummarizedAnswerSnippetModel();
        if (v4 <= 0x3F)
        {
          result = type metadata accessor for SupplementarySnippetModel();
          if (v5 <= 0x3F)
          {
            result = type metadata accessor for TipSnippetModel(319);
            if (v6 <= 0x3F)
            {
              swift_initEnumMetadataMultiPayload();
              return 0;
            }
          }
        }
      }
    }
  }
  return result;
}

uint64_t storeEnumTagSinglePayload for TellMeGeneratedSnippetModels.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_23A491580 + 4 * byte_23A4ACB61[v4]))();
  *a1 = a2 + 5;
  return ((uint64_t (*)(void))((char *)sub_23A4915B4 + 4 * byte_23A4ACB5C[v4]))();
}

uint64_t sub_23A4915B4(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_23A4915BC(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x23A4915C4);
  return result;
}

uint64_t sub_23A4915D0(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x23A4915D8);
  *(_BYTE *)result = a2 + 5;
  return result;
}

uint64_t sub_23A4915DC(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23A4915E4(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for TellMeGeneratedSnippetModels.CodingKeys()
{
  return &type metadata for TellMeGeneratedSnippetModels.CodingKeys;
}

ValueMetadata *type metadata accessor for TellMeGeneratedSnippetModels.AttributionListCodingKeys()
{
  return &type metadata for TellMeGeneratedSnippetModels.AttributionListCodingKeys;
}

ValueMetadata *type metadata accessor for TellMeGeneratedSnippetModels.LearnMoreCodingKeys()
{
  return &type metadata for TellMeGeneratedSnippetModels.LearnMoreCodingKeys;
}

ValueMetadata *type metadata accessor for TellMeGeneratedSnippetModels.ListStyleAnswerCodingKeys()
{
  return &type metadata for TellMeGeneratedSnippetModels.ListStyleAnswerCodingKeys;
}

ValueMetadata *type metadata accessor for TellMeGeneratedSnippetModels.SummarizedAnswerCodingKeys()
{
  return &type metadata for TellMeGeneratedSnippetModels.SummarizedAnswerCodingKeys;
}

ValueMetadata *type metadata accessor for TellMeGeneratedSnippetModels.SupplementaryCodingKeys()
{
  return &type metadata for TellMeGeneratedSnippetModels.SupplementaryCodingKeys;
}

uint64_t _s19DeviceExpertIntents28TellMeGeneratedSnippetModelsO25AttributionListCodingKeysOwst_0(uint64_t a1, int a2, int a3)
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
    return ((uint64_t (*)(void))((char *)sub_23A491694 + 4 * byte_23A4ACB66[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_23A4916B4 + 4 * byte_23A4ACB6B[v4]))();
}

_BYTE *sub_23A491694(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_23A4916B4(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_23A4916BC(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_23A4916C4(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_23A4916CC(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_23A4916D4(_DWORD *result)
{
  *result = 0;
  return result;
}

ValueMetadata *type metadata accessor for TellMeGeneratedSnippetModels.TipCodingKeys()
{
  return &type metadata for TellMeGeneratedSnippetModels.TipCodingKeys;
}

unint64_t sub_23A4916F4()
{
  unint64_t result;

  result = qword_256981040;
  if (!qword_256981040)
  {
    result = MEMORY[0x23B84E2B0](&unk_23A4ACDB8, &type metadata for TellMeGeneratedSnippetModels.TipCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256981040);
  }
  return result;
}

unint64_t sub_23A491734()
{
  unint64_t result;

  result = qword_256981048;
  if (!qword_256981048)
  {
    result = MEMORY[0x23B84E2B0](&unk_23A4ACE70, &type metadata for TellMeGeneratedSnippetModels.SupplementaryCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256981048);
  }
  return result;
}

unint64_t sub_23A491774()
{
  unint64_t result;

  result = qword_256981050;
  if (!qword_256981050)
  {
    result = MEMORY[0x23B84E2B0](&unk_23A4ACF28, &type metadata for TellMeGeneratedSnippetModels.SummarizedAnswerCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256981050);
  }
  return result;
}

unint64_t sub_23A4917B4()
{
  unint64_t result;

  result = qword_256981058;
  if (!qword_256981058)
  {
    result = MEMORY[0x23B84E2B0](&unk_23A4ACFE0, &type metadata for TellMeGeneratedSnippetModels.ListStyleAnswerCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256981058);
  }
  return result;
}

unint64_t sub_23A4917F4()
{
  unint64_t result;

  result = qword_256981060;
  if (!qword_256981060)
  {
    result = MEMORY[0x23B84E2B0](&unk_23A4AD098, &type metadata for TellMeGeneratedSnippetModels.LearnMoreCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256981060);
  }
  return result;
}

unint64_t sub_23A491834()
{
  unint64_t result;

  result = qword_256981068;
  if (!qword_256981068)
  {
    result = MEMORY[0x23B84E2B0](&unk_23A4AD150, &type metadata for TellMeGeneratedSnippetModels.AttributionListCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256981068);
  }
  return result;
}

unint64_t sub_23A491874()
{
  unint64_t result;

  result = qword_256981070;
  if (!qword_256981070)
  {
    result = MEMORY[0x23B84E2B0](&unk_23A4AD208, &type metadata for TellMeGeneratedSnippetModels.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256981070);
  }
  return result;
}

unint64_t sub_23A4918B4()
{
  unint64_t result;

  result = qword_256981078;
  if (!qword_256981078)
  {
    result = MEMORY[0x23B84E2B0](&unk_23A4AD0C0, &type metadata for TellMeGeneratedSnippetModels.AttributionListCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256981078);
  }
  return result;
}

unint64_t sub_23A4918F4()
{
  unint64_t result;

  result = qword_256981080;
  if (!qword_256981080)
  {
    result = MEMORY[0x23B84E2B0](&unk_23A4AD0E8, &type metadata for TellMeGeneratedSnippetModels.AttributionListCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256981080);
  }
  return result;
}

unint64_t sub_23A491934()
{
  unint64_t result;

  result = qword_256981088;
  if (!qword_256981088)
  {
    result = MEMORY[0x23B84E2B0](&unk_23A4AD008, &type metadata for TellMeGeneratedSnippetModels.LearnMoreCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256981088);
  }
  return result;
}

unint64_t sub_23A491974()
{
  unint64_t result;

  result = qword_256981090;
  if (!qword_256981090)
  {
    result = MEMORY[0x23B84E2B0](&unk_23A4AD030, &type metadata for TellMeGeneratedSnippetModels.LearnMoreCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256981090);
  }
  return result;
}

unint64_t sub_23A4919B4()
{
  unint64_t result;

  result = qword_256981098;
  if (!qword_256981098)
  {
    result = MEMORY[0x23B84E2B0](&unk_23A4ACF50, &type metadata for TellMeGeneratedSnippetModels.ListStyleAnswerCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256981098);
  }
  return result;
}

unint64_t sub_23A4919F4()
{
  unint64_t result;

  result = qword_2569810A0;
  if (!qword_2569810A0)
  {
    result = MEMORY[0x23B84E2B0](&unk_23A4ACF78, &type metadata for TellMeGeneratedSnippetModels.ListStyleAnswerCodingKeys);
    atomic_store(result, (unint64_t *)&qword_2569810A0);
  }
  return result;
}

unint64_t sub_23A491A34()
{
  unint64_t result;

  result = qword_2569810A8;
  if (!qword_2569810A8)
  {
    result = MEMORY[0x23B84E2B0](&unk_23A4ACE98, &type metadata for TellMeGeneratedSnippetModels.SummarizedAnswerCodingKeys);
    atomic_store(result, (unint64_t *)&qword_2569810A8);
  }
  return result;
}

unint64_t sub_23A491A74()
{
  unint64_t result;

  result = qword_2569810B0;
  if (!qword_2569810B0)
  {
    result = MEMORY[0x23B84E2B0](&unk_23A4ACEC0, &type metadata for TellMeGeneratedSnippetModels.SummarizedAnswerCodingKeys);
    atomic_store(result, (unint64_t *)&qword_2569810B0);
  }
  return result;
}

unint64_t sub_23A491AB4()
{
  unint64_t result;

  result = qword_2569810B8;
  if (!qword_2569810B8)
  {
    result = MEMORY[0x23B84E2B0](&unk_23A4ACDE0, &type metadata for TellMeGeneratedSnippetModels.SupplementaryCodingKeys);
    atomic_store(result, (unint64_t *)&qword_2569810B8);
  }
  return result;
}

unint64_t sub_23A491AF4()
{
  unint64_t result;

  result = qword_2569810C0;
  if (!qword_2569810C0)
  {
    result = MEMORY[0x23B84E2B0](&unk_23A4ACE08, &type metadata for TellMeGeneratedSnippetModels.SupplementaryCodingKeys);
    atomic_store(result, (unint64_t *)&qword_2569810C0);
  }
  return result;
}

unint64_t sub_23A491B34()
{
  unint64_t result;

  result = qword_2569810C8;
  if (!qword_2569810C8)
  {
    result = MEMORY[0x23B84E2B0](&unk_23A4ACD28, &type metadata for TellMeGeneratedSnippetModels.TipCodingKeys);
    atomic_store(result, (unint64_t *)&qword_2569810C8);
  }
  return result;
}

unint64_t sub_23A491B74()
{
  unint64_t result;

  result = qword_2569810D0;
  if (!qword_2569810D0)
  {
    result = MEMORY[0x23B84E2B0](&unk_23A4ACD50, &type metadata for TellMeGeneratedSnippetModels.TipCodingKeys);
    atomic_store(result, (unint64_t *)&qword_2569810D0);
  }
  return result;
}

unint64_t sub_23A491BB4()
{
  unint64_t result;

  result = qword_2569810D8;
  if (!qword_2569810D8)
  {
    result = MEMORY[0x23B84E2B0](&unk_23A4AD178, &type metadata for TellMeGeneratedSnippetModels.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2569810D8);
  }
  return result;
}

unint64_t sub_23A491BF4()
{
  unint64_t result;

  result = qword_2569810E0;
  if (!qword_2569810E0)
  {
    result = MEMORY[0x23B84E2B0](&unk_23A4AD1A0, &type metadata for TellMeGeneratedSnippetModels.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2569810E0);
  }
  return result;
}

uint64_t sub_23A491C34(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, unint64_t a6)
{
  if (result < a5)
  {
    __break(1u);
LABEL_10:
    __break(1u);
    goto LABEL_11;
  }
  if ((uint64_t)(a6 >> 1) < result || (uint64_t)(a6 >> 1) < a2)
    goto LABEL_10;
  if (a2 < a5)
  {
LABEL_11:
    __break(1u);
    goto LABEL_12;
  }
  if ((a2 & 0x8000000000000000) == 0)
    return swift_unknownObjectRetain();
LABEL_12:
  __break(1u);
  return result;
}

uint64_t OUTLINED_FUNCTION_2_11@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(a1 + 8))(v1, v2);
}

uint64_t OUTLINED_FUNCTION_3_9()
{
  return sub_23A4AAA5C();
}

uint64_t OUTLINED_FUNCTION_4_8()
{
  return sub_23A4AA9FC();
}

uint64_t OUTLINED_FUNCTION_6_8()
{
  return swift_unknownObjectRelease();
}

void OUTLINED_FUNCTION_7_5(uint64_t a1, uint64_t a2)
{
  uint64_t (*v2)(_QWORD);

  sub_23A48F9FC(a1, a2, v2);
}

uint64_t OUTLINED_FUNCTION_8_7@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(a1 + 8))(v2, v1);
}

uint64_t OUTLINED_FUNCTION_10_7()
{
  return sub_23A4AAA44();
}

uint64_t OUTLINED_FUNCTION_11_8@<X0>(uint64_t a1@<X0>, uint64_t (*a2)(uint64_t, uint64_t)@<X8>)
{
  uint64_t v2;

  return a2(a1, v2);
}

void OUTLINED_FUNCTION_12_5(unint64_t *a1, uint64_t a2, uint64_t a3)
{
  uint64_t (*v3)(uint64_t);

  sub_23A489544(a1, v3, a3);
}

uint64_t OUTLINED_FUNCTION_13_4()
{
  return sub_23A4AAA98();
}

void OUTLINED_FUNCTION_14_6(uint64_t a1@<X8>, uint64_t a2)
{
  uint64_t v2;

  *(_QWORD *)(v2 - 160) = (char *)&a2 - ((a1 + 15) & 0xFFFFFFFFFFFFFFF0);
}

void OUTLINED_FUNCTION_15_1(uint64_t a1@<X8>, uint64_t a2)
{
  uint64_t v2;

  *(_QWORD *)(v2 - 192) = (char *)&a2 - ((a1 + 15) & 0xFFFFFFFFFFFFFFF0);
}

uint64_t OUTLINED_FUNCTION_16_5()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 224) + 8))(v1, v0);
}

uint64_t OUTLINED_FUNCTION_17_3()
{
  return 0;
}

uint64_t OUTLINED_FUNCTION_18_5@<X0>(uint64_t a1@<X8>)
{
  return *(_QWORD *)(a1 - 256);
}

unint64_t OUTLINED_FUNCTION_20_2()
{
  uint64_t v0;

  *(_BYTE *)(v0 - 67) = 3;
  return sub_23A48EF34();
}

uint64_t OUTLINED_FUNCTION_21_4()
{
  uint64_t v0;

  return v0;
}

uint64_t OUTLINED_FUNCTION_22_2()
{
  uint64_t v0;

  return v0;
}

uint64_t OUTLINED_FUNCTION_23_2()
{
  return sub_23A4AAAD4();
}

unint64_t OUTLINED_FUNCTION_26_3()
{
  uint64_t v0;

  *(_BYTE *)(v0 - 65) = 5;
  return sub_23A48EEBC();
}

unint64_t OUTLINED_FUNCTION_27_2()
{
  uint64_t v0;

  *(_BYTE *)(v0 - 68) = 2;
  return sub_23A48EF70();
}

uint64_t OUTLINED_FUNCTION_28_3@<X0>(uint64_t result@<X0>, uint64_t a2@<X8>)
{
  *(_QWORD *)(a2 - 256) = result;
  return result;
}

unint64_t OUTLINED_FUNCTION_29_1()
{
  uint64_t v0;

  *(_BYTE *)(v0 - 66) = 4;
  return sub_23A48EEF8();
}

unint64_t OUTLINED_FUNCTION_30_1()
{
  uint64_t v0;

  *(_BYTE *)(v0 - 69) = 1;
  return sub_23A48EFAC();
}

void LinkUsedEvent.name.getter()
{
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_60();
}

void LinkUsedEvent.sessionIdentifier.getter()
{
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_60();
}

void LinkUsedEvent.clusterIdentifier.getter()
{
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_60();
}

uint64_t LinkUsedEvent.linkUsed.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;

  v3 = v1 + *(int *)(type metadata accessor for LinkUsedEvent(0) + 28);
  return sub_23A491EC8(v3, a1);
}

uint64_t type metadata accessor for LinkUsedEvent(uint64_t a1)
{
  return sub_23A47F74C(a1, qword_256981140);
}

uint64_t sub_23A491EC8(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for LinkUsedEvent.LinkType(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t type metadata accessor for LinkUsedEvent.LinkType(uint64_t a1)
{
  return sub_23A47F74C(a1, qword_2569811F0);
}

void __swiftcall LinkUsedEvent.AppIntentConfiguration.init(bundleID:name:param:)(DeviceExpertIntents::LinkUsedEvent::AppIntentConfiguration *__return_ptr retstr, Swift::String bundleID, Swift::String name, Swift::String_optional param)
{
  retstr->bundleID = bundleID;
  retstr->name = name;
  retstr->param = param;
}

uint64_t LinkUsedEvent.init(sessionIdentifier:clusterIdentifier:linkUsed:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, _QWORD *a6@<X8>)
{
  uint64_t v7;

  *a6 = 0xD000000000000016;
  a6[1] = 0x800000023A4AF040;
  a6[2] = a1;
  a6[3] = a2;
  a6[4] = a3;
  a6[5] = a4;
  v7 = (uint64_t)a6 + *(int *)(type metadata accessor for LinkUsedEvent(0) + 28);
  return sub_23A491F88(a5, v7);
}

uint64_t sub_23A491F88(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for LinkUsedEvent.LinkType(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t LinkUsedEvent.dictionaryRepresentation.getter()
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
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v18;
  uint64_t v19;

  v1 = v0;
  v2 = sub_23A4A9F40();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v18 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = OUTLINED_FUNCTION_5_8();
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)&v18 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23A48C69C();
  sub_23A4AA774();
  v9 = sub_23A4AA7BC();
  OUTLINED_FUNCTION_2_9();
  OUTLINED_FUNCTION_0_13();
  sub_23A4923F4(v9, 0x5F72657473756C63, 0xEA00000000006469);
  v10 = v18;
  v19 = v18;
  OUTLINED_FUNCTION_1_9();
  v11 = type metadata accessor for LinkUsedEvent(0);
  sub_23A491EC8(v1 + *(int *)(v11 + 28), (uint64_t)v8);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    (*(void (**)(char *, char *, uint64_t))(v3 + 32))(v5, v8, v2);
    sub_23A4A9F10();
    v12 = sub_23A4AA7BC();
    swift_bridgeObjectRelease();
    OUTLINED_FUNCTION_2_9();
    OUTLINED_FUNCTION_0_13();
    sub_23A4923F4(v12, 0x7475626972747461, 0xEF6B6E694C6E6F69);
    v19 = v18;
    OUTLINED_FUNCTION_1_9();
    (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  }
  else
  {
    v13 = *((_QWORD *)v8 + 5);
    v14 = sub_23A4AA7BC();
    OUTLINED_FUNCTION_2_9();
    v18 = v10;
    sub_23A4923F4(v14, 0xD000000000000010, 0x800000023A4AF060);
    OUTLINED_FUNCTION_1_9();
    v15 = sub_23A4AA7BC();
    OUTLINED_FUNCTION_2_9();
    OUTLINED_FUNCTION_0_13();
    sub_23A4923F4(v15, 0x6E5F746E65746E69, 0xEB00000000656D61);
    v19 = v18;
    OUTLINED_FUNCTION_1_9();
    if (v13)
    {
      swift_bridgeObjectRetain();
      v16 = sub_23A4AA7BC();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      OUTLINED_FUNCTION_2_9();
      OUTLINED_FUNCTION_0_13();
      sub_23A4923F4(v16, 0x705F746E65746E69, 0xEC0000006D617261);
      v19 = v18;
      OUTLINED_FUNCTION_1_9();
    }
    else
    {
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();

    }
  }
  return v19;
}

uint64_t sub_23A4922EC(uint64_t a1, uint64_t a2)
{
  uint64_t *v2;
  uint64_t *v3;
  unint64_t v6;
  char v7;
  uint64_t v8;
  uint64_t v10;

  v3 = v2;
  swift_bridgeObjectRetain();
  v6 = sub_23A47C4F0(a1, a2);
  LOBYTE(a2) = v7;
  swift_bridgeObjectRelease();
  if ((a2 & 1) == 0)
    return 0;
  swift_isUniquelyReferenced_nonNull_native();
  v10 = *v3;
  *v3 = 0x8000000000000000;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256981228);
  sub_23A4AA9A8();
  swift_bridgeObjectRelease();
  v8 = *(_QWORD *)(*(_QWORD *)(v10 + 56) + 8 * v6);
  sub_23A48C69C();
  sub_23A4AA9B4();
  *v3 = v10;
  swift_bridgeObjectRelease();
  return v8;
}

void sub_23A4923F4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _QWORD *v3;
  _QWORD **v4;
  _QWORD *v8;
  unint64_t v9;
  char v10;
  unint64_t v11;
  char v12;
  unint64_t v13;
  char v14;
  _QWORD *v15;
  uint64_t v16;

  v4 = (_QWORD **)v3;
  v8 = (_QWORD *)*v3;
  v9 = sub_23A47C4F0(a2, a3);
  if (__OFADD__(v8[2], (v10 & 1) == 0))
  {
    __break(1u);
    goto LABEL_9;
  }
  v11 = v9;
  v12 = v10;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256981228);
  if ((sub_23A4AA9A8() & 1) == 0)
    goto LABEL_5;
  v13 = sub_23A47C4F0(a2, a3);
  if ((v12 & 1) != (v14 & 1))
  {
LABEL_9:
    sub_23A4AAABC();
    __break(1u);
    return;
  }
  v11 = v13;
LABEL_5:
  v15 = *v4;
  if ((v12 & 1) != 0)
  {
    v16 = v15[7];

    *(_QWORD *)(v16 + 8 * v11) = a1;
  }
  else
  {
    sub_23A4932B4(v11, a2, a3, a1, v15);
    swift_bridgeObjectRetain();
  }
}

uint64_t *initializeBufferWithCopyOfBuffer for LinkUsedEvent(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t *v3;
  int v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  _QWORD *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  v3 = a1;
  v4 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v4 & 0x20000) != 0)
  {
    v12 = *a2;
    *v3 = *a2;
    v3 = (uint64_t *)(v12 + ((v4 + 16) & ~(unint64_t)v4));
    swift_retain();
  }
  else
  {
    v5 = a2[1];
    *a1 = *a2;
    a1[1] = v5;
    v6 = a2[3];
    a1[2] = a2[2];
    a1[3] = v6;
    v7 = a2[5];
    v8 = *(int *)(a3 + 28);
    v9 = (uint64_t *)((char *)a2 + v8);
    v10 = (uint64_t *)((char *)a1 + v8);
    a1[4] = a2[4];
    a1[5] = v7;
    type metadata accessor for LinkUsedEvent.LinkType(0);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v11 = sub_23A4A9F40();
      (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v11 - 8) + 16))(v10, v9, v11);
    }
    else
    {
      v13 = v9[1];
      *v10 = *v9;
      v10[1] = v13;
      v14 = v9[3];
      v10[2] = v9[2];
      v10[3] = v14;
      v15 = v9[4];
      v16 = v9[5];
      v10[4] = v15;
      v10[5] = v16;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
    }
    swift_storeEnumTagMultiPayload();
  }
  return v3;
}

uint64_t destroy for LinkUsedEvent(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v4 = a1 + *(int *)(a2 + 28);
  type metadata accessor for LinkUsedEvent.LinkType(0);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v5 = sub_23A4A9F40();
    return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(v4, v5);
  }
  else
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
}

_QWORD *initializeWithCopy for LinkUsedEvent(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  _QWORD *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  v5 = a2[3];
  a1[2] = a2[2];
  a1[3] = v5;
  v6 = a2[5];
  v7 = *(int *)(a3 + 28);
  v8 = (_QWORD *)((char *)a2 + v7);
  v9 = (_QWORD *)((char *)a1 + v7);
  a1[4] = a2[4];
  a1[5] = v6;
  type metadata accessor for LinkUsedEvent.LinkType(0);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v10 = sub_23A4A9F40();
    (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v10 - 8) + 16))(v9, v8, v10);
  }
  else
  {
    v11 = v8[1];
    *v9 = *v8;
    v9[1] = v11;
    v12 = v8[3];
    v9[2] = v8[2];
    v9[3] = v12;
    v13 = v8[4];
    v14 = v8[5];
    v9[4] = v13;
    v9[5] = v14;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
  swift_storeEnumTagMultiPayload();
  return a1;
}

_QWORD *assignWithCopy for LinkUsedEvent(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v6;
  _QWORD *v7;
  _QWORD *v8;
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
  if (a1 != a2)
  {
    v6 = *(int *)(a3 + 28);
    v7 = (_QWORD *)((char *)a1 + v6);
    v8 = (_QWORD *)((char *)a2 + v6);
    sub_23A492910((uint64_t)a1 + v6);
    type metadata accessor for LinkUsedEvent.LinkType(0);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v9 = sub_23A4A9F40();
      (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v9 - 8) + 16))(v7, v8, v9);
    }
    else
    {
      *v7 = *v8;
      v7[1] = v8[1];
      v7[2] = v8[2];
      v7[3] = v8[3];
      v7[4] = v8[4];
      v7[5] = v8[5];
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
    }
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

uint64_t sub_23A492910(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata accessor for LinkUsedEvent.LinkType(0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

_OWORD *initializeWithTake for LinkUsedEvent(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  __int128 v4;
  uint64_t v5;
  char *v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;

  v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  a1[2] = a2[2];
  v5 = *(int *)(a3 + 28);
  v6 = (char *)a1 + v5;
  v7 = (char *)a2 + v5;
  v8 = type metadata accessor for LinkUsedEvent.LinkType(0);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v9 = sub_23A4A9F40();
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v9 - 8) + 32))(v6, v7, v9);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(v6, v7, *(_QWORD *)(*(_QWORD *)(v8 - 8) + 64));
  }
  return a1;
}

_QWORD *assignWithTake for LinkUsedEvent(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;

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
  if (a1 != a2)
  {
    v9 = *(int *)(a3 + 28);
    v10 = (char *)a1 + v9;
    v11 = (char *)a2 + v9;
    sub_23A492910((uint64_t)a1 + v9);
    v12 = type metadata accessor for LinkUsedEvent.LinkType(0);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v13 = sub_23A4A9F40();
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v13 - 8) + 32))(v10, v11, v13);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(v10, v11, *(_QWORD *)(*(_QWORD *)(v12 - 8) + 64));
    }
  }
  return a1;
}

uint64_t getEnumTagSinglePayload for LinkUsedEvent()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_23A492AE8(uint64_t a1, uint64_t a2, uint64_t a3)
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
    v8 = OUTLINED_FUNCTION_5_8();
    return __swift_getEnumTagSinglePayload(a1 + *(int *)(a3 + 28), a2, v8);
  }
}

uint64_t storeEnumTagSinglePayload for LinkUsedEvent()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_23A492B64(uint64_t result, uint64_t a2, int a3, uint64_t a4)
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
    v7 = OUTLINED_FUNCTION_5_8();
    return __swift_storeEnumTagSinglePayload(v5 + *(int *)(a4 + 28), a2, a2, v7);
  }
  return result;
}

uint64_t sub_23A492BCC()
{
  uint64_t result;
  unint64_t v1;

  result = type metadata accessor for LinkUsedEvent.LinkType(319);
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t *initializeBufferWithCopyOfBuffer for LinkUsedEvent.LinkType(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

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
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v6 = sub_23A4A9F40();
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(a1, a2, v6);
    }
    else
    {
      v8 = a2[1];
      *a1 = *a2;
      a1[1] = v8;
      v9 = a2[3];
      a1[2] = a2[2];
      a1[3] = v9;
      v10 = a2[4];
      v11 = a2[5];
      a1[4] = v10;
      a1[5] = v11;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
    }
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

uint64_t destroy for LinkUsedEvent.LinkType(uint64_t a1)
{
  uint64_t v2;

  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v2 = sub_23A4A9F40();
    return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  }
  else
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
}

_QWORD *initializeWithCopy for LinkUsedEvent.LinkType(_QWORD *a1, _QWORD *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v4 = sub_23A4A9F40();
    (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a1, a2, v4);
  }
  else
  {
    v5 = a2[1];
    *a1 = *a2;
    a1[1] = v5;
    v6 = a2[3];
    a1[2] = a2[2];
    a1[3] = v6;
    v7 = a2[4];
    v8 = a2[5];
    a1[4] = v7;
    a1[5] = v8;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
  swift_storeEnumTagMultiPayload();
  return a1;
}

_QWORD *assignWithCopy for LinkUsedEvent.LinkType(_QWORD *a1, _QWORD *a2)
{
  uint64_t v4;

  if (a1 != a2)
  {
    sub_23A492910((uint64_t)a1);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v4 = sub_23A4A9F40();
      (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a1, a2, v4);
    }
    else
    {
      *a1 = *a2;
      a1[1] = a2[1];
      a1[2] = a2[2];
      a1[3] = a2[3];
      a1[4] = a2[4];
      a1[5] = a2[5];
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
    }
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

void *initializeWithTake for LinkUsedEvent.LinkType(void *a1, const void *a2, uint64_t a3)
{
  uint64_t v6;

  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v6 = sub_23A4A9F40();
    (*(void (**)(void *, const void *, uint64_t))(*(_QWORD *)(v6 - 8) + 32))(a1, a2, v6);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64));
  }
  return a1;
}

void *assignWithTake for LinkUsedEvent.LinkType(void *a1, const void *a2, uint64_t a3)
{
  uint64_t v6;

  if (a1 != a2)
  {
    sub_23A492910((uint64_t)a1);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v6 = sub_23A4A9F40();
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

uint64_t sub_23A493030()
{
  uint64_t result;
  unint64_t v1;

  result = sub_23A4A9F40();
  if (v1 <= 0x3F)
  {
    swift_initEnumMetadataMultiPayload();
    return 0;
  }
  return result;
}

uint64_t destroy for LinkUsedEvent.AppIntentConfiguration()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

_QWORD *initializeWithCopy for LinkUsedEvent.AppIntentConfiguration(_QWORD *a1, _QWORD *a2)
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

_QWORD *assignWithCopy for LinkUsedEvent.AppIntentConfiguration(_QWORD *a1, _QWORD *a2)
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

_QWORD *assignWithTake for LinkUsedEvent.AppIntentConfiguration(_QWORD *a1, _QWORD *a2)
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

uint64_t getEnumTagSinglePayload for LinkUsedEvent.AppIntentConfiguration(uint64_t a1, int a2)
{
  unint64_t v2;

  if (a2)
  {
    if (a2 < 0 && *(_BYTE *)(a1 + 48))
    {
      LODWORD(v2) = *(_DWORD *)a1 + 0x7FFFFFFF;
    }
    else
    {
      v2 = *(_QWORD *)(a1 + 8);
      if (v2 >= 0xFFFFFFFF)
        LODWORD(v2) = -1;
    }
  }
  else
  {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for LinkUsedEvent.AppIntentConfiguration(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for LinkUsedEvent.AppIntentConfiguration()
{
  return &type metadata for LinkUsedEvent.AppIntentConfiguration;
}

unint64_t sub_23A4932B4(unint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, _QWORD *a5)
{
  _QWORD *v5;
  uint64_t v6;
  BOOL v7;
  uint64_t v8;

  a5[(result >> 6) + 8] |= 1 << result;
  v5 = (_QWORD *)(a5[6] + 16 * result);
  *v5 = a2;
  v5[1] = a3;
  *(_QWORD *)(a5[7] + 8 * result) = a4;
  v6 = a5[2];
  v7 = __OFADD__(v6, 1);
  v8 = v6 + 1;
  if (v7)
    __break(1u);
  else
    a5[2] = v8;
  return result;
}

void OUTLINED_FUNCTION_0_13()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(v1 - 80) = v0;
}

uint64_t OUTLINED_FUNCTION_5_8()
{
  return type metadata accessor for LinkUsedEvent.LinkType(0);
}

uint64_t sub_23A493314(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 8))();
}

uint64_t sub_23A49331C(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t *v4;
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
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  unint64_t v19;
  _QWORD v21[2];
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void (*v25)(char *, uint64_t, uint64_t);
  uint64_t v26;
  uint64_t v27;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_256981300);
  MEMORY[0x24BDAC7A8](v2);
  v4 = (_QWORD *)((char *)v21 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0));
  v5 = type metadata accessor for AttributionItem();
  v24 = *(_QWORD *)(v5 - 8);
  v6 = MEMORY[0x24BDAC7A8](v5);
  v27 = (uint64_t)v21 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v6);
  v23 = (uint64_t)v21 - v8;
  v9 = sub_23A4AA024();
  v10 = *(_QWORD *)(v9 - 8);
  MEMORY[0x24BDAC7A8](v9);
  v12 = (char *)v21 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = *(_QWORD *)(a1 + 16);
  if (!v13)
    return MEMORY[0x24BEE4AF8];
  v14 = a1 + ((*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80));
  v15 = *(_QWORD *)(v10 + 72);
  v25 = *(void (**)(char *, uint64_t, uint64_t))(v10 + 16);
  v26 = v15;
  swift_retain();
  v21[1] = a1;
  swift_bridgeObjectRetain();
  v16 = MEMORY[0x24BEE4AF8];
  v22 = v5;
  do
  {
    v25(v12, v14, v9);
    sub_23A493598(v4);
    (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
    if (__swift_getEnumTagSinglePayload((uint64_t)v4, 1, v5) == 1)
    {
      sub_23A48762C((uint64_t)v4, &qword_256981300);
    }
    else
    {
      v17 = v23;
      sub_23A4857B8((uint64_t)v4, v23);
      sub_23A4857B8(v17, v27);
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        v16 = OUTLINED_FUNCTION_0_14(0, *(_QWORD *)(v16 + 16) + 1);
      v19 = *(_QWORD *)(v16 + 16);
      v18 = *(_QWORD *)(v16 + 24);
      if (v19 >= v18 >> 1)
        v16 = OUTLINED_FUNCTION_0_14(v18 > 1, v19 + 1);
      *(_QWORD *)(v16 + 16) = v19 + 1;
      sub_23A4857B8(v27, v16+ ((*(unsigned __int8 *)(v24 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v24 + 80))+ *(_QWORD *)(v24 + 72) * v19);
      v5 = v22;
    }
    v14 += v26;
    --v13;
  }
  while (v13);
  swift_release();
  swift_bridgeObjectRelease();
  return v16;
}

uint64_t sub_23A493598@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v1;
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
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  NSObject *v19;
  os_log_type_t v20;
  uint8_t *v21;
  uint64_t v22;
  uint64_t v23;
  int v24;
  uint64_t v26;
  uint64_t *v27;

  v2 = v1;
  v27 = a1;
  v3 = sub_23A4AA0F0();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v6 = (char *)&v26 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_23A4AA150();
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7);
  v10 = (char *)&v26 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_256981308);
  v12 = MEMORY[0x24BDAC7A8](v11);
  v14 = (char *)&v26 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v12);
  v16 = (char *)&v26 - v15;
  sub_23A4AA018();
  v17 = sub_23A4AA00C();
  if (__swift_getEnumTagSinglePayload((uint64_t)v16, 1, v17) != 1)
  {
    v26 = v2;
    sub_23A47D334((uint64_t)v16, (uint64_t)v14, &qword_256981308);
    v23 = *(_QWORD *)(v17 - 8);
    v24 = (*(uint64_t (**)(char *, uint64_t))(v23 + 88))(v14, v17);
    if (v24 == *MEMORY[0x24BE6FD08])
    {
      (*(void (**)(char *, uint64_t))(v23 + 96))(v14, v17);
      (*(void (**)(char *, char *, uint64_t))(v4 + 32))(v6, v14, v3);
      sub_23A493E8C((uint64_t)v6, v27);
      (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
      return sub_23A48762C((uint64_t)v16, &qword_256981308);
    }
    if (v24 == *MEMORY[0x24BE6FD10])
    {
      (*(void (**)(char *, uint64_t))(v23 + 96))(v14, v17);
      (*(void (**)(char *, char *, uint64_t))(v8 + 32))(v10, v14, v7);
      sub_23A493904((uint64_t)v10, v27);
      (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
      return sub_23A48762C((uint64_t)v16, &qword_256981308);
    }
    (*(void (**)(char *, uint64_t))(v23 + 8))(v14, v17);
  }
  if (qword_25697FF48 != -1)
    swift_once();
  v18 = sub_23A4AA6F0();
  __swift_project_value_buffer(v18, (uint64_t)qword_2569815D0);
  v19 = sub_23A4AA6D8();
  v20 = sub_23A4AA8D0();
  if (os_log_type_enabled(v19, v20))
  {
    v21 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v21 = 0;
    _os_log_impl(&dword_23A470000, v19, v20, "Unrecognized attribution type", v21, 2u);
    MEMORY[0x23B84E358](v21, -1, -1);
  }

  v22 = type metadata accessor for AttributionItem();
  __swift_storeEnumTagSinglePayload((uint64_t)v27, 1, 1, v22);
  return sub_23A48762C((uint64_t)v16, &qword_256981308);
}

uint64_t sub_23A493898()
{
  uint64_t v0;

  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  swift_release();
  swift_release();
  return v0;
}

uint64_t sub_23A4938C4()
{
  sub_23A493898();
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for AttributionItemFactory()
{
  return objc_opt_self();
}

uint64_t sub_23A493904@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
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
  char *v13;
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
  id v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  int EnumTagSinglePayload;
  uint64_t v33;
  unint64_t v34;
  unint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  char *v41;
  char *v42;
  char *v43;
  char *v44;
  uint64_t v45;
  void (*v46)(char *, uint64_t);
  uint64_t v47;
  uint64_t *v48;
  uint64_t v49;
  uint64_t v50;
  unint64_t v51;
  uint64_t v52;
  uint64_t v54;
  unint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  char *v61;
  char *v62;
  char *v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  char *v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t *v70;

  v60 = a1;
  v70 = a2;
  v2 = sub_23A4AA318();
  v64 = *(_QWORD *)(v2 - 8);
  v65 = v2;
  MEMORY[0x24BDAC7A8](v2);
  v63 = (char *)&v54 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_256980430);
  MEMORY[0x24BDAC7A8](v4);
  v69 = (uint64_t)&v54 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v68 = sub_23A4AA348();
  v66 = *(_QWORD *)(v68 - 8);
  v6 = MEMORY[0x24BDAC7A8](v68);
  v62 = (char *)&v54 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = MEMORY[0x24BDAC7A8](v6);
  v61 = (char *)&v54 - v9;
  MEMORY[0x24BDAC7A8](v8);
  v67 = (char *)&v54 - v10;
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_256981310);
  MEMORY[0x24BDAC7A8](v11);
  v13 = (char *)&v54 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = sub_23A4A9FA0();
  MEMORY[0x24BDAC7A8](v14);
  v15 = sub_23A4A9EA4();
  v16 = *(_QWORD *)(v15 - 8);
  MEMORY[0x24BDAC7A8](v15);
  v18 = (char *)&v54 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v19 = sub_23A4AA7B0();
  MEMORY[0x24BDAC7A8](v19);
  v20 = sub_23A4A9ED4();
  v21 = *(_QWORD *)(v20 - 8);
  MEMORY[0x24BDAC7A8](v20);
  v23 = (char *)&v54 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23A4AA7A4();
  if (qword_25697FF18 != -1)
    swift_once();
  v24 = __swift_project_value_buffer(v15, (uint64_t)qword_256988510);
  (*(void (**)(char *, uint64_t, uint64_t))(v16 + 16))(v18, v24, v15);
  sub_23A4A9F94();
  sub_23A4A9EE0();
  v25 = sub_23A47BB3C((uint64_t)v23);
  v27 = v26;
  (*(void (**)(char *, uint64_t))(v21 + 8))(v23, v20);
  v28 = _s19DeviceExpertIntents6ActionV5labelSSvg_0();
  v30 = v29;
  sub_23A4AA0D8();
  sub_23A4A9D60();
  swift_bridgeObjectRelease();
  v31 = sub_23A4A9D90();
  EnumTagSinglePayload = __swift_getEnumTagSinglePayload((uint64_t)v13, 1, v31);
  v58 = v27;
  v59 = (uint64_t)v25;
  v56 = v30;
  v57 = v28;
  if (EnumTagSinglePayload == 1)
  {
    sub_23A48762C((uint64_t)v13, &qword_256981310);
  }
  else
  {
    v33 = sub_23A4A9D3C();
    v35 = v34;
    (*(void (**)(char *, uint64_t))(*(_QWORD *)(v31 - 8) + 8))(v13, v31);
    if (v35)
    {
      v54 = v33;
      goto LABEL_8;
    }
  }
  swift_bridgeObjectRelease();
  v54 = 0;
  v35 = 0xE000000000000000;
LABEL_8:
  v55 = v35;
  v36 = _s19DeviceExpertIntents6ActionV22AppIntentConfigurationV8bundleIDSSvg_0();
  v38 = v37;
  if (qword_25697FF28 != -1)
    swift_once();
  v39 = sub_23A4A9F40();
  __swift_project_value_buffer(v39, (uint64_t)qword_256981230);
  v40 = v69;
  __swift_storeEnumTagSinglePayload(v69, 1, 1, v39);
  v41 = v61;
  sub_23A4AA330();
  sub_23A48762C(v40, &qword_256980430);
  v42 = v63;
  sub_23A4AA30C();
  v43 = v62;
  sub_23A4AA324();
  (*(void (**)(char *, uint64_t))(v64 + 8))(v42, v65);
  v44 = v67;
  sub_23A4AA300();
  v45 = v66;
  v46 = *(void (**)(char *, uint64_t))(v66 + 8);
  v47 = v68;
  v46(v43, v68);
  v46(v41, v47);
  sub_23A4AA0D8();
  sub_23A4A9F34();
  swift_bridgeObjectRelease();
  v48 = v70;
  *v70 = v36;
  v48[1] = v38;
  v49 = v58;
  v48[2] = v59;
  v48[3] = v49;
  v50 = v56;
  v48[4] = v57;
  v48[5] = v50;
  v51 = v55;
  v48[6] = v54;
  v48[7] = v51;
  v52 = type metadata accessor for AttributionItem();
  (*(void (**)(char *, char *, uint64_t))(v45 + 16))((char *)v48 + *(int *)(v52 + 32), v44, v47);
  sub_23A483D30(v40);
  sub_23A4857FC();
  sub_23A4AA2C4();
  sub_23A48762C(v40, &qword_256980430);
  v46(v44, v47);
  return __swift_storeEnumTagSinglePayload((uint64_t)v48, 0, 1, v52);
}

uint64_t sub_23A493E8C@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  _QWORD *v2;
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
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  char v25;
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
  char *v39;
  uint64_t v40;
  uint64_t v41;
  char *v42;
  char *v43;
  void (*v44)(char *, uint64_t);
  uint64_t v45;
  uint64_t v46;
  char *v47;
  char *v48;
  void (*v49)(char *, uint64_t, uint64_t);
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  _QWORD *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  void (*v63)(char *, char *, uint64_t);
  uint64_t *v64;
  _QWORD *v65;
  uint64_t v66;
  uint64_t v67;
  void (*v68)(char *, uint64_t);
  _QWORD *v70;
  char *v71;
  uint64_t v72;
  char *v73;
  char *v74;
  char *v75;
  char *v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  char *v80;
  uint64_t v81;
  uint64_t *v82;
  _QWORD *v83;
  uint64_t v84;
  uint64_t v85;
  char *v86;
  char *v87;

  v82 = a2;
  v4 = sub_23A4AA318();
  v77 = *(_QWORD *)(v4 - 8);
  v78 = v4;
  MEMORY[0x24BDAC7A8](v4);
  v76 = (char *)&v70 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v79 = sub_23A4A9F40();
  v72 = *(_QWORD *)(v79 - 8);
  MEMORY[0x24BDAC7A8](v79);
  v73 = (char *)&v70 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_256981310);
  MEMORY[0x24BDAC7A8](v7);
  v9 = (char *)&v70 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_256980430);
  v11 = MEMORY[0x24BDAC7A8](v10);
  v13 = (char *)&v70 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = MEMORY[0x24BDAC7A8](v11);
  v74 = (char *)&v70 - v15;
  MEMORY[0x24BDAC7A8](v14);
  v87 = (char *)&v70 - v16;
  v81 = sub_23A4AA348();
  v85 = *(_QWORD *)(v81 - 8);
  v17 = MEMORY[0x24BDAC7A8](v81);
  v75 = (char *)&v70 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  v19 = MEMORY[0x24BDAC7A8](v17);
  v80 = (char *)&v70 - v20;
  MEMORY[0x24BDAC7A8](v19);
  v86 = (char *)&v70 - v21;
  v22 = v2[5];
  v23 = v2[6];
  v83 = v2;
  __swift_project_boxed_opaque_existential_1(v2 + 2, v22);
  v24 = _s19DeviceExpertIntents6ActionV22AppIntentConfigurationV8bundleIDSSvg_0();
  v25 = (*(uint64_t (**)(uint64_t))(v23 + 32))(v24);
  swift_bridgeObjectRelease();
  v84 = a1;
  sub_23A4AA0C0();
  sub_23A4A9D60();
  swift_bridgeObjectRelease();
  v26 = sub_23A4A9D90();
  if (__swift_getEnumTagSinglePayload((uint64_t)v9, 1, v26) == 1)
  {
    sub_23A48762C((uint64_t)v9, &qword_256981310);
    v27 = 0;
    v28 = 0;
  }
  else
  {
    v27 = sub_23A4A9D6C();
    v28 = v29;
    (*(void (**)(char *, uint64_t))(*(_QWORD *)(v26 - 8) + 8))(v9, v26);
  }
  if ((v25 & 1) != 0)
  {
    v70 = v2 + 2;
    v71 = v13;
    v30 = v83[5];
    v31 = v83[6];
    __swift_project_boxed_opaque_existential_1(v2 + 2, v30);
    v32 = _s19DeviceExpertIntents6ActionV22AppIntentConfigurationV8bundleIDSSvg_0();
    v34 = v33;
    v35 = sub_23A4AA0D8();
    v36 = (uint64_t)v74;
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v31 + 40))(v32, v34, v35, v37, v27, v28, v30, v31);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    v38 = v79;
    if (__swift_getEnumTagSinglePayload(v36, 1, v79) != 1)
    {
      v48 = v73;
      v49 = *(void (**)(char *, uint64_t, uint64_t))(v72 + 32);
      v49(v73, v36, v38);
      v50 = v83[5];
      v51 = v83[6];
      __swift_project_boxed_opaque_existential_1(v70, v50);
      (*(void (**)(uint64_t, uint64_t))(v51 + 16))(v50, v51);
      sub_23A4AA33C();
      swift_bridgeObjectRelease();
      v52 = (uint64_t)v87;
      v49(v87, (uint64_t)v48, v38);
      __swift_storeEnumTagSinglePayload(v52, 0, 1, v38);
      v45 = (uint64_t)v71;
      v47 = v80;
      v40 = v81;
      v46 = v85;
      goto LABEL_12;
    }
    sub_23A48762C(v36, &qword_256980430);
    v13 = v71;
    v39 = v80;
  }
  else
  {
    swift_bridgeObjectRelease();
    v38 = v79;
    v39 = v80;
  }
  v40 = v81;
  v41 = v85;
  if (qword_25697FF28 != -1)
    swift_once();
  __swift_project_value_buffer(v38, (uint64_t)qword_256981230);
  __swift_storeEnumTagSinglePayload((uint64_t)v13, 1, 1, v38);
  sub_23A4AA330();
  sub_23A48762C((uint64_t)v13, &qword_256980430);
  v42 = v76;
  sub_23A4AA30C();
  v43 = v75;
  sub_23A4AA324();
  (*(void (**)(char *, uint64_t))(v77 + 8))(v42, v78);
  sub_23A4AA300();
  v44 = *(void (**)(char *, uint64_t))(v41 + 8);
  v44(v43, v40);
  v44(v39, v40);
  sub_23A4AA0C0();
  sub_23A4A9F34();
  swift_bridgeObjectRelease();
  v45 = (uint64_t)v13;
  v46 = v41;
  v47 = v39;
LABEL_12:
  v53 = sub_23A4AA0D8();
  v83 = v54;
  v84 = v53;
  v55 = sub_23A4AA0B4();
  v81 = v56;
  v57 = _s19DeviceExpertIntents6ActionV5labelSSvg_0();
  v59 = v58;
  v60 = sub_23A4AA0B4();
  v62 = v61;
  v63 = *(void (**)(char *, char *, uint64_t))(v46 + 16);
  v63(v47, v86, v40);
  sub_23A47D334((uint64_t)v87, v45, &qword_256980430);
  v64 = v82;
  v65 = v83;
  *v82 = v84;
  v64[1] = (uint64_t)v65;
  v66 = v81;
  v64[2] = v55;
  v64[3] = v66;
  v64[4] = v57;
  v64[5] = v59;
  v64[6] = v60;
  v64[7] = v62;
  v67 = type metadata accessor for AttributionItem();
  v63((char *)v64 + *(int *)(v67 + 32), v47, v40);
  sub_23A483D30(v45);
  sub_23A4857FC();
  sub_23A4AA2C4();
  sub_23A48762C(v45, &qword_256980430);
  v68 = *(void (**)(char *, uint64_t))(v85 + 8);
  v68(v47, v40);
  sub_23A48762C((uint64_t)v87, &qword_256980430);
  v68(v86, v40);
  return __swift_storeEnumTagSinglePayload((uint64_t)v64, 0, 1, v67);
}

uint64_t sub_23A4944B0()
{
  uint64_t v0;
  uint64_t v1;
  char *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t result;
  uint64_t v6;

  v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_256980430);
  MEMORY[0x24BDAC7A8](v0);
  v2 = (char *)&v6 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  v3 = sub_23A4A9F40();
  __swift_allocate_value_buffer(v3, qword_256981230);
  v4 = __swift_project_value_buffer(v3, (uint64_t)qword_256981230);
  sub_23A4A9F34();
  result = __swift_getEnumTagSinglePayload((uint64_t)v2, 1, v3);
  if ((_DWORD)result != 1)
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(*(_QWORD *)(v3 - 8) + 32))(v4, v2, v3);
  __break(1u);
  return result;
}

uint64_t OUTLINED_FUNCTION_0_14(char a1, int64_t a2)
{
  uint64_t v2;

  return sub_23A4852B8(a1, a2, 1, v2);
}

Swift::Void __swiftcall CoreAnalyticsLogger.sendEvent(_:payload:)(Swift::String _, Swift::OpaquePointer payload)
{
  void *v2;
  id v3;

  v2 = (void *)sub_23A4AA7BC();
  sub_23A48C69C();
  v3 = (id)sub_23A4AA75C();
  AnalyticsSendEvent();

}

void sub_23A494604(uint64_t a1, uint64_t a2, Swift::OpaquePointer a3)
{
  CoreAnalyticsLogger.sendEvent(_:payload:)(*(Swift::String *)&a1, a3);
}

uint64_t sub_23A494618()
{
  uint64_t result;

  type metadata accessor for AnalyticsManager();
  result = swift_allocObject();
  *(_QWORD *)(result + 40) = &type metadata for CoreAnalyticsLogger;
  *(_QWORD *)(result + 48) = &protocol witness table for CoreAnalyticsLogger;
  qword_256981318 = result;
  return result;
}

void AnalyticsManager.__allocating_init(backend:)(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  swift_allocObject();
  __swift_mutable_project_boxed_opaque_existential_1(a1, *(_QWORD *)(a1 + 24));
  OUTLINED_FUNCTION_3_10();
  MEMORY[0x24BDAC7A8](v2);
  OUTLINED_FUNCTION_0_15(v3, v4, v5);
  OUTLINED_FUNCTION_1_11();
  __swift_destroy_boxed_opaque_existential_1(a1);
  OUTLINED_FUNCTION_2_12();
}

uint64_t static AnalyticsManager.shared.getter()
{
  if (qword_25697FF30 != -1)
    swift_once();
  return swift_retain();
}

void AnalyticsManager.init(backend:)(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  __swift_mutable_project_boxed_opaque_existential_1(a1, *(_QWORD *)(a1 + 24));
  OUTLINED_FUNCTION_3_10();
  MEMORY[0x24BDAC7A8](v2);
  OUTLINED_FUNCTION_0_15(v3, v4, v5);
  OUTLINED_FUNCTION_1_11();
  __swift_destroy_boxed_opaque_existential_1(a1);
  OUTLINED_FUNCTION_2_12();
}

uint64_t AnalyticsManager.send(_:)(_QWORD *a1)
{
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;

  v2 = a1[3];
  v3 = a1[4];
  v4 = __swift_project_boxed_opaque_existential_1(a1, v2);
  return sub_23A494868((uint64_t)v4, v1, v2, v3);
}

uint64_t sub_23A494794()
{
  return 0x5F6E6F6973736573;
}

uint64_t AnalyticsManager.deinit()
{
  uint64_t v0;

  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  return v0;
}

uint64_t AnalyticsManager.__deallocating_deinit()
{
  uint64_t v0;

  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  return swift_deallocClassInstance();
}

uint64_t *sub_23A4947F0(uint64_t a1, uint64_t *a2, uint64_t a3, uint64_t a4)
{
  uint64_t *boxed_opaque_existential_1;

  a2[5] = a3;
  a2[6] = a4;
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(a2 + 2);
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(_QWORD *)(a3 - 8) + 32))(boxed_opaque_existential_1, a1, a3);
  return a2;
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

uint64_t sub_23A494868(uint64_t a1, uint64_t *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8;
  uint64_t *boxed_opaque_existential_1;
  char v10;
  uint64_t v11;
  NSObject *v12;
  os_log_type_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  unint64_t v18;
  unint64_t v19;
  _QWORD *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  os_log_type_t type;
  uint64_t v26;
  uint64_t v27;
  _QWORD v28[5];
  uint64_t v29[5];

  v8 = *a2;
  v29[3] = a3;
  v29[4] = a4;
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v29);
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(_QWORD *)(a3 - 8) + 16))(boxed_opaque_existential_1, a1, a3);
  static DeviceExpertPreferences.shouldSendAnalytics.getter();
  if ((v10 & 1) != 0)
  {
    sub_23A494BB4((uint64_t)boxed_opaque_existential_1, v8, a3, a4);
    if (qword_25697FF38 != -1)
      swift_once();
    v11 = sub_23A4AA6F0();
    __swift_project_value_buffer(v11, (uint64_t)qword_2569815A0);
    sub_23A494C64((uint64_t)v29, (uint64_t)v28);
    swift_bridgeObjectRetain_n();
    v12 = sub_23A4AA6D8();
    v13 = sub_23A4AA8DC();
    if (os_log_type_enabled(v12, v13))
    {
      v14 = swift_slowAlloc();
      v26 = swift_slowAlloc();
      v27 = v26;
      *(_DWORD *)v14 = 136315394;
      __swift_project_boxed_opaque_existential_1(v28, v28[3]);
      type = v13;
      v15 = (*(uint64_t (**)(uint64_t, uint64_t))(a4 + 8))(a3, a4);
      sub_23A49D6D8(v15, v16, &v27);
      sub_23A4AA900();
      swift_bridgeObjectRelease();
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v28);
      *(_WORD *)(v14 + 12) = 2080;
      sub_23A48C69C();
      swift_bridgeObjectRetain();
      v17 = sub_23A4AA768();
      v19 = v18;
      swift_bridgeObjectRelease();
      sub_23A49D6D8(v17, v19, &v27);
      sub_23A4AA900();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_23A470000, v12, type, "Sending analytics event \"%s\" with payload %s", (uint8_t *)v14, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x23B84E358](v26, -1, -1);
      MEMORY[0x23B84E358](v14, -1, -1);

    }
    else
    {
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v28);

      swift_bridgeObjectRelease_n();
    }
    v20 = a2 + 2;
    v22 = a2[5];
    v21 = a2[6];
    __swift_project_boxed_opaque_existential_1(v20, v22);
    v23 = (*(uint64_t (**)(uint64_t, uint64_t))(a4 + 8))(a3, a4);
    (*(void (**)(uint64_t))(v21 + 8))(v23);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)v29);
}

ValueMetadata *type metadata accessor for CoreAnalyticsLogger()
{
  return &type metadata for CoreAnalyticsLogger;
}

uint64_t type metadata accessor for AnalyticsManager()
{
  return objc_opt_self();
}

uint64_t method lookup function for AnalyticsManager()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of AnalyticsManager.__allocating_init(backend:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 88))();
}

uint64_t sub_23A494BB4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v6;
  uint64_t v7;

  v6 = (*(uint64_t (**)(uint64_t, uint64_t))(a4 + 24))(a3, a4);
  (*(void (**)(uint64_t, uint64_t))(a4 + 16))(a3, a4);
  v7 = sub_23A4AA7BC();
  swift_bridgeObjectRelease();
  swift_isUniquelyReferenced_nonNull_native();
  sub_23A4923F4(v7, 0x5F6E6F6973736573, 0xEA00000000006469);
  swift_bridgeObjectRelease();
  return v6;
}

uint64_t sub_23A494C64(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  *(_QWORD *)(a2 + 32) = *(_QWORD *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t OUTLINED_FUNCTION_0_15@<X0>(uint64_t a1@<X1>, uint64_t a2@<X8>, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;

  return (*(uint64_t (**)(char *, uint64_t, uint64_t))(v3 + 16))((char *)&a3 - ((a2 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v4);
}

uint64_t *OUTLINED_FUNCTION_1_11()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  return sub_23A4947F0(v3, v0, v1, v2);
}

void sub_23A494D04(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v4;
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
  void (*v25)(char *, uint64_t);
  uint64_t v26;
  int64_t v27;
  uint64_t v28;
  unint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  int64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  void (*v40)(uint64_t, uint64_t, uint64_t);
  uint64_t v41;
  unint64_t v42;
  unint64_t v43;
  uint64_t v44;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v46;
  unint64_t v47;
  unint64_t v48;
  char *v49;
  uint64_t v50;
  uint64_t v51;
  void (*v52)(char *, uint64_t);
  uint64_t v53;
  uint64_t v54;
  char *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  BOOL v59;
  void (*v60)(uint64_t, uint64_t);
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  void (*v65)(char *, uint64_t);
  char *v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  char *v74;
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
  void (*v86)(uint64_t, unint64_t, uint64_t);
  uint64_t v87;
  unint64_t v88;
  int64_t v89;
  uint64_t v90;
  uint64_t v91;
  __int128 v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;

  v79 = a4;
  v80 = a2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256980078);
  OUTLINED_FUNCTION_1_5();
  MEMORY[0x24BDAC7A8](v7);
  OUTLINED_FUNCTION_31_2(v8, v64);
  v84 = *(_QWORD *)(type metadata accessor for TextRun(0) - 8);
  OUTLINED_FUNCTION_1_5();
  MEMORY[0x24BDAC7A8](v9);
  OUTLINED_FUNCTION_37_1();
  v10 = sub_23A4A9FB8();
  v11 = *(_QWORD *)(v10 - 8);
  MEMORY[0x24BDAC7A8](v10);
  OUTLINED_FUNCTION_8_2();
  v85 = v12;
  v13 = sub_23A4AA264();
  v76 = *(_QWORD *)(v13 - 8);
  v77 = v13;
  OUTLINED_FUNCTION_1_5();
  MEMORY[0x24BDAC7A8](v14);
  OUTLINED_FUNCTION_40_0();
  v75 = v15;
  MEMORY[0x24BDAC7A8](v16);
  v74 = (char *)&v64 - v17;
  v18 = sub_23A4AA210();
  v19 = *(_QWORD *)(v18 - 8);
  v20 = MEMORY[0x24BDAC7A8](v18);
  v22 = (char *)&v64 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v20);
  v24 = (char *)&v64 - v23;
  v73 = *a3;
  v72 = a3[1];
  v71 = a3[2];
  v70 = a3[3];
  OUTLINED_FUNCTION_54_0();
  sub_23A4A9FAC();
  v25 = *(void (**)(char *, uint64_t))(v19 + 8);
  OUTLINED_FUNCTION_53_0();
  v69 = Array<A>.asTextRuns()();
  OUTLINED_FUNCTION_39_1();
  OUTLINED_FUNCTION_54_0();
  sub_23A4AA1C8();
  v66 = v24;
  OUTLINED_FUNCTION_53_0();
  v68 = Array<A>.asTextRuns()();
  OUTLINED_FUNCTION_39_1();
  v81 = a1;
  OUTLINED_FUNCTION_54_0();
  v26 = sub_23A4AA1E0();
  v67 = v18;
  v65 = v25;
  v25(v22, v18);
  v27 = *(_QWORD *)(v26 + 16);
  if (v27)
  {
    *(_QWORD *)&v92 = MEMORY[0x24BEE4AF8];
    sub_23A4A8870(0, v27, 0);
    v28 = 0;
    v29 = (*(unsigned __int8 *)(v11 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v11 + 80);
    v64 = v26;
    v88 = v26 + v29;
    v89 = v27;
    v30 = *(_QWORD *)(v11 + 72);
    v86 = *(void (**)(uint64_t, unint64_t, uint64_t))(v11 + 16);
    v87 = v30;
    v31 = v85;
    v82 = v11;
    v83 = v10;
    do
    {
      v91 = v28;
      v86(v31, v88 + v87 * v28, v10);
      v32 = sub_23A4A9FAC();
      v33 = *(_QWORD *)(v32 + 16);
      if (v33)
      {
        v95 = MEMORY[0x24BEE4AF8];
        sub_23A4A7FB4(0, v33, 0);
        v34 = v95;
        v35 = sub_23A4AA000();
        v36 = *(_QWORD *)(v35 - 8);
        v37 = *(unsigned __int8 *)(v36 + 80);
        v90 = v32;
        v38 = v32 + ((v37 + 32) & ~v37);
        v39 = *(_QWORD *)(v36 + 72);
        v40 = *(void (**)(uint64_t, uint64_t, uint64_t))(v36 + 16);
        v41 = v84;
        do
        {
          v40(v4, v38, v35);
          v95 = v34;
          v43 = *(_QWORD *)(v34 + 16);
          v42 = *(_QWORD *)(v34 + 24);
          if (v43 >= v42 >> 1)
          {
            sub_23A4A7FB4(v42 > 1, v43 + 1, 1);
            v41 = v84;
            v34 = v95;
          }
          *(_QWORD *)(v34 + 16) = v43 + 1;
          sub_23A4989BC(v4, v34+ ((*(unsigned __int8 *)(v41 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v41 + 80))+ *(_QWORD *)(v41 + 72) * v43);
          v38 += v39;
          --v33;
        }
        while (v33);
        swift_bridgeObjectRelease();
        v11 = v82;
        v10 = v83;
        v31 = v85;
      }
      else
      {
        OUTLINED_FUNCTION_39_1();
        v34 = MEMORY[0x24BEE4AF8];
      }
      (*(void (**)(uint64_t, uint64_t))(v11 + 8))(v31, v10);
      v44 = v92;
      isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      v46 = v91;
      if ((isUniquelyReferenced_nonNull_native & 1) == 0)
      {
        sub_23A4A8870(0, *(_QWORD *)(v44 + 16) + 1, 1);
        v44 = v92;
      }
      v48 = *(_QWORD *)(v44 + 16);
      v47 = *(_QWORD *)(v44 + 24);
      if (v48 >= v47 >> 1)
      {
        sub_23A4A8870((char *)(v47 > 1), v48 + 1, 1);
        v44 = v92;
      }
      v28 = v46 + 1;
      *(_QWORD *)(v44 + 16) = v48 + 1;
      *(_QWORD *)(v44 + 8 * v48 + 32) = v34;
    }
    while (v28 != v89);
    swift_bridgeObjectRelease();
  }
  else
  {
    OUTLINED_FUNCTION_39_1();
    v44 = MEMORY[0x24BEE4AF8];
  }
  v49 = v66;
  v50 = v81;
  sub_23A4AA21C();
  _s19DeviceExpertIntents6ActionV22AppIntentConfigurationV10parametersSaySSGSgvg_0();
  v51 = v67;
  v52 = v65;
  v65(v49, v67);
  v53 = Array<A>.asTextRuns()();
  OUTLINED_FUNCTION_52();
  sub_23A4A9FC4();
  v54 = Array<A>.asTextRuns()();
  OUTLINED_FUNCTION_52();
  sub_23A4AA21C();
  v55 = v74;
  sub_23A4AA204();
  v52(v49, v51);
  v57 = v76;
  v56 = v77;
  v58 = v75;
  (*(void (**)(uint64_t, _QWORD, uint64_t))(v76 + 104))(v75, *MEMORY[0x24BE6FF48], v77);
  sub_23A47E0EC((uint64_t)&unk_256981598);
  OUTLINED_FUNCTION_49_1();
  OUTLINED_FUNCTION_49_1();
  v59 = (_QWORD)v92 != v95;
  v60 = *(void (**)(uint64_t, uint64_t))(v57 + 8);
  v60(v58, v56);
  v60((uint64_t)v55, v56);
  LOBYTE(v95) = v59;
  v61 = v80;
  v62 = v78;
  OUTLINED_FUNCTION_51_1(v80);
  *(_QWORD *)&v92 = v73;
  *((_QWORD *)&v92 + 1) = v72;
  v93 = v71;
  v94 = v70;
  ListStyleAnswerSnippetModel.init(title:intro:steps:outro:disclaimer:listStyle:attributionModel:context:)(v69, v68, v44, v53, v54, (char *)&v95, v62, &v92, v79);
  sub_23A48A4D0(v61);
  v63 = sub_23A4AA27C();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v63 - 8) + 8))(v50, v63);
  OUTLINED_FUNCTION_14_4();
}

BOOL static ListStyleAnswerSnippetModel.ListStyle.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t ListStyleAnswerSnippetModel.title.getter()
{
  uint64_t v1;

  __swift_instantiateConcreteTypeFromMangledName(&qword_2569800B0);
  OUTLINED_FUNCTION_14_7();
  return v1;
}

uint64_t sub_23A495340()
{
  swift_bridgeObjectRetain();
  return ListStyleAnswerSnippetModel.title.setter();
}

uint64_t ListStyleAnswerSnippetModel.title.setter()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_2569800B0);
  return OUTLINED_FUNCTION_16_6();
}

void ListStyleAnswerSnippetModel.title.modify()
{
  _QWORD *v0;
  _QWORD *v1;

  v1 = OUTLINED_FUNCTION_6_2();
  *v0 = v1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2569800B0);
  v1[4] = OUTLINED_FUNCTION_7_2();
  OUTLINED_FUNCTION_5();
}

void ListStyleAnswerSnippetModel.intro.getter()
{
  OUTLINED_FUNCTION_0_16();
  OUTLINED_FUNCTION_62_0();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2569800B0);
  OUTLINED_FUNCTION_14_7();
  OUTLINED_FUNCTION_21_1();
}

uint64_t type metadata accessor for ListStyleAnswerSnippetModel()
{
  uint64_t result;

  result = qword_2569814E8;
  if (!qword_2569814E8)
    return swift_getSingletonMetadata();
  return result;
}

void sub_23A495440()
{
  swift_bridgeObjectRetain();
  ListStyleAnswerSnippetModel.intro.setter();
}

void ListStyleAnswerSnippetModel.intro.setter()
{
  OUTLINED_FUNCTION_0_16();
  OUTLINED_FUNCTION_62_0();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2569800B0);
  OUTLINED_FUNCTION_16_6();
  OUTLINED_FUNCTION_21_1();
}

void ListStyleAnswerSnippetModel.intro.modify()
{
  _QWORD *v0;
  _QWORD *v1;

  v1 = OUTLINED_FUNCTION_6_2();
  *v0 = v1;
  OUTLINED_FUNCTION_0_16();
  OUTLINED_FUNCTION_62_0();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2569800B0);
  v1[4] = OUTLINED_FUNCTION_7_2();
  OUTLINED_FUNCTION_5();
}

void ListStyleAnswerSnippetModel.steps.getter()
{
  OUTLINED_FUNCTION_0_16();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2569800B8);
  OUTLINED_FUNCTION_14_7();
  OUTLINED_FUNCTION_21_1();
}

void sub_23A49551C()
{
  swift_bridgeObjectRetain();
  ListStyleAnswerSnippetModel.steps.setter();
}

void ListStyleAnswerSnippetModel.steps.setter()
{
  OUTLINED_FUNCTION_0_16();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2569800B8);
  OUTLINED_FUNCTION_16_6();
  OUTLINED_FUNCTION_21_1();
}

void ListStyleAnswerSnippetModel.steps.modify()
{
  _QWORD *v0;
  _QWORD *v1;

  v1 = OUTLINED_FUNCTION_6_2();
  *v0 = v1;
  OUTLINED_FUNCTION_0_16();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2569800B8);
  v1[4] = OUTLINED_FUNCTION_7_2();
  OUTLINED_FUNCTION_5();
}

void ListStyleAnswerSnippetModel.outro.getter()
{
  OUTLINED_FUNCTION_0_16();
  OUTLINED_FUNCTION_59_0();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2569800B0);
  OUTLINED_FUNCTION_14_7();
  OUTLINED_FUNCTION_21_1();
}

void sub_23A4955FC()
{
  swift_bridgeObjectRetain();
  ListStyleAnswerSnippetModel.outro.setter();
}

void ListStyleAnswerSnippetModel.outro.setter()
{
  OUTLINED_FUNCTION_0_16();
  OUTLINED_FUNCTION_59_0();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2569800B0);
  OUTLINED_FUNCTION_16_6();
  OUTLINED_FUNCTION_21_1();
}

void ListStyleAnswerSnippetModel.outro.modify()
{
  _QWORD *v0;
  _QWORD *v1;

  v1 = OUTLINED_FUNCTION_6_2();
  *v0 = v1;
  OUTLINED_FUNCTION_0_16();
  OUTLINED_FUNCTION_59_0();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2569800B0);
  v1[4] = OUTLINED_FUNCTION_7_2();
  OUTLINED_FUNCTION_5();
}

void ListStyleAnswerSnippetModel.disclaimer.getter()
{
  OUTLINED_FUNCTION_0_16();
  OUTLINED_FUNCTION_56_0();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2569800B0);
  OUTLINED_FUNCTION_14_7();
  OUTLINED_FUNCTION_21_1();
}

void sub_23A4956D4()
{
  swift_bridgeObjectRetain();
  ListStyleAnswerSnippetModel.disclaimer.setter();
}

void ListStyleAnswerSnippetModel.disclaimer.setter()
{
  OUTLINED_FUNCTION_0_16();
  OUTLINED_FUNCTION_56_0();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2569800B0);
  OUTLINED_FUNCTION_16_6();
  OUTLINED_FUNCTION_21_1();
}

void ListStyleAnswerSnippetModel.disclaimer.modify()
{
  _QWORD *v0;
  _QWORD *v1;

  v1 = OUTLINED_FUNCTION_6_2();
  *v0 = v1;
  OUTLINED_FUNCTION_0_16();
  OUTLINED_FUNCTION_56_0();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2569800B0);
  v1[4] = OUTLINED_FUNCTION_7_2();
  OUTLINED_FUNCTION_5();
}

void ListStyleAnswerSnippetModel.attributionModel.getter()
{
  OUTLINED_FUNCTION_0_16();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2569800C0);
  sub_23A4AA36C();
  OUTLINED_FUNCTION_60();
}

void sub_23A4957B0(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_256980078);
  MEMORY[0x24BDAC7A8](v2);
  v4 = (char *)&v5 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23A48A488(a1, (uint64_t)v4);
  ListStyleAnswerSnippetModel.attributionModel.setter((uint64_t)v4);
}

void ListStyleAnswerSnippetModel.attributionModel.setter(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  __swift_instantiateConcreteTypeFromMangledName(&qword_256980078);
  OUTLINED_FUNCTION_1_5();
  MEMORY[0x24BDAC7A8](v2);
  OUTLINED_FUNCTION_4();
  sub_23A48A488(a1, v4 - v3);
  OUTLINED_FUNCTION_0_16();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2569800C0);
  sub_23A4AA378();
  sub_23A48A4D0(a1);
  OUTLINED_FUNCTION_5();
}

void ListStyleAnswerSnippetModel.attributionModel.modify()
{
  _QWORD *v0;
  _QWORD *v1;

  v1 = OUTLINED_FUNCTION_6_2();
  *v0 = v1;
  OUTLINED_FUNCTION_0_16();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2569800C0);
  v1[4] = OUTLINED_FUNCTION_7_2();
  OUTLINED_FUNCTION_5();
}

void ListStyleAnswerSnippetModel.context.getter()
{
  OUTLINED_FUNCTION_0_16();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2569800A8);
  sub_23A4AA36C();
  OUTLINED_FUNCTION_60();
}

double sub_23A495930@<D0>(uint64_t a1@<X8>)
{
  double result;
  __int128 v3;
  uint64_t v4;
  uint64_t v5;

  ListStyleAnswerSnippetModel.context.getter();
  result = *(double *)&v3;
  *(_OWORD *)a1 = v3;
  *(_QWORD *)(a1 + 16) = v4;
  *(_QWORD *)(a1 + 24) = v5;
  return result;
}

uint64_t sub_23A495970()
{
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return ListStyleAnswerSnippetModel.context.setter();
}

uint64_t ListStyleAnswerSnippetModel.context.setter()
{
  OUTLINED_FUNCTION_0_16();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2569800A8);
  return sub_23A4AA378();
}

void ListStyleAnswerSnippetModel.context.modify()
{
  _QWORD *v0;
  _QWORD *v1;

  v1 = OUTLINED_FUNCTION_6_2();
  *v0 = v1;
  OUTLINED_FUNCTION_0_16();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2569800A8);
  v1[4] = OUTLINED_FUNCTION_7_2();
  OUTLINED_FUNCTION_5();
}

void ListStyleAnswerSnippetModel.listStyle.getter(_BYTE *a1@<X8>)
{
  uint64_t v1;

  *a1 = *(_BYTE *)(v1 + *(int *)(OUTLINED_FUNCTION_0_16() + 44));
  OUTLINED_FUNCTION_60();
}

void ListStyleAnswerSnippetModel.listStyle.setter(char *a1)
{
  uint64_t v1;
  char v2;

  v2 = *a1;
  *(_BYTE *)(v1 + *(int *)(OUTLINED_FUNCTION_0_16() + 44)) = v2;
  OUTLINED_FUNCTION_60();
}

uint64_t (*ListStyleAnswerSnippetModel.listStyle.modify())()
{
  OUTLINED_FUNCTION_0_16();
  return nullsub_1;
}

void ListStyleAnswerSnippetModel.ListStyle.hash(into:)()
{
  sub_23A4AAAD4();
  OUTLINED_FUNCTION_60();
}

uint64_t sub_23A495AF0(uint64_t a1, uint64_t a2)
{
  BOOL v3;
  char v7;

  v3 = a1 == 0x6465726564726FLL && a2 == 0xE700000000000000;
  if (v3 || (sub_23A4AAAB0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x65726564726F6E75 && a2 == 0xE900000000000064)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    v7 = sub_23A4AAAB0();
    swift_bridgeObjectRelease();
    if ((v7 & 1) != 0)
      return 1;
    else
      return 2;
  }
}

uint64_t sub_23A495BDC(char a1)
{
  if ((a1 & 1) != 0)
    return 0x65726564726F6E75;
  else
    return 0x6465726564726FLL;
}

uint64_t sub_23A495C18()
{
  swift_bridgeObjectRelease();
  return 1;
}

uint64_t sub_23A495C34()
{
  return 0;
}

uint64_t sub_23A495C44()
{
  char *v0;

  return sub_23A495BDC(*v0);
}

uint64_t sub_23A495C4C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_23A495AF0(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_23A495C70()
{
  sub_23A495F00();
  return sub_23A4AAB04();
}

uint64_t sub_23A495C98()
{
  sub_23A495F00();
  return sub_23A4AAB10();
}

uint64_t sub_23A495CC4@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = sub_23A495C18();
  *a1 = result & 1;
  return result;
}

uint64_t sub_23A495CEC()
{
  sub_23A495F78();
  return sub_23A4AAB04();
}

uint64_t sub_23A495D14()
{
  sub_23A495F78();
  return sub_23A4AAB10();
}

uint64_t sub_23A495D3C()
{
  sub_23A495F3C();
  return sub_23A4AAB04();
}

uint64_t sub_23A495D64()
{
  sub_23A495F3C();
  return sub_23A4AAB10();
}

void ListStyleAnswerSnippetModel.ListStyle.encode(to:)()
{
  char *v0;
  _QWORD *v1;
  _QWORD *v2;
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

  OUTLINED_FUNCTION_36_1();
  v2 = v1;
  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569813C0);
  v21 = *(_QWORD *)(v3 - 8);
  v22 = v3;
  OUTLINED_FUNCTION_1_5();
  MEMORY[0x24BDAC7A8](v4);
  OUTLINED_FUNCTION_4();
  v7 = v6 - v5;
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569813C8);
  v19 = *(_QWORD *)(v8 - 8);
  v20 = v8;
  OUTLINED_FUNCTION_1_5();
  MEMORY[0x24BDAC7A8](v9);
  OUTLINED_FUNCTION_4();
  v12 = v11 - v10;
  v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569813D0);
  v23 = *(_QWORD *)(v13 - 8);
  OUTLINED_FUNCTION_1_5();
  MEMORY[0x24BDAC7A8](v14);
  OUTLINED_FUNCTION_4();
  v17 = v16 - v15;
  v18 = *v0;
  __swift_project_boxed_opaque_existential_1(v2, v2[3]);
  sub_23A495F00();
  sub_23A4AAAF8();
  if ((v18 & 1) != 0)
  {
    OUTLINED_FUNCTION_57_0();
    OUTLINED_FUNCTION_40_1();
    (*(void (**)(uint64_t, uint64_t))(v21 + 8))(v7, v22);
  }
  else
  {
    sub_23A495F78();
    OUTLINED_FUNCTION_40_1();
    (*(void (**)(uint64_t, uint64_t))(v19 + 8))(v12, v20);
  }
  (*(void (**)(uint64_t, uint64_t))(v23 + 8))(v17, v13);
  OUTLINED_FUNCTION_0();
}

unint64_t sub_23A495F00()
{
  unint64_t result;

  result = qword_2569813D8;
  if (!qword_2569813D8)
  {
    result = MEMORY[0x23B84E2B0](&unk_23A4ADB54, &type metadata for ListStyleAnswerSnippetModel.ListStyle.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2569813D8);
  }
  return result;
}

unint64_t sub_23A495F3C()
{
  unint64_t result;

  result = qword_2569813E0;
  if (!qword_2569813E0)
  {
    result = MEMORY[0x23B84E2B0](&unk_23A4ADB04, &type metadata for ListStyleAnswerSnippetModel.ListStyle.UnorderedCodingKeys);
    atomic_store(result, (unint64_t *)&qword_2569813E0);
  }
  return result;
}

unint64_t sub_23A495F78()
{
  unint64_t result;

  result = qword_2569813E8;
  if (!qword_2569813E8)
  {
    result = MEMORY[0x23B84E2B0](&unk_23A4ADAB4, &type metadata for ListStyleAnswerSnippetModel.ListStyle.OrderedCodingKeys);
    atomic_store(result, (unint64_t *)&qword_2569813E8);
  }
  return result;
}

void ListStyleAnswerSnippetModel.ListStyle.hashValue.getter()
{
  sub_23A4AAAC8();
  OUTLINED_FUNCTION_48_1();
  sub_23A4AAAE0();
  OUTLINED_FUNCTION_10_2();
}

void ListStyleAnswerSnippetModel.ListStyle.init(from:)()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;
  _QWORD *v3;
  _BYTE *v4;
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
  char v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  unint64_t v20;
  _BYTE *v21;
  uint64_t v22;
  uint64_t v23;
  _QWORD *v24;
  _QWORD *v25;
  uint64_t v26;
  uint64_t v27;
  _QWORD *v28;
  uint64_t v29;
  uint64_t v30;
  _BYTE *v31;
  uint64_t v32;
  uint64_t v33;

  OUTLINED_FUNCTION_36_1();
  v3 = v2;
  v31 = v4;
  v29 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569813F0);
  v33 = *(_QWORD *)(v29 - 8);
  OUTLINED_FUNCTION_1_5();
  MEMORY[0x24BDAC7A8](v5);
  OUTLINED_FUNCTION_8_2();
  v32 = v6;
  v30 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569813F8);
  v7 = *(_QWORD *)(v30 - 8);
  MEMORY[0x24BDAC7A8](v30);
  OUTLINED_FUNCTION_4();
  v10 = v9 - v8;
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_256981400);
  v12 = *(_QWORD *)(v11 - 8);
  MEMORY[0x24BDAC7A8](v11);
  OUTLINED_FUNCTION_4_2();
  __swift_project_boxed_opaque_existential_1(v3, v3[3]);
  sub_23A495F00();
  sub_23A4AAAEC();
  if (v0)
    goto LABEL_9;
  v27 = v10;
  v28 = v3;
  v13 = sub_23A4AAA50();
  v14 = *(_QWORD *)(v13 + 16);
  v15 = v11;
  if (!v14)
  {
    v22 = v1;
LABEL_8:
    v23 = sub_23A4AA954();
    swift_allocError();
    v25 = v24;
    __swift_instantiateConcreteTypeFromMangledName(&qword_256980F68);
    *v25 = &type metadata for ListStyleAnswerSnippetModel.ListStyle;
    sub_23A4AAA08();
    sub_23A4AA948();
    (*(void (**)(_QWORD *, _QWORD, uint64_t))(*(_QWORD *)(v23 - 8) + 104))(v25, *MEMORY[0x24BEE26D0], v23);
    swift_willThrow();
    OUTLINED_FUNCTION_30_2();
    (*(void (**)(uint64_t, uint64_t))(v12 + 8))(v22, v15);
    v3 = v28;
LABEL_9:
    v26 = (uint64_t)v3;
    goto LABEL_10;
  }
  v16 = *(_BYTE *)(v13 + 32);
  sub_23A491C30(1, v14, v13, v13 + 32, 0, (2 * v14) | 1);
  v18 = v17;
  v20 = v19;
  swift_bridgeObjectRelease();
  if (v18 != v20 >> 1)
  {
    v22 = v1;
    v15 = v11;
    goto LABEL_8;
  }
  if ((v16 & 1) != 0)
  {
    OUTLINED_FUNCTION_57_0();
    sub_23A4AA9FC();
    v21 = v31;
    (*(void (**)(uint64_t, uint64_t))(v33 + 8))(v32, v29);
  }
  else
  {
    sub_23A495F78();
    sub_23A4AA9FC();
    v21 = v31;
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v27, v30);
  }
  OUTLINED_FUNCTION_30_2();
  (*(void (**)(uint64_t, uint64_t))(v12 + 8))(v1, v11);
  *v21 = v16;
  v26 = (uint64_t)v28;
LABEL_10:
  __swift_destroy_boxed_opaque_existential_1(v26);
  OUTLINED_FUNCTION_0();
}

void sub_23A496360()
{
  sub_23A4AAAC8();
  OUTLINED_FUNCTION_48_1();
  sub_23A4AAAE0();
  OUTLINED_FUNCTION_10_2();
}

void sub_23A496390()
{
  ListStyleAnswerSnippetModel.ListStyle.init(from:)();
}

void sub_23A4963A4()
{
  ListStyleAnswerSnippetModel.ListStyle.encode(to:)();
}

void ListStyleAnswerSnippetModel.init(title:intro:steps:outro:disclaimer:listStyle:attributionModel:context:)(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, char *a6@<X5>, uint64_t a7@<X6>, __int128 *a8@<X7>, uint64_t a9@<X8>)
{
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  char v19;
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
  __int128 v32;
  __int128 v33;
  uint64_t v34;
  uint64_t v35;

  v28 = a5;
  v29 = a7;
  v27 = a4;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256980078);
  OUTLINED_FUNCTION_1_5();
  MEMORY[0x24BDAC7A8](v15);
  OUTLINED_FUNCTION_2_6();
  MEMORY[0x24BDAC7A8](v16);
  v18 = (char *)&v26 - v17;
  v19 = *a6;
  v32 = *a8;
  v20 = *((_QWORD *)a8 + 2);
  v30 = *((_QWORD *)a8 + 3);
  v31 = v20;
  v21 = OUTLINED_FUNCTION_0_16();
  v22 = a9 + *(int *)(v21 + 36);
  v23 = type metadata accessor for AttributionModel();
  __swift_storeEnumTagSinglePayload((uint64_t)v18, 1, 1, v23);
  OUTLINED_FUNCTION_51_1((uint64_t)v18);
  OUTLINED_FUNCTION_35_1();
  sub_23A48A4D0((uint64_t)v18);
  *(_QWORD *)&v33 = a1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256980090);
  sub_23A4AA354();
  *(_QWORD *)&v33 = a2;
  OUTLINED_FUNCTION_26_4();
  *(_QWORD *)&v33 = a3;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256981408);
  sub_23A4AA354();
  *(_QWORD *)&v33 = v27;
  OUTLINED_FUNCTION_26_4();
  *(_QWORD *)&v33 = v28;
  OUTLINED_FUNCTION_26_4();
  *(_BYTE *)(a9 + *(int *)(v21 + 44)) = v19;
  v24 = v29;
  sub_23A48A488(v29, (uint64_t)v18);
  v25 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569800C0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v25 - 8) + 8))(v22, v25);
  OUTLINED_FUNCTION_51_1((uint64_t)v18);
  OUTLINED_FUNCTION_35_1();
  sub_23A48A4D0((uint64_t)v18);
  v33 = v32;
  v34 = v31;
  v35 = v30;
  sub_23A4AA354();
  sub_23A48A4D0(v24);
  OUTLINED_FUNCTION_14_4();
}

void ListStyleAnswerSnippetModel.hasTitle.getter()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_2569800B0);
  OUTLINED_FUNCTION_14_7();
  OUTLINED_FUNCTION_20_3();
  OUTLINED_FUNCTION_58_0();
  OUTLINED_FUNCTION_21_1();
}

void ListStyleAnswerSnippetModel.hasIntro.getter()
{
  OUTLINED_FUNCTION_0_16();
  OUTLINED_FUNCTION_62_0();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2569800B0);
  OUTLINED_FUNCTION_14_7();
  OUTLINED_FUNCTION_20_3();
  OUTLINED_FUNCTION_58_0();
  OUTLINED_FUNCTION_21_1();
}

void ListStyleAnswerSnippetModel.hasOutro.getter()
{
  OUTLINED_FUNCTION_0_16();
  OUTLINED_FUNCTION_59_0();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2569800B0);
  OUTLINED_FUNCTION_14_7();
  OUTLINED_FUNCTION_20_3();
  OUTLINED_FUNCTION_58_0();
  OUTLINED_FUNCTION_21_1();
}

void ListStyleAnswerSnippetModel.hasDisclaimer.getter()
{
  OUTLINED_FUNCTION_0_16();
  OUTLINED_FUNCTION_56_0();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2569800B0);
  OUTLINED_FUNCTION_14_7();
  OUTLINED_FUNCTION_20_3();
  OUTLINED_FUNCTION_58_0();
  OUTLINED_FUNCTION_21_1();
}

uint64_t sub_23A496678()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  char *v12;
  char v13;
  char v14;
  char v15;
  char v16;
  char v17;
  char v19;
  char v20;
  char v21;
  char v22;
  char v23;
  uint64_t v24;

  OUTLINED_FUNCTION_0_16();
  OUTLINED_FUNCTION_1_5();
  v2 = MEMORY[0x24BDAC7A8](v1);
  v4 = (char *)&v24 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = MEMORY[0x24BDAC7A8](v2);
  v7 = (char *)&v24 - v6;
  v8 = MEMORY[0x24BDAC7A8](v5);
  v10 = (char *)&v24 - v9;
  MEMORY[0x24BDAC7A8](v8);
  v12 = (char *)&v24 - v11;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2569800B0);
  sub_23A4AA36C();
  OUTLINED_FUNCTION_34_1();
  v14 = v13;
  OUTLINED_FUNCTION_52();
  sub_23A4978DC(v0, (uint64_t)v12);
  if ((v14 & 1) != 0)
  {
    sub_23A497920((uint64_t)v12);
    OUTLINED_FUNCTION_44_1();
LABEL_4:
    sub_23A497920((uint64_t)v10);
    OUTLINED_FUNCTION_43_1();
LABEL_5:
    sub_23A497920((uint64_t)v7);
    OUTLINED_FUNCTION_45_1();
    goto LABEL_6;
  }
  OUTLINED_FUNCTION_27_3();
  OUTLINED_FUNCTION_34_1();
  v16 = v15;
  OUTLINED_FUNCTION_52();
  sub_23A497920((uint64_t)v12);
  OUTLINED_FUNCTION_44_1();
  if ((v16 & 1) != 0)
    goto LABEL_4;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2569800B8);
  sub_23A4AA36C();
  sub_23A4A6E0C();
  v20 = v19;
  OUTLINED_FUNCTION_52();
  sub_23A497920((uint64_t)v10);
  OUTLINED_FUNCTION_43_1();
  if ((v20 & 1) != 0)
    goto LABEL_5;
  OUTLINED_FUNCTION_27_3();
  OUTLINED_FUNCTION_34_1();
  v22 = v21;
  OUTLINED_FUNCTION_52();
  sub_23A497920((uint64_t)v7);
  OUTLINED_FUNCTION_45_1();
  if ((v22 & 1) == 0)
  {
    OUTLINED_FUNCTION_27_3();
    sub_23A4A6C04();
    v17 = v23;
    swift_bridgeObjectRelease();
    goto LABEL_7;
  }
LABEL_6:
  v17 = 1;
LABEL_7:
  sub_23A497920((uint64_t)v4);
  return v17 & 1;
}

uint64_t sub_23A496864(uint64_t a1, uint64_t a2)
{
  BOOL v3;
  BOOL v6;
  BOOL v7;
  BOOL v8;
  BOOL v9;
  BOOL v10;
  char v12;

  v3 = a1 == 0x656C746974 && a2 == 0xE500000000000000;
  if (v3 || (sub_23A4AAAB0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else
  {
    v6 = a1 == 0x6F72746E69 && a2 == 0xE500000000000000;
    if (v6 || (sub_23A4AAAB0() & 1) != 0)
    {
      swift_bridgeObjectRelease();
      return 1;
    }
    else
    {
      v7 = a1 == 0x7370657473 && a2 == 0xE500000000000000;
      if (v7 || (sub_23A4AAAB0() & 1) != 0)
      {
        swift_bridgeObjectRelease();
        return 2;
      }
      else
      {
        v8 = a1 == 0x6F7274756FLL && a2 == 0xE500000000000000;
        if (v8 || (sub_23A4AAAB0() & 1) != 0)
        {
          swift_bridgeObjectRelease();
          return 3;
        }
        else
        {
          v9 = a1 == 0x6D69616C63736964 && a2 == 0xEA00000000007265;
          if (v9 || (sub_23A4AAAB0() & 1) != 0)
          {
            swift_bridgeObjectRelease();
            return 4;
          }
          else if (a1 == 0xD000000000000010 && a2 == 0x800000023A4AEDC0 || (sub_23A4AAAB0() & 1) != 0)
          {
            swift_bridgeObjectRelease();
            return 5;
          }
          else
          {
            v10 = a1 == 0x747865746E6F63 && a2 == 0xE700000000000000;
            if (v10 || (sub_23A4AAAB0() & 1) != 0)
            {
              swift_bridgeObjectRelease();
              return 6;
            }
            else if (a1 == 0x6C7974537473696CLL && a2 == 0xE900000000000065)
            {
              swift_bridgeObjectRelease();
              return 7;
            }
            else
            {
              v12 = sub_23A4AAAB0();
              swift_bridgeObjectRelease();
              if ((v12 & 1) != 0)
                return 7;
              else
                return 8;
            }
          }
        }
      }
    }
  }
}

uint64_t sub_23A496B38()
{
  return 8;
}

uint64_t sub_23A496B40(unsigned __int8 a1)
{
  return ((uint64_t (*)(unint64_t, unint64_t))((char *)sub_23A496B78 + 4 * byte_23A4AD630[a1]))(0xD000000000000010, 0x800000023A4AEDC0);
}

uint64_t sub_23A496B78()
{
  return 0x656C746974;
}

uint64_t sub_23A496B8C()
{
  return 0x6F72746E69;
}

uint64_t sub_23A496BA0()
{
  return 0x7370657473;
}

uint64_t sub_23A496BB4()
{
  return 0x6F7274756FLL;
}

uint64_t sub_23A496BCC()
{
  return 0x6D69616C63736964;
}

uint64_t sub_23A496BE8()
{
  return 0x747865746E6F63;
}

uint64_t sub_23A496C00()
{
  return 0x6C7974537473696CLL;
}

uint64_t sub_23A496C1C()
{
  unsigned __int8 *v0;

  return sub_23A496B40(*v0);
}

uint64_t sub_23A496C24@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_23A496864(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_23A496C48@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = sub_23A496B38();
  *a1 = result;
  return result;
}

uint64_t sub_23A496C6C()
{
  sub_23A4975F0();
  return sub_23A4AAB04();
}

uint64_t sub_23A496C94()
{
  sub_23A4975F0();
  return sub_23A4AAB10();
}

void ListStyleAnswerSnippetModel.encode(to:)()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_36_1();
  v3 = v2;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_256981410);
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  OUTLINED_FUNCTION_4_2();
  __swift_project_boxed_opaque_existential_1(v3, v3[3]);
  sub_23A4975F0();
  sub_23A4AAAF8();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2569800B0);
  sub_23A4977C8((uint64_t)&unk_256981420);
  OUTLINED_FUNCTION_3_11();
  if (!v0)
  {
    type metadata accessor for ListStyleAnswerSnippetModel();
    OUTLINED_FUNCTION_3_11();
    __swift_instantiateConcreteTypeFromMangledName(&qword_2569800B8);
    sub_23A497854((uint64_t)&unk_256981448);
    OUTLINED_FUNCTION_9_2();
    OUTLINED_FUNCTION_3_11();
    OUTLINED_FUNCTION_3_11();
    __swift_instantiateConcreteTypeFromMangledName(&qword_2569800C0);
    sub_23A48AF48((uint64_t)&unk_256980C98);
    OUTLINED_FUNCTION_9_2();
    __swift_instantiateConcreteTypeFromMangledName(&qword_2569800A8);
    sub_23A47DFC8((uint64_t)&unk_2569802E0);
    OUTLINED_FUNCTION_9_2();
    sub_23A49778C();
    OUTLINED_FUNCTION_9_2();
  }
  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v1, v4);
  OUTLINED_FUNCTION_0();
}

void ListStyleAnswerSnippetModel.init(from:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, char a10)
{
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD *v13;
  _QWORD *v14;
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
  uint64_t v37;
  uint64_t v38;
  char *v39;
  uint64_t v40;
  int *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  char *v51;
  uint64_t v52;
  void (*v53)(uint64_t, char *, uint64_t);
  int *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  void (*v58)(uint64_t);
  uint64_t v59;
  uint64_t v60;
  uint64_t v61[2];
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  char *v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  char *v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  _QWORD *v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  int *v79;
  uint64_t v80;
  char v81;

  OUTLINED_FUNCTION_36_1();
  v75 = v10;
  v14 = v13;
  v62 = v15;
  v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569800A8);
  v71 = *(_QWORD *)(v16 - 8);
  v72 = v16;
  OUTLINED_FUNCTION_1_5();
  MEMORY[0x24BDAC7A8](v17);
  OUTLINED_FUNCTION_8_2();
  v63 = v18;
  v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569800C0);
  v77 = *(_QWORD *)(v19 - 8);
  v78 = v19;
  OUTLINED_FUNCTION_1_5();
  MEMORY[0x24BDAC7A8](v20);
  OUTLINED_FUNCTION_31_2(v21, v61[0]);
  v22 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569800B8);
  v67 = *(_QWORD *)(v22 - 8);
  v68 = v22;
  OUTLINED_FUNCTION_1_5();
  MEMORY[0x24BDAC7A8](v23);
  OUTLINED_FUNCTION_8_2();
  v66 = v24;
  v25 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569800B0);
  v73 = *(_QWORD *)(v25 - 8);
  OUTLINED_FUNCTION_1_5();
  MEMORY[0x24BDAC7A8](v26);
  OUTLINED_FUNCTION_40_0();
  v64 = v27;
  v29 = MEMORY[0x24BDAC7A8](v28);
  v65 = (char *)v61 - v30;
  v31 = MEMORY[0x24BDAC7A8](v29);
  v33 = (char *)v61 - v32;
  MEMORY[0x24BDAC7A8](v31);
  v69 = (char *)v61 - v34;
  v70 = __swift_instantiateConcreteTypeFromMangledName(&qword_256981468);
  v35 = *(_QWORD *)(v70 - 8);
  MEMORY[0x24BDAC7A8](v70);
  OUTLINED_FUNCTION_37_1();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256980078);
  OUTLINED_FUNCTION_1_5();
  MEMORY[0x24BDAC7A8](v36);
  OUTLINED_FUNCTION_2_6();
  MEMORY[0x24BDAC7A8](v37);
  v39 = (char *)v61 - v38;
  type metadata accessor for ListStyleAnswerSnippetModel();
  OUTLINED_FUNCTION_1_5();
  MEMORY[0x24BDAC7A8](v40);
  OUTLINED_FUNCTION_4();
  v79 = v41;
  v80 = v43 - v42;
  v44 = v43 - v42 + v41[9];
  v45 = type metadata accessor for AttributionModel();
  __swift_storeEnumTagSinglePayload((uint64_t)v39, 1, 1, v45);
  sub_23A48A488((uint64_t)v39, v11);
  v76 = v44;
  sub_23A4AA354();
  sub_23A48A4D0((uint64_t)v39);
  v46 = v14[3];
  v74 = v14;
  __swift_project_boxed_opaque_existential_1(v14, v46);
  sub_23A4975F0();
  v47 = v12;
  v48 = v75;
  sub_23A4AAAEC();
  if (v48)
  {
    OUTLINED_FUNCTION_60_0();
    (*(void (**)(uint64_t, uint64_t))(v77 + 8))(v76, v78);
  }
  else
  {
    v75 = v35;
    sub_23A4977C8((uint64_t)&unk_256981470);
    v50 = v49;
    v51 = v69;
    v52 = v70;
    OUTLINED_FUNCTION_4_9();
    v53 = *(void (**)(uint64_t, char *, uint64_t))(v73 + 32);
    v53(v80, v51, v25);
    OUTLINED_FUNCTION_4_9();
    v61[1] = v50;
    v54 = v79;
    v53(v80 + v79[5], v33, v25);
    sub_23A497854((uint64_t)&unk_256981478);
    v55 = v66;
    v56 = v68;
    OUTLINED_FUNCTION_4_9();
    LODWORD(v69) = 1;
    v61[0] = (uint64_t)v53;
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v67 + 32))(v80 + v54[6], v55, v56);
    OUTLINED_FUNCTION_61_0();
    OUTLINED_FUNCTION_4_9();
    v57 = OUTLINED_FUNCTION_46_0(v54[7]);
    v58 = (void (*)(uint64_t))v61[0];
    ((void (*)(uint64_t))v61[0])(v57);
    OUTLINED_FUNCTION_61_0();
    OUTLINED_FUNCTION_4_9();
    v59 = OUTLINED_FUNCTION_46_0(v54[8]);
    v58(v59);
    sub_23A48AF48((uint64_t)&unk_256980CF8);
    OUTLINED_FUNCTION_4_9();
    OUTLINED_FUNCTION_50_1(v76, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v77 + 40));
    sub_23A47DFC8((uint64_t)&unk_256980308);
    OUTLINED_FUNCTION_4_9();
    OUTLINED_FUNCTION_50_1(v80 + v54[10], *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v71 + 32));
    v81 = 7;
    sub_23A4978A0();
    OUTLINED_FUNCTION_4_9();
    (*(void (**)(uint64_t, uint64_t))(v75 + 8))(v47, v52);
    v60 = v80;
    *(_BYTE *)(v80 + v54[11]) = a10;
    sub_23A4978DC(v60, v62);
    OUTLINED_FUNCTION_60_0();
    sub_23A497920(v60);
  }
  OUTLINED_FUNCTION_0();
}

void sub_23A4975C8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t vars0;
  char vars8;

  ListStyleAnswerSnippetModel.init(from:)(a1, a2, a3, a4, a5, a6, a7, a8, vars0, vars8);
}

void sub_23A4975DC()
{
  ListStyleAnswerSnippetModel.encode(to:)();
}

unint64_t sub_23A4975F0()
{
  unint64_t result;

  result = qword_256981418;
  if (!qword_256981418)
  {
    result = MEMORY[0x23B84E2B0](&unk_23A4ADA64, &type metadata for ListStyleAnswerSnippetModel.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256981418);
  }
  return result;
}

void sub_23A49762C(uint64_t a1)
{
  if (!OUTLINED_FUNCTION_5_2(a1))
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256980090);
    OUTLINED_FUNCTION_24_1();
    OUTLINED_FUNCTION_16_3();
  }
  OUTLINED_FUNCTION_17_1();
}

unint64_t sub_23A497684()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  result = qword_256981450;
  if (!qword_256981450)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256981408);
    v2 = MEMORY[0x24BEE12D0];
    sub_23A49762C((uint64_t)&unk_256981428);
    v4 = v3;
    result = MEMORY[0x23B84E2B0](v2, v1, &v4);
    atomic_store(result, (unint64_t *)&qword_256981450);
  }
  return result;
}

unint64_t sub_23A497708()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  result = qword_256981458;
  if (!qword_256981458)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256981408);
    v2 = MEMORY[0x24BEE12A0];
    sub_23A49762C((uint64_t)&unk_256981438);
    v4 = v3;
    result = MEMORY[0x23B84E2B0](v2, v1, &v4);
    atomic_store(result, (unint64_t *)&qword_256981458);
  }
  return result;
}

unint64_t sub_23A49778C()
{
  unint64_t result;

  result = qword_256981460;
  if (!qword_256981460)
  {
    result = MEMORY[0x23B84E2B0](&protocol conformance descriptor for ListStyleAnswerSnippetModel.ListStyle, &type metadata for ListStyleAnswerSnippetModel.ListStyle);
    atomic_store(result, (unint64_t *)&qword_256981460);
  }
  return result;
}

void sub_23A4977C8(uint64_t a1)
{
  if (!OUTLINED_FUNCTION_5_2(a1))
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2569800B0);
    sub_23A49762C((uint64_t)&unk_256981428);
    sub_23A49762C((uint64_t)&unk_256981438);
    OUTLINED_FUNCTION_0_6();
  }
  OUTLINED_FUNCTION_3_3();
}

void sub_23A497854(uint64_t a1)
{
  if (!OUTLINED_FUNCTION_5_2(a1))
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2569800B8);
    sub_23A497684();
    sub_23A497708();
    OUTLINED_FUNCTION_0_6();
  }
  OUTLINED_FUNCTION_3_3();
}

unint64_t sub_23A4978A0()
{
  unint64_t result;

  result = qword_256981480;
  if (!qword_256981480)
  {
    result = MEMORY[0x23B84E2B0](&protocol conformance descriptor for ListStyleAnswerSnippetModel.ListStyle, &type metadata for ListStyleAnswerSnippetModel.ListStyle);
    atomic_store(result, (unint64_t *)&qword_256981480);
  }
  return result;
}

uint64_t sub_23A4978DC(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for ListStyleAnswerSnippetModel();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_23A497920(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata accessor for ListStyleAnswerSnippetModel();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_23A497960()
{
  unint64_t result;

  result = qword_256981488;
  if (!qword_256981488)
  {
    result = MEMORY[0x23B84E2B0](&protocol conformance descriptor for ListStyleAnswerSnippetModel.ListStyle, &type metadata for ListStyleAnswerSnippetModel.ListStyle);
    atomic_store(result, (unint64_t *)&qword_256981488);
  }
  return result;
}

unint64_t sub_23A49799C()
{
  return sub_23A47E0EC((uint64_t)&qword_256980F78);
}

unint64_t sub_23A4979C8()
{
  return sub_23A47E0EC((uint64_t)&unk_256980F10);
}

void sub_23A4979F4()
{
  uint64_t *v0;

  OUTLINED_FUNCTION_49_0();
  *v0 = ListStyleAnswerSnippetModel.title.getter();
  OUTLINED_FUNCTION_60();
}

void sub_23A497A18()
{
  _QWORD *v0;
  uint64_t v1;

  OUTLINED_FUNCTION_49_0();
  ListStyleAnswerSnippetModel.intro.getter();
  *v0 = v1;
  OUTLINED_FUNCTION_60();
}

void sub_23A497A3C()
{
  _QWORD *v0;
  uint64_t v1;

  OUTLINED_FUNCTION_49_0();
  ListStyleAnswerSnippetModel.steps.getter();
  *v0 = v1;
  OUTLINED_FUNCTION_60();
}

void sub_23A497A60()
{
  _QWORD *v0;
  uint64_t v1;

  OUTLINED_FUNCTION_49_0();
  ListStyleAnswerSnippetModel.outro.getter();
  *v0 = v1;
  OUTLINED_FUNCTION_60();
}

void sub_23A497A84()
{
  _QWORD *v0;
  uint64_t v1;

  OUTLINED_FUNCTION_49_0();
  ListStyleAnswerSnippetModel.disclaimer.getter();
  *v0 = v1;
  OUTLINED_FUNCTION_60();
}

void sub_23A497AA8()
{
  ListStyleAnswerSnippetModel.attributionModel.getter();
  OUTLINED_FUNCTION_60();
}

_QWORD *initializeBufferWithCopyOfBuffer for ListStyleAnswerSnippetModel(_QWORD *a1, _QWORD *a2, int *a3)
{
  int v5;
  uint64_t v7;
  void (*v8)(_QWORD *, _QWORD *, uint64_t);
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
    a1 = (_QWORD *)(v21 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569800B0);
    v8 = *(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v7 - 8) + 16);
    v8(a1, a2, v7);
    v8((_QWORD *)((char *)a1 + a3[5]), (_QWORD *)((char *)a2 + a3[5]), v7);
    v9 = a3[6];
    v10 = (char *)a1 + v9;
    v11 = (char *)a2 + v9;
    v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569800B8);
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v12 - 8) + 16))(v10, v11, v12);
    v8((_QWORD *)((char *)a1 + a3[7]), (_QWORD *)((char *)a2 + a3[7]), v7);
    v8((_QWORD *)((char *)a1 + a3[8]), (_QWORD *)((char *)a2 + a3[8]), v7);
    v13 = a3[9];
    v14 = (char *)a1 + v13;
    v15 = (char *)a2 + v13;
    v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569800C0);
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v16 - 8) + 16))(v14, v15, v16);
    v17 = a3[10];
    v18 = (char *)a1 + v17;
    v19 = (char *)a2 + v17;
    v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569800A8);
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v20 - 8) + 16))(v18, v19, v20);
    *((_BYTE *)a1 + a3[11]) = *((_BYTE *)a2 + a3[11]);
  }
  return a1;
}

uint64_t destroy for ListStyleAnswerSnippetModel(uint64_t a1, int *a2)
{
  uint64_t v4;
  void (*v5)(uint64_t, uint64_t);
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569800B0);
  v5 = *(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8);
  v5(a1, v4);
  v5(a1 + a2[5], v4);
  v6 = a1 + a2[6];
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569800B8);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 8))(v6, v7);
  v5(a1 + a2[7], v4);
  v5(a1 + a2[8], v4);
  v8 = a1 + a2[9];
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569800C0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 8))(v8, v9);
  v10 = a1 + a2[10];
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569800A8);
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 8))(v10, v11);
}

uint64_t initializeWithCopy for ListStyleAnswerSnippetModel(uint64_t a1, uint64_t a2, int *a3)
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

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569800B0);
  v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 16);
  v7(a1, a2, v6);
  v7(a1 + a3[5], a2 + a3[5], v6);
  v8 = a3[6];
  v9 = a1 + v8;
  v10 = a2 + v8;
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569800B8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 16))(v9, v10, v11);
  v7(a1 + a3[7], a2 + a3[7], v6);
  v7(a1 + a3[8], a2 + a3[8], v6);
  v12 = a3[9];
  v13 = a1 + v12;
  v14 = a2 + v12;
  v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569800C0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v15 - 8) + 16))(v13, v14, v15);
  v16 = a3[10];
  v17 = a1 + v16;
  v18 = a2 + v16;
  v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569800A8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v19 - 8) + 16))(v17, v18, v19);
  *(_BYTE *)(a1 + a3[11]) = *(_BYTE *)(a2 + a3[11]);
  return a1;
}

uint64_t assignWithCopy for ListStyleAnswerSnippetModel(uint64_t a1, uint64_t a2, int *a3)
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

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569800B0);
  v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 24);
  v7(a1, a2, v6);
  v7(a1 + a3[5], a2 + a3[5], v6);
  v8 = a3[6];
  v9 = a1 + v8;
  v10 = a2 + v8;
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569800B8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 24))(v9, v10, v11);
  v7(a1 + a3[7], a2 + a3[7], v6);
  v7(a1 + a3[8], a2 + a3[8], v6);
  v12 = a3[9];
  v13 = a1 + v12;
  v14 = a2 + v12;
  v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569800C0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v15 - 8) + 24))(v13, v14, v15);
  v16 = a3[10];
  v17 = a1 + v16;
  v18 = a2 + v16;
  v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569800A8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v19 - 8) + 24))(v17, v18, v19);
  *(_BYTE *)(a1 + a3[11]) = *(_BYTE *)(a2 + a3[11]);
  return a1;
}

uint64_t initializeWithTake for ListStyleAnswerSnippetModel(uint64_t a1, uint64_t a2, int *a3)
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

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569800B0);
  v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 32);
  v7(a1, a2, v6);
  v7(a1 + a3[5], a2 + a3[5], v6);
  v8 = a3[6];
  v9 = a1 + v8;
  v10 = a2 + v8;
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569800B8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 32))(v9, v10, v11);
  v7(a1 + a3[7], a2 + a3[7], v6);
  v7(a1 + a3[8], a2 + a3[8], v6);
  v12 = a3[9];
  v13 = a1 + v12;
  v14 = a2 + v12;
  v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569800C0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v15 - 8) + 32))(v13, v14, v15);
  v16 = a3[10];
  v17 = a1 + v16;
  v18 = a2 + v16;
  v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569800A8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v19 - 8) + 32))(v17, v18, v19);
  *(_BYTE *)(a1 + a3[11]) = *(_BYTE *)(a2 + a3[11]);
  return a1;
}

uint64_t assignWithTake for ListStyleAnswerSnippetModel(uint64_t a1, uint64_t a2, int *a3)
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

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569800B0);
  v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 40);
  v7(a1, a2, v6);
  v7(a1 + a3[5], a2 + a3[5], v6);
  v8 = a3[6];
  v9 = a1 + v8;
  v10 = a2 + v8;
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569800B8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 40))(v9, v10, v11);
  v7(a1 + a3[7], a2 + a3[7], v6);
  v7(a1 + a3[8], a2 + a3[8], v6);
  v12 = a3[9];
  v13 = a1 + v12;
  v14 = a2 + v12;
  v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569800C0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v15 - 8) + 40))(v13, v14, v15);
  v16 = a3[10];
  v17 = a1 + v16;
  v18 = a2 + v16;
  v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569800A8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v19 - 8) + 40))(v17, v18, v19);
  *(_BYTE *)(a1 + a3[11]) = *(_BYTE *)(a2 + a3[11]);
  return a1;
}

uint64_t getEnumTagSinglePayload for ListStyleAnswerSnippetModel()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_23A498240(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char v9;
  uint64_t v10;
  uint64_t v11;
  char v12;
  uint64_t v13;
  char v14;
  uint64_t v15;
  unsigned int v17;

  __swift_instantiateConcreteTypeFromMangledName(&qword_2569800B0);
  OUTLINED_FUNCTION_17_0();
  if (v9)
  {
    v7 = v6;
    v8 = a1;
    return __swift_getEnumTagSinglePayload(v8, a2, v7);
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_2569800B8);
  OUTLINED_FUNCTION_17_0();
  if (v9)
  {
    v7 = v10;
    v11 = a3[6];
LABEL_13:
    v8 = a1 + v11;
    return __swift_getEnumTagSinglePayload(v8, a2, v7);
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_2569800C0);
  OUTLINED_FUNCTION_17_0();
  if (v12)
  {
    v7 = v13;
    v11 = a3[9];
    goto LABEL_13;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_2569800A8);
  OUTLINED_FUNCTION_17_0();
  if (v14)
  {
    v7 = v15;
    v11 = a3[10];
    goto LABEL_13;
  }
  v17 = *(unsigned __int8 *)(a1 + a3[11]);
  if (v17 >= 2)
    return v17 - 1;
  else
    return 0;
}

uint64_t storeEnumTagSinglePayload for ListStyleAnswerSnippetModel()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

void sub_23A498320(uint64_t a1, uint64_t a2, uint64_t a3, int *a4)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char v10;
  uint64_t v11;
  uint64_t v12;
  char v13;
  uint64_t v14;
  char v15;
  uint64_t v16;

  __swift_instantiateConcreteTypeFromMangledName(&qword_2569800B0);
  OUTLINED_FUNCTION_16_1();
  if (v10)
  {
    v8 = v7;
    v9 = a1;
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_2569800B8);
    OUTLINED_FUNCTION_16_1();
    if (v10)
    {
      v8 = v11;
      v12 = a4[6];
    }
    else
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_2569800C0);
      OUTLINED_FUNCTION_16_1();
      if (v13)
      {
        v8 = v14;
        v12 = a4[9];
      }
      else
      {
        __swift_instantiateConcreteTypeFromMangledName(&qword_2569800A8);
        OUTLINED_FUNCTION_16_1();
        if (!v15)
        {
          *(_BYTE *)(a1 + a4[11]) = a2 + 1;
          OUTLINED_FUNCTION_5();
          return;
        }
        v8 = v16;
        v12 = a4[10];
      }
    }
    v9 = a1 + v12;
  }
  __swift_storeEnumTagSinglePayload(v9, a2, a2, v8);
}

void sub_23A4983EC()
{
  unint64_t v0;
  unint64_t v1;
  unint64_t v2;
  unint64_t v3;

  sub_23A48BFC4(319, (unint64_t *)&qword_2569814F8, &qword_256980090);
  if (v0 <= 0x3F)
  {
    sub_23A48BFC4(319, qword_256981500, &qword_256981408);
    if (v1 <= 0x3F)
    {
      sub_23A48BFC4(319, &qword_256980D88, &qword_256980078);
      if (v2 <= 0x3F)
      {
        sub_23A47E684();
        if (v3 <= 0x3F)
          swift_initStructMetadata();
      }
    }
  }
}

ValueMetadata *type metadata accessor for ListStyleAnswerSnippetModel.ListStyle()
{
  return &type metadata for ListStyleAnswerSnippetModel.ListStyle;
}

uint64_t getEnumTagSinglePayload for ListStyleAnswerSnippetModel.CodingKeys(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  int v5;
  unsigned int v6;
  BOOL v7;

  if (!a2)
  {
    v5 = -1;
    return (v5 + 1);
  }
  if (a2 >= 0xF9)
  {
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
      if (!v4)
        goto LABEL_17;
    }
    else if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
    }
    else
    {
      v4 = a1[1];
      if (!a1[1])
        goto LABEL_17;
    }
    v5 = (*a1 | (v4 << 8)) - 8;
    return (v5 + 1);
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 8;
  v5 = v6 - 8;
  if (!v7)
    v5 = -1;
  return (v5 + 1);
}

uint64_t storeEnumTagSinglePayload for ListStyleAnswerSnippetModel.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_23A4985D0 + 4 * byte_23A4AD63D[v4]))();
  *a1 = a2 + 7;
  return ((uint64_t (*)(void))((char *)sub_23A498604 + 4 * byte_23A4AD638[v4]))();
}

uint64_t sub_23A498604(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_23A49860C(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x23A498614);
  return result;
}

uint64_t sub_23A498620(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x23A498628);
  *(_BYTE *)result = a2 + 7;
  return result;
}

uint64_t sub_23A49862C(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23A498634(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for ListStyleAnswerSnippetModel.CodingKeys()
{
  return &type metadata for ListStyleAnswerSnippetModel.CodingKeys;
}

uint64_t _s19DeviceExpertIntents27ListStyleAnswerSnippetModelV9ListStyleOwst_0(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_23A49869C + 4 * byte_23A4AD647[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_23A4986D0 + 4 * byte_23A4AD642[v4]))();
}

uint64_t sub_23A4986D0(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_23A4986D8(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x23A4986E0);
  return result;
}

uint64_t sub_23A4986EC(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x23A4986F4);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_23A4986F8(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23A498700(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for ListStyleAnswerSnippetModel.ListStyle.CodingKeys()
{
  return &type metadata for ListStyleAnswerSnippetModel.ListStyle.CodingKeys;
}

ValueMetadata *type metadata accessor for ListStyleAnswerSnippetModel.ListStyle.OrderedCodingKeys()
{
  return &type metadata for ListStyleAnswerSnippetModel.ListStyle.OrderedCodingKeys;
}

ValueMetadata *type metadata accessor for ListStyleAnswerSnippetModel.ListStyle.UnorderedCodingKeys()
{
  return &type metadata for ListStyleAnswerSnippetModel.ListStyle.UnorderedCodingKeys;
}

unint64_t sub_23A498740()
{
  unint64_t result;

  result = qword_256981548;
  if (!qword_256981548)
  {
    result = MEMORY[0x23B84E2B0](&unk_23A4AD984, &type metadata for ListStyleAnswerSnippetModel.ListStyle.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256981548);
  }
  return result;
}

unint64_t sub_23A498780()
{
  unint64_t result;

  result = qword_256981550;
  if (!qword_256981550)
  {
    result = MEMORY[0x23B84E2B0](&unk_23A4ADA3C, &type metadata for ListStyleAnswerSnippetModel.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256981550);
  }
  return result;
}

unint64_t sub_23A4987C0()
{
  unint64_t result;

  result = qword_256981558;
  if (!qword_256981558)
  {
    result = MEMORY[0x23B84E2B0](&unk_23A4AD9AC, &type metadata for ListStyleAnswerSnippetModel.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256981558);
  }
  return result;
}

unint64_t sub_23A498800()
{
  unint64_t result;

  result = qword_256981560;
  if (!qword_256981560)
  {
    result = MEMORY[0x23B84E2B0](&unk_23A4AD9D4, &type metadata for ListStyleAnswerSnippetModel.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256981560);
  }
  return result;
}

unint64_t sub_23A498840()
{
  unint64_t result;

  result = qword_256981568;
  if (!qword_256981568)
  {
    result = MEMORY[0x23B84E2B0](&unk_23A4AD8A4, &type metadata for ListStyleAnswerSnippetModel.ListStyle.OrderedCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256981568);
  }
  return result;
}

unint64_t sub_23A498880()
{
  unint64_t result;

  result = qword_256981570;
  if (!qword_256981570)
  {
    result = MEMORY[0x23B84E2B0](&unk_23A4AD8CC, &type metadata for ListStyleAnswerSnippetModel.ListStyle.OrderedCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256981570);
  }
  return result;
}

unint64_t sub_23A4988C0()
{
  unint64_t result;

  result = qword_256981578;
  if (!qword_256981578)
  {
    result = MEMORY[0x23B84E2B0](&unk_23A4AD854, &type metadata for ListStyleAnswerSnippetModel.ListStyle.UnorderedCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256981578);
  }
  return result;
}

unint64_t sub_23A498900()
{
  unint64_t result;

  result = qword_256981580;
  if (!qword_256981580)
  {
    result = MEMORY[0x23B84E2B0](&unk_23A4AD87C, &type metadata for ListStyleAnswerSnippetModel.ListStyle.UnorderedCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256981580);
  }
  return result;
}

unint64_t sub_23A498940()
{
  unint64_t result;

  result = qword_256981588;
  if (!qword_256981588)
  {
    result = MEMORY[0x23B84E2B0](&unk_23A4AD8F4, &type metadata for ListStyleAnswerSnippetModel.ListStyle.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256981588);
  }
  return result;
}

unint64_t sub_23A498980()
{
  unint64_t result;

  result = qword_256981590;
  if (!qword_256981590)
  {
    result = MEMORY[0x23B84E2B0](&unk_23A4AD91C, &type metadata for ListStyleAnswerSnippetModel.ListStyle.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256981590);
  }
  return result;
}

uint64_t sub_23A4989BC(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for TextRun(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t OUTLINED_FUNCTION_0_16()
{
  return type metadata accessor for ListStyleAnswerSnippetModel();
}

uint64_t OUTLINED_FUNCTION_1_12()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 144) + 8))(v0, v1);
}

uint64_t OUTLINED_FUNCTION_3_11()
{
  return sub_23A4AAA98();
}

uint64_t OUTLINED_FUNCTION_4_9()
{
  return sub_23A4AAA44();
}

uint64_t OUTLINED_FUNCTION_14_7()
{
  return sub_23A4AA36C();
}

uint64_t OUTLINED_FUNCTION_16_6()
{
  return sub_23A4AA378();
}

uint64_t OUTLINED_FUNCTION_20_3()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_26_4()
{
  return sub_23A4AA354();
}

uint64_t OUTLINED_FUNCTION_27_3()
{
  return sub_23A4AA36C();
}

uint64_t OUTLINED_FUNCTION_30_2()
{
  return swift_unknownObjectRelease();
}

void OUTLINED_FUNCTION_31_2(uint64_t a1@<X8>, uint64_t a2)
{
  uint64_t v2;

  *(_QWORD *)(v2 - 240) = (char *)&a2 - ((a1 + 15) & 0xFFFFFFFFFFFFFFF0);
}

uint64_t OUTLINED_FUNCTION_33_1@<X0>(uint64_t a1@<X8>)
{
  uint64_t (*v1)(uint64_t, uint64_t);
  uint64_t v2;
  uint64_t v3;

  return v1(v2 + a1, v3);
}

void OUTLINED_FUNCTION_34_1()
{
  sub_23A4A6C04();
}

uint64_t OUTLINED_FUNCTION_35_1()
{
  return sub_23A4AA354();
}

uint64_t OUTLINED_FUNCTION_39_1()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_40_1()
{
  return sub_23A4AAA5C();
}

uint64_t OUTLINED_FUNCTION_43_1()
{
  uint64_t v0;
  uint64_t v1;

  return sub_23A4978DC(v0, v1);
}

uint64_t OUTLINED_FUNCTION_44_1()
{
  uint64_t v0;
  uint64_t v1;

  return sub_23A4978DC(v0, v1);
}

uint64_t OUTLINED_FUNCTION_45_1()
{
  uint64_t v0;
  uint64_t v1;

  return sub_23A4978DC(v1, v0);
}

uint64_t OUTLINED_FUNCTION_46_0@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return *(_QWORD *)(v1 - 104) + a1;
}

uint64_t OUTLINED_FUNCTION_48_1()
{
  return sub_23A4AAAD4();
}

uint64_t OUTLINED_FUNCTION_49_1()
{
  return sub_23A4AA834();
}

uint64_t OUTLINED_FUNCTION_50_1@<X0>(uint64_t a1@<X0>, uint64_t (*a2)(uint64_t, uint64_t, uint64_t)@<X8>)
{
  uint64_t v2;
  uint64_t v3;

  return a2(a1, v3, v2);
}

uint64_t OUTLINED_FUNCTION_51_1(uint64_t a1)
{
  uint64_t v1;

  return sub_23A48A488(a1, v1);
}

uint64_t OUTLINED_FUNCTION_53_0()
{
  uint64_t (*v0)(uint64_t, uint64_t);
  uint64_t v1;
  uint64_t v2;

  return v0(v2, v1);
}

uint64_t OUTLINED_FUNCTION_54_0()
{
  return sub_23A4AA21C();
}

unint64_t OUTLINED_FUNCTION_57_0()
{
  uint64_t v0;

  *(_BYTE *)(v0 - 65) = 1;
  return sub_23A495F3C();
}

BOOL OUTLINED_FUNCTION_58_0()
{
  uint64_t v0;

  return v0 != 0;
}

uint64_t OUTLINED_FUNCTION_60_0()
{
  uint64_t v0;

  return __swift_destroy_boxed_opaque_existential_1(*(_QWORD *)(v0 - 152));
}

uint64_t OUTLINED_FUNCTION_61_0()
{
  uint64_t v0;

  return v0;
}

uint64_t sub_23A498BE8(uint64_t a1)
{
  return OUTLINED_FUNCTION_0_17(a1, qword_2569815A0);
}

uint64_t static Logger.analytics.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_23A498C64(&qword_25697FF38, (uint64_t)qword_2569815A0, a1);
}

uint64_t sub_23A498C24(uint64_t a1)
{
  return sub_23A498CEC(a1, qword_2569815B8);
}

uint64_t static Logger.default.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_23A498C64(&qword_25697FF40, (uint64_t)qword_2569815B8, a1);
}

uint64_t sub_23A498C64@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v5;
  uint64_t v6;

  if (*a1 != -1)
    swift_once();
  v5 = sub_23A4AA6F0();
  v6 = __swift_project_value_buffer(v5, a2);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a3, v6, v5);
}

uint64_t sub_23A498CCC(uint64_t a1)
{
  return OUTLINED_FUNCTION_0_17(a1, qword_2569815D0);
}

uint64_t sub_23A498CEC(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = sub_23A4AA6F0();
  __swift_allocate_value_buffer(v3, a2);
  __swift_project_value_buffer(v3, (uint64_t)a2);
  return sub_23A4AA6E4();
}

uint64_t static Logger.tellMeFlow.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_23A498C64(&qword_25697FF48, (uint64_t)qword_2569815D0, a1);
}

uint64_t OUTLINED_FUNCTION_0_17(uint64_t a1, uint64_t *a2)
{
  return sub_23A498CEC(a1, a2);
}

uint64_t sub_23A498D84(unsigned __int8 a1, unsigned __int8 a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char v8;

  v3 = sub_23A4813D0(a1);
  v5 = v4;
  if (v3 == sub_23A4813D0(a2) && v5 == v6)
    v8 = 1;
  else
    v8 = sub_23A4AAAB0();
  OUTLINED_FUNCTION_39_1();
  OUTLINED_FUNCTION_52();
  return v8 & 1;
}

void sub_23A498E00(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  v2 = *(void **)(v1 + 248);
  *(_QWORD *)(v1 + 248) = a1;

}

void sub_23A498E0C(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  v2 = *(void **)(v1 + 256);
  *(_QWORD *)(v1 + 256) = a1;

}

uint64_t sub_23A498E18@<X0>(uint64_t *a1@<X8>)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v2 = v1[33];
  v3 = v1[34];
  v4 = v1[35];
  v5 = v1[36];
  *a1 = v2;
  a1[1] = v3;
  a1[2] = v4;
  a1[3] = v5;
  return sub_23A49F834(v2, v3);
}

uint64_t sub_23A498E2C(_OWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  __int128 v4;

  v3 = *(_QWORD *)(v1 + 264);
  v2 = *(_QWORD *)(v1 + 272);
  v4 = a1[1];
  *(_OWORD *)(v1 + 264) = *a1;
  *(_OWORD *)(v1 + 280) = v4;
  return sub_23A49DEDC(v3, v2);
}

uint64_t DeviceExpertTellMeGeneratedFlow.__allocating_init(outputPublisher:assistantSupportClient:analyticsManager:biomeEventSender:siriKitEventSender:responseGenerator:deviceState:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, __int128 *a6, __int128 *a7)
{
  uint64_t v14;

  v14 = OUTLINED_FUNCTION_117();
  DeviceExpertTellMeGeneratedFlow.init(outputPublisher:assistantSupportClient:analyticsManager:biomeEventSender:siriKitEventSender:responseGenerator:deviceState:)(a1, a2, a3, a4, a5, a6, a7);
  return v14;
}

uint64_t DeviceExpertTellMeGeneratedFlow.init(outputPublisher:assistantSupportClient:analyticsManager:biomeEventSender:siriKitEventSender:responseGenerator:deviceState:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, __int128 *a6, __int128 *a7)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v16;
  uint64_t v17;
  __int128 v19;

  v8 = v7;
  v16 = sub_23A4AA5DC();
  MEMORY[0x24BDAC7A8](v16);
  *(_OWORD *)(v7 + 248) = 0u;
  *(_OWORD *)(v7 + 264) = 0u;
  *(_OWORD *)(v7 + 280) = 0u;
  sub_23A49F7F4(a1, v7 + 16);
  *(_QWORD *)(v7 + 56) = a2;
  type metadata accessor for DeviceExpertCATsSimple();
  swift_retain();
  sub_23A4AA5D0();
  *(_QWORD *)(v7 + 64) = sub_23A4AA5AC();
  *(_QWORD *)(v7 + 72) = a3;
  sub_23A49F7F4(a4, v7 + 80);
  sub_23A49F7F4(a5, v7 + 120);
  sub_23A4AA558();
  swift_release();
  __swift_destroy_boxed_opaque_existential_1(a5);
  __swift_destroy_boxed_opaque_existential_1(a4);
  __swift_destroy_boxed_opaque_existential_1(a1);
  type metadata accessor for LocalizedResourceProvider();
  v17 = OUTLINED_FUNCTION_117();
  sub_23A499030(&v19, v17 + 16);
  *(_QWORD *)(v8 + 160) = v17;
  sub_23A499030(a6, v8 + 168);
  sub_23A499030(a7, v8 + 208);
  return v8;
}

uint64_t sub_23A499030(__int128 *a1, uint64_t a2)
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

void sub_23A499048()
{
  type metadata accessor for DeviceExpertTellMeGeneratedFlow();
  sub_23A4990B4();
  sub_23A4AA3A8();
  OUTLINED_FUNCTION_3_3();
}

uint64_t type metadata accessor for DeviceExpertTellMeGeneratedFlow()
{
  return objc_opt_self();
}

unint64_t sub_23A4990B4()
{
  unint64_t result;
  uint64_t v1;

  result = qword_2569815E8;
  if (!qword_2569815E8)
  {
    v1 = type metadata accessor for DeviceExpertTellMeGeneratedFlow();
    result = MEMORY[0x23B84E2B0](&protocol conformance descriptor for DeviceExpertTellMeGeneratedFlow, v1);
    atomic_store(result, &qword_2569815E8);
  }
  return result;
}

uint64_t sub_23A4990F0(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v2[46] = a1;
  v2[47] = v1;
  v3 = sub_23A4AA3E4();
  v2[48] = v3;
  v2[49] = *(_QWORD *)(v3 - 8);
  v2[50] = OUTLINED_FUNCTION_35();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256980DE8);
  v2[51] = OUTLINED_FUNCTION_35();
  v4 = sub_23A4AA450();
  v2[52] = v4;
  v2[53] = *(_QWORD *)(v4 - 8);
  v2[54] = OUTLINED_FUNCTION_35();
  v5 = sub_23A4AA444();
  v2[55] = v5;
  v2[56] = *(_QWORD *)(v5 - 8);
  v2[57] = OUTLINED_FUNCTION_35();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2569802A0);
  v2[58] = OUTLINED_FUNCTION_35();
  v2[59] = type metadata accessor for TellMeGeneratedSnippetModels();
  v2[60] = OUTLINED_FUNCTION_6_0();
  v2[61] = OUTLINED_FUNCTION_6_0();
  v2[62] = OUTLINED_FUNCTION_6_0();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256980070);
  v2[63] = OUTLINED_FUNCTION_6_0();
  v2[64] = OUTLINED_FUNCTION_6_0();
  v2[65] = OUTLINED_FUNCTION_6_0();
  v2[66] = OUTLINED_FUNCTION_6_0();
  v2[67] = OUTLINED_FUNCTION_6_0();
  v2[68] = OUTLINED_FUNCTION_6_0();
  v2[69] = OUTLINED_FUNCTION_6_0();
  v2[70] = OUTLINED_FUNCTION_6_0();
  v2[71] = OUTLINED_FUNCTION_6_0();
  v2[72] = type metadata accessor for SnippetResponseComponents();
  v2[73] = OUTLINED_FUNCTION_35();
  __swift_instantiateConcreteTypeFromMangledName(&qword_25697FF70);
  v2[74] = OUTLINED_FUNCTION_6_0();
  v2[75] = OUTLINED_FUNCTION_6_0();
  v6 = sub_23A4AA27C();
  v2[76] = v6;
  v2[77] = *(_QWORD *)(v6 - 8);
  v2[78] = OUTLINED_FUNCTION_6_0();
  v2[79] = OUTLINED_FUNCTION_6_0();
  v7 = sub_23A4AA294();
  v2[80] = v7;
  v2[81] = *(_QWORD *)(v7 - 8);
  v2[82] = OUTLINED_FUNCTION_35();
  v8 = sub_23A4AA2AC();
  v2[83] = v8;
  v2[84] = *(_QWORD *)(v8 - 8);
  v2[85] = OUTLINED_FUNCTION_35();
  v9 = sub_23A4A9F7C();
  v2[86] = v9;
  v2[87] = *(_QWORD *)(v9 - 8);
  v2[88] = OUTLINED_FUNCTION_35();
  OUTLINED_FUNCTION_24();
  return OUTLINED_FUNCTION_1_0();
}

void sub_23A499300()
{
  NSObject *v0;
  _QWORD *v1;
  os_log_type_t v2;
  uint64_t v3;
  os_log_type_t v4;
  uint8_t *v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t);
  uint64_t v13;
  void *v14;
  id v15;
  NSObject *v16;
  os_log_type_t v17;
  uint8_t *v18;
  uint64_t v19;
  unint64_t v20;
  os_log_type_t v21;
  uint8_t *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  NSObject *v26;
  uint64_t v27;
  uint64_t v28;
  os_log_type_t v29;
  uint8_t *v30;
  NSObject *v31;
  os_log_type_t v32;
  uint8_t *v33;
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
  _QWORD *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  void *v49;
  NSObject *v50;
  uint64_t v51;

  if (qword_25697FF48 != -1)
    swift_once();
  v3 = OUTLINED_FUNCTION_39();
  v1[89] = __swift_project_value_buffer(v3, (uint64_t)qword_2569815D0);
  OUTLINED_FUNCTION_83_0();
  v4 = OUTLINED_FUNCTION_69_0();
  if (OUTLINED_FUNCTION_13_5(v4))
  {
    v5 = (uint8_t *)OUTLINED_FUNCTION_3_0();
    *(_WORD *)v5 = 0;
    OUTLINED_FUNCTION_55_0(&dword_23A470000, v0, v2, "DeviceExpertTellMeGeneratedFlow#execute", v5);
    OUTLINED_FUNCTION_0_0();
  }

  sub_23A4AA420();
  __swift_project_boxed_opaque_existential_1(v1 + 13, v1[16]);
  OUTLINED_FUNCTION_103();
  v6 = sub_23A4AA4A4();
  if (v7)
  {
    v8 = v6;
    v9 = v7;
  }
  else
  {
    sub_23A4A9F70();
    v8 = sub_23A4A9F64();
    v9 = v10;
    v11 = OUTLINED_FUNCTION_103();
    v12(v11);
  }
  v1[91] = v9;
  v1[90] = v8;
  v13 = v1[47];
  v14 = *(void **)(v13 + 248);
  v1[92] = v14;
  if (v14 && (v8 = *(NSObject **)(v13 + 256), (v1[93] = v8) != 0))
  {
    v15 = v14;
    v50 = v8;
    v16 = OUTLINED_FUNCTION_82_0();
    v17 = sub_23A4AA8C4();
    v49 = v15;
    if (os_log_type_enabled(v16, v17))
    {
      v18 = (uint8_t *)OUTLINED_FUNCTION_3_0();
      v51 = OUTLINED_FUNCTION_3_0();
      *(_DWORD *)v18 = 136315138;
      v19 = sub_23A4AA6CC();
      v1[45] = sub_23A49D6D8(v19, v20, &v51);
      sub_23A4AA900();
      OUTLINED_FUNCTION_52();

      OUTLINED_FUNCTION_12(&dword_23A470000, v16, v17, "DeviceExpertTellMeGeneratedFlow#execute - Search request utterance \"%s\"", v18);
      OUTLINED_FUNCTION_42_1();
      OUTLINED_FUNCTION_0_0();
    }

    v23 = v1[85];
    v24 = v1[84];
    v25 = v1[83];
    v26 = v1[82];
    v27 = v1[81];
    sub_23A4AA660();
    sub_23A4AA2A0();
    (*(void (**)(uint64_t, uint64_t))(v24 + 8))(v23, v25);
    v28 = sub_23A4A9FAC();
    v1[94] = v28;
    OUTLINED_FUNCTION_31(*(uint64_t (**)(uint64_t, uint64_t))(v27 + 8));
    if (!*(_QWORD *)(v28 + 16))
    {
      OUTLINED_FUNCTION_25_2();
      OUTLINED_FUNCTION_22_1();
      v31 = OUTLINED_FUNCTION_82_0();
      v32 = sub_23A4AA8D0();
      if (os_log_type_enabled(v31, v32))
      {
        v33 = (uint8_t *)OUTLINED_FUNCTION_3_0();
        *(_WORD *)v33 = 0;
        OUTLINED_FUNCTION_55_0(&dword_23A470000, v31, v32, "DeviceExpertTellMeGeneratedFlow#execute() No results available", v33);
        OUTLINED_FUNCTION_0_0();
      }
      v35 = v1[53];
      v34 = v1[54];
      v37 = v1[51];
      v36 = v1[52];
      v38 = v1[49];
      v39 = v1[50];
      v40 = v1[47];
      v48 = v1[48];

      __swift_project_boxed_opaque_existential_1((_QWORD *)(v40 + 120), *(_QWORD *)(v40 + 144));
      OUTLINED_FUNCTION_79_0();
      (*(void (**)(uint64_t, _QWORD, uint64_t))(v35 + 104))(v34, *MEMORY[0x24BE97878], v36);
      v41 = OUTLINED_FUNCTION_78_0();
      OUTLINED_FUNCTION_98(v37, v42, v43, v41);
      (*(void (**)(uint64_t, _QWORD, uint64_t))(v38 + 104))(v39, *MEMORY[0x24BE97068], v48);
      sub_23A48CAD0(v34, v37, v39, 0);
      sub_23A4AA3D8();
      OUTLINED_FUNCTION_91_0();
      sub_23A4AA468();

      __swift_destroy_boxed_opaque_existential_1((uint64_t)(v1 + 13));
      OUTLINED_FUNCTION_99();
      OUTLINED_FUNCTION_79();
      OUTLINED_FUNCTION_93();
      OUTLINED_FUNCTION_83();
      OUTLINED_FUNCTION_76();
      OUTLINED_FUNCTION_85();
      OUTLINED_FUNCTION_61();
      OUTLINED_FUNCTION_74();
      OUTLINED_FUNCTION_82();
      OUTLINED_FUNCTION_72();
      OUTLINED_FUNCTION_68();
      OUTLINED_FUNCTION_71();
      OUTLINED_FUNCTION_69();
      OUTLINED_FUNCTION_66();
      OUTLINED_FUNCTION_65();
      OUTLINED_FUNCTION_64();
      OUTLINED_FUNCTION_63();
      OUTLINED_FUNCTION_62();
      OUTLINED_FUNCTION_70();
      OUTLINED_FUNCTION_98_0();
      OUTLINED_FUNCTION_126();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      OUTLINED_FUNCTION_97_0();
      __asm { BR              X0 }
    }
    swift_bridgeObjectRetain();
    OUTLINED_FUNCTION_82_0();
    v29 = OUTLINED_FUNCTION_69_0();
    if (OUTLINED_FUNCTION_37_2(v29))
    {
      v30 = (uint8_t *)OUTLINED_FUNCTION_3_0();
      *(_DWORD *)v30 = 134217984;
      v1[44] = *(_QWORD *)(v28 + 16);
      sub_23A4AA900();
      OUTLINED_FUNCTION_22_1();
      OUTLINED_FUNCTION_12(&dword_23A470000, v26, (os_log_type_t)v23, "DeviceExpertTellMeGeneratedFlow#execute - Found %ld result candidates", v30);
      OUTLINED_FUNCTION_0_0();
    }
    OUTLINED_FUNCTION_22_1();

    v45 = (_QWORD *)swift_task_alloc();
    v1[95] = v45;
    *v45 = v1;
    v45[1] = sub_23A499978;
    OUTLINED_FUNCTION_97_0();
    sub_23A49A9D4(v46, v47);
  }
  else
  {
    OUTLINED_FUNCTION_82_0();
    v21 = OUTLINED_FUNCTION_44();
    if (os_log_type_enabled(v8, v21))
    {
      v22 = (uint8_t *)OUTLINED_FUNCTION_3_0();
      *(_WORD *)v22 = 0;
      OUTLINED_FUNCTION_55_0(&dword_23A470000, v8, v21, "DeviceExpertTellMeGeneratedFlow#execute() Invalid pommes response or experience. Error executing request", v22);
      OUTLINED_FUNCTION_0_0();
    }

    sub_23A4AA9CC();
    OUTLINED_FUNCTION_97_0();
  }
}

uint64_t sub_23A499978()
{
  OUTLINED_FUNCTION_47();
  OUTLINED_FUNCTION_45();
  OUTLINED_FUNCTION_24();
  return OUTLINED_FUNCTION_1_0();
}

uint64_t sub_23A4999AC()
{
  uint64_t v0;
  uint64_t v1;
  NSObject *v2;
  uint64_t v3;
  os_log_type_t v4;
  _BOOL4 v5;
  uint64_t v6;
  uint8_t *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t, uint64_t);
  NSObject *v13;
  os_log_type_t v14;
  _BOOL4 v15;
  uint64_t v16;
  uint64_t v17;
  uint8_t *v18;
  uint64_t v19;
  unint64_t v20;
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
  void (*v32)(_QWORD, _QWORD);
  _QWORD *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  _QWORD *v37;
  void *v38;
  void *v39;
  uint64_t v40;
  uint64_t v41;

  v1 = *(_QWORD *)(v0 + 600);
  if (__swift_getEnumTagSinglePayload(v1, 1, *(_QWORD *)(v0 + 608)) == 1)
  {
    v2 = *(NSObject **)(v0 + 712);
    v3 = swift_bridgeObjectRelease();
    OUTLINED_FUNCTION_92_0(v3, &qword_25697FF70);
    OUTLINED_FUNCTION_96_0();
    sub_23A4AA6D8();
    v4 = OUTLINED_FUNCTION_44();
    v5 = OUTLINED_FUNCTION_37_2(v4);
    v6 = *(_QWORD *)(v0 + 752);
    if (v5)
    {
      v7 = (uint8_t *)OUTLINED_FUNCTION_3_0();
      *(_DWORD *)v7 = 134217984;
      v8 = *(_QWORD *)(v6 + 16);
      OUTLINED_FUNCTION_60_1();
      *(_QWORD *)(v0 + 328) = v8;
      sub_23A4AA900();
      OUTLINED_FUNCTION_60_1();
      OUTLINED_FUNCTION_12(&dword_23A470000, v2, (os_log_type_t)v1, "DeviceExpertTellMeGeneratedFlow#execute() Unable to determine best result from candidates (%ld)", v7);
      OUTLINED_FUNCTION_0_0();
    }
    OUTLINED_FUNCTION_113();

    v38 = *(void **)(v0 + 744);
    v39 = *(void **)(v0 + 736);
    v22 = *(_QWORD *)(v0 + 424);
    v21 = *(_QWORD *)(v0 + 432);
    v24 = *(_QWORD *)(v0 + 408);
    v23 = *(_QWORD *)(v0 + 416);
    v26 = *(_QWORD *)(v0 + 392);
    v25 = *(_QWORD *)(v0 + 400);
    v27 = *(_QWORD *)(v0 + 384);
    __swift_project_boxed_opaque_existential_1((_QWORD *)(*(_QWORD *)(v0 + 376) + 120), *(_QWORD *)(*(_QWORD *)(v0 + 376) + 144));
    OUTLINED_FUNCTION_79_0();
    (*(void (**)(uint64_t, _QWORD, uint64_t))(v22 + 104))(v21, *MEMORY[0x24BE97878], v23);
    v28 = OUTLINED_FUNCTION_78_0();
    OUTLINED_FUNCTION_98(v24, v29, v30, v28);
    (*(void (**)(uint64_t, _QWORD, uint64_t))(v26 + 104))(v25, *MEMORY[0x24BE97068], v27);
    sub_23A48CAD0(v21, v24, v25, 1);
    sub_23A4AA3D8();
    OUTLINED_FUNCTION_91_0();
    sub_23A4AA468();

    OUTLINED_FUNCTION_5_9();
    __swift_destroy_boxed_opaque_existential_1(v0 + 104);
    OUTLINED_FUNCTION_82();
    OUTLINED_FUNCTION_79();
    OUTLINED_FUNCTION_99();
    OUTLINED_FUNCTION_93();
    OUTLINED_FUNCTION_83();
    OUTLINED_FUNCTION_76();
    OUTLINED_FUNCTION_85();
    OUTLINED_FUNCTION_61();
    OUTLINED_FUNCTION_74();
    OUTLINED_FUNCTION_78();
    OUTLINED_FUNCTION_73();
    OUTLINED_FUNCTION_72();
    OUTLINED_FUNCTION_68();
    OUTLINED_FUNCTION_71();
    OUTLINED_FUNCTION_69();
    OUTLINED_FUNCTION_66();
    OUTLINED_FUNCTION_65();
    OUTLINED_FUNCTION_64();
    OUTLINED_FUNCTION_63();
    OUTLINED_FUNCTION_62();
    OUTLINED_FUNCTION_70();
    OUTLINED_FUNCTION_98_0();
    OUTLINED_FUNCTION_126();
    swift_task_dealloc();
    swift_task_dealloc();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
  else
  {
    v9 = *(_QWORD *)(v0 + 632);
    v10 = *(_QWORD *)(v0 + 624);
    v11 = *(_QWORD *)(v0 + 616);
    OUTLINED_FUNCTION_60_1();
    OUTLINED_FUNCTION_120(v9, v1, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v11 + 32));
    v12 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v11 + 16);
    *(_QWORD *)(v0 + 768) = v12;
    OUTLINED_FUNCTION_120(v10, v9, v12);
    v13 = sub_23A4AA6D8();
    v14 = sub_23A4AA8C4();
    v15 = os_log_type_enabled(v13, v14);
    v16 = *(_QWORD *)(v0 + 624);
    v17 = *(_QWORD *)(v0 + 616);
    if (v15)
    {
      v40 = *(_QWORD *)(v0 + 608);
      v18 = (uint8_t *)OUTLINED_FUNCTION_3_0();
      v41 = OUTLINED_FUNCTION_3_0();
      *(_DWORD *)v18 = 136315138;
      v19 = sub_23A4AA240();
      *(_QWORD *)(v0 + 344) = sub_23A49D6D8(v19, v20, &v41);
      OUTLINED_FUNCTION_114();
      OUTLINED_FUNCTION_25_2();
      (*(void (**)(uint64_t, uint64_t))(v17 + 8))(v16, v40);
      OUTLINED_FUNCTION_12(&dword_23A470000, v13, v14, "DeviceExpertTellMeGeneratedFlow#execute - Resolved query \"%s\"", v18);
      OUTLINED_FUNCTION_42_1();
      OUTLINED_FUNCTION_0_0();
    }
    v32 = *(void (**)(_QWORD, _QWORD))(v17 + 8);
    v32(*(_QWORD *)(v0 + 624), *(_QWORD *)(v0 + 608));

    *(_QWORD *)(v0 + 776) = v32;
    v33 = *(_QWORD **)(v0 + 376);
    v34 = v33[7];
    v35 = v33[8];
    v36 = v33[20];
    type metadata accessor for SnippetModelProvider();
    *(_QWORD *)(v0 + 784) = swift_initStackObject();
    *(_QWORD *)(v0 + 792) = sub_23A4732B4(v34, v35, v36);
    swift_retain();
    swift_retain();
    swift_retain();
    v37 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 800) = v37;
    *v37 = v0;
    v37[1] = sub_23A499DFC;
    return sub_23A4732C4(*(_QWORD *)(v0 + 584), *(_QWORD *)(v0 + 632), *(_QWORD *)(v0 + 720), *(_QWORD *)(v0 + 728));
  }
}

uint64_t sub_23A499DFC()
{
  OUTLINED_FUNCTION_47();
  OUTLINED_FUNCTION_45();
  OUTLINED_FUNCTION_24();
  return OUTLINED_FUNCTION_1_0();
}

uint64_t sub_23A499E30()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  int EnumTagSinglePayload;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  os_log_type_t v15;
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
  uint64_t v31;
  uint64_t v32;
  int v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  int v37;
  uint64_t v38;
  uint64_t (*v39)(_QWORD);
  int v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t *v43;
  uint64_t v44;
  uint64_t v45;
  int v46;
  uint64_t v47;
  uint64_t (*v48)(_QWORD);
  uint64_t v49;
  uint64_t v50;
  _QWORD *v51;
  uint64_t v52;
  void *v53;
  uint64_t v54;
  void *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  void (*v61)(uint64_t, uint64_t);
  __int128 v62;
  uint64_t v63;
  uint64_t v64;
  __int128 v65;
  uint64_t v66;
  uint64_t v67;

  v1 = *(_QWORD *)(v0 + 568);
  v2 = *(_QWORD *)(v0 + 560);
  v3 = *(_QWORD *)(v0 + 544);
  v4 = *(_QWORD *)(v0 + 536);
  v5 = *(_QWORD *)(v0 + 472);
  sub_23A47A8FC(*(_QWORD *)(v0 + 584) + *(int *)(*(_QWORD *)(v0 + 576) + 20), v1);
  v6 = OUTLINED_FUNCTION_123();
  sub_23A47A8FC(v6, v7);
  sub_23A47A8FC(v1, v3);
  sub_23A47A8FC(v2, v4);
  EnumTagSinglePayload = __swift_getEnumTagSinglePayload(v3, 1, v5);
  v9 = *(_QWORD *)(v0 + 552);
  v10 = *(_QWORD *)(v0 + 544);
  v11 = *(_QWORD *)(v0 + 536);
  if (EnumTagSinglePayload == 1)
  {
    v12 = sub_23A49DE94(v11, *(_QWORD *)(v0 + 552));
    OUTLINED_FUNCTION_92_0(v12, &qword_256980070);
  }
  else
  {
    sub_23A49F88C(v11, &qword_256980070);
    sub_23A48F9FC(v10, v9, (uint64_t (*)(_QWORD))type metadata accessor for TellMeGeneratedSnippetModels);
    OUTLINED_FUNCTION_58_1(v9);
  }
  OUTLINED_FUNCTION_118(*(_QWORD *)(v0 + 552));
  if (OUTLINED_FUNCTION_90_0() != 1)
  {
    v31 = *(_QWORD *)(v0 + 520);
    v32 = *(_QWORD *)(v0 + 472);
    sub_23A48F9FC(*(_QWORD *)(v0 + 528), *(_QWORD *)(v0 + 496), (uint64_t (*)(_QWORD))type metadata accessor for TellMeGeneratedSnippetModels);
    OUTLINED_FUNCTION_72_0();
    v33 = __swift_getEnumTagSinglePayload(v31, 1, v32);
    v34 = *(_QWORD *)(v0 + 520);
    if (v33 == 1)
    {
      sub_23A49F88C(*(_QWORD *)(v0 + 520), &qword_256980070);
      OUTLINED_FUNCTION_72_0();
    }
    else
    {
      v35 = OUTLINED_FUNCTION_125();
      sub_23A47D2B4(v35, v36);
      OUTLINED_FUNCTION_103();
      v37 = swift_getEnumCaseMultiPayload() & 0xFFFFFFFE;
      v38 = OUTLINED_FUNCTION_103();
      sub_23A49F864(v38, v39);
      sub_23A49F864(v34, (uint64_t (*)(_QWORD))type metadata accessor for TellMeGeneratedSnippetModels);
      OUTLINED_FUNCTION_72_0();
      if (v37 == 2)
      {
        sub_23A49F88C(*(_QWORD *)(v0 + 512), &qword_256980070);
        goto LABEL_15;
      }
    }
    OUTLINED_FUNCTION_118(*(_QWORD *)(v0 + 512));
    v40 = OUTLINED_FUNCTION_90_0();
    v41 = *(_QWORD *)(v0 + 504);
    if (v40 == 1)
    {
      sub_23A49F88C(*(_QWORD *)(v0 + 512), &qword_256980070);
      v42 = OUTLINED_FUNCTION_123();
      sub_23A49F88C(v42, v43);
LABEL_16:
      v51 = (_QWORD *)swift_task_alloc();
      *(_QWORD *)(v0 + 808) = v51;
      *v51 = v0;
      v51[1] = sub_23A49A330;
      return sub_23A49B1FC(*(_QWORD *)(v0 + 496));
    }
    v44 = OUTLINED_FUNCTION_123();
    sub_23A47D2B4(v44, v45);
    OUTLINED_FUNCTION_125();
    v46 = swift_getEnumCaseMultiPayload() & 0xFFFFFFFE;
    v47 = OUTLINED_FUNCTION_125();
    sub_23A49F864(v47, v48);
    OUTLINED_FUNCTION_92_0(v49, &qword_256980070);
    sub_23A49F864(v41, (uint64_t (*)(_QWORD))type metadata accessor for TellMeGeneratedSnippetModels);
    if (v46 != 2)
      goto LABEL_16;
LABEL_15:
    v50 = *(_QWORD *)(v0 + 592);
    OUTLINED_FUNCTION_112(v50, *(_QWORD *)(v0 + 632), *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v0 + 768));
    OUTLINED_FUNCTION_58_1(v50);
    FeedbackModel.init(result:)(v50, (uint64_t *)&v62);
    v65 = v62;
    v66 = v63;
    v67 = v64;
    sub_23A498E2C(&v65);
    goto LABEL_16;
  }
  v13 = *(void **)(v0 + 712);
  v14 = swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_92_0(v14, &qword_256980070);
  sub_23A4AA6D8();
  v15 = OUTLINED_FUNCTION_44();
  if (OUTLINED_FUNCTION_37_2(v15))
  {
    *(_WORD *)OUTLINED_FUNCTION_3_0() = 0;
    OUTLINED_FUNCTION_50_2(&dword_23A470000, v16, v17, "DeviceExpertTellMeGeneratedFlow#execute() Unable to determine snippet model for result");
    OUTLINED_FUNCTION_0_0();
  }
  v61 = *(void (**)(uint64_t, uint64_t))(v0 + 776);
  v53 = *(void **)(v0 + 744);
  v59 = *(_QWORD *)(v0 + 608);
  v60 = *(_QWORD *)(v0 + 632);
  v57 = *(_QWORD *)(v0 + 568);
  v58 = *(_QWORD *)(v0 + 584);
  v55 = *(void **)(v0 + 736);
  v56 = *(_QWORD *)(v0 + 560);
  v54 = *(_QWORD *)(v0 + 552);
  v19 = *(_QWORD *)(v0 + 424);
  v18 = *(_QWORD *)(v0 + 432);
  v20 = *(_QWORD *)(v0 + 408);
  v21 = *(_QWORD *)(v0 + 416);
  v22 = *(_QWORD *)(v0 + 392);
  v23 = *(_QWORD *)(v0 + 400);
  v24 = *(_QWORD *)(v0 + 376);
  v52 = *(_QWORD *)(v0 + 384);

  __swift_project_boxed_opaque_existential_1((_QWORD *)(v24 + 120), *(_QWORD *)(v24 + 144));
  OUTLINED_FUNCTION_79_0();
  (*(void (**)(uint64_t, _QWORD, uint64_t))(v19 + 104))(v18, *MEMORY[0x24BE97878], v21);
  v25 = OUTLINED_FUNCTION_78_0();
  OUTLINED_FUNCTION_98(v20, v26, v27, v25);
  (*(void (**)(uint64_t, _QWORD, uint64_t))(v22 + 104))(v23, *MEMORY[0x24BE97068], v52);
  v28 = OUTLINED_FUNCTION_125();
  sub_23A48CAD0(v28, v29, v23, 2);
  sub_23A4AA3D8();
  OUTLINED_FUNCTION_94_0();
  sub_23A4AA468();
  swift_release();

  OUTLINED_FUNCTION_62_1(v54);
  OUTLINED_FUNCTION_62_1(v56);
  OUTLINED_FUNCTION_62_1(v57);
  sub_23A49F864(v58, (uint64_t (*)(_QWORD))type metadata accessor for SnippetResponseComponents);
  v61(v60, v59);
  OUTLINED_FUNCTION_5_9();
  __swift_destroy_boxed_opaque_existential_1(v0 + 104);
  OUTLINED_FUNCTION_82();
  OUTLINED_FUNCTION_79();
  OUTLINED_FUNCTION_99();
  OUTLINED_FUNCTION_93();
  OUTLINED_FUNCTION_83();
  OUTLINED_FUNCTION_76();
  OUTLINED_FUNCTION_85();
  OUTLINED_FUNCTION_61();
  OUTLINED_FUNCTION_74();
  OUTLINED_FUNCTION_78();
  OUTLINED_FUNCTION_73();
  OUTLINED_FUNCTION_72();
  OUTLINED_FUNCTION_68();
  OUTLINED_FUNCTION_71();
  OUTLINED_FUNCTION_69();
  OUTLINED_FUNCTION_66();
  OUTLINED_FUNCTION_65();
  OUTLINED_FUNCTION_64();
  OUTLINED_FUNCTION_63();
  OUTLINED_FUNCTION_62();
  OUTLINED_FUNCTION_70();
  OUTLINED_FUNCTION_98_0();
  OUTLINED_FUNCTION_126();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_23A49A330()
{
  uint64_t v0;
  uint64_t v1;

  OUTLINED_FUNCTION_23();
  OUTLINED_FUNCTION_20();
  *(_QWORD *)(v1 + 816) = v0;
  OUTLINED_FUNCTION_42();
  OUTLINED_FUNCTION_24();
  return OUTLINED_FUNCTION_1_0();
}

uint64_t sub_23A49A36C()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;

  v1 = v0[58];
  v2 = sub_23A4AA474();
  OUTLINED_FUNCTION_98(v1, v3, v4, v2);
  sub_23A4AA438();
  sub_23A498E18(v0 + 33);
  v5 = v0[33];
  v6 = v0[34];
  v0[103] = v5;
  v0[104] = v6;
  v7 = v0[35];
  v8 = v0[36];
  v0[105] = v7;
  v0[106] = v8;
  v0[37] = v5;
  v0[38] = v6;
  v0[39] = v7;
  v0[40] = v8;
  v9 = (_QWORD *)swift_task_alloc();
  v0[107] = (uint64_t)v9;
  *v9 = v0;
  v9[1] = sub_23A49A448;
  return sub_23A47C93C((uint64_t)(v0 + 28), v0[73], v0[102], 0, 0, v0[58], v0[57], 2);
}

uint64_t sub_23A49A448()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  OUTLINED_FUNCTION_54();
  OUTLINED_FUNCTION_47();
  v1 = v0[104];
  v2 = v0[103];
  v4 = v0[57];
  v3 = v0[58];
  v5 = v0[55];
  v6 = v0[56];
  OUTLINED_FUNCTION_45();
  swift_bridgeObjectRelease();
  sub_23A49DEDC(v2, v1);
  (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v4, v5);
  sub_23A49F88C(v3, &qword_2569802A0);
  OUTLINED_FUNCTION_24();
  OUTLINED_FUNCTION_46_1();
  return swift_task_switch();
}

uint64_t sub_23A49A4E4()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;

  sub_23A49F7F4(v0 + 224, v0 + 144);
  v1 = OUTLINED_FUNCTION_117();
  sub_23A499030((__int128 *)(v0 + 144), v1 + 16);
  sub_23A4AA4B0();
  *(_QWORD *)(v0 + 864) = sub_23A4AA39C();
  swift_allocObject();
  *(_QWORD *)(v0 + 872) = sub_23A4AA390();
  v2 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 880) = v2;
  *v2 = v0;
  v2[1] = sub_23A49A5A8;
  return sub_23A49FF54(*(_QWORD *)(v0 + 632));
}

uint64_t sub_23A49A5A8()
{
  OUTLINED_FUNCTION_47();
  OUTLINED_FUNCTION_45();
  OUTLINED_FUNCTION_24();
  return OUTLINED_FUNCTION_1_0();
}

uint64_t sub_23A49A5DC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;
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
  char v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  char v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
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

  v1 = *(_QWORD *)(v0 + 424);
  v2 = *(_QWORD *)(v0 + 432);
  v3 = *(_QWORD *)(v0 + 408);
  v4 = *(_QWORD *)(v0 + 416);
  v5 = *(_QWORD *)(v0 + 400);
  v38 = *(_QWORD *)(v0 + 392);
  v6 = *(_QWORD **)(v0 + 376);
  v40 = *(_QWORD *)(v0 + 384);
  v7 = v6[14];
  __swift_project_boxed_opaque_existential_1(v6 + 10, v6[13]);
  (*(void (**)(void))(v7 + 8))();
  __swift_project_boxed_opaque_existential_1(v6 + 15, v6[18]);
  OUTLINED_FUNCTION_79_0();
  (*(void (**)(uint64_t, _QWORD, uint64_t))(v1 + 104))(v2, *MEMORY[0x24BE97888], v4);
  v8 = OUTLINED_FUNCTION_78_0();
  OUTLINED_FUNCTION_98(v3, v9, v10, v8);
  (*(void (**)(uint64_t, _QWORD, uint64_t))(v38 + 104))(v5, *MEMORY[0x24BE970E8], v40);
  v11 = OUTLINED_FUNCTION_103();
  sub_23A48CAD0(v11, v12, v5, 3);
  sub_23A4AA3D8();
  OUTLINED_FUNCTION_104();
  v33 = sub_23A4AA270();
  v14 = v13;
  sub_23A47C224();
  v30 = v15;
  v17 = v16;
  v28 = sub_23A47A500();
  v18 = sub_23A47A688();
  v19 = sub_23A47A688();
  v20 = 0;
  v21 = 0;
  if (v19 == 5)
  {
    v20 = sub_23A4AA174();
    v21 = v22;
  }
  v23 = *(_QWORD *)(v0 + 872);
  v29 = *(void **)(v0 + 744);
  v32 = *(void **)(v0 + 736);
  v24 = *(_QWORD *)(v0 + 728);
  v25 = *(_QWORD *)(v0 + 720);
  v42 = *(_QWORD *)(v0 + 632);
  v39 = *(_QWORD *)(v0 + 616);
  v41 = *(_QWORD *)(v0 + 608);
  v36 = *(_QWORD *)(v0 + 568);
  v37 = *(_QWORD *)(v0 + 584);
  v35 = *(_QWORD *)(v0 + 560);
  v34 = *(_QWORD *)(v0 + 552);
  v31 = *(_QWORD *)(v0 + 496);
  *(_QWORD *)(v0 + 16) = 0xD00000000000001BLL;
  v26 = *(_QWORD *)(v0 + 376);
  *(_QWORD *)(v0 + 24) = 0x800000023A4AF2A0;
  *(_QWORD *)(v0 + 32) = v25;
  *(_QWORD *)(v0 + 40) = v24;
  *(_QWORD *)(v0 + 48) = v33;
  *(_QWORD *)(v0 + 56) = v14;
  *(_QWORD *)(v0 + 64) = v30;
  *(_QWORD *)(v0 + 72) = v17;
  *(_BYTE *)(v0 + 80) = v28 & 1;
  *(_BYTE *)(v0 + 81) = v18;
  *(_QWORD *)(v0 + 88) = v20;
  *(_QWORD *)(v0 + 96) = v21;
  sub_23A49F2E4((const void *)(v0 + 16), *(_QWORD **)(v26 + 72));
  OUTLINED_FUNCTION_60_1();
  OUTLINED_FUNCTION_39_1();
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_25_2();
  swift_bridgeObjectRelease();
  *(_QWORD *)(v0 + 336) = v23;
  sub_23A4AA45C();
  swift_release();

  __swift_destroy_boxed_opaque_existential_1(v0 + 224);
  sub_23A49F864(v31, (uint64_t (*)(_QWORD))type metadata accessor for TellMeGeneratedSnippetModels);
  OUTLINED_FUNCTION_62_1(v34);
  OUTLINED_FUNCTION_62_1(v35);
  OUTLINED_FUNCTION_62_1(v36);
  sub_23A49F864(v37, (uint64_t (*)(_QWORD))type metadata accessor for SnippetResponseComponents);
  (*(void (**)(uint64_t, uint64_t))(v39 + 8))(v42, v41);
  OUTLINED_FUNCTION_104();
  __swift_destroy_boxed_opaque_existential_1(v0 + 104);
  OUTLINED_FUNCTION_82();
  OUTLINED_FUNCTION_93();
  OUTLINED_FUNCTION_79();
  OUTLINED_FUNCTION_99();
  OUTLINED_FUNCTION_83();
  OUTLINED_FUNCTION_76();
  OUTLINED_FUNCTION_85();
  OUTLINED_FUNCTION_61();
  OUTLINED_FUNCTION_74();
  swift_task_dealloc();
  OUTLINED_FUNCTION_78();
  OUTLINED_FUNCTION_73();
  OUTLINED_FUNCTION_72();
  OUTLINED_FUNCTION_68();
  OUTLINED_FUNCTION_71();
  OUTLINED_FUNCTION_69();
  OUTLINED_FUNCTION_66();
  OUTLINED_FUNCTION_65();
  OUTLINED_FUNCTION_64();
  OUTLINED_FUNCTION_63();
  OUTLINED_FUNCTION_62();
  OUTLINED_FUNCTION_70();
  OUTLINED_FUNCTION_98_0();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_23A49A9D4(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;

  v3[5] = a2;
  v3[6] = v2;
  v3[4] = a1;
  v4 = sub_23A4AA27C();
  v3[7] = v4;
  v3[8] = *(_QWORD *)(v4 - 8);
  v3[9] = swift_task_alloc();
  v3[10] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_23A49AA48(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t *v3;
  size_t v4;
  uint64_t v5;
  size_t v6;
  uint64_t v7;
  size_t v8;
  id v9;
  void *v10;
  id v11;
  _QWORD *v12;
  uint64_t v14;
  os_log_type_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void (*v21)(uint64_t, size_t, uint64_t);
  uint64_t v22;
  size_t v23[2];

  if (!*(_QWORD *)(v3[5] + 16))
  {
    OUTLINED_FUNCTION_98(v3[4], a2, a3, v3[7]);
    goto LABEL_22;
  }
  v23[0] = v3[5];
  swift_bridgeObjectRetain();
  sub_23A49E088(v23);
  v4 = v23[0];
  v3[11] = v23[0];
  v5 = *(_QWORD *)(v4 + 16);
  v6 = MEMORY[0x24BEE4AF8];
  if (v5)
  {
    v7 = v3[8];
    v23[0] = MEMORY[0x24BEE4AF8];
    sub_23A4AA984();
    v8 = v4 + ((*(unsigned __int8 *)(v7 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80));
    v21 = *(void (**)(uint64_t, size_t, uint64_t))(v7 + 16);
    v22 = *(_QWORD *)(v7 + 72);
    do
    {
      v21(v3[10], v8, v3[7]);
      sub_23A4AA15C();
      sub_23A4AA234();
      v9 = objc_allocWithZone((Class)sub_23A4AA714());
      sub_23A4AA708();
      OUTLINED_FUNCTION_31(*(uint64_t (**)(uint64_t, uint64_t))(v7 + 8));
      sub_23A4AA96C();
      sub_23A4AA990();
      sub_23A4AA99C();
      sub_23A4AA978();
      v8 += v22;
      --v5;
    }
    while (v5);
    v6 = v23[0];
  }
  v3[12] = v6;
  if (v6 >> 62)
  {
    OUTLINED_FUNCTION_96_0();
    v10 = (void *)sub_23A4AA9D8();
  }
  else
  {
    v10 = *(void **)((v6 & 0xFFFFFFFFFFFFF8) + 0x10);
    OUTLINED_FUNCTION_96_0();
  }
  if (!v10)
  {
    OUTLINED_FUNCTION_113();
    OUTLINED_FUNCTION_91_0();
    goto LABEL_18;
  }
  if ((v6 & 0xC000000000000001) != 0)
  {
    v11 = (id)MEMORY[0x23B84DDA0](0, v6);
  }
  else
  {
    if (!*(_QWORD *)((v6 & 0xFFFFFFFFFFFFF8) + 0x10))
    {
      __break(1u);
      goto LABEL_26;
    }
    v11 = *(id *)(v6 + 32);
  }
  v10 = v11;
  v3[13] = (uint64_t)v11;
  OUTLINED_FUNCTION_60_1();
  if ((sub_23A4AA6FC() & 1) == 0)
  {
    OUTLINED_FUNCTION_91_0();
    OUTLINED_FUNCTION_60_1();

LABEL_18:
    if (qword_25697FF48 == -1)
    {
LABEL_19:
      v14 = OUTLINED_FUNCTION_39();
      __swift_project_value_buffer(v14, (uint64_t)qword_2569815D0);
      OUTLINED_FUNCTION_83_0();
      v15 = OUTLINED_FUNCTION_69_0();
      if (OUTLINED_FUNCTION_37_2(v15))
      {
        *(_WORD *)OUTLINED_FUNCTION_3_0() = 0;
        OUTLINED_FUNCTION_50_2(&dword_23A470000, v16, v17, "DeviceExpertTellMeGeneratedFlow#findBestResults - Returning result without context");
        OUTLINED_FUNCTION_0_0();
      }
      v19 = v3[4];
      v18 = v3[5];

      sub_23A49CC38(v18, v19);
LABEL_22:
      OUTLINED_FUNCTION_119();
      OUTLINED_FUNCTION_93();
      OUTLINED_FUNCTION_111();
      __asm { BR              X0 }
    }
LABEL_26:
    swift_once();
    goto LABEL_19;
  }
  v12 = (_QWORD *)swift_task_alloc();
  v3[14] = (uint64_t)v12;
  *v12 = v3;
  v12[1] = sub_23A49AD48;
  OUTLINED_FUNCTION_111();
  return sub_23A4AA72C();
}

uint64_t sub_23A49AD48()
{
  uint64_t v0;
  _QWORD *v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;

  v2 = (_QWORD *)*v1;
  OUTLINED_FUNCTION_64_0();
  v2[15] = v3;
  v2[16] = v4;
  v2[17] = v0;
  OUTLINED_FUNCTION_42();
  if (v0)
    swift_release();
  OUTLINED_FUNCTION_39_1();
  OUTLINED_FUNCTION_24();
  return OUTLINED_FUNCTION_0_12();
}

uint64_t sub_23A49ADB8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20)
{
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  uint64_t v25;
  void *v26;
  os_log_type_t v27;
  uint64_t v28;
  _DWORD *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  os_log_type_t v33;
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
  void (*v45)(uint64_t);
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  char v51;
  void *v52;
  void *v53;
  uint64_t v54;

  OUTLINED_FUNCTION_54();
  a19 = v22;
  a20 = v23;
  a18 = v21;
  v24 = *(_QWORD *)(v21 + 128);
  if (v24)
  {
    if (qword_25697FF48 != -1)
      swift_once();
    v25 = OUTLINED_FUNCTION_39();
    v26 = (void *)__swift_project_value_buffer(v25, (uint64_t)qword_2569815D0);
    OUTLINED_FUNCTION_45_2();
    sub_23A4AA6D8();
    v27 = OUTLINED_FUNCTION_69_0();
    if (OUTLINED_FUNCTION_13_5(v27))
    {
      v28 = *(_QWORD *)(v21 + 120);
      v29 = (_DWORD *)OUTLINED_FUNCTION_3_0();
      a9 = OUTLINED_FUNCTION_3_0();
      *v29 = 136315138;
      OUTLINED_FUNCTION_67_0();
      *(_QWORD *)(v21 + 24) = sub_23A49D6D8(v28, v24, &a9);
      OUTLINED_FUNCTION_114();
      swift_bridgeObjectRelease_n();
      OUTLINED_FUNCTION_8_8(&dword_23A470000, v30, v31, "DeviceExpertTellMeGeneratedFlow#findBestResults - %s");
      OUTLINED_FUNCTION_42_1();
      OUTLINED_FUNCTION_0_0();
    }
    OUTLINED_FUNCTION_113();

    v40 = *(_QWORD *)(v21 + 88);
    v41 = *(_QWORD *)(v40 + 16);
    if (v41)
    {
      v42 = *(_QWORD *)(v21 + 64);
      v43 = v40 + ((*(unsigned __int8 *)(v42 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v42 + 80));
      v44 = *(_QWORD *)(v42 + 72);
      v45 = *(void (**)(uint64_t))(v42 + 16);
      swift_retain();
      while (1)
      {
        v47 = *(_QWORD *)(v21 + 120);
        v46 = *(_QWORD *)(v21 + 128);
        v48 = OUTLINED_FUNCTION_123();
        v45(v48);
        if (sub_23A4AA15C() == v47 && v46 == v49)
          break;
        v51 = sub_23A4AAAB0();
        OUTLINED_FUNCTION_52();
        if ((v51 & 1) != 0)
          goto LABEL_22;
        (*(void (**)(_QWORD, _QWORD))(v42 + 8))(*(_QWORD *)(v21 + 72), *(_QWORD *)(v21 + 56));
        v43 += v44;
        if (!--v41)
        {
          swift_release();
          goto LABEL_20;
        }
      }
      OUTLINED_FUNCTION_52();
LABEL_22:
      OUTLINED_FUNCTION_94_0();
      v53 = *(void **)(v21 + 104);
      v54 = *(_QWORD *)(v21 + 32);
      OUTLINED_FUNCTION_112(v54, *(_QWORD *)(v21 + 72), *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v21 + 64) + 32));
      OUTLINED_FUNCTION_58_1(v54);

    }
    else
    {
LABEL_20:
      v52 = *(void **)(v21 + 104);
      OUTLINED_FUNCTION_98(*(_QWORD *)(v21 + 32), v38, v39, *(_QWORD *)(v21 + 56));

    }
    OUTLINED_FUNCTION_39_1();
    swift_release();
  }
  else
  {
    swift_release();
    if (qword_25697FF48 != -1)
      swift_once();
    v32 = OUTLINED_FUNCTION_39();
    __swift_project_value_buffer(v32, (uint64_t)qword_2569815D0);
    OUTLINED_FUNCTION_83_0();
    v33 = OUTLINED_FUNCTION_44();
    if (OUTLINED_FUNCTION_37_2(v33))
    {
      *(_WORD *)OUTLINED_FUNCTION_3_0() = 0;
      OUTLINED_FUNCTION_50_2(&dword_23A470000, v34, v35, "DeviceExpertTellMeGeneratedFlow#findBestResults - No matching result found");
      OUTLINED_FUNCTION_0_0();
    }
    v36 = *(_QWORD *)(v21 + 56);
    v37 = *(_QWORD *)(v21 + 32);

    __swift_storeEnumTagSinglePayload(v37, 1, 1, v36);
  }
  OUTLINED_FUNCTION_119();
  OUTLINED_FUNCTION_93();
  return OUTLINED_FUNCTION_47_0(*(uint64_t (**)(void))(v21 + 8));
}

uint64_t sub_23A49B09C()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  void *v3;
  id v4;
  id v5;
  os_log_type_t v6;
  _QWORD *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  OUTLINED_FUNCTION_54();
  if (qword_25697FF48 != -1)
    swift_once();
  v1 = *(void **)(v0 + 136);
  v2 = OUTLINED_FUNCTION_39();
  v3 = (void *)__swift_project_value_buffer(v2, (uint64_t)qword_2569815D0);
  v4 = v1;
  v5 = v1;
  sub_23A4AA6D8();
  v6 = OUTLINED_FUNCTION_44();
  if (OUTLINED_FUNCTION_13_5(v6))
  {
    swift_slowAlloc();
    v7 = (_QWORD *)OUTLINED_FUNCTION_3_0();
    OUTLINED_FUNCTION_14_8(5.7779e-34);
    v8 = OUTLINED_FUNCTION_59_1();
    *(_QWORD *)(v0 + 16) = v8;
    sub_23A4AA900();
    *v7 = v8;
    OUTLINED_FUNCTION_5_3();
    OUTLINED_FUNCTION_5_3();
    OUTLINED_FUNCTION_8_8(&dword_23A470000, v9, v10, "DeviceExpertTellMeGeneratedFlow#findBestResults - Error evaluating best result: %@");
    __swift_instantiateConcreteTypeFromMangledName(&qword_2569807A8);
    OUTLINED_FUNCTION_9_4();
    OUTLINED_FUNCTION_0_0();
  }

  OUTLINED_FUNCTION_5_3();
  OUTLINED_FUNCTION_5_3();
  OUTLINED_FUNCTION_5_3();

  OUTLINED_FUNCTION_98(*(_QWORD *)(v0 + 32), v11, v12, *(_QWORD *)(v0 + 56));
  OUTLINED_FUNCTION_119();
  OUTLINED_FUNCTION_93();
  return OUTLINED_FUNCTION_47_0(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_23A49B1FC(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v2;

  v2[10] = a1;
  v2[11] = v1;
  v2[12] = type metadata accessor for TipSnippetModel(0);
  v2[13] = OUTLINED_FUNCTION_35();
  v2[14] = type metadata accessor for SummarizedAnswerSnippetModel();
  v2[15] = OUTLINED_FUNCTION_35();
  v2[16] = type metadata accessor for ListStyleAnswerSnippetModel();
  v2[17] = OUTLINED_FUNCTION_35();
  type metadata accessor for LearnMoreSnippetModel();
  v2[18] = OUTLINED_FUNCTION_35();
  v2[19] = type metadata accessor for TellMeGeneratedSnippetModels();
  v2[20] = OUTLINED_FUNCTION_35();
  OUTLINED_FUNCTION_24();
  return OUTLINED_FUNCTION_1_0();
}

uint64_t sub_23A49B29C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  _QWORD *v10;
  uint64_t EnumCaseMultiPayload;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  OUTLINED_FUNCTION_53_1();
  v10[2] = MEMORY[0x24BEE4AF8];
  sub_23A47D2B4(v10[10], v10[20]);
  EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))((char *)sub_23A49B2FC + 4 * byte_23A4ADBB0[EnumCaseMultiPayload]))(EnumCaseMultiPayload, v12, v13, v14, v15, v16, v17, v18, a9, a10);
}

uint64_t sub_23A49B2FC()
{
  uint64_t v0;
  void *v1;
  id v2;
  char v3;
  uint64_t v4;
  uint64_t (*v5)(void);

  sub_23A49F864(*(_QWORD *)(v0 + 160), (uint64_t (*)(_QWORD))type metadata accessor for TellMeGeneratedSnippetModels);
  if (*(_QWORD *)(*(_QWORD *)(v0 + 16) + 16))
  {
    OUTLINED_FUNCTION_45_2();
    do
    {
      OUTLINED_FUNCTION_85_0();
      if (v1)
      {
        v2 = v1;
        OUTLINED_FUNCTION_52_1();
      }
      OUTLINED_FUNCTION_84_0();
    }
    while (!v3);
    OUTLINED_FUNCTION_39_1();
  }
  else
  {
    OUTLINED_FUNCTION_67_0();
  }
  OUTLINED_FUNCTION_39_1();
  OUTLINED_FUNCTION_39_1();
  OUTLINED_FUNCTION_83();
  OUTLINED_FUNCTION_76();
  OUTLINED_FUNCTION_85();
  OUTLINED_FUNCTION_61();
  OUTLINED_FUNCTION_74();
  v4 = OUTLINED_FUNCTION_41_1();
  return OUTLINED_FUNCTION_4_10(v4, v5);
}

uint64_t sub_23A49B5A0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  OUTLINED_FUNCTION_23();
  OUTLINED_FUNCTION_20();
  *(_QWORD *)(v2 + 184) = v1;
  *(_QWORD *)(v2 + 192) = v0;
  OUTLINED_FUNCTION_42();
  OUTLINED_FUNCTION_39_1();
  if (v0)
    swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_24();
  return OUTLINED_FUNCTION_12_6();
}

void sub_23A49B5FC()
{
  OUTLINED_FUNCTION_53_1();
  OUTLINED_FUNCTION_77_0();
}

uint64_t sub_23A49B6F0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  OUTLINED_FUNCTION_23();
  OUTLINED_FUNCTION_20();
  *(_QWORD *)(v2 + 224) = v1;
  *(_QWORD *)(v2 + 232) = v0;
  OUTLINED_FUNCTION_42();
  OUTLINED_FUNCTION_39_1();
  if (v0)
    swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_24();
  return OUTLINED_FUNCTION_12_6();
}

uint64_t sub_23A49B74C()
{
  _QWORD *v0;
  int64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  uint64_t v11;
  char v12;
  uint64_t v14;

  OUTLINED_FUNCTION_54();
  MEMORY[0x23B84DCA4]();
  if (*(_QWORD *)(v0[2] + 16) >= *(_QWORD *)(v0[2] + 24) >> 1)
    OUTLINED_FUNCTION_20_4();
  sub_23A4AA894();
  sub_23A4AA864();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2569800B8);
  sub_23A4AA36C();
  v1 = *(_QWORD *)(v0[7] + 16);
  if (v1)
  {
    v14 = MEMORY[0x24BEE4AF8];
    sub_23A4A88C8(0, v1, 0);
    v2 = 0;
    v3 = v14;
    do
    {
      OUTLINED_FUNCTION_7();
      v4 = sub_23A4A7094();
      v6 = v5;
      OUTLINED_FUNCTION_52();
      v8 = *(_QWORD *)(v14 + 16);
      v7 = *(_QWORD *)(v14 + 24);
      if (v8 >= v7 >> 1)
        sub_23A4A88C8((char *)(v7 > 1), v8 + 1, 1);
      ++v2;
      *(_QWORD *)(v14 + 16) = v8 + 1;
      v9 = v14 + 16 * v8;
      *(_QWORD *)(v9 + 32) = v4;
      *(_QWORD *)(v9 + 40) = v6;
    }
    while (v1 != v2);
    OUTLINED_FUNCTION_39_1();
  }
  else
  {
    OUTLINED_FUNCTION_39_1();
    v3 = MEMORY[0x24BEE4AF8];
  }
  v0[30] = v3;
  v10 = (_QWORD *)swift_task_alloc();
  v0[31] = v10;
  *v10 = v0;
  v10[1] = sub_23A49B8D0;
  OUTLINED_FUNCTION_46_1();
  return sub_23A49D18C(v11, v12);
}

uint64_t sub_23A49B8D0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  OUTLINED_FUNCTION_88_0();
  OUTLINED_FUNCTION_64_0();
  *(_QWORD *)(v0 + 256) = v2;
  *(_QWORD *)(v0 + 264) = v1;
  OUTLINED_FUNCTION_42();
  swift_bridgeObjectRelease();
  if (v1)
    OUTLINED_FUNCTION_52();
  OUTLINED_FUNCTION_24();
  return OUTLINED_FUNCTION_12_6();
}

void sub_23A49B934()
{
  OUTLINED_FUNCTION_77_0();
}

uint64_t sub_23A49B9E8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  OUTLINED_FUNCTION_88_0();
  OUTLINED_FUNCTION_64_0();
  *(_QWORD *)(v0 + 288) = v2;
  *(_QWORD *)(v0 + 296) = v1;
  OUTLINED_FUNCTION_42();
  swift_bridgeObjectRelease();
  if (v1)
    OUTLINED_FUNCTION_52();
  OUTLINED_FUNCTION_24();
  return OUTLINED_FUNCTION_12_6();
}

void sub_23A49BA4C()
{
  OUTLINED_FUNCTION_53_1();
  OUTLINED_FUNCTION_77_0();
}

uint64_t sub_23A49BB40()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  OUTLINED_FUNCTION_23();
  OUTLINED_FUNCTION_20();
  *(_QWORD *)(v2 + 320) = v1;
  *(_QWORD *)(v2 + 328) = v0;
  OUTLINED_FUNCTION_42();
  OUTLINED_FUNCTION_39_1();
  if (v0)
    swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_24();
  return OUTLINED_FUNCTION_12_6();
}

void sub_23A49BB9C()
{
  OUTLINED_FUNCTION_53_1();
  OUTLINED_FUNCTION_77_0();
}

uint64_t sub_23A49BC90()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  OUTLINED_FUNCTION_88_0();
  OUTLINED_FUNCTION_64_0();
  *(_QWORD *)(v0 + 352) = v2;
  *(_QWORD *)(v0 + 360) = v1;
  OUTLINED_FUNCTION_42();
  if (v1)
    swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_39_1();
  OUTLINED_FUNCTION_24();
  return OUTLINED_FUNCTION_12_6();
}

void sub_23A49BCF4()
{
  OUTLINED_FUNCTION_53_1();
  OUTLINED_FUNCTION_77_0();
}

uint64_t sub_23A49BDE8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  void *v4;
  os_log_type_t v5;
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void **v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t (*v16)(void);

  OUTLINED_FUNCTION_35_2();
  sub_23A49F864(*(_QWORD *)(v0 + 144), (uint64_t (*)(_QWORD))type metadata accessor for LearnMoreSnippetModel);
  if (qword_25697FF48 != -1)
    swift_once();
  v3 = OUTLINED_FUNCTION_39();
  v4 = (void *)__swift_project_value_buffer(v3, (uint64_t)qword_2569815D0);
  OUTLINED_FUNCTION_18_6();
  OUTLINED_FUNCTION_18_6();
  sub_23A4AA6D8();
  v5 = OUTLINED_FUNCTION_44();
  if (OUTLINED_FUNCTION_13_5(v5))
  {
    OUTLINED_FUNCTION_3_0();
    v6 = (_QWORD *)OUTLINED_FUNCTION_3_0();
    OUTLINED_FUNCTION_14_8(5.7779e-34);
    v7 = OUTLINED_FUNCTION_59_1();
    OUTLINED_FUNCTION_7_6(v7);
    *v6 = v2;
    OUTLINED_FUNCTION_5_3();
    OUTLINED_FUNCTION_5_3();
    OUTLINED_FUNCTION_8_8(&dword_23A470000, v8, v9, "DeviceExpertTellMeGeneratedFlow#getDialogResults - Error calling catProvider: %@");
    __swift_instantiateConcreteTypeFromMangledName(&qword_2569807A8);
    OUTLINED_FUNCTION_9_4();
    OUTLINED_FUNCTION_0_0();
  }
  OUTLINED_FUNCTION_5_3();
  OUTLINED_FUNCTION_5_3();

  OUTLINED_FUNCTION_5_3();
  v10 = MEMORY[0x24BEE4AF8];
  OUTLINED_FUNCTION_15_2();
  if (v1)
  {
    OUTLINED_FUNCTION_7();
    v11 = (void **)(v10 + 32);
    do
    {
      v13 = *v11++;
      v12 = v13;
      if (v13)
      {
        v14 = v12;
        OUTLINED_FUNCTION_44_2();
      }
      --v1;
    }
    while (v1);
    swift_bridgeObjectRelease();
  }
  OUTLINED_FUNCTION_24_3();
  OUTLINED_FUNCTION_25_2();
  OUTLINED_FUNCTION_25_2();
  OUTLINED_FUNCTION_99();
  OUTLINED_FUNCTION_83();
  OUTLINED_FUNCTION_76();
  OUTLINED_FUNCTION_85();
  OUTLINED_FUNCTION_61();
  v15 = OUTLINED_FUNCTION_41_1();
  return OUTLINED_FUNCTION_1_13(v15, v16);
}

uint64_t sub_23A49BF8C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  void *v4;
  os_log_type_t v5;
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void **v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t (*v16)(void);

  OUTLINED_FUNCTION_35_2();
  sub_23A49F864(*(_QWORD *)(v0 + 136), (uint64_t (*)(_QWORD))type metadata accessor for ListStyleAnswerSnippetModel);
  if (qword_25697FF48 != -1)
    swift_once();
  v3 = OUTLINED_FUNCTION_39();
  v4 = (void *)__swift_project_value_buffer(v3, (uint64_t)qword_2569815D0);
  OUTLINED_FUNCTION_18_6();
  OUTLINED_FUNCTION_18_6();
  sub_23A4AA6D8();
  v5 = OUTLINED_FUNCTION_44();
  if (OUTLINED_FUNCTION_13_5(v5))
  {
    OUTLINED_FUNCTION_3_0();
    v6 = (_QWORD *)OUTLINED_FUNCTION_3_0();
    OUTLINED_FUNCTION_14_8(5.7779e-34);
    v7 = OUTLINED_FUNCTION_59_1();
    OUTLINED_FUNCTION_7_6(v7);
    *v6 = v2;
    OUTLINED_FUNCTION_5_3();
    OUTLINED_FUNCTION_5_3();
    OUTLINED_FUNCTION_8_8(&dword_23A470000, v8, v9, "DeviceExpertTellMeGeneratedFlow#getDialogResults - Error calling catProvider: %@");
    __swift_instantiateConcreteTypeFromMangledName(&qword_2569807A8);
    OUTLINED_FUNCTION_9_4();
    OUTLINED_FUNCTION_0_0();
  }
  OUTLINED_FUNCTION_5_3();
  OUTLINED_FUNCTION_5_3();

  OUTLINED_FUNCTION_5_3();
  v10 = MEMORY[0x24BEE4AF8];
  OUTLINED_FUNCTION_15_2();
  if (v1)
  {
    OUTLINED_FUNCTION_7();
    v11 = (void **)(v10 + 32);
    do
    {
      v13 = *v11++;
      v12 = v13;
      if (v13)
      {
        v14 = v12;
        OUTLINED_FUNCTION_44_2();
      }
      --v1;
    }
    while (v1);
    swift_bridgeObjectRelease();
  }
  OUTLINED_FUNCTION_24_3();
  OUTLINED_FUNCTION_25_2();
  OUTLINED_FUNCTION_25_2();
  OUTLINED_FUNCTION_99();
  OUTLINED_FUNCTION_83();
  OUTLINED_FUNCTION_76();
  OUTLINED_FUNCTION_85();
  OUTLINED_FUNCTION_61();
  v15 = OUTLINED_FUNCTION_41_1();
  return OUTLINED_FUNCTION_1_13(v15, v16);
}

uint64_t sub_23A49C130()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  void *v4;
  os_log_type_t v5;
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void **v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t (*v16)(void);

  OUTLINED_FUNCTION_35_2();
  sub_23A49F864(*(_QWORD *)(v0 + 136), (uint64_t (*)(_QWORD))type metadata accessor for ListStyleAnswerSnippetModel);
  if (qword_25697FF48 != -1)
    swift_once();
  v3 = OUTLINED_FUNCTION_39();
  v4 = (void *)__swift_project_value_buffer(v3, (uint64_t)qword_2569815D0);
  OUTLINED_FUNCTION_18_6();
  OUTLINED_FUNCTION_18_6();
  sub_23A4AA6D8();
  v5 = OUTLINED_FUNCTION_44();
  if (OUTLINED_FUNCTION_13_5(v5))
  {
    OUTLINED_FUNCTION_3_0();
    v6 = (_QWORD *)OUTLINED_FUNCTION_3_0();
    OUTLINED_FUNCTION_14_8(5.7779e-34);
    v7 = OUTLINED_FUNCTION_59_1();
    OUTLINED_FUNCTION_7_6(v7);
    *v6 = v2;
    OUTLINED_FUNCTION_5_3();
    OUTLINED_FUNCTION_5_3();
    OUTLINED_FUNCTION_8_8(&dword_23A470000, v8, v9, "DeviceExpertTellMeGeneratedFlow#getDialogResults - Error calling catProvider: %@");
    __swift_instantiateConcreteTypeFromMangledName(&qword_2569807A8);
    OUTLINED_FUNCTION_9_4();
    OUTLINED_FUNCTION_0_0();
  }
  OUTLINED_FUNCTION_5_3();
  OUTLINED_FUNCTION_5_3();

  OUTLINED_FUNCTION_5_3();
  v10 = MEMORY[0x24BEE4AF8];
  OUTLINED_FUNCTION_15_2();
  if (v1)
  {
    OUTLINED_FUNCTION_7();
    v11 = (void **)(v10 + 32);
    do
    {
      v13 = *v11++;
      v12 = v13;
      if (v13)
      {
        v14 = v12;
        OUTLINED_FUNCTION_44_2();
      }
      --v1;
    }
    while (v1);
    swift_bridgeObjectRelease();
  }
  OUTLINED_FUNCTION_24_3();
  OUTLINED_FUNCTION_25_2();
  OUTLINED_FUNCTION_25_2();
  OUTLINED_FUNCTION_99();
  OUTLINED_FUNCTION_83();
  OUTLINED_FUNCTION_76();
  OUTLINED_FUNCTION_85();
  OUTLINED_FUNCTION_61();
  v15 = OUTLINED_FUNCTION_41_1();
  return OUTLINED_FUNCTION_1_13(v15, v16);
}

uint64_t sub_23A49C2D4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  void *v4;
  os_log_type_t v5;
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void **v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t (*v16)(void);

  OUTLINED_FUNCTION_35_2();
  sub_23A49F864(*(_QWORD *)(v0 + 136), (uint64_t (*)(_QWORD))type metadata accessor for ListStyleAnswerSnippetModel);
  if (qword_25697FF48 != -1)
    swift_once();
  v3 = OUTLINED_FUNCTION_39();
  v4 = (void *)__swift_project_value_buffer(v3, (uint64_t)qword_2569815D0);
  OUTLINED_FUNCTION_18_6();
  OUTLINED_FUNCTION_18_6();
  sub_23A4AA6D8();
  v5 = OUTLINED_FUNCTION_44();
  if (OUTLINED_FUNCTION_13_5(v5))
  {
    OUTLINED_FUNCTION_3_0();
    v6 = (_QWORD *)OUTLINED_FUNCTION_3_0();
    OUTLINED_FUNCTION_14_8(5.7779e-34);
    v7 = OUTLINED_FUNCTION_59_1();
    OUTLINED_FUNCTION_7_6(v7);
    *v6 = v2;
    OUTLINED_FUNCTION_5_3();
    OUTLINED_FUNCTION_5_3();
    OUTLINED_FUNCTION_8_8(&dword_23A470000, v8, v9, "DeviceExpertTellMeGeneratedFlow#getDialogResults - Error calling catProvider: %@");
    __swift_instantiateConcreteTypeFromMangledName(&qword_2569807A8);
    OUTLINED_FUNCTION_9_4();
    OUTLINED_FUNCTION_0_0();
  }
  OUTLINED_FUNCTION_5_3();
  OUTLINED_FUNCTION_5_3();

  OUTLINED_FUNCTION_5_3();
  v10 = MEMORY[0x24BEE4AF8];
  OUTLINED_FUNCTION_15_2();
  if (v1)
  {
    OUTLINED_FUNCTION_7();
    v11 = (void **)(v10 + 32);
    do
    {
      v13 = *v11++;
      v12 = v13;
      if (v13)
      {
        v14 = v12;
        OUTLINED_FUNCTION_44_2();
      }
      --v1;
    }
    while (v1);
    swift_bridgeObjectRelease();
  }
  OUTLINED_FUNCTION_24_3();
  OUTLINED_FUNCTION_25_2();
  OUTLINED_FUNCTION_25_2();
  OUTLINED_FUNCTION_99();
  OUTLINED_FUNCTION_83();
  OUTLINED_FUNCTION_76();
  OUTLINED_FUNCTION_85();
  OUTLINED_FUNCTION_61();
  v15 = OUTLINED_FUNCTION_41_1();
  return OUTLINED_FUNCTION_1_13(v15, v16);
}

uint64_t sub_23A49C478()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  void *v4;
  os_log_type_t v5;
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void **v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t (*v16)(void);

  OUTLINED_FUNCTION_35_2();
  sub_23A49F864(*(_QWORD *)(v0 + 120), (uint64_t (*)(_QWORD))type metadata accessor for SummarizedAnswerSnippetModel);
  if (qword_25697FF48 != -1)
    swift_once();
  v3 = OUTLINED_FUNCTION_39();
  v4 = (void *)__swift_project_value_buffer(v3, (uint64_t)qword_2569815D0);
  OUTLINED_FUNCTION_18_6();
  OUTLINED_FUNCTION_18_6();
  sub_23A4AA6D8();
  v5 = OUTLINED_FUNCTION_44();
  if (OUTLINED_FUNCTION_13_5(v5))
  {
    OUTLINED_FUNCTION_3_0();
    v6 = (_QWORD *)OUTLINED_FUNCTION_3_0();
    OUTLINED_FUNCTION_14_8(5.7779e-34);
    v7 = OUTLINED_FUNCTION_59_1();
    OUTLINED_FUNCTION_7_6(v7);
    *v6 = v2;
    OUTLINED_FUNCTION_5_3();
    OUTLINED_FUNCTION_5_3();
    OUTLINED_FUNCTION_8_8(&dword_23A470000, v8, v9, "DeviceExpertTellMeGeneratedFlow#getDialogResults - Error calling catProvider: %@");
    __swift_instantiateConcreteTypeFromMangledName(&qword_2569807A8);
    OUTLINED_FUNCTION_9_4();
    OUTLINED_FUNCTION_0_0();
  }
  OUTLINED_FUNCTION_5_3();
  OUTLINED_FUNCTION_5_3();

  OUTLINED_FUNCTION_5_3();
  v10 = MEMORY[0x24BEE4AF8];
  OUTLINED_FUNCTION_15_2();
  if (v1)
  {
    OUTLINED_FUNCTION_7();
    v11 = (void **)(v10 + 32);
    do
    {
      v13 = *v11++;
      v12 = v13;
      if (v13)
      {
        v14 = v12;
        OUTLINED_FUNCTION_44_2();
      }
      --v1;
    }
    while (v1);
    swift_bridgeObjectRelease();
  }
  OUTLINED_FUNCTION_24_3();
  OUTLINED_FUNCTION_25_2();
  OUTLINED_FUNCTION_25_2();
  OUTLINED_FUNCTION_99();
  OUTLINED_FUNCTION_83();
  OUTLINED_FUNCTION_76();
  OUTLINED_FUNCTION_85();
  OUTLINED_FUNCTION_61();
  v15 = OUTLINED_FUNCTION_41_1();
  return OUTLINED_FUNCTION_1_13(v15, v16);
}

uint64_t sub_23A49C61C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  void *v4;
  os_log_type_t v5;
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void **v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t (*v16)(void);

  OUTLINED_FUNCTION_35_2();
  sub_23A49F864(*(_QWORD *)(v0 + 104), type metadata accessor for TipSnippetModel);
  if (qword_25697FF48 != -1)
    swift_once();
  v3 = OUTLINED_FUNCTION_39();
  v4 = (void *)__swift_project_value_buffer(v3, (uint64_t)qword_2569815D0);
  OUTLINED_FUNCTION_18_6();
  OUTLINED_FUNCTION_18_6();
  sub_23A4AA6D8();
  v5 = OUTLINED_FUNCTION_44();
  if (OUTLINED_FUNCTION_13_5(v5))
  {
    OUTLINED_FUNCTION_3_0();
    v6 = (_QWORD *)OUTLINED_FUNCTION_3_0();
    OUTLINED_FUNCTION_14_8(5.7779e-34);
    v7 = OUTLINED_FUNCTION_59_1();
    OUTLINED_FUNCTION_7_6(v7);
    *v6 = v2;
    OUTLINED_FUNCTION_5_3();
    OUTLINED_FUNCTION_5_3();
    OUTLINED_FUNCTION_8_8(&dword_23A470000, v8, v9, "DeviceExpertTellMeGeneratedFlow#getDialogResults - Error calling catProvider: %@");
    __swift_instantiateConcreteTypeFromMangledName(&qword_2569807A8);
    OUTLINED_FUNCTION_9_4();
    OUTLINED_FUNCTION_0_0();
  }
  OUTLINED_FUNCTION_5_3();
  OUTLINED_FUNCTION_5_3();

  OUTLINED_FUNCTION_5_3();
  v10 = MEMORY[0x24BEE4AF8];
  OUTLINED_FUNCTION_15_2();
  if (v1)
  {
    OUTLINED_FUNCTION_7();
    v11 = (void **)(v10 + 32);
    do
    {
      v13 = *v11++;
      v12 = v13;
      if (v13)
      {
        v14 = v12;
        OUTLINED_FUNCTION_44_2();
      }
      --v1;
    }
    while (v1);
    swift_bridgeObjectRelease();
  }
  OUTLINED_FUNCTION_24_3();
  OUTLINED_FUNCTION_25_2();
  OUTLINED_FUNCTION_25_2();
  OUTLINED_FUNCTION_99();
  OUTLINED_FUNCTION_83();
  OUTLINED_FUNCTION_76();
  OUTLINED_FUNCTION_85();
  OUTLINED_FUNCTION_61();
  v15 = OUTLINED_FUNCTION_41_1();
  return OUTLINED_FUNCTION_1_13(v15, v16);
}

uint64_t sub_23A49C7C0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  *(_QWORD *)(v2 + 16) = a1;
  *(_QWORD *)(v2 + 24) = a2;
  return swift_task_switch();
}

uint64_t sub_23A49C7D8()
{
  uint64_t v0;

  sub_23A49F7F4(*(_QWORD *)(v0 + 24), *(_QWORD *)(v0 + 16));
  return OUTLINED_FUNCTION_2_10(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_23A49C804(uint64_t a1)
{
  NSObject *v1;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void **v10;
  uint64_t v11;
  os_log_type_t v12;
  uint8_t *v13;
  void *v14;
  unint64_t v15;
  uint64_t result;
  id v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  id v21;
  id v22;
  uint64_t v23;
  NSObject *v24;
  os_log_type_t v25;
  uint8_t *v26;
  uint64_t v27;
  unint64_t v28;
  NSObject *v29;
  os_log_type_t v30;
  uint8_t *v31;
  uint64_t v32;
  uint8_t *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;

  v35 = sub_23A4AA540();
  v3 = *(_QWORD *)(v35 - 8);
  MEMORY[0x24BDAC7A8](v35);
  v5 = (char *)&v32 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_23A4AA54C();
  v7 = *(_QWORD *)(v6 - 8);
  v8 = MEMORY[0x24BDAC7A8](v6);
  MEMORY[0x24BDAC7A8](v8);
  v10 = (void **)((char *)&v32 - v9);
  if (qword_25697FF48 != -1)
    swift_once();
  v11 = OUTLINED_FUNCTION_39();
  __swift_project_value_buffer(v11, (uint64_t)qword_2569815D0);
  OUTLINED_FUNCTION_83_0();
  v12 = OUTLINED_FUNCTION_69_0();
  if (os_log_type_enabled(v1, v12))
  {
    v13 = (uint8_t *)OUTLINED_FUNCTION_3_0();
    v33 = (uint8_t *)v6;
    *(_WORD *)v13 = 0;
    OUTLINED_FUNCTION_55_0(&dword_23A470000, v1, v12, "DeviceExpertTellMeGeneratedFlow#onInput", v13);
    OUTLINED_FUNCTION_0_0();
  }

  sub_23A4AA534();
  if ((*(unsigned int (**)(void **, uint64_t))(v7 + 88))(v10, v6) != *MEMORY[0x24BE98E20])
  {
    OUTLINED_FUNCTION_115(*(uint64_t (**)(uint64_t, uint64_t))(v7 + 8));
    OUTLINED_FUNCTION_112((uint64_t)v5, a1, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v3 + 16));
    v23 = v3;
    v24 = sub_23A4AA6D8();
    v25 = sub_23A4AA8D0();
    if (os_log_type_enabled(v24, v25))
    {
      v34 = v23;
      v26 = (uint8_t *)OUTLINED_FUNCTION_3_0();
      v37 = OUTLINED_FUNCTION_3_0();
      *(_DWORD *)v26 = 136315138;
      v33 = v26 + 4;
      sub_23A4AA534();
      v27 = sub_23A4AA7E0();
      v36 = sub_23A49D6D8(v27, v28, &v37);
      sub_23A4AA900();
      OUTLINED_FUNCTION_52();
      OUTLINED_FUNCTION_121(*(uint64_t (**)(uint64_t, uint64_t))(v34 + 8));
      OUTLINED_FUNCTION_12(&dword_23A470000, v24, v25, "DeviceExpertTellMeGeneratedFlow#onInput - Parse is of unexpected type: %s", v26);
      OUTLINED_FUNCTION_42_1();
      OUTLINED_FUNCTION_0_0();
    }
    OUTLINED_FUNCTION_121(*(uint64_t (**)(uint64_t, uint64_t))(v23 + 8));

    return 0;
  }
  OUTLINED_FUNCTION_115(*(uint64_t (**)(uint64_t, uint64_t))(v7 + 96));
  v14 = *v10;
  v15 = sub_23A4AA6C0();
  if (!(v15 >> 62))
  {
    result = *(_QWORD *)((v15 & 0xFFFFFFFFFFFFF8) + 0x10);
    if (result)
      goto LABEL_8;
LABEL_18:
    OUTLINED_FUNCTION_52();
LABEL_19:
    v29 = sub_23A4AA6D8();
    v30 = sub_23A4AA8D0();
    if (os_log_type_enabled(v29, v30))
    {
      v31 = (uint8_t *)OUTLINED_FUNCTION_3_0();
      *(_WORD *)v31 = 0;
      OUTLINED_FUNCTION_55_0(&dword_23A470000, v29, v30, "DeviceExpertTellMeGeneratedFlow#onInput - Unexpected experience in pommes", v31);
      OUTLINED_FUNCTION_0_0();
    }

    return 0;
  }
  result = sub_23A4AA9D8();
  if (!result)
    goto LABEL_18;
LABEL_8:
  if ((v15 & 0xC000000000000001) != 0)
  {
    v17 = (id)MEMORY[0x23B84DDA0](0, v15);
    goto LABEL_11;
  }
  if (*(_QWORD *)((v15 & 0xFFFFFFFFFFFFF8) + 0x10))
  {
    v17 = *(id *)(v15 + 32);
LABEL_11:
    v18 = v17;
    OUTLINED_FUNCTION_52();
    sub_23A4AA66C();
    v19 = swift_dynamicCastClass();
    if (v19)
    {
      v20 = v19;
      v21 = v14;
      sub_23A498E00((uint64_t)v14);
      v22 = v18;
      sub_23A498E0C(v20);

      return 1;
    }

    goto LABEL_19;
  }
  __break(1u);
  return result;
}

uint64_t sub_23A49CC38@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v4 = *(_QWORD *)(a1 + 16);
  v5 = sub_23A4AA27C();
  v6 = v5;
  if (v4)
  {
    (*(void (**)(uint64_t, unint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, a1+ ((*(unsigned __int8 *)(*(_QWORD *)(v5 - 8) + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(v5 - 8) + 80)), v5);
    v7 = 0;
  }
  else
  {
    v7 = 1;
  }
  return __swift_storeEnumTagSinglePayload(a2, v7, 1, v6);
}

uint64_t DeviceExpertTellMeGeneratedFlow.deinit()
{
  uint64_t v0;

  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  swift_release();
  swift_release();
  swift_release();
  __swift_destroy_boxed_opaque_existential_1(v0 + 80);
  __swift_destroy_boxed_opaque_existential_1(v0 + 120);
  swift_release();
  sub_23A49F5E4(v0 + 168);
  __swift_destroy_boxed_opaque_existential_1(v0 + 208);

  sub_23A49DEDC(*(_QWORD *)(v0 + 264), *(_QWORD *)(v0 + 272));
  return v0;
}

uint64_t DeviceExpertTellMeGeneratedFlow.__deallocating_deinit()
{
  DeviceExpertTellMeGeneratedFlow.deinit();
  return swift_deallocClassInstance();
}

uint64_t sub_23A49CD48(uint64_t a1)
{
  return sub_23A49C804(a1) & 1;
}

uint64_t sub_23A49CD6C()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 16) = v1;
  *v1 = v0;
  v1[1] = sub_23A49CDD4;
  return sub_23A4AA3C0();
}

uint64_t sub_23A49CDD4(uint64_t a1)
{
  uint64_t v1;

  OUTLINED_FUNCTION_45();
  return (*(uint64_t (**)(uint64_t))(v1 + 8))(a1);
}

void sub_23A49CE18()
{
  sub_23A499048();
}

uint64_t sub_23A49CE38(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;

  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v3;
  *v3 = v1;
  v3[1] = sub_23A49CE8C;
  return sub_23A4990F0(a1);
}

uint64_t sub_23A49CE8C()
{
  uint64_t v0;

  OUTLINED_FUNCTION_45();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_23A49CEC8()
{
  type metadata accessor for DeviceExpertTellMeGeneratedFlow();
  return sub_23A4AA3CC();
}

uint64_t sub_23A49CEF0(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  *(_QWORD *)(v4 + 24) = a2;
  *(_QWORD *)(v4 + 32) = v3;
  *(_BYTE *)(v4 + 96) = a3;
  *(_QWORD *)(v4 + 16) = a1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2569807B8);
  *(_QWORD *)(v4 + 40) = swift_task_alloc();
  v5 = sub_23A4AA588();
  *(_QWORD *)(v4 + 48) = v5;
  *(_QWORD *)(v4 + 56) = *(_QWORD *)(v5 - 8);
  *(_QWORD *)(v4 + 64) = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_23A49CF7C()
{
  uint64_t v0;
  unint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;

  OUTLINED_FUNCTION_53_1();
  v1 = *(_QWORD *)(v0 + 24);
  if (!v1)
    goto LABEL_6;
  v2 = HIBYTE(v1) & 0xF;
  if ((v1 & 0x2000000000000000) == 0)
    v2 = *(_QWORD *)(v0 + 16) & 0xFFFFFFFFFFFFLL;
  if (v2)
  {
    v4 = *(_QWORD *)(v0 + 56);
    v3 = *(_QWORD *)(v0 + 64);
    v6 = *(_QWORD *)(v0 + 40);
    v5 = *(_QWORD *)(v0 + 48);
    OUTLINED_FUNCTION_7();
    OUTLINED_FUNCTION_13_3();
    OUTLINED_FUNCTION_120(v6, v3, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v4 + 16));
    __swift_storeEnumTagSinglePayload(v6, 0, 1, v5);
    v7 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 72) = v7;
    *v7 = v0;
    v7[1] = sub_23A49D07C;
    return sub_23A48D6DC(*(_BYTE *)(v0 + 96), *(_QWORD *)(v0 + 40));
  }
  else
  {
LABEL_6:
    swift_task_dealloc();
    OUTLINED_FUNCTION_93();
    return (*(uint64_t (**)(_QWORD))(v0 + 8))(0);
  }
}

uint64_t sub_23A49D07C(uint64_t a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v4;
  uint64_t v5;

  v4 = *v2;
  *(_QWORD *)(*v2 + 80) = v1;
  swift_task_dealloc();
  v5 = *(_QWORD *)(v4 + 40);
  if (!v1)
    *(_QWORD *)(v4 + 88) = a1;
  sub_23A49F88C(v5, &qword_2569807B8);
  OUTLINED_FUNCTION_24();
  return OUTLINED_FUNCTION_0_12();
}

uint64_t sub_23A49D0FC()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t (*v2)(void);

  (*(void (**)(_QWORD, _QWORD))(v0[7] + 8))(v0[8], v0[6]);
  swift_task_dealloc();
  OUTLINED_FUNCTION_99();
  v1 = OUTLINED_FUNCTION_41_1();
  return OUTLINED_FUNCTION_76_0(v1, v2);
}

uint64_t sub_23A49D148()
{
  uint64_t v0;

  (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 56) + 8))(*(_QWORD *)(v0 + 64), *(_QWORD *)(v0 + 48));
  OUTLINED_FUNCTION_93();
  OUTLINED_FUNCTION_99();
  return OUTLINED_FUNCTION_75_0(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_23A49D18C(uint64_t a1, char a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  *(_BYTE *)(v3 + 88) = a2;
  *(_QWORD *)(v3 + 16) = a1;
  *(_QWORD *)(v3 + 24) = v2;
  v4 = sub_23A4AA588();
  *(_QWORD *)(v3 + 32) = v4;
  *(_QWORD *)(v3 + 40) = *(_QWORD *)(v4 - 8);
  *(_QWORD *)(v3 + 48) = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_23A49D1F0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12)
{
  uint64_t v12;
  uint64_t v13;
  int64_t v14;
  uint64_t v15;
  int64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  uint64_t v21;
  unint64_t v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, _QWORD, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  unint64_t v35;
  unint64_t v36;
  uint64_t v37;
  uint64_t v38;
  _QWORD *v39;
  uint64_t v40;
  uint64_t v41;
  _QWORD *v42;
  uint64_t v43;
  uint64_t v44;

  OUTLINED_FUNCTION_54();
  v13 = *(_QWORD *)(v12 + 16);
  v14 = *(_QWORD *)(v13 + 16);
  if (v14)
  {
    v15 = sub_23A49DFBC(1, *(_QWORD *)(v13 + 16));
    v16 = *(_QWORD *)(v15 + 16);
    v17 = MEMORY[0x24BEE4AF8];
    if (v16)
    {
      v44 = MEMORY[0x24BEE4AF8];
      sub_23A4A8910(0, v16, 0);
      v18 = 0;
      v19 = v44;
      v20 = *(_QWORD *)(v44 + 16);
      do
      {
        v21 = *(_QWORD *)(v15 + 8 * v18 + 32);
        v22 = *(_QWORD *)(v44 + 24);
        if (v20 >= v22 >> 1)
          sub_23A4A8910((char *)(v22 > 1), v20 + 1, 1);
        ++v18;
        *(_QWORD *)(v44 + 16) = v20 + 1;
        *(double *)(v44 + 8 * v20++ + 32) = (double)v21;
      }
      while (v16 != v18);
      OUTLINED_FUNCTION_104();
      v17 = MEMORY[0x24BEE4AF8];
    }
    else
    {
      OUTLINED_FUNCTION_104();
      v19 = MEMORY[0x24BEE4AF8];
    }
    *(_QWORD *)(v12 + 56) = v19;
    v32 = *(_QWORD *)(v12 + 40);
    v33 = *(_QWORD *)(v12 + 16);
    sub_23A4A889C(0, v14, 0);
    v34 = v33 + 40;
    do
    {
      swift_bridgeObjectRetain();
      OUTLINED_FUNCTION_13_3();
      v36 = *(_QWORD *)(v17 + 16);
      v35 = *(_QWORD *)(v17 + 24);
      if (v36 >= v35 >> 1)
        sub_23A4A889C(v35 > 1, v36 + 1, 1);
      *(_QWORD *)(v12 + 64) = v17;
      v37 = *(_QWORD *)(v12 + 48);
      v38 = *(_QWORD *)(v12 + 32);
      *(_QWORD *)(v17 + 16) = v36 + 1;
      (*(void (**)(unint64_t, uint64_t, uint64_t))(v32 + 32))(v17+ ((*(unsigned __int8 *)(v32 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v32 + 80))+ *(_QWORD *)(v32 + 72) * v36, v37, v38);
      v34 += 16;
      --v14;
    }
    while (v14);
    if (*(_BYTE *)(v12 + 88) == 1)
    {
      v39 = (_QWORD *)swift_task_alloc();
      *(_QWORD *)(v12 + 72) = v39;
      *v39 = v12;
      v39[1] = sub_23A49D44C;
      OUTLINED_FUNCTION_46_1();
      return sub_23A48D8D0(v40, v41);
    }
    else
    {
      OUTLINED_FUNCTION_60_1();
      v42 = (_QWORD *)swift_task_alloc();
      *(_QWORD *)(v12 + 80) = v42;
      *v42 = v12;
      v42[1] = sub_23A49D4E0;
      OUTLINED_FUNCTION_46_1();
      return sub_23A48D588(v43);
    }
  }
  else
  {
    swift_task_dealloc();
    OUTLINED_FUNCTION_46_1();
    return v24(v23, v24, v25, v26, v27, v28, v29, v30, a9, a10, a11, a12);
  }
}

uint64_t sub_23A49D44C(uint64_t a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v5;

  v5 = *v2;
  OUTLINED_FUNCTION_122(&v5);
  OUTLINED_FUNCTION_94_0();
  swift_bridgeObjectRelease();
  swift_task_dealloc();
  if (v1)
    return ((uint64_t (*)(void))v2[1])();
  else
    return ((uint64_t (*)(uint64_t))v2[1])(a1);
}

uint64_t sub_23A49D4E0(uint64_t a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v5;

  v5 = *v2;
  OUTLINED_FUNCTION_122(&v5);
  OUTLINED_FUNCTION_94_0();
  swift_task_dealloc();
  if (v1)
    return OUTLINED_FUNCTION_75_0((uint64_t (*)(void))v2[1]);
  else
    return OUTLINED_FUNCTION_76_0(a1, (uint64_t (*)(void))v2[1]);
}

uint64_t sub_23A49D558(uint64_t result, _BYTE **a2)
{
  _BYTE *v2;

  v2 = *a2;
  *v2 = result;
  *a2 = v2 + 1;
  return result;
}

uint64_t sub_23A49D568(uint64_t (**a1)(uint64_t, uint64_t, uint64_t), uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*a1)(a2, a3, a4);
}

uint64_t sub_23A49D59C(uint64_t a1)
{
  uint64_t v2;
  uint64_t result;

  if (a1 < 0)
  {
    result = sub_23A4AA9C0();
    __break(1u);
  }
  else
  {
    if (a1)
    {
      sub_23A4AA27C();
      v2 = sub_23A4AA888();
      *(_QWORD *)(v2 + 16) = a1;
    }
    else
    {
      v2 = MEMORY[0x24BEE4AF8];
    }
    sub_23A4AA27C();
    return v2;
  }
  return result;
}

uint64_t sub_23A49D658(uint64_t (*a1)(void))
{
  return a1();
}

void sub_23A49D678(uint64_t *a1, uint64_t a2, uint64_t *a3, uint64_t (*a4)(void))
{
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;

  v6 = a4();
  sub_23A49D6D8(v6, v7, a3);
  v8 = *a1 + 8;
  sub_23A4AA900();
  OUTLINED_FUNCTION_52();
  *a1 = v8;
  OUTLINED_FUNCTION_3_3();
}

uint64_t sub_23A49D6D8(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  _QWORD *v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD v15[3];
  uint64_t ObjectType;

  OUTLINED_FUNCTION_24();
  v9 = sub_23A49D7A0(v6, v7, v8, 1, a1, a2);
  v10 = v15[0];
  if (v9)
  {
    v11 = v9;
    ObjectType = swift_getObjectType();
    v15[0] = v11;
    v12 = *a3;
    if (*a3)
    {
      sub_23A47C554((uint64_t)v15, *a3);
      *a3 = v12 + 32;
    }
  }
  else
  {
    ObjectType = MEMORY[0x24BEE2520];
    v15[0] = a1;
    v15[1] = a2;
    v13 = *a3;
    if (*a3)
    {
      sub_23A47C554((uint64_t)v15, *a3);
      *a3 = v13 + 32;
    }
    OUTLINED_FUNCTION_96_0();
  }
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v15);
  return v10;
}

uint64_t sub_23A49D7A0(_QWORD *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
{
  uint64_t v8;
  uint64_t result;
  uint64_t v11;
  _QWORD __src[2];

  if ((a6 & 0x2000000000000000) != 0)
  {
    if ((a4 & 1) == 0 && __dst && a3 - (uint64_t)__dst > (uint64_t)(HIBYTE(a6) & 0xF))
    {
      __src[0] = a5;
      __src[1] = a6 & 0xFFFFFFFFFFFFFFLL;
      sub_23A49D8F4((char *)__src, HIBYTE(a6) & 0xF, __dst);
      sub_23A4AA90C();
      result = 0;
      *a1 = __dst;
      return result;
    }
    goto LABEL_11;
  }
  if ((a6 & 0x1000000000000000) != 0)
  {
LABEL_11:
    result = sub_23A49D9B8(a5, a6);
    *a1 = v11;
    return result;
  }
  if ((a5 & 0x1000000000000000) != 0)
  {
    v8 = (a6 & 0xFFFFFFFFFFFFFFFLL) + 32;
  }
  else
  {
    v8 = sub_23A4AA960();
    if (!v8)
    {
      result = sub_23A4AA9C0();
      __break(1u);
      return result;
    }
  }
  *a1 = v8;
  if ((a6 & 0x8000000000000000) != 0)
    return 0;
  else
    return swift_unknownObjectRetain();
}

void *sub_23A49D8F4(char *__src, size_t __n, char *__dst)
{
  void *result;

  if ((__n & 0x8000000000000000) == 0 && (&__dst[__n] <= __src || &__src[__n] <= __dst))
    return memcpy(__dst, __src, __n);
  result = (void *)sub_23A4AA9E4();
  __break(1u);
  return result;
}

uint64_t sub_23A49D9B8(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v2 = sub_23A49DA4C(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v2 = (uint64_t)sub_23A49DC20(0, *(_QWORD *)(v2 + 16) + 1, 1, v2);
  v4 = *(_QWORD *)(v2 + 16);
  v3 = *(_QWORD *)(v2 + 24);
  if (v4 >= v3 >> 1)
    v2 = (uint64_t)sub_23A49DC20((char *)(v3 > 1), v4 + 1, 1, v2);
  *(_QWORD *)(v2 + 16) = v4 + 1;
  *(_BYTE *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_23A49DA4C(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  _QWORD *v3;
  _QWORD *v4;
  uint64_t v5;
  char v6;
  uint64_t result;

  if ((a2 & 0x1000000000000000) != 0)
  {
    v2 = sub_23A4AA810();
    if (v2)
      goto LABEL_6;
    return MEMORY[0x24BEE4AF8];
  }
  if ((a2 & 0x2000000000000000) != 0)
    v2 = HIBYTE(a2) & 0xF;
  else
    v2 = a1 & 0xFFFFFFFFFFFFLL;
  if (!v2)
    return MEMORY[0x24BEE4AF8];
LABEL_6:
  v3 = sub_23A49DBBC(v2, 0);
  if ((v2 & 0x8000000000000000) == 0)
  {
    v4 = v3;
    v5 = sub_23A4AA930();
    if ((v6 & 1) != 0 || v5 != v2)
      goto LABEL_14;
    return (uint64_t)v4;
  }
  sub_23A4AA9E4();
  __break(1u);
LABEL_14:
  result = sub_23A4AA9C0();
  __break(1u);
  return result;
}

_QWORD *sub_23A49DBBC(uint64_t a1, uint64_t a2)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_256981790);
  v4 = (_QWORD *)swift_allocObject();
  v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

char *sub_23A49DC20(char *result, int64_t a2, char a3, uint64_t a4)
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
    v6 = *(_QWORD *)(a4 + 24);
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
  v8 = *(_QWORD *)(a4 + 16);
  if (v7 <= v8)
    v9 = *(_QWORD *)(a4 + 16);
  else
    v9 = v7;
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_256981790);
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
  v13 = (char *)(a4 + 32);
  if ((v5 & 1) != 0)
  {
    sub_23A49DDB8(v13, v8, v12);
    *(_QWORD *)(a4 + 16) = 0;
  }
  else
  {
    sub_23A49DCF4(v13, v8, v12);
  }
  swift_bridgeObjectRelease();
  return v10;
}

void *sub_23A49DCF4(char *__src, size_t __n, char *__dst)
{
  void *result;

  if ((__n & 0x8000000000000000) == 0 && (&__dst[__n] <= __src || &__src[__n] <= __dst))
    return memcpy(__dst, __src, __n);
  result = (void *)sub_23A4AA9E4();
  __break(1u);
  return result;
}

char *sub_23A49DDB8(char *__src, size_t __len, char *__dst)
{
  if ((__len & 0x8000000000000000) != 0)
  {
    __src = (char *)sub_23A4AA9E4();
    __break(1u);
  }
  else if (__dst != __src || &__src[__len] <= __dst)
  {
    return (char *)memmove(__dst, __src, __len);
  }
  return __src;
}

_BYTE **sub_23A49DE38(_BYTE **result, uint64_t a2, uint64_t a3, char a4)
{
  _BYTE *v4;

  v4 = *result;
  *v4 = a4;
  *result = v4 + 1;
  return result;
}

uint64_t sub_23A49DE48()
{
  return sub_23A4AA900();
}

uint64_t sub_23A49DE6C@<X0>(uint64_t (*a1)(void)@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result;

  result = a1();
  *a2 = result;
  return result;
}

uint64_t sub_23A49DE94(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_256980070);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_23A49DEDC(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  if (a2)
  {
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_23A49DF0C()
{
  uint64_t v0;

  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  return swift_deallocObject();
}

uint64_t sub_23A49DF30(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  _QWORD *v4;

  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v4;
  *v4 = v2;
  v4[1] = sub_23A49DF88;
  return sub_23A49C7C0(a1, v1 + 16);
}

uint64_t sub_23A49DF88()
{
  uint64_t v0;

  OUTLINED_FUNCTION_45();
  return OUTLINED_FUNCTION_2_10(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_23A49DFBC(uint64_t result, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  _QWORD *v6;
  size_t v7;
  uint64_t v8;

  v2 = a2 - result;
  if (__OFSUB__(a2, result))
  {
    __break(1u);
    goto LABEL_11;
  }
  v3 = v2 + 1;
  if (__OFADD__(v2, 1))
  {
LABEL_11:
    __break(1u);
    goto LABEL_12;
  }
  if (v2 == -1)
    return MEMORY[0x24BEE4AF8];
  v5 = result;
  if (v3 <= 0)
  {
    v6 = (_QWORD *)MEMORY[0x24BEE4AF8];
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_2569817A8);
    v6 = (_QWORD *)swift_allocObject();
    v7 = _swift_stdlib_malloc_size(v6);
    v6[2] = v3;
    v6[3] = 2 * ((uint64_t)(v7 - 32) / 8);
  }
  result = sub_23A49F258((uint64_t)&v8, (uint64_t)(v6 + 4), v3, v5, a2);
  if (result == v3)
    return (uint64_t)v6;
LABEL_12:
  __break(1u);
  return result;
}

uint64_t sub_23A49E088(size_t *a1)
{
  uint64_t v2;
  size_t v3;
  uint64_t v4;
  uint64_t result;
  _QWORD v6[2];

  v2 = *(_QWORD *)(sub_23A4AA27C() - 8);
  v3 = *a1;
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v3 = sub_23A49F244(v3);
  v4 = *(_QWORD *)(v3 + 16);
  v6[0] = v3 + ((*(unsigned __int8 *)(v2 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80));
  v6[1] = v4;
  result = sub_23A49E108(v6);
  *a1 = v3;
  return result;
}

uint64_t sub_23A49E108(_QWORD *a1)
{
  uint64_t v1;
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
  uint64_t result;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  _QWORD *v22;
  uint64_t v23;
  void (*v24)(char *, char *, uint64_t);
  uint64_t v25;
  char *v26;
  char *v27;
  char *v28;
  float v29;
  float v30;
  float v31;
  float v32;
  void (*v33)(char *, uint64_t);
  char *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  char *v38;
  uint64_t v39;
  char *v40;
  uint64_t v41;
  char *v42;
  float v43;
  float v44;
  float v45;
  _BOOL4 v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  char *v52;
  uint64_t v53;
  char *v54;
  char *v55;
  uint64_t v56;
  char *v58;
  uint64_t v59;
  char *v60;
  uint64_t v61;
  char *v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  char *v66;
  char *v67;
  void (*v68)(char *, uint64_t, uint64_t);
  uint64_t v69;
  uint64_t v70;
  _QWORD *v71;
  char *v72;
  float v73;
  float v74;
  float v75;
  float v76;
  void (*v77)(char *, uint64_t);
  uint64_t v78;
  uint64_t v79;
  void (*v80)(char *, char *, uint64_t);
  uint64_t v81;
  unint64_t v82;
  unint64_t v83;
  unint64_t v84;
  uint64_t v85;
  uint64_t *v86;
  uint64_t v87;
  unint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  char v92;
  unint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  BOOL v99;
  unint64_t v100;
  uint64_t *v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t *v106;
  uint64_t v107;
  uint64_t v108;
  BOOL v109;
  uint64_t v110;
  char v111;
  uint64_t *v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  BOOL v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t *v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t *v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  unint64_t v127;
  uint64_t v128;
  uint64_t *v129;
  uint64_t v130;
  _QWORD *v131;
  uint64_t v132;
  unint64_t v133;
  char *v134;
  unint64_t v135;
  uint64_t v136;
  uint64_t v137;
  _QWORD *v138;
  unint64_t v139;
  uint64_t v140;
  uint64_t v141;
  uint64_t v142;
  uint64_t v143;
  uint64_t v144;
  uint64_t v145;
  char *v146;
  uint64_t v147;
  unint64_t v148;
  char *v149;
  char *v150;
  char *v151;
  char *v152;
  char *v153;
  uint64_t v154;
  _QWORD *v155;
  uint64_t v156;
  char *v157;
  char *v158;
  uint64_t v159;
  _QWORD *v160;

  v2 = v1;
  v4 = sub_23A4AA27C();
  v160 = *(_QWORD **)(v4 - 8);
  v5 = MEMORY[0x24BDAC7A8](v4);
  v146 = (char *)&v140 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = MEMORY[0x24BDAC7A8](v5);
  v157 = (char *)&v140 - v8;
  v9 = MEMORY[0x24BDAC7A8](v7);
  v152 = (char *)&v140 - v10;
  MEMORY[0x24BDAC7A8](v9);
  v153 = (char *)&v140 - v11;
  v12 = a1[1];
  result = sub_23A4AAAA4();
  if (result >= v12)
  {
    if ((v12 & 0x8000000000000000) == 0)
    {
      if (v12)
        return sub_23A49EABC(0, v12, 1, a1);
      return result;
    }
LABEL_140:
    __break(1u);
LABEL_141:
    __break(1u);
LABEL_142:
    __break(1u);
LABEL_143:
    __break(1u);
    goto LABEL_144;
  }
  v14 = result;
  result = sub_23A49D59C(v12 / 2);
  v142 = result;
  v143 = v12;
  v148 = v15;
  if (v12 <= 0)
  {
    v17 = MEMORY[0x24BEE4AF8];
    v84 = *(_QWORD *)(MEMORY[0x24BEE4AF8] + 16);
LABEL_102:
    if (v84 < 2)
      goto LABEL_116;
    v134 = (char *)*a1;
    while (1)
    {
      v135 = v84 - 2;
      if (v84 < 2)
        break;
      if (!v134)
        goto LABEL_148;
      v136 = *(_QWORD *)(v17 + 32 + 16 * v135);
      v137 = *(_QWORD *)(v17 + 32 + 16 * (v84 - 1) + 8);
      result = sub_23A49ED20((unint64_t)&v134[v160[9] * v136], (unint64_t)&v134[v160[9] * *(_QWORD *)(v17 + 32 + 16 * (v84 - 1))], (unint64_t)&v134[v160[9] * v137], v148);
      if (v2)
        goto LABEL_114;
      if (v137 < v136)
        goto LABEL_135;
      result = swift_isUniquelyReferenced_nonNull_native();
      if ((result & 1) == 0)
      {
        result = (uint64_t)sub_23A49F230(v17);
        v17 = result;
      }
      if (v135 >= *(_QWORD *)(v17 + 16))
        goto LABEL_136;
      v138 = (_QWORD *)(v17 + 32 + 16 * v135);
      *v138 = v136;
      v138[1] = v137;
      v139 = *(_QWORD *)(v17 + 16);
      if (v84 > v139)
        goto LABEL_137;
      result = (uint64_t)memmove((void *)(v17 + 32 + 16 * (v84 - 1)), (const void *)(v17 + 32 + 16 * v84), 16 * (v139 - v84));
      *(_QWORD *)(v17 + 16) = v139 - 1;
      v84 = v139 - 1;
      if (v139 <= 2)
        goto LABEL_116;
    }
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
    goto LABEL_140;
  }
  v141 = v14;
  v154 = v4;
  v16 = 0;
  v17 = MEMORY[0x24BEE4AF8];
  v18 = v12;
  v155 = a1;
  while (1)
  {
    v19 = v16;
    v20 = v16 + 1;
    v144 = v17;
    v147 = v16;
    if (v16 + 1 >= v18)
    {
      v37 = v16 + 1;
    }
    else
    {
      v149 = (char *)*a1;
      v21 = v149;
      v22 = v160;
      v23 = v160[9];
      v158 = (char *)v18;
      v159 = v23;
      v24 = (void (*)(char *, char *, uint64_t))v160[2];
      v25 = v154;
      v24(v153, &v149[v23 * v20], v154);
      v26 = &v21[v23 * v19];
      v27 = v152;
      v24(v152, v26, v25);
      v28 = v153;
      sub_23A4AA168();
      v30 = v29;
      sub_23A4AA168();
      v32 = v31;
      v33 = (void (*)(char *, uint64_t))v22[1];
      v34 = v27;
      v19 = v147;
      v33(v34, v25);
      v35 = v25;
      v18 = (uint64_t)v158;
      result = ((uint64_t (*)(char *, uint64_t))v33)(v28, v35);
      v36 = v159;
      v37 = v19 + 2;
      if (v19 + 2 >= v18)
      {
        a1 = v155;
      }
      else
      {
        v140 = v2;
        v156 = v159 * v20;
        v38 = v149;
        v151 = (char *)(v159 * v37);
        while (1)
        {
          v39 = v37;
          v40 = v153;
          v41 = v154;
          v24(v153, &v151[(_QWORD)v38], v154);
          v42 = v152;
          v24(v152, &v38[v156], v41);
          sub_23A4AA168();
          v44 = v43;
          sub_23A4AA168();
          v46 = v45 >= v44;
          v33(v42, v41);
          result = ((uint64_t (*)(char *, uint64_t))v33)(v40, v41);
          if (v32 < v30 == v46)
            break;
          v37 = v39 + 1;
          v36 = v159;
          v38 += v159;
          if (v39 + 1 >= (uint64_t)v158)
          {
            v18 = (uint64_t)v158;
            v37 = (uint64_t)v158;
            a1 = v155;
            v2 = v140;
            v17 = v144;
            v19 = v147;
            goto LABEL_13;
          }
        }
        a1 = v155;
        v2 = v140;
        v37 = v39;
        v17 = v144;
        v19 = v147;
        v18 = (uint64_t)v158;
        v36 = v159;
      }
LABEL_13:
      if (v32 < v30)
      {
        if (v37 < v19)
          goto LABEL_141;
        if (v19 < v37)
        {
          v47 = 0;
          v48 = v36 * (v37 - 1);
          v49 = v37 * v36;
          v50 = v19;
          v51 = v19 * v36;
          v156 = v37;
          do
          {
            if (v50 != v37 + v47 - 1)
            {
              v52 = v149;
              if (!v149)
                goto LABEL_147;
              v53 = v2;
              v54 = &v149[v51];
              v55 = (char *)v160[4];
              v56 = v154;
              v150 = &v149[v48];
              v151 = v55;
              ((void (*)(char *, char *, uint64_t))v55)(v146, &v149[v51], v154);
              if (v51 < v48 || v54 >= &v52[v49])
              {
                v58 = v150;
                swift_arrayInitWithTakeFrontToBack();
              }
              else
              {
                v58 = v150;
                if (v51 != v48)
                  swift_arrayInitWithTakeBackToFront();
              }
              result = ((uint64_t (*)(char *, char *, uint64_t))v151)(v58, v146, v56);
              v17 = v144;
              v2 = v53;
              a1 = v155;
              v37 = v156;
              v36 = v159;
            }
            ++v50;
            --v47;
            v48 -= v36;
            v49 -= v36;
            v51 += v36;
          }
          while (v50 < v37 + v47);
          v19 = v147;
          v18 = (uint64_t)v158;
        }
      }
    }
    if (v37 < v18)
    {
      if (__OFSUB__(v37, v19))
        goto LABEL_139;
      if (v37 - v19 < v141)
      {
        if (__OFADD__(v19, v141))
          goto LABEL_142;
        if (v19 + v141 >= v18)
          v59 = v18;
        else
          v59 = v19 + v141;
        if (v59 < v19)
          goto LABEL_143;
        if (v37 != v59)
        {
          v140 = v2;
          v60 = (char *)v160[9];
          v149 = (char *)v160[2];
          v150 = v60;
          v61 = (_QWORD)v60 * (v37 - 1);
          v62 = (char *)(v37 * (_QWORD)v60);
          v63 = v154;
          v145 = v59;
          do
          {
            v64 = 0;
            v156 = v37;
            v151 = v62;
            while (1)
            {
              v65 = *a1;
              v158 = &v62[v64];
              v159 = v19;
              v66 = &v62[v64 + v65];
              v67 = v153;
              v68 = (void (*)(char *, uint64_t, uint64_t))v149;
              ((void (*)(char *, char *, uint64_t))v149)(v153, v66, v63);
              v69 = v61;
              v70 = v61 + v64 + v65;
              v71 = a1;
              v72 = v152;
              v68(v152, v70, v63);
              sub_23A4AA168();
              v74 = v73;
              sub_23A4AA168();
              v76 = v75;
              v77 = (void (*)(char *, uint64_t))v160[1];
              v77(v72, v63);
              result = ((uint64_t (*)(char *, uint64_t))v77)(v67, v63);
              if (v76 >= v74)
                break;
              v78 = *v71;
              if (!*v71)
                goto LABEL_145;
              v62 = v151;
              v61 = v69;
              v79 = v78 + v69 + v64;
              v80 = (void (*)(char *, char *, uint64_t))v160[4];
              v63 = v154;
              v80(v157, &v151[v78 + v64], v154);
              swift_arrayInitWithTakeFrontToBack();
              result = ((uint64_t (*)(uint64_t, char *, uint64_t))v80)(v79, v157, v63);
              v64 -= (uint64_t)v150;
              v19 = v159 + 1;
              a1 = v155;
              v81 = v156;
              if (v156 == v159 + 1)
                goto LABEL_46;
            }
            v63 = v154;
            v81 = v156;
            a1 = v71;
            v61 = v69;
            v62 = v151;
LABEL_46:
            v37 = v81 + 1;
            v61 += (uint64_t)v150;
            v62 = &v150[(_QWORD)v62];
            v19 = v147;
          }
          while (v37 != v145);
          v37 = v145;
          v2 = v140;
          v17 = v144;
        }
      }
    }
    if (v37 < v19)
      goto LABEL_138;
    result = swift_isUniquelyReferenced_nonNull_native();
    v156 = v37;
    if ((result & 1) == 0)
    {
      result = (uint64_t)sub_23A49F13C(0, *(_QWORD *)(v17 + 16) + 1, 1, (char *)v17);
      v17 = result;
    }
    v83 = *(_QWORD *)(v17 + 16);
    v82 = *(_QWORD *)(v17 + 24);
    v84 = v83 + 1;
    if (v83 >= v82 >> 1)
    {
      result = (uint64_t)sub_23A49F13C((char *)(v82 > 1), v83 + 1, 1, (char *)v17);
      v17 = result;
    }
    *(_QWORD *)(v17 + 16) = v84;
    v85 = v17 + 32;
    v86 = (uint64_t *)(v17 + 32 + 16 * v83);
    v87 = v156;
    *v86 = v19;
    v86[1] = v87;
    if (v83)
      break;
    v84 = 1;
LABEL_96:
    v18 = a1[1];
    v16 = v156;
    if (v156 >= v18)
      goto LABEL_102;
  }
  while (1)
  {
    v88 = v84 - 1;
    if (v84 >= 4)
    {
      v93 = v85 + 16 * v84;
      v94 = *(_QWORD *)(v93 - 64);
      v95 = *(_QWORD *)(v93 - 56);
      v99 = __OFSUB__(v95, v94);
      v96 = v95 - v94;
      if (v99)
        goto LABEL_123;
      v98 = *(_QWORD *)(v93 - 48);
      v97 = *(_QWORD *)(v93 - 40);
      v99 = __OFSUB__(v97, v98);
      v91 = v97 - v98;
      v92 = v99;
      if (v99)
        goto LABEL_124;
      v100 = v84 - 2;
      v101 = (uint64_t *)(v85 + 16 * (v84 - 2));
      v103 = *v101;
      v102 = v101[1];
      v99 = __OFSUB__(v102, v103);
      v104 = v102 - v103;
      if (v99)
        goto LABEL_125;
      v99 = __OFADD__(v91, v104);
      v105 = v91 + v104;
      if (v99)
        goto LABEL_127;
      if (v105 >= v96)
      {
        v123 = (uint64_t *)(v85 + 16 * v88);
        v125 = *v123;
        v124 = v123[1];
        v99 = __OFSUB__(v124, v125);
        v126 = v124 - v125;
        if (v99)
          goto LABEL_133;
        v116 = v91 < v126;
        goto LABEL_85;
      }
    }
    else
    {
      if (v84 != 3)
      {
        v117 = *(_QWORD *)(v17 + 32);
        v118 = *(_QWORD *)(v17 + 40);
        v99 = __OFSUB__(v118, v117);
        v110 = v118 - v117;
        v111 = v99;
        goto LABEL_79;
      }
      v90 = *(_QWORD *)(v17 + 32);
      v89 = *(_QWORD *)(v17 + 40);
      v99 = __OFSUB__(v89, v90);
      v91 = v89 - v90;
      v92 = v99;
    }
    if ((v92 & 1) != 0)
      goto LABEL_126;
    v100 = v84 - 2;
    v106 = (uint64_t *)(v85 + 16 * (v84 - 2));
    v108 = *v106;
    v107 = v106[1];
    v109 = __OFSUB__(v107, v108);
    v110 = v107 - v108;
    v111 = v109;
    if (v109)
      goto LABEL_128;
    v112 = (uint64_t *)(v85 + 16 * v88);
    v114 = *v112;
    v113 = v112[1];
    v99 = __OFSUB__(v113, v114);
    v115 = v113 - v114;
    if (v99)
      goto LABEL_130;
    if (__OFADD__(v110, v115))
      goto LABEL_132;
    if (v110 + v115 >= v91)
    {
      v116 = v91 < v115;
LABEL_85:
      if (v116)
        v88 = v100;
      goto LABEL_87;
    }
LABEL_79:
    if ((v111 & 1) != 0)
      goto LABEL_129;
    v119 = (uint64_t *)(v85 + 16 * v88);
    v121 = *v119;
    v120 = v119[1];
    v99 = __OFSUB__(v120, v121);
    v122 = v120 - v121;
    if (v99)
      goto LABEL_131;
    if (v122 < v110)
      goto LABEL_96;
LABEL_87:
    v127 = v88 - 1;
    if (v88 - 1 >= v84)
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
      goto LABEL_134;
    }
    v128 = *a1;
    if (!*a1)
      goto LABEL_146;
    v129 = (uint64_t *)(v85 + 16 * v127);
    v130 = *v129;
    v131 = (_QWORD *)(v85 + 16 * v88);
    v132 = v131[1];
    result = sub_23A49ED20(v128 + v160[9] * *v129, v128 + v160[9] * *v131, v128 + v160[9] * v132, v148);
    if (v2)
      break;
    if (v132 < v130)
      goto LABEL_120;
    if (v88 > *(_QWORD *)(v17 + 16))
      goto LABEL_121;
    *v129 = v130;
    *(_QWORD *)(v85 + 16 * v127 + 8) = v132;
    v133 = *(_QWORD *)(v17 + 16);
    if (v88 >= v133)
      goto LABEL_122;
    v84 = v133 - 1;
    result = (uint64_t)memmove((void *)(v85 + 16 * v88), v131 + 2, 16 * (v133 - 1 - v88));
    *(_QWORD *)(v17 + 16) = v133 - 1;
    a1 = v155;
    if (v133 <= 2)
      goto LABEL_96;
  }
LABEL_114:
  swift_bridgeObjectRelease();
  if (v143 >= -1)
    goto LABEL_117;
  __break(1u);
LABEL_116:
  result = swift_bridgeObjectRelease();
  if (v143 >= -1)
  {
LABEL_117:
    *(_QWORD *)(v142 + 16) = 0;
    return swift_bridgeObjectRelease();
  }
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
  return result;
}

uint64_t sub_23A49EABC(uint64_t a1, uint64_t a2, uint64_t a3, _QWORD *a4)
{
  uint64_t v7;
  _QWORD *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t result;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  _QWORD *v21;
  void (*v22)(char *, uint64_t, uint64_t);
  char *v23;
  float v24;
  float v25;
  float v26;
  float v27;
  void (*v28)(char *, uint64_t);
  char *v29;
  uint64_t v30;
  uint64_t v31;
  _QWORD *v32;
  void (*v33)(char *, uint64_t, uint64_t);
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  void (*v37)(char *, uint64_t, uint64_t);
  char *v38;
  char *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  char *v43;
  _QWORD *v44;
  uint64_t v45;
  uint64_t v46;

  v36 = a1;
  v7 = sub_23A4AA27C();
  v8 = *(_QWORD **)(v7 - 8);
  v9 = MEMORY[0x24BDAC7A8](v7);
  v43 = (char *)&v34 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = MEMORY[0x24BDAC7A8](v9);
  v39 = (char *)&v34 - v12;
  result = MEMORY[0x24BDAC7A8](v11);
  v38 = (char *)&v34 - v14;
  v42 = a3;
  v35 = a2;
  if (a3 != a2)
  {
    v15 = v8[9];
    v37 = (void (*)(char *, uint64_t, uint64_t))v8[2];
    v46 = v15 * (v42 - 1);
    v40 = v15;
    v16 = v15 * v42;
    v44 = a4;
    while (2)
    {
      v17 = 0;
      v45 = v36;
      v41 = v16;
      do
      {
        v18 = *a4;
        v19 = v16 + v17 + *a4;
        v20 = v38;
        v21 = v8;
        v22 = v37;
        v37(v38, v19, v7);
        v23 = v39;
        v22(v39, v46 + v17 + v18, v7);
        v8 = v21;
        v16 = v41;
        sub_23A4AA168();
        v25 = v24;
        sub_23A4AA168();
        v27 = v26;
        v28 = (void (*)(char *, uint64_t))v8[1];
        v28(v23, v7);
        v29 = v20;
        a4 = v44;
        result = ((uint64_t (*)(char *, uint64_t))v28)(v29, v7);
        if (v27 >= v25)
          break;
        v30 = *a4;
        if (!*a4)
        {
          __break(1u);
          return result;
        }
        v31 = v30 + v46 + v17;
        v32 = v8;
        v33 = (void (*)(char *, uint64_t, uint64_t))v8[4];
        v33(v43, v30 + v16 + v17, v7);
        swift_arrayInitWithTakeFrontToBack();
        result = ((uint64_t (*)(uint64_t, char *, uint64_t))v33)(v31, v43, v7);
        v17 -= v40;
        a4 = v44;
        ++v45;
        v8 = v32;
      }
      while (v42 != v45);
      v46 += v40;
      v16 += v40;
      if (++v42 != v35)
        continue;
      break;
    }
  }
  return result;
}

uint64_t sub_23A49ED20(unint64_t a1, unint64_t a2, unint64_t a3, unint64_t a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t result;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  int64_t v15;
  int64_t v17;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  char *v23;
  unint64_t v24;
  char *v25;
  char *v26;
  unint64_t v27;
  char *v28;
  float v29;
  float v30;
  float v31;
  float v32;
  void (*v33)(char *, uint64_t);
  unint64_t v35;
  void (*v39)(char *, unint64_t, uint64_t);
  char *v40;
  uint64_t v41;
  unint64_t v42;
  uint64_t v43;
  void (*v44)(char *, unint64_t, uint64_t);
  unint64_t v45;
  char *v46;
  float v47;
  float v48;
  float v49;
  float v50;
  void (*v51)(char *, uint64_t);
  unint64_t v54;
  char *v56;
  uint64_t v58;
  uint64_t v59;
  unint64_t v60;
  unint64_t v61;
  void (*v62)(char *, unint64_t, uint64_t);
  uint64_t v63;
  uint64_t v64;
  char *v65;
  char *v66;
  char *v67;
  uint64_t v68;

  v8 = sub_23A4AA27C();
  v9 = MEMORY[0x24BDAC7A8](v8);
  v67 = (char *)&v58 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  result = MEMORY[0x24BDAC7A8](v9);
  v66 = (char *)&v58 - v13;
  v68 = v12;
  v14 = *(_QWORD *)(v12 + 72);
  if (!v14)
  {
    __break(1u);
LABEL_79:
    __break(1u);
LABEL_80:
    __break(1u);
    goto LABEL_81;
  }
  v15 = a2 - a1;
  if (a2 - a1 == 0x8000000000000000 && v14 == -1)
    goto LABEL_79;
  v17 = a3 - a2;
  if (a3 - a2 == 0x8000000000000000 && v14 == -1)
    goto LABEL_80;
  v19 = v15 / v14;
  v20 = v17 / v14;
  v59 = *(_QWORD *)(v12 + 72);
  if (v15 / v14 < v17 / v14)
  {
    result = sub_23A4A7BCC(a1, v15 / v14, a4);
    v21 = (char *)(a4 + v19 * v14);
    if (v19 * v14 < 1 || a2 >= a3)
    {
LABEL_41:
      a2 = a1;
      goto LABEL_73;
    }
    v23 = *(char **)(v68 + 16);
    v64 = a4 + v19 * v14;
    v65 = v23;
    while (1)
    {
      v24 = a3;
      v25 = v65;
      v26 = v66;
      ((void (*)(char *, unint64_t, uint64_t))v65)(v66, a2, v8);
      v27 = a2;
      v28 = v67;
      ((void (*)(char *, unint64_t, uint64_t))v25)(v67, a4, v8);
      sub_23A4AA168();
      v30 = v29;
      sub_23A4AA168();
      v32 = v31;
      v33 = *(void (**)(char *, uint64_t))(v68 + 8);
      v33(v28, v8);
      result = ((uint64_t (*)(char *, uint64_t))v33)(v26, v8);
      if (v32 >= v30)
      {
        v35 = a4 + v14;
        if (a1 >= a4 && a1 < v35)
        {
          a3 = v24;
          if (a1 != a4)
            result = swift_arrayInitWithTakeBackToFront();
          a2 = v27;
          a4 = v35;
          v14 = v59;
          goto LABEL_35;
        }
        result = swift_arrayInitWithTakeFrontToBack();
        a2 = v27;
        a4 = v35;
        v14 = v59;
      }
      else
      {
        a2 = v27 + v14;
        if (a1 >= v27 && a1 < a2)
        {
          a3 = v24;
          if (a1 != v27)
            result = swift_arrayInitWithTakeBackToFront();
LABEL_35:
          v21 = (char *)v64;
          goto LABEL_36;
        }
        result = swift_arrayInitWithTakeFrontToBack();
      }
      v21 = (char *)v64;
      a3 = v24;
LABEL_36:
      a1 += v14;
      if (a4 >= (unint64_t)v21 || a2 >= a3)
        goto LABEL_41;
    }
  }
  result = sub_23A4A7BCC(a2, v17 / v14, a4);
  v21 = (char *)(a4 + v20 * v14);
  if (v20 * v14 >= 1 && a1 < a2)
  {
    v63 = -v14;
    v64 = v8;
    v39 = *(void (**)(char *, unint64_t, uint64_t))(v68 + 16);
    v61 = a1;
    v62 = v39;
    v60 = a4;
    v40 = v66;
    v41 = v64;
    while (1)
    {
      v42 = a3;
      v44 = v62;
      v43 = v63;
      a3 += v63;
      v65 = &v21[v63];
      ((void (*)(char *))v62)(v40);
      v45 = a2 + v43;
      v46 = v67;
      v44(v67, v45, v41);
      sub_23A4AA168();
      v48 = v47;
      sub_23A4AA168();
      v50 = v49;
      v51 = *(void (**)(char *, uint64_t))(v68 + 8);
      v51(v46, v41);
      result = ((uint64_t (*)(char *, uint64_t))v51)(v40, v41);
      if (v50 >= v48)
      {
        if (v42 >= (unint64_t)v21 && a3 < (unint64_t)v21)
        {
          v54 = v61;
          if ((char *)v42 == v21)
          {
            v21 = v65;
          }
          else
          {
            v21 = v65;
            result = swift_arrayInitWithTakeBackToFront();
          }
LABEL_67:
          a4 = v60;
          goto LABEL_68;
        }
        v21 = v65;
        result = swift_arrayInitWithTakeFrontToBack();
      }
      else
      {
        if (v42 >= a2 && a3 < a2)
        {
          v54 = v61;
          if (v42 != a2)
            result = swift_arrayInitWithTakeBackToFront();
          a2 = v45;
          goto LABEL_67;
        }
        result = swift_arrayInitWithTakeFrontToBack();
        a2 = v45;
      }
      a4 = v60;
      v54 = v61;
LABEL_68:
      if ((unint64_t)v21 <= a4 || a2 <= v54)
      {
        v14 = v59;
        break;
      }
    }
  }
LABEL_73:
  v56 = &v21[-a4];
  if (v14 != -1 || v56 != (char *)0x8000000000000000)
  {
    sub_23A4A7BCC(a4, (uint64_t)v56 / v14, a2);
    return 1;
  }
LABEL_81:
  __break(1u);
  return result;
}

char *sub_23A49F13C(char *result, int64_t a2, char a3, char *a4)
{
  char v5;
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_2569817B0);
    v10 = (char *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    *((_QWORD *)v10 + 2) = v8;
    *((_QWORD *)v10 + 3) = 2 * ((uint64_t)(v11 - 32) / 16);
  }
  else
  {
    v10 = (char *)MEMORY[0x24BEE4AF8];
  }
  v12 = v10 + 32;
  v13 = a4 + 32;
  if ((v5 & 1) != 0)
  {
    if (v10 != a4 || &v13[16 * v8] <= v12)
      memmove(v12, v13, 16 * v8);
    *((_QWORD *)a4 + 2) = 0;
  }
  else
  {
    memcpy(v12, v13, 16 * v8);
  }
  swift_bridgeObjectRelease();
  return v10;
}

char *sub_23A49F230(uint64_t a1)
{
  return sub_23A49F13C(0, *(_QWORD *)(a1 + 16), 0, (char *)a1);
}

size_t sub_23A49F244(uint64_t a1)
{
  return sub_23A4A8AF8(0, *(_QWORD *)(a1 + 16), 0, a1);
}

uint64_t sub_23A49F258(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;
  uint64_t v6;
  BOOL v7;
  uint64_t v8;
  BOOL v9;

  if (!a2)
  {
    v7 = 0;
    a3 = 0;
    goto LABEL_14;
  }
  if (!a3)
  {
    v7 = 0;
LABEL_14:
    v8 = a4;
LABEL_15:
    *(_QWORD *)result = a4;
    *(_QWORD *)(result + 8) = a5;
    *(_QWORD *)(result + 16) = v8;
    *(_BYTE *)(result + 24) = v7;
    return a3;
  }
  if (a3 < 0)
    goto LABEL_17;
  v5 = 0;
  v6 = a4;
  while (1)
  {
    v7 = v6 == a5;
    if (v6 != a5)
      break;
    v8 = 0;
LABEL_8:
    *(_QWORD *)(a2 + 8 * v5) = v6;
    if (a3 - 1 == v5)
      goto LABEL_15;
    ++v5;
    v9 = v6 == a5;
    v6 = v8;
    if (v9)
    {
      v7 = 1;
      a3 = v5;
      goto LABEL_15;
    }
  }
  v8 = v6 + 1;
  if (!__OFADD__(v6, 1))
    goto LABEL_8;
  __break(1u);
LABEL_17:
  __break(1u);
  return result;
}

uint64_t sub_23A49F2E4(const void *a1, _QWORD *a2)
{
  uint64_t v4;
  char v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  os_log_type_t v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  _QWORD *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void (*v22)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v24;
  uint64_t v25;
  _QWORD v26[5];
  _QWORD v27[5];

  v27[3] = &type metadata for ContentViewedEvent;
  v27[4] = &off_250B5FE10;
  v4 = swift_allocObject();
  v27[0] = v4;
  memcpy((void *)(v4 + 16), a1, 0x58uLL);
  sub_23A49F6F0((uint64_t)a1);
  static DeviceExpertPreferences.shouldSendAnalytics.getter();
  if ((v5 & 1) != 0)
  {
    v6 = sub_23A49F758();
    if (qword_25697FF38 != -1)
      swift_once();
    v7 = sub_23A4AA6F0();
    __swift_project_value_buffer(v7, (uint64_t)qword_2569815A0);
    sub_23A49F7F4((uint64_t)v27, (uint64_t)v26);
    swift_bridgeObjectRetain_n();
    v8 = sub_23A4AA6D8();
    v9 = sub_23A4AA8DC();
    if (os_log_type_enabled(v8, v9))
    {
      v10 = swift_slowAlloc();
      v24 = swift_slowAlloc();
      v25 = v24;
      *(_DWORD *)v10 = 136315394;
      v11 = __swift_project_boxed_opaque_existential_1(v26, v26[3]);
      v12 = *v11;
      v13 = v11[1];
      swift_bridgeObjectRetain();
      sub_23A49D6D8(v12, v13, &v25);
      sub_23A4AA900();
      swift_bridgeObjectRelease();
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v26);
      *(_WORD *)(v10 + 12) = 2080;
      sub_23A48C69C();
      swift_bridgeObjectRetain();
      v14 = sub_23A4AA768();
      v16 = v15;
      swift_bridgeObjectRelease();
      sub_23A49D6D8(v14, v16, &v25);
      sub_23A4AA900();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_23A470000, v8, v9, "Sending analytics event \"%s\" with payload %s", (uint8_t *)v10, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x23B84E358](v24, -1, -1);
      MEMORY[0x23B84E358](v10, -1, -1);

    }
    else
    {
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v26);

      swift_bridgeObjectRelease_n();
    }
    v17 = a2 + 2;
    v19 = a2[5];
    v18 = a2[6];
    __swift_project_boxed_opaque_existential_1(v17, v19);
    v21 = *(_QWORD *)(v4 + 16);
    v20 = *(_QWORD *)(v4 + 24);
    v22 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v18 + 8);
    swift_bridgeObjectRetain();
    v22(v21, v20, v6, v19, v18);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)v27);
}

uint64_t sub_23A49F5E4(uint64_t a1)
{
  destroy for OutputHelper();
  return a1;
}

uint64_t method lookup function for DeviceExpertTellMeGeneratedFlow()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of DeviceExpertTellMeGeneratedFlow.__allocating_init(outputPublisher:assistantSupportClient:analyticsManager:biomeEventSender:siriKitEventSender:responseGenerator:deviceState:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 256))();
}

uint64_t dispatch thunk of DeviceExpertTellMeGeneratedFlow.execute(completion:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 264))();
}

uint64_t dispatch thunk of DeviceExpertTellMeGeneratedFlow.execute()(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  _QWORD *v4;
  uint64_t (*v6)(uint64_t);

  v6 = (uint64_t (*)(uint64_t))(**(int **)(*(_QWORD *)v1 + 272) + *(_QWORD *)(*(_QWORD *)v1 + 272));
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v4;
  *v4 = v2;
  v4[1] = sub_23A49F8B4;
  return v6(a1);
}

uint64_t dispatch thunk of DeviceExpertTellMeGeneratedFlow.on(input:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 280))();
}

uint64_t sub_23A49F6AC()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_23A49F6F0(uint64_t a1)
{
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t sub_23A49F758()
{
  uint64_t v0;
  uint64_t v1;

  v0 = sub_23A48C404();
  swift_bridgeObjectRetain();
  v1 = sub_23A4AA7BC();
  swift_bridgeObjectRelease();
  swift_isUniquelyReferenced_nonNull_native();
  sub_23A4923F4(v1, 0x5F6E6F6973736573, 0xEA00000000006469);
  swift_bridgeObjectRelease();
  return v0;
}

void sub_23A49F7F4(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v2;
  *(_QWORD *)(a2 + 32) = *(_QWORD *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v2 - 8))(a2, a1);
  OUTLINED_FUNCTION_60();
}

uint64_t sub_23A49F834(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  if (a2)
  {
    swift_bridgeObjectRetain();
    return swift_bridgeObjectRetain();
  }
  return result;
}

void sub_23A49F864(uint64_t a1, uint64_t (*a2)(_QWORD))
{
  uint64_t v2;

  v2 = a2(0);
  OUTLINED_FUNCTION_71_0(v2);
  OUTLINED_FUNCTION_60();
}

void sub_23A49F88C(uint64_t a1, uint64_t *a2)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(a2);
  OUTLINED_FUNCTION_71_0(v2);
  OUTLINED_FUNCTION_60();
}

uint64_t OUTLINED_FUNCTION_1_13(uint64_t a1, uint64_t (*a2)(void))
{
  return a2();
}

uint64_t OUTLINED_FUNCTION_4_10(uint64_t a1, uint64_t (*a2)(void))
{
  return a2();
}

uint64_t OUTLINED_FUNCTION_7_6(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(v1 + 32) = a1;
  return sub_23A4AA900();
}

void OUTLINED_FUNCTION_8_8(void *a1, uint64_t a2, uint64_t a3, const char *a4)
{
  NSObject *v4;
  uint8_t *v5;
  os_log_type_t v6;

  _os_log_impl(a1, v4, v6, a4, v5, 0xCu);
}

uint64_t OUTLINED_FUNCTION_10_8()
{
  return sub_23A4AA870();
}

uint64_t OUTLINED_FUNCTION_12_6()
{
  return swift_task_switch();
}

BOOL OUTLINED_FUNCTION_13_5(os_log_type_t a1)
{
  NSObject *v1;

  return os_log_type_enabled(v1, a1);
}

id OUTLINED_FUNCTION_14_8(float a1)
{
  void *v1;
  float *v2;

  *v2 = a1;
  return v1;
}

uint64_t OUTLINED_FUNCTION_15_2()
{
  uint64_t v0;
  _QWORD *v1;

  *v1 = v0;
  return swift_bridgeObjectRetain();
}

uint64_t OUTLINED_FUNCTION_16_7()
{
  return sub_23A4AA870();
}

id OUTLINED_FUNCTION_18_6()
{
  void *v0;

  return v0;
}

uint64_t OUTLINED_FUNCTION_20_4()
{
  return sub_23A4AA870();
}

uint64_t OUTLINED_FUNCTION_21_5()
{
  return sub_23A4AA894();
}

uint64_t OUTLINED_FUNCTION_25_2()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_36_2()
{
  return sub_23A4AA894();
}

BOOL OUTLINED_FUNCTION_37_2(os_log_type_t a1)
{
  NSObject *v1;

  return os_log_type_enabled(v1, a1);
}

uint64_t OUTLINED_FUNCTION_41_1()
{
  uint64_t v0;

  return v0;
}

uint64_t OUTLINED_FUNCTION_42_1()
{
  return swift_arrayDestroy();
}

void OUTLINED_FUNCTION_44_2()
{
  JUMPOUT(0x23B84DCA4);
}

uint64_t OUTLINED_FUNCTION_45_2()
{
  return swift_bridgeObjectRetain_n();
}

uint64_t OUTLINED_FUNCTION_47_0(uint64_t (*a1)(void))
{
  return a1();
}

void OUTLINED_FUNCTION_50_2(void *a1, uint64_t a2, uint64_t a3, const char *a4)
{
  os_log_type_t v4;
  NSObject *v5;
  uint8_t *v6;

  _os_log_impl(a1, v5, v4, a4, v6, 2u);
}

void OUTLINED_FUNCTION_52_1()
{
  JUMPOUT(0x23B84DCA4);
}

void OUTLINED_FUNCTION_55_0(void *a1, NSObject *a2, os_log_type_t a3, const char *a4, uint8_t *a5)
{
  _os_log_impl(a1, a2, a3, a4, a5, 2u);
}

uint64_t OUTLINED_FUNCTION_58_1(uint64_t a1)
{
  uint64_t v1;

  return __swift_storeEnumTagSinglePayload(a1, 0, 1, v1);
}

uint64_t OUTLINED_FUNCTION_59_1()
{
  return _swift_stdlib_bridgeErrorToNSError();
}

uint64_t OUTLINED_FUNCTION_60_1()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_61_1()
{
  return sub_23A4AA864();
}

void OUTLINED_FUNCTION_62_1(uint64_t a1)
{
  uint64_t *v1;

  sub_23A49F88C(a1, v1);
}

void OUTLINED_FUNCTION_64_0()
{
  _QWORD *v0;
  uint64_t v1;

  *(_QWORD *)(v1 - 8) = *v0;
}

uint64_t OUTLINED_FUNCTION_67_0()
{
  return swift_bridgeObjectRetain();
}

uint64_t OUTLINED_FUNCTION_69_0()
{
  return sub_23A4AA8C4();
}

uint64_t OUTLINED_FUNCTION_70_0()
{
  return sub_23A4AA864();
}

uint64_t OUTLINED_FUNCTION_71_0(uint64_t a1)
{
  uint64_t v1;

  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(a1 - 8) + 8))(v1, a1);
}

uint64_t OUTLINED_FUNCTION_72_0()
{
  uint64_t v0;
  uint64_t v1;

  return sub_23A47A8FC(v1, v0);
}

uint64_t OUTLINED_FUNCTION_73_0()
{
  return sub_23A4AA894();
}

uint64_t OUTLINED_FUNCTION_74_0@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v3;

  *a1 = v3;
  a1[1] = a2;
  return v2;
}

uint64_t OUTLINED_FUNCTION_75_0(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t OUTLINED_FUNCTION_76_0(uint64_t a1, uint64_t (*a2)(void))
{
  return a2();
}

void OUTLINED_FUNCTION_77_0()
{
  JUMPOUT(0x23B84DCA4);
}

uint64_t OUTLINED_FUNCTION_78_0()
{
  return sub_23A4AA570();
}

uint64_t OUTLINED_FUNCTION_79_0()
{
  return sub_23A4AA414();
}

uint64_t OUTLINED_FUNCTION_82_0()
{
  return sub_23A4AA6D8();
}

uint64_t OUTLINED_FUNCTION_83_0()
{
  return sub_23A4AA6D8();
}

void OUTLINED_FUNCTION_88_0()
{
  _QWORD *v0;
  uint64_t v1;

  *(_QWORD *)(v1 - 8) = *v0;
}

uint64_t OUTLINED_FUNCTION_89_0()
{
  return sub_23A4A7094();
}

uint64_t OUTLINED_FUNCTION_90_0()
{
  uint64_t v0;
  uint64_t v1;

  return __swift_getEnumTagSinglePayload(v1, 1, v0);
}

uint64_t OUTLINED_FUNCTION_91_0()
{
  return swift_release();
}

void OUTLINED_FUNCTION_92_0(uint64_t a1, uint64_t *a2)
{
  uint64_t v2;

  sub_23A49F88C(v2, a2);
}

void OUTLINED_FUNCTION_93_0(uint64_t a1, uint64_t a2, uint64_t (*a3)(_QWORD))
{
  uint64_t v3;

  sub_23A48F9FC(a1, v3, a3);
}

uint64_t OUTLINED_FUNCTION_94_0()
{
  return swift_release();
}

void OUTLINED_FUNCTION_95_0(uint64_t a1, uint64_t (*a2)(_QWORD))
{
  uint64_t v2;

  sub_23A49F864(v2, a2);
}

uint64_t OUTLINED_FUNCTION_96_0()
{
  return swift_bridgeObjectRetain();
}

uint64_t OUTLINED_FUNCTION_98_0()
{
  return swift_task_dealloc();
}

uint64_t OUTLINED_FUNCTION_103()
{
  uint64_t v0;

  return v0;
}

uint64_t OUTLINED_FUNCTION_104()
{
  return swift_release();
}

uint64_t OUTLINED_FUNCTION_112@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t (*a3)(uint64_t, uint64_t, uint64_t)@<X8>)
{
  uint64_t v3;

  return a3(a1, a2, v3);
}

uint64_t OUTLINED_FUNCTION_113()
{
  return swift_bridgeObjectRelease_n();
}

uint64_t OUTLINED_FUNCTION_114()
{
  return sub_23A4AA900();
}

uint64_t OUTLINED_FUNCTION_115@<X0>(uint64_t (*a1)(uint64_t, uint64_t)@<X8>)
{
  uint64_t v1;
  uint64_t v2;

  return a1(v2, v1);
}

uint64_t OUTLINED_FUNCTION_117()
{
  return swift_allocObject();
}

uint64_t OUTLINED_FUNCTION_118(uint64_t a1)
{
  uint64_t v1;

  return sub_23A47A8FC(a1, v1);
}

uint64_t OUTLINED_FUNCTION_119()
{
  return swift_task_dealloc();
}

uint64_t OUTLINED_FUNCTION_120@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t (*a3)(uint64_t, uint64_t, uint64_t)@<X8>)
{
  uint64_t v3;

  return a3(a1, a2, v3);
}

uint64_t OUTLINED_FUNCTION_121@<X0>(uint64_t (*a1)(uint64_t, uint64_t)@<X8>)
{
  uint64_t v1;
  uint64_t v2;

  return a1(v2, v1);
}

uint64_t OUTLINED_FUNCTION_122@<X0>(_QWORD *a1@<X8>)
{
  _QWORD *v1;

  *a1 = *v1;
  return swift_task_dealloc();
}

uint64_t OUTLINED_FUNCTION_123()
{
  uint64_t v0;

  return v0;
}

uint64_t OUTLINED_FUNCTION_125()
{
  uint64_t v0;

  return v0;
}

uint64_t OUTLINED_FUNCTION_126()
{
  return swift_task_dealloc();
}

uint64_t sub_23A49FD90(char a1)
{
  return *(_QWORD *)&aUnknown_0[8 * a1];
}

unint64_t sub_23A49FDB0(unint64_t result)
{
  if (result >= 6)
    return 6;
  return result;
}

uint64_t sub_23A49FDC0(uint64_t result)
{
  return result;
}

void sub_23A49FDC8()
{
  sub_23A47F874();
}

void sub_23A49FDD0()
{
  sub_23A47F89C();
}

void sub_23A49FDD8()
{
  sub_23A47F9E8();
}

unint64_t sub_23A49FDE0@<X0>(unint64_t *a1@<X0>, _BYTE *a2@<X8>)
{
  unint64_t result;

  result = sub_23A49FDB0(*a1);
  *a2 = result;
  return result;
}

uint64_t sub_23A49FE08@<X0>(uint64_t *a1@<X8>)
{
  unsigned __int8 *v1;
  uint64_t result;

  result = sub_23A49FDC0(*v1);
  *a1 = result;
  return result;
}

uint64_t storeEnumTagSinglePayload for SnippetResponseType(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_23A49FE7C + 4 * byte_23A4ADCC5[v4]))();
  *a1 = a2 + 5;
  return ((uint64_t (*)(void))((char *)sub_23A49FEB0 + 4 * byte_23A4ADCC0[v4]))();
}

uint64_t sub_23A49FEB0(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_23A49FEB8(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x23A49FEC0);
  return result;
}

uint64_t sub_23A49FECC(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x23A49FED4);
  *(_BYTE *)result = a2 + 5;
  return result;
}

uint64_t sub_23A49FED8(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23A49FEE0(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for SnippetResponseType()
{
  return &type metadata for SnippetResponseType;
}

unint64_t sub_23A49FF00()
{
  unint64_t result;

  result = qword_2569817B8;
  if (!qword_2569817B8)
  {
    result = MEMORY[0x23B84E2B0](&unk_23A4ADD7C, &type metadata for SnippetResponseType);
    atomic_store(result, (unint64_t *)&qword_2569817B8);
  }
  return result;
}

uint64_t dispatch thunk of AnalyticsEvent.name.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t dispatch thunk of AnalyticsEvent.sessionIdentifier.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

uint64_t dispatch thunk of AnalyticsEvent.dictionaryRepresentation.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 24))();
}

uint64_t sub_23A49FF54(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v2 + 16) = a1;
  *(_QWORD *)(v2 + 24) = v1;
  return swift_task_switch();
}

uint64_t sub_23A49FF6C()
{
  uint64_t v0;
  char v1;
  _QWORD *v2;

  sub_23A4AA15C();
  v1 = sub_23A4AA81C();
  swift_bridgeObjectRelease();
  if ((v1 & 1) == 0)
    return (*(uint64_t (**)(void))(v0 + 8))();
  v2 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 32) = v2;
  *v2 = v0;
  v2[1] = sub_23A4A000C;
  return sub_23A4A0080(*(_QWORD *)(v0 + 16));
}

uint64_t sub_23A4A000C()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

void sub_23A4A0054()
{
  strcpy((char *)&qword_2569817C0, "DeviceExpert");
  algn_2569817C8[5] = 0;
  *(_WORD *)&algn_2569817C8[6] = -5120;
}

uint64_t sub_23A4A0080(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;

  v1[25] = a1;
  v2 = sub_23A4AA27C();
  v1[26] = v2;
  v1[27] = *(_QWORD *)(v2 - 8);
  v1[28] = swift_task_alloc();
  v3 = sub_23A4AA63C();
  v1[29] = v3;
  v1[30] = *(_QWORD *)(v3 - 8);
  v1[31] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_23A4A0108()
{
  _QWORD *v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;

  v2 = v0[30];
  v1 = (_QWORD *)v0[31];
  v3 = v0[29];
  sub_23A4AA420();
  __swift_project_boxed_opaque_existential_1(v0 + 8, v0[11]);
  sub_23A4AA4A4();
  v0[32] = v4;
  __swift_destroy_boxed_opaque_existential_1((uint64_t)(v0 + 8));
  *v1 = 0xD000000000000010;
  v1[1] = 0x800000023A4AF680;
  (*(void (**)(_QWORD *, _QWORD, uint64_t))(v2 + 104))(v1, *MEMORY[0x24BEA6F20], v3);
  sub_23A4AA630();
  OUTLINED_FUNCTION_3_12();
  sub_23A4AA60C();
  v5 = MEMORY[0x24BEE0D00];
  v0[2] = 0xD000000000000010;
  v6 = MEMORY[0x24BEE0D38];
  v0[5] = v5;
  v0[6] = v6;
  v0[7] = MEMORY[0x24BEE0D08];
  v0[3] = 0x800000023A4AF680;
  v0[33] = sub_23A4AA624();
  swift_release();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)(v0 + 2));
  if (qword_25697FF50 != -1)
    swift_once();
  v7 = qword_2569817C0;
  v8 = *(_QWORD *)algn_2569817C8;
  v9 = sub_23A4AA648();
  OUTLINED_FUNCTION_3_12();
  swift_bridgeObjectRetain();
  v10 = MEMORY[0x23B84DAB8](v7, v8);
  v0[34] = v10;
  sub_23A4AA5F4();
  sub_23A4AA5E8();
  __swift_project_boxed_opaque_existential_1(v0 + 13, v0[16]);
  v0[35] = sub_23A4AA618();
  v0[21] = v9;
  v0[22] = sub_23A4A07E4();
  v0[18] = v10;
  swift_retain();
  v11 = (_QWORD *)swift_task_alloc();
  v0[36] = v11;
  *v11 = v0;
  v11[1] = sub_23A4A0360;
  return sub_23A4AA600();
}

uint64_t sub_23A4A0360()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;

  v2 = *v1;
  *(_QWORD *)(*v1 + 296) = v0;
  swift_task_dealloc();
  swift_release();
  swift_bridgeObjectRelease();
  if (!v0)
    __swift_destroy_boxed_opaque_existential_1(v2 + 144);
  return swift_task_switch();
}

uint64_t sub_23A4A03F8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  os_log_type_t v7;
  _BOOL4 v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint8_t *v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v16;
  uint64_t v17;

  __swift_destroy_boxed_opaque_existential_1(v0 + 104);
  if (qword_25697FF48 != -1)
    swift_once();
  v1 = *(_QWORD *)(v0 + 200);
  v3 = *(_QWORD *)(v0 + 216);
  v2 = *(_QWORD *)(v0 + 224);
  v4 = *(_QWORD *)(v0 + 208);
  v5 = sub_23A4AA6F0();
  __swift_project_value_buffer(v5, (uint64_t)qword_2569815D0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16))(v2, v1, v4);
  v6 = sub_23A4AA6D8();
  v7 = sub_23A4AA8C4();
  v8 = os_log_type_enabled(v6, v7);
  v10 = *(_QWORD *)(v0 + 216);
  v9 = *(_QWORD *)(v0 + 224);
  v11 = *(_QWORD *)(v0 + 208);
  if (v8)
  {
    v16 = *(_QWORD *)(v0 + 208);
    v12 = (uint8_t *)swift_slowAlloc();
    v17 = OUTLINED_FUNCTION_3_0();
    *(_DWORD *)v12 = 136315138;
    v13 = sub_23A4AA15C();
    *(_QWORD *)(v0 + 192) = sub_23A49D6D8(v13, v14, &v17);
    sub_23A4AA900();
    swift_bridgeObjectRelease();
    (*(void (**)(uint64_t, uint64_t))(v10 + 8))(v9, v16);
    _os_log_impl(&dword_23A470000, v6, v7, "DeviceExpertTellMeGeneratedFlow: Successfully donated WhatsNewWithSiri signal to SiriSuggestions for response ID: %s.", v12, 0xCu);
    swift_arrayDestroy();
    OUTLINED_FUNCTION_0_0();
  }
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v10 + 8))(v9, v11);
  swift_release();

  OUTLINED_FUNCTION_2_13();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_23A4A0600()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  id v3;
  id v4;
  NSObject *v5;
  os_log_type_t v6;
  _BOOL4 v7;
  void *v8;
  uint8_t *v9;
  _QWORD *v10;
  id v11;
  uint64_t v12;

  __swift_destroy_boxed_opaque_existential_1(v0 + 144);
  __swift_destroy_boxed_opaque_existential_1(v0 + 104);
  if (qword_25697FF48 != -1)
    swift_once();
  v1 = *(void **)(v0 + 296);
  v2 = sub_23A4AA6F0();
  __swift_project_value_buffer(v2, (uint64_t)qword_2569815D0);
  v3 = v1;
  v4 = v1;
  v5 = sub_23A4AA6D8();
  v6 = sub_23A4AA8D0();
  v7 = os_log_type_enabled(v5, v6);
  v8 = *(void **)(v0 + 296);
  if (v7)
  {
    v9 = (uint8_t *)OUTLINED_FUNCTION_3_0();
    v10 = (_QWORD *)OUTLINED_FUNCTION_3_0();
    *(_DWORD *)v9 = 138412290;
    v11 = v8;
    v12 = _swift_stdlib_bridgeErrorToNSError();
    *(_QWORD *)(v0 + 184) = v12;
    sub_23A4AA900();
    *v10 = v12;
    OUTLINED_FUNCTION_5_3();
    OUTLINED_FUNCTION_5_3();
    _os_log_impl(&dword_23A470000, v5, v6, "DeviceExpertTellMeGeneratedFlow: Error donating SiriSuggestions signal: %@", v9, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2569807A8);
    swift_arrayDestroy();
    OUTLINED_FUNCTION_0_0();
  }
  swift_release();
  swift_release();
  OUTLINED_FUNCTION_5_3();
  OUTLINED_FUNCTION_5_3();
  OUTLINED_FUNCTION_5_3();

  OUTLINED_FUNCTION_2_13();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

unint64_t sub_23A4A07E4()
{
  unint64_t result;
  uint64_t v1;

  result = qword_2569817E0;
  if (!qword_2569817E0)
  {
    v1 = sub_23A4AA648();
    result = MEMORY[0x23B84E2B0](MEMORY[0x24BEA6F70], v1);
    atomic_store(result, (unint64_t *)&qword_2569817E0);
  }
  return result;
}

uint64_t OUTLINED_FUNCTION_2_13()
{
  return swift_task_dealloc();
}

uint64_t OUTLINED_FUNCTION_3_12()
{
  return swift_allocObject();
}

uint64_t sub_23A4A083C(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

uint64_t sub_23A4A0844(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 24))();
}

uint64_t sub_23A4A084C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 32))();
}

uint64_t sub_23A4A0854(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return (*(uint64_t (**)(void))(a8 + 40))();
}

uint64_t sub_23A4A085C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  _QWORD *v7;
  uint64_t (*v9)(uint64_t, uint64_t, uint64_t);

  v9 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))(**(int **)(a3 + 48) + *(_QWORD *)(a3 + 48));
  v7 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v3 + 16) = v7;
  *v7 = v3;
  v7[1] = sub_23A4A08D4;
  return v9(a1, a2, a3);
}

uint64_t sub_23A4A08D4()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc();
  return OUTLINED_FUNCTION_2_10(*(uint64_t (**)(void))(v2 + 8));
}

id sub_23A4A0914()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  id v3;
  id v4;
  id v5;
  id v6;

  v2 = *(_QWORD *)(v0 + 24);
  v1 = *(_QWORD *)(v0 + 32);
  v3 = objc_allocWithZone(MEMORY[0x24BDC1540]);
  swift_bridgeObjectRetain();
  v4 = sub_23A4A17AC(v2, v1, 0);
  v5 = objc_msgSend(v4, sel_applicationState);
  v6 = objc_msgSend(v5, sel_isInstalled);

  return v6;
}

uint64_t sub_23A4A0BE8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v7 = sub_23A4A9D90();
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7);
  OUTLINED_FUNCTION_4();
  v11 = v10 - v9;
  sub_23A4A9D84();
  sub_23A4A9D54();
  swift_bridgeObjectRetain();
  sub_23A4A9D48();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2569819B0);
  sub_23A4A9D18();
  *(_OWORD *)(swift_allocObject() + 16) = xmmword_23A4AC930;
  sub_23A4A9D0C();
  sub_23A4A9D0C();
  sub_23A4A9D24();
  if (a6)
  {
    swift_bridgeObjectRetain();
    sub_23A4A9D78();
  }
  sub_23A4A9D30();
  return (*(uint64_t (**)(uint64_t, uint64_t))(v8 + 8))(v11, v7);
}

uint64_t sub_23A4A0D70()
{
  swift_bridgeObjectRelease();
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for HelpApp()
{
  return objc_opt_self();
}

uint64_t sub_23A4A0DB4()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(*(_QWORD *)v0 + 16);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_23A4A0DE4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return sub_23A4A0BE8(a1, a2, a3, a4, a5, a6);
}

uint64_t sub_23A4A0E04()
{
  id v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t result;

  v0 = objc_msgSend((id)objc_opt_self(), sel_deviceClass);
  sub_23A4AA7C8();

  v1 = sub_23A4AA7EC();
  v3 = v2;
  result = swift_bridgeObjectRelease();
  qword_256988540 = v1;
  *(_QWORD *)algn_256988548 = v3;
  return result;
}

uint64_t sub_23A4A0E80(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  *(_BYTE *)(v1 + 39) = -18;
  *(_QWORD *)(v1 + 16) = a1;
  strcpy((char *)(v1 + 24), "com.apple.tips");
  __swift_instantiateConcreteTypeFromMangledName(&qword_2569819B8);
  v2 = swift_allocObject();
  *(_OWORD *)(v2 + 16) = xmmword_23A4AB880;
  v3 = qword_25697FF58;
  swift_retain();
  if (v3 != -1)
    swift_once();
  v4 = *(_QWORD *)algn_256988548;
  *(_QWORD *)(v2 + 32) = qword_256988540;
  *(_QWORD *)(v2 + 40) = v4;
  swift_bridgeObjectRetain();
  swift_release();
  *(_QWORD *)(v1 + 40) = v2;
  return v1;
}

uint64_t sub_23A4A0F48(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  unsigned __int8 v5;

  swift_retain();
  v5 = sub_23A4A0914();
  swift_release();
  if ((v5 & 1) != 0)
    return sub_23A4A0FAC(a1, a2, *(_QWORD **)(v2 + 40));
  else
    return 0;
}

uint64_t sub_23A4A0FAC(uint64_t a1, uint64_t a2, _QWORD *a3)
{
  uint64_t v3;
  uint64_t result;
  _QWORD *v9;
  uint64_t i;
  uint64_t v11;
  BOOL v12;

  v3 = a3[2];
  if (!v3)
    return 0;
  if (a3[4] == a1 && a3[5] == a2)
    return 1;
  result = sub_23A4AAAB0();
  if ((result & 1) != 0)
    return 1;
  if (v3 == 1)
    return 0;
  v9 = a3 + 7;
  for (i = 1; ; ++i)
  {
    v11 = i + 1;
    if (__OFADD__(i, 1))
      break;
    v12 = *(v9 - 1) == a1 && *v9 == a2;
    if (v12 || (sub_23A4AAAB0() & 1) != 0)
      return 1;
    result = 0;
    v9 += 2;
    if (v11 == v3)
      return result;
  }
  __break(1u);
  return result;
}

uint64_t sub_23A4A1070()
{
  sub_23A4AA750();
  sub_23A4AA7C8();
  sub_23A4AA744();
  return swift_bridgeObjectRelease();
}

uint64_t sub_23A4A1120(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v2 + 24) = a1;
  *(_QWORD *)(v2 + 32) = v1;
  return swift_task_switch();
}

uint64_t sub_23A4A1138()
{
  uint64_t v0;
  _QWORD *v1;

  if ((sub_23A4A1414() & 1) == 0)
    return (*(uint64_t (**)(void))(v0 + 8))();
  *(_QWORD *)(v0 + 40) = *(_QWORD *)(*(_QWORD *)(v0 + 32) + 16);
  swift_retain();
  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 48) = v1;
  *v1 = v0;
  v1[1] = sub_23A4A11B8;
  return sub_23A4AA738();
}

uint64_t sub_23A4A11B8(uint64_t a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v4;

  v4 = *v2;
  *(_QWORD *)(*v2 + 56) = v1;
  swift_task_dealloc();
  if (!v1)
  {
    swift_release();
    *(_QWORD *)(v4 + 64) = a1;
  }
  return swift_task_switch();
}

uint64_t sub_23A4A1234()
{
  uint64_t v0;

  *(_QWORD *)(*(_QWORD *)(v0 + 32) + 40) = *(_QWORD *)(v0 + 64);
  swift_bridgeObjectRelease();
  return OUTLINED_FUNCTION_2_10(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_23A4A1268()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  id v3;
  id v4;
  NSObject *v5;
  os_log_type_t v6;
  _BOOL4 v7;
  void *v8;
  uint8_t *v9;
  _QWORD *v10;
  id v11;
  uint64_t v12;

  swift_release();
  if (qword_25697FF48 != -1)
    swift_once();
  v1 = *(void **)(v0 + 56);
  v2 = sub_23A4AA6F0();
  __swift_project_value_buffer(v2, (uint64_t)qword_2569815D0);
  v3 = v1;
  v4 = v1;
  v5 = sub_23A4AA6D8();
  v6 = sub_23A4AA8D0();
  v7 = os_log_type_enabled(v5, v6);
  v8 = *(void **)(v0 + 56);
  if (v7)
  {
    v9 = (uint8_t *)swift_slowAlloc();
    v10 = (_QWORD *)swift_slowAlloc();
    *(_DWORD *)v9 = 138412290;
    v11 = v8;
    v12 = _swift_stdlib_bridgeErrorToNSError();
    *(_QWORD *)(v0 + 16) = v12;
    sub_23A4AA900();
    *v10 = v12;
    OUTLINED_FUNCTION_5_3();
    OUTLINED_FUNCTION_5_3();
    _os_log_impl(&dword_23A470000, v5, v6, "Error fetching user guide identifiers: %@", v9, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2569807A8);
    swift_arrayDestroy();
    OUTLINED_FUNCTION_0_0();
  }
  OUTLINED_FUNCTION_5_3();
  OUTLINED_FUNCTION_5_3();
  OUTLINED_FUNCTION_5_3();

  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_23A4A1414()
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
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  void (*v16)(uint64_t, unint64_t, uint64_t);
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char v23;
  int v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;

  v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_256981308);
  MEMORY[0x24BDAC7A8](v0);
  OUTLINED_FUNCTION_4();
  v3 = v2 - v1;
  v4 = sub_23A4AA0F0();
  v27 = *(_QWORD *)(v4 - 8);
  v28 = v4;
  MEMORY[0x24BDAC7A8](v4);
  OUTLINED_FUNCTION_4();
  v26 = v6 - v5;
  v7 = sub_23A4AA024();
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7);
  OUTLINED_FUNCTION_4();
  v11 = v10 - v9;
  v12 = sub_23A4AA078();
  v13 = *(_QWORD *)(v12 + 16);
  if (!v13)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  v14 = v12 + ((*(unsigned __int8 *)(v8 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80));
  v25 = *MEMORY[0x24BE6FD08];
  v15 = *(_QWORD *)(v8 + 72);
  v16 = *(void (**)(uint64_t, unint64_t, uint64_t))(v8 + 16);
  swift_bridgeObjectRetain();
  do
  {
    v16(v11, v14, v7);
    sub_23A4AA018();
    v17 = sub_23A4AA00C();
    if (__swift_getEnumTagSinglePayload(v3, 1, v17) == 1)
    {
      sub_23A4A176C(v3);
LABEL_16:
      OUTLINED_FUNCTION_3_13();
      goto LABEL_17;
    }
    v18 = *(_QWORD *)(v17 - 8);
    if ((*(unsigned int (**)(uint64_t, uint64_t))(v18 + 88))(v3, v17) != v25)
    {
      (*(void (**)(uint64_t, uint64_t))(v18 + 8))(v3, v17);
      goto LABEL_16;
    }
    (*(void (**)(uint64_t, uint64_t))(v18 + 96))(v3, v17);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v27 + 32))(v26, v3, v28);
    v19 = _s19DeviceExpertIntents6ActionV22AppIntentConfigurationV8bundleIDSSvg_0();
    v21 = v20;
    if (qword_25697FF58 != -1)
      swift_once();
    if (v19 == qword_256988540 && v21 == *(_QWORD *)algn_256988548)
    {
      swift_bridgeObjectRelease();
      (*(void (**)(uint64_t, uint64_t))(v27 + 8))(v26, v28);
      goto LABEL_16;
    }
    v23 = sub_23A4AAAB0();
    swift_bridgeObjectRelease();
    (*(void (**)(uint64_t, uint64_t))(v27 + 8))(v26, v28);
    OUTLINED_FUNCTION_3_13();
    if ((v23 & 1) == 0)
    {
      OUTLINED_FUNCTION_5_10();
      return 1;
    }
LABEL_17:
    v14 += v15;
    --v13;
  }
  while (v13);
  OUTLINED_FUNCTION_5_10();
  return 0;
}

uint64_t sub_23A4A1698()
{
  uint64_t v0;

  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t sub_23A4A16C4()
{
  sub_23A4A1698();
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for TipsApp()
{
  return objc_opt_self();
}

uint64_t sub_23A4A1704()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(*(_QWORD *)v0 + 24);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_23A4A1734(uint64_t a1, uint64_t a2)
{
  return sub_23A4A0F48(a1, a2) & 1;
}

uint64_t sub_23A4A1758()
{
  return sub_23A4A1070();
}

uint64_t sub_23A4A176C(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_256981308);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

id sub_23A4A17AC(uint64_t a1, uint64_t a2, char a3)
{
  void *v3;
  void *v5;
  id v6;
  id v7;
  id v8;
  id v10[2];

  v10[1] = *(id *)MEMORY[0x24BDAC8D0];
  v5 = (void *)sub_23A4AA7BC();
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
    sub_23A4A9E98();

    swift_willThrow();
  }
  return v6;
}

uint64_t sub_23A4A1884(void (*a1)(void))
{
  a1();
  return _swift_stdlib_bridgeErrorToNSError();
}

void sub_23A4A18A4(uint64_t *a1, _QWORD **a2, uint64_t a3, uint64_t (*a4)(void))
{
  void *v6;
  uint64_t v7;
  _QWORD *v8;

  v6 = (void *)a4();
  v7 = *a1 + 8;
  sub_23A4AA900();
  *a1 = v7;
  v8 = *a2;
  if (*a2)
  {
    *v8 = v6;
    *a2 = v8 + 1;
  }
  else
  {

  }
}

uint64_t OUTLINED_FUNCTION_3_13()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(v1 + 8))(v2, v0);
}

uint64_t OUTLINED_FUNCTION_5_10()
{
  return swift_bridgeObjectRelease_n();
}

uint64_t TPSTip.bodyContentOrText.getter()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  id v4;
  uint64_t v5;

  v1 = (uint64_t)v0;
  v2 = sub_23A4A20FC(v0);
  if (v2)
  {
    sub_23A4A1E5C(v2);
    OUTLINED_FUNCTION_1_14();
    if (!v0)
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_256980470);
      v1 = swift_allocObject();
      *(_OWORD *)(v1 + 16) = xmmword_23A4AB880;
      *(_QWORD *)(v1 + 32) = sub_23A4AA774();
    }
  }
  else
  {
    sub_23A4A215C(v0);
    if (v3)
    {
      sub_23A4AA7BC();
      OUTLINED_FUNCTION_1_14();
    }
    else
    {
      v1 = 0;
    }
    v4 = objc_msgSend((id)objc_opt_self(), sel_textContentWithText_, v1);

    __swift_instantiateConcreteTypeFromMangledName(&qword_2569819C0);
    v5 = sub_23A4AA858();

    v1 = sub_23A4A1D18(v5, (void (*)(BOOL, uint64_t, uint64_t))sub_23A4A7F5C, &qword_2569819C0, &qword_256980278);
    swift_bridgeObjectRelease();
  }
  return v1;
}

uint64_t sub_23A4A1AA4@<X0>(uint64_t a1@<X8>)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  char *v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  double v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t result;
  uint64_t v32;
  uint64_t v33;

  v33 = a1;
  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_256980430);
  v3 = MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v32 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v3);
  v7 = (char *)&v32 - v6;
  v8 = objc_msgSend(v1, sel_fullContentAssets);
  v9 = OUTLINED_FUNCTION_0_18((uint64_t)v8, sel_language);
  v10 = sub_23A4AA7C8();
  v12 = v11;

  v14 = OUTLINED_FUNCTION_0_18(v13, sel_assetFileInfoManager);
  v15 = objc_allocWithZone(MEMORY[0x24BEB7D08]);
  v16 = sub_23A4A2078(v8, v10, v12, 0, v14);
  v17 = OUTLINED_FUNCTION_0_18((uint64_t)v16, sel_fullContentAssets);
  v18 = OUTLINED_FUNCTION_0_18((uint64_t)v17, sel_language);
  v19 = sub_23A4AA7C8();
  v21 = v20;

  v23 = OUTLINED_FUNCTION_0_18(v22, sel_assetFileInfoManager);
  v24 = objc_allocWithZone(MEMORY[0x24BEB7D08]);
  v25 = sub_23A4A2078(v17, v19, v21, 1, v23);
  v26 = v16;
  sub_23A4A1FA8(v16, 2, (uint64_t)v7);

  v27 = v25;
  sub_23A4A1FA8(v25, 2, (uint64_t)v5);

  LODWORD(v17) = objc_msgSend((id)objc_opt_self(), sel_isPhoneUI);
  if ((_DWORD)v17)
    v28 = 1.28033473;
  else
    v28 = 0.842975207;
  v29 = v33;
  sub_23A4A21BC((uint64_t)v7, v33);
  v30 = type metadata accessor for TipSnippetModel.AssetConfiguration(0);
  result = sub_23A4A21BC((uint64_t)v5, v29 + *(int *)(v30 + 20));
  *(double *)(v29 + *(int *)(v30 + 24)) = v28;
  return result;
}

uint64_t sub_23A4A1CFC(uint64_t a1)
{
  return sub_23A4A1D18(a1, (void (*)(BOOL, uint64_t, uint64_t))sub_23A4A88E4, &qword_256980278, &qword_256980640);
}

uint64_t sub_23A4A1D18(uint64_t a1, void (*a2)(BOOL, uint64_t, uint64_t), uint64_t *a3, uint64_t *a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  uint64_t v14;
  uint64_t v15;

  v4 = *(_QWORD *)(a1 + 16);
  v5 = MEMORY[0x24BEE4AF8];
  if (v4)
  {
    v15 = MEMORY[0x24BEE4AF8];
    a2(0, v4, 0);
    v10 = a1 + 32;
    v5 = v15;
    do
    {
      swift_bridgeObjectRetain_n();
      __swift_instantiateConcreteTypeFromMangledName(a3);
      __swift_instantiateConcreteTypeFromMangledName(a4);
      swift_dynamicCast();
      swift_bridgeObjectRelease();
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        a2(0, *(_QWORD *)(v5 + 16) + 1, 1);
        v5 = v15;
      }
      v12 = *(_QWORD *)(v5 + 16);
      v11 = *(_QWORD *)(v5 + 24);
      if (v12 >= v11 >> 1)
      {
        a2(v11 > 1, v12 + 1, 1);
        v5 = v15;
      }
      *(_QWORD *)(v5 + 16) = v12 + 1;
      *(_QWORD *)(v5 + 8 * v12 + 32) = v14;
      v10 += 8;
      --v4;
    }
    while (v4);
  }
  return v5;
}

uint64_t sub_23A4A1E5C(uint64_t a1)
{
  int64_t v2;
  uint64_t v3;
  uint64_t i;
  unint64_t v5;
  unint64_t v6;
  uint64_t v8;
  uint64_t v9;

  v2 = *(_QWORD *)(a1 + 16);
  v9 = MEMORY[0x24BEE4AF8];
  sub_23A4A7F5C(0, v2, 0);
  v3 = v9;
  if (v2)
  {
    for (i = a1 + 32; ; i += 8)
    {
      swift_bridgeObjectRetain();
      __swift_instantiateConcreteTypeFromMangledName(&qword_256980640);
      __swift_instantiateConcreteTypeFromMangledName(&qword_256980278);
      if (!swift_dynamicCast())
        break;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_23A4A7F5C(0, *(_QWORD *)(v3 + 16) + 1, 1);
        v3 = v9;
      }
      v6 = *(_QWORD *)(v3 + 16);
      v5 = *(_QWORD *)(v3 + 24);
      if (v6 >= v5 >> 1)
      {
        sub_23A4A7F5C((char *)(v5 > 1), v6 + 1, 1);
        v3 = v9;
      }
      *(_QWORD *)(v3 + 16) = v6 + 1;
      *(_QWORD *)(v3 + 8 * v6 + 32) = v8;
      if (!--v2)
        return v3;
    }
    swift_release();
    swift_bridgeObjectRelease();
    return 0;
  }
  return v3;
}

uint64_t sub_23A4A1FA8@<X0>(void *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  void *v6;
  id v7;
  id v8;
  void *v9;
  uint64_t v11;

  if (a1)
  {
    v6 = (void *)objc_opt_self();
    v7 = a1;
    v8 = objc_msgSend(v6, sel_assetPathFromAssetConfiguration_type_, v7, a2);
    if (v8)
    {
      v9 = v8;
      sub_23A4AA7C8();

      sub_23A4A9F34();
      return swift_bridgeObjectRelease();
    }

  }
  v11 = sub_23A4A9F40();
  return __swift_storeEnumTagSinglePayload(a3, 1, 1, v11);
}

id sub_23A4A2078(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  void *v5;
  void *v9;
  id v10;

  v9 = (void *)sub_23A4AA7BC();
  swift_bridgeObjectRelease();
  v10 = objc_msgSend(v5, sel_initWithAssets_language_userInterfaceStyle_assetFileInfoManager_, a1, v9, a4, a5);

  return v10;
}

uint64_t sub_23A4A20FC(void *a1)
{
  id v1;
  void *v2;
  uint64_t v3;

  v1 = objc_msgSend(a1, sel_bodyContent);
  if (!v1)
    return 0;
  v2 = v1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256980640);
  v3 = sub_23A4AA858();

  return v3;
}

uint64_t sub_23A4A215C(void *a1)
{
  id v1;
  void *v2;
  uint64_t v3;

  v1 = objc_msgSend(a1, sel_bodyText);
  if (!v1)
    return 0;
  v2 = v1;
  v3 = sub_23A4AA7C8();

  return v3;
}

uint64_t sub_23A4A21BC(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_256980430);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

id OUTLINED_FUNCTION_0_18(uint64_t a1, const char *a2)
{
  void *v2;

  return objc_msgSend(v2, a2);
}

uint64_t OUTLINED_FUNCTION_1_14()
{
  return swift_bridgeObjectRelease();
}

uint64_t dispatch thunk of AnalyticsLogging.sendEvent(_:payload:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return (*(uint64_t (**)(void))(a5 + 8))();
}

uint64_t sub_23A4A2220(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

void sub_23A4A222C(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v4;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  __int128 v16;
  __int128 v18;
  uint64_t v19;
  uint64_t v20;

  __swift_instantiateConcreteTypeFromMangledName(&qword_256980078);
  OUTLINED_FUNCTION_0_1();
  MEMORY[0x24BDAC7A8](v8);
  OUTLINED_FUNCTION_22_3();
  v9 = sub_23A4AA210();
  MEMORY[0x24BDAC7A8](v9);
  OUTLINED_FUNCTION_21_3();
  v16 = *(_OWORD *)a3;
  v10 = *(_QWORD *)(a3 + 16);
  v11 = *(_QWORD *)(a3 + 24);
  OUTLINED_FUNCTION_28_4();
  sub_23A4A9FAC();
  OUTLINED_FUNCTION_26_5();
  v12 = Array<A>.asTextRuns()();
  OUTLINED_FUNCTION_52();
  OUTLINED_FUNCTION_28_4();
  sub_23A4AA1F8();
  OUTLINED_FUNCTION_26_5();
  v13 = Array<A>.asTextRuns()();
  OUTLINED_FUNCTION_52();
  sub_23A4A9FC4();
  v14 = Array<A>.asTextRuns()();
  OUTLINED_FUNCTION_52();
  sub_23A48A488(a2, v4);
  v18 = v16;
  v19 = v10;
  v20 = v11;
  SummarizedAnswerSnippetModel.init(title:body:disclaimer:attributionModel:context:)(v12, v13, v14, v4, &v18, a4);
  sub_23A48A4D0(a2);
  v15 = sub_23A4AA27C();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v15 - 8) + 8))(a1, v15);
  OUTLINED_FUNCTION_14_4();
}

void SummarizedAnswerSnippetModel.body.getter()
{
  OUTLINED_FUNCTION_0_19();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2569800B0);
  OUTLINED_FUNCTION_14_7();
  OUTLINED_FUNCTION_21_1();
}

uint64_t type metadata accessor for SummarizedAnswerSnippetModel()
{
  uint64_t result;

  result = qword_256981A38;
  if (!qword_256981A38)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t SummarizedAnswerSnippetModel.title.getter()
{
  uint64_t v1;

  __swift_instantiateConcreteTypeFromMangledName(&qword_2569800B0);
  OUTLINED_FUNCTION_14_7();
  return v1;
}

uint64_t sub_23A4A2414()
{
  swift_bridgeObjectRetain();
  return SummarizedAnswerSnippetModel.title.setter();
}

uint64_t SummarizedAnswerSnippetModel.title.setter()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_2569800B0);
  return OUTLINED_FUNCTION_16_6();
}

void SummarizedAnswerSnippetModel.title.modify()
{
  _QWORD *v0;
  _QWORD *v1;

  v1 = OUTLINED_FUNCTION_6_2();
  *v0 = v1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2569800B0);
  v1[4] = OUTLINED_FUNCTION_7_2();
  OUTLINED_FUNCTION_5();
}

void sub_23A4A24A8()
{
  swift_bridgeObjectRetain();
  SummarizedAnswerSnippetModel.body.setter();
}

void SummarizedAnswerSnippetModel.body.setter()
{
  OUTLINED_FUNCTION_0_19();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2569800B0);
  OUTLINED_FUNCTION_16_6();
  OUTLINED_FUNCTION_21_1();
}

void SummarizedAnswerSnippetModel.body.modify()
{
  _QWORD *v0;
  _QWORD *v1;

  v1 = OUTLINED_FUNCTION_6_2();
  *v0 = v1;
  OUTLINED_FUNCTION_0_19();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2569800B0);
  v1[4] = OUTLINED_FUNCTION_7_2();
  OUTLINED_FUNCTION_5();
}

void SummarizedAnswerSnippetModel.disclaimer.getter()
{
  OUTLINED_FUNCTION_0_19();
  OUTLINED_FUNCTION_37_3();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2569800B0);
  OUTLINED_FUNCTION_14_7();
  OUTLINED_FUNCTION_21_1();
}

void sub_23A4A2588()
{
  swift_bridgeObjectRetain();
  SummarizedAnswerSnippetModel.disclaimer.setter();
}

void SummarizedAnswerSnippetModel.disclaimer.setter()
{
  OUTLINED_FUNCTION_0_19();
  OUTLINED_FUNCTION_37_3();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2569800B0);
  OUTLINED_FUNCTION_16_6();
  OUTLINED_FUNCTION_21_1();
}

void SummarizedAnswerSnippetModel.disclaimer.modify()
{
  _QWORD *v0;
  _QWORD *v1;

  v1 = OUTLINED_FUNCTION_6_2();
  *v0 = v1;
  OUTLINED_FUNCTION_0_19();
  OUTLINED_FUNCTION_37_3();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2569800B0);
  v1[4] = OUTLINED_FUNCTION_7_2();
  OUTLINED_FUNCTION_5();
}

void SummarizedAnswerSnippetModel.attributionModel.getter()
{
  OUTLINED_FUNCTION_0_19();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2569800C0);
  sub_23A4AA36C();
  OUTLINED_FUNCTION_60();
}

uint64_t sub_23A4A2664(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v6;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_256980078);
  MEMORY[0x24BDAC7A8](v2);
  v4 = (char *)&v6 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23A48A488(a1, (uint64_t)v4);
  return SummarizedAnswerSnippetModel.attributionModel.setter((uint64_t)v4);
}

uint64_t SummarizedAnswerSnippetModel.attributionModel.setter(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;

  __swift_instantiateConcreteTypeFromMangledName(&qword_256980078);
  OUTLINED_FUNCTION_0_1();
  MEMORY[0x24BDAC7A8](v2);
  sub_23A48A488(a1, (uint64_t)&v5 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0));
  OUTLINED_FUNCTION_0_19();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2569800C0);
  sub_23A4AA378();
  return sub_23A48A4D0(a1);
}

void SummarizedAnswerSnippetModel.attributionModel.modify()
{
  _QWORD *v0;
  _QWORD *v1;

  v1 = OUTLINED_FUNCTION_6_2();
  *v0 = v1;
  OUTLINED_FUNCTION_0_19();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2569800C0);
  v1[4] = OUTLINED_FUNCTION_7_2();
  OUTLINED_FUNCTION_5();
}

void SummarizedAnswerSnippetModel.context.getter()
{
  OUTLINED_FUNCTION_0_19();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2569800A8);
  sub_23A4AA36C();
  OUTLINED_FUNCTION_60();
}

double sub_23A4A27F0@<D0>(uint64_t a1@<X8>)
{
  double result;
  __int128 v3;
  uint64_t v4;
  uint64_t v5;

  SummarizedAnswerSnippetModel.context.getter();
  result = *(double *)&v3;
  *(_OWORD *)a1 = v3;
  *(_QWORD *)(a1 + 16) = v4;
  *(_QWORD *)(a1 + 24) = v5;
  return result;
}

uint64_t sub_23A4A2830()
{
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return SummarizedAnswerSnippetModel.context.setter();
}

uint64_t SummarizedAnswerSnippetModel.context.setter()
{
  OUTLINED_FUNCTION_0_19();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2569800A8);
  return sub_23A4AA378();
}

void SummarizedAnswerSnippetModel.context.modify()
{
  _QWORD *v0;
  _QWORD *v1;

  v1 = OUTLINED_FUNCTION_6_2();
  *v0 = v1;
  OUTLINED_FUNCTION_0_19();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2569800A8);
  v1[4] = OUTLINED_FUNCTION_7_2();
  OUTLINED_FUNCTION_5();
}

void SummarizedAnswerSnippetModel.init(title:body:disclaimer:attributionModel:context:)(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, __int128 *a5@<X4>, uint64_t a6@<X8>)
{
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
  __int128 v22;
  __int128 v23;
  uint64_t v24;
  uint64_t v25;

  __swift_instantiateConcreteTypeFromMangledName(&qword_256980078);
  OUTLINED_FUNCTION_0_1();
  MEMORY[0x24BDAC7A8](v12);
  OUTLINED_FUNCTION_1_1();
  MEMORY[0x24BDAC7A8](v13);
  v15 = (char *)&v20 - v14;
  v22 = *a5;
  v16 = *((_QWORD *)a5 + 2);
  v20 = *((_QWORD *)a5 + 3);
  v21 = v16;
  v17 = a6 + *(int *)(OUTLINED_FUNCTION_0_19() + 28);
  v18 = type metadata accessor for AttributionModel();
  __swift_storeEnumTagSinglePayload((uint64_t)v15, 1, 1, v18);
  OUTLINED_FUNCTION_25_3();
  OUTLINED_FUNCTION_35_1();
  sub_23A48A4D0((uint64_t)v15);
  *(_QWORD *)&v23 = a1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256980090);
  OUTLINED_FUNCTION_38_1();
  *(_QWORD *)&v23 = a2;
  OUTLINED_FUNCTION_38_1();
  *(_QWORD *)&v23 = a3;
  OUTLINED_FUNCTION_38_1();
  sub_23A48A488(a4, (uint64_t)v15);
  v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569800C0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v19 - 8) + 8))(v17, v19);
  OUTLINED_FUNCTION_25_3();
  OUTLINED_FUNCTION_35_1();
  sub_23A48A4D0((uint64_t)v15);
  v23 = v22;
  v24 = v21;
  v25 = v20;
  sub_23A4AA354();
  sub_23A48A4D0(a4);
  OUTLINED_FUNCTION_14_4();
}

void SummarizedAnswerSnippetModel.hasTitle.getter()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_2569800B0);
  OUTLINED_FUNCTION_14_7();
  OUTLINED_FUNCTION_20_3();
  OUTLINED_FUNCTION_21_1();
}

void SummarizedAnswerSnippetModel.hasDisclaimer.getter()
{
  OUTLINED_FUNCTION_0_19();
  OUTLINED_FUNCTION_37_3();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2569800B0);
  OUTLINED_FUNCTION_14_7();
  OUTLINED_FUNCTION_20_3();
  OUTLINED_FUNCTION_21_1();
}

uint64_t sub_23A4A2B20()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  char v8;
  char v9;
  char v10;
  char v11;
  char v12;
  char v13;
  uint64_t v15;

  OUTLINED_FUNCTION_0_19();
  OUTLINED_FUNCTION_0_1();
  MEMORY[0x24BDAC7A8](v1);
  OUTLINED_FUNCTION_1_1();
  v4 = v2 - v3;
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)&v15 - v6;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2569800B0);
  sub_23A4AA36C();
  OUTLINED_FUNCTION_33_2();
  v9 = v8;
  OUTLINED_FUNCTION_52();
  sub_23A4A36B4(v0, (uint64_t)v7);
  if ((v9 & 1) != 0)
  {
    sub_23A4A36F8((uint64_t)v7);
    OUTLINED_FUNCTION_39_3();
  }
  else
  {
    OUTLINED_FUNCTION_34_2();
    OUTLINED_FUNCTION_33_2();
    v11 = v10;
    OUTLINED_FUNCTION_52();
    sub_23A4A36F8((uint64_t)v7);
    OUTLINED_FUNCTION_39_3();
    if ((v11 & 1) == 0)
    {
      OUTLINED_FUNCTION_34_2();
      sub_23A4A6C04();
      v12 = v13;
      swift_bridgeObjectRelease();
      goto LABEL_6;
    }
  }
  v12 = 1;
LABEL_6:
  sub_23A4A36F8(v4);
  return v12 & 1;
}

uint64_t sub_23A4A2C40(uint64_t a1, uint64_t a2)
{
  BOOL v3;
  BOOL v6;
  BOOL v7;
  char v9;

  v3 = a1 == 0x656C746974 && a2 == 0xE500000000000000;
  if (v3 || (sub_23A4AAAB0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else
  {
    v6 = a1 == 2036625250 && a2 == 0xE400000000000000;
    if (v6 || (sub_23A4AAAB0() & 1) != 0)
    {
      swift_bridgeObjectRelease();
      return 1;
    }
    else
    {
      v7 = a1 == 0x6D69616C63736964 && a2 == 0xEA00000000007265;
      if (v7 || (sub_23A4AAAB0() & 1) != 0)
      {
        swift_bridgeObjectRelease();
        return 2;
      }
      else if (a1 == 0xD000000000000010 && a2 == 0x800000023A4AEDC0 || (sub_23A4AAAB0() & 1) != 0)
      {
        swift_bridgeObjectRelease();
        return 3;
      }
      else if (a1 == 0x747865746E6F63 && a2 == 0xE700000000000000)
      {
        swift_bridgeObjectRelease();
        return 4;
      }
      else
      {
        v9 = sub_23A4AAAB0();
        swift_bridgeObjectRelease();
        if ((v9 & 1) != 0)
          return 4;
        else
          return 5;
      }
    }
  }
}

uint64_t sub_23A4A2E20()
{
  return 5;
}

uint64_t sub_23A4A2E28(unsigned __int8 a1)
{
  return ((uint64_t (*)(unint64_t, unint64_t))((char *)sub_23A4A2E60 + 4 * byte_23A4ADF70[a1]))(0xD000000000000010, 0x800000023A4AEDC0);
}

uint64_t sub_23A4A2E60()
{
  return 0x656C746974;
}

uint64_t sub_23A4A2E74()
{
  return 2036625250;
}

uint64_t sub_23A4A2E84()
{
  return 0x6D69616C63736964;
}

uint64_t sub_23A4A2EA0()
{
  return 0x747865746E6F63;
}

uint64_t sub_23A4A2EB8()
{
  unsigned __int8 *v0;

  return sub_23A4A2E28(*v0);
}

uint64_t sub_23A4A2EC0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_23A4A2C40(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_23A4A2EE4@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = sub_23A4A2E20();
  *a1 = result;
  return result;
}

uint64_t sub_23A4A2F08()
{
  sub_23A4A3144();
  return sub_23A4AAB04();
}

uint64_t sub_23A4A2F30()
{
  sub_23A4A3144();
  return sub_23A4AAB10();
}

void SummarizedAnswerSnippetModel.encode(to:)(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  char v8;
  char v9;
  char v10;
  char v11;
  char v12;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569819C8);
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v6 = (char *)&v7 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_23A4A3144();
  sub_23A4AAAF8();
  v12 = 0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2569800B0);
  sub_23A4977C8((uint64_t)&unk_256981420);
  OUTLINED_FUNCTION_3_11();
  if (!v1)
  {
    type metadata accessor for SummarizedAnswerSnippetModel();
    v11 = 1;
    OUTLINED_FUNCTION_3_11();
    v10 = 2;
    OUTLINED_FUNCTION_3_11();
    v9 = 3;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2569800C0);
    sub_23A48AF48((uint64_t)&unk_256980C98);
    OUTLINED_FUNCTION_9_2();
    v8 = 4;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2569800A8);
    sub_23A47DFC8((uint64_t)&unk_2569802E0);
    OUTLINED_FUNCTION_9_2();
  }
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  OUTLINED_FUNCTION_0();
}

unint64_t sub_23A4A3144()
{
  unint64_t result;

  result = qword_2569819D0;
  if (!qword_2569819D0)
  {
    result = MEMORY[0x23B84E2B0](&unk_23A4AE120, &type metadata for SummarizedAnswerSnippetModel.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2569819D0);
  }
  return result;
}

void SummarizedAnswerSnippetModel.init(from:)(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v3;
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
  char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  char *v28;
  uint64_t v29;
  char *v30;
  uint64_t v31;
  uint64_t v32;
  void (*v33)(uint64_t, uint64_t, uint64_t);
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
  _QWORD *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  char *v51;
  uint64_t v52;
  char *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  char v61;
  char v62;
  char v63;
  char v64;
  char v65;

  v46 = a2;
  v47 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569800A8);
  v45 = *(_QWORD *)(v47 - 8);
  MEMORY[0x24BDAC7A8](v47);
  OUTLINED_FUNCTION_8_2();
  v48 = v5;
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569800C0);
  v58 = *(_QWORD *)(v6 - 8);
  v59 = v6;
  MEMORY[0x24BDAC7A8](v6);
  OUTLINED_FUNCTION_8_2();
  v49 = v7;
  v54 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569800B0);
  v50 = *(_QWORD *)(v54 - 8);
  MEMORY[0x24BDAC7A8](v54);
  OUTLINED_FUNCTION_1_1();
  v52 = v8 - v9;
  v11 = MEMORY[0x24BDAC7A8](v10);
  v51 = (char *)&v41 - v12;
  MEMORY[0x24BDAC7A8](v11);
  v53 = (char *)&v41 - v13;
  v55 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569819D8);
  v14 = *(_QWORD *)(v55 - 8);
  MEMORY[0x24BDAC7A8](v55);
  OUTLINED_FUNCTION_22_3();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256980078);
  OUTLINED_FUNCTION_0_1();
  MEMORY[0x24BDAC7A8](v15);
  OUTLINED_FUNCTION_1_1();
  v18 = v16 - v17;
  MEMORY[0x24BDAC7A8](v19);
  v21 = (char *)&v41 - v20;
  v22 = type metadata accessor for SummarizedAnswerSnippetModel();
  OUTLINED_FUNCTION_0_1();
  MEMORY[0x24BDAC7A8](v23);
  OUTLINED_FUNCTION_21_3();
  v25 = v3 + *(int *)(v24 + 28);
  v26 = type metadata accessor for AttributionModel();
  __swift_storeEnumTagSinglePayload((uint64_t)v21, 1, 1, v26);
  sub_23A48A488((uint64_t)v21, v18);
  v57 = v25;
  sub_23A4AA354();
  sub_23A48A4D0((uint64_t)v21);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_23A4A3144();
  v56 = v2;
  v27 = v60;
  sub_23A4AAAEC();
  if (v27)
  {
    __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
    (*(void (**)(uint64_t, uint64_t))(v58 + 8))(v57, v59);
  }
  else
  {
    v28 = v51;
    v29 = v52;
    v60 = v14;
    v42 = v3;
    v43 = v22;
    v44 = a1;
    v65 = 0;
    sub_23A4977C8((uint64_t)&unk_256981470);
    v30 = v53;
    v31 = v54;
    OUTLINED_FUNCTION_19_4();
    v32 = v42;
    v53 = *(char **)(v50 + 32);
    ((void (*)(uint64_t, char *, uint64_t))v53)(v42, v30, v31);
    v64 = 1;
    OUTLINED_FUNCTION_36_3();
    OUTLINED_FUNCTION_19_4();
    v33 = (void (*)(uint64_t, uint64_t, uint64_t))v53;
    ((void (*)(uint64_t, char *, uint64_t))v53)(v32 + *(int *)(v43 + 20), v28, v31);
    v63 = 2;
    OUTLINED_FUNCTION_36_3();
    v51 = 0;
    OUTLINED_FUNCTION_19_4();
    v34 = v43;
    v33(v32 + *(int *)(v43 + 24), v29, v31);
    v62 = 3;
    sub_23A48AF48((uint64_t)&unk_256980CF8);
    v35 = v49;
    v36 = v59;
    OUTLINED_FUNCTION_19_4();
    v37 = v34;
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v58 + 40))(v57, v35, v36);
    v61 = 4;
    sub_23A47DFC8((uint64_t)&unk_256980308);
    v38 = v47;
    v39 = v48;
    OUTLINED_FUNCTION_19_4();
    OUTLINED_FUNCTION_24_4();
    v40 = v42;
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v45 + 32))(v42 + *(int *)(v37 + 32), v39, v38);
    sub_23A4A36B4(v40, v46);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v44);
    sub_23A4A36F8(v40);
  }
  OUTLINED_FUNCTION_0();
}

uint64_t sub_23A4A36B4(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for SummarizedAnswerSnippetModel();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_23A4A36F8(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata accessor for SummarizedAnswerSnippetModel();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_23A4A3734()
{
  return sub_23A47E0EC((uint64_t)&qword_256980F70);
}

unint64_t sub_23A4A3760()
{
  return sub_23A47E0EC((uint64_t)&unk_256980F00);
}

void sub_23A4A3790(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  SummarizedAnswerSnippetModel.init(from:)(a1, a2);
}

void sub_23A4A37A4(_QWORD *a1)
{
  SummarizedAnswerSnippetModel.encode(to:)(a1);
}

void sub_23A4A37B8(uint64_t *a1@<X8>)
{
  *a1 = SummarizedAnswerSnippetModel.title.getter();
  OUTLINED_FUNCTION_60();
}

void sub_23A4A37E0(_QWORD *a1@<X8>)
{
  uint64_t v2;

  SummarizedAnswerSnippetModel.body.getter();
  *a1 = v2;
  OUTLINED_FUNCTION_60();
}

void sub_23A4A3808(_QWORD *a1@<X8>)
{
  uint64_t v2;

  SummarizedAnswerSnippetModel.disclaimer.getter();
  *a1 = v2;
  OUTLINED_FUNCTION_60();
}

void sub_23A4A3830()
{
  SummarizedAnswerSnippetModel.attributionModel.getter();
  OUTLINED_FUNCTION_60();
}

uint64_t *initializeBufferWithCopyOfBuffer for SummarizedAnswerSnippetModel(uint64_t *a1, uint64_t *a2, int *a3)
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
    v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569800B0);
    v8 = *(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v7 - 8) + 16);
    v8(a1, a2, v7);
    v8((uint64_t *)((char *)a1 + a3[5]), (uint64_t *)((char *)a2 + a3[5]), v7);
    v8((uint64_t *)((char *)a1 + a3[6]), (uint64_t *)((char *)a2 + a3[6]), v7);
    v9 = a3[7];
    v10 = (char *)a1 + v9;
    v11 = (char *)a2 + v9;
    v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569800C0);
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v12 - 8) + 16))(v10, v11, v12);
    v13 = a3[8];
    v14 = (char *)a1 + v13;
    v15 = (char *)a2 + v13;
    v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569800A8);
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v16 - 8) + 16))(v14, v15, v16);
  }
  return a1;
}

uint64_t destroy for SummarizedAnswerSnippetModel(uint64_t a1, int *a2)
{
  uint64_t v4;
  void (*v5)(uint64_t, uint64_t);
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569800B0);
  v5 = *(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8);
  v5(a1, v4);
  v5(a1 + a2[5], v4);
  v5(a1 + a2[6], v4);
  v6 = a1 + a2[7];
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569800C0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 8))(v6, v7);
  v8 = a1 + a2[8];
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569800A8);
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 8))(v8, v9);
}

uint64_t initializeWithCopy for SummarizedAnswerSnippetModel(uint64_t a1, uint64_t a2, int *a3)
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

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569800B0);
  v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 16);
  v7(a1, a2, v6);
  v7(a1 + a3[5], a2 + a3[5], v6);
  v7(a1 + a3[6], a2 + a3[6], v6);
  v8 = a3[7];
  v9 = a1 + v8;
  v10 = a2 + v8;
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569800C0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 16))(v9, v10, v11);
  v12 = a3[8];
  v13 = a1 + v12;
  v14 = a2 + v12;
  v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569800A8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v15 - 8) + 16))(v13, v14, v15);
  return a1;
}

uint64_t assignWithCopy for SummarizedAnswerSnippetModel(uint64_t a1, uint64_t a2, int *a3)
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

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569800B0);
  v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 24);
  v7(a1, a2, v6);
  v7(a1 + a3[5], a2 + a3[5], v6);
  v7(a1 + a3[6], a2 + a3[6], v6);
  v8 = a3[7];
  v9 = a1 + v8;
  v10 = a2 + v8;
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569800C0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 24))(v9, v10, v11);
  v12 = a3[8];
  v13 = a1 + v12;
  v14 = a2 + v12;
  v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569800A8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v15 - 8) + 24))(v13, v14, v15);
  return a1;
}

uint64_t initializeWithTake for SummarizedAnswerSnippetModel(uint64_t a1, uint64_t a2, int *a3)
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

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569800B0);
  v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 32);
  v7(a1, a2, v6);
  v7(a1 + a3[5], a2 + a3[5], v6);
  v7(a1 + a3[6], a2 + a3[6], v6);
  v8 = a3[7];
  v9 = a1 + v8;
  v10 = a2 + v8;
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569800C0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 32))(v9, v10, v11);
  v12 = a3[8];
  v13 = a1 + v12;
  v14 = a2 + v12;
  v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569800A8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v15 - 8) + 32))(v13, v14, v15);
  return a1;
}

uint64_t assignWithTake for SummarizedAnswerSnippetModel(uint64_t a1, uint64_t a2, int *a3)
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

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569800B0);
  v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 40);
  v7(a1, a2, v6);
  v7(a1 + a3[5], a2 + a3[5], v6);
  v7(a1 + a3[6], a2 + a3[6], v6);
  v8 = a3[7];
  v9 = a1 + v8;
  v10 = a2 + v8;
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569800C0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 40))(v9, v10, v11);
  v12 = a3[8];
  v13 = a1 + v12;
  v14 = a2 + v12;
  v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569800A8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v15 - 8) + 40))(v13, v14, v15);
  return a1;
}

uint64_t getEnumTagSinglePayload for SummarizedAnswerSnippetModel()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_23A4A3DD0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569800B0);
  if (*(_DWORD *)(*(_QWORD *)(v6 - 8) + 84) == (_DWORD)a2)
  {
    v7 = v6;
    v8 = a1;
  }
  else
  {
    v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569800C0);
    if (*(_DWORD *)(*(_QWORD *)(v9 - 8) + 84) == (_DWORD)a2)
    {
      v7 = v9;
      v10 = *(int *)(a3 + 28);
    }
    else
    {
      v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569800A8);
      v10 = *(int *)(a3 + 32);
    }
    v8 = a1 + v10;
  }
  return __swift_getEnumTagSinglePayload(v8, a2, v7);
}

uint64_t storeEnumTagSinglePayload for SummarizedAnswerSnippetModel()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_23A4A3E74(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569800B0);
  if (*(_DWORD *)(*(_QWORD *)(v8 - 8) + 84) == a3)
  {
    v9 = v8;
    v10 = a1;
  }
  else
  {
    v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569800C0);
    if (*(_DWORD *)(*(_QWORD *)(v11 - 8) + 84) == a3)
    {
      v9 = v11;
      v12 = *(int *)(a4 + 28);
    }
    else
    {
      v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569800A8);
      v12 = *(int *)(a4 + 32);
    }
    v10 = a1 + v12;
  }
  return __swift_storeEnumTagSinglePayload(v10, a2, a2, v9);
}

void sub_23A4A3F14()
{
  unint64_t v0;
  unint64_t v1;
  unint64_t v2;

  sub_23A48BFC4(319, (unint64_t *)&qword_2569814F8, &qword_256980090);
  if (v0 <= 0x3F)
  {
    sub_23A48BFC4(319, &qword_256980D88, &qword_256980078);
    if (v1 <= 0x3F)
    {
      sub_23A47E684();
      if (v2 <= 0x3F)
        swift_initStructMetadata();
    }
  }
}

uint64_t getEnumTagSinglePayload for SummarizedAnswerSnippetModel.CodingKeys(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  int v5;
  unsigned int v6;
  BOOL v7;

  if (!a2)
  {
    v5 = -1;
    return (v5 + 1);
  }
  if (a2 >= 0xFC)
  {
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
      if (!v4)
        goto LABEL_17;
    }
    else if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
    }
    else
    {
      v4 = a1[1];
      if (!a1[1])
        goto LABEL_17;
    }
    v5 = (*a1 | (v4 << 8)) - 5;
    return (v5 + 1);
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 5;
  v5 = v6 - 5;
  if (!v7)
    v5 = -1;
  return (v5 + 1);
}

uint64_t storeEnumTagSinglePayload for SummarizedAnswerSnippetModel.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_23A4A40AC + 4 * byte_23A4ADF7A[v4]))();
  *a1 = a2 + 4;
  return ((uint64_t (*)(void))((char *)sub_23A4A40E0 + 4 * byte_23A4ADF75[v4]))();
}

uint64_t sub_23A4A40E0(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_23A4A40E8(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x23A4A40F0);
  return result;
}

uint64_t sub_23A4A40FC(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x23A4A4104);
  *(_BYTE *)result = a2 + 4;
  return result;
}

uint64_t sub_23A4A4108(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23A4A4110(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for SummarizedAnswerSnippetModel.CodingKeys()
{
  return &type metadata for SummarizedAnswerSnippetModel.CodingKeys;
}

unint64_t sub_23A4A4130()
{
  unint64_t result;

  result = qword_256981A80;
  if (!qword_256981A80)
  {
    result = MEMORY[0x23B84E2B0](&unk_23A4AE0F8, &type metadata for SummarizedAnswerSnippetModel.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256981A80);
  }
  return result;
}

unint64_t sub_23A4A4170()
{
  unint64_t result;

  result = qword_256981A88;
  if (!qword_256981A88)
  {
    result = MEMORY[0x23B84E2B0](&unk_23A4AE068, &type metadata for SummarizedAnswerSnippetModel.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256981A88);
  }
  return result;
}

unint64_t sub_23A4A41B0()
{
  unint64_t result;

  result = qword_256981A90;
  if (!qword_256981A90)
  {
    result = MEMORY[0x23B84E2B0](&unk_23A4AE090, &type metadata for SummarizedAnswerSnippetModel.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256981A90);
  }
  return result;
}

uint64_t OUTLINED_FUNCTION_0_19()
{
  return type metadata accessor for SummarizedAnswerSnippetModel();
}

uint64_t OUTLINED_FUNCTION_19_4()
{
  return sub_23A4AAA44();
}

uint64_t OUTLINED_FUNCTION_23_3@<X0>(uint64_t a1@<X0>, uint64_t (*a2)(uint64_t, uint64_t)@<X8>)
{
  uint64_t v2;

  return a2(a1, v2);
}

uint64_t OUTLINED_FUNCTION_24_4()
{
  uint64_t v0;

  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 - 88) + 8))(*(_QWORD *)(v0 - 120), *(_QWORD *)(v0 - 128));
}

uint64_t OUTLINED_FUNCTION_25_3()
{
  uint64_t v0;
  uint64_t v1;

  return sub_23A48A488(v1, v0);
}

uint64_t OUTLINED_FUNCTION_26_5()
{
  uint64_t (*v0)(uint64_t, uint64_t);
  uint64_t v1;
  uint64_t v2;

  return v0(v2, v1);
}

uint64_t OUTLINED_FUNCTION_27_5@<X0>(uint64_t a1@<X8>)
{
  uint64_t (*v1)(uint64_t, uint64_t);
  uint64_t v2;
  uint64_t v3;

  return v1(v2 + a1, v3);
}

uint64_t OUTLINED_FUNCTION_28_4()
{
  return sub_23A4AA21C();
}

void OUTLINED_FUNCTION_33_2()
{
  sub_23A4A6C04();
}

uint64_t OUTLINED_FUNCTION_34_2()
{
  return sub_23A4AA36C();
}

uint64_t OUTLINED_FUNCTION_36_3()
{
  uint64_t v0;

  return v0;
}

uint64_t OUTLINED_FUNCTION_38_1()
{
  return sub_23A4AA354();
}

uint64_t OUTLINED_FUNCTION_39_3()
{
  uint64_t v0;
  uint64_t v1;

  return sub_23A4A36B4(v1, v0);
}

uint64_t sub_23A4A42A8(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  *(_QWORD *)(v2 + 40) = a1;
  *(_QWORD *)(v2 + 48) = a2;
  return swift_task_switch();
}

uint64_t sub_23A4A42C0()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;

  v1 = *(_QWORD **)(v0 + 40);
  v2 = v1[2];
  *(_QWORD *)(v0 + 56) = v2;
  if (v2)
  {
    v3 = MEMORY[0x24BEE4AF8];
    *(_QWORD *)(v0 + 64) = 0;
    *(_QWORD *)(v0 + 72) = v3;
    v4 = v1[4];
    *(_QWORD *)(v0 + 80) = v4;
    v5 = v1[5];
    *(_QWORD *)(v0 + 88) = v5;
    *(_QWORD *)(v0 + 96) = v1[7];
    v6 = v1[8];
    *(_QWORD *)(v0 + 104) = v6;
    v7 = *(_QWORD *)(v6 + 16);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v8 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 112) = v8;
    *v8 = v0;
    v8[1] = sub_23A4A43C0;
    return sub_23A486920(v4, v5, v7);
  }
  else
  {
    swift_release();
    return (*(uint64_t (**)(_QWORD))(v0 + 8))(MEMORY[0x24BEE4AF8]);
  }
}

uint64_t sub_23A4A43C0(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  _QWORD *v3;

  v3 = (_QWORD *)*v2;
  v3[2] = v2;
  v3[3] = a1;
  v3[4] = a2;
  v3[15] = a2;
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_23A4A441C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t *v2;
  uint64_t v3;
  char isUniquelyReferenced_nonNull_native;
  char *v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v15;
  _QWORD *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  _QWORD *v21;

  v1 = *(_QWORD *)(v0 + 120);
  if (v1)
  {
    v2 = (uint64_t *)(v0 + 24);
  }
  else
  {
    v2 = (uint64_t *)(v0 + 80);
    v1 = swift_bridgeObjectRetain();
  }
  v3 = *v2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  v5 = *(char **)(v0 + 72);
  if ((isUniquelyReferenced_nonNull_native & 1) == 0)
    v5 = OUTLINED_FUNCTION_11_9(0, *((_QWORD *)v5 + 2) + 1);
  v7 = *((_QWORD *)v5 + 2);
  v6 = *((_QWORD *)v5 + 3);
  if (v7 >= v6 >> 1)
    v5 = OUTLINED_FUNCTION_11_9((char *)(v6 > 1), v7 + 1);
  v8 = *(_QWORD *)(v0 + 104);
  v10 = *(_QWORD *)(v0 + 80);
  v9 = *(_QWORD *)(v0 + 88);
  v11 = *(_QWORD *)(v0 + 56);
  v12 = *(_QWORD *)(v0 + 64) + 1;
  *((_QWORD *)v5 + 2) = v7 + 1;
  v13 = &v5[40 * v7];
  *((_QWORD *)v13 + 4) = v10;
  *((_QWORD *)v13 + 5) = v9;
  *((_QWORD *)v13 + 6) = v3;
  *((_QWORD *)v13 + 7) = v1;
  *((_QWORD *)v13 + 8) = v8;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v12 == v11)
  {
    swift_bridgeObjectRelease();
    swift_release();
    return (*(uint64_t (**)(char *))(v0 + 8))(v5);
  }
  else
  {
    v15 = *(_QWORD *)(v0 + 64) + 1;
    *(_QWORD *)(v0 + 64) = v15;
    *(_QWORD *)(v0 + 72) = v5;
    v16 = (_QWORD *)(*(_QWORD *)(v0 + 40) + 40 * v15);
    v17 = v16[4];
    *(_QWORD *)(v0 + 80) = v17;
    v18 = v16[5];
    *(_QWORD *)(v0 + 88) = v18;
    *(_QWORD *)(v0 + 96) = v16[7];
    v19 = v16[8];
    *(_QWORD *)(v0 + 104) = v19;
    v20 = *(_QWORD *)(v19 + 16);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v21 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 112) = v21;
    *v21 = v0;
    v21[1] = sub_23A4A43C0;
    return sub_23A486920(v17, v18, v20);
  }
}

uint64_t Sequence.asyncMap<A>(_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;
  _QWORD *v6;
  uint64_t v8;
  uint64_t v9;

  v6[7] = a5;
  v6[8] = v5;
  v6[5] = a3;
  v6[6] = a4;
  v6[3] = a1;
  v6[4] = a2;
  v6[9] = OUTLINED_FUNCTION_35();
  v8 = OUTLINED_FUNCTION_7_7();
  v6[10] = v8;
  v6[11] = *(_QWORD *)(v8 - 8);
  v6[12] = OUTLINED_FUNCTION_35();
  sub_23A4AA8E8();
  v6[13] = OUTLINED_FUNCTION_35();
  v6[14] = *(_QWORD *)(a3 - 8);
  v6[15] = OUTLINED_FUNCTION_35();
  v9 = OUTLINED_FUNCTION_7_7();
  v6[16] = v9;
  v6[17] = *(_QWORD *)(v9 - 8);
  v6[18] = OUTLINED_FUNCTION_35();
  return OUTLINED_FUNCTION_5_11();
}

uint64_t sub_23A4A46C0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  int *v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t (*v12)(void);

  v2 = *(_QWORD *)(v0 + 112);
  v1 = *(_QWORD *)(v0 + 120);
  v3 = *(_QWORD *)(v0 + 64);
  v4 = *(_QWORD *)(v0 + 40);
  *(_QWORD *)(v0 + 16) = sub_23A4AA87C();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v2 + 16))(v1, v3, v4);
  sub_23A4AA828();
  v5 = *(int **)(v0 + 144);
  v6 = *(_QWORD *)(v0 + 104);
  v7 = *(_QWORD *)(v0 + 80);
  swift_getAssociatedConformanceWitness();
  OUTLINED_FUNCTION_8_9();
  if (__swift_getEnumTagSinglePayload(v6, 1, v7) == 1)
  {
    OUTLINED_FUNCTION_1_15();
    OUTLINED_FUNCTION_10_9();
    swift_task_dealloc();
    OUTLINED_FUNCTION_83();
    OUTLINED_FUNCTION_76();
    OUTLINED_FUNCTION_85();
    return OUTLINED_FUNCTION_2_14(v2, *(uint64_t (**)(void))(v0 + 8));
  }
  else
  {
    OUTLINED_FUNCTION_4_11();
    v12 = (uint64_t (*)(void))((char *)v5 + *v5);
    v9 = (_QWORD *)swift_task_alloc();
    v10 = OUTLINED_FUNCTION_6_9(v9);
    return OUTLINED_FUNCTION_3_14(v10, v11, v12);
  }
}

uint64_t sub_23A4A47F0()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 160) = v0;
  swift_task_dealloc();
  if (v0)
    swift_bridgeObjectRelease();
  return OUTLINED_FUNCTION_5_11();
}

uint64_t sub_23A4A4858()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  int *v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t (*v12)(void);

  v3 = *(_QWORD *)(v0 + 88);
  v2 = *(_QWORD *)(v0 + 96);
  v4 = *(_QWORD *)(v0 + 80);
  sub_23A4AA8AC();
  sub_23A4AA8A0();
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v2, v4);
  v5 = *(int **)(v0 + 144);
  v6 = *(_QWORD *)(v0 + 104);
  v7 = *(_QWORD *)(v0 + 80);
  swift_getAssociatedConformanceWitness();
  OUTLINED_FUNCTION_8_9();
  if (__swift_getEnumTagSinglePayload(v6, 1, v7) == 1)
  {
    OUTLINED_FUNCTION_1_15();
    OUTLINED_FUNCTION_10_9();
    swift_task_dealloc();
    OUTLINED_FUNCTION_83();
    OUTLINED_FUNCTION_76();
    OUTLINED_FUNCTION_85();
    return OUTLINED_FUNCTION_2_14(v1, *(uint64_t (**)(void))(v0 + 8));
  }
  else
  {
    OUTLINED_FUNCTION_4_11();
    v12 = (uint64_t (*)(void))((char *)v5 + *v5);
    v9 = (_QWORD *)swift_task_alloc();
    v10 = OUTLINED_FUNCTION_6_9(v9);
    return OUTLINED_FUNCTION_3_14(v10, v11, v12);
  }
}

uint64_t sub_23A4A4970()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v2 = *(_QWORD *)(v0 + 136);
  v1 = *(_QWORD *)(v0 + 144);
  v3 = *(_QWORD *)(v0 + 128);
  (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 88) + 8))(*(_QWORD *)(v0 + 96), *(_QWORD *)(v0 + 80));
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  swift_task_dealloc();
  OUTLINED_FUNCTION_83();
  OUTLINED_FUNCTION_76();
  OUTLINED_FUNCTION_85();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t OUTLINED_FUNCTION_1_15()
{
  _QWORD *v0;

  return (*(uint64_t (**)(_QWORD, _QWORD))(v0[17] + 8))(v0[18], v0[16]);
}

uint64_t OUTLINED_FUNCTION_2_14(uint64_t a1, uint64_t (*a2)(void))
{
  return a2();
}

uint64_t OUTLINED_FUNCTION_3_14(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  return a3();
}

uint64_t OUTLINED_FUNCTION_4_11()
{
  _QWORD *v0;

  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(v0[11] + 32))(v0[12], v0[13], v0[10]);
}

uint64_t OUTLINED_FUNCTION_5_11()
{
  return swift_task_switch();
}

uint64_t OUTLINED_FUNCTION_6_9(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v2 + 152) = a1;
  *a1 = v2;
  a1[1] = v1;
  return *(_QWORD *)(v2 + 72);
}

uint64_t OUTLINED_FUNCTION_7_7()
{
  return swift_getAssociatedTypeWitness();
}

uint64_t OUTLINED_FUNCTION_8_9()
{
  return sub_23A4AA8F4();
}

uint64_t OUTLINED_FUNCTION_10_9()
{
  return swift_task_dealloc();
}

char *OUTLINED_FUNCTION_11_9(char *a1, int64_t a2)
{
  uint64_t v2;

  return sub_23A485460(a1, a2, 1, v2);
}

uint64_t LearnMoreSnippetModel.init(result:context:)(uint64_t a1, __int128 *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v13;
  __int128 v14;
  uint64_t v15;
  uint64_t v16;

  v4 = sub_23A4AA210();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = *a2;
  v8 = *((_QWORD *)a2 + 2);
  v9 = *((_QWORD *)a2 + 3);
  sub_23A4AA21C();
  sub_23A4AA1F8();
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  v10 = Array<A>.asTextRuns()();
  swift_bridgeObjectRelease();
  *(_QWORD *)&v14 = v10;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256980090);
  sub_23A4AA354();
  OUTLINED_FUNCTION_0_20();
  v14 = v13;
  v15 = v8;
  v16 = v9;
  sub_23A4AA354();
  v11 = sub_23A4AA27C();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 8))(a1, v11);
}

uint64_t LearnMoreSnippetModel.body.getter()
{
  uint64_t v1;

  __swift_instantiateConcreteTypeFromMangledName(&qword_2569800B0);
  sub_23A4AA36C();
  return v1;
}

uint64_t sub_23A4A4C00()
{
  swift_bridgeObjectRetain();
  return LearnMoreSnippetModel.body.setter();
}

uint64_t LearnMoreSnippetModel.body.setter()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_2569800B0);
  return sub_23A4AA378();
}

void LearnMoreSnippetModel.body.modify()
{
  _QWORD *v0;
  _QWORD *v1;

  v1 = OUTLINED_FUNCTION_6_2();
  *v0 = v1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2569800B0);
  v1[4] = OUTLINED_FUNCTION_7_2();
  OUTLINED_FUNCTION_5();
}

uint64_t LearnMoreSnippetModel.context.getter()
{
  OUTLINED_FUNCTION_0_20();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2569800A8);
  return sub_23A4AA36C();
}

double sub_23A4A4CD8@<D0>(uint64_t a1@<X8>)
{
  double result;
  __int128 v3;
  uint64_t v4;
  uint64_t v5;

  LearnMoreSnippetModel.context.getter();
  result = *(double *)&v3;
  *(_OWORD *)a1 = v3;
  *(_QWORD *)(a1 + 16) = v4;
  *(_QWORD *)(a1 + 24) = v5;
  return result;
}

uint64_t sub_23A4A4D18()
{
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return LearnMoreSnippetModel.context.setter();
}

uint64_t LearnMoreSnippetModel.context.setter()
{
  OUTLINED_FUNCTION_0_20();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2569800A8);
  return sub_23A4AA378();
}

void LearnMoreSnippetModel.context.modify()
{
  _QWORD *v0;
  _QWORD *v1;

  v1 = OUTLINED_FUNCTION_6_2();
  *v0 = v1;
  OUTLINED_FUNCTION_0_20();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2569800A8);
  v1[4] = OUTLINED_FUNCTION_7_2();
  OUTLINED_FUNCTION_5();
}

uint64_t LearnMoreSnippetModel.init(body:context:)()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_256980090);
  sub_23A4AA354();
  OUTLINED_FUNCTION_0_20();
  return sub_23A4AA354();
}

uint64_t type metadata accessor for LearnMoreSnippetModel()
{
  uint64_t result;

  result = qword_256981B18;
  if (!qword_256981B18)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_23A4A4EBC()
{
  char v0;
  char v1;

  __swift_instantiateConcreteTypeFromMangledName(&qword_2569800B0);
  sub_23A4AA36C();
  sub_23A4A6C04();
  v1 = v0;
  swift_bridgeObjectRelease();
  return v1 & 1;
}

uint64_t sub_23A4A4F0C(uint64_t a1, uint64_t a2)
{
  BOOL v3;
  char v7;

  v3 = a1 == 2036625250 && a2 == 0xE400000000000000;
  if (v3 || (sub_23A4AAAB0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x747865746E6F63 && a2 == 0xE700000000000000)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    v7 = sub_23A4AAAB0();
    swift_bridgeObjectRelease();
    if ((v7 & 1) != 0)
      return 1;
    else
      return 2;
  }
}

uint64_t sub_23A4A4FE0(char a1)
{
  if ((a1 & 1) != 0)
    return 0x747865746E6F63;
  else
    return 2036625250;
}

uint64_t sub_23A4A5010()
{
  char *v0;

  return sub_23A4A4FE0(*v0);
}

uint64_t sub_23A4A5018@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_23A4A4F0C(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_23A4A503C()
{
  sub_23A4A51E8();
  return sub_23A4AAB04();
}

uint64_t sub_23A4A5064()
{
  sub_23A4A51E8();
  return sub_23A4AAB10();
}

uint64_t LearnMoreSnippetModel.encode(to:)(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_256981AA8);
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  OUTLINED_FUNCTION_4_2();
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_23A4A51E8();
  sub_23A4AAAF8();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2569800B0);
  sub_23A4A552C((uint64_t)&unk_256981420);
  OUTLINED_FUNCTION_9_1();
  if (!v1)
  {
    type metadata accessor for LearnMoreSnippetModel();
    __swift_instantiateConcreteTypeFromMangledName(&qword_2569800A8);
    sub_23A47DFC8((uint64_t)&unk_2569802E0);
    OUTLINED_FUNCTION_9_1();
  }
  return (*(uint64_t (**)(uint64_t, uint64_t))(v5 + 8))(v2, v4);
}

unint64_t sub_23A4A51E8()
{
  unint64_t result;

  result = qword_256981AB0;
  if (!qword_256981AB0)
  {
    result = MEMORY[0x23B84E2B0](&unk_23A4AE30C, &type metadata for LearnMoreSnippetModel.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256981AB0);
  }
  return result;
}

unint64_t sub_23A4A5224(uint64_t a1)
{
  unint64_t *v1;
  unint64_t result;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;

  result = OUTLINED_FUNCTION_5_2(a1);
  if (!result)
  {
    v5 = v4;
    v6 = v3;
    v7 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256980090);
    v8 = sub_23A47E0EC(v6);
    result = MEMORY[0x23B84E2B0](v5, v7, &v8);
    atomic_store(result, v1);
  }
  return result;
}

uint64_t LearnMoreSnippetModel.init(from:)@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
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
  uint64_t v16;
  uint64_t v17;
  _QWORD *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  char v28;
  char v29;

  v21 = a2;
  v23 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569800A8);
  v20 = *(_QWORD *)(v23 - 8);
  MEMORY[0x24BDAC7A8](v23);
  OUTLINED_FUNCTION_8_2();
  v22 = v4;
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569800B0);
  v26 = *(_QWORD *)(v5 - 8);
  v27 = v5;
  MEMORY[0x24BDAC7A8](v5);
  OUTLINED_FUNCTION_8_2();
  v24 = v6;
  v25 = __swift_instantiateConcreteTypeFromMangledName(&qword_256981AB8);
  v7 = *(_QWORD *)(v25 - 8);
  MEMORY[0x24BDAC7A8](v25);
  OUTLINED_FUNCTION_4_2();
  v8 = type metadata accessor for LearnMoreSnippetModel();
  MEMORY[0x24BDAC7A8](v8);
  v10 = (char *)&v16 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_23A4A51E8();
  sub_23A4AAAEC();
  if (v2)
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  v17 = v8;
  v18 = a1;
  v19 = v7;
  v11 = v26;
  v12 = v22;
  v13 = v23;
  v29 = 0;
  sub_23A4A552C((uint64_t)&unk_256981470);
  v14 = v24;
  OUTLINED_FUNCTION_10_1();
  (*(void (**)(char *, uint64_t, uint64_t))(v11 + 32))(v10, v14, v27);
  v28 = 1;
  sub_23A47DFC8((uint64_t)&unk_256980308);
  OUTLINED_FUNCTION_10_1();
  OUTLINED_FUNCTION_1_4();
  (*(void (**)(char *, uint64_t, uint64_t))(v20 + 32))(&v10[*(int *)(v17 + 20)], v12, v13);
  sub_23A4A55B8((uint64_t)v10, v21);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v18);
  return sub_23A4A55FC((uint64_t)v10);
}

void sub_23A4A552C(uint64_t a1)
{
  if (!OUTLINED_FUNCTION_5_2(a1))
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2569800B0);
    sub_23A4A5224((uint64_t)&unk_256981428);
    sub_23A4A5224((uint64_t)&unk_256981438);
    OUTLINED_FUNCTION_0_6();
  }
  OUTLINED_FUNCTION_3_3();
}

uint64_t sub_23A4A55B8(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for LearnMoreSnippetModel();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_23A4A55FC(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata accessor for LearnMoreSnippetModel();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_23A4A5638()
{
  return sub_23A47E0EC((uint64_t)&qword_256980F80);
}

unint64_t sub_23A4A5664()
{
  return sub_23A47E0EC((uint64_t)&unk_256980F20);
}

uint64_t sub_23A4A5694@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  return LearnMoreSnippetModel.init(from:)(a1, a2);
}

uint64_t sub_23A4A56A8(_QWORD *a1)
{
  return LearnMoreSnippetModel.encode(to:)(a1);
}

uint64_t sub_23A4A56BC@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  result = LearnMoreSnippetModel.body.getter();
  *a1 = result;
  return result;
}

uint64_t *initializeBufferWithCopyOfBuffer for LearnMoreSnippetModel(uint64_t *a1, uint64_t *a2, uint64_t a3)
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
    v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569800B0);
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a1, a2, v7);
    v8 = *(int *)(a3 + 20);
    v9 = (char *)a1 + v8;
    v10 = (char *)a2 + v8;
    v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569800A8);
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v11 - 8) + 16))(v9, v10, v11);
  }
  return a1;
}

uint64_t destroy for LearnMoreSnippetModel(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569800B0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(a1, v4);
  v5 = a1 + *(int *)(a2 + 20);
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569800A8);
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 8))(v5, v6);
}

uint64_t initializeWithCopy for LearnMoreSnippetModel(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569800B0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(a1, a2, v6);
  v7 = *(int *)(a3 + 20);
  v8 = a1 + v7;
  v9 = a2 + v7;
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569800A8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 16))(v8, v9, v10);
  return a1;
}

uint64_t assignWithCopy for LearnMoreSnippetModel(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569800B0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 24))(a1, a2, v6);
  v7 = *(int *)(a3 + 20);
  v8 = a1 + v7;
  v9 = a2 + v7;
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569800A8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 24))(v8, v9, v10);
  return a1;
}

uint64_t initializeWithTake for LearnMoreSnippetModel(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569800B0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 32))(a1, a2, v6);
  v7 = *(int *)(a3 + 20);
  v8 = a1 + v7;
  v9 = a2 + v7;
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569800A8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 32))(v8, v9, v10);
  return a1;
}

uint64_t assignWithTake for LearnMoreSnippetModel(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569800B0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 40))(a1, a2, v6);
  v7 = *(int *)(a3 + 20);
  v8 = a1 + v7;
  v9 = a2 + v7;
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569800A8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 40))(v8, v9, v10);
  return a1;
}

uint64_t getEnumTagSinglePayload for LearnMoreSnippetModel()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_23A4A5A20(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569800B0);
  if (*(_DWORD *)(*(_QWORD *)(v6 - 8) + 84) == (_DWORD)a2)
  {
    v7 = v6;
    v8 = a1;
  }
  else
  {
    v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569800A8);
    v8 = a1 + *(int *)(a3 + 20);
  }
  return __swift_getEnumTagSinglePayload(v8, a2, v7);
}

uint64_t storeEnumTagSinglePayload for LearnMoreSnippetModel()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_23A4A5A9C(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569800B0);
  if (*(_DWORD *)(*(_QWORD *)(v8 - 8) + 84) == a3)
  {
    v9 = v8;
    v10 = a1;
  }
  else
  {
    v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569800A8);
    v10 = a1 + *(int *)(a4 + 20);
  }
  return __swift_storeEnumTagSinglePayload(v10, a2, a2, v9);
}

void sub_23A4A5B14()
{
  unint64_t v0;
  unint64_t v1;

  sub_23A4A5B98();
  if (v0 <= 0x3F)
  {
    sub_23A47E684();
    if (v1 <= 0x3F)
      swift_initStructMetadata();
  }
}

void sub_23A4A5B98()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_2569814F8)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256980090);
    v0 = sub_23A4AA384();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_2569814F8);
  }
}

uint64_t storeEnumTagSinglePayload for LearnMoreSnippetModel.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_23A4A5C3C + 4 * byte_23A4AE175[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_23A4A5C70 + 4 * byte_23A4AE170[v4]))();
}

uint64_t sub_23A4A5C70(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_23A4A5C78(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x23A4A5C80);
  return result;
}

uint64_t sub_23A4A5C8C(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x23A4A5C94);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_23A4A5C98(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23A4A5CA0(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for LearnMoreSnippetModel.CodingKeys()
{
  return &type metadata for LearnMoreSnippetModel.CodingKeys;
}

unint64_t sub_23A4A5CC0()
{
  unint64_t result;

  result = qword_256981B50;
  if (!qword_256981B50)
  {
    result = MEMORY[0x23B84E2B0](&unk_23A4AE2E4, &type metadata for LearnMoreSnippetModel.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256981B50);
  }
  return result;
}

unint64_t sub_23A4A5D00()
{
  unint64_t result;

  result = qword_256981B58;
  if (!qword_256981B58)
  {
    result = MEMORY[0x23B84E2B0](&unk_23A4AE254, &type metadata for LearnMoreSnippetModel.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256981B58);
  }
  return result;
}

unint64_t sub_23A4A5D40()
{
  unint64_t result;

  result = qword_256981B60;
  if (!qword_256981B60)
  {
    result = MEMORY[0x23B84E2B0](&unk_23A4AE27C, &type metadata for LearnMoreSnippetModel.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256981B60);
  }
  return result;
}

uint64_t OUTLINED_FUNCTION_0_20()
{
  return type metadata accessor for LearnMoreSnippetModel();
}

id static BiomeEventSender.shared.getter@<X0>(_QWORD *a1@<X8>)
{
  void *v2;

  if (qword_25697FF60 != -1)
    swift_once();
  v2 = (void *)qword_256981B68;
  *a1 = qword_256981B68;
  return v2;
}

uint64_t static DeviceExpertDiscoverabilityEvent.== infix(_:_:)()
{
  return 1;
}

uint64_t DeviceExpertDiscoverabilityEvent.hash(into:)()
{
  return sub_23A4AAAD4();
}

uint64_t DeviceExpertDiscoverabilityEvent.hashValue.getter()
{
  sub_23A4AAAC8();
  sub_23A4AAAD4();
  return sub_23A4AAAE0();
}

uint64_t sub_23A4A5E40()
{
  return DeviceExpertDiscoverabilityEvent.hashValue.getter();
}

uint64_t sub_23A4A5E54()
{
  return DeviceExpertDiscoverabilityEvent.hash(into:)();
}

void sub_23A4A5E68()
{
  sub_23A4A5E74(&qword_256981B68);
}

void sub_23A4A5E74(_QWORD *a1@<X8>)
{
  id v2;
  id v3;
  id v4;

  v2 = objc_msgSend((id)BiomeLibrary(), sel_Discoverability);
  swift_unknownObjectRelease();
  v3 = objc_msgSend(v2, sel_Signals);
  swift_unknownObjectRelease();
  v4 = objc_msgSend(v3, sel_source);

  *a1 = v4;
}

void BiomeEventSender.send(_:)()
{
  void **v0;
  void *v1;
  uint64_t v2;
  NSObject *v3;
  os_log_type_t v4;
  uint8_t *v5;
  id v6;
  id v7;
  uint64_t v8;

  v1 = *v0;
  if (qword_25697FF48 != -1)
    swift_once();
  v2 = sub_23A4AA6F0();
  __swift_project_value_buffer(v2, (uint64_t)qword_2569815D0);
  v3 = sub_23A4AA6D8();
  v4 = sub_23A4AA8C4();
  if (os_log_type_enabled(v3, v4))
  {
    v5 = (uint8_t *)swift_slowAlloc();
    v8 = swift_slowAlloc();
    *(_DWORD *)v5 = 136315138;
    sub_23A49D6D8(0xD00000000000001BLL, 0x800000023A4AF740, &v8);
    sub_23A4AA900();
    _os_log_impl(&dword_23A470000, v3, v4, "Donating %s event to discoverabilitySignal", v5, 0xCu);
    swift_arrayDestroy();
    OUTLINED_FUNCTION_0_0();
  }

  v6 = objc_allocWithZone(MEMORY[0x24BE0C3A0]);
  v7 = sub_23A4A60D0(0xD00000000000001BLL, 0x800000023A4AF740, 0, 0, 0, 0, 0, 0xF000000000000000);
  objc_msgSend(v1, sel_sendEvent_, v7);

}

id sub_23A4A60D0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, unint64_t a8)
{
  void *v8;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;

  if (a2)
  {
    v13 = (void *)sub_23A4AA7BC();
    swift_bridgeObjectRelease();
    if (a4)
      goto LABEL_3;
LABEL_6:
    v14 = 0;
    if (a6)
      goto LABEL_4;
    goto LABEL_7;
  }
  v13 = 0;
  if (!a4)
    goto LABEL_6;
LABEL_3:
  v14 = (void *)sub_23A4AA7BC();
  swift_bridgeObjectRelease();
  if (a6)
  {
LABEL_4:
    v15 = (void *)sub_23A4AA7BC();
    swift_bridgeObjectRelease();
    goto LABEL_8;
  }
LABEL_7:
  v15 = 0;
LABEL_8:
  if (a8 >> 60 == 15)
  {
    v16 = 0;
  }
  else
  {
    v16 = (void *)sub_23A4A9F4C();
    sub_23A4A62E4(a7, a8);
  }
  v17 = objc_msgSend(v8, sel_initWithContentIdentifier_context_osBuild_userInfo_, v13, v14, v15, v16);

  return v17;
}

unint64_t sub_23A4A61F4()
{
  unint64_t result;

  result = qword_256981B70;
  if (!qword_256981B70)
  {
    result = MEMORY[0x23B84E2B0](&protocol conformance descriptor for DeviceExpertDiscoverabilityEvent, &type metadata for DeviceExpertDiscoverabilityEvent);
    atomic_store(result, (unint64_t *)&qword_256981B70);
  }
  return result;
}

uint64_t dispatch thunk of BiomeEventSending.send(_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 8))();
}

uint64_t storeEnumTagSinglePayload for DeviceExpertDiscoverabilityEvent(uint64_t a1, int a2, int a3)
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
    return ((uint64_t (*)(void))((char *)sub_23A4A6278 + 4 * byte_23A4AE360[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_23A4A6298 + 4 * byte_23A4AE365[v4]))();
}

_BYTE *sub_23A4A6278(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_23A4A6298(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_23A4A62A0(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_23A4A62A8(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_23A4A62B0(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_23A4A62B8(_DWORD *result)
{
  *result = 0;
  return result;
}

ValueMetadata *type metadata accessor for DeviceExpertDiscoverabilityEvent()
{
  return &type metadata for DeviceExpertDiscoverabilityEvent;
}

ValueMetadata *type metadata accessor for BiomeEventSender()
{
  return &type metadata for BiomeEventSender;
}

uint64_t sub_23A4A62E4(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15)
    return sub_23A47C41C(a1, a2);
  return a1;
}

void sub_23A4A62F8(uint64_t a1@<X0>, unint64_t a2@<X1>, uint64_t a3@<X8>)
{
  sub_23A4A6400(a1, a2, (uint64_t (*)(uint64_t))MEMORY[0x24BE6FF38], &qword_256980978, MEMORY[0x24BE6FF28], a3);
}

void sub_23A4A6324(uint64_t a1@<X0>, unint64_t a2@<X1>, uint64_t a3@<X8>)
{
  sub_23A4A6400(a1, a2, (uint64_t (*)(uint64_t))MEMORY[0x24BE6FD58], &qword_2569809B8, MEMORY[0x24BE6FD40], a3);
}

void sub_23A4A6350(uint64_t a1@<X0>, unint64_t a2@<X1>, uint64_t a3@<X8>)
{
  sub_23A4A6400(a1, a2, (uint64_t (*)(uint64_t))MEMORY[0x24BE6FEB0], &qword_256980930, MEMORY[0x24BE6FE88], a3);
}

void sub_23A4A637C(uint64_t a1@<X0>, unint64_t a2@<X1>, uint64_t a3@<X8>)
{
  sub_23A4A6400(a1, a2, (uint64_t (*)(uint64_t))MEMORY[0x24BE6FDC0], &qword_256981BD0, MEMORY[0x24BE6FDA8], a3);
}

void sub_23A4A63A8(uint64_t a1@<X0>, unint64_t a2@<X1>, uint64_t a3@<X8>)
{
  sub_23A4A6400(a1, a2, (uint64_t (*)(uint64_t))MEMORY[0x24BE6FE20], &qword_256981C10, MEMORY[0x24BE6FE08], a3);
}

void sub_23A4A63D4(uint64_t a1@<X0>, unint64_t a2@<X1>, uint64_t a3@<X8>)
{
  sub_23A4A6400(a1, a2, (uint64_t (*)(uint64_t))MEMORY[0x24BE6FCF0], &qword_256981B78, MEMORY[0x24BE6FCD0], a3);
}

void sub_23A4A6400(uint64_t a1@<X0>, unint64_t a2@<X1>, uint64_t (*a3)(uint64_t)@<X2>, unint64_t *a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X8>)
{
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  __int128 v19;
  __int128 v20;
  uint64_t v21;
  uint64_t v22;

  v18 = a6;
  sub_23A4AA684();
  OUTLINED_FUNCTION_0_1();
  MEMORY[0x24BDAC7A8](v11);
  OUTLINED_FUNCTION_22_3();
  v12 = a3(0);
  v13 = *(_QWORD *)(v12 - 8);
  MEMORY[0x24BDAC7A8](v12);
  v15 = (char *)&v17 - v14;
  v21 = 0;
  v19 = 0u;
  v20 = 0u;
  sub_23A47EBB8(a1, a2);
  sub_23A4AA678();
  sub_23A489544(a4, a3, a5);
  v16 = v22;
  sub_23A4AA690();
  if (v16)
  {
    OUTLINED_FUNCTION_4_3();
  }
  else
  {
    (*(void (**)(uint64_t, char *, uint64_t))(v13 + 16))(v18, v15, v12);
    OUTLINED_FUNCTION_4_3();
    (*(void (**)(char *, uint64_t))(v13 + 8))(v15, v12);
  }
  OUTLINED_FUNCTION_0();
}

uint64_t sub_23A4A652C()
{
  return sub_23A4A6634((uint64_t (*)(uint64_t))MEMORY[0x24BE6FF38], &qword_256980978, MEMORY[0x24BE6FF28]);
}

uint64_t sub_23A4A6558()
{
  return sub_23A4A6634((uint64_t (*)(uint64_t))MEMORY[0x24BE6FD58], &qword_2569809B8, MEMORY[0x24BE6FD40]);
}

uint64_t sub_23A4A6584()
{
  return sub_23A4A6634((uint64_t (*)(uint64_t))MEMORY[0x24BE6FEB0], &qword_256980930, MEMORY[0x24BE6FE88]);
}

uint64_t sub_23A4A65B0()
{
  return sub_23A4A6634((uint64_t (*)(uint64_t))MEMORY[0x24BE6FDC0], &qword_256981BD0, MEMORY[0x24BE6FDA8]);
}

uint64_t sub_23A4A65DC()
{
  return sub_23A4A6634((uint64_t (*)(uint64_t))MEMORY[0x24BE6FE20], &qword_256981C10, MEMORY[0x24BE6FE08]);
}

uint64_t sub_23A4A6608()
{
  return sub_23A4A6634((uint64_t (*)(uint64_t))MEMORY[0x24BE6FCF0], &qword_256981B78, MEMORY[0x24BE6FCD0]);
}

uint64_t sub_23A4A6634(uint64_t (*a1)(uint64_t), unint64_t *a2, uint64_t a3)
{
  a1(0);
  sub_23A489544(a2, a1, a3);
  return sub_23A4AA69C();
}

void sub_23A4A669C(uint64_t a1@<X8>)
{
  sub_23A4A6704(type metadata accessor for Action, (uint64_t (*)(uint64_t))MEMORY[0x24BE6FEB0], &qword_256980930, MEMORY[0x24BE6FE88], a1);
}

void sub_23A4A66D0(uint64_t a1@<X8>)
{
  sub_23A4A6704(type metadata accessor for Action.URLConfiguration, (uint64_t (*)(uint64_t))MEMORY[0x24BE6FF38], &qword_256980978, MEMORY[0x24BE6FF28], a1);
}

void sub_23A4A6704(uint64_t (*a1)(_QWORD)@<X1>, uint64_t (*a2)(uint64_t)@<X2>, unint64_t *a3@<X3>, uint64_t a4@<X4>, uint64_t a5@<X8>)
{
  _QWORD *v5;
  uint64_t v6;
  uint64_t v8;
  uint64_t (*v9)(uint64_t);
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t);
  unint64_t *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t v20;

  v15 = a3;
  v16 = a4;
  v14 = a2;
  v17 = a5;
  v8 = OUTLINED_FUNCTION_31_3();
  v10 = v9(v8);
  MEMORY[0x24BDAC7A8](v10);
  v12 = (char *)&v13 - v11;
  v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569803D8);
  MEMORY[0x24BDAC7A8](v20);
  __swift_project_boxed_opaque_existential_1(v5, v5[3]);
  sub_23A47EF90();
  sub_23A4AAAEC();
  if (!v6)
  {
    sub_23A47EFCC();
    sub_23A4AAA44();
    sub_23A4A6400(v18, v19, v14, v15, v16, (uint64_t)v12);
    OUTLINED_FUNCTION_37_4();
    sub_23A48F9FC((uint64_t)v12, v17, a1);
  }
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v5);
  OUTLINED_FUNCTION_0();
}

void sub_23A4A687C(uint64_t a1@<X8>)
{
  sub_23A4A6704(type metadata accessor for Action.AppIntentConfiguration, (uint64_t (*)(uint64_t))MEMORY[0x24BE6FD58], &qword_2569809B8, MEMORY[0x24BE6FD40], a1);
}

void sub_23A4A68B0(_QWORD *a1)
{
  sub_23A4A6934(a1, (uint64_t (*)(uint64_t))MEMORY[0x24BE6FEB0], &qword_256980930, MEMORY[0x24BE6FE88]);
}

void sub_23A4A68DC(_QWORD *a1)
{
  sub_23A4A6934(a1, (uint64_t (*)(uint64_t))MEMORY[0x24BE6FF38], &qword_256980978, MEMORY[0x24BE6FF28]);
}

void sub_23A4A6908(_QWORD *a1)
{
  sub_23A4A6934(a1, (uint64_t (*)(uint64_t))MEMORY[0x24BE6FD58], &qword_2569809B8, MEMORY[0x24BE6FD40]);
}

void sub_23A4A6934(_QWORD *a1, uint64_t (*a2)(uint64_t), unint64_t *a3, uint64_t a4)
{
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  unint64_t v15;
  _QWORD v16[4];
  uint64_t v17;

  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569803F0);
  v17 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v10 = (char *)v16 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_23A47EF90();
  sub_23A4AAAF8();
  a2(0);
  sub_23A489544(a3, a2, a4);
  v11 = v16[1];
  v12 = sub_23A4AA69C();
  if (!v11)
  {
    v14 = v12;
    v15 = v13;
    v16[2] = v12;
    v16[3] = v13;
    sub_23A47F120();
    sub_23A4AAA98();
    sub_23A47C41C(v14, v15);
  }
  (*(void (**)(char *, uint64_t))(v17 + 8))(v10, v8);
  OUTLINED_FUNCTION_0();
}

uint64_t Array<A>.asTextRuns()()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  int64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(char *, uint64_t, uint64_t);
  unint64_t v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;

  OUTLINED_FUNCTION_39_4();
  v21 = v0;
  v22 = v1;
  v3 = v2;
  v4 = type metadata accessor for TextRun(0);
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v19 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = *(_QWORD *)(v3 + 16);
  v9 = MEMORY[0x24BEE4AF8];
  if (v8)
  {
    v20 = MEMORY[0x24BEE4AF8];
    sub_23A4A7FB4(0, v8, 0);
    v9 = v20;
    v10 = OUTLINED_FUNCTION_18_7();
    v11 = *(_QWORD *)(v10 - 8);
    v12 = v3 + ((*(unsigned __int8 *)(v11 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v11 + 80));
    v13 = *(_QWORD *)(v11 + 72);
    v14 = *(void (**)(char *, uint64_t, uint64_t))(v11 + 16);
    do
    {
      v14(v7, v12, v10);
      v20 = v9;
      v16 = *(_QWORD *)(v9 + 16);
      v15 = *(_QWORD *)(v9 + 24);
      if (v16 >= v15 >> 1)
      {
        sub_23A4A7FB4(v15 > 1, v16 + 1, 1);
        v9 = v20;
      }
      *(_QWORD *)(v9 + 16) = v16 + 1;
      OUTLINED_FUNCTION_33_3();
      sub_23A48F9FC((uint64_t)v7, v9 + v17 + *(_QWORD *)(v5 + 72) * v16, type metadata accessor for TextRun);
      v12 += v13;
      --v8;
    }
    while (v8);
  }
  return v9;
}

uint64_t type metadata accessor for TextRun(uint64_t a1)
{
  return sub_23A47F74C(a1, qword_256981CA8);
}

void Apple_Parsec_DeviceExpert_V0alpha_ClientComponent_DeviceExpertResult.AnswerStep.asTextRuns()()
{
  sub_23A4A9FAC();
  Array<A>.asTextRuns()();
  OUTLINED_FUNCTION_39_1();
  OUTLINED_FUNCTION_60();
}

void sub_23A4A6C04()
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
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t (**v18)(uint64_t, uint64_t);
  int v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  int v23;
  uint64_t v24;
  int v25;
  int v26;

  OUTLINED_FUNCTION_39_4();
  v3 = v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256981B80);
  OUTLINED_FUNCTION_0_1();
  MEMORY[0x24BDAC7A8](v4);
  OUTLINED_FUNCTION_27_6();
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)&v24 - v6;
  type metadata accessor for TextRun.Value(0);
  OUTLINED_FUNCTION_0_1();
  MEMORY[0x24BDAC7A8](v8);
  v9 = OUTLINED_FUNCTION_14_9();
  MEMORY[0x24BDAC7A8](v9);
  OUTLINED_FUNCTION_35_3();
  v10 = *(_QWORD *)(v3 + 16);
  if (v10)
  {
    OUTLINED_FUNCTION_33_3();
    v12 = v3 + v11;
    v26 = *MEMORY[0x24BE6FCB0];
    v25 = *MEMORY[0x24BE6FCB8];
    v14 = *(_QWORD *)(v13 + 72);
    v24 = v3;
    OUTLINED_FUNCTION_67_0();
    v15 = v10 - 1;
    do
    {
      v16 = v15;
      sub_23A4A87E0(v12, v0);
      sub_23A4A9FF4();
      v17 = OUTLINED_FUNCTION_38_2();
      if (__swift_getEnumTagSinglePayload((uint64_t)v7, 1, v17) == 1)
        goto LABEL_13;
      OUTLINED_FUNCTION_41_2();
      v18 = *(uint64_t (***)(uint64_t, uint64_t))(v17 - 8);
      v19 = v18[11](v1, v17);
      if (v19 == v26)
      {
        OUTLINED_FUNCTION_24_5(v18[12]);
        v20 = OUTLINED_FUNCTION_19_5();
        v22 = v20;
      }
      else
      {
        if (v19 != v25)
        {
          OUTLINED_FUNCTION_24_5(v18[1]);
LABEL_13:
          OUTLINED_FUNCTION_7_8();
          OUTLINED_FUNCTION_0_21();
          OUTLINED_FUNCTION_45_3();
        }
        OUTLINED_FUNCTION_24_5(v18[12]);
        v20 = OUTLINED_FUNCTION_17_4();
        v22 = v20;
      }
      OUTLINED_FUNCTION_30_3(v20, v21, v22);
      swift_storeEnumTagMultiPayload();
      sub_23A4A8054((uint64_t)v7);
      v23 = OUTLINED_FUNCTION_42_2();
      sub_23A4A8824();
      sub_23A4A8824();
      if (v23 == 1)
        break;
      v15 = v16 - 1;
      v12 += v14;
    }
    while (v16);
    swift_bridgeObjectRelease();
  }
  OUTLINED_FUNCTION_14_4();
}

void sub_23A4A6E0C()
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
  uint64_t v11;
  uint64_t (**v12)(uint64_t, uint64_t);
  char v13;
  char v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  int v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  int v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  int v35;
  int v36;

  OUTLINED_FUNCTION_39_4();
  v3 = v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256981B80);
  OUTLINED_FUNCTION_0_1();
  MEMORY[0x24BDAC7A8](v4);
  OUTLINED_FUNCTION_27_6();
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)&v28 - v6;
  type metadata accessor for TextRun.Value(0);
  OUTLINED_FUNCTION_0_1();
  MEMORY[0x24BDAC7A8](v8);
  v9 = OUTLINED_FUNCTION_14_9();
  v10 = *(_QWORD *)(v9 - 8);
  MEMORY[0x24BDAC7A8](v9);
  OUTLINED_FUNCTION_35_3();
  v11 = *(_QWORD *)(v3 + 16);
  if (v11)
  {
    v12 = *(uint64_t (***)(uint64_t, uint64_t))(v3 + 32);
    v34 = v3 + 32;
    OUTLINED_FUNCTION_67_0();
    swift_bridgeObjectRetain();
    sub_23A4A6C04();
    v14 = v13;
    OUTLINED_FUNCTION_46_2();
    if ((v14 & 1) != 0)
    {
      OUTLINED_FUNCTION_39_1();
    }
    else if (v11 == 1)
    {
LABEL_5:
      OUTLINED_FUNCTION_39_1();
    }
    else
    {
      v36 = *MEMORY[0x24BE6FCB0];
      v35 = *MEMORY[0x24BE6FCB8];
      v15 = 1;
      v32 = v3;
      v29 = v11;
      v30 = v10;
      while (1)
      {
        v16 = v15 + 1;
        if (__OFADD__(v15, 1))
        {
          __break(1u);
LABEL_24:
          OUTLINED_FUNCTION_25_4(v12[1]);
LABEL_25:
          OUTLINED_FUNCTION_7_8();
          OUTLINED_FUNCTION_0_21();
          OUTLINED_FUNCTION_45_3();
        }
        v17 = *(_QWORD *)(*(_QWORD *)(v34 + 8 * v15) + 16);
        if (v17)
          break;
LABEL_19:
        v15 = v16;
        if (v16 == v11)
          goto LABEL_5;
      }
      v31 = v15 + 1;
      OUTLINED_FUNCTION_33_3();
      v20 = v18 + v19;
      v33 = v18;
      swift_bridgeObjectRetain_n();
      v21 = *(_QWORD *)(v10 + 72);
      while (1)
      {
        sub_23A4A87E0(v20, v0);
        sub_23A4A9FF4();
        v22 = OUTLINED_FUNCTION_38_2();
        if (__swift_getEnumTagSinglePayload((uint64_t)v7, 1, v22) == 1)
          goto LABEL_25;
        OUTLINED_FUNCTION_41_2();
        v12 = *(uint64_t (***)(uint64_t, uint64_t))(v22 - 8);
        v23 = v12[11](v1, v22);
        if (v23 == v36)
        {
          OUTLINED_FUNCTION_25_4(v12[12]);
          v24 = OUTLINED_FUNCTION_19_5();
          v26 = v24;
        }
        else
        {
          if (v23 != v35)
            goto LABEL_24;
          OUTLINED_FUNCTION_25_4(v12[12]);
          v24 = OUTLINED_FUNCTION_17_4();
          v26 = v24;
        }
        OUTLINED_FUNCTION_30_3(v24, v25, v26);
        swift_storeEnumTagMultiPayload();
        sub_23A4A8054((uint64_t)v7);
        v27 = OUTLINED_FUNCTION_42_2();
        sub_23A4A8824();
        sub_23A4A8824();
        if (v27 == 1)
          break;
        v20 += v21;
        if (!--v17)
        {
          OUTLINED_FUNCTION_47_1();
          v16 = v31;
          v11 = v29;
          v10 = v30;
          goto LABEL_19;
        }
      }
      swift_bridgeObjectRelease();
      OUTLINED_FUNCTION_47_1();
    }
  }
  OUTLINED_FUNCTION_14_4();
}

uint64_t sub_23A4A7094()
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
  uint64_t v21;
  uint64_t v22;
  uint64_t (**v23)(uint64_t, uint64_t);
  int v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  _QWORD v29[2];
  int v30;
  uint64_t v31;
  uint64_t v32;
  int v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  char *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;

  OUTLINED_FUNCTION_39_4();
  v39 = v2;
  v40 = v3;
  v4 = OUTLINED_FUNCTION_31_3();
  type metadata accessor for TextRun.SymbolConfiguration(v4);
  OUTLINED_FUNCTION_0_1();
  MEMORY[0x24BDAC7A8](v5);
  OUTLINED_FUNCTION_8_2();
  v32 = v6;
  type metadata accessor for TextRun.TextConfiguration(0);
  OUTLINED_FUNCTION_0_1();
  MEMORY[0x24BDAC7A8](v7);
  OUTLINED_FUNCTION_8_2();
  v31 = v8;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256981B80);
  OUTLINED_FUNCTION_0_1();
  v10 = MEMORY[0x24BDAC7A8](v9);
  v12 = (char *)v29 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v10);
  v14 = (char *)v29 - v13;
  v36 = type metadata accessor for TextRun.Value(0);
  OUTLINED_FUNCTION_0_1();
  MEMORY[0x24BDAC7A8](v15);
  OUTLINED_FUNCTION_8_2();
  v35 = v16;
  v17 = type metadata accessor for TextRun(0);
  MEMORY[0x24BDAC7A8](v17);
  OUTLINED_FUNCTION_22_3();
  v18 = *(_QWORD *)(v0 + 16);
  if (!v18)
    return 0;
  OUTLINED_FUNCTION_33_3();
  v20 = v0 + v19;
  v34 = *(_QWORD *)(v21 + 72);
  v33 = *MEMORY[0x24BE6FCB0];
  v30 = *MEMORY[0x24BE6FCB8];
  v29[1] = v0;
  OUTLINED_FUNCTION_67_0();
  v37 = v14;
  do
  {
    sub_23A4A87E0(v20, v1);
    sub_23A4A9FF4();
    v22 = OUTLINED_FUNCTION_38_2();
    if (__swift_getEnumTagSinglePayload((uint64_t)v14, 1, v22) == 1)
      goto LABEL_16;
    sub_23A4A7FF8((uint64_t)v14, (uint64_t)v12);
    v23 = *(uint64_t (***)(uint64_t, uint64_t))(v22 - 8);
    v24 = v23[11]((uint64_t)v12, v22);
    if (v24 == v33)
    {
      OUTLINED_FUNCTION_22_4((uint64_t)v12, v23[12]);
      v25 = OUTLINED_FUNCTION_19_5();
    }
    else
    {
      if (v24 != v30)
      {
        OUTLINED_FUNCTION_22_4((uint64_t)v12, v23[1]);
LABEL_16:
        OUTLINED_FUNCTION_7_8();
        OUTLINED_FUNCTION_0_21();
        OUTLINED_FUNCTION_45_3();
      }
      OUTLINED_FUNCTION_22_4((uint64_t)v12, v23[12]);
      v25 = OUTLINED_FUNCTION_17_4();
    }
    v26 = v35;
    (*(void (**)(uint64_t, char *))(*(_QWORD *)(v25 - 8) + 32))(v35, v12);
    swift_storeEnumTagMultiPayload();
    sub_23A4A8054((uint64_t)v37);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      sub_23A48F9FC(v26, v32, type metadata accessor for TextRun.SymbolConfiguration);
      _s19DeviceExpertIntents6ActionV22AppIntentConfigurationV8bundleIDSSvg_0();
    }
    else
    {
      sub_23A48F9FC(v26, v31, type metadata accessor for TextRun.TextConfiguration);
      _s19DeviceExpertIntents6ActionV5labelSSvg_0();
    }
    OUTLINED_FUNCTION_28_5();
    OUTLINED_FUNCTION_32_2();
    OUTLINED_FUNCTION_39_1();
    OUTLINED_FUNCTION_46_2();
    v27 = v38;
    sub_23A4A8824();
    sub_23A4A8824();
    v20 += v34;
    --v18;
    v14 = v37;
  }
  while (v18);
  swift_bridgeObjectRelease();
  return v27;
}

uint64_t TextRun.proto.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_23A4894D8((void (*)(_QWORD))MEMORY[0x24BE6FCF0], a1);
}

uint64_t TextRun.init(proto:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return sub_23A48926C(a1, (void (*)(_QWORD))MEMORY[0x24BE6FCF0], a2);
}

uint64_t TextRun.init(_:)()
{
  OUTLINED_FUNCTION_18_7();
  sub_23A489544(&qword_256981B78, (uint64_t (*)(uint64_t))MEMORY[0x24BE6FCF0], MEMORY[0x24BE6FCD0]);
  sub_23A4AA6B4();
  return OUTLINED_FUNCTION_39_1();
}

uint64_t sub_23A4A747C()
{
  uint64_t v0;
  uint64_t (*v1)(uint64_t);

  v0 = sub_23A4AA0A8();
  MEMORY[0x24BDAC7A8](v0);
  sub_23A489544(&qword_256981BD0, v1, MEMORY[0x24BE6FDA8]);
  sub_23A4AA6B4();
  return sub_23A4A9FE8();
}

uint64_t sub_23A4A754C()
{
  swift_bridgeObjectRetain();
  return sub_23A4AA09C();
}

uint64_t TextRun.value.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t (**v9)(uint64_t, uint64_t);
  int v10;
  uint64_t v11;
  uint64_t v13;

  __swift_instantiateConcreteTypeFromMangledName(&qword_256981B80);
  OUTLINED_FUNCTION_0_1();
  v3 = MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v13 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v3);
  v7 = (char *)&v13 - v6;
  sub_23A4A9FF4();
  v8 = OUTLINED_FUNCTION_38_2();
  if (__swift_getEnumTagSinglePayload((uint64_t)v7, 1, v8) == 1)
    goto LABEL_8;
  sub_23A4A7FF8((uint64_t)v7, (uint64_t)v5);
  v9 = *(uint64_t (***)(uint64_t, uint64_t))(v8 - 8);
  v10 = v9[11]((uint64_t)v5, v8);
  if (v10 != *MEMORY[0x24BE6FCB0])
  {
    if (v10 == *MEMORY[0x24BE6FCB8])
    {
      OUTLINED_FUNCTION_22_4((uint64_t)v5, v9[12]);
      v11 = OUTLINED_FUNCTION_17_4();
      goto LABEL_6;
    }
    OUTLINED_FUNCTION_22_4((uint64_t)v5, v9[1]);
LABEL_8:
    OUTLINED_FUNCTION_7_8();
    OUTLINED_FUNCTION_0_21();
    OUTLINED_FUNCTION_45_3();
  }
  OUTLINED_FUNCTION_22_4((uint64_t)v5, v9[12]);
  v11 = OUTLINED_FUNCTION_19_5();
LABEL_6:
  (*(void (**)(uint64_t, char *))(*(_QWORD *)(v11 - 8) + 32))(a1, v5);
  type metadata accessor for TextRun.Value(0);
  swift_storeEnumTagMultiPayload();
  return sub_23A4A8054((uint64_t)v7);
}

uint64_t TextRun.TextConfiguration.init(proto:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return sub_23A48926C(a1, (void (*)(_QWORD))MEMORY[0x24BE6FDC0], a2);
}

uint64_t TextRun.SymbolConfiguration.init(proto:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return sub_23A48926C(a1, (void (*)(_QWORD))MEMORY[0x24BE6FE20], a2);
}

uint64_t TextRun.hash(into:)()
{
  OUTLINED_FUNCTION_18_7();
  sub_23A489544(&qword_256981B88, (uint64_t (*)(uint64_t))MEMORY[0x24BE6FCF0], MEMORY[0x24BE6FD00]);
  return sub_23A4AA780();
}

uint64_t TextRun.hashValue.getter()
{
  sub_23A4AAAC8();
  OUTLINED_FUNCTION_18_7();
  sub_23A489544(&qword_256981B88, (uint64_t (*)(uint64_t))MEMORY[0x24BE6FCF0], MEMORY[0x24BE6FD00]);
  sub_23A4AA780();
  return sub_23A4AAAE0();
}

void sub_23A4A77F4(uint64_t a1@<X8>)
{
  sub_23A4A6704(type metadata accessor for TextRun, (uint64_t (*)(uint64_t))MEMORY[0x24BE6FCF0], &qword_256981B78, MEMORY[0x24BE6FCD0], a1);
}

void sub_23A4A7828(_QWORD *a1)
{
  sub_23A4A6934(a1, (uint64_t (*)(uint64_t))MEMORY[0x24BE6FCF0], &qword_256981B78, MEMORY[0x24BE6FCD0]);
}

uint64_t sub_23A4A785C()
{
  sub_23A4AAAC8();
  sub_23A4AA000();
  sub_23A489544(&qword_256981B88, (uint64_t (*)(uint64_t))MEMORY[0x24BE6FCF0], MEMORY[0x24BE6FD00]);
  sub_23A4AA780();
  return sub_23A4AAAE0();
}

uint64_t TextRun.TextConfiguration.proto.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_23A4894D8((void (*)(_QWORD))MEMORY[0x24BE6FDC0], a1);
}

void sub_23A4A78E0(uint64_t a1@<X8>)
{
  sub_23A4A6704(type metadata accessor for TextRun.TextConfiguration, (uint64_t (*)(uint64_t))MEMORY[0x24BE6FDC0], &qword_256981BD0, MEMORY[0x24BE6FDA8], a1);
}

void sub_23A4A7914(_QWORD *a1)
{
  sub_23A4A6934(a1, (uint64_t (*)(uint64_t))MEMORY[0x24BE6FDC0], &qword_256981BD0, MEMORY[0x24BE6FDA8]);
}

uint64_t TextRun.SymbolConfiguration.proto.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_23A4894D8((void (*)(_QWORD))MEMORY[0x24BE6FE20], a1);
}

void sub_23A4A795C(uint64_t a1@<X8>)
{
  sub_23A4A6704(type metadata accessor for TextRun.SymbolConfiguration, (uint64_t (*)(uint64_t))MEMORY[0x24BE6FE20], &qword_256981C10, MEMORY[0x24BE6FE08], a1);
}

void sub_23A4A7990(_QWORD *a1)
{
  sub_23A4A6934(a1, (uint64_t (*)(uint64_t))MEMORY[0x24BE6FE20], &qword_256981C10, MEMORY[0x24BE6FE08]);
}

uint64_t sub_23A4A79BC(unint64_t a1, uint64_t a2, unint64_t a3, void (*a4)(_QWORD))
{
  uint64_t result;

  if (a2 < 0)
  {
    OUTLINED_FUNCTION_27_1();
    result = OUTLINED_FUNCTION_5_12();
    __break(1u);
  }
  else if (a3 < a1
         || (result = ((uint64_t (*)(_QWORD))a4)(0),
             a1 + *(_QWORD *)(*(_QWORD *)(result - 8) + 72) * a2 <= a3))
  {
    a4(0);
    OUTLINED_FUNCTION_43_2();
    return swift_arrayInitWithTakeFrontToBack();
  }
  else if (a3 != a1)
  {
    OUTLINED_FUNCTION_43_2();
    return swift_arrayInitWithTakeBackToFront();
  }
  return result;
}

uint64_t sub_23A4A7A84(unint64_t a1, uint64_t a2, unint64_t a3)
{
  return sub_23A4A79BC(a1, a2, a3, (void (*)(_QWORD))type metadata accessor for AttributionItem);
}

char *sub_23A4A7A90(char *result, uint64_t a2, char *a3)
{
  if (a2 < 0)
  {
    OUTLINED_FUNCTION_27_1();
    result = (char *)OUTLINED_FUNCTION_5_12();
    __break(1u);
  }
  else if (a3 != result || &result[40 * a2] <= a3)
  {
    return (char *)OUTLINED_FUNCTION_13_6(a3, result);
  }
  return result;
}

char *sub_23A4A7AF0(char *__src, uint64_t a2, char *__dst)
{
  if (a2 < 0)
  {
    __src = (char *)sub_23A4AA9E4();
    __break(1u);
  }
  else if (__dst != __src || &__src[16 * a2] <= __dst)
  {
    return (char *)memmove(__dst, __src, 16 * a2);
  }
  return __src;
}

char *sub_23A4A7B74(char *result, uint64_t a2, char *a3)
{
  if (a2 < 0)
  {
    OUTLINED_FUNCTION_27_1();
    result = (char *)OUTLINED_FUNCTION_5_12();
    __break(1u);
  }
  else if (a3 != result || &result[8 * a2] <= a3)
  {
    return (char *)OUTLINED_FUNCTION_13_6(a3, result);
  }
  return result;
}

uint64_t sub_23A4A7BCC(unint64_t a1, uint64_t a2, unint64_t a3)
{
  return sub_23A4A79BC(a1, a2, a3, (void (*)(_QWORD))MEMORY[0x24BE6FF68]);
}

char *sub_23A4A7BD8(char *__src, uint64_t a2, char *__dst)
{
  if (a2 < 0)
  {
    __src = (char *)sub_23A4AA9E4();
    __break(1u);
  }
  else if (__dst != __src || &__src[8 * a2] <= __dst)
  {
    return (char *)memmove(__dst, __src, 8 * a2);
  }
  return __src;
}

uint64_t sub_23A4A7C5C(unint64_t a1, uint64_t a2, unint64_t a3, uint64_t (*a4)(_QWORD))
{
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  BOOL v9;
  BOOL v10;
  uint64_t result;

  if (a2 < 0
    || ((v6 = *(_QWORD *)(*(_QWORD *)(a4(0) - 8) + 72) * a2, v7 = a3 + v6, v8 = a1 + v6, v7 > a1)
      ? (v9 = v8 >= a3, v10 = v8 == a3)
      : (v9 = 0, v10 = 0),
        !v10 && v9))
  {
    OUTLINED_FUNCTION_27_1();
    result = OUTLINED_FUNCTION_6_10();
    __break(1u);
  }
  else
  {
    OUTLINED_FUNCTION_44_3();
    return OUTLINED_FUNCTION_15_3();
  }
  return result;
}

uint64_t sub_23A4A7D18(unint64_t a1, uint64_t a2, unint64_t a3)
{
  uint64_t result;

  if ((a2 & 0x8000000000000000) == 0 && (a3 + 16 * a2 <= a1 || a1 + 16 * a2 <= a3))
    return swift_arrayInitWithCopy();
  result = sub_23A4AA9E4();
  __break(1u);
  return result;
}

uint64_t sub_23A4A7DE4(unint64_t a1, uint64_t a2, unint64_t a3, uint64_t *a4)
{
  unint64_t v4;
  BOOL v5;
  BOOL v6;
  uint64_t result;

  if (a2 < 0 || ((v4 = a1 + 8 * a2, a3 + 8 * a2 > a1) ? (v5 = v4 >= a3, v6 = v4 == a3) : (v5 = 0, v6 = 0), !v6 && v5))
  {
    OUTLINED_FUNCTION_27_1();
    result = OUTLINED_FUNCTION_6_10();
    __break(1u);
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(a4);
    OUTLINED_FUNCTION_44_3();
    return OUTLINED_FUNCTION_15_3();
  }
  return result;
}

void *sub_23A4A7E94(char *__src, uint64_t a2, char *__dst)
{
  void *result;

  if ((a2 & 0x8000000000000000) == 0 && (&__dst[8 * a2] <= __src || &__src[8 * a2] <= __dst))
    return memcpy(__dst, __src, 8 * a2);
  result = (void *)sub_23A4AA9E4();
  __break(1u);
  return result;
}

char *sub_23A4A7F5C(char *a1, int64_t a2, char a3)
{
  uint64_t *v3;
  char *result;

  result = sub_23A4A892C(a1, a2, a3, *v3, &qword_256980470, &qword_256980278);
  *v3 = (uint64_t)result;
  return result;
}

size_t sub_23A4A7F88(size_t a1, int64_t a2, char a3)
{
  uint64_t *v3;
  size_t result;

  result = sub_23A4A8B0C(a1, a2, a3, *v3, &qword_256981EC0, (void (*)(_QWORD))type metadata accessor for Action);
  *v3 = result;
  return result;
}

size_t sub_23A4A7FB4(size_t a1, int64_t a2, char a3)
{
  uint64_t *v3;
  size_t result;

  result = sub_23A4A8B0C(a1, a2, a3, *v3, &qword_256981ED0, (void (*)(_QWORD))type metadata accessor for TextRun);
  *v3 = result;
  return result;
}

uint64_t sub_23A4A7FE0()
{
  return sub_23A4A747C();
}

uint64_t sub_23A4A7FF8(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_256981B80);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t type metadata accessor for TextRun.Value(uint64_t a1)
{
  return sub_23A47F74C(a1, qword_256981D50);
}

uint64_t sub_23A4A8054(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_256981B80);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

void sub_23A4A8094()
{
  sub_23A489544(&qword_256981B78, (uint64_t (*)(uint64_t))MEMORY[0x24BE6FCF0], MEMORY[0x24BE6FCD0]);
}

void sub_23A4A80C0()
{
  sub_23A489544(&qword_256981BC8, type metadata accessor for TextRun, (uint64_t)&protocol conformance descriptor for TextRun);
}

void sub_23A4A80EC()
{
  sub_23A489544(&qword_256981BD0, (uint64_t (*)(uint64_t))MEMORY[0x24BE6FDC0], MEMORY[0x24BE6FDA8]);
}

void sub_23A4A8118()
{
  sub_23A489544(&qword_256981C10, (uint64_t (*)(uint64_t))MEMORY[0x24BE6FE20], MEMORY[0x24BE6FE08]);
}

uint64_t initializeBufferWithCopyOfBuffer for TextRun(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_23A489BF4(a1, a2, a3, (uint64_t (*)(_QWORD))MEMORY[0x24BE6FCF0]);
}

uint64_t destroy for TextRun()
{
  return sub_23A4A86D4();
}

void initializeWithCopy for TextRun(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_23A489C68(a1, a2, a3, (uint64_t (*)(_QWORD))MEMORY[0x24BE6FCF0]);
}

void assignWithCopy for TextRun(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_23A489C9C(a1, a2, a3, (uint64_t (*)(_QWORD))MEMORY[0x24BE6FCF0]);
}

void initializeWithTake for TextRun(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_23A4A8728(a1, a2, a3, (uint64_t (*)(_QWORD))MEMORY[0x24BE6FCF0]);
}

void assignWithTake for TextRun(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_23A489D04(a1, a2, a3, (uint64_t (*)(_QWORD))MEMORY[0x24BE6FCF0]);
}

uint64_t getEnumTagSinglePayload for TextRun()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_23A4A8198()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  OUTLINED_FUNCTION_18_7();
  v0 = OUTLINED_FUNCTION_9_6();
  return OUTLINED_FUNCTION_1_7(v0, v1, v2);
}

uint64_t storeEnumTagSinglePayload for TextRun()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_23A4A81C8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  OUTLINED_FUNCTION_18_7();
  v0 = OUTLINED_FUNCTION_6_6();
  return OUTLINED_FUNCTION_2_8(v0, v1, v2, v3);
}

uint64_t sub_23A4A81EC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_23A489D9C(a1, a2, a3, (uint64_t (*)(uint64_t))MEMORY[0x24BE6FCF0]);
}

uint64_t *initializeBufferWithCopyOfBuffer for TextRun.Value(uint64_t *a1, uint64_t *a2, uint64_t a3)
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
    if (swift_getEnumCaseMultiPayload() == 1)
      v6 = sub_23A4AA120();
    else
      v6 = sub_23A4AA0A8();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(a1, a2, v6);
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

uint64_t destroy for TextRun.Value(uint64_t a1)
{
  uint64_t v2;

  if (swift_getEnumCaseMultiPayload() == 1)
    v2 = sub_23A4AA120();
  else
    v2 = sub_23A4AA0A8();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
}

uint64_t initializeWithCopy for TextRun.Value(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  if (swift_getEnumCaseMultiPayload() == 1)
    v4 = sub_23A4AA120();
  else
    v4 = sub_23A4AA0A8();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a1, a2);
  swift_storeEnumTagMultiPayload();
  return a1;
}

uint64_t assignWithCopy for TextRun.Value(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  if (a1 != a2)
  {
    sub_23A4A8824();
    if (swift_getEnumCaseMultiPayload() == 1)
      v4 = sub_23A4AA120();
    else
      v4 = sub_23A4AA0A8();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a1, a2);
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

uint64_t initializeWithTake for TextRun.Value(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  if (swift_getEnumCaseMultiPayload() == 1)
    v4 = sub_23A4AA120();
  else
    v4 = sub_23A4AA0A8();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a1, a2);
  swift_storeEnumTagMultiPayload();
  return a1;
}

uint64_t assignWithTake for TextRun.Value(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  if (a1 != a2)
  {
    sub_23A4A8824();
    if (swift_getEnumCaseMultiPayload() == 1)
      v4 = sub_23A4AA120();
    else
      v4 = sub_23A4AA0A8();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a1, a2);
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

uint64_t sub_23A4A8574()
{
  uint64_t result;
  unint64_t v1;
  unint64_t v2;

  result = sub_23A4AA0A8();
  if (v1 <= 0x3F)
  {
    result = sub_23A4AA120();
    if (v2 <= 0x3F)
    {
      swift_initEnumMetadataMultiPayload();
      return 0;
    }
  }
  return result;
}

uint64_t initializeBufferWithCopyOfBuffer for TextRun.TextConfiguration(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_23A489BF4(a1, a2, a3, (uint64_t (*)(_QWORD))MEMORY[0x24BE6FDC0]);
}

uint64_t destroy for TextRun.TextConfiguration()
{
  return sub_23A4A86D4();
}

void initializeWithCopy for TextRun.TextConfiguration(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_23A489C68(a1, a2, a3, (uint64_t (*)(_QWORD))MEMORY[0x24BE6FDC0]);
}

void assignWithCopy for TextRun.TextConfiguration(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_23A489C9C(a1, a2, a3, (uint64_t (*)(_QWORD))MEMORY[0x24BE6FDC0]);
}

void initializeWithTake for TextRun.TextConfiguration(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_23A4A8728(a1, a2, a3, (uint64_t (*)(_QWORD))MEMORY[0x24BE6FDC0]);
}

void assignWithTake for TextRun.TextConfiguration(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_23A489D04(a1, a2, a3, (uint64_t (*)(_QWORD))MEMORY[0x24BE6FDC0]);
}

uint64_t getEnumTagSinglePayload for TextRun.TextConfiguration()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_23A4A8648()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  OUTLINED_FUNCTION_19_5();
  v0 = OUTLINED_FUNCTION_9_6();
  return OUTLINED_FUNCTION_1_7(v0, v1, v2);
}

uint64_t storeEnumTagSinglePayload for TextRun.TextConfiguration()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_23A4A8678()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  OUTLINED_FUNCTION_19_5();
  v0 = OUTLINED_FUNCTION_6_6();
  return OUTLINED_FUNCTION_2_8(v0, v1, v2, v3);
}

uint64_t type metadata accessor for TextRun.TextConfiguration(uint64_t a1)
{
  return sub_23A47F74C(a1, qword_256981DE0);
}

uint64_t sub_23A4A86B0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_23A489D9C(a1, a2, a3, (uint64_t (*)(uint64_t))MEMORY[0x24BE6FDC0]);
}

uint64_t initializeBufferWithCopyOfBuffer for TextRun.SymbolConfiguration(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_23A489BF4(a1, a2, a3, (uint64_t (*)(_QWORD))MEMORY[0x24BE6FE20]);
}

uint64_t destroy for TextRun.SymbolConfiguration()
{
  return sub_23A4A86D4();
}

uint64_t sub_23A4A86D4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t (*v2)(uint64_t);
  uint64_t v3;

  v1 = OUTLINED_FUNCTION_31_3();
  v3 = v2(v1);
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(v0, v3);
}

void initializeWithCopy for TextRun.SymbolConfiguration(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_23A489C68(a1, a2, a3, (uint64_t (*)(_QWORD))MEMORY[0x24BE6FE20]);
}

void assignWithCopy for TextRun.SymbolConfiguration(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_23A489C9C(a1, a2, a3, (uint64_t (*)(_QWORD))MEMORY[0x24BE6FE20]);
}

void initializeWithTake for TextRun.SymbolConfiguration(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_23A4A8728(a1, a2, a3, (uint64_t (*)(_QWORD))MEMORY[0x24BE6FE20]);
}

void sub_23A4A8728(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(_QWORD))
{
  uint64_t v4;

  v4 = OUTLINED_FUNCTION_0_10(a1, a2, a3, a4);
  OUTLINED_FUNCTION_4_6(*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32));
  OUTLINED_FUNCTION_60();
}

void assignWithTake for TextRun.SymbolConfiguration(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_23A489D04(a1, a2, a3, (uint64_t (*)(_QWORD))MEMORY[0x24BE6FE20]);
}

uint64_t getEnumTagSinglePayload for TextRun.SymbolConfiguration()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_23A4A876C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  OUTLINED_FUNCTION_17_4();
  v0 = OUTLINED_FUNCTION_9_6();
  return OUTLINED_FUNCTION_1_7(v0, v1, v2);
}

uint64_t storeEnumTagSinglePayload for TextRun.SymbolConfiguration()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_23A4A879C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  OUTLINED_FUNCTION_17_4();
  v0 = OUTLINED_FUNCTION_6_6();
  return OUTLINED_FUNCTION_2_8(v0, v1, v2, v3);
}

uint64_t type metadata accessor for TextRun.SymbolConfiguration(uint64_t a1)
{
  return sub_23A47F74C(a1, qword_256981E70);
}

uint64_t sub_23A4A87D4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_23A489D9C(a1, a2, a3, (uint64_t (*)(uint64_t))MEMORY[0x24BE6FE20]);
}

uint64_t sub_23A4A87E0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for TextRun(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

void sub_23A4A8824()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t (*v2)(uint64_t);
  uint64_t v3;

  v1 = OUTLINED_FUNCTION_31_3();
  v3 = v2(v1);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(v0, v3);
  OUTLINED_FUNCTION_60();
}

uint64_t sub_23A4A8858()
{
  return sub_23A4A754C();
}

char *sub_23A4A8870(char *a1, int64_t a2, char a3)
{
  uint64_t *v3;
  char *result;

  result = sub_23A4A892C(a1, a2, a3, *v3, &qword_256981EB8, &qword_256980090);
  *v3 = (uint64_t)result;
  return result;
}

size_t sub_23A4A889C(size_t a1, int64_t a2, char a3)
{
  uint64_t *v3;
  size_t result;

  result = sub_23A4A8B0C(a1, a2, a3, *v3, &qword_256981EA8, (void (*)(_QWORD))MEMORY[0x24BE929C8]);
  *v3 = result;
  return result;
}

char *sub_23A4A88C8(char *a1, int64_t a2, char a3)
{
  uint64_t *v3;
  char *result;

  result = sub_23A4A8A18(a1, a2, a3, *v3);
  *v3 = (uint64_t)result;
  return result;
}

char *sub_23A4A88E4(char *a1, int64_t a2, char a3)
{
  uint64_t *v3;
  char *result;

  result = sub_23A4A892C(a1, a2, a3, *v3, &qword_256981ED8, &qword_256980640);
  *v3 = (uint64_t)result;
  return result;
}

char *sub_23A4A8910(char *a1, int64_t a2, char a3)
{
  uint64_t *v3;
  char *result;

  result = sub_23A4A8C4C(a1, a2, a3, *v3);
  *v3 = (uint64_t)result;
  return result;
}

char *sub_23A4A892C(char *result, int64_t a2, char a3, uint64_t a4, uint64_t *a5, uint64_t *a6)
{
  char v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  size_t v14;
  char *v15;
  char *v16;

  v8 = (char)result;
  if ((a3 & 1) != 0)
  {
    v9 = *(_QWORD *)(a4 + 24);
    v10 = v9 >> 1;
    if ((uint64_t)(v9 >> 1) < a2)
    {
      if (v10 + 0x4000000000000000 < 0)
      {
        __break(1u);
        return result;
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
  if (v12)
  {
    __swift_instantiateConcreteTypeFromMangledName(a5);
    v13 = (char *)swift_allocObject();
    v14 = _swift_stdlib_malloc_size(v13);
    *((_QWORD *)v13 + 2) = v11;
    *((_QWORD *)v13 + 3) = 2 * ((uint64_t)(v14 - 32) / 8);
  }
  else
  {
    v13 = (char *)MEMORY[0x24BEE4AF8];
  }
  v15 = v13 + 32;
  v16 = (char *)(a4 + 32);
  if ((v8 & 1) != 0)
  {
    sub_23A4A7B74(v16, v11, v15);
    *(_QWORD *)(a4 + 16) = 0;
  }
  else
  {
    sub_23A4A7DE4((unint64_t)v16, v11, (unint64_t)v15, a6);
  }
  swift_release();
  return v13;
}

char *sub_23A4A8A18(char *result, int64_t a2, char a3, uint64_t a4)
{
  char v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  size_t v11;
  char *v12;
  char *v13;

  v5 = (char)result;
  if ((a3 & 1) != 0)
  {
    v6 = *(_QWORD *)(a4 + 24);
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
  v8 = *(_QWORD *)(a4 + 16);
  if (v7 <= v8)
    v9 = *(_QWORD *)(a4 + 16);
  else
    v9 = v7;
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_2569819B8);
    v10 = (char *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    *((_QWORD *)v10 + 2) = v8;
    *((_QWORD *)v10 + 3) = 2 * ((uint64_t)(v11 - 32) / 16);
  }
  else
  {
    v10 = (char *)MEMORY[0x24BEE4AF8];
  }
  v12 = v10 + 32;
  v13 = (char *)(a4 + 32);
  if ((v5 & 1) != 0)
  {
    sub_23A4A7AF0(v13, v8, v12);
    *(_QWORD *)(a4 + 16) = 0;
  }
  else
  {
    sub_23A4A7D18((unint64_t)v13, v8, (unint64_t)v12);
  }
  swift_release();
  return v10;
}

size_t sub_23A4A8AF8(size_t a1, int64_t a2, char a3, uint64_t a4)
{
  return sub_23A4A8B0C(a1, a2, a3, a4, &qword_256981EC8, (void (*)(_QWORD))MEMORY[0x24BE6FF68]);
}

size_t sub_23A4A8B0C(size_t result, int64_t a2, char a3, uint64_t a4, uint64_t *a5, void (*a6)(_QWORD))
{
  char v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  _QWORD *v16;
  uint64_t v18;
  unint64_t v19;
  unint64_t v20;

  v8 = result;
  if ((a3 & 1) != 0)
  {
    v9 = *(_QWORD *)(a4 + 24);
    v10 = v9 >> 1;
    if ((uint64_t)(v9 >> 1) < a2)
    {
      if (v10 + 0x4000000000000000 < 0)
      {
LABEL_25:
        __break(1u);
        return result;
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
  v13 = *(_QWORD *)(((uint64_t (*)(_QWORD))a6)(0) - 8);
  v14 = *(_QWORD *)(v13 + 72);
  v15 = (*(unsigned __int8 *)(v13 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v13 + 80);
  v16 = (_QWORD *)swift_allocObject();
  result = _swift_stdlib_malloc_size(v16);
  if (!v14)
  {
    __break(1u);
LABEL_24:
    __break(1u);
    goto LABEL_25;
  }
  if (result - v15 == 0x8000000000000000 && v14 == -1)
    goto LABEL_24;
  v16[2] = v11;
  v16[3] = 2 * ((uint64_t)(result - v15) / v14);
LABEL_19:
  a6(0);
  OUTLINED_FUNCTION_33_3();
  v19 = (unint64_t)v16 + v18;
  v20 = a4 + v18;
  if ((v8 & 1) != 0)
  {
    sub_23A4A79BC(v20, v11, v19, a6);
    *(_QWORD *)(a4 + 16) = 0;
  }
  else
  {
    sub_23A4A7C5C(v20, v11, v19, (uint64_t (*)(_QWORD))a6);
  }
  swift_release();
  return (size_t)v16;
}

char *sub_23A4A8C4C(char *result, int64_t a2, char a3, uint64_t a4)
{
  char v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  size_t v11;
  char *v12;
  char *v13;

  v5 = (char)result;
  if ((a3 & 1) != 0)
  {
    v6 = *(_QWORD *)(a4 + 24);
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
  v8 = *(_QWORD *)(a4 + 16);
  if (v7 <= v8)
    v9 = *(_QWORD *)(a4 + 16);
  else
    v9 = v7;
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_256981EB0);
    v10 = (char *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    *((_QWORD *)v10 + 2) = v8;
    *((_QWORD *)v10 + 3) = 2 * ((uint64_t)(v11 - 32) / 8);
  }
  else
  {
    v10 = (char *)MEMORY[0x24BEE4AF8];
  }
  v12 = v10 + 32;
  v13 = (char *)(a4 + 32);
  if ((v5 & 1) != 0)
  {
    sub_23A4A7BD8(v13, v8, v12);
    *(_QWORD *)(a4 + 16) = 0;
  }
  else
  {
    sub_23A4A7E94(v13, v8, v12);
  }
  swift_release();
  return v10;
}

uint64_t OUTLINED_FUNCTION_0_21()
{
  return sub_23A4AA9CC();
}

uint64_t OUTLINED_FUNCTION_5_12()
{
  return sub_23A4AA9E4();
}

uint64_t OUTLINED_FUNCTION_6_10()
{
  return sub_23A4AA9E4();
}

void *OUTLINED_FUNCTION_13_6@<X0>(void *__dst@<X2>, const void *a2@<X8>)
{
  size_t v2;

  return memmove(__dst, a2, v2);
}

uint64_t OUTLINED_FUNCTION_14_9()
{
  return type metadata accessor for TextRun(0);
}

uint64_t OUTLINED_FUNCTION_15_3()
{
  return swift_arrayInitWithCopy();
}

uint64_t OUTLINED_FUNCTION_17_4()
{
  return sub_23A4AA120();
}

uint64_t OUTLINED_FUNCTION_18_7()
{
  return sub_23A4AA000();
}

uint64_t OUTLINED_FUNCTION_19_5()
{
  return sub_23A4AA0A8();
}

uint64_t OUTLINED_FUNCTION_22_4@<X0>(uint64_t a1@<X0>, uint64_t (*a2)(uint64_t, uint64_t)@<X8>)
{
  uint64_t v2;

  return a2(a1, v2);
}

uint64_t OUTLINED_FUNCTION_24_5@<X0>(uint64_t (*a1)(uint64_t, uint64_t)@<X8>)
{
  uint64_t v1;
  uint64_t v2;

  return a1(v1, v2);
}

uint64_t OUTLINED_FUNCTION_25_4@<X0>(uint64_t (*a1)(uint64_t, uint64_t)@<X8>)
{
  uint64_t v1;
  uint64_t v2;

  return a1(v1, v2);
}

uint64_t OUTLINED_FUNCTION_28_5()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v2 - 96) = v1;
  *(_QWORD *)(v2 - 88) = v0;
  return swift_bridgeObjectRetain();
}

uint64_t OUTLINED_FUNCTION_30_3(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;

  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(a3 - 8) + 32))(v4, v3);
}

uint64_t OUTLINED_FUNCTION_31_3()
{
  return 0;
}

uint64_t OUTLINED_FUNCTION_32_2()
{
  return sub_23A4AA804();
}

uint64_t OUTLINED_FUNCTION_37_4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 8))(v1, v0);
}

uint64_t OUTLINED_FUNCTION_38_2()
{
  return sub_23A4A9FD0();
}

uint64_t OUTLINED_FUNCTION_41_2()
{
  uint64_t v0;
  uint64_t v1;

  return sub_23A4A7FF8(v1, v0);
}

uint64_t OUTLINED_FUNCTION_42_2()
{
  return swift_getEnumCaseMultiPayload();
}

uint64_t OUTLINED_FUNCTION_43_2()
{
  uint64_t v0;

  return v0;
}

uint64_t OUTLINED_FUNCTION_44_3()
{
  uint64_t v0;

  return v0;
}

void OUTLINED_FUNCTION_45_3()
{
  __break(1u);
}

uint64_t OUTLINED_FUNCTION_46_2()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_47_1()
{
  return swift_bridgeObjectRelease_n();
}

uint64_t AttributeDynamicLookup.subscript.getter()
{
  return sub_23A4A9E8C();
}

uint64_t AttributeScopes.DeviceExpertIntentAttributes.foundation.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;

  v3 = sub_23A4A9DB4();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 16))(a1, v1, v3);
}

uint64_t static AttributeScopes.DeviceExpertIntentAttributes.AttributionGroupKey.name.getter()
{
  uint64_t v0;

  OUTLINED_FUNCTION_1_16();
  v0 = qword_256981EE0;
  swift_bridgeObjectRetain();
  return v0;
}

uint64_t static AttributeScopes.DeviceExpertIntentAttributes.AttributionGroupKey.name.setter(uint64_t a1, uint64_t a2)
{
  OUTLINED_FUNCTION_1_16();
  qword_256981EE0 = a1;
  qword_256981EE8 = a2;
  return swift_bridgeObjectRelease();
}

uint64_t (*static AttributeScopes.DeviceExpertIntentAttributes.AttributionGroupKey.name.modify())()
{
  OUTLINED_FUNCTION_1_16();
  return j__swift_endAccess;
}

uint64_t sub_23A4A9050()
{
  sub_23A4A9560();
  return sub_23A4A9EF8();
}

uint64_t sub_23A4A90AC()
{
  sub_23A4A9524();
  return sub_23A4A9F04();
}

unint64_t sub_23A4A910C()
{
  unint64_t result;

  result = qword_256981EF0;
  if (!qword_256981EF0)
  {
    result = MEMORY[0x23B84E2B0](&protocol conformance descriptor for AttributionGroup, &type metadata for AttributionGroup);
    atomic_store(result, (unint64_t *)&qword_256981EF0);
  }
  return result;
}

uint64_t sub_23A4A9158()
{
  return sub_23A4A94E4(&qword_2569808C8, (uint64_t)&protocol conformance descriptor for AttributeScopes.DeviceExpertIntentAttributes);
}

uint64_t type metadata accessor for AttributeScopes.DeviceExpertIntentAttributes()
{
  uint64_t result;

  result = qword_256981F50;
  if (!qword_256981F50)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_23A4A91B4()
{
  return sub_23A4A94E4(qword_2569808D0, (uint64_t)&protocol conformance descriptor for AttributeScopes.DeviceExpertIntentAttributes);
}

void sub_23A4A91E0()
{
  sub_23A4A94E4(&qword_2569807F0, (uint64_t)&protocol conformance descriptor for AttributeScopes.DeviceExpertIntentAttributes);
  JUMPOUT(0x23B84D200);
}

void sub_23A4A9228()
{
  sub_23A4A94E4(&qword_2569807F0, (uint64_t)&protocol conformance descriptor for AttributeScopes.DeviceExpertIntentAttributes);
  JUMPOUT(0x23B84D20CLL);
}

uint64_t _s28DeviceExpertIntentAttributesVwCP(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_23A4A9DB4();
  return (**(uint64_t (***)(uint64_t, uint64_t, uint64_t))(v4 - 8))(a1, a2, v4);
}

uint64_t _s28DeviceExpertIntentAttributesVwxx(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_23A4A9DB4();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
}

uint64_t _s28DeviceExpertIntentAttributesVwcp(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_23A4A9DB4();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a1, a2, v4);
  return a1;
}

uint64_t _s28DeviceExpertIntentAttributesVwca(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_23A4A9DB4();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 24))(a1, a2, v4);
  return a1;
}

uint64_t _s28DeviceExpertIntentAttributesVwtk(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_23A4A9DB4();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a1, a2, v4);
  return a1;
}

uint64_t _s28DeviceExpertIntentAttributesVwta(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_23A4A9DB4();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 40))(a1, a2, v4);
  return a1;
}

uint64_t _s28DeviceExpertIntentAttributesVwet()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_23A4A93FC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v2 = OUTLINED_FUNCTION_0_22();
  return __swift_getEnumTagSinglePayload(v1, v0, v2);
}

uint64_t _s28DeviceExpertIntentAttributesVwst()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_23A4A9430()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v2 = OUTLINED_FUNCTION_0_22();
  return __swift_storeEnumTagSinglePayload(v1, v0, v0, v2);
}

uint64_t sub_23A4A945C()
{
  uint64_t result;
  unint64_t v1;

  result = sub_23A4A9DB4();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

ValueMetadata *type metadata accessor for AttributeScopes.DeviceExpertIntentAttributes.AttributionGroupKey()
{
  return &type metadata for AttributeScopes.DeviceExpertIntentAttributes.AttributionGroupKey;
}

uint64_t sub_23A4A94E4(unint64_t *a1, uint64_t a2)
{
  uint64_t result;
  uint64_t v5;

  result = *a1;
  if (!result)
  {
    v5 = type metadata accessor for AttributeScopes.DeviceExpertIntentAttributes();
    result = MEMORY[0x23B84E2B0](a2, v5);
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_23A4A9524()
{
  unint64_t result;

  result = qword_256981F88;
  if (!qword_256981F88)
  {
    result = MEMORY[0x23B84E2B0](&protocol conformance descriptor for AttributionGroup, &type metadata for AttributionGroup);
    atomic_store(result, (unint64_t *)&qword_256981F88);
  }
  return result;
}

unint64_t sub_23A4A9560()
{
  unint64_t result;

  result = qword_256981F90;
  if (!qword_256981F90)
  {
    result = MEMORY[0x23B84E2B0](&protocol conformance descriptor for AttributionGroup, &type metadata for AttributionGroup);
    atomic_store(result, (unint64_t *)&qword_256981F90);
  }
  return result;
}

uint64_t OUTLINED_FUNCTION_0_22()
{
  return sub_23A4A9DB4();
}

uint64_t OUTLINED_FUNCTION_1_16()
{
  return swift_beginAccess();
}

DeviceExpertIntents::FlowContext __swiftcall FlowContext.init(sessionId:clusterId:)(Swift::String sessionId, Swift::String clusterId)
{
  Swift::String *v2;
  DeviceExpertIntents::FlowContext result;

  *v2 = sessionId;
  v2[1] = clusterId;
  result.clusterId = clusterId;
  result.sessionId = sessionId;
  return result;
}

void sub_23A4A95C0()
{
  qword_256981F98 = 0x6E776F6E6B6E75;
  unk_256981FA0 = 0xE700000000000000;
  qword_256981FA8 = 0x6E776F6E6B6E75;
  unk_256981FB0 = 0xE700000000000000;
}

uint64_t static FlowContext.unknown.getter@<X0>(_QWORD *a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  if (qword_25697FF68 != -1)
    swift_once();
  v2 = unk_256981FA0;
  v3 = qword_256981FA8;
  v4 = unk_256981FB0;
  *a1 = qword_256981F98;
  a1[1] = v2;
  a1[2] = v3;
  a1[3] = v4;
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRetain();
}

uint64_t FlowContext.sessionId.getter()
{
  uint64_t *v0;
  uint64_t v1;

  v1 = *v0;
  OUTLINED_FUNCTION_7();
  return v1;
}

void FlowContext.sessionId.setter(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;

  swift_bridgeObjectRelease();
  *v2 = a1;
  v2[1] = a2;
  OUTLINED_FUNCTION_5();
}

uint64_t (*FlowContext.sessionId.modify())()
{
  return nullsub_1;
}

uint64_t FlowContext.clusterId.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 16);
  OUTLINED_FUNCTION_7();
  return v1;
}

void FlowContext.clusterId.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  swift_bridgeObjectRelease();
  *(_QWORD *)(v2 + 16) = a1;
  *(_QWORD *)(v2 + 24) = a2;
  OUTLINED_FUNCTION_5();
}

uint64_t (*FlowContext.clusterId.modify())()
{
  return nullsub_1;
}

uint64_t sub_23A4A9714(uint64_t a1, uint64_t a2)
{
  BOOL v3;
  char v7;

  v3 = a1 == 0x496E6F6973736573 && a2 == 0xE900000000000064;
  if (v3 || (sub_23A4AAAB0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x4972657473756C63 && a2 == 0xE900000000000064)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    v7 = sub_23A4AAAB0();
    swift_bridgeObjectRelease();
    if ((v7 & 1) != 0)
      return 1;
    else
      return 2;
  }
}

uint64_t sub_23A4A9808(char a1)
{
  if ((a1 & 1) != 0)
    return 0x4972657473756C63;
  else
    return 0x496E6F6973736573;
}

uint64_t sub_23A4A983C()
{
  char *v0;

  return sub_23A4A9808(*v0);
}

uint64_t sub_23A4A9844@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_23A4A9714(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_23A4A9868()
{
  sub_23A4A99C0();
  return sub_23A4AAB04();
}

uint64_t sub_23A4A9890()
{
  sub_23A4A99C0();
  return sub_23A4AAB10();
}

void FlowContext.encode(to:)(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  _QWORD v8[3];
  uint64_t v9;
  char v10;
  char v11;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_256981FB8);
  v9 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)v8 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = *(_QWORD *)(v1 + 16);
  v8[1] = *(_QWORD *)(v1 + 24);
  v8[2] = v7;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_23A4A99C0();
  sub_23A4AAAF8();
  v11 = 0;
  OUTLINED_FUNCTION_3();
  if (!v2)
  {
    v10 = 1;
    OUTLINED_FUNCTION_3();
  }
  (*(void (**)(char *, uint64_t))(v9 + 8))(v6, v4);
  OUTLINED_FUNCTION_0();
}

unint64_t sub_23A4A99C0()
{
  unint64_t result;

  result = qword_256981FC0;
  if (!qword_256981FC0)
  {
    result = MEMORY[0x23B84E2B0](&unk_23A4AE9D4, &type metadata for FlowContext.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256981FC0);
  }
  return result;
}

void FlowContext.init(from:)(_QWORD *a1@<X0>, uint64_t *a2@<X8>)
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
  uint64_t (*v13)(uint64_t, uint64_t);
  uint64_t v14;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_256981FC8);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_23A4A99C0();
  sub_23A4AAAEC();
  if (v2)
  {
    OUTLINED_FUNCTION_6();
  }
  else
  {
    v7 = OUTLINED_FUNCTION_2();
    v9 = v8;
    swift_bridgeObjectRetain();
    v10 = OUTLINED_FUNCTION_2();
    v12 = v11;
    v13 = *(uint64_t (**)(uint64_t, uint64_t))(v6 + 8);
    v14 = v10;
    OUTLINED_FUNCTION_1(v13);
    *a2 = v7;
    a2[1] = v9;
    a2[2] = v14;
    a2[3] = v12;
    OUTLINED_FUNCTION_7();
    OUTLINED_FUNCTION_6();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  OUTLINED_FUNCTION_0();
}

void sub_23A4A9B48(_QWORD *a1@<X0>, uint64_t *a2@<X8>)
{
  FlowContext.init(from:)(a1, a2);
}

void sub_23A4A9B5C(_QWORD *a1)
{
  FlowContext.encode(to:)(a1);
}

ValueMetadata *type metadata accessor for FlowContext()
{
  return &type metadata for FlowContext;
}

uint64_t storeEnumTagSinglePayload for FlowContext.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_23A4A9BCC + 4 * byte_23A4AE885[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_23A4A9C00 + 4 * asc_23A4AE880[v4]))();
}

uint64_t sub_23A4A9C00(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_23A4A9C08(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x23A4A9C10);
  return result;
}

uint64_t sub_23A4A9C1C(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x23A4A9C24);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_23A4A9C28(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23A4A9C30(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for FlowContext.CodingKeys()
{
  return &type metadata for FlowContext.CodingKeys;
}

unint64_t sub_23A4A9C50()
{
  unint64_t result;

  result = qword_256981FD0;
  if (!qword_256981FD0)
  {
    result = MEMORY[0x23B84E2B0](&unk_23A4AE9AC, &type metadata for FlowContext.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256981FD0);
  }
  return result;
}

unint64_t sub_23A4A9C90()
{
  unint64_t result;

  result = qword_256981FD8;
  if (!qword_256981FD8)
  {
    result = MEMORY[0x23B84E2B0](&unk_23A4AE91C, &type metadata for FlowContext.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256981FD8);
  }
  return result;
}

unint64_t sub_23A4A9CD0()
{
  unint64_t result;

  result = qword_256981FE0;
  if (!qword_256981FE0)
  {
    result = MEMORY[0x23B84E2B0](&unk_23A4AE944, &type metadata for FlowContext.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256981FE0);
  }
  return result;
}

uint64_t sub_23A4A9D0C()
{
  return MEMORY[0x24BDCB958]();
}

uint64_t sub_23A4A9D18()
{
  return MEMORY[0x24BDCB988]();
}

uint64_t sub_23A4A9D24()
{
  return MEMORY[0x24BDCBA60]();
}

uint64_t sub_23A4A9D30()
{
  return MEMORY[0x24BDCBAC0]();
}

uint64_t sub_23A4A9D3C()
{
  return MEMORY[0x24BDCBAC8]();
}

uint64_t sub_23A4A9D48()
{
  return MEMORY[0x24BDCBAD0]();
}

uint64_t sub_23A4A9D54()
{
  return MEMORY[0x24BDCBB28]();
}

uint64_t sub_23A4A9D60()
{
  return MEMORY[0x24BDCBB30]();
}

uint64_t sub_23A4A9D6C()
{
  return MEMORY[0x24BDCBB48]();
}

uint64_t sub_23A4A9D78()
{
  return MEMORY[0x24BDCBB50]();
}

uint64_t sub_23A4A9D84()
{
  return MEMORY[0x24BDCBB68]();
}

uint64_t sub_23A4A9D90()
{
  return MEMORY[0x24BDCBB78]();
}

uint64_t sub_23A4A9D9C()
{
  return MEMORY[0x24BDCBC18]();
}

uint64_t sub_23A4A9DA8()
{
  return MEMORY[0x24BDCBC20]();
}

uint64_t sub_23A4A9DB4()
{
  return MEMORY[0x24BDCC1B8]();
}

uint64_t sub_23A4A9DC0()
{
  return MEMORY[0x24BDCC4A8]();
}

uint64_t sub_23A4A9DCC()
{
  return MEMORY[0x24BDCC4D0]();
}

uint64_t sub_23A4A9DD8()
{
  return MEMORY[0x24BDCC4E0]();
}

uint64_t sub_23A4A9DE4()
{
  return MEMORY[0x24BDCC5A0]();
}

uint64_t sub_23A4A9DF0()
{
  return MEMORY[0x24BDCC5A8]();
}

uint64_t sub_23A4A9DFC()
{
  return MEMORY[0x24BDCC5D8]();
}

uint64_t sub_23A4A9E08()
{
  return MEMORY[0x24BDCC608]();
}

uint64_t sub_23A4A9E14()
{
  return MEMORY[0x24BDCC890]();
}

uint64_t sub_23A4A9E20()
{
  return MEMORY[0x24BDCC898]();
}

uint64_t sub_23A4A9E2C()
{
  return MEMORY[0x24BDCC948]();
}

uint64_t sub_23A4A9E38()
{
  return MEMORY[0x24BDCC950]();
}

uint64_t sub_23A4A9E44()
{
  return MEMORY[0x24BDCC958]();
}

uint64_t sub_23A4A9E50()
{
  return MEMORY[0x24BDCC978]();
}

uint64_t sub_23A4A9E5C()
{
  return MEMORY[0x24BDCCAD8]();
}

uint64_t sub_23A4A9E68()
{
  return MEMORY[0x24BDCCAE0]();
}

uint64_t sub_23A4A9E74()
{
  return MEMORY[0x24BDCCAE8]();
}

uint64_t sub_23A4A9E80()
{
  return MEMORY[0x24BDCCAF0]();
}

uint64_t sub_23A4A9E8C()
{
  return MEMORY[0x24BDCD2E0]();
}

uint64_t sub_23A4A9E98()
{
  return MEMORY[0x24BDCD2F8]();
}

uint64_t sub_23A4A9EA4()
{
  return MEMORY[0x24BDCD340]();
}

uint64_t sub_23A4A9EB0()
{
  return MEMORY[0x24BDCD358]();
}

uint64_t sub_23A4A9EBC()
{
  return MEMORY[0x24BDCD360]();
}

uint64_t sub_23A4A9EC8()
{
  return MEMORY[0x24BDCD368]();
}

uint64_t sub_23A4A9ED4()
{
  return MEMORY[0x24BDCD380]();
}

uint64_t sub_23A4A9EE0()
{
  return MEMORY[0x24BDCD3B0]();
}

uint64_t sub_23A4A9EEC()
{
  return MEMORY[0x24BDCD3F0]();
}

uint64_t sub_23A4A9EF8()
{
  return MEMORY[0x24BDCD5B0]();
}

uint64_t sub_23A4A9F04()
{
  return MEMORY[0x24BDCD5B8]();
}

uint64_t sub_23A4A9F10()
{
  return MEMORY[0x24BDCD820]();
}

uint64_t sub_23A4A9F1C()
{
  return MEMORY[0x24BDCD8D0]();
}

uint64_t sub_23A4A9F28()
{
  return MEMORY[0x24BDCD9C0]();
}

uint64_t sub_23A4A9F34()
{
  return MEMORY[0x24BDCDA68]();
}

uint64_t sub_23A4A9F40()
{
  return MEMORY[0x24BDCDAC0]();
}

uint64_t sub_23A4A9F4C()
{
  return MEMORY[0x24BDCDCA0]();
}

uint64_t sub_23A4A9F58()
{
  return MEMORY[0x24BDCDCE0]();
}

uint64_t sub_23A4A9F64()
{
  return MEMORY[0x24BDCE9B0]();
}

uint64_t sub_23A4A9F70()
{
  return MEMORY[0x24BDCEA40]();
}

uint64_t sub_23A4A9F7C()
{
  return MEMORY[0x24BDCEA58]();
}

uint64_t sub_23A4A9F88()
{
  return MEMORY[0x24BDCEB20]();
}

uint64_t sub_23A4A9F94()
{
  return MEMORY[0x24BDCED58]();
}

uint64_t sub_23A4A9FA0()
{
  return MEMORY[0x24BDCEEA8]();
}

uint64_t sub_23A4A9FAC()
{
  return MEMORY[0x24BE6FC98]();
}

uint64_t sub_23A4A9FB8()
{
  return MEMORY[0x24BE6FCA0]();
}

uint64_t sub_23A4A9FC4()
{
  return MEMORY[0x24BE6FCA8]();
}

uint64_t sub_23A4A9FD0()
{
  return MEMORY[0x24BE6FCC0]();
}

uint64_t _s19DeviceExpertIntents7TextRunV2eeoiySbAC_ACtFZ_0()
{
  return MEMORY[0x24BE6FCD8]();
}

uint64_t sub_23A4A9FE8()
{
  return MEMORY[0x24BE6FCE0]();
}

uint64_t sub_23A4A9FF4()
{
  return MEMORY[0x24BE6FCE8]();
}

uint64_t sub_23A4AA000()
{
  return MEMORY[0x24BE6FCF0]();
}

uint64_t sub_23A4AA00C()
{
  return MEMORY[0x24BE6FD18]();
}

uint64_t sub_23A4AA018()
{
  return MEMORY[0x24BE6FD28]();
}

uint64_t sub_23A4AA024()
{
  return MEMORY[0x24BE6FD30]();
}

uint64_t _s19DeviceExpertIntents6ActionV22AppIntentConfigurationV10parametersSaySSGSgvg_0()
{
  return MEMORY[0x24BE6FD38]();
}

uint64_t _s19DeviceExpertIntents6ActionV5labelSSvg_0()
{
  return MEMORY[0x24BE6FD48]();
}

uint64_t _s19DeviceExpertIntents6ActionV22AppIntentConfigurationV8bundleIDSSvg_0()
{
  return MEMORY[0x24BE6FD50]();
}

uint64_t sub_23A4AA054()
{
  return MEMORY[0x24BE6FD58]();
}

uint64_t sub_23A4AA060()
{
  return MEMORY[0x24BE6FD78]();
}

uint64_t sub_23A4AA06C()
{
  return MEMORY[0x24BE6FD88]();
}

uint64_t sub_23A4AA078()
{
  return MEMORY[0x24BE6FD98]();
}

uint64_t sub_23A4AA084()
{
  return MEMORY[0x24BE6FDA0]();
}

uint64_t sub_23A4AA090()
{
  return MEMORY[0x24BE6FDB0]();
}

uint64_t sub_23A4AA09C()
{
  return MEMORY[0x24BE6FDB8]();
}

uint64_t sub_23A4AA0A8()
{
  return MEMORY[0x24BE6FDC0]();
}

uint64_t sub_23A4AA0B4()
{
  return MEMORY[0x24BE6FDD0]();
}

uint64_t sub_23A4AA0C0()
{
  return MEMORY[0x24BE6FDD8]();
}

uint64_t sub_23A4AA0CC()
{
  return MEMORY[0x24BE6FDE0]();
}

uint64_t sub_23A4AA0D8()
{
  return MEMORY[0x24BE6FDE8]();
}

uint64_t sub_23A4AA0E4()
{
  return MEMORY[0x24BE6FDF0]();
}

uint64_t sub_23A4AA0F0()
{
  return MEMORY[0x24BE6FDF8]();
}

uint64_t sub_23A4AA0FC()
{
  return MEMORY[0x24BE6FE00]();
}

uint64_t sub_23A4AA108()
{
  return MEMORY[0x24BE6FE10]();
}

uint64_t sub_23A4AA114()
{
  return MEMORY[0x24BE6FE18]();
}

uint64_t sub_23A4AA120()
{
  return MEMORY[0x24BE6FE20]();
}

uint64_t sub_23A4AA12C()
{
  return MEMORY[0x24BE6FE30]();
}

uint64_t sub_23A4AA138()
{
  return MEMORY[0x24BE6FE38]();
}

uint64_t sub_23A4AA144()
{
  return MEMORY[0x24BE6FE40]();
}

uint64_t sub_23A4AA150()
{
  return MEMORY[0x24BE6FE48]();
}

uint64_t sub_23A4AA15C()
{
  return MEMORY[0x24BE6FE50]();
}

uint64_t sub_23A4AA168()
{
  return MEMORY[0x24BE6FE58]();
}

uint64_t sub_23A4AA174()
{
  return MEMORY[0x24BE6FE60]();
}

uint64_t sub_23A4AA180()
{
  return MEMORY[0x24BE6FE78]();
}

uint64_t _s19DeviceExpertIntents6ActionV2eeoiySbAC_ACtFZ_0()
{
  return MEMORY[0x24BE6FE90]();
}

uint64_t _s19DeviceExpertIntents6ActionV2idSSvg_0()
{
  return MEMORY[0x24BE6FE98]();
}

uint64_t sub_23A4AA1A4()
{
  return MEMORY[0x24BE6FEA0]();
}

uint64_t sub_23A4AA1B0()
{
  return MEMORY[0x24BE6FEA8]();
}

uint64_t sub_23A4AA1BC()
{
  return MEMORY[0x24BE6FEB0]();
}

uint64_t sub_23A4AA1C8()
{
  return MEMORY[0x24BE6FED0]();
}

uint64_t sub_23A4AA1D4()
{
  return MEMORY[0x24BE6FED8]();
}

uint64_t sub_23A4AA1E0()
{
  return MEMORY[0x24BE6FEE0]();
}

uint64_t sub_23A4AA1EC()
{
  return MEMORY[0x24BE6FEE8]();
}

uint64_t sub_23A4AA1F8()
{
  return MEMORY[0x24BE6FEF0]();
}

uint64_t sub_23A4AA204()
{
  return MEMORY[0x24BE6FEF8]();
}

uint64_t sub_23A4AA210()
{
  return MEMORY[0x24BE6FF00]();
}

uint64_t sub_23A4AA21C()
{
  return MEMORY[0x24BE6FF08]();
}

uint64_t sub_23A4AA228()
{
  return MEMORY[0x24BE6FF10]();
}

uint64_t sub_23A4AA234()
{
  return MEMORY[0x24BE6FF18]();
}

uint64_t sub_23A4AA240()
{
  return MEMORY[0x24BE6FF20]();
}

uint64_t sub_23A4AA24C()
{
  return MEMORY[0x24BE6FF30]();
}

uint64_t sub_23A4AA258()
{
  return MEMORY[0x24BE6FF38]();
}

uint64_t sub_23A4AA264()
{
  return MEMORY[0x24BE6FF50]();
}

uint64_t sub_23A4AA270()
{
  return MEMORY[0x24BE6FF60]();
}

uint64_t sub_23A4AA27C()
{
  return MEMORY[0x24BE6FF68]();
}

uint64_t sub_23A4AA288()
{
  return MEMORY[0x24BE6FF78]();
}

uint64_t sub_23A4AA294()
{
  return MEMORY[0x24BE6FF80]();
}

uint64_t sub_23A4AA2A0()
{
  return MEMORY[0x24BE71268]();
}

uint64_t sub_23A4AA2AC()
{
  return MEMORY[0x24BE71278]();
}

uint64_t sub_23A4AA2B8()
{
  return MEMORY[0x24BEAA5D8]();
}

uint64_t sub_23A4AA2C4()
{
  return MEMORY[0x24BEABA58]();
}

uint64_t sub_23A4AA2D0()
{
  return MEMORY[0x24BEABA60]();
}

uint64_t sub_23A4AA2DC()
{
  return MEMORY[0x24BEABA68]();
}

uint64_t sub_23A4AA2E8()
{
  return MEMORY[0x24BEABA70]();
}

uint64_t sub_23A4AA2F4()
{
  return MEMORY[0x24BEABA78]();
}

uint64_t sub_23A4AA300()
{
  return MEMORY[0x24BEAD240]();
}

uint64_t sub_23A4AA30C()
{
  return MEMORY[0x24BEAD248]();
}

uint64_t sub_23A4AA318()
{
  return MEMORY[0x24BEAD268]();
}

uint64_t sub_23A4AA324()
{
  return MEMORY[0x24BEAD290]();
}

uint64_t sub_23A4AA330()
{
  return MEMORY[0x24BEAD2B8]();
}

uint64_t sub_23A4AA33C()
{
  return MEMORY[0x24BEAD2C8]();
}

uint64_t sub_23A4AA348()
{
  return MEMORY[0x24BEAD2E8]();
}

uint64_t sub_23A4AA354()
{
  return MEMORY[0x24BEAD338]();
}

uint64_t sub_23A4AA360()
{
  return MEMORY[0x24BEAD340]();
}

uint64_t sub_23A4AA36C()
{
  return MEMORY[0x24BEAD348]();
}

uint64_t sub_23A4AA378()
{
  return MEMORY[0x24BEAD350]();
}

uint64_t sub_23A4AA384()
{
  return MEMORY[0x24BEAD360]();
}

uint64_t sub_23A4AA390()
{
  return MEMORY[0x24BE960B8]();
}

uint64_t sub_23A4AA39C()
{
  return MEMORY[0x24BE960C8]();
}

uint64_t sub_23A4AA3A8()
{
  return MEMORY[0x24BE96E98]();
}

uint64_t sub_23A4AA3B4()
{
  return MEMORY[0x24BE96EA0]();
}

uint64_t sub_23A4AA3C0()
{
  return MEMORY[0x24BE96EC0]();
}

uint64_t sub_23A4AA3CC()
{
  return MEMORY[0x24BE96ED0]();
}

uint64_t sub_23A4AA3D8()
{
  return MEMORY[0x24BE96FE8]();
}

uint64_t sub_23A4AA3E4()
{
  return MEMORY[0x24BE970F8]();
}

uint64_t sub_23A4AA3F0()
{
  return MEMORY[0x24BE97340]();
}

uint64_t sub_23A4AA3FC()
{
  return MEMORY[0x24BE97358]();
}

uint64_t sub_23A4AA408()
{
  return MEMORY[0x24BE97360]();
}

uint64_t sub_23A4AA414()
{
  return MEMORY[0x24BE97398]();
}

uint64_t sub_23A4AA420()
{
  return MEMORY[0x24BE973E0]();
}

uint64_t sub_23A4AA42C()
{
  return MEMORY[0x24BE97550]();
}

uint64_t sub_23A4AA438()
{
  return MEMORY[0x24BE976A8]();
}

uint64_t sub_23A4AA444()
{
  return MEMORY[0x24BE97700]();
}

uint64_t sub_23A4AA450()
{
  return MEMORY[0x24BE97890]();
}

uint64_t sub_23A4AA45C()
{
  return MEMORY[0x24BE97D40]();
}

uint64_t sub_23A4AA468()
{
  return MEMORY[0x24BE97D58]();
}

uint64_t sub_23A4AA474()
{
  return MEMORY[0x24BE97E58]();
}

uint64_t sub_23A4AA480()
{
  return MEMORY[0x24BE98248]();
}

uint64_t sub_23A4AA48C()
{
  return MEMORY[0x24BE98258]();
}

uint64_t sub_23A4AA498()
{
  return MEMORY[0x24BE98298]();
}

uint64_t sub_23A4AA4A4()
{
  return MEMORY[0x24BE985F0]();
}

uint64_t sub_23A4AA4B0()
{
  return MEMORY[0x24BE986D0]();
}

uint64_t sub_23A4AA4BC()
{
  return MEMORY[0x24BE98808]();
}

uint64_t sub_23A4AA4C8()
{
  return MEMORY[0x24BE98810]();
}

uint64_t sub_23A4AA4D4()
{
  return MEMORY[0x24BE98848]();
}

uint64_t sub_23A4AA4E0()
{
  return MEMORY[0x24BE98858]();
}

uint64_t sub_23A4AA4EC()
{
  return MEMORY[0x24BE98868]();
}

uint64_t sub_23A4AA4F8()
{
  return MEMORY[0x24BE98890]();
}

uint64_t sub_23A4AA504()
{
  return MEMORY[0x24BE98898]();
}

uint64_t sub_23A4AA510()
{
  return MEMORY[0x24BE988A8]();
}

uint64_t sub_23A4AA51C()
{
  return MEMORY[0x24BE988D8]();
}

uint64_t sub_23A4AA528()
{
  return MEMORY[0x24BE988E0]();
}

uint64_t sub_23A4AA534()
{
  return MEMORY[0x24BE98DC0]();
}

uint64_t sub_23A4AA540()
{
  return MEMORY[0x24BE98DD0]();
}

uint64_t sub_23A4AA54C()
{
  return MEMORY[0x24BE98EA8]();
}

uint64_t sub_23A4AA558()
{
  return MEMORY[0x24BE98EE0]();
}

uint64_t sub_23A4AA564()
{
  return MEMORY[0x24BE99018]();
}

uint64_t sub_23A4AA570()
{
  return MEMORY[0x24BE99020]();
}

uint64_t sub_23A4AA57C()
{
  return MEMORY[0x24BE929A8]();
}

uint64_t sub_23A4AA588()
{
  return MEMORY[0x24BE929C8]();
}

uint64_t sub_23A4AA594()
{
  return MEMORY[0x24BE929F0]();
}

uint64_t sub_23A4AA5A0()
{
  return MEMORY[0x24BE92A00]();
}

uint64_t sub_23A4AA5AC()
{
  return MEMORY[0x24BE92A10]();
}

uint64_t sub_23A4AA5B8()
{
  return MEMORY[0x24BE92A28]();
}

uint64_t sub_23A4AA5C4()
{
  return MEMORY[0x24BE92B10]();
}

uint64_t sub_23A4AA5D0()
{
  return MEMORY[0x24BE92BF8]();
}

uint64_t sub_23A4AA5DC()
{
  return MEMORY[0x24BE92C20]();
}

uint64_t sub_23A4AA5E8()
{
  return MEMORY[0x24BEA6B40]();
}

uint64_t sub_23A4AA5F4()
{
  return MEMORY[0x24BEA6B48]();
}

uint64_t sub_23A4AA600()
{
  return MEMORY[0x24BEA6B60]();
}

uint64_t sub_23A4AA60C()
{
  return MEMORY[0x24BEA6CE0]();
}

uint64_t sub_23A4AA618()
{
  return MEMORY[0x24BEA6CE8]();
}

uint64_t sub_23A4AA624()
{
  return MEMORY[0x24BEA6CF0]();
}

uint64_t sub_23A4AA630()
{
  return MEMORY[0x24BEA6CF8]();
}

uint64_t sub_23A4AA63C()
{
  return MEMORY[0x24BEA6F38]();
}

uint64_t sub_23A4AA648()
{
  return MEMORY[0x24BEA6F78]();
}

uint64_t sub_23A4AA654()
{
  return MEMORY[0x24BEA6F80]();
}

uint64_t sub_23A4AA660()
{
  return MEMORY[0x24BE94650]();
}

uint64_t sub_23A4AA66C()
{
  return MEMORY[0x24BE94658]();
}

uint64_t sub_23A4AA678()
{
  return MEMORY[0x24BE5BFC0]();
}

uint64_t sub_23A4AA684()
{
  return MEMORY[0x24BE5BFC8]();
}

uint64_t sub_23A4AA690()
{
  return MEMORY[0x24BE5C1B8]();
}

uint64_t sub_23A4AA69C()
{
  return MEMORY[0x24BE5C1C0]();
}

uint64_t sub_23A4AA6A8()
{
  return MEMORY[0x24BE5C1E0]();
}

uint64_t sub_23A4AA6B4()
{
  return MEMORY[0x24BE5C1F0]();
}

uint64_t sub_23A4AA6C0()
{
  return MEMORY[0x24BE946F0]();
}

uint64_t sub_23A4AA6CC()
{
  return MEMORY[0x24BE94700]();
}

uint64_t sub_23A4AA6D8()
{
  return MEMORY[0x24BEE78A8]();
}

uint64_t sub_23A4AA6E4()
{
  return MEMORY[0x24BEE78C0]();
}

uint64_t sub_23A4AA6F0()
{
  return MEMORY[0x24BEE78D8]();
}

uint64_t sub_23A4AA6FC()
{
  return MEMORY[0x24BEB7AC8]();
}

uint64_t sub_23A4AA708()
{
  return MEMORY[0x24BEB7AD0]();
}

uint64_t sub_23A4AA714()
{
  return MEMORY[0x24BEB7AD8]();
}

uint64_t sub_23A4AA720()
{
  return MEMORY[0x24BEB7B90]();
}

uint64_t sub_23A4AA72C()
{
  return MEMORY[0x24BEB7BA0]();
}

uint64_t sub_23A4AA738()
{
  return MEMORY[0x24BEB7BB0]();
}

uint64_t sub_23A4AA744()
{
  return MEMORY[0x24BEB7C40]();
}

uint64_t sub_23A4AA750()
{
  return MEMORY[0x24BEB7C50]();
}

uint64_t sub_23A4AA75C()
{
  return MEMORY[0x24BDCF808]();
}

uint64_t sub_23A4AA768()
{
  return MEMORY[0x24BEE0270]();
}

uint64_t sub_23A4AA774()
{
  return MEMORY[0x24BEE02B0]();
}

uint64_t sub_23A4AA780()
{
  return MEMORY[0x24BEE0618]();
}

uint64_t sub_23A4AA78C()
{
  return MEMORY[0x24BEE0620]();
}

uint64_t sub_23A4AA798()
{
  return MEMORY[0x24BEE0980]();
}

uint64_t sub_23A4AA7A4()
{
  return MEMORY[0x24BDCF8D8]();
}

uint64_t sub_23A4AA7B0()
{
  return MEMORY[0x24BDCF978]();
}

uint64_t sub_23A4AA7BC()
{
  return MEMORY[0x24BDCF9E0]();
}

uint64_t sub_23A4AA7C8()
{
  return MEMORY[0x24BDCFA28]();
}

uint64_t sub_23A4AA7D4()
{
  return MEMORY[0x24BDCFB28]();
}

uint64_t sub_23A4AA7E0()
{
  return MEMORY[0x24BEE09F0]();
}

uint64_t sub_23A4AA7EC()
{
  return MEMORY[0x24BEE0A08]();
}

uint64_t sub_23A4AA7F8()
{
  return MEMORY[0x24BEE0B20]();
}

uint64_t sub_23A4AA804()
{
  return MEMORY[0x24BEE0BC0]();
}

uint64_t sub_23A4AA810()
{
  return MEMORY[0x24BEE0C10]();
}

uint64_t sub_23A4AA81C()
{
  return MEMORY[0x24BEE0CC8]();
}

uint64_t sub_23A4AA828()
{
  return MEMORY[0x24BEE0DE8]();
}

uint64_t sub_23A4AA834()
{
  return MEMORY[0x24BEE0FD8]();
}

uint64_t sub_23A4AA840()
{
  return MEMORY[0x24BEE1110]();
}

uint64_t sub_23A4AA84C()
{
  return MEMORY[0x24BDCFBA8]();
}

uint64_t sub_23A4AA858()
{
  return MEMORY[0x24BDCFBC8]();
}

uint64_t sub_23A4AA864()
{
  return MEMORY[0x24BEE1128]();
}

uint64_t sub_23A4AA870()
{
  return MEMORY[0x24BEE1160]();
}

uint64_t sub_23A4AA87C()
{
  return MEMORY[0x24BEE1180]();
}

uint64_t sub_23A4AA888()
{
  return MEMORY[0x24BEE1190]();
}

uint64_t sub_23A4AA894()
{
  return MEMORY[0x24BEE11B8]();
}

uint64_t sub_23A4AA8A0()
{
  return MEMORY[0x24BEE11F8]();
}

uint64_t sub_23A4AA8AC()
{
  return MEMORY[0x24BEE1250]();
}

uint64_t sub_23A4AA8B8()
{
  return MEMORY[0x24BDCFC08]();
}

uint64_t sub_23A4AA8C4()
{
  return MEMORY[0x24BEE7908]();
}

uint64_t sub_23A4AA8D0()
{
  return MEMORY[0x24BEE7910]();
}

uint64_t sub_23A4AA8DC()
{
  return MEMORY[0x24BEE7928]();
}

uint64_t sub_23A4AA8E8()
{
  return MEMORY[0x24BEE1C68]();
}

uint64_t sub_23A4AA8F4()
{
  return MEMORY[0x24BEE1E70]();
}

uint64_t sub_23A4AA900()
{
  return MEMORY[0x24BEE1F00]();
}

uint64_t sub_23A4AA90C()
{
  return MEMORY[0x24BEE1F48]();
}

uint64_t sub_23A4AA918()
{
  return MEMORY[0x24BDD0568]();
}

uint64_t sub_23A4AA924()
{
  return MEMORY[0x24BEE20A8]();
}

uint64_t sub_23A4AA930()
{
  return MEMORY[0x24BEE2518]();
}

uint64_t sub_23A4AA93C()
{
  return MEMORY[0x24BEE2658]();
}

uint64_t sub_23A4AA948()
{
  return MEMORY[0x24BEE26E8]();
}

uint64_t sub_23A4AA954()
{
  return MEMORY[0x24BEE2710]();
}

uint64_t sub_23A4AA960()
{
  return MEMORY[0x24BEE2838]();
}

uint64_t sub_23A4AA96C()
{
  return MEMORY[0x24BEE2908]();
}

uint64_t sub_23A4AA978()
{
  return MEMORY[0x24BEE2938]();
}

uint64_t sub_23A4AA984()
{
  return MEMORY[0x24BEE2958]();
}

uint64_t sub_23A4AA990()
{
  return MEMORY[0x24BEE2980]();
}

uint64_t sub_23A4AA99C()
{
  return MEMORY[0x24BEE2988]();
}

uint64_t sub_23A4AA9A8()
{
  return MEMORY[0x24BEE2E58]();
}

uint64_t sub_23A4AA9B4()
{
  return MEMORY[0x24BEE2E70]();
}

uint64_t sub_23A4AA9C0()
{
  return MEMORY[0x24BEE2F40]();
}

uint64_t sub_23A4AA9CC()
{
  return MEMORY[0x24BEE2F48]();
}

uint64_t sub_23A4AA9D8()
{
  return MEMORY[0x24BEE3068]();
}

uint64_t sub_23A4AA9E4()
{
  return MEMORY[0x24BEE30B0]();
}

uint64_t sub_23A4AA9F0()
{
  return MEMORY[0x24BEE3290]();
}

uint64_t sub_23A4AA9FC()
{
  return MEMORY[0x24BEE32B8]();
}

uint64_t sub_23A4AAA08()
{
  return MEMORY[0x24BEE32C0]();
}

uint64_t sub_23A4AAA14()
{
  return MEMORY[0x24BEE32D8]();
}

uint64_t sub_23A4AAA20()
{
  return MEMORY[0x24BEE3308]();
}

uint64_t sub_23A4AAA2C()
{
  return MEMORY[0x24BEE3350]();
}

uint64_t sub_23A4AAA38()
{
  return MEMORY[0x24BEE3360]();
}

uint64_t sub_23A4AAA44()
{
  return MEMORY[0x24BEE3380]();
}

uint64_t sub_23A4AAA50()
{
  return MEMORY[0x24BEE33C8]();
}

uint64_t sub_23A4AAA5C()
{
  return MEMORY[0x24BEE3408]();
}

uint64_t sub_23A4AAA68()
{
  return MEMORY[0x24BEE3428]();
}

uint64_t sub_23A4AAA74()
{
  return MEMORY[0x24BEE3458]();
}

uint64_t sub_23A4AAA80()
{
  return MEMORY[0x24BEE34A0]();
}

uint64_t sub_23A4AAA8C()
{
  return MEMORY[0x24BEE34B0]();
}

uint64_t sub_23A4AAA98()
{
  return MEMORY[0x24BEE34D0]();
}

uint64_t sub_23A4AAAA4()
{
  return MEMORY[0x24BEE3548]();
}

uint64_t sub_23A4AAAB0()
{
  return MEMORY[0x24BEE3A30]();
}

uint64_t sub_23A4AAABC()
{
  return MEMORY[0x24BEE3ED8]();
}

uint64_t sub_23A4AAAC8()
{
  return MEMORY[0x24BEE42E0]();
}

uint64_t sub_23A4AAAD4()
{
  return MEMORY[0x24BEE42F8]();
}

uint64_t sub_23A4AAAE0()
{
  return MEMORY[0x24BEE4328]();
}

uint64_t sub_23A4AAAEC()
{
  return MEMORY[0x24BEE4608]();
}

uint64_t sub_23A4AAAF8()
{
  return MEMORY[0x24BEE4638]();
}

uint64_t sub_23A4AAB04()
{
  return MEMORY[0x24BEE4A08]();
}

uint64_t sub_23A4AAB10()
{
  return MEMORY[0x24BEE4A10]();
}

uint64_t AnalyticsSendEvent()
{
  return MEMORY[0x24BE1A1B0]();
}

uint64_t BiomeLibrary()
{
  return MEMORY[0x24BE0C258]();
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB90](dso, log, type, format, buf, *(_QWORD *)&size);
}

uint64_t _swift_stdlib_bridgeErrorToNSError()
{
  return MEMORY[0x24BEE4B30]();
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

uint64_t os_variant_has_internal_diagnostics()
{
  return MEMORY[0x24BDAF4D8]();
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

uint64_t swift_getEnumCaseMultiPayload()
{
  return MEMORY[0x24BEE4D08]();
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

uint64_t swift_getObjCClassMetadata()
{
  return MEMORY[0x24BEE4DB0]();
}

uint64_t swift_getObjectType()
{
  return MEMORY[0x24BEE4DB8]();
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

uint64_t swift_initClassMetadata2()
{
  return MEMORY[0x24BEE4E28]();
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

uint64_t swift_setAtWritableKeyPath()
{
  return MEMORY[0x24BEE4F28]();
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

uint64_t swift_willThrow()
{
  return MEMORY[0x24BEE5050]();
}

