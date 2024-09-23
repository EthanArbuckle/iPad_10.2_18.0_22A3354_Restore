uint64_t sub_1B9DC0408@<X0>(uint64_t a1@<X8>)
{
  uint64_t *v1;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  int64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  int64_t v14;
  uint64_t v15;
  int64_t v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  int64_t v27;
  int64_t v28;
  unint64_t v29;
  int64_t v30;
  int64_t v31;
  int64_t v32;
  void (*v33)(uint64_t);
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v39;
  char *v40;
  uint64_t v41;
  uint64_t v42;
  char *v43;
  int64_t v44;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED5CDDE8);
  MEMORY[0x1E0C80A78](v3);
  v5 = (char *)&v39 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED5CDDF0);
  v7 = MEMORY[0x1E0C80A78](v6);
  v9 = (char *)&v39 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v7);
  v11 = (char *)&v39 - v10;
  v12 = *v1;
  v13 = v1[1];
  v15 = v1[2];
  v14 = v1[3];
  v16 = v14;
  v17 = v1[4];
  v40 = v5;
  if (v17)
  {
    v43 = v9;
    v44 = v14;
    v41 = v15;
    v42 = v13;
    v18 = a1;
    v19 = (v17 - 1) & v17;
    v20 = __clz(__rbit64(v17)) | (v14 << 6);
LABEL_3:
    v21 = *(_QWORD *)(v12 + 56);
    v22 = (uint64_t *)(*(_QWORD *)(v12 + 48) + 16 * v20);
    v23 = v12;
    v24 = *v22;
    v25 = v22[1];
    v26 = sub_1B9DE1554();
    (*(void (**)(char *, unint64_t, uint64_t))(*(_QWORD *)(v26 - 8) + 16))(&v11[*(int *)(v3 + 48)], v21 + *(_QWORD *)(*(_QWORD *)(v26 - 8) + 72) * v20, v26);
    *(_QWORD *)v11 = v24;
    *((_QWORD *)v11 + 1) = v25;
    __swift_storeEnumTagSinglePayload((uint64_t)v11, 0, 1, v3);
    v12 = v23;
    swift_bridgeObjectRetain();
    a1 = v18;
    v13 = v42;
    v9 = v43;
    v15 = v41;
    goto LABEL_25;
  }
  v27 = v14 + 1;
  if (__OFADD__(v14, 1))
  {
    __break(1u);
LABEL_23:
    v16 = v10;
    goto LABEL_24;
  }
  v28 = (unint64_t)(v15 + 64) >> 6;
  if (v27 < v28)
  {
    v29 = *(_QWORD *)(v13 + 8 * v27);
    if (v29)
    {
LABEL_7:
      v41 = v15;
      v42 = v13;
      v43 = v9;
      v44 = v27;
      v18 = a1;
      v19 = (v29 - 1) & v29;
      v20 = __clz(__rbit64(v29)) + (v27 << 6);
      goto LABEL_3;
    }
    v30 = v14 + 2;
    v16 = v14 + 1;
    if (v14 + 2 < v28)
    {
      v29 = *(_QWORD *)(v13 + 8 * v30);
      if (v29)
      {
LABEL_10:
        v27 = v30;
        goto LABEL_7;
      }
      v16 = v14 + 2;
      if (v14 + 3 < v28)
      {
        v29 = *(_QWORD *)(v13 + 8 * (v14 + 3));
        if (v29)
        {
          v27 = v14 + 3;
          goto LABEL_7;
        }
        v30 = v14 + 4;
        v16 = v14 + 3;
        if (v14 + 4 < v28)
        {
          v29 = *(_QWORD *)(v13 + 8 * v30);
          if (v29)
            goto LABEL_10;
          v27 = v14 + 5;
          v16 = v14 + 4;
          if (v14 + 5 < v28)
          {
            v29 = *(_QWORD *)(v13 + 8 * v27);
            if (v29)
              goto LABEL_7;
            v10 = v28 - 1;
            v31 = v14 + 6;
            while (v31 < v28)
            {
              v29 = *(_QWORD *)(v13 + 8 * v31++);
              if (v29)
              {
                v27 = v31 - 1;
                goto LABEL_7;
              }
            }
            goto LABEL_23;
          }
        }
      }
    }
  }
LABEL_24:
  v44 = v16;
  __swift_storeEnumTagSinglePayload((uint64_t)v11, 1, 1, v3);
  v19 = 0;
LABEL_25:
  *v1 = v12;
  v1[1] = v13;
  v32 = v44;
  v1[2] = v15;
  v1[3] = v32;
  v1[4] = v19;
  v33 = (void (*)(uint64_t))v1[5];
  sub_1B9DB4BD4((uint64_t)v11, (uint64_t)v9, &qword_1ED5CDDF0);
  v34 = 1;
  if (__swift_getEnumTagSinglePayload((uint64_t)v9, 1, v3) != 1)
  {
    v35 = (uint64_t)v9;
    v36 = (uint64_t)v40;
    sub_1B9DB4BD4(v35, (uint64_t)v40, &qword_1ED5CDDE8);
    v33(v36);
    sub_1B9D4A5CC(v36, &qword_1ED5CDDE8);
    v34 = 0;
  }
  v37 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED5CDDF8);
  return __swift_storeEnumTagSinglePayload(a1, v34, 1, v37);
}

unint64_t sub_1B9DC0718()
{
  unint64_t result;

  result = qword_1EF2436D8;
  if (!qword_1EF2436D8)
  {
    result = MEMORY[0x1BCCCEEA8](&unk_1B9DF4D40, &type metadata for PluginLoader.LoadingError);
    atomic_store(result, (unint64_t *)&qword_1EF2436D8);
  }
  return result;
}

void sub_1B9DC0754(uint64_t a1@<X8>)
{
  uint64_t *v1;
  uint64_t v3;
  uint64_t v4;
  int64_t v5;
  uint64_t v6;
  int64_t v7;
  unint64_t v8;
  uint64_t v9;
  unint64_t v10;
  int64_t v11;
  int64_t v12;
  unint64_t v13;
  int64_t v14;
  int64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24[9];
  _QWORD __src[9];
  _OWORD v26[4];
  uint64_t v27;

  v3 = *v1;
  v4 = v1[1];
  v6 = v1[2];
  v5 = v1[3];
  v7 = v5;
  v8 = v1[4];
  if (v8)
  {
    v9 = (v8 - 1) & v8;
    v10 = __clz(__rbit64(v8)) | (v5 << 6);
LABEL_3:
    sub_1B9D5EA70(*(_QWORD *)(v3 + 48) + 40 * v10, (uint64_t)v26);
    sub_1B9D45A64(*(_QWORD *)(v3 + 56) + 32 * v10, (uint64_t)&v26[2] + 8);
    goto LABEL_23;
  }
  v11 = v5 + 1;
  if (__OFADD__(v5, 1))
  {
    __break(1u);
    return;
  }
  v12 = (unint64_t)(v6 + 64) >> 6;
  if (v11 < v12)
  {
    v13 = *(_QWORD *)(v4 + 8 * v11);
    if (v13)
    {
LABEL_7:
      v9 = (v13 - 1) & v13;
      v10 = __clz(__rbit64(v13)) + (v11 << 6);
      v7 = v11;
      goto LABEL_3;
    }
    v14 = v5 + 2;
    v7 = v5 + 1;
    if (v5 + 2 < v12)
    {
      v13 = *(_QWORD *)(v4 + 8 * v14);
      if (v13)
      {
LABEL_10:
        v11 = v14;
        goto LABEL_7;
      }
      v7 = v5 + 2;
      if (v5 + 3 < v12)
      {
        v13 = *(_QWORD *)(v4 + 8 * (v5 + 3));
        if (v13)
        {
          v11 = v5 + 3;
          goto LABEL_7;
        }
        v14 = v5 + 4;
        v7 = v5 + 3;
        if (v5 + 4 < v12)
        {
          v13 = *(_QWORD *)(v4 + 8 * v14);
          if (v13)
            goto LABEL_10;
          v11 = v5 + 5;
          v7 = v5 + 4;
          if (v5 + 5 < v12)
          {
            v13 = *(_QWORD *)(v4 + 8 * v11);
            if (v13)
              goto LABEL_7;
            v7 = v12 - 1;
            v15 = v5 + 6;
            while (v15 < v12)
            {
              v13 = *(_QWORD *)(v4 + 8 * v15++);
              if (v13)
              {
                v11 = v15 - 1;
                goto LABEL_7;
              }
            }
          }
        }
      }
    }
  }
  v9 = 0;
  v27 = 0;
  memset(v26, 0, sizeof(v26));
LABEL_23:
  *v1 = v3;
  v1[1] = v4;
  v1[2] = v6;
  v1[3] = v7;
  v1[4] = v9;
  sub_1B9DB4BD4((uint64_t)v26, (uint64_t)__src, &qword_1ED5CFBA0);
  if (__src[3])
  {
    v16 = memcpy(v24, __src, sizeof(v24));
    OUTLINED_FUNCTION_65_4((uint64_t)v16, v17, v18, v19, v20, v21, v22, v23, v24[0]);
    sub_1B9D4A5CC((uint64_t)v24, &qword_1ED5CFB98);
  }
  else
  {
    *(_QWORD *)(a1 + 64) = 0;
    *(_OWORD *)(a1 + 32) = 0u;
    *(_OWORD *)(a1 + 48) = 0u;
    *(_OWORD *)a1 = 0u;
    *(_OWORD *)(a1 + 16) = 0u;
  }
}

ValueMetadata *type metadata accessor for PluginLoader.LoadingError()
{
  return &type metadata for PluginLoader.LoadingError;
}

uint64_t OUTLINED_FUNCTION_2_42(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v2 - 136) = a1;
  *(_QWORD *)(v2 - 160) = v1;
  return sub_1B9DE1884();
}

uint64_t OUTLINED_FUNCTION_5_23()
{
  return swift_allocObject();
}

uint64_t OUTLINED_FUNCTION_9_18()
{
  uint64_t *v0;
  uint64_t v1;

  return sub_1B9D4A5CC(v1 - 160, v0);
}

uint64_t OUTLINED_FUNCTION_10_17()
{
  return sub_1B9DE189C();
}

uint64_t OUTLINED_FUNCTION_13_12(uint64_t a1)
{
  uint64_t *v1;

  return sub_1B9D4A5CC(a1, v1);
}

uint64_t OUTLINED_FUNCTION_16_17()
{
  return sub_1B9DE18A8();
}

uint64_t OUTLINED_FUNCTION_17_16()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(v1 - 104) = *(_QWORD *)(v1 - 272);
  *(_QWORD *)(v1 - 128) = v0;
  return swift_retain();
}

uint64_t OUTLINED_FUNCTION_18_15()
{
  return sub_1B9DB0324();
}

uint64_t OUTLINED_FUNCTION_19_8()
{
  return swift_bridgeObjectRetain();
}

unint64_t OUTLINED_FUNCTION_20_8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_1B9DCBC54(a2, a3);
}

uint64_t OUTLINED_FUNCTION_21_11()
{
  return sub_1B9DE18C0();
}

uint64_t OUTLINED_FUNCTION_22_9()
{
  return sub_1B9DE27A8();
}

uint64_t OUTLINED_FUNCTION_24_8()
{
  return swift_bridgeObjectRetain();
}

uint64_t OUTLINED_FUNCTION_25_8()
{
  return sub_1B9DE1884();
}

uint64_t OUTLINED_FUNCTION_28_4()
{
  uint64_t v0;
  uint64_t v1;

  return (*(uint64_t (**)(_QWORD, uint64_t))(*(_QWORD *)(v1 - 328) + 8))(*(_QWORD *)(v1 - 336), v0);
}

uint64_t OUTLINED_FUNCTION_34_6()
{
  return sub_1B9DE27FC();
}

uint64_t OUTLINED_FUNCTION_42_5()
{
  uint64_t v0;

  *(_QWORD *)(v0 - 96) = *(_QWORD *)(v0 - 280);
  *(_QWORD *)(v0 - 120) = *(_QWORD *)(v0 - 216);
  return swift_retain();
}

uint64_t OUTLINED_FUNCTION_43_7(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v2 - 128) = a1;
  *(_QWORD *)(v2 - 152) = v1;
  return sub_1B9DE1884();
}

uint64_t OUTLINED_FUNCTION_44_4()
{
  return swift_bridgeObjectRetain();
}

uint64_t OUTLINED_FUNCTION_46_3@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  *(_QWORD *)(v3 - 136) = a1;
  *(_QWORD *)(v3 - 160) = v1;
  *(_QWORD *)(v3 - 152) = v2;
  return sub_1B9DE1884();
}

uint64_t OUTLINED_FUNCTION_51_1@<X0>(uint64_t a1@<X8>, uint64_t a2, uint64_t a3, _QWORD *a4)
{
  return sub_1B9DBFCEC(0, (unint64_t)(a1 + 63) >> 6, a4);
}

uint64_t OUTLINED_FUNCTION_52_1()
{
  return swift_willThrow();
}

uint64_t OUTLINED_FUNCTION_53_5@<X0>(uint64_t (*a1)(uint64_t, uint64_t, uint64_t)@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  return a1(v3, v1, v2);
}

uint64_t OUTLINED_FUNCTION_54_5@<X0>(uint64_t result@<X0>, uint64_t a2@<X8>)
{
  *(_QWORD *)(a2 + 64) |= 1 << result;
  return result;
}

uint64_t OUTLINED_FUNCTION_55_2@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  *(_QWORD *)(v1 - 256) = a1;
  return sub_1B9DE18B4();
}

uint64_t OUTLINED_FUNCTION_56_3()
{
  return sub_1B9DE189C();
}

uint64_t OUTLINED_FUNCTION_57_3(uint64_t a1, _QWORD *a2)
{
  uint64_t v2;
  uint64_t v3;

  v3 = *(_QWORD *)(v2 - 232);
  *a2 = *(_QWORD *)(v2 - 224);
  a2[1] = v3;
  return swift_bridgeObjectRetain();
}

void OUTLINED_FUNCTION_58_2()
{
  uint64_t v0;

  ++*(_QWORD *)(v0 + 16);
}

unint64_t OUTLINED_FUNCTION_59_5()
{
  uint64_t v0;
  uint64_t v1;

  return sub_1B9DCBC54(v1, v0);
}

uint64_t OUTLINED_FUNCTION_61_5()
{
  return swift_allocObject();
}

uint64_t OUTLINED_FUNCTION_63_4()
{
  return swift_bridgeObjectRetain();
}

void OUTLINED_FUNCTION_64_2(char a1@<W8>, uint64_t a2, uint64_t a3, _QWORD *a4)
{
  *a4 = -1 << a1;
}

uint64_t OUTLINED_FUNCTION_65_4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t (*v9)(uint64_t *);

  return v9(&a9);
}

uint64_t OUTLINED_FUNCTION_66_5()
{
  uint64_t *v0;
  uint64_t v1;

  return sub_1B9D4A5CC(v1 - 160, v0);
}

uint64_t OUTLINED_FUNCTION_67_3(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  return __swift_storeEnumTagSinglePayload(a1, a2, 1, v2);
}

uint64_t OUTLINED_FUNCTION_69_3()
{
  return sub_1B9DE189C();
}

uint64_t OUTLINED_FUNCTION_70_5(uint64_t a1, uint64_t *a2)
{
  uint64_t v2;

  return sub_1B9D4A5CC(v2 - 128, a2);
}

uint64_t OUTLINED_FUNCTION_71_3()
{
  return sub_1B9DE18CC();
}

uint64_t PreferredSizing.deinit()
{
  uint64_t v0;

  return v0;
}

uint64_t PreferredSizing.__deallocating_deinit()
{
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for PreferredSizing()
{
  return objc_opt_self();
}

uint64_t sub_1B9DC0CFC@<X0>(uint64_t a1@<X0>, void *a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t result;
  char v6;
  uint64_t v7;
  _OWORD v8[2];
  char v9;
  __int128 v10;
  uint64_t v11;

  sub_1B9DC0DF0(a1, (uint64_t)&v10);
  if (v11 == 2)
  {
    sub_1B9DC0E38((uint64_t)&v10);
    if (a2)
    {
      result = OUTLINED_FUNCTION_0_58();
      *(_QWORD *)a3 = a2;
      *(_BYTE *)(a3 + 32) = 0;
    }
    else
    {
      sub_1B9DC0E78();
      v7 = swift_allocError();
      OUTLINED_FUNCTION_0_58();
      *(_QWORD *)&v8[0] = v7;
      v9 = 0;
      return sub_1B9DC0EB4((uint64_t)v8, a3);
    }
  }
  else
  {

    OUTLINED_FUNCTION_0_58();
    sub_1B9DC0EF0((uint64_t)&v10, v8);
    result = (uint64_t)sub_1B9DC0EF0((uint64_t)v8, &v10);
    if (v11 == 1)
    {
      *(_OWORD *)a3 = 0u;
      *(_OWORD *)(a3 + 16) = 0u;
      v6 = 2;
    }
    else
    {
      result = sub_1B9D8272C((uint64_t)&v10, a3);
      v6 = 1;
    }
    *(_BYTE *)(a3 + 32) = v6;
  }
  return result;
}

uint64_t sub_1B9DC0DF0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED5CC7D0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_1B9DC0E38(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED5CC7D0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_1B9DC0E78()
{
  unint64_t result;

  result = qword_1EF2436E8;
  if (!qword_1EF2436E8)
  {
    result = MEMORY[0x1BCCCEEA8](&unk_1B9DF4E3C, &_s19InitializationErrorON);
    atomic_store(result, (unint64_t *)&qword_1EF2436E8);
  }
  return result;
}

uint64_t sub_1B9DC0EB4(uint64_t a1, uint64_t a2)
{
  __swift_memcpy33_8(a2, a1);
  return a2;
}

_OWORD *sub_1B9DC0EF0(uint64_t a1, _OWORD *a2)
{
  __swift_memcpy32_8(a2, a1);
  return a2;
}

uint64_t _s19InitializationErrorOwst(uint64_t a1, int a2, int a3)
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
    return ((uint64_t (*)(void))((char *)sub_1B9DC0F6C + 4 * asc_1B9DF4DB0[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_1B9DC0F8C + 4 * byte_1B9DF4DB5[v4]))();
}

_BYTE *sub_1B9DC0F6C(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_1B9DC0F8C(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_1B9DC0F94(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_1B9DC0F9C(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_1B9DC0FA4(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_1B9DC0FAC(_DWORD *result)
{
  *result = 0;
  return result;
}

ValueMetadata *_s19InitializationErrorOMa()
{
  return &_s19InitializationErrorON;
}

unint64_t sub_1B9DC0FCC()
{
  unint64_t result;

  result = qword_1EF2436F0;
  if (!qword_1EF2436F0)
  {
    result = MEMORY[0x1BCCCEEA8](&unk_1B9DF4E14, &_s19InitializationErrorON);
    atomic_store(result, (unint64_t *)&qword_1EF2436F0);
  }
  return result;
}

uint64_t OUTLINED_FUNCTION_0_58()
{
  uint64_t v0;

  return sub_1B9DC0E38(v0);
}

void destroy for PreviousResultingActionOutcome(uint64_t a1)
{
  unsigned int v1;

  v1 = *(unsigned __int8 *)(a1 + 32);
  if (v1 >= 2)
    v1 = *(_DWORD *)a1 + 2;
  if (v1 == 1)
  {
    if (*(_QWORD *)(a1 + 24))
      __swift_destroy_boxed_opaque_existential_2(a1);
  }
  else if (!v1)
  {

  }
}

uint64_t initializeWithCopy for PreviousResultingActionOutcome(uint64_t a1, uint64_t *a2)
{
  unsigned int v3;
  uint64_t v4;
  id v5;
  uint64_t v6;
  __int128 v7;
  char v8;
  __int128 v9;

  v3 = *((unsigned __int8 *)a2 + 32);
  if (v3 >= 2)
    v3 = *(_DWORD *)a2 + 2;
  if (v3 == 1)
  {
    v6 = a2[3];
    if (v6)
    {
      *(_QWORD *)(a1 + 24) = v6;
      (**(void (***)(uint64_t))(v6 - 8))(a1);
    }
    else
    {
      v9 = *((_OWORD *)a2 + 1);
      *(_OWORD *)a1 = *(_OWORD *)a2;
      *(_OWORD *)(a1 + 16) = v9;
    }
    v8 = 1;
    goto LABEL_11;
  }
  if (v3)
  {
    v7 = *((_OWORD *)a2 + 1);
    *(_OWORD *)a1 = *(_OWORD *)a2;
    *(_OWORD *)(a1 + 16) = v7;
    v8 = *((_BYTE *)a2 + 32);
LABEL_11:
    *(_BYTE *)(a1 + 32) = v8;
    return a1;
  }
  v4 = *a2;
  v5 = (id)*a2;
  *(_QWORD *)a1 = v4;
  *(_BYTE *)(a1 + 32) = 0;
  return a1;
}

uint64_t assignWithCopy for PreviousResultingActionOutcome(uint64_t a1, __int128 *a2)
{
  unsigned int v4;
  unsigned int v5;
  void *v6;
  id v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;

  if ((__int128 *)a1 != a2)
  {
    v4 = *(unsigned __int8 *)(a1 + 32);
    if (v4 >= 2)
      v4 = *(_DWORD *)a1 + 2;
    if (v4 == 1)
    {
      if (*(_QWORD *)(a1 + 24))
        __swift_destroy_boxed_opaque_existential_2(a1);
    }
    else if (!v4)
    {

    }
    v5 = *((unsigned __int8 *)a2 + 32);
    if (v5 >= 2)
      v5 = *(_DWORD *)a2 + 2;
    if (v5 == 1)
    {
      v8 = *((_QWORD *)a2 + 3);
      if (v8)
      {
        *(_QWORD *)(a1 + 24) = v8;
        (**(void (***)(uint64_t, __int128 *))(v8 - 8))(a1, a2);
      }
      else
      {
        v11 = a2[1];
        *(_OWORD *)a1 = *a2;
        *(_OWORD *)(a1 + 16) = v11;
      }
      *(_BYTE *)(a1 + 32) = 1;
    }
    else if (v5)
    {
      v9 = *a2;
      v10 = a2[1];
      *(_BYTE *)(a1 + 32) = *((_BYTE *)a2 + 32);
      *(_OWORD *)a1 = v9;
      *(_OWORD *)(a1 + 16) = v10;
    }
    else
    {
      v6 = *(void **)a2;
      v7 = v6;
      *(_QWORD *)a1 = v6;
      *(_BYTE *)(a1 + 32) = 0;
    }
  }
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

uint64_t assignWithTake for PreviousResultingActionOutcome(uint64_t a1, uint64_t a2)
{
  unsigned int v4;
  unsigned int v5;
  __int128 v6;
  __int128 v7;

  if (a1 != a2)
  {
    v4 = *(unsigned __int8 *)(a1 + 32);
    if (v4 >= 2)
      v4 = *(_DWORD *)a1 + 2;
    if (v4 == 1)
    {
      if (*(_QWORD *)(a1 + 24))
        __swift_destroy_boxed_opaque_existential_2(a1);
    }
    else if (!v4)
    {

    }
    v5 = *(unsigned __int8 *)(a2 + 32);
    if (v5 >= 2)
      v5 = *(_DWORD *)a2 + 2;
    if (v5 == 1)
    {
      v6 = *(_OWORD *)(a2 + 16);
      *(_OWORD *)a1 = *(_OWORD *)a2;
      *(_OWORD *)(a1 + 16) = v6;
    }
    else
    {
      if (!v5)
      {
        *(_QWORD *)a1 = *(_QWORD *)a2;
        *(_BYTE *)(a1 + 32) = 0;
        return a1;
      }
      v7 = *(_OWORD *)(a2 + 16);
      *(_OWORD *)a1 = *(_OWORD *)a2;
      *(_OWORD *)(a1 + 16) = v7;
      LOBYTE(v5) = *(_BYTE *)(a2 + 32);
    }
    *(_BYTE *)(a1 + 32) = v5;
  }
  return a1;
}

uint64_t getEnumTagSinglePayload for PreviousResultingActionOutcome(uint64_t a1, unsigned int a2)
{
  unsigned int v3;

  if (!a2)
    return 0;
  if (a2 >= 0xFE && *(_BYTE *)(a1 + 33))
    return (*(_DWORD *)a1 + 254);
  v3 = *(unsigned __int8 *)(a1 + 32);
  if (v3 >= 3)
    return (v3 ^ 0xFF) + 1;
  else
    return 0;
}

uint64_t storeEnumTagSinglePayload for PreviousResultingActionOutcome(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFD)
  {
    *(_BYTE *)(result + 32) = 0;
    *(_OWORD *)result = 0u;
    *(_OWORD *)(result + 16) = 0u;
    *(_DWORD *)result = a2 - 254;
    if (a3 >= 0xFE)
      *(_BYTE *)(result + 33) = 1;
  }
  else
  {
    if (a3 >= 0xFE)
      *(_BYTE *)(result + 33) = 0;
    if (a2)
      *(_BYTE *)(result + 32) = -(char)a2;
  }
  return result;
}

uint64_t sub_1B9DC1318(uint64_t a1)
{
  uint64_t result;

  result = *(unsigned __int8 *)(a1 + 32);
  if (result >= 2)
    return (*(_DWORD *)a1 + 2);
  return result;
}

uint64_t sub_1B9DC1334(uint64_t result, unsigned int a2)
{
  if (a2 > 1)
  {
    *(_OWORD *)result = 0u;
    *(_OWORD *)(result + 16) = 0u;
    *(_DWORD *)result = a2 - 2;
    LOBYTE(a2) = 2;
  }
  *(_BYTE *)(result + 32) = a2;
  return result;
}

ValueMetadata *type metadata accessor for PreviousResultingActionOutcome()
{
  return &type metadata for PreviousResultingActionOutcome;
}

void sub_1B9DC1368(void *a1, uint64_t a2, NSObject *a3)
{
  void *v6;
  id v7;

  swift_beginAccess();
  v6 = *(void **)(a2 + 16);
  *(_QWORD *)(a2 + 16) = a1;

  v7 = a1;
  dispatch_group_leave(a3);
}

BOOL static NSOperationQueuePriority.< infix(_:_:)(uint64_t a1, uint64_t a2)
{
  return a1 < a2;
}

uint64_t sub_1B9DC13D8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (a3 == a1 && a4 == a2)
    return 0;
  OUTLINED_FUNCTION_0_59(a1, a2, a3);
  return sub_1B9DE28A4();
}

BOOL sub_1B9DC13FC(uint64_t a1, uint64_t a2)
{
  return a2 < a1;
}

uint64_t sub_1B9DC1408(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  char v5;

  if (a3 == a1 && a4 == a2)
  {
    v5 = 1;
  }
  else
  {
    OUTLINED_FUNCTION_0_59(a1, a2, a3);
    v5 = sub_1B9DE28A4() ^ 1;
  }
  return v5 & 1;
}

BOOL sub_1B9DC143C(uint64_t a1, uint64_t a2)
{
  return a2 >= a1;
}

uint64_t sub_1B9DC1448(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  char v5;

  if (a1 == a3 && a2 == a4)
    v5 = 1;
  else
    v5 = sub_1B9DE28A4() ^ 1;
  return v5 & 1;
}

BOOL sub_1B9DC147C(uint64_t a1, uint64_t a2)
{
  return a1 >= a2;
}

unint64_t sub_1B9DC148C()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1ED5CD7A0;
  if (!qword_1ED5CD7A0)
  {
    type metadata accessor for QueuePriority(255);
    result = MEMORY[0x1BCCCEEA8](&unk_1B9DEEE1C, v1);
    atomic_store(result, (unint64_t *)&qword_1ED5CD7A0);
  }
  return result;
}

BOOL sub_1B9DC14CC(uint64_t *a1, uint64_t *a2)
{
  return static NSOperationQueuePriority.< infix(_:_:)(*a1, *a2);
}

BOOL sub_1B9DC14D8(uint64_t *a1, uint64_t *a2)
{
  return sub_1B9DC143C(*a1, *a2);
}

BOOL sub_1B9DC14E4(uint64_t *a1, uint64_t *a2)
{
  return sub_1B9DC147C(*a1, *a2);
}

BOOL sub_1B9DC14F0(uint64_t *a1, uint64_t *a2)
{
  return sub_1B9DC13FC(*a1, *a2);
}

uint64_t OUTLINED_FUNCTION_0_59(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return a3;
}

uint64_t sub_1B9DC151C@<X0>(unsigned __int8 a1@<W0>, uint64_t a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  char *v9;
  id v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  id v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED5CE100);
  v5 = MEMORY[0x1E0C80A78](v4);
  v7 = (char *)&v21 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v5);
  v9 = (char *)&v21 - v8;
  if (a1 - 2 >= 2)
  {
    if (!a1)
    {
      v14 = OUTLINED_FUNCTION_2_4();
      return __swift_storeEnumTagSinglePayload(a2, 1, 1, v14);
    }
    v16 = objc_msgSend((id)objc_opt_self(), sel_settingsURL);
    if (v16)
    {
      v17 = v16;
      sub_1B9DE1518();

      v18 = OUTLINED_FUNCTION_2_4();
      v19 = 0;
    }
    else
    {
      v18 = sub_1B9DE1554();
      v19 = 1;
    }
    __swift_storeEnumTagSinglePayload((uint64_t)v9, v19, 1, v18);
    v20 = (uint64_t)v9;
  }
  else
  {
    v10 = objc_msgSend((id)objc_opt_self(), sel_settingsURL);
    if (v10)
    {
      v11 = v10;
      sub_1B9DE1518();

      v12 = OUTLINED_FUNCTION_2_4();
      v13 = 0;
    }
    else
    {
      v12 = sub_1B9DE1554();
      v13 = 1;
    }
    __swift_storeEnumTagSinglePayload((uint64_t)v7, v13, 1, v12);
    v20 = (uint64_t)v7;
  }
  return sub_1B9DAC134(v20, a2);
}

uint64_t sub_1B9DC16A4(uint64_t a1, unsigned __int8 a2)
{
  return ((uint64_t (*)(void))((char *)sub_1B9DC16C4 + 4 * byte_1B9DF4F00[a2]))();
}

uint64_t sub_1B9DC16C4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_1B9DC1754(0xD000000000000012, 0x80000001B9DEA3A0, a3);
}

uint64_t sub_1B9DC16E4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_1B9DC1754(0xD00000000000001ALL, 0x80000001B9DEA360, a3);
}

uint64_t sub_1B9DC1708(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_1B9DC1754(0xD000000000000017, 0x80000001B9DEA340, a3);
}

uint64_t sub_1B9DC1730(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_1B9DC1754(0xD000000000000013, 0x80000001B9DEA380, a3);
}

uint64_t sub_1B9DC1754(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unsigned int v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v8;

  v4 = objc_msgSend((id)objc_opt_self(), sel_wapiCapability);
  type metadata accessor for Localizations();
  if (v4)
    v5 = 1312902231;
  else
    v5 = 1229343063;
  v8 = v5 & 0xFFFF0000FFFFFFFFLL | 0x5F00000000;
  sub_1B9DE21E4();
  v6 = sub_1B9DAFB4C(v8, 0xE500000000000000, a3);
  swift_bridgeObjectRelease();
  return v6;
}

void ResultingActionDispatcher.__allocating_init()()
{
  OUTLINED_FUNCTION_7_7();
  ResultingActionDispatcher.init()();
  OUTLINED_FUNCTION_1();
}

uint64_t sub_1B9DC1844()
{
  return sub_1B9DE1FBC();
}

unint64_t ResultingActionDispatcher.PerformError.errorDescription.getter(char a1)
{
  if ((a1 & 1) != 0)
    return 0xD000000000000049;
  else
    return 0xD000000000000057;
}

BOOL static ResultingActionDispatcher.PerformError.__derived_enum_equals(_:_:)(int a1, int a2)
{
  return ((a2 ^ a1) & 1) == 0;
}

uint64_t ResultingActionDispatcher.PerformError.hash(into:)()
{
  return sub_1B9DE2958();
}

uint64_t ResultingActionDispatcher.PerformError.hashValue.getter()
{
  sub_1B9DE294C();
  sub_1B9DE2958();
  return sub_1B9DE297C();
}

BOOL sub_1B9DC1918(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return static ResultingActionDispatcher.PerformError.__derived_enum_equals(_:_:)(*a1, *a2);
}

uint64_t sub_1B9DC1924()
{
  return ResultingActionDispatcher.PerformError.hashValue.getter();
}

uint64_t sub_1B9DC192C()
{
  return ResultingActionDispatcher.PerformError.hash(into:)();
}

unint64_t sub_1B9DC1934()
{
  char *v0;

  return ResultingActionDispatcher.PerformError.errorDescription.getter(*v0);
}

_QWORD *ResultingActionDispatcher.init()()
{
  _QWORD *v0;
  void (*v1)(uint64_t);

  OUTLINED_FUNCTION_14_15();
  v1 = (void (*)(uint64_t))MEMORY[0x1E0D3FC28];
  type metadata accessor for ResultingActionImplementationBox();
  sub_1B9D5E6B0(&qword_1ED5CD668, v1);
  v0[3] = 0;
  v0[2] = 0;
  v0[4] = sub_1B9DE20B8();
  OUTLINED_FUNCTION_6_5();
  v0[2] = 0;
  swift_release();
  return v0;
}

uint64_t ResultingActionDispatcher.next.getter()
{
  OUTLINED_FUNCTION_6_5();
  return swift_retain();
}

void ResultingActionDispatcher.next.setter(uint64_t a1)
{
  uint64_t v1;

  OUTLINED_FUNCTION_6_5();
  *(_QWORD *)(v1 + 16) = a1;
  swift_release();
  OUTLINED_FUNCTION_13_4();
}

uint64_t (*ResultingActionDispatcher.next.modify())()
{
  OUTLINED_FUNCTION_6_5();
  return j_j__swift_endAccess;
}

void *ResultingActionDispatcher.targetQueue.getter()
{
  uint64_t v0;
  void *v1;
  id v2;

  OUTLINED_FUNCTION_6_5();
  v1 = *(void **)(v0 + 24);
  v2 = v1;
  return v1;
}

void ResultingActionDispatcher.targetQueue.setter(uint64_t a1)
{
  uint64_t v1;
  void *v3;

  OUTLINED_FUNCTION_6_5();
  v3 = *(void **)(v1 + 24);
  *(_QWORD *)(v1 + 24) = a1;

  OUTLINED_FUNCTION_13_4();
}

uint64_t (*ResultingActionDispatcher.targetQueue.modify())()
{
  OUTLINED_FUNCTION_6_5();
  return j__swift_endAccess;
}

uint64_t ResultingActionDispatcher.add<A>(_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  v7 = *(_QWORD *)(a2 - 8);
  MEMORY[0x1E0C80A78](a1);
  OUTLINED_FUNCTION_0_13();
  v10 = v9 - v8;
  v11 = OUTLINED_FUNCTION_14_15();
  v12 = *(_QWORD *)(v11 - 8);
  MEMORY[0x1E0C80A78](v11);
  OUTLINED_FUNCTION_22_8();
  swift_getAssociatedTypeWitness();
  sub_1B9DE1AAC();
  type metadata accessor for ConcreteResultingActionImplementationBox(0, a2, a3, v13);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v7 + 16))(v10, a1, a2);
  v14 = ConcreteResultingActionImplementationBox.__allocating_init(_:)(v10);
  OUTLINED_FUNCTION_6_5();
  sub_1B9DC37DC(v14, v3);
  swift_endAccess();
  return (*(uint64_t (**)(uint64_t, uint64_t))(v12 + 8))(v3, v11);
}

void sub_1B9DC1C60()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v1 = OUTLINED_FUNCTION_14_15();
  v2 = *(_QWORD *)(v1 - 8);
  MEMORY[0x1E0C80A78](v1);
  OUTLINED_FUNCTION_0_6();
  sub_1B9DE1AAC();
  OUTLINED_FUNCTION_6_5();
  v3 = OUTLINED_FUNCTION_20_3();
  sub_1B9DC37DC(v3, v0);
  swift_endAccess();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0, v1);
  OUTLINED_FUNCTION_31();
}

Swift::Void __swiftcall ResultingActionDispatcher.removeAllImplementations()()
{
  OUTLINED_FUNCTION_6_5();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EF2436F8);
  sub_1B9DE20C4();
  swift_endAccess();
  OUTLINED_FUNCTION_13_4();
}

void ResultingActionDispatcher.removeImplementation(forType:)()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v1 = OUTLINED_FUNCTION_14_15();
  v2 = *(_QWORD *)(v1 - 8);
  MEMORY[0x1E0C80A78](v1);
  OUTLINED_FUNCTION_22_8();
  swift_getMetatypeMetadata();
  sub_1B9DE1A94();
  OUTLINED_FUNCTION_6_5();
  sub_1B9DC330C();
  swift_endAccess();
  OUTLINED_FUNCTION_32_0();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0, v1);
  OUTLINED_FUNCTION_31();
}

void ResultingActionDispatcher.perform(_:withMetrics:asPartOf:previousActionOutcome:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
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
  unint64_t v19;
  unint64_t v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
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
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  __int128 aBlock;
  uint64_t (*v45)(uint64_t);
  void *v46;
  uint64_t (*v47)();
  uint64_t v48;
  _BYTE v49[40];
  __int128 v50[3];

  v43 = a3;
  v34 = a2;
  v35 = a1;
  v36 = sub_1B9DE16C8();
  v39 = *(_QWORD *)(v36 - 8);
  OUTLINED_FUNCTION_23_0();
  MEMORY[0x1E0C80A78](v8);
  OUTLINED_FUNCTION_17_5();
  v33 = v9;
  OUTLINED_FUNCTION_109_0();
  v38 = sub_1B9DE16F8();
  v37 = *(_QWORD *)(v38 - 8);
  OUTLINED_FUNCTION_23_0();
  MEMORY[0x1E0C80A78](v10);
  OUTLINED_FUNCTION_7_15();
  v11 = OUTLINED_FUNCTION_13_13();
  v12 = *(_QWORD *)(v11 - 8);
  v13 = *(_QWORD *)(v12 + 64);
  MEMORY[0x1E0C80A78](v11);
  v14 = (char *)&v29 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED5CFA98);
  v41 = sub_1B9DE1FEC();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED5CD6F0);
  v15 = sub_1B9DE1FEC();
  v40 = sub_1B9D4C918();
  v30 = sub_1B9DE24D8();
  sub_1B9D47998(a1, (uint64_t)v50);
  sub_1B9DC39C0(a2, (uint64_t)v14);
  sub_1B9D5ECE4(a4, (uint64_t)v49, &qword_1ED5CD3D0);
  v16 = *(unsigned __int8 *)(v12 + 80);
  v17 = (v16 + 64) & ~v16;
  v18 = v17;
  v32 = v17;
  v31 = v16 | 7;
  v19 = (v17 + v13 + 7) & 0xFFFFFFFFFFFFFFF8;
  v20 = (v17 + v13 + 47) & 0xFFFFFFFFFFFFFFF8;
  v21 = swift_allocObject();
  *(_QWORD *)(v21 + 16) = v42;
  sub_1B9D440BC(v50, v21 + 24);
  sub_1B9DC3AB8((uint64_t)v14, v21 + v18);
  sub_1B9D5EA44((uint64_t)v49, v21 + v19, &qword_1ED5CD3D0);
  *(_QWORD *)(v21 + v20) = v43;
  *(_QWORD *)(v21 + ((v20 + 15) & 0xFFFFFFFFFFFFFFF8)) = v15;
  v47 = sub_1B9DC3AFC;
  v48 = v21;
  *(_QWORD *)&aBlock = MEMORY[0x1E0C809B0];
  *((_QWORD *)&aBlock + 1) = 1107296256;
  v45 = sub_1B9D49458;
  v46 = &block_descriptor_15;
  v22 = _Block_copy(&aBlock);
  swift_retain();
  OUTLINED_FUNCTION_20_3();
  swift_retain();
  swift_release();
  sub_1B9DE16E0();
  *(_QWORD *)&aBlock = MEMORY[0x1E0DEE9D8];
  sub_1B9D5E6B0(&qword_1ED5CF9C0, (void (*)(uint64_t))MEMORY[0x1E0DEF4F8]);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED5CFAD0);
  sub_1B9D5E654(&qword_1ED5CFAE0, (uint64_t *)&unk_1ED5CFAD0);
  v23 = v33;
  v24 = v36;
  sub_1B9DE261C();
  v25 = (void *)v30;
  MEMORY[0x1BCCCE2A8](0, v4, v23, v22);
  _Block_release(v22);

  (*(void (**)(uint64_t, uint64_t))(v39 + 8))(v23, v24);
  (*(void (**)(uint64_t, uint64_t))(v37 + 8))(v4, v38);
  v26 = OUTLINED_FUNCTION_7_7();
  swift_weakInit();
  sub_1B9D47998(v35, (uint64_t)&aBlock);
  sub_1B9DC39C0(v34, (uint64_t)v14);
  v27 = swift_allocObject();
  *(_QWORD *)(v27 + 16) = v26;
  sub_1B9D440BC(&aBlock, v27 + 24);
  sub_1B9DC3AB8((uint64_t)v14, v27 + v32);
  *(_QWORD *)(v27 + v19) = v43;
  *(_QWORD *)(v27 + ((v19 + 15) & 0xFFFFFFFFFFFFFFF8)) = v41;
  swift_retain();
  swift_retain();
  v28 = (void *)sub_1B9DE24D8();
  sub_1B9DC3C64(v28, (uint64_t)sub_1B9DC3C04, v27);

  swift_release();
  swift_release();
  OUTLINED_FUNCTION_2_5();
}

uint64_t sub_1B9DC21F8(uint64_t a1, _QWORD *a2, uint64_t a3, uint64_t a4, void (*a5)(uint64_t, uint64_t))
{
  uint64_t v5;
  uint64_t v6;
  void *v7;

  sub_1B9DC25F4(a2, a3, a4, a5);
  v6 = v5;
  sub_1B9D4C918();
  v7 = (void *)sub_1B9DE24D8();
  sub_1B9DC4548(v6, v7);

  return swift_release();
}

void sub_1B9DC2274(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  void *v11;
  _BYTE *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  uint64_t v17;
  void *v18;
  __int128 v19;
  __int128 v20;
  uint64_t v21;
  __int128 v22;
  uint64_t v23;
  _QWORD v24[3];
  uint64_t v25;
  uint64_t v26;
  __int128 v27;
  __int128 v28;
  uint64_t v29;

  swift_beginAccess();
  if (!swift_weakLoadStrong())
    return;
  sub_1B9D5ECE4(a1, (uint64_t)&v27, &qword_1ED5CC7D0);
  if (*((_QWORD *)&v28 + 1) == 1)
  {
    sub_1B9DA97D8((uint64_t)&v27);
    sub_1B9DC3DA0();
    v11 = (void *)swift_allocError();
    *v12 = 1;
  }
  else
  {
    if (*((_QWORD *)&v28 + 1) == 2)
      sub_1B9D6B278((uint64_t)&v27, &qword_1ED5CC7D0);
    else
      sub_1B9DA97D8((uint64_t)&v27);
    v13 = a2;
    v11 = a2;
  }
  v29 = 0;
  v27 = 0u;
  v28 = 0u;
  sub_1B9D47998(a4, (uint64_t)&v22);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED5CD620);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED5CC7C0);
  if ((swift_dynamicCast() & 1) == 0)
  {
    v21 = 0;
    v19 = 0u;
    v20 = 0u;
    sub_1B9D6B278((uint64_t)&v19, &qword_1ED5CC7C8);
    sub_1B9D47998(a4, (uint64_t)&v22);
    __swift_instantiateConcreteTypeFromMangledName(&qword_1ED5CC7B8);
    if ((swift_dynamicCast() & 1) == 0)
    {
      v21 = 0;
      v19 = 0u;
      v20 = 0u;
      sub_1B9D6B278((uint64_t)&v19, qword_1EF243730);
      goto LABEL_16;
    }
    sub_1B9D440BC(&v19, (uint64_t)v24);
    v14 = v25;
    v15 = v26;
    __swift_project_boxed_opaque_existential_2(v24, v25);
    goto LABEL_13;
  }
  sub_1B9D440BC(&v19, (uint64_t)v24);
  v14 = v25;
  v15 = v26;
  __swift_project_boxed_opaque_existential_2(v24, v25);
  if (v11)
  {
LABEL_13:
    (*(void (**)(__int128 *__return_ptr, uint64_t, uint64_t))(v15 + 16))(&v22, v14, v15);
    goto LABEL_14;
  }
  (*(void (**)(__int128 *__return_ptr, uint64_t, uint64_t))(v15 + 24))(&v22, v14, v15);
LABEL_14:
  sub_1B9D6B278((uint64_t)&v27, &qword_1ED5CD630);
  sub_1B9D5EA44((uint64_t)&v22, (uint64_t)&v27, &qword_1ED5CD630);
  __swift_destroy_boxed_opaque_existential_2((uint64_t)v24);
LABEL_16:
  sub_1B9D5ECE4((uint64_t)&v27, (uint64_t)&v22, &qword_1ED5CD630);
  if (v23)
  {
    sub_1B9D440BC(&v22, (uint64_t)v24);
    sub_1B9D5ECE4(a1, (uint64_t)&v19, &qword_1ED5CC7D0);
    v16 = a2;
    sub_1B9DC0CFC((uint64_t)&v19, a2, (uint64_t)&v22);
    sub_1B9DC450C((uint64_t *)&v22, (uint64_t)&v19);
    v17 = ResultingActionDispatcher.perform(_:withMetrics:asPartOf:previousActionOutcome:)(v24, a5, a6, &v19);
    sub_1B9D6B278((uint64_t)&v19, &qword_1ED5CD3D0);
    sub_1B9D4C918();
    v18 = (void *)sub_1B9DE24D8();
    sub_1B9DC4548(v17, v18);
    swift_release();
    swift_release();

    sub_1B9DC45E4((uint64_t)&v22);
    __swift_destroy_boxed_opaque_existential_2((uint64_t)v24);
  }
  else
  {
    sub_1B9D6B278((uint64_t)&v22, &qword_1ED5CD630);
    sub_1B9DE1FBC();
    swift_release();

  }
  sub_1B9D6B278((uint64_t)&v27, &qword_1ED5CD630);
}

void sub_1B9DC25F4(_QWORD *a1, uint64_t a2, uint64_t a3, void (*a4)(uint64_t, uint64_t))
{
  _QWORD *v4;
  uint64_t v5;
  _QWORD *v6;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  id v14;
  char v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void (*v21)(_QWORD *, uint64_t, void (*)(uint64_t, uint64_t));
  uint64_t v22;
  uint64_t v24;
  _BYTE v25[40];
  __int128 v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;

  v24 = OUTLINED_FUNCTION_14_15();
  v10 = *(_QWORD *)(v24 - 8);
  MEMORY[0x1E0C80A78](v24);
  OUTLINED_FUNCTION_22_8();
  v11 = sub_1B9DE174C();
  v12 = *(_QWORD *)(v11 - 8);
  MEMORY[0x1E0C80A78](v11);
  OUTLINED_FUNCTION_7_15();
  OUTLINED_FUNCTION_6_5();
  v13 = (void *)v4[3];
  if (!v13
    || (*v6 = v13,
        (*(void (**)(_QWORD *, _QWORD, uint64_t))(v12 + 104))(v6, *MEMORY[0x1E0DEF740], v11),
        v14 = v13,
        v15 = sub_1B9DE177C(),
        (*(void (**)(_QWORD *, uint64_t))(v12 + 8))(v6, v11),
        (v15 & 1) != 0))
  {
    v16 = a1[3];
    __swift_project_boxed_opaque_existential_2(a1, v16);
    v28 = v16;
    __swift_allocate_boxed_opaque_existential_0Tm((uint64_t *)&v26);
    (*(void (**)(void))(*(_QWORD *)(v16 - 8) + 16))();
    sub_1B9DE1A94();
    OUTLINED_FUNCTION_6_5();
    v17 = v4[4];
    swift_bridgeObjectRetain();
    sub_1B9DC9F4C(v5, v17);
    v19 = v18;
    swift_bridgeObjectRelease();
    if (v19)
    {
      sub_1B9DC2AB0(a1, a2, a4);
      OUTLINED_FUNCTION_6_5();
      v20 = v4[2];
      if (v20)
      {
        v21 = *(void (**)(_QWORD *, uint64_t, void (*)(uint64_t, uint64_t)))(*(_QWORD *)v19 + 80);
        OUTLINED_FUNCTION_20_3();
        v21(a1, a3, a4);
        sub_1B9D47998((uint64_t)a1, (uint64_t)&v26);
        sub_1B9D5ECE4(a3, (uint64_t)v25, &qword_1ED5CD3D0);
        v22 = OUTLINED_FUNCTION_7_7();
        *(_QWORD *)(v22 + 16) = v20;
        sub_1B9D440BC(&v26, v22 + 24);
        sub_1B9D5EA44((uint64_t)v25, v22 + 64, &qword_1ED5CD3D0);
        *(_QWORD *)(v22 + 104) = a4;
        v28 = sub_1B9DE1B78();
        v29 = MEMORY[0x1E0D40248];
        __swift_allocate_boxed_opaque_existential_0Tm((uint64_t *)&v26);
        OUTLINED_FUNCTION_20_3();
        swift_retain();
        sub_1B9DE1B6C();
        __swift_instantiateConcreteTypeFromMangledName(&qword_1ED5CD6F0);
        sub_1B9D5E654(&qword_1EF243720, &qword_1ED5CD6F0);
        sub_1B9DE1FB0();
        swift_release();
        swift_release();
        swift_release();
        swift_release();
        __swift_destroy_boxed_opaque_existential_2((uint64_t)&v26);
        goto LABEL_8;
      }
      (*(void (**)(_QWORD *, uint64_t, void (*)(uint64_t, uint64_t)))(*(_QWORD *)v19 + 80))(a1, a3, a4);
    }
    else
    {
      OUTLINED_FUNCTION_6_5();
      if (!v4[2])
      {
        __swift_instantiateConcreteTypeFromMangledName(&qword_1ED5CD6F0);
        v26 = 0uLL;
        v27 = 0;
        v28 = 1;
        sub_1B9DE1F8C();
        goto LABEL_8;
      }
      swift_retain();
      sub_1B9DC25F4(a1, a2, a3, a4);
    }
    swift_release();
LABEL_8:
    (*(void (**)(uint64_t, uint64_t))(v10 + 8))(v5, v24);
    OUTLINED_FUNCTION_2_5();
    return;
  }
  __break(1u);
}

uint64_t sub_1B9DC2988(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v9;
  uint64_t v10;
  _BYTE *v11;
  uint64_t v12;
  uint64_t v13;
  _BYTE v15[32];
  _BYTE v16[32];
  _BYTE v17[24];
  uint64_t v18;

  v9 = type metadata accessor for ResultingActionDispatcher.MetricsBehavior();
  MEMORY[0x1E0C80A78](v9);
  v11 = &v15[-((v10 + 15) & 0xFFFFFFFFFFFFFFF0)];
  sub_1B9DA9ABC(a1, (uint64_t)v17);
  if (v18 == 1)
  {
    v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED5CD6A8);
    __swift_storeEnumTagSinglePayload((uint64_t)v11, 1, 1, v12);
    v13 = sub_1B9DC25F4(a3, v11, a4, a5);
    sub_1B9D7FBB0((uint64_t)v11);
  }
  else
  {
    sub_1B9D5EA44((uint64_t)v17, (uint64_t)v16, (uint64_t *)&unk_1ED5CFC00);
    __swift_instantiateConcreteTypeFromMangledName(&qword_1ED5CD6F0);
    sub_1B9D5ECE4((uint64_t)v16, (uint64_t)v15, (uint64_t *)&unk_1ED5CFC00);
    v13 = sub_1B9DE1F8C();
    sub_1B9D6B278((uint64_t)v16, (uint64_t *)&unk_1ED5CFC00);
  }
  return v13;
}

uint64_t sub_1B9DC2AB0(_QWORD *a1, uint64_t a2, void (*a3)(uint64_t, uint64_t))
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
  _QWORD *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  char *v31;
  uint64_t v32;
  char *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t result;
  _BYTE *v40;
  void (*v41)(uint64_t, uint64_t, uint64_t);
  uint64_t v42;
  void (*v43)(char *, char *, _QWORD *);
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  char v48;
  void (*v49)(uint64_t, uint64_t);
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  unint64_t v59;
  unint64_t v60;
  uint64_t v61;
  void (*v62)(uint64_t, unint64_t, uint64_t);
  uint64_t v63;
  uint64_t v64;
  _QWORD *v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  void (*v69)(char *, _QWORD *);
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
  _QWORD *v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  void (*v90)(uint64_t, uint64_t);
  char *v91;
  uint64_t v92;

  v90 = a3;
  v91 = (char *)a2;
  v83 = a1;
  v4 = sub_1B9DE198C();
  v74 = *(_QWORD *)(v4 - 8);
  OUTLINED_FUNCTION_23_0();
  MEMORY[0x1E0C80A78](v5);
  OUTLINED_FUNCTION_0_6();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED5CD638);
  OUTLINED_FUNCTION_23_0();
  MEMORY[0x1E0C80A78](v6);
  OUTLINED_FUNCTION_17_5();
  v73 = v7;
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED5CD6C0);
  v84 = *(_QWORD *)(v8 - 8);
  v85 = v8;
  OUTLINED_FUNCTION_23_0();
  MEMORY[0x1E0C80A78](v9);
  OUTLINED_FUNCTION_17_5();
  v86 = v10;
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED5CD6B0);
  v81 = *(_QWORD *)(v11 - 8);
  v82 = v11;
  OUTLINED_FUNCTION_23_0();
  MEMORY[0x1E0C80A78](v12);
  OUTLINED_FUNCTION_17_5();
  v80 = v13;
  OUTLINED_FUNCTION_109_0();
  v14 = sub_1B9DE1B48();
  v78 = *(_QWORD *)(v14 - 8);
  v79 = v14;
  OUTLINED_FUNCTION_23_0();
  MEMORY[0x1E0C80A78](v15);
  OUTLINED_FUNCTION_17_5();
  v77 = v16;
  OUTLINED_FUNCTION_109_0();
  v17 = sub_1B9DE1A34();
  v75 = *(_QWORD *)(v17 - 8);
  v76 = v17;
  OUTLINED_FUNCTION_23_0();
  MEMORY[0x1E0C80A78](v18);
  OUTLINED_FUNCTION_17_5();
  v87 = v19;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED5CD678);
  OUTLINED_FUNCTION_23_0();
  MEMORY[0x1E0C80A78](v20);
  OUTLINED_FUNCTION_0_13();
  v23 = v22 - v21;
  v24 = sub_1B9DE1B3C();
  v89 = *(_QWORD *)(v24 - 8);
  OUTLINED_FUNCTION_23_0();
  MEMORY[0x1E0C80A78](v25);
  OUTLINED_FUNCTION_17_5();
  v88 = v26;
  OUTLINED_FUNCTION_109_0();
  v27 = (_QWORD *)sub_1B9DE1C98();
  v28 = *(v27 - 1);
  v29 = MEMORY[0x1E0C80A78](v27);
  v31 = (char *)&v70 - ((v30 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v29);
  v33 = (char *)&v70 - v32;
  type metadata accessor for ResultingActionDispatcher.MetricsBehavior();
  OUTLINED_FUNCTION_23_0();
  MEMORY[0x1E0C80A78](v34);
  OUTLINED_FUNCTION_0_13();
  v37 = v36 - v35;
  sub_1B9DC39C0((uint64_t)v91, v36 - v35);
  v38 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED5CD6A8);
  result = __swift_getEnumTagSinglePayload(v37, 1, v38);
  if ((_DWORD)result != 1)
  {
    (*(void (**)(char *, uint64_t, _QWORD *))(v28 + 32))(v33, v37, v27);
    sub_1B9DE1ADC();
    if (__swift_getEnumTagSinglePayload(v23, 1, v24) == 1)
    {
      sub_1B9D6B278(v23, &qword_1ED5CD678);
      sub_1B9DC3DA0();
      swift_allocError();
      *v40 = 0;
      swift_willThrow();
      return OUTLINED_FUNCTION_37_5(*(uint64_t (**)(uint64_t, uint64_t))(v28 + 8));
    }
    else
    {
      v41 = *(void (**)(uint64_t, uint64_t, uint64_t))(v89 + 32);
      v72 = v24;
      v41(v88, v23, v24);
      v42 = v83[3];
      v91 = (char *)v83[4];
      __swift_project_boxed_opaque_existential_2(v83, v42);
      sub_1B9DE1908();
      v71 = v28;
      v43 = *(void (**)(char *, char *, _QWORD *))(v28 + 16);
      v91 = v33;
      v83 = v27;
      v43(v31, v33, v27);
      v44 = v77;
      sub_1B9DE1A28();
      v45 = v80;
      sub_1B9DE1C50();
      v46 = v79;
      OUTLINED_FUNCTION_34_7();
      (*(void (**)(uint64_t, uint64_t))(v81 + 8))(v45, v82);
      (*(void (**)(uint64_t, uint64_t))(v78 + 8))(v44, v46);
      v47 = v86;
      sub_1B9DE1C44();
      __swift_instantiateConcreteTypeFromMangledName(&qword_1ED5CD728);
      v48 = sub_1B9DE1C68();
      v49 = *(void (**)(uint64_t, uint64_t))(v84 + 8);
      v50 = v47;
      v51 = v85;
      v49(v50, v85);
      if ((v48 & 1) == 0)
      {
        sub_1B9DE1CBC();
        sub_1B9DE1ADC();
        if (v92)
        {
          v90 = v49;
          v52 = v73;
          sub_1B9DE1CB0();
          v53 = sub_1B9DE19B0();
          if (__swift_getEnumTagSinglePayload(v52, 1, v53))
          {
            OUTLINED_FUNCTION_3_0();
            sub_1B9D6B278(v52, &qword_1ED5CD638);
          }
          else
          {
            v54 = v52;
            v55 = sub_1B9DE19A4();
            sub_1B9D6B278(v54, &qword_1ED5CD638);
            if (v55)
            {
              v92 = v55;
              sub_1B9DE1C44();
              OUTLINED_FUNCTION_34_7();
              OUTLINED_FUNCTION_3_0();
              v90(v86, v51);
              swift_bridgeObjectRelease();
            }
            else
            {
              OUTLINED_FUNCTION_3_0();
            }
          }
        }
      }
      v56 = sub_1B9DE1A1C();
      v57 = *(_QWORD *)(v56 + 16);
      if (v57)
      {
        v58 = v74;
        v59 = (*(unsigned __int8 *)(v74 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v74 + 80);
        v90 = (void (*)(uint64_t, uint64_t))v56;
        v60 = v56 + v59;
        v61 = *(_QWORD *)(v74 + 72);
        v62 = *(void (**)(uint64_t, unint64_t, uint64_t))(v74 + 16);
        v63 = v88;
        do
        {
          v62(v3, v60, v4);
          sub_1B9DE1B24();
          swift_release();
          (*(void (**)(uint64_t, uint64_t))(v58 + 8))(v3, v4);
          v60 += v61;
          --v57;
        }
        while (v57);
        swift_bridgeObjectRelease();
        v64 = v75;
        v65 = v83;
        v66 = v72;
        v67 = v71;
        v68 = v63;
      }
      else
      {
        swift_bridgeObjectRelease();
        v64 = v75;
        v65 = v83;
        v66 = v72;
        v67 = v71;
        v68 = v88;
      }
      v69 = *(void (**)(char *, _QWORD *))(v67 + 8);
      v69(v31, v65);
      OUTLINED_FUNCTION_37_5(*(uint64_t (**)(uint64_t, uint64_t))(v64 + 8));
      (*(void (**)(uint64_t, uint64_t))(v89 + 8))(v68, v66);
      return ((uint64_t (*)(char *, _QWORD *))v69)(v91, v65);
    }
  }
  return result;
}

uint64_t ResultingActionDispatcher.deinit()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  swift_bridgeObjectRelease();
  v1 = *(_QWORD *)(v0 + 16);
  *(_QWORD *)(v0 + 16) = 0;
  if (v1)
  {
    do
    {
      if (!swift_isUniquelyReferenced_native())
        break;
      v2 = *(_QWORD *)(v1 + 16);
      OUTLINED_FUNCTION_20_3();
      OUTLINED_FUNCTION_32_0();
      v1 = v2;
    }
    while (v2);
  }
  OUTLINED_FUNCTION_32_0();
  return v0;
}

uint64_t ResultingActionDispatcher.__deallocating_deinit()
{
  ResultingActionDispatcher.deinit();
  return swift_deallocClassInstance();
}

uint64_t ResultingActionDispatcher.debugDescription.getter()
{
  uint64_t v0;
  uint64_t v1;

  OUTLINED_FUNCTION_6_5();
  swift_bridgeObjectRetain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EF243700);
  sub_1B9D5E654(&qword_1EF243708, &qword_1EF243700);
  sub_1B9D4FD60();
  sub_1B9DE2268();
  OUTLINED_FUNCTION_16_0();
  OUTLINED_FUNCTION_6_5();
  if (*(_QWORD *)(v0 + 16))
  {
    type metadata accessor for ResultingActionDispatcher();
    swift_retain();
    sub_1B9DE219C();
  }
  sub_1B9DE2724();
  v1 = sub_1B9DE29B8();
  swift_bridgeObjectRelease();
  sub_1B9DE21E4();
  sub_1B9DE21E4();
  swift_bridgeObjectRelease();
  sub_1B9DE21E4();
  sub_1B9DE21E4();
  OUTLINED_FUNCTION_16_0();
  return v1;
}

uint64_t sub_1B9DC328C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;

  sub_1B9DE1AA0();
  sub_1B9D5E6B0(&qword_1EF243728, (void (*)(uint64_t))MEMORY[0x1E0D3FC28]);
  result = sub_1B9DE2874();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_1B9DC32EC()
{
  return ResultingActionDispatcher.debugDescription.getter();
}

uint64_t sub_1B9DC330C()
{
  uint64_t *v0;
  uint64_t *v1;
  unint64_t v2;
  char v3;
  char v4;
  uint64_t v5;
  uint64_t v6;
  void (*v7)(uint64_t);
  uint64_t v8;
  uint64_t v10;

  v1 = v0;
  swift_bridgeObjectRetain();
  v2 = sub_1B9DCBCAC();
  v4 = v3;
  swift_bridgeObjectRelease();
  if ((v4 & 1) == 0)
    return 0;
  swift_isUniquelyReferenced_nonNull_native();
  v10 = *v1;
  *v1 = 0x8000000000000000;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED5CCA68);
  sub_1B9DE27A8();
  v5 = *(_QWORD *)(v10 + 48);
  v6 = sub_1B9DE1AA0();
  v7 = (void (*)(uint64_t))MEMORY[0x1E0D3FC28];
  (*(void (**)(unint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 8))(v5 + *(_QWORD *)(*(_QWORD *)(v6 - 8) + 72) * v2, v6);
  v8 = *(_QWORD *)(*(_QWORD *)(v10 + 56) + 8 * v2);
  type metadata accessor for ResultingActionImplementationBox();
  sub_1B9D5E6B0(&qword_1ED5CD668, v7);
  sub_1B9DE27C0();
  *v1 = v10;
  swift_bridgeObjectRelease();
  return v8;
}

double sub_1B9DC3448()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _OWORD *v6;
  _OWORD *v7;
  unint64_t v8;
  char v9;
  double result;
  uint64_t v11;

  OUTLINED_FUNCTION_28_5();
  v1 = v0;
  v3 = v2;
  v5 = v4;
  v7 = v6;
  swift_bridgeObjectRetain();
  v8 = sub_1B9DCBC54(v5, v3);
  LOBYTE(v3) = v9;
  OUTLINED_FUNCTION_16_0();
  if ((v3 & 1) != 0)
  {
    OUTLINED_FUNCTION_38_7();
    v11 = *v1;
    *v1 = 0x8000000000000000;
    __swift_instantiateConcreteTypeFromMangledName(&qword_1ED5CCA90);
    OUTLINED_FUNCTION_11_20();
    swift_bridgeObjectRelease();
    sub_1B9D45A54((_OWORD *)(*(_QWORD *)(v11 + 56) + 32 * v8), v7);
    sub_1B9DE27C0();
    *v1 = v11;
    OUTLINED_FUNCTION_2_43();
  }
  else
  {
    result = 0.0;
    *v7 = 0u;
    v7[1] = 0u;
  }
  return result;
}

uint64_t sub_1B9DC3540()
{
  _QWORD *v0;
  char v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v9;

  OUTLINED_FUNCTION_28_5();
  v2 = v0;
  v4 = v3;
  v6 = v5;
  OUTLINED_FUNCTION_39_8();
  sub_1B9DCBC54(v6, v4);
  OUTLINED_FUNCTION_20_9();
  if ((v1 & 1) == 0)
    return 0;
  OUTLINED_FUNCTION_38_7();
  OUTLINED_FUNCTION_16_18();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED5CCAB0);
  OUTLINED_FUNCTION_12_20();
  swift_bridgeObjectRelease();
  v7 = *(_QWORD *)(*(_QWORD *)(v9 + 56) + 16 * v6);
  sub_1B9DE27C0();
  *v2 = v9;
  swift_bridgeObjectRelease();
  return v7;
}

uint64_t sub_1B9DC360C()
{
  _QWORD *v0;
  _QWORD *v1;
  uint64_t v2;
  unint64_t v3;
  char v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v8;

  OUTLINED_FUNCTION_28_5();
  v1 = v0;
  v3 = sub_1B9DCBD60(v2);
  if ((v4 & 1) == 0)
    return 0;
  v5 = v3;
  swift_isUniquelyReferenced_nonNull_native();
  v8 = *v0;
  *v0 = 0x8000000000000000;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED5CCAA0);
  OUTLINED_FUNCTION_11_20();
  v6 = *(_QWORD *)(*(_QWORD *)(v8 + 56) + 8 * v5);
  type metadata accessor for QueuePriority(0);
  sub_1B9D5E6B0(&qword_1ED5CCA40, type metadata accessor for QueuePriority);
  sub_1B9DE27C0();
  *v1 = v8;
  swift_bridgeObjectRelease();
  return v6;
}

uint64_t sub_1B9DC36F0()
{
  _QWORD *v0;
  uint64_t v1;
  char v2;
  _QWORD *v3;
  double *v4;
  double *v5;
  uint64_t v6;
  uint64_t v8;

  OUTLINED_FUNCTION_28_5();
  v3 = v0;
  v5 = v4;
  OUTLINED_FUNCTION_39_8();
  sub_1B9DCBD14(v5);
  OUTLINED_FUNCTION_20_9();
  if ((v2 & 1) == 0)
    return 0;
  OUTLINED_FUNCTION_38_7();
  OUTLINED_FUNCTION_16_18();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED5CCA60);
  OUTLINED_FUNCTION_12_20();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_16_0();
  v6 = *(_QWORD *)(*(_QWORD *)(v8 + 56) + 8 * v1);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED5CC7B0);
  sub_1B9D5A5F8();
  sub_1B9DE27C0();
  *v3 = v8;
  swift_bridgeObjectRelease();
  return v6;
}

uint64_t sub_1B9DC37D0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  return sub_1B9DC3930(a1, a2, a3, (uint64_t)sub_1B9DBF348, a5, a6, a7, a8, a9, a10);
}

uint64_t sub_1B9DC37DC(uint64_t a1, uint64_t a2)
{
  uint64_t *v2;
  uint64_t v6;

  swift_isUniquelyReferenced_nonNull_native();
  v6 = *v2;
  *v2 = 0x8000000000000000;
  sub_1B9DBF418(a1, a2);
  *v2 = v6;
  return swift_bridgeObjectRelease();
}

uint64_t sub_1B9DC3848(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  return sub_1B9DC3930(a1, a2, a3, (uint64_t)sub_1B9DBF53C, a5, a6, a7, a8, a9, a10);
}

uint64_t sub_1B9DC3854(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  return sub_1B9DC3930(a1, a2, a3, (uint64_t)sub_1B9DBF548, a5, a6, a7, a8, a9, a10);
}

uint64_t sub_1B9DC3860(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  return sub_1B9DC3930(a1, a2, a3, (uint64_t)sub_1B9DBF604, a5, a6, a7, a8, a9, a10);
}

uint64_t sub_1B9DC386C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  _QWORD *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  OUTLINED_FUNCTION_28_5();
  v12 = v11;
  v14 = v13;
  v16 = v15;
  OUTLINED_FUNCTION_27_6();
  OUTLINED_FUNCTION_5_24();
  sub_1B9DBF610(v16, v14, v12);
  *v10 = a10;
  return OUTLINED_FUNCTION_2_43();
}

uint64_t sub_1B9DC38C0(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  uint64_t v6;

  OUTLINED_FUNCTION_27_6();
  OUTLINED_FUNCTION_5_24();
  sub_1B9DBF7CC(a1, a2);
  *v2 = v6;
  return swift_bridgeObjectRelease();
}

uint64_t sub_1B9DC3918(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  return sub_1B9DC3930(a1, a2, a3, (uint64_t)sub_1B9DBF9CC, a5, a6, a7, a8, a9, a10);
}

uint64_t sub_1B9DC3924(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  return sub_1B9DC3930(a1, a2, a3, (uint64_t)sub_1B9DBF9D8, a5, a6, a7, a8, a9, a10);
}

uint64_t sub_1B9DC3930(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  _QWORD *v10;
  void (*v11)(uint64_t, uint64_t, uint64_t);
  void (*v12)(uint64_t, uint64_t, uint64_t);
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  OUTLINED_FUNCTION_28_5();
  v12 = v11;
  v14 = v13;
  v16 = v15;
  v18 = v17;
  OUTLINED_FUNCTION_27_6();
  OUTLINED_FUNCTION_5_24();
  v12(v18, v16, v14);
  *v10 = a10;
  return OUTLINED_FUNCTION_2_43();
}

uint64_t type metadata accessor for ResultingActionDispatcher.MetricsBehavior()
{
  uint64_t result;

  result = qword_1ED5CD230;
  if (!qword_1ED5CD230)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_1B9DC39C0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for ResultingActionDispatcher.MetricsBehavior();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_1B9DC3A04()
{
  uint64_t v0;
  uint64_t v1;
  unint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v1 = OUTLINED_FUNCTION_13_13();
  v2 = (((*(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80) + 64) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80))
      + *(_QWORD *)(*(_QWORD *)(v1 - 8) + 64)
      + 7) & 0xFFFFFFFFFFFFFFF8;
  OUTLINED_FUNCTION_26_1();
  OUTLINED_FUNCTION_30_6();
  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED5CD6A8);
  if (!OUTLINED_FUNCTION_19_9(v3))
  {
    v4 = sub_1B9DE1C98();
    OUTLINED_FUNCTION_6_10(v4);
  }
  v5 = v0 + v2;
  if (*(_BYTE *)(v0 + v2 + 32) == 1)
  {
    if (*(_QWORD *)(v5 + 24))
      __swift_destroy_boxed_opaque_existential_2(v5);
  }
  else if (!*(_BYTE *)(v0 + v2 + 32))
  {

  }
  OUTLINED_FUNCTION_7_22();
  swift_release();
  return OUTLINED_FUNCTION_11_12();
}

uint64_t sub_1B9DC3AB8(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for ResultingActionDispatcher.MetricsBehavior();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_1B9DC3AFC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  OUTLINED_FUNCTION_13_13();
  OUTLINED_FUNCTION_22_10();
  return sub_1B9DC21F8(*(_QWORD *)(v0 + 16), (_QWORD *)(v0 + 24), v0 + v2, v0 + ((v2 + v1 + 7) & 0xFFFFFFFFFFFFFFF8), *(void (**)(uint64_t, uint64_t))(v0 + ((v2 + v1 + 47) & 0xFFFFFFFFFFFFFFF8)));
}

uint64_t block_copy_helper_15(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_15()
{
  return swift_release();
}

uint64_t sub_1B9DC3B60()
{
  swift_weakDestroy();
  return swift_deallocObject();
}

uint64_t sub_1B9DC3B84()
{
  uint64_t v0;
  uint64_t v1;

  OUTLINED_FUNCTION_13_13();
  OUTLINED_FUNCTION_26_1();
  OUTLINED_FUNCTION_30_6();
  v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED5CD6A8);
  if (!OUTLINED_FUNCTION_19_9(v0))
  {
    v1 = sub_1B9DE1C98();
    OUTLINED_FUNCTION_6_10(v1);
  }
  OUTLINED_FUNCTION_7_22();
  swift_release();
  return OUTLINED_FUNCTION_11_12();
}

void sub_1B9DC3C04(uint64_t a1, void *a2)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;

  OUTLINED_FUNCTION_13_13();
  OUTLINED_FUNCTION_22_10();
  sub_1B9DC2274(a1, a2, *(_QWORD *)(v2 + 16), v2 + 24, v2 + v6, *(_QWORD *)(v2 + ((v5 + v6 + 7) & 0xFFFFFFFFFFFFFFF8)));
}

uint64_t sub_1B9DC3C64(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  id v8;
  _QWORD v10[5];

  v10[3] = sub_1B9D4C918();
  v10[4] = MEMORY[0x1E0D416D8];
  v10[0] = a1;
  v6 = swift_allocObject();
  *(_QWORD *)(v6 + 16) = a2;
  *(_QWORD *)(v6 + 24) = a3;
  v7 = swift_allocObject();
  *(_QWORD *)(v7 + 16) = a2;
  *(_QWORD *)(v7 + 24) = a3;
  swift_retain_n();
  v8 = a1;
  sub_1B9DE1F74();
  swift_release();
  swift_release();
  return __swift_destroy_boxed_opaque_existential_2((uint64_t)v10);
}

uint64_t type metadata accessor for ResultingActionDispatcher()
{
  return objc_opt_self();
}

unint64_t sub_1B9DC3D60()
{
  unint64_t result;

  result = qword_1EF243710;
  if (!qword_1EF243710)
  {
    result = MEMORY[0x1BCCCEEA8](&protocol conformance descriptor for ResultingActionDispatcher.PerformError, &type metadata for ResultingActionDispatcher.PerformError);
    atomic_store(result, (unint64_t *)&qword_1EF243710);
  }
  return result;
}

unint64_t sub_1B9DC3DA0()
{
  unint64_t result;

  result = qword_1EF243718;
  if (!qword_1EF243718)
  {
    result = MEMORY[0x1BCCCEEA8](&protocol conformance descriptor for ResultingActionDispatcher.PerformError, &type metadata for ResultingActionDispatcher.PerformError);
    atomic_store(result, (unint64_t *)&qword_1EF243718);
  }
  return result;
}

uint64_t *initializeBufferWithCopyOfBuffer for ResultingActionDispatcher.MetricsBehavior(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v5;
  int v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v5 = *(_QWORD *)(a3 - 8);
  v6 = *(_DWORD *)(v5 + 80);
  if ((v6 & 0x20000) != 0)
  {
    v8 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v8 + ((v6 + 16) & ~(unint64_t)v6));
    swift_retain();
  }
  else
  {
    v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED5CD6A8);
    if (__swift_getEnumTagSinglePayload((uint64_t)a2, 1, v7))
    {
      memcpy(a1, a2, *(_QWORD *)(v5 + 64));
    }
    else
    {
      v9 = sub_1B9DE1C98();
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v9 - 8) + 16))(a1, a2, v9);
      __swift_storeEnumTagSinglePayload((uint64_t)a1, 0, 1, v7);
    }
  }
  return a1;
}

uint64_t destroy for ResultingActionDispatcher.MetricsBehavior(uint64_t a1)
{
  uint64_t v2;
  uint64_t result;
  uint64_t v4;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED5CD6A8);
  result = __swift_getEnumTagSinglePayload(a1, 1, v2);
  if (!(_DWORD)result)
  {
    v4 = sub_1B9DE1C98();
    return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(a1, v4);
  }
  return result;
}

void *initializeWithCopy for ResultingActionDispatcher.MetricsBehavior(void *a1, const void *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED5CD6A8);
  if (__swift_getEnumTagSinglePayload((uint64_t)a2, 1, v6))
  {
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64));
  }
  else
  {
    v7 = sub_1B9DE1C98();
    (*(void (**)(void *, const void *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a1, a2, v7);
    __swift_storeEnumTagSinglePayload((uint64_t)a1, 0, 1, v6);
  }
  return a1;
}

void *assignWithCopy for ResultingActionDispatcher.MetricsBehavior(void *a1, const void *a2, uint64_t a3)
{
  uint64_t v6;
  int EnumTagSinglePayload;
  int v8;
  uint64_t v9;
  uint64_t v11;

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED5CD6A8);
  EnumTagSinglePayload = __swift_getEnumTagSinglePayload((uint64_t)a1, 1, v6);
  v8 = __swift_getEnumTagSinglePayload((uint64_t)a2, 1, v6);
  if (!EnumTagSinglePayload)
  {
    if (!v8)
    {
      v11 = sub_1B9DE1C98();
      (*(void (**)(void *, const void *, uint64_t))(*(_QWORD *)(v11 - 8) + 24))(a1, a2, v11);
      return a1;
    }
    sub_1B9D6B278((uint64_t)a1, &qword_1ED5CD6A8);
    goto LABEL_6;
  }
  if (v8)
  {
LABEL_6:
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64));
    return a1;
  }
  v9 = sub_1B9DE1C98();
  (*(void (**)(void *, const void *, uint64_t))(*(_QWORD *)(v9 - 8) + 16))(a1, a2, v9);
  __swift_storeEnumTagSinglePayload((uint64_t)a1, 0, 1, v6);
  return a1;
}

void *initializeWithTake for ResultingActionDispatcher.MetricsBehavior(void *a1, const void *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED5CD6A8);
  if (__swift_getEnumTagSinglePayload((uint64_t)a2, 1, v6))
  {
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64));
  }
  else
  {
    v7 = sub_1B9DE1C98();
    (*(void (**)(void *, const void *, uint64_t))(*(_QWORD *)(v7 - 8) + 32))(a1, a2, v7);
    __swift_storeEnumTagSinglePayload((uint64_t)a1, 0, 1, v6);
  }
  return a1;
}

void *assignWithTake for ResultingActionDispatcher.MetricsBehavior(void *a1, const void *a2, uint64_t a3)
{
  uint64_t v6;
  int EnumTagSinglePayload;
  int v8;
  uint64_t v9;
  uint64_t v11;

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED5CD6A8);
  EnumTagSinglePayload = __swift_getEnumTagSinglePayload((uint64_t)a1, 1, v6);
  v8 = __swift_getEnumTagSinglePayload((uint64_t)a2, 1, v6);
  if (!EnumTagSinglePayload)
  {
    if (!v8)
    {
      v11 = sub_1B9DE1C98();
      (*(void (**)(void *, const void *, uint64_t))(*(_QWORD *)(v11 - 8) + 40))(a1, a2, v11);
      return a1;
    }
    sub_1B9D6B278((uint64_t)a1, &qword_1ED5CD6A8);
    goto LABEL_6;
  }
  if (v8)
  {
LABEL_6:
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64));
    return a1;
  }
  v9 = sub_1B9DE1C98();
  (*(void (**)(void *, const void *, uint64_t))(*(_QWORD *)(v9 - 8) + 32))(a1, a2, v9);
  __swift_storeEnumTagSinglePayload((uint64_t)a1, 0, 1, v6);
  return a1;
}

uint64_t getEnumTagSinglePayload for ResultingActionDispatcher.MetricsBehavior()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_1B9DC423C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  unsigned int EnumTagSinglePayload;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED5CD6A8);
  EnumTagSinglePayload = __swift_getEnumTagSinglePayload(a1, a2, v4);
  if (EnumTagSinglePayload >= 2)
    return EnumTagSinglePayload - 1;
  else
    return 0;
}

uint64_t storeEnumTagSinglePayload for ResultingActionDispatcher.MetricsBehavior()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_1B9DC4290(uint64_t a1, int a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;

  if (a2)
    v5 = (a2 + 1);
  else
    v5 = 0;
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED5CD6A8);
  return __swift_storeEnumTagSinglePayload(a1, v5, a3, v6);
}

uint64_t sub_1B9DC42DC(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED5CD6A8);
  return __swift_getEnumTagSinglePayload(a1, 1, v2);
}

uint64_t sub_1B9DC4310(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED5CD6A8);
  return __swift_storeEnumTagSinglePayload(a1, a2, 1, v4);
}

uint64_t sub_1B9DC434C()
{
  uint64_t result;
  unint64_t v1;

  result = sub_1B9DE1C98();
  if (v1 <= 0x3F)
  {
    swift_initEnumMetadataSinglePayload();
    return 0;
  }
  return result;
}

uint64_t storeEnumTagSinglePayload for ResultingActionDispatcher.PerformError(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_1B9DC43EC + 4 * byte_1B9DF4F35[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_1B9DC4420 + 4 * byte_1B9DF4F30[v4]))();
}

uint64_t sub_1B9DC4420(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_1B9DC4428(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x1B9DC4430);
  return result;
}

uint64_t sub_1B9DC443C(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x1B9DC4444);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_1B9DC4448(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1B9DC4450(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for ResultingActionDispatcher.PerformError()
{
  return &type metadata for ResultingActionDispatcher.PerformError;
}

uint64_t sub_1B9DC446C()
{
  uint64_t v0;
  id *v1;

  OUTLINED_FUNCTION_26_1();
  OUTLINED_FUNCTION_30_6();
  v1 = (id *)(v0 + 64);
  if (*(_BYTE *)(v0 + 96) == 1)
  {
    if (*(_QWORD *)(v0 + 88))
      __swift_destroy_boxed_opaque_existential_2((uint64_t)v1);
  }
  else if (!*(_BYTE *)(v0 + 96))
  {

  }
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_1B9DC44C4(uint64_t a1)
{
  uint64_t v1;

  return sub_1B9DC2988(a1, *(_QWORD *)(v1 + 16), v1 + 24, v1 + 64, *(_QWORD *)(v1 + 104));
}

uint64_t sub_1B9DC44D8()
{
  swift_release();
  return swift_deallocObject();
}

void sub_1B9DC44FC(uint64_t a1)
{
  uint64_t v1;

  sub_1B9DA970C(a1, *(void (**)(_BYTE *, _QWORD))(v1 + 16));
}

void sub_1B9DC4504(uint64_t a1)
{
  uint64_t v1;

  sub_1B9DA9788(a1, *(void (**)(_QWORD *, uint64_t))(v1 + 16));
}

uint64_t sub_1B9DC450C(uint64_t *a1, uint64_t a2)
{
  initializeWithCopy for PreviousResultingActionOutcome(a2, a1);
  return a2;
}

uint64_t sub_1B9DC4548(uint64_t a1, void *a2)
{
  id v3;
  _QWORD v5[5];

  v5[3] = sub_1B9D4C918();
  v5[4] = MEMORY[0x1E0D416D8];
  v5[0] = a2;
  swift_retain_n();
  v3 = a2;
  sub_1B9DE1F74();
  swift_release_n();
  return __swift_destroy_boxed_opaque_existential_2((uint64_t)v5);
}

uint64_t sub_1B9DC45E4(uint64_t a1)
{
  destroy for PreviousResultingActionOutcome(a1);
  return a1;
}

uint64_t sub_1B9DC4618()
{
  return sub_1B9DC1844();
}

uint64_t OUTLINED_FUNCTION_2_43()
{
  return swift_bridgeObjectRelease();
}

void OUTLINED_FUNCTION_5_24()
{
  _QWORD *v0;

  *v0 = 0x8000000000000000;
}

uint64_t OUTLINED_FUNCTION_7_22()
{
  return swift_release();
}

uint64_t OUTLINED_FUNCTION_11_20()
{
  return sub_1B9DE27A8();
}

uint64_t OUTLINED_FUNCTION_12_20()
{
  return sub_1B9DE27A8();
}

uint64_t OUTLINED_FUNCTION_13_13()
{
  return type metadata accessor for ResultingActionDispatcher.MetricsBehavior();
}

uint64_t OUTLINED_FUNCTION_14_15()
{
  return sub_1B9DE1AA0();
}

void OUTLINED_FUNCTION_16_18()
{
  _QWORD *v0;

  *v0 = 0x8000000000000000;
}

uint64_t OUTLINED_FUNCTION_19_9(uint64_t a1)
{
  uint64_t v1;

  return __swift_getEnumTagSinglePayload(v1, 1, a1);
}

uint64_t OUTLINED_FUNCTION_20_9()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_27_6()
{
  return swift_isUniquelyReferenced_nonNull_native();
}

uint64_t OUTLINED_FUNCTION_30_6()
{
  uint64_t v0;

  return __swift_destroy_boxed_opaque_existential_2(v0 + 24);
}

uint64_t OUTLINED_FUNCTION_34_7()
{
  return sub_1B9DE1C80();
}

uint64_t OUTLINED_FUNCTION_37_5@<X0>(uint64_t (*a1)(uint64_t, uint64_t)@<X8>)
{
  uint64_t v1;
  uint64_t v2;

  return a1(v2, v1);
}

uint64_t OUTLINED_FUNCTION_38_7()
{
  return swift_isUniquelyReferenced_nonNull_native();
}

uint64_t OUTLINED_FUNCTION_39_8()
{
  return swift_bridgeObjectRetain();
}

uint64_t ConcreteResultingActionImplementationBox.__allocating_init(_:)(uint64_t a1)
{
  uint64_t v2;

  v2 = swift_allocObject();
  ConcreteResultingActionImplementationBox.init(_:)(a1);
  return v2;
}

void sub_1B9DC4790()
{
  sub_1B9DE27E4();
  __break(1u);
}

uint64_t ResultingActionImplementationBox.deinit()
{
  uint64_t v0;

  return v0;
}

uint64_t ResultingActionImplementationBox.__deallocating_deinit()
{
  return swift_deallocClassInstance();
}

uint64_t ConcreteResultingActionImplementationBox.init(_:)(uint64_t a1)
{
  uint64_t v1;

  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)v1 + 96) - 8) + 32))(v1 + *(_QWORD *)(*(_QWORD *)v1 + 112), a1);
  return v1;
}

uint64_t sub_1B9DC4824(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v7;
  uint64_t v8;
  uint64_t AssociatedTypeWitness;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  _BYTE v16[40];

  v8 = *(_QWORD *)(*(_QWORD *)v3 + 96);
  v7 = *(_QWORD *)(*(_QWORD *)v3 + 104);
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v10 = *(_QWORD *)(AssociatedTypeWitness - 8);
  MEMORY[0x1E0C80A78](AssociatedTypeWitness);
  v12 = &v16[-v11 - 8];
  sub_1B9D47998(a1, (uint64_t)v16);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED5CD620);
  swift_dynamicCast();
  v13 = (*(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t, uint64_t))(v7 + 24))(v12, a2, a3, v8, v7);
  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, AssociatedTypeWitness);
  return v13;
}

uint64_t sub_1B9DC4934()
{
  uint64_t v0;

  return (*(uint64_t (**)(uint64_t))(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)v0 + 96) - 8) + 8))(v0 + *(_QWORD *)(*(_QWORD *)v0 + 112));
}

uint64_t ConcreteResultingActionImplementationBox.deinit()
{
  uint64_t v0;

  (*(void (**)(uint64_t))(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)v0 + 96) - 8) + 8))(v0 + *(_QWORD *)(*(_QWORD *)v0 + 112));
  return v0;
}

uint64_t ConcreteResultingActionImplementationBox.__deallocating_deinit()
{
  ConcreteResultingActionImplementationBox.deinit();
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for ResultingActionImplementationBox()
{
  return objc_opt_self();
}

uint64_t sub_1B9DC49C4()
{
  uint64_t result;
  unint64_t v1;

  result = swift_checkMetadataState();
  if (v1 <= 0x3F)
  {
    result = swift_initClassMetadata2();
    if (!result)
      return 0;
  }
  return result;
}

uint64_t type metadata accessor for ConcreteResultingActionImplementationBox(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for ConcreteResultingActionImplementationBox);
}

uint64_t destroy for ResultingActionOutcome(uint64_t a1)
{
  unint64_t v1;
  uint64_t v2;

  v1 = *(_QWORD *)(a1 + 24);
  LODWORD(v2) = -1;
  if (v1 < 0xFFFFFFFF)
    v2 = *(_QWORD *)(a1 + 24);
  if ((int)v2 - 1 < 0)
  {
    if (v1)
      return __swift_destroy_boxed_opaque_existential_2(a1);
  }
  return a1;
}

uint64_t initializeWithCopy for ResultingActionOutcome(uint64_t a1, uint64_t a2)
{
  unint64_t v3;
  uint64_t v4;
  __int128 v5;

  v3 = *(_QWORD *)(a2 + 24);
  LODWORD(v4) = -1;
  if (v3 < 0xFFFFFFFF)
    v4 = *(_QWORD *)(a2 + 24);
  if ((int)v4 - 1 < 0 && v3)
  {
    *(_QWORD *)(a1 + 24) = v3;
    (**(void (***)(uint64_t))(v3 - 8))(a1);
  }
  else
  {
    v5 = *(_OWORD *)(a2 + 16);
    *(_OWORD *)a1 = *(_OWORD *)a2;
    *(_OWORD *)(a1 + 16) = v5;
  }
  return a1;
}

uint64_t assignWithCopy for ResultingActionOutcome(uint64_t a1, uint64_t a2)
{
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  unint64_t v8;
  int v9;
  __int128 v10;

  v4 = *(_QWORD *)(a1 + 24);
  LODWORD(v5) = -1;
  if (v4 >= 0xFFFFFFFF)
    LODWORD(v6) = -1;
  else
    v6 = *(_QWORD *)(a1 + 24);
  v7 = v6 - 1;
  v8 = *(_QWORD *)(a2 + 24);
  if (v8 < 0xFFFFFFFF)
    v5 = *(_QWORD *)(a2 + 24);
  v9 = v5 - 1;
  if (v7 < 0)
  {
    if (v9 < 0)
    {
      if (!v4)
        goto LABEL_8;
      if (v8)
      {
        __swift_assign_boxed_opaque_existential_0((uint64_t *)a1, (uint64_t *)a2);
        return a1;
      }
    }
    else if (!v4)
    {
      goto LABEL_13;
    }
    __swift_destroy_boxed_opaque_existential_2(a1);
    goto LABEL_13;
  }
  if ((v9 & 0x80000000) == 0)
  {
LABEL_13:
    v10 = *(_OWORD *)(a2 + 16);
    *(_OWORD *)a1 = *(_OWORD *)a2;
    *(_OWORD *)(a1 + 16) = v10;
    return a1;
  }
LABEL_8:
  if (!v8)
    goto LABEL_13;
  *(_QWORD *)(a1 + 24) = v8;
  (**(void (***)(uint64_t, uint64_t))(v8 - 8))(a1, a2);
  return a1;
}

uint64_t assignWithTake for ResultingActionOutcome(uint64_t a1, _OWORD *a2)
{
  unint64_t v4;
  uint64_t v5;
  __int128 v6;

  v4 = *(_QWORD *)(a1 + 24);
  LODWORD(v5) = -1;
  if (v4 < 0xFFFFFFFF)
    v5 = *(_QWORD *)(a1 + 24);
  if ((int)v5 - 1 < 0 && v4)
    __swift_destroy_boxed_opaque_existential_2(a1);
  v6 = a2[1];
  *(_OWORD *)a1 = *a2;
  *(_OWORD *)(a1 + 16) = v6;
  return a1;
}

uint64_t getEnumTagSinglePayload for ResultingActionOutcome(uint64_t a1, unsigned int a2)
{
  unint64_t v3;
  int v4;

  if (!a2)
    return 0;
  if (a2 >= 0x7FFFFFFE && *(_BYTE *)(a1 + 32))
    return (*(_DWORD *)a1 + 2147483646);
  v3 = *(_QWORD *)(a1 + 24);
  if (v3 >= 0xFFFFFFFF)
    LODWORD(v3) = -1;
  v4 = v3 - 1;
  if (v4 < 0)
    v4 = -1;
  if ((v4 + 1) >= 2)
    return v4;
  else
    return 0;
}

uint64_t storeEnumTagSinglePayload for ResultingActionOutcome(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFD)
  {
    *(_OWORD *)result = 0u;
    *(_OWORD *)(result + 16) = 0u;
    *(_DWORD *)result = a2 - 2147483646;
    if (a3 >= 0x7FFFFFFE)
      *(_BYTE *)(result + 32) = 1;
  }
  else
  {
    if (a3 >= 0x7FFFFFFE)
      *(_BYTE *)(result + 32) = 0;
    if (a2)
      *(_QWORD *)(result + 24) = a2 + 1;
  }
  return result;
}

uint64_t sub_1B9DC4C6C(uint64_t a1)
{
  unint64_t v1;
  int v2;

  v1 = *(_QWORD *)(a1 + 24);
  if (v1 >= 0xFFFFFFFF)
    LODWORD(v1) = -1;
  v2 = v1 - 1;
  if (v2 < 0)
    v2 = -1;
  return (v2 + 1);
}

_QWORD *sub_1B9DC4C90(_QWORD *result, unsigned int a2)
{
  if (a2 > 0x7FFFFFFE)
  {
    result[2] = 0;
    result[3] = 0;
    *result = a2 - 0x7FFFFFFF;
    result[1] = 0;
  }
  else if (a2)
  {
    result[3] = a2;
  }
  return result;
}

ValueMetadata *type metadata accessor for ResultingActionOutcome()
{
  return &type metadata for ResultingActionOutcome;
}

uint64_t sub_1B9DC4CD0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_1B9DE1EA8();
  return (**(uint64_t (***)(uint64_t, uint64_t, uint64_t))(v4 - 8))(a1, a2, v4);
}

uint64_t sub_1B9DC4D0C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_1B9DE1EA8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a1, a2, v4);
  return a1;
}

uint64_t sub_1B9DC4D50(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_1B9DE1EA8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 24))(a1, a2, v4);
  return a1;
}

uint64_t sub_1B9DC4D94(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_1B9DE1EA8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a1, a2, v4);
  return a1;
}

uint64_t sub_1B9DC4DD8(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_1B9DE1EA8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 40))(a1, a2, v4);
  return a1;
}

uint64_t sub_1B9DC4E1C()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_1B9DC4E28()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v2 = OUTLINED_FUNCTION_0_60();
  return __swift_getEnumTagSinglePayload(v1, v0, v2);
}

uint64_t sub_1B9DC4E50()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_1B9DC4E5C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v2 = OUTLINED_FUNCTION_0_60();
  return __swift_storeEnumTagSinglePayload(v1, v0, v0, v2);
}

uint64_t type metadata accessor for SendMethodFieldsProvider()
{
  uint64_t result;

  result = qword_1ED5CD1C8;
  if (!qword_1ED5CD1C8)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_1B9DC4EC0(uint64_t a1)
{
  _QWORD v2[4];

  v2[3] = MEMORY[0x1E0DEA968];
  v2[0] = 0x646975736D61;
  v2[1] = 0xE600000000000000;
  __swift_mutable_project_boxed_opaque_existential_1(a1, *(_QWORD *)(a1 + 24));
  sub_1B9DE1C38();
  return __swift_destroy_boxed_opaque_existential_2((uint64_t)v2);
}

uint64_t sub_1B9DC4F5C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;

  v3 = sub_1B9DE1EA8();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 16))(a1, v1, v3);
}

uint64_t sub_1B9DC4F94(uint64_t a1)
{
  return sub_1B9DC4EC0(a1);
}

uint64_t OUTLINED_FUNCTION_0_60()
{
  return sub_1B9DE1EA8();
}

uint64_t sub_1B9DC4FB8()
{
  uint64_t result;

  result = sub_1B9DE213C();
  qword_1ED5CC000 = result;
  return result;
}

id sub_1B9DC4FF0()
{
  id result;

  sub_1B9D46A84(0, (unint64_t *)&qword_1ED5CCA50);
  result = sub_1B9DAFEA4();
  qword_1ED5CBF00 = (uint64_t)result;
  return result;
}

uint64_t SymbolFactory.__allocating_init(asPartOf:)(uint64_t a1)
{
  uint64_t result;

  result = swift_allocObject();
  *(_QWORD *)(result + 16) = a1;
  return result;
}

uint64_t SymbolFactory.init(asPartOf:)(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(v1 + 16) = a1;
  return v1;
}

UIImage_optional __swiftcall SymbolFactory.symbol(withName:configuration:)(Swift::String withName, UIImageSymbolConfiguration configuration)
{
  uint64_t v2;
  void *object;
  uint64_t countAndFlagsBits;
  uint64_t v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  objc_class *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  id v18;
  objc_class *v19;
  Swift::Bool v20;
  void *v21;
  id v22;
  objc_class *v23;
  _QWORD v24[3];
  uint64_t v25;
  UIImage_optional result;

  object = withName._object;
  countAndFlagsBits = withName._countAndFlagsBits;
  v6 = sub_1B9DE18B4();
  MEMORY[0x1E0C80A78](v6);
  OUTLINED_FUNCTION_0_13();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED5CFBE0);
  sub_1B9DE18FC();
  *(_OWORD *)(swift_allocObject() + 16) = xmmword_1B9DF0AA0;
  v25 = type metadata accessor for SymbolFactory();
  v24[0] = v2;
  swift_retain();
  v7 = (id)AMSLogKey();
  if (v7)
  {
    v8 = v7;
    sub_1B9DE2160();

    sub_1B9DE18A8();
    OUTLINED_FUNCTION_0_3();
    __swift_project_boxed_opaque_existential_2(v24, v25);
    swift_getDynamicType();
    swift_getMetatypeMetadata();
    OUTLINED_FUNCTION_9_9();
    OUTLINED_FUNCTION_3_9();
    sub_1B9DE189C();
    v9 = MEMORY[0x1E0DEA968];
    OUTLINED_FUNCTION_9_9();
    OUTLINED_FUNCTION_3_9();
    v10 = v9;
  }
  else
  {
    sub_1B9DE18A8();
    OUTLINED_FUNCTION_0_3();
    __swift_project_boxed_opaque_existential_2(v24, v25);
    swift_getDynamicType();
    swift_getMetatypeMetadata();
    OUTLINED_FUNCTION_9_9();
    OUTLINED_FUNCTION_3_9();
    v10 = MEMORY[0x1E0DEA968];
  }
  sub_1B9DE189C();
  sub_1B9DE18C0();
  type metadata accessor for Log();
  __swift_destroy_boxed_opaque_existential_2((uint64_t)v24);
  sub_1B9DE1860();
  v25 = v10;
  v24[0] = countAndFlagsBits;
  v24[1] = object;
  swift_bridgeObjectRetain();
  sub_1B9DE18CC();
  sub_1B9D44EF4((uint64_t)v24);
  sub_1B9DE1860();
  v25 = sub_1B9D46A84(0, &qword_1ED5CBFF8);
  v24[0] = configuration.super.super.isa;
  v11 = configuration.super.super.isa;
  sub_1B9DE18CC();
  sub_1B9D44EF4((uint64_t)v24);
  sub_1B9DB0344();
  swift_bridgeObjectRelease();
  v12 = sub_1B9DC5444();
  v14 = sub_1B9DC5588(countAndFlagsBits, (uint64_t)object, v12, v13);
  v16 = v15;
  swift_bridgeObjectRelease();
  if (qword_1ED5CBF10 != -1)
    swift_once();
  v17 = (void *)qword_1ED5CBF00;
  v18 = (id)qword_1ED5CBF00;
  v19 = (objc_class *)sub_1B9DC5620(v14, v16, v11, v17);

  swift_bridgeObjectRelease();
  if (!v19)
  {
    v21 = (void *)qword_1ED5CBF00;
    v22 = (id)qword_1ED5CBF00;
    v19 = (objc_class *)sub_1B9DC5620(countAndFlagsBits, (uint64_t)object, v11, v21);

  }
  v23 = v19;
  result.value.super.isa = v23;
  result.is_nil = v20;
  return result;
}

uint64_t type metadata accessor for SymbolFactory()
{
  return objc_opt_self();
}

uint64_t sub_1B9DC5444()
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
  uint64_t v11;

  v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED5CD6D0);
  v1 = *(_QWORD *)(v0 - 8);
  MEMORY[0x1E0C80A78](v0);
  OUTLINED_FUNCTION_0_13();
  v4 = v3 - v2;
  v5 = sub_1B9DE1EE4();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x1E0C80A78](v5);
  OUTLINED_FUNCTION_0_13();
  v9 = v8 - v7;
  sub_1B9DE1AE8();
  swift_retain();
  sub_1B9DE1F38();
  swift_release();
  if (qword_1ED5CC008 != -1)
    swift_once();
  sub_1B9DE1ED8();
  sub_1B9DE1ECC();
  (*(void (**)(uint64_t, uint64_t))(v1 + 8))(v4, v0);
  (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v9, v5);
  return v11;
}

uint64_t sub_1B9DC5588(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;

  v4 = a1;
  if (a4)
  {
    swift_bridgeObjectRetain();
    sub_1B9DE21E4();
    swift_bridgeObjectRetain();
    sub_1B9DE21E4();
    swift_bridgeObjectRelease();
    return a1;
  }
  else
  {
    swift_bridgeObjectRetain();
  }
  return v4;
}

id sub_1B9DC5620(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v8;
  id v9;

  sub_1B9D46A84(0, (unint64_t *)&qword_1ED5CD7E0);
  v8 = a4;
  v9 = a3;
  swift_bridgeObjectRetain();
  return sub_1B9DC569C(a1, a2, a4, a3);
}

id sub_1B9DC569C(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  void *v6;
  id v7;

  v6 = (void *)sub_1B9DE213C();
  swift_bridgeObjectRelease();
  v7 = objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_imageNamed_inBundle_withConfiguration_, v6, a3, a4);

  return v7;
}

uint64_t SymbolFactory.deinit()
{
  uint64_t v0;

  swift_release();
  return v0;
}

uint64_t SymbolFactory.__deallocating_deinit()
{
  swift_release();
  return swift_deallocClassInstance();
}

uint64_t sub_1B9DC575C()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v1 = *(void **)(v0 + qword_1ED5CCFD8);
  objc_msgSend(v1, sel_lock);
  v2 = OUTLINED_FUNCTION_1_14();
  sub_1B9D63190(v2);
  v3 = OUTLINED_FUNCTION_1_14();
  sub_1B9DC57C4(v3, v4);
  objc_msgSend(v1, sel_unlock);
  v5 = OUTLINED_FUNCTION_1_14();
  return sub_1B9D63180(v5);
}

uint64_t sub_1B9DC57C4(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;

  v3 = (_QWORD *)(v2 + qword_1ED5CCFD0);
  v4 = *(_QWORD *)(v2 + qword_1ED5CCFD0);
  *v3 = a1;
  v3[1] = a2;
  return sub_1B9D63180(v4);
}

uint64_t sub_1B9DC57E4()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;

  v1 = *(void **)(v0 + qword_1ED5CCFD8);
  objc_msgSend(v1, sel_lock);
  v2 = *(_QWORD *)(v0 + qword_1ED5CCFD0);
  sub_1B9D63190(v2);
  objc_msgSend(v1, sel_unlock);
  return v2;
}

uint64_t sub_1B9DC5854(uint64_t a1, char a2)
{
  void *v2;
  uint64_t result;
  void (*v4)(uint64_t *);
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  LOBYTE(v7) = a2 & 1;
  result = (uint64_t)objc_msgSend(v2, sel_isCancelled, a1, v7);
  if ((result & 1) == 0)
  {
    result = sub_1B9DC57E4();
    if (result)
    {
      v4 = (void (*)(uint64_t *))result;
      sub_1B9DC575C();
      v4(&v6);
      v5 = OUTLINED_FUNCTION_1_14();
      return sub_1B9D63180(v5);
    }
  }
  return result;
}

void sub_1B9DC58DC()
{
  id v0;
  void *v1;
  uint64_t v2;
  id v3;

  sub_1B9D68878();
  swift_bridgeObjectRetain();
  v0 = sub_1B9DC59A8();
  if (v0)
  {
    v3 = v0;
    sub_1B9DC5854((uint64_t)v0, 0);

  }
  else
  {
    sub_1B9D5ED3C();
    v1 = (void *)swift_allocError();
    *(_OWORD *)v2 = xmmword_1B9DF1430;
    *(_BYTE *)(v2 + 16) = 3;
    sub_1B9DC5854((uint64_t)v1, 1);

  }
}

id sub_1B9DC59A8()
{
  void *v0;
  id v1;

  v0 = (void *)sub_1B9DE213C();
  swift_bridgeObjectRelease();
  v1 = objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_systemImageNamed_, v0);

  return v1;
}

void sub_1B9DC5A08(void *a1)
{
  id v1;

  v1 = a1;
  sub_1B9DC58DC();

}

void sub_1B9DC5A3C()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

void sub_1B9DC5A68()
{
  sub_1B9DC5A3C();
}

uint64_t sub_1B9DC5A74()
{
  return OUTLINED_FUNCTION_0_29();
}

uint64_t sub_1B9DC5A84()
{
  return OUTLINED_FUNCTION_0_29();
}

uint64_t type metadata accessor for SystemImageFetchOperation()
{
  uint64_t result;

  result = qword_1EF243798;
  if (!qword_1EF243798)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_1B9DC5ACC()
{
  return swift_initClassMetadata2();
}

uint64_t sub_1B9DC5B0C()
{
  return type metadata accessor for SystemImageFetchOperation();
}

uint64_t sub_1B9DC5B14()
{
  return swift_initClassMetadata2();
}

uint64_t sub_1B9DC5B58()
{
  uint64_t v0;

  sub_1B9DC5BC4();
  swift_release();
  swift_release();
  return v0;
}

uint64_t sub_1B9DC5B94()
{
  sub_1B9DC5B58();
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for TieredAssetCache(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for TieredAssetCache);
}

id sub_1B9DC5BC4()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  id v4;
  void *v5;
  void *v6;
  _QWORD v8[3];
  uint64_t v9;

  v1 = v0;
  v2 = *v0;
  v3 = sub_1B9DE18B4();
  MEMORY[0x1E0C80A78](v3);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED5CFBE0);
  sub_1B9DE18FC();
  *(_OWORD *)(swift_allocObject() + 16) = xmmword_1B9DEFC60;
  v9 = v2;
  v8[0] = v0;
  swift_retain();
  v4 = (id)AMSLogKey();
  if (v4)
  {
    v5 = v4;
    sub_1B9DE2160();

    sub_1B9DE18A8();
    OUTLINED_FUNCTION_0_3();
    __swift_project_boxed_opaque_existential_2(v8, v9);
    swift_getDynamicType();
    swift_getMetatypeMetadata();
    OUTLINED_FUNCTION_9_9();
    OUTLINED_FUNCTION_3_9();
    sub_1B9DE189C();
  }
  else
  {
    sub_1B9DE18A8();
    OUTLINED_FUNCTION_0_3();
    __swift_project_boxed_opaque_existential_2(v8, v9);
    swift_getDynamicType();
    swift_getMetatypeMetadata();
  }
  OUTLINED_FUNCTION_9_9();
  OUTLINED_FUNCTION_3_9();
  sub_1B9DE189C();
  sub_1B9DE18C0();
  type metadata accessor for Log();
  __swift_destroy_boxed_opaque_existential_2((uint64_t)v8);
  sub_1B9DE1860();
  sub_1B9DE18E4();
  sub_1B9DB0364();
  swift_bridgeObjectRelease();
  v6 = (void *)v0[2];
  objc_msgSend((id)v1[2], sel_lock);
  sub_1B9DC60F0();
  return objc_msgSend(v6, sel_unlock);
}

uint64_t sub_1B9DC5E28()
{
  uint64_t **v0;
  uint64_t *v1;
  uint64_t v3;

  v1 = *v0;
  sub_1B9DC6558();
  type metadata accessor for TieredAssetCacheArena.Segment(255, v1[10], v1[11], v1[12]);
  sub_1B9DE231C();
  sub_1B9DE2040();
  return v3;
}

uint64_t sub_1B9DC5EA8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  _QWORD v6[2];

  v0 = sub_1B9DE16C8();
  v1 = *(_QWORD *)(v0 - 8);
  MEMORY[0x1E0C80A78](v0);
  v3 = (char *)v6 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED5CFBD8);
  v4 = swift_allocObject();
  *(_OWORD *)(v4 + 16) = xmmword_1B9DEFF40;
  sub_1B9DE16BC();
  v6[1] = v4;
  sub_1B9D4C9C0();
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED5CFAD0);
  sub_1B9D4949C();
  sub_1B9DE261C();
  sub_1B9DE24E4();
  return (*(uint64_t (**)(char *, uint64_t))(v1 + 8))(v3, v0);
}

uint64_t sub_1B9DC5FD8(uint64_t **a1)
{
  uint64_t *v1;

  v1 = *a1;
  swift_beginAccess();
  type metadata accessor for BinaryMultiMap(0, v1[10], v1[11], v1[12]);
  sub_1B9D66BE4();
  return swift_endAccess();
}

uint64_t sub_1B9DC6040@<X0>(uint64_t **a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t *v3;
  uint64_t v4;
  uint64_t result;

  v3 = *a1;
  swift_beginAccess();
  type metadata accessor for TieredAssetCacheArena.Segment(0, v3[10], v3[11], v3[12]);
  v4 = sub_1B9DE231C();
  swift_bridgeObjectRetain();
  MEMORY[0x1BCCCEEA8](MEMORY[0x1E0DEAF38], v4);
  result = sub_1B9DE2328();
  *a2 = result;
  return result;
}

uint64_t sub_1B9DC60F0()
{
  uint64_t v0;

  swift_beginAccess();
  v0 = sub_1B9DE231C();
  MEMORY[0x1BCCCEEA8](MEMORY[0x1E0DEAF28], v0);
  MEMORY[0x1BCCCEEA8](MEMORY[0x1E0DEAF58], v0);
  sub_1B9DE23F4();
  return swift_endAccess();
}

uint64_t sub_1B9DC61AC()
{
  uint64_t **v0;
  uint64_t *v1;
  uint64_t v2;
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t DynamicType;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char v13;
  uint64_t v14;
  _QWORD v15[3];
  uint64_t MetatypeMetadata;
  _QWORD v17[3];
  uint64_t *v18;

  v1 = *v0;
  v2 = sub_1B9DE18B4();
  MEMORY[0x1E0C80A78](v2);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED5CFBE0);
  sub_1B9DE18FC();
  *(_OWORD *)(swift_allocObject() + 16) = xmmword_1B9DEFC60;
  v18 = v1;
  v17[0] = v0;
  swift_retain();
  v3 = (id)AMSLogKey();
  if (v3)
  {
    v4 = v3;
    v5 = sub_1B9DE2160();
    v7 = v6;

    sub_1B9DE18A8();
    sub_1B9DE189C();
    __swift_project_boxed_opaque_existential_2(v17, (uint64_t)v18);
    DynamicType = swift_getDynamicType();
    MetatypeMetadata = swift_getMetatypeMetadata();
    v15[0] = DynamicType;
    sub_1B9DE1884();
    sub_1B9D44EF4((uint64_t)v15);
    sub_1B9DE189C();
    MetatypeMetadata = MEMORY[0x1E0DEA968];
    v15[0] = v5;
    v15[1] = v7;
    sub_1B9DE1884();
  }
  else
  {
    sub_1B9DE18A8();
    sub_1B9DE189C();
    __swift_project_boxed_opaque_existential_2(v17, (uint64_t)v18);
    v9 = swift_getDynamicType();
    MetatypeMetadata = swift_getMetatypeMetadata();
    v15[0] = v9;
    sub_1B9DE1884();
  }
  sub_1B9D44EF4((uint64_t)v15);
  sub_1B9DE189C();
  sub_1B9DE18C0();
  type metadata accessor for Log();
  __swift_destroy_boxed_opaque_existential_2((uint64_t)v17);
  sub_1B9DE1860();
  sub_1B9DE18E4();
  sub_1B9DB0364();
  swift_bridgeObjectRelease();
  v10 = sub_1B9DC5E28();
  v11 = type metadata accessor for TieredAssetCacheArena.Segment(0, v1[10], v1[11], v1[12]);
  v17[0] = sub_1B9DE2298();
  if (v17[0] != MEMORY[0x1BCCCE0A4](v10, v11))
  {
    do
    {
      v13 = sub_1B9DE22D4();
      sub_1B9DE22BC();
      if ((v13 & 1) != 0)
        swift_retain();
      else
        sub_1B9DE2760();
      swift_bridgeObjectRetain();
      MEMORY[0x1BCCCE0B0](v17, v10, v11);
      swift_bridgeObjectRelease();
      sub_1B9DC5EA8();
      swift_release();
      v14 = v17[0];
    }
    while (v14 != MEMORY[0x1BCCCE0A4](v10, v11));
  }
  return swift_bridgeObjectRelease();
}

uint64_t sub_1B9DC64E8()
{
  swift_retain();
  sub_1B9DC61AC();
  return swift_release();
}

uint64_t type metadata accessor for TieredAssetCacheArena(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for TieredAssetCacheArena);
}

uint64_t type metadata accessor for TieredAssetCacheArena.Segment(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for TieredAssetCacheArena.Segment);
}

uint64_t sub_1B9DC6528()
{
  uint64_t **v0;

  return sub_1B9DC5FD8(v0);
}

uint64_t sub_1B9DC6540@<X0>(uint64_t *a1@<X8>)
{
  uint64_t **v1;

  return sub_1B9DC6040(v1, a1);
}

unint64_t sub_1B9DC6558()
{
  unint64_t result;

  result = qword_1ED5CFB00;
  if (!qword_1ED5CFB00)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_1ED5CFB00);
  }
  return result;
}

BOOL sub_1B9DC6594(_QWORD *a1)
{
  uint64_t v1;

  return *a1 == v1;
}

void sub_1B9DC65A8(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  int64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  int64_t v8;
  uint64_t v9;
  unint64_t v10;
  int64_t v11;
  id v12;
  unint64_t v13;
  int64_t v14;
  void *v15;
  id v16;
  int64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  int64_t v23;
  unint64_t v24;
  uint64_t v25;

  v1 = a1;
  v25 = MEMORY[0x1E0DEE9D8];
  if ((a1 & 0xC000000000000001) != 0)
  {
    swift_bridgeObjectRetain();
    sub_1B9DE264C();
    sub_1B9DC6A58();
    sub_1B9DC6A94();
    sub_1B9DE2364();
    v1 = v20;
    v18 = v21;
    v2 = v22;
    v3 = v23;
    v4 = v24;
  }
  else
  {
    v5 = -1 << *(_BYTE *)(a1 + 32);
    v18 = a1 + 56;
    v2 = ~v5;
    v6 = -v5;
    if (v6 < 64)
      v7 = ~(-1 << v6);
    else
      v7 = -1;
    v4 = v7 & *(_QWORD *)(a1 + 56);
    swift_bridgeObjectRetain();
    v3 = 0;
  }
  v8 = (unint64_t)(v2 + 64) >> 6;
  while (v1 < 0)
  {
    if (!sub_1B9DE26A0())
      goto LABEL_39;
    sub_1B9DC6A58();
    swift_unknownObjectRetain();
    swift_dynamicCast();
    v12 = v19;
    swift_unknownObjectRelease();
    v11 = v3;
    v9 = v4;
    if (!v19)
      goto LABEL_39;
LABEL_26:
    objc_opt_self();
    v15 = (void *)swift_dynamicCastObjCClass();
    if (!v15)
    {

      goto LABEL_32;
    }
    v16 = objc_msgSend(v15, sel_keyWindow);

    v3 = v11;
    v4 = v9;
    if (v16)
    {
      MEMORY[0x1BCCCE020]();
      if (*(_QWORD *)((v25 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v25 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
        sub_1B9DE22C8();
      sub_1B9DE22E0();
      sub_1B9DE22B0();
LABEL_32:
      v3 = v11;
      v4 = v9;
    }
  }
  if (v4)
  {
    v9 = (v4 - 1) & v4;
    v10 = __clz(__rbit64(v4)) | (v3 << 6);
    v11 = v3;
LABEL_25:
    v12 = *(id *)(*(_QWORD *)(v1 + 48) + 8 * v10);
    if (!v12)
      goto LABEL_39;
    goto LABEL_26;
  }
  v11 = v3 + 1;
  if (!__OFADD__(v3, 1))
  {
    if (v11 >= v8)
      goto LABEL_39;
    v13 = *(_QWORD *)(v18 + 8 * v11);
    if (!v13)
    {
      v14 = v3 + 2;
      if (v3 + 2 >= v8)
        goto LABEL_39;
      v13 = *(_QWORD *)(v18 + 8 * v14);
      if (v13)
        goto LABEL_23;
      v14 = v3 + 3;
      if (v3 + 3 >= v8)
        goto LABEL_39;
      v13 = *(_QWORD *)(v18 + 8 * v14);
      if (v13)
        goto LABEL_23;
      v14 = v3 + 4;
      if (v3 + 4 >= v8)
        goto LABEL_39;
      v13 = *(_QWORD *)(v18 + 8 * v14);
      if (v13)
      {
LABEL_23:
        v11 = v14;
      }
      else
      {
        v11 = v3 + 5;
        if (v3 + 5 >= v8)
          goto LABEL_39;
        v13 = *(_QWORD *)(v18 + 8 * v11);
        if (!v13)
        {
          v17 = v3 + 6;
          while (v17 < v8)
          {
            v13 = *(_QWORD *)(v18 + 8 * v17++);
            if (v13)
            {
              v11 = v17 - 1;
              goto LABEL_24;
            }
          }
LABEL_39:
          sub_1B9D45A4C();
          return;
        }
      }
    }
LABEL_24:
    v9 = (v13 - 1) & v13;
    v10 = __clz(__rbit64(v13)) + (v11 << 6);
    goto LABEL_25;
  }
  __break(1u);
}

void static UIApplication.isCompact()()
{
  void *v0;
  void *v1;
  CGRect v2;

  v0 = (void *)static UIApplication.window.getter();
  if (v0)
  {
    v1 = v0;
    objc_msgSend(v0, sel_frame);
    CGRectGetWidth(v2);

  }
  OUTLINED_FUNCTION_0_61();
}

void *UIApplication.regularWidth.unsafeMutableAddressor()
{
  return &static UIApplication.regularWidth;
}

double static UIApplication.regularWidth.getter()
{
  return 375.0;
}

uint64_t static UIApplication.window.getter()
{
  id v0;
  id v1;
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;
  uint64_t v5;
  id v6;

  v0 = objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_sharedApplication);
  v1 = objc_msgSend(v0, sel_connectedScenes);

  sub_1B9DC6A58();
  sub_1B9DC6A94();
  v2 = sub_1B9DE234C();

  sub_1B9DC65A8(v2);
  v4 = v3;
  swift_bridgeObjectRelease();
  if (v4 >> 62)
  {
    swift_bridgeObjectRetain();
    v5 = sub_1B9DE27F0();
    swift_bridgeObjectRelease();
    if (!v5)
      goto LABEL_6;
  }
  else
  {
    v5 = *(_QWORD *)((v4 & 0xFFFFFFFFFFFFF8) + 0x10);
    if (!v5)
      goto LABEL_6;
  }
  sub_1B9D44ECC(0, (v4 & 0xC000000000000001) == 0, v4);
  if ((v4 & 0xC000000000000001) != 0)
    v6 = (id)MEMORY[0x1BCCCE518](0, v4);
  else
    v6 = *(id *)(v4 + 32);
  v5 = (uint64_t)v6;
LABEL_6:
  swift_bridgeObjectRelease();
  return v5;
}

unint64_t sub_1B9DC6A58()
{
  unint64_t result;

  result = qword_1ED5CE0A0;
  if (!qword_1ED5CE0A0)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_1ED5CE0A0);
  }
  return result;
}

unint64_t sub_1B9DC6A94()
{
  unint64_t result;
  unint64_t v1;

  result = qword_1ED5CE0A8;
  if (!qword_1ED5CE0A8)
  {
    v1 = sub_1B9DC6A58();
    result = MEMORY[0x1BCCCEEA8](MEMORY[0x1E0DEFCF8], v1);
    atomic_store(result, (unint64_t *)&qword_1ED5CE0A8);
  }
  return result;
}

void static UIApplication.hasNotch()()
{
  void *v0;
  void *v1;

  v0 = (void *)static UIApplication.window.getter();
  if (v0)
  {
    v1 = v0;
    objc_msgSend(v0, sel_safeAreaInsets);

  }
  OUTLINED_FUNCTION_0_61();
}

void sub_1B9DC6B20(double a1)
{
  id v2;
  id v3;

  v2 = OUTLINED_FUNCTION_0_62();
  objc_msgSend(v2, sel_setCornerRadius_, a1);

  v3 = OUTLINED_FUNCTION_0_62();
  objc_msgSend(v3, sel_setMasksToBounds_, 1);

}

id OUTLINED_FUNCTION_0_62()
{
  void *v0;
  uint64_t v1;

  return objc_msgSend(v0, (SEL)(v1 + 3656));
}

void sub_1B9DC6BAC(void *a1, double a2, double a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  v6 = swift_allocObject();
  swift_unknownObjectWeakInit();
  v7 = swift_allocObject();
  *(_QWORD *)(v7 + 16) = v6;
  *(double *)(v7 + 24) = a2;
  v8 = MEMORY[0x1E0C809B0];
  v9 = OUTLINED_FUNCTION_3_29((uint64_t)sub_1B9D49458, MEMORY[0x1E0C809B0], 1107296256, v10, v12);
  swift_release();
  if (a1)
  {
    a1 = OUTLINED_FUNCTION_3_29((uint64_t)sub_1B9DC6DBC, v8, 1107296256, v11, v13);
    swift_retain();
    swift_release();
  }
  objc_msgSend((id)objc_opt_self(), sel_animateWithDuration_delay_options_animations_completion_, 134, v9, a1, a3, 0.0);
  _Block_release(a1);
  _Block_release(v9);
}

uint64_t sub_1B9DC6CE8()
{
  swift_unknownObjectWeakDestroy();
  return swift_deallocObject();
}

void sub_1B9DC6D0C(uint64_t a1, double a2)
{
  uint64_t v3;
  void *v4;
  void *v5;

  v3 = a1 + 16;
  swift_beginAccess();
  v4 = (void *)MEMORY[0x1BCCCEFF8](v3);
  if (v4)
  {
    v5 = v4;
    objc_msgSend(v4, sel_setAlpha_, a2);

  }
}

uint64_t sub_1B9DC6D74()
{
  swift_release();
  return swift_deallocObject();
}

void sub_1B9DC6D98()
{
  uint64_t v0;

  sub_1B9DC6D0C(*(_QWORD *)(v0 + 16), *(double *)(v0 + 24));
}

uint64_t block_copy_helper_16(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_16()
{
  return swift_release();
}

uint64_t sub_1B9DC6DBC(uint64_t a1, uint64_t a2)
{
  void (*v3)(uint64_t);

  v3 = *(void (**)(uint64_t))(a1 + 32);
  swift_retain();
  v3(a2);
  return swift_release();
}

id sub_1B9DC6E00()
{
  id v0;

  v0 = objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_defaultSessionConfiguration);
  objc_msgSend(v0, sel_setHTTPShouldUsePipelining_, 1);
  objc_msgSend(v0, sel_setTimeoutIntervalForRequest_, 30.0);
  return v0;
}

void sub_1B9DC6E60()
{
  id v0;
  id v1;

  sub_1B9DC6EC0();
  v0 = sub_1B9DC6E00();
  v1 = objc_msgSend((id)objc_opt_self(), sel_sessionWithConfiguration_, v0);

  qword_1ED5D1E08 = (uint64_t)v1;
}

unint64_t sub_1B9DC6EC0()
{
  unint64_t result;

  result = qword_1ED5CCA48;
  if (!qword_1ED5CCA48)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_1ED5CCA48);
  }
  return result;
}

uint64_t Video.__allocating_init(id:videoUrl:preview:allowsAutoPlay:looping:canPlayFullScreen:playbackControls:autoPlayPlaybackControls:templateMediaEvent:templateClickEvent:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5, int a6, int a7, uint64_t a8, uint64_t a9, char a10, uint64_t a11, uint64_t a12)
{
  uint64_t v17;

  v17 = swift_allocObject();
  Video.init(id:videoUrl:preview:allowsAutoPlay:looping:canPlayFullScreen:playbackControls:autoPlayPlaybackControls:templateMediaEvent:templateClickEvent:)(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10 & 1, a11, a12);
  return v17;
}

uint64_t Video.init(id:videoUrl:preview:allowsAutoPlay:looping:canPlayFullScreen:playbackControls:autoPlayPlaybackControls:templateMediaEvent:templateClickEvent:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5, int a6, int a7, uint64_t a8, uint64_t a9, char a10, uint64_t a11, uint64_t a12)
{
  uint64_t v12;
  uint64_t v13;
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
  uint64_t *v33;
  uint64_t v35;
  uint64_t v36;
  int v37;
  int v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;

  v13 = v12;
  v37 = a6;
  v38 = a7;
  v40 = a12;
  v41 = a3;
  v39 = a11;
  v36 = a9;
  v20 = sub_1B9DE15A8();
  v42 = *(_QWORD *)(v20 - 8);
  v43 = v20;
  OUTLINED_FUNCTION_23_0();
  MEMORY[0x1E0C80A78](v21);
  v23 = (char *)&v35 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(_QWORD *)(v13 + 16) = a1;
  *(_QWORD *)(v13 + 24) = a2;
  v24 = v13 + OBJC_IVAR____TtC27AppleMediaServicesUIDynamic5Video_videoUrl;
  v25 = OUTLINED_FUNCTION_2_4();
  v26 = *(_QWORD *)(v25 - 8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v26 + 16))(v24, a3, v25);
  *(_QWORD *)(v13 + OBJC_IVAR____TtC27AppleMediaServicesUIDynamic5Video_preview) = a4;
  *(_BYTE *)(v13 + OBJC_IVAR____TtC27AppleMediaServicesUIDynamic5Video_allowsAutoPlay) = a5;
  *(_BYTE *)(v13 + OBJC_IVAR____TtC27AppleMediaServicesUIDynamic5Video_looping) = v37;
  *(_BYTE *)(v13 + OBJC_IVAR____TtC27AppleMediaServicesUIDynamic5Video_canPlayFullScreen) = v38;
  *(_QWORD *)(v13 + OBJC_IVAR____TtC27AppleMediaServicesUIDynamic5Video_playbackControls) = a8;
  v27 = v36;
  if ((a10 & 1) != 0)
    v27 = a8;
  *(_QWORD *)(v13 + OBJC_IVAR____TtC27AppleMediaServicesUIDynamic5Video_autoPlayPlaybackControls) = v27;
  v28 = v39;
  sub_1B9DC7190(v39, v13 + OBJC_IVAR____TtC27AppleMediaServicesUIDynamic5Video_templateMediaEvent);
  v29 = v40;
  sub_1B9DC7190(v40, v13 + OBJC_IVAR____TtC27AppleMediaServicesUIDynamic5Video_templateClickEvent);
  swift_retain();
  sub_1B9DE159C();
  v30 = sub_1B9DE1590();
  v32 = v31;
  swift_release();
  sub_1B9DA9A90(v29, (uint64_t *)&unk_1EF243CA0);
  sub_1B9DA9A90(v28, (uint64_t *)&unk_1EF243CA0);
  (*(void (**)(uint64_t, uint64_t))(v26 + 8))(v41, v25);
  (*(void (**)(char *, uint64_t))(v42 + 8))(v23, v43);
  v33 = (uint64_t *)(v13 + OBJC_IVAR____TtC27AppleMediaServicesUIDynamic5Video_playbackId);
  *v33 = v30;
  v33[1] = v32;
  return v13;
}

uint64_t sub_1B9DC7190(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EF243CA0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t Video.__allocating_init(deserializing:using:)(char *a1, uint64_t a2)
{
  uint64_t v4;

  v4 = swift_allocObject();
  Video.init(deserializing:using:)(a1, a2);
  return v4;
}

_QWORD *Video.init(deserializing:using:)(char *a1, uint64_t a2)
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
  uint64_t v31;
  void (*v32)(char *, uint64_t);
  uint64_t v33;
  _QWORD *v34;
  uint64_t v35;
  _QWORD *v36;
  _QWORD *v37;
  uint64_t v38;
  uint64_t v39;
  _QWORD *v40;
  void (*v41)(char *, uint64_t, uint64_t);
  char *v42;
  uint64_t v43;
  void (*v44)(char *, uint64_t, uint64_t);
  void *v45;
  uint64_t v46;
  char *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  void (*v51)(uint64_t, uint64_t);
  char v52;
  char v53;
  char v54;
  char v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  char *v60;
  uint64_t v61;
  char v62;
  uint64_t v63;
  _QWORD *v64;
  char *v65;
  uint64_t v66;
  void (*v67)(uint64_t, uint64_t, uint64_t);
  uint64_t v68;
  uint64_t v69;
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
  uint64_t *v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  void (*v87)(uint64_t, uint64_t);
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  char *v93;
  uint64_t v94;
  void *v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  void (*v102)(uint64_t, uint64_t);
  uint64_t v103;
  void (*v104)(uint64_t, uint64_t);
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  char *v111;
  _QWORD v112[5];
  _QWORD *v113;

  v108 = a2;
  v111 = a1;
  v2 = sub_1B9DE15A8();
  v100 = *(_QWORD *)(v2 - 8);
  v101 = v2;
  OUTLINED_FUNCTION_23_0();
  MEMORY[0x1E0C80A78](v3);
  OUTLINED_FUNCTION_17_5();
  v99 = v4;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EF243CA0);
  OUTLINED_FUNCTION_23_0();
  MEMORY[0x1E0C80A78](v5);
  OUTLINED_FUNCTION_17_5();
  v98 = v6;
  v7 = sub_1B9DE1968();
  v109 = *(_QWORD *)(v7 - 8);
  v110 = v7;
  OUTLINED_FUNCTION_23_0();
  MEMORY[0x1E0C80A78](v8);
  OUTLINED_FUNCTION_62_5();
  v103 = v9;
  OUTLINED_FUNCTION_7_23();
  MEMORY[0x1E0C80A78](v10);
  v93 = (char *)&v89 - v11;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED5CE100);
  OUTLINED_FUNCTION_23_0();
  MEMORY[0x1E0C80A78](v12);
  v14 = (char *)&v89 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = sub_1B9DE1848();
  v107 = *(_QWORD *)(v15 - 8);
  OUTLINED_FUNCTION_23_0();
  MEMORY[0x1E0C80A78](v16);
  OUTLINED_FUNCTION_62_5();
  v97 = v17;
  OUTLINED_FUNCTION_7_23();
  MEMORY[0x1E0C80A78](v18);
  OUTLINED_FUNCTION_10_18();
  v96 = v19;
  OUTLINED_FUNCTION_7_23();
  MEMORY[0x1E0C80A78](v20);
  OUTLINED_FUNCTION_10_18();
  v94 = v21;
  OUTLINED_FUNCTION_7_23();
  MEMORY[0x1E0C80A78](v22);
  OUTLINED_FUNCTION_10_18();
  v92 = v23;
  OUTLINED_FUNCTION_7_23();
  MEMORY[0x1E0C80A78](v24);
  OUTLINED_FUNCTION_10_18();
  v91 = v25;
  OUTLINED_FUNCTION_7_23();
  MEMORY[0x1E0C80A78](v26);
  v28 = (char *)&v89 - v27;
  v29 = sub_1B9DE1554();
  v106 = *(_QWORD *)(v29 - 8);
  OUTLINED_FUNCTION_23_0();
  MEMORY[0x1E0C80A78](v30);
  OUTLINED_FUNCTION_17_5();
  v105 = v31;
  type metadata accessor for Log();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED5CFBE0);
  sub_1B9DE18FC();
  *(_OWORD *)(swift_allocObject() + 16) = xmmword_1B9DEFE80;
  sub_1B9DE1860();
  v112[0] = 0;
  v112[1] = 0xE000000000000000;
  sub_1B9DE2724();
  sub_1B9DE21E4();
  sub_1B9DE279C();
  v112[3] = MEMORY[0x1E0DEA968];
  sub_1B9DE18CC();
  sub_1B9DA9A90((uint64_t)v112, (uint64_t *)&unk_1ED5CFC00);
  sub_1B9DB0344();
  swift_bridgeObjectRelease();
  sub_1B9DE1854();
  sub_1B9DE17E8();
  v32 = *(void (**)(char *, uint64_t))(v107 + 8);
  v32(v28, v15);
  if (__swift_getEnumTagSinglePayload((uint64_t)v14, 1, v29) == 1)
  {
    sub_1B9DA9A90((uint64_t)v14, &qword_1ED5CE100);
    v33 = sub_1B9DE2064();
    sub_1B9D7E79C();
    swift_allocError();
    v34 = v113;
    v35 = *v113;
    *v36 = 0x6C72556F65646976;
    v36[1] = 0xE800000000000000;
    v36[2] = v35;
    (*(void (**)(void))(*(_QWORD *)(v33 - 8) + 104))();
    swift_willThrow();
    (*(void (**)(uint64_t, uint64_t))(v109 + 8))(v108, v110);
    v32(v111, v15);
    type metadata accessor for Video();
    swift_deallocPartialClassInstance();
    return v34;
  }
  else
  {
    v104 = (void (*)(uint64_t, uint64_t))v32;
    v107 = v15;
    v39 = v105;
    v38 = v106;
    (*(void (**)(uint64_t, char *, uint64_t))(v106 + 32))(v105, v14, v29);
    v40 = v113;
    v41 = *(void (**)(char *, uint64_t, uint64_t))(v38 + 16);
    v90 = v29;
    v41((char *)v113 + OBJC_IVAR____TtC27AppleMediaServicesUIDynamic5Video_videoUrl, v39, v29);
    type metadata accessor for Artwork();
    v42 = v111;
    OUTLINED_FUNCTION_16_19();
    v43 = v108;
    v44 = *(void (**)(char *, uint64_t, uint64_t))(v109 + 16);
    v44(v93, v108, v110);
    v45 = v95;
    Artwork.__allocating_init(deserializing:using:)();
    v47 = v42;
    v102 = (void (*)(uint64_t, uint64_t))v44;
    if (v45)
    {

      v46 = 0;
    }
    v95 = 0;
    v48 = v97;
    *(_QWORD *)((char *)v40 + OBJC_IVAR____TtC27AppleMediaServicesUIDynamic5Video_preview) = v46;
    v49 = v92;
    OUTLINED_FUNCTION_20_7();
    OUTLINED_FUNCTION_15_14();
    v50 = v107;
    v51 = v104;
    v104(v49, v107);
    OUTLINED_FUNCTION_9_19();
    *((_BYTE *)v40 + OBJC_IVAR____TtC27AppleMediaServicesUIDynamic5Video_allowsAutoPlay) = v52 & 1;
    OUTLINED_FUNCTION_20_7();
    OUTLINED_FUNCTION_15_14();
    OUTLINED_FUNCTION_5_25();
    OUTLINED_FUNCTION_9_19();
    *((_BYTE *)v40 + OBJC_IVAR____TtC27AppleMediaServicesUIDynamic5Video_looping) = v53 & 1;
    OUTLINED_FUNCTION_20_7();
    OUTLINED_FUNCTION_15_14();
    OUTLINED_FUNCTION_5_25();
    OUTLINED_FUNCTION_9_19();
    *((_BYTE *)v40 + OBJC_IVAR____TtC27AppleMediaServicesUIDynamic5Video_canPlayFullScreen) = v54 & 1;
    OUTLINED_FUNCTION_0_63();
    v55 = sub_1B9DE1818();
    v51(v48, v50);
    if ((v55 & 1) != 0)
    {
      v56 = v110;
      v57 = v43;
      v58 = 15;
    }
    else
    {
      OUTLINED_FUNCTION_0_63();
      v59 = v103;
      v57 = v43;
      v56 = v110;
      v102(v103, v43);
      v58 = VideoControls.init(deserializing:using:)(v48, v59);
    }
    v60 = v47;
    v61 = OBJC_IVAR____TtC27AppleMediaServicesUIDynamic5Video_playbackControls;
    *(_QWORD *)((char *)v40 + OBJC_IVAR____TtC27AppleMediaServicesUIDynamic5Video_playbackControls) = v58;
    OUTLINED_FUNCTION_3_34();
    v62 = sub_1B9DE1818();
    v104(v48, v107);
    if ((v62 & 1) != 0)
    {
      v63 = *(_QWORD *)((char *)v40 + v61);
      v64 = v40;
      v65 = v47;
      v67 = (void (*)(uint64_t, uint64_t, uint64_t))v102;
      v66 = v103;
    }
    else
    {
      OUTLINED_FUNCTION_3_34();
      v68 = v103;
      v69 = v56;
      v67 = (void (*)(uint64_t, uint64_t, uint64_t))v102;
      ((void (*)(uint64_t, uint64_t, uint64_t))v102)(v103, v57, v69);
      v63 = VideoControls.init(deserializing:using:)(v48, v68);
      v64 = v40;
      v66 = v68;
      v65 = v60;
    }
    *(_QWORD *)((char *)v64 + OBJC_IVAR____TtC27AppleMediaServicesUIDynamic5Video_autoPlayPlaybackControls) = v63;
    sub_1B9DE198C();
    sub_1B9DE1854();
    v70 = v110;
    v67(v66, v57, v110);
    v71 = v57;
    v72 = v48;
    v73 = v65;
    v74 = v66;
    v75 = v98;
    OUTLINED_FUNCTION_13_14();
    sub_1B9DE1B60();
    sub_1B9DC7B28(v75, (uint64_t)v113 + OBJC_IVAR____TtC27AppleMediaServicesUIDynamic5Video_templateMediaEvent);
    v37 = v113;
    OUTLINED_FUNCTION_16_19();
    v76 = v71;
    v77 = v70;
    ((void (*)(uint64_t, uint64_t, uint64_t))v102)(v74, v76, v70);
    OUTLINED_FUNCTION_13_14();
    sub_1B9DE1B60();
    sub_1B9DC7B28(v75, (uint64_t)v37 + OBJC_IVAR____TtC27AppleMediaServicesUIDynamic5Video_templateClickEvent);
    v78 = v99;
    sub_1B9DE159C();
    v79 = sub_1B9DE1590();
    v81 = v80;
    (*(void (**)(uint64_t, uint64_t))(v100 + 8))(v78, v101);
    v82 = (_QWORD *)((char *)v37 + OBJC_IVAR____TtC27AppleMediaServicesUIDynamic5Video_playbackId);
    *v82 = v79;
    v82[1] = v81;
    OUTLINED_FUNCTION_16_19();
    v83 = sub_1B9DE1824();
    v85 = v84;
    (*(void (**)(uint64_t, uint64_t))(v109 + 8))(v108, v77);
    v86 = v107;
    v87 = v104;
    v104((uint64_t)v73, v107);
    v87(v72, v86);
    (*(void (**)(uint64_t, uint64_t))(v106 + 8))(v105, v90);
    v37[2] = v83;
    v37[3] = v85;
  }
  return v37;
}

uint64_t type metadata accessor for Video()
{
  uint64_t result;

  result = qword_1EF2438D0;
  if (!qword_1EF2438D0)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_1B9DC7B28(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EF243CA0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t Video.id.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 16);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t Video.videoUrl.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;

  v3 = v1 + OBJC_IVAR____TtC27AppleMediaServicesUIDynamic5Video_videoUrl;
  v4 = OUTLINED_FUNCTION_2_4();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a1, v3, v4);
}

uint64_t Video.preview.getter()
{
  return swift_retain();
}

uint64_t Video.allowsAutoPlay.getter()
{
  return OUTLINED_FUNCTION_12_21(OBJC_IVAR____TtC27AppleMediaServicesUIDynamic5Video_allowsAutoPlay);
}

uint64_t Video.looping.getter()
{
  return OUTLINED_FUNCTION_12_21(OBJC_IVAR____TtC27AppleMediaServicesUIDynamic5Video_looping);
}

uint64_t Video.canPlayFullScreen.getter()
{
  return OUTLINED_FUNCTION_12_21(OBJC_IVAR____TtC27AppleMediaServicesUIDynamic5Video_canPlayFullScreen);
}

uint64_t Video.playbackControls.getter()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + OBJC_IVAR____TtC27AppleMediaServicesUIDynamic5Video_playbackControls);
}

uint64_t Video.autoPlayPlaybackControls.getter()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + OBJC_IVAR____TtC27AppleMediaServicesUIDynamic5Video_autoPlayPlaybackControls);
}

uint64_t Video.playbackId.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + OBJC_IVAR____TtC27AppleMediaServicesUIDynamic5Video_playbackId);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t Video.templateMediaEvent.getter@<X0>(uint64_t a1@<X8>)
{
  return OUTLINED_FUNCTION_6_22(a1, OBJC_IVAR____TtC27AppleMediaServicesUIDynamic5Video_templateMediaEvent);
}

uint64_t Video.templateClickEvent.getter@<X0>(uint64_t a1@<X8>)
{
  return OUTLINED_FUNCTION_6_22(a1, OBJC_IVAR____TtC27AppleMediaServicesUIDynamic5Video_templateClickEvent);
}

BOOL static Video.== infix(_:_:)(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  _BOOL8 result;
  uint64_t v7;
  char v8;
  char v9;

  if ((MEMORY[0x1BCCCD2B8](a1 + OBJC_IVAR____TtC27AppleMediaServicesUIDynamic5Video_videoUrl, a2 + OBJC_IVAR____TtC27AppleMediaServicesUIDynamic5Video_videoUrl) & 1) == 0)return 0;
  v4 = *(_QWORD *)(a1 + OBJC_IVAR____TtC27AppleMediaServicesUIDynamic5Video_preview);
  v5 = *(_QWORD *)(a2 + OBJC_IVAR____TtC27AppleMediaServicesUIDynamic5Video_preview);
  result = (v4 | v5) == 0;
  if (v4)
  {
    if (v5)
    {
      type metadata accessor for Artwork();
      swift_retain();
      v7 = swift_retain();
      static Artwork.== infix(_:_:)(v7, v5);
      v9 = v8;
      swift_release();
      swift_release();
      return v9 & 1;
    }
  }
  return result;
}

uint64_t Video.deinit()
{
  uint64_t v0;
  uint64_t v1;

  swift_bridgeObjectRelease();
  v1 = OUTLINED_FUNCTION_2_4();
  OUTLINED_FUNCTION_6_10(v1);
  swift_release();
  swift_bridgeObjectRelease();
  sub_1B9DA9A90(v0 + OBJC_IVAR____TtC27AppleMediaServicesUIDynamic5Video_templateMediaEvent, (uint64_t *)&unk_1EF243CA0);
  sub_1B9DA9A90(v0 + OBJC_IVAR____TtC27AppleMediaServicesUIDynamic5Video_templateClickEvent, (uint64_t *)&unk_1EF243CA0);
  return v0;
}

uint64_t Video.__deallocating_deinit()
{
  Video.deinit();
  return swift_deallocClassInstance();
}

uint64_t sub_1B9DC7DE0@<X0>(char *a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  uint64_t v3;
  uint64_t result;

  result = Video.__allocating_init(deserializing:using:)(a1, a2);
  if (!v3)
    *a3 = result;
  return result;
}

BOOL sub_1B9DC7E08(uint64_t *a1, uint64_t *a2)
{
  return static Video.== infix(_:_:)(*a1, *a2);
}

uint64_t sub_1B9DC7E28()
{
  return type metadata accessor for Video();
}

void sub_1B9DC7E30()
{
  unint64_t v0;
  unint64_t v1;

  sub_1B9DE1554();
  if (v0 <= 0x3F)
  {
    sub_1B9DC7EF4();
    if (v1 <= 0x3F)
      swift_updateClassMetadata2();
  }
}

void sub_1B9DC7EF4()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_1EF243E30)
  {
    sub_1B9DE198C();
    v0 = sub_1B9DE25BC();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_1EF243E30);
  }
}

uint64_t OUTLINED_FUNCTION_0_63()
{
  return sub_1B9DE1854();
}

uint64_t OUTLINED_FUNCTION_3_34()
{
  return sub_1B9DE1854();
}

uint64_t OUTLINED_FUNCTION_5_25()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t (*v2)(uint64_t, uint64_t);

  return v2(v0, v1);
}

uint64_t OUTLINED_FUNCTION_6_22@<X0>(uint64_t a1@<X1>, uint64_t a2@<X8>)
{
  uint64_t v2;

  return sub_1B9DC7190(v2 + a2, a1);
}

uint64_t OUTLINED_FUNCTION_12_21@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return *(unsigned __int8 *)(v1 + a1);
}

uint64_t OUTLINED_FUNCTION_13_14()
{
  uint64_t v0;

  return v0;
}

uint64_t OUTLINED_FUNCTION_15_14()
{
  return sub_1B9DE17F4();
}

uint64_t OUTLINED_FUNCTION_16_19()
{
  return sub_1B9DE1854();
}

uint64_t VideoFillMode.contentMode.getter(char a1)
{
  if ((a1 & 1) != 0)
    return 2;
  else
    return 1;
}

id VideoFillMode.videoGravity.getter(char a1)
{
  id *v1;

  v1 = (id *)MEMORY[0x1E0C8A6E0];
  if ((a1 & 1) == 0)
    v1 = (id *)MEMORY[0x1E0C8A6D8];
  return *v1;
}

BOOL static VideoFillMode.__derived_enum_equals(_:_:)(int a1, int a2)
{
  return ((a2 ^ a1) & 1) == 0;
}

void VideoFillMode.hash(into:)()
{
  sub_1B9DE2958();
  OUTLINED_FUNCTION_1();
}

uint64_t VideoFillMode.hashValue.getter()
{
  sub_1B9DE294C();
  sub_1B9DE2958();
  return sub_1B9DE297C();
}

BOOL sub_1B9DC8088(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return static VideoFillMode.__derived_enum_equals(_:_:)(*a1, *a2);
}

uint64_t sub_1B9DC8094()
{
  return VideoFillMode.hashValue.getter();
}

void sub_1B9DC809C()
{
  VideoFillMode.hash(into:)();
}

uint64_t VideoConfiguration.fillMode.getter()
{
  unsigned __int8 *v0;

  return *v0;
}

uint64_t VideoConfiguration.fillMode.setter(uint64_t result)
{
  _BYTE *v1;

  *v1 = result & 1;
  return result;
}

uint64_t (*VideoConfiguration.fillMode.modify())(_QWORD)
{
  return nullsub_1;
}

uint64_t VideoConfiguration.aspectRatio.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;

  v3 = v1 + *(int *)(OUTLINED_FUNCTION_0_64() + 20);
  return sub_1B9DC812C(v3, a1);
}

uint64_t type metadata accessor for VideoConfiguration()
{
  uint64_t result;

  result = qword_1EF243A28;
  if (!qword_1EF243A28)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_1B9DC812C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF2439B0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t VideoConfiguration.aspectRatio.setter(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;

  v3 = v1 + *(int *)(OUTLINED_FUNCTION_0_64() + 20);
  return sub_1B9DC81A0(a1, v3);
}

uint64_t sub_1B9DC81A0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF2439B0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t (*VideoConfiguration.aspectRatio.modify())(_QWORD)
{
  OUTLINED_FUNCTION_0_64();
  return nullsub_1;
}

uint64_t VideoConfiguration.playbackControls.getter()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + *(int *)(OUTLINED_FUNCTION_0_64() + 24));
}

void VideoConfiguration.playbackControls.setter(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(v1 + *(int *)(OUTLINED_FUNCTION_0_64() + 24)) = a1;
  OUTLINED_FUNCTION_1();
}

uint64_t (*VideoConfiguration.playbackControls.modify())(_QWORD)
{
  OUTLINED_FUNCTION_0_64();
  return nullsub_1;
}

uint64_t VideoConfiguration.autoPlayPlaybackControls.getter()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + *(int *)(OUTLINED_FUNCTION_0_64() + 28));
}

void VideoConfiguration.autoPlayPlaybackControls.setter(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(v1 + *(int *)(OUTLINED_FUNCTION_0_64() + 28)) = a1;
  OUTLINED_FUNCTION_1();
}

uint64_t (*VideoConfiguration.autoPlayPlaybackControls.modify())(_QWORD)
{
  OUTLINED_FUNCTION_0_64();
  return nullsub_1;
}

uint64_t VideoConfiguration.canPlayFullScreen.getter()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + *(int *)(OUTLINED_FUNCTION_0_64() + 32));
}

void VideoConfiguration.canPlayFullScreen.setter(char a1)
{
  uint64_t v1;

  *(_BYTE *)(v1 + *(int *)(OUTLINED_FUNCTION_0_64() + 32)) = a1;
  OUTLINED_FUNCTION_1();
}

uint64_t (*VideoConfiguration.canPlayFullScreen.modify())(_QWORD)
{
  OUTLINED_FUNCTION_0_64();
  return nullsub_1;
}

uint64_t VideoConfiguration.allowsAutoPlay.getter()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + *(int *)(OUTLINED_FUNCTION_0_64() + 36));
}

void VideoConfiguration.allowsAutoPlay.setter(char a1)
{
  uint64_t v1;

  *(_BYTE *)(v1 + *(int *)(OUTLINED_FUNCTION_0_64() + 36)) = a1;
  OUTLINED_FUNCTION_1();
}

uint64_t (*VideoConfiguration.allowsAutoPlay.modify())(_QWORD)
{
  OUTLINED_FUNCTION_0_64();
  return nullsub_1;
}

uint64_t VideoConfiguration.looping.getter()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + *(int *)(OUTLINED_FUNCTION_0_64() + 40));
}

void VideoConfiguration.looping.setter(char a1)
{
  uint64_t v1;

  *(_BYTE *)(v1 + *(int *)(OUTLINED_FUNCTION_0_64() + 40)) = a1;
  OUTLINED_FUNCTION_1();
}

uint64_t (*VideoConfiguration.looping.modify())(_QWORD)
{
  OUTLINED_FUNCTION_0_64();
  return nullsub_1;
}

uint64_t VideoConfiguration.roundedCorners.getter()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + *(int *)(OUTLINED_FUNCTION_0_64() + 44));
}

void VideoConfiguration.roundedCorners.setter(char a1)
{
  uint64_t v1;

  *(_BYTE *)(v1 + *(int *)(OUTLINED_FUNCTION_0_64() + 44)) = a1;
  OUTLINED_FUNCTION_1();
}

uint64_t (*VideoConfiguration.roundedCorners.modify())(_QWORD)
{
  OUTLINED_FUNCTION_0_64();
  return nullsub_1;
}

uint64_t VideoConfiguration.deviceCornerRadiusFactor.getter()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + *(int *)(OUTLINED_FUNCTION_0_64() + 48));
}

void VideoConfiguration.deviceCornerRadiusFactor.setter(uint64_t a1, char a2)
{
  uint64_t v2;
  uint64_t v5;

  v5 = v2 + *(int *)(OUTLINED_FUNCTION_0_64() + 48);
  *(_QWORD *)v5 = a1;
  *(_BYTE *)(v5 + 8) = a2 & 1;
  OUTLINED_FUNCTION_1_7();
}

uint64_t (*VideoConfiguration.deviceCornerRadiusFactor.modify())(_QWORD)
{
  OUTLINED_FUNCTION_0_64();
  return nullsub_1;
}

uint64_t VideoConfiguration.init(fillMode:aspectRatio:playbackControls:autoPlayPlaybackControls:canPlayFullScreen:allowsAutoPlay:looping:roundedCorners:deviceCornerRadiusFactor:)@<X0>(char a1@<W0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, char a5@<W4>, char a6@<W5>, char a7@<W6>, char a8@<W7>, _BYTE *a9@<X8>, uint64_t a10, char a11)
{
  char v16;
  int *v17;
  uint64_t v18;
  uint64_t v19;
  _BYTE *v20;
  uint64_t result;

  v16 = a1 & 1;
  v17 = (int *)OUTLINED_FUNCTION_0_64();
  v18 = (uint64_t)&a9[v17[5]];
  v19 = OUTLINED_FUNCTION_16_20();
  __swift_storeEnumTagSinglePayload(v18, 1, 1, v19);
  v20 = &a9[v17[12]];
  *(_QWORD *)v20 = 0;
  v20[8] = 1;
  *a9 = v16;
  result = sub_1B9DC81A0(a2, v18);
  *(_QWORD *)&a9[v17[6]] = a3;
  *(_QWORD *)&a9[v17[7]] = a4;
  a9[v17[8]] = a5;
  a9[v17[9]] = a6;
  a9[v17[10]] = a7;
  a9[v17[11]] = a8;
  *(_QWORD *)v20 = a10;
  v20[8] = a11 & 1;
  return result;
}

uint64_t static VideoConfiguration.defaultConfiguration.getter@<X0>(_BYTE *a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  char *v4;
  int *v5;
  uint64_t v6;
  _BYTE *v7;
  uint64_t result;
  uint64_t v9;

  __swift_instantiateConcreteTypeFromMangledName(&qword_1EF2439B0);
  OUTLINED_FUNCTION_39();
  MEMORY[0x1E0C80A78](v2);
  v4 = (char *)&v9 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  OUTLINED_FUNCTION_16_20();
  OUTLINED_FUNCTION_12_22((uint64_t)v4);
  v5 = (int *)OUTLINED_FUNCTION_0_64();
  v6 = (uint64_t)&a1[v5[5]];
  OUTLINED_FUNCTION_12_22(v6);
  v7 = &a1[v5[12]];
  *(_QWORD *)v7 = 0;
  v7[8] = 1;
  *a1 = 1;
  result = sub_1B9DC81A0((uint64_t)v4, v6);
  *(_QWORD *)&a1[v5[6]] = 15;
  *(_QWORD *)&a1[v5[7]] = 15;
  a1[v5[8]] = 0;
  a1[v5[9]] = 1;
  a1[v5[10]] = 1;
  a1[v5[11]] = 0;
  *(_QWORD *)v7 = 0;
  v7[8] = 1;
  return result;
}

uint64_t static VideoConfiguration.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
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
  char *v38;
  uint64_t v39;
  uint64_t v40;
  char *v41;
  uint64_t v42;
  uint64_t v43;
  char *v44;
  uint64_t v45;
  char *v46;
  int v47;
  int v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  char *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v61;
  uint64_t v62;
  char v63;
  void (*v64)(uint64_t, uint64_t);
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
  BOOL v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  int v82;
  uint64_t v83;
  int v84;
  int *v85;
  int v86;
  int *v87;
  int v88;
  int *v89;
  uint64_t v90;
  double v91;
  char v92;
  char *v93;
  double v94;
  char *v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  int *v99;
  uint64_t v100;
  unsigned __int8 *v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  char *v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;

  v100 = OUTLINED_FUNCTION_16_20();
  v98 = *(_QWORD *)(v100 - 8);
  MEMORY[0x1E0C80A78](v100);
  OUTLINED_FUNCTION_17_5();
  v96 = v4;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EF2439B0);
  OUTLINED_FUNCTION_39();
  MEMORY[0x1E0C80A78](v5);
  OUTLINED_FUNCTION_17_5();
  v97 = v6;
  v99 = (int *)__swift_instantiateConcreteTypeFromMangledName(&qword_1EF2439B8);
  OUTLINED_FUNCTION_39();
  MEMORY[0x1E0C80A78](v7);
  v9 = (char *)&v95 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = OUTLINED_FUNCTION_0_64();
  OUTLINED_FUNCTION_39();
  MEMORY[0x1E0C80A78](v11);
  v105 = (char *)&v95 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  OUTLINED_FUNCTION_7_23();
  MEMORY[0x1E0C80A78](v13);
  OUTLINED_FUNCTION_10_18();
  v104 = v14;
  OUTLINED_FUNCTION_7_23();
  MEMORY[0x1E0C80A78](v15);
  OUTLINED_FUNCTION_10_18();
  v103 = v16;
  OUTLINED_FUNCTION_7_23();
  MEMORY[0x1E0C80A78](v17);
  OUTLINED_FUNCTION_10_18();
  v102 = v18;
  OUTLINED_FUNCTION_7_23();
  MEMORY[0x1E0C80A78](v19);
  OUTLINED_FUNCTION_10_18();
  v113 = v20;
  OUTLINED_FUNCTION_7_23();
  MEMORY[0x1E0C80A78](v21);
  OUTLINED_FUNCTION_10_18();
  v112 = v22;
  OUTLINED_FUNCTION_7_23();
  MEMORY[0x1E0C80A78](v23);
  OUTLINED_FUNCTION_10_18();
  v111 = v24;
  OUTLINED_FUNCTION_7_23();
  MEMORY[0x1E0C80A78](v25);
  OUTLINED_FUNCTION_10_18();
  v110 = v26;
  OUTLINED_FUNCTION_7_23();
  MEMORY[0x1E0C80A78](v27);
  OUTLINED_FUNCTION_10_18();
  v109 = v28;
  OUTLINED_FUNCTION_7_23();
  MEMORY[0x1E0C80A78](v29);
  OUTLINED_FUNCTION_10_18();
  v108 = v30;
  OUTLINED_FUNCTION_7_23();
  MEMORY[0x1E0C80A78](v31);
  OUTLINED_FUNCTION_10_18();
  v107 = v32;
  OUTLINED_FUNCTION_7_23();
  MEMORY[0x1E0C80A78](v33);
  OUTLINED_FUNCTION_10_18();
  v106 = v34;
  OUTLINED_FUNCTION_7_23();
  v36 = MEMORY[0x1E0C80A78](v35);
  v38 = (char *)&v95 - v37;
  v39 = MEMORY[0x1E0C80A78](v36);
  v41 = (char *)&v95 - v40;
  v42 = MEMORY[0x1E0C80A78](v39);
  v44 = (char *)&v95 - v43;
  MEMORY[0x1E0C80A78](v42);
  v46 = (char *)&v95 - v45;
  v47 = *a1;
  v48 = *a2;
  OUTLINED_FUNCTION_13_15((uint64_t)a1);
  v101 = a2;
  sub_1B9DC8D90((uint64_t)a2, (uint64_t)v44);
  if (v47 != v48)
  {
    OUTLINED_FUNCTION_9_20();
    OUTLINED_FUNCTION_10_19();
LABEL_9:
    v57 = v102;
    v56 = v103;
    v53 = (uint64_t)v101;
    OUTLINED_FUNCTION_3_35((uint64_t)a1);
    OUTLINED_FUNCTION_4_32(v53);
LABEL_10:
    OUTLINED_FUNCTION_7_24();
    OUTLINED_FUNCTION_6_23();
    OUTLINED_FUNCTION_3_35((uint64_t)a1);
    OUTLINED_FUNCTION_4_32(v53);
LABEL_11:
    OUTLINED_FUNCTION_7_24();
    OUTLINED_FUNCTION_6_23();
    OUTLINED_FUNCTION_3_35((uint64_t)a1);
    sub_1B9DC8D90(v53, v109);
LABEL_12:
    OUTLINED_FUNCTION_21_12();
    OUTLINED_FUNCTION_6_23();
    OUTLINED_FUNCTION_11_21();
    OUTLINED_FUNCTION_3_35(v53);
LABEL_13:
    OUTLINED_FUNCTION_6_23();
    OUTLINED_FUNCTION_21_12();
    OUTLINED_FUNCTION_4_32((uint64_t)a1);
    OUTLINED_FUNCTION_17_17(v53);
LABEL_14:
    OUTLINED_FUNCTION_20_10();
    OUTLINED_FUNCTION_7_24();
    OUTLINED_FUNCTION_15_15();
    OUTLINED_FUNCTION_18_16();
LABEL_15:
    sub_1B9DC8DD4(v56);
    sub_1B9DC8DD4(v57);
    OUTLINED_FUNCTION_14_16();
    OUTLINED_FUNCTION_13_15(v53);
LABEL_16:
    OUTLINED_FUNCTION_10_19();
    OUTLINED_FUNCTION_9_20();
    return 0;
  }
  v49 = *(int *)(v10 + 20);
  v50 = (uint64_t)&v44[v49];
  v51 = (uint64_t)&v9[v99[12]];
  sub_1B9DC812C((uint64_t)&v46[v49], (uint64_t)v9);
  sub_1B9DC812C(v50, v51);
  v52 = v100;
  if (__swift_getEnumTagSinglePayload((uint64_t)v9, 1, v100) == 1)
  {
    OUTLINED_FUNCTION_9_20();
    OUTLINED_FUNCTION_10_19();
    if (__swift_getEnumTagSinglePayload(v51, 1, v52) == 1)
    {
      v99 = (int *)v10;
      sub_1B9D4A5CC((uint64_t)v9, &qword_1EF2439B0);
      OUTLINED_FUNCTION_3_35((uint64_t)a1);
      v53 = (uint64_t)v101;
      OUTLINED_FUNCTION_4_32((uint64_t)v101);
      v55 = v104;
      v54 = v105;
      v57 = v102;
      v56 = v103;
      goto LABEL_19;
    }
LABEL_8:
    sub_1B9D4A5CC((uint64_t)v9, &qword_1EF2439B8);
    goto LABEL_9;
  }
  v58 = v97;
  sub_1B9DC812C((uint64_t)v9, v97);
  if (__swift_getEnumTagSinglePayload(v51, 1, v52) == 1)
  {
    OUTLINED_FUNCTION_9_20();
    OUTLINED_FUNCTION_10_19();
    (*(void (**)(uint64_t, uint64_t))(v98 + 8))(v58, v52);
    goto LABEL_8;
  }
  v99 = (int *)v10;
  v61 = v96;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v98 + 32))(v96, v51, v52);
  sub_1B9DC8E10();
  v95 = v9;
  v62 = v58;
  v63 = sub_1B9DE2130();
  v64 = *(void (**)(uint64_t, uint64_t))(v98 + 8);
  v64(v61, v52);
  OUTLINED_FUNCTION_9_20();
  OUTLINED_FUNCTION_10_19();
  v64(v62, v52);
  sub_1B9D4A5CC((uint64_t)v95, &qword_1EF2439B0);
  OUTLINED_FUNCTION_3_35((uint64_t)a1);
  v53 = (uint64_t)v101;
  OUTLINED_FUNCTION_4_32((uint64_t)v101);
  v55 = v104;
  v54 = v105;
  v57 = v102;
  v56 = v103;
  if ((v63 & 1) == 0)
    goto LABEL_10;
LABEL_19:
  v65 = v99[6];
  v66 = *(_QWORD *)&v41[v65];
  v67 = *(_QWORD *)&v38[v65];
  OUTLINED_FUNCTION_7_24();
  OUTLINED_FUNCTION_6_23();
  v68 = v106;
  OUTLINED_FUNCTION_3_35((uint64_t)a1);
  v69 = v107;
  OUTLINED_FUNCTION_4_32(v53);
  if (v66 != v67)
    goto LABEL_11;
  v70 = v99[7];
  v71 = *(_QWORD *)(v68 + v70);
  v72 = *(_QWORD *)(v69 + v70);
  OUTLINED_FUNCTION_7_24();
  OUTLINED_FUNCTION_20_10();
  v73 = v108;
  OUTLINED_FUNCTION_4_32((uint64_t)a1);
  v74 = v109;
  OUTLINED_FUNCTION_17_17(v53);
  v75 = v71 == v72;
  v76 = v73;
  v77 = v74;
  v79 = v112;
  v78 = v113;
  if (!v75)
    goto LABEL_12;
  LODWORD(v107) = *(unsigned __int8 *)(v76 + v99[8]);
  OUTLINED_FUNCTION_6_23();
  LODWORD(v108) = *(unsigned __int8 *)(v77 + v99[8]);
  OUTLINED_FUNCTION_21_12();
  OUTLINED_FUNCTION_11_21();
  v80 = v111;
  OUTLINED_FUNCTION_3_35(v53);
  if ((_DWORD)v107 != (_DWORD)v108)
    goto LABEL_13;
  v81 = v77;
  v82 = *(unsigned __int8 *)(v77 + v99[9]);
  sub_1B9DC8DD4(v81);
  v83 = v80;
  v84 = *(unsigned __int8 *)(v80 + v99[9]);
  sub_1B9DC8DD4(v83);
  OUTLINED_FUNCTION_4_32((uint64_t)a1);
  OUTLINED_FUNCTION_17_17(v53);
  if (v82 != v84)
    goto LABEL_14;
  v85 = v99;
  v86 = *(unsigned __int8 *)(v79 + v99[10]);
  OUTLINED_FUNCTION_7_24();
  LODWORD(v85) = *(unsigned __int8 *)(v78 + v85[10]);
  OUTLINED_FUNCTION_20_10();
  OUTLINED_FUNCTION_15_15();
  OUTLINED_FUNCTION_18_16();
  if (v86 != (_DWORD)v85)
    goto LABEL_15;
  v87 = v99;
  v88 = *(unsigned __int8 *)(v57 + v99[11]);
  sub_1B9DC8DD4(v57);
  LODWORD(v87) = *(unsigned __int8 *)(v56 + v87[11]);
  sub_1B9DC8DD4(v56);
  OUTLINED_FUNCTION_14_16();
  OUTLINED_FUNCTION_13_15(v53);
  if (v88 != (_DWORD)v87)
    goto LABEL_16;
  v89 = v99;
  v90 = v55 + v99[12];
  v91 = *(double *)v90;
  v92 = *(_BYTE *)(v90 + 8);
  OUTLINED_FUNCTION_9_20();
  v93 = &v54[v89[12]];
  v94 = *(double *)v93;
  v59 = v93[8];
  OUTLINED_FUNCTION_10_19();
  if ((v92 & 1) == 0)
    return (v91 == v94) & ~(_DWORD)v59;
  return v59;
}

uint64_t sub_1B9DC8D90(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for VideoConfiguration();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_1B9DC8DD4(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata accessor for VideoConfiguration();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_1B9DC8E10()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1EF2439C0;
  if (!qword_1EF2439C0)
  {
    v1 = sub_1B9DE1674();
    result = MEMORY[0x1BCCCEEA8](MEMORY[0x1E0D41A38], v1);
    atomic_store(result, (unint64_t *)&qword_1EF2439C0);
  }
  return result;
}

unint64_t sub_1B9DC8E54()
{
  unint64_t result;

  result = qword_1EF2439C8;
  if (!qword_1EF2439C8)
  {
    result = MEMORY[0x1BCCCEEA8](&protocol conformance descriptor for VideoFillMode, &type metadata for VideoFillMode);
    atomic_store(result, (unint64_t *)&qword_1EF2439C8);
  }
  return result;
}

uint64_t storeEnumTagSinglePayload for VideoFillMode(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_1B9DC8EE0 + 4 * byte_1B9DF5485[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_1B9DC8F14 + 4 * byte_1B9DF5480[v4]))();
}

uint64_t sub_1B9DC8F14(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_1B9DC8F1C(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x1B9DC8F24);
  return result;
}

uint64_t sub_1B9DC8F30(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x1B9DC8F38);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_1B9DC8F3C(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1B9DC8F44(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for VideoFillMode()
{
  return &type metadata for VideoFillMode;
}

_QWORD *initializeBufferWithCopyOfBuffer for VideoConfiguration(_BYTE *a1, _QWORD *a2, int *a3)
{
  _QWORD *v4;
  int v5;
  uint64_t v7;
  _BYTE *v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  char *v18;

  v4 = a1;
  v5 = *(_DWORD *)(*((_QWORD *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v12 = *a2;
    *v4 = *a2;
    v4 = (_QWORD *)(v12 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    *a1 = *(_BYTE *)a2;
    v7 = a3[5];
    v8 = &a1[v7];
    v9 = (char *)a2 + v7;
    v10 = sub_1B9DE1674();
    if (__swift_getEnumTagSinglePayload((uint64_t)v9, 1, v10))
    {
      v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF2439B0);
      memcpy(v8, v9, *(_QWORD *)(*(_QWORD *)(v11 - 8) + 64));
    }
    else
    {
      (*(void (**)(_BYTE *, char *, uint64_t))(*(_QWORD *)(v10 - 8) + 16))(v8, v9, v10);
      __swift_storeEnumTagSinglePayload((uint64_t)v8, 0, 1, v10);
    }
    v13 = a3[7];
    *(_QWORD *)((char *)v4 + a3[6]) = *(_QWORD *)((char *)a2 + a3[6]);
    *(_QWORD *)((char *)v4 + v13) = *(_QWORD *)((char *)a2 + v13);
    v14 = a3[9];
    *((_BYTE *)v4 + a3[8]) = *((_BYTE *)a2 + a3[8]);
    *((_BYTE *)v4 + v14) = *((_BYTE *)a2 + v14);
    v15 = a3[11];
    *((_BYTE *)v4 + a3[10]) = *((_BYTE *)a2 + a3[10]);
    *((_BYTE *)v4 + v15) = *((_BYTE *)a2 + v15);
    v16 = a3[12];
    v17 = (char *)v4 + v16;
    v18 = (char *)a2 + v16;
    *(_QWORD *)v17 = *(_QWORD *)v18;
    v17[8] = v18[8];
  }
  return v4;
}

uint64_t destroy for VideoConfiguration(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t result;

  v2 = a1 + *(int *)(a2 + 20);
  v3 = sub_1B9DE1674();
  result = __swift_getEnumTagSinglePayload(v2, 1, v3);
  if (!(_DWORD)result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(v2, v3);
  return result;
}

_BYTE *initializeWithCopy for VideoConfiguration(_BYTE *a1, _BYTE *a2, int *a3)
{
  uint64_t v6;
  _BYTE *v7;
  _BYTE *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _BYTE *v15;
  _BYTE *v16;

  *a1 = *a2;
  v6 = a3[5];
  v7 = &a1[v6];
  v8 = &a2[v6];
  v9 = sub_1B9DE1674();
  if (__swift_getEnumTagSinglePayload((uint64_t)v8, 1, v9))
  {
    v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF2439B0);
    memcpy(v7, v8, *(_QWORD *)(*(_QWORD *)(v10 - 8) + 64));
  }
  else
  {
    (*(void (**)(_BYTE *, _BYTE *, uint64_t))(*(_QWORD *)(v9 - 8) + 16))(v7, v8, v9);
    __swift_storeEnumTagSinglePayload((uint64_t)v7, 0, 1, v9);
  }
  v11 = a3[7];
  *(_QWORD *)&a1[a3[6]] = *(_QWORD *)&a2[a3[6]];
  *(_QWORD *)&a1[v11] = *(_QWORD *)&a2[v11];
  v12 = a3[9];
  a1[a3[8]] = a2[a3[8]];
  a1[v12] = a2[v12];
  v13 = a3[11];
  a1[a3[10]] = a2[a3[10]];
  a1[v13] = a2[v13];
  v14 = a3[12];
  v15 = &a1[v14];
  v16 = &a2[v14];
  *(_QWORD *)v15 = *(_QWORD *)v16;
  v15[8] = v16[8];
  return a1;
}

_BYTE *assignWithCopy for VideoConfiguration(_BYTE *a1, _BYTE *a2, int *a3)
{
  uint64_t v6;
  _BYTE *v7;
  _BYTE *v8;
  uint64_t v9;
  int EnumTagSinglePayload;
  int v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _BYTE *v15;
  _BYTE *v16;
  uint64_t v17;

  *a1 = *a2;
  v6 = a3[5];
  v7 = &a1[v6];
  v8 = &a2[v6];
  v9 = sub_1B9DE1674();
  EnumTagSinglePayload = __swift_getEnumTagSinglePayload((uint64_t)v7, 1, v9);
  v11 = __swift_getEnumTagSinglePayload((uint64_t)v8, 1, v9);
  if (!EnumTagSinglePayload)
  {
    v12 = *(_QWORD *)(v9 - 8);
    if (!v11)
    {
      (*(void (**)(_BYTE *, _BYTE *, uint64_t))(v12 + 24))(v7, v8, v9);
      goto LABEL_7;
    }
    (*(void (**)(_BYTE *, uint64_t))(v12 + 8))(v7, v9);
    goto LABEL_6;
  }
  if (v11)
  {
LABEL_6:
    v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF2439B0);
    memcpy(v7, v8, *(_QWORD *)(*(_QWORD *)(v13 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(_BYTE *, _BYTE *, uint64_t))(*(_QWORD *)(v9 - 8) + 16))(v7, v8, v9);
  __swift_storeEnumTagSinglePayload((uint64_t)v7, 0, 1, v9);
LABEL_7:
  *(_QWORD *)&a1[a3[6]] = *(_QWORD *)&a2[a3[6]];
  *(_QWORD *)&a1[a3[7]] = *(_QWORD *)&a2[a3[7]];
  a1[a3[8]] = a2[a3[8]];
  a1[a3[9]] = a2[a3[9]];
  a1[a3[10]] = a2[a3[10]];
  a1[a3[11]] = a2[a3[11]];
  v14 = a3[12];
  v15 = &a1[v14];
  v16 = &a2[v14];
  v17 = *(_QWORD *)v16;
  v15[8] = v16[8];
  *(_QWORD *)v15 = v17;
  return a1;
}

_BYTE *initializeWithTake for VideoConfiguration(_BYTE *a1, _BYTE *a2, int *a3)
{
  uint64_t v6;
  _BYTE *v7;
  _BYTE *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _BYTE *v15;
  _BYTE *v16;

  *a1 = *a2;
  v6 = a3[5];
  v7 = &a1[v6];
  v8 = &a2[v6];
  v9 = sub_1B9DE1674();
  if (__swift_getEnumTagSinglePayload((uint64_t)v8, 1, v9))
  {
    v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF2439B0);
    memcpy(v7, v8, *(_QWORD *)(*(_QWORD *)(v10 - 8) + 64));
  }
  else
  {
    (*(void (**)(_BYTE *, _BYTE *, uint64_t))(*(_QWORD *)(v9 - 8) + 32))(v7, v8, v9);
    __swift_storeEnumTagSinglePayload((uint64_t)v7, 0, 1, v9);
  }
  v11 = a3[7];
  *(_QWORD *)&a1[a3[6]] = *(_QWORD *)&a2[a3[6]];
  *(_QWORD *)&a1[v11] = *(_QWORD *)&a2[v11];
  v12 = a3[9];
  a1[a3[8]] = a2[a3[8]];
  a1[v12] = a2[v12];
  v13 = a3[11];
  a1[a3[10]] = a2[a3[10]];
  a1[v13] = a2[v13];
  v14 = a3[12];
  v15 = &a1[v14];
  v16 = &a2[v14];
  *(_QWORD *)v15 = *(_QWORD *)v16;
  v15[8] = v16[8];
  return a1;
}

_BYTE *assignWithTake for VideoConfiguration(_BYTE *a1, _BYTE *a2, int *a3)
{
  uint64_t v6;
  _BYTE *v7;
  _BYTE *v8;
  uint64_t v9;
  int EnumTagSinglePayload;
  int v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  _BYTE *v18;
  _BYTE *v19;

  *a1 = *a2;
  v6 = a3[5];
  v7 = &a1[v6];
  v8 = &a2[v6];
  v9 = sub_1B9DE1674();
  EnumTagSinglePayload = __swift_getEnumTagSinglePayload((uint64_t)v7, 1, v9);
  v11 = __swift_getEnumTagSinglePayload((uint64_t)v8, 1, v9);
  if (!EnumTagSinglePayload)
  {
    v12 = *(_QWORD *)(v9 - 8);
    if (!v11)
    {
      (*(void (**)(_BYTE *, _BYTE *, uint64_t))(v12 + 40))(v7, v8, v9);
      goto LABEL_7;
    }
    (*(void (**)(_BYTE *, uint64_t))(v12 + 8))(v7, v9);
    goto LABEL_6;
  }
  if (v11)
  {
LABEL_6:
    v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF2439B0);
    memcpy(v7, v8, *(_QWORD *)(*(_QWORD *)(v13 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(_BYTE *, _BYTE *, uint64_t))(*(_QWORD *)(v9 - 8) + 32))(v7, v8, v9);
  __swift_storeEnumTagSinglePayload((uint64_t)v7, 0, 1, v9);
LABEL_7:
  v14 = a3[7];
  *(_QWORD *)&a1[a3[6]] = *(_QWORD *)&a2[a3[6]];
  *(_QWORD *)&a1[v14] = *(_QWORD *)&a2[v14];
  v15 = a3[9];
  a1[a3[8]] = a2[a3[8]];
  a1[v15] = a2[v15];
  v16 = a3[11];
  a1[a3[10]] = a2[a3[10]];
  a1[v16] = a2[v16];
  v17 = a3[12];
  v18 = &a1[v17];
  v19 = &a2[v17];
  *(_QWORD *)v18 = *(_QWORD *)v19;
  v18[8] = v19[8];
  return a1;
}

uint64_t getEnumTagSinglePayload for VideoConfiguration()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_1B9DC9604(unsigned __int8 *a1, uint64_t a2, uint64_t a3)
{
  unsigned int v4;
  uint64_t v8;

  if ((_DWORD)a2 == 254)
  {
    v4 = *a1;
    if (v4 >= 2)
      return v4 - 1;
    else
      return 0;
  }
  else
  {
    v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF2439B0);
    return __swift_getEnumTagSinglePayload((uint64_t)&a1[*(int *)(a3 + 20)], a2, v8);
  }
}

uint64_t storeEnumTagSinglePayload for VideoConfiguration()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

void sub_1B9DC9680(_BYTE *a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v7;

  if (a3 == 254)
  {
    *a1 = a2 + 1;
    OUTLINED_FUNCTION_1_7();
  }
  else
  {
    v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF2439B0);
    __swift_storeEnumTagSinglePayload((uint64_t)&a1[*(int *)(a4 + 20)], a2, a2, v7);
  }
}

void sub_1B9DC96E4()
{
  unint64_t v0;

  sub_1B9DC9778();
  if (v0 <= 0x3F)
    swift_initStructMetadata();
}

void sub_1B9DC9778()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_1EF243A38[0])
  {
    sub_1B9DE1674();
    v0 = sub_1B9DE25BC();
    if (!v1)
      atomic_store(v0, qword_1EF243A38);
  }
}

uint64_t OUTLINED_FUNCTION_0_64()
{
  return type metadata accessor for VideoConfiguration();
}

uint64_t OUTLINED_FUNCTION_3_35(uint64_t a1)
{
  uint64_t v1;

  return sub_1B9DC8D90(a1, v1);
}

uint64_t OUTLINED_FUNCTION_4_32(uint64_t a1)
{
  uint64_t v1;

  return sub_1B9DC8D90(a1, v1);
}

uint64_t OUTLINED_FUNCTION_6_23()
{
  uint64_t v0;

  return sub_1B9DC8DD4(v0);
}

uint64_t OUTLINED_FUNCTION_7_24()
{
  uint64_t v0;

  return sub_1B9DC8DD4(v0);
}

uint64_t OUTLINED_FUNCTION_9_20()
{
  uint64_t v0;

  return sub_1B9DC8DD4(v0);
}

uint64_t OUTLINED_FUNCTION_10_19()
{
  uint64_t v0;

  return sub_1B9DC8DD4(v0);
}

uint64_t OUTLINED_FUNCTION_11_21()
{
  uint64_t v0;
  uint64_t v1;

  return sub_1B9DC8D90(v0, *(_QWORD *)(v1 - 136));
}

uint64_t OUTLINED_FUNCTION_12_22(uint64_t a1)
{
  uint64_t v1;

  return __swift_storeEnumTagSinglePayload(a1, 1, 1, v1);
}

uint64_t OUTLINED_FUNCTION_13_15(uint64_t a1)
{
  uint64_t v1;

  return sub_1B9DC8D90(a1, v1);
}

uint64_t OUTLINED_FUNCTION_14_16()
{
  uint64_t v0;
  uint64_t v1;

  return sub_1B9DC8D90(v0, v1);
}

uint64_t OUTLINED_FUNCTION_15_15()
{
  uint64_t v0;
  uint64_t v1;

  return sub_1B9DC8D90(v0, v1);
}

uint64_t OUTLINED_FUNCTION_16_20()
{
  return sub_1B9DE1674();
}

uint64_t OUTLINED_FUNCTION_17_17(uint64_t a1)
{
  uint64_t v1;

  return sub_1B9DC8D90(a1, v1);
}

uint64_t OUTLINED_FUNCTION_18_16()
{
  uint64_t v0;
  uint64_t v1;

  return sub_1B9DC8D90(v0, v1);
}

uint64_t OUTLINED_FUNCTION_20_10()
{
  uint64_t v0;

  return sub_1B9DC8DD4(v0);
}

uint64_t OUTLINED_FUNCTION_21_12()
{
  uint64_t v0;

  return sub_1B9DC8DD4(v0);
}

void *VideoControls.all.unsafeMutableAddressor()
{
  return &static VideoControls.all;
}

uint64_t VideoControls.init(deserializing:using:)(uint64_t a1, uint64_t a2)
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
  char *v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  char v19;
  char v20;
  char v21;
  char v22;
  char v23;
  uint64_t v24;
  uint64_t v26;

  v4 = sub_1B9DE1848();
  v5 = MEMORY[0x1E0C80A78](v4);
  v7 = (char *)&v26 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = MEMORY[0x1E0C80A78](v5);
  v10 = (char *)&v26 - v9;
  v11 = MEMORY[0x1E0C80A78](v8);
  v13 = (char *)&v26 - v12;
  v14 = MEMORY[0x1E0C80A78](v11);
  v16 = (char *)&v26 - v15;
  MEMORY[0x1E0C80A78](v14);
  v18 = (uint64_t)&v26 - v17;
  OUTLINED_FUNCTION_1_50();
  v19 = sub_1B9DE17F4();
  OUTLINED_FUNCTION_0_65(v18);
  LODWORD(v18) = v19 & 1;
  OUTLINED_FUNCTION_1_50();
  v20 = sub_1B9DE17F4();
  OUTLINED_FUNCTION_0_65((uint64_t)v16);
  LODWORD(v18) = v18 & 0xFFFFFFFD | (2 * (v20 & 1));
  OUTLINED_FUNCTION_1_50();
  v21 = sub_1B9DE17F4();
  OUTLINED_FUNCTION_0_65((uint64_t)v13);
  LODWORD(v18) = v18 & 0xFFFFFFFB | (4 * (v21 & 1));
  OUTLINED_FUNCTION_1_50();
  v22 = sub_1B9DE17F4();
  OUTLINED_FUNCTION_0_65((uint64_t)v10);
  LODWORD(v18) = v18 & 0xFFFFFFF7 | (8 * (v22 & 1));
  OUTLINED_FUNCTION_1_50();
  v23 = sub_1B9DE17F4();
  OUTLINED_FUNCTION_0_65((uint64_t)v7);
  v24 = sub_1B9DE1968();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v24 - 8) + 8))(a2, v24);
  OUTLINED_FUNCTION_0_65(a1);
  return v18 & 0xFFFFFFEF | (16 * (v23 & 1u));
}

void *VideoControls.prominentPlay.unsafeMutableAddressor()
{
  return &static VideoControls.prominentPlay;
}

uint64_t static VideoControls.prominentPlay.getter()
{
  return 1;
}

void *VideoControls.fullScreenToggle.unsafeMutableAddressor()
{
  return &static VideoControls.fullScreenToggle;
}

uint64_t static VideoControls.fullScreenToggle.getter()
{
  return 2;
}

void *VideoControls.inlinePlayPause.unsafeMutableAddressor()
{
  return &static VideoControls.inlinePlayPause;
}

uint64_t static VideoControls.inlinePlayPause.getter()
{
  return 4;
}

void *VideoControls.muteUnmute.unsafeMutableAddressor()
{
  return &static VideoControls.muteUnmute;
}

uint64_t static VideoControls.muteUnmute.getter()
{
  return 8;
}

void *VideoControls.scrubber.unsafeMutableAddressor()
{
  return &static VideoControls.scrubber;
}

uint64_t static VideoControls.scrubber.getter()
{
  return 16;
}

uint64_t static VideoControls.all.getter()
{
  return 15;
}

void *VideoControls.inline.unsafeMutableAddressor()
{
  return &static VideoControls.inline;
}

uint64_t static VideoControls.inline.getter()
{
  return 14;
}

void *VideoControls.none.unsafeMutableAddressor()
{
  return &static VideoControls.none;
}

uint64_t static VideoControls.none.getter()
{
  return 0;
}

BOOL VideoControls.containsInlineControls.getter(char a1)
{
  return (a1 & 0xE) != 0;
}

uint64_t sub_1B9DC9B60@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  uint64_t result;

  result = VideoControls.init(deserializing:using:)(a1, a2);
  *a3 = result;
  return result;
}

void sub_1B9DC9B8C(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  _QWORD *v2;

  *a2 = j__OUTLINED_FUNCTION_34_5(*a1, *v2);
  OUTLINED_FUNCTION_1();
}

void sub_1B9DC9BB4(uint64_t *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t *v2;

  *a2 = sub_1B9DBAAF4(*a1, *v2);
  OUTLINED_FUNCTION_1();
}

unint64_t sub_1B9DC9BE0()
{
  unint64_t result;

  result = qword_1EF243A88;
  if (!qword_1EF243A88)
  {
    result = MEMORY[0x1BCCCEEA8](&protocol conformance descriptor for VideoControls, &type metadata for VideoControls);
    atomic_store(result, (unint64_t *)&qword_1EF243A88);
  }
  return result;
}

unint64_t sub_1B9DC9C20()
{
  unint64_t result;

  result = qword_1EF243A90;
  if (!qword_1EF243A90)
  {
    result = MEMORY[0x1BCCCEEA8](&protocol conformance descriptor for VideoControls, &type metadata for VideoControls);
    atomic_store(result, (unint64_t *)&qword_1EF243A90);
  }
  return result;
}

unint64_t sub_1B9DC9C60()
{
  unint64_t result;

  result = qword_1EF243A98;
  if (!qword_1EF243A98)
  {
    result = MEMORY[0x1BCCCEEA8](&protocol conformance descriptor for VideoControls, &type metadata for VideoControls);
    atomic_store(result, (unint64_t *)&qword_1EF243A98);
  }
  return result;
}

unint64_t sub_1B9DC9CA0()
{
  unint64_t result;

  result = qword_1EF243AA0;
  if (!qword_1EF243AA0)
  {
    result = MEMORY[0x1BCCCEEA8](&protocol conformance descriptor for VideoControls, &type metadata for VideoControls);
    atomic_store(result, (unint64_t *)&qword_1EF243AA0);
  }
  return result;
}

ValueMetadata *type metadata accessor for VideoControls()
{
  return &type metadata for VideoControls;
}

uint64_t OUTLINED_FUNCTION_0_65(uint64_t a1)
{
  uint64_t v1;
  uint64_t (*v2)(uint64_t, uint64_t);

  return v2(a1, v1);
}

uint64_t OUTLINED_FUNCTION_1_50()
{
  return sub_1B9DE1854();
}

void sub_1B9DC9CFC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (*(_QWORD *)(a3 + 16))
    OUTLINED_FUNCTION_32_10(a1, a2);
  OUTLINED_FUNCTION_1();
}

uint64_t sub_1B9DC9D30@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v4;
  unint64_t v6;
  char v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  if (*(_QWORD *)(a3 + 16) && (v6 = OUTLINED_FUNCTION_32_10(a1, a2), (v7 & 1) != 0))
  {
    v8 = v6;
    v9 = *(_QWORD *)(v4 + 56);
    v10 = sub_1B9DE1554();
    (*(void (**)(uint64_t, unint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 16))(a4, v9 + *(_QWORD *)(*(_QWORD *)(v10 - 8) + 72) * v8, v10);
    v11 = a4;
    v12 = 0;
    v13 = v10;
  }
  else
  {
    v13 = sub_1B9DE1554();
    v11 = a4;
    v12 = 1;
  }
  return __swift_storeEnumTagSinglePayload(v11, v12, 1, v13);
}

void sub_1B9DC9DC0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v3;
  char v4;
  uint64_t v5;
  uint64_t v6;

  if (*(_QWORD *)(a3 + 16) && (v3 = OUTLINED_FUNCTION_32_10(a1, a2), (v4 & 1) != 0))
  {
    v5 = OUTLINED_FUNCTION_44_5(v3);
    OUTLINED_FUNCTION_7_25(v5, v6);
  }
  else
  {
    OUTLINED_FUNCTION_34_8();
    OUTLINED_FUNCTION_1();
  }
}

void sub_1B9DC9DF8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  char v3;

  if (*(_QWORD *)(a3 + 16))
  {
    OUTLINED_FUNCTION_32_10(a1, a2);
    if ((v3 & 1) != 0)
      OUTLINED_FUNCTION_31_4();
  }
  OUTLINED_FUNCTION_1();
}

uint64_t sub_1B9DC9E34(uint64_t a1, uint64_t a2)
{
  unint64_t v3;
  char v4;

  if (*(_QWORD *)(a2 + 16) && (v3 = sub_1B9DCBD60(a1), (v4 & 1) != 0))
    return *(_QWORD *)(*(_QWORD *)(a2 + 56) + 8 * v3);
  else
    return 0;
}

void sub_1B9DC9E78(uint64_t a1, uint64_t a2)
{
  unint64_t v2;
  char v3;
  uint64_t v4;
  uint64_t v5;

  if (*(_QWORD *)(a2 + 16) && (v2 = sub_1B9DCBC28(), (v3 & 1) != 0))
  {
    v4 = OUTLINED_FUNCTION_44_5(v2);
    OUTLINED_FUNCTION_7_25(v4, v5);
  }
  else
  {
    OUTLINED_FUNCTION_34_8();
    OUTLINED_FUNCTION_1();
  }
}

void sub_1B9DC9EB4(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v4;
  unint64_t v6;
  char v7;

  if (*(_QWORD *)(a3 + 16) && (v6 = OUTLINED_FUNCTION_32_10(a1, a2), (v7 & 1) != 0))
  {
    sub_1B9D47998(*(_QWORD *)(v4 + 56) + 40 * v6, a4);
  }
  else
  {
    *(_QWORD *)(a4 + 32) = 0;
    OUTLINED_FUNCTION_34_8();
    OUTLINED_FUNCTION_1();
  }
}

void sub_1B9DC9F00(uint64_t a1, uint64_t a2)
{
  sub_1B9DC9F88(a1, a2, (uint64_t (*)(void))sub_1B9DCBDB0);
}

void sub_1B9DC9F0C(uint64_t a1, uint64_t a2)
{
  char v2;

  if (*(_QWORD *)(a2 + 16))
  {
    sub_1B9DCBDB0();
    if ((v2 & 1) != 0)
      OUTLINED_FUNCTION_31_4();
  }
  OUTLINED_FUNCTION_1();
}

void sub_1B9DC9F4C(uint64_t a1, uint64_t a2)
{
  char v2;

  if (*(_QWORD *)(a2 + 16))
  {
    sub_1B9DCBCAC();
    if ((v2 & 1) != 0)
      swift_retain();
  }
  OUTLINED_FUNCTION_1();
}

void sub_1B9DC9F88(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v3;
  char v4;
  uint64_t v5;
  uint64_t v6;

  if (*(_QWORD *)(a2 + 16) && (v3 = a3(), (v4 & 1) != 0))
  {
    v5 = OUTLINED_FUNCTION_44_5(v3);
    OUTLINED_FUNCTION_7_25(v5, v6);
  }
  else
  {
    OUTLINED_FUNCTION_34_8();
    OUTLINED_FUNCTION_1();
  }
}

void sub_1B9DC9FC4()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  void *v3;
  SEL v4;

  v1 = OBJC_IVAR____TtC27AppleMediaServicesUIDynamic13VideoObserver_playerObserversAdded;
  if ((*(_BYTE *)(v0 + OBJC_IVAR____TtC27AppleMediaServicesUIDynamic13VideoObserver_playerObserversAdded) & 1) == 0)
  {
    v2 = (void *)OUTLINED_FUNCTION_27_7();
    v3 = (void *)OUTLINED_FUNCTION_47_5();
    objc_msgSend(v3, v4);

    *(_BYTE *)(v0 + v1) = 1;
  }
}

void sub_1B9DCA028()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  void *v3;

  v2 = OBJC_IVAR____TtC27AppleMediaServicesUIDynamic13VideoObserver_playerObserversAdded;
  if (*(_BYTE *)(v1 + OBJC_IVAR____TtC27AppleMediaServicesUIDynamic13VideoObserver_playerObserversAdded) == 1)
  {
    v3 = (void *)OUTLINED_FUNCTION_27_7();
    objc_msgSend(v0, sel_removeObserver_forKeyPath_context_, v1, v3, &unk_1EF243AA8);

    *(_BYTE *)(v1 + v2) = 0;
  }
}

void sub_1B9DCA08C()
{
  void *v0;
  uint64_t v1;
  void *v2;
  uint64_t v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  SEL v8;
  id v9;
  void *v10;
  uint64_t v11;
  id v12;
  void *v13;
  uint64_t v14;
  id v15;
  void *v16;
  uint64_t v17;
  id v18;
  void *v19;

  OUTLINED_FUNCTION_54_0();
  if (v2)
  {
    v3 = OBJC_IVAR____TtC27AppleMediaServicesUIDynamic13VideoObserver_playerItemObserversAdded;
    if ((*(_BYTE *)(v1 + OBJC_IVAR____TtC27AppleMediaServicesUIDynamic13VideoObserver_playerItemObserversAdded) & 1) == 0)
    {
      v4 = v2;
      v5 = (void *)OUTLINED_FUNCTION_22_11();
      objc_msgSend(v0, sel_addObserver_forKeyPath_options_context_, v1, v5, 5, &unk_1EF243AA8);

      v6 = (void *)OUTLINED_FUNCTION_60_3();
      v7 = (void *)OUTLINED_FUNCTION_47_5();
      objc_msgSend(v7, v8);

      v9 = objc_msgSend((id)objc_opt_self(), sel_defaultCenter);
      v10 = (void *)OUTLINED_FUNCTION_2_44();
      OUTLINED_FUNCTION_3_36();

      v12 = OUTLINED_FUNCTION_7_6(v11, sel_defaultCenter);
      v13 = (void *)OUTLINED_FUNCTION_2_44();
      OUTLINED_FUNCTION_3_36();

      v15 = OUTLINED_FUNCTION_7_6(v14, sel_defaultCenter);
      v16 = (void *)OUTLINED_FUNCTION_2_44();
      OUTLINED_FUNCTION_3_36();

      v18 = OUTLINED_FUNCTION_7_6(v17, sel_defaultCenter);
      v19 = (void *)OUTLINED_FUNCTION_2_44();
      objc_msgSend(v18, sel_addObserver_selector_name_object_, v1, sel_playbackErrorOccurredWithNotification_, v19, v0);

      *(_BYTE *)(v1 + v3) = 1;
    }
  }
  OUTLINED_FUNCTION_2_5();
}

void sub_1B9DCA24C()
{
  void *v0;
  uint64_t v1;
  void *v2;
  uint64_t v3;
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  uint64_t v12;
  id v13;
  void *v14;
  uint64_t v15;
  id v16;
  void *v17;

  OUTLINED_FUNCTION_54_0();
  if (v2)
  {
    v3 = OBJC_IVAR____TtC27AppleMediaServicesUIDynamic13VideoObserver_playerItemObserversAdded;
    if (*(_BYTE *)(v1 + OBJC_IVAR____TtC27AppleMediaServicesUIDynamic13VideoObserver_playerItemObserversAdded) == 1)
    {
      v4 = v2;
      v5 = (void *)OUTLINED_FUNCTION_22_11();
      OUTLINED_FUNCTION_24_9((uint64_t)v5, sel_removeObserver_forKeyPath_context_);

      v6 = (void *)OUTLINED_FUNCTION_60_3();
      OUTLINED_FUNCTION_24_9((uint64_t)v6, sel_removeObserver_forKeyPath_context_);

      v7 = objc_msgSend((id)objc_opt_self(), sel_defaultCenter);
      v8 = (void *)OUTLINED_FUNCTION_2_44();
      OUTLINED_FUNCTION_5_26();

      v10 = OUTLINED_FUNCTION_7_6(v9, sel_defaultCenter);
      v11 = (void *)OUTLINED_FUNCTION_2_44();
      OUTLINED_FUNCTION_5_26();

      v13 = OUTLINED_FUNCTION_7_6(v12, sel_defaultCenter);
      v14 = (void *)OUTLINED_FUNCTION_2_44();
      OUTLINED_FUNCTION_5_26();

      v16 = OUTLINED_FUNCTION_7_6(v15, sel_defaultCenter);
      v17 = (void *)OUTLINED_FUNCTION_2_44();
      objc_msgSend(v16, sel_removeObserver_name_object_, v1, v17, v0);

      *(_BYTE *)(v1 + v3) = 0;
    }
  }
  OUTLINED_FUNCTION_2_5();
}

void sub_1B9DCA3D4(void *a1, void *a2)
{
  void *v2;
  void *v3;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;
  double Seconds;
  double v10;
  CMTimeValue v11;
  CMTimeValue v12;
  unint64_t v13;
  CMTimeScale v14;
  CMTimeEpoch v15;
  CMTimeEpoch v16;
  unint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  CMTimeValue v24;
  void *v25;
  id v26;
  uint64_t v27;
  id v28;
  _OWORD v30[2];
  CMTime time;
  void *v32;
  uint64_t v33;
  _BYTE v34[40];

  v3 = v2;
  v5 = OUTLINED_FUNCTION_40_0();
  MEMORY[0x1E0C80A78](v5);
  v6 = OUTLINED_FUNCTION_1_5();
  MEMORY[0x1E0C80A78](v6);
  OUTLINED_FUNCTION_0_6();
  v7 = (void *)sub_1B9DE213C();
  v8 = objc_msgSend(a1, sel_statusOfValueForKey_error_, v7, 0);

  if (v8 == (id)2)
  {
    objc_msgSend(a1, sel_duration);
    Seconds = CMTimeGetSeconds(&time);
    if (Seconds >= 5.0)
      v10 = Seconds + -5.0;
    else
      v10 = Seconds;
    __swift_instantiateConcreteTypeFromMangledName(&qword_1ED5CDE40);
    v11 = OUTLINED_FUNCTION_7_7();
    *(_OWORD *)(v11 + 16) = xmmword_1B9DF2410;
    v12 = sub_1B9DE255C();
    v14 = v13;
    v16 = v15;
    v17 = HIDWORD(v13);
    v18 = (void *)objc_opt_self();
    time.value = v12;
    time.timescale = v14;
    time.flags = v17;
    time.epoch = v16;
    *(_QWORD *)(v11 + 32) = objc_msgSend(v18, sel_valueWithCMTime_, &time);
    time.value = v11;
    sub_1B9DE22B0();
    sub_1B9D661C0(0, &qword_1EF243B10);
    OUTLINED_FUNCTION_48_4();
    v19 = (void *)sub_1B9DE2280();
    v20 = swift_bridgeObjectRelease();
    OUTLINED_FUNCTION_3_11(v20, (unint64_t *)&qword_1ED5CFB60);
    v21 = (void *)OUTLINED_FUNCTION_49_0();
    v22 = OUTLINED_FUNCTION_7_7();
    swift_unknownObjectWeakInit();
    v23 = OUTLINED_FUNCTION_7_7();
    *(_QWORD *)(v23 + 16) = v22;
    *(double *)(v23 + 24) = Seconds;
    *(double *)(v23 + 32) = v10;
    v32 = sub_1B9DCC87C;
    v33 = v23;
    v24 = MEMORY[0x1E0C809B0];
    time.value = MEMORY[0x1E0C809B0];
    *(_QWORD *)&time.timescale = 1107296256;
    v25 = OUTLINED_FUNCTION_81((uint64_t)sub_1B9D49458);
    swift_release();
    v26 = objc_msgSend(a2, sel_addBoundaryTimeObserverForTimes_queue_usingBlock_, v19, v21, v25);
    _Block_release(v25);

    sub_1B9DE2604();
    swift_unknownObjectRelease();
    sub_1B9DE24D8();
    sub_1B9D45A64((uint64_t)v34, (uint64_t)v30);
    v27 = OUTLINED_FUNCTION_7_7();
    *(_QWORD *)(v27 + 16) = v3;
    sub_1B9D45A54(v30, (_OWORD *)(v27 + 24));
    v32 = sub_1B9DCC8B4;
    v33 = v27;
    time.value = v24;
    *(_QWORD *)&time.timescale = 1107296256;
    OUTLINED_FUNCTION_81((uint64_t)sub_1B9D49458);
    v28 = v3;
    swift_release();
    OUTLINED_FUNCTION_46_0();
    time.value = MEMORY[0x1E0DEE9D8];
    sub_1B9DCC908((unint64_t *)&qword_1ED5CF9C0, (void (*)(uint64_t))MEMORY[0x1E0DEF4F8]);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED5CFAD0);
    OUTLINED_FUNCTION_68_2();
    OUTLINED_FUNCTION_6_24();
    OUTLINED_FUNCTION_21_13();
  }
}

void sub_1B9DCA788(uint64_t a1, double a2, double a3)
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  double v9;
  __int128 v10;
  __int128 v11;
  uint64_t v12;
  char v13;

  v5 = a1 + 16;
  swift_beginAccess();
  v6 = MEMORY[0x1BCCCEFF8](v5);
  if (v6)
  {
    v7 = (void *)v6;
    v8 = MEMORY[0x1BCCCEFF8](v6 + OBJC_IVAR____TtC27AppleMediaServicesUIDynamic13VideoObserver_delegate);

    if (v8)
    {
      v9 = a2 - a3;
      v10 = 0u;
      v11 = 0u;
      v12 = 0;
      v13 = 3;
      sub_1B9DD001C((uint64_t)&v9);
      swift_unknownObjectRelease();
    }
  }
}

uint64_t sub_1B9DCA828(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  _BYTE v5[32];

  sub_1B9D45A64(a2, (uint64_t)v5);
  v3 = a1 + OBJC_IVAR____TtC27AppleMediaServicesUIDynamic13VideoObserver_timeBoundaryObserver;
  swift_beginAccess();
  sub_1B9DCC8C0((uint64_t)v5, v3);
  return swift_endAccess();
}

uint64_t sub_1B9DCA890(void *a1)
{
  uint64_t v1;
  uint64_t v3;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  uint64_t v8;

  v3 = v1 + OBJC_IVAR____TtC27AppleMediaServicesUIDynamic13VideoObserver_timeBoundaryObserver;
  swift_beginAccess();
  sub_1B9D837D0(v3, (uint64_t)&v5);
  if (!*((_QWORD *)&v6 + 1))
    return sub_1B9D44EF4((uint64_t)&v5);
  sub_1B9D45A54(&v5, &v7);
  __swift_project_boxed_opaque_existential_2(&v7, v8);
  objc_msgSend(a1, sel_removeTimeObserver_, sub_1B9DE2898());
  OUTLINED_FUNCTION_14_6();
  v5 = 0u;
  v6 = 0u;
  swift_beginAccess();
  sub_1B9DCC8C0((uint64_t)&v5, v3);
  swift_endAccess();
  return __swift_destroy_boxed_opaque_existential_2((uint64_t)&v7);
}

void sub_1B9DCA974()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  objc_class *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  objc_super v23;
  _QWORD v24[3];
  uint64_t v25;

  OUTLINED_FUNCTION_54_0();
  v4 = v3;
  v5 = v2;
  v6 = v1;
  if (!v3 || v3 != &unk_1EF243AA8)
  {
    if (v1)
      v6 = (void *)sub_1B9DE213C();
    OUTLINED_FUNCTION_29_7();
    v11 = v25;
    if (v25)
    {
      v12 = __swift_project_boxed_opaque_existential_2(v24, v25);
      v13 = *(_QWORD *)(v11 - 8);
      MEMORY[0x1E0C80A78](v12);
      v15 = (char *)&v22 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
      (*(void (**)(char *))(v13 + 16))(v15);
      v16 = sub_1B9DE2898();
      (*(void (**)(char *, uint64_t))(v13 + 8))(v15, v11);
      __swift_destroy_boxed_opaque_existential_2((uint64_t)v24);
      if (!v5)
      {
LABEL_13:
        v17 = (objc_class *)type metadata accessor for VideoObserver();
        v23.receiver = v0;
        v23.super_class = v17;
        objc_msgSendSuper2(&v23, sel_observeValueForKeyPath_ofObject_change_context_, v6, v16, v5, v4);

        swift_unknownObjectRelease();
        goto LABEL_14;
      }
    }
    else
    {
      v16 = 0;
      if (!v5)
        goto LABEL_13;
    }
    type metadata accessor for NSKeyValueChangeKey(0);
    sub_1B9DCC908(&qword_1EF2423D0, type metadata accessor for NSKeyValueChangeKey);
    v5 = (void *)sub_1B9DE2094();
    goto LABEL_13;
  }
  if (v1 && v2)
  {
    v7 = OUTLINED_FUNCTION_29_7();
    if (v25)
    {
      OUTLINED_FUNCTION_3_11(v7, &qword_1EF243AF8);
      if ((OUTLINED_FUNCTION_130() & 1) != 0)
      {
        v8 = OUTLINED_FUNCTION_52_2();
        sub_1B9DCACD0(v8, v9, v10);
LABEL_21:

        goto LABEL_14;
      }
    }
    else
    {
      sub_1B9D44EF4((uint64_t)v24);
    }
    v18 = OUTLINED_FUNCTION_29_7();
    if (!v25)
    {
      sub_1B9D44EF4((uint64_t)v24);
      goto LABEL_14;
    }
    OUTLINED_FUNCTION_3_11(v18, &qword_1EF243B18);
    if ((OUTLINED_FUNCTION_130() & 1) != 0)
    {
      v19 = OUTLINED_FUNCTION_52_2();
      sub_1B9DCB004(v19, v20, v21);
      goto LABEL_21;
    }
  }
LABEL_14:
  OUTLINED_FUNCTION_2_5();
}

uint64_t sub_1B9DCACD0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  BOOL v5;
  char v6;
  id *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t result;
  uint64_t v15;
  uint64_t v16;

  v5 = a2 == 0x737574617473 && a3 == 0xE600000000000000;
  v6 = v5;
  v7 = (id *)MEMORY[0x1E0CB2CB8];
  if (!v5 && (OUTLINED_FUNCTION_29() & 1) == 0)
    goto LABEL_15;
  v8 = *v7;
  OUTLINED_FUNCTION_17_18((uint64_t)v8, v9, (uint64_t (*)(void))sub_1B9DCBDB0);

  if (v16)
  {
    if ((OUTLINED_FUNCTION_8_21() & 1) != 0 && v15 == 1)
      OUTLINED_FUNCTION_41_4();
  }
  else
  {
    OUTLINED_FUNCTION_36_6(v10);
  }
  if ((v6 & 1) == 0)
  {
LABEL_15:
    if ((OUTLINED_FUNCTION_29() & 1) == 0)
      goto LABEL_22;
    v8 = *v7;
  }
  v11 = v8;
  OUTLINED_FUNCTION_17_18((uint64_t)v11, v12, (uint64_t (*)(void))sub_1B9DCBDB0);

  if (v16)
  {
    if ((OUTLINED_FUNCTION_8_21() & 1) != 0 && v15 == 2)
      OUTLINED_FUNCTION_41_4();
  }
  else
  {
    OUTLINED_FUNCTION_36_6(v13);
  }
LABEL_22:
  if (a2 == 0xD000000000000016 && a3 == 0x80000001B9DEA950 || (result = OUTLINED_FUNCTION_29(), (result & 1) != 0))
    OUTLINED_FUNCTION_41_4();
  return result;
}

uint64_t sub_1B9DCB004(uint64_t a1, uint64_t a2, uint64_t a3)
{
  BOOL v3;
  uint64_t result;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v3 = a2 == 1702125938 && a3 == 0xE400000000000000;
  if (v3 || (result = OUTLINED_FUNCTION_29(), (result & 1) != 0))
  {
    v5 = (id)*MEMORY[0x1E0CB2CB8];
    OUTLINED_FUNCTION_17_18((uint64_t)v5, v6, (uint64_t (*)(void))sub_1B9DCBDB0);

    if (v8)
    {
      result = OUTLINED_FUNCTION_130();
      if ((result & 1) != 0)
        OUTLINED_FUNCTION_41_4();
    }
    else
    {
      return OUTLINED_FUNCTION_36_6(v7);
    }
  }
  return result;
}

void sub_1B9DCB0F0()
{
  sub_1B9DCB1DC();
}

void sub_1B9DCB104(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  __int128 v6;
  __int128 v7;
  uint64_t v8;
  char v9;

  v1 = a1 + 16;
  swift_beginAccess();
  v2 = MEMORY[0x1BCCCEFF8](v1);
  if (v2)
  {
    v3 = (void *)v2;
    v4 = MEMORY[0x1BCCCEFF8](v2 + OBJC_IVAR____TtC27AppleMediaServicesUIDynamic13VideoObserver_delegate);

    if (v4)
    {
      v5 = 1;
      v6 = 0u;
      v7 = 0u;
      v8 = 0;
      v9 = 5;
      sub_1B9DD001C((uint64_t)&v5);
      swift_unknownObjectRelease();
    }
  }
}

void sub_1B9DCB1B4()
{
  void *v0;

}

void sub_1B9DCB1C8()
{
  sub_1B9DCB1DC();
}

void sub_1B9DCB1DC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void (*v5)(uint64_t);
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD v10[6];

  OUTLINED_FUNCTION_54_0();
  v1 = v0;
  v3 = v2;
  v4 = OUTLINED_FUNCTION_40_0();
  v5 = (void (*)(uint64_t))MEMORY[0x1E0DEF4F8];
  v6 = OUTLINED_FUNCTION_49_6(v4);
  MEMORY[0x1E0C80A78](v6);
  v9 = OUTLINED_FUNCTION_1_5();
  MEMORY[0x1E0C80A78](v9);
  OUTLINED_FUNCTION_0_6();
  OUTLINED_FUNCTION_3_11(v7, (unint64_t *)&qword_1ED5CFB60);
  OUTLINED_FUNCTION_49_0();
  v8 = OUTLINED_FUNCTION_7_7();
  swift_unknownObjectWeakInit();
  v10[4] = v3;
  v10[5] = v8;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 1107296256;
  v10[2] = sub_1B9D49458;
  v10[3] = v1;
  _Block_copy(v10);
  swift_release();
  OUTLINED_FUNCTION_46_0();
  v10[0] = MEMORY[0x1E0DEE9D8];
  sub_1B9DCC908((unint64_t *)&qword_1ED5CF9C0, v5);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED5CFAD0);
  OUTLINED_FUNCTION_68_2();
  OUTLINED_FUNCTION_6_24();
  OUTLINED_FUNCTION_21_13();
}

void sub_1B9DCB308(int a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20)
{
  uint64_t v20;
  uint64_t v21;
  void *v22;
  const void *v23;
  uint64_t v24;

  _Block_release(v23);

  OUTLINED_FUNCTION_13_16(*(_QWORD *)(v24 - 136));
  (*(void (**)(uint64_t, _QWORD))(v20 + 8))(v21, *(_QWORD *)(v24 - 144));
  OUTLINED_FUNCTION_2_5();
}

void sub_1B9DCB338(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  void *v3;
  uint64_t v4;
  _OWORD v5[3];
  char v6;

  v1 = a1 + 16;
  swift_beginAccess();
  v2 = MEMORY[0x1BCCCEFF8](v1);
  if (v2)
  {
    v3 = (void *)v2;
    v4 = MEMORY[0x1BCCCEFF8](v2 + OBJC_IVAR____TtC27AppleMediaServicesUIDynamic13VideoObserver_delegate);

    if (v4)
    {
      memset(v5, 0, sizeof(v5));
      v6 = 5;
      sub_1B9DD001C((uint64_t)v5);
      swift_unknownObjectRelease();
    }
  }
}

void sub_1B9DCB3E0()
{
  void *v0;

}

void sub_1B9DCB3F4()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  void *v3;
  uint64_t v4;
  void (*v5)(uint64_t);
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  id v14;
  uint64_t v15;
  _QWORD v16[6];

  OUTLINED_FUNCTION_54_0();
  v3 = v2;
  v4 = OUTLINED_FUNCTION_40_0();
  v5 = (void (*)(uint64_t))MEMORY[0x1E0DEF4F8];
  v6 = OUTLINED_FUNCTION_49_6(v4);
  MEMORY[0x1E0C80A78](v6);
  v7 = OUTLINED_FUNCTION_1_5();
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x1E0C80A78](v7);
  OUTLINED_FUNCTION_0_6();
  OUTLINED_FUNCTION_3_11(v9, (unint64_t *)&qword_1ED5CFB60);
  v10 = (void *)OUTLINED_FUNCTION_49_0();
  v11 = OUTLINED_FUNCTION_7_7();
  swift_unknownObjectWeakInit();
  v12 = OUTLINED_FUNCTION_7_7();
  *(_QWORD *)(v12 + 16) = v3;
  *(_QWORD *)(v12 + 24) = v11;
  v16[4] = sub_1B9DCBBD0;
  v16[5] = v12;
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 1107296256;
  v16[2] = sub_1B9D49458;
  v16[3] = &block_descriptor_17;
  v13 = _Block_copy(v16);
  v14 = v3;
  swift_release();
  OUTLINED_FUNCTION_46_0();
  v16[0] = MEMORY[0x1E0DEE9D8];
  sub_1B9DCC908((unint64_t *)&qword_1ED5CF9C0, v5);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED5CFAD0);
  OUTLINED_FUNCTION_68_2();
  OUTLINED_FUNCTION_6_24();
  MEMORY[0x1BCCCE2A8](0, v1, v0, v13);
  _Block_release(v13);

  OUTLINED_FUNCTION_13_16(v15);
  (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v1, v7);
  OUTLINED_FUNCTION_2_5();
}

void sub_1B9DCB58C(void *a1, uint64_t a2)
{
  uint64_t v3;
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char v11;
  id v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  id v23;
  void *v24;
  id v25;
  unint64_t v26;
  uint64_t v27;
  BOOL v28;
  uint64_t v29;
  id v30;
  void *v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  id v35;
  id v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  id v42;
  _OWORD v43[2];
  uint64_t v44;
  __int128 v45;
  __int128 v46;
  uint64_t v47;
  char v48;

  v3 = a2 + 16;
  v4 = objc_msgSend(a1, sel_name);
  v5 = (void *)sub_1B9DE213C();
  v6 = sub_1B9DE2160();
  v8 = v7;
  if (v6 == sub_1B9DE2160() && v8 == v9)
  {

    swift_bridgeObjectRelease_n();
    goto LABEL_13;
  }
  v11 = sub_1B9DE28A4();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if ((v11 & 1) != 0)
  {
LABEL_13:
    swift_beginAccess();
    v20 = MEMORY[0x1BCCCEFF8](v3);
    if (v20)
    {
      v21 = (void *)v20;
      v22 = MEMORY[0x1BCCCEFF8](v20 + OBJC_IVAR____TtC27AppleMediaServicesUIDynamic13VideoObserver_delegate);

      if (v22)
      {
        v44 = 2;
        v45 = 0u;
        v46 = 0u;
        v47 = 0;
        v48 = 5;
        sub_1B9DD001C((uint64_t)&v44);
        swift_unknownObjectRelease();
      }
    }
    return;
  }
  v12 = objc_msgSend(a1, sel_name);
  v13 = (void *)sub_1B9DE213C();
  v14 = sub_1B9DE2160();
  v16 = v15;
  if (v14 == sub_1B9DE2160() && v16 == v17)
  {

    swift_bridgeObjectRelease_n();
  }
  else
  {
    v19 = sub_1B9DE28A4();

    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if ((v19 & 1) == 0)
      return;
  }
  if (objc_msgSend(a1, sel_object))
  {
    sub_1B9DE2604();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v43, 0, sizeof(v43));
  }
  sub_1B9D8272C((uint64_t)v43, (uint64_t)&v44);
  if (!(_QWORD)v46)
  {
    sub_1B9D44EF4((uint64_t)&v44);
    return;
  }
  sub_1B9D661C0(0, &qword_1EF243AF8);
  if ((swift_dynamicCast() & 1) != 0)
  {
    v23 = objc_msgSend(v42, sel_errorLog);
    if (!v23)
      goto LABEL_34;
    v24 = v23;
    v25 = objc_msgSend(v23, sel_events);

    sub_1B9D661C0(0, &qword_1EF243B00);
    v26 = sub_1B9DE228C();

    if (v26 >> 62)
    {
      swift_bridgeObjectRetain();
      v27 = sub_1B9DE27F0();
      swift_bridgeObjectRelease();
      if (v27)
      {
LABEL_26:
        v28 = __OFSUB__(v27, 1);
        v29 = v27 - 1;
        if (v28)
        {
          __break(1u);
        }
        else
        {
          sub_1B9D44ECC(v29, (v26 & 0xC000000000000001) == 0, v26);
          if ((v26 & 0xC000000000000001) == 0)
          {
            v30 = *(id *)(v26 + 8 * v29 + 32);
            goto LABEL_29;
          }
        }
        v30 = (id)MEMORY[0x1BCCCE518](v29, v26);
LABEL_29:
        v31 = v30;
        swift_bridgeObjectRelease();
        swift_beginAccess();
        v32 = MEMORY[0x1BCCCEFF8](v3);
        if (v32)
        {
          v33 = (void *)v32;
          v34 = MEMORY[0x1BCCCEFF8](v32 + OBJC_IVAR____TtC27AppleMediaServicesUIDynamic13VideoObserver_delegate);

          if (v34)
          {
            v35 = objc_msgSend(v31, sel_errorStatusCode);
            v36 = objc_msgSend(v31, sel_errorDomain);
            v37 = sub_1B9DE2160();
            v39 = v38;

            v40 = sub_1B9DCC768(v31);
            v44 = (uint64_t)v35;
            *(_QWORD *)&v45 = 0;
            *((_QWORD *)&v45 + 1) = v37;
            *(_QWORD *)&v46 = v39;
            *((_QWORD *)&v46 + 1) = v40;
            v47 = v41;
            v48 = 2;
            sub_1B9DD001C((uint64_t)&v44);
            swift_bridgeObjectRelease();

            swift_unknownObjectRelease();
LABEL_37:
            swift_bridgeObjectRelease();
            return;
          }
        }

LABEL_34:
        return;
      }
    }
    else
    {
      v27 = *(_QWORD *)((v26 & 0xFFFFFFFFFFFFF8) + 0x10);
      if (v27)
        goto LABEL_26;
    }

    goto LABEL_37;
  }
}

id sub_1B9DCBA60()
{
  _BYTE *v0;
  double v1;
  objc_class *v2;
  objc_super v4;

  *(_QWORD *)&v0[OBJC_IVAR____TtC27AppleMediaServicesUIDynamic13VideoObserver_delegate + 8] = 0;
  swift_unknownObjectWeakInit();
  v0[OBJC_IVAR____TtC27AppleMediaServicesUIDynamic13VideoObserver_playerItemObserversAdded] = 0;
  v0[OBJC_IVAR____TtC27AppleMediaServicesUIDynamic13VideoObserver_playerObserversAdded] = 0;
  type metadata accessor for VideoObserver();
  v1 = OUTLINED_FUNCTION_34_8();
  v4.receiver = v0;
  v4.super_class = v2;
  return objc_msgSendSuper2(&v4, sel_init, v1);
}

id sub_1B9DCBAF8()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for VideoObserver();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for VideoObserver()
{
  return objc_opt_self();
}

uint64_t sub_1B9DCBB80()
{
  swift_unknownObjectWeakDestroy();
  return swift_deallocObject();
}

uint64_t sub_1B9DCBBA4()
{
  uint64_t v0;

  swift_release();
  return swift_deallocObject();
}

void sub_1B9DCBBD0()
{
  uint64_t v0;

  sub_1B9DCB58C(*(void **)(v0 + 16), *(_QWORD *)(v0 + 24));
}

uint64_t block_copy_helper_17(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_17()
{
  return swift_release();
}

void sub_1B9DCBBF4()
{
  OUTLINED_FUNCTION_18();
  OUTLINED_FUNCTION_25_9();
  OUTLINED_FUNCTION_38_8();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_54_6();
  OUTLINED_FUNCTION_43_8();
}

unint64_t sub_1B9DCBC28()
{
  uint64_t v0;
  uint64_t v1;

  sub_1B9DE26C4();
  v0 = OUTLINED_FUNCTION_48_4();
  return sub_1B9DCBDFC(v0, v1);
}

unint64_t sub_1B9DCBC54(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  OUTLINED_FUNCTION_26_4();
  sub_1B9DE21C0();
  v4 = OUTLINED_FUNCTION_7();
  return sub_1B9DCBEC0(a1, a2, v4);
}

unint64_t sub_1B9DCBCAC()
{
  uint64_t v0;
  uint64_t v1;

  sub_1B9DE1AA0();
  sub_1B9DCC908(&qword_1ED5CD668, (void (*)(uint64_t))MEMORY[0x1E0D3FC28]);
  sub_1B9DE20DC();
  v0 = OUTLINED_FUNCTION_48_4();
  return sub_1B9DCBFA0(v0, v1);
}

unint64_t sub_1B9DCBD14(double *a1)
{
  uint64_t v2;
  _BYTE v4[72];

  OUTLINED_FUNCTION_26_4();
  ArtworkRequest.hash(into:)((uint64_t)v4);
  v2 = OUTLINED_FUNCTION_7();
  return sub_1B9DCC0E0(a1, v2);
}

unint64_t sub_1B9DCBD60(uint64_t a1)
{
  uint64_t v2;

  OUTLINED_FUNCTION_26_4();
  sub_1B9DE2958();
  v2 = OUTLINED_FUNCTION_7();
  return sub_1B9DCC5C8(a1, v2);
}

void sub_1B9DCBDB0()
{
  uint64_t v0;
  uint64_t v1;

  OUTLINED_FUNCTION_40_7();
  OUTLINED_FUNCTION_30_7();
  OUTLINED_FUNCTION_37_6();
  v1 = OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_16_0();
  sub_1B9DCC664(v0, v1);
  OUTLINED_FUNCTION_23_5();
}

unint64_t sub_1B9DCBDFC(uint64_t a1, uint64_t a2)
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
      sub_1B9D5EA70(*(_QWORD *)(v2 + 48) + 40 * v4, (uint64_t)v9);
      v7 = MEMORY[0x1BCCCE47C](v9, a1);
      sub_1B9D55D8C((uint64_t)v9);
      if ((v7 & 1) != 0)
        break;
      v4 = (v4 + 1) & v6;
    }
    while (((*(_QWORD *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFF8)) >> v4) & 1) != 0);
  }
  return v4;
}

unint64_t sub_1B9DCBEC0(uint64_t a1, uint64_t a2, uint64_t a3)
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
    if (!v11 && (sub_1B9DE28A4() & 1) == 0)
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
      while (!v14 && (sub_1B9DE28A4() & 1) == 0);
    }
  }
  return v6;
}

unint64_t sub_1B9DCBFA0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(char *, unint64_t, uint64_t);
  char v14;
  _QWORD v16[2];

  v3 = v2;
  v16[1] = a1;
  v5 = sub_1B9DE1AA0();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x1E0C80A78](v5);
  v8 = (char *)v16 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = -1 << *(_BYTE *)(v3 + 32);
  v10 = a2 & ~v9;
  if (((*(_QWORD *)(v3 + 64 + ((v10 >> 3) & 0xFFFFFFFFFFFFF8)) >> v10) & 1) != 0)
  {
    v11 = ~v9;
    v12 = *(_QWORD *)(v6 + 72);
    v13 = *(void (**)(char *, unint64_t, uint64_t))(v6 + 16);
    do
    {
      v13(v8, *(_QWORD *)(v3 + 48) + v12 * v10, v5);
      sub_1B9DCC908(&qword_1ED5CD670, (void (*)(uint64_t))MEMORY[0x1E0D3FC28]);
      v14 = sub_1B9DE2130();
      (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
      if ((v14 & 1) != 0)
        break;
      v10 = (v10 + 1) & v11;
    }
    while (((*(_QWORD *)(v3 + 64 + ((v10 >> 3) & 0xFFFFFFFFFFFFF8)) >> v10) & 1) != 0);
  }
  return v10;
}

unint64_t sub_1B9DCC0E0(double *a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v6;
  double v7;
  double v8;
  uint64_t v9;
  BOOL v10;
  uint64_t v12;
  uint64_t v13;
  double v14;

  v3 = -1 << *(_BYTE *)(v2 + 32);
  v4 = a2 & ~v3;
  if (((*(_QWORD *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFF8)) >> v4) & 1) != 0)
  {
    v12 = ~v3;
    v13 = *((_QWORD *)a1 + 1);
    v14 = *a1;
    do
    {
      v6 = *(_QWORD *)(v2 + 48) + 88 * v4;
      v8 = *(double *)(v6 + 16);
      v7 = *(double *)(v6 + 24);
      v9 = *(unsigned __int8 *)(v6 + 32);
      v10 = *(_QWORD *)v6 == *(_QWORD *)&v14 && *(_QWORD *)(v6 + 8) == v13;
      if ((v10 || (sub_1B9DE28A4() & 1) != 0) && v8 == a1[2] && v7 == a1[3])
        __asm { BR              X8 }
      v4 = (v4 + 1) & v12;
    }
    while (((*(_QWORD *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFF8)) >> v4) & 1) != 0);
  }
  return v4;
}

unint64_t sub_1B9DCC5C8(uint64_t a1, uint64_t a2)
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

void sub_1B9DCC664(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char v6;
  uint64_t v7;
  uint64_t v8;
  char v10;
  uint64_t v11;
  uint64_t v12;
  char v13;
  uint64_t v14;
  uint64_t v15;
  char v17;
  char v18;

  v4 = -1 << *(_BYTE *)(v2 + 32);
  v5 = a2 & ~v4;
  OUTLINED_FUNCTION_1_51();
  if ((v6 & 1) != 0)
  {
    v7 = OUTLINED_FUNCTION_18_17();
    if (v7 == OUTLINED_FUNCTION_15_16() && v3 == v8)
    {
LABEL_16:
      OUTLINED_FUNCTION_56_4();
      goto LABEL_17;
    }
    v10 = OUTLINED_FUNCTION_29();
    OUTLINED_FUNCTION_0_20();
    OUTLINED_FUNCTION_16_0();
    if ((v10 & 1) == 0)
    {
      v11 = ~v4;
      v12 = (v5 + 1) & v11;
      OUTLINED_FUNCTION_1_51();
      if ((v13 & 1) != 0)
      {
        while (1)
        {
          v14 = OUTLINED_FUNCTION_18_17();
          if (v14 == OUTLINED_FUNCTION_15_16() && v3 == v15)
            goto LABEL_16;
          v17 = OUTLINED_FUNCTION_29();
          OUTLINED_FUNCTION_0_20();
          swift_bridgeObjectRelease();
          if ((v17 & 1) == 0)
          {
            v12 = (v12 + 1) & v11;
            OUTLINED_FUNCTION_1_51();
            if ((v18 & 1) != 0)
              continue;
          }
          break;
        }
      }
    }
  }
LABEL_17:
  OUTLINED_FUNCTION_1_2();
}

uint64_t sub_1B9DCC768(void *a1)
{
  id v1;
  void *v2;
  uint64_t v3;

  v1 = objc_msgSend(a1, sel_errorComment);
  if (!v1)
    return 0;
  v2 = v1;
  v3 = sub_1B9DE2160();

  return v3;
}

void sub_1B9DCC7C8()
{
  uint64_t v0;

  sub_1B9DCB338(v0);
}

void sub_1B9DCC7D0()
{
  uint64_t v0;

  sub_1B9DCB104(v0);
}

uint64_t sub_1B9DCC7D8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char v5;

  v0 = sub_1B9DE2160();
  v2 = v1;
  if (v0 == sub_1B9DE2160() && v2 == v3)
    v5 = 1;
  else
    v5 = OUTLINED_FUNCTION_29();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v5 & 1;
}

uint64_t sub_1B9DCC858()
{
  swift_release();
  return swift_deallocObject();
}

void sub_1B9DCC87C()
{
  uint64_t v0;

  sub_1B9DCA788(*(_QWORD *)(v0 + 16), *(double *)(v0 + 24), *(double *)(v0 + 32));
}

uint64_t sub_1B9DCC888()
{
  uint64_t v0;

  __swift_destroy_boxed_opaque_existential_2(v0 + 24);
  return swift_deallocObject();
}

uint64_t sub_1B9DCC8B4()
{
  uint64_t v0;

  return sub_1B9DCA828(*(_QWORD *)(v0 + 16), v0 + 24);
}

uint64_t sub_1B9DCC8C0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED5CFC00);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

void sub_1B9DCC908(unint64_t *a1, void (*a2)(uint64_t))
{
  uint64_t v3;

  if (!*a1)
  {
    a2(255);
    v3 = OUTLINED_FUNCTION_48_4();
    atomic_store(MEMORY[0x1BCCCEEA8](v3), a1);
  }
  OUTLINED_FUNCTION_1();
}

id sub_1B9DCC940(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, char a7)
{
  id result;

  if (a7 == 2)
  {
    swift_bridgeObjectRetain();
    return (id)swift_bridgeObjectRetain();
  }
  else if (!a7)
  {
    return a2;
  }
  return result;
}

void destroy for VideoObserver.Change(uint64_t a1)
{
  sub_1B9DCC998(*(_QWORD *)a1, *(void **)(a1 + 8), *(_QWORD *)(a1 + 16), *(_QWORD *)(a1 + 24), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_BYTE *)(a1 + 48));
}

void sub_1B9DCC998(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, char a7)
{
  if (a7 == 2)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  else if (!a7)
  {

  }
}

uint64_t initializeWithCopy for VideoObserver.Change(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char v9;

  v3 = *(_QWORD *)a2;
  v4 = *(void **)(a2 + 8);
  v5 = *(_QWORD *)(a2 + 16);
  v6 = *(_QWORD *)(a2 + 24);
  v7 = *(_QWORD *)(a2 + 32);
  v8 = *(_QWORD *)(a2 + 40);
  v9 = *(_BYTE *)(a2 + 48);
  sub_1B9DCC940(*(_QWORD *)a2, v4, v5, v6, v7, v8, v9);
  *(_QWORD *)a1 = v3;
  *(_QWORD *)(a1 + 8) = v4;
  *(_QWORD *)(a1 + 16) = v5;
  *(_QWORD *)(a1 + 24) = v6;
  *(_QWORD *)(a1 + 32) = v7;
  *(_QWORD *)(a1 + 40) = v8;
  *(_BYTE *)(a1 + 48) = v9;
  return a1;
}

uint64_t assignWithCopy for VideoObserver.Change(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char v16;

  v3 = *(_QWORD *)a2;
  v4 = *(void **)(a2 + 8);
  v5 = *(_QWORD *)(a2 + 16);
  v6 = *(_QWORD *)(a2 + 24);
  v7 = *(_QWORD *)(a2 + 32);
  v8 = *(_QWORD *)(a2 + 40);
  v9 = *(_BYTE *)(a2 + 48);
  sub_1B9DCC940(*(_QWORD *)a2, v4, v5, v6, v7, v8, v9);
  v10 = *(_QWORD *)a1;
  v11 = *(void **)(a1 + 8);
  v12 = *(_QWORD *)(a1 + 16);
  v13 = *(_QWORD *)(a1 + 24);
  v14 = *(_QWORD *)(a1 + 32);
  v15 = *(_QWORD *)(a1 + 40);
  *(_QWORD *)a1 = v3;
  *(_QWORD *)(a1 + 8) = v4;
  *(_QWORD *)(a1 + 16) = v5;
  *(_QWORD *)(a1 + 24) = v6;
  *(_QWORD *)(a1 + 32) = v7;
  *(_QWORD *)(a1 + 40) = v8;
  v16 = *(_BYTE *)(a1 + 48);
  *(_BYTE *)(a1 + 48) = v9;
  sub_1B9DCC998(v10, v11, v12, v13, v14, v15, v16);
  return a1;
}

__n128 __swift_memcpy49_8(uint64_t a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;
  __int128 v4;

  result = *(__n128 *)a2;
  v3 = *(_OWORD *)(a2 + 16);
  v4 = *(_OWORD *)(a2 + 32);
  *(_BYTE *)(a1 + 48) = *(_BYTE *)(a2 + 48);
  *(_OWORD *)(a1 + 16) = v3;
  *(_OWORD *)(a1 + 32) = v4;
  *(__n128 *)a1 = result;
  return result;
}

uint64_t assignWithTake for VideoObserver.Change(uint64_t a1, uint64_t a2)
{
  char v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  char v11;

  v3 = *(_BYTE *)(a2 + 48);
  v4 = *(_QWORD *)a1;
  v6 = *(void **)(a1 + 8);
  v5 = *(_QWORD *)(a1 + 16);
  v7 = *(_QWORD *)(a1 + 24);
  v8 = *(_QWORD *)(a1 + 32);
  v9 = *(_QWORD *)(a1 + 40);
  v10 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v10;
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  v11 = *(_BYTE *)(a1 + 48);
  *(_BYTE *)(a1 + 48) = v3;
  sub_1B9DCC998(v4, v6, v5, v7, v8, v9, v11);
  return a1;
}

uint64_t getEnumTagSinglePayload for VideoObserver.Change(uint64_t a1, unsigned int a2)
{
  int v2;
  unsigned int v3;

  if (a2)
  {
    if (a2 >= 0xFB && *(_BYTE *)(a1 + 49))
    {
      v2 = *(_DWORD *)a1 + 250;
    }
    else
    {
      v3 = *(unsigned __int8 *)(a1 + 48);
      if (v3 <= 5)
        v2 = -1;
      else
        v2 = v3 ^ 0xFF;
    }
  }
  else
  {
    v2 = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for VideoObserver.Change(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFA)
  {
    *(_QWORD *)(result + 40) = 0;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_BYTE *)(result + 48) = 0;
    *(_QWORD *)result = a2 - 251;
    if (a3 >= 0xFB)
      *(_BYTE *)(result + 49) = 1;
  }
  else
  {
    if (a3 >= 0xFB)
      *(_BYTE *)(result + 49) = 0;
    if (a2)
      *(_BYTE *)(result + 48) = -(char)a2;
  }
  return result;
}

uint64_t sub_1B9DCCBE0(uint64_t a1)
{
  if (*(unsigned __int8 *)(a1 + 48) <= 4u)
    return *(unsigned __int8 *)(a1 + 48);
  else
    return (*(_DWORD *)a1 + 5);
}

uint64_t sub_1B9DCCBF8(uint64_t result, unsigned int a2)
{
  if (a2 >= 5)
  {
    *(_QWORD *)result = a2 - 5;
    *(_OWORD *)(result + 8) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_QWORD *)(result + 40) = 0;
    LOBYTE(a2) = 5;
  }
  *(_BYTE *)(result + 48) = a2;
  return result;
}

ValueMetadata *type metadata accessor for VideoObserver.Change()
{
  return &type metadata for VideoObserver.Change;
}

uint64_t OUTLINED_FUNCTION_2_44()
{
  return sub_1B9DE213C();
}

id OUTLINED_FUNCTION_3_36()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  return objc_msgSend(v2, (SEL)(v5 + 3912), v1, v3, v4, v0);
}

id OUTLINED_FUNCTION_5_26()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;

  return objc_msgSend(v2, (SEL)(v4 + 3144), v1, v3, v0);
}

uint64_t OUTLINED_FUNCTION_6_24()
{
  return sub_1B9DE261C();
}

uint64_t OUTLINED_FUNCTION_7_25(uint64_t a1, uint64_t a2)
{
  return sub_1B9D45A64(a1, a2);
}

uint64_t OUTLINED_FUNCTION_8_21()
{
  return swift_dynamicCast();
}

uint64_t OUTLINED_FUNCTION_13_16@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(a1 + 8))(v2, v1);
}

uint64_t OUTLINED_FUNCTION_15_16()
{
  return sub_1B9DE2160();
}

void OUTLINED_FUNCTION_17_18(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v3;

  sub_1B9DC9F88(a1, v3, a3);
}

uint64_t OUTLINED_FUNCTION_18_17()
{
  return sub_1B9DE2160();
}

void OUTLINED_FUNCTION_21_13()
{
  JUMPOUT(0x1BCCCE2A8);
}

uint64_t OUTLINED_FUNCTION_22_11()
{
  return sub_1B9DE213C();
}

id OUTLINED_FUNCTION_24_9(uint64_t a1, const char *a2)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  return objc_msgSend(v2, a2, v3, v4, v5);
}

uint64_t OUTLINED_FUNCTION_25_9()
{
  return sub_1B9DE294C();
}

uint64_t OUTLINED_FUNCTION_26_4()
{
  return sub_1B9DE294C();
}

uint64_t OUTLINED_FUNCTION_27_7()
{
  return sub_1B9DE213C();
}

uint64_t OUTLINED_FUNCTION_29_7()
{
  uint64_t v0;
  uint64_t v1;

  return sub_1B9D837D0(v0, v1 - 112);
}

uint64_t OUTLINED_FUNCTION_30_7()
{
  return sub_1B9DE294C();
}

uint64_t OUTLINED_FUNCTION_31_4()
{
  return swift_bridgeObjectRetain();
}

unint64_t OUTLINED_FUNCTION_32_10(uint64_t a1, uint64_t a2)
{
  return sub_1B9DCBC54(a1, a2);
}

double OUTLINED_FUNCTION_34_8()
{
  _OWORD *v0;
  double result;

  result = 0.0;
  *v0 = 0u;
  v0[1] = 0u;
  return result;
}

uint64_t OUTLINED_FUNCTION_36_6(uint64_t a1, ...)
{
  va_list va;

  va_start(va, a1);
  return sub_1B9D44EF4((uint64_t)va);
}

uint64_t OUTLINED_FUNCTION_37_6()
{
  return sub_1B9DE21C0();
}

uint64_t OUTLINED_FUNCTION_38_8()
{
  return sub_1B9DE21C0();
}

uint64_t OUTLINED_FUNCTION_40_7()
{
  return sub_1B9DE2160();
}

void OUTLINED_FUNCTION_41_4()
{
  JUMPOUT(0x1BCCCEFF8);
}

uint64_t OUTLINED_FUNCTION_44_5(uint64_t a1)
{
  uint64_t v1;

  return *(_QWORD *)(v1 + 56) + 32 * a1;
}

void OUTLINED_FUNCTION_46_4(char a1@<W8>, uint64_t a2, char a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  a9 = a1;
  sub_1B9DD001C((uint64_t)&a3);
}

uint64_t OUTLINED_FUNCTION_47_5()
{
  uint64_t v0;

  return v0;
}

uint64_t OUTLINED_FUNCTION_48_4()
{
  uint64_t v0;

  return v0;
}

uint64_t OUTLINED_FUNCTION_49_6(uint64_t result)
{
  uint64_t v1;

  *(_QWORD *)(v1 - 136) = *(_QWORD *)(result - 8);
  return result;
}

uint64_t OUTLINED_FUNCTION_52_2()
{
  uint64_t v0;

  return v0;
}

uint64_t OUTLINED_FUNCTION_54_6()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_56_4()
{
  return swift_bridgeObjectRelease_n();
}

uint64_t OUTLINED_FUNCTION_60_3()
{
  return sub_1B9DE213C();
}

uint64_t __swift_memcpy3_1(uint64_t result, __int16 *a2)
{
  __int16 v2;

  v2 = *a2;
  *(_BYTE *)(result + 2) = *((_BYTE *)a2 + 2);
  *(_WORD *)result = v2;
  return result;
}

uint64_t getEnumTagSinglePayload for VideoPlaybackChecks(unsigned __int16 *a1, unsigned int a2)
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
  v3 = (v4 + 2147483646) & 0x7FFFFFFF;
  if (!v5)
    v3 = -1;
  return (v3 + 1);
}

uint64_t storeEnumTagSinglePayload for VideoPlaybackChecks(uint64_t result, unsigned int a2, unsigned int a3)
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

ValueMetadata *type metadata accessor for VideoPlaybackChecks()
{
  return &type metadata for VideoPlaybackChecks;
}

Float64 CMTime.seconds.getter(CMTimeValue a1, uint64_t a2, CMTimeEpoch a3)
{
  CMTime time;

  time.value = a1;
  *(_QWORD *)&time.timescale = a2;
  time.epoch = a3;
  return CMTimeGetSeconds(&time);
}

uint64_t Double.cmTime.getter()
{
  return sub_1B9DE255C();
}

void sub_1B9DCD020()
{
  off_1EF243B20 = &unk_1E717AAC8;
}

uint64_t sub_1B9DCD034()
{
  uint64_t result;
  uint64_t v1;

  result = sub_1B9DE2160();
  qword_1EF243B28 = result;
  unk_1EF243B30 = v1;
  return result;
}

uint64_t sub_1B9DCD060()
{
  uint64_t v0;
  uint64_t v1;

  v0 = sub_1B9DE2004();
  MEMORY[0x1E0C80A78](v0);
  v1 = sub_1B9DE201C();
  __swift_allocate_value_buffer(v1, qword_1EF24B3D8);
  __swift_project_value_buffer(v1, (uint64_t)qword_1EF24B3D8);
  sub_1B9DE1FF8();
  return sub_1B9DE2010();
}

uint64_t sub_1B9DCD12C(unsigned __int8 a1)
{
  char *v1;
  char *v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  char *v12;
  uint64_t result;
  int v14;
  void *v15;
  uint64_t v16;
  void *v17;
  char *v18;
  _QWORD aBlock[6];

  v2 = v1;
  v4 = sub_1B9DE16C8();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x1E0C80A78](v4);
  v7 = (char *)&aBlock[-1] - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_1B9DE16F8();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x1E0C80A78](v8);
  v11 = (char *)&aBlock[-1] - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = &v2[OBJC_IVAR____TtC27AppleMediaServicesUIDynamic11VideoPlayer_state];
  result = swift_beginAccess();
  v14 = *v12;
  if (v14 != a1)
  {
    sub_1B9D661C0(0, (unint64_t *)&qword_1ED5CFB60);
    v15 = (void *)sub_1B9DE24D8();
    v16 = swift_allocObject();
    *(_QWORD *)(v16 + 16) = v2;
    *(_BYTE *)(v16 + 24) = v14;
    aBlock[4] = sub_1B9DD17F4;
    aBlock[5] = v16;
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_1B9D49458;
    aBlock[3] = &block_descriptor_41;
    v17 = _Block_copy(aBlock);
    v18 = v2;
    swift_release();
    sub_1B9DE16E0();
    aBlock[0] = MEMORY[0x1E0DEE9D8];
    sub_1B9D42DA0((unint64_t *)&qword_1ED5CF9C0, (uint64_t (*)(uint64_t))MEMORY[0x1E0DEF4F8], MEMORY[0x1E0DEF510]);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED5CFAD0);
    sub_1B9D4949C();
    sub_1B9DE261C();
    MEMORY[0x1BCCCE2A8](0, v11, v7, v17);
    _Block_release(v17);

    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
    return (*(uint64_t (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  }
  return result;
}

uint64_t sub_1B9DCD350(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t result;
  uint64_t v6;
  uint64_t ObjectType;

  v4 = a1 + OBJC_IVAR____TtC27AppleMediaServicesUIDynamic11VideoPlayer_delegate;
  swift_beginAccess();
  result = MEMORY[0x1BCCCEFF8](v4);
  if (result)
  {
    v6 = *(_QWORD *)(v4 + 8);
    ObjectType = swift_getObjectType();
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v6 + 8))(a2, a1, ObjectType, v6);
    return swift_unknownObjectRelease();
  }
  return result;
}

void VideoPlayer.state.getter()
{
  OUTLINED_FUNCTION_3_5();
  OUTLINED_FUNCTION_13_4();
}

void sub_1B9DCD410(unsigned __int8 a1)
{
  uint64_t v1;
  unsigned __int8 *v3;
  unsigned __int8 v4;

  v3 = (unsigned __int8 *)(v1 + OBJC_IVAR____TtC27AppleMediaServicesUIDynamic11VideoPlayer_state);
  OUTLINED_FUNCTION_6_5();
  v4 = *v3;
  *v3 = a1;
  sub_1B9DCD12C(v4);
  OUTLINED_FUNCTION_3_22();
}

void VideoPlayer.videoUrl.getter(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;

  v3 = v1 + OBJC_IVAR____TtC27AppleMediaServicesUIDynamic11VideoPlayer_videoUrl;
  OUTLINED_FUNCTION_3_5();
  sub_1B9D71D30(v3, a1, &qword_1ED5CE100);
  OUTLINED_FUNCTION_13_4();
}

void VideoPlayer.videoUrl.setter(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;

  v3 = v1 + OBJC_IVAR____TtC27AppleMediaServicesUIDynamic11VideoPlayer_videoUrl;
  OUTLINED_FUNCTION_6_5();
  sub_1B9D9E39C(a1, v3);
  swift_endAccess();
  OUTLINED_FUNCTION_13_4();
}

void VideoPlayer.videoUrl.modify()
{
  OUTLINED_FUNCTION_6_5();
  OUTLINED_FUNCTION_1();
}

void sub_1B9DCD528(id *a1)
{
  id v1;
  id v2;

  v1 = *a1;
  v2 = *a1;
  sub_1B9DCD6A0(v1);
}

id sub_1B9DCD554()
{
  char *v0;
  id *v1;
  id v2;
  objc_super v4;

  v1 = (id *)&v0[OBJC_IVAR____TtC27AppleMediaServicesUIDynamic11VideoPlayer_playerItem];
  swift_beginAccess();
  v2 = *v1;
  sub_1B9DCA24C();

  objc_msgSend(v0, sel_replaceCurrentItemWithPlayerItem_, 0);
  v4.receiver = v0;
  v4.super_class = (Class)type metadata accessor for VideoPlayer(0);
  return objc_msgSendSuper2(&v4, sel_pause);
}

void sub_1B9DCD5F4()
{
  uint64_t v0;
  id *v1;
  id v2;

  v1 = (id *)(v0 + OBJC_IVAR____TtC27AppleMediaServicesUIDynamic11VideoPlayer_playerItem);
  swift_beginAccess();
  v2 = *v1;
  sub_1B9DCA08C();

}

void VideoPlayer.playerItem.getter()
{
  uint64_t v0;
  id *v1;
  id v2;

  v1 = (id *)(v0 + OBJC_IVAR____TtC27AppleMediaServicesUIDynamic11VideoPlayer_playerItem);
  OUTLINED_FUNCTION_3_5();
  v2 = *v1;
  OUTLINED_FUNCTION_13_4();
}

void sub_1B9DCD6A0(void *a1)
{
  uint64_t v1;
  void **v3;
  void *v4;
  id v5;

  sub_1B9DCD554();
  v3 = (void **)(v1 + OBJC_IVAR____TtC27AppleMediaServicesUIDynamic11VideoPlayer_playerItem);
  OUTLINED_FUNCTION_6_5();
  v4 = *v3;
  *v3 = a1;
  v5 = a1;

  sub_1B9DCD5F4();
  OUTLINED_FUNCTION_3_22();
}

void sub_1B9DCD6FC()
{
  uint64_t v0;
  id *v1;
  id v2;

  v1 = (id *)(v0 + OBJC_IVAR____TtC27AppleMediaServicesUIDynamic11VideoPlayer_playerItem);
  OUTLINED_FUNCTION_3_5();
  if (*v1)
    v2 = objc_msgSend(*v1, sel_asset);
  OUTLINED_FUNCTION_13_4();
}

void sub_1B9DCD748()
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
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t *boxed_opaque_existential_2Tm;
  uint64_t v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t ObjectType;
  uint64_t v24;
  BOOL v25;
  uint64_t v26;
  uint64_t v27;
  __int128 v28;
  __int128 v29;

  v1 = v0;
  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED5CE100);
  MEMORY[0x1E0C80A78](v2);
  v4 = (char *)&v27 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = sub_1B9DE201C();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x1E0C80A78](v5);
  v8 = (char *)&v27 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF243B78);
  MEMORY[0x1E0C80A78](v9);
  v11 = (char *)&v27 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = type metadata accessor for VideoPlaybackFailure(0);
  MEMORY[0x1E0C80A78](v12);
  v14 = (char *)&v27 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = v1 + OBJC_IVAR____TtC27AppleMediaServicesUIDynamic11VideoPlayer_failure;
  swift_beginAccess();
  sub_1B9D71D30(v15, (uint64_t)v11, &qword_1EF243B78);
  if (__swift_getEnumTagSinglePayload((uint64_t)v11, 1, v12) == 1)
  {
    sub_1B9D6B278((uint64_t)v11, &qword_1EF243B78);
  }
  else
  {
    sub_1B9DD1744((uint64_t)v11, (uint64_t)v14);
    if (qword_1EF2420E0 != -1)
      swift_once();
    v16 = __swift_project_value_buffer(v5, (uint64_t)qword_1EF24B3D8);
    v27 = v6;
    (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))(v8, v16, v5);
    __swift_instantiateConcreteTypeFromMangledName(&qword_1ED5CFBE0);
    sub_1B9DE18FC();
    *(_OWORD *)(swift_allocObject() + 16) = xmmword_1B9DF0B00;
    sub_1B9DE1860();
    *((_QWORD *)&v29 + 1) = v12;
    boxed_opaque_existential_2Tm = __swift_allocate_boxed_opaque_existential_2Tm((uint64_t *)&v28);
    sub_1B9DD1788((uint64_t)v14, (uint64_t)boxed_opaque_existential_2Tm);
    sub_1B9DE18CC();
    sub_1B9D6B278((uint64_t)&v28, (uint64_t *)&unk_1ED5CFC00);
    sub_1B9DE1860();
    v18 = v1 + OBJC_IVAR____TtC27AppleMediaServicesUIDynamic11VideoPlayer_videoUrl;
    swift_beginAccess();
    sub_1B9D71D30(v18, (uint64_t)v4, &qword_1ED5CE100);
    v19 = sub_1B9DE1554();
    if (__swift_getEnumTagSinglePayload((uint64_t)v4, 1, v19) == 1)
    {
      sub_1B9D6B278((uint64_t)v4, &qword_1ED5CE100);
      v28 = 0u;
      v29 = 0u;
    }
    else
    {
      *((_QWORD *)&v29 + 1) = v19;
      v20 = __swift_allocate_boxed_opaque_existential_2Tm((uint64_t *)&v28);
      (*(void (**)(uint64_t *, char *, uint64_t))(*(_QWORD *)(v19 - 8) + 32))(v20, v4, v19);
    }
    sub_1B9DE1878();
    sub_1B9D6B278((uint64_t)&v28, (uint64_t *)&unk_1ED5CFC00);
    sub_1B9DE1EFC();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v27 + 8))(v8, v5);
    v21 = v1 + OBJC_IVAR____TtC27AppleMediaServicesUIDynamic11VideoPlayer_delegate;
    swift_beginAccess();
    if (MEMORY[0x1BCCCEFF8](v21))
    {
      v22 = *(_QWORD *)(v21 + 8);
      ObjectType = swift_getObjectType();
      (*(void (**)(char *, uint64_t, uint64_t))(v22 + 56))(v14, ObjectType, v22);
      swift_unknownObjectRelease();
    }
    v24 = *(_QWORD *)(v1 + OBJC_IVAR____TtC27AppleMediaServicesUIDynamic11VideoPlayer_failureCount);
    v25 = __OFADD__(v24, 1);
    v26 = v24 + 1;
    if (v25)
    {
      __break(1u);
    }
    else
    {
      *(_QWORD *)(v1 + OBJC_IVAR____TtC27AppleMediaServicesUIDynamic11VideoPlayer_failureCount) = v26;
      sub_1B9DCDBB4();
      sub_1B9DD1188((uint64_t)v14);
    }
  }
}

void sub_1B9DCDB50(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;

  v3 = v1 + OBJC_IVAR____TtC27AppleMediaServicesUIDynamic11VideoPlayer_failure;
  OUTLINED_FUNCTION_6_5();
  sub_1B9DD16FC(a1, v3);
  swift_endAccess();
  sub_1B9DCD748();
  sub_1B9D6B278(a1, &qword_1EF243B78);
  OUTLINED_FUNCTION_3_22();
}

void sub_1B9DCDBB4()
{
  uint64_t v0;

  if ((unint64_t)(*(_QWORD *)(v0 + OBJC_IVAR____TtC27AppleMediaServicesUIDynamic11VideoPlayer_failureCount) - 3) >= 0xFFFFFFFFFFFFFFFELL)
  {
    VideoPlayer.releaseAssets()();
    VideoPlayer.startPreloading()();
  }
}

uint64_t sub_1B9DCDBE8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _BYTE *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _BYTE *v9;
  unsigned __int8 *v12;
  int v13;
  _BYTE *v15;
  uint64_t result;
  void *v17;
  uint64_t v18;
  void *v19;
  _BYTE v20[24];
  _QWORD aBlock[6];

  v1 = v0;
  v2 = sub_1B9DE16C8();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x1E0C80A78](v2);
  v5 = &v20[-((v4 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v6 = sub_1B9DE16F8();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x1E0C80A78](v6);
  v9 = &v20[-((v8 + 15) & 0xFFFFFFFFFFFFFFF0)];
  if (*(_BYTE *)(v0 + OBJC_IVAR____TtC27AppleMediaServicesUIDynamic11VideoPlayer_playbackChecks) == 1
    && *(_BYTE *)(v0 + OBJC_IVAR____TtC27AppleMediaServicesUIDynamic11VideoPlayer_playbackChecks + 1) != 0
    && *(_BYTE *)(v0 + OBJC_IVAR____TtC27AppleMediaServicesUIDynamic11VideoPlayer_playbackChecks + 2) != 0)
  {
    v12 = (unsigned __int8 *)(v0 + OBJC_IVAR____TtC27AppleMediaServicesUIDynamic11VideoPlayer_state);
    swift_beginAccess();
    v13 = *v12;
    if (v13 == 6 || v13 == 1)
      sub_1B9DCD410(2u);
  }
  v15 = (_BYTE *)(v1 + OBJC_IVAR____TtC27AppleMediaServicesUIDynamic11VideoPlayer_shouldBePlaying);
  result = swift_beginAccess();
  if (*v15 == 1)
  {
    sub_1B9D661C0(0, (unint64_t *)&qword_1ED5CFB60);
    v17 = (void *)sub_1B9DE24D8();
    v18 = swift_allocObject();
    swift_unknownObjectWeakInit();
    aBlock[4] = sub_1B9DD17CC;
    aBlock[5] = v18;
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_1B9D49458;
    aBlock[3] = &block_descriptor_35;
    v19 = _Block_copy(aBlock);
    swift_release();
    sub_1B9DE16E0();
    aBlock[0] = MEMORY[0x1E0DEE9D8];
    sub_1B9D42DA0((unint64_t *)&qword_1ED5CF9C0, (uint64_t (*)(uint64_t))MEMORY[0x1E0DEF4F8], MEMORY[0x1E0DEF510]);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED5CFAD0);
    sub_1B9D4949C();
    sub_1B9DE261C();
    MEMORY[0x1BCCCE2A8](0, v9, v5, v19);
    _Block_release(v19);

    (*(void (**)(_BYTE *, uint64_t))(v3 + 8))(v5, v2);
    return (*(uint64_t (**)(_BYTE *, uint64_t))(v7 + 8))(v9, v6);
  }
  return result;
}

void sub_1B9DCDE6C(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  void *v3;

  v1 = a1 + 16;
  swift_beginAccess();
  v2 = (void *)MEMORY[0x1BCCCEFF8](v1);
  if (v2)
  {
    v3 = v2;
    objc_msgSend(v2, sel_play);

  }
}

void VideoPlayer.isPlaying.getter()
{
  char *v0;
  char *v1;
  float v2;
  id v3;

  v1 = &v0[OBJC_IVAR____TtC27AppleMediaServicesUIDynamic11VideoPlayer_state];
  OUTLINED_FUNCTION_3_5();
  if (*v1 != 7)
  {
    objc_msgSend(v0, sel_rate);
    if (v2 > 0.0)
    {
      v3 = objc_msgSend(v0, sel_error);
      if (v3)

    }
  }
  OUTLINED_FUNCTION_13_4();
}

void VideoPlayer.shouldBePlaying.getter()
{
  OUTLINED_FUNCTION_3_5();
  OUTLINED_FUNCTION_13_4();
}

void VideoPlayer.shouldBePlaying.setter(char a1)
{
  uint64_t v1;
  _BYTE *v3;

  v3 = (_BYTE *)(v1 + OBJC_IVAR____TtC27AppleMediaServicesUIDynamic11VideoPlayer_shouldBePlaying);
  OUTLINED_FUNCTION_6_5();
  *v3 = a1;
  OUTLINED_FUNCTION_13_4();
}

void VideoPlayer.shouldBePlaying.modify()
{
  OUTLINED_FUNCTION_6_5();
  OUTLINED_FUNCTION_1();
}

void VideoPlayer.shouldLoopPlayback.getter()
{
  OUTLINED_FUNCTION_3_5();
  OUTLINED_FUNCTION_13_4();
}

void VideoPlayer.shouldLoopPlayback.setter(char a1)
{
  uint64_t v1;
  _BYTE *v3;

  v3 = (_BYTE *)(v1 + OBJC_IVAR____TtC27AppleMediaServicesUIDynamic11VideoPlayer_shouldLoopPlayback);
  OUTLINED_FUNCTION_6_5();
  *v3 = a1;
  OUTLINED_FUNCTION_13_4();
}

void VideoPlayer.shouldLoopPlayback.modify()
{
  OUTLINED_FUNCTION_6_5();
  OUTLINED_FUNCTION_1();
}

uint64_t sub_1B9DCE09C(uint64_t a1)
{
  uint64_t v1;
  id v2;
  uint64_t v3;

  v2 = OUTLINED_FUNCTION_3_6(a1, sel_lock);
  v3 = *(_QWORD *)(v1 + OBJC_IVAR____TtC27AppleMediaServicesUIDynamic11VideoPlayer_lastPlaybackTimeUnsynchronized);
  OUTLINED_FUNCTION_3_6((uint64_t)v2, sel_unlock);
  return v3;
}

id sub_1B9DCE110(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  uint64_t v4;
  void *v9;
  uint64_t v10;

  v9 = *(void **)(v4 + OBJC_IVAR____TtC27AppleMediaServicesUIDynamic11VideoPlayer_lastPlaybackTimeGuard);
  objc_msgSend(v9, sel_lock);
  v10 = v4 + OBJC_IVAR____TtC27AppleMediaServicesUIDynamic11VideoPlayer_lastPlaybackTimeUnsynchronized;
  *(_QWORD *)v10 = a1;
  *(_QWORD *)(v10 + 8) = a2;
  *(_QWORD *)(v10 + 16) = a3;
  *(_BYTE *)(v10 + 24) = a4 & 1;
  return objc_msgSend(v9, sel_unlock);
}

void VideoPlayer.delegate.getter()
{
  OUTLINED_FUNCTION_3_5();
  OUTLINED_FUNCTION_151();
}

void VideoPlayer.delegate.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v4;

  v4 = v2 + OBJC_IVAR____TtC27AppleMediaServicesUIDynamic11VideoPlayer_delegate;
  OUTLINED_FUNCTION_6_5();
  *(_QWORD *)(v4 + 8) = a2;
  swift_unknownObjectWeakAssign();
  swift_unknownObjectRelease();
  OUTLINED_FUNCTION_3_22();
}

void VideoPlayer.delegate.modify(_QWORD *a1)
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t v4;

  v3 = malloc(0x38uLL);
  *a1 = v3;
  v4 = OBJC_IVAR____TtC27AppleMediaServicesUIDynamic11VideoPlayer_delegate;
  v3[5] = v1;
  v3[6] = v4;
  OUTLINED_FUNCTION_6_5();
  OUTLINED_FUNCTION_151();
}

void (*sub_1B9DCE26C(uint64_t a1))(uint64_t a1, char a2)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v3 = *(_QWORD *)(v1 + 8);
  *(_QWORD *)(v2 + 24) = a1;
  *(_QWORD *)(v2 + 32) = v3;
  return sub_1B9DCE290;
}

void sub_1B9DCE290(uint64_t a1, char a2)
{
  void *v3;

  v3 = *(void **)a1;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)a1 + 40) + *(_QWORD *)(*(_QWORD *)a1 + 48) + 8) = *(_QWORD *)(*(_QWORD *)a1 + 32);
  swift_unknownObjectWeakAssign();
  if ((a2 & 1) != 0)
  {
    swift_unknownObjectRelease();
    swift_endAccess();
  }
  else
  {
    swift_endAccess();
    OUTLINED_FUNCTION_14_6();
  }
  free(v3);
}

void VideoPlayer.__allocating_init(with:)()
{
  uint64_t v0;

  OUTLINED_FUNCTION_9_21();
  VideoPlayer.init(with:)(v0);
  OUTLINED_FUNCTION_1();
}

char *VideoPlayer.init(with:)(uint64_t a1)
{
  _BYTE *v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  _BYTE *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  char *v20;
  char *v21;
  objc_super v23;

  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED5CE100);
  OUTLINED_FUNCTION_39();
  MEMORY[0x1E0C80A78](v3);
  OUTLINED_FUNCTION_0_13();
  v6 = v5 - v4;
  v1[OBJC_IVAR____TtC27AppleMediaServicesUIDynamic11VideoPlayer_state] = 0;
  v7 = (uint64_t)&v1[OBJC_IVAR____TtC27AppleMediaServicesUIDynamic11VideoPlayer_videoUrl];
  v8 = OUTLINED_FUNCTION_2_4();
  OUTLINED_FUNCTION_32_11(v7, 1);
  v9 = OBJC_IVAR____TtC27AppleMediaServicesUIDynamic11VideoPlayer_videoObserver;
  v10 = objc_allocWithZone((Class)type metadata accessor for VideoObserver());
  v11 = v1;
  *(_QWORD *)&v1[v9] = objc_msgSend(v10, sel_init);
  *(_QWORD *)&v11[OBJC_IVAR____TtC27AppleMediaServicesUIDynamic11VideoPlayer_playerItem] = 0;
  v12 = (uint64_t)&v11[OBJC_IVAR____TtC27AppleMediaServicesUIDynamic11VideoPlayer_failure];
  v13 = type metadata accessor for VideoPlaybackFailure(0);
  OUTLINED_FUNCTION_33_8(v12, v14, v15, v13);
  *(_QWORD *)&v11[OBJC_IVAR____TtC27AppleMediaServicesUIDynamic11VideoPlayer_failureCount] = 0;
  v16 = &v11[OBJC_IVAR____TtC27AppleMediaServicesUIDynamic11VideoPlayer_playbackChecks];
  *(_WORD *)v16 = 0;
  v16[2] = 0;
  v11[OBJC_IVAR____TtC27AppleMediaServicesUIDynamic11VideoPlayer_shouldBePlaying] = 0;
  v11[OBJC_IVAR____TtC27AppleMediaServicesUIDynamic11VideoPlayer_shouldLoopPlayback] = 0;
  v17 = OBJC_IVAR____TtC27AppleMediaServicesUIDynamic11VideoPlayer_lastPlaybackTimeGuard;
  *(_QWORD *)&v11[v17] = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0D41860]), sel_init);
  v18 = &v11[OBJC_IVAR____TtC27AppleMediaServicesUIDynamic11VideoPlayer_lastPlaybackTimeUnsynchronized];
  *(_QWORD *)v18 = 0;
  *((_QWORD *)v18 + 1) = 0;
  *((_QWORD *)v18 + 2) = 0;
  v18[24] = 1;
  *(_QWORD *)&v11[OBJC_IVAR____TtC27AppleMediaServicesUIDynamic11VideoPlayer_delegate + 8] = 0;
  swift_unknownObjectWeakInit();
  v19 = *(_QWORD *)(v8 - 8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v19 + 16))(v6, a1, v8);
  OUTLINED_FUNCTION_32_11(v6, 0);
  OUTLINED_FUNCTION_6_5();
  sub_1B9D9E39C(v6, v7);
  swift_endAccess();

  v23.receiver = v11;
  v23.super_class = (Class)type metadata accessor for VideoPlayer(0);
  v20 = (char *)objc_msgSendSuper2(&v23, sel_init);
  objc_msgSend(v20, sel_setPreventsDisplaySleepDuringVideoPlayback_, 0);
  objc_msgSend(v20, sel_setMuted_, 1);
  objc_msgSend(v20, sel_setActionAtItemEnd_, 1);
  *(_QWORD *)(*(_QWORD *)&v20[OBJC_IVAR____TtC27AppleMediaServicesUIDynamic11VideoPlayer_videoObserver]
            + OBJC_IVAR____TtC27AppleMediaServicesUIDynamic13VideoObserver_delegate
            + 8) = &off_1E7182708;
  swift_unknownObjectWeakAssign();
  v21 = v20;
  sub_1B9DC9FC4();

  (*(void (**)(uint64_t, uint64_t))(v19 + 8))(a1, v8);
  return v21;
}

uint64_t type metadata accessor for VideoPlaybackFailure(uint64_t a1)
{
  return sub_1B9DAAA64(a1, qword_1EF243BF0);
}

uint64_t type metadata accessor for VideoPlayer(uint64_t a1)
{
  return sub_1B9DAAA64(a1, (uint64_t *)&unk_1EF243C50);
}

id VideoPlayer.__deallocating_deinit()
{
  char *v0;
  char *v1;
  uint64_t v2;
  void *v3;
  id *v4;
  id v5;
  id v6;
  id v7;
  id v8;
  objc_super v10;

  v1 = v0;
  v2 = OBJC_IVAR____TtC27AppleMediaServicesUIDynamic11VideoPlayer_videoObserver;
  v3 = *(void **)&v0[OBJC_IVAR____TtC27AppleMediaServicesUIDynamic11VideoPlayer_videoObserver];
  v4 = (id *)&v0[OBJC_IVAR____TtC27AppleMediaServicesUIDynamic11VideoPlayer_playerItem];
  OUTLINED_FUNCTION_3_5();
  v5 = *v4;
  v6 = v3;
  sub_1B9DCA24C();

  v7 = *(id *)&v1[v2];
  sub_1B9DCA028();

  v8 = *(id *)&v1[v2];
  sub_1B9DCA890(v1);

  v10.receiver = v1;
  v10.super_class = (Class)type metadata accessor for VideoPlayer(0);
  return objc_msgSendSuper2(&v10, sel_dealloc);
}

Swift::Void __swiftcall VideoPlayer.play()()
{
  char *v0;
  char *v1;
  char *v2;
  char v3;
  char *v4;
  id *v5;
  id v6;
  id v7;
  char *v8;
  objc_super v9;

  v1 = v0;
  v2 = &v0[OBJC_IVAR____TtC27AppleMediaServicesUIDynamic11VideoPlayer_shouldBePlaying];
  OUTLINED_FUNCTION_6_5();
  *v2 = 1;
  VideoPlayer.isPlaying.getter();
  if ((v3 & 1) == 0)
  {
    v4 = &v1[OBJC_IVAR____TtC27AppleMediaServicesUIDynamic11VideoPlayer_state];
    OUTLINED_FUNCTION_3_5();
    if (*v4)
    {
      v5 = (id *)&v1[OBJC_IVAR____TtC27AppleMediaServicesUIDynamic11VideoPlayer_playerItem];
      OUTLINED_FUNCTION_3_5();
      if (*v5)
      {
        v6 = *v5;
        v7 = objc_msgSend(v1, sel_currentItem);

        if (!v7)
        {
          sub_1B9DC9FC4();
          objc_msgSend(v1, sel_replaceCurrentItemWithPlayerItem_, v6);
        }
        v8 = &v1[OBJC_IVAR____TtC27AppleMediaServicesUIDynamic11VideoPlayer_playbackChecks];
        if (v1[OBJC_IVAR____TtC27AppleMediaServicesUIDynamic11VideoPlayer_playbackChecks] == 1
          && (v8[1] & 1) != 0
          && (v8[2] & 1) != 0)
        {
          v9.receiver = v1;
          v9.super_class = (Class)type metadata accessor for VideoPlayer(0);
          objc_msgSendSuper2(&v9, sel_play);
        }

      }
    }
    else
    {
      VideoPlayer.startPreloading()();
    }
  }
}

Swift::Void __swiftcall VideoPlayer.pause()()
{
  char *v0;
  char *v1;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for VideoPlayer(0);
  objc_msgSendSuper2(&v2, sel_pause);
  v1 = &v0[OBJC_IVAR____TtC27AppleMediaServicesUIDynamic11VideoPlayer_shouldBePlaying];
  OUTLINED_FUNCTION_6_5();
  *v1 = 0;
}

Swift::Void __swiftcall VideoPlayer.restart()()
{
  void *v0;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD v6[3];
  objc_super v7;

  if (*((_BYTE *)v0 + OBJC_IVAR____TtC27AppleMediaServicesUIDynamic11VideoPlayer_playbackChecks) == 1
    && *((_BYTE *)v0 + OBJC_IVAR____TtC27AppleMediaServicesUIDynamic11VideoPlayer_playbackChecks + 1) != 0
    && *((_BYTE *)v0 + OBJC_IVAR____TtC27AppleMediaServicesUIDynamic11VideoPlayer_playbackChecks + 2) != 0)
  {
    v3 = MEMORY[0x1E0CA2E68];
    v4 = *MEMORY[0x1E0CA2E68];
    v5 = *(_QWORD *)(MEMORY[0x1E0CA2E68] + 16);
    v7.receiver = v0;
    v7.super_class = (Class)type metadata accessor for VideoPlayer(0);
    v6[0] = v4;
    v6[1] = *(_QWORD *)(v3 + 8);
    v6[2] = v5;
    objc_msgSendSuper2(&v7, sel_seekToTime_, v6);
  }
  OUTLINED_FUNCTION_17_7();
}

Swift::Void __swiftcall VideoPlayer.startPreloading()()
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
  _BYTE *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t ObjectType;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  _QWORD v19[5];

  v2 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED5CE100);
  OUTLINED_FUNCTION_39();
  MEMORY[0x1E0C80A78](v3);
  OUTLINED_FUNCTION_0_13();
  v6 = v5 - v4;
  v7 = OUTLINED_FUNCTION_2_4();
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x1E0C80A78](v7);
  OUTLINED_FUNCTION_77_1();
  v9 = v2 + OBJC_IVAR____TtC27AppleMediaServicesUIDynamic11VideoPlayer_videoUrl;
  OUTLINED_FUNCTION_3_5();
  sub_1B9D71D30(v9, v6, &qword_1ED5CE100);
  if (__swift_getEnumTagSinglePayload(v6, 1, v7) == 1)
  {
    sub_1B9D6B278(v6, &qword_1ED5CE100);
  }
  else
  {
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v8 + 32))(v1, v6, v7);
    v10 = (_BYTE *)(v2 + OBJC_IVAR____TtC27AppleMediaServicesUIDynamic11VideoPlayer_state);
    OUTLINED_FUNCTION_3_5();
    if (*v10)
    {
      OUTLINED_FUNCTION_18_18();
    }
    else
    {
      sub_1B9DCD6FC();
      v12 = v11;
      objc_msgSend(v11, sel_cancelLoading);

      sub_1B9DCD410(1u);
      v13 = v2 + OBJC_IVAR____TtC27AppleMediaServicesUIDynamic11VideoPlayer_delegate;
      OUTLINED_FUNCTION_3_5();
      if (MEMORY[0x1BCCCEFF8](v13))
      {
        v14 = *(_QWORD *)(v13 + 8);
        ObjectType = swift_getObjectType();
        (*(void (**)(uint64_t, uint64_t, uint64_t))(v14 + 32))(v2, ObjectType, v14);
        OUTLINED_FUNCTION_14_6();
      }
      sub_1B9D661C0(0, &qword_1EF243B70);
      sub_1B9D653E4(v1);
      OUTLINED_FUNCTION_7_3();
      OUTLINED_FUNCTION_23_6();
      OUTLINED_FUNCTION_7_3();
      OUTLINED_FUNCTION_23_6();
      sub_1B9D661C0(0, (unint64_t *)&qword_1ED5CFB60);
      v17 = v16;
      swift_retain();
      v18 = sub_1B9DE24D8();
      v19[3] = v17;
      v19[4] = MEMORY[0x1E0D416D8];
      v19[0] = v18;
      sub_1B9DE1F74();
      swift_release();
      swift_release();
      swift_release();
      __swift_destroy_boxed_opaque_existential_2((uint64_t)v19);
      OUTLINED_FUNCTION_18_18();
      swift_release();
    }
  }
}

uint64_t sub_1B9DCEC34()
{
  swift_unknownObjectWeakDestroy();
  return swift_deallocObject();
}

void sub_1B9DCEC58(void **a1, uint64_t a2)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;

  v2 = *a1;
  v3 = a2 + 16;
  swift_beginAccess();
  v4 = MEMORY[0x1BCCCEFF8](v3);
  if (v4)
  {
    v5 = (void *)v4;
    sub_1B9DCED98(v2);

  }
}

void sub_1B9DCECB0(void **a1)
{
  uint64_t v1;

  sub_1B9DCEC58(a1, v1);
}

void sub_1B9DCECB8(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF243B78);
  MEMORY[0x1E0C80A78](v3);
  v5 = (uint64_t *)((char *)&v9 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0));
  swift_beginAccess();
  v6 = MEMORY[0x1BCCCEFF8](a2 + 16);
  if (v6)
  {
    v7 = (void *)v6;
    *v5 = sub_1B9DE14AC();
    v8 = type metadata accessor for VideoPlaybackFailure(0);
    swift_storeEnumTagMultiPayload();
    __swift_storeEnumTagSinglePayload((uint64_t)v5, 0, 1, v8);
    sub_1B9DCDB50((uint64_t)v5);

  }
}

void sub_1B9DCED90(uint64_t a1)
{
  uint64_t v1;

  sub_1B9DCECB8(a1, v1);
}

void sub_1B9DCED98(void *a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;
  _QWORD v7[6];

  if (qword_1EF2420D0 != -1)
    swift_once();
  v2 = (void *)sub_1B9DE2280();
  v3 = OUTLINED_FUNCTION_7_3();
  swift_unknownObjectWeakInit();
  v4 = swift_allocObject();
  *(_QWORD *)(v4 + 16) = v3;
  *(_QWORD *)(v4 + 24) = a1;
  v7[4] = sub_1B9DD163C;
  v7[5] = v4;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 1107296256;
  v7[2] = sub_1B9D49458;
  v7[3] = &block_descriptor_18;
  v5 = _Block_copy(v7);
  v6 = a1;
  swift_release();
  objc_msgSend(v6, sel_loadValuesAsynchronouslyForKeys_completionHandler_, v2, v5);
  _Block_release(v5);

  OUTLINED_FUNCTION_17_7();
}

void sub_1B9DCEEAC(uint64_t a1, void *a2)
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
  char *v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  uint64_t v23;
  uint64_t v24;
  char *v25;
  uint64_t v26;
  char *v27;
  uint64_t v28;
  uint64_t v29;
  id v30;
  id v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  char v36;
  void (*v37)(char *, uint64_t);
  uint64_t v38;
  uint64_t *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  id v44;
  void *v45;
  void *v46;
  id v47;
  id v48;
  id v49;
  id v50;
  void *v51;
  uint64_t v52;
  unint64_t v53;
  uint64_t v54;
  char v55;
  uint64_t v56;
  unsigned int v57;
  uint64_t v58;
  unint64_t v59;
  void *v60;
  void *v61;
  _QWORD *v62;
  void *v63;
  id v64;
  id v65;
  id v66;
  char *v67;
  char *v68;
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
  void *v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t *boxed_opaque_existential_2Tm;
  void *v83;
  uint64_t v84;
  void *v85;
  void *v86;
  id v87;
  char *v88;
  char *v89;
  uint64_t v90;
  id v91;
  char *v92;
  void *v93;
  _QWORD *v94;
  void *v95;
  void *v96;
  id v97;
  char *v98;
  char *v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  char *v105;
  char *v106;
  uint64_t v107;
  uint64_t v108;
  char *v109;
  char *v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  void *v115;
  id v116;
  __int128 aBlock;
  __int128 v118;
  uint64_t (*v119)(_QWORD);
  _QWORD *v120;
  uint64_t v121;

  v121 = *MEMORY[0x1E0C80C00];
  v4 = sub_1B9DE16C8();
  v111 = *(_QWORD *)(v4 - 8);
  MEMORY[0x1E0C80A78](v4);
  v109 = (char *)&v101 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_1B9DE16F8();
  v112 = *(_QWORD *)(v6 - 8);
  v113 = v6;
  MEMORY[0x1E0C80A78](v6);
  v110 = (char *)&v101 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v108 = sub_1B9DE201C();
  v107 = *(_QWORD *)(v108 - 8);
  v8 = MEMORY[0x1E0C80A78](v108);
  v105 = (char *)&v101 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v8);
  v106 = (char *)&v101 - v10;
  v11 = sub_1B9DE1554();
  v114 = *(_QWORD *)(v11 - 8);
  MEMORY[0x1E0C80A78](v11);
  v13 = (char *)&v101 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF243C68);
  MEMORY[0x1E0C80A78](v14);
  v16 = (char *)&v101 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED5CE100);
  v18 = MEMORY[0x1E0C80A78](v17);
  v104 = (uint64_t)&v101 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  v20 = MEMORY[0x1E0C80A78](v18);
  v22 = (char *)&v101 - v21;
  v23 = MEMORY[0x1E0C80A78](v20);
  v25 = (char *)&v101 - v24;
  MEMORY[0x1E0C80A78](v23);
  v27 = (char *)&v101 - v26;
  swift_beginAccess();
  v28 = MEMORY[0x1BCCCEFF8](a1 + 16);
  if (!v28)
    return;
  v29 = v28;
  v103 = v4;
  v116 = a2;
  v30 = objc_msgSend(a2, sel_URL);
  v115 = (void *)v29;
  v31 = v30;
  sub_1B9DE1518();

  v32 = v115;
  __swift_storeEnumTagSinglePayload((uint64_t)v27, 0, 1, v11);
  v33 = (uint64_t)v32 + OBJC_IVAR____TtC27AppleMediaServicesUIDynamic11VideoPlayer_videoUrl;
  swift_beginAccess();
  sub_1B9D71D30(v33, (uint64_t)v25, &qword_1ED5CE100);
  v34 = (uint64_t)&v16[*(int *)(v14 + 48)];
  sub_1B9D71D30((uint64_t)v27, (uint64_t)v16, &qword_1ED5CE100);
  sub_1B9D71D30((uint64_t)v25, v34, &qword_1ED5CE100);
  if (__swift_getEnumTagSinglePayload((uint64_t)v16, 1, v11) == 1)
  {
    sub_1B9D6B278((uint64_t)v25, &qword_1ED5CE100);
    sub_1B9D6B278((uint64_t)v27, &qword_1ED5CE100);
    if (__swift_getEnumTagSinglePayload(v34, 1, v11) == 1)
    {
      sub_1B9D6B278((uint64_t)v16, &qword_1ED5CE100);
      goto LABEL_10;
    }
    goto LABEL_7;
  }
  sub_1B9D71D30((uint64_t)v16, (uint64_t)v22, &qword_1ED5CE100);
  if (__swift_getEnumTagSinglePayload(v34, 1, v11) == 1)
  {
    sub_1B9D6B278((uint64_t)v25, &qword_1ED5CE100);
    sub_1B9D6B278((uint64_t)v27, &qword_1ED5CE100);
    (*(void (**)(char *, uint64_t))(v114 + 8))(v22, v11);
LABEL_7:
    sub_1B9D6B278((uint64_t)v16, &qword_1EF243C68);
LABEL_8:

    return;
  }
  v35 = v114;
  (*(void (**)(char *, uint64_t, uint64_t))(v114 + 32))(v13, v34, v11);
  sub_1B9D42DA0(&qword_1EF243C70, (uint64_t (*)(uint64_t))MEMORY[0x1E0CAFFF8], MEMORY[0x1E0CB0028]);
  v36 = sub_1B9DE2130();
  v37 = *(void (**)(char *, uint64_t))(v35 + 8);
  v37(v13, v11);
  sub_1B9D6B278((uint64_t)v25, &qword_1ED5CE100);
  sub_1B9D6B278((uint64_t)v27, &qword_1ED5CE100);
  v37(v22, v11);
  v32 = v115;
  sub_1B9D6B278((uint64_t)v16, &qword_1ED5CE100);
  if ((v36 & 1) == 0)
    goto LABEL_8;
LABEL_10:
  if (qword_1EF2420D0 != -1)
    swift_once();
  v38 = *((_QWORD *)off_1EF243B20 + 2);
  if (v38)
  {
    v101 = v33;
    v102 = swift_bridgeObjectRetain();
    v39 = (uint64_t *)(v102 + 40);
    while (1)
    {
      v41 = *(v39 - 1);
      v40 = *v39;
      v42 = swift_allocObject();
      *(_QWORD *)(v42 + 16) = 0;
      swift_bridgeObjectRetain();
      v43 = (void *)sub_1B9DE213C();
      *(_QWORD *)&aBlock = *(_QWORD *)(v42 + 16);
      v44 = objc_msgSend(v116, sel_statusOfValueForKey_error_, v43, &aBlock);

      v45 = (void *)aBlock;
      v46 = *(void **)(v42 + 16);
      *(_QWORD *)(v42 + 16) = aBlock;
      v47 = v45;

      if (v44 == (id)3)
        break;
      v39 += 2;
      swift_bridgeObjectRelease();
      swift_release();
      if (!--v38)
      {
        swift_bridgeObjectRelease();
        v33 = v101;
        goto LABEL_17;
      }
    }
    swift_bridgeObjectRelease();
    if (qword_1EF2420E0 != -1)
      swift_once();
    v76 = v108;
    v77 = __swift_project_value_buffer(v108, (uint64_t)qword_1EF24B3D8);
    v78 = v107;
    (*(void (**)(char *, uint64_t, uint64_t))(v107 + 16))(v106, v77, v76);
    __swift_instantiateConcreteTypeFromMangledName(&qword_1ED5CFBE0);
    sub_1B9DE18FC();
    *(_OWORD *)(swift_allocObject() + 16) = xmmword_1B9DEFC60;
    sub_1B9DE1860();
    *((_QWORD *)&v118 + 1) = MEMORY[0x1E0DEA968];
    *(_QWORD *)&aBlock = v41;
    *((_QWORD *)&aBlock + 1) = v40;
    swift_bridgeObjectRetain();
    sub_1B9DE18CC();
    sub_1B9D6B278((uint64_t)&aBlock, (uint64_t *)&unk_1ED5CFC00);
    v79 = *(void **)(v42 + 16);
    v80 = v113;
    if (v79)
    {
      sub_1B9D661C0(0, &qword_1EF243B08);
      *((_QWORD *)&v118 + 1) = v81;
      *(_QWORD *)&aBlock = v79;
    }
    else
    {
      aBlock = 0u;
      v118 = 0u;
    }
    v91 = v79;
    sub_1B9DE18F0();
    sub_1B9D6B278((uint64_t)&aBlock, (uint64_t *)&unk_1ED5CFC00);
    v92 = v106;
    sub_1B9DE1EFC();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v78 + 8))(v92, v76);
    sub_1B9D661C0(0, (unint64_t *)&qword_1ED5CFB60);
    v93 = (void *)sub_1B9DE24D8();
    v94 = (_QWORD *)swift_allocObject();
    v95 = v115;
    v94[2] = v115;
    v94[3] = v41;
    v94[4] = v40;
    v94[5] = v42;
    v119 = (uint64_t (*)(_QWORD))sub_1B9DD16F0;
    v120 = v94;
    *(_QWORD *)&aBlock = MEMORY[0x1E0C809B0];
    *((_QWORD *)&aBlock + 1) = 1107296256;
    *(_QWORD *)&v118 = sub_1B9D49458;
    *((_QWORD *)&v118 + 1) = &block_descriptor_31;
    v96 = _Block_copy(&aBlock);
    v97 = v95;
    swift_retain();
    swift_release();
    v98 = v110;
    sub_1B9DE16E0();
    *(_QWORD *)&aBlock = MEMORY[0x1E0DEE9D8];
    sub_1B9D42DA0((unint64_t *)&qword_1ED5CF9C0, (uint64_t (*)(uint64_t))MEMORY[0x1E0DEF4F8], MEMORY[0x1E0DEF510]);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED5CFAD0);
    sub_1B9D4949C();
    v99 = v109;
    v100 = v103;
    sub_1B9DE261C();
    MEMORY[0x1BCCCE2A8](0, v98, v99, v96);
    _Block_release(v96);

    (*(void (**)(char *, uint64_t))(v111 + 8))(v99, v100);
    (*(void (**)(char *, uint64_t))(v112 + 8))(v98, v80);
    swift_release();
  }
  else
  {
LABEL_17:
    v48 = v116;
    if ((objc_msgSend(v116, sel_isPlayable) & 1) != 0)
    {
      v49 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0C8B300]), sel_initWithAsset_, v48);
      v50 = objc_msgSend(v49, sel_setPreferredForwardBufferDuration_, 5.0);
      v51 = v115;
      v52 = sub_1B9DCE09C((uint64_t)v50);
      if ((v55 & 1) == 0)
      {
        v56 = v52;
        v57 = v53;
        v58 = v54;
        v59 = HIDWORD(v53);
        v119 = nullsub_1;
        v120 = 0;
        *(_QWORD *)&aBlock = MEMORY[0x1E0C809B0];
        *((_QWORD *)&aBlock + 1) = 1107296256;
        *(_QWORD *)&v118 = sub_1B9DC6DBC;
        *((_QWORD *)&v118 + 1) = &block_descriptor_25_0;
        v60 = _Block_copy(&aBlock);
        *(_QWORD *)&aBlock = v56;
        *((_QWORD *)&aBlock + 1) = __PAIR64__(v59, v57);
        *(_QWORD *)&v118 = v58;
        objc_msgSend(v49, sel_seekToTime_completionHandler_, &aBlock, v60);
        _Block_release(v60);
        sub_1B9DCE110(0, 0, 0, 1);
      }
      sub_1B9D661C0(0, (unint64_t *)&qword_1ED5CFB60);
      v61 = (void *)sub_1B9DE24D8();
      v62 = (_QWORD *)swift_allocObject();
      v62[2] = v51;
      v62[3] = v49;
      v62[4] = v48;
      v119 = (uint64_t (*)(_QWORD))sub_1B9DD16B4;
      v120 = v62;
      *(_QWORD *)&aBlock = MEMORY[0x1E0C809B0];
      *((_QWORD *)&aBlock + 1) = 1107296256;
      *(_QWORD *)&v118 = sub_1B9D49458;
      *((_QWORD *)&v118 + 1) = &block_descriptor_22;
      v63 = _Block_copy(&aBlock);
      v64 = v51;
      v65 = v49;
      v66 = v48;
      swift_release();
      v67 = v110;
      sub_1B9DE16E0();
      *(_QWORD *)&aBlock = MEMORY[0x1E0DEE9D8];
      sub_1B9D42DA0((unint64_t *)&qword_1ED5CF9C0, (uint64_t (*)(uint64_t))MEMORY[0x1E0DEF4F8], MEMORY[0x1E0DEF510]);
      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED5CFAD0);
      sub_1B9D4949C();
      v68 = v109;
      v69 = v103;
      sub_1B9DE261C();
      MEMORY[0x1BCCCE2A8](0, v67, v68, v63);
      _Block_release(v63);

      (*(void (**)(char *, uint64_t))(v111 + 8))(v68, v69);
      (*(void (**)(char *, uint64_t))(v112 + 8))(v67, v113);
    }
    else
    {
      v70 = v33;
      if (qword_1EF2420E0 != -1)
        swift_once();
      v71 = v108;
      v72 = __swift_project_value_buffer(v108, (uint64_t)qword_1EF24B3D8);
      v73 = v107;
      v74 = v105;
      (*(void (**)(char *, uint64_t, uint64_t))(v107 + 16))(v105, v72, v71);
      __swift_instantiateConcreteTypeFromMangledName(&qword_1ED5CFBE0);
      sub_1B9DE18FC();
      *(_OWORD *)(swift_allocObject() + 16) = xmmword_1B9DEFE80;
      sub_1B9DE1860();
      v75 = v104;
      sub_1B9D71D30(v70, v104, &qword_1ED5CE100);
      if (__swift_getEnumTagSinglePayload(v75, 1, v11) == 1)
      {
        sub_1B9D6B278(v75, &qword_1ED5CE100);
        aBlock = 0u;
        v118 = 0u;
      }
      else
      {
        *((_QWORD *)&v118 + 1) = v11;
        boxed_opaque_existential_2Tm = __swift_allocate_boxed_opaque_existential_2Tm((uint64_t *)&aBlock);
        (*(void (**)(uint64_t *, uint64_t, uint64_t))(v114 + 32))(boxed_opaque_existential_2Tm, v75, v11);
      }
      sub_1B9DE18F0();
      sub_1B9D6B278((uint64_t)&aBlock, (uint64_t *)&unk_1ED5CFC00);
      sub_1B9DE1EFC();
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v73 + 8))(v74, v71);
      sub_1B9D661C0(0, (unint64_t *)&qword_1ED5CFB60);
      v83 = (void *)sub_1B9DE24D8();
      v84 = swift_allocObject();
      v85 = v115;
      *(_QWORD *)(v84 + 16) = v115;
      v119 = (uint64_t (*)(_QWORD))sub_1B9DD167C;
      v120 = (_QWORD *)v84;
      *(_QWORD *)&aBlock = MEMORY[0x1E0C809B0];
      *((_QWORD *)&aBlock + 1) = 1107296256;
      *(_QWORD *)&v118 = sub_1B9D49458;
      *((_QWORD *)&v118 + 1) = &block_descriptor_16;
      v86 = _Block_copy(&aBlock);
      v87 = v85;
      swift_release();
      v88 = v110;
      sub_1B9DE16E0();
      *(_QWORD *)&aBlock = MEMORY[0x1E0DEE9D8];
      sub_1B9D42DA0((unint64_t *)&qword_1ED5CF9C0, (uint64_t (*)(uint64_t))MEMORY[0x1E0DEF4F8], MEMORY[0x1E0DEF510]);
      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED5CFAD0);
      sub_1B9D4949C();
      v89 = v109;
      v90 = v103;
      sub_1B9DE261C();
      MEMORY[0x1BCCCE2A8](0, v88, v89, v86);
      _Block_release(v86);

      (*(void (**)(char *, uint64_t))(v111 + 8))(v89, v90);
      (*(void (**)(char *, uint64_t))(v112 + 8))(v88, v113);
    }
  }
}

void sub_1B9DCFCCC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  void *v10;
  uint64_t v11;
  id v12;
  uint64_t v13;

  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF243B78);
  MEMORY[0x1E0C80A78](v7);
  v9 = (uint64_t *)((char *)&v13 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0));
  swift_beginAccess();
  v10 = *(void **)(a4 + 16);
  *v9 = a2;
  v9[1] = a3;
  v9[2] = v10;
  v11 = type metadata accessor for VideoPlaybackFailure(0);
  swift_storeEnumTagMultiPayload();
  __swift_storeEnumTagSinglePayload((uint64_t)v9, 0, 1, v11);
  v12 = v10;
  swift_bridgeObjectRetain();
  sub_1B9DCDB50((uint64_t)v9);
}

void sub_1B9DCFDA8()
{
  uint64_t v0;
  uint64_t v1;
  char *v2;
  uint64_t v3;
  uint64_t v4;

  v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF243B78);
  MEMORY[0x1E0C80A78](v0);
  v2 = (char *)&v4 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  v3 = type metadata accessor for VideoPlaybackFailure(0);
  swift_storeEnumTagMultiPayload();
  __swift_storeEnumTagSinglePayload((uint64_t)v2, 0, 1, v3);
  sub_1B9DCDB50((uint64_t)v2);
}

uint64_t sub_1B9DCFE40(char *a1, void *a2, void *a3)
{
  id v6;
  char *v7;
  uint64_t result;
  uint64_t v9;
  uint64_t ObjectType;

  v6 = a2;
  sub_1B9DCD6A0(a2);
  sub_1B9DCA3D4(a3, a1);
  a1[OBJC_IVAR____TtC27AppleMediaServicesUIDynamic11VideoPlayer_playbackChecks] = 1;
  sub_1B9DCDBE8();
  v7 = &a1[OBJC_IVAR____TtC27AppleMediaServicesUIDynamic11VideoPlayer_delegate];
  swift_beginAccess();
  result = MEMORY[0x1BCCCEFF8](v7);
  if (result)
  {
    v9 = *((_QWORD *)v7 + 1);
    ObjectType = swift_getObjectType();
    (*(void (**)(char *, uint64_t, uint64_t))(v9 + 40))(a1, ObjectType, v9);
    return swift_unknownObjectRelease();
  }
  return result;
}

Swift::Void __swiftcall VideoPlayer.releaseAssets()()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  id *v5;
  OpaqueCMTimebase *v6;
  OpaqueCMTimebase *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  CMTime v15;

  __swift_instantiateConcreteTypeFromMangledName(&qword_1EF243B78);
  OUTLINED_FUNCTION_39();
  MEMORY[0x1E0C80A78](v1);
  OUTLINED_FUNCTION_0_13();
  v4 = v3 - v2;
  v5 = (id *)(v0 + OBJC_IVAR____TtC27AppleMediaServicesUIDynamic11VideoPlayer_playerItem);
  OUTLINED_FUNCTION_3_5();
  if (*v5)
  {
    v6 = (OpaqueCMTimebase *)objc_msgSend(*v5, sel_timebase);
    if (v6)
    {
      v7 = v6;
      CMTimebaseGetTime(&v15, v6);
      sub_1B9DCE110(v15.value, *(uint64_t *)&v15.timescale, v15.epoch, 0);

    }
  }
  sub_1B9DCD6FC();
  v9 = v8;
  objc_msgSend(v8, sel_cancelLoading);

  sub_1B9DCD6A0(0);
  v10 = v0 + OBJC_IVAR____TtC27AppleMediaServicesUIDynamic11VideoPlayer_playbackChecks;
  *(_WORD *)v10 = 0;
  *(_BYTE *)(v10 + 2) = 0;
  sub_1B9DCDBE8();
  v11 = type metadata accessor for VideoPlaybackFailure(0);
  OUTLINED_FUNCTION_33_8(v4, v12, v13, v11);
  v14 = sub_1B9DCDB50(v4);
  *(_QWORD *)(v0 + OBJC_IVAR____TtC27AppleMediaServicesUIDynamic11VideoPlayer_failureCount) = 0;
  sub_1B9DCDBB4(v14);
  sub_1B9DCD410(0);
}

void sub_1B9DD001C(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _BYTE v7[8];
  _QWORD v8[6];

  sub_1B9DD159C(a1, (uint64_t)v7);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED5CE100);
  OUTLINED_FUNCTION_39();
  v3 = MEMORY[0x1E0C80A78](v2);
  MEMORY[0x1E0C80A78](v3);
  v4 = sub_1B9DE201C();
  v5 = MEMORY[0x1E0C80A78](v4);
  MEMORY[0x1E0C80A78](v5);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EF243B78);
  OUTLINED_FUNCTION_39();
  MEMORY[0x1E0C80A78](v6);
  OUTLINED_FUNCTION_77_1();
  sub_1B9DD159C(a1, (uint64_t)v8);
  __asm { BR              X10 }
}

id VideoPlayer.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

void VideoPlayer.init()()
{
  OUTLINED_FUNCTION_30_8();
  __break(1u);
}

id VideoPlayer.__allocating_init(url:)()
{
  id v0;
  void *v1;
  id v2;
  uint64_t v3;

  v0 = OUTLINED_FUNCTION_9_21();
  v1 = (void *)sub_1B9DE1500();
  v2 = objc_msgSend(v0, sel_initWithURL_, v1);

  v3 = OUTLINED_FUNCTION_2_4();
  OUTLINED_FUNCTION_6_10(v3);
  return v2;
}

void VideoPlayer.init(url:)()
{
  OUTLINED_FUNCTION_30_8();
  __break(1u);
}

void VideoPlayer.__allocating_init(playerItem:)()
{
  void *v0;

  objc_msgSend(OUTLINED_FUNCTION_9_21(), sel_initWithPlayerItem_, v0);

  OUTLINED_FUNCTION_1();
}

void VideoPlayer.init(playerItem:)()
{
  OUTLINED_FUNCTION_30_8();
  __break(1u);
}

void sub_1B9DD0C34(_BYTE *a1@<X8>)
{
  char v2;

  VideoPlayer.state.getter();
  *a1 = v2;
  OUTLINED_FUNCTION_1();
}

void sub_1B9DD0C58(unsigned __int8 *a1)
{
  sub_1B9DCD410(*a1);
  OUTLINED_FUNCTION_1();
}

void sub_1B9DD0C78(_QWORD *a1@<X8>)
{
  uint64_t v2;

  VideoPlayer.playerItem.getter();
  *a1 = v2;
  OUTLINED_FUNCTION_1();
}

char *initializeBufferWithCopyOfBuffer for VideoPlaybackFailure(char *a1, char **a2, uint64_t a3)
{
  uint64_t v5;
  int v6;
  char *v7;
  char *v8;
  char *v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  char *v14;

  v5 = *(_QWORD *)(a3 - 8);
  v6 = *(_DWORD *)(v5 + 80);
  if ((v6 & 0x20000) != 0)
  {
    v10 = *a2;
    *(_QWORD *)a1 = *a2;
    a1 = &v10[(v6 + 16) & ~(unint64_t)v6];
    swift_retain();
  }
  else
  {
    switch(swift_getEnumCaseMultiPayload())
    {
      case 0u:
        v7 = a2[1];
        *(_QWORD *)a1 = *a2;
        *((_QWORD *)a1 + 1) = v7;
        v8 = a2[2];
        *((_QWORD *)a1 + 2) = v8;
        swift_bridgeObjectRetain();
        v9 = v8;
        goto LABEL_10;
      case 1u:
        v11 = sub_1B9DE1554();
        if (__swift_getEnumTagSinglePayload((uint64_t)a2, 1, v11))
        {
          v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED5CE100);
          memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v12 - 8) + 64));
        }
        else
        {
          (*(void (**)(char *, char **, uint64_t))(*(_QWORD *)(v11 - 8) + 16))(a1, a2, v11);
          __swift_storeEnumTagSinglePayload((uint64_t)a1, 0, 1, v11);
        }
        goto LABEL_10;
      case 2u:
      case 3u:
        v13 = *a2;
        *(_QWORD *)a1 = *a2;
        v14 = v13;
LABEL_10:
        swift_storeEnumTagMultiPayload();
        break;
      default:
        memcpy(a1, a2, *(_QWORD *)(v5 + 64));
        break;
    }
  }
  return a1;
}

void destroy for VideoPlaybackFailure(void **a1)
{
  void *v2;
  uint64_t v3;

  switch(swift_getEnumCaseMultiPayload())
  {
    case 0u:
      swift_bridgeObjectRelease();
      v2 = a1[2];
      goto LABEL_4;
    case 1u:
      v3 = sub_1B9DE1554();
      if (!__swift_getEnumTagSinglePayload((uint64_t)a1, 1, v3))
        (*(void (**)(void **, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
      break;
    case 2u:
    case 3u:
      v2 = *a1;
LABEL_4:

      break;
    default:
      return;
  }
}

_QWORD *initializeWithCopy for VideoPlaybackFailure(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;

  switch(swift_getEnumCaseMultiPayload())
  {
    case 0u:
      v6 = a2[1];
      *a1 = *a2;
      a1[1] = v6;
      v7 = (void *)a2[2];
      a1[2] = v7;
      swift_bridgeObjectRetain();
      v8 = v7;
      goto LABEL_8;
    case 1u:
      v9 = sub_1B9DE1554();
      if (__swift_getEnumTagSinglePayload((uint64_t)a2, 1, v9))
      {
        v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED5CE100);
        memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v10 - 8) + 64));
      }
      else
      {
        (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v9 - 8) + 16))(a1, a2, v9);
        __swift_storeEnumTagSinglePayload((uint64_t)a1, 0, 1, v9);
      }
      goto LABEL_8;
    case 2u:
    case 3u:
      v11 = (void *)*a2;
      *a1 = *a2;
      v12 = v11;
LABEL_8:
      swift_storeEnumTagMultiPayload();
      break;
    default:
      memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64));
      break;
  }
  return a1;
}

_QWORD *assignWithCopy for VideoPlaybackFailure(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;

  if (a1 != a2)
  {
    sub_1B9DD1188((uint64_t)a1);
    switch(swift_getEnumCaseMultiPayload())
    {
      case 0u:
        *a1 = *a2;
        a1[1] = a2[1];
        v6 = (void *)a2[2];
        a1[2] = v6;
        swift_bridgeObjectRetain();
        v7 = v6;
        goto LABEL_9;
      case 1u:
        v8 = sub_1B9DE1554();
        if (__swift_getEnumTagSinglePayload((uint64_t)a2, 1, v8))
        {
          v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED5CE100);
          memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v9 - 8) + 64));
        }
        else
        {
          (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v8 - 8) + 16))(a1, a2, v8);
          __swift_storeEnumTagSinglePayload((uint64_t)a1, 0, 1, v8);
        }
        goto LABEL_9;
      case 2u:
      case 3u:
        v10 = (void *)*a2;
        *a1 = *a2;
        v11 = v10;
LABEL_9:
        swift_storeEnumTagMultiPayload();
        break;
      default:
        memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64));
        break;
    }
  }
  return a1;
}

uint64_t sub_1B9DD1188(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata accessor for VideoPlaybackFailure(0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

void *initializeWithTake for VideoPlaybackFailure(void *a1, const void *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;

  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v6 = sub_1B9DE1554();
    if (__swift_getEnumTagSinglePayload((uint64_t)a2, 1, v6))
    {
      v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED5CE100);
      memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v7 - 8) + 64));
    }
    else
    {
      (*(void (**)(void *, const void *, uint64_t))(*(_QWORD *)(v6 - 8) + 32))(a1, a2, v6);
      __swift_storeEnumTagSinglePayload((uint64_t)a1, 0, 1, v6);
    }
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64));
  }
  return a1;
}

void *assignWithTake for VideoPlaybackFailure(void *a1, const void *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;

  if (a1 != a2)
  {
    sub_1B9DD1188((uint64_t)a1);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v6 = sub_1B9DE1554();
      if (__swift_getEnumTagSinglePayload((uint64_t)a2, 1, v6))
      {
        v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED5CE100);
        memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v7 - 8) + 64));
      }
      else
      {
        (*(void (**)(void *, const void *, uint64_t))(*(_QWORD *)(v6 - 8) + 32))(a1, a2, v6);
        __swift_storeEnumTagSinglePayload((uint64_t)a1, 0, 1, v6);
      }
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64));
    }
  }
  return a1;
}

uint64_t sub_1B9DD1398()
{
  return swift_storeEnumTagMultiPayload();
}

void sub_1B9DD13A8()
{
  unint64_t v0;

  sub_1B9DD1554(319, (unint64_t *)&qword_1ED5CE108, (void (*)(uint64_t))MEMORY[0x1E0CAFFF8]);
  if (v0 <= 0x3F)
    swift_initEnumMetadataMultiPayload();
}

uint64_t sub_1B9DD1434()
{
  return type metadata accessor for VideoPlayer(0);
}

void sub_1B9DD144C()
{
  unint64_t v0;
  unint64_t v1;

  sub_1B9DD1554(319, (unint64_t *)&qword_1ED5CE108, (void (*)(uint64_t))MEMORY[0x1E0CAFFF8]);
  if (v0 <= 0x3F)
  {
    sub_1B9DD1554(319, &qword_1EF243C60, (void (*)(uint64_t))type metadata accessor for VideoPlaybackFailure);
    if (v1 <= 0x3F)
      swift_updateClassMetadata2();
  }
}

void sub_1B9DD1554(uint64_t a1, unint64_t *a2, void (*a3)(uint64_t))
{
  unint64_t v4;
  uint64_t v5;

  if (!*a2)
  {
    a3(255);
    v4 = sub_1B9DE25BC();
    if (!v5)
      atomic_store(v4, a2);
  }
  OUTLINED_FUNCTION_1();
}

uint64_t sub_1B9DD159C(uint64_t a1, uint64_t a2)
{
  __swift_memcpy49_8(a2, a1);
  return a2;
}

void sub_1B9DD15D8(uint64_t a1, void (*a2)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))
{
  a2(*(_QWORD *)a1, *(_QWORD *)(a1 + 8), *(_QWORD *)(a1 + 16), *(_QWORD *)(a1 + 24), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 48));
  OUTLINED_FUNCTION_1();
}

uint64_t sub_1B9DD1610()
{
  uint64_t v0;

  swift_release();

  return swift_deallocObject();
}

void sub_1B9DD163C()
{
  uint64_t v0;

  sub_1B9DCEEAC(*(_QWORD *)(v0 + 16), *(void **)(v0 + 24));
}

uint64_t block_copy_helper_18(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_18()
{
  return swift_release();
}

uint64_t sub_1B9DD165C()
{
  OUTLINED_FUNCTION_58_0();
  return swift_deallocObject();
}

void sub_1B9DD167C()
{
  sub_1B9DCFDA8();
}

uint64_t sub_1B9DD1684()
{
  uint64_t v0;

  OUTLINED_FUNCTION_58_0();

  return swift_deallocObject();
}

uint64_t sub_1B9DD16B4()
{
  uint64_t v0;

  return sub_1B9DCFE40(*(char **)(v0 + 16), *(void **)(v0 + 24), *(void **)(v0 + 32));
}

uint64_t sub_1B9DD16C0()
{
  OUTLINED_FUNCTION_58_0();
  swift_bridgeObjectRelease();
  swift_release();
  return swift_deallocObject();
}

void sub_1B9DD16F0()
{
  uint64_t *v0;

  sub_1B9DCFCCC(v0[2], v0[3], v0[4], v0[5]);
}

uint64_t sub_1B9DD16FC(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF243B78);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 24))(a2, a1, v4);
  return a2;
}

uint64_t sub_1B9DD1744(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for VideoPlaybackFailure(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_1B9DD1788(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for VideoPlaybackFailure(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

void sub_1B9DD17CC()
{
  uint64_t v0;

  sub_1B9DCDE6C(v0);
}

uint64_t sub_1B9DD17D4()
{
  OUTLINED_FUNCTION_58_0();
  return swift_deallocObject();
}

uint64_t sub_1B9DD17F4()
{
  uint64_t v0;

  return sub_1B9DCD350(*(_QWORD *)(v0 + 16), *(unsigned __int8 *)(v0 + 24));
}

id OUTLINED_FUNCTION_3_37@<X0>(const char *a1@<X1>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;

  *(_QWORD *)(v5 - 280) = v2;
  *(_QWORD *)(v5 - 272) = *(_QWORD *)(a2 + 8);
  *(_QWORD *)(v5 - 264) = v3;
  return objc_msgSend(v4, a1, v5 - 280);
}

uint64_t OUTLINED_FUNCTION_7_26()
{
  _QWORD *v0;
  uint64_t v1;

  *v0 = v1;
  type metadata accessor for VideoPlaybackFailure(0);
  return swift_storeEnumTagMultiPayload();
}

id OUTLINED_FUNCTION_9_21()
{
  objc_class *v0;

  return objc_allocWithZone(v0);
}

void OUTLINED_FUNCTION_11_22(uint64_t a1, uint64_t *a2)
{
  uint64_t v2;

  sub_1B9D6B278(v2 - 256, a2);
}

uint64_t OUTLINED_FUNCTION_18_18()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 8))(v1, v0);
}

id OUTLINED_FUNCTION_19_10()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;

  __swift_storeEnumTagSinglePayload(v1, 0, 1, v2);
  return v0;
}

double OUTLINED_FUNCTION_22_12()
{
  uint64_t v0;
  double result;

  result = 0.0;
  *(_OWORD *)(v0 - 256) = 0u;
  *(_OWORD *)(v0 - 240) = 0u;
  return result;
}

uint64_t OUTLINED_FUNCTION_23_6()
{
  return swift_unknownObjectWeakInit();
}

uint64_t OUTLINED_FUNCTION_24_10()
{
  return sub_1B9DE18CC();
}

void OUTLINED_FUNCTION_28_6(uint64_t a1, void (*a2)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))
{
  uint64_t v2;

  sub_1B9DD15D8(v2, a2);
}

uint64_t OUTLINED_FUNCTION_30_8()
{
  return _swift_stdlib_reportUnimplementedInitializer();
}

uint64_t OUTLINED_FUNCTION_32_11(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  return __swift_storeEnumTagSinglePayload(a1, a2, 1, v2);
}

uint64_t OUTLINED_FUNCTION_33_8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_storeEnumTagSinglePayload(a1, 1, 1, a4);
}

BOOL static VideoPlayerState.__derived_enum_equals(_:_:)(char a1, char a2)
{
  return a1 == a2;
}

uint64_t VideoPlayerState.hash(into:)()
{
  return sub_1B9DE2958();
}

uint64_t VideoPlayerState.hashValue.getter()
{
  sub_1B9DE294C();
  sub_1B9DE2958();
  return sub_1B9DE297C();
}

BOOL sub_1B9DD1988(char *a1, char *a2)
{
  return static VideoPlayerState.__derived_enum_equals(_:_:)(*a1, *a2);
}

uint64_t sub_1B9DD1994()
{
  return VideoPlayerState.hashValue.getter();
}

uint64_t sub_1B9DD199C()
{
  return VideoPlayerState.hash(into:)();
}

unint64_t sub_1B9DD19A8()
{
  unint64_t result;

  result = qword_1EF243C78;
  if (!qword_1EF243C78)
  {
    result = MEMORY[0x1BCCCEEA8](&protocol conformance descriptor for VideoPlayerState, &type metadata for VideoPlayerState);
    atomic_store(result, (unint64_t *)&qword_1EF243C78);
  }
  return result;
}

uint64_t getEnumTagSinglePayload for VideoPlayerState(unsigned __int8 *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for VideoPlayerState(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_1B9DD1AB8 + 4 * byte_1B9DF5985[v4]))();
  *a1 = a2 + 7;
  return ((uint64_t (*)(void))((char *)sub_1B9DD1AEC + 4 * asc_1B9DF5980[v4]))();
}

uint64_t sub_1B9DD1AEC(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_1B9DD1AF4(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x1B9DD1AFCLL);
  return result;
}

uint64_t sub_1B9DD1B08(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x1B9DD1B10);
  *(_BYTE *)result = a2 + 7;
  return result;
}

uint64_t sub_1B9DD1B14(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1B9DD1B1C(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for VideoPlayerState()
{
  return &type metadata for VideoPlayerState;
}

uint64_t sub_1B9DD1B38(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char v5;
  uint64_t v6;
  char v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char v11;
  char v12;
  BOOL v13;
  uint64_t v14;
  uint64_t v15;

  if ((a1 & 0xC000000000000001) != 0)
  {
    v2 = sub_1B9DE2640();
    v4 = v3;
    v5 = 1;
  }
  else
  {
    v2 = sub_1B9DD8D84(a1);
    v4 = v6;
    v5 = v7 & 1;
  }
  v8 = sub_1B9DD8ACC(a1);
  v10 = v9;
  v12 = v11 & 1;
  v13 = sub_1B9DD8E04(v2, v4, v5, v8, v9, v11 & 1);
  sub_1B9DD8E38(v8, v10, v12);
  if (v13)
  {
    sub_1B9DD8E38(v2, v4, v5);
    return 0;
  }
  else
  {
    sub_1B9DD8B1C(v2, v4, v5, a1);
    v14 = v15;
    sub_1B9DD8E38(v2, v4, v5);
  }
  return v14;
}

uint64_t VideoView.objectGraph.getter()
{
  OUTLINED_FUNCTION_3_5();
  return OUTLINED_FUNCTION_104_0();
}

void VideoView.objectGraph.setter()
{
  OUTLINED_FUNCTION_6_5();
  swift_weakAssign();
  OUTLINED_FUNCTION_32_0();
  OUTLINED_FUNCTION_13_4();
}

void VideoView.objectGraph.modify(_QWORD *a1)
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t v4;

  v3 = malloc(0x30uLL);
  *a1 = v3;
  v4 = OBJC_IVAR____TtC27AppleMediaServicesUIDynamic9VideoView_objectGraph;
  v3[4] = v1;
  v3[5] = v4;
  OUTLINED_FUNCTION_6_5();
  v3[3] = OUTLINED_FUNCTION_104_0();
  OUTLINED_FUNCTION_1_7();
}

id VideoView.previewFrameArtwork.getter()
{
  return OUTLINED_FUNCTION_53_6(OBJC_IVAR____TtC27AppleMediaServicesUIDynamic9VideoView_previewFrameArtwork);
}

uint64_t sub_1B9DD1D28()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t result;

  v1 = *(_QWORD *)(v0 + OBJC_IVAR____TtC27AppleMediaServicesUIDynamic9VideoView_videoPlayer);
  if (v1)
  {
    v2 = v1 + OBJC_IVAR____TtC27AppleMediaServicesUIDynamic11VideoPlayer_delegate;
    swift_beginAccess();
    *(_QWORD *)(v2 + 8) = 0;
    return swift_unknownObjectWeakAssign();
  }
  return result;
}

id sub_1B9DD1D8C()
{
  char *v0;
  char *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  char v7;
  char *v8;
  void *v9;
  char *v10;
  id result;
  uint64_t v12;
  uint64_t ObjectType;
  void *v14;
  void (*v15)(void *, uint64_t, uint64_t);
  id v16;
  uint64_t v17;

  v1 = v0;
  v2 = OBJC_IVAR____TtC27AppleMediaServicesUIDynamic9VideoView_videoPlayer;
  v3 = *(_QWORD *)&v0[OBJC_IVAR____TtC27AppleMediaServicesUIDynamic9VideoView_videoPlayer];
  if (v3)
  {
    v4 = v3 + OBJC_IVAR____TtC27AppleMediaServicesUIDynamic11VideoPlayer_delegate;
    swift_beginAccess();
    *(_QWORD *)(v4 + 8) = &protocol witness table for VideoView;
    swift_unknownObjectWeakAssign();
    v5 = *(_QWORD *)&v1[v2];
    if (v5)
    {
      v6 = &v1[OBJC_IVAR____TtC27AppleMediaServicesUIDynamic9VideoView_configuration];
      swift_beginAccess();
      v7 = v6[*(int *)(type metadata accessor for VideoConfiguration() + 40)];
      v8 = (char *)(v5 + OBJC_IVAR____TtC27AppleMediaServicesUIDynamic11VideoPlayer_shouldLoopPlayback);
      swift_beginAccess();
      *v8 = v7;
    }
  }
  v9 = *(void **)&v1[OBJC_IVAR____TtC27AppleMediaServicesUIDynamic9VideoView_playerViewController];
  if (v9)
    objc_msgSend(v9, sel_setPlayer_, *(_QWORD *)&v1[v2]);
  v10 = &v1[OBJC_IVAR____TtC27AppleMediaServicesUIDynamic9VideoView_videoPlayerDelegate];
  result = (id)MEMORY[0x1BCCCEFF8](&v1[OBJC_IVAR____TtC27AppleMediaServicesUIDynamic9VideoView_videoPlayerDelegate]);
  if (result)
  {
    v12 = *((_QWORD *)v10 + 1);
    ObjectType = swift_getObjectType();
    v14 = *(void **)&v1[v2];
    v15 = *(void (**)(void *, uint64_t, uint64_t))(v12 + 8);
    v16 = v14;
    v15(v14, ObjectType, v12);

    result = (id)swift_unknownObjectRelease();
  }
  v17 = OBJC_IVAR____TtC27AppleMediaServicesUIDynamic9VideoView_unmuteAfterVideoPlayerCreation;
  if (v1[OBJC_IVAR____TtC27AppleMediaServicesUIDynamic9VideoView_unmuteAfterVideoPlayerCreation] == 1)
  {
    objc_msgSend(v1, sel_updateAudioSessionCategoryWithIsAudioOn_, 1);
    result = *(id *)&v1[v2];
    if (result)
      result = objc_msgSend(result, sel_setMuted_, 0);
    v1[v17] = 0;
  }
  return result;
}

void sub_1B9DD1F2C(void *a1)
{
  uint64_t v1;
  void *v3;
  id v4;

  sub_1B9DD1D28();
  v3 = *(void **)(v1 + OBJC_IVAR____TtC27AppleMediaServicesUIDynamic9VideoView_videoPlayer);
  *(_QWORD *)(v1 + OBJC_IVAR____TtC27AppleMediaServicesUIDynamic9VideoView_videoPlayer) = a1;
  v4 = a1;

  sub_1B9DD1D8C();
  OUTLINED_FUNCTION_14_11(v4);
}

id VideoView.backgroundColor.getter()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)OUTLINED_FUNCTION_11_4();
  return objc_msgSendSuper2(&v2, sel_backgroundColor);
}

void VideoView.backgroundColor.setter(void *a1)
{
  char *v1;
  objc_class *v3;
  void *v4;
  id v5;
  void *v6;
  objc_super v7;

  v3 = (objc_class *)OUTLINED_FUNCTION_11_4();
  v4 = *(void **)&v1[OBJC_IVAR____TtC27AppleMediaServicesUIDynamic9VideoView_playerViewController];
  if (!v4)
    goto LABEL_4;
  v5 = objc_msgSend(v4, sel_view);
  if (v5)
  {
    v6 = v5;
    objc_msgSend(v5, sel_setBackgroundColor_, a1);

LABEL_4:
    v7.receiver = v1;
    v7.super_class = v3;
    objc_msgSendSuper2(&v7, sel_setBackgroundColor_, a1);

    return;
  }
  __break(1u);
}

void VideoView.backgroundColor.modify(objc_super *a1)
{
  objc_class *v1;
  uint64_t v3;

  a1[1].super_class = v1;
  v3 = OUTLINED_FUNCTION_11_4();
  a1->receiver = v1;
  a1->super_class = (Class)v3;
  a1[1].receiver = -[objc_super backgroundColor](a1, sel_backgroundColor);
  OUTLINED_FUNCTION_1();
}

void sub_1B9DD2104(uint64_t a1, char a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 16);
  if ((a2 & 1) != 0)
  {
    v3 = v2;
    VideoView.backgroundColor.setter(v2);
    OUTLINED_FUNCTION_36_3(v3);
  }
  else
  {
    VideoView.backgroundColor.setter(*(void **)(a1 + 16));
    OUTLINED_FUNCTION_84();
  }
}

id VideoView.frame.getter()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)OUTLINED_FUNCTION_11_4();
  return objc_msgSendSuper2(&v2, sel_frame);
}

id VideoView.frame.setter()
{
  uint64_t v0;
  double v1;
  objc_super *v2;
  SEL v3;
  uint64_t v5;

  OUTLINED_FUNCTION_10_3();
  v5 = OUTLINED_FUNCTION_11_4();
  v1 = OUTLINED_FUNCTION_9_3();
  objc_msgSendSuper2(v2, v3, v1, v0, v5);
  return sub_1B9DD2280();
}

id sub_1B9DD2280()
{
  char *v0;
  char *v1;
  objc_class *ObjectType;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  char *v12;
  uint64_t v13;
  void *v14;
  char *v15;
  objc_class *v16;
  char *(*v17)();
  uint64_t (*v18)(void *, char *(*)());
  char *(*v19)();
  char v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  id v27;
  double v28;
  double v29;
  uint64_t v30;
  uint64_t v31;
  id *v32;
  id result;
  double v34;
  double v35;
  BOOL v36;
  void *v37;
  void *v38;
  uint64_t v39;
  void *v40;
  id v41;
  char *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  char *v46;
  uint64_t v47;
  _QWORD aBlock[3];
  void *v49;
  char *(*v50)();
  uint64_t v51;
  objc_super v52;

  v1 = v0;
  ObjectType = (objc_class *)swift_getObjectType();
  v3 = sub_1B9DE16C8();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x1E0C80A78](v3);
  v46 = (char *)&v43 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v45 = sub_1B9DE16F8();
  v44 = *(_QWORD *)(v45 - 8);
  MEMORY[0x1E0C80A78](v45);
  v7 = (char *)&v43 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_1B9DE16D4();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x1E0C80A78](v8);
  v11 = (char *)&v43 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = &v0[OBJC_IVAR____TtC27AppleMediaServicesUIDynamic9VideoView_isFullScreen];
  swift_beginAccess();
  if (*v12 != 1)
  {
LABEL_4:
    v52.receiver = v1;
    v52.super_class = ObjectType;
    objc_msgSendSuper2(&v52, sel_frame);
    v24 = v23;
    v26 = v25;
    v27 = objc_msgSend((id)objc_opt_self(), sel_mainScreen);
    objc_msgSend(v27, sel_scale);
    v29 = v28;

    v22 = v24 * v29;
    v21 = v26 * v29;
    goto LABEL_6;
  }
  v43 = v4;
  v13 = v3;
  sub_1B9DD8F2C((uint64_t)&v1[OBJC_IVAR____TtC27AppleMediaServicesUIDynamic9VideoView_networkInquiry], (uint64_t)aBlock, &qword_1EF242B60);
  v14 = v49;
  if (v49)
  {
    v15 = v7;
    v16 = ObjectType;
    v17 = v50;
    __swift_project_boxed_opaque_existential_2(aBlock, (uint64_t)v49);
    v18 = (uint64_t (*)(void *, char *(*)()))*((_QWORD *)v17 + 4);
    v19 = v17;
    ObjectType = v16;
    v7 = v15;
    v20 = v18(v14, v19);
    __swift_destroy_boxed_opaque_existential_2((uint64_t)aBlock);
    v21 = 0.0;
    v22 = 0.0;
    v3 = v13;
    v4 = v43;
    if ((v20 & 1) == 0)
      goto LABEL_6;
    goto LABEL_4;
  }
  sub_1B9D6B278((uint64_t)aBlock, &qword_1EF242B60);
  v21 = 0.0;
  v22 = 0.0;
  v3 = v13;
  v4 = v43;
LABEL_6:
  v30 = OBJC_IVAR____TtC27AppleMediaServicesUIDynamic9VideoView_videoPlayer;
  v31 = *(_QWORD *)&v1[OBJC_IVAR____TtC27AppleMediaServicesUIDynamic9VideoView_videoPlayer];
  if (!v31
    || (v32 = (id *)(v31 + OBJC_IVAR____TtC27AppleMediaServicesUIDynamic11VideoPlayer_playerItem),
        swift_beginAccess(),
        !*v32)
    || ((result = objc_msgSend(*v32, sel_preferredMaximumResolution), v35 == v22) ? (v36 = v34 == v21) : (v36 = 0), !v36))
  {
    sub_1B9D661C0(0, (unint64_t *)&qword_1ED5CFB60);
    (*(void (**)(char *, _QWORD, uint64_t))(v9 + 104))(v11, *MEMORY[0x1E0DEF540], v8);
    v37 = (void *)sub_1B9DE2514();
    (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
    v38 = *(void **)&v1[v30];
    v39 = swift_allocObject();
    *(_QWORD *)(v39 + 16) = v38;
    *(double *)(v39 + 24) = v22;
    *(double *)(v39 + 32) = v21;
    v50 = sub_1B9DD8F84;
    v51 = v39;
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_1B9D49458;
    v49 = &block_descriptor_64;
    v40 = _Block_copy(aBlock);
    v41 = v38;
    sub_1B9DE16E0();
    v47 = MEMORY[0x1E0DEE9D8];
    sub_1B9D42DA0((unint64_t *)&qword_1ED5CF9C0, (uint64_t (*)(uint64_t))MEMORY[0x1E0DEF4F8], MEMORY[0x1E0DEF510]);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED5CFAD0);
    sub_1B9DD8A90((unint64_t *)&qword_1ED5CFAE0, (uint64_t *)&unk_1ED5CFAD0);
    v42 = v46;
    sub_1B9DE261C();
    MEMORY[0x1BCCCE2A8](0, v7, v42, v40);
    _Block_release(v40);

    (*(void (**)(char *, uint64_t))(v4 + 8))(v42, v3);
    (*(void (**)(char *, uint64_t))(v44 + 8))(v7, v45);
    return (id)swift_release();
  }
  return result;
}

void VideoView.frame.modify(objc_super **a1)
{
  void *v1;
  objc_super *v3;
  uint64_t v4;
  void *v5;
  objc_class *v6;
  void *v7;
  objc_class *v8;

  v3 = (objc_super *)malloc(0x60uLL);
  *a1 = v3;
  v3[5].receiver = v1;
  v4 = OUTLINED_FUNCTION_11_4();
  v3[5].super_class = (Class)v4;
  v3[2].receiver = v1;
  v3[2].super_class = (Class)v4;
  objc_msgSendSuper2(v3 + 2, sel_frame);
  v3->receiver = v5;
  v3->super_class = v6;
  v3[1].receiver = v7;
  v3[1].super_class = v8;
  OUTLINED_FUNCTION_1_7();
}

void sub_1B9DD2720(double **a1, char a2)
{
  double *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  objc_class *v7;
  void *v8;
  objc_super *v9;

  v2 = *a1;
  v3 = **a1;
  v4 = (*a1)[1];
  v5 = (*a1)[2];
  v6 = (*a1)[3];
  v8 = (void *)*((_QWORD *)*a1 + 10);
  v7 = (objc_class *)*((_QWORD *)*a1 + 11);
  v9 = (objc_super *)*a1;
  if ((a2 & 1) != 0)
  {
    v9[3].receiver = v8;
    v9[3].super_class = v7;
    objc_msgSendSuper2(v9 + 3, sel_setFrame_, v3, v4, v5, v6);
  }
  else
  {
    v9[4].receiver = v8;
    v9[4].super_class = v7;
    objc_msgSendSuper2(v9 + 4, sel_setFrame_, v3, v4, v5, v6);
    sub_1B9DD2280();
  }
  free(v2);
}

void sub_1B9DD277C()
{
  char *v0;
  char *v1;
  double v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  char *v9;
  double v10;
  double v11;
  id v12;
  char v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  double v17;
  double v18;
  void *v19;
  id v20;
  id v21;

  v1 = v0;
  v2 = sub_1B9DD28D0();
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v9 = &v0[OBJC_IVAR____TtC27AppleMediaServicesUIDynamic9VideoView_additionalControlInsets];
  v10 = *(double *)&v0[OBJC_IVAR____TtC27AppleMediaServicesUIDynamic9VideoView_additionalControlInsets];
  v11 = *(double *)&v0[OBJC_IVAR____TtC27AppleMediaServicesUIDynamic9VideoView_additionalControlInsets + 16];
  v12 = objc_msgSend(v0, sel_traitCollection);
  v13 = sub_1B9DE2520();

  v14 = *(void **)&v1[OBJC_IVAR____TtC27AppleMediaServicesUIDynamic9VideoView_playerViewController];
  if (v14)
  {
    v15 = 8;
    if ((v13 & 1) != 0)
      v16 = 24;
    else
      v16 = 8;
    if ((v13 & 1) == 0)
      v15 = 24;
    v17 = v4 + *(double *)&v9[v16];
    v18 = v8 + *(double *)&v9[v15];
    v19 = (void *)objc_opt_self();
    v20 = v14;
    v21 = objc_msgSend(v19, sel_valueWithUIEdgeInsets_, v2 + v10, v17, v6 + v11, v18);
    objc_msgSend(v20, sel_setOverrideLayoutMarginsWhenEmbeddedInline_, v21);

  }
}

double sub_1B9DD28D0()
{
  id v0;
  id v1;
  double result;

  v0 = objc_msgSend((id)objc_opt_self(), sel_currentDevice);
  v1 = objc_msgSend(v0, sel_userInterfaceIdiom);

  result = 6.0;
  if (v1 == (id)1)
    return 8.0;
  return result;
}

void VideoView.__allocating_init(video:objectGraph:aspectRatio:contentSize:)()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  int *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  _BYTE *v24;
  uint64_t v25;
  _BYTE *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  char *v33;
  char *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  int v42;
  uint64_t v43;
  uint64_t v44;

  OUTLINED_FUNCTION_54_0();
  v40 = v1;
  v41 = v0;
  v43 = v2;
  v44 = v3;
  v37 = v4;
  v6 = v5;
  v42 = v7 & 1;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EF243CA0);
  OUTLINED_FUNCTION_39();
  MEMORY[0x1E0C80A78](v8);
  OUTLINED_FUNCTION_70_4();
  v39 = v9 - v10;
  MEMORY[0x1E0C80A78](v11);
  v38 = (uint64_t)&v35 - v12;
  v36 = OUTLINED_FUNCTION_2_4();
  v13 = *(_QWORD *)(v36 - 8);
  MEMORY[0x1E0C80A78](v36);
  v15 = (char *)&v35 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EF2439B0);
  OUTLINED_FUNCTION_39();
  MEMORY[0x1E0C80A78](v16);
  OUTLINED_FUNCTION_2_2();
  v17 = (int *)OUTLINED_FUNCTION_0_64();
  OUTLINED_FUNCTION_39();
  MEMORY[0x1E0C80A78](v18);
  OUTLINED_FUNCTION_70_4();
  v21 = v19 - v20;
  MEMORY[0x1E0C80A78](v22);
  v24 = (char *)&v35 - v23;
  sub_1B9DE1674();
  OUTLINED_FUNCTION_12_22(v0);
  v25 = (uint64_t)&v24[v17[5]];
  OUTLINED_FUNCTION_12_22(v25);
  v26 = &v24[v17[12]];
  *(_QWORD *)v26 = 0;
  v26[8] = 1;
  *v24 = 1;
  sub_1B9DC81A0(v0, v25);
  v27 = v17[6];
  v28 = v17[7];
  v29 = v17[8];
  v30 = v17[9];
  v31 = v17[10];
  v24[v17[11]] = 0;
  *(_QWORD *)v26 = 0;
  v26[8] = 1;
  v24[v30] = *(_BYTE *)(v6 + OBJC_IVAR____TtC27AppleMediaServicesUIDynamic5Video_allowsAutoPlay);
  v24[v31] = *(_BYTE *)(v6 + OBJC_IVAR____TtC27AppleMediaServicesUIDynamic5Video_looping);
  *(_QWORD *)&v24[v28] = *(_QWORD *)(v6 + OBJC_IVAR____TtC27AppleMediaServicesUIDynamic5Video_autoPlayPlaybackControls);
  v24[v29] = *(_BYTE *)(v6 + OBJC_IVAR____TtC27AppleMediaServicesUIDynamic5Video_canPlayFullScreen);
  *(_QWORD *)&v24[v27] = *(_QWORD *)(v6 + OBJC_IVAR____TtC27AppleMediaServicesUIDynamic5Video_playbackControls);
  v32 = v37;
  sub_1B9DD2C5C(v37, v25);
  (*(void (**)(char *, uint64_t, uint64_t))(v13 + 16))(v15, v6 + OBJC_IVAR____TtC27AppleMediaServicesUIDynamic5Video_videoUrl, v36);
  sub_1B9DD752C((uint64_t)v24, v21, (uint64_t (*)(_QWORD))type metadata accessor for VideoConfiguration);
  sub_1B9DD8F2C(v6 + OBJC_IVAR____TtC27AppleMediaServicesUIDynamic5Video_templateMediaEvent, v38, (uint64_t *)&unk_1EF243CA0);
  sub_1B9DD8F2C(v6 + OBJC_IVAR____TtC27AppleMediaServicesUIDynamic5Video_templateClickEvent, v39, (uint64_t *)&unk_1EF243CA0);
  swift_bridgeObjectRetain();
  swift_retain();
  VideoView.__allocating_init(playbackId:url:configuration:templateMediaEvent:templateClickEvent:asPartOf:)();
  *(_QWORD *)&v33[OBJC_IVAR____TtC27AppleMediaServicesUIDynamic9VideoView_video] = v6;
  v34 = v33;
  swift_retain();
  OUTLINED_FUNCTION_32_0();
  VideoView.apply(video:withContentSize:)(v6, v43, v44, v42);
  OUTLINED_FUNCTION_12_11();
  swift_release();

  sub_1B9D6B278(v32, &qword_1EF2439B0);
  sub_1B9D6B30C((uint64_t)v24, (uint64_t (*)(_QWORD))type metadata accessor for VideoConfiguration);
  OUTLINED_FUNCTION_2_5();
}

uint64_t sub_1B9DD2C5C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF2439B0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 24))(a2, a1, v4);
  return a2;
}

void VideoView.__allocating_init(playbackId:url:configuration:templateMediaEvent:templateClickEvent:asPartOf:)()
{
  uint64_t v0;
  objc_class *v1;
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
  char *v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  id v26;
  id v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  Class v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  _QWORD v35[5];

  OUTLINED_FUNCTION_54_0();
  v30 = v2;
  v31 = v1;
  v33 = v3;
  v34 = v4;
  v28 = v5;
  v29 = v6;
  v8 = v7;
  v9 = v5;
  v32 = v10;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EF243CA0);
  OUTLINED_FUNCTION_39();
  MEMORY[0x1E0C80A78](v11);
  OUTLINED_FUNCTION_70_4();
  v14 = v12 - v13;
  MEMORY[0x1E0C80A78](v15);
  v17 = (char *)&v28 - v16;
  OUTLINED_FUNCTION_0_64();
  OUTLINED_FUNCTION_39();
  MEMORY[0x1E0C80A78](v18);
  v20 = (char *)&v28 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  v21 = OUTLINED_FUNCTION_2_4();
  v22 = *(_QWORD *)(v21 - 8);
  MEMORY[0x1E0C80A78](v21);
  OUTLINED_FUNCTION_18_9();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v22 + 16))(v0, v9, v21);
  sub_1B9DD752C(v8, (uint64_t)v20, (uint64_t (*)(_QWORD))type metadata accessor for VideoConfiguration);
  v23 = v29;
  sub_1B9DD8F2C(v29, (uint64_t)v17, (uint64_t *)&unk_1EF243CA0);
  v24 = v30;
  sub_1B9DD8F2C(v30, v14, (uint64_t *)&unk_1EF243CA0);
  v25 = type metadata accessor for NWPathNetworkInquiry();
  v26 = sub_1B9DB8050();
  v35[3] = v25;
  v35[4] = &off_1E71813A8;
  v35[0] = v26;
  v27 = objc_allocWithZone(v31);
  sub_1B9DD2F94(v32, v33, v0, (uint64_t)v20, (uint64_t)v17, v14, (uint64_t)v35);
  OUTLINED_FUNCTION_73_4(v24);
  OUTLINED_FUNCTION_73_4(v23);
  sub_1B9D6B30C(v8, (uint64_t (*)(_QWORD))type metadata accessor for VideoConfiguration);
  (*(void (**)(uint64_t, uint64_t))(v22 + 8))(v28, v21);
  OUTLINED_FUNCTION_2_5();
}

uint64_t VideoView.apply(video:withContentSize:)(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  uint64_t v4;
  _QWORD *v9;
  BOOL v10;
  uint64_t result;
  _QWORD *v12;

  v9 = (_QWORD *)(v4 + OBJC_IVAR____TtC27AppleMediaServicesUIDynamic9VideoView_playbackId);
  OUTLINED_FUNCTION_3_5();
  v10 = *v9 == *(_QWORD *)(a1 + OBJC_IVAR____TtC27AppleMediaServicesUIDynamic5Video_playbackId)
     && v9[1] == *(_QWORD *)(a1 + OBJC_IVAR____TtC27AppleMediaServicesUIDynamic5Video_playbackId + 8);
  if (v10 || (result = sub_1B9DE28A4(), (result & 1) != 0))
  {
    *(_QWORD *)(v4 + OBJC_IVAR____TtC27AppleMediaServicesUIDynamic9VideoView_video) = a1;
    swift_release();
    OUTLINED_FUNCTION_15_4();
    VideoView.startPreloading()();
    OUTLINED_FUNCTION_3_5();
    result = swift_weakLoadStrong();
    if (result)
    {
      if ((a4 & 1) == 0)
      {
        v12 = (_QWORD *)(*(_QWORD *)(v4 + OBJC_IVAR____TtC27AppleMediaServicesUIDynamic9VideoView_previewFrameArtwork)
                       + OBJC_IVAR____TtC27AppleMediaServicesUIDynamic16ArtworkImageView_artworkSize);
        OUTLINED_FUNCTION_6_5();
        *v12 = a2;
        v12[1] = a3;
      }
      if (*(_QWORD *)(a1 + OBJC_IVAR____TtC27AppleMediaServicesUIDynamic5Video_preview))
      {
        OUTLINED_FUNCTION_15_4();
        ArtworkImageView.apply(artwork:asPartOf:)();
        OUTLINED_FUNCTION_32_0();
      }
      return swift_release();
    }
  }
  return result;
}

char *sub_1B9DD2F94(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  char *v7;
  uint64_t v12;
  id v13;
  char *v14;
  uint64_t v15;
  char *v16;
  __int128 v17;
  char *v18;
  char *v19;
  char *v20;
  uint64_t v21;
  char *v22;
  void *v23;
  void *v24;
  id v25;
  char *v26;
  void *v27;
  id v28;
  unsigned __int8 v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  id v33;
  objc_class *v36;
  uint64_t v37;
  uint64_t v38;
  id v41;
  objc_super v42;

  v36 = (objc_class *)OUTLINED_FUNCTION_11_4();
  swift_weakInit();
  OUTLINED_FUNCTION_24_11((uint64_t)&v7[OBJC_IVAR____TtC27AppleMediaServicesUIDynamic9VideoView_fullScreenDelegate]);
  OUTLINED_FUNCTION_24_11((uint64_t)&v7[OBJC_IVAR____TtC27AppleMediaServicesUIDynamic9VideoView_videoPlayerDelegate]);
  v12 = OBJC_IVAR____TtC27AppleMediaServicesUIDynamic9VideoView_previewFrameArtwork;
  v13 = objc_allocWithZone((Class)type metadata accessor for ArtworkImageView());
  v14 = v7;
  OUTLINED_FUNCTION_98_1();
  *(_QWORD *)&v7[v12] = ArtworkImageView.init(artworkSize:frame:)();
  v14[OBJC_IVAR____TtC27AppleMediaServicesUIDynamic9VideoView_animatePreviewFrameTransitions] = 0;
  *(_QWORD *)&v14[OBJC_IVAR____TtC27AppleMediaServicesUIDynamic9VideoView_videoPlayer] = 0;
  *(_QWORD *)&v14[OBJC_IVAR____TtC27AppleMediaServicesUIDynamic9VideoView_playerViewController] = 0;
  *(_QWORD *)&v14[OBJC_IVAR____TtC27AppleMediaServicesUIDynamic9VideoView_video] = 0;
  v15 = OBJC_IVAR____TtC27AppleMediaServicesUIDynamic9VideoView_playButton;
  *(_QWORD *)&v14[v15] = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for PlayButton()), sel_init);
  v16 = &v14[OBJC_IVAR____TtC27AppleMediaServicesUIDynamic9VideoView_additionalControlInsets];
  v17 = *(_OWORD *)(MEMORY[0x1E0DC49E8] + 16);
  *(_OWORD *)v16 = *MEMORY[0x1E0DC49E8];
  *((_OWORD *)v16 + 1) = v17;
  v18 = &v14[OBJC_IVAR____TtC27AppleMediaServicesUIDynamic9VideoView_prominentPlayButtonLocationOverride];
  *(_QWORD *)v18 = 0;
  *((_QWORD *)v18 + 1) = 0;
  v18[16] = 1;
  *(_QWORD *)&v14[OBJC_IVAR____TtC27AppleMediaServicesUIDynamic9VideoView_preferredUnobscuredArea] = 1;
  v14[OBJC_IVAR____TtC27AppleMediaServicesUIDynamic9VideoView_unmuteAfterVideoPlayerCreation] = 0;
  OUTLINED_FUNCTION_24_11((uint64_t)&v14[OBJC_IVAR____TtC27AppleMediaServicesUIDynamic9VideoView_delegate]);
  v14[OBJC_IVAR____TtC27AppleMediaServicesUIDynamic9VideoView_isFullScreen] = 0;
  v14[OBJC_IVAR____TtC27AppleMediaServicesUIDynamic9VideoView_isTransitioningToFullscreen] = 0;
  v14[OBJC_IVAR____TtC27AppleMediaServicesUIDynamic9VideoView_wasAudioOnPreFullScreen] = 0;
  v14[OBJC_IVAR____TtC27AppleMediaServicesUIDynamic9VideoView_prefersMinimalPlaybackControls] = 0;
  *(_QWORD *)&v14[OBJC_IVAR____TtC27AppleMediaServicesUIDynamic9VideoView_currentTouch] = 0;
  v14[OBJC_IVAR____TtC27AppleMediaServicesUIDynamic9VideoView_releaseAssetsAtNextPauseState] = 0;
  OUTLINED_FUNCTION_6_5();
  swift_weakAssign();
  v19 = &v14[OBJC_IVAR____TtC27AppleMediaServicesUIDynamic9VideoView_playbackId];
  *(_QWORD *)v19 = a1;
  *((_QWORD *)v19 + 1) = a2;
  v20 = &v14[OBJC_IVAR____TtC27AppleMediaServicesUIDynamic9VideoView_videoUrl];
  v21 = OUTLINED_FUNCTION_2_4();
  v37 = *(_QWORD *)(v21 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v37 + 16))(v20, a3, v21);
  v38 = a5;
  sub_1B9DD8F2C(a5, (uint64_t)&v14[OBJC_IVAR____TtC27AppleMediaServicesUIDynamic9VideoView_templateMediaEvent], (uint64_t *)&unk_1EF243CA0);
  sub_1B9DD8F2C(a6, (uint64_t)&v14[OBJC_IVAR____TtC27AppleMediaServicesUIDynamic9VideoView_templateClickEvent], (uint64_t *)&unk_1EF243CA0);
  sub_1B9DD752C(a4, (uint64_t)&v14[OBJC_IVAR____TtC27AppleMediaServicesUIDynamic9VideoView_configuration], (uint64_t (*)(_QWORD))type metadata accessor for VideoConfiguration);
  sub_1B9DD8F2C(a7, (uint64_t)&v14[OBJC_IVAR____TtC27AppleMediaServicesUIDynamic9VideoView_networkInquiry], &qword_1EF242B60);

  v42.receiver = v14;
  v42.super_class = v36;
  v22 = (char *)objc_msgSendSuper2(&v42, sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);
  objc_msgSend(v22, sel_setClipsToBounds_, 0);
  v23 = *(void **)&v22[OBJC_IVAR____TtC27AppleMediaServicesUIDynamic9VideoView_previewFrameArtwork];
  objc_msgSend(v23, sel_setUserInteractionEnabled_, 0);
  objc_msgSend(v23, sel_setClipsToBounds_, 1);
  objc_msgSend(v22, sel_addSubview_, v23);
  v24 = (void *)objc_opt_self();
  v25 = objc_msgSend(v24, sel_defaultCenter);
  v26 = v22;
  v27 = (void *)sub_1B9DE213C();
  objc_msgSend(v25, sel_addObserver_selector_name_object_, v26, sel_didChangeAutoPlayVideoSetting, v27, 0);

  v28 = objc_msgSend(v24, sel_defaultCenter);
  objc_msgSend(v28, sel_addObserver_selector_name_object_, v26, sel_handleMediaServicesReset, *MEMORY[0x1E0C89738], 0);

  OUTLINED_FUNCTION_3_5();
  if (OUTLINED_FUNCTION_104_0())
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1ED5CDE10);
    sub_1B9DE1ADC();
    OUTLINED_FUNCTION_44_0();
    if (v41)
    {
      if ((objc_msgSend(v41, sel_respondsToSelector_, sel_isVideoAudioEnabled) & 1) != 0)
      {
        v29 = objc_msgSend(v41, sel_isVideoAudioEnabled);
        OUTLINED_FUNCTION_80_2();
        v26[OBJC_IVAR____TtC27AppleMediaServicesUIDynamic9VideoView_unmuteAfterVideoPlayerCreation] = v29;
      }
      else
      {
        OUTLINED_FUNCTION_80_2();
      }
    }
  }
  v30 = OBJC_IVAR____TtC27AppleMediaServicesUIDynamic9VideoView_playButton;
  objc_msgSend(*(id *)&v26[OBJC_IVAR____TtC27AppleMediaServicesUIDynamic9VideoView_playButton], sel_setHidden_, 1);
  v31 = *(void **)&v26[v30];
  v32 = OUTLINED_FUNCTION_7_7();
  swift_unknownObjectWeakInit();
  v33 = v31;
  OUTLINED_FUNCTION_15_4();
  sub_1B9DBC4E4((uint64_t)sub_1B9DD8F58, v32);

  OUTLINED_FUNCTION_32_0();
  objc_msgSend(v26, sel_addSubview_, *(_QWORD *)&v26[v30]);
  sub_1B9DD3DDC();
  swift_release();

  sub_1B9D6B278(a7, &qword_1EF242B60);
  sub_1B9D6B278(a6, (uint64_t *)&unk_1EF243CA0);
  sub_1B9D6B278(v38, (uint64_t *)&unk_1EF243CA0);
  sub_1B9D6B30C(a4, (uint64_t (*)(_QWORD))type metadata accessor for VideoConfiguration);
  (*(void (**)(uint64_t, uint64_t))(v37 + 8))(a3, v21);
  return v26;
}

void sub_1B9DD3500(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  char *v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t DynamicType;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  void (*v16)(void);
  char *v17;
  char *v18;
  uint64_t v19;
  void *v20;
  unsigned __int8 v21;
  void *v22;
  _QWORD v23[3];
  uint64_t MetatypeMetadata;
  _QWORD v25[3];
  uint64_t v26;

  v2 = sub_1B9DE18B4();
  MEMORY[0x1E0C80A78](v2);
  swift_beginAccess();
  v3 = MEMORY[0x1BCCCEFF8](a1 + 16);
  if (v3)
  {
    v4 = (void *)v3;
    __swift_instantiateConcreteTypeFromMangledName(&qword_1ED5CFBE0);
    sub_1B9DE18FC();
    *(_OWORD *)(swift_allocObject() + 16) = xmmword_1B9DEFE80;
    v26 = type metadata accessor for VideoView();
    v25[0] = v4;
    v5 = v4;
    v6 = (id)AMSLogKey();
    v7 = MEMORY[0x1E0DEA968];
    if (v6)
    {
      v8 = v6;
      v9 = sub_1B9DE2160();
      v11 = v10;

      sub_1B9DE18A8();
      sub_1B9DE189C();
      __swift_project_boxed_opaque_existential_2(v25, v26);
      DynamicType = swift_getDynamicType();
      MetatypeMetadata = swift_getMetatypeMetadata();
      v23[0] = DynamicType;
      sub_1B9DE1884();
      sub_1B9D6B278((uint64_t)v23, (uint64_t *)&unk_1ED5CFC00);
      sub_1B9DE189C();
      MetatypeMetadata = v7;
      v23[0] = v9;
      v23[1] = v11;
      sub_1B9DE1884();
    }
    else
    {
      sub_1B9DE18A8();
      sub_1B9DE189C();
      __swift_project_boxed_opaque_existential_2(v25, v26);
      v13 = swift_getDynamicType();
      MetatypeMetadata = swift_getMetatypeMetadata();
      v23[0] = v13;
      sub_1B9DE1884();
    }
    sub_1B9D6B278((uint64_t)v23, (uint64_t *)&unk_1ED5CFC00);
    sub_1B9DE189C();
    sub_1B9DE18C0();
    type metadata accessor for Log();
    __swift_destroy_boxed_opaque_existential_2((uint64_t)v25);
    v26 = v7;
    v25[0] = 0x7061742079616C50;
    v25[1] = 0xEB00000000646570;
    sub_1B9DE18CC();
    sub_1B9D6B278((uint64_t)v25, (uint64_t *)&unk_1ED5CFC00);
    sub_1B9DB0344();
    swift_bridgeObjectRelease();
    VideoView.play()();
    v14 = &v5[OBJC_IVAR____TtC27AppleMediaServicesUIDynamic9VideoView_delegate];
    swift_beginAccess();
    if (MEMORY[0x1BCCCEFF8](v14))
    {
      v15 = *((_QWORD *)v14 + 1);
      swift_getObjectType();
      v16 = *(void (**)(void))(v15 + 40);
      v17 = v5;
      v16();

      swift_unknownObjectRelease();
    }
    if ((VideoView.allowsAutoPlay.getter() & 1) != 0)
      goto LABEL_18;
    v18 = &v5[OBJC_IVAR____TtC27AppleMediaServicesUIDynamic9VideoView_configuration];
    swift_beginAccess();
    if ((v18[*(int *)(type metadata accessor for VideoConfiguration() + 24)] & 8) == 0)
      goto LABEL_18;
    v19 = OBJC_IVAR____TtC27AppleMediaServicesUIDynamic9VideoView_videoPlayer;
    if (*(_QWORD *)&v5[OBJC_IVAR____TtC27AppleMediaServicesUIDynamic9VideoView_videoPlayer])
    {
      objc_msgSend(v5, sel_updateAudioSessionCategoryWithIsAudioOn_, 1);
      v20 = *(void **)&v5[v19];
      if (v20)
        objc_msgSend(v20, sel_setMuted_, 0);
      goto LABEL_18;
    }
    swift_beginAccess();
    if (swift_weakLoadStrong())
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_1ED5CDE10);
      sub_1B9DE1ADC();
      swift_release();
      if (v22)
      {
        if ((objc_msgSend(v22, sel_respondsToSelector_, sel_isVideoAudioEnabled) & 1) != 0)
        {
          v21 = objc_msgSend(v22, sel_isVideoAudioEnabled);
          swift_unknownObjectRelease();
          v5[OBJC_IVAR____TtC27AppleMediaServicesUIDynamic9VideoView_unmuteAfterVideoPlayerCreation] = v21;
LABEL_18:

          return;
        }
        swift_unknownObjectRelease();
      }
    }
    v5[OBJC_IVAR____TtC27AppleMediaServicesUIDynamic9VideoView_unmuteAfterVideoPlayerCreation] = 1;
    goto LABEL_18;
  }
}

Swift::Void __swiftcall VideoView.play()()
{
  char *v0;
  char *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _BYTE *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  unint64_t v22;
  unint64_t v23;
  uint64_t v24;

  OUTLINED_FUNCTION_54_0();
  v1 = v0;
  v2 = OUTLINED_FUNCTION_11_4();
  OUTLINED_FUNCTION_31_1();
  OUTLINED_FUNCTION_39();
  MEMORY[0x1E0C80A78](v3);
  OUTLINED_FUNCTION_77_1();
  v4 = OBJC_IVAR____TtC27AppleMediaServicesUIDynamic9VideoView_videoPlayer;
  v5 = *(_QWORD *)&v0[OBJC_IVAR____TtC27AppleMediaServicesUIDynamic9VideoView_videoPlayer];
  v6 = MEMORY[0x1E0DEA968];
  if (!v5)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1ED5CFBE0);
    OUTLINED_FUNCTION_15_6();
    *(_OWORD *)(OUTLINED_FUNCTION_7_27() + 16) = xmmword_1B9DEFE80;
    OUTLINED_FUNCTION_95_2();
    if ((id)AMSLogKey())
    {
      v7 = OUTLINED_FUNCTION_24_1();
      v9 = v8;

      OUTLINED_FUNCTION_11_7();
      OUTLINED_FUNCTION_4_8();
      OUTLINED_FUNCTION_1_11(&v22);
      v10 = OUTLINED_FUNCTION_16_1();
      v11 = OUTLINED_FUNCTION_15_17(v10);
      OUTLINED_FUNCTION_93_2(v11, (uint64_t *)&unk_1ED5CFC00);
      OUTLINED_FUNCTION_7_1();
      v21 = MEMORY[0x1E0DEA968];
      v19 = v7;
      v6 = MEMORY[0x1E0DEA968];
      v20 = v9;
      sub_1B9DE1884();
      sub_1B9D6B278((uint64_t)&v19, (uint64_t *)&unk_1ED5CFC00);
    }
    else
    {
      OUTLINED_FUNCTION_9_8();
      OUTLINED_FUNCTION_4_8();
      OUTLINED_FUNCTION_1_11(&v22);
      v12 = OUTLINED_FUNCTION_16_1();
      v13 = OUTLINED_FUNCTION_15_17(v12);
      OUTLINED_FUNCTION_93_2(v13, (uint64_t *)&unk_1ED5CFC00);
    }
    OUTLINED_FUNCTION_88();
    sub_1B9DE18C0();
    OUTLINED_FUNCTION_38_0();
    __swift_destroy_boxed_opaque_existential_2((uint64_t)&v22);
    v24 = v6;
    v22 = 0x6964616F6C657250;
    v23 = 0xEA0000000000676ELL;
    sub_1B9DE18CC();
    sub_1B9D6B278((uint64_t)&v22, (uint64_t *)&unk_1ED5CFC00);
    sub_1B9DB0384();
    OUTLINED_FUNCTION_16_0();
    VideoView.startPreloading()();
    v5 = *(_QWORD *)&v0[v4];
    if (!v5)
      goto LABEL_7;
  }
  v14 = (_BYTE *)(v5 + OBJC_IVAR____TtC27AppleMediaServicesUIDynamic11VideoPlayer_shouldBePlaying);
  OUTLINED_FUNCTION_3_5();
  if ((*v14 & 1) == 0)
  {
    OUTLINED_FUNCTION_7_7();
    OUTLINED_FUNCTION_131();
    swift_retain();
    sub_1B9DD498C(sub_1B9DD4984);
    swift_release_n();
  }
  else
  {
LABEL_7:
    __swift_instantiateConcreteTypeFromMangledName(&qword_1ED5CFBE0);
    OUTLINED_FUNCTION_15_6();
    *(_OWORD *)(OUTLINED_FUNCTION_7_27() + 16) = xmmword_1B9DEFE80;
    OUTLINED_FUNCTION_95_2();
    if ((id)AMSLogKey())
    {
      OUTLINED_FUNCTION_24_1();
      OUTLINED_FUNCTION_90_0();
      OUTLINED_FUNCTION_11_7();
      OUTLINED_FUNCTION_4_8();
      OUTLINED_FUNCTION_1_11(&v22);
      v15 = OUTLINED_FUNCTION_16_1();
      OUTLINED_FUNCTION_15_17(v15);
      OUTLINED_FUNCTION_94_3();
      OUTLINED_FUNCTION_7_1();
      v21 = MEMORY[0x1E0DEA968];
      v19 = v2;
      v20 = "";
      sub_1B9DE1884();
      OUTLINED_FUNCTION_94_3();
    }
    else
    {
      OUTLINED_FUNCTION_9_8();
      OUTLINED_FUNCTION_4_8();
      OUTLINED_FUNCTION_1_11(&v22);
      v16 = OUTLINED_FUNCTION_16_1();
      v17 = OUTLINED_FUNCTION_15_17(v16);
      OUTLINED_FUNCTION_93_2(v17, (uint64_t *)&unk_1ED5CFC00);
    }
    OUTLINED_FUNCTION_88();
    sub_1B9DE18C0();
    __swift_destroy_boxed_opaque_existential_2((uint64_t)&v22);
    v22 = 0;
    v23 = 0xE000000000000000;
    sub_1B9DE2724();
    swift_bridgeObjectRelease();
    v22 = 0xD000000000000026;
    v23 = 0x80000001B9DEABF0;
    if (*(_QWORD *)&v1[v4])
      OUTLINED_FUNCTION_3_5();
    v18 = MEMORY[0x1E0DEA968];
    OUTLINED_FUNCTION_38_0();
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EF243CB8);
    sub_1B9DE219C();
    sub_1B9DE21E4();
    swift_bridgeObjectRelease();
    v24 = v18;
    sub_1B9DE18CC();
    sub_1B9D6B278((uint64_t)&v22, (uint64_t *)&unk_1ED5CFC00);
    sub_1B9DB0344();
    OUTLINED_FUNCTION_16_0();
  }
  OUTLINED_FUNCTION_2_5();
}

uint64_t VideoView.allowsAutoPlay.getter()
{
  char v0;

  OUTLINED_FUNCTION_11_4();
  OUTLINED_FUNCTION_3_5();
  OUTLINED_FUNCTION_0_64();
  OUTLINED_FUNCTION_3_5();
  swift_weakLoadStrong();
  v0 = static VideoView.isAutoPlayAllowed(videoConfigurationAutoPlay:objectGraph:)();
  OUTLINED_FUNCTION_12_11();
  return v0 & 1;
}

void sub_1B9DD3DDC()
{
  char *v0;
  uint64_t ObjectType;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  char v5;
  char *v6;
  uint64_t v7;
  void *v8;
  char *v9;
  void *v10;
  char *v11;
  uint64_t v12;
  void *v13;
  _QWORD *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  char *v18;
  id v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t DynamicType;
  uint64_t v26;
  void *v27;
  char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  _QWORD v32[3];
  uint64_t MetatypeMetadata;
  unint64_t v34;
  unint64_t v35;
  uint64_t v36;

  ObjectType = swift_getObjectType();
  v2 = sub_1B9DE18B4();
  MEMORY[0x1E0C80A78](v2);
  v3 = *(_QWORD *)&v0[OBJC_IVAR____TtC27AppleMediaServicesUIDynamic9VideoView_videoPlayer];
  if (v3)
  {
    v4 = &v0[OBJC_IVAR____TtC27AppleMediaServicesUIDynamic9VideoView_configuration];
    swift_beginAccess();
    v5 = v4[*(int *)(type metadata accessor for VideoConfiguration() + 40)];
    v6 = (char *)(v3 + OBJC_IVAR____TtC27AppleMediaServicesUIDynamic11VideoPlayer_shouldLoopPlayback);
    swift_beginAccess();
    *v6 = v5;
  }
  v7 = OBJC_IVAR____TtC27AppleMediaServicesUIDynamic9VideoView_playerViewController;
  v8 = *(void **)&v0[OBJC_IVAR____TtC27AppleMediaServicesUIDynamic9VideoView_playerViewController];
  if (v8)
  {
    v9 = &v0[OBJC_IVAR____TtC27AppleMediaServicesUIDynamic9VideoView_configuration];
    swift_beginAccess();
    objc_msgSend(v8, sel_setAllowsEnteringFullScreen_, v9[*(int *)(type metadata accessor for VideoConfiguration() + 32)]);
  }
  v10 = *(void **)&v0[OBJC_IVAR____TtC27AppleMediaServicesUIDynamic9VideoView_previewFrameArtwork];
  v11 = &v0[OBJC_IVAR____TtC27AppleMediaServicesUIDynamic9VideoView_configuration];
  swift_beginAccess();
  if (*v11)
    v12 = 2;
  else
    v12 = 1;
  objc_msgSend(v10, sel_setContentMode_, v12);
  v13 = *(void **)&v0[v7];
  if (v13)
  {
    v14 = (_QWORD *)MEMORY[0x1E0C8A6E0];
    if (!*v11)
      v14 = (_QWORD *)MEMORY[0x1E0C8A6D8];
    objc_msgSend(v13, sel_setVideoGravity_forLayoutClass_, *v14, 0);
  }
  v15 = type metadata accessor for VideoConfiguration();
  objc_msgSend(v0, sel_setUserInteractionEnabled_, *(_QWORD *)&v11[*(int *)(v15 + 24)] != 0);
  objc_msgSend(*(id *)&v0[OBJC_IVAR____TtC27AppleMediaServicesUIDynamic9VideoView_playButton], sel_setHidden_, (*(_QWORD *)&v11[*(int *)(v15 + 24)] & 1) == 0);
  v16 = *(void **)&v0[v7];
  if (v16)
  {
    objc_msgSend(v16, sel_setShowsPlaybackControls_, (*(_QWORD *)&v11[*(int *)(v15 + 24)] & 0xELL) != 0);
    v17 = *(void **)&v0[v7];
    if (v17)
      objc_msgSend(v17, sel_setShowsMinimalPlaybackControlsWhenEmbeddedInline_, (*(_QWORD *)&v11[*(int *)(v15 + 24)] & 4) == 0);
  }
  v31 = v7;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED5CFBE0);
  v30 = *(_QWORD *)(*(_QWORD *)(sub_1B9DE18FC() - 8) + 72);
  *(_OWORD *)(swift_allocObject() + 16) = xmmword_1B9DEFE80;
  v36 = ObjectType;
  v34 = (unint64_t)v0;
  v18 = v0;
  v19 = (id)AMSLogKey();
  v20 = MEMORY[0x1E0DEA968];
  if (v19)
  {
    v21 = v19;
    v22 = sub_1B9DE2160();
    v24 = v23;

    sub_1B9DE18A8();
    sub_1B9DE189C();
    __swift_project_boxed_opaque_existential_2(&v34, v36);
    DynamicType = swift_getDynamicType();
    MetatypeMetadata = swift_getMetatypeMetadata();
    v32[0] = DynamicType;
    sub_1B9DE1884();
    sub_1B9D6B278((uint64_t)v32, (uint64_t *)&unk_1ED5CFC00);
    sub_1B9DE189C();
    MetatypeMetadata = v20;
    v32[0] = v22;
    v32[1] = v24;
    sub_1B9DE1884();
  }
  else
  {
    sub_1B9DE18A8();
    sub_1B9DE189C();
    __swift_project_boxed_opaque_existential_2(&v34, v36);
    v26 = swift_getDynamicType();
    MetatypeMetadata = swift_getMetatypeMetadata();
    v32[0] = v26;
    sub_1B9DE1884();
  }
  sub_1B9D6B278((uint64_t)v32, (uint64_t *)&unk_1ED5CFC00);
  sub_1B9DE189C();
  sub_1B9DE18C0();
  __swift_destroy_boxed_opaque_existential_2((uint64_t)&v34);
  v34 = 0;
  v35 = 0xE000000000000000;
  sub_1B9DE2724();
  swift_bridgeObjectRelease();
  v34 = 0xD00000000000001BLL;
  v35 = 0x80000001B9DEB180;
  if ((VideoView.allowsAutoPlay.getter() & 1) == 0)
    swift_beginAccess();
  type metadata accessor for Log();
  sub_1B9DE21E4();
  swift_bridgeObjectRelease();
  v36 = MEMORY[0x1E0DEA968];
  sub_1B9DE18CC();
  sub_1B9D6B278((uint64_t)&v34, (uint64_t *)&unk_1ED5CFC00);
  sub_1B9DB0344();
  swift_bridgeObjectRelease();
  v27 = *(void **)&v0[v31];
  if (v27)
  {
    if ((v11[*(int *)(v15 + 24)] & 8) != 0)
    {
      v29 = 1;
    }
    else
    {
      v28 = &v18[OBJC_IVAR____TtC27AppleMediaServicesUIDynamic9VideoView_isFullScreen];
      swift_beginAccess();
      v29 = *v28;
    }
    objc_msgSend(v27, sel_setPlaybackControlsIncludeVolumeControls_, v29, v30);
  }
  sub_1B9DD5AB0();
  sub_1B9DD649C();
  sub_1B9DD277C();
}

void sub_1B9DD4358()
{
  _BYTE *v0;
  _BYTE *v1;
  uint64_t v2;
  id v3;
  uint64_t v4;
  _OWORD *v5;
  __int128 v6;
  char *v7;

  v1 = v0;
  swift_weakInit();
  OUTLINED_FUNCTION_24_11((uint64_t)&v0[OBJC_IVAR____TtC27AppleMediaServicesUIDynamic9VideoView_fullScreenDelegate]);
  OUTLINED_FUNCTION_24_11((uint64_t)&v0[OBJC_IVAR____TtC27AppleMediaServicesUIDynamic9VideoView_videoPlayerDelegate]);
  v2 = OBJC_IVAR____TtC27AppleMediaServicesUIDynamic9VideoView_previewFrameArtwork;
  v3 = objc_allocWithZone((Class)type metadata accessor for ArtworkImageView());
  OUTLINED_FUNCTION_98_1();
  *(_QWORD *)&v0[v2] = ArtworkImageView.init(artworkSize:frame:)();
  v0[OBJC_IVAR____TtC27AppleMediaServicesUIDynamic9VideoView_animatePreviewFrameTransitions] = 0;
  *(_QWORD *)&v0[OBJC_IVAR____TtC27AppleMediaServicesUIDynamic9VideoView_videoPlayer] = 0;
  *(_QWORD *)&v0[OBJC_IVAR____TtC27AppleMediaServicesUIDynamic9VideoView_playerViewController] = 0;
  *(_QWORD *)&v0[OBJC_IVAR____TtC27AppleMediaServicesUIDynamic9VideoView_video] = 0;
  v4 = OBJC_IVAR____TtC27AppleMediaServicesUIDynamic9VideoView_playButton;
  *(_QWORD *)&v1[v4] = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for PlayButton()), sel_init);
  v5 = &v1[OBJC_IVAR____TtC27AppleMediaServicesUIDynamic9VideoView_additionalControlInsets];
  v6 = *(_OWORD *)(MEMORY[0x1E0DC49E8] + 16);
  *v5 = *MEMORY[0x1E0DC49E8];
  v5[1] = v6;
  v7 = &v1[OBJC_IVAR____TtC27AppleMediaServicesUIDynamic9VideoView_prominentPlayButtonLocationOverride];
  *(_QWORD *)v7 = 0;
  *((_QWORD *)v7 + 1) = 0;
  v7[16] = 1;
  *(_QWORD *)&v1[OBJC_IVAR____TtC27AppleMediaServicesUIDynamic9VideoView_preferredUnobscuredArea] = 1;
  v1[OBJC_IVAR____TtC27AppleMediaServicesUIDynamic9VideoView_unmuteAfterVideoPlayerCreation] = 0;
  OUTLINED_FUNCTION_24_11((uint64_t)&v1[OBJC_IVAR____TtC27AppleMediaServicesUIDynamic9VideoView_delegate]);
  v1[OBJC_IVAR____TtC27AppleMediaServicesUIDynamic9VideoView_isFullScreen] = 0;
  v1[OBJC_IVAR____TtC27AppleMediaServicesUIDynamic9VideoView_isTransitioningToFullscreen] = 0;
  v1[OBJC_IVAR____TtC27AppleMediaServicesUIDynamic9VideoView_wasAudioOnPreFullScreen] = 0;
  v1[OBJC_IVAR____TtC27AppleMediaServicesUIDynamic9VideoView_prefersMinimalPlaybackControls] = 0;
  *(_QWORD *)&v1[OBJC_IVAR____TtC27AppleMediaServicesUIDynamic9VideoView_currentTouch] = 0;
  v1[OBJC_IVAR____TtC27AppleMediaServicesUIDynamic9VideoView_releaseAssetsAtNextPauseState] = 0;

  sub_1B9DE27E4();
  __break(1u);
}

void VideoView.playbackId.getter()
{
  OUTLINED_FUNCTION_3_5();
  swift_bridgeObjectRetain();
  OUTLINED_FUNCTION_13_4();
}

void VideoView.playbackId.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v5;

  v5 = (_QWORD *)(v2 + OBJC_IVAR____TtC27AppleMediaServicesUIDynamic9VideoView_playbackId);
  OUTLINED_FUNCTION_6_5();
  *v5 = a1;
  v5[1] = a2;
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_3_22();
}

void VideoView.playbackId.modify()
{
  OUTLINED_FUNCTION_6_5();
  OUTLINED_FUNCTION_1();
}

void VideoView.delegate.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = v0 + OBJC_IVAR____TtC27AppleMediaServicesUIDynamic9VideoView_delegate;
  OUTLINED_FUNCTION_3_5();
  MEMORY[0x1BCCCEFF8](v1);
  OUTLINED_FUNCTION_13_4();
}

void VideoView.delegate.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v4;

  v4 = v2 + OBJC_IVAR____TtC27AppleMediaServicesUIDynamic9VideoView_delegate;
  OUTLINED_FUNCTION_6_5();
  *(_QWORD *)(v4 + 8) = a2;
  swift_unknownObjectWeakAssign();
  OUTLINED_FUNCTION_81_4();
  OUTLINED_FUNCTION_3_22();
}

void VideoView.delegate.modify(_QWORD *a1)
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v3 = malloc(0x38uLL);
  *a1 = v3;
  v4 = OBJC_IVAR____TtC27AppleMediaServicesUIDynamic9VideoView_delegate;
  v3[5] = v1;
  v3[6] = v4;
  v5 = v1 + v4;
  OUTLINED_FUNCTION_6_5();
  v6 = MEMORY[0x1BCCCEFF8](v5);
  v7 = *(_QWORD *)(v5 + 8);
  v3[3] = v6;
  v3[4] = v7;
  OUTLINED_FUNCTION_1_7();
}

void VideoView.state.getter()
{
  uint64_t v0;

  if (*(_QWORD *)(v0 + OBJC_IVAR____TtC27AppleMediaServicesUIDynamic9VideoView_videoPlayer))
    OUTLINED_FUNCTION_3_5();
  OUTLINED_FUNCTION_13_4();
}

Swift::Void __swiftcall VideoView.startPreloading()()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;
  char *v7;
  id v8;

  v2 = OUTLINED_FUNCTION_2_4();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x1E0C80A78](v2);
  OUTLINED_FUNCTION_77_1();
  sub_1B9DD54F0();
  v4 = OBJC_IVAR____TtC27AppleMediaServicesUIDynamic9VideoView_videoPlayer;
  v5 = *(void **)(v0 + OBJC_IVAR____TtC27AppleMediaServicesUIDynamic9VideoView_videoPlayer);
  if (v5
    || ((*(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16))(v1, v0 + OBJC_IVAR____TtC27AppleMediaServicesUIDynamic9VideoView_videoUrl, v2), v6 = objc_allocWithZone((Class)type metadata accessor for VideoPlayer(0)), v7 = VideoPlayer.init(with:)(v1), sub_1B9DD1F2C(v7), (v5 = *(void **)(v0 + v4)) != 0))
  {
    v8 = v5;
    VideoPlayer.startPreloading()();

  }
}

uint64_t sub_1B9DD4804()
{
  swift_unknownObjectWeakDestroy();
  return swift_deallocObject();
}

void sub_1B9DD4828(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  void *v3;
  void *v4;
  id v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;

  v1 = a1 + 16;
  type metadata accessor for Log();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED5CFBE0);
  sub_1B9DE18FC();
  *(_OWORD *)(swift_allocObject() + 16) = xmmword_1B9DEFE80;
  sub_1B9DE1860();
  v8 = MEMORY[0x1E0DEA968];
  v6 = 0xD00000000000001CLL;
  v7 = 0x80000001B9DEB1A0;
  sub_1B9DE18CC();
  sub_1B9D6B278((uint64_t)&v6, (uint64_t *)&unk_1ED5CFC00);
  sub_1B9DB0384();
  swift_bridgeObjectRelease();
  swift_beginAccess();
  v2 = MEMORY[0x1BCCCEFF8](v1);
  if (v2)
  {
    v3 = (void *)v2;
    v4 = *(void **)(v2 + OBJC_IVAR____TtC27AppleMediaServicesUIDynamic9VideoView_videoPlayer);
    if (v4)
    {
      v5 = v4;

      objc_msgSend(v5, sel_play, v6, v7);
      v3 = v5;
    }

  }
}

void sub_1B9DD4984()
{
  uint64_t v0;

  sub_1B9DD4828(v0);
}

void sub_1B9DD498C(void (*a1)(void))
{
  uint64_t v1;
  void *v3;
  id v4;

  v3 = *(void **)(v1 + OBJC_IVAR____TtC27AppleMediaServicesUIDynamic9VideoView_videoPlayer);
  if (v3)
  {
    v4 = v3;
    if (objc_msgSend(v4, sel_isMuted) && (VideoView.allowsAutoPlay.getter() & 1) != 0)
    {
      sub_1B9D661C0(0, &qword_1EF243E38);
      sub_1B9DD6BA4();

      return;
    }

  }
  if (a1)
    a1();
}

Swift::Void __swiftcall VideoView.pause()()
{
  uint64_t v0;
  char *v1;
  char *v2;

  v1 = *(char **)(v0 + OBJC_IVAR____TtC27AppleMediaServicesUIDynamic9VideoView_videoPlayer);
  if (v1)
  {
    v2 = &v1[OBJC_IVAR____TtC27AppleMediaServicesUIDynamic11VideoPlayer_shouldBePlaying];
    OUTLINED_FUNCTION_3_5();
    if (*v2 == 1)
      objc_msgSend(v1, sel_pause);
  }
  OUTLINED_FUNCTION_13_4();
}

Swift::Void __swiftcall VideoView.restart()()
{
  uint64_t v0;
  void *v1;
  id v2;

  v1 = *(void **)(v0 + OBJC_IVAR____TtC27AppleMediaServicesUIDynamic9VideoView_videoPlayer);
  if (v1)
  {
    v2 = v1;
    VideoPlayer.restart()();
    OUTLINED_FUNCTION_36_3(v2);
  }
  else
  {
    OUTLINED_FUNCTION_84();
  }
}

uint64_t VideoView.isPlaying.getter()
{
  uint64_t v0;
  void *v1;
  id v2;
  char v3;
  char v4;

  v1 = *(void **)(v0 + OBJC_IVAR____TtC27AppleMediaServicesUIDynamic9VideoView_videoPlayer);
  if (!v1)
    return 0;
  v2 = v1;
  VideoPlayer.isPlaying.getter();
  v4 = v3;

  return v4 & 1;
}

void VideoView.shouldBePlaying.getter()
{
  uint64_t v0;

  if (*(_QWORD *)(v0 + OBJC_IVAR____TtC27AppleMediaServicesUIDynamic9VideoView_videoPlayer))
    OUTLINED_FUNCTION_3_5();
  OUTLINED_FUNCTION_13_4();
}

uint64_t static VideoView.isAutoPlayAllowed(videoConfigurationAutoPlay:objectGraph:)()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char v4;
  char v5;
  uint64_t v6;
  id v7;
  unsigned __int8 v8;
  __n128 *v9;
  uint64_t v10;
  uint64_t v11;
  __n128 *v12;
  uint64_t v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  __n128 *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  id v35[3];
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;

  OUTLINED_FUNCTION_54_0();
  v37 = v0;
  v38 = v1;
  v3 = v2;
  v5 = v4;
  OUTLINED_FUNCTION_31_1();
  OUTLINED_FUNCTION_39();
  MEMORY[0x1E0C80A78](v6);
  OUTLINED_FUNCTION_18_9();
  if ((v5 & 1) == 0)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1ED5CFBE0);
    OUTLINED_FUNCTION_15_6();
    v12 = (__n128 *)OUTLINED_FUNCTION_8_22();
    OUTLINED_FUNCTION_96_2(v12, (__n128)xmmword_1B9DEFE80);
    v13 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EF243CC0);
    v14 = (id)OUTLINED_FUNCTION_33_9(v13);
    v15 = MEMORY[0x1E0DEA968];
    if (v14)
    {
      OUTLINED_FUNCTION_24_1();
      OUTLINED_FUNCTION_93_0();
      OUTLINED_FUNCTION_11_7();
      OUTLINED_FUNCTION_2_17();
      OUTLINED_FUNCTION_1_11(v35);
      v16 = OUTLINED_FUNCTION_16_1();
      OUTLINED_FUNCTION_1_22(v16);
      OUTLINED_FUNCTION_22_13();
      OUTLINED_FUNCTION_7_1();
      OUTLINED_FUNCTION_9_9();
      OUTLINED_FUNCTION_22_13();
    }
    else
    {
      OUTLINED_FUNCTION_9_8();
      OUTLINED_FUNCTION_2_17();
      OUTLINED_FUNCTION_1_11(v35);
      v20 = OUTLINED_FUNCTION_16_1();
      v21 = OUTLINED_FUNCTION_1_22(v20);
      OUTLINED_FUNCTION_49_7(v21, (uint64_t *)&unk_1ED5CFC00);
    }
    OUTLINED_FUNCTION_25_2();
    OUTLINED_FUNCTION_47_6();
    OUTLINED_FUNCTION_38_0();
    __swift_destroy_boxed_opaque_existential_2((uint64_t)v35);
    v36 = v15;
    v22 = OUTLINED_FUNCTION_45_4();
    OUTLINED_FUNCTION_50_4(v22, (uint64_t *)&unk_1ED5CFC00);
    sub_1B9DB0364();
    goto LABEL_18;
  }
  v7 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0CB3898]), sel_init);
  v8 = objc_msgSend(v7, sel_isLowPowerModeEnabled);

  if ((v8 & 1) != 0)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1ED5CFBE0);
    OUTLINED_FUNCTION_15_6();
    v9 = (__n128 *)OUTLINED_FUNCTION_8_22();
    OUTLINED_FUNCTION_96_2(v9, (__n128)xmmword_1B9DEFE80);
    v10 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EF243CC0);
    if ((id)OUTLINED_FUNCTION_33_9(v10))
    {
      OUTLINED_FUNCTION_24_1();
      OUTLINED_FUNCTION_93_0();
      OUTLINED_FUNCTION_11_7();
      OUTLINED_FUNCTION_2_17();
      OUTLINED_FUNCTION_1_11(v35);
      v11 = OUTLINED_FUNCTION_16_1();
      OUTLINED_FUNCTION_1_22(v11);
      OUTLINED_FUNCTION_22_13();
      OUTLINED_FUNCTION_7_1();
      OUTLINED_FUNCTION_9_9();
      OUTLINED_FUNCTION_22_13();
    }
    else
    {
      OUTLINED_FUNCTION_9_8();
      OUTLINED_FUNCTION_2_17();
      OUTLINED_FUNCTION_1_11(v35);
      v23 = OUTLINED_FUNCTION_16_1();
      v24 = OUTLINED_FUNCTION_1_22(v23);
      OUTLINED_FUNCTION_49_7(v24, (uint64_t *)&unk_1ED5CFC00);
    }
    OUTLINED_FUNCTION_25_2();
    OUTLINED_FUNCTION_47_6();
    OUTLINED_FUNCTION_38_0();
    OUTLINED_FUNCTION_150();
    v36 = MEMORY[0x1E0DEA968];
    v25 = OUTLINED_FUNCTION_45_4();
    OUTLINED_FUNCTION_50_4(v25, (uint64_t *)&unk_1ED5CFC00);
    sub_1B9DB0344();
LABEL_18:
    swift_bridgeObjectRelease();
    return 0;
  }
  if (v3)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1ED5CDE10);
    sub_1B9DE1ADC();
    if (v35[0])
    {
      if ((objc_msgSend(v35[0], sel_respondsToSelector_, sel_isAutoPlayAllowed) & 1) != 0
        && (objc_msgSend(v35[0], sel_isAutoPlayAllowed) & 1) == 0)
      {
        __swift_instantiateConcreteTypeFromMangledName(&qword_1ED5CFBE0);
        OUTLINED_FUNCTION_15_6();
        *(_OWORD *)(OUTLINED_FUNCTION_7_27() + 16) = xmmword_1B9DEFE80;
        v30 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EF243CC0);
        if ((id)OUTLINED_FUNCTION_33_9(v30))
        {
          OUTLINED_FUNCTION_24_1();
          OUTLINED_FUNCTION_90_0();
          OUTLINED_FUNCTION_11_7();
          OUTLINED_FUNCTION_2_17();
          OUTLINED_FUNCTION_1_11(v35);
          v31 = OUTLINED_FUNCTION_16_1();
          OUTLINED_FUNCTION_1_22(v31);
          OUTLINED_FUNCTION_31_5();
          OUTLINED_FUNCTION_7_1();
          OUTLINED_FUNCTION_9_9();
          OUTLINED_FUNCTION_31_5();
        }
        else
        {
          OUTLINED_FUNCTION_9_8();
          OUTLINED_FUNCTION_2_17();
          OUTLINED_FUNCTION_1_11(v35);
          v32 = OUTLINED_FUNCTION_16_1();
          v33 = OUTLINED_FUNCTION_1_22(v32);
          OUTLINED_FUNCTION_49_7(v33, (uint64_t *)&unk_1ED5CFC00);
        }
        OUTLINED_FUNCTION_25_2();
        sub_1B9DE18C0();
        OUTLINED_FUNCTION_38_0();
        OUTLINED_FUNCTION_150();
        v36 = MEMORY[0x1E0DEA968];
        v34 = OUTLINED_FUNCTION_45_4();
        OUTLINED_FUNCTION_50_4(v34, (uint64_t *)&unk_1ED5CFC00);
        sub_1B9DB0344();
        OUTLINED_FUNCTION_16_0();
        OUTLINED_FUNCTION_81_4();
        return 0;
      }
      OUTLINED_FUNCTION_81_4();
    }
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED5CFBE0);
  OUTLINED_FUNCTION_15_6();
  v17 = (__n128 *)OUTLINED_FUNCTION_8_22();
  OUTLINED_FUNCTION_96_2(v17, (__n128)xmmword_1B9DEFE80);
  v18 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EF243CC0);
  if ((id)OUTLINED_FUNCTION_33_9(v18))
  {
    OUTLINED_FUNCTION_24_1();
    OUTLINED_FUNCTION_93_0();
    OUTLINED_FUNCTION_11_7();
    OUTLINED_FUNCTION_2_17();
    OUTLINED_FUNCTION_1_11(v35);
    v19 = OUTLINED_FUNCTION_16_1();
    OUTLINED_FUNCTION_1_22(v19);
    OUTLINED_FUNCTION_22_13();
    OUTLINED_FUNCTION_7_1();
    OUTLINED_FUNCTION_9_9();
    OUTLINED_FUNCTION_22_13();
  }
  else
  {
    OUTLINED_FUNCTION_9_8();
    OUTLINED_FUNCTION_2_17();
    OUTLINED_FUNCTION_1_11(v35);
    v27 = OUTLINED_FUNCTION_16_1();
    v28 = OUTLINED_FUNCTION_1_22(v27);
    OUTLINED_FUNCTION_49_7(v28, (uint64_t *)&unk_1ED5CFC00);
  }
  OUTLINED_FUNCTION_25_2();
  OUTLINED_FUNCTION_47_6();
  OUTLINED_FUNCTION_38_0();
  __swift_destroy_boxed_opaque_existential_2((uint64_t)v35);
  v36 = MEMORY[0x1E0DEA968];
  v35[0] = (id)0xD000000000000017;
  v35[1] = (id)0x80000001B9DEAC40;
  v29 = sub_1B9DE18CC();
  OUTLINED_FUNCTION_50_4(v29, (uint64_t *)&unk_1ED5CFC00);
  sub_1B9DB0344();
  swift_bridgeObjectRelease();
  return 1;
}

void sub_1B9DD5120()
{
  char *v0;
  objc_class *ObjectType;
  char *v2;
  char *v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  objc_super v11;

  ObjectType = (objc_class *)swift_getObjectType();
  v2 = &v0[OBJC_IVAR____TtC27AppleMediaServicesUIDynamic9VideoView_isTransitioningToFullscreen];
  swift_beginAccess();
  *v2 = 0;
  v3 = &v0[OBJC_IVAR____TtC27AppleMediaServicesUIDynamic9VideoView_isFullScreen];
  swift_beginAccess();
  objc_msgSend(v0, sel_setUserInteractionEnabled_, (*v3 & 1) == 0);
  v11.receiver = v0;
  v11.super_class = ObjectType;
  v4 = objc_msgSendSuper2(&v11, sel_backgroundColor);
  if (!v4)
    v4 = objc_msgSend((id)objc_opt_self(), sel_ams_placeholderBackground);
  v5 = *(void **)&v0[OBJC_IVAR____TtC27AppleMediaServicesUIDynamic9VideoView_playerViewController];
  if (v5)
  {
    v6 = objc_msgSend(v5, sel_view);
    if (!v6)
    {
      __break(1u);
      return;
    }
    v7 = v6;
    if (*v3 == 1)
      v8 = objc_msgSend((id)objc_opt_self(), sel_clearColor);
    else
      v8 = v4;
    v9 = v8;
    objc_msgSend(v7, sel_setBackgroundColor_, v8);

  }
  sub_1B9DD3DDC();
  if ((*v3 & 1) == 0)
  {
    v10 = *(void **)&v0[OBJC_IVAR____TtC27AppleMediaServicesUIDynamic9VideoView_videoPlayer];
    if (v10)
      objc_msgSend(v10, sel_setMuted_, (v0[OBJC_IVAR____TtC27AppleMediaServicesUIDynamic9VideoView_wasAudioOnPreFullScreen] & 1) == 0);
  }
  sub_1B9DD2280();
  objc_msgSend(v0, sel_setNeedsLayout);

}

void VideoView.isFullScreen.getter()
{
  OUTLINED_FUNCTION_3_5();
  OUTLINED_FUNCTION_13_4();
}

void VideoView.isFullScreen.setter(char a1)
{
  _BYTE *v1;

  OUTLINED_FUNCTION_72_1(OBJC_IVAR____TtC27AppleMediaServicesUIDynamic9VideoView_isFullScreen);
  OUTLINED_FUNCTION_6_5();
  *v1 = a1;
  sub_1B9DD5120();
  OUTLINED_FUNCTION_3_22();
}

void VideoView.isFullScreen.modify(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(a1 + 24) = v1;
  OUTLINED_FUNCTION_6_5();
  OUTLINED_FUNCTION_1();
}

void sub_1B9DD5390()
{
  char v0;

  OUTLINED_FUNCTION_56_5();
  if ((v0 & 1) == 0)
    sub_1B9DD5120();
  OUTLINED_FUNCTION_1();
}

void VideoView.isTransitioningToFullscreen.getter()
{
  OUTLINED_FUNCTION_3_5();
  OUTLINED_FUNCTION_13_4();
}

void VideoView.configuration.getter(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;

  v3 = v1 + OBJC_IVAR____TtC27AppleMediaServicesUIDynamic9VideoView_configuration;
  OUTLINED_FUNCTION_3_5();
  sub_1B9DD752C(v3, a1, (uint64_t (*)(_QWORD))type metadata accessor for VideoConfiguration);
  OUTLINED_FUNCTION_13_4();
}

void VideoView.configuration.setter(uint64_t a1)
{
  uint64_t v1;

  OUTLINED_FUNCTION_72_1(OBJC_IVAR____TtC27AppleMediaServicesUIDynamic9VideoView_configuration);
  OUTLINED_FUNCTION_6_5();
  sub_1B9DD5778(a1, v1);
  swift_endAccess();
  OUTLINED_FUNCTION_74_4();
  sub_1B9D6B30C(a1, (uint64_t (*)(_QWORD))type metadata accessor for VideoConfiguration);
  OUTLINED_FUNCTION_3_22();
}

void VideoView.configuration.modify(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(a1 + 24) = v1;
  OUTLINED_FUNCTION_6_5();
  OUTLINED_FUNCTION_1();
}

void sub_1B9DD54CC()
{
  char v0;

  OUTLINED_FUNCTION_56_5();
  if ((v0 & 1) == 0)
    OUTLINED_FUNCTION_74_4();
  OUTLINED_FUNCTION_1();
}

void sub_1B9DD54F0()
{
  char *v0;
  uint64_t ObjectType;
  uint64_t v2;
  objc_class *v3;
  id v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  objc_super v16;

  ObjectType = swift_getObjectType();
  v2 = OBJC_IVAR____TtC27AppleMediaServicesUIDynamic9VideoView_playerViewController;
  if (!*(_QWORD *)&v0[OBJC_IVAR____TtC27AppleMediaServicesUIDynamic9VideoView_playerViewController])
  {
    v3 = (objc_class *)ObjectType;
    v4 = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for DynamicVideoPlayerViewController()), sel_init);
    objc_msgSend(v4, sel_setShowsPlaybackControls_, 0);
    objc_msgSend(v4, sel_setUpdatesNowPlayingInfoCenter_, 0);
    objc_msgSend(v4, sel_setCanPausePlaybackWhenExitingFullScreen_, 0);
    objc_msgSend(v4, sel_setPreferredUnobscuredArea_, *(_QWORD *)&v0[OBJC_IVAR____TtC27AppleMediaServicesUIDynamic9VideoView_preferredUnobscuredArea]);
    objc_msgSend(v4, sel_setShowsMinimalPlaybackControlsWhenEmbeddedInline_, 1);
    objc_msgSend(v4, sel_setDelegate_, v0);
    v5 = objc_msgSend(v4, sel_view);
    if (v5)
    {
      v6 = v5;
      objc_msgSend(v5, sel_setClipsToBounds_, 1);

      v7 = objc_msgSend(v4, sel_view);
      if (v7)
      {
        v8 = v7;
        v16.receiver = v0;
        v16.super_class = v3;
        v9 = objc_msgSendSuper2(&v16, sel_backgroundColor);
        if (!v9)
          v9 = objc_msgSend((id)objc_opt_self(), sel_ams_placeholderBackground);
        objc_msgSend(v8, sel_setBackgroundColor_, v9);

        objc_msgSend(v4, sel_setModalPresentationStyle_, 5);
        objc_msgSend(v4, sel_setCanToggleVideoGravityWhenEmbeddedInline_, 0);
        v10 = objc_msgSend(v4, sel_view);
        if (v10)
        {
          v11 = v10;
          objc_msgSend(v0, sel_bounds);
          objc_msgSend(v11, sel_setFrame_);

          if (*(_QWORD *)&v0[OBJC_IVAR____TtC27AppleMediaServicesUIDynamic9VideoView_videoPlayer])
            objc_msgSend(v4, sel_setPlayer_);
          v12 = objc_msgSend(v4, sel_view);
          if (v12)
          {
            v13 = v12;
            objc_msgSend(v0, sel_insertSubview_atIndex_, v12, 0);

            v14 = *(void **)&v0[v2];
            *(_QWORD *)&v0[v2] = v4;
            v15 = v4;

            sub_1B9DD3DDC();
            return;
          }
LABEL_15:
          __break(1u);
          return;
        }
LABEL_14:
        __break(1u);
        goto LABEL_15;
      }
    }
    else
    {
      __break(1u);
    }
    __break(1u);
    goto LABEL_14;
  }
}

uint64_t sub_1B9DD5778(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for VideoConfiguration();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 24))(a2, a1, v4);
  return a2;
}

Swift::Void __swiftcall VideoView.releaseAssets(now:)(Swift::Bool now)
{
  uint64_t v1;
  void *v2;
  id v3;

  if (now)
  {
    v2 = *(void **)(v1 + OBJC_IVAR____TtC27AppleMediaServicesUIDynamic9VideoView_videoPlayer);
    if (v2)
    {
      v3 = v2;
      VideoPlayer.releaseAssets()();
      OUTLINED_FUNCTION_36_3(v3);
      return;
    }
  }
  else
  {
    *(_BYTE *)(v1 + OBJC_IVAR____TtC27AppleMediaServicesUIDynamic9VideoView_releaseAssetsAtNextPauseState) = 1;
  }
  OUTLINED_FUNCTION_84();
}

void OUTLINED_FUNCTION_74_4()
{
  sub_1B9DD3DDC();
}

Swift::Void __swiftcall VideoView.layoutSubviews()()
{
  char *v0;
  char *v1;
  double width;
  double height;
  double MaxX;
  double MaxY;
  void *v6;
  id v7;
  void *v8;
  double v9;
  id v10;
  SEL v11;
  double v12;
  double v13;
  char *v14;
  double *v15;
  uint64_t v17;
  uint64_t v18;
  double v19;
  double v20;
  double *v21;
  objc_super v22;
  CGRect v23;
  CGRect v24;

  v1 = v0;
  v22.receiver = v0;
  v22.super_class = (Class)OUTLINED_FUNCTION_11_4();
  objc_msgSendSuper2(&v22, sel_layoutSubviews);
  objc_msgSend(v0, sel_bounds);
  width = v23.size.width;
  height = v23.size.height;
  MaxX = CGRectGetMaxX(v23);
  v24.origin.x = OUTLINED_FUNCTION_75_3();
  MaxY = CGRectGetMaxY(v24);
  v6 = *(void **)&v0[OBJC_IVAR____TtC27AppleMediaServicesUIDynamic9VideoView_playerViewController];
  if (v6)
  {
    v7 = objc_msgSend(v6, sel_view);
    if (!v7)
    {
      __break(1u);
      return;
    }
    v8 = v7;
    v9 = OUTLINED_FUNCTION_75_3();
    objc_msgSend(v10, v11, v9);

  }
  v12 = MaxX * 0.5;
  v13 = MaxY * 0.5;
  v14 = *(char **)&v1[OBJC_IVAR____TtC27AppleMediaServicesUIDynamic9VideoView_previewFrameArtwork];
  objc_msgSend(v14, sel_frame);
  objc_msgSend(v14, sel_setFrame_);
  v15 = (double *)&v14[OBJC_IVAR____TtC27AppleMediaServicesUIDynamic16ArtworkImageView_artworkSize];
  OUTLINED_FUNCTION_6_5();
  if (*v15 != width || v15[1] != height)
  {
    *v15 = width;
    v15[1] = height;
    v17 = *(_QWORD *)&v1[OBJC_IVAR____TtC27AppleMediaServicesUIDynamic9VideoView_video];
    if (v17)
    {
      if (*(_QWORD *)(v17 + OBJC_IVAR____TtC27AppleMediaServicesUIDynamic5Video_preview))
      {
        OUTLINED_FUNCTION_3_5();
        if (swift_weakLoadStrong())
        {
          swift_retain();
          ArtworkImageView.apply(artwork:asPartOf:)();
          swift_release();
          OUTLINED_FUNCTION_12_11();
        }
      }
    }
  }
  objc_msgSend(v14, sel_setCenter_, v12, MaxY * 0.5);
  v18 = OBJC_IVAR____TtC27AppleMediaServicesUIDynamic9VideoView_playButton;
  objc_msgSend(*(id *)&v1[OBJC_IVAR____TtC27AppleMediaServicesUIDynamic9VideoView_playButton], sel_sizeThatFits_, width, height);
  v21 = (double *)&v1[OBJC_IVAR____TtC27AppleMediaServicesUIDynamic9VideoView_prominentPlayButtonLocationOverride];
  if ((v1[OBJC_IVAR____TtC27AppleMediaServicesUIDynamic9VideoView_prominentPlayButtonLocationOverride + 16] & 1) == 0)
  {
    v12 = *v21;
    v13 = v21[1];
  }
  objc_msgSend(*(id *)&v1[v18], sel_setFrame_, v12 - v19 * 0.5, v13 - v20 * 0.5);
}

uint64_t sub_1B9DD5AB0()
{
  uint64_t v0;
  uint64_t v1;
  char v2;
  _QWORD *v3;
  uint64_t (*v4)();
  unsigned __int8 v5;
  void *v6;
  id v7;
  void *v8;
  char v9;
  _BYTE *v10;

  v1 = OBJC_IVAR____TtC27AppleMediaServicesUIDynamic9VideoView_releaseAssetsAtNextPauseState;
  if (*(_BYTE *)(v0 + OBJC_IVAR____TtC27AppleMediaServicesUIDynamic9VideoView_releaseAssetsAtNextPauseState) == 1
    && (VideoView.state.getter(), v2 == 4))
  {
    *(_BYTE *)(v0 + v1) = 0;
    v3 = (_QWORD *)swift_allocObject();
    swift_unknownObjectWeakInit();
    v4 = (uint64_t (*)())sub_1B9DD8E44;
  }
  else
  {
    v4 = 0;
    v3 = 0;
  }
  v5 = VideoView.isPlaying.getter();
  v6 = *(void **)(v0 + OBJC_IVAR____TtC27AppleMediaServicesUIDynamic9VideoView_videoPlayer);
  if (v6 && (v7 = objc_msgSend(v6, sel_currentItem)) != 0)
  {
    v8 = v7;
    objc_msgSend(v7, sel_currentTime);
    sub_1B9DE255C();
    v9 = sub_1B9DE2550();

  }
  else
  {
    v9 = 1;
  }
  v10 = (_BYTE *)(v0 + OBJC_IVAR____TtC27AppleMediaServicesUIDynamic9VideoView_isFullScreen);
  swift_beginAccess();
  sub_1B9DD5CB4(v9 & ~(*v10 | v5) & 1, *(_BYTE *)(v0 + OBJC_IVAR____TtC27AppleMediaServicesUIDynamic9VideoView_animatePreviewFrameTransitions), v4, v3);
  sub_1B9DD627C(((*v10 | v5) & 1) == 0);
  return sub_1B9D63180((uint64_t)v4);
}

void sub_1B9DD5C40(char a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  id v6;

  if ((a1 & 1) != 0)
  {
    v2 = a2 + 16;
    swift_beginAccess();
    v3 = MEMORY[0x1BCCCEFF8](v2);
    if (v3)
    {
      v4 = (void *)v3;
      v5 = *(void **)(v3 + OBJC_IVAR____TtC27AppleMediaServicesUIDynamic9VideoView_videoPlayer);
      if (v5)
      {
        v6 = v5;

        VideoPlayer.releaseAssets()();
        v4 = v6;
      }

    }
  }
}

void sub_1B9DD5CB4(char a1, char a2, uint64_t (*a3)(), _QWORD *a4)
{
  void *v4;
  double v5;
  double v6;
  uint64_t v7;
  void *ObjectType;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  unint64_t v16;
  id v17;
  id v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t DynamicType;
  uint64_t v24;
  uint64_t (*v25)(uint64_t);
  char v26;
  uint64_t v27;
  void *v28;
  _QWORD *v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  id v33;
  void *v34;
  uint64_t v35;
  void *v36;
  _QWORD *v37;
  uint64_t aBlock;
  unint64_t v41;
  void *v42;
  void *v43;
  uint64_t (*v44)();
  _QWORD *v45;
  _QWORD v46[3];
  uint64_t MetatypeMetadata;

  ObjectType = (void *)swift_getObjectType();
  v11 = sub_1B9DE18B4();
  MEMORY[0x1E0C80A78](v11);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED5CFBE0);
  v12 = *(_QWORD *)(sub_1B9DE18FC() - 8);
  v13 = *(_QWORD *)(v12 + 72);
  v14 = (*(unsigned __int8 *)(v12 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v12 + 80);
  v15 = swift_allocObject();
  *(_OWORD *)(v15 + 16) = xmmword_1B9DEFC60;
  v16 = v15 + v14;
  v43 = ObjectType;
  aBlock = (uint64_t)v4;
  v17 = v4;
  v18 = (id)AMSLogKey();
  if (v18)
  {
    v19 = v18;
    v20 = sub_1B9DE2160();
    v22 = v21;

    sub_1B9DE18A8();
    sub_1B9DE189C();
    __swift_project_boxed_opaque_existential_2(&aBlock, (uint64_t)v43);
    DynamicType = swift_getDynamicType();
    MetatypeMetadata = swift_getMetatypeMetadata();
    v46[0] = DynamicType;
    sub_1B9DE1884();
    sub_1B9D6B278((uint64_t)v46, (uint64_t *)&unk_1ED5CFC00);
    sub_1B9DE189C();
    MetatypeMetadata = MEMORY[0x1E0DEA968];
    v46[0] = v20;
    v46[1] = v22;
  }
  else
  {
    sub_1B9DE18A8();
    sub_1B9DE189C();
    __swift_project_boxed_opaque_existential_2(&aBlock, (uint64_t)v43);
    v24 = swift_getDynamicType();
    MetatypeMetadata = swift_getMetatypeMetadata();
    v46[0] = v24;
  }
  sub_1B9DE1884();
  sub_1B9D6B278((uint64_t)v46, (uint64_t *)&unk_1ED5CFC00);
  sub_1B9DE189C();
  sub_1B9DE18C0();
  __swift_destroy_boxed_opaque_existential_2((uint64_t)&aBlock);
  sub_1B9DE1860();
  aBlock = 0x6D617246776F6873;
  v41 = 0xEB00000000203A65;
  type metadata accessor for Log();
  v25 = (uint64_t (*)(uint64_t))(v16 + 2 * v13);
  sub_1B9DE21E4();
  swift_bridgeObjectRelease();
  v43 = (void *)MEMORY[0x1E0DEA968];
  sub_1B9DE18CC();
  sub_1B9D6B278((uint64_t)&aBlock, (uint64_t *)&unk_1ED5CFC00);
  sub_1B9DB0344();
  swift_bridgeObjectRelease();
  if ((a2 & 1) == 0)
  {
    v31 = objc_opt_self();
    v32 = swift_allocObject();
    *(_QWORD *)(v32 + 16) = v17;
    *(_BYTE *)(v32 + 24) = a1 & 1;
    v29 = (_QWORD *)swift_allocObject();
    v29[2] = sub_1B9DD8E74;
    v29[3] = v32;
    v44 = (uint64_t (*)())sub_1B9D7C2F8;
    v45 = v29;
    aBlock = MEMORY[0x1E0C809B0];
    v41 = 1107296256;
    v42 = sub_1B9DD647C;
    v43 = &block_descriptor_30_0;
    v28 = _Block_copy(&aBlock);
    v26 = (char)v45;
    v33 = v17;
    swift_retain();
    swift_release();
    objc_msgSend((id)v31, sel_performWithoutAnimation_, v28);
    _Block_release(v28);
    LOBYTE(v31) = swift_isEscapingClosureAtFileLocation();
    swift_release();
    swift_release();
    if ((v31 & 1) == 0)
      return;
    __break(1u);
    goto LABEL_12;
  }
  v26 = a1 & 1;
  v5 = 0.2;
  if ((a1 & 1) != 0)
    v6 = 0.2;
  else
    v6 = 0.5;
  v27 = swift_allocObject();
  *(_QWORD *)(v27 + 16) = v17;
  *(_BYTE *)(v27 + 24) = v26;
  v44 = (uint64_t (*)())sub_1B9DD8E90;
  v45 = (_QWORD *)v27;
  v15 = MEMORY[0x1E0C809B0];
  aBlock = MEMORY[0x1E0C809B0];
  v7 = 1107296256;
  v41 = 1107296256;
  v25 = sub_1B9D49458;
  v42 = sub_1B9D49458;
  v43 = &block_descriptor_36;
  v28 = _Block_copy(&aBlock);
  v29 = v17;
  swift_release();
  if (!a3)
  {
LABEL_12:
    v30 = 0;
    goto LABEL_13;
  }
  v44 = a3;
  v45 = a4;
  aBlock = v15;
  v41 = 1107296256;
  v42 = sub_1B9DC6DBC;
  v43 = &block_descriptor_45;
  v30 = _Block_copy(&aBlock);
  swift_retain();
  swift_release();
LABEL_13:
  v34 = (void *)objc_opt_self();
  objc_msgSend(v34, sel_animateWithDuration_delay_options_animations_completion_, 4, v28, v30, v6, 0.0);
  _Block_release(v30);
  _Block_release(v28);
  v35 = swift_allocObject();
  *(_QWORD *)(v35 + 16) = v29;
  *(_BYTE *)(v35 + 24) = v26;
  v44 = sub_1B9DD8E70;
  v45 = (_QWORD *)v35;
  aBlock = v15;
  v41 = v7;
  v42 = v25;
  v43 = &block_descriptor_42_0;
  v36 = _Block_copy(&aBlock);
  v37 = v29;
  swift_release();
  objc_msgSend(v34, sel_animateWithDuration_delay_options_animations_completion_, 4, v36, 0, v5, 0.0);
  _Block_release(v36);
}

void sub_1B9DD627C(char a1)
{
  void *v1;
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;
  _QWORD v7[6];

  v3 = (void *)objc_opt_self();
  v4 = swift_allocObject();
  *(_QWORD *)(v4 + 16) = v1;
  *(_BYTE *)(v4 + 24) = a1;
  v7[4] = sub_1B9DD8E70;
  v7[5] = v4;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 1107296256;
  v7[2] = sub_1B9D49458;
  v7[3] = &block_descriptor_21_0;
  v5 = _Block_copy(v7);
  v6 = v1;
  swift_release();
  objc_msgSend(v3, sel_animateWithDuration_delay_options_animations_completion_, 4, v5, 0, 0.2, 0.0);
  _Block_release(v5);
}

id sub_1B9DD6358(uint64_t a1, char a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t ObjectType;
  double v7;

  v4 = a1 + OBJC_IVAR____TtC27AppleMediaServicesUIDynamic9VideoView_videoPlayerDelegate;
  if (MEMORY[0x1BCCCEFF8](a1 + OBJC_IVAR____TtC27AppleMediaServicesUIDynamic9VideoView_videoPlayerDelegate))
  {
    v5 = *(_QWORD *)(v4 + 8);
    ObjectType = swift_getObjectType();
    (*(void (**)(_QWORD, uint64_t, uint64_t))(v5 + 16))(a2 & 1, ObjectType, v5);
    swift_unknownObjectRelease();
  }
  v7 = 0.0;
  if ((a2 & 1) != 0)
    v7 = 1.0;
  return objc_msgSend(*(id *)(a1 + OBJC_IVAR____TtC27AppleMediaServicesUIDynamic9VideoView_previewFrameArtwork), sel_setAlpha_, v7);
}

void sub_1B9DD63E4(uint64_t a1, char a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t ObjectType;
  double v7;

  v4 = a1 + OBJC_IVAR____TtC27AppleMediaServicesUIDynamic9VideoView_videoPlayerDelegate;
  if (MEMORY[0x1BCCCEFF8](a1 + OBJC_IVAR____TtC27AppleMediaServicesUIDynamic9VideoView_videoPlayerDelegate))
  {
    v5 = *(_QWORD *)(v4 + 8);
    ObjectType = swift_getObjectType();
    (*(void (**)(_QWORD, uint64_t, uint64_t))(v5 + 16))(a2 & 1, ObjectType, v5);
    swift_unknownObjectRelease();
  }
  v7 = 0.0;
  if ((a2 & 1) != 0)
    v7 = 1.0;
  objc_msgSend(*(id *)(a1 + OBJC_IVAR____TtC27AppleMediaServicesUIDynamic9VideoView_previewFrameArtwork), sel_setAlpha_, v7);
  VideoView.layoutSubviews()();
}

uint64_t sub_1B9DD647C(uint64_t a1)
{
  return (*(uint64_t (**)(void))(a1 + 32))();
}

id sub_1B9DD649C()
{
  char *v0;
  uint64_t ObjectType;
  uint64_t v2;
  char *v3;
  __objc2_class **p_superclass;
  void *v5;
  char v6;
  uint64_t v7;
  void *v8;
  char *v9;
  void *v10;
  char *v11;
  id v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t DynamicType;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  unsigned __int8 v22;
  _QWORD v24[3];
  uint64_t MetatypeMetadata;
  unint64_t v26;
  unint64_t v27;
  uint64_t v28;

  ObjectType = swift_getObjectType();
  v2 = sub_1B9DE18B4();
  MEMORY[0x1E0C80A78](v2);
  v3 = &v0[OBJC_IVAR____TtC27AppleMediaServicesUIDynamic9VideoView_isFullScreen];
  swift_beginAccess();
  p_superclass = &OBJC_METACLASS____TtC27AppleMediaServicesUIDynamic32DynamicVideoPlayerViewController.superclass;
  if (*v3 == 1)
  {
    v5 = *(void **)&v0[OBJC_IVAR____TtC27AppleMediaServicesUIDynamic9VideoView_playerViewController];
    if (v5)
      objc_msgSend(v5, sel_setShowsPlaybackControls_, 1);
  }
  else
  {
    v6 = VideoView.isPlaying.getter();
    v7 = OBJC_IVAR____TtC27AppleMediaServicesUIDynamic9VideoView_playerViewController;
    v8 = *(void **)&v0[OBJC_IVAR____TtC27AppleMediaServicesUIDynamic9VideoView_playerViewController];
    if ((v6 & 1) != 0)
    {
      if (v8)
      {
        v9 = &v0[OBJC_IVAR____TtC27AppleMediaServicesUIDynamic9VideoView_configuration];
        swift_beginAccess();
        objc_msgSend(v8, sel_setShowsPlaybackControls_, (*(_QWORD *)&v9[*(int *)(type metadata accessor for VideoConfiguration() + 24)] & 0xELL) != 0);
        v10 = *(void **)&v0[v7];
        if (v10)
          objc_msgSend(v10, sel_flashPlaybackControlsWithDuration_, 5.0);
      }
    }
    else if (v8)
    {
      objc_msgSend(*(id *)&v0[OBJC_IVAR____TtC27AppleMediaServicesUIDynamic9VideoView_playerViewController], sel_setShowsPlaybackControls_, 0);
    }
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED5CFBE0);
  sub_1B9DE18FC();
  *(_OWORD *)(swift_allocObject() + 16) = xmmword_1B9DEFE80;
  v28 = ObjectType;
  v26 = (unint64_t)v0;
  v11 = v0;
  v12 = (id)AMSLogKey();
  v13 = MEMORY[0x1E0DEA968];
  if (v12)
  {
    v14 = v12;
    v15 = sub_1B9DE2160();
    v17 = v16;

    sub_1B9DE18A8();
    sub_1B9DE189C();
    __swift_project_boxed_opaque_existential_2(&v26, v28);
    DynamicType = swift_getDynamicType();
    MetatypeMetadata = swift_getMetatypeMetadata();
    v24[0] = DynamicType;
    sub_1B9DE1884();
    sub_1B9D6B278((uint64_t)v24, (uint64_t *)&unk_1ED5CFC00);
    sub_1B9DE189C();
    v19 = v13;
    MetatypeMetadata = v13;
    v24[0] = v15;
    v24[1] = v17;
    p_superclass = (__objc2_class **)(&OBJC_METACLASS____TtC27AppleMediaServicesUIDynamic32DynamicVideoPlayerViewController
                                    + 8);
  }
  else
  {
    v19 = MEMORY[0x1E0DEA968];
    sub_1B9DE18A8();
    sub_1B9DE189C();
    __swift_project_boxed_opaque_existential_2(&v26, v28);
    v20 = swift_getDynamicType();
    MetatypeMetadata = swift_getMetatypeMetadata();
    v24[0] = v20;
  }
  sub_1B9DE1884();
  sub_1B9D6B278((uint64_t)v24, (uint64_t *)&unk_1ED5CFC00);
  sub_1B9DE189C();
  sub_1B9DE18C0();
  __swift_destroy_boxed_opaque_existential_2((uint64_t)&v26);
  v26 = 0;
  v27 = 0xE000000000000000;
  sub_1B9DE2724();
  swift_bridgeObjectRelease();
  v26 = 0xD00000000000002ALL;
  v27 = 0x80000001B9DEB150;
  v21 = *(__objc2_class **)((char *)&p_superclass[403]->isa + (_QWORD)v11);
  if (v21)
    v22 = objc_msgSend(v21, sel_showsPlaybackControls);
  else
    v22 = 2;
  type metadata accessor for Log();
  LOBYTE(v24[0]) = v22;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EF243E40);
  sub_1B9DE219C();
  sub_1B9DE21E4();
  swift_bridgeObjectRelease();
  v28 = v19;
  sub_1B9DE18CC();
  sub_1B9D6B278((uint64_t)&v26, (uint64_t *)&unk_1ED5CFC00);
  sub_1B9DB0344();
  swift_bridgeObjectRelease();
  return objc_msgSend(v11, sel_accessibilityUpdatePlayerControllerControls);
}

void VideoView.prefersMinimalPlaybackControls.getter()
{
  OUTLINED_FUNCTION_3_5();
  OUTLINED_FUNCTION_13_4();
}

void VideoView.prefersMinimalPlaybackControls.setter(char a1)
{
  uint64_t v1;
  _BYTE *v3;

  v3 = (_BYTE *)(v1 + OBJC_IVAR____TtC27AppleMediaServicesUIDynamic9VideoView_prefersMinimalPlaybackControls);
  OUTLINED_FUNCTION_6_5();
  *v3 = a1;
  OUTLINED_FUNCTION_13_4();
}

void VideoView.prefersMinimalPlaybackControls.modify()
{
  OUTLINED_FUNCTION_6_5();
  OUTLINED_FUNCTION_1();
}

void sub_1B9DD6954(uint64_t a1)
{
  id v1;

  OUTLINED_FUNCTION_3_11(a1, &qword_1EF243E38);
  v1 = (id)*MEMORY[0x1E0C89748];
  sub_1B9DD69C4();
  OUTLINED_FUNCTION_36_3(v1);
}

void sub_1B9DD69C4()
{
  void *v0;
  void *v1;
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
  void *v12;
  id v13;
  id v14;
  uint64_t v15;
  uint64_t v16;

  OUTLINED_FUNCTION_54_0();
  v3 = v2;
  v5 = v4;
  v7 = v6;
  v16 = *(_QWORD *)(OUTLINED_FUNCTION_60_4() - 8);
  OUTLINED_FUNCTION_23_0();
  MEMORY[0x1E0C80A78](v8);
  v9 = OUTLINED_FUNCTION_1_5();
  v10 = *(_QWORD *)(v9 - 8);
  MEMORY[0x1E0C80A78](v9);
  OUTLINED_FUNCTION_0_6();
  if (qword_1EF2420E8 != -1)
    swift_once();
  v11 = (_QWORD *)OUTLINED_FUNCTION_7_7();
  v11[2] = v5;
  v11[3] = v3;
  v11[4] = v1;
  v11[5] = v0;
  v11[6] = v7;
  v12 = OUTLINED_FUNCTION_75_0();
  sub_1B9D63190(v5);
  v13 = v1;
  v14 = v0;
  OUTLINED_FUNCTION_46_0();
  sub_1B9D42DA0((unint64_t *)&qword_1ED5CF9C0, (uint64_t (*)(uint64_t))MEMORY[0x1E0DEF4F8], MEMORY[0x1E0DEF510]);
  OUTLINED_FUNCTION_29_1();
  OUTLINED_FUNCTION_106_1((unint64_t *)&qword_1ED5CFAE0);
  OUTLINED_FUNCTION_59_6();
  v15 = OUTLINED_FUNCTION_52();
  MEMORY[0x1BCCCE2A8](v15);
  _Block_release(v12);
  OUTLINED_FUNCTION_13_16(v16);
  OUTLINED_FUNCTION_66_0(*(uint64_t (**)(uint64_t, uint64_t))(v10 + 8));
  swift_release();
  OUTLINED_FUNCTION_2_5();
}

void sub_1B9DD6BA4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;

  OUTLINED_FUNCTION_54_0();
  v8 = *(_QWORD *)(OUTLINED_FUNCTION_60_4() - 8);
  OUTLINED_FUNCTION_23_0();
  MEMORY[0x1E0C80A78](v2);
  v3 = OUTLINED_FUNCTION_1_5();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x1E0C80A78](v3);
  OUTLINED_FUNCTION_0_6();
  if (qword_1EF2420E8 != -1)
    swift_once();
  v5 = OUTLINED_FUNCTION_7_7();
  *(_QWORD *)(v5 + 16) = v1;
  *(_QWORD *)(v5 + 24) = v0;
  v6 = OUTLINED_FUNCTION_75_0();
  sub_1B9D63190(v1);
  OUTLINED_FUNCTION_46_0();
  sub_1B9D42DA0((unint64_t *)&qword_1ED5CF9C0, (uint64_t (*)(uint64_t))MEMORY[0x1E0DEF4F8], MEMORY[0x1E0DEF510]);
  OUTLINED_FUNCTION_29_1();
  OUTLINED_FUNCTION_106_1((unint64_t *)&qword_1ED5CFAE0);
  OUTLINED_FUNCTION_59_6();
  v7 = OUTLINED_FUNCTION_52();
  MEMORY[0x1BCCCE2A8](v7);
  _Block_release(v6);
  OUTLINED_FUNCTION_13_16(v8);
  OUTLINED_FUNCTION_66_0(*(uint64_t (**)(uint64_t, uint64_t))(v4 + 8));
  swift_release();
  OUTLINED_FUNCTION_2_5();
}

char *sub_1B9DD6D2C(char *result, double a2, double a3)
{
  id *v5;

  if (result)
  {
    v5 = (id *)&result[OBJC_IVAR____TtC27AppleMediaServicesUIDynamic11VideoPlayer_playerItem];
    swift_beginAccess();
    return (char *)objc_msgSend(*v5, sel_setPreferredMaximumResolution_, a2, a3);
  }
  return result;
}

void VideoView.videoDidChangeState(to:videoPlayer:)()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  __n128 *v5;
  char *v6;
  id v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t ObjectType;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;

  OUTLINED_FUNCTION_54_0();
  v2 = v1;
  v3 = OUTLINED_FUNCTION_11_4();
  OUTLINED_FUNCTION_31_1();
  OUTLINED_FUNCTION_39();
  MEMORY[0x1E0C80A78](v4);
  OUTLINED_FUNCTION_2_2();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED5CFBE0);
  sub_1B9DE18FC();
  v5 = (__n128 *)swift_allocObject();
  OUTLINED_FUNCTION_96_2(v5, (__n128)xmmword_1B9DEFE80);
  v17 = v3;
  v15 = (uint64_t)v0;
  v6 = v0;
  v7 = (id)AMSLogKey();
  v8 = MEMORY[0x1E0DEA968];
  if (v7)
  {
    v9 = v7;
    sub_1B9DE2160();

    OUTLINED_FUNCTION_11_7();
    OUTLINED_FUNCTION_0_3();
    __swift_project_boxed_opaque_existential_2(&v15, v17);
    swift_getDynamicType();
    swift_getMetatypeMetadata();
    OUTLINED_FUNCTION_9_9();
    OUTLINED_FUNCTION_31_5();
    OUTLINED_FUNCTION_7_1();
    OUTLINED_FUNCTION_9_9();
    OUTLINED_FUNCTION_31_5();
  }
  else
  {
    OUTLINED_FUNCTION_9_8();
    OUTLINED_FUNCTION_0_3();
    __swift_project_boxed_opaque_existential_2(&v15, v17);
    swift_getDynamicType();
    swift_getMetatypeMetadata();
    v10 = OUTLINED_FUNCTION_9_9();
    OUTLINED_FUNCTION_49_7(v10, (uint64_t *)&unk_1ED5CFC00);
  }
  sub_1B9DE189C();
  sub_1B9DE18C0();
  OUTLINED_FUNCTION_38_0();
  OUTLINED_FUNCTION_150();
  v15 = 0;
  v16 = 0xE000000000000000;
  sub_1B9DE2724();
  swift_bridgeObjectRelease();
  v15 = 0x6863206574617453;
  v16 = 0xEF203A6465676E61;
  sub_1B9DE219C();
  sub_1B9DE21E4();
  swift_bridgeObjectRelease();
  v17 = v8;
  v11 = sub_1B9DE18CC();
  OUTLINED_FUNCTION_50_4(v11, (uint64_t *)&unk_1ED5CFC00);
  sub_1B9DB0344();
  swift_bridgeObjectRelease();
  v12 = &v6[OBJC_IVAR____TtC27AppleMediaServicesUIDynamic9VideoView_delegate];
  OUTLINED_FUNCTION_3_5();
  if (MEMORY[0x1BCCCEFF8](v12))
  {
    v13 = *((_QWORD *)v12 + 1);
    ObjectType = swift_getObjectType();
    (*(void (**)(uint64_t, char *, _UNKNOWN **, uint64_t, uint64_t))(v13 + 8))(v2, v6, &protocol witness table for VideoView, ObjectType, v13);
    OUTLINED_FUNCTION_14_6();
  }
  sub_1B9DD649C();
  sub_1B9DD5AB0();
  OUTLINED_FUNCTION_2_5();
}

Swift::Void __swiftcall VideoView.playbackWillEnd(in:)(Swift::Double in)
{
  OUTLINED_FUNCTION_72_1(OBJC_IVAR____TtC27AppleMediaServicesUIDynamic9VideoView_delegate);
  OUTLINED_FUNCTION_3_5();
  OUTLINED_FUNCTION_82_2();
}

uint64_t sub_1B9DD7070(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;
  double v3;
  uint64_t v4;

  if (result)
  {
    v4 = OUTLINED_FUNCTION_92_2();
    (*(void (**)(uint64_t, _UNKNOWN **, uint64_t, uint64_t, double))(v2 + 16))(v1, &protocol witness table for VideoView, v4, v2, v3);
    return OUTLINED_FUNCTION_80_2();
  }
  return result;
}

void VideoView.videoDidPlayToEnd(videoPlayer:)()
{
  OUTLINED_FUNCTION_3_5();
  OUTLINED_FUNCTION_82_2();
}

void sub_1B9DD70F4(uint64_t a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t aBlock, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, char a16, uint64_t a17, uint64_t a18, char a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32)
{
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  _BYTE *v37;
  void *v38;
  uint64_t v39;
  void *v40;
  id v41;
  _QWORD v42[23];

  if (a1)
  {
    v34 = OUTLINED_FUNCTION_92_2();
    v35 = v32 + OBJC_IVAR____TtC27AppleMediaServicesUIDynamic9VideoView_configuration;
    OUTLINED_FUNCTION_3_5();
    v36 = OUTLINED_FUNCTION_0_64();
    (*(void (**)(_QWORD, uint64_t, _UNKNOWN **, uint64_t, uint64_t))(v33 + 24))(*(unsigned __int8 *)(v35 + *(int *)(v36 + 40)), v32, &protocol witness table for VideoView, v34, v33);
    OUTLINED_FUNCTION_14_6();
  }
  v37 = (_BYTE *)(v32 + OBJC_IVAR____TtC27AppleMediaServicesUIDynamic9VideoView_isFullScreen);
  OUTLINED_FUNCTION_3_5();
  if (*v37 == 1)
  {
    v38 = *(void **)(v32 + OBJC_IVAR____TtC27AppleMediaServicesUIDynamic9VideoView_playerViewController);
    if (v38)
    {
      v39 = OUTLINED_FUNCTION_7_7();
      OUTLINED_FUNCTION_131();
      v42[4] = sub_1B9DD7298;
      v42[5] = v39;
      v42[0] = MEMORY[0x1E0C809B0];
      v42[1] = 1107296256;
      v42[2] = sub_1B9DD72A0;
      v42[3] = &block_descriptor_19;
      v40 = _Block_copy(v42);
      v41 = v38;
      OUTLINED_FUNCTION_44_0();
      objc_msgSend(v41, sel_exitFullScreenAnimated_completionHandler_, 1, v40);
      _Block_release(v40);

    }
  }
}

void sub_1B9DD7224(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  _BYTE *v6;

  v3 = a3 + 16;
  swift_beginAccess();
  v4 = MEMORY[0x1BCCCEFF8](v3);
  if (v4)
  {
    v5 = (void *)v4;
    v6 = (_BYTE *)(v4 + OBJC_IVAR____TtC27AppleMediaServicesUIDynamic9VideoView_isFullScreen);
    swift_beginAccess();
    *v6 = 0;
    sub_1B9DD5120();

  }
}

void sub_1B9DD7298(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  sub_1B9DD7224(a1, a2, v2);
}

void sub_1B9DD72A0(uint64_t a1, uint64_t a2, void *a3)
{
  void (*v5)(uint64_t, void *);
  id v6;

  v5 = *(void (**)(uint64_t, void *))(a1 + 32);
  swift_retain();
  v6 = a3;
  v5(a2, a3);
  swift_release();

}

uint64_t block_copy_helper_19(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_19()
{
  return swift_release();
}

void VideoView.handleVideoPlaybackFailure(_:)(uint64_t a1)
{
  void **v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t (*v5)(_QWORD);
  void *v6;
  id v7;
  void *v8;
  uint64_t inited;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  uint64_t v15;

  type metadata accessor for VideoPlaybackFailure(0);
  OUTLINED_FUNCTION_39();
  MEMORY[0x1E0C80A78](v4);
  OUTLINED_FUNCTION_18_9();
  sub_1B9DD752C(a1, (uint64_t)v1, v5);
  if (swift_getEnumCaseMultiPayload() == 3)
  {
    v6 = *v1;
    v7 = objc_msgSend((id)objc_opt_self(), sel_defaultCenter);
    v8 = (void *)sub_1B9DE213C();
    __swift_instantiateConcreteTypeFromMangledName(&qword_1ED5CD880);
    inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_1B9DEFE80;
    v10 = MEMORY[0x1E0DEA968];
    OUTLINED_FUNCTION_105_0();
    v11 = (uint64_t *)(v2 + OBJC_IVAR____TtC27AppleMediaServicesUIDynamic9VideoView_playbackId);
    OUTLINED_FUNCTION_3_5();
    v13 = *v11;
    v12 = v11[1];
    *(_QWORD *)(inited + 96) = v10;
    *(_QWORD *)(inited + 72) = v13;
    *(_QWORD *)(inited + 80) = v12;
    swift_bridgeObjectRetain();
    OUTLINED_FUNCTION_105_0();
    *(_QWORD *)(inited + 168) = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF243CE8);
    *(_QWORD *)(inited + 144) = v6;
    v14 = v6;
    v15 = sub_1B9DE20B8();
    sub_1B9DD87FC((uint64_t)v8, 0, v15, v7);

  }
  else
  {
    sub_1B9D6B30C((uint64_t)v1, type metadata accessor for VideoPlaybackFailure);
  }
}

void sub_1B9DD752C(uint64_t a1, uint64_t a2, uint64_t (*a3)(_QWORD))
{
  uint64_t v3;

  v3 = a3(0);
  OUTLINED_FUNCTION_39_9(v3);
  OUTLINED_FUNCTION_1();
}

void VideoView.touchesBegan(_:with:)(uint64_t a1, uint64_t a2)
{
  char *v2;
  char *v3;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;
  id v14;
  void *v15;
  char *v16;
  id v17;
  uint64_t v18;
  id v19;
  void *v20;
  uint64_t v21;
  void *v22;
  objc_super *v23;
  _QWORD v24[2];
  _QWORD v25[2];
  _QWORD v26[2];

  v3 = v2;
  v5 = OUTLINED_FUNCTION_11_4();
  v6 = OBJC_IVAR____TtC27AppleMediaServicesUIDynamic9VideoView_currentTouch;
  v7 = *(void **)&v2[OBJC_IVAR____TtC27AppleMediaServicesUIDynamic9VideoView_currentTouch];
  if (!v7
    || objc_msgSend(v7, sel_phase) == (id)3
    || (v8 = *(id *)&v2[v6]) != 0 && (v8 = objc_msgSend(v8, sel_phase), v8 == (id)4))
  {
    v9 = swift_bridgeObjectRetain();
    v10 = (void *)sub_1B9DD1B38(v9);
    v11 = OUTLINED_FUNCTION_16_0();
    if (v10)
    {
      v12 = *(void **)&v3[v6];
      *(_QWORD *)&v3[v6] = v10;
      v13 = v10;

      objc_msgSend(v13, sel_locationInView_, v3);
      v14 = objc_msgSend(v3, sel_hitTest_withEvent_, a2);
      if (v14)
      {
        v15 = v14;
        OUTLINED_FUNCTION_3_11((uint64_t)v14, &qword_1EF243D08);
        v16 = v3;
        v17 = v15;
        LOBYTE(v15) = sub_1B9DE2598();

        if ((v15 & 1) == 0)
        {
          OUTLINED_FUNCTION_3_11(v18, &qword_1EF243CF8);
          OUTLINED_FUNCTION_37_7();
          v19 = v17;
          v20 = (void *)sub_1B9DE2340();
          OUTLINED_FUNCTION_1_23(v19, sel_touchesBegan_withEvent_);

        }
      }

      OUTLINED_FUNCTION_3_11(v21, &qword_1EF243CF8);
      OUTLINED_FUNCTION_37_7();
      v22 = (void *)OUTLINED_FUNCTION_29_8();
      v24[0] = v3;
      v24[1] = v5;
      v23 = (objc_super *)v24;
    }
    else
    {
      OUTLINED_FUNCTION_3_11(v11, &qword_1EF243CF8);
      OUTLINED_FUNCTION_37_7();
      v22 = (void *)OUTLINED_FUNCTION_29_8();
      v25[0] = v3;
      v25[1] = v5;
      v23 = (objc_super *)v25;
    }
  }
  else
  {
    OUTLINED_FUNCTION_3_11((uint64_t)v8, &qword_1EF243CF8);
    OUTLINED_FUNCTION_37_7();
    v22 = (void *)OUTLINED_FUNCTION_29_8();
    v26[0] = v3;
    v26[1] = v5;
    v23 = (objc_super *)v26;
  }
  OUTLINED_FUNCTION_88_2(v23, sel_touchesBegan_withEvent_);

}

void VideoView.touchesEnded(_:with:)(uint64_t a1, uint64_t a2)
{
  sub_1B9DD7914(a1, a2, (SEL *)&selRef_touchesEnded_withEvent_);
}

uint64_t sub_1B9DD77A0(void *a1, uint64_t a2)
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
    v4 = sub_1B9DE26AC();

    return v4 & 1;
  }
  if (!*(_QWORD *)(a2 + 16)
    || (v6 = sub_1B9DE258C(),
        v7 = -1 << *(_BYTE *)(a2 + 32),
        v8 = v6 & ~v7,
        v9 = a2 + 56,
        ((*(_QWORD *)(a2 + 56 + ((v8 >> 3) & 0xFFFFFFFFFFFFF8)) >> v8) & 1) == 0))
  {
LABEL_11:
    v12 = 0;
    return v12 & 1;
  }
  sub_1B9D661C0(0, &qword_1EF243CF8);
  v10 = *(id *)(*(_QWORD *)(a2 + 48) + 8 * v8);
  v11 = sub_1B9DE2598();

  if ((v11 & 1) == 0)
  {
    v13 = ~v7;
    v14 = (v8 + 1) & v13;
    if (((*(_QWORD *)(v9 + ((v14 >> 3) & 0xFFFFFFFFFFFFF8)) >> v14) & 1) != 0)
    {
      do
      {
        v15 = *(id *)(*(_QWORD *)(a2 + 48) + 8 * v14);
        v12 = sub_1B9DE2598();

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

void VideoView.touchesCancelled(_:with:)(uint64_t a1, uint64_t a2)
{
  sub_1B9DD7914(a1, a2, (SEL *)&selRef_touchesCancelled_withEvent_);
}

void sub_1B9DD7914(uint64_t a1, uint64_t a2, SEL *a3)
{
  char *v3;
  char *v5;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  char *v16;
  id v17;
  uint64_t v18;
  id v19;
  void *v20;
  void *v21;
  const char *v22;
  objc_super *v23;
  uint64_t v24;
  _QWORD v25[2];
  _QWORD v26[2];

  v5 = v3;
  v8 = OUTLINED_FUNCTION_11_4();
  v9 = v8;
  v10 = OBJC_IVAR____TtC27AppleMediaServicesUIDynamic9VideoView_currentTouch;
  v11 = *(void **)&v5[OBJC_IVAR____TtC27AppleMediaServicesUIDynamic9VideoView_currentTouch];
  if (!v11)
    goto LABEL_8;
  v12 = v11;
  if ((sub_1B9DD77A0(v12, a1) & 1) == 0)
  {

LABEL_8:
    OUTLINED_FUNCTION_3_11(v8, &qword_1EF243CF8);
    OUTLINED_FUNCTION_37_7();
    v21 = (void *)OUTLINED_FUNCTION_58_3();
    v26[0] = v5;
    v26[1] = v9;
    v22 = *a3;
    v23 = (objc_super *)v26;
    goto LABEL_11;
  }
  v13 = *(void **)&v5[v10];
  *(_QWORD *)&v5[v10] = 0;

  objc_msgSend(v12, sel_locationInView_, v5);
  v14 = objc_msgSend(v5, sel_hitTest_withEvent_, a2);
  if (v14)
  {
    v15 = v14;
    OUTLINED_FUNCTION_3_11((uint64_t)v14, &qword_1EF243D08);
    v16 = v5;
    v17 = v15;
    LOBYTE(v15) = sub_1B9DE2598();

    if ((v15 & 1) == 0)
    {
      OUTLINED_FUNCTION_3_11(v18, &qword_1EF243CF8);
      OUTLINED_FUNCTION_37_7();
      v19 = v17;
      v20 = (void *)sub_1B9DE2340();
      OUTLINED_FUNCTION_1_23(v19, *a3);

      v12 = v19;
    }

  }
  else
  {
    v17 = v12;
  }

  OUTLINED_FUNCTION_3_11(v24, &qword_1EF243CF8);
  OUTLINED_FUNCTION_37_7();
  v21 = (void *)OUTLINED_FUNCTION_58_3();
  v25[0] = v5;
  v25[1] = v9;
  v22 = *a3;
  v23 = (objc_super *)v25;
LABEL_11:
  OUTLINED_FUNCTION_88_2(v23, v22);

}

uint64_t sub_1B9DD7AEC(void *a1, uint64_t a2, uint64_t a3, void *a4, void (*a5)(uint64_t, void *))
{
  uint64_t v8;
  id v9;
  id v10;

  OUTLINED_FUNCTION_3_11((uint64_t)a1, &qword_1EF243CF8);
  sub_1B9DD8878();
  v8 = sub_1B9DE234C();
  v9 = a4;
  v10 = a1;
  a5(v8, a4);

  return swift_bridgeObjectRelease();
}

void sub_1B9DD7B80()
{
  uint64_t v0;
  uint64_t v1;
  unsigned __int8 *v2;

  v1 = *(_QWORD *)(v0 + OBJC_IVAR____TtC27AppleMediaServicesUIDynamic9VideoView_videoPlayer);
  if (v1)
  {
    v2 = (unsigned __int8 *)(v1 + OBJC_IVAR____TtC27AppleMediaServicesUIDynamic11VideoPlayer_shouldBePlaying);
    swift_beginAccess();
    LODWORD(v2) = *v2;
    sub_1B9DD1F2C(0);
    if ((_DWORD)v2 == 1)
    {
      VideoView.startPreloading()();
      VideoView.play()();
    }
  }
  else
  {
    sub_1B9DD1F2C(0);
  }
}

void VideoView.playerViewController(_:willBeginFullScreenPresentationWithAnimationCoordinator:)()
{
  OUTLINED_FUNCTION_82_2();
}

void sub_1B9DD7C60(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _BYTE *v4;

  if (a1)
  {
    v3 = OUTLINED_FUNCTION_92_2();
    (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v3, v2);
    OUTLINED_FUNCTION_14_6();
  }
  v4 = (_BYTE *)(v1 + OBJC_IVAR____TtC27AppleMediaServicesUIDynamic9VideoView_isTransitioningToFullscreen);
  OUTLINED_FUNCTION_6_5();
  *v4 = 1;
  OUTLINED_FUNCTION_3_22();
}

void sub_1B9DD7CE4()
{
  void *v0;
  void *v1;

  swift_unknownObjectRelease();
}

void sub_1B9DD7D28()
{
  uint64_t v0;
  id v1;

  v1 = *(id *)(v0 + OBJC_IVAR____TtC27AppleMediaServicesUIDynamic9VideoView_playerViewController);
  OUTLINED_FUNCTION_1();
}

id sub_1B9DD7D70()
{
  return OUTLINED_FUNCTION_53_6(OBJC_IVAR____TtC27AppleMediaServicesUIDynamic9VideoView_playButton);
}

id VideoView.__allocating_init(frame:)()
{
  Class v0;
  id v1;
  double v2;
  id v3;
  SEL v4;

  OUTLINED_FUNCTION_10_3();
  v1 = objc_allocWithZone(v0);
  v2 = OUTLINED_FUNCTION_9_3();
  return objc_msgSend(v3, v4, v2);
}

void VideoView.init(frame:)()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

id VideoView.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)OUTLINED_FUNCTION_11_4();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t (*sub_1B9DD7FB4(_QWORD *a1))()
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t v4;

  v3 = malloc(0x30uLL);
  *a1 = v3;
  v4 = OBJC_IVAR____TtC27AppleMediaServicesUIDynamic9VideoView_objectGraph;
  v3[4] = v1;
  v3[5] = v4;
  swift_beginAccess();
  v3[3] = swift_weakLoadStrong();
  return sub_1B9DD1D18;
}

void sub_1B9DD8024()
{
  void *v0;
  char v1;

  OUTLINED_FUNCTION_79_3();
  swift_weakAssign();
  if ((v1 & 1) != 0)
  {
    swift_release();
    OUTLINED_FUNCTION_71_4();
  }
  else
  {
    OUTLINED_FUNCTION_71_4();
    OUTLINED_FUNCTION_44_0();
  }
  OUTLINED_FUNCTION_42_6(v0);
}

uint64_t (*sub_1B9DD8078(_QWORD *a1))()
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v3 = malloc(0x38uLL);
  *a1 = v3;
  v4 = OBJC_IVAR____TtC27AppleMediaServicesUIDynamic9VideoView_delegate;
  v3[5] = v1;
  v3[6] = v4;
  v5 = v1 + v4;
  swift_beginAccess();
  v6 = MEMORY[0x1BCCCEFF8](v5);
  v7 = *(_QWORD *)(v5 + 8);
  v3[3] = v6;
  v3[4] = v7;
  return sub_1B9DD46F4;
}

void sub_1B9DD80EC()
{
  _QWORD *v0;
  char v1;

  OUTLINED_FUNCTION_79_3();
  *(_QWORD *)(v0[5] + v0[6] + 8) = v0[4];
  swift_unknownObjectWeakAssign();
  if ((v1 & 1) != 0)
  {
    swift_unknownObjectRelease();
    OUTLINED_FUNCTION_71_4();
  }
  else
  {
    OUTLINED_FUNCTION_71_4();
    OUTLINED_FUNCTION_14_6();
  }
  OUTLINED_FUNCTION_42_6(v0);
}

void (*sub_1B9DD8158(uint64_t a1))()
{
  uint64_t v1;

  *(_QWORD *)(a1 + 24) = v1;
  swift_beginAccess();
  return sub_1B9DD54CC;
}

id sub_1B9DD81D0()
{
  void *v0;

  return objc_msgSend(v0, sel_superview);
}

id sub_1B9DD81FC(uint64_t a1)
{
  void *v1;

  return objc_msgSend(v1, sel_isDescendantOfView_, a1);
}

id sub_1B9DD8224(uint64_t a1)
{
  void *v1;

  return objc_msgSend(v1, sel_convertRect_toView_, a1);
}

uint64_t sub_1B9DD8238()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t (*v5)(uint64_t);
  uint64_t v6;
  uint64_t result;
  _QWORD v8[2];

  v0 = sub_1B9DE24CC();
  v1 = *(_QWORD *)(v0 - 8);
  MEMORY[0x1E0C80A78](v0);
  v3 = (char *)v8 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = sub_1B9DE24A8();
  v5 = (uint64_t (*)(uint64_t))MEMORY[0x1E0DEF810];
  MEMORY[0x1E0C80A78](v4);
  v6 = sub_1B9DE16F8();
  MEMORY[0x1E0C80A78](v6);
  sub_1B9D661C0(0, (unint64_t *)&qword_1ED5CFB60);
  sub_1B9DE16EC();
  v8[1] = MEMORY[0x1E0DEE9D8];
  sub_1B9D42DA0(qword_1ED5CFB50, v5, MEMORY[0x1E0DEF828]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED5CFAE8);
  sub_1B9DD8A90(&qword_1ED5CFAF0, &qword_1ED5CFAE8);
  sub_1B9DE261C();
  (*(void (**)(char *, _QWORD, uint64_t))(v1 + 104))(v3, *MEMORY[0x1E0DEF8D0], v0);
  result = sub_1B9DE2508();
  qword_1EF243C80 = result;
  return result;
}

void sub_1B9DD8404(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12[2];

  v12[1] = *(id *)MEMORY[0x1E0C80C00];
  v8 = objc_msgSend((id)objc_opt_self(), sel_sharedInstance);
  v12[0] = 0;
  LODWORD(a4) = objc_msgSend(v8, sel_setCategory_mode_options_error_, a3, a4, a5, v12);

  if ((_DWORD)a4)
  {
    v9 = v12[0];
  }
  else
  {
    v10 = v12[0];
    v11 = (void *)sub_1B9DE14B8();

    swift_willThrow();
  }
  sub_1B9DD866C();
}

void sub_1B9DD851C()
{
  void *v0;
  id v1;
  unsigned __int8 v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  unsigned int v6;
  id v7;
  id v8;
  void *v9;
  id v10[2];

  v10[1] = *(id *)MEMORY[0x1E0C80C00];
  v0 = (void *)objc_opt_self();
  v1 = objc_msgSend(v0, sel_sharedInstance);
  v2 = objc_msgSend(v1, sel_categoryOptions);

  if ((v2 & 1) == 0)
  {
    v3 = objc_msgSend(v0, sel_sharedInstance);
    v4 = *MEMORY[0x1E0C89690];
    v5 = *MEMORY[0x1E0C89748];
    v10[0] = 0;
    v6 = objc_msgSend(v3, sel_setCategory_mode_options_error_, v4, v5, 1, v10);

    if (v6)
    {
      v7 = v10[0];
    }
    else
    {
      v8 = v10[0];
      v9 = (void *)sub_1B9DE14B8();

      swift_willThrow();
    }
  }
  sub_1B9DD866C();
}

void sub_1B9DD866C()
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
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  OUTLINED_FUNCTION_54_0();
  v2 = v1;
  v4 = v3;
  v15 = *(_QWORD *)(sub_1B9DE16C8() - 8);
  OUTLINED_FUNCTION_23_0();
  MEMORY[0x1E0C80A78](v5);
  v6 = OUTLINED_FUNCTION_1_5();
  v13 = *(_QWORD *)(v6 - 8);
  v14 = v6;
  OUTLINED_FUNCTION_23_0();
  MEMORY[0x1E0C80A78](v7);
  OUTLINED_FUNCTION_0_6();
  OUTLINED_FUNCTION_3_11(v8, (unint64_t *)&qword_1ED5CFB60);
  v9 = (void *)sub_1B9DE24D8();
  v10 = OUTLINED_FUNCTION_7_7();
  *(_QWORD *)(v10 + 16) = v4;
  *(_QWORD *)(v10 + 24) = v2;
  v11 = OUTLINED_FUNCTION_75_0();
  sub_1B9D63190(v4);
  OUTLINED_FUNCTION_44_0();
  OUTLINED_FUNCTION_46_0();
  sub_1B9D42DA0((unint64_t *)&qword_1ED5CF9C0, (uint64_t (*)(uint64_t))MEMORY[0x1E0DEF4F8], MEMORY[0x1E0DEF510]);
  OUTLINED_FUNCTION_29_1();
  OUTLINED_FUNCTION_106_1((unint64_t *)&qword_1ED5CFAE0);
  sub_1B9DE261C();
  v12 = OUTLINED_FUNCTION_52();
  MEMORY[0x1BCCCE2A8](v12);
  _Block_release(v11);

  OUTLINED_FUNCTION_13_16(v15);
  (*(void (**)(uint64_t, uint64_t))(v13 + 8))(v0, v14);
  OUTLINED_FUNCTION_2_5();
}

void sub_1B9DD87FC(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  void *v7;

  v7 = (void *)sub_1B9DE2094();
  swift_bridgeObjectRelease();
  objc_msgSend(a4, sel_postNotificationName_object_userInfo_, a1, a2, v7);
  OUTLINED_FUNCTION_14_11(v7);
}

unint64_t sub_1B9DD8878()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1EF243D00;
  if (!qword_1EF243D00)
  {
    sub_1B9D661C0(255, &qword_1EF243CF8);
    result = MEMORY[0x1BCCCEEA8](MEMORY[0x1E0DEFCF8], v1);
    atomic_store(result, (unint64_t *)&qword_1EF243D00);
  }
  return result;
}

uint64_t sub_1B9DD88C8()
{
  return type metadata accessor for VideoView();
}

uint64_t type metadata accessor for VideoView()
{
  uint64_t result;

  result = qword_1EF243E20;
  if (!qword_1EF243E20)
    return swift_getSingletonMetadata();
  return result;
}

void sub_1B9DD8908()
{
  unint64_t v0;
  unint64_t v1;
  unint64_t v2;

  sub_1B9DC7EF4();
  if (v0 <= 0x3F)
  {
    sub_1B9DE1554();
    if (v1 <= 0x3F)
    {
      type metadata accessor for VideoConfiguration();
      if (v2 <= 0x3F)
        swift_updateClassMetadata2();
    }
  }
}

uint64_t sub_1B9DD8A3C()
{
  uint64_t v0;

  if (*(_QWORD *)(v0 + 16))
    swift_release();

  return swift_deallocObject();
}

void sub_1B9DD8A78()
{
  uint64_t *v0;

  sub_1B9DD8404(v0[2], v0[3], v0[4], v0[5], v0[6]);
}

void sub_1B9DD8A90(unint64_t *a1, uint64_t *a2)
{
  uint64_t v3;

  if (!*a1)
  {
    v3 = __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    atomic_store(MEMORY[0x1BCCCEEA8](MEMORY[0x1E0DEAF38], v3), a1);
  }
  OUTLINED_FUNCTION_1();
}

uint64_t sub_1B9DD8ACC(uint64_t a1)
{
  if ((a1 & 0xC000000000000001) != 0)
    return sub_1B9DE26B8();
  else
    return 1 << *(_BYTE *)(a1 + 32);
}

void sub_1B9DD8B1C(uint64_t a1, uint64_t a2, char a3, uint64_t a4)
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
      if (sub_1B9DE2664() == *(_DWORD *)(a4 + 36))
      {
        sub_1B9DE2670();
        sub_1B9D661C0(0, &qword_1EF243CF8);
        swift_unknownObjectRetain();
        swift_dynamicCast();
        v4 = v16;
        swift_unknownObjectRelease();
        v8 = sub_1B9DE258C();
        v9 = -1 << *(_BYTE *)(a4 + 32);
        v6 = v8 & ~v9;
        if (((*(_QWORD *)(a4 + 56 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8)) >> v6) & 1) != 0)
        {
          v10 = *(id *)(*(_QWORD *)(a4 + 48) + 8 * v6);
          v11 = sub_1B9DE2598();

          if ((v11 & 1) == 0)
          {
            v12 = ~v9;
            do
            {
              v6 = (v6 + 1) & v12;
              if (((*(_QWORD *)(a4 + 56 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8)) >> v6) & 1) == 0)
                goto LABEL_24;
              v13 = *(id *)(*(_QWORD *)(a4 + 48) + 8 * v6);
              v14 = sub_1B9DE2598();

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
  MEMORY[0x1BCCCE440](a1, a2, v7);
  sub_1B9D661C0(0, &qword_1EF243CF8);
  swift_unknownObjectRetain();
  swift_dynamicCast();
  swift_unknownObjectRelease();
}

uint64_t sub_1B9DD8D84(uint64_t a1)
{
  unint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char v5;
  unsigned int v6;
  uint64_t i;

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
  v2 = 64;
  for (i = 9; i - 7 < (unint64_t)(v3 + 63) >> 6; ++i)
  {
    v1 = *(_QWORD *)(a1 + 8 * i);
    v2 += 64;
    if (v1)
      return __clz(__rbit64(v1)) + v2;
  }
  return v3;
}

BOOL sub_1B9DD8E04(uint64_t a1, int a2, char a3, uint64_t a4, int a5, char a6)
{
  if ((a3 & 1) != 0)
  {
    if ((a6 & 1) != 0)
LABEL_9:
      JUMPOUT(0x1BCCCE404);
LABEL_8:
    __break(1u);
    goto LABEL_9;
  }
  if ((a6 & 1) != 0)
    goto LABEL_8;
  if (a2 != a5)
  {
    __break(1u);
    goto LABEL_8;
  }
  return a1 == a4;
}

uint64_t sub_1B9DD8E38(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t result;

  if ((a3 & 1) != 0)
    return swift_bridgeObjectRelease();
  return result;
}

void sub_1B9DD8E44(char a1)
{
  uint64_t v1;

  sub_1B9DD5C40(a1, v1);
}

uint64_t sub_1B9DD8E4C()
{
  uint64_t v0;

  return swift_deallocObject();
}

void sub_1B9DD8E74()
{
  uint64_t v0;

  sub_1B9DD63E4(*(_QWORD *)(v0 + 16), *(_BYTE *)(v0 + 24));
}

uint64_t sub_1B9DD8E80()
{
  return swift_deallocObject();
}

id sub_1B9DD8E90()
{
  uint64_t v0;

  return sub_1B9DD6358(*(_QWORD *)(v0 + 16), *(_BYTE *)(v0 + 24));
}

id sub_1B9DD8E9C()
{
  uint64_t v0;
  double v1;

  v1 = 0.0;
  if (*(_BYTE *)(v0 + 24))
    v1 = 1.0;
  return objc_msgSend(*(id *)(*(_QWORD *)(v0 + 16) + OBJC_IVAR____TtC27AppleMediaServicesUIDynamic9VideoView_playButton), sel_setAlpha_, v1);
}

void sub_1B9DD8ED0()
{
  sub_1B9DD851C();
}

uint64_t objectdestroy_10Tm()
{
  uint64_t v0;

  if (*(_QWORD *)(v0 + 16))
    swift_release();
  return swift_deallocObject();
}

void sub_1B9DD8F08()
{
  uint64_t v0;
  void (*v1)(void);

  v1 = *(void (**)(void))(v0 + 16);
  if (v1)
    v1();
  OUTLINED_FUNCTION_1();
}

void sub_1B9DD8F2C(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v3;

  v3 = __swift_instantiateConcreteTypeFromMangledName(a3);
  OUTLINED_FUNCTION_39_9(v3);
  OUTLINED_FUNCTION_1();
}

void sub_1B9DD8F58()
{
  uint64_t v0;

  sub_1B9DD3500(v0);
}

uint64_t sub_1B9DD8F60()
{
  uint64_t v0;

  return swift_deallocObject();
}

char *sub_1B9DD8F84()
{
  uint64_t v0;

  return sub_1B9DD6D2C(*(char **)(v0 + 16), *(double *)(v0 + 24), *(double *)(v0 + 32));
}

uint64_t OUTLINED_FUNCTION_7_27()
{
  return swift_allocObject();
}

uint64_t OUTLINED_FUNCTION_8_22()
{
  return swift_allocObject();
}

uint64_t OUTLINED_FUNCTION_15_17(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v2 - 144) = a1;
  *(_QWORD *)(v2 - 168) = v1;
  return sub_1B9DE1884();
}

void OUTLINED_FUNCTION_22_13()
{
  uint64_t *v0;
  uint64_t v1;

  sub_1B9D6B278(v1 - 144, v0);
}

uint64_t OUTLINED_FUNCTION_24_11(uint64_t a1)
{
  *(_QWORD *)(a1 + 8) = 0;
  return swift_unknownObjectWeakInit();
}

uint64_t OUTLINED_FUNCTION_29_8()
{
  return sub_1B9DE2340();
}

void OUTLINED_FUNCTION_31_5()
{
  uint64_t *v0;
  uint64_t v1;

  sub_1B9D6B278(v1 - 144, v0);
}

uint64_t OUTLINED_FUNCTION_33_9(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v2 - 88) = a1;
  *(_QWORD *)(v2 - 112) = v1;
  return AMSLogKey();
}

unint64_t OUTLINED_FUNCTION_37_7()
{
  return sub_1B9DD8878();
}

uint64_t OUTLINED_FUNCTION_39_9(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(a1 - 8) + 16))(v1, v2, a1);
}

void OUTLINED_FUNCTION_42_6(void *a1)
{
  free(a1);
}

uint64_t OUTLINED_FUNCTION_45_4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v2 - 112) = v0;
  *(_QWORD *)(v2 - 104) = v1;
  return sub_1B9DE18CC();
}

uint64_t OUTLINED_FUNCTION_47_6()
{
  return sub_1B9DE18C0();
}

void OUTLINED_FUNCTION_49_7(uint64_t a1, uint64_t *a2)
{
  uint64_t v2;

  sub_1B9D6B278(v2 - 144, a2);
}

void OUTLINED_FUNCTION_50_4(uint64_t a1, uint64_t *a2)
{
  uint64_t v2;

  sub_1B9D6B278(v2 - 112, a2);
}

id OUTLINED_FUNCTION_53_6@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return *(id *)(v1 + a1);
}

uint64_t OUTLINED_FUNCTION_56_5()
{
  return swift_endAccess();
}

uint64_t OUTLINED_FUNCTION_58_3()
{
  return sub_1B9DE2340();
}

uint64_t OUTLINED_FUNCTION_59_6()
{
  return sub_1B9DE261C();
}

uint64_t OUTLINED_FUNCTION_60_4()
{
  return sub_1B9DE16C8();
}

uint64_t OUTLINED_FUNCTION_71_4()
{
  return swift_endAccess();
}

uint64_t OUTLINED_FUNCTION_72_1@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return v1 + a1;
}

void OUTLINED_FUNCTION_73_4(uint64_t a1)
{
  uint64_t *v1;

  sub_1B9D6B278(a1, v1);
}

double OUTLINED_FUNCTION_75_3()
{
  double v0;

  return v0;
}

uint64_t OUTLINED_FUNCTION_81_4()
{
  return swift_unknownObjectRelease();
}

void OUTLINED_FUNCTION_82_2()
{
  JUMPOUT(0x1BCCCEFF8);
}

id OUTLINED_FUNCTION_88_2(objc_super *a1, SEL a2)
{
  uint64_t v2;
  uint64_t v3;

  return objc_msgSendSuper2(a1, a2, v3, v2);
}

uint64_t OUTLINED_FUNCTION_92_2()
{
  return swift_getObjectType();
}

void OUTLINED_FUNCTION_93_2(uint64_t a1, uint64_t *a2)
{
  uint64_t v2;

  sub_1B9D6B278(v2 - 168, a2);
}

void OUTLINED_FUNCTION_94_3()
{
  uint64_t *v0;
  uint64_t v1;

  sub_1B9D6B278(v1 - 168, v0);
}

id OUTLINED_FUNCTION_95_2()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v2 - 112) = v1;
  *(_QWORD *)(v2 - 136) = v0;
  return v0;
}

__n128 *OUTLINED_FUNCTION_96_2(__n128 *result, __n128 a2)
{
  result[1] = a2;
  return result;
}

double OUTLINED_FUNCTION_98_1()
{
  return 0.0;
}

uint64_t OUTLINED_FUNCTION_101_0@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_1B9D5DB24(v1 + a1);
}

uint64_t OUTLINED_FUNCTION_104_0()
{
  return swift_weakLoadStrong();
}

uint64_t OUTLINED_FUNCTION_105_0()
{
  return sub_1B9DE26DC();
}

void OUTLINED_FUNCTION_106_1(unint64_t *a1)
{
  uint64_t *v1;

  sub_1B9DD8A90(a1, v1);
}

uint64_t static NSNotificationName.VideoDecoderUnavailable.getter()
{
  return sub_1B9DE213C();
}

const char *VideoDecoderUnavailableUserInfoKey.playbackId.unsafeMutableAddressor()
{
  return "PlaybackId";
}

const char *VideoDecoderUnavailableUserInfoKey.error.unsafeMutableAddressor()
{
  return "videoViewError";
}

uint64_t static VideoDecoderUnavailableUserInfoKey.playbackId.getter()
{
  return 0x6B63616279616C50;
}

uint64_t static VideoDecoderUnavailableUserInfoKey.error.getter()
{
  return 0x6569566F65646976;
}

ValueMetadata *type metadata accessor for VideoDecoderUnavailableUserInfoKey()
{
  return &type metadata for VideoDecoderUnavailableUserInfoKey;
}

void sub_1B9DD9280(uint64_t a1, double a2, double a3, double a4, double a5)
{
  void *v5;
  char v6;
  id v11;
  void *v12;
  id v13;
  id v14;
  uint64_t v15;
  id v16;
  id v17;
  uint64_t v18;
  id v19;
  id v20;
  uint64_t v21;
  id v22;
  id v23;
  id v24;
  uint64_t v25;
  id v26;
  id v27;
  uint64_t v28;
  id v29;
  id v30;
  id v31;
  void *v32;

  v6 = a1;
  v11 = OUTLINED_FUNCTION_2_9(a1, sel_superview);
  if (v11)
  {
    v12 = v11;
    if ((v6 & 1) != 0)
    {
      v13 = OUTLINED_FUNCTION_3_6((uint64_t)v11, sel_safeAreaLayoutGuide);
      v14 = objc_msgSend(v13, sel_topAnchor);

      v16 = OUTLINED_FUNCTION_3_6(v15, sel_safeAreaLayoutGuide);
      v17 = objc_msgSend(v16, sel_bottomAnchor);

    }
    else
    {
      v14 = OUTLINED_FUNCTION_3_6((uint64_t)v11, sel_topAnchor);
      v17 = OUTLINED_FUNCTION_3_6((uint64_t)v14, sel_bottomAnchor);
    }
    objc_msgSend(v5, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
    __swift_instantiateConcreteTypeFromMangledName(&qword_1ED5CDE40);
    v18 = swift_allocObject();
    *(_OWORD *)(v18 + 16) = xmmword_1B9DF5C00;
    v19 = OUTLINED_FUNCTION_2_9(v18, sel_topAnchor);
    v20 = objc_msgSend(v19, sel_constraintEqualToAnchor_constant_, v14, a2);

    *(_QWORD *)(v18 + 32) = v20;
    v22 = OUTLINED_FUNCTION_2_9(v21, sel_leadingAnchor);
    v23 = OUTLINED_FUNCTION_3_6((uint64_t)v22, sel_leadingAnchor);
    v24 = objc_msgSend(v22, sel_constraintEqualToAnchor_constant_, v23, a3);

    *(_QWORD *)(v18 + 40) = v24;
    v26 = OUTLINED_FUNCTION_2_9(v25, sel_bottomAnchor);
    v27 = objc_msgSend(v26, sel_constraintEqualToAnchor_constant_, v17, -a4);

    *(_QWORD *)(v18 + 48) = v27;
    v29 = OUTLINED_FUNCTION_2_9(v28, sel_trailingAnchor);
    v30 = OUTLINED_FUNCTION_3_6((uint64_t)v29, sel_trailingAnchor);
    v31 = objc_msgSend(v29, sel_constraintEqualToAnchor_constant_, v30, -a5);

    *(_QWORD *)(v18 + 56) = v31;
    sub_1B9DE22B0();
    sub_1B9D55F98();
    v32 = (void *)sub_1B9DE2280();
    OUTLINED_FUNCTION_16();
    objc_msgSend(v12, sel_addConstraints_, v32);

    OUTLINED_FUNCTION_2_45(v32);
  }
}

void sub_1B9DD9568(uint64_t a1, uint64_t a2, char a3)
{
  void *v3;
  void *v4;
  id v8;
  uint64_t v9;
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  double v18;
  uint64_t v19;
  id v20;
  id v21;
  uint64_t v22;
  id v23;
  id v24;
  void *v25;
  id v26;

  v4 = v3;
  v8 = OUTLINED_FUNCTION_2_9(a1, sel_superview);
  if (v8)
  {
    v26 = v8;
    objc_msgSend(v3, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
    __swift_instantiateConcreteTypeFromMangledName(&qword_1ED5CDE40);
    v9 = OUTLINED_FUNCTION_47_2();
    *(_OWORD *)(v9 + 16) = xmmword_1B9DF5C10;
    v10 = OUTLINED_FUNCTION_3_6(v9, sel_centerXAnchor);
    v11 = objc_msgSend(v26, sel_centerXAnchor);
    v12 = OUTLINED_FUNCTION_3_38();

    *(_QWORD *)(v9 + 32) = v12;
    v14 = OUTLINED_FUNCTION_3_6(v13, sel_centerYAnchor);
    v15 = objc_msgSend(v26, sel_centerYAnchor);
    v16 = OUTLINED_FUNCTION_3_38();

    *(_QWORD *)(v9 + 40) = v16;
    OUTLINED_FUNCTION_7_28();
    sub_1B9D55F98();
    v17 = (void *)OUTLINED_FUNCTION_5_27();
    OUTLINED_FUNCTION_16();
    objc_msgSend(v26, sel_addConstraints_, v17);

    if ((a3 & 1) == 0)
    {
      v18 = *(double *)&a2;
      v19 = OUTLINED_FUNCTION_47_2();
      *(_OWORD *)(v19 + 16) = xmmword_1B9DF5C10;
      v20 = OUTLINED_FUNCTION_3_6(v19, sel_widthAnchor);
      v21 = objc_msgSend(v20, sel_constraintEqualToConstant_, *(double *)&a1);

      *(_QWORD *)(v19 + 32) = v21;
      v23 = OUTLINED_FUNCTION_3_6(v22, sel_heightAnchor);
      v24 = objc_msgSend(v23, sel_constraintEqualToConstant_, v18);

      *(_QWORD *)(v19 + 40) = v24;
      OUTLINED_FUNCTION_7_28();
      v25 = (void *)OUTLINED_FUNCTION_5_27();
      OUTLINED_FUNCTION_16();
      objc_msgSend(v4, sel_addConstraints_, v25);

    }
    OUTLINED_FUNCTION_2_45(v26);
  }
}

void OUTLINED_FUNCTION_2_45(id a1)
{

}

id OUTLINED_FUNCTION_3_38()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;

  return objc_msgSend(v0, (SEL)(v2 + 3918), v1);
}

uint64_t OUTLINED_FUNCTION_5_27()
{
  return sub_1B9DE2280();
}

uint64_t OUTLINED_FUNCTION_7_28()
{
  return sub_1B9DE22B0();
}

void sub_1B9DD97FC(char a1)
{
  void *v1;
  id v3;
  _QWORD *v4;
  id v5;

  v3 = objc_msgSend(v1, sel_layer);
  v5 = v3;
  v4 = (_QWORD *)MEMORY[0x1E0CD2A60];
  if ((a1 & 1) != 0)
    v4 = (_QWORD *)MEMORY[0x1E0CD2A68];
  objc_msgSend(v3, sel_setCornerCurve_, *v4);

}

void sub_1B9DD9868(void *a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v6;
  uint64_t v7;

  v6 = sub_1B9DE1968();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x1E0C80A78](v6);
  OUTLINED_FUNCTION_22_8();
  if (sub_1B9DD9A34(a1))
  {
    OUTLINED_FUNCTION_2_46();
    sub_1B9DE1F38();
    (*(void (**)(void *, uint64_t, uint64_t))(v3 + 32))(a1, v2, a2);
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v2, v6);
    swift_release();
  }
  OUTLINED_FUNCTION_1_2();
}

void sub_1B9DD9924(void *a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v6 = sub_1B9DE1968();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x1E0C80A78](v6);
  OUTLINED_FUNCTION_22_8();
  if (!sub_1B9DD9A34(a1)
    || (OUTLINED_FUNCTION_2_46(),
        sub_1B9DE1F38(),
        v8 = (*(uint64_t (**)(void *, uint64_t, uint64_t))(v3 + 32))(a1, v2, a2),
        (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v2, v6),
        swift_release(),
        !v8))
  {
    sub_1B9DDA0D8();
    swift_allocError();
    objc_allocWithZone((Class)type metadata accessor for ErrorViewController());
    swift_retain();
    sub_1B9D9F4C0();
  }
  OUTLINED_FUNCTION_1_2();
}

uint64_t sub_1B9DD9A34(void *a1)
{
  uint64_t v2;
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
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;

  v2 = sub_1B9DE18B4();
  MEMORY[0x1E0C80A78](v2);
  v3 = sub_1B9DE1848();
  v24 = *(_QWORD *)(v3 - 8);
  MEMORY[0x1E0C80A78](v3);
  v5 = (char *)&v23 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_1B9DE1968();
  v7 = *(_QWORD *)(v6 - 8);
  v8 = MEMORY[0x1E0C80A78](v6);
  v10 = (char *)&v23 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v8);
  v12 = (char *)&v23 - v11;
  sub_1B9DE1AE8();
  sub_1B9DE1F38();
  v25 = a1;
  sub_1B9DE1854();
  (*(void (**)(char *, char *, uint64_t))(v7 + 16))(v10, v12, v6);
  v13 = Location.init(deserializing:using:)((uint64_t)v5, (uint64_t)v10);
  v26 = v7;
  v15 = v14;
  v17 = v16;
  v18 = (void *)v13;
  v20 = v19;
  type metadata accessor for PageLoader();
  sub_1B9DE1F38();
  v24 = v20;
  v25 = v18;
  v21 = PageLoader.pageDefinition(withLocation:)(v18, v15, v20, v17);
  (*(void (**)(char *, uint64_t))(v26 + 8))(v12, v6);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  return v21;
}

unint64_t sub_1B9DDA0D8()
{
  unint64_t result;

  result = qword_1EF243E50;
  if (!qword_1EF243E50)
  {
    result = MEMORY[0x1BCCCEEA8](&unk_1B9DF5D10, &type metadata for ViewControllerFactory.PresentationError);
    atomic_store(result, (unint64_t *)&qword_1EF243E50);
  }
  return result;
}

uint64_t sub_1B9DDA114()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t storeEnumTagSinglePayload for ViewControllerFactory.PresentationError(uint64_t a1, int a2, int a3)
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
    return ((uint64_t (*)(void))((char *)sub_1B9DDA180 + 4 * byte_1B9DF5C20[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_1B9DDA1A0 + 4 * byte_1B9DF5C25[v4]))();
}

_BYTE *sub_1B9DDA180(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_1B9DDA1A0(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_1B9DDA1A8(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_1B9DDA1B0(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_1B9DDA1B8(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_1B9DDA1C0(_DWORD *result)
{
  *result = 0;
  return result;
}

ValueMetadata *type metadata accessor for ViewControllerFactory.PresentationError()
{
  return &type metadata for ViewControllerFactory.PresentationError;
}

ValueMetadata *type metadata accessor for ViewControllerFactory()
{
  return &type metadata for ViewControllerFactory;
}

unint64_t sub_1B9DDA1F4()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1EF243E58;
  if (!qword_1EF243E58)
  {
    v1 = type metadata accessor for FlowAction();
    result = MEMORY[0x1BCCCEEA8](&unk_1B9DF33CC, v1);
    atomic_store(result, (unint64_t *)&qword_1EF243E58);
  }
  return result;
}

void sub_1B9DDA234(void *a1)
{
  uint64_t *v1;

  sub_1B9DD9924(a1, *v1);
}

unint64_t sub_1B9DDA240()
{
  unint64_t result;

  result = qword_1EF243E60;
  if (!qword_1EF243E60)
  {
    result = MEMORY[0x1BCCCEEA8](&unk_1B9DF5CE8, &type metadata for ViewControllerFactory.PresentationError);
    atomic_store(result, (unint64_t *)&qword_1EF243E60);
  }
  return result;
}

uint64_t OUTLINED_FUNCTION_2_46()
{
  return sub_1B9DE1AE8();
}

uint64_t sub_1B9DDA288(uint64_t a1, uint64_t a2)
{
  return sub_1B9DDA3A8(a1, a2, (void (*)(_QWORD))type metadata accessor for Artwork, (uint64_t (*)(uint64_t, uint64_t))Artwork.__allocating_init(deserializing:using:));
}

uint64_t sub_1B9DDA29C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _BYTE *v7;
  uint64_t v8;
  uint64_t v9;
  _BYTE *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  _BYTE v19[16];

  v4 = sub_1B9DE1968();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x1E0C80A78](v4);
  v7 = &v19[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v8 = sub_1B9DE1848();
  MEMORY[0x1E0C80A78](v8);
  v10 = &v19[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0)];
  (*(void (**)(_BYTE *, uint64_t))(v11 + 16))(v10, a1);
  (*(void (**)(_BYTE *, uint64_t, uint64_t))(v5 + 16))(v7, a2, v4);
  return VisualAreaArtwork.LayoutConstraints.init(deserializing:using:)((uint64_t)v10, (uint64_t)v7, v12, v13, v14, v15, v16, v17);
}

uint64_t sub_1B9DDA3A8(uint64_t a1, uint64_t a2, void (*a3)(_QWORD), uint64_t (*a4)(uint64_t, uint64_t))
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

  v8 = sub_1B9DE1968();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x1E0C80A78](v8);
  OUTLINED_FUNCTION_0_13();
  v12 = v11 - v10;
  v13 = sub_1B9DE1848();
  v14 = *(_QWORD *)(v13 - 8);
  MEMORY[0x1E0C80A78](v13);
  OUTLINED_FUNCTION_0_13();
  v17 = v16 - v15;
  a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v14 + 16))(v17, a1, v13);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v9 + 16))(v12, a2, v8);
  return a4(v17, v12);
}

uint64_t sub_1B9DDA4AC(uint64_t a1, uint64_t a2)
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

  v4 = sub_1B9DE1968();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x1E0C80A78](v4);
  OUTLINED_FUNCTION_0_13();
  v8 = v7 - v6;
  v9 = sub_1B9DE1848();
  MEMORY[0x1E0C80A78](v9);
  OUTLINED_FUNCTION_0_13();
  v12 = v11 - v10;
  (*(void (**)(uint64_t, uint64_t))(v13 + 16))(v11 - v10, a1);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 16))(v8, a2, v4);
  return Location.init(deserializing:using:)(v12, v8);
}

uint64_t VisualAreaArtwork.accessibilityAlignment.getter()
{
  unsigned __int8 *v0;

  return *v0;
}

uint64_t VisualAreaArtwork.artwork.getter()
{
  return swift_retain();
}

uint64_t VisualAreaArtwork.horizontalAlignment.getter()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + 16);
}

uint64_t VisualAreaArtwork.layoutConstraints.getter()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + 24);
}

uint64_t VisualAreaArtwork.init(deserializing:using:)@<X0>(uint64_t a1@<X1>, uint64_t a2@<X8>)
{
  void *v2;
  uint64_t v5;
  char v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  int v10;
  uint64_t v11;
  uint64_t v12;
  char v13;
  char v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t result;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  int v21;
  uint64_t v22;
  uint64_t v23;

  sub_1B9D51180();
  if (v2)
  {

    v6 = 4;
  }
  else
  {
    v6 = v5;
  }
  MEMORY[0x1E0C80A78](v5);
  v20 = a1;
  v7 = sub_1B9D50778(0x6B726F77747261, 0xE700000000000000, &type metadata for VisualAreaArtwork, sub_1B9DDAAD8, &v19);
  MEMORY[0x1E0C80A78](v7);
  v20 = a1;
  swift_retain();
  sub_1B9D50974();
  v9 = v8;
  v21 = v10;
  v22 = v11;
  v23 = v12;
  sub_1B9D51180();
  v14 = v13;
  v15 = OUTLINED_FUNCTION_2_6();
  OUTLINED_FUNCTION_6_10(v15);
  v16 = OUTLINED_FUNCTION_10_5();
  OUTLINED_FUNCTION_54(v16);
  result = OUTLINED_FUNCTION_12_8();
  *(_BYTE *)a2 = v6;
  *(_QWORD *)(a2 + 8) = v7;
  *(_BYTE *)(a2 + 16) = v14;
  v18 = v22;
  *(_QWORD *)(a2 + 24) = v23;
  *(_QWORD *)(a2 + 32) = v18;
  *(_QWORD *)(a2 + 40) = v9;
  *(_BYTE *)(a2 + 48) = v21 & 1;
  return result;
}

uint64_t sub_1B9DDA7DC()
{
  uint64_t v0;
  unsigned int v1;

  v0 = sub_1B9DE2820();
  swift_bridgeObjectRelease();
  if (v0 == 1)
    v1 = 1;
  else
    v1 = 2;
  if (v0)
    return v1;
  else
    return 0;
}

uint64_t sub_1B9DDA82C(char a1)
{
  if ((a1 & 1) != 0)
    return 0x6D6F74737563;
  else
    return 0x3630335F61657261;
}

double sub_1B9DDA864@<D0>(uint64_t a1@<X1>, uint64_t a2@<X8>)
{
  uint64_t v2;
  double result;
  __int128 v5;
  _OWORD v6[2];
  __int128 v7;
  char v8;

  VisualAreaArtwork.init(deserializing:using:)(a1, (uint64_t)v6);
  if (!v2)
  {
    v5 = v6[1];
    *(_OWORD *)a2 = v6[0];
    *(_OWORD *)(a2 + 16) = v5;
    result = *(double *)&v7;
    *(_OWORD *)(a2 + 32) = v7;
    *(_BYTE *)(a2 + 48) = v8;
  }
  return result;
}

void sub_1B9DDA8B0(char *a1, char *a2)
{
  sub_1B9D4DA08(*a1, *a2);
}

void sub_1B9DDA8BC()
{
  sub_1B9D41F4C();
}

uint64_t sub_1B9DDA8C4()
{
  return sub_1B9D4EB64();
}

void sub_1B9DDA8CC()
{
  sub_1B9D420B0();
}

uint64_t sub_1B9DDA8D4@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = sub_1B9DDA7DC();
  *a1 = result;
  return result;
}

uint64_t sub_1B9DDA900@<X0>(uint64_t *a1@<X8>)
{
  char *v1;
  uint64_t result;
  uint64_t v4;

  result = sub_1B9DDA82C(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t VisualAreaArtwork.LayoutConstraints.init(deserializing:using:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8;
  uint64_t v9;
  char v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v14;
  uint64_t v15;

  sub_1B9D51088(1684957547, 0xE400000000000000, (uint64_t)&type metadata for VisualAreaArtwork.LayoutConstraints, a4, a5, a6, a7, a8);
  if (!v8)
  {
    if ((v10 & 1) != 0)
    {
      OUTLINED_FUNCTION_7_29();
      OUTLINED_FUNCTION_7_29();
      v15 = v14;
      OUTLINED_FUNCTION_7_29();
      v9 = v15;
    }
    else
    {
      v9 = 0;
    }
  }
  v11 = OUTLINED_FUNCTION_2_6();
  OUTLINED_FUNCTION_1_6(v11);
  v12 = OUTLINED_FUNCTION_10_5();
  OUTLINED_FUNCTION_54(v12);
  return v9;
}

uint64_t sub_1B9DDAA70@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, uint64_t a9@<X8>)
{
  uint64_t v9;
  uint64_t result;
  uint64_t v12;
  uint64_t v13;
  char v14;

  result = VisualAreaArtwork.LayoutConstraints.init(deserializing:using:)(a1, a2, a3, a4, a5, a6, a7, a8);
  if (!v9)
  {
    *(_QWORD *)a9 = result;
    *(_QWORD *)(a9 + 8) = v12;
    *(_QWORD *)(a9 + 16) = v13;
    *(_BYTE *)(a9 + 24) = v14 & 1;
  }
  return result;
}

uint64_t sub_1B9DDAAA4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t result;
  uint64_t v5;
  uint64_t v6;
  char v7;
  char v8;

  result = sub_1B9DDA29C(a1, a2);
  *(_QWORD *)a3 = result;
  *(_QWORD *)(a3 + 8) = v5;
  *(_QWORD *)(a3 + 16) = v6;
  *(_BYTE *)(a3 + 24) = v7;
  *(_BYTE *)(a3 + 25) = v8 & 1;
  return result;
}

uint64_t sub_1B9DDAAD8@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v2;
  uint64_t result;

  result = sub_1B9DDA3A8(a1, *(_QWORD *)(v2 + 16), (void (*)(_QWORD))type metadata accessor for DynamicArtwork, DynamicArtwork.__allocating_init(deserializing:using:));
  *a2 = result;
  return result;
}

uint64_t sub_1B9DDAB10@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;

  return sub_1B9DDAAA4(a1, *(_QWORD *)(v2 + 16), a2);
}

uint64_t destroy for VisualAreaArtwork()
{
  return swift_release();
}

uint64_t initializeWithCopy for VisualAreaArtwork(uint64_t a1, uint64_t a2)
{
  *(_BYTE *)a1 = *(_BYTE *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  *(_OWORD *)(a1 + 33) = *(_OWORD *)(a2 + 33);
  swift_retain();
  return a1;
}

uint64_t assignWithCopy for VisualAreaArtwork(uint64_t a1, uint64_t a2)
{
  __int128 v4;

  *(_BYTE *)a1 = *(_BYTE *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  swift_retain();
  swift_release();
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
  v4 = *(_OWORD *)(a2 + 24);
  *(_OWORD *)(a1 + 33) = *(_OWORD *)(a2 + 33);
  *(_OWORD *)(a1 + 24) = v4;
  return a1;
}

uint64_t assignWithTake for VisualAreaArtwork(uint64_t a1, uint64_t a2)
{
  *(_BYTE *)a1 = *(_BYTE *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  swift_release();
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  *(_OWORD *)(a1 + 33) = *(_OWORD *)(a2 + 33);
  return a1;
}

uint64_t getEnumTagSinglePayload for VisualAreaArtwork(uint64_t a1, int a2)
{
  unint64_t v2;

  if (a2)
  {
    if (a2 < 0 && *(_BYTE *)(a1 + 49))
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

uint64_t storeEnumTagSinglePayload for VisualAreaArtwork(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_QWORD *)(result + 40) = 0;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_BYTE *)(result + 48) = 0;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 49) = 1;
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
    *(_BYTE *)(result + 49) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for VisualAreaArtwork()
{
  return &type metadata for VisualAreaArtwork;
}

__n128 __swift_memcpy25_8(uint64_t a1, uint64_t a2)
{
  __n128 result;

  result = *(__n128 *)a2;
  *(_OWORD *)(a1 + 9) = *(_OWORD *)(a2 + 9);
  *(__n128 *)a1 = result;
  return result;
}

uint64_t getEnumTagSinglePayload for VisualAreaArtwork.LayoutConstraints(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 25))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t storeEnumTagSinglePayload for VisualAreaArtwork.LayoutConstraints(uint64_t result, int a2, int a3)
{
  char v3;

  if (a2)
  {
    *(_QWORD *)result = 0;
    *(_QWORD *)(result + 8) = 0;
    *(_BYTE *)(result + 24) = 0;
    *(_QWORD *)(result + 16) = 0;
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
  *(_BYTE *)(result + 25) = v3;
  return result;
}

uint64_t sub_1B9DDAD2C(uint64_t a1)
{
  if (*(_BYTE *)(a1 + 24))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t sub_1B9DDAD48(uint64_t result, int a2)
{
  char v2;

  if (a2)
  {
    *(_QWORD *)(result + 8) = 0;
    *(_QWORD *)(result + 16) = 0;
    *(_QWORD *)result = (a2 - 1);
    v2 = 1;
  }
  else
  {
    v2 = 0;
  }
  *(_BYTE *)(result + 24) = v2;
  return result;
}

ValueMetadata *type metadata accessor for VisualAreaArtwork.LayoutConstraints()
{
  return &type metadata for VisualAreaArtwork.LayoutConstraints;
}

uint64_t storeEnumTagSinglePayload for VisualAreaArtwork.LayoutConstraints.Keys.Kind(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_1B9DDADC8 + 4 * byte_1B9DF5D85[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_1B9DDADFC + 4 * byte_1B9DF5D80[v4]))();
}

uint64_t sub_1B9DDADFC(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_1B9DDAE04(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x1B9DDAE0CLL);
  return result;
}

uint64_t sub_1B9DDAE18(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x1B9DDAE20);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_1B9DDAE24(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1B9DDAE2C(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for VisualAreaArtwork.LayoutConstraints.Keys.Kind()
{
  return &type metadata for VisualAreaArtwork.LayoutConstraints.Keys.Kind;
}

unint64_t sub_1B9DDAE4C()
{
  unint64_t result;

  result = qword_1EF243E68;
  if (!qword_1EF243E68)
  {
    result = MEMORY[0x1BCCCEEA8](&unk_1B9DF5E6C, &type metadata for VisualAreaArtwork.LayoutConstraints.Keys.Kind);
    atomic_store(result, (unint64_t *)&qword_1EF243E68);
  }
  return result;
}

uint64_t OUTLINED_FUNCTION_7_29()
{
  return sub_1B9DAB840();
}

uint64_t AlignableVisualAreaArtwork.accessibilityAlignment.getter()
{
  unsigned __int8 *v0;

  return *v0;
}

uint64_t AlignableVisualAreaArtwork.artwork.getter()
{
  return swift_retain();
}

uint64_t AlignableVisualAreaArtwork.sizeConstraints.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_1B9D47998(v1 + 16, a1);
}

uint64_t AlignableVisualAreaArtwork.horizontalAlignment.getter()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + 56);
}

uint64_t AlignableVisualAreaArtwork.init(artwork:sizeConstraints:horizontalAlignment:accessibilityAlignment:)@<X0>(uint64_t a1@<X0>, __int128 *a2@<X1>, char a3@<W2>, char a4@<W3>, uint64_t a5@<X8>)
{
  uint64_t result;

  *(_QWORD *)(a5 + 8) = a1;
  result = sub_1B9D440BC(a2, a5 + 16);
  *(_BYTE *)(a5 + 56) = a3;
  *(_BYTE *)a5 = a4;
  return result;
}

uint64_t sub_1B9DDAEFC()
{
  return swift_retain();
}

uint64_t sub_1B9DDAF04@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_1B9D47998(v1 + 16, a1);
}

id AlignableVisualAreaImageViewContainer.visualAreaImageView.getter()
{
  uint64_t v0;

  return objc_retain(*(id *)(v0
                           + OBJC_IVAR____TtC27AppleMediaServicesUIDynamic37AlignableVisualAreaImageViewContainer_visualAreaImageView));
}

void AlignableVisualAreaImageViewContainer.horizontalAlignment.getter()
{
  OUTLINED_FUNCTION_0_66();
  OUTLINED_FUNCTION_13_4();
}

void AlignableVisualAreaImageViewContainer.horizontalAlignment.setter(char a1)
{
  uint64_t v1;
  _BYTE *v3;

  v3 = (_BYTE *)(v1
               + OBJC_IVAR____TtC27AppleMediaServicesUIDynamic37AlignableVisualAreaImageViewContainer_horizontalAlignment);
  OUTLINED_FUNCTION_6_5();
  *v3 = a1;
  OUTLINED_FUNCTION_13_4();
}

uint64_t (*AlignableVisualAreaImageViewContainer.horizontalAlignment.modify())()
{
  OUTLINED_FUNCTION_6_5();
  return j__swift_endAccess;
}

void AlignableVisualAreaImageViewContainer.accessibilityAlignment.getter()
{
  OUTLINED_FUNCTION_0_66();
  OUTLINED_FUNCTION_13_4();
}

void AlignableVisualAreaImageViewContainer.accessibilityAlignment.setter(char a1)
{
  uint64_t v1;
  _BYTE *v3;

  v3 = (_BYTE *)(v1
               + OBJC_IVAR____TtC27AppleMediaServicesUIDynamic37AlignableVisualAreaImageViewContainer_accessibilityAlignment);
  OUTLINED_FUNCTION_6_5();
  *v3 = a1;
  OUTLINED_FUNCTION_13_4();
}

uint64_t (*AlignableVisualAreaImageViewContainer.accessibilityAlignment.modify())()
{
  OUTLINED_FUNCTION_6_5();
  return j_j__swift_endAccess;
}

uint64_t sub_1B9DDB078()
{
  char *v0;
  char *v1;
  id v2;
  char v3;
  char *v4;
  uint64_t result;
  char *v6;

  v1 = v0;
  v2 = objc_msgSend(v0, sel_traitCollection);
  v3 = sub_1B9DE252C();

  if ((v3 & 1) != 0)
  {
    v4 = &v1[OBJC_IVAR____TtC27AppleMediaServicesUIDynamic37AlignableVisualAreaImageViewContainer_accessibilityAlignment];
    OUTLINED_FUNCTION_3_5();
    result = *v4;
    if ((_DWORD)result != 4)
      return result;
    v6 = &v1[OBJC_IVAR____TtC27AppleMediaServicesUIDynamic37AlignableVisualAreaImageViewContainer_horizontalAlignment];
  }
  else
  {
    v6 = &v1[OBJC_IVAR____TtC27AppleMediaServicesUIDynamic37AlignableVisualAreaImageViewContainer_horizontalAlignment];
  }
  OUTLINED_FUNCTION_0_66();
  return *v6;
}

void *VisualAreaImageView.SizeConstraints.zero.unsafeMutableAddressor()
{
  return &static VisualAreaImageView.SizeConstraints.zero;
}

char *AlignableVisualAreaImageViewContainer.__allocating_init(artworkSize:sizeConstraints:horizontalAlignment:accessibilityAlignment:)(uint64_t a1, char a2, char a3)
{
  objc_class *v3;
  id v7;

  OUTLINED_FUNCTION_71_2();
  v7 = objc_allocWithZone(v3);
  return AlignableVisualAreaImageViewContainer.init(artworkSize:sizeConstraints:horizontalAlignment:accessibilityAlignment:)(a1, a2, a3);
}

char *AlignableVisualAreaImageViewContainer.init(artworkSize:sizeConstraints:horizontalAlignment:accessibilityAlignment:)(uint64_t a1, char a2, char a3)
{
  _BYTE *v3;
  _BYTE *v7;
  uint64_t v8;
  _BYTE *v9;
  char *v10;
  objc_super v12;
  _BYTE v13[40];

  OUTLINED_FUNCTION_71_2();
  v7 = &v3[OBJC_IVAR____TtC27AppleMediaServicesUIDynamic37AlignableVisualAreaImageViewContainer_accessibilityAlignment];
  v3[OBJC_IVAR____TtC27AppleMediaServicesUIDynamic37AlignableVisualAreaImageViewContainer_accessibilityAlignment] = 4;
  sub_1B9D47998(v8, (uint64_t)v13);
  objc_allocWithZone((Class)type metadata accessor for VisualAreaImageView());
  v9 = v3;
  *(_QWORD *)&v9[OBJC_IVAR____TtC27AppleMediaServicesUIDynamic37AlignableVisualAreaImageViewContainer_visualAreaImageView] = sub_1B9DDBB68((uint64_t)v13);
  v9[OBJC_IVAR____TtC27AppleMediaServicesUIDynamic37AlignableVisualAreaImageViewContainer_horizontalAlignment] = a2;
  OUTLINED_FUNCTION_6_5();
  *v7 = a3;

  v12.receiver = v9;
  v12.super_class = (Class)type metadata accessor for AlignableVisualAreaImageViewContainer();
  v10 = (char *)OUTLINED_FUNCTION_19_11(&v12, sel_initWithFrame_);
  objc_msgSend(v10, sel_addSubview_, *(_QWORD *)&v10[OBJC_IVAR____TtC27AppleMediaServicesUIDynamic37AlignableVisualAreaImageViewContainer_visualAreaImageView]);
  __swift_destroy_boxed_opaque_existential_2(a1);
  return v10;
}

uint64_t type metadata accessor for VisualAreaImageView()
{
  return objc_opt_self();
}

void sub_1B9DDB2A8()
{
  _BYTE *v0;

  v0[OBJC_IVAR____TtC27AppleMediaServicesUIDynamic37AlignableVisualAreaImageViewContainer_accessibilityAlignment] = 4;

  OUTLINED_FUNCTION_10_20();
  __break(1u);
}

Swift::Void __swiftcall AlignableVisualAreaImageViewContainer.layoutSubviews()()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  objc_class *v6;
  char *v7;
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  void *v13;
  double Width;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  char v29;
  id v30;
  char v31;
  _QWORD v32[3];
  uint64_t v33;
  objc_super v34;
  CGRect v35;

  OUTLINED_FUNCTION_31_1();
  OUTLINED_FUNCTION_39();
  MEMORY[0x1E0C80A78](v5);
  OUTLINED_FUNCTION_2_2();
  v6 = (objc_class *)type metadata accessor for AlignableVisualAreaImageViewContainer();
  v34.receiver = v0;
  v34.super_class = v6;
  objc_msgSendSuper2(&v34, sel_layoutSubviews);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED5CFBE0);
  OUTLINED_FUNCTION_18_19();
  *(_OWORD *)(OUTLINED_FUNCTION_141() + 16) = xmmword_1B9DEFC60;
  v33 = (uint64_t)v6;
  v32[0] = v0;
  v7 = v0;
  v8 = (id)AMSLogKey();
  if (v8)
  {
    v9 = v8;
    v10 = sub_1B9DE2160();

    OUTLINED_FUNCTION_11_7();
    OUTLINED_FUNCTION_0_3();
    __swift_project_boxed_opaque_existential_2(v32, v33);
    OUTLINED_FUNCTION_4_2();
    swift_getMetatypeMetadata();
    OUTLINED_FUNCTION_39_10();
    OUTLINED_FUNCTION_38_9();
    OUTLINED_FUNCTION_7_1();
  }
  else
  {
    OUTLINED_FUNCTION_6_2();
    OUTLINED_FUNCTION_0_3();
    __swift_project_boxed_opaque_existential_2(v32, v33);
    v10 = OUTLINED_FUNCTION_4_2();
    swift_getMetatypeMetadata();
  }
  OUTLINED_FUNCTION_39_10();
  OUTLINED_FUNCTION_38_9();
  OUTLINED_FUNCTION_23_1();
  OUTLINED_FUNCTION_36_1();
  OUTLINED_FUNCTION_38_0();
  __swift_destroy_boxed_opaque_existential_2((uint64_t)v32);
  sub_1B9DE1860();
  OUTLINED_FUNCTION_6_25();
  OUTLINED_FUNCTION_28_7();
  type metadata accessor for CGRect(0);
  v33 = v11;
  v12 = (_QWORD *)swift_allocObject();
  v32[0] = v12;
  v12[2] = v1;
  v12[3] = v2;
  v12[4] = v3;
  v12[5] = v4;
  sub_1B9DE18CC();
  OUTLINED_FUNCTION_5_1();
  sub_1B9DB0344();
  OUTLINED_FUNCTION_38();
  v13 = *(void **)&v7[OBJC_IVAR____TtC27AppleMediaServicesUIDynamic37AlignableVisualAreaImageViewContainer_visualAreaImageView];
  OUTLINED_FUNCTION_6_25();
  Width = CGRectGetWidth(v35);
  VisualAreaImageView.updateArtworkSizeForMaxWidth(_:)(Width);
  OUTLINED_FUNCTION_6_25();
  objc_msgSend(v13, sel_measurementsWithFitting_in_, v7, v15, v16, v10);
  v18 = v17;
  v20 = v19;
  OUTLINED_FUNCTION_6_25();
  v22 = v21;
  v24 = v23;
  v26 = v25;
  v28 = v27;
  v29 = sub_1B9DDB078();
  v30 = objc_msgSend(v7, sel_traitCollection);
  sub_1B9D89EC8(v29);
  CGRect.alignedFrame(for:resolvedHorizontalAlignment:)(v31, v18, v20, v22, v24, v26, v28);
  OUTLINED_FUNCTION_28_7();

  OUTLINED_FUNCTION_6_25();
  sub_1B9DE2544();
  objc_msgSend(v13, sel_setFrame_);
}

uint64_t AlignableVisualAreaImageViewContainer.apply(model:asPartOf:)(unsigned __int8 *a1, uint64_t a2)
{
  uint64_t v2;
  int v5;
  _BYTE *v6;
  int v7;
  _BYTE *v8;

  v5 = a1[56];
  if (v5 != 4)
  {
    v6 = (_BYTE *)(v2
                 + OBJC_IVAR____TtC27AppleMediaServicesUIDynamic37AlignableVisualAreaImageViewContainer_horizontalAlignment);
    OUTLINED_FUNCTION_6_5();
    *v6 = v5;
  }
  v7 = *a1;
  if (v7 != 4)
  {
    v8 = (_BYTE *)(v2
                 + OBJC_IVAR____TtC27AppleMediaServicesUIDynamic37AlignableVisualAreaImageViewContainer_accessibilityAlignment);
    OUTLINED_FUNCTION_6_5();
    *v8 = v7;
  }
  return sub_1B9DDC80C((uint64_t)a1, a2, *(void **)(v2+ OBJC_IVAR____TtC27AppleMediaServicesUIDynamic37AlignableVisualAreaImageViewContainer_visualAreaImageView));
}

id AlignableVisualAreaImageViewContainer.hasContent.getter()
{
  uint64_t v0;

  return objc_msgSend(*(id *)(v0+ OBJC_IVAR____TtC27AppleMediaServicesUIDynamic37AlignableVisualAreaImageViewContainer_visualAreaImageView), sel_hasContent);
}

id _s27AppleMediaServicesUIDynamic37AlignableVisualAreaImageViewContainerC12sizeThatFitsySo6CGSizeVAFF_0()
{
  void *v0;

  return objc_msgSend(v0, sel_measurementsWithFitting_in_, v0);
}

id AlignableVisualAreaImageViewContainer.measurements(fitting:in:)(uint64_t a1, double a2, double a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v8;
  uint64_t v9;
  _QWORD v11[3];
  uint64_t v12;

  OUTLINED_FUNCTION_31_1();
  OUTLINED_FUNCTION_39();
  MEMORY[0x1E0C80A78](v8);
  OUTLINED_FUNCTION_2_2();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED5CFBE0);
  OUTLINED_FUNCTION_18_19();
  OUTLINED_FUNCTION_21_14();
  *(_OWORD *)(OUTLINED_FUNCTION_141() + 16) = xmmword_1B9DEFC60;
  v12 = type metadata accessor for AlignableVisualAreaImageViewContainer();
  OUTLINED_FUNCTION_37_8();
  if ((id)OUTLINED_FUNCTION_32_12())
  {
    sub_1B9DE2160();
    OUTLINED_FUNCTION_30_2();
    OUTLINED_FUNCTION_11_7();
    OUTLINED_FUNCTION_0_3();
    __swift_project_boxed_opaque_existential_2(v11, v12);
    OUTLINED_FUNCTION_4_2();
    swift_getMetatypeMetadata();
    OUTLINED_FUNCTION_11_1();
    OUTLINED_FUNCTION_5_1();
    OUTLINED_FUNCTION_7_1();
  }
  else
  {
    OUTLINED_FUNCTION_6_2();
    OUTLINED_FUNCTION_0_3();
    __swift_project_boxed_opaque_existential_2(v11, v12);
    v4 = OUTLINED_FUNCTION_4_2();
    swift_getMetatypeMetadata();
  }
  OUTLINED_FUNCTION_11_1();
  OUTLINED_FUNCTION_5_1();
  OUTLINED_FUNCTION_23_1();
  OUTLINED_FUNCTION_36_1();
  OUTLINED_FUNCTION_38_0();
  OUTLINED_FUNCTION_36_7();
  sub_1B9DE1860();
  type metadata accessor for CGSize(0);
  v12 = v9;
  *(double *)v11 = a2;
  *(double *)&v11[1] = a3;
  OUTLINED_FUNCTION_33_10();
  sub_1B9D44EF4((uint64_t)v11);
  sub_1B9DB0344();
  OUTLINED_FUNCTION_38();
  return objc_msgSend(*(id *)(v3+ OBJC_IVAR____TtC27AppleMediaServicesUIDynamic37AlignableVisualAreaImageViewContainer_visualAreaImageView), sel_measurementsWithFitting_in_, a1, a2, a3, v4);
}

void AlignableVisualAreaImageViewContainer.init()()
{
  OUTLINED_FUNCTION_30_8();
  __break(1u);
}

void AlignableVisualAreaImageViewContainer.init(frame:)()
{
  sub_1B9DDC75C();
}

id AlignableVisualAreaImageViewContainer.__deallocating_deinit()
{
  return sub_1B9DDC790(type metadata accessor for AlignableVisualAreaImageViewContainer);
}

double static VisualAreaImageView.SizeConstraints.area3064(maxWidth:)()
{
  return 60.0;
}

double static VisualAreaImageView.SizeConstraints.zero.getter()
{
  return 0.0;
}

void VisualAreaImageView.SizeConstraints.maxHeight.setter(double a1)
{
  double *v1;

  *v1 = a1;
}

uint64_t (*VisualAreaImageView.SizeConstraints.maxHeight.modify())(_QWORD)
{
  return nullsub_1;
}

double VisualAreaImageView.SizeConstraints.maxWidth.getter(double a1, double a2)
{
  return a2;
}

void VisualAreaImageView.SizeConstraints.maxWidth.setter(double a1)
{
  uint64_t v1;

  *(double *)(v1 + 8) = a1;
}

uint64_t (*VisualAreaImageView.SizeConstraints.maxWidth.modify())(_QWORD)
{
  return nullsub_1;
}

double VisualAreaImageView.SizeConstraints.visualAreaAllotted.getter(double a1, double a2, double a3)
{
  return a3;
}

void VisualAreaImageView.SizeConstraints.visualAreaAllotted.setter(double a1)
{
  uint64_t v1;

  *(double *)(v1 + 16) = a1;
}

uint64_t (*VisualAreaImageView.SizeConstraints.visualAreaAllotted.modify())(_QWORD)
{
  return nullsub_1;
}

void sub_1B9DDBB48(double a1)
{
  double *v1;

  *v1 = a1;
}

void sub_1B9DDBB50(double a1)
{
  uint64_t v1;

  *(double *)(v1 + 8) = a1;
}

uint64_t (*sub_1B9DDBB58())(_QWORD)
{
  return nullsub_1;
}

char *sub_1B9DDBB68(uint64_t a1)
{
  char *v1;
  uint64_t v2;
  uint64_t v3;
  char *v5;
  objc_class *v6;
  id v7;
  char *v8;
  char *v9;
  char *v10;
  char *v11;
  objc_super v13;

  OUTLINED_FUNCTION_71_2();
  v5 = &v1[OBJC_IVAR____TtC27AppleMediaServicesUIDynamic19VisualAreaImageView_applyCachedArtwork];
  v6 = (objc_class *)type metadata accessor for ArtworkImageView();
  *(_QWORD *)v5 = 0;
  *((_QWORD *)v5 + 1) = 0;
  v7 = objc_allocWithZone(v6);
  v8 = v1;
  *(_QWORD *)&v8[OBJC_IVAR____TtC27AppleMediaServicesUIDynamic19VisualAreaImageView_artworkImageView] = ArtworkImageView.init(artworkSize:frame:)();
  v9 = &v8[OBJC_IVAR____TtC27AppleMediaServicesUIDynamic19VisualAreaImageView_artworkSize];
  *(_QWORD *)v9 = v3;
  *((_QWORD *)v9 + 1) = v2;
  sub_1B9D47998(a1, (uint64_t)&v8[OBJC_IVAR____TtC27AppleMediaServicesUIDynamic19VisualAreaImageView_sizeConstraints]);

  v13.receiver = v8;
  v13.super_class = (Class)type metadata accessor for VisualAreaImageView();
  v10 = (char *)OUTLINED_FUNCTION_19_11(&v13, sel_initWithFrame_);
  v11 = &v10[OBJC_IVAR____TtC27AppleMediaServicesUIDynamic19VisualAreaImageView_artworkImageView];
  OUTLINED_FUNCTION_3_5();
  objc_msgSend(v10, sel_addSubview_, *(_QWORD *)v11);
  __swift_destroy_boxed_opaque_existential_2(a1);
  return v10;
}

uint64_t type metadata accessor for AlignableVisualAreaImageViewContainer()
{
  return objc_opt_self();
}

uint64_t sub_1B9DDBC8C()
{
  return swift_deallocObject();
}

void sub_1B9DDBC9C()
{
  char *v0;
  char *v1;

  v1 = &v0[OBJC_IVAR____TtC27AppleMediaServicesUIDynamic19VisualAreaImageView_applyCachedArtwork];
  *(_QWORD *)v1 = 0;
  *((_QWORD *)v1 + 1) = 0;

  OUTLINED_FUNCTION_10_20();
  __break(1u);
}

void sub_1B9DDBD08(id *a1)
{
  sub_1B9DDBD68(*a1);
}

id VisualAreaImageView.artworkImageView.getter()
{
  uint64_t v0;
  id *v1;

  v1 = (id *)(v0 + OBJC_IVAR____TtC27AppleMediaServicesUIDynamic19VisualAreaImageView_artworkImageView);
  OUTLINED_FUNCTION_0_66();
  return *v1;
}

void sub_1B9DDBD68(void *a1)
{
  uint64_t v1;
  void **v3;
  void *v4;

  v3 = (void **)(v1 + OBJC_IVAR____TtC27AppleMediaServicesUIDynamic19VisualAreaImageView_artworkImageView);
  OUTLINED_FUNCTION_6_5();
  v4 = *v3;
  *v3 = a1;

  OUTLINED_FUNCTION_13_4();
}

void sub_1B9DDBDAC(uint64_t a1)
{
  __int128 v1[2];

  sub_1B9D47998(a1, (uint64_t)v1);
  sub_1B9DDBE24(v1);
}

void VisualAreaImageView.sizeConstraints.getter(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;

  v3 = v1 + OBJC_IVAR____TtC27AppleMediaServicesUIDynamic19VisualAreaImageView_sizeConstraints;
  OUTLINED_FUNCTION_3_5();
  sub_1B9D47998(v3, a1);
  OUTLINED_FUNCTION_13_4();
}

void sub_1B9DDBE24(__int128 *a1)
{
  uint64_t v1;
  uint64_t v3;

  v3 = v1 + OBJC_IVAR____TtC27AppleMediaServicesUIDynamic19VisualAreaImageView_sizeConstraints;
  OUTLINED_FUNCTION_6_5();
  __swift_destroy_boxed_opaque_existential_2(v3);
  sub_1B9D440BC(a1, v3);
  swift_endAccess();
  OUTLINED_FUNCTION_13_4();
}

uint64_t sub_1B9DDBE78()
{
  return sub_1B9DDBED4();
}

double VisualAreaImageView.artworkSize.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = v0 + OBJC_IVAR____TtC27AppleMediaServicesUIDynamic19VisualAreaImageView_artworkSize;
  OUTLINED_FUNCTION_0_66();
  return *(double *)v1;
}

uint64_t sub_1B9DDBED4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;
  uint64_t result;

  OUTLINED_FUNCTION_71_2();
  v3 = (_QWORD *)(v0 + OBJC_IVAR____TtC27AppleMediaServicesUIDynamic19VisualAreaImageView_artworkSize);
  result = OUTLINED_FUNCTION_6_5();
  *v3 = v2;
  v3[1] = v1;
  return result;
}

Swift::Void __swiftcall VisualAreaImageView.layoutSubviews()()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  objc_class *v3;
  uint64_t v4;
  char *v5;
  void **v6;
  void *v7;
  id v8;
  objc_super v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t MetatypeMetadata;
  _QWORD v13[3];
  objc_class *v14;

  OUTLINED_FUNCTION_31_1();
  OUTLINED_FUNCTION_39();
  MEMORY[0x1E0C80A78](v2);
  OUTLINED_FUNCTION_2_2();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED5CFBE0);
  sub_1B9DE18FC();
  OUTLINED_FUNCTION_21_14();
  *(_OWORD *)(swift_allocObject() + 16) = xmmword_1B9DEFE80;
  v3 = (objc_class *)type metadata accessor for VisualAreaImageView();
  v14 = v3;
  OUTLINED_FUNCTION_37_8();
  if ((id)OUTLINED_FUNCTION_32_12())
  {
    sub_1B9DE2160();
    OUTLINED_FUNCTION_30_2();
    OUTLINED_FUNCTION_11_7();
    OUTLINED_FUNCTION_0_3();
    __swift_project_boxed_opaque_existential_2(v13, (uint64_t)v14);
    OUTLINED_FUNCTION_4_2();
    swift_getMetatypeMetadata();
    OUTLINED_FUNCTION_11_1();
    OUTLINED_FUNCTION_5_1();
    OUTLINED_FUNCTION_7_1();
    MetatypeMetadata = MEMORY[0x1E0DEA968];
    v10 = v0;
    v11 = v1;
  }
  else
  {
    OUTLINED_FUNCTION_6_2();
    OUTLINED_FUNCTION_0_3();
    __swift_project_boxed_opaque_existential_2(v13, (uint64_t)v14);
    v4 = OUTLINED_FUNCTION_4_2();
    MetatypeMetadata = swift_getMetatypeMetadata();
    v10 = v4;
  }
  OUTLINED_FUNCTION_11_1();
  OUTLINED_FUNCTION_5_1();
  OUTLINED_FUNCTION_23_1();
  OUTLINED_FUNCTION_36_1();
  OUTLINED_FUNCTION_38_0();
  OUTLINED_FUNCTION_36_7();
  v14 = v3;
  v5 = (char *)OUTLINED_FUNCTION_37_8();
  OUTLINED_FUNCTION_33_10();
  sub_1B9D44EF4((uint64_t)v13);
  sub_1B9DB0344();
  swift_bridgeObjectRelease();
  v9.receiver = v5;
  v9.super_class = v3;
  objc_msgSendSuper2(&v9, sel_layoutSubviews);
  v6 = (void **)&v5[OBJC_IVAR____TtC27AppleMediaServicesUIDynamic19VisualAreaImageView_artworkImageView];
  OUTLINED_FUNCTION_0_66();
  v7 = *v6;
  OUTLINED_FUNCTION_0_66();
  v8 = v7;
  objc_msgSend(v8, sel_frame);
  objc_msgSend(v8, sel_setFrame_);

}

double VisualAreaImageView.measurements(fitting:in:)(double a1)
{
  return _s27AppleMediaServicesUIDynamic19VisualAreaImageViewC12sizeThatFitsySo6CGSizeVAFF_0(a1);
}

void VisualAreaImageView.hasContent.getter()
{
  uint64_t v0;
  id *v1;

  v1 = (id *)(v0 + OBJC_IVAR____TtC27AppleMediaServicesUIDynamic19VisualAreaImageView_artworkImageView);
  OUTLINED_FUNCTION_0_66();
  objc_msgSend(*v1, sel_hasContent);
  OUTLINED_FUNCTION_13_4();
}

void VisualAreaImageView.updateArtworkSizeForMaxWidth(_:)(double a1)
{
  char *v1;
  uint64_t v3;
  double *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  uint64_t v10;
  void *v11;
  char *v12;
  id v13;
  void *v14;
  uint64_t MetatypeMetadata;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  __int128 v19;
  uint64_t v20;

  OUTLINED_FUNCTION_31_1();
  OUTLINED_FUNCTION_39();
  MEMORY[0x1E0C80A78](v3);
  v4 = (double *)&v1[OBJC_IVAR____TtC27AppleMediaServicesUIDynamic19VisualAreaImageView_artworkSize];
  OUTLINED_FUNCTION_6_5();
  v5 = *v4;
  v6 = v4[1];
  v7 = _s27AppleMediaServicesUIDynamic19VisualAreaImageViewC12sizeThatFitsySo6CGSizeVAFF_0(a1);
  *v4 = v7;
  v4[1] = v8;
  if (v5 != v7 || v6 != v8)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1ED5CFBE0);
    v10 = OUTLINED_FUNCTION_18_19();
    v11 = (void *)((*(unsigned __int8 *)(*(_QWORD *)(v10 - 8) + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(v10 - 8) + 80));
    *(_OWORD *)(OUTLINED_FUNCTION_141() + 16) = xmmword_1B9DF0AA0;
    v20 = type metadata accessor for VisualAreaImageView();
    *(_QWORD *)&v19 = v1;
    v12 = v1;
    v13 = (id)OUTLINED_FUNCTION_32_12();
    if (v13)
    {
      v14 = v13;
      sub_1B9DE2160();

      OUTLINED_FUNCTION_11_7();
      OUTLINED_FUNCTION_24_12();
      __swift_project_boxed_opaque_existential_2(&v19, v20);
      OUTLINED_FUNCTION_4_2();
      MetatypeMetadata = swift_getMetatypeMetadata();
      OUTLINED_FUNCTION_17_19(MetatypeMetadata);
      OUTLINED_FUNCTION_30_9();
      OUTLINED_FUNCTION_7_1();
      sub_1B9DE1884();
    }
    else
    {
      sub_1B9DE18A8();
      OUTLINED_FUNCTION_24_12();
      __swift_project_boxed_opaque_existential_2(&v19, v20);
      OUTLINED_FUNCTION_4_2();
      v16 = swift_getMetatypeMetadata();
      OUTLINED_FUNCTION_17_19(v16);
    }
    OUTLINED_FUNCTION_30_9();
    sub_1B9DE189C();
    sub_1B9DE18C0();
    OUTLINED_FUNCTION_38_0();
    __swift_destroy_boxed_opaque_existential_2((uint64_t)&v19);
    sub_1B9DE1860();
    type metadata accessor for CGSize(0);
    v18 = v17;
    v20 = v17;
    *(double *)&v19 = v5;
    *((double *)&v19 + 1) = v6;
    sub_1B9DE18CC();
    sub_1B9D44EF4((uint64_t)&v19);
    sub_1B9DE1860();
    v20 = v18;
    v19 = *(_OWORD *)v4;
    sub_1B9DE18CC();
    sub_1B9D44EF4((uint64_t)&v19);
    sub_1B9DB0384();
    OUTLINED_FUNCTION_38();
    objc_msgSend(v11, sel_setNeedsLayout);
  }
}

double _s27AppleMediaServicesUIDynamic19VisualAreaImageViewC12sizeThatFitsySo6CGSizeVAFF_0(double a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  double v5;
  double v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  double *v10;
  double v11;
  double v12;
  _QWORD v14[3];
  uint64_t v15;
  uint64_t v16;

  v2 = v1;
  v4 = v1 + OBJC_IVAR____TtC27AppleMediaServicesUIDynamic19VisualAreaImageView_sizeConstraints;
  OUTLINED_FUNCTION_3_5();
  sub_1B9D47998(v4, (uint64_t)v14);
  if (a1 <= 0.0)
  {
    __swift_project_boxed_opaque_existential_2(v14, v15);
    OUTLINED_FUNCTION_20_11();
    a1 = v5;
  }
  __swift_project_boxed_opaque_existential_2(v14, v15);
  OUTLINED_FUNCTION_20_11();
  if (v6 < a1)
    a1 = v6;
  v7 = v15;
  v8 = v16;
  __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v14, v15);
  (*(void (**)(uint64_t, uint64_t, double))(v8 + 40))(v7, v8, a1);
  v9 = (_QWORD *)(v2 + OBJC_IVAR____TtC27AppleMediaServicesUIDynamic19VisualAreaImageView_artworkImageView);
  OUTLINED_FUNCTION_0_66();
  v10 = (double *)(*v9 + OBJC_IVAR____TtC27AppleMediaServicesUIDynamic16ArtworkImageView_artworkSize);
  OUTLINED_FUNCTION_0_66();
  CGSize.sizeWithVisualAreaConstraints(_:)(v14, *v10, v10[1]);
  v12 = v11;
  __swift_destroy_boxed_opaque_existential_2((uint64_t)v14);
  return v12;
}

uint64_t VisualAreaImageView.apply(model:asPartOf:)(_QWORD *a1, uint64_t a2)
{
  void *v2;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;

  v4 = a1[3];
  v5 = a1[4];
  v6 = __swift_project_boxed_opaque_existential_2(a1, v4);
  return sub_1B9DDCE9C((uint64_t)v6, a2, v2, v4, v5);
}

id VisualAreaImageView.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

void VisualAreaImageView.init()()
{
  OUTLINED_FUNCTION_30_8();
  __break(1u);
}

id _s27AppleMediaServicesUIDynamic37AlignableVisualAreaImageViewContainerC5frameACSo6CGRectV_tcfC_0(double a1, double a2, double a3, double a4)
{
  objc_class *v4;

  return objc_msgSend(objc_allocWithZone(v4), sel_initWithFrame_, a1, a2, a3, a4);
}

void VisualAreaImageView.init(frame:)()
{
  sub_1B9DDC75C();
}

void sub_1B9DDC75C()
{
  OUTLINED_FUNCTION_30_8();
  __break(1u);
}

id VisualAreaImageView.__deallocating_deinit()
{
  return sub_1B9DDC790(type metadata accessor for VisualAreaImageView);
}

id sub_1B9DDC790(uint64_t (*a1)(void))
{
  void *v1;
  objc_super v3;

  v3.receiver = v1;
  v3.super_class = (Class)a1();
  return objc_msgSendSuper2(&v3, sel_dealloc);
}

uint64_t sub_1B9DDC80C(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t DynamicType;
  uint64_t v14;
  _QWORD *v15;
  uint64_t *boxed_opaque_existential_2Tm;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  double v20;
  double v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  char *v26;
  char *v27;
  id v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  ValueMetadata *v37;
  id *v38;
  id v39;
  id v40;
  id v41;
  ValueMetadata *v43;
  __int128 v44;
  ValueMetadata *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t MetatypeMetadata;
  _QWORD v49[6];

  v5 = sub_1B9DE18B4();
  MEMORY[0x1E0C80A78](v5);
  v49[3] = &type metadata for AlignableVisualAreaArtwork;
  v49[4] = &protocol witness table for AlignableVisualAreaArtwork;
  v6 = swift_allocObject();
  v49[0] = v6;
  sub_1B9DDD814(a1, v6 + 16);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED5CFBE0);
  sub_1B9DE18FC();
  *(_OWORD *)(swift_allocObject() + 16) = xmmword_1B9DEFC60;
  v43 = (ValueMetadata *)type metadata accessor for VisualAreaImageView();
  v45 = v43;
  *(_QWORD *)&v44 = a3;
  v7 = a3;
  v8 = (id)AMSLogKey();
  if (v8)
  {
    v9 = v8;
    v10 = sub_1B9DE2160();
    v12 = v11;

    sub_1B9DE18A8();
    sub_1B9DE189C();
    __swift_project_boxed_opaque_existential_2(&v44, (uint64_t)v45);
    DynamicType = swift_getDynamicType();
    MetatypeMetadata = swift_getMetatypeMetadata();
    v46 = DynamicType;
    sub_1B9DE1884();
    sub_1B9D44EF4((uint64_t)&v46);
    sub_1B9DE189C();
    MetatypeMetadata = MEMORY[0x1E0DEA968];
    v46 = v10;
    v47 = v12;
  }
  else
  {
    sub_1B9DE18A8();
    sub_1B9DE189C();
    __swift_project_boxed_opaque_existential_2(&v44, (uint64_t)v45);
    v14 = swift_getDynamicType();
    MetatypeMetadata = swift_getMetatypeMetadata();
    v46 = v14;
  }
  sub_1B9DE1884();
  sub_1B9D44EF4((uint64_t)&v46);
  sub_1B9DE189C();
  sub_1B9DE18C0();
  type metadata accessor for Log();
  __swift_destroy_boxed_opaque_existential_2((uint64_t)&v44);
  sub_1B9DE1860();
  v15 = __swift_project_boxed_opaque_existential_2(v49, (uint64_t)&type metadata for AlignableVisualAreaArtwork);
  v45 = &type metadata for AlignableVisualAreaArtwork;
  boxed_opaque_existential_2Tm = __swift_allocate_boxed_opaque_existential_2Tm((uint64_t *)&v44);
  initializeWithCopy for AlignableVisualAreaArtwork((uint64_t)boxed_opaque_existential_2Tm, (uint64_t)v15);
  sub_1B9DE18CC();
  sub_1B9D44EF4((uint64_t)&v44);
  sub_1B9DB0384();
  swift_bridgeObjectRelease();
  v17 = *(_QWORD *)(v6 + 24);
  sub_1B9D47998(v6 + 32, (uint64_t)&v44);
  v18 = (uint64_t)&v7[OBJC_IVAR____TtC27AppleMediaServicesUIDynamic19VisualAreaImageView_sizeConstraints];
  swift_beginAccess();
  swift_retain();
  __swift_destroy_boxed_opaque_existential_2(v18);
  sub_1B9D440BC(&v44, v18);
  swift_endAccess();
  v19 = *(_QWORD *)(v17 + 24);
  v20 = *(double *)(v19 + 32);
  v21 = *(double *)(v19 + 40);
  sub_1B9D47998(v18, (uint64_t)&v44);
  CGSize.sizeWithVisualAreaConstraints(_:)(&v44, v20, v21);
  v23 = v22;
  v25 = v24;
  __swift_destroy_boxed_opaque_existential_2((uint64_t)&v44);
  v26 = &v7[OBJC_IVAR____TtC27AppleMediaServicesUIDynamic19VisualAreaImageView_artworkSize];
  swift_beginAccess();
  *(_QWORD *)v26 = v23;
  *((_QWORD *)v26 + 1) = v25;
  *(_OWORD *)(swift_allocObject() + 16) = xmmword_1B9DEFC60;
  v45 = v43;
  *(_QWORD *)&v44 = v7;
  v27 = v7;
  v28 = (id)AMSLogKey();
  if (v28)
  {
    v29 = v28;
    v30 = sub_1B9DE2160();
    v32 = v31;

    sub_1B9DE18A8();
    sub_1B9DE189C();
    __swift_project_boxed_opaque_existential_2(&v44, (uint64_t)v45);
    v33 = swift_getDynamicType();
    MetatypeMetadata = swift_getMetatypeMetadata();
    v46 = v33;
    sub_1B9DE1884();
    sub_1B9D44EF4((uint64_t)&v46);
    sub_1B9DE189C();
    MetatypeMetadata = MEMORY[0x1E0DEA968];
    v46 = v30;
    v47 = v32;
  }
  else
  {
    sub_1B9DE18A8();
    sub_1B9DE189C();
    __swift_project_boxed_opaque_existential_2(&v44, (uint64_t)v45);
    v34 = swift_getDynamicType();
    MetatypeMetadata = swift_getMetatypeMetadata();
    v46 = v34;
  }
  sub_1B9DE1884();
  sub_1B9D44EF4((uint64_t)&v46);
  sub_1B9DE189C();
  sub_1B9DE18C0();
  __swift_destroy_boxed_opaque_existential_2((uint64_t)&v44);
  sub_1B9DE1860();
  v35 = *(_QWORD *)v26;
  v36 = *((_QWORD *)v26 + 1);
  type metadata accessor for CGSize(0);
  v45 = v37;
  *(_QWORD *)&v44 = v35;
  *((_QWORD *)&v44 + 1) = v36;
  sub_1B9DE18CC();
  sub_1B9D44EF4((uint64_t)&v44);
  sub_1B9DB0384();
  swift_bridgeObjectRelease();
  v38 = (id *)&v27[OBJC_IVAR____TtC27AppleMediaServicesUIDynamic19VisualAreaImageView_artworkImageView];
  swift_beginAccess();
  objc_msgSend(*v38, sel_removeFromSuperview);
  v39 = objc_allocWithZone((Class)type metadata accessor for ArtworkImageView());
  v40 = ArtworkImageView.init(artworkSize:frame:)();
  sub_1B9DDBD68(v40);
  objc_msgSend(v27, sel_addSubview_, *v38);
  v41 = *v38;
  ArtworkImageView.apply(dynamicArtwork:asPartOf:)();
  swift_release();

  return __swift_destroy_boxed_opaque_existential_2((uint64_t)v49);
}

uint64_t sub_1B9DDCE9C(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5)
{
  uint64_t v9;
  char *v10;
  id v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t DynamicType;
  uint64_t v17;
  uint64_t v18;
  _QWORD *v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  double v24;
  double v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  char *v30;
  char *v31;
  id v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  id *v42;
  id v43;
  id v44;
  id v45;
  uint64_t *boxed_opaque_existential_2Tm;
  uint64_t v48;
  __int128 v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t MetatypeMetadata;
  uint64_t v54[3];
  uint64_t v55;
  uint64_t v56;

  v9 = sub_1B9DE18B4();
  MEMORY[0x1E0C80A78](v9);
  v55 = a4;
  v56 = a5;
  boxed_opaque_existential_2Tm = __swift_allocate_boxed_opaque_existential_2Tm(v54);
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(_QWORD *)(a4 - 8) + 16))(boxed_opaque_existential_2Tm, a1, a4);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED5CFBE0);
  sub_1B9DE18FC();
  *(_OWORD *)(swift_allocObject() + 16) = xmmword_1B9DEFC60;
  v48 = type metadata accessor for VisualAreaImageView();
  v50 = v48;
  *(_QWORD *)&v49 = a3;
  v10 = a3;
  v11 = (id)AMSLogKey();
  if (v11)
  {
    v12 = v11;
    v13 = sub_1B9DE2160();
    v15 = v14;

    sub_1B9DE18A8();
    sub_1B9DE189C();
    __swift_project_boxed_opaque_existential_2(&v49, v50);
    DynamicType = swift_getDynamicType();
    MetatypeMetadata = swift_getMetatypeMetadata();
    v51 = DynamicType;
    sub_1B9DE1884();
    sub_1B9D44EF4((uint64_t)&v51);
    sub_1B9DE189C();
    MetatypeMetadata = MEMORY[0x1E0DEA968];
    v51 = v13;
    v52 = v15;
  }
  else
  {
    sub_1B9DE18A8();
    sub_1B9DE189C();
    __swift_project_boxed_opaque_existential_2(&v49, v50);
    v17 = swift_getDynamicType();
    MetatypeMetadata = swift_getMetatypeMetadata();
    v51 = v17;
  }
  sub_1B9DE1884();
  sub_1B9D44EF4((uint64_t)&v51);
  sub_1B9DE189C();
  sub_1B9DE18C0();
  type metadata accessor for Log();
  __swift_destroy_boxed_opaque_existential_2((uint64_t)&v49);
  sub_1B9DE1860();
  v18 = v55;
  v19 = __swift_project_boxed_opaque_existential_2(v54, v55);
  v50 = v18;
  v20 = __swift_allocate_boxed_opaque_existential_2Tm((uint64_t *)&v49);
  (*(void (**)(uint64_t *, _QWORD *, uint64_t))(*(_QWORD *)(v18 - 8) + 16))(v20, v19, v18);
  sub_1B9DE18CC();
  sub_1B9D44EF4((uint64_t)&v49);
  sub_1B9DB0384();
  swift_bridgeObjectRelease();
  v21 = (*(uint64_t (**)(uint64_t, uint64_t))(a5 + 8))(a4, a5);
  (*(void (**)(__int128 *__return_ptr, uint64_t, uint64_t))(a5 + 16))(&v49, a4, a5);
  v22 = (uint64_t)&v10[OBJC_IVAR____TtC27AppleMediaServicesUIDynamic19VisualAreaImageView_sizeConstraints];
  swift_beginAccess();
  __swift_destroy_boxed_opaque_existential_2(v22);
  sub_1B9D440BC(&v49, v22);
  swift_endAccess();
  v23 = *(_QWORD *)(v21 + 24);
  v24 = *(double *)(v23 + 32);
  v25 = *(double *)(v23 + 40);
  sub_1B9D47998(v22, (uint64_t)&v49);
  CGSize.sizeWithVisualAreaConstraints(_:)(&v49, v24, v25);
  v27 = v26;
  v29 = v28;
  __swift_destroy_boxed_opaque_existential_2((uint64_t)&v49);
  v30 = &v10[OBJC_IVAR____TtC27AppleMediaServicesUIDynamic19VisualAreaImageView_artworkSize];
  swift_beginAccess();
  *(_QWORD *)v30 = v27;
  *((_QWORD *)v30 + 1) = v29;
  *(_OWORD *)(swift_allocObject() + 16) = xmmword_1B9DEFC60;
  v50 = v48;
  *(_QWORD *)&v49 = v10;
  v31 = v10;
  v32 = (id)AMSLogKey();
  if (v32)
  {
    v33 = v32;
    v34 = sub_1B9DE2160();
    v36 = v35;

    sub_1B9DE18A8();
    sub_1B9DE189C();
    __swift_project_boxed_opaque_existential_2(&v49, v50);
    v37 = swift_getDynamicType();
    MetatypeMetadata = swift_getMetatypeMetadata();
    v51 = v37;
    sub_1B9DE1884();
    sub_1B9D44EF4((uint64_t)&v51);
    sub_1B9DE189C();
    MetatypeMetadata = MEMORY[0x1E0DEA968];
    v51 = v34;
    v52 = v36;
  }
  else
  {
    sub_1B9DE18A8();
    sub_1B9DE189C();
    __swift_project_boxed_opaque_existential_2(&v49, v50);
    v38 = swift_getDynamicType();
    MetatypeMetadata = swift_getMetatypeMetadata();
    v51 = v38;
  }
  sub_1B9DE1884();
  sub_1B9D44EF4((uint64_t)&v51);
  sub_1B9DE189C();
  sub_1B9DE18C0();
  __swift_destroy_boxed_opaque_existential_2((uint64_t)&v49);
  sub_1B9DE1860();
  v39 = *(_QWORD *)v30;
  v40 = *((_QWORD *)v30 + 1);
  type metadata accessor for CGSize(0);
  v50 = v41;
  *(_QWORD *)&v49 = v39;
  *((_QWORD *)&v49 + 1) = v40;
  sub_1B9DE18CC();
  sub_1B9D44EF4((uint64_t)&v49);
  sub_1B9DB0384();
  swift_bridgeObjectRelease();
  v42 = (id *)&v31[OBJC_IVAR____TtC27AppleMediaServicesUIDynamic19VisualAreaImageView_artworkImageView];
  swift_beginAccess();
  objc_msgSend(*v42, sel_removeFromSuperview);
  v43 = objc_allocWithZone((Class)type metadata accessor for ArtworkImageView());
  v44 = ArtworkImageView.init(artworkSize:frame:)();
  sub_1B9DDBD68(v44);
  objc_msgSend(v31, sel_addSubview_, *v42);
  v45 = *v42;
  ArtworkImageView.apply(dynamicArtwork:asPartOf:)();
  swift_release();

  return __swift_destroy_boxed_opaque_existential_2((uint64_t)v54);
}

void sub_1B9DDD548(id *a1@<X8>)
{
  *a1 = VisualAreaImageView.artworkImageView.getter();
  OUTLINED_FUNCTION_1();
}

void sub_1B9DDD570(uint64_t a1@<X8>)
{
  VisualAreaImageView.sizeConstraints.getter(a1);
  OUTLINED_FUNCTION_1();
}

void sub_1B9DDD590(uint64_t a1@<X8>)
{
  uint64_t v2;

  *(double *)a1 = VisualAreaImageView.artworkSize.getter();
  *(_QWORD *)(a1 + 8) = v2;
  OUTLINED_FUNCTION_1();
}

uint64_t destroy for AlignableVisualAreaArtwork(uint64_t a1)
{
  swift_release();
  return __swift_destroy_boxed_opaque_existential_2(a1 + 16);
}

uint64_t initializeWithCopy for AlignableVisualAreaArtwork(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  __int128 v5;
  uint64_t v6;
  void (*v7)(uint64_t, uint64_t, uint64_t);

  *(_BYTE *)a1 = *(_BYTE *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  v4 = a2 + 16;
  v5 = *(_OWORD *)(a2 + 40);
  *(_OWORD *)(a1 + 40) = v5;
  v6 = v5;
  v7 = **(void (***)(uint64_t, uint64_t, uint64_t))(v5 - 8);
  swift_retain();
  v7(a1 + 16, v4, v6);
  *(_BYTE *)(a1 + 56) = *(_BYTE *)(a2 + 56);
  return a1;
}

uint64_t assignWithCopy for AlignableVisualAreaArtwork(uint64_t a1, uint64_t a2)
{
  *(_BYTE *)a1 = *(_BYTE *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  swift_retain();
  swift_release();
  __swift_assign_boxed_opaque_existential_1((uint64_t *)(a1 + 16), (uint64_t *)(a2 + 16));
  *(_BYTE *)(a1 + 56) = *(_BYTE *)(a2 + 56);
  return a1;
}

__n128 __swift_memcpy57_8(uint64_t a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;
  __int128 v4;

  result = *(__n128 *)a2;
  v3 = *(_OWORD *)(a2 + 16);
  v4 = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 41) = *(_OWORD *)(a2 + 41);
  *(_OWORD *)(a1 + 16) = v3;
  *(_OWORD *)(a1 + 32) = v4;
  *(__n128 *)a1 = result;
  return result;
}

uint64_t assignWithTake for AlignableVisualAreaArtwork(uint64_t a1, uint64_t a2)
{
  __int128 v4;

  *(_BYTE *)a1 = *(_BYTE *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  swift_release();
  __swift_destroy_boxed_opaque_existential_2(a1 + 16);
  v4 = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(a1 + 32) = v4;
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  *(_BYTE *)(a1 + 56) = *(_BYTE *)(a2 + 56);
  return a1;
}

uint64_t getEnumTagSinglePayload for AlignableVisualAreaArtwork(uint64_t a1, int a2)
{
  unint64_t v2;

  if (a2)
  {
    if (a2 < 0 && *(_BYTE *)(a1 + 57))
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

uint64_t storeEnumTagSinglePayload for AlignableVisualAreaArtwork(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_BYTE *)(result + 56) = 0;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 57) = 1;
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
    *(_BYTE *)(result + 57) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for AlignableVisualAreaArtwork()
{
  return &type metadata for AlignableVisualAreaArtwork;
}

ValueMetadata *type metadata accessor for VisualAreaImageView.SizeConstraints()
{
  return &type metadata for VisualAreaImageView.SizeConstraints;
}

uint64_t sub_1B9DDD7E8()
{
  uint64_t v0;

  swift_release();
  __swift_destroy_boxed_opaque_existential_2(v0 + 32);
  return swift_deallocObject();
}

uint64_t sub_1B9DDD814(uint64_t a1, uint64_t a2)
{
  initializeWithCopy for AlignableVisualAreaArtwork(a2, a1);
  return a2;
}

uint64_t OUTLINED_FUNCTION_0_66()
{
  return swift_beginAccess();
}

id OUTLINED_FUNCTION_6_25()
{
  void *v0;
  uint64_t v1;

  return objc_msgSend(v0, (SEL)(v1 + 968));
}

uint64_t OUTLINED_FUNCTION_10_20()
{
  return sub_1B9DE27E4();
}

uint64_t OUTLINED_FUNCTION_17_19(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v2 - 184) = a1;
  *(_QWORD *)(v2 - 208) = v1;
  return sub_1B9DE1884();
}

uint64_t OUTLINED_FUNCTION_18_19()
{
  return sub_1B9DE18FC();
}

id OUTLINED_FUNCTION_19_11(objc_super *a1, SEL a2)
{
  return objc_msgSendSuper2(a1, a2, 0.0, 0.0, 0.0, 0.0);
}

uint64_t OUTLINED_FUNCTION_20_11()
{
  uint64_t v0;
  uint64_t v1;

  return (*(uint64_t (**)(uint64_t, uint64_t))(v1 + 32))(v0, v1);
}

uint64_t OUTLINED_FUNCTION_24_12()
{
  return sub_1B9DE189C();
}

uint64_t OUTLINED_FUNCTION_30_9()
{
  uint64_t v0;

  return sub_1B9D44EF4(v0 - 208);
}

uint64_t OUTLINED_FUNCTION_32_12()
{
  return AMSLogKey();
}

uint64_t OUTLINED_FUNCTION_33_10()
{
  return sub_1B9DE18CC();
}

uint64_t OUTLINED_FUNCTION_36_7()
{
  uint64_t v0;

  return __swift_destroy_boxed_opaque_existential_2(v0 - 128);
}

id OUTLINED_FUNCTION_37_8()
{
  void *v0;
  uint64_t v1;

  *(_QWORD *)(v1 - 128) = v0;
  return v0;
}

uint64_t OUTLINED_FUNCTION_38_9()
{
  uint64_t v0;

  return sub_1B9D44EF4(v0 - 192);
}

uint64_t OUTLINED_FUNCTION_39_10()
{
  return sub_1B9DE1884();
}

uint64_t type metadata accessor for ResourceBundleClass()
{
  return objc_opt_self();
}

uint64_t deviceIsRunningInternalBuild()
{
  return os_variant_has_internal_content();
}

uint64_t deviceIsRunningSeedBuild()
{
  return 0;
}

void AMSUIDMarkdownParserStartDocument(void *a1)
{
  id v1;
  id v2;

  v1 = a1;
  objc_msgSend(v1, "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "parserDidStartDocument:", v1);

}

void AMSUIDMarkdownParserEndDocument(void *a1)
{
  id v1;
  id v2;

  v1 = a1;
  objc_msgSend(v1, "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "parserDidEndDocument:", v1);

}

void AMSUIDMarkdownParserStartElement(void *a1, const xmlChar *a2, xmlChar **a3)
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  uint64_t v13;

  v11 = a1;
  if (xmlStrEqual(a2, (const xmlChar *)"artwork"))
  {
    objc_msgSend(v11, "delegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    NSDictionaryFromAttributes(a3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("id"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "parser:didFindArtworkWithIdentifier:", v11, v7);

  }
  else
  {
    if (xmlStrEqual(a2, (const xmlChar *)"li"))
    {
      objc_msgSend(v11, "delegate");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "parserDidStartListElement:", v11);
      goto LABEL_8;
    }
    v13 = 0;
    if (TryListTypeFromName(a2, &v13))
    {
      objc_msgSend(v11, "delegate");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "parser:didStartListOfStyle:", v11, v13);
      goto LABEL_8;
    }
    v12 = 0;
    v9 = TryTextElementFromName(a2, &v12);
    v8 = v11;
    if (!v9)
      goto LABEL_9;
    objc_msgSend(v11, "delegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v12;
    NSDictionaryFromAttributes(a3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "parser:didStartElement:attributes:", v11, v10, v6);
  }

LABEL_8:
  v8 = v11;
LABEL_9:

}

void AMSUIDMarkdownParserEndElement(void *a1, const xmlChar *a2)
{
  void *v3;
  int v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;

  v6 = a1;
  if (xmlStrEqual(a2, (const xmlChar *)"br"))
  {
    objc_msgSend(v6, "delegate");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "parserDidFindNewline:", v6);
LABEL_9:

    v5 = v6;
    goto LABEL_10;
  }
  if (xmlStrEqual(a2, (const xmlChar *)"li"))
  {
    objc_msgSend(v6, "delegate");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "parserDidEndListElement:", v6);
    goto LABEL_9;
  }
  v8 = 0;
  if (TryListTypeFromName(a2, &v8))
  {
    objc_msgSend(v6, "delegate");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "parser:didEndListOfStyle:", v6, v8);
    goto LABEL_9;
  }
  v7 = 0;
  v4 = TryTextElementFromName(a2, &v7);
  v5 = v6;
  if (v4)
  {
    objc_msgSend(v6, "delegate");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "parser:didEndElement:", v6, v7);
    goto LABEL_9;
  }
LABEL_10:

}

void AMSUIDMarkdownParserCharacters(void *a1, __CFString *a2, int a3)
{
  void *v5;
  void *v6;
  id v7;

  v7 = a1;
  NSStringFromXmlChar(a2, a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(v7, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "parser:didFindCharacters:", v7, v5);

  }
}

void AMSUIDMarkdownParserError(void *a1)
{
  xmlErrorPtr LastError;
  xmlErrorPtr v2;
  id v3;

  v3 = a1;
  LastError = xmlCtxtGetLastError((void *)objc_msgSend(v3, "_parserContext"));
  if (LastError)
  {
    v2 = LastError;
    objc_msgSend(v3, "reportParseError:", LastError);
    if (v2->level == XML_ERR_FATAL)
      xmlStopParser((xmlParserCtxtPtr)objc_msgSend(v3, "_parserContext"));
  }

}

id NSDictionaryFromAttributes(xmlChar **a1)
{
  id v2;
  xmlChar *v3;
  xmlChar **v4;
  xmlChar *v5;
  int v6;
  void *v7;
  int v8;
  void *v9;
  xmlChar *v10;

  if (a1)
  {
    v2 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v3 = *a1;
    if (*a1)
    {
      v4 = a1 + 2;
      do
      {
        v5 = *(v4 - 1);
        v6 = xmlStrlen(v3);
        NSStringFromXmlChar((__CFString *)v3, v6);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = xmlStrlen(v5);
        NSStringFromXmlChar((__CFString *)v5, v8);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v2, "setObject:forKeyedSubscript:", v9, v7);

        v10 = *v4;
        v4 += 2;
        v3 = v10;
      }
      while (v10);
    }
  }
  else
  {
    v2 = (id)MEMORY[0x1E0C9AA70];
  }
  return v2;
}

uint64_t TryListTypeFromName(const xmlChar *a1, uint64_t *a2)
{
  uint64_t v4;
  uint64_t result;

  if (xmlStrEqual(a1, (const xmlChar *)"ol"))
  {
    v4 = 0;
  }
  else
  {
    result = xmlStrEqual(a1, (const xmlChar *)"ul");
    if (!(_DWORD)result)
      return result;
    v4 = 1;
  }
  *a2 = v4;
  return 1;
}

uint64_t TryTextElementFromName(const xmlChar *a1, uint64_t *a2)
{
  uint64_t v4;
  uint64_t result;

  if (xmlStrEqual(a1, (const xmlChar *)"b") || xmlStrEqual(a1, (const xmlChar *)"em"))
  {
    v4 = 1;
LABEL_4:
    *a2 = v4;
    return 1;
  }
  if (xmlStrEqual(a1, (const xmlChar *)"a"))
  {
    v4 = 3;
    goto LABEL_4;
  }
  if (xmlStrEqual(a1, (const xmlChar *)"appl"))
  {
    v4 = 0;
    goto LABEL_4;
  }
  if (xmlStrEqual(a1, (const xmlChar *)"i"))
  {
    v4 = 2;
    goto LABEL_4;
  }
  if (xmlStrEqual(a1, (const xmlChar *)"u"))
  {
    v4 = 4;
    goto LABEL_4;
  }
  if (xmlStrEqual(a1, (const xmlChar *)"strike") || xmlStrEqual(a1, (const xmlChar *)"del"))
  {
    v4 = 5;
    goto LABEL_4;
  }
  if (xmlStrEqual(a1, (const xmlChar *)"p") || xmlStrEqual(a1, (const xmlChar *)"div"))
  {
    v4 = 6;
    goto LABEL_4;
  }
  if (xmlStrEqual(a1, (const xmlChar *)"s"))
  {
    v4 = 7;
    goto LABEL_4;
  }
  result = xmlStrEqual(a1, (const xmlChar *)"symbol");
  if ((_DWORD)result)
  {
    v4 = 8;
    goto LABEL_4;
  }
  return result;
}

__CFString *NSStringFromXmlChar(__CFString *a1, uint64_t a2)
{
  if (a1)
  {
    if (a2)
      return (__CFString *)(id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithBytes:length:encoding:", a1, a2, 4);
    a1 = &stru_1E7183780;
  }
  return a1;
}

void sub_1B9DE06BC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9)
{
  id v9;
  void *v10;

  if (a2 == 1)
  {
    v9 = objc_begin_catch(exception_object);
    objc_msgSend(v9, "description");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    NSLog(CFSTR("Unable to copy MicaPlayer. Error = %@"));

    objc_end_catch();
    JUMPOUT(0x1B9DE069CLL);
  }
  _Unwind_Resume(exception_object);
}

void sub_1B9DE119C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t sub_1B9DE1374()
{
  return MEMORY[0x1E0CAE1A0]();
}

uint64_t sub_1B9DE1380()
{
  return MEMORY[0x1E0CAE1D8]();
}

uint64_t sub_1B9DE138C()
{
  return MEMORY[0x1E0CAE1E8]();
}

uint64_t sub_1B9DE1398()
{
  return MEMORY[0x1E0CAE3A0]();
}

uint64_t sub_1B9DE13A4()
{
  return MEMORY[0x1E0CAE410]();
}

uint64_t sub_1B9DE13B0()
{
  return MEMORY[0x1E0CAE430]();
}

uint64_t sub_1B9DE13BC()
{
  return MEMORY[0x1E0D41888]();
}

uint64_t sub_1B9DE13C8()
{
  return MEMORY[0x1E0CAE490]();
}

uint64_t sub_1B9DE13D4()
{
  return MEMORY[0x1E0CAE4B8]();
}

uint64_t sub_1B9DE13E0()
{
  return MEMORY[0x1E0CAE618]();
}

uint64_t sub_1B9DE13EC()
{
  return MEMORY[0x1E0CAE630]();
}

uint64_t sub_1B9DE13F8()
{
  return MEMORY[0x1E0CAE638]();
}

uint64_t sub_1B9DE1404()
{
  return MEMORY[0x1E0CAE648]();
}

uint64_t sub_1B9DE1410()
{
  return MEMORY[0x1E0CAE670]();
}

uint64_t sub_1B9DE141C()
{
  return MEMORY[0x1E0CAE678]();
}

uint64_t sub_1B9DE1428()
{
  return MEMORY[0x1E0CAE690]();
}

uint64_t sub_1B9DE1434()
{
  return MEMORY[0x1E0CAE768]();
}

uint64_t sub_1B9DE1440()
{
  return MEMORY[0x1E0CAE7C8]();
}

uint64_t sub_1B9DE144C()
{
  return MEMORY[0x1E0CAE848]();
}

uint64_t sub_1B9DE1458()
{
  return MEMORY[0x1E0CAE860]();
}

uint64_t sub_1B9DE1464()
{
  return MEMORY[0x1E0CAE890]();
}

uint64_t sub_1B9DE1470()
{
  return MEMORY[0x1E0CAEB20]();
}

uint64_t sub_1B9DE147C()
{
  return MEMORY[0x1E0CAEB38]();
}

uint64_t sub_1B9DE1488()
{
  return MEMORY[0x1E0CAEB40]();
}

uint64_t sub_1B9DE1494()
{
  return MEMORY[0x1E0CAEB50]();
}

uint64_t sub_1B9DE14A0()
{
  return MEMORY[0x1E0CAF8B0]();
}

uint64_t sub_1B9DE14AC()
{
  return MEMORY[0x1E0CAF980]();
}

uint64_t sub_1B9DE14B8()
{
  return MEMORY[0x1E0CAF990]();
}

uint64_t sub_1B9DE14C4()
{
  return MEMORY[0x1E0CAFC08]();
}

uint64_t sub_1B9DE14D0()
{
  return MEMORY[0x1E0CAFC10]();
}

uint64_t sub_1B9DE14DC()
{
  return MEMORY[0x1E0CAFC18]();
}

uint64_t sub_1B9DE14E8()
{
  return MEMORY[0x1E0CAFD40]();
}

uint64_t sub_1B9DE14F4()
{
  return MEMORY[0x1E0CAFDA0]();
}

uint64_t sub_1B9DE1500()
{
  return MEMORY[0x1E0CAFE38]();
}

uint64_t sub_1B9DE150C()
{
  return MEMORY[0x1E0CAFED8]();
}

uint64_t sub_1B9DE1518()
{
  return MEMORY[0x1E0CAFF00]();
}

uint64_t sub_1B9DE1524()
{
  return MEMORY[0x1E0CAFF20]();
}

uint64_t sub_1B9DE1530()
{
  return MEMORY[0x1E0CAFF80]();
}

uint64_t sub_1B9DE153C()
{
  return MEMORY[0x1E0CAFF90]();
}

uint64_t sub_1B9DE1548()
{
  return MEMORY[0x1E0CAFFB0]();
}

uint64_t sub_1B9DE1554()
{
  return MEMORY[0x1E0CAFFF8]();
}

uint64_t sub_1B9DE1560()
{
  return MEMORY[0x1E0CB01F0]();
}

uint64_t sub_1B9DE156C()
{
  return MEMORY[0x1E0CB0228]();
}

uint64_t sub_1B9DE1578()
{
  return MEMORY[0x1E0CB0860]();
}

uint64_t sub_1B9DE1584()
{
  return MEMORY[0x1E0CB0870]();
}

uint64_t sub_1B9DE1590()
{
  return MEMORY[0x1E0CB0910]();
}

uint64_t sub_1B9DE159C()
{
  return MEMORY[0x1E0CB0988]();
}

uint64_t sub_1B9DE15A8()
{
  return MEMORY[0x1E0CB0998]();
}

uint64_t sub_1B9DE15B4()
{
  return MEMORY[0x1E0CB0BE0]();
}

uint64_t sub_1B9DE15C0()
{
  return MEMORY[0x1E0D41898]();
}

uint64_t sub_1B9DE15CC()
{
  return MEMORY[0x1E0CB0DB8]();
}

uint64_t sub_1B9DE15D8()
{
  return MEMORY[0x1E0CB0E38]();
}

uint64_t sub_1B9DE15E4()
{
  return MEMORY[0x1E0D20EF8]();
}

uint64_t sub_1B9DE15F0()
{
  return MEMORY[0x1E0CFD680]();
}

uint64_t sub_1B9DE15FC()
{
  return MEMORY[0x1E0CFD688]();
}

uint64_t sub_1B9DE1608()
{
  return MEMORY[0x1E0CFD690]();
}

uint64_t sub_1B9DE1614()
{
  return MEMORY[0x1E0CFD730]();
}

uint64_t sub_1B9DE1620()
{
  return MEMORY[0x1E0CFD748]();
}

uint64_t sub_1B9DE162C()
{
  return MEMORY[0x1E0CFD750]();
}

uint64_t sub_1B9DE1638()
{
  return MEMORY[0x1E0CFDDB0]();
}

uint64_t sub_1B9DE1644()
{
  return MEMORY[0x1E0CFDDB8]();
}

uint64_t sub_1B9DE1650()
{
  return MEMORY[0x1E0CFDDC0]();
}

uint64_t sub_1B9DE165C()
{
  return MEMORY[0x1E0DF2078]();
}

uint64_t sub_1B9DE1668()
{
  return MEMORY[0x1E0D418F0]();
}

uint64_t sub_1B9DE1674()
{
  return MEMORY[0x1E0D41A28]();
}

uint64_t sub_1B9DE1680()
{
  return MEMORY[0x1E0D41A70]();
}

uint64_t sub_1B9DE168C()
{
  return MEMORY[0x1E0D41CC8]();
}

uint64_t sub_1B9DE1698()
{
  return MEMORY[0x1E0DEF4A8]();
}

uint64_t sub_1B9DE16A4()
{
  return MEMORY[0x1E0DEF4B8]();
}

uint64_t sub_1B9DE16B0()
{
  return MEMORY[0x1E0DEF4D0]();
}

uint64_t sub_1B9DE16BC()
{
  return MEMORY[0x1E0DEF4E8]();
}

uint64_t sub_1B9DE16C8()
{
  return MEMORY[0x1E0DEF4F8]();
}

uint64_t sub_1B9DE16D4()
{
  return MEMORY[0x1E0DEF560]();
}

uint64_t sub_1B9DE16E0()
{
  return MEMORY[0x1E0DEF578]();
}

uint64_t sub_1B9DE16EC()
{
  return MEMORY[0x1E0DEF580]();
}

uint64_t sub_1B9DE16F8()
{
  return MEMORY[0x1E0DEF5B0]();
}

uint64_t sub_1B9DE1704()
{
  return MEMORY[0x1E0DEF688]();
}

uint64_t sub_1B9DE1710()
{
  return MEMORY[0x1E0DEF698]();
}

uint64_t sub_1B9DE171C()
{
  return MEMORY[0x1E0DEF6B8]();
}

uint64_t sub_1B9DE1728()
{
  return MEMORY[0x1E0DEF708]();
}

uint64_t sub_1B9DE1734()
{
  return MEMORY[0x1E0DEF710]();
}

uint64_t sub_1B9DE1740()
{
  return MEMORY[0x1E0DEF728]();
}

uint64_t sub_1B9DE174C()
{
  return MEMORY[0x1E0DEF748]();
}

uint64_t sub_1B9DE1758()
{
  return MEMORY[0x1E0DEF750]();
}

uint64_t sub_1B9DE1764()
{
  return MEMORY[0x1E0DEF758]();
}

uint64_t sub_1B9DE1770()
{
  return MEMORY[0x1E0DEF770]();
}

uint64_t sub_1B9DE177C()
{
  return MEMORY[0x1E0DEF778]();
}

uint64_t sub_1B9DE1788()
{
  return MEMORY[0x1E0D3F388]();
}

uint64_t sub_1B9DE1794()
{
  return MEMORY[0x1E0D3F3B0]();
}

uint64_t sub_1B9DE17A0()
{
  return MEMORY[0x1E0D3F3C0]();
}

uint64_t sub_1B9DE17AC()
{
  return MEMORY[0x1E0D3F450]();
}

uint64_t sub_1B9DE17B8()
{
  return MEMORY[0x1E0D3F458]();
}

uint64_t sub_1B9DE17C4()
{
  return MEMORY[0x1E0D3F470]();
}

uint64_t sub_1B9DE17D0()
{
  return MEMORY[0x1E0D3F478]();
}

uint64_t sub_1B9DE17DC()
{
  return MEMORY[0x1E0D3F480]();
}

uint64_t sub_1B9DE17E8()
{
  return MEMORY[0x1E0D3F488]();
}

uint64_t sub_1B9DE17F4()
{
  return MEMORY[0x1E0D3F490]();
}

uint64_t sub_1B9DE1800()
{
  return MEMORY[0x1E0D3F4B0]();
}

uint64_t sub_1B9DE180C()
{
  return MEMORY[0x1E0D3F4D0]();
}

uint64_t sub_1B9DE1818()
{
  return MEMORY[0x1E0D3F4D8]();
}

uint64_t sub_1B9DE1824()
{
  return MEMORY[0x1E0D3F4E8]();
}

uint64_t sub_1B9DE1830()
{
  return MEMORY[0x1E0D3F4F0]();
}

uint64_t sub_1B9DE183C()
{
  return MEMORY[0x1E0D3F4F8]();
}

uint64_t sub_1B9DE1848()
{
  return MEMORY[0x1E0D3F500]();
}

uint64_t sub_1B9DE1854()
{
  return MEMORY[0x1E0D3F518]();
}

uint64_t sub_1B9DE1860()
{
  return MEMORY[0x1E0D3F528]();
}

uint64_t sub_1B9DE186C()
{
  return MEMORY[0x1E0D3F530]();
}

uint64_t sub_1B9DE1878()
{
  return MEMORY[0x1E0D3F538]();
}

uint64_t sub_1B9DE1884()
{
  return MEMORY[0x1E0D3F548]();
}

uint64_t sub_1B9DE1890()
{
  return MEMORY[0x1E0D3F558]();
}

uint64_t sub_1B9DE189C()
{
  return MEMORY[0x1E0D3F560]();
}

uint64_t sub_1B9DE18A8()
{
  return MEMORY[0x1E0D3F568]();
}

uint64_t sub_1B9DE18B4()
{
  return MEMORY[0x1E0D3F570]();
}

uint64_t sub_1B9DE18C0()
{
  return MEMORY[0x1E0D3F578]();
}

uint64_t sub_1B9DE18CC()
{
  return MEMORY[0x1E0D3F580]();
}

uint64_t sub_1B9DE18D8()
{
  return MEMORY[0x1E0D3F588]();
}

uint64_t sub_1B9DE18E4()
{
  return MEMORY[0x1E0D3F590]();
}

uint64_t sub_1B9DE18F0()
{
  return MEMORY[0x1E0D3F598]();
}

uint64_t sub_1B9DE18FC()
{
  return MEMORY[0x1E0D3F5A0]();
}

uint64_t sub_1B9DE1908()
{
  return MEMORY[0x1E0D3F5D0]();
}

uint64_t sub_1B9DE1914()
{
  return MEMORY[0x1E0D3F5F8]();
}

uint64_t sub_1B9DE1920()
{
  return MEMORY[0x1E0D3F600]();
}

uint64_t sub_1B9DE192C()
{
  return MEMORY[0x1E0D3F610]();
}

uint64_t sub_1B9DE1938()
{
  return MEMORY[0x1E0D3F620]();
}

uint64_t sub_1B9DE1944()
{
  return MEMORY[0x1E0D3F638]();
}

uint64_t sub_1B9DE1950()
{
  return MEMORY[0x1E0D3F648]();
}

uint64_t sub_1B9DE195C()
{
  return MEMORY[0x1E0D3F658]();
}

uint64_t sub_1B9DE1968()
{
  return MEMORY[0x1E0D3F660]();
}

uint64_t sub_1B9DE1974()
{
  return MEMORY[0x1E0D3F670]();
}

uint64_t sub_1B9DE1980()
{
  return MEMORY[0x1E0D3F6D8]();
}

uint64_t sub_1B9DE198C()
{
  return MEMORY[0x1E0D3F700]();
}

uint64_t sub_1B9DE1998()
{
  return MEMORY[0x1E0D3F720]();
}

uint64_t sub_1B9DE19A4()
{
  return MEMORY[0x1E0D3F730]();
}

uint64_t sub_1B9DE19B0()
{
  return MEMORY[0x1E0D3F7F8]();
}

uint64_t sub_1B9DE19BC()
{
  return MEMORY[0x1E0D3F848]();
}

uint64_t sub_1B9DE19C8()
{
  return MEMORY[0x1E0D3F850]();
}

uint64_t sub_1B9DE19D4()
{
  return MEMORY[0x1E0D3F858]();
}

uint64_t sub_1B9DE19E0()
{
  return MEMORY[0x1E0D3F860]();
}

uint64_t sub_1B9DE19EC()
{
  return MEMORY[0x1E0D3F878]();
}

uint64_t sub_1B9DE19F8()
{
  return MEMORY[0x1E0D3F8B0]();
}

uint64_t sub_1B9DE1A04()
{
  return MEMORY[0x1E0D3F8C0]();
}

uint64_t sub_1B9DE1A10()
{
  return MEMORY[0x1E0D3F940]();
}

uint64_t sub_1B9DE1A1C()
{
  return MEMORY[0x1E0D3F958]();
}

uint64_t sub_1B9DE1A28()
{
  return MEMORY[0x1E0D3F960]();
}

uint64_t sub_1B9DE1A34()
{
  return MEMORY[0x1E0D3F970]();
}

uint64_t sub_1B9DE1A40()
{
  return MEMORY[0x1E0D3FAE0]();
}

uint64_t sub_1B9DE1A4C()
{
  return MEMORY[0x1E0D3FB10]();
}

uint64_t sub_1B9DE1A58()
{
  return MEMORY[0x1E0D3FB20]();
}

uint64_t sub_1B9DE1A64()
{
  return MEMORY[0x1E0D3FB30]();
}

uint64_t sub_1B9DE1A70()
{
  return MEMORY[0x1E0D3FBC8]();
}

uint64_t sub_1B9DE1A7C()
{
  return MEMORY[0x1E0D3FBD0]();
}

uint64_t sub_1B9DE1A88()
{
  return MEMORY[0x1E0D3FBD8]();
}

uint64_t sub_1B9DE1A94()
{
  return MEMORY[0x1E0D3FC20]();
}

uint64_t sub_1B9DE1AA0()
{
  return MEMORY[0x1E0D3FC28]();
}

uint64_t sub_1B9DE1AAC()
{
  return MEMORY[0x1E0D3FC50]();
}

uint64_t sub_1B9DE1AB8()
{
  return MEMORY[0x1E0D3FCF0]();
}

uint64_t sub_1B9DE1AC4()
{
  return MEMORY[0x1E0D3FCF8]();
}

uint64_t sub_1B9DE1AD0()
{
  return MEMORY[0x1E0D3FD08]();
}

uint64_t sub_1B9DE1ADC()
{
  return MEMORY[0x1E0D3FD30]();
}

uint64_t sub_1B9DE1AE8()
{
  return MEMORY[0x1E0D3FD38]();
}

uint64_t sub_1B9DE1AF4()
{
  return MEMORY[0x1E0D3FD48]();
}

uint64_t sub_1B9DE1B00()
{
  return MEMORY[0x1E0D3FD50]();
}

uint64_t sub_1B9DE1B0C()
{
  return MEMORY[0x1E0D3FD58]();
}

uint64_t sub_1B9DE1B18()
{
  return MEMORY[0x1E0D3FE10]();
}

uint64_t sub_1B9DE1B24()
{
  return MEMORY[0x1E0D3FE68]();
}

uint64_t sub_1B9DE1B30()
{
  return MEMORY[0x1E0D3FE70]();
}

uint64_t sub_1B9DE1B3C()
{
  return MEMORY[0x1E0D3FE78]();
}

uint64_t sub_1B9DE1B48()
{
  return MEMORY[0x1E0D400F8]();
}

uint64_t sub_1B9DE1B54()
{
  return MEMORY[0x1E0D40138]();
}

uint64_t sub_1B9DE1B60()
{
  return MEMORY[0x1E0D40140]();
}

uint64_t sub_1B9DE1B6C()
{
  return MEMORY[0x1E0D40250]();
}

uint64_t sub_1B9DE1B78()
{
  return MEMORY[0x1E0D40258]();
}

uint64_t sub_1B9DE1B84()
{
  return MEMORY[0x1E0D40268]();
}

uint64_t sub_1B9DE1B90()
{
  return MEMORY[0x1E0D40278]();
}

uint64_t sub_1B9DE1B9C()
{
  return MEMORY[0x1E0D402C8]();
}

uint64_t sub_1B9DE1BA8()
{
  return MEMORY[0x1E0D402D0]();
}

uint64_t sub_1B9DE1BB4()
{
  return MEMORY[0x1E0D402D8]();
}

uint64_t sub_1B9DE1BC0()
{
  return MEMORY[0x1E0D402E0]();
}

uint64_t sub_1B9DE1BCC()
{
  return MEMORY[0x1E0D402F0]();
}

uint64_t sub_1B9DE1BD8()
{
  return MEMORY[0x1E0D402F8]();
}

uint64_t sub_1B9DE1BE4()
{
  return MEMORY[0x1E0D40310]();
}

uint64_t sub_1B9DE1BF0()
{
  return MEMORY[0x1E0D40348]();
}

uint64_t sub_1B9DE1BFC()
{
  return MEMORY[0x1E0D40350]();
}

uint64_t sub_1B9DE1C08()
{
  return MEMORY[0x1E0D40358]();
}

uint64_t sub_1B9DE1C14()
{
  return MEMORY[0x1E0D40498]();
}

uint64_t sub_1B9DE1C20()
{
  return MEMORY[0x1E0D404E0]();
}

uint64_t sub_1B9DE1C2C()
{
  return MEMORY[0x1E0D404F0]();
}

uint64_t sub_1B9DE1C38()
{
  return MEMORY[0x1E0D40500]();
}

uint64_t sub_1B9DE1C44()
{
  return MEMORY[0x1E0D40508]();
}

uint64_t sub_1B9DE1C50()
{
  return MEMORY[0x1E0D40510]();
}

uint64_t sub_1B9DE1C5C()
{
  return MEMORY[0x1E0D40518]();
}

uint64_t sub_1B9DE1C68()
{
  return MEMORY[0x1E0D40520]();
}

uint64_t sub_1B9DE1C74()
{
  return MEMORY[0x1E0D40558]();
}

uint64_t sub_1B9DE1C80()
{
  return MEMORY[0x1E0D40560]();
}

uint64_t sub_1B9DE1C8C()
{
  return MEMORY[0x1E0D40568]();
}

uint64_t sub_1B9DE1C98()
{
  return MEMORY[0x1E0D40570]();
}

uint64_t sub_1B9DE1CA4()
{
  return MEMORY[0x1E0D40580]();
}

uint64_t sub_1B9DE1CB0()
{
  return MEMORY[0x1E0D405A8]();
}

uint64_t sub_1B9DE1CBC()
{
  return MEMORY[0x1E0D405C0]();
}

uint64_t sub_1B9DE1CC8()
{
  return MEMORY[0x1E0D40708]();
}

uint64_t sub_1B9DE1CD4()
{
  return MEMORY[0x1E0D40718]();
}

uint64_t sub_1B9DE1CE0()
{
  return MEMORY[0x1E0D40888]();
}

uint64_t sub_1B9DE1CEC()
{
  return MEMORY[0x1E0D40890]();
}

uint64_t sub_1B9DE1CF8()
{
  return MEMORY[0x1E0D408B0]();
}

uint64_t sub_1B9DE1D04()
{
  return MEMORY[0x1E0D408B8]();
}

uint64_t sub_1B9DE1D10()
{
  return MEMORY[0x1E0D408C8]();
}

uint64_t sub_1B9DE1D1C()
{
  return MEMORY[0x1E0D408D0]();
}

uint64_t sub_1B9DE1D28()
{
  return MEMORY[0x1E0D408D8]();
}

uint64_t sub_1B9DE1D34()
{
  return MEMORY[0x1E0D408E0]();
}

uint64_t sub_1B9DE1D40()
{
  return MEMORY[0x1E0D408F0]();
}

uint64_t sub_1B9DE1D4C()
{
  return MEMORY[0x1E0D40900]();
}

uint64_t sub_1B9DE1D58()
{
  return MEMORY[0x1E0D40920]();
}

uint64_t sub_1B9DE1D64()
{
  return MEMORY[0x1E0D40930]();
}

uint64_t sub_1B9DE1D70()
{
  return MEMORY[0x1E0D40968]();
}

uint64_t sub_1B9DE1D7C()
{
  return MEMORY[0x1E0D40970]();
}

uint64_t sub_1B9DE1D88()
{
  return MEMORY[0x1E0D40988]();
}

uint64_t sub_1B9DE1D94()
{
  return MEMORY[0x1E0D40998]();
}

uint64_t sub_1B9DE1DA0()
{
  return MEMORY[0x1E0D409F8]();
}

uint64_t sub_1B9DE1DAC()
{
  return MEMORY[0x1E0D40A08]();
}

uint64_t sub_1B9DE1DB8()
{
  return MEMORY[0x1E0D40A10]();
}

uint64_t sub_1B9DE1DC4()
{
  return MEMORY[0x1E0D40A20]();
}

uint64_t sub_1B9DE1DD0()
{
  return MEMORY[0x1E0D40A78]();
}

uint64_t sub_1B9DE1DDC()
{
  return MEMORY[0x1E0D40A80]();
}

uint64_t sub_1B9DE1DE8()
{
  return MEMORY[0x1E0D40AA8]();
}

uint64_t sub_1B9DE1DF4()
{
  return MEMORY[0x1E0D40BB0]();
}

uint64_t sub_1B9DE1E00()
{
  return MEMORY[0x1E0D40BD8]();
}

uint64_t sub_1B9DE1E0C()
{
  return MEMORY[0x1E0D40C08]();
}

uint64_t sub_1B9DE1E18()
{
  return MEMORY[0x1E0D40C10]();
}

uint64_t sub_1B9DE1E24()
{
  return MEMORY[0x1E0D40C18]();
}

uint64_t sub_1B9DE1E30()
{
  return MEMORY[0x1E0D40C20]();
}

uint64_t sub_1B9DE1E3C()
{
  return MEMORY[0x1E0D40C28]();
}

uint64_t sub_1B9DE1E48()
{
  return MEMORY[0x1E0D40C38]();
}

uint64_t sub_1B9DE1E54()
{
  return MEMORY[0x1E0D40D00]();
}

uint64_t sub_1B9DE1E60()
{
  return MEMORY[0x1E0D40D10]();
}

uint64_t sub_1B9DE1E6C()
{
  return MEMORY[0x1E0D40D38]();
}

uint64_t sub_1B9DE1E78()
{
  return MEMORY[0x1E0D40D68]();
}

uint64_t sub_1B9DE1E84()
{
  return MEMORY[0x1E0D40D80]();
}

uint64_t sub_1B9DE1E90()
{
  return MEMORY[0x1E0D40DD8]();
}

uint64_t sub_1B9DE1E9C()
{
  return MEMORY[0x1E0D40DE8]();
}

uint64_t sub_1B9DE1EA8()
{
  return MEMORY[0x1E0D40E38]();
}

uint64_t sub_1B9DE1EB4()
{
  return MEMORY[0x1E0D40E78]();
}

uint64_t sub_1B9DE1EC0()
{
  return MEMORY[0x1E0D40ED0]();
}

uint64_t sub_1B9DE1ECC()
{
  return MEMORY[0x1E0D40ED8]();
}

uint64_t sub_1B9DE1ED8()
{
  return MEMORY[0x1E0D40F18]();
}

uint64_t sub_1B9DE1EE4()
{
  return MEMORY[0x1E0D40F60]();
}

uint64_t sub_1B9DE1EF0()
{
  return MEMORY[0x1E0D41020]();
}

uint64_t sub_1B9DE1EFC()
{
  return MEMORY[0x1E0D41028]();
}

uint64_t sub_1B9DE1F08()
{
  return MEMORY[0x1E0D41138]();
}

uint64_t sub_1B9DE1F14()
{
  return MEMORY[0x1E0D41140]();
}

uint64_t sub_1B9DE1F20()
{
  return MEMORY[0x1E0D41150]();
}

uint64_t sub_1B9DE1F2C()
{
  return MEMORY[0x1E0D41160]();
}

uint64_t sub_1B9DE1F38()
{
  return MEMORY[0x1E0D41168]();
}

uint64_t sub_1B9DE1F44()
{
  return MEMORY[0x1E0D412C8]();
}

uint64_t sub_1B9DE1F50()
{
  return MEMORY[0x1E0D412D0]();
}

uint64_t sub_1B9DE1F5C()
{
  return MEMORY[0x1E0D412D8]();
}

uint64_t sub_1B9DE1F68()
{
  return MEMORY[0x1E0D412E0]();
}

uint64_t sub_1B9DE1F74()
{
  return MEMORY[0x1E0D412F0]();
}

uint64_t sub_1B9DE1F80()
{
  return MEMORY[0x1E0D41308]();
}

uint64_t sub_1B9DE1F8C()
{
  return MEMORY[0x1E0D41310]();
}

uint64_t sub_1B9DE1F98()
{
  return MEMORY[0x1E0D41318]();
}

uint64_t sub_1B9DE1FA4()
{
  return MEMORY[0x1E0D41320]();
}

uint64_t sub_1B9DE1FB0()
{
  return MEMORY[0x1E0D41328]();
}

uint64_t sub_1B9DE1FBC()
{
  return MEMORY[0x1E0D41330]();
}

uint64_t sub_1B9DE1FC8()
{
  return MEMORY[0x1E0D41338]();
}

uint64_t sub_1B9DE1FD4()
{
  return MEMORY[0x1E0D41348]();
}

uint64_t sub_1B9DE1FE0()
{
  return MEMORY[0x1E0D41350]();
}

uint64_t sub_1B9DE1FEC()
{
  return MEMORY[0x1E0D41358]();
}

uint64_t sub_1B9DE1FF8()
{
  return MEMORY[0x1E0D413C0]();
}

uint64_t sub_1B9DE2004()
{
  return MEMORY[0x1E0D413D0]();
}

uint64_t sub_1B9DE2010()
{
  return MEMORY[0x1E0D413E0]();
}

uint64_t sub_1B9DE201C()
{
  return MEMORY[0x1E0D413F0]();
}

uint64_t sub_1B9DE2028()
{
  return MEMORY[0x1E0D41470]();
}

uint64_t sub_1B9DE2034()
{
  return MEMORY[0x1E0D41480]();
}

uint64_t sub_1B9DE2040()
{
  return MEMORY[0x1E0D41488]();
}

uint64_t sub_1B9DE204C()
{
  return MEMORY[0x1E0D41490]();
}

uint64_t sub_1B9DE2058()
{
  return MEMORY[0x1E0D414C8]();
}

uint64_t sub_1B9DE2064()
{
  return MEMORY[0x1E0D41500]();
}

uint64_t sub_1B9DE2070()
{
  return MEMORY[0x1E0D415C8]();
}

uint64_t sub_1B9DE207C()
{
  return MEMORY[0x1E0D415D8]();
}

uint64_t sub_1B9DE2088()
{
  return MEMORY[0x1E0D41640]();
}

uint64_t sub_1B9DE2094()
{
  return MEMORY[0x1E0CB17D8]();
}

uint64_t sub_1B9DE20A0()
{
  return MEMORY[0x1E0CB1808]();
}

uint64_t sub_1B9DE20AC()
{
  return MEMORY[0x1E0DE9E40]();
}

uint64_t sub_1B9DE20B8()
{
  return MEMORY[0x1E0DE9E78]();
}

uint64_t sub_1B9DE20C4()
{
  return MEMORY[0x1E0DE9FF8]();
}

uint64_t sub_1B9DE20D0()
{
  return MEMORY[0x1E0DEA048]();
}

uint64_t sub_1B9DE20DC()
{
  return MEMORY[0x1E0DEA1B8]();
}

uint64_t sub_1B9DE20E8()
{
  return MEMORY[0x1E0DEA3B0]();
}

uint64_t sub_1B9DE20F4()
{
  return MEMORY[0x1E0DEA3C0]();
}

uint64_t sub_1B9DE2100()
{
  return MEMORY[0x1E0DEA3C8]();
}

uint64_t sub_1B9DE210C()
{
  return MEMORY[0x1E0DEA3E0]();
}

uint64_t sub_1B9DE2118()
{
  return MEMORY[0x1E0DEA3E8]();
}

uint64_t sub_1B9DE2124()
{
  return MEMORY[0x1E0DEA3F0]();
}

uint64_t sub_1B9DE2130()
{
  return MEMORY[0x1E0DEA568]();
}

uint64_t sub_1B9DE213C()
{
  return MEMORY[0x1E0CB1940]();
}

uint64_t sub_1B9DE2148()
{
  return MEMORY[0x1E0CB1960]();
}

uint64_t sub_1B9DE2154()
{
  return MEMORY[0x1E0CB1970]();
}

uint64_t sub_1B9DE2160()
{
  return MEMORY[0x1E0CB1980]();
}

uint64_t sub_1B9DE216C()
{
  return MEMORY[0x1E0CB1990]();
}

uint64_t sub_1B9DE2178()
{
  return MEMORY[0x1E0CB19C0]();
}

uint64_t sub_1B9DE2184()
{
  return MEMORY[0x1E0CB19E8]();
}

uint64_t sub_1B9DE2190()
{
  return MEMORY[0x1E0CB1A18]();
}

uint64_t sub_1B9DE219C()
{
  return MEMORY[0x1E0DEA5F8]();
}

uint64_t sub_1B9DE21A8()
{
  return MEMORY[0x1E0DEA658]();
}

uint64_t sub_1B9DE21B4()
{
  return MEMORY[0x1E0DEA6F8]();
}

uint64_t sub_1B9DE21C0()
{
  return MEMORY[0x1E0DEA758]();
}

uint64_t sub_1B9DE21CC()
{
  return MEMORY[0x1E0DEA7B8]();
}

uint64_t sub_1B9DE21D8()
{
  return MEMORY[0x1E0DEA7D8]();
}

uint64_t sub_1B9DE21E4()
{
  return MEMORY[0x1E0DEA800]();
}

uint64_t sub_1B9DE21F0()
{
  return MEMORY[0x1E0DEA858]();
}

uint64_t sub_1B9DE21FC()
{
  return MEMORY[0x1E0DEA870]();
}

uint64_t sub_1B9DE2208()
{
  return MEMORY[0x1E0DEA878]();
}

uint64_t sub_1B9DE2214()
{
  return MEMORY[0x1E0DEA880]();
}

uint64_t sub_1B9DE2220()
{
  return MEMORY[0x1E0DEA908]();
}

uint64_t sub_1B9DE222C()
{
  return MEMORY[0x1E0DEAA40]();
}

uint64_t sub_1B9DE2238()
{
  return MEMORY[0x1E0DEAA50]();
}

uint64_t sub_1B9DE2244()
{
  return MEMORY[0x1E0DEAAB8]();
}

uint64_t sub_1B9DE2250()
{
  return MEMORY[0x1E0DEAAD8]();
}

uint64_t sub_1B9DE225C()
{
  return MEMORY[0x1E0DEAB30]();
}

uint64_t sub_1B9DE2268()
{
  return MEMORY[0x1E0DEABB0]();
}

uint64_t sub_1B9DE2274()
{
  return MEMORY[0x1E0DEADA0]();
}

uint64_t sub_1B9DE2280()
{
  return MEMORY[0x1E0CB1AC0]();
}

uint64_t sub_1B9DE228C()
{
  return MEMORY[0x1E0CB1AE8]();
}

uint64_t sub_1B9DE2298()
{
  return MEMORY[0x1E0DEADA8]();
}

uint64_t sub_1B9DE22A4()
{
  return MEMORY[0x1E0DEADB0]();
}

uint64_t sub_1B9DE22B0()
{
  return MEMORY[0x1E0DEADB8]();
}

uint64_t sub_1B9DE22BC()
{
  return MEMORY[0x1E0DEADC8]();
}

uint64_t sub_1B9DE22C8()
{
  return MEMORY[0x1E0DEADE8]();
}

uint64_t sub_1B9DE22D4()
{
  return MEMORY[0x1E0DEAE38]();
}

uint64_t sub_1B9DE22E0()
{
  return MEMORY[0x1E0DEAE58]();
}

uint64_t sub_1B9DE22EC()
{
  return MEMORY[0x1E0DEAE68]();
}

uint64_t sub_1B9DE22F8()
{
  return MEMORY[0x1E0DEAE98]();
}

uint64_t sub_1B9DE2304()
{
  return MEMORY[0x1E0DEAEA8]();
}

uint64_t sub_1B9DE2310()
{
  return MEMORY[0x1E0DEAEB8]();
}

uint64_t sub_1B9DE231C()
{
  return MEMORY[0x1E0DEAEC8]();
}

uint64_t sub_1B9DE2328()
{
  return MEMORY[0x1E0DEAF00]();
}

uint64_t sub_1B9DE2334()
{
  return MEMORY[0x1E0DEAF78]();
}

uint64_t sub_1B9DE2340()
{
  return MEMORY[0x1E0CB1BB0]();
}

uint64_t sub_1B9DE234C()
{
  return MEMORY[0x1E0CB1BD8]();
}

uint64_t sub_1B9DE2358()
{
  return MEMORY[0x1E0DEB258]();
}

uint64_t sub_1B9DE2364()
{
  return MEMORY[0x1E0DEB310]();
}

uint64_t sub_1B9DE2370()
{
  return MEMORY[0x1E0DEB5E8]();
}

uint64_t sub_1B9DE237C()
{
  return MEMORY[0x1E0DEB5F0]();
}

uint64_t sub_1B9DE2388()
{
  return MEMORY[0x1E0DEB5F8]();
}

uint64_t sub_1B9DE2394()
{
  return MEMORY[0x1E0DEB600]();
}

uint64_t sub_1B9DE23A0()
{
  return MEMORY[0x1E0DEB608]();
}

uint64_t sub_1B9DE23AC()
{
  return MEMORY[0x1E0DEB628]();
}

uint64_t sub_1B9DE23B8()
{
  return MEMORY[0x1E0DEB630]();
}

uint64_t sub_1B9DE23C4()
{
  return MEMORY[0x1E0DEB660]();
}

uint64_t sub_1B9DE23D0()
{
  return MEMORY[0x1E0DEB668]();
}

uint64_t sub_1B9DE23DC()
{
  return MEMORY[0x1E0DEB6A0]();
}

uint64_t sub_1B9DE23E8()
{
  return MEMORY[0x1E0DEB6C0]();
}

uint64_t sub_1B9DE23F4()
{
  return MEMORY[0x1E0DEB810]();
}

uint64_t sub_1B9DE2400()
{
  return MEMORY[0x1E0CB1C58]();
}

uint64_t sub_1B9DE240C()
{
  return MEMORY[0x1E0D416B8]();
}

uint64_t sub_1B9DE2418()
{
  return MEMORY[0x1E0DF2270]();
}

uint64_t sub_1B9DE2424()
{
  return MEMORY[0x1E0DF2278]();
}

uint64_t sub_1B9DE2430()
{
  return MEMORY[0x1E0DF2280]();
}

uint64_t sub_1B9DE243C()
{
  return MEMORY[0x1E0DF2290]();
}

uint64_t sub_1B9DE2448()
{
  return MEMORY[0x1E0C9B940]();
}

uint64_t sub_1B9DE2454()
{
  return MEMORY[0x1E0C9B950]();
}

uint64_t sub_1B9DE2460()
{
  return MEMORY[0x1E0C9B958]();
}

uint64_t sub_1B9DE246C()
{
  return MEMORY[0x1E0C9B960]();
}

uint64_t sub_1B9DE2478()
{
  return MEMORY[0x1E0C9B978]();
}

uint64_t sub_1B9DE2484()
{
  return MEMORY[0x1E0DEF7D8]();
}

uint64_t sub_1B9DE2490()
{
  return MEMORY[0x1E0DEF7E0]();
}

uint64_t sub_1B9DE249C()
{
  return MEMORY[0x1E0DEF800]();
}

uint64_t sub_1B9DE24A8()
{
  return MEMORY[0x1E0DEF810]();
}

uint64_t sub_1B9DE24B4()
{
  return MEMORY[0x1E0DEF840]();
}

uint64_t sub_1B9DE24C0()
{
  return MEMORY[0x1E0DEF848]();
}

uint64_t sub_1B9DE24CC()
{
  return MEMORY[0x1E0DEF8E0]();
}

uint64_t sub_1B9DE24D8()
{
  return MEMORY[0x1E0DEF8E8]();
}

uint64_t sub_1B9DE24E4()
{
  return MEMORY[0x1E0DEF8F0]();
}

uint64_t sub_1B9DE24F0()
{
  return MEMORY[0x1E0DEF8F8]();
}

uint64_t sub_1B9DE24FC()
{
  return MEMORY[0x1E0DEF900]();
}

uint64_t sub_1B9DE2508()
{
  return MEMORY[0x1E0DEF910]();
}

uint64_t sub_1B9DE2514()
{
  return MEMORY[0x1E0DEF920]();
}

uint64_t sub_1B9DE2520()
{
  return MEMORY[0x1E0D42618]();
}

uint64_t sub_1B9DE252C()
{
  return MEMORY[0x1E0D42620]();
}

uint64_t sub_1B9DE2538()
{
  return MEMORY[0x1E0DC2C38]();
}

uint64_t sub_1B9DE2544()
{
  return MEMORY[0x1E0D42648]();
}

uint64_t sub_1B9DE2550()
{
  return MEMORY[0x1E0DEF300]();
}

uint64_t sub_1B9DE255C()
{
  return MEMORY[0x1E0DEF338]();
}

uint64_t sub_1B9DE2568()
{
  return MEMORY[0x1E0D42680]();
}

uint64_t sub_1B9DE2574()
{
  return MEMORY[0x1E0D41740]();
}

uint64_t sub_1B9DE2580()
{
  return MEMORY[0x1E0DC2FD8]();
}

uint64_t sub_1B9DE258C()
{
  return MEMORY[0x1E0DEFCD8]();
}

uint64_t sub_1B9DE2598()
{
  return MEMORY[0x1E0DEFCE0]();
}

uint64_t sub_1B9DE25A4()
{
  return MEMORY[0x1E0CB2190]();
}

uint64_t sub_1B9DE25B0()
{
  return MEMORY[0x1E0DF22E0]();
}

uint64_t sub_1B9DE25BC()
{
  return MEMORY[0x1E0DEB940]();
}

uint64_t sub_1B9DE25C8()
{
  return MEMORY[0x1E0CB2460]();
}

uint64_t sub_1B9DE25D4()
{
  return MEMORY[0x1E0CB2480]();
}

uint64_t sub_1B9DE25E0()
{
  return MEMORY[0x1E0CB24A8]();
}

uint64_t sub_1B9DE25EC()
{
  return MEMORY[0x1E0CB24C8]();
}

uint64_t sub_1B9DE25F8()
{
  return MEMORY[0x1E0CB2568]();
}

uint64_t sub_1B9DE2604()
{
  return MEMORY[0x1E0DEBE50]();
}

uint64_t sub_1B9DE2610()
{
  return MEMORY[0x1E0DEC050]();
}

uint64_t sub_1B9DE261C()
{
  return MEMORY[0x1E0DEC060]();
}

uint64_t sub_1B9DE2628()
{
  return MEMORY[0x1E0DEC068]();
}

uint64_t sub_1B9DE2634()
{
  return MEMORY[0x1E0DEC078]();
}

uint64_t sub_1B9DE2640()
{
  return MEMORY[0x1E0DEC0A8]();
}

uint64_t sub_1B9DE264C()
{
  return MEMORY[0x1E0DEC0B0]();
}

uint64_t sub_1B9DE2658()
{
  return MEMORY[0x1E0DEC0C8]();
}

uint64_t sub_1B9DE2664()
{
  return MEMORY[0x1E0DEC0D0]();
}

uint64_t sub_1B9DE2670()
{
  return MEMORY[0x1E0DEC0D8]();
}

uint64_t sub_1B9DE267C()
{
  return MEMORY[0x1E0DEC0E0]();
}

uint64_t sub_1B9DE2688()
{
  return MEMORY[0x1E0DEC0F8]();
}

uint64_t sub_1B9DE2694()
{
  return MEMORY[0x1E0DEC100]();
}

uint64_t sub_1B9DE26A0()
{
  return MEMORY[0x1E0DEC110]();
}

uint64_t sub_1B9DE26AC()
{
  return MEMORY[0x1E0DEC118]();
}

uint64_t sub_1B9DE26B8()
{
  return MEMORY[0x1E0DEC120]();
}

uint64_t sub_1B9DE26C4()
{
  return MEMORY[0x1E0DEC168]();
}

uint64_t sub_1B9DE26D0()
{
  return MEMORY[0x1E0DEC178]();
}

uint64_t sub_1B9DE26DC()
{
  return MEMORY[0x1E0DEC1B0]();
}

uint64_t sub_1B9DE26E8()
{
  return MEMORY[0x1E0DEC248]();
}

uint64_t sub_1B9DE26F4()
{
  return MEMORY[0x1E0DEC250]();
}

uint64_t sub_1B9DE2700()
{
  return MEMORY[0x1E0DEC258]();
}

uint64_t sub_1B9DE270C()
{
  return MEMORY[0x1E0DEC260]();
}

uint64_t sub_1B9DE2718()
{
  return MEMORY[0x1E0DEC280]();
}

uint64_t sub_1B9DE2724()
{
  return MEMORY[0x1E0DEC2A8]();
}

uint64_t sub_1B9DE2730()
{
  return MEMORY[0x1E0DEC370]();
}

uint64_t sub_1B9DE273C()
{
  return MEMORY[0x1E0DEC378]();
}

uint64_t sub_1B9DE2748()
{
  return MEMORY[0x1E0DEC380]();
}

uint64_t sub_1B9DE2754()
{
  return MEMORY[0x1E0DEC390]();
}

uint64_t sub_1B9DE2760()
{
  return MEMORY[0x1E0DEC3D8]();
}

uint64_t sub_1B9DE276C()
{
  return MEMORY[0x1E0DEC3E0]();
}

uint64_t sub_1B9DE2778()
{
  return MEMORY[0x1E0DEC3E8]();
}

uint64_t sub_1B9DE2784()
{
  return MEMORY[0x1E0DEC588]();
}

uint64_t sub_1B9DE2790()
{
  return MEMORY[0x1E0DEC8D8]();
}

uint64_t sub_1B9DE279C()
{
  return MEMORY[0x1E0DEC8E0]();
}

uint64_t sub_1B9DE27A8()
{
  return MEMORY[0x1E0DECAE0]();
}

uint64_t sub_1B9DE27B4()
{
  return MEMORY[0x1E0DECAF8]();
}

uint64_t sub_1B9DE27C0()
{
  return MEMORY[0x1E0DECB00]();
}

uint64_t sub_1B9DE27CC()
{
  return MEMORY[0x1E0DECB40]();
}

uint64_t sub_1B9DE27D8()
{
  return MEMORY[0x1E0DECBB8]();
}

uint64_t sub_1B9DE27E4()
{
  return MEMORY[0x1E0DECBE8]();
}

uint64_t sub_1B9DE27F0()
{
  return MEMORY[0x1E0DECD18]();
}

uint64_t sub_1B9DE27FC()
{
  return MEMORY[0x1E0DECD40]();
}

uint64_t sub_1B9DE2808()
{
  return MEMORY[0x1E0DECD50]();
}

uint64_t sub_1B9DE2814()
{
  return MEMORY[0x1E0DECE70]();
}

uint64_t sub_1B9DE2820()
{
  return MEMORY[0x1E0DECF28]();
}

uint64_t sub_1B9DE282C()
{
  return MEMORY[0x1E0DECFC0]();
}

uint64_t sub_1B9DE2838()
{
  return MEMORY[0x1E0DECFC8]();
}

uint64_t sub_1B9DE2844()
{
  return MEMORY[0x1E0DECFF0]();
}

uint64_t sub_1B9DE2850()
{
  return MEMORY[0x1E0DED0F0]();
}

uint64_t sub_1B9DE285C()
{
  return MEMORY[0x1E0DED0F8]();
}

uint64_t sub_1B9DE2868()
{
  return MEMORY[0x1E0DED120]();
}

uint64_t sub_1B9DE2874()
{
  return MEMORY[0x1E0DED1D0]();
}

uint64_t sub_1B9DE2880()
{
  return MEMORY[0x1E0DED4A0]();
}

uint64_t sub_1B9DE288C()
{
  return MEMORY[0x1E0DED5A8]();
}

uint64_t sub_1B9DE2898()
{
  return MEMORY[0x1E0DED5F0]();
}

uint64_t sub_1B9DE28A4()
{
  return MEMORY[0x1E0DED600]();
}

uint64_t sub_1B9DE28B0()
{
  return MEMORY[0x1E0DED790]();
}

uint64_t sub_1B9DE28BC()
{
  return MEMORY[0x1E0DED998]();
}

uint64_t sub_1B9DE28C8()
{
  return MEMORY[0x1E0DED9F8]();
}

uint64_t sub_1B9DE28D4()
{
  return MEMORY[0x1E0DEDA30]();
}

uint64_t sub_1B9DE28E0()
{
  return MEMORY[0x1E0DEDAE0]();
}

uint64_t sub_1B9DE28EC()
{
  return MEMORY[0x1E0DEDAE8]();
}

uint64_t sub_1B9DE28F8()
{
  return MEMORY[0x1E0CB2628]();
}

uint64_t sub_1B9DE2904()
{
  return MEMORY[0x1E0CB2640]();
}

uint64_t sub_1B9DE2910()
{
  return MEMORY[0x1E0CB2650]();
}

uint64_t sub_1B9DE291C()
{
  return MEMORY[0x1E0DEDB10]();
}

uint64_t sub_1B9DE2928()
{
  return MEMORY[0x1E0DEDB18]();
}

uint64_t sub_1B9DE2934()
{
  return MEMORY[0x1E0DEDB20]();
}

uint64_t sub_1B9DE2940()
{
  return MEMORY[0x1E0DEDB28]();
}

uint64_t sub_1B9DE294C()
{
  return MEMORY[0x1E0DEDEF8]();
}

uint64_t sub_1B9DE2958()
{
  return MEMORY[0x1E0DEDF10]();
}

uint64_t sub_1B9DE2964()
{
  return MEMORY[0x1E0DEDF18]();
}

uint64_t sub_1B9DE2970()
{
  return MEMORY[0x1E0DEDF30]();
}

uint64_t sub_1B9DE297C()
{
  return MEMORY[0x1E0DEDF40]();
}

uint64_t sub_1B9DE2988()
{
  return MEMORY[0x1E0DEE240]();
}

uint64_t sub_1B9DE2994()
{
  return MEMORY[0x1E0DEE270]();
}

uint64_t sub_1B9DE29A0()
{
  return MEMORY[0x1E0DEE8E0]();
}

uint64_t sub_1B9DE29AC()
{
  return MEMORY[0x1E0DEE8E8]();
}

uint64_t sub_1B9DE29B8()
{
  return MEMORY[0x1E0DEE978]();
}

uint64_t AMSError()
{
  return MEMORY[0x1E0CFD800]();
}

uint64_t AMSLogKey()
{
  return MEMORY[0x1E0CFD858]();
}

uint64_t AMSSetLogKey()
{
  return MEMORY[0x1E0CFD9A8]();
}

CFTimeInterval CACurrentMediaTime(void)
{
  CFTimeInterval result;

  MEMORY[0x1E0CD2388]();
  return result;
}

CATransform3D *__cdecl CATransform3DMakeScale(CATransform3D *__return_ptr retstr, CGFloat sx, CGFloat sy, CGFloat sz)
{
  return (CATransform3D *)MEMORY[0x1E0CD2640](retstr, sx, sy, sz);
}

Boolean CFBooleanGetValue(CFBooleanRef BOOLean)
{
  return MEMORY[0x1E0C97FE0](BOOLean);
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x1E0C985B8](theDict, key);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x1E0C98BC0](cf);
}

void CGPathCloseSubpath(CGMutablePathRef path)
{
  MEMORY[0x1E0C9D310](path);
}

CGMutablePathRef CGPathCreateMutable(void)
{
  return (CGMutablePathRef)MEMORY[0x1E0C9D388]();
}

CGFloat CGRectGetHeight(CGRect rect)
{
  CGFloat result;

  MEMORY[0x1E0C9D580]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMaxX(CGRect rect)
{
  CGFloat result;

  MEMORY[0x1E0C9D588]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMaxY(CGRect rect)
{
  CGFloat result;

  MEMORY[0x1E0C9D5A0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMidX(CGRect rect)
{
  CGFloat result;

  MEMORY[0x1E0C9D5A8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMidY(CGRect rect)
{
  CGFloat result;

  MEMORY[0x1E0C9D5B0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMinX(CGRect rect)
{
  CGFloat result;

  MEMORY[0x1E0C9D5C0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMinY(CGRect rect)
{
  CGFloat result;

  MEMORY[0x1E0C9D5C8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetWidth(CGRect rect)
{
  CGFloat result;

  MEMORY[0x1E0C9D5D0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGRect CGRectInset(CGRect rect, CGFloat dx, CGFloat dy)
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  MEMORY[0x1E0C9D5E8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, dx, dy);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

Float64 CMTimeGetSeconds(CMTime *time)
{
  Float64 result;

  MEMORY[0x1E0C9F310](time);
  return result;
}

CMTime *__cdecl CMTimebaseGetTime(CMTime *__return_ptr retstr, CMTimebaseRef timebase)
{
  return (CMTime *)MEMORY[0x1E0C9F470](retstr, timebase);
}

uint64_t LIIconContinuousCornerRadiusForVariant()
{
  return MEMORY[0x1E0D4E3F0]();
}

uint64_t LIIconOutputSizeForVariant()
{
  return MEMORY[0x1E0D4E400]();
}

uint64_t MGCopyAnswerWithError()
{
  return MEMORY[0x1E0DE2B38]();
}

uint64_t MGGetBoolAnswer()
{
  return MEMORY[0x1E0DE2B50]();
}

uint64_t MGGetStringAnswer()
{
  return MEMORY[0x1E0DE2B80]();
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x1E0CB28A0](aClassName);
}

void NSLog(NSString *format, ...)
{
  MEMORY[0x1E0CB2D88](format);
}

BOOL UIAccessibilityIsVoiceOverRunning(void)
{
  return MEMORY[0x1E0DC4570]();
}

void UIGraphicsBeginImageContextWithOptions(CGSize size, BOOL opaque, CGFloat scale)
{
  MEMORY[0x1E0DC4BC0](opaque, (__n128)size, *(__n128 *)&size.height, scale);
}

void UIGraphicsEndImageContext(void)
{
  MEMORY[0x1E0DC4BD8]();
}

UIImage *UIGraphicsGetImageFromCurrentImageContext(void)
{
  return (UIImage *)MEMORY[0x1E0DC4BF0]();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x1E0C80928](aBlock);
}

void _Block_release(const void *aBlock)
{
  MEMORY[0x1E0C80958](aBlock);
}

uint64_t _CTServerConnectionCopyCellularUsagePolicy()
{
  return MEMORY[0x1E0CA6E80]();
}

uint64_t _CTServerConnectionCreateOnTargetQueue()
{
  return MEMORY[0x1E0CA6F30]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x1E0C80A20](exception_object);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81048](dso, log, type, format, buf, *(_QWORD *)&size);
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x1E0DEEA40]();
}

uint64_t _swift_stdlib_strtod_clocale()
{
  return MEMORY[0x1E0DEEA50]();
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x1E0C81758](a1, a2);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82C00](queue, block);
}

dispatch_group_t dispatch_group_create(void)
{
  return (dispatch_group_t)MEMORY[0x1E0C82D20]();
}

void dispatch_group_enter(dispatch_group_t group)
{
  MEMORY[0x1E0C82D28](group);
}

void dispatch_group_leave(dispatch_group_t group)
{
  MEMORY[0x1E0C82D30](group);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x1E0C82E08](predicate, block);
}

void free(void *a1)
{
  MEMORY[0x1E0C834A8](a1);
}

htmlParserCtxtPtr htmlCreateMemoryParserCtxt(const char *buffer, int size)
{
  return (htmlParserCtxtPtr)MEMORY[0x1E0DE8C10](buffer, *(_QWORD *)&size);
}

int htmlCtxtUseOptions(htmlParserCtxtPtr ctxt, int options)
{
  return MEMORY[0x1E0DE8C20](ctxt, *(_QWORD *)&options);
}

int htmlParseDocument(htmlParserCtxtPtr ctxt)
{
  return MEMORY[0x1E0DE8C38](ctxt);
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

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x1E0DE7BA8](a1);
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x1E0DE7BB0](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x1E0DE7BB8]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7BE8](a1);
}

id objc_begin_catch(void *exc_buf)
{
  return (id)MEMORY[0x1E0DE7BF0](exc_buf);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x1E0DE7BF8]();
}

void objc_copyWeak(id *to, id *from)
{
  MEMORY[0x1E0DE7C38](to, from);
}

void objc_destroyWeak(id *location)
{
  MEMORY[0x1E0DE7C60](location);
}

void objc_end_catch(void)
{
  MEMORY[0x1E0DE7C80]();
}

void objc_enumerationMutation(id obj)
{
  MEMORY[0x1E0DE7C90](obj);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x1E0DE7CE0](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x1E0DE7D08](location);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x1E0DE7D20](a1, a2);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x1E0DE7D30](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x1E0DE7D38]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x1E0DE7D40]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x1E0DE7D50]();
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

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x1E0DE7E58](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7E60](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7E68](a1);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x1E0DE7FB0](location, obj);
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x1E0DE7FB8](location, obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7FE0](a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1E0C84780](oslog, type);
}

uint64_t os_variant_has_internal_content()
{
  return MEMORY[0x1E0C849F0]();
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

uint64_t swift_allocateGenericClassMetadata()
{
  return MEMORY[0x1E0DEEAB8]();
}

uint64_t swift_allocateGenericValueMetadata()
{
  return MEMORY[0x1E0DEEAC0]();
}

uint64_t swift_arrayDestroy()
{
  return MEMORY[0x1E0DEEAD8]();
}

uint64_t swift_arrayInitWithCopy()
{
  return MEMORY[0x1E0DEEAE0]();
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

uint64_t swift_conformsToProtocol2()
{
  return MEMORY[0x1E0DEEB40]();
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

uint64_t swift_deletedMethodError()
{
  return MEMORY[0x1E0DEEB78]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x1E0DEEB80]();
}

uint64_t swift_dynamicCastObjCClass()
{
  return MEMORY[0x1E0DEEBA8]();
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

uint64_t swift_getAssociatedConformanceWitness()
{
  return MEMORY[0x1E0DEEC00]();
}

uint64_t swift_getAssociatedTypeWitness()
{
  return MEMORY[0x1E0DEEC08]();
}

uint64_t swift_getDynamicType()
{
  return MEMORY[0x1E0DEEC38]();
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

uint64_t swift_getKeyPath()
{
  return MEMORY[0x1E0DEECB8]();
}

uint64_t swift_getMetatypeMetadata()
{
  return MEMORY[0x1E0DEECC0]();
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

uint64_t swift_getTupleTypeMetadata2()
{
  return MEMORY[0x1E0DEED20]();
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

uint64_t swift_initClassMetadata2()
{
  return MEMORY[0x1E0DEED58]();
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

uint64_t swift_initStructMetadata()
{
  return MEMORY[0x1E0DEED88]();
}

uint64_t swift_isEscapingClosureAtFileLocation()
{
  return MEMORY[0x1E0DEED98]();
}

uint64_t swift_isUniquelyReferenced_native()
{
  return MEMORY[0x1E0DEEDB8]();
}

uint64_t swift_isUniquelyReferenced_nonNull_bridgeObject()
{
  return MEMORY[0x1E0DEEDC8]();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x1E0DEEDD0]();
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

uint64_t swift_slowAlloc()
{
  return MEMORY[0x1E0DEEE78]();
}

uint64_t swift_slowDealloc()
{
  return MEMORY[0x1E0DEEE80]();
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

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x1E0DEEEC0]();
}

uint64_t swift_unknownObjectRelease_n()
{
  return MEMORY[0x1E0DEEEC8]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x1E0DEEED0]();
}

uint64_t swift_unknownObjectWeakAssign()
{
  return MEMORY[0x1E0DEEF20]();
}

uint64_t swift_unknownObjectWeakDestroy()
{
  return MEMORY[0x1E0DEEF38]();
}

uint64_t swift_unknownObjectWeakInit()
{
  return MEMORY[0x1E0DEEF40]();
}

uint64_t swift_unknownObjectWeakLoadStrong()
{
  return MEMORY[0x1E0DEEF48]();
}

uint64_t swift_updateClassMetadata2()
{
  return MEMORY[0x1E0DEEF78]();
}

uint64_t swift_weakAssign()
{
  return MEMORY[0x1E0DEEF80]();
}

uint64_t swift_weakDestroy()
{
  return MEMORY[0x1E0DEEF98]();
}

uint64_t swift_weakInit()
{
  return MEMORY[0x1E0DEEFA0]();
}

uint64_t swift_weakLoadStrong()
{
  return MEMORY[0x1E0DEEFA8]();
}

uint64_t swift_willThrow()
{
  return MEMORY[0x1E0DEEFC0]();
}

uint64_t swift_willThrowTypedImpl()
{
  return MEMORY[0x1E0DEEFC8]();
}

xmlErrorPtr xmlCtxtGetLastError(void *ctx)
{
  return (xmlErrorPtr)MEMORY[0x1E0DE8CC8](ctx);
}

void xmlFreeDoc(xmlDocPtr cur)
{
  MEMORY[0x1E0DE8D38](cur);
}

void xmlFreeParserCtxt(xmlParserCtxtPtr ctxt)
{
  MEMORY[0x1E0DE8D50](ctxt);
}

void xmlInitParser(void)
{
  MEMORY[0x1E0DE8DC0]();
}

void xmlStopParser(xmlParserCtxtPtr ctxt)
{
  MEMORY[0x1E0DE8FF0](ctxt);
}

int xmlStrEqual(const xmlChar *str1, const xmlChar *str2)
{
  return MEMORY[0x1E0DE8FF8](str1, str2);
}

int xmlStrlen(const xmlChar *str)
{
  return MEMORY[0x1E0DE9010](str);
}

