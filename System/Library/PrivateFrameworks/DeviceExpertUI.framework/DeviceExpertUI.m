uint64_t sub_23A4B8B70@<X0>(uint64_t *a1@<X8>)
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
  unint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v33;
  id v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  NSObject *v41;
  os_log_type_t v42;
  uint8_t *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;

  v2 = sub_23A4D5468();
  v46 = *(_QWORD *)(v2 - 8);
  v47 = v2;
  OUTLINED_FUNCTION_3();
  MEMORY[0x24BDAC7A8](v3);
  OUTLINED_FUNCTION_1();
  v45 = v5 - v4;
  v6 = sub_23A4D4ED4();
  v44 = *(_QWORD *)(v6 - 8);
  OUTLINED_FUNCTION_3();
  MEMORY[0x24BDAC7A8](v7);
  OUTLINED_FUNCTION_1();
  v10 = v9 - v8;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2569885E8);
  OUTLINED_FUNCTION_3();
  MEMORY[0x24BDAC7A8](v11);
  OUTLINED_FUNCTION_1();
  v14 = v13 - v12;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2569885F0);
  OUTLINED_FUNCTION_3();
  MEMORY[0x24BDAC7A8](v15);
  OUTLINED_FUNCTION_1();
  v18 = v17 - v16;
  v19 = sub_23A4D509C();
  v20 = *(_QWORD *)(v19 - 8);
  MEMORY[0x24BDAC7A8](v19);
  OUTLINED_FUNCTION_1();
  v23 = v22 - v21;
  v24 = *(_QWORD *)(sub_23A4D515C() + 16);
  swift_bridgeObjectRelease();
  v25 = sub_23A4D515C();
  if (v24 >= 2)
  {
    v26 = sub_23A4B8F1C(v25);
    swift_bridgeObjectRelease();
    *a1 = v26;
    v27 = OUTLINED_FUNCTION_8();
    OUTLINED_FUNCTION_2(v27);
    v28 = OUTLINED_FUNCTION_12();
    return __swift_storeEnumTagSinglePayload(v28, v29, v30, v31);
  }
  sub_23A4CF63C(v25, v18);
  swift_bridgeObjectRelease();
  if (__swift_getEnumTagSinglePayload(v18, 1, v19) == 1)
  {
    sub_23A4B956C(v18, &qword_2569885F0);
LABEL_10:
    sub_23A4D5450();
    v41 = sub_23A4D545C();
    v42 = sub_23A4D5BB8();
    if (os_log_type_enabled(v41, v42))
    {
      v43 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v43 = 0;
      _os_log_impl(&dword_23A4B7000, v41, v42, "punchOutUri not found for attribution item", v43, 2u);
      MEMORY[0x23B84F5D0](v43, -1, -1);
    }

    (*(void (**)(uint64_t, uint64_t))(v46 + 8))(v45, v47);
    v40 = OUTLINED_FUNCTION_8();
    v37 = (uint64_t)a1;
    v38 = 1;
    v39 = 1;
    return __swift_storeEnumTagSinglePayload(v37, v38, v39, v40);
  }
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v20 + 32))(v23, v18, v19);
  v33 = (void *)sub_23A4D5054();
  v34 = objc_msgSend(v33, sel_punchOutUri);

  if (!v34)
  {
    OUTLINED_FUNCTION_11(v14, 1);
    goto LABEL_9;
  }
  sub_23A4D4EBC();

  (*(void (**)(uint64_t, uint64_t, uint64_t))(v44 + 32))(v14, v10, v6);
  OUTLINED_FUNCTION_11(v14, 0);
  if (__swift_getEnumTagSinglePayload(v14, 1, v6) == 1)
  {
LABEL_9:
    sub_23A4B956C(v14, &qword_2569885E8);
    OUTLINED_FUNCTION_4();
    goto LABEL_10;
  }
  sub_23A4B956C(v14, &qword_2569885E8);
  v35 = sub_23A4D5054();
  OUTLINED_FUNCTION_4();
  *a1 = v35;
  v36 = OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_2(v36);
  v37 = OUTLINED_FUNCTION_12();
  return __swift_storeEnumTagSinglePayload(v37, v38, v39, v40);
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x23B84F528]((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t sub_23A4B8F1C(uint64_t a1)
{
  uint64_t v2;
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
  unint64_t v20;
  unint64_t v21;
  uint64_t v22;
  _QWORD v24[2];
  uint64_t v25;
  char *v26;
  uint64_t v27;

  __swift_instantiateConcreteTypeFromMangledName(&qword_2569885F8);
  OUTLINED_FUNCTION_3();
  MEMORY[0x24BDAC7A8](v2);
  OUTLINED_FUNCTION_1();
  v5 = v4 - v3;
  v6 = sub_23A4D5A8C();
  v7 = *(_QWORD *)(v6 - 8);
  v8 = MEMORY[0x24BDAC7A8](v6);
  v10 = (char *)v24 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v8);
  v27 = (uint64_t)v24 - v11;
  v12 = *(_QWORD *)(a1 + 16);
  if (!v12)
    return MEMORY[0x24BEE4AF8];
  sub_23A4D509C();
  OUTLINED_FUNCTION_6();
  v14 = a1 + v13;
  v16 = *(_QWORD *)(v15 + 72);
  v24[1] = a1;
  sub_23A4D4FF4();
  v17 = MEMORY[0x24BEE4AF8];
  v25 = v16;
  v26 = v10;
  do
  {
    sub_23A4B9164(v14, v5);
    if (__swift_getEnumTagSinglePayload(v5, 1, v6) == 1)
    {
      sub_23A4B956C(v5, &qword_2569885F8);
    }
    else
    {
      v18 = v7;
      v19 = v27;
      OUTLINED_FUNCTION_7(v27, v5);
      OUTLINED_FUNCTION_7((uint64_t)v10, v19);
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        v17 = sub_23A4B95BC(0, *(_QWORD *)(v17 + 16) + 1, 1, v17, &qword_256988600, (void (*)(_QWORD))MEMORY[0x24BEADE60]);
      v21 = *(_QWORD *)(v17 + 16);
      v20 = *(_QWORD *)(v17 + 24);
      if (v21 >= v20 >> 1)
        v17 = sub_23A4B95BC(v20 > 1, v21 + 1, 1, v17, &qword_256988600, (void (*)(_QWORD))MEMORY[0x24BEADE60]);
      *(_QWORD *)(v17 + 16) = v21 + 1;
      v7 = v18;
      v22 = v17
          + ((*(unsigned __int8 *)(v18 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v18 + 80))
          + *(_QWORD *)(v18 + 72) * v21;
      v10 = v26;
      OUTLINED_FUNCTION_7(v22, (uint64_t)v26);
      v16 = v25;
    }
    v14 += v16;
    --v12;
  }
  while (v12);
  swift_bridgeObjectRelease();
  return v17;
}

uint64_t __swift_getEnumTagSinglePayload(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a3 - 8) + 48))();
}

uint64_t __swift_storeEnumTagSinglePayload(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a4 - 8) + 56))();
}

uint64_t sub_23A4B9164@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  char *v22;
  uint64_t v23;
  NSObject *v24;
  os_log_type_t v25;
  uint8_t *v26;
  uint64_t v27;
  uint64_t v28;
  unint64_t v29;
  uint64_t v30;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  char *v35;
  uint64_t v36;
  char *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;

  v38 = a2;
  v36 = sub_23A4D509C();
  v39 = *(_QWORD *)(v36 - 8);
  MEMORY[0x24BDAC7A8](v36);
  v35 = (char *)&v32 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = sub_23A4D5468();
  v33 = *(_QWORD *)(v4 - 8);
  v34 = v4;
  MEMORY[0x24BDAC7A8](v4);
  v37 = (char *)&v32 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v32 = sub_23A4D5A20();
  v6 = *(_QWORD *)(v32 - 8);
  MEMORY[0x24BDAC7A8](v32);
  v8 = (uint64_t *)((char *)&v32 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0));
  v9 = sub_23A4D4ED4();
  v10 = *(_QWORD *)(v9 - 8);
  MEMORY[0x24BDAC7A8](v9);
  v12 = (char *)&v32 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569885E8);
  MEMORY[0x24BDAC7A8](v13);
  v15 = (char *)&v32 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = (void *)sub_23A4D5054();
  v17 = objc_msgSend(v16, sel_punchOutUri);

  if (v17)
  {
    sub_23A4D4EBC();

    (*(void (**)(char *, char *, uint64_t))(v10 + 32))(v15, v12, v9);
    __swift_storeEnumTagSinglePayload((uint64_t)v15, 0, 1, v9);
    if (__swift_getEnumTagSinglePayload((uint64_t)v15, 1, v9) != 1)
    {
      sub_23A4B956C((uint64_t)v15, &qword_2569885E8);
      sub_23A4D5084();
      *v8 = sub_23A4D5054();
      (*(void (**)(uint64_t *, _QWORD, uint64_t))(v6 + 104))(v8, *MEMORY[0x24BEAD9F8], v32);
      v18 = v38;
      sub_23A4D5A80();
      v19 = 0;
      goto LABEL_9;
    }
  }
  else
  {
    __swift_storeEnumTagSinglePayload((uint64_t)v15, 1, 1, v9);
  }
  sub_23A4B956C((uint64_t)v15, &qword_2569885E8);
  v20 = v37;
  sub_23A4D5450();
  v21 = v39;
  v22 = v35;
  v23 = v36;
  (*(void (**)(char *, uint64_t, uint64_t))(v39 + 16))(v35, a1, v36);
  v24 = sub_23A4D545C();
  v25 = sub_23A4D5BB8();
  if (os_log_type_enabled(v24, v25))
  {
    v26 = (uint8_t *)swift_slowAlloc();
    v27 = swift_slowAlloc();
    v41 = v27;
    *(_DWORD *)v26 = 136315138;
    v32 = (uint64_t)(v26 + 4);
    v28 = sub_23A4D506C();
    v40 = sub_23A4BA75C(v28, v29, &v41);
    sub_23A4D5BE8();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v39 + 8))(v22, v23);
    _os_log_impl(&dword_23A4B7000, v24, v25, "punchOutUri not found for attribution item %s", v26, 0xCu);
    v19 = 1;
    swift_arrayDestroy();
    MEMORY[0x23B84F5D0](v27, -1, -1);
    MEMORY[0x23B84F5D0](v26, -1, -1);

    (*(void (**)(char *, uint64_t))(v33 + 8))(v20, v34);
  }
  else
  {
    (*(void (**)(char *, uint64_t))(v21 + 8))(v22, v23);

    (*(void (**)(char *, uint64_t))(v33 + 8))(v20, v34);
    v19 = 1;
  }
  v18 = v38;
LABEL_9:
  v30 = sub_23A4D5A8C();
  return __swift_storeEnumTagSinglePayload(v18, v19, 1, v30);
}

uint64_t sub_23A4B956C(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_23A4B95A8(char a1, int64_t a2, char a3, uint64_t a4)
{
  return sub_23A4B95BC(a1, a2, a3, a4, &qword_256988608, (void (*)(_QWORD))MEMORY[0x24BE03FF0]);
}

uint64_t sub_23A4B95BC(char a1, int64_t a2, char a3, uint64_t a4, uint64_t *a5, void (*a6)(_QWORD))
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
  uint64_t v20;
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
        goto LABEL_24;
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
  v17 = _swift_stdlib_malloc_size(v16);
  if (!v14 || (v17 - v15 == 0x8000000000000000 ? (v18 = v14 == -1) : (v18 = 0), v18))
  {
LABEL_24:
    OUTLINED_FUNCTION_0();
    OUTLINED_FUNCTION_5();
    result = sub_23A4D5C30();
    __break(1u);
    return result;
  }
  v16[2] = v11;
  v16[3] = 2 * ((uint64_t)(v17 - v15) / v14);
LABEL_19:
  v19 = *(unsigned __int8 *)(*(_QWORD *)(((uint64_t (*)(_QWORD))a6)(0) - 8) + 80);
  v20 = (v19 + 32) & ~v19;
  v21 = (unint64_t)v16 + v20;
  if ((a1 & 1) != 0)
  {
    sub_23A4B9864(a4 + v20, v11, v21, a6);
    *(_QWORD *)(a4 + 16) = 0;
    swift_bridgeObjectRelease();
  }
  else
  {
    sub_23A4B9774(0, v11, v21, a4, a6);
  }
  return (uint64_t)v16;
}

uint64_t sub_23A4B9774(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4, void (*a5)(_QWORD))
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
    a5(0);
    OUTLINED_FUNCTION_6();
    v11 = *(_QWORD *)(v10 + 72);
    v12 = a4 + v9 + v11 * a1;
    v13 = v11 * v5;
    v14 = a3 + v13;
    v15 = v12 + v13;
    if (v12 >= v14 || v15 <= a3)
    {
      swift_arrayInitWithCopy();
      swift_bridgeObjectRelease();
      return v14;
    }
  }
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_5();
  result = OUTLINED_FUNCTION_10();
  __break(1u);
  return result;
}

uint64_t sub_23A4B9864(unint64_t a1, uint64_t a2, unint64_t a3, void (*a4)(_QWORD))
{
  uint64_t result;

  if (a2 < 0)
  {
    OUTLINED_FUNCTION_0();
    OUTLINED_FUNCTION_5();
    result = OUTLINED_FUNCTION_10();
    __break(1u);
  }
  else if (a3 < a1
         || (result = ((uint64_t (*)(_QWORD))a4)(0),
             a1 + *(_QWORD *)(*(_QWORD *)(result - 8) + 72) * a2 <= a3))
  {
    a4(0);
    OUTLINED_FUNCTION_9();
    return swift_arrayInitWithTakeFrontToBack();
  }
  else if (a3 != a1)
  {
    OUTLINED_FUNCTION_9();
    return swift_arrayInitWithTakeBackToFront();
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

uint64_t sub_23A4B9944(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 16))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t sub_23A4B9964(uint64_t result, int a2, int a3)
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

  if (!qword_256988610)
  {
    ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v1)
      atomic_store(ForeignTypeMetadata, (unint64_t *)&qword_256988610);
  }
}

uint64_t OUTLINED_FUNCTION_2(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(a1 - 8) + 104))(v1, v2, a1);
}

uint64_t OUTLINED_FUNCTION_4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(v0 + 8))(v2, v1);
}

uint64_t OUTLINED_FUNCTION_7(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t (*v3)(uint64_t, uint64_t, uint64_t);

  return v3(a1, a2, v2);
}

uint64_t OUTLINED_FUNCTION_8()
{
  return sub_23A4D5A20();
}

uint64_t OUTLINED_FUNCTION_9()
{
  uint64_t v0;

  return v0;
}

uint64_t OUTLINED_FUNCTION_10()
{
  return sub_23A4D5C54();
}

uint64_t OUTLINED_FUNCTION_11(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  return __swift_storeEnumTagSinglePayload(a1, a2, 1, v2);
}

uint64_t OUTLINED_FUNCTION_12()
{
  uint64_t v0;

  return v0;
}

char *sub_23A4B9AA0(char *a1, char **a2, uint64_t a3)
{
  int v3;
  char *v4;
  char *v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(char *, uint64_t, uint64_t);
  char *v11;

  v3 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  v4 = *a2;
  *(_QWORD *)a1 = *a2;
  if ((v3 & 0x20000) != 0)
  {
    v5 = &v4[(v3 + 16) & ~(unint64_t)v3];
    swift_retain();
  }
  else
  {
    v5 = a1;
    *((_QWORD *)a1 + 1) = a2[1];
    v6 = *(int *)(a3 + 20);
    v7 = &a1[v6];
    v8 = (uint64_t)a2 + v6;
    v9 = sub_23A4D512C();
    v10 = *(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 16);
    v11 = v4;
    v10(v7, v8, v9);
  }
  return v5;
}

uint64_t sub_23A4B9B3C(id *a1, uint64_t a2)
{
  char *v4;
  uint64_t v5;

  v4 = (char *)a1 + *(int *)(a2 + 20);
  v5 = sub_23A4D512C();
  return (*(uint64_t (**)(char *, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(v4, v5);
}

_QWORD *sub_23A4B9B84(_QWORD *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  void *v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(char *, uint64_t, uint64_t);
  id v11;

  v5 = *(void **)a2;
  v4 = *(_QWORD *)(a2 + 8);
  *a1 = *(_QWORD *)a2;
  a1[1] = v4;
  v6 = *(int *)(a3 + 20);
  v7 = (char *)a1 + v6;
  v8 = a2 + v6;
  v9 = sub_23A4D512C();
  v10 = *(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 16);
  v11 = v5;
  v10(v7, v8, v9);
  return a1;
}

uint64_t sub_23A4B9BF0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v6 = *(void **)a1;
  v7 = *(void **)a2;
  *(_QWORD *)a1 = *(_QWORD *)a2;
  v8 = v7;

  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  v9 = *(int *)(a3 + 20);
  v10 = a1 + v9;
  v11 = a2 + v9;
  v12 = sub_23A4D512C();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 24))(v10, v11, v12);
  return a1;
}

_OWORD *sub_23A4B9C68(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  uint64_t v4;
  char *v5;
  char *v6;
  uint64_t v7;

  *a1 = *a2;
  v4 = *(int *)(a3 + 20);
  v5 = (char *)a1 + v4;
  v6 = (char *)a2 + v4;
  v7 = sub_23A4D512C();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v7 - 8) + 32))(v5, v6, v7);
  return a1;
}

uint64_t sub_23A4B9CC4(uint64_t a1, _QWORD *a2, uint64_t a3)
{
  void *v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;

  v6 = *(void **)a1;
  *(_QWORD *)a1 = *a2;

  *(_QWORD *)(a1 + 8) = a2[1];
  v7 = *(int *)(a3 + 20);
  v8 = a1 + v7;
  v9 = (char *)a2 + v7;
  v10 = sub_23A4D512C();
  (*(void (**)(uint64_t, char *, uint64_t))(*(_QWORD *)(v10 - 8) + 40))(v8, v9, v10);
  return a1;
}

uint64_t sub_23A4B9D38()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_23A4B9D44(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  int v5;
  uint64_t v9;

  if ((_DWORD)a2 == 2147483646)
  {
    v4 = *a1;
    if ((unint64_t)*a1 >= 0xFFFFFFFF)
      LODWORD(v4) = -1;
    v5 = v4 - 1;
    if (v5 < 0)
      v5 = -1;
    return (v5 + 1);
  }
  else
  {
    v9 = OUTLINED_FUNCTION_1_0();
    return __swift_getEnumTagSinglePayload((uint64_t)a1 + *(int *)(a3 + 20), a2, v9);
  }
}

uint64_t sub_23A4B9DC0()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

_QWORD *sub_23A4B9DCC(_QWORD *result, uint64_t a2, int a3, uint64_t a4)
{
  _QWORD *v5;
  uint64_t v7;

  v5 = result;
  if (a3 == 2147483646)
  {
    *result = a2;
  }
  else
  {
    v7 = OUTLINED_FUNCTION_1_0();
    return (_QWORD *)__swift_storeEnumTagSinglePayload((uint64_t)v5 + *(int *)(a4 + 20), a2, a2, v7);
  }
  return result;
}

uint64_t type metadata accessor for TipSnippet()
{
  uint64_t result;

  result = qword_256988670;
  if (!qword_256988670)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_23A4B9E6C()
{
  uint64_t result;
  unint64_t v1;

  result = sub_23A4D512C();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t sub_23A4B9EE0()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_23A4B9EF0@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _OWORD *v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  _QWORD v17[2];
  __int128 v18;

  v17[0] = a1;
  v2 = OUTLINED_FUNCTION_2_0();
  v3 = *(_QWORD *)(v2 - 8);
  v4 = *(_QWORD *)(v3 + 64);
  MEMORY[0x24BDAC7A8](v2);
  v5 = type metadata accessor for TipSnippetContentView(0);
  MEMORY[0x24BDAC7A8](v5);
  v7 = (_OWORD *)((char *)v17 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0));
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569886A8);
  MEMORY[0x24BDAC7A8](v8);
  v10 = (char *)v17 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = v1 + *(int *)(v2 + 20);
  v12 = (char *)v7 + *(int *)(v5 + 20);
  v13 = OUTLINED_FUNCTION_1_0();
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v13 - 8) + 16))(v12, v11, v13);
  v17[1] = sub_23A4D56CC();
  sub_23A4D59C0();
  *v7 = v18;
  sub_23A4BA48C((uint64_t)v7, (uint64_t)v10, type metadata accessor for TipSnippetContentView);
  v10[*(int *)(v8 + 36)] = 0;
  sub_23A4BA6F8((uint64_t)v7, type metadata accessor for TipSnippetContentView);
  sub_23A4BA48C(v1, (uint64_t)v17 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0), (uint64_t (*)(_QWORD))type metadata accessor for TipSnippet);
  v14 = (*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  v15 = swift_allocObject();
  sub_23A4BA540((uint64_t)v17 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0), v15 + v14);
  sub_23A4BA5AC();
  sub_23A4D590C();
  swift_release();
  return sub_23A4BA6B8((uint64_t)v10);
}

uint64_t sub_23A4BA0D8(id *a1)
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
  uint64_t v11;
  char *v12;
  NSObject *v13;
  os_log_type_t v14;
  uint64_t v15;
  uint8_t *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  uint64_t v21;
  uint8_t *v22;
  char *v23;
  uint64_t v24;
  id v25;
  uint64_t result;
  uint64_t v27;
  uint64_t v28;
  id *v29;
  char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  char *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;

  v2 = sub_23A4D4ED4();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v27 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_23A4D5018();
  v35 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v34 = (char *)&v27 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v36 = type metadata accessor for TipSnippet();
  MEMORY[0x24BDAC7A8](v36);
  v9 = (char *)&v27 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = sub_23A4D5468();
  v32 = *(_QWORD *)(v10 - 8);
  v33 = v10;
  MEMORY[0x24BDAC7A8](v10);
  v12 = (char *)&v27 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23A4D5450();
  sub_23A4BA48C((uint64_t)a1, (uint64_t)v9, (uint64_t (*)(_QWORD))type metadata accessor for TipSnippet);
  v13 = sub_23A4D545C();
  v14 = sub_23A4D5BAC();
  if (os_log_type_enabled(v13, v14))
  {
    v15 = swift_slowAlloc();
    v29 = a1;
    v16 = (uint8_t *)v15;
    v17 = swift_slowAlloc();
    v31 = v3;
    v18 = v17;
    v38 = v17;
    v30 = v5;
    v28 = v2;
    *(_DWORD *)v16 = 136315138;
    v19 = sub_23A4D50A8();
    v37 = sub_23A4BA75C(v19, v20, &v38);
    v2 = v28;
    v5 = v30;
    sub_23A4D5BE8();
    swift_bridgeObjectRelease();
    sub_23A4BA6F8((uint64_t)v9, (uint64_t (*)(_QWORD))type metadata accessor for TipSnippet);
    _os_log_impl(&dword_23A4B7000, v13, v14, "TipSnippet (%s) tapped", v16, 0xCu);
    swift_arrayDestroy();
    v21 = v18;
    v3 = v31;
    MEMORY[0x23B84F5D0](v21, -1, -1);
    v22 = v16;
    a1 = v29;
    MEMORY[0x23B84F5D0](v22, -1, -1);
  }
  else
  {
    sub_23A4BA6F8((uint64_t)v9, (uint64_t (*)(_QWORD))type metadata accessor for TipSnippet);
  }

  (*(void (**)(char *, uint64_t))(v32 + 8))(v12, v33);
  v23 = v34;
  sub_23A4D5114();
  type metadata accessor for ActionHandler();
  v24 = swift_allocObject();
  sub_23A4D5450();
  (*(void (**)(uint64_t, char *, uint64_t))(v35 + 32))(v24 + OBJC_IVAR____TtC14DeviceExpertUI13ActionHandler_flowContext, v23, v6);
  sub_23A4D50C0();
  if (*a1)
  {
    v25 = *a1;
    sub_23A4CFFFC();
    swift_release();

    return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  }
  else
  {
    sub_23A4D5AE0();
    sub_23A4BA720((unint64_t *)&qword_2569886D0, (uint64_t (*)(uint64_t))MEMORY[0x24BEAE580], MEMORY[0x24BEAE520]);
    result = sub_23A4D55D0();
    __break(1u);
  }
  return result;
}

uint64_t sub_23A4BA470()
{
  return sub_23A4D5918();
}

void sub_23A4BA48C(uint64_t a1, uint64_t a2, uint64_t (*a3)(_QWORD))
{
  uint64_t v5;

  v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, a1, v5);
  OUTLINED_FUNCTION_3_0();
}

uint64_t sub_23A4BA4CC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v1 = *(unsigned __int8 *)(*(_QWORD *)(OUTLINED_FUNCTION_2_0() - 8) + 80);

  v2 = OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(v2);
  return swift_deallocObject();
}

uint64_t sub_23A4BA540(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for TipSnippet();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_23A4BA584()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(unsigned __int8 *)(*(_QWORD *)(OUTLINED_FUNCTION_2_0() - 8) + 80);
  return sub_23A4BA0D8((id *)(v0 + ((v1 + 16) & ~v1)));
}

unint64_t sub_23A4BA5AC()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;
  _QWORD v3[2];

  result = qword_2569886B0;
  if (!qword_2569886B0)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2569886A8);
    sub_23A4BA720(&qword_2569886B8, type metadata accessor for TipSnippetContentView, (uint64_t)&unk_23A4D6340);
    v3[0] = v2;
    v3[1] = sub_23A4BA674();
    result = MEMORY[0x23B84F540](MEMORY[0x24BDED308], v1, v3);
    atomic_store(result, (unint64_t *)&qword_2569886B0);
  }
  return result;
}

uint64_t __swift_instantiateConcreteTypeFromMangledNameAbstract(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x23B84F534](255, (char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

unint64_t sub_23A4BA674()
{
  unint64_t result;
  uint64_t v1;

  result = qword_2569886C0;
  if (!qword_2569886C0)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2569886C8);
    result = MEMORY[0x23B84F540](MEMORY[0x24BDEFAD8], v1);
    atomic_store(result, (unint64_t *)&qword_2569886C0);
  }
  return result;
}

uint64_t sub_23A4BA6B8(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569886A8);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

void sub_23A4BA6F8(uint64_t a1, uint64_t (*a2)(_QWORD))
{
  uint64_t v2;

  v2 = a2(0);
  OUTLINED_FUNCTION_0_0(v2);
  OUTLINED_FUNCTION_3_0();
}

void sub_23A4BA720(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
{
  uint64_t v5;

  if (!*a1)
  {
    v5 = a2(255);
    atomic_store(MEMORY[0x23B84F540](a3, v5), a1);
  }
  OUTLINED_FUNCTION_3_0();
}

uint64_t sub_23A4BA75C(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD v12[3];
  uint64_t ObjectType;

  v6 = sub_23A4BA82C(v12, 0, 0, 1, a1, a2);
  v7 = v12[0];
  if (v6)
  {
    v8 = v6;
    ObjectType = swift_getObjectType();
    v12[0] = v8;
    v9 = *a3;
    if (*a3)
    {
      sub_23A4BAEE4((uint64_t)v12, *a3);
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
      sub_23A4BAEE4((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    sub_23A4D4FF4();
  }
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v12);
  return v7;
}

uint64_t sub_23A4BA82C(_QWORD *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
      sub_23A4BA980((char *)__src, HIBYTE(a6) & 0xF, __dst);
      sub_23A4D5BF4();
      result = 0;
      *a1 = __dst;
      return result;
    }
    goto LABEL_11;
  }
  if ((a6 & 0x1000000000000000) != 0)
  {
LABEL_11:
    result = sub_23A4BAA44(a5, a6);
    *a1 = v11;
    return result;
  }
  if ((a5 & 0x1000000000000000) != 0)
  {
    v8 = (a6 & 0xFFFFFFFFFFFFFFFLL) + 32;
  }
  else
  {
    v8 = sub_23A4D5C18();
    if (!v8)
    {
      result = sub_23A4D5C30();
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

void *sub_23A4BA980(char *__src, size_t __n, char *__dst)
{
  void *result;

  if ((__n & 0x8000000000000000) == 0 && (&__dst[__n] <= __src || &__src[__n] <= __dst))
    return memcpy(__dst, __src, __n);
  result = (void *)sub_23A4D5C54();
  __break(1u);
  return result;
}

uint64_t sub_23A4BAA44(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v2 = sub_23A4BAAD8(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v2 = (uint64_t)sub_23A4BACAC(0, *(_QWORD *)(v2 + 16) + 1, 1, v2);
  v4 = *(_QWORD *)(v2 + 16);
  v3 = *(_QWORD *)(v2 + 24);
  if (v4 >= v3 >> 1)
    v2 = (uint64_t)sub_23A4BACAC((char *)(v3 > 1), v4 + 1, 1, v2);
  *(_QWORD *)(v2 + 16) = v4 + 1;
  *(_BYTE *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_23A4BAAD8(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  _QWORD *v3;
  _QWORD *v4;
  uint64_t v5;
  char v6;
  uint64_t result;

  if ((a2 & 0x1000000000000000) != 0)
  {
    v2 = sub_23A4D5B40();
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
  v3 = sub_23A4BAC48(v2, 0);
  if ((v2 & 0x8000000000000000) == 0)
  {
    v4 = v3;
    v5 = sub_23A4D5C0C();
    if ((v6 & 1) != 0 || v5 != v2)
      goto LABEL_14;
    return (uint64_t)v4;
  }
  sub_23A4D5C54();
  __break(1u);
LABEL_14:
  result = sub_23A4D5C30();
  __break(1u);
  return result;
}

_QWORD *sub_23A4BAC48(uint64_t a1, uint64_t a2)
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
  __swift_instantiateConcreteTypeFromMangledName(qword_2569886D8);
  v4 = (_QWORD *)swift_allocObject();
  v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

char *sub_23A4BACAC(char *result, int64_t a2, char a3, uint64_t a4)
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
    __swift_instantiateConcreteTypeFromMangledName(qword_2569886D8);
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
    sub_23A4BAE44(v13, v8, v12);
    *(_QWORD *)(a4 + 16) = 0;
  }
  else
  {
    sub_23A4BAD80(v13, v8, v12);
  }
  swift_bridgeObjectRelease();
  return v10;
}

void *sub_23A4BAD80(char *__src, size_t __n, char *__dst)
{
  void *result;

  if ((__n & 0x8000000000000000) == 0 && (&__dst[__n] <= __src || &__src[__n] <= __dst))
    return memcpy(__dst, __src, __n);
  result = (void *)sub_23A4D5C54();
  __break(1u);
  return result;
}

char *sub_23A4BAE44(char *__src, size_t __len, char *__dst)
{
  if ((__len & 0x8000000000000000) != 0)
  {
    __src = (char *)sub_23A4D5C54();
    __break(1u);
  }
  else if (__dst != __src || &__src[__len] <= __dst)
  {
    return (char *)memmove(__dst, __src, __len);
  }
  return __src;
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

uint64_t sub_23A4BAEE4(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_23A4BAF20()
{
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2569886A8);
  sub_23A4BA5AC();
  return swift_getOpaqueTypeConformance2();
}

uint64_t OUTLINED_FUNCTION_0_0(uint64_t a1)
{
  uint64_t v1;

  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(a1 - 8) + 8))(v1, a1);
}

uint64_t OUTLINED_FUNCTION_1_0()
{
  return sub_23A4D512C();
}

uint64_t OUTLINED_FUNCTION_2_0()
{
  return type metadata accessor for TipSnippet();
}

uint64_t sub_23A4BAF98(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_23A4D52E8();
  return (**(uint64_t (***)(uint64_t, uint64_t, uint64_t))(v4 - 8))(a1, a2, v4);
}

uint64_t sub_23A4BAFD4(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_23A4D52E8();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
}

uint64_t sub_23A4BB008(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_23A4D52E8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a1, a2, v4);
  return a1;
}

uint64_t sub_23A4BB04C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_23A4D52E8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 24))(a1, a2, v4);
  return a1;
}

uint64_t sub_23A4BB090(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_23A4D52E8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a1, a2, v4);
  return a1;
}

uint64_t sub_23A4BB0D4(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_23A4D52E8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 40))(a1, a2, v4);
  return a1;
}

uint64_t sub_23A4BB118()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_23A4BB124()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v2 = OUTLINED_FUNCTION_5_0();
  return __swift_getEnumTagSinglePayload(v1, v0, v2);
}

uint64_t sub_23A4BB14C()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_23A4BB158()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v2 = OUTLINED_FUNCTION_5_0();
  return __swift_storeEnumTagSinglePayload(v1, v0, v0, v2);
}

uint64_t type metadata accessor for ListStyleAnswerSnippet()
{
  uint64_t result;

  result = qword_256988738;
  if (!qword_256988738)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_23A4BB1BC()
{
  uint64_t result;
  unint64_t v1;

  result = sub_23A4D52E8();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t sub_23A4BB224()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_23A4BB234@<X0>(uint64_t a1@<X8>)
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
  unint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  id v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;

  v2 = v1;
  v43 = a1;
  v3 = sub_23A4D5018();
  v41 = *(_QWORD *)(v3 - 8);
  v42 = v3;
  OUTLINED_FUNCTION_3();
  MEMORY[0x24BDAC7A8](v4);
  OUTLINED_FUNCTION_1();
  v7 = v6 - v5;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256988770);
  OUTLINED_FUNCTION_3();
  MEMORY[0x24BDAC7A8](v8);
  OUTLINED_FUNCTION_1();
  v11 = v10 - v9;
  v12 = OUTLINED_FUNCTION_4_0();
  v13 = *(_QWORD *)(v12 - 8);
  v14 = *(_QWORD *)(v13 + 64);
  MEMORY[0x24BDAC7A8](v12);
  v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_256988778);
  v39 = *(_QWORD *)(v15 - 8);
  v40 = v15;
  OUTLINED_FUNCTION_3();
  MEMORY[0x24BDAC7A8](v16);
  OUTLINED_FUNCTION_1();
  v19 = v18 - v17;
  v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_256988780);
  OUTLINED_FUNCTION_3();
  MEMORY[0x24BDAC7A8](v21);
  OUTLINED_FUNCTION_1();
  v24 = v23 - v22;
  sub_23A4BCB34(v2, (uint64_t)&v38 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0), (uint64_t (*)(_QWORD))type metadata accessor for ListStyleAnswerSnippet);
  v25 = (*(unsigned __int8 *)(v13 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v13 + 80);
  v26 = swift_allocObject();
  sub_23A4BC984((uint64_t)&v38 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0), v26 + v25);
  __swift_instantiateConcreteTypeFromMangledName(&qword_256988788);
  sub_23A4BCDDC(&qword_256988790, &qword_256988788);
  sub_23A4D5A50();
  sub_23A4D5258();
  v27 = sub_23A4D5198();
  if (__swift_getEnumTagSinglePayload(v11, 1, v27) == 1)
  {
    sub_23A4BCD14(v11, &qword_256988770);
    v28 = 0;
  }
  else
  {
    v28 = (void *)sub_23A4CF844();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v27 - 8) + 8))(v11, v27);
  }
  sub_23A4D52C4();
  v29 = (uint64_t *)(v24 + *(int *)(v20 + 36));
  v30 = type metadata accessor for PunchoutModifier();
  v31 = v41;
  v32 = v42;
  (*(void (**)(char *, uint64_t, uint64_t))(v41 + 16))((char *)v29 + *(int *)(v30 + 24), v7, v42);
  sub_23A4D5AE0();
  sub_23A4BCE10(&qword_2569886D0, (void (*)(uint64_t))MEMORY[0x24BEAE580]);
  v33 = v28;
  *v29 = sub_23A4D55DC();
  v29[1] = v34;
  v29[2] = (uint64_t)v28;
  v36 = v39;
  v35 = v40;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v39 + 16))(v24, v19, v40);

  (*(void (**)(uint64_t, uint64_t))(v31 + 8))(v7, v32);
  (*(void (**)(uint64_t, uint64_t))(v36 + 8))(v19, v35);
  return sub_23A4BC9F4(v24, v43);
}

void sub_23A4BB524(uint64_t a1@<X0>, uint64_t a2@<X8>)
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
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  char *v26;
  uint64_t v27;
  uint64_t v28;
  char *v29;
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
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  char v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  char v47;
  char v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  char *v55;
  uint64_t v56;
  char *v57;
  char *v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  char *v65;
  uint64_t *v66;
  uint64_t v67;
  uint64_t v68;
  BOOL v69;
  uint64_t KeyPath;
  uint64_t v71;
  uint64_t v72;
  char *v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  char v79;
  char v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  char *v84;
  uint64_t v85;
  uint64_t v86;
  char *v87;
  uint64_t v88;
  uint64_t v89;
  char *v90;
  char *v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  char v102;
  char v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  unint64_t v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t *v113;
  uint64_t (**v114)(uint64_t, uint64_t);
  uint64_t v115;
  uint64_t v116;
  char *v117;
  uint64_t v118;
  char *v119;
  char *v120;
  uint64_t v121;
  void (*v122)(char *, char *, uint64_t);
  char *v123;
  uint64_t v124;
  void (*v125)(char *, char *, uint64_t);
  char *v126;
  uint64_t v127;
  uint64_t v128;
  uint64_t v129;
  uint64_t v130;
  uint64_t v131;
  uint64_t v132;
  int *v133;
  void (*v134)(char *, uint64_t);
  uint64_t v135;
  uint64_t v136;
  uint64_t v137;
  char *v138;
  char *v139;
  uint64_t v140;
  char *v141;
  uint64_t v142;
  uint64_t v143;
  uint64_t v144;
  uint64_t v145;
  uint64_t v146;
  char *v147;
  uint64_t v148;
  char *v149;
  char *v150;
  uint64_t v151;
  uint64_t v152;
  uint64_t v153;
  uint64_t v154;
  uint64_t v155;
  uint64_t v156;
  uint64_t v157;
  char *v158;
  uint64_t v159;
  uint64_t v160;
  uint64_t v161;
  char *v162;
  uint64_t v163;
  uint64_t v164;
  char *v165;
  char *v166;
  uint64_t v167;
  uint64_t v168;
  char *v169;
  uint64_t v170;
  char *v171;
  uint64_t v172;
  uint64_t v173;
  uint64_t v174;
  uint64_t v175;
  uint64_t v176;
  char *v177;
  uint64_t v178;
  char *v179;
  uint64_t v180;
  uint64_t v181;
  uint64_t v182;
  uint64_t v183;
  uint64_t v184;
  uint64_t v185;
  uint64_t v186;

  v168 = a2;
  v3 = type metadata accessor for ListStyleAnswerSnippet();
  v142 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v143 = v4;
  v145 = (uint64_t)&v135 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v146 = sub_23A4D4E68();
  v144 = *(_QWORD *)(v146 - 8);
  MEMORY[0x24BDAC7A8](v146);
  v166 = (char *)&v135 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v148 = type metadata accessor for AttributionView();
  MEMORY[0x24BDAC7A8](v148);
  v141 = (char *)&v135 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v153 = __swift_instantiateConcreteTypeFromMangledName(&qword_256988798);
  v152 = *(_QWORD *)(v153 - 8);
  MEMORY[0x24BDAC7A8](v153);
  v150 = (char *)&v135 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v170 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569887A0);
  v151 = *(_QWORD *)(v170 - 8);
  v8 = MEMORY[0x24BDAC7A8](v170);
  v149 = (char *)&v135 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v8);
  v147 = (char *)&v135 - v10;
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_256988770);
  MEMORY[0x24BDAC7A8](v11);
  v162 = (char *)&v135 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v173 = sub_23A4D5198();
  v167 = *(_QWORD *)(v173 - 8);
  MEMORY[0x24BDAC7A8](v173);
  v165 = (char *)&v135 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569887A8);
  v15 = MEMORY[0x24BDAC7A8](v14);
  v164 = (uint64_t)&v135 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v15);
  v169 = (char *)&v135 - v17;
  v154 = type metadata accessor for ItemListView();
  MEMORY[0x24BDAC7A8](v154);
  v19 = (uint64_t *)((char *)&v135 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0));
  v156 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569887B0);
  MEMORY[0x24BDAC7A8](v156);
  v155 = (uint64_t)&v135 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  v175 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569887B8);
  v180 = *(_QWORD *)(v175 - 8);
  v21 = MEMORY[0x24BDAC7A8](v175);
  v177 = (char *)&v135 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v21);
  v179 = (char *)&v135 - v23;
  v24 = sub_23A4D4F40();
  v174 = *(_QWORD *)(v24 - 8);
  MEMORY[0x24BDAC7A8](v24);
  v26 = (char *)&v135 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
  v27 = sub_23A4D5A74();
  v157 = *(_QWORD *)(v27 - 8);
  MEMORY[0x24BDAC7A8](v27);
  v29 = (char *)&v135 - ((v28 + 15) & 0xFFFFFFFFFFFFFFF0);
  v160 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569887C0);
  v30 = *(_QWORD *)(v160 - 8);
  MEMORY[0x24BDAC7A8](v160);
  v32 = (char *)&v135 - ((v31 + 15) & 0xFFFFFFFFFFFFFFF0);
  v33 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569887C8);
  v159 = *(_QWORD *)(v33 - 8);
  MEMORY[0x24BDAC7A8](v33);
  v158 = (char *)&v135 - ((v34 + 15) & 0xFFFFFFFFFFFFFFF0);
  v35 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569887D0);
  v36 = MEMORY[0x24BDAC7A8](v35);
  v163 = (uint64_t)&v135 - ((v37 + 15) & 0xFFFFFFFFFFFFFFF0);
  v38 = MEMORY[0x24BDAC7A8](v36);
  v176 = (uint64_t)&v135 - v39;
  v40 = MEMORY[0x24BDAC7A8](v38);
  v178 = (uint64_t)&v135 - v41;
  MEMORY[0x24BDAC7A8](v40);
  v181 = (uint64_t)&v135 - v42;
  v43 = sub_23A4D52D0();
  v171 = v26;
  v172 = v24;
  v161 = v30;
  v140 = v27;
  v139 = v32;
  v138 = v29;
  if ((v43 & 1) != 0)
  {
    v44 = sub_23A4D52A0();
    v136 = sub_23A4C9648(v44);
    v46 = v45;
    v137 = a1;
    v48 = v47;
    v50 = v49;
    swift_bridgeObjectRelease();
    v184 = MEMORY[0x24BDF1FA8];
    v185 = MEMORY[0x24BEAD6B0];
    v51 = swift_allocObject();
    v182 = v51;
    *(_QWORD *)(v51 + 16) = v136;
    *(_QWORD *)(v51 + 24) = v46;
    v52 = v160;
    *(_BYTE *)(v51 + 32) = v48 & 1;
    *(_QWORD *)(v51 + 40) = v50;
    sub_23A4D5A68();
    sub_23A4BCE10(&qword_256988810, (void (*)(uint64_t))MEMORY[0x24BEADD58]);
    v54 = v53;
    sub_23A4D58AC();
    (*(void (**)(char *, uint64_t))(v157 + 8))(v29, v27);
    v55 = v171;
    v56 = v172;
    (*(void (**)(char *, _QWORD, uint64_t))(v174 + 104))(v171, *MEMORY[0x24BEAB508], v172);
    v182 = v27;
    v183 = v54;
    a1 = v137;
    swift_getOpaqueTypeConformance2();
    v57 = v158;
    sub_23A4D5894();
    v58 = v55;
    v59 = v174;
    (*(void (**)(char *, uint64_t))(v174 + 8))(v58, v56);
    (*(void (**)(char *, uint64_t))(v161 + 8))(v32, v52);
    (*(void (**)(uint64_t, char *, uint64_t))(v159 + 32))(v181, v57, v33);
    v60 = 0;
  }
  else
  {
    v59 = v174;
    v60 = 1;
  }
  v61 = 1;
  __swift_storeEnumTagSinglePayload(v181, v60, 1, v33);
  v62 = a1;
  v63 = sub_23A4D52B8();
  *v19 = swift_getKeyPath();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2569887D8);
  swift_storeEnumTagMultiPayload();
  v64 = v154;
  v65 = (char *)v19 + *(int *)(v154 + 20);
  *(_QWORD *)v65 = swift_getKeyPath();
  v65[8] = 0;
  v66 = (uint64_t *)((char *)v19 + *(int *)(v64 + 24));
  v186 = 0;
  sub_23A4D59C0();
  v67 = v183;
  *v66 = v182;
  v66[1] = v67;
  *(uint64_t *)((char *)v19 + *(int *)(v64 + 28)) = v63;
  v68 = v33;
  v69 = sub_23A4BC358();
  KeyPath = swift_getKeyPath();
  v71 = v155;
  sub_23A4BCB34((uint64_t)v19, v155, (uint64_t (*)(_QWORD))type metadata accessor for ItemListView);
  v72 = v71 + *(int *)(v156 + 36);
  *(_QWORD *)v72 = KeyPath;
  *(_BYTE *)(v72 + 8) = v69;
  sub_23A4BA6F8((uint64_t)v19, (uint64_t (*)(_QWORD))type metadata accessor for ItemListView);
  sub_23A4BCB60();
  v73 = v177;
  sub_23A4D58AC();
  sub_23A4BCD14(v71, &qword_2569887B0);
  (*(void (**)(char *, char *, uint64_t))(v180 + 32))(v179, v73, v175);
  v74 = v59;
  if ((sub_23A4D52DC() & 1) != 0)
  {
    v75 = sub_23A4D52AC();
    v76 = sub_23A4C9648(v75);
    v78 = v77;
    v80 = v79;
    v82 = v81;
    swift_bridgeObjectRelease();
    v184 = MEMORY[0x24BDF1FA8];
    v185 = MEMORY[0x24BEAD6B0];
    v83 = swift_allocObject();
    v182 = v83;
    *(_QWORD *)(v83 + 16) = v76;
    *(_QWORD *)(v83 + 24) = v78;
    *(_BYTE *)(v83 + 32) = v80 & 1;
    *(_QWORD *)(v83 + 40) = v82;
    v84 = v138;
    sub_23A4D5A68();
    sub_23A4BCE10(&qword_256988810, (void (*)(uint64_t))MEMORY[0x24BEADD58]);
    v86 = v85;
    v87 = v139;
    v88 = v140;
    sub_23A4D58AC();
    (*(void (**)(char *, uint64_t))(v157 + 8))(v84, v88);
    v90 = v171;
    v89 = v172;
    (*(void (**)(char *, _QWORD, uint64_t))(v74 + 104))(v171, *MEMORY[0x24BEAB508], v172);
    v182 = v88;
    v183 = v86;
    swift_getOpaqueTypeConformance2();
    v91 = v158;
    v92 = v160;
    sub_23A4D5894();
    (*(void (**)(char *, uint64_t))(v74 + 8))(v90, v89);
    (*(void (**)(char *, uint64_t))(v161 + 8))(v87, v92);
    (*(void (**)(uint64_t, char *, uint64_t))(v159 + 32))(v178, v91, v68);
    v61 = 0;
  }
  __swift_storeEnumTagSinglePayload(v178, v61, 1, v68);
  v93 = (uint64_t)v162;
  sub_23A4D5258();
  v94 = v173;
  if (__swift_getEnumTagSinglePayload(v93, 1, v173) == 1)
  {
    sub_23A4BCD14(v93, &qword_256988770);
    v95 = 1;
    v97 = (uint64_t)v169;
    v96 = v170;
  }
  else
  {
    (*(void (**)(char *, uint64_t, uint64_t))(v167 + 32))(v165, v93, v94);
    sub_23A4D518C();
    if ((sub_23A4D5294() & 1) != 0)
    {
      v98 = sub_23A4D5288();
      v99 = sub_23A4C9648(v98);
      v101 = v100;
      v103 = v102;
      v105 = v104;
      swift_bridgeObjectRelease();
      v106 = v103 & 1;
    }
    else
    {
      v99 = 0;
      v101 = 0;
      v106 = 0;
      v105 = 0;
    }
    v107 = v62;
    v108 = v145;
    sub_23A4BCB34(v107, v145, (uint64_t (*)(_QWORD))type metadata accessor for ListStyleAnswerSnippet);
    v109 = (*(unsigned __int8 *)(v142 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v142 + 80);
    v110 = swift_allocObject();
    sub_23A4BC984(v108, v110 + v109);
    v111 = (uint64_t)v141;
    (*(void (**)(char *, char *, uint64_t))(v144 + 32))(v141, v166, v146);
    v112 = v148;
    v113 = (uint64_t *)(v111 + *(int *)(v148 + 20));
    *v113 = v99;
    v113[1] = v101;
    v113[2] = v106;
    v113[3] = v105;
    v114 = (uint64_t (**)(uint64_t, uint64_t))(v111 + *(int *)(v112 + 24));
    *v114 = sub_23A4BCC98;
    v114[1] = (uint64_t (*)(uint64_t, uint64_t))v110;
    sub_23A4BCE10(&qword_256988808, (void (*)(uint64_t))type metadata accessor for AttributionView);
    v116 = v115;
    v117 = v150;
    sub_23A4D58AC();
    sub_23A4BA6F8(v111, (uint64_t (*)(_QWORD))type metadata accessor for AttributionView);
    v119 = v171;
    v118 = v172;
    (*(void (**)(char *, _QWORD, uint64_t))(v74 + 104))(v171, *MEMORY[0x24BEAB508], v172);
    v182 = v112;
    v183 = v116;
    swift_getOpaqueTypeConformance2();
    v120 = v149;
    v121 = v153;
    sub_23A4D5894();
    (*(void (**)(char *, uint64_t))(v74 + 8))(v119, v118);
    (*(void (**)(char *, uint64_t))(v152 + 8))(v117, v121);
    (*(void (**)(char *, uint64_t))(v167 + 8))(v165, v173);
    v122 = *(void (**)(char *, char *, uint64_t))(v151 + 32);
    v123 = v147;
    v96 = v170;
    v122(v147, v120, v170);
    v97 = (uint64_t)v169;
    v122(v169, v123, v96);
    v95 = 0;
  }
  __swift_storeEnumTagSinglePayload(v97, v95, 1, v96);
  v124 = v176;
  sub_23A4BCBFC(v181, v176, &qword_2569887D0);
  v125 = *(void (**)(char *, char *, uint64_t))(v180 + 16);
  v126 = v177;
  v127 = v175;
  v125(v177, v179, v175);
  v128 = v178;
  v129 = v163;
  sub_23A4BCBFC(v178, v163, &qword_2569887D0);
  v130 = v164;
  sub_23A4BCBFC(v97, v164, &qword_2569887A8);
  v131 = v124;
  v132 = v168;
  sub_23A4BCBFC(v131, v168, &qword_2569887D0);
  v133 = (int *)__swift_instantiateConcreteTypeFromMangledName(&qword_256988800);
  v125((char *)(v132 + v133[12]), v126, v127);
  sub_23A4BCBFC(v129, v132 + v133[16], &qword_2569887D0);
  sub_23A4BCBFC(v130, v132 + v133[20], &qword_2569887A8);
  sub_23A4BCD14(v97, &qword_2569887A8);
  sub_23A4BCD14(v128, &qword_2569887D0);
  v134 = *(void (**)(char *, uint64_t))(v180 + 8);
  v134(v179, v127);
  sub_23A4BCD14(v181, &qword_2569887D0);
  sub_23A4BCD14(v130, &qword_2569887A8);
  sub_23A4BCD14(v129, &qword_2569887D0);
  v134(v126, v127);
  sub_23A4BCD14(v176, &qword_2569887D0);
}

BOOL sub_23A4BC358()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  char *v6;
  char v7;
  void (*v8)(char *, uint64_t);
  uint64_t v10;

  v0 = sub_23A4D527C();
  v1 = *(_QWORD *)(v0 - 8);
  v2 = MEMORY[0x24BDAC7A8](v0);
  v4 = (char *)&v10 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v2);
  v6 = (char *)&v10 - v5;
  sub_23A4D5264();
  (*(void (**)(char *, _QWORD, uint64_t))(v1 + 104))(v4, *MEMORY[0x24BE2C1B0], v0);
  v7 = sub_23A4D5270();
  v8 = *(void (**)(char *, uint64_t))(v1 + 8);
  v8(v4, v0);
  v8(v6, v0);
  return (v7 & 1) == 0;
}

uint64_t sub_23A4BC430(uint64_t a1, uint64_t a2, uint64_t a3)
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
  uint64_t v14;
  char *v15;
  uint64_t v16;
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
  unint64_t v27;
  uint64_t v28;
  void (*v29)(char *, unint64_t, uint64_t);
  void *v30;
  uint64_t v31;
  uint64_t v32;
  char v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  char *v38;
  char *v39;
  NSObject *v40;
  os_log_type_t v41;
  uint8_t *v42;
  uint64_t v43;
  uint64_t v44;
  unint64_t v45;
  void *v47;
  char *v48;
  char *v49;
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
  uint64_t v61;

  v58 = a1;
  v5 = sub_23A4D5018();
  v54 = *(_QWORD *)(v5 - 8);
  v55 = v5;
  MEMORY[0x24BDAC7A8](v5);
  v53 = (char *)&v48 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_23A4D5468();
  v56 = *(_QWORD *)(v7 - 8);
  v57 = v7;
  MEMORY[0x24BDAC7A8](v7);
  v9 = (char *)&v48 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_256988770);
  MEMORY[0x24BDAC7A8](v10);
  v12 = (char *)&v48 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569885F0);
  MEMORY[0x24BDAC7A8](v13);
  v15 = (char *)&v48 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = sub_23A4D509C();
  v17 = *(_QWORD *)(v16 - 8);
  v18 = MEMORY[0x24BDAC7A8](v16);
  v20 = (char *)&v48 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v18);
  v22 = (char *)&v48 - v21;
  sub_23A4D5258();
  v23 = sub_23A4D5198();
  if (__swift_getEnumTagSinglePayload((uint64_t)v12, 1, v23) == 1)
  {
    sub_23A4BCD14((uint64_t)v12, &qword_256988770);
    __swift_storeEnumTagSinglePayload((uint64_t)v15, 1, 1, v16);
    v24 = (uint64_t)v15;
    goto LABEL_22;
  }
  v48 = v22;
  v49 = v15;
  v50 = a3;
  v51 = v9;
  v25 = sub_23A4D5180();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v23 - 8) + 8))(v12, v23);
  v26 = *(_QWORD *)(v25 + 16);
  v52 = v25;
  if (!v26)
  {
LABEL_17:
    v35 = 1;
    v9 = v51;
    v37 = v54;
    v36 = v55;
    v38 = v53;
    v24 = (uint64_t)v49;
    goto LABEL_21;
  }
  v27 = v25 + ((*(unsigned __int8 *)(v17 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v17 + 80));
  v28 = *(_QWORD *)(v17 + 72);
  v29 = *(void (**)(char *, unint64_t, uint64_t))(v17 + 16);
  sub_23A4D4FF4();
  while (1)
  {
    v29(v20, v27, v16);
    v30 = (void *)sub_23A4D5054();
    v31 = sub_23A4C9524(v30);
    if (a2)
      break;
    if (!v32)
      goto LABEL_20;
    swift_bridgeObjectRelease();
LABEL_15:
    (*(void (**)(char *, uint64_t))(v17 + 8))(v20, v16);
    v27 += v28;
    if (!--v26)
    {
      swift_bridgeObjectRelease();
      goto LABEL_17;
    }
  }
  if (!v32)
    goto LABEL_15;
  if (v31 != v58 || v32 != a2)
  {
    v34 = sub_23A4D5C60();
    swift_bridgeObjectRelease();
    if ((v34 & 1) != 0)
      goto LABEL_20;
    goto LABEL_15;
  }
  swift_bridgeObjectRelease();
LABEL_20:
  swift_bridgeObjectRelease();
  v24 = (uint64_t)v49;
  (*(void (**)(char *, char *, uint64_t))(v17 + 32))(v49, v20, v16);
  v35 = 0;
  v9 = v51;
  v37 = v54;
  v36 = v55;
  v38 = v53;
LABEL_21:
  v39 = v48;
  __swift_storeEnumTagSinglePayload(v24, v35, 1, v16);
  swift_bridgeObjectRelease();
  if (__swift_getEnumTagSinglePayload(v24, 1, v16) == 1)
  {
LABEL_22:
    sub_23A4BCD14(v24, &qword_2569885F0);
    sub_23A4D5450();
    swift_bridgeObjectRetain_n();
    v40 = sub_23A4D545C();
    v41 = sub_23A4D5BB8();
    if (os_log_type_enabled(v40, v41))
    {
      v42 = (uint8_t *)swift_slowAlloc();
      v43 = swift_slowAlloc();
      v60 = a2;
      v61 = v43;
      *(_DWORD *)v42 = 136315138;
      v59 = v58;
      sub_23A4D4FF4();
      __swift_instantiateConcreteTypeFromMangledName(&qword_256988818);
      v44 = sub_23A4D5B28();
      v59 = sub_23A4BA75C(v44, v45, &v61);
      sub_23A4D5BE8();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_23A4B7000, v40, v41, "No attribution item found for %s", v42, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x23B84F5D0](v43, -1, -1);
      MEMORY[0x23B84F5D0](v42, -1, -1);

    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
    return (*(uint64_t (**)(char *, uint64_t))(v56 + 8))(v9, v57);
  }
  else
  {
    (*(void (**)(char *, uint64_t, uint64_t))(v17 + 32))(v39, v24, v16);
    sub_23A4D5150();
    sub_23A4D5144();
    v47 = (void *)sub_23A4D5054();
    sub_23A4D52C4();
    sub_23A4C5994(v47);
    swift_release();

    (*(void (**)(char *, uint64_t))(v37 + 8))(v38, v36);
    return (*(uint64_t (**)(char *, uint64_t))(v17 + 8))(v39, v16);
  }
}

uint64_t sub_23A4BC984(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for ListStyleAnswerSnippet();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

void sub_23A4BC9C8(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_9_0();
  sub_23A4BB524(v1 + v3, a1);
}

uint64_t sub_23A4BC9F4(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_256988780);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

void sub_23A4BCA3C()
{
  sub_23A4D5618();
  OUTLINED_FUNCTION_3_0();
}

void sub_23A4BCA58()
{
  sub_23A4D5618();
  OUTLINED_FUNCTION_3_0();
}

uint64_t sub_23A4BCA74(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v2 = sub_23A4D55AC();
  MEMORY[0x24BDAC7A8](v2);
  OUTLINED_FUNCTION_1();
  (*(void (**)(uint64_t, uint64_t))(v5 + 16))(v4 - v3, a1);
  return sub_23A4D5624();
}

void sub_23A4BCAEC(_BYTE *a1@<X8>)
{
  *a1 = sub_23A4CDBD4() & 1;
  OUTLINED_FUNCTION_3_0();
}

void sub_23A4BCB14()
{
  sub_23A4CDC0C();
  OUTLINED_FUNCTION_3_0();
}

void sub_23A4BCB34(uint64_t a1, uint64_t a2, uint64_t (*a3)(_QWORD))
{
  uint64_t v3;

  v3 = a3(0);
  OUTLINED_FUNCTION_1_1(v3);
  OUTLINED_FUNCTION_3_0();
}

unint64_t sub_23A4BCB60()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD v5[2];

  result = qword_2569887E0;
  if (!qword_2569887E0)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2569887B0);
    sub_23A4BCE10(&qword_2569887E8, (void (*)(uint64_t))type metadata accessor for ItemListView);
    v3 = v2;
    sub_23A4BCDDC(&qword_2569887F0, &qword_2569887F8);
    v5[0] = v3;
    v5[1] = v4;
    result = MEMORY[0x23B84F540](MEMORY[0x24BDED308], v1, v5);
    atomic_store(result, (unint64_t *)&qword_2569887E0);
  }
  return result;
}

void sub_23A4BCBFC(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v3;

  v3 = __swift_instantiateConcreteTypeFromMangledName(a3);
  OUTLINED_FUNCTION_1_1(v3);
  OUTLINED_FUNCTION_3_0();
}

uint64_t objectdestroyTm()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v1 = *(unsigned __int8 *)(*(_QWORD *)(OUTLINED_FUNCTION_4_0() - 8) + 80);
  v2 = v0 + ((v1 + 16) & ~v1);
  v3 = sub_23A4D52E8();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(v2, v3);
  return swift_deallocObject();
}

uint64_t sub_23A4BCC98(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v5;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_9_0();
  return sub_23A4BC430(a1, a2, v2 + v5);
}

uint64_t sub_23A4BCCD4()
{
  uint64_t v0;

  sub_23A4BCD04(*(_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 24), *(_BYTE *)(v0 + 32));
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_23A4BCD04(uint64_t a1, uint64_t a2, char a3)
{
  if ((a3 & 1) != 0)
    return swift_release();
  else
    return swift_bridgeObjectRelease();
}

void sub_23A4BCD14(uint64_t a1, uint64_t *a2)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(a2);
  OUTLINED_FUNCTION_0_0(v2);
  OUTLINED_FUNCTION_3_0();
}

unint64_t sub_23A4BCD40()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD v5[2];

  result = qword_256988820;
  if (!qword_256988820)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256988780);
    sub_23A4BCDDC(&qword_256988828, &qword_256988778);
    v3 = v2;
    sub_23A4BCE10(qword_256988830, (void (*)(uint64_t))type metadata accessor for PunchoutModifier);
    v5[0] = v3;
    v5[1] = v4;
    result = MEMORY[0x23B84F540](MEMORY[0x24BDED308], v1, v5);
    atomic_store(result, (unint64_t *)&qword_256988820);
  }
  return result;
}

void sub_23A4BCDDC(_QWORD *a1, uint64_t *a2)
{
  if (!*a1)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    OUTLINED_FUNCTION_8_0();
  }
  OUTLINED_FUNCTION_3_0();
}

void sub_23A4BCE10(_QWORD *a1, void (*a2)(uint64_t))
{
  if (!*a1)
  {
    a2(255);
    OUTLINED_FUNCTION_8_0();
  }
  OUTLINED_FUNCTION_3_0();
}

uint64_t OUTLINED_FUNCTION_1_1(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(a1 - 8) + 16))(v1, v2, a1);
}

uint64_t OUTLINED_FUNCTION_4_0()
{
  return type metadata accessor for ListStyleAnswerSnippet();
}

uint64_t OUTLINED_FUNCTION_5_0()
{
  return sub_23A4D52E8();
}

void OUTLINED_FUNCTION_8_0()
{
  JUMPOUT(0x23B84F540);
}

char *sub_23A4BCE94(char *a1, char **a2, uint64_t a3)
{
  int v3;
  char *v4;
  char *v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(char *, uint64_t, uint64_t);
  char *v11;

  v3 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  v4 = *a2;
  *(_QWORD *)a1 = *a2;
  if ((v3 & 0x20000) != 0)
  {
    v5 = &v4[(v3 + 16) & ~(unint64_t)v3];
    swift_retain();
  }
  else
  {
    v5 = a1;
    *((_QWORD *)a1 + 1) = a2[1];
    v6 = *(int *)(a3 + 20);
    v7 = &a1[v6];
    v8 = (uint64_t)a2 + v6;
    v9 = sub_23A4D5228();
    v10 = *(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 16);
    v11 = v4;
    v10(v7, v8, v9);
  }
  return v5;
}

uint64_t sub_23A4BCF30(id *a1, uint64_t a2)
{
  char *v4;
  uint64_t v5;

  v4 = (char *)a1 + *(int *)(a2 + 20);
  v5 = sub_23A4D5228();
  return (*(uint64_t (**)(char *, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(v4, v5);
}

_QWORD *sub_23A4BCF78(_QWORD *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  void *v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(char *, uint64_t, uint64_t);
  id v11;

  v5 = *(void **)a2;
  v4 = *(_QWORD *)(a2 + 8);
  *a1 = *(_QWORD *)a2;
  a1[1] = v4;
  v6 = *(int *)(a3 + 20);
  v7 = (char *)a1 + v6;
  v8 = a2 + v6;
  v9 = sub_23A4D5228();
  v10 = *(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 16);
  v11 = v5;
  v10(v7, v8, v9);
  return a1;
}

uint64_t sub_23A4BCFE4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v6 = *(void **)a1;
  v7 = *(void **)a2;
  *(_QWORD *)a1 = *(_QWORD *)a2;
  v8 = v7;

  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  v9 = *(int *)(a3 + 20);
  v10 = a1 + v9;
  v11 = a2 + v9;
  v12 = sub_23A4D5228();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 24))(v10, v11, v12);
  return a1;
}

_OWORD *sub_23A4BD05C(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  uint64_t v4;
  char *v5;
  char *v6;
  uint64_t v7;

  *a1 = *a2;
  v4 = *(int *)(a3 + 20);
  v5 = (char *)a1 + v4;
  v6 = (char *)a2 + v4;
  v7 = sub_23A4D5228();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v7 - 8) + 32))(v5, v6, v7);
  return a1;
}

uint64_t sub_23A4BD0B8(uint64_t a1, _QWORD *a2, uint64_t a3)
{
  void *v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;

  v6 = *(void **)a1;
  *(_QWORD *)a1 = *a2;

  *(_QWORD *)(a1 + 8) = a2[1];
  v7 = *(int *)(a3 + 20);
  v8 = a1 + v7;
  v9 = (char *)a2 + v7;
  v10 = sub_23A4D5228();
  (*(void (**)(uint64_t, char *, uint64_t))(*(_QWORD *)(v10 - 8) + 40))(v8, v9, v10);
  return a1;
}

uint64_t sub_23A4BD12C()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_23A4BD138(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  int v5;
  uint64_t v9;

  if ((_DWORD)a2 == 2147483646)
  {
    v4 = *a1;
    if ((unint64_t)*a1 >= 0xFFFFFFFF)
      LODWORD(v4) = -1;
    v5 = v4 - 1;
    if (v5 < 0)
      v5 = -1;
    return (v5 + 1);
  }
  else
  {
    v9 = OUTLINED_FUNCTION_7_0();
    return __swift_getEnumTagSinglePayload((uint64_t)a1 + *(int *)(a3 + 20), a2, v9);
  }
}

uint64_t sub_23A4BD1B4()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

_QWORD *sub_23A4BD1C0(_QWORD *result, uint64_t a2, int a3, uint64_t a4)
{
  _QWORD *v5;
  uint64_t v7;

  v5 = result;
  if (a3 == 2147483646)
  {
    *result = a2;
  }
  else
  {
    v7 = OUTLINED_FUNCTION_7_0();
    return (_QWORD *)__swift_storeEnumTagSinglePayload((uint64_t)v5 + *(int *)(a4 + 20), a2, a2, v7);
  }
  return result;
}

uint64_t type metadata accessor for SupplementarySnippet()
{
  uint64_t result;

  result = qword_256988890;
  if (!qword_256988890)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_23A4BD260()
{
  uint64_t result;
  unint64_t v1;

  result = sub_23A4D5228();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t sub_23A4BD2D4()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_23A4BD2E4@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
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
  uint64_t *v13;
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
  unint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v47;
  _OWORD *v48;
  uint64_t v49;
  uint64_t v51[2];
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  _OWORD *v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;

  v61 = a1;
  v1 = sub_23A4D5AC8();
  v59 = *(_QWORD *)(v1 - 8);
  v60 = v1;
  OUTLINED_FUNCTION_3();
  MEMORY[0x24BDAC7A8](v2);
  OUTLINED_FUNCTION_1();
  v58 = (_OWORD *)(v4 - v3);
  v5 = sub_23A4D5ABC();
  v56 = *(_QWORD *)(v5 - 8);
  v57 = v5;
  OUTLINED_FUNCTION_3();
  MEMORY[0x24BDAC7A8](v6);
  OUTLINED_FUNCTION_1();
  v9 = (_QWORD *)(v8 - v7);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2569888C8);
  OUTLINED_FUNCTION_3();
  MEMORY[0x24BDAC7A8](v10);
  OUTLINED_FUNCTION_1();
  v13 = (uint64_t *)(v12 - v11);
  v14 = OUTLINED_FUNCTION_4_1();
  v15 = *(_QWORD *)(v14 - 8);
  v16 = *(_QWORD *)(v15 + 64);
  MEMORY[0x24BDAC7A8](v14);
  v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569888D0);
  v52 = *(_QWORD *)(v17 - 8);
  OUTLINED_FUNCTION_3();
  MEMORY[0x24BDAC7A8](v18);
  OUTLINED_FUNCTION_1();
  v21 = v20 - v19;
  v22 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569888D8);
  v53 = *(_QWORD *)(v22 - 8);
  OUTLINED_FUNCTION_3();
  MEMORY[0x24BDAC7A8](v23);
  OUTLINED_FUNCTION_1();
  v26 = v25 - v24;
  v27 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569888E0);
  v28 = *(_QWORD *)(v27 - 8);
  v54 = v27;
  v55 = v28;
  OUTLINED_FUNCTION_3();
  MEMORY[0x24BDAC7A8](v29);
  OUTLINED_FUNCTION_1();
  v32 = v31 - v30;
  sub_23A4BCB34(v51[1], (uint64_t)v51 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0), (uint64_t (*)(_QWORD))type metadata accessor for SupplementarySnippet);
  v33 = (*(unsigned __int8 *)(v15 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v15 + 80);
  v34 = swift_allocObject();
  sub_23A4BE2D4((uint64_t)v51 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0), v34 + v33);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2569888E8);
  sub_23A4BCDDC(&qword_2569888F0, &qword_2569888E8);
  sub_23A4D5A50();
  *v13 = sub_23A4D5954();
  v35 = *MEMORY[0x24BEADC28];
  v36 = sub_23A4D5A5C();
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(_QWORD *)(v36 - 8) + 104))(v13, v35, v36);
  __swift_storeEnumTagSinglePayload((uint64_t)v13, 0, 1, v36);
  sub_23A4BCDDC(&qword_2569888F8, &qword_2569888D0);
  v38 = v37;
  MEMORY[0x23B84EE68](v13, v17, v37);
  sub_23A4BCD14((uint64_t)v13, &qword_2569888C8);
  OUTLINED_FUNCTION_9_1(v21, *(uint64_t (**)(uint64_t, uint64_t))(v52 + 8));
  *v9 = 0x4000000000000000;
  v40 = v56;
  v39 = v57;
  (*(void (**)(_QWORD *, _QWORD, uint64_t))(v56 + 104))(v9, *MEMORY[0x24BEAE370], v57);
  v62 = v17;
  v63 = v38;
  v41 = OUTLINED_FUNCTION_6_0();
  sub_23A4D58C4();
  (*(void (**)(_QWORD *, uint64_t))(v40 + 8))(v9, v39);
  (*(void (**)(uint64_t, uint64_t))(v53 + 8))(v26, v22);
  __asm { FMOV            V0.2D, #2.0 }
  v48 = v58;
  v47 = v59;
  *v58 = _Q0;
  v49 = v60;
  (*(void (**)(_OWORD *, _QWORD, uint64_t))(v47 + 104))(v48, *MEMORY[0x24BEAE3D0], v60);
  v62 = v22;
  v63 = v41;
  OUTLINED_FUNCTION_6_0();
  sub_23A4D58D0();
  (*(void (**)(_OWORD *, uint64_t))(v47 + 8))(v48, v49);
  return OUTLINED_FUNCTION_9_1(v32, *(uint64_t (**)(uint64_t, uint64_t))(v55 + 8));
}

void sub_23A4BD6A0(uint64_t a1@<X0>, uint64_t a2@<X8>)
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
  _QWORD *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  unint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  char *v40;
  void (*v41)(char *, char *, uint64_t);
  _QWORD *v42;
  uint64_t v43;
  uint64_t v44;
  char *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  char *v50;
  char *v51;
  uint64_t v52;
  uint64_t v53;
  unint64_t v54;
  unint64_t v55;
  uint64_t v56;
  unint64_t v57;
  char *v58;
  char *v59;
  uint64_t v60;
  void (*v61)(char *, uint64_t);
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  void (*v68)(char *, char *, uint64_t);
  char *v69;
  char *v70;
  char *v71;
  uint64_t v72;
  uint64_t v73;
  char *v74;
  uint64_t v75;
  uint64_t v76;
  char *v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  char *v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  unint64_t v91;

  v89 = a2;
  v3 = type metadata accessor for SupplementarySnippet();
  v79 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v82 = v4;
  v85 = (uint64_t)&v67 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = type metadata accessor for TipCollectionBannerView();
  MEMORY[0x24BDAC7A8](v5);
  v74 = (char *)&v67 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v72 = __swift_instantiateConcreteTypeFromMangledName(&qword_256988900);
  MEMORY[0x24BDAC7A8](v72);
  v73 = (uint64_t)&v67 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v76 = __swift_instantiateConcreteTypeFromMangledName(&qword_256988908);
  MEMORY[0x24BDAC7A8](v76);
  v75 = (uint64_t)&v67 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_256988910);
  v83 = *(_QWORD *)(v9 - 8);
  v84 = v9;
  MEMORY[0x24BDAC7A8](v9);
  v81 = (char *)&v67 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v88 = __swift_instantiateConcreteTypeFromMangledName(&qword_256988918);
  v80 = *(_QWORD *)(v88 - 8);
  MEMORY[0x24BDAC7A8](v88);
  v77 = (char *)&v67 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_256988920);
  MEMORY[0x24BDAC7A8](v12);
  v14 = (char *)&v67 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = sub_23A4D51E0();
  v16 = *(_QWORD **)(v15 - 8);
  v17 = v16[8];
  v18 = MEMORY[0x24BDAC7A8](v15);
  v71 = (char *)&v67 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v18);
  v20 = (char *)&v67 - v19;
  v21 = __swift_instantiateConcreteTypeFromMangledName(&qword_256988928);
  v22 = MEMORY[0x24BDAC7A8](v21);
  v87 = (uint64_t)&v67 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v22);
  v25 = (char *)&v67 - v24;
  v26 = type metadata accessor for ActionButtonsView();
  v27 = MEMORY[0x24BDAC7A8](v26);
  v86 = (uint64_t)&v67 - ((v28 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v27);
  v30 = (uint64_t *)((char *)&v67 - v29);
  v78 = a1;
  v31 = sub_23A4D5210();
  v32 = sub_23A4BDD50(1, v31);
  v36 = sub_23A4BDDDC(v32, v33, v34, v35);
  sub_23A4D521C();
  sub_23A4D5AE0();
  sub_23A4BCE10(&qword_2569886D0, (void (*)(uint64_t))MEMORY[0x24BEAE580]);
  *v30 = sub_23A4D55DC();
  v30[1] = v37;
  v30[2] = v36;
  sub_23A4D5204();
  if (__swift_getEnumTagSinglePayload((uint64_t)v14, 1, v15) == 1)
  {
    sub_23A4BCD14((uint64_t)v14, &qword_256988920);
    v38 = 1;
    v39 = v88;
  }
  else
  {
    v68 = (void (*)(char *, char *, uint64_t))v16[4];
    v40 = v20;
    v68(v20, v14, v15);
    v41 = (void (*)(char *, char *, uint64_t))v16[2];
    v70 = v25;
    v42 = v16;
    v43 = (uint64_t)v74;
    v44 = v15;
    v67 = v15;
    v45 = v40;
    v69 = v40;
    v41(v74, v40, v44);
    LOBYTE(v40) = sub_23A4D5744();
    v46 = v73;
    sub_23A4BCB34(v43, v73, (uint64_t (*)(_QWORD))type metadata accessor for TipCollectionBannerView);
    v47 = v46 + *(int *)(v72 + 36);
    *(_BYTE *)v47 = (_BYTE)v40;
    *(_OWORD *)(v47 + 8) = 0u;
    *(_OWORD *)(v47 + 24) = 0u;
    *(_BYTE *)(v47 + 40) = 1;
    sub_23A4BA6F8(v43, (uint64_t (*)(_QWORD))type metadata accessor for TipCollectionBannerView);
    v48 = v75;
    sub_23A4BCBFC(v46, v75, &qword_256988900);
    v49 = v76;
    *(_BYTE *)(v48 + *(int *)(v76 + 36)) = 0;
    sub_23A4BCD14(v46, &qword_256988900);
    v50 = v71;
    v51 = v45;
    v52 = v67;
    v41(v71, v51, v67);
    v53 = v85;
    sub_23A4BCB34(v78, v85, (uint64_t (*)(_QWORD))type metadata accessor for SupplementarySnippet);
    v54 = (*((unsigned __int8 *)v42 + 80) + 16) & ~(unint64_t)*((unsigned __int8 *)v42 + 80);
    v55 = (v17 + *(unsigned __int8 *)(v79 + 80) + v54) & ~(unint64_t)*(unsigned __int8 *)(v79 + 80);
    v56 = swift_allocObject();
    v68((char *)(v56 + v54), v50, v52);
    sub_23A4BE2D4(v53, v56 + v55);
    v57 = sub_23A4BE45C();
    v58 = v81;
    sub_23A4D590C();
    swift_release();
    sub_23A4BCD14(v48, &qword_256988908);
    v90 = v49;
    v91 = v57;
    swift_getOpaqueTypeConformance2();
    v59 = v77;
    v60 = v84;
    sub_23A4D58AC();
    (*(void (**)(char *, uint64_t))(v83 + 8))(v58, v60);
    v61 = (void (*)(char *, uint64_t))v42[1];
    v25 = v70;
    v61(v69, v52);
    v62 = v88;
    (*(void (**)(char *, char *, uint64_t))(v80 + 32))(v25, v59, v88);
    v38 = 0;
    v39 = v62;
  }
  __swift_storeEnumTagSinglePayload((uint64_t)v25, v38, 1, v39);
  v63 = v86;
  sub_23A4BCB34((uint64_t)v30, v86, (uint64_t (*)(_QWORD))type metadata accessor for ActionButtonsView);
  v64 = v87;
  sub_23A4BCBFC((uint64_t)v25, v87, &qword_256988928);
  v65 = v89;
  sub_23A4BCB34(v63, v89, (uint64_t (*)(_QWORD))type metadata accessor for ActionButtonsView);
  v66 = __swift_instantiateConcreteTypeFromMangledName(&qword_256988930);
  sub_23A4BCBFC(v64, v65 + *(int *)(v66 + 48), &qword_256988928);
  sub_23A4BCD14((uint64_t)v25, &qword_256988928);
  sub_23A4BA6F8((uint64_t)v30, (uint64_t (*)(_QWORD))type metadata accessor for ActionButtonsView);
  sub_23A4BCD14(v64, &qword_256988928);
  sub_23A4BA6F8(v63, (uint64_t (*)(_QWORD))type metadata accessor for ActionButtonsView);
}

uint64_t sub_23A4BDD50(uint64_t result, uint64_t a2)
{
  unint64_t v3;
  char v4;
  unint64_t v5;

  if (result < 0)
  {
    __break(1u);
LABEL_9:
    __break(1u);
    goto LABEL_10;
  }
  v3 = *(_QWORD *)(a2 + 16);
  result = sub_23A4BE770(0, result, v3);
  if ((v4 & 1) != 0)
    v5 = v3;
  else
    v5 = result;
  if ((v5 & 0x8000000000000000) != 0)
    goto LABEL_9;
  if (v3 >= v5)
  {
    sub_23A4D53CC();
    return a2;
  }
LABEL_10:
  __break(1u);
  return result;
}

uint64_t sub_23A4BDDDC(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  if ((a4 & 1) == 0)
    goto LABEL_2;
  sub_23A4D5C6C();
  swift_unknownObjectRetain_n();
  v10 = swift_dynamicCastClass();
  if (!v10)
  {
    swift_unknownObjectRelease();
    v10 = MEMORY[0x24BEE4AF8];
  }
  v11 = *(_QWORD *)(v10 + 16);
  swift_release();
  if (__OFSUB__(a4 >> 1, a3))
  {
    __break(1u);
    goto LABEL_11;
  }
  if (v11 != (a4 >> 1) - a3)
  {
LABEL_11:
    swift_unknownObjectRelease();
LABEL_2:
    sub_23A4BE658(a1, a2, a3, a4);
    v9 = v8;
    goto LABEL_9;
  }
  v9 = swift_dynamicCastClass();
  if (!v9)
  {
    swift_unknownObjectRelease();
    v9 = MEMORY[0x24BEE4AF8];
  }
LABEL_9:
  swift_unknownObjectRelease();
  return v9;
}

uint64_t sub_23A4BDEC0(uint64_t a1, id *a2)
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
  char *v13;
  void (*v14)(char *, uint64_t, uint64_t);
  NSObject *v15;
  os_log_type_t v16;
  uint8_t *v17;
  uint64_t v18;
  unint64_t v19;
  unint64_t v20;
  uint64_t v21;
  id *v22;
  char *v23;
  uint64_t v24;
  char *v25;
  id v26;
  uint64_t result;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  id *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  char *v39;
  uint64_t v40;
  uint64_t v41;

  v31 = a2;
  v3 = sub_23A4D4ED4();
  v32 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v39 = (char *)&v28 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = sub_23A4D5018();
  v36 = *(_QWORD *)(v5 - 8);
  v37 = v5;
  MEMORY[0x24BDAC7A8](v5);
  v35 = (char *)&v28 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_23A4D51E0();
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7);
  v10 = (char *)&v28 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = sub_23A4D5468();
  v33 = *(_QWORD *)(v11 - 8);
  v34 = v11;
  MEMORY[0x24BDAC7A8](v11);
  v13 = (char *)&v28 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23A4D5450();
  v14 = *(void (**)(char *, uint64_t, uint64_t))(v8 + 16);
  v38 = a1;
  v14(v10, a1, v7);
  v15 = sub_23A4D545C();
  v16 = sub_23A4D5BAC();
  if (os_log_type_enabled(v15, v16))
  {
    v17 = (uint8_t *)swift_slowAlloc();
    v29 = swift_slowAlloc();
    v41 = v29;
    v30 = v3;
    *(_DWORD *)v17 = 136315138;
    v18 = sub_23A4D51BC();
    if (v19)
    {
      v20 = v19;
    }
    else
    {
      v18 = 0;
      v20 = 0xE000000000000000;
    }
    v40 = sub_23A4BA75C(v18, v20, &v41);
    v3 = v30;
    sub_23A4D5BE8();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
    _os_log_impl(&dword_23A4B7000, v15, v16, "Tip Collection (%s) tapped", v17, 0xCu);
    v21 = v29;
    swift_arrayDestroy();
    MEMORY[0x23B84F5D0](v21, -1, -1);
    MEMORY[0x23B84F5D0](v17, -1, -1);

  }
  else
  {
    (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);

  }
  (*(void (**)(char *, uint64_t))(v33 + 8))(v13, v34);
  type metadata accessor for SupplementarySnippet();
  v22 = v31;
  v23 = v35;
  sub_23A4D521C();
  type metadata accessor for ActionHandler();
  v24 = swift_allocObject();
  sub_23A4D5450();
  (*(void (**)(uint64_t, char *, uint64_t))(v36 + 32))(v24 + OBJC_IVAR____TtC14DeviceExpertUI13ActionHandler_flowContext, v23, v37);
  v25 = v39;
  sub_23A4D51A4();
  if (*v22)
  {
    v26 = *v22;
    sub_23A4CFFFC();
    swift_release();

    return (*(uint64_t (**)(char *, uint64_t))(v32 + 8))(v25, v3);
  }
  else
  {
    sub_23A4D5AE0();
    sub_23A4BCE10(&qword_2569886D0, (void (*)(uint64_t))MEMORY[0x24BEAE580]);
    result = sub_23A4D55D0();
    __break(1u);
  }
  return result;
}

uint64_t sub_23A4BE260()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v1 = *(unsigned __int8 *)(*(_QWORD *)(OUTLINED_FUNCTION_4_1() - 8) + 80);

  v2 = OUTLINED_FUNCTION_7_0();
  OUTLINED_FUNCTION_0_0(v2);
  return swift_deallocObject();
}

uint64_t sub_23A4BE2D4(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for SupplementarySnippet();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

void sub_23A4BE318(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;

  v3 = *(unsigned __int8 *)(*(_QWORD *)(OUTLINED_FUNCTION_4_1() - 8) + 80);
  sub_23A4BD6A0(v1 + ((v3 + 16) & ~v3), a1);
}

uint64_t sub_23A4BE350()
{
  uint64_t v0;
  uint64_t v1;
  unint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;

  v1 = *(_QWORD *)(sub_23A4D51E0() - 8);
  v2 = (*(unsigned __int8 *)(v1 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80);
  v3 = *(_QWORD *)(v1 + 64);
  v4 = *(unsigned __int8 *)(*(_QWORD *)(OUTLINED_FUNCTION_4_1() - 8) + 80);
  v5 = (v2 + v3 + v4) & ~v4;
  OUTLINED_FUNCTION_9_1(v0 + v2, *(uint64_t (**)(uint64_t, uint64_t))(v1 + 8));

  v6 = OUTLINED_FUNCTION_7_0();
  OUTLINED_FUNCTION_0_0(v6);
  return swift_deallocObject();
}

uint64_t sub_23A4BE400()
{
  uint64_t v0;
  uint64_t v1;
  unint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v1 = *(_QWORD *)(sub_23A4D51E0() - 8);
  v2 = (*(unsigned __int8 *)(v1 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80);
  v3 = *(_QWORD *)(v1 + 64);
  v4 = *(unsigned __int8 *)(*(_QWORD *)(OUTLINED_FUNCTION_4_1() - 8) + 80);
  return sub_23A4BDEC0(v0 + v2, (id *)(v0 + ((v2 + v3 + v4) & ~v4)));
}

unint64_t sub_23A4BE45C()
{
  unint64_t result;
  uint64_t v1;
  unint64_t v2;
  uint64_t v3;
  _QWORD v4[2];

  result = qword_256988938;
  if (!qword_256988938)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256988908);
    v2 = sub_23A4BE4E0();
    sub_23A4BCDDC(&qword_2569886C0, &qword_2569886C8);
    v4[0] = v2;
    v4[1] = v3;
    result = MEMORY[0x23B84F540](MEMORY[0x24BDED308], v1, v4);
    atomic_store(result, (unint64_t *)&qword_256988938);
  }
  return result;
}

unint64_t sub_23A4BE4E0()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;
  _QWORD v3[2];

  result = qword_256988940;
  if (!qword_256988940)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256988900);
    sub_23A4BCE10(&qword_256988948, (void (*)(uint64_t))type metadata accessor for TipCollectionBannerView);
    v3[0] = v2;
    v3[1] = MEMORY[0x24BDECC60];
    result = MEMORY[0x23B84F540](MEMORY[0x24BDED308], v1, v3);
    atomic_store(result, (unint64_t *)&qword_256988940);
  }
  return result;
}

uint64_t sub_23A4BE564(unint64_t a1, uint64_t a2, unint64_t a3)
{
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t result;

  if ((a2 & 0x8000000000000000) == 0)
  {
    v5 = *(_QWORD *)(*(_QWORD *)(sub_23A4D53CC() - 8) + 72) * a2;
    v6 = a3 + v5;
    v7 = a1 + v5;
    if (v6 <= a1 || v7 <= a3)
      return swift_arrayInitWithCopy();
  }
  result = sub_23A4D5C54();
  __break(1u);
  return result;
}

void sub_23A4BE658(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  unint64_t v4;
  uint64_t v5;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  _QWORD *v11;
  size_t v12;
  uint64_t v14;

  v4 = a4 >> 1;
  v5 = (a4 >> 1) - a3;
  if (__OFSUB__(a4 >> 1, a3))
  {
    __break(1u);
    goto LABEL_15;
  }
  if (v5)
  {
    if (v5 <= 0)
    {
      v11 = (_QWORD *)MEMORY[0x24BEE4AF8];
LABEL_12:
      if (v4 != a3)
      {
        v14 = sub_23A4D53CC();
        sub_23A4BE564(a2 + *(_QWORD *)(*(_QWORD *)(v14 - 8) + 72) * a3, v5, (unint64_t)v11+ ((*(unsigned __int8 *)(*(_QWORD *)(v14 - 8) + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(v14 - 8) + 80)));
        return;
      }
      goto LABEL_17;
    }
    __swift_instantiateConcreteTypeFromMangledName(&qword_256988950);
    v8 = *(_QWORD *)(sub_23A4D53CC() - 8);
    v9 = *(_QWORD *)(v8 + 72);
    v10 = (*(unsigned __int8 *)(v8 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80);
    v11 = (_QWORD *)swift_allocObject();
    v12 = _swift_stdlib_malloc_size(v11);
    if (v9)
    {
      if (v12 - v10 != 0x8000000000000000 || v9 != -1)
      {
        v11[2] = v5;
        v11[3] = 2 * ((uint64_t)(v12 - v10) / v9);
        goto LABEL_12;
      }
LABEL_16:
      __break(1u);
LABEL_17:
      __break(1u);
      return;
    }
LABEL_15:
    __break(1u);
    goto LABEL_16;
  }
}

uint64_t sub_23A4BE770(uint64_t result, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  BOOL v5;

  v3 = a3 - result;
  if (__OFSUB__(a3, result))
  {
    __break(1u);
LABEL_14:
    __break(1u);
    return result;
  }
  if (a2 < 1)
  {
    if (v3 <= 0 && v3 > a2)
      return 0;
  }
  else if ((v3 & 0x8000000000000000) == 0 && v3 < (unint64_t)a2)
  {
    return 0;
  }
  v5 = __OFADD__(result, a2);
  result += a2;
  if (v5)
    goto LABEL_14;
  return result;
}

uint64_t sub_23A4BE7BC()
{
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2569888E0);
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2569888D8);
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2569888D0);
  sub_23A4BCDDC(&qword_2569888F8, &qword_2569888D0);
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_6_0();
  return OUTLINED_FUNCTION_6_0();
}

uint64_t OUTLINED_FUNCTION_4_1()
{
  return type metadata accessor for SupplementarySnippet();
}

uint64_t OUTLINED_FUNCTION_6_0()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t OUTLINED_FUNCTION_7_0()
{
  return sub_23A4D5228();
}

uint64_t OUTLINED_FUNCTION_9_1@<X0>(uint64_t a1@<X0>, uint64_t (*a2)(uint64_t, uint64_t)@<X8>)
{
  uint64_t v2;

  return a2(a1, v2);
}

uint64_t *sub_23A4BE88C(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t *v3;
  int v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  char *v8;
  uint64_t v9;
  void (*v10)(char *, char *, uint64_t);
  uint64_t v11;

  v3 = a1;
  v4 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v4 & 0x20000) != 0)
  {
    v11 = *a2;
    *v3 = *a2;
    v3 = (uint64_t *)(v11 + ((v4 + 16) & ~(unint64_t)v4));
    swift_retain();
  }
  else
  {
    v5 = a2[1];
    *a1 = *a2;
    a1[1] = v5;
    v6 = *(int *)(a3 + 20);
    v7 = (char *)a1 + v6;
    v8 = (char *)a2 + v6;
    v9 = sub_23A4D512C();
    v10 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v9 - 8) + 16);
    swift_retain();
    v10(v7, v8, v9);
  }
  return v3;
}

uint64_t sub_23A4BE928(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;

  swift_release();
  v4 = a1 + *(int *)(a2 + 20);
  v5 = sub_23A4D512C();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(v4, v5);
}

_QWORD *sub_23A4BE970(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
  char *v7;
  uint64_t v8;
  void (*v9)(char *, char *, uint64_t);

  v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  v5 = *(int *)(a3 + 20);
  v6 = (char *)a1 + v5;
  v7 = (char *)a2 + v5;
  v8 = sub_23A4D512C();
  v9 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v8 - 8) + 16);
  swift_retain();
  v9(v6, v7, v8);
  return a1;
}

_QWORD *sub_23A4BE9E0(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v6;
  char *v7;
  char *v8;
  uint64_t v9;

  *a1 = *a2;
  a1[1] = a2[1];
  swift_retain();
  swift_release();
  v6 = *(int *)(a3 + 20);
  v7 = (char *)a1 + v6;
  v8 = (char *)a2 + v6;
  v9 = sub_23A4D512C();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v9 - 8) + 24))(v7, v8, v9);
  return a1;
}

_QWORD *sub_23A4BEA5C(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  char *v8;
  char *v9;
  uint64_t v10;

  v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  swift_release();
  v7 = *(int *)(a3 + 20);
  v8 = (char *)a1 + v7;
  v9 = (char *)a2 + v7;
  v10 = sub_23A4D512C();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v10 - 8) + 40))(v8, v9, v10);
  return a1;
}

uint64_t sub_23A4BEAC8()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

void sub_23A4BEAD4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;

  if ((_DWORD)a2 == 2147483646)
  {
    OUTLINED_FUNCTION_12_0();
  }
  else
  {
    v6 = OUTLINED_FUNCTION_1_0();
    OUTLINED_FUNCTION_2_1(a1 + *(int *)(a3 + 20), a2, v6);
  }
}

uint64_t sub_23A4BEB40()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

void sub_23A4BEB4C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  int v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_18();
  if (v3 == 2147483646)
  {
    *(_QWORD *)(v1 + 8) = v0;
    OUTLINED_FUNCTION_12_0();
  }
  else
  {
    v4 = v2;
    v5 = OUTLINED_FUNCTION_1_0();
    OUTLINED_FUNCTION_3_1(v1 + *(int *)(v4 + 20), v0, v0, v5);
  }
}

uint64_t type metadata accessor for TipSnippetContentView(uint64_t a1)
{
  return sub_23A4C1F60(a1, qword_2569889E0);
}

uint64_t sub_23A4BEBB4()
{
  uint64_t result;
  unint64_t v1;

  result = sub_23A4D512C();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t sub_23A4BEC28()
{
  return swift_getOpaqueTypeConformance2();
}

BOOL sub_23A4BEC38(int a1, int a2)
{
  return ((a2 ^ a1) & 1) == 0;
}

uint64_t sub_23A4BEC48()
{
  return sub_23A4D5CCC();
}

uint64_t sub_23A4BEC6C()
{
  sub_23A4D5CC0();
  sub_23A4D5CCC();
  return sub_23A4D5CD8();
}

BOOL sub_23A4BECB0(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return sub_23A4BEC38(*a1, *a2);
}

uint64_t sub_23A4BECBC()
{
  return sub_23A4BEC6C();
}

uint64_t sub_23A4BECC4()
{
  return sub_23A4BEC48();
}

uint64_t sub_23A4BECCC()
{
  sub_23A4D5CC0();
  sub_23A4D5CCC();
  return sub_23A4D5CD8();
}

void sub_23A4BED0C(uint64_t a1@<X8>)
{
  __int128 *v1;
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
  unint64_t v25;
  uint64_t v26;
  uint64_t v27;
  _QWORD *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  __int128 v38;
  uint64_t v39;
  uint64_t KeyPath;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  __int128 v50;
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
  __int128 v64;
  uint64_t v65;

  v62 = a1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256988A18);
  OUTLINED_FUNCTION_4_2();
  MEMORY[0x24BDAC7A8](v2);
  OUTLINED_FUNCTION_11_0();
  v61 = v3;
  v4 = OUTLINED_FUNCTION_22();
  v5 = *(_QWORD *)(v4 - 8);
  v6 = *(_QWORD *)(v5 + 64);
  MEMORY[0x24BDAC7A8](v4);
  __swift_instantiateConcreteTypeFromMangledName(&qword_256988A20);
  OUTLINED_FUNCTION_4_2();
  MEMORY[0x24BDAC7A8](v7);
  OUTLINED_FUNCTION_1();
  v10 = v9 - v8;
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_256988A28);
  OUTLINED_FUNCTION_4_2();
  MEMORY[0x24BDAC7A8](v12);
  OUTLINED_FUNCTION_1();
  v15 = v14 - v13;
  v56 = __swift_instantiateConcreteTypeFromMangledName(&qword_256988A30);
  OUTLINED_FUNCTION_4_2();
  MEMORY[0x24BDAC7A8](v16);
  OUTLINED_FUNCTION_1();
  v19 = v18 - v17;
  v58 = __swift_instantiateConcreteTypeFromMangledName(&qword_256988A38);
  OUTLINED_FUNCTION_4_2();
  MEMORY[0x24BDAC7A8](v20);
  OUTLINED_FUNCTION_11_0();
  v57 = v21;
  v60 = __swift_instantiateConcreteTypeFromMangledName(&qword_256988A40);
  OUTLINED_FUNCTION_4_2();
  MEMORY[0x24BDAC7A8](v22);
  OUTLINED_FUNCTION_11_0();
  v59 = v23;
  v64 = *v1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256988A48);
  sub_23A4D59CC();
  *(_QWORD *)v10 = v63;
  *(_QWORD *)(v10 + 8) = 0x402C000000000000;
  *(_BYTE *)(v10 + 16) = 0;
  v24 = __swift_instantiateConcreteTypeFromMangledName(&qword_256988A50);
  sub_23A4BF17C(v10 + *(int *)(v24 + 44));
  sub_23A4C1FDC((uint64_t)v1, (uint64_t)&v55 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0), type metadata accessor for TipSnippetContentView);
  v25 = (*(unsigned __int8 *)(v5 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  v26 = swift_allocObject();
  sub_23A4C42F8((uint64_t)&v55 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0), v26 + v25, type metadata accessor for TipSnippetContentView);
  v27 = swift_allocObject();
  *(_QWORD *)(v27 + 16) = sub_23A4BF9D0;
  *(_QWORD *)(v27 + 24) = v26;
  sub_23A4C4E68(v10, v15, &qword_256988A20);
  v28 = (_QWORD *)(v15 + *(int *)(v11 + 36));
  *v28 = sub_23A4BFA2C;
  v28[1] = v27;
  sub_23A4BCD14(v10, &qword_256988A20);
  LOBYTE(v26) = sub_23A4D5738();
  sub_23A4D54C8();
  v30 = v29;
  v32 = v31;
  v34 = v33;
  v36 = v35;
  sub_23A4C4E68(v15, v19, &qword_256988A28);
  v37 = v19 + *(int *)(v56 + 36);
  *(_BYTE *)v37 = v26;
  *(_QWORD *)(v37 + 8) = v30;
  *(_QWORD *)(v37 + 16) = v32;
  *(_QWORD *)(v37 + 24) = v34;
  *(_QWORD *)(v37 + 32) = v36;
  *(_BYTE *)(v37 + 40) = 0;
  sub_23A4BCD14(v15, &qword_256988A28);
  type metadata accessor for CGSize();
  OUTLINED_FUNCTION_13();
  v38 = v64;
  v56 = v65;
  v39 = sub_23A4D596C();
  KeyPath = swift_getKeyPath();
  sub_23A4D57A4();
  v41 = sub_23A4D578C();
  v42 = v61;
  __swift_storeEnumTagSinglePayload(v61, 1, 1, v41);
  v43 = sub_23A4D57B0();
  sub_23A4BCD14(v42, &qword_256988A18);
  v44 = swift_getKeyPath();
  v45 = sub_23A4D59FC();
  v47 = v46;
  v48 = v57;
  sub_23A4C4E68(v19, v57, &qword_256988A30);
  v49 = v48 + *(int *)(v58 + 36);
  *(_OWORD *)v49 = v38;
  *(_QWORD *)(v49 + 16) = v56;
  *(_QWORD *)(v49 + 24) = 0x6C69662E73706974;
  *(_QWORD *)(v49 + 32) = 0xE90000000000006CLL;
  *(_QWORD *)(v49 + 40) = KeyPath;
  *(_QWORD *)(v49 + 48) = v39;
  *(_QWORD *)(v49 + 56) = v44;
  *(_QWORD *)(v49 + 64) = v43;
  *(_QWORD *)(v49 + 72) = v45;
  *(_QWORD *)(v49 + 80) = v47;
  sub_23A4BCD14(v19, &qword_256988A30);
  OUTLINED_FUNCTION_13();
  v50 = v64;
  v51 = v65;
  v52 = v59;
  sub_23A4C4E68(v48, v59, &qword_256988A38);
  v53 = v52 + *(int *)(v60 + 36);
  *(_OWORD *)v53 = v50;
  *(_QWORD *)(v53 + 16) = v51;
  sub_23A4BCD14(v48, &qword_256988A38);
  LOBYTE(v51) = sub_23A4D5738();
  v54 = v62;
  sub_23A4C4E68(v52, v62, &qword_256988A40);
  *(_BYTE *)(v54 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_256988A58) + 36)) = v51;
  sub_23A4BCD14(v52, &qword_256988A40);
}

void sub_23A4BF17C(uint64_t a1@<X8>)
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
  uint64_t v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  uint64_t v22;
  char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t (*v26)@<X0>(uint64_t *@<X8>);
  uint64_t (*v27)@<X0>(uint64_t *@<X8>);
  uint64_t (**v28)@<X0>(uint64_t *@<X8>);
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t KeyPath;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t (*v46)@<X0>(uint64_t *@<X8>);
  uint64_t (*v47)@<X0>(uint64_t *@<X8>);
  uint64_t v48;
  uint64_t (**v49)@<X0>(uint64_t *@<X8>);
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t *v58;
  uint64_t *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t *v63;
  uint64_t v64;

  v64 = a1;
  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_256988A60);
  MEMORY[0x24BDAC7A8](v1);
  v63 = (uint64_t *)((char *)&v55 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0));
  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_256988A68);
  MEMORY[0x24BDAC7A8](v3);
  v59 = (uint64_t *)((char *)&v55 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0));
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_256988A70);
  MEMORY[0x24BDAC7A8](v5);
  v58 = (uint64_t *)((char *)&v55 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0));
  v7 = type metadata accessor for TipSnippetContentView.BodyView(0);
  MEMORY[0x24BDAC7A8](v7);
  v60 = (uint64_t)&v55 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v62 = __swift_instantiateConcreteTypeFromMangledName(&qword_256988A78);
  v9 = MEMORY[0x24BDAC7A8](v62);
  v56 = (uint64_t)&v55 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v9);
  v61 = (uint64_t)&v55 - v11;
  v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_256988A80);
  MEMORY[0x24BDAC7A8](v12);
  v14 = (char *)&v55 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = type metadata accessor for TipSnippetContentView.ImageView(0);
  MEMORY[0x24BDAC7A8](v15);
  v17 = (uint64_t *)((char *)&v55 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0));
  v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_256988A88);
  v19 = MEMORY[0x24BDAC7A8](v18);
  v21 = (char *)&v55 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v19);
  v23 = (char *)&v55 - v22;
  v57 = (uint64_t)&v55 - v22;
  type metadata accessor for TipSnippetContentView(0);
  sub_23A4D50FC();
  *v17 = swift_getKeyPath();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256988A90);
  swift_storeEnumTagMultiPayload();
  sub_23A4C4E94((uint64_t)v14, (uint64_t)v17 + *(int *)(v15 + 20), &qword_256988A80);
  v24 = swift_allocObject();
  *(_BYTE *)(v24 + 16) = 0;
  v25 = sub_23A4D5A08();
  v27 = v26;
  sub_23A4C1FDC((uint64_t)v17, (uint64_t)v21, type metadata accessor for TipSnippetContentView.ImageView);
  v28 = (uint64_t (**)@<X0>(uint64_t *@<X8>))&v21[*(int *)(v18 + 36)];
  *v28 = sub_23A4C1FD4;
  v28[1] = (uint64_t (*)@<X0>(uint64_t *@<X8>))v24;
  v28[2] = (uint64_t (*)@<X0>(uint64_t *@<X8>))v25;
  v28[3] = v27;
  sub_23A4BA6F8((uint64_t)v17, type metadata accessor for TipSnippetContentView.ImageView);
  sub_23A4C4E94((uint64_t)v21, (uint64_t)v23, &qword_256988A88);
  v29 = sub_23A4D5108();
  v31 = v30;
  v32 = sub_23A4D50B4();
  v33 = sub_23A4D5120();
  v35 = v34;
  KeyPath = swift_getKeyPath();
  v37 = swift_getKeyPath();
  v38 = (uint64_t)v58;
  *v58 = v37;
  swift_storeEnumTagMultiPayload();
  v39 = swift_getKeyPath();
  v40 = (uint64_t)v59;
  *v59 = v39;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256988A98);
  swift_storeEnumTagMultiPayload();
  v41 = swift_getKeyPath();
  v42 = (uint64_t)v63;
  *v63 = v41;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2569887D8);
  swift_storeEnumTagMultiPayload();
  v54 = v32;
  v43 = v60;
  sub_23A4BF6C8(KeyPath, 0, 0, v38, v40, v42, v29, v31, v60, 4.0, v54, v33, v35);
  v44 = swift_allocObject();
  *(_BYTE *)(v44 + 16) = 1;
  v45 = sub_23A4D5A08();
  v47 = v46;
  v48 = v56;
  sub_23A4C1FDC(v43, v56, type metadata accessor for TipSnippetContentView.BodyView);
  v49 = (uint64_t (**)@<X0>(uint64_t *@<X8>))(v48 + *(int *)(v62 + 36));
  *v49 = sub_23A4C4FC8;
  v49[1] = (uint64_t (*)@<X0>(uint64_t *@<X8>))v44;
  v49[2] = (uint64_t (*)@<X0>(uint64_t *@<X8>))v45;
  v49[3] = v47;
  sub_23A4BA6F8(v43, type metadata accessor for TipSnippetContentView.BodyView);
  v50 = v61;
  sub_23A4C4E94(v48, v61, &qword_256988A78);
  v51 = v57;
  sub_23A4C4E68(v57, (uint64_t)v21, &qword_256988A88);
  sub_23A4C4E68(v50, v48, &qword_256988A78);
  v52 = v64;
  sub_23A4C4E68((uint64_t)v21, v64, &qword_256988A88);
  v53 = __swift_instantiateConcreteTypeFromMangledName(&qword_256988AA0);
  sub_23A4C4E68(v48, v52 + *(int *)(v53 + 48), &qword_256988A78);
  sub_23A4BCD14(v50, &qword_256988A78);
  sub_23A4BCD14(v51, &qword_256988A88);
  sub_23A4BCD14(v48, &qword_256988A78);
  sub_23A4BCD14((uint64_t)v21, &qword_256988A88);
}

uint64_t sub_23A4BF6C8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, char a3@<W2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, uint64_t a9@<X8>, double a10@<D0>, uint64_t a11, uint64_t a12, uint64_t a13)
{
  int *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  _QWORD *v25;
  _QWORD *v26;
  __int128 v30;
  uint64_t v31;

  *(double *)&v30 = a10;
  sub_23A4C2074();
  sub_23A4D5504();
  v20 = (int *)type metadata accessor for TipSnippetContentView.BodyView(0);
  v21 = a9 + v20[5];
  *(_QWORD *)v21 = a1;
  *(_QWORD *)(v21 + 8) = a2;
  *(_BYTE *)(v21 + 16) = a3 & 1;
  sub_23A4C4E94(a4, a9 + v20[6], &qword_256988A70);
  sub_23A4C4E94(a5, a9 + v20[7], &qword_256988A68);
  sub_23A4C4E94(a6, a9 + v20[8], &qword_256988A60);
  v22 = v20[9];
  sub_23A4D59C0();
  *(_OWORD *)(a9 + v22) = v30;
  v23 = v20[10];
  sub_23A4D59C0();
  *(_OWORD *)(a9 + v23) = v30;
  v24 = a9 + v20[11];
  type metadata accessor for CGSize();
  sub_23A4D59C0();
  *(_OWORD *)v24 = v30;
  *(_QWORD *)(v24 + 16) = v31;
  v25 = (_QWORD *)(a9 + v20[12]);
  *v25 = a7;
  v25[1] = a8;
  *(_QWORD *)(a9 + v20[13]) = a11;
  v26 = (_QWORD *)(a9 + v20[14]);
  *v26 = a12;
  v26[1] = a13;
  return sub_23A4D5810();
}

uint64_t sub_23A4BF874(uint64_t a1)
{
  double v2;
  char v3;
  double v4;
  double v5;
  char v6;

  sub_23A4BF908(0, a1);
  if ((v3 & 1) != 0 || (v4 = v2, sub_23A4BF908(1, a1), (v6 & 1) != 0) || v4 >= v5)
    sub_23A4D56CC();
  else
    sub_23A4D56C0();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256988A48);
  return sub_23A4D59D8();
}

uint64_t sub_23A4BF908(char a1, uint64_t a2)
{
  unint64_t v3;
  char v4;

  if (*(_QWORD *)(a2 + 16) && (v3 = sub_23A4C1D78(a1 & 1), (v4 & 1) != 0))
    return *(_QWORD *)(*(_QWORD *)(a2 + 56) + 16 * v3);
  else
    return 0;
}

uint64_t sub_23A4BF95C()
{
  uint64_t v0;

  OUTLINED_FUNCTION_22();
  swift_release();
  v0 = OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(v0);
  return swift_deallocObject();
}

void sub_23A4BF9D0(uint64_t a1)
{
  OUTLINED_FUNCTION_22();
  sub_23A4BF874(a1);
  OUTLINED_FUNCTION_3_0();
}

uint64_t sub_23A4BFA08()
{
  swift_release();
  return swift_deallocObject();
}

void sub_23A4BFA2C(_QWORD *a1)
{
  uint64_t v1;

  (*(void (**)(_QWORD))(v1 + 16))(*a1);
  OUTLINED_FUNCTION_3_0();
}

uint64_t sub_23A4BFA4C@<X0>(uint64_t a1@<X8>)
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
  uint64_t v15;
  char *v16;
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
  uint64_t v28;
  uint64_t v29;
  char *v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  char v34;
  void (*v35)(char *, uint64_t);
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  char *v41;
  uint64_t v42;
  _QWORD *v43;
  char *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  id v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  _OWORD *v54;
  __int128 v55;
  uint64_t v56;
  char *v57;
  uint64_t v58;
  _OWORD *v59;
  uint64_t v65;
  uint64_t v66;
  uint64_t (*v67)(void);
  uint64_t v68;
  uint64_t v69;
  uint64_t v71;
  uint64_t v72;
  char *v73;
  uint64_t v74;
  char *v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  char *v79;
  uint64_t v80;
  char *v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  char *v85;
  char *v86;
  uint64_t v87;
  uint64_t v88;
  char *v89;
  uint64_t v90;
  uint64_t v91;
  char *v92;
  uint64_t v93;
  char *v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;

  v97 = a1;
  v2 = sub_23A4D56D8();
  v90 = *(_QWORD *)(v2 - 8);
  v91 = v2;
  MEMORY[0x24BDAC7A8](v2);
  v89 = (char *)&v71 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v88 = sub_23A4D55B8();
  MEMORY[0x24BDAC7A8](v88);
  v92 = (char *)&v71 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v77 = __swift_instantiateConcreteTypeFromMangledName(&qword_256988D70);
  v76 = *(_QWORD *)(v77 - 8);
  MEMORY[0x24BDAC7A8](v77);
  v75 = (char *)&v71 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v74 = __swift_instantiateConcreteTypeFromMangledName(&qword_256988D78);
  MEMORY[0x24BDAC7A8](v74);
  v81 = (char *)&v71 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v78 = __swift_instantiateConcreteTypeFromMangledName(&qword_256988D80);
  MEMORY[0x24BDAC7A8](v78);
  v83 = (uint64_t)&v71 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v82 = __swift_instantiateConcreteTypeFromMangledName(&qword_256988D88);
  MEMORY[0x24BDAC7A8](v82);
  v87 = (uint64_t)&v71 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v84 = __swift_instantiateConcreteTypeFromMangledName(&qword_256988D90);
  MEMORY[0x24BDAC7A8](v84);
  v85 = (char *)&v71 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v96 = __swift_instantiateConcreteTypeFromMangledName(&qword_256988D98);
  MEMORY[0x24BDAC7A8](v96);
  v86 = (char *)&v71 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = sub_23A4D54EC();
  v93 = *(_QWORD *)(v11 - 8);
  v12 = MEMORY[0x24BDAC7A8](v11);
  v14 = (char *)&v71 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v12);
  v16 = (char *)&v71 - v15;
  v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569885E8);
  v18 = MEMORY[0x24BDAC7A8](v17);
  v72 = (uint64_t)&v71 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  v20 = MEMORY[0x24BDAC7A8](v18);
  v73 = (char *)&v71 - v21;
  MEMORY[0x24BDAC7A8](v20);
  v94 = (char *)&v71 - v22;
  v95 = sub_23A4D4ED4();
  v80 = *(_QWORD *)(v95 - 8);
  MEMORY[0x24BDAC7A8](v95);
  v79 = (char *)&v71 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  v24 = __swift_instantiateConcreteTypeFromMangledName(&qword_256988A80);
  MEMORY[0x24BDAC7A8](v24);
  v26 = (char *)&v71 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
  v27 = sub_23A4D50F0();
  v28 = *(_QWORD *)(v27 - 8);
  MEMORY[0x24BDAC7A8](v27);
  v30 = (char *)&v71 - ((v29 + 15) & 0xFFFFFFFFFFFFFFF0);
  v31 = type metadata accessor for TipSnippetContentView.ImageView(0);
  sub_23A4C4E68(v1 + *(int *)(v31 + 20), (uint64_t)v26, &qword_256988A80);
  if (__swift_getEnumTagSinglePayload((uint64_t)v26, 1, v27) == 1)
  {
    v32 = &qword_256988A80;
  }
  else
  {
    v71 = v28;
    (*(void (**)(char *, char *, uint64_t))(v28 + 32))(v30, v26, v27);
    sub_23A4CE640();
    v33 = v93;
    (*(void (**)(char *, _QWORD, uint64_t))(v93 + 104))(v14, *MEMORY[0x24BDEB400], v11);
    v34 = sub_23A4D54E0();
    v35 = *(void (**)(char *, uint64_t))(v33 + 8);
    v35(v14, v11);
    v35(v16, v11);
    v26 = v94;
    if ((v34 & 1) != 0)
      sub_23A4D50D8();
    else
      sub_23A4D50CC();
    v36 = v95;
    if (__swift_getEnumTagSinglePayload((uint64_t)v26, 1, v95) != 1)
    {
      v40 = v80;
      v41 = v79;
      (*(void (**)(char *, char *, uint64_t))(v80 + 32))(v79, v26, v36);
      v42 = (uint64_t)v73;
      (*(void (**)(char *, char *, uint64_t))(v40 + 16))(v73, v41, v36);
      __swift_storeEnumTagSinglePayload(v42, 0, 1, v36);
      v95 = v1;
      sub_23A4C4E68(v42, v72, &qword_2569885E8);
      v43 = (_QWORD *)swift_allocObject();
      v43[2] = sub_23A4C0310;
      v43[3] = 0;
      v43[4] = sub_23A4C03CC;
      v43[5] = 0;
      __swift_instantiateConcreteTypeFromMangledName(&qword_256988DA0);
      sub_23A4C4E04();
      v94 = (char *)v27;
      v44 = v75;
      sub_23A4D54BC();
      sub_23A4BCD14(v42, &qword_2569885E8);
      v45 = v76;
      v46 = (uint64_t)v81;
      v47 = v77;
      (*(void (**)(char *, char *, uint64_t))(v76 + 16))(v81, v44, v77);
      v48 = v46 + *(int *)(v74 + 36);
      *(_QWORD *)v48 = 0;
      *(_WORD *)(v48 + 8) = 257;
      (*(void (**)(char *, uint64_t))(v45 + 8))(v44, v47);
      v49 = objc_msgSend((id)objc_opt_self(), sel_tertiarySystemFillColor);
      v50 = MEMORY[0x23B84EF40](v49);
      LOBYTE(v45) = sub_23A4D5738();
      v51 = v83;
      sub_23A4C4E68(v46, v83, &qword_256988D78);
      v52 = v51 + *(int *)(v78 + 36);
      *(_QWORD *)v52 = v50;
      *(_BYTE *)(v52 + 8) = v45;
      sub_23A4BCD14(v46, &qword_256988D78);
      sub_23A4D50E4();
      sub_23A4D5A08();
      sub_23A4D554C();
      v53 = v87;
      sub_23A4C4E68(v51, v87, &qword_256988D80);
      v54 = (_OWORD *)(v53 + *(int *)(v82 + 36));
      v55 = v99;
      *v54 = v98;
      v54[1] = v55;
      v54[2] = v100;
      sub_23A4BCD14(v51, &qword_256988D80);
      v57 = v89;
      v56 = v90;
      v58 = v91;
      (*(void (**)(char *, _QWORD, uint64_t))(v90 + 104))(v89, *MEMORY[0x24BDEEB68], v91);
      v59 = v92;
      (*(void (**)(char *, char *, uint64_t))(v56 + 16))(&v92[*(int *)(v88 + 20)], v57, v58);
      __asm { FMOV            V0.2D, #10.0 }
      *v59 = _Q0;
      (*(void (**)(char *, uint64_t))(v56 + 8))(v57, v58);
      v65 = (uint64_t)v85;
      v66 = (uint64_t)&v85[*(int *)(v84 + 36)];
      v67 = MEMORY[0x24BDED998];
      sub_23A4C1FDC((uint64_t)v59, v66, (uint64_t (*)(_QWORD))MEMORY[0x24BDED998]);
      *(_WORD *)(v66 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_256988DB0) + 36)) = 256;
      sub_23A4C4E68(v53, v65, &qword_256988D88);
      sub_23A4BA6F8((uint64_t)v59, (uint64_t (*)(_QWORD))v67);
      sub_23A4BCD14(v53, &qword_256988D88);
      v39 = v96;
      v68 = (uint64_t)v86;
      sub_23A4CE640();
      sub_23A4C4E94(v65, v68, &qword_256988D90);
      (*(void (**)(char *, uint64_t))(v40 + 8))(v41, v36);
      (*(void (**)(char *, char *))(v71 + 8))(v30, v94);
      v69 = v68;
      v38 = v97;
      sub_23A4C4E94(v69, v97, &qword_256988D98);
      v37 = 0;
      return __swift_storeEnumTagSinglePayload(v38, v37, 1, v39);
    }
    (*(void (**)(char *, uint64_t))(v71 + 8))(v30, v27);
    v32 = &qword_2569885E8;
  }
  sub_23A4BCD14((uint64_t)v26, v32);
  v37 = 1;
  v39 = v96;
  v38 = v97;
  return __swift_storeEnumTagSinglePayload(v38, v37, 1, v39);
}

uint64_t sub_23A4C0310@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t result;
  uint64_t v8;

  v2 = sub_23A4D599C();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v8 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, _QWORD, uint64_t))(v3 + 104))(v5, *MEMORY[0x24BDF3FD0], v2);
  v6 = sub_23A4D59B4();
  result = (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  *a1 = v6;
  return result;
}

uint64_t sub_23A4C03CC@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  result = sub_23A4D5954();
  *a1 = result;
  return result;
}

uint64_t sub_23A4C03F4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char v3;
  char v4;
  uint64_t v5;

  type metadata accessor for TipSnippetContentView.BodyView(0);
  sub_23A4C4600();
  sub_23A4D4FF4();
  v0 = sub_23A4D584C();
  v2 = v1;
  v4 = v3;
  if (qword_2569885A0 != -1)
    swift_once();
  v5 = sub_23A4D5834();
  sub_23A4BCD04(v0, v2, v4 & 1);
  swift_bridgeObjectRelease();
  return v5;
}

uint64_t sub_23A4C0510@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  int *v4;
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
  id v23;
  uint64_t v24;
  char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  _QWORD *v29;
  uint64_t v30;
  uint64_t v31;
  unint64_t v32;
  char *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  char *v37;
  uint64_t v38;
  uint64_t v39;
  char *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  char *v44;
  uint64_t v45;
  char *v46;
  int *v47;
  char *v48;
  uint64_t v49;
  unint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  char *v59;
  uint64_t v61[2];
  int *v62;
  uint64_t v63;
  char *v64;
  char *v65;
  uint64_t v66;
  char *v67;
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
  char *v82;
  char *v83;
  uint64_t v84;
  char *v85;
  __int128 v86;
  unint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  __int128 v91;
  __int128 v92;
  uint64_t v93;

  v2 = v1;
  v79 = a1;
  v77 = sub_23A4D54D4();
  v78 = *(_QWORD *)(v77 - 8);
  MEMORY[0x24BDAC7A8](v77);
  v74 = (char *)v61 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = (int *)type metadata accessor for TipSnippetContentView.BodyView(0);
  v71 = *((_QWORD *)v4 - 1);
  v80 = *(_QWORD *)(v71 + 64);
  MEMORY[0x24BDAC7A8](v4);
  v69 = (uint64_t)v61 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_256988D00);
  MEMORY[0x24BDAC7A8](v6);
  v64 = (char *)v61 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569885E8);
  MEMORY[0x24BDAC7A8](v8);
  v63 = (uint64_t)v61 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v68 = sub_23A4D548C();
  v70 = *(_QWORD *)(v68 - 8);
  MEMORY[0x24BDAC7A8](v68);
  v65 = (char *)v61 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v73 = __swift_instantiateConcreteTypeFromMangledName(&qword_256988D08);
  v72 = *(_QWORD *)(v73 - 8);
  MEMORY[0x24BDAC7A8](v73);
  v67 = (char *)v61 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v84 = __swift_instantiateConcreteTypeFromMangledName(&qword_256988D10);
  MEMORY[0x24BDAC7A8](v84);
  v83 = (char *)v61 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v75 = __swift_instantiateConcreteTypeFromMangledName(&qword_256988D18);
  v76 = *(_QWORD *)(v75 - 8);
  MEMORY[0x24BDAC7A8](v75);
  v85 = (char *)v61 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_256988D20);
  MEMORY[0x24BDAC7A8](v14);
  v16 = (char *)v61 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17 = sub_23A4D54B0();
  v18 = *(_QWORD *)(v17 - 8);
  MEMORY[0x24BDAC7A8](v17);
  v20 = (char *)v61 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  v81 = sub_23A4D54A4();
  v66 = *(_QWORD *)(v81 - 8);
  v21 = v66;
  MEMORY[0x24BDAC7A8](v81);
  v82 = (char *)v61 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  v23 = objc_msgSend((id)objc_opt_self(), sel_preferredFontForTextStyle_, *MEMORY[0x24BEBE220]);
  sub_23A4D5978();
  v91 = 0u;
  v92 = 0u;
  v93 = 0;
  (*(void (**)(char *, _QWORD, uint64_t))(v18 + 104))(v20, *MEMORY[0x24BEB7F00], v17);
  v86 = *(_OWORD *)(v1 + v4[10]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_256988CF0);
  sub_23A4D59CC();
  v61[1] = *(_QWORD *)(v1 + v4[14]);
  sub_23A4D4FF4();
  sub_23A4D4F10();
  v24 = sub_23A4D4F1C();
  __swift_storeEnumTagSinglePayload((uint64_t)v16, 0, 1, v24);
  sub_23A4D5474();
  v25 = v82;
  sub_23A4D5498();
  v62 = v4;
  v26 = sub_23A4D4ED4();
  __swift_storeEnumTagSinglePayload(v63, 1, 1, v26);
  v27 = (uint64_t)v64;
  v28 = v81;
  (*(void (**)(char *, char *, uint64_t))(v21 + 16))(v64, v25, v81);
  __swift_storeEnumTagSinglePayload(v27, 0, 1, v28);
  v29 = (_QWORD *)(v2 + v4[11]);
  v31 = v29[1];
  v32 = v29[2];
  *(_QWORD *)&v86 = *v29;
  v30 = v86;
  *((_QWORD *)&v86 + 1) = v31;
  v87 = v32;
  sub_23A4D4FF4();
  sub_23A4D4FF4();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256988D28);
  sub_23A4D59CC();
  *(_QWORD *)&v86 = v30;
  *((_QWORD *)&v86 + 1) = v31;
  v87 = v32;
  sub_23A4D59CC();
  v33 = v65;
  sub_23A4D5480();
  v34 = v69;
  sub_23A4C1FDC(v2, v69, type metadata accessor for TipSnippetContentView.BodyView);
  v35 = *(unsigned __int8 *)(v71 + 80);
  v36 = (v35 + 16) & ~v35;
  v37 = (char *)(v36 + v80);
  v80 = v35 | 7;
  v64 = v37;
  v38 = swift_allocObject();
  v39 = v34;
  sub_23A4C42F8(v34, v38 + v36, type metadata accessor for TipSnippetContentView.BodyView);
  sub_23A4BCE10(&qword_256988D30, (void (*)(uint64_t))MEMORY[0x24BEB7ED8]);
  v40 = v67;
  v41 = v68;
  sub_23A4D58DC();
  swift_release();
  (*(void (**)(char *, uint64_t))(v70 + 8))(v33, v41);
  sub_23A4C1FDC(v2, v34, type metadata accessor for TipSnippetContentView.BodyView);
  v42 = swift_allocObject();
  v71 = v36;
  sub_23A4C42F8(v39, v42 + v36, type metadata accessor for TipSnippetContentView.BodyView);
  v43 = v72;
  v44 = v83;
  v45 = v73;
  (*(void (**)(char *, char *, uint64_t))(v72 + 16))(v83, v40, v73);
  v46 = &v44[*(int *)(v84 + 36)];
  *(_QWORD *)v46 = sub_23A4C44D8;
  *((_QWORD *)v46 + 1) = v42;
  *((_QWORD *)v46 + 2) = 0;
  *((_QWORD *)v46 + 3) = 0;
  (*(void (**)(char *, uint64_t))(v43 + 8))(v40, v45);
  v47 = v62;
  v61[0] = v2;
  v48 = v74;
  sub_23A4CE810();
  sub_23A4C1FDC(v2, v39, type metadata accessor for TipSnippetContentView.BodyView);
  v49 = swift_allocObject();
  sub_23A4C42F8(v39, v49 + v36, type metadata accessor for TipSnippetContentView.BodyView);
  v50 = sub_23A4C44E0();
  sub_23A4BCE10(&qword_256988D40, (void (*)(uint64_t))MEMORY[0x24BDEB1F0]);
  v52 = v51;
  v53 = v77;
  v54 = (uint64_t)v83;
  sub_23A4D593C();
  swift_release();
  (*(void (**)(char *, uint64_t))(v78 + 8))(v48, v53);
  sub_23A4BCD14(v54, &qword_256988D10);
  v55 = (uint64_t *)(v61[0] + v47[12]);
  v56 = v55[1];
  v89 = *v55;
  v90 = v56;
  sub_23A4C1FDC(v61[0], v39, type metadata accessor for TipSnippetContentView.BodyView);
  v57 = swift_allocObject();
  sub_23A4C42F8(v39, v57 + v71, type metadata accessor for TipSnippetContentView.BodyView);
  sub_23A4D4FF4();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256988818);
  *(_QWORD *)&v86 = v84;
  *((_QWORD *)&v86 + 1) = v53;
  v87 = v50;
  v88 = v52;
  swift_getOpaqueTypeConformance2();
  sub_23A4C45A4();
  v58 = v75;
  v59 = v85;
  sub_23A4D593C();
  swift_release();
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v76 + 8))(v59, v58);
  return (*(uint64_t (**)(char *, uint64_t))(v66 + 8))(v82, v81);
}

void sub_23A4C0E3C(double a1, double a2)
{
  type metadata accessor for TipSnippetContentView.BodyView(0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_256988D28);
  sub_23A4D59D8();
  sub_23A4D59CC();
  sub_23A4C0EE8(a1, a2);
}

void sub_23A4C0EE8(double a1, double a2)
{
  uint64_t v2;
  uint64_t v3;
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
  double v16;
  double v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char v21;
  char v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  char v26;
  double v27;
  double v28;
  double v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  char v34;
  void (*v35)(char *, uint64_t);
  char v36;
  uint64_t v37;
  char v38;
  uint64_t v39;
  BOOL v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  __int128 v47;

  v3 = v2;
  v6 = sub_23A4D55AC();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v41 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_256988D50);
  MEMORY[0x24BDAC7A8](v10);
  v12 = (char *)&v41 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a1 != 0.0 || a2 != 0.0)
  {
    v41 = v7;
    v44 = v6;
    v13 = type metadata accessor for TipSnippetContentView.BodyView(0);
    v14 = v3 + *(int *)(v13 + 60);
    if (qword_2569885A8 != -1)
      swift_once();
    v15 = sub_23A4D57F8();
    __swift_storeEnumTagSinglePayload((uint64_t)v12, 1, 1, v15);
    sub_23A4D5804();
    v17 = v16;
    sub_23A4BCD14((uint64_t)v12, &qword_256988D50);
    v18 = sub_23A4C03F4();
    v20 = v19;
    v45 = v14;
    v22 = v21 & 1;
    v42 = v13;
    v43 = v3;
    v23 = v3 + *(int *)(v13 + 20);
    v24 = *(_QWORD *)v23;
    v25 = *(_QWORD *)(v23 + 8);
    v26 = *(_BYTE *)(v23 + 16);
    sub_23A4C256C(*(_QWORD *)v23, v25, v26);
    sub_23A4CE670();
    sub_23A4C2740(v24, v25, v26);
    __swift_storeEnumTagSinglePayload((uint64_t)v12, 1, 1, v15);
    sub_23A4D5804();
    v28 = v27;
    sub_23A4BCD04(v18, v20, v22);
    swift_bridgeObjectRelease();
    sub_23A4BCD14((uint64_t)v12, &qword_256988D50);
    v29 = round(v28 / v17);
    if ((~*(_QWORD *)&v29 & 0x7FF0000000000000) != 0)
    {
      v30 = v44;
      if (v29 > -9.22337204e18)
      {
        if (v29 < 9.22337204e18)
        {
          v31 = (uint64_t)v29;
          v33 = v42;
          v32 = v43;
          sub_23A4CEA28();
          v34 = sub_23A4D55A0();
          v35 = *(void (**)(char *, uint64_t))(v41 + 8);
          v35(v9, v30);
          if ((v34 & 1) != 0)
          {
            if (v31 >= 9)
            {
LABEL_10:
              sub_23A4CEA28();
              v36 = sub_23A4D55A0();
              v35(v9, v30);
              if ((v36 & 1) != 0)
                v31 = 9;
              else
                v31 = 0x7FFFFFFFFFFFFFFFLL;
              v47 = *(_OWORD *)(v32 + *(int *)(v33 + 40));
              v37 = 1;
              goto LABEL_19;
            }
          }
          else if (v31 == 0x7FFFFFFFFFFFFFFFLL)
          {
            goto LABEL_10;
          }
          sub_23A4CEA28();
          v38 = sub_23A4D55A0();
          v35(v9, v30);
          v39 = 10;
          if ((v38 & 1) == 0)
            v39 = 0x7FFFFFFFFFFFFFFFLL;
          v40 = __OFSUB__(v39, v31);
          v37 = v39 - v31;
          if (!v40)
          {
            v47 = *(_OWORD *)(v32 + *(int *)(v33 + 40));
LABEL_19:
            v46 = v37;
            __swift_instantiateConcreteTypeFromMangledName(&qword_256988CF0);
            sub_23A4D59D8();
            v47 = *(_OWORD *)(v32 + *(int *)(v33 + 36));
            v46 = v31;
            __swift_instantiateConcreteTypeFromMangledName(&qword_256988CF0);
            sub_23A4D59D8();
            return;
          }
LABEL_24:
          __break(1u);
          return;
        }
LABEL_23:
        __break(1u);
        goto LABEL_24;
      }
    }
    else
    {
      __break(1u);
    }
    __break(1u);
    goto LABEL_23;
  }
}

void sub_23A4C12C8()
{
  double v0;
  double v1;

  type metadata accessor for TipSnippetContentView.BodyView(0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_256988D28);
  sub_23A4D59CC();
  sub_23A4C0EE8(v0, v1);
}

uint64_t sub_23A4C1330@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  char *v3;
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
  uint64_t v14;
  uint64_t v15;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;

  v19 = a1;
  v20 = sub_23A4D4F1C();
  v18 = *(_QWORD *)(v20 - 8);
  MEMORY[0x24BDAC7A8](v20);
  v3 = (char *)&v17 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_256988CA8);
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)&v17 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_256988CB0);
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7);
  v10 = (char *)&v17 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = sub_23A4D56F0();
  __swift_instantiateConcreteTypeFromMangledName(qword_256988AC0);
  sub_23A4D5510();
  v12 = v21;
  *(_QWORD *)v6 = v11;
  *((_QWORD *)v6 + 1) = v12;
  v6[16] = 0;
  v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_256988CB8);
  sub_23A4C1554(v1, (uint64_t)&v6[*(int *)(v13 + 44)]);
  sub_23A4C42A0();
  sub_23A4D5BD0();
  sub_23A4BCDDC(&qword_256988CC8, &qword_256988CA8);
  v15 = v14;
  sub_23A4D5924();
  sub_23A4BCD14((uint64_t)v6, &qword_256988CA8);
  type metadata accessor for TipSnippetContentView.BodyView(0);
  sub_23A4D4FF4();
  sub_23A4D4F10();
  v21 = v4;
  v22 = v15;
  swift_getOpaqueTypeConformance2();
  sub_23A4D5930();
  (*(void (**)(char *, uint64_t))(v18 + 8))(v3, v20);
  return (*(uint64_t (**)(char *, uint64_t))(v8 + 8))(v10, v7);
}

uint64_t sub_23A4C1554@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  _BYTE *v6;
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
  char v18;
  int *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  char v23;
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
  _BYTE *v36;
  _BYTE *v37;
  uint64_t v38;
  uint64_t v39;
  char v40;
  uint64_t v41;
  uint64_t v42;
  _BYTE v44[12];
  int v45;
  uint64_t KeyPath;
  uint64_t v47;
  _BYTE *v48;
  int v49;
  int v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  __int128 v59;
  uint64_t v60;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_256988CD0);
  v57 = *(_QWORD *)(v4 - 8);
  v58 = v4;
  MEMORY[0x24BDAC7A8](v4);
  v6 = &v44[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v54 = __swift_instantiateConcreteTypeFromMangledName(&qword_256988CD8);
  MEMORY[0x24BDAC7A8](v54);
  v8 = &v44[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v56 = __swift_instantiateConcreteTypeFromMangledName(&qword_256988CE0);
  MEMORY[0x24BDAC7A8](v56);
  v10 = &v44[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v55 = __swift_instantiateConcreteTypeFromMangledName(&qword_256988CE8);
  v11 = MEMORY[0x24BDAC7A8](v55);
  v13 = &v44[-((v12 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x24BDAC7A8](v11);
  v48 = &v44[-v14];
  v15 = sub_23A4C03F4();
  v51 = v16;
  v52 = v15;
  v53 = v17;
  v50 = v18 & 1;
  v49 = sub_23A4D5750();
  v19 = (int *)type metadata accessor for TipSnippetContentView.BodyView(0);
  v20 = a1 + v19[5];
  v21 = *(_QWORD *)v20;
  v22 = *(_QWORD *)(v20 + 8);
  v23 = *(_BYTE *)(v20 + 16);
  sub_23A4C256C(*(_QWORD *)v20, v22, v23);
  sub_23A4CE670();
  sub_23A4C2740(v21, v22, v23);
  sub_23A4D54C8();
  v25 = v24;
  v27 = v26;
  v29 = v28;
  v31 = v30;
  v59 = *(_OWORD *)(a1 + v19[9]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_256988CF0);
  sub_23A4D59CC();
  v47 = v60;
  KeyPath = swift_getKeyPath();
  v45 = sub_23A4D5714();
  sub_23A4C0510((uint64_t)v6);
  v59 = *(_OWORD *)(a1 + v19[10]);
  sub_23A4D59CC();
  v32 = v60;
  v33 = swift_getKeyPath();
  v35 = v57;
  v34 = v58;
  (*(void (**)(_BYTE *, _BYTE *, uint64_t))(v57 + 16))(v8, v6, v58);
  v36 = &v8[*(int *)(v54 + 36)];
  *(_QWORD *)v36 = v33;
  *((_QWORD *)v36 + 1) = v32;
  v36[16] = 0;
  (*(void (**)(_BYTE *, uint64_t))(v35 + 8))(v6, v34);
  LODWORD(v33) = sub_23A4D5720();
  sub_23A4C4E68((uint64_t)v8, (uint64_t)v10, &qword_256988CD8);
  *(_DWORD *)&v10[*(int *)(v56 + 36)] = v33;
  sub_23A4BCD14((uint64_t)v8, &qword_256988CD8);
  sub_23A4C4E68((uint64_t)v10, (uint64_t)v13, &qword_256988CE0);
  *(_WORD *)&v13[*(int *)(v55 + 36)] = 256;
  sub_23A4BCD14((uint64_t)v10, &qword_256988CE0);
  v37 = v48;
  sub_23A4C4E94((uint64_t)v13, (uint64_t)v48, &qword_256988CE8);
  sub_23A4C4E68((uint64_t)v37, (uint64_t)v13, &qword_256988CE8);
  v39 = v51;
  v38 = v52;
  *(_QWORD *)a2 = v52;
  *(_QWORD *)(a2 + 8) = v39;
  v40 = v49;
  LOBYTE(v34) = v50;
  *(_BYTE *)(a2 + 16) = v50;
  *(_QWORD *)(a2 + 24) = v53;
  *(_BYTE *)(a2 + 32) = v40;
  *(_QWORD *)(a2 + 40) = v25;
  *(_QWORD *)(a2 + 48) = v27;
  *(_QWORD *)(a2 + 56) = v29;
  *(_QWORD *)(a2 + 64) = v31;
  *(_BYTE *)(a2 + 72) = 0;
  v41 = v47;
  *(_QWORD *)(a2 + 80) = KeyPath;
  *(_QWORD *)(a2 + 88) = v41;
  *(_BYTE *)(a2 + 96) = 0;
  *(_DWORD *)(a2 + 100) = v45;
  *(_WORD *)(a2 + 104) = 256;
  v42 = __swift_instantiateConcreteTypeFromMangledName(&qword_256988CF8);
  sub_23A4C4E68((uint64_t)v13, a2 + *(int *)(v42 + 48), &qword_256988CE8);
  sub_23A4C42E4(v38, v39, v34);
  sub_23A4D4FF4();
  swift_retain();
  sub_23A4BCD14((uint64_t)v37, &qword_256988CE8);
  sub_23A4BCD14((uint64_t)v13, &qword_256988CE8);
  sub_23A4BCD04(v38, v39, v34);
  swift_release();
  return swift_bridgeObjectRelease();
}

uint64_t sub_23A4C195C()
{
  uint64_t v0;
  uint64_t result;

  sub_23A4D5768();
  v0 = sub_23A4D5774();
  result = swift_release();
  qword_256988958 = v0;
  return result;
}

uint64_t sub_23A4C1994()
{
  uint64_t result;
  uint64_t v1;
  char v2;
  uint64_t v3;

  if (qword_2569885A0 != -1)
    swift_once();
  result = sub_23A4D5834();
  qword_256988960 = result;
  *(_QWORD *)algn_256988968 = v1;
  byte_256988970 = v2 & 1;
  qword_256988978 = v3;
  return result;
}

uint64_t sub_23A4C1A0C()
{
  uint64_t result;

  type metadata accessor for CGSize();
  sub_23A4C20B0();
  result = sub_23A4D5AEC();
  qword_256988980 = result;
  return result;
}

uint64_t *sub_23A4C1A58()
{
  if (qword_2569885B0 != -1)
    swift_once();
  return &qword_256988980;
}

uint64_t sub_23A4C1A98(uint64_t *a1, void (*a2)(uint64_t *__return_ptr))
{
  uint64_t v4;

  a2(&v4);
  return sub_23A4C464C(v4, (uint64_t)sub_23A4C4BDC, 0, a1);
}

uint64_t sub_23A4C1AEC@<X0>(uint64_t *a1@<X8>)
{
  *a1 = *sub_23A4C1A58();
  return sub_23A4D4FF4();
}

uint64_t sub_23A4C1B20@<X0>(char a1@<W1>, uint64_t *a2@<X8>)
{
  char v3;
  uint64_t v4;
  uint64_t inited;
  uint64_t v6;
  uint64_t v7;
  uint64_t result;

  v3 = a1 & 1;
  v4 = sub_23A4D5954();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256988AB0);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_23A4D62F0;
  *(_BYTE *)(inited + 32) = v3;
  sub_23A4D5564();
  *(_QWORD *)(inited + 40) = v6;
  *(_QWORD *)(inited + 48) = v7;
  type metadata accessor for CGSize();
  sub_23A4C20B0();
  result = sub_23A4D5AEC();
  *a2 = v4;
  a2[1] = result;
  return result;
}

void sub_23A4C1BC0()
{
  uint64_t v0;
  uint64_t v1;

  *(double *)v0 = OUTLINED_FUNCTION_27();
  *(_QWORD *)(v0 + 8) = v1;
  OUTLINED_FUNCTION_3_0();
}

void sub_23A4C1BDC()
{
  sub_23A4CB31C();
  OUTLINED_FUNCTION_3_0();
}

void sub_23A4C1BFC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t (*a5)(_QWORD), void (*a6)(char *))
{
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;

  v8 = a5(0);
  MEMORY[0x24BDAC7A8](v8);
  v10 = (char *)&v12 - v9;
  (*(void (**)(char *, uint64_t))(v11 + 16))((char *)&v12 - v9, a1);
  a6(v10);
  OUTLINED_FUNCTION_12_0();
}

uint64_t sub_23A4C1C70(uint64_t a1, void (*a2)(uint64_t *__return_ptr), uint64_t a3, void (*a4)(uint64_t *__return_ptr))
{
  uint64_t v7;

  if (sub_23A4D5594())
  {
    a2(&v7);
    swift_retain_n();
    sub_23A4D56FC();
    swift_release_n();
    swift_release();
  }
  else
  {
    a4(&v7);
    sub_23A4D56FC();
  }
  return v7;
}

unint64_t sub_23A4C1D78(char a1)
{
  char v1;
  uint64_t v2;

  v1 = a1 & 1;
  sub_23A4D5CC0();
  sub_23A4D5CCC();
  v2 = sub_23A4D5CD8();
  return sub_23A4C1DD4(v1, v2);
}

unint64_t sub_23A4C1DD4(char a1, uint64_t a2)
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
    if (((((a1 & 1) == 0) ^ *(unsigned __int8 *)(v7 + result)) & 1) == 0)
    {
      v8 = ~v5;
      for (result = (result + 1) & v8;
            ((*(_QWORD *)(v4 + ((result >> 3) & 0xFFFFFFFFFFFFF8)) >> result) & 1) != 0;
            result = (result + 1) & v8)
      {
        if (((((a1 & 1) == 0) ^ *(_BYTE *)(v7 + result)) & 1) != 0)
          break;
      }
    }
  }
  return result;
}

void sub_23A4C1E88()
{
  uint64_t *v0;

  *v0 = OUTLINED_FUNCTION_26();
  OUTLINED_FUNCTION_3_0();
}

void sub_23A4C1EA4()
{
  uint64_t *v0;

  *v0 = OUTLINED_FUNCTION_26();
  OUTLINED_FUNCTION_3_0();
}

void sub_23A4C1EC0()
{
  OUTLINED_FUNCTION_23();
  sub_23A4D563C();
  OUTLINED_FUNCTION_3_0();
}

void sub_23A4C1EE0()
{
  uint64_t *v0;

  *v0 = OUTLINED_FUNCTION_28();
  OUTLINED_FUNCTION_3_0();
}

void sub_23A4C1EFC()
{
  uint64_t *v0;

  *v0 = OUTLINED_FUNCTION_28();
  OUTLINED_FUNCTION_3_0();
}

void sub_23A4C1F18()
{
  OUTLINED_FUNCTION_23();
  sub_23A4D5654();
  OUTLINED_FUNCTION_3_0();
}

uint64_t type metadata accessor for TipSnippetContentView.BodyView(uint64_t a1)
{
  return sub_23A4C1F60(a1, (uint64_t *)&unk_256988B20);
}

uint64_t type metadata accessor for TipSnippetContentView.ImageView(uint64_t a1)
{
  return sub_23A4C1F60(a1, (uint64_t *)&unk_256988BF8);
}

uint64_t sub_23A4C1F60(uint64_t a1, uint64_t *a2)
{
  uint64_t result;

  result = *a2;
  if (!*a2)
    return swift_getSingletonMetadata();
  return result;
}

void sub_23A4C1F90()
{
  sub_23A4D560C();
  OUTLINED_FUNCTION_3_0();
}

void sub_23A4C1FAC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  sub_23A4C1BFC(a1, a2, a3, a4, (uint64_t (*)(_QWORD))MEMORY[0x24BDEB418], MEMORY[0x24BDEDEF8]);
}

uint64_t sub_23A4C1FD4@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v1;

  return sub_23A4C1B20(*(_BYTE *)(v1 + 16), a1);
}

void sub_23A4C1FDC(uint64_t a1, uint64_t a2, uint64_t (*a3)(_QWORD))
{
  uint64_t v3;

  v3 = OUTLINED_FUNCTION_16(a1, a2, a3);
  OUTLINED_FUNCTION_9_2(*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 16));
  OUTLINED_FUNCTION_3_0();
}

void sub_23A4C2008()
{
  uint64_t v0;
  uint64_t v1;

  *(double *)v0 = OUTLINED_FUNCTION_27();
  *(_QWORD *)(v0 + 8) = v1;
  OUTLINED_FUNCTION_3_0();
}

void sub_23A4C2028()
{
  sub_23A4D5600();
  OUTLINED_FUNCTION_3_0();
}

void sub_23A4C2044(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  sub_23A4C1BFC(a1, a2, a3, a4, (uint64_t (*)(_QWORD))MEMORY[0x24BDEB1F0], MEMORY[0x24BDEDEC8]);
}

unint64_t sub_23A4C2074()
{
  unint64_t result;

  result = qword_256988AA8;
  if (!qword_256988AA8)
  {
    result = MEMORY[0x23B84F540](MEMORY[0x24BEE50B8], MEMORY[0x24BEE50B0]);
    atomic_store(result, (unint64_t *)&qword_256988AA8);
  }
  return result;
}

unint64_t sub_23A4C20B0()
{
  unint64_t result;

  result = qword_256988AB8;
  if (!qword_256988AB8)
  {
    result = MEMORY[0x23B84F540](&unk_23A4D6640, &type metadata for TipSnippetContentView.ViewIdentifier);
    atomic_store(result, (unint64_t *)&qword_256988AB8);
  }
  return result;
}

_BYTE *__swift_memcpy1_1(_BYTE *result, _BYTE *a2)
{
  *result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for TipSnippetContentView.ViewIdentifier(unsigned __int8 *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for TipSnippetContentView.ViewIdentifier(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_23A4C21CC + 4 * byte_23A4D6305[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_23A4C2200 + 4 * byte_23A4D6300[v4]))();
}

uint64_t sub_23A4C2200(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_23A4C2208(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x23A4C2210);
  return result;
}

uint64_t sub_23A4C221C(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x23A4C2224);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_23A4C2228(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23A4C2230(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23A4C223C(unsigned __int8 *a1)
{
  return *a1;
}

_BYTE *sub_23A4C2248(_BYTE *result, char a2)
{
  *result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for TipSnippetContentView.ViewIdentifier()
{
  return &type metadata for TipSnippetContentView.ViewIdentifier;
}

uint64_t *sub_23A4C2264(uint64_t *a1, uint64_t *a2, int *a3)
{
  int v5;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  char v13;
  uint64_t v14;
  _QWORD *v15;
  _QWORD *v16;
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
  uint64_t v27;
  uint64_t v28;
  _QWORD *v29;
  _QWORD *v30;
  uint64_t v31;
  _QWORD *v32;
  _QWORD *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  char *v37;
  char *v38;
  _QWORD *v39;
  uint64_t *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  _QWORD *v46;
  uint64_t v47;
  uint64_t v48;
  char *v49;
  uint64_t v50;
  void (*v51)(char *, char *, uint64_t);
  char *v53;

  v5 = *(_DWORD *)(*((_QWORD *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v18 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v18 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    v7 = __swift_instantiateConcreteTypeFromMangledName(qword_256988AC0);
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a1, a2, v7);
    v8 = a3[5];
    v9 = (char *)a1 + v8;
    v10 = (char *)a2 + v8;
    v11 = *(_QWORD *)v10;
    v12 = *((_QWORD *)v10 + 1);
    v13 = v10[16];
    sub_23A4C256C(*(_QWORD *)v10, v12, v13);
    *(_QWORD *)v9 = v11;
    *((_QWORD *)v9 + 1) = v12;
    v9[16] = v13;
    v14 = a3[6];
    v15 = (uint64_t *)((char *)a1 + v14);
    v16 = (uint64_t *)((char *)a2 + v14);
    __swift_instantiateConcreteTypeFromMangledName(&qword_256988A90);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v17 = sub_23A4D54EC();
      (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v17 - 8) + 16))(v15, v16, v17);
    }
    else
    {
      *v15 = *v16;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
    v19 = a3[7];
    v20 = (uint64_t *)((char *)a1 + v19);
    v21 = (uint64_t *)((char *)a2 + v19);
    __swift_instantiateConcreteTypeFromMangledName(&qword_256988A98);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v22 = sub_23A4D54D4();
      (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v22 - 8) + 16))(v20, v21, v22);
    }
    else
    {
      *v20 = *v21;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
    v23 = a3[8];
    v24 = (uint64_t *)((char *)a1 + v23);
    v25 = (uint64_t *)((char *)a2 + v23);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2569887D8);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v26 = sub_23A4D55AC();
      (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v26 - 8) + 16))(v24, v25, v26);
    }
    else
    {
      *v24 = *v25;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
    v27 = a3[9];
    v28 = a3[10];
    v29 = (uint64_t *)((char *)a1 + v27);
    v30 = (uint64_t *)((char *)a2 + v27);
    v31 = v30[1];
    *v29 = *v30;
    v29[1] = v31;
    v32 = (uint64_t *)((char *)a1 + v28);
    v33 = (uint64_t *)((char *)a2 + v28);
    v34 = v33[1];
    *v32 = *v33;
    v32[1] = v34;
    v35 = a3[11];
    v36 = a3[12];
    v37 = (char *)a1 + v35;
    v38 = (char *)a2 + v35;
    *(_OWORD *)v37 = *(_OWORD *)v38;
    *((_QWORD *)v37 + 2) = *((_QWORD *)v38 + 2);
    v39 = (uint64_t *)((char *)a1 + v36);
    v40 = (uint64_t *)((char *)a2 + v36);
    v41 = *v40;
    v42 = v40[1];
    v43 = a3[13];
    v44 = a3[14];
    v45 = *(uint64_t *)((char *)a2 + v43);
    *v39 = v41;
    v39[1] = v42;
    *(uint64_t *)((char *)a1 + v43) = v45;
    v46 = (uint64_t *)((char *)a1 + v44);
    v47 = *(uint64_t *)((char *)a2 + v44 + 8);
    v48 = a3[15];
    v53 = (char *)a2 + v48;
    v49 = (char *)a1 + v48;
    *v46 = *(uint64_t *)((char *)a2 + v44);
    v46[1] = v47;
    v50 = sub_23A4D581C();
    v51 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v50 - 8) + 16);
    swift_retain();
    swift_retain();
    swift_retain();
    sub_23A4D4FF4();
    sub_23A4D4FF4();
    sub_23A4D4FF4();
    v51(v49, v53, v50);
  }
  return a1;
}

uint64_t sub_23A4C256C(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t result;

  if ((a3 & 1) == 0)
    return swift_retain();
  return result;
}

uint64_t sub_23A4C2578(uint64_t a1, int *a2)
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

  v4 = __swift_instantiateConcreteTypeFromMangledName(qword_256988AC0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(a1, v4);
  sub_23A4C2740(*(_QWORD *)(a1 + a2[5]), *(_QWORD *)(a1 + a2[5] + 8), *(_BYTE *)(a1 + a2[5] + 16));
  v5 = a1 + a2[6];
  __swift_instantiateConcreteTypeFromMangledName(&qword_256988A90);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v6 = sub_23A4D54EC();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 8))(v5, v6);
  }
  else
  {
    swift_release();
  }
  v7 = a1 + a2[7];
  __swift_instantiateConcreteTypeFromMangledName(&qword_256988A98);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v8 = sub_23A4D54D4();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 8))(v7, v8);
  }
  else
  {
    swift_release();
  }
  v9 = a1 + a2[8];
  __swift_instantiateConcreteTypeFromMangledName(&qword_2569887D8);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v10 = sub_23A4D55AC();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 8))(v9, v10);
  }
  else
  {
    swift_release();
  }
  swift_release();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v11 = a1 + a2[15];
  v12 = sub_23A4D581C();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 8))(v11, v12);
}

uint64_t sub_23A4C2740(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t result;

  if ((a3 & 1) == 0)
    return swift_release();
  return result;
}

uint64_t sub_23A4C274C(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char v12;
  uint64_t v13;
  _QWORD *v14;
  _QWORD *v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD *v18;
  _QWORD *v19;
  uint64_t v20;
  uint64_t v21;
  _QWORD *v22;
  _QWORD *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  _QWORD *v27;
  _QWORD *v28;
  uint64_t v29;
  _QWORD *v30;
  _QWORD *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  _QWORD *v37;
  uint64_t *v38;
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
  void (*v49)(uint64_t, uint64_t, uint64_t);
  uint64_t v51;

  v6 = __swift_instantiateConcreteTypeFromMangledName(qword_256988AC0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(a1, a2, v6);
  v7 = a3[5];
  v8 = a1 + v7;
  v9 = a2 + v7;
  v10 = *(_QWORD *)v9;
  v11 = *(_QWORD *)(v9 + 8);
  v12 = *(_BYTE *)(v9 + 16);
  sub_23A4C256C(*(_QWORD *)v9, v11, v12);
  *(_QWORD *)v8 = v10;
  *(_QWORD *)(v8 + 8) = v11;
  *(_BYTE *)(v8 + 16) = v12;
  v13 = a3[6];
  v14 = (_QWORD *)(a1 + v13);
  v15 = (_QWORD *)(a2 + v13);
  __swift_instantiateConcreteTypeFromMangledName(&qword_256988A90);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v16 = sub_23A4D54EC();
    (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v16 - 8) + 16))(v14, v15, v16);
  }
  else
  {
    *v14 = *v15;
    swift_retain();
  }
  swift_storeEnumTagMultiPayload();
  v17 = a3[7];
  v18 = (_QWORD *)(a1 + v17);
  v19 = (_QWORD *)(a2 + v17);
  __swift_instantiateConcreteTypeFromMangledName(&qword_256988A98);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v20 = sub_23A4D54D4();
    (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v20 - 8) + 16))(v18, v19, v20);
  }
  else
  {
    *v18 = *v19;
    swift_retain();
  }
  swift_storeEnumTagMultiPayload();
  v21 = a3[8];
  v22 = (_QWORD *)(a1 + v21);
  v23 = (_QWORD *)(a2 + v21);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2569887D8);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v24 = sub_23A4D55AC();
    (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v24 - 8) + 16))(v22, v23, v24);
  }
  else
  {
    *v22 = *v23;
    swift_retain();
  }
  swift_storeEnumTagMultiPayload();
  v25 = a3[9];
  v26 = a3[10];
  v27 = (_QWORD *)(a1 + v25);
  v28 = (_QWORD *)(a2 + v25);
  v29 = v28[1];
  *v27 = *v28;
  v27[1] = v29;
  v30 = (_QWORD *)(a1 + v26);
  v31 = (_QWORD *)(a2 + v26);
  v32 = v31[1];
  *v30 = *v31;
  v30[1] = v32;
  v33 = a3[11];
  v34 = a3[12];
  v35 = a1 + v33;
  v36 = a2 + v33;
  *(_OWORD *)v35 = *(_OWORD *)v36;
  *(_QWORD *)(v35 + 16) = *(_QWORD *)(v36 + 16);
  v37 = (_QWORD *)(a1 + v34);
  v38 = (uint64_t *)(a2 + v34);
  v39 = *v38;
  v40 = v38[1];
  v41 = a3[13];
  v42 = a3[14];
  v43 = *(_QWORD *)(a2 + v41);
  *v37 = v39;
  v37[1] = v40;
  *(_QWORD *)(a1 + v41) = v43;
  v44 = (_QWORD *)(a1 + v42);
  v45 = *(_QWORD *)(a2 + v42 + 8);
  v46 = a3[15];
  v51 = a2 + v46;
  v47 = a1 + v46;
  *v44 = *(_QWORD *)(a2 + v42);
  v44[1] = v45;
  v48 = sub_23A4D581C();
  v49 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v48 - 8) + 16);
  swift_retain();
  swift_retain();
  swift_retain();
  sub_23A4D4FF4();
  sub_23A4D4FF4();
  sub_23A4D4FF4();
  v49(v47, v51, v48);
  return a1;
}

uint64_t sub_23A4C2A28(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char v12;
  uint64_t v13;
  uint64_t v14;
  char v15;
  uint64_t v16;
  _QWORD *v17;
  _QWORD *v18;
  uint64_t v19;
  uint64_t v20;
  _QWORD *v21;
  _QWORD *v22;
  uint64_t v23;
  uint64_t v24;
  _QWORD *v25;
  _QWORD *v26;
  uint64_t v27;
  uint64_t v28;
  _QWORD *v29;
  _QWORD *v30;
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
  _QWORD *v41;
  _QWORD *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;

  v6 = __swift_instantiateConcreteTypeFromMangledName(qword_256988AC0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 24))(a1, a2, v6);
  v7 = a3[5];
  v8 = a1 + v7;
  v9 = a2 + v7;
  v10 = *(_QWORD *)v9;
  v11 = *(_QWORD *)(v9 + 8);
  v12 = *(_BYTE *)(v9 + 16);
  sub_23A4C256C(*(_QWORD *)v9, v11, v12);
  v13 = *(_QWORD *)v8;
  v14 = *(_QWORD *)(v8 + 8);
  v15 = *(_BYTE *)(v8 + 16);
  *(_QWORD *)v8 = v10;
  *(_QWORD *)(v8 + 8) = v11;
  *(_BYTE *)(v8 + 16) = v12;
  sub_23A4C2740(v13, v14, v15);
  if (a1 != a2)
  {
    v16 = a3[6];
    v17 = (_QWORD *)(a1 + v16);
    v18 = (_QWORD *)(a2 + v16);
    sub_23A4BCD14(a1 + v16, &qword_256988A90);
    __swift_instantiateConcreteTypeFromMangledName(&qword_256988A90);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v19 = sub_23A4D54EC();
      (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v19 - 8) + 16))(v17, v18, v19);
    }
    else
    {
      *v17 = *v18;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
    v20 = a3[7];
    v21 = (_QWORD *)(a1 + v20);
    v22 = (_QWORD *)(a2 + v20);
    sub_23A4BCD14(a1 + v20, &qword_256988A98);
    __swift_instantiateConcreteTypeFromMangledName(&qword_256988A98);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v23 = sub_23A4D54D4();
      (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v23 - 8) + 16))(v21, v22, v23);
    }
    else
    {
      *v21 = *v22;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
    v24 = a3[8];
    v25 = (_QWORD *)(a1 + v24);
    v26 = (_QWORD *)(a2 + v24);
    sub_23A4BCD14(a1 + v24, &qword_2569887D8);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2569887D8);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v27 = sub_23A4D55AC();
      (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v27 - 8) + 16))(v25, v26, v27);
    }
    else
    {
      *v25 = *v26;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
  }
  v28 = a3[9];
  v29 = (_QWORD *)(a1 + v28);
  v30 = (_QWORD *)(a2 + v28);
  *v29 = *v30;
  v29[1] = v30[1];
  swift_retain();
  swift_release();
  v31 = a3[10];
  v32 = (_QWORD *)(a1 + v31);
  v33 = (_QWORD *)(a2 + v31);
  *v32 = *v33;
  v32[1] = v33[1];
  swift_retain();
  swift_release();
  v34 = a3[11];
  v35 = (_QWORD *)(a1 + v34);
  v36 = (_QWORD *)(a2 + v34);
  *v35 = *v36;
  v35[1] = v36[1];
  v35[2] = v36[2];
  swift_retain();
  swift_release();
  v37 = a3[12];
  v38 = (_QWORD *)(a1 + v37);
  v39 = (_QWORD *)(a2 + v37);
  *v38 = *v39;
  v38[1] = v39[1];
  sub_23A4D4FF4();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + a3[13]) = *(_QWORD *)(a2 + a3[13]);
  sub_23A4D4FF4();
  swift_bridgeObjectRelease();
  v40 = a3[14];
  v41 = (_QWORD *)(a1 + v40);
  v42 = (_QWORD *)(a2 + v40);
  *v41 = *v42;
  v41[1] = v42[1];
  sub_23A4D4FF4();
  swift_bridgeObjectRelease();
  v43 = a3[15];
  v44 = a1 + v43;
  v45 = a2 + v43;
  v46 = sub_23A4D581C();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v46 - 8) + 24))(v44, v45, v46);
  return a1;
}

uint64_t sub_23A4C2D94(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  const void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  const void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  const void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  __int128 v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;

  v6 = __swift_instantiateConcreteTypeFromMangledName(qword_256988AC0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 32))(a1, a2, v6);
  v7 = a3[5];
  v8 = a3[6];
  v9 = a1 + v7;
  v10 = a2 + v7;
  *(_OWORD *)v9 = *(_OWORD *)v10;
  *(_BYTE *)(v9 + 16) = *(_BYTE *)(v10 + 16);
  v11 = (void *)(a1 + v8);
  v12 = (const void *)(a2 + v8);
  v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_256988A90);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v14 = sub_23A4D54EC();
    (*(void (**)(void *, const void *, uint64_t))(*(_QWORD *)(v14 - 8) + 32))(v11, v12, v14);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(v11, v12, *(_QWORD *)(*(_QWORD *)(v13 - 8) + 64));
  }
  v15 = a3[7];
  v16 = (void *)(a1 + v15);
  v17 = (const void *)(a2 + v15);
  v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_256988A98);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v19 = sub_23A4D54D4();
    (*(void (**)(void *, const void *, uint64_t))(*(_QWORD *)(v19 - 8) + 32))(v16, v17, v19);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(v16, v17, *(_QWORD *)(*(_QWORD *)(v18 - 8) + 64));
  }
  v20 = a3[8];
  v21 = (void *)(a1 + v20);
  v22 = (const void *)(a2 + v20);
  v23 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569887D8);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v24 = sub_23A4D55AC();
    (*(void (**)(void *, const void *, uint64_t))(*(_QWORD *)(v24 - 8) + 32))(v21, v22, v24);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(v21, v22, *(_QWORD *)(*(_QWORD *)(v23 - 8) + 64));
  }
  v25 = a3[10];
  *(_OWORD *)(a1 + a3[9]) = *(_OWORD *)(a2 + a3[9]);
  *(_OWORD *)(a1 + v25) = *(_OWORD *)(a2 + v25);
  v26 = a3[11];
  v27 = a3[12];
  v28 = a1 + v26;
  v29 = a2 + v26;
  *(_OWORD *)v28 = *(_OWORD *)v29;
  *(_QWORD *)(v28 + 16) = *(_QWORD *)(v29 + 16);
  *(_OWORD *)(a1 + v27) = *(_OWORD *)(a2 + v27);
  v30 = a3[14];
  *(_QWORD *)(a1 + a3[13]) = *(_QWORD *)(a2 + a3[13]);
  v31 = *(_OWORD *)(a2 + v30);
  v32 = a3[15];
  v33 = a1 + v32;
  v34 = a2 + v32;
  *(_OWORD *)(a1 + v30) = v31;
  v35 = sub_23A4D581C();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v35 - 8) + 32))(v33, v34, v35);
  return a1;
}

uint64_t sub_23A4C2FE8(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char v10;
  uint64_t v11;
  uint64_t v12;
  char v13;
  uint64_t v14;
  void *v15;
  const void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  const void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  const void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  _QWORD *v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  _QWORD *v35;
  uint64_t *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  _QWORD *v43;
  uint64_t *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  _QWORD *v48;
  uint64_t *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;

  v6 = __swift_instantiateConcreteTypeFromMangledName(qword_256988AC0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 40))(a1, a2, v6);
  v7 = a3[5];
  v8 = a1 + v7;
  v9 = a2 + v7;
  v10 = *(_BYTE *)(v9 + 16);
  v11 = *(_QWORD *)v8;
  v12 = *(_QWORD *)(v8 + 8);
  v13 = *(_BYTE *)(v8 + 16);
  *(_OWORD *)v8 = *(_OWORD *)v9;
  *(_BYTE *)(v8 + 16) = v10;
  sub_23A4C2740(v11, v12, v13);
  if (a1 != a2)
  {
    v14 = a3[6];
    v15 = (void *)(a1 + v14);
    v16 = (const void *)(a2 + v14);
    sub_23A4BCD14(a1 + v14, &qword_256988A90);
    v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_256988A90);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v18 = sub_23A4D54EC();
      (*(void (**)(void *, const void *, uint64_t))(*(_QWORD *)(v18 - 8) + 32))(v15, v16, v18);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(v15, v16, *(_QWORD *)(*(_QWORD *)(v17 - 8) + 64));
    }
    v19 = a3[7];
    v20 = (void *)(a1 + v19);
    v21 = (const void *)(a2 + v19);
    sub_23A4BCD14(a1 + v19, &qword_256988A98);
    v22 = __swift_instantiateConcreteTypeFromMangledName(&qword_256988A98);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v23 = sub_23A4D54D4();
      (*(void (**)(void *, const void *, uint64_t))(*(_QWORD *)(v23 - 8) + 32))(v20, v21, v23);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(v20, v21, *(_QWORD *)(*(_QWORD *)(v22 - 8) + 64));
    }
    v24 = a3[8];
    v25 = (void *)(a1 + v24);
    v26 = (const void *)(a2 + v24);
    sub_23A4BCD14(a1 + v24, &qword_2569887D8);
    v27 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569887D8);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v28 = sub_23A4D55AC();
      (*(void (**)(void *, const void *, uint64_t))(*(_QWORD *)(v28 - 8) + 32))(v25, v26, v28);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(v25, v26, *(_QWORD *)(*(_QWORD *)(v27 - 8) + 64));
    }
  }
  v29 = a3[9];
  v30 = (_QWORD *)(a1 + v29);
  v31 = (uint64_t *)(a2 + v29);
  v33 = *v31;
  v32 = v31[1];
  *v30 = v33;
  v30[1] = v32;
  swift_release();
  v34 = a3[10];
  v35 = (_QWORD *)(a1 + v34);
  v36 = (uint64_t *)(a2 + v34);
  v38 = *v36;
  v37 = v36[1];
  *v35 = v38;
  v35[1] = v37;
  swift_release();
  v39 = a3[11];
  v40 = a1 + v39;
  v41 = a2 + v39;
  *(_OWORD *)v40 = *(_OWORD *)v41;
  *(_QWORD *)(v40 + 16) = *(_QWORD *)(v41 + 16);
  swift_release();
  v42 = a3[12];
  v43 = (_QWORD *)(a1 + v42);
  v44 = (uint64_t *)(a2 + v42);
  v46 = *v44;
  v45 = v44[1];
  *v43 = v46;
  v43[1] = v45;
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + a3[13]) = *(_QWORD *)(a2 + a3[13]);
  swift_bridgeObjectRelease();
  v47 = a3[14];
  v48 = (_QWORD *)(a1 + v47);
  v49 = (uint64_t *)(a2 + v47);
  v51 = *v49;
  v50 = v49[1];
  *v48 = v51;
  v48[1] = v50;
  swift_bridgeObjectRelease();
  v52 = a3[15];
  v53 = a1 + v52;
  v54 = a2 + v52;
  v55 = sub_23A4D581C();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v55 - 8) + 40))(v53, v54, v55);
  return a1;
}

uint64_t sub_23A4C32E0()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

void sub_23A4C32EC(uint64_t a1, uint64_t a2, int *a3)
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

  OUTLINED_FUNCTION_18();
  __swift_instantiateConcreteTypeFromMangledName(qword_256988AC0);
  OUTLINED_FUNCTION_7_1();
  if (v9)
  {
    v7 = v6;
    v8 = v4;
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_256988A70);
    OUTLINED_FUNCTION_7_1();
    if (v9)
    {
      v7 = v10;
      v11 = a3[6];
    }
    else
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_256988A68);
      OUTLINED_FUNCTION_7_1();
      if (v12)
      {
        v7 = v13;
        v11 = a3[7];
      }
      else
      {
        __swift_instantiateConcreteTypeFromMangledName(&qword_256988A60);
        OUTLINED_FUNCTION_7_1();
        if (v14)
        {
          v7 = v15;
          v11 = a3[8];
        }
        else
        {
          if ((_DWORD)v3 == 0x7FFFFFFF)
          {
            OUTLINED_FUNCTION_12_0();
            return;
          }
          v7 = OUTLINED_FUNCTION_20();
          v11 = a3[15];
        }
      }
    }
    v8 = v4 + v11;
  }
  OUTLINED_FUNCTION_2_1(v8, v3, v7);
}

uint64_t sub_23A4C33CC()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

void sub_23A4C33D8(uint64_t a1, uint64_t a2, int a3, int *a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char v11;
  uint64_t v12;
  uint64_t v13;
  char v14;
  uint64_t v15;
  char v16;
  uint64_t v17;

  OUTLINED_FUNCTION_18();
  __swift_instantiateConcreteTypeFromMangledName(qword_256988AC0);
  OUTLINED_FUNCTION_8_1();
  if (v11)
  {
    v9 = v8;
    v10 = v5;
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_256988A70);
    OUTLINED_FUNCTION_8_1();
    if (v11)
    {
      v9 = v12;
      v13 = a4[6];
    }
    else
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_256988A68);
      OUTLINED_FUNCTION_8_1();
      if (v14)
      {
        v9 = v15;
        v13 = a4[7];
      }
      else
      {
        __swift_instantiateConcreteTypeFromMangledName(&qword_256988A60);
        OUTLINED_FUNCTION_8_1();
        if (v16)
        {
          v9 = v17;
          v13 = a4[8];
        }
        else
        {
          if (a3 == 0x7FFFFFFF)
          {
            *(_QWORD *)(v5 + a4[13]) = (v4 - 1);
            OUTLINED_FUNCTION_12_0();
            return;
          }
          v9 = OUTLINED_FUNCTION_20();
          v13 = a4[15];
        }
      }
    }
    v10 = v5 + v13;
  }
  OUTLINED_FUNCTION_3_1(v10, v4, v4, v9);
}

void sub_23A4C34B4()
{
  unint64_t v0;
  unint64_t v1;
  unint64_t v2;
  unint64_t v3;
  unint64_t v4;

  sub_23A4C360C();
  if (v0 <= 0x3F)
  {
    sub_23A4C3F2C(319, &qword_256988B38, (uint64_t (*)(uint64_t))MEMORY[0x24BDEB418], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BDEB560]);
    if (v1 <= 0x3F)
    {
      sub_23A4C3F2C(319, &qword_256988B40, (uint64_t (*)(uint64_t))MEMORY[0x24BDEB1F0], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BDEB560]);
      if (v2 <= 0x3F)
      {
        sub_23A4C3F2C(319, qword_256988B48, (uint64_t (*)(uint64_t))MEMORY[0x24BDECF50], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BDEB560]);
        if (v3 <= 0x3F)
        {
          sub_23A4D581C();
          if (v4 <= 0x3F)
            swift_initStructMetadata();
        }
      }
    }
  }
}

void sub_23A4C360C()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_256988B30)
  {
    sub_23A4C2074();
    v0 = sub_23A4D551C();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_256988B30);
  }
}

ValueMetadata *type metadata accessor for ViewSizePreferenceKey()
{
  return &type metadata for ViewSizePreferenceKey;
}

uint64_t *sub_23A4C3674(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;

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
    __swift_instantiateConcreteTypeFromMangledName(&qword_256988A90);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v7 = sub_23A4D54EC();
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a1, a2, v7);
    }
    else
    {
      *a1 = *a2;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
    v9 = *(int *)(a3 + 20);
    v10 = (char *)a1 + v9;
    v11 = (char *)a2 + v9;
    v12 = sub_23A4D50F0();
    if (__swift_getEnumTagSinglePayload((uint64_t)v11, 1, v12))
    {
      v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_256988A80);
      memcpy(v10, v11, *(_QWORD *)(*(_QWORD *)(v13 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v12 - 8) + 16))(v10, v11, v12);
      __swift_storeEnumTagSinglePayload((uint64_t)v10, 0, 1, v12);
    }
  }
  return a1;
}

uint64_t sub_23A4C37BC(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t result;

  __swift_instantiateConcreteTypeFromMangledName(&qword_256988A90);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v4 = sub_23A4D54EC();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(a1, v4);
  }
  else
  {
    swift_release();
  }
  v5 = a1 + *(int *)(a2 + 20);
  v6 = sub_23A4D50F0();
  result = __swift_getEnumTagSinglePayload(v5, 1, v6);
  if (!(_DWORD)result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 8))(v5, v6);
  return result;
}

_QWORD *sub_23A4C3868(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  char *v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;

  __swift_instantiateConcreteTypeFromMangledName(&qword_256988A90);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v6 = sub_23A4D54EC();
    (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(a1, a2, v6);
  }
  else
  {
    *a1 = *a2;
    swift_retain();
  }
  swift_storeEnumTagMultiPayload();
  v7 = *(int *)(a3 + 20);
  v8 = (char *)a1 + v7;
  v9 = (char *)a2 + v7;
  v10 = sub_23A4D50F0();
  if (__swift_getEnumTagSinglePayload((uint64_t)v9, 1, v10))
  {
    v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_256988A80);
    memcpy(v8, v9, *(_QWORD *)(*(_QWORD *)(v11 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v10 - 8) + 16))(v8, v9, v10);
    __swift_storeEnumTagSinglePayload((uint64_t)v8, 0, 1, v10);
  }
  return a1;
}

_QWORD *sub_23A4C3984(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  char *v8;
  char *v9;
  uint64_t v10;
  int EnumTagSinglePayload;
  int v12;
  uint64_t v13;
  uint64_t v14;

  if (a1 != a2)
  {
    sub_23A4BCD14((uint64_t)a1, &qword_256988A90);
    __swift_instantiateConcreteTypeFromMangledName(&qword_256988A90);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v6 = sub_23A4D54EC();
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
  v8 = (char *)a1 + v7;
  v9 = (char *)a2 + v7;
  v10 = sub_23A4D50F0();
  EnumTagSinglePayload = __swift_getEnumTagSinglePayload((uint64_t)v8, 1, v10);
  v12 = __swift_getEnumTagSinglePayload((uint64_t)v9, 1, v10);
  if (!EnumTagSinglePayload)
  {
    v13 = *(_QWORD *)(v10 - 8);
    if (!v12)
    {
      (*(void (**)(char *, char *, uint64_t))(v13 + 24))(v8, v9, v10);
      return a1;
    }
    (*(void (**)(char *, uint64_t))(v13 + 8))(v8, v10);
    goto LABEL_11;
  }
  if (v12)
  {
LABEL_11:
    v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_256988A80);
    memcpy(v8, v9, *(_QWORD *)(*(_QWORD *)(v14 - 8) + 64));
    return a1;
  }
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v10 - 8) + 16))(v8, v9, v10);
  __swift_storeEnumTagSinglePayload((uint64_t)v8, 0, 1, v10);
  return a1;
}

char *sub_23A4C3B08(char *a1, char *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_256988A90);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v7 = sub_23A4D54EC();
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v7 - 8) + 32))(a1, a2, v7);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v6 - 8) + 64));
  }
  v8 = *(int *)(a3 + 20);
  v9 = &a1[v8];
  v10 = &a2[v8];
  v11 = sub_23A4D50F0();
  if (__swift_getEnumTagSinglePayload((uint64_t)v10, 1, v11))
  {
    v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_256988A80);
    memcpy(v9, v10, *(_QWORD *)(*(_QWORD *)(v12 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v11 - 8) + 32))(v9, v10, v11);
    __swift_storeEnumTagSinglePayload((uint64_t)v9, 0, 1, v11);
  }
  return a1;
}

char *sub_23A4C3C20(char *a1, char *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  char *v10;
  uint64_t v11;
  int EnumTagSinglePayload;
  int v13;
  uint64_t v14;
  uint64_t v15;

  if (a1 != a2)
  {
    sub_23A4BCD14((uint64_t)a1, &qword_256988A90);
    v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_256988A90);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v7 = sub_23A4D54EC();
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
  v11 = sub_23A4D50F0();
  EnumTagSinglePayload = __swift_getEnumTagSinglePayload((uint64_t)v9, 1, v11);
  v13 = __swift_getEnumTagSinglePayload((uint64_t)v10, 1, v11);
  if (!EnumTagSinglePayload)
  {
    v14 = *(_QWORD *)(v11 - 8);
    if (!v13)
    {
      (*(void (**)(char *, char *, uint64_t))(v14 + 40))(v9, v10, v11);
      return a1;
    }
    (*(void (**)(char *, uint64_t))(v14 + 8))(v9, v11);
    goto LABEL_10;
  }
  if (v13)
  {
LABEL_10:
    v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_256988A80);
    memcpy(v9, v10, *(_QWORD *)(*(_QWORD *)(v15 - 8) + 64));
    return a1;
  }
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v11 - 8) + 32))(v9, v10, v11);
  __swift_storeEnumTagSinglePayload((uint64_t)v9, 0, 1, v11);
  return a1;
}

uint64_t sub_23A4C3DA0()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_23A4C3DAC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v6;
  char v7;
  uint64_t v8;
  uint64_t v9;

  OUTLINED_FUNCTION_18();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256988A70);
  OUTLINED_FUNCTION_7_1();
  if (v7)
  {
    v8 = v6;
    v9 = v4;
  }
  else
  {
    v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_256988A80);
    v9 = v4 + *(int *)(a3 + 20);
  }
  return OUTLINED_FUNCTION_2_1(v9, v3, v8);
}

uint64_t sub_23A4C3E08()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_23A4C3E14(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v7;
  char v8;
  uint64_t v9;
  uint64_t v10;

  OUTLINED_FUNCTION_18();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256988A70);
  OUTLINED_FUNCTION_8_1();
  if (v8)
  {
    v9 = v7;
    v10 = v5;
  }
  else
  {
    v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_256988A80);
    v10 = v5 + *(int *)(a4 + 20);
  }
  return OUTLINED_FUNCTION_3_1(v10, v4, v4, v9);
}

void sub_23A4C3E78()
{
  unint64_t v0;
  unint64_t v1;

  sub_23A4C3F2C(319, &qword_256988B38, (uint64_t (*)(uint64_t))MEMORY[0x24BDEB418], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BDEB560]);
  if (v0 <= 0x3F)
  {
    sub_23A4C3F2C(319, qword_256988C08, (uint64_t (*)(uint64_t))MEMORY[0x24BE2C068], MEMORY[0x24BEE1C68]);
    if (v1 <= 0x3F)
      swift_initStructMetadata();
  }
}

void sub_23A4C3F2C(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t), uint64_t (*a4)(uint64_t, uint64_t))
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

unint64_t sub_23A4C3F88()
{
  unint64_t result;
  uint64_t v1;
  unint64_t v2;
  uint64_t v3;
  _QWORD v4[2];

  result = qword_256988C38;
  if (!qword_256988C38)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256988A58);
    v2 = sub_23A4C400C();
    sub_23A4BCDDC(&qword_256988C90, &qword_256988C98);
    v4[0] = v2;
    v4[1] = v3;
    result = MEMORY[0x23B84F540](MEMORY[0x24BDED308], v1, v4);
    atomic_store(result, (unint64_t *)&qword_256988C38);
  }
  return result;
}

unint64_t sub_23A4C400C()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_256988C40;
  if (!qword_256988C40)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256988A40);
    v2[0] = sub_23A4C4078();
    v2[1] = sub_23A4C4204();
    result = MEMORY[0x23B84F540](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_256988C40);
  }
  return result;
}

unint64_t sub_23A4C4078()
{
  unint64_t result;
  uint64_t v1;
  unint64_t v2;
  uint64_t v3;
  _QWORD v4[2];

  result = qword_256988C48;
  if (!qword_256988C48)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256988A38);
    v2 = sub_23A4C40FC();
    sub_23A4BCDDC(&qword_256988C78, &qword_256988C80);
    v4[0] = v2;
    v4[1] = v3;
    result = MEMORY[0x23B84F540](MEMORY[0x24BDED308], v1, v4);
    atomic_store(result, (unint64_t *)&qword_256988C48);
  }
  return result;
}

unint64_t sub_23A4C40FC()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_256988C50;
  if (!qword_256988C50)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256988A30);
    v2[0] = sub_23A4C4168();
    v2[1] = MEMORY[0x24BDECC60];
    result = MEMORY[0x23B84F540](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_256988C50);
  }
  return result;
}

unint64_t sub_23A4C4168()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD v5[2];

  result = qword_256988C58;
  if (!qword_256988C58)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256988A28);
    sub_23A4BCDDC(&qword_256988C60, &qword_256988A20);
    v3 = v2;
    sub_23A4BCDDC(&qword_256988C68, &qword_256988C70);
    v5[0] = v3;
    v5[1] = v4;
    result = MEMORY[0x23B84F540](MEMORY[0x24BDED308], v1, v5);
    atomic_store(result, (unint64_t *)&qword_256988C58);
  }
  return result;
}

unint64_t sub_23A4C4204()
{
  unint64_t result;

  result = qword_256988C88;
  if (!qword_256988C88)
  {
    result = MEMORY[0x23B84F540](&unk_23A4D6A74, &unk_250B63918);
    atomic_store(result, (unint64_t *)&qword_256988C88);
  }
  return result;
}

uint64_t sub_23A4C4240()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_23A4C4250()
{
  return swift_getOpaqueTypeConformance2();
}

unint64_t sub_23A4C4264()
{
  unint64_t result;

  result = qword_256988CA0;
  if (!qword_256988CA0)
  {
    result = MEMORY[0x23B84F540](&unk_23A4D6618, &type metadata for TipSnippetContentView.ViewIdentifier);
    atomic_store(result, (unint64_t *)&qword_256988CA0);
  }
  return result;
}

unint64_t sub_23A4C42A0()
{
  unint64_t result;

  result = qword_256988CC0;
  if (!qword_256988CC0)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_256988CC0);
  }
  return result;
}

uint64_t sub_23A4C42E4(uint64_t a1, uint64_t a2, char a3)
{
  if ((a3 & 1) != 0)
    return swift_retain();
  else
    return sub_23A4D4FF4();
}

void sub_23A4C42F8(uint64_t a1, uint64_t a2, uint64_t (*a3)(_QWORD))
{
  uint64_t v3;

  v3 = OUTLINED_FUNCTION_16(a1, a2, a3);
  OUTLINED_FUNCTION_9_2(*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 32));
  OUTLINED_FUNCTION_3_0();
}

void sub_23A4C4324(double a1, double a2)
{
  OUTLINED_FUNCTION_17();
  sub_23A4C0E3C(a1, a2);
}

uint64_t objectdestroy_41Tm()
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

  v1 = type metadata accessor for TipSnippetContentView.BodyView(0);
  v2 = *(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80);
  v3 = v0 + ((v2 + 16) & ~v2);
  v4 = __swift_instantiateConcreteTypeFromMangledName(qword_256988AC0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  sub_23A4C2740(*(_QWORD *)(v3 + *(int *)(v1 + 20)), *(_QWORD *)(v3 + *(int *)(v1 + 20) + 8), *(_BYTE *)(v3 + *(int *)(v1 + 20) + 16));
  __swift_instantiateConcreteTypeFromMangledName(&qword_256988A90);
  if (OUTLINED_FUNCTION_14() == 1)
  {
    v5 = sub_23A4D54EC();
    OUTLINED_FUNCTION_5_1(v5);
  }
  else
  {
    OUTLINED_FUNCTION_24();
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_256988A98);
  if (OUTLINED_FUNCTION_14() == 1)
  {
    v6 = sub_23A4D54D4();
    OUTLINED_FUNCTION_5_1(v6);
  }
  else
  {
    OUTLINED_FUNCTION_24();
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_2569887D8);
  if (OUTLINED_FUNCTION_14() == 1)
  {
    v7 = sub_23A4D55AC();
    OUTLINED_FUNCTION_5_1(v7);
  }
  else
  {
    OUTLINED_FUNCTION_24();
  }
  OUTLINED_FUNCTION_29();
  OUTLINED_FUNCTION_29();
  swift_release();
  OUTLINED_FUNCTION_30();
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_30();
  v8 = OUTLINED_FUNCTION_20();
  OUTLINED_FUNCTION_0_0(v8);
  return swift_deallocObject();
}

unint64_t sub_23A4C44E0()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD v4[4];

  result = qword_256988D38;
  if (!qword_256988D38)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256988D10);
    v2 = sub_23A4D548C();
    sub_23A4BCE10(&qword_256988D30, (void (*)(uint64_t))MEMORY[0x24BEB7ED8]);
    v4[2] = v2;
    v4[3] = v3;
    v4[0] = swift_getOpaqueTypeConformance2();
    v4[1] = MEMORY[0x24BDF0910];
    result = MEMORY[0x23B84F540](MEMORY[0x24BDED308], v1, v4);
    atomic_store(result, (unint64_t *)&qword_256988D38);
  }
  return result;
}

void sub_23A4C458C()
{
  OUTLINED_FUNCTION_17();
  sub_23A4C12C8();
}

unint64_t sub_23A4C45A4()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;

  result = qword_256988D48;
  if (!qword_256988D48)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256988818);
    v2 = MEMORY[0x24BEE0D28];
    result = MEMORY[0x23B84F540](MEMORY[0x24BEE4AB8], v1, &v2);
    atomic_store(result, (unint64_t *)&qword_256988D48);
  }
  return result;
}

unint64_t sub_23A4C4600()
{
  unint64_t result;

  result = qword_256988D58;
  if (!qword_256988D58)
  {
    result = MEMORY[0x23B84F540](MEMORY[0x24BEE0D50], MEMORY[0x24BEE0D00]);
    atomic_store(result, (unint64_t *)&qword_256988D58);
  }
  return result;
}

uint64_t sub_23A4C463C(double *a1, char a2, double a3, double a4)
{
  *a1 = a3;
  a1[1] = a4;
  return a2 & 1;
}

uint64_t sub_23A4C464C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  char isUniquelyReferenced_nonNull_native;
  uint64_t v10;

  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  v10 = *a4;
  *a4 = 0x8000000000000000;
  sub_23A4C46D4(a1, a2, a3, isUniquelyReferenced_nonNull_native, &v10);
  *a4 = v10;
  return swift_bridgeObjectRelease();
}

uint64_t sub_23A4C46D4(uint64_t a1, uint64_t a2, uint64_t a3, char a4, _QWORD *a5)
{
  char v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t result;
  uint64_t v11;
  uint64_t v12;
  _QWORD *v13;
  char v14;
  char v15;
  unint64_t v16;
  uint64_t v17;
  _BOOL8 v18;
  uint64_t v19;
  char v20;
  unint64_t v21;
  char v22;
  _QWORD *v23;
  _QWORD *v24;
  _QWORD *v25;
  uint64_t v26;
  BOOL v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  __int128 v31;

  sub_23A4C4C20(a1, a2, a3, &v31);
  sub_23A4D4FF4();
  swift_retain();
  v7 = sub_23A4C4C5C();
  if (v7 == 2)
  {
LABEL_2:
    swift_bridgeObjectRelease();
    swift_release();
    sub_23A4C4DC4();
    return swift_release();
  }
  else
  {
    v11 = v8;
    v12 = v9;
    while (1)
    {
      v13 = (_QWORD *)*a5;
      v14 = v7 & 1;
      v16 = sub_23A4C1D78(v7 & 1);
      v17 = v13[2];
      v18 = (v15 & 1) == 0;
      v19 = v17 + v18;
      if (__OFADD__(v17, v18))
        break;
      v20 = v15;
      if (v13[3] >= v19)
      {
        if ((a4 & 1) == 0)
        {
          __swift_instantiateConcreteTypeFromMangledName(&qword_256988D60);
          sub_23A4D5C24();
        }
      }
      else
      {
        sub_23A4C48C8(v19, a4 & 1);
        v21 = sub_23A4C1D78(v14);
        if ((v20 & 1) != (v22 & 1))
          goto LABEL_18;
        v16 = v21;
      }
      v23 = (_QWORD *)*a5;
      if ((v20 & 1) != 0)
      {
        v24 = (_QWORD *)(v23[7] + 16 * v16);
        *v24 = v11;
        v24[1] = v12;
      }
      else
      {
        v23[(v16 >> 6) + 8] |= 1 << v16;
        *(_BYTE *)(v23[6] + v16) = v14;
        v25 = (_QWORD *)(v23[7] + 16 * v16);
        *v25 = v11;
        v25[1] = v12;
        v26 = v23[2];
        v27 = __OFADD__(v26, 1);
        v28 = v26 + 1;
        if (v27)
          goto LABEL_17;
        v23[2] = v28;
      }
      v7 = sub_23A4C4C5C();
      v11 = v29;
      v12 = v30;
      a4 = 1;
      if (v7 == 2)
        goto LABEL_2;
    }
    __break(1u);
LABEL_17:
    __break(1u);
LABEL_18:
    result = sub_23A4D5C78();
    __break(1u);
  }
  return result;
}

uint64_t sub_23A4C48C8(uint64_t a1, char a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v5;
  uint64_t result;
  uint64_t v7;
  int64_t v8;
  _QWORD *v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  int64_t v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t i;
  int64_t v17;
  unint64_t v18;
  int64_t v19;
  char v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  unint64_t v26;
  unint64_t v27;
  char v28;
  unint64_t v29;
  BOOL v30;
  uint64_t v31;
  _QWORD *v32;
  uint64_t v33;
  char v34;

  v3 = v2;
  v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256988D68);
  result = sub_23A4D5C48();
  v7 = result;
  if (*(_QWORD *)(v5 + 16))
  {
    v34 = a2;
    v8 = 0;
    v9 = (_QWORD *)(v5 + 64);
    v10 = 1 << *(_BYTE *)(v5 + 32);
    if (v10 < 64)
      v11 = ~(-1 << v10);
    else
      v11 = -1;
    v12 = v11 & *(_QWORD *)(v5 + 64);
    v13 = (unint64_t)(v10 + 63) >> 6;
    v14 = result + 64;
    if (!v12)
      goto LABEL_7;
LABEL_6:
    v15 = __clz(__rbit64(v12));
    v12 &= v12 - 1;
    for (i = v15 | (v8 << 6); ; i = __clz(__rbit64(v18)) + (v8 << 6))
    {
      v20 = *(_BYTE *)(*(_QWORD *)(v5 + 48) + i);
      v21 = (uint64_t *)(*(_QWORD *)(v5 + 56) + 16 * i);
      v23 = *v21;
      v22 = v21[1];
      sub_23A4D5CC0();
      sub_23A4D5CCC();
      result = sub_23A4D5CD8();
      v24 = -1 << *(_BYTE *)(v7 + 32);
      v25 = result & ~v24;
      v26 = v25 >> 6;
      if (((-1 << v25) & ~*(_QWORD *)(v14 + 8 * (v25 >> 6))) == 0)
      {
        v28 = 0;
        v29 = (unint64_t)(63 - v24) >> 6;
        while (++v26 != v29 || (v28 & 1) == 0)
        {
          v30 = v26 == v29;
          if (v26 == v29)
            v26 = 0;
          v28 |= v30;
          v31 = *(_QWORD *)(v14 + 8 * v26);
          if (v31 != -1)
          {
            v27 = __clz(__rbit64(~v31)) + (v26 << 6);
            goto LABEL_28;
          }
        }
        __break(1u);
LABEL_39:
        __break(1u);
LABEL_40:
        __break(1u);
        return result;
      }
      v27 = __clz(__rbit64((-1 << v25) & ~*(_QWORD *)(v14 + 8 * (v25 >> 6)))) | v25 & 0x7FFFFFFFFFFFFFC0;
LABEL_28:
      *(_QWORD *)(v14 + ((v27 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v27;
      *(_BYTE *)(*(_QWORD *)(v7 + 48) + v27) = v20;
      v32 = (_QWORD *)(*(_QWORD *)(v7 + 56) + 16 * v27);
      *v32 = v23;
      v32[1] = v22;
      ++*(_QWORD *)(v7 + 16);
      if (v12)
        goto LABEL_6;
LABEL_7:
      v17 = v8 + 1;
      if (__OFADD__(v8, 1))
        goto LABEL_39;
      if (v17 >= v13)
        goto LABEL_30;
      v18 = v9[v17];
      ++v8;
      if (!v18)
      {
        v8 = v17 + 1;
        if (v17 + 1 >= v13)
          goto LABEL_30;
        v18 = v9[v8];
        if (!v18)
        {
          v19 = v17 + 2;
          if (v19 >= v13)
          {
LABEL_30:
            if ((v34 & 1) == 0)
            {
              result = swift_release();
              v3 = v2;
              goto LABEL_37;
            }
            v33 = 1 << *(_BYTE *)(v5 + 32);
            if (v33 >= 64)
              sub_23A4C4B94(0, (unint64_t)(v33 + 63) >> 6, (_QWORD *)(v5 + 64));
            else
              *v9 = -1 << v33;
            v3 = v2;
            *(_QWORD *)(v5 + 16) = 0;
            break;
          }
          v18 = v9[v19];
          if (!v18)
          {
            while (1)
            {
              v8 = v19 + 1;
              if (__OFADD__(v19, 1))
                goto LABEL_40;
              if (v8 >= v13)
                goto LABEL_30;
              v18 = v9[v8];
              ++v19;
              if (v18)
                goto LABEL_18;
            }
          }
          v8 = v19;
        }
      }
LABEL_18:
      v12 = (v18 - 1) & v18;
    }
  }
  result = swift_release();
LABEL_37:
  *v3 = v7;
  return result;
}

uint64_t sub_23A4C4B94(uint64_t result, uint64_t a2, _QWORD *a3)
{
  if (a2 < 0)
  {
    __break(1u);
  }
  else
  {
    for (; a2; --a2)
      *a3++ = result;
  }
  return result;
}

uint64_t sub_23A4C4BB0@<X0>(uint64_t a1@<X0>, void (*a2)(uint64_t *__return_ptr)@<X1>, uint64_t a3@<X2>, void (*a4)(uint64_t *__return_ptr)@<X3>, uint64_t a5@<X8>)
{
  uint64_t result;
  char v7;

  result = sub_23A4C1C70(a1, a2, a3, a4);
  *(_QWORD *)a5 = result;
  *(_BYTE *)(a5 + 8) = v7 & 1;
  return result;
}

__n128 sub_23A4C4BDC@<Q0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  char v3;
  __n128 result;
  __n128 v5;

  v3 = sub_23A4C463C(v5.n128_f64, *(_BYTE *)a1, *(double *)(a1 + 8), *(double *)(a1 + 16));
  result = v5;
  *(_BYTE *)a2 = v3 & 1;
  *(__n128 *)(a2 + 8) = result;
  return result;
}

uint64_t sub_23A4C4C20@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, _QWORD *a4@<X8>)
{
  uint64_t v4;
  uint64_t result;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v4 = -1 << *(_BYTE *)(a1 + 32);
  *a4 = a1;
  v7 = *(_QWORD *)(a1 + 64);
  result = a1 + 64;
  v6 = v7;
  a4[1] = result;
  a4[2] = ~v4;
  if (-v4 < 64)
    v8 = ~(-1 << -(char)v4);
  else
    v8 = -1;
  a4[3] = 0;
  a4[4] = v8 & v6;
  a4[5] = a2;
  a4[6] = a3;
  return result;
}

uint64_t sub_23A4C4C5C()
{
  uint64_t *v0;
  uint64_t v1;
  unint64_t v2;
  int64_t v3;
  int64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void (*v9)(uint64_t *__return_ptr, char *);
  __int128 v10;
  uint64_t result;
  int64_t v12;
  int64_t v13;
  uint64_t v14;
  unint64_t v15;
  int64_t v16;
  int64_t v17;
  uint64_t v18;
  char v19[8];
  __int128 v20;

  v1 = *v0;
  v3 = v0[3];
  v2 = v0[4];
  v4 = v3;
  if (v2)
  {
    v5 = (v2 - 1) & v2;
    v6 = __clz(__rbit64(v2)) | (v3 << 6);
LABEL_3:
    v8 = *(_QWORD *)(v1 + 48);
    v7 = *(_QWORD *)(v1 + 56);
    v9 = (void (*)(uint64_t *__return_ptr, char *))v0[5];
    v19[0] = *(_BYTE *)(v8 + v6);
    v10 = *(_OWORD *)(v7 + 16 * v6);
    v0[3] = v4;
    v0[4] = v5;
    v20 = v10;
    v9(&v18, v19);
    return v18;
  }
  v12 = v3 + 1;
  if (__OFADD__(v3, 1))
  {
    __break(1u);
  }
  else
  {
    v13 = (unint64_t)(v0[2] + 64) >> 6;
    if (v12 < v13)
    {
      v14 = v0[1];
      v15 = *(_QWORD *)(v14 + 8 * v12);
      if (v15)
      {
LABEL_7:
        v5 = (v15 - 1) & v15;
        v6 = __clz(__rbit64(v15)) + (v12 << 6);
        v4 = v12;
        goto LABEL_3;
      }
      v16 = v3 + 2;
      v4 = v3 + 1;
      if (v3 + 2 < v13)
      {
        v15 = *(_QWORD *)(v14 + 8 * v16);
        if (v15)
        {
LABEL_10:
          v12 = v16;
          goto LABEL_7;
        }
        v4 = v3 + 2;
        if (v3 + 3 < v13)
        {
          v15 = *(_QWORD *)(v14 + 8 * (v3 + 3));
          if (v15)
          {
            v12 = v3 + 3;
            goto LABEL_7;
          }
          v16 = v3 + 4;
          v4 = v3 + 3;
          if (v3 + 4 < v13)
          {
            v15 = *(_QWORD *)(v14 + 8 * v16);
            if (v15)
              goto LABEL_10;
            v12 = v3 + 5;
            v4 = v3 + 4;
            if (v3 + 5 < v13)
            {
              v15 = *(_QWORD *)(v14 + 8 * v12);
              if (v15)
                goto LABEL_7;
              v4 = v13 - 1;
              v17 = v3 + 6;
              while (v17 < v13)
              {
                v15 = *(_QWORD *)(v14 + 8 * v17++);
                if (v15)
                {
                  v12 = v17 - 1;
                  goto LABEL_7;
                }
              }
            }
          }
        }
      }
    }
    v0[3] = v4;
    v0[4] = 0;
    return 2;
  }
  return result;
}

uint64_t sub_23A4C4DC4()
{
  return swift_release();
}

uint64_t sub_23A4C4DCC()
{
  swift_release();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_23A4C4DF8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;

  return sub_23A4C4BB0(a1, *(void (**)(uint64_t *__return_ptr))(v2 + 16), *(_QWORD *)(v2 + 24), *(void (**)(uint64_t *__return_ptr))(v2 + 32), a2);
}

unint64_t sub_23A4C4E04()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_256988DA8;
  if (!qword_256988DA8)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256988DA0);
    v2[0] = MEMORY[0x24BDF40E8];
    v2[1] = MEMORY[0x24BDF3E20];
    result = MEMORY[0x23B84F540](MEMORY[0x24BDEF3E0], v1, v2);
    atomic_store(result, (unint64_t *)&qword_256988DA8);
  }
  return result;
}

void sub_23A4C4E68(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v3;

  v3 = OUTLINED_FUNCTION_15(a1, a2, a3);
  OUTLINED_FUNCTION_9_2(*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 16));
  OUTLINED_FUNCTION_3_0();
}

void sub_23A4C4E94(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v3;

  v3 = OUTLINED_FUNCTION_15(a1, a2, a3);
  OUTLINED_FUNCTION_9_2(*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 32));
  OUTLINED_FUNCTION_3_0();
}

uint64_t sub_23A4C4EC0()
{
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256988CB0);
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256988CA8);
  sub_23A4BCDDC(&qword_256988CC8, &qword_256988CA8);
  OUTLINED_FUNCTION_32();
  return OUTLINED_FUNCTION_32();
}

unint64_t sub_23A4C4F48()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  result = qword_256988DB8;
  if (!qword_256988DB8)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256988DC0);
    sub_23A4BCDDC(&qword_256988DC8, &qword_256988D98);
    v3 = v2;
    result = MEMORY[0x23B84F540](MEMORY[0x24BDF5578], v1, &v3);
    atomic_store(result, (unint64_t *)&qword_256988DB8);
  }
  return result;
}

uint64_t OUTLINED_FUNCTION_2_1(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return __swift_getEnumTagSinglePayload(a1, a2, a3);
}

uint64_t OUTLINED_FUNCTION_3_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_storeEnumTagSinglePayload(a1, a2, a3, a4);
}

uint64_t OUTLINED_FUNCTION_5_1(uint64_t a1)
{
  uint64_t v1;

  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(a1 - 8) + 8))(v1, a1);
}

uint64_t OUTLINED_FUNCTION_9_2@<X0>(uint64_t (*a1)(uint64_t, uint64_t)@<X8>)
{
  uint64_t v1;
  uint64_t v2;

  return a1(v1, v2);
}

uint64_t OUTLINED_FUNCTION_10_0()
{
  return swift_deallocObject();
}

uint64_t OUTLINED_FUNCTION_13()
{
  uint64_t v0;

  *(_QWORD *)(v0 - 160) = 0;
  *(_QWORD *)(v0 - 152) = 0;
  return sub_23A4D59C0();
}

uint64_t OUTLINED_FUNCTION_14()
{
  return swift_getEnumCaseMultiPayload();
}

uint64_t OUTLINED_FUNCTION_15(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  return __swift_instantiateConcreteTypeFromMangledName(a3);
}

uint64_t OUTLINED_FUNCTION_16(uint64_t a1, uint64_t a2, uint64_t (*a3)(_QWORD))
{
  return a3(0);
}

uint64_t OUTLINED_FUNCTION_17()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(unsigned __int8 *)(*(_QWORD *)(type metadata accessor for TipSnippetContentView.BodyView(0) - 8) + 80);
  return v0 + ((v1 + 16) & ~v1);
}

uint64_t OUTLINED_FUNCTION_20()
{
  return sub_23A4D581C();
}

uint64_t OUTLINED_FUNCTION_22()
{
  return type metadata accessor for TipSnippetContentView(0);
}

uint64_t OUTLINED_FUNCTION_23()
{
  return swift_retain();
}

uint64_t OUTLINED_FUNCTION_24()
{
  return swift_release();
}

uint64_t OUTLINED_FUNCTION_26()
{
  return sub_23A4D5630();
}

double OUTLINED_FUNCTION_27()
{
  return sub_23A4CB2E4();
}

uint64_t OUTLINED_FUNCTION_28()
{
  return sub_23A4D5648();
}

uint64_t OUTLINED_FUNCTION_29()
{
  return swift_release();
}

uint64_t OUTLINED_FUNCTION_30()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_32()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t DeviceExpertUIPlugin.__allocating_init()()
{
  return swift_allocObject();
}

uint64_t DeviceExpertUIPlugin.init()()
{
  uint64_t v0;

  return v0;
}

uint64_t DeviceExpertUIPlugin.snippet(for:mode:idiom:)(uint64_t a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t *v5;
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
  uint64_t *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t *v28;
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
  int v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t (*v47)(uint64_t, uint64_t, uint64_t);
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t (*v51)(uint64_t, uint64_t, uint64_t);
  uint64_t v52;
  uint64_t v53;
  void (*v54)(uint64_t);
  uint64_t v55;
  uint64_t v56;
  unint64_t *v57;
  uint64_t (*v58)();
  void *v59;
  uint64_t v60;
  void (*v61)(uint64_t);
  uint64_t v62;
  uint64_t v63;
  void (*v64)(uint64_t, uint64_t);
  uint64_t result;
  uint64_t *v66;
  uint64_t v67;
  uint64_t *v68;
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

  v69 = type metadata accessor for TipSnippet();
  OUTLINED_FUNCTION_3();
  MEMORY[0x24BDAC7A8](v1);
  OUTLINED_FUNCTION_11_0();
  v68 = v2;
  OUTLINED_FUNCTION_3_2();
  sub_23A4D512C();
  OUTLINED_FUNCTION_3();
  MEMORY[0x24BDAC7A8](v3);
  OUTLINED_FUNCTION_11_0();
  OUTLINED_FUNCTION_3_2();
  v67 = type metadata accessor for SupplementarySnippet();
  OUTLINED_FUNCTION_3();
  MEMORY[0x24BDAC7A8](v4);
  OUTLINED_FUNCTION_11_0();
  v66 = v5;
  OUTLINED_FUNCTION_3_2();
  sub_23A4D5228();
  OUTLINED_FUNCTION_3();
  MEMORY[0x24BDAC7A8](v6);
  OUTLINED_FUNCTION_11_0();
  OUTLINED_FUNCTION_3_2();
  type metadata accessor for SummarizedAnswerSnippet();
  OUTLINED_FUNCTION_3();
  MEMORY[0x24BDAC7A8](v7);
  OUTLINED_FUNCTION_11_0();
  v73 = v8;
  OUTLINED_FUNCTION_3_2();
  v9 = sub_23A4D5348();
  v71 = *(_QWORD *)(v9 - 8);
  v72 = v9;
  OUTLINED_FUNCTION_3();
  MEMORY[0x24BDAC7A8](v10);
  OUTLINED_FUNCTION_11_0();
  v70 = v11;
  OUTLINED_FUNCTION_3_2();
  type metadata accessor for ListStyleAnswerSnippet();
  OUTLINED_FUNCTION_3();
  MEMORY[0x24BDAC7A8](v12);
  OUTLINED_FUNCTION_11_0();
  v77 = v13;
  OUTLINED_FUNCTION_3_2();
  v14 = sub_23A4D52E8();
  v75 = *(_QWORD *)(v14 - 8);
  v76 = v14;
  OUTLINED_FUNCTION_3();
  MEMORY[0x24BDAC7A8](v15);
  OUTLINED_FUNCTION_11_0();
  v74 = v16;
  OUTLINED_FUNCTION_3_2();
  v81 = type metadata accessor for LearnMoreSnippet();
  OUTLINED_FUNCTION_3();
  MEMORY[0x24BDAC7A8](v17);
  OUTLINED_FUNCTION_1();
  v20 = (uint64_t *)(v19 - v18);
  v21 = sub_23A4D51F8();
  v79 = *(_QWORD *)(v21 - 8);
  v80 = v21;
  OUTLINED_FUNCTION_3();
  MEMORY[0x24BDAC7A8](v22);
  OUTLINED_FUNCTION_11_0();
  v78 = v23;
  OUTLINED_FUNCTION_3_2();
  v24 = type metadata accessor for AttributionItemListSnippet();
  OUTLINED_FUNCTION_3();
  MEMORY[0x24BDAC7A8](v25);
  OUTLINED_FUNCTION_1();
  v28 = (uint64_t *)(v27 - v26);
  v29 = sub_23A4D524C();
  v30 = *(_QWORD *)(v29 - 8);
  MEMORY[0x24BDAC7A8](v29);
  OUTLINED_FUNCTION_1();
  v33 = v32 - v31;
  v34 = sub_23A4D5354();
  v35 = *(_QWORD *)(v34 - 8);
  MEMORY[0x24BDAC7A8](v34);
  OUTLINED_FUNCTION_1();
  v38 = v37 - v36;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v35 + 16))(v37 - v36, a1, v34);
  v39 = (*(uint64_t (**)(uint64_t, uint64_t))(v35 + 88))(v38, v34);
  if (v39 == *MEMORY[0x24BE2C268])
  {
    OUTLINED_FUNCTION_1_2();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v30 + 32))(v33, v38, v29);
    (*(void (**)(char *, uint64_t, uint64_t))(v30 + 16))((char *)v28 + *(int *)(v24 + 20), v33, v29);
    OUTLINED_FUNCTION_8_2();
    sub_23A4C5878((unint64_t *)&qword_2569886D0, (uint64_t (*)(uint64_t))MEMORY[0x24BEAE580], MEMORY[0x24BEAE520]);
    *v28 = OUTLINED_FUNCTION_5_2();
    v28[1] = v40;
    OUTLINED_FUNCTION_11_1(&qword_256988DF8, v40, (uint64_t)&unk_23A4D68F8);
    sub_23A4D5864();
    OUTLINED_FUNCTION_9_3();
    (*(void (**)(uint64_t, uint64_t))(v30 + 8))(v33, v29);
    return v34;
  }
  if (v39 == *MEMORY[0x24BE2C288])
  {
    OUTLINED_FUNCTION_1_2();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v79 + 32))(v78, v38, v80);
    (*(void (**)(char *, uint64_t, uint64_t))(v79 + 16))((char *)v20 + *(int *)(v81 + 20), v78, v80);
    OUTLINED_FUNCTION_8_2();
    sub_23A4C5878((unint64_t *)&qword_2569886D0, (uint64_t (*)(uint64_t))MEMORY[0x24BEAE580], MEMORY[0x24BEAE520]);
    *v20 = sub_23A4D55DC();
    v20[1] = v41;
    sub_23A4C5878(&qword_256988DF0, (uint64_t (*)(uint64_t))type metadata accessor for LearnMoreSnippet, (uint64_t)&unk_23A4D6750);
    v34 = sub_23A4D5864();
    sub_23A4C57F8((uint64_t)v20, (uint64_t (*)(_QWORD))type metadata accessor for LearnMoreSnippet);
    (*(void (**)(uint64_t, uint64_t))(v79 + 8))(v78, v80);
    return v34;
  }
  if (v39 == *MEMORY[0x24BE2C270])
  {
    OUTLINED_FUNCTION_1_2();
    v43 = v74;
    v42 = v75;
    v44 = OUTLINED_FUNCTION_10_1();
    v45 = v76;
    OUTLINED_FUNCTION_7_2(v44, v46, v47);
    OUTLINED_FUNCTION_7_2(v77, v74, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v75 + 16));
    OUTLINED_FUNCTION_11_1(&qword_256988DE8, v48, (uint64_t)&unk_23A4D61A8);
LABEL_9:
    sub_23A4D5864();
    OUTLINED_FUNCTION_9_3();
    (*(void (**)(uint64_t, uint64_t))(v42 + 8))(v43, v45);
    return v34;
  }
  if (v39 == *MEMORY[0x24BE2C278])
  {
    OUTLINED_FUNCTION_1_2();
    v43 = v70;
    v42 = v71;
    v49 = OUTLINED_FUNCTION_10_1();
    v45 = v72;
    OUTLINED_FUNCTION_7_2(v49, v50, v51);
    OUTLINED_FUNCTION_7_2(v73, v70, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v71 + 16));
    OUTLINED_FUNCTION_11_1(&qword_256988DE0, v52, (uint64_t)&unk_23A4D6868);
    goto LABEL_9;
  }
  if (v39 == *MEMORY[0x24BE2C260])
  {
    OUTLINED_FUNCTION_1_2();
    v53 = OUTLINED_FUNCTION_10_1();
    v54(v53);
    v55 = (uint64_t)v66;
    OUTLINED_FUNCTION_6_1(*(int *)(v67 + 20));
    OUTLINED_FUNCTION_8_2();
    sub_23A4C5878((unint64_t *)&qword_2569886D0, (uint64_t (*)(uint64_t))MEMORY[0x24BEAE580], MEMORY[0x24BEAE520]);
    *v66 = OUTLINED_FUNCTION_5_2();
    v66[1] = v56;
    v57 = (unint64_t *)&unk_256988DD8;
    v58 = type metadata accessor for SupplementarySnippet;
    v59 = &unk_23A4D6290;
LABEL_14:
    OUTLINED_FUNCTION_11_1(v57, v56, (uint64_t)v59);
    v34 = sub_23A4D5864();
    sub_23A4C57F8(v55, (uint64_t (*)(_QWORD))v58);
    v62 = OUTLINED_FUNCTION_10_1();
    v64(v62, v63);
    return v34;
  }
  if (v39 == *MEMORY[0x24BE2C280])
  {
    OUTLINED_FUNCTION_1_2();
    v60 = OUTLINED_FUNCTION_10_1();
    v61(v60);
    v55 = (uint64_t)v68;
    OUTLINED_FUNCTION_6_1(*(int *)(v69 + 20));
    OUTLINED_FUNCTION_8_2();
    sub_23A4C5878((unint64_t *)&qword_2569886D0, (uint64_t (*)(uint64_t))MEMORY[0x24BEAE580], MEMORY[0x24BEAE520]);
    *v68 = OUTLINED_FUNCTION_5_2();
    v68[1] = v56;
    v57 = (unint64_t *)&unk_256988DD0;
    v58 = type metadata accessor for TipSnippet;
    v59 = &unk_23A4D6140;
    goto LABEL_14;
  }
  result = sub_23A4D5C3C();
  __break(1u);
  return result;
}

uint64_t sub_23A4C57F8(uint64_t a1, uint64_t (*a2)(_QWORD))
{
  uint64_t v3;

  v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t DeviceExpertUIPlugin.deinit()
{
  uint64_t v0;

  return v0;
}

uint64_t DeviceExpertUIPlugin.__deallocating_deinit()
{
  return swift_deallocClassInstance();
}

uint64_t sub_23A4C584C()
{
  return sub_23A4C5878(qword_256988E00, (uint64_t (*)(uint64_t))MEMORY[0x24BE2C290], MEMORY[0x24BE2C258]);
}

uint64_t sub_23A4C5878(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = a2(255);
    result = MEMORY[0x23B84F540](a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_23A4C58B8@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  result = DeviceExpertUIPlugin.__allocating_init()();
  *a1 = result;
  return result;
}

uint64_t sub_23A4C58DC(uint64_t a1)
{
  return DeviceExpertUIPlugin.snippet(for:mode:idiom:)(a1);
}

uint64_t type metadata accessor for DeviceExpertUIPlugin()
{
  return objc_opt_self();
}

uint64_t method lookup function for DeviceExpertUIPlugin()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of DeviceExpertUIPlugin.__allocating_init()()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 80))();
}

uint64_t OUTLINED_FUNCTION_1_2()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 96))(v1, v0);
}

uint64_t OUTLINED_FUNCTION_3_2()
{
  return 0;
}

uint64_t OUTLINED_FUNCTION_5_2()
{
  return sub_23A4D55DC();
}

uint64_t OUTLINED_FUNCTION_6_1@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v3 + 16))(v1 + a1, v4, v2);
}

uint64_t OUTLINED_FUNCTION_7_2@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t (*a3)(uint64_t, uint64_t, uint64_t)@<X8>)
{
  uint64_t v3;

  return a3(a1, a2, v3);
}

uint64_t OUTLINED_FUNCTION_8_2()
{
  return sub_23A4D5AE0();
}

uint64_t OUTLINED_FUNCTION_9_3()
{
  uint64_t (*v0)(_QWORD);
  uint64_t v1;

  return sub_23A4C57F8(v1, v0);
}

uint64_t OUTLINED_FUNCTION_10_1()
{
  uint64_t v0;

  return v0;
}

uint64_t OUTLINED_FUNCTION_11_1(unint64_t *a1, uint64_t a2, uint64_t a3)
{
  uint64_t (*v3)(uint64_t);

  return sub_23A4C5878(a1, v3, a3);
}

void sub_23A4C5994(void *a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  char *v12;
  id v13;
  void *v14;
  void (*v15)(char *, char *, uint64_t);
  uint64_t *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  _BYTE v21[40];

  v3 = sub_23A4D5024();
  v18 = *(_QWORD *)(v3 - 8);
  v19 = v3;
  ((void (*)(void))MEMORY[0x24BDAC7A8])();
  v20 = *(_QWORD *)(OUTLINED_FUNCTION_0_1() - 8);
  ((void (*)(void))MEMORY[0x24BDAC7A8])();
  OUTLINED_FUNCTION_4_3();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2569885E8);
  ((void (*)(void))MEMORY[0x24BDAC7A8])();
  v5 = (char *)&v17 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_23A4D4ED4();
  v7 = *(_QWORD *)(v6 - 8);
  v8 = ((uint64_t (*)(void))MEMORY[0x24BDAC7A8])();
  v10 = (char *)&v17 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v8);
  v12 = (char *)&v17 - v11;
  v13 = objc_msgSend(a1, sel_punchOutUri);
  if (!v13)
  {
    OUTLINED_FUNCTION_5_3((uint64_t)v5, 1);
    goto LABEL_5;
  }
  v14 = v13;
  sub_23A4D4EBC();

  v15 = *(void (**)(char *, char *, uint64_t))(v7 + 32);
  v15(v5, v10, v6);
  OUTLINED_FUNCTION_5_3((uint64_t)v5, 0);
  if (__swift_getEnumTagSinglePayload((uint64_t)v5, 1, v6) == 1)
  {
LABEL_5:
    sub_23A4C5BD0((uint64_t)v5);
    goto LABEL_6;
  }
  v15(v12, v5, v6);
  sub_23A4D500C();
  sub_23A4D5000();
  (*(void (**)(uint64_t, char *, uint64_t))(v7 + 16))(v1, v12, v6);
  (*(void (**)(uint64_t, _QWORD, uint64_t))(v18 + 104))(v1, *MEMORY[0x24BE2BFC0], v19);
  sub_23A4D5030();
  v16 = OUTLINED_FUNCTION_6_2(MEMORY[0x24BE2BFE8]);
  OUTLINED_FUNCTION_2_2((uint64_t)v16);
  sub_23A4D5138();
  OUTLINED_FUNCTION_3_3();
  (*(void (**)(char *, uint64_t))(v7 + 8))(v12, v6);
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v21);
LABEL_6:
  OUTLINED_FUNCTION_1_3();
}

uint64_t sub_23A4C5BD0(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569885E8);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
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

void sub_23A4C5C4C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  _BYTE v7[40];

  v6 = sub_23A4D5024();
  v1 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v2 = OUTLINED_FUNCTION_0_1();
  MEMORY[0x24BDAC7A8](v2);
  OUTLINED_FUNCTION_4_3();
  sub_23A4D500C();
  sub_23A4D5000();
  MEMORY[0x23B84E940]();
  MEMORY[0x23B84E934]();
  v3 = MEMORY[0x23B84E928]();
  if (v3)
  {
    v4 = v1;
    if (*(_QWORD *)(v3 + 16))
      sub_23A4D4FF4();
    swift_bridgeObjectRelease();
  }
  else
  {
    v4 = v1;
  }
  sub_23A4D503C();
  (*(void (**)(uint64_t, _QWORD, uint64_t))(v4 + 104))(v0, *MEMORY[0x24BE2BFC8], v6);
  sub_23A4D5030();
  v5 = OUTLINED_FUNCTION_6_2(MEMORY[0x24BE2BFE8]);
  OUTLINED_FUNCTION_2_2((uint64_t)v5);
  sub_23A4D5138();
  OUTLINED_FUNCTION_3_3();
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v7);
  OUTLINED_FUNCTION_1_3();
}

uint64_t OUTLINED_FUNCTION_0_1()
{
  return sub_23A4D5048();
}

uint64_t OUTLINED_FUNCTION_2_2(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v1 + 16))(a1, v3, v2);
}

uint64_t OUTLINED_FUNCTION_3_3()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(v0 + 8))(v2, v1);
}

uint64_t OUTLINED_FUNCTION_5_3(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  return __swift_storeEnumTagSinglePayload(a1, a2, 1, v2);
}

uint64_t *OUTLINED_FUNCTION_6_2@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v2 - 96) = v1;
  *(_QWORD *)(v2 - 88) = a1;
  return __swift_allocate_boxed_opaque_existential_1((uint64_t *)(v2 - 120));
}

char *sub_23A4C5E3C(char *a1, char **a2, uint64_t a3)
{
  int v3;
  char *v4;
  char *v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(char *, uint64_t, uint64_t);
  char *v11;

  v3 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  v4 = *a2;
  *(_QWORD *)a1 = *a2;
  if ((v3 & 0x20000) != 0)
  {
    v5 = &v4[(v3 + 16) & ~(unint64_t)v3];
    swift_retain();
  }
  else
  {
    v5 = a1;
    *((_QWORD *)a1 + 1) = a2[1];
    v6 = *(int *)(a3 + 20);
    v7 = &a1[v6];
    v8 = (uint64_t)a2 + v6;
    v9 = sub_23A4D51F8();
    v10 = *(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 16);
    v11 = v4;
    v10(v7, v8, v9);
  }
  return v5;
}

uint64_t sub_23A4C5ED8(id *a1, uint64_t a2)
{
  char *v4;
  uint64_t v5;

  v4 = (char *)a1 + *(int *)(a2 + 20);
  v5 = sub_23A4D51F8();
  return (*(uint64_t (**)(char *, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(v4, v5);
}

_QWORD *sub_23A4C5F20(_QWORD *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  void *v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(char *, uint64_t, uint64_t);
  id v11;

  v5 = *(void **)a2;
  v4 = *(_QWORD *)(a2 + 8);
  *a1 = *(_QWORD *)a2;
  a1[1] = v4;
  v6 = *(int *)(a3 + 20);
  v7 = (char *)a1 + v6;
  v8 = a2 + v6;
  v9 = sub_23A4D51F8();
  v10 = *(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 16);
  v11 = v5;
  v10(v7, v8, v9);
  return a1;
}

uint64_t sub_23A4C5F8C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v6 = *(void **)a1;
  v7 = *(void **)a2;
  *(_QWORD *)a1 = *(_QWORD *)a2;
  v8 = v7;

  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  v9 = *(int *)(a3 + 20);
  v10 = a1 + v9;
  v11 = a2 + v9;
  v12 = sub_23A4D51F8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 24))(v10, v11, v12);
  return a1;
}

_OWORD *sub_23A4C6004(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  uint64_t v4;
  char *v5;
  char *v6;
  uint64_t v7;

  *a1 = *a2;
  v4 = *(int *)(a3 + 20);
  v5 = (char *)a1 + v4;
  v6 = (char *)a2 + v4;
  v7 = sub_23A4D51F8();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v7 - 8) + 32))(v5, v6, v7);
  return a1;
}

uint64_t sub_23A4C6060(uint64_t a1, _QWORD *a2, uint64_t a3)
{
  void *v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;

  v6 = *(void **)a1;
  *(_QWORD *)a1 = *a2;

  *(_QWORD *)(a1 + 8) = a2[1];
  v7 = *(int *)(a3 + 20);
  v8 = a1 + v7;
  v9 = (char *)a2 + v7;
  v10 = sub_23A4D51F8();
  (*(void (**)(uint64_t, char *, uint64_t))(*(_QWORD *)(v10 - 8) + 40))(v8, v9, v10);
  return a1;
}

uint64_t sub_23A4C60D4()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_23A4C60E0(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  int v5;
  uint64_t v9;

  if ((_DWORD)a2 == 2147483646)
  {
    v4 = *a1;
    if ((unint64_t)*a1 >= 0xFFFFFFFF)
      LODWORD(v4) = -1;
    v5 = v4 - 1;
    if (v5 < 0)
      v5 = -1;
    return (v5 + 1);
  }
  else
  {
    v9 = OUTLINED_FUNCTION_1_4();
    return __swift_getEnumTagSinglePayload((uint64_t)a1 + *(int *)(a3 + 20), a2, v9);
  }
}

uint64_t sub_23A4C615C()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

_QWORD *sub_23A4C6168(_QWORD *result, uint64_t a2, int a3, uint64_t a4)
{
  _QWORD *v5;
  uint64_t v7;

  v5 = result;
  if (a3 == 2147483646)
  {
    *result = a2;
  }
  else
  {
    v7 = OUTLINED_FUNCTION_1_4();
    return (_QWORD *)__swift_storeEnumTagSinglePayload((uint64_t)v5 + *(int *)(a4 + 20), a2, a2, v7);
  }
  return result;
}

uint64_t type metadata accessor for LearnMoreSnippet()
{
  uint64_t result;

  result = qword_256988E60;
  if (!qword_256988E60)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_23A4C6208()
{
  uint64_t result;
  unint64_t v1;

  result = sub_23A4D51F8();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t sub_23A4C627C()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_23A4C628C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  _QWORD v9[2];

  v1 = OUTLINED_FUNCTION_0_2();
  v2 = *(_QWORD *)(v1 - 8);
  v3 = *(_QWORD *)(v2 + 64);
  MEMORY[0x24BDAC7A8](v1);
  sub_23A4C6518(v0, (uint64_t)v9 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0));
  v4 = (*(unsigned __int8 *)(v2 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  v5 = swift_allocObject();
  sub_23A4C65E4((uint64_t)v9 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0), v5 + v4);
  __swift_instantiateConcreteTypeFromMangledName(&qword_256988E98);
  v6 = sub_23A4D5A74();
  v7 = sub_23A4C665C();
  v9[0] = v6;
  v9[1] = v7;
  swift_getOpaqueTypeConformance2();
  return sub_23A4D5A50();
}

uint64_t sub_23A4C637C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char v12;
  char v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;

  v20 = a1;
  v1 = sub_23A4D4F40();
  v2 = *(_QWORD *)(v1 - 8);
  MEMORY[0x24BDAC7A8](v1);
  v4 = (char *)&v18 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = sub_23A4D5A74();
  v19 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)&v18 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for LearnMoreSnippet();
  v8 = sub_23A4D51EC();
  v9 = sub_23A4C9648(v8);
  v11 = v10;
  v13 = v12;
  v15 = v14;
  swift_bridgeObjectRelease();
  v22 = MEMORY[0x24BDF1FA8];
  v23 = MEMORY[0x24BEAD6B0];
  v16 = swift_allocObject();
  v21 = v16;
  *(_QWORD *)(v16 + 16) = v9;
  *(_QWORD *)(v16 + 24) = v11;
  *(_BYTE *)(v16 + 32) = v13 & 1;
  *(_QWORD *)(v16 + 40) = v15;
  sub_23A4D5A68();
  (*(void (**)(char *, _QWORD, uint64_t))(v2 + 104))(v4, *MEMORY[0x24BEAB4E8], v1);
  sub_23A4C665C();
  sub_23A4D5894();
  (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
  return (*(uint64_t (**)(char *, uint64_t))(v19 + 8))(v7, v5);
}

uint64_t sub_23A4C6518(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for LearnMoreSnippet();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_23A4C655C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  id *v3;
  char *v4;
  uint64_t v5;

  v1 = type metadata accessor for LearnMoreSnippet();
  v2 = *(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80);
  v3 = (id *)(v0 + ((v2 + 16) & ~v2));

  v4 = (char *)v3 + *(int *)(v1 + 20);
  v5 = OUTLINED_FUNCTION_1_4();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(v4, v5);
  return swift_deallocObject();
}

uint64_t sub_23A4C65E4(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for LearnMoreSnippet();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_23A4C6628()
{
  uint64_t v0;

  OUTLINED_FUNCTION_0_2();
  return sub_23A4C637C(v0);
}

unint64_t sub_23A4C665C()
{
  unint64_t result;
  uint64_t v1;

  result = qword_256988810;
  if (!qword_256988810)
  {
    v1 = sub_23A4D5A74();
    result = MEMORY[0x23B84F540](MEMORY[0x24BEADD40], v1);
    atomic_store(result, (unint64_t *)&qword_256988810);
  }
  return result;
}

uint64_t sub_23A4C669C()
{
  uint64_t v0;

  sub_23A4BCD04(*(_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 24), *(_BYTE *)(v0 + 32));
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

unint64_t sub_23A4C66D0()
{
  unint64_t result;
  uint64_t v1;

  result = qword_256988EA0;
  if (!qword_256988EA0)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256988EA8);
    result = MEMORY[0x23B84F540](MEMORY[0x24BEADC00], v1);
    atomic_store(result, (unint64_t *)&qword_256988EA0);
  }
  return result;
}

uint64_t OUTLINED_FUNCTION_0_2()
{
  return type metadata accessor for LearnMoreSnippet();
}

uint64_t OUTLINED_FUNCTION_1_4()
{
  return sub_23A4D51F8();
}

char *sub_23A4C6728(char *a1, char **a2, uint64_t a3)
{
  int v3;
  char *v4;
  char *v5;
  char *v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(char *, uint64_t, uint64_t);
  char *v12;

  v3 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  v4 = *a2;
  *(_QWORD *)a1 = *a2;
  if ((v3 & 0x20000) != 0)
  {
    v5 = &v4[(v3 + 16) & ~(unint64_t)v3];
    swift_retain();
  }
  else
  {
    v5 = a1;
    v6 = a2[2];
    *((_QWORD *)a1 + 1) = a2[1];
    *((_QWORD *)a1 + 2) = v6;
    v7 = *(int *)(a3 + 24);
    v8 = &a1[v7];
    v9 = (uint64_t)a2 + v7;
    v10 = sub_23A4D5018();
    v11 = *(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 16);
    v12 = v4;
    sub_23A4D4FF4();
    v11(v8, v9, v10);
  }
  return v5;
}

uint64_t sub_23A4C67D4(id *a1, uint64_t a2)
{
  char *v4;
  uint64_t v5;

  swift_bridgeObjectRelease();
  v4 = (char *)a1 + *(int *)(a2 + 24);
  v5 = sub_23A4D5018();
  return (*(uint64_t (**)(char *, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(v4, v5);
}

_QWORD *sub_23A4C6824(_QWORD *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  void *v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(char *, uint64_t, uint64_t);
  id v11;

  v5 = *(void **)a2;
  v4 = *(_QWORD *)(a2 + 8);
  *a1 = *(_QWORD *)a2;
  a1[1] = v4;
  a1[2] = *(_QWORD *)(a2 + 16);
  v6 = *(int *)(a3 + 24);
  v7 = (char *)a1 + v6;
  v8 = a2 + v6;
  v9 = sub_23A4D5018();
  v10 = *(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 16);
  v11 = v5;
  sub_23A4D4FF4();
  v10(v7, v8, v9);
  return a1;
}

uint64_t sub_23A4C68A8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v6 = *(void **)a1;
  v7 = *(void **)a2;
  *(_QWORD *)a1 = *(_QWORD *)a2;
  v8 = v7;

  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  sub_23A4D4FF4();
  swift_bridgeObjectRelease();
  v9 = *(int *)(a3 + 24);
  v10 = a1 + v9;
  v11 = a2 + v9;
  v12 = sub_23A4D5018();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 24))(v10, v11, v12);
  return a1;
}

uint64_t sub_23A4C6938(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  v4 = *(int *)(a3 + 24);
  v5 = a1 + v4;
  v6 = a2 + v4;
  v7 = sub_23A4D5018();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 32))(v5, v6, v7);
  return a1;
}

uint64_t sub_23A4C699C(uint64_t a1, _QWORD *a2, uint64_t a3)
{
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;

  v6 = *(void **)a1;
  *(_QWORD *)a1 = *a2;

  v7 = a2[2];
  *(_QWORD *)(a1 + 8) = a2[1];
  *(_QWORD *)(a1 + 16) = v7;
  swift_bridgeObjectRelease();
  v8 = *(int *)(a3 + 24);
  v9 = a1 + v8;
  v10 = (char *)a2 + v8;
  v11 = sub_23A4D5018();
  (*(void (**)(uint64_t, char *, uint64_t))(*(_QWORD *)(v11 - 8) + 40))(v9, v10, v11);
  return a1;
}

uint64_t sub_23A4C6A18()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_23A4C6A24(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v4;
  uint64_t v8;

  if ((_DWORD)a2 == 0x7FFFFFFF)
  {
    v4 = *(_QWORD *)(a1 + 16);
    if (v4 >= 0xFFFFFFFF)
      LODWORD(v4) = -1;
    return (v4 + 1);
  }
  else
  {
    v8 = OUTLINED_FUNCTION_3_4();
    return __swift_getEnumTagSinglePayload(a1 + *(int *)(a3 + 24), a2, v8);
  }
}

uint64_t sub_23A4C6A94()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_23A4C6AA0(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5;
  uint64_t v7;

  v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(_QWORD *)(result + 16) = (a2 - 1);
  }
  else
  {
    v7 = OUTLINED_FUNCTION_3_4();
    return __swift_storeEnumTagSinglePayload(v5 + *(int *)(a4 + 24), a2, a2, v7);
  }
  return result;
}

uint64_t type metadata accessor for ActionButtonsView()
{
  uint64_t result;

  result = qword_256988F08;
  if (!qword_256988F08)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_23A4C6B40()
{
  uint64_t result;
  unint64_t v1;

  result = sub_23A4D5018();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t sub_23A4C6BC0()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_23A4C6BD0@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(uint64_t);
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  _QWORD v21[3];
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;

  v21[2] = a1;
  v2 = OUTLINED_FUNCTION_2_3();
  v3 = *(_QWORD *)(v2 - 8);
  v4 = *(_QWORD *)(v3 + 64);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)v21 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23A4D4FF4();
  sub_23A4CF09C();
  v7 = v6;
  swift_bridgeObjectRelease();
  v26 = v7;
  v21[1] = swift_getKeyPath();
  sub_23A4C791C(v1, (uint64_t)v5);
  v8 = (*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  v9 = swift_allocObject();
  sub_23A4C79DC((uint64_t)v5, v9 + v8);
  v10 = swift_allocObject();
  *(_QWORD *)(v10 + 16) = sub_23A4C7A20;
  *(_QWORD *)(v10 + 24) = v9;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256988F48);
  __swift_instantiateConcreteTypeFromMangledName(&qword_256988F50);
  sub_23A4C7A9C(&qword_256988F58, &qword_256988F48);
  v11 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256988F60);
  v12 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256988F68);
  v13 = sub_23A4D5A44();
  v14 = (void (*)(uint64_t))MEMORY[0x24BEADB88];
  v15 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256988F70);
  v16 = sub_23A4C7A9C(&qword_256988F78, &qword_256988F70);
  v22 = v15;
  v23 = v16;
  v17 = OUTLINED_FUNCTION_0_3();
  v18 = sub_23A4C7BF4(&qword_256988F80, v14);
  v22 = v12;
  v23 = v13;
  v24 = v17;
  v25 = v18;
  v19 = OUTLINED_FUNCTION_0_3();
  v22 = v11;
  v23 = v19;
  OUTLINED_FUNCTION_0_3();
  return sub_23A4D59F0();
}

uint64_t sub_23A4C6DFC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
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
  char *v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  unint64_t v25;
  uint64_t v26;
  uint64_t v27;
  char *v28;
  char *v29;
  uint64_t OpaqueTypeConformance2;
  uint64_t v31;
  char *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  char *v36;
  uint64_t v37;
  uint64_t v38;
  char *v39;
  uint64_t v40;
  uint64_t v42;
  char *v43;
  char *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
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
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;

  v46 = a3;
  v51 = a1;
  v61 = a4;
  v5 = sub_23A4D5A14();
  v59 = *(_QWORD *)(v5 - 8);
  v60 = v5;
  MEMORY[0x24BDAC7A8](v5);
  v58 = (char *)&v42 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_23A4D5A44();
  v8 = *(_QWORD *)(v7 - 8);
  v56 = v7;
  v57 = v8;
  MEMORY[0x24BDAC7A8](v7);
  v50 = (char *)&v42 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = type metadata accessor for ActionButtonsView();
  v42 = *(_QWORD *)(v10 - 8);
  v11 = *(_QWORD *)(v42 + 64);
  MEMORY[0x24BDAC7A8](v10);
  v12 = (char *)&v42 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = sub_23A4D53CC();
  v14 = *(_QWORD *)(v13 - 8);
  v15 = *(_QWORD *)(v14 + 64);
  MEMORY[0x24BDAC7A8](v13);
  v16 = (char *)&v42 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_256988F70);
  v45 = *(_QWORD *)(v17 - 8);
  MEMORY[0x24BDAC7A8](v17);
  v19 = (char *)&v42 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  v47 = __swift_instantiateConcreteTypeFromMangledName(&qword_256988F68);
  v48 = *(_QWORD *)(v47 - 8);
  MEMORY[0x24BDAC7A8](v47);
  v43 = (char *)&v42 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  v52 = __swift_instantiateConcreteTypeFromMangledName(&qword_256988F60);
  v55 = *(_QWORD *)(v52 - 8);
  MEMORY[0x24BDAC7A8](v52);
  v44 = (char *)&v42 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  v22 = __swift_instantiateConcreteTypeFromMangledName(&qword_256988F50);
  v53 = *(_QWORD *)(v22 - 8);
  v54 = v22;
  MEMORY[0x24BDAC7A8](v22);
  v49 = (char *)&v42 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v14 + 16))(v16, a2, v13);
  sub_23A4C791C(v46, (uint64_t)v12);
  v24 = (*(unsigned __int8 *)(v14 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v14 + 80);
  v25 = (v15 + *(unsigned __int8 *)(v42 + 80) + v24) & ~(unint64_t)*(unsigned __int8 *)(v42 + 80);
  v26 = swift_allocObject();
  (*(void (**)(unint64_t, char *, uint64_t))(v14 + 32))(v26 + v24, v16, v13);
  sub_23A4C79DC((uint64_t)v12, v26 + v25);
  v62 = a2;
  sub_23A4D59E4();
  v27 = sub_23A4C7A9C(&qword_256988F78, &qword_256988F70);
  v28 = v43;
  sub_23A4D58AC();
  (*(void (**)(char *, uint64_t))(v45 + 8))(v19, v17);
  v29 = v50;
  sub_23A4D5708();
  v63 = v17;
  v64 = v27;
  OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
  v31 = sub_23A4C7BF4(&qword_256988F80, (void (*)(uint64_t))MEMORY[0x24BEADB88]);
  v32 = v44;
  v33 = v47;
  v34 = v56;
  sub_23A4D5900();
  v35 = v34;
  (*(void (**)(char *, uint64_t))(v57 + 8))(v29, v34);
  (*(void (**)(char *, uint64_t))(v48 + 8))(v28, v33);
  v36 = v58;
  v37 = v59;
  v38 = v60;
  (*(void (**)(char *, _QWORD, uint64_t))(v59 + 104))(v58, *MEMORY[0x24BEAD970], v60);
  v63 = sub_23A4D5948();
  sub_23A4D5558();
  v63 = v33;
  v64 = v35;
  v65 = OpaqueTypeConformance2;
  v66 = v31;
  swift_getOpaqueTypeConformance2();
  v39 = v49;
  v40 = v52;
  sub_23A4D5870();
  swift_release();
  (*(void (**)(char *, uint64_t))(v37 + 8))(v36, v38);
  (*(void (**)(char *, uint64_t))(v55 + 8))(v32, v40);
  return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v53 + 32))(v61, v39, v54);
}

uint64_t sub_23A4C7308(uint64_t a1, id *a2)
{
  uint64_t v2;
  uint64_t v3;
  char *v4;
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
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  char *v24;
  int v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t result;
  uint64_t v29;
  char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  char *v37;
  uint64_t v38;
  id *v39;
  uint64_t v40;
  char *v41;
  uint64_t v42;
  uint64_t v43;
  id v44;
  NSObject *v45;
  os_log_type_t v46;
  uint8_t *v47;
  char *v48;
  char *v49;
  uint64_t v50;
  uint64_t v51;
  char *v52;
  uint64_t v53;
  uint64_t v54;
  id *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;

  v55 = a2;
  v2 = sub_23A4D5468();
  v58 = *(_QWORD *)(v2 - 8);
  v59 = v2;
  MEMORY[0x24BDAC7A8](v2);
  v4 = (char *)&v48 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = sub_23A4D539C();
  v50 = *(_QWORD *)(v5 - 8);
  v51 = v5;
  MEMORY[0x24BDAC7A8](v5);
  v49 = (char *)&v48 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_23A4D5018();
  v56 = *(_QWORD *)(v7 - 8);
  v57 = v7;
  v8 = MEMORY[0x24BDAC7A8](v7);
  v10 = (char *)&v48 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v8);
  v48 = (char *)&v48 - v11;
  v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569885E8);
  MEMORY[0x24BDAC7A8](v12);
  v14 = (char *)&v48 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = sub_23A4D4ED4();
  v53 = *(_QWORD *)(v15 - 8);
  v54 = v15;
  MEMORY[0x24BDAC7A8](v15);
  v52 = (char *)&v48 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17 = sub_23A4D536C();
  v18 = *(_QWORD *)(v17 - 8);
  MEMORY[0x24BDAC7A8](v17);
  v20 = (char *)&v48 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  v21 = sub_23A4D53A8();
  v22 = *(_QWORD *)(v21 - 8);
  MEMORY[0x24BDAC7A8](v21);
  v24 = (char *)&v48 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23A4D53C0();
  v25 = (*(uint64_t (**)(char *, uint64_t))(v22 + 88))(v24, v21);
  if (v25 == *MEMORY[0x24BE2C2D0])
  {
    (*(void (**)(char *, uint64_t))(v22 + 96))(v24, v21);
    v26 = (*(uint64_t (**)(char *, char *, uint64_t))(v18 + 32))(v20, v24, v17);
    MEMORY[0x23B84E910](v26);
    sub_23A4D4EC8();
    swift_bridgeObjectRelease();
    v27 = v54;
    if (__swift_getEnumTagSinglePayload((uint64_t)v14, 1, v54) == 1)
    {
      (*(void (**)(char *, uint64_t))(v18 + 8))(v20, v17);
      return sub_23A4C5BD0((uint64_t)v14);
    }
    else
    {
      v51 = v17;
      v37 = v52;
      v36 = v53;
      (*(void (**)(char *, char *, uint64_t))(v53 + 32))(v52, v14, v27);
      v38 = type metadata accessor for ActionButtonsView();
      v39 = v55;
      v40 = v56;
      v41 = v48;
      v42 = v57;
      (*(void (**)(char *, char *, uint64_t))(v56 + 16))(v48, (char *)v55 + *(int *)(v38 + 24), v57);
      type metadata accessor for ActionHandler();
      v43 = swift_allocObject();
      sub_23A4D5450();
      (*(void (**)(uint64_t, char *, uint64_t))(v40 + 32))(v43 + OBJC_IVAR____TtC14DeviceExpertUI13ActionHandler_flowContext, v41, v42);
      if (*v39)
      {
        v44 = *v39;
        sub_23A4CFFFC();

        swift_setDeallocating();
        (*(void (**)(uint64_t, uint64_t))(v58 + 8))(v43 + OBJC_IVAR____TtC14DeviceExpertUI13ActionHandler_logger, v59);
        (*(void (**)(uint64_t, uint64_t))(v40 + 8))(v43 + OBJC_IVAR____TtC14DeviceExpertUI13ActionHandler_flowContext, v42);
        swift_deallocClassInstance();
        (*(void (**)(char *, uint64_t))(v36 + 8))(v37, v27);
        return (*(uint64_t (**)(char *, uint64_t))(v18 + 8))(v20, v51);
      }
      else
      {
        sub_23A4D5AE0();
        sub_23A4C7BF4(&qword_2569886D0, (void (*)(uint64_t))MEMORY[0x24BEAE580]);
        result = sub_23A4D55D0();
        __break(1u);
      }
    }
  }
  else if (v25 == *MEMORY[0x24BE2C2D8])
  {
    (*(void (**)(char *, uint64_t))(v22 + 96))(v24, v21);
    v30 = v49;
    v29 = v50;
    v31 = v51;
    (*(void (**)(char *, char *, uint64_t))(v50 + 32))(v49, v24, v51);
    v32 = type metadata accessor for ActionButtonsView();
    v33 = v56;
    v34 = v57;
    (*(void (**)(char *, char *, uint64_t))(v56 + 16))(v10, (char *)v55 + *(int *)(v32 + 24), v57);
    type metadata accessor for ActionHandler();
    v35 = swift_allocObject();
    sub_23A4D5450();
    (*(void (**)(uint64_t, char *, uint64_t))(v33 + 32))(v35 + OBJC_IVAR____TtC14DeviceExpertUI13ActionHandler_flowContext, v10, v34);
    sub_23A4D02F0();
    swift_release();
    return (*(uint64_t (**)(char *, uint64_t))(v29 + 8))(v30, v31);
  }
  else
  {
    sub_23A4D5450();
    v45 = sub_23A4D545C();
    v46 = sub_23A4D5BB8();
    if (os_log_type_enabled(v45, v46))
    {
      v47 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v47 = 0;
      _os_log_impl(&dword_23A4B7000, v45, v46, "Unknown action button type selected.", v47, 2u);
      MEMORY[0x23B84F5D0](v47, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v58 + 8))(v4, v59);
    return (*(uint64_t (**)(char *, uint64_t))(v22 + 8))(v24, v21);
  }
  return result;
}

uint64_t sub_23A4C7864@<X0>(uint64_t a1@<X8>)
{
  uint64_t result;
  uint64_t v3;
  char v4;
  uint64_t v5;

  MEMORY[0x23B84E964]();
  sub_23A4C4600();
  result = sub_23A4D584C();
  *(_QWORD *)a1 = result;
  *(_QWORD *)(a1 + 8) = v3;
  *(_BYTE *)(a1 + 16) = v4 & 1;
  *(_QWORD *)(a1 + 24) = v5;
  return result;
}

uint64_t sub_23A4C78BC(char *a1, uint64_t (*a2)(uint64_t, char *))
{
  uint64_t v4;
  uint64_t v5;

  v4 = *(_QWORD *)a1;
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_256988F88);
  return a2(v4, &a1[*(int *)(v5 + 48)]);
}

uint64_t sub_23A4C791C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for ActionButtonsView();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_23A4C7960()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v1 = *(unsigned __int8 *)(*(_QWORD *)(OUTLINED_FUNCTION_2_3() - 8) + 80);

  swift_bridgeObjectRelease();
  v2 = OUTLINED_FUNCTION_3_4();
  OUTLINED_FUNCTION_0_0(v2);
  return swift_deallocObject();
}

uint64_t sub_23A4C79DC(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for ActionButtonsView();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_23A4C7A20@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v3;
  uint64_t v7;

  v7 = *(unsigned __int8 *)(*(_QWORD *)(OUTLINED_FUNCTION_2_3() - 8) + 80);
  return sub_23A4C6DFC(a1, a2, v3 + ((v7 + 16) & ~v7), a3);
}

uint64_t sub_23A4C7A70()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_23A4C7A94(char *a1)
{
  uint64_t v1;

  return sub_23A4C78BC(a1, *(uint64_t (**)(uint64_t, char *))(v1 + 16));
}

uint64_t sub_23A4C7A9C(uint64_t *a1, uint64_t *a2)
{
  uint64_t result;

  result = *a1;
  if (!result)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    OUTLINED_FUNCTION_8_0();
  }
  return result;
}

uint64_t sub_23A4C7AD4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;

  v1 = sub_23A4D53CC();
  v2 = *(_QWORD *)(v1 - 8);
  v3 = (*(unsigned __int8 *)(v2 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  v4 = *(_QWORD *)(v2 + 64);
  v5 = *(unsigned __int8 *)(*(_QWORD *)(OUTLINED_FUNCTION_2_3() - 8) + 80);
  v6 = (v3 + v4 + v5) & ~v5;
  (*(void (**)(unint64_t, uint64_t))(v2 + 8))(v0 + v3, v1);

  swift_bridgeObjectRelease();
  v7 = OUTLINED_FUNCTION_3_4();
  OUTLINED_FUNCTION_0_0(v7);
  return swift_deallocObject();
}

uint64_t sub_23A4C7B90()
{
  uint64_t v0;
  uint64_t v1;
  unint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v1 = *(_QWORD *)(sub_23A4D53CC() - 8);
  v2 = (*(unsigned __int8 *)(v1 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80);
  v3 = *(_QWORD *)(v1 + 64);
  v4 = *(unsigned __int8 *)(*(_QWORD *)(OUTLINED_FUNCTION_2_3() - 8) + 80);
  return sub_23A4C7308(v0 + v2, (id *)(v0 + ((v2 + v3 + v4) & ~v4)));
}

uint64_t sub_23A4C7BEC@<X0>(uint64_t a1@<X8>)
{
  return sub_23A4C7864(a1);
}

uint64_t sub_23A4C7BF4(uint64_t *a1, void (*a2)(uint64_t))
{
  uint64_t result;

  result = *a1;
  if (!result)
  {
    a2(255);
    OUTLINED_FUNCTION_8_0();
  }
  return result;
}

unint64_t sub_23A4C7C30()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;
  void (*v3)(uint64_t);
  _QWORD v4[5];

  result = qword_256988F90;
  if (!qword_256988F90)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256988F98);
    v2 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256988F60);
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256988F68);
    sub_23A4D5A44();
    v3 = (void (*)(uint64_t))MEMORY[0x24BEADB88];
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256988F70);
    sub_23A4C7A9C(&qword_256988F78, &qword_256988F70);
    v4[3] = swift_getOpaqueTypeConformance2();
    v4[4] = sub_23A4C7BF4(&qword_256988F80, v3);
    v4[1] = v2;
    v4[2] = swift_getOpaqueTypeConformance2();
    v4[0] = swift_getOpaqueTypeConformance2();
    result = MEMORY[0x23B84F540](MEMORY[0x24BDF4A08], v1, v4);
    atomic_store(result, (unint64_t *)&qword_256988F90);
  }
  return result;
}

uint64_t OUTLINED_FUNCTION_0_3()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t OUTLINED_FUNCTION_2_3()
{
  return type metadata accessor for ActionButtonsView();
}

uint64_t OUTLINED_FUNCTION_3_4()
{
  return sub_23A4D5018();
}

uint64_t sub_23A4C7D8C()
{
  return swift_deallocClassInstance();
}

id sub_23A4C7D9C()
{
  uint64_t ObjCClassFromMetadata;
  id result;

  _s8SentinelCMa();
  ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  result = objc_msgSend((id)objc_opt_self(), sel_bundleForClass_, ObjCClassFromMetadata);
  qword_256988FA0 = (uint64_t)result;
  return result;
}

id static NSBundle.current.getter()
{
  if (qword_2569885B8 != -1)
    swift_once();
  return (id)qword_256988FA0;
}

uint64_t _s8SentinelCMa()
{
  return objc_opt_self();
}

uint64_t sub_23A4C7E50(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_23A4D5348();
  return (**(uint64_t (***)(uint64_t, uint64_t, uint64_t))(v4 - 8))(a1, a2, v4);
}

uint64_t sub_23A4C7E8C(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_23A4D5348();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
}

uint64_t sub_23A4C7EC0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_23A4D5348();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a1, a2, v4);
  return a1;
}

uint64_t sub_23A4C7F04(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_23A4D5348();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 24))(a1, a2, v4);
  return a1;
}

uint64_t sub_23A4C7F48(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_23A4D5348();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a1, a2, v4);
  return a1;
}

uint64_t sub_23A4C7F8C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_23A4D5348();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 40))(a1, a2, v4);
  return a1;
}

uint64_t sub_23A4C7FD0()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_23A4C7FDC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v2 = OUTLINED_FUNCTION_2_4();
  return __swift_getEnumTagSinglePayload(v1, v0, v2);
}

uint64_t sub_23A4C8004()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_23A4C8010()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v2 = OUTLINED_FUNCTION_2_4();
  return __swift_storeEnumTagSinglePayload(v1, v0, v0, v2);
}

uint64_t type metadata accessor for SummarizedAnswerSnippet()
{
  uint64_t result;

  result = qword_256989098;
  if (!qword_256989098)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_23A4C8074()
{
  uint64_t result;
  unint64_t v1;

  result = sub_23A4D5348();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t sub_23A4C80DC()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_23A4C80EC@<X0>(uint64_t a1@<X8>)
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
  unint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  id v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;

  v2 = v1;
  v43 = a1;
  v3 = sub_23A4D5018();
  v41 = *(_QWORD *)(v3 - 8);
  v42 = v3;
  OUTLINED_FUNCTION_3();
  MEMORY[0x24BDAC7A8](v4);
  OUTLINED_FUNCTION_1();
  v7 = v6 - v5;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256988770);
  OUTLINED_FUNCTION_3();
  MEMORY[0x24BDAC7A8](v8);
  OUTLINED_FUNCTION_1();
  v11 = v10 - v9;
  v12 = OUTLINED_FUNCTION_1_5();
  v13 = *(_QWORD *)(v12 - 8);
  v14 = *(_QWORD *)(v13 + 64);
  MEMORY[0x24BDAC7A8](v12);
  v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569890D0);
  v39 = *(_QWORD *)(v15 - 8);
  v40 = v15;
  OUTLINED_FUNCTION_3();
  MEMORY[0x24BDAC7A8](v16);
  OUTLINED_FUNCTION_1();
  v19 = v18 - v17;
  v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569890D8);
  OUTLINED_FUNCTION_3();
  MEMORY[0x24BDAC7A8](v21);
  OUTLINED_FUNCTION_1();
  v24 = v23 - v22;
  sub_23A4C9294(v2, (uint64_t)&v38 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0));
  v25 = (*(unsigned __int8 *)(v13 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v13 + 80);
  v26 = swift_allocObject();
  sub_23A4C92DC((uint64_t)&v38 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0), v26 + v25);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2569890E0);
  sub_23A4BCDDC(&qword_2569890E8, &qword_2569890E0);
  sub_23A4D5A50();
  sub_23A4D52F4();
  v27 = sub_23A4D5198();
  if (__swift_getEnumTagSinglePayload(v11, 1, v27) == 1)
  {
    sub_23A4C94EC(v11, &qword_256988770);
    v28 = 0;
  }
  else
  {
    v28 = (void *)sub_23A4CF844();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v27 - 8) + 8))(v11, v27);
  }
  sub_23A4D5330();
  v29 = (uint64_t *)(v24 + *(int *)(v20 + 36));
  v30 = type metadata accessor for PunchoutModifier();
  v31 = v41;
  v32 = v42;
  (*(void (**)(char *, uint64_t, uint64_t))(v41 + 16))((char *)v29 + *(int *)(v30 + 24), v7, v42);
  sub_23A4D5AE0();
  sub_23A4BCE10(&qword_2569886D0, (void (*)(uint64_t))MEMORY[0x24BEAE580]);
  v33 = v28;
  *v29 = sub_23A4D55DC();
  v29[1] = v34;
  v29[2] = (uint64_t)v28;
  v36 = v39;
  v35 = v40;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v39 + 16))(v24, v19, v40);

  (*(void (**)(uint64_t, uint64_t))(v31 + 8))(v7, v32);
  (*(void (**)(uint64_t, uint64_t))(v36 + 8))(v19, v35);
  return sub_23A4C934C(v24, v43);
}

void sub_23A4C83D0(uint64_t a1@<X0>, uint64_t a2@<X8>)
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
  _BYTE *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  _BYTE *v21;
  uint64_t v22;
  uint64_t v23;
  _BYTE *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  _BYTE *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  _BYTE *v34;
  char v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  _BYTE *v40;
  char v41;
  char v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  void (*v47)(_QWORD, _QWORD, _QWORD);
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  char v54;
  char v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  void (*v61)(_BYTE *, uint64_t, uint64_t);
  _BYTE *v62;
  uint64_t v63;
  void (*v64)(_QWORD, _QWORD, _QWORD);
  void (*v65)(_BYTE *, uint64_t);
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
  char v77;
  char v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  _BYTE *v82;
  unint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t *v87;
  uint64_t (**v88)(uint64_t, uint64_t);
  _BYTE *v89;
  _BYTE *v90;
  void (*v91)(_BYTE *, _BYTE *, uint64_t);
  _BYTE *v92;
  _BYTE *v93;
  void (*v94)(_BYTE *, _BYTE *, uint64_t);
  _BYTE *v95;
  uint64_t v96;
  _BYTE *v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  void (*v101)(_BYTE *, uint64_t);
  _BYTE v102[12];
  unsigned int v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  _BYTE *v108;
  uint64_t v109;
  _BYTE *v110;
  _BYTE *v111;
  uint64_t v112;
  uint64_t v113;
  _BYTE *v114;
  uint64_t v115;
  uint64_t v116;
  _BYTE *v117;
  _BYTE *v118;
  _BYTE *v119;
  _BYTE *v120;
  _BYTE *v121;
  uint64_t v122;
  _BYTE *v123;
  uint64_t v124;
  uint64_t v125;
  void (*v126)(_QWORD, _QWORD, _QWORD);
  _BYTE *v127;
  uint64_t v128;
  uint64_t v129;
  _BYTE *v130;
  uint64_t v131;
  _BYTE *v132;
  uint64_t v133;
  uint64_t v134;
  uint64_t v135;
  uint64_t v136;

  v124 = a2;
  v3 = type metadata accessor for SummarizedAnswerSnippet();
  v105 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v106 = v4;
  v108 = &v102[-((v4 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v109 = sub_23A4D4E68();
  v107 = *(_QWORD *)(v109 - 8);
  MEMORY[0x24BDAC7A8](v109);
  v120 = &v102[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v112 = type metadata accessor for AttributionView();
  MEMORY[0x24BDAC7A8](v112);
  v114 = &v102[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v122 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569890F0);
  v113 = *(_QWORD *)(v122 - 8);
  v7 = MEMORY[0x24BDAC7A8](v122);
  v111 = &v102[-((v8 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x24BDAC7A8](v7);
  v110 = &v102[-v9];
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_256988770);
  MEMORY[0x24BDAC7A8](v10);
  v117 = &v102[-((v11 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v128 = sub_23A4D5198();
  v104 = *(_QWORD *)(v128 - 8);
  MEMORY[0x24BDAC7A8](v128);
  v118 = &v102[-((v12 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569890F8);
  v14 = MEMORY[0x24BDAC7A8](v13);
  v123 = &v102[-((v15 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x24BDAC7A8](v14);
  v17 = &v102[-v16];
  v18 = sub_23A4D4F40();
  v19 = *(_QWORD *)(v18 - 8);
  MEMORY[0x24BDAC7A8](v18);
  v21 = &v102[-((v20 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v22 = sub_23A4D5A74();
  v125 = *(_QWORD *)(v22 - 8);
  v126 = (void (*)(_QWORD, _QWORD, _QWORD))v22;
  MEMORY[0x24BDAC7A8](v22);
  v24 = &v102[-((v23 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v25 = __swift_instantiateConcreteTypeFromMangledName(&qword_256988E98);
  v131 = *(_QWORD *)(v25 - 8);
  v26 = MEMORY[0x24BDAC7A8](v25);
  v130 = &v102[-((v27 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x24BDAC7A8](v26);
  v29 = &v102[-v28];
  v30 = __swift_instantiateConcreteTypeFromMangledName(&qword_256989100);
  v31 = MEMORY[0x24BDAC7A8](v30);
  v119 = &v102[-((v32 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x24BDAC7A8](v31);
  v34 = &v102[-v33];
  v35 = sub_23A4D533C();
  v129 = a1;
  v121 = v17;
  v132 = v34;
  v133 = v25;
  v127 = v21;
  v116 = v19;
  v115 = v18;
  if ((v35 & 1) != 0)
  {
    v36 = sub_23A4D5324();
    v37 = sub_23A4C9648(v36);
    v39 = v38;
    v40 = v21;
    v42 = v41;
    v44 = v43;
    swift_bridgeObjectRelease();
    v135 = MEMORY[0x24BDF1FA8];
    v136 = MEMORY[0x24BEAD6B0];
    v45 = swift_allocObject();
    v134 = v45;
    *(_QWORD *)(v45 + 16) = v37;
    *(_QWORD *)(v45 + 24) = v39;
    *(_BYTE *)(v45 + 32) = v42 & 1;
    *(_QWORD *)(v45 + 40) = v44;
    sub_23A4D5A68();
    v46 = *MEMORY[0x24BEAB508];
    (*(void (**)(_BYTE *, uint64_t, uint64_t))(v19 + 104))(v40, v46, v18);
    sub_23A4BCE10(&qword_256988810, (void (*)(uint64_t))MEMORY[0x24BEADD58]);
    v47 = v126;
    sub_23A4D5894();
    (*(void (**)(_BYTE *, uint64_t))(v19 + 8))(v40, v18);
    (*(void (**)(_BYTE *, void (*)(_QWORD, _QWORD, _QWORD)))(v125 + 8))(v24, v47);
    v48 = (uint64_t)v132;
    v49 = v133;
    (*(void (**)(_BYTE *, _BYTE *, uint64_t))(v131 + 32))(v132, v29, v133);
    __swift_storeEnumTagSinglePayload(v48, 0, 1, v49);
  }
  else
  {
    __swift_storeEnumTagSinglePayload((uint64_t)v34, 1, 1, v25);
    v46 = *MEMORY[0x24BEAB508];
  }
  v50 = sub_23A4D5318();
  v51 = sub_23A4C9648(v50);
  v53 = v52;
  v55 = v54;
  v57 = v56;
  swift_bridgeObjectRelease();
  v135 = MEMORY[0x24BDF1FA8];
  v136 = MEMORY[0x24BEAD6B0];
  v58 = swift_allocObject();
  v134 = v58;
  *(_QWORD *)(v58 + 16) = v51;
  *(_QWORD *)(v58 + 24) = v53;
  *(_BYTE *)(v58 + 32) = v55 & 1;
  *(_QWORD *)(v58 + 40) = v57;
  v59 = v129;
  sub_23A4D5A68();
  v60 = v116;
  v61 = *(void (**)(_BYTE *, uint64_t, uint64_t))(v116 + 104);
  v62 = v127;
  v103 = v46;
  v63 = v115;
  v61(v127, v46, v115);
  sub_23A4BCE10(&qword_256988810, (void (*)(uint64_t))MEMORY[0x24BEADD58]);
  v64 = v126;
  sub_23A4D5894();
  v65 = *(void (**)(_BYTE *, uint64_t))(v60 + 8);
  v65(v62, v63);
  (*(void (**)(_BYTE *, void (*)(_QWORD, _QWORD, _QWORD)))(v125 + 8))(v24, v64);
  v66 = v131;
  (*(void (**)(_BYTE *, _BYTE *, uint64_t))(v131 + 32))(v130, v29, v133);
  v67 = (uint64_t)v117;
  sub_23A4D52F4();
  v68 = v128;
  if (__swift_getEnumTagSinglePayload(v67, 1, v128) == 1)
  {
    sub_23A4C94EC(v67, &qword_256988770);
    v69 = 1;
    v71 = (uint64_t)v121;
    v70 = v122;
  }
  else
  {
    v126 = (void (*)(_QWORD, _QWORD, _QWORD))v61;
    v72 = v63;
    v73 = v104;
    (*(void (**)(_BYTE *, uint64_t, uint64_t))(v104 + 32))(v118, v67, v68);
    sub_23A4D518C();
    if ((sub_23A4D530C() & 1) != 0)
    {
      v74 = sub_23A4D5300();
      v125 = sub_23A4C9648(v74);
      v76 = v75;
      v78 = v77;
      v80 = v79;
      swift_bridgeObjectRelease();
      v81 = v78 & 1;
    }
    else
    {
      v125 = 0;
      v76 = 0;
      v81 = 0;
      v80 = 0;
    }
    v82 = v108;
    sub_23A4C9294(v59, (uint64_t)v108);
    v83 = (*(unsigned __int8 *)(v105 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v105 + 80);
    v84 = swift_allocObject();
    sub_23A4C92DC((uint64_t)v82, v84 + v83);
    v85 = (uint64_t)v114;
    (*(void (**)(_BYTE *, _BYTE *, uint64_t))(v107 + 32))(v114, v120, v109);
    v86 = v112;
    v87 = (uint64_t *)(v85 + *(int *)(v112 + 20));
    *v87 = v125;
    v87[1] = v76;
    v87[2] = v81;
    v87[3] = v80;
    v88 = (uint64_t (**)(uint64_t, uint64_t))(v85 + *(int *)(v86 + 24));
    *v88 = sub_23A4C9474;
    v88[1] = (uint64_t (*)(uint64_t, uint64_t))v84;
    v89 = v127;
    v126(v127, v103, v72);
    sub_23A4BCE10(&qword_256988808, (void (*)(uint64_t))type metadata accessor for AttributionView);
    v90 = v111;
    sub_23A4D5894();
    v65(v89, v72);
    sub_23A4C94B0(v85);
    (*(void (**)(_BYTE *, uint64_t))(v73 + 8))(v118, v128);
    v91 = *(void (**)(_BYTE *, _BYTE *, uint64_t))(v113 + 32);
    v92 = v110;
    v70 = v122;
    v91(v110, v90, v122);
    v71 = (uint64_t)v121;
    v91(v121, v92, v70);
    v69 = 0;
    v66 = v131;
  }
  __swift_storeEnumTagSinglePayload(v71, v69, 1, v70);
  v93 = v119;
  sub_23A4C93C4((uint64_t)v132, (uint64_t)v119, &qword_256989100);
  v94 = *(void (**)(_BYTE *, _BYTE *, uint64_t))(v66 + 16);
  v95 = v130;
  v96 = v133;
  v94(v29, v130, v133);
  v97 = v123;
  sub_23A4C93C4(v71, (uint64_t)v123, &qword_2569890F8);
  v98 = v124;
  sub_23A4C93C4((uint64_t)v93, v124, &qword_256989100);
  v99 = v66;
  v100 = __swift_instantiateConcreteTypeFromMangledName(&qword_256989108);
  v94((_BYTE *)(v98 + *(int *)(v100 + 48)), v29, v96);
  sub_23A4C93C4((uint64_t)v97, v98 + *(int *)(v100 + 64), &qword_2569890F8);
  sub_23A4C94EC(v71, &qword_2569890F8);
  v101 = *(void (**)(_BYTE *, uint64_t))(v99 + 8);
  v101(v95, v96);
  sub_23A4C94EC((uint64_t)v132, &qword_256989100);
  sub_23A4C94EC((uint64_t)v97, &qword_2569890F8);
  v101(v29, v96);
  sub_23A4C94EC((uint64_t)v93, &qword_256989100);
}

uint64_t sub_23A4C8D44(uint64_t a1, uint64_t a2, uint64_t a3)
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
  uint64_t v14;
  char *v15;
  uint64_t v16;
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
  unint64_t v27;
  uint64_t v28;
  void (*v29)(char *, unint64_t, uint64_t);
  void *v30;
  uint64_t v31;
  uint64_t v32;
  char v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  char *v38;
  char *v39;
  NSObject *v40;
  os_log_type_t v41;
  uint8_t *v42;
  uint64_t v43;
  uint64_t v44;
  unint64_t v45;
  void *v47;
  char *v48;
  char *v49;
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
  uint64_t v61;

  v58 = a1;
  v5 = sub_23A4D5018();
  v54 = *(_QWORD *)(v5 - 8);
  v55 = v5;
  MEMORY[0x24BDAC7A8](v5);
  v53 = (char *)&v48 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_23A4D5468();
  v56 = *(_QWORD *)(v7 - 8);
  v57 = v7;
  MEMORY[0x24BDAC7A8](v7);
  v9 = (char *)&v48 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_256988770);
  MEMORY[0x24BDAC7A8](v10);
  v12 = (char *)&v48 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569885F0);
  MEMORY[0x24BDAC7A8](v13);
  v15 = (char *)&v48 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = sub_23A4D509C();
  v17 = *(_QWORD *)(v16 - 8);
  v18 = MEMORY[0x24BDAC7A8](v16);
  v20 = (char *)&v48 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v18);
  v22 = (char *)&v48 - v21;
  sub_23A4D52F4();
  v23 = sub_23A4D5198();
  if (__swift_getEnumTagSinglePayload((uint64_t)v12, 1, v23) == 1)
  {
    sub_23A4C94EC((uint64_t)v12, &qword_256988770);
    __swift_storeEnumTagSinglePayload((uint64_t)v15, 1, 1, v16);
    v24 = (uint64_t)v15;
    goto LABEL_22;
  }
  v48 = v22;
  v49 = v15;
  v50 = a3;
  v51 = v9;
  v25 = sub_23A4D5180();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v23 - 8) + 8))(v12, v23);
  v26 = *(_QWORD *)(v25 + 16);
  v52 = v25;
  if (!v26)
  {
LABEL_17:
    v35 = 1;
    v9 = v51;
    v37 = v54;
    v36 = v55;
    v38 = v53;
    v24 = (uint64_t)v49;
    goto LABEL_21;
  }
  v27 = v25 + ((*(unsigned __int8 *)(v17 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v17 + 80));
  v28 = *(_QWORD *)(v17 + 72);
  v29 = *(void (**)(char *, unint64_t, uint64_t))(v17 + 16);
  sub_23A4D4FF4();
  while (1)
  {
    v29(v20, v27, v16);
    v30 = (void *)sub_23A4D5054();
    v31 = sub_23A4C9524(v30);
    if (a2)
      break;
    if (!v32)
      goto LABEL_20;
    swift_bridgeObjectRelease();
LABEL_15:
    (*(void (**)(char *, uint64_t))(v17 + 8))(v20, v16);
    v27 += v28;
    if (!--v26)
    {
      swift_bridgeObjectRelease();
      goto LABEL_17;
    }
  }
  if (!v32)
    goto LABEL_15;
  if (v31 != v58 || v32 != a2)
  {
    v34 = sub_23A4D5C60();
    swift_bridgeObjectRelease();
    if ((v34 & 1) != 0)
      goto LABEL_20;
    goto LABEL_15;
  }
  swift_bridgeObjectRelease();
LABEL_20:
  swift_bridgeObjectRelease();
  v24 = (uint64_t)v49;
  (*(void (**)(char *, char *, uint64_t))(v17 + 32))(v49, v20, v16);
  v35 = 0;
  v9 = v51;
  v37 = v54;
  v36 = v55;
  v38 = v53;
LABEL_21:
  v39 = v48;
  __swift_storeEnumTagSinglePayload(v24, v35, 1, v16);
  swift_bridgeObjectRelease();
  if (__swift_getEnumTagSinglePayload(v24, 1, v16) == 1)
  {
LABEL_22:
    sub_23A4C94EC(v24, &qword_2569885F0);
    sub_23A4D5450();
    swift_bridgeObjectRetain_n();
    v40 = sub_23A4D545C();
    v41 = sub_23A4D5BB8();
    if (os_log_type_enabled(v40, v41))
    {
      v42 = (uint8_t *)swift_slowAlloc();
      v43 = swift_slowAlloc();
      v60 = a2;
      v61 = v43;
      *(_DWORD *)v42 = 136315138;
      v59 = v58;
      sub_23A4D4FF4();
      __swift_instantiateConcreteTypeFromMangledName(&qword_256988818);
      v44 = sub_23A4D5B28();
      v59 = sub_23A4BA75C(v44, v45, &v61);
      sub_23A4D5BE8();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_23A4B7000, v40, v41, "No attribution item found for %s", v42, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x23B84F5D0](v43, -1, -1);
      MEMORY[0x23B84F5D0](v42, -1, -1);

    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
    return (*(uint64_t (**)(char *, uint64_t))(v56 + 8))(v9, v57);
  }
  else
  {
    (*(void (**)(char *, uint64_t, uint64_t))(v17 + 32))(v39, v24, v16);
    sub_23A4D5150();
    sub_23A4D5144();
    v47 = (void *)sub_23A4D5054();
    sub_23A4D5330();
    sub_23A4C5994(v47);
    swift_release();

    (*(void (**)(char *, uint64_t))(v37 + 8))(v38, v36);
    return (*(uint64_t (**)(char *, uint64_t))(v17 + 8))(v39, v16);
  }
}

uint64_t sub_23A4C9294(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for SummarizedAnswerSnippet();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_23A4C92DC(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for SummarizedAnswerSnippet();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

void sub_23A4C9320(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;

  OUTLINED_FUNCTION_1_5();
  OUTLINED_FUNCTION_9_0();
  sub_23A4C83D0(v1 + v3, a1);
}

uint64_t sub_23A4C934C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569890D8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_23A4C9394()
{
  uint64_t v0;

  sub_23A4BCD04(*(_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 24), *(_BYTE *)(v0 + 32));
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

void sub_23A4C93C4(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, a1, v5);
  OUTLINED_FUNCTION_3_0();
}

uint64_t objectdestroyTm_0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v1 = *(unsigned __int8 *)(*(_QWORD *)(OUTLINED_FUNCTION_1_5() - 8) + 80);
  v2 = v0 + ((v1 + 16) & ~v1);
  v3 = sub_23A4D5348();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(v2, v3);
  return swift_deallocObject();
}

uint64_t sub_23A4C9474(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v5;

  OUTLINED_FUNCTION_1_5();
  OUTLINED_FUNCTION_9_0();
  return sub_23A4C8D44(a1, a2, v2 + v5);
}

uint64_t sub_23A4C94B0(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata accessor for AttributionView();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

void sub_23A4C94EC(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  OUTLINED_FUNCTION_3_0();
}

uint64_t sub_23A4C9524(void *a1)
{
  id v2;
  uint64_t v3;

  v2 = objc_msgSend(a1, sel_aceId);

  if (!v2)
    return 0;
  v3 = sub_23A4D5B1C();

  return v3;
}

unint64_t sub_23A4C9594()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD v5[2];

  result = qword_256989110;
  if (!qword_256989110)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2569890D8);
    sub_23A4BCDDC(qword_256989118, &qword_2569890D0);
    v3 = v2;
    sub_23A4BCE10(qword_256988830, (void (*)(uint64_t))type metadata accessor for PunchoutModifier);
    v5[0] = v3;
    v5[1] = v4;
    result = MEMORY[0x23B84F540](MEMORY[0x24BDED308], v1, v5);
    atomic_store(result, (unint64_t *)&qword_256989110);
  }
  return result;
}

uint64_t OUTLINED_FUNCTION_1_5()
{
  return type metadata accessor for SummarizedAnswerSnippet();
}

uint64_t OUTLINED_FUNCTION_2_4()
{
  return sub_23A4D5348();
}

uint64_t sub_23A4C9648(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t (**v6)(uint64_t, uint64_t);
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  int v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  char v25;
  char v26;
  char v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  char v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  char v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  char v42;
  char v43;
  char v44;
  unint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  char v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  char v53;
  uint64_t v54;
  char v55;
  uint64_t v56;
  _QWORD v58[2];
  uint64_t v59;
  int v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  char *v64;
  uint64_t v65;
  uint64_t v66;
  char *v67;
  uint64_t (**v68)(uint64_t, uint64_t);
  uint64_t v69;
  unint64_t v70;
  uint64_t v71;
  int v72;
  void (*v73)(char *, uint64_t, uint64_t);
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  int v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;

  v62 = sub_23A4D53FC();
  v61 = *(_QWORD *)(v62 - 8);
  MEMORY[0x24BDAC7A8](v62);
  OUTLINED_FUNCTION_11_0();
  v59 = v2;
  v3 = sub_23A4D53E4();
  v75 = *(_QWORD *)(v3 - 8);
  v76 = v3;
  MEMORY[0x24BDAC7A8](v3);
  OUTLINED_FUNCTION_11_0();
  v63 = v4;
  v5 = sub_23A4D5408();
  v6 = *(uint64_t (***)(uint64_t, uint64_t))(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)v58 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = sub_23A4D5420();
  v10 = *(_QWORD *)(v9 - 8);
  MEMORY[0x24BDAC7A8](v9);
  v12 = (char *)v58 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = *(_QWORD *)(a1 + 16);
  if (!v13)
    return 0;
  v14 = a1;
  v15 = a1 + ((*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80));
  v16 = *(_QWORD *)(v10 + 72);
  v73 = *(void (**)(char *, uint64_t, uint64_t))(v10 + 16);
  v74 = v16;
  v72 = *MEMORY[0x24BE2C328];
  v60 = *MEMORY[0x24BE2C330];
  v58[1] = v14;
  sub_23A4D4FF4();
  v79 = 0;
  v78 = 0;
  v17 = 0xE000000000000000;
  v68 = v6;
  v69 = v5;
  v67 = v8;
  v66 = v9;
  v65 = v10;
  v64 = v12;
  do
  {
    v73(v12, v15, v9);
    sub_23A4D5414();
    v18 = v6[11]((uint64_t)v8, v5);
    if (v18 == v72)
    {
      OUTLINED_FUNCTION_0_4(v6[12]);
      v19 = v63;
      v20 = (*(uint64_t (**)(uint64_t, char *, uint64_t))(v75 + 32))(v63, v8, v76);
      v80 = MEMORY[0x23B84E988](v20);
      v81 = v21;
      sub_23A4C4600();
      sub_23A4D584C();
      v23 = v22;
      v77 = v13;
      v24 = v17;
      v26 = v25 & 1;
      v27 = v78 & 1;
      v28 = v79;
      v29 = sub_23A4D5828();
      v33 = OUTLINED_FUNCTION_1_6(v29, v30, v31, v32);
      v34 = v23;
      v9 = v66;
      v12 = v64;
      sub_23A4BCD04(v33, v34, v26);
      v10 = v65;
      swift_bridgeObjectRelease();
      v35 = v24;
      v13 = v77;
      v36 = v27;
      v5 = v69;
      sub_23A4BCD04(v28, v35, v36);
      swift_bridgeObjectRelease();
      v37 = v19;
      v6 = v68;
      (*(void (**)(uint64_t, uint64_t))(v75 + 8))(v37, v76);
      v17 = v70;
      v79 = v71;
      v8 = v67;
    }
    else if (v18 == v60)
    {
      OUTLINED_FUNCTION_0_4(v6[12]);
      v38 = v59;
      v39 = (*(uint64_t (**)(uint64_t, char *, uint64_t))(v61 + 32))(v59, v8, v62);
      MEMORY[0x23B84E9A0](v39);
      sub_23A4D59A8();
      sub_23A4D5858();
      v41 = v40;
      v43 = v42 & 1;
      v44 = v78 & 1;
      v77 = v13;
      v45 = v17;
      v46 = v79;
      v47 = sub_23A4D5828();
      v51 = OUTLINED_FUNCTION_1_6(v47, v48, v49, v50);
      v52 = v41;
      v5 = v69;
      v53 = v43;
      v8 = v67;
      sub_23A4BCD04(v51, v52, v53);
      v6 = v68;
      swift_bridgeObjectRelease();
      v54 = v45;
      v13 = v77;
      v55 = v44;
      v9 = v66;
      sub_23A4BCD04(v46, v54, v55);
      swift_bridgeObjectRelease();
      v56 = v38;
      v10 = v65;
      (*(void (**)(uint64_t, uint64_t))(v61 + 8))(v56, v62);
      v17 = v70;
      v79 = v71;
      v12 = v64;
    }
    else
    {
      OUTLINED_FUNCTION_0_4(v6[1]);
    }
    (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
    v15 += v74;
    --v13;
  }
  while (v13);
  swift_bridgeObjectRelease();
  return v79;
}

uint64_t OUTLINED_FUNCTION_0_4@<X0>(uint64_t (*a1)(uint64_t, uint64_t)@<X8>)
{
  uint64_t v1;
  uint64_t v2;

  return a1(v2, v1);
}

uint64_t OUTLINED_FUNCTION_1_6(uint64_t a1, uint64_t a2, char a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;

  *(_QWORD *)(v5 - 224) = a2;
  *(_QWORD *)(v5 - 216) = a1;
  *(_QWORD *)(v5 - 232) = a4;
  *(_DWORD *)(v5 - 156) = a3 & 1;
  return v4;
}

char *sub_23A4C9ADC(char *a1, char **a2, uint64_t a3)
{
  int v3;
  char *v4;
  char *v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(char *, uint64_t, uint64_t);
  char *v11;

  v3 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  v4 = *a2;
  *(_QWORD *)a1 = *a2;
  if ((v3 & 0x20000) != 0)
  {
    v5 = &v4[(v3 + 16) & ~(unint64_t)v3];
    swift_retain();
  }
  else
  {
    v5 = a1;
    *((_QWORD *)a1 + 1) = a2[1];
    v6 = *(int *)(a3 + 20);
    v7 = &a1[v6];
    v8 = (uint64_t)a2 + v6;
    v9 = sub_23A4D524C();
    v10 = *(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 16);
    v11 = v4;
    v10(v7, v8, v9);
  }
  return v5;
}

uint64_t sub_23A4C9B78(id *a1, uint64_t a2)
{
  char *v4;
  uint64_t v5;

  v4 = (char *)a1 + *(int *)(a2 + 20);
  v5 = sub_23A4D524C();
  return (*(uint64_t (**)(char *, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(v4, v5);
}

_QWORD *sub_23A4C9BC0(_QWORD *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  void *v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(char *, uint64_t, uint64_t);
  id v11;

  v5 = *(void **)a2;
  v4 = *(_QWORD *)(a2 + 8);
  *a1 = *(_QWORD *)a2;
  a1[1] = v4;
  v6 = *(int *)(a3 + 20);
  v7 = (char *)a1 + v6;
  v8 = a2 + v6;
  v9 = sub_23A4D524C();
  v10 = *(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 16);
  v11 = v5;
  v10(v7, v8, v9);
  return a1;
}

uint64_t sub_23A4C9C2C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v6 = *(void **)a1;
  v7 = *(void **)a2;
  *(_QWORD *)a1 = *(_QWORD *)a2;
  v8 = v7;

  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  v9 = *(int *)(a3 + 20);
  v10 = a1 + v9;
  v11 = a2 + v9;
  v12 = sub_23A4D524C();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 24))(v10, v11, v12);
  return a1;
}

_OWORD *sub_23A4C9CA4(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  uint64_t v4;
  char *v5;
  char *v6;
  uint64_t v7;

  *a1 = *a2;
  v4 = *(int *)(a3 + 20);
  v5 = (char *)a1 + v4;
  v6 = (char *)a2 + v4;
  v7 = sub_23A4D524C();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v7 - 8) + 32))(v5, v6, v7);
  return a1;
}

uint64_t sub_23A4C9D00(uint64_t a1, _QWORD *a2, uint64_t a3)
{
  void *v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;

  v6 = *(void **)a1;
  *(_QWORD *)a1 = *a2;

  *(_QWORD *)(a1 + 8) = a2[1];
  v7 = *(int *)(a3 + 20);
  v8 = a1 + v7;
  v9 = (char *)a2 + v7;
  v10 = sub_23A4D524C();
  (*(void (**)(uint64_t, char *, uint64_t))(*(_QWORD *)(v10 - 8) + 40))(v8, v9, v10);
  return a1;
}

uint64_t sub_23A4C9D74()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_23A4C9D80(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  int v5;
  uint64_t v9;

  if ((_DWORD)a2 == 2147483646)
  {
    v4 = *a1;
    if ((unint64_t)*a1 >= 0xFFFFFFFF)
      LODWORD(v4) = -1;
    v5 = v4 - 1;
    if (v5 < 0)
      v5 = -1;
    return (v5 + 1);
  }
  else
  {
    v9 = OUTLINED_FUNCTION_2_5();
    return __swift_getEnumTagSinglePayload((uint64_t)a1 + *(int *)(a3 + 20), a2, v9);
  }
}

uint64_t sub_23A4C9DFC()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

_QWORD *sub_23A4C9E08(_QWORD *result, uint64_t a2, int a3, uint64_t a4)
{
  _QWORD *v5;
  uint64_t v7;

  v5 = result;
  if (a3 == 2147483646)
  {
    *result = a2;
  }
  else
  {
    v7 = OUTLINED_FUNCTION_2_5();
    return (_QWORD *)__swift_storeEnumTagSinglePayload((uint64_t)v5 + *(int *)(a4 + 20), a2, a2, v7);
  }
  return result;
}

uint64_t type metadata accessor for AttributionItemListSnippet()
{
  uint64_t result;

  result = qword_256989178;
  if (!qword_256989178)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_23A4C9EA8()
{
  uint64_t result;
  unint64_t v1;

  result = sub_23A4D524C();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t sub_23A4C9F1C()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_23A4C9F2C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v7;

  v1 = OUTLINED_FUNCTION_0_5();
  v2 = *(_QWORD *)(v1 - 8);
  v3 = *(_QWORD *)(v2 + 64);
  MEMORY[0x24BDAC7A8](v1);
  sub_23A4CA92C(v0, (uint64_t)&v7 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0));
  v4 = (*(unsigned __int8 *)(v2 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  v5 = swift_allocObject();
  sub_23A4CA974((uint64_t)&v7 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0), v5 + v4);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2569891B0);
  sub_23A4CA9E4();
  return sub_23A4D5A50();
}

uint64_t sub_23A4C9FF8(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD v10[4];

  v2 = type metadata accessor for AttributionItemListSnippet();
  v3 = *(_QWORD *)(v2 - 8);
  v4 = *(_QWORD *)(v3 + 64);
  MEMORY[0x24BDAC7A8](v2);
  v10[3] = sub_23A4D5234();
  swift_getKeyPath();
  sub_23A4CA92C(a1, (uint64_t)v10 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0));
  v5 = (*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  v6 = swift_allocObject();
  sub_23A4CA974((uint64_t)v10 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0), v6 + v5);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2569891C8);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2569891D0);
  sub_23A4C7A9C(&qword_2569891D8, &qword_2569891C8);
  v7 = sub_23A4D5AB0();
  v8 = sub_23A4C7BF4(&qword_2569891C0, (void (*)(uint64_t))MEMORY[0x24BEAE228]);
  v10[1] = v7;
  v10[2] = v8;
  swift_getOpaqueTypeConformance2();
  return sub_23A4D59F0();
}

uint64_t sub_23A4CA180()
{
  sub_23A4D4FF4();
  return sub_23A4D5078();
}

uint64_t sub_23A4CA1BC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
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
  char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char v21;
  char v22;
  uint64_t KeyPath;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  char *v35;
  uint64_t v36;
  uint64_t v37;
  char *v38;
  uint64_t v39;
  unint64_t v40;
  uint64_t v41;
  unint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v46;
  uint64_t v47;
  char *v48;
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
  uint64_t v59;
  uint64_t v60;
  char *v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  __int128 v71;
  __int128 v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  __int128 v78;
  __int128 v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  char v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  char v87;

  v64 = a2;
  v47 = a1;
  v66 = a3;
  v63 = sub_23A4D509C();
  v62 = *(_QWORD *)(v63 - 8);
  v65 = *(_QWORD *)(v62 + 64);
  MEMORY[0x24BDAC7A8](v63);
  v61 = (char *)&v46 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = type metadata accessor for AttributionItemListSnippet();
  v59 = *(_QWORD *)(v4 - 8);
  v60 = *(_QWORD *)(v59 + 64);
  MEMORY[0x24BDAC7A8](v4);
  v58 = (uint64_t)&v46 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v54 = sub_23A4D4F34();
  v51 = *(_QWORD *)(v54 - 8);
  MEMORY[0x24BDAC7A8](v54);
  v49 = (char *)&v46 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_23A4D4F4C();
  MEMORY[0x24BDAC7A8](v7);
  v48 = (char *)&v46 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = sub_23A4D5A2C();
  v50 = *(_QWORD *)(v9 - 8);
  MEMORY[0x24BDAC7A8](v9);
  v11 = (char *)&v46 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v52 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569891E0);
  v55 = *(_QWORD *)(v52 - 8);
  MEMORY[0x24BDAC7A8](v52);
  v13 = (char *)&v46 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v56 = sub_23A4D5AB0();
  v57 = *(_QWORD *)(v56 - 8);
  MEMORY[0x24BDAC7A8](v56);
  v53 = (char *)&v46 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v81 = sub_23A4D5084();
  v82 = v15;
  sub_23A4C4600();
  v16 = sub_23A4D584C();
  v18 = v17;
  v20 = v19;
  v22 = v21 & 1;
  KeyPath = swift_getKeyPath();
  v81 = v16;
  v82 = v18;
  v83 = v22;
  v84 = v20;
  v85 = KeyPath;
  v86 = 2;
  v87 = 0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2569891E8);
  sub_23A4CABBC();
  v24 = sub_23A4D5864();
  sub_23A4BCD04(v16, v18, v22);
  swift_release();
  swift_bridgeObjectRelease();
  v25 = MEMORY[0x24BEAD938];
  v84 = MEMORY[0x24BDF4780];
  v85 = MEMORY[0x24BEAD938];
  v81 = v24;
  v80 = 0;
  v78 = 0u;
  v79 = 0u;
  v26 = v47;
  v27 = sub_23A4D5090();
  v76 = MEMORY[0x24BEE0D00];
  v77 = MEMORY[0x24BEAE5B8];
  v74 = v27;
  v75 = v28;
  v73 = 0;
  v72 = 0u;
  v71 = 0u;
  sub_23A4D5060();
  sub_23A4D5A38();
  v29 = v51;
  v30 = v49;
  v31 = v54;
  (*(void (**)(char *, _QWORD, uint64_t))(v51 + 104))(v49, *MEMORY[0x24BEAAB78], v54);
  v32 = sub_23A4C7BF4(&qword_256989208, (void (*)(uint64_t))MEMORY[0x24BEADA38]);
  sub_23A4D5888();
  (*(void (**)(char *, uint64_t))(v29 + 8))(v30, v31);
  (*(void (**)(char *, uint64_t))(v50 + 8))(v11, v9);
  v67 = v9;
  v68 = v32;
  swift_getOpaqueTypeConformance2();
  v33 = v52;
  v34 = sub_23A4D5864();
  (*(void (**)(char *, uint64_t))(v55 + 8))(v13, v33);
  v70 = v25;
  v69 = MEMORY[0x24BDF4780];
  v67 = v34;
  v35 = v53;
  sub_23A4D5AA4();
  v36 = v58;
  sub_23A4CA92C(v64, v58);
  v37 = v62;
  v38 = v61;
  v39 = v63;
  (*(void (**)(char *, uint64_t, uint64_t))(v62 + 16))(v61, v26, v63);
  v40 = (*(unsigned __int8 *)(v59 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v59 + 80);
  v41 = v37;
  v42 = (v60 + *(unsigned __int8 *)(v37 + 80) + v40) & ~(unint64_t)*(unsigned __int8 *)(v37 + 80);
  v43 = swift_allocObject();
  sub_23A4CA974(v36, v43 + v40);
  (*(void (**)(unint64_t, char *, uint64_t))(v41 + 32))(v43 + v42, v38, v39);
  sub_23A4C7BF4(&qword_2569891C0, (void (*)(uint64_t))MEMORY[0x24BEAE228]);
  v44 = v56;
  sub_23A4D58A0();
  swift_release();
  return (*(uint64_t (**)(char *, uint64_t))(v57 + 8))(v35, v44);
}

uint64_t sub_23A4CA784(id *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t result;
  uint64_t v13;

  v2 = sub_23A4D5018();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v13 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for AttributionItemListSnippet();
  sub_23A4D5240();
  type metadata accessor for ActionHandler();
  v6 = swift_allocObject();
  sub_23A4D5450();
  (*(void (**)(uint64_t, char *, uint64_t))(v3 + 32))(v6 + OBJC_IVAR____TtC14DeviceExpertUI13ActionHandler_flowContext, v5, v2);
  v7 = sub_23A4D5054();
  if (*a1)
  {
    v8 = (void *)v7;
    v9 = *a1;
    sub_23A4D0128(v8);

    swift_setDeallocating();
    v10 = v6 + OBJC_IVAR____TtC14DeviceExpertUI13ActionHandler_logger;
    v11 = sub_23A4D5468();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 8))(v10, v11);
    (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v6 + OBJC_IVAR____TtC14DeviceExpertUI13ActionHandler_flowContext, v2);
    return swift_deallocClassInstance();
  }
  else
  {
    sub_23A4D5AE0();
    sub_23A4C7BF4(&qword_2569886D0, (void (*)(uint64_t))MEMORY[0x24BEAE580]);
    result = sub_23A4D55D0();
    __break(1u);
  }
  return result;
}

uint64_t sub_23A4CA92C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for AttributionItemListSnippet();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_23A4CA974(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for AttributionItemListSnippet();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_23A4CA9B8()
{
  uint64_t v0;
  uint64_t v1;

  OUTLINED_FUNCTION_0_5();
  OUTLINED_FUNCTION_9_0();
  return sub_23A4C9FF8(v0 + v1);
}

unint64_t sub_23A4CA9E4()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[3];

  result = qword_2569891B8;
  if (!qword_2569891B8)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2569891B0);
    v2[1] = sub_23A4D5AB0();
    v2[2] = sub_23A4C7BF4(&qword_2569891C0, (void (*)(uint64_t))MEMORY[0x24BEAE228]);
    v2[0] = swift_getOpaqueTypeConformance2();
    result = MEMORY[0x23B84F540](MEMORY[0x24BDF4A08], v1, v2);
    atomic_store(result, (unint64_t *)&qword_2569891B8);
  }
  return result;
}

void sub_23A4CAA84(uint64_t *a1@<X8>)
{
  uint64_t v2;

  *a1 = sub_23A4D506C();
  a1[1] = v2;
  OUTLINED_FUNCTION_3_0();
}

uint64_t objectdestroyTm_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v1 = *(unsigned __int8 *)(*(_QWORD *)(OUTLINED_FUNCTION_0_5() - 8) + 80);

  v2 = OUTLINED_FUNCTION_2_5();
  OUTLINED_FUNCTION_0_0(v2);
  return swift_deallocObject();
}

uint64_t sub_23A4CAB24@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;

  OUTLINED_FUNCTION_0_5();
  OUTLINED_FUNCTION_9_0();
  return sub_23A4CA1BC(a1, v2 + v5, a2);
}

void sub_23A4CAB60(uint64_t a1@<X8>)
{
  char v2;

  *(_QWORD *)a1 = sub_23A4D5660();
  *(_BYTE *)(a1 + 8) = v2 & 1;
  OUTLINED_FUNCTION_3_0();
}

void sub_23A4CAB90()
{
  sub_23A4D566C();
  OUTLINED_FUNCTION_3_0();
}

unint64_t sub_23A4CABBC()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;
  _QWORD v3[2];

  result = qword_2569891F0;
  if (!qword_2569891F0)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2569891E8);
    v2 = sub_23A4C7A9C(&qword_2569891F8, &qword_256989200);
    v3[0] = MEMORY[0x24BDF1F80];
    v3[1] = v2;
    result = MEMORY[0x23B84F540](MEMORY[0x24BDED308], v1, v3);
    atomic_store(result, (unint64_t *)&qword_2569891F0);
  }
  return result;
}

uint64_t sub_23A4CAC40()
{
  uint64_t v0;
  uint64_t v1;
  unint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;

  v1 = *(_QWORD *)(OUTLINED_FUNCTION_0_5() - 8);
  v2 = (*(unsigned __int8 *)(v1 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80);
  v3 = *(_QWORD *)(v1 + 64);
  v4 = sub_23A4D509C();
  v5 = *(_QWORD *)(v4 - 8);
  v6 = (v2 + v3 + *(unsigned __int8 *)(v5 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);

  v7 = OUTLINED_FUNCTION_2_5();
  OUTLINED_FUNCTION_0_0(v7);
  (*(void (**)(unint64_t, uint64_t))(v5 + 8))(v0 + v6, v4);
  return swift_deallocObject();
}

uint64_t sub_23A4CACF4()
{
  uint64_t v0;
  uint64_t v1;
  unint64_t v2;

  v1 = OUTLINED_FUNCTION_0_5();
  v2 = (*(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80);
  sub_23A4D509C();
  return sub_23A4CA784((id *)(v0 + v2));
}

uint64_t sub_23A4CAD50()
{
  return sub_23A4C7A9C(&qword_256989210, &qword_256989218);
}

uint64_t OUTLINED_FUNCTION_0_5()
{
  return type metadata accessor for AttributionItemListSnippet();
}

uint64_t OUTLINED_FUNCTION_2_5()
{
  return sub_23A4D524C();
}

void sub_23A4CAD8C(uint64_t a1@<X8>)
{
  __int128 *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  char v14;
  char *v15;
  char v16;
  uint64_t v17;
  uint64_t v18;

  __swift_instantiateConcreteTypeFromMangledName(&qword_256989258);
  OUTLINED_FUNCTION_4_2();
  MEMORY[0x24BDAC7A8](v8);
  OUTLINED_FUNCTION_2_6();
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_256989260);
  OUTLINED_FUNCTION_4_2();
  MEMORY[0x24BDAC7A8](v10);
  v12 = (char *)&v18 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(_QWORD *)v2 = sub_23A4D56CC();
  *(_QWORD *)(v2 + 8) = 0;
  *(_BYTE *)(v2 + 16) = 1;
  v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_256989268);
  sub_23A4CAEE4(v1, v2 + *(int *)(v13 + 44));
  v14 = sub_23A4D5744();
  sub_23A4D54C8();
  OUTLINED_FUNCTION_4_4();
  sub_23A4C93C4(v2, (uint64_t)v12, &qword_256989258);
  v15 = &v12[*(int *)(v9 + 36)];
  *v15 = v14;
  *((_QWORD *)v15 + 1) = v3;
  *((_QWORD *)v15 + 2) = v4;
  *((_QWORD *)v15 + 3) = v5;
  *((_QWORD *)v15 + 4) = v6;
  v15[40] = 0;
  sub_23A4C94EC(v2, &qword_256989258);
  v16 = sub_23A4D5750();
  sub_23A4D54C8();
  OUTLINED_FUNCTION_4_4();
  sub_23A4C93C4((uint64_t)v12, a1, &qword_256989260);
  v17 = a1 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_256989270) + 36);
  *(_BYTE *)v17 = v16;
  *(_QWORD *)(v17 + 8) = v3;
  *(_QWORD *)(v17 + 16) = v4;
  *(_QWORD *)(v17 + 24) = v5;
  *(_QWORD *)(v17 + 32) = v6;
  *(_BYTE *)(v17 + 40) = 0;
  sub_23A4C94EC((uint64_t)v12, &qword_256989260);
  OUTLINED_FUNCTION_0_6();
}

void sub_23A4CAEE4(__int128 *a1@<X0>, uint64_t a2@<X8>)
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
  char *v13;
  uint64_t v14;
  __int128 v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  __int128 v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  __int128 v24;
  uint64_t v25;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_256989278);
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v20 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_256989280);
  v9 = MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)&v20 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v9);
  v13 = (char *)&v20 - v12;
  sub_23A4D4FF4();
  *(_QWORD *)&v20 = sub_23A4D59A8();
  v24 = *a1;
  v25 = *((_QWORD *)a1 + 2);
  v14 = swift_allocObject();
  v15 = a1[1];
  *(_OWORD *)(v14 + 16) = *a1;
  *(_OWORD *)(v14 + 32) = v15;
  *(_QWORD *)(v14 + 48) = *((_QWORD *)a1 + 4);
  sub_23A4D4FF4();
  sub_23A4CB9EC((uint64_t)&v24);
  sub_23A4D58DC();
  swift_release();
  swift_release();
  v20 = v24;
  v21 = v25;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256988D28);
  sub_23A4D59CC();
  v16 = v22;
  v17 = v23;
  (*(void (**)(char *, char *, uint64_t))(v5 + 16))(v11, v7, v4);
  v18 = &v11[*(int *)(v8 + 36)];
  *(_QWORD *)v18 = v16;
  *((_QWORD *)v18 + 1) = v17;
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  sub_23A4CBA14((uint64_t)v11, (uint64_t)v13);
  sub_23A4C93C4((uint64_t)v13, (uint64_t)v11, &qword_256989280);
  *(_QWORD *)a2 = 0;
  *(_BYTE *)(a2 + 8) = 1;
  v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_256989288);
  sub_23A4C93C4((uint64_t)v11, a2 + *(int *)(v19 + 48), &qword_256989280);
  sub_23A4C94EC((uint64_t)v13, &qword_256989280);
  sub_23A4C94EC((uint64_t)v11, &qword_256989280);
}

uint64_t sub_23A4CB124()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_256988D28);
  return sub_23A4D59D8();
}

void sub_23A4CB174(uint64_t a1@<X8>)
{
  sub_23A4CAD8C(a1);
}

void sub_23A4CB1AC(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>, double a4@<D0>, double a5@<D1>)
{
  uint64_t v5;
  uint64_t v11;
  uint64_t v12;
  uint64_t KeyPath;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (**v17)();
  uint64_t v18;
  uint64_t v19;

  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_256989240);
  OUTLINED_FUNCTION_4_2();
  MEMORY[0x24BDAC7A8](v12);
  OUTLINED_FUNCTION_2_6();
  KeyPath = swift_getKeyPath();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256988D28);
  sub_23A4D59CC();
  v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_256989248);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 16))(v5, a1, v14);
  v15 = (uint64_t *)(v5 + *(int *)(v11 + 36));
  *v15 = KeyPath;
  v15[1] = v18;
  v15[2] = v19;
  v16 = swift_allocObject();
  *(double *)(v16 + 16) = a4;
  *(double *)(v16 + 24) = a5;
  *(_QWORD *)(v16 + 32) = a2;
  sub_23A4C93C4(v5, a3, &qword_256989240);
  v17 = (uint64_t (**)())(a3 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_256989250) + 36));
  *v17 = sub_23A4CB9AC;
  v17[1] = (uint64_t (*)())v16;
  swift_retain();
  sub_23A4C94EC(v5, &qword_256989240);
  OUTLINED_FUNCTION_0_6();
}

double sub_23A4CB2E4()
{
  double v1;

  sub_23A4CB354();
  sub_23A4D5690();
  return v1;
}

uint64_t sub_23A4CB31C()
{
  sub_23A4CB354();
  return sub_23A4D569C();
}

unint64_t sub_23A4CB354()
{
  unint64_t result;

  result = qword_256989230;
  if (!qword_256989230)
  {
    result = MEMORY[0x23B84F540](&unk_23A4D6AC4, &type metadata for AttributionSymbolSizeEnvironmentKey);
    atomic_store(result, (unint64_t *)&qword_256989230);
  }
  return result;
}

ValueMetadata *type metadata accessor for AttributionSymbolSizeEnvironmentKey()
{
  return &type metadata for AttributionSymbolSizeEnvironmentKey;
}

uint64_t sub_23A4CB3A0(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  swift_retain();
  return a1;
}

uint64_t sub_23A4CB3D4()
{
  return swift_release();
}

_QWORD *sub_23A4CB3DC(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  a1[2] = a2[2];
  swift_retain();
  swift_release();
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

uint64_t sub_23A4CB438(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  swift_release();
  return a1;
}

uint64_t sub_23A4CB470(uint64_t a1, unsigned int a2)
{
  int v2;
  unint64_t v3;

  if (a2)
  {
    if (a2 >= 0x7FFFFFFF && *(_BYTE *)(a1 + 24))
    {
      v2 = *(_DWORD *)a1 + 2147483646;
    }
    else
    {
      v3 = *(_QWORD *)(a1 + 16);
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

uint64_t sub_23A4CB4C4(uint64_t result, unsigned int a2, unsigned int a3)
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

void type metadata accessor for AttributionSymbolSizeOffsetModifier()
{
  OUTLINED_FUNCTION_5_4();
}

uint64_t sub_23A4CB524(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *a2;
  *a1 = *a2;
  v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t sub_23A4CB554()
{
  swift_release();
  return swift_bridgeObjectRelease();
}

uint64_t sub_23A4CB57C(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  *(_OWORD *)a1 = *(_OWORD *)a2;
  v3 = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = v3;
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  swift_retain();
  sub_23A4D4FF4();
  return a1;
}

_QWORD *sub_23A4CB5C0(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  a1[2] = a2[2];
  swift_retain();
  swift_release();
  a1[3] = a2[3];
  a1[4] = a2[4];
  sub_23A4D4FF4();
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

uint64_t sub_23A4CB648(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  swift_release();
  v4 = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 32) = v4;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_23A4CB694(uint64_t a1, int a2)
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
      v2 = *(_QWORD *)(a1 + 32);
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

uint64_t sub_23A4CB6D4(uint64_t result, int a2, int a3)
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
      *(_QWORD *)(result + 32) = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 40) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

void type metadata accessor for TipAttributionView()
{
  OUTLINED_FUNCTION_5_4();
}

uint64_t sub_23A4CB728()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_23A4CB738()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_23A4CB748()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_256988D28);
  return sub_23A4D59D8();
}

uint64_t sub_23A4CB79C()
{
  return sub_23A4D5540();
}

void sub_23A4CB7B4(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;

  sub_23A4CB1AC(a1, *(_QWORD *)(v2 + 16), a2, *(double *)v2, *(double *)(v2 + 8));
}

void sub_23A4CB7C0()
{
  xmmword_25698A910 = 0uLL;
}

__int128 *sub_23A4CB7D0()
{
  if (qword_2569885C0 != -1)
    swift_once();
  return &xmmword_25698A910;
}

double sub_23A4CB810(_OWORD *a1, void (*a2)(__int128 *__return_ptr))
{
  double result;
  __int128 v4;

  a2(&v4);
  result = *(double *)&v4;
  *a1 = v4;
  return result;
}

double sub_23A4CB848@<D0>(_OWORD *a1@<X8>)
{
  double result;

  sub_23A4CB7D0();
  result = *(double *)&xmmword_25698A910;
  *a1 = xmmword_25698A910;
  return result;
}

void sub_23A4CB878()
{
  qword_256989220 = 0;
  *(_QWORD *)algn_256989228 = 0;
}

uint64_t *sub_23A4CB888()
{
  if (qword_2569885C8 != -1)
    swift_once();
  return &qword_256989220;
}

__n128 sub_23A4CB8C8@<Q0>(__n128 *a1@<X8>)
{
  __n128 *v2;
  __n128 result;

  v2 = (__n128 *)sub_23A4CB888();
  result = *v2;
  *a1 = *v2;
  return result;
}

uint64_t sub_23A4CB8F0()
{
  sub_23A4CB940();
  return sub_23A4D5588();
}

unint64_t sub_23A4CB940()
{
  unint64_t result;
  uint64_t v1;

  result = qword_256989238;
  if (!qword_256989238)
  {
    type metadata accessor for CGSize();
    result = MEMORY[0x23B84F540](MEMORY[0x24BDBD858], v1);
    atomic_store(result, (unint64_t *)&qword_256989238);
  }
  return result;
}

uint64_t sub_23A4CB988()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_23A4CB9AC()
{
  return sub_23A4CB748();
}

uint64_t sub_23A4CB9B8()
{
  swift_release();
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_23A4CB9E4()
{
  return sub_23A4CB124();
}

uint64_t sub_23A4CB9EC(uint64_t a1)
{
  swift_retain();
  return a1;
}

uint64_t sub_23A4CBA14(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_256989280);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

void type metadata accessor for AttributionSymbolSizePreferenceKey()
{
  OUTLINED_FUNCTION_5_4();
}

unint64_t sub_23A4CBA6C()
{
  unint64_t result;
  uint64_t v1;
  unint64_t v2;
  uint64_t v3;
  _QWORD v4[2];

  result = qword_256989290;
  if (!qword_256989290)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256989250);
    v2 = sub_23A4CBAF0();
    sub_23A4CBC80(&qword_2569892B8, &qword_2569892C0, MEMORY[0x24BDF09B0]);
    v4[0] = v2;
    v4[1] = v3;
    result = MEMORY[0x23B84F540](MEMORY[0x24BDED308], v1, v4);
    atomic_store(result, (unint64_t *)&qword_256989290);
  }
  return result;
}

unint64_t sub_23A4CBAF0()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD v5[2];

  result = qword_256989298;
  if (!qword_256989298)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256989240);
    sub_23A4CBC80(&qword_2569892A0, &qword_256989248, MEMORY[0x24BDEFB78]);
    v3 = v2;
    sub_23A4CBC80(&qword_2569892A8, &qword_2569892B0, MEMORY[0x24BDF1028]);
    v5[0] = v3;
    v5[1] = v4;
    result = MEMORY[0x23B84F540](MEMORY[0x24BDED308], v1, v5);
    atomic_store(result, (unint64_t *)&qword_256989298);
  }
  return result;
}

unint64_t sub_23A4CBB90()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_2569892C8;
  if (!qword_2569892C8)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256989270);
    v2[0] = sub_23A4CBBFC();
    v2[1] = MEMORY[0x24BDECC60];
    result = MEMORY[0x23B84F540](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_2569892C8);
  }
  return result;
}

unint64_t sub_23A4CBBFC()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;
  _QWORD v3[2];

  result = qword_2569892D0;
  if (!qword_2569892D0)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256989260);
    sub_23A4CBC80(qword_2569892D8, &qword_256989258, MEMORY[0x24BDF4498]);
    v3[0] = v2;
    v3[1] = MEMORY[0x24BDECC60];
    result = MEMORY[0x23B84F540](MEMORY[0x24BDED308], v1, v3);
    atomic_store(result, (unint64_t *)&qword_2569892D0);
  }
  return result;
}

void sub_23A4CBC80(unint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v5;

  if (!*a1)
  {
    v5 = __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    atomic_store(MEMORY[0x23B84F540](a3, v5), a1);
  }
  OUTLINED_FUNCTION_3_0();
}

char *sub_23A4CBD10(char *a1, char **a2, uint64_t a3)
{
  int v3;
  char *v4;
  char *v5;
  char *v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(char *, uint64_t, uint64_t);
  char *v12;
  char *v13;

  v3 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  v4 = *a2;
  *(_QWORD *)a1 = *a2;
  if ((v3 & 0x20000) != 0)
  {
    v5 = &v4[(v3 + 16) & ~(unint64_t)v3];
    swift_retain();
  }
  else
  {
    v5 = a1;
    v6 = a2[2];
    *((_QWORD *)a1 + 1) = a2[1];
    *((_QWORD *)a1 + 2) = v6;
    v7 = *(int *)(a3 + 24);
    v8 = &a1[v7];
    v9 = (uint64_t)a2 + v7;
    v10 = sub_23A4D5018();
    v11 = *(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 16);
    v12 = v4;
    v13 = v6;
    v11(v8, v9, v10);
  }
  return v5;
}

uint64_t sub_23A4CBDB8(id *a1, uint64_t a2)
{
  char *v4;
  uint64_t v5;

  v4 = (char *)a1 + *(int *)(a2 + 24);
  v5 = sub_23A4D5018();
  return (*(uint64_t (**)(char *, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(v4, v5);
}

_QWORD *sub_23A4CBE08(_QWORD *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(char *, uint64_t, uint64_t);
  id v12;
  id v13;

  v5 = *(void **)a2;
  v4 = *(_QWORD *)(a2 + 8);
  *a1 = *(_QWORD *)a2;
  a1[1] = v4;
  v6 = *(void **)(a2 + 16);
  a1[2] = v6;
  v7 = *(int *)(a3 + 24);
  v8 = (char *)a1 + v7;
  v9 = a2 + v7;
  v10 = sub_23A4D5018();
  v11 = *(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 16);
  v12 = v5;
  v13 = v6;
  v11(v8, v9, v10);
  return a1;
}

uint64_t sub_23A4CBE88(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  v6 = *(void **)a1;
  v7 = *(void **)a2;
  *(_QWORD *)a1 = *(_QWORD *)a2;
  v8 = v7;

  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  v9 = *(void **)(a1 + 16);
  v10 = *(void **)(a2 + 16);
  *(_QWORD *)(a1 + 16) = v10;
  v11 = v10;

  v12 = *(int *)(a3 + 24);
  v13 = a1 + v12;
  v14 = a2 + v12;
  v15 = sub_23A4D5018();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v15 - 8) + 24))(v13, v14, v15);
  return a1;
}

uint64_t sub_23A4CBF14(uint64_t a1, _QWORD *a2, uint64_t a3)
{
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;

  v6 = *(void **)a1;
  *(_QWORD *)a1 = *a2;

  v7 = *(void **)(a1 + 16);
  v8 = a2[2];
  *(_QWORD *)(a1 + 8) = a2[1];
  *(_QWORD *)(a1 + 16) = v8;

  v9 = *(int *)(a3 + 24);
  v10 = a1 + v9;
  v11 = (char *)a2 + v9;
  v12 = sub_23A4D5018();
  (*(void (**)(uint64_t, char *, uint64_t))(*(_QWORD *)(v12 - 8) + 40))(v10, v11, v12);
  return a1;
}

uint64_t sub_23A4CBF90()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_23A4CBF9C(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  int v5;
  uint64_t v9;

  if ((_DWORD)a2 == 2147483646)
  {
    v4 = *a1;
    if ((unint64_t)*a1 >= 0xFFFFFFFF)
      LODWORD(v4) = -1;
    v5 = v4 - 1;
    if (v5 < 0)
      v5 = -1;
    return (v5 + 1);
  }
  else
  {
    v9 = OUTLINED_FUNCTION_3_4();
    return __swift_getEnumTagSinglePayload((uint64_t)a1 + *(int *)(a3 + 24), a2, v9);
  }
}

uint64_t sub_23A4CC018()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

_QWORD *sub_23A4CC024(_QWORD *result, uint64_t a2, int a3, uint64_t a4)
{
  _QWORD *v5;
  uint64_t v7;

  v5 = result;
  if (a3 == 2147483646)
  {
    *result = a2;
  }
  else
  {
    v7 = OUTLINED_FUNCTION_3_4();
    return (_QWORD *)__swift_storeEnumTagSinglePayload((uint64_t)v5 + *(int *)(a4 + 24), a2, a2, v7);
  }
  return result;
}

uint64_t type metadata accessor for PunchoutModifier()
{
  uint64_t result;

  result = qword_256989338;
  if (!qword_256989338)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_23A4CC0C4()
{
  uint64_t result;
  unint64_t v1;

  result = sub_23A4D5018();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t sub_23A4CC140()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_23A4CC150@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  char *v4;
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
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  uint64_t v21;
  unint64_t v22;
  id v23;
  uint64_t v24;
  char *v25;
  uint64_t v26;
  uint64_t v28;
  void (*v29)(char *, uint64_t, uint64_t);
  uint64_t v30;
  unint64_t v31;
  char *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  char *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  unint64_t v43;

  v34 = a1;
  v40 = a2;
  v41 = __swift_instantiateConcreteTypeFromMangledName(&qword_256989378);
  v35 = *(_QWORD *)(v41 - 8);
  MEMORY[0x24BDAC7A8](v41);
  v4 = (char *)&v32 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v37 = __swift_instantiateConcreteTypeFromMangledName(&qword_256989380);
  MEMORY[0x24BDAC7A8](v37);
  v39 = (char *)&v32 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = type metadata accessor for PunchoutModifier();
  v7 = *(_QWORD *)(v6 - 8);
  v8 = *(_QWORD *)(v7 + 64);
  MEMORY[0x24BDAC7A8](v6);
  v36 = __swift_instantiateConcreteTypeFromMangledName(&qword_256989388);
  MEMORY[0x24BDAC7A8](v36);
  v10 = (char *)&v32 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v38 = __swift_instantiateConcreteTypeFromMangledName(&qword_256989390);
  v33 = *(_QWORD *)(v38 - 8);
  v11 = MEMORY[0x24BDAC7A8](v38);
  v13 = (char *)&v32 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v11);
  v32 = (char *)&v32 - v14;
  v15 = *(void **)(v2 + 16);
  if (v15 && (v16 = v2, objc_opt_self(), (v17 = swift_dynamicCastObjCClass()) != 0))
  {
    v18 = v17;
    (*(void (**)(char *, uint64_t, uint64_t))(v35 + 16))(v10, v34, v41);
    v19 = v36;
    v10[*(int *)(v36 + 36)] = 0;
    sub_23A4CC77C(v16, (uint64_t)&v32 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0));
    v20 = (*(unsigned __int8 *)(v7 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
    v21 = swift_allocObject();
    sub_23A4CC864((uint64_t)&v32 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0), v21 + v20);
    *(_QWORD *)(v21 + ((v8 + v20 + 7) & 0xFFFFFFFFFFFFFFF8)) = v18;
    v22 = sub_23A4CC6A0();
    v23 = v15;
    sub_23A4D590C();
    swift_release();
    sub_23A4CC8E8((uint64_t)v10);
    v25 = v32;
    v24 = v33;
    v26 = v38;
    (*(void (**)(char *, char *, uint64_t))(v33 + 32))(v32, v13, v38);
    (*(void (**)(char *, char *, uint64_t))(v24 + 16))(v39, v25, v26);
    swift_storeEnumTagMultiPayload();
    v42 = v19;
    v43 = v22;
    swift_getOpaqueTypeConformance2();
    sub_23A4CC73C(&qword_2569893A0, &qword_256989378, MEMORY[0x24BDEFB78]);
    sub_23A4D56FC();

    return (*(uint64_t (**)(char *, uint64_t))(v24 + 8))(v25, v26);
  }
  else
  {
    v28 = v35;
    v29 = *(void (**)(char *, uint64_t, uint64_t))(v35 + 16);
    v30 = v41;
    v29(v4, v34, v41);
    v29(v39, (uint64_t)v4, v30);
    swift_storeEnumTagMultiPayload();
    v31 = sub_23A4CC6A0();
    v42 = v36;
    v43 = v31;
    swift_getOpaqueTypeConformance2();
    sub_23A4CC73C(&qword_2569893A0, &qword_256989378, MEMORY[0x24BDEFB78]);
    sub_23A4D56FC();
    return (*(uint64_t (**)(char *, uint64_t))(v28 + 8))(v4, v30);
  }
}

uint64_t sub_23A4CC520(id *a1, void *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t result;
  uint64_t v14;

  v4 = sub_23A4D5018();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = type metadata accessor for PunchoutModifier();
  (*(void (**)(char *, char *, uint64_t))(v5 + 16))(v7, (char *)a1 + *(int *)(v8 + 24), v4);
  type metadata accessor for ActionHandler();
  v9 = swift_allocObject();
  sub_23A4D5450();
  (*(void (**)(uint64_t, char *, uint64_t))(v5 + 32))(v9 + OBJC_IVAR____TtC14DeviceExpertUI13ActionHandler_flowContext, v7, v4);
  if (*a1)
  {
    v10 = *a1;
    sub_23A4D0128(a2);

    swift_setDeallocating();
    v11 = v9 + OBJC_IVAR____TtC14DeviceExpertUI13ActionHandler_logger;
    v12 = sub_23A4D5468();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 8))(v11, v12);
    (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v9 + OBJC_IVAR____TtC14DeviceExpertUI13ActionHandler_flowContext, v4);
    return swift_deallocClassInstance();
  }
  else
  {
    sub_23A4D5AE0();
    sub_23A4CC928();
    result = sub_23A4D55D0();
    __break(1u);
  }
  return result;
}

unint64_t sub_23A4CC6A0()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_256989398;
  if (!qword_256989398)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256989388);
    v2[0] = sub_23A4CC73C(&qword_2569893A0, &qword_256989378, MEMORY[0x24BDEFB78]);
    v2[1] = sub_23A4CC73C((unint64_t *)&qword_2569886C0, &qword_2569886C8, MEMORY[0x24BDEFAD8]);
    result = MEMORY[0x23B84F540](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_256989398);
  }
  return result;
}

uint64_t sub_23A4CC73C(unint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    result = MEMORY[0x23B84F540](a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_23A4CC77C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for PunchoutModifier();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_23A4CC7C0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v1 = type metadata accessor for PunchoutModifier();
  v2 = *(_QWORD *)(v1 - 8);
  v3 = (*(unsigned __int8 *)(v2 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  v4 = (*(_QWORD *)(v2 + 64) + v3 + 7) & 0xFFFFFFFFFFFFFFF8;
  v5 = v0 + v3;

  v6 = v5 + *(int *)(v1 + 24);
  v7 = OUTLINED_FUNCTION_3_4();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 8))(v6, v7);

  return swift_deallocObject();
}

uint64_t sub_23A4CC864(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for PunchoutModifier();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_23A4CC8A8()
{
  uint64_t v0;
  uint64_t v1;
  unint64_t v2;

  v1 = *(_QWORD *)(type metadata accessor for PunchoutModifier() - 8);
  v2 = (*(unsigned __int8 *)(v1 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80);
  return sub_23A4CC520((id *)(v0 + v2), *(void **)(v0 + ((*(_QWORD *)(v1 + 64) + v2 + 7) & 0xFFFFFFFFFFFFF8)));
}

uint64_t sub_23A4CC8E8(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_256989388);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_23A4CC928()
{
  unint64_t result;
  uint64_t v1;

  result = qword_2569886D0;
  if (!qword_2569886D0)
  {
    v1 = sub_23A4D5AE0();
    result = MEMORY[0x23B84F540](MEMORY[0x24BEAE520], v1);
    atomic_store(result, (unint64_t *)&qword_2569886D0);
  }
  return result;
}

unint64_t sub_23A4CC96C()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[4];

  result = qword_2569893A8;
  if (!qword_2569893A8)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2569893B0);
    v2[2] = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256989388);
    v2[3] = sub_23A4CC6A0();
    v2[0] = swift_getOpaqueTypeConformance2();
    v2[1] = sub_23A4CC73C(&qword_2569893A0, &qword_256989378, MEMORY[0x24BDEFB78]);
    result = MEMORY[0x23B84F540](MEMORY[0x24BDEF3E0], v1, v2);
    atomic_store(result, (unint64_t *)&qword_2569893A8);
  }
  return result;
}

void sub_23A4CCA18()
{
  sub_23A4D5CCC();
  OUTLINED_FUNCTION_3_0();
}

void sub_23A4CCA38()
{
  sub_23A4CCA18();
}

void sub_23A4CCA40()
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
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char v17;
  unint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t, uint64_t, char, uint64_t);
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  char v26;
  char v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;

  OUTLINED_FUNCTION_9_4();
  v2 = v1;
  v30 = v3;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_256989470);
  MEMORY[0x24BDAC7A8](v4);
  OUTLINED_FUNCTION_1();
  v7 = v6 - v5;
  v8 = OUTLINED_FUNCTION_11_2();
  v9 = *(_QWORD *)(v8 - 8);
  v10 = *(_QWORD *)(v9 + 64);
  MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)&v29 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = sub_23A4D55AC();
  OUTLINED_FUNCTION_7_3();
  MEMORY[0x24BDAC7A8](v13);
  OUTLINED_FUNCTION_1();
  v16 = v15 - v14;
  OUTLINED_FUNCTION_3_5();
  sub_23A4CE83C();
  v17 = sub_23A4D55A0();
  (*(void (**)(uint64_t, uint64_t))(v0 + 8))(v16, v12);
  sub_23A4CEA48(v2, (uint64_t)v11);
  v18 = (*(unsigned __int8 *)(v9 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80);
  if ((v17 & 1) != 0)
    v19 = sub_23A4CED7C;
  else
    v19 = sub_23A4CEAD4;
  v20 = swift_allocObject();
  sub_23A4CEA90((uint64_t)v11, v20 + v18);
  v21 = sub_23A4CCE68();
  v23 = v22;
  v24 = v2 + *(int *)(v8 + 20);
  v25 = *(_QWORD *)v24;
  v26 = *(_BYTE *)(v24 + 8);
  sub_23A4CDE84(*(_QWORD *)v24, v26);
  v27 = sub_23A4CEAE0(v25, v26);
  sub_23A4CDF24(v25, v26);
  v28 = 0x4010000000000000;
  *(_QWORD *)v7 = v21;
  *(_QWORD *)(v7 + 8) = v23;
  if ((v27 & 1) == 0)
    v28 = 0x4018000000000000;
  *(_QWORD *)(v7 + 16) = v28;
  *(_BYTE *)(v7 + 24) = 0;
  *(_QWORD *)(v7 + 32) = 0x4018000000000000;
  *(_BYTE *)(v7 + 40) = 0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256989478);
  sub_23A4CCF18(v2, (uint64_t)v19, v20);
  swift_release();
  sub_23A4C4E94(v7, v30, &qword_256989470);
  OUTLINED_FUNCTION_1_3();
}

uint64_t sub_23A4CCC3C(uint64_t a1, uint64_t a2, unint64_t a3, char a4, uint64_t a5)
{
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v18;

  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_256989480);
  v11 = MEMORY[0x24BDAC7A8](v10);
  v13 = (char *)&v18 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(_QWORD *)v13 = 0;
  v13[8] = 1;
  v14 = &v13[*(int *)(v11 + 36)];
  *(_QWORD *)v14 = sub_23A4D56F0();
  *((_QWORD *)v14 + 1) = 0x4010000000000000;
  v14[16] = 0;
  v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_256989488);
  sub_23A4CD0E4(a1, a2, a3, a4 & 1, a5, &v14[*(int *)(v15 + 44)]);
  sub_23A4CBC80(&qword_256989490, &qword_256989480, MEMORY[0x24BDF4A68]);
  v16 = sub_23A4D5864();
  sub_23A4C94EC((uint64_t)v13, &qword_256989480);
  return v16;
}

uint64_t sub_23A4CCD64(uint64_t a1, uint64_t a2, unint64_t a3, char a4, uint64_t a5, uint64_t a6)
{
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v18;

  v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_256989550);
  v13 = MEMORY[0x24BDAC7A8](v12);
  v15 = (char *)&v18 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(_QWORD *)v15 = 0;
  v15[8] = 1;
  sub_23A4CD800(a6, a1, a2, a3, a4 & 1, a5, (uint64_t)&v15[*(int *)(v13 + 36)]);
  sub_23A4CBC80(&qword_256989558, &qword_256989550, MEMORY[0x24BDF4A68]);
  v16 = sub_23A4D5864();
  sub_23A4C94EC((uint64_t)v15, &qword_256989550);
  return v16;
}

uint64_t sub_23A4CCE68()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char v3;
  char v4;
  uint64_t v5;

  v1 = v0 + *(int *)(type metadata accessor for ItemListView() + 20);
  v2 = *(_QWORD *)v1;
  v3 = *(_BYTE *)(v1 + 8);
  sub_23A4CDE84(*(_QWORD *)v1, v3);
  v4 = sub_23A4CEAE0(v2, v3);
  sub_23A4CDF24(v2, v3);
  if ((v4 & 1) != 0)
  {
    if (qword_2569885D0 != -1)
      swift_once();
    return qword_2569893B8;
  }
  else
  {
    v5 = sub_23A4D56F0();
    sub_23A4D56A8();
  }
  return v5;
}

uint64_t sub_23A4CCF18(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  type metadata accessor for ItemListView();
  v5 = sub_23A4D4FF4();
  sub_23A4CF3A4(v5);
  swift_bridgeObjectRelease();
  swift_getKeyPath();
  v6 = swift_allocObject();
  *(_QWORD *)(v6 + 16) = a2;
  *(_QWORD *)(v6 + 24) = a3;
  v7 = swift_allocObject();
  *(_QWORD *)(v7 + 16) = sub_23A4CF524;
  *(_QWORD *)(v7 + 24) = v6;
  swift_retain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256989538);
  sub_23A4CBC80(&qword_256989540, &qword_256989538, MEMORY[0x24BEE12D8]);
  return sub_23A4D59F0();
}

uint64_t sub_23A4CD048(uint64_t result, uint64_t a2, uint64_t (*a3)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))
{
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v3 = result + 1;
  if (__OFADD__(result, 1))
  {
    __break(1u);
  }
  else
  {
    v5 = sub_23A4C9648(a2);
    v7 = v6;
    v9 = v8 & 1;
    v11 = a3(v3, v5, v6, v9, v10);
    sub_23A4BCD04(v5, v7, v9);
    swift_bridgeObjectRelease();
    return v11;
  }
  return result;
}

uint64_t sub_23A4CD0E4@<X0>(uint64_t a1@<X1>, uint64_t a2@<X2>, unint64_t a3@<X3>, char a4@<W4>, uint64_t a5@<X5>, char *a6@<X8>)
{
  uint64_t v9;
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
  void (*v22)(char *, char *, uint64_t);
  uint64_t v23;
  void (*v24)(char *, uint64_t);
  uint64_t v26;
  unint64_t v27;
  uint64_t v28;

  v27 = a3;
  v28 = a5;
  v26 = a2;
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_256989498);
  v10 = *(_QWORD *)(v9 - 8);
  v11 = MEMORY[0x24BDAC7A8](v9);
  v13 = (char *)&v26 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = MEMORY[0x24BDAC7A8](v11);
  v16 = (char *)&v26 - v15;
  v17 = MEMORY[0x24BDAC7A8](v14);
  v19 = (char *)&v26 - v18;
  MEMORY[0x24BDAC7A8](v17);
  v21 = (char *)&v26 - v20;
  sub_23A4CD274(a1, (uint64_t)&v26 - v20);
  sub_23A4CD560(v26, v27, a4 & 1, v28, (uint64_t)v19);
  v22 = *(void (**)(char *, char *, uint64_t))(v10 + 16);
  v22(v16, v21, v9);
  v22(v13, v19, v9);
  v22(a6, v16, v9);
  v23 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569894A0);
  v22(&a6[*(int *)(v23 + 48)], v13, v9);
  v24 = *(void (**)(char *, uint64_t))(v10 + 8);
  v24(v19, v9);
  v24(v21, v9);
  v24(v13, v9);
  return ((uint64_t (*)(char *, uint64_t))v24)(v16, v9);
}

uint64_t sub_23A4CD274@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char v19;
  uint64_t KeyPath;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  uint64_t v25;
  char *v26;
  uint64_t v27;
  char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  char *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  char *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  char v50;

  v3 = v2;
  v43 = a2;
  v5 = sub_23A4D4F40();
  v41 = *(_QWORD *)(v5 - 8);
  v42 = v5;
  MEMORY[0x24BDAC7A8](v5);
  v40 = (char *)&v33 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_23A4D5AC8();
  v35 = *(_QWORD *)(v7 - 8);
  v36 = v7;
  MEMORY[0x24BDAC7A8](v7);
  v9 = (char **)((char *)&v33 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0));
  v34 = sub_23A4D5A74();
  v37 = *(_QWORD *)(v34 - 8);
  MEMORY[0x24BDAC7A8](v34);
  v11 = (char *)&v33 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569894A8);
  v13 = *(_QWORD *)(v12 - 8);
  v38 = v12;
  v39 = v13;
  MEMORY[0x24BDAC7A8](v12);
  v33 = (char *)&v33 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23A4CD9C8(v3, a1, (uint64_t)&v44);
  v16 = v44;
  v15 = v45;
  v18 = v46;
  v17 = v47;
  v19 = v48;
  LODWORD(a1) = sub_23A4D5720();
  KeyPath = swift_getKeyPath();
  v44 = v16;
  v45 = v15;
  v46 = v18;
  v47 = v17;
  LOBYTE(v48) = v19;
  HIDWORD(v48) = a1;
  v49 = KeyPath;
  v50 = 1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2569894C0);
  sub_23A4CEE48();
  v21 = sub_23A4D5864();
  sub_23A4CF038(v16, v15, v18);
  swift_release();
  v47 = MEMORY[0x24BDF4780];
  v48 = MEMORY[0x24BEAD938];
  v44 = v21;
  sub_23A4D5A68();
  *v9 = 0;
  v9[1] = 0;
  v23 = v35;
  v22 = v36;
  (*(void (**)(_QWORD *, _QWORD, uint64_t))(v35 + 104))(v9, *MEMORY[0x24BEAE3D0], v36);
  v24 = sub_23A4C665C();
  v26 = v33;
  v25 = v34;
  sub_23A4D58D0();
  (*(void (**)(_QWORD *, uint64_t))(v23 + 8))(v9, v22);
  v27 = v25;
  (*(void (**)(char *, uint64_t))(v37 + 8))(v11, v25);
  v28 = v40;
  v29 = v41;
  v30 = v42;
  (*(void (**)(char *, _QWORD, uint64_t))(v41 + 104))(v40, *MEMORY[0x24BEAB508], v42);
  v44 = v27;
  v45 = v24;
  swift_getOpaqueTypeConformance2();
  v31 = v38;
  sub_23A4D5894();
  (*(void (**)(char *, uint64_t))(v29 + 8))(v28, v30);
  return (*(uint64_t (**)(char *, uint64_t))(v39 + 8))(v26, v31);
}

uint64_t sub_23A4CD560@<X0>(uint64_t a1@<X0>, unint64_t a2@<X1>, char a3@<W2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD *v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  uint64_t v22;
  unint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  unint64_t v36;
  char v37;
  uint64_t v38;
  uint64_t v39;

  v28 = a4;
  v34 = a5;
  v8 = sub_23A4D4F40();
  v32 = *(_QWORD *)(v8 - 8);
  v33 = v8;
  MEMORY[0x24BDAC7A8](v8);
  v10 = (char *)&v28 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = sub_23A4D5AC8();
  v12 = *(_QWORD *)(v11 - 8);
  MEMORY[0x24BDAC7A8](v11);
  v14 = (uint64_t *)((char *)&v28 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0));
  v15 = sub_23A4D5A74();
  v29 = *(_QWORD *)(v15 - 8);
  MEMORY[0x24BDAC7A8](v15);
  v17 = (char *)&v28 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569894A8);
  v19 = *(_QWORD *)(v18 - 8);
  v30 = v18;
  v31 = v19;
  MEMORY[0x24BDAC7A8](v18);
  v21 = (char *)&v28 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  v35 = a1;
  v36 = a2;
  v37 = a3 & 1;
  v38 = v28;
  LOWORD(v39) = 256;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2569894B0);
  sub_23A4CEFD4(&qword_2569894B8, &qword_2569894B0, MEMORY[0x24BDEDB80], MEMORY[0x24BDED308]);
  v22 = sub_23A4D5864();
  v38 = MEMORY[0x24BDF4780];
  v39 = MEMORY[0x24BEAD938];
  v35 = v22;
  sub_23A4D5A68();
  *v14 = 0;
  v14[1] = 0;
  (*(void (**)(_QWORD *, _QWORD, uint64_t))(v12 + 104))(v14, *MEMORY[0x24BEAE3D0], v11);
  v23 = sub_23A4C665C();
  sub_23A4D58D0();
  (*(void (**)(_QWORD *, uint64_t))(v12 + 8))(v14, v11);
  (*(void (**)(char *, uint64_t))(v29 + 8))(v17, v15);
  v25 = v32;
  v24 = v33;
  (*(void (**)(char *, _QWORD, uint64_t))(v32 + 104))(v10, *MEMORY[0x24BEAB508], v33);
  v35 = v15;
  v36 = v23;
  swift_getOpaqueTypeConformance2();
  v26 = v30;
  sub_23A4D5894();
  (*(void (**)(char *, uint64_t))(v25 + 8))(v10, v24);
  return (*(uint64_t (**)(char *, uint64_t))(v31 + 8))(v21, v26);
}

uint64_t sub_23A4CD800@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, unint64_t a4@<X3>, int a5@<W4>, uint64_t a6@<X5>, uint64_t a7@<X8>)
{
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t KeyPath;
  void (*v20)(char *, char *, uint64_t);
  char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void (*v25)(char *, uint64_t);
  uint64_t v27;
  uint64_t v28;
  int v29;
  char *v30;
  uint64_t v31;
  int v32;
  uint64_t v33;
  unint64_t v34;
  uint64_t v35;
  uint64_t v36;
  _QWORD v37[4];
  char v38;

  v34 = a4;
  v35 = a6;
  v32 = a5;
  v33 = a3;
  v31 = __swift_instantiateConcreteTypeFromMangledName(&qword_256989498);
  v36 = *(_QWORD *)(v31 - 8);
  v10 = MEMORY[0x24BDAC7A8](v31);
  v12 = (char *)&v27 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v10);
  v14 = (char *)&v27 - v13;
  sub_23A4CD9C8(a1, a2, (uint64_t)v37);
  v15 = v37[0];
  v16 = v37[1];
  v28 = v37[0];
  v17 = v37[2];
  v18 = v37[3];
  LOBYTE(a2) = v38;
  v29 = sub_23A4D5720();
  KeyPath = swift_getKeyPath();
  v30 = v14;
  sub_23A4CD560(v33, v34, v32 & 1, v35, (uint64_t)v14);
  v20 = *(void (**)(char *, char *, uint64_t))(v36 + 16);
  v21 = v14;
  v22 = v31;
  v20(v12, v21, v31);
  *(_QWORD *)a7 = v15;
  *(_QWORD *)(a7 + 8) = v16;
  *(_QWORD *)(a7 + 16) = v17;
  *(_QWORD *)(a7 + 24) = v18;
  *(_BYTE *)(a7 + 32) = a2;
  *(_DWORD *)(a7 + 36) = v29;
  *(_QWORD *)(a7 + 40) = KeyPath;
  *(_BYTE *)(a7 + 48) = 1;
  v23 = __swift_instantiateConcreteTypeFromMangledName(&qword_256989560);
  v20((char *)(a7 + *(int *)(v23 + 48)), v12, v22);
  v24 = v28;
  sub_23A4CF57C(v28, v16, v17);
  v25 = *(void (**)(char *, uint64_t))(v36 + 8);
  swift_retain();
  v25(v30, v22);
  v25(v12, v22);
  sub_23A4CF038(v24, v16, v17);
  return swift_release();
}

double sub_23A4CD9C8@<D0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  char v13;
  char v14;
  __int128 v15;
  double result;
  __int128 v17;
  char v18;
  __int128 v19;
  uint64_t v20;
  uint64_t v21;
  char v22;
  __int128 v23;
  __int128 v24;
  char v25;

  v6 = sub_23A4D4F28();
  MEMORY[0x24BDAC7A8](v6);
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_256989520);
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7);
  v10 = (char *)&v19 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = a1 + *(int *)(type metadata accessor for ItemListView() + 20);
  v12 = *(_QWORD *)v11;
  v13 = *(_BYTE *)(v11 + 8);
  sub_23A4CDE84(*(_QWORD *)v11, v13);
  v14 = sub_23A4CEAE0(v12, v13);
  sub_23A4CDF24(v12, v13);
  if ((v14 & 1) != 0)
  {
    v19 = xmmword_23A4D6C40;
    v20 = 0;
    v21 = MEMORY[0x24BEE4AF8];
    v22 = 1;
  }
  else
  {
    *(_QWORD *)&v23 = a2;
    sub_23A4D4F04();
    sub_23A4CF060();
    sub_23A4D4E8C();
    sub_23A4CBC80(&qword_256989530, &qword_256989520, MEMORY[0x24BDCC928]);
    sub_23A4D5C00();
    (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
    v15 = v19;
    swift_bridgeObjectRelease();
    v23 = v15;
    sub_23A4D5B34();
    v19 = v23;
    v20 = 0;
    v21 = MEMORY[0x24BEE4AF8];
    v22 = 0;
  }
  sub_23A4D56FC();
  result = *(double *)&v23;
  v17 = v24;
  v18 = v25;
  *(_OWORD *)a3 = v23;
  *(_OWORD *)(a3 + 16) = v17;
  *(_BYTE *)(a3 + 32) = v18;
  return result;
}

uint64_t sub_23A4CDBD4()
{
  unsigned __int8 v1;

  sub_23A4CDC48();
  sub_23A4D5690();
  return v1;
}

uint64_t sub_23A4CDC0C()
{
  sub_23A4CDC48();
  return sub_23A4D569C();
}

unint64_t sub_23A4CDC48()
{
  unint64_t result;

  result = qword_2569893C8;
  if (!qword_2569893C8)
  {
    result = MEMORY[0x23B84F540](&unk_23A4D6D30, &_s27ItemListStyleEnvironmentKeyVN);
    atomic_store(result, (unint64_t *)&qword_2569893C8);
  }
  return result;
}

ValueMetadata *_s27ItemListStyleEnvironmentKeyVMa()
{
  return &_s27ItemListStyleEnvironmentKeyVN;
}

uint64_t storeEnumTagSinglePayload for ItemListView.ListStyle(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_23A4CDCE0 + 4 * byte_23A4D6C55[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_23A4CDD14 + 4 * byte_23A4D6C50[v4]))();
}

uint64_t sub_23A4CDD14(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_23A4CDD1C(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x23A4CDD24);
  return result;
}

uint64_t sub_23A4CDD30(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x23A4CDD38);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_23A4CDD3C(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23A4CDD44(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for ItemListView.ListStyle()
{
  return &type metadata for ItemListView.ListStyle;
}

uint64_t *sub_23A4CDD60(uint64_t *a1, uint64_t *a2, int *a3)
{
  int v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  char *v11;
  uint64_t v12;
  char v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD *v16;
  _QWORD *v17;
  uint64_t v18;

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
    __swift_instantiateConcreteTypeFromMangledName(&qword_2569887D8);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v7 = sub_23A4D55AC();
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a1, a2, v7);
    }
    else
    {
      *a1 = *a2;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
    v9 = a3[5];
    v10 = (char *)a1 + v9;
    v11 = (char *)a2 + v9;
    v12 = *(_QWORD *)v11;
    v13 = v11[8];
    sub_23A4CDE84(*(_QWORD *)v11, v13);
    *(_QWORD *)v10 = v12;
    v10[8] = v13;
    v14 = a3[6];
    v15 = a3[7];
    v16 = (uint64_t *)((char *)a1 + v14);
    v17 = (uint64_t *)((char *)a2 + v14);
    v18 = v17[1];
    *v16 = *v17;
    v16[1] = v18;
    *(uint64_t *)((char *)a1 + v15) = *(uint64_t *)((char *)a2 + v15);
    swift_retain();
    sub_23A4D4FF4();
  }
  return a1;
}

uint64_t sub_23A4CDE84(uint64_t a1, char a2)
{
  uint64_t result;

  if ((a2 & 1) == 0)
    return swift_retain();
  return result;
}

uint64_t sub_23A4CDE90(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  __swift_instantiateConcreteTypeFromMangledName(&qword_2569887D8);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v4 = sub_23A4D55AC();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(a1, v4);
  }
  else
  {
    swift_release();
  }
  sub_23A4CDF24(*(_QWORD *)(a1 + *(int *)(a2 + 20)), *(_BYTE *)(a1 + *(int *)(a2 + 20) + 8));
  swift_release();
  return swift_bridgeObjectRelease();
}

uint64_t sub_23A4CDF24(uint64_t a1, char a2)
{
  uint64_t result;

  if ((a2 & 1) == 0)
    return swift_release();
  return result;
}

_QWORD *sub_23A4CDF30(_QWORD *a1, _QWORD *a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  char *v8;
  char *v9;
  uint64_t v10;
  char v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD *v14;
  _QWORD *v15;
  uint64_t v16;

  __swift_instantiateConcreteTypeFromMangledName(&qword_2569887D8);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v6 = sub_23A4D55AC();
    (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(a1, a2, v6);
  }
  else
  {
    *a1 = *a2;
    swift_retain();
  }
  swift_storeEnumTagMultiPayload();
  v7 = a3[5];
  v8 = (char *)a1 + v7;
  v9 = (char *)a2 + v7;
  v10 = *(_QWORD *)v9;
  v11 = v9[8];
  sub_23A4CDE84(*(_QWORD *)v9, v11);
  *(_QWORD *)v8 = v10;
  v8[8] = v11;
  v12 = a3[6];
  v13 = a3[7];
  v14 = (_QWORD *)((char *)a1 + v12);
  v15 = (_QWORD *)((char *)a2 + v12);
  v16 = v15[1];
  *v14 = *v15;
  v14[1] = v16;
  *(_QWORD *)((char *)a1 + v13) = *(_QWORD *)((char *)a2 + v13);
  swift_retain();
  sub_23A4D4FF4();
  return a1;
}

_QWORD *sub_23A4CE028(_QWORD *a1, _QWORD *a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  char *v8;
  char *v9;
  uint64_t v10;
  char v11;
  uint64_t v12;
  char v13;
  uint64_t v14;
  _QWORD *v15;
  _QWORD *v16;

  if (a1 != a2)
  {
    sub_23A4C94EC((uint64_t)a1, &qword_2569887D8);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2569887D8);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v6 = sub_23A4D55AC();
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
  v10 = *(_QWORD *)v9;
  v11 = v9[8];
  sub_23A4CDE84(*(_QWORD *)v9, v11);
  v12 = *(_QWORD *)v8;
  v13 = v8[8];
  *(_QWORD *)v8 = v10;
  v8[8] = v11;
  sub_23A4CDF24(v12, v13);
  v14 = a3[6];
  v15 = (_QWORD *)((char *)a1 + v14);
  v16 = (_QWORD *)((char *)a2 + v14);
  *v15 = *v16;
  v15[1] = v16[1];
  swift_retain();
  swift_release();
  *(_QWORD *)((char *)a1 + a3[7]) = *(_QWORD *)((char *)a2 + a3[7]);
  sub_23A4D4FF4();
  swift_bridgeObjectRelease();
  return a1;
}

char *sub_23A4CE164(char *a1, char *a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  char *v11;

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569887D8);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v7 = sub_23A4D55AC();
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
  *(_QWORD *)v10 = *(_QWORD *)v11;
  v10[8] = v11[8];
  *(_OWORD *)&a1[v9] = *(_OWORD *)&a2[v9];
  *(_QWORD *)&a1[a3[7]] = *(_QWORD *)&a2[a3[7]];
  return a1;
}

char *sub_23A4CE230(char *a1, char *a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  char v13;
  uint64_t v14;
  char *v15;
  char *v16;

  if (a1 != a2)
  {
    sub_23A4C94EC((uint64_t)a1, &qword_2569887D8);
    v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569887D8);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v7 = sub_23A4D55AC();
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
  v11 = *(_QWORD *)v10;
  LOBYTE(v10) = v10[8];
  v12 = *(_QWORD *)v9;
  v13 = v9[8];
  *(_QWORD *)v9 = v11;
  v9[8] = (char)v10;
  sub_23A4CDF24(v12, v13);
  v14 = a3[6];
  v15 = &a1[v14];
  v16 = &a2[v14];
  *(_QWORD *)v15 = *(_QWORD *)v16;
  *((_QWORD *)v15 + 1) = *((_QWORD *)v16 + 1);
  swift_release();
  *(_QWORD *)&a1[a3[7]] = *(_QWORD *)&a2[a3[7]];
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_23A4CE344()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_23A4CE350(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  unint64_t v8;

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_256988A60);
  if (*(_DWORD *)(*(_QWORD *)(v6 - 8) + 84) == (_DWORD)a2)
    return __swift_getEnumTagSinglePayload(a1, a2, v6);
  v8 = *(_QWORD *)(a1 + *(int *)(a3 + 28));
  if (v8 >= 0xFFFFFFFF)
    LODWORD(v8) = -1;
  return (v8 + 1);
}

uint64_t sub_23A4CE3CC()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_23A4CE3D8(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result;

  result = __swift_instantiateConcreteTypeFromMangledName(&qword_256988A60);
  if (*(_DWORD *)(*(_QWORD *)(result - 8) + 84) == a3)
    return __swift_storeEnumTagSinglePayload(a1, a2, a2, result);
  *(_QWORD *)(a1 + *(int *)(a4 + 28)) = (a2 - 1);
  return result;
}

uint64_t type metadata accessor for ItemListView()
{
  uint64_t result;

  result = qword_256989428;
  if (!qword_256989428)
    return swift_getSingletonMetadata();
  return result;
}

void sub_23A4CE488()
{
  unint64_t v0;

  sub_23A4CE510();
  if (v0 <= 0x3F)
    swift_initStructMetadata();
}

void sub_23A4CE510()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_256988B48[0])
  {
    sub_23A4D55AC();
    v0 = sub_23A4D54F8();
    if (!v1)
      atomic_store(v0, qword_256988B48);
  }
}

unint64_t sub_23A4CE568()
{
  unint64_t result;

  result = qword_256989468;
  if (!qword_256989468)
  {
    result = MEMORY[0x23B84F540](&unk_23A4D6D08, &type metadata for ItemListView.ListStyle);
    atomic_store(result, (unint64_t *)&qword_256989468);
  }
  return result;
}

void sub_23A4CE5A8(_BYTE *a1@<X8>)
{
  *a1 = 0;
}

uint64_t sub_23A4CE5B0()
{
  sub_23A4CE568();
  return sub_23A4D5588();
}

uint64_t sub_23A4CE600()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_23A4CE610()
{
  uint64_t v0;
  uint64_t result;

  v0 = sub_23A4D56E4();
  result = sub_23A4D56B4();
  qword_2569893B8 = v0;
  unk_2569893C0 = result;
  return result;
}

void sub_23A4CE640()
{
  sub_23A4CE83C();
}

void sub_23A4CE670()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char v3;
  char v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  os_log_type_t v14;
  NSObject *v15;
  os_log_type_t v16;
  uint8_t *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;

  OUTLINED_FUNCTION_9_4();
  v19 = v1;
  v20 = v2;
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v9 = sub_23A4D5684();
  OUTLINED_FUNCTION_7_3();
  MEMORY[0x24BDAC7A8](v10);
  OUTLINED_FUNCTION_1();
  v13 = v12 - v11;
  if ((v4 & 1) == 0)
  {
    swift_retain();
    v14 = sub_23A4D5BC4();
    v15 = sub_23A4D572C();
    v16 = v14;
    if (os_log_type_enabled(v15, v14))
    {
      v17 = (uint8_t *)OUTLINED_FUNCTION_4_5();
      v18 = OUTLINED_FUNCTION_4_5();
      *(_DWORD *)v17 = 136315138;
      sub_23A4BA75C(0x657A69534743, 0xE600000000000000, &v18);
      sub_23A4D5BE8();
      _os_log_impl(&dword_23A4B7000, v15, v16, "Accessing Environment<%s>'s value outside of being installed on a View. This will always read the default value and will not update.", v17, 0xCu);
      swift_arrayDestroy();
      OUTLINED_FUNCTION_1_7();
    }

    sub_23A4D5678();
    swift_getAtKeyPath();
    sub_23A4C2740(v8, v6, 0);
    (*(void (**)(uint64_t, uint64_t))(v0 + 8))(v13, v9);
  }
}

void sub_23A4CE810()
{
  sub_23A4CE83C();
}

void sub_23A4CE83C()
{
  uint64_t v0;
  uint64_t v1;
  unint64_t v2;
  unint64_t v3;
  uint64_t v4;
  uint64_t (*v5)(_QWORD);
  uint64_t (*v6)(_QWORD);
  uint64_t *v7;
  uint64_t *v8;
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
  os_log_type_t v22;
  NSObject *v23;
  uint8_t *v24;
  uint64_t v25;
  uint64_t v26;

  OUTLINED_FUNCTION_9_4();
  v3 = v2;
  v25 = v4;
  v6 = v5;
  v8 = v7;
  v9 = v1;
  v11 = v10;
  v12 = sub_23A4D5684();
  OUTLINED_FUNCTION_7_3();
  MEMORY[0x24BDAC7A8](v13);
  OUTLINED_FUNCTION_1();
  v16 = v15 - v14;
  v17 = __swift_instantiateConcreteTypeFromMangledName(v8);
  MEMORY[0x24BDAC7A8](v17);
  OUTLINED_FUNCTION_1();
  v20 = v19 - v18;
  sub_23A4C4E68(v9, v19 - v18, v8);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v21 = v6(0);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v21 - 8) + 32))(v11, v20, v21);
  }
  else
  {
    v22 = sub_23A4D5BC4();
    v23 = sub_23A4D572C();
    if (os_log_type_enabled(v23, v22))
    {
      v24 = (uint8_t *)OUTLINED_FUNCTION_4_5();
      v26 = OUTLINED_FUNCTION_4_5();
      *(_DWORD *)v24 = 136315138;
      sub_23A4BA75C(v25, v3, &v26);
      sub_23A4D5BE8();
      _os_log_impl(&dword_23A4B7000, v23, v22, "Accessing Environment<%s>'s value outside of being installed on a View. This will always read the default value and will not update.", v24, 0xCu);
      swift_arrayDestroy();
      OUTLINED_FUNCTION_1_7();
    }

    sub_23A4D5678();
    swift_getAtKeyPath();
    swift_release();
    (*(void (**)(uint64_t, uint64_t))(v0 + 8))(v16, v12);
  }
  OUTLINED_FUNCTION_1_3();
}

void sub_23A4CEA28()
{
  OUTLINED_FUNCTION_3_5();
  sub_23A4CE83C();
}

uint64_t sub_23A4CEA48(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for ItemListView();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_23A4CEA90(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for ItemListView();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_23A4CEAD4(uint64_t a1, uint64_t a2, uint64_t a3, char a4, uint64_t a5)
{
  return sub_23A4CED88(a1, a2, a3, a4, a5, (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_23A4CCD64);
}

uint64_t sub_23A4CEAE0(uint64_t a1, char a2)
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
  uint64_t v14;
  uint64_t v15;

  v4 = sub_23A4D5684();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if ((a2 & 1) != 0)
    return a1 & 1;
  swift_retain();
  v8 = sub_23A4D5BC4();
  v9 = sub_23A4D572C();
  v10 = v8;
  if (os_log_type_enabled(v9, v8))
  {
    v11 = (uint8_t *)swift_slowAlloc();
    v12 = swift_slowAlloc();
    v15 = v12;
    *(_DWORD *)v11 = 136315138;
    v14 = sub_23A4BA75C(0x6C7974537473694CLL, 0xE900000000000065, &v15);
    sub_23A4D5BE8();
    _os_log_impl(&dword_23A4B7000, v9, v10, "Accessing Environment<%s>'s value outside of being installed on a View. This will always read the default value and will not update.", v11, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x23B84F5D0](v12, -1, -1);
    MEMORY[0x23B84F5D0](v11, -1, -1);
  }

  sub_23A4D5678();
  swift_getAtKeyPath();
  sub_23A4CDF24(a1, 0);
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  return v15;
}

uint64_t objectdestroyTm_2()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v1 = OUTLINED_FUNCTION_11_2();
  v2 = *(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80);
  v3 = (v2 + 16) & ~v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2569887D8);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v4 = sub_23A4D55AC();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v0 + v3, v4);
  }
  else
  {
    swift_release();
  }
  sub_23A4CDF24(*(_QWORD *)(v0 + v3 + *(int *)(v1 + 20)), *(_BYTE *)(v0 + v3 + *(int *)(v1 + 20) + 8));
  swift_release();
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_23A4CED7C(uint64_t a1, uint64_t a2, uint64_t a3, char a4, uint64_t a5)
{
  return sub_23A4CED88(a1, a2, a3, a4, a5, (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_23A4CCC3C);
}

uint64_t sub_23A4CED88(uint64_t a1, uint64_t a2, uint64_t a3, char a4, uint64_t a5, uint64_t (*a6)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))
{
  uint64_t v6;
  uint64_t v11;
  uint64_t v12;

  v11 = a4 & 1;
  v12 = *(unsigned __int8 *)(*(_QWORD *)(OUTLINED_FUNCTION_11_2() - 8) + 80);
  return a6(a1, a2, a3, v11, a5, v6 + ((v12 + 16) & ~v12));
}

void sub_23A4CEE00(_BYTE *a1@<X8>)
{
  *a1 = sub_23A4D55E8() & 1;
  OUTLINED_FUNCTION_3_0();
}

void sub_23A4CEE28()
{
  sub_23A4D55F4();
  OUTLINED_FUNCTION_3_0();
}

unint64_t sub_23A4CEE48()
{
  unint64_t result;
  uint64_t v1;
  unint64_t v2;
  uint64_t v3;
  _QWORD v4[2];

  result = qword_2569894C8;
  if (!qword_2569894C8)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2569894C0);
    v2 = sub_23A4CEECC();
    sub_23A4CBC80(&qword_256989510, &qword_256989518, MEMORY[0x24BDF1028]);
    v4[0] = v2;
    v4[1] = v3;
    result = MEMORY[0x23B84F540](MEMORY[0x24BDED308], v1, v4);
    atomic_store(result, (unint64_t *)&qword_2569894C8);
  }
  return result;
}

unint64_t sub_23A4CEECC()
{
  unint64_t result;
  uint64_t v1;
  unint64_t v2;
  uint64_t v3;
  _QWORD v4[2];

  result = qword_2569894D0;
  if (!qword_2569894D0)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2569894D8);
    v2 = sub_23A4CEF50();
    sub_23A4CBC80(&qword_256989500, &qword_256989508, MEMORY[0x24BDF0710]);
    v4[0] = v2;
    v4[1] = v3;
    result = MEMORY[0x23B84F540](MEMORY[0x24BDED308], v1, v4);
    atomic_store(result, (unint64_t *)&qword_2569894D0);
  }
  return result;
}

unint64_t sub_23A4CEF50()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;

  result = qword_2569894E0;
  if (!qword_2569894E0)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2569894E8);
    v2 = sub_23A4CEFD4((unint64_t *)&qword_2569894F0, &qword_2569894F8, MEMORY[0x24BDF1F80], MEMORY[0x24BDEF3E0]);
    result = MEMORY[0x23B84F540](MEMORY[0x24BDF3F50], v1, &v2);
    atomic_store(result, (unint64_t *)&qword_2569894E0);
  }
  return result;
}

uint64_t sub_23A4CEFD4(unint64_t *a1, uint64_t *a2, uint64_t a3, uint64_t a4)
{
  uint64_t result;
  uint64_t v8;
  _QWORD v9[2];

  result = *a1;
  if (!result)
  {
    v8 = __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    v9[0] = MEMORY[0x24BDF1F80];
    v9[1] = a3;
    result = MEMORY[0x23B84F540](a4, v8, v9);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_23A4CF038(uint64_t a1, uint64_t a2, char a3)
{
  sub_23A4BCD04(a1, a2, a3 & 1);
  return swift_bridgeObjectRelease();
}

unint64_t sub_23A4CF060()
{
  unint64_t result;

  result = qword_256989528;
  if (!qword_256989528)
  {
    result = MEMORY[0x23B84F540](MEMORY[0x24BEE17B0], MEMORY[0x24BEE1768]);
    atomic_store(result, (unint64_t *)&qword_256989528);
  }
  return result;
}

void sub_23A4CF09C()
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
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void (*v21)(char *, uint64_t, uint64_t);
  _QWORD *v22;
  uint64_t v23;
  char *v24;
  uint64_t v25;
  _QWORD *v26;
  char *v27;
  uint64_t v28;
  uint64_t v29;
  unint64_t v30;
  int64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  size_t v35;
  int64_t v36;
  uint64_t v38;
  char *v39;
  unint64_t v40;
  uint64_t v41;
  BOOL v43;
  unint64_t v44;
  unint64_t v45;
  unint64_t v46;
  _QWORD v47[2];
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  void (*v51)(char *, uint64_t, uint64_t);
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  _QWORD *v55;
  char *v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;

  OUTLINED_FUNCTION_9_4();
  v58 = v0;
  v59 = v1;
  v3 = v2;
  v49 = __swift_instantiateConcreteTypeFromMangledName(&qword_256988F88);
  v4 = MEMORY[0x24BDAC7A8](v49);
  v56 = (char *)v47 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = MEMORY[0x24BDAC7A8](v4);
  v55 = (_QWORD *)((char *)v47 - v7);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)v47 - v8;
  v57 = v10;
  v11 = *(unsigned __int8 *)(v10 + 80);
  v12 = *(_QWORD *)(v3 + 16);
  sub_23A4D4FF4();
  v13 = (_QWORD *)MEMORY[0x24BEE4AF8];
  v54 = v12;
  v47[0] = v3;
  if (v12)
  {
    v48 = (v11 + 32) & ~v11;
    v14 = MEMORY[0x24BEE4AF8] + v48;
    v15 = sub_23A4D53CC();
    v16 = 0;
    v17 = 0;
    v18 = *(_QWORD *)(v15 - 8);
    v19 = v3 + ((*(unsigned __int8 *)(v18 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v18 + 80));
    v20 = *(_QWORD *)(v18 + 72);
    v52 = v18;
    v53 = v15;
    v21 = *(void (**)(char *, uint64_t, uint64_t))(v18 + 16);
    v50 = v20;
    v51 = v21;
    v47[1] = v11 | 7;
    v22 = v13;
    v23 = v49;
    while (1)
    {
      v24 = &v56[*(int *)(v23 + 48)];
      v25 = v53;
      v51(v24, v19, v53);
      v26 = v55;
      v27 = (char *)v55 + *(int *)(v23 + 48);
      *v55 = v16;
      (*(void (**)(char *, char *, uint64_t))(v52 + 32))(v27, v24, v25);
      v28 = (uint64_t)v26;
      v29 = (uint64_t)v9;
      sub_23A4C4E94(v28, (uint64_t)v9, &qword_256988F88);
      if (v17)
      {
        v13 = v22;
      }
      else
      {
        v30 = v22[3];
        if ((uint64_t)((v30 >> 1) + 0x4000000000000000) < 0)
          goto LABEL_34;
        v31 = v30 & 0xFFFFFFFFFFFFFFFELL;
        if (v31 <= 1)
          v32 = 1;
        else
          v32 = v31;
        __swift_instantiateConcreteTypeFromMangledName(&qword_256989568);
        v33 = *(_QWORD *)(v57 + 72);
        v34 = v48;
        v13 = (_QWORD *)swift_allocObject();
        v35 = _swift_stdlib_malloc_size(v13);
        if (!v33)
          goto LABEL_35;
        v36 = v35 - v34;
        if (v35 - v34 == 0x8000000000000000 && v33 == -1)
          goto LABEL_36;
        v38 = v36 / v33;
        v13[2] = v32;
        v13[3] = 2 * (v36 / v33);
        v39 = (char *)v13 + v34;
        v40 = v22[3];
        v41 = (v40 >> 1) * v33;
        if (v22[2])
        {
          if (v13 < v22 || v39 >= (char *)v22 + v48 + v41)
          {
            swift_arrayInitWithTakeFrontToBack();
          }
          else if (v13 != v22)
          {
            swift_arrayInitWithTakeBackToFront();
          }
          v22[2] = 0;
        }
        v14 = (uint64_t)&v39[v41];
        v17 = (v38 & 0x7FFFFFFFFFFFFFFFLL) - (v40 >> 1);
        swift_release();
        v23 = v49;
      }
      v43 = __OFSUB__(v17--, 1);
      if (v43)
        break;
      ++v16;
      v9 = (char *)v29;
      sub_23A4C4E94(v29, v14, &qword_256988F88);
      v14 += *(_QWORD *)(v57 + 72);
      v19 += v50;
      v22 = v13;
      if (v54 == v16)
        goto LABEL_29;
    }
    __break(1u);
LABEL_34:
    __break(1u);
LABEL_35:
    __break(1u);
LABEL_36:
    __break(1u);
    goto LABEL_37;
  }
  v17 = 0;
LABEL_29:
  swift_bridgeObjectRelease();
  v44 = v13[3];
  if (v44 >= 2)
  {
    v45 = v44 >> 1;
    v43 = __OFSUB__(v45, v17);
    v46 = v45 - v17;
    if (v43)
    {
LABEL_37:
      __break(1u);
      return;
    }
    v13[2] = v46;
  }
}

uint64_t sub_23A4CF3A4(uint64_t result)
{
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;
  uint64_t v7;
  unint64_t v8;
  int64_t v9;
  uint64_t v10;
  _QWORD *v11;
  uint64_t v12;
  _QWORD *v13;
  uint64_t v14;
  BOOL v16;
  unint64_t v17;
  unint64_t v18;
  uint64_t v19;

  v1 = *(_QWORD *)(result + 16);
  v2 = (_QWORD *)MEMORY[0x24BEE4AF8];
  if (v1)
  {
    v3 = result;
    result = sub_23A4D4FF4();
    v4 = 0;
    v5 = 0;
    v6 = v2 + 4;
    while (1)
    {
      v7 = *(_QWORD *)(v3 + 8 * v5 + 32);
      if (v4)
      {
        result = sub_23A4D4FF4();
      }
      else
      {
        v8 = v2[3];
        if ((uint64_t)((v8 >> 1) + 0x4000000000000000) < 0)
          goto LABEL_28;
        v9 = v8 & 0xFFFFFFFFFFFFFFFELL;
        v10 = v9 <= 1 ? 1 : v9;
        __swift_instantiateConcreteTypeFromMangledName(&qword_256989548);
        v11 = (_QWORD *)swift_allocObject();
        v12 = (uint64_t)(_swift_stdlib_malloc_size(v11) - 32) / 16;
        v11[2] = v10;
        v11[3] = 2 * v12;
        v13 = v11 + 4;
        v14 = v2[3] >> 1;
        v6 = &v11[2 * v14 + 4];
        v4 = (v12 & 0x7FFFFFFFFFFFFFFFLL) - v14;
        if (v2[2])
        {
          if (v11 != v2 || v13 >= &v2[2 * v14 + 4])
            memmove(v13, v2 + 4, 16 * v14);
          sub_23A4D4FF4();
          v2[2] = 0;
        }
        else
        {
          sub_23A4D4FF4();
        }
        result = swift_release();
        v2 = v11;
      }
      v16 = __OFSUB__(v4--, 1);
      if (v16)
        break;
      *v6 = v5;
      v6[1] = v7;
      v6 += 2;
      if (v1 == ++v5)
      {
        result = swift_bridgeObjectRelease();
        goto LABEL_23;
      }
    }
    __break(1u);
LABEL_28:
    __break(1u);
    goto LABEL_29;
  }
  v4 = 0;
LABEL_23:
  v17 = v2[3];
  if (v17 < 2)
    return (uint64_t)v2;
  v18 = v17 >> 1;
  v16 = __OFSUB__(v18, v4);
  v19 = v18 - v4;
  if (!v16)
  {
    v2[2] = v19;
    return (uint64_t)v2;
  }
LABEL_29:
  __break(1u);
  return result;
}

uint64_t sub_23A4CF524(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  return sub_23A4CD048(a1, a2, *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v2 + 16));
}

uint64_t sub_23A4CF52C()
{
  swift_release();
  return swift_deallocObject();
}

void sub_23A4CF550(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v2;

  *a2 = (*(uint64_t (**)(_QWORD, _QWORD))(v2 + 16))(*a1, a1[1]);
  OUTLINED_FUNCTION_3_0();
}

uint64_t sub_23A4CF57C(uint64_t a1, uint64_t a2, char a3)
{
  sub_23A4C42E4(a1, a2, a3 & 1);
  return sub_23A4D4FF4();
}

void sub_23A4CF5A4()
{
  sub_23A4CBC80(&qword_256989570, &qword_256989470, MEMORY[0x24BDF19A8]);
}

void OUTLINED_FUNCTION_1_7()
{
  JUMPOUT(0x23B84F5D0);
}

uint64_t OUTLINED_FUNCTION_4_5()
{
  return swift_slowAlloc();
}

uint64_t OUTLINED_FUNCTION_11_2()
{
  return type metadata accessor for ItemListView();
}

uint64_t sub_23A4CF63C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v4 = *(_QWORD *)(a1 + 16);
  v5 = sub_23A4D509C();
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

uint64_t sub_23A4CF6B4@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t (*v3)(uint64_t);
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _BYTE *v7;
  uint64_t v8;
  _BYTE *v9;
  char v10;
  void (*v11)(_BYTE *, uint64_t);
  uint64_t v12;
  void (*v13)(_BYTE *, _QWORD);
  uint64_t v14;
  uint64_t v15;
  _BYTE v17[32];

  v2 = sub_23A4D4E5C();
  v3 = (uint64_t (*)(uint64_t))MEMORY[0x24BDCC4F0];
  v4 = *(_QWORD *)(v2 - 8);
  v5 = MEMORY[0x24BDAC7A8](v2);
  v7 = &v17[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x24BDAC7A8](v5);
  v9 = &v17[-v8];
  __swift_instantiateConcreteTypeFromMangledName(&qword_256989590);
  sub_23A4CFF60();
  sub_23A4D5B7C();
  sub_23A4D5B94();
  sub_23A4C5878(&qword_2569895B8, v3, MEMORY[0x24BDCC508]);
  v10 = sub_23A4D5B04();
  v11 = *(void (**)(_BYTE *, uint64_t))(v4 + 8);
  v11(v7, v2);
  if ((v10 & 1) != 0)
  {
    v12 = 1;
  }
  else
  {
    v13 = (void (*)(_BYTE *, _QWORD))sub_23A4D5BA0();
    sub_23A4CFFA4(v14, a1);
    v13(v17, 0);
    v12 = 0;
  }
  v11(v9, v2);
  v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569895A0);
  return __swift_storeEnumTagSinglePayload(a1, v12, 1, v15);
}

uint64_t sub_23A4CF844()
{
  uint64_t v0;
  uint64_t *v1;
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
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  uint64_t *v37;
  uint64_t v38;
  char *v39;
  uint64_t v40;
  void (*v41)(char *, uint64_t *, uint64_t);
  char *v42;
  uint64_t v43;
  char *v44;
  char *v45;
  uint64_t v46;
  uint64_t *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t KeyPath;

  __swift_instantiateConcreteTypeFromMangledName(&qword_256989578);
  OUTLINED_FUNCTION_4_2();
  MEMORY[0x24BDAC7A8](v0);
  OUTLINED_FUNCTION_11_0();
  v47 = v1;
  v46 = sub_23A4D5A20();
  v43 = *(_QWORD *)(v46 - 8);
  v2 = MEMORY[0x24BDAC7A8](v46);
  v45 = (char *)&v43 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v2);
  v44 = (char *)&v43 - v4;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256989580);
  OUTLINED_FUNCTION_4_2();
  MEMORY[0x24BDAC7A8](v5);
  OUTLINED_FUNCTION_11_0();
  v52 = v6;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256989588);
  OUTLINED_FUNCTION_4_2();
  MEMORY[0x24BDAC7A8](v7);
  OUTLINED_FUNCTION_11_0();
  v51 = v8;
  v9 = sub_23A4D5174();
  v49 = *(_QWORD *)(v9 - 8);
  v50 = v9;
  MEMORY[0x24BDAC7A8](v9);
  OUTLINED_FUNCTION_11_0();
  v48 = v10;
  v11 = sub_23A4D4E38();
  v12 = *(_QWORD *)(v11 - 8);
  MEMORY[0x24BDAC7A8](v11);
  OUTLINED_FUNCTION_1();
  v15 = v14 - v13;
  v16 = sub_23A4D4E68();
  v17 = *(_QWORD *)(v16 - 8);
  MEMORY[0x24BDAC7A8](v16);
  OUTLINED_FUNCTION_1();
  v20 = v19 - v18;
  v21 = __swift_instantiateConcreteTypeFromMangledName(&qword_256989590);
  v22 = *(_QWORD *)(v21 - 8);
  MEMORY[0x24BDAC7A8](v21);
  OUTLINED_FUNCTION_1();
  v25 = v24 - v23;
  sub_23A4D518C();
  sub_23A4D4E50();
  (*(void (**)(uint64_t, uint64_t))(v17 + 8))(v20, v16);
  KeyPath = swift_getKeyPath();
  swift_getKeyPath();
  sub_23A4C5878(&qword_256989598, (uint64_t (*)(uint64_t))MEMORY[0x24BE2BF80], MEMORY[0x24BE2BF78]);
  sub_23A4D4E44();
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v12 + 8))(v15, v11);
  if (sub_23A4CFE20() != 1)
  {
    (*(void (**)(uint64_t, uint64_t))(v22 + 8))(v25, v21);
    return 0;
  }
  v26 = v48;
  v27 = v49;
  v28 = v50;
  v29 = v51;
  v30 = v52;
  sub_23A4CF6B4(v52);
  v31 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569895A0);
  if (__swift_getEnumTagSinglePayload(v30, 1, v31) == 1)
  {
    sub_23A4B956C(v52, &qword_256989580);
    v32 = v29;
    __swift_storeEnumTagSinglePayload(v29, 1, 1, v28);
LABEL_6:
    OUTLINED_FUNCTION_3_6();
    v34 = &qword_256989588;
    v35 = v32;
LABEL_7:
    sub_23A4B956C(v35, v34);
    return 0;
  }
  v33 = v52 + *(int *)(v31 + 48);
  v32 = v29;
  sub_23A4CFF18(v52, v29);
  sub_23A4B956C(v33, &qword_2569895A8);
  if (__swift_getEnumTagSinglePayload(v29, 1, v28) == 1)
    goto LABEL_6;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v27 + 32))(v26, v29, v28);
  v37 = v47;
  sub_23A4B8B70(v47);
  (*(void (**)(uint64_t, uint64_t))(v27 + 8))(v26, v28);
  OUTLINED_FUNCTION_3_6();
  v38 = v46;
  if (__swift_getEnumTagSinglePayload((uint64_t)v37, 1, v46) == 1)
  {
    v34 = &qword_256989578;
    v35 = (uint64_t)v37;
    goto LABEL_7;
  }
  v40 = v43;
  v39 = v44;
  v41 = *(void (**)(char *, uint64_t *, uint64_t))(v43 + 32);
  v41(v44, v37, v38);
  v42 = v45;
  v41(v45, (uint64_t *)v39, v38);
  if ((*(unsigned int (**)(char *, uint64_t))(v40 + 88))(v42, v38) != *MEMORY[0x24BEAD9F8])
  {
    (*(void (**)(char *, uint64_t))(v40 + 8))(v42, v38);
    return 0;
  }
  (*(void (**)(char *, uint64_t))(v40 + 96))(v42, v38);
  return *(_QWORD *)v42;
}

uint64_t sub_23A4CFC7C()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_2569895C0);
  return sub_23A4D5B04() & 1;
}

uint64_t sub_23A4CFCD4()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_2569895C0);
  return sub_23A4D5AF8();
}

void sub_23A4CFD18()
{
  uint64_t v0;
  uint64_t (*v1)(uint64_t);

  sub_23A4D4E2C();
  OUTLINED_FUNCTION_4_2();
  MEMORY[0x24BDAC7A8](v0);
  OUTLINED_FUNCTION_1();
  sub_23A4C5878(&qword_256989598, v1, MEMORY[0x24BE2BF78]);
  sub_23A4D4EA4();
  __break(1u);
}

void sub_23A4CFD80()
{
  uint64_t v0;

  sub_23A4D4E2C();
  OUTLINED_FUNCTION_4_2();
  MEMORY[0x24BDAC7A8](v0);
  OUTLINED_FUNCTION_11_0();
  sub_23A4D4E20();
  __break(1u);
}

uint64_t sub_23A4CFDBC()
{
  return sub_23A4C5878(&qword_256989598, (uint64_t (*)(uint64_t))MEMORY[0x24BE2BF80], MEMORY[0x24BE2BF78]);
}

uint64_t sub_23A4CFDEC()
{
  return 8;
}

uint64_t sub_23A4CFDF8()
{
  return swift_release();
}

uint64_t sub_23A4CFE00(_QWORD *a1, _QWORD *a2)
{
  *a2 = *a1;
  return swift_retain();
}

_QWORD *sub_23A4CFE14(_QWORD *result, _QWORD *a2)
{
  *a2 = *result;
  return result;
}

uint64_t sub_23A4CFE20()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  void (*v8)(char *, uint64_t);
  uint64_t v10;

  v0 = sub_23A4D4E5C();
  v1 = *(_QWORD *)(v0 - 8);
  v2 = MEMORY[0x24BDAC7A8](v0);
  v4 = (char *)&v10 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v2);
  v6 = (char *)&v10 - v5;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256989590);
  sub_23A4CFF60();
  sub_23A4D5B7C();
  sub_23A4D5B94();
  v7 = sub_23A4D5B88();
  v8 = *(void (**)(char *, uint64_t))(v1 + 8);
  v8(v4, v0);
  v8(v6, v0);
  return v7;
}

uint64_t sub_23A4CFF18(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_256989588);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

unint64_t sub_23A4CFF60()
{
  unint64_t result;
  uint64_t v1;

  result = qword_2569895B0;
  if (!qword_2569895B0)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256989590);
    result = MEMORY[0x23B84F540](MEMORY[0x24BDCC438], v1);
    atomic_store(result, (unint64_t *)&qword_2569895B0);
  }
  return result;
}

uint64_t sub_23A4CFFA4(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569895A0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t OUTLINED_FUNCTION_3_6()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 8))(v0, v1);
}

uint64_t sub_23A4CFFFC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;

  v0 = sub_23A4D4EF8();
  v1 = *(_QWORD *)(v0 - 8);
  MEMORY[0x24BDAC7A8](v0);
  OUTLINED_FUNCTION_1();
  v4 = v3 - v2;
  v5 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BE81860]), sel_init);
  sub_23A4D4EEC();
  v6 = sub_23A4D4EE0();
  v8 = v7;
  (*(void (**)(uint64_t, uint64_t))(v1 + 8))(v4, v0);
  sub_23A4D18AC(v6, v8, v5);
  v9 = (void *)sub_23A4D4EB0();
  objc_msgSend(v5, sel_setPunchOutUri_, v9);

  v10 = v5;
  sub_23A4D5AD4();

  OUTLINED_FUNCTION_11_3();
  OUTLINED_FUNCTION_10_2();
  sub_23A4C5994(v10);

  return swift_release();
}

void sub_23A4D0128(void *a1)
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
  id v11;
  void *v12;
  NSObject *v13;
  os_log_type_t v14;

  v2 = sub_23A4D4ED4();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  OUTLINED_FUNCTION_1();
  v6 = v5 - v4;
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569885E8);
  MEMORY[0x24BDAC7A8](v7);
  OUTLINED_FUNCTION_1();
  v10 = v9 - v8;
  v11 = objc_msgSend(a1, sel_punchOutUri);
  if (v11)
  {
    v12 = v11;
    sub_23A4D4EBC();

    (*(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 32))(v10, v6, v2);
    OUTLINED_FUNCTION_12_1(v10, 0);
    if (__swift_getEnumTagSinglePayload(v10, 1, v2) != 1)
    {
      sub_23A4D1880(v10, &qword_2569885E8);
      sub_23A4D5AD4();
      OUTLINED_FUNCTION_11_3();
      OUTLINED_FUNCTION_10_2();
      sub_23A4C5994(a1);
      swift_release();
      return;
    }
  }
  else
  {
    OUTLINED_FUNCTION_12_1(v10, 1);
  }
  sub_23A4D1880(v10, &qword_2569885E8);
  v13 = sub_23A4D545C();
  v14 = sub_23A4D5BAC();
  if (os_log_type_enabled(v13, v14))
  {
    *(_WORD *)OUTLINED_FUNCTION_4_5() = 0;
    OUTLINED_FUNCTION_14_0(&dword_23A4B7000, v13, v14, "Invalid or no punch out uri available");
    OUTLINED_FUNCTION_1_7();
  }

}

uint64_t sub_23A4D02F0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;

  v0 = MEMORY[0x23B84E940]();
  v2 = v1;
  v3 = MEMORY[0x23B84E934]();
  v5 = v4;
  v6 = (_QWORD *)MEMORY[0x23B84E928]();
  sub_23A4D03A8(v0, v2, v3, v5, v6);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_11_3();
  OUTLINED_FUNCTION_10_2();
  sub_23A4C5C4C();
  return swift_release();
}

uint64_t sub_23A4D03A8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, _QWORD *a5)
{
  uint64_t v5;
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
  char *v22;
  uint64_t v23;
  char *v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  unint64_t v29;
  uint64_t v30;
  char *v31;
  uint64_t v32;
  unint64_t v33;
  unint64_t v34;
  uint64_t v35;
  uint64_t v36;
  void (*v37)(char *, char *, uint64_t);
  uint64_t v38;
  char *v39;
  uint64_t v40;
  uint64_t v41;
  char *v42;
  unint64_t v43;
  unint64_t v44;
  unint64_t v45;
  char *v46;
  uint64_t v47;
  char *v48;
  char *v49;
  uint64_t v50;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  char *v55;
  uint64_t v56;
  char *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  char *v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  char *v67;
  uint64_t v68;
  uint64_t v69;
  _QWORD v70[6];

  v60 = a4;
  v68 = a3;
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569896E0);
  MEMORY[0x24BDAC7A8](v9);
  v69 = (uint64_t)&v52 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = sub_23A4D4FAC();
  v64 = *(_QWORD *)(v11 - 8);
  v12 = *(_QWORD *)(v64 + 64);
  v13 = MEMORY[0x24BDAC7A8](v11);
  v61 = (char *)&v52 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v13);
  v67 = (char *)&v52 - v14;
  v54 = sub_23A4D4FE8();
  v53 = *(_QWORD *)(v54 - 8);
  MEMORY[0x24BDAC7A8](v54);
  v55 = (char *)&v52 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569896E8);
  MEMORY[0x24BDAC7A8](v16);
  v18 = (char *)&v52 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v19 = sub_23A4D4F7C();
  v65 = *(_QWORD *)(v19 - 8);
  v66 = v19;
  v20 = MEMORY[0x24BDAC7A8](v19);
  v22 = (char *)&v52 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v20);
  v24 = (char *)&v52 - v23;
  v25 = objc_msgSend((id)objc_opt_self(), sel_defaultEnvironment);
  v70[3] = sub_23A4D14DC();
  v70[4] = MEMORY[0x24BE04080];
  v70[0] = v25;
  v26 = sub_23A4D4FD0();
  v58 = v27;
  v59 = v26;
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v70);
  v28 = sub_23A4D4F88();
  __swift_storeEnumTagSinglePayload((uint64_t)v18, 1, 1, v28);
  sub_23A4D4FF4();
  v62 = a1;
  sub_23A4D4F70();
  v63 = a2;
  v56 = v5;
  if (a5 && a5[2])
  {
    v29 = a5[5];
    v30 = HIBYTE(v29) & 0xF;
    if ((v29 & 0x2000000000000000) == 0)
      v30 = a5[4] & 0xFFFFFFFFFFFFLL;
    if (v30)
    {
      v70[0] = a5[4];
      v70[1] = v29;
      sub_23A4D4FF4();
      v31 = v55;
      sub_23A4D4FDC();
      v32 = sub_23A4B95A8(0, 1, 1, MEMORY[0x24BEE4AF8]);
      v34 = *(_QWORD *)(v32 + 16);
      v33 = *(_QWORD *)(v32 + 24);
      if (v34 >= v33 >> 1)
        v32 = sub_23A4B95A8(v33 > 1, v34 + 1, 1, v32);
      v35 = v54;
      v36 = v53;
      *(_QWORD *)(v32 + 16) = v34 + 1;
      (*(void (**)(unint64_t, char *, uint64_t))(v36 + 32))(v32+ ((*(unsigned __int8 *)(v36 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v36 + 80))+ *(_QWORD *)(v36 + 72) * v34, v31, v35);
    }
  }
  v37 = *(void (**)(char *, char *, uint64_t))(v65 + 16);
  v57 = v24;
  v37(v22, v24, v66);
  v38 = v60;
  sub_23A4D4FF4();
  v39 = v67;
  sub_23A4D4FA0();
  v40 = sub_23A4D5B70();
  __swift_storeEnumTagSinglePayload(v69, 1, 1, v40);
  v41 = v64;
  v42 = v61;
  (*(void (**)(char *, char *, uint64_t))(v64 + 16))(v61, v39, v11);
  v43 = (*(unsigned __int8 *)(v41 + 80) + 48) & ~(unint64_t)*(unsigned __int8 *)(v41 + 80);
  v44 = (v12 + v43 + 7) & 0xFFFFFFFFFFFFFFF8;
  v45 = (v44 + 15) & 0xFFFFFFFFFFFFFFF8;
  v46 = (char *)swift_allocObject();
  *((_QWORD *)v46 + 2) = 0;
  *((_QWORD *)v46 + 3) = 0;
  v47 = v58;
  *((_QWORD *)v46 + 4) = v59;
  *((_QWORD *)v46 + 5) = v47;
  (*(void (**)(char *, char *, uint64_t))(v41 + 32))(&v46[v43], v42, v11);
  *(_QWORD *)&v46[v44] = v56;
  v48 = &v46[v45];
  *(_QWORD *)v48 = v68;
  *((_QWORD *)v48 + 1) = v38;
  v49 = &v46[(v45 + 23) & 0xFFFFFFFFFFFFFFF8];
  v50 = v63;
  *(_QWORD *)v49 = v62;
  *((_QWORD *)v49 + 1) = v50;
  sub_23A4D4FF4();
  sub_23A4D4FF4();
  swift_unknownObjectRetain();
  swift_retain();
  sub_23A4D1178(v69, (uint64_t)&unk_256989700, (uint64_t)v46);
  swift_release();
  swift_unknownObjectRelease();
  (*(void (**)(char *, uint64_t))(v41 + 8))(v67, v11);
  return (*(uint64_t (**)(char *, uint64_t))(v65 + 8))(v57, v66);
}

uint64_t sub_23A4D0858()
{
  uint64_t v0;
  uint64_t v1;

  v0 = sub_23A4D5468();
  OUTLINED_FUNCTION_0_0(v0);
  v1 = sub_23A4D5018();
  OUTLINED_FUNCTION_0_0(v1);
  return swift_deallocClassInstance();
}

uint64_t sub_23A4D08B0()
{
  return type metadata accessor for ActionHandler();
}

uint64_t type metadata accessor for ActionHandler()
{
  uint64_t result;

  result = qword_256989600;
  if (!qword_256989600)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_23A4D08F0()
{
  uint64_t result;
  unint64_t v1;
  unint64_t v2;

  result = sub_23A4D5468();
  if (v1 <= 0x3F)
  {
    result = sub_23A4D5018();
    if (v2 <= 0x3F)
    {
      result = swift_updateClassMetadata2();
      if (!result)
        return 0;
    }
  }
  return result;
}

uint64_t sub_23A4D0978()
{
  return sub_23A4D5CCC();
}

uint64_t sub_23A4D099C()
{
  sub_23A4D5CC0();
  sub_23A4D5CCC();
  return sub_23A4D5CD8();
}

uint64_t sub_23A4D09DC()
{
  return 1;
}

uint64_t sub_23A4D09EC()
{
  sub_23A4D5CC0();
  sub_23A4D5CCC();
  return sub_23A4D5CD8();
}

uint64_t sub_23A4D0A38()
{
  return OUTLINED_FUNCTION_4_6();
}

uint64_t sub_23A4D0A44()
{
  uint64_t v0;

  sub_23A4D14A0();
  swift_allocError();
  swift_willThrow();
  return (*(uint64_t (**)(_QWORD))(v0 + 8))(0);
}

uint64_t sub_23A4D0AA0()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(v1 + 16) = v0;
  return OUTLINED_FUNCTION_4_6();
}

uint64_t sub_23A4D0AB0()
{
  uint64_t v0;
  NSObject *v1;
  os_log_type_t v2;

  v1 = sub_23A4D545C();
  v2 = sub_23A4D5BB8();
  if (os_log_type_enabled(v1, v2))
  {
    *(_WORD *)OUTLINED_FUNCTION_4_5() = 0;
    OUTLINED_FUNCTION_14_0(&dword_23A4B7000, v1, v2, "Unexpected disambiguation encountered due to missing target parameter. Executing the root deep link.");
    OUTLINED_FUNCTION_1_7();
  }

  return (*(uint64_t (**)(_QWORD))(v0 + 8))(0);
}

uint64_t sub_23A4D0B50()
{
  return sub_23A4D4FF4();
}

uint64_t sub_23A4D0B5C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v12;
  uint64_t v13;

  *(_QWORD *)(v8 + 144) = v13;
  *(_OWORD *)(v8 + 128) = v12;
  *(_QWORD *)(v8 + 112) = a7;
  *(_QWORD *)(v8 + 120) = a8;
  *(_QWORD *)(v8 + 96) = a5;
  *(_QWORD *)(v8 + 104) = a6;
  *(_QWORD *)(v8 + 88) = a4;
  v9 = sub_23A4D4FC4();
  *(_QWORD *)(v8 + 152) = v9;
  *(_QWORD *)(v8 + 160) = *(_QWORD *)(v9 - 8);
  *(_QWORD *)(v8 + 168) = swift_task_alloc();
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_256989718);
  *(_QWORD *)(v8 + 176) = v10;
  *(_QWORD *)(v8 + 184) = *(_QWORD *)(v10 - 8);
  *(_QWORD *)(v8 + 192) = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_23A4D0C00()
{
  uint64_t v0;
  _QWORD *v1;

  swift_getObjectType();
  sub_23A4D4FB8();
  sub_23A4D1840();
  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 200) = v1;
  *v1 = v0;
  v1[1] = sub_23A4D0CB4;
  return sub_23A4D4F94();
}

uint64_t sub_23A4D0CB4()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v2 = *(_QWORD **)v1;
  v4 = *(_QWORD *)(*(_QWORD *)v1 + 160);
  v3 = *(_QWORD *)(*(_QWORD *)v1 + 168);
  v5 = *(_QWORD *)(*(_QWORD *)v1 + 152);
  *(_QWORD *)(*(_QWORD *)v1 + 208) = v0;
  swift_task_dealloc();
  (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v3, v5);
  if (!v0)
    (*(void (**)(_QWORD, _QWORD))(v2[23] + 8))(v2[24], v2[22]);
  return swift_task_switch();
}

uint64_t sub_23A4D0D50()
{
  uint64_t v0;
  NSObject *v1;
  os_log_type_t v2;
  unint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v9;

  swift_bridgeObjectRetain_n();
  swift_bridgeObjectRetain_n();
  v1 = sub_23A4D545C();
  v2 = sub_23A4D5BAC();
  if (os_log_type_enabled(v1, v2))
  {
    v4 = *(_QWORD *)(v0 + 136);
    v3 = *(_QWORD *)(v0 + 144);
    v6 = *(_QWORD *)(v0 + 120);
    v5 = *(_QWORD *)(v0 + 128);
    v7 = OUTLINED_FUNCTION_4_5();
    v9 = OUTLINED_FUNCTION_4_5();
    *(_DWORD *)v7 = 136315394;
    sub_23A4D4FF4();
    *(_QWORD *)(v0 + 72) = sub_23A4BA75C(v6, v5, &v9);
    sub_23A4D5BE8();
    OUTLINED_FUNCTION_7_4();
    *(_WORD *)(v7 + 12) = 2080;
    sub_23A4D4FF4();
    *(_QWORD *)(v0 + 80) = sub_23A4BA75C(v4, v3, &v9);
    sub_23A4D5BE8();
    OUTLINED_FUNCTION_7_4();
    _os_log_impl(&dword_23A4B7000, v1, v2, "Executed app intent named %s in bundleID: %s.", (uint8_t *)v7, 0x16u);
    swift_arrayDestroy();
    OUTLINED_FUNCTION_1_7();
  }

  OUTLINED_FUNCTION_6_3();
  OUTLINED_FUNCTION_6_3();
  OUTLINED_FUNCTION_9_5();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_23A4D0F14()
{
  uint64_t v0;
  void *v1;
  id v2;
  id v3;
  NSObject *v4;
  os_log_type_t v5;
  unint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v13;
  uint64_t v14;

  v1 = *(void **)(v0 + 208);
  sub_23A4D4FF4();
  sub_23A4D4FF4();
  v2 = v1;
  sub_23A4D4FF4();
  sub_23A4D4FF4();
  v3 = v1;
  v4 = sub_23A4D545C();
  v5 = sub_23A4D5BB8();
  if (os_log_type_enabled(v4, v5))
  {
    v6 = *(_QWORD *)(v0 + 144);
    v13 = *(_QWORD *)(v0 + 136);
    v7 = *(_QWORD *)(v0 + 120);
    v8 = *(_QWORD *)(v0 + 128);
    v9 = OUTLINED_FUNCTION_4_5();
    v14 = OUTLINED_FUNCTION_4_5();
    *(_DWORD *)v9 = 136315650;
    sub_23A4D4FF4();
    *(_QWORD *)(v0 + 56) = sub_23A4BA75C(v7, v8, &v14);
    sub_23A4D5BE8();
    OUTLINED_FUNCTION_7_4();
    *(_WORD *)(v9 + 12) = 2080;
    sub_23A4D4FF4();
    *(_QWORD *)(v0 + 40) = sub_23A4BA75C(v13, v6, &v14);
    sub_23A4D5BE8();
    OUTLINED_FUNCTION_7_4();
    *(_WORD *)(v9 + 22) = 2080;
    swift_getErrorValue();
    v10 = sub_23A4D5C84();
    *(_QWORD *)(v0 + 64) = sub_23A4BA75C(v10, v11, &v14);
    sub_23A4D5BE8();
    swift_bridgeObjectRelease();
    OUTLINED_FUNCTION_15_0();
    OUTLINED_FUNCTION_15_0();
    _os_log_impl(&dword_23A4B7000, v4, v5, "Unable to execute app intent named: %s in bundleID: %s. Error: %s", (uint8_t *)v9, 0x20u);
    swift_arrayDestroy();
    OUTLINED_FUNCTION_1_7();
  }
  OUTLINED_FUNCTION_13_0();

  OUTLINED_FUNCTION_6_3();
  OUTLINED_FUNCTION_6_3();
  OUTLINED_FUNCTION_13_0();
  OUTLINED_FUNCTION_13_0();
  OUTLINED_FUNCTION_9_5();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_23A4D1178(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;

  v6 = sub_23A4D5B70();
  if (__swift_getEnumTagSinglePayload(a1, 1, v6) == 1)
  {
    sub_23A4D1880(a1, &qword_2569896E0);
  }
  else
  {
    sub_23A4D5B64();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 8))(a1, v6);
  }
  if (*(_QWORD *)(a3 + 16))
  {
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_23A4D5B58();
    swift_unknownObjectRelease();
  }
  v7 = swift_allocObject();
  *(_QWORD *)(v7 + 16) = a2;
  *(_QWORD *)(v7 + 24) = a3;
  return swift_task_create();
}

uint64_t sub_23A4D12BC()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 16) = v1;
  *v1 = v0;
  v1[1] = sub_23A4D1A34;
  return sub_23A4D0A38();
}

uint64_t sub_23A4D1300()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 16) = v1;
  *v1 = v0;
  v1[1] = sub_23A4D1344;
  return sub_23A4D0AA0();
}

uint64_t sub_23A4D1344(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;

  v4 = OUTLINED_FUNCTION_0_7();
  if (!v1)
    v4 = a1;
  return (*(uint64_t (**)(uint64_t))(v2 + 8))(v4);
}

uint64_t sub_23A4D137C()
{
  return sub_23A4D0B50();
}

uint64_t sub_23A4D1390()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 16) = v1;
  *v1 = v0;
  v1[1] = sub_23A4D1A34;
  return sub_23A4D4F58();
}

uint64_t sub_23A4D13F8()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 16) = v1;
  *v1 = v0;
  v1[1] = sub_23A4D1460;
  return sub_23A4D4F58();
}

uint64_t sub_23A4D1460(char a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;

  OUTLINED_FUNCTION_0_7();
  if (v1)
    v4 = 0;
  else
    v4 = a1 & 1;
  return (*(uint64_t (**)(uint64_t))(v2 + 8))(v4);
}

unint64_t sub_23A4D14A0()
{
  unint64_t result;

  result = qword_2569896D8;
  if (!qword_2569896D8)
  {
    result = MEMORY[0x23B84F540](&unk_23A4D6F5C, &type metadata for ActionHandler.Errors);
    atomic_store(result, (unint64_t *)&qword_2569896D8);
  }
  return result;
}

unint64_t sub_23A4D14DC()
{
  unint64_t result;

  result = qword_2569896F0;
  if (!qword_2569896F0)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, &qword_2569896F0);
  }
  return result;
}

uint64_t sub_23A4D1518()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;

  v1 = sub_23A4D4FAC();
  v2 = *(_QWORD *)(v1 - 8);
  v3 = (*(unsigned __int8 *)(v2 + 80) + 48) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  (*(void (**)(unint64_t, uint64_t))(v2 + 8))(v0 + v3, v1);
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_23A4D15E0(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  uint64_t v14;

  v3 = *(_QWORD *)(sub_23A4D4FAC() - 8);
  v4 = (*(unsigned __int8 *)(v3 + 80) + 48) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  v5 = (*(_QWORD *)(v3 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8;
  v6 = v1[3];
  v14 = v1[2];
  v7 = v1[4];
  v8 = v1[5];
  v9 = (uint64_t)v1 + v4;
  v10 = *(_QWORD *)((char *)v1 + v5);
  v11 = *(_QWORD *)((char *)v1 + ((v5 + 15) & 0xFFFFFFFFFFFFFFF8));
  v12 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v12;
  *v12 = v2;
  v12[1] = sub_23A4D16D0;
  return sub_23A4D0B5C(a1, v14, v6, v7, v8, v9, v10, v11);
}

uint64_t sub_23A4D16D0()
{
  uint64_t v0;

  OUTLINED_FUNCTION_0_7();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_23A4D16FC(uint64_t a1, int *a2)
{
  uint64_t v2;
  _QWORD *v4;
  uint64_t (*v6)(uint64_t);

  v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v4;
  *v4 = v2;
  v4[1] = sub_23A4D1760;
  return v6(a1);
}

uint64_t sub_23A4D1760()
{
  uint64_t v0;

  OUTLINED_FUNCTION_0_7();
  return OUTLINED_FUNCTION_3_7(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_23A4D1788()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_23A4D17AC(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  int *v4;
  _QWORD *v5;

  v4 = *(int **)(v1 + 16);
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_23A4D181C;
  return ((uint64_t (*)(uint64_t, int *))((char *)&dword_256989708 + dword_256989708))(a1, v4);
}

uint64_t sub_23A4D181C()
{
  uint64_t v0;

  OUTLINED_FUNCTION_0_7();
  return OUTLINED_FUNCTION_3_7(*(uint64_t (**)(void))(v0 + 8));
}

unint64_t sub_23A4D1840()
{
  unint64_t result;
  uint64_t v1;

  result = qword_256989720;
  if (!qword_256989720)
  {
    v1 = type metadata accessor for ActionHandler();
    result = MEMORY[0x23B84F540](&unk_23A4D6EA4, v1);
    atomic_store(result, (unint64_t *)&qword_256989720);
  }
  return result;
}

uint64_t sub_23A4D1880(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  OUTLINED_FUNCTION_0_0(v3);
  return a1;
}

void sub_23A4D18AC(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;

  v4 = (id)sub_23A4D5B10();
  swift_bridgeObjectRelease();
  objc_msgSend(a3, sel_setAceId_, v4);

}

uint64_t getEnumTagSinglePayload for ActionHandler.Errors(unsigned int *a1, int a2)
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

uint64_t storeEnumTagSinglePayload for ActionHandler.Errors(uint64_t a1, int a2, int a3)
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
    return ((uint64_t (*)(void))((char *)sub_23A4D1990 + 4 * byte_23A4D6E88[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_23A4D19B0 + 4 * byte_23A4D6E8D[v4]))();
}

_BYTE *sub_23A4D1990(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_23A4D19B0(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_23A4D19B8(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_23A4D19C0(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_23A4D19C8(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_23A4D19D0(_DWORD *result)
{
  *result = 0;
  return result;
}

uint64_t sub_23A4D19DC()
{
  return 0;
}

ValueMetadata *type metadata accessor for ActionHandler.Errors()
{
  return &type metadata for ActionHandler.Errors;
}

unint64_t sub_23A4D19F8()
{
  unint64_t result;

  result = qword_256989728;
  if (!qword_256989728)
  {
    result = MEMORY[0x23B84F540](&unk_23A4D6F34, &type metadata for ActionHandler.Errors);
    atomic_store(result, (unint64_t *)&qword_256989728);
  }
  return result;
}

uint64_t OUTLINED_FUNCTION_0_7()
{
  _QWORD *v0;
  uint64_t v1;

  *(_QWORD *)(v1 - 8) = *v0;
  *(_QWORD *)(v1 - 8) = *v0;
  return swift_task_dealloc();
}

uint64_t OUTLINED_FUNCTION_3_7(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t OUTLINED_FUNCTION_4_6()
{
  return swift_task_switch();
}

uint64_t OUTLINED_FUNCTION_6_3()
{
  return swift_bridgeObjectRelease_n();
}

uint64_t OUTLINED_FUNCTION_7_4()
{
  return swift_bridgeObjectRelease_n();
}

uint64_t OUTLINED_FUNCTION_9_5()
{
  return swift_task_dealloc();
}

uint64_t OUTLINED_FUNCTION_10_2()
{
  return sub_23A4D5144();
}

uint64_t OUTLINED_FUNCTION_11_3()
{
  return sub_23A4D5150();
}

uint64_t OUTLINED_FUNCTION_12_1(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  return __swift_storeEnumTagSinglePayload(a1, a2, 1, v2);
}

void OUTLINED_FUNCTION_13_0()
{
  void *v0;

}

void OUTLINED_FUNCTION_14_0(void *a1, NSObject *a2, os_log_type_t a3, const char *a4)
{
  uint8_t *v4;

  _os_log_impl(a1, a2, a3, a4, v4, 2u);
}

void OUTLINED_FUNCTION_15_0()
{
  void *v0;

}

uint64_t *sub_23A4D1AC4(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  char v13;
  uint64_t v14;
  __int128 v15;
  uint64_t v16;
  char *v17;
  char *v18;
  uint64_t v19;

  v5 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v14 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v14 + ((v5 + 16) & ~(unint64_t)v5));
  }
  else
  {
    v7 = sub_23A4D4E68();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a1, a2, v7);
    v8 = *(int *)(a3 + 20);
    v9 = (char *)a1 + v8;
    v10 = (char *)a2 + v8;
    if (*(uint64_t *)((char *)a2 + v8 + 24))
    {
      v11 = *(_QWORD *)v10;
      v12 = *((_QWORD *)v10 + 1);
      v13 = v10[16];
      sub_23A4C42E4(*(_QWORD *)v10, v12, v13);
      *(_QWORD *)v9 = v11;
      *((_QWORD *)v9 + 1) = v12;
      v9[16] = v13;
      *((_QWORD *)v9 + 3) = *((_QWORD *)v10 + 3);
      sub_23A4D4FF4();
    }
    else
    {
      v15 = *((_OWORD *)v10 + 1);
      *(_OWORD *)v9 = *(_OWORD *)v10;
      *((_OWORD *)v9 + 1) = v15;
    }
    v16 = *(int *)(a3 + 24);
    v17 = (char *)a1 + v16;
    v18 = (char *)a2 + v16;
    if (!*(_QWORD *)v18)
    {
      *(_OWORD *)v17 = *(_OWORD *)v18;
      return a1;
    }
    v19 = *((_QWORD *)v18 + 1);
    *(_QWORD *)v17 = *(_QWORD *)v18;
    *((_QWORD *)v17 + 1) = v19;
  }
  swift_retain();
  return a1;
}

uint64_t sub_23A4D1BC4(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t result;
  uint64_t v6;

  v4 = sub_23A4D4E68();
  result = (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(a1, v4);
  v6 = a1 + *(int *)(a2 + 20);
  if (*(_QWORD *)(v6 + 24))
  {
    sub_23A4BCD04(*(_QWORD *)v6, *(_QWORD *)(v6 + 8), *(_BYTE *)(v6 + 16));
    result = swift_bridgeObjectRelease();
  }
  if (*(_QWORD *)(a1 + *(int *)(a2 + 24)))
    return swift_release();
  return result;
}

uint64_t sub_23A4D1C50(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char v12;
  __int128 v13;
  uint64_t v14;
  _QWORD *v15;
  _QWORD *v16;
  uint64_t v17;

  v6 = sub_23A4D4E68();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(a1, a2, v6);
  v7 = *(int *)(a3 + 20);
  v8 = a1 + v7;
  v9 = a2 + v7;
  if (*(_QWORD *)(a2 + v7 + 24))
  {
    v10 = *(_QWORD *)v9;
    v11 = *(_QWORD *)(v9 + 8);
    v12 = *(_BYTE *)(v9 + 16);
    sub_23A4C42E4(*(_QWORD *)v9, v11, v12);
    *(_QWORD *)v8 = v10;
    *(_QWORD *)(v8 + 8) = v11;
    *(_BYTE *)(v8 + 16) = v12;
    *(_QWORD *)(v8 + 24) = *(_QWORD *)(v9 + 24);
    sub_23A4D4FF4();
  }
  else
  {
    v13 = *(_OWORD *)(v9 + 16);
    *(_OWORD *)v8 = *(_OWORD *)v9;
    *(_OWORD *)(v8 + 16) = v13;
  }
  v14 = *(int *)(a3 + 24);
  v15 = (_QWORD *)(a1 + v14);
  v16 = (_QWORD *)(a2 + v14);
  if (*v16)
  {
    v17 = v16[1];
    *v15 = *v16;
    v15[1] = v17;
    swift_retain();
  }
  else
  {
    *(_OWORD *)v15 = *(_OWORD *)v16;
  }
  return a1;
}

uint64_t sub_23A4D1D28(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char v14;
  uint64_t v15;
  uint64_t v16;
  char v17;
  uint64_t v18;
  uint64_t v19;
  char v20;
  __int128 v21;
  __int128 v22;
  uint64_t v23;
  _QWORD *v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;

  v6 = sub_23A4D4E68();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 24))(a1, a2, v6);
  v7 = *(int *)(a3 + 20);
  v8 = a1 + v7;
  v9 = a2 + v7;
  v10 = *(_QWORD *)(a1 + v7 + 24);
  v11 = *(_QWORD *)(a2 + v7 + 24);
  if (v10)
  {
    if (v11)
    {
      v12 = *(_QWORD *)v9;
      v13 = *(_QWORD *)(v9 + 8);
      v14 = *(_BYTE *)(v9 + 16);
      sub_23A4C42E4(*(_QWORD *)v9, v13, v14);
      v15 = *(_QWORD *)v8;
      v16 = *(_QWORD *)(v8 + 8);
      v17 = *(_BYTE *)(v8 + 16);
      *(_QWORD *)v8 = v12;
      *(_QWORD *)(v8 + 8) = v13;
      *(_BYTE *)(v8 + 16) = v14;
      sub_23A4BCD04(v15, v16, v17);
      *(_QWORD *)(v8 + 24) = *(_QWORD *)(v9 + 24);
      sub_23A4D4FF4();
      swift_bridgeObjectRelease();
    }
    else
    {
      sub_23A4D1E98(v8);
      v21 = *(_OWORD *)(v9 + 16);
      *(_OWORD *)v8 = *(_OWORD *)v9;
      *(_OWORD *)(v8 + 16) = v21;
    }
  }
  else if (v11)
  {
    v18 = *(_QWORD *)v9;
    v19 = *(_QWORD *)(v9 + 8);
    v20 = *(_BYTE *)(v9 + 16);
    sub_23A4C42E4(*(_QWORD *)v9, v19, v20);
    *(_QWORD *)v8 = v18;
    *(_QWORD *)(v8 + 8) = v19;
    *(_BYTE *)(v8 + 16) = v20;
    *(_QWORD *)(v8 + 24) = *(_QWORD *)(v9 + 24);
    sub_23A4D4FF4();
  }
  else
  {
    v22 = *(_OWORD *)(v9 + 16);
    *(_OWORD *)v8 = *(_OWORD *)v9;
    *(_OWORD *)(v8 + 16) = v22;
  }
  v23 = *(int *)(a3 + 24);
  v24 = (_QWORD *)(a1 + v23);
  v25 = (uint64_t *)(a2 + v23);
  v26 = *(_QWORD *)(a1 + v23);
  v27 = *v25;
  if (!v26)
  {
    if (v27)
    {
      v29 = v25[1];
      *v24 = v27;
      v24[1] = v29;
      swift_retain();
      return a1;
    }
LABEL_14:
    *(_OWORD *)v24 = *(_OWORD *)v25;
    return a1;
  }
  if (!v27)
  {
    swift_release();
    goto LABEL_14;
  }
  v28 = v25[1];
  *v24 = v27;
  v24[1] = v28;
  swift_retain();
  swift_release();
  return a1;
}

uint64_t sub_23A4D1E98(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(MEMORY[0x24BDF1FA8] - 8) + 8))();
  return a1;
}

uint64_t sub_23A4D1ECC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _OWORD *v9;
  _OWORD *v10;
  __int128 v11;
  _QWORD *v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;

  v6 = sub_23A4D4E68();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 32))(a1, a2, v6);
  v7 = *(int *)(a3 + 20);
  v8 = *(int *)(a3 + 24);
  v9 = (_OWORD *)(a1 + v7);
  v10 = (_OWORD *)(a2 + v7);
  v11 = v10[1];
  *v9 = *v10;
  v9[1] = v11;
  v12 = (_QWORD *)(a1 + v8);
  v13 = (uint64_t *)(a2 + v8);
  v14 = *v13;
  if (*v13)
  {
    v15 = v13[1];
    *v12 = v14;
    v12[1] = v15;
  }
  else
  {
    *(_OWORD *)v12 = *(_OWORD *)v13;
  }
  return a1;
}

uint64_t sub_23A4D1F54(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char v10;
  uint64_t v11;
  uint64_t v12;
  char v13;
  __int128 v14;
  uint64_t v15;
  _QWORD *v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;

  v6 = sub_23A4D4E68();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 40))(a1, a2, v6);
  v7 = *(int *)(a3 + 20);
  v8 = a1 + v7;
  v9 = a2 + v7;
  if (*(_QWORD *)(a1 + v7 + 24))
  {
    if (*(_QWORD *)(v9 + 24))
    {
      v10 = *(_BYTE *)(v9 + 16);
      v11 = *(_QWORD *)v8;
      v12 = *(_QWORD *)(v8 + 8);
      v13 = *(_BYTE *)(v8 + 16);
      *(_OWORD *)v8 = *(_OWORD *)v9;
      *(_BYTE *)(v8 + 16) = v10;
      sub_23A4BCD04(v11, v12, v13);
      *(_QWORD *)(v8 + 24) = *(_QWORD *)(v9 + 24);
      swift_bridgeObjectRelease();
      goto LABEL_6;
    }
    sub_23A4D1E98(v8);
  }
  v14 = *(_OWORD *)(v9 + 16);
  *(_OWORD *)v8 = *(_OWORD *)v9;
  *(_OWORD *)(v8 + 16) = v14;
LABEL_6:
  v15 = *(int *)(a3 + 24);
  v16 = (_QWORD *)(a1 + v15);
  v17 = (uint64_t *)(a2 + v15);
  v18 = *(_QWORD *)(a1 + v15);
  v19 = *v17;
  if (!v18)
  {
    if (v19)
    {
      v21 = v17[1];
      *v16 = v19;
      v16[1] = v21;
      return a1;
    }
LABEL_12:
    *(_OWORD *)v16 = *(_OWORD *)v17;
    return a1;
  }
  if (!v19)
  {
    swift_release();
    goto LABEL_12;
  }
  v20 = v17[1];
  *v16 = v19;
  v16[1] = v20;
  swift_release();
  return a1;
}

uint64_t sub_23A4D2058()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_23A4D2064(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  unint64_t v8;
  int v9;

  v6 = OUTLINED_FUNCTION_3_8();
  if (*(_DWORD *)(*(_QWORD *)(v6 - 8) + 84) == (_DWORD)a2)
    return __swift_getEnumTagSinglePayload(a1, a2, v6);
  v8 = *(_QWORD *)(a1 + *(int *)(a3 + 20) + 24);
  if (v8 >= 0xFFFFFFFF)
    LODWORD(v8) = -1;
  v9 = v8 - 1;
  if (v9 < 0)
    v9 = -1;
  return (v9 + 1);
}

uint64_t sub_23A4D20E8()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_23A4D20F4(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result;

  result = OUTLINED_FUNCTION_3_8();
  if (*(_DWORD *)(*(_QWORD *)(result - 8) + 84) == a3)
    return __swift_storeEnumTagSinglePayload(a1, a2, a2, result);
  *(_QWORD *)(a1 + *(int *)(a4 + 20) + 24) = a2;
  return result;
}

uint64_t type metadata accessor for AttributionView()
{
  uint64_t result;

  result = qword_256989798;
  if (!qword_256989798)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_23A4D21A0()
{
  uint64_t result;
  unint64_t v1;

  result = sub_23A4D4E68();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t sub_23A4D221C()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_23A4D222C(uint64_t a1, uint64_t a2, int a3, uint64_t a4, void (*a5)(uint64_t *, char *), uint64_t a6)
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
  char *v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  _QWORD v22[2];
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void (*v27)(uint64_t *, char *);
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  char v31;
  uint64_t v32;
  int v33;

  v27 = a5;
  v28 = a6;
  v24 = a4;
  v25 = a2;
  v33 = a3;
  v26 = a1;
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569895A0);
  MEMORY[0x24BDAC7A8](v7);
  v9 = (char *)v22 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_256989580);
  MEMORY[0x24BDAC7A8](v10);
  v12 = (char *)v22 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_256989590);
  v14 = *(_QWORD *)(v13 - 8);
  MEMORY[0x24BDAC7A8](v13);
  v16 = (char *)v22 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569897E0);
  v23 = *(_QWORD *)(v17 - 8);
  MEMORY[0x24BDAC7A8](v17);
  v19 = (char *)v22 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  v29 = v26;
  v30 = v25;
  v31 = v33 & 1;
  v32 = v24;
  (*(void (**)(char *, _QWORD, uint64_t))(v14 + 16))(v16, v22[1], v13);
  sub_23A4BCDDC(&qword_2569897E8, &qword_256989590);
  sub_23A4D5B4C();
  sub_23A4BCDDC(&qword_2569897F0, &qword_2569897E0);
  sub_23A4D5BDC();
  if (__swift_getEnumTagSinglePayload((uint64_t)v12, 1, v7) == 1)
  {
    v20 = v26;
LABEL_6:
    (*(void (**)(char *, uint64_t))(v23 + 8))(v19, v17);
  }
  else
  {
    while (1)
    {
      sub_23A4C4E94((uint64_t)v12, (uint64_t)v9, &qword_2569895A0);
      v20 = v28;
      v27(&v29, v9);
      if (v6)
        break;
      sub_23A4C94EC((uint64_t)v9, &qword_2569895A0);
      sub_23A4D5BDC();
      if (__swift_getEnumTagSinglePayload((uint64_t)v12, 1, v7) == 1)
      {
        v20 = v29;
        goto LABEL_6;
      }
    }
    sub_23A4BCD04(v29, v30, v31);
    swift_bridgeObjectRelease();
    sub_23A4C94EC((uint64_t)v9, &qword_2569895A0);
    (*(void (**)(char *, uint64_t))(v23 + 8))(v19, v17);
  }
  return v20;
}

uint64_t sub_23A4D250C()
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
  uint64_t v10;
  char v11;
  uint64_t v12;
  uint64_t v14;
  uint64_t v15;
  _BYTE v16[16];
  uint64_t v17;
  uint64_t KeyPath;

  v1 = sub_23A4D4E38();
  v2 = *(_QWORD *)(v1 - 8);
  MEMORY[0x24BDAC7A8](v1);
  v4 = (char *)&v14 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_256989590);
  v5 = *(_QWORD *)(v15 - 8);
  MEMORY[0x24BDAC7A8](v15);
  v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23A4D4E50();
  KeyPath = swift_getKeyPath();
  swift_getKeyPath();
  sub_23A4BCE10(&qword_256989598, (void (*)(uint64_t))MEMORY[0x24BE2BF80]);
  sub_23A4D4E44();
  swift_release();
  (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
  v17 = v0;
  v8 = sub_23A4D222C(0, 0xE000000000000000, 0, MEMORY[0x24BEE4AF8], (void (*)(uint64_t *, char *))sub_23A4D3478, (uint64_t)v16);
  v10 = v9;
  LOBYTE(v4) = v11 & 1;
  sub_23A4D5798();
  v12 = sub_23A4D57EC();
  sub_23A4BCD04(v8, v10, (char)v4);
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v15);
  return v12;
}

void sub_23A4D26E0(uint64_t a1, uint64_t a2, uint64_t a3)
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
  char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  uint64_t v22;
  char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  int EnumTagSinglePayload;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  char v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  char v36;
  char v37;
  uint64_t v38;
  uint64_t v39;
  int v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  char v48;
  char v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t *v52;
  uint64_t v53;
  uint64_t v54;
  char v55;
  uint64_t v56;
  char *v57;
  int v58;
  uint64_t v59;
  char *v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  char v65;
  char v66;
  char v67;
  uint64_t v68;
  char *v69;
  int v70;
  uint64_t *v71;
  uint64_t v72;
  char *v73;
  _QWORD v74[2];
  uint64_t v75;
  char *v76;
  char *v77;
  uint64_t v78;
  uint64_t *v79;
  char *v80;
  uint64_t v81;
  char *v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  char *v86;
  char *v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  int v91;

  v88 = a1;
  v78 = a3;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_256989578);
  MEMORY[0x24BDAC7A8](v4);
  v79 = (_QWORD *)((char *)v74 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0));
  v83 = sub_23A4D5A20();
  v81 = *(_QWORD *)(v83 - 8);
  MEMORY[0x24BDAC7A8](v83);
  v80 = (char *)v74 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_23A4D4E98();
  MEMORY[0x24BDAC7A8](v7);
  v77 = (char *)v74 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = sub_23A4D4E68();
  MEMORY[0x24BDAC7A8](v9);
  v76 = (char *)v74 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = sub_23A4D5174();
  v84 = *(_QWORD *)(v11 - 8);
  MEMORY[0x24BDAC7A8](v11);
  v82 = (char *)v74 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569895A0);
  MEMORY[0x24BDAC7A8](v13);
  v15 = (char *)v74 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v75 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569895A8);
  MEMORY[0x24BDAC7A8](v75);
  v17 = (char *)v74 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_256989588);
  v19 = MEMORY[0x24BDAC7A8](v18);
  v21 = (char *)v74 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v19);
  v23 = (char *)v74 - v22;
  v24 = *(int *)(v13 + 48);
  v25 = (uint64_t)&v15[v24];
  v26 = a2;
  v27 = a2 + v24;
  sub_23A4C4E68(v26, (uint64_t)v15, &qword_256989588);
  sub_23A4C4E68(v27, v25, &qword_2569895A8);
  sub_23A4C4E94((uint64_t)v15, (uint64_t)v23, &qword_256989588);
  sub_23A4C4E94(v25, (uint64_t)v17, &qword_2569895A8);
  sub_23A4C4E68((uint64_t)v23, (uint64_t)v21, &qword_256989588);
  v85 = v11;
  EnumTagSinglePayload = __swift_getEnumTagSinglePayload((uint64_t)v21, 1, v11);
  v86 = v23;
  v87 = v17;
  if (EnumTagSinglePayload == 1)
  {
    sub_23A4C94EC((uint64_t)v21, &qword_256989588);
    v29 = v88;
    v31 = *(_QWORD *)v88;
    v30 = *(_QWORD *)(v88 + 8);
    v32 = *(_BYTE *)(v88 + 16);
    sub_23A4BCDDC(&qword_2569897F8, &qword_2569895A8);
    sub_23A4D4E74();
    sub_23A4D4E80();
    v33 = sub_23A4D5840();
    v35 = v34;
    v37 = v36 & 1;
    v38 = sub_23A4D5828();
    v83 = v39;
    v84 = v38;
    LODWORD(v82) = v40;
    v85 = v41;
    sub_23A4BCD04(v33, v35, v37);
    swift_bridgeObjectRelease();
    sub_23A4BCD04(v31, v30, v32);
    swift_bridgeObjectRelease();
    sub_23A4C94EC((uint64_t)v87, &qword_2569895A8);
    sub_23A4C94EC((uint64_t)v86, &qword_256989588);
    v42 = v83;
    *(_QWORD *)v29 = v84;
    *(_QWORD *)(v29 + 8) = v42;
    *(_BYTE *)(v29 + 16) = v82 & 1;
    v43 = v85;
LABEL_5:
    *(_QWORD *)(v29 + 24) = v43;
    return;
  }
  (*(void (**)(char *, char *, uint64_t))(v84 + 32))(v82, v21, v85);
  v89 = sub_23A4D5168();
  v90 = v44;
  sub_23A4C4600();
  v45 = sub_23A4D584C();
  v47 = v46;
  v49 = v48;
  v51 = v50;
  v52 = v79;
  sub_23A4B8B70(v79);
  if (__swift_getEnumTagSinglePayload((uint64_t)v52, 1, v83) == 1)
  {
    sub_23A4C94EC((uint64_t)v52, &qword_256989578);
    v29 = v88;
    v53 = *(_QWORD *)v88;
    v54 = *(_QWORD *)(v88 + 8);
    v55 = *(_BYTE *)(v88 + 16);
    v56 = sub_23A4D5828();
    v80 = v57;
    v81 = v56;
    LODWORD(v79) = v58;
    v83 = v59;
    sub_23A4BCD04(v53, v54, v55);
    swift_bridgeObjectRelease();
    sub_23A4BCD04(v45, v47, v49 & 1);
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v84 + 8))(v82, v85);
    sub_23A4C94EC((uint64_t)v87, &qword_2569895A8);
    sub_23A4C94EC((uint64_t)v86, &qword_256989588);
    v60 = v80;
    *(_QWORD *)v29 = v81;
    *(_QWORD *)(v29 + 8) = v60;
    *(_BYTE *)(v29 + 16) = v79 & 1;
    v43 = v83;
    goto LABEL_5;
  }
  (*(void (**)(char *, uint64_t *, uint64_t))(v81 + 32))(v80, v52, v83);
  v61 = *(_QWORD *)(v88 + 8);
  v75 = *(_QWORD *)v88;
  v91 = *(unsigned __int8 *)(v88 + 16);
  v74[0] = v51;
  v74[1] = *(_QWORD *)(v88 + 24);
  v62 = sub_23A4D57E0();
  v64 = v63;
  v66 = v65 & 1;
  v67 = v91;
  v68 = sub_23A4D5828();
  v77 = v69;
  v78 = v68;
  LODWORD(v76) = v70;
  v79 = v71;
  sub_23A4BCD04(v45, v47, v49 & 1);
  swift_bridgeObjectRelease();
  sub_23A4BCD04(v62, v64, v66);
  swift_bridgeObjectRelease();
  sub_23A4BCD04(v75, v61, v67);
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v81 + 8))(v80, v83);
  (*(void (**)(char *, uint64_t))(v84 + 8))(v82, v85);
  sub_23A4C94EC((uint64_t)v87, &qword_2569895A8);
  sub_23A4C94EC((uint64_t)v86, &qword_256989588);
  v72 = v88;
  v73 = v77;
  *(_QWORD *)v88 = v78;
  *(_QWORD *)(v72 + 8) = v73;
  *(_BYTE *)(v72 + 16) = v76 & 1;
  *(_QWORD *)(v72 + 24) = v79;
}

uint64_t sub_23A4D2D84@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char v7;
  char v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char v12;
  char v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char v17;
  uint64_t v18;
  char v19;
  uint64_t result;
  __int128 v21;
  __int128 v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  char v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  char v30;

  v3 = v1 + *(int *)(type metadata accessor for AttributionView() + 20);
  if (*(_QWORD *)(v3 + 24))
  {
    v23 = *(_QWORD *)(v3 + 8);
    v25 = *(_QWORD *)v3;
    v26 = *(_DWORD *)(v3 + 16) & 1;
    sub_23A4C42E4(*(_QWORD *)v3, v23, v26);
    sub_23A4D4FF4();
    v4 = sub_23A4D250C();
    v6 = v5;
    v8 = v7 & 1;
    *(_QWORD *)&v28 = 32;
    *((_QWORD *)&v28 + 1) = 0xE100000000000000;
    v24 = a1;
    sub_23A4D4FF4();
    sub_23A4D5B34();
    swift_bridgeObjectRelease();
    sub_23A4D5B34();
    v9 = sub_23A4D5828();
    v11 = v10;
    v13 = v12;
    swift_bridgeObjectRelease();
    sub_23A4BCD04(v4, v6, v8);
    swift_bridgeObjectRelease();
    LOBYTE(v28) = v26;
    v14 = sub_23A4D5828();
    v16 = v15;
    LOBYTE(v6) = v17 & 1;
    v18 = v9;
    a1 = v24;
    sub_23A4BCD04(v18, v11, v13 & 1);
    swift_bridgeObjectRelease();
    sub_23A4C42E4(v14, v16, v6);
    sub_23A4D4FF4();
    sub_23A4C42E4(v14, v16, v6);
    sub_23A4D4FF4();
    sub_23A4D56FC();
    v19 = v30;
    sub_23A4BCD04(v25, v23, v26);
    swift_bridgeObjectRelease();
    sub_23A4BCD04(v14, v16, v6);
    swift_bridgeObjectRelease();
    sub_23A4BCD04(v14, v16, v6);
    result = swift_bridgeObjectRelease();
    v22 = v29;
    v21 = v28;
  }
  else
  {
    sub_23A4D250C();
    result = sub_23A4D56FC();
    v21 = v27;
    v22 = v29;
    v19 = v30;
  }
  *(_OWORD *)a1 = v21;
  *(_OWORD *)(a1 + 16) = v22;
  *(_BYTE *)(a1 + 32) = v19;
  return result;
}

uint64_t sub_23A4D301C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  _OWORD v14[2];
  uint64_t v15;
  __int128 v16;
  __int128 v17;
  uint64_t v18;
  __int128 v19;
  __int128 v20;
  uint64_t v21;
  __int128 v22;
  __int128 v23;
  uint64_t v24;

  v1 = OUTLINED_FUNCTION_2_7();
  v2 = *(_QWORD *)(v1 - 8);
  v3 = *(_QWORD *)(v2 + 64);
  MEMORY[0x24BDAC7A8](v1);
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569897D8);
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23A4D2D84((uint64_t)&v22);
  v19 = v22;
  v20 = v23;
  LOBYTE(v21) = v24;
  sub_23A4D3260(v0, (uint64_t)v14 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0));
  v8 = (*(unsigned __int8 *)(v2 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  v9 = swift_allocObject();
  sub_23A4D3354((uint64_t)v14 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0), v9 + v8);
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569894F8);
  v11 = sub_23A4D33E0();
  sub_23A4D587C();
  swift_release();
  sub_23A4CF038(v19, *((uint64_t *)&v19 + 1), v20);
  *(_QWORD *)&v22 = v10;
  *((_QWORD *)&v22 + 1) = v11;
  swift_getOpaqueTypeConformance2();
  v12 = sub_23A4D5864();
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  v24 = MEMORY[0x24BEAD938];
  *((_QWORD *)&v23 + 1) = MEMORY[0x24BDF4780];
  *(_QWORD *)&v22 = v12;
  v21 = 0;
  v19 = 0u;
  v20 = 0u;
  v18 = 0;
  v16 = 0u;
  v17 = 0u;
  v15 = 0;
  memset(v14, 0, sizeof(v14));
  return sub_23A4D5A98();
}

uint64_t sub_23A4D3208(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result;
  uint64_t (**v7)(uint64_t, uint64_t);

  result = type metadata accessor for AttributionView();
  v7 = (uint64_t (**)(uint64_t, uint64_t))(a3 + *(int *)(result + 24));
  if (*v7)
    return (*v7)(a1, a2);
  return result;
}

uint64_t sub_23A4D3260(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for AttributionView();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_23A4D32A4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v1 = OUTLINED_FUNCTION_2_7();
  v2 = *(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80);
  v3 = v0 + ((v2 + 16) & ~v2);
  v4 = OUTLINED_FUNCTION_3_8();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  v5 = v3 + *(int *)(v1 + 20);
  if (*(_QWORD *)(v5 + 24))
  {
    sub_23A4BCD04(*(_QWORD *)v5, *(_QWORD *)(v5 + 8), *(_BYTE *)(v5 + 16));
    swift_bridgeObjectRelease();
  }
  if (*(_QWORD *)(v3 + *(int *)(v1 + 24)))
    swift_release();
  return swift_deallocObject();
}

uint64_t sub_23A4D3354(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for AttributionView();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_23A4D3398(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v5;

  v5 = *(unsigned __int8 *)(*(_QWORD *)(OUTLINED_FUNCTION_2_7() - 8) + 80);
  return sub_23A4D3208(a1, a2, v2 + ((v5 + 16) & ~v5));
}

unint64_t sub_23A4D33E0()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_2569894F0;
  if (!qword_2569894F0)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2569894F8);
    v2[0] = MEMORY[0x24BDF1F80];
    v2[1] = MEMORY[0x24BDF1F80];
    result = MEMORY[0x23B84F540](MEMORY[0x24BDEF3E0], v1, v2);
    atomic_store(result, (unint64_t *)&qword_2569894F0);
  }
  return result;
}

uint64_t sub_23A4D3444()
{
  return 8;
}

uint64_t sub_23A4D3450()
{
  return swift_release();
}

uint64_t sub_23A4D3458(_QWORD *a1, _QWORD *a2)
{
  *a2 = *a1;
  return swift_retain();
}

_QWORD *sub_23A4D346C(_QWORD *result, _QWORD *a2)
{
  *a2 = *result;
  return result;
}

void sub_23A4D3478(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  sub_23A4D26E0(a1, a2, *(_QWORD *)(v2 + 16));
}

void sub_23A4D3490()
{
  sub_23A4BCE10(qword_256989800, MEMORY[0x24BEAE078]);
}

uint64_t OUTLINED_FUNCTION_2_7()
{
  return type metadata accessor for AttributionView();
}

uint64_t OUTLINED_FUNCTION_3_8()
{
  return sub_23A4D4E68();
}

uint64_t sub_23A4D34CC(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_23A4D51E0();
  return (**(uint64_t (***)(uint64_t, uint64_t, uint64_t))(v4 - 8))(a1, a2, v4);
}

uint64_t sub_23A4D3508(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_23A4D51E0();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
}

uint64_t sub_23A4D353C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_23A4D51E0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a1, a2, v4);
  return a1;
}

uint64_t sub_23A4D3580(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_23A4D51E0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 24))(a1, a2, v4);
  return a1;
}

uint64_t sub_23A4D35C4(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_23A4D51E0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a1, a2, v4);
  return a1;
}

uint64_t sub_23A4D3608(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_23A4D51E0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 40))(a1, a2, v4);
  return a1;
}

uint64_t sub_23A4D364C()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_23A4D3658()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v2 = OUTLINED_FUNCTION_2_8();
  return __swift_getEnumTagSinglePayload(v1, v0, v2);
}

uint64_t sub_23A4D3680()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_23A4D368C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v2 = OUTLINED_FUNCTION_2_8();
  return __swift_storeEnumTagSinglePayload(v1, v0, v0, v2);
}

uint64_t type metadata accessor for TipCollectionBannerView()
{
  uint64_t result;

  result = qword_256989860;
  if (!qword_256989860)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_23A4D36F0()
{
  uint64_t result;
  unint64_t v1;

  result = sub_23A4D51E0();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t sub_23A4D3758()
{
  return swift_getOpaqueTypeConformance2();
}

void sub_23A4D3768(uint64_t a1@<X8>)
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
  _OWORD *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  char v24;
  char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v33;
  uint64_t v34;
  uint64_t KeyPath;
  uint64_t *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t *v40;
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
  _QWORD *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  _QWORD *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  void *v62;
  uint64_t v63;
  _QWORD v65[46];
  char v66;
  _BYTE v67[183];
  __int128 v68;
  __int128 v69;
  char v70;
  uint64_t v71[21];
  _BYTE v72[192];
  _BYTE v73[360];

  v2 = v1;
  v60 = __swift_instantiateConcreteTypeFromMangledName(&qword_256989898);
  OUTLINED_FUNCTION_4_2();
  MEMORY[0x24BDAC7A8](v3);
  OUTLINED_FUNCTION_1();
  v6 = v5 - v4;
  v7 = sub_23A4D5438();
  v59 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7);
  OUTLINED_FUNCTION_1();
  v10 = v9 - v8;
  v56 = sub_23A4D55B8();
  OUTLINED_FUNCTION_4_2();
  MEMORY[0x24BDAC7A8](v11);
  OUTLINED_FUNCTION_1();
  v14 = (_OWORD *)(v13 - v12);
  v57 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569898A0);
  OUTLINED_FUNCTION_4_2();
  MEMORY[0x24BDAC7A8](v15);
  OUTLINED_FUNCTION_1();
  v18 = v17 - v16;
  v58 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569898A8);
  OUTLINED_FUNCTION_4_2();
  MEMORY[0x24BDAC7A8](v19);
  OUTLINED_FUNCTION_11_0();
  v62 = v20;
  v61 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569898B0);
  OUTLINED_FUNCTION_4_2();
  MEMORY[0x24BDAC7A8](v21);
  OUTLINED_FUNCTION_11_0();
  v63 = v22;
  v23 = sub_23A4D56CC();
  sub_23A4D3C30(v2, v71);
  v72[176] = 0;
  memcpy(&v72[7], v71, 0xA8uLL);
  v24 = sub_23A4D5738();
  v72[184] = 1;
  v65[44] = v23;
  v65[45] = 0x4024000000000000;
  v66 = 0;
  memcpy(v67, v72, 0xAFuLL);
  v67[175] = v24;
  v68 = 0u;
  v69 = 0u;
  v70 = 1;
  sub_23A4D5A08();
  sub_23A4D4074(0.0, 1, 0.0, 1, INFINITY, 0, 0.0, 1, (uint64_t)v65, 0.0, 1, 0.0, 1);
  sub_23A4D4210((uint64_t)v71);
  memcpy(v73, v65, 0x160uLL);
  v25 = (char *)v14 + *(int *)(v56 + 20);
  v26 = *MEMORY[0x24BDEEB68];
  v27 = sub_23A4D56D8();
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v27 - 8) + 104))(v25, v26, v27);
  __asm { FMOV            V0.2D, #16.0 }
  *v14 = _Q0;
  if (qword_2569885E0 != -1)
    swift_once();
  v33 = __swift_project_value_buffer(v7, (uint64_t)qword_25698A920);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v59 + 16))(v10, v33, v7);
  v34 = sub_23A4D5984();
  KeyPath = swift_getKeyPath();
  sub_23A4D4504((uint64_t)v14, v18);
  v36 = (uint64_t *)(v18 + *(int *)(v57 + 36));
  *v36 = KeyPath;
  v36[1] = v34;
  sub_23A4D4548((uint64_t)v14);
  v37 = sub_23A4D5A08();
  v39 = v38;
  sub_23A4C93C4(v18, v6, &qword_2569898A0);
  v40 = (uint64_t *)(v6 + *(int *)(v60 + 36));
  *v40 = v37;
  v40[1] = v39;
  sub_23A4C93C4(v6, (uint64_t)v62 + *(int *)(v58 + 36), &qword_256989898);
  memcpy(v62, v73, 0x160uLL);
  sub_23A4D463C((uint64_t)v73);
  sub_23A4C94EC(v6, &qword_256989898);
  sub_23A4C94EC(v18, &qword_2569898A0);
  sub_23A4D4584((uint64_t)v73);
  type metadata accessor for CGSize();
  sub_23A4D59C0();
  v41 = v65[0];
  v42 = v65[1];
  v43 = v65[2];
  v44 = sub_23A4D5960();
  v45 = swift_getKeyPath();
  v46 = sub_23A4D57BC();
  v47 = swift_getKeyPath();
  v48 = sub_23A4D59FC();
  v50 = v49;
  sub_23A4C93C4((uint64_t)v62, v63, &qword_2569898A8);
  v51 = (_QWORD *)(v63 + *(int *)(v61 + 36));
  *v51 = v41;
  v51[1] = v42;
  v51[2] = v43;
  v51[3] = 0x6C69662E73706974;
  v51[4] = 0xE90000000000006CLL;
  v51[5] = v45;
  v51[6] = v44;
  v51[7] = v47;
  v51[8] = v46;
  v51[9] = v48;
  v51[10] = v50;
  sub_23A4C94EC((uint64_t)v62, &qword_2569898A8);
  sub_23A4D59C0();
  v52 = v65[0];
  v53 = v65[1];
  v54 = v65[2];
  sub_23A4C93C4(v63, a1, &qword_2569898B0);
  v55 = (_QWORD *)(a1 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2569898B8) + 36));
  *v55 = v52;
  v55[1] = v53;
  v55[2] = v54;
  sub_23A4C94EC(v63, &qword_2569898B0);
}

uint64_t sub_23A4D3C30@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char v12;
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
  uint64_t KeyPath;
  char v25;
  uint64_t v27;
  uint64_t v28;
  _QWORD __src[19];
  uint64_t v30;
  uint64_t v31;
  char v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  char v39;
  uint64_t v40;
  char v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  char v46;
  uint64_t v47;
  uint64_t v48;

  v3 = sub_23A4D51B0();
  v27 = v4;
  v28 = v3;
  v5 = sub_23A4D56F0();
  sub_23A4D3DEC(a1, (uint64_t)&v30);
  v7 = v30;
  v6 = v31;
  v8 = v32;
  v9 = v33;
  v10 = v34;
  v11 = v35;
  v12 = v36;
  v13 = v37;
  v25 = sub_23A4D5750();
  sub_23A4D54C8();
  v15 = v14;
  v17 = v16;
  v19 = v18;
  v21 = v20;
  v22 = sub_23A4D5960();
  KeyPath = swift_getKeyPath();
  __src[0] = v5;
  __src[1] = 0;
  LOBYTE(__src[2]) = 1;
  __src[3] = v7;
  __src[4] = v6;
  LOBYTE(__src[5]) = v8;
  __src[6] = v9;
  __src[7] = v10;
  __src[8] = v11;
  LOBYTE(__src[9]) = v12;
  __src[10] = v13;
  LOBYTE(__src[11]) = v25;
  __src[12] = v15;
  __src[13] = v17;
  __src[14] = v19;
  __src[15] = v21;
  LOBYTE(__src[16]) = 0;
  __src[17] = KeyPath;
  __src[18] = v22;
  memcpy(a2 + 2, __src, 0x98uLL);
  *a2 = v28;
  a2[1] = v27;
  v30 = v5;
  v31 = 0;
  v32 = 1;
  v33 = v7;
  v34 = v6;
  LOBYTE(v35) = v8;
  v36 = v9;
  v37 = v10;
  v38 = v11;
  v39 = v12;
  v40 = v13;
  v41 = v25;
  v42 = v15;
  v43 = v17;
  v44 = v19;
  v45 = v21;
  v46 = 0;
  v47 = KeyPath;
  v48 = v22;
  sub_23A4D4FF4();
  sub_23A4D46EC((uint64_t)__src);
  sub_23A4D4778((uint64_t)&v30);
  return swift_bridgeObjectRelease();
}

uint64_t sub_23A4D3DEC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char v14;
  char v15;
  uint64_t v16;
  uint64_t v17;
  char v18;
  char v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  uint64_t v23;
  unint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  char v28;
  char v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  char v33;
  char v34;
  uint64_t v35;
  uint64_t v36;
  char v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  unint64_t v46;
  uint64_t v47;
  uint64_t v48;
  unint64_t v49;

  v47 = a1;
  v3 = sub_23A4D57C8();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v6 = (char *)&v42 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_23A4D51C8();
  if (v8)
    v9 = v7;
  else
    v9 = 0;
  v10 = 0xE000000000000000;
  if (v8)
    v10 = v8;
  v48 = v9;
  v49 = v10;
  v46 = sub_23A4C4600();
  v11 = sub_23A4D584C();
  v13 = v12;
  v15 = v14 & 1;
  sub_23A4D5768();
  (*(void (**)(char *, _QWORD, uint64_t))(v4 + 104))(v6, *MEMORY[0x24BDF17C8], v3);
  sub_23A4D57D4();
  swift_release();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  sub_23A4D5774();
  swift_release();
  v16 = sub_23A4D5834();
  v43 = v17;
  v44 = v16;
  v19 = v18;
  v45 = v20;
  swift_release();
  HIDWORD(v42) = v19 & 1;
  sub_23A4BCD04(v11, v13, v15);
  swift_bridgeObjectRelease();
  v21 = sub_23A4D51D4();
  if (v22)
    v23 = v21;
  else
    v23 = 0;
  v24 = 0xE000000000000000;
  if (v22)
    v24 = v22;
  v48 = v23;
  v49 = v24;
  v25 = sub_23A4D584C();
  v27 = v26;
  v29 = v28 & 1;
  sub_23A4D575C();
  v30 = sub_23A4D5834();
  v32 = v31;
  v34 = v33;
  v36 = v35;
  swift_release();
  v34 &= 1u;
  sub_23A4BCD04(v25, v27, v29);
  swift_bridgeObjectRelease();
  v37 = BYTE4(v42);
  LOBYTE(v48) = BYTE4(v42);
  v39 = v43;
  v38 = v44;
  *(_QWORD *)a2 = v44;
  *(_QWORD *)(a2 + 8) = v39;
  *(_BYTE *)(a2 + 16) = v37;
  *(_QWORD *)(a2 + 24) = v45;
  *(_QWORD *)(a2 + 32) = v30;
  *(_QWORD *)(a2 + 40) = v32;
  *(_BYTE *)(a2 + 48) = v34;
  *(_QWORD *)(a2 + 56) = v36;
  v40 = v38;
  sub_23A4C42E4(v38, v39, v37);
  sub_23A4D4FF4();
  sub_23A4C42E4(v30, v32, v34);
  sub_23A4D4FF4();
  sub_23A4BCD04(v30, v32, v34);
  swift_bridgeObjectRelease();
  sub_23A4BCD04(v40, v39, v48);
  return swift_bridgeObjectRelease();
}

uint64_t sub_23A4D4074@<X0>(double a1@<X0>, char a2@<W1>, double a3@<X2>, char a4@<W3>, double a5@<X4>, char a6@<W5>, double a7@<X6>, char a8@<W7>, uint64_t a9@<X8>, double a10, char a11, double a12, char a13)
{
  const void *v13;
  void *v23;
  _BYTE __src[112];

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
    sub_23A4D5BC4();
    v23 = (void *)sub_23A4D572C();
    sub_23A4D5444();

  }
  sub_23A4D55C4();
  memcpy((void *)a9, v13, 0xE9uLL);
  memcpy((void *)(a9 + 240), __src, 0x70uLL);
  return sub_23A4D463C((uint64_t)v13);
}

uint64_t sub_23A4D4210(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  char v4;
  uint64_t v5;
  uint64_t v6;
  char v7;

  v2 = *(_QWORD *)(a1 + 40);
  v3 = *(_QWORD *)(a1 + 48);
  v4 = *(_BYTE *)(a1 + 56);
  v5 = *(_QWORD *)(a1 + 72);
  v6 = *(_QWORD *)(a1 + 80);
  v7 = *(_BYTE *)(a1 + 88);
  swift_bridgeObjectRelease();
  sub_23A4BCD04(v2, v3, v4);
  swift_bridgeObjectRelease();
  sub_23A4BCD04(v5, v6, v7);
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  return a1;
}

uint64_t sub_23A4D42C0@<X0>(uint64_t a1@<X1>, uint64_t a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  __int128 v7;
  uint64_t v8;
  char v9;
  uint64_t v10;
  char v11;
  __int128 v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  __int128 v16;
  __int128 v17;
  uint64_t v18;
  uint64_t v19;
  char v20;
  uint64_t v21;
  char v22;
  __int128 v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  __int128 v27;
  __int128 v28;
  uint64_t v29;

  if (a1)
  {
    v3 = sub_23A4D5A08();
    v5 = v4;
    sub_23A4D43B0((uint64_t)&v19);
    *(_QWORD *)&v7 = v3;
    *((_QWORD *)&v7 + 1) = v5;
    v8 = v19;
    v9 = v20;
    v10 = v21;
    v11 = v22;
    v12 = v23;
    v13 = v24;
    v14 = v25;
    v15 = v26;
    v16 = v27;
    v17 = v28;
    v18 = v29;
    nullsub_1(&v7);
  }
  else
  {
    sub_23A4D4BD4(&v7);
  }
  sub_23A4D4BEC((uint64_t)&v7, (uint64_t)&v19);
  return sub_23A4D4BEC((uint64_t)&v19, a2);
}

uint64_t sub_23A4D43B0@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t KeyPath;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v10;
  char v11;
  uint64_t v12;
  char v13;
  uint64_t v14;
  uint64_t v15;

  sub_23A4D5A08();
  sub_23A4D554C();
  v2 = sub_23A4D5960();
  KeyPath = swift_getKeyPath();
  sub_23A4D4FF4();
  v4 = sub_23A4D59A8();
  v5 = sub_23A4D5780();
  v6 = swift_getKeyPath();
  v7 = sub_23A4D5960();
  v8 = swift_getKeyPath();
  *(_QWORD *)a1 = v10;
  *(_BYTE *)(a1 + 8) = v11;
  *(_QWORD *)(a1 + 16) = v12;
  *(_BYTE *)(a1 + 24) = v13;
  *(_QWORD *)(a1 + 32) = v14;
  *(_QWORD *)(a1 + 40) = v15;
  *(_QWORD *)(a1 + 48) = KeyPath;
  *(_QWORD *)(a1 + 56) = v2;
  *(_QWORD *)(a1 + 64) = 0x3FD3333333333333;
  *(_QWORD *)(a1 + 72) = v4;
  *(_QWORD *)(a1 + 80) = v6;
  *(_QWORD *)(a1 + 88) = v5;
  *(_QWORD *)(a1 + 96) = v8;
  *(_QWORD *)(a1 + 104) = v7;
  swift_retain();
  return swift_release();
}

uint64_t sub_23A4D44DC@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_23A4D42C0(*(_QWORD *)(v1 + 8), a1);
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(_BYTE *)(*(_QWORD *)(a1 - 8) + 82) & 2) != 0)
    return *(_QWORD *)a2;
  return a2;
}

uint64_t sub_23A4D4504(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_23A4D55B8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_23A4D4548(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_23A4D55B8();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_23A4D4584(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  char v4;
  uint64_t v5;
  uint64_t v6;
  char v7;

  v2 = *(_QWORD *)(a1 + 64);
  v3 = *(_QWORD *)(a1 + 72);
  v4 = *(_BYTE *)(a1 + 80);
  v5 = *(_QWORD *)(a1 + 96);
  v6 = *(_QWORD *)(a1 + 104);
  v7 = *(_BYTE *)(a1 + 112);
  swift_bridgeObjectRelease();
  sub_23A4BCD04(v2, v3, v4);
  swift_bridgeObjectRelease();
  sub_23A4BCD04(v5, v6, v7);
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  return a1;
}

uint64_t sub_23A4D463C(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  char v4;
  uint64_t v5;
  uint64_t v6;
  char v7;

  v2 = *(_QWORD *)(a1 + 64);
  v3 = *(_QWORD *)(a1 + 72);
  v4 = *(_BYTE *)(a1 + 80);
  v5 = *(_QWORD *)(a1 + 96);
  v6 = *(_QWORD *)(a1 + 104);
  v7 = *(_BYTE *)(a1 + 112);
  sub_23A4D4FF4();
  sub_23A4C42E4(v2, v3, v4);
  sub_23A4D4FF4();
  sub_23A4C42E4(v5, v6, v7);
  swift_retain();
  sub_23A4D4FF4();
  swift_retain();
  return a1;
}

uint64_t sub_23A4D46EC(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  char v4;

  v2 = *(_QWORD *)(a1 + 56);
  v3 = *(_QWORD *)(a1 + 64);
  v4 = *(_BYTE *)(a1 + 72);
  sub_23A4C42E4(*(_QWORD *)(a1 + 24), *(_QWORD *)(a1 + 32), *(_BYTE *)(a1 + 40));
  sub_23A4D4FF4();
  sub_23A4C42E4(v2, v3, v4);
  swift_retain();
  sub_23A4D4FF4();
  swift_retain();
  return a1;
}

uint64_t sub_23A4D4778(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  char v4;

  v2 = *(_QWORD *)(a1 + 56);
  v3 = *(_QWORD *)(a1 + 64);
  v4 = *(_BYTE *)(a1 + 72);
  sub_23A4BCD04(*(_QWORD *)(a1 + 24), *(_QWORD *)(a1 + 32), *(_BYTE *)(a1 + 40));
  swift_bridgeObjectRelease();
  sub_23A4BCD04(v2, v3, v4);
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  return a1;
}

_QWORD *initializeBufferWithCopyOfBuffer for TipCollectionImage(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  sub_23A4D4FF4();
  return a1;
}

uint64_t destroy for TipCollectionImage()
{
  return swift_bridgeObjectRelease();
}

_QWORD *assignWithCopy for TipCollectionImage(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  sub_23A4D4FF4();
  swift_bridgeObjectRelease();
  return a1;
}

_QWORD *assignWithTake for TipCollectionImage(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for TipCollectionImage(uint64_t a1, unsigned int a2)
{
  int v2;
  unint64_t v3;

  if (a2)
  {
    if (a2 >= 0x7FFFFFFF && *(_BYTE *)(a1 + 16))
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

uint64_t storeEnumTagSinglePayload for TipCollectionImage(uint64_t result, unsigned int a2, unsigned int a3)
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
      *(_QWORD *)(result + 8) = a2;
  }
  return result;
}

ValueMetadata *type metadata accessor for TipCollectionImage()
{
  return &type metadata for TipCollectionImage;
}

unint64_t sub_23A4D4960()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_2569898C0;
  if (!qword_2569898C0)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2569898B8);
    v2[0] = sub_23A4D49CC();
    v2[1] = sub_23A4C4204();
    result = MEMORY[0x23B84F540](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_2569898C0);
  }
  return result;
}

unint64_t sub_23A4D49CC()
{
  unint64_t result;
  uint64_t v1;
  unint64_t v2;
  uint64_t v3;
  _QWORD v4[2];

  result = qword_2569898C8;
  if (!qword_2569898C8)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2569898B0);
    v2 = sub_23A4D4A50();
    sub_23A4CBC80(&qword_256988C78, &qword_256988C80, MEMORY[0x24BDEDC10]);
    v4[0] = v2;
    v4[1] = v3;
    result = MEMORY[0x23B84F540](MEMORY[0x24BDED308], v1, v4);
    atomic_store(result, (unint64_t *)&qword_2569898C8);
  }
  return result;
}

unint64_t sub_23A4D4A50()
{
  unint64_t result;
  uint64_t v1;
  unint64_t v2;
  uint64_t v3;
  _QWORD v4[2];

  result = qword_2569898D0;
  if (!qword_2569898D0)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2569898A8);
    v2 = sub_23A4D4AD4();
    sub_23A4CBC80(&qword_256989908, &qword_256989898, MEMORY[0x24BDEF370]);
    v4[0] = v2;
    v4[1] = v3;
    result = MEMORY[0x23B84F540](MEMORY[0x24BDED308], v1, v4);
    atomic_store(result, (unint64_t *)&qword_2569898D0);
  }
  return result;
}

unint64_t sub_23A4D4AD4()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_2569898D8;
  if (!qword_2569898D8)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2569898E0);
    v2[0] = sub_23A4D4B40();
    v2[1] = MEMORY[0x24BDEDBB8];
    result = MEMORY[0x23B84F540](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_2569898D8);
  }
  return result;
}

unint64_t sub_23A4D4B40()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;
  _QWORD v3[2];

  result = qword_2569898E8;
  if (!qword_2569898E8)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2569898F0);
    sub_23A4CBC80(&qword_2569898F8, &qword_256989900, MEMORY[0x24BDF4498]);
    v3[0] = v2;
    v3[1] = MEMORY[0x24BDECC60];
    result = MEMORY[0x23B84F540](MEMORY[0x24BDED308], v1, v3);
    atomic_store(result, (unint64_t *)&qword_2569898E8);
  }
  return result;
}

uint64_t sub_23A4D4BC4()
{
  return swift_getOpaqueTypeConformance2();
}

double sub_23A4D4BD4(_OWORD *a1)
{
  double result;

  result = 0.0;
  a1[6] = 0u;
  a1[7] = 0u;
  a1[4] = 0u;
  a1[5] = 0u;
  a1[2] = 0u;
  a1[3] = 0u;
  *a1 = 0u;
  a1[1] = 0u;
  return result;
}

uint64_t sub_23A4D4BEC(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_256989910);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

unint64_t sub_23A4D4C38()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  result = qword_256989918;
  if (!qword_256989918)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256989910);
    sub_23A4CBC80(&qword_256989920, &qword_256989928, MEMORY[0x24BDF4750]);
    v3 = v2;
    result = MEMORY[0x23B84F540](MEMORY[0x24BDF5578], v1, &v3);
    atomic_store(result, (unint64_t *)&qword_256989918);
  }
  return result;
}

uint64_t OUTLINED_FUNCTION_2_8()
{
  return sub_23A4D51E0();
}

uint64_t type metadata accessor for ResourceBundleClass()
{
  return objc_opt_self();
}

id sub_23A4D4CE8()
{
  uint64_t ObjCClassFromMetadata;
  id result;

  type metadata accessor for ResourceBundleClass();
  ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  result = objc_msgSend((id)objc_opt_self(), sel_bundleForClass_, ObjCClassFromMetadata);
  qword_256989930 = (uint64_t)result;
  return result;
}

uint64_t sub_23A4D4D3C()
{
  uint64_t v0;
  id v1;

  v0 = sub_23A4D5438();
  __swift_allocate_value_buffer(v0, qword_25698A920);
  __swift_project_value_buffer(v0, (uint64_t)qword_25698A920);
  if (qword_2569885D8 != -1)
    swift_once();
  v1 = (id)qword_256989930;
  return sub_23A4D542C();
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

uint64_t sub_23A4D4E20()
{
  return MEMORY[0x24BE2BF70]();
}

uint64_t sub_23A4D4E2C()
{
  return MEMORY[0x24BE2BF80]();
}

uint64_t sub_23A4D4E38()
{
  return MEMORY[0x24BDCC4A8]();
}

uint64_t sub_23A4D4E44()
{
  return MEMORY[0x24BDCC4D0]();
}

uint64_t sub_23A4D4E50()
{
  return MEMORY[0x24BDCC4E0]();
}

uint64_t sub_23A4D4E5C()
{
  return MEMORY[0x24BDCC4F0]();
}

uint64_t sub_23A4D4E68()
{
  return MEMORY[0x24BDCC5A8]();
}

uint64_t sub_23A4D4E74()
{
  return MEMORY[0x24BDCC610]();
}

uint64_t sub_23A4D4E80()
{
  return MEMORY[0x24BDCC620]();
}

uint64_t sub_23A4D4E8C()
{
  return MEMORY[0x24BDCC8D0]();
}

uint64_t sub_23A4D4E98()
{
  return MEMORY[0x24BDCC9A8]();
}

uint64_t sub_23A4D4EA4()
{
  return MEMORY[0x24BE2BF98]();
}

uint64_t sub_23A4D4EB0()
{
  return MEMORY[0x24BDCD8D0]();
}

uint64_t sub_23A4D4EBC()
{
  return MEMORY[0x24BDCD9C0]();
}

uint64_t sub_23A4D4EC8()
{
  return MEMORY[0x24BDCDA68]();
}

uint64_t sub_23A4D4ED4()
{
  return MEMORY[0x24BDCDAC0]();
}

uint64_t sub_23A4D4EE0()
{
  return MEMORY[0x24BDCE9B0]();
}

uint64_t sub_23A4D4EEC()
{
  return MEMORY[0x24BDCEA40]();
}

uint64_t sub_23A4D4EF8()
{
  return MEMORY[0x24BDCEA58]();
}

uint64_t sub_23A4D4F04()
{
  return MEMORY[0x24BDCECA0]();
}

uint64_t sub_23A4D4F10()
{
  return MEMORY[0x24BDCEDD0]();
}

uint64_t sub_23A4D4F1C()
{
  return MEMORY[0x24BDCEE28]();
}

uint64_t sub_23A4D4F28()
{
  return MEMORY[0x24BDCEEA8]();
}

uint64_t sub_23A4D4F34()
{
  return MEMORY[0x24BEAAC48]();
}

uint64_t sub_23A4D4F40()
{
  return MEMORY[0x24BEAB538]();
}

uint64_t sub_23A4D4F4C()
{
  return MEMORY[0x24BEAD2E8]();
}

uint64_t sub_23A4D4F58()
{
  return MEMORY[0x24BE03E60]();
}

uint64_t sub_23A4D4F64()
{
  return MEMORY[0x24BE03E70]();
}

uint64_t sub_23A4D4F70()
{
  return MEMORY[0x24BE03E80]();
}

uint64_t sub_23A4D4F7C()
{
  return MEMORY[0x24BE03E88]();
}

uint64_t sub_23A4D4F88()
{
  return MEMORY[0x24BE03EA8]();
}

uint64_t sub_23A4D4F94()
{
  return MEMORY[0x24BE03EF0]();
}

uint64_t sub_23A4D4FA0()
{
  return MEMORY[0x24BE03F58]();
}

uint64_t sub_23A4D4FAC()
{
  return MEMORY[0x24BE03F60]();
}

uint64_t sub_23A4D4FB8()
{
  return MEMORY[0x24BE03F98]();
}

uint64_t sub_23A4D4FC4()
{
  return MEMORY[0x24BE03FA0]();
}

uint64_t sub_23A4D4FD0()
{
  return MEMORY[0x24BE03FB8]();
}

uint64_t sub_23A4D4FDC()
{
  return MEMORY[0x24BE03FE0]();
}

uint64_t sub_23A4D4FE8()
{
  return MEMORY[0x24BE03FF0]();
}

uint64_t sub_23A4D4FF4()
{
  return MEMORY[0x24BE04030]();
}

uint64_t sub_23A4D5000()
{
  return MEMORY[0x24BE2BFA0]();
}

uint64_t sub_23A4D500C()
{
  return MEMORY[0x24BE2BFA8]();
}

uint64_t sub_23A4D5018()
{
  return MEMORY[0x24BE2BFB0]();
}

uint64_t sub_23A4D5024()
{
  return MEMORY[0x24BE2BFD0]();
}

uint64_t sub_23A4D5030()
{
  return MEMORY[0x24BE2BFD8]();
}

uint64_t sub_23A4D503C()
{
  return MEMORY[0x24BE2BFE0]();
}

uint64_t sub_23A4D5048()
{
  return MEMORY[0x24BE2BFF0]();
}

uint64_t sub_23A4D5054()
{
  return MEMORY[0x24BE2BFF8]();
}

uint64_t sub_23A4D5060()
{
  return MEMORY[0x24BE2C000]();
}

uint64_t sub_23A4D506C()
{
  return MEMORY[0x24BE2C008]();
}

uint64_t sub_23A4D5078()
{
  return MEMORY[0x24BE2C010]();
}

uint64_t sub_23A4D5084()
{
  return MEMORY[0x24BE2C018]();
}

uint64_t sub_23A4D5090()
{
  return MEMORY[0x24BE2C020]();
}

uint64_t sub_23A4D509C()
{
  return MEMORY[0x24BE2C028]();
}

uint64_t sub_23A4D50A8()
{
  return MEMORY[0x24BE2C038]();
}

uint64_t sub_23A4D50B4()
{
  return MEMORY[0x24BE2C040]();
}

uint64_t sub_23A4D50C0()
{
  return MEMORY[0x24BE2C048]();
}

uint64_t sub_23A4D50CC()
{
  return MEMORY[0x24BE2C050]();
}

uint64_t sub_23A4D50D8()
{
  return MEMORY[0x24BE2C058]();
}

uint64_t sub_23A4D50E4()
{
  return MEMORY[0x24BE2C060]();
}

uint64_t sub_23A4D50F0()
{
  return MEMORY[0x24BE2C068]();
}

uint64_t sub_23A4D50FC()
{
  return MEMORY[0x24BE2C078]();
}

uint64_t sub_23A4D5108()
{
  return MEMORY[0x24BE2C080]();
}

uint64_t sub_23A4D5114()
{
  return MEMORY[0x24BE2C088]();
}

uint64_t sub_23A4D5120()
{
  return MEMORY[0x24BE2C090]();
}

uint64_t sub_23A4D512C()
{
  return MEMORY[0x24BE2C098]();
}

uint64_t sub_23A4D5138()
{
  return MEMORY[0x24BE2C0A8]();
}

uint64_t sub_23A4D5144()
{
  return MEMORY[0x24BE2C0B0]();
}

uint64_t sub_23A4D5150()
{
  return MEMORY[0x24BE2C0B8]();
}

uint64_t sub_23A4D515C()
{
  return MEMORY[0x24BE2C0C0]();
}

uint64_t sub_23A4D5168()
{
  return MEMORY[0x24BE2C0C8]();
}

uint64_t sub_23A4D5174()
{
  return MEMORY[0x24BE2C0D0]();
}

uint64_t sub_23A4D5180()
{
  return MEMORY[0x24BE2C0E0]();
}

uint64_t sub_23A4D518C()
{
  return MEMORY[0x24BE2C0E8]();
}

uint64_t sub_23A4D5198()
{
  return MEMORY[0x24BE2C0F0]();
}

uint64_t sub_23A4D51A4()
{
  return MEMORY[0x24BE2C100]();
}

uint64_t sub_23A4D51B0()
{
  return MEMORY[0x24BE2C108]();
}

uint64_t sub_23A4D51BC()
{
  return MEMORY[0x24BE2C110]();
}

uint64_t sub_23A4D51C8()
{
  return MEMORY[0x24BE2C118]();
}

uint64_t sub_23A4D51D4()
{
  return MEMORY[0x24BE2C120]();
}

uint64_t sub_23A4D51E0()
{
  return MEMORY[0x24BE2C128]();
}

uint64_t sub_23A4D51EC()
{
  return MEMORY[0x24BE2C138]();
}

uint64_t sub_23A4D51F8()
{
  return MEMORY[0x24BE2C140]();
}

uint64_t sub_23A4D5204()
{
  return MEMORY[0x24BE2C150]();
}

uint64_t sub_23A4D5210()
{
  return MEMORY[0x24BE2C158]();
}

uint64_t sub_23A4D521C()
{
  return MEMORY[0x24BE2C160]();
}

uint64_t sub_23A4D5228()
{
  return MEMORY[0x24BE2C168]();
}

uint64_t sub_23A4D5234()
{
  return MEMORY[0x24BE2C178]();
}

uint64_t sub_23A4D5240()
{
  return MEMORY[0x24BE2C180]();
}

uint64_t sub_23A4D524C()
{
  return MEMORY[0x24BE2C188]();
}

uint64_t sub_23A4D5258()
{
  return MEMORY[0x24BE2C198]();
}

uint64_t sub_23A4D5264()
{
  return MEMORY[0x24BE2C1A0]();
}

uint64_t sub_23A4D5270()
{
  return MEMORY[0x24BE2C1A8]();
}

uint64_t sub_23A4D527C()
{
  return MEMORY[0x24BE2C1B8]();
}

uint64_t sub_23A4D5288()
{
  return MEMORY[0x24BE2C1C0]();
}

uint64_t sub_23A4D5294()
{
  return MEMORY[0x24BE2C1C8]();
}

uint64_t sub_23A4D52A0()
{
  return MEMORY[0x24BE2C1D0]();
}

uint64_t sub_23A4D52AC()
{
  return MEMORY[0x24BE2C1D8]();
}

uint64_t sub_23A4D52B8()
{
  return MEMORY[0x24BE2C1E0]();
}

uint64_t sub_23A4D52C4()
{
  return MEMORY[0x24BE2C1E8]();
}

uint64_t sub_23A4D52D0()
{
  return MEMORY[0x24BE2C1F0]();
}

uint64_t sub_23A4D52DC()
{
  return MEMORY[0x24BE2C1F8]();
}

uint64_t sub_23A4D52E8()
{
  return MEMORY[0x24BE2C200]();
}

uint64_t sub_23A4D52F4()
{
  return MEMORY[0x24BE2C210]();
}

uint64_t sub_23A4D5300()
{
  return MEMORY[0x24BE2C218]();
}

uint64_t sub_23A4D530C()
{
  return MEMORY[0x24BE2C220]();
}

uint64_t sub_23A4D5318()
{
  return MEMORY[0x24BE2C228]();
}

uint64_t sub_23A4D5324()
{
  return MEMORY[0x24BE2C230]();
}

uint64_t sub_23A4D5330()
{
  return MEMORY[0x24BE2C238]();
}

uint64_t sub_23A4D533C()
{
  return MEMORY[0x24BE2C240]();
}

uint64_t sub_23A4D5348()
{
  return MEMORY[0x24BE2C248]();
}

uint64_t sub_23A4D5354()
{
  return MEMORY[0x24BE2C290]();
}

uint64_t sub_23A4D5360()
{
  return MEMORY[0x24BE2C2A0]();
}

uint64_t sub_23A4D536C()
{
  return MEMORY[0x24BE2C2A8]();
}

uint64_t sub_23A4D5378()
{
  return MEMORY[0x24BE2C2B0]();
}

uint64_t sub_23A4D5384()
{
  return MEMORY[0x24BE2C2B8]();
}

uint64_t sub_23A4D5390()
{
  return MEMORY[0x24BE2C2C0]();
}

uint64_t sub_23A4D539C()
{
  return MEMORY[0x24BE2C2C8]();
}

uint64_t sub_23A4D53A8()
{
  return MEMORY[0x24BE2C2E0]();
}

uint64_t sub_23A4D53B4()
{
  return MEMORY[0x24BE2C2E8]();
}

uint64_t sub_23A4D53C0()
{
  return MEMORY[0x24BE2C2F0]();
}

uint64_t sub_23A4D53CC()
{
  return MEMORY[0x24BE2C2F8]();
}

uint64_t sub_23A4D53D8()
{
  return MEMORY[0x24BE2C308]();
}

uint64_t sub_23A4D53E4()
{
  return MEMORY[0x24BE2C310]();
}

uint64_t sub_23A4D53F0()
{
  return MEMORY[0x24BE2C318]();
}

uint64_t sub_23A4D53FC()
{
  return MEMORY[0x24BE2C320]();
}

uint64_t sub_23A4D5408()
{
  return MEMORY[0x24BE2C338]();
}

uint64_t sub_23A4D5414()
{
  return MEMORY[0x24BE2C340]();
}

uint64_t sub_23A4D5420()
{
  return MEMORY[0x24BE2C348]();
}

uint64_t sub_23A4D542C()
{
  return MEMORY[0x24BDC6D18]();
}

uint64_t sub_23A4D5438()
{
  return MEMORY[0x24BDC6D28]();
}

uint64_t sub_23A4D5444()
{
  return MEMORY[0x24BEE76F0]();
}

uint64_t sub_23A4D5450()
{
  return MEMORY[0x24BE2C358]();
}

uint64_t sub_23A4D545C()
{
  return MEMORY[0x24BEE78A8]();
}

uint64_t sub_23A4D5468()
{
  return MEMORY[0x24BEE78D8]();
}

uint64_t sub_23A4D5474()
{
  return MEMORY[0x24BEB7EC0]();
}

uint64_t sub_23A4D5480()
{
  return MEMORY[0x24BEB7EC8]();
}

uint64_t sub_23A4D548C()
{
  return MEMORY[0x24BEB7ED8]();
}

uint64_t sub_23A4D5498()
{
  return MEMORY[0x24BEB7EE8]();
}

uint64_t sub_23A4D54A4()
{
  return MEMORY[0x24BEB7EF0]();
}

uint64_t sub_23A4D54B0()
{
  return MEMORY[0x24BEB7F08]();
}

uint64_t sub_23A4D54BC()
{
  return MEMORY[0x24BDEAF58]();
}

uint64_t sub_23A4D54C8()
{
  return MEMORY[0x24BDEB040]();
}

uint64_t sub_23A4D54D4()
{
  return MEMORY[0x24BDEB1F0]();
}

uint64_t sub_23A4D54E0()
{
  return MEMORY[0x24BDEB3E0]();
}

uint64_t sub_23A4D54EC()
{
  return MEMORY[0x24BDEB418]();
}

uint64_t sub_23A4D54F8()
{
  return MEMORY[0x24BDEB560]();
}

uint64_t sub_23A4D5504()
{
  return MEMORY[0x24BDEBC28]();
}

uint64_t sub_23A4D5510()
{
  return MEMORY[0x24BDEBC38]();
}

uint64_t sub_23A4D551C()
{
  return MEMORY[0x24BDEBC40]();
}

uint64_t sub_23A4D5528()
{
  return MEMORY[0x24BDEBDE0]();
}

uint64_t sub_23A4D5534()
{
  return MEMORY[0x24BDEBDF0]();
}

uint64_t sub_23A4D5540()
{
  return MEMORY[0x24BDEBE00]();
}

uint64_t sub_23A4D554C()
{
  return MEMORY[0x24BDEBED0]();
}

uint64_t sub_23A4D5558()
{
  return MEMORY[0x24BDEBF88]();
}

uint64_t sub_23A4D5564()
{
  return MEMORY[0x24BDEC120]();
}

uint64_t sub_23A4D5570()
{
  return MEMORY[0x24BDEC348]();
}

uint64_t sub_23A4D557C()
{
  return MEMORY[0x24BDEC358]();
}

uint64_t sub_23A4D5588()
{
  return MEMORY[0x24BDEC648]();
}

uint64_t sub_23A4D5594()
{
  return MEMORY[0x24BDECD20]();
}

uint64_t sub_23A4D55A0()
{
  return MEMORY[0x24BDECE88]();
}

uint64_t sub_23A4D55AC()
{
  return MEMORY[0x24BDECF50]();
}

uint64_t sub_23A4D55B8()
{
  return MEMORY[0x24BDED998]();
}

uint64_t sub_23A4D55C4()
{
  return MEMORY[0x24BDEDBA8]();
}

uint64_t sub_23A4D55D0()
{
  return MEMORY[0x24BDEDE50]();
}

uint64_t sub_23A4D55DC()
{
  return MEMORY[0x24BDEDE60]();
}

uint64_t sub_23A4D55E8()
{
  return MEMORY[0x24BEAD678]();
}

uint64_t sub_23A4D55F4()
{
  return MEMORY[0x24BEAD680]();
}

uint64_t sub_23A4D5600()
{
  return MEMORY[0x24BDEDEC0]();
}

uint64_t sub_23A4D560C()
{
  return MEMORY[0x24BDEDEE8]();
}

uint64_t sub_23A4D5618()
{
  return MEMORY[0x24BDEE020]();
}

uint64_t sub_23A4D5624()
{
  return MEMORY[0x24BDEE028]();
}

uint64_t sub_23A4D5630()
{
  return MEMORY[0x24BDEE038]();
}

uint64_t sub_23A4D563C()
{
  return MEMORY[0x24BDEE048]();
}

uint64_t sub_23A4D5648()
{
  return MEMORY[0x24BDEE390]();
}

uint64_t sub_23A4D5654()
{
  return MEMORY[0x24BDEE3A0]();
}

uint64_t sub_23A4D5660()
{
  return MEMORY[0x24BDEE490]();
}

uint64_t sub_23A4D566C()
{
  return MEMORY[0x24BDEE4A0]();
}

uint64_t sub_23A4D5678()
{
  return MEMORY[0x24BDEE4E0]();
}

uint64_t sub_23A4D5684()
{
  return MEMORY[0x24BDEE4F8]();
}

uint64_t sub_23A4D5690()
{
  return MEMORY[0x24BDEE530]();
}

uint64_t sub_23A4D569C()
{
  return MEMORY[0x24BDEE538]();
}

uint64_t sub_23A4D56A8()
{
  return MEMORY[0x24BDEE700]();
}

uint64_t sub_23A4D56B4()
{
  return MEMORY[0x24BDEE708]();
}

uint64_t sub_23A4D56C0()
{
  return MEMORY[0x24BDEE718]();
}

uint64_t sub_23A4D56CC()
{
  return MEMORY[0x24BDEE730]();
}

uint64_t sub_23A4D56D8()
{
  return MEMORY[0x24BDEEB88]();
}

uint64_t sub_23A4D56E4()
{
  return MEMORY[0x24BDEEF60]();
}

uint64_t sub_23A4D56F0()
{
  return MEMORY[0x24BDEEF78]();
}

uint64_t sub_23A4D56FC()
{
  return MEMORY[0x24BDEF3A0]();
}

uint64_t sub_23A4D5708()
{
  return MEMORY[0x24BEAD6A0]();
}

uint64_t sub_23A4D5714()
{
  return MEMORY[0x24BDEFCA8]();
}

uint64_t sub_23A4D5720()
{
  return MEMORY[0x24BDEFCC8]();
}

uint64_t sub_23A4D572C()
{
  return MEMORY[0x24BDF1430]();
}

uint64_t sub_23A4D5738()
{
  return MEMORY[0x24BDF14A8]();
}

uint64_t sub_23A4D5744()
{
  return MEMORY[0x24BDF14C0]();
}

uint64_t sub_23A4D5750()
{
  return MEMORY[0x24BDF14F8]();
}

uint64_t sub_23A4D575C()
{
  return MEMORY[0x24BDF1580]();
}

uint64_t sub_23A4D5768()
{
  return MEMORY[0x24BDF15F8]();
}

uint64_t sub_23A4D5774()
{
  return MEMORY[0x24BDF1600]();
}

uint64_t sub_23A4D5780()
{
  return MEMORY[0x24BDF1640]();
}

uint64_t sub_23A4D578C()
{
  return MEMORY[0x24BDF1678]();
}

uint64_t sub_23A4D5798()
{
  return MEMORY[0x24BDF16D8]();
}

uint64_t sub_23A4D57A4()
{
  return MEMORY[0x24BDF1700]();
}

uint64_t sub_23A4D57B0()
{
  return MEMORY[0x24BDF1750]();
}

uint64_t sub_23A4D57BC()
{
  return MEMORY[0x24BDF1790]();
}

uint64_t sub_23A4D57C8()
{
  return MEMORY[0x24BDF17D8]();
}

uint64_t sub_23A4D57D4()
{
  return MEMORY[0x24BDF1818]();
}

uint64_t sub_23A4D57E0()
{
  return MEMORY[0x24BEAD6C0]();
}

uint64_t sub_23A4D57EC()
{
  return MEMORY[0x24BDF1BE8]();
}

uint64_t sub_23A4D57F8()
{
  return MEMORY[0x24BDF1C00]();
}

uint64_t sub_23A4D5804()
{
  return MEMORY[0x24BDF1C18]();
}

uint64_t sub_23A4D5810()
{
  return MEMORY[0x24BDF1C20]();
}

uint64_t sub_23A4D581C()
{
  return MEMORY[0x24BDF1C28]();
}

uint64_t sub_23A4D5828()
{
  return MEMORY[0x24BDF1D68]();
}

uint64_t sub_23A4D5834()
{
  return MEMORY[0x24BDF1DC8]();
}

uint64_t sub_23A4D5840()
{
  return MEMORY[0x24BDF1FD8]();
}

uint64_t sub_23A4D584C()
{
  return MEMORY[0x24BDF1FF0]();
}

uint64_t sub_23A4D5858()
{
  return MEMORY[0x24BDF1FF8]();
}

uint64_t sub_23A4D5864()
{
  return MEMORY[0x24BEAD6D0]();
}

uint64_t sub_23A4D5870()
{
  return MEMORY[0x24BEAD6E0]();
}

uint64_t sub_23A4D587C()
{
  return MEMORY[0x24BEAD720]();
}

uint64_t sub_23A4D5888()
{
  return MEMORY[0x24BEAD740]();
}

uint64_t sub_23A4D5894()
{
  return MEMORY[0x24BEAD768]();
}

uint64_t sub_23A4D58A0()
{
  return MEMORY[0x24BEAD7C0]();
}

uint64_t sub_23A4D58AC()
{
  return MEMORY[0x24BEAD818]();
}

uint64_t sub_23A4D58B8()
{
  return MEMORY[0x24BEAD840]();
}

uint64_t sub_23A4D58C4()
{
  return MEMORY[0x24BEAD898]();
}

uint64_t sub_23A4D58D0()
{
  return MEMORY[0x24BEAD8F0]();
}

uint64_t sub_23A4D58DC()
{
  return MEMORY[0x24BEAD910]();
}

uint64_t sub_23A4D58E8()
{
  return MEMORY[0x24BDF2088]();
}

uint64_t sub_23A4D58F4()
{
  return MEMORY[0x24BDF20A0]();
}

uint64_t sub_23A4D5900()
{
  return MEMORY[0x24BDF22B0]();
}

uint64_t sub_23A4D590C()
{
  return MEMORY[0x24BDF2548]();
}

uint64_t sub_23A4D5918()
{
  return MEMORY[0x24BDF2698]();
}

uint64_t sub_23A4D5924()
{
  return MEMORY[0x24BDF2A98]();
}

uint64_t sub_23A4D5930()
{
  return MEMORY[0x24BDF2EB0]();
}

uint64_t sub_23A4D593C()
{
  return MEMORY[0x24BDF3900]();
}

uint64_t sub_23A4D5948()
{
  return MEMORY[0x24BDF3C90]();
}

uint64_t sub_23A4D5954()
{
  return MEMORY[0x24BDF3D10]();
}

uint64_t sub_23A4D5960()
{
  return MEMORY[0x24BDF3D30]();
}

uint64_t sub_23A4D596C()
{
  return MEMORY[0x24BDF3D60]();
}

uint64_t sub_23A4D5978()
{
  return MEMORY[0x24BDF3E08]();
}

uint64_t sub_23A4D5984()
{
  return MEMORY[0x24BDF3E98]();
}

uint64_t sub_23A4D5990()
{
  return MEMORY[0x24BDF3EB0]();
}

uint64_t sub_23A4D599C()
{
  return MEMORY[0x24BDF3FE8]();
}

uint64_t sub_23A4D59A8()
{
  return MEMORY[0x24BDF4048]();
}

uint64_t sub_23A4D59B4()
{
  return MEMORY[0x24BDF40D8]();
}

uint64_t sub_23A4D59C0()
{
  return MEMORY[0x24BDF4280]();
}

uint64_t sub_23A4D59CC()
{
  return MEMORY[0x24BDF4290]();
}

uint64_t sub_23A4D59D8()
{
  return MEMORY[0x24BDF42A8]();
}

uint64_t sub_23A4D59E4()
{
  return MEMORY[0x24BDF4340]();
}

uint64_t sub_23A4D59F0()
{
  return MEMORY[0x24BDF49A0]();
}

uint64_t sub_23A4D59FC()
{
  return MEMORY[0x24BDF4EC8]();
}

uint64_t sub_23A4D5A08()
{
  return MEMORY[0x24BDF4F18]();
}

uint64_t sub_23A4D5A14()
{
  return MEMORY[0x24BEAD990]();
}

uint64_t sub_23A4D5A20()
{
  return MEMORY[0x24BEADA08]();
}

uint64_t sub_23A4D5A2C()
{
  return MEMORY[0x24BEADA38]();
}

uint64_t sub_23A4D5A38()
{
  return MEMORY[0x24BEADA60]();
}

uint64_t sub_23A4D5A44()
{
  return MEMORY[0x24BEADB88]();
}

uint64_t sub_23A4D5A50()
{
  return MEMORY[0x24BEADBD0]();
}

uint64_t sub_23A4D5A5C()
{
  return MEMORY[0x24BEADC38]();
}

uint64_t sub_23A4D5A68()
{
  return MEMORY[0x24BEADD50]();
}

uint64_t sub_23A4D5A74()
{
  return MEMORY[0x24BEADD58]();
}

uint64_t sub_23A4D5A80()
{
  return MEMORY[0x24BEADE58]();
}

uint64_t sub_23A4D5A8C()
{
  return MEMORY[0x24BEADE60]();
}

uint64_t sub_23A4D5A98()
{
  return MEMORY[0x24BEAE070]();
}

uint64_t sub_23A4D5AA4()
{
  return MEMORY[0x24BEAE220]();
}

uint64_t sub_23A4D5AB0()
{
  return MEMORY[0x24BEAE228]();
}

uint64_t sub_23A4D5ABC()
{
  return MEMORY[0x24BEAE380]();
}

uint64_t sub_23A4D5AC8()
{
  return MEMORY[0x24BEAE3D8]();
}

uint64_t sub_23A4D5AD4()
{
  return MEMORY[0x24BEAE548]();
}

uint64_t sub_23A4D5AE0()
{
  return MEMORY[0x24BEAE580]();
}

uint64_t sub_23A4D5AEC()
{
  return MEMORY[0x24BEE02B0]();
}

uint64_t sub_23A4D5AF8()
{
  return MEMORY[0x24BEE0620]();
}

uint64_t sub_23A4D5B04()
{
  return MEMORY[0x24BEE0980]();
}

uint64_t sub_23A4D5B10()
{
  return MEMORY[0x24BDCF9E0]();
}

uint64_t sub_23A4D5B1C()
{
  return MEMORY[0x24BDCFA28]();
}

uint64_t sub_23A4D5B28()
{
  return MEMORY[0x24BEE09F0]();
}

uint64_t sub_23A4D5B34()
{
  return MEMORY[0x24BEE0BC0]();
}

uint64_t sub_23A4D5B40()
{
  return MEMORY[0x24BEE0C10]();
}

uint64_t sub_23A4D5B4C()
{
  return MEMORY[0x24BEE0DE8]();
}

uint64_t sub_23A4D5B58()
{
  return MEMORY[0x24BEE6800]();
}

uint64_t sub_23A4D5B64()
{
  return MEMORY[0x24BEE6988]();
}

uint64_t sub_23A4D5B70()
{
  return MEMORY[0x24BEE6990]();
}

uint64_t sub_23A4D5B7C()
{
  return MEMORY[0x24BEE18A0]();
}

uint64_t sub_23A4D5B88()
{
  return MEMORY[0x24BEE1908]();
}

uint64_t sub_23A4D5B94()
{
  return MEMORY[0x24BEE1910]();
}

uint64_t sub_23A4D5BA0()
{
  return MEMORY[0x24BEE1A28]();
}

uint64_t sub_23A4D5BAC()
{
  return MEMORY[0x24BEE7908]();
}

uint64_t sub_23A4D5BB8()
{
  return MEMORY[0x24BEE7910]();
}

uint64_t sub_23A4D5BC4()
{
  return MEMORY[0x24BEE7920]();
}

uint64_t sub_23A4D5BD0()
{
  return MEMORY[0x24BEB7F10]();
}

uint64_t sub_23A4D5BDC()
{
  return MEMORY[0x24BEE1E70]();
}

uint64_t sub_23A4D5BE8()
{
  return MEMORY[0x24BEE1F00]();
}

uint64_t sub_23A4D5BF4()
{
  return MEMORY[0x24BEE1F48]();
}

uint64_t sub_23A4D5C00()
{
  return MEMORY[0x24BDD0668]();
}

uint64_t sub_23A4D5C0C()
{
  return MEMORY[0x24BEE2518]();
}

uint64_t sub_23A4D5C18()
{
  return MEMORY[0x24BEE2838]();
}

uint64_t sub_23A4D5C24()
{
  return MEMORY[0x24BEE2E68]();
}

uint64_t sub_23A4D5C30()
{
  return MEMORY[0x24BEE2F40]();
}

uint64_t sub_23A4D5C3C()
{
  return MEMORY[0x24BEE2F48]();
}

uint64_t sub_23A4D5C48()
{
  return MEMORY[0x24BEE3088]();
}

uint64_t sub_23A4D5C54()
{
  return MEMORY[0x24BEE30B0]();
}

uint64_t sub_23A4D5C60()
{
  return MEMORY[0x24BEE3A30]();
}

uint64_t sub_23A4D5C6C()
{
  return MEMORY[0x24BEE3B98]();
}

uint64_t sub_23A4D5C78()
{
  return MEMORY[0x24BEE3ED8]();
}

uint64_t sub_23A4D5C84()
{
  return MEMORY[0x24BDD0708]();
}

uint64_t sub_23A4D5C90()
{
  return MEMORY[0x24BEE3EF8]();
}

uint64_t sub_23A4D5C9C()
{
  return MEMORY[0x24BEE3F00]();
}

uint64_t sub_23A4D5CA8()
{
  return MEMORY[0x24BEE3F08]();
}

uint64_t sub_23A4D5CB4()
{
  return MEMORY[0x24BEE3F10]();
}

uint64_t sub_23A4D5CC0()
{
  return MEMORY[0x24BEE42E0]();
}

uint64_t sub_23A4D5CCC()
{
  return MEMORY[0x24BEE42F8]();
}

uint64_t sub_23A4D5CD8()
{
  return MEMORY[0x24BEE4328]();
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

uint64_t swift_dynamicCastClass()
{
  return MEMORY[0x24BEE4C40]();
}

uint64_t swift_dynamicCastObjCClass()
{
  return MEMORY[0x24BEE4C60]();
}

uint64_t swift_errorRelease()
{
  return MEMORY[0x24BEE4CA0]();
}

uint64_t swift_errorRetain()
{
  return MEMORY[0x24BEE4CA8]();
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

uint64_t swift_getErrorValue()
{
  return MEMORY[0x24BEE4D18]();
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

uint64_t swift_task_alloc()
{
  return MEMORY[0x24BEE7228]();
}

uint64_t swift_task_create()
{
  return MEMORY[0x24BEE7230]();
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

uint64_t swift_unknownObjectRetain_n()
{
  return MEMORY[0x24BEE4F88]();
}

uint64_t swift_updateClassMetadata2()
{
  return MEMORY[0x24BEE5008]();
}

