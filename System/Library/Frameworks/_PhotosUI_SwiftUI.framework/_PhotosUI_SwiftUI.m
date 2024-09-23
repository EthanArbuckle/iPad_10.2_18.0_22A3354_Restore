uint64_t View._photosSharedAlbumsView(isPresented:posting:preselecting:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return OUTLINED_FUNCTION_84(a1, a2, a3, a4, a5, a6, a7, a8);
}

{
  return OUTLINED_FUNCTION_84(a1, a2, a3, a4, a5, a6, a7, a8);
}

__n128 sub_20D120AC4@<Q0>(unint64_t a1@<X0>, unint64_t a2@<X1>, unsigned __int8 a3@<W2>, unint64_t a4@<X3>, unint64_t a5@<X4>, unint64_t a6@<X5>, unint64_t a7@<X6>, unint64_t a8@<X7>, __n128 *a9@<X8>)
{
  __n128 result;
  unint64_t v19;
  __n128 v20;

  __swift_instantiateConcreteTypeFromMangledName(&qword_2549A5918);
  sub_20D137B10();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2549A5928);
  sub_20D137B88();
  result = v20;
  a9->n128_u64[0] = a7;
  a9->n128_u64[1] = a8;
  a9[1].n128_u64[0] = a4;
  a9[1].n128_u64[1] = a5;
  a9[2].n128_u64[0] = a6;
  a9[2].n128_u64[1] = v19;
  a9[3] = v20;
  a9[4].n128_u64[0] = a1;
  a9[4].n128_u64[1] = a2;
  a9[5].n128_u8[0] = a3;
  a9[5].n128_u64[1] = v19;
  a9[6].n128_u64[0] = v20.n128_u64[0];
  return result;
}

uint64_t sub_20D120B9C(uint64_t a1)
{
  void *v2;

  v2 = *(void **)(a1 + 88);
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_release();

  swift_release();
  return a1;
}

uint64_t sub_20D120C78(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void (*a11)(_QWORD *__return_ptr, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))
{
  _BYTE v20[104];
  _QWORD v21[14];

  swift_bridgeObjectRetain();
  swift_retain();
  swift_retain();
  OUTLINED_FUNCTION_66();
  swift_retain();
  swift_bridgeObjectRetain();
  a11(v21, a1, a2, a3, a4, a5, a6, a7, a8);
  OUTLINED_FUNCTION_86(v20, v21);
  MEMORY[0x212B9D050](v20, a9, &type metadata for _PostToSharedAlbumModifer, a10);
  return sub_20D120B9C((uint64_t)v21);
}

__n128 sub_20D120D70@<Q0>(uint64_t a1@<X0>, uint64_t a2@<X1>, char a3@<W2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, uint64_t a9@<X8>)
{
  __n128 result;
  uint64_t v19;
  __n128 v20;

  __swift_instantiateConcreteTypeFromMangledName(&qword_2549A5918);
  sub_20D137B10();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2549A5920);
  sub_20D137B88();
  result = v20;
  *(_QWORD *)a9 = a7;
  *(_QWORD *)(a9 + 8) = a8;
  *(_QWORD *)(a9 + 16) = v19;
  *(__n128 *)(a9 + 24) = v20;
  *(_QWORD *)(a9 + 40) = a4;
  *(_QWORD *)(a9 + 48) = a5;
  *(_QWORD *)(a9 + 56) = a6;
  *(_QWORD *)(a9 + 64) = a1;
  *(_QWORD *)(a9 + 72) = a2;
  *(_BYTE *)(a9 + 80) = a3;
  *(_QWORD *)(a9 + 88) = v19;
  *(_QWORD *)(a9 + 96) = v20.n128_u64[0];
  return result;
}

void sub_20D120E4C(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  uint64_t v18;

  v2 = v1;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549A57F8);
  MEMORY[0x24BDAC7A8]();
  v6 = (char *)&v15 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_20D137B94();
  v9 = v8;
  v16 = *(_OWORD *)(v1 + 88);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2549A5800);
  sub_20D137B34();
  v15 = v17;
  v10 = v18;
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549A5808);
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 16))(v6, a1, v11);
  v12 = &v6[*(int *)(v4 + 36)];
  *(_OWORD *)v12 = v15;
  *((_QWORD *)v12 + 2) = v10;
  *((_QWORD *)v12 + 3) = v7;
  *((_QWORD *)v12 + 4) = v9;
  v17 = *(_OWORD *)(v2 + 64);
  LOBYTE(v18) = *(_BYTE *)(v2 + 80);
  v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549A5810);
  MEMORY[0x212B9D0B0](&v16, v13);
  LOBYTE(v17) = v16;
  v14 = swift_allocObject();
  memcpy((void *)(v14 + 16), (const void *)v2, 0x68uLL);
  sub_20D124E20(v2);
  sub_20D124ED8();
  sub_20D137B04();
  swift_release();
  sub_20D125F04((uint64_t)v6, &qword_2549A57F8);
}

uint64_t sub_20D120FFC(uint64_t a1, _BYTE *a2, const void *a3)
{
  uint64_t result;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  uint64_t v11;
  uint64_t v12;

  __swift_instantiateConcreteTypeFromMangledName(&qword_2549A5838);
  result = MEMORY[0x24BDAC7A8]();
  v7 = (char *)&v12 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (*a2 == 1)
  {
    v8 = sub_20D137E94();
    __swift_storeEnumTagSinglePayload((uint64_t)v7, 1, 1, v8);
    sub_20D137E7C();
    sub_20D124E20((uint64_t)a3);
    v9 = sub_20D137E70();
    v10 = (_QWORD *)swift_allocObject();
    v11 = MEMORY[0x24BEE6930];
    v10[2] = v9;
    v10[3] = v11;
    memcpy(v10 + 4, a3, 0x68uLL);
    sub_20D122134((uint64_t)v7, (uint64_t)&unk_2549A5848, (uint64_t)v10);
    return swift_release();
  }
  return result;
}

uint64_t sub_20D1210F0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v4;
  uint64_t v5;

  v4[31] = a4;
  sub_20D137E7C();
  v4[32] = sub_20D137E70();
  v4[33] = sub_20D137E40();
  v4[34] = v5;
  return swift_task_switch();
}

void sub_20D12115C()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;

  OUTLINED_FUNCTION_56();
  v1 = *(_QWORD **)(v0 + 248);
  v2 = v1[2];
  *(_QWORD *)(v0 + 280) = v2;
  v3 = v1[3];
  *(_QWORD *)(v0 + 288) = v3;
  v4 = v1[4];
  *(_QWORD *)(v0 + 112) = v2;
  *(_QWORD *)(v0 + 296) = v4;
  *(_QWORD *)(v0 + 120) = v3;
  *(_QWORD *)(v0 + 128) = v4;
  *(_QWORD *)(v0 + 304) = __swift_instantiateConcreteTypeFromMangledName(&qword_2549A5850);
  MEMORY[0x212B9D0B0]();
  v5 = *(_QWORD *)(*(_QWORD *)(v0 + 200) + 16);
  swift_bridgeObjectRelease();
  if (v5)
  {
    *(_QWORD *)(v0 + 160) = v2;
    *(_QWORD *)(v0 + 168) = v3;
    *(_QWORD *)(v0 + 176) = v4;
    OUTLINED_FUNCTION_43();
  }
  v6 = *(_QWORD *)(v0 + 248);
  v7 = *(_QWORD *)(v6 + 56);
  *(_OWORD *)(v0 + 64) = *(_OWORD *)(v6 + 40);
  *(_QWORD *)(v0 + 80) = v7;
  v8 = *(_QWORD *)(v6 + 56);
  *(_OWORD *)(v0 + 40) = *(_OWORD *)(v6 + 40);
  *(_QWORD *)(v0 + 56) = v8;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2549A5860);
  MEMORY[0x212B9D0B0]();
  v9 = *(_QWORD *)(v0 + 216);
  if (v9 >> 62)
  {
    swift_bridgeObjectRetain();
    v10 = sub_20D137F90();
    OUTLINED_FUNCTION_19();
  }
  else
  {
    v10 = *(_QWORD *)((v9 & 0xFFFFFFFFFFFFF8) + 0x10);
  }
  OUTLINED_FUNCTION_19();
  if (v10)
  {
    *(_OWORD *)(v0 + 16) = *(_OWORD *)(v0 + 64);
    *(_QWORD *)(v0 + 32) = *(_QWORD *)(v0 + 80);
    OUTLINED_FUNCTION_43();
  }
  OUTLINED_FUNCTION_72();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_66();
  sub_20D125110(v0 + 64);
  OUTLINED_FUNCTION_43();
}

uint64_t sub_20D121374()
{
  _QWORD *v0;

  OUTLINED_FUNCTION_26();
  OUTLINED_FUNCTION_83(v0);
  OUTLINED_FUNCTION_19();
  return OUTLINED_FUNCTION_0();
}

void sub_20D1213B4()
{
  uint64_t v0;

  OUTLINED_FUNCTION_56();
  OUTLINED_FUNCTION_72();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_66();
  sub_20D125110(v0);
  OUTLINED_FUNCTION_43();
}

uint64_t sub_20D1213E8()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t (*v6)(void);

  swift_bridgeObjectRelease();
  v1[11] = v5;
  v1[12] = v3;
  v1[13] = v4;
  OUTLINED_FUNCTION_42(MEMORY[0x24BEE4AF8]);
  sub_20D125138(v0);
  swift_release();
  sub_20D125160(v2);
  v6 = (uint64_t (*)(void))OUTLINED_FUNCTION_60();
  return OUTLINED_FUNCTION_4(v6);
}

uint64_t sub_20D12143C()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;
  _QWORD *v3;

  OUTLINED_FUNCTION_26();
  *v3 = *v2;
  *(_QWORD *)(v0 + 344) = v1;
  swift_task_dealloc();
  if (!v1)
    swift_bridgeObjectRelease();
  return OUTLINED_FUNCTION_0();
}

uint64_t sub_20D12149C()
{
  uint64_t v0;

  swift_bridgeObjectRelease();
  swift_release();
  return OUTLINED_FUNCTION_27(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_20D1214D4(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;

  v2[8] = a1;
  v2[9] = v1;
  v2[10] = __swift_instantiateConcreteTypeFromMangledName(&qword_2549A58A0);
  v2[11] = swift_task_alloc();
  v2[12] = type metadata accessor for Photo(0);
  v2[13] = swift_task_alloc();
  v3 = sub_20D1378D0();
  v2[14] = v3;
  v2[15] = *(_QWORD *)(v3 - 8);
  v2[16] = swift_task_alloc();
  v2[17] = __swift_instantiateConcreteTypeFromMangledName(&qword_2549A58A8);
  v2[18] = swift_task_alloc();
  v2[19] = type metadata accessor for Movie(0);
  v2[20] = swift_task_alloc();
  sub_20D137E7C();
  v2[21] = sub_20D137E70();
  v2[22] = sub_20D137E40();
  v2[23] = v4;
  return swift_task_switch();
}

uint64_t sub_20D121600()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  __int128 v4;
  __int128 v5;
  _QWORD *v7;
  uint64_t v8;

  v1 = *(_QWORD *)(v0 + 64);
  v2 = MEMORY[0x24BEE4AF8];
  *(_QWORD *)(v0 + 56) = MEMORY[0x24BEE4AF8];
  v3 = *(_QWORD *)(v1 + 16);
  *(_QWORD *)(v0 + 192) = v3;
  if (v3)
  {
    *(_QWORD *)(v0 + 200) = 0;
    v4 = *(_OWORD *)(v1 + 32);
    v5 = *(_OWORD *)(v1 + 48);
    *(_QWORD *)(v0 + 48) = *(_QWORD *)(v1 + 64);
    *(_OWORD *)(v0 + 16) = v4;
    *(_OWORD *)(v0 + 32) = v5;
    swift_bridgeObjectRetain();
    sub_20D125450(v0 + 16);
    OUTLINED_FUNCTION_22();
    return OUTLINED_FUNCTION_0();
  }
  else
  {
    *(_QWORD *)(v0 + 256) = v2;
    v7 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 264) = v7;
    v8 = OUTLINED_FUNCTION_10(v7, (uint64_t)sub_20D121C4C);
    return OUTLINED_FUNCTION_1(v8);
  }
}

uint64_t sub_20D121698()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;

  v2 = OUTLINED_FUNCTION_67();
  *(_QWORD *)(v1 + 208) = v2;
  *(_QWORD *)(v2 + 16) = v0;
  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 216) = v3;
  *v3 = v1;
  v3[1] = sub_20D121708;
  OUTLINED_FUNCTION_29();
  return OUTLINED_FUNCTION_24();
}

uint64_t sub_20D121708()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;
  _QWORD *v3;

  OUTLINED_FUNCTION_26();
  *v3 = *v2;
  *(_QWORD *)(v0 + 224) = v1;
  swift_task_dealloc();
  if (v1)
    OUTLINED_FUNCTION_22();
  else
    swift_task_dealloc();
  return OUTLINED_FUNCTION_0();
}

uint64_t sub_20D121768()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t EnumTagSinglePayload;
  uint64_t v3;
  uint64_t v4;
  id v5;

  OUTLINED_FUNCTION_56();
  v1 = v0[18];
  EnumTagSinglePayload = __swift_getEnumTagSinglePayload(v1, 1, v0[19]);
  if ((_DWORD)EnumTagSinglePayload != 1)
  {
    v3 = v0[15];
    sub_20D125544(v1, v0[20], type metadata accessor for Movie);
    v4 = OUTLINED_FUNCTION_82();
    sub_20D1378C4();
    sub_20D137888();
    OUTLINED_FUNCTION_34(*(uint64_t (**)(uint64_t, uint64_t))(v3 + 8));
    v5 = objc_allocWithZone(MEMORY[0x24BDD15F0]);
    OUTLINED_FUNCTION_52(v4);
    OUTLINED_FUNCTION_79();
  }
  OUTLINED_FUNCTION_55(EnumTagSinglePayload, &qword_2549A58A8);
  OUTLINED_FUNCTION_22();
  return OUTLINED_FUNCTION_0();
}

uint64_t sub_20D1218BC()
{
  uint64_t v0;

  OUTLINED_FUNCTION_23();
  return OUTLINED_FUNCTION_6();
}

uint64_t sub_20D1218F4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;

  OUTLINED_FUNCTION_39(*(_QWORD *)(v3 + 144), a2, a3, *(_QWORD *)(v3 + 152));
  sub_20D125F04(*(_QWORD *)(v3 + 144), &qword_2549A58A8);
  OUTLINED_FUNCTION_22();
  return OUTLINED_FUNCTION_6();
}

uint64_t sub_20D121934()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;

  v2 = OUTLINED_FUNCTION_67();
  *(_QWORD *)(v1 + 232) = v2;
  *(_QWORD *)(v2 + 16) = v0;
  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 240) = v3;
  *v3 = v1;
  v3[1] = sub_20D1219A4;
  OUTLINED_FUNCTION_29();
  return OUTLINED_FUNCTION_24();
}

uint64_t sub_20D1219A4()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;
  _QWORD *v3;

  OUTLINED_FUNCTION_26();
  *v3 = *v2;
  *(_QWORD *)(v0 + 248) = v1;
  swift_task_dealloc();
  if (v1)
    OUTLINED_FUNCTION_22();
  else
    swift_task_dealloc();
  return OUTLINED_FUNCTION_0();
}

uint64_t sub_20D121A04()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  char v8;
  uint64_t v9;
  _QWORD *v10;
  uint64_t v11;

  OUTLINED_FUNCTION_56();
  v1 = v0[11];
  if (__swift_getEnumTagSinglePayload(v1, 1, v0[12]) != 1)
  {
    v4 = v0[15];
    v3 = v0[16];
    v5 = v0[14];
    sub_20D125544(v1, v0[13], type metadata accessor for Photo);
    v6 = sub_20D1377EC();
    sub_20D1378B8();
    sub_20D137888();
    (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v3, v5);
    v7 = objc_allocWithZone(MEMORY[0x24BDD15F0]);
    OUTLINED_FUNCTION_52(v6);
    OUTLINED_FUNCTION_79();
  }
  v2 = OUTLINED_FUNCTION_62();
  OUTLINED_FUNCTION_55(v2, &qword_2549A58A0);
  OUTLINED_FUNCTION_46();
  if (v8)
  {
    OUTLINED_FUNCTION_76();
    v0[32] = v0[7];
    v10 = (_QWORD *)swift_task_alloc();
    v0[33] = v10;
    v11 = OUTLINED_FUNCTION_10(v10, (uint64_t)sub_20D121C4C);
    return OUTLINED_FUNCTION_1(v11);
  }
  else
  {
    OUTLINED_FUNCTION_7(v9);
    OUTLINED_FUNCTION_22();
    return OUTLINED_FUNCTION_0();
  }
}

uint64_t sub_20D121B5C()
{
  uint64_t v0;

  OUTLINED_FUNCTION_23();
  return OUTLINED_FUNCTION_6();
}

uint64_t sub_20D121B94(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char v6;
  _QWORD *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;

  OUTLINED_FUNCTION_39(*(_QWORD *)(v3 + 88), a2, a3, *(_QWORD *)(v3 + 96));
  v4 = *(_QWORD *)(v3 + 88);
  sub_20D125500(v3 + 16);
  sub_20D125F04(v4, &qword_2549A58A0);
  OUTLINED_FUNCTION_46();
  if (v6)
  {
    OUTLINED_FUNCTION_76();
    *(_QWORD *)(v3 + 256) = *(_QWORD *)(v3 + 56);
    v7 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v3 + 264) = v7;
    v8 = OUTLINED_FUNCTION_10(v7, (uint64_t)sub_20D121C4C);
    return OUTLINED_FUNCTION_1(v8);
  }
  else
  {
    *(_QWORD *)(v3 + 200) = v5;
    v9 = *(_QWORD *)(v3 + 64) + 40 * v5;
    v10 = *(_QWORD *)(v9 + 64);
    v11 = *(_OWORD *)(v9 + 48);
    *(_OWORD *)(v3 + 16) = *(_OWORD *)(v9 + 32);
    *(_OWORD *)(v3 + 32) = v11;
    *(_QWORD *)(v3 + 48) = v10;
    sub_20D125450(v3 + 16);
    OUTLINED_FUNCTION_22();
    return OUTLINED_FUNCTION_0();
  }
}

uint64_t sub_20D121C4C()
{
  void *v0;
  uint64_t *v1;
  uint64_t v3;

  v3 = *v1;
  OUTLINED_FUNCTION_83(&v3);
  swift_bridgeObjectRelease();
  if (v0)

  return swift_task_switch();
}

uint64_t sub_20D121CC0()
{
  uint64_t v0;

  swift_release();
  OUTLINED_FUNCTION_23();
  OUTLINED_FUNCTION_32();
  OUTLINED_FUNCTION_36();
  OUTLINED_FUNCTION_33();
  OUTLINED_FUNCTION_35();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_20D121D24(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v2;

  v2[9] = a1;
  v2[10] = v1;
  sub_20D137E7C();
  v2[11] = sub_20D137E70();
  sub_20D137E40();
  return swift_task_switch();
}

uint64_t sub_20D121D90()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  unint64_t v3;
  const void *v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  NSString *v17;
  SEL v18;
  const void *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  id v23;
  uint64_t v24;
  uint64_t (*v25)(void);

  v1 = *(_QWORD *)(v0 + 80);
  swift_release();
  *(_OWORD *)(v0 + 16) = *(_OWORD *)(v1 + 88);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2549A5800);
  sub_20D137B1C();
  v2 = *(void **)(v0 + 64);
  if (v2)
  {
    v3 = *(_QWORD *)(v0 + 72);
    if (v3 >> 62)
    {
      swift_bridgeObjectRetain();
      v24 = sub_20D137F90();
      OUTLINED_FUNCTION_19();
      if (v24)
      {
LABEL_4:
        v5 = *(_QWORD *)(v0 + 72);
        v4 = *(const void **)(v0 + 80);
        v6 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDD1560]), sel_init);
        v7 = sub_20D12225C();
        v8 = sub_20D122328(v7);
        OUTLINED_FUNCTION_19();
        sub_20D1251B0(v8, v6);
        sub_20D12521C(v5, v6);
        __swift_instantiateConcreteTypeFromMangledName(&qword_2549A5870);
        v9 = OUTLINED_FUNCTION_37();
        *(_OWORD *)(v9 + 16) = xmmword_20D1384F0;
        *(_QWORD *)(v9 + 56) = sub_20D1255F0(0, &qword_2549A5878);
        *(_QWORD *)(v9 + 32) = v6;
        v10 = objc_allocWithZone(MEMORY[0x24BE8F650]);
        v11 = v6;
        v12 = sub_20D1248D0(v9, 0);
        objc_msgSend(v12, sel_willMoveToParentViewController_, v2);
        objc_msgSend(v2, sel_addChildViewController_, v12);
        objc_msgSend(v12, sel_didMoveToParentViewController_, v2);
        v13 = OUTLINED_FUNCTION_37();
        swift_unknownObjectWeakInit();
        v14 = OUTLINED_FUNCTION_37();
        *(_QWORD *)(v14 + 16) = v13;
        OUTLINED_FUNCTION_86((void *)(v14 + 24), v4);
        *(_QWORD *)(v0 + 48) = sub_20D12530C;
        *(_QWORD *)(v0 + 56) = v14;
        v15 = MEMORY[0x24BDAC760];
        *(_QWORD *)(v0 + 16) = MEMORY[0x24BDAC760];
        *(_QWORD *)(v0 + 24) = 1107296256;
        v16 = OUTLINED_FUNCTION_65((uint64_t)sub_20D122768);
        sub_20D124E20((uint64_t)v4);
        swift_release();
        objc_msgSend(v12, sel_setCompletionWithItemsHandler_, v16);
        _Block_release(v16);
        v17 = (NSString *)sub_20D137DBC();
        v18 = NSSelectorFromString(v17);

        if (objc_msgSend(v12, sel_respondsToSelector_, v18))
        {
          v19 = *(const void **)(v0 + 80);
          v20 = OUTLINED_FUNCTION_37();
          *(_QWORD *)(v20 + 16) = v12;
          OUTLINED_FUNCTION_86((void *)(v20 + 24), v19);
          v21 = OUTLINED_FUNCTION_37();
          *(_QWORD *)(v21 + 16) = sub_20D125394;
          *(_QWORD *)(v21 + 24) = v20;
          *(_QWORD *)(v0 + 48) = sub_20D1253C4;
          *(_QWORD *)(v0 + 56) = v21;
          *(_QWORD *)(v0 + 16) = v15;
          *(_QWORD *)(v0 + 24) = 1107296256;
          v22 = OUTLINED_FUNCTION_65((uint64_t)sub_20D122874);
          sub_20D124E20((uint64_t)v19);
          v23 = v12;
          swift_retain();
          swift_release();
          v12 = objc_retainAutorelease(v23);
          _Block_copy(v22);
          objc_msgSend(v12, sel_performSelector_withObject_, v18, v22);

          swift_release();
          _Block_release(v22);

          _Block_release(v22);
        }
        else
        {

        }
        goto LABEL_9;
      }
    }
    else if (*(_QWORD *)((v3 & 0xFFFFFFFFFFFFF8) + 0x10))
    {
      goto LABEL_4;
    }
    v12 = v2;
LABEL_9:

  }
  v25 = (uint64_t (*)(void))OUTLINED_FUNCTION_60();
  return OUTLINED_FUNCTION_4(v25);
}

uint64_t sub_20D122134(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;

  v5 = sub_20D137E94();
  if (__swift_getEnumTagSinglePayload(a1, 1, v5) == 1)
  {
    sub_20D125F04(a1, &qword_2549A5838);
  }
  else
  {
    sub_20D137E88();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(a1, v5);
  }
  if (*(_QWORD *)(a3 + 16))
  {
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_20D137E40();
    swift_unknownObjectRelease();
  }
  return swift_task_create();
}

uint64_t sub_20D12225C()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t inited;

  v1 = v0[1];
  if (v1)
  {
    v2 = *v0;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2549A5898);
    inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_20D1384F0;
    *(_QWORD *)(inited + 32) = 0xD000000000000028;
    *(_QWORD *)(inited + 40) = 0x800000020D139930;
    *(_QWORD *)(inited + 48) = v2;
    *(_QWORD *)(inited + 56) = v1;
    swift_bridgeObjectRetain();
  }
  return sub_20D137D98();
}

uint64_t sub_20D122328(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t result;
  int64_t v8;
  unint64_t v9;
  unint64_t v10;
  int64_t v11;
  unint64_t v12;
  int64_t v13;
  int64_t v14;
  _QWORD *v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  unint64_t v19;
  unint64_t v20;
  char v21;
  unint64_t v22;
  BOOL v23;
  uint64_t v24;
  uint64_t v25;
  int64_t v26;
  uint64_t v27;
  __int128 v28;
  __int128 v29;
  uint64_t v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  uint64_t v34;
  _OWORD v35[2];
  _OWORD v36[2];

  if (*(_QWORD *)(a1 + 16))
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_2549A5890);
    v2 = sub_20D137FA8();
  }
  else
  {
    v2 = MEMORY[0x24BEE4B00];
  }
  v27 = a1 + 64;
  v3 = -1 << *(_BYTE *)(a1 + 32);
  if (-v3 < 64)
    v4 = ~(-1 << -(char)v3);
  else
    v4 = -1;
  v5 = v4 & *(_QWORD *)(a1 + 64);
  v26 = (unint64_t)(63 - v3) >> 6;
  v6 = v2 + 64;
  swift_bridgeObjectRetain();
  result = swift_retain();
  v8 = 0;
  if (!v5)
    goto LABEL_9;
LABEL_8:
  v9 = __clz(__rbit64(v5));
  v5 &= v5 - 1;
  v10 = v9 | (v8 << 6);
  while (1)
  {
    v15 = (_QWORD *)(*(_QWORD *)(a1 + 48) + 16 * v10);
    v16 = v15[1];
    *(_QWORD *)&v36[0] = *v15;
    *((_QWORD *)&v36[0] + 1) = v16;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_dynamicCast();
    swift_dynamicCast();
    v32 = v28;
    v33 = v29;
    v34 = v30;
    sub_20D1253E0(&v31, v35);
    v28 = v32;
    v29 = v33;
    v30 = v34;
    sub_20D1253E0(v35, v36);
    sub_20D1253E0(v36, &v32);
    result = sub_20D137F3C();
    v17 = -1 << *(_BYTE *)(v2 + 32);
    v18 = result & ~v17;
    v19 = v18 >> 6;
    if (((-1 << v18) & ~*(_QWORD *)(v6 + 8 * (v18 >> 6))) == 0)
    {
      v21 = 0;
      v22 = (unint64_t)(63 - v17) >> 6;
      while (++v19 != v22 || (v21 & 1) == 0)
      {
        v23 = v19 == v22;
        if (v19 == v22)
          v19 = 0;
        v21 |= v23;
        v24 = *(_QWORD *)(v6 + 8 * v19);
        if (v24 != -1)
        {
          v20 = __clz(__rbit64(~v24)) + (v19 << 6);
          goto LABEL_34;
        }
      }
      __break(1u);
LABEL_38:
      __break(1u);
      goto LABEL_39;
    }
    v20 = __clz(__rbit64((-1 << v18) & ~*(_QWORD *)(v6 + 8 * (v18 >> 6)))) | v18 & 0x7FFFFFFFFFFFFFC0;
LABEL_34:
    *(_QWORD *)(v6 + ((v20 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v20;
    v25 = *(_QWORD *)(v2 + 48) + 40 * v20;
    *(_OWORD *)v25 = v28;
    *(_OWORD *)(v25 + 16) = v29;
    *(_QWORD *)(v25 + 32) = v30;
    result = (uint64_t)sub_20D1253E0(&v32, (_OWORD *)(*(_QWORD *)(v2 + 56) + 32 * v20));
    ++*(_QWORD *)(v2 + 16);
    if (v5)
      goto LABEL_8;
LABEL_9:
    v11 = v8 + 1;
    if (__OFADD__(v8, 1))
      goto LABEL_38;
    if (v11 >= v26)
      goto LABEL_36;
    v12 = *(_QWORD *)(v27 + 8 * v11);
    v13 = v8 + 1;
    if (!v12)
    {
      v13 = v8 + 2;
      if (v8 + 2 >= v26)
        goto LABEL_36;
      v12 = *(_QWORD *)(v27 + 8 * v13);
      if (!v12)
      {
        v13 = v8 + 3;
        if (v8 + 3 >= v26)
          goto LABEL_36;
        v12 = *(_QWORD *)(v27 + 8 * v13);
        if (!v12)
        {
          v13 = v8 + 4;
          if (v8 + 4 >= v26)
            goto LABEL_36;
          v12 = *(_QWORD *)(v27 + 8 * v13);
          if (!v12)
            break;
        }
      }
    }
LABEL_24:
    v5 = (v12 - 1) & v12;
    v10 = __clz(__rbit64(v12)) + (v13 << 6);
    v8 = v13;
  }
  v14 = v8 + 5;
  if (v8 + 5 >= v26)
  {
LABEL_36:
    swift_release();
    sub_20D1253F0();
    return v2;
  }
  v12 = *(_QWORD *)(v27 + 8 * v14);
  if (v12)
  {
    v13 = v8 + 5;
    goto LABEL_24;
  }
  while (1)
  {
    v13 = v14 + 1;
    if (__OFADD__(v14, 1))
      break;
    if (v13 >= v26)
      goto LABEL_36;
    v12 = *(_QWORD *)(v27 + 8 * v13);
    ++v14;
    if (v12)
      goto LABEL_24;
  }
LABEL_39:
  __break(1u);
  return result;
}

uint64_t sub_20D1226DC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;
  void *v6;
  void *v7;

  v5 = a5 + 16;
  swift_beginAccess();
  v6 = (void *)MEMORY[0x212B9D9D4](v5);
  if (v6)
  {
    v7 = v6;
    objc_msgSend(v6, sel_removeFromParentViewController);

  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_2549A5810);
  return sub_20D137B64();
}

uint64_t sub_20D122768(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, void *a5)
{
  void (*v8)(void *, uint64_t, uint64_t, void *);
  uint64_t v9;
  id v10;
  id v11;

  v8 = *(void (**)(void *, uint64_t, uint64_t, void *))(a1 + 32);
  if (a4)
    v9 = sub_20D137E10();
  else
    v9 = 0;
  swift_retain();
  v10 = a2;
  v11 = a5;
  v8(a2, a3, v9, a5);
  swift_release();

  return swift_bridgeObjectRelease();
}

uint64_t sub_20D12280C(uint64_t result, int a2, id a3)
{
  if ((result & 1) == 0)
  {
    objc_msgSend(a3, sel_removeFromParentViewController);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2549A5810);
    return sub_20D137B64();
  }
  return result;
}

void sub_20D122874(uint64_t a1, uint64_t a2, void *a3)
{
  void (*v5)(uint64_t, void *);
  id v6;

  v5 = *(void (**)(uint64_t, void *))(a1 + 32);
  swift_retain();
  v6 = a3;
  v5(a2, a3);
  swift_release();

}

uint64_t sub_20D1228DC()
{
  return sub_20D137900();
}

void sub_20D1228F4(uint64_t a1)
{
  const void *v1;
  _BYTE __dst[104];

  memcpy(__dst, v1, sizeof(__dst));
  sub_20D120E4C(a1);
}

uint64_t sub_20D122944()
{
  sub_20D1378D0();
  MEMORY[0x24BDAC7A8]();
  sub_20D1378C4();
  type metadata accessor for Movie(0);
  sub_20D124C24(&qword_2549A58F8, (void (*)(uint64_t))type metadata accessor for Movie);
  return sub_20D137864();
}

uint64_t sub_20D122A00(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  uint64_t v3;

  v2[2] = a1;
  v2[3] = a2;
  v3 = sub_20D137810();
  v2[4] = v3;
  v2[5] = *(_QWORD *)(v3 - 8);
  v2[6] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_20D122A60()
{
  _QWORD *v0;
  uint64_t (*v1)(void);

  (*(void (**)(_QWORD, _QWORD, _QWORD))(v0[5] + 16))(v0[6], v0[3], v0[4]);
  sub_20D137870();
  OUTLINED_FUNCTION_23();
  v1 = (uint64_t (*)(void))OUTLINED_FUNCTION_60();
  return OUTLINED_FUNCTION_4(v1);
}

uint64_t sub_20D122AB0(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v2[4] = a1;
  v2[5] = a2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2549A5A90);
  v2[6] = swift_task_alloc();
  v3 = sub_20D1378D0();
  v2[7] = v3;
  v2[8] = *(_QWORD *)(v3 - 8);
  v2[9] = swift_task_alloc();
  v2[10] = swift_task_alloc();
  v4 = sub_20D137840();
  v2[11] = v4;
  v2[12] = *(_QWORD *)(v4 - 8);
  v2[13] = swift_task_alloc();
  v5 = sub_20D137810();
  v2[14] = v5;
  v2[15] = *(_QWORD *)(v5 - 8);
  v2[16] = swift_task_alloc();
  v2[17] = swift_task_alloc();
  v2[18] = swift_task_alloc();
  return swift_task_switch();
}

void sub_20D122BDC()
{
  OUTLINED_FUNCTION_8();
  sub_20D137834();
  sub_20D137828();
  OUTLINED_FUNCTION_30();
  OUTLINED_FUNCTION_78();
}

#error "20D122C3C: call analysis failed (funcsize=84)"

uint64_t sub_20D122DFC()
{
  sub_20D1378D0();
  MEMORY[0x24BDAC7A8]();
  sub_20D1378B8();
  type metadata accessor for Photo(0);
  sub_20D124C24(&qword_2549A58B8, (void (*)(uint64_t))type metadata accessor for Photo);
  return sub_20D137864();
}

uint64_t sub_20D122EB8(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  uint64_t v3;

  v2[2] = a1;
  v2[3] = a2;
  v3 = sub_20D137810();
  v2[4] = v3;
  v2[5] = *(_QWORD *)(v3 - 8);
  v2[6] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_20D122F18(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v2[4] = a1;
  v2[5] = a2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2549A5A90);
  v2[6] = swift_task_alloc();
  v3 = sub_20D1378D0();
  v2[7] = v3;
  v2[8] = *(_QWORD *)(v3 - 8);
  v2[9] = swift_task_alloc();
  v2[10] = swift_task_alloc();
  v4 = sub_20D137840();
  v2[11] = v4;
  v2[12] = *(_QWORD *)(v4 - 8);
  v2[13] = swift_task_alloc();
  v5 = sub_20D137810();
  v2[14] = v5;
  v2[15] = *(_QWORD *)(v5 - 8);
  v2[16] = swift_task_alloc();
  v2[17] = swift_task_alloc();
  v2[18] = swift_task_alloc();
  return swift_task_switch();
}

void sub_20D123044()
{
  OUTLINED_FUNCTION_8();
  sub_20D137834();
  sub_20D137828();
  OUTLINED_FUNCTION_30();
  OUTLINED_FUNCTION_78();
}

#error "20D1230A4: call analysis failed (funcsize=84)"

id sub_20D123268()
{
  id v0;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  __swift_instantiateConcreteTypeFromMangledName(&qword_2549A5910);
  sub_20D137B70();
  v0 = objc_allocWithZone((Class)type metadata accessor for _PresentationViewController());
  return sub_20D123470(v2, v3, v4);
}

id sub_20D1232DC()
{
  return sub_20D123268();
}

uint64_t sub_20D1232E8(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;

  return nullsub_1(a1, a2, *v2, v2[1], v2[2]);
}

uint64_t sub_20D123300()
{
  return sub_20D1379D8();
}

uint64_t sub_20D123338()
{
  sub_20D125F78();
  return sub_20D137A14();
}

uint64_t sub_20D123388()
{
  sub_20D125F78();
  return sub_20D1379E4();
}

uint64_t sub_20D1233D8()
{
  return sub_20D137AC8();
}

void sub_20D1233F0()
{
  sub_20D125F78();
  sub_20D137A08();
  __break(1u);
}

uint64_t sub_20D123414()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_2549A5910);
  return sub_20D137B64();
}

id sub_20D123470(uint64_t a1, uint64_t a2, uint64_t a3)
{
  char *v3;
  char *v4;
  objc_super v6;

  v4 = &v3[OBJC_IVAR____TtC17_PhotosUI_SwiftUIP33_3BA943E6D7A29AC315168BE52F028B9927_PresentationViewController__presentationViewController];
  *(_QWORD *)v4 = a1;
  *((_QWORD *)v4 + 1) = a2;
  *((_QWORD *)v4 + 2) = a3;
  v6.receiver = v3;
  v6.super_class = (Class)type metadata accessor for _PresentationViewController();
  return objc_msgSendSuper2(&v6, sel_initWithNibName_bundle_, 0, 0);
}

void sub_20D1234C0()
{
  sub_20D137F84();
  __break(1u);
}

uint64_t sub_20D123534(uint64_t a1)
{
  void *v1;
  id v3;

  v3 = v1;
  return a1;
}

void sub_20D12354C()
{
  void *v0;
  id v1;
  void *v2;
  objc_super v3;

  v3.receiver = v0;
  v3.super_class = (Class)type metadata accessor for _PresentationViewController();
  objc_msgSendSuper2(&v3, sel_viewDidLoad);
  v1 = objc_msgSend(v0, sel_view);
  if (v1)
  {
    v2 = v1;
    objc_msgSend(v1, sel_setHidden_, 1);

  }
  else
  {
    __break(1u);
  }
}

uint64_t sub_20D1235F4(char a1)
{
  void *v1;
  id v3;
  objc_super v5;

  v5.receiver = v1;
  v5.super_class = (Class)type metadata accessor for _PresentationViewController();
  objc_msgSendSuper2(&v5, sel_viewDidAppear_, a1 & 1);
  v3 = v1;
  return sub_20D123414();
}

uint64_t sub_20D12368C(char a1)
{
  void *v1;
  objc_super v4;

  v4.receiver = v1;
  v4.super_class = (Class)type metadata accessor for _PresentationViewController();
  objc_msgSendSuper2(&v4, sel_viewDidDisappear_, a1 & 1);
  return sub_20D123414();
}

void sub_20D123718()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

id sub_20D1237A0()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for _PresentationViewController();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for _PresentationViewController()
{
  return objc_opt_self();
}

uint64_t sub_20D12383C(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  _QWORD v4[2];

  v1 = *(_QWORD *)(a1 + 8);
  v2 = sub_20D137930();
  v4[0] = v1;
  v4[1] = sub_20D123890();
  return MEMORY[0x212B9D8E4](MEMORY[0x24BDED308], v2, v4);
}

unint64_t sub_20D123890()
{
  unint64_t result;

  result = qword_2549A5798;
  if (!qword_2549A5798)
  {
    result = MEMORY[0x212B9D8E4](&unk_20D138968, &type metadata for _PostToSharedAlbumModifer);
    atomic_store(result, (unint64_t *)&qword_2549A5798);
  }
  return result;
}

void type metadata accessor for _PHPickerSourceType(uint64_t a1)
{
  sub_20D125930(a1, &qword_2549A57A0);
}

void type metadata accessor for _PHPickerPrivateCapabilities(uint64_t a1)
{
  sub_20D125930(a1, &qword_2549A57A8);
}

void type metadata accessor for PHPickerCapabilities(uint64_t a1)
{
  sub_20D125930(a1, &qword_2549A57B0);
}

uint64_t initializeBufferWithCopyOfBuffer for _PostToSharedAlbumModifer(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *a2;
  *a1 = *a2;
  v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t destroy for _PostToSharedAlbumModifer(uint64_t a1)
{
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();

  return swift_release();
}

uint64_t initializeWithCopy for _PostToSharedAlbumModifer(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;

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
  v7 = *(_QWORD *)(a2 + 72);
  *(_QWORD *)(a1 + 64) = *(_QWORD *)(a2 + 64);
  *(_QWORD *)(a1 + 72) = v7;
  *(_BYTE *)(a1 + 80) = *(_BYTE *)(a2 + 80);
  v9 = *(void **)(a2 + 88);
  v8 = *(_QWORD *)(a2 + 96);
  *(_QWORD *)(a1 + 88) = v9;
  *(_QWORD *)(a1 + 96) = v8;
  swift_bridgeObjectRetain();
  swift_retain();
  swift_retain();
  swift_bridgeObjectRetain();
  swift_retain();
  swift_retain();
  swift_bridgeObjectRetain();
  swift_retain();
  swift_retain();
  v10 = v9;
  swift_retain();
  return a1;
}

uint64_t assignWithCopy for _PostToSharedAlbumModifer(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  id v6;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  swift_retain();
  swift_release();
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  swift_retain();
  swift_release();
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  swift_retain();
  swift_release();
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  swift_retain();
  swift_release();
  *(_QWORD *)(a1 + 56) = *(_QWORD *)(a2 + 56);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 64) = *(_QWORD *)(a2 + 64);
  swift_retain();
  swift_release();
  *(_QWORD *)(a1 + 72) = *(_QWORD *)(a2 + 72);
  swift_retain();
  swift_release();
  *(_BYTE *)(a1 + 80) = *(_BYTE *)(a2 + 80);
  v4 = *(void **)(a1 + 88);
  v5 = *(void **)(a2 + 88);
  *(_QWORD *)(a1 + 88) = v5;
  v6 = v5;

  *(_QWORD *)(a1 + 96) = *(_QWORD *)(a2 + 96);
  swift_retain();
  swift_release();
  return a1;
}

void *__swift_memcpy104_8(void *a1, const void *a2)
{
  return memcpy(a1, a2, 0x68uLL);
}

uint64_t assignWithTake for _PostToSharedAlbumModifer(uint64_t a1, uint64_t a2)
{
  *(_QWORD *)a1 = *(_QWORD *)a2;
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  swift_release();
  swift_release();
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  swift_bridgeObjectRelease();
  swift_release();
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  swift_release();
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);
  swift_release();
  *(_QWORD *)(a1 + 72) = *(_QWORD *)(a2 + 72);
  swift_release();
  *(_BYTE *)(a1 + 80) = *(_BYTE *)(a2 + 80);

  *(_OWORD *)(a1 + 88) = *(_OWORD *)(a2 + 88);
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for _PostToSharedAlbumModifer(uint64_t a1, int a2)
{
  unint64_t v2;

  if (a2)
  {
    if (a2 < 0 && *(_BYTE *)(a1 + 104))
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

uint64_t storeEnumTagSinglePayload for _PostToSharedAlbumModifer(uint64_t result, int a2, int a3)
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
      *(_QWORD *)(result + 24) = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 104) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for _PostToSharedAlbumModifer()
{
  return &type metadata for _PostToSharedAlbumModifer;
}

id sub_20D123D28(uint64_t a1, uint64_t a2)
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
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  void *v18;
  uint64_t v19;
  id v20;
  void *v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  char *v29;
  char *v30;
  uint64_t v32;
  uint64_t v33;
  id v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  char *v40;
  uint64_t v41;
  uint64_t v42;
  char *v43;
  uint64_t v44;
  uint64_t v45;
  _QWORD aBlock[6];

  v3 = v2;
  v44 = a1;
  v45 = a2;
  v4 = sub_20D137BA0();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8]();
  v7 = (char *)&v36 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_20D137BB8();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8]();
  v11 = (char *)&v36 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = type metadata accessor for Photo(0);
  sub_20D124C24(&qword_2549A58B8, (void (*)(uint64_t))type metadata accessor for Photo);
  v38 = v13;
  v39 = v12;
  v14 = MEMORY[0x212B9CDA4](v12);
  v15 = *(_QWORD *)(v14 + 16);
  v42 = v8;
  v43 = v7;
  v40 = v11;
  v41 = v9;
  if (v15)
  {
    v36 = v5;
    v37 = v4;
    v16 = *(_QWORD *)(sub_20D1378D0() - 8);
    v17 = v14 + ((*(unsigned __int8 *)(v16 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v16 + 80));
    v18 = *(void **)(v3 + 32);
    v19 = *(_QWORD *)(v16 + 72);
    while (1)
    {
      v20 = v18;
      v21 = (void *)sub_20D1378A0();
      v22 = objc_msgSend(v20, sel_registeredContentTypesConformingToContentType_, v21);

      v23 = sub_20D137E10();
      v24 = *(_QWORD *)(v23 + 16);
      swift_bridgeObjectRelease();
      if (v24)
        break;
      v17 += v19;
      if (!--v15)
      {
        swift_bridgeObjectRelease();
        v5 = v36;
        v4 = v37;
        goto LABEL_7;
      }
    }
    swift_bridgeObjectRelease();
    v32 = swift_allocObject();
    v33 = v45;
    *(_QWORD *)(v32 + 16) = v44;
    *(_QWORD *)(v32 + 24) = v33;
    v34 = v20;
    swift_retain();
    v35 = sub_20D137EAC();

    swift_release();
    return (id)v35;
  }
  else
  {
    swift_bridgeObjectRelease();
LABEL_7:
    sub_20D1255F0(0, &qword_2549A58C0);
    v25 = (void *)sub_20D137EB8();
    v26 = swift_allocObject();
    v27 = v45;
    *(_QWORD *)(v26 + 16) = v44;
    *(_QWORD *)(v26 + 24) = v27;
    aBlock[4] = sub_20D125628;
    aBlock[5] = v26;
    aBlock[0] = MEMORY[0x24BDAC760];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_20D127958;
    aBlock[3] = &block_descriptor_38;
    v28 = _Block_copy(aBlock);
    swift_retain();
    swift_release();
    v29 = v40;
    sub_20D137BAC();
    aBlock[0] = MEMORY[0x24BEE4AF8];
    sub_20D124C24(&qword_2549A58C8, (void (*)(uint64_t))MEMORY[0x24BEE5458]);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2549A58D0);
    sub_20D12600C(&qword_2549A58D8, &qword_2549A58D0);
    v30 = v43;
    sub_20D137F30();
    MEMORY[0x212B9D41C](0, v29, v30, v28);
    _Block_release(v28);

    (*(void (**)(char *, uint64_t))(v5 + 8))(v30, v4);
    (*(void (**)(char *, uint64_t))(v41 + 8))(v29, v42);
    return objc_msgSend((id)objc_opt_self(), sel_discreteProgressWithTotalUnitCount_, 0);
  }
}

id sub_20D1240E0(uint64_t a1, uint64_t a2)
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
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  void *v18;
  uint64_t v19;
  id v20;
  void *v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  char *v29;
  char *v30;
  uint64_t v32;
  uint64_t v33;
  id v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  char *v40;
  uint64_t v41;
  uint64_t v42;
  char *v43;
  uint64_t v44;
  uint64_t v45;
  _QWORD aBlock[6];

  v3 = v2;
  v44 = a1;
  v45 = a2;
  v4 = sub_20D137BA0();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8]();
  v7 = (char *)&v36 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_20D137BB8();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8]();
  v11 = (char *)&v36 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = type metadata accessor for Movie(0);
  sub_20D124C24(&qword_2549A58F8, (void (*)(uint64_t))type metadata accessor for Movie);
  v38 = v13;
  v39 = v12;
  v14 = MEMORY[0x212B9CDA4](v12);
  v15 = *(_QWORD *)(v14 + 16);
  v42 = v8;
  v43 = v7;
  v40 = v11;
  v41 = v9;
  if (v15)
  {
    v36 = v5;
    v37 = v4;
    v16 = *(_QWORD *)(sub_20D1378D0() - 8);
    v17 = v14 + ((*(unsigned __int8 *)(v16 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v16 + 80));
    v18 = *(void **)(v3 + 32);
    v19 = *(_QWORD *)(v16 + 72);
    while (1)
    {
      v20 = v18;
      v21 = (void *)sub_20D1378A0();
      v22 = objc_msgSend(v20, sel_registeredContentTypesConformingToContentType_, v21);

      v23 = sub_20D137E10();
      v24 = *(_QWORD *)(v23 + 16);
      swift_bridgeObjectRelease();
      if (v24)
        break;
      v17 += v19;
      if (!--v15)
      {
        swift_bridgeObjectRelease();
        v5 = v36;
        v4 = v37;
        goto LABEL_7;
      }
    }
    swift_bridgeObjectRelease();
    v32 = swift_allocObject();
    v33 = v45;
    *(_QWORD *)(v32 + 16) = v44;
    *(_QWORD *)(v32 + 24) = v33;
    v34 = v20;
    swift_retain();
    v35 = sub_20D137EAC();

    swift_release();
    return (id)v35;
  }
  else
  {
    swift_bridgeObjectRelease();
LABEL_7:
    sub_20D1255F0(0, &qword_2549A58C0);
    v25 = (void *)sub_20D137EB8();
    v26 = swift_allocObject();
    v27 = v45;
    *(_QWORD *)(v26 + 16) = v44;
    *(_QWORD *)(v26 + 24) = v27;
    aBlock[4] = sub_20D125760;
    aBlock[5] = v26;
    aBlock[0] = MEMORY[0x24BDAC760];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_20D127958;
    aBlock[3] = &block_descriptor_50;
    v28 = _Block_copy(aBlock);
    swift_retain();
    swift_release();
    v29 = v40;
    sub_20D137BAC();
    aBlock[0] = MEMORY[0x24BEE4AF8];
    sub_20D124C24(&qword_2549A58C8, (void (*)(uint64_t))MEMORY[0x24BEE5458]);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2549A58D0);
    sub_20D12600C(&qword_2549A58D8, &qword_2549A58D0);
    v30 = v43;
    sub_20D137F30();
    MEMORY[0x212B9D41C](0, v29, v30, v28);
    _Block_release(v28);

    (*(void (**)(char *, uint64_t))(v5 + 8))(v30, v4);
    (*(void (**)(char *, uint64_t))(v41 + 8))(v29, v42);
    return objc_msgSend((id)objc_opt_self(), sel_discreteProgressWithTotalUnitCount_, 0);
  }
}

void sub_20D124498(uint64_t a1, void (*a2)(_QWORD *), uint64_t a3, uint64_t (*a4)(_QWORD), uint64_t *a5, uint64_t *a6)
{
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD *v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD *v18;
  uint64_t v19;
  void (*v20)(_QWORD *);

  v19 = a3;
  v20 = a2;
  v10 = a4(0);
  MEMORY[0x24BDAC7A8]();
  v12 = (char *)&v19 - v11;
  __swift_instantiateConcreteTypeFromMangledName(a5);
  OUTLINED_FUNCTION_14();
  MEMORY[0x24BDAC7A8]();
  OUTLINED_FUNCTION_13();
  v15 = (_QWORD *)(v14 - v13);
  OUTLINED_FUNCTION_63();
  OUTLINED_FUNCTION_14();
  MEMORY[0x24BDAC7A8]();
  OUTLINED_FUNCTION_13();
  v18 = (_QWORD *)(v17 - v16);
  sub_20D1257B4(a1, (uint64_t)v15, a5);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    *v18 = *v15;
  }
  else
  {
    sub_20D125544((uint64_t)v15, (uint64_t)v12, a4);
    sub_20D125788((uint64_t)v12, (uint64_t)v18, a4);
    __swift_storeEnumTagSinglePayload((uint64_t)v18, 0, 1, v10);
    sub_20D125570((uint64_t)v12, a4);
  }
  swift_storeEnumTagMultiPayload();
  v20(v18);
  sub_20D125F04((uint64_t)v18, a6);
  OUTLINED_FUNCTION_25();
}

void sub_20D1245F4(void (*a1)(uint64_t), uint64_t a2, uint64_t *a3, uint64_t (*a4)(_QWORD))
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  OUTLINED_FUNCTION_38((uint64_t)a1, a2, a3);
  OUTLINED_FUNCTION_14();
  MEMORY[0x24BDAC7A8]();
  OUTLINED_FUNCTION_13();
  v9 = v8 - v7;
  v10 = a4(0);
  OUTLINED_FUNCTION_39(v9, v11, v12, v10);
  swift_storeEnumTagMultiPayload();
  a1(v9);
  sub_20D125F04(v9, a3);
  OUTLINED_FUNCTION_53();
}

void sub_20D124680(uint64_t a1, uint64_t a2, uint64_t *a3, uint64_t a4, uint64_t a5, uint64_t (*a6)(uint64_t, uint64_t))
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;

  v9 = OUTLINED_FUNCTION_38(a1, a2, a3);
  v10 = *(_QWORD *)(v9 - 8);
  v11 = *(_QWORD *)(v10 + 64);
  MEMORY[0x24BDAC7A8]();
  (*(void (**)(char *, uint64_t, uint64_t))(v10 + 16))((char *)&v15 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v9);
  v12 = (*(unsigned __int8 *)(v10 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  v13 = swift_allocObject();
  (*(void (**)(unint64_t, char *, uint64_t))(v10 + 32))(v13 + v12, (char *)&v15 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0), v9);
  v14 = (void *)a6(a5, v13);
  swift_release();

  OUTLINED_FUNCTION_25();
}

uint64_t sub_20D124758(uint64_t a1, uint64_t a2, uint64_t *a3, uint64_t *a4)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  OUTLINED_FUNCTION_38(a1, a2, a3);
  OUTLINED_FUNCTION_14();
  MEMORY[0x24BDAC7A8]();
  OUTLINED_FUNCTION_13();
  v9 = v8 - v7;
  __swift_instantiateConcreteTypeFromMangledName(a4);
  OUTLINED_FUNCTION_14();
  MEMORY[0x24BDAC7A8]();
  OUTLINED_FUNCTION_13();
  v12 = v11 - v10;
  sub_20D1257B4(a1, v11 - v10, a4);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    OUTLINED_FUNCTION_63();
    return sub_20D137E4C();
  }
  else
  {
    sub_20D1257E8(v12, v9, a3);
    OUTLINED_FUNCTION_63();
    return sub_20D137E58();
  }
}

BOOL sub_20D12484C(uint64_t a1, uint64_t a2)
{
  return a1 == a2;
}

id sub_20D124858(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v3;
  void *v5;
  id v6;

  if (a3)
  {
    v5 = (void *)sub_20D137DBC();
    swift_bridgeObjectRelease();
  }
  else
  {
    v5 = 0;
  }
  v6 = objc_msgSend(v3, sel_initWithItem_typeIdentifier_, a1, v5);

  swift_unknownObjectRelease();
  return v6;
}

id sub_20D1248D0(uint64_t a1, uint64_t a2)
{
  void *v2;
  void *v4;
  void *v5;
  id v6;

  v4 = (void *)sub_20D137E04();
  swift_bridgeObjectRelease();
  if (a2)
  {
    sub_20D1255F0(0, &qword_2549A5880);
    v5 = (void *)sub_20D137E04();
    swift_bridgeObjectRelease();
  }
  else
  {
    v5 = 0;
  }
  v6 = objc_msgSend(v2, sel_initWithActivityItems_applicationActivities_, v4, v5);

  return v6;
}

uint64_t sub_20D124978@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  result = sub_20D12581C();
  *a1 = result;
  return result;
}

uint64_t sub_20D12499C@<X0>(uint64_t *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t *v2;
  uint64_t result;

  result = sub_20D1258C4(*a1, *v2);
  *a2 = result;
  return result;
}

uint64_t sub_20D1249C8@<X0>(uint64_t *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t *v2;
  uint64_t result;

  result = sub_20D125834(*a1, *v2);
  *a2 = result;
  return result;
}

uint64_t sub_20D1249F4@<X0>(uint64_t *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t *v2;
  uint64_t result;

  result = sub_20D125894(*a1, *v2);
  *a2 = result;
  return result;
}

BOOL sub_20D124A20(_QWORD *a1, uint64_t *a2)
{
  return sub_20D12584C(a1, *a2);
}

uint64_t sub_20D124A28@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t result;
  char v4;

  result = sub_20D1258CC(*a1);
  *(_QWORD *)a2 = result;
  *(_BYTE *)(a2 + 8) = v4 & 1;
  return result;
}

uint64_t sub_20D124A58@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t result;
  char v4;

  result = sub_20D1258F0(*a1);
  *(_QWORD *)a2 = result;
  *(_BYTE *)(a2 + 8) = v4 & 1;
  return result;
}

uint64_t sub_20D124A88(uint64_t *a1)
{
  return sub_20D12583C(*a1);
}

uint64_t sub_20D124A90(uint64_t *a1)
{
  return sub_20D125824(*a1);
}

uint64_t sub_20D124A98(uint64_t *a1)
{
  return sub_20D125884(*a1);
}

uint64_t sub_20D124AA0@<X0>(uint64_t *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t *v2;
  uint64_t result;

  result = sub_20D125908(*a1, *v2);
  *a2 = result;
  return result;
}

BOOL sub_20D124ACC(uint64_t *a1)
{
  uint64_t *v1;

  return sub_20D1258AC(*a1, *v1);
}

BOOL sub_20D124AD8(uint64_t *a1)
{
  uint64_t *v1;

  return sub_20D125910(*a1, *v1);
}

BOOL sub_20D124AE4(uint64_t *a1)
{
  uint64_t *v1;

  return sub_20D1258B8(*a1, *v1);
}

BOOL sub_20D124AF0()
{
  uint64_t *v0;

  return sub_20D125878(*v0);
}

uint64_t sub_20D124AF8()
{
  return sub_20D137F24();
}

uint64_t sub_20D124B10(uint64_t *a1)
{
  return sub_20D12589C(*a1);
}

BOOL sub_20D124B18(uint64_t *a1, uint64_t *a2)
{
  return sub_20D12484C(*a1, *a2);
}

void sub_20D124B24(uint64_t a1@<X8>)
{
  uint64_t v2;
  char v3;

  sub_20D124B54();
  *(_QWORD *)a1 = v2;
  *(_BYTE *)(a1 + 8) = v3 & 1;
}

void sub_20D124B5C(uint64_t a1@<X1>, uint64_t a2@<X2>, uint64_t a3@<X3>, uint64_t a4@<X4>, _QWORD *a5@<X8>)
{
  _QWORD *v5;

  *a5 = nullsub_1(*v5, a1, a2, a3, a4);
  OUTLINED_FUNCTION_3();
}

void sub_20D124B80(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v3;

  sub_20D125F2C(a1);
  *a2 = v3;
}

_QWORD *sub_20D124BA4@<X0>(_QWORD *result@<X0>, _QWORD *a2@<X8>)
{
  *a2 = *result;
  return result;
}

_QWORD *sub_20D124BB0@<X0>(_QWORD *result@<X0>, uint64_t a2@<X8>)
{
  *(_QWORD *)a2 = *result;
  *(_BYTE *)(a2 + 8) = 0;
  return result;
}

void sub_20D124BC0(_QWORD *a1@<X8>)
{
  _QWORD *v1;

  *a1 = *v1;
}

void sub_20D124BCC()
{
  sub_20D124C24(&qword_2549A57B8, type metadata accessor for PHPickerCapabilities);
}

void sub_20D124BF8()
{
  sub_20D124C24(&qword_2549A57C0, type metadata accessor for PHPickerCapabilities);
}

void sub_20D124C24(_QWORD *a1, void (*a2)(uint64_t))
{
  if (!*a1)
  {
    a2(255);
    OUTLINED_FUNCTION_87();
  }
  OUTLINED_FUNCTION_3();
}

void sub_20D124C58()
{
  sub_20D124C24(&qword_2549A57C8, type metadata accessor for PHPickerCapabilities);
}

void sub_20D124C84()
{
  sub_20D124C24(&qword_2549A57D0, type metadata accessor for PHPickerCapabilities);
}

void sub_20D124CB0()
{
  sub_20D124C24(&qword_2549A57D8, type metadata accessor for _PHPickerPrivateCapabilities);
}

void sub_20D124CDC()
{
  sub_20D124C24(&qword_2549A57E0, type metadata accessor for _PHPickerPrivateCapabilities);
}

void sub_20D124D08()
{
  sub_20D124C24(&qword_2549A57E8, type metadata accessor for _PHPickerPrivateCapabilities);
}

void sub_20D124D34()
{
  sub_20D124C24(&qword_2549A57F0, type metadata accessor for _PHPickerPrivateCapabilities);
}

uint64_t sub_20D124D60()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x212B9D8CC]((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t sub_20D124DB0()
{
  uint64_t v0;

  swift_bridgeObjectRelease();
  swift_release();
  OUTLINED_FUNCTION_77();
  swift_bridgeObjectRelease();
  swift_release();
  OUTLINED_FUNCTION_74();
  swift_bridgeObjectRelease();
  swift_release();
  OUTLINED_FUNCTION_68();

  swift_release();
  return swift_deallocObject();
}

uint64_t sub_20D124E18(uint64_t a1, _BYTE *a2)
{
  uint64_t v2;

  return sub_20D120FFC(a1, a2, (const void *)(v2 + 16));
}

uint64_t sub_20D124E20(uint64_t a1)
{
  id v2;
  void *v4;

  v4 = *(void **)(a1 + 88);
  swift_retain();
  swift_bridgeObjectRetain();
  swift_retain();
  swift_retain();
  swift_bridgeObjectRetain();
  swift_retain();
  swift_retain();
  swift_bridgeObjectRetain();
  swift_retain();
  swift_retain();
  v2 = v4;
  return a1;
}

unint64_t sub_20D124ED8()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD v5[2];

  result = qword_2549A5818;
  if (!qword_2549A5818)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2549A57F8);
    sub_20D12600C(&qword_2549A5820, &qword_2549A5808);
    v3 = v2;
    sub_20D12600C(&qword_2549A5828, &qword_2549A5830);
    v5[0] = v3;
    v5[1] = v4;
    result = MEMORY[0x212B9D8E4](MEMORY[0x24BDED308], v1, v5);
    atomic_store(result, (unint64_t *)&qword_2549A5818);
  }
  return result;
}

uint64_t __swift_instantiateConcreteTypeFromMangledNameAbstract(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x212B9D8D8](255, (char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t __swift_storeEnumTagSinglePayload(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a4 - 8) + 56))();
}

uint64_t sub_20D124FC4()
{
  uint64_t v0;

  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_75();
  swift_release();
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_73();
  swift_release();
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_69();
  swift_release();

  swift_release();
  return swift_deallocObject();
}

uint64_t sub_20D125034(uint64_t a1)
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
  v6[1] = sub_20D1250A0;
  return sub_20D1210F0(a1, v4, v5, v1 + 32);
}

uint64_t sub_20D1250A0()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v3;

  v3 = *v0;
  v1 = *v0;
  OUTLINED_FUNCTION_83(&v3);
  return OUTLINED_FUNCTION_27(*(uint64_t (**)(void))(v1 + 8));
}

uint64_t __swift_getEnumTagSinglePayload(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a3 - 8) + 48))();
}

uint64_t sub_20D1250E8(uint64_t a1)
{
  swift_retain();
  return a1;
}

uint64_t sub_20D125110(uint64_t a1)
{
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t sub_20D125138(uint64_t a1)
{
  swift_release();
  return a1;
}

uint64_t sub_20D125160(uint64_t a1)
{
  swift_bridgeObjectRelease();
  return a1;
}

void sub_20D125188(uint64_t *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t *v2;

  *a2 = sub_20D125834(*a1, *v2);
  OUTLINED_FUNCTION_3();
}

void sub_20D1251B0(uint64_t a1, void *a2)
{
  id v3;

  v3 = (id)sub_20D137D8C();
  swift_bridgeObjectRelease();
  objc_msgSend(a2, sel_setUserInfo_, v3);

}

void sub_20D12521C(uint64_t a1, void *a2)
{
  id v3;

  sub_20D1255F0(0, &qword_2549A5888);
  v3 = (id)sub_20D137E04();
  objc_msgSend(a2, sel_setAttachments_, v3);

}

uint64_t sub_20D125284()
{
  swift_unknownObjectWeakDestroy();
  return swift_deallocObject();
}

uint64_t sub_20D1252A8()
{
  uint64_t v0;

  swift_release();
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_77();
  OUTLINED_FUNCTION_75();
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_74();
  OUTLINED_FUNCTION_73();
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_68();
  OUTLINED_FUNCTION_69();

  swift_release();
  return swift_deallocObject();
}

uint64_t sub_20D12530C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;

  return sub_20D1226DC(a1, a2, a3, a4, *(_QWORD *)(v4 + 16));
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

uint64_t sub_20D125330()
{
  uint64_t v0;

  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_77();
  OUTLINED_FUNCTION_75();
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_74();
  OUTLINED_FUNCTION_73();
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_68();
  OUTLINED_FUNCTION_69();

  swift_release();
  return swift_deallocObject();
}

uint64_t sub_20D125394(uint64_t a1, int a2)
{
  uint64_t v2;

  return sub_20D12280C(a1, a2, *(id *)(v2 + 16));
}

uint64_t sub_20D1253A0()
{
  swift_release();
  return swift_deallocObject();
}

void sub_20D1253C4()
{
  uint64_t v0;

  (*(void (**)(void))(v0 + 16))();
  OUTLINED_FUNCTION_3();
}

_OWORD *sub_20D1253E0(_OWORD *a1, _OWORD *a2)
{
  __int128 v2;

  v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t sub_20D1253F0()
{
  return swift_release();
}

uint64_t type metadata accessor for Photo(uint64_t a1)
{
  return sub_20D125420(a1, qword_2549A5A20);
}

uint64_t type metadata accessor for Movie(uint64_t a1)
{
  return sub_20D125420(a1, qword_2549A5990);
}

uint64_t sub_20D125420(uint64_t a1, uint64_t *a2)
{
  uint64_t result;

  result = *a2;
  if (!*a2)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_20D125450(uint64_t a1)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v3 = v2;
  return a1;
}

void sub_20D125490(uint64_t a1)
{
  uint64_t v1;

  sub_20D124680(a1, *(_QWORD *)(v1 + 16), &qword_2549A58F0, (uint64_t)&unk_24C613500, (uint64_t)sub_20D1256B8, (uint64_t (*)(uint64_t, uint64_t))sub_20D1240E0);
}

void sub_20D1254C8(uint64_t a1)
{
  uint64_t v1;

  sub_20D124680(a1, *(_QWORD *)(v1 + 16), &qword_2549A58B0, (uint64_t)&unk_24C613460, (uint64_t)sub_20D1255A4, (uint64_t (*)(uint64_t, uint64_t))sub_20D123D28);
}

uint64_t sub_20D125500(uint64_t a1)
{

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return a1;
}

void sub_20D125544(uint64_t a1, uint64_t a2, uint64_t (*a3)(_QWORD))
{
  uint64_t v3;

  v3 = OUTLINED_FUNCTION_51(a1, a2, a3);
  OUTLINED_FUNCTION_16(*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 32));
  OUTLINED_FUNCTION_3();
}

void sub_20D125570(uint64_t a1, uint64_t (*a2)(_QWORD))
{
  uint64_t v2;

  v2 = a2(0);
  OUTLINED_FUNCTION_41(v2);
  OUTLINED_FUNCTION_3();
}

uint64_t sub_20D125598()
{
  return objectdestroy_28Tm(&qword_2549A58B0);
}

void sub_20D1255A4(uint64_t a1)
{
  sub_20D1256D4(a1, &qword_2549A58B0, &qword_2549A58A0, &qword_2549A58E0);
}

void sub_20D1255C0(uint64_t a1)
{
  uint64_t v1;

  sub_20D124498(a1, *(void (**)(_QWORD *))(v1 + 16), *(_QWORD *)(v1 + 24), type metadata accessor for Photo, &qword_2549A58E8, &qword_2549A58E0);
}

uint64_t sub_20D1255F0(uint64_t a1, unint64_t *a2)
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

void sub_20D125628()
{
  uint64_t v0;

  sub_20D1245F4(*(void (**)(uint64_t))(v0 + 16), *(_QWORD *)(v0 + 24), &qword_2549A58E0, type metadata accessor for Photo);
}

uint64_t sub_20D125650()
{
  return objectdestroy_28Tm(&qword_2549A58F0);
}

uint64_t objectdestroy_28Tm(uint64_t *a1)
{
  uint64_t v1;
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(a1);
  (*(void (**)(unint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1+ ((*(unsigned __int8 *)(*(_QWORD *)(v2 - 8) + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(v2 - 8) + 80)), v2);
  return swift_deallocObject();
}

void sub_20D1256B8(uint64_t a1)
{
  sub_20D1256D4(a1, &qword_2549A58F0, &qword_2549A58A8, &qword_2549A5900);
}

void sub_20D1256D4(uint64_t a1, uint64_t *a2, uint64_t *a3, uint64_t *a4)
{
  uint64_t v4;
  uint64_t v8;

  v8 = *(unsigned __int8 *)(*(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(a2) - 8) + 80);
  sub_20D124758(a1, v4 + ((v8 + 16) & ~v8), a3, a4);
  OUTLINED_FUNCTION_53();
}

void sub_20D125730(uint64_t a1)
{
  uint64_t v1;

  sub_20D124498(a1, *(void (**)(_QWORD *))(v1 + 16), *(_QWORD *)(v1 + 24), type metadata accessor for Movie, &qword_2549A5908, &qword_2549A5900);
}

void sub_20D125760()
{
  uint64_t v0;

  sub_20D1245F4(*(void (**)(uint64_t))(v0 + 16), *(_QWORD *)(v0 + 24), &qword_2549A5900, type metadata accessor for Movie);
}

void sub_20D125788(uint64_t a1, uint64_t a2, uint64_t (*a3)(_QWORD))
{
  uint64_t v3;

  v3 = OUTLINED_FUNCTION_51(a1, a2, a3);
  OUTLINED_FUNCTION_16(*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 16));
  OUTLINED_FUNCTION_3();
}

void sub_20D1257B4(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v3;

  v3 = OUTLINED_FUNCTION_38(a1, a2, a3);
  OUTLINED_FUNCTION_16(*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 16));
  OUTLINED_FUNCTION_3();
}

void sub_20D1257E8(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v3;

  v3 = OUTLINED_FUNCTION_38(a1, a2, a3);
  OUTLINED_FUNCTION_16(*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 32));
  OUTLINED_FUNCTION_3();
}

uint64_t sub_20D12581C()
{
  return 0;
}

uint64_t sub_20D125824(uint64_t result)
{
  _QWORD *v1;

  *v1 &= result;
  return result;
}

uint64_t sub_20D125834(uint64_t a1, uint64_t a2)
{
  return a2 & a1;
}

uint64_t sub_20D12583C(uint64_t result)
{
  _QWORD *v1;

  *v1 |= result;
  return result;
}

BOOL sub_20D12584C(_QWORD *a1, uint64_t a2)
{
  _QWORD *v2;
  uint64_t v3;

  v3 = *v2 & a2;
  if (v3 != a2)
    *v2 |= a2;
  *a1 = a2;
  return v3 != a2;
}

BOOL sub_20D125878(uint64_t a1)
{
  return a1 == 0;
}

uint64_t sub_20D125884(uint64_t result)
{
  _QWORD *v1;

  *v1 ^= result;
  return result;
}

uint64_t sub_20D125894(uint64_t a1, uint64_t a2)
{
  return a2 ^ a1;
}

uint64_t sub_20D12589C(uint64_t result)
{
  _QWORD *v1;

  *v1 &= ~result;
  return result;
}

BOOL sub_20D1258AC(uint64_t a1, uint64_t a2)
{
  return (a2 & ~a1) == 0;
}

BOOL sub_20D1258B8(uint64_t a1, uint64_t a2)
{
  return (a1 & ~a2) == 0;
}

uint64_t sub_20D1258C4(uint64_t a1, uint64_t a2)
{
  return a2 | a1;
}

uint64_t sub_20D1258CC(uint64_t a1)
{
  _QWORD *v1;
  uint64_t result;

  result = *v1 & a1;
  if (result)
    *v1 &= ~a1;
  return result;
}

uint64_t sub_20D1258F0(uint64_t a1)
{
  uint64_t *v1;
  uint64_t v2;

  v2 = *v1;
  *v1 |= a1;
  return v2 & a1;
}

uint64_t sub_20D125908(uint64_t a1, uint64_t a2)
{
  return a2 & ~a1;
}

BOOL sub_20D125910(uint64_t a1, uint64_t a2)
{
  return (a2 & a1) == 0;
}

void type metadata accessor for NSDirectionalRectEdge(uint64_t a1)
{
  sub_20D125930(a1, qword_2549A5930);
}

void sub_20D125930(uint64_t a1, unint64_t *a2)
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

uint64_t sub_20D12598C()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_20D125998(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v4;

  v4 = OUTLINED_FUNCTION_2();
  return __swift_getEnumTagSinglePayload(v2, a2, v4);
}

uint64_t sub_20D1259C4()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_20D1259D0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v4;

  v4 = OUTLINED_FUNCTION_2();
  return __swift_storeEnumTagSinglePayload(v2, a2, a2, v4);
}

uint64_t sub_20D125A04(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v4;

  v4 = OUTLINED_FUNCTION_2();
  return (**(uint64_t (***)(uint64_t, uint64_t, uint64_t))(v4 - 8))(v2, a2, v4);
}

uint64_t sub_20D125A38(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_20D137810();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
}

void sub_20D125A6C()
{
  uint64_t v0;

  v0 = OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_18(*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v0 - 8) + 16));
  OUTLINED_FUNCTION_3();
}

void sub_20D125A9C()
{
  uint64_t v0;

  v0 = OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_18(*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v0 - 8) + 24));
  OUTLINED_FUNCTION_3();
}

void sub_20D125ACC()
{
  uint64_t v0;

  v0 = OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_18(*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v0 - 8) + 32));
  OUTLINED_FUNCTION_3();
}

void sub_20D125AFC()
{
  uint64_t v0;

  v0 = OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_18(*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v0 - 8) + 40));
  OUTLINED_FUNCTION_3();
}

uint64_t sub_20D125B2C()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_20D125B38()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_20D125B44()
{
  uint64_t result;
  unint64_t v1;

  result = sub_20D137810();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

void destroy for _PresentationViewControllerRepresentable(uint64_t a1)
{
  swift_release();
  swift_release();

}

_QWORD *_s17_PhotosUI_SwiftUI40_PresentationViewControllerRepresentableVwCP_0(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;
  void *v4;
  id v5;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  v4 = (void *)a2[2];
  a1[2] = v4;
  swift_retain();
  swift_retain();
  v5 = v4;
  return a1;
}

_QWORD *assignWithCopy for _PresentationViewControllerRepresentable(_QWORD *a1, _QWORD *a2)
{
  void *v4;
  void *v5;
  id v6;

  *a1 = *a2;
  swift_retain();
  swift_release();
  a1[1] = a2[1];
  swift_retain();
  swift_release();
  v4 = (void *)a1[2];
  v5 = (void *)a2[2];
  a1[2] = v5;
  v6 = v5;

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

uint64_t assignWithTake for _PresentationViewControllerRepresentable(uint64_t a1, uint64_t a2)
{
  void *v4;

  swift_release();
  *(_OWORD *)a1 = *(_OWORD *)a2;
  swift_release();
  v4 = *(void **)(a1 + 16);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);

  return a1;
}

uint64_t getEnumTagSinglePayload for _PresentationViewControllerRepresentable(uint64_t a1, int a2)
{
  unint64_t v2;

  if (a2)
  {
    if (a2 < 0 && *(_BYTE *)(a1 + 24))
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

uint64_t storeEnumTagSinglePayload for _PresentationViewControllerRepresentable(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_QWORD *)(result + 8) = 0;
    *(_QWORD *)(result + 16) = 0;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 24) = 1;
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
    *(_BYTE *)(result + 24) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for _PresentationViewControllerRepresentable()
{
  return &type metadata for _PresentationViewControllerRepresentable;
}

uint64_t sub_20D125D88()
{
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2549A57F8);
  sub_20D124ED8();
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_20D125DE8()
{
  return MEMORY[0x24BDF5560];
}

unint64_t sub_20D125DF8()
{
  unint64_t result;

  result = qword_2549A5A58;
  if (!qword_2549A5A58)
  {
    result = MEMORY[0x212B9D8E4](&unk_20D138A1C, &type metadata for _PresentationViewControllerRepresentable);
    atomic_store(result, (unint64_t *)&qword_2549A5A58);
  }
  return result;
}

void sub_20D125E34()
{
  sub_20D124C24(&qword_2549A5A60, type metadata accessor for NSDirectionalRectEdge);
}

void sub_20D125E60()
{
  sub_20D124C24(&qword_2549A5A68, type metadata accessor for NSDirectionalRectEdge);
}

void sub_20D125E8C()
{
  sub_20D124C24(&qword_2549A5A70, type metadata accessor for NSDirectionalRectEdge);
}

void sub_20D125EB8()
{
  sub_20D124C24(&qword_2549A5A78, type metadata accessor for NSDirectionalRectEdge);
}

uint64_t sub_20D125EE4()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_20D125EF4()
{
  return swift_getOpaqueTypeConformance2();
}

void sub_20D125F04(uint64_t a1, uint64_t *a2)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(a2);
  OUTLINED_FUNCTION_41(v2);
  OUTLINED_FUNCTION_3();
}

void sub_20D125F2C(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t *v3;
  uint64_t v4;
  uint64_t v5;

  v1 = *(_QWORD *)(a1 + 16);
  if (v1)
  {
    v2 = 0;
    v3 = (uint64_t *)(a1 + 32);
    do
    {
      v5 = *v3++;
      v4 = v5;
      if ((v5 & ~v2) == 0)
        v4 = 0;
      v2 |= v4;
      --v1;
    }
    while (v1);
  }
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_3();
}

unint64_t sub_20D125F78()
{
  unint64_t result;

  result = qword_2549A5AA8;
  if (!qword_2549A5AA8)
  {
    result = MEMORY[0x212B9D8E4](&unk_20D138A6C, &type metadata for _PresentationViewControllerRepresentable);
    atomic_store(result, (unint64_t *)&qword_2549A5AA8);
  }
  return result;
}

void sub_20D125FB4()
{
  sub_20D12600C(&qword_2549A5AB0, &qword_2549A5AB8);
}

void sub_20D125FE0()
{
  sub_20D12600C(&qword_2549A5AC0, &qword_2549A5AC8);
}

void sub_20D12600C(_QWORD *a1, uint64_t *a2)
{
  if (!*a1)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    OUTLINED_FUNCTION_87();
  }
  OUTLINED_FUNCTION_3();
}

uint64_t OUTLINED_FUNCTION_0()
{
  return swift_task_switch();
}

uint64_t OUTLINED_FUNCTION_1(uint64_t a1)
{
  return sub_20D121D24(a1);
}

uint64_t OUTLINED_FUNCTION_2()
{
  return sub_20D137810();
}

uint64_t OUTLINED_FUNCTION_4(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t OUTLINED_FUNCTION_5()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v1 = v0[37];
  v3 = v0[35];
  v2 = v0[36];
  v0[23] = v3;
  v0[28] = v1;
  v0[17] = v3;
  v0[18] = v2;
  v0[19] = v1;
  return sub_20D1250E8((uint64_t)(v0 + 23));
}

uint64_t OUTLINED_FUNCTION_6()
{
  return swift_task_switch();
}

uint64_t OUTLINED_FUNCTION_7@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  __int128 v5;

  *(_QWORD *)(v2 + 200) = a1;
  v3 = *(_QWORD *)(v2 + 64) + 40 * a1;
  v4 = *(_QWORD *)(v3 + 64);
  v5 = *(_OWORD *)(v3 + 48);
  *(_OWORD *)v1 = *(_OWORD *)(v3 + 32);
  *(_OWORD *)(v1 + 16) = v5;
  *(_QWORD *)(v1 + 32) = v4;
  return sub_20D125450(v1);
}

uint64_t OUTLINED_FUNCTION_8()
{
  return sub_20D1377E0();
}

uint64_t OUTLINED_FUNCTION_9(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t OUTLINED_FUNCTION_10@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v3;

  *a1 = v3;
  a1[1] = a2;
  return v2;
}

uint64_t OUTLINED_FUNCTION_11()
{
  _QWORD *v0;

  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(v0[15] + 32))(v0[4], v0[18], v0[14]);
}

uint64_t OUTLINED_FUNCTION_12()
{
  return sub_20D1377F8();
}

id OUTLINED_FUNCTION_15()
{
  void *v0;
  uint64_t v1;

  return objc_msgSend(v0, (SEL)(v1 + 695));
}

uint64_t OUTLINED_FUNCTION_16@<X0>(uint64_t (*a1)(uint64_t, uint64_t)@<X8>)
{
  uint64_t v1;
  uint64_t v2;

  return a1(v1, v2);
}

id OUTLINED_FUNCTION_17()
{
  void *v0;
  uint64_t v1;

  return objc_msgSend(v0, (SEL)(v1 + 695));
}

uint64_t OUTLINED_FUNCTION_18@<X0>(uint64_t (*a1)(uint64_t, uint64_t)@<X8>)
{
  uint64_t v1;
  uint64_t v2;

  return a1(v2, v1);
}

uint64_t OUTLINED_FUNCTION_19()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_20()
{
  uint64_t v0;
  uint64_t (*v1)(_QWORD, _QWORD);

  return v1(*(_QWORD *)(v0 + 144), *(_QWORD *)(v0 + 112));
}

uint64_t OUTLINED_FUNCTION_21()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 8))(v0, v1);
}

uint64_t OUTLINED_FUNCTION_23()
{
  return swift_task_dealloc();
}

uint64_t OUTLINED_FUNCTION_24()
{
  return sub_20D137FC0();
}

void OUTLINED_FUNCTION_26()
{
  _QWORD *v0;
  uint64_t v1;

  *(_QWORD *)(v1 - 8) = *v0;
}

uint64_t OUTLINED_FUNCTION_27(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t OUTLINED_FUNCTION_28()
{
  return sub_20D137E28();
}

uint64_t OUTLINED_FUNCTION_30()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(v0 + 8))(v1, v2);
}

id OUTLINED_FUNCTION_31(uint64_t a1, const char *a2)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  return objc_msgSend(v2, a2, v5, v3, v4);
}

uint64_t OUTLINED_FUNCTION_32()
{
  return swift_task_dealloc();
}

uint64_t OUTLINED_FUNCTION_33()
{
  return swift_task_dealloc();
}

uint64_t OUTLINED_FUNCTION_34@<X0>(uint64_t (*a1)(uint64_t, uint64_t)@<X8>)
{
  uint64_t v1;
  uint64_t v2;

  return a1(v1, v2);
}

uint64_t OUTLINED_FUNCTION_35()
{
  return swift_task_dealloc();
}

uint64_t OUTLINED_FUNCTION_36()
{
  return swift_task_dealloc();
}

uint64_t OUTLINED_FUNCTION_37()
{
  return swift_allocObject();
}

uint64_t OUTLINED_FUNCTION_38(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  return __swift_instantiateConcreteTypeFromMangledName(a3);
}

uint64_t OUTLINED_FUNCTION_39(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_storeEnumTagSinglePayload(a1, 1, 1, a4);
}

uint64_t OUTLINED_FUNCTION_40()
{
  return sub_20D137894();
}

uint64_t OUTLINED_FUNCTION_41(uint64_t a1)
{
  uint64_t v1;

  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(a1 - 8) + 8))(v1, a1);
}

uint64_t OUTLINED_FUNCTION_42@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  *(_QWORD *)(v1 + 208) = a1;
  return sub_20D137B64();
}

void OUTLINED_FUNCTION_43()
{
  JUMPOUT(0x212B9D0B0);
}

id OUTLINED_FUNCTION_44(uint64_t a1, const char *a2)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  return objc_msgSend(v4, a2, v2, v3);
}

uint64_t OUTLINED_FUNCTION_45()
{
  return sub_20D137E34();
}

uint64_t OUTLINED_FUNCTION_47()
{
  return swift_task_dealloc();
}

uint64_t OUTLINED_FUNCTION_48()
{
  return swift_task_dealloc();
}

uint64_t OUTLINED_FUNCTION_49()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t (*v2)(uint64_t, uint64_t);

  return v2(v0, v1);
}

id OUTLINED_FUNCTION_50(void *a1)
{
  return objc_msgSend(a1, sel_defaultManager);
}

uint64_t OUTLINED_FUNCTION_51(uint64_t a1, uint64_t a2, uint64_t (*a3)(_QWORD))
{
  return a3(0);
}

id OUTLINED_FUNCTION_52(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  return sub_20D124858(a1, v1, v2);
}

uint64_t OUTLINED_FUNCTION_54()
{
  return sub_20D137804();
}

void OUTLINED_FUNCTION_55(uint64_t a1, uint64_t *a2)
{
  uint64_t v2;

  sub_20D125F04(v2, a2);
}

uint64_t OUTLINED_FUNCTION_57(uint64_t a1)
{
  _QWORD *v1;

  return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(v1[8] + 32))(a1, v1[6], v1[7]);
}

uint64_t OUTLINED_FUNCTION_58(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t v9;
  uint64_t v10;

  __swift_getEnumTagSinglePayload(v10, 1, a9);
  return *(_QWORD *)(v9 + 80);
}

uint64_t OUTLINED_FUNCTION_59()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + 8);
}

uint64_t OUTLINED_FUNCTION_60()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + 8);
}

uint64_t OUTLINED_FUNCTION_61@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v3;

  *a1 = v3;
  a1[1] = a2;
  return v2;
}

uint64_t OUTLINED_FUNCTION_62()
{
  uint64_t v0;

  return sub_20D125500(v0);
}

uint64_t OUTLINED_FUNCTION_63()
{
  uint64_t *v0;

  return __swift_instantiateConcreteTypeFromMangledName(v0);
}

id OUTLINED_FUNCTION_64(uint64_t a1, const char *a2)
{
  uint64_t v2;
  void *v3;

  return objc_msgSend(v3, a2, v2);
}

void *OUTLINED_FUNCTION_65@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  const void *v2;
  uint64_t v3;

  *(_QWORD *)(v3 + 32) = a1;
  *(_QWORD *)(v3 + 40) = v1;
  return _Block_copy(v2);
}

uint64_t OUTLINED_FUNCTION_66()
{
  return swift_retain();
}

uint64_t OUTLINED_FUNCTION_67()
{
  return swift_task_alloc();
}

uint64_t OUTLINED_FUNCTION_68()
{
  return swift_release();
}

uint64_t OUTLINED_FUNCTION_69()
{
  return swift_release();
}

void OUTLINED_FUNCTION_70()
{
  JUMPOUT(0x212B9CDD4);
}

uint64_t OUTLINED_FUNCTION_72()
{
  return swift_release();
}

uint64_t OUTLINED_FUNCTION_73()
{
  return swift_release();
}

uint64_t OUTLINED_FUNCTION_74()
{
  return swift_release();
}

uint64_t OUTLINED_FUNCTION_75()
{
  return swift_release();
}

uint64_t OUTLINED_FUNCTION_76()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_77()
{
  return swift_release();
}

void OUTLINED_FUNCTION_78()
{
  JUMPOUT(0x212B9CDD4);
}

void OUTLINED_FUNCTION_79()
{
  JUMPOUT(0x212B9D350);
}

uint64_t OUTLINED_FUNCTION_80()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t (*v2)(uint64_t, uint64_t);

  return v2(v0, v1);
}

uint64_t OUTLINED_FUNCTION_82()
{
  return sub_20D1377EC();
}

uint64_t OUTLINED_FUNCTION_83@<X0>(_QWORD *a1@<X8>)
{
  uint64_t v1;

  *a1 = v1;
  return swift_task_dealloc();
}

uint64_t OUTLINED_FUNCTION_84(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8;
  uint64_t v9;
  void (*v10)(_QWORD *__return_ptr, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t);

  return sub_20D120C78(a1, a2, a3, a4, a5, a6, a7, a8, v8, v9, v10);
}

uint64_t OUTLINED_FUNCTION_85()
{
  return sub_20D1377C8();
}

void *OUTLINED_FUNCTION_86(void *a1, const void *a2)
{
  return memcpy(a1, a2, 0x68uLL);
}

void OUTLINED_FUNCTION_87()
{
  JUMPOUT(0x212B9D8E4);
}

uint64_t PhotosPickerItem.loadTransferable<A>(type:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  __int128 v6;

  *(_QWORD *)(v5 + 72) = a3;
  *(_QWORD *)(v5 + 80) = a4;
  *(_QWORD *)(v5 + 56) = a1;
  *(_QWORD *)(v5 + 64) = a2;
  v6 = *(_OWORD *)(v4 + 16);
  *(_OWORD *)(v5 + 16) = *(_OWORD *)v4;
  *(_OWORD *)(v5 + 32) = v6;
  *(_QWORD *)(v5 + 48) = *(_QWORD *)(v4 + 32);
  return swift_task_switch();
}

uint64_t sub_20D126624()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;

  v1 = *(_QWORD *)(v0 + 64);
  v2 = swift_task_alloc();
  *(_QWORD *)(v0 + 88) = v2;
  *(_OWORD *)(v2 + 16) = *(_OWORD *)(v0 + 72);
  *(_QWORD *)(v2 + 32) = v0 + 16;
  *(_QWORD *)(v2 + 40) = v1;
  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 96) = v3;
  sub_20D137F18();
  *v3 = v0;
  v3[1] = sub_20D1266E4;
  return sub_20D137FC0();
}

uint64_t sub_20D1266E4()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;

  v2 = *v1;
  *(_QWORD *)(v2 + 104) = v0;
  swift_task_dealloc();
  if (v0)
    return swift_task_switch();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_20D126758()
{
  uint64_t v0;

  swift_task_dealloc();
  return OUTLINED_FUNCTION_27(*(uint64_t (**)(void))(v0 + 8));
}

void static PHLivePhoto.transferRepresentation.getter(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20)
{
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
  id v33;
  void *v34;
  void (*v35)(uint64_t);
  uint64_t v36;
  unint64_t v37;
  uint64_t v38;
  uint64_t v39;

  OUTLINED_FUNCTION_3_0();
  a19 = v20;
  a20 = v21;
  v22 = OUTLINED_FUNCTION_103();
  v23 = *(_QWORD *)(v22 - 8);
  v24 = *(_QWORD *)(v23 + 64);
  v25 = MEMORY[0x24BDAC7A8](v22);
  v26 = (char *)&a9 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  v27 = MEMORY[0x24BDAC7A8](v25);
  v29 = (char *)&a9 - v28;
  v30 = MEMORY[0x24BDAC7A8](v27);
  MEMORY[0x24BDAC7A8](v30);
  v32 = (char *)&a9 - v31;
  v33 = (id)PFCurrentPlatformLivePhotoBundleType();
  if (v33)
  {
    v34 = v33;
    sub_20D1378AC();

    v35 = *(void (**)(uint64_t))(v23 + 32);
    v36 = OUTLINED_FUNCTION_118();
    v35(v36);
    OUTLINED_FUNCTION_111((uint64_t)v29);
    OUTLINED_FUNCTION_111((uint64_t)v26);
    v37 = (*(unsigned __int8 *)(v23 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v23 + 80);
    v38 = swift_allocObject();
    v39 = ((uint64_t (*)(unint64_t, char *, uint64_t))v35)(v38 + v37, v26, v22);
    OUTLINED_FUNCTION_144(v39, &qword_2549A5C40);
    sub_20D127BD4();
    sub_20D137858();
    OUTLINED_FUNCTION_22_0((uint64_t)v32, *(uint64_t (**)(uint64_t, uint64_t))(v23 + 8));
    OUTLINED_FUNCTION_25();
  }
  else
  {
    __break(1u);
  }
}

uint64_t sub_20D1268F4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v4;

  v4[5] = a3;
  v4[6] = a4;
  v4[3] = a1;
  v4[4] = a2;
  return swift_task_switch();
}

uint64_t sub_20D12695C()
{
  uint64_t v0;
  void *v1;
  void *v2;
  void *v3;
  id v4;
  void *v5;
  id v6;
  uint64_t (*v7)(void);
  id v8;
  uint64_t (*v10)(void);

  v1 = (void *)objc_opt_self();
  v2 = (void *)sub_20D13781C();
  sub_20D137888();
  v3 = (void *)sub_20D137DBC();
  OUTLINED_FUNCTION_19();
  *(_QWORD *)(v0 + 16) = 0;
  v4 = objc_msgSend(v1, sel_objectWithItemProviderData_typeIdentifier_error_, v2, v3, v0 + 16);

  v5 = *(void **)(v0 + 16);
  if (v4)
  {
    **(_QWORD **)(v0 + 24) = v4;
    v10 = *(uint64_t (**)(void))(v0 + 8);
    v6 = v5;
    v7 = v10;
  }
  else
  {
    v8 = v5;
    sub_20D1377C8();

    swift_willThrow();
    v7 = *(uint64_t (**)(void))(v0 + 8);
  }
  return v7();
}

#error "20D126A9C: call analysis failed (funcsize=5)"

uint64_t sub_20D126AA8(uint64_t a1)
{
  return sub_20D126B14(a1, type metadata accessor for PhotosPickerSelectionBehavior, qword_2549A5AD0, MEMORY[0x24BDE3AB8]);
}

void static PhotosPickerSelectionBehavior.default.getter(uint64_t a1@<X8>)
{
  sub_20D127098(&qword_2549A56F0, type metadata accessor for PhotosPickerSelectionBehavior, (uint64_t)qword_2549A5AD0, a1);
}

uint64_t sub_20D126AF0(uint64_t a1)
{
  return sub_20D126B14(a1, type metadata accessor for PhotosPickerSelectionBehavior, qword_2549A5AE8, MEMORY[0x24BDE3AC0]);
}

uint64_t sub_20D126B14(uint64_t a1, uint64_t (*a2)(_QWORD), uint64_t *a3, unsigned int *a4)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v6 = OUTLINED_FUNCTION_145(a1, a2);
  __swift_allocate_value_buffer(v6, a3);
  v7 = __swift_project_value_buffer(v6, (uint64_t)a3);
  v8 = *a4;
  OUTLINED_FUNCTION_143();
  OUTLINED_FUNCTION_127();
  return (*(uint64_t (**)(uint64_t, uint64_t))(v9 + 104))(v7, v8);
}

void static PhotosPickerSelectionBehavior.ordered.getter(uint64_t a1@<X8>)
{
  sub_20D127098(&qword_2549A56F8, type metadata accessor for PhotosPickerSelectionBehavior, (uint64_t)qword_2549A5AE8, a1);
}

uint64_t sub_20D126B9C(uint64_t a1)
{
  return sub_20D126B14(a1, type metadata accessor for PhotosPickerSelectionBehavior, qword_2549A5B00, MEMORY[0x24BDE3AA0]);
}

void static PhotosPickerSelectionBehavior.continuous.getter(uint64_t a1@<X8>)
{
  sub_20D127098(&qword_2549A5700, type metadata accessor for PhotosPickerSelectionBehavior, (uint64_t)qword_2549A5B00, a1);
}

uint64_t sub_20D126BE4(uint64_t a1)
{
  return sub_20D126B14(a1, type metadata accessor for PhotosPickerSelectionBehavior, qword_2549A5B18, MEMORY[0x24BDE3AA8]);
}

void static PhotosPickerSelectionBehavior.continuousAndOrdered.getter(uint64_t a1@<X8>)
{
  sub_20D127098(&qword_2549A5708, type metadata accessor for PhotosPickerSelectionBehavior, (uint64_t)qword_2549A5B18, a1);
}

uint64_t PhotosPickerSelectionBehavior.hash(into:)()
{
  return sub_20D12710C();
}

void PhotosPickerSelectionBehavior.hashValue.getter()
{
  sub_20D12716C();
}

void sub_20D126C74()
{
  sub_20D1271D8();
}

uint64_t sub_20D126C90(uint64_t a1)
{
  return sub_20D126CE4(a1, qword_2549A5B30, (void (*)(void))MEMORY[0x24BDE3908], 0);
}

void static PhotosPickerStyle.presentation.getter(uint64_t a1@<X8>)
{
  sub_20D127098(&qword_2549A5710, type metadata accessor for PhotosPickerStyle, (uint64_t)qword_2549A5B30, a1);
}

uint64_t sub_20D126CCC(uint64_t a1)
{
  return sub_20D126CE4(a1, qword_2549A5B48, (void (*)(void))MEMORY[0x24BDE3908], 1);
}

uint64_t sub_20D126CE4(uint64_t a1, uint64_t *a2, void (*a3)(void), char a4)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t);
  uint64_t result;

  v7 = OUTLINED_FUNCTION_72_0();
  MEMORY[0x24BDAC7A8](v7);
  v8 = type metadata accessor for PhotosPickerStyle(0);
  __swift_allocate_value_buffer(v8, a2);
  v9 = __swift_project_value_buffer(v8, (uint64_t)a2);
  a3();
  v10 = OUTLINED_FUNCTION_114();
  result = v11(v10);
  *(_BYTE *)(v9 + *(int *)(v8 + 20)) = a4;
  return result;
}

void static PhotosPickerStyle.inline.getter(uint64_t a1@<X8>)
{
  sub_20D127098(&qword_2549A5718, type metadata accessor for PhotosPickerStyle, (uint64_t)qword_2549A5B48, a1);
}

uint64_t sub_20D126DC0(uint64_t a1)
{
  return sub_20D126CE4(a1, qword_2549A5B60, MEMORY[0x24BDE3900], 1);
}

void static PhotosPickerStyle.compact.getter(uint64_t a1@<X8>)
{
  sub_20D127098(&qword_2549A5720, type metadata accessor for PhotosPickerStyle, (uint64_t)qword_2549A5B60, a1);
}

uint64_t static PhotosPickerStyle.== infix(_:_:)(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  char v5;

  if ((sub_20D137BC4() & 1) != 0)
  {
    v4 = type metadata accessor for PhotosPickerStyle(0);
    v5 = *(_BYTE *)(a1 + *(int *)(v4 + 20)) ^ *(_BYTE *)(a2 + *(int *)(v4 + 20)) ^ 1;
  }
  else
  {
    v5 = 0;
  }
  return v5 & 1;
}

void PhotosPickerStyle.hash(into:)()
{
  OUTLINED_FUNCTION_72_0();
  sub_20D124C24(&qword_2549A5C58, (void (*)(uint64_t))MEMORY[0x24BDE3910]);
  sub_20D137DA4();
  type metadata accessor for PhotosPickerStyle(0);
  sub_20D137FF0();
  OUTLINED_FUNCTION_19_0();
}

uint64_t PhotosPickerStyle.hashValue.getter()
{
  OUTLINED_FUNCTION_71_0();
  OUTLINED_FUNCTION_72_0();
  sub_20D124C24(&qword_2549A5C58, (void (*)(uint64_t))MEMORY[0x24BDE3910]);
  sub_20D137DA4();
  type metadata accessor for PhotosPickerStyle(0);
  sub_20D137FF0();
  return OUTLINED_FUNCTION_102();
}

uint64_t sub_20D126F3C()
{
  sub_20D137FD8();
  sub_20D137BDC();
  sub_20D124C24(&qword_2549A5C58, (void (*)(uint64_t))MEMORY[0x24BDE3910]);
  sub_20D137DA4();
  sub_20D137FF0();
  return sub_20D137FFC();
}

uint64_t sub_20D126FC0(uint64_t a1)
{
  return sub_20D126B14(a1, type metadata accessor for PhotosPickerItem.EncodingDisambiguationPolicy, qword_2549A5B78, MEMORY[0x24BDE3A18]);
}

void static PhotosPickerItem.EncodingDisambiguationPolicy.automatic.getter(uint64_t a1@<X8>)
{
  sub_20D127098(&qword_2549A5728, type metadata accessor for PhotosPickerItem.EncodingDisambiguationPolicy, (uint64_t)qword_2549A5B78, a1);
}

uint64_t sub_20D127008(uint64_t a1)
{
  return sub_20D126B14(a1, type metadata accessor for PhotosPickerItem.EncodingDisambiguationPolicy, qword_2549A5B90, MEMORY[0x24BDE3A10]);
}

void static PhotosPickerItem.EncodingDisambiguationPolicy.current.getter(uint64_t a1@<X8>)
{
  sub_20D127098(&qword_2549A5730, type metadata accessor for PhotosPickerItem.EncodingDisambiguationPolicy, (uint64_t)qword_2549A5B90, a1);
}

uint64_t sub_20D127050(uint64_t a1)
{
  return sub_20D126B14(a1, type metadata accessor for PhotosPickerItem.EncodingDisambiguationPolicy, qword_2549A5BA8, MEMORY[0x24BDE3A00]);
}

void static PhotosPickerItem.EncodingDisambiguationPolicy.compatible.getter(uint64_t a1@<X8>)
{
  sub_20D127098(&qword_2549A5738, type metadata accessor for PhotosPickerItem.EncodingDisambiguationPolicy, (uint64_t)qword_2549A5BA8, a1);
}

void sub_20D127098(_QWORD *a1@<X0>, uint64_t (*a2)(_QWORD)@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v7;
  uint64_t v8;

  if (*a1 != -1)
    swift_once();
  v7 = OUTLINED_FUNCTION_143();
  v8 = __swift_project_value_buffer(v7, a3);
  sub_20D127C64(v8, a4, a2);
  OUTLINED_FUNCTION_19_0();
}

uint64_t PhotosPickerItem.EncodingDisambiguationPolicy.hash(into:)()
{
  return sub_20D12710C();
}

uint64_t sub_20D12710C()
{
  uint64_t v0;
  uint64_t (*v1)(_QWORD);

  OUTLINED_FUNCTION_55_0();
  OUTLINED_FUNCTION_145(v0, v1);
  OUTLINED_FUNCTION_35_0();
  return sub_20D137DA4();
}

void PhotosPickerItem.EncodingDisambiguationPolicy.hashValue.getter()
{
  sub_20D12716C();
}

void sub_20D12716C()
{
  OUTLINED_FUNCTION_71_0();
  OUTLINED_FUNCTION_139();
  OUTLINED_FUNCTION_35_0();
  OUTLINED_FUNCTION_94();
  OUTLINED_FUNCTION_102();
  OUTLINED_FUNCTION_28_0();
}

void sub_20D1271BC()
{
  sub_20D1271D8();
}

void sub_20D1271D8()
{
  sub_20D137FD8();
  OUTLINED_FUNCTION_139();
  OUTLINED_FUNCTION_35_0();
  OUTLINED_FUNCTION_94();
  OUTLINED_FUNCTION_102();
  OUTLINED_FUNCTION_28_0();
}

void PhotosPickerItem.itemIdentifier.getter()
{
  uint64_t v0;

  if (*(_BYTE *)(v0 + 16) == 1)
    OUTLINED_FUNCTION_73_0();
  OUTLINED_FUNCTION_3();
}

uint64_t PhotosPickerItem.supportedContentTypes.getter()
{
  return swift_bridgeObjectRetain();
}

void PhotosPickerItem.loadTransferable<A>(type:completionHandler:)()
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
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  uint64_t v25;
  id v26;
  void *v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  _QWORD *v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  id v39;
  _QWORD *v40;
  uint64_t v41;
  uint64_t v42;
  id v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  char *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  _QWORD v56[16];
  uint64_t v57;
  uint64_t v58;

  OUTLINED_FUNCTION_3_0();
  v57 = v3;
  v58 = v4;
  v5 = v0;
  v7 = v6;
  v9 = v8;
  v55 = v10;
  v52 = v11;
  v13 = v12;
  v14 = sub_20D137BA0();
  OUTLINED_FUNCTION_92();
  MEMORY[0x24BDAC7A8](v15);
  v17 = (char *)&v44 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18 = sub_20D137BB8();
  v19 = *(_QWORD *)(v18 - 8);
  MEMORY[0x24BDAC7A8](v18);
  OUTLINED_FUNCTION_4_0();
  v20 = *(void **)(v5 + 32);
  v53 = v9;
  v54 = v7;
  v47 = v13;
  v21 = MEMORY[0x212B9CDA4](v9, v7);
  v22 = *(_QWORD *)(v21 + 16);
  v50 = v18;
  v51 = v17;
  v48 = v2;
  v49 = v19;
  if (v22)
  {
    v45 = v1;
    v46 = v14;
    v23 = *(_QWORD *)(OUTLINED_FUNCTION_103() - 8);
    v24 = v21 + ((*(unsigned __int8 *)(v23 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v23 + 80));
    v25 = *(_QWORD *)(v23 + 72);
    while (1)
    {
      v26 = v20;
      v27 = (void *)sub_20D1378A0();
      v28 = objc_msgSend(v26, sel_registeredContentTypesConformingToContentType_, v27);

      v29 = sub_20D137E10();
      v30 = *(_QWORD *)(v29 + 16);
      OUTLINED_FUNCTION_152();
      if (v30)
        break;
      v24 += v25;
      if (!--v22)
      {
        v31 = OUTLINED_FUNCTION_123();
        v1 = v45;
        goto LABEL_7;
      }
    }
    OUTLINED_FUNCTION_123();
    v40 = (_QWORD *)OUTLINED_FUNCTION_37();
    v41 = v54;
    v40[2] = v53;
    v40[3] = v41;
    v42 = v55;
    v40[4] = v52;
    v40[5] = v42;
    v43 = v26;
    swift_retain();
    sub_20D137EAC();

    swift_release();
    OUTLINED_FUNCTION_25();
  }
  else
  {
    v31 = OUTLINED_FUNCTION_123();
LABEL_7:
    OUTLINED_FUNCTION_144(v31, &qword_2549A58C0);
    v32 = (void *)sub_20D137EB8();
    v33 = (_QWORD *)OUTLINED_FUNCTION_37();
    v34 = v54;
    v35 = v55;
    v33[2] = v53;
    v33[3] = v34;
    v33[4] = v52;
    v33[5] = v35;
    v56[4] = sub_20D127CD0;
    v56[5] = v33;
    v56[0] = MEMORY[0x24BDAC760];
    v56[1] = 1107296256;
    v56[2] = sub_20D127958;
    v56[3] = &block_descriptor_0;
    v36 = _Block_copy(v56);
    swift_retain();
    swift_release();
    v37 = v48;
    sub_20D137BAC();
    v56[0] = MEMORY[0x24BEE4AF8];
    sub_20D124C24(&qword_2549A58C8, (void (*)(uint64_t))MEMORY[0x24BEE5458]);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2549A58D0);
    sub_20D12600C(&qword_2549A58D8, &qword_2549A58D0);
    v38 = (uint64_t)v51;
    sub_20D137F30();
    MEMORY[0x212B9D41C](0, v37, v38, v36);
    _Block_release(v36);

    OUTLINED_FUNCTION_52_0(v38, *(uint64_t (**)(uint64_t, uint64_t))(v1 + 8));
    (*(void (**)(uint64_t, uint64_t))(v49 + 8))(v37, v50);
    v39 = objc_msgSend((id)objc_opt_self(), sel_discreteProgressWithTotalUnitCount_, 0);
  }
}

id PhotosPickerItem.itemProvider.getter()
{
  uint64_t v0;

  return *(id *)(v0 + 32);
}

uint64_t sub_20D1275D4(uint64_t a1, void (*a2)(char *), uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v13;
  void (*v14)(char *);
  uint64_t v15;
  uint64_t v16;

  v14 = a2;
  sub_20D137F18();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2549A5F70);
  v7 = sub_20D138008();
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7);
  v10 = (char *)&v13 - v9;
  v15 = a4;
  v16 = a5;
  v11 = sub_20D138008();
  sub_20D127730((void (*)(char *))sub_20D136B68, v11, (uint64_t)v10);
  v14(v10);
  return (*(uint64_t (**)(char *, uint64_t))(v8 + 8))(v10, v7);
}

uint64_t sub_20D1276E8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(a2 - 8) + 16))(a3, a1, a2);
  return __swift_storeEnumTagSinglePayload(a3, 0, 1, a2);
}

uint64_t sub_20D127730@<X0>(void (*a1)(char *)@<X0>, uint64_t a2@<X2>, uint64_t a3@<X8>)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v16;

  v6 = *(_QWORD *)(a2 + 16);
  v7 = *(_QWORD *)(v6 - 8);
  v8 = ((uint64_t (*)(void))MEMORY[0x24BDAC7A8])();
  v10 = (char *)&v16 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v8);
  v12 = (char *)&v16 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t))(v13 + 16))(v12, v14);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    (*(void (**)(uint64_t, char *, _QWORD))(*(_QWORD *)(*(_QWORD *)(a2 + 24) - 8) + 32))(a3, v12, *(_QWORD *)(a2 + 24));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v7 + 32))(v10, v12, v6);
    a1(v10);
    (*(void (**)(char *, uint64_t))(v7 + 8))(v10, v6);
  }
  sub_20D138008();
  return swift_storeEnumTagMultiPayload();
}

uint64_t sub_20D127884(void (*a1)(char *), uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v10;

  sub_20D137F18();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2549A5F70);
  v5 = sub_20D138008();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v10 - v7;
  __swift_storeEnumTagSinglePayload((uint64_t)&v10 - v7, 1, 1, a3);
  swift_storeEnumTagMultiPayload();
  a1(v8);
  return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

uint64_t sub_20D127958(uint64_t a1)
{
  void (*v1)(uint64_t);
  uint64_t v2;

  v1 = *(void (**)(uint64_t))(a1 + 32);
  v2 = swift_retain();
  v1(v2);
  return swift_release();
}

void sub_20D127984(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  __int128 v13;
  unint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  _OWORD v18[2];
  uint64_t v19;

  sub_20D137F18();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2549A5F70);
  v9 = sub_20D137E64();
  v10 = *(_QWORD *)(v9 - 8);
  MEMORY[0x24BDAC7A8](v9);
  v12 = (char *)v18 - v11;
  v13 = *(_OWORD *)(a2 + 16);
  v18[0] = *(_OWORD *)a2;
  v18[1] = v13;
  v19 = *(_QWORD *)(a2 + 32);
  (*(void (**)(char *, uint64_t, uint64_t))(v10 + 16))((char *)v18 - v11, a1, v9);
  v14 = (*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  v15 = swift_allocObject();
  *(_QWORD *)(v15 + 16) = a4;
  *(_QWORD *)(v15 + 24) = a5;
  (*(void (**)(unint64_t, char *, uint64_t))(v10 + 32))(v15 + v14, v12, v9);
  PhotosPickerItem.loadTransferable<A>(type:completionHandler:)();
  v17 = v16;
  swift_release();

}

void sub_20D127ACC(uint64_t a1)
{
  uint64_t *v1;

  sub_20D127984(a1, v1[4], v1[5], v1[2], v1[3]);
}

uint64_t sub_20D127AD8()
{
  uint64_t v0;

  v0 = OUTLINED_FUNCTION_103();
  OUTLINED_FUNCTION_41_0(*(_QWORD *)(v0 - 8));
  OUTLINED_FUNCTION_78_0();
  return OUTLINED_FUNCTION_47_0();
}

uint64_t sub_20D127B10(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;

  v8 = *(unsigned __int8 *)(*(_QWORD *)(OUTLINED_FUNCTION_103() - 8) + 80);
  v9 = v3 + ((v8 + 16) & ~v8);
  v10 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v4 + 16) = v10;
  *v10 = v4;
  v10[1] = sub_20D127B94;
  return sub_20D1268F4(a1, a2, a3, v9);
}

uint64_t sub_20D127B94()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc();
  return OUTLINED_FUNCTION_27(*(uint64_t (**)(void))(v2 + 8));
}

unint64_t sub_20D127BD4()
{
  unint64_t result;
  uint64_t v1;

  result = qword_2549A5C48;
  if (!qword_2549A5C48)
  {
    sub_20D13670C(255, &qword_2549A5C40);
    result = MEMORY[0x212B9D8E4](&protocol conformance descriptor for PHLivePhoto, v1);
    atomic_store(result, (unint64_t *)&qword_2549A5C48);
  }
  return result;
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(_BYTE *)(*(_QWORD *)(a1 - 8) + 82) & 2) != 0)
    return *(_QWORD *)a2;
  return a2;
}

uint64_t type metadata accessor for PhotosPickerSelectionBehavior(uint64_t a1)
{
  return sub_20D125420(a1, (uint64_t *)&unk_2549A5CD0);
}

uint64_t type metadata accessor for PhotosPickerStyle(uint64_t a1)
{
  return sub_20D125420(a1, (uint64_t *)&unk_2549A5CE0);
}

void sub_20D127C64(uint64_t a1, uint64_t a2, uint64_t (*a3)(_QWORD))
{
  uint64_t v3;

  v3 = a3(0);
  OUTLINED_FUNCTION_50_0(v3);
  OUTLINED_FUNCTION_3();
}

uint64_t type metadata accessor for PhotosPickerItem.EncodingDisambiguationPolicy(uint64_t a1)
{
  return sub_20D125420(a1, qword_2549A5CF0);
}

uint64_t sub_20D127CA4()
{
  OUTLINED_FUNCTION_77();
  return swift_deallocObject();
}

uint64_t sub_20D127CC4(uint64_t a1)
{
  uint64_t v1;

  return sub_20D1275D4(a1, *(void (**)(char *))(v1 + 32), *(_QWORD *)(v1 + 40), *(_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 24));
}

uint64_t sub_20D127CD0()
{
  uint64_t v0;

  return sub_20D127884(*(void (**)(char *))(v0 + 32), *(_QWORD *)(v0 + 40), *(_QWORD *)(v0 + 16));
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

uint64_t sub_20D127CF4(uint64_t a1)
{
  uint64_t v2;

  sub_20D137F18();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2549A5F70);
  v2 = sub_20D137E64();
  return sub_20D127D5C(a1, v2);
}

uint64_t sub_20D127D5C(uint64_t a1, uint64_t a2)
{
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
  char *v15;
  uint64_t v16;
  uint64_t v18;

  v3 = *(_QWORD *)(a2 + 16);
  v4 = *(_QWORD *)(v3 - 8);
  v5 = MEMORY[0x24BDAC7A8](a1);
  v7 = (char *)&v18 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = *(_QWORD *)(v8 + 24);
  v10 = *(_QWORD *)(v9 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v12 = (char *)&v18 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = sub_20D138008();
  MEMORY[0x24BDAC7A8](v13);
  v15 = (char *)&v18 - v14;
  (*(void (**)(char *, uint64_t, uint64_t))(v16 + 16))((char *)&v18 - v14, a1, v13);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    (*(void (**)(char *, char *, uint64_t))(v10 + 32))(v12, v15, v9);
    return sub_20D137E4C();
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v4 + 32))(v7, v15, v3);
    return sub_20D137E58();
  }
}

void PhotosPickerItem.init(itemIdentifier:)(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  id v6;

  v6 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDD15F0]), sel_init);
  *(_QWORD *)a3 = a1;
  *(_QWORD *)(a3 + 8) = a2;
  *(_BYTE *)(a3 + 16) = 1;
  *(_QWORD *)(a3 + 24) = MEMORY[0x24BEE4AF8];
  *(_QWORD *)(a3 + 32) = v6;
  OUTLINED_FUNCTION_19_0();
}

uint64_t static PhotosPickerItem.== infix(_:_:)(uint64_t a1, uint64_t a2)
{
  int v2;
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v7;

  v2 = *(unsigned __int8 *)(a1 + 16);
  v3 = *(_QWORD *)(a1 + 24);
  v4 = *(unsigned __int8 *)(a2 + 16);
  v5 = *(_QWORD *)(a2 + 24);
  if (*(_QWORD *)a1 == *(_QWORD *)a2 && *(_QWORD *)(a1 + 8) == *(_QWORD *)(a2 + 8))
  {
    if (v2 != v4)
      return 0;
  }
  else if ((sub_20D137FB4() & 1) == 0 || ((v2 ^ v4) & 1) != 0)
  {
    return 0;
  }
  v7 = sub_20D127FCC(v3, v5);
  if ((v7 & 1) != 0)
  {
    OUTLINED_FUNCTION_144(v7, &qword_2549A5C68);
    return sub_20D137F00() & 1;
  }
  return 0;
}

uint64_t sub_20D127FCC(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  unint64_t v12;
  void (*v13)(char *, unint64_t, uint64_t);
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char v17;
  void (*v18)(char *, uint64_t);
  BOOL v20;
  uint64_t v22;
  uint64_t v23;

  v4 = sub_20D1378D0();
  v5 = MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v22 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v5);
  v10 = (char *)&v22 - v9;
  v11 = *(_QWORD *)(a1 + 16);
  if (v11 == *(_QWORD *)(a2 + 16))
  {
    if (!v11 || a1 == a2)
    {
      v17 = 1;
    }
    else
    {
      v12 = (*(unsigned __int8 *)(v8 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80);
      v22 = *(_QWORD *)(v8 + 72);
      v23 = v8;
      v13 = *(void (**)(char *, unint64_t, uint64_t))(v8 + 16);
      v14 = v11 - 1;
      do
      {
        v15 = a1;
        v13(v10, a1 + v12, v4);
        v16 = a2;
        v13(v7, a2 + v12, v4);
        sub_20D124C24(&qword_2549A5FF8, (void (*)(uint64_t))MEMORY[0x24BEE63B8]);
        v17 = sub_20D137DB0();
        v18 = *(void (**)(char *, uint64_t))(v23 + 8);
        v18(v7, v4);
        v18(v10, v4);
        v20 = v14-- != 0;
        if ((v17 & 1) == 0)
          break;
        v12 += v22;
        a2 = v16;
        a1 = v15;
      }
      while (v20);
    }
  }
  else
  {
    v17 = 0;
  }
  return v17 & 1;
}

uint64_t sub_20D128150(_QWORD *a1, _QWORD *a2)
{
  unint64_t v2;
  uint64_t result;
  char v7;
  _QWORD *v8;
  _QWORD *v9;
  unint64_t v10;

  v2 = a1[2];
  if (v2 != a2[2])
    return 0;
  if (!v2 || a1 == a2)
    return 1;
  result = a1[4];
  if (result != a2[4] || a1[5] != a2[5])
  {
    v7 = sub_20D137FB4();
    result = 0;
    if ((v7 & 1) == 0)
      return result;
  }
  if (v2 == 1)
    return 1;
  v8 = a1 + 7;
  v9 = a2 + 7;
  v10 = 1;
  while (v10 < v2)
  {
    result = *(v8 - 1);
    if (result != *(v9 - 1) || *v8 != *v9)
    {
      result = sub_20D137FB4();
      if ((result & 1) == 0)
        return 0;
    }
    ++v10;
    v8 += 2;
    v9 += 2;
    if (v2 == v10)
      return 1;
  }
  __break(1u);
  return result;
}

void PhotosPickerItem.hash(into:)(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  void *v4;
  id v5;

  v3 = *(_QWORD *)(v1 + 24);
  v4 = *(void **)(v1 + 32);
  swift_bridgeObjectRetain();
  sub_20D137DD4();
  swift_bridgeObjectRelease();
  sub_20D137FF0();
  swift_bridgeObjectRetain();
  sub_20D131C38(a1, v3);
  swift_bridgeObjectRelease();
  v5 = v4;
  sub_20D137F0C();

}

void PhotosPickerItem.hashValue.getter()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  id v3;
  _BYTE v4[72];

  v1 = *(_QWORD *)(v0 + 24);
  v2 = *(void **)(v0 + 32);
  OUTLINED_FUNCTION_71_0();
  swift_bridgeObjectRetain();
  OUTLINED_FUNCTION_78_0();
  sub_20D137DD4();
  swift_bridgeObjectRelease();
  sub_20D137FF0();
  swift_bridgeObjectRetain();
  sub_20D131C38((uint64_t)v4, v1);
  swift_bridgeObjectRelease();
  v3 = v2;
  sub_20D137F0C();

  OUTLINED_FUNCTION_102();
  OUTLINED_FUNCTION_28_0();
}

uint64_t sub_20D128360()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  id v3;
  _BYTE v5[72];

  v1 = *(_QWORD *)(v0 + 24);
  v2 = *(void **)(v0 + 32);
  sub_20D137FD8();
  swift_bridgeObjectRetain();
  sub_20D137DD4();
  swift_bridgeObjectRelease();
  sub_20D137FF0();
  swift_bridgeObjectRetain();
  sub_20D131C38((uint64_t)v5, v1);
  swift_bridgeObjectRelease();
  v3 = v2;
  sub_20D137F0C();

  return sub_20D137FFC();
}

uint64_t sub_20D128408@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, int a6@<W5>, uint64_t a7@<X8>)
{
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
  char *v20;
  uint64_t v21;
  uint64_t v22;
  char *v23;
  uint64_t v24;
  uint64_t v25;
  char *v26;
  uint64_t v27;
  uint64_t v28;
  __int128 v29;
  uint64_t v30;
  __int128 v31;
  void *v32;
  unsigned int v33;
  char **v34;
  id v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  id v39;
  _QWORD v41[4];
  uint64_t v42;
  uint64_t v43;
  char *v44;
  uint64_t v45;
  char *v46;
  uint64_t v47;
  uint64_t v48;
  char *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  int v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;

  v53 = a6;
  v54 = a4;
  v55 = a3;
  v56 = a2;
  v52 = a7;
  v9 = sub_20D137C9C();
  v50 = *(_QWORD *)(v9 - 8);
  v51 = v9;
  MEMORY[0x24BDAC7A8](v9);
  v49 = (char *)v41 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = sub_20D137D38();
  v47 = *(_QWORD *)(v11 - 8);
  v48 = v11;
  MEMORY[0x24BDAC7A8](v11);
  v46 = (char *)v41 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = type metadata accessor for PhotosPickerItem.EncodingDisambiguationPolicy(0);
  MEMORY[0x24BDAC7A8](v13);
  v15 = (char *)v41 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549A5C70);
  v17 = MEMORY[0x24BDAC7A8](v16);
  v43 = (uint64_t)v41 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v17);
  v20 = (char *)v41 - v19;
  v21 = type metadata accessor for PhotosPickerSelectionBehavior(0);
  MEMORY[0x24BDAC7A8](v21);
  v23 = (char *)v41 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  v45 = sub_20D137D5C();
  v42 = *(_QWORD *)(v45 - 8);
  v24 = MEMORY[0x24BDAC7A8](v45);
  v26 = (char *)v41 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v24);
  v44 = (char *)v41 - v27;
  v28 = swift_allocObject();
  *(_QWORD *)(v28 + 16) = 0;
  *(_QWORD *)(v28 + 24) = 0;
  v29 = *(_OWORD *)(a1 + 16);
  *(_OWORD *)(v28 + 32) = *(_OWORD *)a1;
  *(_OWORD *)(v28 + 48) = v29;
  *(_OWORD *)(v28 + 64) = *(_OWORD *)(a1 + 32);
  *(_QWORD *)(v28 + 80) = *(_QWORD *)(a1 + 48);
  v30 = swift_allocObject();
  *(_QWORD *)(v30 + 16) = 0;
  *(_QWORD *)(v30 + 24) = 0;
  v31 = *(_OWORD *)(a1 + 16);
  *(_OWORD *)(v30 + 32) = *(_OWORD *)a1;
  *(_OWORD *)(v30 + 48) = v31;
  *(_OWORD *)(v30 + 64) = *(_OWORD *)(a1 + 32);
  *(_QWORD *)(v30 + 80) = *(_QWORD *)(a1 + 48);
  v57 = a5;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_20D131CFC((_QWORD *)a1);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2549A5920);
  sub_20D137B7C();
  v41[2] = v59;
  v41[3] = v58;
  v41[1] = v60;
  v32 = (void *)objc_opt_self();
  v33 = objc_msgSend(v32, sel_isMultiLibraryModeEnabled);
  v34 = &selRef_imagePickerPhotoLibrary;
  if (!v33)
    v34 = &selRef_sharedPhotoLibrary;
  v35 = objc_msgSend(v32, *v34);
  if (qword_2549A56F0 != -1)
    swift_once();
  v36 = __swift_project_value_buffer(v21, (uint64_t)qword_2549A5AD0);
  sub_20D127C64(v36, (uint64_t)v23, type metadata accessor for PhotosPickerSelectionBehavior);
  v37 = v56;
  sub_20D136B48(v56, (uint64_t)v20, &qword_2549A5C70);
  v38 = v55;
  sub_20D127C64(v55, (uint64_t)v15, type metadata accessor for PhotosPickerItem.EncodingDisambiguationPolicy);
  v39 = v35;
  sub_20D137C48();
  sub_20D137C60();
  (*(void (**)(char *, char *, uint64_t))(v47 + 16))(v46, v23, v48);
  sub_20D137D50();
  sub_20D136B48((uint64_t)v20, v43, &qword_2549A5C70);
  sub_20D137D20();
  (*(void (**)(char *, char *, uint64_t))(v50 + 16))(v49, v15, v51);
  sub_20D137CD8();

  sub_20D131DAC((uint64_t)v15, type metadata accessor for PhotosPickerItem.EncodingDisambiguationPolicy);
  sub_20D136B24((uint64_t)v20, &qword_2549A5C70);
  sub_20D131DAC((uint64_t)v23, type metadata accessor for PhotosPickerSelectionBehavior);
  (*(void (**)(char *, char *, uint64_t))(v42 + 32))(v44, v26, v45);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_20D12924C();
  sub_20D131DAC(v38, type metadata accessor for PhotosPickerItem.EncodingDisambiguationPolicy);
  sub_20D136B24(v37, &qword_2549A5C70);
  swift_bridgeObjectRelease_n();
  return swift_bridgeObjectRelease_n();
}

void sub_20D1288CC(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, void (*a4)(__int128 *__return_ptr, uint64_t)@<X3>, uint64_t a5@<X4>, uint64_t a6@<X8>)
{
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
  uint64_t v22;
  uint64_t v23;
  char *v24;
  uint64_t v25;
  uint64_t v26;
  __int128 v27;
  uint64_t v28;
  __int128 v29;
  void *v30;
  unsigned int v31;
  char **v32;
  id v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  id v37;
  uint64_t v38;
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
  char *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  void (*v53)(__int128 *__return_ptr, uint64_t);
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;

  v53 = a4;
  v54 = a5;
  v55 = a3;
  v56 = a2;
  v52 = a6;
  v7 = sub_20D137C9C();
  v50 = *(_QWORD *)(v7 - 8);
  v51 = v7;
  MEMORY[0x24BDAC7A8](v7);
  v49 = (char *)&v39 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = sub_20D137D38();
  v47 = *(_QWORD *)(v9 - 8);
  v48 = v9;
  MEMORY[0x24BDAC7A8](v9);
  v46 = (char *)&v39 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = type metadata accessor for PhotosPickerItem.EncodingDisambiguationPolicy(0);
  MEMORY[0x24BDAC7A8](v11);
  v13 = (char *)&v39 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549A5C70);
  v15 = MEMORY[0x24BDAC7A8](v14);
  v44 = (uint64_t)&v39 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v15);
  v18 = (char *)&v39 - v17;
  v19 = type metadata accessor for PhotosPickerSelectionBehavior(0);
  MEMORY[0x24BDAC7A8](v19);
  v21 = (char *)&v39 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  v45 = sub_20D137D5C();
  v43 = *(_QWORD *)(v45 - 8);
  v22 = MEMORY[0x24BDAC7A8](v45);
  v24 = (char *)&v39 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v22);
  v42 = (char *)&v39 - v25;
  v26 = swift_allocObject();
  *(_QWORD *)(v26 + 16) = 0;
  *(_QWORD *)(v26 + 24) = 0;
  v27 = *(_OWORD *)(a1 + 16);
  *(_OWORD *)(v26 + 32) = *(_OWORD *)a1;
  *(_OWORD *)(v26 + 48) = v27;
  *(_OWORD *)(v26 + 64) = *(_OWORD *)(a1 + 32);
  *(_QWORD *)(v26 + 80) = *(_QWORD *)(a1 + 48);
  v28 = swift_allocObject();
  *(_QWORD *)(v28 + 16) = 0;
  *(_QWORD *)(v28 + 24) = 0;
  v29 = *(_OWORD *)(a1 + 16);
  *(_OWORD *)(v28 + 32) = *(_OWORD *)a1;
  *(_OWORD *)(v28 + 48) = v29;
  *(_OWORD *)(v28 + 64) = *(_OWORD *)(a1 + 32);
  *(_QWORD *)(v28 + 80) = *(_QWORD *)(a1 + 48);
  sub_20D131CFC((_QWORD *)a1);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2549A5920);
  sub_20D137B7C();
  v40 = v58;
  v41 = v57;
  v39 = v59;
  v30 = (void *)objc_opt_self();
  v31 = objc_msgSend(v30, sel_isMultiLibraryModeEnabled);
  v32 = &selRef_imagePickerPhotoLibrary;
  if (!v31)
    v32 = &selRef_sharedPhotoLibrary;
  v33 = objc_msgSend(v30, *v32);
  if (qword_2549A56F0 != -1)
    swift_once();
  v34 = __swift_project_value_buffer(v19, (uint64_t)qword_2549A5AD0);
  sub_20D127C64(v34, (uint64_t)v21, type metadata accessor for PhotosPickerSelectionBehavior);
  v35 = v56;
  sub_20D136B48(v56, (uint64_t)v18, &qword_2549A5C70);
  v36 = v55;
  sub_20D127C64(v55, (uint64_t)v13, type metadata accessor for PhotosPickerItem.EncodingDisambiguationPolicy);
  v37 = v33;
  sub_20D137C48();
  sub_20D137C60();
  (*(void (**)(char *, char *, uint64_t))(v47 + 16))(v46, v21, v48);
  sub_20D137D50();
  sub_20D136B48((uint64_t)v18, v44, &qword_2549A5C70);
  sub_20D137D20();
  (*(void (**)(char *, char *, uint64_t))(v50 + 16))(v49, v13, v51);
  sub_20D137CD8();

  sub_20D131DAC((uint64_t)v13, type metadata accessor for PhotosPickerItem.EncodingDisambiguationPolicy);
  sub_20D136B24((uint64_t)v18, &qword_2549A5C70);
  sub_20D131DAC((uint64_t)v21, type metadata accessor for PhotosPickerSelectionBehavior);
  v38 = (uint64_t)v42;
  (*(void (**)(char *, char *, uint64_t))(v43 + 32))(v42, v24, v45);
  sub_20D129404(v41, v40, v39, v38, 1, v53, v52);
  sub_20D131DAC(v36, type metadata accessor for PhotosPickerItem.EncodingDisambiguationPolicy);
  sub_20D136B24(v35, &qword_2549A5C70);
}

void PhotosPicker.init(selection:matching:preferredItemEncoding:label:)()
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
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  unsigned int v29;
  char **v30;
  id v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  id v36;
  uint64_t (*v37)(uint64_t, uint64_t, _QWORD);
  uint64_t v38;
  uint64_t (*v39)(_QWORD);
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

  OUTLINED_FUNCTION_3_0();
  v56 = v3;
  v57 = v2;
  v58 = v4;
  v59 = v5;
  v60 = v7;
  v61 = v6;
  v9 = OUTLINED_FUNCTION_43_0(v8);
  v53 = *(_QWORD *)(v9 - 8);
  v54 = v9;
  OUTLINED_FUNCTION_2_0();
  MEMORY[0x24BDAC7A8](v10);
  v51 = OUTLINED_FUNCTION_10_0(v11, v41);
  v50 = *(_QWORD *)(v51 - 8);
  OUTLINED_FUNCTION_2_0();
  MEMORY[0x24BDAC7A8](v12);
  OUTLINED_FUNCTION_25_0();
  v49 = v13;
  type metadata accessor for PhotosPickerItem.EncodingDisambiguationPolicy(0);
  OUTLINED_FUNCTION_14();
  MEMORY[0x24BDAC7A8](v14);
  OUTLINED_FUNCTION_16_0();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2549A5C70);
  OUTLINED_FUNCTION_14();
  MEMORY[0x24BDAC7A8](v15);
  OUTLINED_FUNCTION_27_0();
  OUTLINED_FUNCTION_54_0();
  MEMORY[0x24BDAC7A8](v16);
  v18 = (char *)&v41 - v17;
  v19 = type metadata accessor for PhotosPickerSelectionBehavior(0);
  OUTLINED_FUNCTION_14();
  MEMORY[0x24BDAC7A8](v20);
  v22 = (char *)&v41 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  v48 = OUTLINED_FUNCTION_7_0();
  v46 = *(_QWORD *)(v48 - 8);
  OUTLINED_FUNCTION_2_0();
  MEMORY[0x24BDAC7A8](v23);
  OUTLINED_FUNCTION_12_0();
  MEMORY[0x24BDAC7A8](v24);
  v45 = (uint64_t)&v41 - v25;
  OUTLINED_FUNCTION_63_0();
  v26 = OUTLINED_FUNCTION_13_0();
  OUTLINED_FUNCTION_34_0(v26);
  v27 = OUTLINED_FUNCTION_13_0();
  OUTLINED_FUNCTION_23_0(v27);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2549A5920);
  OUTLINED_FUNCTION_91();
  v44 = v62;
  v43 = v63;
  v42 = v64;
  v28 = (void *)objc_opt_self();
  v29 = objc_msgSend(v28, sel_isMultiLibraryModeEnabled);
  v30 = &selRef_imagePickerPhotoLibrary;
  if (!v29)
    v30 = &selRef_sharedPhotoLibrary;
  v31 = objc_msgSend(v28, *v30);
  if (qword_2549A56F0 != -1)
    swift_once();
  v32 = __swift_project_value_buffer(v19, (uint64_t)qword_2549A5AD0);
  OUTLINED_FUNCTION_137(v32, v33, type metadata accessor for PhotosPickerSelectionBehavior);
  v34 = v61;
  OUTLINED_FUNCTION_84_0(v61, (uint64_t)v18);
  v35 = v60;
  OUTLINED_FUNCTION_117(v60, v1);
  v36 = v31;
  OUTLINED_FUNCTION_106();
  OUTLINED_FUNCTION_83_0();
  OUTLINED_FUNCTION_82_0();
  OUTLINED_FUNCTION_138(v49, v37);
  sub_20D137D50();
  OUTLINED_FUNCTION_84_0((uint64_t)v18, v47);
  sub_20D137D20();
  OUTLINED_FUNCTION_110(v52, *(uint64_t (**)(uint64_t, uint64_t, _QWORD))(v53 + 16));
  sub_20D137CD8();

  v38 = OUTLINED_FUNCTION_59_0();
  sub_20D131DAC(v38, v39);
  OUTLINED_FUNCTION_105((uint64_t)v18);
  sub_20D131DAC((uint64_t)v22, type metadata accessor for PhotosPickerSelectionBehavior);
  v40 = v45;
  OUTLINED_FUNCTION_79_0(v45, v0, *(uint64_t (**)(uint64_t, uint64_t, _QWORD))(v46 + 32));
  OUTLINED_FUNCTION_147(v44, v43, v42, v40, 1, v55, v56);
  sub_20D131DAC(v35, type metadata accessor for PhotosPickerItem.EncodingDisambiguationPolicy);
  OUTLINED_FUNCTION_105(v34);
  OUTLINED_FUNCTION_25();
}

void sub_20D12909C(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
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
  char *v17;
  id v18;
  void (*v19)(char *, uint64_t, uint64_t);
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;

  v25 = a5;
  v26 = a6;
  v23 = a2;
  v24 = a4;
  v7 = sub_20D137C9C();
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7);
  v10 = (char *)&v23 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549A5C70);
  MEMORY[0x24BDAC7A8](v11);
  v13 = (char *)&v23 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = sub_20D137D38();
  v15 = *(_QWORD *)(v14 - 8);
  MEMORY[0x24BDAC7A8](v14);
  v17 = (char *)&v23 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18 = a1;
  sub_20D137C48();
  sub_20D137C60();
  v19 = *(void (**)(char *, uint64_t, uint64_t))(v15 + 16);
  v20 = v24;
  v19(v17, v24, v14);
  sub_20D137D50();
  v21 = v25;
  sub_20D136B48(v25, (uint64_t)v13, &qword_2549A5C70);
  sub_20D137D20();
  v22 = v26;
  (*(void (**)(char *, uint64_t, uint64_t))(v8 + 16))(v10, v26, v7);
  sub_20D137CD8();

  sub_20D131DAC(v22, type metadata accessor for PhotosPickerItem.EncodingDisambiguationPolicy);
  sub_20D136B24(v21, &qword_2549A5C70);
  sub_20D131DAC(v20, type metadata accessor for PhotosPickerSelectionBehavior);
}

void sub_20D12924C()
{
  uint64_t v0;
  uint64_t v1;
  char v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  int *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  char v24;
  uint64_t v25;
  char v26;
  uint64_t v27;

  OUTLINED_FUNCTION_3_0();
  v25 = v1;
  v24 = v2;
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v11 = (int *)__swift_instantiateConcreteTypeFromMangledName(&qword_2549A5FD8);
  OUTLINED_FUNCTION_14();
  MEMORY[0x24BDAC7A8](v12);
  OUTLINED_FUNCTION_6_0();
  sub_20D137B10();
  *(_BYTE *)v0 = v26;
  *(_QWORD *)(v0 + 8) = v27;
  *(_QWORD *)(v0 + 40) = swift_getKeyPath();
  *(_BYTE *)(v0 + 48) = 0;
  v13 = (uint64_t *)(v0 + v11[11]);
  *v13 = swift_getKeyPath();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2549A5C98);
  swift_storeEnumTagMultiPayload();
  *(_QWORD *)(v0 + 16) = v10;
  *(_QWORD *)(v0 + 24) = v8;
  *(_QWORD *)(v0 + 32) = v6;
  v14 = v0 + v11[12];
  v15 = OUTLINED_FUNCTION_7_0();
  v16 = *(_QWORD *)(v15 - 8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v16 + 16))(v14, v4, v15);
  *(_BYTE *)(v0 + v11[13]) = v24;
  swift_bridgeObjectRetain();
  OUTLINED_FUNCTION_70_0();
  v17 = sub_20D137A8C();
  v19 = v18;
  LOBYTE(v13) = v20;
  v22 = v21;
  (*(void (**)(uint64_t, uint64_t))(v16 + 8))(v4, v15);
  v23 = v0 + v11[14];
  *(_QWORD *)v23 = v17;
  *(_QWORD *)(v23 + 8) = v19;
  *(_BYTE *)(v23 + 16) = v13 & 1;
  *(_QWORD *)(v23 + 24) = v22;
  sub_20D1369B4(v0, v25, &qword_2549A5FD8);
  OUTLINED_FUNCTION_19();
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_25();
}

double sub_20D129404@<D0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, char a5@<W4>, void (*a6)(__int128 *__return_ptr, uint64_t)@<X5>, uint64_t a7@<X8>)
{
  uint64_t v13;
  int *v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char v21;
  uint64_t v22;
  double result;
  __int128 v25;
  char v26;
  uint64_t v27;
  char v28;

  v28 = 0;
  sub_20D137B10();
  v13 = *((_QWORD *)&v25 + 1);
  *(_BYTE *)a7 = v25;
  *(_QWORD *)(a7 + 8) = v13;
  *(_QWORD *)(a7 + 40) = swift_getKeyPath();
  *(_BYTE *)(a7 + 48) = 0;
  v14 = (int *)__swift_instantiateConcreteTypeFromMangledName(&qword_2549A5FD8);
  v15 = (uint64_t *)(a7 + v14[11]);
  *v15 = swift_getKeyPath();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2549A5C98);
  swift_storeEnumTagMultiPayload();
  *(_QWORD *)(a7 + 16) = a1;
  *(_QWORD *)(a7 + 24) = a2;
  *(_QWORD *)(a7 + 32) = a3;
  v16 = a7 + v14[12];
  v17 = sub_20D137D5C();
  v18 = *(_QWORD *)(v17 - 8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v18 + 16))(v16, a4, v17);
  *(_BYTE *)(a7 + v14[13]) = a5;
  swift_retain();
  swift_retain();
  v19 = swift_bridgeObjectRetain();
  a6(&v25, v19);
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v18 + 8))(a4, v17);
  v20 = a7 + v14[14];
  v21 = v26;
  v22 = v27;
  result = *(double *)&v25;
  *(_OWORD *)v20 = v25;
  *(_BYTE *)(v20 + 16) = v21;
  *(_QWORD *)(v20 + 24) = v22;
  return result;
}

uint64_t sub_20D129588@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, int a5@<W4>, void (*a6)(uint64_t)@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, uint64_t a9@<X8>, uint64_t a10)
{
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  int *v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v27;
  int v28;
  uint64_t v29;
  uint64_t v30;
  void (*v31)(uint64_t);
  uint64_t v32;

  v30 = a7;
  v31 = a6;
  v28 = a5;
  v27 = a4;
  v32 = *(_QWORD *)(a8 - 8);
  v29 = a8;
  MEMORY[0x24BDAC7A8](a1);
  v16 = (char *)&v27 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(_BYTE *)a9 = sub_20D12BE98() & 1;
  *(_QWORD *)(a9 + 8) = v17;
  *(_QWORD *)(a9 + 40) = swift_getKeyPath();
  *(_BYTE *)(a9 + 48) = 0;
  v19 = (int *)type metadata accessor for PhotosPicker(0, a8, a10, v18);
  v20 = (uint64_t *)(a9 + v19[11]);
  *v20 = swift_getKeyPath();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2549A5C98);
  swift_storeEnumTagMultiPayload();
  *(_QWORD *)(a9 + 16) = a1;
  *(_QWORD *)(a9 + 24) = a2;
  *(_QWORD *)(a9 + 32) = a3;
  v21 = a9 + v19[12];
  v22 = sub_20D137D5C();
  v23 = *(_QWORD *)(v22 - 8);
  v24 = v27;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v23 + 16))(v21, v27, v22);
  *(_BYTE *)(a9 + v19[13]) = v28;
  swift_retain();
  swift_retain();
  v25 = swift_bridgeObjectRetain();
  v31(v25);
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v23 + 8))(v24, v22);
  return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v32 + 32))(a9 + v19[14], v16, v29);
}

uint64_t sub_20D12973C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, int a5@<W4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, uint64_t a9@<X8>, uint64_t a10, uint64_t a11, unsigned __int8 a12)
{
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  uint64_t v22;
  void *v23;
  unsigned int v24;
  char **v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  _QWORD v31[2];
  int v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  int v40;
  uint64_t v41;

  v33 = a7;
  v34 = a8;
  v32 = a5;
  v35 = a4;
  v36 = a9;
  v41 = a3;
  v37 = a1;
  v40 = a12;
  v38 = a10;
  v39 = a2;
  v31[1] = a11;
  v13 = type metadata accessor for PhotosPickerItem.EncodingDisambiguationPolicy(0);
  MEMORY[0x24BDAC7A8](v13);
  v15 = (char *)v31 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549A5C70);
  MEMORY[0x24BDAC7A8](v16);
  v18 = (char *)v31 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v19 = type metadata accessor for PhotosPickerSelectionBehavior(0);
  MEMORY[0x24BDAC7A8](v19);
  v21 = (char *)v31 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  v22 = sub_20D137D5C();
  MEMORY[0x24BDAC7A8](v22);
  v23 = (void *)objc_opt_self();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v24 = objc_msgSend(v23, sel_isMultiLibraryModeEnabled);
  v25 = &selRef_imagePickerPhotoLibrary;
  if (!v24)
    v25 = &selRef_sharedPhotoLibrary;
  v26 = objc_msgSend(v23, *v25);
  v27 = v32 & 1;
  sub_20D127C64(a6, (uint64_t)v21, type metadata accessor for PhotosPickerSelectionBehavior);
  v28 = v33;
  sub_20D136B48(v33, (uint64_t)v18, &qword_2549A5C70);
  v29 = v34;
  sub_20D127C64(v34, (uint64_t)v15, type metadata accessor for PhotosPickerItem.EncodingDisambiguationPolicy);
  sub_20D12909C(v26, v35, v27, (uint64_t)v21, (uint64_t)v18, (uint64_t)v15);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_20D12924C();
  sub_20D131DAC(v29, type metadata accessor for PhotosPickerItem.EncodingDisambiguationPolicy);
  sub_20D136B24(v28, &qword_2549A5C70);
  sub_20D131DAC(a6, type metadata accessor for PhotosPickerSelectionBehavior);
  swift_bridgeObjectRelease_n();
  return swift_bridgeObjectRelease_n();
}

void sub_20D1299D4(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, char a5@<W4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, uint64_t a9@<X8>, void (*a10)(__int128 *__return_ptr, uint64_t), uint64_t a11)
{
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  uint64_t v22;
  char *v23;
  uint64_t v24;
  uint64_t v25;
  char *v26;
  void *v27;
  unsigned int v28;
  char **v29;
  id v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  void (*v37)(__int128 *__return_ptr, uint64_t);
  uint64_t v38;

  v32 = a4;
  v33 = a9;
  v34 = a1;
  v35 = a2;
  v37 = a10;
  v38 = a3;
  v36 = a11;
  v15 = type metadata accessor for PhotosPickerItem.EncodingDisambiguationPolicy(0);
  MEMORY[0x24BDAC7A8](v15);
  v17 = (char *)&v31 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549A5C70);
  MEMORY[0x24BDAC7A8](v18);
  v20 = (char *)&v31 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  v21 = type metadata accessor for PhotosPickerSelectionBehavior(0);
  MEMORY[0x24BDAC7A8](v21);
  v23 = (char *)&v31 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  v24 = sub_20D137D5C();
  MEMORY[0x24BDAC7A8](v24);
  v26 = (char *)&v31 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
  v27 = (void *)objc_opt_self();
  v28 = objc_msgSend(v27, sel_isMultiLibraryModeEnabled);
  v29 = &selRef_imagePickerPhotoLibrary;
  if (!v28)
    v29 = &selRef_sharedPhotoLibrary;
  v30 = objc_msgSend(v27, *v29);
  sub_20D127C64(a6, (uint64_t)v23, type metadata accessor for PhotosPickerSelectionBehavior);
  sub_20D136B48(a7, (uint64_t)v20, &qword_2549A5C70);
  sub_20D127C64(a8, (uint64_t)v17, type metadata accessor for PhotosPickerItem.EncodingDisambiguationPolicy);
  sub_20D12909C(v30, v32, a5 & 1, (uint64_t)v23, (uint64_t)v20, (uint64_t)v17);
  sub_20D129404(v34, v35, v38, (uint64_t)v26, 1, v37, v33);
  sub_20D131DAC(a8, type metadata accessor for PhotosPickerItem.EncodingDisambiguationPolicy);
  sub_20D136B24(a7, &qword_2549A5C70);
  sub_20D131DAC(a6, type metadata accessor for PhotosPickerSelectionBehavior);
}

void PhotosPicker.init(selection:maxSelectionCount:selectionBehavior:matching:preferredItemEncoding:label:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,void (*a21)(uint64_t),uint64_t a22,uint64_t a23,uint64_t a24)
{
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  char v32;
  char v33;
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
  char *v45;
  uint64_t v46;
  int v47;
  id v48;
  uint64_t v49;
  uint64_t (*v50)(_QWORD);
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  void (*v59)(uint64_t);
  uint64_t v60;

  OUTLINED_FUNCTION_3_0();
  v27 = v26;
  v29 = v28;
  v31 = v30;
  v33 = v32;
  v55 = v34;
  v56 = v35;
  v54 = v36;
  v59 = a21;
  v60 = v37;
  v57 = a23;
  v58 = a22;
  v52 = v38;
  v53 = a24;
  type metadata accessor for PhotosPickerItem.EncodingDisambiguationPolicy(0);
  OUTLINED_FUNCTION_14();
  MEMORY[0x24BDAC7A8](v39);
  OUTLINED_FUNCTION_85_0();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2549A5C70);
  OUTLINED_FUNCTION_14();
  MEMORY[0x24BDAC7A8](v40);
  v42 = (char *)&v51 - ((v41 + 15) & 0xFFFFFFFFFFFFFFF0);
  OUTLINED_FUNCTION_32_0();
  OUTLINED_FUNCTION_14();
  MEMORY[0x24BDAC7A8](v43);
  v45 = (char *)&v51 - ((v44 + 15) & 0xFFFFFFFFFFFFFFF0);
  OUTLINED_FUNCTION_7_0();
  OUTLINED_FUNCTION_14();
  MEMORY[0x24BDAC7A8](v46);
  OUTLINED_FUNCTION_4_0();
  v47 = objc_msgSend((id)objc_opt_self(), sel_isMultiLibraryModeEnabled);
  v48 = OUTLINED_FUNCTION_60_0(v47, (SEL *)&selRef_imagePickerPhotoLibrary);
  OUTLINED_FUNCTION_117(v31, (uint64_t)v45);
  sub_20D136B48(v29, (uint64_t)v42, &qword_2549A5C70);
  OUTLINED_FUNCTION_117(v27, v24);
  sub_20D12909C(v48, v52, v33 & 1, (uint64_t)v45, (uint64_t)v42, v24);
  sub_20D129588(v55, v56, v60, v25, 1, v59, v58, v57, v54, v53);
  v49 = OUTLINED_FUNCTION_114();
  sub_20D131DAC(v49, v50);
  sub_20D136B24(v29, &qword_2549A5C70);
  sub_20D131DAC(v31, type metadata accessor for PhotosPickerSelectionBehavior);
  OUTLINED_FUNCTION_25();
}

uint64_t sub_20D129DD8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, void *a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, int a7@<W6>, uint64_t a8@<X7>, uint64_t a9@<X8>)
{
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
  char *v22;
  uint64_t v23;
  uint64_t v24;
  char *v25;
  uint64_t v26;
  uint64_t v27;
  char *v28;
  uint64_t v29;
  uint64_t v30;
  __int128 v31;
  uint64_t v32;
  __int128 v33;
  uint64_t v34;
  id v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  id v39;
  uint64_t v41;
  char *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  char *v46;
  id v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  char *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  int v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;

  v62 = a8;
  v57 = a7;
  v58 = a5;
  v59 = a3;
  v47 = a4;
  v60 = a2;
  v56 = a9;
  v11 = sub_20D137C9C();
  v54 = *(_QWORD *)(v11 - 8);
  v55 = v11;
  MEMORY[0x24BDAC7A8](v11);
  v53 = (char *)&v41 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = sub_20D137D38();
  v51 = *(_QWORD *)(v13 - 8);
  v52 = v13;
  MEMORY[0x24BDAC7A8](v13);
  v46 = (char *)&v41 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = type metadata accessor for PhotosPickerItem.EncodingDisambiguationPolicy(0);
  MEMORY[0x24BDAC7A8](v15);
  v17 = (char *)&v41 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549A5C70);
  v19 = MEMORY[0x24BDAC7A8](v18);
  v49 = (uint64_t)&v41 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v19);
  v22 = (char *)&v41 - v21;
  v23 = type metadata accessor for PhotosPickerSelectionBehavior(0);
  MEMORY[0x24BDAC7A8](v23);
  v25 = (char *)&v41 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  v50 = sub_20D137D5C();
  v48 = *(_QWORD *)(v50 - 8);
  v26 = MEMORY[0x24BDAC7A8](v50);
  v28 = (char *)&v41 - ((v27 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v26);
  v42 = (char *)&v41 - v29;
  v30 = swift_allocObject();
  *(_QWORD *)(v30 + 16) = 0;
  *(_QWORD *)(v30 + 24) = 0;
  v31 = *(_OWORD *)(a1 + 16);
  *(_OWORD *)(v30 + 32) = *(_OWORD *)a1;
  *(_OWORD *)(v30 + 48) = v31;
  *(_OWORD *)(v30 + 64) = *(_OWORD *)(a1 + 32);
  *(_QWORD *)(v30 + 80) = *(_QWORD *)(a1 + 48);
  v32 = swift_allocObject();
  *(_QWORD *)(v32 + 16) = 0;
  *(_QWORD *)(v32 + 24) = 0;
  v33 = *(_OWORD *)(a1 + 16);
  *(_OWORD *)(v32 + 32) = *(_OWORD *)a1;
  *(_OWORD *)(v32 + 48) = v33;
  *(_OWORD *)(v32 + 64) = *(_OWORD *)(a1 + 32);
  *(_QWORD *)(v32 + 80) = *(_QWORD *)(a1 + 48);
  v61 = a6;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_20D131CFC((_QWORD *)a1);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2549A5920);
  sub_20D137B7C();
  v45 = v63;
  v44 = v64;
  v43 = v65;
  v34 = qword_2549A56F0;
  v35 = v47;
  if (v34 != -1)
    swift_once();
  v36 = __swift_project_value_buffer(v23, (uint64_t)qword_2549A5AD0);
  sub_20D127C64(v36, (uint64_t)v25, type metadata accessor for PhotosPickerSelectionBehavior);
  v37 = v60;
  sub_20D136B48(v60, (uint64_t)v22, &qword_2549A5C70);
  v38 = v59;
  sub_20D127C64(v59, (uint64_t)v17, type metadata accessor for PhotosPickerItem.EncodingDisambiguationPolicy);
  v39 = v35;
  sub_20D137C48();
  sub_20D137C60();
  (*(void (**)(char *, char *, uint64_t))(v51 + 16))(v46, v25, v52);
  sub_20D137D50();
  sub_20D136B48((uint64_t)v22, v49, &qword_2549A5C70);
  sub_20D137D20();
  (*(void (**)(char *, char *, uint64_t))(v54 + 16))(v53, v17, v55);
  sub_20D137CD8();

  sub_20D131DAC((uint64_t)v17, type metadata accessor for PhotosPickerItem.EncodingDisambiguationPolicy);
  sub_20D136B24((uint64_t)v22, &qword_2549A5C70);
  sub_20D131DAC((uint64_t)v25, type metadata accessor for PhotosPickerSelectionBehavior);
  (*(void (**)(char *, char *, uint64_t))(v48 + 32))(v42, v28, v50);
  sub_20D12924C();

  sub_20D131DAC(v38, type metadata accessor for PhotosPickerItem.EncodingDisambiguationPolicy);
  sub_20D136B24(v37, &qword_2549A5C70);
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

void sub_20D12A264(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, void *a4@<X3>, void (*a5)(__int128 *__return_ptr, uint64_t)@<X4>, uint64_t a6@<X5>, uint64_t a7@<X8>)
{
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
  uint64_t v19;
  char *v20;
  uint64_t v21;
  uint64_t v22;
  char *v23;
  uint64_t v24;
  uint64_t v25;
  char *v26;
  uint64_t v27;
  char *v28;
  uint64_t v29;
  __int128 v30;
  uint64_t v31;
  __int128 v32;
  uint64_t v33;
  id v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  id v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  id v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  char *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  void (*v53)(__int128 *__return_ptr, uint64_t);
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;

  v53 = a5;
  v54 = a6;
  v43 = a4;
  v55 = a3;
  v56 = a2;
  v52 = a7;
  v8 = sub_20D137C9C();
  v50 = *(_QWORD *)(v8 - 8);
  v51 = v8;
  MEMORY[0x24BDAC7A8](v8);
  v49 = (char *)&v39 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = sub_20D137D38();
  v47 = *(_QWORD *)(v10 - 8);
  v48 = v10;
  MEMORY[0x24BDAC7A8](v10);
  v12 = (char *)&v39 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = type metadata accessor for PhotosPickerItem.EncodingDisambiguationPolicy(0);
  MEMORY[0x24BDAC7A8](v13);
  v15 = (char *)&v39 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549A5C70);
  v17 = MEMORY[0x24BDAC7A8](v16);
  v45 = (uint64_t)&v39 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v17);
  v20 = (char *)&v39 - v19;
  v21 = type metadata accessor for PhotosPickerSelectionBehavior(0);
  MEMORY[0x24BDAC7A8](v21);
  v23 = (char *)&v39 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  v46 = sub_20D137D5C();
  v44 = *(_QWORD *)(v46 - 8);
  v24 = MEMORY[0x24BDAC7A8](v46);
  v26 = (char *)&v39 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v24);
  v28 = (char *)&v39 - v27;
  v29 = swift_allocObject();
  *(_QWORD *)(v29 + 16) = 0;
  *(_QWORD *)(v29 + 24) = 0;
  v30 = *(_OWORD *)(a1 + 16);
  *(_OWORD *)(v29 + 32) = *(_OWORD *)a1;
  *(_OWORD *)(v29 + 48) = v30;
  *(_OWORD *)(v29 + 64) = *(_OWORD *)(a1 + 32);
  *(_QWORD *)(v29 + 80) = *(_QWORD *)(a1 + 48);
  v31 = swift_allocObject();
  *(_QWORD *)(v31 + 16) = 0;
  *(_QWORD *)(v31 + 24) = 0;
  v32 = *(_OWORD *)(a1 + 16);
  *(_OWORD *)(v31 + 32) = *(_OWORD *)a1;
  *(_OWORD *)(v31 + 48) = v32;
  *(_OWORD *)(v31 + 64) = *(_OWORD *)(a1 + 32);
  *(_QWORD *)(v31 + 80) = *(_QWORD *)(a1 + 48);
  sub_20D131CFC((_QWORD *)a1);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2549A5920);
  sub_20D137B7C();
  v41 = v58;
  v42 = v57;
  v40 = v59;
  v33 = qword_2549A56F0;
  v34 = v43;
  if (v33 != -1)
    swift_once();
  v35 = __swift_project_value_buffer(v21, (uint64_t)qword_2549A5AD0);
  sub_20D127C64(v35, (uint64_t)v23, type metadata accessor for PhotosPickerSelectionBehavior);
  v36 = v56;
  sub_20D136B48(v56, (uint64_t)v20, &qword_2549A5C70);
  v37 = v55;
  sub_20D127C64(v55, (uint64_t)v15, type metadata accessor for PhotosPickerItem.EncodingDisambiguationPolicy);
  v38 = v34;
  sub_20D137C48();
  sub_20D137C60();
  (*(void (**)(char *, char *, uint64_t))(v47 + 16))(v12, v23, v48);
  sub_20D137D50();
  sub_20D136B48((uint64_t)v20, v45, &qword_2549A5C70);
  sub_20D137D20();
  (*(void (**)(char *, char *, uint64_t))(v50 + 16))(v49, v15, v51);
  sub_20D137CD8();

  sub_20D131DAC((uint64_t)v15, type metadata accessor for PhotosPickerItem.EncodingDisambiguationPolicy);
  sub_20D136B24((uint64_t)v20, &qword_2549A5C70);
  sub_20D131DAC((uint64_t)v23, type metadata accessor for PhotosPickerSelectionBehavior);
  (*(void (**)(char *, char *, uint64_t))(v44 + 32))(v28, v26, v46);
  sub_20D129404(v42, v41, v40, (uint64_t)v28, 0, v53, v52);

  sub_20D131DAC(v37, type metadata accessor for PhotosPickerItem.EncodingDisambiguationPolicy);
  sub_20D136B24(v36, &qword_2549A5C70);
}

void PhotosPicker.init(selection:matching:preferredItemEncoding:photoLibrary:label:)()
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
  uint64_t v27;
  char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  id v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  id v37;
  uint64_t (*v38)(uint64_t, uint64_t, _QWORD);
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  id v42;
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

  OUTLINED_FUNCTION_3_0();
  v52 = v3;
  v53 = v2;
  v54 = v4;
  v55 = v5;
  v42 = v6;
  v56 = v8;
  v57 = v7;
  v10 = OUTLINED_FUNCTION_43_0(v9);
  v49 = *(_QWORD *)(v10 - 8);
  v50 = v10;
  OUTLINED_FUNCTION_2_0();
  MEMORY[0x24BDAC7A8](v11);
  v47 = OUTLINED_FUNCTION_10_0(v12, v39);
  v46 = *(_QWORD *)(v47 - 8);
  OUTLINED_FUNCTION_2_0();
  MEMORY[0x24BDAC7A8](v13);
  OUTLINED_FUNCTION_25_0();
  v15 = v14;
  type metadata accessor for PhotosPickerItem.EncodingDisambiguationPolicy(0);
  OUTLINED_FUNCTION_14();
  MEMORY[0x24BDAC7A8](v16);
  OUTLINED_FUNCTION_16_0();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2549A5C70);
  OUTLINED_FUNCTION_14();
  MEMORY[0x24BDAC7A8](v17);
  OUTLINED_FUNCTION_27_0();
  OUTLINED_FUNCTION_54_0();
  MEMORY[0x24BDAC7A8](v18);
  v20 = (char *)&v39 - v19;
  v21 = type metadata accessor for PhotosPickerSelectionBehavior(0);
  OUTLINED_FUNCTION_14();
  MEMORY[0x24BDAC7A8](v22);
  v24 = (char *)&v39 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  v45 = OUTLINED_FUNCTION_7_0();
  v43 = *(_QWORD *)(v45 - 8);
  OUTLINED_FUNCTION_2_0();
  MEMORY[0x24BDAC7A8](v25);
  OUTLINED_FUNCTION_12_0();
  MEMORY[0x24BDAC7A8](v26);
  v28 = (char *)&v39 - v27;
  OUTLINED_FUNCTION_63_0();
  v29 = OUTLINED_FUNCTION_13_0();
  OUTLINED_FUNCTION_34_0(v29);
  v30 = OUTLINED_FUNCTION_13_0();
  OUTLINED_FUNCTION_23_0(v30);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2549A5920);
  OUTLINED_FUNCTION_91();
  v41 = v58;
  v40 = v59;
  v39 = v60;
  v31 = qword_2549A56F0;
  v32 = v42;
  if (v31 != -1)
    swift_once();
  v33 = __swift_project_value_buffer(v21, (uint64_t)qword_2549A5AD0);
  OUTLINED_FUNCTION_137(v33, v34, type metadata accessor for PhotosPickerSelectionBehavior);
  v35 = v57;
  OUTLINED_FUNCTION_84_0(v57, (uint64_t)v20);
  v36 = v56;
  sub_20D127C64(v56, v1, type metadata accessor for PhotosPickerItem.EncodingDisambiguationPolicy);
  v37 = v32;
  OUTLINED_FUNCTION_106();
  OUTLINED_FUNCTION_83_0();
  OUTLINED_FUNCTION_82_0();
  OUTLINED_FUNCTION_138(v15, v38);
  sub_20D137D50();
  OUTLINED_FUNCTION_84_0((uint64_t)v20, v44);
  sub_20D137D20();
  OUTLINED_FUNCTION_110(v48, *(uint64_t (**)(uint64_t, uint64_t, _QWORD))(v49 + 16));
  sub_20D137CD8();

  sub_20D131DAC(v1, type metadata accessor for PhotosPickerItem.EncodingDisambiguationPolicy);
  OUTLINED_FUNCTION_105((uint64_t)v20);
  sub_20D131DAC((uint64_t)v24, type metadata accessor for PhotosPickerSelectionBehavior);
  OUTLINED_FUNCTION_79_0((uint64_t)v28, v0, *(uint64_t (**)(uint64_t, uint64_t, _QWORD))(v43 + 32));
  OUTLINED_FUNCTION_147(v41, v40, v39, (uint64_t)v28, 0, v51, v52);

  sub_20D131DAC(v36, type metadata accessor for PhotosPickerItem.EncodingDisambiguationPolicy);
  OUTLINED_FUNCTION_105(v35);
  OUTLINED_FUNCTION_25();
}

uint64_t sub_20D12A9B8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, char a5@<W4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, uint64_t a9@<X8>, void *a10, uint64_t a11, uint64_t a12, unsigned __int8 a13)
{
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  uint64_t v22;
  char *v23;
  uint64_t v24;
  uint64_t v25;
  id v26;
  uint64_t v28;
  id v29;
  unsigned int v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  int v36;
  uint64_t v37;

  v31 = a4;
  v32 = a9;
  v37 = a3;
  v33 = a1;
  v36 = a13;
  v34 = a11;
  v35 = a2;
  v28 = a7;
  v29 = a10;
  v30 = a5 & 1;
  v15 = type metadata accessor for PhotosPickerItem.EncodingDisambiguationPolicy(0);
  MEMORY[0x24BDAC7A8](v15);
  v17 = (char *)&v28 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549A5C70);
  MEMORY[0x24BDAC7A8](v18);
  v20 = (char *)&v28 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  v21 = type metadata accessor for PhotosPickerSelectionBehavior(0);
  MEMORY[0x24BDAC7A8](v21);
  v23 = (char *)&v28 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  v24 = sub_20D137D5C();
  MEMORY[0x24BDAC7A8](v24);
  sub_20D127C64(a6, (uint64_t)v23, type metadata accessor for PhotosPickerSelectionBehavior);
  v25 = v28;
  sub_20D136B48(v28, (uint64_t)v20, &qword_2549A5C70);
  sub_20D127C64(a8, (uint64_t)v17, type metadata accessor for PhotosPickerItem.EncodingDisambiguationPolicy);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v26 = v29;
  sub_20D12909C(v26, v31, v30, (uint64_t)v23, (uint64_t)v20, (uint64_t)v17);
  sub_20D12924C();

  sub_20D131DAC(a8, type metadata accessor for PhotosPickerItem.EncodingDisambiguationPolicy);
  sub_20D136B24(v25, &qword_2549A5C70);
  sub_20D131DAC(a6, type metadata accessor for PhotosPickerSelectionBehavior);
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

void sub_20D12ABEC(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, char a5@<W4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, uint64_t a9@<X8>, void *a10, void (*a11)(__int128 *__return_ptr, uint64_t), uint64_t a12)
{
  uint64_t v15;
  uint64_t v16;
  _BYTE *v17;
  uint64_t v18;
  uint64_t v19;
  _BYTE *v20;
  uint64_t v21;
  uint64_t v22;
  _BYTE *v23;
  uint64_t v24;
  uint64_t v25;
  _BYTE *v26;
  id v27;
  _BYTE v28[4];
  unsigned int v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void (*v33)(__int128 *__return_ptr, uint64_t);
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;

  v30 = a4;
  v31 = a9;
  v32 = a1;
  v35 = a12;
  v36 = a3;
  v33 = a11;
  v34 = a2;
  v29 = a5 & 1;
  v15 = type metadata accessor for PhotosPickerItem.EncodingDisambiguationPolicy(0);
  MEMORY[0x24BDAC7A8](v15);
  v17 = &v28[-((v16 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549A5C70);
  MEMORY[0x24BDAC7A8](v18);
  v20 = &v28[-((v19 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v21 = type metadata accessor for PhotosPickerSelectionBehavior(0);
  MEMORY[0x24BDAC7A8](v21);
  v23 = &v28[-((v22 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v24 = sub_20D137D5C();
  MEMORY[0x24BDAC7A8](v24);
  v26 = &v28[-((v25 + 15) & 0xFFFFFFFFFFFFFFF0)];
  sub_20D127C64(a6, (uint64_t)v23, type metadata accessor for PhotosPickerSelectionBehavior);
  sub_20D136B48(a7, (uint64_t)v20, &qword_2549A5C70);
  sub_20D127C64(a8, (uint64_t)v17, type metadata accessor for PhotosPickerItem.EncodingDisambiguationPolicy);
  v27 = a10;
  sub_20D12909C(v27, v30, v29, (uint64_t)v23, (uint64_t)v20, (uint64_t)v17);
  sub_20D129404(v32, v34, v36, (uint64_t)v26, 0, v33, v31);

  sub_20D131DAC(a8, type metadata accessor for PhotosPickerItem.EncodingDisambiguationPolicy);
  sub_20D136B24(a7, &qword_2549A5C70);
  sub_20D131DAC(a6, type metadata accessor for PhotosPickerSelectionBehavior);
}

void PhotosPicker.init(selection:maxSelectionCount:selectionBehavior:matching:preferredItemEncoding:photoLibrary:label:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,void *a21,void (*a22)(uint64_t),uint64_t a23,uint64_t a24,uint64_t a25)
{
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
  char v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  id v45;
  unsigned int v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;

  OUTLINED_FUNCTION_3_0();
  v30 = v29;
  v32 = v31;
  v34 = v33;
  v49 = v35;
  v50 = v36;
  v48 = v37;
  v51 = v38;
  v47 = v39;
  v46 = v40 & 1;
  type metadata accessor for PhotosPickerItem.EncodingDisambiguationPolicy(0);
  OUTLINED_FUNCTION_14();
  MEMORY[0x24BDAC7A8](v41);
  OUTLINED_FUNCTION_6_0();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2549A5C70);
  OUTLINED_FUNCTION_14();
  MEMORY[0x24BDAC7A8](v42);
  OUTLINED_FUNCTION_14_0();
  OUTLINED_FUNCTION_14();
  MEMORY[0x24BDAC7A8](v43);
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_7_0();
  OUTLINED_FUNCTION_14();
  MEMORY[0x24BDAC7A8](v44);
  OUTLINED_FUNCTION_5_0();
  sub_20D127C64(v34, v28, type metadata accessor for PhotosPickerSelectionBehavior);
  OUTLINED_FUNCTION_61_0(v32);
  sub_20D127C64(v30, v25, type metadata accessor for PhotosPickerItem.EncodingDisambiguationPolicy);
  v45 = a21;
  sub_20D12909C(v45, v47, v46, v28, v27, v25);
  sub_20D129588(v49, v50, v51, v26, 0, a22, a23, a24, v48, a25);

  sub_20D131DAC(v30, type metadata accessor for PhotosPickerItem.EncodingDisambiguationPolicy);
  sub_20D136B24(v32, &qword_2549A5C70);
  sub_20D131DAC(v34, type metadata accessor for PhotosPickerSelectionBehavior);
  OUTLINED_FUNCTION_25();
}

void PhotosPicker.body.getter()
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
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  uint64_t v22;
  uint64_t v23;
  char *v24;
  uint64_t v25;
  uint64_t v26;
  char *v27;
  uint64_t v28;
  char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t (*v32)(uint64_t, uint64_t, uint64_t);
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
  int v51;
  uint64_t v52;
  int v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  char *v58;
  uint64_t v59;
  void (*v60)(char *, uint64_t, uint64_t);
  uint64_t v61;
  uint64_t v62;
  void (*v63)(uint64_t, uint64_t);
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  unint64_t v69;
  _QWORD *v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t (*v79)(uint64_t, uint64_t, _QWORD);
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  char v83;
  uint64_t *v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  char *v93;
  char *v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  char *v99;
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
  uint64_t v111;
  unint64_t v112;
  uint64_t v113;

  OUTLINED_FUNCTION_3_0();
  v1 = v0;
  v3 = v2;
  v107 = v4;
  v92 = OUTLINED_FUNCTION_7_0();
  v91 = *(_QWORD *)(v92 - 8);
  OUTLINED_FUNCTION_2_0();
  MEMORY[0x24BDAC7A8](v5);
  v7 = OUTLINED_FUNCTION_46_0(v6, v89);
  v8 = type metadata accessor for PhotosPickerViewController(v7);
  OUTLINED_FUNCTION_14();
  v10 = MEMORY[0x24BDAC7A8](v9);
  v94 = (char *)&v89 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = *(_QWORD *)(v3 - 8);
  v13 = *(_QWORD *)(v12 + 64);
  MEMORY[0x24BDAC7A8](v10);
  v14 = *(_QWORD *)(v3 + 24);
  v97 = *(_QWORD *)(v3 + 16);
  v95 = (uint64_t)&v89 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v96 = v14;
  v15 = sub_20D137B4C();
  v90 = *(_QWORD *)(v15 - 8);
  MEMORY[0x24BDAC7A8](v15);
  v89 = (uint64_t)&v89 - v16;
  v17 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2549A5C78);
  v18 = MEMORY[0x212B9D8E4](MEMORY[0x24BDF43B0], v15);
  v19 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2549A5C80);
  v20 = OUTLINED_FUNCTION_122();
  v21 = sub_20D131DEC();
  v110 = v19;
  v111 = v20;
  v112 = v21;
  v113 = MEMORY[0x24BDF04C8];
  v22 = OUTLINED_FUNCTION_31_0();
  v104 = v17;
  v105 = v15;
  v110 = v15;
  v111 = v17;
  v103 = v18;
  v112 = v18;
  v113 = v22;
  v101 = v22;
  v23 = MEMORY[0x212B9D8B4](0, &v110, MEMORY[0x24BDF3650], 0);
  v24 = *(char **)(v23 - 8);
  v25 = MEMORY[0x24BDAC7A8](v23);
  v27 = (char *)&v89 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v25);
  v29 = (char *)&v89 - v28;
  v98 = v30;
  v106 = v8;
  v102 = sub_20D1379A8();
  v100 = *(_QWORD *)(v102 - 8);
  MEMORY[0x24BDAC7A8](v102);
  v99 = (char *)&v89 - v31;
  if ((sub_20D12B5A8() & 1) != 0)
  {
    v32 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v12 + 16);
    v94 = v24;
    v33 = v95;
    OUTLINED_FUNCTION_69_0(v95, v1, v32);
    v34 = *(unsigned __int8 *)(v12 + 80);
    v93 = v29;
    v35 = (v34 + 32) & ~v34;
    v36 = swift_allocObject();
    v92 = (uint64_t)v27;
    v38 = v96;
    v37 = v97;
    *(_QWORD *)(v36 + 16) = v97;
    *(_QWORD *)(v36 + 24) = v38;
    v39 = OUTLINED_FUNCTION_69_0(v36 + v35, v33, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v12 + 32));
    MEMORY[0x24BDAC7A8](v39);
    *(&v89 - 4) = v37;
    *(&v89 - 3) = v38;
    v40 = v89;
    sub_20D137B40();
    sub_20D12B790();
    v41 = sub_20D12B7E0();
    v43 = v42;
    v45 = v44;
    v88 = v103;
    v46 = v105;
    v87 = v105;
    v47 = v103;
    v48 = v92;
    v49 = OUTLINED_FUNCTION_59_0();
    sub_20D12B830(v49, v50, v51, v41, v43, v45, v52, v53, v54, v87, v88);
    OUTLINED_FUNCTION_155();
    OUTLINED_FUNCTION_152();
    OUTLINED_FUNCTION_153();
    swift_release();
    v55 = v46;
    swift_release();
    OUTLINED_FUNCTION_22_0(v40, *(uint64_t (**)(uint64_t, uint64_t))(v90 + 8));
    v56 = v104;
    v110 = v46;
    v111 = v104;
    v57 = v101;
    v112 = v47;
    v113 = v101;
    v97 = OUTLINED_FUNCTION_31_0();
    v59 = (uint64_t)v93;
    v58 = v94;
    v60 = (void (*)(char *, uint64_t, uint64_t))*((_QWORD *)v94 + 2);
    v61 = v48;
    v62 = v98;
    v60(v93, v48, v98);
    v63 = (void (*)(uint64_t, uint64_t))*((_QWORD *)v58 + 1);
    OUTLINED_FUNCTION_124();
    v60((char *)v61, v59, v62);
    sub_20D124C24(&qword_2549A5C90, (void (*)(uint64_t))type metadata accessor for PhotosPickerViewController);
    sub_20D12BA14(v61, v62);
    OUTLINED_FUNCTION_124();
    v63(v59, v62);
  }
  else
  {
    sub_20D137E7C();
    v64 = sub_20D137E70();
    v65 = OUTLINED_FUNCTION_37();
    v66 = MEMORY[0x24BEE6930];
    *(_QWORD *)(v65 + 16) = v64;
    *(_QWORD *)(v65 + 24) = v66;
    v67 = v95;
    OUTLINED_FUNCTION_69_0(v95, v1, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v12 + 16));
    v68 = sub_20D137E70();
    v69 = (*(unsigned __int8 *)(v12 + 80) + 48) & ~(unint64_t)*(unsigned __int8 *)(v12 + 80);
    v70 = (_QWORD *)swift_allocObject();
    v70[2] = v68;
    v70[3] = v66;
    v71 = v96;
    v70[4] = v97;
    v70[5] = v71;
    OUTLINED_FUNCTION_69_0((uint64_t)v70 + v69, v67, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v12 + 32));
    sub_20D137B7C();
    LOBYTE(v66) = v112;
    v72 = sub_20D12B7E0();
    v74 = v73;
    v76 = v75;
    OUTLINED_FUNCTION_82_0();
    v77 = (uint64_t)v93;
    OUTLINED_FUNCTION_79_0((uint64_t)v93, v78, v79);
    v80 = (uint64_t)v94;
    v81 = OUTLINED_FUNCTION_59_0();
    sub_20D12BBC4(v81, v82, v66, v72, v74, v76, v77, v83, v84);
    v56 = v104;
    v55 = v105;
    v110 = v105;
    v111 = v104;
    v47 = v103;
    v57 = v101;
    v112 = v103;
    v113 = v101;
    OUTLINED_FUNCTION_31_0();
    sub_20D124C24(&qword_2549A5C90, (void (*)(uint64_t))type metadata accessor for PhotosPickerViewController);
    sub_20D12BDD4(v80, v98, v106);
    sub_20D131DAC(v80, type metadata accessor for PhotosPickerViewController);
  }
  v110 = v55;
  v111 = v56;
  v112 = v47;
  v113 = v57;
  v85 = OUTLINED_FUNCTION_31_0();
  sub_20D124C24(&qword_2549A5C90, (void (*)(uint64_t))type metadata accessor for PhotosPickerViewController);
  v108 = v85;
  v109 = v86;
  OUTLINED_FUNCTION_148();
}

void sub_20D12B578()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v3 = *(_QWORD *)(v2 - 200);
  (*(void (**)(_QWORD, uint64_t, uint64_t))(v3 + 16))(*(_QWORD *)(v2 - 144), v1, v0);
  OUTLINED_FUNCTION_22_0(v1, *(uint64_t (**)(uint64_t, uint64_t))(v3 + 8));
  OUTLINED_FUNCTION_25();
}

uint64_t sub_20D12B5A8()
{
  uint64_t v0;
  uint64_t v1;
  char v2;
  char v3;

  v1 = *(_QWORD *)(v0 + 40);
  v2 = *(_BYTE *)(v0 + 48);
  sub_20D134E10(v1, v2);
  v3 = sub_20D12BED0(v1, v2);
  sub_20D135090(v1, v2);
  return v3 & 1;
}

uint64_t sub_20D12B5FC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  type metadata accessor for PhotosPicker(0, a2, a3, a4);
  return sub_20D12B62C();
}

uint64_t sub_20D12B62C()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_2549A5FE0);
  return sub_20D137B28();
}

uint64_t sub_20D12B67C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, char *a5@<X8>)
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
  void (*v19)(char *, char *, uint64_t);
  void (*v20)(char *, uint64_t);
  uint64_t v22;

  v9 = type metadata accessor for UncheckedSendable(0, a2, a3, a4);
  v10 = *(_QWORD *)(v9 - 8);
  v11 = MEMORY[0x24BDAC7A8](v9);
  v13 = (char *)&v22 - v12;
  v14 = *(_QWORD *)(a2 - 8);
  MEMORY[0x24BDAC7A8](v11);
  v16 = (char *)&v22 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18 = type metadata accessor for PhotosPicker(0, a2, a3, v17);
  (*(void (**)(char *, uint64_t, uint64_t))(v10 + 16))(v13, a1 + *(int *)(v18 + 56), v9);
  v19 = *(void (**)(char *, char *, uint64_t))(v14 + 16);
  v19(v16, v13, a2);
  v20 = *(void (**)(char *, uint64_t))(v14 + 8);
  v20(v13, a2);
  v19(a5, v16, a2);
  return ((uint64_t (*)(char *, uint64_t))v20)(v16, a2);
}

uint64_t sub_20D12B790()
{
  uint64_t v1;

  __swift_instantiateConcreteTypeFromMangledName(&qword_2549A5FE0);
  sub_20D137B34();
  return v1;
}

uint64_t sub_20D12B7E0()
{
  uint64_t v1;

  __swift_instantiateConcreteTypeFromMangledName(&qword_2549A5850);
  sub_20D137B70();
  return v1;
}

uint64_t sub_20D12B830@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, int a3@<W2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, int a8@<W7>, uint64_t a9@<X8>, uint64_t a10, uint64_t a11)
{
  char v13;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  int v29;
  int v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  unint64_t v36;
  uint64_t v37;

  v29 = a8;
  v30 = a3;
  v27 = a5;
  v28 = a6;
  v13 = a3;
  v26 = a1;
  v32 = a9;
  v33 = a10;
  v31 = a11;
  v16 = sub_20D137D5C();
  v17 = *(_QWORD *)(v16 - 8);
  v18 = *(_QWORD *)(v17 + 64);
  MEMORY[0x24BDAC7A8](v16);
  (*(void (**)(char *, uint64_t, uint64_t))(v17 + 16))((char *)&v26 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0), a7, v16);
  v19 = (*(unsigned __int8 *)(v17 + 80) + 64) & ~(unint64_t)*(unsigned __int8 *)(v17 + 80);
  v20 = swift_allocObject();
  *(_QWORD *)(v20 + 16) = a1;
  *(_QWORD *)(v20 + 24) = a2;
  *(_BYTE *)(v20 + 32) = v13;
  *(_QWORD *)(v20 + 40) = a4;
  v21 = v28;
  *(_QWORD *)(v20 + 48) = v27;
  *(_QWORD *)(v20 + 56) = v21;
  (*(void (**)(unint64_t, char *, uint64_t))(v17 + 32))(v20 + v19, (char *)&v26 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0), v16);
  *(_BYTE *)(v20 + v19 + v18) = v29;
  swift_retain();
  swift_retain();
  swift_bridgeObjectRetain();
  swift_retain();
  swift_retain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2549A5C78);
  v22 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2549A5C80);
  v23 = sub_20D1379B4();
  v24 = sub_20D131DEC();
  v34 = v22;
  v35 = v23;
  v36 = v24;
  v37 = MEMORY[0x24BDF04C8];
  swift_getOpaqueTypeConformance2();
  sub_20D137AEC();
  return swift_release();
}

uint64_t sub_20D12BA14(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v7;

  v4 = sub_20D137990();
  MEMORY[0x24BDAC7A8](v4);
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(a2 - 8) + 16))((char *)&v7 - v5, a1, a2);
  swift_storeEnumTagMultiPayload();
  return sub_20D13799C();
}

uint64_t sub_20D12BAD8(_BYTE *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v9;
  uint64_t v10;
  uint64_t result;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;

  v9 = sub_20D137918();
  v10 = *(_QWORD *)(v9 - 8);
  result = MEMORY[0x24BDAC7A8](v9);
  v14 = (char *)&v15 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  if ((*a1 & 1) == 0)
  {
    type metadata accessor for PhotosPicker(0, a5, a6, v12);
    sub_20D12C05C();
    sub_20D13790C();
    return (*(uint64_t (**)(char *, uint64_t))(v10 + 8))(v14, v9);
  }
  return result;
}

uint64_t sub_20D12BBC4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, char a3@<W2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, char a8@<W7>, uint64_t *a9@<X8>)
{
  int *v16;
  char *v17;
  char *v18;
  char *v19;
  char *v20;
  char *v21;
  uint64_t *v22;
  uint64_t *v23;
  uint64_t *v24;
  char *v25;
  _QWORD *v26;
  char *v27;
  uint64_t v28;
  uint64_t result;

  *a9 = swift_getKeyPath();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2549A5EB0);
  swift_storeEnumTagMultiPayload();
  v16 = (int *)type metadata accessor for PhotosPickerViewController(0);
  v17 = (char *)a9 + v16[5];
  *(_QWORD *)v17 = swift_getKeyPath();
  v17[8] = 0;
  v18 = (char *)a9 + v16[6];
  *(_QWORD *)v18 = swift_getKeyPath();
  v18[8] = 0;
  v19 = (char *)a9 + v16[7];
  *(_QWORD *)v19 = swift_getKeyPath();
  v19[8] = 0;
  v20 = (char *)a9 + v16[8];
  *(_QWORD *)v20 = swift_getKeyPath();
  *((_QWORD *)v20 + 1) = 0;
  v20[16] = 0;
  v21 = (char *)a9 + v16[9];
  *(_QWORD *)v21 = swift_getKeyPath();
  v21[8] = 0;
  v22 = (uint64_t *)((char *)a9 + v16[10]);
  *v22 = swift_getKeyPath();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2549A5EB8);
  swift_storeEnumTagMultiPayload();
  v23 = (uint64_t *)((char *)a9 + v16[11]);
  *v23 = swift_getKeyPath();
  swift_storeEnumTagMultiPayload();
  v24 = (uint64_t *)((char *)a9 + v16[12]);
  *v24 = swift_getKeyPath();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2549A5EC8);
  swift_storeEnumTagMultiPayload();
  v25 = (char *)a9 + v16[13];
  *(_QWORD *)v25 = a1;
  *((_QWORD *)v25 + 1) = a2;
  v25[16] = a3;
  v26 = (uint64_t *)((char *)a9 + v16[14]);
  *v26 = a4;
  v26[1] = a5;
  v26[2] = a6;
  v27 = (char *)a9 + v16[15];
  v28 = sub_20D137D5C();
  result = (*(uint64_t (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v28 - 8) + 32))(v27, a7, v28);
  *((_BYTE *)a9 + v16[16]) = a8;
  return result;
}

uint64_t sub_20D12BDD4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v8;

  v5 = sub_20D137990();
  MEMORY[0x24BDAC7A8](v5);
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(a3 - 8) + 16))((char *)&v8 - v6, a1, a3);
  swift_storeEnumTagMultiPayload();
  return sub_20D13799C();
}

uint64_t sub_20D12BE98()
{
  unsigned __int8 v1;

  sub_20D137B10();
  return v1;
}

uint64_t sub_20D12BED0(uint64_t a1, char a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  os_log_type_t v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v13;
  unsigned __int8 v14;

  v4 = sub_20D137960();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if ((a2 & 1) != 0)
    return a1 & 1;
  swift_retain();
  v8 = sub_20D137EA0();
  v9 = sub_20D137A38();
  if (os_log_type_enabled(v9, v8))
  {
    v10 = swift_slowAlloc();
    v11 = swift_slowAlloc();
    v13 = v11;
    *(_DWORD *)v10 = 136315138;
    *(_QWORD *)(v10 + 4) = sub_20D130B4C(1819242306, 0xE400000000000000, &v13);
    _os_log_impl(&dword_20D11F000, v9, v8, "Accessing Environment<%s>'s value outside of being installed on a View. This will always read the default value and will not update.", (uint8_t *)v10, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x212B9D944](v11, -1, -1);
    MEMORY[0x212B9D944](v10, -1, -1);
  }

  sub_20D137954();
  swift_getAtKeyPath();
  sub_20D135090(a1, 0);
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  return v14;
}

void sub_20D12C05C()
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
  void (*v13)(uint64_t, uint64_t);
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_97(v4, v5, v6, v7);
  v8 = OUTLINED_FUNCTION_140();
  OUTLINED_FUNCTION_92();
  MEMORY[0x24BDAC7A8](v9);
  OUTLINED_FUNCTION_36_0();
  OUTLINED_FUNCTION_14();
  MEMORY[0x24BDAC7A8](v10);
  OUTLINED_FUNCTION_26_0(v11, v16);
  if (OUTLINED_FUNCTION_154() == 1)
  {
    OUTLINED_FUNCTION_139();
    v12 = OUTLINED_FUNCTION_128();
    v13(v12, v2);
  }
  else
  {
    sub_20D137EA0();
    v14 = OUTLINED_FUNCTION_129();
    if (OUTLINED_FUNCTION_64_0(v14))
    {
      OUTLINED_FUNCTION_51_0();
      OUTLINED_FUNCTION_37_0();
      *(_QWORD *)(v3 + 4) = OUTLINED_FUNCTION_62_0(4.8149e-34);
      OUTLINED_FUNCTION_39_0(&dword_20D11F000, v14, v15, "Accessing Environment<%s>'s value outside of being installed on a View. This will always read the default value and will not update.");
      OUTLINED_FUNCTION_38_0();
      OUTLINED_FUNCTION_20_0();
    }

    sub_20D137954();
    OUTLINED_FUNCTION_115();
    OUTLINED_FUNCTION_119();
    (*(void (**)(uint64_t, uint64_t))(v1 + 8))(v0, v8);
  }
  OUTLINED_FUNCTION_25();
}

uint64_t sub_20D12C174(uint64_t a1, char a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  os_log_type_t v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v13;
  unsigned __int8 v14;

  v4 = sub_20D137960();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if ((a2 & 1) == 0)
  {
    swift_retain();
    v8 = sub_20D137EA0();
    v9 = sub_20D137A38();
    if (os_log_type_enabled(v9, v8))
    {
      v10 = swift_slowAlloc();
      v11 = swift_slowAlloc();
      v13 = v11;
      *(_DWORD *)v10 = 136315138;
      *(_QWORD *)(v10 + 4) = sub_20D130B4C(7628115, 0xE300000000000000, &v13);
      _os_log_impl(&dword_20D11F000, v9, v8, "Accessing Environment<%s>'s value outside of being installed on a View. This will always read the default value and will not update.", (uint8_t *)v10, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x212B9D944](v11, -1, -1);
      MEMORY[0x212B9D944](v10, -1, -1);
    }

    sub_20D137954();
    swift_getAtKeyPath();
    sub_20D135090(a1, 0);
    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
    return v14;
  }
  return a1;
}

void sub_20D12C2FC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char v7;
  char v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;

  OUTLINED_FUNCTION_3_0();
  v2 = v1;
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v11 = OUTLINED_FUNCTION_140();
  v12 = *(_QWORD *)(v11 - 8);
  MEMORY[0x24BDAC7A8](v11);
  OUTLINED_FUNCTION_16_0();
  if ((v8 & 1) == 0)
  {
    swift_retain();
    sub_20D137EA0();
    v13 = OUTLINED_FUNCTION_129();
    if (OUTLINED_FUNCTION_64_0(v13))
    {
      OUTLINED_FUNCTION_51_0();
      v15 = OUTLINED_FUNCTION_37_0();
      *(_DWORD *)v2 = 136315138;
      *(_QWORD *)(v2 + 4) = sub_20D130B4C(v6, v4, &v15);
      OUTLINED_FUNCTION_39_0(&dword_20D11F000, v13, v14, "Accessing Environment<%s>'s value outside of being installed on a View. This will always read the default value and will not update.");
      OUTLINED_FUNCTION_38_0();
      OUTLINED_FUNCTION_20_0();
    }

    sub_20D137954();
    swift_getAtKeyPath();
    ((void (*)(uint64_t, _QWORD))v2)(v10, 0);
    OUTLINED_FUNCTION_52_0(v0, *(uint64_t (**)(uint64_t, uint64_t))(v12 + 8));
  }
  OUTLINED_FUNCTION_25();
}

uint64_t sub_20D12C424(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  os_log_type_t v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v15;

  v6 = sub_20D137960();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v15 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  if ((a3 & 1) != 0)
  {
    swift_bridgeObjectRetain();
  }
  else
  {
    swift_retain();
    v10 = sub_20D137EA0();
    v11 = sub_20D137A38();
    if (os_log_type_enabled(v11, v10))
    {
      v12 = swift_slowAlloc();
      v13 = swift_slowAlloc();
      v15 = v13;
      *(_DWORD *)v12 = 136315138;
      *(_QWORD *)(v12 + 4) = sub_20D130B4C(0xD000000000000010, 0x800000020D139B30, &v15);
      _os_log_impl(&dword_20D11F000, v11, v10, "Accessing Environment<%s>'s value outside of being installed on a View. This will always read the default value and will not update.", (uint8_t *)v12, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x212B9D944](v13, -1, -1);
      MEMORY[0x212B9D944](v12, -1, -1);
    }

    sub_20D137954();
    swift_getAtKeyPath();
    sub_20D13509C(a1, a2, 0);
    (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
    return v15;
  }
  return a1;
}

uint64_t sub_20D12C5D8(uint64_t a1, char a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  os_log_type_t v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v13;
  uint64_t v14;

  v4 = sub_20D137960();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if ((a2 & 1) == 0)
  {
    swift_retain();
    v8 = sub_20D137EA0();
    v9 = sub_20D137A38();
    if (os_log_type_enabled(v9, v8))
    {
      v10 = swift_slowAlloc();
      v11 = swift_slowAlloc();
      v14 = v11;
      *(_DWORD *)v10 = 136315138;
      *(_QWORD *)(v10 + 4) = sub_20D130B4C(0xD000000000000013, 0x800000020D139B10, &v14);
      _os_log_impl(&dword_20D11F000, v9, v8, "Accessing Environment<%s>'s value outside of being installed on a View. This will always read the default value and will not update.", (uint8_t *)v10, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x212B9D944](v11, -1, -1);
      MEMORY[0x212B9D944](v10, -1, -1);
    }

    sub_20D137954();
    swift_getAtKeyPath();
    sub_20D135090(a1, 0);
    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
    return v14;
  }
  return a1;
}

void sub_20D12C76C()
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
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_97(v5, v6, v7, v8);
  v10 = v9;
  OUTLINED_FUNCTION_140();
  OUTLINED_FUNCTION_92();
  MEMORY[0x24BDAC7A8](v11);
  OUTLINED_FUNCTION_36_0();
  OUTLINED_FUNCTION_14();
  MEMORY[0x24BDAC7A8](v12);
  OUTLINED_FUNCTION_26_0(v13, v16);
  if (OUTLINED_FUNCTION_154() == 1)
  {
    sub_20D1369B4(v3, v10, v1);
  }
  else
  {
    sub_20D137EA0();
    v14 = OUTLINED_FUNCTION_129();
    if (OUTLINED_FUNCTION_64_0(v14))
    {
      OUTLINED_FUNCTION_51_0();
      OUTLINED_FUNCTION_37_0();
      *(_QWORD *)(v4 + 4) = OUTLINED_FUNCTION_62_0(4.8149e-34);
      OUTLINED_FUNCTION_39_0(&dword_20D11F000, v14, v15, "Accessing Environment<%s>'s value outside of being installed on a View. This will always read the default value and will not update.");
      OUTLINED_FUNCTION_38_0();
      OUTLINED_FUNCTION_20_0();
    }

    sub_20D137954();
    OUTLINED_FUNCTION_115();
    OUTLINED_FUNCTION_119();
    OUTLINED_FUNCTION_22_0(v0, *(uint64_t (**)(uint64_t, uint64_t))(v2 + 8));
  }
  OUTLINED_FUNCTION_25();
}

void PhotosPicker<>.init(_:selection:matching:preferredItemEncoding:)()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  int v4;
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
  int v17;
  uint64_t v18;

  OUTLINED_FUNCTION_3_0();
  v3 = v2;
  v17 = v4;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  type metadata accessor for PhotosPickerItem.EncodingDisambiguationPolicy(0);
  OUTLINED_FUNCTION_14();
  MEMORY[0x24BDAC7A8](v11);
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_90();
  OUTLINED_FUNCTION_14();
  MEMORY[0x24BDAC7A8](v12);
  OUTLINED_FUNCTION_11_0(v13, v16);
  v14 = OUTLINED_FUNCTION_118();
  sub_20D127C64(v14, v15, type metadata accessor for PhotosPickerItem.EncodingDisambiguationPolicy);
  OUTLINED_FUNCTION_73_0();
  OUTLINED_FUNCTION_70_0();
  sub_20D128408((uint64_t)&v18, v0, v1, v8, v6, v17, v10);
  OUTLINED_FUNCTION_120();
  OUTLINED_FUNCTION_89(v3);
  OUTLINED_FUNCTION_19();
  OUTLINED_FUNCTION_74_0();
  OUTLINED_FUNCTION_25();
}

void PhotosPicker<>.init<A>(_:selection:matching:preferredItemEncoding:)()
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
  char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18[6];
  uint64_t v19;

  OUTLINED_FUNCTION_3_0();
  v2 = v1;
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  type metadata accessor for PhotosPickerItem.EncodingDisambiguationPolicy(0);
  OUTLINED_FUNCTION_14();
  MEMORY[0x24BDAC7A8](v11);
  v13 = (char *)v18 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  OUTLINED_FUNCTION_151();
  OUTLINED_FUNCTION_14();
  MEMORY[0x24BDAC7A8](v14);
  OUTLINED_FUNCTION_9_0(v15, v18[0]);
  v16 = OUTLINED_FUNCTION_87_0();
  OUTLINED_FUNCTION_96(v16, v17);
  v18[2] = v4;
  v18[3] = v2;
  v18[4] = v8;
  sub_20D1288CC((uint64_t)&v19, v0, (uint64_t)v13, (void (*)(__int128 *__return_ptr, uint64_t))sub_20D136EF4, (uint64_t)v18, v10);
  OUTLINED_FUNCTION_101(v6);
  OUTLINED_FUNCTION_116();
  OUTLINED_FUNCTION_22_0(v8, *(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8));
  OUTLINED_FUNCTION_25();
}

void PhotosPicker<>.init(_:selection:maxSelectionCount:selectionBehavior:matching:preferredItemEncoding:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24)
{
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
  unsigned __int8 v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t (*v44)(_QWORD);
  uint64_t v45;
  uint64_t v46;
  unsigned __int8 v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_146(v28, v29, v30, v31, v32, v33, v34, v35);
  v48 = v36;
  v38 = v37;
  v47 = v39;
  type metadata accessor for PhotosPickerItem.EncodingDisambiguationPolicy(0);
  OUTLINED_FUNCTION_14();
  MEMORY[0x24BDAC7A8](v40);
  OUTLINED_FUNCTION_30_0();
  OUTLINED_FUNCTION_90();
  OUTLINED_FUNCTION_14();
  MEMORY[0x24BDAC7A8](v41);
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_32_0();
  OUTLINED_FUNCTION_14();
  MEMORY[0x24BDAC7A8](v42);
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_137(a22, v43, v44);
  v45 = OUTLINED_FUNCTION_118();
  sub_20D136B48(v45, v46, &qword_2549A5C70);
  sub_20D127C64(a24, v25, type metadata accessor for PhotosPickerItem.EncodingDisambiguationPolicy);
  OUTLINED_FUNCTION_73_0();
  OUTLINED_FUNCTION_70_0();
  sub_20D12973C(v49, v50, v51, v52, a21 & 1, v27, v26, v25, v38, v48, v24, v47);
  sub_20D131DAC(a24, type metadata accessor for PhotosPickerItem.EncodingDisambiguationPolicy);
  OUTLINED_FUNCTION_89(a23);
  sub_20D131DAC(a22, type metadata accessor for PhotosPickerSelectionBehavior);
  OUTLINED_FUNCTION_19();
  OUTLINED_FUNCTION_74_0();
  OUTLINED_FUNCTION_25();
}

void PhotosPicker<>.init<A>(_:selection:maxSelectionCount:selectionBehavior:matching:preferredItemEncoding:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23)
{
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
  char v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t (*v39)(_QWORD);
  uint64_t v40;
  uint64_t *v41;
  uint64_t v42;
  char v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  _QWORD v48[4];
  uint64_t v49;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_99(v29, v30, v31, v32, v33);
  v42 = v34;
  v43 = v35 & 1;
  OUTLINED_FUNCTION_142();
  OUTLINED_FUNCTION_14();
  MEMORY[0x24BDAC7A8](v36);
  OUTLINED_FUNCTION_5_0();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2549A5C70);
  OUTLINED_FUNCTION_14();
  MEMORY[0x24BDAC7A8](v37);
  OUTLINED_FUNCTION_14_0();
  OUTLINED_FUNCTION_14();
  MEMORY[0x24BDAC7A8](v38);
  OUTLINED_FUNCTION_4_0();
  sub_20D127C64(v24, v28, v39);
  OUTLINED_FUNCTION_61_0(v25);
  OUTLINED_FUNCTION_81();
  v48[2] = a22;
  v48[3] = a23;
  v49 = v23;
  sub_20D1299D4(v44, v45, v46, v47, v43, v28, v27, v26, v42, (void (*)(__int128 *__return_ptr, uint64_t))sub_20D136EF4, (uint64_t)v48);
  OUTLINED_FUNCTION_112();
  v40 = OUTLINED_FUNCTION_59_0();
  sub_20D136B24(v40, v41);
  sub_20D131DAC(v24, type metadata accessor for PhotosPickerSelectionBehavior);
  OUTLINED_FUNCTION_52_0(v23, *(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(a22 - 8) + 8));
  OUTLINED_FUNCTION_25();
}

void PhotosPicker<>.init(_:selection:matching:preferredItemEncoding:photoLibrary:)()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
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
  int v20;
  void *v21;
  uint64_t v22;

  OUTLINED_FUNCTION_3_0();
  v21 = v2;
  v4 = v3;
  v6 = v5;
  HIDWORD(v19) = v7;
  v9 = v8;
  v11 = v10;
  v13 = v12;
  type metadata accessor for PhotosPickerItem.EncodingDisambiguationPolicy(0);
  OUTLINED_FUNCTION_14();
  MEMORY[0x24BDAC7A8](v14);
  OUTLINED_FUNCTION_30_0();
  OUTLINED_FUNCTION_151();
  OUTLINED_FUNCTION_14();
  MEMORY[0x24BDAC7A8](v15);
  OUTLINED_FUNCTION_9_0(v16, v19);
  v17 = OUTLINED_FUNCTION_59_0();
  OUTLINED_FUNCTION_96(v17, v18);
  OUTLINED_FUNCTION_73_0();
  OUTLINED_FUNCTION_70_0();
  sub_20D129DD8((uint64_t)&v22, v1, v0, v21, v11, v9, v20, v6, v13);
  OUTLINED_FUNCTION_101(v4);
  OUTLINED_FUNCTION_116();
  OUTLINED_FUNCTION_19();
  OUTLINED_FUNCTION_74_0();
  OUTLINED_FUNCTION_25();
}

void PhotosPicker<>.init<A>(_:selection:matching:preferredItemEncoding:photoLibrary:)()
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
  _QWORD v20[6];
  uint64_t v21;

  OUTLINED_FUNCTION_3_0();
  v3 = v2;
  v5 = v4;
  v19 = v6;
  v8 = v7;
  v10 = v9;
  v12 = v11;
  type metadata accessor for PhotosPickerItem.EncodingDisambiguationPolicy(0);
  OUTLINED_FUNCTION_14();
  MEMORY[0x24BDAC7A8](v13);
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_90();
  OUTLINED_FUNCTION_14();
  MEMORY[0x24BDAC7A8](v14);
  OUTLINED_FUNCTION_11_0(v15, v18);
  v16 = OUTLINED_FUNCTION_118();
  sub_20D127C64(v16, v17, type metadata accessor for PhotosPickerItem.EncodingDisambiguationPolicy);
  v20[2] = v5;
  v20[3] = v3;
  v20[4] = v10;
  sub_20D12A264((uint64_t)&v21, v0, v1, v19, (void (*)(__int128 *__return_ptr, uint64_t))sub_20D136EF4, (uint64_t)v20, v12);
  OUTLINED_FUNCTION_120();
  OUTLINED_FUNCTION_89(v8);
  OUTLINED_FUNCTION_22_0(v10, *(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8));
  OUTLINED_FUNCTION_25();
}

void PhotosPicker<>.init(_:selection:maxSelectionCount:selectionBehavior:matching:preferredItemEncoding:photoLibrary:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,void *a25)
{
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
  int v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  char *v42;
  uint64_t v43;
  uint64_t (*v44)(_QWORD);
  uint64_t v45;
  uint64_t v46;
  void *v47;
  int v48;
  int v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_146(v28, v29, v30, v31, v32, v33, v34, v35);
  v50 = v36;
  v51 = v37;
  v47 = a25;
  v48 = a21 & 1;
  v49 = v38;
  OUTLINED_FUNCTION_142();
  OUTLINED_FUNCTION_14();
  MEMORY[0x24BDAC7A8](v39);
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_90();
  OUTLINED_FUNCTION_14();
  MEMORY[0x24BDAC7A8](v40);
  v42 = (char *)&v47 - ((v41 + 15) & 0xFFFFFFFFFFFFFFF0);
  OUTLINED_FUNCTION_32_0();
  OUTLINED_FUNCTION_14();
  MEMORY[0x24BDAC7A8](v43);
  OUTLINED_FUNCTION_85_0();
  sub_20D127C64(a22, v26, v44);
  v45 = OUTLINED_FUNCTION_59_0();
  sub_20D136B48(v45, v46, &qword_2549A5C70);
  OUTLINED_FUNCTION_96(a24, v27);
  OUTLINED_FUNCTION_73_0();
  OUTLINED_FUNCTION_70_0();
  sub_20D12A9B8(v52, v53, v54, v55, v48, v26, (uint64_t)v42, v27, v51, v47, v50, v25, v49);
  OUTLINED_FUNCTION_101(a24);
  OUTLINED_FUNCTION_89(a23);
  sub_20D131DAC(a22, type metadata accessor for PhotosPickerSelectionBehavior);
  OUTLINED_FUNCTION_19();
  OUTLINED_FUNCTION_74_0();
  OUTLINED_FUNCTION_25();
}

void PhotosPicker<>.init<A>(_:selection:maxSelectionCount:selectionBehavior:matching:preferredItemEncoding:photoLibrary:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,void *a22,uint64_t a23,uint64_t a24)
{
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
  char v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t (*v40)(_QWORD);
  uint64_t v41;
  uint64_t v42;
  char v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  _QWORD v49[4];
  uint64_t v50;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_99(v30, v31, v32, v33, v34);
  v44 = v35;
  v43 = v36 & 1;
  OUTLINED_FUNCTION_142();
  OUTLINED_FUNCTION_14();
  MEMORY[0x24BDAC7A8](v37);
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_151();
  OUTLINED_FUNCTION_14();
  MEMORY[0x24BDAC7A8](v38);
  OUTLINED_FUNCTION_14_0();
  OUTLINED_FUNCTION_14();
  MEMORY[0x24BDAC7A8](v39);
  OUTLINED_FUNCTION_30_0();
  sub_20D127C64(v25, v27, v40);
  v41 = OUTLINED_FUNCTION_87_0();
  sub_20D136B48(v41, v42, &qword_2549A5C70);
  OUTLINED_FUNCTION_81();
  v49[2] = a23;
  v49[3] = a24;
  v50 = v24;
  sub_20D12ABEC(v45, v46, v47, v48, v43, v27, v29, v28, v44, a22, (void (*)(__int128 *__return_ptr, uint64_t))sub_20D1320DC, (uint64_t)v49);
  OUTLINED_FUNCTION_112();
  sub_20D136B24(v26, &qword_2549A5C70);
  sub_20D131DAC(v25, type metadata accessor for PhotosPickerSelectionBehavior);
  OUTLINED_FUNCTION_52_0(v24, *(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(a23 - 8) + 8));
  OUTLINED_FUNCTION_25();
}

void sub_20D12D0DC(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  char v6;
  uint64_t v7;

  MEMORY[0x24BDAC7A8](a1);
  OUTLINED_FUNCTION_16_0();
  (*(void (**)(uint64_t))(v4 + 16))(v2);
  *(_QWORD *)a2 = sub_20D137A98();
  *(_QWORD *)(a2 + 8) = v5;
  *(_BYTE *)(a2 + 16) = v6 & 1;
  *(_QWORD *)(a2 + 24) = v7;
  OUTLINED_FUNCTION_19_0();
}

void View.photosPicker(isPresented:selection:matching:preferredItemEncoding:)()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
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
  char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  char *v31;
  __int128 v32;
  uint64_t v33;
  __int128 v34;
  uint64_t v35;
  __int128 v36;
  uint64_t v37;
  int v38;
  id v39;
  uint64_t v40;
  id v41;
  uint64_t (*v42)(uint64_t, uint64_t, _QWORD);
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
  int v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  _OWORD v66[3];
  uint64_t v67;

  OUTLINED_FUNCTION_3_0();
  v61 = v1;
  v62 = v0;
  v60 = v2;
  v50 = v3;
  v49 = v4;
  v6 = v5;
  v57 = v7;
  v58 = v8;
  v59 = v9;
  v11 = OUTLINED_FUNCTION_43_0(v10);
  v54 = *(_QWORD *)(v11 - 8);
  v55 = v11;
  OUTLINED_FUNCTION_2_0();
  MEMORY[0x24BDAC7A8](v12);
  OUTLINED_FUNCTION_46_0(v13, v44);
  v48 = sub_20D137D38();
  v47 = *(_QWORD *)(v48 - 8);
  OUTLINED_FUNCTION_2_0();
  MEMORY[0x24BDAC7A8](v14);
  OUTLINED_FUNCTION_25_0();
  v16 = v15;
  type metadata accessor for PhotosPickerItem.EncodingDisambiguationPolicy(0);
  OUTLINED_FUNCTION_14();
  MEMORY[0x24BDAC7A8](v17);
  v19 = (char *)&v44 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2549A5C70);
  OUTLINED_FUNCTION_14();
  MEMORY[0x24BDAC7A8](v20);
  OUTLINED_FUNCTION_27_0();
  OUTLINED_FUNCTION_54_0();
  MEMORY[0x24BDAC7A8](v21);
  v23 = (char *)&v44 - v22;
  v24 = OUTLINED_FUNCTION_32_0();
  OUTLINED_FUNCTION_14();
  MEMORY[0x24BDAC7A8](v25);
  v27 = (char *)&v44 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0);
  v53 = OUTLINED_FUNCTION_7_0();
  v51 = *(_QWORD *)(v53 - 8);
  OUTLINED_FUNCTION_2_0();
  MEMORY[0x24BDAC7A8](v28);
  OUTLINED_FUNCTION_12_0();
  MEMORY[0x24BDAC7A8](v29);
  v31 = (char *)&v44 - v30;
  v32 = *(_OWORD *)(v6 + 16);
  v66[0] = *(_OWORD *)v6;
  v66[1] = v32;
  v66[2] = *(_OWORD *)(v6 + 32);
  v67 = *(_QWORD *)(v6 + 48);
  v33 = OUTLINED_FUNCTION_13_0();
  *(_QWORD *)(v33 + 16) = 0;
  *(_QWORD *)(v33 + 24) = 0;
  v34 = *(_OWORD *)(v6 + 16);
  *(_OWORD *)(v33 + 32) = *(_OWORD *)v6;
  *(_OWORD *)(v33 + 48) = v34;
  *(_OWORD *)(v33 + 64) = *(_OWORD *)(v6 + 32);
  *(_QWORD *)(v33 + 80) = *(_QWORD *)(v6 + 48);
  v35 = OUTLINED_FUNCTION_13_0();
  *(_QWORD *)(v35 + 16) = 0;
  *(_QWORD *)(v35 + 24) = 0;
  v36 = *(_OWORD *)(v6 + 16);
  *(_OWORD *)(v35 + 32) = *(_OWORD *)v6;
  *(_OWORD *)(v35 + 48) = v36;
  *(_OWORD *)(v35 + 64) = *(_OWORD *)(v6 + 32);
  OUTLINED_FUNCTION_40_0(v35, *(_QWORD *)(v6 + 48));
  sub_20D131CFC(v66);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2549A5920);
  sub_20D137B7C();
  v45 = v63;
  v37 = v65;
  v44 = v64;
  v38 = objc_msgSend((id)objc_opt_self(), sel_isMultiLibraryModeEnabled);
  v39 = OUTLINED_FUNCTION_60_0(v38, (SEL *)&selRef_imagePickerPhotoLibrary);
  if (qword_2549A56F0 != -1)
    swift_once();
  v40 = __swift_project_value_buffer(v24, (uint64_t)qword_2549A5AD0);
  sub_20D127C64(v40, (uint64_t)v27, type metadata accessor for PhotosPickerSelectionBehavior);
  sub_20D136B48(v49, (uint64_t)v23, &qword_2549A5C70);
  sub_20D127C64(v50, (uint64_t)v19, type metadata accessor for PhotosPickerItem.EncodingDisambiguationPolicy);
  v41 = v39;
  OUTLINED_FUNCTION_106();
  OUTLINED_FUNCTION_83_0();
  OUTLINED_FUNCTION_82_0();
  OUTLINED_FUNCTION_79_0(v16, (uint64_t)v27, v42);
  sub_20D137D50();
  sub_20D136B48((uint64_t)v23, v46, &qword_2549A5C70);
  sub_20D137D20();
  (*(void (**)(uint64_t, char *, uint64_t))(v54 + 16))(v52, v19, v55);
  sub_20D137CD8();

  sub_20D131DAC((uint64_t)v19, type metadata accessor for PhotosPickerItem.EncodingDisambiguationPolicy);
  sub_20D136B24((uint64_t)v23, &qword_2549A5C70);
  sub_20D131DAC((uint64_t)v27, type metadata accessor for PhotosPickerSelectionBehavior);
  v43 = v51;
  OUTLINED_FUNCTION_69_0((uint64_t)v31, v0, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v51 + 32));
  sub_20D12B830(v58, v59, v57 & 1, v45, v44, v37, (uint64_t)v31, 1, v56, v61, v60);
  OUTLINED_FUNCTION_74_0();
  OUTLINED_FUNCTION_113();
  OUTLINED_FUNCTION_155();
  OUTLINED_FUNCTION_52_0((uint64_t)v31, *(uint64_t (**)(uint64_t, uint64_t))(v43 + 8));
  OUTLINED_FUNCTION_25();
}

void View.photosPicker(isPresented:selection:maxSelectionCount:selectionBehavior:matching:preferredItemEncoding:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23)
{
  uint64_t v23;
  uint64_t v24;
  char v25;
  char v26;
  uint64_t v27;
  uint64_t v28;
  int v29;
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
  void *v40;
  unsigned int v41;
  char **v42;
  id v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  int v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;

  OUTLINED_FUNCTION_3_0();
  v26 = v25;
  OUTLINED_FUNCTION_100(v27, v28, v29, v30, v31, v32);
  v56 = v34;
  v57 = v33;
  type metadata accessor for PhotosPickerItem.EncodingDisambiguationPolicy(0);
  OUTLINED_FUNCTION_14();
  MEMORY[0x24BDAC7A8](v35);
  OUTLINED_FUNCTION_86_0();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2549A5C70);
  OUTLINED_FUNCTION_14();
  MEMORY[0x24BDAC7A8](v36);
  type metadata accessor for PhotosPickerSelectionBehavior(0);
  OUTLINED_FUNCTION_14();
  MEMORY[0x24BDAC7A8](v37);
  v38 = OUTLINED_FUNCTION_7_0();
  v39 = *(_QWORD *)(v38 - 8);
  MEMORY[0x24BDAC7A8](v38);
  OUTLINED_FUNCTION_5_0();
  v40 = (void *)objc_opt_self();
  v41 = objc_msgSend(v40, sel_isMultiLibraryModeEnabled);
  v42 = &selRef_imagePickerPhotoLibrary;
  if (!v41)
    v42 = &selRef_sharedPhotoLibrary;
  v43 = objc_msgSend(v40, *v42, a23);
  v44 = OUTLINED_FUNCTION_87_0();
  sub_20D127C64(v44, v45, type metadata accessor for PhotosPickerSelectionBehavior);
  v46 = OUTLINED_FUNCTION_114();
  sub_20D136B48(v46, v47, &qword_2549A5C70);
  sub_20D127C64(v55, v23, type metadata accessor for PhotosPickerItem.EncodingDisambiguationPolicy);
  OUTLINED_FUNCTION_88(v43, v57, v26 & 1);
  v48 = OUTLINED_FUNCTION_29_0();
  sub_20D12B830(v48, v49, v50, v51, v52, v53, v24, 1, v54, v55, v56);
  (*(void (**)(uint64_t, uint64_t))(v39 + 8))(v24, v38);
  OUTLINED_FUNCTION_25();
}

void View.photosPicker(isPresented:selection:matching:preferredItemEncoding:photoLibrary:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21)
{
  uint64_t v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  int v28;
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
  uint64_t v42;
  char *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  char *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  char *v51;
  __int128 v52;
  uint64_t v53;
  __int128 v54;
  uint64_t v55;
  __int128 v56;
  uint64_t v57;
  uint64_t v58;
  id v59;
  uint64_t v60;
  id v61;
  uint64_t (*v62)(uint64_t, uint64_t, _QWORD);
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  id v66;
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
  int v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  _OWORD v87[3];
  uint64_t v88;

  OUTLINED_FUNCTION_3_0();
  v82 = v22;
  v83 = v21;
  v66 = v23;
  v72 = v24;
  v69 = v25;
  v27 = v26;
  v79 = v28;
  v80 = v29;
  v81 = v30;
  v78 = v31;
  v32 = OUTLINED_FUNCTION_43_0(a21);
  v75 = *(_QWORD *)(v32 - 8);
  v76 = v32;
  OUTLINED_FUNCTION_2_0();
  MEMORY[0x24BDAC7A8](v33);
  v70 = OUTLINED_FUNCTION_10_0(v34, v64);
  v68 = *(_QWORD *)(v70 - 8);
  OUTLINED_FUNCTION_2_0();
  MEMORY[0x24BDAC7A8](v35);
  OUTLINED_FUNCTION_25_0();
  v67 = v36;
  type metadata accessor for PhotosPickerItem.EncodingDisambiguationPolicy(0);
  OUTLINED_FUNCTION_14();
  MEMORY[0x24BDAC7A8](v37);
  v39 = (char *)&v64 - ((v38 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2549A5C70);
  OUTLINED_FUNCTION_14();
  MEMORY[0x24BDAC7A8](v40);
  OUTLINED_FUNCTION_27_0();
  OUTLINED_FUNCTION_54_0();
  MEMORY[0x24BDAC7A8](v41);
  v43 = (char *)&v64 - v42;
  v44 = OUTLINED_FUNCTION_32_0();
  OUTLINED_FUNCTION_14();
  MEMORY[0x24BDAC7A8](v45);
  v47 = (char *)&v64 - ((v46 + 15) & 0xFFFFFFFFFFFFFFF0);
  v73 = OUTLINED_FUNCTION_7_0();
  v71 = *(_QWORD *)(v73 - 8);
  OUTLINED_FUNCTION_2_0();
  MEMORY[0x24BDAC7A8](v48);
  OUTLINED_FUNCTION_12_0();
  MEMORY[0x24BDAC7A8](v49);
  v51 = (char *)&v64 - v50;
  v52 = *(_OWORD *)(v27 + 16);
  v87[0] = *(_OWORD *)v27;
  v87[1] = v52;
  v87[2] = *(_OWORD *)(v27 + 32);
  v88 = *(_QWORD *)(v27 + 48);
  v53 = OUTLINED_FUNCTION_13_0();
  *(_QWORD *)(v53 + 16) = 0;
  *(_QWORD *)(v53 + 24) = 0;
  v54 = *(_OWORD *)(v27 + 16);
  *(_OWORD *)(v53 + 32) = *(_OWORD *)v27;
  *(_OWORD *)(v53 + 48) = v54;
  *(_OWORD *)(v53 + 64) = *(_OWORD *)(v27 + 32);
  *(_QWORD *)(v53 + 80) = *(_QWORD *)(v27 + 48);
  v55 = OUTLINED_FUNCTION_13_0();
  *(_QWORD *)(v55 + 16) = 0;
  *(_QWORD *)(v55 + 24) = 0;
  v56 = *(_OWORD *)(v27 + 16);
  *(_OWORD *)(v55 + 32) = *(_OWORD *)v27;
  *(_OWORD *)(v55 + 48) = v56;
  *(_OWORD *)(v55 + 64) = *(_OWORD *)(v27 + 32);
  OUTLINED_FUNCTION_40_0(v55, *(_QWORD *)(v27 + 48));
  sub_20D131CFC(v87);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2549A5920);
  sub_20D137B7C();
  v65 = v84;
  v57 = v86;
  v64 = v85;
  v58 = qword_2549A56F0;
  v59 = v66;
  if (v58 != -1)
    swift_once();
  v60 = __swift_project_value_buffer(v44, (uint64_t)qword_2549A5AD0);
  sub_20D127C64(v60, (uint64_t)v47, type metadata accessor for PhotosPickerSelectionBehavior);
  sub_20D136B48(v69, (uint64_t)v43, &qword_2549A5C70);
  OUTLINED_FUNCTION_96(v72, (uint64_t)v39);
  v61 = v59;
  OUTLINED_FUNCTION_106();
  OUTLINED_FUNCTION_83_0();
  OUTLINED_FUNCTION_82_0();
  OUTLINED_FUNCTION_79_0(v67, (uint64_t)v47, v62);
  sub_20D137D50();
  OUTLINED_FUNCTION_61_0((uint64_t)v43);
  sub_20D137D20();
  (*(void (**)(uint64_t, char *, uint64_t))(v75 + 16))(v74, v39, v76);
  sub_20D137CD8();

  OUTLINED_FUNCTION_101((uint64_t)v39);
  sub_20D136B24((uint64_t)v43, &qword_2549A5C70);
  sub_20D131DAC((uint64_t)v47, type metadata accessor for PhotosPickerSelectionBehavior);
  v63 = v71;
  (*(void (**)(char *, uint64_t, uint64_t))(v71 + 32))(v51, v21, v73);
  sub_20D12B830(v80, v81, v79 & 1, v65, v64, v57, (uint64_t)v51, 0, v78, v82, v77);
  OUTLINED_FUNCTION_152();
  OUTLINED_FUNCTION_155();
  OUTLINED_FUNCTION_119();
  OUTLINED_FUNCTION_22_0((uint64_t)v51, *(uint64_t (**)(uint64_t, uint64_t))(v63 + 8));
  OUTLINED_FUNCTION_25();
}

void View.photosPicker(isPresented:selection:maxSelectionCount:selectionBehavior:matching:preferredItemEncoding:photoLibrary:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,void *a24)
{
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  int v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  char v33;
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
  int v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  unsigned int v51;
  uint64_t v52;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_100(v26, v27, v28, v29, v30, v31);
  v52 = v32;
  v51 = v33 & 1;
  type metadata accessor for PhotosPickerItem.EncodingDisambiguationPolicy(0);
  OUTLINED_FUNCTION_14();
  MEMORY[0x24BDAC7A8](v34);
  OUTLINED_FUNCTION_86_0();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2549A5C70);
  OUTLINED_FUNCTION_14();
  MEMORY[0x24BDAC7A8](v35);
  type metadata accessor for PhotosPickerSelectionBehavior(0);
  OUTLINED_FUNCTION_14();
  MEMORY[0x24BDAC7A8](v36);
  v37 = OUTLINED_FUNCTION_7_0();
  v38 = *(_QWORD *)(v37 - 8);
  MEMORY[0x24BDAC7A8](v37);
  OUTLINED_FUNCTION_4_0();
  v39 = OUTLINED_FUNCTION_87_0();
  sub_20D127C64(v39, v40, type metadata accessor for PhotosPickerSelectionBehavior);
  v41 = OUTLINED_FUNCTION_114();
  sub_20D136B48(v41, v42, &qword_2549A5C70);
  sub_20D127C64(a23, v24, type metadata accessor for PhotosPickerItem.EncodingDisambiguationPolicy);
  OUTLINED_FUNCTION_88(a24, v52, v51);
  v43 = OUTLINED_FUNCTION_29_0();
  sub_20D12B830(v43, v44, v45, v46, v47, v48, v25, 0, v49, v50, (uint64_t)a24);
  (*(void (**)(uint64_t, uint64_t))(v38 + 8))(v25, v37);
  OUTLINED_FUNCTION_25();
}

void View.photosPickerStyle(_:)()
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
  _QWORD v10[2];
  BOOL v11;

  OUTLINED_FUNCTION_3_0();
  v1 = v0;
  v3 = v2;
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2549A5CA0);
  v4 = sub_20D137930();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v10[-1] - v6;
  swift_getKeyPath();
  v11 = (*(_BYTE *)(v3 + *(int *)(type metadata accessor for PhotosPickerStyle(0) + 20)) & 1) == 0;
  sub_20D137ABC();
  swift_release();
  swift_getKeyPath();
  sub_20D12600C(&qword_2549A5CA8, &qword_2549A5CA0);
  v10[0] = v1;
  v10[1] = v8;
  MEMORY[0x212B9D8E4](MEMORY[0x24BDED308], v4, v10);
  OUTLINED_FUNCTION_78_0();
  sub_20D137ABC();
  swift_release();
  OUTLINED_FUNCTION_52_0((uint64_t)v7, *(uint64_t (**)(uint64_t, uint64_t))(v5 + 8));
  OUTLINED_FUNCTION_25();
}

uint64_t sub_20D12DD8C()
{
  unsigned __int8 v1;

  sub_20D13695C();
  sub_20D13796C();
  return v1;
}

uint64_t sub_20D12DDC4()
{
  sub_20D13695C();
  return sub_20D137978();
}

uint64_t sub_20D12DDFC()
{
  sub_20D136920();
  return sub_20D13796C();
}

uint64_t sub_20D12DE30(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v7;

  v2 = sub_20D137BDC();
  MEMORY[0x24BDAC7A8](v2);
  v4 = (char *)&v7 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t))(v5 + 16))(v4, a1);
  return sub_20D12DEAC((uint64_t)v4);
}

uint64_t sub_20D12DEAC(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v6;

  v2 = sub_20D137BDC();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))((char *)&v6 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v2);
  sub_20D136920();
  sub_20D137978();
  return (*(uint64_t (**)(uint64_t, uint64_t))(v3 + 8))(a1, v2);
}

uint64_t View.photosPickerAccessoryVisibility(_:edges:)(char a1, char a2)
{
  uint64_t v4;

  swift_getKeyPath();
  v4 = OUTLINED_FUNCTION_37();
  *(_BYTE *)(v4 + 16) = a1;
  *(_BYTE *)(v4 + 17) = a2;
  sub_20D137AE0();
  OUTLINED_FUNCTION_153();
  return swift_release();
}

uint64_t sub_20D12DFEC()
{
  unsigned __int8 v1;

  sub_20D1368E4();
  sub_20D13796C();
  return v1;
}

uint64_t sub_20D12E024()
{
  sub_20D1368E4();
  return sub_20D137978();
}

uint64_t sub_20D12E05C(_BYTE *a1, char a2, unsigned __int8 a3)
{
  uint64_t result;

  if (a2 != 2)
    return sub_20D12E0C8();
  sub_20D137A74();
  result = sub_20D137A74();
  if (result != a3)
  {
    result = sub_20D137A74();
    *a1 = result;
  }
  return result;
}

uint64_t sub_20D12E0C8()
{
  _BYTE *v0;
  unsigned __int8 v1;
  unsigned __int8 v2;
  unsigned __int8 v3;

  sub_20D137A74();
  v1 = sub_20D137A74();
  v2 = sub_20D137A74();
  v3 = 0;
  if (v1 != v2)
  {
    sub_20D137A74();
    sub_20D137A74();
    *v0 = sub_20D137A74();
    v3 = v1;
  }
  return v3 | ((v1 == v2) << 8);
}

void View.photosPickerDisabledCapabilities(_:)()
{
  sub_20D12E18C();
}

uint64_t sub_20D12E16C()
{
  return sub_20D12E1DC((void (*)(void))sub_20D1368A8);
}

void View._photosPickerDisabledPrivateCapabilities(_:)()
{
  sub_20D12E18C();
}

void sub_20D12E18C()
{
  OUTLINED_FUNCTION_53_0();
  OUTLINED_FUNCTION_42_0();
  OUTLINED_FUNCTION_113();
  OUTLINED_FUNCTION_80_0();
}

uint64_t sub_20D12E1C8()
{
  return sub_20D12E1DC((void (*)(void))sub_20D13686C);
}

uint64_t sub_20D12E1DC(void (*a1)(void))
{
  uint64_t v2;

  a1();
  sub_20D13796C();
  return v2;
}

uint64_t sub_20D12E21C(uint64_t a1, void (*a2)(void))
{
  a2();
  return OUTLINED_FUNCTION_149();
}

void View._photosPickerSourceType(_:)()
{
  swift_getKeyPath();
  OUTLINED_FUNCTION_42_0();
  OUTLINED_FUNCTION_113();
  OUTLINED_FUNCTION_80_0();
}

uint64_t sub_20D12E2A8()
{
  uint64_t v1;

  sub_20D136830();
  sub_20D13796C();
  return v1;
}

uint64_t sub_20D12E2E0()
{
  sub_20D136830();
  return sub_20D137978();
}

uint64_t View._photosPickerPeopleConfiguration(_:)()
{
  return sub_20D12E50C();
}

uint64_t sub_20D12E324()
{
  sub_20D1367F4();
  return sub_20D13796C();
}

uint64_t View._photosPickerContainerIdentifier(_:)()
{
  OUTLINED_FUNCTION_55_0();
  swift_getKeyPath();
  OUTLINED_FUNCTION_42_0();
  return OUTLINED_FUNCTION_153();
}

uint64_t sub_20D12E3BC()
{
  uint64_t v1;

  sub_20D1367B8();
  sub_20D13796C();
  return v1;
}

uint64_t sub_20D12E3F4()
{
  swift_bridgeObjectRetain();
  return sub_20D12E430();
}

uint64_t sub_20D12E430()
{
  sub_20D1367B8();
  return sub_20D137978();
}

uint64_t View._photosPickerAlbumsConfiguration(_:)()
{
  return sub_20D12E50C();
}

uint64_t sub_20D12E474()
{
  sub_20D13677C();
  return sub_20D13796C();
}

void sub_20D12E4A8()
{
  void (*v0)(void);
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  OUTLINED_FUNCTION_55_0();
  OUTLINED_FUNCTION_150(v3, v4);
  OUTLINED_FUNCTION_14();
  MEMORY[0x24BDAC7A8](v5);
  OUTLINED_FUNCTION_24_0(v6, v7);
  v0();
  OUTLINED_FUNCTION_149();
  sub_20D136B24(v2, v1);
  OUTLINED_FUNCTION_53();
}

uint64_t View._photosPickerSuggestionGroup(_:)()
{
  return sub_20D12E50C();
}

uint64_t sub_20D12E50C()
{
  OUTLINED_FUNCTION_53_0();
  OUTLINED_FUNCTION_42_0();
  return swift_release();
}

uint64_t sub_20D12E54C()
{
  sub_20D136740();
  return sub_20D13796C();
}

void sub_20D12E580(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t *a5)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  __swift_instantiateConcreteTypeFromMangledName(a5);
  OUTLINED_FUNCTION_14();
  MEMORY[0x24BDAC7A8](v5);
  OUTLINED_FUNCTION_24_0(v6, v7);
  sub_20D12E4A8();
  OUTLINED_FUNCTION_53();
}

void sub_20D12E5E4(uint64_t a1@<X0>, uint64_t a2@<X1>, int a3@<W2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, int a8@<W7>, uint64_t a9@<X8>)
{
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t v22;
  char *v23;
  uint64_t v24;
  char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  int v29;
  uint64_t v30;
  int v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;

  v31 = a8;
  v27 = a7;
  v28 = a2;
  v30 = a6;
  v29 = a3;
  v33 = a9;
  v32 = sub_20D1379B4();
  v34 = *(_QWORD *)(v32 - 8);
  MEMORY[0x24BDAC7A8](v32);
  v13 = (char *)&v27 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = sub_20D137D5C();
  v15 = *(_QWORD *)(v14 - 8);
  MEMORY[0x24BDAC7A8](v14);
  v17 = (char *)&v27 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18 = type metadata accessor for PhotosPickerViewController(0);
  MEMORY[0x24BDAC7A8](v18);
  v20 = (uint64_t *)((char *)&v27 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0));
  v21 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549A5C80);
  MEMORY[0x24BDAC7A8](v21);
  v23 = (char *)&v27 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v15 + 16))(v17, v27, v14);
  sub_20D12BBC4(a1, v28, v29, a4, a5, v30, (uint64_t)v17, v31, v20);
  swift_retain();
  swift_retain();
  swift_bridgeObjectRetain();
  swift_retain();
  swift_retain();
  v24 = sub_20D13793C();
  LOBYTE(v14) = sub_20D137A44();
  sub_20D127C64((uint64_t)v20, (uint64_t)v23, type metadata accessor for PhotosPickerViewController);
  v25 = &v23[*(int *)(v21 + 36)];
  *(_QWORD *)v25 = v24;
  v25[8] = v14;
  sub_20D131DAC((uint64_t)v20, type metadata accessor for PhotosPickerViewController);
  sub_20D137984();
  sub_20D131DEC();
  v26 = v32;
  sub_20D137AD4();
  (*(void (**)(char *, uint64_t))(v34 + 8))(v13, v26);
  sub_20D136B24((uint64_t)v23, &qword_2549A5C80);
}

uint64_t sub_20D12E828()
{
  uint64_t v0;

  v0 = sub_20D137BDC();
  __swift_allocate_value_buffer(v0, qword_2549A5BC0);
  __swift_project_value_buffer(v0, (uint64_t)qword_2549A5BC0);
  return sub_20D137BD0();
}

uint64_t sub_20D12E870()
{
  uint64_t v0;

  if (qword_2549A5740 != -1)
    swift_once();
  v0 = sub_20D137BDC();
  return __swift_project_value_buffer(v0, (uint64_t)qword_2549A5BC0);
}

uint64_t sub_20D12E8B8@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;

  v2 = sub_20D12E870();
  v3 = sub_20D137BDC();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 16))(a1, v2, v3);
}

uint64_t sub_20D12E8F8()
{
  sub_20D124C24(qword_2549A6040, (void (*)(uint64_t))MEMORY[0x24BDE3910]);
  return sub_20D137924();
}

void sub_20D12E960(_BYTE *a1@<X8>)
{
  *a1 = 1;
}

uint64_t sub_20D12E96C()
{
  return sub_20D137924();
}

uint64_t sub_20D12E978()
{
  uint64_t result;

  result = sub_20D137A74();
  byte_2549A5BD8 = result;
  return result;
}

char *sub_20D12E998()
{
  if (qword_2549A5748 != -1)
    swift_once();
  return &byte_2549A5BD8;
}

char *sub_20D12E9D8@<X0>(char *a1@<X8>)
{
  char *result;

  result = sub_20D12E998();
  *a1 = *result;
  return result;
}

uint64_t sub_20D12EA00()
{
  sub_20D136EB0();
  return sub_20D137924();
}

void sub_20D12EA50(_QWORD *a1@<X8>)
{
  *a1 = 0;
}

uint64_t sub_20D12EA58()
{
  sub_20D124C24(&qword_2549A57B8, type metadata accessor for PHPickerCapabilities);
  return sub_20D137924();
}

uint64_t sub_20D12EAC0()
{
  sub_20D124C24(&qword_2549A57D8, type metadata accessor for _PHPickerPrivateCapabilities);
  return sub_20D137924();
}

uint64_t sub_20D12EB28()
{
  sub_20D124C24(&qword_2549A6030, type metadata accessor for _PHPickerSourceType);
  return sub_20D137924();
}

uint64_t sub_20D12EB90(uint64_t a1)
{
  return sub_20D12ED70(a1, &qword_2549A5EC0, qword_2549A5BE0);
}

void sub_20D12EBAC(uint64_t a1@<X8>)
{
  uint64_t v2;

  v2 = sub_20D12EC70(&qword_2549A5750, &qword_2549A5EC0, (uint64_t)qword_2549A5BE0);
  sub_20D136B48(v2, a1, &qword_2549A5EC0);
}

void sub_20D12EBFC(_QWORD *a1@<X8>)
{
  *a1 = 0;
  a1[1] = 0;
}

uint64_t sub_20D12EC04()
{
  sub_20D136E54();
  return sub_20D137924();
}

uint64_t sub_20D12EC54(uint64_t a1)
{
  return sub_20D12ED70(a1, &qword_2549A5EC0, qword_2549A5BF8);
}

uint64_t sub_20D12EC70(_QWORD *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v5;

  if (*a1 != -1)
    swift_once();
  v5 = __swift_instantiateConcreteTypeFromMangledName(a2);
  return __swift_project_value_buffer(v5, a3);
}

void sub_20D12ECB4(uint64_t a1@<X8>)
{
  uint64_t v2;

  v2 = sub_20D12EC70(&qword_2549A5758, &qword_2549A5EC0, (uint64_t)qword_2549A5BF8);
  sub_20D136B48(v2, a1, &qword_2549A5EC0);
}

uint64_t sub_20D12ED04()
{
  sub_20D136DD8();
  return sub_20D137924();
}

uint64_t sub_20D12ED54(uint64_t a1)
{
  return sub_20D12ED70(a1, &qword_2549A5ED0, qword_2549A5C10);
}

uint64_t sub_20D12ED70(uint64_t a1, uint64_t *a2, uint64_t *a3)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v4 = OUTLINED_FUNCTION_150(a1, a2);
  __swift_allocate_value_buffer(v4, a3);
  v5 = __swift_project_value_buffer(v4, (uint64_t)a3);
  v6 = OUTLINED_FUNCTION_143();
  return OUTLINED_FUNCTION_18_0(v5, 1, 1, v6);
}

void sub_20D12EDC4(uint64_t a1@<X8>)
{
  uint64_t v2;

  v2 = sub_20D12EC70(&qword_2549A5760, &qword_2549A5ED0, (uint64_t)qword_2549A5C10);
  sub_20D136B48(v2, a1, &qword_2549A5ED0);
}

uint64_t sub_20D12EE14()
{
  sub_20D136D5C();
  return sub_20D137924();
}

uint64_t sub_20D12EE64()
{
  char v0;
  unsigned __int8 v1;
  unsigned __int8 v2;
  unsigned __int8 v3;
  char v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v23;

  v0 = sub_20D137A50();
  v1 = sub_20D137A5C();
  v2 = sub_20D137A68();
  v3 = sub_20D137A80();
  sub_20D137A74();
  v4 = sub_20D137A74();
  v5 = MEMORY[0x24BEE4AF8];
  if (v4 == v0)
  {
    v23 = MEMORY[0x24BEE4AF8];
    sub_20D130F90(0, 1, 1);
    v5 = v23;
    v7 = *(_QWORD *)(v23 + 16);
    v6 = *(_QWORD *)(v23 + 24);
    if (v7 >= v6 >> 1)
    {
      sub_20D130F90((char *)(v6 > 1), v7 + 1, 1);
      v5 = v23;
    }
    *(_QWORD *)(v5 + 16) = v7 + 1;
    v8 = v5 + 16 * v7;
    *(_BYTE *)(v8 + 32) = v0;
    *(_QWORD *)(v8 + 40) = 1;
  }
  sub_20D137A74();
  if (sub_20D137A74() == v1)
  {
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      sub_20D130F90(0, *(_QWORD *)(v5 + 16) + 1, 1);
    v10 = *(_QWORD *)(v5 + 16);
    v9 = *(_QWORD *)(v5 + 24);
    if (v10 >= v9 >> 1)
      sub_20D130F90((char *)(v9 > 1), v10 + 1, 1);
    *(_QWORD *)(v5 + 16) = v10 + 1;
    v11 = v5 + 16 * v10;
    *(_BYTE *)(v11 + 32) = v1;
    *(_QWORD *)(v11 + 40) = 4;
  }
  sub_20D137A74();
  if (sub_20D137A74() == v2)
  {
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      sub_20D130F90(0, *(_QWORD *)(v5 + 16) + 1, 1);
    v13 = *(_QWORD *)(v5 + 16);
    v12 = *(_QWORD *)(v5 + 24);
    if (v13 >= v12 >> 1)
      sub_20D130F90((char *)(v12 > 1), v13 + 1, 1);
    *(_QWORD *)(v5 + 16) = v13 + 1;
    v14 = v5 + 16 * v13;
    *(_BYTE *)(v14 + 32) = v2;
    *(_QWORD *)(v14 + 40) = 2;
  }
  sub_20D137A74();
  if (sub_20D137A74() == v3)
  {
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      sub_20D130F90(0, *(_QWORD *)(v5 + 16) + 1, 1);
    v16 = *(_QWORD *)(v5 + 16);
    v15 = *(_QWORD *)(v5 + 24);
    v17 = v16 + 1;
    if (v16 >= v15 >> 1)
      sub_20D130F90((char *)(v15 > 1), v16 + 1, 1);
    *(_QWORD *)(v5 + 16) = v17;
    v18 = v5 + 16 * v16;
    *(_BYTE *)(v18 + 32) = v3;
    *(_QWORD *)(v18 + 40) = 8;
  }
  else
  {
    v17 = *(_QWORD *)(v5 + 16);
    if (!v17)
    {
      v19 = 0;
      goto LABEL_28;
    }
  }
  v19 = 0;
  v20 = 40;
  do
  {
    v21 = *(_QWORD *)(v5 + v20);
    if ((v21 & ~v19) == 0)
      v21 = 0;
    v19 |= v21;
    v20 += 16;
    --v17;
  }
  while (v17);
LABEL_28:
  swift_release();
  return v19;
}

uint64_t sub_20D12F12C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  char v4;
  uint64_t v5;
  uint64_t result;
  uint64_t v7;
  uint64_t v8;
  char v9;
  __int128 v10;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549A5FE8);
  MEMORY[0x212B9D0B0](&v7, v2);
  v3 = v8;
  if (v8)
  {
    v4 = v9;
    v5 = v7;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2549A5F58);
    result = swift_allocObject();
    *(_OWORD *)(result + 16) = xmmword_20D1384F0;
    *(_QWORD *)(result + 32) = v5;
    *(_QWORD *)(result + 40) = v3;
    *(_BYTE *)(result + 48) = v4 & 1;
    *(_OWORD *)(result + 56) = v10;
  }
  else
  {
    result = MEMORY[0x24BEE4AF8];
  }
  *a1 = result;
  return result;
}

uint64_t sub_20D12F1E0(uint64_t a1)
{
  void *v1;
  id v2;

  if (*(_QWORD *)(*(_QWORD *)a1 + 16))
  {
    v1 = *(void **)(*(_QWORD *)a1 + 64);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v2 = v1;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_2549A5FE8);
  return sub_20D137B64();
}

uint64_t sub_20D12F294()
{
  uint64_t v0;
  uint64_t v1;
  char *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v6;

  v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549A5EC0);
  MEMORY[0x24BDAC7A8](v0);
  v2 = (char *)&v6 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (sub_20D137C30() == 1)
  {
    sub_20D137C18();
    v3 = sub_20D137D80();
    if (__swift_getEnumTagSinglePayload((uint64_t)v2, 1, v3) != 1)
    {
      v4 = sub_20D137D74();
      (*(void (**)(char *, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(v2, v3);
      return v4;
    }
    sub_20D136B24((uint64_t)v2, &qword_2549A5EC0);
  }
  return sub_20D137CB4();
}

uint64_t sub_20D12F368()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t (*v4)(_QWORD);
  uint64_t v5;
  uint64_t v7;

  v1 = type metadata accessor for PhotosPickerViewController(0);
  MEMORY[0x24BDAC7A8](v1);
  v3 = (char *)&v7 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_20D127C64(v0, (uint64_t)v3, v4);
  type metadata accessor for PhotosPickerViewController.Coordinator(0);
  v5 = swift_allocObject();
  sub_20D136668((uint64_t)v3, v5+ OBJC_IVAR____TtCV17_PhotosUI_SwiftUIP33_017389DAE44781501AADB4871649B48726PhotosPickerViewController11Coordinator_parent);
  return v5;
}

uint64_t sub_20D12F400(uint64_t a1)
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
  char *v12;
  int *v13;
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
  uint64_t *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v33;
  void (*v34)(char *, uint64_t, uint64_t);
  char *v35;
  char *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  __int128 v40;
  uint64_t v41;

  v2 = v1;
  v38 = a1;
  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549A5ED0);
  MEMORY[0x24BDAC7A8](v3);
  v35 = (char *)&v33 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549A5EC0);
  MEMORY[0x24BDAC7A8](v5);
  v6 = sub_20D137BDC();
  MEMORY[0x24BDAC7A8](v6);
  v7 = sub_20D137D5C();
  v37 = *(_QWORD *)(v7 - 8);
  v8 = v37;
  v9 = MEMORY[0x24BDAC7A8](v7);
  v36 = (char *)&v33 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v9);
  v12 = (char *)&v33 - v11;
  v13 = (int *)type metadata accessor for PhotosPickerViewController(0);
  v14 = v2 + v13[15];
  v34 = *(void (**)(char *, uint64_t, uint64_t))(v8 + 16);
  v34(v12, v14, v7);
  sub_20D12C05C();
  sub_20D137CE4();
  v15 = v2 + v13[5];
  v16 = *(_QWORD *)v15;
  LOBYTE(v8) = *(_BYTE *)(v15 + 8);
  sub_20D134E10(*(_QWORD *)v15, v8);
  sub_20D12C174(v16, v8);
  sub_20D135090(v16, v8);
  v17 = sub_20D12EE64();
  MEMORY[0x212B9D200](v17);
  v18 = v2 + v13[6];
  v19 = *(_QWORD *)v18;
  LOBYTE(v8) = *(_BYTE *)(v18 + 8);
  sub_20D134E10(*(_QWORD *)v18, v8);
  sub_20D12C2FC();
  v21 = v20;
  sub_20D135090(v19, v8);
  MEMORY[0x212B9D1DC](v21);
  v22 = v2 + v13[7];
  v23 = *(_QWORD *)v22;
  LOBYTE(v8) = *(_BYTE *)(v22 + 8);
  sub_20D134E10(*(_QWORD *)v22, v8);
  sub_20D12C2FC();
  sub_20D135090(v23, v8);
  sub_20D137CCC();
  v24 = v2 + v13[8];
  v25 = *(_QWORD *)v24;
  v26 = *(_QWORD *)(v24 + 8);
  LOBYTE(v21) = *(_BYTE *)(v24 + 16);
  sub_20D134E1C(*(_QWORD *)v24, v26, v21);
  sub_20D12C424(v25, v26, v21);
  sub_20D13509C(v25, v26, v21);
  sub_20D137C78();
  v27 = v2 + v13[9];
  v28 = *(_QWORD *)v27;
  LOBYTE(v26) = *(_BYTE *)(v27 + 8);
  sub_20D134E10(*(_QWORD *)v27, v26);
  sub_20D12C5D8(v28, v26);
  sub_20D135090(v28, v26);
  sub_20D137C3C();
  sub_20D12C76C();
  sub_20D137C24();
  sub_20D12C76C();
  sub_20D137C0C();
  sub_20D12C76C();
  sub_20D137C6C();
  v29 = (uint64_t *)(v2 + v13[14]);
  v39 = *v29;
  v40 = *(_OWORD *)(v29 + 1);
  v30 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549A5850);
  MEMORY[0x212B9D0B0](&v41, v30);
  sub_20D12FAD8(v41);
  swift_bridgeObjectRelease();
  sub_20D137CC0();
  sub_20D13670C(0, &qword_2549A5F38);
  v34(v36, (uint64_t)v12, v7);
  v31 = sub_20D137EE8();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2549A5F40);
  sub_20D137A2C();
  sub_20D124C24(&qword_2549A5F48, (void (*)(uint64_t))type metadata accessor for PhotosPickerViewController.Coordinator);
  sub_20D137EF4();
  (*(void (**)(char *, uint64_t))(v37 + 8))(v12, v7);
  return v31;
}

uint64_t sub_20D12F940(void *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _BYTE *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char v11;
  uint64_t *v12;
  uint64_t v13;
  void *v14;
  _BYTE v16[16];
  uint64_t v17;
  __int128 v18;
  uint64_t v19;

  v2 = v1;
  v4 = sub_20D137D14();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = &v16[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  sub_20D137D08();
  v8 = type metadata accessor for PhotosPickerViewController(0);
  sub_20D137C54();
  sub_20D137CF0();
  v9 = v1 + *(int *)(v8 + 20);
  v10 = *(_QWORD *)v9;
  v11 = *(_BYTE *)(v9 + 8);
  sub_20D134E10(*(_QWORD *)v9, v11);
  sub_20D12C174(v10, v11);
  sub_20D135090(v10, v11);
  sub_20D12EE64();
  sub_20D137CFC();
  sub_20D137ED0();
  v12 = (uint64_t *)(v2 + *(int *)(v8 + 56));
  v17 = *v12;
  v18 = *(_OWORD *)(v12 + 1);
  v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549A5850);
  MEMORY[0x212B9D0B0](&v19, v13);
  sub_20D12FAD8(v19);
  swift_bridgeObjectRelease();
  v14 = (void *)sub_20D137E04();
  swift_bridgeObjectRelease();
  objc_msgSend(a1, sel__updateSelectedAssetsWithIdentifiers_, v14);

  return (*(uint64_t (**)(_BYTE *, uint64_t))(v5 + 8))(v7, v4);
}

uint64_t sub_20D12FAD8(uint64_t a1)
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
    sub_20D130FAC(0, v1, 0);
    v2 = v11;
    v4 = (uint64_t *)(a1 + 40);
    do
    {
      v6 = *(v4 - 1);
      v5 = *v4;
      v8 = *(_QWORD *)(v11 + 16);
      v7 = *(_QWORD *)(v11 + 24);
      swift_bridgeObjectRetain();
      if (v8 >= v7 >> 1)
        sub_20D130FAC((char *)(v7 > 1), v8 + 1, 1);
      v4 += 5;
      *(_QWORD *)(v11 + 16) = v8 + 1;
      v9 = v11 + 16 * v8;
      *(_QWORD *)(v9 + 32) = v6;
      *(_QWORD *)(v9 + 40) = v5;
      --v1;
    }
    while (v1);
  }
  return v2;
}

uint64_t sub_20D12FBAC(uint64_t a1, uint64_t a2, char a3)
{
  int64_t v4;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char v13;
  __int128 v14;
  unint64_t v15;
  unint64_t v16;
  uint64_t v17;
  __int128 v19;
  int v20;
  uint64_t v21;
  uint64_t v22[2];
  char v23;
  __int128 v24;
  uint64_t v25;

  v4 = *(_QWORD *)(a1 + 16);
  if (v4)
  {
    v25 = MEMORY[0x24BEE4AF8];
    sub_20D130FE4(0, v4, 0);
    v7 = v25;
    v8 = *(_QWORD *)(sub_20D137C00() - 8);
    v9 = a1 + ((*(unsigned __int8 *)(v8 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80));
    v21 = *(_QWORD *)(v8 + 72);
    v20 = a3 & 1;
    do
    {
      v10 = a2;
      sub_20D13036C(v9, a2, v20, v22);
      v11 = v22[0];
      v12 = v22[1];
      v13 = v23;
      v14 = v24;
      v25 = v7;
      v16 = *(_QWORD *)(v7 + 16);
      v15 = *(_QWORD *)(v7 + 24);
      if (v16 >= v15 >> 1)
      {
        v19 = v24;
        sub_20D130FE4((char *)(v15 > 1), v16 + 1, 1);
        v14 = v19;
        v7 = v25;
      }
      *(_QWORD *)(v7 + 16) = v16 + 1;
      v17 = v7 + 40 * v16;
      *(_QWORD *)(v17 + 32) = v11;
      *(_QWORD *)(v17 + 40) = v12;
      *(_BYTE *)(v17 + 48) = v13;
      *(_OWORD *)(v17 + 56) = v14;
      v9 += v21;
      --v4;
      a2 = v10;
    }
    while (v4);
    swift_bridgeObjectRelease();
  }
  else
  {
    swift_bridgeObjectRelease();
    return MEMORY[0x24BEE4AF8];
  }
  return v7;
}

uint64_t sub_20D12FD10(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v4;
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
  uint64_t *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  _QWORD *v22;
  void (*v23)(char *, _QWORD, uint64_t);
  void (*v24)(char *, uint64_t);
  uint64_t v25;
  void (*v26)(char *, char *, uint64_t);
  char *v27;
  char *v28;
  uint64_t v29;
  void (*v30)(char *, uint64_t);
  uint64_t v31;
  char v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  char v36;
  uint64_t v37;
  uint64_t v38;
  char v39;
  char v40;
  uint64_t v41;
  _QWORD *v42;
  char v43;
  char v44;
  uint64_t *v45;
  uint64_t v46;
  uint64_t v47;
  _QWORD v49[2];
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  _QWORD *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  char *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;

  v4 = sub_20D137D38();
  v5 = *(_QWORD *)(v4 - 8);
  v6 = MEMORY[0x24BDAC7A8](v4);
  v8 = (char *)v49 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v6);
  v10 = (char *)v49 - v9;
  v58 = sub_20D137D5C();
  v11 = *(_QWORD *)(v58 - 8);
  v12 = MEMORY[0x24BDAC7A8](v58);
  v14 = (char *)v49 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v12);
  v16 = (char *)v49 - v15;
  v17 = v2
      + OBJC_IVAR____TtCV17_PhotosUI_SwiftUIP33_017389DAE44781501AADB4871649B48726PhotosPickerViewController11Coordinator_parent;
  v56 = type metadata accessor for PhotosPickerViewController(0);
  v57 = v17;
  v18 = (uint64_t *)(v17 + *(int *)(v56 + 56));
  v19 = *v18;
  v20 = v18[1];
  v21 = v18[2];
  v51 = v20;
  v52 = v19;
  v60 = v19;
  v61 = v20;
  v50 = v21;
  v62 = v21;
  v49[1] = __swift_instantiateConcreteTypeFromMangledName(&qword_2549A5850);
  MEMORY[0x212B9D0B0](&v63);
  v55 = v63;
  sub_20D137EDC();
  v22 = (_QWORD *)sub_20D12F294();
  v53 = a2;
  v54 = v22;
  v59 = sub_20D13010C(a2);
  v49[0] = 0;
  sub_20D137D44();
  v23 = *(void (**)(char *, _QWORD, uint64_t))(v5 + 104);
  v23(v8, *MEMORY[0x24BDE3AA0], v4);
  LOBYTE(v17) = _s015_PhotosUI_SwiftB00A23PickerSelectionBehaviorV2eeoiySbAC_ACtFZ_0();
  v24 = *(void (**)(char *, uint64_t))(v5 + 8);
  v24(v8, v4);
  v24(v10, v4);
  v25 = v11;
  v26 = *(void (**)(char *, char *, uint64_t))(v11 + 16);
  v27 = v16;
  v28 = v16;
  v29 = v58;
  v26(v14, v28, v58);
  if ((v17 & 1) != 0)
  {
    v30 = *(void (**)(char *, uint64_t))(v25 + 8);
    v30(v14, v29);
    v31 = v29;
LABEL_4:
    v34 = v56;
    v33 = v57;
    v35 = v55;
    swift_bridgeObjectRelease();
    v36 = 1;
    goto LABEL_5;
  }
  sub_20D137D44();
  v23(v8, *MEMORY[0x24BDE3AA8], v4);
  v32 = _s015_PhotosUI_SwiftB00A23PickerSelectionBehaviorV2eeoiySbAC_ACtFZ_0();
  v24(v8, v4);
  v24(v10, v4);
  v30 = *(void (**)(char *, uint64_t))(v25 + 8);
  v30(v14, v29);
  v31 = v29;
  if ((v32 & 1) != 0)
    goto LABEL_4;
  if (!v54[2] && !*(_QWORD *)(v53 + 16))
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    v34 = v56;
    v33 = v57;
    goto LABEL_13;
  }
  v44 = sub_20D128150(v59, v54);
  swift_bridgeObjectRelease();
  v34 = v56;
  v33 = v57;
  v35 = v55;
  if ((v44 & 1) == 0)
  {
    v36 = 0;
LABEL_5:
    v37 = swift_bridgeObjectRetain();
    v38 = sub_20D130228(v37);
    v40 = v39;
    swift_bridgeObjectRetain();
    v41 = sub_20D12FBAC(v53, v38, v40 & 1);
    swift_bridgeObjectRelease();
    v60 = v52;
    v61 = v51;
    v62 = v50;
    v63 = v41;
    sub_20D137B64();
    if ((v36 & 1) != 0)
    {
      v42 = (_QWORD *)sub_20D12FAD8(v35);
      swift_bridgeObjectRelease();
      v43 = sub_20D128150(v42, v59);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if ((v43 & 1) == 0)
        return ((uint64_t (*)(char *, uint64_t))v30)(v27, v31);
      goto LABEL_13;
    }
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
LABEL_13:
  v45 = (uint64_t *)(v33 + *(int *)(v34 + 52));
  v46 = *v45;
  v47 = v45[1];
  LOBYTE(v45) = *((_BYTE *)v45 + 16);
  v60 = v46;
  v61 = v47;
  LOBYTE(v62) = (_BYTE)v45;
  LOBYTE(v63) = 0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2549A5810);
  sub_20D137B64();
  return ((uint64_t (*)(char *, uint64_t))v30)(v27, v31);
}

char *sub_20D13010C(uint64_t a1)
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
  unint64_t v11;
  unint64_t v12;
  char *v13;

  v1 = *(_QWORD *)(a1 + 16);
  if (!v1)
    return (char *)MEMORY[0x24BEE4AF8];
  v3 = *(_QWORD *)(sub_20D137C00() - 8);
  v4 = a1 + ((*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80));
  v5 = *(_QWORD *)(v3 + 72);
  swift_bridgeObjectRetain();
  v6 = (char *)MEMORY[0x24BEE4AF8];
  do
  {
    v7 = sub_20D137BF4();
    if (v8)
    {
      v9 = v7;
      v10 = v8;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        v6 = sub_20D13086C(0, *((_QWORD *)v6 + 2) + 1, 1, v6);
      v12 = *((_QWORD *)v6 + 2);
      v11 = *((_QWORD *)v6 + 3);
      if (v12 >= v11 >> 1)
        v6 = sub_20D13086C((char *)(v11 > 1), v12 + 1, 1, v6);
      *((_QWORD *)v6 + 2) = v12 + 1;
      v13 = &v6[16 * v12];
      *((_QWORD *)v13 + 4) = v9;
      *((_QWORD *)v13 + 5) = v10;
    }
    v4 += v5;
    --v1;
  }
  while (v1);
  swift_bridgeObjectRelease();
  return v6;
}

uint64_t sub_20D130228(uint64_t a1)
{
  int64_t v2;
  uint64_t v3;
  _OWORD *v4;
  uint64_t v5;
  uint64_t v6;
  char v7;
  unint64_t v8;
  unint64_t v9;
  id v10;
  unint64_t v11;
  __int128 v13;
  uint64_t v14;

  v2 = *(_QWORD *)(a1 + 16);
  if (v2)
  {
    v14 = MEMORY[0x24BEE4AF8];
    sub_20D130FC8(0, v2, 0);
    v3 = v14;
    v4 = (_OWORD *)(a1 + 56);
    do
    {
      v6 = *((_QWORD *)v4 - 3);
      v5 = *((_QWORD *)v4 - 2);
      v7 = *((_BYTE *)v4 - 8);
      v13 = *v4;
      v8 = *(_QWORD *)(v14 + 16);
      v9 = *(_QWORD *)(v14 + 24);
      swift_bridgeObjectRetain_n();
      swift_bridgeObjectRetain();
      v10 = *((id *)&v13 + 1);
      if (v8 >= v9 >> 1)
        sub_20D130FC8((_QWORD *)(v9 > 1), v8 + 1, 1);
      *(_QWORD *)(v14 + 16) = v8 + 1;
      v11 = v14 + 56 * v8;
      *(_QWORD *)(v11 + 32) = v6;
      *(_QWORD *)(v11 + 40) = v5;
      *(_QWORD *)(v11 + 48) = v6;
      *(_QWORD *)(v11 + 56) = v5;
      *(_BYTE *)(v11 + 64) = v7;
      *(_OWORD *)(v11 + 72) = v13;
      v4 = (_OWORD *)((char *)v4 + 40);
      --v2;
    }
    while (v2);
    swift_bridgeObjectRelease();
  }
  else
  {
    swift_bridgeObjectRelease();
    v3 = MEMORY[0x24BEE4AF8];
  }
  return sub_20D130650(v3);
}

void sub_20D13036C(uint64_t a1@<X0>, uint64_t a2@<X1>, int a3@<W2>, uint64_t *a4@<X8>)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  char *v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  uint64_t v19;
  void *v20;
  char v21;
  void (*v22)(char *, char *, uint64_t);
  uint64_t v23;
  unint64_t v24;
  unint64_t v25;
  unint64_t v26;
  uint64_t v27;
  uint64_t v28;
  char v29;
  uint64_t v30;
  uint64_t v31;
  id v32;
  uint64_t *v33;
  unint64_t v34;
  char v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  uint64_t v39;
  _QWORD v40[2];
  uint64_t *v41;
  int v42;
  uint64_t v43;
  char *v44;
  uint64_t v45;
  uint64_t v46;

  v42 = a3;
  v41 = a4;
  v6 = sub_20D1378D0();
  v7 = *(_QWORD *)(v6 - 8);
  v8 = MEMORY[0x24BDAC7A8](v6);
  v10 = (char *)v40 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v8);
  v12 = (char *)v40 - v11;
  v13 = (void *)sub_20D137BE8();
  v14 = objc_msgSend(v13, sel_registeredContentTypes);

  v15 = sub_20D137E10();
  v16 = MEMORY[0x24BEE4AF8];
  v45 = *(_QWORD *)(v15 + 16);
  v46 = MEMORY[0x24BEE4AF8];
  if (v45)
  {
    v40[0] = a2;
    v40[1] = a1;
    v17 = 0;
    v43 = v15;
    v44 = v10;
    while (v17 < *(_QWORD *)(v15 + 16))
    {
      v18 = (*(unsigned __int8 *)(v7 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
      v19 = *(_QWORD *)(v7 + 72);
      (*(void (**)(char *, unint64_t, uint64_t))(v7 + 16))(v12, v15 + v18 + v19 * v17, v6);
      v20 = (void *)sub_20D1378A0();
      v21 = PFIsLivePhotoBundleType();

      if ((v21 & 1) != 0)
      {
        (*(void (**)(char *, uint64_t))(v7 + 8))(v12, v6);
      }
      else
      {
        v22 = *(void (**)(char *, char *, uint64_t))(v7 + 32);
        v22(v10, v12, v6);
        v23 = v46;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          sub_20D131000(0, *(_QWORD *)(v23 + 16) + 1, 1);
          v23 = v46;
        }
        v25 = *(_QWORD *)(v23 + 16);
        v24 = *(_QWORD *)(v23 + 24);
        if (v25 >= v24 >> 1)
        {
          sub_20D131000(v24 > 1, v25 + 1, 1);
          v23 = v46;
        }
        *(_QWORD *)(v23 + 16) = v25 + 1;
        v26 = v23 + v18 + v25 * v19;
        v10 = v44;
        v22((char *)v26, v44, v6);
        v46 = v23;
        v15 = v43;
      }
      if (v45 == ++v17)
      {
        v16 = v46;
        a2 = v40[0];
        goto LABEL_13;
      }
    }
    __break(1u);
    goto LABEL_22;
  }
LABEL_13:
  swift_bridgeObjectRelease();
  v27 = sub_20D137BF4();
  v29 = v42;
  if (v28)
  {
    v30 = v27;
    v31 = v28;
    if (!*(_QWORD *)(v16 + 16) && *(_QWORD *)(a2 + 16))
    {
      swift_bridgeObjectRetain();
      v34 = sub_20D130A08(v30, v31);
      if ((v35 & 1) != 0)
      {
        v36 = *(_QWORD *)(a2 + 56) + 40 * v34;
        v30 = *(_QWORD *)v36;
        v37 = *(_QWORD *)(v36 + 8);
        v29 = *(_BYTE *)(v36 + 16);
        v39 = *(_QWORD *)(v36 + 24);
        v38 = *(void **)(v36 + 32);
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        v32 = v38;
        swift_release();
        swift_bridgeObjectRelease_n();
        v31 = v37;
        v16 = v39;
        goto LABEL_16;
      }
      swift_bridgeObjectRelease();
    }
    v32 = (id)sub_20D137BE8();
LABEL_16:
    v33 = v41;
    *v41 = v30;
    v33[1] = v31;
    *((_BYTE *)v33 + 16) = v29 & 1;
    v33[3] = v16;
    v33[4] = (uint64_t)v32;
    return;
  }
LABEL_22:
  __break(1u);
}

uint64_t sub_20D130650(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;

  if (*(_QWORD *)(a1 + 16))
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_2549A5F60);
    v1 = sub_20D137FA8();
  }
  else
  {
    v1 = MEMORY[0x24BEE4B00];
  }
  v4 = v1;
  v2 = swift_bridgeObjectRetain();
  sub_20D13158C(v2, 1, &v4);
  swift_bridgeObjectRelease();
  return v4;
}

uint64_t sub_20D1306F8()
{
  uint64_t v0;

  sub_20D131DAC(v0+ OBJC_IVAR____TtCV17_PhotosUI_SwiftUIP33_017389DAE44781501AADB4871649B48726PhotosPickerViewController11Coordinator_parent, type metadata accessor for PhotosPickerViewController);
  return swift_deallocClassInstance();
}

uint64_t sub_20D13073C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  result = sub_20D12F368();
  *a1 = result;
  return result;
}

uint64_t sub_20D130760()
{
  sub_20D124C24(&qword_2549A5F18, (void (*)(uint64_t))type metadata accessor for PhotosPickerViewController);
  return sub_20D137A14();
}

uint64_t sub_20D1307C8()
{
  sub_20D124C24(&qword_2549A5F18, (void (*)(uint64_t))type metadata accessor for PhotosPickerViewController);
  return sub_20D1379E4();
}

void sub_20D130830()
{
  sub_20D124C24(&qword_2549A5F18, (void (*)(uint64_t))type metadata accessor for PhotosPickerViewController);
  sub_20D137A08();
  __break(1u);
}

char *sub_20D13086C(char *result, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_2549A5F20);
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
    swift_arrayInitWithCopy();
  }
  swift_bridgeObjectRelease();
  return v10;
}

uint64_t sub_20D130968(unint64_t a1, uint64_t a2, unint64_t a3)
{
  uint64_t result;

  if (a3 < a1 || (result = sub_20D1378D0(), a1 + *(_QWORD *)(*(_QWORD *)(result - 8) + 72) * a2 <= a3))
  {
    sub_20D1378D0();
    return swift_arrayInitWithTakeFrontToBack();
  }
  else if (a3 != a1)
  {
    return swift_arrayInitWithTakeBackToFront();
  }
  return result;
}

unint64_t sub_20D130A08(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  sub_20D137FD8();
  sub_20D137DD4();
  v4 = sub_20D137FFC();
  return sub_20D130A6C(a1, a2, v4);
}

unint64_t sub_20D130A6C(uint64_t a1, uint64_t a2, uint64_t a3)
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
    if (!v11 && (sub_20D137FB4() & 1) == 0)
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
      while (!v14 && (sub_20D137FB4() & 1) == 0);
    }
  }
  return v6;
}

unint64_t sub_20D130B4C(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v12[3];
  uint64_t ObjectType;

  v6 = sub_20D130C1C(v12, 0, 0, 1, a1, a2);
  v7 = v12[0];
  if (v6)
  {
    v8 = v6;
    ObjectType = swift_getObjectType();
    v12[0] = v8;
    v9 = *a3;
    if (*a3)
    {
      sub_20D1366D0((uint64_t)v12, *a3);
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
      sub_20D1366D0((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v12);
  return v7;
}

unint64_t sub_20D130C1C(unint64_t *a1, void *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
    result = sub_20D130D18(a5, a6);
    *a1 = v11;
    return result;
  }
  if ((a5 & 0x1000000000000000) != 0)
  {
    result = (a6 & 0xFFFFFFFFFFFFFFFLL) + 32;
  }
  else
  {
    result = sub_20D137F60();
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

uint64_t sub_20D130D18(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v2 = sub_20D130DAC(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v2 = (uint64_t)sub_20D130EA8(0, *(_QWORD *)(v2 + 16) + 1, 1, (char *)v2);
  v4 = *(_QWORD *)(v2 + 16);
  v3 = *(_QWORD *)(v2 + 24);
  if (v4 >= v3 >> 1)
    v2 = (uint64_t)sub_20D130EA8((char *)(v3 > 1), v4 + 1, 1, (char *)v2);
  *(_QWORD *)(v2 + 16) = v4 + 1;
  *(_BYTE *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_20D130DAC(uint64_t a1, unint64_t a2)
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
      v3 = sub_20D130E44(v2, 0);
      result = sub_20D137F54();
      if ((v5 & 1) != 0)
        break;
      if (result == v2)
        return (uint64_t)v3;
      __break(1u);
LABEL_9:
      v2 = sub_20D137DEC();
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

_QWORD *sub_20D130E44(uint64_t a1, uint64_t a2)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_2549A5F30);
  v4 = (_QWORD *)swift_allocObject();
  v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

char *sub_20D130EA8(char *result, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_2549A5F30);
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
    if (v10 != a4 || &v13[v8] <= v12)
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

char *sub_20D130F90(char *a1, int64_t a2, char a3)
{
  char **v3;
  char *result;

  result = sub_20D13101C(a1, a2, a3, *v3);
  *v3 = result;
  return result;
}

char *sub_20D130FAC(char *a1, int64_t a2, char a3)
{
  char **v3;
  char *result;

  result = sub_20D131110(a1, a2, a3, *v3);
  *v3 = result;
  return result;
}

_QWORD *sub_20D130FC8(_QWORD *a1, int64_t a2, char a3)
{
  _QWORD **v3;
  _QWORD *result;

  result = sub_20D13120C(a1, a2, a3, *v3);
  *v3 = result;
  return result;
}

char *sub_20D130FE4(char *a1, int64_t a2, char a3)
{
  char **v3;
  char *result;

  result = sub_20D131330(a1, a2, a3, *v3);
  *v3 = result;
  return result;
}

size_t sub_20D131000(size_t a1, int64_t a2, char a3)
{
  uint64_t *v3;
  size_t result;

  result = sub_20D13143C(a1, a2, a3, *v3);
  *v3 = result;
  return result;
}

char *sub_20D13101C(char *result, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_2549A5F28);
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
  swift_release();
  return v10;
}

char *sub_20D131110(char *result, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_2549A5F20);
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
    swift_arrayInitWithCopy();
  }
  swift_release();
  return v10;
}

_QWORD *sub_20D13120C(_QWORD *result, int64_t a2, char a3, _QWORD *a4)
{
  char v5;
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  size_t v11;

  v5 = (char)result;
  if ((a3 & 1) != 0)
  {
    v6 = a4[3];
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
  v8 = a4[2];
  if (v7 <= v8)
    v9 = a4[2];
  else
    v9 = v7;
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_2549A5F78);
    v10 = (_QWORD *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    v10[2] = v8;
    v10[3] = 2 * ((uint64_t)(v11 - 32) / 56);
  }
  else
  {
    v10 = (_QWORD *)MEMORY[0x24BEE4AF8];
  }
  if ((v5 & 1) != 0)
  {
    if (v10 != a4 || &a4[7 * v8 + 4] <= v10 + 4)
      memmove(v10 + 4, a4 + 4, 56 * v8);
    a4[2] = 0;
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_2549A5F80);
    swift_arrayInitWithCopy();
  }
  swift_release();
  return v10;
}

char *sub_20D131330(char *result, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_2549A5F58);
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
  v13 = a4 + 32;
  if ((v5 & 1) != 0)
  {
    if (v10 != a4 || &v13[40 * v8] <= v12)
      memmove(v12, v13, 40 * v8);
    *((_QWORD *)a4 + 2) = 0;
  }
  else
  {
    swift_arrayInitWithCopy();
  }
  swift_release();
  return v10;
}

size_t sub_20D13143C(size_t result, int64_t a2, char a3, uint64_t a4)
{
  char v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  _QWORD *v13;
  uint64_t v15;
  uint64_t v16;

  v5 = result;
  if ((a3 & 1) != 0)
  {
    v6 = *(_QWORD *)(a4 + 24);
    v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
LABEL_25:
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
  if (!v9)
  {
    v13 = (_QWORD *)MEMORY[0x24BEE4AF8];
    goto LABEL_19;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_2549A5F50);
  v10 = *(_QWORD *)(sub_20D1378D0() - 8);
  v11 = *(_QWORD *)(v10 + 72);
  v12 = (*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  v13 = (_QWORD *)swift_allocObject();
  result = _swift_stdlib_malloc_size(v13);
  if (!v11)
  {
    __break(1u);
LABEL_24:
    __break(1u);
    goto LABEL_25;
  }
  if (result - v12 == 0x8000000000000000 && v11 == -1)
    goto LABEL_24;
  v13[2] = v8;
  v13[3] = 2 * ((uint64_t)(result - v12) / v11);
LABEL_19:
  v15 = *(unsigned __int8 *)(*(_QWORD *)(sub_20D1378D0() - 8) + 80);
  v16 = (v15 + 32) & ~v15;
  if ((v5 & 1) != 0)
  {
    sub_20D130968(a4 + v16, v8, (unint64_t)v13 + v16);
    *(_QWORD *)(a4 + 16) = 0;
  }
  else
  {
    swift_arrayInitWithCopy();
  }
  swift_release();
  return (size_t)v13;
}

void sub_20D13158C(uint64_t a1, char a2, _QWORD *a3)
{
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char v11;
  id v12;
  char v13;
  _QWORD *v14;
  char v15;
  unint64_t v16;
  uint64_t v17;
  _BOOL8 v18;
  uint64_t v19;
  char v20;
  unint64_t v21;
  char v22;
  _QWORD *v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t v26;
  BOOL v27;
  uint64_t v28;
  void *v29;
  id v30;
  void *v31;
  uint64_t v33;
  unint64_t v34;
  __int128 v36;

  v4 = *(_QWORD *)(a1 + 16);
  swift_bridgeObjectRetain();
  if (v4)
  {
    v5 = 0;
    v6 = a1 + 40;
    while (1)
    {
      if (v5 >= *(_QWORD *)(a1 + 16))
      {
        __break(1u);
LABEL_18:
        __break(1u);
LABEL_19:
        __break(1u);
LABEL_20:
        sub_20D137FCC();
        __break(1u);
        goto LABEL_21;
      }
      v8 = *(_QWORD *)(v6 - 8);
      v7 = *(_QWORD *)v6;
      v9 = *(_QWORD *)(v6 + 8);
      v10 = *(_QWORD *)(v6 + 16);
      v11 = *(_BYTE *)(v6 + 24);
      v36 = *(_OWORD *)(v6 + 32);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      v12 = *((id *)&v36 + 1);
      if (!v7)
        goto LABEL_14;
      v33 = v10;
      v34 = v5;
      v13 = a2;
      v31 = v12;
      v14 = (_QWORD *)*a3;
      v16 = sub_20D130A08(v8, v7);
      v17 = v14[2];
      v18 = (v15 & 1) == 0;
      v19 = v17 + v18;
      if (__OFADD__(v17, v18))
        goto LABEL_18;
      v20 = v15;
      if (v14[3] >= v19)
      {
        if ((v13 & 1) == 0)
        {
          __swift_instantiateConcreteTypeFromMangledName(&qword_2549A5F68);
          sub_20D137F78();
        }
      }
      else
      {
        sub_20D1318D8(v19, v13 & 1);
        v21 = sub_20D130A08(v8, v7);
        if ((v20 & 1) != (v22 & 1))
          goto LABEL_20;
        v16 = v21;
      }
      if ((v20 & 1) != 0)
        break;
      v23 = (_QWORD *)*a3;
      *(_QWORD *)(*a3 + 8 * (v16 >> 6) + 64) |= 1 << v16;
      v24 = (uint64_t *)(v23[6] + 16 * v16);
      *v24 = v8;
      v24[1] = v7;
      v25 = v23[7] + 40 * v16;
      *(_QWORD *)v25 = v9;
      *(_QWORD *)(v25 + 8) = v33;
      *(_BYTE *)(v25 + 16) = v11;
      *(_OWORD *)(v25 + 24) = v36;
      v26 = v23[2];
      v27 = __OFADD__(v26, 1);
      v28 = v26 + 1;
      if (v27)
        goto LABEL_19;
      v5 = v34 + 1;
      v23[2] = v28;
      v6 += 56;
      a2 = 1;
      if (v4 == v34 + 1)
        goto LABEL_14;
    }
    v29 = (void *)swift_allocError();
    swift_willThrow();
    v30 = v29;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2549A5F70);
    if ((swift_dynamicCast() & 1) == 0)
    {
      swift_bridgeObjectRelease();

      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease_n();

      return;
    }
LABEL_21:
    sub_20D137F48();
    sub_20D137DE0();
    sub_20D137F6C();
    sub_20D137DE0();
    sub_20D137F84();
    __break(1u);
  }
  else
  {
LABEL_14:
    swift_bridgeObjectRelease_n();
  }
}

uint64_t sub_20D1318D8(uint64_t a1, char a2)
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
  unint64_t i;
  int64_t v16;
  unint64_t v17;
  int64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  char v25;
  id v26;
  uint64_t v27;
  unint64_t v28;
  unint64_t v29;
  unint64_t v30;
  char v31;
  unint64_t v32;
  BOOL v33;
  uint64_t v34;
  _QWORD *v35;
  uint64_t v36;
  uint64_t v37;
  int64_t v38;
  _QWORD *v39;
  uint64_t v40;
  char v41;
  __int128 v42;

  v3 = v2;
  v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2549A5F60);
  v41 = a2;
  v6 = sub_20D137F9C();
  v7 = v6;
  if (*(_QWORD *)(v5 + 16))
  {
    v8 = 1 << *(_BYTE *)(v5 + 32);
    v39 = (_QWORD *)(v5 + 64);
    if (v8 < 64)
      v9 = ~(-1 << v8);
    else
      v9 = -1;
    v10 = v9 & *(_QWORD *)(v5 + 64);
    v38 = (unint64_t)(v8 + 63) >> 6;
    v11 = v6 + 64;
    result = swift_retain();
    v13 = 0;
    v40 = v5;
    if (!v10)
      goto LABEL_7;
LABEL_6:
    v14 = __clz(__rbit64(v10));
    v10 &= v10 - 1;
    for (i = v14 | (v13 << 6); ; i = __clz(__rbit64(v17)) + (v13 << 6))
    {
      v19 = (uint64_t *)(*(_QWORD *)(v5 + 48) + 16 * i);
      v21 = *v19;
      v20 = v19[1];
      v22 = *(_QWORD *)(v5 + 56) + 40 * i;
      v23 = *(_QWORD *)v22;
      v24 = *(_QWORD *)(v22 + 8);
      v25 = *(_BYTE *)(v22 + 16);
      v42 = *(_OWORD *)(v22 + 24);
      if ((v41 & 1) == 0)
      {
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        v26 = *((id *)&v42 + 1);
      }
      sub_20D137FD8();
      sub_20D137DD4();
      result = sub_20D137FFC();
      v27 = -1 << *(_BYTE *)(v7 + 32);
      v28 = result & ~v27;
      v29 = v28 >> 6;
      if (((-1 << v28) & ~*(_QWORD *)(v11 + 8 * (v28 >> 6))) == 0)
      {
        v31 = 0;
        v32 = (unint64_t)(63 - v27) >> 6;
        while (++v29 != v32 || (v31 & 1) == 0)
        {
          v33 = v29 == v32;
          if (v29 == v32)
            v29 = 0;
          v31 |= v33;
          v34 = *(_QWORD *)(v11 + 8 * v29);
          if (v34 != -1)
          {
            v30 = __clz(__rbit64(~v34)) + (v29 << 6);
            goto LABEL_30;
          }
        }
        __break(1u);
LABEL_39:
        __break(1u);
LABEL_40:
        __break(1u);
        return result;
      }
      v30 = __clz(__rbit64((-1 << v28) & ~*(_QWORD *)(v11 + 8 * (v28 >> 6)))) | v28 & 0x7FFFFFFFFFFFFFC0;
LABEL_30:
      *(_QWORD *)(v11 + ((v30 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v30;
      v35 = (_QWORD *)(*(_QWORD *)(v7 + 48) + 16 * v30);
      *v35 = v21;
      v35[1] = v20;
      v36 = *(_QWORD *)(v7 + 56) + 40 * v30;
      *(_QWORD *)v36 = v23;
      *(_QWORD *)(v36 + 8) = v24;
      *(_BYTE *)(v36 + 16) = v25;
      *(_OWORD *)(v36 + 24) = v42;
      ++*(_QWORD *)(v7 + 16);
      v5 = v40;
      if (v10)
        goto LABEL_6;
LABEL_7:
      v16 = v13 + 1;
      if (__OFADD__(v13, 1))
        goto LABEL_39;
      if (v16 >= v38)
        goto LABEL_32;
      v17 = v39[v16];
      ++v13;
      if (!v17)
      {
        v13 = v16 + 1;
        if (v16 + 1 >= v38)
          goto LABEL_32;
        v17 = v39[v13];
        if (!v17)
        {
          v18 = v16 + 2;
          if (v18 >= v38)
          {
LABEL_32:
            swift_release();
            v3 = v2;
            if ((v41 & 1) != 0)
            {
              v37 = 1 << *(_BYTE *)(v5 + 32);
              if (v37 >= 64)
                sub_20D131C1C(0, (unint64_t)(v37 + 63) >> 6, v39);
              else
                *v39 = -1 << v37;
              *(_QWORD *)(v5 + 16) = 0;
            }
            break;
          }
          v17 = v39[v18];
          if (!v17)
          {
            while (1)
            {
              v13 = v18 + 1;
              if (__OFADD__(v18, 1))
                goto LABEL_40;
              if (v13 >= v38)
                goto LABEL_32;
              v17 = v39[v13];
              ++v18;
              if (v17)
                goto LABEL_18;
            }
          }
          v13 = v18;
        }
      }
LABEL_18:
      v10 = (v17 - 1) & v17;
    }
  }
  result = swift_release();
  *v3 = v7;
  return result;
}

uint64_t sub_20D131C1C(uint64_t result, uint64_t a2, _QWORD *a3)
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

uint64_t sub_20D131C38(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t result;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v3 = *(_QWORD *)(a2 + 16);
  result = sub_20D137FE4();
  if (v3)
  {
    v5 = *(_QWORD *)(sub_20D1378D0() - 8);
    v6 = a2 + ((*(unsigned __int8 *)(v5 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80));
    v7 = *(_QWORD *)(v5 + 72);
    sub_20D124C24(&qword_2549A5FF0, (void (*)(uint64_t))MEMORY[0x24BEE63B8]);
    do
    {
      result = sub_20D137DA4();
      v6 += v7;
      --v3;
    }
    while (v3);
  }
  return result;
}

uint64_t sub_20D131CE0@<X0>(uint64_t *a1@<X8>)
{
  return sub_20D12F12C(a1);
}

uint64_t sub_20D131CF0(uint64_t a1)
{
  return sub_20D12F1E0(a1);
}

_QWORD *sub_20D131CFC(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;

  v2 = a1[2];
  v3 = a1[3];
  v4 = a1[4];
  v5 = a1[5];
  v6 = (void *)a1[6];
  swift_retain();
  swift_retain();
  sub_20D131D68(v2, v3, v4, v5, v6);
  return a1;
}

id sub_20D131D68(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id result;

  if (a2)
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    return a5;
  }
  return result;
}

void sub_20D131DAC(uint64_t a1, uint64_t (*a2)(_QWORD))
{
  uint64_t v2;

  v2 = OUTLINED_FUNCTION_145(a1, a2);
  OUTLINED_FUNCTION_41(v2);
  OUTLINED_FUNCTION_3();
}

uint64_t type metadata accessor for PhotosPickerViewController(uint64_t a1)
{
  return sub_20D125420(a1, (uint64_t *)&unk_2549A5EF0);
}

unint64_t sub_20D131DEC()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;
  _QWORD v3[2];

  result = qword_2549A5C88;
  if (!qword_2549A5C88)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2549A5C80);
    sub_20D124C24(&qword_2549A5C90, (void (*)(uint64_t))type metadata accessor for PhotosPickerViewController);
    v3[0] = v2;
    v3[1] = MEMORY[0x24BDF1050];
    result = MEMORY[0x212B9D8E4](MEMORY[0x24BDED308], v1, v3);
    atomic_store(result, (unint64_t *)&qword_2549A5C88);
  }
  return result;
}

uint64_t sub_20D131E70()
{
  OUTLINED_FUNCTION_135();
  return swift_deallocObject();
}

uint64_t sub_20D131E90(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v7 = *(_QWORD *)(v4 + 32);
  OUTLINED_FUNCTION_141(a1, a2, *(_QWORD *)(v4 + 40), a4);
  OUTLINED_FUNCTION_135();
  OUTLINED_FUNCTION_134();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  sub_20D135090(*(_QWORD *)(v6 + 40), *(_BYTE *)(v6 + 48));
  __swift_instantiateConcreteTypeFromMangledName(&qword_2549A5C98);
  if (OUTLINED_FUNCTION_132() == 1)
  {
    v8 = sub_20D137918();
    OUTLINED_FUNCTION_67_0(v8);
  }
  else
  {
    swift_release();
  }
  v9 = OUTLINED_FUNCTION_7_0();
  OUTLINED_FUNCTION_66_0(v9);
  OUTLINED_FUNCTION_22_0(v6 + *(int *)(v5 + 56), *(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 8));
  return OUTLINED_FUNCTION_33_0();
}

uint64_t type metadata accessor for PhotosPicker(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for PhotosPicker);
}

uint64_t sub_20D131F6C(_BYTE *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t *v4;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v6 = v4[4];
  v7 = v4[5];
  v8 = *(unsigned __int8 *)(*(_QWORD *)(type metadata accessor for PhotosPicker(0, v6, v7, a4) - 8) + 80);
  return sub_20D12BAD8(a1, v4[2], v4[3], (uint64_t)v4 + ((v8 + 48) & ~v8), v6, v7);
}

uint64_t sub_20D131FC8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v7 = *(_QWORD *)(v4 + 16);
  OUTLINED_FUNCTION_141(a1, a2, *(_QWORD *)(v4 + 24), a4);
  OUTLINED_FUNCTION_134();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  sub_20D135090(*(_QWORD *)(v6 + 40), *(_BYTE *)(v6 + 48));
  __swift_instantiateConcreteTypeFromMangledName(&qword_2549A5C98);
  if (OUTLINED_FUNCTION_132() == 1)
  {
    v8 = sub_20D137918();
    OUTLINED_FUNCTION_67_0(v8);
  }
  else
  {
    swift_release();
  }
  v9 = OUTLINED_FUNCTION_7_0();
  OUTLINED_FUNCTION_66_0(v9);
  OUTLINED_FUNCTION_22_0(v6 + *(int *)(v5 + 56), *(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 8));
  return OUTLINED_FUNCTION_33_0();
}

uint64_t sub_20D132094()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  OUTLINED_FUNCTION_78_0();
  type metadata accessor for PhotosPicker(v0, v1, v2, v3);
  OUTLINED_FUNCTION_126();
  OUTLINED_FUNCTION_78_0();
  return sub_20D12B5FC(v4, v5, v6, v7);
}

uint64_t sub_20D1320D0@<X0>(uint64_t a1@<X3>, char *a2@<X8>)
{
  uint64_t *v2;

  return sub_20D12B67C(v2[4], v2[2], v2[3], a1, a2);
}

void sub_20D1320DC(uint64_t a1@<X8>)
{
  uint64_t v1;

  sub_20D12D0DC(*(_QWORD *)(v1 + 32), a1);
}

void sub_20D132108()
{
  _BYTE *v0;

  OUTLINED_FUNCTION_68_0();
  *v0 = sub_20D12DD8C() & 1;
  OUTLINED_FUNCTION_3();
}

void sub_20D13212C()
{
  sub_20D12DDC4();
  OUTLINED_FUNCTION_3();
}

void sub_20D13214C()
{
  sub_20D12DDFC();
  OUTLINED_FUNCTION_3();
}

void sub_20D13216C()
{
  _BYTE *v0;

  OUTLINED_FUNCTION_68_0();
  *v0 = sub_20D12DFEC();
  OUTLINED_FUNCTION_3();
}

void sub_20D13218C()
{
  sub_20D12E024();
  OUTLINED_FUNCTION_3();
}

uint64_t sub_20D1321AC()
{
  return swift_deallocObject();
}

uint64_t sub_20D1321BC(_BYTE *a1)
{
  uint64_t v1;

  return sub_20D12E05C(a1, *(_BYTE *)(v1 + 16), *(_BYTE *)(v1 + 17));
}

void sub_20D1321C8()
{
  uint64_t *v0;

  OUTLINED_FUNCTION_68_0();
  *v0 = sub_20D12E16C();
  OUTLINED_FUNCTION_3();
}

void sub_20D1321E8(uint64_t *a1)
{
  OUTLINED_FUNCTION_136(*a1, (void (*)(void))sub_20D1368A8);
  OUTLINED_FUNCTION_3();
}

void sub_20D132214()
{
  uint64_t *v0;

  OUTLINED_FUNCTION_68_0();
  *v0 = sub_20D12E1C8();
  OUTLINED_FUNCTION_3();
}

void sub_20D132234(uint64_t *a1)
{
  OUTLINED_FUNCTION_136(*a1, (void (*)(void))sub_20D13686C);
  OUTLINED_FUNCTION_3();
}

void sub_20D132260()
{
  uint64_t *v0;

  OUTLINED_FUNCTION_68_0();
  *v0 = sub_20D12E2A8();
  OUTLINED_FUNCTION_3();
}

void sub_20D132280()
{
  sub_20D12E2E0();
  OUTLINED_FUNCTION_3();
}

void sub_20D1322A0()
{
  sub_20D12E324();
  OUTLINED_FUNCTION_3();
}

void sub_20D1322BC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  sub_20D12E580(a1, a2, a3, a4, &qword_2549A5EC0);
}

void sub_20D1322E8()
{
  uint64_t *v0;
  uint64_t v1;

  OUTLINED_FUNCTION_68_0();
  *v0 = sub_20D12E3BC();
  v0[1] = v1;
  OUTLINED_FUNCTION_3();
}

void sub_20D13230C()
{
  sub_20D12E474();
  OUTLINED_FUNCTION_3();
}

void sub_20D132328(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  sub_20D12E580(a1, a2, a3, a4, &qword_2549A5EC0);
}

void sub_20D132354()
{
  sub_20D12E54C();
  OUTLINED_FUNCTION_3();
}

void sub_20D132370(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  sub_20D12E580(a1, a2, a3, a4, &qword_2549A5ED0);
}

uint64_t sub_20D13239C()
{
  return swift_getOpaqueTypeConformance2();
}

void sub_20D1323AC()
{
  sub_20D124C24(&qword_2549A5CB0, (void (*)(uint64_t))type metadata accessor for PhotosPickerSelectionBehavior);
}

void sub_20D1323D8()
{
  sub_20D124C24(&qword_2549A5CB8, (void (*)(uint64_t))type metadata accessor for PhotosPickerStyle);
}

void sub_20D132404()
{
  sub_20D124C24(&qword_2549A5CC0, (void (*)(uint64_t))type metadata accessor for PhotosPickerItem.EncodingDisambiguationPolicy);
}

unint64_t sub_20D132434()
{
  unint64_t result;

  result = qword_2549A5CC8;
  if (!qword_2549A5CC8)
  {
    result = MEMORY[0x212B9D8E4](&protocol conformance descriptor for PhotosPickerItem, &type metadata for PhotosPickerItem);
    atomic_store(result, (unint64_t *)&qword_2549A5CC8);
  }
  return result;
}

uint64_t sub_20D132470()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t initializeBufferWithCopyOfBuffer for PhotosPickerSelectionBehavior(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_20D132A9C(a1, a2, a3, (uint64_t (*)(_QWORD))MEMORY[0x24BDE3AC8]);
}

uint64_t destroy for PhotosPickerSelectionBehavior(uint64_t a1, uint64_t a2)
{
  return sub_20D132AD4(a1, a2, (uint64_t (*)(_QWORD))MEMORY[0x24BDE3AC8]);
}

void initializeWithCopy for PhotosPickerSelectionBehavior(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_20D132B14(a1, a2, a3, (uint64_t (*)(_QWORD))MEMORY[0x24BDE3AC8]);
}

void assignWithCopy for PhotosPickerSelectionBehavior(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_20D132B4C(a1, a2, a3, (uint64_t (*)(_QWORD))MEMORY[0x24BDE3AC8]);
}

void initializeWithTake for PhotosPickerSelectionBehavior(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_20D132B80(a1, a2, a3, (uint64_t (*)(_QWORD))MEMORY[0x24BDE3AC8]);
}

void assignWithTake for PhotosPickerSelectionBehavior(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_20D132BB8(a1, a2, a3, (uint64_t (*)(_QWORD))MEMORY[0x24BDE3AC8]);
}

uint64_t getEnumTagSinglePayload for PhotosPickerSelectionBehavior()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_20D1324F8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v2 = OUTLINED_FUNCTION_109();
  return OUTLINED_FUNCTION_76_0(v1, v0, v2);
}

uint64_t storeEnumTagSinglePayload for PhotosPickerSelectionBehavior()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_20D132528()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  OUTLINED_FUNCTION_109();
  v0 = OUTLINED_FUNCTION_45_0();
  return OUTLINED_FUNCTION_75_0(v0, v1, v2, v3);
}

uint64_t sub_20D132544(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_20D132C44(a1, a2, a3, (uint64_t (*)(uint64_t))MEMORY[0x24BDE3AC8]);
}

_QWORD *initializeBufferWithCopyOfBuffer for PhotosPickerStyle(_QWORD *a1, _QWORD *a2, uint64_t a3)
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
    v7 = sub_20D137BDC();
    (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a1, a2, v7);
    *((_BYTE *)a1 + *(int *)(a3 + 20)) = *((_BYTE *)a2 + *(int *)(a3 + 20));
  }
  return a1;
}

uint64_t destroy for PhotosPickerStyle(uint64_t a1, uint64_t a2)
{
  return sub_20D132AD4(a1, a2, (uint64_t (*)(_QWORD))MEMORY[0x24BDE3910]);
}

uint64_t initializeWithCopy for PhotosPickerStyle(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;

  v6 = sub_20D137BDC();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(a1, a2, v6);
  *(_BYTE *)(a1 + *(int *)(a3 + 20)) = *(_BYTE *)(a2 + *(int *)(a3 + 20));
  return a1;
}

uint64_t assignWithCopy for PhotosPickerStyle(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;

  v6 = sub_20D137BDC();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 24))(a1, a2, v6);
  *(_BYTE *)(a1 + *(int *)(a3 + 20)) = *(_BYTE *)(a2 + *(int *)(a3 + 20));
  return a1;
}

uint64_t initializeWithTake for PhotosPickerStyle(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;

  v6 = sub_20D137BDC();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 32))(a1, a2, v6);
  *(_BYTE *)(a1 + *(int *)(a3 + 20)) = *(_BYTE *)(a2 + *(int *)(a3 + 20));
  return a1;
}

uint64_t assignWithTake for PhotosPickerStyle(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;

  v6 = sub_20D137BDC();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 40))(a1, a2, v6);
  *(_BYTE *)(a1 + *(int *)(a3 + 20)) = *(_BYTE *)(a2 + *(int *)(a3 + 20));
  return a1;
}

uint64_t getEnumTagSinglePayload for PhotosPickerStyle()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

void sub_20D132760(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = OUTLINED_FUNCTION_72_0();
  if (*(_DWORD *)(*(_QWORD *)(v4 - 8) + 84) == (_DWORD)a2)
    OUTLINED_FUNCTION_48_0(a1, a2, v4);
  else
    OUTLINED_FUNCTION_19_0();
}

uint64_t storeEnumTagSinglePayload for PhotosPickerStyle()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

void sub_20D1327E0()
{
  char v0;
  uint64_t v1;
  uint64_t v2;
  char v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  OUTLINED_FUNCTION_133();
  OUTLINED_FUNCTION_72_0();
  OUTLINED_FUNCTION_49_0();
  if (v3)
  {
    v4 = OUTLINED_FUNCTION_45_0();
    OUTLINED_FUNCTION_18_0(v4, v5, v6, v7);
  }
  else
  {
    *(_BYTE *)(v1 + *(int *)(v2 + 20)) = v0 + 1;
    OUTLINED_FUNCTION_19_0();
  }
}

uint64_t sub_20D132820()
{
  uint64_t result;
  unint64_t v1;

  result = sub_20D137BDC();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

void destroy for PhotosPickerItem(uint64_t a1)
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

}

uint64_t initializeWithCopy for PhotosPickerItem(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  void *v4;
  id v5;

  v3 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v3;
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
  v4 = *(void **)(a2 + 32);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 32) = v4;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v5 = v4;
  return a1;
}

uint64_t assignWithCopy for PhotosPickerItem(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  id v6;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v4 = *(void **)(a2 + 32);
  v5 = *(void **)(a1 + 32);
  *(_QWORD *)(a1 + 32) = v4;
  v6 = v4;

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

uint64_t assignWithTake for PhotosPickerItem(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  void *v5;

  v4 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
  swift_bridgeObjectRelease();
  v5 = *(void **)(a1 + 32);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);

  return a1;
}

uint64_t getEnumTagSinglePayload for PhotosPickerItem(uint64_t a1, int a2)
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

uint64_t storeEnumTagSinglePayload for PhotosPickerItem(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for PhotosPickerItem()
{
  return &type metadata for PhotosPickerItem;
}

uint64_t initializeBufferWithCopyOfBuffer for PhotosPickerItem.EncodingDisambiguationPolicy(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_20D132A9C(a1, a2, a3, (uint64_t (*)(_QWORD))MEMORY[0x24BDE3A20]);
}

uint64_t sub_20D132A9C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(_QWORD))
{
  uint64_t v4;
  uint64_t v5;
  uint64_t (**v6)(uint64_t, uint64_t);

  OUTLINED_FUNCTION_15_0(a1, a2, a3, a4);
  OUTLINED_FUNCTION_127();
  return (*v6)(v5, v4);
}

uint64_t destroy for PhotosPickerItem.EncodingDisambiguationPolicy(uint64_t a1, uint64_t a2)
{
  return sub_20D132AD4(a1, a2, (uint64_t (*)(_QWORD))MEMORY[0x24BDE3A20]);
}

uint64_t sub_20D132AD4(uint64_t a1, uint64_t a2, uint64_t (*a3)(_QWORD))
{
  uint64_t v4;

  v4 = a3(0);
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(a1, v4);
}

void initializeWithCopy for PhotosPickerItem.EncodingDisambiguationPolicy(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_20D132B14(a1, a2, a3, (uint64_t (*)(_QWORD))MEMORY[0x24BDE3A20]);
}

void sub_20D132B14(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(_QWORD))
{
  uint64_t v4;

  v4 = OUTLINED_FUNCTION_15_0(a1, a2, a3, a4);
  OUTLINED_FUNCTION_18(*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16));
  OUTLINED_FUNCTION_3();
}

void assignWithCopy for PhotosPickerItem.EncodingDisambiguationPolicy(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_20D132B4C(a1, a2, a3, (uint64_t (*)(_QWORD))MEMORY[0x24BDE3A20]);
}

void sub_20D132B4C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(_QWORD))
{
  uint64_t v4;

  OUTLINED_FUNCTION_15_0(a1, a2, a3, a4);
  OUTLINED_FUNCTION_127();
  OUTLINED_FUNCTION_18(*(uint64_t (**)(uint64_t, uint64_t))(v4 + 24));
  OUTLINED_FUNCTION_3();
}

void initializeWithTake for PhotosPickerItem.EncodingDisambiguationPolicy(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_20D132B80(a1, a2, a3, (uint64_t (*)(_QWORD))MEMORY[0x24BDE3A20]);
}

void sub_20D132B80(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(_QWORD))
{
  uint64_t v4;

  v4 = OUTLINED_FUNCTION_15_0(a1, a2, a3, a4);
  OUTLINED_FUNCTION_18(*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32));
  OUTLINED_FUNCTION_3();
}

void assignWithTake for PhotosPickerItem.EncodingDisambiguationPolicy(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_20D132BB8(a1, a2, a3, (uint64_t (*)(_QWORD))MEMORY[0x24BDE3A20]);
}

void sub_20D132BB8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(_QWORD))
{
  uint64_t v4;

  OUTLINED_FUNCTION_15_0(a1, a2, a3, a4);
  OUTLINED_FUNCTION_127();
  OUTLINED_FUNCTION_18(*(uint64_t (**)(uint64_t, uint64_t))(v4 + 40));
  OUTLINED_FUNCTION_3();
}

uint64_t getEnumTagSinglePayload for PhotosPickerItem.EncodingDisambiguationPolicy()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_20D132BEC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v2 = OUTLINED_FUNCTION_108();
  return OUTLINED_FUNCTION_76_0(v1, v0, v2);
}

uint64_t storeEnumTagSinglePayload for PhotosPickerItem.EncodingDisambiguationPolicy()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_20D132C1C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  OUTLINED_FUNCTION_108();
  v0 = OUTLINED_FUNCTION_45_0();
  return OUTLINED_FUNCTION_75_0(v0, v1, v2, v3);
}

uint64_t sub_20D132C38(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_20D132C44(a1, a2, a3, (uint64_t (*)(uint64_t))MEMORY[0x24BDE3A20]);
}

uint64_t sub_20D132C44(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(uint64_t))
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

uint64_t sub_20D132CAC()
{
  return swift_allocateGenericValueMetadata();
}

void sub_20D132CB4()
{
  unint64_t v0;
  unint64_t v1;
  unint64_t v2;

  sub_20D1365BC(319, &qword_2549A5D80, (void (*)(uint64_t))MEMORY[0x24BDEC038]);
  if (v0 <= 0x3F)
  {
    sub_20D137D5C();
    if (v1 <= 0x3F)
    {
      swift_checkMetadataState();
      if (v2 <= 0x3F)
        swift_initStructMetadata();
    }
  }
}

uint64_t *sub_20D132D90(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  int v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  int v17;
  uint64_t v18;
  unint64_t v19;
  unint64_t v20;
  int v21;
  uint64_t v24;
  uint64_t *v25;
  _QWORD *v26;
  _QWORD *v27;
  unint64_t v28;
  unint64_t v29;
  uint64_t v30;
  char v31;
  _QWORD *v32;
  _QWORD *v33;
  unsigned int v34;
  uint64_t v35;
  uint64_t v36;
  char v37;
  unint64_t v38;
  unint64_t v39;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t *v50;
  uint64_t v51;

  v6 = sub_20D137918();
  v7 = *(_QWORD *)(v6 - 8);
  v8 = *(_DWORD *)(v7 + 80);
  v9 = v8 & 0xF8 | 7;
  v51 = v7;
  if (*(_QWORD *)(v7 + 64) <= 8uLL)
    v10 = 8;
  else
    v10 = *(_QWORD *)(v7 + 64);
  v11 = sub_20D137D5C();
  v12 = *(_QWORD *)(v11 - 8);
  v13 = *(_DWORD *)(v12 + 80);
  v14 = v13;
  v15 = *(_QWORD *)(a3 + 16);
  v16 = *(_QWORD *)(v15 - 8);
  v17 = *(_DWORD *)(v16 + 80);
  v18 = v17;
  v19 = ((*(_QWORD *)(v12 + 64)
        + v17
        + ((v10 + 1 + v13 + (((v8 & 0xF8) + 56) & ~v9)) & ~(unint64_t)v13)
        + 1) & ~(unint64_t)v17)
      + *(_QWORD *)(v16 + 64);
  v20 = v13 | (unint64_t)v9 | v17;
  v21 = (v13 | v8 | v17) & 0x100000;
  if (v20 != 7 || v21 != 0 || v19 > 0x18)
  {
    v24 = *a2;
    *a1 = *a2;
    v25 = (uint64_t *)(v24 + ((v20 + 16) & ~v20));
    swift_retain();
  }
  else
  {
    v42 = v6;
    v43 = *(_QWORD *)(v12 + 64);
    v44 = *(_QWORD *)(v11 - 8);
    v46 = v10 + 1;
    v47 = v11;
    v48 = *(_QWORD *)(v15 - 8);
    v49 = v15;
    v41 = ~v9;
    *(_BYTE *)a1 = *(_BYTE *)a2;
    a1[1] = a2[1];
    v50 = a1;
    v26 = (_QWORD *)(((unint64_t)a1 + 23) & 0xFFFFFFFFFFFFFFF8);
    v27 = (_QWORD *)(((unint64_t)a2 + 23) & 0xFFFFFFFFFFFFFFF8);
    *v26 = *v27;
    v26[1] = v27[1];
    v26[2] = v27[2];
    v28 = ((unint64_t)v26 + 31) & 0xFFFFFFFFFFFFFFF8;
    v29 = ((unint64_t)v27 + 31) & 0xFFFFFFFFFFFFFFF8;
    v30 = *(_QWORD *)v29;
    v45 = v10;
    v31 = *(_BYTE *)(v29 + 8);
    swift_retain();
    swift_retain();
    swift_retain();
    swift_bridgeObjectRetain();
    sub_20D134E10(v30, v31);
    *(_QWORD *)v28 = v30;
    *(_BYTE *)(v28 + 8) = v31;
    v32 = (_QWORD *)((v28 + v9 + 9) & v41);
    v33 = (_QWORD *)((v29 + v9 + 9) & v41);
    v34 = *((unsigned __int8 *)v33 + v45);
    if (v34 >= 2)
    {
      if (v45 <= 3)
        v35 = v45;
      else
        v35 = 4;
      __asm { BR              X12 }
    }
    v25 = v50;
    v36 = ~v14;
    if (v34 == 1)
    {
      (*(void (**)(_QWORD *, unint64_t, uint64_t))(v51 + 16))(v32, (v29 + v9 + 9) & v41, v42);
      v37 = 1;
    }
    else
    {
      *v32 = *v33;
      swift_retain();
      v37 = 0;
    }
    *((_BYTE *)v32 + v45) = v37;
    v38 = ((unint64_t)v32 + v46 + v14) & v36;
    v39 = ((unint64_t)v33 + v46 + v14) & v36;
    (*(void (**)(unint64_t, unint64_t, uint64_t))(v44 + 16))(v38, v39, v47);
    *(_BYTE *)(v38 + v43) = *(_BYTE *)(v39 + v43);
    (*(void (**)(unint64_t, unint64_t, uint64_t))(v48 + 16))((v38 + v43 + v18 + 1) & ~v18, (v39 + v43 + v18 + 1) & ~v18, v49);
  }
  return v25;
}

uint64_t sub_20D133094(uint64_t a1, uint64_t a2)
{
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unsigned int v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;

  swift_release();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  v4 = (((a1 + 23) & 0xFFFFFFFFFFFFFFF8) + 31) & 0xFFFFFFFFFFFFFFF8;
  sub_20D135090(*(_QWORD *)v4, *(_BYTE *)(v4 + 8));
  v5 = sub_20D137918();
  v6 = *(_QWORD *)(v5 - 8);
  v7 = *(_DWORD *)(v6 + 80) & 0xF8 | 7;
  v8 = (v4 + v7 + 9) & ~v7;
  if (*(_QWORD *)(v6 + 64) <= 8uLL)
    v9 = 8;
  else
    v9 = *(_QWORD *)(v6 + 64);
  v10 = *(unsigned __int8 *)(v8 + v9);
  if (v10 >= 2)
  {
    if (v9 <= 3)
      v11 = v9;
    else
      v11 = 4;
    __asm { BR              X13 }
  }
  if (v10 == 1)
    (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v8, v5);
  else
    swift_release();
  v12 = v9 + v8;
  v13 = sub_20D137D5C();
  v14 = *(_QWORD *)(v13 - 8);
  v15 = (v12 + *(unsigned __int8 *)(v14 + 80) + 1) & ~(unint64_t)*(unsigned __int8 *)(v14 + 80);
  (*(void (**)(unint64_t, uint64_t))(v14 + 8))(v15, v13);
  return (*(uint64_t (**)(unint64_t))(*(_QWORD *)(*(_QWORD *)(a2 + 16) - 8) + 8))((*(_QWORD *)(v14 + 64) + *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a2 + 16) - 8) + 80) + v15 + 1) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a2 + 16) - 8) + 80));
}

uint64_t sub_20D133214(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _QWORD *v5;
  _QWORD *v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;
  char v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  _QWORD *v17;
  _QWORD *v18;
  uint64_t v19;
  unsigned int v20;
  uint64_t v21;
  char v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;
  unint64_t v28;
  uint64_t v29;
  _BYTE *v30;
  _BYTE *v31;
  uint64_t v32;

  *(_BYTE *)a1 = *(_BYTE *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  v5 = (_QWORD *)((a1 + 23) & 0xFFFFFFFFFFFFFFF8);
  v6 = (_QWORD *)((a2 + 23) & 0xFFFFFFFFFFFFFFF8);
  *v5 = *v6;
  v5[1] = v6[1];
  v5[2] = v6[2];
  v7 = ((unint64_t)v5 + 31) & 0xFFFFFFFFFFFFFFF8;
  v8 = ((unint64_t)v6 + 31) & 0xFFFFFFFFFFFFFFF8;
  v9 = *(_QWORD *)v8;
  v10 = *(_BYTE *)(v8 + 8);
  swift_retain();
  swift_retain();
  swift_retain();
  swift_bridgeObjectRetain();
  sub_20D134E10(v9, v10);
  *(_QWORD *)v7 = v9;
  *(_BYTE *)(v7 + 8) = v10;
  v11 = sub_20D137918();
  v12 = *(_QWORD *)(v11 - 8);
  v13 = *(_DWORD *)(v12 + 80) & 0xF8;
  v14 = v13 + 16;
  v15 = v13 + 16 + v7;
  v16 = ~v13 & 0xFFFFFFFFFFFFFFF8;
  v17 = (_QWORD *)(v15 & v16);
  v18 = (_QWORD *)((v14 + v8) & v16);
  if (*(_QWORD *)(v12 + 64) <= 8uLL)
    v19 = 8;
  else
    v19 = *(_QWORD *)(v12 + 64);
  v20 = *((unsigned __int8 *)v18 + v19);
  if (v20 >= 2)
  {
    if (v19 <= 3)
      v21 = v19;
    else
      v21 = 4;
    __asm { BR              X13 }
  }
  if (v20 == 1)
  {
    (*(void (**)(_QWORD *, _QWORD *, uint64_t))(v12 + 16))(v17, v18, v11);
    v22 = 1;
  }
  else
  {
    *v17 = *v18;
    swift_retain();
    v22 = 0;
  }
  *((_BYTE *)v17 + v19) = v22;
  v23 = v19 + 1;
  v24 = sub_20D137D5C();
  v25 = *(_QWORD *)(v24 - 8);
  v26 = *(unsigned __int8 *)(v25 + 80);
  v27 = ((unint64_t)v17 + v23 + v26) & ~v26;
  v28 = ((unint64_t)v18 + v23 + v26) & ~v26;
  (*(void (**)(unint64_t, unint64_t, uint64_t))(v25 + 16))(v27, v28, v24);
  v29 = *(_QWORD *)(v25 + 64);
  v30 = (_BYTE *)(v27 + v29);
  v31 = (_BYTE *)(v28 + v29);
  *v30 = *v31;
  v32 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  (*(void (**)(unint64_t, unint64_t))(v32 + 16))((unint64_t)&v30[*(unsigned __int8 *)(v32 + 80) + 1] & ~(unint64_t)*(unsigned __int8 *)(v32 + 80), (unint64_t)&v31[*(unsigned __int8 *)(v32 + 80) + 1] & ~(unint64_t)*(unsigned __int8 *)(v32 + 80));
  return a1;
}

uint64_t sub_20D133438(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _QWORD *v6;
  _QWORD *v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  _QWORD *v19;
  _QWORD *v20;
  uint64_t v21;
  uint64_t v22;
  unsigned int v23;
  uint64_t v24;
  unsigned int v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  unint64_t v31;
  unint64_t v32;
  uint64_t v33;
  _BYTE *v34;
  _BYTE *v35;
  uint64_t v36;

  *(_BYTE *)a1 = *(_BYTE *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  swift_retain();
  swift_release();
  v6 = (_QWORD *)((a1 + 23) & 0xFFFFFFFFFFFFFFF8);
  v7 = (_QWORD *)((a2 + 23) & 0xFFFFFFFFFFFFFFF8);
  *v6 = *v7;
  swift_retain();
  swift_release();
  v6[1] = v7[1];
  swift_retain();
  swift_release();
  v6[2] = v7[2];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v8 = ((unint64_t)v6 + 31) & 0xFFFFFFFFFFFFFFF8;
  v9 = ((unint64_t)v7 + 31) & 0xFFFFFFFFFFFFFFF8;
  v10 = *(_QWORD *)v9;
  LOBYTE(v6) = *(_BYTE *)(v9 + 8);
  sub_20D134E10(*(_QWORD *)v9, (char)v6);
  v11 = *(_QWORD *)v8;
  v12 = *(_BYTE *)(v8 + 8);
  *(_QWORD *)v8 = v10;
  *(_BYTE *)(v8 + 8) = (_BYTE)v6;
  sub_20D135090(v11, v12);
  v13 = sub_20D137918();
  v14 = *(_QWORD *)(v13 - 8);
  v15 = *(_DWORD *)(v14 + 80) & 0xF8;
  v16 = v15 + 16;
  v17 = v15 + 16 + v8;
  v18 = ~v15 & 0xFFFFFFFFFFFFFFF8;
  v19 = (_QWORD *)(v17 & v18);
  v20 = (_QWORD *)((v16 + v9) & v18);
  if (*(_QWORD *)(v14 + 64) <= 8uLL)
    v21 = 8;
  else
    v21 = *(_QWORD *)(v14 + 64);
  if (v19 != v20)
  {
    v22 = v13;
    v23 = *((unsigned __int8 *)v19 + v21);
    if (v23 >= 2)
    {
      if (v21 <= 3)
        v24 = v21;
      else
        v24 = 4;
      __asm { BR              X12 }
    }
    if (v23 == 1)
      (*(void (**)(_QWORD *, uint64_t))(v14 + 8))(v19, v13);
    else
      swift_release();
    v25 = *((unsigned __int8 *)v20 + v21);
    if (v25 >= 2)
    {
      if (v21 <= 3)
        v26 = v21;
      else
        v26 = 4;
      __asm { BR              X12 }
    }
    if (v25 == 1)
    {
      (*(void (**)(_QWORD *, _QWORD *, uint64_t))(v14 + 16))(v19, v20, v22);
      *((_BYTE *)v19 + v21) = 1;
    }
    else
    {
      *v19 = *v20;
      *((_BYTE *)v19 + v21) = 0;
      swift_retain();
    }
  }
  v27 = sub_20D137D5C();
  v28 = *(_QWORD *)(v27 - 8);
  v29 = *(unsigned __int8 *)(v28 + 80);
  v30 = v21 + v29 + 1;
  v31 = ((unint64_t)v19 + v30) & ~v29;
  v32 = ((unint64_t)v20 + v30) & ~v29;
  (*(void (**)(unint64_t, unint64_t, uint64_t))(v28 + 24))(v31, v32, v27);
  v33 = *(_QWORD *)(v28 + 64);
  v34 = (_BYTE *)(v31 + v33);
  v35 = (_BYTE *)(v32 + v33);
  *v34 = *v35;
  v36 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  (*(void (**)(unint64_t, unint64_t))(v36 + 24))((unint64_t)&v34[*(unsigned __int8 *)(v36 + 80) + 1] & ~(unint64_t)*(unsigned __int8 *)(v36 + 80), (unint64_t)&v35[*(unsigned __int8 *)(v36 + 80) + 1] & ~(unint64_t)*(unsigned __int8 *)(v36 + 80));
  return a1;
}

_OWORD *sub_20D133728(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  unint64_t v5;
  unint64_t v6;
  __int128 v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  _QWORD *v17;
  _QWORD *v18;
  uint64_t v19;
  unsigned int v20;
  uint64_t v21;
  char v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;
  unint64_t v28;
  uint64_t v29;
  _BYTE *v30;
  _BYTE *v31;
  uint64_t v32;

  *a1 = *a2;
  v5 = ((unint64_t)a1 + 23) & 0xFFFFFFFFFFFFFFF8;
  v6 = ((unint64_t)a2 + 23) & 0xFFFFFFFFFFFFFFF8;
  v7 = *(_OWORD *)v6;
  *(_QWORD *)(v5 + 16) = *(_QWORD *)(v6 + 16);
  *(_OWORD *)v5 = v7;
  v8 = (v5 + 31) & 0xFFFFFFFFFFFFFFF8;
  v9 = (v6 + 31) & 0xFFFFFFFFFFFFFFF8;
  v10 = *(_QWORD *)v9;
  *(_BYTE *)(v8 + 8) = *(_BYTE *)(v9 + 8);
  *(_QWORD *)v8 = v10;
  v11 = sub_20D137918();
  v12 = *(_QWORD *)(v11 - 8);
  v13 = *(_DWORD *)(v12 + 80) & 0xF8;
  v14 = v13 + 16;
  v15 = v13 + 16 + v8;
  v16 = ~v13 & 0xFFFFFFFFFFFFFFF8;
  v17 = (_QWORD *)(v15 & v16);
  v18 = (_QWORD *)((v14 + v9) & v16);
  if (*(_QWORD *)(v12 + 64) <= 8uLL)
    v19 = 8;
  else
    v19 = *(_QWORD *)(v12 + 64);
  v20 = *((unsigned __int8 *)v18 + v19);
  if (v20 >= 2)
  {
    if (v19 <= 3)
      v21 = v19;
    else
      v21 = 4;
    __asm { BR              X13 }
  }
  if (v20 == 1)
  {
    (*(void (**)(_QWORD *, _QWORD *, uint64_t))(v12 + 32))(v17, v18, v11);
    v22 = 1;
  }
  else
  {
    v22 = 0;
    *v17 = *v18;
  }
  *((_BYTE *)v17 + v19) = v22;
  v23 = v19 + 1;
  v24 = sub_20D137D5C();
  v25 = *(_QWORD *)(v24 - 8);
  v26 = *(unsigned __int8 *)(v25 + 80);
  v27 = ((unint64_t)v17 + v23 + v26) & ~v26;
  v28 = ((unint64_t)v18 + v23 + v26) & ~v26;
  (*(void (**)(unint64_t, unint64_t, uint64_t))(v25 + 32))(v27, v28, v24);
  v29 = *(_QWORD *)(v25 + 64);
  v30 = (_BYTE *)(v27 + v29);
  v31 = (_BYTE *)(v28 + v29);
  *v30 = *v31;
  v32 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  (*(void (**)(unint64_t, unint64_t))(v32 + 32))((unint64_t)&v30[*(unsigned __int8 *)(v32 + 80) + 1] & ~(unint64_t)*(unsigned __int8 *)(v32 + 80), (unint64_t)&v31[*(unsigned __int8 *)(v32 + 80) + 1] & ~(unint64_t)*(unsigned __int8 *)(v32 + 80));
  return a1;
}

uint64_t sub_20D1338FC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _QWORD *v6;
  _QWORD *v7;
  unint64_t v8;
  unint64_t v9;
  char v10;
  uint64_t v11;
  char v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  _QWORD *v19;
  _QWORD *v20;
  uint64_t v21;
  uint64_t v22;
  unsigned int v23;
  uint64_t v24;
  unsigned int v25;
  uint64_t v26;
  char v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  unint64_t v32;
  unint64_t v33;
  uint64_t v34;
  _BYTE *v35;
  _BYTE *v36;
  uint64_t v37;

  *(_BYTE *)a1 = *(_BYTE *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  swift_release();
  v6 = (_QWORD *)((a1 + 23) & 0xFFFFFFFFFFFFFFF8);
  v7 = (_QWORD *)((a2 + 23) & 0xFFFFFFFFFFFFFFF8);
  *v6 = *v7;
  swift_release();
  v6[1] = v7[1];
  swift_release();
  v6[2] = v7[2];
  swift_bridgeObjectRelease();
  v8 = ((unint64_t)v6 + 31) & 0xFFFFFFFFFFFFFFF8;
  v9 = ((unint64_t)v7 + 31) & 0xFFFFFFFFFFFFFFF8;
  v10 = *(_BYTE *)(v9 + 8);
  v11 = *(_QWORD *)v8;
  v12 = *(_BYTE *)(v8 + 8);
  *(_QWORD *)v8 = *(_QWORD *)v9;
  *(_BYTE *)(v8 + 8) = v10;
  sub_20D135090(v11, v12);
  v13 = sub_20D137918();
  v14 = *(_QWORD *)(v13 - 8);
  v15 = *(_DWORD *)(v14 + 80) & 0xF8;
  v16 = v15 + 16;
  v17 = v15 + 16 + v8;
  v18 = ~v15 & 0xFFFFFFFFFFFFFFF8;
  v19 = (_QWORD *)(v17 & v18);
  v20 = (_QWORD *)((v16 + v9) & v18);
  if (*(_QWORD *)(v14 + 64) <= 8uLL)
    v21 = 8;
  else
    v21 = *(_QWORD *)(v14 + 64);
  if (v19 != v20)
  {
    v22 = v13;
    v23 = *((unsigned __int8 *)v19 + v21);
    if (v23 >= 2)
    {
      if (v21 <= 3)
        v24 = v21;
      else
        v24 = 4;
      __asm { BR              X12 }
    }
    if (v23 == 1)
      (*(void (**)(_QWORD *, uint64_t))(v14 + 8))(v19, v13);
    else
      swift_release();
    v25 = *((unsigned __int8 *)v20 + v21);
    if (v25 >= 2)
    {
      if (v21 <= 3)
        v26 = v21;
      else
        v26 = 4;
      __asm { BR              X12 }
    }
    if (v25 == 1)
    {
      (*(void (**)(_QWORD *, _QWORD *, uint64_t))(v14 + 32))(v19, v20, v22);
      v27 = 1;
    }
    else
    {
      v27 = 0;
      *v19 = *v20;
    }
    *((_BYTE *)v19 + v21) = v27;
  }
  v28 = sub_20D137D5C();
  v29 = *(_QWORD *)(v28 - 8);
  v30 = *(unsigned __int8 *)(v29 + 80);
  v31 = v21 + v30 + 1;
  v32 = ((unint64_t)v19 + v31) & ~v30;
  v33 = ((unint64_t)v20 + v31) & ~v30;
  (*(void (**)(unint64_t, unint64_t, uint64_t))(v29 + 40))(v32, v33, v28);
  v34 = *(_QWORD *)(v29 + 64);
  v35 = (_BYTE *)(v32 + v34);
  v36 = (_BYTE *)(v33 + v34);
  *v35 = *v36;
  v37 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  (*(void (**)(unint64_t, unint64_t))(v37 + 40))((unint64_t)&v35[*(unsigned __int8 *)(v37 + 80) + 1] & ~(unint64_t)*(unsigned __int8 *)(v37 + 80), (unint64_t)&v36[*(unsigned __int8 *)(v37 + 80) + 1] & ~(unint64_t)*(unsigned __int8 *)(v37 + 80));
  return a1;
}

uint64_t sub_20D133BBC(uint64_t a1, unsigned int a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unsigned int v14;
  unsigned int v15;
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
  int v26;
  unsigned int v28;
  int v29;
  int v30;
  unint64_t v31;
  unint64_t v32;
  unint64_t v33;

  v6 = *(_QWORD *)(sub_20D137918() - 8);
  if (*(_QWORD *)(v6 + 64) <= 8uLL)
    v7 = 8;
  else
    v7 = *(_QWORD *)(v6 + 64);
  v8 = sub_20D137D5C();
  v9 = *(_QWORD *)(v8 - 8);
  v10 = *(unsigned int *)(v9 + 84);
  v11 = *(_QWORD *)(a3 + 16);
  v12 = *(_QWORD *)(v11 - 8);
  v13 = *(unsigned int *)(v12 + 84);
  if (v10 <= v13)
    v14 = *(_DWORD *)(v12 + 84);
  else
    v14 = *(_DWORD *)(v9 + 84);
  if (v14 <= 0x7FFFFFFF)
    v15 = 0x7FFFFFFF;
  else
    v15 = v14;
  if (!a2)
    return 0;
  v16 = v8;
  v17 = *(_DWORD *)(v6 + 80) & 0xF8;
  v18 = v17 | 7;
  v19 = *(unsigned __int8 *)(v9 + 80);
  v20 = v7 + v19 + 1;
  v21 = *(_QWORD *)(v9 + 64);
  v22 = *(unsigned __int8 *)(v12 + 80);
  v23 = v21 + v22 + 1;
  if (a2 <= v15)
    goto LABEL_30;
  v24 = ((v23 + ((v20 + ((v17 + 56) & ~v18)) & ~v19)) & ~v22) + *(_QWORD *)(v12 + 64);
  v25 = 8 * v24;
  if (v24 <= 3)
  {
    v28 = ((a2 - v15 + ~(-1 << v25)) >> v25) + 1;
    if (HIWORD(v28))
    {
      v26 = *(_DWORD *)(a1 + v24);
      if (!v26)
        goto LABEL_30;
      goto LABEL_21;
    }
    if (v28 > 0xFF)
    {
      v26 = *(unsigned __int16 *)(a1 + v24);
      if (!*(_WORD *)(a1 + v24))
        goto LABEL_30;
      goto LABEL_21;
    }
    if (v28 < 2)
    {
LABEL_30:
      v31 = (a1 + 23) & 0xFFFFFFFFFFFFFFF8;
      if ((v14 & 0x80000000) != 0)
      {
        v33 = (v20 + ((((v31 + 31) & 0xFFFFFFFFFFFFFFF8) + v18 + 9) & ~v18)) & ~v19;
        if ((_DWORD)v10 == v15)
        {
          v11 = v16;
        }
        else
        {
          v33 = (v23 + v33) & ~v22;
          v10 = v13;
        }
        return __swift_getEnumTagSinglePayload(v33, v10, v11);
      }
      else
      {
        v32 = *(_QWORD *)(v31 + 8);
        if (v32 >= 0xFFFFFFFF)
          LODWORD(v32) = -1;
        return (v32 + 1);
      }
    }
  }
  v26 = *(unsigned __int8 *)(a1 + v24);
  if (!*(_BYTE *)(a1 + v24))
    goto LABEL_30;
LABEL_21:
  v29 = (v26 - 1) << v25;
  if (v24 > 3)
    v29 = 0;
  if ((_DWORD)v24)
  {
    if (v24 <= 3)
      v30 = v24;
    else
      v30 = 4;
    __asm { BR              X12 }
  }
  return v15 + v29 + 1;
}

void sub_20D133DE8(_BYTE *a1, unsigned int a2, unsigned int a3, uint64_t a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unsigned int v12;
  unsigned int v13;
  uint64_t v14;
  size_t v15;
  char v16;
  unsigned int v17;
  int v18;
  unsigned int v19;
  int v20;

  v8 = *(_QWORD *)(sub_20D137918() - 8);
  if (*(_QWORD *)(v8 + 64) <= 8uLL)
    v9 = 8;
  else
    v9 = *(_QWORD *)(v8 + 64);
  v10 = *(_QWORD *)(sub_20D137D5C() - 8);
  v11 = *(_QWORD *)(*(_QWORD *)(a4 + 16) - 8);
  if (*(_DWORD *)(v10 + 84) <= *(_DWORD *)(v11 + 84))
    v12 = *(_DWORD *)(v11 + 84);
  else
    v12 = *(_DWORD *)(v10 + 84);
  if (v12 <= 0x7FFFFFFF)
    v13 = 0x7FFFFFFF;
  else
    v13 = v12;
  v14 = *(_DWORD *)(v8 + 80) & 0xF8;
  v15 = ((*(_QWORD *)(v10 + 64)
        + *(unsigned __int8 *)(v11 + 80)
        + 1
        + ((v9 + *(unsigned __int8 *)(v10 + 80) + 1 + ((v14 + 56) & ~(v14 | 7))) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80))) & ~(unint64_t)*(unsigned __int8 *)(v11 + 80))
      + *(_QWORD *)(v11 + 64);
  v16 = 8 * v15;
  if (a3 <= v13)
  {
    v17 = 0;
  }
  else if (v15 <= 3)
  {
    v19 = ((a3 - v13 + ~(-1 << v16)) >> v16) + 1;
    if (HIWORD(v19))
    {
      v17 = 4u;
    }
    else if (v19 >= 0x100)
    {
      v17 = 2;
    }
    else
    {
      v17 = v19 > 1;
    }
  }
  else
  {
    v17 = 1u;
  }
  if (v13 < a2)
  {
    v18 = ~v13 + a2;
    if (v15 < 4)
    {
      if ((_DWORD)v15)
      {
        v20 = v18 & ~(-1 << v16);
        bzero(a1, v15);
        if ((_DWORD)v15 == 3)
        {
          *(_WORD *)a1 = v20;
          a1[2] = BYTE2(v20);
        }
        else if ((_DWORD)v15 == 2)
        {
          *(_WORD *)a1 = v20;
        }
        else
        {
          *a1 = v20;
        }
      }
    }
    else
    {
      bzero(a1, v15);
      *(_DWORD *)a1 = v18;
    }
    __asm { BR              X10 }
  }
  __asm { BR              X4 }
}

uint64_t sub_20D134094()
{
  return type metadata accessor for PhotosPickerViewController.Coordinator(0);
}

uint64_t type metadata accessor for PhotosPickerViewController.Coordinator(uint64_t a1)
{
  return sub_20D125420(a1, (uint64_t *)&unk_2549A5D90);
}

uint64_t sub_20D1340B0()
{
  uint64_t result;
  unint64_t v1;

  result = type metadata accessor for PhotosPickerViewController(319);
  if (v1 <= 0x3F)
  {
    result = swift_updateClassMetadata2();
    if (!result)
      return 0;
  }
  return result;
}

void sub_20D13411C()
{
  sub_20D12600C(&qword_2549A5DA0, &qword_2549A5DA8);
}

void sub_20D134148()
{
  sub_20D137B4C();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2549A5C78);
  OUTLINED_FUNCTION_148();
}

uint64_t sub_20D134190(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD v9[2];
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2549A5C80);
  OUTLINED_FUNCTION_122();
  sub_20D131DEC();
  v4 = OUTLINED_FUNCTION_31_0();
  v10 = v1;
  v11 = v2;
  v12 = a1;
  v13 = v4;
  MEMORY[0x212B9D8B4](255, &v10, MEMORY[0x24BDF3650], 0);
  type metadata accessor for PhotosPickerViewController(255);
  v5 = sub_20D1379A8();
  v10 = v1;
  v11 = v2;
  v12 = a1;
  v13 = v4;
  v6 = OUTLINED_FUNCTION_31_0();
  sub_20D124C24(&qword_2549A5C90, (void (*)(uint64_t))type metadata accessor for PhotosPickerViewController);
  v9[0] = v6;
  v9[1] = v7;
  return MEMORY[0x212B9D8E4](MEMORY[0x24BDEF3E0], v5, v9);
}

void sub_20D134284()
{
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2549A5C78);
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2549A5C80);
  OUTLINED_FUNCTION_122();
  sub_20D131DEC();
  OUTLINED_FUNCTION_31_0();
  OUTLINED_FUNCTION_31_0();
  OUTLINED_FUNCTION_77_0();
}

void sub_20D13430C()
{
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2549A5CA0);
  OUTLINED_FUNCTION_95();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2549A5DB0);
  OUTLINED_FUNCTION_95();
  sub_20D12600C(&qword_2549A5CA8, &qword_2549A5CA0);
  OUTLINED_FUNCTION_148();
}

void sub_20D13438C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v14;

  sub_20D12600C(&qword_2549A5DB8, v11);
  a9 = a1;
  a10 = v14;
  MEMORY[0x212B9D8E4](v10, v12, &a9);
  OUTLINED_FUNCTION_77_0();
}

uint64_t sub_20D1343C0(uint64_t a1)
{
  return get_witness_table_7SwiftUI4ViewRzlAA15ModifiedContentVyxAA32_EnvironmentKeyTransformModifierVyAA4EdgeO3SetVGGAaBHPxAaBHD1__AkA0cI0HPyHCHCTm(a1, &qword_2549A5DC0, &qword_2549A5DC8);
}

uint64_t sub_20D1343DC(uint64_t a1)
{
  return get_witness_table_7SwiftUI4ViewRzlAA15ModifiedContentVyxAA32_EnvironmentKeyTransformModifierVyAA4EdgeO3SetVGGAaBHPxAaBHD1__AkA0cI0HPyHCHCTm(a1, &qword_2549A5DD0, &qword_2549A5DD8);
}

uint64_t get_witness_table_7SwiftUI4ViewRzlAA15ModifiedContentVyxAA32_EnvironmentKeyTransformModifierVyAA4EdgeO3SetVGGAaBHPxAaBHD1__AkA0cI0HPyHCHCTm(uint64_t a1, uint64_t *a2, _QWORD *a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD v9[2];

  v5 = *(_QWORD *)(a1 + 8);
  __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
  v6 = sub_20D137930();
  sub_20D12600C(a3, a2);
  v9[0] = v5;
  v9[1] = v7;
  return MEMORY[0x212B9D8E4](MEMORY[0x24BDED308], v6, v9);
}

uint64_t sub_20D13447C(uint64_t a1)
{
  return get_witness_table_7SwiftUI4ViewRzlAA15ModifiedContentVyxAA32_EnvironmentKeyTransformModifierVyAA4EdgeO3SetVGGAaBHPxAaBHD1__AkA0cI0HPyHCHCTm(a1, &qword_2549A5DE0, &qword_2549A5DE8);
}

uint64_t sub_20D134498(uint64_t a1)
{
  return get_witness_table_7SwiftUI4ViewRzlAA15ModifiedContentVyxAA32_EnvironmentKeyTransformModifierVyAA4EdgeO3SetVGGAaBHPxAaBHD1__AkA0cI0HPyHCHCTm(a1, &qword_2549A5DF0, &qword_2549A5DF8);
}

uint64_t sub_20D1344B4(uint64_t a1)
{
  return get_witness_table_7SwiftUI4ViewRzlAA15ModifiedContentVyxAA32_EnvironmentKeyTransformModifierVyAA4EdgeO3SetVGGAaBHPxAaBHD1__AkA0cI0HPyHCHCTm(a1, &qword_2549A5E00, &qword_2549A5E08);
}

uint64_t sub_20D1344D0(uint64_t a1)
{
  return get_witness_table_7SwiftUI4ViewRzlAA15ModifiedContentVyxAA32_EnvironmentKeyTransformModifierVyAA4EdgeO3SetVGGAaBHPxAaBHD1__AkA0cI0HPyHCHCTm(a1, &qword_2549A5E10, &qword_2549A5E18);
}

uint64_t sub_20D1344EC(uint64_t a1)
{
  return get_witness_table_7SwiftUI4ViewRzlAA15ModifiedContentVyxAA32_EnvironmentKeyTransformModifierVyAA4EdgeO3SetVGGAaBHPxAaBHD1__AkA0cI0HPyHCHCTm(a1, &qword_2549A5E20, qword_2549A5E28);
}

uint64_t sub_20D134508()
{
  return swift_allocateGenericValueMetadata();
}

uint64_t sub_20D134510()
{
  uint64_t result;
  unint64_t v1;

  result = swift_checkMetadataState();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t *sub_20D13457C(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v8;

  v3 = a1;
  v4 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  v5 = *(_DWORD *)(v4 + 80);
  if (v5 <= 7 && *(_QWORD *)(v4 + 64) <= 0x18uLL && (*(_DWORD *)(v4 + 80) & 0x100000) == 0)
  {
    (*(void (**)(uint64_t *))(v4 + 16))(a1);
  }
  else
  {
    v8 = *a2;
    *v3 = *a2;
    v3 = (uint64_t *)(v8 + ((v5 + 16) & ~v5));
    swift_retain();
  }
  return v3;
}

uint64_t sub_20D1345EC(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(*(_QWORD *)(a2 + 16) - 8) + 8))();
}

uint64_t sub_20D1345FC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  (*(void (**)(void))(*(_QWORD *)(*(_QWORD *)(a3 + 16) - 8) + 16))();
  return a1;
}

uint64_t sub_20D13462C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  (*(void (**)(void))(*(_QWORD *)(*(_QWORD *)(a3 + 16) - 8) + 24))();
  return a1;
}

uint64_t sub_20D13465C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  (*(void (**)(void))(*(_QWORD *)(*(_QWORD *)(a3 + 16) - 8) + 32))();
  return a1;
}

uint64_t sub_20D13468C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  (*(void (**)(void))(*(_QWORD *)(*(_QWORD *)(a3 + 16) - 8) + 40))();
  return a1;
}

uint64_t sub_20D1346BC(uint64_t a1, unsigned int a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  char v9;
  int v10;
  unsigned int v11;
  int v12;

  if (!a2)
    return 0;
  v4 = *(_QWORD *)(a3 + 16);
  v5 = *(_QWORD *)(v4 - 8);
  v6 = *(unsigned int *)(v5 + 84);
  v7 = a2 - v6;
  if (a2 <= v6)
    goto LABEL_18;
  v8 = *(_QWORD *)(v5 + 64);
  v9 = 8 * v8;
  if (v8 <= 3)
  {
    v11 = ((v7 + ~(-1 << v9)) >> v9) + 1;
    if (HIWORD(v11))
    {
      v10 = *(_DWORD *)(a1 + v8);
      if (!v10)
        goto LABEL_18;
      goto LABEL_11;
    }
    if (v11 > 0xFF)
    {
      v10 = *(unsigned __int16 *)(a1 + v8);
      if (!*(_WORD *)(a1 + v8))
        goto LABEL_18;
      goto LABEL_11;
    }
    if (v11 < 2)
    {
LABEL_18:
      if ((_DWORD)v6)
        return __swift_getEnumTagSinglePayload(a1, v6, v4);
      return 0;
    }
  }
  v10 = *(unsigned __int8 *)(a1 + v8);
  if (!*(_BYTE *)(a1 + v8))
    goto LABEL_18;
LABEL_11:
  v12 = (v10 - 1) << v9;
  if (v8 > 3)
    v12 = 0;
  if (!(_DWORD)v8)
    return (v6 + v12 + 1);
  if (v8 > 3)
    LODWORD(v8) = 4;
  return ((uint64_t (*)(void))((char *)&loc_20D13476C + 4 * byte_20D138D46[(v8 - 1)]))();
}

void sub_20D1347B8(_WORD *a1, unsigned int a2, unsigned int a3, uint64_t a4)
{
  uint64_t v6;
  unsigned int v7;
  size_t v8;
  char v9;
  BOOL v10;
  unsigned int v11;
  unsigned int v12;
  unsigned int v13;
  unsigned int v14;
  int v15;

  v6 = *(_QWORD *)(*(_QWORD *)(a4 + 16) - 8);
  v7 = *(_DWORD *)(v6 + 84);
  v8 = *(_QWORD *)(v6 + 64);
  v9 = 8 * v8;
  v10 = a3 >= v7;
  v11 = a3 - v7;
  if (v11 != 0 && v10)
  {
    if (v8 <= 3)
    {
      v14 = ((v11 + ~(-1 << v9)) >> v9) + 1;
      if (HIWORD(v14))
      {
        v12 = 4u;
      }
      else if (v14 >= 0x100)
      {
        v12 = 2;
      }
      else
      {
        v12 = v14 > 1;
      }
    }
    else
    {
      v12 = 1u;
    }
  }
  else
  {
    v12 = 0;
  }
  if (v7 < a2)
  {
    v13 = ~v7 + a2;
    if (v8 < 4)
    {
      if ((_DWORD)v8)
      {
        v15 = v13 & ~(-1 << v9);
        bzero(a1, v8);
        if ((_DWORD)v8 == 3)
        {
          *a1 = v15;
          *((_BYTE *)a1 + 2) = BYTE2(v15);
        }
        else if ((_DWORD)v8 == 2)
        {
          *a1 = v15;
        }
        else
        {
          *(_BYTE *)a1 = v15;
        }
      }
    }
    else
    {
      bzero(a1, v8);
      *(_DWORD *)a1 = v13;
    }
    __asm { BR              X10 }
  }
  __asm { BR              X10 }
}

uint64_t type metadata accessor for UncheckedSendable(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for UncheckedSendable);
}

_QWORD *sub_20D13496C(_QWORD *a1, _QWORD *a2, int *a3)
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
  char *v15;
  char *v16;
  uint64_t v17;
  char v18;
  uint64_t v19;
  char *v20;
  char *v21;
  uint64_t v22;
  char v23;
  uint64_t v24;
  char *v25;
  char *v26;
  uint64_t v27;
  uint64_t v28;
  char v29;
  uint64_t v30;
  char *v31;
  char *v32;
  uint64_t v33;
  uint64_t v34;
  _QWORD *v35;
  _QWORD *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  _QWORD *v40;
  _QWORD *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  _QWORD *v45;
  _QWORD *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  char *v51;
  char *v52;
  uint64_t v53;
  _QWORD *v54;
  _QWORD *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  void (*v59)(char *, char *, uint64_t);
  char *v61;
  char *v62;

  v5 = *(_DWORD *)(*((_QWORD *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v8 = *a2;
    *a1 = *a2;
    a1 = (_QWORD *)(v8 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_2549A5EB0);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v7 = sub_20D137BDC();
      (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a1, a2, v7);
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
    sub_20D134E10(*(_QWORD *)v11, v13);
    *(_QWORD *)v10 = v12;
    v10[8] = v13;
    v14 = a3[6];
    v15 = (char *)a1 + v14;
    v16 = (char *)a2 + v14;
    v17 = *(_QWORD *)v16;
    v18 = v16[8];
    sub_20D134E10(*(_QWORD *)v16, v18);
    *(_QWORD *)v15 = v17;
    v15[8] = v18;
    v19 = a3[7];
    v20 = (char *)a1 + v19;
    v21 = (char *)a2 + v19;
    v22 = *(_QWORD *)v21;
    v23 = v21[8];
    sub_20D134E10(*(_QWORD *)v21, v23);
    *(_QWORD *)v20 = v22;
    v20[8] = v23;
    v24 = a3[8];
    v25 = (char *)a1 + v24;
    v26 = (char *)a2 + v24;
    v27 = *(_QWORD *)v26;
    v28 = *((_QWORD *)v26 + 1);
    v29 = v26[16];
    sub_20D134E1C(*(_QWORD *)v26, v28, v29);
    *(_QWORD *)v25 = v27;
    *((_QWORD *)v25 + 1) = v28;
    v25[16] = v29;
    v30 = a3[9];
    v31 = (char *)a1 + v30;
    v32 = (char *)a2 + v30;
    v33 = *(_QWORD *)v32;
    LOBYTE(v28) = v32[8];
    sub_20D134E10(*(_QWORD *)v32, v28);
    *(_QWORD *)v31 = v33;
    v31[8] = v28;
    v34 = a3[10];
    v35 = (_QWORD *)((char *)a1 + v34);
    v36 = (_QWORD *)((char *)a2 + v34);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2549A5EB8);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v37 = sub_20D137D80();
      if (__swift_getEnumTagSinglePayload((uint64_t)v36, 1, v37))
      {
        v38 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549A5EC0);
        memcpy(v35, v36, *(_QWORD *)(*(_QWORD *)(v38 - 8) + 64));
      }
      else
      {
        (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v37 - 8) + 16))(v35, v36, v37);
        __swift_storeEnumTagSinglePayload((uint64_t)v35, 0, 1, v37);
      }
    }
    else
    {
      *v35 = *v36;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
    v39 = a3[11];
    v40 = (_QWORD *)((char *)a1 + v39);
    v41 = (_QWORD *)((char *)a2 + v39);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v42 = sub_20D137D80();
      if (__swift_getEnumTagSinglePayload((uint64_t)v41, 1, v42))
      {
        v43 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549A5EC0);
        memcpy(v40, v41, *(_QWORD *)(*(_QWORD *)(v43 - 8) + 64));
      }
      else
      {
        (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v42 - 8) + 16))(v40, v41, v42);
        __swift_storeEnumTagSinglePayload((uint64_t)v40, 0, 1, v42);
      }
    }
    else
    {
      *v40 = *v41;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
    v44 = a3[12];
    v45 = (_QWORD *)((char *)a1 + v44);
    v46 = (_QWORD *)((char *)a2 + v44);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2549A5EC8);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v47 = sub_20D137D68();
      if (__swift_getEnumTagSinglePayload((uint64_t)v46, 1, v47))
      {
        v48 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549A5ED0);
        memcpy(v45, v46, *(_QWORD *)(*(_QWORD *)(v48 - 8) + 64));
      }
      else
      {
        (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v47 - 8) + 16))(v45, v46, v47);
        __swift_storeEnumTagSinglePayload((uint64_t)v45, 0, 1, v47);
      }
    }
    else
    {
      *v45 = *v46;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
    v49 = a3[13];
    v50 = a3[14];
    v51 = (char *)a1 + v49;
    v52 = (char *)a2 + v49;
    v53 = *((_QWORD *)v52 + 1);
    *(_QWORD *)v51 = *(_QWORD *)v52;
    *((_QWORD *)v51 + 1) = v53;
    v51[16] = v52[16];
    v54 = (_QWORD *)((char *)a1 + v50);
    v55 = (_QWORD *)((char *)a2 + v50);
    v56 = v55[1];
    *v54 = *v55;
    v54[1] = v56;
    v54[2] = v55[2];
    v57 = a3[15];
    v61 = (char *)a2 + v57;
    v62 = (char *)a1 + v57;
    v58 = sub_20D137D5C();
    v59 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v58 - 8) + 16);
    swift_retain();
    swift_retain();
    swift_retain();
    swift_retain();
    swift_bridgeObjectRetain();
    v59(v62, v61, v58);
    *((_BYTE *)a1 + a3[16]) = *((_BYTE *)a2 + a3[16]);
  }
  return a1;
}

uint64_t sub_20D134E10(uint64_t a1, char a2)
{
  uint64_t result;

  if ((a2 & 1) == 0)
    return swift_retain();
  return result;
}

uint64_t sub_20D134E1C(uint64_t a1, uint64_t a2, char a3)
{
  if ((a3 & 1) != 0)
    return swift_bridgeObjectRetain();
  else
    return swift_retain();
}

uint64_t sub_20D134E2C(uint64_t a1, int *a2)
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

  __swift_instantiateConcreteTypeFromMangledName(&qword_2549A5EB0);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v4 = sub_20D137BDC();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(a1, v4);
  }
  else
  {
    swift_release();
  }
  sub_20D135090(*(_QWORD *)(a1 + a2[5]), *(_BYTE *)(a1 + a2[5] + 8));
  sub_20D135090(*(_QWORD *)(a1 + a2[6]), *(_BYTE *)(a1 + a2[6] + 8));
  sub_20D135090(*(_QWORD *)(a1 + a2[7]), *(_BYTE *)(a1 + a2[7] + 8));
  sub_20D13509C(*(_QWORD *)(a1 + a2[8]), *(_QWORD *)(a1 + a2[8] + 8), *(_BYTE *)(a1 + a2[8] + 16));
  sub_20D135090(*(_QWORD *)(a1 + a2[9]), *(_BYTE *)(a1 + a2[9] + 8));
  v5 = a1 + a2[10];
  __swift_instantiateConcreteTypeFromMangledName(&qword_2549A5EB8);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v6 = sub_20D137D80();
    if (!__swift_getEnumTagSinglePayload(v5, 1, v6))
      (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 8))(v5, v6);
  }
  else
  {
    swift_release();
  }
  v7 = a1 + a2[11];
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v8 = sub_20D137D80();
    if (!__swift_getEnumTagSinglePayload(v7, 1, v8))
      (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 8))(v7, v8);
  }
  else
  {
    swift_release();
  }
  v9 = a1 + a2[12];
  __swift_instantiateConcreteTypeFromMangledName(&qword_2549A5EC8);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v10 = sub_20D137D68();
    if (!__swift_getEnumTagSinglePayload(v9, 1, v10))
      (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 8))(v9, v10);
  }
  else
  {
    swift_release();
  }
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  v11 = a1 + a2[15];
  v12 = sub_20D137D5C();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 8))(v11, v12);
}

uint64_t sub_20D135090(uint64_t a1, char a2)
{
  uint64_t result;

  if ((a2 & 1) == 0)
    return swift_release();
  return result;
}

uint64_t sub_20D13509C(uint64_t a1, uint64_t a2, char a3)
{
  if ((a3 & 1) != 0)
    return swift_bridgeObjectRelease();
  else
    return swift_release();
}

_QWORD *sub_20D1350AC(_QWORD *a1, _QWORD *a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  char *v8;
  char *v9;
  uint64_t v10;
  char v11;
  uint64_t v12;
  char *v13;
  char *v14;
  uint64_t v15;
  char v16;
  uint64_t v17;
  char *v18;
  char *v19;
  uint64_t v20;
  char v21;
  uint64_t v22;
  char *v23;
  char *v24;
  uint64_t v25;
  uint64_t v26;
  char v27;
  uint64_t v28;
  char *v29;
  char *v30;
  uint64_t v31;
  uint64_t v32;
  _QWORD *v33;
  _QWORD *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  _QWORD *v38;
  _QWORD *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  _QWORD *v43;
  _QWORD *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  char *v49;
  char *v50;
  uint64_t v51;
  _QWORD *v52;
  _QWORD *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  void (*v57)(char *, char *, uint64_t);
  char *v59;
  char *v60;

  __swift_instantiateConcreteTypeFromMangledName(&qword_2549A5EB0);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v6 = sub_20D137BDC();
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
  sub_20D134E10(*(_QWORD *)v9, v11);
  *(_QWORD *)v8 = v10;
  v8[8] = v11;
  v12 = a3[6];
  v13 = (char *)a1 + v12;
  v14 = (char *)a2 + v12;
  v15 = *(_QWORD *)v14;
  v16 = v14[8];
  sub_20D134E10(*(_QWORD *)v14, v16);
  *(_QWORD *)v13 = v15;
  v13[8] = v16;
  v17 = a3[7];
  v18 = (char *)a1 + v17;
  v19 = (char *)a2 + v17;
  v20 = *(_QWORD *)v19;
  v21 = v19[8];
  sub_20D134E10(*(_QWORD *)v19, v21);
  *(_QWORD *)v18 = v20;
  v18[8] = v21;
  v22 = a3[8];
  v23 = (char *)a1 + v22;
  v24 = (char *)a2 + v22;
  v25 = *(_QWORD *)v24;
  v26 = *((_QWORD *)v24 + 1);
  v27 = v24[16];
  sub_20D134E1C(*(_QWORD *)v24, v26, v27);
  *(_QWORD *)v23 = v25;
  *((_QWORD *)v23 + 1) = v26;
  v23[16] = v27;
  v28 = a3[9];
  v29 = (char *)a1 + v28;
  v30 = (char *)a2 + v28;
  v31 = *(_QWORD *)v30;
  LOBYTE(v26) = v30[8];
  sub_20D134E10(*(_QWORD *)v30, v26);
  *(_QWORD *)v29 = v31;
  v29[8] = v26;
  v32 = a3[10];
  v33 = (_QWORD *)((char *)a1 + v32);
  v34 = (_QWORD *)((char *)a2 + v32);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2549A5EB8);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v35 = sub_20D137D80();
    if (__swift_getEnumTagSinglePayload((uint64_t)v34, 1, v35))
    {
      v36 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549A5EC0);
      memcpy(v33, v34, *(_QWORD *)(*(_QWORD *)(v36 - 8) + 64));
    }
    else
    {
      (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v35 - 8) + 16))(v33, v34, v35);
      __swift_storeEnumTagSinglePayload((uint64_t)v33, 0, 1, v35);
    }
  }
  else
  {
    *v33 = *v34;
    swift_retain();
  }
  swift_storeEnumTagMultiPayload();
  v37 = a3[11];
  v38 = (_QWORD *)((char *)a1 + v37);
  v39 = (_QWORD *)((char *)a2 + v37);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v40 = sub_20D137D80();
    if (__swift_getEnumTagSinglePayload((uint64_t)v39, 1, v40))
    {
      v41 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549A5EC0);
      memcpy(v38, v39, *(_QWORD *)(*(_QWORD *)(v41 - 8) + 64));
    }
    else
    {
      (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v40 - 8) + 16))(v38, v39, v40);
      __swift_storeEnumTagSinglePayload((uint64_t)v38, 0, 1, v40);
    }
  }
  else
  {
    *v38 = *v39;
    swift_retain();
  }
  swift_storeEnumTagMultiPayload();
  v42 = a3[12];
  v43 = (_QWORD *)((char *)a1 + v42);
  v44 = (_QWORD *)((char *)a2 + v42);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2549A5EC8);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v45 = sub_20D137D68();
    if (__swift_getEnumTagSinglePayload((uint64_t)v44, 1, v45))
    {
      v46 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549A5ED0);
      memcpy(v43, v44, *(_QWORD *)(*(_QWORD *)(v46 - 8) + 64));
    }
    else
    {
      (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v45 - 8) + 16))(v43, v44, v45);
      __swift_storeEnumTagSinglePayload((uint64_t)v43, 0, 1, v45);
    }
  }
  else
  {
    *v43 = *v44;
    swift_retain();
  }
  swift_storeEnumTagMultiPayload();
  v47 = a3[13];
  v48 = a3[14];
  v49 = (char *)a1 + v47;
  v50 = (char *)a2 + v47;
  v51 = *((_QWORD *)v50 + 1);
  *(_QWORD *)v49 = *(_QWORD *)v50;
  *((_QWORD *)v49 + 1) = v51;
  v49[16] = v50[16];
  v52 = (_QWORD *)((char *)a1 + v48);
  v53 = (_QWORD *)((char *)a2 + v48);
  v54 = v53[1];
  *v52 = *v53;
  v52[1] = v54;
  v52[2] = v53[2];
  v55 = a3[15];
  v59 = (char *)a2 + v55;
  v60 = (char *)a1 + v55;
  v56 = sub_20D137D5C();
  v57 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v56 - 8) + 16);
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_bridgeObjectRetain();
  v57(v60, v59, v56);
  *((_BYTE *)a1 + a3[16]) = *((_BYTE *)a2 + a3[16]);
  return a1;
}

_QWORD *sub_20D135524(_QWORD *a1, _QWORD *a2, int *a3)
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
  char *v15;
  char *v16;
  uint64_t v17;
  char v18;
  uint64_t v19;
  char v20;
  uint64_t v21;
  char *v22;
  char *v23;
  uint64_t v24;
  char v25;
  uint64_t v26;
  char v27;
  uint64_t v28;
  char *v29;
  char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  char v35;
  uint64_t v36;
  char *v37;
  char *v38;
  uint64_t v39;
  uint64_t v40;
  char v41;
  uint64_t v42;
  _QWORD *v43;
  _QWORD *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  _QWORD *v48;
  _QWORD *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  _QWORD *v53;
  _QWORD *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  char *v58;
  char *v59;
  uint64_t v60;
  char *v61;
  char *v62;
  uint64_t v63;
  char *v64;
  char *v65;
  uint64_t v66;

  if (a1 != a2)
  {
    sub_20D136B24((uint64_t)a1, &qword_2549A5EB0);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2549A5EB0);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v6 = sub_20D137BDC();
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
  sub_20D134E10(*(_QWORD *)v9, v11);
  v12 = *(_QWORD *)v8;
  v13 = v8[8];
  *(_QWORD *)v8 = v10;
  v8[8] = v11;
  sub_20D135090(v12, v13);
  v14 = a3[6];
  v15 = (char *)a1 + v14;
  v16 = (char *)a2 + v14;
  v17 = *(_QWORD *)v16;
  v18 = v16[8];
  sub_20D134E10(*(_QWORD *)v16, v18);
  v19 = *(_QWORD *)v15;
  v20 = v15[8];
  *(_QWORD *)v15 = v17;
  v15[8] = v18;
  sub_20D135090(v19, v20);
  v21 = a3[7];
  v22 = (char *)a1 + v21;
  v23 = (char *)a2 + v21;
  v24 = *(_QWORD *)v23;
  v25 = v23[8];
  sub_20D134E10(*(_QWORD *)v23, v25);
  v26 = *(_QWORD *)v22;
  v27 = v22[8];
  *(_QWORD *)v22 = v24;
  v22[8] = v25;
  sub_20D135090(v26, v27);
  v28 = a3[8];
  v29 = (char *)a1 + v28;
  v30 = (char *)a2 + v28;
  v31 = *(_QWORD *)v30;
  v32 = *((_QWORD *)v30 + 1);
  LOBYTE(v22) = v30[16];
  sub_20D134E1C(*(_QWORD *)v30, v32, (char)v22);
  v33 = *(_QWORD *)v29;
  v34 = *((_QWORD *)v29 + 1);
  v35 = v29[16];
  *(_QWORD *)v29 = v31;
  *((_QWORD *)v29 + 1) = v32;
  v29[16] = (char)v22;
  sub_20D13509C(v33, v34, v35);
  v36 = a3[9];
  v37 = (char *)a1 + v36;
  v38 = (char *)a2 + v36;
  v39 = *(_QWORD *)v38;
  LOBYTE(v32) = v38[8];
  sub_20D134E10(*(_QWORD *)v38, v32);
  v40 = *(_QWORD *)v37;
  v41 = v37[8];
  *(_QWORD *)v37 = v39;
  v37[8] = v32;
  sub_20D135090(v40, v41);
  if (a1 != a2)
  {
    v42 = a3[10];
    v43 = (_QWORD *)((char *)a1 + v42);
    v44 = (_QWORD *)((char *)a2 + v42);
    sub_20D136B24((uint64_t)a1 + v42, &qword_2549A5EB8);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2549A5EB8);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v45 = sub_20D137D80();
      if (__swift_getEnumTagSinglePayload((uint64_t)v44, 1, v45))
      {
        v46 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549A5EC0);
        memcpy(v43, v44, *(_QWORD *)(*(_QWORD *)(v46 - 8) + 64));
      }
      else
      {
        (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v45 - 8) + 16))(v43, v44, v45);
        __swift_storeEnumTagSinglePayload((uint64_t)v43, 0, 1, v45);
      }
    }
    else
    {
      *v43 = *v44;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
    v47 = a3[11];
    v48 = (_QWORD *)((char *)a1 + v47);
    v49 = (_QWORD *)((char *)a2 + v47);
    sub_20D136B24((uint64_t)a1 + v47, &qword_2549A5EB8);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2549A5EB8);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v50 = sub_20D137D80();
      if (__swift_getEnumTagSinglePayload((uint64_t)v49, 1, v50))
      {
        v51 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549A5EC0);
        memcpy(v48, v49, *(_QWORD *)(*(_QWORD *)(v51 - 8) + 64));
      }
      else
      {
        (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v50 - 8) + 16))(v48, v49, v50);
        __swift_storeEnumTagSinglePayload((uint64_t)v48, 0, 1, v50);
      }
    }
    else
    {
      *v48 = *v49;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
    v52 = a3[12];
    v53 = (_QWORD *)((char *)a1 + v52);
    v54 = (_QWORD *)((char *)a2 + v52);
    sub_20D136B24((uint64_t)a1 + v52, &qword_2549A5EC8);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2549A5EC8);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v55 = sub_20D137D68();
      if (__swift_getEnumTagSinglePayload((uint64_t)v54, 1, v55))
      {
        v56 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549A5ED0);
        memcpy(v53, v54, *(_QWORD *)(*(_QWORD *)(v56 - 8) + 64));
      }
      else
      {
        (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v55 - 8) + 16))(v53, v54, v55);
        __swift_storeEnumTagSinglePayload((uint64_t)v53, 0, 1, v55);
      }
    }
    else
    {
      *v53 = *v54;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
  }
  v57 = a3[13];
  v58 = (char *)a1 + v57;
  v59 = (char *)a2 + v57;
  *(_QWORD *)((char *)a1 + v57) = *(_QWORD *)((char *)a2 + v57);
  swift_retain();
  swift_release();
  *((_QWORD *)v58 + 1) = *((_QWORD *)v59 + 1);
  swift_retain();
  swift_release();
  v58[16] = v59[16];
  v60 = a3[14];
  v61 = (char *)a1 + v60;
  v62 = (char *)a2 + v60;
  *(_QWORD *)((char *)a1 + v60) = *(_QWORD *)((char *)a2 + v60);
  swift_retain();
  swift_release();
  *((_QWORD *)v61 + 1) = *((_QWORD *)v62 + 1);
  swift_retain();
  swift_release();
  *((_QWORD *)v61 + 2) = *((_QWORD *)v62 + 2);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v63 = a3[15];
  v64 = (char *)a1 + v63;
  v65 = (char *)a2 + v63;
  v66 = sub_20D137D5C();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v66 - 8) + 24))(v64, v65, v66);
  *((_BYTE *)a1 + a3[16]) = *((_BYTE *)a2 + a3[16]);
  return a1;
}

char *sub_20D135A60(char *a1, char *a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  char *v11;
  char *v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  char *v17;
  char *v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  char *v23;
  char *v24;
  char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  char *v30;
  char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  char *v35;
  char *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  char *v42;
  char *v43;
  __int128 v44;
  char *v45;
  char *v46;
  uint64_t v47;
  char *v48;
  char *v49;
  uint64_t v50;

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549A5EB0);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v7 = sub_20D137BDC();
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
  v12 = &a1[v9];
  v13 = &a2[v9];
  *(_QWORD *)v12 = *(_QWORD *)v13;
  v12[8] = v13[8];
  v14 = a3[7];
  v15 = a3[8];
  v16 = &a1[v14];
  v17 = &a2[v14];
  *(_QWORD *)v16 = *(_QWORD *)v17;
  v16[8] = v17[8];
  v18 = &a1[v15];
  v19 = &a2[v15];
  *(_OWORD *)v18 = *(_OWORD *)v19;
  v18[16] = v19[16];
  v20 = a3[9];
  v21 = a3[10];
  v22 = &a1[v20];
  v23 = &a2[v20];
  v22[8] = v23[8];
  *(_QWORD *)v22 = *(_QWORD *)v23;
  v24 = &a1[v21];
  v25 = &a2[v21];
  v26 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549A5EB8);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v27 = sub_20D137D80();
    if (__swift_getEnumTagSinglePayload((uint64_t)v25, 1, v27))
    {
      v28 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549A5EC0);
      memcpy(v24, v25, *(_QWORD *)(*(_QWORD *)(v28 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v27 - 8) + 32))(v24, v25, v27);
      __swift_storeEnumTagSinglePayload((uint64_t)v24, 0, 1, v27);
    }
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(v24, v25, *(_QWORD *)(*(_QWORD *)(v26 - 8) + 64));
  }
  v29 = a3[11];
  v30 = &a1[v29];
  v31 = &a2[v29];
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v32 = sub_20D137D80();
    if (__swift_getEnumTagSinglePayload((uint64_t)v31, 1, v32))
    {
      v33 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549A5EC0);
      memcpy(v30, v31, *(_QWORD *)(*(_QWORD *)(v33 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v32 - 8) + 32))(v30, v31, v32);
      __swift_storeEnumTagSinglePayload((uint64_t)v30, 0, 1, v32);
    }
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(v30, v31, *(_QWORD *)(*(_QWORD *)(v26 - 8) + 64));
  }
  v34 = a3[12];
  v35 = &a1[v34];
  v36 = &a2[v34];
  v37 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549A5EC8);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v38 = sub_20D137D68();
    if (__swift_getEnumTagSinglePayload((uint64_t)v36, 1, v38))
    {
      v39 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549A5ED0);
      memcpy(v35, v36, *(_QWORD *)(*(_QWORD *)(v39 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v38 - 8) + 32))(v35, v36, v38);
      __swift_storeEnumTagSinglePayload((uint64_t)v35, 0, 1, v38);
    }
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(v35, v36, *(_QWORD *)(*(_QWORD *)(v37 - 8) + 64));
  }
  v40 = a3[13];
  v41 = a3[14];
  v42 = &a1[v40];
  v43 = &a2[v40];
  v44 = *(_OWORD *)v43;
  v42[16] = v43[16];
  *(_OWORD *)v42 = v44;
  v45 = &a1[v41];
  v46 = &a2[v41];
  *(_OWORD *)v45 = *(_OWORD *)v46;
  *((_QWORD *)v45 + 2) = *((_QWORD *)v46 + 2);
  v47 = a3[15];
  v48 = &a1[v47];
  v49 = &a2[v47];
  v50 = sub_20D137D5C();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v50 - 8) + 32))(v48, v49, v50);
  a1[a3[16]] = a2[a3[16]];
  return a1;
}

char *sub_20D135E40(char *a1, char *a2, int *a3)
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
  uint64_t v17;
  uint64_t v18;
  char v19;
  uint64_t v20;
  char *v21;
  char *v22;
  uint64_t v23;
  uint64_t v24;
  char v25;
  uint64_t v26;
  char *v27;
  char *v28;
  char v29;
  uint64_t v30;
  uint64_t v31;
  char v32;
  uint64_t v33;
  char *v34;
  char *v35;
  uint64_t v36;
  uint64_t v37;
  char v38;
  uint64_t v39;
  char *v40;
  char *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  char *v46;
  char *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  char *v52;
  char *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  char *v58;
  char *v59;
  uint64_t v60;
  char *v61;
  char *v62;
  uint64_t v63;
  char *v64;
  char *v65;
  uint64_t v66;

  if (a1 != a2)
  {
    sub_20D136B24((uint64_t)a1, &qword_2549A5EB0);
    v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549A5EB0);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v7 = sub_20D137BDC();
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
  sub_20D135090(v12, v13);
  v14 = a3[6];
  v15 = &a1[v14];
  v16 = &a2[v14];
  v17 = *(_QWORD *)v16;
  LOBYTE(v16) = v16[8];
  v18 = *(_QWORD *)v15;
  v19 = v15[8];
  *(_QWORD *)v15 = v17;
  v15[8] = (char)v16;
  sub_20D135090(v18, v19);
  v20 = a3[7];
  v21 = &a1[v20];
  v22 = &a2[v20];
  v23 = *(_QWORD *)v22;
  LOBYTE(v22) = v22[8];
  v24 = *(_QWORD *)v21;
  v25 = v21[8];
  *(_QWORD *)v21 = v23;
  v21[8] = (char)v22;
  sub_20D135090(v24, v25);
  v26 = a3[8];
  v27 = &a1[v26];
  v28 = &a2[v26];
  v29 = v28[16];
  v30 = *(_QWORD *)v27;
  v31 = *((_QWORD *)v27 + 1);
  v32 = v27[16];
  *(_OWORD *)v27 = *(_OWORD *)v28;
  v27[16] = v29;
  sub_20D13509C(v30, v31, v32);
  v33 = a3[9];
  v34 = &a1[v33];
  v35 = &a2[v33];
  v36 = *(_QWORD *)v35;
  LOBYTE(v35) = v35[8];
  v37 = *(_QWORD *)v34;
  v38 = v34[8];
  *(_QWORD *)v34 = v36;
  v34[8] = (char)v35;
  sub_20D135090(v37, v38);
  if (a1 != a2)
  {
    v39 = a3[10];
    v40 = &a1[v39];
    v41 = &a2[v39];
    sub_20D136B24((uint64_t)&a1[v39], &qword_2549A5EB8);
    v42 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549A5EB8);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v43 = sub_20D137D80();
      if (__swift_getEnumTagSinglePayload((uint64_t)v41, 1, v43))
      {
        v44 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549A5EC0);
        memcpy(v40, v41, *(_QWORD *)(*(_QWORD *)(v44 - 8) + 64));
      }
      else
      {
        (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v43 - 8) + 32))(v40, v41, v43);
        __swift_storeEnumTagSinglePayload((uint64_t)v40, 0, 1, v43);
      }
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(v40, v41, *(_QWORD *)(*(_QWORD *)(v42 - 8) + 64));
    }
    v45 = a3[11];
    v46 = &a1[v45];
    v47 = &a2[v45];
    sub_20D136B24((uint64_t)&a1[v45], &qword_2549A5EB8);
    v48 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549A5EB8);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v49 = sub_20D137D80();
      if (__swift_getEnumTagSinglePayload((uint64_t)v47, 1, v49))
      {
        v50 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549A5EC0);
        memcpy(v46, v47, *(_QWORD *)(*(_QWORD *)(v50 - 8) + 64));
      }
      else
      {
        (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v49 - 8) + 32))(v46, v47, v49);
        __swift_storeEnumTagSinglePayload((uint64_t)v46, 0, 1, v49);
      }
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(v46, v47, *(_QWORD *)(*(_QWORD *)(v48 - 8) + 64));
    }
    v51 = a3[12];
    v52 = &a1[v51];
    v53 = &a2[v51];
    sub_20D136B24((uint64_t)&a1[v51], &qword_2549A5EC8);
    v54 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549A5EC8);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v55 = sub_20D137D68();
      if (__swift_getEnumTagSinglePayload((uint64_t)v53, 1, v55))
      {
        v56 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549A5ED0);
        memcpy(v52, v53, *(_QWORD *)(*(_QWORD *)(v56 - 8) + 64));
      }
      else
      {
        (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v55 - 8) + 32))(v52, v53, v55);
        __swift_storeEnumTagSinglePayload((uint64_t)v52, 0, 1, v55);
      }
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(v52, v53, *(_QWORD *)(*(_QWORD *)(v54 - 8) + 64));
    }
  }
  v57 = a3[13];
  v58 = &a1[v57];
  v59 = &a2[v57];
  *(_QWORD *)&a1[v57] = *(_QWORD *)&a2[v57];
  swift_release();
  *((_QWORD *)v58 + 1) = *((_QWORD *)v59 + 1);
  swift_release();
  v58[16] = v59[16];
  v60 = a3[14];
  v61 = &a1[v60];
  v62 = &a2[v60];
  *(_QWORD *)&a1[v60] = *(_QWORD *)&a2[v60];
  swift_release();
  *((_QWORD *)v61 + 1) = *((_QWORD *)v62 + 1);
  swift_release();
  *((_QWORD *)v61 + 2) = *((_QWORD *)v62 + 2);
  swift_bridgeObjectRelease();
  v63 = a3[15];
  v64 = &a1[v63];
  v65 = &a2[v63];
  v66 = sub_20D137D5C();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v66 - 8) + 40))(v64, v65, v66);
  a1[a3[16]] = a2[a3[16]];
  return a1;
}

uint64_t sub_20D136304()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

void sub_20D136310(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char v9;
  uint64_t v10;
  uint64_t v11;
  char v12;
  uint64_t v13;

  __swift_instantiateConcreteTypeFromMangledName(&qword_2549A5ED8);
  OUTLINED_FUNCTION_93();
  if (v9)
  {
    v7 = v6;
    v8 = a1;
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_2549A5EE0);
    OUTLINED_FUNCTION_93();
    if (v9)
    {
      v7 = v10;
      v11 = a3[10];
    }
    else
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_2549A5EE8);
      OUTLINED_FUNCTION_93();
      if (v12)
      {
        v7 = v13;
        v11 = a3[12];
      }
      else
      {
        if ((_DWORD)a2 == 0x7FFFFFFF)
        {
          OUTLINED_FUNCTION_19_0();
          return;
        }
        v7 = OUTLINED_FUNCTION_7_0();
        v11 = a3[15];
      }
    }
    v8 = a1 + v11;
  }
  OUTLINED_FUNCTION_48_0(v8, a2, v7);
}

uint64_t sub_20D1363D8()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

void sub_20D1363E4()
{
  uint64_t v0;
  uint64_t v1;
  int *v2;
  int v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char v7;
  uint64_t v8;
  uint64_t v9;
  char v10;
  uint64_t v11;

  OUTLINED_FUNCTION_133();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2549A5ED8);
  OUTLINED_FUNCTION_49_0();
  if (v7)
  {
    v5 = v4;
    v6 = v1;
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_2549A5EE0);
    OUTLINED_FUNCTION_49_0();
    if (v7)
    {
      v5 = v8;
      v9 = v2[10];
    }
    else
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_2549A5EE8);
      OUTLINED_FUNCTION_49_0();
      if (v10)
      {
        v5 = v11;
        v9 = v2[12];
      }
      else
      {
        if (v3 == 0x7FFFFFFF)
        {
          *(_QWORD *)(v1 + v2[13] + 8) = (v0 - 1);
          OUTLINED_FUNCTION_19_0();
          return;
        }
        v5 = OUTLINED_FUNCTION_7_0();
        v9 = v2[15];
      }
    }
    v6 = v1 + v9;
  }
  OUTLINED_FUNCTION_18_0(v6, v0, v0, v5);
}

void sub_20D13649C()
{
  unint64_t v0;
  unint64_t v1;
  unint64_t v2;
  unint64_t v3;

  sub_20D1365BC(319, &qword_2549A5F00, (void (*)(uint64_t))MEMORY[0x24BDE3910]);
  if (v0 <= 0x3F)
  {
    sub_20D1365FC(319, &qword_2549A5F08, &qword_2549A5EC0);
    if (v1 <= 0x3F)
    {
      sub_20D1365FC(319, &qword_2549A5F10, &qword_2549A5ED0);
      if (v2 <= 0x3F)
      {
        sub_20D137D5C();
        if (v3 <= 0x3F)
          swift_initStructMetadata();
      }
    }
  }
}

void sub_20D1365BC(uint64_t a1, unint64_t *a2, void (*a3)(uint64_t))
{
  unint64_t v4;
  uint64_t v5;

  if (!*a2)
  {
    a3(255);
    v4 = OUTLINED_FUNCTION_131();
    if (!v5)
      atomic_store(v4, a2);
  }
  OUTLINED_FUNCTION_3();
}

void sub_20D1365FC(uint64_t a1, unint64_t *a2, uint64_t *a3)
{
  unint64_t v4;
  uint64_t v5;

  if (!*a2)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(a3);
    v4 = OUTLINED_FUNCTION_131();
    if (!v5)
      atomic_store(v4, a2);
  }
  OUTLINED_FUNCTION_3();
}

void sub_20D13663C()
{
  sub_20D124C24(&qword_2549A5C90, (void (*)(uint64_t))type metadata accessor for PhotosPickerViewController);
}

uint64_t sub_20D136668(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for PhotosPickerViewController(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
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

uint64_t sub_20D1366D0(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

void sub_20D13670C(uint64_t a1, unint64_t *a2)
{
  if (!*a2)
  {
    objc_opt_self();
    atomic_store(swift_getObjCClassMetadata(), a2);
  }
  OUTLINED_FUNCTION_3();
}

unint64_t sub_20D136740()
{
  unint64_t result;

  result = qword_2549A5F88;
  if (!qword_2549A5F88)
  {
    result = MEMORY[0x212B9D8E4](&unk_20D1397D4, &type metadata for PhotosPickerSuggestionGroupEnvironmentKey);
    atomic_store(result, (unint64_t *)&qword_2549A5F88);
  }
  return result;
}

unint64_t sub_20D13677C()
{
  unint64_t result;

  result = qword_2549A5F90;
  if (!qword_2549A5F90)
  {
    result = MEMORY[0x212B9D8E4](&unk_20D13979C, &type metadata for PhotosPickerAlbumsConfigurationEnvironmentKey);
    atomic_store(result, (unint64_t *)&qword_2549A5F90);
  }
  return result;
}

unint64_t sub_20D1367B8()
{
  unint64_t result;

  result = qword_2549A5F98;
  if (!qword_2549A5F98)
  {
    result = MEMORY[0x212B9D8E4](&unk_20D139764, &type metadata for PhotosPickerContainerIdentifierEnvironmentKey);
    atomic_store(result, (unint64_t *)&qword_2549A5F98);
  }
  return result;
}

unint64_t sub_20D1367F4()
{
  unint64_t result;

  result = qword_2549A5FA0;
  if (!qword_2549A5FA0)
  {
    result = MEMORY[0x212B9D8E4](&unk_20D13972C, &type metadata for PhotosPickerPeopleConfigurationEnvironmentKey);
    atomic_store(result, (unint64_t *)&qword_2549A5FA0);
  }
  return result;
}

unint64_t sub_20D136830()
{
  unint64_t result;

  result = qword_2549A5FA8;
  if (!qword_2549A5FA8)
  {
    result = MEMORY[0x212B9D8E4](&unk_20D1396F4, &type metadata for PhotosPickerSourceTypeEnvironmentKey);
    atomic_store(result, (unint64_t *)&qword_2549A5FA8);
  }
  return result;
}

unint64_t sub_20D13686C()
{
  unint64_t result;

  result = qword_2549A5FB0;
  if (!qword_2549A5FB0)
  {
    result = MEMORY[0x212B9D8E4](&unk_20D1396BC, &type metadata for PhotosPickerDisabledPrivateCapabilitiesEnvironmentKey);
    atomic_store(result, (unint64_t *)&qword_2549A5FB0);
  }
  return result;
}

unint64_t sub_20D1368A8()
{
  unint64_t result;

  result = qword_2549A5FB8;
  if (!qword_2549A5FB8)
  {
    result = MEMORY[0x212B9D8E4](&unk_20D139684, &type metadata for PhotosPickerDisabledCapabilitiesEnvironmentKey);
    atomic_store(result, (unint64_t *)&qword_2549A5FB8);
  }
  return result;
}

unint64_t sub_20D1368E4()
{
  unint64_t result;

  result = qword_2549A5FC0;
  if (!qword_2549A5FC0)
  {
    result = MEMORY[0x212B9D8E4](&unk_20D13964C, &type metadata for PhotosPickerEdgesWithoutContentMarginsEnvironmentKey);
    atomic_store(result, (unint64_t *)&qword_2549A5FC0);
  }
  return result;
}

unint64_t sub_20D136920()
{
  unint64_t result;

  result = qword_2549A5FC8;
  if (!qword_2549A5FC8)
  {
    result = MEMORY[0x212B9D8E4](&unk_20D139614, &type metadata for PhotosPickerModeEnvironmentKey);
    atomic_store(result, (unint64_t *)&qword_2549A5FC8);
  }
  return result;
}

unint64_t sub_20D13695C()
{
  unint64_t result;

  result = qword_2549A5FD0;
  if (!qword_2549A5FD0)
  {
    result = MEMORY[0x212B9D8E4](&unk_20D1395DC, &type metadata for PhotosPickerIsPresentationEnvironmentKey);
    atomic_store(result, (unint64_t *)&qword_2549A5FD0);
  }
  return result;
}

void sub_20D136998()
{
  sub_20D137948();
  OUTLINED_FUNCTION_3();
}

void sub_20D1369B4(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v3;
  uint64_t v4;
  void (*v5)(uint64_t, uint64_t);

  OUTLINED_FUNCTION_107(a1, a2, a3);
  v4 = OUTLINED_FUNCTION_128();
  v5(v4, v3);
  OUTLINED_FUNCTION_3();
}

uint64_t objectdestroy_11Tm()
{
  uint64_t v0;

  OUTLINED_FUNCTION_135();
  swift_release();
  OUTLINED_FUNCTION_77();
  if (*(_QWORD *)(v0 + 56))
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();

  }
  return swift_deallocObject();
}

uint64_t sub_20D136A44()
{
  uint64_t v0;
  uint64_t v1;
  unint64_t v2;

  v1 = *(_QWORD *)(OUTLINED_FUNCTION_7_0() - 8);
  v2 = (*(unsigned __int8 *)(v1 + 80) + 64) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80);
  swift_release();
  swift_release();
  OUTLINED_FUNCTION_77();
  swift_release();
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_22_0(v0 + v2, *(uint64_t (**)(uint64_t, uint64_t))(v1 + 8));
  return swift_deallocObject();
}

void sub_20D136AD0(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  unint64_t v4;

  v3 = *(_QWORD *)(OUTLINED_FUNCTION_7_0() - 8);
  v4 = (*(unsigned __int8 *)(v3 + 80) + 64) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  sub_20D12E5E4(*(_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 24), *(unsigned __int8 *)(v1 + 32), *(_QWORD *)(v1 + 40), *(_QWORD *)(v1 + 48), *(_QWORD *)(v1 + 56), v1 + v4, *(unsigned __int8 *)(v1 + v4 + *(_QWORD *)(v3 + 64)), a1);
}

void sub_20D136B24(uint64_t a1, uint64_t *a2)
{
  uint64_t v2;

  v2 = OUTLINED_FUNCTION_150(a1, a2);
  OUTLINED_FUNCTION_41(v2);
  OUTLINED_FUNCTION_3();
}

void sub_20D136B48(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v3;

  v3 = OUTLINED_FUNCTION_107(a1, a2, a3);
  OUTLINED_FUNCTION_50_0(v3);
  OUTLINED_FUNCTION_3();
}

uint64_t sub_20D136B68@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;

  return sub_20D1276E8(a1, *(_QWORD *)(v2 + 16), a2);
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

uint64_t sub_20D136BB0()
{
  uint64_t v0;

  sub_20D137F18();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2549A5F70);
  v0 = sub_20D137E64();
  OUTLINED_FUNCTION_41_0(*(_QWORD *)(v0 - 8));
  OUTLINED_FUNCTION_78_0();
  return OUTLINED_FUNCTION_47_0();
}

uint64_t sub_20D136C18(uint64_t a1)
{
  sub_20D137F18();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2549A5F70);
  sub_20D137E64();
  OUTLINED_FUNCTION_126();
  return sub_20D127CF4(a1);
}

uint64_t __swift_instantiateGenericMetadata(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _QWORD v6[3];

  v6[0] = a2;
  v6[1] = a3;
  v6[2] = a4;
  return MEMORY[0x212B9D878](a1, v6, a5);
}

ValueMetadata *type metadata accessor for PhotosPickerIsPresentationEnvironmentKey()
{
  return &type metadata for PhotosPickerIsPresentationEnvironmentKey;
}

ValueMetadata *type metadata accessor for PhotosPickerModeEnvironmentKey()
{
  return &type metadata for PhotosPickerModeEnvironmentKey;
}

ValueMetadata *type metadata accessor for PhotosPickerEdgesWithoutContentMarginsEnvironmentKey()
{
  return &type metadata for PhotosPickerEdgesWithoutContentMarginsEnvironmentKey;
}

ValueMetadata *type metadata accessor for PhotosPickerDisabledCapabilitiesEnvironmentKey()
{
  return &type metadata for PhotosPickerDisabledCapabilitiesEnvironmentKey;
}

ValueMetadata *type metadata accessor for PhotosPickerDisabledPrivateCapabilitiesEnvironmentKey()
{
  return &type metadata for PhotosPickerDisabledPrivateCapabilitiesEnvironmentKey;
}

ValueMetadata *type metadata accessor for PhotosPickerSourceTypeEnvironmentKey()
{
  return &type metadata for PhotosPickerSourceTypeEnvironmentKey;
}

ValueMetadata *type metadata accessor for PhotosPickerPeopleConfigurationEnvironmentKey()
{
  return &type metadata for PhotosPickerPeopleConfigurationEnvironmentKey;
}

ValueMetadata *type metadata accessor for PhotosPickerContainerIdentifierEnvironmentKey()
{
  return &type metadata for PhotosPickerContainerIdentifierEnvironmentKey;
}

ValueMetadata *type metadata accessor for PhotosPickerAlbumsConfigurationEnvironmentKey()
{
  return &type metadata for PhotosPickerAlbumsConfigurationEnvironmentKey;
}

ValueMetadata *type metadata accessor for PhotosPickerSuggestionGroupEnvironmentKey()
{
  return &type metadata for PhotosPickerSuggestionGroupEnvironmentKey;
}

unint64_t sub_20D136D5C()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  result = qword_2549A6000;
  if (!qword_2549A6000)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2549A5ED0);
    sub_20D124C24(&qword_2549A6008, (void (*)(uint64_t))MEMORY[0x24BDE3B18]);
    v3 = v2;
    result = MEMORY[0x212B9D8E4](MEMORY[0x24BEE4AB8], v1, &v3);
    atomic_store(result, (unint64_t *)&qword_2549A6000);
  }
  return result;
}

unint64_t sub_20D136DD8()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  result = qword_2549A6010;
  if (!qword_2549A6010)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2549A5EC0);
    sub_20D124C24(&qword_2549A6018, (void (*)(uint64_t))MEMORY[0x24BDE3B48]);
    v3 = v2;
    result = MEMORY[0x212B9D8E4](MEMORY[0x24BEE4AB8], v1, &v3);
    atomic_store(result, (unint64_t *)&qword_2549A6010);
  }
  return result;
}

unint64_t sub_20D136E54()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;

  result = qword_2549A6020;
  if (!qword_2549A6020)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2549A6028);
    v2 = MEMORY[0x24BEE0D28];
    result = MEMORY[0x212B9D8E4](MEMORY[0x24BEE4AB8], v1, &v2);
    atomic_store(result, (unint64_t *)&qword_2549A6020);
  }
  return result;
}

unint64_t sub_20D136EB0()
{
  unint64_t result;

  result = qword_2549A6038;
  if (!qword_2549A6038)
  {
    result = MEMORY[0x212B9D8E4](MEMORY[0x24BDF1528], MEMORY[0x24BDF1520]);
    atomic_store(result, (unint64_t *)&qword_2549A6038);
  }
  return result;
}

uint64_t OUTLINED_FUNCTION_7_0()
{
  return sub_20D137D5C();
}

void OUTLINED_FUNCTION_9_0(uint64_t a1@<X8>, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  __int128 v6;

  v6 = *(_OWORD *)(v3 + 16);
  *(_OWORD *)(v5 - 144) = *(_OWORD *)v3;
  *(_OWORD *)(v5 - 128) = v6;
  *(_OWORD *)(v5 - 112) = *(_OWORD *)(v3 + 32);
  *(_QWORD *)(v5 - 96) = *(_QWORD *)(v3 + 48);
  sub_20D136B48(v2, (uint64_t)&a2 - ((a1 + 15) & 0xFFFFFFFFFFFFFFF0), v4);
}

uint64_t OUTLINED_FUNCTION_10_0@<X0>(uint64_t a1@<X8>, uint64_t a2)
{
  uint64_t v2;

  *(_QWORD *)(v2 - 248) = (char *)&a2 - ((a1 + 15) & 0xFFFFFFFFFFFFFFF0);
  return sub_20D137D38();
}

void OUTLINED_FUNCTION_11_0(uint64_t a1@<X8>, uint64_t a2)
{
  uint64_t v2;
  uint64_t *v3;
  uint64_t v4;
  uint64_t v5;
  __int128 v6;

  v6 = *(_OWORD *)(v4 + 16);
  *(_OWORD *)(v5 - 144) = *(_OWORD *)v4;
  *(_OWORD *)(v5 - 128) = v6;
  *(_OWORD *)(v5 - 112) = *(_OWORD *)(v4 + 32);
  *(_QWORD *)(v5 - 96) = *(_QWORD *)(v4 + 48);
  sub_20D136B48(v2, (uint64_t)&a2 - ((a1 + 15) & 0xFFFFFFFFFFFFFFF0), v3);
}

uint64_t OUTLINED_FUNCTION_13_0()
{
  return swift_allocObject();
}

uint64_t OUTLINED_FUNCTION_14_0()
{
  return type metadata accessor for PhotosPickerSelectionBehavior(0);
}

uint64_t OUTLINED_FUNCTION_15_0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(_QWORD))
{
  return a4(0);
}

uint64_t OUTLINED_FUNCTION_18_0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_storeEnumTagSinglePayload(a1, a2, a3, a4);
}

void OUTLINED_FUNCTION_20_0()
{
  JUMPOUT(0x212B9D944);
}

uint64_t OUTLINED_FUNCTION_22_0@<X0>(uint64_t a1@<X0>, uint64_t (*a2)(uint64_t, uint64_t)@<X8>)
{
  uint64_t v2;

  return a2(a1, v2);
}

_QWORD *OUTLINED_FUNCTION_23_0(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  __int128 v3;

  *(_QWORD *)(a1 + 16) = 0;
  *(_QWORD *)(a1 + 24) = 0;
  v3 = *(_OWORD *)(v1 + 16);
  *(_OWORD *)(a1 + 32) = *(_OWORD *)v1;
  *(_OWORD *)(a1 + 48) = v3;
  *(_OWORD *)(a1 + 64) = *(_OWORD *)(v1 + 32);
  *(_QWORD *)(a1 + 80) = *(_QWORD *)(v1 + 48);
  return sub_20D131CFC((_QWORD *)(v2 - 144));
}

void OUTLINED_FUNCTION_24_0(uint64_t a1@<X8>, uint64_t a2)
{
  uint64_t *v2;
  uint64_t v3;

  sub_20D136B48(v3, (uint64_t)&a2 - ((a1 + 15) & 0xFFFFFFFFFFFFFFF0), v2);
}

void OUTLINED_FUNCTION_26_0(uint64_t a1@<X8>, uint64_t a2)
{
  uint64_t *v2;
  uint64_t v3;

  sub_20D136B48(v3, (uint64_t)&a2 - ((a1 + 15) & 0xFFFFFFFFFFFFFFF0), v2);
}

uint64_t OUTLINED_FUNCTION_29_0()
{
  uint64_t v0;

  return *(_QWORD *)(v0 - 136);
}

uint64_t OUTLINED_FUNCTION_31_0()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t OUTLINED_FUNCTION_32_0()
{
  return type metadata accessor for PhotosPickerSelectionBehavior(0);
}

uint64_t OUTLINED_FUNCTION_33_0()
{
  return swift_deallocObject();
}

__n128 OUTLINED_FUNCTION_34_0(uint64_t a1)
{
  uint64_t v1;
  __int128 v2;
  __n128 result;

  *(_QWORD *)(a1 + 16) = 0;
  *(_QWORD *)(a1 + 24) = 0;
  v2 = *(_OWORD *)(v1 + 16);
  *(_OWORD *)(a1 + 32) = *(_OWORD *)v1;
  *(_OWORD *)(a1 + 48) = v2;
  result = *(__n128 *)(v1 + 32);
  *(__n128 *)(a1 + 64) = result;
  *(_QWORD *)(a1 + 80) = *(_QWORD *)(v1 + 48);
  return result;
}

void OUTLINED_FUNCTION_35_0()
{
  _QWORD *v0;
  void (*v1)(uint64_t);

  sub_20D124C24(v0, v1);
}

uint64_t OUTLINED_FUNCTION_36_0()
{
  uint64_t *v0;

  return __swift_instantiateConcreteTypeFromMangledName(v0);
}

uint64_t OUTLINED_FUNCTION_37_0()
{
  return swift_slowAlloc();
}

uint64_t OUTLINED_FUNCTION_38_0()
{
  return swift_arrayDestroy();
}

void OUTLINED_FUNCTION_39_0(void *a1, NSObject *a2, uint64_t a3, const char *a4)
{
  os_log_type_t v4;
  uint8_t *v5;

  _os_log_impl(a1, a2, v4, a4, v5, 0xCu);
}

_QWORD *OUTLINED_FUNCTION_40_0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;

  *(_QWORD *)(a1 + 80) = a2;
  return sub_20D131CFC((_QWORD *)(v2 - 144));
}

uint64_t OUTLINED_FUNCTION_41_0@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  return (*(uint64_t (**)(uint64_t))(a1 + 8))(v3 + (v2 & ~v1));
}

uint64_t OUTLINED_FUNCTION_42_0()
{
  return sub_20D137ABC();
}

uint64_t OUTLINED_FUNCTION_43_0@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  *(_QWORD *)(v1 - 224) = a1;
  return sub_20D137C9C();
}

uint64_t OUTLINED_FUNCTION_45_0()
{
  uint64_t v0;

  return v0;
}

uint64_t OUTLINED_FUNCTION_46_0@<X0>(uint64_t a1@<X8>, uint64_t a2)
{
  uint64_t v2;

  *(_QWORD *)(v2 - 256) = (char *)&a2 - ((a1 + 15) & 0xFFFFFFFFFFFFFFF0);
  return 0;
}

uint64_t OUTLINED_FUNCTION_47_0()
{
  return swift_deallocObject();
}

uint64_t OUTLINED_FUNCTION_48_0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return __swift_getEnumTagSinglePayload(a1, a2, a3);
}

uint64_t OUTLINED_FUNCTION_50_0(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(a1 - 8) + 16))(v1, v2, a1);
}

uint64_t OUTLINED_FUNCTION_51_0()
{
  return swift_slowAlloc();
}

uint64_t OUTLINED_FUNCTION_52_0@<X0>(uint64_t a1@<X0>, uint64_t (*a2)(uint64_t, uint64_t)@<X8>)
{
  uint64_t v2;

  return a2(a1, v2);
}

uint64_t OUTLINED_FUNCTION_53_0()
{
  return swift_getKeyPath();
}

void OUTLINED_FUNCTION_54_0()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(v1 - 256) = v0;
}

uint64_t OUTLINED_FUNCTION_59_0()
{
  uint64_t v0;

  return v0;
}

id OUTLINED_FUNCTION_60_0@<X0>(int a1@<W0>, SEL *a2@<X8>)
{
  SEL *v2;
  void *v3;

  if (!a1)
    a2 = v2;
  return objc_msgSend(v3, *a2);
}

void OUTLINED_FUNCTION_61_0(uint64_t a1)
{
  uint64_t *v1;
  uint64_t v2;

  sub_20D136B48(a1, v2, v1);
}

unint64_t OUTLINED_FUNCTION_62_0(float a1)
{
  uint64_t v1;
  float *v2;
  uint64_t v3;

  *v2 = a1;
  return sub_20D130B4C(v1, *(_QWORD *)(v3 - 96), (uint64_t *)(v3 - 88));
}

__n128 OUTLINED_FUNCTION_63_0()
{
  uint64_t v0;
  uint64_t v1;
  __int128 v2;
  __n128 result;

  v2 = *(_OWORD *)(v0 + 16);
  *(_OWORD *)(v1 - 144) = *(_OWORD *)v0;
  *(_OWORD *)(v1 - 128) = v2;
  result = *(__n128 *)(v0 + 32);
  *(__n128 *)(v1 - 112) = result;
  *(_QWORD *)(v1 - 96) = *(_QWORD *)(v0 + 48);
  return result;
}

BOOL OUTLINED_FUNCTION_64_0(NSObject *a1)
{
  os_log_type_t v1;

  return os_log_type_enabled(a1, v1);
}

uint64_t OUTLINED_FUNCTION_66_0(uint64_t a1)
{
  uint64_t v1;

  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(a1 - 8) + 8))(v1, a1);
}

uint64_t OUTLINED_FUNCTION_67_0(uint64_t a1)
{
  uint64_t v1;

  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(a1 - 8) + 8))(v1, a1);
}

uint64_t OUTLINED_FUNCTION_69_0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t (*a3)(uint64_t, uint64_t, uint64_t)@<X8>)
{
  uint64_t v3;

  return a3(a1, a2, v3);
}

uint64_t OUTLINED_FUNCTION_70_0()
{
  return swift_bridgeObjectRetain();
}

uint64_t OUTLINED_FUNCTION_71_0()
{
  return sub_20D137FD8();
}

uint64_t OUTLINED_FUNCTION_72_0()
{
  return sub_20D137BDC();
}

uint64_t OUTLINED_FUNCTION_73_0()
{
  return swift_bridgeObjectRetain();
}

uint64_t OUTLINED_FUNCTION_74_0()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_75_0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_storeEnumTagSinglePayload(a1, a2, a3, a4);
}

uint64_t OUTLINED_FUNCTION_76_0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return __swift_getEnumTagSinglePayload(a1, a2, a3);
}

uint64_t OUTLINED_FUNCTION_79_0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t (*a3)(uint64_t, uint64_t, _QWORD)@<X8>)
{
  uint64_t v3;

  return a3(a1, a2, *(_QWORD *)(v3 - 256));
}

void OUTLINED_FUNCTION_81()
{
  uint64_t v0;
  uint64_t (*v1)(_QWORD);
  uint64_t v2;

  sub_20D127C64(v0, v2, v1);
}

uint64_t OUTLINED_FUNCTION_83_0()
{
  return sub_20D137C60();
}

void OUTLINED_FUNCTION_84_0(uint64_t a1, uint64_t a2)
{
  uint64_t *v2;

  sub_20D136B48(a1, a2, v2);
}

uint64_t OUTLINED_FUNCTION_87_0()
{
  uint64_t v0;

  return v0;
}

void OUTLINED_FUNCTION_88(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  sub_20D12909C(a1, a2, a3, v5, v4, v3);
}

void OUTLINED_FUNCTION_89(uint64_t a1)
{
  uint64_t *v1;

  sub_20D136B24(a1, v1);
}

uint64_t OUTLINED_FUNCTION_90()
{
  uint64_t *v0;

  return __swift_instantiateConcreteTypeFromMangledName(v0);
}

uint64_t OUTLINED_FUNCTION_91()
{
  return sub_20D137B7C();
}

uint64_t OUTLINED_FUNCTION_94()
{
  return sub_20D137DA4();
}

uint64_t OUTLINED_FUNCTION_95()
{
  return sub_20D137930();
}

void OUTLINED_FUNCTION_96(uint64_t a1, uint64_t a2)
{
  uint64_t (*v2)(_QWORD);

  sub_20D127C64(a1, a2, v2);
}

void OUTLINED_FUNCTION_97(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;

  *(_QWORD *)(v4 - 96) = a4;
}

void OUTLINED_FUNCTION_99(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;

  *(_QWORD *)(v5 - 144) = a4;
  *(_QWORD *)(v5 - 136) = a5;
  *(_QWORD *)(v5 - 160) = a2;
  *(_QWORD *)(v5 - 152) = a3;
}

uint64_t OUTLINED_FUNCTION_100@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, int a3@<W2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X8>)
{
  uint64_t v6;

  *(_QWORD *)(v6 - 112) = a4;
  *(_QWORD *)(v6 - 104) = a5;
  *(_DWORD *)(v6 - 116) = a3;
  *(_QWORD *)(v6 - 136) = result;
  *(_QWORD *)(v6 - 128) = a2;
  *(_QWORD *)(v6 - 144) = a6;
  return result;
}

void OUTLINED_FUNCTION_101(uint64_t a1)
{
  uint64_t (*v1)(_QWORD);

  sub_20D131DAC(a1, v1);
}

uint64_t OUTLINED_FUNCTION_102()
{
  return sub_20D137FFC();
}

uint64_t OUTLINED_FUNCTION_103()
{
  return sub_20D1378D0();
}

void OUTLINED_FUNCTION_105(uint64_t a1)
{
  uint64_t *v1;

  sub_20D136B24(a1, v1);
}

uint64_t OUTLINED_FUNCTION_106()
{
  return sub_20D137C48();
}

uint64_t OUTLINED_FUNCTION_107(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  return __swift_instantiateConcreteTypeFromMangledName(a3);
}

uint64_t OUTLINED_FUNCTION_108()
{
  return sub_20D137C9C();
}

uint64_t OUTLINED_FUNCTION_109()
{
  return sub_20D137D38();
}

uint64_t OUTLINED_FUNCTION_110@<X0>(uint64_t a1@<X0>, uint64_t (*a2)(uint64_t, uint64_t, _QWORD)@<X8>)
{
  uint64_t v2;
  uint64_t v3;

  return a2(a1, v2, *(_QWORD *)(v3 - 232));
}

uint64_t OUTLINED_FUNCTION_111(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t (*v3)(uint64_t, uint64_t, uint64_t);

  return v3(a1, v2, v1);
}

void OUTLINED_FUNCTION_112()
{
  uint64_t v0;
  uint64_t (*v1)(_QWORD);

  sub_20D131DAC(v0, v1);
}

uint64_t OUTLINED_FUNCTION_113()
{
  return swift_release();
}

uint64_t OUTLINED_FUNCTION_114()
{
  uint64_t v0;

  return v0;
}

uint64_t OUTLINED_FUNCTION_115()
{
  return swift_getAtKeyPath();
}

void OUTLINED_FUNCTION_116()
{
  uint64_t v0;
  uint64_t *v1;

  sub_20D136B24(v0, v1);
}

void OUTLINED_FUNCTION_117(uint64_t a1, uint64_t a2)
{
  uint64_t (*v2)(_QWORD);

  sub_20D127C64(a1, a2, v2);
}

uint64_t OUTLINED_FUNCTION_118()
{
  uint64_t v0;

  return v0;
}

uint64_t OUTLINED_FUNCTION_119()
{
  return swift_release();
}

void OUTLINED_FUNCTION_120()
{
  uint64_t v0;
  uint64_t (*v1)(_QWORD);

  sub_20D131DAC(v0, v1);
}

uint64_t OUTLINED_FUNCTION_122()
{
  return sub_20D1379B4();
}

uint64_t OUTLINED_FUNCTION_123()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_124()
{
  uint64_t (*v0)(uint64_t, uint64_t);
  uint64_t v1;
  uint64_t v2;

  return v0(v1, v2);
}

uint64_t OUTLINED_FUNCTION_128()
{
  uint64_t v0;

  return v0;
}

uint64_t OUTLINED_FUNCTION_129()
{
  return sub_20D137A38();
}

uint64_t OUTLINED_FUNCTION_131()
{
  return sub_20D1378DC();
}

uint64_t OUTLINED_FUNCTION_132()
{
  return swift_getEnumCaseMultiPayload();
}

uint64_t OUTLINED_FUNCTION_134()
{
  return swift_release();
}

uint64_t OUTLINED_FUNCTION_135()
{
  return swift_unknownObjectRelease();
}

uint64_t OUTLINED_FUNCTION_136@<X0>(uint64_t a1@<X0>, void (*a2)(void)@<X8>)
{
  return sub_20D12E21C(a1, a2);
}

void OUTLINED_FUNCTION_137(uint64_t a1, uint64_t a2, uint64_t (*a3)(_QWORD))
{
  uint64_t v3;

  sub_20D127C64(a1, v3, a3);
}

uint64_t OUTLINED_FUNCTION_138@<X0>(uint64_t a1@<X0>, uint64_t (*a2)(uint64_t, uint64_t, _QWORD)@<X8>)
{
  uint64_t v2;
  uint64_t v3;

  return a2(a1, v2, *(_QWORD *)(v3 - 256));
}

uint64_t OUTLINED_FUNCTION_139()
{
  uint64_t (*v0)(_QWORD);

  return v0(0);
}

uint64_t OUTLINED_FUNCTION_140()
{
  return sub_20D137960();
}

uint64_t OUTLINED_FUNCTION_141(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;

  return type metadata accessor for PhotosPicker(0, v4, a3, a4);
}

uint64_t OUTLINED_FUNCTION_142()
{
  return type metadata accessor for PhotosPickerItem.EncodingDisambiguationPolicy(0);
}

uint64_t OUTLINED_FUNCTION_143()
{
  uint64_t (*v0)(_QWORD);

  return v0(0);
}

void OUTLINED_FUNCTION_144(uint64_t a1, unint64_t *a2)
{
  sub_20D13670C(0, a2);
}

uint64_t OUTLINED_FUNCTION_145(uint64_t a1, uint64_t (*a2)(_QWORD))
{
  return a2(0);
}

void OUTLINED_FUNCTION_146(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8;

  *(_QWORD *)(v8 - 96) = a7;
  *(_QWORD *)(v8 - 88) = a8;
  *(_QWORD *)(v8 - 112) = a5;
  *(_QWORD *)(v8 - 104) = a6;
}

uint64_t OUTLINED_FUNCTION_147@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, int a5@<W4>, uint64_t a6@<X8>, uint64_t a7)
{
  uint64_t v7;

  return sub_20D129588(a1, a2, a3, a4, a5, *(void (**)(uint64_t))(v7 - 208), *(_QWORD *)(v7 - 200), *(_QWORD *)(v7 - 192), a6, a7);
}

void OUTLINED_FUNCTION_148()
{
  JUMPOUT(0x212B9D8E4);
}

uint64_t OUTLINED_FUNCTION_149()
{
  return sub_20D137978();
}

uint64_t OUTLINED_FUNCTION_150(uint64_t a1, uint64_t *a2)
{
  return __swift_instantiateConcreteTypeFromMangledName(a2);
}

uint64_t OUTLINED_FUNCTION_151()
{
  uint64_t *v0;

  return __swift_instantiateConcreteTypeFromMangledName(v0);
}

uint64_t OUTLINED_FUNCTION_152()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_153()
{
  return swift_release();
}

uint64_t OUTLINED_FUNCTION_154()
{
  return swift_getEnumCaseMultiPayload();
}

uint64_t OUTLINED_FUNCTION_155()
{
  return swift_release();
}

uint64_t sub_20D1377C8()
{
  return MEMORY[0x24BDCD2F8]();
}

uint64_t sub_20D1377D4()
{
  return MEMORY[0x24BDCD810]();
}

uint64_t sub_20D1377E0()
{
  return MEMORY[0x24BDCD8C0]();
}

uint64_t sub_20D1377EC()
{
  return MEMORY[0x24BDCD8D0]();
}

uint64_t sub_20D1377F8()
{
  return MEMORY[0x24BEE6120]();
}

uint64_t sub_20D137804()
{
  return MEMORY[0x24BDCD9E8]();
}

uint64_t sub_20D137810()
{
  return MEMORY[0x24BDCDAC0]();
}

uint64_t sub_20D13781C()
{
  return MEMORY[0x24BDCDCA0]();
}

uint64_t sub_20D137828()
{
  return MEMORY[0x24BDCE9B0]();
}

uint64_t sub_20D137834()
{
  return MEMORY[0x24BDCEA40]();
}

uint64_t sub_20D137840()
{
  return MEMORY[0x24BDCEA58]();
}

uint64_t sub_20D13784C()
{
  return MEMORY[0x24BDC5028]();
}

uint64_t sub_20D137858()
{
  return MEMORY[0x24BDC5040]();
}

uint64_t sub_20D137864()
{
  return MEMORY[0x24BDC5068]();
}

uint64_t sub_20D137870()
{
  return MEMORY[0x24BDC50A0]();
}

uint64_t sub_20D13787C()
{
  return MEMORY[0x24BDC50D8]();
}

uint64_t sub_20D137888()
{
  return MEMORY[0x24BEE6190]();
}

uint64_t sub_20D137894()
{
  return MEMORY[0x24BEE6210]();
}

uint64_t sub_20D1378A0()
{
  return MEMORY[0x24BEE6238]();
}

uint64_t sub_20D1378AC()
{
  return MEMORY[0x24BEE6260]();
}

uint64_t sub_20D1378B8()
{
  return MEMORY[0x24BEE6310]();
}

uint64_t sub_20D1378C4()
{
  return MEMORY[0x24BEE6318]();
}

uint64_t sub_20D1378D0()
{
  return MEMORY[0x24BEE63B8]();
}

uint64_t sub_20D1378DC()
{
  return MEMORY[0x24BDEB560]();
}

uint64_t sub_20D1378E8()
{
  return MEMORY[0x24BDEBDE0]();
}

uint64_t sub_20D1378F4()
{
  return MEMORY[0x24BDEBDF0]();
}

uint64_t sub_20D137900()
{
  return MEMORY[0x24BDEBE00]();
}

uint64_t sub_20D13790C()
{
  return MEMORY[0x24BDEC030]();
}

uint64_t sub_20D137918()
{
  return MEMORY[0x24BDEC038]();
}

uint64_t sub_20D137924()
{
  return MEMORY[0x24BDEC648]();
}

uint64_t sub_20D137930()
{
  return MEMORY[0x24BDED2D0]();
}

uint64_t sub_20D13793C()
{
  return MEMORY[0x24BDED3B0]();
}

uint64_t sub_20D137948()
{
  return MEMORY[0x24BDEE3F0]();
}

uint64_t sub_20D137954()
{
  return MEMORY[0x24BDEE4E0]();
}

uint64_t sub_20D137960()
{
  return MEMORY[0x24BDEE4F8]();
}

uint64_t sub_20D13796C()
{
  return MEMORY[0x24BDEE530]();
}

uint64_t sub_20D137978()
{
  return MEMORY[0x24BDEE538]();
}

uint64_t sub_20D137984()
{
  return MEMORY[0x24BDEEB40]();
}

uint64_t sub_20D137990()
{
  return MEMORY[0x24BDEF380]();
}

uint64_t sub_20D13799C()
{
  return MEMORY[0x24BDEF3A0]();
}

uint64_t sub_20D1379A8()
{
  return MEMORY[0x24BDEF3B8]();
}

uint64_t sub_20D1379B4()
{
  return MEMORY[0x24BDF04D0]();
}

uint64_t sub_20D1379C0()
{
  return MEMORY[0x24BDF0EC0]();
}

uint64_t sub_20D1379CC()
{
  return MEMORY[0x24BDF0ED0]();
}

uint64_t sub_20D1379D8()
{
  return MEMORY[0x24BDF0EE0]();
}

uint64_t sub_20D1379E4()
{
  return MEMORY[0x24BDF0EF0]();
}

uint64_t sub_20D1379F0()
{
  return MEMORY[0x24BDF0F00]();
}

uint64_t sub_20D1379FC()
{
  return MEMORY[0x24BDF0F10]();
}

uint64_t sub_20D137A08()
{
  return MEMORY[0x24BDF0F18]();
}

uint64_t sub_20D137A14()
{
  return MEMORY[0x24BDF0F28]();
}

uint64_t sub_20D137A20()
{
  return MEMORY[0x24BDF0F38]();
}

uint64_t sub_20D137A2C()
{
  return MEMORY[0x24BDF13A0]();
}

uint64_t sub_20D137A38()
{
  return MEMORY[0x24BDF1430]();
}

uint64_t sub_20D137A44()
{
  return MEMORY[0x24BDF14A8]();
}

uint64_t sub_20D137A50()
{
  return MEMORY[0x24BDF14C0]();
}

uint64_t sub_20D137A5C()
{
  return MEMORY[0x24BDF14C8]();
}

uint64_t sub_20D137A68()
{
  return MEMORY[0x24BDF14E0]();
}

uint64_t sub_20D137A74()
{
  return MEMORY[0x24BDF14E8]();
}

uint64_t sub_20D137A80()
{
  return MEMORY[0x24BDF14F8]();
}

uint64_t sub_20D137A8C()
{
  return MEMORY[0x24BDF1FC0]();
}

uint64_t sub_20D137A98()
{
  return MEMORY[0x24BDF1FF0]();
}

uint64_t sub_20D137AA4()
{
  return MEMORY[0x24BDF2088]();
}

uint64_t sub_20D137AB0()
{
  return MEMORY[0x24BDF20A0]();
}

uint64_t sub_20D137ABC()
{
  return MEMORY[0x24BDF2370]();
}

uint64_t sub_20D137AC8()
{
  return MEMORY[0x24BDF2698]();
}

uint64_t sub_20D137AD4()
{
  return MEMORY[0x24BDF2CE8]();
}

uint64_t sub_20D137AE0()
{
  return MEMORY[0x24BDF3008]();
}

uint64_t sub_20D137AEC()
{
  return MEMORY[0x24BDF3640]();
}

uint64_t sub_20D137AF8()
{
  return MEMORY[0x24BDF38C0]();
}

uint64_t sub_20D137B04()
{
  return MEMORY[0x24BDF38E0]();
}

uint64_t sub_20D137B10()
{
  return MEMORY[0x24BDF4280]();
}

uint64_t sub_20D137B1C()
{
  return MEMORY[0x24BDF4290]();
}

uint64_t sub_20D137B28()
{
  return MEMORY[0x24BDF42A8]();
}

uint64_t sub_20D137B34()
{
  return MEMORY[0x24BDF42B0]();
}

uint64_t sub_20D137B40()
{
  return MEMORY[0x24BDF4340]();
}

uint64_t sub_20D137B4C()
{
  return MEMORY[0x24BDF4398]();
}

uint64_t sub_20D137B58()
{
  return MEMORY[0x24BDF47B0]();
}

uint64_t sub_20D137B64()
{
  return MEMORY[0x24BDF47B8]();
}

uint64_t sub_20D137B70()
{
  return MEMORY[0x24BDF47E0]();
}

uint64_t sub_20D137B7C()
{
  return MEMORY[0x24BDF47F8]();
}

uint64_t sub_20D137B88()
{
  return MEMORY[0x24BDF4808]();
}

uint64_t sub_20D137B94()
{
  return MEMORY[0x24BDF4F18]();
}

uint64_t sub_20D137BA0()
{
  return MEMORY[0x24BEE5458]();
}

uint64_t sub_20D137BAC()
{
  return MEMORY[0x24BEE54C8]();
}

uint64_t sub_20D137BB8()
{
  return MEMORY[0x24BEE5500]();
}

uint64_t sub_20D137BC4()
{
  return MEMORY[0x24BDE38F8]();
}

uint64_t sub_20D137BD0()
{
  return MEMORY[0x24BDE3908]();
}

uint64_t sub_20D137BDC()
{
  return MEMORY[0x24BDE3910]();
}

uint64_t sub_20D137BE8()
{
  return MEMORY[0x24BDE3970]();
}

uint64_t sub_20D137BF4()
{
  return MEMORY[0x24BDE3978]();
}

uint64_t sub_20D137C00()
{
  return MEMORY[0x24BDE3988]();
}

uint64_t sub_20D137C0C()
{
  return MEMORY[0x24BDE3998]();
}

uint64_t sub_20D137C18()
{
  return MEMORY[0x24BDE39A0]();
}

uint64_t sub_20D137C24()
{
  return MEMORY[0x24BDE39A8]();
}

uint64_t sub_20D137C30()
{
  return MEMORY[0x24BDE39B0]();
}

uint64_t sub_20D137C3C()
{
  return MEMORY[0x24BDE39B8]();
}

uint64_t sub_20D137C48()
{
  return MEMORY[0x24BDE39C0]();
}

uint64_t sub_20D137C54()
{
  return MEMORY[0x24BDE39D0]();
}

uint64_t sub_20D137C60()
{
  return MEMORY[0x24BDE39D8]();
}

uint64_t sub_20D137C6C()
{
  return MEMORY[0x24BDE39E0]();
}

uint64_t sub_20D137C78()
{
  return MEMORY[0x24BDE39E8]();
}

uint64_t sub_20D137C84()
{
  return MEMORY[0x24BDE39F8]();
}

uint64_t _s015_PhotosUI_SwiftB00A23PickerSelectionBehaviorV2eeoiySbAC_ACtFZ_0()
{
  return MEMORY[0x24BDE3A08]();
}

uint64_t sub_20D137C9C()
{
  return MEMORY[0x24BDE3A20]();
}

uint64_t sub_20D137CA8()
{
  return MEMORY[0x24BDE3A38]();
}

uint64_t sub_20D137CB4()
{
  return MEMORY[0x24BDE3A40]();
}

uint64_t sub_20D137CC0()
{
  return MEMORY[0x24BDE3A48]();
}

uint64_t sub_20D137CCC()
{
  return MEMORY[0x24BDE3A50]();
}

uint64_t sub_20D137CD8()
{
  return MEMORY[0x24BDE3A60]();
}

uint64_t sub_20D137CE4()
{
  return MEMORY[0x24BDE3A70]();
}

uint64_t sub_20D137CF0()
{
  return MEMORY[0x24BDE3A78]();
}

uint64_t sub_20D137CFC()
{
  return MEMORY[0x24BDE3A80]();
}

uint64_t sub_20D137D08()
{
  return MEMORY[0x24BDE3A88]();
}

uint64_t sub_20D137D14()
{
  return MEMORY[0x24BDE3A90]();
}

uint64_t sub_20D137D20()
{
  return MEMORY[0x24BDE3A98]();
}

uint64_t sub_20D137D2C()
{
  return MEMORY[0x24BDE3AB0]();
}

uint64_t sub_20D137D38()
{
  return MEMORY[0x24BDE3AC8]();
}

uint64_t sub_20D137D44()
{
  return MEMORY[0x24BDE3AE0]();
}

uint64_t sub_20D137D50()
{
  return MEMORY[0x24BDE3AE8]();
}

uint64_t sub_20D137D5C()
{
  return MEMORY[0x24BDE3AF8]();
}

uint64_t sub_20D137D68()
{
  return MEMORY[0x24BDE3B18]();
}

uint64_t sub_20D137D74()
{
  return MEMORY[0x24BDE3B30]();
}

uint64_t sub_20D137D80()
{
  return MEMORY[0x24BDE3B48]();
}

uint64_t sub_20D137D8C()
{
  return MEMORY[0x24BDCF808]();
}

uint64_t sub_20D137D98()
{
  return MEMORY[0x24BEE02B0]();
}

uint64_t sub_20D137DA4()
{
  return MEMORY[0x24BEE0618]();
}

uint64_t sub_20D137DB0()
{
  return MEMORY[0x24BEE0980]();
}

uint64_t sub_20D137DBC()
{
  return MEMORY[0x24BDCF9E0]();
}

uint64_t sub_20D137DC8()
{
  return MEMORY[0x24BDCFA28]();
}

uint64_t sub_20D137DD4()
{
  return MEMORY[0x24BEE0B20]();
}

uint64_t sub_20D137DE0()
{
  return MEMORY[0x24BEE0BC0]();
}

uint64_t sub_20D137DEC()
{
  return MEMORY[0x24BEE0C10]();
}

uint64_t sub_20D137DF8()
{
  return MEMORY[0x24BEE1110]();
}

uint64_t sub_20D137E04()
{
  return MEMORY[0x24BDCFBA8]();
}

uint64_t sub_20D137E10()
{
  return MEMORY[0x24BDCFBC8]();
}

uint64_t sub_20D137E1C()
{
  return MEMORY[0x24BEE1128]();
}

uint64_t sub_20D137E28()
{
  return MEMORY[0x24BEE1160]();
}

uint64_t sub_20D137E34()
{
  return MEMORY[0x24BEE11B8]();
}

uint64_t sub_20D137E40()
{
  return MEMORY[0x24BEE6800]();
}

uint64_t sub_20D137E4C()
{
  return MEMORY[0x24BEE6820]();
}

uint64_t sub_20D137E58()
{
  return MEMORY[0x24BEE6828]();
}

uint64_t sub_20D137E64()
{
  return MEMORY[0x24BEE6830]();
}

uint64_t sub_20D137E70()
{
  return MEMORY[0x24BEE6920]();
}

uint64_t sub_20D137E7C()
{
  return MEMORY[0x24BEE6928]();
}

uint64_t sub_20D137E88()
{
  return MEMORY[0x24BEE6988]();
}

uint64_t sub_20D137E94()
{
  return MEMORY[0x24BEE6990]();
}

uint64_t sub_20D137EA0()
{
  return MEMORY[0x24BEE7920]();
}

uint64_t sub_20D137EAC()
{
  return MEMORY[0x24BDC5110]();
}

uint64_t sub_20D137EB8()
{
  return MEMORY[0x24BEE5770]();
}

uint64_t sub_20D137EC4()
{
  return MEMORY[0x24BEE5790]();
}

uint64_t sub_20D137ED0()
{
  return MEMORY[0x24BDE3B60]();
}

uint64_t sub_20D137EDC()
{
  return MEMORY[0x24BDE3B68]();
}

uint64_t sub_20D137EE8()
{
  return MEMORY[0x24BDE3B70]();
}

uint64_t sub_20D137EF4()
{
  return MEMORY[0x24BDE3B78]();
}

uint64_t sub_20D137F00()
{
  return MEMORY[0x24BEE5BC0]();
}

uint64_t sub_20D137F0C()
{
  return MEMORY[0x24BEE5BC8]();
}

uint64_t sub_20D137F18()
{
  return MEMORY[0x24BEE1C68]();
}

uint64_t sub_20D137F24()
{
  return MEMORY[0x24BEE22B0]();
}

uint64_t sub_20D137F30()
{
  return MEMORY[0x24BEE22C0]();
}

uint64_t sub_20D137F3C()
{
  return MEMORY[0x24BEE23A0]();
}

uint64_t sub_20D137F48()
{
  return MEMORY[0x24BEE2510]();
}

uint64_t sub_20D137F54()
{
  return MEMORY[0x24BEE2518]();
}

uint64_t sub_20D137F60()
{
  return MEMORY[0x24BEE2838]();
}

uint64_t sub_20D137F6C()
{
  return MEMORY[0x24BEE2BE0]();
}

uint64_t sub_20D137F78()
{
  return MEMORY[0x24BEE2E68]();
}

uint64_t sub_20D137F84()
{
  return MEMORY[0x24BEE2F48]();
}

uint64_t sub_20D137F90()
{
  return MEMORY[0x24BEE3068]();
}

uint64_t sub_20D137F9C()
{
  return MEMORY[0x24BEE3088]();
}

uint64_t sub_20D137FA8()
{
  return MEMORY[0x24BEE3098]();
}

uint64_t sub_20D137FB4()
{
  return MEMORY[0x24BEE3A30]();
}

uint64_t sub_20D137FC0()
{
  return MEMORY[0x24BEE70E0]();
}

uint64_t sub_20D137FCC()
{
  return MEMORY[0x24BEE3ED8]();
}

uint64_t sub_20D137FD8()
{
  return MEMORY[0x24BEE42E0]();
}

uint64_t sub_20D137FE4()
{
  return MEMORY[0x24BEE42F8]();
}

uint64_t sub_20D137FF0()
{
  return MEMORY[0x24BEE4300]();
}

uint64_t sub_20D137FFC()
{
  return MEMORY[0x24BEE4328]();
}

uint64_t sub_20D138008()
{
  return MEMORY[0x24BEE4408]();
}

SEL NSSelectorFromString(NSString *aSelectorName)
{
  return (SEL)MEMORY[0x24BDD1218](aSelectorName);
}

uint64_t PFCurrentPlatformLivePhotoBundleType()
{
  return MEMORY[0x24BE72488]();
}

uint64_t PFIsLivePhotoBundleType()
{
  return MEMORY[0x24BE72498]();
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

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x24BEDD2A8](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B8](a1);
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

uint64_t swift_unexpectedError()
{
  return MEMORY[0x24BEE4F68]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x24BEE4F70]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x24BEE4F80]();
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

uint64_t swift_updateClassMetadata2()
{
  return MEMORY[0x24BEE5008]();
}

uint64_t swift_willThrow()
{
  return MEMORY[0x24BEE5050]();
}

