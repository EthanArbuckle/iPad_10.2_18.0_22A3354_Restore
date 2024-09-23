uint64_t sub_22DFA37E4(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v3;
  _QWORD *v5;
  uint64_t (*v7)(uint64_t);

  v7 = (uint64_t (*)(uint64_t))((char *)a3 + *a3);
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v3 + 16) = v5;
  *v5 = v3;
  v5[1] = sub_22DF2F8F0;
  return v7(a1);
}

uint64_t TransportObservationHandler.init<>(initialObservationValue:setUpObservation:tearDownObservation:transport:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, uint64_t *a9@<X8>, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14)
{
  _QWORD *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t result;

  v18 = (_QWORD *)OUTLINED_FUNCTION_38_9();
  v18[2] = a10;
  v18[3] = a11;
  v18[4] = a12;
  v18[5] = a13;
  v18[6] = a14;
  v18[7] = a1;
  v18[8] = a2;
  v20 = type metadata accessor for UntargetedObserverStore(0, a11, a14, v19);
  v21 = sub_22DF63940();
  result = MEMORY[0x22E323AEC](&unk_22DFE3DF0, v20);
  *a9 = v21;
  a9[1] = result;
  a9[2] = (uint64_t)&unk_255DDB848;
  a9[3] = (uint64_t)v18;
  a9[4] = a3;
  a9[5] = a4;
  a9[6] = a5;
  a9[7] = a6;
  a9[8] = a7;
  a9[9] = a8;
  return result;
}

uint64_t sub_22DFA3928(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v3;
  _QWORD *v5;
  uint64_t (*v7)(uint64_t);

  v7 = (uint64_t (*)(uint64_t))((char *)a3 + *a3);
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v3 + 16) = v5;
  *v5 = v3;
  v5[1] = sub_22DF35188;
  return v7(a1);
}

uint64_t sub_22DFA398C()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  int *v4;

  OUTLINED_FUNCTION_94_2();
  OUTLINED_FUNCTION_12_18();
  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 16) = v1;
  *v1 = v0;
  v1[1] = sub_22DF35188;
  OUTLINED_FUNCTION_4_22();
  OUTLINED_FUNCTION_40_1();
  return sub_22DFA3928(v2, v3, v4);
}

uint64_t TransportObservationHandler.handle(_:from:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _OWORD *v4;
  uint64_t v5;
  uint64_t AssociatedTypeWitness;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;

  *(_QWORD *)(v5 + 328) = a3;
  *(_QWORD *)(v5 + 336) = a4;
  *(_QWORD *)(v5 + 320) = a1;
  *(_QWORD *)(v5 + 344) = *(_QWORD *)(a4 + 32);
  *(_QWORD *)(v5 + 352) = *(_QWORD *)(a4 + 16);
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  *(_QWORD *)(v5 + 360) = AssociatedTypeWitness;
  v8 = OUTLINED_FUNCTION_37_8();
  *(_QWORD *)(v5 + 368) = v8;
  v9 = OUTLINED_FUNCTION_37_8();
  *(_QWORD *)(v5 + 376) = v9;
  v10 = type metadata accessor for ObservationLifeCycleResponse.ObservationResult(0, AssociatedTypeWitness, v8, v9);
  *(_QWORD *)(v5 + 384) = v10;
  *(_QWORD *)(v5 + 392) = *(_QWORD *)(v10 - 8);
  *(_QWORD *)(v5 + 400) = OUTLINED_FUNCTION_101_0();
  *(_QWORD *)(v5 + 408) = OUTLINED_FUNCTION_101_0();
  v11 = OUTLINED_FUNCTION_101_0();
  *(_OWORD *)(v5 + 424) = *(_OWORD *)a2;
  v12 = v4[1];
  *(_OWORD *)(v5 + 440) = *v4;
  *(_OWORD *)(v5 + 456) = v12;
  v13 = v4[3];
  *(_OWORD *)(v5 + 472) = v4[2];
  *(_QWORD *)(v5 + 416) = v11;
  *(_BYTE *)(v5 + 313) = *(_BYTE *)(a2 + 16);
  *(_OWORD *)(v5 + 488) = v13;
  *(_OWORD *)(v5 + 504) = v4[4];
  OUTLINED_FUNCTION_15();
  return OUTLINED_FUNCTION_24();
}

uint64_t sub_22DFA3B14(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13)
{
  uint64_t v13;
  __int128 v14;
  char v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  __int128 v21;
  __n128 v22;
  uint64_t v23;
  Swift::Bool v24;
  Swift::String v25;
  uint64_t v26;
  uint64_t v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _QWORD *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;

  OUTLINED_FUNCTION_151_0();
  v14 = *(_OWORD *)(v13 + 456);
  *(_OWORD *)(v13 + 16) = *(_OWORD *)(v13 + 440);
  v15 = *(_BYTE *)(v13 + 313);
  v17 = *(_QWORD *)(v13 + 424);
  v16 = *(_QWORD *)(v13 + 432);
  v19 = *(_QWORD *)(v13 + 344);
  v18 = *(_QWORD *)(v13 + 352);
  v20 = *(_QWORD *)(v13 + 336);
  v21 = *(_OWORD *)(v13 + 472);
  v22 = *(__n128 *)(v13 + 488);
  *(_OWORD *)(v13 + 32) = v14;
  *(_OWORD *)(v13 + 48) = v21;
  OUTLINED_FUNCTION_32_8(*(__n128 *)(v13 + 504), *(double *)&v14, v22);
  sub_22DFDD568();
  OUTLINED_FUNCTION_60_2();
  *(_QWORD *)(v13 + 296) = v17;
  *(_QWORD *)(v13 + 304) = v16;
  *(_BYTE *)(v13 + 312) = v15;
  type metadata accessor for ObservationLifeCycleRequest(0, v18, v19, v23);
  sub_22DFDDF28();
  OUTLINED_FUNCTION_9_14();
  *(_QWORD *)(v13 + 520) = *(_QWORD *)(v20 + 24);
  sub_22DFDDF28();
  v24 = sub_22DF39308() & 1;
  *(_BYTE *)(v13 + 316) = v24;
  v25._countAndFlagsBits = a12;
  v25._object = a13;
  Logging.ulog(_:extended:)(v25, v24);
  swift_bridgeObjectRelease();
  if ((v15 & 1) != 0)
  {
    v26 = *(_QWORD *)(v13 + 424);
    v27 = *(_QWORD *)(v13 + 432);
    v28 = *(_OWORD *)(v13 + 456);
    *(_OWORD *)(v13 + 96) = *(_OWORD *)(v13 + 440);
    v29 = *(_OWORD *)(v13 + 472);
    v30 = *(_OWORD *)(v13 + 488);
    *(_OWORD *)(v13 + 112) = v28;
    *(_OWORD *)(v13 + 128) = v29;
    v31 = *(_OWORD *)(v13 + 504);
    *(_OWORD *)(v13 + 144) = v30;
    *(_OWORD *)(v13 + 160) = v31;
    sub_22DF68600(v26, v27, 1);
    v32 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v13 + 536) = v32;
    *v32 = v13;
    v32[1] = sub_22DFA3F4C;
    OUTLINED_FUNCTION_166_0();
    return sub_22DFA4944(v33, v34, v35);
  }
  else
  {
    v38 = *(_QWORD *)(v13 + 424);
    v37 = *(_QWORD *)(v13 + 432);
    *(_QWORD *)(v13 + 528) = OUTLINED_FUNCTION_9_3();
    swift_getAssociatedTypeWitness();
    swift_getAssociatedConformanceWitness();
    v39 = sub_22DFDD9AC();
    *(_QWORD *)(v13 + 280) = v39;
    *(_QWORD *)(v13 + 288) = MEMORY[0x22E323AEC](MEMORY[0x24BEE1728], v39);
    *(_QWORD *)(v13 + 256) = v38;
    sub_22DF68600(v38, v37, 0);
    sub_22DFDD730();
    OUTLINED_FUNCTION_47_5();
    return OUTLINED_FUNCTION_9_16();
  }
}

uint64_t sub_22DFA3D60()
{
  uint64_t v0;

  *(_WORD *)(v0 + 314) = sub_22DFAA8B0(*(_QWORD *)(v0 + 328), (_QWORD *)(v0 + 256), *(_QWORD *)(v0 + 528), *(_QWORD *)(v0 + 448));
  __swift_destroy_boxed_opaque_existential_0Tm(v0 + 256);
  OUTLINED_FUNCTION_15();
  return OUTLINED_FUNCTION_24();
}

uint64_t sub_22DFA3DB0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, __int128 a9, __int128 a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14)
{
  uint64_t v14;
  _QWORD *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t, _QWORD, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, _QWORD, _QWORD, _QWORD, _QWORD, uint64_t, uint64_t, uint64_t, uint64_t);
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
  uint64_t v32;
  __int128 v33;
  __int128 v34;
  Swift::String v35;
  Swift::Bool v36;
  _QWORD *v37;
  _QWORD *v38;

  OUTLINED_FUNCTION_151_0();
  if ((*(_WORD *)(v14 + 314) & 1) != 0)
  {
    v25 = *(_QWORD *)(v14 + 520);
    v26 = *(_QWORD *)(v14 + 504);
    v27 = *(_QWORD *)(v14 + 512);
    v28 = *(_QWORD *)(v14 + 464);
    v29 = *(_QWORD *)(v14 + 440);
    v31 = *(_QWORD *)(v14 + 344);
    v30 = *(_QWORD *)(v14 + 352);
    v32 = *(_QWORD *)(v14 + 336);
    *(_QWORD *)(v14 + 176) = v29;
    v33 = *(_OWORD *)(v14 + 448);
    *(_OWORD *)(v14 + 184) = v33;
    *(_QWORD *)(v14 + 200) = v28;
    a9 = *(_OWORD *)(v14 + 472);
    a10 = v33;
    v34 = *(_OWORD *)(v14 + 488);
    *(_OWORD *)(v14 + 208) = a9;
    *(_OWORD *)(v14 + 224) = v34;
    *(_QWORD *)(v14 + 240) = v26;
    *(_QWORD *)(v14 + 248) = v27;
    OUTLINED_FUNCTION_27_3();
    v35._countAndFlagsBits = 0xD000000000000023;
    Logging.ulog(_:extended:)(v35, v36);
    v37 = (_QWORD *)swift_allocObject();
    *(_QWORD *)(v14 + 544) = v37;
    v37[2] = v30;
    v37[3] = v25;
    v37[4] = v31;
    v37[5] = *(_QWORD *)(v32 + 40);
    v37[6] = *(_QWORD *)(v32 + 48);
    v37[7] = v29;
    v37[8] = a10;
    v37[9] = v26;
    v37[10] = v27;
    *(_QWORD *)&a10 = *(int *)a9 + (_QWORD)a9;
    swift_unknownObjectRetain_n();
    swift_unknownObjectRetain_n();
    v38 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v14 + 552) = v38;
    *v38 = v14;
    v38[1] = sub_22DFA4010;
  }
  else
  {
    *(_QWORD *)&a10 = **(int **)(v14 + 456) + *(_QWORD *)(v14 + 456);
    v15 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v14 + 568) = v15;
    *v15 = v14;
    v15[1] = sub_22DFA40C4;
  }
  OUTLINED_FUNCTION_166_0();
  return v18(v16, v17, v18, v19, v20, v21, v22, v23, a9, *((_QWORD *)&a9 + 1), a10, *((_QWORD *)&a10 + 1), a11, a12, a13, a14);
}

uint64_t sub_22DFA3F4C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  OUTLINED_FUNCTION_23_2();
  v1 = *(_QWORD *)(v0 + 424);
  v2 = *(_QWORD *)(v0 + 432);
  OUTLINED_FUNCTION_20();
  sub_22DF68638(v1, v2, 1);
  OUTLINED_FUNCTION_15();
  return OUTLINED_FUNCTION_24();
}

uint64_t sub_22DFA3F98()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  void (*v4)(uint64_t);
  uint64_t v5;
  uint64_t (*v6)(void);

  v1 = *(_QWORD *)(v0 + 416);
  v2 = OUTLINED_FUNCTION_57_4();
  __swift_storeEnumTagSinglePayload(v1, 1, 1, v2);
  v3 = OUTLINED_FUNCTION_33_8();
  v4(v3);
  v5 = OUTLINED_FUNCTION_50_5();
  OUTLINED_FUNCTION_34_7(v5);
  OUTLINED_FUNCTION_28();
  OUTLINED_FUNCTION_34();
  OUTLINED_FUNCTION_67();
  v6 = (uint64_t (*)(void))OUTLINED_FUNCTION_152();
  return OUTLINED_FUNCTION_30_9(v6);
}

uint64_t sub_22DFA4010()
{
  uint64_t v0;
  _QWORD *v1;
  _QWORD *v2;
  uint64_t v4;
  _QWORD *v5;
  uint64_t (*v6)(_QWORD, uint64_t);
  _QWORD *v7;

  v7 = (_QWORD *)*v1;
  v2 = v7;
  OUTLINED_FUNCTION_239(&v7);
  v2[70] = v0;
  swift_task_dealloc();
  if (v0)
  {
    OUTLINED_FUNCTION_15();
    return OUTLINED_FUNCTION_17_1();
  }
  else
  {
    swift_release();
    swift_unknownObjectRelease();
    swift_unknownObjectRelease();
    v4 = v2[54];
    v5 = (_QWORD *)OUTLINED_FUNCTION_33();
    v2[71] = v5;
    *v5 = v1;
    v5[1] = sub_22DFA40C4;
    return v6(v2[51], v4);
  }
}

uint64_t sub_22DFA40C4()
{
  uint64_t v0;
  _QWORD *v1;
  _QWORD *v2;
  uint64_t v3;

  OUTLINED_FUNCTION_23_2();
  *v2 = *v1;
  *(_QWORD *)(v3 + 576) = v0;
  swift_task_dealloc();
  OUTLINED_FUNCTION_107();
  OUTLINED_FUNCTION_15();
  return OUTLINED_FUNCTION_24();
}

uint64_t sub_22DFA4120()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void (*v6)(uint64_t, uint64_t, uint64_t);
  uint64_t v7;
  uint64_t v8;
  uint64_t (*v9)(void);

  v1 = v0[51];
  v2 = v0[52];
  v3 = v0[48];
  v4 = v0[49];
  v5 = OUTLINED_FUNCTION_57_4();
  __swift_storeEnumTagSinglePayload(v1, 0, 1, v5);
  v6 = *(void (**)(uint64_t, uint64_t, uint64_t))(v4 + 32);
  v6(v2, v1, v3);
  v7 = OUTLINED_FUNCTION_33_8();
  ((void (*)(uint64_t))v6)(v7);
  v8 = OUTLINED_FUNCTION_50_5();
  OUTLINED_FUNCTION_34_7(v8);
  OUTLINED_FUNCTION_28();
  OUTLINED_FUNCTION_34();
  OUTLINED_FUNCTION_67();
  v9 = (uint64_t (*)(void))OUTLINED_FUNCTION_152();
  return OUTLINED_FUNCTION_53(v9);
}

uint64_t sub_22DFA41AC()
{
  uint64_t v0;

  swift_release();
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  OUTLINED_FUNCTION_149();
  OUTLINED_FUNCTION_58_6();
  OUTLINED_FUNCTION_34();
  OUTLINED_FUNCTION_67();
  return OUTLINED_FUNCTION_13_11(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_22DFA4208()
{
  uint64_t v0;

  OUTLINED_FUNCTION_58_6();
  OUTLINED_FUNCTION_34();
  OUTLINED_FUNCTION_67();
  return OUTLINED_FUNCTION_13_11(*(uint64_t (**)(void))(v0 + 8));
}

void sub_22DFA4240(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  _QWORD *v10;
  uint64_t AssociatedTypeWitness;
  uint64_t AssociatedConformanceWitness;
  uint64_t v13;
  uint64_t v14;

  v10[20] = a9;
  v10[21] = a10;
  v10[18] = a7;
  v10[19] = a8;
  v10[16] = a5;
  v10[17] = a6;
  v10[14] = a3;
  v10[15] = a4;
  v10[12] = a1;
  v10[13] = a2;
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v10[22] = AssociatedTypeWitness;
  v10[23] = *(_QWORD *)(AssociatedTypeWitness - 8);
  v10[24] = swift_task_alloc();
  AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
  v13 = swift_getAssociatedConformanceWitness();
  v14 = swift_getAssociatedConformanceWitness();
  v10[7] = AssociatedTypeWitness;
  v10[8] = AssociatedConformanceWitness;
  v10[9] = v13;
  v10[10] = v14;
  type metadata accessor for ObservationUpdateScope();
}

uint64_t sub_22DFA4338(uint64_t a1)
{
  _QWORD *v1;

  v1[25] = a1;
  v1[26] = *(_QWORD *)(a1 - 8);
  v1[27] = swift_task_alloc();
  v1[28] = swift_task_alloc();
  return swift_task_switch();
}

void sub_22DFA4394()
{
  uint64_t v0;
  uint64_t v1;

  *(_OWORD *)(v0 + 16) = *(_OWORD *)(v0 + 136);
  v1 = *(_QWORD *)(v0 + 168);
  *(_OWORD *)(v0 + 32) = *(_OWORD *)(v0 + 152);
  *(_QWORD *)(v0 + 48) = v1;
  type metadata accessor for TransportObservationHandler();
}

uint64_t sub_22DFA43F0(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;
  char v6;
  void (*v7)();
  uint64_t v8;
  uint64_t v9;
  uint64_t v11;

  *(_QWORD *)(v4 + 216) = a1;
  sub_22DFDDCA0();
  OUTLINED_FUNCTION_27_3();
  OUTLINED_FUNCTION_34_4();
  sub_22DFDDF28();
  v6 = sub_22DF39308();
  *(_BYTE *)(v4 + 312) = v6 & 1;
  static Logging.ulog(_:extended:)(0, 0xE000000000000000, v6 & 1, a1, (uint64_t)&protocol witness table for TransportObservationHandler<A, B>);
  swift_bridgeObjectRelease();
  v7 = *(void (**)())(v11 + 144);
  *(_QWORD *)(v4 + 224) = v7;
  v7();
  if (__swift_getEnumTagSinglePayload(v2, 1, v1) == 1)
  {
    v8 = v3[14];
    v3[31] = OUTLINED_FUNCTION_9_3();
    v3[32] = *(_QWORD *)(v8 + 48);
  }
  else
  {
    v9 = v3[14];
    (*(void (**)(_QWORD, _QWORD, _QWORD))(v3[23] + 32))(v3[24], v3[28], v3[22]);
    v3[34] = OUTLINED_FUNCTION_9_3();
    v3[35] = *(_QWORD *)(v9 + 56);
  }
  sub_22DFDD730();
  OUTLINED_FUNCTION_47_5();
  return swift_task_switch();
}

uint64_t sub_22DFA454C()
{
  uint64_t v0;

  *(_QWORD *)(v0 + 264) = (*(uint64_t (**)(_QWORD, _QWORD))(v0 + 256))(*(_QWORD *)(v0 + 248), *(_QWORD *)(v0 + 112));
  OUTLINED_FUNCTION_15();
  return OUTLINED_FUNCTION_2_2();
}

#error "22DFA460C: call analysis failed (funcsize=58)"

uint64_t sub_22DFA467C()
{
  uint64_t v0;

  *(_QWORD *)(v0 + 288) = (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(v0 + 280))(*(_QWORD *)(v0 + 192), *(_QWORD *)(v0 + 272), *(_QWORD *)(v0 + 112));
  OUTLINED_FUNCTION_15();
  return OUTLINED_FUNCTION_2_2();
}

#error "22DFA4750: call analysis failed (funcsize=62)"

uint64_t sub_22DFA47C0(uint64_t a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v4;
  uint64_t v6;

  v6 = *v2;
  v4 = v6;
  OUTLINED_FUNCTION_239(&v6);
  *(_QWORD *)(v4 + 312) = v1;
  swift_task_dealloc();
  if (!v1)
  {
    swift_bridgeObjectRelease();
    *(_QWORD *)(v4 + 320) = a1;
  }
  OUTLINED_FUNCTION_15();
  return OUTLINED_FUNCTION_17_1();
}

uint64_t sub_22DFA4828()
{
  uint64_t v0;
  uint64_t v1;
  char v2;
  uint64_t v3;
  uint64_t (*v4)(void);

  v1 = *(_QWORD *)(v0 + 320);
  v2 = *(_BYTE *)(v0 + 328);
  v3 = *(_QWORD *)(v0 + 232);
  sub_22DFDDCA0();
  swift_bridgeObjectRelease();
  MEMORY[0x22E322988](v1, &type metadata for ObservationUpdateAcknowlegement);
  sub_22DFDD568();
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_107();
  static Logging.ulog(_:extended:)(0xD000000000000016, 0x800000022DFF20C0, v2, v3, (uint64_t)&protocol witness table for TransportObservationHandler<A, B>);
  OUTLINED_FUNCTION_107();
  OUTLINED_FUNCTION_28();
  OUTLINED_FUNCTION_67();
  OUTLINED_FUNCTION_40();
  v4 = (uint64_t (*)(void))OUTLINED_FUNCTION_152();
  return OUTLINED_FUNCTION_30_9(v4);
}

uint64_t sub_22DFA48FC()
{
  uint64_t v0;

  swift_bridgeObjectRelease();
  swift_task_dealloc();
  OUTLINED_FUNCTION_34();
  OUTLINED_FUNCTION_67();
  return OUTLINED_FUNCTION_13_11(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_22DFA4944(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _OWORD *v3;
  uint64_t v4;
  uint64_t v5;
  __int128 v6;
  __int128 v7;

  *(_QWORD *)(v4 + 232) = a2;
  *(_QWORD *)(v4 + 240) = a3;
  *(_QWORD *)(v4 + 224) = a1;
  *(_QWORD *)(v4 + 248) = *(_QWORD *)(a3 + 24);
  v5 = sub_22DFDDB2C();
  *(_QWORD *)(v4 + 256) = v5;
  *(_QWORD *)(v4 + 264) = *(_QWORD *)(v5 - 8);
  *(_QWORD *)(v4 + 272) = swift_task_alloc();
  v6 = v3[1];
  *(_OWORD *)(v4 + 280) = *v3;
  *(_OWORD *)(v4 + 296) = v6;
  v7 = v3[3];
  *(_OWORD *)(v4 + 312) = v3[2];
  *(_OWORD *)(v4 + 328) = v7;
  *(_OWORD *)(v4 + 344) = v3[4];
  return swift_task_switch();
}

uint64_t sub_22DFA49CC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13)
{
  uint64_t v13;
  __int128 v14;
  uint64_t v15;
  __int128 v16;
  __n128 v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  Swift::Bool v21;
  Swift::String v22;
  uint64_t v23;

  OUTLINED_FUNCTION_151_0();
  v14 = *(_OWORD *)(v13 + 296);
  *(_OWORD *)(v13 + 16) = *(_OWORD *)(v13 + 280);
  v15 = *(_QWORD *)(v13 + 232);
  v16 = *(_OWORD *)(v13 + 312);
  v17 = *(__n128 *)(v13 + 328);
  *(_OWORD *)(v13 + 32) = v14;
  *(_OWORD *)(v13 + 48) = v16;
  OUTLINED_FUNCTION_32_8(*(__n128 *)(v13 + 344), *(double *)&v14, v17);
  OUTLINED_FUNCTION_27_3();
  OUTLINED_FUNCTION_34_4();
  OUTLINED_FUNCTION_9_14();
  sub_22DFDDF28();
  OUTLINED_FUNCTION_60_2();
  if (v15)
  {
    v18 = *(_QWORD *)(v13 + 232);
  }
  else
  {
    swift_getAssociatedTypeWitness();
    sub_22DFDD694();
    if (MEMORY[0x22E322A24]())
    {
      swift_getAssociatedConformanceWitness();
      v18 = sub_22DF77C88();
    }
    else
    {
      swift_bridgeObjectRelease();
      v18 = MEMORY[0x24BEE4B08];
    }
  }
  v19 = *(_QWORD *)(v13 + 232);
  *(_QWORD *)(v13 + 216) = v18;
  swift_getAssociatedTypeWitness();
  swift_getAssociatedConformanceWitness();
  v20 = sub_22DFDD9AC();
  sub_22DFDD448();
  MEMORY[0x22E323AEC](MEMORY[0x24BEE1730], v20);
  sub_22DFDDF34();
  swift_bridgeObjectRelease();
  v21 = sub_22DF39308() & 1;
  *(_BYTE *)(v13 + 392) = v21;
  v22._countAndFlagsBits = a12;
  v22._object = a13;
  Logging.ulog(_:extended:)(v22, v21);
  OUTLINED_FUNCTION_149();
  *(_QWORD *)(v13 + 360) = swift_getObjectType();
  if (v15)
  {
    v23 = *(_QWORD *)(v13 + 288);
    *(_QWORD *)(v13 + 200) = v20;
    *(_QWORD *)(v13 + 208) = MEMORY[0x22E323AEC](MEMORY[0x24BEE1728], v20);
    *(_QWORD *)(v13 + 176) = v19;
    *(_QWORD *)(v13 + 376) = *(_QWORD *)(v23 + 96);
    sub_22DFDD448();
  }
  else
  {
    *(_QWORD *)(v13 + 368) = *(_QWORD *)(*(_QWORD *)(v13 + 288) + 104);
  }
  sub_22DFDD730();
  OUTLINED_FUNCTION_47_5();
  return OUTLINED_FUNCTION_9_16();
}

uint64_t sub_22DFA4C84()
{
  uint64_t v0;

  *(_BYTE *)(v0 + 393) = (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(v0 + 368))(*(_QWORD *)(v0 + 224), *(_QWORD *)(v0 + 360), *(_QWORD *)(v0 + 288)) & 1;
  OUTLINED_FUNCTION_15();
  return OUTLINED_FUNCTION_2_2();
}

uint64_t sub_22DFA4CC4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  Swift::Bool v3;
  _QWORD *v4;
  uint64_t (*v5)(void);
  uint64_t v7;

  if (*(_BYTE *)(v0 + 393) == 1)
  {
    OUTLINED_FUNCTION_19_11(v0 + 280);
    OUTLINED_FUNCTION_27_3();
    OUTLINED_FUNCTION_61_2(v1, v2, v3);
    v4 = (_QWORD *)OUTLINED_FUNCTION_33();
    *(_QWORD *)(v0 + 384) = v4;
    v5 = (uint64_t (*)(void))OUTLINED_FUNCTION_52_4(v4, (uint64_t)sub_22DFA4E3C, v7);
    return OUTLINED_FUNCTION_13_11(v5);
  }
  else
  {
    swift_task_dealloc();
    return OUTLINED_FUNCTION_13_11(*(uint64_t (**)(void))(v0 + 8));
  }
}

uint64_t sub_22DFA4D3C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v2 = *(_QWORD *)(v0 + 264);
  v1 = *(_QWORD *)(v0 + 272);
  v3 = *(_QWORD *)(v0 + 256);
  *(_BYTE *)(v0 + 394) = (*(uint64_t (**)(uint64_t, _QWORD, uint64_t, _QWORD, _QWORD))(v0 + 376))(v1, *(_QWORD *)(v0 + 224), v0 + 176, *(_QWORD *)(v0 + 360), *(_QWORD *)(v0 + 288)) & 1;
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  __swift_destroy_boxed_opaque_existential_0Tm(v0 + 176);
  OUTLINED_FUNCTION_15();
  return swift_task_switch();
}

uint64_t sub_22DFA4DC4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  Swift::Bool v3;
  _QWORD *v4;
  uint64_t (*v5)(void);
  uint64_t v7;

  if (*(_BYTE *)(v0 + 394) == 1)
  {
    OUTLINED_FUNCTION_19_11(v0 + 280);
    OUTLINED_FUNCTION_27_3();
    OUTLINED_FUNCTION_61_2(v1, v2, v3);
    v4 = (_QWORD *)OUTLINED_FUNCTION_33();
    *(_QWORD *)(v0 + 384) = v4;
    v5 = (uint64_t (*)(void))OUTLINED_FUNCTION_52_4(v4, (uint64_t)sub_22DFA4E3C, v7);
    return OUTLINED_FUNCTION_13_11(v5);
  }
  else
  {
    swift_task_dealloc();
    return OUTLINED_FUNCTION_13_11(*(uint64_t (**)(void))(v0 + 8));
  }
}

uint64_t sub_22DFA4E3C()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  OUTLINED_FUNCTION_239(&v2);
  swift_task_dealloc();
  swift_task_dealloc();
  return OUTLINED_FUNCTION_72((uint64_t (*)(void))v0[1]);
}

uint64_t sub_22DFA4E7C()
{
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  return swift_deallocObject();
}

void sub_22DFA4EA8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  uint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;

  OUTLINED_FUNCTION_94_2();
  v21 = *(_QWORD *)(v10 + 16);
  v12 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v11 + 16) = v12;
  *v12 = v11;
  v12[1] = sub_22DF35188;
  OUTLINED_FUNCTION_40_1();
  sub_22DFA4240(v13, v14, v15, v16, v17, v18, v19, v20, v21, a10);
}

uint64_t TransportObservationHandler.handleLostMember(_:)(uint64_t a1, uint64_t a2)
{
  _OWORD *v2;
  uint64_t v3;
  __int128 v4;
  __int128 v5;

  *(_QWORD *)(v3 + 176) = a1;
  *(_QWORD *)(v3 + 184) = a2;
  v4 = v2[1];
  *(_OWORD *)(v3 + 192) = *v2;
  *(_OWORD *)(v3 + 208) = v4;
  v5 = v2[3];
  *(_OWORD *)(v3 + 224) = v2[2];
  *(_OWORD *)(v3 + 240) = v5;
  *(_OWORD *)(v3 + 256) = v2[4];
  OUTLINED_FUNCTION_15();
  return swift_task_switch();
}

uint64_t sub_22DFA4F68()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  Swift::Bool v5;
  Swift::String v6;
  _QWORD *v7;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  v13 = v0[32];
  v14 = v0[33];
  v11 = v0[30];
  v12 = v0[31];
  v9 = v0[28];
  v10 = v0[29];
  v2 = v0[26];
  v1 = v0[27];
  v4 = v0[24];
  v3 = v0[25];
  v0[2] = v4;
  v0[3] = v3;
  v0[4] = v2;
  v0[5] = v1;
  v0[6] = v9;
  v0[7] = v10;
  v0[8] = v11;
  v0[9] = v12;
  v0[10] = v13;
  v0[11] = v14;
  OUTLINED_FUNCTION_27_3();
  OUTLINED_FUNCTION_34_4();
  OUTLINED_FUNCTION_9_14();
  sub_22DFDDF28();
  v5 = sub_22DF39308() & 1;
  v6._countAndFlagsBits = 0;
  v6._object = (void *)0xE000000000000000;
  Logging.ulog(_:extended:)(v6, v5);
  OUTLINED_FUNCTION_149();
  v0[12] = v4;
  v0[13] = v3;
  v0[14] = v2;
  v0[15] = v1;
  v0[16] = v9;
  v0[17] = v10;
  v0[18] = v11;
  v0[19] = v12;
  v0[20] = v13;
  v0[21] = v14;
  v7 = (_QWORD *)swift_task_alloc();
  v0[34] = v7;
  *v7 = v0;
  v7[1] = sub_22DFA50C4;
  return sub_22DFA4944(v0[22], 0, v0[23]);
}

uint64_t sub_22DFA50C4()
{
  uint64_t v0;

  OUTLINED_FUNCTION_23_2();
  OUTLINED_FUNCTION_20();
  return OUTLINED_FUNCTION_72(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_22DFA50F0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  _QWORD *v9;

  v9 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v4 + 16) = v9;
  *v9 = v4;
  v9[1] = sub_22DF35188;
  return TransportObservationHandler.handle(_:from:)(a1, a2, a3, a4);
}

uint64_t static TransportObservationHandler.logRemovesGenericsFromCategory.getter()
{
  return 0;
}

void sub_22DFA5170()
{
  JUMPOUT(0x22E323AECLL);
}

uint64_t sub_22DFA5180(uint64_t a1)
{
  uint64_t result;

  result = MEMORY[0x22E323AEC](&protocol conformance descriptor for TransportObservationHandler<A, B>);
  *(_QWORD *)(a1 + 8) = result;
  return result;
}

uint64_t sub_22DFA51AC(uint64_t a1, uint64_t a2)
{
  return *(_QWORD *)(a2 + 48);
}

uint64_t sub_22DFA51B4(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v5;

  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_22DF2F8F0;
  return TransportObservationHandler.handleLostMember(_:)(a1, a2);
}

uint64_t sub_22DFA5210()
{
  swift_unknownObjectRelease();
  swift_release();
  swift_release();
  swift_release();
  return swift_unknownObjectRelease();
}

uint64_t sub_22DFA5250(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  v3 = *(_QWORD *)(a2 + 56);
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 56) = v3;
  *(_OWORD *)(a1 + 64) = *(_OWORD *)(a2 + 64);
  swift_unknownObjectRetain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_unknownObjectRetain();
  return a1;
}

_QWORD *sub_22DFA52E8(_QWORD *a1, _QWORD *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v4 = a2[1];
  *a1 = *a2;
  swift_unknownObjectRetain();
  swift_unknownObjectRelease();
  a1[1] = v4;
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
  swift_unknownObjectRetain();
  swift_unknownObjectRelease();
  a1[9] = v8;
  return a1;
}

void *__swift_memcpy80_8(void *a1, const void *a2)
{
  return memcpy(a1, a2, 0x50uLL);
}

_OWORD *sub_22DFA539C(_OWORD *a1, _OWORD *a2)
{
  __int128 v4;

  swift_unknownObjectRelease();
  v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  swift_release();
  a1[2] = a2[2];
  swift_release();
  a1[3] = a2[3];
  swift_release();
  swift_unknownObjectRelease();
  a1[4] = a2[4];
  return a1;
}

uint64_t sub_22DFA5408(uint64_t *a1, int a2)
{
  uint64_t v2;

  if (a2)
  {
    if (a2 < 0 && *((_BYTE *)a1 + 80))
    {
      LODWORD(v2) = *(_DWORD *)a1 + 0x7FFFFFFF;
    }
    else
    {
      v2 = *a1;
      if ((unint64_t)*a1 >= 0xFFFFFFFF)
        LODWORD(v2) = -1;
    }
  }
  else
  {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t sub_22DFA5448(uint64_t result, int a2, int a3)
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
      *(_QWORD *)result = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 80) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

void type metadata accessor for TransportObservationHandler()
{
  JUMPOUT(0x22E323A68);
}

uint64_t sub_22DFA54A8()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  int *v4;

  OUTLINED_FUNCTION_94_2();
  OUTLINED_FUNCTION_12_18();
  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 16) = v1;
  *v1 = v0;
  v1[1] = sub_22DF35188;
  OUTLINED_FUNCTION_4_22();
  OUTLINED_FUNCTION_40_1();
  return sub_22DFA37E4(v2, v3, v4);
}

uint64_t OUTLINED_FUNCTION_9_16()
{
  return swift_task_switch();
}

uint64_t OUTLINED_FUNCTION_10_18(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t (*a7)(void))
{
  return a7();
}

uint64_t OUTLINED_FUNCTION_11_18(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t OUTLINED_FUNCTION_14_15()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_16_11@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;

  *a1 = v2;
  a1[1] = a2;
  return *(_QWORD *)(v2 + 96);
}

__n128 OUTLINED_FUNCTION_19_11@<Q0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  __int128 v2;
  __int128 v3;
  __int128 v4;
  __n128 result;

  v2 = *(_OWORD *)(a1 + 16);
  *(_OWORD *)(v1 + 96) = *(_OWORD *)a1;
  v3 = *(_OWORD *)(a1 + 32);
  v4 = *(_OWORD *)(a1 + 48);
  *(_OWORD *)(v1 + 112) = v2;
  *(_OWORD *)(v1 + 128) = v3;
  result = *(__n128 *)(a1 + 64);
  *(_OWORD *)(v1 + 144) = v4;
  *(__n128 *)(v1 + 160) = result;
  return result;
}

void OUTLINED_FUNCTION_21_9(char a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  static Logging.ulog(_:_:extended:)(20, v2, v1, a1 & 1, v3, v4);
}

uint64_t OUTLINED_FUNCTION_22_10()
{
  return sub_22DFDD568();
}

uint64_t OUTLINED_FUNCTION_25_11()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(v1 + 88) = v0;
  *(_QWORD *)(v1 + 296) = v0;
  return sub_22DFDD9AC();
}

uint64_t OUTLINED_FUNCTION_27_5()
{
  return swift_task_alloc();
}

uint64_t OUTLINED_FUNCTION_30_9(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t OUTLINED_FUNCTION_32_8(__n128 a1, double a2, __n128 a3)
{
  __n128 *v3;

  v3[3] = a3;
  v3[4] = a1;
  return sub_22DFDDCA0();
}

uint64_t OUTLINED_FUNCTION_33_8()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + 400);
}

uint64_t OUTLINED_FUNCTION_34_7(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  return sub_22DF93710(v1, a1, v3, v2, v4);
}

uint64_t OUTLINED_FUNCTION_36_5()
{
  return sub_22DFDDCA0();
}

uint64_t OUTLINED_FUNCTION_37_8()
{
  return swift_getAssociatedConformanceWitness();
}

uint64_t OUTLINED_FUNCTION_38_9()
{
  return swift_allocObject();
}

uint64_t OUTLINED_FUNCTION_39_6()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t (*v2)(uint64_t, uint64_t);

  return v2(v1, v0);
}

uint64_t OUTLINED_FUNCTION_40_4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  uint64_t v10;
  uint64_t v11;

  return (*(uint64_t (**)(uint64_t, uint64_t))(a10 + 8))(v10, v11);
}

uint64_t OUTLINED_FUNCTION_48_1()
{
  return sub_22DFDD568();
}

uint64_t OUTLINED_FUNCTION_49_2()
{
  return sub_22DFDDF28();
}

uint64_t OUTLINED_FUNCTION_50_5()
{
  return swift_checkMetadataState();
}

uint64_t OUTLINED_FUNCTION_51_5()
{
  return swift_task_dealloc();
}

uint64_t OUTLINED_FUNCTION_52_4@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>, uint64_t a3)
{
  uint64_t v3;

  *a1 = v3;
  a1[1] = a2;
  return a3;
}

uint64_t OUTLINED_FUNCTION_53_4()
{
  return sub_22DF39308();
}

uint64_t OUTLINED_FUNCTION_57_4()
{
  return swift_checkMetadataState();
}

uint64_t OUTLINED_FUNCTION_58_6()
{
  return swift_task_dealloc();
}

BOOL OUTLINED_FUNCTION_59_5()
{
  return sub_22DFB1358();
}

uint64_t OUTLINED_FUNCTION_60_2()
{
  return sub_22DFDD568();
}

void OUTLINED_FUNCTION_61_2(uint64_t a1, uint64_t a2, Swift::Bool a3)
{
  unint64_t v3;

  v3 = 0xD000000000000025;
  Logging.ulog(_:extended:)(*(Swift::String *)(&a2 - 1), a3);
}

uint64_t sub_22DFA57E8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, unsigned __int8 a5)
{
  uint64_t result;

  if (a5 <= 1u)
  {
    sub_22DFDD448();
    return sub_22DFDD448();
  }
  return result;
}

uint64_t destroy for TransportMessagingError(uint64_t a1)
{
  return sub_22DFA5834(*(_QWORD *)a1, *(_QWORD *)(a1 + 8), *(_QWORD *)(a1 + 16), *(_QWORD *)(a1 + 24), *(_BYTE *)(a1 + 32));
}

uint64_t sub_22DFA5834(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, unsigned __int8 a5)
{
  uint64_t result;

  if (a5 <= 1u)
  {
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t initializeWithCopy for TransportMessagingError(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unsigned __int8 v7;

  v3 = *(_QWORD *)a2;
  v4 = *(_QWORD *)(a2 + 8);
  v5 = *(_QWORD *)(a2 + 16);
  v6 = *(_QWORD *)(a2 + 24);
  v7 = *(_BYTE *)(a2 + 32);
  sub_22DFA57E8(*(_QWORD *)a2, v4, v5, v6, v7);
  *(_QWORD *)a1 = v3;
  *(_QWORD *)(a1 + 8) = v4;
  *(_QWORD *)(a1 + 16) = v5;
  *(_QWORD *)(a1 + 24) = v6;
  *(_BYTE *)(a1 + 32) = v7;
  return a1;
}

uint64_t assignWithCopy for TransportMessagingError(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unsigned __int8 v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unsigned __int8 v12;

  v3 = *(_QWORD *)a2;
  v4 = *(_QWORD *)(a2 + 8);
  v5 = *(_QWORD *)(a2 + 16);
  v6 = *(_QWORD *)(a2 + 24);
  v7 = *(_BYTE *)(a2 + 32);
  sub_22DFA57E8(*(_QWORD *)a2, v4, v5, v6, v7);
  v8 = *(_QWORD *)a1;
  v9 = *(_QWORD *)(a1 + 8);
  v10 = *(_QWORD *)(a1 + 16);
  v11 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)a1 = v3;
  *(_QWORD *)(a1 + 8) = v4;
  *(_QWORD *)(a1 + 16) = v5;
  *(_QWORD *)(a1 + 24) = v6;
  v12 = *(_BYTE *)(a1 + 32);
  *(_BYTE *)(a1 + 32) = v7;
  sub_22DFA5834(v8, v9, v10, v11, v12);
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

uint64_t assignWithTake for TransportMessagingError(uint64_t a1, uint64_t a2)
{
  char v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  unsigned __int8 v9;

  v3 = *(_BYTE *)(a2 + 32);
  v4 = *(_QWORD *)a1;
  v6 = *(_QWORD *)(a1 + 8);
  v5 = *(_QWORD *)(a1 + 16);
  v7 = *(_QWORD *)(a1 + 24);
  v8 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v8;
  v9 = *(_BYTE *)(a1 + 32);
  *(_BYTE *)(a1 + 32) = v3;
  sub_22DFA5834(v4, v6, v5, v7, v9);
  return a1;
}

uint64_t getEnumTagSinglePayload for TransportMessagingError(uint64_t a1, unsigned int a2)
{
  int v2;
  unsigned int v3;

  if (a2)
  {
    if (a2 >= 0xFE && *(_BYTE *)(a1 + 33))
    {
      v2 = *(_DWORD *)a1 + 253;
    }
    else
    {
      v3 = *(unsigned __int8 *)(a1 + 32);
      if (v3 <= 2)
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

uint64_t storeEnumTagSinglePayload for TransportMessagingError(uint64_t result, unsigned int a2, unsigned int a3)
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
      *(_BYTE *)(result + 32) = -(char)a2;
  }
  return result;
}

uint64_t sub_22DFA5A20(uint64_t a1)
{
  if (*(unsigned __int8 *)(a1 + 32) <= 1u)
    return *(unsigned __int8 *)(a1 + 32);
  else
    return (*(_DWORD *)a1 + 2);
}

uint64_t sub_22DFA5A38(uint64_t result, unsigned int a2)
{
  if (a2 >= 2)
  {
    *(_QWORD *)result = a2 - 2;
    *(_QWORD *)(result + 8) = 0;
    LOBYTE(a2) = 2;
    *(_QWORD *)(result + 16) = 0;
    *(_QWORD *)(result + 24) = 0;
  }
  *(_BYTE *)(result + 32) = a2;
  return result;
}

ValueMetadata *type metadata accessor for TransportMessagingError()
{
  return &type metadata for TransportMessagingError;
}

uint64_t storeEnumTagSinglePayload for TransportObservationError(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_22DFA5AB0 + 4 * byte_22DFE8225[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_22DFA5AE4 + 4 * byte_22DFE8220[v4]))();
}

uint64_t sub_22DFA5AE4(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_22DFA5AEC(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x22DFA5AF4);
  return result;
}

uint64_t sub_22DFA5B00(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x22DFA5B08);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_22DFA5B0C(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_22DFA5B14(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for TransportObservationError()
{
  return &type metadata for TransportObservationError;
}

unint64_t sub_22DFA5B34()
{
  unint64_t result;

  result = qword_255DDB960[0];
  if (!qword_255DDB960[0])
  {
    result = MEMORY[0x22E323AEC](&unk_22DFE82BC, &type metadata for TransportObservationError);
    atomic_store(result, qword_255DDB960);
  }
  return result;
}

void sub_22DFA5B70()
{
  OUTLINED_FUNCTION_1_20();
  OUTLINED_FUNCTION_1_20();
  OUTLINED_FUNCTION_0_22();
  OUTLINED_FUNCTION_0_22();
  OUTLINED_FUNCTION_0_22();
  type metadata accessor for ObservationUpdateScope();
}

uint64_t sub_22DFA5C18(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t TupleTypeMetadata2;
  uint64_t v5;
  uint64_t v6;
  _BYTE *v7;
  uint64_t v8;
  uint64_t v9;
  _BYTE *v10;
  _BYTE *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _BYTE v17[96];

  v3 = sub_22DFDDB2C();
  TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
  v5 = MEMORY[0x24BDAC7A8](TupleTypeMetadata2);
  v7 = &v17[-v6];
  v8 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v10 = &v17[-v9];
  OUTLINED_FUNCTION_1_20();
  swift_getAssociatedConformanceWitness();
  sub_22DFDCFE0();
  __swift_storeEnumTagSinglePayload((uint64_t)v10, 1, 1, a1);
  v11 = &v7[*(int *)(TupleTypeMetadata2 + 48)];
  v13 = *(_QWORD *)(v1 - 128);
  v12 = *(_QWORD *)(v1 - 120);
  v14 = *(_QWORD *)(v13 - 8);
  (*(void (**)(_BYTE *, uint64_t, uint64_t))(v14 + 16))(v7, v12, v13);
  (*(void (**)(_BYTE *, _BYTE *, uint64_t))(v8 + 32))(v11, v10, v3);
  v15 = sub_22DFDCFEC();
  (*(void (**)(uint64_t, uint64_t))(v14 + 8))(v12, v13);
  return v15;
}

uint64_t type metadata accessor for TransportObservation(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for TransportObservation);
}

uint64_t sub_22DFA5D80(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(a6 + 152))(a1, a2, a3, a5, a6);
}

uint64_t sub_22DFA5DAC()
{
  return swift_retain();
}

uint64_t sub_22DFA5DB4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_22DFA5D80(a1, a2, a3, a4, *(_QWORD *)(a4 + 16), *(_QWORD *)(a4 + 24));
}

unint64_t sub_22DFA5DBC(uint64_t a1)
{
  MEMORY[0x22E323AEC](&unk_22DFE83E8, a1);
  return sub_22DF60D98();
}

uint64_t sub_22DFA5DF0(uint64_t a1)
{
  uint64_t result;

  result = MEMORY[0x22E323AEC](&unk_22DFE83C0);
  *(_QWORD *)(a1 + 8) = result;
  return result;
}

uint64_t OUTLINED_FUNCTION_0_22()
{
  return swift_getAssociatedConformanceWitness();
}

uint64_t OUTLINED_FUNCTION_1_20()
{
  return swift_getAssociatedTypeWitness();
}

void sub_22DFA5E3C(uint64_t a1, void (*a2)(__int128 *, _OWORD *, _OWORD *, char *), uint64_t a3)
{
  uint64_t v3;
  uint64_t v5;
  int v6;
  unint64_t v7;
  int v8;
  uint64_t v9;
  char v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  _OWORD *v14;
  __int128 v15;
  __int128 v16;
  uint64_t v17;
  _OWORD v19[2];
  uint64_t v20;
  _OWORD v21[2];
  uint64_t v22;
  _BYTE v23[8];
  _BYTE v24[32];
  __int128 v25;
  _OWORD v26[2];
  uint64_t v27;
  uint64_t v28;

  v28 = a3;
  v3 = *(_QWORD *)(a1 + 16);
  if (v3)
  {
    v27 = MEMORY[0x24BEE4AF8];
    sub_22DF48068(0, v3, 0);
    v5 = sub_22DF97428(a1);
    if ((v5 & 0x8000000000000000) == 0)
    {
      v7 = v5;
      if (v5 < 1 << *(_BYTE *)(a1 + 32))
      {
        v8 = v6;
        v9 = a1 + 64;
        while ((*(_QWORD *)(v9 + 8 * (v7 >> 6)) & (1 << v7)) != 0)
        {
          if (v8 != *(_DWORD *)(a1 + 36))
            goto LABEL_20;
          v10 = *(_BYTE *)(*(_QWORD *)(a1 + 48) + v7);
          sub_22DF35140(*(_QWORD *)(a1 + 56) + 32 * v7, (uint64_t)v24);
          v23[0] = v10;
          LOBYTE(v21[0]) = v10;
          sub_22DF35140((uint64_t)v24, (uint64_t)v21 + 8);
          v19[0] = v21[0];
          v19[1] = v21[1];
          v20 = v22;
          sub_22DF37EEC((uint64_t)v23, &qword_255DDBA68);
          a2(&v25, v26, v19, (char *)v19 + 8);
          sub_22DF37EEC((uint64_t)v19, &qword_255DDBA68);
          v11 = v27;
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
          {
            sub_22DF48068(0, *(_QWORD *)(v11 + 16) + 1, 1);
            v11 = v27;
          }
          v13 = *(_QWORD *)(v11 + 16);
          v12 = *(_QWORD *)(v11 + 24);
          if (v13 >= v12 >> 1)
          {
            sub_22DF48068(v12 > 1, v13 + 1, 1);
            v11 = v27;
          }
          *(_QWORD *)(v11 + 16) = v13 + 1;
          v14 = (_OWORD *)(v11 + 48 * v13);
          v15 = v25;
          v16 = v26[1];
          v14[3] = v26[0];
          v14[4] = v16;
          v14[2] = v15;
          if ((uint64_t)v7 >= -(-1 << *(_BYTE *)(a1 + 32)))
            goto LABEL_21;
          v9 = a1 + 64;
          if ((*(_QWORD *)(a1 + 64 + 8 * (v7 >> 6)) & (1 << v7)) == 0)
            goto LABEL_22;
          if (v8 != *(_DWORD *)(a1 + 36))
            goto LABEL_23;
          v17 = sub_22DFDDBEC();
          if (!--v3)
            return;
          v7 = v17;
          if ((v17 & 0x8000000000000000) == 0)
          {
            v8 = *(_DWORD *)(a1 + 36);
            if (v17 < 1 << *(_BYTE *)(a1 + 32))
              continue;
          }
          goto LABEL_24;
        }
        __break(1u);
LABEL_20:
        __break(1u);
LABEL_21:
        __break(1u);
LABEL_22:
        __break(1u);
LABEL_23:
        __break(1u);
      }
    }
LABEL_24:
    __break(1u);
  }
}

void sub_22DFA60B4(uint64_t a1, void (*a2)(_OWORD *__return_ptr, _QWORD *, _BYTE *))
{
  uint64_t v3;
  int64_t v4;
  unint64_t v5;
  int64_t v6;
  unint64_t v7;
  unint64_t v8;
  int64_t v9;
  unint64_t v10;
  int64_t v11;
  int64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  __int128 v21;
  __int128 v22;
  uint64_t v23;
  _OWORD v24[2];
  uint64_t v25;
  _QWORD v26[2];
  _BYTE v27[32];
  _QWORD v28[6];
  uint64_t v29;

  sub_22DFA89A8(a1, v28);
  v3 = v28[0];
  v29 = v28[1];
  v4 = v28[3];
  v5 = v28[4];
  v6 = (unint64_t)(v28[2] + 64) >> 6;
  sub_22DFDD448();
  v20 = MEMORY[0x24BEE4AF8];
  while (1)
  {
    if (v5)
    {
      v7 = __clz(__rbit64(v5));
      v5 &= v5 - 1;
      v8 = v7 | (v4 << 6);
      goto LABEL_20;
    }
    v9 = v4 + 1;
    if (__OFADD__(v4, 1))
      break;
    if (v9 >= v6)
      goto LABEL_27;
    v10 = *(_QWORD *)(v29 + 8 * v9);
    v11 = v4 + 1;
    if (!v10)
    {
      v11 = v4 + 2;
      if (v4 + 2 >= v6)
        goto LABEL_27;
      v10 = *(_QWORD *)(v29 + 8 * v11);
      if (!v10)
      {
        v11 = v4 + 3;
        if (v4 + 3 >= v6)
          goto LABEL_27;
        v10 = *(_QWORD *)(v29 + 8 * v11);
        if (!v10)
        {
          v11 = v4 + 4;
          if (v4 + 4 >= v6)
            goto LABEL_27;
          v10 = *(_QWORD *)(v29 + 8 * v11);
          if (!v10)
          {
            v11 = v4 + 5;
            if (v4 + 5 >= v6)
              goto LABEL_27;
            v10 = *(_QWORD *)(v29 + 8 * v11);
            if (!v10)
            {
              v12 = v4 + 6;
              while (v12 < v6)
              {
                v10 = *(_QWORD *)(v29 + 8 * v12++);
                if (v10)
                {
                  v11 = v12 - 1;
                  goto LABEL_19;
                }
              }
LABEL_27:
              swift_release();
              return;
            }
          }
        }
      }
    }
LABEL_19:
    v5 = (v10 - 1) & v10;
    v8 = __clz(__rbit64(v10)) + (v11 << 6);
    v4 = v11;
LABEL_20:
    v13 = (uint64_t *)(*(_QWORD *)(v3 + 48) + 16 * v8);
    v14 = *v13;
    v15 = v13[1];
    sub_22DF35140(*(_QWORD *)(v3 + 56) + 32 * v8, (uint64_t)v27);
    v26[0] = v14;
    v26[1] = v15;
    sub_22DFDD448();
    a2(v24, v26, v27);
    sub_22DF37EEC((uint64_t)v26, &qword_255DD81F0);
    if (v25)
    {
      v21 = v24[0];
      v22 = v24[1];
      v23 = v25;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_22DF47050();
        v20 = v18;
      }
      v16 = *(_QWORD *)(v20 + 16);
      if (v16 >= *(_QWORD *)(v20 + 24) >> 1)
      {
        sub_22DF47050();
        v20 = v19;
      }
      *(_QWORD *)(v20 + 16) = v16 + 1;
      v17 = v20 + 40 * v16;
      *(_QWORD *)(v17 + 64) = v23;
      *(_OWORD *)(v17 + 32) = v21;
      *(_OWORD *)(v17 + 48) = v22;
    }
    else
    {
      sub_22DF37EEC((uint64_t)v24, &qword_255DDBA40);
    }
  }
  __break(1u);
}

void sub_22DFA631C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t inited;

  v1 = *(unsigned __int8 *)(v0 + 16);
  __swift_instantiateConcreteTypeFromMangledName(&qword_255DD81C8);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_22DFE17C0;
  *(_BYTE *)(inited + 32) = 0;
  __asm { BR              X9 }
}

uint64_t sub_22DFA6380()
{
  _QWORD *v0;
  int v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v3 = sub_22DFA68C8(1u);
  v0[8] = MEMORY[0x24BEE0D00];
  v0[5] = v3;
  v0[6] = v4;
  sub_22DF33E54();
  *(_QWORD *)(v2 - 56) = sub_22DFDD430();
  return ((uint64_t (*)())((char *)sub_22DFA6414 + 4 * byte_22DFE8417[v1]))();
}

uint64_t sub_22DFA6414()
{
  void *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD v11[4];
  uint64_t v12;

  swift_getErrorValue();
  v3 = *(_QWORD *)(v2 - 240);
  v4 = *(_QWORD *)(v2 - 232);
  v5 = v1;
  OUTLINED_FUNCTION_15_16();
  OUTLINED_FUNCTION_13_19();
  OUTLINED_FUNCTION_16_12();
  if (v4 >> 60 == 15)
  {
    *(_OWORD *)(v2 - 160) = 0u;
    *(_OWORD *)(v2 - 144) = 0u;
  }
  else
  {
    *(_QWORD *)(v2 - 136) = MEMORY[0x24BDCDDE8];
    *(_QWORD *)(v2 - 160) = v3;
    *(_QWORD *)(v2 - 152) = v4;
  }
  OUTLINED_FUNCTION_10_19();
  sub_22DFA6A08(v1, v0, 0);
  v6 = *(_QWORD *)(v2 - 56);
  MEMORY[0x24BDAC7A8](v7);
  v11[2] = sub_22DFA6E1C;
  v11[3] = 0;
  sub_22DFA5E3C(v6, (void (*)(__int128 *, _OWORD *, _OWORD *, char *))sub_22DFA8A78, (uint64_t)v11);
  sub_22DFA7750(v8, &qword_255DDBA48, (void (*)(uint64_t, uint64_t, uint64_t *))sub_22DFA86B4);
  OUTLINED_FUNCTION_5_22();
  v9 = sub_22DFA6EC0((uint64_t)&v12);
  OUTLINED_FUNCTION_46();
  return v9;
}

uint64_t sub_22DFA65B8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  unint64_t v3;
  uint64_t result;
  uint64_t v5;
  char *v6;
  __int128 v7;
  uint64_t v8;

  v3 = sub_22DFA7280(a1);
  result = OUTLINED_FUNCTION_46();
  if (v3)
  {
    MEMORY[0x24BDAC7A8](result);
    sub_22DFA60B4(v3, (void (*)(_OWORD *__return_ptr, _QWORD *, _BYTE *))sub_22DFA89F8);
    sub_22DFA7750(v5, &qword_255DDBA38, (void (*)(uint64_t, uint64_t, uint64_t *))sub_22DFA83E0);
    swift_bridgeObjectRelease();
    OUTLINED_FUNCTION_3_22(0, &v7);
    if (v8)
    {
      if ((OUTLINED_FUNCTION_0_23() & 1) != 0)
      {
        v6 = (char *)&loc_22DFA6698 + 4 * byte_22DFE841E[sub_22DFA6888()];
        __asm { BR              X10 }
      }
      result = OUTLINED_FUNCTION_46();
    }
    else
    {
      OUTLINED_FUNCTION_46();
      result = sub_22DF37EEC((uint64_t)&v7, &qword_255DD7E80);
    }
  }
  *(_QWORD *)a2 = 0;
  *(_QWORD *)(a2 + 8) = 0;
  *(_BYTE *)(a2 + 16) = -1;
  return result;
}

void sub_22DFA672C()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  OUTLINED_FUNCTION_3_22(1, (_OWORD *)(v2 - 72));
  OUTLINED_FUNCTION_46();
  if (*(_QWORD *)(v2 - 48))
  {
    v3 = OUTLINED_FUNCTION_0_23();
    if ((v3 & 1) != 0)
    {
      OUTLINED_FUNCTION_161(v3, (unint64_t *)&qword_255DD82B8);
      OUTLINED_FUNCTION_18_12();
      OUTLINED_FUNCTION_8_22();
      if (v1)
      {
        *v0 = v1;
        v0[1] = 0;
        JUMPOUT(0x22DFA6714);
      }
    }
    JUMPOUT(0x22DFA670CLL);
  }
  JUMPOUT(0x22DFA66F4);
}

void sub_22DFA6784()
{
  _QWORD *v0;

  OUTLINED_FUNCTION_46();
  *v0 = 0;
  v0[1] = 0;
  JUMPOUT(0x22DFA6714);
}

void sub_22DFA6820()
{
  uint64_t v0;

  OUTLINED_FUNCTION_3_22(4, (_OWORD *)(v0 - 72));
  OUTLINED_FUNCTION_46();
  if (*(_QWORD *)(v0 - 48))
  {
    if ((OUTLINED_FUNCTION_0_23() & 1) != 0)
    {
      OUTLINED_FUNCTION_22_11();
      JUMPOUT(0x22DFA6714);
    }
    JUMPOUT(0x22DFA670CLL);
  }
  JUMPOUT(0x22DFA66F4);
}

void sub_22DFA6854()
{
  uint64_t v0;

  OUTLINED_FUNCTION_3_22(5, (_OWORD *)(v0 - 72));
  OUTLINED_FUNCTION_46();
  if (*(_QWORD *)(v0 - 48))
  {
    if ((OUTLINED_FUNCTION_0_23() & 1) != 0)
    {
      OUTLINED_FUNCTION_22_11();
      JUMPOUT(0x22DFA6714);
    }
    JUMPOUT(0x22DFA670CLL);
  }
  JUMPOUT(0x22DFA66F4);
}

uint64_t sub_22DFA6888()
{
  unint64_t v0;

  sub_22DFDDDFC();
  OUTLINED_FUNCTION_5_22();
  if (v0 >= 9)
    return 9;
  else
    return v0;
}

uint64_t sub_22DFA68C8(unsigned __int8 a1)
{
  return ((uint64_t (*)(unint64_t, unint64_t))((char *)sub_22DFA6904 + 4 * byte_22DFE8428[a1]))(0xD000000000000015, 0x800000022DFEEF10);
}

uint64_t sub_22DFA6904()
{
  uint64_t v0;

  return v0 + 5;
}

uint64_t sub_22DFA6974()
{
  return 0x7365757165526F6ELL;
}

uint64_t sub_22DFA6998()
{
  return 0x6E6F707365526F6ELL;
}

id sub_22DFA69C0(id result, id a2, char a3)
{
  switch(a3)
  {
    case 0:
    case 1:
      result = result;
      break;
    case 2:
    case 3:
    case 4:
    case 5:
      result = (id)sub_22DFDD448();
      break;
    default:
      return result;
  }
  return result;
}

void destroy for RapportTransportError(uint64_t a1)
{
  sub_22DFA6A08(*(void **)a1, *(id *)(a1 + 8), *(_BYTE *)(a1 + 16));
}

void sub_22DFA6A08(void *a1, id a2, char a3)
{
  switch(a3)
  {
    case 0:
    case 1:

      break;
    case 2:
    case 3:
    case 4:
    case 5:
      swift_bridgeObjectRelease();
      break;
    default:
      return;
  }
}

uint64_t _s15HomePodSettings21RapportTransportErrorOwCP_0(uint64_t a1, uint64_t a2)
{
  id v3;
  void *v4;
  char v5;

  v3 = *(id *)a2;
  v4 = *(void **)(a2 + 8);
  v5 = *(_BYTE *)(a2 + 16);
  sub_22DFA69C0(*(id *)a2, v4, v5);
  *(_QWORD *)a1 = v3;
  *(_QWORD *)(a1 + 8) = v4;
  *(_BYTE *)(a1 + 16) = v5;
  return a1;
}

uint64_t assignWithCopy for RapportTransportError(uint64_t a1, uint64_t a2)
{
  id v3;
  void *v4;
  char v5;
  void *v6;
  void *v7;
  char v8;

  v3 = *(id *)a2;
  v4 = *(void **)(a2 + 8);
  v5 = *(_BYTE *)(a2 + 16);
  sub_22DFA69C0(*(id *)a2, v4, v5);
  v6 = *(void **)a1;
  v7 = *(void **)(a1 + 8);
  *(_QWORD *)a1 = v3;
  *(_QWORD *)(a1 + 8) = v4;
  v8 = *(_BYTE *)(a1 + 16);
  *(_BYTE *)(a1 + 16) = v5;
  sub_22DFA6A08(v6, v7, v8);
  return a1;
}

uint64_t assignWithTake for RapportTransportError(uint64_t a1, uint64_t a2)
{
  char v3;
  void *v4;
  void *v5;
  char v6;

  v3 = *(_BYTE *)(a2 + 16);
  v4 = *(void **)a1;
  v5 = *(void **)(a1 + 8);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  v6 = *(_BYTE *)(a1 + 16);
  *(_BYTE *)(a1 + 16) = v3;
  sub_22DFA6A08(v4, v5, v6);
  return a1;
}

uint64_t getEnumTagSinglePayload for RapportTransportError(uint64_t a1, unsigned int a2)
{
  int v2;
  unsigned int v3;

  if (a2)
  {
    if (a2 >= 0xFA && *(_BYTE *)(a1 + 17))
    {
      v2 = *(_DWORD *)a1 + 249;
    }
    else
    {
      v3 = *(unsigned __int8 *)(a1 + 16);
      if (v3 <= 6)
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

uint64_t storeEnumTagSinglePayload for RapportTransportError(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xF9)
  {
    *(_BYTE *)(result + 16) = 0;
    *(_QWORD *)result = a2 - 250;
    *(_QWORD *)(result + 8) = 0;
    if (a3 >= 0xFA)
      *(_BYTE *)(result + 17) = 1;
  }
  else
  {
    if (a3 >= 0xFA)
      *(_BYTE *)(result + 17) = 0;
    if (a2)
      *(_BYTE *)(result + 16) = -(char)a2;
  }
  return result;
}

uint64_t sub_22DFA6BA4(uint64_t a1)
{
  if (*(unsigned __int8 *)(a1 + 16) <= 5u)
    return *(unsigned __int8 *)(a1 + 16);
  else
    return (*(_DWORD *)a1 + 6);
}

uint64_t sub_22DFA6BBC(uint64_t result, unsigned int a2)
{
  if (a2 >= 6)
  {
    *(_QWORD *)result = a2 - 6;
    *(_QWORD *)(result + 8) = 0;
    LOBYTE(a2) = 6;
  }
  *(_BYTE *)(result + 16) = a2;
  return result;
}

ValueMetadata *type metadata accessor for RapportTransportError()
{
  return &type metadata for RapportTransportError;
}

uint64_t sub_22DFA6BE4()
{
  unint64_t v0;

  sub_22DFDDDFC();
  OUTLINED_FUNCTION_5_22();
  if (v0 >= 6)
    return 6;
  else
    return v0;
}

uint64_t sub_22DFA6C24(unsigned __int8 a1)
{
  return ((uint64_t (*)(uint64_t, unint64_t))((char *)sub_22DFA6C50 + 4 * byte_22DFE843D[a1]))(7955819, 0xE300000000000000);
}

uint64_t sub_22DFA6C50()
{
  return 0x726F727265;
}

uint64_t sub_22DFA6C64()
{
  return 0x44497265626D656DLL;
}

uint64_t sub_22DFA6C8C()
{
  return 0x4B74736575716572;
}

uint64_t sub_22DFA6CA8()
{
  return 0x65736E6F70736572;
}

void sub_22DFA6CC8(char *a1)
{
  sub_22DF4A130(*a1);
}

uint64_t sub_22DFA6CD4@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = sub_22DFA6BE4();
  *a1 = result;
  return result;
}

uint64_t sub_22DFA6D00@<X0>(uint64_t *a1@<X8>)
{
  unsigned __int8 *v1;
  uint64_t result;
  uint64_t v4;

  result = sub_22DFA6C24(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

void sub_22DFA6D28()
{
  unsigned __int8 *v0;

  sub_22DFA28DC(*v0);
}

void sub_22DFA6D30(uint64_t a1)
{
  char *v1;

  sub_22DFC0404(a1, *v1);
}

void sub_22DFA6D38(uint64_t a1)
{
  unsigned __int8 *v1;

  sub_22DFC0764(a1, *v1);
}

uint64_t sub_22DFA6D40()
{
  uint64_t v0;
  id v1;
  id v2;
  uint64_t v3;
  void *v4;
  void *v5;
  id v7[2];

  v7[1] = *(id *)MEMORY[0x24BDAC8D0];
  v7[0] = 0;
  v1 = objc_msgSend((id)objc_opt_self(), sel_archivedDataWithRootObject_requiringSecureCoding_error_, v0, 0, v7);
  v2 = v7[0];
  if (v1)
  {
    v3 = sub_22DFDCE90();

  }
  else
  {
    v4 = v2;
    v5 = (void *)sub_22DFDCE3C();

    swift_willThrow();
    return 0;
  }
  return v3;
}

uint64_t sub_22DFA6E1C(unsigned __int8 *a1)
{
  return ((uint64_t (*)(void))((char *)sub_22DFA6E44 + 4 * byte_22DFE8443[*a1]))();
}

void sub_22DFA6E44(_QWORD *a1@<X8>)
{
  *a1 = 0x726F727265;
  a1[1] = 0xE500000000000000;
}

uint64_t sub_22DFA6EC0(uint64_t a1)
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
  uint64_t *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  unint64_t v20;
  unint64_t v21;
  char v22;
  unint64_t v23;
  BOOL v24;
  uint64_t v25;
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_255DDBA58);
    v2 = sub_22DFDDDD8();
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
  sub_22DFDD448();
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
    v15 = (uint64_t *)(*(_QWORD *)(a1 + 48) + 16 * v10);
    v17 = *v15;
    v16 = v15[1];
    sub_22DF35140(*(_QWORD *)(a1 + 56) + 32 * v10, (uint64_t)v40);
    *(_QWORD *)&v39 = v17;
    *((_QWORD *)&v39 + 1) = v16;
    v37[2] = v39;
    v38[0] = v40[0];
    v38[1] = v40[1];
    *(_QWORD *)&v37[0] = v17;
    *((_QWORD *)&v37[0] + 1) = v16;
    sub_22DFDD448();
    swift_dynamicCast();
    sub_22DF33E44(v38, v32);
    v33 = v29;
    v34 = v30;
    v35 = v31;
    sub_22DF33E44(v32, v36);
    v29 = v33;
    v30 = v34;
    v31 = v35;
    sub_22DF33E44(v36, v37);
    sub_22DF33E44(v37, &v33);
    result = sub_22DFDDC40();
    v18 = -1 << *(_BYTE *)(v2 + 32);
    v19 = result & ~v18;
    v20 = v19 >> 6;
    if (((-1 << v19) & ~*(_QWORD *)(v6 + 8 * (v19 >> 6))) == 0)
    {
      v22 = 0;
      v23 = (unint64_t)(63 - v18) >> 6;
      while (++v20 != v23 || (v22 & 1) == 0)
      {
        v24 = v20 == v23;
        if (v20 == v23)
          v20 = 0;
        v22 |= v24;
        v25 = *(_QWORD *)(v6 + 8 * v20);
        if (v25 != -1)
        {
          v21 = __clz(__rbit64(~v25)) + (v20 << 6);
          goto LABEL_34;
        }
      }
      __break(1u);
LABEL_38:
      __break(1u);
      goto LABEL_39;
    }
    v21 = __clz(__rbit64((-1 << v19) & ~*(_QWORD *)(v6 + 8 * (v19 >> 6)))) | v19 & 0x7FFFFFFFFFFFFFC0;
LABEL_34:
    *(_QWORD *)(v6 + ((v21 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v21;
    v26 = *(_QWORD *)(v2 + 48) + 40 * v21;
    *(_OWORD *)v26 = v29;
    *(_OWORD *)(v26 + 16) = v30;
    *(_QWORD *)(v26 + 32) = v31;
    result = (uint64_t)sub_22DF33E44(&v33, (_OWORD *)(*(_QWORD *)(v2 + 56) + 32 * v21));
    ++*(_QWORD *)(v2 + 16);
    if (v5)
      goto LABEL_8;
LABEL_9:
    v11 = v8 + 1;
    if (__OFADD__(v8, 1))
      goto LABEL_38;
    if (v11 >= v27)
      goto LABEL_36;
    v12 = *(_QWORD *)(v28 + 8 * v11);
    v13 = v8 + 1;
    if (!v12)
    {
      v13 = v8 + 2;
      if (v8 + 2 >= v27)
        goto LABEL_36;
      v12 = *(_QWORD *)(v28 + 8 * v13);
      if (!v12)
      {
        v13 = v8 + 3;
        if (v8 + 3 >= v27)
          goto LABEL_36;
        v12 = *(_QWORD *)(v28 + 8 * v13);
        if (!v12)
        {
          v13 = v8 + 4;
          if (v8 + 4 >= v27)
            goto LABEL_36;
          v12 = *(_QWORD *)(v28 + 8 * v13);
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
  if (v8 + 5 >= v27)
  {
LABEL_36:
    swift_release();
    sub_22DF34DB0();
    return v2;
  }
  v12 = *(_QWORD *)(v28 + 8 * v14);
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
    if (v13 >= v27)
      goto LABEL_36;
    v12 = *(_QWORD *)(v28 + 8 * v13);
    ++v14;
    if (v12)
      goto LABEL_24;
  }
LABEL_39:
  __break(1u);
  return result;
}

unint64_t sub_22DFA7280(uint64_t a1)
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  _BYTE *v6;
  _BYTE *v7;
  uint64_t *v8;
  uint64_t *v9;
  unint64_t result;
  unint64_t i;
  int64_t v12;
  unint64_t v13;
  int64_t v14;
  int64_t v15;
  __int128 v16;
  unint64_t v17;
  char v18;
  uint64_t *v19;
  uint64_t *v20;
  _BYTE *v21;
  uint64_t v22;
  _BYTE *v23;
  _OWORD *v24;
  _OWORD *v25;
  uint64_t v26;
  BOOL v27;
  uint64_t v28;
  int64_t v29;
  uint64_t v30;
  uint64_t v31;
  int64_t v32;
  __int128 v33;
  _OWORD v34[2];
  uint64_t v35;
  __int128 v36;
  uint64_t v37;
  _OWORD v38[2];
  _BYTE __dst[72];
  _BYTE __src[72];
  _QWORD v41[6];

  if (*(_QWORD *)(a1 + 16))
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_255DDBA48);
    v2 = (_QWORD *)sub_22DFDDDD8();
  }
  else
  {
    v2 = (_QWORD *)MEMORY[0x24BEE4B00];
  }
  sub_22DFA89A8(a1, v41);
  v3 = v41[0];
  v4 = v41[3];
  v29 = (unint64_t)(v41[2] + 64) >> 6;
  v30 = v41[1];
  v5 = v41[4];
  v6 = &__src[40];
  v7 = &__dst[40];
  v8 = &v35;
  v9 = &v37;
  result = sub_22DFDD448();
  if (!v5)
    goto LABEL_6;
LABEL_5:
  v31 = (v5 - 1) & v5;
  v32 = v4;
  for (i = __clz(__rbit64(v5)) | (v4 << 6); ; i = __clz(__rbit64(v13)) + (v14 << 6))
  {
    sub_22DFA8A00(*(_QWORD *)(v3 + 48) + 40 * i, (uint64_t)__src);
    sub_22DF35140(*(_QWORD *)(v3 + 56) + 32 * i, (uint64_t)v6);
    memcpy(__dst, __src, sizeof(__dst));
    sub_22DFA8A00((uint64_t)__dst, (uint64_t)v34);
    if (!swift_dynamicCast())
    {
      sub_22DF37EEC((uint64_t)__dst, &qword_255DDBA50);
      swift_bridgeObjectRelease();
      sub_22DF34DB0();
      swift_release();
      return 0;
    }
    sub_22DF35140((uint64_t)v7, (uint64_t)v34);
    sub_22DF37EEC((uint64_t)__dst, &qword_255DDBA50);
    sub_22DF33E44(v34, v8);
    v36 = v33;
    sub_22DF33E44(v8, v9);
    v16 = v36;
    sub_22DF33E44(v9, v38);
    sub_22DF33E44(v38, &v36);
    result = sub_22DFCA9B0(v16, *((uint64_t *)&v16 + 1));
    v17 = result;
    if ((v18 & 1) != 0)
    {
      v19 = v9;
      v20 = v8;
      v21 = v7;
      v22 = v3;
      v23 = v6;
      v24 = (_OWORD *)(v2[6] + 16 * result);
      swift_bridgeObjectRelease();
      *v24 = v16;
      v6 = v23;
      v3 = v22;
      v7 = v21;
      v8 = v20;
      v9 = v19;
      v25 = (_OWORD *)(v2[7] + 32 * v17);
      __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)v25);
      result = (unint64_t)sub_22DF33E44(&v36, v25);
      goto LABEL_28;
    }
    if (v2[2] >= v2[3])
      break;
    *(_QWORD *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    *(_OWORD *)(v2[6] + 16 * result) = v16;
    result = (unint64_t)sub_22DF33E44(&v36, (_OWORD *)(v2[7] + 32 * result));
    v26 = v2[2];
    v27 = __OFADD__(v26, 1);
    v28 = v26 + 1;
    if (v27)
      goto LABEL_34;
    v2[2] = v28;
LABEL_28:
    v5 = v31;
    v4 = v32;
    if (v31)
      goto LABEL_5;
LABEL_6:
    v12 = v4 + 1;
    if (__OFADD__(v4, 1))
      goto LABEL_35;
    if (v12 >= v29)
      goto LABEL_31;
    v13 = *(_QWORD *)(v30 + 8 * v12);
    v14 = v4 + 1;
    if (!v13)
    {
      v14 = v4 + 2;
      if (v4 + 2 >= v29)
        goto LABEL_31;
      v13 = *(_QWORD *)(v30 + 8 * v14);
      if (!v13)
      {
        v14 = v4 + 3;
        if (v4 + 3 >= v29)
          goto LABEL_31;
        v13 = *(_QWORD *)(v30 + 8 * v14);
        if (!v13)
        {
          v14 = v4 + 4;
          if (v4 + 4 >= v29)
            goto LABEL_31;
          v13 = *(_QWORD *)(v30 + 8 * v14);
          if (!v13)
          {
            v14 = v4 + 5;
            if (v4 + 5 >= v29)
              goto LABEL_31;
            v13 = *(_QWORD *)(v30 + 8 * v14);
            if (!v13)
            {
              v15 = v4 + 6;
              while (v15 < v29)
              {
                v13 = *(_QWORD *)(v30 + 8 * v15++);
                if (v13)
                {
                  v14 = v15 - 1;
                  goto LABEL_21;
                }
              }
LABEL_31:
              sub_22DF34DB0();
              return (unint64_t)v2;
            }
          }
        }
      }
    }
LABEL_21:
    v31 = (v13 - 1) & v13;
    v32 = v14;
  }
  __break(1u);
LABEL_34:
  __break(1u);
LABEL_35:
  __break(1u);
  return result;
}

uint64_t sub_22DFA7644@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  sub_22DFDD448();
  result = sub_22DFA6BE4();
  *a1 = result;
  return result;
}

void sub_22DFA7684(uint64_t a1)
{
  uint64_t v1;

  v1 = OUTLINED_FUNCTION_161(a1, (unint64_t *)&qword_255DD7B10);
  OUTLINED_FUNCTION_161(v1, (unint64_t *)&qword_255DD82B8);
  sub_22DFDDACC();
  OUTLINED_FUNCTION_212();
}

uint64_t sub_22DFA76FC(uint64_t a1, char a2, uint64_t a3, void (*a4)(uint64_t *__return_ptr, char *))
{
  char v7;
  uint64_t v8;

  v7 = a2;
  a4(&v8, &v7);
  sub_22DF35140(a3, a1);
  return v8;
}

void sub_22DFA7750(uint64_t a1, uint64_t *a2, void (*a3)(uint64_t, uint64_t, uint64_t *))
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  if (*(_QWORD *)(a1 + 16))
  {
    __swift_instantiateConcreteTypeFromMangledName(a2);
    v4 = sub_22DFDDDD8();
  }
  else
  {
    v4 = MEMORY[0x24BEE4B00];
  }
  v6 = v4;
  v5 = sub_22DFDD448();
  a3(v5, 1, &v6);
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_212();
}

_QWORD *sub_22DFA77EC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, _QWORD *(*a4)(char *__return_ptr, _QWORD *)@<X3>, uint64_t a5@<X8>)
{
  _QWORD *result;
  char v8;
  _QWORD v9[2];

  v9[0] = a1;
  v9[1] = a2;
  result = a4(&v8, v9);
  if (v8 == 6)
  {
    *(_QWORD *)(a5 + 32) = 0;
    *(_OWORD *)a5 = 0u;
    *(_OWORD *)(a5 + 16) = 0u;
  }
  else
  {
    *(_BYTE *)a5 = v8;
    return (_QWORD *)sub_22DF35140(a3, a5 + 8);
  }
  return result;
}

void sub_22DFA7868(uint64_t a1, char a2)
{
  uint64_t *v2;
  _QWORD *v3;
  uint64_t *v4;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  uint64_t v10;
  unint64_t v11;
  int64_t v12;
  uint64_t v13;
  int64_t v14;
  unint64_t v15;
  unint64_t i;
  int64_t v17;
  _QWORD *v18;
  unint64_t v19;
  int64_t v20;
  void *v21;
  void *v22;
  id v23;
  id v24;
  unint64_t v25;
  char v26;
  uint64_t v27;
  uint64_t v28;
  BOOL v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  char v34;
  char v35;
  uint64_t *v36;
  _QWORD *v37;

  v4 = v2;
  OUTLINED_FUNCTION_19_12();
  __swift_instantiateConcreteTypeFromMangledName(&qword_255DD7798);
  v6 = sub_22DFDDDC0();
  if (v3[2])
  {
    OUTLINED_FUNCTION_7_22();
    v36 = v2;
    v37 = v9;
    if (v7 < 64)
      v10 = ~(-1 << v7);
    else
      v10 = -1;
    v11 = v10 & v8;
    v12 = (unint64_t)(v7 + 63) >> 6;
    v13 = v6 + 64;
    swift_retain();
    v14 = 0;
    if (!v11)
      goto LABEL_7;
LABEL_6:
    v15 = __clz(__rbit64(v11));
    v11 &= v11 - 1;
    for (i = v15 | (v14 << 6); ; i = __clz(__rbit64(v19)) + (v14 << 6))
    {
      v21 = *(void **)(v3[6] + 8 * i);
      v22 = *(void **)(v3[7] + 8 * i);
      if ((a2 & 1) == 0)
      {
        v23 = v21;
        v24 = v22;
      }
      v25 = sub_22DFDDB14() & ~(-1 << *(_BYTE *)(v6 + 32));
      if (((-1 << v25) & ~*(_QWORD *)(v13 + 8 * (v25 >> 6))) == 0)
      {
        OUTLINED_FUNCTION_17_9();
        while (++v27 != v28 || (v26 & 1) == 0)
        {
          v29 = v27 == v28;
          if (v27 == v28)
            v27 = 0;
          v26 |= v29;
          if (*(_QWORD *)(v13 + 8 * v27) != -1)
          {
            OUTLINED_FUNCTION_12_19();
            goto LABEL_30;
          }
        }
        __break(1u);
LABEL_41:
        __break(1u);
LABEL_42:
        __break(1u);
        return;
      }
      OUTLINED_FUNCTION_20_9();
LABEL_30:
      OUTLINED_FUNCTION_23_12();
      *(_QWORD *)(v13 + v30) |= v31;
      *(_QWORD *)(*(_QWORD *)(v6 + 48) + 8 * v32) = v21;
      *(_QWORD *)(*(_QWORD *)(v6 + 56) + 8 * v32) = v22;
      ++*(_QWORD *)(v6 + 16);
      if (v11)
        goto LABEL_6;
LABEL_7:
      v17 = v14 + 1;
      if (__OFADD__(v14, 1))
        goto LABEL_41;
      if (v17 >= v12)
        break;
      v18 = v37;
      v19 = v37[v17];
      ++v14;
      if (!v19)
      {
        v14 = v17 + 1;
        if (v17 + 1 >= v12)
          goto LABEL_32;
        v19 = v37[v14];
        if (!v19)
        {
          v20 = v17 + 2;
          if (v20 >= v12)
          {
LABEL_32:
            OUTLINED_FUNCTION_150();
            v4 = v36;
            if ((a2 & 1) == 0)
              goto LABEL_39;
            goto LABEL_35;
          }
          v19 = v37[v20];
          if (!v19)
          {
            while (1)
            {
              v14 = v20 + 1;
              if (__OFADD__(v20, 1))
                goto LABEL_42;
              if (v14 >= v12)
                goto LABEL_32;
              v19 = v37[v14];
              ++v20;
              if (v19)
                goto LABEL_18;
            }
          }
          v14 = v20;
        }
      }
LABEL_18:
      v11 = (v19 - 1) & v19;
    }
    OUTLINED_FUNCTION_150();
    v4 = v36;
    v18 = v37;
    if ((a2 & 1) == 0)
      goto LABEL_39;
LABEL_35:
    OUTLINED_FUNCTION_14_16();
    if (v34 != v35)
      *v18 = -1 << v33;
    else
      OUTLINED_FUNCTION_6_23(v33);
    v3[2] = 0;
  }
LABEL_39:
  OUTLINED_FUNCTION_150();
  *v4 = v6;
}

uint64_t sub_22DFA7AB4(uint64_t a1, char a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  int64_t v10;
  unint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _OWORD *v16;
  uint64_t v17;
  uint64_t result;
  _QWORD *v19;
  _OWORD v20[2];

  v3 = v2;
  v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_255DDBA38);
  v6 = sub_22DFDDDC0();
  if (!*(_QWORD *)(v5 + 16))
    goto LABEL_27;
  v7 = 1 << *(_BYTE *)(v5 + 32);
  v19 = (_QWORD *)(v5 + 64);
  if (v7 < 64)
    v8 = ~(-1 << v7);
  else
    v8 = -1;
  v9 = v8 & *(_QWORD *)(v5 + 64);
  v10 = (unint64_t)(v7 + 63) >> 6;
  swift_retain();
  if (v9)
  {
    v11 = __clz(__rbit64(v9));
    goto LABEL_18;
  }
  if (v10 > 1)
  {
    v12 = *(_QWORD *)(v5 + 72);
    v13 = 1;
    if (v12)
      goto LABEL_17;
    v13 = 2;
    if (v10 > 2)
    {
      v12 = *(_QWORD *)(v5 + 80);
      if (!v12)
      {
        v14 = 3;
        if (v10 > 3)
        {
          v12 = *(_QWORD *)(v5 + 88);
          if (v12)
          {
            v13 = 3;
            goto LABEL_17;
          }
          while (1)
          {
            v13 = v14 + 1;
            if (__OFADD__(v14, 1))
            {
              __break(1u);
              JUMPOUT(0x22DFA7E2CLL);
            }
            if (v13 >= v10)
              break;
            v12 = v19[v13];
            ++v14;
            if (v12)
              goto LABEL_17;
          }
        }
        goto LABEL_22;
      }
LABEL_17:
      v11 = __clz(__rbit64(v12)) + (v13 << 6);
LABEL_18:
      v15 = *(unsigned __int8 *)(*(_QWORD *)(v5 + 48) + v11);
      v16 = (_OWORD *)(*(_QWORD *)(v5 + 56) + 32 * v11);
      if ((a2 & 1) != 0)
        sub_22DF33E44(v16, v20);
      else
        sub_22DF35140((uint64_t)v16, (uint64_t)v20);
      sub_22DFDE000();
      __asm { BR              X8 }
    }
  }
LABEL_22:
  swift_release();
  v3 = v2;
  if ((a2 & 1) != 0)
  {
    v17 = 1 << *(_BYTE *)(v5 + 32);
    if (v17 >= 64)
      sub_22DFA83C4(0, (unint64_t)(v17 + 63) >> 6, v19);
    else
      *v19 = -1 << v17;
    *(_QWORD *)(v5 + 16) = 0;
  }
LABEL_27:
  result = swift_release();
  *v3 = v6;
  return result;
}

void sub_22DFA7E44(uint64_t a1, char a2)
{
  uint64_t *v2;
  _QWORD *v3;
  uint64_t *v4;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  int64_t v13;
  unint64_t v14;
  unint64_t i;
  int64_t v16;
  _QWORD *v17;
  unint64_t v18;
  int64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  id v24;
  unint64_t v25;
  char v26;
  uint64_t v27;
  uint64_t v28;
  BOOL v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  _QWORD *v33;
  uint64_t v34;
  char v35;
  char v36;
  uint64_t *v37;
  int64_t v38;
  _QWORD *v39;
  char v40;

  v4 = v2;
  OUTLINED_FUNCTION_19_12();
  __swift_instantiateConcreteTypeFromMangledName(&qword_255DD9C20);
  v40 = a2;
  v6 = sub_22DFDDDC0();
  if (!v3[2])
    goto LABEL_39;
  OUTLINED_FUNCTION_7_22();
  v39 = v9;
  if (v7 < 64)
    v10 = ~(-1 << v7);
  else
    v10 = -1;
  v11 = v10 & v8;
  v37 = v2;
  v38 = (unint64_t)(v7 + 63) >> 6;
  v12 = v6 + 64;
  swift_retain();
  v13 = 0;
  if (!v11)
    goto LABEL_7;
LABEL_6:
  v14 = __clz(__rbit64(v11));
  v11 &= v11 - 1;
  for (i = v14 | (v13 << 6); ; i = __clz(__rbit64(v18)) + (v13 << 6))
  {
    v20 = (uint64_t *)(v3[6] + 16 * i);
    v22 = *v20;
    v21 = v20[1];
    v23 = *(void **)(v3[7] + 8 * i);
    if ((v40 & 1) == 0)
    {
      sub_22DFDD448();
      v24 = v23;
    }
    sub_22DFDE000();
    sub_22DFDD544();
    v25 = sub_22DFDE030() & ~(-1 << *(_BYTE *)(v6 + 32));
    if (((-1 << v25) & ~*(_QWORD *)(v12 + 8 * (v25 >> 6))) == 0)
    {
      OUTLINED_FUNCTION_17_9();
      while (++v27 != v28 || (v26 & 1) == 0)
      {
        v29 = v27 == v28;
        if (v27 == v28)
          v27 = 0;
        v26 |= v29;
        if (*(_QWORD *)(v12 + 8 * v27) != -1)
        {
          OUTLINED_FUNCTION_12_19();
          goto LABEL_30;
        }
      }
      __break(1u);
LABEL_41:
      __break(1u);
LABEL_42:
      __break(1u);
      return;
    }
    OUTLINED_FUNCTION_20_9();
LABEL_30:
    OUTLINED_FUNCTION_23_12();
    *(_QWORD *)(v12 + v30) |= v31;
    v33 = (_QWORD *)(*(_QWORD *)(v6 + 48) + 16 * v32);
    *v33 = v22;
    v33[1] = v21;
    *(_QWORD *)(*(_QWORD *)(v6 + 56) + 8 * v32) = v23;
    ++*(_QWORD *)(v6 + 16);
    if (v11)
      goto LABEL_6;
LABEL_7:
    v16 = v13 + 1;
    if (__OFADD__(v13, 1))
      goto LABEL_41;
    if (v16 >= v38)
    {
      OUTLINED_FUNCTION_150();
      v4 = v37;
      v17 = v39;
      goto LABEL_34;
    }
    v17 = v39;
    v18 = v39[v16];
    ++v13;
    if (!v18)
    {
      v13 = v16 + 1;
      if (v16 + 1 >= v38)
        goto LABEL_32;
      v18 = v39[v13];
      if (!v18)
        break;
    }
LABEL_18:
    v11 = (v18 - 1) & v18;
  }
  v19 = v16 + 2;
  if (v19 < v38)
  {
    v18 = v39[v19];
    if (!v18)
    {
      while (1)
      {
        v13 = v19 + 1;
        if (__OFADD__(v19, 1))
          goto LABEL_42;
        if (v13 >= v38)
          goto LABEL_32;
        v18 = v39[v13];
        ++v19;
        if (v18)
          goto LABEL_18;
      }
    }
    v13 = v19;
    goto LABEL_18;
  }
LABEL_32:
  OUTLINED_FUNCTION_150();
  v4 = v37;
LABEL_34:
  if ((v40 & 1) != 0)
  {
    OUTLINED_FUNCTION_14_16();
    if (v35 != v36)
      *v17 = -1 << v34;
    else
      OUTLINED_FUNCTION_6_23(v34);
    v3[2] = 0;
  }
LABEL_39:
  OUTLINED_FUNCTION_150();
  *v4 = v6;
}

uint64_t sub_22DFA80CC(uint64_t a1, char a2)
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
  _OWORD *v22;
  uint64_t v23;
  unint64_t v24;
  unint64_t v25;
  unint64_t v26;
  char v27;
  unint64_t v28;
  BOOL v29;
  uint64_t v30;
  _QWORD *v31;
  uint64_t v32;
  int64_t v33;
  _QWORD *v34;
  _OWORD v35[2];

  v3 = v2;
  v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_255DDBA48);
  v6 = sub_22DFDDDC0();
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
      v22 = (_OWORD *)(*(_QWORD *)(v5 + 56) + 32 * i);
      if ((a2 & 1) != 0)
      {
        sub_22DF33E44(v22, v35);
      }
      else
      {
        sub_22DF35140((uint64_t)v22, (uint64_t)v35);
        sub_22DFDD448();
      }
      sub_22DFDE000();
      sub_22DFDD544();
      result = sub_22DFDE030();
      v23 = -1 << *(_BYTE *)(v7 + 32);
      v24 = result & ~v23;
      v25 = v24 >> 6;
      if (((-1 << v24) & ~*(_QWORD *)(v11 + 8 * (v24 >> 6))) == 0)
      {
        v27 = 0;
        v28 = (unint64_t)(63 - v23) >> 6;
        while (++v25 != v28 || (v27 & 1) == 0)
        {
          v29 = v25 == v28;
          if (v25 == v28)
            v25 = 0;
          v27 |= v29;
          v30 = *(_QWORD *)(v11 + 8 * v25);
          if (v30 != -1)
          {
            v26 = __clz(__rbit64(~v30)) + (v25 << 6);
            goto LABEL_31;
          }
        }
        __break(1u);
LABEL_40:
        __break(1u);
LABEL_41:
        __break(1u);
        return result;
      }
      v26 = __clz(__rbit64((-1 << v24) & ~*(_QWORD *)(v11 + 8 * (v24 >> 6)))) | v24 & 0x7FFFFFFFFFFFFFC0;
LABEL_31:
      *(_QWORD *)(v11 + ((v26 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v26;
      v31 = (_QWORD *)(*(_QWORD *)(v7 + 48) + 16 * v26);
      *v31 = v21;
      v31[1] = v20;
      result = (uint64_t)sub_22DF33E44(v35, (_OWORD *)(*(_QWORD *)(v7 + 56) + 32 * v26));
      ++*(_QWORD *)(v7 + 16);
      if (v10)
        goto LABEL_6;
LABEL_7:
      v16 = v13 + 1;
      if (__OFADD__(v13, 1))
        goto LABEL_40;
      if (v16 >= v33)
        goto LABEL_33;
      v17 = v34[v16];
      ++v13;
      if (!v17)
      {
        v13 = v16 + 1;
        if (v16 + 1 >= v33)
          goto LABEL_33;
        v17 = v34[v13];
        if (!v17)
        {
          v18 = v16 + 2;
          if (v18 >= v33)
          {
LABEL_33:
            swift_release();
            v3 = v2;
            if ((a2 & 1) != 0)
            {
              v32 = 1 << *(_BYTE *)(v5 + 32);
              if (v32 >= 64)
                sub_22DFA83C4(0, (unint64_t)(v32 + 63) >> 6, v34);
              else
                *v34 = -1 << v32;
              *(_QWORD *)(v5 + 16) = 0;
            }
            break;
          }
          v17 = v34[v18];
          if (!v17)
          {
            while (1)
            {
              v13 = v18 + 1;
              if (__OFADD__(v18, 1))
                goto LABEL_41;
              if (v13 >= v33)
                goto LABEL_33;
              v17 = v34[v13];
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

uint64_t sub_22DFA83C4(uint64_t result, uint64_t a2, _QWORD *a3)
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

void sub_22DFA83E0(uint64_t a1, char a2, _QWORD *a3)
{
  uint64_t v3;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  char v9;
  unint64_t v10;
  uint64_t v11;
  _BOOL8 v12;
  uint64_t v13;
  char v14;
  uint64_t v15;
  char v16;
  _QWORD *v17;
  uint64_t v18;
  BOOL v19;
  uint64_t v20;
  void *v21;
  id v22;
  _OWORD v23[2];
  _BYTE v24[8];
  __int128 v25;
  char v26;

  v3 = *(_QWORD *)(a1 + 16);
  if (!v3)
  {
    swift_bridgeObjectRelease();
    return;
  }
  v6 = a1 + 32;
  sub_22DFDD448();
  while (1)
  {
    sub_22DF4AEE8(v6, (uint64_t)v24, &qword_255DD81D0);
    v7 = v24[0];
    v26 = v24[0];
    sub_22DF33E44(&v25, v23);
    v8 = (_QWORD *)*a3;
    v10 = sub_22DFCAA08(v7);
    v11 = v8[2];
    v12 = (v9 & 1) == 0;
    v13 = v11 + v12;
    if (__OFADD__(v11, v12))
    {
      __break(1u);
LABEL_18:
      __break(1u);
LABEL_19:
      sub_22DFDDF88();
      __break(1u);
      goto LABEL_20;
    }
    v14 = v9;
    if (v8[3] < v13)
      break;
    if ((a2 & 1) != 0)
    {
      if ((v9 & 1) != 0)
        goto LABEL_14;
    }
    else
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_255DD7618);
      sub_22DFDDD54();
      if ((v14 & 1) != 0)
        goto LABEL_14;
    }
LABEL_10:
    v17 = (_QWORD *)*a3;
    *(_QWORD *)(*a3 + 8 * (v10 >> 6) + 64) |= 1 << v10;
    *(_BYTE *)(v17[6] + v10) = v7;
    sub_22DF33E44(v23, (_OWORD *)(v17[7] + 32 * v10));
    v18 = v17[2];
    v19 = __OFADD__(v18, 1);
    v20 = v18 + 1;
    if (v19)
      goto LABEL_18;
    v17[2] = v20;
    v6 += 40;
    a2 = 1;
    if (!--v3)
    {
      swift_bridgeObjectRelease_n();
      return;
    }
  }
  sub_22DFA7AB4(v13, a2 & 1);
  v15 = sub_22DFCAA08(v7);
  if ((v14 & 1) != (v16 & 1))
    goto LABEL_19;
  v10 = v15;
  if ((v14 & 1) == 0)
    goto LABEL_10;
LABEL_14:
  v21 = (void *)swift_allocError();
  swift_willThrow();
  v22 = v21;
  __swift_instantiateConcreteTypeFromMangledName(&qword_255DD71A0);
  if ((swift_dynamicCast() & 1) == 0)
  {
    swift_bridgeObjectRelease();
    __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)v23);
    swift_bridgeObjectRelease();

    return;
  }
LABEL_20:
  sub_22DFDDCA0();
  sub_22DFDD568();
  sub_22DFDDD3C();
  sub_22DFDD568();
  sub_22DFDDDA8();
  __break(1u);
}

void sub_22DFA86B4(uint64_t a1, char a2, _QWORD *a3)
{
  uint64_t v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  char v10;
  unint64_t v11;
  uint64_t v12;
  _BOOL8 v13;
  uint64_t v14;
  char v15;
  unint64_t v16;
  char v17;
  _QWORD *v18;
  uint64_t *v19;
  uint64_t v20;
  BOOL v21;
  uint64_t v22;
  void *v23;
  id v24;
  _OWORD v25[2];
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  __int128 v30;
  id v31;

  v3 = *(_QWORD *)(a1 + 16);
  if (!v3)
  {
    swift_bridgeObjectRelease();
    return;
  }
  v6 = a1 + 32;
  sub_22DFDD448();
  while (1)
  {
    sub_22DF4AEE8(v6, (uint64_t)&v28, &qword_255DD81D8);
    v8 = v28;
    v7 = v29;
    v26 = v28;
    v27 = v29;
    sub_22DF33E44(&v30, v25);
    v9 = (_QWORD *)*a3;
    v11 = sub_22DFCA9B0(v8, v7);
    v12 = v9[2];
    v13 = (v10 & 1) == 0;
    v14 = v12 + v13;
    if (__OFADD__(v12, v13))
    {
      __break(1u);
LABEL_18:
      __break(1u);
LABEL_19:
      sub_22DFDDF88();
      __break(1u);
      goto LABEL_20;
    }
    v15 = v10;
    if (v9[3] < v14)
      break;
    if ((a2 & 1) != 0)
    {
      if ((v10 & 1) != 0)
        goto LABEL_14;
    }
    else
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_255DDBA60);
      sub_22DFDDD54();
      if ((v15 & 1) != 0)
        goto LABEL_14;
    }
LABEL_10:
    v18 = (_QWORD *)*a3;
    *(_QWORD *)(*a3 + 8 * (v11 >> 6) + 64) |= 1 << v11;
    v19 = (uint64_t *)(v18[6] + 16 * v11);
    *v19 = v8;
    v19[1] = v7;
    sub_22DF33E44(v25, (_OWORD *)(v18[7] + 32 * v11));
    v20 = v18[2];
    v21 = __OFADD__(v20, 1);
    v22 = v20 + 1;
    if (v21)
      goto LABEL_18;
    v18[2] = v22;
    v6 += 48;
    a2 = 1;
    if (!--v3)
    {
      swift_bridgeObjectRelease_n();
      return;
    }
  }
  sub_22DFA80CC(v14, a2 & 1);
  v16 = sub_22DFCA9B0(v8, v7);
  if ((v15 & 1) != (v17 & 1))
    goto LABEL_19;
  v11 = v16;
  if ((v15 & 1) == 0)
    goto LABEL_10;
LABEL_14:
  v23 = (void *)swift_allocError();
  swift_willThrow();
  v31 = v23;
  v24 = v23;
  __swift_instantiateConcreteTypeFromMangledName(&qword_255DD71A0);
  if ((swift_dynamicCast() & 1) == 0)
  {
    swift_bridgeObjectRelease();
    __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)v25);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();

    return;
  }
LABEL_20:
  sub_22DFDDCA0();
  sub_22DFDD568();
  sub_22DFDDD3C();
  sub_22DFDD568();
  sub_22DFDDDA8();
  __break(1u);
}

uint64_t sub_22DFA89A8@<X0>(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t result;
  uint64_t v5;
  uint64_t v6;

  v2 = -1;
  v3 = -1 << *(_BYTE *)(a1 + 32);
  *a2 = a1;
  v6 = *(_QWORD *)(a1 + 64);
  result = a1 + 64;
  v5 = v6;
  if (-v3 < 64)
    v2 = ~(-1 << -(char)v3);
  a2[1] = result;
  a2[2] = ~v3;
  a2[3] = 0;
  a2[4] = v2 & v5;
  return result;
}

_QWORD *sub_22DFA89E0@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X1>, _QWORD *(*a3)(char *__return_ptr, _QWORD *)@<X2>, uint64_t a4@<X8>)
{
  return sub_22DFA77EC(*a1, a1[1], a2, a3, a4);
}

_QWORD *sub_22DFA89F8@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v3;

  return sub_22DFA89E0(a1, a2, *(_QWORD *(**)(char *__return_ptr, _QWORD *))(v3 + 16), a3);
}

uint64_t sub_22DFA8A00(uint64_t a1, uint64_t a2)
{
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(MEMORY[0x24BEE23D0] - 8) + 16))(a2, a1);
  return a2;
}

uint64_t sub_22DFA8A3C(uint64_t *a1, uint64_t a2, char *a3, uint64_t a4, void (*a5)(uint64_t *__return_ptr, char *))
{
  uint64_t result;
  uint64_t v7;

  result = sub_22DFA76FC(a2, *a3, a4, a5);
  *a1 = result;
  a1[1] = v7;
  return result;
}

uint64_t sub_22DFA8A78(uint64_t *a1, uint64_t a2, char *a3, uint64_t a4)
{
  uint64_t v4;

  return sub_22DFA8A3C(a1, a2, a3, a4, *(void (**)(uint64_t *__return_ptr, char *))(v4 + 16));
}

uint64_t getEnumTagSinglePayload for RapportTransportError.CodingKey(unsigned __int8 *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for RapportTransportError.CodingKey(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_22DFA8B54 + 4 * byte_22DFE844E[v4]))();
  *a1 = a2 + 5;
  return ((uint64_t (*)(void))((char *)sub_22DFA8B88 + 4 * byte_22DFE8449[v4]))();
}

uint64_t sub_22DFA8B88(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_22DFA8B90(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x22DFA8B98);
  return result;
}

uint64_t sub_22DFA8BA4(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x22DFA8BACLL);
  *(_BYTE *)result = a2 + 5;
  return result;
}

uint64_t sub_22DFA8BB0(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_22DFA8BB8(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for RapportTransportError.CodingKey()
{
  return &type metadata for RapportTransportError.CodingKey;
}

unint64_t sub_22DFA8BD8()
{
  unint64_t result;

  result = qword_255DDBA70;
  if (!qword_255DDBA70)
  {
    result = MEMORY[0x22E323AEC](&unk_22DFE8530, &type metadata for RapportTransportError.CodingKey);
    atomic_store(result, (unint64_t *)&qword_255DDBA70);
  }
  return result;
}

uint64_t OUTLINED_FUNCTION_0_23()
{
  return swift_dynamicCast();
}

uint64_t OUTLINED_FUNCTION_2_22()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  *(_QWORD *)(v3 - 136) = v2;
  *(_QWORD *)(v3 - 160) = v1;
  *(_QWORD *)(v3 - 152) = v0;
  return sub_22DFDD448();
}

void OUTLINED_FUNCTION_3_22(uint64_t a1@<X0>, _OWORD *a2@<X8>)
{
  uint64_t v2;

  sub_22DFD31D4(a1, v2, a2);
}

uint64_t OUTLINED_FUNCTION_5_22()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_6_23@<X0>(uint64_t a1@<X8>)
{
  _QWORD *v1;

  return sub_22DFA83C4(0, (unint64_t)(a1 + 63) >> 6, v1);
}

uint64_t OUTLINED_FUNCTION_8_22()
{
  uint64_t v0;
  unint64_t v1;

  return sub_22DF32DB0(v0, v1);
}

void OUTLINED_FUNCTION_10_19()
{
  uint64_t v0;

  sub_22DFD30CC(v0 - 160, 1);
}

uint64_t OUTLINED_FUNCTION_13_19()
{
  return sub_22DFA6D40();
}

void OUTLINED_FUNCTION_15_16()
{
  uint64_t v0;

  Error.nsError.getter(v0);
}

void OUTLINED_FUNCTION_16_12()
{
  void *v0;

}

void OUTLINED_FUNCTION_18_12()
{
  uint64_t v0;

  sub_22DFA7684(v0);
}

uint64_t OUTLINED_FUNCTION_21_10()
{
  uint64_t v0;

  return v0 - 160;
}

void OUTLINED_FUNCTION_22_11()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;

  v2 = *(_QWORD *)(v1 - 80);
  *v0 = *(_QWORD *)(v1 - 88);
  v0[1] = v2;
}

uint64_t sub_22DFA8D58()
{
  return swift_initClassMetadata2();
}

uint64_t sub_22DFA8D9C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  _QWORD *v12;

  __swift_instantiateConcreteTypeFromMangledName(&qword_255DD71C0);
  OUTLINED_FUNCTION_57();
  MEMORY[0x24BDAC7A8](v4);
  OUTLINED_FUNCTION_80();
  v7 = v6 - v5;
  v8 = OUTLINED_FUNCTION_177_0();
  OUTLINED_FUNCTION_299(v7, v9, v10, v8);
  v11 = (_QWORD *)OUTLINED_FUNCTION_36_4();
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = a1;
  v11[5] = a2;
  v12 = (_QWORD *)OUTLINED_FUNCTION_36_4();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_255DDBB58;
  v12[5] = v11;
  sub_22DFAA150(v7, (uint64_t)&unk_255DDBB68, (uint64_t)v12);
  return swift_release();
}

id sub_22DFA8E4C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  objc_class *v4;
  id v9;

  v9 = objc_allocWithZone(v4);
  return sub_22DFA8EA4(a1, a2, a3, a4);
}

id sub_22DFA8EA4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  char *v4;
  objc_class *v9;
  char *v10;
  char *v11;
  objc_super v13;

  v9 = (objc_class *)OUTLINED_FUNCTION_9_3();
  v10 = &v4[qword_255DDBA80];
  *(_QWORD *)v10 = a1;
  *((_QWORD *)v10 + 1) = a2;
  v11 = &v4[qword_255DDBA88];
  *(_QWORD *)v11 = a3;
  *((_QWORD *)v11 + 1) = a4;
  v13.receiver = v4;
  v13.super_class = v9;
  return objc_msgSendSuper2(&v13, sel_init);
}

void sub_22DFA8F1C(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;
  id v5;
  Swift::Bool v6;
  Swift::String v7;

  OUTLINED_FUNCTION_9_3();
  OUTLINED_FUNCTION_5_20();
  sub_22DFDDCA0();
  v3 = swift_bridgeObjectRelease();
  v4 = OUTLINED_FUNCTION_35_5(v3, sel_description);
  OUTLINED_FUNCTION_51_4();
  OUTLINED_FUNCTION_17_7();
  OUTLINED_FUNCTION_8_23();
  OUTLINED_FUNCTION_105();
  OUTLINED_FUNCTION_175_0();
  OUTLINED_FUNCTION_34_4();
  v5 = objc_msgSend(a2, sel_description);
  OUTLINED_FUNCTION_51_4();
  OUTLINED_FUNCTION_45_5();
  OUTLINED_FUNCTION_40_5();
  OUTLINED_FUNCTION_78_1();
  v6 = sub_22DF39308() & 1;
  v7._countAndFlagsBits = 0x206C656E6E616843;
  v7._object = (void *)0xE800000000000000;
  Logging.ulog(_:extended:)(v7, v6);
  OUTLINED_FUNCTION_78_1();
  OUTLINED_FUNCTION_24_10();
}

void sub_22DFA9010(void *a1, uint64_t a2, void *a3, void *a4)
{
  id v6;
  id v7;
  id v8;

  v8 = a3;
  v6 = a4;
  v7 = a1;
  sub_22DFA8F1C((uint64_t)v8, v6);

}

void sub_22DFA9068()
{
  uint64_t v0;
  id v1;
  char v2;

  OUTLINED_FUNCTION_9_3();
  OUTLINED_FUNCTION_5_20();
  sub_22DFDDCA0();
  v0 = sub_22DFDD568();
  v1 = OUTLINED_FUNCTION_35_5(v0, sel_description);
  OUTLINED_FUNCTION_51_4();
  OUTLINED_FUNCTION_17_7();
  OUTLINED_FUNCTION_8_23();
  OUTLINED_FUNCTION_105();
  OUTLINED_FUNCTION_175_0();
  OUTLINED_FUNCTION_34_4();
  __swift_instantiateConcreteTypeFromMangledName(&qword_255DD71A0);
  OUTLINED_FUNCTION_39_5();
  v2 = OUTLINED_FUNCTION_35_6();
  OUTLINED_FUNCTION_4_21(v2);
  OUTLINED_FUNCTION_78_1();
  OUTLINED_FUNCTION_24_10();
}

void sub_22DFA9144(void *a1, uint64_t a2, void *a3, uint64_t a4, void *a5)
{
  id v8;
  id v9;
  id v10;

  sub_22DFDD514();
  v10 = a3;
  v8 = a5;
  v9 = a1;
  sub_22DFA9068();

  swift_bridgeObjectRelease();
}

uint64_t sub_22DFA91BC(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v3;

  v3[4] = a2;
  v3[5] = v2;
  v3[3] = a1;
  v3[6] = OUTLINED_FUNCTION_9_3();
  return swift_task_switch();
}

uint64_t sub_22DFA9200()
{
  uint64_t v0;
  void *v1;
  id v2;
  uint64_t v3;
  id v4;
  uint64_t v5;
  void *v6;
  Swift::Bool v7;
  Swift::String v8;
  unint64_t v10;
  unint64_t v11;

  v1 = *(void **)(v0 + 24);
  *(_QWORD *)(v0 + 16) = *(_QWORD *)(v0 + 40);
  sub_22DFDDCA0();
  swift_bridgeObjectRelease();
  v10 = 0xD000000000000033;
  v11 = 0x800000022DFF22F0;
  v2 = objc_msgSend(v1, sel_description);
  OUTLINED_FUNCTION_51_4();

  sub_22DFDD568();
  swift_bridgeObjectRelease();
  v3 = OUTLINED_FUNCTION_11_19();
  v4 = OUTLINED_FUNCTION_10_1(v3, sel_description);
  OUTLINED_FUNCTION_51_4();
  OUTLINED_FUNCTION_36_6();
  OUTLINED_FUNCTION_31_7();
  OUTLINED_FUNCTION_103();
  v5 = v10;
  v6 = (void *)v11;
  v7 = sub_22DF39308() & 1;
  v8._countAndFlagsBits = v5;
  v8._object = v6;
  Logging.ulog(_:extended:)(v8, v7);
  OUTLINED_FUNCTION_105();
  return (*(uint64_t (**)(uint64_t, _QWORD))(v0 + 8))(1, 0);
}

uint64_t sub_22DFA932C(void *a1, int a2, void *a3, void *a4, void *aBlock)
{
  void *v8;
  _QWORD *v9;
  id v10;
  id v11;
  id v12;

  v8 = _Block_copy(aBlock);
  v9 = (_QWORD *)swift_allocObject();
  v9[2] = a3;
  v9[3] = a4;
  v9[4] = v8;
  v9[5] = a1;
  v10 = a3;
  v11 = a4;
  v12 = a1;
  return sub_22DFA8D9C((uint64_t)&unk_255DDBB48, (uint64_t)v9);
}

uint64_t sub_22DFA93A4(void *a1, void *a2, void *aBlock, void *a4)
{
  _QWORD *v4;
  id v8;
  id v9;
  _QWORD *v10;

  v4[3] = a2;
  v4[4] = a4;
  v4[2] = a1;
  v4[5] = _Block_copy(aBlock);
  v8 = a1;
  v9 = a2;
  a4;
  v10 = (_QWORD *)swift_task_alloc();
  v4[6] = v10;
  *v10 = v4;
  v10[1] = sub_22DFA9434;
  return sub_22DFA91BC((uint64_t)v8, (uint64_t)v9);
}

uint64_t sub_22DFA9434(char a1, void *a2)
{
  uint64_t v2;
  _QWORD *v5;
  void (**v6)(_QWORD, _QWORD, _QWORD);
  void *v7;
  void *v8;
  void *v9;

  OUTLINED_FUNCTION_23_2();
  v6 = (void (**)(_QWORD, _QWORD, _QWORD))v5[5];
  v8 = (void *)v5[3];
  v7 = (void *)v5[4];
  v9 = (void *)v5[2];
  OUTLINED_FUNCTION_20();

  ((void (**)(_QWORD, _QWORD, void *))v6)[2](v6, a1 & 1, a2);
  _Block_release(v6);

  return (*(uint64_t (**)(void))(v2 + 8))();
}

void sub_22DFA94B4(void *a1, void *a2, uint64_t a3, void *a4)
{
  void *v4;
  void *v5;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  id v15;
  id v16;
  Swift::Bool v17;
  Swift::String v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  _QWORD *v25;
  id v26;
  id v27;
  id v28;
  uint64_t v29;
  id v30;
  char v31;
  id v32;
  id v33;
  char v34;
  uint64_t v35;

  v5 = v4;
  v9 = OUTLINED_FUNCTION_9_3();
  __swift_instantiateConcreteTypeFromMangledName(&qword_255DD71C0);
  OUTLINED_FUNCTION_57();
  MEMORY[0x24BDAC7A8](v10);
  OUTLINED_FUNCTION_80();
  v35 = v12 - v11;
  OUTLINED_FUNCTION_39_7();
  sub_22DFDDCA0();
  swift_bridgeObjectRelease();
  v13 = objc_msgSend(a1, sel_description);
  OUTLINED_FUNCTION_51_4();
  OUTLINED_FUNCTION_23_10();
  OUTLINED_FUNCTION_3_23();
  OUTLINED_FUNCTION_23_4();
  v14 = OUTLINED_FUNCTION_8_18();
  v15 = OUTLINED_FUNCTION_10_1(v14, sel_description);
  OUTLINED_FUNCTION_51_4();
  OUTLINED_FUNCTION_23_10();
  OUTLINED_FUNCTION_3_23();
  OUTLINED_FUNCTION_23_4();
  sub_22DFDD568();
  v16 = a4;
  __swift_instantiateConcreteTypeFromMangledName(&qword_255DD71D8);
  OUTLINED_FUNCTION_38_10();
  sub_22DFDD568();
  OUTLINED_FUNCTION_23_4();
  v17 = sub_22DF39308() & 1;
  v18._countAndFlagsBits = 0xD00000000000002FLL;
  v19 = v9;
  v18._object = (void *)0x800000022DFF2240;
  Logging.ulog(_:extended:)(v18, v17);
  swift_bridgeObjectRelease();
  if (!a4)
  {
    sub_22DFDDCA0();
    v29 = OUTLINED_FUNCTION_19_13();
    v30 = OUTLINED_FUNCTION_10_1(v29, sel_description);
    OUTLINED_FUNCTION_51_4();
    OUTLINED_FUNCTION_45_5();
    OUTLINED_FUNCTION_40_5();
    OUTLINED_FUNCTION_78_1();
    v31 = OUTLINED_FUNCTION_35_6();
    Logging.ulog(_:_:extended:)(90, 0, 0xE000000000000000, v31 & 1, v9, (uint64_t)&off_24F9B77C8);
LABEL_6:
    swift_bridgeObjectRelease();
    goto LABEL_7;
  }
  v20 = swift_dynamicCastUnknownClass();
  if (!v20)
  {
    v32 = v16;
    sub_22DFDDCA0();
    OUTLINED_FUNCTION_19_13();
    v33 = objc_msgSend(v32, sel_description);
    OUTLINED_FUNCTION_51_4();
    OUTLINED_FUNCTION_17_7();
    OUTLINED_FUNCTION_8_23();
    OUTLINED_FUNCTION_105();
    sub_22DFDD568();
    sub_22DFDE09C();
    sub_22DFDD568();
    OUTLINED_FUNCTION_78_1();
    v34 = sub_22DF39308();
    Logging.ulog(_:_:extended:)(90, 0, 0xE000000000000000, v34 & 1, v19, (uint64_t)&off_24F9B77C8);

    goto LABEL_6;
  }
  v21 = v20;
  v22 = OUTLINED_FUNCTION_177_0();
  OUTLINED_FUNCTION_299(v35, v23, v24, v22);
  v25 = (_QWORD *)swift_allocObject();
  v25[2] = 0;
  v25[3] = 0;
  v25[4] = v5;
  v25[5] = a2;
  v25[6] = v21;
  v26 = v16;
  v27 = v5;
  v28 = a2;
  sub_22DF2A44C();
  swift_release();
LABEL_7:
  OUTLINED_FUNCTION_4_1();
}

uint64_t sub_22DFA982C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  _QWORD *v6;

  v6[3] = a5;
  v6[4] = a6;
  v6[2] = a4;
  return swift_task_switch();
}

uint64_t sub_22DFA9848()
{
  _QWORD *v0;
  _QWORD *v1;
  uint64_t (*v3)(_QWORD, _QWORD);

  v1 = (_QWORD *)OUTLINED_FUNCTION_6_21();
  v0[5] = v1;
  *v1 = v0;
  v1[1] = sub_22DFA989C;
  return v3(v0[3], v0[4]);
}

uint64_t sub_22DFA989C()
{
  uint64_t v0;

  OUTLINED_FUNCTION_23_2();
  OUTLINED_FUNCTION_20();
  return OUTLINED_FUNCTION_72(*(uint64_t (**)(void))(v0 + 8));
}

void sub_22DFA98C8(void *a1, uint64_t a2, void *a3, void *a4, void *a5, void *a6)
{
  id v10;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  id v15;

  v15 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  v13 = a1;
  sub_22DFA94B4(v15, v10, v14, a6);

}

void sub_22DFA9954(void *a1, void *a2, uint64_t a3, uint64_t a4, void *a5)
{
  void *v5;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  id v14;
  id v15;
  Swift::Bool v16;
  Swift::String v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  _QWORD *v21;
  id v22;
  id v23;

  OUTLINED_FUNCTION_9_3();
  __swift_instantiateConcreteTypeFromMangledName(&qword_255DD71C0);
  OUTLINED_FUNCTION_57();
  MEMORY[0x24BDAC7A8](v9);
  OUTLINED_FUNCTION_80();
  v12 = v11 - v10;
  OUTLINED_FUNCTION_39_7();
  sub_22DFDDCA0();
  swift_bridgeObjectRelease();
  v13 = objc_msgSend(a1, sel_description);
  OUTLINED_FUNCTION_51_4();
  OUTLINED_FUNCTION_23_10();
  OUTLINED_FUNCTION_3_23();
  OUTLINED_FUNCTION_23_4();
  OUTLINED_FUNCTION_8_18();
  v14 = objc_msgSend(a2, sel_description);
  OUTLINED_FUNCTION_51_4();
  OUTLINED_FUNCTION_23_10();
  OUTLINED_FUNCTION_3_23();
  OUTLINED_FUNCTION_23_4();
  OUTLINED_FUNCTION_45_2();
  v15 = a5;
  __swift_instantiateConcreteTypeFromMangledName(&qword_255DDAAA0);
  OUTLINED_FUNCTION_38_10();
  sub_22DFDD568();
  OUTLINED_FUNCTION_103();
  v16 = sub_22DF39308() & 1;
  v17._countAndFlagsBits = 0xD000000000000035;
  v17._object = (void *)0x800000022DFF2200;
  Logging.ulog(_:extended:)(v17, v16);
  swift_bridgeObjectRelease();
  v18 = OUTLINED_FUNCTION_177_0();
  OUTLINED_FUNCTION_299(v12, v19, v20, v18);
  v21 = (_QWORD *)OUTLINED_FUNCTION_36_4();
  v21[2] = 0;
  v21[3] = 0;
  v21[4] = v5;
  v21[5] = a2;
  v22 = v5;
  v23 = a2;
  sub_22DF2A44C();
  swift_release();
  OUTLINED_FUNCTION_4_1();
}

uint64_t sub_22DFA9AF0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;

  *(_QWORD *)(v5 + 16) = a4;
  *(_QWORD *)(v5 + 24) = a5;
  return swift_task_switch();
}

uint64_t sub_22DFA9B08()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t (*v3)(_QWORD);

  v1 = (_QWORD *)OUTLINED_FUNCTION_6_21();
  *(_QWORD *)(v0 + 32) = v1;
  *v1 = v0;
  v1[1] = sub_22DF91D34;
  return v3(*(_QWORD *)(v0 + 24));
}

void sub_22DFA9B5C(void *a1, uint64_t a2, void *a3, void *a4, void *a5, void *a6, void *a7)
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  id v19;

  v19 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v15 = a1;
  v16 = a7;
  sub_22DFA9954(v19, v12, v17, v18, a7);

}

uint64_t sub_22DFA9BF8()
{
  uint64_t v0;
  id v1;
  uint64_t v2;
  id v3;
  char v4;

  OUTLINED_FUNCTION_9_3();
  OUTLINED_FUNCTION_5_20();
  sub_22DFDDCA0();
  OUTLINED_FUNCTION_175_0();
  OUTLINED_FUNCTION_34_4();
  v0 = sub_22DFDD568();
  v1 = OUTLINED_FUNCTION_10_1(v0, sel_description);
  OUTLINED_FUNCTION_51_4();
  OUTLINED_FUNCTION_36_6();
  OUTLINED_FUNCTION_31_7();
  OUTLINED_FUNCTION_103();
  v2 = OUTLINED_FUNCTION_11_19();
  v3 = OUTLINED_FUNCTION_35_5(v2, sel_description);
  OUTLINED_FUNCTION_51_4();
  OUTLINED_FUNCTION_17_7();
  OUTLINED_FUNCTION_8_23();
  OUTLINED_FUNCTION_105();
  OUTLINED_FUNCTION_45_2();
  __swift_instantiateConcreteTypeFromMangledName(&qword_255DD71A0);
  OUTLINED_FUNCTION_39_5();
  v4 = OUTLINED_FUNCTION_35_6();
  OUTLINED_FUNCTION_4_21(v4);
  return OUTLINED_FUNCTION_78_1();
}

void sub_22DFA9D20(void *a1, uint64_t a2, void *a3, void *a4, void *a5)
{
  id v8;
  id v9;
  id v10;
  id v11;

  v11 = a3;
  v8 = a4;
  v9 = a5;
  v10 = a1;
  sub_22DFA9BF8();

}

void sub_22DFA9D94()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

void sub_22DFA9DC0()
{
  sub_22DFA9D94();
}

uint64_t sub_22DFA9DCC()
{
  swift_release();
  return swift_release();
}

uint64_t type metadata accessor for MessageSessionProducerObserver(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for MessageSessionProducerObserver);
}

uint64_t sub_22DFA9E18()
{
  uint64_t v0;

  OUTLINED_FUNCTION_297();

  OUTLINED_FUNCTION_46_3();
  OUTLINED_FUNCTION_29_12();
  return swift_deallocObject();
}

uint64_t sub_22DFA9E3C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v1 = *(_QWORD *)(v0 + 40);
  v2 = swift_task_alloc();
  v3 = (_QWORD *)OUTLINED_FUNCTION_100(v2);
  v4 = OUTLINED_FUNCTION_25_12(v3);
  return sub_22DFA9AF0(v4, v5, v6, v7, v1);
}

uint64_t sub_22DFA9E9C()
{
  uint64_t v0;

  OUTLINED_FUNCTION_297();

  OUTLINED_FUNCTION_46_3();
  return swift_deallocObject();
}

uint64_t sub_22DFA9ED0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v1 = *(_QWORD *)(v0 + 40);
  v2 = *(_QWORD *)(v0 + 48);
  v3 = swift_task_alloc();
  v4 = (_QWORD *)OUTLINED_FUNCTION_100(v3);
  v5 = OUTLINED_FUNCTION_25_12(v4);
  return sub_22DFA982C(v5, v6, v7, v8, v1, v2);
}

uint64_t sub_22DFA9F38()
{
  uint64_t v0;

  _Block_release(*(const void **)(v0 + 32));
  OUTLINED_FUNCTION_46_3();
  OUTLINED_FUNCTION_29_12();
  return swift_deallocObject();
}

uint64_t sub_22DFA9F68()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t (*v6)(void);

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 16) = v1;
  v2 = OUTLINED_FUNCTION_9_17(v1, (uint64_t)sub_22DF39390);
  return OUTLINED_FUNCTION_4_23(v2, v3, v4, v5, v6);
}

uint64_t sub_22DFA9FB4(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v3;
  _QWORD *v4;
  uint64_t (*v6)(void);

  v6 = (uint64_t (*)(void))((char *)a3 + *a3);
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v3 + 16) = v4;
  *v4 = v3;
  v4[1] = sub_22DF44464;
  return v6();
}

uint64_t sub_22DFAA00C()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t (*v6)(void);

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 16) = v1;
  v2 = OUTLINED_FUNCTION_9_17(v1, (uint64_t)sub_22DF44464);
  return OUTLINED_FUNCTION_4_23(v2, v3, v4, v5, v6);
}

uint64_t sub_22DFAA058(uint64_t a1, uint64_t a2, uint64_t a3, int *a4)
{
  uint64_t v4;
  _QWORD *v5;
  uint64_t (*v7)(void);

  v7 = (uint64_t (*)(void))((char *)a4 + *a4);
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v4 + 16) = v5;
  *v5 = v4;
  v5[1] = sub_22DF44464;
  return v7();
}

uint64_t objectdestroy_14Tm()
{
  OUTLINED_FUNCTION_297();
  swift_release();
  OUTLINED_FUNCTION_29_12();
  return swift_deallocObject();
}

uint64_t sub_22DFAA0D0(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  int *v6;
  uint64_t v7;
  _QWORD *v8;

  v4 = v1[2];
  v5 = v1[3];
  v6 = (int *)v1[4];
  v7 = swift_task_alloc();
  v8 = (_QWORD *)OUTLINED_FUNCTION_100(v7);
  *v8 = v2;
  v8[1] = sub_22DF44464;
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, int *))((char *)&dword_255DDBB60 + dword_255DDBB60))(a1, v4, v5, v6);
}

uint64_t sub_22DFAA150(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;

  v6 = sub_22DFDD778();
  if (__swift_getEnumTagSinglePayload(a1, 1, v6) == 1)
  {
    sub_22DFAA28C(a1);
  }
  else
  {
    sub_22DFDD76C();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 8))(a1, v6);
  }
  if (*(_QWORD *)(a3 + 16))
  {
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_22DFDD730();
    swift_unknownObjectRelease();
  }
  v7 = swift_allocObject();
  *(_QWORD *)(v7 + 16) = a2;
  *(_QWORD *)(v7 + 24) = a3;
  return swift_task_create();
}

uint64_t sub_22DFAA28C(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_255DD71C0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_22DFAA2CC(uint64_t a1, int *a2)
{
  uint64_t v2;
  _QWORD *v4;
  uint64_t (*v6)(uint64_t);

  v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v4;
  *v4 = v2;
  v4[1] = sub_22DFAA330;
  return v6(a1);
}

uint64_t sub_22DFAA330()
{
  uint64_t v0;

  OUTLINED_FUNCTION_20();
  return OUTLINED_FUNCTION_72(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_22DFAA368()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_22DFAA38C(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  int *v4;
  uint64_t v5;
  _QWORD *v6;

  v4 = *(int **)(v1 + 16);
  v5 = swift_task_alloc();
  v6 = (_QWORD *)OUTLINED_FUNCTION_100(v5);
  *v6 = v2;
  v6[1] = sub_22DF39390;
  return ((uint64_t (*)(uint64_t, int *))((char *)&dword_255DDBB70 + dword_255DDBB70))(a1, v4);
}

uint64_t OUTLINED_FUNCTION_3_23()
{
  return sub_22DFDD568();
}

uint64_t OUTLINED_FUNCTION_4_23(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t (*a5)(void))
{
  return a5();
}

uint64_t OUTLINED_FUNCTION_8_23()
{
  return sub_22DFDD568();
}

uint64_t OUTLINED_FUNCTION_9_17@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v3;

  *a1 = v3;
  a1[1] = a2;
  return v2;
}

uint64_t OUTLINED_FUNCTION_11_19()
{
  return sub_22DFDD568();
}

uint64_t OUTLINED_FUNCTION_19_13()
{
  return sub_22DFDD568();
}

uint64_t OUTLINED_FUNCTION_25_12(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  *a1 = v3;
  a1[1] = v1;
  return v2;
}

uint64_t OUTLINED_FUNCTION_29_12()
{
  uint64_t v0;

  return v0;
}

uint64_t OUTLINED_FUNCTION_31_7()
{
  return sub_22DFDD568();
}

uint64_t OUTLINED_FUNCTION_35_6()
{
  return sub_22DF39308();
}

void OUTLINED_FUNCTION_36_6()
{
  void *v0;

}

uint64_t OUTLINED_FUNCTION_38_10()
{
  return sub_22DFDD520();
}

void OUTLINED_FUNCTION_39_7()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(v1 - 104) = 0;
  *(_QWORD *)(v1 - 96) = 0xE000000000000000;
  *(_QWORD *)(v1 - 88) = v0;
}

uint64_t OUTLINED_FUNCTION_40_5()
{
  return sub_22DFDD568();
}

void OUTLINED_FUNCTION_45_5()
{
  void *v0;

}

void OUTLINED_FUNCTION_46_3()
{
  uint64_t v0;

}

uint64_t sub_22DFAA50C(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 48))();
}

uint64_t sub_22DFAA514(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 56))();
}

uint64_t sub_22DFAA51C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 64))();
}

uint64_t sub_22DFAA524(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  __int16 v4;

  v4 = (*(uint64_t (**)(void))(a4 + 72))();
  return OUTLINED_FUNCTION_0_24(v4);
}

uint64_t sub_22DFAA548(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  __int16 v4;

  v4 = (*(uint64_t (**)(void))(a4 + 80))();
  return OUTLINED_FUNCTION_0_24(v4);
}

uint64_t sub_22DFAA56C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return (*(uint64_t (**)(void))(a5 + 88))();
}

uint64_t sub_22DFAA574(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return (*(uint64_t (**)(void))(a5 + 96))();
}

uint64_t sub_22DFAA57C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 104))();
}

uint64_t sub_22DFAA584(void (*a1)(char *, char *), uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
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
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t result;
  uint64_t v26;
  void (*v27)(char *, _QWORD);
  char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  char *v32;
  uint64_t v33;
  char *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  char *v41;
  uint64_t v42;
  uint64_t AssociatedTypeWitness;
  void (*v44)(char *, char *);
  uint64_t v45;
  char *v46;
  uint64_t v47;
  uint64_t v48;
  char v49[32];
  uint64_t v50;

  v36 = a5;
  v37 = a8;
  v44 = a1;
  v45 = a2;
  v35 = *(_QWORD *)(a5 - 8);
  OUTLINED_FUNCTION_3_2();
  MEMORY[0x24BDAC7A8](v9);
  v46 = (char *)&v33 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v11 = *(_QWORD *)(AssociatedTypeWitness - 8);
  MEMORY[0x24BDAC7A8](AssociatedTypeWitness);
  v13 = (char *)&v33 - v12;
  OUTLINED_FUNCTION_3_2();
  MEMORY[0x24BDAC7A8](v14);
  v16 = (char *)&v33 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17 = swift_getAssociatedTypeWitness();
  v38 = *(_QWORD *)(v17 - 8);
  v39 = v17;
  OUTLINED_FUNCTION_3_2();
  v19 = MEMORY[0x24BDAC7A8](v18);
  v34 = (char *)&v33 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v19);
  v22 = (char *)&v33 - v21;
  v23 = sub_22DFDD9DC();
  if (!v23)
    return sub_22DFDD694();
  v24 = v23;
  v50 = sub_22DFDD3E8();
  v40 = sub_22DFDDD24();
  sub_22DFDDD00();
  v42 = a6;
  result = sub_22DFDD9C4();
  if ((v24 & 0x8000000000000000) == 0)
  {
    v26 = v24;
    v41 = v16;
    while (v26)
    {
      v47 = v26;
      v27 = (void (*)(char *, _QWORD))sub_22DFDDA60();
      (*(void (**)(char *))(v11 + 16))(v13);
      v27(v49, 0);
      v28 = v22;
      v29 = v48;
      v44(v13, v46);
      if (v29)
      {
        OUTLINED_FUNCTION_1_21();
        (*(void (**)(char *, uint64_t))(v38 + 8))(v22, v39);
        swift_release();
        return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v35 + 32))(v37, v46, v36);
      }
      v48 = 0;
      OUTLINED_FUNCTION_1_21();
      sub_22DFDDD0C();
      result = sub_22DFDDA24();
      v26 = v47 - 1;
      if (v47 == 1)
      {
        v31 = v38;
        v30 = v39;
        v32 = v34;
        (*(void (**)(char *, char *, uint64_t))(v38 + 32))(v34, v28, v39);
        sub_22DFDDC34();
        (*(void (**)(char *, uint64_t))(v31 + 8))(v32, v30);
        return v50;
      }
    }
    __break(1u);
  }
  __break(1u);
  return result;
}

uint64_t sub_22DFAA8B0(uint64_t a1, _QWORD *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  __int16 v9;

  v9 = (*(uint64_t (**)(void))(a4 + 80))();
  sub_22DFAA914(a2, v4, a1, a3, a4);
  return v9 & 0x101;
}

uint64_t sub_22DFAA914(_QWORD *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v10;
  uint64_t v11;
  char *v12;
  void (*v13)(uint64_t, uint64_t, uint64_t);
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  _QWORD v23[5];

  swift_getAssociatedTypeWitness();
  v10 = sub_22DFDDB2C();
  v19 = *(_QWORD *)(v10 - 8);
  v20 = v10;
  MEMORY[0x24BDAC7A8](v10);
  v12 = (char *)&v18 - v11;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  v13 = *(void (**)(uint64_t, uint64_t, uint64_t))(a5 + 64);
  v21 = a2;
  v22 = a3;
  v13(a3, a4, a5);
  swift_getAssociatedTypeWitness();
  swift_getAssociatedConformanceWitness();
  v14 = sub_22DFDD904();
  v23[0] = v14;
  v15 = sub_22DFDD9AC();
  v16 = MEMORY[0x22E323AEC](MEMORY[0x24BEE1728], v15);
  if (!sub_22DFB1358())
    return swift_bridgeObjectRelease();
  v23[3] = v15;
  v23[4] = v16;
  v23[0] = v14;
  (*(void (**)(char *, uint64_t, _QWORD *, uint64_t, uint64_t))(a5 + 96))(v12, v22, v23, a4, a5);
  (*(void (**)(char *, uint64_t))(v19 + 8))(v12, v20);
  return __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)v23);
}

uint64_t sub_22DFAAAE0(uint64_t a1, _QWORD *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char v14;
  char v15;
  char *v16;
  char v17;
  char v18;
  int v19;
  _QWORD v21[4];
  uint64_t v22;
  uint64_t v23;

  v8 = a2[3];
  v9 = a2[4];
  __swift_project_boxed_opaque_existential_1(a2, v8);
  v21[2] = a3;
  v21[3] = a4;
  v22 = v4;
  v23 = a1;
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_255DDBB90);
  v12 = sub_22DFAA584((void (*)(char *, char *))sub_22DFAB420, (uint64_t)v21, v8, v10, MEMORY[0x24BEE4078], v9, MEMORY[0x24BEE40A8], v11);
  v13 = *(_QWORD *)(v12 + 16);
  if (v13)
  {
    v14 = 0;
    v15 = 0;
    v16 = (char *)(v12 + 33);
    do
    {
      v17 = *(v16 - 1);
      v18 = *v16;
      v16 += 2;
      v15 |= v17;
      v14 |= v18;
      --v13;
    }
    while (v13);
    swift_bridgeObjectRelease();
    if ((v14 & 1) != 0)
      v19 = 256;
    else
      v19 = 0;
  }
  else
  {
    swift_bridgeObjectRelease();
    v15 = 0;
    v19 = 0;
  }
  return v19 | v15 & 1u;
}

uint64_t sub_22DFAABD4(_BYTE *a1, uint64_t a2, _QWORD *a3, uint64_t a4, uint64_t a5)
{
  uint64_t AssociatedTypeWitness;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t TupleTypeMetadata2;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _BYTE *v16;
  uint64_t v17;
  unsigned __int8 *v18;
  uint64_t v19;
  uint64_t v20;
  _QWORD *v21;
  _BYTE *v22;
  void (*v23)(_BYTE *, char *, uint64_t);
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  _BYTE *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t (*v36)(uint64_t, char, uint64_t, int, uint64_t);
  char *v37;
  char v38;
  uint64_t v39;
  uint64_t v40;
  char v41[16];
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;

  v29 = a2;
  v33 = a1;
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v9 = sub_22DFDDB2C();
  v31 = *(_QWORD *)(v9 - 8);
  v28 = v9;
  MEMORY[0x24BDAC7A8](v9);
  v11 = (char *)&v28 - v10;
  TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
  v32 = *(_QWORD *)(TupleTypeMetadata2 - 8);
  OUTLINED_FUNCTION_3_2();
  v14 = MEMORY[0x24BDAC7A8](v13);
  v16 = (char *)&v28 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v14);
  v18 = (unsigned __int8 *)&v28 - v17;
  v20 = a3[3];
  v19 = a3[4];
  v21 = __swift_project_boxed_opaque_existential_1(a3, v20);
  v42 = a4;
  v43 = a5;
  v44 = v30;
  v45 = v29;
  v30 = sub_22DFAA584((void (*)(char *, char *))sub_22DFAB3DC, (uint64_t)v41, v20, TupleTypeMetadata2, MEMORY[0x24BEE4078], v19, MEMORY[0x24BEE40A8], (uint64_t)v21);
  v46 = v30;
  __swift_storeEnumTagSinglePayload((uint64_t)v11, 1, 1, AssociatedTypeWitness);
  v22 = &v16[*(int *)(TupleTypeMetadata2 + 48)];
  *v16 = 0;
  v23 = *(void (**)(_BYTE *, char *, uint64_t))(v31 + 32);
  v24 = v28;
  v23(v22, v11, v28);
  v39 = a4;
  v40 = a5;
  v34 = a4;
  v35 = a5;
  v36 = sub_22DFAB3FC;
  v37 = &v38;
  v25 = sub_22DFDD718();
  MEMORY[0x22E323AEC](MEMORY[0x24BEE12C8], v25);
  sub_22DFDD604();
  (*(void (**)(_BYTE *, uint64_t))(v32 + 8))(v16, TupleTypeMetadata2);
  swift_bridgeObjectRelease();
  v26 = *v18;
  v23(v33, (char *)&v18[*(int *)(TupleTypeMetadata2 + 48)], v24);
  return v26;
}

uint64_t sub_22DFAAE50@<X0>(uint64_t a1@<X0>, uint64_t a2@<X2>, uint64_t a3@<X3>, uint64_t a4@<X4>, _BYTE *a5@<X8>)
{
  uint64_t TupleTypeMetadata2;
  uint64_t result;

  swift_getAssociatedTypeWitness();
  sub_22DFDDB2C();
  TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
  result = (*(uint64_t (**)(_BYTE *, uint64_t, uint64_t, uint64_t, uint64_t))(a4 + 88))(&a5[*(int *)(TupleTypeMetadata2 + 48)], a2, a1, a3, a4);
  *a5 = result & 1;
  return result;
}

uint64_t sub_22DFAAF18(uint64_t a1, char a2, uint64_t a3, int a4, uint64_t a5)
{
  uint64_t v8;
  uint64_t TupleTypeMetadata2;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  _BYTE *v18;
  uint64_t v19;
  uint64_t v20;
  _BYTE *v21;
  uint64_t v22;
  uint64_t v23;
  char *v24;
  uint64_t v25;
  void (*v26)(void);
  char *v27;
  char *v28;
  void (*v29)(char *, char *, uint64_t);
  char v30;
  _BYTE *v31;
  char *v32;
  uint64_t v33;
  _BYTE *v34;
  char *v35;
  uint64_t v36;
  char *v37;
  uint64_t v38;
  uint64_t v40;
  int v41;
  int v42;
  char *v43;
  _BYTE *v44;
  _BYTE *v45;
  _BYTE *v46;
  uint64_t v47;
  uint64_t AssociatedTypeWitness;
  uint64_t v49;
  int v50;

  v49 = a1;
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v8 = sub_22DFDDB2C();
  TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
  v47 = *(_QWORD *)(TupleTypeMetadata2 - 8);
  v10 = MEMORY[0x24BDAC7A8](TupleTypeMetadata2);
  v46 = (char *)&v40 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = MEMORY[0x24BDAC7A8](v10);
  v45 = (char *)&v40 - v13;
  v14 = MEMORY[0x24BDAC7A8](v12);
  v44 = (char *)&v40 - v15;
  v16 = MEMORY[0x24BDAC7A8](v14);
  v18 = (char *)&v40 - v17;
  v19 = MEMORY[0x24BDAC7A8](v16);
  v21 = (char *)&v40 - v20;
  v22 = MEMORY[0x24BDAC7A8](v19);
  v24 = (char *)&v40 + *(int *)(v22 + 48) - v23;
  v42 = a2 & 1;
  *((_BYTE *)&v40 - v23) = a2;
  v25 = *(_QWORD *)(v8 - 8);
  v26 = *(void (**)(void))(v25 + 16);
  v43 = v24;
  v26();
  v27 = &v21[*(int *)(TupleTypeMetadata2 + 48)];
  v50 = a4 & 1;
  *v21 = a4;
  ((void (*)(char *, uint64_t, uint64_t))v26)(v27, a5, v8);
  v28 = &v18[*(int *)(TupleTypeMetadata2 + 48)];
  v41 = a4;
  *v18 = a4;
  ((void (*)(char *, char *, uint64_t))v26)(v28, v27, v8);
  v40 = v25;
  if ((a2 & 1) != 0)
  {
    (*(void (**)(_BYTE *, uint64_t))(v47 + 8))(v18, TupleTypeMetadata2);
    v29 = *(void (**)(char *, char *, uint64_t))(v25 + 32);
    v30 = 1;
    v31 = v44;
  }
  else
  {
    v31 = v44;
    v32 = &v44[*(int *)(TupleTypeMetadata2 + 48)];
    *v44 = v50;
    v29 = *(void (**)(char *, char *, uint64_t))(v25 + 32);
    v29(v32, v28, v8);
    (*(void (**)(char *, uint64_t))(v25 + 8))(v32, v8);
    v30 = v41;
  }
  v33 = (uint64_t)&v45[*(int *)(TupleTypeMetadata2 + 48)];
  *v45 = v42;
  v29((char *)v33, v43, v8);
  v34 = v46;
  v35 = &v46[*(int *)(TupleTypeMetadata2 + 48)];
  *v46 = v50;
  v29(v35, v27, v8);
  v36 = AssociatedTypeWitness;
  if (__swift_getEnumTagSinglePayload(v33, 1, AssociatedTypeWitness) == 1)
  {
    v37 = &v31[*(int *)(TupleTypeMetadata2 + 48)];
    v29(v37, v35, v8);
    v29((char *)v49, v37, v8);
    (*(void (**)(uint64_t, uint64_t))(v40 + 8))(v33, v8);
  }
  else
  {
    (*(void (**)(_BYTE *, uint64_t))(v47 + 8))(v34, TupleTypeMetadata2);
    v38 = v49;
    (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v36 - 8) + 32))(v49, v33, v36);
    __swift_storeEnumTagSinglePayload(v38, 0, 1, v36);
  }
  return v30 & 1;
}

uint64_t sub_22DFAB250@<X0>(unsigned __int8 *a1@<X0>, unsigned __int8 *a2@<X1>, uint64_t (*a3)(_BYTE *, uint64_t, unsigned __int8 *, _QWORD, unsigned __int8 *)@<X2>, _BYTE *a4@<X8>)
{
  uint64_t v8;
  uint64_t TupleTypeMetadata2;
  uint64_t result;

  v8 = *a1;
  swift_getAssociatedTypeWitness();
  sub_22DFDDB2C();
  TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
  result = a3(&a4[*(int *)(TupleTypeMetadata2 + 48)], v8, &a1[*(int *)(TupleTypeMetadata2 + 48)], *a2, &a2[*(int *)(TupleTypeMetadata2 + 48)]);
  *a4 = result & 1;
  return result;
}

void sub_22DFAB314()
{
  OUTLINED_FUNCTION_2_23();
}

uint64_t sub_22DFAB33C(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;
  unsigned __int16 v4;

  v4 = sub_22DFAAAE0(v3, v2, a1, v1);
  return v4 & 1 | ((v4 > 0xFFu) << 8);
}

void sub_22DFAB378()
{
  OUTLINED_FUNCTION_2_23();
}

uint64_t sub_22DFAB3A8(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;
  _BYTE *v4;

  return sub_22DFAABD4(v4, v3, v2, a1, v1) & 1;
}

uint64_t sub_22DFAB3DC@<X0>(uint64_t a1@<X0>, _BYTE *a2@<X8>)
{
  uint64_t *v2;

  return sub_22DFAAE50(a1, v2[5], v2[2], v2[3], a2);
}

uint64_t sub_22DFAB3FC(uint64_t a1, char a2, uint64_t a3, int a4, uint64_t a5)
{
  return sub_22DFAAF18(a1, a2, a3, a4, a5);
}

uint64_t sub_22DFAB404@<X0>(unsigned __int8 *a1@<X0>, unsigned __int8 *a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t v3;

  return sub_22DFAB250(a1, a2, *(uint64_t (**)(_BYTE *, uint64_t, unsigned __int8 *, _QWORD, unsigned __int8 *))(v3 + 32), a3);
}

uint64_t sub_22DFAB420@<X0>(uint64_t a1@<X0>, _BYTE *a2@<X8>)
{
  _QWORD *v2;
  uint64_t result;

  result = (*(uint64_t (**)(_QWORD, uint64_t, _QWORD))(v2[3] + 72))(v2[5], a1, v2[2]);
  *a2 = result & 1;
  a2[1] = BYTE1(result) & 1;
  return result;
}

uint64_t OUTLINED_FUNCTION_0_24(__int16 a1)
{
  uint64_t v1;

  *(_BYTE *)(v1 - 2) = a1 & 1;
  *(_BYTE *)(v1 - 3) = HIBYTE(a1) & 1;
  return a1 & 1 | ((HIBYTE(a1) & 1) << 8);
}

uint64_t OUTLINED_FUNCTION_1_21()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 8))(v0, v1);
}

void OUTLINED_FUNCTION_2_23()
{
  type metadata accessor for TargetedObserverStore();
}

uint64_t sub_22DFAB4B0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void (*v5)(uint64_t, uint64_t);
  uint64_t v6;

  v5 = *(void (**)(uint64_t, uint64_t))(a3 + 32);
  v5(a2, a3);
  sub_22DFDD568();
  swift_bridgeObjectRelease();
  sub_22DF557F4(40, 0xD00000000000001DLL, 0x800000022DFF2410, 0);
  swift_bridgeObjectRelease();
  v5(a2, a3);
  v6 = swift_allocObject();
  *(_QWORD *)(v6 + 16) = a2;
  *(_QWORD *)(v6 + 24) = a3;
  swift_beginAccess();
  sub_22DF31B94();
  swift_endAccess();
  return swift_bridgeObjectRelease();
}

uint64_t sub_22DFAB5D4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X8>)
{
  uint64_t v6;
  uint64_t v12;
  void (*v13)(__int128 *__return_ptr, uint64_t *, _QWORD *);
  uint64_t v15;
  _QWORD v17[2];
  __int128 v18;
  uint64_t v19;
  uint64_t v20;

  sub_22DFDDCA0();
  swift_bridgeObjectRelease();
  *(_QWORD *)&v18 = 0xD000000000000026;
  *((_QWORD *)&v18 + 1) = 0x800000022DFF23E0;
  sub_22DFDD568();
  sub_22DFDD568();
  sub_22DFDD568();
  sub_22DF557F4(40, 0xD000000000000026, 0x800000022DFF23E0, 0);
  swift_bridgeObjectRelease();
  swift_beginAccess();
  v12 = *(_QWORD *)(v6 + 16);
  sub_22DFDD448();
  v13 = (void (*)(__int128 *__return_ptr, uint64_t *, _QWORD *))sub_22DFD31D0(a1, a2, v12);
  swift_bridgeObjectRelease();
  if (v13)
  {
    swift_endAccess();
    v20 = a3;
    v17[0] = a4;
    v17[1] = a5;
    v13(&v18, &v20, v17);
    sub_22DF34068((uint64_t)v13);
    if (v19)
      return sub_22DF34CD0(&v18, a6);
    sub_22DF55714((uint64_t)&v18);
    sub_22DFAB9CC();
    OUTLINED_FUNCTION_17();
    *(_QWORD *)v15 = a4;
  }
  else
  {
    swift_endAccess();
    sub_22DFAB9CC();
    OUTLINED_FUNCTION_17();
    *(_QWORD *)v15 = a1;
    a5 = a2;
  }
  *(_QWORD *)(v15 + 8) = a5;
  *(_BYTE *)(v15 + 16) = v13 != 0;
  sub_22DFDD448();
  return swift_willThrow();
}

uint64_t sub_22DFAB7BC()
{
  uint64_t v0;
  uint64_t result;

  type metadata accessor for TransportRequestsRegister();
  v0 = swift_allocObject();
  __swift_instantiateConcreteTypeFromMangledName(&qword_255DDBC48);
  result = sub_22DFDD430();
  *(_QWORD *)(v0 + 16) = result;
  qword_255DDBB98 = v0;
  return result;
}

uint64_t static TransportRequestsRegister.shared.getter()
{
  if (qword_255DD6F70 != -1)
    swift_once();
  return swift_retain();
}

uint64_t sub_22DFAB860@<X0>(uint64_t a1@<X2>, uint64_t a2@<X3>, uint64_t a3@<X8>)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t result;
  uint64_t *boxed_opaque_existential_1;
  uint64_t v12;

  v6 = sub_22DFDDB2C();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v12 - v8;
  sub_22DF6101C(a1, (uint64_t)&v12 - v8);
  if (__swift_getEnumTagSinglePayload((uint64_t)v9, 1, a1) == 1)
  {
    result = (*(uint64_t (**)(char *, uint64_t))(v7 + 8))(v9, v6);
    *(_QWORD *)(a3 + 32) = 0;
    *(_OWORD *)a3 = 0u;
    *(_OWORD *)(a3 + 16) = 0u;
  }
  else
  {
    *(_QWORD *)(a3 + 24) = a1;
    *(_QWORD *)(a3 + 32) = a2;
    boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1((uint64_t *)a3);
    return (*(uint64_t (**)(uint64_t *, char *, uint64_t))(*(_QWORD *)(a1 - 8) + 32))(boxed_opaque_existential_1, v9, a1);
  }
  return result;
}

uint64_t TransportRequestsRegister.deinit()
{
  uint64_t v0;

  swift_bridgeObjectRelease();
  return v0;
}

uint64_t TransportRequestsRegister.__deallocating_deinit()
{
  swift_bridgeObjectRelease();
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for TransportRequestsRegister()
{
  return objc_opt_self();
}

uint64_t method lookup function for TransportRequestsRegister()
{
  return swift_lookUpClassMethod();
}

unint64_t sub_22DFAB9CC()
{
  unint64_t result;

  result = qword_255DDBC40;
  if (!qword_255DDBC40)
  {
    result = MEMORY[0x22E323AEC](&unk_22DFE86D0, &type metadata for TransportRequestsRegister.RegisterError);
    atomic_store(result, (unint64_t *)&qword_255DDBC40);
  }
  return result;
}

uint64_t sub_22DFABA08()
{
  return swift_deallocObject();
}

uint64_t sub_22DFABA18@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_22DFAB860(*(_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 24), a1);
}

ValueMetadata *type metadata accessor for TransportRequestsRegister.RegisterError()
{
  return &type metadata for TransportRequestsRegister.RegisterError;
}

uint64_t IntroductionResponse.opalVersion.getter()
{
  uint64_t *v0;
  uint64_t v1;

  v1 = *v0;
  sub_22DFDD448();
  return v1;
}

HomePodSettings::IntroductionResponse __swiftcall IntroductionResponse.init(opalVersion:)(HomePodSettings::IntroductionResponse opalVersion)
{
  HomePodSettings::IntroductionResponse *v1;

  *v1 = opalVersion;
  return opalVersion;
}

uint64_t sub_22DFABA64(uint64_t a1, uint64_t a2)
{
  char v3;
  char v4;

  if (a1 == 0x737265566C61706FLL && a2 == 0xEB000000006E6F69)
  {
    swift_bridgeObjectRelease();
    v4 = 0;
  }
  else
  {
    v3 = sub_22DFDDF58();
    swift_bridgeObjectRelease();
    v4 = v3 ^ 1;
  }
  return v4 & 1;
}

uint64_t sub_22DFABB00()
{
  return 0x737265566C61706FLL;
}

uint64_t sub_22DFABB24@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_22DFABA64(a1, a2);
  *a3 = result & 1;
  return result;
}

uint64_t sub_22DFABB4C()
{
  sub_22DFABC5C();
  return sub_22DFDE084();
}

uint64_t sub_22DFABB74()
{
  sub_22DFABC5C();
  return sub_22DFDE090();
}

void IntroductionResponse.encode(to:)(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_255DDBC50);
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  OUTLINED_FUNCTION_246();
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_22DFABC5C();
  sub_22DFDE06C();
  sub_22DFDDEC8();
  OUTLINED_FUNCTION_1_22(*(uint64_t (**)(uint64_t, uint64_t))(v3 + 8));
  OUTLINED_FUNCTION_1_4();
}

unint64_t sub_22DFABC5C()
{
  unint64_t result;

  result = qword_255DDBC58;
  if (!qword_255DDBC58)
  {
    result = MEMORY[0x22E323AEC](&unk_22DFE89B8, &type metadata for IntroductionResponse.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_255DDBC58);
  }
  return result;
}

void IntroductionResponse.init(from:)(_QWORD *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_255DDBC60);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  OUTLINED_FUNCTION_246();
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_22DFABC5C();
  sub_22DFDE060();
  if (!v2)
  {
    v7 = sub_22DFDDE50();
    v9 = v8;
    OUTLINED_FUNCTION_1_22(*(uint64_t (**)(uint64_t, uint64_t))(v6 + 8));
    *a2 = v7;
    a2[1] = v9;
  }
  __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)a1);
  OUTLINED_FUNCTION_1_4();
}

void sub_22DFABD80(_QWORD *a1@<X0>, uint64_t *a2@<X8>)
{
  IntroductionResponse.init(from:)(a1, a2);
}

void sub_22DFABD94(_QWORD *a1)
{
  IntroductionResponse.encode(to:)(a1);
}

unint64_t static IntroductionRequest.typeIdentifier.getter()
{
  return 0xD000000000000013;
}

uint64_t sub_22DFABDC8()
{
  sub_22DFABEDC();
  return sub_22DFDE084();
}

uint64_t sub_22DFABDF0()
{
  sub_22DFABEDC();
  return sub_22DFDE090();
}

uint64_t IntroductionRequest.encode(to:)(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v7;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_255DDBC68);
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v7 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_22DFABEDC();
  sub_22DFDE06C();
  return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
}

unint64_t sub_22DFABEDC()
{
  unint64_t result;

  result = qword_255DDBC70;
  if (!qword_255DDBC70)
  {
    result = MEMORY[0x22E323AEC](&unk_22DFE8968, &type metadata for IntroductionRequest.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_255DDBC70);
  }
  return result;
}

uint64_t IntroductionRequest.init(from:)(uint64_t a1)
{
  return __swift_destroy_boxed_opaque_existential_0Tm(a1);
}

uint64_t sub_22DFABF3C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_22DF66E04(a1, a2, a3, (uint64_t (*)(void))sub_22DFABF50, (uint64_t (*)(void))sub_22DFABF8C);
}

unint64_t sub_22DFABF50()
{
  unint64_t result;

  result = qword_255DDBC78;
  if (!qword_255DDBC78)
  {
    result = MEMORY[0x22E323AEC](&protocol conformance descriptor for IntroductionResponse, &type metadata for IntroductionResponse);
    atomic_store(result, (unint64_t *)&qword_255DDBC78);
  }
  return result;
}

unint64_t sub_22DFABF8C()
{
  unint64_t result;

  result = qword_255DDBC80;
  if (!qword_255DDBC80)
  {
    result = MEMORY[0x22E323AEC](&protocol conformance descriptor for IntroductionResponse, &type metadata for IntroductionResponse);
    atomic_store(result, (unint64_t *)&qword_255DDBC80);
  }
  return result;
}

unint64_t sub_22DFABFCC()
{
  unint64_t result;

  result = qword_255DDBC88;
  if (!qword_255DDBC88)
  {
    result = MEMORY[0x22E323AEC](&protocol conformance descriptor for IntroductionResponse, &type metadata for IntroductionResponse);
    atomic_store(result, (unint64_t *)&qword_255DDBC88);
  }
  return result;
}

unint64_t sub_22DFAC008()
{
  static IntroductionRequest.typeIdentifier.getter();
  return 0xD000000000000013;
}

unint64_t sub_22DFAC024(uint64_t a1)
{
  unint64_t result;

  result = sub_22DFAC048();
  *(_QWORD *)(a1 + 8) = result;
  return result;
}

unint64_t sub_22DFAC048()
{
  unint64_t result;

  result = qword_255DDBCB8;
  if (!qword_255DDBCB8)
  {
    result = MEMORY[0x22E323AEC](&protocol conformance descriptor for IntroductionRequest, &type metadata for IntroductionRequest);
    atomic_store(result, (unint64_t *)&qword_255DDBCB8);
  }
  return result;
}

uint64_t sub_22DFAC084(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_22DF66E04(a1, a2, a3, (uint64_t (*)(void))sub_22DFAC098, (uint64_t (*)(void))sub_22DFAC0D4);
}

unint64_t sub_22DFAC098()
{
  unint64_t result;

  result = qword_255DDBCC0;
  if (!qword_255DDBCC0)
  {
    result = MEMORY[0x22E323AEC](&protocol conformance descriptor for IntroductionRequest, &type metadata for IntroductionRequest);
    atomic_store(result, (unint64_t *)&qword_255DDBCC0);
  }
  return result;
}

unint64_t sub_22DFAC0D4()
{
  unint64_t result;

  result = qword_255DDBCC8;
  if (!qword_255DDBCC8)
  {
    result = MEMORY[0x22E323AEC](&protocol conformance descriptor for IntroductionRequest, &type metadata for IntroductionRequest);
    atomic_store(result, (unint64_t *)&qword_255DDBCC8);
  }
  return result;
}

uint64_t sub_22DFAC110(uint64_t a1)
{
  return IntroductionRequest.init(from:)(a1);
}

uint64_t sub_22DFAC124(_QWORD *a1)
{
  return IntroductionRequest.encode(to:)(a1);
}

uint64_t getEnumTagSinglePayload for IntroductionResponse(uint64_t a1, int a2)
{
  unint64_t v2;

  if (a2)
  {
    if (a2 < 0 && *(_BYTE *)(a1 + 16))
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

uint64_t storeEnumTagSinglePayload for IntroductionResponse(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for IntroductionResponse()
{
  return &type metadata for IntroductionResponse;
}

ValueMetadata *type metadata accessor for IntroductionRequest()
{
  return &type metadata for IntroductionRequest;
}

ValueMetadata *type metadata accessor for IntroductionRequest.CodingKeys()
{
  return &type metadata for IntroductionRequest.CodingKeys;
}

uint64_t storeEnumTagSinglePayload for IntroductionResponse.CodingKeys(uint64_t a1, int a2, int a3)
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
    return ((uint64_t (*)(void))((char *)sub_22DFAC224 + 4 * byte_22DFE8710[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_22DFAC244 + 4 * byte_22DFE8715[v4]))();
}

_BYTE *sub_22DFAC224(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_22DFAC244(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_22DFAC24C(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_22DFAC254(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_22DFAC25C(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_22DFAC264(_DWORD *result)
{
  *result = 0;
  return result;
}

ValueMetadata *type metadata accessor for IntroductionResponse.CodingKeys()
{
  return &type metadata for IntroductionResponse.CodingKeys;
}

unint64_t sub_22DFAC284()
{
  unint64_t result;

  result = qword_255DDBCD0;
  if (!qword_255DDBCD0)
  {
    result = MEMORY[0x22E323AEC](&unk_22DFE88F0, &type metadata for IntroductionResponse.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_255DDBCD0);
  }
  return result;
}

unint64_t sub_22DFAC2C4()
{
  unint64_t result;

  result = qword_255DDBCD8;
  if (!qword_255DDBCD8)
  {
    result = MEMORY[0x22E323AEC](&unk_22DFE8918, &type metadata for IntroductionRequest.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_255DDBCD8);
  }
  return result;
}

unint64_t sub_22DFAC304()
{
  unint64_t result;

  result = qword_255DDBCE0;
  if (!qword_255DDBCE0)
  {
    result = MEMORY[0x22E323AEC](&unk_22DFE8940, &type metadata for IntroductionRequest.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_255DDBCE0);
  }
  return result;
}

unint64_t sub_22DFAC344()
{
  unint64_t result;

  result = qword_255DDBCE8;
  if (!qword_255DDBCE8)
  {
    result = MEMORY[0x22E323AEC](&unk_22DFE8860, &type metadata for IntroductionResponse.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_255DDBCE8);
  }
  return result;
}

unint64_t sub_22DFAC384()
{
  unint64_t result;

  result = qword_255DDBCF0;
  if (!qword_255DDBCF0)
  {
    result = MEMORY[0x22E323AEC](&unk_22DFE8888, &type metadata for IntroductionResponse.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_255DDBCF0);
  }
  return result;
}

uint64_t OUTLINED_FUNCTION_1_22@<X0>(uint64_t (*a1)(uint64_t, uint64_t)@<X8>)
{
  uint64_t v1;
  uint64_t v2;

  return a1(v2, v1);
}

uint64_t sub_22DFAC3CC(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 24))();
}

uint64_t sub_22DFAC3D4(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 40))();
}

uint64_t sub_22DFAC3E0(uint64_t a1, uint64_t a2)
{
  _QWORD *v3;

  __swift_instantiateConcreteTypeFromMangledName(&qword_255DD71A0);
  OUTLINED_FUNCTION_17();
  *v3 = a2;
  return swift_continuation_throwingResumeWithError();
}

uint64_t sub_22DFAC42C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _QWORD *v3;

  v3 = *(_QWORD **)(*(_QWORD *)(a1 + 64) + 40);
  *v3 = a2;
  v3[1] = a3;
  return swift_continuation_throwingResume();
}

uint64_t sub_22DFAC43C(uint64_t a1, uint64_t a2)
{
  **(_QWORD **)(*(_QWORD *)(a1 + 64) + 40) = a2;
  return swift_continuation_throwingResume();
}

uint64_t sub_22DFAC44C(_QWORD *a1, _QWORD *a2, uint64_t (*a3)(_QWORD, _QWORD))
{
  return a3(*a1, *a2);
}

id sub_22DFAC474@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v3;
  void *v7;

  v7 = *(void **)(v3 + 24);
  objc_msgSend(v7, sel_lock);
  sub_22DFDCEF0();
  OUTLINED_FUNCTION_77_4();
  swift_retain();
  sub_22DF31984(a1, a2, a3);
  swift_endAccess();
  return objc_msgSend(v7, sel_unlock);
}

uint64_t sub_22DFAC500()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;

  v1 = *(void **)(v0 + 24);
  objc_msgSend(v1, sel_lock);
  OUTLINED_FUNCTION_77_4();
  v2 = sub_22DF31480();
  swift_endAccess();
  objc_msgSend(v1, sel_unlock);
  return v2;
}

void sub_22DFAC574(uint64_t a1, void *a2, void *a3, void *aBlock)
{
  void (*v6)(id, id, void (*)(uint64_t, uint64_t), uint64_t);
  void *v7;
  uint64_t v8;
  id v9;
  id v10;

  v6 = *(void (**)(id, id, void (*)(uint64_t, uint64_t), uint64_t))(a1 + 32);
  v7 = _Block_copy(aBlock);
  v8 = OUTLINED_FUNCTION_32();
  *(_QWORD *)(v8 + 16) = v7;
  swift_retain();
  v10 = a2;
  v9 = a3;
  v6(v10, v9, sub_22DFB0B04, v8);
  swift_release();
  swift_release();

}

void sub_22DFAC620(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  id v6;

  if (a2)
    v5 = sub_22DFDCE30();
  else
    v5 = 0;
  v6 = (id)v5;
  (*(void (**)(uint64_t, uint64_t))(a3 + 16))(a3, a1);

}

void sub_22DFAC678(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  Swift::String v8;
  Swift::Bool v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;

  sub_22DF39308();
  OUTLINED_FUNCTION_27_3();
  v8._countAndFlagsBits = 0xD00000000000001BLL;
  Logging.ulog(_:extended:)(v8, v9);
  v10 = (void *)OUTLINED_FUNCTION_99_2();
  v11 = OUTLINED_FUNCTION_7_10();
  v12 = OUTLINED_FUNCTION_32();
  OUTLINED_FUNCTION_118_3();
  v13 = (_QWORD *)OUTLINED_FUNCTION_32();
  v13[2] = a3;
  v13[3] = a4;
  v13[4] = v11;
  v13[5] = v12;
  v13[6] = a1;
  v13[7] = a2;
  v14 = OUTLINED_FUNCTION_116_0((uint64_t)&block_descriptor_57, MEMORY[0x24BDAC760], 1107296256, v20, v22);
  swift_retain();
  swift_release();
  type metadata accessor for CoordinationRequest();
  objc_msgSend(v10, sel_registerHandler_forRequestClass_, v14, swift_getObjCClassFromMetadata());
  _Block_release(v14);

  v15 = (void *)OUTLINED_FUNCTION_99_2();
  v16 = OUTLINED_FUNCTION_7_10();
  v17 = OUTLINED_FUNCTION_32();
  OUTLINED_FUNCTION_118_3();
  v18 = (_QWORD *)OUTLINED_FUNCTION_32();
  v18[2] = a3;
  v18[3] = a4;
  v18[4] = v16;
  v18[5] = v17;
  v19 = OUTLINED_FUNCTION_116_0((uint64_t)&block_descriptor_64, MEMORY[0x24BDAC760], 1107296256, v21, v23);
  swift_release();
  type metadata accessor for CoordinationObservationUpdate();
  objc_msgSend(v15, sel_registerHandler_forRequestClass_, v19, swift_getObjCClassFromMetadata());
  _Block_release(v19);

}

void sub_22DFAC884()
{
  uint64_t v0;

  OUTLINED_FUNCTION_25_13();
  OUTLINED_FUNCTION_4_24();
  v0 = swift_task_alloc();
  OUTLINED_FUNCTION_3_24(v0);
}

void sub_22DFAC8B4()
{
  OUTLINED_FUNCTION_4_7();
}

uint64_t sub_22DFAC8C4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v0 = OUTLINED_FUNCTION_1_23((uint64_t)sub_22DFB0C30);
  return OUTLINED_FUNCTION_43_4(v0, v1, v2, v3, v4, v5, v6);
}

uint64_t sub_22DFAC8DC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v7;
  _QWORD *v8;
  uint64_t v9;

  v8[29] = a7;
  v8[30] = v7;
  v8[27] = a5;
  v8[28] = a6;
  v8[25] = a3;
  v8[26] = a4;
  v8[23] = a1;
  v8[24] = a2;
  v8[31] = *(_QWORD *)(a5 - 8);
  v8[32] = OUTLINED_FUNCTION_42();
  v8[33] = sub_22DFDD730();
  v8[34] = v9;
  return swift_task_switch();
}

uint64_t sub_22DFAC958()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  Swift::Bool v6;
  Swift::String v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  unint64_t inited;
  uint64_t v13;
  _OWORD *v14;
  uint64_t v16;
  _QWORD *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;

  *(_QWORD *)(v0 + 176) = *(_QWORD *)(v0 + 240);
  v18 = *(_QWORD *)(v0 + 248);
  v19 = *(_QWORD *)(v0 + 256);
  v1 = *(_QWORD *)(v0 + 224);
  v20 = *(_QWORD *)(v0 + 232);
  v2 = *(_QWORD *)(v0 + 208);
  v3 = *(_QWORD *)(v0 + 216);
  v5 = *(_QWORD *)(v0 + 192);
  v4 = *(_QWORD *)(v0 + 200);
  sub_22DFDDCA0();
  OUTLINED_FUNCTION_34_4();
  OUTLINED_FUNCTION_57_5();
  sub_22DFDDF28();
  OUTLINED_FUNCTION_9_14();
  swift_getAssociatedTypeWitness();
  sub_22DFDDF28();
  v6 = sub_22DF39308() & 1;
  v7._countAndFlagsBits = 0;
  v7._object = (void *)0xE000000000000000;
  Logging.ulog(_:extended:)(v7, v6);
  OUTLINED_FUNCTION_149();
  type metadata accessor for CoordinationRequest();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v18 + 16))(v19, v5, v3);
  v8 = sub_22DF55270(v19, v3, v20);
  *(_QWORD *)(v0 + 280) = v8;
  v9 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v1 + 48))(v4, v2, v1);
  *(_QWORD *)(v0 + 288) = v9;
  if (v9)
  {
    v10 = (void *)v9;
    v11 = (void *)(*(uint64_t (**)(_QWORD))(*(_QWORD *)(v0 + 224) + 24))(*(_QWORD *)(v0 + 208));
    *(_QWORD *)(v0 + 296) = v11;
    __swift_instantiateConcreteTypeFromMangledName(&qword_255DD7278);
    inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_22DFE0820;
    *(_QWORD *)(inited + 32) = objc_msgSend(v10, sel_member);
    sub_22DFDD670();
    if (inited >> 62)
    {
      sub_22DFDD448();
      v13 = sub_22DFDDDB4();
      OUTLINED_FUNCTION_46();
    }
    else
    {
      v13 = *(_QWORD *)((inited & 0xFFFFFFFFFFFFF8) + 0x10);
    }
    if (v13)
      sub_22DFB044C(inited);
    else
      swift_bridgeObjectRelease();
    sub_22DF7F42C();
    sub_22DFB0694();
    *(_QWORD *)(v0 + 304) = OUTLINED_FUNCTION_104_2();
    OUTLINED_FUNCTION_46();
    *(_QWORD *)(v0 + 56) = v0 + 160;
    *(_QWORD *)(v0 + 16) = v0;
    *(_QWORD *)(v0 + 24) = sub_22DFACC78;
    v16 = swift_continuation_init();
    *(_QWORD *)(v0 + 120) = MEMORY[0x24BDAC760];
    v17 = (_QWORD *)(v0 + 120);
    v17[1] = 0x40000000;
    v17[2] = sub_22DFAF5DC;
    v17[3] = &block_descriptor_7;
    v17[4] = v16;
    OUTLINED_FUNCTION_120_3(v11, sel_sendRequest_members_withCompletionHandler_, (uint64_t)v8);
    return swift_continuation_await();
  }
  else
  {
    sub_22DF9B2D0();
    OUTLINED_FUNCTION_17();
    *v14 = 0u;
    v14[1] = 0u;
    OUTLINED_FUNCTION_18_13((uint64_t)v14, 2);

    OUTLINED_FUNCTION_91_3();
    return OUTLINED_FUNCTION_12(*(uint64_t (**)(void))(v0 + 8));
  }
}

uint64_t sub_22DFACC78()
{
  uint64_t v0;
  uint64_t v1;

  OUTLINED_FUNCTION_8_16();
  *(_QWORD *)(v0 + 312) = v1;
  return OUTLINED_FUNCTION_2_2();
}

uint64_t sub_22DFACCB8()
{
  uint64_t v0;
  void *v1;
  void *v2;
  void *v3;
  uint64_t AssociatedTypeWitness;
  uint64_t AssociatedConformanceWitness;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  _QWORD *v10;
  uint64_t v11;
  uint64_t (*v12)(void);
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t *v19;

  v2 = *(void **)(v0 + 296);
  v1 = *(void **)(v0 + 304);

  v3 = *(void **)(v0 + 168);
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
  type metadata accessor for CoordinationResponse(0, AssociatedTypeWitness, AssociatedConformanceWitness, v6);
  v7 = OUTLINED_FUNCTION_180();
  v9 = *(void **)(v0 + 280);
  v8 = *(void **)(v0 + 288);
  if (v7)
  {
    v10 = (_QWORD *)v7;
    v11 = *(_QWORD *)(v0 + 184);

    OUTLINED_FUNCTION_257(v11, (uint64_t)v10 + *(_QWORD *)((*MEMORY[0x24BEE4EA0] & *v10) + 0x60), *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(AssociatedTypeWitness - 8) + 16));
    OUTLINED_FUNCTION_40();
    v12 = (uint64_t (*)(void))OUTLINED_FUNCTION_152();
  }
  else
  {
    swift_getObjectType();
    v13 = OUTLINED_FUNCTION_109_1();
    v15 = v14;
    v16 = OUTLINED_FUNCTION_109_1();
    v18 = v17;
    sub_22DF9B2D0();
    OUTLINED_FUNCTION_17();
    *v19 = v13;
    v19[1] = v15;
    v19[2] = v16;
    v19[3] = v18;
    OUTLINED_FUNCTION_18_13((uint64_t)v19, 1);

    OUTLINED_FUNCTION_91_3();
    v12 = *(uint64_t (**)(void))(v0 + 8);
  }
  return v12();
}

uint64_t sub_22DFACE30()
{
  uint64_t v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  v1 = *(void **)(v0 + 304);
  v3 = *(void **)(v0 + 288);
  v2 = *(void **)(v0 + 296);
  v4 = *(void **)(v0 + 280);
  swift_willThrow();

  OUTLINED_FUNCTION_91_3();
  return OUTLINED_FUNCTION_38_0(*(uint64_t (**)(void))(v0 + 8));
}

void sub_22DFACE80()
{
  uint64_t v0;

  OUTLINED_FUNCTION_25_13();
  OUTLINED_FUNCTION_4_24();
  v0 = swift_task_alloc();
  OUTLINED_FUNCTION_3_24(v0);
}

void sub_22DFACEB0()
{
  OUTLINED_FUNCTION_4_7();
}

uint64_t sub_22DFACEC0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v0 = OUTLINED_FUNCTION_1_23((uint64_t)sub_22DFB0C30);
  return OUTLINED_FUNCTION_41_4(v0, v1, v2, v3, v4, v5, v6);
}

uint64_t sub_22DFACED8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v7;
  _QWORD *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  OUTLINED_FUNCTION_15_17(a1, a2, a3, a4, a5, a6, a7);
  v10 = OUTLINED_FUNCTION_162_0();
  v11 = OUTLINED_FUNCTION_45_6(v10);
  v8[13] = v11;
  v8[14] = *(_QWORD *)(v11 - 8);
  v8[15] = OUTLINED_FUNCTION_42();
  v8[16] = *(_QWORD *)(v9 - 8);
  v8[17] = OUTLINED_FUNCTION_42();
  v8[18] = *(_QWORD *)(v7 + 8);
  v12 = OUTLINED_FUNCTION_27_6();
  OUTLINED_FUNCTION_106_3(v12, v13);
  return OUTLINED_FUNCTION_24();
}

uint64_t sub_22DFACF60()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char v5;
  char v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  uint64_t v11;
  uint64_t v12;
  uint64_t (*v13)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, uint64_t);

  *(_QWORD *)(v0 + 16) = *(_QWORD *)(v0 + 80);
  v11 = *(_QWORD *)(v0 + 88);
  v12 = *(_QWORD *)(v0 + 120);
  v1 = *(_QWORD *)(v0 + 64);
  v3 = *(_QWORD *)(v0 + 40);
  v2 = *(_QWORD *)(v0 + 48);
  sub_22DFDDCA0();
  OUTLINED_FUNCTION_34_4();
  OUTLINED_FUNCTION_57_5();
  sub_22DFDDF28();
  OUTLINED_FUNCTION_10_13();
  OUTLINED_FUNCTION_44_3();
  OUTLINED_FUNCTION_162_0();
  OUTLINED_FUNCTION_86_4();
  v4 = *(_QWORD *)(v11 + 16);
  v5 = sub_22DF39308();
  OUTLINED_FUNCTION_24_13(v5);
  OUTLINED_FUNCTION_149();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v1 + 56))(v3, v2, v1);
  OUTLINED_FUNCTION_16_10(v12);
  if (v6)
  {
    OUTLINED_FUNCTION_89_0(*(_QWORD *)(v0 + 112));
    sub_22DF9B2D0();
    v7 = OUTLINED_FUNCTION_17();
    OUTLINED_FUNCTION_2_18(v7, v8);
    OUTLINED_FUNCTION_132_2();
    OUTLINED_FUNCTION_34();
    return OUTLINED_FUNCTION_12(*(uint64_t (**)(void))(v0 + 8));
  }
  else
  {
    (*(void (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(v0 + 128) + 32))(*(_QWORD *)(v0 + 136), *(_QWORD *)(v0 + 120), *(_QWORD *)(v0 + 96));
    v13 = (uint64_t (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, uint64_t))(**(int **)(v4 + 56)
                                                                                          + *(_QWORD *)(v4 + 56));
    v9 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 168) = v9;
    *v9 = v0;
    v9[1] = sub_22DFAD144;
    return v13(*(_QWORD *)(v0 + 24), *(_QWORD *)(v0 + 32), *(_QWORD *)(v0 + 136), *(_QWORD *)(v0 + 56), *(_QWORD *)(v0 + 72), *(_QWORD *)(v0 + 48), v4);
  }
}

uint64_t sub_22DFAD144()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;
  _QWORD *v3;

  OUTLINED_FUNCTION_209();
  *v3 = *v2;
  *(_QWORD *)(v0 + 176) = v1;
  swift_task_dealloc();
  return OUTLINED_FUNCTION_24();
}

uint64_t sub_22DFAD198()
{
  uint64_t v0;
  uint64_t (*v1)(void);

  OUTLINED_FUNCTION_121_0(*(_QWORD *)(v0 + 128));
  OUTLINED_FUNCTION_28();
  OUTLINED_FUNCTION_34();
  v1 = (uint64_t (*)(void))OUTLINED_FUNCTION_152();
  return OUTLINED_FUNCTION_53(v1);
}

uint64_t sub_22DFAD1D4()
{
  uint64_t v0;

  OUTLINED_FUNCTION_89_0(*(_QWORD *)(v0 + 128));
  OUTLINED_FUNCTION_132_2();
  OUTLINED_FUNCTION_34();
  return OUTLINED_FUNCTION_53(*(uint64_t (**)(void))(v0 + 8));
}

void sub_22DFAD210()
{
  uint64_t v0;

  OUTLINED_FUNCTION_25_13();
  OUTLINED_FUNCTION_4_24();
  v0 = swift_task_alloc();
  OUTLINED_FUNCTION_3_24(v0);
}

void sub_22DFAD240()
{
  OUTLINED_FUNCTION_4_7();
}

uint64_t sub_22DFAD250()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v0 = OUTLINED_FUNCTION_1_23((uint64_t)sub_22DFB0C30);
  return OUTLINED_FUNCTION_42_3(v0, v1, v2, v3, v4, v5, v6);
}

uint64_t sub_22DFAD268(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v7;
  _QWORD *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  OUTLINED_FUNCTION_15_17(a1, a2, a3, a4, a5, a6, a7);
  v10 = OUTLINED_FUNCTION_162_0();
  v11 = OUTLINED_FUNCTION_45_6(v10);
  v8[13] = v11;
  v8[14] = *(_QWORD *)(v11 - 8);
  v8[15] = OUTLINED_FUNCTION_42();
  v8[16] = *(_QWORD *)(v9 - 8);
  v8[17] = OUTLINED_FUNCTION_42();
  v8[18] = *(_QWORD *)(v7 + 8);
  v12 = OUTLINED_FUNCTION_27_6();
  OUTLINED_FUNCTION_106_3(v12, v13);
  return OUTLINED_FUNCTION_24();
}

uint64_t sub_22DFAD2F0()
{
  uint64_t v0;
  uint64_t v1;
  char v2;
  char v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;

  OUTLINED_FUNCTION_17_10();
  OUTLINED_FUNCTION_34_4();
  OUTLINED_FUNCTION_25_6();
  OUTLINED_FUNCTION_109_1();
  OUTLINED_FUNCTION_108_4();
  OUTLINED_FUNCTION_149();
  OUTLINED_FUNCTION_10_13();
  OUTLINED_FUNCTION_44_3();
  OUTLINED_FUNCTION_162_0();
  OUTLINED_FUNCTION_86_4();
  v2 = OUTLINED_FUNCTION_60_3();
  OUTLINED_FUNCTION_70_3(v2);
  OUTLINED_FUNCTION_149();
  OUTLINED_FUNCTION_58_7();
  OUTLINED_FUNCTION_16_10(v0);
  if (v3)
  {
    OUTLINED_FUNCTION_89_0(*(_QWORD *)(v1 + 112));
    sub_22DF9B2D0();
    v4 = OUTLINED_FUNCTION_17();
    OUTLINED_FUNCTION_2_18(v4, v5);
    OUTLINED_FUNCTION_132_2();
    OUTLINED_FUNCTION_34();
    return OUTLINED_FUNCTION_11_18(*(uint64_t (**)(void))(v1 + 8));
  }
  else
  {
    OUTLINED_FUNCTION_56_3();
    *(_QWORD *)(v1 + 168) = OUTLINED_FUNCTION_37_9();
    v6 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v1 + 176) = v6;
    OUTLINED_FUNCTION_85_3(v6);
    return sub_22DF765E8();
  }
}

uint64_t sub_22DFAD440()
{
  OUTLINED_FUNCTION_55_3();
  swift_release();
  return OUTLINED_FUNCTION_24();
}

void sub_22DFAD488()
{
  uint64_t v0;

  OUTLINED_FUNCTION_32_9();
  OUTLINED_FUNCTION_7_6();
  v0 = swift_task_alloc();
  OUTLINED_FUNCTION_3_24(v0);
}

void sub_22DFAD4B8()
{
  OUTLINED_FUNCTION_4_7();
}

uint64_t sub_22DFAD4C8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v0 = OUTLINED_FUNCTION_9_18((uint64_t)sub_22DFB0C30);
  return OUTLINED_FUNCTION_29_13(v0, v1, v2, v3, v4, v5, v6, v7);
}

uint64_t sub_22DFAD4E0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8;
  _QWORD *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  OUTLINED_FUNCTION_51_6(a1, a2, a3, a4, a5, a6, a7, a8);
  v10 = OUTLINED_FUNCTION_162_0();
  v9[14] = v10;
  v11 = OUTLINED_FUNCTION_163_1();
  v9[15] = v11;
  v9[16] = *(_QWORD *)(v11 - 8);
  v9[17] = OUTLINED_FUNCTION_42();
  v9[18] = *(_QWORD *)(v10 - 8);
  v9[19] = OUTLINED_FUNCTION_42();
  v9[20] = *(_QWORD *)(v8 + 8);
  v9[21] = OUTLINED_FUNCTION_27_6();
  v9[22] = v12;
  return OUTLINED_FUNCTION_24();
}

uint64_t sub_22DFAD578()
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
  char v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD *v14;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;

  OUTLINED_FUNCTION_14_17();
  OUTLINED_FUNCTION_34_4();
  OUTLINED_FUNCTION_25_6();
  OUTLINED_FUNCTION_109_1();
  OUTLINED_FUNCTION_125_1();
  OUTLINED_FUNCTION_103();
  OUTLINED_FUNCTION_10_13();
  OUTLINED_FUNCTION_44_3();
  OUTLINED_FUNCTION_162_0();
  OUTLINED_FUNCTION_86_4();
  OUTLINED_FUNCTION_47_6();
  *(_QWORD *)(v0 + 24) = v17;
  OUTLINED_FUNCTION_84_2();
  OUTLINED_FUNCTION_88_1();
  v1 = OUTLINED_FUNCTION_105_1();
  MEMORY[0x22E323AEC](MEMORY[0x24BEE1730], v1);
  OUTLINED_FUNCTION_89_3();
  v2 = OUTLINED_FUNCTION_66_3();
  OUTLINED_FUNCTION_24_13(v2);
  v3 = OUTLINED_FUNCTION_149();
  OUTLINED_FUNCTION_64_3(v3, v4, v5, v6, v7, v8, v9, v10, v16, v17, v18, v19, v20);
  OUTLINED_FUNCTION_16_10(v1);
  if (v11)
  {
    OUTLINED_FUNCTION_89_0(*(_QWORD *)(v0 + 128));
    sub_22DF9B2D0();
    v12 = OUTLINED_FUNCTION_17();
    OUTLINED_FUNCTION_2_18(v12, v13);
    OUTLINED_FUNCTION_82_5();
    OUTLINED_FUNCTION_34();
    return OUTLINED_FUNCTION_19_8(*(uint64_t (**)(void))(v0 + 8));
  }
  else
  {
    OUTLINED_FUNCTION_53_5();
    *(_QWORD *)(v0 + 184) = OUTLINED_FUNCTION_37_9();
    v14 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 192) = v14;
    OUTLINED_FUNCTION_76_1(v14);
    OUTLINED_FUNCTION_93_2();
    return sub_22DF767B0();
  }
}

uint64_t sub_22DFAD70C()
{
  OUTLINED_FUNCTION_54_5();
  swift_release();
  return OUTLINED_FUNCTION_24();
}

void sub_22DFAD754()
{
  uint64_t v0;

  OUTLINED_FUNCTION_25_13();
  OUTLINED_FUNCTION_4_24();
  v0 = swift_task_alloc();
  OUTLINED_FUNCTION_3_24(v0);
}

void sub_22DFAD784()
{
  OUTLINED_FUNCTION_4_7();
}

uint64_t sub_22DFAD794()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v0 = OUTLINED_FUNCTION_1_23((uint64_t)sub_22DFB0C30);
  return OUTLINED_FUNCTION_40_6(v0, v1, v2, v3, v4, v5, v6);
}

uint64_t sub_22DFAD7AC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v7;
  _QWORD *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  OUTLINED_FUNCTION_15_17(a1, a2, a3, a4, a5, a6, a7);
  v10 = OUTLINED_FUNCTION_162_0();
  v11 = OUTLINED_FUNCTION_45_6(v10);
  v8[13] = v11;
  v8[14] = *(_QWORD *)(v11 - 8);
  v8[15] = OUTLINED_FUNCTION_42();
  v8[16] = *(_QWORD *)(v9 - 8);
  v8[17] = OUTLINED_FUNCTION_42();
  v8[18] = *(_QWORD *)(v7 + 8);
  v12 = OUTLINED_FUNCTION_27_6();
  OUTLINED_FUNCTION_106_3(v12, v13);
  return OUTLINED_FUNCTION_24();
}

uint64_t sub_22DFAD834()
{
  uint64_t v0;
  uint64_t v1;
  char v2;
  char v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;

  OUTLINED_FUNCTION_17_10();
  OUTLINED_FUNCTION_34_4();
  OUTLINED_FUNCTION_25_6();
  OUTLINED_FUNCTION_109_1();
  OUTLINED_FUNCTION_108_4();
  OUTLINED_FUNCTION_149();
  OUTLINED_FUNCTION_10_13();
  OUTLINED_FUNCTION_44_3();
  OUTLINED_FUNCTION_162_0();
  OUTLINED_FUNCTION_86_4();
  v2 = OUTLINED_FUNCTION_60_3();
  OUTLINED_FUNCTION_70_3(v2);
  OUTLINED_FUNCTION_149();
  OUTLINED_FUNCTION_58_7();
  OUTLINED_FUNCTION_16_10(v0);
  if (v3)
  {
    OUTLINED_FUNCTION_89_0(*(_QWORD *)(v1 + 112));
    sub_22DF9B2D0();
    v4 = OUTLINED_FUNCTION_17();
    OUTLINED_FUNCTION_2_18(v4, v5);
    OUTLINED_FUNCTION_132_2();
    OUTLINED_FUNCTION_34();
    return OUTLINED_FUNCTION_11_18(*(uint64_t (**)(void))(v1 + 8));
  }
  else
  {
    OUTLINED_FUNCTION_56_3();
    *(_QWORD *)(v1 + 168) = OUTLINED_FUNCTION_37_9();
    v6 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v1 + 176) = v6;
    OUTLINED_FUNCTION_85_3(v6);
    return sub_22DF76AE4();
  }
}

uint64_t sub_22DFAD984()
{
  OUTLINED_FUNCTION_55_3();
  swift_release();
  return OUTLINED_FUNCTION_24();
}

uint64_t sub_22DFAD9CC()
{
  uint64_t v0;

  OUTLINED_FUNCTION_89_0(*(_QWORD *)(v0 + 128));
  OUTLINED_FUNCTION_132_2();
  OUTLINED_FUNCTION_34();
  return OUTLINED_FUNCTION_53(*(uint64_t (**)(void))(v0 + 8));
}

void sub_22DFADA08()
{
  uint64_t v0;

  OUTLINED_FUNCTION_32_9();
  OUTLINED_FUNCTION_7_6();
  v0 = swift_task_alloc();
  OUTLINED_FUNCTION_3_24(v0);
}

void sub_22DFADA38()
{
  OUTLINED_FUNCTION_4_7();
}

uint64_t sub_22DFADA48()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v0 = OUTLINED_FUNCTION_9_18((uint64_t)sub_22DFB0C30);
  return OUTLINED_FUNCTION_30_10(v0, v1, v2, v3, v4, v5, v6, v7);
}

uint64_t sub_22DFADA60(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8;
  _QWORD *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  OUTLINED_FUNCTION_51_6(a1, a2, a3, a4, a5, a6, a7, a8);
  v10 = OUTLINED_FUNCTION_162_0();
  v9[14] = v10;
  v11 = OUTLINED_FUNCTION_163_1();
  v9[15] = v11;
  v9[16] = *(_QWORD *)(v11 - 8);
  v9[17] = OUTLINED_FUNCTION_42();
  v9[18] = *(_QWORD *)(v10 - 8);
  v9[19] = OUTLINED_FUNCTION_42();
  v9[20] = *(_QWORD *)(v8 + 8);
  v9[21] = OUTLINED_FUNCTION_27_6();
  v9[22] = v12;
  return OUTLINED_FUNCTION_24();
}

uint64_t sub_22DFADAF8()
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
  char v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD *v14;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;

  OUTLINED_FUNCTION_14_17();
  OUTLINED_FUNCTION_34_4();
  OUTLINED_FUNCTION_25_6();
  OUTLINED_FUNCTION_109_1();
  OUTLINED_FUNCTION_125_1();
  OUTLINED_FUNCTION_103();
  OUTLINED_FUNCTION_10_13();
  OUTLINED_FUNCTION_44_3();
  OUTLINED_FUNCTION_162_0();
  OUTLINED_FUNCTION_86_4();
  OUTLINED_FUNCTION_47_6();
  *(_QWORD *)(v0 + 24) = v17;
  OUTLINED_FUNCTION_84_2();
  OUTLINED_FUNCTION_88_1();
  v1 = OUTLINED_FUNCTION_105_1();
  MEMORY[0x22E323AEC](MEMORY[0x24BEE1730], v1);
  OUTLINED_FUNCTION_89_3();
  v2 = OUTLINED_FUNCTION_66_3();
  OUTLINED_FUNCTION_24_13(v2);
  v3 = OUTLINED_FUNCTION_149();
  OUTLINED_FUNCTION_64_3(v3, v4, v5, v6, v7, v8, v9, v10, v16, v17, v18, v19, v20);
  OUTLINED_FUNCTION_16_10(v1);
  if (v11)
  {
    OUTLINED_FUNCTION_89_0(*(_QWORD *)(v0 + 128));
    sub_22DF9B2D0();
    v12 = OUTLINED_FUNCTION_17();
    OUTLINED_FUNCTION_2_18(v12, v13);
    OUTLINED_FUNCTION_82_5();
    OUTLINED_FUNCTION_34();
    return OUTLINED_FUNCTION_19_8(*(uint64_t (**)(void))(v0 + 8));
  }
  else
  {
    OUTLINED_FUNCTION_53_5();
    *(_QWORD *)(v0 + 184) = OUTLINED_FUNCTION_37_9();
    v14 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 192) = v14;
    OUTLINED_FUNCTION_76_1(v14);
    OUTLINED_FUNCTION_93_2();
    return sub_22DF771BC();
  }
}

uint64_t sub_22DFADC8C()
{
  OUTLINED_FUNCTION_54_5();
  swift_release();
  return OUTLINED_FUNCTION_24();
}

uint64_t sub_22DFADCD4()
{
  uint64_t v0;
  uint64_t (*v1)(void);

  OUTLINED_FUNCTION_121_0(*(_QWORD *)(v0 + 144));
  OUTLINED_FUNCTION_28();
  OUTLINED_FUNCTION_34();
  v1 = (uint64_t (*)(void))OUTLINED_FUNCTION_152();
  return OUTLINED_FUNCTION_53(v1);
}

uint64_t sub_22DFADD10()
{
  uint64_t v0;

  OUTLINED_FUNCTION_89_0(*(_QWORD *)(v0 + 144));
  OUTLINED_FUNCTION_82_5();
  OUTLINED_FUNCTION_34();
  return OUTLINED_FUNCTION_53(*(uint64_t (**)(void))(v0 + 8));
}

void sub_22DFADD4C()
{
  uint64_t v0;

  OUTLINED_FUNCTION_100_2();
  v0 = swift_task_alloc();
  OUTLINED_FUNCTION_3_24(v0);
}

void sub_22DFADD84()
{
  OUTLINED_FUNCTION_4_7();
}

uint64_t sub_22DFADD94()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v0 = OUTLINED_FUNCTION_72_3((uint64_t)sub_22DFB0C40);
  return OUTLINED_FUNCTION_39_8(v0, v1, v2, v3, v4, v5);
}

uint64_t sub_22DFADDAC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v6;
  _QWORD *v7;
  uint64_t v8;
  uint64_t v9;

  v7[11] = a6;
  v7[12] = v6;
  v7[9] = a4;
  v7[10] = a5;
  v7[7] = a2;
  v7[8] = a3;
  v7[6] = a1;
  v8 = *(_QWORD *)(a5 + 8);
  v7[13] = v8;
  v7[14] = *(_QWORD *)(v8 + 8);
  v7[15] = sub_22DFDD730();
  v7[16] = v9;
  return OUTLINED_FUNCTION_2_2();
}

uint64_t sub_22DFADE08()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  Swift::Bool v4;
  Swift::String v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  __int128 v13;

  v1 = *(_QWORD *)(v0 + 64);
  v10 = *(_QWORD *)(v0 + 72);
  v2 = *(_QWORD *)(v0 + 56);
  v11 = *(_QWORD *)(v0 + 48);
  v12 = *(_QWORD *)(v0 + 96);
  *(_QWORD *)(v0 + 16) = v12;
  v13 = *(_OWORD *)(v0 + 80);
  sub_22DFDDCA0();
  OUTLINED_FUNCTION_27_3();
  OUTLINED_FUNCTION_34_4();
  sub_22DFDD568();
  sub_22DFDDF28();
  sub_22DFDD568();
  swift_getAssociatedTypeWitness();
  swift_getAssociatedConformanceWitness();
  OUTLINED_FUNCTION_110_1();
  *(_QWORD *)(v0 + 24) = sub_22DFDD940();
  sub_22DFDDF10();
  sub_22DFDD568();
  swift_bridgeObjectRelease();
  sub_22DFDD568();
  *(_QWORD *)(v0 + 32) = v2;
  OUTLINED_FUNCTION_110_1();
  v3 = sub_22DFDD9AC();
  MEMORY[0x22E323AEC](MEMORY[0x24BEE1730], v3);
  sub_22DFDDF34();
  v4 = sub_22DF39308() & 1;
  v5._countAndFlagsBits = 0;
  v5._object = (void *)0xE000000000000000;
  Logging.ulog(_:extended:)(v5, v4);
  swift_bridgeObjectRelease();
  v6 = (*(uint64_t (**)(uint64_t, _QWORD))(v13 + 24))(v1, v13);
  *(_QWORD *)(v0 + 136) = v6;
  v7 = swift_task_alloc();
  *(_QWORD *)(v0 + 144) = v7;
  *(_QWORD *)(v7 + 16) = v1;
  *(_QWORD *)(v7 + 24) = v10;
  *(_OWORD *)(v7 + 32) = v13;
  *(_QWORD *)(v7 + 48) = v2;
  *(_QWORD *)(v7 + 56) = v12;
  *(_QWORD *)(v7 + 64) = v6;
  *(_QWORD *)(v7 + 72) = v11;
  __swift_instantiateConcreteTypeFromMangledName(&qword_255DDB300);
  v8 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 152) = v8;
  *v8 = v0;
  v8[1] = sub_22DFAE0C0;
  OUTLINED_FUNCTION_93_2();
  return sub_22DFDDE08();
}

uint64_t sub_22DFAE0C0()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;
  _QWORD *v3;

  OUTLINED_FUNCTION_209();
  *v3 = *v2;
  *(_QWORD *)(v0 + 160) = v1;
  swift_task_dealloc();
  if (!v1)
  {

    OUTLINED_FUNCTION_28();
  }
  return OUTLINED_FUNCTION_24();
}

uint64_t sub_22DFAE124()
{
  uint64_t v0;

  OUTLINED_FUNCTION_28();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

void sub_22DFAE15C()
{
  uint64_t v0;

  OUTLINED_FUNCTION_25_13();
  OUTLINED_FUNCTION_4_24();
  v0 = swift_task_alloc();
  OUTLINED_FUNCTION_2_24(v0);
}

void sub_22DFAE18C()
{
  OUTLINED_FUNCTION_4_7();
}

uint64_t sub_22DFAE19C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v0 = OUTLINED_FUNCTION_1_23((uint64_t)sub_22DFAE1B4);
  return OUTLINED_FUNCTION_43_4(v0, v1, v2, v3, v4, v5, v6);
}

uint64_t sub_22DFAE1B4()
{
  uint64_t v0;

  OUTLINED_FUNCTION_20();
  return OUTLINED_FUNCTION_72(*(uint64_t (**)(void))(v0 + 8));
}

void sub_22DFAE1E8()
{
  uint64_t v0;

  OUTLINED_FUNCTION_25_13();
  OUTLINED_FUNCTION_4_24();
  v0 = swift_task_alloc();
  OUTLINED_FUNCTION_2_24(v0);
}

void sub_22DFAE218()
{
  OUTLINED_FUNCTION_4_7();
}

uint64_t sub_22DFAE228()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v0 = OUTLINED_FUNCTION_1_23((uint64_t)sub_22DFB0C30);
  return OUTLINED_FUNCTION_41_4(v0, v1, v2, v3, v4, v5, v6);
}

void sub_22DFAE240()
{
  uint64_t v0;

  OUTLINED_FUNCTION_25_13();
  OUTLINED_FUNCTION_4_24();
  v0 = swift_task_alloc();
  OUTLINED_FUNCTION_2_24(v0);
}

void sub_22DFAE270()
{
  OUTLINED_FUNCTION_4_7();
}

uint64_t sub_22DFAE280()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v0 = OUTLINED_FUNCTION_1_23((uint64_t)sub_22DFB0C30);
  return OUTLINED_FUNCTION_42_3(v0, v1, v2, v3, v4, v5, v6);
}

void sub_22DFAE298()
{
  uint64_t v0;

  OUTLINED_FUNCTION_32_9();
  OUTLINED_FUNCTION_7_6();
  v0 = swift_task_alloc();
  OUTLINED_FUNCTION_2_24(v0);
}

void sub_22DFAE2C8()
{
  OUTLINED_FUNCTION_4_7();
}

uint64_t sub_22DFAE2D8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v0 = OUTLINED_FUNCTION_9_18((uint64_t)sub_22DFB0C30);
  return OUTLINED_FUNCTION_29_13(v0, v1, v2, v3, v4, v5, v6, v7);
}

void sub_22DFAE2F0()
{
  uint64_t v0;

  OUTLINED_FUNCTION_25_13();
  OUTLINED_FUNCTION_4_24();
  v0 = swift_task_alloc();
  OUTLINED_FUNCTION_2_24(v0);
}

void sub_22DFAE320()
{
  OUTLINED_FUNCTION_4_7();
}

uint64_t sub_22DFAE330()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v0 = OUTLINED_FUNCTION_1_23((uint64_t)sub_22DFB0C30);
  return OUTLINED_FUNCTION_40_6(v0, v1, v2, v3, v4, v5, v6);
}

void sub_22DFAE348()
{
  uint64_t v0;

  OUTLINED_FUNCTION_32_9();
  OUTLINED_FUNCTION_7_6();
  v0 = swift_task_alloc();
  OUTLINED_FUNCTION_2_24(v0);
}

void sub_22DFAE378()
{
  OUTLINED_FUNCTION_4_7();
}

uint64_t sub_22DFAE388()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v0 = OUTLINED_FUNCTION_9_18((uint64_t)sub_22DFB0C30);
  return OUTLINED_FUNCTION_30_10(v0, v1, v2, v3, v4, v5, v6, v7);
}

void sub_22DFAE3A0()
{
  uint64_t v0;

  OUTLINED_FUNCTION_100_2();
  v0 = swift_task_alloc();
  OUTLINED_FUNCTION_2_24(v0);
}

void sub_22DFAE3D8()
{
  OUTLINED_FUNCTION_4_7();
}

uint64_t sub_22DFAE3E8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v0 = OUTLINED_FUNCTION_72_3((uint64_t)sub_22DFAE400);
  return OUTLINED_FUNCTION_39_8(v0, v1, v2, v3, v4, v5);
}

uint64_t sub_22DFAE400(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;

  v4 = OUTLINED_FUNCTION_20();
  if (!v1)
    v4 = a1;
  return (*(uint64_t (**)(uint64_t))(v2 + 8))(v4);
}

void sub_22DFAE448(void *a1, void *a2, void *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  uint64_t v15;
  uint64_t v16;
  char *v17;
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
  char *v28;
  unint64_t v29;
  unint64_t v30;
  unint64_t v31;
  unint64_t v32;
  char *v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  char *v37;
  uint64_t v38;
  id v39;
  id v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  uint64_t v45;
  uint64_t v46;
  char *v47;
  char *v48;
  uint64_t v49;
  uint64_t v50;
  char *v51;
  uint64_t v52;
  uint64_t v53;
  void *v54;
  uint64_t v55;
  id v56;

  v55 = a7;
  v56 = a3;
  v53 = a10;
  v54 = a2;
  v52 = a9;
  v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_255DD71C0);
  MEMORY[0x24BDAC7A8](v15);
  v17 = (char *)&v46 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18 = sub_22DFDCEFC();
  v19 = *(_QWORD *)(v18 - 8);
  v20 = *(_QWORD *)(v19 + 64);
  v21 = MEMORY[0x24BDAC7A8](v18);
  v51 = (char *)&v46 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v21);
  v23 = (char *)&v46 - v22;
  type metadata accessor for CoordinationRequest();
  v24 = swift_dynamicCastClass();
  if (v24)
  {
    v50 = v24;
    v25 = swift_allocObject();
    v49 = a8;
    v26 = v25;
    *(_QWORD *)(v25 + 16) = v56;
    *(_QWORD *)(v25 + 24) = a4;
    v56 = a1;
    swift_retain();
    v47 = v23;
    sub_22DFAC474((uint64_t)sub_22DFB0C50, v26, (uint64_t)v23);
    swift_release();
    v27 = sub_22DFDD778();
    v48 = v17;
    __swift_storeEnumTagSinglePayload((uint64_t)v17, 1, 1, v27);
    v46 = swift_allocObject();
    swift_beginAccess();
    MEMORY[0x22E323C78](a6 + 16);
    swift_unknownObjectWeakInit();
    swift_unknownObjectRelease();
    v28 = v51;
    (*(void (**)(char *, char *, uint64_t))(v19 + 16))(v51, v23, v18);
    v29 = (*(unsigned __int8 *)(v19 + 80) + 56) & ~(unint64_t)*(unsigned __int8 *)(v19 + 80);
    v30 = (v20 + v29 + 7) & 0xFFFFFFFFFFFFFFF8;
    v31 = (v30 + 15) & 0xFFFFFFFFFFFFFFF8;
    v32 = (v31 + 15) & 0xFFFFFFFFFFFFFFF8;
    v33 = (char *)swift_allocObject();
    *((_QWORD *)v33 + 2) = 0;
    *((_QWORD *)v33 + 3) = 0;
    v34 = v53;
    *((_QWORD *)v33 + 4) = v52;
    *((_QWORD *)v33 + 5) = v34;
    *((_QWORD *)v33 + 6) = a5;
    (*(void (**)(char *, char *, uint64_t))(v19 + 32))(&v33[v29], v28, v18);
    *(_QWORD *)&v33[v30] = v46;
    v36 = v54;
    v35 = v55;
    *(_QWORD *)&v33[v31] = v54;
    v37 = &v33[v32];
    v38 = v49;
    *(_QWORD *)v37 = v35;
    *((_QWORD *)v37 + 1) = v38;
    *(_QWORD *)&v33[(v32 + 23) & 0xFFFFFFFFFFFFFFF8] = v50;
    v39 = v56;
    swift_retain();
    v40 = v36;
    swift_retain();
    sub_22DF2A44C();

    swift_release();
    (*(void (**)(char *, uint64_t))(v19 + 8))(v47, v18);
  }
  else
  {
    swift_getObjectType();
    v41 = sub_22DFDE09C();
    v43 = v42;
    sub_22DF9B2D0();
    v44 = (void *)swift_allocError();
    *(_QWORD *)v45 = v41;
    *(_QWORD *)(v45 + 8) = v43;
    *(_QWORD *)(v45 + 16) = 0xD000000000000013;
    *(_QWORD *)(v45 + 24) = 0x800000022DFF2490;
    *(_BYTE *)(v45 + 32) = 0;
    ((void (*)(_QWORD, void *))v56)(0, v44);

  }
}

uint64_t sub_22DFAE7C0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  _QWORD *v8;
  uint64_t AssociatedTypeWitness;
  uint64_t v10;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  v8[20] = v14;
  v8[21] = v15;
  v8[18] = v12;
  v8[19] = v13;
  v8[16] = a7;
  v8[17] = a8;
  v8[14] = a5;
  v8[15] = a6;
  v8[13] = a4;
  v8[22] = *(_QWORD *)(v15 + 16);
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v8[23] = AssociatedTypeWitness;
  v10 = sub_22DFDDB2C();
  v8[24] = v10;
  v8[25] = *(_QWORD *)(v10 - 8);
  v8[26] = swift_task_alloc();
  v8[27] = *(_QWORD *)(AssociatedTypeWitness - 8);
  v8[28] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_22DFAE884()
{
  void *v0;
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
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;

  v2 = *(_QWORD *)(v1 + 104);
  v3 = sub_22DFAC500();
  *(_QWORD *)(v1 + 232) = v3;
  *(_QWORD *)(v1 + 240) = v4;
  if (v3)
  {
    OUTLINED_FUNCTION_6_4();
    v5 = MEMORY[0x22E323C78](v2);
    *(_QWORD *)(v1 + 248) = v5;
    if (v5)
    {
      v8 = *(_QWORD *)(v1 + 168);
      *(_QWORD *)(v1 + 256) = objc_msgSend(*(id *)(v1 + 128), sel_member);
      *(_QWORD *)(v1 + 264) = *(_QWORD *)(v8 + 64);
      OUTLINED_FUNCTION_27_6();
      return OUTLINED_FUNCTION_61_3();
    }
    OUTLINED_FUNCTION_299(*(_QWORD *)(v1 + 208), v6, v7, *(_QWORD *)(v1 + 184));
    OUTLINED_FUNCTION_89_0(*(_QWORD *)(v1 + 200));
    sub_22DF9B2D0();
    v10 = OUTLINED_FUNCTION_17();
    OUTLINED_FUNCTION_49_3(v10, v11, v12, v13, v14, v15, v16, v17, v18, v19, v20);

    OUTLINED_FUNCTION_68_1();
  }
  OUTLINED_FUNCTION_71_1();
  OUTLINED_FUNCTION_28();
  return OUTLINED_FUNCTION_159(*(uint64_t (**)(void))(v1 + 8));
}

uint64_t sub_22DFAE974()
{
  uint64_t v0;
  void *v1;

  v1 = *(void **)(v0 + 256);
  OUTLINED_FUNCTION_126_1();

  OUTLINED_FUNCTION_239_0();
  OUTLINED_FUNCTION_15();
  return OUTLINED_FUNCTION_24();
}

uint64_t sub_22DFAE9B8()
{
  uint64_t v0;
  uint64_t v1;
  char v2;
  uint64_t v3;
  uint64_t v4;
  int *v5;
  _QWORD *v6;
  int *v8;

  v1 = *(_QWORD *)(v0 + 208);
  OUTLINED_FUNCTION_16_10(v1);
  if (v2)
  {
    (*(void (**)(uint64_t, _QWORD))(*(_QWORD *)(v0 + 200) + 8))(v1, *(_QWORD *)(v0 + 192));
    sub_22DF9B2D0();
    v3 = OUTLINED_FUNCTION_17();
    OUTLINED_FUNCTION_92_1(v3, v4);
    OUTLINED_FUNCTION_109_4();
    OUTLINED_FUNCTION_97_1();
    OUTLINED_FUNCTION_83_4();
    OUTLINED_FUNCTION_71_1();
    OUTLINED_FUNCTION_28();
    return OUTLINED_FUNCTION_30_9(*(uint64_t (**)(void))(v0 + 8));
  }
  else
  {
    v5 = *(int **)(v0 + 136);
    OUTLINED_FUNCTION_257(*(_QWORD *)(v0 + 224), v1, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v0 + 216) + 32));
    sub_22DF551A0(v0 + 16);
    v8 = (int *)((char *)v5 + *v5);
    v6 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 272) = v6;
    *v6 = v0;
    v6[1] = sub_22DFAEABC;
    return ((uint64_t (*)(uint64_t, _QWORD))v8)(v0 + 16, *(_QWORD *)(v0 + 224));
  }
}

uint64_t sub_22DFAEABC(uint64_t a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v4;

  v4 = *v2;
  *(_QWORD *)(*v2 + 280) = v1;
  swift_task_dealloc();
  if (!v1)
    *(_QWORD *)(v4 + 288) = a1;
  __swift_destroy_boxed_opaque_existential_0Tm(v4 + 16);
  OUTLINED_FUNCTION_15();
  return OUTLINED_FUNCTION_24();
}

uint64_t sub_22DFAEB3C()
{
  uint64_t v0;
  void (*v1)(id *, uint64_t *);
  id v2;
  id v4;
  uint64_t v5;

  v1 = *(void (**)(id *, uint64_t *))(v0 + 232);
  v4 = *(id *)(v0 + 288);
  v5 = 0;
  v2 = v4;
  v1(&v4, &v5);

  OUTLINED_FUNCTION_68_1();
  OUTLINED_FUNCTION_89_0(*(_QWORD *)(v0 + 216));
  OUTLINED_FUNCTION_71_1();
  OUTLINED_FUNCTION_28();
  return OUTLINED_FUNCTION_159(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_22DFAEBA4()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  id v4;

  v1 = *(void **)(v0 + 280);
  v2 = *(_QWORD *)(v0 + 176);
  v3 = *(_QWORD *)(v0 + 160);
  sub_22DFDDCA0();
  *(_QWORD *)(v0 + 80) = 0;
  *(_QWORD *)(v0 + 88) = 0xE000000000000000;
  OUTLINED_FUNCTION_27_3();
  OUTLINED_FUNCTION_34_4();
  *(_QWORD *)(v0 + 96) = v1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_255DD71A0);
  sub_22DFDDD3C();
  static Logging.ulog(_:extended:)(*(_QWORD *)(v0 + 80), *(_QWORD *)(v0 + 88), 0, v3, *(_QWORD *)(*(_QWORD *)(v2 + 16) + 8));
  swift_bridgeObjectRelease();
  v4 = v1;
  OUTLINED_FUNCTION_109_4();
  OUTLINED_FUNCTION_97_1();
  OUTLINED_FUNCTION_97_1();
  OUTLINED_FUNCTION_83_4();
  OUTLINED_FUNCTION_89_0(*(_QWORD *)(v0 + 216));
  OUTLINED_FUNCTION_71_1();
  OUTLINED_FUNCTION_28();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

void sub_22DFAECC8(void *a1, void *a2, void (*a3)(_QWORD, void *), uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  char *v25;
  uint64_t v26;
  uint64_t v27;
  char *v28;
  unint64_t v29;
  unint64_t v30;
  unint64_t v31;
  uint64_t v32;
  uint64_t v33;
  char *v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  id v38;
  id v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  uint64_t v44;
  char *v45;
  char *v46;
  id v47;
  void *v48;
  uint64_t v49;
  char *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;

  v51 = a7;
  v52 = a8;
  v53 = a5;
  v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_255DD71C0);
  MEMORY[0x24BDAC7A8](v13);
  v15 = (char *)&v45 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = sub_22DFDCEFC();
  v17 = *(_QWORD *)(v16 - 8);
  v18 = *(_QWORD *)(v17 + 64);
  v19 = MEMORY[0x24BDAC7A8](v16);
  v50 = (char *)&v45 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v19);
  v21 = (char *)&v45 - v20;
  type metadata accessor for CoordinationObservationUpdate();
  v22 = swift_dynamicCastClass();
  if (v22)
  {
    v49 = v22;
    v23 = swift_allocObject();
    v48 = a2;
    v24 = v23;
    *(_QWORD *)(v23 + 16) = a3;
    *(_QWORD *)(v23 + 24) = a4;
    v47 = a1;
    swift_retain();
    v25 = v21;
    v46 = v21;
    sub_22DFAC474((uint64_t)sub_22DFB09E8, v24, (uint64_t)v21);
    swift_release();
    v26 = sub_22DFDD778();
    __swift_storeEnumTagSinglePayload((uint64_t)v15, 1, 1, v26);
    v27 = swift_allocObject();
    swift_beginAccess();
    MEMORY[0x22E323C78](a6 + 16);
    swift_unknownObjectWeakInit();
    swift_unknownObjectRelease();
    v28 = v50;
    (*(void (**)(char *, char *, uint64_t))(v17 + 16))(v50, v25, v16);
    v29 = (*(unsigned __int8 *)(v17 + 80) + 56) & ~(unint64_t)*(unsigned __int8 *)(v17 + 80);
    v30 = (v18 + v29 + 7) & 0xFFFFFFFFFFFFFFF8;
    v31 = (v30 + 15) & 0xFFFFFFFFFFFFFFF8;
    v45 = v15;
    v32 = v16;
    v33 = v53;
    v34 = (char *)swift_allocObject();
    *((_QWORD *)v34 + 2) = 0;
    *((_QWORD *)v34 + 3) = 0;
    v35 = v52;
    *((_QWORD *)v34 + 4) = v51;
    *((_QWORD *)v34 + 5) = v35;
    *((_QWORD *)v34 + 6) = v33;
    (*(void (**)(char *, char *, uint64_t))(v17 + 32))(&v34[v29], v28, v32);
    *(_QWORD *)&v34[v30] = v27;
    v37 = v48;
    v36 = v49;
    *(_QWORD *)&v34[v31] = v48;
    *(_QWORD *)&v34[(v31 + 15) & 0xFFFFFFFFFFFFFFF8] = v36;
    v38 = v47;
    swift_retain();
    v39 = v37;
    sub_22DF2A44C();

    swift_release();
    (*(void (**)(char *, uint64_t))(v17 + 8))(v46, v32);
  }
  else
  {
    swift_getObjectType();
    v40 = sub_22DFDE09C();
    v42 = v41;
    sub_22DF9B2D0();
    v43 = (void *)swift_allocError();
    *(_QWORD *)v44 = v40;
    *(_QWORD *)(v44 + 8) = v42;
    *(_QWORD *)(v44 + 16) = 0xD00000000000001DLL;
    *(_QWORD *)(v44 + 24) = 0x800000022DFF2470;
    *(_BYTE *)(v44 + 32) = 0;
    a3(0, v43);

  }
}

uint64_t sub_22DFAF010(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  _QWORD *v8;
  uint64_t AssociatedTypeWitness;
  uint64_t v10;
  uint64_t v12;
  uint64_t v13;

  v8[20] = v12;
  v8[21] = v13;
  v8[18] = a7;
  v8[19] = a8;
  v8[16] = a5;
  v8[17] = a6;
  v8[15] = a4;
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v8[22] = AssociatedTypeWitness;
  v10 = sub_22DFDDB2C();
  v8[23] = v10;
  v8[24] = *(_QWORD *)(v10 - 8);
  v8[25] = swift_task_alloc();
  v8[26] = *(_QWORD *)(AssociatedTypeWitness - 8);
  v8[27] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_22DFAF0C8()
{
  void *v0;
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
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;

  v2 = *(_QWORD *)(v1 + 120);
  v3 = sub_22DFAC500();
  *(_QWORD *)(v1 + 224) = v3;
  *(_QWORD *)(v1 + 232) = v4;
  if (v3)
  {
    OUTLINED_FUNCTION_6_4();
    v5 = MEMORY[0x22E323C78](v2);
    *(_QWORD *)(v1 + 240) = v5;
    if (v5)
    {
      v8 = *(_QWORD *)(v1 + 168);
      *(_QWORD *)(v1 + 248) = objc_msgSend(*(id *)(v1 + 144), sel_member);
      *(_QWORD *)(v1 + 256) = *(_QWORD *)(v8 + 64);
      *(_QWORD *)(v1 + 264) = *(_QWORD *)(*(_QWORD *)(v8 + 8) + 8);
      sub_22DFDD730();
      return OUTLINED_FUNCTION_61_3();
    }
    OUTLINED_FUNCTION_299(*(_QWORD *)(v1 + 200), v6, v7, *(_QWORD *)(v1 + 176));
    OUTLINED_FUNCTION_89_0(*(_QWORD *)(v1 + 192));
    sub_22DF9B2D0();
    v10 = OUTLINED_FUNCTION_17();
    OUTLINED_FUNCTION_49_3(v10, v11, v12, v13, v14, v15, v16, v17, v18, v19, v20);

    OUTLINED_FUNCTION_68_1();
  }
  OUTLINED_FUNCTION_65_4();
  OUTLINED_FUNCTION_28();
  return OUTLINED_FUNCTION_159(*(uint64_t (**)(void))(v1 + 8));
}

uint64_t sub_22DFAF1C4()
{
  uint64_t v0;
  void *v1;

  v1 = *(void **)(v0 + 248);
  OUTLINED_FUNCTION_126_1();

  OUTLINED_FUNCTION_239_0();
  OUTLINED_FUNCTION_15();
  return OUTLINED_FUNCTION_24();
}

uint64_t sub_22DFAF208()
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
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void (*v16)(uint64_t *);
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t *v28;

  v1 = *(_QWORD *)(v0 + 200);
  OUTLINED_FUNCTION_16_10(v1);
  if (v2)
  {
    OUTLINED_FUNCTION_121_0(*(_QWORD *)(v0 + 192));
    sub_22DF9B2D0();
    v3 = OUTLINED_FUNCTION_17();
    OUTLINED_FUNCTION_92_1(v3, v4);
    OUTLINED_FUNCTION_115_3(v5, v6, v7, v8, v9, v10, v11, v12, 0);
    OUTLINED_FUNCTION_109_4();
    OUTLINED_FUNCTION_97_1();
    OUTLINED_FUNCTION_83_4();
  }
  else
  {
    v13 = *(_QWORD *)(v0 + 136) + 16;
    OUTLINED_FUNCTION_257(*(_QWORD *)(v0 + 216), v1, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v0 + 208) + 32));
    swift_beginAccess();
    v14 = MEMORY[0x22E323C78](v13);
    *(_QWORD *)(v0 + 272) = v14;
    if (v14)
    {
      *(_QWORD *)(v0 + 280) = *(_QWORD *)(*(_QWORD *)(v0 + 168) + 32);
      sub_22DFDD730();
      return swift_task_switch();
    }
    v16 = *(void (**)(uint64_t *))(v0 + 224);
    v18 = *(_QWORD *)(v0 + 208);
    v17 = *(_QWORD *)(v0 + 216);
    v19 = *(_QWORD *)(v0 + 176);
    sub_22DF9B2D0();
    v20 = (void *)OUTLINED_FUNCTION_17();
    *(_QWORD *)v21 = 3;
    *(_QWORD *)(v21 + 8) = 0;
    *(_QWORD *)(v21 + 16) = 0;
    *(_QWORD *)(v21 + 24) = 0;
    *(_BYTE *)(v21 + 32) = 2;
    v28 = OUTLINED_FUNCTION_115_3((uint64_t)v20, v21, v22, v23, v24, v25, v26, v27, 0);
    v16(v28);

    OUTLINED_FUNCTION_68_1();
    (*(void (**)(uint64_t, uint64_t))(v18 + 8))(v17, v19);
  }
  OUTLINED_FUNCTION_65_4();
  OUTLINED_FUNCTION_28();
  return OUTLINED_FUNCTION_30_9(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_22DFAF388()
{
  uint64_t v0;

  *(_QWORD *)(v0 + 288) = (*(uint64_t (**)(_QWORD, _QWORD))(v0 + 280))(*(_QWORD *)(v0 + 160), *(_QWORD *)(v0 + 168));
  OUTLINED_FUNCTION_239_0();
  OUTLINED_FUNCTION_15();
  return OUTLINED_FUNCTION_2_2();
}

void sub_22DFAF3C4()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;
  _QWORD *v4;

  sub_22DFD4BA4((uint64_t)(v0 + 2));
  v2 = v0[5];
  v1 = v0[6];
  v3 = __swift_project_boxed_opaque_existential_1(v0 + 2, v2);
  v4 = (_QWORD *)swift_task_alloc();
  v0[37] = v4;
  *v4 = v0;
  v4[1] = sub_22DFAF448;
  sub_22DF73450((uint64_t)v4, (uint64_t)v3, v0[27], v2, v1);
}

uint64_t sub_22DFAF448()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 304) = v0;
  swift_task_dealloc();
  OUTLINED_FUNCTION_15();
  return OUTLINED_FUNCTION_2_2();
}

uint64_t sub_22DFAF4A0()
{
  uint64_t v0;
  void (*v1)(uint64_t *);
  objc_class *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t *v11;

  v1 = *(void (**)(uint64_t *))(v0 + 224);
  __swift_destroy_boxed_opaque_existential_0Tm(v0 + 16);
  v2 = (objc_class *)__swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_255DDBD50);
  *(_QWORD *)(v0 + 104) = objc_allocWithZone(v2);
  *(_QWORD *)(v0 + 112) = v2;
  v3 = objc_msgSendSuper2((objc_super *)(v0 + 104), sel_init);
  v11 = OUTLINED_FUNCTION_115_3((uint64_t)v3, v4, v5, v6, v7, v8, v9, v10, (uint64_t)v3);
  v1(v11);

  swift_release();
  sub_22DF34068((uint64_t)v1);
  OUTLINED_FUNCTION_89_0(*(_QWORD *)(v0 + 208));
  OUTLINED_FUNCTION_65_4();
  OUTLINED_FUNCTION_28();
  return OUTLINED_FUNCTION_159(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_22DFAF54C()
{
  uint64_t v0;
  void *v1;
  void (*v2)(uint64_t *);
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t *v11;

  v1 = *(void **)(v0 + 304);
  v2 = *(void (**)(uint64_t *))(v0 + 224);
  __swift_destroy_boxed_opaque_existential_0Tm(v0 + 16);
  v3 = v1;
  v11 = OUTLINED_FUNCTION_115_3((uint64_t)v3, v4, v5, v6, v7, v8, v9, v10, 0);
  v2(v11);
  swift_release();

  sub_22DF34068((uint64_t)v2);
  OUTLINED_FUNCTION_89_0(*(_QWORD *)(v0 + 208));
  OUTLINED_FUNCTION_65_4();
  OUTLINED_FUNCTION_28();
  return OUTLINED_FUNCTION_159(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_22DFAF5E0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  _QWORD *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v14;
  uint64_t v15;

  v8[19] = v14;
  v8[20] = v15;
  v8[17] = a7;
  v8[18] = a8;
  v8[15] = a5;
  v8[16] = a6;
  v8[13] = a3;
  v8[14] = a4;
  v8[11] = a1;
  v8[12] = a2;
  v9 = *(_QWORD *)(a8 - 8);
  v8[21] = v9;
  v8[22] = *(_QWORD *)(v9 + 64);
  v8[23] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_255DD71C0);
  v8[24] = swift_task_alloc();
  v8[25] = swift_task_alloc();
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_255DDB308);
  v8[26] = v10;
  v8[27] = *(_QWORD *)(v10 - 8);
  v8[28] = swift_task_alloc();
  v11 = *(_QWORD *)(v14 + 8);
  v8[29] = v11;
  v8[30] = *(_QWORD *)(v11 + 8);
  v8[31] = sub_22DFDD730();
  v8[32] = v12;
  return swift_task_switch();
}

uint64_t sub_22DFAF6E0()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t (*v5)(uint64_t);
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  uint64_t result;
  uint64_t v20;
  uint64_t v21;
  id v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  id v28;
  uint64_t v29;
  unint64_t v30;
  uint64_t v31;
  id v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  _QWORD *v38;
  uint64_t v39;
  _QWORD *v40;
  _QWORD *v41;
  _QWORD *v42;
  uint64_t v43;
  unint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  unint64_t v48;
  id v49;
  void *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  __int128 v54;
  unint64_t v55;

  v0[9] = v0[13];
  v2 = v0[19];
  v1 = v0[20];
  v4 = v0[17];
  v3 = v0[18];
  v5 = sub_22DFAFF0C(v0[14], v4, v3, v2, v1);
  v7 = v6;
  v8 = (_QWORD *)swift_task_alloc();
  v8[2] = v4;
  v8[3] = v3;
  v8[4] = v2;
  v8[5] = v1;
  v8[6] = v5;
  v8[7] = v7;
  v9 = *(_QWORD *)(v2 + 16);
  swift_getAssociatedTypeWitness();
  swift_getAssociatedConformanceWitness();
  v10 = sub_22DFDD9AC();
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_255DDBD38);
  v12 = MEMORY[0x22E323AEC](MEMORY[0x24BEE1728], v10);
  v14 = sub_22DFAA584((void (*)(char *, char *))sub_22DFB0750, (uint64_t)v8, v10, v11, MEMORY[0x24BEE4078], v12, MEMORY[0x24BEE40A8], v13);
  swift_release();
  OUTLINED_FUNCTION_40();
  v15 = MEMORY[0x24BEE4AF8];
  v55 = MEMORY[0x24BEE4AF8];
  v16 = *(_QWORD *)(v14 + 16);
  if (v16)
  {
    sub_22DFDD448();
    for (i = 0; i != v16; ++i)
    {
      v18 = *(void **)(v14 + 8 * i + 32);
      if (v18 && objc_msgSend(v18, sel_member))
      {
        MEMORY[0x22E322970]();
        if (*(_QWORD *)((v55 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v55 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
          sub_22DFDD688();
        sub_22DFDD6B8();
        sub_22DFDD670();
      }
    }
    OUTLINED_FUNCTION_149();
    v15 = v55;
  }
  result = OUTLINED_FUNCTION_149();
  if (!(v15 >> 62))
  {
    v20 = *(_QWORD *)((v15 & 0xFFFFFFFFFFFFF8) + 0x10);
    if (v20)
      goto LABEL_12;
LABEL_26:
    swift_bridgeObjectRelease();
    __swift_instantiateConcreteTypeFromMangledName(&qword_255DD71A0);
    sub_22DFDD82C();
    v40 = (_QWORD *)swift_task_alloc();
    v0[33] = v40;
    *v40 = v0;
    v40[1] = sub_22DFAFCB8;
    return sub_22DFDD838();
  }
  sub_22DFDD448();
  v20 = sub_22DFDDDB4();
  result = swift_bridgeObjectRelease();
  if (!v20)
    goto LABEL_26;
LABEL_12:
  if (v20 >= 1)
  {
    v21 = 0;
    v41 = v0 + 2;
    v42 = v0;
    v46 = *(_QWORD *)(*(_QWORD *)(v9 + 16) + 8);
    v44 = v15 & 0xC000000000000001;
    v45 = v0[21];
    v43 = v0[22] + 7;
    v47 = v20;
    v48 = v15;
    do
    {
      v53 = v21;
      if (v44)
        v22 = (id)MEMORY[0x22E322FF4](v21, v15);
      else
        v22 = *(id *)(v15 + 8 * v21 + 32);
      v23 = v22;
      v24 = v0[25];
      v25 = v0[23];
      v51 = v0[20];
      v52 = v0[24];
      v26 = v0[16];
      v27 = v0[17];
      v49 = v22;
      v50 = (void *)v0[15];
      v54 = *((_OWORD *)v0 + 9);
      sub_22DFDDCA0();
      sub_22DFDD568();
      v28 = objc_msgSend(v23, sel_description);
      sub_22DFDD514();

      sub_22DFDD568();
      swift_bridgeObjectRelease();
      static Logging.ulog(_:extended:)(0, 0xE000000000000000, 0, v27, v46);
      swift_bridgeObjectRelease();
      v29 = sub_22DFDD778();
      __swift_storeEnumTagSinglePayload(v24, 1, 1, v29);
      (*(void (**)(uint64_t, uint64_t, _QWORD))(v45 + 16))(v25, v26, v54);
      v30 = (*(unsigned __int8 *)(v45 + 80) + 72) & ~(unint64_t)*(unsigned __int8 *)(v45 + 80);
      v31 = swift_allocObject();
      *(_QWORD *)(v31 + 16) = 0;
      *(_QWORD *)(v31 + 24) = 0;
      *(_QWORD *)(v31 + 32) = v27;
      *(_OWORD *)(v31 + 40) = v54;
      *(_QWORD *)(v31 + 56) = v51;
      *(_QWORD *)(v31 + 64) = v50;
      (*(void (**)(unint64_t, uint64_t, _QWORD))(v45 + 32))(v31 + v30, v25, v54);
      *(_QWORD *)(v31 + ((v43 + v30) & 0xFFFFFFFFFFFFFFF8)) = v49;
      v0 = v42;
      sub_22DF9E1FC(v24, v52);
      LODWORD(v24) = __swift_getEnumTagSinglePayload(v52, 1, v29);
      v32 = v50;
      v33 = v42[24];
      if ((_DWORD)v24 == 1)
      {
        sub_22DFAA28C(v42[24]);
      }
      else
      {
        sub_22DFDD76C();
        (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v29 - 8) + 8))(v33, v29);
      }
      if (*(_QWORD *)(v31 + 16))
      {
        swift_getObjectType();
        swift_unknownObjectRetain();
        v34 = sub_22DFDD730();
        v36 = v35;
        swift_unknownObjectRelease();
      }
      else
      {
        v34 = 0;
        v36 = 0;
      }
      v15 = v48;
      v37 = *(_QWORD *)v42[12];
      v38 = (_QWORD *)(v36 | v34);
      if (v36 | v34)
      {
        v38 = v41;
        *v41 = 0;
        v41[1] = 0;
        v42[4] = v34;
        v42[5] = v36;
      }
      v21 = v53 + 1;
      v39 = v42[25];
      v42[6] = 1;
      v42[7] = v38;
      v42[8] = v37;
      swift_task_create();
      swift_release();
      sub_22DFAA28C(v39);
    }
    while (v47 != v53 + 1);
    goto LABEL_26;
  }
  __break(1u);
  return result;
}

uint64_t sub_22DFAFCB8()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;

  OUTLINED_FUNCTION_209();
  OUTLINED_FUNCTION_127(v2);
  if (v1)
    swift_bridgeObjectRelease();
  else
    *(_QWORD *)(v0 + 272) = MEMORY[0x24BEE4AF8];
  return OUTLINED_FUNCTION_24();
}

uint64_t sub_22DFAFD1C()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;
  uint64_t (*v3)(void);
  char isUniquelyReferenced_nonNull_native;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  _QWORD *v9;
  uint64_t v10;
  uint64_t v11;

  v1 = *(_QWORD *)(v0 + 272);
  if (*(_BYTE *)(v0 + 296) == 1)
  {
    v2 = *(_QWORD **)(v0 + 88);
    OUTLINED_FUNCTION_121_0(*(_QWORD *)(v0 + 216));
    *v2 = v1;
    OUTLINED_FUNCTION_28();
    swift_task_dealloc();
    OUTLINED_FUNCTION_40();
    swift_task_dealloc();
    v3 = (uint64_t (*)(void))OUTLINED_FUNCTION_152();
    return OUTLINED_FUNCTION_53(v3);
  }
  else
  {
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v6 = *(_QWORD *)(v0 + 272);
    if ((isUniquelyReferenced_nonNull_native & 1) == 0)
    {
      sub_22DF470EC();
      v6 = v10;
    }
    v7 = *(_QWORD *)(v6 + 16);
    v8 = v7 + 1;
    if (v7 >= *(_QWORD *)(v6 + 24) >> 1)
    {
      sub_22DF470EC();
      v6 = v11;
    }
    *(_QWORD *)(v0 + 280) = v6;
    *(_QWORD *)(v6 + 16) = v8;
    v9 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 288) = v9;
    *v9 = v0;
    v9[1] = sub_22DFAFE54;
    OUTLINED_FUNCTION_110_1();
    return sub_22DFDD838();
  }
}

uint64_t sub_22DFAFE54()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;

  OUTLINED_FUNCTION_209();
  OUTLINED_FUNCTION_127(v2);
  if (v1)
    swift_bridgeObjectRelease();
  else
    *(_QWORD *)(v0 + 272) = *(_QWORD *)(v0 + 280);
  return OUTLINED_FUNCTION_24();
}

uint64_t sub_22DFAFEB0()
{
  uint64_t v0;

  (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 216) + 8))(*(_QWORD *)(v0 + 224), *(_QWORD *)(v0 + 208));
  swift_task_dealloc();
  OUTLINED_FUNCTION_34();
  swift_task_dealloc();
  OUTLINED_FUNCTION_40();
  return OUTLINED_FUNCTION_38_0(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t (*sub_22DFAFF0C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5))(uint64_t a1)
{
  _QWORD *v10;

  v10 = (_QWORD *)swift_allocObject();
  v10[2] = a2;
  v10[3] = a3;
  v10[4] = a4;
  v10[5] = a5;
  v10[6] = a1;
  swift_unknownObjectRetain();
  return sub_22DFB08C4;
}

uint64_t sub_22DFAFF84(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  _QWORD *v8;
  uint64_t v10;
  uint64_t v11;

  v8[29] = v10;
  v8[30] = v11;
  v8[27] = a7;
  v8[28] = a8;
  v8[25] = a5;
  v8[26] = a6;
  v8[24] = a4;
  v8[31] = *(_QWORD *)(a8 - 8);
  v8[32] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_22DFAFFE8()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void (*v5)(void);
  id v6;
  uint64_t inited;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  uint64_t v12;
  _QWORD *v13;
  id v15;
  unint64_t v16;

  OUTLINED_FUNCTION_32_9();
  v1 = v0[32];
  v2 = v0[30];
  v3 = v0[28];
  v4 = v0[26];
  type metadata accessor for CoordinationObservationUpdate();
  OUTLINED_FUNCTION_110_1();
  v5();
  v6 = sub_22DFD4C74(v1, v3, v2);
  v0[33] = v6;
  __swift_instantiateConcreteTypeFromMangledName(&qword_255DD7278);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_22DFE0820;
  *(_QWORD *)(inited + 32) = v4;
  v16 = inited;
  sub_22DFDD670();
  v8 = (void *)v0[26];
  if (v16 >> 62)
  {
    v15 = v8;
    sub_22DFDD448();
    v9 = sub_22DFDDDB4();
    OUTLINED_FUNCTION_46();
  }
  else
  {
    v9 = *(_QWORD *)((v16 & 0xFFFFFFFFFFFFF8) + 0x10);
    v10 = v8;
  }
  if (v9)
    sub_22DFB044C(v16);
  else
    swift_bridgeObjectRelease();
  v11 = (void *)v0[24];
  sub_22DF7F42C();
  sub_22DFB0694();
  v0[34] = OUTLINED_FUNCTION_104_2();
  OUTLINED_FUNCTION_46();
  v0[7] = v0 + 20;
  v0[2] = v0;
  v0[3] = sub_22DFB0188;
  v12 = swift_continuation_init();
  v0[15] = MEMORY[0x24BDAC760];
  v13 = v0 + 15;
  v13[1] = 0x40000000;
  v13[2] = sub_22DFAF5DC;
  v13[3] = &block_descriptor_16;
  v13[4] = v12;
  OUTLINED_FUNCTION_120_3(v11, sel_sendRequest_members_withCompletionHandler_, (uint64_t)v6);
  OUTLINED_FUNCTION_40_1();
  return swift_continuation_await();
}

uint64_t sub_22DFB0188()
{
  uint64_t v0;
  uint64_t v1;

  OUTLINED_FUNCTION_8_16();
  *(_QWORD *)(v0 + 280) = v1;
  OUTLINED_FUNCTION_15();
  return OUTLINED_FUNCTION_2_2();
}

uint64_t sub_22DFB01C8()
{
  uint64_t v0;
  void *v1;
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;
  id v8;
  uint64_t (*v9)(void);
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t *v13;

  v2 = *(void **)(v0 + 264);
  v1 = *(void **)(v0 + 272);

  v3 = *(void **)(v0 + 168);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_255DDBD50);
  if (OUTLINED_FUNCTION_180())
  {
    v4 = *(_QWORD *)(v0 + 232);
    v6 = *(void **)(v0 + 208);
    v5 = *(_QWORD *)(v0 + 216);
    v7 = v3;
    sub_22DFDDCA0();
    *(_QWORD *)(v0 + 176) = 0;
    *(_QWORD *)(v0 + 184) = 0xE000000000000000;
    OUTLINED_FUNCTION_27_3();
    sub_22DFDD568();
    sub_22DFDDD3C();
    OUTLINED_FUNCTION_9_14();
    v8 = objc_msgSend(v6, sel_description);
    sub_22DFDD514();

    sub_22DFDD568();
    swift_bridgeObjectRelease();
    static Logging.ulog(_:extended:)(*(_QWORD *)(v0 + 176), *(_QWORD *)(v0 + 184), 0, v5, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v4 + 16) + 16) + 8));

    OUTLINED_FUNCTION_103();
    OUTLINED_FUNCTION_34();
    v9 = (uint64_t (*)(void))OUTLINED_FUNCTION_152();
  }
  else
  {
    swift_getObjectType();
    v10 = OUTLINED_FUNCTION_109_1();
    v12 = v11;
    sub_22DF9B2D0();
    OUTLINED_FUNCTION_17();
    *v13 = v10;
    v13[1] = v12;
    v13[2] = 0xD00000000000001FLL;
    v13[3] = 0x800000022DFF2430;
    OUTLINED_FUNCTION_18_13((uint64_t)v13, 1);

    OUTLINED_FUNCTION_91_3();
    v9 = *(uint64_t (**)(void))(v0 + 8);
  }
  return v9();
}

uint64_t sub_22DFB038C()
{
  uint64_t v0;
  void *v1;
  void *v2;

  v1 = *(void **)(v0 + 272);
  v2 = *(void **)(v0 + 264);
  swift_willThrow();

  OUTLINED_FUNCTION_91_3();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_22DFB03D8(uint64_t result, void *a2, void *a3, void *a4)
{
  uint64_t v4;

  v4 = *(_QWORD *)(result + 32);
  if (a4)
    return sub_22DFAC3E0(v4, (uint64_t)a4);
  if (a2)
  {
    if (a3)
      return sub_22DFAC42C(v4, (uint64_t)a2, (uint64_t)a3);
  }
  else
  {
    __break(1u);
  }
  __break(1u);
  return result;
}

void sub_22DFB044C(unint64_t a1)
{
  unint64_t v1;
  unint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  id v8;
  void *v9;
  BOOL v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  char v18;
  uint64_t v19;
  id v20;
  char v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;
  unint64_t v28;

  v1 = a1;
  v2 = a1 >> 62;
  if (a1 >> 62)
  {
    sub_22DFDD448();
    v5 = sub_22DFDDDB4();
    swift_bridgeObjectRelease();
    if (v5)
    {
LABEL_3:
      __swift_instantiateConcreteTypeFromMangledName(&qword_255DD7718);
      v3 = sub_22DFDDC88();
      if (!v2)
        goto LABEL_4;
LABEL_8:
      sub_22DFDD448();
      v4 = sub_22DFDDDB4();
      swift_bridgeObjectRelease();
      if (!v4)
      {
LABEL_25:
        swift_bridgeObjectRelease();
        return;
      }
      goto LABEL_9;
    }
  }
  else if (*(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10))
  {
    goto LABEL_3;
  }
  v3 = MEMORY[0x24BEE4B08];
  if (v2)
    goto LABEL_8;
LABEL_4:
  v4 = *(_QWORD *)((v1 & 0xFFFFFFFFFFFFF8) + 0x10);
  if (!v4)
    goto LABEL_25;
LABEL_9:
  v6 = 0;
  v7 = v3 + 56;
  v27 = v1;
  v28 = v1 & 0xC000000000000001;
  v24 = v1 + 32;
  v25 = v1 & 0xFFFFFFFFFFFFFF8;
  v26 = v4;
  while (1)
  {
    if (v28)
    {
      v8 = (id)MEMORY[0x22E322FF4](v6, v1);
    }
    else
    {
      if (v6 >= *(_QWORD *)(v25 + 16))
        goto LABEL_28;
      v8 = *(id *)(v24 + 8 * v6);
    }
    v9 = v8;
    v10 = __OFADD__(v6++, 1);
    if (v10)
      break;
    v11 = sub_22DFDDB14();
    v12 = -1 << *(_BYTE *)(v3 + 32);
    v13 = v11 & ~v12;
    v14 = v13 >> 6;
    v15 = *(_QWORD *)(v7 + 8 * (v13 >> 6));
    v16 = 1 << v13;
    if (((1 << v13) & v15) != 0)
    {
      sub_22DF7F42C();
      v17 = *(id *)(*(_QWORD *)(v3 + 48) + 8 * v13);
      v18 = sub_22DFDDB20();

      if ((v18 & 1) != 0)
      {
LABEL_20:

        v4 = v26;
        v1 = v27;
        goto LABEL_24;
      }
      v19 = ~v12;
      while (1)
      {
        v13 = (v13 + 1) & v19;
        v14 = v13 >> 6;
        v15 = *(_QWORD *)(v7 + 8 * (v13 >> 6));
        v16 = 1 << v13;
        if ((v15 & (1 << v13)) == 0)
          break;
        v20 = *(id *)(*(_QWORD *)(v3 + 48) + 8 * v13);
        v21 = sub_22DFDDB20();

        if ((v21 & 1) != 0)
          goto LABEL_20;
      }
      v4 = v26;
      v1 = v27;
    }
    *(_QWORD *)(v7 + 8 * v14) = v16 | v15;
    *(_QWORD *)(*(_QWORD *)(v3 + 48) + 8 * v13) = v9;
    v22 = *(_QWORD *)(v3 + 16);
    v10 = __OFADD__(v22, 1);
    v23 = v22 + 1;
    if (v10)
      goto LABEL_27;
    *(_QWORD *)(v3 + 16) = v23;
LABEL_24:
    if (v6 == v4)
      goto LABEL_25;
  }
  __break(1u);
LABEL_27:
  __break(1u);
LABEL_28:
  __break(1u);
}

unint64_t sub_22DFB0694()
{
  unint64_t result;
  unint64_t v1;

  result = qword_255DD7288;
  if (!qword_255DD7288)
  {
    v1 = sub_22DF7F42C();
    result = MEMORY[0x22E323AEC](MEMORY[0x24BEE5BD8], v1);
    atomic_store(result, (unint64_t *)&qword_255DD7288);
  }
  return result;
}

uint64_t sub_22DFB06D4()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  OUTLINED_FUNCTION_94_2();
  v1 = swift_task_alloc();
  v2 = (_QWORD *)OUTLINED_FUNCTION_100(v1);
  *v2 = v0;
  v2[1] = sub_22DF44464;
  OUTLINED_FUNCTION_95_3();
  OUTLINED_FUNCTION_40_1();
  return sub_22DFAF5E0(v3, v4, v5, v6, v7, v8, v9, v10);
}

uint64_t sub_22DFB0750@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v1;
  uint64_t result;

  result = (*(uint64_t (**)(void))(v1 + 48))();
  *a1 = result;
  return result;
}

uint64_t sub_22DFB0788()
{
  uint64_t v0;
  unint64_t v1;

  v1 = (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v0 + 40) - 8) + 64)
      + ((*(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(v0 + 40) - 8) + 80) + 72) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(v0 + 40) - 8) + 80))
      + 7) & 0xFFFFFFFFFFFFFFF8;
  OUTLINED_FUNCTION_297();

  OUTLINED_FUNCTION_83_0();
  OUTLINED_FUNCTION_115_1();
  return swift_deallocObject();
}

uint64_t sub_22DFB0800()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  OUTLINED_FUNCTION_94_2();
  v1 = swift_task_alloc();
  v2 = (_QWORD *)OUTLINED_FUNCTION_100(v1);
  *v2 = v0;
  v2[1] = sub_22DF39390;
  OUTLINED_FUNCTION_95_3();
  OUTLINED_FUNCTION_40_1();
  return sub_22DFAFF84(v3, v4, v5, v6, v7, v8, v9, v10);
}

uint64_t sub_22DFB08A0()
{
  swift_unknownObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_22DFB08C4(uint64_t a1)
{
  uint64_t v1;

  return (*(uint64_t (**)(uint64_t, _QWORD))(*(_QWORD *)(v1 + 32) + 48))(a1, *(_QWORD *)(v1 + 16));
}

uint64_t sub_22DFB08F0()
{
  swift_unknownObjectWeakDestroy();
  return swift_deallocObject();
}

uint64_t sub_22DFB0914()
{
  swift_release();
  swift_release();
  swift_release();
  return swift_deallocObject();
}

void sub_22DFB0948(void *a1, void *a2, void *a3, uint64_t a4)
{
  uint64_t *v4;

  sub_22DFAE448(a1, a2, a3, a4, v4[4], v4[5], v4[6], v4[7], v4[2], v4[3]);
}

uint64_t block_copy_helper_4(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_4()
{
  return swift_release();
}

uint64_t sub_22DFB098C()
{
  swift_release();
  swift_release();
  return swift_deallocObject();
}

void sub_22DFB09B8(void *a1, void *a2, void (*a3)(_QWORD, void *), uint64_t a4)
{
  uint64_t *v4;

  sub_22DFAECC8(a1, a2, a3, a4, v4[4], v4[5], v4[2], v4[3]);
}

uint64_t sub_22DFB09C4()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_22DFB09E8(_QWORD *a1, _QWORD *a2)
{
  uint64_t v2;

  return (*(uint64_t (**)(_QWORD, _QWORD))(v2 + 16))(*a1, *a2);
}

uint64_t sub_22DFB0A10()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  OUTLINED_FUNCTION_54();
  OUTLINED_FUNCTION_22_12();
  OUTLINED_FUNCTION_297();
  swift_release();
  OUTLINED_FUNCTION_83_0();
  swift_release();

  OUTLINED_FUNCTION_115_1();
  return OUTLINED_FUNCTION_27_4();
}

uint64_t sub_22DFB0A6C()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  OUTLINED_FUNCTION_94_2();
  OUTLINED_FUNCTION_54();
  OUTLINED_FUNCTION_38_11();
  OUTLINED_FUNCTION_101_1();
  v1 = swift_task_alloc();
  v2 = (_QWORD *)OUTLINED_FUNCTION_100(v1);
  *v2 = v0;
  v2[1] = sub_22DF5D2C0;
  OUTLINED_FUNCTION_79_2();
  OUTLINED_FUNCTION_40_1();
  return sub_22DFAF010(v3, v4, v5, v6, v7, v8, v9, v10);
}

uint64_t sub_22DFB0AE0()
{
  uint64_t v0;

  _Block_release(*(const void **)(v0 + 16));
  return swift_deallocObject();
}

void sub_22DFB0B04(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  sub_22DFAC620(a1, a2, *(_QWORD *)(v2 + 16));
}

uint64_t sub_22DFB0B0C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  OUTLINED_FUNCTION_54();
  OUTLINED_FUNCTION_22_12();
  OUTLINED_FUNCTION_297();
  swift_release();
  OUTLINED_FUNCTION_83_0();
  swift_release();

  swift_release();
  OUTLINED_FUNCTION_115_1();
  return OUTLINED_FUNCTION_27_4();
}

uint64_t sub_22DFB0B7C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  OUTLINED_FUNCTION_54();
  OUTLINED_FUNCTION_38_11();
  OUTLINED_FUNCTION_101_1();
  v3 = *(_QWORD *)(v0 + v2);
  v4 = swift_task_alloc();
  v5 = (_QWORD *)OUTLINED_FUNCTION_100(v4);
  *v5 = v1;
  v5[1] = sub_22DF5D888;
  OUTLINED_FUNCTION_79_2();
  return sub_22DFAE7C0(v6, v7, v8, v9, v10, v11, v12, v3);
}

uint64_t OUTLINED_FUNCTION_1_23@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;

  *v3 = v1;
  v3[1] = a1;
  return v2;
}

void OUTLINED_FUNCTION_2_24(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  __int128 v4;

  *(_QWORD *)(v2 + 56) = a1;
  v3 = *(_QWORD *)(v1 + 112);
  v4 = *(_OWORD *)(v1 + 96);
  *(_OWORD *)(v2 + 16) = *(_OWORD *)(v1 + 80);
  *(_OWORD *)(v2 + 32) = v4;
  *(_QWORD *)(v2 + 48) = v3;
  type metadata accessor for CoordinationTransportClient();
}

void OUTLINED_FUNCTION_3_24(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  __int128 v4;

  *(_QWORD *)(v2 + 56) = a1;
  v3 = *(_QWORD *)(v1 + 112);
  v4 = *(_OWORD *)(v1 + 96);
  *(_OWORD *)(v2 + 16) = *(_OWORD *)(v1 + 80);
  *(_OWORD *)(v2 + 32) = v4;
  *(_QWORD *)(v2 + 48) = v3;
  type metadata accessor for CoordinationTransportServer();
}

uint64_t OUTLINED_FUNCTION_9_18@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;

  *v3 = v1;
  v3[1] = a1;
  return v2;
}

uint64_t OUTLINED_FUNCTION_14_17()
{
  uint64_t v0;

  *(_QWORD *)(v0 + 16) = *(_QWORD *)(v0 + 96);
  return sub_22DFDDCA0();
}

uint64_t OUTLINED_FUNCTION_15_17(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v7;
  _QWORD *v8;

  v8[9] = a7;
  v8[10] = v7;
  v8[7] = a5;
  v8[8] = a6;
  v8[5] = a3;
  v8[6] = a4;
  v8[3] = result;
  v8[4] = a2;
  v8[11] = *(_QWORD *)(a6 + 16);
  return result;
}

uint64_t OUTLINED_FUNCTION_17_10()
{
  uint64_t v0;

  *(_QWORD *)(v0 + 16) = *(_QWORD *)(v0 + 80);
  return sub_22DFDDCA0();
}

uint64_t OUTLINED_FUNCTION_18_13@<X0>(uint64_t a1@<X1>, char a2@<W8>)
{
  *(_BYTE *)(a1 + 32) = a2;
  return swift_willThrow();
}

void OUTLINED_FUNCTION_24_13(char a1)
{
  uint64_t v1;
  void *v2;
  Swift::Bool v3;
  Swift::String v4;

  v3 = a1 & 1;
  v4._countAndFlagsBits = v1;
  v4._object = v2;
  Logging.ulog(_:extended:)(v4, v3);
}

uint64_t OUTLINED_FUNCTION_27_6()
{
  return sub_22DFDD730();
}

uint64_t OUTLINED_FUNCTION_29_13(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return sub_22DFAD4E0(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t OUTLINED_FUNCTION_30_10(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return sub_22DFADA60(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t OUTLINED_FUNCTION_37_9()
{
  uint64_t v0;
  uint64_t v1;

  return (*(uint64_t (**)(uint64_t, uint64_t))(v0 + 32))(v1, v0);
}

uint64_t OUTLINED_FUNCTION_39_8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return sub_22DFADDAC(a1, a2, a3, a4, a5, a6);
}

uint64_t OUTLINED_FUNCTION_40_6(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  return sub_22DFAD7AC(a1, a2, a3, a4, a5, a6, a7);
}

uint64_t OUTLINED_FUNCTION_41_4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  return sub_22DFACED8(a1, a2, a3, a4, a5, a6, a7);
}

uint64_t OUTLINED_FUNCTION_42_3(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  return sub_22DFAD268(a1, a2, a3, a4, a5, a6, a7);
}

uint64_t OUTLINED_FUNCTION_43_4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  return sub_22DFAC8DC(a1, a2, a3, a4, a5, a6, a7);
}

uint64_t OUTLINED_FUNCTION_44_3()
{
  return swift_getAssociatedConformanceWitness();
}

uint64_t OUTLINED_FUNCTION_45_6(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(v1 + 96) = a1;
  return sub_22DFDDB2C();
}

uint64_t OUTLINED_FUNCTION_47_6()
{
  return sub_22DFDD568();
}

uint64_t OUTLINED_FUNCTION_49_3(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11)
{
  uint64_t (*v11)(uint64_t *, uint64_t *);

  *(_QWORD *)a2 = 2;
  *(_QWORD *)(a2 + 8) = 0;
  *(_QWORD *)(a2 + 16) = 0;
  *(_QWORD *)(a2 + 24) = 0;
  *(_BYTE *)(a2 + 32) = 2;
  a10 = 0;
  a11 = a1;
  return v11(&a10, &a11);
}

uint64_t OUTLINED_FUNCTION_51_6(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8;
  _QWORD *v9;

  v9[11] = a8;
  v9[12] = v8;
  v9[9] = a6;
  v9[10] = a7;
  v9[7] = a4;
  v9[8] = a5;
  v9[5] = a2;
  v9[6] = a3;
  v9[4] = result;
  v9[13] = *(_QWORD *)(a7 + 16);
  return result;
}

uint64_t OUTLINED_FUNCTION_53_5()
{
  _QWORD *v0;

  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(v0[18] + 32))(v0[19], v0[17], v0[14]);
}

uint64_t OUTLINED_FUNCTION_54_5()
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
  *(_QWORD *)(v3 + 200) = v0;
  return swift_task_dealloc();
}

uint64_t OUTLINED_FUNCTION_55_3()
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
  *(_QWORD *)(v3 + 184) = v0;
  return swift_task_dealloc();
}

uint64_t OUTLINED_FUNCTION_56_3()
{
  _QWORD *v0;

  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(v0[16] + 32))(v0[17], v0[15], v0[12]);
}

uint64_t OUTLINED_FUNCTION_57_5()
{
  return sub_22DFDD568();
}

uint64_t OUTLINED_FUNCTION_58_7()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v0 + 56))(v2, v1, v0);
}

uint64_t OUTLINED_FUNCTION_60_3()
{
  return sub_22DF39308();
}

uint64_t OUTLINED_FUNCTION_61_3()
{
  return swift_task_switch();
}

uint64_t OUTLINED_FUNCTION_64_3(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13)
{
  uint64_t v13;
  uint64_t v14;

  return (*(uint64_t (**)(uint64_t, uint64_t))(a13 + 56))(v14, v13);
}

uint64_t OUTLINED_FUNCTION_65_4()
{
  return swift_task_dealloc();
}

uint64_t OUTLINED_FUNCTION_66_3()
{
  return sub_22DF39308();
}

uint64_t OUTLINED_FUNCTION_68_1()
{
  uint64_t v0;

  return sub_22DF34068(v0);
}

void OUTLINED_FUNCTION_70_3(char a1)
{
  uint64_t v1;
  void *v2;
  Swift::Bool v3;
  Swift::String v4;

  v3 = a1 & 1;
  v4._countAndFlagsBits = v1;
  v4._object = v2;
  Logging.ulog(_:extended:)(v4, v3);
}

uint64_t OUTLINED_FUNCTION_71_1()
{
  return swift_task_dealloc();
}

uint64_t OUTLINED_FUNCTION_72_3@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;

  *v3 = v1;
  v3[1] = a1;
  return v2;
}

uint64_t OUTLINED_FUNCTION_76_1(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;

  *a1 = v2;
  a1[1] = v1;
  return *(_QWORD *)(v2 + 32);
}

uint64_t OUTLINED_FUNCTION_77_4()
{
  return swift_beginAccess();
}

uint64_t OUTLINED_FUNCTION_82_5()
{
  return swift_task_dealloc();
}

uint64_t OUTLINED_FUNCTION_83_4()
{
  uint64_t v0;

  return sub_22DF34068(v0);
}

uint64_t OUTLINED_FUNCTION_84_2()
{
  return swift_getAssociatedTypeWitness();
}

uint64_t OUTLINED_FUNCTION_85_3(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;

  *a1 = v2;
  a1[1] = v1;
  return *(_QWORD *)(v2 + 24);
}

uint64_t OUTLINED_FUNCTION_86_4()
{
  return sub_22DFDDF28();
}

uint64_t OUTLINED_FUNCTION_88_1()
{
  return swift_getAssociatedConformanceWitness();
}

uint64_t OUTLINED_FUNCTION_89_3()
{
  return sub_22DFDDF34();
}

uint64_t OUTLINED_FUNCTION_91_3()
{
  return swift_task_dealloc();
}

void OUTLINED_FUNCTION_92_1(uint64_t a1, uint64_t a2)
{
  *(_QWORD *)a2 = 2;
  *(_QWORD *)(a2 + 8) = 0;
  *(_QWORD *)(a2 + 16) = 0;
  *(_QWORD *)(a2 + 24) = 0;
  *(_BYTE *)(a2 + 32) = 2;
}

void OUTLINED_FUNCTION_97_1()
{
  void *v0;

}

uint64_t OUTLINED_FUNCTION_99_2()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t (*v2)(uint64_t, uint64_t);

  return v2(v1, v0);
}

uint64_t OUTLINED_FUNCTION_104_2()
{
  return sub_22DFDD8E0();
}

uint64_t OUTLINED_FUNCTION_105_1()
{
  return sub_22DFDD9AC();
}

uint64_t OUTLINED_FUNCTION_106_3(uint64_t result, uint64_t a2)
{
  uint64_t v2;

  *(_QWORD *)(v2 + 152) = result;
  *(_QWORD *)(v2 + 160) = a2;
  return result;
}

uint64_t OUTLINED_FUNCTION_108_4()
{
  return sub_22DFDD568();
}

uint64_t OUTLINED_FUNCTION_109_4()
{
  uint64_t (*v0)(void);

  return v0();
}

uint64_t *OUTLINED_FUNCTION_115_3(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  return &a9;
}

void *OUTLINED_FUNCTION_116_0@<X0>(uint64_t a1@<X8>, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;

  a4 = v5;
  a5 = a1;
  return _Block_copy(&a2);
}

uint64_t OUTLINED_FUNCTION_118_3()
{
  return swift_unknownObjectWeakInit();
}

id OUTLINED_FUNCTION_120_3(id a1, SEL a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;

  return objc_msgSend(a1, a2, a3, v4, v3);
}

uint64_t OUTLINED_FUNCTION_125_1()
{
  return sub_22DFDD568();
}

uint64_t OUTLINED_FUNCTION_126_1()
{
  uint64_t (*v0)(uint64_t, _QWORD, _QWORD);
  uint64_t v1;
  uint64_t v2;

  return v0(v1, *(_QWORD *)(v2 + 160), *(_QWORD *)(v2 + 168));
}

BOOL sub_22DFB1358()
{
  return (sub_22DFDDA0C() & 1) == 0;
}

uint64_t dispatch thunk of TransportRequestContainer.unpackRequest()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 24))();
}

void TimerOperationResponse.payload.getter(uint64_t a1@<X8>)
{
  uint64_t v1;

  sub_22DFB1CFC(v1, a1, type metadata accessor for HPTimer);
}

void TimerOperationResponse.init(_:)(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  sub_22DFB1638(a1, a2, type metadata accessor for HPTimer);
}

uint64_t sub_22DFB13D0()
{
  sub_22DFB14D0();
  return sub_22DFDE084();
}

uint64_t sub_22DFB13F8()
{
  sub_22DFB14D0();
  return sub_22DFDE090();
}

void TimerOperationResponse.encode(to:)()
{
  uint64_t v0;

  __swift_instantiateConcreteTypeFromMangledName(&qword_255DDBDF0);
  OUTLINED_FUNCTION_14_18();
  MEMORY[0x24BDAC7A8](v0);
  OUTLINED_FUNCTION_9_19();
  sub_22DFB14D0();
  OUTLINED_FUNCTION_6_12();
  OUTLINED_FUNCTION_20_10();
  sub_22DF9B0E0((unint64_t *)&qword_255DD7BE8, type metadata accessor for HPTimer, (uint64_t)&protocol conformance descriptor for HPTimer);
  OUTLINED_FUNCTION_5_23();
  OUTLINED_FUNCTION_10_20();
  OUTLINED_FUNCTION_3_25();
}

unint64_t sub_22DFB14D0()
{
  unint64_t result;

  result = qword_255DDBDF8;
  if (!qword_255DDBDF8)
  {
    result = MEMORY[0x22E323AEC](&unk_22DFE8FFC, &type metadata for TimerOperationResponse.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_255DDBDF8);
  }
  return result;
}

void TimerOperationResponse.init(from:)(_QWORD *a1@<X0>, uint64_t a2@<X8>)
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

  OUTLINED_FUNCTION_20_10();
  OUTLINED_FUNCTION_57();
  MEMORY[0x24BDAC7A8](v4);
  OUTLINED_FUNCTION_13_20(v5, a2);
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_255DDBE00);
  v7 = OUTLINED_FUNCTION_15_18(v6);
  MEMORY[0x24BDAC7A8](v7);
  v8 = OUTLINED_FUNCTION_2_25();
  type metadata accessor for TimerOperationResponse(v8);
  OUTLINED_FUNCTION_57();
  MEMORY[0x24BDAC7A8](v9);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_22DFB14D0();
  OUTLINED_FUNCTION_8_24();
  if (!v2)
  {
    sub_22DF9B0E0((unint64_t *)&qword_255DD7BD8, type metadata accessor for HPTimer, (uint64_t)&protocol conformance descriptor for HPTimer);
    OUTLINED_FUNCTION_4_25();
    v10 = OUTLINED_FUNCTION_7_23();
    OUTLINED_FUNCTION_24_14(v10, v11, type metadata accessor for HPTimer);
    OUTLINED_FUNCTION_22_13(v12, v13, type metadata accessor for TimerOperationResponse);
  }
  __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)a1);
  OUTLINED_FUNCTION_1_4();
}

uint64_t type metadata accessor for TimerOperationResponse(uint64_t a1)
{
  return sub_22DF30B80(a1, qword_255DDBF18);
}

void sub_22DFB1638(uint64_t a1, uint64_t a2, uint64_t (*a3)(_QWORD))
{
  uint64_t v3;

  v3 = OUTLINED_FUNCTION_21_11(a1, a2, a3);
  OUTLINED_FUNCTION_30_11(*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 32));
  OUTLINED_FUNCTION_1_2();
}

void sub_22DFB1664(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  TimerOperationResponse.init(from:)(a1, a2);
}

void sub_22DFB1678()
{
  TimerOperationResponse.encode(to:)();
}

void TimerOperationRequest.Payload.operation.getter(_BYTE *a1@<X8>)
{
  _BYTE *v1;

  *a1 = *v1;
}

void TimerOperationRequest.Payload.timer.getter(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;

  v3 = type metadata accessor for TimerOperationRequest.Payload(0);
  sub_22DFB1CFC(v1 + *(int *)(v3 + 20), a1, type metadata accessor for HPTimer);
}

uint64_t type metadata accessor for TimerOperationRequest.Payload(uint64_t a1)
{
  return sub_22DF30B80(a1, qword_255DDC038);
}

void TimerOperationRequest.Payload.init(operation:timer:)(_BYTE *a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t v5;

  *a3 = *a1;
  v5 = type metadata accessor for TimerOperationRequest.Payload(0);
  sub_22DFB1638(a2, (uint64_t)&a3[*(int *)(v5 + 20)], type metadata accessor for HPTimer);
}

uint64_t sub_22DFB1734(uint64_t a1, uint64_t a2)
{
  BOOL v2;
  char v7;

  v2 = a1 == 0x6F6974617265706FLL && a2 == 0xE90000000000006ELL;
  if (v2 || (sub_22DFDDF58() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x72656D6974 && a2 == 0xE500000000000000)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    v7 = sub_22DFDDF58();
    swift_bridgeObjectRelease();
    if ((v7 & 1) != 0)
      return 1;
    else
      return 2;
  }
}

uint64_t sub_22DFB1824(char a1)
{
  if ((a1 & 1) != 0)
    return 0x72656D6974;
  else
    return 0x6F6974617265706FLL;
}

uint64_t sub_22DFB185C()
{
  char *v0;

  return sub_22DFB1824(*v0);
}

uint64_t sub_22DFB1864@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_22DFB1734(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_22DFB1888()
{
  sub_22DFB19F8();
  return sub_22DFDE084();
}

uint64_t sub_22DFB18B0()
{
  sub_22DFB19F8();
  return sub_22DFDE090();
}

void TimerOperationRequest.Payload.encode(to:)()
{
  _BYTE *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _BYTE *v6;
  _BYTE v7[16];

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_255DDBE08);
  OUTLINED_FUNCTION_14_18();
  MEMORY[0x24BDAC7A8](v4);
  v6 = &v7[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  OUTLINED_FUNCTION_9_19();
  sub_22DFB19F8();
  OUTLINED_FUNCTION_6_12();
  v7[15] = *v0;
  v7[14] = 0;
  sub_22DFB1A34();
  OUTLINED_FUNCTION_28_1();
  if (!v1)
  {
    OUTLINED_FUNCTION_19_14();
    v7[13] = 1;
    OUTLINED_FUNCTION_20_10();
    sub_22DF9B0E0((unint64_t *)&qword_255DD7BE8, type metadata accessor for HPTimer, (uint64_t)&protocol conformance descriptor for HPTimer);
    OUTLINED_FUNCTION_28_1();
  }
  (*(void (**)(_BYTE *, uint64_t))(v2 + 8))(v6, v3);
  OUTLINED_FUNCTION_3_25();
}

unint64_t sub_22DFB19F8()
{
  unint64_t result;

  result = qword_255DDBE10;
  if (!qword_255DDBE10)
  {
    result = MEMORY[0x22E323AEC](&unk_22DFE8FAC, &type metadata for TimerOperationRequest.Payload.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_255DDBE10);
  }
  return result;
}

unint64_t sub_22DFB1A34()
{
  unint64_t result;

  result = qword_255DDBE18;
  if (!qword_255DDBE18)
  {
    result = MEMORY[0x22E323AEC](&protocol conformance descriptor for HPTimerOperation, &type metadata for HPTimerOperation);
    atomic_store(result, (unint64_t *)&qword_255DDBE18);
  }
  return result;
}

void TimerOperationRequest.Payload.init(from:)(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  _BYTE *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _BYTE *v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  char v21;
  char v22;
  char v23;

  v17 = a2;
  v19 = OUTLINED_FUNCTION_20_10();
  OUTLINED_FUNCTION_57();
  MEMORY[0x24BDAC7A8](v4);
  v18 = (char *)&v15 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_255DDBE20);
  MEMORY[0x24BDAC7A8](v20);
  v6 = OUTLINED_FUNCTION_2_25();
  v7 = type metadata accessor for TimerOperationRequest.Payload(v6);
  OUTLINED_FUNCTION_57();
  MEMORY[0x24BDAC7A8](v8);
  v10 = (char *)&v15 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_22DFB19F8();
  sub_22DFDE060();
  if (!v2)
  {
    v16 = v7;
    v11 = v10;
    v12 = (uint64_t)v18;
    v22 = 0;
    sub_22DFB1C58();
    OUTLINED_FUNCTION_26_9();
    v15 = v11;
    *v11 = v23;
    v21 = 1;
    sub_22DF9B0E0((unint64_t *)&qword_255DD7BD8, type metadata accessor for HPTimer, (uint64_t)&protocol conformance descriptor for HPTimer);
    OUTLINED_FUNCTION_26_9();
    OUTLINED_FUNCTION_18_14();
    v13 = v17;
    v14 = (uint64_t)v15;
    sub_22DFB1638(v12, (uint64_t)&v15[*(int *)(v16 + 20)], type metadata accessor for HPTimer);
    sub_22DFB1638(v14, v13, type metadata accessor for TimerOperationRequest.Payload);
  }
  __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)a1);
  OUTLINED_FUNCTION_1_4();
}

unint64_t sub_22DFB1C58()
{
  unint64_t result;

  result = qword_255DDBE28;
  if (!qword_255DDBE28)
  {
    result = MEMORY[0x22E323AEC](&protocol conformance descriptor for HPTimerOperation, &type metadata for HPTimerOperation);
    atomic_store(result, (unint64_t *)&qword_255DDBE28);
  }
  return result;
}

void sub_22DFB1C94(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  TimerOperationRequest.Payload.init(from:)(a1, a2);
}

void sub_22DFB1CA8()
{
  TimerOperationRequest.Payload.encode(to:)();
}

unint64_t static TimerOperationRequest.typeIdentifier.getter()
{
  return 0xD000000000000015;
}

void TimerOperationRequest.payload.getter(uint64_t a1@<X8>)
{
  uint64_t v1;

  sub_22DFB1CFC(v1, a1, type metadata accessor for TimerOperationRequest.Payload);
}

void sub_22DFB1CFC(uint64_t a1, uint64_t a2, uint64_t (*a3)(_QWORD))
{
  uint64_t v3;

  v3 = OUTLINED_FUNCTION_21_11(a1, a2, a3);
  OUTLINED_FUNCTION_30_11(*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 16));
  OUTLINED_FUNCTION_1_2();
}

void TimerOperationRequest.init(_:)(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  sub_22DFB1638(a1, a2, type metadata accessor for TimerOperationRequest.Payload);
}

uint64_t TimerOperationRequest.subscript.getter()
{
  return swift_getAtKeyPath();
}

uint64_t sub_22DFB1D54()
{
  sub_22DFB1E54();
  return sub_22DFDE084();
}

uint64_t sub_22DFB1D7C()
{
  sub_22DFB1E54();
  return sub_22DFDE090();
}

void TimerOperationRequest.encode(to:)()
{
  uint64_t v0;

  __swift_instantiateConcreteTypeFromMangledName(&qword_255DDBE30);
  OUTLINED_FUNCTION_14_18();
  MEMORY[0x24BDAC7A8](v0);
  OUTLINED_FUNCTION_9_19();
  sub_22DFB1E54();
  OUTLINED_FUNCTION_6_12();
  OUTLINED_FUNCTION_19_14();
  sub_22DF9B0E0(&qword_255DDBE40, type metadata accessor for TimerOperationRequest.Payload, (uint64_t)&protocol conformance descriptor for TimerOperationRequest.Payload);
  OUTLINED_FUNCTION_5_23();
  OUTLINED_FUNCTION_10_20();
  OUTLINED_FUNCTION_3_25();
}

unint64_t sub_22DFB1E54()
{
  unint64_t result;

  result = qword_255DDBE38;
  if (!qword_255DDBE38)
  {
    result = MEMORY[0x22E323AEC](&unk_22DFE8F5C, &type metadata for TimerOperationRequest.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_255DDBE38);
  }
  return result;
}

void TimerOperationRequest.init(from:)(_QWORD *a1@<X0>, uint64_t a2@<X8>)
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

  OUTLINED_FUNCTION_19_14();
  OUTLINED_FUNCTION_57();
  MEMORY[0x24BDAC7A8](v4);
  OUTLINED_FUNCTION_13_20(v5, a2);
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_255DDBE48);
  v7 = OUTLINED_FUNCTION_15_18(v6);
  MEMORY[0x24BDAC7A8](v7);
  v8 = OUTLINED_FUNCTION_2_25();
  type metadata accessor for TimerOperationRequest(v8);
  OUTLINED_FUNCTION_57();
  MEMORY[0x24BDAC7A8](v9);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_22DFB1E54();
  OUTLINED_FUNCTION_8_24();
  if (!v2)
  {
    sub_22DF9B0E0(&qword_255DDBE50, type metadata accessor for TimerOperationRequest.Payload, (uint64_t)&protocol conformance descriptor for TimerOperationRequest.Payload);
    OUTLINED_FUNCTION_4_25();
    v10 = OUTLINED_FUNCTION_7_23();
    OUTLINED_FUNCTION_24_14(v10, v11, type metadata accessor for TimerOperationRequest.Payload);
    OUTLINED_FUNCTION_22_13(v12, v13, type metadata accessor for TimerOperationRequest);
  }
  __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)a1);
  OUTLINED_FUNCTION_1_4();
}

uint64_t type metadata accessor for TimerOperationRequest(uint64_t a1)
{
  return sub_22DF30B80(a1, qword_255DDBFA8);
}

void sub_22DFB1FBC(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;

  sub_22DF9B0E0(&qword_255DDBE58, type metadata accessor for TimerOperationResponse, (uint64_t)&protocol conformance descriptor for TimerOperationResponse);
  *(_QWORD *)(a1 + 8) = v2;
  sub_22DF9B0E0(&qword_255DDBE60, type metadata accessor for TimerOperationResponse, (uint64_t)&protocol conformance descriptor for TimerOperationResponse);
  *(_QWORD *)(a1 + 16) = v3;
}

void sub_22DFB2018(uint64_t a1)
{
  uint64_t v2;

  sub_22DF9B0E0(&qword_255DDBE68, type metadata accessor for TimerOperationResponse, (uint64_t)&protocol conformance descriptor for TimerOperationResponse);
  *(_QWORD *)(a1 + 16) = v2;
}

void sub_22DFB2054(uint64_t a1)
{
  uint64_t v2;

  sub_22DF9B0E0(&qword_255DDBE70, type metadata accessor for TimerOperationRequest, (uint64_t)&protocol conformance descriptor for TimerOperationRequest);
  *(_QWORD *)(a1 + 16) = v2;
}

void sub_22DFB2090()
{
  sub_22DF9B0E0(&qword_255DDBE78, type metadata accessor for TimerOperationResponse, (uint64_t)&protocol conformance descriptor for TimerOperationResponse);
}

unint64_t sub_22DFB20BC()
{
  static TimerOperationRequest.typeIdentifier.getter();
  return 0xD000000000000015;
}

void sub_22DFB20D8(uint64_t a1)
{
  uint64_t v2;

  sub_22DF9B0E0(&qword_255DDBEA8, type metadata accessor for TimerOperationRequest, (uint64_t)&protocol conformance descriptor for TimerOperationRequest);
  *(_QWORD *)(a1 + 8) = v2;
}

void sub_22DFB2118(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;

  sub_22DF9B0E0(&qword_255DDBEB0, type metadata accessor for TimerOperationRequest, (uint64_t)&protocol conformance descriptor for TimerOperationRequest);
  *(_QWORD *)(a1 + 8) = v2;
  sub_22DF9B0E0(&qword_255DDBEB8, type metadata accessor for TimerOperationRequest, (uint64_t)&protocol conformance descriptor for TimerOperationRequest);
  *(_QWORD *)(a1 + 16) = v3;
}

void sub_22DFB2174(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  TimerOperationRequest.init(from:)(a1, a2);
}

void sub_22DFB2188()
{
  TimerOperationRequest.encode(to:)();
}

uint64_t *initializeBufferWithCopyOfBuffer for TimerOperationResponse(uint64_t *a1, uint64_t *a2)
{
  uint64_t v4;
  int v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  _QWORD *v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  char *v17;
  uint64_t v18;
  int EnumCaseMultiPayload;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;

  v4 = type metadata accessor for HPTimer(0);
  v5 = *(_DWORD *)(*(_QWORD *)(v4 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v21 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v21 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
    return a1;
  }
  v6 = v4;
  *a1 = *a2;
  v7 = *(int *)(v4 + 20);
  v8 = (char *)a1 + v7;
  v9 = (char *)a2 + v7;
  v10 = sub_22DFDCEFC();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v10 - 8) + 16))(v8, v9, v10);
  v11 = *(int *)(v6 + 24);
  v12 = (uint64_t *)((char *)a1 + v11);
  v13 = (uint64_t *)((char *)a2 + v11);
  v14 = v13[1];
  *v12 = *v13;
  v12[1] = v14;
  v15 = *(int *)(v6 + 28);
  v16 = (char *)a1 + v15;
  v17 = (char *)a2 + v15;
  v18 = type metadata accessor for HPTimer.Status(0);
  sub_22DFDD448();
  EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  switch(EnumCaseMultiPayload)
  {
    case 3:
      v22 = sub_22DFDCEC0();
      if (__swift_getEnumTagSinglePayload((uint64_t)v17, 1, v22))
      {
LABEL_8:
        v23 = __swift_instantiateConcreteTypeFromMangledName(&qword_255DD7828);
        memcpy(v16, v17, *(_QWORD *)(*(_QWORD *)(v23 - 8) + 64));
        goto LABEL_13;
      }
LABEL_12:
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v22 - 8) + 16))(v16, v17, v22);
      __swift_storeEnumTagSinglePayload((uint64_t)v16, 0, 1, v22);
      goto LABEL_13;
    case 2:
      v22 = sub_22DFDCEC0();
      if (__swift_getEnumTagSinglePayload((uint64_t)v17, 1, v22))
        goto LABEL_8;
      goto LABEL_12;
    case 0:
      v20 = sub_22DFDCEC0();
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v20 - 8) + 16))(v16, v17, v20);
LABEL_13:
      swift_storeEnumTagMultiPayload();
      return a1;
  }
  memcpy(v16, v17, *(_QWORD *)(*(_QWORD *)(v18 - 8) + 64));
  return a1;
}

uint64_t destroy for TimerOperationResponse(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t result;
  uint64_t v7;

  v2 = type metadata accessor for HPTimer(0);
  v3 = a1 + *(int *)(v2 + 20);
  v4 = sub_22DFDCEFC();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  swift_bridgeObjectRelease();
  v5 = a1 + *(int *)(v2 + 28);
  type metadata accessor for HPTimer.Status(0);
  result = swift_getEnumCaseMultiPayload();
  if ((_DWORD)result == 3 || (_DWORD)result == 2)
  {
    v7 = sub_22DFDCEC0();
    result = __swift_getEnumTagSinglePayload(v5, 1, v7);
    if (!(_DWORD)result)
      return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 8))(v5, v7);
  }
  else if (!(_DWORD)result)
  {
    v7 = sub_22DFDCEC0();
    return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 8))(v5, v7);
  }
  return result;
}

_QWORD *initializeWithCopy for TimerOperationResponse(_QWORD *a1, _QWORD *a2)
{
  int *v4;
  uint64_t v5;
  char *v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  _QWORD *v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  char *v15;
  uint64_t v16;
  int EnumCaseMultiPayload;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;

  *a1 = *a2;
  v4 = (int *)type metadata accessor for HPTimer(0);
  v5 = v4[5];
  v6 = (char *)a1 + v5;
  v7 = (char *)a2 + v5;
  v8 = sub_22DFDCEFC();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v8 - 8) + 16))(v6, v7, v8);
  v9 = v4[6];
  v10 = (_QWORD *)((char *)a1 + v9);
  v11 = (_QWORD *)((char *)a2 + v9);
  v12 = v11[1];
  *v10 = *v11;
  v10[1] = v12;
  v13 = v4[7];
  v14 = (char *)a1 + v13;
  v15 = (char *)a2 + v13;
  v16 = type metadata accessor for HPTimer.Status(0);
  sub_22DFDD448();
  EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  switch(EnumCaseMultiPayload)
  {
    case 3:
      v19 = sub_22DFDCEC0();
      if (__swift_getEnumTagSinglePayload((uint64_t)v15, 1, v19))
        goto LABEL_8;
      goto LABEL_10;
    case 2:
      v19 = sub_22DFDCEC0();
      if (__swift_getEnumTagSinglePayload((uint64_t)v15, 1, v19))
      {
LABEL_8:
        v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_255DD7828);
        memcpy(v14, v15, *(_QWORD *)(*(_QWORD *)(v20 - 8) + 64));
        goto LABEL_11;
      }
LABEL_10:
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v19 - 8) + 16))(v14, v15, v19);
      __swift_storeEnumTagSinglePayload((uint64_t)v14, 0, 1, v19);
      goto LABEL_11;
    case 0:
      v18 = sub_22DFDCEC0();
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v18 - 8) + 16))(v14, v15, v18);
LABEL_11:
      swift_storeEnumTagMultiPayload();
      return a1;
  }
  memcpy(v14, v15, *(_QWORD *)(*(_QWORD *)(v16 - 8) + 64));
  return a1;
}

_QWORD *assignWithCopy for TimerOperationResponse(_QWORD *a1, _QWORD *a2)
{
  int *v4;
  uint64_t v5;
  char *v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  _QWORD *v11;
  uint64_t v12;
  char *v13;
  char *v14;
  uint64_t v15;
  int EnumCaseMultiPayload;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;

  *a1 = *a2;
  v4 = (int *)type metadata accessor for HPTimer(0);
  v5 = v4[5];
  v6 = (char *)a1 + v5;
  v7 = (char *)a2 + v5;
  v8 = sub_22DFDCEFC();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v8 - 8) + 24))(v6, v7, v8);
  v9 = v4[6];
  v10 = (_QWORD *)((char *)a1 + v9);
  v11 = (_QWORD *)((char *)a2 + v9);
  *v10 = *v11;
  v10[1] = v11[1];
  sub_22DFDD448();
  swift_bridgeObjectRelease();
  if (a1 == a2)
    return a1;
  v12 = v4[7];
  v13 = (char *)a1 + v12;
  v14 = (char *)a2 + v12;
  sub_22DFB28FC((uint64_t)a1 + v12);
  v15 = type metadata accessor for HPTimer.Status(0);
  EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  switch(EnumCaseMultiPayload)
  {
    case 3:
      v18 = sub_22DFDCEC0();
      if (__swift_getEnumTagSinglePayload((uint64_t)v14, 1, v18))
      {
LABEL_7:
        v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_255DD7828);
        memcpy(v13, v14, *(_QWORD *)(*(_QWORD *)(v19 - 8) + 64));
        goto LABEL_12;
      }
LABEL_11:
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v18 - 8) + 16))(v13, v14, v18);
      __swift_storeEnumTagSinglePayload((uint64_t)v13, 0, 1, v18);
      goto LABEL_12;
    case 2:
      v18 = sub_22DFDCEC0();
      if (__swift_getEnumTagSinglePayload((uint64_t)v14, 1, v18))
        goto LABEL_7;
      goto LABEL_11;
    case 0:
      v17 = sub_22DFDCEC0();
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v17 - 8) + 16))(v13, v14, v17);
LABEL_12:
      swift_storeEnumTagMultiPayload();
      return a1;
  }
  memcpy(v13, v14, *(_QWORD *)(*(_QWORD *)(v15 - 8) + 64));
  return a1;
}

uint64_t sub_22DFB28FC(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata accessor for HPTimer.Status(0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

_QWORD *initializeWithTake for TimerOperationResponse(_QWORD *a1, _QWORD *a2)
{
  int *v4;
  uint64_t v5;
  char *v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  char *v11;
  uint64_t v12;
  int EnumCaseMultiPayload;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  *a1 = *a2;
  v4 = (int *)type metadata accessor for HPTimer(0);
  v5 = v4[5];
  v6 = (char *)a1 + v5;
  v7 = (char *)a2 + v5;
  v8 = sub_22DFDCEFC();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v8 - 8) + 32))(v6, v7, v8);
  *(_OWORD *)((char *)a1 + v4[6]) = *(_OWORD *)((char *)a2 + v4[6]);
  v9 = v4[7];
  v10 = (char *)a1 + v9;
  v11 = (char *)a2 + v9;
  v12 = type metadata accessor for HPTimer.Status(0);
  EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  switch(EnumCaseMultiPayload)
  {
    case 3:
      v15 = sub_22DFDCEC0();
      if (__swift_getEnumTagSinglePayload((uint64_t)v11, 1, v15))
        goto LABEL_8;
      goto LABEL_10;
    case 2:
      v15 = sub_22DFDCEC0();
      if (__swift_getEnumTagSinglePayload((uint64_t)v11, 1, v15))
      {
LABEL_8:
        v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_255DD7828);
        memcpy(v10, v11, *(_QWORD *)(*(_QWORD *)(v16 - 8) + 64));
        goto LABEL_11;
      }
LABEL_10:
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v15 - 8) + 32))(v10, v11, v15);
      __swift_storeEnumTagSinglePayload((uint64_t)v10, 0, 1, v15);
      goto LABEL_11;
    case 0:
      v14 = sub_22DFDCEC0();
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v14 - 8) + 32))(v10, v11, v14);
LABEL_11:
      swift_storeEnumTagMultiPayload();
      return a1;
  }
  memcpy(v10, v11, *(_QWORD *)(*(_QWORD *)(v12 - 8) + 64));
  return a1;
}

_QWORD *assignWithTake for TimerOperationResponse(_QWORD *a1, _QWORD *a2)
{
  int *v4;
  uint64_t v5;
  char *v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  char *v16;
  uint64_t v17;
  int EnumCaseMultiPayload;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;

  *a1 = *a2;
  v4 = (int *)type metadata accessor for HPTimer(0);
  v5 = v4[5];
  v6 = (char *)a1 + v5;
  v7 = (char *)a2 + v5;
  v8 = sub_22DFDCEFC();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v8 - 8) + 40))(v6, v7, v8);
  v9 = v4[6];
  v10 = (_QWORD *)((char *)a1 + v9);
  v11 = (_QWORD *)((char *)a2 + v9);
  v13 = *v11;
  v12 = v11[1];
  *v10 = v13;
  v10[1] = v12;
  swift_bridgeObjectRelease();
  if (a1 == a2)
    return a1;
  v14 = v4[7];
  v15 = (char *)a1 + v14;
  v16 = (char *)a2 + v14;
  sub_22DFB28FC((uint64_t)a1 + v14);
  v17 = type metadata accessor for HPTimer.Status(0);
  EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  switch(EnumCaseMultiPayload)
  {
    case 3:
      v20 = sub_22DFDCEC0();
      if (__swift_getEnumTagSinglePayload((uint64_t)v16, 1, v20))
      {
LABEL_7:
        v21 = __swift_instantiateConcreteTypeFromMangledName(&qword_255DD7828);
        memcpy(v15, v16, *(_QWORD *)(*(_QWORD *)(v21 - 8) + 64));
        goto LABEL_12;
      }
LABEL_11:
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v20 - 8) + 32))(v15, v16, v20);
      __swift_storeEnumTagSinglePayload((uint64_t)v15, 0, 1, v20);
      goto LABEL_12;
    case 2:
      v20 = sub_22DFDCEC0();
      if (__swift_getEnumTagSinglePayload((uint64_t)v16, 1, v20))
        goto LABEL_7;
      goto LABEL_11;
    case 0:
      v19 = sub_22DFDCEC0();
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v19 - 8) + 32))(v15, v16, v19);
LABEL_12:
      swift_storeEnumTagMultiPayload();
      return a1;
  }
  memcpy(v15, v16, *(_QWORD *)(*(_QWORD *)(v17 - 8) + 64));
  return a1;
}

uint64_t getEnumTagSinglePayload for TimerOperationResponse()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_22DFB2D64()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v2 = OUTLINED_FUNCTION_16_13();
  return OUTLINED_FUNCTION_12_20(v1, v0, v2);
}

uint64_t storeEnumTagSinglePayload for TimerOperationResponse()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_22DFB2D94()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  OUTLINED_FUNCTION_16_13();
  v0 = OUTLINED_FUNCTION_23_13();
  return OUTLINED_FUNCTION_11_20(v0, v1, v2, v3);
}

uint64_t sub_22DFB2DB0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_22DFB3A5C(a1, a2, a3, type metadata accessor for HPTimer);
}

uint64_t *initializeBufferWithCopyOfBuffer for TimerOperationRequest(uint64_t *a1, uint64_t *a2)
{
  uint64_t v4;
  int v5;
  uint64_t v6;
  char *v7;
  char *v8;
  int *v9;
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
  int EnumCaseMultiPayload;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;

  v4 = type metadata accessor for TimerOperationRequest.Payload(0);
  v5 = *(_DWORD *)(*(_QWORD *)(v4 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v24 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v24 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
    return a1;
  }
  *(_BYTE *)a1 = *(_BYTE *)a2;
  v6 = *(int *)(v4 + 20);
  v7 = (char *)a1 + v6;
  v8 = (char *)a2 + v6;
  *(uint64_t *)((char *)a1 + v6) = *(uint64_t *)((char *)a2 + v6);
  v9 = (int *)type metadata accessor for HPTimer(0);
  v10 = v9[5];
  v11 = &v7[v10];
  v12 = &v8[v10];
  v13 = sub_22DFDCEFC();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v13 - 8) + 16))(v11, v12, v13);
  v14 = v9[6];
  v15 = &v7[v14];
  v16 = &v8[v14];
  v17 = *((_QWORD *)v16 + 1);
  *(_QWORD *)v15 = *(_QWORD *)v16;
  *((_QWORD *)v15 + 1) = v17;
  v18 = v9[7];
  v19 = &v7[v18];
  v20 = &v8[v18];
  v21 = type metadata accessor for HPTimer.Status(0);
  sub_22DFDD448();
  EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  switch(EnumCaseMultiPayload)
  {
    case 3:
      v25 = sub_22DFDCEC0();
      if (__swift_getEnumTagSinglePayload((uint64_t)v20, 1, v25))
      {
LABEL_8:
        v26 = __swift_instantiateConcreteTypeFromMangledName(&qword_255DD7828);
        memcpy(v19, v20, *(_QWORD *)(*(_QWORD *)(v26 - 8) + 64));
        goto LABEL_13;
      }
LABEL_12:
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v25 - 8) + 16))(v19, v20, v25);
      __swift_storeEnumTagSinglePayload((uint64_t)v19, 0, 1, v25);
      goto LABEL_13;
    case 2:
      v25 = sub_22DFDCEC0();
      if (__swift_getEnumTagSinglePayload((uint64_t)v20, 1, v25))
        goto LABEL_8;
      goto LABEL_12;
    case 0:
      v23 = sub_22DFDCEC0();
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v23 - 8) + 16))(v19, v20, v23);
LABEL_13:
      swift_storeEnumTagMultiPayload();
      return a1;
  }
  memcpy(v19, v20, *(_QWORD *)(*(_QWORD *)(v21 - 8) + 64));
  return a1;
}

uint64_t destroy for TimerOperationRequest(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t result;
  uint64_t v7;

  v1 = a1 + *(int *)(type metadata accessor for TimerOperationRequest.Payload(0) + 20);
  v2 = type metadata accessor for HPTimer(0);
  v3 = v1 + *(int *)(v2 + 20);
  v4 = sub_22DFDCEFC();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  swift_bridgeObjectRelease();
  v5 = v1 + *(int *)(v2 + 28);
  type metadata accessor for HPTimer.Status(0);
  result = swift_getEnumCaseMultiPayload();
  if ((_DWORD)result == 3 || (_DWORD)result == 2)
  {
    v7 = sub_22DFDCEC0();
    result = __swift_getEnumTagSinglePayload(v5, 1, v7);
    if (!(_DWORD)result)
      return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 8))(v5, v7);
  }
  else if (!(_DWORD)result)
  {
    v7 = sub_22DFDCEC0();
    return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 8))(v5, v7);
  }
  return result;
}

_BYTE *initializeWithCopy for TimerOperationRequest(_BYTE *a1, _BYTE *a2)
{
  uint64_t v4;
  _BYTE *v5;
  _BYTE *v6;
  int *v7;
  uint64_t v8;
  _BYTE *v9;
  _BYTE *v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD *v13;
  _QWORD *v14;
  uint64_t v15;
  uint64_t v16;
  _BYTE *v17;
  _BYTE *v18;
  uint64_t v19;
  int EnumCaseMultiPayload;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;

  *a1 = *a2;
  v4 = *(int *)(type metadata accessor for TimerOperationRequest.Payload(0) + 20);
  v5 = &a1[v4];
  v6 = &a2[v4];
  *(_QWORD *)&a1[v4] = *(_QWORD *)&a2[v4];
  v7 = (int *)type metadata accessor for HPTimer(0);
  v8 = v7[5];
  v9 = &v5[v8];
  v10 = &v6[v8];
  v11 = sub_22DFDCEFC();
  (*(void (**)(_BYTE *, _BYTE *, uint64_t))(*(_QWORD *)(v11 - 8) + 16))(v9, v10, v11);
  v12 = v7[6];
  v13 = &v5[v12];
  v14 = &v6[v12];
  v15 = v14[1];
  *v13 = *v14;
  v13[1] = v15;
  v16 = v7[7];
  v17 = &v5[v16];
  v18 = &v6[v16];
  v19 = type metadata accessor for HPTimer.Status(0);
  sub_22DFDD448();
  EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  switch(EnumCaseMultiPayload)
  {
    case 3:
      v22 = sub_22DFDCEC0();
      if (__swift_getEnumTagSinglePayload((uint64_t)v18, 1, v22))
        goto LABEL_8;
      goto LABEL_10;
    case 2:
      v22 = sub_22DFDCEC0();
      if (__swift_getEnumTagSinglePayload((uint64_t)v18, 1, v22))
      {
LABEL_8:
        v23 = __swift_instantiateConcreteTypeFromMangledName(&qword_255DD7828);
        memcpy(v17, v18, *(_QWORD *)(*(_QWORD *)(v23 - 8) + 64));
        goto LABEL_11;
      }
LABEL_10:
      (*(void (**)(_BYTE *, _BYTE *, uint64_t))(*(_QWORD *)(v22 - 8) + 16))(v17, v18, v22);
      __swift_storeEnumTagSinglePayload((uint64_t)v17, 0, 1, v22);
      goto LABEL_11;
    case 0:
      v21 = sub_22DFDCEC0();
      (*(void (**)(_BYTE *, _BYTE *, uint64_t))(*(_QWORD *)(v21 - 8) + 16))(v17, v18, v21);
LABEL_11:
      swift_storeEnumTagMultiPayload();
      return a1;
  }
  memcpy(v17, v18, *(_QWORD *)(*(_QWORD *)(v19 - 8) + 64));
  return a1;
}

_BYTE *assignWithCopy for TimerOperationRequest(_BYTE *a1, _BYTE *a2)
{
  uint64_t v4;
  _BYTE *v5;
  _BYTE *v6;
  int *v7;
  uint64_t v8;
  _BYTE *v9;
  _BYTE *v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD *v13;
  _QWORD *v14;
  uint64_t v15;
  _BYTE *v16;
  _BYTE *v17;
  uint64_t v18;
  int EnumCaseMultiPayload;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;

  *a1 = *a2;
  v4 = *(int *)(type metadata accessor for TimerOperationRequest.Payload(0) + 20);
  v5 = &a1[v4];
  v6 = &a2[v4];
  *(_QWORD *)&a1[v4] = *(_QWORD *)&a2[v4];
  v7 = (int *)type metadata accessor for HPTimer(0);
  v8 = v7[5];
  v9 = &v5[v8];
  v10 = &v6[v8];
  v11 = sub_22DFDCEFC();
  (*(void (**)(_BYTE *, _BYTE *, uint64_t))(*(_QWORD *)(v11 - 8) + 24))(v9, v10, v11);
  v12 = v7[6];
  v13 = &v5[v12];
  v14 = &v6[v12];
  *v13 = *v14;
  v13[1] = v14[1];
  sub_22DFDD448();
  swift_bridgeObjectRelease();
  if (a1 == a2)
    return a1;
  v15 = v7[7];
  v16 = &v5[v15];
  v17 = &v6[v15];
  sub_22DFB28FC((uint64_t)&v5[v15]);
  v18 = type metadata accessor for HPTimer.Status(0);
  EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  switch(EnumCaseMultiPayload)
  {
    case 3:
      v21 = sub_22DFDCEC0();
      if (__swift_getEnumTagSinglePayload((uint64_t)v17, 1, v21))
      {
LABEL_7:
        v22 = __swift_instantiateConcreteTypeFromMangledName(&qword_255DD7828);
        memcpy(v16, v17, *(_QWORD *)(*(_QWORD *)(v22 - 8) + 64));
        goto LABEL_12;
      }
LABEL_11:
      (*(void (**)(_BYTE *, _BYTE *, uint64_t))(*(_QWORD *)(v21 - 8) + 16))(v16, v17, v21);
      __swift_storeEnumTagSinglePayload((uint64_t)v16, 0, 1, v21);
      goto LABEL_12;
    case 2:
      v21 = sub_22DFDCEC0();
      if (__swift_getEnumTagSinglePayload((uint64_t)v17, 1, v21))
        goto LABEL_7;
      goto LABEL_11;
    case 0:
      v20 = sub_22DFDCEC0();
      (*(void (**)(_BYTE *, _BYTE *, uint64_t))(*(_QWORD *)(v20 - 8) + 16))(v16, v17, v20);
LABEL_12:
      swift_storeEnumTagMultiPayload();
      return a1;
  }
  memcpy(v16, v17, *(_QWORD *)(*(_QWORD *)(v18 - 8) + 64));
  return a1;
}

_BYTE *initializeWithTake for TimerOperationRequest(_BYTE *a1, _BYTE *a2)
{
  uint64_t v4;
  _BYTE *v5;
  _BYTE *v6;
  int *v7;
  uint64_t v8;
  _BYTE *v9;
  _BYTE *v10;
  uint64_t v11;
  uint64_t v12;
  _BYTE *v13;
  _BYTE *v14;
  uint64_t v15;
  int EnumCaseMultiPayload;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;

  *a1 = *a2;
  v4 = *(int *)(type metadata accessor for TimerOperationRequest.Payload(0) + 20);
  v5 = &a1[v4];
  v6 = &a2[v4];
  *(_QWORD *)&a1[v4] = *(_QWORD *)&a2[v4];
  v7 = (int *)type metadata accessor for HPTimer(0);
  v8 = v7[5];
  v9 = &v5[v8];
  v10 = &v6[v8];
  v11 = sub_22DFDCEFC();
  (*(void (**)(_BYTE *, _BYTE *, uint64_t))(*(_QWORD *)(v11 - 8) + 32))(v9, v10, v11);
  *(_OWORD *)&v5[v7[6]] = *(_OWORD *)&v6[v7[6]];
  v12 = v7[7];
  v13 = &v5[v12];
  v14 = &v6[v12];
  v15 = type metadata accessor for HPTimer.Status(0);
  EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  switch(EnumCaseMultiPayload)
  {
    case 3:
      v18 = sub_22DFDCEC0();
      if (__swift_getEnumTagSinglePayload((uint64_t)v14, 1, v18))
        goto LABEL_8;
      goto LABEL_10;
    case 2:
      v18 = sub_22DFDCEC0();
      if (__swift_getEnumTagSinglePayload((uint64_t)v14, 1, v18))
      {
LABEL_8:
        v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_255DD7828);
        memcpy(v13, v14, *(_QWORD *)(*(_QWORD *)(v19 - 8) + 64));
        goto LABEL_11;
      }
LABEL_10:
      (*(void (**)(_BYTE *, _BYTE *, uint64_t))(*(_QWORD *)(v18 - 8) + 32))(v13, v14, v18);
      __swift_storeEnumTagSinglePayload((uint64_t)v13, 0, 1, v18);
      goto LABEL_11;
    case 0:
      v17 = sub_22DFDCEC0();
      (*(void (**)(_BYTE *, _BYTE *, uint64_t))(*(_QWORD *)(v17 - 8) + 32))(v13, v14, v17);
LABEL_11:
      swift_storeEnumTagMultiPayload();
      return a1;
  }
  memcpy(v13, v14, *(_QWORD *)(*(_QWORD *)(v15 - 8) + 64));
  return a1;
}

_BYTE *assignWithTake for TimerOperationRequest(_BYTE *a1, _BYTE *a2)
{
  uint64_t v4;
  _BYTE *v5;
  _BYTE *v6;
  int *v7;
  uint64_t v8;
  _BYTE *v9;
  _BYTE *v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD *v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  _BYTE *v18;
  _BYTE *v19;
  uint64_t v20;
  int EnumCaseMultiPayload;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;

  *a1 = *a2;
  v4 = *(int *)(type metadata accessor for TimerOperationRequest.Payload(0) + 20);
  v5 = &a1[v4];
  v6 = &a2[v4];
  *(_QWORD *)&a1[v4] = *(_QWORD *)&a2[v4];
  v7 = (int *)type metadata accessor for HPTimer(0);
  v8 = v7[5];
  v9 = &v5[v8];
  v10 = &v6[v8];
  v11 = sub_22DFDCEFC();
  (*(void (**)(_BYTE *, _BYTE *, uint64_t))(*(_QWORD *)(v11 - 8) + 40))(v9, v10, v11);
  v12 = v7[6];
  v13 = &v5[v12];
  v14 = (uint64_t *)&v6[v12];
  v16 = *v14;
  v15 = v14[1];
  *v13 = v16;
  v13[1] = v15;
  swift_bridgeObjectRelease();
  if (a1 == a2)
    return a1;
  v17 = v7[7];
  v18 = &v5[v17];
  v19 = &v6[v17];
  sub_22DFB28FC((uint64_t)&v5[v17]);
  v20 = type metadata accessor for HPTimer.Status(0);
  EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  switch(EnumCaseMultiPayload)
  {
    case 3:
      v23 = sub_22DFDCEC0();
      if (__swift_getEnumTagSinglePayload((uint64_t)v19, 1, v23))
      {
LABEL_7:
        v24 = __swift_instantiateConcreteTypeFromMangledName(&qword_255DD7828);
        memcpy(v18, v19, *(_QWORD *)(*(_QWORD *)(v24 - 8) + 64));
        goto LABEL_12;
      }
LABEL_11:
      (*(void (**)(_BYTE *, _BYTE *, uint64_t))(*(_QWORD *)(v23 - 8) + 32))(v18, v19, v23);
      __swift_storeEnumTagSinglePayload((uint64_t)v18, 0, 1, v23);
      goto LABEL_12;
    case 2:
      v23 = sub_22DFDCEC0();
      if (__swift_getEnumTagSinglePayload((uint64_t)v19, 1, v23))
        goto LABEL_7;
      goto LABEL_11;
    case 0:
      v22 = sub_22DFDCEC0();
      (*(void (**)(_BYTE *, _BYTE *, uint64_t))(*(_QWORD *)(v22 - 8) + 32))(v18, v19, v22);
LABEL_12:
      swift_storeEnumTagMultiPayload();
      return a1;
  }
  memcpy(v18, v19, *(_QWORD *)(*(_QWORD *)(v20 - 8) + 64));
  return a1;
}

uint64_t getEnumTagSinglePayload for TimerOperationRequest()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_22DFB3A04()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v2 = OUTLINED_FUNCTION_17_11();
  return OUTLINED_FUNCTION_12_20(v1, v0, v2);
}

uint64_t storeEnumTagSinglePayload for TimerOperationRequest()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_22DFB3A34()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  OUTLINED_FUNCTION_17_11();
  v0 = OUTLINED_FUNCTION_23_13();
  return OUTLINED_FUNCTION_11_20(v0, v1, v2, v3);
}

uint64_t sub_22DFB3A50(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_22DFB3A5C(a1, a2, a3, type metadata accessor for TimerOperationRequest.Payload);
}

uint64_t sub_22DFB3A5C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(uint64_t))
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

uint64_t *initializeBufferWithCopyOfBuffer for TimerOperationRequest.Payload(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t *v3;
  int v4;
  uint64_t v5;
  _BYTE *v6;
  char *v7;
  int *v8;
  uint64_t v9;
  _BYTE *v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD *v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  _BYTE *v18;
  char *v19;
  uint64_t v20;
  int EnumCaseMultiPayload;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;

  v3 = a1;
  v4 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v4 & 0x20000) != 0)
  {
    v23 = *a2;
    *v3 = *a2;
    v3 = (uint64_t *)(v23 + ((v4 + 16) & ~(unint64_t)v4));
    swift_retain();
    return v3;
  }
  *(_BYTE *)a1 = *(_BYTE *)a2;
  v5 = *(int *)(a3 + 20);
  v6 = (char *)a1 + v5;
  v7 = (char *)a2 + v5;
  *(uint64_t *)((char *)a1 + v5) = *(uint64_t *)((char *)a2 + v5);
  v8 = (int *)type metadata accessor for HPTimer(0);
  v9 = v8[5];
  v10 = &v6[v9];
  v11 = &v7[v9];
  v12 = sub_22DFDCEFC();
  (*(void (**)(_BYTE *, char *, uint64_t))(*(_QWORD *)(v12 - 8) + 16))(v10, v11, v12);
  v13 = v8[6];
  v14 = &v6[v13];
  v15 = &v7[v13];
  v16 = *((_QWORD *)v15 + 1);
  *v14 = *(_QWORD *)v15;
  v14[1] = v16;
  v17 = v8[7];
  v18 = &v6[v17];
  v19 = &v7[v17];
  v20 = type metadata accessor for HPTimer.Status(0);
  sub_22DFDD448();
  EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  switch(EnumCaseMultiPayload)
  {
    case 3:
      v24 = sub_22DFDCEC0();
      if (__swift_getEnumTagSinglePayload((uint64_t)v19, 1, v24))
      {
LABEL_8:
        v25 = __swift_instantiateConcreteTypeFromMangledName(&qword_255DD7828);
        memcpy(v18, v19, *(_QWORD *)(*(_QWORD *)(v25 - 8) + 64));
        goto LABEL_13;
      }
LABEL_12:
      (*(void (**)(_BYTE *, char *, uint64_t))(*(_QWORD *)(v24 - 8) + 16))(v18, v19, v24);
      __swift_storeEnumTagSinglePayload((uint64_t)v18, 0, 1, v24);
      goto LABEL_13;
    case 2:
      v24 = sub_22DFDCEC0();
      if (__swift_getEnumTagSinglePayload((uint64_t)v19, 1, v24))
        goto LABEL_8;
      goto LABEL_12;
    case 0:
      v22 = sub_22DFDCEC0();
      (*(void (**)(_BYTE *, char *, uint64_t))(*(_QWORD *)(v22 - 8) + 16))(v18, v19, v22);
LABEL_13:
      swift_storeEnumTagMultiPayload();
      return v3;
  }
  memcpy(v18, v19, *(_QWORD *)(*(_QWORD *)(v20 - 8) + 64));
  return v3;
}

uint64_t destroy for TimerOperationRequest.Payload(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t result;
  uint64_t v8;

  v2 = a1 + *(int *)(a2 + 20);
  v3 = type metadata accessor for HPTimer(0);
  v4 = v2 + *(int *)(v3 + 20);
  v5 = sub_22DFDCEFC();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(v4, v5);
  swift_bridgeObjectRelease();
  v6 = v2 + *(int *)(v3 + 28);
  type metadata accessor for HPTimer.Status(0);
  result = swift_getEnumCaseMultiPayload();
  if ((_DWORD)result == 3 || (_DWORD)result == 2)
  {
    v8 = sub_22DFDCEC0();
    result = __swift_getEnumTagSinglePayload(v6, 1, v8);
    if (!(_DWORD)result)
      return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 8))(v6, v8);
  }
  else if (!(_DWORD)result)
  {
    v8 = sub_22DFDCEC0();
    return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 8))(v6, v8);
  }
  return result;
}

_BYTE *initializeWithCopy for TimerOperationRequest.Payload(_BYTE *a1, _BYTE *a2, uint64_t a3)
{
  uint64_t v4;
  _BYTE *v5;
  _BYTE *v6;
  int *v7;
  uint64_t v8;
  _BYTE *v9;
  _BYTE *v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD *v13;
  _QWORD *v14;
  uint64_t v15;
  uint64_t v16;
  _BYTE *v17;
  _BYTE *v18;
  uint64_t v19;
  int EnumCaseMultiPayload;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;

  *a1 = *a2;
  v4 = *(int *)(a3 + 20);
  v5 = &a1[v4];
  v6 = &a2[v4];
  *(_QWORD *)&a1[v4] = *(_QWORD *)&a2[v4];
  v7 = (int *)type metadata accessor for HPTimer(0);
  v8 = v7[5];
  v9 = &v5[v8];
  v10 = &v6[v8];
  v11 = sub_22DFDCEFC();
  (*(void (**)(_BYTE *, _BYTE *, uint64_t))(*(_QWORD *)(v11 - 8) + 16))(v9, v10, v11);
  v12 = v7[6];
  v13 = &v5[v12];
  v14 = &v6[v12];
  v15 = v14[1];
  *v13 = *v14;
  v13[1] = v15;
  v16 = v7[7];
  v17 = &v5[v16];
  v18 = &v6[v16];
  v19 = type metadata accessor for HPTimer.Status(0);
  sub_22DFDD448();
  EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  switch(EnumCaseMultiPayload)
  {
    case 3:
      v22 = sub_22DFDCEC0();
      if (__swift_getEnumTagSinglePayload((uint64_t)v18, 1, v22))
        goto LABEL_8;
      goto LABEL_10;
    case 2:
      v22 = sub_22DFDCEC0();
      if (__swift_getEnumTagSinglePayload((uint64_t)v18, 1, v22))
      {
LABEL_8:
        v23 = __swift_instantiateConcreteTypeFromMangledName(&qword_255DD7828);
        memcpy(v17, v18, *(_QWORD *)(*(_QWORD *)(v23 - 8) + 64));
        goto LABEL_11;
      }
LABEL_10:
      (*(void (**)(_BYTE *, _BYTE *, uint64_t))(*(_QWORD *)(v22 - 8) + 16))(v17, v18, v22);
      __swift_storeEnumTagSinglePayload((uint64_t)v17, 0, 1, v22);
      goto LABEL_11;
    case 0:
      v21 = sub_22DFDCEC0();
      (*(void (**)(_BYTE *, _BYTE *, uint64_t))(*(_QWORD *)(v21 - 8) + 16))(v17, v18, v21);
LABEL_11:
      swift_storeEnumTagMultiPayload();
      return a1;
  }
  memcpy(v17, v18, *(_QWORD *)(*(_QWORD *)(v19 - 8) + 64));
  return a1;
}

_BYTE *assignWithCopy for TimerOperationRequest.Payload(_BYTE *a1, _BYTE *a2, uint64_t a3)
{
  uint64_t v5;
  _BYTE *v6;
  _BYTE *v7;
  int *v8;
  uint64_t v9;
  _BYTE *v10;
  _BYTE *v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD *v14;
  _QWORD *v15;
  uint64_t v16;
  _BYTE *v17;
  _BYTE *v18;
  uint64_t v19;
  int EnumCaseMultiPayload;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;

  *a1 = *a2;
  v5 = *(int *)(a3 + 20);
  v6 = &a1[v5];
  v7 = &a2[v5];
  *(_QWORD *)&a1[v5] = *(_QWORD *)&a2[v5];
  v8 = (int *)type metadata accessor for HPTimer(0);
  v9 = v8[5];
  v10 = &v6[v9];
  v11 = &v7[v9];
  v12 = sub_22DFDCEFC();
  (*(void (**)(_BYTE *, _BYTE *, uint64_t))(*(_QWORD *)(v12 - 8) + 24))(v10, v11, v12);
  v13 = v8[6];
  v14 = &v6[v13];
  v15 = &v7[v13];
  *v14 = *v15;
  v14[1] = v15[1];
  sub_22DFDD448();
  swift_bridgeObjectRelease();
  if (a1 == a2)
    return a1;
  v16 = v8[7];
  v17 = &v6[v16];
  v18 = &v7[v16];
  sub_22DFB28FC((uint64_t)&v6[v16]);
  v19 = type metadata accessor for HPTimer.Status(0);
  EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  switch(EnumCaseMultiPayload)
  {
    case 3:
      v22 = sub_22DFDCEC0();
      if (__swift_getEnumTagSinglePayload((uint64_t)v18, 1, v22))
      {
LABEL_7:
        v23 = __swift_instantiateConcreteTypeFromMangledName(&qword_255DD7828);
        memcpy(v17, v18, *(_QWORD *)(*(_QWORD *)(v23 - 8) + 64));
        goto LABEL_12;
      }
LABEL_11:
      (*(void (**)(_BYTE *, _BYTE *, uint64_t))(*(_QWORD *)(v22 - 8) + 16))(v17, v18, v22);
      __swift_storeEnumTagSinglePayload((uint64_t)v17, 0, 1, v22);
      goto LABEL_12;
    case 2:
      v22 = sub_22DFDCEC0();
      if (__swift_getEnumTagSinglePayload((uint64_t)v18, 1, v22))
        goto LABEL_7;
      goto LABEL_11;
    case 0:
      v21 = sub_22DFDCEC0();
      (*(void (**)(_BYTE *, _BYTE *, uint64_t))(*(_QWORD *)(v21 - 8) + 16))(v17, v18, v21);
LABEL_12:
      swift_storeEnumTagMultiPayload();
      return a1;
  }
  memcpy(v17, v18, *(_QWORD *)(*(_QWORD *)(v19 - 8) + 64));
  return a1;
}

_BYTE *initializeWithTake for TimerOperationRequest.Payload(_BYTE *a1, _BYTE *a2, uint64_t a3)
{
  uint64_t v4;
  _BYTE *v5;
  _BYTE *v6;
  int *v7;
  uint64_t v8;
  _BYTE *v9;
  _BYTE *v10;
  uint64_t v11;
  uint64_t v12;
  _BYTE *v13;
  _BYTE *v14;
  uint64_t v15;
  int EnumCaseMultiPayload;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;

  *a1 = *a2;
  v4 = *(int *)(a3 + 20);
  v5 = &a1[v4];
  v6 = &a2[v4];
  *(_QWORD *)&a1[v4] = *(_QWORD *)&a2[v4];
  v7 = (int *)type metadata accessor for HPTimer(0);
  v8 = v7[5];
  v9 = &v5[v8];
  v10 = &v6[v8];
  v11 = sub_22DFDCEFC();
  (*(void (**)(_BYTE *, _BYTE *, uint64_t))(*(_QWORD *)(v11 - 8) + 32))(v9, v10, v11);
  *(_OWORD *)&v5[v7[6]] = *(_OWORD *)&v6[v7[6]];
  v12 = v7[7];
  v13 = &v5[v12];
  v14 = &v6[v12];
  v15 = type metadata accessor for HPTimer.Status(0);
  EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  switch(EnumCaseMultiPayload)
  {
    case 3:
      v18 = sub_22DFDCEC0();
      if (__swift_getEnumTagSinglePayload((uint64_t)v14, 1, v18))
        goto LABEL_8;
      goto LABEL_10;
    case 2:
      v18 = sub_22DFDCEC0();
      if (__swift_getEnumTagSinglePayload((uint64_t)v14, 1, v18))
      {
LABEL_8:
        v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_255DD7828);
        memcpy(v13, v14, *(_QWORD *)(*(_QWORD *)(v19 - 8) + 64));
        goto LABEL_11;
      }
LABEL_10:
      (*(void (**)(_BYTE *, _BYTE *, uint64_t))(*(_QWORD *)(v18 - 8) + 32))(v13, v14, v18);
      __swift_storeEnumTagSinglePayload((uint64_t)v13, 0, 1, v18);
      goto LABEL_11;
    case 0:
      v17 = sub_22DFDCEC0();
      (*(void (**)(_BYTE *, _BYTE *, uint64_t))(*(_QWORD *)(v17 - 8) + 32))(v13, v14, v17);
LABEL_11:
      swift_storeEnumTagMultiPayload();
      return a1;
  }
  memcpy(v13, v14, *(_QWORD *)(*(_QWORD *)(v15 - 8) + 64));
  return a1;
}

_BYTE *assignWithTake for TimerOperationRequest.Payload(_BYTE *a1, _BYTE *a2, uint64_t a3)
{
  uint64_t v5;
  _BYTE *v6;
  _BYTE *v7;
  int *v8;
  uint64_t v9;
  _BYTE *v10;
  _BYTE *v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD *v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  _BYTE *v19;
  _BYTE *v20;
  uint64_t v21;
  int EnumCaseMultiPayload;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;

  *a1 = *a2;
  v5 = *(int *)(a3 + 20);
  v6 = &a1[v5];
  v7 = &a2[v5];
  *(_QWORD *)&a1[v5] = *(_QWORD *)&a2[v5];
  v8 = (int *)type metadata accessor for HPTimer(0);
  v9 = v8[5];
  v10 = &v6[v9];
  v11 = &v7[v9];
  v12 = sub_22DFDCEFC();
  (*(void (**)(_BYTE *, _BYTE *, uint64_t))(*(_QWORD *)(v12 - 8) + 40))(v10, v11, v12);
  v13 = v8[6];
  v14 = &v6[v13];
  v15 = (uint64_t *)&v7[v13];
  v17 = *v15;
  v16 = v15[1];
  *v14 = v17;
  v14[1] = v16;
  swift_bridgeObjectRelease();
  if (a1 == a2)
    return a1;
  v18 = v8[7];
  v19 = &v6[v18];
  v20 = &v7[v18];
  sub_22DFB28FC((uint64_t)&v6[v18]);
  v21 = type metadata accessor for HPTimer.Status(0);
  EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  switch(EnumCaseMultiPayload)
  {
    case 3:
      v24 = sub_22DFDCEC0();
      if (__swift_getEnumTagSinglePayload((uint64_t)v20, 1, v24))
      {
LABEL_7:
        v25 = __swift_instantiateConcreteTypeFromMangledName(&qword_255DD7828);
        memcpy(v19, v20, *(_QWORD *)(*(_QWORD *)(v25 - 8) + 64));
        goto LABEL_12;
      }
LABEL_11:
      (*(void (**)(_BYTE *, _BYTE *, uint64_t))(*(_QWORD *)(v24 - 8) + 32))(v19, v20, v24);
      __swift_storeEnumTagSinglePayload((uint64_t)v19, 0, 1, v24);
      goto LABEL_12;
    case 2:
      v24 = sub_22DFDCEC0();
      if (__swift_getEnumTagSinglePayload((uint64_t)v20, 1, v24))
        goto LABEL_7;
      goto LABEL_11;
    case 0:
      v23 = sub_22DFDCEC0();
      (*(void (**)(_BYTE *, _BYTE *, uint64_t))(*(_QWORD *)(v23 - 8) + 32))(v19, v20, v23);
LABEL_12:
      swift_storeEnumTagMultiPayload();
      return a1;
  }
  memcpy(v19, v20, *(_QWORD *)(*(_QWORD *)(v21 - 8) + 64));
  return a1;
}

uint64_t getEnumTagSinglePayload for TimerOperationRequest.Payload()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_22DFB46CC(unsigned __int8 *a1, uint64_t a2, uint64_t a3)
{
  unsigned int v4;
  uint64_t v8;

  if ((_DWORD)a2 == 252)
  {
    v4 = *a1;
    if (v4 >= 4)
      return v4 - 3;
    else
      return 0;
  }
  else
  {
    v8 = type metadata accessor for HPTimer(0);
    return __swift_getEnumTagSinglePayload((uint64_t)&a1[*(int *)(a3 + 20)], a2, v8);
  }
}

uint64_t storeEnumTagSinglePayload for TimerOperationRequest.Payload()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

_BYTE *sub_22DFB4744(_BYTE *result, uint64_t a2, int a3, uint64_t a4)
{
  _BYTE *v5;
  uint64_t v7;

  v5 = result;
  if (a3 == 252)
  {
    *result = a2 + 3;
  }
  else
  {
    v7 = type metadata accessor for HPTimer(0);
    return (_BYTE *)__swift_storeEnumTagSinglePayload((uint64_t)&v5[*(int *)(a4 + 20)], a2, a2, v7);
  }
  return result;
}

uint64_t sub_22DFB47AC()
{
  uint64_t result;
  unint64_t v1;

  result = type metadata accessor for HPTimer(319);
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

ValueMetadata *type metadata accessor for TimerOperationRequest.CodingKeys()
{
  return &type metadata for TimerOperationRequest.CodingKeys;
}

uint64_t storeEnumTagSinglePayload for TimerOperationRequest.Payload.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_22DFB4880 + 4 * byte_22DFE8A95[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_22DFB48B4 + 4 * asc_22DFE8A90[v4]))();
}

uint64_t sub_22DFB48B4(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_22DFB48BC(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x22DFB48C4);
  return result;
}

uint64_t sub_22DFB48D0(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x22DFB48D8);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_22DFB48DC(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_22DFB48E4(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for TimerOperationRequest.Payload.CodingKeys()
{
  return &type metadata for TimerOperationRequest.Payload.CodingKeys;
}

uint64_t _s15HomePodSettings21TimerOperationRequestV10CodingKeysOwst_0(uint64_t a1, int a2, int a3)
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
    return ((uint64_t (*)(void))((char *)sub_22DFB4940 + 4 * byte_22DFE8A9A[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_22DFB4960 + 4 * byte_22DFE8A9F[v4]))();
}

_BYTE *sub_22DFB4940(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_22DFB4960(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_22DFB4968(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_22DFB4970(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_22DFB4978(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_22DFB4980(_DWORD *result)
{
  *result = 0;
  return result;
}

ValueMetadata *type metadata accessor for TimerOperationResponse.CodingKeys()
{
  return &type metadata for TimerOperationResponse.CodingKeys;
}

unint64_t sub_22DFB49A0()
{
  unint64_t result;

  result = qword_255DDC070;
  if (!qword_255DDC070)
  {
    result = MEMORY[0x22E323AEC](&unk_22DFE8DC4, &type metadata for TimerOperationResponse.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_255DDC070);
  }
  return result;
}

unint64_t sub_22DFB49E0()
{
  unint64_t result;

  result = qword_255DDC078;
  if (!qword_255DDC078)
  {
    result = MEMORY[0x22E323AEC](&unk_22DFE8E7C, &type metadata for TimerOperationRequest.Payload.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_255DDC078);
  }
  return result;
}

unint64_t sub_22DFB4A20()
{
  unint64_t result;

  result = qword_255DDC080;
  if (!qword_255DDC080)
  {
    result = MEMORY[0x22E323AEC](&unk_22DFE8F34, &type metadata for TimerOperationRequest.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_255DDC080);
  }
  return result;
}

unint64_t sub_22DFB4A60()
{
  unint64_t result;

  result = qword_255DDC088;
  if (!qword_255DDC088)
  {
    result = MEMORY[0x22E323AEC](&unk_22DFE8EA4, &type metadata for TimerOperationRequest.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_255DDC088);
  }
  return result;
}

unint64_t sub_22DFB4AA0()
{
  unint64_t result;

  result = qword_255DDC090;
  if (!qword_255DDC090)
  {
    result = MEMORY[0x22E323AEC](&unk_22DFE8ECC, &type metadata for TimerOperationRequest.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_255DDC090);
  }
  return result;
}

unint64_t sub_22DFB4AE0()
{
  unint64_t result;

  result = qword_255DDC098;
  if (!qword_255DDC098)
  {
    result = MEMORY[0x22E323AEC](&unk_22DFE8DEC, &type metadata for TimerOperationRequest.Payload.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_255DDC098);
  }
  return result;
}

unint64_t sub_22DFB4B20()
{
  unint64_t result;

  result = qword_255DDC0A0;
  if (!qword_255DDC0A0)
  {
    result = MEMORY[0x22E323AEC](&unk_22DFE8E14, &type metadata for TimerOperationRequest.Payload.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_255DDC0A0);
  }
  return result;
}

unint64_t sub_22DFB4B60()
{
  unint64_t result;

  result = qword_255DDC0A8;
  if (!qword_255DDC0A8)
  {
    result = MEMORY[0x22E323AEC](&unk_22DFE8D34, &type metadata for TimerOperationResponse.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_255DDC0A8);
  }
  return result;
}

unint64_t sub_22DFB4BA0()
{
  unint64_t result;

  result = qword_255DDC0B0[0];
  if (!qword_255DDC0B0[0])
  {
    result = MEMORY[0x22E323AEC](&unk_22DFE8D5C, &type metadata for TimerOperationResponse.CodingKeys);
    atomic_store(result, qword_255DDC0B0);
  }
  return result;
}

uint64_t OUTLINED_FUNCTION_2_25()
{
  return 0;
}

uint64_t OUTLINED_FUNCTION_4_25()
{
  return sub_22DFDDE74();
}

uint64_t OUTLINED_FUNCTION_5_23()
{
  return sub_22DFDDEEC();
}

uint64_t OUTLINED_FUNCTION_7_23()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 88) + 8))(v1, v0);
}

uint64_t OUTLINED_FUNCTION_8_24()
{
  return sub_22DFDE060();
}

_QWORD *OUTLINED_FUNCTION_9_19()
{
  _QWORD *v0;

  return __swift_project_boxed_opaque_existential_1(v0, v0[3]);
}

uint64_t OUTLINED_FUNCTION_10_20()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 8))(v1, v0);
}

uint64_t OUTLINED_FUNCTION_11_20(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_storeEnumTagSinglePayload(a1, a2, a3, a4);
}

uint64_t OUTLINED_FUNCTION_12_20(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return __swift_getEnumTagSinglePayload(a1, a2, a3);
}

void OUTLINED_FUNCTION_13_20(uint64_t a1@<X8>, uint64_t a2)
{
  uint64_t v2;

  *(_QWORD *)(v2 - 72) = (char *)&a2 - ((a1 + 15) & 0xFFFFFFFFFFFFFFF0);
}

uint64_t OUTLINED_FUNCTION_15_18(uint64_t result)
{
  uint64_t v1;

  *(_QWORD *)(v1 - 88) = *(_QWORD *)(result - 8);
  return result;
}

uint64_t OUTLINED_FUNCTION_16_13()
{
  return type metadata accessor for HPTimer(0);
}

uint64_t OUTLINED_FUNCTION_17_11()
{
  return type metadata accessor for TimerOperationRequest.Payload(0);
}

uint64_t OUTLINED_FUNCTION_18_14()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(v0 + 8))(v2, v1);
}

uint64_t OUTLINED_FUNCTION_19_14()
{
  return type metadata accessor for TimerOperationRequest.Payload(0);
}

uint64_t OUTLINED_FUNCTION_20_10()
{
  return type metadata accessor for HPTimer(0);
}

uint64_t OUTLINED_FUNCTION_21_11(uint64_t a1, uint64_t a2, uint64_t (*a3)(_QWORD))
{
  return a3(0);
}

void OUTLINED_FUNCTION_22_13(uint64_t a1, uint64_t a2, uint64_t (*a3)(_QWORD))
{
  uint64_t v3;
  uint64_t v4;

  sub_22DFB1638(v3, *(_QWORD *)(v4 - 96), a3);
}

uint64_t OUTLINED_FUNCTION_23_13()
{
  uint64_t v0;

  return v0;
}

void OUTLINED_FUNCTION_24_14(uint64_t a1, uint64_t a2, uint64_t (*a3)(_QWORD))
{
  uint64_t v3;
  uint64_t v4;

  sub_22DFB1638(*(_QWORD *)(v4 - 72), v3, a3);
}

uint64_t OUTLINED_FUNCTION_26_9()
{
  return sub_22DFDDE74();
}

uint64_t OUTLINED_FUNCTION_30_11@<X0>(uint64_t (*a1)(uint64_t, uint64_t)@<X8>)
{
  uint64_t v1;
  uint64_t v2;

  return a1(v1, v2);
}

uint64_t sub_22DFB4D98()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t (*v4)(void);

  v1 = (_QWORD *)OUTLINED_FUNCTION_33();
  *(_QWORD *)(v0 + 16) = v1;
  v2 = OUTLINED_FUNCTION_109(v1, (uint64_t)sub_22DF3518C);
  return OUTLINED_FUNCTION_126(v2, v3, v4);
}

uint64_t sub_22DFB4DD8()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t (*v4)(void);

  v1 = (_QWORD *)OUTLINED_FUNCTION_33();
  *(_QWORD *)(v0 + 16) = v1;
  v2 = OUTLINED_FUNCTION_109(v1, (uint64_t)sub_22DF3403C);
  return OUTLINED_FUNCTION_126(v2, v3, v4);
}

uint64_t sub_22DFB4E18(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  _QWORD *v7;
  uint64_t (*v9)(uint64_t, uint64_t, uint64_t);

  v7 = (_QWORD *)OUTLINED_FUNCTION_93();
  *(_QWORD *)(v3 + 16) = v7;
  *v7 = v3;
  v7[1] = sub_22DF53BD0;
  return v9(a1, a2, a3);
}

uint64_t sub_22DFB4E80(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v7;
  _QWORD *v15;
  uint64_t (*v17)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t);

  v15 = (_QWORD *)OUTLINED_FUNCTION_93();
  *(_QWORD *)(v7 + 16) = v15;
  *v15 = v7;
  v15[1] = sub_22DF3403C;
  return v17(a1, a2, a3, a4, a5, a6, a7);
}

uint64_t sub_22DFB4F1C()
{
  return swift_initClassMetadata2();
}

void sub_22DFB4F68()
{
  swift_allocObject();
  sub_22DFB52C0();
}

uint64_t sub_22DFB4F8C()
{
  uint64_t v0;

  return v0;
}

uint64_t sub_22DFB4F9C()
{
  sub_22DFDD4C0();
  return sub_22DFDD4C0();
}

uint64_t sub_22DFB4FE8()
{
  if ((sub_22DFDD4F0() & 1) != 0)
    type metadata accessor for TargetedObserverStore.Tuple();
  return 0;
}

uint64_t sub_22DFB5078()
{
  sub_22DFDE000();
  sub_22DFB4F9C();
  return sub_22DFDE030();
}

void sub_22DFB50BC(uint64_t a1@<X0>, uint64_t a2@<X2>, uint64_t a3@<X8>)
{
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(a2 - 8) + 32))(a3, a1);
  type metadata accessor for TargetedObserverStore.Tuple();
}

uint64_t sub_22DFB5114(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v1 - 8) + 32))(v3 + *(int *)(a1 + 52), v2, v1);
}

uint64_t sub_22DFB5150()
{
  sub_22DFDE000();
  sub_22DFB4F9C();
  return sub_22DFDE030();
}

uint64_t sub_22DFB5190()
{
  return sub_22DFB4FE8();
}

void sub_22DFB51A0()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_19_15();
  OUTLINED_FUNCTION_33_1();
  type metadata accessor for TargetedObserverStore.Tuple();
}

void sub_22DFB5208()
{
  OUTLINED_FUNCTION_233_0();
}

void sub_22DFB5218()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v2 = sub_22DFDD9AC();
  v3 = MEMORY[0x22E323AEC](MEMORY[0x24BEE1728], v2);
  sub_22DFAA584((void (*)(char *, char *))sub_22DFB6308, v1, v2, v0, MEMORY[0x24BEE4078], v3, MEMORY[0x24BEE40A8], v4);
  swift_release();
  OUTLINED_FUNCTION_149();
  OUTLINED_FUNCTION_8_25();
  OUTLINED_FUNCTION_233_0();
}

uint64_t sub_22DFB529C()
{
  return OUTLINED_FUNCTION_2_26();
}

void sub_22DFB52C0()
{
  swift_defaultActor_initialize();
  type metadata accessor for TargetedObserverStore.Tuple();
}

uint64_t sub_22DFB52F0(uint64_t a1)
{
  uint64_t v1;

  MEMORY[0x22E323AEC](&unk_22DFE9138, a1);
  *(_QWORD *)(v1 + 112) = sub_22DFDD3F4();
  return v1;
}

void sub_22DFB5328()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_33_1();
  type metadata accessor for TargetedObserverStore.Tuple();
}

void sub_22DFB5388()
{
  OUTLINED_FUNCTION_24_6();
}

void sub_22DFB5398()
{
  OUTLINED_FUNCTION_3_26();
  OUTLINED_FUNCTION_19_15();
  OUTLINED_FUNCTION_11_21();
  OUTLINED_FUNCTION_24_6();
}

void sub_22DFB53D4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_10_21((void (*)(char *, char *))sub_22DFB6308, a2, a3, a4, MEMORY[0x24BEE4078], a1, MEMORY[0x24BEE40A8], a8);
  OUTLINED_FUNCTION_15_19();
  OUTLINED_FUNCTION_149();
  OUTLINED_FUNCTION_8_25();
  OUTLINED_FUNCTION_233_0();
}

void sub_22DFB5414()
{
  OUTLINED_FUNCTION_2_26();
  OUTLINED_FUNCTION_6_24();
}

void sub_22DFB5428()
{
  type metadata accessor for TargetedObserverStore.Tuple();
}

uint64_t sub_22DFB5468()
{
  return sub_22DFDD4F0() & 1;
}

void sub_22DFB54A4()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_33_1();
  type metadata accessor for TargetedObserverStore.Tuple();
}

void sub_22DFB5504()
{
  OUTLINED_FUNCTION_24_6();
}

void sub_22DFB5514()
{
  OUTLINED_FUNCTION_3_26();
  OUTLINED_FUNCTION_19_15();
  OUTLINED_FUNCTION_11_21();
  OUTLINED_FUNCTION_24_6();
}

void sub_22DFB5550(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_10_21((void (*)(char *, char *))sub_22DFB6308, a2, a3, a4, MEMORY[0x24BEE4078], a1, MEMORY[0x24BEE40A8], a8);
  OUTLINED_FUNCTION_15_19();
  OUTLINED_FUNCTION_149();
  OUTLINED_FUNCTION_8_25();
  OUTLINED_FUNCTION_233_0();
}

void sub_22DFB5590()
{
  OUTLINED_FUNCTION_2_26();
  OUTLINED_FUNCTION_6_24();
}

void sub_22DFB55A4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  OUTLINED_FUNCTION_3_2();
  MEMORY[0x24BDAC7A8](v0);
  OUTLINED_FUNCTION_80();
  OUTLINED_FUNCTION_3_2();
  MEMORY[0x24BDAC7A8](v1);
  OUTLINED_FUNCTION_80();
  OUTLINED_FUNCTION_17_12(*(_QWORD *)(v2 + 96));
}

void sub_22DFB562C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;

  *(_QWORD *)(v13 - 152) = *(_QWORD *)(a1 - 8);
  OUTLINED_FUNCTION_3_2();
  v16 = MEMORY[0x24BDAC7A8](v15);
  v18 = (char *)&a9 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v16);
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_33_1();
  MEMORY[0x22E323AEC](&unk_22DFE9138, a1);
  *(_DWORD *)(v13 - 196) = sub_22DFDD97C();
  OUTLINED_FUNCTION_46();
  (*(void (**)(uint64_t, _QWORD, uint64_t))(*(_QWORD *)(v13 - 192) + 16))(v12, *(_QWORD *)(v13 - 160), v11);
  (*(void (**)(uint64_t, _QWORD, uint64_t))(*(_QWORD *)(v13 - 168) + 16))(v10, *(_QWORD *)(v13 - 144), v9);
  sub_22DFB50BC(v12, v11, (uint64_t)v18);
}

void sub_22DFB5708()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  OUTLINED_FUNCTION_18();
  sub_22DFDD9AC();
  sub_22DFDD964();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 152) + 8))(v1, v0);
  swift_endAccess();
  OUTLINED_FUNCTION_4_1();
}

void sub_22DFB5780()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  OUTLINED_FUNCTION_3_2();
  MEMORY[0x24BDAC7A8](v0);
  OUTLINED_FUNCTION_80();
  MEMORY[0x24BDAC7A8](v1);
  OUTLINED_FUNCTION_80();
  OUTLINED_FUNCTION_17_12(*(_QWORD *)(v2 + 96));
}

void sub_22DFB5810(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
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
  void (*v20)(uint64_t, uint64_t, uint64_t);
  uint64_t v21;

  *(_QWORD *)(v14 - 152) = *(_QWORD *)(a1 - 8);
  MEMORY[0x24BDAC7A8](a1);
  v16 = (char *)&a9 - v15;
  v17 = sub_22DFDDB2C();
  *(_QWORD *)(v14 - 136) = *(_QWORD *)(v17 - 8);
  *(_QWORD *)(v14 - 128) = v17;
  OUTLINED_FUNCTION_3_2();
  v19 = MEMORY[0x24BDAC7A8](v18);
  MEMORY[0x24BDAC7A8](v19);
  v20 = *(void (**)(uint64_t, uint64_t, uint64_t))(v10 + 16);
  v21 = *(_QWORD *)(v14 - 160);
  *(_QWORD *)(v14 - 160) = v20;
  v20(v11, v21, v12);
  (*(void (**)(uint64_t, _QWORD, uint64_t))(*(_QWORD *)(v14 - 168) + 16))(v9, *(_QWORD *)(v14 - 144), v13);
  sub_22DFB50BC(v11, v12, (uint64_t)v16);
}

void sub_22DFB58E0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void (*v6)(uint64_t, uint64_t);
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  int EnumTagSinglePayload;
  uint64_t v11;
  uint64_t v12;

  OUTLINED_FUNCTION_18();
  MEMORY[0x22E323AEC](&unk_22DFE9138, v0);
  sub_22DFDD9AC();
  sub_22DFDD970();
  v6 = *(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 152) + 8);
  v6(v4, v0);
  swift_endAccess();
  if (__swift_getEnumTagSinglePayload(v3, 1, v0) != 1)
  {
    OUTLINED_FUNCTION_33_1();
    sub_22DFDD97C();
    OUTLINED_FUNCTION_46();
  }
  v7 = *(_QWORD *)(v5 - 136);
  v8 = v3;
  v9 = *(_QWORD *)(v5 - 128);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v7 + 32))(v2, v8, v9);
  EnumTagSinglePayload = __swift_getEnumTagSinglePayload(v2, 1, v0);
  v11 = *(_QWORD *)(v5 - 120);
  if (EnumTagSinglePayload == 1)
  {
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v2, v9);
    v12 = 1;
  }
  else
  {
    (*(void (**)(_QWORD, uint64_t, uint64_t))(v5 - 160))(*(_QWORD *)(v5 - 120), v2, v1);
    v6(v2, v0);
    v12 = 0;
  }
  __swift_storeEnumTagSinglePayload(v11, v12, 1, v1);
  OUTLINED_FUNCTION_4_1();
}

void sub_22DFB5A14()
{
  OUTLINED_FUNCTION_8();
  sub_22DFDD448();
  type metadata accessor for TargetedObserverStore.Tuple();
}

BOOL sub_22DFB5A7C(uint64_t a1)
{
  uint64_t v1;
  char v2;
  BOOL v3;

  MEMORY[0x22E323AEC](&unk_22DFE9138, a1);
  sub_22DFDD958();
  OUTLINED_FUNCTION_18();
  v1 = sub_22DFDD9AC();
  sub_22DFDD9A0();
  swift_endAccess();
  OUTLINED_FUNCTION_33_1();
  v2 = sub_22DFDD97C();
  OUTLINED_FUNCTION_46();
  if ((v2 & 1) != 0)
  {
    MEMORY[0x22E323AEC](MEMORY[0x24BEE1728], v1);
    v3 = sub_22DFB1358();
  }
  else
  {
    v3 = 0;
  }
  sub_22DFDD940();
  OUTLINED_FUNCTION_149();
  return v3;
}

void type metadata accessor for TargetedObserverStore()
{
  JUMPOUT(0x22E323A68);
}

uint64_t sub_22DFB5B88()
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

uint64_t *sub_22DFB5C14(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  uint64_t v10;
  int v11;
  uint64_t v12;
  int v13;
  uint64_t v16;
  uint64_t v17;

  v4 = a1;
  v5 = *(_QWORD *)(a3 + 24);
  v6 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  v7 = *(_QWORD *)(v5 - 8);
  v8 = *(_DWORD *)(v7 + 80);
  v9 = v8;
  v10 = *(_QWORD *)(v6 + 64) + v8;
  v11 = *(_DWORD *)(v6 + 80) | v8;
  v12 = v11;
  v13 = v11 & 0x100000;
  if (v12 > 7 || v13 != 0 || (v10 & (unint64_t)~v9) + *(_QWORD *)(v7 + 64) > 0x18)
  {
    v16 = *a2;
    *v4 = *a2;
    v4 = (uint64_t *)(v16 + ((v12 + 16) & ~v12));
    swift_retain();
  }
  else
  {
    v17 = ~v9;
    (*(void (**)(uint64_t *, uint64_t *))(v6 + 16))(a1, a2);
    (*(void (**)(unint64_t, unint64_t, uint64_t))(v7 + 16))(((unint64_t)v4 + v10) & v17, ((unint64_t)a2 + v10) & v17, v5);
  }
  return v4;
}

uint64_t sub_22DFB5CE4(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = *(_QWORD *)(*(_QWORD *)(a2 + 16) - 8);
  (*(void (**)(void))(v4 + 8))();
  return (*(uint64_t (**)(unint64_t))(*(_QWORD *)(*(_QWORD *)(a2 + 24) - 8) + 8))((*(_QWORD *)(v4 + 64) + a1 + *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a2 + 24) - 8) + 80)) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a2 + 24) - 8) + 80));
}

uint64_t sub_22DFB5D3C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;

  v6 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  (*(void (**)(void))(v6 + 16))();
  v7 = *(_QWORD *)(*(_QWORD *)(a3 + 24) - 8);
  (*(void (**)(unint64_t, unint64_t))(v7 + 16))((*(_QWORD *)(v6 + 64) + *(unsigned __int8 *)(v7 + 80) + a1) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80), (*(_QWORD *)(v6 + 64) + *(unsigned __int8 *)(v7 + 80) + a2) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80));
  return a1;
}

uint64_t sub_22DFB5DA8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;

  v6 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  (*(void (**)(void))(v6 + 24))();
  v7 = *(_QWORD *)(*(_QWORD *)(a3 + 24) - 8);
  (*(void (**)(unint64_t, unint64_t))(v7 + 24))((*(_QWORD *)(v6 + 64) + *(unsigned __int8 *)(v7 + 80) + a1) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80), (*(_QWORD *)(v6 + 64) + *(unsigned __int8 *)(v7 + 80) + a2) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80));
  return a1;
}

uint64_t sub_22DFB5E14(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;

  v6 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  (*(void (**)(void))(v6 + 32))();
  v7 = *(_QWORD *)(*(_QWORD *)(a3 + 24) - 8);
  (*(void (**)(unint64_t, unint64_t))(v7 + 32))((*(_QWORD *)(v6 + 64) + *(unsigned __int8 *)(v7 + 80) + a1) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80), (*(_QWORD *)(v6 + 64) + *(unsigned __int8 *)(v7 + 80) + a2) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80));
  return a1;
}

uint64_t sub_22DFB5E80(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;

  v6 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  (*(void (**)(void))(v6 + 40))();
  v7 = *(_QWORD *)(*(_QWORD *)(a3 + 24) - 8);
  (*(void (**)(unint64_t, unint64_t))(v7 + 40))((*(_QWORD *)(v6 + 64) + *(unsigned __int8 *)(v7 + 80) + a1) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80), (*(_QWORD *)(v6 + 64) + *(unsigned __int8 *)(v7 + 80) + a2) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80));
  return a1;
}

uint64_t sub_22DFB5EEC(uint64_t a1, unsigned int a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unsigned int v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unsigned int v15;
  uint64_t v16;
  char v17;
  int v18;
  unsigned int v19;
  int v20;
  int v21;

  v5 = *(_QWORD *)(a3 + 16);
  v6 = *(_QWORD *)(a3 + 24);
  v7 = *(_QWORD *)(v5 - 8);
  v8 = *(unsigned int *)(v7 + 84);
  v9 = *(_QWORD *)(v6 - 8);
  v10 = *(unsigned int *)(v9 + 84);
  if (v10 <= v8)
    v11 = *(_DWORD *)(v7 + 84);
  else
    v11 = *(_DWORD *)(v9 + 84);
  if (!a2)
    return 0;
  v12 = *(_QWORD *)(v7 + 64);
  v13 = *(unsigned __int8 *)(v9 + 80);
  v14 = v12 + v13;
  v15 = a2 - v11;
  if (a2 <= v11)
    goto LABEL_23;
  v16 = (v14 & ~v13) + *(_QWORD *)(v9 + 64);
  v17 = 8 * v16;
  if (v16 <= 3)
  {
    v19 = ((v15 + ~(-1 << v17)) >> v17) + 1;
    if (HIWORD(v19))
    {
      v18 = *(_DWORD *)(a1 + v16);
      if (!v18)
        goto LABEL_23;
      goto LABEL_14;
    }
    if (v19 > 0xFF)
    {
      v18 = *(unsigned __int16 *)(a1 + v16);
      if (!*(_WORD *)(a1 + v16))
        goto LABEL_23;
      goto LABEL_14;
    }
    if (v19 < 2)
    {
LABEL_23:
      if (v11)
      {
        if (v8 >= v10)
        {
          v10 = v8;
        }
        else
        {
          a1 = (v14 + a1) & ~v13;
          v5 = v6;
        }
        return __swift_getEnumTagSinglePayload(a1, v10, v5);
      }
      return 0;
    }
  }
  v18 = *(unsigned __int8 *)(a1 + v16);
  if (!*(_BYTE *)(a1 + v16))
    goto LABEL_23;
LABEL_14:
  v20 = (v18 - 1) << v17;
  if (v16 > 3)
    v20 = 0;
  if (!(_DWORD)v16)
    return v11 + v20 + 1;
  if (v16 <= 3)
    v21 = v16;
  else
    v21 = 4;
  return ((uint64_t (*)(void))((char *)&loc_22DFB5FC8 + 4 * byte_22DFE9070[v21 - 1]))();
}

void sub_22DFB603C(_WORD *a1, unsigned int a2, unsigned int a3, uint64_t a4)
{
  uint64_t v5;
  uint64_t v6;
  unsigned int v7;
  size_t v8;
  char v9;
  unsigned int v10;
  unsigned int v11;
  unsigned int v12;
  int v13;

  v5 = *(_QWORD *)(*(_QWORD *)(a4 + 16) - 8);
  v6 = *(_QWORD *)(*(_QWORD *)(a4 + 24) - 8);
  if (*(_DWORD *)(v6 + 84) <= *(_DWORD *)(v5 + 84))
    v7 = *(_DWORD *)(v5 + 84);
  else
    v7 = *(_DWORD *)(v6 + 84);
  v8 = ((*(_QWORD *)(v5 + 64) + *(unsigned __int8 *)(v6 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80))
     + *(_QWORD *)(v6 + 64);
  v9 = 8 * v8;
  if (a3 > v7)
  {
    if (v8 <= 3)
    {
      v12 = ((a3 - v7 + ~(-1 << v9)) >> v9) + 1;
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
  if (v7 < a2)
  {
    v11 = ~v7 + a2;
    if (v8 < 4)
    {
      if ((_DWORD)v8)
      {
        v13 = v11 & ~(-1 << v9);
        bzero(a1, v8);
        if ((_DWORD)v8 == 3)
        {
          *a1 = v13;
          *((_BYTE *)a1 + 2) = BYTE2(v13);
        }
        else if ((_DWORD)v8 == 2)
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
      bzero(a1, v8);
      *(_DWORD *)a1 = v11;
    }
    __asm { BR              X10 }
  }
  __asm { BR              X14 }
}

void type metadata accessor for TargetedObserverStore.Tuple()
{
  JUMPOUT(0x22E323A68);
}

void sub_22DFB623C()
{
  JUMPOUT(0x22E323AECLL);
}

void sub_22DFB6258()
{
  sub_22DFB55A4();
}

uint64_t sub_22DFB6264(unsigned __int16 a1)
{
  return a1 & 1 | ((a1 > 0xFFu) << 8);
}

uint64_t sub_22DFB6288(uint64_t a1)
{
  uint64_t result;

  result = MEMORY[0x22E323AEC](&unk_22DFE9178);
  *(_QWORD *)(a1 + 8) = result;
  return result;
}

uint64_t sub_22DFB62B4()
{
  return sub_22DFB62CC() & 1;
}

uint64_t sub_22DFB62CC()
{
  return sub_22DFDD4F0() & 1;
}

void sub_22DFB6308()
{
  OUTLINED_FUNCTION_9_20();
  OUTLINED_FUNCTION_18_15();
}

void sub_22DFB6324()
{
  sub_22DFB5428();
}

uint64_t sub_22DFB633C(char a1)
{
  return a1 & 1;
}

uint64_t OUTLINED_FUNCTION_2_26()
{
  return sub_22DFDD9B8();
}

uint64_t OUTLINED_FUNCTION_3_26()
{
  return sub_22DFDD958();
}

uint64_t OUTLINED_FUNCTION_8_25()
{
  return sub_22DFDD718();
}

uint64_t OUTLINED_FUNCTION_9_20()
{
  return swift_getAtKeyPath();
}

uint64_t OUTLINED_FUNCTION_10_21(void (*a1)(char *, char *), uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  return sub_22DFAA584(a1, v10, v9, v8, a5, a6, a7, a8);
}

uint64_t OUTLINED_FUNCTION_11_21()
{
  return sub_22DFDD9AC();
}

uint64_t OUTLINED_FUNCTION_15_19()
{
  return swift_release();
}

void OUTLINED_FUNCTION_17_12(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v2 - 96) = a1;
  *(_QWORD *)(v2 - 88) = v1;
  type metadata accessor for TargetedObserverStore.Tuple();
}

uint64_t OUTLINED_FUNCTION_19_15()
{
  return swift_getKeyPath();
}

void static HPTimer.Status.== infix(_:_:)(uint64_t a1, uint64_t a2)
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
  char *v27;
  _QWORD v28[11];
  uint64_t v29;

  v29 = a2;
  v28[8] = __swift_instantiateConcreteTypeFromMangledName(&qword_255DD7830);
  OUTLINED_FUNCTION_3_2();
  MEMORY[0x24BDAC7A8](v4);
  OUTLINED_FUNCTION_2_9();
  v28[5] = v5;
  OUTLINED_FUNCTION_12_5();
  MEMORY[0x24BDAC7A8](v6);
  v28[7] = (char *)v28 - v7;
  __swift_instantiateConcreteTypeFromMangledName(&qword_255DD7828);
  OUTLINED_FUNCTION_3_2();
  MEMORY[0x24BDAC7A8](v8);
  OUTLINED_FUNCTION_2_9();
  v28[1] = v9;
  OUTLINED_FUNCTION_12_5();
  MEMORY[0x24BDAC7A8](v10);
  v28[4] = (char *)v28 - v11;
  OUTLINED_FUNCTION_12_5();
  MEMORY[0x24BDAC7A8](v12);
  v28[2] = (char *)v28 - v13;
  OUTLINED_FUNCTION_12_5();
  MEMORY[0x24BDAC7A8](v14);
  v28[6] = (char *)v28 - v15;
  v16 = sub_22DFDCEC0();
  v28[9] = *(_QWORD *)(v16 - 8);
  v28[10] = v16;
  OUTLINED_FUNCTION_3_2();
  MEMORY[0x24BDAC7A8](v17);
  OUTLINED_FUNCTION_2_9();
  v28[3] = v18;
  OUTLINED_FUNCTION_12_5();
  MEMORY[0x24BDAC7A8](v19);
  type metadata accessor for HPTimer.Status(0);
  OUTLINED_FUNCTION_3_2();
  MEMORY[0x24BDAC7A8](v20);
  OUTLINED_FUNCTION_46_4();
  MEMORY[0x24BDAC7A8](v21);
  OUTLINED_FUNCTION_38_12();
  MEMORY[0x24BDAC7A8](v22);
  OUTLINED_FUNCTION_61_4();
  MEMORY[0x24BDAC7A8](v23);
  __swift_instantiateConcreteTypeFromMangledName(&qword_255DDC248);
  OUTLINED_FUNCTION_3_2();
  MEMORY[0x24BDAC7A8](v24);
  OUTLINED_FUNCTION_44_4();
  v26 = v2 + *(int *)(v25 + 48);
  OUTLINED_FUNCTION_49_4(a1, v2);
  OUTLINED_FUNCTION_49_4(v29, v26);
  v27 = (char *)sub_22DFB6608 + 4 * byte_22DFE9200[OUTLINED_FUNCTION_71_2()];
  __asm { BR              X10 }
}

void sub_22DFB6608(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void (*v9)(uint64_t, uint64_t);
  uint64_t v10;

  OUTLINED_FUNCTION_47_7(v2, a2, type metadata accessor for HPTimer.Status);
  if (OUTLINED_FUNCTION_10_22())
  {
    (*(void (**)(uint64_t, _QWORD))(*(_QWORD *)(v6 - 104) + 8))(v5, *(_QWORD *)(v6 - 96));
    sub_22DF58068(v2, &qword_255DDC248);
  }
  else
  {
    v7 = *(_QWORD *)(v6 - 104);
    v8 = *(_QWORD *)(v6 - 96);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v7 + 32))(v3, v4, v8);
    sub_22DFDCEB4();
    v9 = *(void (**)(uint64_t, uint64_t))(v7 + 8);
    v9(v3, v8);
    v10 = ((uint64_t (*)(uint64_t, uint64_t))v9)(v5, v8);
    OUTLINED_FUNCTION_25_14(v10, type metadata accessor for HPTimer.Status);
  }
  OUTLINED_FUNCTION_4_1();
}

uint64_t type metadata accessor for HPTimer.Status(uint64_t a1)
{
  return sub_22DF30B80(a1, qword_255DDC428);
}

void HPTimer.Status.hash(into:)()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t (*v8)(_QWORD);
  char *v9;

  __swift_instantiateConcreteTypeFromMangledName(&qword_255DD7828);
  OUTLINED_FUNCTION_3_2();
  MEMORY[0x24BDAC7A8](v1);
  OUTLINED_FUNCTION_35_7();
  v3 = MEMORY[0x24BDAC7A8](v2);
  MEMORY[0x24BDAC7A8](v3);
  OUTLINED_FUNCTION_38_12();
  MEMORY[0x24BDAC7A8](v4);
  OUTLINED_FUNCTION_31_8();
  OUTLINED_FUNCTION_3_2();
  MEMORY[0x24BDAC7A8](v5);
  OUTLINED_FUNCTION_80();
  type metadata accessor for HPTimer.Status(0);
  OUTLINED_FUNCTION_3_2();
  MEMORY[0x24BDAC7A8](v6);
  OUTLINED_FUNCTION_43_5();
  OUTLINED_FUNCTION_47_7(v0, v7, v8);
  v9 = (char *)sub_22DFB6A54 + 4 * byte_22DFE9205[OUTLINED_FUNCTION_53_6()];
  __asm { BR              X10 }
}

uint64_t sub_22DFB6A54()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v3 = *(_QWORD *)(v2 - 88);
  OUTLINED_FUNCTION_257(v0, v1, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v3 + 32));
  sub_22DFDE00C();
  sub_22DF9B0E0(&qword_255DDC250, (uint64_t (*)(uint64_t))MEMORY[0x24BDCE900], MEMORY[0x24BDCE930]);
  OUTLINED_FUNCTION_7_24();
  return OUTLINED_FUNCTION_3_27(*(uint64_t (**)(uint64_t, uint64_t))(v3 + 8));
}

uint64_t sub_22DFB6BFC(uint64_t a1, uint64_t a2)
{
  BOOL v2;
  BOOL v6;
  BOOL v7;
  BOOL v8;
  char v10;

  v2 = a1 == 0x676E696E6E7572 && a2 == 0xE700000000000000;
  if (v2 || (sub_22DFDDF58() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else
  {
    v6 = a1 == 0x646573756170 && a2 == 0xE600000000000000;
    if (v6 || (sub_22DFDDF58() & 1) != 0)
    {
      swift_bridgeObjectRelease();
      return 1;
    }
    else
    {
      v7 = a1 == 0x676E69726966 && a2 == 0xE600000000000000;
      if (v7 || (sub_22DFDDF58() & 1) != 0)
      {
        swift_bridgeObjectRelease();
        return 2;
      }
      else
      {
        v8 = a1 == 0x657373696D736964 && a2 == 0xE900000000000064;
        if (v8 || (sub_22DFDDF58() & 1) != 0)
        {
          swift_bridgeObjectRelease();
          return 3;
        }
        else if (a1 == 0x6E776F6E6B6E75 && a2 == 0xE700000000000000)
        {
          swift_bridgeObjectRelease();
          return 4;
        }
        else
        {
          v10 = sub_22DFDDF58();
          swift_bridgeObjectRelease();
          if ((v10 & 1) != 0)
            return 4;
          else
            return 5;
        }
      }
    }
  }
}

uint64_t sub_22DFB6E0C(unsigned __int8 a1)
{
  return ((uint64_t (*)(uint64_t, unint64_t))((char *)sub_22DFB6E40 + 4 * byte_22DFE920A[a1]))(0x676E696E6E7572, 0xE700000000000000);
}

uint64_t sub_22DFB6E40()
{
  return 0x646573756170;
}

uint64_t sub_22DFB6E54()
{
  return 0x676E69726966;
}

uint64_t sub_22DFB6E68()
{
  return 0x657373696D736964;
}

uint64_t sub_22DFB6E84()
{
  return 0x6E776F6E6B6E75;
}

uint64_t sub_22DFB6E9C()
{
  unsigned __int8 *v0;

  return sub_22DFB6E0C(*v0);
}

uint64_t sub_22DFB6EA4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_22DFB6BFC(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_22DFB6EC8()
{
  sub_22DFB7590();
  return sub_22DFDE084();
}

uint64_t sub_22DFB6EF0()
{
  sub_22DFB7590();
  return sub_22DFDE090();
}

uint64_t sub_22DFB6F1C()
{
  sub_22DFB7608();
  return sub_22DFDE084();
}

uint64_t sub_22DFB6F44()
{
  sub_22DFB7608();
  return sub_22DFDE090();
}

uint64_t sub_22DFB6F6C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_22DF504E8(a1, a2);
  *a3 = result & 1;
  return result;
}

uint64_t sub_22DFB6F94()
{
  sub_22DFB7644();
  return sub_22DFDE084();
}

uint64_t sub_22DFB6FBC()
{
  sub_22DFB7644();
  return sub_22DFDE090();
}

uint64_t sub_22DFB6FE4()
{
  sub_22DFB7680();
  return sub_22DFDE084();
}

uint64_t sub_22DFB700C()
{
  sub_22DFB7680();
  return sub_22DFDE090();
}

void sub_22DFB7034()
{
  OUTLINED_FUNCTION_56_4();
  OUTLINED_FUNCTION_19_5();
  OUTLINED_FUNCTION_24_1();
  OUTLINED_FUNCTION_10_0();
}

uint64_t sub_22DFB7058()
{
  sub_22DFB76BC();
  return sub_22DFDE084();
}

uint64_t sub_22DFB7080()
{
  sub_22DFB76BC();
  return sub_22DFDE090();
}

uint64_t sub_22DFB70A8()
{
  sub_22DFB75CC();
  return sub_22DFDE084();
}

uint64_t sub_22DFB70D0()
{
  sub_22DFB75CC();
  return sub_22DFDE090();
}

void HPTimer.Status.encode(to:)(_QWORD *a1)
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
  char *v23;
  uint64_t v24[4];
  uint64_t v25;
  uint64_t v26;
  char *v27;
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

  v33 = __swift_instantiateConcreteTypeFromMangledName(&qword_255DDC258);
  v32 = *(_QWORD *)(v33 - 8);
  OUTLINED_FUNCTION_3_2();
  MEMORY[0x24BDAC7A8](v2);
  OUTLINED_FUNCTION_32_10(v3, v24[0]);
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_255DDC260);
  v34 = *(_QWORD *)(v4 - 8);
  v35 = v4;
  OUTLINED_FUNCTION_3_2();
  MEMORY[0x24BDAC7A8](v5);
  OUTLINED_FUNCTION_33_9(v6, v24[0]);
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_255DDC268);
  v30 = *(_QWORD *)(v7 - 8);
  v31 = v7;
  OUTLINED_FUNCTION_3_2();
  MEMORY[0x24BDAC7A8](v8);
  OUTLINED_FUNCTION_7_0();
  v29 = v9;
  __swift_instantiateConcreteTypeFromMangledName(&qword_255DD7828);
  OUTLINED_FUNCTION_3_2();
  MEMORY[0x24BDAC7A8](v10);
  OUTLINED_FUNCTION_2_9();
  v28 = v11;
  OUTLINED_FUNCTION_12_5();
  MEMORY[0x24BDAC7A8](v12);
  v27 = (char *)v24 - v13;
  v25 = __swift_instantiateConcreteTypeFromMangledName(&qword_255DDC270);
  v24[2] = *(_QWORD *)(v25 - 8);
  OUTLINED_FUNCTION_3_2();
  MEMORY[0x24BDAC7A8](v14);
  OUTLINED_FUNCTION_16_5();
  v26 = __swift_instantiateConcreteTypeFromMangledName(&qword_255DDC278);
  v24[3] = *(_QWORD *)(v26 - 8);
  OUTLINED_FUNCTION_3_2();
  MEMORY[0x24BDAC7A8](v15);
  OUTLINED_FUNCTION_80();
  v36 = OUTLINED_FUNCTION_40_7();
  v24[1] = *(_QWORD *)(v36 - 8);
  OUTLINED_FUNCTION_3_2();
  MEMORY[0x24BDAC7A8](v16);
  OUTLINED_FUNCTION_17_13();
  OUTLINED_FUNCTION_3_2();
  MEMORY[0x24BDAC7A8](v17);
  OUTLINED_FUNCTION_80();
  v20 = v19 - v18;
  v21 = __swift_instantiateConcreteTypeFromMangledName(&qword_255DDC280);
  v37 = *(_QWORD *)(v21 - 8);
  v38 = v21;
  OUTLINED_FUNCTION_3_2();
  MEMORY[0x24BDAC7A8](v22);
  OUTLINED_FUNCTION_16_0();
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_22DFB7590();
  sub_22DFDE06C();
  sub_22DFB94C4(v39, v20, type metadata accessor for HPTimer.Status);
  v23 = (char *)sub_22DFB7338 + 4 * byte_22DFE920F[swift_getEnumCaseMultiPayload()];
  __asm { BR              X10 }
}

void sub_22DFB7338()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  void (*v4)(uint64_t);
  uint64_t v5;
  void (*v6)(uint64_t);
  uint64_t v7;
  void (*v8)(uint64_t, uint64_t);

  v3 = OUTLINED_FUNCTION_50_6();
  v4(v3);
  *(_BYTE *)(v2 - 93) = 0;
  sub_22DFB76BC();
  OUTLINED_FUNCTION_5_24();
  sub_22DF9B0E0(&qword_255DD7860, (uint64_t (*)(uint64_t))MEMORY[0x24BDCE900], MEMORY[0x24BDCE920]);
  sub_22DFDDEEC();
  OUTLINED_FUNCTION_20_11(v1, *(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 248) + 8));
  v5 = OUTLINED_FUNCTION_50_6();
  v6(v5);
  v7 = OUTLINED_FUNCTION_48_2();
  v8(v7, v0);
  OUTLINED_FUNCTION_18_16();
}

unint64_t sub_22DFB7590()
{
  unint64_t result;

  result = qword_255DDC288;
  if (!qword_255DDC288)
  {
    result = MEMORY[0x22E323AEC](&unk_22DFE9BF4, &type metadata for HPTimer.Status.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_255DDC288);
  }
  return result;
}

unint64_t sub_22DFB75CC()
{
  unint64_t result;

  result = qword_255DDC290;
  if (!qword_255DDC290)
  {
    result = MEMORY[0x22E323AEC](&unk_22DFE9BA4, &type metadata for HPTimer.Status.UnknownCodingKeys);
    atomic_store(result, (unint64_t *)&qword_255DDC290);
  }
  return result;
}

unint64_t sub_22DFB7608()
{
  unint64_t result;

  result = qword_255DDC298;
  if (!qword_255DDC298)
  {
    result = MEMORY[0x22E323AEC](&unk_22DFE9B54, &type metadata for HPTimer.Status.DismissedCodingKeys);
    atomic_store(result, (unint64_t *)&qword_255DDC298);
  }
  return result;
}

unint64_t sub_22DFB7644()
{
  unint64_t result;

  result = qword_255DDC2A0;
  if (!qword_255DDC2A0)
  {
    result = MEMORY[0x22E323AEC](&unk_22DFE9B04, &type metadata for HPTimer.Status.FiringCodingKeys);
    atomic_store(result, (unint64_t *)&qword_255DDC2A0);
  }
  return result;
}

unint64_t sub_22DFB7680()
{
  unint64_t result;

  result = qword_255DDC2A8;
  if (!qword_255DDC2A8)
  {
    result = MEMORY[0x22E323AEC](&unk_22DFE9AB4, &type metadata for HPTimer.Status.PausedCodingKeys);
    atomic_store(result, (unint64_t *)&qword_255DDC2A8);
  }
  return result;
}

unint64_t sub_22DFB76BC()
{
  unint64_t result;

  result = qword_255DDC2B0;
  if (!qword_255DDC2B0)
  {
    result = MEMORY[0x22E323AEC](&unk_22DFE9A64, &type metadata for HPTimer.Status.RunningCodingKeys);
    atomic_store(result, (unint64_t *)&qword_255DDC2B0);
  }
  return result;
}

void HPTimer.Status.hashValue.getter()
{
  sub_22DFB8684((void (*)(_BYTE *))HPTimer.Status.hash(into:));
}

void HPTimer.Status.init(from:)(_QWORD *a1@<X0>, uint64_t a2@<X8>)
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
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  char *v27;
  uint64_t v28;
  uint64_t v29;
  char *v30;
  uint64_t v31;
  char *v32;
  uint64_t v33;
  char *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  unint64_t v41;
  unint64_t v42;
  uint64_t v43;
  uint64_t *v44;
  uint64_t *v45;
  uint64_t v46[7];
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
  _QWORD *v62;
  char *v63;

  v54 = a2;
  v60 = __swift_instantiateConcreteTypeFromMangledName(&qword_255DDC2B8);
  v49 = *(_QWORD *)(v60 - 8);
  OUTLINED_FUNCTION_3_2();
  MEMORY[0x24BDAC7A8](v5);
  OUTLINED_FUNCTION_7_0();
  v55 = v6;
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_255DDC2C0);
  v52 = *(_QWORD *)(v7 - 8);
  v53 = v7;
  OUTLINED_FUNCTION_3_2();
  MEMORY[0x24BDAC7A8](v8);
  OUTLINED_FUNCTION_7_0();
  v56 = v9;
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_255DDC2C8);
  v50 = *(_QWORD *)(v10 - 8);
  v51 = v10;
  OUTLINED_FUNCTION_3_2();
  MEMORY[0x24BDAC7A8](v11);
  OUTLINED_FUNCTION_33_9(v12, v46[0]);
  v47 = __swift_instantiateConcreteTypeFromMangledName(&qword_255DDC2D0);
  v46[5] = *(_QWORD *)(v47 - 8);
  OUTLINED_FUNCTION_3_2();
  MEMORY[0x24BDAC7A8](v13);
  OUTLINED_FUNCTION_32_10(v14, v46[0]);
  v48 = __swift_instantiateConcreteTypeFromMangledName(&qword_255DDC2D8);
  v46[6] = *(_QWORD *)(v48 - 8);
  OUTLINED_FUNCTION_3_2();
  MEMORY[0x24BDAC7A8](v15);
  OUTLINED_FUNCTION_7_0();
  v57 = v16;
  v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_255DDC2E0);
  v58 = *(_QWORD *)(v17 - 8);
  v59 = v17;
  OUTLINED_FUNCTION_3_2();
  MEMORY[0x24BDAC7A8](v18);
  v61 = OUTLINED_FUNCTION_17_13();
  OUTLINED_FUNCTION_3_2();
  MEMORY[0x24BDAC7A8](v19);
  OUTLINED_FUNCTION_46_4();
  v22 = v20 - v21;
  MEMORY[0x24BDAC7A8](v23);
  OUTLINED_FUNCTION_61_4();
  v25 = MEMORY[0x24BDAC7A8](v24);
  v27 = (char *)v46 - v26;
  v28 = MEMORY[0x24BDAC7A8](v25);
  v30 = (char *)v46 - v29;
  MEMORY[0x24BDAC7A8](v28);
  v32 = (char *)v46 - v31;
  v33 = a1[3];
  v62 = a1;
  __swift_project_boxed_opaque_existential_1(a1, v33);
  sub_22DFB7590();
  v34 = v63;
  sub_22DFDE060();
  if (!v34)
  {
    v46[1] = (uint64_t)v27;
    v46[2] = (uint64_t)v30;
    v46[3] = v3;
    v46[4] = v22;
    v35 = v61;
    v63 = v32;
    v36 = sub_22DFDDE80();
    v37 = *(_QWORD *)(v36 + 16);
    if (v37)
    {
      v46[0] = 0;
      v38 = *(unsigned __int8 *)(v36 + 32);
      sub_22DF38F0C(1, v37, v36, v36 + 32, 0, (2 * v37) | 1);
      v40 = v39;
      v42 = v41;
      swift_bridgeObjectRelease();
      if (v40 == v42 >> 1)
        __asm { BR              X9 }
    }
    v43 = sub_22DFDDCE8();
    swift_allocError();
    v45 = v44;
    __swift_instantiateConcreteTypeFromMangledName(&qword_255DDA930);
    *v45 = v35;
    sub_22DFDDE20();
    sub_22DFDDCDC();
    (*(void (**)(uint64_t *, _QWORD, uint64_t))(*(_QWORD *)(v43 - 8) + 104))(v45, *MEMORY[0x24BEE26D0], v43);
    swift_willThrow();
    OUTLINED_FUNCTION_11_1();
    OUTLINED_FUNCTION_20_11(v2, *(uint64_t (**)(uint64_t, uint64_t))(v58 + 8));
  }
  __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)v62);
  OUTLINED_FUNCTION_18_16();
}

void sub_22DFB7B34()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_73_3();
  OUTLINED_FUNCTION_1_24();
  if (!v0)
  {
    sub_22DFDDE68();
    v3 = *(_QWORD *)(v2 - 144);
    v5 = v4;
    OUTLINED_FUNCTION_22_14();
    OUTLINED_FUNCTION_11_1();
    OUTLINED_FUNCTION_20_11(v1, *(uint64_t (**)(uint64_t, uint64_t))(v3 + 8));
    **(_QWORD **)(v2 - 296) = v5;
    swift_storeEnumTagMultiPayload();
    JUMPOUT(0x22DFB7DF8);
  }
  JUMPOUT(0x22DFB7B08);
}

void sub_22DFB7B94()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_69_4();
  OUTLINED_FUNCTION_1_24();
  if (!v0)
  {
    OUTLINED_FUNCTION_40_7();
    sub_22DF9B0E0(&qword_255DD7880, (uint64_t (*)(uint64_t))MEMORY[0x24BDCE900], MEMORY[0x24BDCE960]);
    v3 = *(_QWORD *)(v2 - 280);
    OUTLINED_FUNCTION_29_14();
    v4 = *(_QWORD *)(v2 - 144);
    OUTLINED_FUNCTION_19_16(*(_QWORD *)(v2 - 224));
    OUTLINED_FUNCTION_11_1();
    OUTLINED_FUNCTION_20_11(v1, *(uint64_t (**)(uint64_t, uint64_t))(v4 + 8));
    swift_storeEnumTagMultiPayload();
    v5 = *(_QWORD *)(v2 - 104);
    sub_22DFB93EC(v3, v5);
    sub_22DFB93EC(v5, *(_QWORD *)(v2 - 192));
    JUMPOUT(0x22DFB7B20);
  }
  OUTLINED_FUNCTION_11_1();
  JUMPOUT(0x22DFB7B18);
}

void sub_22DFB7E1C(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  HPTimer.Status.init(from:)(a1, a2);
}

void sub_22DFB7E30(_QWORD *a1)
{
  HPTimer.Status.encode(to:)(a1);
}

void sub_22DFB7E50(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_22DFB89F4(a1, a2, a3, (void (*)(_BYTE *))HPTimer.Status.hash(into:));
}

double HPTimer.duration.getter()
{
  uint64_t v0;

  return *(double *)v0;
}

void HPTimer.duration.setter(double a1)
{
  double *v1;

  *v1 = a1;
}

uint64_t (*HPTimer.duration.modify())(_QWORD, _QWORD)
{
  return nullsub_1;
}

uint64_t HPTimer.id.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;

  v3 = v1 + *(int *)(OUTLINED_FUNCTION_20_10() + 20);
  v4 = OUTLINED_FUNCTION_54();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a1, v3, v4);
}

uint64_t HPTimer.title.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + *(int *)(type metadata accessor for HPTimer(0) + 24));
  sub_22DFDD448();
  return v1;
}

void HPTimer.title.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v5;

  v5 = (_QWORD *)(v2 + *(int *)(type metadata accessor for HPTimer(0) + 24));
  swift_bridgeObjectRelease();
  *v5 = a1;
  v5[1] = a2;
  OUTLINED_FUNCTION_132_0();
}

uint64_t (*HPTimer.title.modify())(_QWORD, _QWORD)
{
  type metadata accessor for HPTimer(0);
  return nullsub_1;
}

void HPTimer.status.getter(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;

  v3 = type metadata accessor for HPTimer(0);
  sub_22DFB94C4(v1 + *(int *)(v3 + 28), a1, type metadata accessor for HPTimer.Status);
}

uint64_t HPTimer.status.setter(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;

  v3 = v1 + *(int *)(type metadata accessor for HPTimer(0) + 28);
  return sub_22DFB9444(a1, v3);
}

uint64_t (*HPTimer.status.modify())(_QWORD, _QWORD)
{
  type metadata accessor for HPTimer(0);
  return nullsub_1;
}

uint64_t HPTimer.init(duration:id:title:status:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, double *a5@<X8>, double a6@<D0>)
{
  int *v12;
  _QWORD *v13;
  char *v14;
  uint64_t v15;

  v12 = (int *)OUTLINED_FUNCTION_20_10();
  v13 = (_QWORD *)((char *)a5 + v12[6]);
  *a5 = a6;
  v14 = (char *)a5 + v12[5];
  v15 = OUTLINED_FUNCTION_54();
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v15 - 8) + 32))(v14, a1, v15);
  *v13 = a2;
  v13[1] = a3;
  return sub_22DFB93EC(a4, (uint64_t)a5 + v12[7]);
}

void static HPTimer.== infix(_:_:)(double *a1, double *a2)
{
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;
  uint64_t v7;
  _QWORD *v8;
  uint64_t v9;
  BOOL v10;

  if (*a1 == *a2)
  {
    v4 = OUTLINED_FUNCTION_20_10();
    if ((sub_22DFDCEE4() & 1) != 0)
    {
      v5 = *(int *)(v4 + 24);
      v6 = (_QWORD *)((char *)a1 + v5);
      v7 = *(_QWORD *)((char *)a1 + v5 + 8);
      v8 = (_QWORD *)((char *)a2 + v5);
      v9 = v8[1];
      if (v7)
      {
        if (v9)
        {
          v10 = *v6 == *v8 && v7 == v9;
          if (v10 || (sub_22DFDDF58() & 1) != 0)
            goto LABEL_10;
        }
      }
      else if (!v9)
      {
LABEL_10:
        static HPTimer.Status.== infix(_:_:)((uint64_t)a1 + *(int *)(v4 + 28), (uint64_t)a2 + *(int *)(v4 + 28));
        return;
      }
    }
  }
  OUTLINED_FUNCTION_132_0();
}

void HPTimer.hash(into:)()
{
  uint64_t v0;
  uint64_t v1;

  sub_22DFDE024();
  v1 = OUTLINED_FUNCTION_20_10();
  OUTLINED_FUNCTION_54();
  sub_22DF9B0E0(&qword_255DD7638, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEA88]);
  sub_22DFDD4C0();
  if (*(_QWORD *)(v0 + *(int *)(v1 + 24) + 8))
  {
    sub_22DFDE018();
    sub_22DFDD448();
    sub_22DFDD544();
    OUTLINED_FUNCTION_105();
  }
  else
  {
    sub_22DFDE018();
  }
  HPTimer.Status.hash(into:)();
}

uint64_t sub_22DFB8218(uint64_t a1, uint64_t a2)
{
  BOOL v2;
  BOOL v6;
  BOOL v7;
  char v9;

  v2 = a1 == 0x6E6F697461727564 && a2 == 0xE800000000000000;
  if (v2 || (sub_22DFDDF58() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else
  {
    v6 = a1 == 25705 && a2 == 0xE200000000000000;
    if (v6 || (sub_22DFDDF58() & 1) != 0)
    {
      swift_bridgeObjectRelease();
      return 1;
    }
    else
    {
      v7 = a1 == 0x656C746974 && a2 == 0xE500000000000000;
      if (v7 || (sub_22DFDDF58() & 1) != 0)
      {
        swift_bridgeObjectRelease();
        return 2;
      }
      else if (a1 == 0x737574617473 && a2 == 0xE600000000000000)
      {
        swift_bridgeObjectRelease();
        return 3;
      }
      else
      {
        v9 = sub_22DFDDF58();
        swift_bridgeObjectRelease();
        if ((v9 & 1) != 0)
          return 3;
        else
          return 4;
      }
    }
  }
}

uint64_t sub_22DFB839C(unsigned __int8 a1)
{
  return ((uint64_t (*)(uint64_t, unint64_t))((char *)sub_22DFB83D0 + 4 * byte_22DFE9219[a1]))(0x6E6F697461727564, 0xE800000000000000);
}

uint64_t sub_22DFB83D0()
{
  return 25705;
}

uint64_t sub_22DFB83DC()
{
  return 0x656C746974;
}

uint64_t sub_22DFB83F0()
{
  return 0x737574617473;
}

void sub_22DFB8404()
{
  OUTLINED_FUNCTION_56_4();
  sub_22DFDE00C();
  OUTLINED_FUNCTION_24_1();
  OUTLINED_FUNCTION_10_0();
}

uint64_t sub_22DFB8434()
{
  unsigned __int8 *v0;

  return sub_22DFB839C(*v0);
}

uint64_t sub_22DFB843C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_22DFB8218(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_22DFB8460()
{
  sub_22DFB9488();
  return sub_22DFDE084();
}

uint64_t sub_22DFB8488()
{
  sub_22DFB9488();
  return sub_22DFDE090();
}

uint64_t HPTimer.encode(to:)(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_255DDC2E8);
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  OUTLINED_FUNCTION_16_5();
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_22DFB9488();
  sub_22DFDE06C();
  sub_22DFDDEE0();
  if (!v1)
  {
    type metadata accessor for HPTimer(0);
    sub_22DFDCEFC();
    sub_22DF9B0E0(&qword_255DD7850, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEA70]);
    OUTLINED_FUNCTION_29_2();
    sub_22DFDDEA4();
    type metadata accessor for HPTimer.Status(0);
    sub_22DF9B0E0(&qword_255DDC2F8, type metadata accessor for HPTimer.Status, (uint64_t)&protocol conformance descriptor for HPTimer.Status);
    OUTLINED_FUNCTION_29_2();
  }
  return (*(uint64_t (**)(uint64_t, uint64_t))(v5 + 8))(v2, v4);
}

void HPTimer.hashValue.getter()
{
  sub_22DFB8684((void (*)(_BYTE *))HPTimer.hash(into:));
}

void sub_22DFB8684(void (*a1)(_BYTE *))
{
  _BYTE v2[72];

  OUTLINED_FUNCTION_26_0();
  a1(v2);
  OUTLINED_FUNCTION_24_1();
  OUTLINED_FUNCTION_10_0();
}

void HPTimer.init(from:)(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD *v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  char *v28;
  uint64_t v29;
  _QWORD *v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t v33;
  char v34;
  char v35;
  char v36;
  char v37;

  v25 = a2;
  v5 = type metadata accessor for HPTimer.Status(0);
  OUTLINED_FUNCTION_3_2();
  MEMORY[0x24BDAC7A8](v6);
  OUTLINED_FUNCTION_16_0();
  v32 = sub_22DFDCEFC();
  v26 = *(_QWORD *)(v32 - 8);
  OUTLINED_FUNCTION_3_2();
  MEMORY[0x24BDAC7A8](v7);
  OUTLINED_FUNCTION_43_5();
  v29 = __swift_instantiateConcreteTypeFromMangledName(&qword_255DDC300);
  MEMORY[0x24BDAC7A8](v29);
  v9 = (char *)&v24 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for HPTimer(0);
  OUTLINED_FUNCTION_3_2();
  MEMORY[0x24BDAC7A8](v10);
  OUTLINED_FUNCTION_80();
  v27 = v11;
  v14 = (_QWORD *)(v13 - v12);
  v15 = (uint64_t *)(v13 - v12 + *(int *)(v11 + 24));
  *v15 = 0;
  v15[1] = 0;
  v30 = a1;
  v31 = v15;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_22DFB9488();
  v28 = v9;
  v16 = v33;
  sub_22DFDE060();
  if (v16)
  {
    __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)v30);
    swift_bridgeObjectRelease();
  }
  else
  {
    v33 = v5;
    v37 = 0;
    sub_22DFDDE68();
    *v14 = v17;
    v36 = 1;
    sub_22DF9B0E0(&qword_255DD7870, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEAA8]);
    v18 = v32;
    sub_22DFDDE74();
    v19 = OUTLINED_FUNCTION_58_8();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v20 + 32))(v19, v3, v18);
    v35 = 2;
    v21 = sub_22DFDDE2C();
    v22 = v31;
    *v31 = v21;
    v22[1] = v23;
    v34 = 3;
    sub_22DF9B0E0(&qword_255DDC308, type metadata accessor for HPTimer.Status, (uint64_t)&protocol conformance descriptor for HPTimer.Status);
    sub_22DFDDE74();
    OUTLINED_FUNCTION_8_26();
    sub_22DFB93EC(v2, (uint64_t)v14 + *(int *)(v27 + 28));
    sub_22DFB94C4((uint64_t)v14, v25, type metadata accessor for HPTimer);
    __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)v30);
    sub_22DF58090((uint64_t)v14, type metadata accessor for HPTimer);
  }
}

void sub_22DFB89B4(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  HPTimer.init(from:)(a1, a2);
}

uint64_t sub_22DFB89C8(_QWORD *a1)
{
  return HPTimer.encode(to:)(a1);
}

void sub_22DFB89E8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_22DFB89F4(a1, a2, a3, (void (*)(_BYTE *))HPTimer.hash(into:));
}

void sub_22DFB89F4(uint64_t a1, uint64_t a2, uint64_t a3, void (*a4)(_BYTE *))
{
  _BYTE v5[72];

  OUTLINED_FUNCTION_56_4();
  a4(v5);
  OUTLINED_FUNCTION_24_1();
  OUTLINED_FUNCTION_10_0();
}

void HPTimer.Status.shortDescription.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t (*v3)(_QWORD);
  char *v4;

  type metadata accessor for HPTimer.Status(0);
  OUTLINED_FUNCTION_3_2();
  MEMORY[0x24BDAC7A8](v2);
  OUTLINED_FUNCTION_44_4();
  sub_22DFB94C4(v1, v0, v3);
  v4 = (char *)sub_22DFB8AA0 + 4 * byte_22DFE921D[OUTLINED_FUNCTION_71_2()];
  __asm { BR              X10 }
}

uint64_t sub_22DFB8AA0(uint64_t a1)
{
  OUTLINED_FUNCTION_25_14(a1, type metadata accessor for HPTimer.Status);
  return 0x676E696E6E7572;
}

void HPTimer.Status.description.getter()
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
  uint64_t (*v11)(_QWORD);
  char *v12;
  _QWORD v13[4];

  __swift_instantiateConcreteTypeFromMangledName(&qword_255DD7828);
  OUTLINED_FUNCTION_3_2();
  MEMORY[0x24BDAC7A8](v1);
  OUTLINED_FUNCTION_46_4();
  OUTLINED_FUNCTION_38_12();
  MEMORY[0x24BDAC7A8](v2);
  v13[0] = (char *)v13 - v3;
  OUTLINED_FUNCTION_12_5();
  v5 = MEMORY[0x24BDAC7A8](v4);
  MEMORY[0x24BDAC7A8](v5);
  v13[1] = *(_QWORD *)(OUTLINED_FUNCTION_31_8() - 8);
  OUTLINED_FUNCTION_3_2();
  MEMORY[0x24BDAC7A8](v6);
  OUTLINED_FUNCTION_35_7();
  MEMORY[0x24BDAC7A8](v7);
  type metadata accessor for HPTimer.Status(0);
  OUTLINED_FUNCTION_3_2();
  MEMORY[0x24BDAC7A8](v8);
  OUTLINED_FUNCTION_34_8();
  MEMORY[0x24BDAC7A8](v9);
  sub_22DFB94C4(v0, (uint64_t)v13 - v10, v11);
  v12 = (char *)sub_22DFB8C74 + 4 * byte_22DFE9222[OUTLINED_FUNCTION_53_6()];
  __asm { BR              X10 }
}

uint64_t sub_22DFB8C74()
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

  v3 = *(_QWORD *)(v2 - 120);
  OUTLINED_FUNCTION_257(v0, v1, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v3 + 32));
  HPTimer.Status.shortDescription.getter();
  v5 = v4;
  v7 = v6;
  OUTLINED_FUNCTION_41_5();
  sub_22DF9B0E0(&qword_255DDC310, (uint64_t (*)(uint64_t))MEMORY[0x24BDCE900], MEMORY[0x24BDCE988]);
  sub_22DFDDF10();
  sub_22DFDD568();
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_14_19();
  *(_QWORD *)(v2 - 112) = v5;
  *(_QWORD *)(v2 - 104) = v7;
  sub_22DFDD448();
  sub_22DFDD568();
  OUTLINED_FUNCTION_78_1();
  swift_bridgeObjectRelease();
  v8 = *(_QWORD *)(v2 - 112);
  OUTLINED_FUNCTION_3_27(*(uint64_t (**)(uint64_t, uint64_t))(v3 + 8));
  return v8;
}

void sub_22DFB8F9C(uint64_t a1)
{
  OUTLINED_FUNCTION_66_4(a1, type metadata accessor for HPTimer.Status);
  JUMPOUT(0x22DFB8F70);
}

void sub_22DFB8FB8(uint64_t a1)
{
  OUTLINED_FUNCTION_66_4(a1, type metadata accessor for HPTimer.Status);
  JUMPOUT(0x22DFB8F70);
}

void sub_22DFB8FE0()
{
  JUMPOUT(0x22DFB8F70);
}

void sub_22DFB8FFC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;

  v1 = type metadata accessor for HPTimer.Status(0);
  MEMORY[0x24BDAC7A8](v1);
  v3 = (char *)&v6 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = type metadata accessor for HPTimer(0);
  sub_22DFB94C4(v0 + *(int *)(v4 + 28), (uint64_t)v3, type metadata accessor for HPTimer.Status);
  v5 = (char *)sub_22DFB9090 + 4 * byte_22DFE922C[swift_getEnumCaseMultiPayload()];
  __asm { BR              X9 }
}

uint64_t sub_22DFB9090()
{
  uint64_t v0;

  sub_22DF58090(v0, type metadata accessor for HPTimer.Status);
  return 2;
}

void static HPTimer.< infix(_:_:)(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
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
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  int EnumCaseMultiPayload;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void (*v28)(char *, char *, uint64_t);
  char *v29;
  void (*v30)(uint64_t, uint64_t);
  uint64_t v31;
  char *v32;
  uint64_t v33;
  uint64_t v34;

  v5 = sub_22DFDCEC0();
  v33 = *(_QWORD *)(v5 - 8);
  v34 = v5;
  OUTLINED_FUNCTION_3_2();
  MEMORY[0x24BDAC7A8](v6);
  OUTLINED_FUNCTION_2_9();
  v32 = v7;
  OUTLINED_FUNCTION_12_5();
  MEMORY[0x24BDAC7A8](v8);
  v10 = (char *)&v31 - v9;
  OUTLINED_FUNCTION_55_4();
  OUTLINED_FUNCTION_3_2();
  MEMORY[0x24BDAC7A8](v11);
  OUTLINED_FUNCTION_34_8();
  MEMORY[0x24BDAC7A8](v12);
  v14 = (char *)&v31 - v13;
  v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_255DDC248);
  OUTLINED_FUNCTION_3_2();
  MEMORY[0x24BDAC7A8](v16);
  OUTLINED_FUNCTION_16_5();
  sub_22DFB8FFC();
  v18 = v17;
  sub_22DFB8FFC();
  if (v18 == v19)
  {
    v20 = *(int *)(type metadata accessor for HPTimer(0) + 28);
    v21 = a2 + v20;
    v22 = v2 + *(int *)(v15 + 48);
    OUTLINED_FUNCTION_49_4(a1 + v20, v2);
    OUTLINED_FUNCTION_49_4(v21, v22);
    EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    if (EnumCaseMultiPayload)
    {
      if (EnumCaseMultiPayload != 1)
      {
        if (EnumCaseMultiPayload == 2 && OUTLINED_FUNCTION_37_10() == 2)
        {
          sub_22DF58090(v22, type metadata accessor for HPTimer.Status);
          v25 = v2;
LABEL_14:
          sub_22DF58090(v25, type metadata accessor for HPTimer.Status);
          goto LABEL_15;
        }
        goto LABEL_11;
      }
      OUTLINED_FUNCTION_47_7(v2, v24, type metadata accessor for HPTimer.Status);
      if (OUTLINED_FUNCTION_37_10() != 1)
      {
LABEL_11:
        sub_22DF58068(v2, &qword_255DDC248);
        goto LABEL_15;
      }
    }
    else
    {
      sub_22DFB94C4(v2, (uint64_t)v14, type metadata accessor for HPTimer.Status);
      if (OUTLINED_FUNCTION_37_10())
      {
        (*(void (**)(char *, uint64_t))(v33 + 8))(v14, v34);
        goto LABEL_11;
      }
      v27 = v33;
      v26 = v34;
      v28 = *(void (**)(char *, char *, uint64_t))(v33 + 32);
      v28(v10, v14, v34);
      v29 = v32;
      v28(v32, (char *)v22, v26);
      sub_22DFDCEA8();
      v30 = *(void (**)(uint64_t, uint64_t))(v27 + 8);
      v30((uint64_t)v29, v26);
      v30((uint64_t)v10, v26);
    }
    v25 = v2;
    goto LABEL_14;
  }
  sub_22DFB8FFC();
  sub_22DFB8FFC();
LABEL_15:
  OUTLINED_FUNCTION_4_1();
}

BOOL sub_22DFB9390(uint64_t a1, uint64_t a2)
{
  char v2;

  static HPTimer.< infix(_:_:)(a2, a1);
  return (v2 & 1) == 0;
}

BOOL sub_22DFB93BC(uint64_t a1, uint64_t a2)
{
  char v2;

  static HPTimer.< infix(_:_:)(a1, a2);
  return (v2 & 1) == 0;
}

void sub_22DFB93DC(uint64_t a1, uint64_t a2)
{
  static HPTimer.< infix(_:_:)(a2, a1);
}

uint64_t sub_22DFB93EC(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for HPTimer.Status(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t type metadata accessor for HPTimer(uint64_t a1)
{
  return sub_22DF30B80(a1, qword_255DDC378);
}

uint64_t sub_22DFB9444(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for HPTimer.Status(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

unint64_t sub_22DFB9488()
{
  unint64_t result;

  result = qword_255DDC2F0;
  if (!qword_255DDC2F0)
  {
    result = MEMORY[0x22E323AEC](&unk_22DFE9A14, &type metadata for HPTimer.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_255DDC2F0);
  }
  return result;
}

void sub_22DFB94C4(uint64_t a1, uint64_t a2, uint64_t (*a3)(_QWORD))
{
  uint64_t v5;

  v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, a1, v5);
  OUTLINED_FUNCTION_1_2();
}

void sub_22DFB9504()
{
  sub_22DF9B0E0(&qword_255DDC318, type metadata accessor for HPTimer.Status, (uint64_t)&protocol conformance descriptor for HPTimer.Status);
}

void sub_22DFB9530()
{
  sub_22DF9B0E0((unint64_t *)&qword_255DD7BF8, type metadata accessor for HPTimer, (uint64_t)&protocol conformance descriptor for HPTimer);
}

void sub_22DFB955C()
{
  sub_22DF9B0E0(&qword_255DD7638, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEA88]);
}

uint64_t *initializeBufferWithCopyOfBuffer for HPTimer(uint64_t *a1, uint64_t *a2, int *a3)
{
  uint64_t *v4;
  int v5;
  uint64_t v7;
  char *v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD *v13;
  _QWORD *v14;
  uint64_t v15;
  char *v16;
  char *v17;
  uint64_t v18;
  int EnumCaseMultiPayload;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;

  v4 = a1;
  v5 = *(_DWORD *)(*((_QWORD *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v21 = *a2;
    *v4 = *a2;
    v4 = (uint64_t *)(v21 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
    return v4;
  }
  *a1 = *a2;
  v7 = a3[5];
  v8 = (char *)a1 + v7;
  v9 = (char *)a2 + v7;
  v10 = sub_22DFDCEFC();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v10 - 8) + 16))(v8, v9, v10);
  v11 = a3[6];
  v12 = a3[7];
  v13 = (uint64_t *)((char *)v4 + v11);
  v14 = (uint64_t *)((char *)a2 + v11);
  v15 = v14[1];
  *v13 = *v14;
  v13[1] = v15;
  v16 = (char *)v4 + v12;
  v17 = (char *)a2 + v12;
  v18 = type metadata accessor for HPTimer.Status(0);
  sub_22DFDD448();
  EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  switch(EnumCaseMultiPayload)
  {
    case 3:
      v22 = sub_22DFDCEC0();
      if (__swift_getEnumTagSinglePayload((uint64_t)v17, 1, v22))
      {
LABEL_8:
        v23 = __swift_instantiateConcreteTypeFromMangledName(&qword_255DD7828);
        memcpy(v16, v17, *(_QWORD *)(*(_QWORD *)(v23 - 8) + 64));
        goto LABEL_13;
      }
LABEL_12:
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v22 - 8) + 16))(v16, v17, v22);
      __swift_storeEnumTagSinglePayload((uint64_t)v16, 0, 1, v22);
      goto LABEL_13;
    case 2:
      v22 = sub_22DFDCEC0();
      if (__swift_getEnumTagSinglePayload((uint64_t)v17, 1, v22))
        goto LABEL_8;
      goto LABEL_12;
    case 0:
      v20 = sub_22DFDCEC0();
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v20 - 8) + 16))(v16, v17, v20);
LABEL_13:
      swift_storeEnumTagMultiPayload();
      return v4;
  }
  memcpy(v16, v17, *(_QWORD *)(*(_QWORD *)(v18 - 8) + 64));
  return v4;
}

uint64_t destroy for HPTimer(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t result;
  uint64_t v8;

  v4 = a1 + *(int *)(a2 + 20);
  v5 = sub_22DFDCEFC();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(v4, v5);
  swift_bridgeObjectRelease();
  v6 = a1 + *(int *)(a2 + 28);
  type metadata accessor for HPTimer.Status(0);
  result = swift_getEnumCaseMultiPayload();
  if ((_DWORD)result == 3 || (_DWORD)result == 2)
  {
    v8 = sub_22DFDCEC0();
    result = __swift_getEnumTagSinglePayload(v6, 1, v8);
    if (!(_DWORD)result)
      return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 8))(v6, v8);
  }
  else if (!(_DWORD)result)
  {
    v8 = sub_22DFDCEC0();
    return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 8))(v6, v8);
  }
  return result;
}

_QWORD *initializeWithCopy for HPTimer(_QWORD *a1, _QWORD *a2, int *a3)
{
  uint64_t v6;
  char *v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  _QWORD *v13;
  uint64_t v14;
  char *v15;
  char *v16;
  uint64_t v17;
  int EnumCaseMultiPayload;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;

  *a1 = *a2;
  v6 = a3[5];
  v7 = (char *)a1 + v6;
  v8 = (char *)a2 + v6;
  v9 = sub_22DFDCEFC();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v9 - 8) + 16))(v7, v8, v9);
  v10 = a3[6];
  v11 = a3[7];
  v12 = (_QWORD *)((char *)a1 + v10);
  v13 = (_QWORD *)((char *)a2 + v10);
  v14 = v13[1];
  *v12 = *v13;
  v12[1] = v14;
  v15 = (char *)a1 + v11;
  v16 = (char *)a2 + v11;
  v17 = type metadata accessor for HPTimer.Status(0);
  sub_22DFDD448();
  EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  switch(EnumCaseMultiPayload)
  {
    case 3:
      v20 = sub_22DFDCEC0();
      if (__swift_getEnumTagSinglePayload((uint64_t)v16, 1, v20))
        goto LABEL_8;
      goto LABEL_10;
    case 2:
      v20 = sub_22DFDCEC0();
      if (__swift_getEnumTagSinglePayload((uint64_t)v16, 1, v20))
      {
LABEL_8:
        v21 = __swift_instantiateConcreteTypeFromMangledName(&qword_255DD7828);
        memcpy(v15, v16, *(_QWORD *)(*(_QWORD *)(v21 - 8) + 64));
        goto LABEL_11;
      }
LABEL_10:
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v20 - 8) + 16))(v15, v16, v20);
      __swift_storeEnumTagSinglePayload((uint64_t)v15, 0, 1, v20);
      goto LABEL_11;
    case 0:
      v19 = sub_22DFDCEC0();
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v19 - 8) + 16))(v15, v16, v19);
LABEL_11:
      swift_storeEnumTagMultiPayload();
      return a1;
  }
  memcpy(v15, v16, *(_QWORD *)(*(_QWORD *)(v17 - 8) + 64));
  return a1;
}

_QWORD *assignWithCopy for HPTimer(_QWORD *a1, _QWORD *a2, int *a3)
{
  uint64_t v6;
  char *v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  _QWORD *v12;
  uint64_t v13;
  char *v14;
  char *v15;
  uint64_t v16;
  int EnumCaseMultiPayload;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;

  *a1 = *a2;
  v6 = a3[5];
  v7 = (char *)a1 + v6;
  v8 = (char *)a2 + v6;
  v9 = sub_22DFDCEFC();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v9 - 8) + 24))(v7, v8, v9);
  v10 = a3[6];
  v11 = (_QWORD *)((char *)a1 + v10);
  v12 = (_QWORD *)((char *)a2 + v10);
  *v11 = *v12;
  v11[1] = v12[1];
  sub_22DFDD448();
  swift_bridgeObjectRelease();
  if (a1 == a2)
    return a1;
  v13 = a3[7];
  v14 = (char *)a1 + v13;
  v15 = (char *)a2 + v13;
  sub_22DF58090((uint64_t)a1 + v13, type metadata accessor for HPTimer.Status);
  v16 = type metadata accessor for HPTimer.Status(0);
  EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  switch(EnumCaseMultiPayload)
  {
    case 3:
      v19 = sub_22DFDCEC0();
      if (__swift_getEnumTagSinglePayload((uint64_t)v15, 1, v19))
      {
LABEL_7:
        v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_255DD7828);
        memcpy(v14, v15, *(_QWORD *)(*(_QWORD *)(v20 - 8) + 64));
        goto LABEL_12;
      }
LABEL_11:
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v19 - 8) + 16))(v14, v15, v19);
      __swift_storeEnumTagSinglePayload((uint64_t)v14, 0, 1, v19);
      goto LABEL_12;
    case 2:
      v19 = sub_22DFDCEC0();
      if (__swift_getEnumTagSinglePayload((uint64_t)v15, 1, v19))
        goto LABEL_7;
      goto LABEL_11;
    case 0:
      v18 = sub_22DFDCEC0();
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v18 - 8) + 16))(v14, v15, v18);
LABEL_12:
      swift_storeEnumTagMultiPayload();
      return a1;
  }
  memcpy(v14, v15, *(_QWORD *)(*(_QWORD *)(v16 - 8) + 64));
  return a1;
}

_QWORD *initializeWithTake for HPTimer(_QWORD *a1, _QWORD *a2, int *a3)
{
  uint64_t v6;
  char *v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  char *v12;
  uint64_t v13;
  int EnumCaseMultiPayload;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;

  *a1 = *a2;
  v6 = a3[5];
  v7 = (char *)a1 + v6;
  v8 = (char *)a2 + v6;
  v9 = sub_22DFDCEFC();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v9 - 8) + 32))(v7, v8, v9);
  v10 = a3[7];
  *(_OWORD *)((char *)a1 + a3[6]) = *(_OWORD *)((char *)a2 + a3[6]);
  v11 = (char *)a1 + v10;
  v12 = (char *)a2 + v10;
  v13 = type metadata accessor for HPTimer.Status(0);
  EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  switch(EnumCaseMultiPayload)
  {
    case 3:
      v16 = sub_22DFDCEC0();
      if (__swift_getEnumTagSinglePayload((uint64_t)v12, 1, v16))
        goto LABEL_8;
      goto LABEL_10;
    case 2:
      v16 = sub_22DFDCEC0();
      if (__swift_getEnumTagSinglePayload((uint64_t)v12, 1, v16))
      {
LABEL_8:
        v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_255DD7828);
        memcpy(v11, v12, *(_QWORD *)(*(_QWORD *)(v17 - 8) + 64));
        goto LABEL_11;
      }
LABEL_10:
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v16 - 8) + 32))(v11, v12, v16);
      __swift_storeEnumTagSinglePayload((uint64_t)v11, 0, 1, v16);
      goto LABEL_11;
    case 0:
      v15 = sub_22DFDCEC0();
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v15 - 8) + 32))(v11, v12, v15);
LABEL_11:
      swift_storeEnumTagMultiPayload();
      return a1;
  }
  memcpy(v11, v12, *(_QWORD *)(*(_QWORD *)(v13 - 8) + 64));
  return a1;
}

_QWORD *assignWithTake for HPTimer(_QWORD *a1, _QWORD *a2, int *a3)
{
  uint64_t v6;
  char *v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  char *v17;
  uint64_t v18;
  int EnumCaseMultiPayload;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;

  *a1 = *a2;
  v6 = a3[5];
  v7 = (char *)a1 + v6;
  v8 = (char *)a2 + v6;
  v9 = sub_22DFDCEFC();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v9 - 8) + 40))(v7, v8, v9);
  v10 = a3[6];
  v11 = (_QWORD *)((char *)a1 + v10);
  v12 = (_QWORD *)((char *)a2 + v10);
  v14 = *v12;
  v13 = v12[1];
  *v11 = v14;
  v11[1] = v13;
  swift_bridgeObjectRelease();
  if (a1 == a2)
    return a1;
  v15 = a3[7];
  v16 = (char *)a1 + v15;
  v17 = (char *)a2 + v15;
  sub_22DF58090((uint64_t)a1 + v15, type metadata accessor for HPTimer.Status);
  v18 = type metadata accessor for HPTimer.Status(0);
  EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  switch(EnumCaseMultiPayload)
  {
    case 3:
      v21 = sub_22DFDCEC0();
      if (__swift_getEnumTagSinglePayload((uint64_t)v17, 1, v21))
      {
LABEL_7:
        v22 = __swift_instantiateConcreteTypeFromMangledName(&qword_255DD7828);
        memcpy(v16, v17, *(_QWORD *)(*(_QWORD *)(v22 - 8) + 64));
        goto LABEL_12;
      }
LABEL_11:
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v21 - 8) + 32))(v16, v17, v21);
      __swift_storeEnumTagSinglePayload((uint64_t)v16, 0, 1, v21);
      goto LABEL_12;
    case 2:
      v21 = sub_22DFDCEC0();
      if (__swift_getEnumTagSinglePayload((uint64_t)v17, 1, v21))
        goto LABEL_7;
      goto LABEL_11;
    case 0:
      v20 = sub_22DFDCEC0();
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v20 - 8) + 32))(v16, v17, v20);
LABEL_12:
      swift_storeEnumTagMultiPayload();
      return a1;
  }
  memcpy(v16, v17, *(_QWORD *)(*(_QWORD *)(v18 - 8) + 64));
  return a1;
}

uint64_t getEnumTagSinglePayload for HPTimer()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

void sub_22DFBA0E8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v6 = OUTLINED_FUNCTION_54();
  if (*(_DWORD *)(*(_QWORD *)(v6 - 8) + 84) == (_DWORD)a2)
  {
    v7 = v6;
    v8 = *(int *)(a3 + 20);
  }
  else
  {
    if ((_DWORD)a2 == 2147483646)
    {
      OUTLINED_FUNCTION_132_0();
      return;
    }
    v7 = OUTLINED_FUNCTION_55_4();
    v8 = *(int *)(a3 + 28);
  }
  __swift_getEnumTagSinglePayload(a1 + v8, a2, v7);
}

uint64_t storeEnumTagSinglePayload for HPTimer()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

void sub_22DFBA190(uint64_t a1, uint64_t a2, int a3, int *a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v8 = OUTLINED_FUNCTION_54();
  if (*(_DWORD *)(*(_QWORD *)(v8 - 8) + 84) == a3)
  {
    v9 = v8;
    v10 = a4[5];
  }
  else
  {
    if (a3 == 2147483646)
    {
      *(_QWORD *)(a1 + a4[6] + 8) = a2;
      OUTLINED_FUNCTION_132_0();
      return;
    }
    v9 = OUTLINED_FUNCTION_55_4();
    v10 = a4[7];
  }
  __swift_storeEnumTagSinglePayload(a1 + v10, a2, a2, v9);
}

uint64_t sub_22DFBA21C()
{
  uint64_t result;
  unint64_t v1;
  unint64_t v2;

  result = sub_22DFDCEFC();
  if (v1 <= 0x3F)
  {
    result = type metadata accessor for HPTimer.Status(319);
    if (v2 <= 0x3F)
    {
      swift_initStructMetadata();
      return 0;
    }
  }
  return result;
}

uint64_t *initializeBufferWithCopyOfBuffer for HPTimer.Status(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v5;
  int v6;
  int EnumCaseMultiPayload;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v5 = *(_QWORD *)(a3 - 8);
  v6 = *(_DWORD *)(v5 + 80);
  if ((v6 & 0x20000) != 0)
  {
    v9 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v9 + ((v6 + 16) & ~(unint64_t)v6));
    swift_retain();
    return a1;
  }
  EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  switch(EnumCaseMultiPayload)
  {
    case 3:
      v10 = sub_22DFDCEC0();
      if (__swift_getEnumTagSinglePayload((uint64_t)a2, 1, v10))
      {
LABEL_8:
        v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_255DD7828);
        memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v11 - 8) + 64));
        goto LABEL_13;
      }
LABEL_12:
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v10 - 8) + 16))(a1, a2, v10);
      __swift_storeEnumTagSinglePayload((uint64_t)a1, 0, 1, v10);
      goto LABEL_13;
    case 2:
      v10 = sub_22DFDCEC0();
      if (__swift_getEnumTagSinglePayload((uint64_t)a2, 1, v10))
        goto LABEL_8;
      goto LABEL_12;
    case 0:
      v8 = sub_22DFDCEC0();
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v8 - 8) + 16))(a1, a2, v8);
LABEL_13:
      swift_storeEnumTagMultiPayload();
      return a1;
  }
  memcpy(a1, a2, *(_QWORD *)(v5 + 64));
  return a1;
}

uint64_t destroy for HPTimer.Status(uint64_t a1)
{
  uint64_t result;
  uint64_t v3;

  result = swift_getEnumCaseMultiPayload();
  if ((_DWORD)result == 3 || (_DWORD)result == 2)
  {
    v3 = sub_22DFDCEC0();
    result = __swift_getEnumTagSinglePayload(a1, 1, v3);
    if (!(_DWORD)result)
      return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  }
  else if (!(_DWORD)result)
  {
    v3 = sub_22DFDCEC0();
    return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  }
  return result;
}

void *initializeWithCopy for HPTimer.Status(void *a1, const void *a2, uint64_t a3)
{
  int EnumCaseMultiPayload;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  switch(EnumCaseMultiPayload)
  {
    case 3:
      v8 = sub_22DFDCEC0();
      if (__swift_getEnumTagSinglePayload((uint64_t)a2, 1, v8))
        goto LABEL_8;
      goto LABEL_10;
    case 2:
      v8 = sub_22DFDCEC0();
      if (__swift_getEnumTagSinglePayload((uint64_t)a2, 1, v8))
      {
LABEL_8:
        v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_255DD7828);
        memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v9 - 8) + 64));
        goto LABEL_11;
      }
LABEL_10:
      (*(void (**)(void *, const void *, uint64_t))(*(_QWORD *)(v8 - 8) + 16))(a1, a2, v8);
      __swift_storeEnumTagSinglePayload((uint64_t)a1, 0, 1, v8);
      goto LABEL_11;
    case 0:
      v7 = sub_22DFDCEC0();
      (*(void (**)(void *, const void *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a1, a2, v7);
LABEL_11:
      swift_storeEnumTagMultiPayload();
      return a1;
  }
  memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64));
  return a1;
}

void *assignWithCopy for HPTimer.Status(void *a1, const void *a2, uint64_t a3)
{
  int EnumCaseMultiPayload;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  if (a1 == a2)
    return a1;
  sub_22DF58090((uint64_t)a1, type metadata accessor for HPTimer.Status);
  EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  switch(EnumCaseMultiPayload)
  {
    case 3:
      v8 = sub_22DFDCEC0();
      if (__swift_getEnumTagSinglePayload((uint64_t)a2, 1, v8))
      {
LABEL_7:
        v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_255DD7828);
        memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v9 - 8) + 64));
        goto LABEL_12;
      }
LABEL_11:
      (*(void (**)(void *, const void *, uint64_t))(*(_QWORD *)(v8 - 8) + 16))(a1, a2, v8);
      __swift_storeEnumTagSinglePayload((uint64_t)a1, 0, 1, v8);
      goto LABEL_12;
    case 2:
      v8 = sub_22DFDCEC0();
      if (__swift_getEnumTagSinglePayload((uint64_t)a2, 1, v8))
        goto LABEL_7;
      goto LABEL_11;
    case 0:
      v7 = sub_22DFDCEC0();
      (*(void (**)(void *, const void *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a1, a2, v7);
LABEL_12:
      swift_storeEnumTagMultiPayload();
      return a1;
  }
  memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64));
  return a1;
}

void *initializeWithTake for HPTimer.Status(void *a1, const void *a2, uint64_t a3)
{
  int EnumCaseMultiPayload;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  switch(EnumCaseMultiPayload)
  {
    case 3:
      v8 = sub_22DFDCEC0();
      if (__swift_getEnumTagSinglePayload((uint64_t)a2, 1, v8))
        goto LABEL_8;
      goto LABEL_10;
    case 2:
      v8 = sub_22DFDCEC0();
      if (__swift_getEnumTagSinglePayload((uint64_t)a2, 1, v8))
      {
LABEL_8:
        v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_255DD7828);
        memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v9 - 8) + 64));
        goto LABEL_11;
      }
LABEL_10:
      (*(void (**)(void *, const void *, uint64_t))(*(_QWORD *)(v8 - 8) + 32))(a1, a2, v8);
      __swift_storeEnumTagSinglePayload((uint64_t)a1, 0, 1, v8);
      goto LABEL_11;
    case 0:
      v7 = sub_22DFDCEC0();
      (*(void (**)(void *, const void *, uint64_t))(*(_QWORD *)(v7 - 8) + 32))(a1, a2, v7);
LABEL_11:
      swift_storeEnumTagMultiPayload();
      return a1;
  }
  memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64));
  return a1;
}

void *assignWithTake for HPTimer.Status(void *a1, const void *a2, uint64_t a3)
{
  int EnumCaseMultiPayload;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  if (a1 == a2)
    return a1;
  sub_22DF58090((uint64_t)a1, type metadata accessor for HPTimer.Status);
  EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  switch(EnumCaseMultiPayload)
  {
    case 3:
      v8 = sub_22DFDCEC0();
      if (__swift_getEnumTagSinglePayload((uint64_t)a2, 1, v8))
      {
LABEL_7:
        v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_255DD7828);
        memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v9 - 8) + 64));
        goto LABEL_12;
      }
LABEL_11:
      (*(void (**)(void *, const void *, uint64_t))(*(_QWORD *)(v8 - 8) + 32))(a1, a2, v8);
      __swift_storeEnumTagSinglePayload((uint64_t)a1, 0, 1, v8);
      goto LABEL_12;
    case 2:
      v8 = sub_22DFDCEC0();
      if (__swift_getEnumTagSinglePayload((uint64_t)a2, 1, v8))
        goto LABEL_7;
      goto LABEL_11;
    case 0:
      v7 = sub_22DFDCEC0();
      (*(void (**)(void *, const void *, uint64_t))(*(_QWORD *)(v7 - 8) + 32))(a1, a2, v7);
LABEL_12:
      swift_storeEnumTagMultiPayload();
      return a1;
  }
  memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64));
  return a1;
}

void sub_22DFBAB94()
{
  unint64_t v0;
  unint64_t v1;

  sub_22DFDCEC0();
  if (v0 <= 0x3F)
  {
    sub_22DF38818();
    if (v1 <= 0x3F)
      swift_initEnumMetadataMultiPayload();
  }
}

uint64_t storeEnumTagSinglePayload for HPTimer.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_22DFBAC6C + 4 * byte_22DFE9236[v4]))();
  *a1 = a2 + 3;
  return ((uint64_t (*)(void))((char *)sub_22DFBACA0 + 4 * byte_22DFE9231[v4]))();
}

uint64_t sub_22DFBACA0(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_22DFBACA8(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x22DFBACB0);
  return result;
}

uint64_t sub_22DFBACBC(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x22DFBACC4);
  *(_BYTE *)result = a2 + 3;
  return result;
}

uint64_t sub_22DFBACC8(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_22DFBACD0(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for HPTimer.CodingKeys()
{
  return &type metadata for HPTimer.CodingKeys;
}

uint64_t storeEnumTagSinglePayload for HPTimer.Status.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_22DFBAD38 + 4 * byte_22DFE9240[v4]))();
  *a1 = a2 + 4;
  return ((uint64_t (*)(void))((char *)sub_22DFBAD6C + 4 * byte_22DFE923B[v4]))();
}

uint64_t sub_22DFBAD6C(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_22DFBAD74(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x22DFBAD7CLL);
  return result;
}

uint64_t sub_22DFBAD88(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x22DFBAD90);
  *(_BYTE *)result = a2 + 4;
  return result;
}

uint64_t sub_22DFBAD94(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_22DFBAD9C(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for HPTimer.Status.CodingKeys()
{
  return &type metadata for HPTimer.Status.CodingKeys;
}

ValueMetadata *type metadata accessor for HPTimer.Status.RunningCodingKeys()
{
  return &type metadata for HPTimer.Status.RunningCodingKeys;
}

ValueMetadata *type metadata accessor for HPTimer.Status.PausedCodingKeys()
{
  return &type metadata for HPTimer.Status.PausedCodingKeys;
}

ValueMetadata *type metadata accessor for HPTimer.Status.FiringCodingKeys()
{
  return &type metadata for HPTimer.Status.FiringCodingKeys;
}

uint64_t _s15HomePodSettings7HPTimerV6StatusO17RunningCodingKeysOwst_0(uint64_t a1, int a2, int a3)
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
    return ((uint64_t (*)(void))((char *)sub_22DFBAE2C + 4 * byte_22DFE9245[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_22DFBAE4C + 4 * byte_22DFE924A[v4]))();
}

_BYTE *sub_22DFBAE2C(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_22DFBAE4C(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_22DFBAE54(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_22DFBAE5C(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_22DFBAE64(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_22DFBAE6C(_DWORD *result)
{
  *result = 0;
  return result;
}

ValueMetadata *type metadata accessor for HPTimer.Status.DismissedCodingKeys()
{
  return &type metadata for HPTimer.Status.DismissedCodingKeys;
}

ValueMetadata *type metadata accessor for HPTimer.Status.UnknownCodingKeys()
{
  return &type metadata for HPTimer.Status.UnknownCodingKeys;
}

unint64_t sub_22DFBAE9C()
{
  unint64_t result;

  result = qword_255DDC460;
  if (!qword_255DDC460)
  {
    result = MEMORY[0x22E323AEC](&unk_22DFE9654, &type metadata for HPTimer.Status.DismissedCodingKeys);
    atomic_store(result, (unint64_t *)&qword_255DDC460);
  }
  return result;
}

unint64_t sub_22DFBAEDC()
{
  unint64_t result;

  result = qword_255DDC468;
  if (!qword_255DDC468)
  {
    result = MEMORY[0x22E323AEC](&unk_22DFE970C, &type metadata for HPTimer.Status.FiringCodingKeys);
    atomic_store(result, (unint64_t *)&qword_255DDC468);
  }
  return result;
}

unint64_t sub_22DFBAF1C()
{
  unint64_t result;

  result = qword_255DDC470;
  if (!qword_255DDC470)
  {
    result = MEMORY[0x22E323AEC](&unk_22DFE97C4, &type metadata for HPTimer.Status.PausedCodingKeys);
    atomic_store(result, (unint64_t *)&qword_255DDC470);
  }
  return result;
}

unint64_t sub_22DFBAF5C()
{
  unint64_t result;

  result = qword_255DDC478;
  if (!qword_255DDC478)
  {
    result = MEMORY[0x22E323AEC](&unk_22DFE987C, &type metadata for HPTimer.Status.RunningCodingKeys);
    atomic_store(result, (unint64_t *)&qword_255DDC478);
  }
  return result;
}

unint64_t sub_22DFBAF9C()
{
  unint64_t result;

  result = qword_255DDC480;
  if (!qword_255DDC480)
  {
    result = MEMORY[0x22E323AEC](&unk_22DFE9934, &type metadata for HPTimer.Status.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_255DDC480);
  }
  return result;
}

unint64_t sub_22DFBAFDC()
{
  unint64_t result;

  result = qword_255DDC488;
  if (!qword_255DDC488)
  {
    result = MEMORY[0x22E323AEC](&unk_22DFE99EC, &type metadata for HPTimer.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_255DDC488);
  }
  return result;
}

unint64_t sub_22DFBB01C()
{
  unint64_t result;

  result = qword_255DDC490;
  if (!qword_255DDC490)
  {
    result = MEMORY[0x22E323AEC](&unk_22DFE995C, &type metadata for HPTimer.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_255DDC490);
  }
  return result;
}

unint64_t sub_22DFBB05C()
{
  unint64_t result;

  result = qword_255DDC498;
  if (!qword_255DDC498)
  {
    result = MEMORY[0x22E323AEC](&unk_22DFE9984, &type metadata for HPTimer.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_255DDC498);
  }
  return result;
}

unint64_t sub_22DFBB09C()
{
  unint64_t result;

  result = qword_255DDC4A0;
  if (!qword_255DDC4A0)
  {
    result = MEMORY[0x22E323AEC](&unk_22DFE97EC, &type metadata for HPTimer.Status.RunningCodingKeys);
    atomic_store(result, (unint64_t *)&qword_255DDC4A0);
  }
  return result;
}

unint64_t sub_22DFBB0DC()
{
  unint64_t result;

  result = qword_255DDC4A8;
  if (!qword_255DDC4A8)
  {
    result = MEMORY[0x22E323AEC](&unk_22DFE9814, &type metadata for HPTimer.Status.RunningCodingKeys);
    atomic_store(result, (unint64_t *)&qword_255DDC4A8);
  }
  return result;
}

unint64_t sub_22DFBB11C()
{
  unint64_t result;

  result = qword_255DDC4B0;
  if (!qword_255DDC4B0)
  {
    result = MEMORY[0x22E323AEC](&unk_22DFE9734, &type metadata for HPTimer.Status.PausedCodingKeys);
    atomic_store(result, (unint64_t *)&qword_255DDC4B0);
  }
  return result;
}

unint64_t sub_22DFBB15C()
{
  unint64_t result;

  result = qword_255DDC4B8;
  if (!qword_255DDC4B8)
  {
    result = MEMORY[0x22E323AEC](&unk_22DFE975C, &type metadata for HPTimer.Status.PausedCodingKeys);
    atomic_store(result, (unint64_t *)&qword_255DDC4B8);
  }
  return result;
}

unint64_t sub_22DFBB19C()
{
  unint64_t result;

  result = qword_255DDC4C0;
  if (!qword_255DDC4C0)
  {
    result = MEMORY[0x22E323AEC](&unk_22DFE967C, &type metadata for HPTimer.Status.FiringCodingKeys);
    atomic_store(result, (unint64_t *)&qword_255DDC4C0);
  }
  return result;
}

unint64_t sub_22DFBB1DC()
{
  unint64_t result;

  result = qword_255DDC4C8;
  if (!qword_255DDC4C8)
  {
    result = MEMORY[0x22E323AEC](&unk_22DFE96A4, &type metadata for HPTimer.Status.FiringCodingKeys);
    atomic_store(result, (unint64_t *)&qword_255DDC4C8);
  }
  return result;
}

unint64_t sub_22DFBB21C()
{
  unint64_t result;

  result = qword_255DDC4D0;
  if (!qword_255DDC4D0)
  {
    result = MEMORY[0x22E323AEC](&unk_22DFE95C4, &type metadata for HPTimer.Status.DismissedCodingKeys);
    atomic_store(result, (unint64_t *)&qword_255DDC4D0);
  }
  return result;
}

unint64_t sub_22DFBB25C()
{
  unint64_t result;

  result = qword_255DDC4D8;
  if (!qword_255DDC4D8)
  {
    result = MEMORY[0x22E323AEC](&unk_22DFE95EC, &type metadata for HPTimer.Status.DismissedCodingKeys);
    atomic_store(result, (unint64_t *)&qword_255DDC4D8);
  }
  return result;
}

unint64_t sub_22DFBB29C()
{
  unint64_t result;

  result = qword_255DDC4E0;
  if (!qword_255DDC4E0)
  {
    result = MEMORY[0x22E323AEC](&unk_22DFE9574, &type metadata for HPTimer.Status.UnknownCodingKeys);
    atomic_store(result, (unint64_t *)&qword_255DDC4E0);
  }
  return result;
}

unint64_t sub_22DFBB2DC()
{
  unint64_t result;

  result = qword_255DDC4E8;
  if (!qword_255DDC4E8)
  {
    result = MEMORY[0x22E323AEC](&unk_22DFE959C, &type metadata for HPTimer.Status.UnknownCodingKeys);
    atomic_store(result, (unint64_t *)&qword_255DDC4E8);
  }
  return result;
}

unint64_t sub_22DFBB31C()
{
  unint64_t result;

  result = qword_255DDC4F0;
  if (!qword_255DDC4F0)
  {
    result = MEMORY[0x22E323AEC](&unk_22DFE98A4, &type metadata for HPTimer.Status.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_255DDC4F0);
  }
  return result;
}

unint64_t sub_22DFBB35C()
{
  unint64_t result;

  result = qword_255DDC4F8;
  if (!qword_255DDC4F8)
  {
    result = MEMORY[0x22E323AEC](&unk_22DFE98CC, &type metadata for HPTimer.Status.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_255DDC4F8);
  }
  return result;
}

uint64_t OUTLINED_FUNCTION_1_24()
{
  return sub_22DFDDE14();
}

uint64_t OUTLINED_FUNCTION_3_27@<X0>(uint64_t (*a1)(uint64_t, uint64_t)@<X8>)
{
  uint64_t v1;
  uint64_t v2;

  return a1(v2, v1);
}

uint64_t OUTLINED_FUNCTION_5_24()
{
  return sub_22DFDDE98();
}

uint64_t OUTLINED_FUNCTION_7_24()
{
  return sub_22DFDD4C0();
}

uint64_t OUTLINED_FUNCTION_8_26()
{
  uint64_t v0;
  uint64_t v1;

  return (*(uint64_t (**)(_QWORD, _QWORD))(v0 + 8))(*(_QWORD *)(v1 - 128), *(_QWORD *)(v1 - 120));
}

uint64_t OUTLINED_FUNCTION_10_22()
{
  return swift_getEnumCaseMultiPayload();
}

uint64_t OUTLINED_FUNCTION_11_22()
{
  return sub_22DFDDE98();
}

uint64_t OUTLINED_FUNCTION_14_19()
{
  return sub_22DFDD568();
}

uint64_t OUTLINED_FUNCTION_17_13()
{
  return type metadata accessor for HPTimer.Status(0);
}

uint64_t OUTLINED_FUNCTION_19_16@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(a1 + 8))(v1, v2);
}

uint64_t OUTLINED_FUNCTION_20_11@<X0>(uint64_t a1@<X0>, uint64_t (*a2)(uint64_t, uint64_t)@<X8>)
{
  uint64_t v2;

  return a2(a1, v2);
}

uint64_t OUTLINED_FUNCTION_22_14()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 264) + 8))(v1, v0);
}

void OUTLINED_FUNCTION_25_14(uint64_t a1, uint64_t (*a2)(_QWORD))
{
  uint64_t v2;

  sub_22DF58090(v2, a2);
}

uint64_t OUTLINED_FUNCTION_26_10(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  return __swift_getEnumTagSinglePayload(a1, a2, v2);
}

uint64_t OUTLINED_FUNCTION_29_14()
{
  return sub_22DFDDE44();
}

uint64_t OUTLINED_FUNCTION_31_8()
{
  return sub_22DFDCEC0();
}

void OUTLINED_FUNCTION_32_10(uint64_t a1@<X8>, uint64_t a2)
{
  uint64_t v2;

  *(_QWORD *)(v2 - 184) = (char *)&a2 - ((a1 + 15) & 0xFFFFFFFFFFFFFFF0);
}

void OUTLINED_FUNCTION_33_9(uint64_t a1@<X8>, uint64_t a2)
{
  uint64_t v2;

  *(_QWORD *)(v2 - 168) = (char *)&a2 - ((a1 + 15) & 0xFFFFFFFFFFFFFFF0);
}

uint64_t OUTLINED_FUNCTION_36_7()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 256) + 8))(v0, v1);
}

uint64_t OUTLINED_FUNCTION_37_10()
{
  return swift_getEnumCaseMultiPayload();
}

uint64_t OUTLINED_FUNCTION_40_7()
{
  return sub_22DFDCEC0();
}

void OUTLINED_FUNCTION_41_5()
{
  uint64_t v0;

  *(_QWORD *)(v0 - 112) = 40;
  *(_QWORD *)(v0 - 104) = 0xE100000000000000;
}

void OUTLINED_FUNCTION_47_7(uint64_t a1, uint64_t a2, uint64_t (*a3)(_QWORD))
{
  uint64_t v3;

  sub_22DFB94C4(a1, v3, a3);
}

uint64_t OUTLINED_FUNCTION_48_2()
{
  uint64_t v0;

  return v0;
}

void OUTLINED_FUNCTION_49_4(uint64_t a1, uint64_t a2)
{
  uint64_t (*v2)(_QWORD);

  sub_22DFB94C4(a1, a2, v2);
}

uint64_t OUTLINED_FUNCTION_50_6()
{
  uint64_t v0;

  return v0;
}

uint64_t OUTLINED_FUNCTION_51_7()
{
  return sub_22DFDDEBC();
}

uint64_t OUTLINED_FUNCTION_53_6()
{
  return swift_getEnumCaseMultiPayload();
}

uint64_t OUTLINED_FUNCTION_55_4()
{
  return type metadata accessor for HPTimer.Status(0);
}

uint64_t OUTLINED_FUNCTION_56_4()
{
  return sub_22DFDE000();
}

uint64_t OUTLINED_FUNCTION_57_6(uint64_t a1)
{
  uint64_t v1;

  return sub_22DF37E5C(a1, v1);
}

uint64_t OUTLINED_FUNCTION_58_8()
{
  uint64_t v0;
  uint64_t v1;

  return v0 + *(int *)(*(_QWORD *)(v1 - 136) + 20);
}

unint64_t OUTLINED_FUNCTION_59_6()
{
  uint64_t v0;

  *(_BYTE *)(v0 - 89) = 4;
  return sub_22DFB75CC();
}

unint64_t OUTLINED_FUNCTION_60_4()
{
  uint64_t v0;

  *(_BYTE *)(v0 - 90) = 3;
  return sub_22DFB7608();
}

uint64_t OUTLINED_FUNCTION_62_4(uint64_t a1)
{
  uint64_t v1;

  return sub_22DF37EA4(a1, *(_QWORD *)(v1 - 128));
}

void OUTLINED_FUNCTION_65_5(uint64_t a1, uint64_t *a2)
{
  uint64_t v2;

  sub_22DF58068(v2, a2);
}

void OUTLINED_FUNCTION_66_4(uint64_t a1, uint64_t (*a2)(_QWORD))
{
  uint64_t v2;

  sub_22DF58090(v2, a2);
}

uint64_t OUTLINED_FUNCTION_67_4()
{
  uint64_t v0;
  uint64_t v1;

  return sub_22DF37E5C(v1, v0);
}

uint64_t OUTLINED_FUNCTION_68_2()
{
  return sub_22DFDD520();
}

unint64_t OUTLINED_FUNCTION_69_4()
{
  uint64_t v0;

  *(_BYTE *)(v0 - 91) = 2;
  return sub_22DFB7644();
}

uint64_t OUTLINED_FUNCTION_70_4()
{
  return sub_22DFDD568();
}

uint64_t OUTLINED_FUNCTION_71_2()
{
  return swift_getEnumCaseMultiPayload();
}

unint64_t OUTLINED_FUNCTION_73_3()
{
  uint64_t v0;

  *(_BYTE *)(v0 - 92) = 1;
  return sub_22DFB7680();
}

uint64_t Collection.subscript.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _BYTE *v5;
  char v6;
  void (*v7)(_BYTE *, _QWORD);
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _BYTE v15[32];

  v2 = OUTLINED_FUNCTION_1_25();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = &v15[-v4];
  sub_22DFDDA00();
  swift_getAssociatedConformanceWitness();
  OUTLINED_FUNCTION_1_25();
  swift_getAssociatedConformanceWitness();
  v6 = sub_22DFDD628();
  (*(void (**)(_BYTE *, uint64_t))(v3 + 8))(v5, v2);
  if ((v6 & 1) != 0)
  {
    v7 = (void (*)(_BYTE *, _QWORD))sub_22DFDDA60();
    v9 = v8;
    v10 = OUTLINED_FUNCTION_2_27();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 16))(a1, v9, v10);
    v7(v15, 0);
    v11 = a1;
    v12 = 0;
    v13 = v10;
  }
  else
  {
    v13 = OUTLINED_FUNCTION_2_27();
    v11 = a1;
    v12 = 1;
  }
  return __swift_storeEnumTagSinglePayload(v11, v12, 1, v13);
}

void Collection.split(maxLength:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v7;
  uint64_t v8;
  uint64_t AssociatedTypeWitness;
  unint64_t v10;
  uint64_t v11;
  _QWORD v12[10];

  v7 = sub_22DFDD9DC();
  if (a1)
  {
    v12[7] = 0;
    v12[8] = v7;
    v12[9] = a1;
    MEMORY[0x24BDAC7A8](v7);
    v12[2] = a2;
    v12[3] = a3;
    v12[4] = v3;
    v12[5] = a1;
    v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_255DDC500);
    AssociatedTypeWitness = swift_getAssociatedTypeWitness();
    v10 = sub_22DFBC8A8();
    sub_22DFBB968((void (*)(char *, char *))sub_22DFBC888, (uint64_t)v12, v8, AssociatedTypeWitness, MEMORY[0x24BEE4078], v10, MEMORY[0x24BEE40A8], v11);
    OUTLINED_FUNCTION_13_3();
  }
  else
  {
    __break(1u);
  }
}

uint64_t sub_22DFBB968(void (*a1)(char *, char *), uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t AssociatedTypeWitness;
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
  uint64_t result;
  char *v31;
  uint64_t v32;
  int EnumTagSinglePayload;
  char *v34;
  uint64_t v35;
  _QWORD v36[2];
  uint64_t v37;
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
  char *v48;
  char *v49;
  char *v50;
  char *v51;
  void (*v52)(char *, char *);
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;

  v38 = a8;
  v39 = a5;
  v9 = v8;
  v52 = a1;
  v53 = a2;
  v37 = *(_QWORD *)(a5 - 8);
  v11 = MEMORY[0x24BDAC7A8](a1);
  v51 = (char *)v36 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v11);
  v50 = (char *)v36 - v13;
  v15 = v14;
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v54 = *(_QWORD *)(AssociatedTypeWitness - 8);
  MEMORY[0x24BDAC7A8](AssociatedTypeWitness);
  v42 = (char *)v36 - v17;
  v18 = sub_22DFDDB2C();
  v40 = *(_QWORD *)(v18 - 8);
  v41 = v18;
  v19 = MEMORY[0x24BDAC7A8](v18);
  v48 = (char *)v36 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  v21 = MEMORY[0x24BDAC7A8](v19);
  v23 = (char *)v36 - v22;
  v24 = MEMORY[0x24BDAC7A8](v21);
  v36[1] = (char *)v36 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
  v26 = MEMORY[0x24BDAC7A8](v24);
  v47 = *(_QWORD *)(v15 - 8);
  MEMORY[0x24BDAC7A8](v26);
  v46 = (char *)v36 - ((v27 + 15) & 0xFFFFFFFFFFFFFFF0);
  v45 = a6;
  v55 = swift_getAssociatedTypeWitness();
  v43 = *(_QWORD *)(v55 - 8);
  MEMORY[0x24BDAC7A8](v55);
  v49 = (char *)v36 - v28;
  v29 = sub_22DFDD5C8();
  v56 = sub_22DFDD3E8();
  sub_22DFDDD24();
  sub_22DFDDD00();
  (*(void (**)(char *, uint64_t, uint64_t))(v47 + 16))(v46, v44, v15);
  v47 = v15;
  result = sub_22DFDD5BC();
  if (v29 < 0)
  {
    __break(1u);
LABEL_18:
    __break(1u);
    return result;
  }
  if (v29)
  {
    swift_getAssociatedConformanceWitness();
    v31 = v49;
    while (1)
    {
      sub_22DFDDB68();
      result = __swift_getEnumTagSinglePayload((uint64_t)v23, 1, AssociatedTypeWitness);
      if ((_DWORD)result == 1)
        goto LABEL_18;
      v52(v23, v51);
      if (v9)
      {
        (*(void (**)(char *, uint64_t))(v43 + 8))(v31, v55);
        swift_release();
        (*(void (**)(uint64_t, char *, uint64_t))(v37 + 32))(v38, v51, v39);
        return (*(uint64_t (**)(char *, uint64_t))(v54 + 8))(v23, AssociatedTypeWitness);
      }
      v9 = 0;
      (*(void (**)(char *, uint64_t))(v54 + 8))(v23, AssociatedTypeWitness);
      sub_22DFDDD0C();
      if (!--v29)
      {
        v32 = (uint64_t)v48;
        goto LABEL_9;
      }
    }
  }
  swift_getAssociatedConformanceWitness();
  v32 = (uint64_t)v48;
  v31 = v49;
LABEL_9:
  sub_22DFDDB68();
  EnumTagSinglePayload = __swift_getEnumTagSinglePayload(v32, 1, AssociatedTypeWitness);
  v34 = v42;
  if (EnumTagSinglePayload == 1)
  {
    v35 = (uint64_t)v48;
LABEL_14:
    (*(void (**)(char *, uint64_t))(v43 + 8))(v31, v55);
    (*(void (**)(uint64_t, uint64_t))(v40 + 8))(v35, v41);
    return v56;
  }
  else
  {
    v51 = *(char **)(v54 + 32);
    v35 = (uint64_t)v48;
    while (1)
    {
      ((void (*)(char *, uint64_t, uint64_t))v51)(v34, v35, AssociatedTypeWitness);
      v52(v34, v50);
      if (v9)
        break;
      v9 = 0;
      (*(void (**)(char *, uint64_t))(v54 + 8))(v34, AssociatedTypeWitness);
      sub_22DFDDD0C();
      sub_22DFDDB68();
      if (__swift_getEnumTagSinglePayload(v35, 1, AssociatedTypeWitness) == 1)
        goto LABEL_14;
    }
    (*(void (**)(char *, uint64_t))(v54 + 8))(v34, AssociatedTypeWitness);
    (*(void (**)(char *, uint64_t))(v43 + 8))(v31, v55);
    swift_release();
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v37 + 32))(v38, v50, v39);
  }
}

Swift::String __swiftcall String.filled(to:with:)(Swift::Int to, Swift::String with)
{
  uint64_t v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *object;
  uint64_t countAndFlagsBits;
  uint64_t v9;
  void *v10;
  BOOL v11;
  uint64_t v12;
  Swift::String result;

  v4 = v3;
  v5 = v2;
  object = with._object;
  countAndFlagsBits = with._countAndFlagsBits;
  v9 = sub_22DFDD550();
  v11 = __OFSUB__(to, v9);
  v12 = to - v9;
  if (v11)
  {
    __break(1u);
  }
  else
  {
    if (v12 < 1)
    {
      OUTLINED_FUNCTION_130_0();
    }
    else
    {
      sub_22DFDD448();
      MEMORY[0x22E3228B0](countAndFlagsBits, object, v12);
      OUTLINED_FUNCTION_130_0();
      sub_22DFDD568();
      swift_bridgeObjectRelease();
    }
    v9 = v5;
    v10 = v4;
  }
  result._object = v10;
  result._countAndFlagsBits = v9;
  return result;
}

void Error.nsError.getter(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;

  v2 = *(_QWORD *)(a1 - 8);
  MEMORY[0x24BDAC7A8](a1);
  v4 = (char *)&v9 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v2 + 16))(v4, v5, a1);
  v6 = sub_22DFDDF1C();
  if (v6)
  {
    v7 = (void *)v6;
    (*(void (**)(char *, uint64_t))(v2 + 8))(v4, a1);
  }
  else
  {
    v7 = (void *)swift_allocError();
    (*(void (**)(uint64_t, char *, uint64_t))(v2 + 32))(v8, v4, a1);
  }
  sub_22DFDCE30();

  OUTLINED_FUNCTION_13_3();
}

uint64_t Collection.min<A>(by:)()
{
  return sub_22DFDD5D4();
}

uint64_t sub_22DFBC054(uint64_t a1, uint64_t a2, _QWORD *a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  char *v9;
  char v10;
  void (*v11)(char *, uint64_t);
  uint64_t v13;

  v3 = *(_QWORD *)(*MEMORY[0x24BEE46A8] + *a3 + 8);
  v4 = *(_QWORD *)(v3 - 8);
  v5 = MEMORY[0x24BDAC7A8](a1);
  v7 = (char *)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v5);
  v9 = (char *)&v13 - v8;
  swift_getAtKeyPath();
  swift_getAtKeyPath();
  v10 = sub_22DFDD4D8();
  v11 = *(void (**)(char *, uint64_t))(v4 + 8);
  v11(v7, v3);
  v11(v9, v3);
  return v10 & 1;
}

uint64_t Collection.reduceToDictionary<A>(by:)()
{
  uint64_t v1;

  swift_getTupleTypeMetadata2();
  sub_22DFDD694();
  sub_22DFDD430();
  sub_22DFDD484();
  sub_22DFDD5F8();
  return v1;
}

uint64_t sub_22DFBC234(uint64_t a1, uint64_t a2, _QWORD *a3)
{
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  char *v16;
  _QWORD v18[2];

  v18[1] = a1;
  v4 = (uint64_t *)(*a3 + *MEMORY[0x24BEE46A8]);
  v5 = *v4;
  v6 = sub_22DFDDB2C();
  v7 = MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)v18 - v8;
  v10 = v4[1];
  v11 = *(_QWORD *)(v10 - 8);
  v12 = MEMORY[0x24BDAC7A8](v7);
  v14 = (char *)v18 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v12);
  v16 = (char *)v18 - v15;
  swift_getAtKeyPath();
  (*(void (**)(char *, char *, uint64_t))(v11 + 16))(v14, v16, v10);
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(v9, a2, v5);
  __swift_storeEnumTagSinglePayload((uint64_t)v9, 0, 1, v5);
  sub_22DFDD484();
  sub_22DFDD4A8();
  return (*(uint64_t (**)(char *, uint64_t))(v11 + 8))(v16, v10);
}

uint64_t sub_22DFBC3AC@<X0>(uint64_t a1@<X1>, uint64_t a2@<X2>, uint64_t a3@<X3>, uint64_t a4@<X4>, uint64_t a5@<X8>)
{
  uint64_t AssociatedTypeWitness;
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
  char *v27;
  uint64_t v28;
  char *v29;
  void (*v30)(char *, uint64_t);
  uint64_t v31;
  char *v32;
  uint64_t v33;
  char *v34;
  void (*v35)(char *, uint64_t, uint64_t);
  char *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  char *v40;
  uint64_t result;
  uint64_t v42;
  char *v43;
  char *v44;
  void (*v45)(char *, char *, uint64_t);
  uint64_t v46;
  char *v47;
  char *v48;
  void (*v49)(char *, char *, uint64_t);
  char *v50;
  char *v51;
  uint64_t v52;
  void (*v53)(char *, uint64_t);
  uint64_t v54;
  char *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  char *v59;
  char *v60;
  char *v61;
  uint64_t TupleTypeMetadata2;
  uint64_t v63;
  uint64_t v64;
  char *v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  char *v69;
  uint64_t v70;
  uint64_t AssociatedConformanceWitness;
  void (*v72)(char *, uint64_t);
  uint64_t v73;
  char *v74;
  char *v75;

  v73 = a2;
  v66 = a5;
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
  v9 = MEMORY[0x24BDAC7A8](TupleTypeMetadata2);
  v65 = (char *)&v56 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v9);
  v61 = (char *)&v56 - v11;
  AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
  v12 = sub_22DFDDA84();
  v63 = *(_QWORD *)(v12 - 8);
  v64 = v12;
  v13 = MEMORY[0x24BDAC7A8](v12);
  v60 = (char *)&v56 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = MEMORY[0x24BDAC7A8](v13);
  v59 = (char *)&v56 - v16;
  v68 = *(_QWORD *)(a3 - 8);
  MEMORY[0x24BDAC7A8](v15);
  v69 = (char *)&v56 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18 = sub_22DFDDB2C();
  v57 = *(_QWORD *)(v18 - 8);
  v58 = v18;
  v19 = MEMORY[0x24BDAC7A8](v18);
  v21 = (char *)&v56 - v20;
  v22 = *(_QWORD *)(AssociatedTypeWitness - 8);
  v23 = MEMORY[0x24BDAC7A8](v19);
  v75 = (char *)&v56 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  v25 = MEMORY[0x24BDAC7A8](v23);
  v27 = (char *)&v56 - v26;
  MEMORY[0x24BDAC7A8](v25);
  v29 = (char *)&v56 - v28;
  sub_22DFDD9C4();
  sub_22DFDD9F4();
  v70 = v22;
  v30 = *(void (**)(char *, uint64_t))(v22 + 8);
  v30(v27, AssociatedTypeWitness);
  sub_22DFDDA18();
  v74 = v29;
  v31 = v68;
  sub_22DFDD9E8();
  v32 = v27;
  v33 = a3;
  v34 = v69;
  v72 = v30;
  v30(v32, AssociatedTypeWitness);
  v35 = *(void (**)(char *, uint64_t, uint64_t))(v31 + 16);
  v67 = a1;
  v73 = v33;
  v35(v34, a1, v33);
  if (__swift_getEnumTagSinglePayload((uint64_t)v21, 1, AssociatedTypeWitness) == 1)
  {
    v36 = v75;
    v37 = v73;
    sub_22DFDDA18();
    (*(void (**)(char *, uint64_t))(v31 + 8))(v34, v37);
    (*(void (**)(char *, uint64_t))(v57 + 8))(v21, v58);
    v38 = a4;
    v39 = v70;
  }
  else
  {
    (*(void (**)(char *, uint64_t))(v31 + 8))(v34, v73);
    v39 = v70;
    v36 = v75;
    (*(void (**)(char *, char *, uint64_t))(v70 + 32))(v75, v21, AssociatedTypeWitness);
    v38 = a4;
  }
  v40 = v74;
  result = sub_22DFDD4E4();
  if ((result & 1) != 0)
  {
    v43 = v61;
    v42 = TupleTypeMetadata2;
    v44 = &v61[*(int *)(TupleTypeMetadata2 + 48)];
    v45 = *(void (**)(char *, char *, uint64_t))(v39 + 16);
    v45(v61, v40, AssociatedTypeWitness);
    v45(v44, v36, AssociatedTypeWitness);
    v46 = *(int *)(v42 + 48);
    AssociatedConformanceWitness = v38;
    v47 = v65;
    v48 = &v65[v46];
    v45(v65, v43, AssociatedTypeWitness);
    v45(v48, v44, AssociatedTypeWitness);
    v49 = *(void (**)(char *, char *, uint64_t))(v39 + 32);
    v50 = v60;
    v49(v60, v47, AssociatedTypeWitness);
    v72(v48, AssociatedTypeWitness);
    v51 = &v47[*(int *)(v42 + 48)];
    v49(v47, v43, AssociatedTypeWitness);
    v49(v51, v44, AssociatedTypeWitness);
    v52 = v64;
    v49(&v50[*(int *)(v64 + 36)], v51, AssociatedTypeWitness);
    v53 = v72;
    v72(v47, AssociatedTypeWitness);
    v54 = v63;
    v55 = v59;
    (*(void (**)(char *, char *, uint64_t))(v63 + 32))(v59, v50, v52);
    sub_22DFDDA54();
    (*(void (**)(char *, uint64_t))(v54 + 8))(v55, v52);
    v53(v75, AssociatedTypeWitness);
    return ((uint64_t (*)(char *, uint64_t))v53)(v74, AssociatedTypeWitness);
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_22DFBC888@<X0>(uint64_t a1@<X8>)
{
  uint64_t *v1;

  return sub_22DFBC3AC(v1[4], v1[5], v1[2], v1[3], a1);
}

unint64_t sub_22DFBC8A8()
{
  unint64_t result;
  uint64_t v1;

  result = qword_255DDC508;
  if (!qword_255DDC508)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_255DDC500);
    result = MEMORY[0x22E323AEC](MEMORY[0x24BEE49C8], v1);
    atomic_store(result, (unint64_t *)&qword_255DDC508);
  }
  return result;
}

uint64_t sub_22DFBC8EC(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  return sub_22DFBC054(a1, a2, *(_QWORD **)(v2 + 40)) & 1;
}

Swift::Void __swiftcall String.print(terminator:)(Swift::String terminator)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v3 = v2;
  v4 = v1;
  __swift_instantiateConcreteTypeFromMangledName(qword_255DDC510);
  v5 = swift_allocObject();
  *(_OWORD *)(v5 + 16) = xmmword_22DFE17C0;
  *(_QWORD *)(v5 + 56) = MEMORY[0x24BEE0D00];
  *(_QWORD *)(v5 + 32) = v4;
  *(_QWORD *)(v5 + 40) = v3;
  OUTLINED_FUNCTION_130_0();
  sub_22DFDDFE8();
  swift_bridgeObjectRelease();
}

uint64_t String.string.getter()
{
  sub_22DFDD448();
  return sub_22DFDD5A4();
}

Swift::Double __swiftcall Double.init(days:hours:minutes:seconds:)(Swift::Int days, Swift::Int hours, Swift::Int minutes, Swift::Int seconds)
{
  return (double)days * 86400.0 + (double)hours * 3600.0 + (double)minutes * 60.0 + (double)seconds;
}

uint64_t sub_22DFBCA24(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  return sub_22DFBC234(a1, a2, *(_QWORD **)(v2 + 40));
}

uint64_t OUTLINED_FUNCTION_1_25()
{
  return swift_getAssociatedTypeWitness();
}

uint64_t OUTLINED_FUNCTION_2_27()
{
  return swift_getAssociatedTypeWitness();
}

_QWORD *sub_22DFBCA5C(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  a1[2] = a2[2];
  sub_22DFDD448();
  sub_22DFDD448();
  sub_22DFDD448();
  return a1;
}

void type metadata accessor for MemberConnectionCache()
{
  JUMPOUT(0x22E323A68);
}

uint64_t sub_22DFBCAB4()
{
  uint64_t v0;

  OUTLINED_FUNCTION_4_26();
  OUTLINED_FUNCTION_3_28();
  v0 = sub_22DFDD430();
  OUTLINED_FUNCTION_8_27();
  OUTLINED_FUNCTION_4_26();
  OUTLINED_FUNCTION_3_28();
  sub_22DFDD430();
  swift_getAssociatedTypeWitness();
  OUTLINED_FUNCTION_4_26();
  OUTLINED_FUNCTION_3_28();
  swift_getAssociatedConformanceWitness();
  sub_22DFDD430();
  return v0;
}

void sub_22DFBCBBC()
{
  JUMPOUT(0x22E3227C0);
}

void sub_22DFBCBCC(uint64_t a1@<X0>, _QWORD *a2@<X1>, uint64_t a3@<X3>, uint64_t a4@<X5>, uint64_t a5@<X6>, uint64_t a6@<X7>, uint64_t a7@<X8>, uint64_t a8, uint64_t a9)
{
  uint64_t *v14;
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
  uint64_t TupleTypeMetadata2;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t (*v35)(uint64_t, uint64_t);
  char *v36;
  char v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  _QWORD *v43;
  uint64_t v44;
  uint64_t v45;

  v25 = a1;
  v27 = a7;
  v14 = (uint64_t *)(*a2 + *MEMORY[0x24BEE46A8]);
  v15 = *v14;
  TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
  v24 = sub_22DFDDB2C();
  v23 = *(_QWORD *)(v24 - 8);
  MEMORY[0x24BDAC7A8](v24);
  v17 = (char *)&v22 - v16;
  v45 = a3;
  v38 = a4;
  v39 = a5;
  v40 = a6;
  v41 = a8;
  v42 = a9;
  v43 = a2;
  v44 = v25;
  v28 = a4;
  v29 = v15;
  v30 = v14[1];
  v31 = a5;
  v32 = a6;
  v33 = a8;
  v34 = a9;
  v35 = sub_22DFBD4AC;
  v36 = &v37;
  OUTLINED_FUNCTION_8_27();
  v18 = sub_22DFDD484();
  sub_22DFDD448();
  MEMORY[0x22E323AEC](MEMORY[0x24BEE04D8], v18);
  sub_22DFDD5E0();
  v19 = TupleTypeMetadata2;
  swift_bridgeObjectRelease();
  if (__swift_getEnumTagSinglePayload((uint64_t)v17, 1, v19) == 1)
  {
    (*(void (**)(char *, uint64_t))(v23 + 8))(v17, v24);
    OUTLINED_FUNCTION_2_28(v27, 1);
  }
  else
  {
    v20 = &v17[*(int *)(v19 + 48)];
    v21 = v27;
    (*(void (**)(uint64_t, char *, uint64_t))(*(_QWORD *)(a4 - 8) + 32))(v27, v20, a4);
    OUTLINED_FUNCTION_2_28(v21, 0);
    (*(void (**)(char *, uint64_t))(*(_QWORD *)(v15 - 8) + 8))(v17, v15);
  }
  OUTLINED_FUNCTION_4_1();
}

void sub_22DFBCDC8()
{
  swift_getAssociatedTypeWitness();
  swift_getAssociatedConformanceWitness();
  JUMPOUT(0x22E3227C0);
}

uint64_t sub_22DFBCE68()
{
  uint64_t v0;

  sub_22DFDD46C();
  v0 = sub_22DFDD454();
  MEMORY[0x22E323AEC](MEMORY[0x24BEE03C0], v0);
  return sub_22DFDD724();
}

void sub_22DFBCEEC(uint64_t a1, uint64_t a2, uint64_t a3)
{
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
  char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22[6];

  v22[1] = a1;
  v22[0] = a2;
  v22[4] = *(_QWORD *)(a3 + 40);
  v22[5] = swift_getAssociatedTypeWitness();
  OUTLINED_FUNCTION_7_7();
  MEMORY[0x24BDAC7A8](v5);
  v22[3] = (uint64_t)v22 - v6;
  OUTLINED_FUNCTION_10_23();
  OUTLINED_FUNCTION_7_7();
  v8 = MEMORY[0x24BDAC7A8](v7);
  v10 = (char *)v22 - v9;
  v11 = *(_QWORD *)(a3 + 24);
  MEMORY[0x24BDAC7A8](v8);
  OUTLINED_FUNCTION_80();
  v14 = v13 - v12;
  sub_22DFDDB2C();
  OUTLINED_FUNCTION_7_7();
  v16 = MEMORY[0x24BDAC7A8](v15);
  v18 = (char *)v22 - v17;
  MEMORY[0x24BDAC7A8](v16);
  OUTLINED_FUNCTION_80();
  OUTLINED_FUNCTION_11_23(v20 - v19, a2);
  OUTLINED_FUNCTION_12_21((uint64_t)v18);
  __swift_storeEnumTagSinglePayload((uint64_t)v18, 0, 1, v11);
  sub_22DFDD484();
  sub_22DFDD4A8();
  OUTLINED_FUNCTION_12_21(v14);
  v21 = v22[0];
  OUTLINED_FUNCTION_11_23((uint64_t)v10, v22[0]);
  OUTLINED_FUNCTION_2_28((uint64_t)v10, 0);
  OUTLINED_FUNCTION_7_25();
  OUTLINED_FUNCTION_9_21();
  sub_22DFDDCB8();
  OUTLINED_FUNCTION_11_23((uint64_t)v10, v21);
  OUTLINED_FUNCTION_2_28((uint64_t)v10, 0);
  swift_getAssociatedConformanceWitness();
  OUTLINED_FUNCTION_7_25();
  OUTLINED_FUNCTION_9_21();
  OUTLINED_FUNCTION_4_1();
}

void sub_22DFBD0FC(uint64_t a1@<X0>, _QWORD *a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v3;
  uint64_t v4;
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
  char *v23;
  uint64_t v24;
  char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  char *v31;
  uint64_t AssociatedTypeWitness;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;

  v4 = v3;
  v40 = a1;
  v35 = a3;
  v6 = a2[3];
  v38 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](a1);
  OUTLINED_FUNCTION_80();
  v39 = v8 - v7;
  v10 = a2[2];
  v33 = *(_QWORD *)(v9 + 40);
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  OUTLINED_FUNCTION_7_7();
  MEMORY[0x24BDAC7A8](v11);
  v31 = (char *)&v29 - v12;
  OUTLINED_FUNCTION_10_23();
  OUTLINED_FUNCTION_7_7();
  MEMORY[0x24BDAC7A8](v13);
  v29 = (uint64_t)&v29 - v14;
  v15 = sub_22DFDDB2C();
  v16 = *(_QWORD *)(v15 - 8);
  v17 = MEMORY[0x24BDAC7A8](v15);
  v18 = MEMORY[0x24BDAC7A8](v17);
  v20 = (char *)&v29 - v19;
  v30 = *(_QWORD *)(v10 - 8);
  v21 = MEMORY[0x24BDAC7A8](v18);
  v23 = (char *)&v29 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v21);
  v25 = (char *)&v29 - v24;
  v34 = v4;
  v26 = *(_QWORD *)(v4 + 8);
  v36 = v4 + 8;
  v27 = v35;
  v37 = a2[6];
  MEMORY[0x22E3227C0](v40, v26, v6, v10);
  (*(void (**)(char *, uint64_t, uint64_t))(v16 + 16))(v20, v27, v15);
  if (__swift_getEnumTagSinglePayload((uint64_t)v20, 1, v10) == 1)
  {
    (*(void (**)(char *, uint64_t))(v16 + 8))(v20, v15);
  }
  else
  {
    v28 = v30;
    (*(void (**)(char *, char *, uint64_t))(v30 + 32))(v25, v20, v10);
    (*(void (**)(char *, char *, uint64_t))(v28 + 16))(v23, v25, v10);
    OUTLINED_FUNCTION_2_28(v29, 1);
    OUTLINED_FUNCTION_8_27();
    sub_22DFDD484();
    sub_22DFDD4A8();
    sub_22DFDDCB8();
    OUTLINED_FUNCTION_5_25();
    swift_getAssociatedConformanceWitness();
    sub_22DFDD484();
    sub_22DFDD4A8();
    (*(void (**)(char *, uint64_t))(v28 + 8))(v25, v10);
  }
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v38 + 16))(v39, v40, v6);
  OUTLINED_FUNCTION_5_25();
  sub_22DFDD484();
  sub_22DFDD4A8();
  OUTLINED_FUNCTION_4_1();
}

uint64_t sub_22DFBD400(uint64_t a1, uint64_t a2, _QWORD *a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  char v7;
  uint64_t v9;

  v3 = *(_QWORD *)(*MEMORY[0x24BEE46A8] + *a3 + 8);
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](a1);
  v6 = (char *)&v9 - v5;
  swift_getAtKeyPath();
  v7 = sub_22DFDD4F0();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  return v7 & 1;
}

uint64_t sub_22DFBD4AC(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  return sub_22DFBD400(a1, a2, *(_QWORD **)(v2 + 56)) & 1;
}

uint64_t sub_22DFBD4E0(uint64_t a1)
{
  uint64_t v1;
  uint64_t (*v3)(uint64_t, uint64_t);
  uint64_t TupleTypeMetadata2;

  v3 = *(uint64_t (**)(uint64_t, uint64_t))(v1 + 72);
  TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
  return v3(a1, a1 + *(int *)(TupleTypeMetadata2 + 48)) & 1;
}

uint64_t OUTLINED_FUNCTION_2_28(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  return __swift_storeEnumTagSinglePayload(a1, a2, 1, v2);
}

uint64_t OUTLINED_FUNCTION_3_28()
{
  return sub_22DFDD694();
}

uint64_t OUTLINED_FUNCTION_4_26()
{
  return swift_getTupleTypeMetadata2();
}

uint64_t OUTLINED_FUNCTION_5_25()
{
  uint64_t v0;
  uint64_t v1;

  return __swift_storeEnumTagSinglePayload(v1, 1, 1, v0);
}

uint64_t OUTLINED_FUNCTION_7_25()
{
  return sub_22DFDD484();
}

uint64_t OUTLINED_FUNCTION_8_27()
{
  return 0;
}

uint64_t OUTLINED_FUNCTION_9_21()
{
  return sub_22DFDD4A8();
}

uint64_t OUTLINED_FUNCTION_10_23()
{
  return sub_22DFDDB2C();
}

uint64_t OUTLINED_FUNCTION_11_23(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t (*v3)(uint64_t, uint64_t, uint64_t);

  return v3(a1, a2, v2);
}

uint64_t OUTLINED_FUNCTION_12_21(uint64_t a1)
{
  uint64_t v1;
  uint64_t (*v2)(uint64_t, uint64_t, uint64_t);
  uint64_t v3;

  return v2(a1, v3, v1);
}

uint64_t dispatch thunk of MemberMessaging.activate()()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t (*v4)(void);

  v1 = (_QWORD *)OUTLINED_FUNCTION_33();
  *(_QWORD *)(v0 + 16) = v1;
  v2 = OUTLINED_FUNCTION_109(v1, (uint64_t)sub_22DF3518C);
  return OUTLINED_FUNCTION_126(v2, v3, v4);
}

uint64_t dispatch thunk of MemberMessaging.deactivate()()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t (*v4)(void);

  v1 = (_QWORD *)OUTLINED_FUNCTION_33();
  *(_QWORD *)(v0 + 16) = v1;
  v2 = OUTLINED_FUNCTION_109(v1, (uint64_t)sub_22DF3403C);
  return OUTLINED_FUNCTION_126(v2, v3, v4);
}

uint64_t dispatch thunk of MemberMessaging.sendTransportMessage<A>(_:to:)()
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
  uint64_t (*v9)(void);

  OUTLINED_FUNCTION_7_6();
  v1 = (_QWORD *)OUTLINED_FUNCTION_93();
  *(_QWORD *)(v0 + 16) = v1;
  v2 = OUTLINED_FUNCTION_2_7(v1);
  return OUTLINED_FUNCTION_4_8(v2, v3, v4, v5, v6, v7, v8, v9);
}

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
  uint64_t (*v9)(void);

  OUTLINED_FUNCTION_7_6();
  v1 = (_QWORD *)OUTLINED_FUNCTION_93();
  *(_QWORD *)(v0 + 16) = v1;
  v2 = OUTLINED_FUNCTION_2_7(v1);
  return OUTLINED_FUNCTION_4_8(v2, v3, v4, v5, v6, v7, v8, v9);
}

void static CoordinationTransport.serverTransport<A, B>(cluster:topic:handshakeHandler:sessionToMember:requestHandler:)(uint64_t a1)
{
  MEMORY[0x24BDAC7A8](a1);
  type metadata accessor for CoordinationTransportServer();
}

void sub_22DFBD76C()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  id v5;

  (*(void (**)(uint64_t, uint64_t, uint64_t))(v0 + 16))(v4, v1, v3);
  v5 = v2;
  sub_22DFDD448();
  swift_retain();
  swift_retain();
  sub_22DF5ABCC();
}

void static CoordinationTransport.clientTransport<A, B>(cluster:topic:introductionToMember:requestHandler:)()
{
  type metadata accessor for CoordinationTransportClient();
}

void sub_22DFBD83C()
{
  void *v0;
  id v1;

  v1 = v0;
  sub_22DFDD448();
  swift_retain();
  swift_retain();
  sub_22DF8C39C();
}

ValueMetadata *type metadata accessor for CoordinationTransport()
{
  return &type metadata for CoordinationTransport;
}

id sub_22DFBD8B4(void *a1, id a2, char a3)
{
  if ((a3 & 1) != 0)
    return (id)sub_22DFDD448();
  else
    return a1;
}

void destroy for CoordinationTransport.TransportError(uint64_t a1)
{
  sub_22DFBD8D4(*(void **)a1, *(id *)(a1 + 8), *(_BYTE *)(a1 + 16));
}

void sub_22DFBD8D4(void *a1, id a2, char a3)
{
  if ((a3 & 1) != 0)
    swift_bridgeObjectRelease();
  else

}

uint64_t _s15HomePodSettings21CoordinationTransportO14TransportErrorOwCP_0(uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;
  char v5;

  v3 = *(void **)a2;
  v4 = *(void **)(a2 + 8);
  v5 = *(_BYTE *)(a2 + 16);
  sub_22DFBD8B4(*(void **)a2, v4, v5);
  *(_QWORD *)a1 = v3;
  *(_QWORD *)(a1 + 8) = v4;
  *(_BYTE *)(a1 + 16) = v5;
  return a1;
}

uint64_t assignWithCopy for CoordinationTransport.TransportError(uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;
  char v5;
  void *v6;
  void *v7;
  char v8;

  v3 = *(void **)a2;
  v4 = *(void **)(a2 + 8);
  v5 = *(_BYTE *)(a2 + 16);
  sub_22DFBD8B4(*(void **)a2, v4, v5);
  v6 = *(void **)a1;
  v7 = *(void **)(a1 + 8);
  v8 = *(_BYTE *)(a1 + 16);
  *(_QWORD *)a1 = v3;
  *(_QWORD *)(a1 + 8) = v4;
  *(_BYTE *)(a1 + 16) = v5;
  sub_22DFBD8D4(v6, v7, v8);
  return a1;
}

uint64_t assignWithTake for CoordinationTransport.TransportError(uint64_t a1, uint64_t a2)
{
  char v3;
  void *v4;
  void *v5;
  char v6;

  v3 = *(_BYTE *)(a2 + 16);
  v4 = *(void **)a1;
  v5 = *(void **)(a1 + 8);
  v6 = *(_BYTE *)(a1 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_BYTE *)(a1 + 16) = v3;
  sub_22DFBD8D4(v4, v5, v6);
  return a1;
}

ValueMetadata *type metadata accessor for CoordinationTransport.TransportError()
{
  return &type metadata for CoordinationTransport.TransportError;
}

void sub_22DFBD9D4(uint64_t a1)
{
  get_witness_table_15HomePodSettings15TransportMemberRzSHRzAA36CoordinationSessionConsumerHandshakeR_r0_lAA0fD6ServerCyxq_GAA0D0HPyHCTm(a1, (void (*)(uint64_t, _OWORD *))type metadata accessor for CoordinationTransportServer);
}

void sub_22DFBD9E8(uint64_t a1)
{
  get_witness_table_15HomePodSettings15TransportMemberRzSHRzAA36CoordinationSessionConsumerHandshakeR_r0_lAA0fD6ServerCyxq_GAA0D0HPyHCTm(a1, (void (*)(uint64_t, _OWORD *))type metadata accessor for CoordinationTransportClient);
}

void get_witness_table_15HomePodSettings15TransportMemberRzSHRzAA36CoordinationSessionConsumerHandshakeR_r0_lAA0fD6ServerCyxq_GAA0D0HPyHCTm(uint64_t a1, void (*a2)(uint64_t, _OWORD *))
{
  uint64_t v2;
  __int128 v3;
  _OWORD v4[2];
  uint64_t v5;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(_OWORD *)(a1 + 16);
  v4[0] = *(_OWORD *)a1;
  v4[1] = v3;
  v5 = v2;
  a2(255, v4);
  JUMPOUT(0x22DFBDA30);
}

uint64_t *Loader.deinit()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v1 = *v0;
  sub_22DF34068(v0[14]);
  v4 = type metadata accessor for Loader.CacheEntry(0, *(_QWORD *)(v1 + 80), v2, v3);
  OUTLINED_FUNCTION_30_0(v4);
  v5 = sub_22DFDCF20();
  OUTLINED_FUNCTION_30_0(v5);
  swift_defaultActor_destroy();
  return v0;
}

uint64_t type metadata accessor for Loader.CacheEntry(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for Loader.CacheEntry);
}

uint64_t Loader.__deallocating_deinit()
{
  Loader.deinit();
  return swift_defaultActor_deallocate();
}

uint64_t Loader.unownedExecutor.getter()
{
  uint64_t v0;

  return v0;
}

uint64_t sub_22DFBDAE8()
{
  return Loader.unownedExecutor.getter();
}

uint64_t sub_22DFBDB00(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t result;
  unint64_t v5;
  unint64_t v6;

  result = type metadata accessor for Loader.CacheEntry(319, *(_QWORD *)(a1 + 80), a3, a4);
  if (v5 <= 0x3F)
  {
    result = sub_22DFDCF20();
    if (v6 <= 0x3F)
    {
      result = swift_initClassMetadata2();
      if (!result)
        return 0;
    }
  }
  return result;
}

uint64_t type metadata accessor for Loader(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for Loader);
}

uint64_t method lookup function for Loader()
{
  return swift_lookUpClassMethod();
}

uint64_t sub_22DFBDBB8()
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

uint64_t *sub_22DFBDC30(uint64_t *__dst, uint64_t *a2, uint64_t a3)
{
  uint64_t *v3;
  uint64_t v4;
  uint64_t v5;
  int v6;
  uint64_t v8;
  unsigned int v9;
  uint64_t v10;

  v3 = __dst;
  v4 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  if (*(_QWORD *)(v4 + 64) <= 8uLL)
    v5 = 8;
  else
    v5 = *(_QWORD *)(v4 + 64);
  v6 = *(_DWORD *)(v4 + 80);
  if ((v6 & 0x1000F8) != 0 || (unint64_t)(v5 + 1) > 0x18)
  {
    v8 = *a2;
    *v3 = *a2;
    v3 = (uint64_t *)(v8 + ((unsigned __int16)((v6 & 0xF8) + 23) & (unsigned __int16)~(v6 & 0xF8) & 0x1F8));
  }
  else
  {
    v9 = *((unsigned __int8 *)a2 + v5);
    if (v9 >= 2)
    {
      if (v5 <= 3)
        v10 = v5;
      else
        v10 = 4;
      __asm { BR              X14 }
    }
    if (v9 == 1)
    {
      (*(void (**)(uint64_t *))(v4 + 16))(__dst);
      *((_BYTE *)v3 + v5) = 1;
      return v3;
    }
    *__dst = *a2;
    *((_BYTE *)__dst + v5) = 0;
  }
  swift_retain();
  return v3;
}

uint64_t sub_22DFBDD58(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  unsigned int v4;
  uint64_t v5;

  v2 = *(_QWORD *)(*(_QWORD *)(a2 + 16) - 8);
  v3 = *(_QWORD *)(v2 + 64);
  if (v3 <= 8)
    v3 = 8;
  v4 = *(unsigned __int8 *)(a1 + v3);
  if (v4 < 2)
  {
    if (v4 == 1)
      return (*(uint64_t (**)(void))(v2 + 8))();
    else
      return swift_release();
  }
  else
  {
    if (v3 <= 3)
      v5 = v3;
    else
      v5 = 4;
    return ((uint64_t (*)(void))((char *)&loc_22DFBDDA0 + 4 * byte_22DFE9D65[v5]))();
  }
}

_BYTE *sub_22DFBDE00(_BYTE *__dst, _QWORD *a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  unsigned int v6;
  uint64_t v7;

  v4 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  if (*(_QWORD *)(v4 + 64) <= 8uLL)
    v5 = 8;
  else
    v5 = *(_QWORD *)(v4 + 64);
  v6 = *((unsigned __int8 *)a2 + v5);
  if (v6 >= 2)
  {
    if (v5 <= 3)
      v7 = v5;
    else
      v7 = 4;
    __asm { BR              X13 }
  }
  if (v6 == 1)
  {
    (*(void (**)(_BYTE *))(v4 + 16))(__dst);
    __dst[v5] = 1;
  }
  else
  {
    *(_QWORD *)__dst = *a2;
    __dst[v5] = 0;
    swift_retain();
  }
  return __dst;
}

unsigned __int8 *sub_22DFBDEEC(unsigned __int8 *__dst, unsigned __int8 *__src, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unsigned int v8;
  uint64_t v9;
  unsigned int v10;
  uint64_t v11;

  if (__dst != __src)
  {
    v5 = *(_QWORD *)(a3 + 16);
    v6 = *(_QWORD *)(v5 - 8);
    if (*(_QWORD *)(v6 + 64) <= 8uLL)
      v7 = 8;
    else
      v7 = *(_QWORD *)(v6 + 64);
    v8 = __dst[v7];
    if (v8 >= 2)
    {
      if (v7 <= 3)
        v9 = v7;
      else
        v9 = 4;
      __asm { BR              X12 }
    }
    if (v8 == 1)
      (*(void (**)(unsigned __int8 *, _QWORD))(v6 + 8))(__dst, *(_QWORD *)(a3 + 16));
    else
      swift_release();
    v10 = __src[v7];
    if (v10 >= 2)
    {
      if (v7 <= 3)
        v11 = v7;
      else
        v11 = 4;
      __asm { BR              X12 }
    }
    if (v10 == 1)
    {
      (*(void (**)(unsigned __int8 *, unsigned __int8 *, uint64_t))(v6 + 16))(__dst, __src, v5);
      __dst[v7] = 1;
    }
    else
    {
      *(_QWORD *)__dst = *(_QWORD *)__src;
      __dst[v7] = 0;
      swift_retain();
    }
  }
  return __dst;
}

_BYTE *sub_22DFBE094(_BYTE *__dst, _QWORD *a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  unsigned int v6;
  uint64_t v7;

  v4 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  if (*(_QWORD *)(v4 + 64) <= 8uLL)
    v5 = 8;
  else
    v5 = *(_QWORD *)(v4 + 64);
  v6 = *((unsigned __int8 *)a2 + v5);
  if (v6 >= 2)
  {
    if (v5 <= 3)
      v7 = v5;
    else
      v7 = 4;
    __asm { BR              X13 }
  }
  if (v6 == 1)
  {
    (*(void (**)(_BYTE *))(v4 + 32))(__dst);
    __dst[v5] = 1;
  }
  else
  {
    *(_QWORD *)__dst = *a2;
    __dst[v5] = 0;
  }
  return __dst;
}

unsigned __int8 *sub_22DFBE17C(unsigned __int8 *__dst, unsigned __int8 *__src, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unsigned int v8;
  uint64_t v9;
  unsigned int v10;
  uint64_t v11;

  if (__dst != __src)
  {
    v5 = *(_QWORD *)(a3 + 16);
    v6 = *(_QWORD *)(v5 - 8);
    if (*(_QWORD *)(v6 + 64) <= 8uLL)
      v7 = 8;
    else
      v7 = *(_QWORD *)(v6 + 64);
    v8 = __dst[v7];
    if (v8 >= 2)
    {
      if (v7 <= 3)
        v9 = v7;
      else
        v9 = 4;
      __asm { BR              X12 }
    }
    if (v8 == 1)
      (*(void (**)(unsigned __int8 *, _QWORD))(v6 + 8))(__dst, *(_QWORD *)(a3 + 16));
    else
      swift_release();
    v10 = __src[v7];
    if (v10 >= 2)
    {
      if (v7 <= 3)
        v11 = v7;
      else
        v11 = 4;
      __asm { BR              X12 }
    }
    if (v10 == 1)
    {
      (*(void (**)(unsigned __int8 *, unsigned __int8 *, uint64_t))(v6 + 32))(__dst, __src, v5);
      __dst[v7] = 1;
    }
    else
    {
      *(_QWORD *)__dst = *(_QWORD *)__src;
      __dst[v7] = 0;
    }
  }
  return __dst;
}

uint64_t sub_22DFBE320(uint64_t a1, unsigned int a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  char v5;
  int v6;
  unsigned int v8;
  int v9;
  unsigned int v10;

  v3 = 8;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a3 + 16) - 8) + 64) > 8uLL)
    v3 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a3 + 16) - 8) + 64);
  if (!a2)
    return 0;
  if (a2 < 0xFE)
    goto LABEL_21;
  v4 = v3 + 1;
  v5 = 8 * (v3 + 1);
  if ((v3 + 1) <= 3)
  {
    v8 = ((a2 + ~(-1 << v5) - 253) >> v5) + 1;
    if (HIWORD(v8))
    {
      v6 = *(_DWORD *)(a1 + v4);
      if (!v6)
        goto LABEL_21;
      goto LABEL_14;
    }
    if (v8 > 0xFF)
    {
      v6 = *(unsigned __int16 *)(a1 + v4);
      if (!*(_WORD *)(a1 + v4))
        goto LABEL_21;
      goto LABEL_14;
    }
    if (v8 < 2)
    {
LABEL_21:
      v10 = *(unsigned __int8 *)(a1 + v3);
      if (v10 >= 3)
        return (v10 ^ 0xFF) + 1;
      else
        return 0;
    }
  }
  v6 = *(unsigned __int8 *)(a1 + v4);
  if (!*(_BYTE *)(a1 + v4))
    goto LABEL_21;
LABEL_14:
  v9 = (v6 - 1) << v5;
  if (v4 > 3)
    v9 = 0;
  if (!(_DWORD)v4)
    return (v9 + 254);
  if (v4 > 3)
    LODWORD(v4) = 4;
  return ((uint64_t (*)(void))((char *)&loc_22DFBE3E4 + 4 * byte_22DFE9D88[(v4 - 1)]))();
}

void sub_22DFBE430(_WORD *a1, unsigned int a2, unsigned int a3, uint64_t a4)
{
  unint64_t v5;
  size_t v6;
  char v7;
  unsigned int v8;
  unsigned int v9;
  unsigned int v10;
  int v11;

  v5 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a4 + 16) - 8) + 64);
  if (v5 <= 8)
    v5 = 8;
  v6 = v5 + 1;
  v7 = 8 * (v5 + 1);
  if (a3 < 0xFE)
  {
    v8 = 0;
  }
  else if (v6 <= 3)
  {
    v10 = ((a3 + ~(-1 << v7) - 253) >> v7) + 1;
    if (HIWORD(v10))
    {
      v8 = 4u;
    }
    else if (v10 >= 0x100)
    {
      v8 = 2;
    }
    else
    {
      v8 = v10 > 1;
    }
  }
  else
  {
    v8 = 1u;
  }
  if (a2 <= 0xFD)
    __asm { BR              X11 }
  v9 = a2 - 254;
  if (v6 < 4)
  {
    if ((_DWORD)v5 != -1)
    {
      v11 = v9 & ~(-1 << v7);
      bzero(a1, v6);
      if ((_DWORD)v6 == 3)
      {
        *a1 = v11;
        *((_BYTE *)a1 + 2) = BYTE2(v11);
      }
      else if ((_DWORD)v6 == 2)
      {
        *a1 = v11;
      }
      else
      {
        *(_BYTE *)a1 = v11;
      }
    }
  }
  else
  {
    bzero(a1, v5 + 1);
    *(_DWORD *)a1 = v9;
  }
  __asm { BR              X10 }
}

uint64_t sub_22DFBE5D4(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = 8;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a2 + 16) - 8) + 64) > 8uLL)
    v2 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a2 + 16) - 8) + 64);
  if (*(unsigned __int8 *)(a1 + v2) < 2u)
    return *(unsigned __int8 *)(a1 + v2);
  if (v2 <= 3)
    v3 = v2;
  else
    v3 = 4;
  return ((uint64_t (*)(void))((char *)&loc_22DFBE61C + 4 * byte_22DFE9D96[v3]))();
}

uint64_t sub_22DFBE664()
{
  return swift_allocateGenericValueMetadata();
}

uint64_t sub_22DFBE66C(uint64_t a1, int a2, int a3)
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
    return ((uint64_t (*)(void))((char *)sub_22DFBE6AC + 4 * byte_22DFE9D9B[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_22DFBE6CC + 4 * byte_22DFE9DA0[v4]))();
}

_BYTE *sub_22DFBE6AC(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_22DFBE6CC(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_22DFBE6D4(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_22DFBE6DC(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_22DFBE6E4(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_22DFBE6EC(_DWORD *result)
{
  *result = 0;
  return result;
}

uint64_t type metadata accessor for Loader.LoaderError(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for Loader.LoaderError);
}

void sub_22DFBE704()
{
  JUMPOUT(0x22E323AECLL);
}

uint64_t sub_22DFBE714()
{
  sub_22DFDE000();
  sub_22DF3A9F0();
  return sub_22DFDE030();
}

uint64_t dispatch thunk of static TransportRequest.typeIdentifier.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 32))();
}

uint64_t sub_22DFBE754()
{
  sub_22DFDD448();
  return sub_22DFBE7D4();
}

uint64_t sub_22DFBE790()
{
  uint64_t v0;
  uint64_t v1;

  OUTLINED_FUNCTION_18();
  v1 = *(_QWORD *)(v0 + 16);
  sub_22DFDD448();
  return v1;
}

uint64_t sub_22DFBE7D4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  OUTLINED_FUNCTION_95();
  OUTLINED_FUNCTION_18();
  *(_QWORD *)(v1 + 16) = v2;
  *(_QWORD *)(v1 + 24) = v0;
  return swift_bridgeObjectRelease();
}

void CarrySettings.LivabilityDataDownloader.__allocating_init(with:)()
{
  OUTLINED_FUNCTION_95();
  swift_allocObject();
  CarrySettings.LivabilityDataDownloader.init(with:)();
  OUTLINED_FUNCTION_132_0();
}

void CarrySettings.LivabilityDataDownloader.init(with:)()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  id v3;
  id v4;

  OUTLINED_FUNCTION_95();
  sub_22DFDCF14();
  *(_QWORD *)(v1 + 16) = v2;
  *(_QWORD *)(v1 + 24) = v0;
  v3 = objc_msgSend((id)objc_opt_self(), sel_ephemeralSessionConfiguration);
  objc_msgSend(v3, sel_set_preventsAppSSO_, 1);
  v4 = objc_msgSend((id)objc_opt_self(), sel_sessionWithConfiguration_, v3);

  *(_QWORD *)(v1 + OBJC_IVAR____TtCO15HomePodSettings13CarrySettings24LivabilityDataDownloader_urlSession) = v4;
  OUTLINED_FUNCTION_132_0();
}

void CarrySettings.LivabilityDataDownloader.deinit()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v1 = OBJC_IVAR____TtCO15HomePodSettings13CarrySettings24LivabilityDataDownloader_urlSession;
  objc_msgSend(*(id *)(v0 + OBJC_IVAR____TtCO15HomePodSettings13CarrySettings24LivabilityDataDownloader_urlSession), sel_invalidateAndCancel);
  swift_bridgeObjectRelease();
  v2 = sub_22DFDCF20();
  OUTLINED_FUNCTION_200_0(*(_QWORD *)(v2 - 8));

  OUTLINED_FUNCTION_132_0();
}

uint64_t CarrySettings.LivabilityDataDownloader.__deallocating_deinit()
{
  CarrySettings.LivabilityDataDownloader.deinit();
  return swift_deallocClassInstance();
}

uint64_t sub_22DFBE9B8(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;

  v2[2] = a1;
  v2[3] = v1;
  v3 = OUTLINED_FUNCTION_22_15();
  v2[4] = v3;
  v2[5] = *(_QWORD *)(v3 - 8);
  v2[6] = OUTLINED_FUNCTION_42();
  OUTLINED_FUNCTION_15();
  return OUTLINED_FUNCTION_2_2();
}

uint64_t sub_22DFBE9FC()
{
  uint64_t *v0;
  uint64_t v1;
  _QWORD *v2;

  sub_22DFBF738(0xD000000000000047, 0x800000022DFF2500, v0[6]);
  v1 = sub_22DFDD430();
  v0[7] = v1;
  v2 = (_QWORD *)swift_task_alloc();
  v0[8] = (uint64_t)v2;
  *v2 = v0;
  v2[1] = sub_22DFBEAD0;
  return sub_22DFBEFF4(v0[6], 1, v1);
}

uint64_t sub_22DFBEAD0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t *v3;
  uint64_t v4;

  OUTLINED_FUNCTION_95();
  v4 = *v3;
  *(_QWORD *)(*v3 + 72) = v1;
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  if (!v1)
  {
    *(_QWORD *)(v4 + 80) = v0;
    *(_QWORD *)(v4 + 88) = v2;
  }
  OUTLINED_FUNCTION_15();
  return swift_task_switch();
}

uint64_t sub_22DFBEB50()
{
  uint64_t v0;
  uint64_t v1;
  unint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v2 = *(_QWORD *)(v0 + 80);
  v1 = *(_QWORD *)(v0 + 88);
  v4 = *(_QWORD *)(v0 + 40);
  v3 = *(_QWORD *)(v0 + 48);
  v5 = *(_QWORD *)(v0 + 32);
  sub_22DFDCDB8();
  swift_allocObject();
  sub_22DFDCDAC();
  sub_22DFBF940();
  sub_22DFDCDA0();
  (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v3, v5);
  swift_release();
  sub_22DF32DB0(v1, v2);
  OUTLINED_FUNCTION_26_11();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_22DFBEC28()
{
  uint64_t v0;

  (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 40) + 8))(*(_QWORD *)(v0 + 48), *(_QWORD *)(v0 + 32));
  OUTLINED_FUNCTION_26_11();
  return OUTLINED_FUNCTION_72(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_22DFBEC60(const void *a1)
{
  uint64_t v1;
  _QWORD *v2;
  uint64_t v4;

  v2[21] = v1;
  v4 = OUTLINED_FUNCTION_22_15();
  v2[22] = v4;
  v2[23] = *(_QWORD *)(v4 - 8);
  v2[24] = OUTLINED_FUNCTION_42();
  memcpy(v2 + 2, a1, 0x8AuLL);
  OUTLINED_FUNCTION_15();
  return swift_task_switch();
}

uint64_t sub_22DFBECCC()
{
  uint64_t v0;
  unint64_t v1;
  NSObject *v2;
  os_log_type_t v3;
  uint8_t *v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char v8;
  _QWORD *v9;
  uint64_t v11;

  v1 = *(_QWORD *)(v0 + 144);
  if (v1)
  {
    sub_22DFBF738(*(_QWORD *)(v0 + 136), v1, *(_QWORD *)(v0 + 192));
    v8 = sub_22DFBF97C(*(_QWORD *)(v0 + 192));
    v9 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 200) = v9;
    *v9 = v0;
    v9[1] = sub_22DFBEF08;
    return sub_22DFBEFF4(*(_QWORD *)(v0 + 192), v8 & 1, 0);
  }
  else
  {
    sub_22DF4EA08(v0 + 16);
    sub_22DF4EA08(v0 + 16);
    v2 = sub_22DFDCF08();
    v3 = sub_22DFDDA9C();
    if (os_log_type_enabled(v2, v3))
    {
      v4 = (uint8_t *)OUTLINED_FUNCTION_1_3();
      v11 = OUTLINED_FUNCTION_1_3();
      *(_DWORD *)v4 = 136315138;
      v6 = *(_QWORD *)(v0 + 16);
      v5 = *(_QWORD *)(v0 + 24);
      sub_22DFDD448();
      *(_QWORD *)(v0 + 160) = sub_22DF30D20(v6, v5, &v11);
      sub_22DFDDB74();
      swift_bridgeObjectRelease();
      OUTLINED_FUNCTION_18_17();
      OUTLINED_FUNCTION_18_17();
      OUTLINED_FUNCTION_102(&dword_22DF16000, v2, v3, "Audience %s does not have a profile URL", v4);
      swift_arrayDestroy();
      OUTLINED_FUNCTION_0_2();
    }

    OUTLINED_FUNCTION_18_17();
    OUTLINED_FUNCTION_18_17();
    sub_22DFBFBA8();
    OUTLINED_FUNCTION_17();
    *(_QWORD *)v7 = 0;
    *(_BYTE *)(v7 + 8) = 1;
    OUTLINED_FUNCTION_88();
    swift_task_dealloc();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
}

uint64_t sub_22DFBEF08()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t *v3;
  uint64_t v4;

  OUTLINED_FUNCTION_95();
  v4 = *v3;
  *(_QWORD *)(*v3 + 208) = v1;
  swift_task_dealloc();
  if (!v1)
  {
    *(_QWORD *)(v4 + 216) = v0;
    *(_QWORD *)(v4 + 224) = v2;
  }
  OUTLINED_FUNCTION_15();
  return swift_task_switch();
}

uint64_t sub_22DFBEF78()
{
  uint64_t v0;

  OUTLINED_FUNCTION_121_0(*(_QWORD *)(v0 + 184));
  swift_task_dealloc();
  return (*(uint64_t (**)(_QWORD, _QWORD))(v0 + 8))(*(_QWORD *)(v0 + 224), *(_QWORD *)(v0 + 216));
}

uint64_t sub_22DFBEFBC()
{
  uint64_t v0;

  OUTLINED_FUNCTION_16_14();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_22DFBEFF4(uint64_t a1, char a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  *(_QWORD *)(v4 + 64) = a3;
  *(_QWORD *)(v4 + 72) = v3;
  *(_BYTE *)(v4 + 168) = a2;
  *(_QWORD *)(v4 + 56) = a1;
  v5 = OUTLINED_FUNCTION_22_15();
  *(_QWORD *)(v4 + 80) = v5;
  *(_QWORD *)(v4 + 88) = *(_QWORD *)(v5 - 8);
  *(_QWORD *)(v4 + 96) = OUTLINED_FUNCTION_42();
  v6 = sub_22DFDCD94();
  *(_QWORD *)(v4 + 104) = v6;
  *(_QWORD *)(v4 + 112) = *(_QWORD *)(v6 - 8);
  *(_QWORD *)(v4 + 120) = OUTLINED_FUNCTION_42();
  OUTLINED_FUNCTION_15();
  return OUTLINED_FUNCTION_2_2();
}

uint64_t sub_22DFBF05C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  int64_t v7;
  uint64_t result;
  int64_t v9;
  int64_t v10;
  uint64_t v11;
  int64_t v12;
  _QWORD *v13;
  uint64_t v14;

  v1 = *(_QWORD *)(v0 + 64);
  (*(void (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(v0 + 88) + 16))(*(_QWORD *)(v0 + 96), *(_QWORD *)(v0 + 56), *(_QWORD *)(v0 + 80));
  sub_22DFDCD7C();
  if (!v1)
  {
LABEL_23:
    if (*(_BYTE *)(v0 + 168) == 1)
    {
      OUTLINED_FUNCTION_18();
      sub_22DFDD448();
      sub_22DFDCD88();
      swift_bridgeObjectRelease();
    }
    v13 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 128) = v13;
    *v13 = v0;
    v13[1] = sub_22DFBF2E8;
    return sub_22DFDDA90();
  }
  v2 = *(_QWORD *)(v0 + 64);
  v3 = *(_QWORD *)(v2 + 64);
  v14 = v2 + 64;
  v4 = -1;
  v5 = -1 << *(_BYTE *)(v2 + 32);
  if (-v5 < 64)
    v4 = ~(-1 << -(char)v5);
  v6 = v4 & v3;
  v7 = (unint64_t)(63 - v5) >> 6;
  result = sub_22DFDD448();
  v9 = 0;
  if (!v6)
    goto LABEL_6;
LABEL_5:
  for (v6 &= v6 - 1; ; v6 = (v11 - 1) & v11)
  {
    sub_22DFDD448();
    sub_22DFDD448();
    sub_22DFDCD88();
    swift_bridgeObjectRelease();
    result = swift_bridgeObjectRelease();
    if (v6)
      goto LABEL_5;
LABEL_6:
    v10 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_27;
    }
    if (v10 >= v7)
      goto LABEL_22;
    v11 = *(_QWORD *)(v14 + 8 * v10);
    ++v9;
    if (!v11)
    {
      v9 = v10 + 1;
      if (v10 + 1 >= v7)
        goto LABEL_22;
      v11 = *(_QWORD *)(v14 + 8 * v9);
      if (!v11)
      {
        v9 = v10 + 2;
        if (v10 + 2 >= v7)
          goto LABEL_22;
        v11 = *(_QWORD *)(v14 + 8 * v9);
        if (!v11)
          break;
      }
    }
LABEL_19:
    ;
  }
  v12 = v10 + 3;
  if (v12 >= v7)
  {
LABEL_22:
    swift_release();
    goto LABEL_23;
  }
  v11 = *(_QWORD *)(v14 + 8 * v12);
  if (v11)
  {
    v9 = v12;
    goto LABEL_19;
  }
  while (1)
  {
    v9 = v12 + 1;
    if (__OFADD__(v12, 1))
      break;
    if (v9 >= v7)
      goto LABEL_22;
    v11 = *(_QWORD *)(v14 + 8 * v9);
    ++v12;
    if (v11)
      goto LABEL_19;
  }
LABEL_27:
  __break(1u);
  return result;
}

uint64_t sub_22DFBF2E8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  _QWORD *v4;
  _QWORD *v5;

  v5 = (_QWORD *)*v4;
  v5[17] = a1;
  v5[18] = a2;
  v5[19] = a3;
  v5[20] = v3;
  swift_task_dealloc();
  OUTLINED_FUNCTION_15();
  return OUTLINED_FUNCTION_2_2();
}

uint64_t sub_22DFBF34C()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  id v3;
  id v4;
  void *v5;
  id v7;
  NSObject *v8;
  os_log_type_t v9;
  _BOOL4 v10;
  unint64_t v11;
  void *v12;
  uint64_t v13;
  uint8_t *v14;
  id v15;
  id v16;
  uint64_t v17;
  unint64_t v18;
  unint64_t v19;
  id v20;
  NSObject *v21;
  os_log_type_t v22;
  _BOOL4 v23;
  void *v24;
  uint8_t *v25;
  uint64_t v26;
  unint64_t v27;
  uint64_t v28;
  id v29;
  uint64_t v30;
  uint64_t v31;

  objc_opt_self();
  v1 = swift_dynamicCastObjCClass();
  v2 = *(void **)(v0 + 152);
  if (v1)
  {
    v3 = v2;
    v4 = OUTLINED_FUNCTION_9_22();
    v5 = *(void **)(v0 + 152);
    if (v4 == (id)200)
    {
      OUTLINED_FUNCTION_121_0(*(_QWORD *)(v0 + 112));

      swift_task_dealloc();
      OUTLINED_FUNCTION_34();
      return (*(uint64_t (**)(_QWORD, _QWORD))(v0 + 8))(*(_QWORD *)(v0 + 136), *(_QWORD *)(v0 + 144));
    }
    v20 = v5;
    v21 = sub_22DFDCF08();
    v22 = sub_22DFDDA9C();
    v23 = os_log_type_enabled(v21, v22);
    v24 = *(void **)(v0 + 152);
    if (v23)
    {
      v25 = (uint8_t *)OUTLINED_FUNCTION_1_3();
      *(_DWORD *)v25 = 134217984;
      *(_QWORD *)(v0 + 48) = OUTLINED_FUNCTION_9_22();
      sub_22DFDDB74();

      OUTLINED_FUNCTION_102(&dword_22DF16000, v21, v22, "Invalid HTTP status %ld", v25);
      OUTLINED_FUNCTION_0_2();
    }

    v27 = *(_QWORD *)(v0 + 144);
    v12 = *(void **)(v0 + 152);
    v28 = *(_QWORD *)(v0 + 136);

    v29 = OUTLINED_FUNCTION_9_22();
    sub_22DFBFBA8();
    OUTLINED_FUNCTION_17();
    *(_QWORD *)v30 = v29;
    *(_BYTE *)(v30 + 8) = 0;
    OUTLINED_FUNCTION_88();
    sub_22DF32DB0(v28, v27);

  }
  else
  {
    v7 = v2;
    v8 = sub_22DFDCF08();
    v9 = sub_22DFDDA9C();
    v10 = os_log_type_enabled(v8, v9);
    v11 = *(_QWORD *)(v0 + 144);
    v12 = *(void **)(v0 + 152);
    v13 = *(_QWORD *)(v0 + 136);
    if (v10)
    {
      v14 = (uint8_t *)OUTLINED_FUNCTION_1_3();
      v31 = OUTLINED_FUNCTION_1_3();
      *(_DWORD *)v14 = 136315138;
      v15 = v12;
      v16 = objc_msgSend(v15, sel_description);
      v17 = sub_22DFDD514();
      v19 = v18;

      *(_QWORD *)(v0 + 40) = sub_22DF30D20(v17, v19, &v31);
      sub_22DFDDB74();

      swift_bridgeObjectRelease();
      OUTLINED_FUNCTION_102(&dword_22DF16000, v8, v9, "Cannot convert response %s to an HTTPURLResponse type", v14);
      swift_arrayDestroy();
      OUTLINED_FUNCTION_0_2();
    }

    sub_22DFBFBA8();
    OUTLINED_FUNCTION_17();
    *(_QWORD *)v26 = 1;
    *(_BYTE *)(v26 + 8) = 1;
    OUTLINED_FUNCTION_88();
    sub_22DF32DB0(v13, v11);
  }

  OUTLINED_FUNCTION_200_0(*(_QWORD *)(v0 + 112));
  OUTLINED_FUNCTION_34();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_22DFBF6EC()
{
  uint64_t v0;

  OUTLINED_FUNCTION_200_0(*(_QWORD *)(v0 + 112));
  OUTLINED_FUNCTION_34();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_22DFBF738@<X0>(uint64_t a1@<X0>, unint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  NSObject *v10;
  os_log_type_t v11;
  uint8_t *v12;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_255DDC890);
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)&v16 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_22DFDCE54();
  v9 = sub_22DFDCE60();
  if (__swift_getEnumTagSinglePayload((uint64_t)v8, 1, v9) != 1)
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(*(_QWORD *)(v9 - 8) + 32))(a3, v8, v9);
  sub_22DFBFEE8((uint64_t)v8);
  swift_bridgeObjectRetain_n();
  v10 = sub_22DFDCF08();
  v11 = sub_22DFDDA9C();
  if (os_log_type_enabled(v10, v11))
  {
    v12 = (uint8_t *)OUTLINED_FUNCTION_1_3();
    v17 = OUTLINED_FUNCTION_1_3();
    *(_DWORD *)v12 = 136315138;
    sub_22DFDD448();
    v16 = sub_22DF30D20(a1, a2, &v17);
    sub_22DFDDB74();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_22DF16000, v10, v11, "Cannot convert URL string %s to URL type", v12, 0xCu);
    swift_arrayDestroy();
    OUTLINED_FUNCTION_0_2();
  }

  swift_bridgeObjectRelease_n();
  sub_22DFBFBA8();
  v14 = OUTLINED_FUNCTION_17();
  return OUTLINED_FUNCTION_12_22(v14, v15);
}

unint64_t sub_22DFBF940()
{
  unint64_t result;

  result = qword_255DDC758;
  if (!qword_255DDC758)
  {
    result = MEMORY[0x22E323AEC](&protocol conformance descriptor for CarrySettings.LivabilitySoftwareUpdateAudiences, &type metadata for CarrySettings.LivabilitySoftwareUpdateAudiences);
    atomic_store(result, (unint64_t *)&qword_255DDC758);
  }
  return result;
}

uint64_t sub_22DFBF97C(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  char v8;
  char v9;
  NSObject *v10;
  os_log_type_t v11;
  uint8_t *v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD v18[2];
  uint64_t v19[4];

  v2 = sub_22DFDCE60();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)v18 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_22DFDCE48();
  if (v7)
  {
    v19[0] = v6;
    v19[1] = v7;
    v18[0] = 0x706D756A65736162;
    v18[1] = 0xEA00000000007265;
    sub_22DF4E7AC();
    v8 = sub_22DFDDBA4();
    swift_bridgeObjectRelease();
    v9 = v8 ^ 1;
  }
  else
  {
    (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, a1, v2);
    v10 = sub_22DFDCF08();
    v11 = sub_22DFDDA9C();
    if (os_log_type_enabled(v10, v11))
    {
      v12 = (uint8_t *)OUTLINED_FUNCTION_1_3();
      v19[0] = OUTLINED_FUNCTION_1_3();
      *(_DWORD *)v12 = 136315138;
      v19[3] = (uint64_t)(v12 + 4);
      sub_22DFBFEA8();
      v13 = sub_22DFDDF10();
      v18[0] = sub_22DF30D20(v13, v14, v19);
      sub_22DFDDB74();
      swift_bridgeObjectRelease();
      OUTLINED_FUNCTION_19_17();
      _os_log_impl(&dword_22DF16000, v10, v11, "URL %s does not have a host name", v12, 0xCu);
      swift_arrayDestroy();
      OUTLINED_FUNCTION_0_2();
    }

    OUTLINED_FUNCTION_19_17();
    sub_22DFBFBA8();
    v15 = OUTLINED_FUNCTION_17();
    OUTLINED_FUNCTION_12_22(v15, v16);
  }
  return v9 & 1;
}

unint64_t sub_22DFBFBA8()
{
  unint64_t result;

  result = qword_255DDC768;
  if (!qword_255DDC768)
  {
    result = MEMORY[0x22E323AEC](&protocol conformance descriptor for CarrySettings.LivabilityDataDownloader.LivabilityDataDownloaderError, &type metadata for CarrySettings.LivabilityDataDownloader.LivabilityDataDownloaderError);
    atomic_store(result, (unint64_t *)&qword_255DDC768);
  }
  return result;
}

uint64_t sub_22DFBFBE4()
{
  return sub_22DFDDB74();
}

uint64_t sub_22DFBFC08@<X0>(uint64_t (*a1)(void)@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result;

  result = a1();
  *a2 = result;
  return result;
}

uint64_t sub_22DFBFC30@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;

  result = sub_22DFBE790();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_22DFBFC5C()
{
  return type metadata accessor for CarrySettings.LivabilityDataDownloader();
}

uint64_t type metadata accessor for CarrySettings.LivabilityDataDownloader()
{
  uint64_t result;

  result = qword_255DDC798;
  if (!qword_255DDC798)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_22DFBFC9C()
{
  uint64_t result;
  unint64_t v1;

  result = sub_22DFDCF20();
  if (v1 <= 0x3F)
  {
    result = swift_updateClassMetadata2();
    if (!result)
      return 0;
  }
  return result;
}

uint64_t method lookup function for CarrySettings.LivabilityDataDownloader()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of CarrySettings.LivabilityDataDownloader.acToken.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 104))();
}

uint64_t dispatch thunk of CarrySettings.LivabilityDataDownloader.__allocating_init(with:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 128))();
}

uint64_t dispatch thunk of CarrySettings.LivabilityDataDownloader.getAllSoftwareUpdateAudiences()(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t (*v5)(uint64_t);

  v3 = (_QWORD *)OUTLINED_FUNCTION_93();
  *(_QWORD *)(v1 + 16) = v3;
  *v3 = v1;
  v3[1] = sub_22DF2F8F0;
  return v5(a1);
}

uint64_t dispatch thunk of CarrySettings.LivabilityDataDownloader.getProfileData(forAudience:)(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t (*v5)(uint64_t);

  v3 = (_QWORD *)OUTLINED_FUNCTION_93();
  *(_QWORD *)(v1 + 16) = v3;
  *v3 = v1;
  v3[1] = sub_22DFBFDEC;
  return v5(a1);
}

uint64_t sub_22DFBFDEC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  OUTLINED_FUNCTION_95();
  OUTLINED_FUNCTION_6();
  return (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 8))(v1, v0);
}

uint64_t dispatch thunk of CarrySettings.LivabilityDataDownloader.getData(forURL:useACToken:additionalHeaders:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  _QWORD *v7;
  uint64_t (*v9)(uint64_t, uint64_t, uint64_t);

  v7 = (_QWORD *)OUTLINED_FUNCTION_93();
  *(_QWORD *)(v3 + 16) = v7;
  *v7 = v3;
  v7[1] = sub_22DFBFF28;
  return v9(a1, a2, a3);
}

ValueMetadata *type metadata accessor for CarrySettings.LivabilityDataDownloader.LivabilityDataDownloaderError()
{
  return &type metadata for CarrySettings.LivabilityDataDownloader.LivabilityDataDownloaderError;
}

unint64_t sub_22DFBFEA8()
{
  unint64_t result;
  uint64_t v1;

  result = qword_255DDC888;
  if (!qword_255DDC888)
  {
    v1 = sub_22DFDCE60();
    result = MEMORY[0x22E323AEC](MEMORY[0x24BDCDB28], v1);
    atomic_store(result, (unint64_t *)&qword_255DDC888);
  }
  return result;
}

uint64_t sub_22DFBFEE8(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_255DDC890);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

id OUTLINED_FUNCTION_9_22()
{
  void *v0;
  uint64_t v1;

  return objc_msgSend(v0, (SEL)(v1 + 1096));
}

uint64_t OUTLINED_FUNCTION_12_22(uint64_t a1, uint64_t a2)
{
  *(_QWORD *)a2 = 0;
  *(_BYTE *)(a2 + 8) = 1;
  return swift_willThrow();
}

uint64_t OUTLINED_FUNCTION_16_14()
{
  _QWORD *v0;

  return (*(uint64_t (**)(_QWORD, _QWORD))(v0[23] + 8))(v0[24], v0[22]);
}

uint64_t OUTLINED_FUNCTION_18_17()
{
  uint64_t v0;

  return sub_22DF4EAAC(v0);
}

uint64_t OUTLINED_FUNCTION_19_17()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 8))(v1, v0);
}

uint64_t OUTLINED_FUNCTION_22_15()
{
  return sub_22DFDCE60();
}

uint64_t OUTLINED_FUNCTION_26_11()
{
  return swift_task_dealloc();
}

HomePodSettings::BetaEnrollment::State_optional __swiftcall BetaEnrollment.State.init(rawValue:)(Swift::Int rawValue)
{
  char *v1;
  char v2;

  v2 = 5;
  if ((unint64_t)rawValue < 5)
    v2 = rawValue;
  *v1 = v2;
  return (HomePodSettings::BetaEnrollment::State_optional)rawValue;
}

uint64_t BetaEnrollment.State.rawValue.getter()
{
  unsigned __int8 *v0;

  return *v0;
}

HomePodSettings::BetaEnrollment::Availability_optional __swiftcall BetaEnrollment.Availability.init(rawValue:)(Swift::Int rawValue)
{
  char *v1;
  char v2;

  if (rawValue == 1)
    v2 = 1;
  else
    v2 = 2;
  if (!rawValue)
    v2 = 0;
  *v1 = v2;
  return (HomePodSettings::BetaEnrollment::Availability_optional)rawValue;
}

uint64_t BetaEnrollment.Availability.rawValue.getter()
{
  unsigned __int8 *v0;

  return *v0;
}

unint64_t static BetaEnrollment.messageChannelTopic.getter()
{
  return 0xD000000000000020;
}

uint64_t static BetaEnrollment.messageSessionSubTopic.getter()
{
  return 0x6E6F6973736573;
}

unint64_t sub_22DFBFFFC()
{
  unint64_t result;

  result = qword_255DDC898;
  if (!qword_255DDC898)
  {
    result = MEMORY[0x22E323AEC](&protocol conformance descriptor for BetaEnrollment.Availability, &type metadata for BetaEnrollment.Availability);
    atomic_store(result, (unint64_t *)&qword_255DDC898);
  }
  return result;
}

void sub_22DFC0038()
{
  sub_22DFA2938();
}

void sub_22DFC0040()
{
  sub_22DFC04E0();
}

void sub_22DFC0048()
{
  sub_22DFC06B8();
}

HomePodSettings::BetaEnrollment::Availability_optional sub_22DFC0050(Swift::Int *a1)
{
  return BetaEnrollment.Availability.init(rawValue:)(*a1);
}

uint64_t sub_22DFC0058@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  result = BetaEnrollment.Availability.rawValue.getter();
  *a1 = result;
  return result;
}

unint64_t sub_22DFC0080()
{
  unint64_t result;

  result = qword_255DDC8A0;
  if (!qword_255DDC8A0)
  {
    result = MEMORY[0x22E323AEC](&protocol conformance descriptor for BetaEnrollment.State, &type metadata for BetaEnrollment.State);
    atomic_store(result, (unint64_t *)&qword_255DDC8A0);
  }
  return result;
}

uint64_t sub_22DFC00BC(uint64_t a1)
{
  unsigned __int8 *v1;

  return sub_22DFD26D4(a1, *v1);
}

HomePodSettings::BetaEnrollment::State_optional sub_22DFC00C4(Swift::Int *a1)
{
  return BetaEnrollment.State.init(rawValue:)(*a1);
}

uint64_t sub_22DFC00CC@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  result = BetaEnrollment.State.rawValue.getter();
  *a1 = result;
  return result;
}

void type metadata accessor for BetaEnrollment()
{
  OUTLINED_FUNCTION_32_1();
}

uint64_t storeEnumTagSinglePayload for BetaEnrollment.Availability(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_22DFC0148 + 4 * byte_22DFEA021[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_22DFC017C + 4 * byte_22DFEA01C[v4]))();
}

uint64_t sub_22DFC017C(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_22DFC0184(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x22DFC018CLL);
  return result;
}

uint64_t sub_22DFC0198(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x22DFC01A0);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_22DFC01A4(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_22DFC01AC(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

void type metadata accessor for BetaEnrollment.Availability()
{
  OUTLINED_FUNCTION_32_1();
}

uint64_t storeEnumTagSinglePayload for BetaEnrollment.State(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_22DFC0210 + 4 * byte_22DFEA02B[v4]))();
  *a1 = a2 + 4;
  return ((uint64_t (*)(void))((char *)sub_22DFC0244 + 4 * byte_22DFEA026[v4]))();
}

uint64_t sub_22DFC0244(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_22DFC024C(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x22DFC0254);
  return result;
}

uint64_t sub_22DFC0260(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x22DFC0268);
  *(_BYTE *)result = a2 + 4;
  return result;
}

uint64_t sub_22DFC026C(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_22DFC0274(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

void type metadata accessor for BetaEnrollment.State()
{
  OUTLINED_FUNCTION_32_1();
}

void sub_22DFC028C()
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
  uint64_t *v14;
  uint64_t v15;
  char v16;
  uint64_t v17;
  uint64_t v18;

  OUTLINED_FUNCTION_247_0();
  v5 = v4;
  v7 = v6;
  __swift_instantiateConcreteTypeFromMangledName(&qword_255DD7F20);
  OUTLINED_FUNCTION_57();
  MEMORY[0x24BDAC7A8](v8);
  OUTLINED_FUNCTION_246();
  __swift_instantiateConcreteTypeFromMangledName(&qword_255DD8C08);
  OUTLINED_FUNCTION_57();
  MEMORY[0x24BDAC7A8](v9);
  OUTLINED_FUNCTION_247();
  type metadata accessor for CarrySettings.CarryDevice(0);
  OUTLINED_FUNCTION_57();
  MEMORY[0x24BDAC7A8](v10);
  OUTLINED_FUNCTION_68_3();
  MEMORY[0x24BDAC7A8](v11);
  OUTLINED_FUNCTION_185_1();
  OUTLINED_FUNCTION_179_1();
  sub_22DFD21A4(v12, v13, v14);
  v15 = _s13DataModelCRDTVMa(0);
  OUTLINED_FUNCTION_26_12(v3, 1, v15);
  if (v16)
  {
    sub_22DF58068(v3, &qword_255DD7F20);
    _s20CarryDeviceMergeableVMa(0);
    v17 = v0;
    v18 = 1;
  }
  else
  {
    sub_22DFB1CFC(v3, v0, _s20CarryDeviceMergeableVMa);
    sub_22DF58090(v3, _s13DataModelCRDTVMa);
    _s20CarryDeviceMergeableVMa(0);
    v17 = v0;
    v18 = 0;
  }
  OUTLINED_FUNCTION_101_2(v17, v18);
  OUTLINED_FUNCTION_148_2();
  OUTLINED_FUNCTION_101_2(v2, 1);
  sub_22DFD1F50(v0, v2, &qword_255DD8C08);
  OUTLINED_FUNCTION_229_1(v2, v1);
  sub_22DF58068(v5, &qword_255DD7F20);
  OUTLINED_FUNCTION_229_1(v1, v7);
  OUTLINED_FUNCTION_181();
}

void sub_22DFC0404(uint64_t a1, char a2)
{
  __asm { BR              X10 }
}

uint64_t sub_22DFC043C()
{
  OUTLINED_FUNCTION_220_1();
  return OUTLINED_FUNCTION_73_4();
}

uint64_t sub_22DFC04C4()
{
  return sub_22DFDD544();
}

void sub_22DFC04E0()
{
  sub_22DFDE00C();
  OUTLINED_FUNCTION_1_2();
}

uint64_t sub_22DFC0500(uint64_t a1, unsigned __int8 a2)
{
  sub_22DF4D134(a2);
  OUTLINED_FUNCTION_209_1();
  return OUTLINED_FUNCTION_73_4();
}

uint64_t sub_22DFC0538(uint64_t a1, uint64_t a2, unint64_t a3)
{
  sub_22DF4A69C(a2, a3);
  OUTLINED_FUNCTION_209_1();
  return OUTLINED_FUNCTION_24_15();
}

void sub_22DFC05F8()
{
  sub_22DFDE00C();
  OUTLINED_FUNCTION_1_2();
}

void sub_22DFC0618()
{
  sub_22DFDE00C();
  OUTLINED_FUNCTION_1_2();
}

void sub_22DFC0644(uint64_t a1, uint64_t a2, unint64_t a3)
{
  _BYTE v5[72];

  OUTLINED_FUNCTION_56_4();
  sub_22DFC0538((uint64_t)v5, a2, a3);
  OUTLINED_FUNCTION_24_1();
  OUTLINED_FUNCTION_10_0();
}

void sub_22DFC067C(uint64_t a1, uint64_t a2)
{
  sub_22DFC0770(a1, a2, (void (*)(uint64_t))sub_22DF4D134);
}

void sub_22DFC0688()
{
  OUTLINED_FUNCTION_56_4();
  OUTLINED_FUNCTION_10_17();
  OUTLINED_FUNCTION_24_1();
  OUTLINED_FUNCTION_10_0();
}

void sub_22DFC06B8()
{
  OUTLINED_FUNCTION_56_4();
  OUTLINED_FUNCTION_10_17();
  OUTLINED_FUNCTION_24_1();
  OUTLINED_FUNCTION_10_0();
}

void sub_22DFC06E4()
{
  OUTLINED_FUNCTION_56_4();
  OUTLINED_FUNCTION_10_17();
  OUTLINED_FUNCTION_24_1();
  OUTLINED_FUNCTION_10_0();
}

void sub_22DFC0710()
{
  sub_22DFC0730();
}

void sub_22DFC0730()
{
  OUTLINED_FUNCTION_56_4();
  OUTLINED_FUNCTION_220_1();
  OUTLINED_FUNCTION_24_1();
  OUTLINED_FUNCTION_10_0();
}

void sub_22DFC0764(uint64_t a1, uint64_t a2)
{
  sub_22DFC0770(a1, a2, (void (*)(uint64_t))sub_22DFA6C24);
}

void sub_22DFC0770(uint64_t a1, uint64_t a2, void (*a3)(uint64_t))
{
  OUTLINED_FUNCTION_56_4();
  a3(a2);
  OUTLINED_FUNCTION_220_1();
  OUTLINED_FUNCTION_107();
  OUTLINED_FUNCTION_24_1();
  OUTLINED_FUNCTION_10_0();
}

uint64_t sub_22DFC07B8@<X0>(uint64_t a1@<X8>)
{
  *(_QWORD *)(a1 + *(int *)(_s13DataModelCRDTVMa(0) + 20)) = MEMORY[0x24BEE4B00];
  return sub_22DFC07F0(a1);
}

uint64_t sub_22DFC07F0@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _BYTE *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t result;
  _BYTE v12[80];
  uint64_t v13;
  _BYTE v14[168];

  OUTLINED_FUNCTION_140_1();
  OUTLINED_FUNCTION_57();
  MEMORY[0x24BDAC7A8](v3);
  OUTLINED_FUNCTION_68_3();
  MEMORY[0x24BDAC7A8](v4);
  v6 = &v12[-v5];
  v7 = OUTLINED_FUNCTION_189_1();
  OUTLINED_FUNCTION_299((uint64_t)v6, v8, v9, v7);
  OUTLINED_FUNCTION_112_3((uint64_t)v6, v1);
  sub_22DF95838();
  OUTLINED_FUNCTION_304();
  sub_22DFDD070();
  OUTLINED_FUNCTION_67_5((uint64_t)v6);
  v10 = _s20CarryDeviceMergeableVMa(0);
  sub_22DF5801C(v14);
  sub_22DFD1E98((uint64_t)v14, (uint64_t)v12, qword_255DD8C10);
  OUTLINED_FUNCTION_171_0();
  sub_22DFCDB5C((uint64_t)&qword_255DDAE50);
  OUTLINED_FUNCTION_144_2();
  sub_22DF95940();
  sub_22DF9597C();
  sub_22DFDD250();
  v13 = 0;
  memset(v12, 0, sizeof(v12));
  OUTLINED_FUNCTION_171_0();
  sub_22DFCDB5C((uint64_t)&qword_255DDAE78);
  result = OUTLINED_FUNCTION_144_2();
  *(_QWORD *)(a1 + *(int *)(v10 + 32)) = MEMORY[0x24BEE4B00];
  return result;
}

void CarrySettings.DataModel.device.getter(uint64_t a1@<X8>)
{
  uint64_t v1;

  sub_22DFB1CFC(v1, a1, type metadata accessor for CarrySettings.CarryDevice);
}

uint64_t type metadata accessor for CarrySettings.CarryDevice(uint64_t a1)
{
  return sub_22DF30B80(a1, qword_255DDC9C0);
}

uint64_t CarrySettings.DataModel.device.setter(uint64_t a1)
{
  uint64_t v1;

  return sub_22DFC09D8(a1, v1);
}

uint64_t sub_22DFC09D8(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for CarrySettings.CarryDevice(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t (*CarrySettings.DataModel.device.modify())(_QWORD, _QWORD)
{
  return nullsub_1;
}

void CarrySettings.DataModel.init(withDevice:)(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  sub_22DFB1638(a1, a2, type metadata accessor for CarrySettings.CarryDevice);
}

void static CarrySettings.CarryDevice.== infix(_:_:)()
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
  char v17;

  OUTLINED_FUNCTION_21();
  v6 = v5;
  v8 = v7;
  OUTLINED_FUNCTION_188_1();
  OUTLINED_FUNCTION_57();
  MEMORY[0x24BDAC7A8](v9);
  OUTLINED_FUNCTION_247();
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_255DDC8A8);
  OUTLINED_FUNCTION_57();
  MEMORY[0x24BDAC7A8](v11);
  OUTLINED_FUNCTION_44_4();
  __swift_instantiateConcreteTypeFromMangledName(&qword_255DD8C08);
  OUTLINED_FUNCTION_57();
  MEMORY[0x24BDAC7A8](v12);
  OUTLINED_FUNCTION_69_5();
  MEMORY[0x24BDAC7A8](v13);
  OUTLINED_FUNCTION_123_2();
  MEMORY[0x24BDAC7A8](v14);
  OUTLINED_FUNCTION_184_1();
  OUTLINED_FUNCTION_190_1(v8, v3);
  OUTLINED_FUNCTION_190_1(v6, v4);
  v15 = v0 + *(int *)(v10 + 48);
  OUTLINED_FUNCTION_190_1(v3, v0);
  OUTLINED_FUNCTION_190_1(v4, v15);
  OUTLINED_FUNCTION_18_0(v0);
  if (!v17)
  {
    sub_22DFD21A4(v0, v2, &qword_255DD8C08);
    OUTLINED_FUNCTION_18_0(v15);
    if (!v17)
    {
      sub_22DFB1638(v15, v1, _s20CarryDeviceMergeableVMa);
      sub_22DFC3EE8();
      OUTLINED_FUNCTION_46_5(v1);
      OUTLINED_FUNCTION_67_5(v4);
      OUTLINED_FUNCTION_67_5(v3);
      OUTLINED_FUNCTION_46_5(v2);
      OUTLINED_FUNCTION_67_5(v0);
      goto LABEL_10;
    }
    OUTLINED_FUNCTION_129_3(v4);
    OUTLINED_FUNCTION_129_3(v3);
    sub_22DF58090(v2, _s20CarryDeviceMergeableVMa);
LABEL_9:
    OUTLINED_FUNCTION_216_1(v16, &qword_255DDC8A8);
    goto LABEL_10;
  }
  OUTLINED_FUNCTION_67_5(v4);
  OUTLINED_FUNCTION_67_5(v3);
  v16 = OUTLINED_FUNCTION_18_0(v15);
  if (!v17)
    goto LABEL_9;
  OUTLINED_FUNCTION_216_1(v16, &qword_255DD8C08);
LABEL_10:
  OUTLINED_FUNCTION_4_1();
}

uint64_t _s20CarryDeviceMergeableVMa(uint64_t a1)
{
  return sub_22DF30B80(a1, (uint64_t *)&unk_255DDCAE8);
}

uint64_t sub_22DFC0C4C()
{
  uint64_t result;

  qword_255DF2E78 = 0x656369766564;
  unk_255DF2E80 = 0xE600000000000000;
  result = swift_getKeyPath();
  qword_255DF2E88 = result;
  return result;
}

uint64_t *sub_22DFC0C90()
{
  if (qword_255DD6F78 != -1)
    swift_once();
  return &qword_255DF2E78;
}

uint64_t sub_22DFC0CD0()
{
  uint64_t v0;

  sub_22DFC0C90();
  v0 = qword_255DF2E78;
  sub_22DFDD448();
  swift_retain();
  return v0;
}

uint64_t sub_22DFC0D20()
{
  sub_22DFCED9C((uint64_t)&unk_255DDCF58);
  return sub_22DFDD154();
}

uint64_t sub_22DFC0D60()
{
  return sub_22DFDD448();
}

uint64_t sub_22DFC0D6C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t result;

  v4 = *(int *)(a2 + 20);
  result = swift_bridgeObjectRelease();
  *(_QWORD *)(v2 + v4) = a1;
  return result;
}

uint64_t (*sub_22DFC0DA0())(_QWORD, _QWORD)
{
  return nullsub_1;
}

uint64_t sub_22DFC0DC0()
{
  sub_22DFCED9C((uint64_t)qword_255DDAF00);
  return sub_22DFDD34C();
}

uint64_t sub_22DFC0E00()
{
  sub_22DFCED9C((uint64_t)&unk_255DDCF58);
  return sub_22DFDD0D0();
}

uint64_t sub_22DFC0E58()
{
  sub_22DFCED9C((uint64_t)&unk_255DDCF58);
  return sub_22DFDD100();
}

uint64_t sub_22DFC0EA8()
{
  sub_22DFCED9C((uint64_t)&unk_255DDCF58);
  return sub_22DFDD148();
}

uint64_t sub_22DFC0EF8()
{
  sub_22DFCED9C((uint64_t)&unk_255DDCF58);
  return sub_22DFDD10C();
}

uint64_t sub_22DFC0F60()
{
  sub_22DFCED9C((uint64_t)&unk_255DDCF58);
  return sub_22DFDD13C();
}

uint64_t sub_22DFC0FB0()
{
  sub_22DFCED9C((uint64_t)&unk_255DDCF58);
  return sub_22DFDD118();
}

uint64_t sub_22DFC1000()
{
  sub_22DFCED9C((uint64_t)&unk_255DDCF58);
  return sub_22DFDD0E8();
}

uint64_t sub_22DFC1058()
{
  sub_22DFCED9C((uint64_t)&unk_255DDCF58);
  return sub_22DFDD0C4();
}

uint64_t sub_22DFC10C0()
{
  sub_22DFCED9C((uint64_t)&unk_255DDCF58);
  return sub_22DFDD0A0();
}

uint64_t sub_22DFC1110()
{
  sub_22DFCED9C((uint64_t)&unk_255DDCF58);
  return sub_22DFDD0DC();
}

uint64_t sub_22DFC1150()
{
  sub_22DFCED9C((uint64_t)&unk_255DDCF58);
  return sub_22DFDD0AC();
}

uint64_t sub_22DFC11A4()
{
  sub_22DFCED9C((uint64_t)&unk_255DDCF58);
  return sub_22DFDD124();
}

uint64_t sub_22DFC11F4()
{
  sub_22DFCED9C((uint64_t)&qword_255DDAE88);
  return sub_22DFDD328();
}

uint64_t sub_22DFC1258()
{
  sub_22DFCED9C((uint64_t)&qword_255DDAE88);
  return sub_22DFDD334();
}

uint64_t sub_22DFC12CC()
{
  sub_22DFCED9C((uint64_t)&unk_255DDCF58);
  return sub_22DFDD0F4();
}

uint64_t sub_22DFC1330()
{
  sub_22DFCED9C((uint64_t)&unk_255DDCF58);
  return sub_22DFDD130();
}

uint64_t sub_22DFC1390()
{
  sub_22DFCED9C((uint64_t)&unk_255DDCF58);
  return sub_22DFDD0B8();
}

void CarrySettings.CarryDevice.appleConnectSettings.getter()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;
  _QWORD *v3;
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
  char v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;

  OUTLINED_FUNCTION_21();
  v24 = v6;
  __swift_instantiateConcreteTypeFromMangledName(&qword_255DD7828);
  OUTLINED_FUNCTION_57();
  MEMORY[0x24BDAC7A8](v7);
  OUTLINED_FUNCTION_16_5();
  v8 = OUTLINED_FUNCTION_241_1();
  OUTLINED_FUNCTION_57();
  MEMORY[0x24BDAC7A8](v9);
  OUTLINED_FUNCTION_16_0();
  __swift_instantiateConcreteTypeFromMangledName(&qword_255DD8C08);
  OUTLINED_FUNCTION_57();
  MEMORY[0x24BDAC7A8](v10);
  OUTLINED_FUNCTION_84_3();
  __swift_instantiateConcreteTypeFromMangledName(&qword_255DD8C00);
  OUTLINED_FUNCTION_57();
  MEMORY[0x24BDAC7A8](v11);
  OUTLINED_FUNCTION_43_5();
  v12 = _s29AppleConnectSettingsMergeableVMa(0);
  OUTLINED_FUNCTION_57();
  MEMORY[0x24BDAC7A8](v13);
  OUTLINED_FUNCTION_150_2();
  MEMORY[0x24BDAC7A8](v14);
  v16 = (char *)&v23 - v15;
  sub_22DFD21A4(v0, v5, &qword_255DD8C08);
  v17 = OUTLINED_FUNCTION_148_2();
  OUTLINED_FUNCTION_26_12(v5, 1, v17);
  if (v18)
  {
    sub_22DF58068(v5, &qword_255DD8C08);
    __swift_storeEnumTagSinglePayload(v4, 1, 1, v12);
LABEL_6:
    sub_22DF58068(v4, &qword_255DD8C00);
    v22 = 1;
    v21 = v24;
    goto LABEL_7;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_255DD80B8);
  sub_22DFDD07C();
  sub_22DF58090(v5, _s20CarryDeviceMergeableVMa);
  OUTLINED_FUNCTION_26_12(v4, 1, v12);
  if (v18)
    goto LABEL_6;
  sub_22DFB1638(v4, (uint64_t)v16, _s29AppleConnectSettingsMergeableVMa);
  sub_22DFB1CFC((uint64_t)v16, (uint64_t)v3, _s29AppleConnectSettingsMergeableVMa);
  v19 = v3[1];
  *v2 = *v3;
  v2[1] = v19;
  v20 = v3[3];
  v2[2] = v3[2];
  v2[3] = v20;
  sub_22DFD21A4((uint64_t)v3 + *(int *)(v12 + 24), v1, &qword_255DD7828);
  OUTLINED_FUNCTION_99_3();
  OUTLINED_FUNCTION_33_1();
  sub_22DF58090((uint64_t)v3, _s29AppleConnectSettingsMergeableVMa);
  sub_22DFD1E98(v1, (uint64_t)v2 + *(int *)(v8 + 24), &qword_255DD7828);
  v21 = v24;
  sub_22DFB1638((uint64_t)v2, v24, type metadata accessor for CarrySettings.AppleConnectSettings);
  sub_22DF58090((uint64_t)v16, _s29AppleConnectSettingsMergeableVMa);
  v22 = 0;
LABEL_7:
  OUTLINED_FUNCTION_39_9(v21, v22);
  OUTLINED_FUNCTION_4_1();
}

#error "22DFC1680: call analysis failed (funcsize=31)"

void CarrySettings.CarryDevice.appleConnectSettings.setter(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20)
{
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
  uint64_t v38;
  int v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t *v45;
  uint64_t v46;

  OUTLINED_FUNCTION_21();
  a19 = v25;
  a20 = v26;
  v28 = v27;
  __swift_instantiateConcreteTypeFromMangledName(&qword_255DDC8B0);
  OUTLINED_FUNCTION_57();
  MEMORY[0x24BDAC7A8](v29);
  OUTLINED_FUNCTION_247();
  __swift_instantiateConcreteTypeFromMangledName(&qword_255DD8C00);
  OUTLINED_FUNCTION_57();
  MEMORY[0x24BDAC7A8](v30);
  OUTLINED_FUNCTION_69_5();
  MEMORY[0x24BDAC7A8](v31);
  OUTLINED_FUNCTION_184_1();
  __swift_instantiateConcreteTypeFromMangledName(&qword_255DD8C08);
  OUTLINED_FUNCTION_57();
  MEMORY[0x24BDAC7A8](v32);
  OUTLINED_FUNCTION_123_2();
  MEMORY[0x24BDAC7A8](v33);
  v35 = (char *)&a9 - v34;
  v36 = OUTLINED_FUNCTION_238_1();
  sub_22DFD21A4(v36, v37, &qword_255DD8C08);
  v38 = OUTLINED_FUNCTION_148_2();
  v39 = OUTLINED_FUNCTION_142_2((uint64_t)v35);
  sub_22DF58068((uint64_t)v35, &qword_255DD8C08);
  if (v39 == 1)
  {
    sub_22DFC07F0(v24);
    OUTLINED_FUNCTION_174_0();
    __swift_storeEnumTagSinglePayload(v40, v41, v42, v38);
    v43 = OUTLINED_FUNCTION_177_1();
    sub_22DFD1F50(v43, v44, v45);
  }
  v46 = OUTLINED_FUNCTION_142_2(v20);
  if (!(_DWORD)v46)
  {
    sub_22DFD21A4(v28, v21, &qword_255DDC8B0);
    sub_22DFC181C();
    OUTLINED_FUNCTION_112_3(v23, v22);
    __swift_instantiateConcreteTypeFromMangledName(&qword_255DD80B8);
    sub_22DFDD088();
    OUTLINED_FUNCTION_67_5(v23);
  }
  OUTLINED_FUNCTION_216_1(v46, &qword_255DDC8B0);
  OUTLINED_FUNCTION_4_1();
}

void sub_22DFC181C()
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
  char v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t (*v19)(_QWORD);
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;

  OUTLINED_FUNCTION_247_0();
  v3 = v2;
  v5 = v4;
  v6 = OUTLINED_FUNCTION_241_1();
  OUTLINED_FUNCTION_57();
  MEMORY[0x24BDAC7A8](v7);
  OUTLINED_FUNCTION_246();
  v8 = OUTLINED_FUNCTION_189_1();
  OUTLINED_FUNCTION_57();
  MEMORY[0x24BDAC7A8](v9);
  OUTLINED_FUNCTION_247();
  v0[2] = 0;
  v0[3] = 0;
  v11 = (uint64_t)v0 + *(int *)(v10 + 24);
  v12 = OUTLINED_FUNCTION_40_7();
  OUTLINED_FUNCTION_299(v11, v13, v14, v12);
  *(_QWORD *)((char *)v0 + *(int *)(v8 + 28)) = MEMORY[0x24BEE4B00];
  v15 = OUTLINED_FUNCTION_26_12(v3, 1, v6);
  if (v16)
  {
    OUTLINED_FUNCTION_110_4(v15, &qword_255DDC8B0);
    swift_bridgeObjectRelease();
    sub_22DF58068(v11, &qword_255DD7828);
    swift_bridgeObjectRelease();
    __swift_storeEnumTagSinglePayload(v5, 1, 1, v8);
  }
  else
  {
    v17 = OUTLINED_FUNCTION_169_1();
    sub_22DFB1638(v17, v18, v19);
    v20 = *(_QWORD *)(v1 + 8);
    *v0 = *(_QWORD *)v1;
    v0[1] = v20;
    *((_OWORD *)v0 + 1) = *(_OWORD *)(v1 + 16);
    sub_22DFD1F50(v1 + *(int *)(v6 + 24), v11, &qword_255DD7828);
    OUTLINED_FUNCTION_221_1((uint64_t)v0, v5);
    OUTLINED_FUNCTION_174_0();
    __swift_storeEnumTagSinglePayload(v21, v22, v23, v8);
    OUTLINED_FUNCTION_137_2((uint64_t)v0);
  }
  OUTLINED_FUNCTION_181();
}

uint64_t (*CarrySettings.CarryDevice.appleConnectSettings.modify(_QWORD *a1))()
{
  uint64_t v1;
  size_t v3;

  *a1 = v1;
  v3 = *(_QWORD *)(*(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_255DDC8B0) - 8) + 64);
  a1[1] = malloc(v3);
  a1[2] = malloc(v3);
  CarrySettings.CarryDevice.appleConnectSettings.getter();
  return sub_22DFC19D0;
}

#error "22DFC1A18: call analysis failed (funcsize=24)"

void CarrySettings.CarryDevice.deviceInfo.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char v6;
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
  char v17;
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
  _QWORD v28[12];
  char v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34[21];
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
  char v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;

  OUTLINED_FUNCTION_21();
  v3 = v2;
  OUTLINED_FUNCTION_171_0();
  OUTLINED_FUNCTION_57();
  MEMORY[0x24BDAC7A8](v4);
  OUTLINED_FUNCTION_16_5();
  sub_22DFD21A4(v0, v1, &qword_255DD8C08);
  OUTLINED_FUNCTION_188_1();
  v5 = OUTLINED_FUNCTION_18_0(v1);
  if (v6)
  {
    OUTLINED_FUNCTION_110_4(v5, &qword_255DD8C08);
LABEL_6:
    sub_22DFC49F8(&v35);
    v7 = &v35;
    goto LABEL_17;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_255DD80C0);
  sub_22DFDD07C();
  OUTLINED_FUNCTION_71_3((uint64_t)v28, (uint64_t)v34);
  sub_22DF58090(v1, _s20CarryDeviceMergeableVMa);
  OUTLINED_FUNCTION_71_3((uint64_t)v34, (uint64_t)&v35);
  OUTLINED_FUNCTION_9_8((uint64_t)&v35);
  if (v6)
    goto LABEL_6;
  v19 = v36;
  if (v36)
  {
    v8 = v38;
    v25 = v35;
    v26 = v37;
    sub_22DFDD448();
    v27 = v8;
    OUTLINED_FUNCTION_33_1();
  }
  else
  {
    v25 = 0;
    v26 = 0;
    v27 = 0;
  }
  v9 = v44;
  if (v44)
  {
    v10 = v46;
    v22 = v43;
    v23 = v45;
    OUTLINED_FUNCTION_125();
    v24 = v10;
    OUTLINED_FUNCTION_33_1();
  }
  else
  {
    v22 = 0;
    v23 = 0;
    v24 = 0;
  }
  v11 = v49;
  if (v49)
  {
    v12 = v51;
    v20 = v48;
    v21 = v50;
    OUTLINED_FUNCTION_96_0();
    OUTLINED_FUNCTION_75_1();
  }
  else
  {
    v20 = 0;
    v21 = 0;
    v12 = 0;
  }
  v13 = v39;
  v14 = v40;
  v15 = v41;
  v16 = v42;
  v17 = v47;
  OUTLINED_FUNCTION_99_3();
  OUTLINED_FUNCTION_24_4();
  sub_22DF580F4(v34);
  v28[0] = v25;
  v28[1] = v19;
  v28[2] = v26;
  v28[3] = v27;
  v28[4] = v13;
  v28[5] = v14;
  v28[6] = v15;
  v28[7] = v16;
  v28[8] = v22;
  v28[9] = v9;
  v28[10] = v23;
  v28[11] = v24;
  v29 = v17;
  v30 = v20;
  v31 = v11;
  v32 = v21;
  v33 = v12;
  nullsub_1(v28, v18);
  v7 = v28;
LABEL_17:
  sub_22DFD1E98((uint64_t)v7, v3, &qword_255DDC8B8);
  OUTLINED_FUNCTION_4_1();
}

void sub_22DFC1C24(uint64_t a1@<X8>)
{
  uint64_t v2;
  _BYTE v3[136];

  CarrySettings.CarryDevice.deviceInfo.getter();
  sub_22DFD1E98((uint64_t)&v2, (uint64_t)v3, &qword_255DDC8B8);
  sub_22DFD1E98((uint64_t)v3, a1, &qword_255DDC8B8);
}

void sub_22DFC1C84(uint64_t a1)
{
  uint64_t v1;
  _BYTE v2[136];

  sub_22DFD1E98(a1, (uint64_t)v2, &qword_255DDC8B8);
  sub_22DFD1E98((uint64_t)v2, (uint64_t)&v1, &qword_255DDC8B8);
  sub_22DFC4AC0((uint64_t)v2);
  CarrySettings.CarryDevice.deviceInfo.setter();
}

void CarrySettings.CarryDevice.deviceInfo.setter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _BYTE *v7;
  uint64_t v8;
  int EnumTagSinglePayload;
  _BYTE v11[168];
  uint64_t v12;
  _BYTE v13[136];

  OUTLINED_FUNCTION_247_0();
  v3 = v2;
  OUTLINED_FUNCTION_171_0();
  OUTLINED_FUNCTION_57();
  MEMORY[0x24BDAC7A8](v4);
  OUTLINED_FUNCTION_69_5();
  MEMORY[0x24BDAC7A8](v5);
  v7 = &v11[-v6 - 8];
  sub_22DFD1E98(v3, (uint64_t)v13, &qword_255DDC8B8);
  sub_22DFD21A4(v0, (uint64_t)v7, &qword_255DD8C08);
  v8 = _s20CarryDeviceMergeableVMa(0);
  EnumTagSinglePayload = __swift_getEnumTagSinglePayload((uint64_t)v7, 1, v8);
  OUTLINED_FUNCTION_114_3((uint64_t)v7);
  if (EnumTagSinglePayload == 1)
  {
    sub_22DFC07F0(v1);
    OUTLINED_FUNCTION_39_9(v1, 0);
    sub_22DFD1F50(v1, v0, &qword_255DD8C08);
  }
  if (OUTLINED_FUNCTION_27_7())
  {
    sub_22DFC4AC0((uint64_t)v13);
  }
  else
  {
    sub_22DFD1E98((uint64_t)v13, (uint64_t)v11, &qword_255DDC8B8);
    sub_22DFC1E3C();
    sub_22DFD1E98((uint64_t)&v12, (uint64_t)v11, qword_255DD8C10);
    __swift_instantiateConcreteTypeFromMangledName(&qword_255DD80C0);
    sub_22DFDD088();
  }
  OUTLINED_FUNCTION_181();
}

void sub_22DFC1E3C()
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
  char v81[8];
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
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  char v102[168];
  _BYTE v103[136];
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  char v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;

  OUTLINED_FUNCTION_21();
  v1 = v0;
  sub_22DFD1E98(v2, (uint64_t)v103, &qword_255DDC8B8);
  sub_22DFD1E98((uint64_t)v103, (uint64_t)&v104, &qword_255DDC8B8);
  if (sub_22DFD1FB8((uint64_t)&v104) == 1)
  {
    sub_22DF5801C(v81);
    OUTLINED_FUNCTION_199_1(v3, v4, qword_255DD8C10, v5, v6, v7, v8, v9, v40, v41, v43, v45, v47, v49, v51, v53, v55, v58, v60,
      v61,
      v62,
      v63,
      v64,
      v65,
      v66,
      v67,
      v68,
      v69,
      v70,
      v71,
      v72,
      v73,
      v74,
      v75,
      v76,
      v77,
      v78,
      v79,
      v80,
      v81[0],
      v82,
      v83,
      v84,
      v85,
      v86,
      v87,
      v88,
      v89,
      v90,
      v91,
      v92,
      v93,
      v94,
      v95,
      v96,
      v97,
      v98,
      v99,
      v100,
      v101,
      v102[0]);
  }
  else
  {
    v56 = v1;
    if (v105)
    {
      v10 = v107;
      v42 = v106;
      v11 = v104;
      v12 = v105;
      sub_22DFDD448();
      v13 = v10;
      OUTLINED_FUNCTION_130_0();
      v14 = MEMORY[0x24BEE4B00];
    }
    else
    {
      v12 = 0;
      v11 = 0;
      v42 = 0;
      v13 = 0;
      v14 = 0;
    }
    v54 = v113;
    if (v113)
    {
      v15 = v115;
      v48 = v112;
      v50 = v114;
      sub_22DFDD448();
      v52 = v15;
      OUTLINED_FUNCTION_130_0();
      v46 = MEMORY[0x24BEE4B00];
    }
    else
    {
      v48 = 0;
      v50 = 0;
      v52 = 0;
      v46 = 0;
    }
    v16 = v108;
    v17 = v109;
    v44 = v110;
    v59 = v111;
    v18 = v118;
    if (v118)
    {
      v20 = v119;
      v19 = v120;
      v21 = v117;
      OUTLINED_FUNCTION_104_3();
      OUTLINED_FUNCTION_104_3();
      v22 = OUTLINED_FUNCTION_232_1();
      sub_22DFC4BA0(v22, v23);
      sub_22DFC4AC0((uint64_t)v103);
      OUTLINED_FUNCTION_130_0();
      OUTLINED_FUNCTION_75_1();
      v24 = OUTLINED_FUNCTION_232_1();
      sub_22DFC4A90(v24, v25);
      v26 = v20;
      v27 = MEMORY[0x24BEE4B00];
    }
    else
    {
      OUTLINED_FUNCTION_104_3();
      OUTLINED_FUNCTION_104_3();
      sub_22DFC4AC0((uint64_t)v103);
      v21 = 0;
      v26 = 0;
      v19 = 0;
      v27 = 0;
    }
    v60 = v11;
    v61 = v12;
    v62 = v42;
    v63 = v13;
    v64 = v14;
    v65 = v16;
    v66 = v17;
    v67 = v44;
    v68 = v59;
    v69 = v48;
    v70 = v54;
    v71 = v50;
    v72 = v52;
    v73 = v46;
    LOBYTE(v74) = v116;
    v75 = v21;
    v76 = v18;
    v77 = v26;
    v78 = v19;
    v79 = v27;
    v80 = MEMORY[0x24BEE4B00];
    v28 = OUTLINED_FUNCTION_175_1();
    sub_22DF580B8(v28, v29);
    sub_22DFD1D00(&v60);
    OUTLINED_FUNCTION_78_1();
    OUTLINED_FUNCTION_132();
    v30 = OUTLINED_FUNCTION_175_1();
    sub_22DF58210(v30, v31);
    sub_22DFD1DCC(&v60);
    OUTLINED_FUNCTION_178_1(v81, &v60);
    v33 = nullsub_1(v81, v32);
    OUTLINED_FUNCTION_199_1(v33, v34, qword_255DD8C10, v35, v36, v37, v38, v39, v40, v42, v44, v46, v48, v50, v52, v54, v56, v59, v60,
      v61,
      v62,
      v63,
      v64,
      v65,
      v66,
      v67,
      v68,
      v69,
      v70,
      v71,
      v72,
      v73,
      v74,
      v75,
      v76,
      v77,
      v78,
      v79,
      v80,
      v81[0],
      v82,
      v83,
      v84,
      v85,
      v86,
      v87,
      v88,
      v89,
      v90,
      v91,
      v92,
      v93,
      v94,
      v95,
      v96,
      v97,
      v98,
      v99,
      v100,
      v101,
      v102[0]);
    v1 = v57;
  }
  sub_22DFD1E98((uint64_t)v102, v1, qword_255DD8C10);
  OUTLINED_FUNCTION_4_1();
}

void (*CarrySettings.CarryDevice.deviceInfo.modify(_QWORD *a1))()
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char v20;
  uint64_t v21;
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

  v3 = malloc(0x648uLL);
  *a1 = v3;
  v3[199] = v1;
  v4 = OUTLINED_FUNCTION_168_1();
  v5 = OUTLINED_FUNCTION_245_0(v4);
  v3[200] = v5;
  OUTLINED_FUNCTION_164_1(v1, (uint64_t)v5);
  _s20CarryDeviceMergeableVMa(0);
  OUTLINED_FUNCTION_18_0((uint64_t)v5);
  if (v10)
  {
    sub_22DF58068((uint64_t)v5, &qword_255DD8C08);
LABEL_6:
    v11 = (uint64_t)(v3 + 148);
    sub_22DFC49F8(v3 + 148);
    goto LABEL_17;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_255DD80C0);
  sub_22DFDD07C();
  v6 = OUTLINED_FUNCTION_163_0();
  OUTLINED_FUNCTION_71_3(v6, v7);
  sub_22DF58090((uint64_t)v5, _s20CarryDeviceMergeableVMa);
  v8 = OUTLINED_FUNCTION_169_1();
  OUTLINED_FUNCTION_71_3(v8, v9);
  OUTLINED_FUNCTION_9_8((uint64_t)(v3 + 42));
  if (v10)
    goto LABEL_6;
  v24 = v3[43];
  if (v24)
  {
    v12 = v3[45];
    v30 = v3[42];
    v31 = v3[44];
    sub_22DFDD448();
    v32 = v12;
    OUTLINED_FUNCTION_33_1();
  }
  else
  {
    v30 = 0;
    v31 = 0;
    v32 = 0;
  }
  v23 = v3[52];
  if (v23)
  {
    v13 = v3[54];
    v27 = v3[51];
    v28 = v3[53];
    sub_22DFDD448();
    v29 = v13;
    OUTLINED_FUNCTION_33_1();
  }
  else
  {
    v27 = 0;
    v28 = 0;
    v29 = 0;
  }
  v14 = v3[58];
  if (v14)
  {
    v15 = v3[60];
    v25 = v3[57];
    v26 = v3[59];
    OUTLINED_FUNCTION_99_3();
    OUTLINED_FUNCTION_24_4();
  }
  else
  {
    v25 = 0;
    v26 = 0;
    v15 = 0;
  }
  v16 = v3[47];
  v17 = v3[48];
  v19 = v3[49];
  v18 = v3[50];
  v20 = *((_BYTE *)v3 + 448);
  OUTLINED_FUNCTION_125();
  OUTLINED_FUNCTION_58_1();
  sub_22DF580F4(v3 + 21);
  v3[182] = v30;
  v3[183] = v24;
  v3[184] = v31;
  v3[185] = v32;
  v3[186] = v16;
  v3[187] = v17;
  v3[188] = v19;
  v3[189] = v18;
  v3[190] = v27;
  v11 = (uint64_t)(v3 + 182);
  v3[191] = v23;
  v3[192] = v28;
  v3[193] = v29;
  *((_BYTE *)v3 + 1552) = v20;
  v3[195] = v25;
  v3[196] = v14;
  v3[197] = v26;
  v3[198] = v15;
  nullsub_1(v3 + 182, v21);
LABEL_17:
  sub_22DFD1E98(v11, (uint64_t)(v3 + 165), &qword_255DDC8B8);
  return sub_22DFC22EC;
}

void sub_22DFC22EC()
{
  void **v0;
  void *v1;
  uint64_t v2;
  char v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t *v8;

  OUTLINED_FUNCTION_247_0();
  v1 = *v0;
  v2 = (uint64_t)*v0 + 1320;
  if ((v3 & 1) != 0)
  {
    v4 = OUTLINED_FUNCTION_169_1();
    OUTLINED_FUNCTION_226_1(v4, v5);
    OUTLINED_FUNCTION_226_1((uint64_t)v1 + 504, (uint64_t)v1 + 640);
    sub_22DFC4AC0((uint64_t)v1 + 504);
    CarrySettings.CarryDevice.deviceInfo.setter();
    OUTLINED_FUNCTION_226_1(v2, (uint64_t)v1 + 1048);
    sub_22DFC4AC0((uint64_t)v1 + 1048);
  }
  else
  {
    sub_22DFD1E98((uint64_t)*v0 + 1320, (uint64_t)v1 + 776, &qword_255DDC8B8);
    OUTLINED_FUNCTION_179_1();
    sub_22DFD1E98(v6, v7, v8);
    CarrySettings.CarryDevice.deviceInfo.setter();
  }
  OUTLINED_FUNCTION_234_1();
  free(v1);
}

void CarrySettings.CarryDevice.serverConfiguration.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char v5;
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

  OUTLINED_FUNCTION_21();
  v3 = v2;
  OUTLINED_FUNCTION_140_1();
  OUTLINED_FUNCTION_57();
  MEMORY[0x24BDAC7A8](v4);
  OUTLINED_FUNCTION_16_0();
  OUTLINED_FUNCTION_112_3(v0, v1);
  _s20CarryDeviceMergeableVMa(0);
  OUTLINED_FUNCTION_18_0(v1);
  if (v5)
  {
    sub_22DF58068(v1, &qword_255DD8C08);
LABEL_7:
    *(_OWORD *)v3 = xmmword_22DFE0830;
    *(_OWORD *)(v3 + 16) = 0u;
    *(_OWORD *)(v3 + 32) = 0u;
    *(_OWORD *)(v3 + 48) = 0u;
    *(_QWORD *)(v3 + 64) = 0;
    goto LABEL_10;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_255DD80D0);
  sub_22DFDD07C();
  sub_22DF58090(v1, _s20CarryDeviceMergeableVMa);
  if (!v24)
    goto LABEL_7;
  if (v17)
  {
    v13 = v20 & 0x101;
    OUTLINED_FUNCTION_230();
    v6 = v19;
    OUTLINED_FUNCTION_33_1();
    OUTLINED_FUNCTION_24_4();
    v11 = v18;
    v12 = v16;
    v9 = v21;
    v10 = v19;
    v8 = v22;
  }
  else
  {
    v11 = 0;
    v12 = 0;
    v9 = 0;
    v10 = 0;
    v13 = 0;
    v8 = 0;
    v6 = v19;
  }
  OUTLINED_FUNCTION_233();
  OUTLINED_FUNCTION_203_1(v14, v15, v16, v17, v18, v6, v20, v7, v22, v23, v24);
  *(_QWORD *)v3 = v14;
  *(_QWORD *)(v3 + 8) = v15;
  *(_QWORD *)(v3 + 16) = v12;
  *(_QWORD *)(v3 + 24) = v17;
  *(_QWORD *)(v3 + 32) = v11;
  *(_QWORD *)(v3 + 40) = v10;
  *(_QWORD *)(v3 + 48) = v13;
  *(_QWORD *)(v3 + 56) = v9;
  *(_QWORD *)(v3 + 64) = v8;
LABEL_10:
  OUTLINED_FUNCTION_4_1();
}

double sub_22DFC2574@<D0>(uint64_t a1@<X8>)
{
  double result;
  __int128 v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  uint64_t v7;

  CarrySettings.CarryDevice.serverConfiguration.getter();
  *(_OWORD *)a1 = v3;
  *(_OWORD *)(a1 + 16) = v4;
  result = *(double *)&v5;
  *(_OWORD *)(a1 + 32) = v5;
  *(_OWORD *)(a1 + 48) = v6;
  *(_QWORD *)(a1 + 64) = v7;
  return result;
}

void sub_22DFC25BC(uint64_t *a1)
{
  sub_22DFC4D80(*a1, a1[1], a1[2], a1[3]);
  CarrySettings.CarryDevice.serverConfiguration.setter();
}

void CarrySettings.CarryDevice.serverConfiguration.setter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t *v2;
  uint64_t *v3;
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
  int v14;
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
  _QWORD v26[11];
  uint64_t v27;

  OUTLINED_FUNCTION_21();
  v3 = v2;
  OUTLINED_FUNCTION_140_1();
  OUTLINED_FUNCTION_57();
  MEMORY[0x24BDAC7A8](v4);
  OUTLINED_FUNCTION_46_4();
  v7 = v5 - v6;
  MEMORY[0x24BDAC7A8](v8);
  OUTLINED_FUNCTION_185_1();
  v10 = *v3;
  v9 = v3[1];
  v11 = v3[2];
  v21 = v3[3];
  v22 = v3[4];
  v23 = v3[5];
  v24 = v3[6];
  v12 = v3[8];
  v25 = v3[7];
  OUTLINED_FUNCTION_112_3(v0, v1);
  v13 = OUTLINED_FUNCTION_148_2();
  v14 = OUTLINED_FUNCTION_235_1(v1);
  OUTLINED_FUNCTION_67_5(v1);
  if (v14 == 1)
  {
    sub_22DFC07F0(v7);
    OUTLINED_FUNCTION_174_0();
    __swift_storeEnumTagSinglePayload(v15, v16, v17, v13);
    v18 = OUTLINED_FUNCTION_314();
    sub_22DFD1F50(v18, v19, v20);
  }
  if (OUTLINED_FUNCTION_235_1(v0))
  {
    sub_22DFC4CC8(v10, v9, v11, v21);
  }
  else
  {
    v26[0] = v10;
    v26[1] = v9;
    v26[2] = v11;
    v26[3] = v21;
    v26[4] = v22;
    v26[5] = v23;
    v26[6] = v24;
    v26[7] = v25;
    v26[8] = v12;
    sub_22DFC27E8();
    sub_22DFD1E98((uint64_t)&v27, (uint64_t)v26, &qword_255DDAE70);
    __swift_instantiateConcreteTypeFromMangledName(&qword_255DD80D0);
    sub_22DFDD088();
  }
  OUTLINED_FUNCTION_4_1();
}

void sub_22DFC27E8()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t *v2;
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

  OUTLINED_FUNCTION_159_1();
  v1 = v0;
  v4 = *v2;
  v3 = v2[1];
  v5 = v2[2];
  v6 = v2[3];
  v7 = v2[4];
  v8 = v2[5];
  v10 = v2[6];
  v9 = v2[7];
  v11 = v2[8];
  if (!v3)
  {
    OUTLINED_FUNCTION_94_3(v4, 0);
LABEL_8:
    OUTLINED_FUNCTION_46();
    sub_22DFC4C78(0, 0);
    swift_bridgeObjectRelease();
    v4 = 0;
    v3 = 0;
    v5 = 0;
    v6 = 0;
    v7 = 0;
    v8 = 0;
    v16 = 0;
    v9 = 0;
    v11 = 0;
    v17 = 0;
    goto LABEL_9;
  }
  if (v3 == 1)
    goto LABEL_8;
  OUTLINED_FUNCTION_104_3();
  v12 = OUTLINED_FUNCTION_111_2();
  sub_22DFC4DFC(v12, v13);
  OUTLINED_FUNCTION_94_3(v4, v3);
  if (!v6)
  {
    OUTLINED_FUNCTION_46();
    goto LABEL_8;
  }
  OUTLINED_FUNCTION_125();
  OUTLINED_FUNCTION_96_0();
  OUTLINED_FUNCTION_99_3();
  v14 = OUTLINED_FUNCTION_111_2();
  sub_22DFC4D44(v14, v15);
  OUTLINED_FUNCTION_46();
  v16 = v10 & 0x101;
  v17 = MEMORY[0x24BEE4B00];
LABEL_9:
  *v1 = v4;
  v1[1] = v3;
  v1[2] = v5;
  v1[3] = v6;
  v1[4] = v7;
  v1[5] = v8;
  v1[6] = v16;
  v1[7] = v9;
  v1[8] = v11;
  v1[9] = v17;
  v1[10] = v17;
  OUTLINED_FUNCTION_91_4();
}

void (*CarrySettings.CarryDevice.serverConfiguration.modify(_QWORD *a1))(uint64_t **a1, char a2)
{
  uint64_t v1;
  char *v3;
  uint64_t v4;
  void *v5;
  char v6;
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

  v3 = (char *)malloc(0xB0uLL);
  *a1 = v3;
  *((_QWORD *)v3 + 20) = v1;
  v4 = OUTLINED_FUNCTION_168_1();
  v5 = OUTLINED_FUNCTION_245_0(v4);
  *((_QWORD *)v3 + 21) = v5;
  OUTLINED_FUNCTION_164_1(v1, (uint64_t)v5);
  OUTLINED_FUNCTION_188_1();
  OUTLINED_FUNCTION_18_0((uint64_t)v5);
  if (v6)
  {
    sub_22DF58068((uint64_t)v5, &qword_255DD8C08);
LABEL_7:
    *(_OWORD *)(v3 + 88) = xmmword_22DFE0830;
    *(_OWORD *)(v3 + 104) = 0u;
    *(_OWORD *)(v3 + 120) = 0u;
    *(_OWORD *)(v3 + 136) = 0u;
    *((_QWORD *)v3 + 19) = 0;
    return sub_22DFC2AFC;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_255DD80D0);
  sub_22DFDD07C();
  v7 = *((_QWORD *)v3 + 1);
  v9 = *((_QWORD *)v3 + 2);
  v8 = *((_QWORD *)v3 + 3);
  v11 = *((_QWORD *)v3 + 4);
  v10 = *((_QWORD *)v3 + 5);
  v12 = *((_QWORD *)v3 + 6);
  v27 = *((_QWORD *)v3 + 7);
  v28 = *(_QWORD *)v3;
  v13 = *((_QWORD *)v3 + 8);
  v26 = *((_QWORD *)v3 + 9);
  v14 = *((_QWORD *)v3 + 10);
  sub_22DF58090((uint64_t)v5, _s20CarryDeviceMergeableVMa);
  if (!v14)
    goto LABEL_7;
  v24 = v12;
  if (v8)
  {
    v25 = v12 & 0x101;
    OUTLINED_FUNCTION_125();
    v15 = v10;
    OUTLINED_FUNCTION_130_0();
    OUTLINED_FUNCTION_58_1();
    v22 = v11;
    v23 = v9;
    v16 = v11;
    v17 = v27;
    v20 = v27;
    v21 = v10;
    v19 = v13;
  }
  else
  {
    v22 = 0;
    v23 = 0;
    v20 = 0;
    v21 = 0;
    v25 = 0;
    v19 = 0;
    v16 = v11;
    v17 = v27;
    v15 = v10;
  }
  OUTLINED_FUNCTION_230();
  sub_22DFC4BD0(v28, v7, v9, v8, v16, v15, v24, v17, v13, v26, v14);
  *((_QWORD *)v3 + 11) = v28;
  *((_QWORD *)v3 + 12) = v7;
  *((_QWORD *)v3 + 13) = v23;
  *((_QWORD *)v3 + 14) = v8;
  *((_QWORD *)v3 + 15) = v22;
  *((_QWORD *)v3 + 16) = v21;
  *((_QWORD *)v3 + 17) = v25;
  *((_QWORD *)v3 + 18) = v20;
  *((_QWORD *)v3 + 19) = v19;
  return sub_22DFC2AFC;
}

void sub_22DFC2AFC(uint64_t **a1, char a2)
{
  uint64_t *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v2 = *a1;
  if ((a2 & 1) != 0)
  {
    OUTLINED_FUNCTION_161_1();
    sub_22DFC4D80(v3, v4, v5, v6);
    CarrySettings.CarryDevice.serverConfiguration.setter();
    sub_22DFC4CC8(v2[11], v2[12], v2[13], v2[14]);
  }
  else
  {
    OUTLINED_FUNCTION_161_1();
    CarrySettings.CarryDevice.serverConfiguration.setter();
  }
  OUTLINED_FUNCTION_234_1();
  free(v2);
}

uint64_t CarrySettings.CarryDevice.profiles.getter()
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
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char v19;
  _QWORD *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  unint64_t v28;
  char v29;
  unint64_t v30;
  char v31;
  unint64_t v32;
  char v33;
  char v34;
  uint64_t v35;
  char v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  BOOL v44;
  uint64_t v45;
  uint64_t result;
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
  _QWORD *v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;

  OUTLINED_FUNCTION_21();
  v60 = v3;
  v61 = v4;
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_255DDC8C0);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  OUTLINED_FUNCTION_16_0();
  OUTLINED_FUNCTION_168_1();
  OUTLINED_FUNCTION_57();
  MEMORY[0x24BDAC7A8](v7);
  OUTLINED_FUNCTION_41();
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_255DD80C8);
  OUTLINED_FUNCTION_14_18();
  MEMORY[0x24BDAC7A8](v9);
  OUTLINED_FUNCTION_46_4();
  v12 = v10 - v11;
  MEMORY[0x24BDAC7A8](v13);
  v15 = (char *)&v47 - v14;
  v16 = OUTLINED_FUNCTION_177_1();
  OUTLINED_FUNCTION_164_1(v16, v17);
  v18 = _s20CarryDeviceMergeableVMa(0);
  OUTLINED_FUNCTION_26_12(v0, 1, v18);
  if (v19)
  {
    sub_22DF58068(v0, &qword_255DD8C08);
    return MEMORY[0x24BEE4B00];
  }
  v51 = v6;
  (*(void (**)(unint64_t, uint64_t, uint64_t))(v2 + 16))(v12, v0 + *(int *)(v18 + 24), v8);
  sub_22DF58090(v0, _s20CarryDeviceMergeableVMa);
  v49 = v2;
  (*(void (**)(char *, unint64_t, uint64_t))(v2 + 32))(v15, v12, v8);
  v50 = v8;
  v48 = v15;
  sub_22DFDD22C();
  v53 = v5;
  sub_22DFDD244();
  v21 = v59;
  if (!v59)
  {
    v20 = (_QWORD *)MEMORY[0x24BEE4B00];
LABEL_17:
    (*(void (**)(uint64_t, uint64_t))(v51 + 8))(v1, v53);
    (*(void (**)(char *, uint64_t))(v49 + 8))(v48, v50);
    return (uint64_t)v20;
  }
  v22 = (uint64_t)v58;
  OUTLINED_FUNCTION_206_1();
  v20 = (_QWORD *)MEMORY[0x24BEE4B00];
  v52 = v1;
  while (1)
  {
    v54 = v26;
    v55 = v25;
    v56 = v24;
    v57 = v23;
    swift_bridgeObjectRelease();
    swift_isUniquelyReferenced_nonNull_native();
    v58 = v20;
    v27 = v21;
    v28 = sub_22DFCA9B0(v22, v21);
    if (__OFADD__(v20[2], (v29 & 1) == 0))
      break;
    v30 = v28;
    v31 = v29;
    __swift_instantiateConcreteTypeFromMangledName(&qword_255DDC8C8);
    if ((sub_22DFDDD48() & 1) != 0)
    {
      v32 = sub_22DFCA9B0(v22, v27);
      if ((v31 & 1) != (v33 & 1))
        goto LABEL_21;
      v30 = v32;
    }
    v34 = v12 & 1;
    v20 = v58;
    v12 = (v12 & 0x100) >> 8;
    if ((v31 & 1) != 0)
    {
      v35 = v58[7] + 56 * v30;
      v36 = v34;
      swift_bridgeObjectRelease();
      OUTLINED_FUNCTION_78_1();
      OUTLINED_FUNCTION_46();
      *(_QWORD *)v35 = v6;
      *(_QWORD *)(v35 + 8) = v5;
      v37 = v57;
      *(_QWORD *)(v35 + 16) = v54;
      *(_QWORD *)(v35 + 24) = v37;
      *(_BYTE *)(v35 + 32) = v36;
      *(_BYTE *)(v35 + 33) = v12;
      v38 = v55;
      *(_QWORD *)(v35 + 40) = v56;
      *(_QWORD *)(v35 + 48) = v38;
    }
    else
    {
      v58[(v30 >> 6) + 8] |= 1 << v30;
      v39 = (uint64_t *)(v20[6] + 16 * v30);
      *v39 = v22;
      v39[1] = v27;
      v40 = v20[7] + 56 * v30;
      *(_QWORD *)v40 = v6;
      *(_QWORD *)(v40 + 8) = v5;
      v41 = v57;
      *(_QWORD *)(v40 + 16) = v54;
      *(_QWORD *)(v40 + 24) = v41;
      *(_BYTE *)(v40 + 32) = v34;
      *(_BYTE *)(v40 + 33) = v12;
      v42 = v55;
      *(_QWORD *)(v40 + 40) = v56;
      *(_QWORD *)(v40 + 48) = v42;
      v43 = v20[2];
      v44 = __OFADD__(v43, 1);
      v45 = v43 + 1;
      if (v44)
        goto LABEL_20;
      v20[2] = v45;
      sub_22DFDD448();
    }
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    v1 = v52;
    sub_22DFDD244();
    v22 = (uint64_t)v58;
    v21 = v59;
    OUTLINED_FUNCTION_206_1();
    if (!v21)
      goto LABEL_17;
  }
  __break(1u);
LABEL_20:
  __break(1u);
LABEL_21:
  result = sub_22DFDDF88();
  __break(1u);
  return result;
}

#error "22DFC2F30: call analysis failed (funcsize=10)"

void CarrySettings.CarryDevice.profiles.setter(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18)
{
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  char *v25;
  uint64_t v26;
  int v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;

  OUTLINED_FUNCTION_247_0();
  a17 = v20;
  a18 = v21;
  __swift_instantiateConcreteTypeFromMangledName(&qword_255DD8C08);
  OUTLINED_FUNCTION_57();
  MEMORY[0x24BDAC7A8](v22);
  OUTLINED_FUNCTION_68_3();
  MEMORY[0x24BDAC7A8](v23);
  v25 = (char *)&a9 - v24;
  v26 = _s20CarryDeviceMergeableVMa(0);
  if (!OUTLINED_FUNCTION_158_1(v18))
    sub_22DFC3044();
  sub_22DFD21A4(v18, (uint64_t)v25, &qword_255DD8C08);
  v27 = OUTLINED_FUNCTION_158_1((uint64_t)v25);
  OUTLINED_FUNCTION_129_3((uint64_t)v25);
  if (v27 == 1)
  {
    sub_22DFC07F0(v19);
    OUTLINED_FUNCTION_174_0();
    __swift_storeEnumTagSinglePayload(v28, v29, v30, v26);
    sub_22DFD1F50(v19, v18, &qword_255DD8C08);
  }
  if (!OUTLINED_FUNCTION_158_1(v18))
    sub_22DFC323C();
  OUTLINED_FUNCTION_107();
  OUTLINED_FUNCTION_181();
}

uint64_t sub_22DFC3044()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  _QWORD v16[2];
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;

  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_255DDC8C0);
  v16[0] = *(_QWORD *)(v1 - 8);
  MEMORY[0x24BDAC7A8](v1);
  v3 = (char *)v16 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16[1] = __swift_instantiateConcreteTypeFromMangledName(&qword_255DD80C8);
  v17 = v0;
  sub_22DFDD22C();
  v18 = v1;
  sub_22DFDD244();
  v4 = v22;
  if (v22)
  {
    v5 = v21;
    v6 = MEMORY[0x24BEE4AF8];
    do
    {
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_22DF46E40(0, *(_QWORD *)(v6 + 16) + 1, 1, v6);
        v6 = v10;
      }
      v8 = *(_QWORD *)(v6 + 16);
      v7 = *(_QWORD *)(v6 + 24);
      if (v8 >= v7 >> 1)
      {
        sub_22DF46E40(v7 > 1, v8 + 1, 1, v6);
        v6 = v11;
      }
      *(_QWORD *)(v6 + 16) = v8 + 1;
      v9 = v6 + 16 * v8;
      *(_QWORD *)(v9 + 32) = v5;
      *(_QWORD *)(v9 + 40) = v4;
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      sub_22DFDD244();
      v5 = v21;
      v4 = v22;
    }
    while (v22);
  }
  else
  {
    v6 = MEMORY[0x24BEE4AF8];
  }
  (*(void (**)(char *, uint64_t))(v16[0] + 8))(v3, v18);
  v12 = *(_QWORD *)(v6 + 16);
  if (v12)
  {
    v13 = (uint64_t *)(v6 + 40);
    do
    {
      v14 = *v13;
      v19 = *(v13 - 1);
      v20 = v14;
      sub_22DFDD448();
      sub_22DFDD220();
      sub_22DFC4C78(v21, v22);
      swift_bridgeObjectRelease();
      v13 += 2;
      --v12;
    }
    while (v12);
  }
  return swift_bridgeObjectRelease();
}

void sub_22DFC323C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  int64_t v6;
  int64_t v7;
  int64_t v8;
  uint64_t v9;
  int64_t v10;

  OUTLINED_FUNCTION_160_1();
  v1 = v0 + 64;
  OUTLINED_FUNCTION_151_1();
  v4 = v3 & v2;
  v6 = (unint64_t)(v5 + 63) >> 6;
  sub_22DFDD448();
  v7 = 0;
  if (!v4)
    goto LABEL_3;
LABEL_2:
  for (v4 &= v4 - 1; ; v4 = (v9 - 1) & v9)
  {
    sub_22DFDD448();
    OUTLINED_FUNCTION_230();
    OUTLINED_FUNCTION_125();
    OUTLINED_FUNCTION_58_1();
    OUTLINED_FUNCTION_140_1();
    sub_22DFDD274();
    if (v4)
      goto LABEL_2;
LABEL_3:
    v8 = v7 + 1;
    if (__OFADD__(v7, 1))
    {
      __break(1u);
      goto LABEL_21;
    }
    if (v8 >= v6)
      goto LABEL_19;
    v9 = *(_QWORD *)(v1 + 8 * v8);
    ++v7;
    if (!v9)
    {
      v7 = v8 + 1;
      if (v8 + 1 >= v6)
        goto LABEL_19;
      v9 = *(_QWORD *)(v1 + 8 * v7);
      if (!v9)
      {
        v7 = v8 + 2;
        if (v8 + 2 >= v6)
          goto LABEL_19;
        v9 = *(_QWORD *)(v1 + 8 * v7);
        if (!v9)
          break;
      }
    }
LABEL_16:
    ;
  }
  v10 = v8 + 3;
  if (v10 >= v6)
  {
LABEL_19:
    OUTLINED_FUNCTION_315();
    OUTLINED_FUNCTION_167_2();
    return;
  }
  v9 = *(_QWORD *)(v1 + 8 * v10);
  if (v9)
  {
    v7 = v10;
    goto LABEL_16;
  }
  while (1)
  {
    v7 = v10 + 1;
    if (__OFADD__(v10, 1))
      break;
    if (v7 >= v6)
      goto LABEL_19;
    v9 = *(_QWORD *)(v1 + 8 * v7);
    ++v10;
    if (v9)
      goto LABEL_16;
  }
LABEL_21:
  __break(1u);
}

void CarrySettings.CarryDevice.profiles.modify(uint64_t *a1)
{
  uint64_t v1;

  a1[1] = v1;
  *a1 = CarrySettings.CarryDevice.profiles.getter();
  OUTLINED_FUNCTION_1_2();
}

#error "22DFC342C: call analysis failed (funcsize=14)"

void CarrySettings.CarryDevice.init(appleConnectSettings:deviceInfo:serverConfig:profiles:)()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t *v5;
  uint64_t *v6;
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
  int64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;
  uint64_t v28;
  unint64_t v29;
  unint64_t v30;
  int64_t v31;
  unint64_t v32;
  int64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  int v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  BOOL v46;
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
  int64_t v57;
  _BYTE v58[168];
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
  _BYTE v71[144];

  OUTLINED_FUNCTION_21();
  v54 = v3;
  v55 = v4;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  __swift_instantiateConcreteTypeFromMangledName(&qword_255DDC8B0);
  OUTLINED_FUNCTION_57();
  MEMORY[0x24BDAC7A8](v11);
  OUTLINED_FUNCTION_41();
  __swift_instantiateConcreteTypeFromMangledName(&qword_255DD8C00);
  OUTLINED_FUNCTION_57();
  MEMORY[0x24BDAC7A8](v12);
  OUTLINED_FUNCTION_46_4();
  v15 = v13 - v14;
  MEMORY[0x24BDAC7A8](v16);
  OUTLINED_FUNCTION_185_1();
  __swift_instantiateConcreteTypeFromMangledName(&qword_255DD8C08);
  OUTLINED_FUNCTION_57();
  MEMORY[0x24BDAC7A8](v17);
  OUTLINED_FUNCTION_43_5();
  sub_22DFD1E98(v8, (uint64_t)v71, &qword_255DDC8B8);
  v18 = *v6;
  v48 = v6[1];
  v49 = v6[2];
  v50 = v6[3];
  v51 = v6[4];
  v52 = v6[5];
  v53 = v6[6];
  v19 = v6[8];
  v56 = v6[7];
  v20 = _s20CarryDeviceMergeableVMa(0);
  OUTLINED_FUNCTION_101_2(v10, 1);
  sub_22DFC07F0(v2);
  OUTLINED_FUNCTION_101_2(v2, 0);
  v21 = v2;
  v22 = v10;
  sub_22DFD1F50(v21, v10, &qword_255DD8C08);
  if (!__swift_getEnumTagSinglePayload(v10, 1, v20))
  {
    sub_22DFD21A4(v54, v0, &qword_255DDC8B0);
    sub_22DFC181C();
    sub_22DFD21A4(v1, v15, &qword_255DD8C00);
    __swift_instantiateConcreteTypeFromMangledName(&qword_255DD80B8);
    sub_22DFDD088();
    sub_22DF58068(v1, &qword_255DD8C00);
  }
  if (OUTLINED_FUNCTION_98_3())
  {
    sub_22DFC4AC0((uint64_t)v71);
  }
  else
  {
    sub_22DFD1E98((uint64_t)v71, (uint64_t)v58, &qword_255DDC8B8);
    sub_22DFC1E3C();
    sub_22DFD1E98((uint64_t)&v70, (uint64_t)v58, qword_255DD8C10);
    __swift_instantiateConcreteTypeFromMangledName(&qword_255DD80C0);
    sub_22DFDD088();
  }
  if (OUTLINED_FUNCTION_98_3())
  {
    sub_22DFC4CC8(v18, v48, v49, v50);
  }
  else
  {
    v59 = v18;
    v60 = v48;
    v61 = v49;
    v62 = v50;
    v63 = v51;
    v64 = v52;
    v65 = v53;
    v66 = v56;
    v67 = v19;
    sub_22DFC27E8();
    sub_22DFD1E98((uint64_t)v58, (uint64_t)&v59, &qword_255DDAE70);
    __swift_instantiateConcreteTypeFromMangledName(&qword_255DD80D0);
    sub_22DFDD088();
  }
  v23 = 0;
  v24 = v55 + 64;
  OUTLINED_FUNCTION_151_1();
  v27 = v26 & v25;
  v57 = (unint64_t)(v28 + 63) >> 6;
  while (v27)
  {
    v29 = __clz(__rbit64(v27));
    v27 &= v27 - 1;
    v30 = v29 | (v23 << 6);
LABEL_26:
    if (!OUTLINED_FUNCTION_98_3())
    {
      v34 = *(_QWORD *)(v55 + 56) + 56 * v30;
      v35 = v22;
      v36 = *(_QWORD *)(v34 + 40);
      v37 = *(_QWORD *)(v34 + 48);
      v38 = *(unsigned __int8 *)(v34 + 33);
      v39 = *(unsigned __int8 *)(v34 + 32);
      v40 = *(_QWORD *)(v34 + 16);
      v41 = *(_QWORD *)(v34 + 24);
      v42 = *(_QWORD *)v34;
      v43 = *(_QWORD *)(*(_QWORD *)(v55 + 56) + 56 * v30 + 8);
      v45 = *(_QWORD *)(*(_QWORD *)(v55 + 48) + 16 * v30);
      v44 = *(_QWORD *)(*(_QWORD *)(v55 + 48) + 16 * v30 + 8);
      v46 = v38 == 0;
      v47 = 256;
      if (v46)
        v47 = 0;
      v59 = v42;
      v60 = v43;
      v61 = v40;
      v62 = v41;
      v63 = v47 | v39;
      v64 = v36;
      v65 = v37;
      v66 = MEMORY[0x24BEE4B00];
      v68 = v45;
      v69 = v44;
      sub_22DFDD448();
      OUTLINED_FUNCTION_75_1();
      OUTLINED_FUNCTION_230();
      v22 = v35;
      sub_22DFDD448();
      __swift_instantiateConcreteTypeFromMangledName(&qword_255DD80C8);
      sub_22DFDD274();
    }
  }
  v31 = v23 + 1;
  if (__OFADD__(v23, 1))
  {
    __break(1u);
    goto LABEL_33;
  }
  if (v31 >= v57)
    goto LABEL_31;
  v32 = *(_QWORD *)(v24 + 8 * v31);
  ++v23;
  if (v32)
    goto LABEL_25;
  v23 = v31 + 1;
  if (v31 + 1 >= v57)
    goto LABEL_31;
  v32 = *(_QWORD *)(v24 + 8 * v23);
  if (v32)
    goto LABEL_25;
  v23 = v31 + 2;
  if (v31 + 2 >= v57)
    goto LABEL_31;
  v32 = *(_QWORD *)(v24 + 8 * v23);
  if (v32)
  {
LABEL_25:
    v27 = (v32 - 1) & v32;
    v30 = __clz(__rbit64(v32)) + (v23 << 6);
    goto LABEL_26;
  }
  v33 = v31 + 3;
  if (v33 >= v57)
  {
LABEL_31:
    sub_22DF58068(v54, &qword_255DDC8B0);
    swift_release();
    OUTLINED_FUNCTION_4_1();
    return;
  }
  v32 = *(_QWORD *)(v24 + 8 * v33);
  if (v32)
  {
    v23 = v33;
    goto LABEL_25;
  }
  while (1)
  {
    v23 = v33 + 1;
    if (__OFADD__(v33, 1))
      break;
    if (v23 >= v57)
      goto LABEL_31;
    v32 = *(_QWORD *)(v24 + 8 * v23);
    ++v33;
    if (v32)
      goto LABEL_25;
  }
LABEL_33:
  __break(1u);
}

uint64_t sub_22DFC38A0()
{
  uint64_t result;

  qword_255DF2E90 = 0xD000000000000014;
  *(_QWORD *)algn_255DF2E98 = 0x800000022DFF2640;
  qword_255DF2EA0 = swift_getKeyPath();
  unk_255DF2EA8 = 0x6E49656369766564;
  qword_255DF2EB0 = 0xEA00000000006F66;
  qword_255DF2EB8 = swift_getKeyPath();
  qword_255DF2EC0 = 0x73656C69666F7270;
  qword_255DF2EC8 = 0xE800000000000000;
  qword_255DF2ED0 = swift_getKeyPath();
  unk_255DF2ED8 = 0xD000000000000013;
  qword_255DF2EE0 = 0x800000022DFF2660;
  result = swift_getKeyPath();
  qword_255DF2EE8 = result;
  return result;
}

uint64_t *sub_22DFC3968()
{
  if (qword_255DD6F80 != -1)
    swift_once();
  return &qword_255DF2E90;
}

void sub_22DFC39A8()
{
  uint64_t v0;
  uint64_t v1;
  __int128 *v2;
  __int128 *v3;
  uint64_t v4;
  uint64_t v5;
  char v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  __int128 *v22;
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
  uint64_t v41[2];
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
  uint64_t v52[21];
  _BYTE v53[176];

  OUTLINED_FUNCTION_21();
  v3 = v2;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_255DDC8C0);
  v38 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  OUTLINED_FUNCTION_16_0();
  OUTLINED_FUNCTION_168_1();
  OUTLINED_FUNCTION_57();
  MEMORY[0x24BDAC7A8](v5);
  OUTLINED_FUNCTION_246();
  __swift_instantiateConcreteTypeFromMangledName(&qword_255DD80B8);
  sub_22DFDD07C();
  sub_22DFD149C(v3);
  sub_22DF58068(v1, &qword_255DD8C00);
  _s20CarryDeviceMergeableVMa(0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_255DD80C0);
  sub_22DFDD07C();
  OUTLINED_FUNCTION_71_3((uint64_t)v53, (uint64_t)v52);
  OUTLINED_FUNCTION_71_3((uint64_t)v52, (uint64_t)v53);
  OUTLINED_FUNCTION_9_8((uint64_t)v53);
  if (v6)
  {
    OUTLINED_FUNCTION_201_0();
  }
  else
  {
    sub_22DFD1E98((uint64_t)v52, (uint64_t)v41, qword_255DD8C10);
    OUTLINED_FUNCTION_178_1(&v51, v41);
    OUTLINED_FUNCTION_201_0();
    sub_22DFD1D00(v41);
    sub_22DFC5DD4();
    sub_22DF580F4(v52);
    sub_22DF580F4(v52);
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_255DD80D0);
  sub_22DFDD07C();
  v7 = v50;
  if (v50)
  {
    v33 = v41[1];
    v34 = v41[0];
    v35 = v46;
    v36 = v43;
    v37 = v48;
    v28 = v49;
    v29 = v45;
    v8 = v42;
    v30 = v42;
    v31 = v47;
    v32 = v44;
    OUTLINED_FUNCTION_15_2();
    OUTLINED_FUNCTION_75_1();
    sub_22DFD1AE0(v8, v36);
    OUTLINED_FUNCTION_230();
    sub_22DFC8810();
    sub_22DFC4BD0(v34, v33, v30, v36, v32, v29, v35, v31, v37, v28, v7);
    sub_22DFC4BD0(v34, v33, v30, v36, v32, v29, v35, v31, v37, v28, v7);
  }
  else
  {
    OUTLINED_FUNCTION_201_0();
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_255DD80C8);
  sub_22DFDD22C();
  OUTLINED_FUNCTION_154_2();
  v9 = v40;
  if (v40)
  {
    v10 = v39;
    v11 = MEMORY[0x24BEE4AF8];
    do
    {
      swift_bridgeObjectRelease();
      OUTLINED_FUNCTION_103();
      OUTLINED_FUNCTION_78_1();
      OUTLINED_FUNCTION_46();
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        OUTLINED_FUNCTION_233_1(0, *(_QWORD *)(v11 + 16) + 1);
        v11 = v15;
      }
      v13 = *(_QWORD *)(v11 + 16);
      v12 = *(_QWORD *)(v11 + 24);
      if (v13 >= v12 >> 1)
      {
        OUTLINED_FUNCTION_233_1(v12 > 1, v13 + 1);
        v11 = v16;
      }
      *(_QWORD *)(v11 + 16) = v13 + 1;
      v14 = v11 + 16 * v13;
      *(_QWORD *)(v14 + 32) = v10;
      *(_QWORD *)(v14 + 40) = v9;
      OUTLINED_FUNCTION_154_2();
      v10 = v39;
      v9 = v40;
    }
    while (v40);
  }
  else
  {
    v11 = MEMORY[0x24BEE4AF8];
  }
  (*(void (**)(uint64_t, uint64_t))(v38 + 8))(v0, v4);
  v39 = v11;
  OUTLINED_FUNCTION_104_3();
  sub_22DFD0A60(&v39);
  OUTLINED_FUNCTION_132();
  v17 = v39;
  v18 = *(_QWORD *)(v39 + 16);
  if (v18)
  {
    swift_retain();
    v19 = v17 + 40;
    do
    {
      OUTLINED_FUNCTION_233();
      sub_22DFDD268();
      v20 = v40;
      if (v40)
      {
        v21 = v39;
        sub_22DFDE018();
        sub_22DFD1AE0(v21, v20);
        OUTLINED_FUNCTION_24_4();
        sub_22DFDD544();
        OUTLINED_FUNCTION_132();
        OUTLINED_FUNCTION_230();
        OUTLINED_FUNCTION_238_1();
        sub_22DFDD544();
        OUTLINED_FUNCTION_78_1();
        sub_22DFDE018();
        sub_22DFDE018();
        OUTLINED_FUNCTION_233();
        OUTLINED_FUNCTION_66_1();
        OUTLINED_FUNCTION_149();
        OUTLINED_FUNCTION_99_3();
        v22 = (__int128 *)OUTLINED_FUNCTION_238_1();
        sub_22DFD1758(v22, v23);
        OUTLINED_FUNCTION_61_0();
        v24 = OUTLINED_FUNCTION_196_0();
        sub_22DFC4C78(v24, v25);
        v26 = OUTLINED_FUNCTION_196_0();
        sub_22DFC4C78(v26, v27);
      }
      else
      {
        sub_22DFDE018();
      }
      v19 += 16;
      OUTLINED_FUNCTION_149();
      --v18;
    }
    while (v18);
    swift_bridgeObjectRelease();
    swift_release();
  }
  else
  {
    OUTLINED_FUNCTION_132();
  }
  swift_release();
  OUTLINED_FUNCTION_4_1();
}

void sub_22DFC3EE8()
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
  char v38;
  char v39;
  char v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  char v44;
  uint64_t v45;
  uint64_t v46;
  char v47;
  char v48;
  char v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t (*v52)(_QWORD);
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
  uint64_t v91;
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
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117[21];
  _BYTE v118[168];
  uint64_t v119[21];
  uint64_t v120[21];
  uint64_t v121[42];
  _QWORD v122[42];
  uint64_t v123[21];
  uint64_t v124[21];
  _QWORD v125[21];
  _BYTE v126[176];

  OUTLINED_FUNCTION_21();
  v112 = v4;
  v6 = v5;
  v108 = OUTLINED_FUNCTION_148_2();
  OUTLINED_FUNCTION_57();
  MEMORY[0x24BDAC7A8](v7);
  OUTLINED_FUNCTION_46_4();
  v113 = v8 - v9;
  OUTLINED_FUNCTION_12_5();
  MEMORY[0x24BDAC7A8](v10);
  OUTLINED_FUNCTION_244_0();
  v114 = v11;
  OUTLINED_FUNCTION_12_5();
  MEMORY[0x24BDAC7A8](v12);
  OUTLINED_FUNCTION_244_0();
  v109 = v13;
  OUTLINED_FUNCTION_12_5();
  MEMORY[0x24BDAC7A8](v14);
  OUTLINED_FUNCTION_244_0();
  v110 = v15;
  OUTLINED_FUNCTION_12_5();
  MEMORY[0x24BDAC7A8](v16);
  OUTLINED_FUNCTION_244_0();
  v115 = v17;
  OUTLINED_FUNCTION_12_5();
  MEMORY[0x24BDAC7A8](v18);
  v116 = (uint64_t)&v92 - v19;
  v20 = OUTLINED_FUNCTION_189_1();
  OUTLINED_FUNCTION_57();
  MEMORY[0x24BDAC7A8](v21);
  v107 = (uint64_t)&v92 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  v23 = __swift_instantiateConcreteTypeFromMangledName(&qword_255DDD020);
  OUTLINED_FUNCTION_57();
  MEMORY[0x24BDAC7A8](v24);
  OUTLINED_FUNCTION_16_5();
  OUTLINED_FUNCTION_140_1();
  OUTLINED_FUNCTION_57();
  MEMORY[0x24BDAC7A8](v25);
  OUTLINED_FUNCTION_150_2();
  MEMORY[0x24BDAC7A8](v26);
  OUTLINED_FUNCTION_123_2();
  MEMORY[0x24BDAC7A8](v27);
  OUTLINED_FUNCTION_184_1();
  __swift_instantiateConcreteTypeFromMangledName(&qword_255DD80B8);
  v111 = v6;
  sub_22DFDD07C();
  v28 = v112;
  sub_22DFDD07C();
  v29 = v0 + *(int *)(v23 + 48);
  OUTLINED_FUNCTION_112_3(v1, v0);
  v30 = OUTLINED_FUNCTION_177_1();
  OUTLINED_FUNCTION_112_3(v30, v31);
  OUTLINED_FUNCTION_26_12(v0, 1, v20);
  if (v38)
  {
    OUTLINED_FUNCTION_67_5(v2);
    OUTLINED_FUNCTION_67_5(v1);
    v32 = OUTLINED_FUNCTION_26_12(v29, 1, v20);
    v33 = v113;
    if (v38)
    {
      OUTLINED_FUNCTION_110_4(v32, &qword_255DD8C00);
      v34 = v111;
      OUTLINED_FUNCTION_61_5(v111, v116);
      v35 = v115;
      OUTLINED_FUNCTION_61_5(v28, v115);
      v36 = v110;
      goto LABEL_11;
    }
    goto LABEL_9;
  }
  v37 = v107;
  sub_22DFD21A4(v0, v3, &qword_255DD8C00);
  OUTLINED_FUNCTION_26_12(v29, 1, v20);
  if (v38)
  {
    OUTLINED_FUNCTION_129_3(v2);
    OUTLINED_FUNCTION_129_3(v1);
    sub_22DF58090(v3, _s29AppleConnectSettingsMergeableVMa);
    v33 = v113;
LABEL_9:
    OUTLINED_FUNCTION_110_4(v32, &qword_255DDD020);
    v34 = v111;
    v41 = v116;
    OUTLINED_FUNCTION_61_5(v111, v116);
    v35 = v115;
    OUTLINED_FUNCTION_61_5(v28, v115);
    v36 = v110;
LABEL_16:
    OUTLINED_FUNCTION_46_5(v35);
    OUTLINED_FUNCTION_46_5(v41);
    v45 = v114;
    v46 = v33;
    v43 = v109;
LABEL_21:
    OUTLINED_FUNCTION_61_5(v34, v36);
    OUTLINED_FUNCTION_61_5(v28, v43);
LABEL_22:
    OUTLINED_FUNCTION_46_5(v43);
    OUTLINED_FUNCTION_46_5(v36);
    OUTLINED_FUNCTION_61_5(v34, v45);
    OUTLINED_FUNCTION_61_5(v28, v46);
    goto LABEL_23;
  }
  OUTLINED_FUNCTION_229_1(v29, v37);
  sub_22DFC9990();
  v40 = v39;
  OUTLINED_FUNCTION_66_5(v37);
  sub_22DF58068(v2, &qword_255DD8C00);
  sub_22DF58068(v1, &qword_255DD8C00);
  OUTLINED_FUNCTION_66_5(v3);
  sub_22DF58068(v0, &qword_255DD8C00);
  v34 = v111;
  v41 = v116;
  OUTLINED_FUNCTION_170_1(v111, v116);
  v35 = v115;
  OUTLINED_FUNCTION_170_1(v28, v115);
  v33 = v113;
  v36 = v110;
  if ((v40 & 1) == 0)
    goto LABEL_16;
LABEL_11:
  __swift_instantiateConcreteTypeFromMangledName(&qword_255DD80C0);
  sub_22DFDD07C();
  OUTLINED_FUNCTION_135_2((uint64_t)v122, (uint64_t)v123);
  sub_22DFDD07C();
  OUTLINED_FUNCTION_135_2((uint64_t)v122, (uint64_t)v124);
  OUTLINED_FUNCTION_135_2((uint64_t)v123, (uint64_t)v122);
  OUTLINED_FUNCTION_135_2((uint64_t)v124, (uint64_t)&v122[21]);
  OUTLINED_FUNCTION_135_2((uint64_t)v123, (uint64_t)v125);
  OUTLINED_FUNCTION_9_8((uint64_t)v125);
  if (v38)
  {
    OUTLINED_FUNCTION_66_5(v35);
    OUTLINED_FUNCTION_66_5(v116);
    sub_22DFD1E98((uint64_t)&v122[21], (uint64_t)v126, qword_255DD8C10);
    sub_22DFD1E98((uint64_t)v126, (uint64_t)v121, qword_255DD8C10);
    OUTLINED_FUNCTION_9_8((uint64_t)v121);
    if (v38)
    {
      sub_22DFD1E98((uint64_t)v122, (uint64_t)v120, qword_255DD8C10);
      sub_22DF580F4(v120);
      OUTLINED_FUNCTION_61_5(v34, v36);
      v42 = v109;
      OUTLINED_FUNCTION_61_5(v28, v109);
      v45 = v114;
      v46 = v33;
      v43 = v42;
      goto LABEL_26;
    }
    v45 = v114;
    v46 = v33;
    goto LABEL_20;
  }
  sub_22DFD1E98((uint64_t)v124, (uint64_t)v120, qword_255DD8C10);
  OUTLINED_FUNCTION_9_8((uint64_t)v120);
  v46 = v33;
  if (v44)
  {
    sub_22DFD1E98((uint64_t)v123, (uint64_t)v121, qword_255DD8C10);
    sub_22DFD1D00(v121);
    OUTLINED_FUNCTION_46_5(v115);
    OUTLINED_FUNCTION_46_5(v116);
    sub_22DF580F4(v123);
    v45 = v114;
LABEL_20:
    v43 = v109;
    memcpy(v121, v122, sizeof(v121));
    sub_22DFD208C((uint64_t)v121);
    goto LABEL_21;
  }
  OUTLINED_FUNCTION_71_3((uint64_t)v123, (uint64_t)v117);
  OUTLINED_FUNCTION_178_1(v126, v117);
  OUTLINED_FUNCTION_71_3((uint64_t)v124, (uint64_t)v118);
  OUTLINED_FUNCTION_178_1(v121, v118);
  sub_22DFD1D00(v117);
  sub_22DFC5F6C();
  v48 = v47;
  sub_22DF580F4(v124);
  sub_22DF580F4(v123);
  OUTLINED_FUNCTION_137_2(v115);
  OUTLINED_FUNCTION_137_2(v116);
  OUTLINED_FUNCTION_71_3((uint64_t)v122, (uint64_t)v119);
  sub_22DF580F4(v119);
  OUTLINED_FUNCTION_221_1(v34, v36);
  v43 = v109;
  OUTLINED_FUNCTION_221_1(v28, v109);
  v45 = v114;
  if ((v48 & 1) == 0)
    goto LABEL_22;
LABEL_26:
  sub_22DF95940();
  sub_22DF9597C();
  v49 = sub_22DFDD238();
  OUTLINED_FUNCTION_66_5(v43);
  OUTLINED_FUNCTION_66_5(v36);
  v50 = OUTLINED_FUNCTION_118_4();
  sub_22DFB1CFC(v50, v51, v52);
  OUTLINED_FUNCTION_170_1(v28, v46);
  if ((v49 & 1) != 0)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_255DD80D0);
    sub_22DFDD07C();
    v53 = v122[1];
    v54 = v122[2];
    v55 = v122[3];
    v56 = v122[4];
    v107 = v122[5];
    v111 = v122[0];
    v112 = v122[6];
    v115 = v122[7];
    v109 = v122[9];
    v110 = v122[8];
    v57 = v122[10];
    sub_22DFDD07C();
    v58 = v122[10];
    v116 = v57;
    v108 = v122[7];
    v105 = v122[5];
    v106 = v122[6];
    v103 = v122[3];
    v104 = v122[4];
    v101 = v122[1];
    v102 = v122[2];
    v99 = v122[8];
    v100 = v122[0];
    v98 = v122[9];
    if (v57)
    {
      v96 = v55;
      v97 = v56;
      if (v122[10])
      {
        v125[0] = v111;
        v125[1] = v53;
        v94 = v54;
        v95 = v53;
        v125[2] = v54;
        v125[3] = v55;
        v125[4] = v56;
        v125[5] = v107;
        v125[6] = v112;
        v125[7] = v115;
        v59 = v109;
        v60 = v110;
        v125[8] = v110;
        v125[9] = v109;
        v125[10] = v116;
        sub_22DFDD448();
        OUTLINED_FUNCTION_179_1();
        sub_22DFD1AE0(v61, v62);
        v63 = v116;
        OUTLINED_FUNCTION_125();
        sub_22DFC8914(v125, v122);
        sub_22DFC4BD0(v100, v101, v102, v103, v104, v105, v106, v108, v99, v98, v58);
        v89 = v59;
        v90 = v63;
        v88 = v60;
        v65 = v111;
        v64 = v112;
        v66 = v94;
        v67 = v95;
        v68 = v96;
        v69 = v97;
        v70 = v107;
        v71 = v115;
        sub_22DFC4BD0(v111, v95, v94, v96, v97, v107, v112, v115, v88, v89, v90);
        sub_22DF58090(v113, _s20CarryDeviceMergeableVMa);
        sub_22DF58090(v114, _s20CarryDeviceMergeableVMa);
        sub_22DFC4BD0(v65, v67, v66, v68, v69, v70, v64, v71, v110, v109, v116);
        goto LABEL_24;
      }
      OUTLINED_FUNCTION_24_4();
      OUTLINED_FUNCTION_179_1();
      v75 = v112;
      v93 = 0;
      v81 = v107;
      v73 = v115;
      v80 = v109;
      v79 = v110;
      sub_22DFD1AE0(v82, v83);
      v84 = v116;
      OUTLINED_FUNCTION_33_1();
      sub_22DF58090(v113, _s20CarryDeviceMergeableVMa);
      sub_22DF58090(v114, _s20CarryDeviceMergeableVMa);
      v91 = v84;
      v74 = v111;
      v85 = v55;
      v86 = v97;
      OUTLINED_FUNCTION_203_1(v111, v53, v54, v85, v97, v81, v75, v87, v79, v80, v91);
      v78 = v96;
      v77 = v86;
      v76 = v81;
      v58 = v93;
    }
    else
    {
      OUTLINED_FUNCTION_46_5(v46);
      OUTLINED_FUNCTION_46_5(v114);
      v73 = v115;
      v74 = v111;
      v75 = v112;
      v76 = v107;
      v77 = v56;
      v78 = v55;
      v80 = v109;
      v79 = v110;
      if (!v58)
      {
        OUTLINED_FUNCTION_203_1(v111, v53, v54, v55, v77, v107, v112, v72, v110, v109, 0);
        goto LABEL_24;
      }
    }
    v122[0] = v74;
    v122[1] = v53;
    v122[2] = v54;
    v122[3] = v78;
    v122[4] = v77;
    v122[5] = v76;
    v122[6] = v75;
    v122[7] = v73;
    v122[8] = v79;
    v122[9] = v80;
    v122[10] = v116;
    v122[11] = v100;
    v122[12] = v101;
    v122[13] = v102;
    v122[14] = v103;
    v122[15] = v104;
    v122[16] = v105;
    v122[17] = v106;
    v122[18] = v108;
    v122[19] = v99;
    v122[20] = v98;
    v122[21] = v58;
    sub_22DFD1FD0((uint64_t)v122);
    goto LABEL_24;
  }
LABEL_23:
  OUTLINED_FUNCTION_46_5(v46);
  OUTLINED_FUNCTION_46_5(v45);
LABEL_24:
  OUTLINED_FUNCTION_4_1();
}

uint64_t type metadata accessor for CarrySettings.AppleConnectSettings(uint64_t a1)
{
  return sub_22DF30B80(a1, qword_255DDCA50);
}

uint64_t _s29AppleConnectSettingsMergeableVMa(uint64_t a1)
{
  return sub_22DF30B80(a1, qword_255DDCBA8);
}

void sub_22DFC49F8(void *a1)
{
  bzero(a1, 0x88uLL);
}

uint64_t sub_22DFC4A00(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15)
{
  if (a6)
  {
    sub_22DFC4A90(result, a2);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    sub_22DFC4A90(a9, a10);
    return sub_22DFC4A90(a14, a15);
  }
  return result;
}

uint64_t sub_22DFC4A90(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  if (a2)
  {
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
  return result;
}

void sub_22DFC4AC0(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  void (*v3)(uint64_t, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD);

  v2 = OUTLINED_FUNCTION_212_1(a1);
  v3(v2, v1[1], v1[2], v1[3], v1[4], v1[5], v1[6], v1[7], v1[8], v1[9], v1[10], v1[11], v1[12], v1[13], v1[14], v1[15], v1[16]);
  OUTLINED_FUNCTION_10_0();
}

uint64_t sub_22DFC4B10(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15)
{
  if (a6)
  {
    sub_22DFC4BA0(result, a2);
    sub_22DFDD448();
    sub_22DFDD448();
    sub_22DFC4BA0(a9, a10);
    return sub_22DFC4BA0(a14, a15);
  }
  return result;
}

uint64_t sub_22DFC4BA0(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  if (a2)
  {
    sub_22DFDD448();
    return sub_22DFDD448();
  }
  return result;
}

uint64_t sub_22DFC4BD0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11)
{
  uint64_t result;

  if (a11)
  {
    swift_bridgeObjectRelease();
    sub_22DFC4C78(a3, a4);
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_22DFC4C78(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  if (a2)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
  return result;
}

void sub_22DFC4CC8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (a2 != 1)
  {
    swift_bridgeObjectRelease();
    sub_22DFC4D44(a3, a4);
  }
}

uint64_t sub_22DFC4D44(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  if (a2)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
  return result;
}

void sub_22DFC4D80(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (a2 != 1)
  {
    sub_22DFDD448();
    sub_22DFC4DFC(a3, a4);
  }
}

uint64_t sub_22DFC4DFC(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  if (a2)
  {
    sub_22DFDD448();
    sub_22DFDD448();
    return sub_22DFDD448();
  }
  return result;
}

void sub_22DFC4E38()
{
  sub_22DFB8684((void (*)(_BYTE *))sub_22DFC39A8);
}

void sub_22DFC4E44()
{
  sub_22DFB8684((void (*)(_BYTE *))sub_22DFC39A8);
}

void sub_22DFC4E64(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_22DFB89F4(a1, a2, a3, (void (*)(_BYTE *))sub_22DFC39A8);
}

uint64_t sub_22DFC4E74@<X0>(_QWORD *a1@<X8>)
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

  sub_22DFC3968();
  v2 = *(_QWORD *)algn_255DF2E98;
  v4 = qword_255DF2EA0;
  v3 = unk_255DF2EA8;
  v5 = qword_255DF2EB0;
  v6 = qword_255DF2EB8;
  v7 = qword_255DF2EC0;
  v8 = qword_255DF2EC8;
  v10 = qword_255DF2ED0;
  v9 = unk_255DF2ED8;
  v11 = qword_255DF2EE0;
  v12 = qword_255DF2EE8;
  *a1 = qword_255DF2E90;
  a1[1] = v2;
  a1[2] = v4;
  a1[3] = v3;
  a1[4] = v5;
  a1[5] = v6;
  a1[6] = v7;
  a1[7] = v8;
  a1[8] = v10;
  a1[9] = v9;
  a1[10] = v11;
  a1[11] = v12;
  sub_22DFDD448();
  swift_retain();
  sub_22DFDD448();
  swift_retain();
  sub_22DFDD448();
  swift_retain();
  sub_22DFDD448();
  return swift_retain();
}

uint64_t sub_22DFC4F1C()
{
  sub_22DFCED9C((uint64_t)&qword_255DDB008);
  return sub_22DFDD214();
}

uint64_t sub_22DFC4F5C()
{
  return sub_22DFDD448();
}

uint64_t sub_22DFC4F68(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t result;

  v4 = *(int *)(a2 + 32);
  result = swift_bridgeObjectRelease();
  *(_QWORD *)(v2 + v4) = a1;
  return result;
}

uint64_t (*sub_22DFC4F9C())(_QWORD, _QWORD)
{
  return nullsub_1;
}

uint64_t sub_22DFC4FB4()
{
  sub_22DFCED9C((uint64_t)&unk_255DDCD68);
  return sub_22DFDD34C();
}

uint64_t sub_22DFC4FF4()
{
  sub_22DFCED9C((uint64_t)&qword_255DDB008);
  return sub_22DFDD190();
}

uint64_t sub_22DFC504C()
{
  sub_22DFCED9C((uint64_t)&qword_255DDB008);
  return sub_22DFDD1C0();
}

uint64_t sub_22DFC509C()
{
  sub_22DFCED9C((uint64_t)&qword_255DDB008);
  return sub_22DFDD208();
}

uint64_t sub_22DFC50EC()
{
  sub_22DFCED9C((uint64_t)&qword_255DDB008);
  return sub_22DFDD1CC();
}

uint64_t sub_22DFC5154()
{
  sub_22DFCED9C((uint64_t)&qword_255DDB008);
  return sub_22DFDD1FC();
}

uint64_t sub_22DFC51A4()
{
  sub_22DFCED9C((uint64_t)&qword_255DDB008);
  return sub_22DFDD1D8();
}

uint64_t sub_22DFC51F4()
{
  sub_22DFCED9C((uint64_t)&qword_255DDB008);
  return sub_22DFDD1A8();
}

uint64_t sub_22DFC524C()
{
  sub_22DFCED9C((uint64_t)&qword_255DDB008);
  return sub_22DFDD184();
}

uint64_t sub_22DFC52B4()
{
  sub_22DFCED9C((uint64_t)&qword_255DDB008);
  return sub_22DFDD160();
}

uint64_t sub_22DFC5304()
{
  sub_22DFCED9C((uint64_t)&qword_255DDB008);
  return sub_22DFDD19C();
}

uint64_t sub_22DFC5344()
{
  sub_22DFCED9C((uint64_t)&qword_255DDB008);
  return sub_22DFDD16C();
}

uint64_t sub_22DFC5394()
{
  sub_22DFCED9C((uint64_t)&qword_255DDB008);
  return sub_22DFDD1E4();
}

uint64_t sub_22DFC53E4()
{
  sub_22DFCED9C((uint64_t)&unk_255DDCC80);
  return sub_22DFDD328();
}

uint64_t sub_22DFC5448()
{
  sub_22DFCED9C((uint64_t)&unk_255DDCC80);
  return sub_22DFDD334();
}

uint64_t sub_22DFC54BC()
{
  sub_22DFCED9C((uint64_t)&qword_255DDB008);
  return sub_22DFDD1B4();
}

uint64_t sub_22DFC5520()
{
  sub_22DFCED9C((uint64_t)&qword_255DDB008);
  return sub_22DFDD1F0();
}

uint64_t sub_22DFC557C()
{
  sub_22DFCED9C((uint64_t)&qword_255DDB008);
  return sub_22DFDD178();
}

uint64_t CarrySettings.DeviceDisplayMetaData.groupInfo.getter@<X0>(uint64_t *a1@<X8>)
{
  uint64_t *v1;

  return OUTLINED_FUNCTION_59_7(*v1, v1[1], v1[2], v1[3], a1);
}

void CarrySettings.DeviceDisplayMetaData.model.getter()
{
  OUTLINED_FUNCTION_33_1();
  OUTLINED_FUNCTION_314();
  OUTLINED_FUNCTION_1_2();
}

void CarrySettings.DeviceDisplayMetaData.name.getter()
{
  OUTLINED_FUNCTION_33_1();
  OUTLINED_FUNCTION_314();
  OUTLINED_FUNCTION_1_2();
}

uint64_t CarrySettings.DeviceDisplayMetaData.pairInfo.getter@<X0>(uint64_t *a1@<X8>)
{
  uint64_t *v1;

  return OUTLINED_FUNCTION_59_7(v1[8], v1[9], v1[10], v1[11], a1);
}

uint64_t CarrySettings.DeviceDisplayMetaData.prodFused.getter()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + 96);
}

uint64_t CarrySettings.DeviceDisplayMetaData.roomInfo.getter@<X0>(uint64_t *a1@<X8>)
{
  uint64_t *v1;

  return OUTLINED_FUNCTION_59_7(v1[13], v1[14], v1[15], v1[16], a1);
}

__n128 CarrySettings.DeviceDisplayMetaData.init(name:model:pairInfo:prodFused:groupInfo:roomInfo:)@<Q0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, _OWORD *a5@<X4>, char a6@<W5>, _OWORD *a7@<X6>, uint64_t a8@<X7>, uint64_t a9@<X8>)
{
  __int128 v9;
  __int128 v10;
  __n128 result;
  __int128 v12;

  v9 = a7[1];
  *(_OWORD *)a9 = *a7;
  *(_OWORD *)(a9 + 16) = v9;
  v10 = a5[1];
  *(_OWORD *)(a9 + 64) = *a5;
  *(_OWORD *)(a9 + 80) = v10;
  result = *(__n128 *)a8;
  v12 = *(_OWORD *)(a8 + 16);
  *(_OWORD *)(a9 + 104) = *(_OWORD *)a8;
  *(_QWORD *)(a9 + 32) = a3;
  *(_QWORD *)(a9 + 40) = a4;
  *(_QWORD *)(a9 + 48) = a1;
  *(_QWORD *)(a9 + 56) = a2;
  *(_BYTE *)(a9 + 96) = a6;
  *(_OWORD *)(a9 + 120) = v12;
  return result;
}

uint64_t static CarrySettings.DeviceDisplayMetaData.== infix(_:_:)(uint64_t a1, uint64_t *a2)
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
  BOOL v12;
  uint64_t result;
  char v14;
  BOOL v15;
  char v16;
  char v18;
  char v20;
  char v22;
  char v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  BOOL v31;
  char v32;
  BOOL v33;
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
  int v47;
  int v48;
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

  v2 = *(_QWORD *)a1;
  v3 = *(_QWORD *)(a1 + 8);
  v5 = *(_QWORD *)(a1 + 16);
  v4 = *(_QWORD *)(a1 + 24);
  v61 = *(_QWORD *)(a1 + 40);
  v62 = *(_QWORD *)(a1 + 32);
  v59 = *(_QWORD *)(a1 + 56);
  v60 = *(_QWORD *)(a1 + 48);
  v6 = *a2;
  v7 = a2[1];
  v8 = a2[2];
  v9 = a2[3];
  v10 = a2[4];
  v11 = a2[5];
  v58 = a2[6];
  v57 = a2[7];
  if (!v3)
  {
    v55 = a2[8];
    v56 = *(_QWORD *)(a1 + 64);
    v47 = *((unsigned __int8 *)a2 + 96);
    v48 = *(unsigned __int8 *)(a1 + 96);
    v53 = a2[9];
    v54 = *(_QWORD *)(a1 + 72);
    v49 = a2[10];
    v50 = *(_QWORD *)(a1 + 88);
    v51 = a2[11];
    v52 = *(_QWORD *)(a1 + 80);
    OUTLINED_FUNCTION_181_1();
    if (!v7)
      goto LABEL_15;
LABEL_40:
    v25 = OUTLINED_FUNCTION_218_1();
    sub_22DFC4BA0(v25, v26);
    sub_22DFC4A90(v2, v3);
    v27 = OUTLINED_FUNCTION_218_1();
    goto LABEL_41;
  }
  if (!v7)
  {
    OUTLINED_FUNCTION_75_1();
    OUTLINED_FUNCTION_33_1();
    goto LABEL_40;
  }
  v55 = a2[8];
  v56 = *(_QWORD *)(a1 + 64);
  v47 = *((unsigned __int8 *)a2 + 96);
  v48 = *(unsigned __int8 *)(a1 + 96);
  v53 = a2[9];
  v54 = *(_QWORD *)(a1 + 72);
  v49 = a2[10];
  v50 = *(_QWORD *)(a1 + 88);
  v51 = a2[11];
  v52 = *(_QWORD *)(a1 + 80);
  OUTLINED_FUNCTION_181_1();
  v12 = v2 == v6 && v3 == v7;
  if (v12 || (OUTLINED_FUNCTION_5_7(), result = OUTLINED_FUNCTION_21_2(), (v14 & 1) != 0))
  {
    v15 = v5 == v8 && v4 == v9;
    if (v15 || (OUTLINED_FUNCTION_5_7(), result = OUTLINED_FUNCTION_21_2(), (v16 & 1) != 0))
    {
LABEL_15:
      if (v62 != v10 || v61 != v11)
      {
        OUTLINED_FUNCTION_5_7();
        result = OUTLINED_FUNCTION_21_2();
        if ((v18 & 1) == 0)
          return result;
      }
      if (v60 != v58 || v59 != v57)
      {
        OUTLINED_FUNCTION_5_7();
        result = OUTLINED_FUNCTION_21_2();
        if ((v20 & 1) == 0)
          return result;
      }
      if (v54)
      {
        if (v53)
        {
          if (v56 != v55 || v54 != v53)
          {
            OUTLINED_FUNCTION_5_7();
            result = OUTLINED_FUNCTION_21_2();
            if ((v22 & 1) == 0)
              return result;
          }
          if (v52 != v49 || v50 != v51)
          {
            OUTLINED_FUNCTION_5_7();
            result = OUTLINED_FUNCTION_21_2();
            if ((v24 & 1) == 0 || ((v48 ^ v47) & 1) != 0)
              return result;
LABEL_46:
            if (v45)
            {
              v30 = v46;
              if (v44)
              {
                v31 = v42 == v41 && v45 == v44;
                if (v31 || (v32 = OUTLINED_FUNCTION_5_7(), v30 = v46, (v32 & 1) != 0))
                {
                  v33 = v30 == v39 && v43 == v40;
                  if (v33 || (OUTLINED_FUNCTION_5_7() & 1) != 0)
                    return 1;
                }
                return 0;
              }
              v36 = v45;
              sub_22DFDD448();
              sub_22DFDD448();
            }
            else
            {
              v36 = 0;
              if (!v44)
                return 1;
            }
            v37 = OUTLINED_FUNCTION_304();
            sub_22DFC4BA0(v37, v38);
            sub_22DFC4A90(v42, v36);
            v27 = OUTLINED_FUNCTION_304();
LABEL_41:
            sub_22DFC4A90(v27, v28);
            return 0;
          }
LABEL_45:
          if (v48 != v47)
            return 0;
          goto LABEL_46;
        }
        v29 = v54;
        sub_22DFDD448();
        OUTLINED_FUNCTION_130_0();
      }
      else
      {
        v29 = 0;
        if (!v53)
          goto LABEL_45;
      }
      v34 = OUTLINED_FUNCTION_118_4();
      sub_22DFC4BA0(v34, v35);
      sub_22DFC4A90(v56, v29);
      v27 = OUTLINED_FUNCTION_118_4();
      goto LABEL_41;
    }
  }
  return result;
}

uint64_t sub_22DFC59BC(uint64_t a1)
{
  if ((unint64_t)(a1 + 1) < 7)
    return a1 + 1;
  else
    return 7;
}

void sub_22DFC59D0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  BOOL v4;
  BOOL v5;
  BOOL v6;
  BOOL v7;
  BOOL v8;
  BOOL v9;

  OUTLINED_FUNCTION_107_3();
  if (v2 == v3)
  {
    OUTLINED_FUNCTION_65_6((uint64_t)"additionalFields");
    if (v4)
      goto LABEL_4;
  }
  if ((OUTLINED_FUNCTION_1_26() & 1) != 0
    || (v1 == 0x666E4970756F7267 ? (v4 = v0 == 0xE90000000000006FLL) : (v4 = 0),
        v4
     || (OUTLINED_FUNCTION_1_26() & 1) != 0
     || (v1 == 0x6C65646F6DLL ? (v5 = v0 == 0xE500000000000000) : (v5 = 0),
         v5
      || (OUTLINED_FUNCTION_1_26() & 1) != 0
      || (v1 == 1701667182 ? (v6 = v0 == 0xE400000000000000) : (v6 = 0),
          v6
       || (OUTLINED_FUNCTION_1_26() & 1) != 0
       || (v1 == 0x6F666E4972696170 ? (v7 = v0 == 0xE800000000000000) : (v7 = 0),
           v7
        || (OUTLINED_FUNCTION_1_26() & 1) != 0
        || (v1 == 0x65737546646F7270 ? (v8 = v0 == 0xE900000000000064) : (v8 = 0),
            v8
         || (OUTLINED_FUNCTION_205_1(), (OUTLINED_FUNCTION_1_26() & 1) != 0)
         || (v1 == 0x6F666E496D6F6F72 ? (v9 = v0 == 0xE800000000000000) : (v9 = 0), v9)))))))
  {
LABEL_4:
    swift_bridgeObjectRelease();
  }
  else
  {
    OUTLINED_FUNCTION_1_26();
    OUTLINED_FUNCTION_107();
  }
  OUTLINED_FUNCTION_132_0();
}

void *sub_22DFC5C14()
{
  return &unk_24F9B0048;
}

uint64_t sub_22DFC5C20(unsigned __int8 a1)
{
  return ((uint64_t (*)(unint64_t, unint64_t))((char *)sub_22DFC5C58 + 4 * byte_22DFEA1DA[a1]))(0xD000000000000010, 0x800000022DFF2600);
}

uint64_t sub_22DFC5C58()
{
  return 0x666E4970756F7267;
}

uint64_t sub_22DFC5C7C()
{
  return 0x6C65646F6DLL;
}

uint64_t sub_22DFC5C90()
{
  return 1701667182;
}

uint64_t sub_22DFC5CA0()
{
  return 0x6F666E4972696170;
}

uint64_t sub_22DFC5CB8()
{
  return OUTLINED_FUNCTION_205_1();
}

uint64_t sub_22DFC5CC8()
{
  return 0x6F666E496D6F6F72;
}

uint64_t sub_22DFC5CE0()
{
  unsigned __int8 *v0;

  return sub_22DFA2990(*v0);
}

uint64_t sub_22DFC5CE8@<X0>(uint64_t *a1@<X0>, _BYTE *a2@<X8>)
{
  uint64_t result;

  result = sub_22DFC59BC(*a1);
  *a2 = result;
  return result;
}

uint64_t sub_22DFC5D10()
{
  unsigned __int8 *v0;

  return sub_22DFC5C20(*v0);
}

void sub_22DFC5D18(_BYTE *a1@<X8>)
{
  char v2;

  sub_22DFC59D0();
  *a1 = v2;
}

uint64_t sub_22DFC5D3C@<X0>(uint64_t a1@<X0>, _BYTE *a2@<X8>)
{
  uint64_t result;

  result = sub_22DFC5C10(a1);
  *a2 = result;
  return result;
}

void sub_22DFC5D60(_QWORD *a1@<X8>)
{
  *a1 = &unk_24F9B0048;
}

uint64_t sub_22DFC5D70(uint64_t a1, uint64_t a2)
{
  return sub_22DFCA14C(a1, a2, (void (*)(void))sub_22DFCFA50, (void (*)(void))sub_22DFCFA90);
}

uint64_t sub_22DFC5D84()
{
  sub_22DFCFA90();
  return sub_22DFDE084();
}

uint64_t sub_22DFC5DAC()
{
  sub_22DFCFA90();
  return sub_22DFDE090();
}

uint64_t sub_22DFC5DD4()
{
  _QWORD *v0;
  _QWORD *v1;
  __int128 *v2;
  __int128 *v3;

  OUTLINED_FUNCTION_247_0();
  v1 = v0;
  v3 = v2;
  if (v1[1])
  {
    OUTLINED_FUNCTION_15_2();
    OUTLINED_FUNCTION_57_7();
    OUTLINED_FUNCTION_233();
    OUTLINED_FUNCTION_125();
    OUTLINED_FUNCTION_230();
    OUTLINED_FUNCTION_66_1();
    OUTLINED_FUNCTION_125();
    OUTLINED_FUNCTION_102_3();
    OUTLINED_FUNCTION_105();
    OUTLINED_FUNCTION_230();
    OUTLINED_FUNCTION_147_2();
    OUTLINED_FUNCTION_105();
    OUTLINED_FUNCTION_149();
    OUTLINED_FUNCTION_4_6();
    OUTLINED_FUNCTION_58_9();
  }
  else
  {
    OUTLINED_FUNCTION_32_2();
  }
  OUTLINED_FUNCTION_230();
  OUTLINED_FUNCTION_32_11();
  OUTLINED_FUNCTION_78_1();
  OUTLINED_FUNCTION_230();
  OUTLINED_FUNCTION_32_11();
  OUTLINED_FUNCTION_78_1();
  if (v1[10])
  {
    OUTLINED_FUNCTION_15_2();
    OUTLINED_FUNCTION_57_7();
    OUTLINED_FUNCTION_233();
    OUTLINED_FUNCTION_125();
    OUTLINED_FUNCTION_230();
    OUTLINED_FUNCTION_66_1();
    OUTLINED_FUNCTION_125();
    OUTLINED_FUNCTION_102_3();
    OUTLINED_FUNCTION_105();
    OUTLINED_FUNCTION_230();
    OUTLINED_FUNCTION_147_2();
    OUTLINED_FUNCTION_105();
    OUTLINED_FUNCTION_149();
    OUTLINED_FUNCTION_4_6();
    OUTLINED_FUNCTION_58_9();
  }
  else
  {
    OUTLINED_FUNCTION_32_2();
  }
  OUTLINED_FUNCTION_198_0();
  if (v1[16])
  {
    OUTLINED_FUNCTION_15_2();
    OUTLINED_FUNCTION_57_7();
    OUTLINED_FUNCTION_233();
    OUTLINED_FUNCTION_125();
    OUTLINED_FUNCTION_230();
    OUTLINED_FUNCTION_66_1();
    OUTLINED_FUNCTION_125();
    OUTLINED_FUNCTION_102_3();
    OUTLINED_FUNCTION_105();
    OUTLINED_FUNCTION_230();
    OUTLINED_FUNCTION_147_2();
    OUTLINED_FUNCTION_105();
    OUTLINED_FUNCTION_149();
    OUTLINED_FUNCTION_4_6();
    OUTLINED_FUNCTION_58_9();
  }
  else
  {
    OUTLINED_FUNCTION_32_2();
  }
  OUTLINED_FUNCTION_130_0();
  OUTLINED_FUNCTION_227_1(v3);
  return swift_bridgeObjectRelease();
}

void sub_22DFC5F6C()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  BOOL v12;
  BOOL v13;
  char v14;
  char v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char v21;
  char v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  BOOL v28;
  BOOL v29;
  char v30;
  char v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  BOOL v36;
  BOOL v37;
  char v38;
  char v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t *v42;
  uint64_t *v43;

  OUTLINED_FUNCTION_159_1();
  v1 = v0;
  v3 = v2;
  v5 = *v2;
  v4 = v2[1];
  v7 = v2[2];
  v6 = v2[3];
  v8 = *v0;
  v9 = v0[1];
  v11 = v0[2];
  v10 = v0[3];
  if (v4)
  {
    if (!v9)
      goto LABEL_16;
    v42 = v0;
    v12 = v5 == v8 && v4 == v9;
    if (!v12 && (OUTLINED_FUNCTION_5_7() & 1) == 0)
      goto LABEL_57;
    v13 = v7 == v11 && v6 == v10;
    if (!v13 && (OUTLINED_FUNCTION_2_29() & 1) == 0)
      goto LABEL_57;
    OUTLINED_FUNCTION_6_25();
    OUTLINED_FUNCTION_6_25();
    OUTLINED_FUNCTION_41_6();
    OUTLINED_FUNCTION_141_1();
    v15 = v14;
    OUTLINED_FUNCTION_149();
    OUTLINED_FUNCTION_78_1();
    OUTLINED_FUNCTION_103();
    OUTLINED_FUNCTION_61_0();
    OUTLINED_FUNCTION_107();
    OUTLINED_FUNCTION_132();
    OUTLINED_FUNCTION_29_15();
    v1 = v42;
    if ((v15 & 1) == 0)
      goto LABEL_59;
  }
  else if (v9)
  {
    goto LABEL_16;
  }
  if (v3[5] != v1[5] || v3[6] != v1[6])
  {
    v21 = OUTLINED_FUNCTION_237_1();
    v1 = (uint64_t *)v10;
    if ((v21 & 1) == 0)
      goto LABEL_59;
  }
  if (v3[7] != v1[7] || v3[8] != v1[8])
  {
    v23 = OUTLINED_FUNCTION_237_1();
    v1 = (uint64_t *)v10;
    if ((v23 & 1) == 0)
      goto LABEL_59;
  }
  v5 = v3[9];
  v4 = v3[10];
  v25 = v3[11];
  v24 = v3[12];
  v8 = v1[9];
  v9 = v1[10];
  v27 = v1[11];
  v26 = v1[12];
  if (v4)
  {
    if (!v9)
      goto LABEL_16;
    v43 = v1;
    v28 = v5 == v8 && v4 == v9;
    if (v28 || (OUTLINED_FUNCTION_5_7() & 1) != 0)
    {
      v29 = v25 == v27 && v24 == v26;
      if (v29 || (OUTLINED_FUNCTION_2_29() & 1) != 0)
      {
        OUTLINED_FUNCTION_6_25();
        OUTLINED_FUNCTION_6_25();
        OUTLINED_FUNCTION_41_6();
        OUTLINED_FUNCTION_141_1();
        v31 = v30;
        OUTLINED_FUNCTION_149();
        OUTLINED_FUNCTION_78_1();
        OUTLINED_FUNCTION_103();
        OUTLINED_FUNCTION_61_0();
        OUTLINED_FUNCTION_107();
        OUTLINED_FUNCTION_132();
        OUTLINED_FUNCTION_29_15();
        v1 = v43;
        if ((v31 & 1) == 0)
          goto LABEL_59;
        goto LABEL_42;
      }
    }
LABEL_57:
    OUTLINED_FUNCTION_6_25();
    OUTLINED_FUNCTION_6_25();
    sub_22DF580B8(v8, v9);
    OUTLINED_FUNCTION_132();
    OUTLINED_FUNCTION_149();
    OUTLINED_FUNCTION_78_1();
    OUTLINED_FUNCTION_103();
    OUTLINED_FUNCTION_46();
    OUTLINED_FUNCTION_107();
    v18 = v5;
    v19 = v4;
    goto LABEL_58;
  }
  if (v9)
    goto LABEL_16;
LABEL_42:
  if (((*((unsigned __int8 *)v3 + 112) ^ *((unsigned __int8 *)v1 + 112)) & 1) != 0)
    goto LABEL_59;
  v5 = v3[15];
  v4 = v3[16];
  v33 = v3[17];
  v32 = v3[18];
  v8 = v1[15];
  v9 = v1[16];
  v35 = v1[17];
  v34 = v1[18];
  if (v4)
  {
    if (v9)
    {
      v36 = v5 == v8 && v4 == v9;
      if (v36 || (OUTLINED_FUNCTION_5_7() & 1) != 0)
      {
        v37 = v33 == v35 && v32 == v34;
        if (v37 || (OUTLINED_FUNCTION_2_29() & 1) != 0)
        {
          OUTLINED_FUNCTION_6_25();
          OUTLINED_FUNCTION_6_25();
          OUTLINED_FUNCTION_41_6();
          OUTLINED_FUNCTION_141_1();
          v39 = v38;
          OUTLINED_FUNCTION_149();
          OUTLINED_FUNCTION_78_1();
          OUTLINED_FUNCTION_103();
          OUTLINED_FUNCTION_61_0();
          OUTLINED_FUNCTION_107();
          OUTLINED_FUNCTION_132();
          OUTLINED_FUNCTION_29_15();
          if ((v39 & 1) != 0)
            goto LABEL_61;
LABEL_59:
          OUTLINED_FUNCTION_91_4();
          return;
        }
      }
      goto LABEL_57;
    }
LABEL_16:
    sub_22DF580B8(v5, v4);
    v16 = OUTLINED_FUNCTION_191_1();
    sub_22DF580B8(v16, v17);
    OUTLINED_FUNCTION_29_15();
    v18 = OUTLINED_FUNCTION_191_1();
LABEL_58:
    sub_22DF58210(v18, v19);
    goto LABEL_59;
  }
  if (v9)
    goto LABEL_16;
LABEL_61:
  OUTLINED_FUNCTION_91_4();
  sub_22DFCA514(v40, v41);
}

void sub_22DFC627C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  _QWORD v3[5];
  char v4;
  _BYTE v5[40];
  _BYTE v6[40];
  _BYTE v7[40];

  __swift_instantiateConcreteTypeFromMangledName(&qword_255DDCFB8);
  OUTLINED_FUNCTION_14_18();
  MEMORY[0x24BDAC7A8](v2);
  OUTLINED_FUNCTION_9_19();
  sub_22DFCFA90();
  OUTLINED_FUNCTION_21_12();
  v3[0] = *(_QWORD *)(v0 + 160);
  v4 = 0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_255DDCF70);
  OUTLINED_FUNCTION_152_2();
  sub_22DFDDEEC();
  if (!v1)
  {
    OUTLINED_FUNCTION_71_3(v0, (uint64_t)v7);
    OUTLINED_FUNCTION_71_3((uint64_t)v7, (uint64_t)v3);
    v4 = 1;
    sub_22DFCF6A0();
    OUTLINED_FUNCTION_42_4();
    OUTLINED_FUNCTION_119_3(2);
    OUTLINED_FUNCTION_119_3(3);
    OUTLINED_FUNCTION_71_3(v0 + 72, (uint64_t)v6);
    OUTLINED_FUNCTION_71_3((uint64_t)v6, (uint64_t)v3);
    v4 = 4;
    OUTLINED_FUNCTION_42_4();
    LOBYTE(v3[0]) = 5;
    sub_22DFDDED4();
    OUTLINED_FUNCTION_71_3(v0 + 120, (uint64_t)v5);
    OUTLINED_FUNCTION_71_3((uint64_t)v5, (uint64_t)v3);
    v4 = 6;
    OUTLINED_FUNCTION_42_4();
  }
  OUTLINED_FUNCTION_40_8();
  OUTLINED_FUNCTION_3_25();
}

void sub_22DFC6450()
{
  OUTLINED_FUNCTION_26_0();
  sub_22DFC5DD4();
  OUTLINED_FUNCTION_24_1();
  OUTLINED_FUNCTION_10_0();
}

void sub_22DFC6478()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  void *v3;
  void *v4;
  uint64_t v5;
  _QWORD *v6;
  uint64_t v7;
  unsigned int v8;
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
  char v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
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
  uint64_t v42[21];
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
  char v57;
  _BYTE v58[7];
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  char v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  _DWORD v71[3];
  uint64_t v72;

  OUTLINED_FUNCTION_8_5();
  v2 = v1;
  v4 = v3;
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_255DDCFB0);
  MEMORY[0x24BDAC7A8](v5);
  OUTLINED_FUNCTION_248();
  v35 = v2;
  v6 = (_QWORD *)OUTLINED_FUNCTION_183_1();
  v8 = __swift_project_boxed_opaque_existential_1(v6, v7);
  sub_22DFCFA90();
  sub_22DFDE060();
  if (v0)
  {
    OUTLINED_FUNCTION_60_5();
    __swift_destroy_boxed_opaque_existential_0Tm(v35);
    v9 = OUTLINED_FUNCTION_304();
    OUTLINED_FUNCTION_89_4(v9, v10);
    if (v8)
      OUTLINED_FUNCTION_223_0();
    if ((_DWORD)v5)
      OUTLINED_FUNCTION_14_4();
    sub_22DF58210(v36, v40);
    OUTLINED_FUNCTION_120_4();
    OUTLINED_FUNCTION_95_4();
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_255DDCF70);
    sub_22DFD1BBC();
    OUTLINED_FUNCTION_165_1();
    sub_22DFCF660();
    v72 = v43;
    OUTLINED_FUNCTION_33_1();
    sub_22DFDDE44();
    v30 = v4;
    v11 = v43;
    v12 = v45;
    v31 = v47;
    v32 = v46;
    sub_22DF580B8(v43, v44);
    OUTLINED_FUNCTION_215_1();
    v28 = sub_22DFDDE50();
    v29 = v44;
    LOBYTE(v43) = 3;
    v14 = v13;
    sub_22DFDD448();
    v34 = v14;
    v27 = sub_22DFDDE50();
    LOBYTE(v42[0]) = 4;
    v16 = v15;
    sub_22DFDD448();
    OUTLINED_FUNCTION_145_2();
    v33 = v16;
    v17 = v43;
    LOBYTE(v43) = 5;
    v18 = v17;
    v39 = v45;
    v41 = v44;
    v26 = v47;
    sub_22DF580B8(v17, v44);
    OUTLINED_FUNCTION_215_1();
    v37 = v18;
    v38 = v46;
    LOBYTE(v14) = sub_22DFDDE5C();
    v65 = 6;
    OUTLINED_FUNCTION_145_2();
    v25 = v14 & 1;
    OUTLINED_FUNCTION_13_21();
    v19 = v66;
    v20 = v67;
    v23 = v68;
    v24 = v69;
    v21 = v70;
    v22 = v69;
    sub_22DF580B8(v66, v67);
    OUTLINED_FUNCTION_120_4();
    v42[0] = v11;
    v42[1] = v29;
    v42[2] = v12;
    v42[3] = v32;
    v42[4] = v31;
    v42[5] = v28;
    v42[6] = v34;
    v42[7] = v27;
    v42[8] = v33;
    v42[9] = v37;
    v42[10] = v41;
    v42[11] = v39;
    v42[12] = v38;
    v42[13] = v26;
    LOBYTE(v42[14]) = v25;
    v42[15] = v19;
    v42[16] = v20;
    v42[17] = v23;
    v42[18] = v22;
    v42[19] = v21;
    v42[20] = v72;
    sub_22DFD1D00(v42);
    OUTLINED_FUNCTION_103();
    sub_22DF58210(v19, v20);
    sub_22DF58210(v37, v41);
    swift_bridgeObjectRelease();
    OUTLINED_FUNCTION_14_4();
    sub_22DF58210(v11, v29);
    __swift_destroy_boxed_opaque_existential_0Tm(v35);
    v43 = v11;
    v44 = v29;
    v45 = v12;
    v46 = v32;
    v47 = v31;
    v48 = v28;
    v49 = v34;
    v50 = v27;
    v51 = v33;
    v52 = v37;
    v53 = v41;
    v54 = v39;
    v55 = v38;
    v56 = v26;
    v57 = v25;
    *(_DWORD *)v58 = v71[0];
    *(_DWORD *)&v58[3] = *(_DWORD *)((char *)v71 + 3);
    v59 = v19;
    v60 = v20;
    v61 = v23;
    v62 = v24;
    v63 = v21;
    v64 = v72;
    sub_22DFD1DCC(&v43);
    memcpy(v30, v42, 0xA8uLL);
  }
  OUTLINED_FUNCTION_1_4();
}

uint64_t sub_22DFC69F0()
{
  sub_22DFDE000();
  sub_22DFC5DD4();
  return sub_22DFDE030();
}

uint64_t sub_22DFC6A28()
{
  return sub_22DFDD448();
}

uint64_t sub_22DFC6A30(uint64_t a1)
{
  uint64_t v1;
  uint64_t result;

  result = swift_bridgeObjectRelease();
  *(_QWORD *)(v1 + 160) = a1;
  return result;
}

uint64_t (*sub_22DFC6A58())(_QWORD, _QWORD)
{
  return nullsub_1;
}

uint64_t sub_22DFC6A68()
{
  sub_22DFCFB7C();
  return sub_22DFDD2A4();
}

uint64_t sub_22DFC6AB4()
{
  sub_22DFCFB7C();
  return sub_22DFDD2B0();
}

uint64_t sub_22DFC6AF8()
{
  sub_22DFCFB7C();
  return sub_22DFDD298();
}

void sub_22DFC6B34(void *a1@<X8>)
{
  uint64_t v1;
  _BYTE __src[168];

  sub_22DFC6478();
  if (!v1)
    memcpy(a1, __src, 0xA8uLL);
}

void sub_22DFC6B7C()
{
  const void *v0;
  _BYTE __dst[168];

  memcpy(__dst, v0, sizeof(__dst));
  sub_22DFC627C();
}

uint64_t sub_22DFC6BCC()
{
  sub_22DFD1EC4();
  return sub_22DFDD310();
}

uint64_t sub_22DFC6C0C()
{
  sub_22DF95904();
  sub_22DFCFBBC();
  return sub_22DFDD358();
}

uint64_t sub_22DFC6C68()
{
  sub_22DFD1EC4();
  return sub_22DFDD304();
}

void CarrySettings.DeviceGroup.name.getter()
{
  OUTLINED_FUNCTION_33_1();
  OUTLINED_FUNCTION_314();
  OUTLINED_FUNCTION_1_2();
}

void CarrySettings.DeviceGroup.id.getter()
{
  OUTLINED_FUNCTION_33_1();
  OUTLINED_FUNCTION_314();
  OUTLINED_FUNCTION_1_2();
}

uint64_t CarrySettings.DeviceGroup.init(name:id:)@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, _QWORD *a5@<X8>)
{
  *a5 = result;
  a5[1] = a2;
  a5[2] = a3;
  a5[3] = a4;
  return result;
}

void static CarrySettings.DeviceGroup.== infix(_:_:)(_QWORD *a1, _QWORD *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  BOOL v6;
  char v7;
  BOOL v8;

  v2 = a1[2];
  v3 = a1[3];
  v4 = a2[2];
  v5 = a2[3];
  v6 = *a1 == *a2 && a1[1] == a2[1];
  if ((v6 || (OUTLINED_FUNCTION_5_7(), OUTLINED_FUNCTION_21_2(), (v7 & 1) != 0))
    && (v2 == v4 ? (v8 = v3 == v5) : (v8 = 0), !v8))
  {
    OUTLINED_FUNCTION_314();
    sub_22DFDDF58();
  }
  else
  {
    OUTLINED_FUNCTION_132_0();
  }
}

uint64_t sub_22DFC6D6C(uint64_t a1)
{
  if ((unint64_t)(a1 + 1) < 3)
    return a1 + 1;
  else
    return 3;
}

void sub_22DFC6D80()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  BOOL v4;
  BOOL v5;

  OUTLINED_FUNCTION_107_3();
  if (v2 == v3 && (OUTLINED_FUNCTION_65_6((uint64_t)"additionalFields"), v4)
    || (OUTLINED_FUNCTION_1_26() & 1) != 0
    || (v1 == 1701667182 ? (v4 = v0 == 0xE400000000000000) : (v4 = 0),
        v4 || (OUTLINED_FUNCTION_1_26() & 1) != 0 || (v1 == 25705 ? (v5 = v0 == 0xE200000000000000) : (v5 = 0), v5)))
  {
    swift_bridgeObjectRelease();
  }
  else
  {
    OUTLINED_FUNCTION_1_26();
    OUTLINED_FUNCTION_107();
  }
  OUTLINED_FUNCTION_1_2();
}

void *sub_22DFC6E60()
{
  return &unk_24F9B0070;
}

uint64_t sub_22DFC6E6C(char a1)
{
  if (!a1)
    return 0xD000000000000010;
  if (a1 == 1)
    return 1701667182;
  return 25705;
}

uint64_t sub_22DFC6EB4()
{
  OUTLINED_FUNCTION_230();
  OUTLINED_FUNCTION_32_11();
  OUTLINED_FUNCTION_78_1();
  OUTLINED_FUNCTION_230();
  OUTLINED_FUNCTION_32_11();
  OUTLINED_FUNCTION_78_1();
  OUTLINED_FUNCTION_33_1();
  OUTLINED_FUNCTION_133_2();
  return OUTLINED_FUNCTION_24_15();
}

void sub_22DFC6F08(uint64_t a1)
{
  _QWORD *v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  BOOL v5;
  BOOL v6;

  OUTLINED_FUNCTION_128_1(a1);
  v5 = v5 && v3 == v4;
  if ((v5 || (OUTLINED_FUNCTION_5_7() & 1) != 0)
    && (v2[2] == v1[2] ? (v6 = v2[3] == v1[3]) : (v6 = 0), v6 || (OUTLINED_FUNCTION_5_7() & 1) != 0))
  {
    OUTLINED_FUNCTION_132_3(v2[4], v1[4]);
  }
  else
  {
    OUTLINED_FUNCTION_1_2();
  }
}

void sub_22DFC6F60()
{
  uint64_t v0;
  uint64_t v1;

  OUTLINED_FUNCTION_109_5();
  __swift_instantiateConcreteTypeFromMangledName(&qword_255DDCFD8);
  OUTLINED_FUNCTION_14_18();
  MEMORY[0x24BDAC7A8](v1);
  OUTLINED_FUNCTION_9_19();
  sub_22DFCF7A0();
  OUTLINED_FUNCTION_21_12();
  __swift_instantiateConcreteTypeFromMangledName(&qword_255DDCF70);
  OUTLINED_FUNCTION_152_2();
  OUTLINED_FUNCTION_34_9();
  if (!v0)
  {
    OUTLINED_FUNCTION_25_15();
    OUTLINED_FUNCTION_25_15();
  }
  OUTLINED_FUNCTION_40_8();
  OUTLINED_FUNCTION_214_1();
  OUTLINED_FUNCTION_3_25();
}

uint64_t sub_22DFC7038()
{
  __int128 v1[4];

  OUTLINED_FUNCTION_26_0();
  OUTLINED_FUNCTION_233();
  OUTLINED_FUNCTION_66_1();
  OUTLINED_FUNCTION_149();
  OUTLINED_FUNCTION_233();
  OUTLINED_FUNCTION_66_1();
  OUTLINED_FUNCTION_149();
  OUTLINED_FUNCTION_130_0();
  OUTLINED_FUNCTION_227_1(v1);
  OUTLINED_FUNCTION_107();
  return OUTLINED_FUNCTION_24_1();
}

void sub_22DFC70AC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  uint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  _QWORD *v13;
  _QWORD *v14;
  _QWORD *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void (*v24)(uint64_t, uint64_t);
  uint64_t v25;
  uint64_t v26;

  OUTLINED_FUNCTION_8_5();
  v13 = v12;
  v15 = v14;
  v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_255DDCFD0);
  v17 = *(_QWORD *)(v16 - 8);
  MEMORY[0x24BDAC7A8](v16);
  OUTLINED_FUNCTION_248();
  __swift_project_boxed_opaque_existential_1(v13, v13[3]);
  sub_22DFCF7A0();
  sub_22DFDE060();
  if (v10)
  {
    OUTLINED_FUNCTION_42_0();
    OUTLINED_FUNCTION_61_0();
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_255DDCF70);
    OUTLINED_FUNCTION_153_2();
    OUTLINED_FUNCTION_122_2();
    OUTLINED_FUNCTION_165_1();
    OUTLINED_FUNCTION_96_0();
    v18 = OUTLINED_FUNCTION_180_0();
    v20 = v19;
    OUTLINED_FUNCTION_146_2(v18);
    v21 = OUTLINED_FUNCTION_180_0();
    v23 = v22;
    v24 = *(void (**)(uint64_t, uint64_t))(v17 + 8);
    v25 = v21;
    v24(v11, v16);
    OUTLINED_FUNCTION_33_1();
    __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)v13);
    OUTLINED_FUNCTION_288();
    OUTLINED_FUNCTION_46();
    OUTLINED_FUNCTION_61_0();
    *v15 = v26;
    v15[1] = v20;
    v15[2] = v25;
    v15[3] = v23;
    v15[4] = a10;
  }
  OUTLINED_FUNCTION_1_4();
}

uint64_t sub_22DFC7230@<X0>(uint64_t *a1@<X0>, _BYTE *a2@<X8>)
{
  uint64_t result;

  result = sub_22DFC6D6C(*a1);
  *a2 = result;
  return result;
}

uint64_t sub_22DFC7258()
{
  char *v0;

  return sub_22DFC6E6C(*v0);
}

void sub_22DFC7260(_BYTE *a1@<X8>)
{
  char v2;

  sub_22DFC6D80();
  *a1 = v2;
}

uint64_t sub_22DFC7284@<X0>(uint64_t a1@<X0>, _BYTE *a2@<X8>)
{
  uint64_t result;

  result = sub_22DFC6D6C(a1);
  *a2 = result;
  return result;
}

void sub_22DFC72A8(_QWORD *a1@<X8>)
{
  *a1 = &unk_24F9B0070;
}

uint64_t sub_22DFC72B8(uint64_t a1, uint64_t a2)
{
  return sub_22DFCA14C(a1, a2, (void (*)(void))sub_22DFCF760, (void (*)(void))sub_22DFCF7A0);
}

uint64_t sub_22DFC72CC()
{
  sub_22DFCF7A0();
  return sub_22DFDE084();
}

uint64_t sub_22DFC72F4()
{
  sub_22DFCF7A0();
  return sub_22DFDE090();
}

uint64_t sub_22DFC7324()
{
  uint64_t v0;
  uint64_t v1;
  __int128 v3[4];

  v1 = *(_QWORD *)(v0 + 32);
  sub_22DFDE000();
  sub_22DFDD448();
  sub_22DFDD544();
  swift_bridgeObjectRelease();
  sub_22DFDD448();
  sub_22DFDD544();
  swift_bridgeObjectRelease();
  sub_22DFDD448();
  sub_22DFD1758(v3, v1);
  swift_bridgeObjectRelease();
  return sub_22DFDE030();
}

uint64_t sub_22DFC73CC()
{
  return sub_22DFDD448();
}

uint64_t sub_22DFC73D4(uint64_t a1)
{
  uint64_t v1;
  uint64_t result;

  result = swift_bridgeObjectRelease();
  *(_QWORD *)(v1 + 32) = a1;
  return result;
}

uint64_t (*sub_22DFC73FC())(_QWORD, _QWORD)
{
  return nullsub_1;
}

uint64_t sub_22DFC740C()
{
  sub_22DFCF88C();
  return sub_22DFDD2A4();
}

uint64_t sub_22DFC7458()
{
  sub_22DFCF88C();
  return sub_22DFDD2B0();
}

uint64_t sub_22DFC749C()
{
  sub_22DFCF88C();
  return sub_22DFDD298();
}

double sub_22DFC74D8@<D0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, uint64_t a9@<X8>)
{
  uint64_t v9;
  double result;
  uint64_t v12;
  __int128 v13;
  __int128 v14;
  uint64_t v15;

  sub_22DFC70AC(a1, a2, a3, a4, a5, a6, a7, a8, v12, v13);
  if (!v9)
  {
    result = *(double *)&v13;
    *(_OWORD *)a9 = v13;
    *(_OWORD *)(a9 + 16) = v14;
    *(_QWORD *)(a9 + 32) = v15;
  }
  return result;
}

void sub_22DFC751C()
{
  sub_22DFC6F60();
}

uint64_t sub_22DFC7530()
{
  sub_22DFD1F00();
  return sub_22DFDD310();
}

uint64_t sub_22DFC7570()
{
  sub_22DFCF620();
  sub_22DFCF8CC();
  return sub_22DFDD358();
}

uint64_t sub_22DFC75CC()
{
  sub_22DFD1F00();
  return sub_22DFDD304();
}

void CarrySettings.ProfileInfo.displayName.getter()
{
  OUTLINED_FUNCTION_33_1();
  OUTLINED_FUNCTION_314();
  OUTLINED_FUNCTION_1_2();
}

void CarrySettings.ProfileInfo.identifier.getter()
{
  OUTLINED_FUNCTION_33_1();
  OUTLINED_FUNCTION_314();
  OUTLINED_FUNCTION_1_2();
}

uint64_t CarrySettings.ProfileInfo.signed.getter()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + 32);
}

uint64_t CarrySettings.ProfileInfo.trusted.getter()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + 33);
}

void CarrySettings.ProfileInfo.uuid.getter()
{
  OUTLINED_FUNCTION_33_1();
  OUTLINED_FUNCTION_314();
  OUTLINED_FUNCTION_1_2();
}

uint64_t CarrySettings.ProfileInfo.init(id:name:trusted:signed:uuid:)@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, char a5@<W4>, char a6@<W5>, uint64_t a7@<X6>, uint64_t a8@<X7>, uint64_t a9@<X8>)
{
  *(_QWORD *)a9 = a3;
  *(_QWORD *)(a9 + 8) = a4;
  *(_QWORD *)(a9 + 16) = result;
  *(_QWORD *)(a9 + 24) = a2;
  *(_BYTE *)(a9 + 32) = a6;
  *(_BYTE *)(a9 + 33) = a5;
  *(_QWORD *)(a9 + 40) = a7;
  *(_QWORD *)(a9 + 48) = a8;
  return result;
}

uint64_t CarrySettings.ProfileInfo.hash(into:)()
{
  OUTLINED_FUNCTION_21();
  OUTLINED_FUNCTION_230();
  OUTLINED_FUNCTION_32_11();
  OUTLINED_FUNCTION_78_1();
  OUTLINED_FUNCTION_58_1();
  OUTLINED_FUNCTION_103_0();
  sub_22DFDD544();
  OUTLINED_FUNCTION_103();
  OUTLINED_FUNCTION_77_5();
  sub_22DFDE018();
  OUTLINED_FUNCTION_24_4();
  sub_22DFDD544();
  return swift_bridgeObjectRelease();
}

void static CarrySettings.ProfileInfo.== infix(_:_:)()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  int v4;
  int v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  int v9;
  BOOL v10;
  uint64_t v11;
  uint64_t v12;
  char v13;
  char v15;
  uint64_t v17;
  uint64_t v18;

  OUTLINED_FUNCTION_159_1();
  v2 = *(_QWORD *)(v0 + 16);
  v3 = *(_QWORD *)(v0 + 24);
  v4 = *(unsigned __int8 *)(v0 + 32);
  v5 = *(unsigned __int8 *)(v0 + 33);
  v17 = *(_QWORD *)(v0 + 48);
  v18 = *(_QWORD *)(v0 + 40);
  v6 = *(_QWORD *)(v1 + 16);
  v7 = *(_QWORD *)(v1 + 24);
  v8 = *(unsigned __int8 *)(v1 + 32);
  v9 = *(unsigned __int8 *)(v1 + 33);
  v10 = *(_QWORD *)v0 == *(_QWORD *)v1 && *(_QWORD *)(v0 + 8) == *(_QWORD *)(v1 + 8);
  v12 = *(_QWORD *)(v1 + 40);
  v11 = *(_QWORD *)(v1 + 48);
  if (!v10)
  {
    OUTLINED_FUNCTION_5_7();
    OUTLINED_FUNCTION_21_2();
    if ((v13 & 1) == 0)
      goto LABEL_20;
  }
  if (v2 == v6 && v3 == v7)
  {
    if (v4 != v8)
      goto LABEL_20;
  }
  else
  {
    OUTLINED_FUNCTION_179_1();
    OUTLINED_FUNCTION_5_7();
    OUTLINED_FUNCTION_21_2();
    if ((v15 & 1) == 0 || ((v4 ^ v8) & 1) != 0)
      goto LABEL_20;
  }
  if (((v5 ^ v9) & 1) == 0 && (v18 != v12 || v17 != v11))
  {
    OUTLINED_FUNCTION_91_4();
    sub_22DFDDF58();
    return;
  }
LABEL_20:
  OUTLINED_FUNCTION_91_4();
}

void CarrySettings.ProfileInfo.hashValue.getter()
{
  OUTLINED_FUNCTION_160_1();
  OUTLINED_FUNCTION_26_0();
  OUTLINED_FUNCTION_233();
  OUTLINED_FUNCTION_66_1();
  OUTLINED_FUNCTION_149();
  OUTLINED_FUNCTION_125();
  sub_22DFDD544();
  OUTLINED_FUNCTION_105();
  sub_22DFDE018();
  sub_22DFDE018();
  OUTLINED_FUNCTION_99_3();
  sub_22DFDD544();
  OUTLINED_FUNCTION_61_0();
  OUTLINED_FUNCTION_24_1();
  OUTLINED_FUNCTION_167_2();
}

uint64_t sub_22DFC78AC()
{
  sub_22DFDE000();
  sub_22DFDD448();
  sub_22DFDD544();
  swift_bridgeObjectRelease();
  sub_22DFDD448();
  sub_22DFDD544();
  swift_bridgeObjectRelease();
  sub_22DFDE018();
  sub_22DFDE018();
  sub_22DFDD448();
  sub_22DFDD544();
  swift_bridgeObjectRelease();
  return sub_22DFDE030();
}

uint64_t sub_22DFC798C(uint64_t a1)
{
  if ((unint64_t)(a1 + 1) < 6)
    return a1 + 1;
  else
    return 6;
}

void sub_22DFC79A0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  BOOL v4;
  BOOL v5;
  BOOL v6;
  BOOL v7;
  BOOL v8;

  OUTLINED_FUNCTION_107_3();
  if (v2 == v3 && (OUTLINED_FUNCTION_65_6((uint64_t)"additionalFields"), v4)
    || (OUTLINED_FUNCTION_1_26() & 1) != 0
    || (v1 == 0x4E79616C70736964 ? (v4 = v0 == 0xEB00000000656D61) : (v4 = 0),
        v4
     || (OUTLINED_FUNCTION_1_26() & 1) != 0
     || (v1 == 0x696669746E656469 ? (v5 = v0 == 0xEA00000000007265) : (v5 = 0),
         v5
      || (OUTLINED_FUNCTION_1_26() & 1) != 0
      || (v1 == 0x64656E676973 ? (v6 = v0 == 0xE600000000000000) : (v6 = 0),
          v6
       || (OUTLINED_FUNCTION_1_26() & 1) != 0
       || (v1 == 0x64657473757274 ? (v7 = v0 == 0xE700000000000000) : (v7 = 0),
           v7
        || (OUTLINED_FUNCTION_1_26() & 1) != 0
        || (v1 == 1684632949 ? (v8 = v0 == 0xE400000000000000) : (v8 = 0), v8))))))
  {
    swift_bridgeObjectRelease();
  }
  else
  {
    OUTLINED_FUNCTION_1_26();
    OUTLINED_FUNCTION_107();
  }
  OUTLINED_FUNCTION_1_2();
}

void *sub_22DFC7BB4()
{
  return &unk_24F9B0098;
}

uint64_t sub_22DFC7BC0(unsigned __int8 a1)
{
  return ((uint64_t (*)(unint64_t, unint64_t))((char *)sub_22DFC7BF8 + 4 * byte_22DFEA1E1[a1]))(0xD000000000000010, 0x800000022DFF2600);
}

uint64_t sub_22DFC7BF8()
{
  return 0x4E79616C70736964;
}

uint64_t sub_22DFC7C18()
{
  return 0x696669746E656469;
}

uint64_t sub_22DFC7C34()
{
  return 0x64656E676973;
}

uint64_t sub_22DFC7C48()
{
  return 0x64657473757274;
}

uint64_t sub_22DFC7C60()
{
  return 1684632949;
}

uint64_t sub_22DFC7C70(__int128 *a1)
{
  OUTLINED_FUNCTION_230();
  OUTLINED_FUNCTION_32_11();
  OUTLINED_FUNCTION_78_1();
  OUTLINED_FUNCTION_230();
  OUTLINED_FUNCTION_32_11();
  OUTLINED_FUNCTION_78_1();
  OUTLINED_FUNCTION_198_0();
  OUTLINED_FUNCTION_198_0();
  OUTLINED_FUNCTION_230();
  OUTLINED_FUNCTION_32_11();
  OUTLINED_FUNCTION_78_1();
  OUTLINED_FUNCTION_130_0();
  OUTLINED_FUNCTION_227_1(a1);
  return OUTLINED_FUNCTION_24_15();
}

void sub_22DFC7CF0(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  BOOL v5;
  BOOL v6;
  BOOL v7;

  OUTLINED_FUNCTION_128_1(a1);
  v5 = v5 && v3 == v4;
  if ((v5 || (OUTLINED_FUNCTION_5_7() & 1) != 0)
    && (*(_QWORD *)(v2 + 16) == *(_QWORD *)(v1 + 16) ? (v6 = *(_QWORD *)(v2 + 24) == *(_QWORD *)(v1 + 24)) : (v6 = 0),
        (v6 || (OUTLINED_FUNCTION_5_7() & 1) != 0)
     && ((*(unsigned __int8 *)(v2 + 32) ^ *(unsigned __int8 *)(v1 + 32)) & 1) == 0
     && ((*(unsigned __int8 *)(v2 + 33) ^ *(unsigned __int8 *)(v1 + 33)) & 1) == 0
     && (*(_QWORD *)(v2 + 40) == *(_QWORD *)(v1 + 40) ? (v7 = *(_QWORD *)(v2 + 48) == *(_QWORD *)(v1 + 48)) : (v7 = 0),
         v7 || (OUTLINED_FUNCTION_5_7() & 1) != 0)))
  {
    OUTLINED_FUNCTION_132_3(*(_QWORD *)(v2 + 56), *(_QWORD *)(v1 + 56));
  }
  else
  {
    OUTLINED_FUNCTION_1_2();
  }
}

void sub_22DFC7D84()
{
  uint64_t v0;
  uint64_t v1;

  OUTLINED_FUNCTION_109_5();
  __swift_instantiateConcreteTypeFromMangledName(&qword_255DDD010);
  OUTLINED_FUNCTION_14_18();
  MEMORY[0x24BDAC7A8](v1);
  OUTLINED_FUNCTION_9_19();
  sub_22DFCEFD8();
  OUTLINED_FUNCTION_21_12();
  __swift_instantiateConcreteTypeFromMangledName(&qword_255DDCF70);
  OUTLINED_FUNCTION_152_2();
  OUTLINED_FUNCTION_34_9();
  if (!v0)
  {
    OUTLINED_FUNCTION_25_15();
    OUTLINED_FUNCTION_25_15();
    OUTLINED_FUNCTION_163_2();
    OUTLINED_FUNCTION_163_2();
    OUTLINED_FUNCTION_25_15();
  }
  OUTLINED_FUNCTION_40_8();
  OUTLINED_FUNCTION_214_1();
  OUTLINED_FUNCTION_3_25();
}

void sub_22DFC7EB0()
{
  __int128 v0[4];

  OUTLINED_FUNCTION_26_0();
  sub_22DFC7C70(v0);
  OUTLINED_FUNCTION_24_1();
  OUTLINED_FUNCTION_10_0();
}

void sub_22DFC7ED8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD *v17;
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
  void (*v28)(uint64_t, uint64_t);
  uint64_t v29;
  char v30;
  char v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;

  OUTLINED_FUNCTION_8_5();
  v14 = v13;
  v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_255DDD008);
  OUTLINED_FUNCTION_14_18();
  MEMORY[0x24BDAC7A8](v16);
  OUTLINED_FUNCTION_84_3();
  v17 = (_QWORD *)OUTLINED_FUNCTION_103_0();
  __swift_project_boxed_opaque_existential_1(v17, v18);
  sub_22DFCEFD8();
  sub_22DFDE060();
  if (v10)
  {
    OUTLINED_FUNCTION_42_0();
    OUTLINED_FUNCTION_105();
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_255DDCF70);
    OUTLINED_FUNCTION_153_2();
    OUTLINED_FUNCTION_122_2();
    sub_22DFDDE74();
    OUTLINED_FUNCTION_125();
    v19 = OUTLINED_FUNCTION_97_2();
    v21 = v20;
    OUTLINED_FUNCTION_146_2(v19);
    v22 = OUTLINED_FUNCTION_97_2();
    v24 = v23;
    v32 = v22;
    OUTLINED_FUNCTION_33_1();
    v33 = v24;
    v31 = OUTLINED_FUNCTION_230_1();
    v30 = OUTLINED_FUNCTION_230_1();
    v25 = OUTLINED_FUNCTION_97_2();
    v27 = v26;
    v28 = *(void (**)(uint64_t, uint64_t))(v11 + 8);
    v29 = v25;
    v28(v12, v15);
    OUTLINED_FUNCTION_96_0();
    OUTLINED_FUNCTION_75_1();
    OUTLINED_FUNCTION_33_1();
    OUTLINED_FUNCTION_288();
    swift_bridgeObjectRelease();
    OUTLINED_FUNCTION_42_0();
    OUTLINED_FUNCTION_105();
    OUTLINED_FUNCTION_46();
    swift_bridgeObjectRelease();
    OUTLINED_FUNCTION_288();
    *(_QWORD *)v14 = v34;
    *(_QWORD *)(v14 + 8) = v21;
    *(_QWORD *)(v14 + 16) = v32;
    *(_QWORD *)(v14 + 24) = v33;
    *(_BYTE *)(v14 + 32) = v31 & 1;
    *(_BYTE *)(v14 + 33) = v30 & 1;
    *(_QWORD *)(v14 + 40) = v29;
    *(_QWORD *)(v14 + 48) = v27;
    *(_QWORD *)(v14 + 56) = a10;
  }
  OUTLINED_FUNCTION_1_4();
}

uint64_t sub_22DFC8134@<X0>(uint64_t *a1@<X0>, _BYTE *a2@<X8>)
{
  uint64_t result;

  result = sub_22DFC798C(*a1);
  *a2 = result;
  return result;
}

uint64_t sub_22DFC815C()
{
  unsigned __int8 *v0;

  return sub_22DFC7BC0(*v0);
}

void sub_22DFC8164(_BYTE *a1@<X8>)
{
  char v2;

  sub_22DFC79A0();
  *a1 = v2;
}

uint64_t sub_22DFC8188@<X0>(uint64_t a1@<X0>, _BYTE *a2@<X8>)
{
  uint64_t result;

  result = sub_22DFC7BB0(a1);
  *a2 = result;
  return result;
}

void sub_22DFC81AC(_QWORD *a1@<X8>)
{
  *a1 = &unk_24F9B0098;
}

uint64_t sub_22DFC81BC(uint64_t a1, uint64_t a2)
{
  return sub_22DFCA14C(a1, a2, (void (*)(void))sub_22DFCEF98, (void (*)(void))sub_22DFCEFD8);
}

uint64_t sub_22DFC81D0()
{
  sub_22DFCEFD8();
  return sub_22DFDE084();
}

uint64_t sub_22DFC81F8()
{
  sub_22DFCEFD8();
  return sub_22DFDE090();
}

uint64_t sub_22DFC8228()
{
  __int128 v1[4];

  sub_22DFDE000();
  sub_22DFC7C70(v1);
  return sub_22DFDE030();
}

uint64_t sub_22DFC8260()
{
  return sub_22DFDD448();
}

uint64_t sub_22DFC8268(uint64_t a1)
{
  uint64_t v1;
  uint64_t result;

  result = swift_bridgeObjectRelease();
  *(_QWORD *)(v1 + 56) = a1;
  return result;
}

uint64_t (*sub_22DFC8290())(_QWORD, _QWORD)
{
  return nullsub_1;
}

uint64_t sub_22DFC82A0()
{
  sub_22DFCF0C4();
  return sub_22DFDD2A4();
}

uint64_t sub_22DFC82EC()
{
  sub_22DFCF0C4();
  return sub_22DFDD2B0();
}

uint64_t sub_22DFC8330()
{
  sub_22DFCF0C4();
  return sub_22DFDD298();
}

double sub_22DFC836C@<D0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, _OWORD *a9@<X8>)
{
  uint64_t v9;
  double result;
  uint64_t v12;
  __int128 v13;
  uint64_t v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;

  sub_22DFC7ED8(a1, a2, a3, a4, a5, a6, a7, a8, v12, v14);
  if (!v9)
  {
    *a9 = v13;
    a9[1] = v15;
    result = *(double *)&v16;
    a9[2] = v16;
    a9[3] = v17;
  }
  return result;
}

void sub_22DFC83AC()
{
  sub_22DFC7D84();
}

uint64_t sub_22DFC83C0()
{
  sub_22DFD1F7C();
  return sub_22DFDD310();
}

uint64_t sub_22DFC8400()
{
  sub_22DF95940();
  sub_22DF9597C();
  return sub_22DFDD358();
}

uint64_t sub_22DFC845C()
{
  sub_22DFD1F7C();
  return sub_22DFDD304();
}

void CarrySettings.ServerConfiguration.audience.getter()
{
  OUTLINED_FUNCTION_33_1();
  OUTLINED_FUNCTION_314();
  OUTLINED_FUNCTION_1_2();
}

uint64_t CarrySettings.ServerConfiguration.configurationProfile.getter@<X0>(uint64_t *a1@<X8>)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v2 = v1[2];
  v3 = v1[3];
  v4 = v1[4];
  v5 = v1[5];
  v6 = v1[6];
  v7 = v1[7];
  v8 = v1[8];
  *a1 = v2;
  a1[1] = v3;
  a1[2] = v4;
  a1[3] = v5;
  a1[4] = v6;
  a1[5] = v7;
  a1[6] = v8;
  return sub_22DFC4DFC(v2, v3);
}

__n128 CarrySettings.ServerConfiguration.init(audience:configProfile:)@<Q0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v4;
  __int128 v5;
  __n128 result;

  v4 = *(_QWORD *)(a3 + 48);
  *(_QWORD *)a4 = a1;
  *(_QWORD *)(a4 + 8) = a2;
  v5 = *(_OWORD *)(a3 + 16);
  *(_OWORD *)(a4 + 16) = *(_OWORD *)a3;
  *(_OWORD *)(a4 + 32) = v5;
  result = *(__n128 *)(a3 + 32);
  *(__n128 *)(a4 + 48) = result;
  *(_QWORD *)(a4 + 64) = v4;
  return result;
}

uint64_t static CarrySettings.ServerConfiguration.== infix(_:_:)(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  BOOL v7;
  uint64_t result;
  char v9;
  char v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  v3 = a1[1];
  v4 = a1[3];
  v5 = a2[1];
  v6 = a2[3];
  if (!v3)
  {
    if (v5)
      return 0;
    goto LABEL_10;
  }
  if (!v5)
    return 0;
  v7 = *a1 == *a2 && v3 == v5;
  if (v7 || (sub_22DFDDF58(), result = OUTLINED_FUNCTION_21_2(), (v9 & 1) != 0))
  {
LABEL_10:
    if (v4)
    {
      if (v6)
      {
        static CarrySettings.ProfileInfo.== infix(_:_:)();
        return (v10 & 1) != 0;
      }
      v11 = OUTLINED_FUNCTION_243_0();
      sub_22DFC4DFC(v11, v12);
    }
    else if (!v6)
    {
      return 1;
    }
    v13 = OUTLINED_FUNCTION_183_1();
    sub_22DFC4DFC(v13, v14);
    v15 = OUTLINED_FUNCTION_243_0();
    sub_22DFC4D44(v15, v16);
    v17 = OUTLINED_FUNCTION_183_1();
    sub_22DFC4D44(v17, v18);
    return 0;
  }
  return result;
}

void sub_22DFC86A0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  BOOL v4;

  OUTLINED_FUNCTION_200_1();
  if (v3 == v2 && (OUTLINED_FUNCTION_65_6((uint64_t)"additionalFields"), v4)
    || (OUTLINED_FUNCTION_1_26() & 1) != 0
    || (v1 == 0x65636E6569647561 ? (v4 = v0 == 0xE800000000000000) : (v4 = 0),
        v4 || (OUTLINED_FUNCTION_1_26() & 1) != 0 || v1 == v2 + 4 && v0 == 0x800000022DFF2620))
  {
    swift_bridgeObjectRelease();
  }
  else
  {
    OUTLINED_FUNCTION_1_26();
    OUTLINED_FUNCTION_107();
  }
  OUTLINED_FUNCTION_132_0();
}

void *sub_22DFC87A4()
{
  return &unk_24F9B00C0;
}

uint64_t sub_22DFC87B0(char a1)
{
  uint64_t result;

  result = 0xD000000000000010;
  if (a1)
  {
    if (a1 == 1)
      return 0x65636E6569647561;
    else
      return 0xD000000000000014;
  }
  return result;
}

uint64_t sub_22DFC8810()
{
  _QWORD *v0;
  __int128 *v1;
  __int128 *v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_160_1();
  v2 = v1;
  if (v0[1])
  {
    OUTLINED_FUNCTION_77_5();
    OUTLINED_FUNCTION_230();
    OUTLINED_FUNCTION_103_0();
    sub_22DFDD544();
    OUTLINED_FUNCTION_78_1();
  }
  else
  {
    OUTLINED_FUNCTION_77_5();
  }
  v3 = v0[3];
  if (v3)
  {
    v4 = v0[2];
    OUTLINED_FUNCTION_77_5();
    OUTLINED_FUNCTION_230();
    OUTLINED_FUNCTION_99_3();
    OUTLINED_FUNCTION_58_1();
    OUTLINED_FUNCTION_125();
    sub_22DFC7C70(v2);
    sub_22DFC4C78(v4, v3);
  }
  else
  {
    OUTLINED_FUNCTION_77_5();
  }
  OUTLINED_FUNCTION_33_1();
  OUTLINED_FUNCTION_133_2();
  OUTLINED_FUNCTION_167_2();
  return swift_bridgeObjectRelease();
}

void sub_22DFC8914(_QWORD *a1, _QWORD *a2)
{
  uint64_t v4;
  uint64_t v5;
  BOOL v6;
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
  char v25;
  char v26;
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
  _QWORD v46[4];
  __int16 v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;

  v4 = a1[1];
  v5 = a2[1];
  if (!v4)
  {
    if (v5)
      return;
LABEL_10:
    v7 = a1[2];
    v8 = a1[3];
    v9 = a1[4];
    v10 = a1[5];
    v11 = a1[6];
    v12 = a1[7];
    v13 = a1[8];
    v14 = a1[9];
    v16 = a2[2];
    v15 = a2[3];
    v18 = a2[4];
    v17 = a2[5];
    v20 = a2[6];
    v19 = a2[7];
    v22 = a2[8];
    v21 = a2[9];
    if (v8)
    {
      if (v15)
      {
        v46[0] = a1[2];
        v46[1] = v8;
        v46[2] = v9;
        v46[3] = v10;
        v47 = v11 & 0x101;
        v48 = v12;
        v49 = v13;
        v50 = v14;
        v30 = v16;
        v31 = v15;
        v32 = v18;
        v33 = v17;
        LOWORD(v34) = v20 & 0x101;
        v35 = v19;
        v36 = v22;
        v37 = v21;
        v29 = v7;
        sub_22DFD1AE0(v7, v8);
        v23 = OUTLINED_FUNCTION_228_1();
        sub_22DFD1AE0(v23, v24);
        sub_22DFC7CF0((uint64_t)v46);
        v26 = v25;
        sub_22DFC4C78(v16, v15);
        sub_22DFC4C78(v29, v8);
        if ((v26 & 1) == 0)
          return;
LABEL_17:
        sub_22DFCA514(a1[10], a2[10]);
        return;
      }
    }
    else if (!v15)
    {
      goto LABEL_17;
    }
    v30 = a1[2];
    v31 = v8;
    v32 = v9;
    v33 = v10;
    v34 = v11;
    v35 = v12;
    v36 = v13;
    v37 = v14;
    v38 = v16;
    v39 = v15;
    v40 = v18;
    v41 = v17;
    v42 = v20;
    v43 = v19;
    v44 = v22;
    v45 = v21;
    sub_22DFD1AE0(v7, v8);
    v27 = OUTLINED_FUNCTION_228_1();
    sub_22DFD1AE0(v27, v28);
    sub_22DFD1B30(&v30);
    return;
  }
  if (v5)
  {
    v6 = *a1 == *a2 && v4 == v5;
    if (v6 || (OUTLINED_FUNCTION_5_7() & 1) != 0)
      goto LABEL_10;
  }
}

void sub_22DFC8B04()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  _QWORD v3[7];
  char v4;
  _BYTE v5[64];

  OUTLINED_FUNCTION_109_5();
  __swift_instantiateConcreteTypeFromMangledName(&qword_255DDCF88);
  OUTLINED_FUNCTION_14_18();
  MEMORY[0x24BDAC7A8](v2);
  OUTLINED_FUNCTION_9_19();
  sub_22DFCFD80();
  OUTLINED_FUNCTION_21_12();
  v3[0] = *(_QWORD *)(v0 + 80);
  v4 = 0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_255DDCF70);
  OUTLINED_FUNCTION_152_2();
  sub_22DFDDEEC();
  if (!v1)
  {
    LOBYTE(v3[0]) = 1;
    OUTLINED_FUNCTION_166_2();
    OUTLINED_FUNCTION_71_3(v0 + 16, (uint64_t)v5);
    OUTLINED_FUNCTION_71_3((uint64_t)v5, (uint64_t)v3);
    v4 = 2;
    sub_22DFCEED8();
    OUTLINED_FUNCTION_242_1();
  }
  OUTLINED_FUNCTION_40_8();
  OUTLINED_FUNCTION_214_1();
  OUTLINED_FUNCTION_3_25();
}

void sub_22DFC8C2C()
{
  OUTLINED_FUNCTION_26_0();
  sub_22DFC8810();
  OUTLINED_FUNCTION_24_1();
  OUTLINED_FUNCTION_10_0();
}

void sub_22DFC8C54()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t *v3;
  uint64_t *v4;
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
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;

  OUTLINED_FUNCTION_8_5();
  v2 = v1;
  v4 = v3;
  __swift_instantiateConcreteTypeFromMangledName(&qword_255DDCF68);
  OUTLINED_FUNCTION_14_18();
  MEMORY[0x24BDAC7A8](v5);
  OUTLINED_FUNCTION_84_3();
  v6 = (_QWORD *)OUTLINED_FUNCTION_169_1();
  __swift_project_boxed_opaque_existential_1(v6, v7);
  sub_22DFCFD80();
  sub_22DFDE060();
  if (v0)
  {
    __swift_destroy_boxed_opaque_existential_0Tm(v2);
    OUTLINED_FUNCTION_288();
    OUTLINED_FUNCTION_80_1();
    OUTLINED_FUNCTION_103();
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_255DDCF70);
    sub_22DFD1BBC();
    sub_22DFDDE74();
    v8 = v13;
    LOBYTE(v13) = 1;
    OUTLINED_FUNCTION_58_1();
    v9 = sub_22DFDDE2C();
    v11 = v10;
    v12 = v9;
    sub_22DFCEE98();
    OUTLINED_FUNCTION_96_0();
    sub_22DFDDE44();
    OUTLINED_FUNCTION_17_14();
    sub_22DFD1AE0(v13, v14);
    OUTLINED_FUNCTION_80_1();
    OUTLINED_FUNCTION_96_0();
    sub_22DFD1AE0(v13, v14);
    sub_22DFC4C78(v13, v14);
    OUTLINED_FUNCTION_288();
    __swift_destroy_boxed_opaque_existential_0Tm(v2);
    OUTLINED_FUNCTION_288();
    sub_22DFC4C78(v13, v14);
    OUTLINED_FUNCTION_103();
    *v4 = v12;
    v4[1] = v11;
    v4[2] = v13;
    v4[3] = v14;
    v4[4] = v15;
    v4[5] = v16;
    v4[6] = v17;
    v4[7] = v18;
    v4[8] = v19;
    v4[9] = v20;
    v4[10] = v8;
  }
  OUTLINED_FUNCTION_1_4();
}

uint64_t sub_22DFC8EEC()
{
  char *v0;

  return sub_22DFC87B0(*v0);
}

void sub_22DFC8EF4(_BYTE *a1@<X8>)
{
  char v2;

  sub_22DFC86A0();
  *a1 = v2;
}

void sub_22DFC8F18(_QWORD *a1@<X8>)
{
  *a1 = &unk_24F9B00C0;
}

uint64_t sub_22DFC8F28(uint64_t a1, uint64_t a2)
{
  return sub_22DFCA14C(a1, a2, (void (*)(void))sub_22DFCFD40, (void (*)(void))sub_22DFCFD80);
}

uint64_t sub_22DFC8F3C()
{
  sub_22DFCFD80();
  return sub_22DFDE084();
}

uint64_t sub_22DFC8F64()
{
  sub_22DFCFD80();
  return sub_22DFDE090();
}

uint64_t sub_22DFC8F94()
{
  sub_22DFDE000();
  sub_22DFC8810();
  return sub_22DFDE030();
}

uint64_t sub_22DFC8FCC()
{
  return sub_22DFDD448();
}

uint64_t sub_22DFC8FD4(uint64_t a1)
{
  uint64_t v1;
  uint64_t result;

  result = swift_bridgeObjectRelease();
  *(_QWORD *)(v1 + 80) = a1;
  return result;
}

uint64_t (*sub_22DFC8FFC())(_QWORD, _QWORD)
{
  return nullsub_1;
}

uint64_t sub_22DFC900C()
{
  sub_22DFCFE6C();
  return sub_22DFDD2A4();
}

uint64_t sub_22DFC9058()
{
  sub_22DFCFE6C();
  return sub_22DFDD2B0();
}

uint64_t sub_22DFC909C()
{
  sub_22DFCFE6C();
  return sub_22DFDD298();
}

void sub_22DFC90D8(void *a1@<X8>)
{
  uint64_t v1;
  _BYTE __src[88];

  sub_22DFC8C54();
  if (!v1)
    memcpy(a1, __src, 0x58uLL);
}

void sub_22DFC9120()
{
  const void *v0;
  _BYTE __dst[88];

  memcpy(__dst, v0, sizeof(__dst));
  sub_22DFC8B04();
}

uint64_t sub_22DFC9170()
{
  sub_22DFD1CC4();
  return sub_22DFDD310();
}

uint64_t sub_22DFC91B0()
{
  sub_22DF959B8();
  sub_22DFCFEAC();
  return sub_22DFDD358();
}

uint64_t sub_22DFC920C()
{
  sub_22DFD1CC4();
  return sub_22DFDD304();
}

void CarrySettings.AppleConnectSettings.username.getter()
{
  OUTLINED_FUNCTION_33_1();
  OUTLINED_FUNCTION_314();
  OUTLINED_FUNCTION_1_2();
}

void CarrySettings.AppleConnectSettings.password.getter()
{
  OUTLINED_FUNCTION_33_1();
  OUTLINED_FUNCTION_314();
  OUTLINED_FUNCTION_1_2();
}

void CarrySettings.AppleConnectSettings.lastVerifiedDate.getter(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;

  v3 = type metadata accessor for CarrySettings.AppleConnectSettings(0);
  sub_22DFD21A4(v1 + *(int *)(v3 + 24), a1, &qword_255DD7828);
  OUTLINED_FUNCTION_1_2();
}

uint64_t CarrySettings.AppleConnectSettings.description.getter()
{
  return OUTLINED_FUNCTION_127_2(34, 31);
}

void CarrySettings.AppleConnectSettings.init(username:password:lastVerifiedDate:)(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, _QWORD *a6@<X8>)
{
  uint64_t v8;

  *a6 = a1;
  a6[1] = a2;
  a6[2] = a3;
  a6[3] = a4;
  v8 = type metadata accessor for CarrySettings.AppleConnectSettings(0);
  sub_22DFD1E98(a5, (uint64_t)a6 + *(int *)(v8 + 24), &qword_255DD7828);
  OUTLINED_FUNCTION_1_2();
}

uint64_t static CarrySettings.AppleConnectSettings.== infix(_:_:)(_QWORD *a1, _QWORD *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  char v12;
  uint64_t v13;
  uint64_t v14;
  char v16;
  uint64_t v17;
  uint64_t (*v18)(_QWORD);
  uint64_t v20;

  OUTLINED_FUNCTION_241_1();
  OUTLINED_FUNCTION_57();
  MEMORY[0x24BDAC7A8](v4);
  OUTLINED_FUNCTION_46_4();
  v7 = v5 - v6;
  MEMORY[0x24BDAC7A8](v8);
  v10 = (char *)&v20 - v9;
  if (*a1 == *a2 && a1[1] == a2[1])
  {
    sub_22DFB1CFC((uint64_t)a1, (uint64_t)&v20 - v9, type metadata accessor for CarrySettings.AppleConnectSettings);
    sub_22DFB1CFC((uint64_t)a2, v7, type metadata accessor for CarrySettings.AppleConnectSettings);
  }
  else
  {
    v12 = OUTLINED_FUNCTION_5_7();
    sub_22DFB1CFC((uint64_t)a1, (uint64_t)v10, type metadata accessor for CarrySettings.AppleConnectSettings);
    sub_22DFB1CFC((uint64_t)a2, v7, type metadata accessor for CarrySettings.AppleConnectSettings);
    if ((v12 & 1) == 0)
    {
      OUTLINED_FUNCTION_66_5(v7);
      OUTLINED_FUNCTION_66_5((uint64_t)v10);
LABEL_19:
      v16 = 0;
      return v16 & 1;
    }
  }
  v13 = *((_QWORD *)v10 + 3);
  v14 = *(_QWORD *)(v7 + 24);
  if (!v13)
  {
    OUTLINED_FUNCTION_230();
    OUTLINED_FUNCTION_66_5(v7);
    OUTLINED_FUNCTION_66_5((uint64_t)v10);
    if (!v14)
    {
      v16 = 1;
      return v16 & 1;
    }
    goto LABEL_18;
  }
  if (!v14)
  {
    OUTLINED_FUNCTION_233();
    OUTLINED_FUNCTION_137_2(v7);
    OUTLINED_FUNCTION_137_2((uint64_t)v10);
LABEL_18:
    swift_bridgeObjectRelease();
    goto LABEL_19;
  }
  if (*((_QWORD *)v10 + 2) == *(_QWORD *)(v7 + 16) && v13 == v14)
    v16 = 1;
  else
    v16 = OUTLINED_FUNCTION_5_7();
  OUTLINED_FUNCTION_233();
  sub_22DF58090(v7, type metadata accessor for CarrySettings.AppleConnectSettings);
  v17 = OUTLINED_FUNCTION_103_0();
  sub_22DF58090(v17, v18);
  OUTLINED_FUNCTION_149();
  return v16 & 1;
}

uint64_t sub_22DFC94E0()
{
  return OUTLINED_FUNCTION_127_2(43, 40);
}

uint64_t sub_22DFC94FC(uint64_t a1, uint64_t a2)
{
  sub_22DFDDCA0();
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_233();
  sub_22DFDD568();
  OUTLINED_FUNCTION_149();
  sub_22DFDD568();
  sub_22DFDD568();
  OUTLINED_FUNCTION_149();
  sub_22DFDD568();
  OUTLINED_FUNCTION_130_0();
  OUTLINED_FUNCTION_163_0();
  sub_22DFDD568();
  OUTLINED_FUNCTION_107();
  OUTLINED_FUNCTION_78_1();
  return a2;
}

uint64_t sub_22DFC9618(uint64_t a1)
{
  if ((unint64_t)(a1 + 1) < 4)
    return a1 + 1;
  else
    return 4;
}

void sub_22DFC962C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  BOOL v4;
  BOOL v5;

  OUTLINED_FUNCTION_200_1();
  if (v3 == v2 && (OUTLINED_FUNCTION_65_6((uint64_t)"additionalFields"), v4)
    || (OUTLINED_FUNCTION_1_26() & 1) != 0
    || (v1 == 0x656D616E72657375 ? (v4 = v0 == 0xE800000000000000) : (v4 = 0),
        v4
     || (OUTLINED_FUNCTION_1_26() & 1) != 0
     || (v1 == 0x64726F7773736170 ? (v5 = v0 == 0xE800000000000000) : (v5 = 0),
         v5
      || (OUTLINED_FUNCTION_1_26() & 1) != 0
      || v1 == v2 && (OUTLINED_FUNCTION_65_6((uint64_t)"lastVerifiedDate"), v4))))
  {
    swift_bridgeObjectRelease();
  }
  else
  {
    OUTLINED_FUNCTION_1_26();
    OUTLINED_FUNCTION_107();
  }
  OUTLINED_FUNCTION_132_0();
}

void *sub_22DFC977C()
{
  return &unk_24F9B00E8;
}

uint64_t sub_22DFC9788(unsigned __int8 a1)
{
  return a1 - 1;
}

uint64_t sub_22DFC9798(unsigned __int8 a1)
{
  return a1 - 1;
}

uint64_t sub_22DFC97A4(unsigned __int8 a1)
{
  return ((uint64_t (*)(unint64_t, unint64_t))((char *)sub_22DFC97DC + 4 * byte_22DFEA1E7[a1]))(0xD000000000000010, 0x800000022DFF2600);
}

uint64_t sub_22DFC97DC()
{
  return 0x656D616E72657375;
}

uint64_t sub_22DFC97F4()
{
  return 0x64726F7773736170;
}

void sub_22DFC9820()
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
  uint64_t v9;
  void (*v10)(uint64_t);

  OUTLINED_FUNCTION_21();
  v4 = OUTLINED_FUNCTION_40_7();
  OUTLINED_FUNCTION_14_18();
  MEMORY[0x24BDAC7A8](v5);
  OUTLINED_FUNCTION_16_0();
  __swift_instantiateConcreteTypeFromMangledName(&qword_255DD7828);
  OUTLINED_FUNCTION_57();
  MEMORY[0x24BDAC7A8](v6);
  OUTLINED_FUNCTION_246();
  OUTLINED_FUNCTION_96_0();
  OUTLINED_FUNCTION_314();
  sub_22DFDD544();
  swift_bridgeObjectRelease();
  if (*(_QWORD *)(v0 + 24))
  {
    OUTLINED_FUNCTION_77_5();
    OUTLINED_FUNCTION_96_0();
    sub_22DFDD544();
    swift_bridgeObjectRelease();
  }
  else
  {
    OUTLINED_FUNCTION_77_5();
  }
  v7 = _s29AppleConnectSettingsMergeableVMa(0);
  sub_22DFD21A4(v0 + *(int *)(v7 + 24), v2, &qword_255DD7828);
  OUTLINED_FUNCTION_26_12(v2, 1, v4);
  if (v8)
  {
    OUTLINED_FUNCTION_77_5();
  }
  else
  {
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 32))(v1, v2, v4);
    OUTLINED_FUNCTION_77_5();
    sub_22DFCED9C((uint64_t)&qword_255DDC250);
    sub_22DFDD4C0();
    v9 = OUTLINED_FUNCTION_304();
    v10(v9);
  }
  OUTLINED_FUNCTION_33_1();
  OUTLINED_FUNCTION_133_2();
  OUTLINED_FUNCTION_46();
  OUTLINED_FUNCTION_4_1();
}

void sub_22DFC9990()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;
  _QWORD *v4;
  _QWORD *v5;
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _BYTE *v14;
  uint64_t v15;
  uint64_t v16;
  _BYTE *v17;
  BOOL v18;
  char v19;
  uint64_t v20;
  uint64_t v21;
  char v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t *v29;
  char v30;
  uint64_t v31;
  uint64_t (*v32)(uint64_t);
  uint64_t v33;
  uint64_t v34;
  void (*v35)(uint64_t, uint64_t);
  uint64_t v36;
  _BYTE v37[4];
  int v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;

  OUTLINED_FUNCTION_21();
  v4 = v3;
  v6 = v5;
  v7 = OUTLINED_FUNCTION_40_7();
  OUTLINED_FUNCTION_14_18();
  MEMORY[0x24BDAC7A8](v8);
  OUTLINED_FUNCTION_16_0();
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_255DD7830);
  OUTLINED_FUNCTION_57();
  MEMORY[0x24BDAC7A8](v10);
  OUTLINED_FUNCTION_16_5();
  __swift_instantiateConcreteTypeFromMangledName(&qword_255DD7828);
  OUTLINED_FUNCTION_57();
  MEMORY[0x24BDAC7A8](v11);
  OUTLINED_FUNCTION_123_2();
  MEMORY[0x24BDAC7A8](v12);
  v14 = &v37[-v13];
  MEMORY[0x24BDAC7A8](v15);
  v17 = &v37[-v16];
  v18 = *v6 == *v4 && v6[1] == v4[1];
  if (!v18)
  {
    OUTLINED_FUNCTION_5_7();
    OUTLINED_FUNCTION_21_2();
    if ((v19 & 1) == 0)
      goto LABEL_26;
  }
  v20 = v6[3];
  v21 = v4[3];
  if (!v20)
  {
    if (v21)
      goto LABEL_26;
LABEL_15:
    v39 = v1;
    v41 = v2;
    v24 = OUTLINED_FUNCTION_189_1();
    OUTLINED_FUNCTION_197_1((uint64_t)v6 + *(int *)(v24 + 24), (uint64_t)v17);
    v40 = v24;
    OUTLINED_FUNCTION_197_1((uint64_t)v4 + *(int *)(v24 + 24), (uint64_t)v14);
    v25 = v0 + *(int *)(v9 + 48);
    OUTLINED_FUNCTION_197_1((uint64_t)v17, v0);
    OUTLINED_FUNCTION_197_1((uint64_t)v14, v25);
    OUTLINED_FUNCTION_18_0(v0);
    if (v18)
    {
      OUTLINED_FUNCTION_114_3((uint64_t)v14);
      OUTLINED_FUNCTION_114_3((uint64_t)v17);
      v26 = OUTLINED_FUNCTION_18_0(v25);
      if (v18)
      {
        OUTLINED_FUNCTION_110_4(v26, &qword_255DD7828);
        goto LABEL_25;
      }
    }
    else
    {
      v27 = OUTLINED_FUNCTION_169_1();
      sub_22DFD21A4(v27, v28, v29);
      OUTLINED_FUNCTION_18_0(v25);
      if (!v30)
      {
        v33 = v41;
        v34 = v39;
        (*(void (**)(uint64_t, uint64_t, uint64_t))(v41 + 32))(v39, v25, v7);
        sub_22DFCED9C((uint64_t)&qword_255DD7838);
        v38 = sub_22DFDD4F0();
        v35 = *(void (**)(uint64_t, uint64_t))(v33 + 8);
        v35(v34, v7);
        OUTLINED_FUNCTION_114_3((uint64_t)v14);
        OUTLINED_FUNCTION_114_3((uint64_t)v17);
        v36 = OUTLINED_FUNCTION_177_1();
        ((void (*)(uint64_t))v35)(v36);
        OUTLINED_FUNCTION_114_3(v0);
        if ((v38 & 1) == 0)
          goto LABEL_26;
LABEL_25:
        sub_22DFCA514(*(_QWORD *)((char *)v6 + *(int *)(v40 + 28)), *(_QWORD *)((char *)v4 + *(int *)(v40 + 28)));
        goto LABEL_26;
      }
      sub_22DF58068((uint64_t)v14, &qword_255DD7828);
      sub_22DF58068((uint64_t)v17, &qword_255DD7828);
      v31 = OUTLINED_FUNCTION_177_1();
      v26 = v32(v31);
    }
    OUTLINED_FUNCTION_110_4(v26, &qword_255DD7830);
    goto LABEL_26;
  }
  if (v21)
  {
    if (v6[2] == v4[2] && v20 == v21)
      goto LABEL_15;
    OUTLINED_FUNCTION_5_7();
    OUTLINED_FUNCTION_21_2();
    if ((v23 & 1) != 0)
      goto LABEL_15;
  }
LABEL_26:
  OUTLINED_FUNCTION_4_1();
}

void sub_22DFC9C5C()
{
  uint64_t v0;
  uint64_t v1;

  OUTLINED_FUNCTION_109_5();
  __swift_instantiateConcreteTypeFromMangledName(&qword_255DDCFF8);
  OUTLINED_FUNCTION_14_18();
  MEMORY[0x24BDAC7A8](v1);
  OUTLINED_FUNCTION_9_19();
  sub_22DFCF278();
  OUTLINED_FUNCTION_21_12();
  _s29AppleConnectSettingsMergeableVMa(0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_255DDCF70);
  OUTLINED_FUNCTION_152_2();
  OUTLINED_FUNCTION_34_9();
  if (!v0)
  {
    OUTLINED_FUNCTION_25_15();
    OUTLINED_FUNCTION_166_2();
    sub_22DFDCEC0();
    sub_22DFCED9C((uint64_t)&qword_255DD7860);
    OUTLINED_FUNCTION_242_1();
  }
  OUTLINED_FUNCTION_40_8();
  OUTLINED_FUNCTION_214_1();
  OUTLINED_FUNCTION_3_25();
}

void sub_22DFC9D9C()
{
  sub_22DFB8684((void (*)(_BYTE *))sub_22DFC9820);
}

void sub_22DFC9DA8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  uint64_t v10;
  uint64_t *v11;
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
  void (*v25)(uint64_t);
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;

  OUTLINED_FUNCTION_8_5();
  v14 = v13;
  v26 = v15;
  __swift_instantiateConcreteTypeFromMangledName(&qword_255DD7828);
  OUTLINED_FUNCTION_57();
  MEMORY[0x24BDAC7A8](v16);
  OUTLINED_FUNCTION_43_5();
  v27 = __swift_instantiateConcreteTypeFromMangledName(&qword_255DDCFF0);
  MEMORY[0x24BDAC7A8](v27);
  OUTLINED_FUNCTION_44_4();
  v17 = _s29AppleConnectSettingsMergeableVMa(0);
  OUTLINED_FUNCTION_57();
  MEMORY[0x24BDAC7A8](v18);
  OUTLINED_FUNCTION_16_5();
  v11[2] = 0;
  v11[3] = 0;
  v20 = (uint64_t)v11 + *(int *)(v19 + 24);
  v21 = sub_22DFDCEC0();
  __swift_storeEnumTagSinglePayload(v20, 1, 1, v21);
  v28 = *(int *)(v17 + 28);
  *(uint64_t *)((char *)v11 + v28) = MEMORY[0x24BEE4B00];
  __swift_project_boxed_opaque_existential_1(v14, v14[3]);
  sub_22DFCF278();
  sub_22DFDE060();
  if (v10)
  {
    OUTLINED_FUNCTION_210_1();
    swift_bridgeObjectRelease();
    sub_22DF58068(v20, &qword_255DD7828);
    swift_bridgeObjectRelease();
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_255DDCF70);
    OUTLINED_FUNCTION_153_2();
    OUTLINED_FUNCTION_122_2();
    OUTLINED_FUNCTION_213_0();
    sub_22DFDDE74();
    *(uint64_t *)((char *)v11 + v28) = a10;
    OUTLINED_FUNCTION_213_0();
    *v11 = sub_22DFDDE50();
    v11[1] = v22;
    OUTLINED_FUNCTION_213_0();
    v11[2] = sub_22DFDDE2C();
    v11[3] = v23;
    sub_22DFCED9C((uint64_t)&qword_255DD7880);
    OUTLINED_FUNCTION_213_0();
    sub_22DFDDE44();
    v24 = OUTLINED_FUNCTION_238_1();
    v25(v24);
    sub_22DFD1F50(v12, v20, &qword_255DD7828);
    sub_22DFB1CFC((uint64_t)v11, v26, _s29AppleConnectSettingsMergeableVMa);
    OUTLINED_FUNCTION_210_1();
    sub_22DF58090((uint64_t)v11, _s29AppleConnectSettingsMergeableVMa);
  }
  OUTLINED_FUNCTION_1_4();
}

void sub_22DFCA050()
{
  sub_22DFC0618();
}

void sub_22DFCA058()
{
  sub_22DFC0688();
}

uint64_t sub_22DFCA070@<X0>(uint64_t *a1@<X0>, _BYTE *a2@<X8>)
{
  uint64_t result;

  result = sub_22DFC9618(*a1);
  *a2 = result;
  return result;
}

void sub_22DFCA098(uint64_t *a1@<X8>)
{
  unsigned __int8 *v1;

  *a1 = sub_22DFC9798(*v1);
  OUTLINED_FUNCTION_1_2();
}

uint64_t sub_22DFCA0BC()
{
  unsigned __int8 *v0;

  return sub_22DFC97A4(*v0);
}

void sub_22DFCA0C4(_BYTE *a1@<X8>)
{
  char v2;

  sub_22DFC962C();
  *a1 = v2;
}

uint64_t sub_22DFCA0E8()
{
  unsigned __int8 *v0;

  return sub_22DFC9788(*v0);
}

uint64_t sub_22DFCA104@<X0>(uint64_t a1@<X0>, _BYTE *a2@<X8>)
{
  uint64_t result;

  result = sub_22DFC9618(a1);
  *a2 = result;
  return result;
}

void sub_22DFCA128(_QWORD *a1@<X8>)
{
  *a1 = &unk_24F9B00E8;
}

uint64_t sub_22DFCA138(uint64_t a1, uint64_t a2)
{
  return sub_22DFCA14C(a1, a2, (void (*)(void))sub_22DFCF238, (void (*)(void))sub_22DFCF278);
}

uint64_t sub_22DFCA14C(uint64_t a1, uint64_t a2, void (*a3)(void), void (*a4)(void))
{
  a3();
  a4();
  return sub_22DFDE078();
}

uint64_t sub_22DFCA19C()
{
  sub_22DFCF278();
  return sub_22DFDE084();
}

uint64_t sub_22DFCA1C4()
{
  sub_22DFCF278();
  return sub_22DFDE090();
}

void sub_22DFCA1EC()
{
  sub_22DFB8684((void (*)(_BYTE *))sub_22DFC9820);
}

void sub_22DFCA20C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_22DFB89F4(a1, a2, a3, (void (*)(_BYTE *))sub_22DFC9820);
}

uint64_t sub_22DFCA218()
{
  return sub_22DFDD448();
}

uint64_t sub_22DFCA224(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t result;

  v4 = *(int *)(a2 + 28);
  result = swift_bridgeObjectRelease();
  *(_QWORD *)(v2 + v4) = a1;
  return result;
}

uint64_t (*sub_22DFCA258())(_QWORD, _QWORD)
{
  return nullsub_1;
}

uint64_t sub_22DFCA26C()
{
  sub_22DFCED9C((uint64_t)&unk_255DDCD48);
  return sub_22DFDD2A4();
}

uint64_t sub_22DFCA2D0()
{
  sub_22DFCED9C((uint64_t)&unk_255DDCD48);
  return sub_22DFDD2B0();
}

uint64_t sub_22DFCA32C()
{
  sub_22DFCED9C((uint64_t)&unk_255DDCD48);
  return sub_22DFDD298();
}

uint64_t sub_22DFCA37C()
{
  return sub_22DFC94FC(43, 0xD000000000000028);
}

void sub_22DFCA3B0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t vars0;
  uint64_t vars8;

  sub_22DFC9DA8(a1, a2, a3, a4, a5, a6, a7, a8, vars0, vars8);
}

void sub_22DFCA3C4()
{
  sub_22DFC9C5C();
}

uint64_t sub_22DFCA3D8()
{
  sub_22DFCED9C((uint64_t)&unk_255DDD000);
  return sub_22DFDD310();
}

uint64_t sub_22DFCA430()
{
  sub_22DFCED9C((uint64_t)&qword_255DDAE48);
  sub_22DFCED9C((uint64_t)&unk_255DDCD50);
  return sub_22DFDD358();
}

uint64_t sub_22DFCA4C4()
{
  sub_22DFCED9C((uint64_t)&unk_255DDD000);
  return sub_22DFDD304();
}

void sub_22DFCA514(uint64_t a1, uint64_t a2)
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
  uint64_t *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  unint64_t v23;
  unint64_t v24;
  uint64_t v25;
  unint64_t v26;
  uint64_t v27;
  uint64_t v28;
  int64_t v29;
  unint64_t v30;
  int64_t v31;
  uint64_t v32;
  uint64_t v33;
  char *v34;
  uint64_t v35;
  unint64_t v36;
  char v37;
  char v38;
  void (*v39)(char *, uint64_t);
  int64_t v40;
  uint64_t v41;
  int64_t v42;
  uint64_t v43;
  uint64_t v44;
  int64_t v45;

  v4 = sub_22DFDD064();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v40 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v8);
  v10 = (char *)&v40 - v9;
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_255DDCF40);
  MEMORY[0x24BDAC7A8](v11);
  v13 = (char *)&v40 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v14);
  v16 = (int64_t *)((char *)&v40 - v15);
  if (a1 == a2 || *(_QWORD *)(a1 + 16) != *(_QWORD *)(a2 + 16))
    return;
  v44 = a2;
  v45 = 0;
  v43 = a1;
  v19 = *(_QWORD *)(a1 + 64);
  v18 = a1 + 64;
  v17 = v19;
  v20 = 1 << *(_BYTE *)(v18 - 32);
  v21 = -1;
  if (v20 < 64)
    v21 = ~(-1 << v20);
  v22 = v21 & v17;
  v41 = v18;
  v42 = (unint64_t)(v20 + 63) >> 6;
  v40 = v42 - 1;
  while (1)
  {
    if (v22)
    {
      v23 = __clz(__rbit64(v22));
      v22 &= v22 - 1;
      v24 = v23 | (v45 << 6);
LABEL_8:
      v25 = *(_QWORD *)(*(_QWORD *)(v43 + 48) + 8 * v24);
      v26 = *(_QWORD *)(v43 + 56) + *(_QWORD *)(v5 + 72) * v24;
      v27 = __swift_instantiateConcreteTypeFromMangledName(&qword_255DDCF48);
      (*(void (**)(char *, unint64_t, uint64_t))(v5 + 16))(&v13[*(int *)(v27 + 48)], v26, v4);
      *(_QWORD *)v13 = v25;
      __swift_storeEnumTagSinglePayload((uint64_t)v13, 0, 1, v27);
      v28 = v44;
      goto LABEL_27;
    }
    v29 = v45 + 1;
    if (__OFADD__(v45, 1))
    {
      __break(1u);
      goto LABEL_35;
    }
    v28 = v44;
    if (v29 < v42)
    {
      v30 = *(_QWORD *)(v41 + 8 * v29);
      if (v30)
        goto LABEL_12;
      v31 = v45 + 2;
      ++v45;
      if (v29 + 1 < v42)
      {
        v30 = *(_QWORD *)(v41 + 8 * v31);
        if (v30)
          goto LABEL_15;
        v45 = v29 + 1;
        if (v29 + 2 < v42)
        {
          v30 = *(_QWORD *)(v41 + 8 * (v29 + 2));
          if (v30)
          {
            v29 += 2;
            goto LABEL_12;
          }
          v31 = v29 + 3;
          v45 = v29 + 2;
          if (v29 + 3 < v42)
            break;
        }
      }
    }
LABEL_26:
    v32 = __swift_instantiateConcreteTypeFromMangledName(&qword_255DDCF48);
    __swift_storeEnumTagSinglePayload((uint64_t)v13, 1, 1, v32);
    v22 = 0;
LABEL_27:
    sub_22DFD1E98((uint64_t)v13, (uint64_t)v16, &qword_255DDCF40);
    v33 = __swift_instantiateConcreteTypeFromMangledName(&qword_255DDCF48);
    if (__swift_getEnumTagSinglePayload((uint64_t)v16, 1, v33) == 1)
      return;
    v34 = (char *)v16 + *(int *)(v33 + 48);
    v35 = *v16;
    (*(void (**)(char *, char *, uint64_t))(v5 + 32))(v10, v34, v4);
    v36 = sub_22DFCA8F0(v35);
    if ((v37 & 1) == 0)
    {
      (*(void (**)(char *, uint64_t))(v5 + 8))(v10, v4);
      return;
    }
    (*(void (**)(char *, unint64_t, uint64_t))(v5 + 16))(v7, *(_QWORD *)(v28 + 56) + *(_QWORD *)(v5 + 72) * v36, v4);
    sub_22DFCED9C((uint64_t)&unk_255DDCF50);
    v38 = sub_22DFDD4F0();
    v39 = *(void (**)(char *, uint64_t))(v5 + 8);
    v39(v7, v4);
    v39(v10, v4);
    if ((v38 & 1) == 0)
      return;
  }
  v30 = *(_QWORD *)(v41 + 8 * v31);
  if (v30)
  {
LABEL_15:
    v29 = v31;
LABEL_12:
    v22 = (v30 - 1) & v30;
    v24 = __clz(__rbit64(v30)) + (v29 << 6);
    v45 = v29;
    goto LABEL_8;
  }
  while (1)
  {
    v29 = v31 + 1;
    if (__OFADD__(v31, 1))
      break;
    if (v29 >= v42)
    {
      v45 = v40;
      goto LABEL_26;
    }
    v30 = *(_QWORD *)(v41 + 8 * v29);
    ++v31;
    if (v30)
      goto LABEL_12;
  }
LABEL_35:
  __break(1u);
}

unint64_t sub_22DFCA8F0(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_22DFDDFF4();
  return sub_22DFD00AC(a1, v2);
}

unint64_t sub_22DFCA920()
{
  uint64_t v0;
  uint64_t v1;

  sub_22DFDCEFC();
  sub_22DFCED9C((uint64_t)&qword_255DD7638);
  OUTLINED_FUNCTION_163_0();
  sub_22DFDD4B4();
  v0 = OUTLINED_FUNCTION_224_1();
  return sub_22DFD0148(v0, v1);
}

unint64_t sub_22DFCA984()
{
  uint64_t v0;
  uint64_t v1;

  sub_22DFDDB14();
  v0 = OUTLINED_FUNCTION_224_1();
  return sub_22DFD0288(v0, v1);
}

unint64_t sub_22DFCA9B0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  OUTLINED_FUNCTION_56_4();
  OUTLINED_FUNCTION_66_1();
  v4 = OUTLINED_FUNCTION_24_1();
  return sub_22DFD0390(a1, a2, v4);
}

uint64_t sub_22DFCAA08(uint64_t a1)
{
  uint64_t v2;

  OUTLINED_FUNCTION_56_4();
  sub_22DFA6C24(a1);
  OUTLINED_FUNCTION_209_1();
  OUTLINED_FUNCTION_46();
  v2 = OUTLINED_FUNCTION_24_1();
  return sub_22DFD0470(a1, v2);
}

unint64_t sub_22DFCAA6C()
{
  uint64_t v0;
  uint64_t v1;

  sub_22DFDDC40();
  v0 = OUTLINED_FUNCTION_224_1();
  return sub_22DFD0684(v0, v1);
}

unint64_t sub_22DFCAA9C()
{
  unint64_t result;

  result = qword_255DDC8D0;
  if (!qword_255DDC8D0)
  {
    result = MEMORY[0x22E323AEC](&protocol conformance descriptor for CarrySettings.ProfileInfo, &type metadata for CarrySettings.ProfileInfo);
    atomic_store(result, (unint64_t *)&qword_255DDC8D0);
  }
  return result;
}

void sub_22DFCAAD8()
{
  CarrySettings.CarryDevice.appleConnectSettings.getter();
  OUTLINED_FUNCTION_1_2();
}

void sub_22DFCAB08(uint64_t *a1@<X8>)
{
  *a1 = CarrySettings.CarryDevice.profiles.getter();
  OUTLINED_FUNCTION_1_2();
}

uint64_t _s9DataModelVwet()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_22DFCAB54()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v2 = OUTLINED_FUNCTION_158_2();
  return OUTLINED_FUNCTION_12_20(v1, v0, v2);
}

uint64_t _s9DataModelVwst()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_22DFCAB84()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  OUTLINED_FUNCTION_158_2();
  v0 = OUTLINED_FUNCTION_23_13();
  return OUTLINED_FUNCTION_11_20(v0, v1, v2, v3);
}

uint64_t type metadata accessor for CarrySettings.DataModel(uint64_t a1)
{
  return sub_22DF30B80(a1, qword_255DDC930);
}

void _s11CarryDeviceVwCP_0(_QWORD *a1, _QWORD *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v4 = *(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_255DD8C08) - 8);
  if ((*(_DWORD *)(v4 + 80) & 0x20000) != 0)
  {
    *a1 = *a2;
    swift_retain();
  }
  else
  {
    _s20CarryDeviceMergeableVMa(0);
    if (OUTLINED_FUNCTION_27_7())
    {
      memcpy(a1, a2, *(_QWORD *)(v4 + 64));
    }
    else
    {
      v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_255DD80B8);
      OUTLINED_FUNCTION_30_11(*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16));
      OUTLINED_FUNCTION_15_20();
      v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_255DD80C0);
      OUTLINED_FUNCTION_4_27(*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 16));
      OUTLINED_FUNCTION_15_20();
      v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_255DD80C8);
      OUTLINED_FUNCTION_4_27(*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 16));
      OUTLINED_FUNCTION_15_20();
      v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_255DD80D0);
      OUTLINED_FUNCTION_4_27(*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 16));
      OUTLINED_FUNCTION_103_1();
      OUTLINED_FUNCTION_79_0();
    }
  }
  OUTLINED_FUNCTION_13_3();
}

void _s11CarryDeviceVwxx_0(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  OUTLINED_FUNCTION_188_1();
  if (__swift_getEnumTagSinglePayload(a1, 1, v1))
  {
    OUTLINED_FUNCTION_132_0();
  }
  else
  {
    v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_255DD80B8);
    OUTLINED_FUNCTION_30_0(v3);
    v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_255DD80C0);
    OUTLINED_FUNCTION_76_2(v4);
    v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_255DD80C8);
    OUTLINED_FUNCTION_76_2(v5);
    v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_255DD80D0);
    OUTLINED_FUNCTION_76_2(v6);
    OUTLINED_FUNCTION_24_15();
  }
}

void _s11CarryDeviceVwcp_0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  _s20CarryDeviceMergeableVMa(0);
  if (OUTLINED_FUNCTION_27_7())
  {
    v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_255DD8C08);
    OUTLINED_FUNCTION_43_6(v0);
  }
  else
  {
    v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_255DD80B8);
    OUTLINED_FUNCTION_30_11(*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v1 - 8) + 16));
    OUTLINED_FUNCTION_15_20();
    v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_255DD80C0);
    OUTLINED_FUNCTION_4_27(*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 16));
    OUTLINED_FUNCTION_15_20();
    v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_255DD80C8);
    OUTLINED_FUNCTION_4_27(*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 16));
    OUTLINED_FUNCTION_15_20();
    v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_255DD80D0);
    OUTLINED_FUNCTION_4_27(*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16));
    OUTLINED_FUNCTION_103_1();
    OUTLINED_FUNCTION_79_0();
  }
  OUTLINED_FUNCTION_13_3();
}

void _s11CarryDeviceVwca_0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  int EnumTagSinglePayload;
  int v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  v4 = _s20CarryDeviceMergeableVMa(0);
  EnumTagSinglePayload = __swift_getEnumTagSinglePayload(a1, 1, v4);
  v6 = OUTLINED_FUNCTION_27_7();
  if (!EnumTagSinglePayload)
  {
    if (!v6)
    {
      v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_255DD80B8);
      OUTLINED_FUNCTION_30_11(*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 24));
      OUTLINED_FUNCTION_15_20();
      v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_255DD80C0);
      OUTLINED_FUNCTION_4_27(*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v13 - 8) + 24));
      OUTLINED_FUNCTION_15_20();
      v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_255DD80C8);
      OUTLINED_FUNCTION_4_27(*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 24));
      OUTLINED_FUNCTION_15_20();
      v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_255DD80D0);
      OUTLINED_FUNCTION_4_27(*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v15 - 8) + 24));
      *(_QWORD *)(a1 + *(int *)(v4 + 32)) = *(_QWORD *)(a2 + *(int *)(v4 + 32));
      sub_22DFDD448();
      OUTLINED_FUNCTION_46();
      goto LABEL_7;
    }
    sub_22DF58090(a1, _s20CarryDeviceMergeableVMa);
    goto LABEL_6;
  }
  if (v6)
  {
LABEL_6:
    v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_255DD8C08);
    OUTLINED_FUNCTION_43_6(v11);
    goto LABEL_7;
  }
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_255DD80B8);
  OUTLINED_FUNCTION_30_11(*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 16));
  OUTLINED_FUNCTION_15_20();
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_255DD80C0);
  OUTLINED_FUNCTION_4_27(*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 16));
  OUTLINED_FUNCTION_15_20();
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_255DD80C8);
  OUTLINED_FUNCTION_4_27(*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 16));
  OUTLINED_FUNCTION_15_20();
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_255DD80D0);
  OUTLINED_FUNCTION_4_27(*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 16));
  OUTLINED_FUNCTION_103_1();
  OUTLINED_FUNCTION_79_0();
LABEL_7:
  OUTLINED_FUNCTION_13_3();
}

void _s11CarryDeviceVwtk_0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v4 = _s20CarryDeviceMergeableVMa(0);
  if (OUTLINED_FUNCTION_27_7())
  {
    v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_255DD8C08);
    OUTLINED_FUNCTION_43_6(v5);
  }
  else
  {
    v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_255DD80B8);
    OUTLINED_FUNCTION_30_11(*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 32));
    OUTLINED_FUNCTION_15_20();
    v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_255DD80C0);
    OUTLINED_FUNCTION_4_27(*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 32));
    OUTLINED_FUNCTION_15_20();
    v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_255DD80C8);
    OUTLINED_FUNCTION_4_27(*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 32));
    OUTLINED_FUNCTION_15_20();
    v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_255DD80D0);
    OUTLINED_FUNCTION_4_27(*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 32));
    *(_QWORD *)(a1 + *(int *)(v4 + 32)) = *(_QWORD *)(a2 + *(int *)(v4 + 32));
    OUTLINED_FUNCTION_79_0();
  }
  OUTLINED_FUNCTION_13_3();
}

void _s11CarryDeviceVwta_0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  int EnumTagSinglePayload;
  int v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  v4 = _s20CarryDeviceMergeableVMa(0);
  EnumTagSinglePayload = __swift_getEnumTagSinglePayload(a1, 1, v4);
  v6 = OUTLINED_FUNCTION_27_7();
  if (!EnumTagSinglePayload)
  {
    if (!v6)
    {
      v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_255DD80B8);
      OUTLINED_FUNCTION_30_11(*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 40));
      OUTLINED_FUNCTION_15_20();
      v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_255DD80C0);
      OUTLINED_FUNCTION_4_27(*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v13 - 8) + 40));
      OUTLINED_FUNCTION_15_20();
      v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_255DD80C8);
      OUTLINED_FUNCTION_4_27(*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 40));
      OUTLINED_FUNCTION_15_20();
      v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_255DD80D0);
      OUTLINED_FUNCTION_4_27(*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v15 - 8) + 40));
      *(_QWORD *)(a1 + *(int *)(v4 + 32)) = *(_QWORD *)(a2 + *(int *)(v4 + 32));
      swift_bridgeObjectRelease();
      goto LABEL_7;
    }
    sub_22DF58090(a1, _s20CarryDeviceMergeableVMa);
    goto LABEL_6;
  }
  if (v6)
  {
LABEL_6:
    v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_255DD8C08);
    OUTLINED_FUNCTION_43_6(v11);
    goto LABEL_7;
  }
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_255DD80B8);
  OUTLINED_FUNCTION_30_11(*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 32));
  OUTLINED_FUNCTION_15_20();
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_255DD80C0);
  OUTLINED_FUNCTION_4_27(*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 32));
  OUTLINED_FUNCTION_15_20();
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_255DD80C8);
  OUTLINED_FUNCTION_4_27(*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 32));
  OUTLINED_FUNCTION_15_20();
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_255DD80D0);
  OUTLINED_FUNCTION_4_27(*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 32));
  *(_QWORD *)(a1 + *(int *)(v4 + 32)) = *(_QWORD *)(a2 + *(int *)(v4 + 32));
  OUTLINED_FUNCTION_79_0();
LABEL_7:
  OUTLINED_FUNCTION_13_3();
}

uint64_t _s11CarryDeviceVwet()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_22DFCB2A4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  OUTLINED_FUNCTION_157_1();
  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_255DD8C08);
  return OUTLINED_FUNCTION_12_20(v1, v0, v2);
}

uint64_t _s11CarryDeviceVwst()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_22DFCB2E0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  OUTLINED_FUNCTION_157_1();
  __swift_instantiateConcreteTypeFromMangledName(&qword_255DD8C08);
  v0 = OUTLINED_FUNCTION_23_13();
  return OUTLINED_FUNCTION_11_20(v0, v1, v2, v3);
}

void sub_22DFCB308()
{
  unint64_t v0;

  sub_22DFCC570(319, qword_255DD8028, (void (*)(uint64_t))_s20CarryDeviceMergeableVMa);
  if (v0 <= 0x3F)
    swift_initStructMetadata();
}

uint64_t _s21DeviceDisplayMetaDataVwxx(_QWORD *a1)
{
  uint64_t result;

  if (a1[1])
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (a1[9])
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  result = a1[14];
  if (result)
  {
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t _s21DeviceDisplayMetaDataVwcp(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  __int128 v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  __int128 v15;

  v4 = *(_QWORD *)(a2 + 8);
  if (v4)
  {
    *(_QWORD *)a1 = *(_QWORD *)a2;
    *(_QWORD *)(a1 + 8) = v4;
    v5 = *(_QWORD *)(a2 + 24);
    *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
    *(_QWORD *)(a1 + 24) = v5;
    sub_22DFDD448();
    sub_22DFDD448();
  }
  else
  {
    v6 = *(_OWORD *)(a2 + 16);
    *(_OWORD *)a1 = *(_OWORD *)a2;
    *(_OWORD *)(a1 + 16) = v6;
  }
  v7 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v7;
  v8 = *(_QWORD *)(a2 + 56);
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(a1 + 56) = v8;
  v9 = *(_QWORD *)(a2 + 72);
  sub_22DFDD448();
  sub_22DFDD448();
  if (v9)
  {
    *(_QWORD *)(a1 + 64) = *(_QWORD *)(a2 + 64);
    *(_QWORD *)(a1 + 72) = v9;
    v10 = *(_QWORD *)(a2 + 88);
    *(_QWORD *)(a1 + 80) = *(_QWORD *)(a2 + 80);
    *(_QWORD *)(a1 + 88) = v10;
    sub_22DFDD448();
    sub_22DFDD448();
  }
  else
  {
    v11 = *(_OWORD *)(a2 + 80);
    *(_OWORD *)(a1 + 64) = *(_OWORD *)(a2 + 64);
    *(_OWORD *)(a1 + 80) = v11;
  }
  *(_BYTE *)(a1 + 96) = *(_BYTE *)(a2 + 96);
  v12 = *(_QWORD *)(a2 + 112);
  if (v12)
  {
    *(_QWORD *)(a1 + 104) = *(_QWORD *)(a2 + 104);
    *(_QWORD *)(a1 + 112) = v12;
    v13 = *(_QWORD *)(a2 + 120);
    v14 = *(_QWORD *)(a2 + 128);
    *(_QWORD *)(a1 + 120) = v13;
    *(_QWORD *)(a1 + 128) = v14;
    sub_22DFDD448();
    sub_22DFDD448();
  }
  else
  {
    v15 = *(_OWORD *)(a2 + 120);
    *(_OWORD *)(a1 + 104) = *(_OWORD *)(a2 + 104);
    *(_OWORD *)(a1 + 120) = v15;
  }
  return a1;
}

uint64_t _s21DeviceDisplayMetaDataVwca(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  __int128 v5;
  __int128 v6;
  _OWORD *v7;
  _OWORD *v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  _OWORD *v12;
  _OWORD *v13;
  uint64_t v14;
  __int128 v15;
  __int128 v16;

  v4 = *(_QWORD *)(a2 + 8);
  if (*(_QWORD *)(a1 + 8))
  {
    if (v4)
    {
      *(_QWORD *)a1 = *(_QWORD *)a2;
      *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
      sub_22DFDD448();
      swift_bridgeObjectRelease();
      *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
      *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
      sub_22DFDD448();
      swift_bridgeObjectRelease();
    }
    else
    {
      sub_22DFCB750(a1);
      v5 = *(_OWORD *)(a2 + 16);
      *(_OWORD *)a1 = *(_OWORD *)a2;
      *(_OWORD *)(a1 + 16) = v5;
    }
  }
  else if (v4)
  {
    *(_QWORD *)a1 = *(_QWORD *)a2;
    *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
    *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
    *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
    sub_22DFDD448();
    sub_22DFDD448();
  }
  else
  {
    v6 = *(_OWORD *)(a2 + 16);
    *(_OWORD *)a1 = *(_OWORD *)a2;
    *(_OWORD *)(a1 + 16) = v6;
  }
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  sub_22DFDD448();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(a1 + 56) = *(_QWORD *)(a2 + 56);
  sub_22DFDD448();
  swift_bridgeObjectRelease();
  v7 = (_OWORD *)(a1 + 64);
  v8 = (_OWORD *)(a2 + 64);
  v9 = *(_QWORD *)(a2 + 72);
  if (*(_QWORD *)(a1 + 72))
  {
    if (v9)
    {
      *(_QWORD *)(a1 + 64) = *(_QWORD *)(a2 + 64);
      *(_QWORD *)(a1 + 72) = *(_QWORD *)(a2 + 72);
      sub_22DFDD448();
      swift_bridgeObjectRelease();
      *(_QWORD *)(a1 + 80) = *(_QWORD *)(a2 + 80);
      *(_QWORD *)(a1 + 88) = *(_QWORD *)(a2 + 88);
      sub_22DFDD448();
      swift_bridgeObjectRelease();
    }
    else
    {
      sub_22DFCB750(a1 + 64);
      v10 = *(_OWORD *)(a2 + 80);
      *v7 = *v8;
      *(_OWORD *)(a1 + 80) = v10;
    }
  }
  else if (v9)
  {
    *(_QWORD *)(a1 + 64) = *(_QWORD *)(a2 + 64);
    *(_QWORD *)(a1 + 72) = *(_QWORD *)(a2 + 72);
    *(_QWORD *)(a1 + 80) = *(_QWORD *)(a2 + 80);
    *(_QWORD *)(a1 + 88) = *(_QWORD *)(a2 + 88);
    sub_22DFDD448();
    sub_22DFDD448();
  }
  else
  {
    v11 = *(_OWORD *)(a2 + 80);
    *v7 = *v8;
    *(_OWORD *)(a1 + 80) = v11;
  }
  *(_BYTE *)(a1 + 96) = *(_BYTE *)(a2 + 96);
  v12 = (_OWORD *)(a1 + 104);
  v13 = (_OWORD *)(a2 + 104);
  v14 = *(_QWORD *)(a2 + 112);
  if (*(_QWORD *)(a1 + 112))
  {
    if (v14)
    {
      *(_QWORD *)(a1 + 104) = *(_QWORD *)(a2 + 104);
      *(_QWORD *)(a1 + 112) = *(_QWORD *)(a2 + 112);
      sub_22DFDD448();
      swift_bridgeObjectRelease();
      *(_QWORD *)(a1 + 120) = *(_QWORD *)(a2 + 120);
      *(_QWORD *)(a1 + 128) = *(_QWORD *)(a2 + 128);
      sub_22DFDD448();
      swift_bridgeObjectRelease();
    }
    else
    {
      sub_22DFCB750(a1 + 104);
      v15 = *(_OWORD *)(a2 + 120);
      *v12 = *v13;
      *(_OWORD *)(a1 + 120) = v15;
    }
  }
  else if (v14)
  {
    *(_QWORD *)(a1 + 104) = *(_QWORD *)(a2 + 104);
    *(_QWORD *)(a1 + 112) = *(_QWORD *)(a2 + 112);
    *(_QWORD *)(a1 + 120) = *(_QWORD *)(a2 + 120);
    *(_QWORD *)(a1 + 128) = *(_QWORD *)(a2 + 128);
    sub_22DFDD448();
    sub_22DFDD448();
  }
  else
  {
    v16 = *(_OWORD *)(a2 + 120);
    *v12 = *v13;
    *(_OWORD *)(a1 + 120) = v16;
  }
  return a1;
}

uint64_t sub_22DFCB750(uint64_t a1)
{
  _s18LivabilityAudienceV12DeviceFamilyVwxx();
  return a1;
}

void *__swift_memcpy136_8(void *a1, const void *a2)
{
  return memcpy(a1, a2, 0x88uLL);
}

uint64_t _s21DeviceDisplayMetaDataVwta(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  __int128 v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  uint64_t v12;
  uint64_t v13;
  __int128 v14;

  if (*(_QWORD *)(a1 + 8))
  {
    v4 = *(_QWORD *)(a2 + 8);
    if (v4)
    {
      *(_QWORD *)a1 = *(_QWORD *)a2;
      *(_QWORD *)(a1 + 8) = v4;
      swift_bridgeObjectRelease();
      v5 = *(_QWORD *)(a2 + 24);
      *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
      *(_QWORD *)(a1 + 24) = v5;
      swift_bridgeObjectRelease();
      goto LABEL_6;
    }
    sub_22DFCB750(a1);
  }
  v6 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v6;
LABEL_6:
  v7 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v7;
  swift_bridgeObjectRelease();
  v8 = *(_QWORD *)(a2 + 56);
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(a1 + 56) = v8;
  swift_bridgeObjectRelease();
  if (*(_QWORD *)(a1 + 72))
  {
    v9 = *(_QWORD *)(a2 + 72);
    if (v9)
    {
      *(_QWORD *)(a1 + 64) = *(_QWORD *)(a2 + 64);
      *(_QWORD *)(a1 + 72) = v9;
      swift_bridgeObjectRelease();
      v10 = *(_QWORD *)(a2 + 88);
      *(_QWORD *)(a1 + 80) = *(_QWORD *)(a2 + 80);
      *(_QWORD *)(a1 + 88) = v10;
      swift_bridgeObjectRelease();
      goto LABEL_11;
    }
    sub_22DFCB750(a1 + 64);
  }
  v11 = *(_OWORD *)(a2 + 80);
  *(_OWORD *)(a1 + 64) = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 80) = v11;
LABEL_11:
  *(_BYTE *)(a1 + 96) = *(_BYTE *)(a2 + 96);
  if (!*(_QWORD *)(a1 + 112))
  {
LABEL_15:
    v14 = *(_OWORD *)(a2 + 120);
    *(_OWORD *)(a1 + 104) = *(_OWORD *)(a2 + 104);
    *(_OWORD *)(a1 + 120) = v14;
    return a1;
  }
  v12 = *(_QWORD *)(a2 + 112);
  if (!v12)
  {
    sub_22DFCB750(a1 + 104);
    goto LABEL_15;
  }
  *(_QWORD *)(a1 + 104) = *(_QWORD *)(a2 + 104);
  *(_QWORD *)(a1 + 112) = v12;
  swift_bridgeObjectRelease();
  v13 = *(_QWORD *)(a2 + 128);
  *(_QWORD *)(a1 + 120) = *(_QWORD *)(a2 + 120);
  *(_QWORD *)(a1 + 128) = v13;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t _s21DeviceDisplayMetaDataVwet(uint64_t a1, int a2)
{
  unint64_t v2;

  if (a2)
  {
    if (a2 < 0 && *(_BYTE *)(a1 + 136))
    {
      LODWORD(v2) = *(_DWORD *)a1 + 0x7FFFFFFF;
    }
    else
    {
      v2 = *(_QWORD *)(a1 + 40);
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

uint64_t _s21DeviceDisplayMetaDataVwst(uint64_t result, int a2, int a3)
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
    *(_OWORD *)(result + 120) = 0u;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 136) = 1;
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2)
        return result;
LABEL_8:
      *(_QWORD *)(result + 40) = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 136) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

void type metadata accessor for CarrySettings.DeviceDisplayMetaData()
{
  OUTLINED_FUNCTION_32_1();
}

void type metadata accessor for CarrySettings.DeviceGroup()
{
  OUTLINED_FUNCTION_32_1();
}

uint64_t _s11ProfileInfoVwxx()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t _s11ProfileInfoVwcp(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v3 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v3;
  v4 = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = v4;
  *(_WORD *)(a1 + 32) = *(_WORD *)(a2 + 32);
  v5 = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 48) = v5;
  sub_22DFDD448();
  sub_22DFDD448();
  sub_22DFDD448();
  return a1;
}

uint64_t _s11ProfileInfoVwca(uint64_t a1, uint64_t a2)
{
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  sub_22DFDD448();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  sub_22DFDD448();
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + 32) = *(_BYTE *)(a2 + 32);
  *(_BYTE *)(a1 + 33) = *(_BYTE *)(a2 + 33);
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  sub_22DFDD448();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t _s11ProfileInfoVwta(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v4 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  v5 = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = v5;
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + 32) = *(_BYTE *)(a2 + 32);
  *(_BYTE *)(a1 + 33) = *(_BYTE *)(a2 + 33);
  v6 = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 48) = v6;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t _s11ProfileInfoVwet(uint64_t a1, int a2)
{
  unint64_t v2;

  if (a2)
  {
    if (a2 < 0 && *(_BYTE *)(a1 + 56))
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

uint64_t _s11ProfileInfoVwst(uint64_t result, int a2, int a3)
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

void type metadata accessor for CarrySettings.ProfileInfo()
{
  OUTLINED_FUNCTION_32_1();
}

uint64_t _s19ServerConfigurationVwxx(uint64_t a1)
{
  uint64_t result;

  swift_bridgeObjectRelease();
  result = *(_QWORD *)(a1 + 24);
  if (result)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t _s19ServerConfigurationVwcp(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;

  v4 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v4;
  v5 = *(_QWORD *)(a2 + 24);
  sub_22DFDD448();
  if (v5)
  {
    *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
    *(_QWORD *)(a1 + 24) = v5;
    v6 = *(_QWORD *)(a2 + 40);
    *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
    *(_QWORD *)(a1 + 40) = v6;
    *(_WORD *)(a1 + 48) = *(_WORD *)(a2 + 48);
    v7 = *(_QWORD *)(a2 + 56);
    v8 = *(_QWORD *)(a2 + 64);
    *(_QWORD *)(a1 + 56) = v7;
    *(_QWORD *)(a1 + 64) = v8;
    sub_22DFDD448();
    sub_22DFDD448();
    sub_22DFDD448();
  }
  else
  {
    v9 = *(_OWORD *)(a2 + 32);
    *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
    *(_OWORD *)(a1 + 32) = v9;
    *(_OWORD *)(a1 + 48) = *(_OWORD *)(a2 + 48);
    *(_QWORD *)(a1 + 64) = *(_QWORD *)(a2 + 64);
  }
  return a1;
}

uint64_t _s19ServerConfigurationVwca(uint64_t a1, uint64_t a2)
{
  _OWORD *v4;
  __int128 *v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  sub_22DFDD448();
  swift_bridgeObjectRelease();
  v4 = (_OWORD *)(a1 + 16);
  v5 = (__int128 *)(a2 + 16);
  v6 = *(_QWORD *)(a2 + 24);
  if (*(_QWORD *)(a1 + 24))
  {
    if (v6)
    {
      *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
      *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
      sub_22DFDD448();
      swift_bridgeObjectRelease();
      *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
      *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
      sub_22DFDD448();
      swift_bridgeObjectRelease();
      *(_BYTE *)(a1 + 48) = *(_BYTE *)(a2 + 48);
      *(_BYTE *)(a1 + 49) = *(_BYTE *)(a2 + 49);
      *(_QWORD *)(a1 + 56) = *(_QWORD *)(a2 + 56);
      *(_QWORD *)(a1 + 64) = *(_QWORD *)(a2 + 64);
      sub_22DFDD448();
      swift_bridgeObjectRelease();
    }
    else
    {
      sub_22DFCBDDC(a1 + 16);
      v8 = *(_OWORD *)(a2 + 32);
      v7 = *(_OWORD *)(a2 + 48);
      v9 = *v5;
      *(_QWORD *)(a1 + 64) = *(_QWORD *)(a2 + 64);
      *(_OWORD *)(a1 + 32) = v8;
      *(_OWORD *)(a1 + 48) = v7;
      *v4 = v9;
    }
  }
  else if (v6)
  {
    *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
    *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
    *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
    *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
    *(_BYTE *)(a1 + 48) = *(_BYTE *)(a2 + 48);
    *(_BYTE *)(a1 + 49) = *(_BYTE *)(a2 + 49);
    *(_QWORD *)(a1 + 56) = *(_QWORD *)(a2 + 56);
    *(_QWORD *)(a1 + 64) = *(_QWORD *)(a2 + 64);
    sub_22DFDD448();
    sub_22DFDD448();
    sub_22DFDD448();
  }
  else
  {
    v10 = *v5;
    v11 = *(_OWORD *)(a2 + 32);
    v12 = *(_OWORD *)(a2 + 48);
    *(_QWORD *)(a1 + 64) = *(_QWORD *)(a2 + 64);
    *(_OWORD *)(a1 + 32) = v11;
    *(_OWORD *)(a1 + 48) = v12;
    *v4 = v10;
  }
  return a1;
}

uint64_t sub_22DFCBDDC(uint64_t a1)
{
  _s11ProfileInfoVwxx();
  return a1;
}

void *__swift_memcpy72_8(void *a1, const void *a2)
{
  return memcpy(a1, a2, 0x48uLL);
}

uint64_t _s19ServerConfigurationVwta(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;

  v4 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  if (!*(_QWORD *)(a1 + 24))
    goto LABEL_5;
  v5 = *(_QWORD *)(a2 + 24);
  if (!v5)
  {
    sub_22DFCBDDC(a1 + 16);
LABEL_5:
    v8 = *(_OWORD *)(a2 + 32);
    *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
    *(_OWORD *)(a1 + 32) = v8;
    *(_OWORD *)(a1 + 48) = *(_OWORD *)(a2 + 48);
    *(_QWORD *)(a1 + 64) = *(_QWORD *)(a2 + 64);
    return a1;
  }
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = v5;
  swift_bridgeObjectRelease();
  v6 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v6;
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + 48) = *(_BYTE *)(a2 + 48);
  *(_BYTE *)(a1 + 49) = *(_BYTE *)(a2 + 49);
  v7 = *(_QWORD *)(a2 + 64);
  *(_QWORD *)(a1 + 56) = *(_QWORD *)(a2 + 56);
  *(_QWORD *)(a1 + 64) = v7;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t _s19ServerConfigurationVwet(uint64_t a1, unsigned int a2)
{
  int v2;
  unint64_t v3;

  if (a2)
  {
    if (a2 >= 0x7FFFFFFF && *(_BYTE *)(a1 + 72))
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

uint64_t _s19ServerConfigurationVwst(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_QWORD *)result = a2 - 0x7FFFFFFF;
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 72) = 1;
  }
  else
  {
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 72) = 0;
    if (a2)
      *(_QWORD *)(result + 8) = a2;
  }
  return result;
}

void type metadata accessor for CarrySettings.ServerConfiguration()
{
  OUTLINED_FUNCTION_32_1();
}

uint64_t *_s20AppleConnectSettingsVwCP(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t *v3;
  int v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

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
    v7 = *(int *)(a3 + 24);
    v8 = (char *)a1 + v7;
    v9 = (char *)a2 + v7;
    v10 = sub_22DFDCEC0();
    sub_22DFDD448();
    sub_22DFDD448();
    if (__swift_getEnumTagSinglePayload((uint64_t)v9, 1, v10))
    {
      v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_255DD7828);
      memcpy(v8, v9, *(_QWORD *)(*(_QWORD *)(v11 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v10 - 8) + 16))(v8, v9, v10);
      __swift_storeEnumTagSinglePayload((uint64_t)v8, 0, 1, v10);
    }
  }
  return v3;
}

uint64_t _s20AppleConnectSettingsVwxx(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t result;

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v4 = a1 + *(int *)(a2 + 24);
  v5 = sub_22DFDCEC0();
  result = __swift_getEnumTagSinglePayload(v4, 1, v5);
  if (!(_DWORD)result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(v4, v5);
  return result;
}

_QWORD *_s20AppleConnectSettingsVwcp(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;

  v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  v5 = a2[3];
  a1[2] = a2[2];
  a1[3] = v5;
  v6 = *(int *)(a3 + 24);
  v7 = (char *)a1 + v6;
  v8 = (char *)a2 + v6;
  v9 = sub_22DFDCEC0();
  sub_22DFDD448();
  sub_22DFDD448();
  if (__swift_getEnumTagSinglePayload((uint64_t)v8, 1, v9))
  {
    v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_255DD7828);
    memcpy(v7, v8, *(_QWORD *)(*(_QWORD *)(v10 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v9 - 8) + 16))(v7, v8, v9);
    __swift_storeEnumTagSinglePayload((uint64_t)v7, 0, 1, v9);
  }
  return a1;
}

_QWORD *_s20AppleConnectSettingsVwca(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v6;
  char *v7;
  char *v8;
  uint64_t v9;
  int EnumTagSinglePayload;
  int v11;
  uint64_t v12;
  uint64_t v13;

  *a1 = *a2;
  a1[1] = a2[1];
  sub_22DFDD448();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  a1[3] = a2[3];
  sub_22DFDD448();
  swift_bridgeObjectRelease();
  v6 = *(int *)(a3 + 24);
  v7 = (char *)a1 + v6;
  v8 = (char *)a2 + v6;
  v9 = sub_22DFDCEC0();
  EnumTagSinglePayload = __swift_getEnumTagSinglePayload((uint64_t)v7, 1, v9);
  v11 = __swift_getEnumTagSinglePayload((uint64_t)v8, 1, v9);
  if (!EnumTagSinglePayload)
  {
    v12 = *(_QWORD *)(v9 - 8);
    if (!v11)
    {
      (*(void (**)(char *, char *, uint64_t))(v12 + 24))(v7, v8, v9);
      return a1;
    }
    (*(void (**)(char *, uint64_t))(v12 + 8))(v7, v9);
    goto LABEL_6;
  }
  if (v11)
  {
LABEL_6:
    v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_255DD7828);
    memcpy(v7, v8, *(_QWORD *)(*(_QWORD *)(v13 - 8) + 64));
    return a1;
  }
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v9 - 8) + 16))(v7, v8, v9);
  __swift_storeEnumTagSinglePayload((uint64_t)v7, 0, 1, v9);
  return a1;
}

_OWORD *_s20AppleConnectSettingsVwtk(_OWORD *a1, _OWORD *a2, uint64_t a3)
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
  v5 = *(int *)(a3 + 24);
  v6 = (char *)a1 + v5;
  v7 = (char *)a2 + v5;
  v8 = sub_22DFDCEC0();
  if (__swift_getEnumTagSinglePayload((uint64_t)v7, 1, v8))
  {
    v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_255DD7828);
    memcpy(v6, v7, *(_QWORD *)(*(_QWORD *)(v9 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v8 - 8) + 32))(v6, v7, v8);
    __swift_storeEnumTagSinglePayload((uint64_t)v6, 0, 1, v8);
  }
  return a1;
}

_QWORD *_s20AppleConnectSettingsVwta(_QWORD *a1, _QWORD *a2, uint64_t a3)
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

  v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  swift_bridgeObjectRelease();
  v7 = a2[3];
  a1[2] = a2[2];
  a1[3] = v7;
  swift_bridgeObjectRelease();
  v8 = *(int *)(a3 + 24);
  v9 = (char *)a1 + v8;
  v10 = (char *)a2 + v8;
  v11 = sub_22DFDCEC0();
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
    goto LABEL_6;
  }
  if (v13)
  {
LABEL_6:
    v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_255DD7828);
    memcpy(v9, v10, *(_QWORD *)(*(_QWORD *)(v15 - 8) + 64));
    return a1;
  }
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v11 - 8) + 32))(v9, v10, v11);
  __swift_storeEnumTagSinglePayload((uint64_t)v9, 0, 1, v11);
  return a1;
}

uint64_t _s20AppleConnectSettingsVwet()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t _s20AppleConnectSettingsVwst()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

void sub_22DFCC4E4()
{
  unint64_t v0;

  sub_22DFCC570(319, qword_255DD78F8, (void (*)(uint64_t))MEMORY[0x24BDCE900]);
  if (v0 <= 0x3F)
    swift_initStructMetadata();
}

void sub_22DFCC570(uint64_t a1, unint64_t *a2, void (*a3)(uint64_t))
{
  unint64_t v4;
  uint64_t v5;

  if (!*a2)
  {
    a3(255);
    OUTLINED_FUNCTION_224_1();
    v4 = sub_22DFDDB2C();
    if (!v5)
      atomic_store(v4, a2);
  }
  OUTLINED_FUNCTION_1_2();
}

uint64_t sub_22DFCC5B4(uint64_t a1)
{
  swift_bridgeObjectRelease();
  if (*(_QWORD *)(a1 + 24))
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  return swift_bridgeObjectRelease();
}

uint64_t sub_22DFCC600(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;

  v4 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v4;
  v5 = *(_QWORD *)(a2 + 24);
  sub_22DFDD448();
  if (v5)
  {
    *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
    *(_QWORD *)(a1 + 24) = v5;
    v6 = *(_QWORD *)(a2 + 40);
    *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
    *(_QWORD *)(a1 + 40) = v6;
    *(_WORD *)(a1 + 48) = *(_WORD *)(a2 + 48);
    v7 = *(_QWORD *)(a2 + 64);
    *(_QWORD *)(a1 + 56) = *(_QWORD *)(a2 + 56);
    *(_QWORD *)(a1 + 64) = v7;
    *(_QWORD *)(a1 + 72) = *(_QWORD *)(a2 + 72);
    sub_22DFDD448();
    sub_22DFDD448();
    sub_22DFDD448();
    sub_22DFDD448();
  }
  else
  {
    v8 = *(_OWORD *)(a2 + 32);
    *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
    *(_OWORD *)(a1 + 32) = v8;
    v9 = *(_OWORD *)(a2 + 64);
    *(_OWORD *)(a1 + 48) = *(_OWORD *)(a2 + 48);
    *(_OWORD *)(a1 + 64) = v9;
  }
  *(_QWORD *)(a1 + 80) = *(_QWORD *)(a2 + 80);
  sub_22DFDD448();
  return a1;
}

uint64_t sub_22DFCC6B8(uint64_t a1, uint64_t a2)
{
  _OWORD *v4;
  __int128 *v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  sub_22DFDD448();
  swift_bridgeObjectRelease();
  v4 = (_OWORD *)(a1 + 16);
  v5 = (__int128 *)(a2 + 16);
  v6 = *(_QWORD *)(a2 + 24);
  if (*(_QWORD *)(a1 + 24))
  {
    if (v6)
    {
      *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
      *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
      sub_22DFDD448();
      swift_bridgeObjectRelease();
      *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
      *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
      sub_22DFDD448();
      swift_bridgeObjectRelease();
      *(_BYTE *)(a1 + 48) = *(_BYTE *)(a2 + 48);
      *(_BYTE *)(a1 + 49) = *(_BYTE *)(a2 + 49);
      *(_QWORD *)(a1 + 56) = *(_QWORD *)(a2 + 56);
      *(_QWORD *)(a1 + 64) = *(_QWORD *)(a2 + 64);
      sub_22DFDD448();
      swift_bridgeObjectRelease();
      *(_QWORD *)(a1 + 72) = *(_QWORD *)(a2 + 72);
      sub_22DFDD448();
      swift_bridgeObjectRelease();
    }
    else
    {
      sub_22DFCC85C(a1 + 16);
      v7 = *(_OWORD *)(a2 + 64);
      v9 = *v5;
      v8 = *(_OWORD *)(a2 + 32);
      *(_OWORD *)(a1 + 48) = *(_OWORD *)(a2 + 48);
      *(_OWORD *)(a1 + 64) = v7;
      *v4 = v9;
      *(_OWORD *)(a1 + 32) = v8;
    }
  }
  else if (v6)
  {
    *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
    *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
    *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
    *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
    *(_BYTE *)(a1 + 48) = *(_BYTE *)(a2 + 48);
    *(_BYTE *)(a1 + 49) = *(_BYTE *)(a2 + 49);
    *(_QWORD *)(a1 + 56) = *(_QWORD *)(a2 + 56);
    *(_QWORD *)(a1 + 64) = *(_QWORD *)(a2 + 64);
    *(_QWORD *)(a1 + 72) = *(_QWORD *)(a2 + 72);
    sub_22DFDD448();
    sub_22DFDD448();
    sub_22DFDD448();
    sub_22DFDD448();
  }
  else
  {
    v10 = *v5;
    v11 = *(_OWORD *)(a2 + 32);
    v12 = *(_OWORD *)(a2 + 64);
    *(_OWORD *)(a1 + 48) = *(_OWORD *)(a2 + 48);
    *(_OWORD *)(a1 + 64) = v12;
    *v4 = v10;
    *(_OWORD *)(a1 + 32) = v11;
  }
  *(_QWORD *)(a1 + 80) = *(_QWORD *)(a2 + 80);
  sub_22DFDD448();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_22DFCC85C(uint64_t a1)
{
  sub_22DFCE304();
  return a1;
}

void *__swift_memcpy88_8(void *a1, const void *a2)
{
  return memcpy(a1, a2, 0x58uLL);
}

uint64_t sub_22DFCC890(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;

  v4 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  if (!*(_QWORD *)(a1 + 24))
    goto LABEL_5;
  v5 = *(_QWORD *)(a2 + 24);
  if (!v5)
  {
    sub_22DFCC85C(a1 + 16);
LABEL_5:
    v8 = *(_OWORD *)(a2 + 32);
    *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
    *(_OWORD *)(a1 + 32) = v8;
    v9 = *(_OWORD *)(a2 + 64);
    *(_OWORD *)(a1 + 48) = *(_OWORD *)(a2 + 48);
    *(_OWORD *)(a1 + 64) = v9;
    goto LABEL_6;
  }
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = v5;
  swift_bridgeObjectRelease();
  v6 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v6;
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + 48) = *(_BYTE *)(a2 + 48);
  *(_BYTE *)(a1 + 49) = *(_BYTE *)(a2 + 49);
  v7 = *(_QWORD *)(a2 + 64);
  *(_QWORD *)(a1 + 56) = *(_QWORD *)(a2 + 56);
  *(_QWORD *)(a1 + 64) = v7;
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 72) = *(_QWORD *)(a2 + 72);
  swift_bridgeObjectRelease();
LABEL_6:
  *(_QWORD *)(a1 + 80) = *(_QWORD *)(a2 + 80);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_22DFCC95C(uint64_t a1, int a2)
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
      v2 = *(_QWORD *)(a1 + 80);
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

uint64_t sub_22DFCC99C(uint64_t result, int a2, int a3)
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
      *(_QWORD *)(result + 80) = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 88) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

void _s28ServerConfigurationMergeableVMa()
{
  OUTLINED_FUNCTION_32_1();
}

uint64_t sub_22DFCC9FC(_QWORD *a1)
{
  if (a1[1])
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (a1[10])
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  if (a1[16])
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  return swift_bridgeObjectRelease();
}

uint64_t sub_22DFCCA80(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  __int128 v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  uint64_t v12;
  uint64_t v13;
  __int128 v14;

  v4 = *(_QWORD *)(a2 + 8);
  if (v4)
  {
    *(_QWORD *)a1 = *(_QWORD *)a2;
    *(_QWORD *)(a1 + 8) = v4;
    v5 = *(_QWORD *)(a2 + 24);
    *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
    *(_QWORD *)(a1 + 24) = v5;
    *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
    sub_22DFDD448();
    sub_22DFDD448();
    sub_22DFDD448();
  }
  else
  {
    v6 = *(_OWORD *)(a2 + 16);
    *(_OWORD *)a1 = *(_OWORD *)a2;
    *(_OWORD *)(a1 + 16) = v6;
    *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  }
  v7 = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 48) = v7;
  v8 = *(_QWORD *)(a2 + 64);
  *(_QWORD *)(a1 + 56) = *(_QWORD *)(a2 + 56);
  *(_QWORD *)(a1 + 64) = v8;
  v9 = *(_QWORD *)(a2 + 80);
  sub_22DFDD448();
  sub_22DFDD448();
  if (v9)
  {
    *(_QWORD *)(a1 + 72) = *(_QWORD *)(a2 + 72);
    *(_QWORD *)(a1 + 80) = v9;
    v10 = *(_QWORD *)(a2 + 96);
    *(_QWORD *)(a1 + 88) = *(_QWORD *)(a2 + 88);
    *(_QWORD *)(a1 + 96) = v10;
    *(_QWORD *)(a1 + 104) = *(_QWORD *)(a2 + 104);
    sub_22DFDD448();
    sub_22DFDD448();
    sub_22DFDD448();
  }
  else
  {
    v11 = *(_OWORD *)(a2 + 88);
    *(_OWORD *)(a1 + 72) = *(_OWORD *)(a2 + 72);
    *(_OWORD *)(a1 + 88) = v11;
    *(_QWORD *)(a1 + 104) = *(_QWORD *)(a2 + 104);
  }
  *(_BYTE *)(a1 + 112) = *(_BYTE *)(a2 + 112);
  v12 = *(_QWORD *)(a2 + 128);
  if (v12)
  {
    *(_QWORD *)(a1 + 120) = *(_QWORD *)(a2 + 120);
    *(_QWORD *)(a1 + 128) = v12;
    v13 = *(_QWORD *)(a2 + 144);
    *(_QWORD *)(a1 + 136) = *(_QWORD *)(a2 + 136);
    *(_QWORD *)(a1 + 144) = v13;
    *(_QWORD *)(a1 + 152) = *(_QWORD *)(a2 + 152);
    sub_22DFDD448();
    sub_22DFDD448();
    sub_22DFDD448();
  }
  else
  {
    v14 = *(_OWORD *)(a2 + 136);
    *(_OWORD *)(a1 + 120) = *(_OWORD *)(a2 + 120);
    *(_OWORD *)(a1 + 136) = v14;
    *(_QWORD *)(a1 + 152) = *(_QWORD *)(a2 + 152);
  }
  *(_QWORD *)(a1 + 160) = *(_QWORD *)(a2 + 160);
  sub_22DFDD448();
  return a1;
}

uint64_t sub_22DFCCBD0(uint64_t a1, __int128 *a2)
{
  uint64_t v4;
  uint64_t v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  _OWORD *v9;
  _OWORD *v10;
  uint64_t v11;
  uint64_t v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _OWORD *v16;
  _OWORD *v17;
  uint64_t v18;
  uint64_t v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;

  v4 = *((_QWORD *)a2 + 1);
  if (*(_QWORD *)(a1 + 8))
  {
    if (v4)
    {
      *(_QWORD *)a1 = *(_QWORD *)a2;
      *(_QWORD *)(a1 + 8) = *((_QWORD *)a2 + 1);
      sub_22DFDD448();
      swift_bridgeObjectRelease();
      *(_QWORD *)(a1 + 16) = *((_QWORD *)a2 + 2);
      *(_QWORD *)(a1 + 24) = *((_QWORD *)a2 + 3);
      sub_22DFDD448();
      swift_bridgeObjectRelease();
      *(_QWORD *)(a1 + 32) = *((_QWORD *)a2 + 4);
      sub_22DFDD448();
      swift_bridgeObjectRelease();
    }
    else
    {
      sub_22DFCCEFC(a1);
      v5 = *((_QWORD *)a2 + 4);
      v6 = a2[1];
      *(_OWORD *)a1 = *a2;
      *(_OWORD *)(a1 + 16) = v6;
      *(_QWORD *)(a1 + 32) = v5;
    }
  }
  else if (v4)
  {
    *(_QWORD *)a1 = *(_QWORD *)a2;
    *(_QWORD *)(a1 + 8) = *((_QWORD *)a2 + 1);
    *(_QWORD *)(a1 + 16) = *((_QWORD *)a2 + 2);
    *(_QWORD *)(a1 + 24) = *((_QWORD *)a2 + 3);
    *(_QWORD *)(a1 + 32) = *((_QWORD *)a2 + 4);
    sub_22DFDD448();
    sub_22DFDD448();
    sub_22DFDD448();
  }
  else
  {
    v7 = *a2;
    v8 = a2[1];
    *(_QWORD *)(a1 + 32) = *((_QWORD *)a2 + 4);
    *(_OWORD *)a1 = v7;
    *(_OWORD *)(a1 + 16) = v8;
  }
  *(_QWORD *)(a1 + 40) = *((_QWORD *)a2 + 5);
  *(_QWORD *)(a1 + 48) = *((_QWORD *)a2 + 6);
  sub_22DFDD448();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 56) = *((_QWORD *)a2 + 7);
  *(_QWORD *)(a1 + 64) = *((_QWORD *)a2 + 8);
  sub_22DFDD448();
  swift_bridgeObjectRelease();
  v9 = (_OWORD *)(a1 + 72);
  v10 = (__int128 *)((char *)a2 + 72);
  v11 = *((_QWORD *)a2 + 10);
  if (*(_QWORD *)(a1 + 80))
  {
    if (v11)
    {
      *(_QWORD *)(a1 + 72) = *((_QWORD *)a2 + 9);
      *(_QWORD *)(a1 + 80) = *((_QWORD *)a2 + 10);
      sub_22DFDD448();
      swift_bridgeObjectRelease();
      *(_QWORD *)(a1 + 88) = *((_QWORD *)a2 + 11);
      *(_QWORD *)(a1 + 96) = *((_QWORD *)a2 + 12);
      sub_22DFDD448();
      swift_bridgeObjectRelease();
      *(_QWORD *)(a1 + 104) = *((_QWORD *)a2 + 13);
      sub_22DFDD448();
      swift_bridgeObjectRelease();
    }
    else
    {
      sub_22DFCCEFC(a1 + 72);
      v12 = *((_QWORD *)a2 + 13);
      v13 = *(__int128 *)((char *)a2 + 88);
      *v9 = *v10;
      *(_OWORD *)(a1 + 88) = v13;
      *(_QWORD *)(a1 + 104) = v12;
    }
  }
  else if (v11)
  {
    *(_QWORD *)(a1 + 72) = *((_QWORD *)a2 + 9);
    *(_QWORD *)(a1 + 80) = *((_QWORD *)a2 + 10);
    *(_QWORD *)(a1 + 88) = *((_QWORD *)a2 + 11);
    *(_QWORD *)(a1 + 96) = *((_QWORD *)a2 + 12);
    *(_QWORD *)(a1 + 104) = *((_QWORD *)a2 + 13);
    sub_22DFDD448();
    sub_22DFDD448();
    sub_22DFDD448();
  }
  else
  {
    v14 = *v10;
    v15 = *(__int128 *)((char *)a2 + 88);
    *(_QWORD *)(a1 + 104) = *((_QWORD *)a2 + 13);
    *v9 = v14;
    *(_OWORD *)(a1 + 88) = v15;
  }
  *(_BYTE *)(a1 + 112) = *((_BYTE *)a2 + 112);
  v16 = (_OWORD *)(a1 + 120);
  v17 = (__int128 *)((char *)a2 + 120);
  v18 = *((_QWORD *)a2 + 16);
  if (*(_QWORD *)(a1 + 128))
  {
    if (v18)
    {
      *(_QWORD *)(a1 + 120) = *((_QWORD *)a2 + 15);
      *(_QWORD *)(a1 + 128) = *((_QWORD *)a2 + 16);
      sub_22DFDD448();
      swift_bridgeObjectRelease();
      *(_QWORD *)(a1 + 136) = *((_QWORD *)a2 + 17);
      *(_QWORD *)(a1 + 144) = *((_QWORD *)a2 + 18);
      sub_22DFDD448();
      swift_bridgeObjectRelease();
      *(_QWORD *)(a1 + 152) = *((_QWORD *)a2 + 19);
      sub_22DFDD448();
      swift_bridgeObjectRelease();
    }
    else
    {
      sub_22DFCCEFC(a1 + 120);
      v19 = *((_QWORD *)a2 + 19);
      v20 = *(__int128 *)((char *)a2 + 136);
      *v16 = *v17;
      *(_OWORD *)(a1 + 136) = v20;
      *(_QWORD *)(a1 + 152) = v19;
    }
  }
  else if (v18)
  {
    *(_QWORD *)(a1 + 120) = *((_QWORD *)a2 + 15);
    *(_QWORD *)(a1 + 128) = *((_QWORD *)a2 + 16);
    *(_QWORD *)(a1 + 136) = *((_QWORD *)a2 + 17);
    *(_QWORD *)(a1 + 144) = *((_QWORD *)a2 + 18);
    *(_QWORD *)(a1 + 152) = *((_QWORD *)a2 + 19);
    sub_22DFDD448();
    sub_22DFDD448();
    sub_22DFDD448();
  }
  else
  {
    v21 = *v17;
    v22 = *(__int128 *)((char *)a2 + 136);
    *(_QWORD *)(a1 + 152) = *((_QWORD *)a2 + 19);
    *v16 = v21;
    *(_OWORD *)(a1 + 136) = v22;
  }
  *(_QWORD *)(a1 + 160) = *((_QWORD *)a2 + 20);
  sub_22DFDD448();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_22DFCCEFC(uint64_t a1)
{
  _s24LivabilityTrainAudiencesVwxx();
  return a1;
}

void *__swift_memcpy168_8(void *a1, const void *a2)
{
  return memcpy(a1, a2, 0xA8uLL);
}

uint64_t sub_22DFCCF30(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  __int128 v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  uint64_t v12;
  uint64_t v13;
  __int128 v14;

  if (*(_QWORD *)(a1 + 8))
  {
    v4 = *(_QWORD *)(a2 + 8);
    if (v4)
    {
      *(_QWORD *)a1 = *(_QWORD *)a2;
      *(_QWORD *)(a1 + 8) = v4;
      swift_bridgeObjectRelease();
      v5 = *(_QWORD *)(a2 + 24);
      *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
      *(_QWORD *)(a1 + 24) = v5;
      swift_bridgeObjectRelease();
      *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
      swift_bridgeObjectRelease();
      goto LABEL_6;
    }
    sub_22DFCCEFC(a1);
  }
  v6 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v6;
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
LABEL_6:
  v7 = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 48) = v7;
  swift_bridgeObjectRelease();
  v8 = *(_QWORD *)(a2 + 64);
  *(_QWORD *)(a1 + 56) = *(_QWORD *)(a2 + 56);
  *(_QWORD *)(a1 + 64) = v8;
  swift_bridgeObjectRelease();
  if (*(_QWORD *)(a1 + 80))
  {
    v9 = *(_QWORD *)(a2 + 80);
    if (v9)
    {
      *(_QWORD *)(a1 + 72) = *(_QWORD *)(a2 + 72);
      *(_QWORD *)(a1 + 80) = v9;
      swift_bridgeObjectRelease();
      v10 = *(_QWORD *)(a2 + 96);
      *(_QWORD *)(a1 + 88) = *(_QWORD *)(a2 + 88);
      *(_QWORD *)(a1 + 96) = v10;
      swift_bridgeObjectRelease();
      *(_QWORD *)(a1 + 104) = *(_QWORD *)(a2 + 104);
      swift_bridgeObjectRelease();
      goto LABEL_11;
    }
    sub_22DFCCEFC(a1 + 72);
  }
  v11 = *(_OWORD *)(a2 + 88);
  *(_OWORD *)(a1 + 72) = *(_OWORD *)(a2 + 72);
  *(_OWORD *)(a1 + 88) = v11;
  *(_QWORD *)(a1 + 104) = *(_QWORD *)(a2 + 104);
LABEL_11:
  *(_BYTE *)(a1 + 112) = *(_BYTE *)(a2 + 112);
  if (!*(_QWORD *)(a1 + 128))
  {
LABEL_15:
    v14 = *(_OWORD *)(a2 + 136);
    *(_OWORD *)(a1 + 120) = *(_OWORD *)(a2 + 120);
    *(_OWORD *)(a1 + 136) = v14;
    *(_QWORD *)(a1 + 152) = *(_QWORD *)(a2 + 152);
    goto LABEL_16;
  }
  v12 = *(_QWORD *)(a2 + 128);
  if (!v12)
  {
    sub_22DFCCEFC(a1 + 120);
    goto LABEL_15;
  }
  *(_QWORD *)(a1 + 120) = *(_QWORD *)(a2 + 120);
  *(_QWORD *)(a1 + 128) = v12;
  swift_bridgeObjectRelease();
  v13 = *(_QWORD *)(a2 + 144);
  *(_QWORD *)(a1 + 136) = *(_QWORD *)(a2 + 136);
  *(_QWORD *)(a1 + 144) = v13;
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 152) = *(_QWORD *)(a2 + 152);
  swift_bridgeObjectRelease();
LABEL_16:
  *(_QWORD *)(a1 + 160) = *(_QWORD *)(a2 + 160);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_22DFCD0AC(uint64_t a1, int a2)
{
  unint64_t v2;

  if (a2)
  {
    if (a2 < 0 && *(_BYTE *)(a1 + 168))
    {
      LODWORD(v2) = *(_DWORD *)a1 + 0x7FFFFFFF;
    }
    else
    {
      v2 = *(_QWORD *)(a1 + 48);
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

uint64_t sub_22DFCD0EC(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 136) = 0u;
    *(_OWORD *)(result + 152) = 0u;
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
      *(_BYTE *)(result + 168) = 1;
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
    *(_BYTE *)(result + 168) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

void _s30DeviceDisplayMetaDataMergeableVMa()
{
  OUTLINED_FUNCTION_32_1();
}

void _s20DeviceGroupMergeableVMa()
{
  OUTLINED_FUNCTION_32_1();
}

uint64_t *sub_22DFCD16C(uint64_t *a1, uint64_t *a2, int *a3)
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
    v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_255DD80B8);
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a1, a2, v7);
    v8 = a3[5];
    v9 = (char *)a1 + v8;
    v10 = (char *)a2 + v8;
    v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_255DD80C0);
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v11 - 8) + 16))(v9, v10, v11);
    v12 = a3[6];
    v13 = (char *)a1 + v12;
    v14 = (char *)a2 + v12;
    v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_255DD80C8);
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v15 - 8) + 16))(v13, v14, v15);
    v16 = a3[7];
    v17 = (char *)a1 + v16;
    v18 = (char *)a2 + v16;
    v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_255DD80D0);
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v19 - 8) + 16))(v17, v18, v19);
    *(uint64_t *)((char *)a1 + a3[8]) = *(uint64_t *)((char *)a2 + a3[8]);
    sub_22DFDD448();
  }
  return a1;
}

uint64_t sub_22DFCD294(uint64_t a1, int *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_255DD80B8);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(a1, v4);
  v5 = a1 + a2[5];
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_255DD80C0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 8))(v5, v6);
  v7 = a1 + a2[6];
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_255DD80C8);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 8))(v7, v8);
  v9 = a1 + a2[7];
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_255DD80D0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 8))(v9, v10);
  return swift_bridgeObjectRelease();
}

uint64_t sub_22DFCD35C(uint64_t a1, uint64_t a2, int *a3)
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

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_255DD80B8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(a1, a2, v6);
  v7 = a3[5];
  v8 = a1 + v7;
  v9 = a2 + v7;
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_255DD80C0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 16))(v8, v9, v10);
  v11 = a3[6];
  v12 = a1 + v11;
  v13 = a2 + v11;
  v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_255DD80C8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 16))(v12, v13, v14);
  v15 = a3[7];
  v16 = a1 + v15;
  v17 = a2 + v15;
  v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_255DD80D0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v18 - 8) + 16))(v16, v17, v18);
  *(_QWORD *)(a1 + a3[8]) = *(_QWORD *)(a2 + a3[8]);
  sub_22DFDD448();
  return a1;
}

uint64_t sub_22DFCD458(uint64_t a1, uint64_t a2, int *a3)
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

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_255DD80B8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 24))(a1, a2, v6);
  v7 = a3[5];
  v8 = a1 + v7;
  v9 = a2 + v7;
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_255DD80C0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 24))(v8, v9, v10);
  v11 = a3[6];
  v12 = a1 + v11;
  v13 = a2 + v11;
  v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_255DD80C8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 24))(v12, v13, v14);
  v15 = a3[7];
  v16 = a1 + v15;
  v17 = a2 + v15;
  v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_255DD80D0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v18 - 8) + 24))(v16, v17, v18);
  *(_QWORD *)(a1 + a3[8]) = *(_QWORD *)(a2 + a3[8]);
  sub_22DFDD448();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_22DFCD560(uint64_t a1, uint64_t a2, int *a3)
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

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_255DD80B8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 32))(a1, a2, v6);
  v7 = a3[5];
  v8 = a1 + v7;
  v9 = a2 + v7;
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_255DD80C0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 32))(v8, v9, v10);
  v11 = a3[6];
  v12 = a1 + v11;
  v13 = a2 + v11;
  v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_255DD80C8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 32))(v12, v13, v14);
  v15 = a3[7];
  v16 = a1 + v15;
  v17 = a2 + v15;
  v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_255DD80D0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v18 - 8) + 32))(v16, v17, v18);
  *(_QWORD *)(a1 + a3[8]) = *(_QWORD *)(a2 + a3[8]);
  return a1;
}

uint64_t sub_22DFCD658(uint64_t a1, uint64_t a2, int *a3)
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

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_255DD80B8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 40))(a1, a2, v6);
  v7 = a3[5];
  v8 = a1 + v7;
  v9 = a2 + v7;
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_255DD80C0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 40))(v8, v9, v10);
  v11 = a3[6];
  v12 = a1 + v11;
  v13 = a2 + v11;
  v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_255DD80C8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 40))(v12, v13, v14);
  v15 = a3[7];
  v16 = a1 + v15;
  v17 = a2 + v15;
  v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_255DD80D0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v18 - 8) + 40))(v16, v17, v18);
  *(_QWORD *)(a1 + a3[8]) = *(_QWORD *)(a2 + a3[8]);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_22DFCD758()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

void sub_22DFCD764(uint64_t a1, uint64_t a2, int *a3)
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

  OUTLINED_FUNCTION_157_1();
  __swift_instantiateConcreteTypeFromMangledName(&qword_255DD80B8);
  OUTLINED_FUNCTION_125_2();
  if (v9)
  {
    v7 = v6;
    v8 = v4;
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_255DD80C0);
    OUTLINED_FUNCTION_125_2();
    if (v9)
    {
      v7 = v10;
      v11 = a3[5];
    }
    else
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_255DD80C8);
      OUTLINED_FUNCTION_125_2();
      if (v12)
      {
        v7 = v13;
        v11 = a3[6];
      }
      else
      {
        __swift_instantiateConcreteTypeFromMangledName(&qword_255DD80D0);
        OUTLINED_FUNCTION_125_2();
        if (!v14)
        {
          OUTLINED_FUNCTION_105_2(*(_QWORD *)(v4 + a3[8]));
          OUTLINED_FUNCTION_132_0();
          return;
        }
        v7 = v15;
        v11 = a3[7];
      }
    }
    v8 = v4 + v11;
  }
  OUTLINED_FUNCTION_54_6(v8, v3, v7);
}

uint64_t sub_22DFCD81C()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

void sub_22DFCD828(uint64_t a1, uint64_t a2, uint64_t a3, int *a4)
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

  OUTLINED_FUNCTION_157_1();
  __swift_instantiateConcreteTypeFromMangledName(&qword_255DD80B8);
  OUTLINED_FUNCTION_87_2();
  if (v10)
  {
    v8 = v7;
    v9 = v5;
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_255DD80C0);
    OUTLINED_FUNCTION_87_2();
    if (v10)
    {
      v8 = v11;
      v12 = a4[5];
    }
    else
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_255DD80C8);
      OUTLINED_FUNCTION_87_2();
      if (v13)
      {
        v8 = v14;
        v12 = a4[6];
      }
      else
      {
        __swift_instantiateConcreteTypeFromMangledName(&qword_255DD80D0);
        OUTLINED_FUNCTION_87_2();
        if (!v15)
        {
          *(_QWORD *)(v5 + a4[8]) = (v4 - 1);
          OUTLINED_FUNCTION_132_0();
          return;
        }
        v8 = v16;
        v12 = a4[7];
      }
    }
    v9 = v5 + v12;
  }
  OUTLINED_FUNCTION_53_7(v9, v4, v4, v8);
}

void sub_22DFCD8E8()
{
  unint64_t v0;
  unint64_t v1;
  unint64_t v2;
  unint64_t v3;

  sub_22DFCD9F0();
  if (v0 <= 0x3F)
  {
    sub_22DFCDA54(319, &qword_255DDCB00, qword_255DD8C10, (uint64_t)&qword_255DDAE50);
    if (v1 <= 0x3F)
    {
      sub_22DFCDAD0();
      if (v2 <= 0x3F)
      {
        sub_22DFCDA54(319, qword_255DDCB10, &qword_255DDAE70, (uint64_t)&qword_255DDAE78);
        if (v3 <= 0x3F)
          swift_initStructMetadata();
      }
    }
  }
}

void sub_22DFCD9F0()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_255DDCAF8)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_255DD8C00);
    sub_22DF95838();
    v0 = sub_22DFDD094();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_255DDCAF8);
  }
}

void sub_22DFCDA54(uint64_t a1, unint64_t *a2, uint64_t *a3, uint64_t a4)
{
  unint64_t v6;
  uint64_t v7;

  if (!*a2)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(a3);
    sub_22DFCDB5C(a4);
    OUTLINED_FUNCTION_183_1();
    v6 = sub_22DFDD094();
    if (!v7)
      atomic_store(v6, a2);
  }
}

void sub_22DFCDAD0()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_255DDCB08)
  {
    sub_22DF95940();
    sub_22DF9597C();
    v0 = sub_22DFDD25C();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_255DDCB08);
  }
}

unint64_t sub_22DFCDB5C(uint64_t a1)
{
  unint64_t *v1;
  uint64_t (*v2)(void);
  unint64_t result;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;

  result = OUTLINED_FUNCTION_212_1(a1);
  if (!result)
  {
    v5 = OUTLINED_FUNCTION_15_14(0, v4);
    v6 = v2();
    result = MEMORY[0x22E323AEC](MEMORY[0x24BE18AE8], v5, &v6);
    atomic_store(result, v1);
  }
  return result;
}

uint64_t *sub_22DFCDBB4(uint64_t *a1, uint64_t *a2, uint64_t a3)
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
  uint64_t v14;

  v4 = a1;
  v5 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v14 = *a2;
    *v4 = *a2;
    v4 = (uint64_t *)(v14 + ((v5 + 16) & ~(unint64_t)v5));
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
    v9 = *(int *)(a3 + 24);
    v10 = (char *)a1 + v9;
    v11 = (char *)a2 + v9;
    v12 = sub_22DFDCEC0();
    sub_22DFDD448();
    sub_22DFDD448();
    if (__swift_getEnumTagSinglePayload((uint64_t)v11, 1, v12))
    {
      v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_255DD7828);
      memcpy(v10, v11, *(_QWORD *)(*(_QWORD *)(v13 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v12 - 8) + 16))(v10, v11, v12);
      __swift_storeEnumTagSinglePayload((uint64_t)v10, 0, 1, v12);
    }
    *(uint64_t *)((char *)v4 + *(int *)(a3 + 28)) = *(uint64_t *)((char *)a2 + *(int *)(a3 + 28));
    sub_22DFDD448();
  }
  return v4;
}

uint64_t sub_22DFCDCCC(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v4 = a1 + *(int *)(a2 + 24);
  v5 = sub_22DFDCEC0();
  if (!__swift_getEnumTagSinglePayload(v4, 1, v5))
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(v4, v5);
  return swift_bridgeObjectRelease();
}

_QWORD *sub_22DFCDD48(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;

  v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  v7 = a2[3];
  a1[2] = a2[2];
  a1[3] = v7;
  v8 = *(int *)(a3 + 24);
  v9 = (char *)a1 + v8;
  v10 = (char *)a2 + v8;
  v11 = sub_22DFDCEC0();
  sub_22DFDD448();
  sub_22DFDD448();
  if (__swift_getEnumTagSinglePayload((uint64_t)v10, 1, v11))
  {
    v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_255DD7828);
    memcpy(v9, v10, *(_QWORD *)(*(_QWORD *)(v12 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v11 - 8) + 16))(v9, v10, v11);
    __swift_storeEnumTagSinglePayload((uint64_t)v9, 0, 1, v11);
  }
  *(_QWORD *)((char *)a1 + *(int *)(a3 + 28)) = *(_QWORD *)((char *)a2 + *(int *)(a3 + 28));
  sub_22DFDD448();
  return a1;
}

_QWORD *sub_22DFCDE34(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v6;
  char *v7;
  char *v8;
  uint64_t v9;
  int EnumTagSinglePayload;
  int v11;
  uint64_t v12;
  uint64_t v13;

  *a1 = *a2;
  a1[1] = a2[1];
  sub_22DFDD448();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  a1[3] = a2[3];
  sub_22DFDD448();
  swift_bridgeObjectRelease();
  v6 = *(int *)(a3 + 24);
  v7 = (char *)a1 + v6;
  v8 = (char *)a2 + v6;
  v9 = sub_22DFDCEC0();
  EnumTagSinglePayload = __swift_getEnumTagSinglePayload((uint64_t)v7, 1, v9);
  v11 = __swift_getEnumTagSinglePayload((uint64_t)v8, 1, v9);
  if (!EnumTagSinglePayload)
  {
    v12 = *(_QWORD *)(v9 - 8);
    if (!v11)
    {
      (*(void (**)(char *, char *, uint64_t))(v12 + 24))(v7, v8, v9);
      goto LABEL_7;
    }
    (*(void (**)(char *, uint64_t))(v12 + 8))(v7, v9);
    goto LABEL_6;
  }
  if (v11)
  {
LABEL_6:
    v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_255DD7828);
    memcpy(v7, v8, *(_QWORD *)(*(_QWORD *)(v13 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v9 - 8) + 16))(v7, v8, v9);
  __swift_storeEnumTagSinglePayload((uint64_t)v7, 0, 1, v9);
LABEL_7:
  *(_QWORD *)((char *)a1 + *(int *)(a3 + 28)) = *(_QWORD *)((char *)a2 + *(int *)(a3 + 28));
  sub_22DFDD448();
  swift_bridgeObjectRelease();
  return a1;
}

_OWORD *sub_22DFCDF94(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  __int128 v6;
  uint64_t v7;
  char *v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;

  v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  v7 = *(int *)(a3 + 24);
  v8 = (char *)a1 + v7;
  v9 = (char *)a2 + v7;
  v10 = sub_22DFDCEC0();
  if (__swift_getEnumTagSinglePayload((uint64_t)v9, 1, v10))
  {
    v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_255DD7828);
    memcpy(v8, v9, *(_QWORD *)(*(_QWORD *)(v11 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v10 - 8) + 32))(v8, v9, v10);
    __swift_storeEnumTagSinglePayload((uint64_t)v8, 0, 1, v10);
  }
  *(_QWORD *)((char *)a1 + *(int *)(a3 + 28)) = *(_QWORD *)((char *)a2 + *(int *)(a3 + 28));
  return a1;
}

_QWORD *sub_22DFCE05C(_QWORD *a1, _QWORD *a2, uint64_t a3)
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

  v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  swift_bridgeObjectRelease();
  v7 = a2[3];
  a1[2] = a2[2];
  a1[3] = v7;
  swift_bridgeObjectRelease();
  v8 = *(int *)(a3 + 24);
  v9 = (char *)a1 + v8;
  v10 = (char *)a2 + v8;
  v11 = sub_22DFDCEC0();
  EnumTagSinglePayload = __swift_getEnumTagSinglePayload((uint64_t)v9, 1, v11);
  v13 = __swift_getEnumTagSinglePayload((uint64_t)v10, 1, v11);
  if (!EnumTagSinglePayload)
  {
    v14 = *(_QWORD *)(v11 - 8);
    if (!v13)
    {
      (*(void (**)(char *, char *, uint64_t))(v14 + 40))(v9, v10, v11);
      goto LABEL_7;
    }
    (*(void (**)(char *, uint64_t))(v14 + 8))(v9, v11);
    goto LABEL_6;
  }
  if (v13)
  {
LABEL_6:
    v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_255DD7828);
    memcpy(v9, v10, *(_QWORD *)(*(_QWORD *)(v15 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v11 - 8) + 32))(v9, v10, v11);
  __swift_storeEnumTagSinglePayload((uint64_t)v9, 0, 1, v11);
LABEL_7:
  *(_QWORD *)((char *)a1 + *(int *)(a3 + 28)) = *(_QWORD *)((char *)a2 + *(int *)(a3 + 28));
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_22DFCE194()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

void __swift_get_extra_inhabitant_index_9Tm(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;

  if ((_DWORD)a2 == 0x7FFFFFFF)
  {
    OUTLINED_FUNCTION_105_2(*(_QWORD *)(a1 + 8));
    OUTLINED_FUNCTION_132_0();
  }
  else
  {
    v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_255DD7828);
    OUTLINED_FUNCTION_54_6(a1 + *(int *)(a3 + 24), a2, v6);
  }
}

uint64_t sub_22DFCE200()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

void __swift_store_extra_inhabitant_index_10Tm()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  int v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_157_1();
  if (v3 == 0x7FFFFFFF)
  {
    *(_QWORD *)(v1 + 8) = (v0 - 1);
    OUTLINED_FUNCTION_132_0();
  }
  else
  {
    v4 = v2;
    v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_255DD7828);
    OUTLINED_FUNCTION_53_7(v1 + *(int *)(v4 + 24), v0, v0, v5);
  }
}

void sub_22DFCE26C()
{
  unint64_t v0;

  sub_22DFCC570(319, qword_255DD78F8, (void (*)(uint64_t))MEMORY[0x24BDCE900]);
  if (v0 <= 0x3F)
    swift_initStructMetadata();
}

uint64_t sub_22DFCE304()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t sub_22DFCE33C(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v3 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v3;
  v4 = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = v4;
  *(_WORD *)(a1 + 32) = *(_WORD *)(a2 + 32);
  v5 = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 48) = v5;
  *(_QWORD *)(a1 + 56) = *(_QWORD *)(a2 + 56);
  sub_22DFDD448();
  sub_22DFDD448();
  sub_22DFDD448();
  sub_22DFDD448();
  return a1;
}

uint64_t sub_22DFCE3A8(uint64_t a1, uint64_t a2)
{
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  sub_22DFDD448();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  sub_22DFDD448();
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + 32) = *(_BYTE *)(a2 + 32);
  *(_BYTE *)(a1 + 33) = *(_BYTE *)(a2 + 33);
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  sub_22DFDD448();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 56) = *(_QWORD *)(a2 + 56);
  sub_22DFDD448();
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

uint64_t sub_22DFCE470(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;

  v4 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  v5 = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = v5;
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + 32) = *(_BYTE *)(a2 + 32);
  *(_BYTE *)(a1 + 33) = *(_BYTE *)(a2 + 33);
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 48) = *(_OWORD *)(a2 + 48);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_22DFCE4E4(uint64_t a1, int a2)
{
  unint64_t v2;

  if (a2)
  {
    if (a2 < 0 && *(_BYTE *)(a1 + 64))
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

uint64_t sub_22DFCE524(uint64_t result, int a2, int a3)
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
      *(_QWORD *)(result + 8) = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 64) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

void _s20ProfileInfoMergeableVMa()
{
  OUTLINED_FUNCTION_32_1();
}

uint64_t *sub_22DFCE580(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5;
  uint64_t v7;
  int *v8;
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
    v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_255DD80B8);
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a1, a2, v7);
    v8 = (int *)_s20CarryDeviceMergeableVMa(0);
    v9 = v8[5];
    v10 = (char *)a1 + v9;
    v11 = (char *)a2 + v9;
    v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_255DD80C0);
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v12 - 8) + 16))(v10, v11, v12);
    v13 = v8[6];
    v14 = (char *)a1 + v13;
    v15 = (char *)a2 + v13;
    v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_255DD80C8);
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v16 - 8) + 16))(v14, v15, v16);
    v17 = v8[7];
    v18 = (char *)a1 + v17;
    v19 = (char *)a2 + v17;
    v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_255DD80D0);
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v20 - 8) + 16))(v18, v19, v20);
    *(uint64_t *)((char *)a1 + v8[8]) = *(uint64_t *)((char *)a2 + v8[8]);
    *(uint64_t *)((char *)a1 + *(int *)(a3 + 20)) = *(uint64_t *)((char *)a2 + *(int *)(a3 + 20));
    sub_22DFDD448();
    sub_22DFDD448();
  }
  return a1;
}

uint64_t sub_22DFCE6C8(uint64_t a1)
{
  uint64_t v2;
  int *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_255DD80B8);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  v3 = (int *)_s20CarryDeviceMergeableVMa(0);
  v4 = a1 + v3[5];
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_255DD80C0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(v4, v5);
  v6 = a1 + v3[6];
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_255DD80C8);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 8))(v6, v7);
  v8 = a1 + v3[7];
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_255DD80D0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 8))(v8, v9);
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t sub_22DFCE7A8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  int *v7;
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

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_255DD80B8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(a1, a2, v6);
  v7 = (int *)_s20CarryDeviceMergeableVMa(0);
  v8 = v7[5];
  v9 = a1 + v8;
  v10 = a2 + v8;
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_255DD80C0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 16))(v9, v10, v11);
  v12 = v7[6];
  v13 = a1 + v12;
  v14 = a2 + v12;
  v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_255DD80C8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v15 - 8) + 16))(v13, v14, v15);
  v16 = v7[7];
  v17 = a1 + v16;
  v18 = a2 + v16;
  v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_255DD80D0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v19 - 8) + 16))(v17, v18, v19);
  *(_QWORD *)(a1 + v7[8]) = *(_QWORD *)(a2 + v7[8]);
  *(_QWORD *)(a1 + *(int *)(a3 + 20)) = *(_QWORD *)(a2 + *(int *)(a3 + 20));
  sub_22DFDD448();
  sub_22DFDD448();
  return a1;
}

uint64_t sub_22DFCE8C4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  int *v7;
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

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_255DD80B8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 24))(a1, a2, v6);
  v7 = (int *)_s20CarryDeviceMergeableVMa(0);
  v8 = v7[5];
  v9 = a1 + v8;
  v10 = a2 + v8;
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_255DD80C0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 24))(v9, v10, v11);
  v12 = v7[6];
  v13 = a1 + v12;
  v14 = a2 + v12;
  v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_255DD80C8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v15 - 8) + 24))(v13, v14, v15);
  v16 = v7[7];
  v17 = a1 + v16;
  v18 = a2 + v16;
  v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_255DD80D0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v19 - 8) + 24))(v17, v18, v19);
  *(_QWORD *)(a1 + v7[8]) = *(_QWORD *)(a2 + v7[8]);
  sub_22DFDD448();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + *(int *)(a3 + 20)) = *(_QWORD *)(a2 + *(int *)(a3 + 20));
  sub_22DFDD448();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_22DFCE9F4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  int *v7;
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

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_255DD80B8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 32))(a1, a2, v6);
  v7 = (int *)_s20CarryDeviceMergeableVMa(0);
  v8 = v7[5];
  v9 = a1 + v8;
  v10 = a2 + v8;
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_255DD80C0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 32))(v9, v10, v11);
  v12 = v7[6];
  v13 = a1 + v12;
  v14 = a2 + v12;
  v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_255DD80C8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v15 - 8) + 32))(v13, v14, v15);
  v16 = v7[7];
  v17 = a1 + v16;
  v18 = a2 + v16;
  v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_255DD80D0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v19 - 8) + 32))(v17, v18, v19);
  *(_QWORD *)(a1 + v7[8]) = *(_QWORD *)(a2 + v7[8]);
  *(_QWORD *)(a1 + *(int *)(a3 + 20)) = *(_QWORD *)(a2 + *(int *)(a3 + 20));
  return a1;
}

uint64_t sub_22DFCEB04(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  int *v7;
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

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_255DD80B8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 40))(a1, a2, v6);
  v7 = (int *)_s20CarryDeviceMergeableVMa(0);
  v8 = v7[5];
  v9 = a1 + v8;
  v10 = a2 + v8;
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_255DD80C0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 40))(v9, v10, v11);
  v12 = v7[6];
  v13 = a1 + v12;
  v14 = a2 + v12;
  v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_255DD80C8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v15 - 8) + 40))(v13, v14, v15);
  v16 = v7[7];
  v17 = a1 + v16;
  v18 = a2 + v16;
  v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_255DD80D0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v19 - 8) + 40))(v17, v18, v19);
  *(_QWORD *)(a1 + v7[8]) = *(_QWORD *)(a2 + v7[8]);
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + *(int *)(a3 + 20)) = *(_QWORD *)(a2 + *(int *)(a3 + 20));
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_22DFCEC24()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

void sub_22DFCEC30(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;

  v6 = _s20CarryDeviceMergeableVMa(0);
  if (*(_DWORD *)(*(_QWORD *)(v6 - 8) + 84) == (_DWORD)a2)
  {
    OUTLINED_FUNCTION_54_6(a1, a2, v6);
  }
  else
  {
    OUTLINED_FUNCTION_105_2(*(_QWORD *)(a1 + *(int *)(a3 + 20)));
    OUTLINED_FUNCTION_132_0();
  }
}

uint64_t sub_22DFCEC8C()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

void sub_22DFCEC98(uint64_t a1, int a2, uint64_t a3, uint64_t a4)
{
  char v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  _s20CarryDeviceMergeableVMa(0);
  OUTLINED_FUNCTION_87_2();
  if (v7)
  {
    v8 = OUTLINED_FUNCTION_23_13();
    OUTLINED_FUNCTION_53_7(v8, v9, v10, v11);
  }
  else
  {
    *(_QWORD *)(a1 + *(int *)(a4 + 20)) = (a2 - 1);
    OUTLINED_FUNCTION_132_0();
  }
}

uint64_t _s13DataModelCRDTVMa(uint64_t a1)
{
  return sub_22DF30B80(a1, qword_255DDCC40);
}

uint64_t sub_22DFCECFC()
{
  uint64_t result;
  unint64_t v1;

  result = _s20CarryDeviceMergeableVMa(319);
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

void sub_22DFCED70()
{
  sub_22DFCED9C((uint64_t)&qword_255DDAE88);
}

void sub_22DFCED9C(uint64_t a1)
{
  void (*v1)(uint64_t);

  if (!OUTLINED_FUNCTION_212_1(a1))
  {
    v1(255);
    OUTLINED_FUNCTION_179();
  }
  OUTLINED_FUNCTION_1_2();
}

void sub_22DFCEDCC()
{
  sub_22DFCED9C((uint64_t)&unk_255DDCC78);
}

void sub_22DFCEDF8()
{
  sub_22DFCED9C((uint64_t)&unk_255DDCC80);
}

void sub_22DFCEE24()
{
  sub_22DFCED9C((uint64_t)&unk_255DDCC88);
}

unint64_t sub_22DFCEE54()
{
  unint64_t result;

  result = qword_255DDCC90;
  if (!qword_255DDCC90)
  {
    result = MEMORY[0x22E323AEC](&unk_22DFEA8EC, &unk_24F9B9278);
    atomic_store(result, (unint64_t *)&qword_255DDCC90);
  }
  return result;
}

unint64_t sub_22DFCEE98()
{
  unint64_t result;

  result = qword_255DDCC98;
  if (!qword_255DDCC98)
  {
    result = MEMORY[0x22E323AEC](&unk_22DFEA744, &unk_24F9B9278);
    atomic_store(result, (unint64_t *)&qword_255DDCC98);
  }
  return result;
}

unint64_t sub_22DFCEED8()
{
  unint64_t result;

  result = qword_255DDCCA0;
  if (!qword_255DDCCA0)
  {
    result = MEMORY[0x22E323AEC](&unk_22DFEA71C, &unk_24F9B9278);
    atomic_store(result, (unint64_t *)&qword_255DDCCA0);
  }
  return result;
}

unint64_t sub_22DFCEF18()
{
  unint64_t result;

  result = qword_255DDCCA8;
  if (!qword_255DDCCA8)
  {
    result = MEMORY[0x22E323AEC](&unk_22DFEA7B4, &unk_24F9B9560);
    atomic_store(result, (unint64_t *)&qword_255DDCCA8);
  }
  return result;
}

unint64_t sub_22DFCEF58()
{
  unint64_t result;

  result = qword_255DDCCB0;
  if (!qword_255DDCCB0)
  {
    result = MEMORY[0x22E323AEC](&unk_22DFEA8C4, &unk_24F9B9560);
    atomic_store(result, (unint64_t *)&qword_255DDCCB0);
  }
  return result;
}

unint64_t sub_22DFCEF98()
{
  unint64_t result;

  result = qword_255DDCCB8;
  if (!qword_255DDCCB8)
  {
    result = MEMORY[0x22E323AEC](&unk_22DFEA88C, &unk_24F9B9560);
    atomic_store(result, (unint64_t *)&qword_255DDCCB8);
  }
  return result;
}

unint64_t sub_22DFCEFD8()
{
  unint64_t result;

  result = qword_255DDCCC0;
  if (!qword_255DDCCC0)
  {
    result = MEMORY[0x22E323AEC](&unk_22DFEA7EC, &unk_24F9B9560);
    atomic_store(result, (unint64_t *)&qword_255DDCCC0);
  }
  return result;
}

unint64_t sub_22DFCF018()
{
  unint64_t result;

  result = qword_255DDCCC8;
  if (!qword_255DDCCC8)
  {
    result = MEMORY[0x22E323AEC](&unk_22DFEA864, &unk_24F9B9560);
    atomic_store(result, (unint64_t *)&qword_255DDCCC8);
  }
  return result;
}

unint64_t sub_22DFCF058()
{
  unint64_t result;

  result = qword_255DDCCD0;
  if (!qword_255DDCCD0)
  {
    result = MEMORY[0x22E323AEC](&unk_22DFEA83C, &unk_24F9B9560);
    atomic_store(result, (unint64_t *)&qword_255DDCCD0);
  }
  return result;
}

void sub_22DFCF094()
{
  sub_22DFCFF98((uint64_t)&unk_255DDCCD8);
}

unint64_t sub_22DFCF0C4()
{
  unint64_t result;

  result = qword_255DDCCE8;
  if (!qword_255DDCCE8)
  {
    result = MEMORY[0x22E323AEC](&unk_22DFEA76C, &unk_24F9B9278);
    atomic_store(result, (unint64_t *)&qword_255DDCCE8);
  }
  return result;
}

void sub_22DFCF104()
{
  sub_22DFCED9C((uint64_t)&unk_255DDCCF0);
}

void sub_22DFCF130()
{
  sub_22DFCED9C((uint64_t)&qword_255DDAE48);
}

void sub_22DFCF15C()
{
  sub_22DFCED9C((uint64_t)&unk_255DDCCF8);
}

void sub_22DFCF188()
{
  sub_22DFCED9C((uint64_t)&unk_255DDCD00);
}

unint64_t sub_22DFCF1B8()
{
  unint64_t result;

  result = qword_255DDCD08;
  if (!qword_255DDCD08)
  {
    result = MEMORY[0x22E323AEC](&unk_22DFEAAAC, &unk_24F9B94D0);
    atomic_store(result, (unint64_t *)&qword_255DDCD08);
  }
  return result;
}

unint64_t sub_22DFCF1F8()
{
  unint64_t result;

  result = qword_255DDCD10;
  if (!qword_255DDCD10)
  {
    result = MEMORY[0x22E323AEC](&unk_22DFEABBC, &unk_24F9B94D0);
    atomic_store(result, (unint64_t *)&qword_255DDCD10);
  }
  return result;
}

unint64_t sub_22DFCF238()
{
  unint64_t result;

  result = qword_255DDCD18;
  if (!qword_255DDCD18)
  {
    result = MEMORY[0x22E323AEC](&unk_22DFEAB84, &unk_24F9B94D0);
    atomic_store(result, (unint64_t *)&qword_255DDCD18);
  }
  return result;
}

unint64_t sub_22DFCF278()
{
  unint64_t result;

  result = qword_255DDCD20;
  if (!qword_255DDCD20)
  {
    result = MEMORY[0x22E323AEC](&unk_22DFEAAE4, &unk_24F9B94D0);
    atomic_store(result, (unint64_t *)&qword_255DDCD20);
  }
  return result;
}

unint64_t sub_22DFCF2B8()
{
  unint64_t result;

  result = qword_255DDCD28;
  if (!qword_255DDCD28)
  {
    result = MEMORY[0x22E323AEC](&unk_22DFEAB5C, &unk_24F9B94D0);
    atomic_store(result, (unint64_t *)&qword_255DDCD28);
  }
  return result;
}

unint64_t sub_22DFCF2F8()
{
  unint64_t result;

  result = qword_255DDCD30;
  if (!qword_255DDCD30)
  {
    result = MEMORY[0x22E323AEC](&unk_22DFEAB34, &unk_24F9B94D0);
    atomic_store(result, (unint64_t *)&qword_255DDCD30);
  }
  return result;
}

void sub_22DFCF334()
{
  sub_22DFCFF98((uint64_t)&unk_255DDCD38);
}

void sub_22DFCF360()
{
  sub_22DFCED9C((uint64_t)&unk_255DDCD48);
}

void sub_22DFCF38C()
{
  sub_22DFCED9C((uint64_t)&unk_255DDCD50);
}

void sub_22DFCF3B8()
{
  sub_22DFCED9C((uint64_t)&unk_255DDCD58);
}

void sub_22DFCF3E4()
{
  sub_22DFCED9C((uint64_t)&unk_255DDCD60);
}

void sub_22DFCF410()
{
  sub_22DFCED9C((uint64_t)&unk_255DDCD68);
}

void sub_22DFCF43C()
{
  sub_22DFCFF98((uint64_t)&unk_255DDCD70);
}

void sub_22DFCF468()
{
  sub_22DFCED9C((uint64_t)&unk_255DDCD80);
}

void sub_22DFCF494()
{
  sub_22DFCFF98((uint64_t)&unk_255DDCD88);
}

void sub_22DFCF4C0()
{
  sub_22DFCFF98((uint64_t)&unk_255DDCD90);
}

void sub_22DFCF4EC()
{
  sub_22DFCFF98((uint64_t)&unk_255DDCD98);
}

void sub_22DFCF518()
{
  sub_22DFCFF98((uint64_t)&unk_255DDCDA0);
}

void sub_22DFCF544()
{
  sub_22DFCED9C((uint64_t)&unk_255DDCDA8);
}

void sub_22DFCF570()
{
  sub_22DFCED9C((uint64_t)&unk_255DDCDB0);
}

unint64_t sub_22DFCF5A0()
{
  unint64_t result;

  result = qword_255DDCDB8;
  if (!qword_255DDCDB8)
  {
    result = MEMORY[0x22E323AEC](&unk_22DFEB24C, &unk_24F9B91F0);
    atomic_store(result, (unint64_t *)&qword_255DDCDB8);
  }
  return result;
}

unint64_t sub_22DFCF5E0()
{
  unint64_t result;

  result = qword_255DDCDC0;
  if (!qword_255DDCDC0)
  {
    result = MEMORY[0x22E323AEC](&unk_22DFEAFBC, &unk_24F9B91F0);
    atomic_store(result, (unint64_t *)&qword_255DDCDC0);
  }
  return result;
}

unint64_t sub_22DFCF620()
{
  unint64_t result;

  result = qword_255DDCDC8;
  if (!qword_255DDCDC8)
  {
    result = MEMORY[0x22E323AEC](&unk_22DFEB06C, &unk_24F9B91F0);
    atomic_store(result, (unint64_t *)&qword_255DDCDC8);
  }
  return result;
}

unint64_t sub_22DFCF660()
{
  unint64_t result;

  result = qword_255DDCDD0;
  if (!qword_255DDCDD0)
  {
    result = MEMORY[0x22E323AEC](&unk_22DFEB044, &unk_24F9B91F0);
    atomic_store(result, (unint64_t *)&qword_255DDCDD0);
  }
  return result;
}

unint64_t sub_22DFCF6A0()
{
  unint64_t result;

  result = qword_255DDCDD8;
  if (!qword_255DDCDD8)
  {
    result = MEMORY[0x22E323AEC](&unk_22DFEB01C, &unk_24F9B91F0);
    atomic_store(result, (unint64_t *)&qword_255DDCDD8);
  }
  return result;
}

unint64_t sub_22DFCF6E0()
{
  unint64_t result;

  result = qword_255DDCDE0;
  if (!qword_255DDCDE0)
  {
    result = MEMORY[0x22E323AEC](&unk_22DFEB0EC, &unk_24F9B9440);
    atomic_store(result, (unint64_t *)&qword_255DDCDE0);
  }
  return result;
}

unint64_t sub_22DFCF720()
{
  unint64_t result;

  result = qword_255DDCDE8;
  if (!qword_255DDCDE8)
  {
    result = MEMORY[0x22E323AEC](&unk_22DFEB1FC, &unk_24F9B9440);
    atomic_store(result, (unint64_t *)&qword_255DDCDE8);
  }
  return result;
}

unint64_t sub_22DFCF760()
{
  unint64_t result;

  result = qword_255DDCDF0;
  if (!qword_255DDCDF0)
  {
    result = MEMORY[0x22E323AEC](&unk_22DFEB1C4, &unk_24F9B9440);
    atomic_store(result, (unint64_t *)&qword_255DDCDF0);
  }
  return result;
}

unint64_t sub_22DFCF7A0()
{
  unint64_t result;

  result = qword_255DDCDF8;
  if (!qword_255DDCDF8)
  {
    result = MEMORY[0x22E323AEC](&unk_22DFEB124, &unk_24F9B9440);
    atomic_store(result, (unint64_t *)&qword_255DDCDF8);
  }
  return result;
}

unint64_t sub_22DFCF7E0()
{
  unint64_t result;

  result = qword_255DDCE00;
  if (!qword_255DDCE00)
  {
    result = MEMORY[0x22E323AEC](&unk_22DFEB19C, &unk_24F9B9440);
    atomic_store(result, (unint64_t *)&qword_255DDCE00);
  }
  return result;
}

unint64_t sub_22DFCF820()
{
  unint64_t result;

  result = qword_255DDCE08;
  if (!qword_255DDCE08)
  {
    result = MEMORY[0x22E323AEC](&unk_22DFEB174, &unk_24F9B9440);
    atomic_store(result, (unint64_t *)&qword_255DDCE08);
  }
  return result;
}

void sub_22DFCF85C()
{
  sub_22DFCFF98((uint64_t)&unk_255DDCE10);
}

unint64_t sub_22DFCF88C()
{
  unint64_t result;

  result = qword_255DDCE20;
  if (!qword_255DDCE20)
  {
    result = MEMORY[0x22E323AEC](&unk_22DFEB0A4, &unk_24F9B91F0);
    atomic_store(result, (unint64_t *)&qword_255DDCE20);
  }
  return result;
}

unint64_t sub_22DFCF8CC()
{
  unint64_t result;

  result = qword_255DDCE28;
  if (!qword_255DDCE28)
  {
    result = MEMORY[0x22E323AEC](&unk_22DFEB224, &unk_24F9B91F0);
    atomic_store(result, (unint64_t *)&qword_255DDCE28);
  }
  return result;
}

unint64_t sub_22DFCF90C()
{
  unint64_t result;

  result = qword_255DDCE30;
  if (!qword_255DDCE30)
  {
    result = MEMORY[0x22E323AEC](&unk_22DFEB56C, &unk_24F9B9158);
    atomic_store(result, (unint64_t *)&qword_255DDCE30);
  }
  return result;
}

unint64_t sub_22DFCF950()
{
  unint64_t result;

  result = qword_255DDCE38;
  if (!qword_255DDCE38)
  {
    result = MEMORY[0x22E323AEC](&unk_22DFEB39C, &unk_24F9B9158);
    atomic_store(result, (unint64_t *)&qword_255DDCE38);
  }
  return result;
}

unint64_t sub_22DFCF990()
{
  unint64_t result;

  result = qword_255DDCE40;
  if (!qword_255DDCE40)
  {
    result = MEMORY[0x22E323AEC](&unk_22DFEB374, &unk_24F9B9158);
    atomic_store(result, (unint64_t *)&qword_255DDCE40);
  }
  return result;
}

unint64_t sub_22DFCF9D0()
{
  unint64_t result;

  result = qword_255DDCE48;
  if (!qword_255DDCE48)
  {
    result = MEMORY[0x22E323AEC](&unk_22DFEB40C, &unk_24F9B93B0);
    atomic_store(result, (unint64_t *)&qword_255DDCE48);
  }
  return result;
}

unint64_t sub_22DFCFA10()
{
  unint64_t result;

  result = qword_255DDCE50;
  if (!qword_255DDCE50)
  {
    result = MEMORY[0x22E323AEC](&unk_22DFEB51C, &unk_24F9B93B0);
    atomic_store(result, (unint64_t *)&qword_255DDCE50);
  }
  return result;
}

unint64_t sub_22DFCFA50()
{
  unint64_t result;

  result = qword_255DDCE58;
  if (!qword_255DDCE58)
  {
    result = MEMORY[0x22E323AEC](&unk_22DFEB4E4, &unk_24F9B93B0);
    atomic_store(result, (unint64_t *)&qword_255DDCE58);
  }
  return result;
}

unint64_t sub_22DFCFA90()
{
  unint64_t result;

  result = qword_255DDCE60;
  if (!qword_255DDCE60)
  {
    result = MEMORY[0x22E323AEC](&unk_22DFEB444, &unk_24F9B93B0);
    atomic_store(result, (unint64_t *)&qword_255DDCE60);
  }
  return result;
}

unint64_t sub_22DFCFAD0()
{
  unint64_t result;

  result = qword_255DDCE68;
  if (!qword_255DDCE68)
  {
    result = MEMORY[0x22E323AEC](&unk_22DFEB4BC, &unk_24F9B93B0);
    atomic_store(result, (unint64_t *)&qword_255DDCE68);
  }
  return result;
}

unint64_t sub_22DFCFB10()
{
  unint64_t result;

  result = qword_255DDCE70;
  if (!qword_255DDCE70)
  {
    result = MEMORY[0x22E323AEC](&unk_22DFEB494, &unk_24F9B93B0);
    atomic_store(result, (unint64_t *)&qword_255DDCE70);
  }
  return result;
}

void sub_22DFCFB4C()
{
  sub_22DFCFF98((uint64_t)&unk_255DDCE78);
}

unint64_t sub_22DFCFB7C()
{
  unint64_t result;

  result = qword_255DDCE88;
  if (!qword_255DDCE88)
  {
    result = MEMORY[0x22E323AEC](&unk_22DFEB3C4, &unk_24F9B9158);
    atomic_store(result, (unint64_t *)&qword_255DDCE88);
  }
  return result;
}

unint64_t sub_22DFCFBBC()
{
  unint64_t result;

  result = qword_255DDCE90;
  if (!qword_255DDCE90)
  {
    result = MEMORY[0x22E323AEC](&unk_22DFEB544, &unk_24F9B9158);
    atomic_store(result, (unint64_t *)&qword_255DDCE90);
  }
  return result;
}

unint64_t sub_22DFCFBFC()
{
  unint64_t result;

  result = qword_255DDCE98;
  if (!qword_255DDCE98)
  {
    result = MEMORY[0x22E323AEC](&unk_22DFEB88C, &unk_24F9B90D0);
    atomic_store(result, (unint64_t *)&qword_255DDCE98);
  }
  return result;
}

unint64_t sub_22DFCFC40()
{
  unint64_t result;

  result = qword_255DDCEA0;
  if (!qword_255DDCEA0)
  {
    result = MEMORY[0x22E323AEC](&unk_22DFEB6BC, &unk_24F9B90D0);
    atomic_store(result, (unint64_t *)&qword_255DDCEA0);
  }
  return result;
}

unint64_t sub_22DFCFC80()
{
  unint64_t result;

  result = qword_255DDCEA8;
  if (!qword_255DDCEA8)
  {
    result = MEMORY[0x22E323AEC](&unk_22DFEB694, &unk_24F9B90D0);
    atomic_store(result, (unint64_t *)&qword_255DDCEA8);
  }
  return result;
}

unint64_t sub_22DFCFCC0()
{
  unint64_t result;

  result = qword_255DDCEB0;
  if (!qword_255DDCEB0)
  {
    result = MEMORY[0x22E323AEC](&unk_22DFEB72C, &unk_24F9B9320);
    atomic_store(result, (unint64_t *)&qword_255DDCEB0);
  }
  return result;
}

unint64_t sub_22DFCFD00()
{
  unint64_t result;

  result = qword_255DDCEB8;
  if (!qword_255DDCEB8)
  {
    result = MEMORY[0x22E323AEC](&unk_22DFEB83C, &unk_24F9B9320);
    atomic_store(result, (unint64_t *)&qword_255DDCEB8);
  }
  return result;
}

unint64_t sub_22DFCFD40()
{
  unint64_t result;

  result = qword_255DDCEC0;
  if (!qword_255DDCEC0)
  {
    result = MEMORY[0x22E323AEC](&unk_22DFEB804, &unk_24F9B9320);
    atomic_store(result, (unint64_t *)&qword_255DDCEC0);
  }
  return result;
}

unint64_t sub_22DFCFD80()
{
  unint64_t result;

  result = qword_255DDCEC8;
  if (!qword_255DDCEC8)
  {
    result = MEMORY[0x22E323AEC](&unk_22DFEB764, &unk_24F9B9320);
    atomic_store(result, (unint64_t *)&qword_255DDCEC8);
  }
  return result;
}

unint64_t sub_22DFCFDC0()
{
  unint64_t result;

  result = qword_255DDCED0;
  if (!qword_255DDCED0)
  {
    result = MEMORY[0x22E323AEC](&unk_22DFEB7DC, &unk_24F9B9320);
    atomic_store(result, (unint64_t *)&qword_255DDCED0);
  }
  return result;
}

unint64_t sub_22DFCFE00()
{
  unint64_t result;

  result = qword_255DDCED8;
  if (!qword_255DDCED8)
  {
    result = MEMORY[0x22E323AEC](&unk_22DFEB7B4, &unk_24F9B9320);
    atomic_store(result, (unint64_t *)&qword_255DDCED8);
  }
  return result;
}

void sub_22DFCFE3C()
{
  sub_22DFCFF98((uint64_t)&unk_255DDCEE0);
}

unint64_t sub_22DFCFE6C()
{
  unint64_t result;

  result = qword_255DDCEF0;
  if (!qword_255DDCEF0)
  {
    result = MEMORY[0x22E323AEC](&unk_22DFEB6E4, &unk_24F9B90D0);
    atomic_store(result, (unint64_t *)&qword_255DDCEF0);
  }
  return result;
}

unint64_t sub_22DFCFEAC()
{
  unint64_t result;

  result = qword_255DDCEF8;
  if (!qword_255DDCEF8)
  {
    result = MEMORY[0x22E323AEC](&unk_22DFEB864, &unk_24F9B90D0);
    atomic_store(result, (unint64_t *)&qword_255DDCEF8);
  }
  return result;
}

void sub_22DFCFEE8()
{
  sub_22DFCED9C((uint64_t)&unk_255DDCF00);
}

void sub_22DFCFF14()
{
  sub_22DFCED9C((uint64_t)&unk_255DDCF08);
}

void sub_22DFCFF40()
{
  sub_22DFCED9C((uint64_t)qword_255DDAF00);
}

void sub_22DFCFF6C()
{
  sub_22DFCFF98((uint64_t)&unk_255DDCF10);
}

void sub_22DFCFF98(uint64_t a1)
{
  uint64_t *v1;

  if (!OUTLINED_FUNCTION_212_1(a1))
  {
    OUTLINED_FUNCTION_15_14(0, v1);
    OUTLINED_FUNCTION_179();
  }
  OUTLINED_FUNCTION_1_2();
}

unint64_t sub_22DFCFFC4()
{
  unint64_t result;

  result = qword_255DDCF20;
  if (!qword_255DDCF20)
  {
    result = MEMORY[0x22E323AEC](&unk_22DFEB634, &unk_24F9B90D0);
    atomic_store(result, (unint64_t *)&qword_255DDCF20);
  }
  return result;
}

unint64_t sub_22DFD0004()
{
  unint64_t result;

  result = qword_255DDCF28;
  if (!qword_255DDCF28)
  {
    result = MEMORY[0x22E323AEC](&unk_22DFEA6BC, &unk_24F9B9278);
    atomic_store(result, (unint64_t *)&qword_255DDCF28);
  }
  return result;
}

unint64_t sub_22DFD0044()
{
  unint64_t result;

  result = qword_255DDCF30;
  if (!qword_255DDCF30)
  {
    result = MEMORY[0x22E323AEC](&unk_22DFEB314, &unk_24F9B9158);
    atomic_store(result, (unint64_t *)&qword_255DDCF30);
  }
  return result;
}

void sub_22DFD0080()
{
  sub_22DFCED9C((uint64_t)&unk_255DDCF38);
}

unint64_t sub_22DFD00AC(uint64_t a1, uint64_t a2)
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

unint64_t sub_22DFD0148(uint64_t a1, uint64_t a2)
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
  v5 = sub_22DFDCEFC();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
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
      sub_22DFCED9C((uint64_t)&qword_255DD7698);
      v14 = sub_22DFDD4F0();
      (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
      if ((v14 & 1) != 0)
        break;
      v10 = (v10 + 1) & v11;
    }
    while (((*(_QWORD *)(v3 + 64 + ((v10 >> 3) & 0xFFFFFFFFFFFFF8)) >> v10) & 1) != 0);
  }
  return v10;
}

unint64_t sub_22DFD0288(uint64_t a1, uint64_t a2)
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
    sub_22DF7F42C();
    v6 = *(id *)(*(_QWORD *)(v2 + 48) + 8 * i);
    v7 = sub_22DFDDB20();

    if ((v7 & 1) == 0)
    {
      v8 = ~v4;
      for (i = (i + 1) & v8; ((*(_QWORD *)(v3 + ((i >> 3) & 0xFFFFFFFFFFFFF8)) >> i) & 1) != 0; i = (i + 1) & v8)
      {
        v9 = *(id *)(*(_QWORD *)(v2 + 48) + 8 * i);
        v10 = sub_22DFDDB20();

        if ((v10 & 1) != 0)
          break;
      }
    }
  }
  return i;
}

unint64_t sub_22DFD0390(uint64_t a1, uint64_t a2, uint64_t a3)
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
    if (!v11 && (sub_22DFDDF58() & 1) == 0)
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
      while (!v14 && (sub_22DFDDF58() & 1) == 0);
    }
  }
  return v6;
}

uint64_t sub_22DFD0470(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  unint64_t v3;

  v3 = a2 & ~(-1 << *(_BYTE *)(v2 + 32));
  if (((*(_QWORD *)(v2 + 64 + ((v3 >> 3) & 0xFFFFFFFFFFFFF8)) >> v3) & 1) != 0)
    __asm { BR              X9 }
  return a2 & ~(-1 << *(_BYTE *)(v2 + 32));
}

unint64_t sub_22DFD0684(uint64_t a1, uint64_t a2)
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
      sub_22DFA8A00(*(_QWORD *)(v2 + 48) + 40 * v4, (uint64_t)v9);
      v7 = MEMORY[0x22E322F70](v9, a1);
      sub_22DF9D054((uint64_t)v9);
      if ((v7 & 1) != 0)
        break;
      v4 = (v4 + 1) & v6;
    }
    while (((*(_QWORD *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFF8)) >> v4) & 1) != 0);
  }
  return v4;
}

void sub_22DFD0748(char a1, uint64_t a2, char a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  char v8;
  char v9;
  _QWORD *v10;
  size_t v11;
  char *v12;
  uint64_t v13;
  char *v14;

  if ((a3 & 1) != 0)
  {
    OUTLINED_FUNCTION_7_4();
    if (v8 != v9)
    {
      OUTLINED_FUNCTION_18_2();
      if (v8)
      {
        __break(1u);
        return;
      }
      OUTLINED_FUNCTION_6_5();
    }
  }
  OUTLINED_FUNCTION_10_4();
  if (v5)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_255DD8208);
    v10 = (_QWORD *)OUTLINED_FUNCTION_149_1();
    v11 = _swift_stdlib_malloc_size(v10);
    v10[2] = v4;
    v10[3] = 2 * ((uint64_t)(v11 - 32) / 16);
  }
  v12 = (char *)OUTLINED_FUNCTION_186_0();
  if ((a1 & 1) != 0)
  {
    sub_22DF47964(v12, v13, v14);
    *(_QWORD *)(a4 + 16) = 0;
  }
  else
  {
    sub_22DF47C30((unint64_t)v12, v13, (unint64_t)v14);
  }
  OUTLINED_FUNCTION_315();
  OUTLINED_FUNCTION_132_0();
}

void sub_22DFD07F0(char a1, uint64_t a2, char a3, uint64_t a4)
{
  sub_22DFD0844(a1, a2, a3, a4, &qword_255DDD028, (void (*)(uint64_t, uint64_t, _QWORD *))sub_22DF479BC, (void (*)(uint64_t, uint64_t, _QWORD *))sub_22DF47CC8);
}

void sub_22DFD080C(char a1, uint64_t a2, char a3, uint64_t a4)
{
  sub_22DFD0844(a1, a2, a3, a4, &qword_255DD8188, (void (*)(uint64_t, uint64_t, _QWORD *))sub_22DF479BC, (void (*)(uint64_t, uint64_t, _QWORD *))sub_22DF47D60);
}

void sub_22DFD0828(char a1, uint64_t a2, char a3, uint64_t a4)
{
  sub_22DFD0844(a1, a2, a3, a4, &qword_255DD81F8, (void (*)(uint64_t, uint64_t, _QWORD *))sub_22DF479BC, (void (*)(uint64_t, uint64_t, _QWORD *))sub_22DF47E04);
}

void sub_22DFD0844(char a1, uint64_t a2, char a3, uint64_t a4, uint64_t *a5, void (*a6)(uint64_t, uint64_t, _QWORD *), void (*a7)(uint64_t, uint64_t, _QWORD *))
{
  uint64_t v11;
  char v12;
  char v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD *v16;
  size_t v17;
  _QWORD *v18;
  uint64_t v19;

  if ((a3 & 1) != 0)
  {
    OUTLINED_FUNCTION_7_4();
    if (v12 != v13)
    {
      OUTLINED_FUNCTION_18_2();
      if (v12)
      {
        __break(1u);
        return;
      }
      OUTLINED_FUNCTION_6_5();
    }
  }
  else
  {
    v11 = a2;
  }
  v14 = *(_QWORD *)(a4 + 16);
  if (v11 <= v14)
    v15 = *(_QWORD *)(a4 + 16);
  else
    v15 = v11;
  if (v15)
  {
    __swift_instantiateConcreteTypeFromMangledName(a5);
    v16 = (_QWORD *)OUTLINED_FUNCTION_149_1();
    v17 = _swift_stdlib_malloc_size(v16);
    v16[2] = v14;
    v16[3] = 2 * ((uint64_t)(v17 - 32) / 8);
  }
  else
  {
    v16 = (_QWORD *)MEMORY[0x24BEE4AF8];
  }
  v18 = v16 + 4;
  v19 = a4 + 32;
  if ((a1 & 1) != 0)
  {
    a6(v19, v14, v18);
    *(_QWORD *)(a4 + 16) = 0;
  }
  else
  {
    a7(v19, v14, v18);
  }
  OUTLINED_FUNCTION_315();
  OUTLINED_FUNCTION_13_3();
}

void sub_22DFD0904(char a1, uint64_t a2, char a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  char v8;
  char v9;
  _QWORD *v10;
  size_t v11;
  char *v12;
  uint64_t v13;
  char *v14;

  if ((a3 & 1) != 0)
  {
    OUTLINED_FUNCTION_7_4();
    if (v8 != v9)
    {
      OUTLINED_FUNCTION_18_2();
      if (v8)
      {
        __break(1u);
        return;
      }
      OUTLINED_FUNCTION_6_5();
    }
  }
  OUTLINED_FUNCTION_10_4();
  if (v5)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_255DD8200);
    v10 = (_QWORD *)OUTLINED_FUNCTION_149_1();
    v11 = _swift_stdlib_malloc_size(v10);
    v10[2] = v4;
    v10[3] = 2 * ((uint64_t)(v11 - 32) / 32);
  }
  v12 = (char *)OUTLINED_FUNCTION_186_0();
  if ((a1 & 1) != 0)
  {
    sub_22DF47A14(v12, v13, v14);
    *(_QWORD *)(a4 + 16) = 0;
  }
  else
  {
    sub_22DF47E9C((unint64_t)v12, v13, (unint64_t)v14);
  }
  OUTLINED_FUNCTION_315();
  OUTLINED_FUNCTION_132_0();
}

void sub_22DFD09AC(char a1, uint64_t a2, char a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  char v8;
  char v9;
  _QWORD *v10;
  size_t v11;
  unint64_t v12;
  uint64_t v13;
  unint64_t v14;

  if ((a3 & 1) != 0)
  {
    OUTLINED_FUNCTION_7_4();
    if (v8 != v9)
    {
      OUTLINED_FUNCTION_18_2();
      if (v8)
      {
        __break(1u);
        return;
      }
      OUTLINED_FUNCTION_6_5();
    }
  }
  OUTLINED_FUNCTION_10_4();
  if (v5)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_255DD89E0);
    v10 = (_QWORD *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    v10[2] = v4;
    v10[3] = 2 * ((uint64_t)(v11 - 32) / 48);
  }
  v12 = OUTLINED_FUNCTION_186_0();
  if ((a1 & 1) != 0)
  {
    sub_22DF47AF8(v12);
    *(_QWORD *)(a4 + 16) = 0;
  }
  else
  {
    sub_22DF47F34(v12, v13, v14);
  }
  OUTLINED_FUNCTION_315();
  OUTLINED_FUNCTION_13_3();
}

uint64_t sub_22DFD0A60(uint64_t *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t result;
  uint64_t v6[2];

  v2 = *a1;
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
  {
    sub_22DFD1F3C(v2);
    v2 = v3;
  }
  v4 = *(_QWORD *)(v2 + 16);
  v6[0] = v2 + 32;
  v6[1] = v4;
  result = sub_22DFD0AC8(v6);
  *a1 = v2;
  return result;
}

uint64_t sub_22DFD0AC8(uint64_t *a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t result;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  _QWORD *v12;
  int v14;
  uint64_t v15;
  _QWORD *v16;
  _QWORD *v17;
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
  unint64_t v29;
  unint64_t v30;
  unint64_t v31;
  uint64_t v32;
  uint64_t *v33;
  unint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  char v38;
  unint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  BOOL v45;
  unint64_t v46;
  uint64_t *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t *v52;
  uint64_t v53;
  uint64_t v54;
  BOOL v55;
  uint64_t v56;
  char v57;
  uint64_t *v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  BOOL v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t *v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t *v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  unint64_t v73;
  uint64_t *v74;
  uint64_t v75;
  _QWORD *v76;
  uint64_t v77;
  unint64_t v78;
  uint64_t *v79;
  uint64_t *v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t *v83;
  uint64_t v85;
  unint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  _QWORD *v90;
  unint64_t v91;
  uint64_t v92;
  uint64_t *v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  char *v97;
  uint64_t v98;

  v3 = a1[1];
  result = sub_22DFDDF04();
  if (result >= v3)
  {
    if ((v3 & 0x8000000000000000) == 0)
    {
      if (v3)
        return sub_22DFD112C(0, v3, 1, a1);
      return result;
    }
    goto LABEL_144;
  }
  v5 = result;
  result = sub_22DF7C868(v3 / 2);
  v95 = result;
  v96 = v3;
  v97 = v6;
  v93 = a1;
  if (v3 <= 0)
  {
    v98 = MEMORY[0x24BEE4AF8];
    v31 = *(_QWORD *)(MEMORY[0x24BEE4AF8] + 16);
LABEL_110:
    if (v31 < 2)
    {
LABEL_121:
      result = swift_bridgeObjectRelease();
      if (v3 >= -1)
      {
        *(_QWORD *)(v95 + 16) = 0;
        return swift_bridgeObjectRelease();
      }
      goto LABEL_149;
    }
    v85 = *v93;
    while (1)
    {
      v86 = v31 - 2;
      if (v31 < 2)
        break;
      if (!v85)
        goto LABEL_153;
      v87 = v98;
      v88 = *(_QWORD *)(v98 + 32 + 16 * v86);
      v89 = *(_QWORD *)(v98 + 32 + 16 * (v31 - 1) + 8);
      result = sub_22DFD11F0((char *)(v85 + 16 * v88), (char *)(v85 + 16 * *(_QWORD *)(v98 + 32 + 16 * (v31 - 1))), v85 + 16 * v89, v97);
      if (v1)
        goto LABEL_106;
      if (v89 < v88)
        goto LABEL_139;
      result = swift_isUniquelyReferenced_nonNull_native();
      if ((result & 1) == 0)
      {
        result = (uint64_t)sub_22DFD1488(v98);
        v87 = result;
      }
      if (v86 >= *(_QWORD *)(v87 + 16))
        goto LABEL_140;
      v90 = (_QWORD *)(v87 + 32 + 16 * v86);
      *v90 = v88;
      v90[1] = v89;
      v91 = *(_QWORD *)(v87 + 16);
      if (v31 > v91)
        goto LABEL_141;
      result = (uint64_t)memmove((void *)(v87 + 32 + 16 * (v31 - 1)), (const void *)(v87 + 32 + 16 * v31), 16 * (v91 - v31));
      v98 = v87;
      *(_QWORD *)(v87 + 16) = v91 - 1;
      v31 = v91 - 1;
      v3 = v96;
      if (v91 <= 2)
        goto LABEL_121;
    }
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
    return result;
  }
  v94 = v5;
  v7 = 0;
  v8 = *a1;
  v92 = *a1 + 8;
  v98 = MEMORY[0x24BEE4AF8];
  while (1)
  {
    v9 = v7++;
    if (v7 >= v3)
      goto LABEL_32;
    v10 = (uint64_t *)(v8 + 16 * v7);
    result = *v10;
    v11 = v10[1];
    v12 = (_QWORD *)(v8 + 16 * v9);
    if (result == *v12 && v11 == v12[1])
    {
      v15 = v9 + 2;
      if (v9 + 2 >= v3)
        goto LABEL_31;
      v14 = 0;
LABEL_13:
      v16 = (_QWORD *)(v92 + 16 * v15);
      do
      {
        result = *(v16 - 1);
        v17 = (_QWORD *)(v8 + 16 * v7);
        if (result == *v17 && *v16 == v17[1])
        {
          if ((v14 & 1) != 0)
            goto LABEL_24;
        }
        else
        {
          result = sub_22DFDDF58();
          if (((v14 ^ result) & 1) != 0)
            goto LABEL_23;
        }
        v16 += 2;
        v19 = v15 + 1;
        v7 = v15;
        v15 = v19;
      }
      while (v19 < v3);
      v15 = v19;
      goto LABEL_23;
    }
    result = sub_22DFDDF58();
    v14 = result;
    v15 = v9 + 2;
    if (v9 + 2 < v3)
      goto LABEL_13;
LABEL_23:
    v7 = v15;
    if ((v14 & 1) == 0)
      goto LABEL_32;
LABEL_24:
    if (v15 < v9)
      goto LABEL_148;
    if (v9 < v15)
    {
      v20 = 16 * v15;
      v21 = 16 * v9;
      v22 = v15;
      v23 = v9;
      do
      {
        if (v23 != --v22)
        {
          if (!v8)
            goto LABEL_152;
          v24 = v8 + v20;
          v25 = *(_QWORD *)(v8 + v21);
          v26 = *(_QWORD *)(v8 + v21 + 8);
          *(_OWORD *)(v8 + v21) = *(_OWORD *)(v8 + v20 - 16);
          *(_QWORD *)(v24 - 16) = v25;
          *(_QWORD *)(v24 - 8) = v26;
        }
        ++v23;
        v20 -= 16;
        v21 += 16;
      }
      while (v23 < v22);
    }
LABEL_31:
    v7 = v15;
LABEL_32:
    if (v7 >= v3)
      goto LABEL_41;
    if (__OFSUB__(v7, v9))
      goto LABEL_143;
    if (v7 - v9 >= v94)
      goto LABEL_41;
    if (__OFADD__(v9, v94))
      goto LABEL_146;
    if (v9 + v94 >= v3)
      v27 = v3;
    else
      v27 = v9 + v94;
    if (v27 < v9)
      goto LABEL_147;
    if (v7 == v27)
    {
LABEL_41:
      v28 = v98;
    }
    else
    {
      v79 = (uint64_t *)(v8 + 16 * v7);
      v28 = v98;
      do
      {
        v80 = (uint64_t *)(v8 + 16 * v7);
        result = *v80;
        v81 = v80[1];
        v82 = v9;
        v83 = v79;
        do
        {
          if (result == *(v83 - 2) && v81 == *(v83 - 1))
            break;
          result = sub_22DFDDF58();
          if ((result & 1) == 0)
            break;
          if (!v8)
            goto LABEL_150;
          result = *v83;
          v81 = v83[1];
          *(_OWORD *)v83 = *((_OWORD *)v83 - 1);
          *(v83 - 1) = v81;
          *(v83 - 2) = result;
          v83 -= 2;
          ++v82;
        }
        while (v7 != v82);
        ++v7;
        v79 += 2;
      }
      while (v7 != v27);
      v7 = v27;
    }
    if (v7 < v9)
      goto LABEL_142;
    result = swift_isUniquelyReferenced_nonNull_native();
    if ((result & 1) == 0)
    {
      result = (uint64_t)sub_22DFD1394(0, *(_QWORD *)(v28 + 16) + 1, 1, (char *)v28);
      v28 = result;
    }
    v30 = *(_QWORD *)(v28 + 16);
    v29 = *(_QWORD *)(v28 + 24);
    v31 = v30 + 1;
    if (v30 >= v29 >> 1)
    {
      result = (uint64_t)sub_22DFD1394((char *)(v29 > 1), v30 + 1, 1, (char *)v28);
      v28 = result;
    }
    *(_QWORD *)(v28 + 16) = v31;
    v32 = v28 + 32;
    v33 = (uint64_t *)(v28 + 32 + 16 * v30);
    *v33 = v9;
    v33[1] = v7;
    v98 = v28;
    if (v30)
      break;
    v31 = 1;
LABEL_90:
    v3 = v96;
    if (v7 >= v96)
      goto LABEL_110;
  }
  while (1)
  {
    v34 = v31 - 1;
    if (v31 >= 4)
    {
      v39 = v32 + 16 * v31;
      v40 = *(_QWORD *)(v39 - 64);
      v41 = *(_QWORD *)(v39 - 56);
      v45 = __OFSUB__(v41, v40);
      v42 = v41 - v40;
      if (v45)
        goto LABEL_127;
      v44 = *(_QWORD *)(v39 - 48);
      v43 = *(_QWORD *)(v39 - 40);
      v45 = __OFSUB__(v43, v44);
      v37 = v43 - v44;
      v38 = v45;
      if (v45)
        goto LABEL_128;
      v46 = v31 - 2;
      v47 = (uint64_t *)(v32 + 16 * (v31 - 2));
      v49 = *v47;
      v48 = v47[1];
      v45 = __OFSUB__(v48, v49);
      v50 = v48 - v49;
      if (v45)
        goto LABEL_129;
      v45 = __OFADD__(v37, v50);
      v51 = v37 + v50;
      if (v45)
        goto LABEL_131;
      if (v51 >= v42)
      {
        v69 = (uint64_t *)(v32 + 16 * v34);
        v71 = *v69;
        v70 = v69[1];
        v45 = __OFSUB__(v70, v71);
        v72 = v70 - v71;
        if (v45)
          goto LABEL_137;
        v62 = v37 < v72;
        goto LABEL_79;
      }
    }
    else
    {
      if (v31 != 3)
      {
        v63 = *(_QWORD *)(v28 + 32);
        v64 = *(_QWORD *)(v28 + 40);
        v45 = __OFSUB__(v64, v63);
        v56 = v64 - v63;
        v57 = v45;
        goto LABEL_73;
      }
      v36 = *(_QWORD *)(v28 + 32);
      v35 = *(_QWORD *)(v28 + 40);
      v45 = __OFSUB__(v35, v36);
      v37 = v35 - v36;
      v38 = v45;
    }
    if ((v38 & 1) != 0)
      goto LABEL_130;
    v46 = v31 - 2;
    v52 = (uint64_t *)(v32 + 16 * (v31 - 2));
    v54 = *v52;
    v53 = v52[1];
    v55 = __OFSUB__(v53, v54);
    v56 = v53 - v54;
    v57 = v55;
    if (v55)
      goto LABEL_132;
    v58 = (uint64_t *)(v32 + 16 * v34);
    v60 = *v58;
    v59 = v58[1];
    v45 = __OFSUB__(v59, v60);
    v61 = v59 - v60;
    if (v45)
      goto LABEL_134;
    if (__OFADD__(v56, v61))
      goto LABEL_136;
    if (v56 + v61 >= v37)
    {
      v62 = v37 < v61;
LABEL_79:
      if (v62)
        v34 = v46;
      goto LABEL_81;
    }
LABEL_73:
    if ((v57 & 1) != 0)
      goto LABEL_133;
    v65 = (uint64_t *)(v32 + 16 * v34);
    v67 = *v65;
    v66 = v65[1];
    v45 = __OFSUB__(v66, v67);
    v68 = v66 - v67;
    if (v45)
      goto LABEL_135;
    if (v68 < v56)
      goto LABEL_90;
LABEL_81:
    v73 = v34 - 1;
    if (v34 - 1 >= v31)
    {
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
      goto LABEL_138;
    }
    if (!v8)
      goto LABEL_151;
    v74 = (uint64_t *)(v32 + 16 * v73);
    v75 = *v74;
    v76 = (_QWORD *)(v32 + 16 * v34);
    v77 = v76[1];
    result = sub_22DFD11F0((char *)(v8 + 16 * *v74), (char *)(v8 + 16 * *v76), v8 + 16 * v77, v97);
    if (v1)
      break;
    if (v77 < v75)
      goto LABEL_124;
    if (v34 > *(_QWORD *)(v98 + 16))
      goto LABEL_125;
    *v74 = v75;
    *(_QWORD *)(v32 + 16 * v73 + 8) = v77;
    v78 = *(_QWORD *)(v98 + 16);
    if (v34 >= v78)
      goto LABEL_126;
    v28 = v98;
    v31 = v78 - 1;
    result = (uint64_t)memmove((void *)(v32 + 16 * v34), v76 + 2, 16 * (v78 - 1 - v34));
    *(_QWORD *)(v98 + 16) = v78 - 1;
    if (v78 <= 2)
      goto LABEL_90;
  }
LABEL_106:
  result = swift_bridgeObjectRelease();
  if (v96 < -1)
    goto LABEL_145;
  *(_QWORD *)(v95 + 16) = 0;
  return swift_bridgeObjectRelease();
}

uint64_t sub_22DFD112C(uint64_t result, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  uint64_t v4;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t *v12;

  if (a3 != a2)
  {
    v4 = a3;
    v6 = result;
    v7 = *a4;
    v8 = *a4 + 16 * a3;
    while (2)
    {
      v9 = (uint64_t *)(v7 + 16 * v4);
      result = *v9;
      v10 = v9[1];
      v11 = v6;
      v12 = (uint64_t *)v8;
      do
      {
        if (result == *(v12 - 2) && v10 == *(v12 - 1))
          break;
        result = sub_22DFDDF58();
        if ((result & 1) == 0)
          break;
        if (!v7)
        {
          __break(1u);
          return result;
        }
        result = *v12;
        v10 = v12[1];
        *(_OWORD *)v12 = *((_OWORD *)v12 - 1);
        *(v12 - 1) = v10;
        *(v12 - 2) = result;
        v12 -= 2;
        ++v11;
      }
      while (v4 != v11);
      ++v4;
      v8 += 16;
      if (v4 != a2)
        continue;
      break;
    }
  }
  return result;
}

uint64_t sub_22DFD11F0(char *a1, char *a2, unint64_t a3, char *a4)
{
  char *v4;
  char *v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  BOOL v14;
  char *v15;
  char *v18;
  char *v19;
  char *v20;
  BOOL v21;
  BOOL v22;
  BOOL v23;

  v4 = a4;
  v6 = a2;
  v7 = a1;
  v8 = a2 - a1;
  v9 = (a2 - a1) / 16;
  v10 = a3 - (_QWORD)a2;
  v11 = (uint64_t)(a3 - (_QWORD)a2) / 16;
  if (v9 >= v11)
  {
    sub_22DF47964(a2, (uint64_t)(a3 - (_QWORD)a2) / 16, a4);
    v12 = (unint64_t)&v4[16 * v11];
    if (v7 >= v6 || v10 < 16)
      goto LABEL_47;
    v18 = (char *)(a3 - 16);
    while (1)
    {
      v19 = v18 + 16;
      v20 = (char *)(v12 - 16);
      v21 = *(_QWORD *)(v12 - 16) == *((_QWORD *)v6 - 2) && *(_QWORD *)(v12 - 8) == *((_QWORD *)v6 - 1);
      if (v21 || (sub_22DFDDF58() & 1) == 0)
      {
        v23 = v19 != (char *)v12 || (unint64_t)v18 >= v12;
        v12 -= 16;
        if (!v23)
          goto LABEL_43;
      }
      else
      {
        v22 = v19 != v6 || v18 >= v6;
        v20 = v6 - 16;
        v6 -= 16;
        if (!v22)
          goto LABEL_43;
      }
      *(_OWORD *)v18 = *(_OWORD *)v20;
LABEL_43:
      v18 -= 16;
      if (v6 <= v7 || v12 <= (unint64_t)v4)
        goto LABEL_47;
    }
  }
  sub_22DF47964(a1, (a2 - a1) / 16, a4);
  v12 = (unint64_t)&v4[16 * v9];
  if ((unint64_t)v6 < a3 && v8 >= 16)
  {
    while (1)
    {
      v14 = *(_QWORD *)v6 == *(_QWORD *)v4 && *((_QWORD *)v6 + 1) == *((_QWORD *)v4 + 1);
      if (!v14 && (sub_22DFDDF58() & 1) != 0)
        break;
      v15 = v4;
      v14 = v7 == v4;
      v4 += 16;
      if (!v14)
        goto LABEL_15;
LABEL_16:
      v7 += 16;
      if ((unint64_t)v4 >= v12 || (unint64_t)v6 >= a3)
        goto LABEL_21;
    }
    v15 = v6;
    v14 = v7 == v6;
    v6 += 16;
    if (v14)
      goto LABEL_16;
LABEL_15:
    *(_OWORD *)v7 = *(_OWORD *)v15;
    goto LABEL_16;
  }
LABEL_21:
  v6 = v7;
LABEL_47:
  sub_22DF47964(v4, (uint64_t)(v12 - (_QWORD)v4) / 16, v6);
  return 1;
}

char *sub_22DFD1394(char *result, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_255DDCFE8);
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

char *sub_22DFD1488(uint64_t a1)
{
  return sub_22DFD1394(0, *(_QWORD *)(a1 + 16), 0, (char *)a1);
}

void sub_22DFD149C(__int128 *a1)
{
  uint64_t v1;
  uint64_t v3;
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
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;

  v3 = sub_22DFDCEC0();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v6 = (char *)&v17 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_255DD7828);
  MEMORY[0x24BDAC7A8](v7);
  v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = _s29AppleConnectSettingsMergeableVMa(0);
  MEMORY[0x24BDAC7A8](v10);
  v12 = (char *)&v17 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_255DD8C00);
  MEMORY[0x24BDAC7A8](v13);
  v15 = (char *)&v17 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_22DFD21A4(v1, (uint64_t)v15, &qword_255DD8C00);
  if (__swift_getEnumTagSinglePayload((uint64_t)v15, 1, v10) == 1)
  {
    sub_22DFDE018();
  }
  else
  {
    sub_22DFB1638((uint64_t)v15, (uint64_t)v12, _s29AppleConnectSettingsMergeableVMa);
    sub_22DFDE018();
    sub_22DFDD448();
    sub_22DFDD544();
    swift_bridgeObjectRelease();
    if (*((_QWORD *)v12 + 3))
    {
      sub_22DFDE018();
      sub_22DFDD448();
      sub_22DFDD544();
      swift_bridgeObjectRelease();
    }
    else
    {
      sub_22DFDE018();
    }
    sub_22DFD21A4((uint64_t)&v12[*(int *)(v10 + 24)], (uint64_t)v9, &qword_255DD7828);
    if (__swift_getEnumTagSinglePayload((uint64_t)v9, 1, v3) == 1)
    {
      sub_22DFDE018();
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v4 + 32))(v6, v9, v3);
      sub_22DFDE018();
      sub_22DFCED9C((uint64_t)&qword_255DDC250);
      sub_22DFDD4C0();
      (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
    }
    v16 = *(_QWORD *)&v12[*(int *)(v10 + 28)];
    sub_22DFDD448();
    sub_22DFD1758(a1, v16);
    swift_bridgeObjectRelease();
    sub_22DF58090((uint64_t)v12, _s29AppleConnectSettingsMergeableVMa);
  }
}

uint64_t sub_22DFD1758(__int128 *a1, uint64_t a2)
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
  unint64_t v16;
  uint64_t result;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;
  uint64_t v22;
  unint64_t v23;
  uint64_t v24;
  int64_t v25;
  unint64_t v26;
  int64_t v27;
  int64_t v28;
  uint64_t v29;
  uint64_t v30;
  char *v31;
  uint64_t v32;
  __int128 v33;
  __int128 v34;
  int64_t v35;
  uint64_t v36;
  int64_t v37;
  uint64_t v38;
  char *v39;
  int64_t v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  uint64_t v45;

  v4 = sub_22DFDD064();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v39 = (char *)&v35 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_255DDCF40);
  MEMORY[0x24BDAC7A8](v7);
  v9 = (char *)&v35 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v10);
  v12 = (char *)&v35 - v11;
  v13 = *(_QWORD *)(a2 + 64);
  v36 = a2 + 64;
  v14 = 1 << *(_BYTE *)(a2 + 32);
  v15 = -1;
  if (v14 < 64)
    v15 = ~(-1 << v14);
  v16 = v15 & v13;
  v37 = (unint64_t)(v14 + 63) >> 6;
  v38 = a2;
  v35 = v37 - 1;
  result = sub_22DFDD448();
  v18 = 0;
  v40 = 0;
  if (!v16)
    goto LABEL_6;
LABEL_4:
  v19 = v18;
  v20 = __clz(__rbit64(v16));
  v16 &= v16 - 1;
  v21 = v20 | (v40 << 6);
LABEL_5:
  v22 = *(_QWORD *)(*(_QWORD *)(v38 + 48) + 8 * v21);
  v23 = *(_QWORD *)(v38 + 56) + *(_QWORD *)(v5 + 72) * v21;
  v24 = __swift_instantiateConcreteTypeFromMangledName(&qword_255DDCF48);
  (*(void (**)(char *, unint64_t, uint64_t))(v5 + 16))(&v9[*(int *)(v24 + 48)], v23, v4);
  *(_QWORD *)v9 = v22;
  __swift_storeEnumTagSinglePayload((uint64_t)v9, 0, 1, v24);
  v18 = v19;
  while (1)
  {
    sub_22DFD1E98((uint64_t)v9, (uint64_t)v12, &qword_255DDCF40);
    v30 = __swift_instantiateConcreteTypeFromMangledName(&qword_255DDCF48);
    if (__swift_getEnumTagSinglePayload((uint64_t)v12, 1, v30) == 1)
    {
      swift_release();
      return sub_22DFDE00C();
    }
    v31 = v39;
    (*(void (**)(char *, char *, uint64_t))(v5 + 32))(v39, &v12[*(int *)(v30 + 48)], v4);
    v32 = *((_QWORD *)a1 + 8);
    v33 = a1[1];
    v41 = *a1;
    v42 = v33;
    v34 = a1[3];
    v43 = a1[2];
    v44 = v34;
    v45 = v32;
    sub_22DFDE00C();
    sub_22DFCED9C((uint64_t)&unk_255DDCF60);
    sub_22DFDD4C0();
    (*(void (**)(char *, uint64_t))(v5 + 8))(v31, v4);
    result = sub_22DFDE030();
    v18 ^= result;
    if (v16)
      goto LABEL_4;
LABEL_6:
    v25 = v40 + 1;
    if (__OFADD__(v40, 1))
    {
      __break(1u);
      goto LABEL_27;
    }
    if (v25 < v37)
    {
      v26 = *(_QWORD *)(v36 + 8 * v25);
      if (v26)
        goto LABEL_9;
      v27 = v40 + 2;
      ++v40;
      if (v25 + 1 < v37)
      {
        v26 = *(_QWORD *)(v36 + 8 * v27);
        if (v26)
        {
          ++v25;
LABEL_9:
          v19 = v18;
          v16 = (v26 - 1) & v26;
          v21 = __clz(__rbit64(v26)) + (v25 << 6);
          v40 = v25;
          goto LABEL_5;
        }
        v28 = v25 + 2;
        v40 = v25 + 1;
        if (v25 + 2 < v37)
          break;
      }
    }
LABEL_21:
    v29 = __swift_instantiateConcreteTypeFromMangledName(&qword_255DDCF48);
    __swift_storeEnumTagSinglePayload((uint64_t)v9, 1, 1, v29);
    v16 = 0;
  }
  v26 = *(_QWORD *)(v36 + 8 * v28);
  if (v26)
  {
    v25 += 2;
    goto LABEL_9;
  }
  while (1)
  {
    v25 = v28 + 1;
    if (__OFADD__(v28, 1))
      break;
    if (v25 >= v37)
    {
      v40 = v35;
      goto LABEL_21;
    }
    v26 = *(_QWORD *)(v36 + 8 * v25);
    ++v28;
    if (v26)
      goto LABEL_9;
  }
LABEL_27:
  __break(1u);
  return result;
}

uint64_t sub_22DFD1AE0(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  if (a2)
  {
    sub_22DFDD448();
    sub_22DFDD448();
    sub_22DFDD448();
    return sub_22DFDD448();
  }
  return result;
}

uint64_t *sub_22DFD1B30(uint64_t *a1)
{
  uint64_t v2;
  uint64_t v3;

  v2 = a1[8];
  v3 = a1[9];
  sub_22DFC4C78(*a1, a1[1]);
  sub_22DFC4C78(v2, v3);
  return a1;
}

unint64_t sub_22DFD1BBC()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;
  _QWORD v3[2];

  result = qword_255DDCF78;
  if (!qword_255DDCF78)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_255DDCF70);
    sub_22DFCED9C((uint64_t)&unk_255DDCF80);
    v3[0] = MEMORY[0x24BEE1798];
    v3[1] = v2;
    result = MEMORY[0x22E323AEC](MEMORY[0x24BEE04E0], v1, v3);
    atomic_store(result, (unint64_t *)&qword_255DDCF78);
  }
  return result;
}

unint64_t sub_22DFD1C40()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;
  _QWORD v3[2];

  result = qword_255DDCF90;
  if (!qword_255DDCF90)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_255DDCF70);
    sub_22DFCED9C((uint64_t)&unk_255DDCF98);
    v3[0] = MEMORY[0x24BEE1770];
    v3[1] = v2;
    result = MEMORY[0x22E323AEC](MEMORY[0x24BEE04C0], v1, v3);
    atomic_store(result, (unint64_t *)&qword_255DDCF90);
  }
  return result;
}

unint64_t sub_22DFD1CC4()
{
  unint64_t result;

  result = qword_255DDCFA8;
  if (!qword_255DDCFA8)
  {
    result = MEMORY[0x22E323AEC](&unk_22DFEB8D4, &unk_24F9B90D0);
    atomic_store(result, (unint64_t *)&qword_255DDCFA8);
  }
  return result;
}

uint64_t *sub_22DFD1D00(uint64_t *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v2 = a1[9];
  v3 = a1[10];
  v4 = a1[15];
  v5 = a1[16];
  sub_22DF580B8(*a1, a1[1]);
  sub_22DFDD448();
  sub_22DFDD448();
  sub_22DF580B8(v2, v3);
  sub_22DF580B8(v4, v5);
  sub_22DFDD448();
  return a1;
}

uint64_t *sub_22DFD1DCC(uint64_t *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v2 = a1[9];
  v3 = a1[10];
  v4 = a1[15];
  v5 = a1[16];
  sub_22DF58210(*a1, a1[1]);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_22DF58210(v2, v3);
  sub_22DF58210(v4, v5);
  swift_bridgeObjectRelease();
  return a1;
}

void sub_22DFD1E98(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v3;

  v3 = OUTLINED_FUNCTION_90_3(a1, a2, a3);
  OUTLINED_FUNCTION_30_11(*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 32));
  OUTLINED_FUNCTION_1_2();
}

unint64_t sub_22DFD1EC4()
{
  unint64_t result;

  result = qword_255DDCFC8;
  if (!qword_255DDCFC8)
  {
    result = MEMORY[0x22E323AEC](&unk_22DFEB5B4, &unk_24F9B9158);
    atomic_store(result, (unint64_t *)&qword_255DDCFC8);
  }
  return result;
}

unint64_t sub_22DFD1F00()
{
  unint64_t result;

  result = qword_255DDCFE0;
  if (!qword_255DDCFE0)
  {
    result = MEMORY[0x22E323AEC](&unk_22DFEB294, &unk_24F9B91F0);
    atomic_store(result, (unint64_t *)&qword_255DDCFE0);
  }
  return result;
}

void sub_22DFD1F3C(uint64_t a1)
{
  sub_22DFD0748(0, *(_QWORD *)(a1 + 16), 0, a1);
}

void sub_22DFD1F50(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v3;

  v3 = OUTLINED_FUNCTION_90_3(a1, a2, a3);
  OUTLINED_FUNCTION_30_11(*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 40));
  OUTLINED_FUNCTION_1_2();
}

unint64_t sub_22DFD1F7C()
{
  unint64_t result;

  result = qword_255DDD018;
  if (!qword_255DDD018)
  {
    result = MEMORY[0x22E323AEC](&unk_22DFEA934, &unk_24F9B9278);
    atomic_store(result, (unint64_t *)&qword_255DDD018);
  }
  return result;
}

uint64_t sub_22DFD1FB8(uint64_t a1)
{
  unint64_t v1;

  v1 = *(_QWORD *)(a1 + 40);
  if (v1 >= 0xFFFFFFFF)
    LODWORD(v1) = -1;
  return (v1 + 1);
}

uint64_t sub_22DFD1FD0(uint64_t a1)
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
  __int128 v12;

  v2 = *(_QWORD *)(a1 + 88);
  v3 = *(_QWORD *)(a1 + 96);
  v4 = *(_QWORD *)(a1 + 104);
  v5 = *(_QWORD *)(a1 + 112);
  v6 = *(_QWORD *)(a1 + 120);
  v7 = *(_QWORD *)(a1 + 128);
  v8 = *(_QWORD *)(a1 + 136);
  v9 = *(_QWORD *)(a1 + 144);
  v12 = *(_OWORD *)(a1 + 152);
  v10 = *(_QWORD *)(a1 + 168);
  sub_22DFC4BD0(*(_QWORD *)a1, *(_QWORD *)(a1 + 8), *(_QWORD *)(a1 + 16), *(_QWORD *)(a1 + 24), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 80));
  sub_22DFC4BD0(v2, v3, v4, v5, v6, v7, v8, v9, v12, *((uint64_t *)&v12 + 1), v10);
  return a1;
}

uint64_t sub_22DFD208C(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;

  v2 = *(_QWORD *)(a1 + 168);
  v3 = *(_QWORD *)(a1 + 176);
  v4 = *(_QWORD *)(a1 + 184);
  v5 = *(_QWORD *)(a1 + 192);
  v6 = *(_QWORD *)(a1 + 200);
  v7 = *(_QWORD *)(a1 + 208);
  v8 = *(_QWORD *)(a1 + 216);
  v9 = *(_QWORD *)(a1 + 224);
  v14 = *(_OWORD *)(a1 + 248);
  v15 = *(_OWORD *)(a1 + 232);
  v13 = *(_OWORD *)(a1 + 264);
  v11 = *(_OWORD *)(a1 + 296);
  v12 = *(_OWORD *)(a1 + 280);
  sub_22DF58154(*(_QWORD *)a1, *(_QWORD *)(a1 + 8), *(_QWORD *)(a1 + 16), *(_QWORD *)(a1 + 24), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 80), *(_QWORD *)(a1 + 88), *(_QWORD *)(a1 + 96), *(_QWORD *)(a1 + 104), *(_QWORD *)(a1 + 112), *(_QWORD *)(a1 + 120), *(_QWORD *)(a1 + 128));
  sub_22DF58154(v2, v3, v4, v5, v6, v7, v8, v9, v15, *((uint64_t *)&v15 + 1), v14, *((uint64_t *)&v14 + 1), v13, *((uint64_t *)&v13 + 1), v12, *((uint64_t *)&v12 + 1), v11);
  return a1;
}

void sub_22DFD21A4(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v3;

  v3 = OUTLINED_FUNCTION_90_3(a1, a2, a3);
  OUTLINED_FUNCTION_30_11(*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 16));
  OUTLINED_FUNCTION_1_2();
}

void _s28ServerConfigurationMergeableV10CodingKeysOMa()
{
  OUTLINED_FUNCTION_32_1();
}

uint64_t sub_22DFD21E0(unsigned __int8 *a1, unsigned int a2)
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
  if (a2 >= 0xFA)
  {
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
    v5 = (*a1 | (v4 << 8)) - 7;
    return (v5 + 1);
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 7;
  v5 = v6 - 7;
  if (!v7)
    v5 = -1;
  return (v5 + 1);
}

uint64_t sub_22DFD2268(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_22DFD22B4 + 4 * byte_22DFEA1FC[v4]))();
  *a1 = a2 + 6;
  return ((uint64_t (*)(void))((char *)sub_22DFD22E8 + 4 * byte_22DFEA1F7[v4]))();
}

uint64_t sub_22DFD22E8(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_22DFD22F0(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x22DFD22F8);
  return result;
}

uint64_t sub_22DFD2304(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x22DFD230CLL);
  *(_BYTE *)result = a2 + 6;
  return result;
}

uint64_t sub_22DFD2310(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_22DFD2318(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

void _s30DeviceDisplayMetaDataMergeableV10CodingKeysOMa()
{
  OUTLINED_FUNCTION_32_1();
}

uint64_t sub_22DFD2330(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_22DFD237C + 4 * byte_22DFEA206[v4]))();
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)sub_22DFD23B0 + 4 * byte_22DFEA201[v4]))();
}

uint64_t sub_22DFD23B0(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_22DFD23B8(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x22DFD23C0);
  return result;
}

uint64_t sub_22DFD23CC(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x22DFD23D4);
  *(_BYTE *)result = a2 + 2;
  return result;
}

uint64_t sub_22DFD23D8(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_22DFD23E0(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

void _s20DeviceGroupMergeableV10CodingKeysOMa()
{
  OUTLINED_FUNCTION_32_1();
}

uint64_t sub_22DFD23F8(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_22DFD2444 + 4 * byte_22DFEA210[v4]))();
  *a1 = a2 + 3;
  return ((uint64_t (*)(void))((char *)sub_22DFD2478 + 4 * byte_22DFEA20B[v4]))();
}

uint64_t sub_22DFD2478(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_22DFD2480(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x22DFD2488);
  return result;
}

uint64_t sub_22DFD2494(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x22DFD249CLL);
  *(_BYTE *)result = a2 + 3;
  return result;
}

uint64_t sub_22DFD24A0(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_22DFD24A8(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

void _s29AppleConnectSettingsMergeableV10CodingKeysOMa()
{
  OUTLINED_FUNCTION_32_1();
}

uint64_t sub_22DFD24C0(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_22DFD250C + 4 * byte_22DFEA21A[v4]))();
  *a1 = a2 + 5;
  return ((uint64_t (*)(void))((char *)sub_22DFD2540 + 4 * byte_22DFEA215[v4]))();
}

uint64_t sub_22DFD2540(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_22DFD2548(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x22DFD2550);
  return result;
}

uint64_t sub_22DFD255C(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x22DFD2564);
  *(_BYTE *)result = a2 + 5;
  return result;
}

uint64_t sub_22DFD2568(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_22DFD2570(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

void _s20ProfileInfoMergeableV10CodingKeysOMa()
{
  OUTLINED_FUNCTION_32_1();
}

unint64_t sub_22DFD258C()
{
  unint64_t result;

  result = qword_255DDD030;
  if (!qword_255DDD030)
  {
    result = MEMORY[0x22E323AEC](&unk_22DFEBC64, &unk_24F9B9560);
    atomic_store(result, (unint64_t *)&qword_255DDD030);
  }
  return result;
}

unint64_t sub_22DFD25CC()
{
  unint64_t result;

  result = qword_255DDD038;
  if (!qword_255DDD038)
  {
    result = MEMORY[0x22E323AEC](&unk_22DFEBD04, &unk_24F9B94D0);
    atomic_store(result, (unint64_t *)&qword_255DDD038);
  }
  return result;
}

unint64_t sub_22DFD260C()
{
  unint64_t result;

  result = qword_255DDD040;
  if (!qword_255DDD040)
  {
    result = MEMORY[0x22E323AEC](&unk_22DFEBDA4, &unk_24F9B9440);
    atomic_store(result, (unint64_t *)&qword_255DDD040);
  }
  return result;
}

unint64_t sub_22DFD264C()
{
  unint64_t result;

  result = qword_255DDD048;
  if (!qword_255DDD048)
  {
    result = MEMORY[0x22E323AEC](&unk_22DFEBE44, &unk_24F9B93B0);
    atomic_store(result, (unint64_t *)&qword_255DDD048);
  }
  return result;
}

unint64_t sub_22DFD268C()
{
  unint64_t result;

  result = qword_255DDD050;
  if (!qword_255DDD050)
  {
    result = MEMORY[0x22E323AEC](&unk_22DFEBEE4, &unk_24F9B9320);
    atomic_store(result, (unint64_t *)&qword_255DDD050);
  }
  return result;
}

uint64_t OUTLINED_FUNCTION_1_26()
{
  return sub_22DFDDF58();
}

uint64_t OUTLINED_FUNCTION_2_29()
{
  return sub_22DFDDF58();
}

uint64_t OUTLINED_FUNCTION_4_27@<X0>(uint64_t (*a1)(uint64_t, uint64_t)@<X8>)
{
  uint64_t v1;
  uint64_t v2;

  return a1(v1, v2);
}

uint64_t OUTLINED_FUNCTION_6_25()
{
  uint64_t v0;
  uint64_t v1;

  return sub_22DF580B8(v1, v0);
}

uint64_t OUTLINED_FUNCTION_13_21()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 8))(v1, v0);
}

uint64_t OUTLINED_FUNCTION_17_14()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(v1 + 8))(v2, v0);
}

uint64_t OUTLINED_FUNCTION_21_12()
{
  return sub_22DFDE06C();
}

uint64_t OUTLINED_FUNCTION_24_15()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_25_15()
{
  return sub_22DFDDEC8();
}

uint64_t OUTLINED_FUNCTION_26_12(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return __swift_getEnumTagSinglePayload(a1, a2, a3);
}

uint64_t OUTLINED_FUNCTION_27_7()
{
  uint64_t v0;
  uint64_t v1;

  return __swift_getEnumTagSinglePayload(v0, 1, v1);
}

uint64_t OUTLINED_FUNCTION_29_15()
{
  uint64_t v0;
  uint64_t v1;

  return sub_22DF58210(v1, v0);
}

uint64_t OUTLINED_FUNCTION_32_11()
{
  return sub_22DFDD544();
}

uint64_t OUTLINED_FUNCTION_34_9()
{
  return sub_22DFDDEEC();
}

uint64_t OUTLINED_FUNCTION_39_9(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  return __swift_storeEnumTagSinglePayload(a1, a2, 1, v2);
}

uint64_t OUTLINED_FUNCTION_40_8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 8))(v1, v0);
}

uint64_t OUTLINED_FUNCTION_41_6()
{
  uint64_t v0;
  uint64_t v1;

  return sub_22DF580B8(v0, v1);
}

uint64_t OUTLINED_FUNCTION_42_4()
{
  return sub_22DFDDEBC();
}

void *OUTLINED_FUNCTION_43_6(uint64_t a1)
{
  void *v1;
  const void *v2;

  return memcpy(v1, v2, *(_QWORD *)(*(_QWORD *)(a1 - 8) + 64));
}

void OUTLINED_FUNCTION_46_5(uint64_t a1)
{
  uint64_t (*v1)(_QWORD);

  sub_22DF58090(a1, v1);
}

uint64_t OUTLINED_FUNCTION_53_7(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_storeEnumTagSinglePayload(a1, a2, a3, a4);
}

uint64_t OUTLINED_FUNCTION_54_6(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return __swift_getEnumTagSinglePayload(a1, a2, a3);
}

uint64_t OUTLINED_FUNCTION_57_7()
{
  uint64_t v0;
  uint64_t v1;

  return sub_22DF580B8(v1, v0);
}

uint64_t OUTLINED_FUNCTION_58_9()
{
  uint64_t v0;
  uint64_t v1;

  return sub_22DF58210(v1, v0);
}

uint64_t OUTLINED_FUNCTION_59_7@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t *a5@<X8>)
{
  *a5 = a1;
  a5[1] = a2;
  a5[2] = a3;
  a5[3] = a4;
  return sub_22DFC4BA0(a1, a2);
}

void OUTLINED_FUNCTION_60_5()
{
  _QWORD *v0;

  v0[21] = 0;
  v0[22] = 0;
  v0[23] = 0;
  v0[20] = 0;
}

void OUTLINED_FUNCTION_61_5(uint64_t a1, uint64_t a2)
{
  uint64_t (*v2)(_QWORD);

  sub_22DFB1CFC(a1, a2, v2);
}

void OUTLINED_FUNCTION_62_5()
{
  sub_22DFC0730();
}

uint64_t OUTLINED_FUNCTION_63_5()
{
  return sub_22DFDD544();
}

unint64_t OUTLINED_FUNCTION_65_6@<X0>(uint64_t a1@<X8>)
{
  return (a1 - 32) | 0x8000000000000000;
}

void OUTLINED_FUNCTION_66_5(uint64_t a1)
{
  uint64_t (*v1)(_QWORD);

  sub_22DF58090(a1, v1);
}

void OUTLINED_FUNCTION_67_5(uint64_t a1)
{
  uint64_t *v1;

  sub_22DF58068(a1, v1);
}

void OUTLINED_FUNCTION_71_3(uint64_t a1, uint64_t a2)
{
  uint64_t *v2;

  sub_22DFD1E98(a1, a2, v2);
}

uint64_t OUTLINED_FUNCTION_73_4()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_76_2(uint64_t a1)
{
  uint64_t v1;

  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(a1 - 8) + 8))(v1, a1);
}

uint64_t OUTLINED_FUNCTION_77_5()
{
  return sub_22DFDE018();
}

uint64_t OUTLINED_FUNCTION_78_3()
{
  uint64_t v0;
  uint64_t v1;

  return sub_22DF58210(v1, *(_QWORD *)(v0 + 96));
}

uint64_t OUTLINED_FUNCTION_80_1()
{
  return sub_22DFC4C78(0, 0);
}

uint64_t OUTLINED_FUNCTION_89_4(uint64_t a1, uint64_t a2)
{
  return sub_22DF58210(a1, a2);
}

uint64_t OUTLINED_FUNCTION_90_3(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  return __swift_instantiateConcreteTypeFromMangledName(a3);
}

uint64_t OUTLINED_FUNCTION_93_3()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(_QWORD, uint64_t))(v0 + 8))(*(_QWORD *)(v2 - 128), v1);
}

void OUTLINED_FUNCTION_94_3(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;

  sub_22DFC4CC8(a1, a2, v2, v3);
}

uint64_t OUTLINED_FUNCTION_95_4()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_96_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 8))(v1, v0);
}

uint64_t OUTLINED_FUNCTION_97_2()
{
  return sub_22DFDDE50();
}

uint64_t OUTLINED_FUNCTION_98_3()
{
  uint64_t v0;
  uint64_t v1;

  return __swift_getEnumTagSinglePayload(v1, 1, v0);
}

uint64_t OUTLINED_FUNCTION_99_3()
{
  return sub_22DFDD448();
}

uint64_t OUTLINED_FUNCTION_101_2(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  return __swift_storeEnumTagSinglePayload(a1, a2, 1, v2);
}

uint64_t OUTLINED_FUNCTION_102_3()
{
  return sub_22DFDD544();
}

uint64_t OUTLINED_FUNCTION_103_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v0 + *(int *)(v2 + 32)) = *(_QWORD *)(v1 + *(int *)(v2 + 32));
  return sub_22DFDD448();
}

uint64_t OUTLINED_FUNCTION_104_3()
{
  return swift_bridgeObjectRetain_n();
}

uint64_t OUTLINED_FUNCTION_105_2@<X0>(unint64_t a1@<X8>)
{
  if (a1 >= 0xFFFFFFFF)
    LODWORD(a1) = -1;
  return (a1 + 1);
}

void OUTLINED_FUNCTION_110_4(uint64_t a1, uint64_t *a2)
{
  uint64_t v2;

  sub_22DF58068(v2, a2);
}

uint64_t OUTLINED_FUNCTION_111_2()
{
  uint64_t v0;

  return v0;
}

void OUTLINED_FUNCTION_112_3(uint64_t a1, uint64_t a2)
{
  uint64_t *v2;

  sub_22DFD21A4(a1, a2, v2);
}

void OUTLINED_FUNCTION_114_3(uint64_t a1)
{
  uint64_t *v1;

  sub_22DF58068(a1, v1);
}

uint64_t OUTLINED_FUNCTION_118_4()
{
  uint64_t v0;

  return v0;
}

uint64_t OUTLINED_FUNCTION_119_3@<X0>(char a1@<W8>)
{
  uint64_t v1;

  *(_BYTE *)(v1 - 232) = a1;
  return sub_22DFDDEC8();
}

uint64_t OUTLINED_FUNCTION_120_4()
{
  return sub_22DF58210(0, 0);
}

uint64_t OUTLINED_FUNCTION_122_2()
{
  uint64_t v0;

  return v0;
}

uint64_t OUTLINED_FUNCTION_127_2(uint64_t a1, uint64_t a2)
{
  return sub_22DFC94FC(a1, a2 & 0xFFFFFFFFFFFFLL | 0xD000000000000000);
}

uint64_t OUTLINED_FUNCTION_128_1(uint64_t a1)
{
  return *(_QWORD *)a1;
}

void OUTLINED_FUNCTION_129_3(uint64_t a1)
{
  uint64_t *v1;

  sub_22DF58068(a1, v1);
}

void OUTLINED_FUNCTION_132_3(uint64_t a1, uint64_t a2)
{
  sub_22DFCA514(a1, a2);
}

uint64_t OUTLINED_FUNCTION_133_2()
{
  __int128 *v0;
  uint64_t v1;

  return sub_22DFD1758(v0, v1);
}

void OUTLINED_FUNCTION_135_2(uint64_t a1, uint64_t a2)
{
  uint64_t *v2;

  sub_22DFD1E98(a1, a2, v2);
}

void OUTLINED_FUNCTION_137_2(uint64_t a1)
{
  uint64_t (*v1)(_QWORD);

  sub_22DF58090(a1, v1);
}

uint64_t OUTLINED_FUNCTION_140_1()
{
  uint64_t *v0;

  return __swift_instantiateConcreteTypeFromMangledName(v0);
}

void OUTLINED_FUNCTION_141_1()
{
  uint64_t v0;
  uint64_t v1;

  sub_22DFCA514(v0, v1);
}

uint64_t OUTLINED_FUNCTION_142_2(uint64_t a1)
{
  uint64_t v1;

  return __swift_getEnumTagSinglePayload(a1, 1, v1);
}

uint64_t OUTLINED_FUNCTION_144_2()
{
  return sub_22DFDD070();
}

uint64_t OUTLINED_FUNCTION_145_2()
{
  return sub_22DFDDE44();
}

uint64_t OUTLINED_FUNCTION_146_2(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(v1 - 96) = a1;
  *(_BYTE *)(v1 - 83) = 2;
  return sub_22DFDD448();
}

uint64_t OUTLINED_FUNCTION_147_2()
{
  __int128 *v0;
  uint64_t v1;

  return sub_22DFD1758(v0, v1);
}

uint64_t OUTLINED_FUNCTION_148_2()
{
  return _s20CarryDeviceMergeableVMa(0);
}

uint64_t OUTLINED_FUNCTION_149_1()
{
  return swift_allocObject();
}

unint64_t OUTLINED_FUNCTION_152_2()
{
  return sub_22DFD1C40();
}

unint64_t OUTLINED_FUNCTION_153_2()
{
  uint64_t v0;

  *(_BYTE *)(v0 - 81) = 0;
  return sub_22DFD1BBC();
}

uint64_t OUTLINED_FUNCTION_154_2()
{
  return sub_22DFDD244();
}

uint64_t OUTLINED_FUNCTION_158_2()
{
  return type metadata accessor for CarrySettings.CarryDevice(0);
}

uint64_t OUTLINED_FUNCTION_163_2()
{
  return sub_22DFDDED4();
}

void OUTLINED_FUNCTION_164_1(uint64_t a1, uint64_t a2)
{
  uint64_t *v2;

  sub_22DFD21A4(a1, a2, v2);
}

uint64_t OUTLINED_FUNCTION_165_1()
{
  return sub_22DFDDE74();
}

uint64_t OUTLINED_FUNCTION_166_2()
{
  return sub_22DFDDEA4();
}

uint64_t OUTLINED_FUNCTION_168_1()
{
  uint64_t *v0;

  return __swift_instantiateConcreteTypeFromMangledName(v0);
}

uint64_t OUTLINED_FUNCTION_169_1()
{
  uint64_t v0;

  return v0;
}

void OUTLINED_FUNCTION_170_1(uint64_t a1, uint64_t a2)
{
  uint64_t (*v2)(_QWORD);

  sub_22DFB1CFC(a1, a2, v2);
}

uint64_t OUTLINED_FUNCTION_171_0()
{
  uint64_t *v0;

  return __swift_instantiateConcreteTypeFromMangledName(v0);
}

uint64_t OUTLINED_FUNCTION_175_1()
{
  uint64_t v0;

  return v0;
}

uint64_t OUTLINED_FUNCTION_177_1()
{
  uint64_t v0;

  return v0;
}

void *OUTLINED_FUNCTION_178_1(void *a1, const void *a2)
{
  return memcpy(a1, a2, 0xA8uLL);
}

uint64_t OUTLINED_FUNCTION_180_0()
{
  return sub_22DFDDE50();
}

uint64_t OUTLINED_FUNCTION_183_1()
{
  uint64_t v0;

  return v0;
}

uint64_t OUTLINED_FUNCTION_186_0()
{
  uint64_t v0;

  return v0 + 32;
}

uint64_t OUTLINED_FUNCTION_188_1()
{
  return _s20CarryDeviceMergeableVMa(0);
}

uint64_t OUTLINED_FUNCTION_189_1()
{
  return _s29AppleConnectSettingsMergeableVMa(0);
}

void OUTLINED_FUNCTION_190_1(uint64_t a1, uint64_t a2)
{
  uint64_t *v2;

  sub_22DFD21A4(a1, a2, v2);
}

uint64_t OUTLINED_FUNCTION_191_1()
{
  uint64_t v0;

  return v0;
}

uint64_t OUTLINED_FUNCTION_196_0()
{
  uint64_t v0;

  return v0;
}

void OUTLINED_FUNCTION_197_1(uint64_t a1, uint64_t a2)
{
  uint64_t *v2;

  sub_22DFD21A4(a1, a2, v2);
}

uint64_t OUTLINED_FUNCTION_198_0()
{
  return sub_22DFDE018();
}

void OUTLINED_FUNCTION_199_1(uint64_t a1, uint64_t a2, uint64_t *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,char a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,char a61)
{
  sub_22DFD1E98((uint64_t)&a40, (uint64_t)&a61, a3);
}

uint64_t OUTLINED_FUNCTION_201_0()
{
  return sub_22DFDE018();
}

uint64_t OUTLINED_FUNCTION_203_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11)
{
  uint64_t v11;

  return sub_22DFC4BD0(a1, a2, a3, a4, a5, a6, a7, v11, a9, a10, a11);
}

uint64_t OUTLINED_FUNCTION_205_1()
{
  return 0x65737546646F7270;
}

uint64_t OUTLINED_FUNCTION_206_1()
{
  uint64_t v0;

  return *(_QWORD *)(v0 - 96);
}

void OUTLINED_FUNCTION_207_0()
{
  _QWORD *v0;

  v0[21] = 0;
  v0[22] = 0;
  v0[23] = 0;
  v0[20] = 0;
}

uint64_t OUTLINED_FUNCTION_209_1()
{
  return sub_22DFDD544();
}

uint64_t OUTLINED_FUNCTION_210_1()
{
  uint64_t v0;

  return __swift_destroy_boxed_opaque_existential_0Tm(*(_QWORD *)(v0 - 120));
}

uint64_t OUTLINED_FUNCTION_212_1(uint64_t a1)
{
  return *(_QWORD *)a1;
}

uint64_t OUTLINED_FUNCTION_215_1()
{
  uint64_t v0;

  return v0 + 360;
}

void OUTLINED_FUNCTION_216_1(uint64_t a1, uint64_t *a2)
{
  uint64_t v2;

  sub_22DF58068(v2, a2);
}

uint64_t OUTLINED_FUNCTION_218_1()
{
  uint64_t v0;

  return v0;
}

uint64_t OUTLINED_FUNCTION_220_1()
{
  return sub_22DFDD544();
}

void OUTLINED_FUNCTION_221_1(uint64_t a1, uint64_t a2)
{
  uint64_t (*v2)(_QWORD);

  sub_22DFB1CFC(a1, a2, v2);
}

uint64_t OUTLINED_FUNCTION_223_0()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_224_1()
{
  uint64_t v0;

  return v0;
}

void OUTLINED_FUNCTION_226_1(uint64_t a1, uint64_t a2)
{
  uint64_t *v2;

  sub_22DFD1E98(a1, a2, v2);
}

uint64_t OUTLINED_FUNCTION_227_1(__int128 *a1)
{
  uint64_t v1;

  return sub_22DFD1758(a1, v1);
}

uint64_t OUTLINED_FUNCTION_228_1()
{
  uint64_t v0;

  return v0;
}

void OUTLINED_FUNCTION_229_1(uint64_t a1, uint64_t a2)
{
  uint64_t (*v2)(_QWORD);

  sub_22DFB1638(a1, a2, v2);
}

uint64_t OUTLINED_FUNCTION_230_1()
{
  return sub_22DFDDE5C();
}

uint64_t OUTLINED_FUNCTION_232_1()
{
  uint64_t v0;

  return v0;
}

void OUTLINED_FUNCTION_233_1(char a1, uint64_t a2)
{
  uint64_t v2;

  sub_22DF46E40(a1, a2, 1, v2);
}

void OUTLINED_FUNCTION_234_1()
{
  void *v0;

  free(v0);
}

uint64_t OUTLINED_FUNCTION_235_1(uint64_t a1)
{
  uint64_t v1;

  return __swift_getEnumTagSinglePayload(a1, 1, v1);
}

uint64_t OUTLINED_FUNCTION_237_1()
{
  return sub_22DFDDF58();
}

uint64_t OUTLINED_FUNCTION_238_1()
{
  uint64_t v0;

  return v0;
}

uint64_t OUTLINED_FUNCTION_241_1()
{
  return type metadata accessor for CarrySettings.AppleConnectSettings(0);
}

uint64_t OUTLINED_FUNCTION_242_1()
{
  return sub_22DFDDEBC();
}

uint64_t OUTLINED_FUNCTION_243_0()
{
  uint64_t v0;

  return v0;
}

void *OUTLINED_FUNCTION_245_0(uint64_t a1)
{
  return malloc(*(_QWORD *)(*(_QWORD *)(a1 - 8) + 64));
}

void sub_22DFD30CC(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _OWORD v10[2];

  if (*(_QWORD *)(a1 + 24))
  {
    sub_22DF33E44((_OWORD *)a1, v10);
    sub_22DF31C24(v10, a2);
  }
  else
  {
    sub_22DF34CE8(a1, &qword_255DD7E80);
    sub_22DF31800(a2, v3, v4, v5, v6, v7, v8, v9, *(uint64_t *)&v10[0], *((uint64_t *)&v10[0] + 1));
    sub_22DF34CE8((uint64_t)v10, &qword_255DD7E80);
  }
}

void sub_22DFD3140(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12[5];

  if (*(_QWORD *)(a1 + 24))
  {
    sub_22DF34CD0((__int128 *)a1, (uint64_t)v12);
    sub_22DF31C78(v12, a2, a3);
    swift_bridgeObjectRelease();
  }
  else
  {
    sub_22DF34CE8(a1, &qword_255DDD060);
    sub_22DF318B0(a2, a3, v5, v6, v7, v8, v9, v10, v11, v12[0]);
    swift_bridgeObjectRelease();
    sub_22DF34CE8((uint64_t)v12, &qword_255DDD060);
  }
}

void sub_22DFD31D4(uint64_t a1@<X0>, uint64_t a2@<X1>, _OWORD *a3@<X8>)
{
  uint64_t v5;
  char v6;

  if (*(_QWORD *)(a2 + 16) && (v5 = sub_22DFCAA08(a1), (v6 & 1) != 0))
  {
    OUTLINED_FUNCTION_7_26(*(_QWORD *)(a2 + 56) + 32 * v5, (uint64_t)a3);
  }
  else
  {
    *a3 = 0u;
    a3[1] = 0u;
    OUTLINED_FUNCTION_1_2();
  }
}

void sub_22DFD321C(uint64_t a1@<X1>, _OWORD *a2@<X8>)
{
  unint64_t v4;
  char v5;

  if (*(_QWORD *)(a1 + 16) && (v4 = sub_22DFCAA6C(), (v5 & 1) != 0))
  {
    OUTLINED_FUNCTION_7_26(*(_QWORD *)(a1 + 56) + 32 * v4, (uint64_t)a2);
  }
  else
  {
    *a2 = 0u;
    a2[1] = 0u;
    OUTLINED_FUNCTION_1_2();
  }
}

double sub_22DFD3264@<D0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  unint64_t v6;
  char v7;
  double result;

  if (*(_QWORD *)(a3 + 16) && (v6 = sub_22DFCA9B0(a1, a2), (v7 & 1) != 0))
  {
    sub_22DF9E474(*(_QWORD *)(a3 + 56) + 40 * v6, a4);
  }
  else
  {
    *(_QWORD *)(a4 + 32) = 0;
    result = 0.0;
    *(_OWORD *)a4 = 0u;
    *(_OWORD *)(a4 + 16) = 0u;
  }
  return result;
}

uint64_t sub_22DFD32B8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v4;
  char v5;
  uint64_t v6;

  if (!*(_QWORD *)(a3 + 16))
    return 0;
  v4 = sub_22DFCA9B0(a1, a2);
  if ((v5 & 1) == 0)
    return 0;
  v6 = *(_QWORD *)(*(_QWORD *)(a3 + 56) + 16 * v4);
  swift_retain();
  return v6;
}

void sub_22DFD330C()
{
  OUTLINED_FUNCTION_4_28();
  sub_22DFDD448();
  OUTLINED_FUNCTION_4();
}

void sub_22DFD3330()
{
  OUTLINED_FUNCTION_4_28();
  sub_22DFDD448();
  OUTLINED_FUNCTION_4();
}

uint64_t sub_22DFD3354()
{
  uint64_t v0;

  v0 = sub_22DFDD448();
  return sub_22DFD33A0(v0);
}

void sub_22DFD337C()
{
  OUTLINED_FUNCTION_4_28();
  sub_22DFDD448();
  OUTLINED_FUNCTION_4();
}

uint64_t sub_22DFD33A0(uint64_t a1)
{
  uint64_t v1;

  swift_beginAccess();
  *(_QWORD *)(v1 + 32) = a1;
  return swift_bridgeObjectRelease();
}

void RoutedRequestHandlerService.__allocating_init()()
{
  swift_allocObject();
  RoutedRequestHandlerService.init()();
  OUTLINED_FUNCTION_1_2();
}

_QWORD *RoutedRequestHandlerService.init()()
{
  _QWORD *v0;
  uint64_t v1;

  __swift_instantiateConcreteTypeFromMangledName(&qword_255DD76E0);
  v1 = MEMORY[0x24BEE4AF8];
  v0[2] = sub_22DFDD430();
  swift_getExtendedExistentialTypeMetadata();
  v0[3] = sub_22DFDD694();
  v0[4] = v1;
  return v0;
}

uint64_t sub_22DFD34A0()
{
  uint64_t v0;

  return sub_22DFD412C(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_22DFD34B0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v4;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  Swift::Bool v11;
  Swift::String v12;
  uint64_t AssociatedConformanceWitness;
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
  uint64_t *v24;
  uint64_t *boxed_opaque_existential_1;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  _QWORD *v32;
  uint64_t v34;
  uint64_t v35[3];
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;

  v7 = *v4;
  sub_22DFDDCA0();
  swift_bridgeObjectRelease();
  v35[0] = 0xD00000000000001FLL;
  v35[1] = 0x800000022DFF26D0;
  sub_22DFDE09C();
  sub_22DFDD568();
  swift_bridgeObjectRelease();
  v8 = *(_QWORD *)(v7 + 80);
  v9 = *(_QWORD *)(v7 + 88);
  v34 = v8;
  type metadata accessor for RoutedRequestHandlerService(0, v8, v9, v10);
  v11 = sub_22DF39308() & 1;
  v12._countAndFlagsBits = 0xD00000000000001FLL;
  v12._object = (void *)0x800000022DFF26D0;
  Logging.ulog(_:extended:)(v12, v11);
  swift_bridgeObjectRelease();
  AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
  v14 = OUTLINED_FUNCTION_15_21();
  v16 = v15;
  v32 = v4;
  sub_22DFD330C();
  sub_22DFD3264(v14, v16, v17, (uint64_t)v35);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v18 = v36;
  sub_22DF34CE8((uint64_t)v35, &qword_255DDD060);
  v20 = OUTLINED_FUNCTION_15_21();
  v22 = v21;
  if (v18)
  {
    v23 = type metadata accessor for RoutedRequestHandlerService.Error(0, v34, v9, v19);
    MEMORY[0x22E323AEC](&unk_22DFEC028, v23);
    swift_allocError();
    *v24 = v20;
    v24[1] = v22;
    return swift_willThrow();
  }
  else
  {
    v36 = a3;
    v37 = a4;
    boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v35);
    OUTLINED_FUNCTION_14_20((uint64_t)boxed_opaque_existential_1);
    OUTLINED_FUNCTION_8_28();
    sub_22DFD3140((uint64_t)v35, v20, v22);
    swift_endAccess();
    v27 = *(_QWORD *)(a4 + 8);
    v36 = a3;
    v37 = v27;
    v28 = __swift_allocate_boxed_opaque_existential_1(v35);
    OUTLINED_FUNCTION_14_20((uint64_t)v28);
    OUTLINED_FUNCTION_8_28();
    v38 = v34;
    swift_getExtendedExistentialTypeMetadata();
    sub_22DFDD718();
    sub_22DFDD6D0();
    swift_endAccess();
    OUTLINED_FUNCTION_8_28();
    sub_22DFD415C((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))sub_22DF4718C);
    v29 = *(_QWORD *)(v32[4] + 16);
    sub_22DFD41C8(v29, (uint64_t (*)(BOOL))sub_22DF4718C);
    v30 = v32[4];
    *(_QWORD *)(v30 + 16) = v29 + 1;
    v31 = v30 + 16 * v29;
    *(_QWORD *)(v31 + 32) = a2;
    *(_QWORD *)(v31 + 40) = AssociatedConformanceWitness;
    return swift_endAccess();
  }
}

uint64_t sub_22DFD37B0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _QWORD *v5;
  _QWORD *v6;

  v6[34] = a5;
  v6[35] = v5;
  v6[32] = a3;
  v6[33] = a4;
  v6[30] = a1;
  v6[31] = a2;
  v6[36] = *v5;
  return OUTLINED_FUNCTION_3_1();
}

uint64_t sub_22DFD37D0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  Swift::Bool v7;
  Swift::String v8;
  __int128 *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD *v16;
  uint64_t v18;
  uint64_t v19;

  *(_QWORD *)(v0 + 232) = *(_QWORD *)(v0 + 280);
  v1 = v0 + 232;
  v2 = *(_QWORD *)(v0 + 288);
  v4 = *(_QWORD *)(v0 + 264);
  v3 = *(_QWORD *)(v0 + 272);
  sub_22DFDD568();
  sub_22DFDD568();
  sub_22DFDDF28();
  v5 = *(_QWORD *)(v2 + 80);
  type metadata accessor for RoutedRequestHandlerService(0, v5, *(_QWORD *)(v2 + 88), v6);
  v7 = sub_22DF39308() & 1;
  v8._countAndFlagsBits = 0;
  v8._object = (void *)0xE000000000000000;
  Logging.ulog(_:extended:)(v8, v7);
  v9 = (__int128 *)(v0 + 96);
  swift_bridgeObjectRelease();
  v10 = (*(uint64_t (**)(uint64_t, uint64_t))(v3 + 32))(v4, v3);
  v12 = v11;
  sub_22DFD330C();
  sub_22DFD3264(v10, v12, v13, v0 + 96);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (*(_QWORD *)(v0 + 120))
  {
    v14 = *(_QWORD *)(v0 + 264);
    sub_22DF34CD0(v9, v0 + 56);
    sub_22DF9E474(v0 + 56, v0 + 176);
    v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_255DD76E0);
    *(_QWORD *)(v0 + 216) = v14;
    *(_QWORD *)(v0 + 224) = v5;
    swift_getExtendedExistentialTypeMetadata();
    if (swift_dynamicCast())
    {
      sub_22DF34CD0((__int128 *)(v0 + 136), v0 + 16);
      __swift_project_boxed_opaque_existential_1((_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 40));
      v16 = (_QWORD *)swift_task_alloc();
      *(_QWORD *)(v0 + 296) = v16;
      *v16 = v0;
      v16[1] = sub_22DFD3AA4;
      return sub_22DFD3F24();
    }
    sub_22DFDE09C();
    OUTLINED_FUNCTION_16_15();
    OUTLINED_FUNCTION_17();
    *(_QWORD *)v19 = v1;
    *(_QWORD *)(v19 + 8) = v15;
    *(_BYTE *)(v19 + 16) = 1;
    swift_willThrow();
    __swift_destroy_boxed_opaque_existential_0Tm(v0 + 56);
  }
  else
  {
    sub_22DF34CE8((uint64_t)v9, &qword_255DDD060);
    sub_22DFDE09C();
    OUTLINED_FUNCTION_16_15();
    OUTLINED_FUNCTION_17();
    *(_QWORD *)v18 = v1;
    *(_QWORD *)(v18 + 8) = v10;
    *(_BYTE *)(v18 + 16) = 0;
    swift_willThrow();
  }
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_22DFD3AA4()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 304) = v0;
  swift_task_dealloc();
  return OUTLINED_FUNCTION_2_2();
}

uint64_t sub_22DFD3B00()
{
  uint64_t v0;

  __swift_destroy_boxed_opaque_existential_0Tm(v0 + 56);
  OUTLINED_FUNCTION_241_0();
  return OUTLINED_FUNCTION_72(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_22DFD3B34()
{
  uint64_t v0;

  __swift_destroy_boxed_opaque_existential_0Tm(v0 + 56);
  OUTLINED_FUNCTION_241_0();
  return OUTLINED_FUNCTION_72(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_22DFD3B68(uint64_t a1)
{
  _QWORD *v1;
  _QWORD *v2;

  v2[15] = a1;
  v2[16] = v1;
  v2[17] = *v1;
  return OUTLINED_FUNCTION_3_1();
}

uint64_t sub_22DFD3B80()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  Swift::Bool v4;
  Swift::String v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t result;
  char v10;
  uint64_t v11;
  uint64_t v12;
  __int128 *v13;
  uint64_t v14;
  _QWORD *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t);

  v1 = *(_QWORD *)(v0 + 136);
  *(_QWORD *)(v0 + 96) = *(_QWORD *)(v0 + 128);
  sub_22DFDD568();
  sub_22DFDD568();
  v2 = *(_QWORD *)(v1 + 80);
  sub_22DFDDF28();
  type metadata accessor for RoutedRequestHandlerService(0, v2, *(_QWORD *)(v1 + 88), v3);
  v4 = sub_22DF39308() & 1;
  v5._countAndFlagsBits = 0;
  v5._object = (void *)0xE000000000000000;
  Logging.ulog(_:extended:)(v5, v4);
  swift_bridgeObjectRelease();
  sub_22DFD3330();
  *(_QWORD *)(v0 + 144) = v6;
  *(_QWORD *)(v0 + 112) = v2;
  *(_QWORD *)(v0 + 152) = swift_getExtendedExistentialTypeMetadata();
  OUTLINED_FUNCTION_76_0();
  v7 = sub_22DFDD658();
  *(_QWORD *)(v0 + 104) = v7;
  v8 = OUTLINED_FUNCTION_76_0();
  if (v7 == MEMORY[0x22E322A18](v8))
  {
    swift_bridgeObjectRelease();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
  else
  {
    v10 = sub_22DFDD6AC();
    sub_22DFDD67C();
    if ((v10 & 1) != 0)
    {
      v12 = *(_QWORD *)(v0 + 144);
      v11 = *(_QWORD *)(v0 + 152);
      sub_22DF9E474(v12 + 40 * v7 + 32, v0 + 16);
      sub_22DFDD448();
      MEMORY[0x22E322A30](v0 + 104, v12, v11);
      swift_bridgeObjectRelease();
      v13 = (__int128 *)OUTLINED_FUNCTION_76_0();
      sub_22DF34CD0(v13, v14);
      __swift_project_boxed_opaque_existential_1((_QWORD *)(v0 + 56), *(_QWORD *)(v0 + 80));
      v15 = (_QWORD *)OUTLINED_FUNCTION_33();
      *(_QWORD *)(v0 + 160) = v15;
      v16 = OUTLINED_FUNCTION_7_16(v15, (uint64_t)sub_22DFD3D9C);
      return v17(v16);
    }
    else
    {
      result = sub_22DFDDCC4();
      __break(1u);
    }
  }
  return result;
}

uint64_t sub_22DFD3D9C()
{
  swift_task_dealloc();
  return OUTLINED_FUNCTION_2_2();
}

uint64_t sub_22DFD3DE8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t result;
  char v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t);

  v2 = *(_QWORD *)(v0 + 144);
  v1 = *(_QWORD *)(v0 + 152);
  OUTLINED_FUNCTION_241_0();
  v3 = *(_QWORD *)(v0 + 104);
  if (v3 == MEMORY[0x22E322A18](v2, v1))
  {
    swift_bridgeObjectRelease();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
  else
  {
    v5 = sub_22DFDD6AC();
    sub_22DFDD67C();
    v6 = *(_QWORD *)(v0 + 144);
    v7 = *(_QWORD *)(v0 + 152);
    if ((v5 & 1) != 0)
    {
      sub_22DF9E474(v6 + 40 * v3 + 32, v0 + 16);
      sub_22DFDD448();
      MEMORY[0x22E322A30](v0 + 104, v6, v7);
      swift_bridgeObjectRelease();
      sub_22DF34CD0((__int128 *)(v0 + 16), v0 + 56);
      __swift_project_boxed_opaque_existential_1((_QWORD *)(v0 + 56), *(_QWORD *)(v0 + 80));
      v8 = (_QWORD *)OUTLINED_FUNCTION_93();
      *(_QWORD *)(v0 + 160) = v8;
      v9 = OUTLINED_FUNCTION_7_16(v8, (uint64_t)sub_22DFD3D9C);
      return v10(v9);
    }
    else
    {
      OUTLINED_FUNCTION_76_0();
      result = sub_22DFDDCC4();
      __break(1u);
    }
  }
  return result;
}

uint64_t sub_22DFD3F24()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t (*v3)(uint64_t);

  v1 = (_QWORD *)OUTLINED_FUNCTION_93();
  *(_QWORD *)(v0 + 16) = v1;
  v2 = OUTLINED_FUNCTION_3_29(v1);
  return v3(v2);
}

uint64_t RoutedRequestHandlerService.deinit()
{
  uint64_t v0;

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t RoutedRequestHandlerService.__deallocating_deinit()
{
  RoutedRequestHandlerService.deinit();
  return swift_deallocClassInstance();
}

void sub_22DFD3FDC()
{
  sub_22DFD337C();
}

uint64_t sub_22DFD3FFC()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;
  uint64_t (*v4)(void);

  v4 = (uint64_t (*)(void))(**(int **)(**(_QWORD **)v0 + 200) + *(_QWORD *)(**(_QWORD **)v0 + 200));
  v2 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v2;
  *v2 = v1;
  v2[1] = sub_22DF35188;
  return v4();
}

uint64_t sub_22DFD4058(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;
  _QWORD *v11;

  v11 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v5 + 16) = v11;
  *v11 = v5;
  v11[1] = sub_22DF35188;
  return sub_22DFD37B0(a1, a2, a3, a4, a5);
}

uint64_t sub_22DFD40DC(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;

  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v3;
  *v3 = v1;
  v3[1] = sub_22DF3518C;
  return sub_22DFD3B68(a1);
}

uint64_t sub_22DFD412C(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t type metadata accessor for RoutedRequestHandlerService(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for RoutedRequestHandlerService);
}

uint64_t sub_22DFD4144()
{
  return sub_22DFD415C((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))sub_22DF46E5C);
}

uint64_t sub_22DFD4150()
{
  return sub_22DFD415C((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))sub_22DF46FA4);
}

uint64_t sub_22DFD415C(uint64_t (*a1)(uint64_t, uint64_t, uint64_t, uint64_t))
{
  uint64_t *v1;
  uint64_t v3;
  uint64_t result;

  v3 = *v1;
  result = swift_isUniquelyReferenced_nonNull_native();
  *v1 = v3;
  if (!(_DWORD)result)
  {
    result = a1(result, *(_QWORD *)(v3 + 16) + 1, 1, v3);
    *v1 = result;
  }
  return result;
}

uint64_t sub_22DFD41B0(uint64_t a1)
{
  return sub_22DFD41C8(a1, (uint64_t (*)(BOOL))sub_22DF46E5C);
}

uint64_t sub_22DFD41BC(uint64_t a1)
{
  return sub_22DFD41C8(a1, (uint64_t (*)(BOOL))sub_22DF46FA4);
}

uint64_t sub_22DFD41C8(uint64_t result, uint64_t (*a2)(BOOL))
{
  uint64_t v2;
  unint64_t v3;

  v3 = *(_QWORD *)(*(_QWORD *)v2 + 24);
  if (result + 1 > (uint64_t)(v3 >> 1))
  {
    result = a2(v3 > 1);
    *(_QWORD *)v2 = result;
  }
  return result;
}

uint64_t type metadata accessor for RoutedRequestHandlerService.Error(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for RoutedRequestHandlerService.Error);
}

unint64_t sub_22DFD4214()
{
  unint64_t result;

  result = qword_255DDD070;
  if (!qword_255DDD070)
  {
    result = MEMORY[0x22E323AEC](&protocol conformance descriptor for TransportRequestHandlerServiceError, &type metadata for TransportRequestHandlerServiceError);
    atomic_store(result, &qword_255DDD070);
  }
  return result;
}

void sub_22DFD4250(_QWORD *a1@<X8>)
{
  uint64_t v2;

  sub_22DFD337C();
  *a1 = v2;
  OUTLINED_FUNCTION_1_2();
}

uint64_t sub_22DFD4278()
{
  return 16;
}

__n128 sub_22DFD4284(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a1;
  *a2 = *a1;
  return result;
}

uint64_t sub_22DFD4290()
{
  return swift_initClassMetadata2();
}

uint64_t method lookup function for RoutedRequestHandlerService()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of RoutedRequestHandlerService.registeredRequestTypes.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 168))();
}

uint64_t dispatch thunk of RoutedRequestHandlerService.__allocating_init()()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 192))();
}

uint64_t dispatch thunk of RoutedRequestHandlerService.activate()()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t (*v3)(void);

  v1 = (_QWORD *)OUTLINED_FUNCTION_33();
  *(_QWORD *)(v0 + 16) = v1;
  *v1 = v0;
  v1[1] = sub_22DF35188;
  return OUTLINED_FUNCTION_72(v3);
}

uint64_t dispatch thunk of RoutedRequestHandlerService.register<A, B>(handler:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 208))();
}

uint64_t dispatch thunk of RoutedRequestHandlerService.handleRequest<A>(_:from:)()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t (*v3)(uint64_t);

  v1 = (_QWORD *)OUTLINED_FUNCTION_93();
  *(_QWORD *)(v0 + 16) = v1;
  v2 = OUTLINED_FUNCTION_3_29(v1);
  return v3(v2);
}

uint64_t dispatch thunk of RoutedRequestHandlerService.handleLostMember(_:)(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t (*v5)(uint64_t);

  v3 = (_QWORD *)OUTLINED_FUNCTION_93();
  *(_QWORD *)(v1 + 16) = v3;
  *v3 = v1;
  v3[1] = sub_22DF3403C;
  return v5(a1);
}

uint64_t OUTLINED_FUNCTION_3_29(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  *a1 = v2;
  a1[1] = v1;
  return v3;
}

uint64_t OUTLINED_FUNCTION_4_28()
{
  return swift_beginAccess();
}

uint64_t OUTLINED_FUNCTION_7_26(uint64_t a1, uint64_t a2)
{
  return sub_22DF35140(a1, a2);
}

uint64_t OUTLINED_FUNCTION_8_28()
{
  return swift_beginAccess();
}

uint64_t OUTLINED_FUNCTION_14_20(uint64_t a1)
{
  uint64_t v1;
  uint64_t (*v2)(uint64_t, uint64_t, uint64_t);
  uint64_t v3;

  return v2(a1, v3, v1);
}

uint64_t OUTLINED_FUNCTION_15_21()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t (*v2)(uint64_t, uint64_t);

  return v2(v0, v1);
}

unint64_t OUTLINED_FUNCTION_16_15()
{
  return sub_22DFD4214();
}

id sub_22DFD4480(uint64_t a1, uint64_t a2, uint64_t a3)
{
  objc_class *v3;
  id v7;

  v7 = objc_allocWithZone(v3);
  return sub_22DFD44D0(a1, a2, a3);
}

id sub_22DFD44D0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  char *v3;
  char *v4;
  objc_class *ObjectType;
  uint64_t *v9;
  uint64_t *boxed_opaque_existential_1;
  uint64_t v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  char *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  id v18;
  objc_super v20;

  v4 = v3;
  ObjectType = (objc_class *)swift_getObjectType();
  v9 = (uint64_t *)&v4[OBJC_IVAR____TtC15HomePodSettings32TransportObservationUpdateObject_observationUpdate];
  v9[3] = a2;
  v9[4] = a3;
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v9);
  v11 = *(_QWORD *)(a2 - 8);
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(v11 + 16))(boxed_opaque_existential_1, a1, a2);
  v12 = *(_QWORD *)(a3 + 8);
  v13 = *(uint64_t (**)(uint64_t, uint64_t))(v12 + 32);
  v14 = v4;
  v15 = v13(a2, v12);
  v16 = (uint64_t *)&v14[OBJC_IVAR____TtC15HomePodSettings32TransportObservationUpdateObject_observationTypeIdentifier];
  *v16 = v15;
  v16[1] = v17;

  v20.receiver = v14;
  v20.super_class = ObjectType;
  v18 = objc_msgSendSuper2(&v20, sel_init);
  (*(void (**)(uint64_t, uint64_t))(v11 + 8))(a1, a2);
  return v18;
}

void sub_22DFD45A8(void *a1)
{
  uint64_t v1;
  void *v3;
  void *v4;

  OUTLINED_FUNCTION_1_18((_QWORD *)(v1
                                  + OBJC_IVAR____TtC15HomePodSettings32TransportObservationUpdateObject_observationUpdate));
  sub_22DF60EFC();
  v3 = (void *)sub_22DFDD4FC();
  v4 = (void *)sub_22DFDD4FC();
  objc_msgSend(a1, sel_encodeObject_forKey_, v3, v4);

}

id sub_22DFD47D0(void *a1)
{
  void *v1;
  uint64_t ObjectType;
  id v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  char v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  uint64_t v13;
  double v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  id v18;
  _QWORD v21[5];

  ObjectType = swift_getObjectType();
  sub_22DF605EC();
  v4 = v1;
  v5 = sub_22DFDDB08();
  if (v5)
  {
    v6 = (void *)v5;
    if (qword_255DD6F58 != -1)
      swift_once();
    v7 = sub_22DFDD514();
    sub_22DF55B8C(v7, v8, (uint64_t)a1, 0x746176726573624FLL, 0xEB000000006E6F69, (uint64_t)v21);
    swift_bridgeObjectRelease();
    v10 = v21[3];
    v11 = v21[4];
    v12 = OUTLINED_FUNCTION_1_18(v21);
    swift_getObjectType();

    v14 = MEMORY[0x24BDAC7A8](v13);
    v16 = (char *)v21 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0) + 8;
    (*(void (**)(char *, _QWORD *, uint64_t, double))(v17 + 16))(v16, v12, v10, v14);
    v18 = sub_22DFD4480((uint64_t)v16, v10, v11);

    OUTLINED_FUNCTION_2_20();
    __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)v21);
  }
  else
  {

    v9 = sub_22DF39308();
    static Logging.ulog(_:_:extended:)(90, 0xD00000000000002ELL, 0x800000022DFF2840, v9 & 1, ObjectType, (uint64_t)&off_24F9B9AE0);

    swift_getObjectType();
    OUTLINED_FUNCTION_2_20();
    return 0;
  }
  return v18;
}

void sub_22DFD4B10()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

uint64_t type metadata accessor for TransportObservationUpdateObject()
{
  return objc_opt_self();
}

uint64_t sub_22DFD4BA4@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  __int128 v5;
  uint64_t v6;

  v3 = v1 + OBJC_IVAR____TtC15HomePodSettings29CoordinationObservationUpdate____lazy_storage___observationUpdate;
  swift_beginAccess();
  sub_22DFD50A8(v3, (uint64_t)&v5);
  if (v6)
    return sub_22DF34CD0(&v5, a1);
  sub_22DF55E2C((uint64_t)&v5);
  sub_22DF55754(*(_QWORD *)(v1 + OBJC_IVAR____TtC15HomePodSettings29CoordinationObservationUpdate_observationUpdateObject)+ OBJC_IVAR____TtC15HomePodSettings32TransportObservationUpdateObject_observationUpdate, a1);
  sub_22DF55754(a1, (uint64_t)&v5);
  swift_beginAccess();
  sub_22DFD50F0((uint64_t)&v5, v3);
  return swift_endAccess();
}

id sub_22DFD4C74(uint64_t a1, uint64_t a2, uint64_t a3)
{
  objc_class *v3;
  id v7;

  v7 = objc_allocWithZone(v3);
  return sub_22DFD4CC4(a1, a2, a3);
}

id sub_22DFD4CC4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  char *v3;
  objc_class *v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  char *v11;
  char *v12;
  id v13;
  objc_super v15;

  v7 = (objc_class *)OUTLINED_FUNCTION_9_3();
  v8 = *(_QWORD *)(a2 - 8);
  MEMORY[0x24BDAC7A8](v7);
  v10 = (char *)&v15 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = &v3[OBJC_IVAR____TtC15HomePodSettings29CoordinationObservationUpdate____lazy_storage___observationUpdate];
  type metadata accessor for TransportObservationUpdateObject();
  *(_OWORD *)v11 = 0u;
  *((_OWORD *)v11 + 1) = 0u;
  *((_QWORD *)v11 + 4) = 0;
  (*(void (**)(char *, uint64_t, uint64_t))(v8 + 16))(v10, a1, a2);
  v12 = v3;
  *(_QWORD *)&v12[OBJC_IVAR____TtC15HomePodSettings29CoordinationObservationUpdate_observationUpdateObject] = sub_22DFD4480((uint64_t)v10, a2, a3);

  v15.receiver = v12;
  v15.super_class = v7;
  v13 = objc_msgSendSuper2(&v15, sel_init);
  (*(void (**)(uint64_t, uint64_t))(v8 + 8))(a1, a2);
  return v13;
}

id sub_22DFD4DD4(uint64_t a1)
{
  char *v1;
  objc_class *v3;
  char *v4;
  objc_super v6;

  v3 = (objc_class *)OUTLINED_FUNCTION_9_3();
  v4 = &v1[OBJC_IVAR____TtC15HomePodSettings29CoordinationObservationUpdate____lazy_storage___observationUpdate];
  *(_OWORD *)v4 = 0u;
  *((_OWORD *)v4 + 1) = 0u;
  *((_QWORD *)v4 + 4) = 0;
  *(_QWORD *)&v1[OBJC_IVAR____TtC15HomePodSettings29CoordinationObservationUpdate_observationUpdateObject] = a1;
  v6.receiver = v1;
  v6.super_class = v3;
  return objc_msgSendSuper2(&v6, sel_init);
}

void sub_22DFD4E34(void *a1)
{
  uint64_t v1;
  uint64_t v3;
  id v4;

  v3 = *(_QWORD *)(v1 + OBJC_IVAR____TtC15HomePodSettings29CoordinationObservationUpdate_observationUpdateObject);
  v4 = (id)sub_22DFDD4FC();
  objc_msgSend(a1, sel_encodeObject_forKey_, v3, v4);

}

id sub_22DFD4EF8(void *a1)
{
  void *v1;
  objc_class *v3;
  id v4;
  uint64_t v5;
  id v6;
  id v7;

  v3 = (objc_class *)OUTLINED_FUNCTION_9_3();
  type metadata accessor for TransportObservationUpdateObject();
  v4 = v1;
  v5 = sub_22DFDDB08();

  if (v5)
  {
    v6 = objc_allocWithZone(v3);
    v7 = sub_22DFD4DD4(v5);

    swift_getObjectType();
    OUTLINED_FUNCTION_0_10();
  }
  else
  {
    static Logging.ulog(_:_:extended:)(90, 0xD000000000000035, 0x800000022DFF29A0, 0, (uint64_t)v3, (uint64_t)&off_24F9B9B10);

    swift_getObjectType();
    OUTLINED_FUNCTION_0_10();
    return 0;
  }
  return v7;
}

void sub_22DFD5018()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

uint64_t type metadata accessor for CoordinationObservationUpdate()
{
  return objc_opt_self();
}

uint64_t sub_22DFD50A8(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_255DD8AD8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_22DFD50F0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_255DD8AD8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

unint64_t static ObservationLifeCycleRequest.typeIdentifier.getter(uint64_t a1, uint64_t a2)
{
  (*(void (**)(void))(*(_QWORD *)(a2 + 8) + 32))();
  sub_22DFDD568();
  swift_bridgeObjectRelease();
  return 0xD00000000000001CLL;
}

uint64_t ObservationLifeCycleRequest.action.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char v4;

  v2 = *(_QWORD *)v1;
  v3 = *(_QWORD *)(v1 + 8);
  v4 = *(_BYTE *)(v1 + 16);
  *(_QWORD *)a1 = *(_QWORD *)v1;
  *(_QWORD *)(a1 + 8) = v3;
  *(_BYTE *)(a1 + 16) = v4;
  return sub_22DF68600(v2, v3, v4);
}

uint64_t sub_22DFD51B0(uint64_t a1, uint64_t a2)
{
  char v3;
  char v4;

  if (a1 == 0x6E6F69746361 && a2 == 0xE600000000000000)
  {
    swift_bridgeObjectRelease();
    v4 = 0;
  }
  else
  {
    v3 = sub_22DFDDF58();
    swift_bridgeObjectRelease();
    v4 = v3 ^ 1;
  }
  return v4 & 1;
}

uint64_t sub_22DFD522C()
{
  return 0x6E6F69746361;
}

uint64_t sub_22DFD5240()
{
  return OUTLINED_FUNCTION_11();
}

uint64_t sub_22DFD5248()
{
  return sub_22DF3AA90();
}

uint64_t sub_22DFD5254()
{
  return sub_22DF3A9F0();
}

uint64_t sub_22DFD5260()
{
  sub_22DFDE000();
  sub_22DF3A9F0();
  return sub_22DFDE030();
}

uint64_t sub_22DFD52A0()
{
  return sub_22DFD522C();
}

uint64_t sub_22DFD52AC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_22DFD51B0(a1, a2);
  *a3 = result & 1;
  return result;
}

uint64_t sub_22DFD52DC()
{
  return OUTLINED_FUNCTION_28_0();
}

uint64_t sub_22DFD52FC@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = OUTLINED_FUNCTION_11();
  *a1 = result & 1;
  return result;
}

uint64_t sub_22DFD532C(uint64_t a1)
{
  MEMORY[0x22E323AEC](&unk_22DFEC2E0, a1);
  return sub_22DFDE084();
}

uint64_t sub_22DFD5360(uint64_t a1)
{
  MEMORY[0x22E323AEC](&unk_22DFEC2E0, a1);
  return sub_22DFDE090();
}

void ObservationLifeCycleRequest.encode(to:)(_QWORD *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5;
  uint64_t v6;

  v5 = type metadata accessor for ObservationLifeCycleRequest.CodingKeys(255, *(_QWORD *)(a2 + 16), *(_QWORD *)(a2 + 24), a4);
  MEMORY[0x22E323AEC](&unk_22DFEC2E0, v5);
  v6 = sub_22DFDDEF8();
  MEMORY[0x24BDAC7A8](v6);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_22DFDE06C();
  swift_getAssociatedTypeWitness();
  OUTLINED_FUNCTION_1_27();
  OUTLINED_FUNCTION_1_27();
  OUTLINED_FUNCTION_1_27();
  type metadata accessor for ObservationRequestAction();
}

void sub_22DFD54E8(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  MEMORY[0x22E323AEC](&protocol conformance descriptor for ObservationRequestAction<A>, a1);
  sub_22DFDDEEC();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 144) + 8))(v2, v1);
  OUTLINED_FUNCTION_1_4();
}

uint64_t type metadata accessor for ObservationLifeCycleRequest.CodingKeys(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for ObservationLifeCycleRequest.CodingKeys);
}

__n128 sub_22DFD554C@<Q0>(__n128 *a1@<X0>, __n128 *a2@<X8>)
{
  unsigned __int8 v2;
  __n128 result;

  v2 = a1[1].n128_u8[0];
  result = *a1;
  *a2 = *a1;
  a2[1].n128_u8[0] = v2;
  return result;
}

void ObservationLifeCycleRequest.init(from:)(_QWORD *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t AssociatedTypeWitness;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD v15[3];
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;

  v15[1] = a5;
  v6 = type metadata accessor for ObservationLifeCycleRequest.CodingKeys(255, a2, a3, a4);
  MEMORY[0x22E323AEC](&unk_22DFEC2E0, v6);
  v16 = sub_22DFDDE8C();
  v7 = *(_QWORD *)(v16 - 8);
  MEMORY[0x24BDAC7A8](v16);
  v9 = (char *)v15 - v8;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  v15[2] = v9;
  v10 = v21;
  sub_22DFDE060();
  if (!v10)
  {
    v15[0] = a1;
    v21 = v7;
    AssociatedTypeWitness = swift_getAssociatedTypeWitness();
    v12 = OUTLINED_FUNCTION_0_25();
    v13 = OUTLINED_FUNCTION_0_25();
    v14 = OUTLINED_FUNCTION_0_25();
    v17 = AssociatedTypeWitness;
    v18 = v12;
    v19 = v13;
    v20 = v14;
    type metadata accessor for ObservationRequestAction();
  }
  __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)a1);
  OUTLINED_FUNCTION_1_4();
}

uint64_t sub_22DFD5724(uint64_t a1)
{
  uint64_t result;

  result = MEMORY[0x22E323AEC](&protocol conformance descriptor for ObservationLifeCycleRequest<A>);
  *(_QWORD *)(a1 + 8) = result;
  return result;
}

void sub_22DFD5750()
{
  JUMPOUT(0x22E323AECLL);
}

unint64_t sub_22DFD5760(uint64_t a1)
{
  return static ObservationLifeCycleRequest.typeIdentifier.getter(*(_QWORD *)(a1 + 16), *(_QWORD *)(a1 + 24));
}

uint64_t sub_22DFD576C(uint64_t a1)
{
  uint64_t result;

  result = MEMORY[0x22E323AEC](&protocol conformance descriptor for ObservationLifeCycleRequest<A>);
  *(_QWORD *)(a1 + 8) = result;
  return result;
}

uint64_t sub_22DFD5798(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  *(_QWORD *)(a1 + 8) = MEMORY[0x22E323AEC](&protocol conformance descriptor for ObservationLifeCycleRequest<A>);
  result = MEMORY[0x22E323AEC](&protocol conformance descriptor for ObservationLifeCycleRequest<A>, a2);
  *(_QWORD *)(a1 + 16) = result;
  return result;
}

void sub_22DFD57DC(_QWORD *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X3>, uint64_t a4@<X8>)
{
  ObservationLifeCycleRequest.init(from:)(a1, *(_QWORD *)(a2 + 16), *(_QWORD *)(a2 + 24), a3, a4);
}

void sub_22DFD57F8(_QWORD *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  ObservationLifeCycleRequest.encode(to:)(a1, a2, a3, a4);
}

uint64_t type metadata accessor for ObservationLifeCycleRequest(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for ObservationLifeCycleRequest);
}

uint64_t sub_22DFD5818(uint64_t a1, int a2, int a3)
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
    return ((uint64_t (*)(void))((char *)sub_22DFD5858 + 4 * byte_22DFEC100[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_22DFD5878 + 4 * byte_22DFEC105[v4]))();
}

_BYTE *sub_22DFD5858(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_22DFD5878(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_22DFD5880(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_22DFD5888(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_22DFD5890(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_22DFD5898(_DWORD *result)
{
  *result = 0;
  return result;
}

void sub_22DFD58A4()
{
  JUMPOUT(0x22E323AECLL);
}

void sub_22DFD58B4()
{
  JUMPOUT(0x22E323AECLL);
}

void sub_22DFD58C4()
{
  JUMPOUT(0x22E323AECLL);
}

uint64_t OUTLINED_FUNCTION_0_25()
{
  return swift_getAssociatedConformanceWitness();
}

uint64_t OUTLINED_FUNCTION_1_27()
{
  return swift_getAssociatedConformanceWitness();
}

uint64_t OUTLINED_FUNCTION_3_30()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 72) + 8))(v0, v1);
}

uint64_t sub_22DFD5910()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t (*v4)(void);

  v1 = (_QWORD *)OUTLINED_FUNCTION_33();
  *(_QWORD *)(v0 + 16) = v1;
  v2 = OUTLINED_FUNCTION_109(v1, (uint64_t)sub_22DF94AAC);
  return OUTLINED_FUNCTION_126(v2, v3, v4);
}

uint64_t sub_22DFD5950(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v6;
  _QWORD *v13;
  uint64_t (*v15)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t);

  v13 = (_QWORD *)OUTLINED_FUNCTION_33();
  *(_QWORD *)(v6 + 16) = v13;
  *v13 = v6;
  v13[1] = sub_22DF3518C;
  return v15(a1, a2, a3, a4, a5, a6);
}

uint64_t sub_22DFD59DC()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t (*v4)(void);

  v1 = (_QWORD *)OUTLINED_FUNCTION_33();
  *(_QWORD *)(v0 + 16) = v1;
  v2 = OUTLINED_FUNCTION_109(v1, (uint64_t)sub_22DF3518C);
  return OUTLINED_FUNCTION_126(v2, v3, v4);
}

uint64_t sub_22DFD5A1C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  _QWORD *v7;
  uint64_t (*v9)(uint64_t, uint64_t, uint64_t);

  v9 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))(**(int **)(a3 + 48) + *(_QWORD *)(a3 + 48));
  v7 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v3 + 16) = v7;
  *v7 = v3;
  v7[1] = sub_22DF3403C;
  return v9(a1, a2, a3);
}

uint64_t sub_22DFD5A94()
{
  return swift_initClassMetadata2();
}

uint64_t sub_22DFD5AE4()
{
  uint64_t v0;

  swift_bridgeObjectRelease();

  return v0;
}

uint64_t sub_22DFD5B08()
{
  sub_22DFD5AE4();
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for SafeStorageMediator(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for SafeStorageMediator);
}

uint64_t dispatch thunk of MemberDiscovery.activate()()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t (*v4)(void);

  v1 = (_QWORD *)OUTLINED_FUNCTION_33();
  *(_QWORD *)(v0 + 16) = v1;
  v2 = OUTLINED_FUNCTION_109(v1, (uint64_t)sub_22DF3403C);
  return OUTLINED_FUNCTION_126(v2, v3, v4);
}

uint64_t dispatch thunk of MemberDiscovery.deactivate()()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t (*v4)(void);

  v1 = (_QWORD *)OUTLINED_FUNCTION_33();
  *(_QWORD *)(v0 + 16) = v1;
  v2 = OUTLINED_FUNCTION_109(v1, (uint64_t)sub_22DF3403C);
  return OUTLINED_FUNCTION_126(v2, v3, v4);
}

uint64_t dispatch thunk of MemberDiscovery.discoveredMembers()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 40))();
}

uint64_t dispatch thunk of MemberDiscovery.lostMembers()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 48))();
}

void sub_22DFD5BC4()
{
  uint64_t v0;

  OUTLINED_FUNCTION_32_9();
  OUTLINED_FUNCTION_5_26();
  v0 = swift_task_alloc();
  OUTLINED_FUNCTION_3_24(v0);
}

void sub_22DFD5BF4()
{
  OUTLINED_FUNCTION_4_7();
}

uint64_t sub_22DFD5C04()
{
  OUTLINED_FUNCTION_2_30((uint64_t)sub_22DFB0C30);
  return OUTLINED_FUNCTION_0_26();
}

uint64_t sub_22DFD5C1C()
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
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v15;

  OUTLINED_FUNCTION_25_13();
  v1[13] = v15;
  v1[14] = v0;
  v1[11] = v2;
  v1[12] = v3;
  v1[9] = v4;
  v1[10] = v5;
  v1[7] = v6;
  v1[8] = v7;
  v1[6] = v8;
  v1[15] = swift_getAssociatedTypeWitness();
  OUTLINED_FUNCTION_11_24();
  v9 = OUTLINED_FUNCTION_11_24();
  v10 = OUTLINED_FUNCTION_15_22(v9);
  v1[16] = v10;
  v1[17] = *(_QWORD *)(v10 - 8);
  v1[18] = OUTLINED_FUNCTION_42();
  v11 = OUTLINED_FUNCTION_21_13();
  v1[19] = v11;
  v1[20] = *(_QWORD *)(v11 - 8);
  v1[21] = OUTLINED_FUNCTION_42();
  v1[22] = OUTLINED_FUNCTION_20_12();
  v1[23] = OUTLINED_FUNCTION_19_18();
  v12 = OUTLINED_FUNCTION_98_1();
  v1[24] = v12;
  v1[25] = *(_QWORD *)(v12 - 8);
  v1[26] = OUTLINED_FUNCTION_42();
  v1[27] = OUTLINED_FUNCTION_29_16();
  v1[28] = v13;
  return swift_task_switch();
}

uint64_t sub_22DFD5D74()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  Swift::Bool v3;
  Swift::String v4;
  __n128 v5;
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12;
  uint64_t v13;
  uint64_t (*v14)(void);
  __n128 v15;
  __n128 v16;
  __n128 v17;
  char v18;

  v1 = *(_QWORD *)(v0 + 208);
  v2 = *(_QWORD *)(v0 + 192);
  v12 = *(_QWORD *)(v0 + 200);
  v15 = *(__n128 *)(v0 + 64);
  v13 = *(_QWORD *)(v0 + 96);
  *(_QWORD *)(v0 + 40) = *(_QWORD *)(v0 + 112);
  v17.n128_u64[0] = 0;
  v17.n128_u64[1] = 0xE000000000000000;
  sub_22DFDDCA0();
  sub_22DFDD568();
  OUTLINED_FUNCTION_32_12();
  sub_22DFDE09C();
  sub_22DFDD568();
  OUTLINED_FUNCTION_107();
  OUTLINED_FUNCTION_10_13();
  swift_checkMetadataState();
  sub_22DFDDCB8();
  sub_22DFDDF28();
  (*(void (**)(uint64_t, uint64_t))(v12 + 8))(v1, v2);
  v3 = sub_22DF39308() & 1;
  v4._countAndFlagsBits = 0;
  v4._object = (void *)0xE000000000000000;
  Logging.ulog(_:extended:)(v4, v3);
  OUTLINED_FUNCTION_107();
  v17 = v15;
  v18 = 0;
  sub_22DFD554C(&v17, &v16);
  v5 = v16;
  *(__n128 *)(v0 + 232) = v16;
  OUTLINED_FUNCTION_26_13(v5.n128_i64[0]);
  v14 = (uint64_t (*)(void))(**(int **)(v13 + 56) + *(_QWORD *)(v13 + 56));
  sub_22DFDD448();
  sub_22DFDD448();
  v6 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 248) = v6;
  v10 = OUTLINED_FUNCTION_25_16((uint64_t)v6, v7, v8, v9);
  MEMORY[0x22E323AEC](&protocol conformance descriptor for ObservationLifeCycleRequest<A>, v10);
  *v6 = v0;
  v6[1] = sub_22DFD5F84;
  OUTLINED_FUNCTION_30_12();
  return v14();
}

uint64_t sub_22DFD5F84()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;

  v2 = *v1;
  *(_QWORD *)(*v1 + 256) = v0;
  swift_task_dealloc();
  if (!v0)
    sub_22DF68638(*(_QWORD *)(v2 + 232), *(_QWORD *)(v2 + 240), *(_BYTE *)(v2 + 33));
  return OUTLINED_FUNCTION_24();
}

uint64_t sub_22DFD5FF0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _BYTE *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v1 = *(_QWORD *)(v0 + 144);
  v2 = *(_QWORD *)(v0 + 120);
  OUTLINED_FUNCTION_36_8(*(_QWORD *)(v0 + 136));
  if (__swift_getEnumTagSinglePayload(v1, 1, v2) == 1)
  {
    v3 = *(_QWORD *)(v0 + 160);
    sub_22DFD6800();
    OUTLINED_FUNCTION_17();
    *v4 = 0;
    swift_willThrow();
    OUTLINED_FUNCTION_31_9(*(uint64_t (**)(uint64_t, uint64_t))(v3 + 8));
    swift_task_dealloc();
    OUTLINED_FUNCTION_28();
    OUTLINED_FUNCTION_34();
  }
  else
  {
    v5 = *(_QWORD *)(v0 + 144);
    v6 = *(_QWORD *)(v0 + 120);
    v7 = *(_QWORD *)(v0 + 48);
    OUTLINED_FUNCTION_200_0(*(_QWORD *)(v0 + 160));
    (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 32))(v7, v5, v6);
    OUTLINED_FUNCTION_28();
    OUTLINED_FUNCTION_34();
    OUTLINED_FUNCTION_67();
  }
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_22DFD60E8()
{
  uint64_t v0;

  sub_22DF68638(*(_QWORD *)(v0 + 232), *(_QWORD *)(v0 + 240), *(_BYTE *)(v0 + 33));
  swift_task_dealloc();
  OUTLINED_FUNCTION_34();
  OUTLINED_FUNCTION_67();
  return OUTLINED_FUNCTION_52(*(uint64_t (**)(void))(v0 + 8));
}

void sub_22DFD6134()
{
  uint64_t v0;

  OUTLINED_FUNCTION_25_13();
  OUTLINED_FUNCTION_4_24();
  v0 = swift_task_alloc();
  OUTLINED_FUNCTION_3_24(v0);
}

void sub_22DFD6164()
{
  OUTLINED_FUNCTION_4_7();
}

uint64_t sub_22DFD6174()
{
  OUTLINED_FUNCTION_4_29((uint64_t)sub_22DFB0C30);
  return OUTLINED_FUNCTION_1_28();
}

uint64_t sub_22DFD618C()
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
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  OUTLINED_FUNCTION_25_13();
  v1[12] = v2;
  v1[13] = v0;
  v1[10] = v3;
  v1[11] = v4;
  v1[8] = v5;
  v1[9] = v6;
  v1[6] = v7;
  v1[7] = v8;
  v1[14] = swift_getAssociatedTypeWitness();
  OUTLINED_FUNCTION_11_24();
  v9 = OUTLINED_FUNCTION_11_24();
  v10 = OUTLINED_FUNCTION_15_22(v9);
  v1[15] = v10;
  v1[16] = *(_QWORD *)(v10 - 8);
  v1[17] = OUTLINED_FUNCTION_42();
  v11 = OUTLINED_FUNCTION_21_13();
  v1[18] = v11;
  v1[19] = *(_QWORD *)(v11 - 8);
  v1[20] = OUTLINED_FUNCTION_42();
  v1[21] = OUTLINED_FUNCTION_20_12();
  v1[22] = OUTLINED_FUNCTION_19_18();
  v12 = OUTLINED_FUNCTION_98_1();
  v1[23] = v12;
  v1[24] = *(_QWORD *)(v12 - 8);
  v1[25] = OUTLINED_FUNCTION_42();
  v1[26] = OUTLINED_FUNCTION_29_16();
  v1[27] = v13;
  return OUTLINED_FUNCTION_24();
}

uint64_t sub_22DFD62D8()
{
  __n128 *v0;
  unint64_t v1;
  unint64_t v2;
  Swift::Bool v3;
  Swift::String v4;
  __n128 v5;
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v12;
  unint64_t v13;
  uint64_t (*v14)(void);
  unint64_t v15;
  __n128 v16;
  __n128 v17;
  char v18;

  v1 = v0[12].n128_u64[1];
  v2 = v0[11].n128_u64[1];
  v12 = v0[12].n128_u64[0];
  v13 = v0[5].n128_u64[1];
  v15 = v0[4].n128_u64[0];
  v0[2].n128_u64[1] = v0[6].n128_u64[1];
  v17.n128_u64[0] = 0;
  v17.n128_u64[1] = 0xE000000000000000;
  sub_22DFDDCA0();
  sub_22DFDD568();
  OUTLINED_FUNCTION_32_12();
  sub_22DFDE09C();
  sub_22DFDD568();
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_10_13();
  swift_checkMetadataState();
  sub_22DFDDCB8();
  sub_22DFDDF28();
  (*(void (**)(unint64_t, unint64_t))(v12 + 8))(v1, v2);
  v3 = sub_22DF39308() & 1;
  v4._countAndFlagsBits = 0;
  v4._object = (void *)0xE000000000000000;
  Logging.ulog(_:extended:)(v4, v3);
  OUTLINED_FUNCTION_107();
  v17 = (__n128)v15;
  v18 = 1;
  sub_22DFD554C(&v17, &v16);
  v5 = v16;
  v0[14] = v16;
  OUTLINED_FUNCTION_26_13(v5.n128_i64[0]);
  v14 = (uint64_t (*)(void))(**(int **)(v13 + 56) + *(_QWORD *)(v13 + 56));
  sub_22DFDD448();
  v6 = (_QWORD *)swift_task_alloc();
  v0[15].n128_u64[0] = (unint64_t)v6;
  v10 = OUTLINED_FUNCTION_25_16((uint64_t)v6, v7, v8, v9);
  MEMORY[0x22E323AEC](&protocol conformance descriptor for ObservationLifeCycleRequest<A>, v10);
  *v6 = v0;
  v6[1] = sub_22DFD64EC;
  OUTLINED_FUNCTION_30_12();
  return v14();
}

uint64_t sub_22DFD64EC()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;

  v2 = *v1;
  *(_QWORD *)(*v1 + 248) = v0;
  swift_task_dealloc();
  if (!v0)
    sub_22DF68638(*(_QWORD *)(v2 + 224), *(_QWORD *)(v2 + 232), *(_BYTE *)(v2 + 33));
  return OUTLINED_FUNCTION_24();
}

uint64_t sub_22DFD6558()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _BYTE *v6;

  v1 = *(_QWORD *)(v0 + 136);
  v2 = *(_QWORD *)(v0 + 112);
  OUTLINED_FUNCTION_36_8(*(_QWORD *)(v0 + 128));
  if (__swift_getEnumTagSinglePayload(v1, 1, v2) == 1)
  {
    OUTLINED_FUNCTION_200_0(*(_QWORD *)(v0 + 152));
    OUTLINED_FUNCTION_28();
    OUTLINED_FUNCTION_34();
    OUTLINED_FUNCTION_67();
  }
  else
  {
    v3 = *(_QWORD *)(v0 + 152);
    v4 = *(_QWORD *)(v0 + 136);
    v5 = *(_QWORD *)(v0 + 112);
    sub_22DFD6800();
    OUTLINED_FUNCTION_17();
    *v6 = 1;
    swift_willThrow();
    OUTLINED_FUNCTION_31_9(*(uint64_t (**)(uint64_t, uint64_t))(v3 + 8));
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(v4, v5);
    swift_task_dealloc();
    OUTLINED_FUNCTION_28();
    OUTLINED_FUNCTION_34();
  }
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_22DFD6654()
{
  uint64_t v0;

  sub_22DF68638(*(_QWORD *)(v0 + 224), *(_QWORD *)(v0 + 232), *(_BYTE *)(v0 + 33));
  swift_task_dealloc();
  OUTLINED_FUNCTION_34();
  OUTLINED_FUNCTION_67();
  return OUTLINED_FUNCTION_52(*(uint64_t (**)(void))(v0 + 8));
}

void sub_22DFD66A0()
{
  uint64_t v0;

  OUTLINED_FUNCTION_32_9();
  OUTLINED_FUNCTION_5_26();
  v0 = swift_task_alloc();
  OUTLINED_FUNCTION_2_24(v0);
}

void sub_22DFD66D0()
{
  OUTLINED_FUNCTION_4_7();
}

uint64_t sub_22DFD66E0()
{
  OUTLINED_FUNCTION_2_30((uint64_t)sub_22DFB0C30);
  return OUTLINED_FUNCTION_0_26();
}

void sub_22DFD66F8()
{
  uint64_t v0;

  OUTLINED_FUNCTION_25_13();
  OUTLINED_FUNCTION_4_24();
  v0 = swift_task_alloc();
  OUTLINED_FUNCTION_2_24(v0);
}

void sub_22DFD6728()
{
  OUTLINED_FUNCTION_4_7();
}

uint64_t sub_22DFD6738()
{
  OUTLINED_FUNCTION_4_29((uint64_t)sub_22DFAE1B4);
  return OUTLINED_FUNCTION_1_28();
}

void sub_22DFD6750()
{
  uint64_t v0;

  OUTLINED_FUNCTION_32_9();
  OUTLINED_FUNCTION_5_26();
  v0 = swift_task_alloc();
  OUTLINED_FUNCTION_18_18(v0);
  OUTLINED_FUNCTION_4_7();
}

uint64_t sub_22DFD6790()
{
  OUTLINED_FUNCTION_2_30((uint64_t)sub_22DF44464);
  return OUTLINED_FUNCTION_0_26();
}

void sub_22DFD67A8()
{
  uint64_t v0;

  OUTLINED_FUNCTION_25_13();
  OUTLINED_FUNCTION_4_24();
  v0 = swift_task_alloc();
  OUTLINED_FUNCTION_18_18(v0);
  OUTLINED_FUNCTION_4_7();
}

uint64_t sub_22DFD67E8()
{
  OUTLINED_FUNCTION_4_29((uint64_t)sub_22DF39390);
  return OUTLINED_FUNCTION_1_28();
}

unint64_t sub_22DFD6800()
{
  unint64_t result;

  result = qword_255DDD470;
  if (!qword_255DDD470)
  {
    result = MEMORY[0x22E323AEC](&unk_22DFE8324, &type metadata for TransportObservationError);
    atomic_store(result, (unint64_t *)&qword_255DDD470);
  }
  return result;
}

uint64_t OUTLINED_FUNCTION_0_26()
{
  return sub_22DFD5C1C();
}

uint64_t OUTLINED_FUNCTION_1_28()
{
  return sub_22DFD618C();
}

uint64_t OUTLINED_FUNCTION_2_30@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  uint64_t v5;

  *v4 = v2;
  v4[1] = a1;
  *(_QWORD *)(v5 + 16) = v1;
  return v3;
}

uint64_t OUTLINED_FUNCTION_4_29@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;

  *v3 = v1;
  v3[1] = a1;
  return v2;
}

uint64_t OUTLINED_FUNCTION_11_24()
{
  return swift_getAssociatedConformanceWitness();
}

uint64_t OUTLINED_FUNCTION_15_22(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  return type metadata accessor for ObservationLifeCycleResponse.ObservationResult(0, v1, v2, a1);
}

uint64_t OUTLINED_FUNCTION_18_18(uint64_t a1)
{
  uint64_t *v1;
  uint64_t v2;

  *(_QWORD *)(v2 + 16) = a1;
  return type metadata accessor for RapportTransport(0, v1[10], v1[11], v1[12]);
}

uint64_t OUTLINED_FUNCTION_19_18()
{
  return swift_getAssociatedConformanceWitness();
}

uint64_t OUTLINED_FUNCTION_20_12()
{
  return swift_getAssociatedTypeWitness();
}

uint64_t OUTLINED_FUNCTION_21_13()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return type metadata accessor for ObservationLifeCycleResponse(0, v1, v2, v0);
}

uint64_t OUTLINED_FUNCTION_25_16(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;

  return type metadata accessor for ObservationLifeCycleRequest(0, v5, v4, a4);
}

void OUTLINED_FUNCTION_26_13(uint64_t a1@<X8>)
{
  uint64_t v1;
  char v2;
  uint64_t v3;

  *(_BYTE *)(v3 + 33) = v2;
  *(_QWORD *)(v3 + 16) = a1;
  *(_QWORD *)(v3 + 24) = v1;
  *(_BYTE *)(v3 + 32) = v2;
}

uint64_t OUTLINED_FUNCTION_29_16()
{
  return sub_22DFDD730();
}

uint64_t OUTLINED_FUNCTION_31_9@<X0>(uint64_t (*a1)(uint64_t, uint64_t)@<X8>)
{
  uint64_t v1;
  uint64_t v2;

  return a1(v2, v1);
}

uint64_t OUTLINED_FUNCTION_32_12()
{
  return sub_22DFDD568();
}

uint64_t OUTLINED_FUNCTION_36_8@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return (*(uint64_t (**)(uint64_t))(a1 + 16))(v1);
}

uint64_t sub_22DFD69BC()
{
  return sub_22DFDD430();
}

uint64_t sub_22DFD69E8(void *a1, char a2, uint64_t a3, uint64_t a4)
{
  return sub_22DFD6AA0(a1, a2 & 1, a3, a4);
}

uint64_t sub_22DFD69FC()
{
  uint64_t v0;

  return sub_22DFD814C(v0, (uint64_t (*)(_QWORD))type metadata accessor for CallObservationUpdate, &qword_255DD9C58, (void (*)(char *, char *))sub_22DF97580);
}

uint64_t sub_22DFD6A2C()
{
  uint64_t v0;

  return sub_22DFD814C(v0, type metadata accessor for TimerOperationRequest, &qword_255DD9C60, (void (*)(char *, char *))sub_22DFDAF2C);
}

uint64_t sub_22DFD6A60()
{
  uint64_t v0;

  return sub_22DFD814C(v0, type metadata accessor for TimerOperationResponse, &qword_255DD9C68, (void (*)(char *, char *))sub_22DFDAF2C);
}

uint64_t sub_22DFD6A90(uint64_t a1, char a2)
{
  return sub_22DFD8898(a1, a2 & 1);
}

uint64_t sub_22DFD6A98(uint64_t a1, char a2)
{
  return sub_22DFD9010(a1, a2 & 1);
}

uint64_t sub_22DFD6AA0(void *a1, char a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8;
  uint64_t v9;
  char *v10;
  void *v11;
  ValueMetadata *v12;
  uint64_t v13;
  void *object;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  uint64_t v19;
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
  uint64_t *v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  Swift::String v35;
  uint64_t v36;
  unint64_t v37;
  uint64_t v38;
  unint64_t v39;
  unint64_t v40;
  uint64_t v41;
  uint64_t v42;
  Swift::String v43;
  Swift::String v44;
  uint64_t result;
  uint64_t v46;
  void *v47;
  uint64_t v48;
  uint64_t countAndFlagsBits;
  uint64_t v50;
  uint64_t v51;
  __int128 v52;
  _OWORD *v53;
  uint64_t *v54;
  __int128 *v55;
  __int128 *v56;
  uint64_t v57;
  uint64_t v58;
  unint64_t v59;
  Swift::String v60;
  uint64_t v61;
  Swift::String v62;
  _OWORD v63[2];
  Swift::String v64;
  __int128 v65;
  __int128 v66;
  uint64_t v67;
  Swift::String v68;
  __int128 v69;
  __int128 v70;
  Swift::Int_optional v71;

  v57 = sub_22DFDE054();
  v8 = *(_QWORD *)(v57 - 8);
  MEMORY[0x24BDAC7A8](v57);
  v10 = (char *)&v46 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v68._countAndFlagsBits = (uint64_t)&type metadata for SettingsObservationUpdate;
  __swift_instantiateConcreteTypeFromMangledName(&qword_255DD9C78);
  v64._countAndFlagsBits = sub_22DFDD520();
  v64._object = v11;
  if (swift_isClassType())
    v12 = &type metadata for SettingsObservationUpdate;
  else
    v12 = 0;
  if (v12)
  {
    v68._countAndFlagsBits = (uint64_t)a1;
    LOBYTE(v68._object) = a2 & 1;
    *(_QWORD *)&v69 = a3;
    *((_QWORD *)&v69 + 1) = a4;
    sub_22DF6A330(a1, a2 & 1);
    sub_22DFDD448();
    v13 = sub_22DFDDF70();
    swift_unknownObjectRelease();
    v68._countAndFlagsBits = 0;
    v68._object = (void *)0xE000000000000000;
    sub_22DFDD568();
    v62._countAndFlagsBits = v13;
    sub_22DFDDD3C();
    sub_22DFDD568();
    swift_bridgeObjectRelease();
  }
  v68._countAndFlagsBits = 60;
  v68._object = (void *)0xE100000000000000;
  sub_22DFDD568();
  swift_bridgeObjectRelease();
  sub_22DFDD448();
  sub_22DFDD568();
  swift_bridgeObjectRelease();
  object = v68._object;
  countAndFlagsBits = v68._countAndFlagsBits;
  *((_QWORD *)&v69 + 1) = &type metadata for SettingsObservationUpdate;
  v15 = swift_allocObject();
  v68._countAndFlagsBits = v15;
  *(_QWORD *)(v15 + 16) = a1;
  *(_BYTE *)(v15 + 24) = a2 & 1;
  *(_QWORD *)(v15 + 32) = a3;
  *(_QWORD *)(v15 + 40) = a4;
  sub_22DF6A330(a1, a2 & 1);
  sub_22DFDD448();
  sub_22DFDE03C();
  sub_22DFDE048();
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v57);
  swift_retain();
  sub_22DFDDD30();
  swift_release();
  sub_22DFDDDF0();
  if (*((_QWORD *)&v70 + 1))
  {
    v16 = MEMORY[0x24BEE4AF8];
    do
    {
      v64 = v68;
      v65 = v69;
      v66 = v70;
      sub_22DFD9788(&v64._countAndFlagsBits, (void (*)(char *, char *))sub_22DFDAF2C, &v62._countAndFlagsBits);
      sub_22DF34CE8((uint64_t)&v64, &qword_255DDB028);
      v17 = v62._countAndFlagsBits;
      if (v62._countAndFlagsBits)
      {
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          sub_22DF46EF8();
          v16 = v20;
        }
        v18 = *(_QWORD *)(v16 + 16);
        v19 = v16;
        if (v18 >= *(_QWORD *)(v16 + 24) >> 1)
        {
          sub_22DF46EF8();
          v19 = v21;
        }
        *(_QWORD *)(v19 + 16) = v18 + 1;
        v16 = v19;
        *(_QWORD *)(v19 + 8 * v18 + 32) = v17;
      }
      sub_22DFDDDF0();
    }
    while (*((_QWORD *)&v70 + 1));
  }
  else
  {
    v16 = MEMORY[0x24BEE4AF8];
  }
  v48 = v16;
  swift_release();
  swift_release();
  v22 = MEMORY[0x24BEE4AD8];
  v23 = MEMORY[0x24BEE4AF8];
  v24 = sub_22DFDD430();
  v25 = *(_QWORD *)(v24 + 16);
  if (v25)
  {
    v47 = object;
    v67 = v23;
    sub_22DF48030(0, v25, 0);
    v26 = sub_22DF97428(v24);
    if (v26 < 0 || (v28 = v26, v26 >= 1 << *(_BYTE *)(v24 + 32)))
    {
LABEL_37:
      __break(1u);
    }
    else
    {
      v29 = v24 + 64;
      v56 = &v69;
      v55 = &v65;
      v54 = &v61;
      v53 = v63;
      v52 = xmmword_22DFE17A0;
      v51 = v22 + 8;
      v50 = v24 + 64;
      while ((*(_QWORD *)(v29 + 8 * (v28 >> 6)) & (1 << v28)) != 0)
      {
        if ((_DWORD)v27 != *(_DWORD *)(v24 + 36))
          goto LABEL_39;
        v57 = v27;
        v30 = (uint64_t *)(*(_QWORD *)(v24 + 48) + 16 * v28);
        v32 = *v30;
        v31 = (void *)v30[1];
        v33 = (uint64_t)v56;
        sub_22DF35140(*(_QWORD *)(v24 + 56) + 32 * v28, (uint64_t)v56);
        v68._countAndFlagsBits = v32;
        v68._object = v31;
        v64._countAndFlagsBits = v32;
        v64._object = v31;
        sub_22DF35140(v33, (uint64_t)v55);
        v62 = v64;
        v63[0] = v65;
        v63[1] = v66;
        swift_bridgeObjectRetain_n();
        sub_22DF34CE8((uint64_t)&v68, &qword_255DD81F0);
        __swift_instantiateConcreteTypeFromMangledName(&qword_255DD8208);
        v34 = swift_allocObject();
        *(_OWORD *)(v34 + 16) = v52;
        v35 = v62;
        v60 = v62;
        v36 = (uint64_t)v54;
        sub_22DF35140((uint64_t)v53, (uint64_t)v54);
        *(Swift::String *)(v34 + 32) = v35;
        v58 = 0;
        v59 = 0xE000000000000000;
        sub_22DFDD448();
        sub_22DFDDD3C();
        v37 = v59;
        *(_QWORD *)(v34 + 48) = v58;
        *(_QWORD *)(v34 + 56) = v37;
        __swift_destroy_boxed_opaque_existential_0Tm(v36);
        sub_22DF34CE8((uint64_t)&v62, &qword_255DD81F0);
        v38 = v67;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          sub_22DF48030(0, *(_QWORD *)(v38 + 16) + 1, 1);
          v38 = v67;
        }
        v40 = *(_QWORD *)(v38 + 16);
        v39 = *(_QWORD *)(v38 + 24);
        if (v40 >= v39 >> 1)
        {
          sub_22DF48030(v39 > 1, v40 + 1, 1);
          v38 = v67;
        }
        *(_QWORD *)(v38 + 16) = v40 + 1;
        *(_QWORD *)(v38 + 8 * v40 + 32) = v34;
        if ((uint64_t)v28 >= -(-1 << *(_BYTE *)(v24 + 32)))
          goto LABEL_40;
        v29 = v50;
        if ((*(_QWORD *)(v50 + 8 * (v28 >> 6)) & (1 << v28)) == 0)
          goto LABEL_41;
        if ((_DWORD)v57 != *(_DWORD *)(v24 + 36))
          goto LABEL_42;
        v41 = sub_22DFDDBEC();
        if (!--v25)
        {
          swift_bridgeObjectRelease();
          object = v47;
          goto LABEL_36;
        }
        v28 = v41;
        if ((v41 & 0x8000000000000000) == 0)
        {
          v27 = *(unsigned int *)(v24 + 36);
          if (v41 < 1 << *(_BYTE *)(v24 + 32))
            continue;
        }
        goto LABEL_37;
      }
    }
    __break(1u);
LABEL_39:
    __break(1u);
LABEL_40:
    __break(1u);
LABEL_41:
    __break(1u);
LABEL_42:
    __break(1u);
    sub_22DF34CE8((uint64_t)&v64, &qword_255DDB028);
    swift_bridgeObjectRelease();
    result = swift_release();
    __break(1u);
  }
  else
  {
    swift_bridgeObjectRelease();
    v38 = MEMORY[0x24BEE4AF8];
LABEL_36:
    v68._countAndFlagsBits = v48;
    sub_22DF48084(v38);
    v42 = v68._countAndFlagsBits;
    v68._countAndFlagsBits = countAndFlagsBits;
    v68._object = object;
    *(_QWORD *)&v69 = 0;
    *((_QWORD *)&v69 + 1) = v42;
    *(_QWORD *)&v70 = 0;
    v43._countAndFlagsBits = 2128928;
    v43._object = (void *)0xE300000000000000;
    v71.value = 0;
    v71.is_nil = 1;
    v44 = TableFormatter.Table.string(colSeparator:maxColWidth:)(v43, v71);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    v64 = v44;
    v62._countAndFlagsBits = 10;
    v62._object = (void *)0xE100000000000000;
    v60._countAndFlagsBits = 2105354;
    v60._object = (void *)0xE300000000000000;
    sub_22DF974AC();
    sub_22DF974E8();
    sub_22DFDDA6C();
    swift_bridgeObjectRelease();
    return v68._countAndFlagsBits;
  }
  return result;
}

uint64_t sub_22DFD725C(char a1, uint64_t a2, unint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  void *v10;
  ValueMetadata *v11;
  uint64_t v12;
  void *object;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  unint64_t v26;
  uint64_t v27;
  uint64_t *v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  Swift::String v33;
  uint64_t v34;
  unint64_t v35;
  uint64_t v36;
  unint64_t v37;
  unint64_t v38;
  uint64_t v39;
  uint64_t v40;
  Swift::String v41;
  Swift::String v42;
  uint64_t result;
  uint64_t v44;
  void *v45;
  uint64_t v46;
  uint64_t countAndFlagsBits;
  uint64_t v48;
  uint64_t v49;
  __int128 v50;
  _OWORD *v51;
  uint64_t *v52;
  __int128 *v53;
  __int128 *v54;
  uint64_t v55;
  uint64_t v56;
  unint64_t v57;
  Swift::String v58;
  uint64_t v59;
  Swift::String v60;
  _OWORD v61[2];
  Swift::String v62;
  __int128 v63;
  __int128 v64;
  uint64_t v65;
  Swift::String v66;
  __int128 v67;
  __int128 v68;
  Swift::Int_optional v69;

  v6 = sub_22DFDE054();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v44 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v66._countAndFlagsBits = (uint64_t)&type metadata for AlarmOperationRequest;
  __swift_instantiateConcreteTypeFromMangledName(&qword_255DD9C80);
  v62._countAndFlagsBits = sub_22DFDD520();
  v62._object = v10;
  if (swift_isClassType())
    v11 = &type metadata for AlarmOperationRequest;
  else
    v11 = 0;
  if (v11)
  {
    LOBYTE(v66._countAndFlagsBits) = a1;
    v66._object = (void *)a2;
    *(_QWORD *)&v67 = a3;
    sub_22DF32878(a2, a3);
    v12 = sub_22DFDDF70();
    swift_unknownObjectRelease();
    v66._countAndFlagsBits = 0;
    v66._object = (void *)0xE000000000000000;
    sub_22DFDD568();
    v60._countAndFlagsBits = v12;
    sub_22DFDDD3C();
    sub_22DFDD568();
    swift_bridgeObjectRelease();
  }
  v66._countAndFlagsBits = 60;
  v66._object = (void *)0xE100000000000000;
  sub_22DFDD568();
  swift_bridgeObjectRelease();
  sub_22DFDD448();
  sub_22DFDD568();
  swift_bridgeObjectRelease();
  object = v66._object;
  countAndFlagsBits = v66._countAndFlagsBits;
  *(_QWORD *)&v67 = a3;
  *((_QWORD *)&v67 + 1) = &type metadata for AlarmOperationRequest;
  LOBYTE(v66._countAndFlagsBits) = a1;
  v66._object = (void *)a2;
  sub_22DF32878(a2, a3);
  sub_22DFDE03C();
  sub_22DFDE048();
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  swift_retain();
  sub_22DFDDD30();
  swift_release();
  sub_22DFDDDF0();
  if (*((_QWORD *)&v68 + 1))
  {
    v14 = MEMORY[0x24BEE4AF8];
    do
    {
      v62 = v66;
      v63 = v67;
      v64 = v68;
      sub_22DFD9788(&v62._countAndFlagsBits, (void (*)(char *, char *))sub_22DFDAF2C, &v60._countAndFlagsBits);
      sub_22DF34CE8((uint64_t)&v62, &qword_255DDB028);
      v15 = v60._countAndFlagsBits;
      if (v60._countAndFlagsBits)
      {
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          sub_22DF46EF8();
          v14 = v18;
        }
        v16 = *(_QWORD *)(v14 + 16);
        v17 = v14;
        if (v16 >= *(_QWORD *)(v14 + 24) >> 1)
        {
          sub_22DF46EF8();
          v17 = v19;
        }
        *(_QWORD *)(v17 + 16) = v16 + 1;
        v14 = v17;
        *(_QWORD *)(v17 + 8 * v16 + 32) = v15;
      }
      sub_22DFDDDF0();
    }
    while (*((_QWORD *)&v68 + 1));
  }
  else
  {
    v14 = MEMORY[0x24BEE4AF8];
  }
  v46 = v14;
  swift_release();
  swift_release();
  v20 = MEMORY[0x24BEE4AD8];
  v21 = MEMORY[0x24BEE4AF8];
  v22 = sub_22DFDD430();
  v23 = *(_QWORD *)(v22 + 16);
  if (v23)
  {
    v45 = object;
    v65 = v21;
    sub_22DF48030(0, v23, 0);
    v24 = sub_22DF97428(v22);
    if (v24 < 0 || (v26 = v24, v24 >= 1 << *(_BYTE *)(v22 + 32)))
    {
LABEL_37:
      __break(1u);
    }
    else
    {
      v27 = v22 + 64;
      v54 = &v67;
      v53 = &v63;
      v52 = &v59;
      v51 = v61;
      v50 = xmmword_22DFE17A0;
      v49 = v20 + 8;
      v48 = v22 + 64;
      while ((*(_QWORD *)(v27 + 8 * (v26 >> 6)) & (1 << v26)) != 0)
      {
        if ((_DWORD)v25 != *(_DWORD *)(v22 + 36))
          goto LABEL_39;
        v55 = v25;
        v28 = (uint64_t *)(*(_QWORD *)(v22 + 48) + 16 * v26);
        v30 = *v28;
        v29 = (void *)v28[1];
        v31 = (uint64_t)v54;
        sub_22DF35140(*(_QWORD *)(v22 + 56) + 32 * v26, (uint64_t)v54);
        v66._countAndFlagsBits = v30;
        v66._object = v29;
        v62._countAndFlagsBits = v30;
        v62._object = v29;
        sub_22DF35140(v31, (uint64_t)v53);
        v60 = v62;
        v61[0] = v63;
        v61[1] = v64;
        swift_bridgeObjectRetain_n();
        sub_22DF34CE8((uint64_t)&v66, &qword_255DD81F0);
        __swift_instantiateConcreteTypeFromMangledName(&qword_255DD8208);
        v32 = swift_allocObject();
        *(_OWORD *)(v32 + 16) = v50;
        v33 = v60;
        v58 = v60;
        v34 = (uint64_t)v52;
        sub_22DF35140((uint64_t)v51, (uint64_t)v52);
        *(Swift::String *)(v32 + 32) = v33;
        v56 = 0;
        v57 = 0xE000000000000000;
        sub_22DFDD448();
        sub_22DFDDD3C();
        v35 = v57;
        *(_QWORD *)(v32 + 48) = v56;
        *(_QWORD *)(v32 + 56) = v35;
        __swift_destroy_boxed_opaque_existential_0Tm(v34);
        sub_22DF34CE8((uint64_t)&v60, &qword_255DD81F0);
        v36 = v65;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          sub_22DF48030(0, *(_QWORD *)(v36 + 16) + 1, 1);
          v36 = v65;
        }
        v38 = *(_QWORD *)(v36 + 16);
        v37 = *(_QWORD *)(v36 + 24);
        if (v38 >= v37 >> 1)
        {
          sub_22DF48030(v37 > 1, v38 + 1, 1);
          v36 = v65;
        }
        *(_QWORD *)(v36 + 16) = v38 + 1;
        *(_QWORD *)(v36 + 8 * v38 + 32) = v32;
        if ((uint64_t)v26 >= -(-1 << *(_BYTE *)(v22 + 32)))
          goto LABEL_40;
        v27 = v48;
        if ((*(_QWORD *)(v48 + 8 * (v26 >> 6)) & (1 << v26)) == 0)
          goto LABEL_41;
        if ((_DWORD)v55 != *(_DWORD *)(v22 + 36))
          goto LABEL_42;
        v39 = sub_22DFDDBEC();
        if (!--v23)
        {
          swift_bridgeObjectRelease();
          object = v45;
          goto LABEL_36;
        }
        v26 = v39;
        if ((v39 & 0x8000000000000000) == 0)
        {
          v25 = *(unsigned int *)(v22 + 36);
          if (v39 < 1 << *(_BYTE *)(v22 + 32))
            continue;
        }
        goto LABEL_37;
      }
    }
    __break(1u);
LABEL_39:
    __break(1u);
LABEL_40:
    __break(1u);
LABEL_41:
    __break(1u);
LABEL_42:
    __break(1u);
    sub_22DF34CE8((uint64_t)&v62, &qword_255DDB028);
    swift_bridgeObjectRelease();
    result = swift_release();
    __break(1u);
  }
  else
  {
    swift_bridgeObjectRelease();
    v36 = MEMORY[0x24BEE4AF8];
LABEL_36:
    v66._countAndFlagsBits = v46;
    sub_22DF48084(v36);
    v40 = v66._countAndFlagsBits;
    v66._countAndFlagsBits = countAndFlagsBits;
    v66._object = object;
    *(_QWORD *)&v67 = 0;
    *((_QWORD *)&v67 + 1) = v40;
    *(_QWORD *)&v68 = 0;
    v41._countAndFlagsBits = 2128928;
    v41._object = (void *)0xE300000000000000;
    v69.value = 0;
    v69.is_nil = 1;
    v42 = TableFormatter.Table.string(colSeparator:maxColWidth:)(v41, v69);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    v62 = v42;
    v60._countAndFlagsBits = 10;
    v60._object = (void *)0xE100000000000000;
    v58._countAndFlagsBits = 2105354;
    v58._object = (void *)0xE300000000000000;
    sub_22DF974AC();
    sub_22DF974E8();
    sub_22DFDDA6C();
    swift_bridgeObjectRelease();
    return v66._countAndFlagsBits;
  }
  return result;
}

uint64_t sub_22DFD79DC(uint64_t a1, unint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  void *v8;
  ValueMetadata *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t countAndFlagsBits;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  uint64_t v23;
  uint64_t *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  Swift::String v29;
  uint64_t v30;
  unint64_t v31;
  uint64_t v32;
  unint64_t v33;
  unint64_t v34;
  uint64_t v35;
  uint64_t v36;
  Swift::String v37;
  Swift::String v38;
  uint64_t result;
  uint64_t v40;
  uint64_t v41;
  Swift::String v42;
  uint64_t v43;
  uint64_t v44;
  __int128 v45;
  _OWORD *v46;
  uint64_t *v47;
  __int128 *v48;
  __int128 *v49;
  uint64_t v50;
  uint64_t v51;
  unint64_t v52;
  Swift::String v53;
  uint64_t v54;
  Swift::String v55;
  _OWORD v56[2];
  Swift::String v57;
  __int128 v58;
  __int128 v59;
  uint64_t v60;
  Swift::String v61;
  __int128 v62;
  __int128 v63;
  Swift::Int_optional v64;

  v4 = sub_22DFDE054();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v40 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v61._countAndFlagsBits = (uint64_t)&type metadata for AlarmOperationResponse;
  __swift_instantiateConcreteTypeFromMangledName(&qword_255DD9C88);
  v61._countAndFlagsBits = sub_22DFDD520();
  v61._object = v8;
  if (swift_isClassType())
    v9 = &type metadata for AlarmOperationResponse;
  else
    v9 = 0;
  if (v9)
  {
    v57._countAndFlagsBits = a1;
    v57._object = (void *)a2;
    sub_22DF32878(a1, a2);
    v10 = sub_22DFDDF70();
    swift_unknownObjectRelease();
    v57._countAndFlagsBits = 0;
    v57._object = (void *)0xE000000000000000;
    sub_22DFDD568();
    v55._countAndFlagsBits = v10;
    sub_22DFDDD3C();
    sub_22DFDD568();
    swift_bridgeObjectRelease();
  }
  v57._countAndFlagsBits = 60;
  v57._object = (void *)0xE100000000000000;
  sub_22DFDD568();
  swift_bridgeObjectRelease();
  sub_22DFDD448();
  sub_22DFDD568();
  swift_bridgeObjectRelease();
  v42 = v57;
  *((_QWORD *)&v62 + 1) = &type metadata for AlarmOperationResponse;
  v61._countAndFlagsBits = a1;
  v61._object = (void *)a2;
  sub_22DF32878(a1, a2);
  sub_22DFDE03C();
  sub_22DFDE048();
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  swift_retain();
  sub_22DFDDD30();
  swift_release();
  sub_22DFDDDF0();
  if (*((_QWORD *)&v63 + 1))
  {
    v11 = MEMORY[0x24BEE4AF8];
    do
    {
      v57 = v61;
      v58 = v62;
      v59 = v63;
      sub_22DFD9788(&v57._countAndFlagsBits, (void (*)(char *, char *))sub_22DFDAF2C, &v55._countAndFlagsBits);
      sub_22DF34CE8((uint64_t)&v57, &qword_255DDB028);
      countAndFlagsBits = v55._countAndFlagsBits;
      if (v55._countAndFlagsBits)
      {
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          sub_22DF46EF8();
          v11 = v14;
        }
        v13 = *(_QWORD *)(v11 + 16);
        if (v13 >= *(_QWORD *)(v11 + 24) >> 1)
        {
          sub_22DF46EF8();
          v11 = v15;
        }
        *(_QWORD *)(v11 + 16) = v13 + 1;
        *(_QWORD *)(v11 + 8 * v13 + 32) = countAndFlagsBits;
      }
      sub_22DFDDDF0();
    }
    while (*((_QWORD *)&v63 + 1));
  }
  else
  {
    v11 = MEMORY[0x24BEE4AF8];
  }
  swift_release();
  swift_release();
  v16 = MEMORY[0x24BEE4AD8];
  v17 = MEMORY[0x24BEE4AF8];
  v18 = sub_22DFDD430();
  v19 = *(_QWORD *)(v18 + 16);
  if (v19)
  {
    v41 = v11;
    v60 = v17;
    sub_22DF48030(0, v19, 0);
    v20 = sub_22DF97428(v18);
    if (v20 < 0 || (v22 = v20, v20 >= 1 << *(_BYTE *)(v18 + 32)))
    {
LABEL_37:
      __break(1u);
    }
    else
    {
      v23 = v18 + 64;
      v49 = &v62;
      v48 = &v58;
      v47 = &v54;
      v46 = v56;
      v45 = xmmword_22DFE17A0;
      v44 = v16 + 8;
      v43 = v18 + 64;
      while ((*(_QWORD *)(v23 + 8 * (v22 >> 6)) & (1 << v22)) != 0)
      {
        if ((_DWORD)v21 != *(_DWORD *)(v18 + 36))
          goto LABEL_39;
        v50 = v21;
        v24 = (uint64_t *)(*(_QWORD *)(v18 + 48) + 16 * v22);
        v26 = *v24;
        v25 = (void *)v24[1];
        v27 = (uint64_t)v49;
        sub_22DF35140(*(_QWORD *)(v18 + 56) + 32 * v22, (uint64_t)v49);
        v61._countAndFlagsBits = v26;
        v61._object = v25;
        v57._countAndFlagsBits = v26;
        v57._object = v25;
        sub_22DF35140(v27, (uint64_t)v48);
        v55 = v57;
        v56[0] = v58;
        v56[1] = v59;
        swift_bridgeObjectRetain_n();
        sub_22DF34CE8((uint64_t)&v61, &qword_255DD81F0);
        __swift_instantiateConcreteTypeFromMangledName(&qword_255DD8208);
        v28 = swift_allocObject();
        *(_OWORD *)(v28 + 16) = v45;
        v29 = v55;
        v53 = v55;
        v30 = (uint64_t)v47;
        sub_22DF35140((uint64_t)v46, (uint64_t)v47);
        *(Swift::String *)(v28 + 32) = v29;
        v51 = 0;
        v52 = 0xE000000000000000;
        sub_22DFDD448();
        sub_22DFDDD3C();
        v31 = v52;
        *(_QWORD *)(v28 + 48) = v51;
        *(_QWORD *)(v28 + 56) = v31;
        __swift_destroy_boxed_opaque_existential_0Tm(v30);
        sub_22DF34CE8((uint64_t)&v55, &qword_255DD81F0);
        v32 = v60;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          sub_22DF48030(0, *(_QWORD *)(v32 + 16) + 1, 1);
          v32 = v60;
        }
        v34 = *(_QWORD *)(v32 + 16);
        v33 = *(_QWORD *)(v32 + 24);
        if (v34 >= v33 >> 1)
        {
          sub_22DF48030(v33 > 1, v34 + 1, 1);
          v32 = v60;
        }
        *(_QWORD *)(v32 + 16) = v34 + 1;
        *(_QWORD *)(v32 + 8 * v34 + 32) = v28;
        if ((uint64_t)v22 >= -(-1 << *(_BYTE *)(v18 + 32)))
          goto LABEL_40;
        v23 = v43;
        if ((*(_QWORD *)(v43 + 8 * (v22 >> 6)) & (1 << v22)) == 0)
          goto LABEL_41;
        if ((_DWORD)v50 != *(_DWORD *)(v18 + 36))
          goto LABEL_42;
        v35 = sub_22DFDDBEC();
        if (!--v19)
        {
          swift_bridgeObjectRelease();
          v11 = v41;
          goto LABEL_36;
        }
        v22 = v35;
        if ((v35 & 0x8000000000000000) == 0)
        {
          v21 = *(unsigned int *)(v18 + 36);
          if (v35 < 1 << *(_BYTE *)(v18 + 32))
            continue;
        }
        goto LABEL_37;
      }
    }
    __break(1u);
LABEL_39:
    __break(1u);
LABEL_40:
    __break(1u);
LABEL_41:
    __break(1u);
LABEL_42:
    __break(1u);
    sub_22DF34CE8((uint64_t)&v57, &qword_255DDB028);
    swift_bridgeObjectRelease();
    result = swift_release();
    __break(1u);
  }
  else
  {
    swift_bridgeObjectRelease();
    v32 = MEMORY[0x24BEE4AF8];
LABEL_36:
    v61._countAndFlagsBits = v11;
    sub_22DF48084(v32);
    v36 = v61._countAndFlagsBits;
    v61 = v42;
    *(_QWORD *)&v62 = 0;
    *((_QWORD *)&v62 + 1) = v36;
    *(_QWORD *)&v63 = 0;
    v37._countAndFlagsBits = 2128928;
    v37._object = (void *)0xE300000000000000;
    v64.value = 0;
    v64.is_nil = 1;
    v38 = TableFormatter.Table.string(colSeparator:maxColWidth:)(v37, v64);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    v57 = v38;
    v55._countAndFlagsBits = 10;
    v55._object = (void *)0xE100000000000000;
    v53._countAndFlagsBits = 2105354;
    v53._object = (void *)0xE300000000000000;
    sub_22DF974AC();
    sub_22DF974E8();
    sub_22DFDDA6C();
    swift_bridgeObjectRelease();
    return v61._countAndFlagsBits;
  }
  return result;
}

uint64_t sub_22DFD814C(uint64_t a1, uint64_t (*a2)(_QWORD), uint64_t *a3, void (*a4)(char *, char *))
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t *boxed_opaque_existential_1;
  uint64_t v20;
  uint64_t countAndFlagsBits;
  unint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  unint64_t v31;
  uint64_t v32;
  uint64_t *v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  Swift::String v37;
  unint64_t v38;
  unint64_t v39;
  unint64_t v40;
  uint64_t v41;
  uint64_t v42;
  Swift::String v43;
  Swift::String v44;
  uint64_t result;
  uint64_t v46;
  uint64_t v47;
  Swift::String v48;
  uint64_t v49;
  uint64_t v50;
  __int128 v51;
  _OWORD *v52;
  uint64_t *v53;
  __int128 *v54;
  __int128 *v55;
  uint64_t v56;
  uint64_t v57;
  unint64_t v58;
  Swift::String v59;
  uint64_t v60;
  Swift::String v61;
  _OWORD v62[2];
  Swift::String v63;
  __int128 v64;
  __int128 v65;
  uint64_t v66;
  Swift::String v67;
  __int128 v68;
  __int128 v69;
  char v70[8];
  Swift::Int_optional v71;

  v8 = sub_22DFDE054();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  OUTLINED_FUNCTION_80();
  v12 = v11 - v10;
  v13 = a2(0);
  MEMORY[0x24BDAC7A8](v13);
  v15 = (char *)&v46 - v14;
  v67._countAndFlagsBits = v16;
  __swift_instantiateConcreteTypeFromMangledName(a3);
  v67._countAndFlagsBits = sub_22DFDD520();
  v67._object = v17;
  if (dynamic_cast_existential_0_class_conditional(v13))
  {
    sub_22DFDAEDC(a1, (uint64_t)v15, a2);
    v18 = sub_22DFDDF70();
    swift_unknownObjectRelease();
    v63._countAndFlagsBits = 0;
    v63._object = (void *)0xE000000000000000;
    sub_22DFDD568();
    v61._countAndFlagsBits = v18;
    sub_22DFDDD3C();
    sub_22DFDD568();
    OUTLINED_FUNCTION_23_4();
  }
  v63._countAndFlagsBits = 60;
  v63._object = (void *)0xE100000000000000;
  sub_22DFDD568();
  OUTLINED_FUNCTION_23_4();
  sub_22DFDD448();
  sub_22DFDD568();
  OUTLINED_FUNCTION_23_4();
  v48 = v63;
  *((_QWORD *)&v68 + 1) = v13;
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(&v67._countAndFlagsBits);
  sub_22DFDAEDC(a1, (uint64_t)boxed_opaque_existential_1, a2);
  sub_22DFDE03C();
  sub_22DFDE048();
  (*(void (**)(uint64_t, uint64_t))(v9 + 8))(v12, v8);
  swift_retain();
  sub_22DFDDD30();
  swift_release();
  sub_22DFDDDF0();
  if (*((_QWORD *)&v69 + 1))
  {
    v20 = MEMORY[0x24BEE4AF8];
    do
    {
      v63 = v67;
      v64 = v68;
      v65 = v69;
      sub_22DFD9788(&v63._countAndFlagsBits, a4, &v61._countAndFlagsBits);
      sub_22DF34CE8((uint64_t)&v63, &qword_255DDB028);
      countAndFlagsBits = v61._countAndFlagsBits;
      if (v61._countAndFlagsBits)
      {
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          OUTLINED_FUNCTION_18_19();
          v20 = v23;
        }
        v22 = *(_QWORD *)(v20 + 16);
        if (v22 >= *(_QWORD *)(v20 + 24) >> 1)
        {
          OUTLINED_FUNCTION_18_19();
          v20 = v24;
        }
        *(_QWORD *)(v20 + 16) = v22 + 1;
        *(_QWORD *)(v20 + 8 * v22 + 32) = countAndFlagsBits;
      }
      sub_22DFDDDF0();
    }
    while (*((_QWORD *)&v69 + 1));
  }
  else
  {
    v20 = MEMORY[0x24BEE4AF8];
  }
  swift_release();
  swift_release();
  v25 = MEMORY[0x24BEE4AD8];
  v26 = MEMORY[0x24BEE4AF8];
  v27 = sub_22DFDD430();
  v28 = *(_QWORD *)(v27 + 16);
  if (v28)
  {
    v47 = v20;
    v66 = v26;
    sub_22DF48030(0, v28, 0);
    v29 = sub_22DF97428(v27);
    if (v29 < 0 || (v31 = v29, v29 >= 1 << *(_BYTE *)(v27 + 32)))
    {
LABEL_34:
      __break(1u);
    }
    else
    {
      v32 = v27 + 64;
      v55 = &v68;
      v54 = &v64;
      v53 = &v60;
      v52 = v62;
      v51 = xmmword_22DFE17A0;
      v50 = v25 + 8;
      v49 = v27 + 64;
      while ((*(_QWORD *)(v32 + 8 * (v31 >> 6)) & (1 << v31)) != 0)
      {
        if ((_DWORD)v30 != *(_DWORD *)(v27 + 36))
          goto LABEL_36;
        v56 = v30;
        v33 = (uint64_t *)(*(_QWORD *)(v27 + 48) + 16 * v31);
        v35 = *v33;
        v34 = (void *)v33[1];
        OUTLINED_FUNCTION_0_20(*(_QWORD *)(v27 + 56) + 32 * v31, (uint64_t)v70);
        v67._countAndFlagsBits = v35;
        v67._object = v34;
        v63._countAndFlagsBits = v35;
        v63._object = v34;
        sub_22DF35140(v25, (uint64_t)v54);
        v61 = v63;
        v62[0] = v64;
        v62[1] = v65;
        swift_bridgeObjectRetain_n();
        sub_22DF34CE8((uint64_t)&v67, &qword_255DD81F0);
        __swift_instantiateConcreteTypeFromMangledName(&qword_255DD8208);
        v36 = swift_allocObject();
        *(_OWORD *)(v36 + 16) = v51;
        v37 = v61;
        v59 = v61;
        OUTLINED_FUNCTION_0_20((uint64_t)v52, (uint64_t)&v69 + 8);
        *(Swift::String *)(v36 + 32) = v37;
        v57 = 0;
        v58 = 0xE000000000000000;
        sub_22DFDD448();
        sub_22DFDDD3C();
        v38 = v58;
        *(_QWORD *)(v36 + 48) = v57;
        *(_QWORD *)(v36 + 56) = v38;
        __swift_destroy_boxed_opaque_existential_0Tm(v25);
        sub_22DF34CE8((uint64_t)&v61, &qword_255DD81F0);
        v25 = v66;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          sub_22DF48030(0, *(_QWORD *)(v25 + 16) + 1, 1);
          v25 = v66;
        }
        v40 = *(_QWORD *)(v25 + 16);
        v39 = *(_QWORD *)(v25 + 24);
        if (v40 >= v39 >> 1)
        {
          sub_22DF48030(v39 > 1, v40 + 1, 1);
          v25 = v66;
        }
        *(_QWORD *)(v25 + 16) = v40 + 1;
        *(_QWORD *)(v25 + 8 * v40 + 32) = v36;
        if ((uint64_t)v31 >= -(-1 << *(_BYTE *)(v27 + 32)))
          goto LABEL_37;
        v32 = v49;
        if ((*(_QWORD *)(v49 + 8 * (v31 >> 6)) & (1 << v31)) == 0)
          goto LABEL_38;
        if ((_DWORD)v56 != *(_DWORD *)(v27 + 36))
          goto LABEL_39;
        v41 = sub_22DFDDBEC();
        if (!--v28)
        {
          OUTLINED_FUNCTION_149();
          v20 = v47;
          goto LABEL_33;
        }
        v31 = v41;
        if ((v41 & 0x8000000000000000) == 0)
        {
          v30 = *(unsigned int *)(v27 + 36);
          if (v41 < 1 << *(_BYTE *)(v27 + 32))
            continue;
        }
        goto LABEL_34;
      }
    }
    __break(1u);
LABEL_36:
    __break(1u);
LABEL_37:
    __break(1u);
LABEL_38:
    __break(1u);
LABEL_39:
    __break(1u);
    sub_22DF34CE8((uint64_t)&v63, &qword_255DDB028);
    swift_bridgeObjectRelease();
    result = swift_release();
    __break(1u);
  }
  else
  {
    OUTLINED_FUNCTION_149();
    v25 = MEMORY[0x24BEE4AF8];
LABEL_33:
    v67._countAndFlagsBits = v20;
    sub_22DF48084(v25);
    v42 = v67._countAndFlagsBits;
    v67 = v48;
    *(_QWORD *)&v68 = 0;
    *((_QWORD *)&v68 + 1) = v42;
    *(_QWORD *)&v69 = 0;
    v43._countAndFlagsBits = 2128928;
    v43._object = (void *)0xE300000000000000;
    v71.value = 0;
    v71.is_nil = 1;
    v44 = TableFormatter.Table.string(colSeparator:maxColWidth:)(v43, v71);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    v63 = v44;
    v61._countAndFlagsBits = 10;
    v61._object = (void *)0xE100000000000000;
    v59._countAndFlagsBits = 2105354;
    v59._object = (void *)0xE300000000000000;
    sub_22DF974AC();
    sub_22DF974E8();
    sub_22DFDDA6C();
    OUTLINED_FUNCTION_149();
    return v67._countAndFlagsBits;
  }
  return result;
}

uint64_t sub_22DFD8898(uint64_t a1, char a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  void *v8;
  ValueMetadata *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t countAndFlagsBits;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  uint64_t v23;
  uint64_t *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  Swift::String v29;
  uint64_t v30;
  unint64_t v31;
  uint64_t v32;
  unint64_t v33;
  unint64_t v34;
  uint64_t v35;
  uint64_t v36;
  Swift::String v37;
  Swift::String v38;
  uint64_t result;
  uint64_t v40;
  uint64_t v41;
  Swift::String v42;
  uint64_t v43;
  uint64_t v44;
  __int128 v45;
  _OWORD *v46;
  uint64_t *v47;
  __int128 *v48;
  __int128 *v49;
  uint64_t v50;
  uint64_t v51;
  unint64_t v52;
  Swift::String v53;
  uint64_t v54;
  Swift::String v55;
  _OWORD v56[2];
  Swift::String v57;
  __int128 v58;
  __int128 v59;
  uint64_t v60;
  Swift::String v61;
  __int128 v62;
  __int128 v63;
  Swift::Int_optional v64;

  v4 = sub_22DFDE054();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v40 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v61._countAndFlagsBits = (uint64_t)&type metadata for AlarmsObservationUpdate;
  __swift_instantiateConcreteTypeFromMangledName(&qword_255DD9C70);
  v61._countAndFlagsBits = sub_22DFDD520();
  v61._object = v8;
  if (swift_isClassType())
    v9 = &type metadata for AlarmsObservationUpdate;
  else
    v9 = 0;
  if (v9)
  {
    v57._countAndFlagsBits = a1;
    LOBYTE(v57._object) = a2 & 1;
    sub_22DF3A9D8(a1, a2 & 1);
    v10 = sub_22DFDDF70();
    swift_unknownObjectRelease();
    v57._countAndFlagsBits = 0;
    v57._object = (void *)0xE000000000000000;
    sub_22DFDD568();
    v55._countAndFlagsBits = v10;
    sub_22DFDDD3C();
    sub_22DFDD568();
    swift_bridgeObjectRelease();
  }
  v57._countAndFlagsBits = 60;
  v57._object = (void *)0xE100000000000000;
  sub_22DFDD568();
  swift_bridgeObjectRelease();
  sub_22DFDD448();
  sub_22DFDD568();
  swift_bridgeObjectRelease();
  v42 = v57;
  *((_QWORD *)&v62 + 1) = &type metadata for AlarmsObservationUpdate;
  v61._countAndFlagsBits = a1;
  LOBYTE(v61._object) = a2 & 1;
  sub_22DF3A9D8(a1, a2 & 1);
  sub_22DFDE03C();
  sub_22DFDE048();
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  swift_retain();
  sub_22DFDDD30();
  swift_release();
  sub_22DFDDDF0();
  if (*((_QWORD *)&v63 + 1))
  {
    v11 = MEMORY[0x24BEE4AF8];
    do
    {
      v57 = v61;
      v58 = v62;
      v59 = v63;
      sub_22DFD9788(&v57._countAndFlagsBits, (void (*)(char *, char *))sub_22DFDAF2C, &v55._countAndFlagsBits);
      sub_22DF34CE8((uint64_t)&v57, &qword_255DDB028);
      countAndFlagsBits = v55._countAndFlagsBits;
      if (v55._countAndFlagsBits)
      {
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          sub_22DF46EF8();
          v11 = v14;
        }
        v13 = *(_QWORD *)(v11 + 16);
        if (v13 >= *(_QWORD *)(v11 + 24) >> 1)
        {
          sub_22DF46EF8();
          v11 = v15;
        }
        *(_QWORD *)(v11 + 16) = v13 + 1;
        *(_QWORD *)(v11 + 8 * v13 + 32) = countAndFlagsBits;
      }
      sub_22DFDDDF0();
    }
    while (*((_QWORD *)&v63 + 1));
  }
  else
  {
    v11 = MEMORY[0x24BEE4AF8];
  }
  swift_release();
  swift_release();
  v16 = MEMORY[0x24BEE4AD8];
  v17 = MEMORY[0x24BEE4AF8];
  v18 = sub_22DFDD430();
  v19 = *(_QWORD *)(v18 + 16);
  if (v19)
  {
    v41 = v11;
    v60 = v17;
    sub_22DF48030(0, v19, 0);
    v20 = sub_22DF97428(v18);
    if (v20 < 0 || (v22 = v20, v20 >= 1 << *(_BYTE *)(v18 + 32)))
    {
LABEL_37:
      __break(1u);
    }
    else
    {
      v23 = v18 + 64;
      v49 = &v62;
      v48 = &v58;
      v47 = &v54;
      v46 = v56;
      v45 = xmmword_22DFE17A0;
      v44 = v16 + 8;
      v43 = v18 + 64;
      while ((*(_QWORD *)(v23 + 8 * (v22 >> 6)) & (1 << v22)) != 0)
      {
        if ((_DWORD)v21 != *(_DWORD *)(v18 + 36))
          goto LABEL_39;
        v50 = v21;
        v24 = (uint64_t *)(*(_QWORD *)(v18 + 48) + 16 * v22);
        v26 = *v24;
        v25 = (void *)v24[1];
        v27 = (uint64_t)v49;
        sub_22DF35140(*(_QWORD *)(v18 + 56) + 32 * v22, (uint64_t)v49);
        v61._countAndFlagsBits = v26;
        v61._object = v25;
        v57._countAndFlagsBits = v26;
        v57._object = v25;
        sub_22DF35140(v27, (uint64_t)v48);
        v55 = v57;
        v56[0] = v58;
        v56[1] = v59;
        swift_bridgeObjectRetain_n();
        sub_22DF34CE8((uint64_t)&v61, &qword_255DD81F0);
        __swift_instantiateConcreteTypeFromMangledName(&qword_255DD8208);
        v28 = swift_allocObject();
        *(_OWORD *)(v28 + 16) = v45;
        v29 = v55;
        v53 = v55;
        v30 = (uint64_t)v47;
        sub_22DF35140((uint64_t)v46, (uint64_t)v47);
        *(Swift::String *)(v28 + 32) = v29;
        v51 = 0;
        v52 = 0xE000000000000000;
        sub_22DFDD448();
        sub_22DFDDD3C();
        v31 = v52;
        *(_QWORD *)(v28 + 48) = v51;
        *(_QWORD *)(v28 + 56) = v31;
        __swift_destroy_boxed_opaque_existential_0Tm(v30);
        sub_22DF34CE8((uint64_t)&v55, &qword_255DD81F0);
        v32 = v60;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          sub_22DF48030(0, *(_QWORD *)(v32 + 16) + 1, 1);
          v32 = v60;
        }
        v34 = *(_QWORD *)(v32 + 16);
        v33 = *(_QWORD *)(v32 + 24);
        if (v34 >= v33 >> 1)
        {
          sub_22DF48030(v33 > 1, v34 + 1, 1);
          v32 = v60;
        }
        *(_QWORD *)(v32 + 16) = v34 + 1;
        *(_QWORD *)(v32 + 8 * v34 + 32) = v28;
        if ((uint64_t)v22 >= -(-1 << *(_BYTE *)(v18 + 32)))
          goto LABEL_40;
        v23 = v43;
        if ((*(_QWORD *)(v43 + 8 * (v22 >> 6)) & (1 << v22)) == 0)
          goto LABEL_41;
        if ((_DWORD)v50 != *(_DWORD *)(v18 + 36))
          goto LABEL_42;
        v35 = sub_22DFDDBEC();
        if (!--v19)
        {
          swift_bridgeObjectRelease();
          v11 = v41;
          goto LABEL_36;
        }
        v22 = v35;
        if ((v35 & 0x8000000000000000) == 0)
        {
          v21 = *(unsigned int *)(v18 + 36);
          if (v35 < 1 << *(_BYTE *)(v18 + 32))
            continue;
        }
        goto LABEL_37;
      }
    }
    __break(1u);
LABEL_39:
    __break(1u);
LABEL_40:
    __break(1u);
LABEL_41:
    __break(1u);
LABEL_42:
    __break(1u);
    sub_22DF34CE8((uint64_t)&v57, &qword_255DDB028);
    swift_bridgeObjectRelease();
    result = swift_release();
    __break(1u);
  }
  else
  {
    swift_bridgeObjectRelease();
    v32 = MEMORY[0x24BEE4AF8];
LABEL_36:
    v61._countAndFlagsBits = v11;
    sub_22DF48084(v32);
    v36 = v61._countAndFlagsBits;
    v61 = v42;
    *(_QWORD *)&v62 = 0;
    *((_QWORD *)&v62 + 1) = v36;
    *(_QWORD *)&v63 = 0;
    v37._countAndFlagsBits = 2128928;
    v37._object = (void *)0xE300000000000000;
    v64.value = 0;
    v64.is_nil = 1;
    v38 = TableFormatter.Table.string(colSeparator:maxColWidth:)(v37, v64);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    v57 = v38;
    v55._countAndFlagsBits = 10;
    v55._object = (void *)0xE100000000000000;
    v53._countAndFlagsBits = 2105354;
    v53._object = (void *)0xE300000000000000;
    sub_22DF974AC();
    sub_22DF974E8();
    sub_22DFDDA6C();
    swift_bridgeObjectRelease();
    return v61._countAndFlagsBits;
  }
  return result;
}

uint64_t sub_22DFD9010(uint64_t a1, char a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  void *v8;
  ValueMetadata *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t countAndFlagsBits;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  uint64_t v23;
  uint64_t *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  Swift::String v29;
  uint64_t v30;
  unint64_t v31;
  uint64_t v32;
  unint64_t v33;
  unint64_t v34;
  uint64_t v35;
  uint64_t v36;
  Swift::String v37;
  Swift::String v38;
  uint64_t result;
  uint64_t v40;
  uint64_t v41;
  Swift::String v42;
  uint64_t v43;
  uint64_t v44;
  __int128 v45;
  _OWORD *v46;
  uint64_t *v47;
  __int128 *v48;
  __int128 *v49;
  uint64_t v50;
  uint64_t v51;
  unint64_t v52;
  Swift::String v53;
  uint64_t v54;
  Swift::String v55;
  _OWORD v56[2];
  Swift::String v57;
  __int128 v58;
  __int128 v59;
  uint64_t v60;
  Swift::String v61;
  __int128 v62;
  __int128 v63;
  Swift::Int_optional v64;

  v4 = sub_22DFDE054();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v40 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v61._countAndFlagsBits = (uint64_t)&type metadata for TimersObservationUpdate;
  __swift_instantiateConcreteTypeFromMangledName(qword_255DD9C90);
  v61._countAndFlagsBits = sub_22DFDD520();
  v61._object = v8;
  if (swift_isClassType())
    v9 = &type metadata for TimersObservationUpdate;
  else
    v9 = 0;
  if (v9)
  {
    v57._countAndFlagsBits = a1;
    LOBYTE(v57._object) = a2 & 1;
    sub_22DF3A9D8(a1, a2 & 1);
    v10 = sub_22DFDDF70();
    swift_unknownObjectRelease();
    v57._countAndFlagsBits = 0;
    v57._object = (void *)0xE000000000000000;
    sub_22DFDD568();
    v55._countAndFlagsBits = v10;
    sub_22DFDDD3C();
    sub_22DFDD568();
    swift_bridgeObjectRelease();
  }
  v57._countAndFlagsBits = 60;
  v57._object = (void *)0xE100000000000000;
  sub_22DFDD568();
  swift_bridgeObjectRelease();
  sub_22DFDD448();
  sub_22DFDD568();
  swift_bridgeObjectRelease();
  v42 = v57;
  *((_QWORD *)&v62 + 1) = &type metadata for TimersObservationUpdate;
  v61._countAndFlagsBits = a1;
  LOBYTE(v61._object) = a2 & 1;
  sub_22DF3A9D8(a1, a2 & 1);
  sub_22DFDE03C();
  sub_22DFDE048();
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  swift_retain();
  sub_22DFDDD30();
  swift_release();
  sub_22DFDDDF0();
  if (*((_QWORD *)&v63 + 1))
  {
    v11 = MEMORY[0x24BEE4AF8];
    do
    {
      v57 = v61;
      v58 = v62;
      v59 = v63;
      sub_22DFD9788(&v57._countAndFlagsBits, (void (*)(char *, char *))sub_22DFDAF2C, &v55._countAndFlagsBits);
      sub_22DF34CE8((uint64_t)&v57, &qword_255DDB028);
      countAndFlagsBits = v55._countAndFlagsBits;
      if (v55._countAndFlagsBits)
      {
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          sub_22DF46EF8();
          v11 = v14;
        }
        v13 = *(_QWORD *)(v11 + 16);
        if (v13 >= *(_QWORD *)(v11 + 24) >> 1)
        {
          sub_22DF46EF8();
          v11 = v15;
        }
        *(_QWORD *)(v11 + 16) = v13 + 1;
        *(_QWORD *)(v11 + 8 * v13 + 32) = countAndFlagsBits;
      }
      sub_22DFDDDF0();
    }
    while (*((_QWORD *)&v63 + 1));
  }
  else
  {
    v11 = MEMORY[0x24BEE4AF8];
  }
  swift_release();
  swift_release();
  v16 = MEMORY[0x24BEE4AD8];
  v17 = MEMORY[0x24BEE4AF8];
  v18 = sub_22DFDD430();
  v19 = *(_QWORD *)(v18 + 16);
  if (v19)
  {
    v41 = v11;
    v60 = v17;
    sub_22DF48030(0, v19, 0);
    v20 = sub_22DF97428(v18);
    if (v20 < 0 || (v22 = v20, v20 >= 1 << *(_BYTE *)(v18 + 32)))
    {
LABEL_37:
      __break(1u);
    }
    else
    {
      v23 = v18 + 64;
      v49 = &v62;
      v48 = &v58;
      v47 = &v54;
      v46 = v56;
      v45 = xmmword_22DFE17A0;
      v44 = v16 + 8;
      v43 = v18 + 64;
      while ((*(_QWORD *)(v23 + 8 * (v22 >> 6)) & (1 << v22)) != 0)
      {
        if ((_DWORD)v21 != *(_DWORD *)(v18 + 36))
          goto LABEL_39;
        v50 = v21;
        v24 = (uint64_t *)(*(_QWORD *)(v18 + 48) + 16 * v22);
        v26 = *v24;
        v25 = (void *)v24[1];
        v27 = (uint64_t)v49;
        sub_22DF35140(*(_QWORD *)(v18 + 56) + 32 * v22, (uint64_t)v49);
        v61._countAndFlagsBits = v26;
        v61._object = v25;
        v57._countAndFlagsBits = v26;
        v57._object = v25;
        sub_22DF35140(v27, (uint64_t)v48);
        v55 = v57;
        v56[0] = v58;
        v56[1] = v59;
        swift_bridgeObjectRetain_n();
        sub_22DF34CE8((uint64_t)&v61, &qword_255DD81F0);
        __swift_instantiateConcreteTypeFromMangledName(&qword_255DD8208);
        v28 = swift_allocObject();
        *(_OWORD *)(v28 + 16) = v45;
        v29 = v55;
        v53 = v55;
        v30 = (uint64_t)v47;
        sub_22DF35140((uint64_t)v46, (uint64_t)v47);
        *(Swift::String *)(v28 + 32) = v29;
        v51 = 0;
        v52 = 0xE000000000000000;
        sub_22DFDD448();
        sub_22DFDDD3C();
        v31 = v52;
        *(_QWORD *)(v28 + 48) = v51;
        *(_QWORD *)(v28 + 56) = v31;
        __swift_destroy_boxed_opaque_existential_0Tm(v30);
        sub_22DF34CE8((uint64_t)&v55, &qword_255DD81F0);
        v32 = v60;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          sub_22DF48030(0, *(_QWORD *)(v32 + 16) + 1, 1);
          v32 = v60;
        }
        v34 = *(_QWORD *)(v32 + 16);
        v33 = *(_QWORD *)(v32 + 24);
        if (v34 >= v33 >> 1)
        {
          sub_22DF48030(v33 > 1, v34 + 1, 1);
          v32 = v60;
        }
        *(_QWORD *)(v32 + 16) = v34 + 1;
        *(_QWORD *)(v32 + 8 * v34 + 32) = v28;
        if ((uint64_t)v22 >= -(-1 << *(_BYTE *)(v18 + 32)))
          goto LABEL_40;
        v23 = v43;
        if ((*(_QWORD *)(v43 + 8 * (v22 >> 6)) & (1 << v22)) == 0)
          goto LABEL_41;
        if ((_DWORD)v50 != *(_DWORD *)(v18 + 36))
          goto LABEL_42;
        v35 = sub_22DFDDBEC();
        if (!--v19)
        {
          swift_bridgeObjectRelease();
          v11 = v41;
          goto LABEL_36;
        }
        v22 = v35;
        if ((v35 & 0x8000000000000000) == 0)
        {
          v21 = *(unsigned int *)(v18 + 36);
          if (v35 < 1 << *(_BYTE *)(v18 + 32))
            continue;
        }
        goto LABEL_37;
      }
    }
    __break(1u);
LABEL_39:
    __break(1u);
LABEL_40:
    __break(1u);
LABEL_41:
    __break(1u);
LABEL_42:
    __break(1u);
    sub_22DF34CE8((uint64_t)&v57, &qword_255DDB028);
    swift_bridgeObjectRelease();
    result = swift_release();
    __break(1u);
  }
  else
  {
    swift_bridgeObjectRelease();
    v32 = MEMORY[0x24BEE4AF8];
LABEL_36:
    v61._countAndFlagsBits = v11;
    sub_22DF48084(v32);
    v36 = v61._countAndFlagsBits;
    v61 = v42;
    *(_QWORD *)&v62 = 0;
    *((_QWORD *)&v62 + 1) = v36;
    *(_QWORD *)&v63 = 0;
    v37._countAndFlagsBits = 2128928;
    v37._object = (void *)0xE300000000000000;
    v64.value = 0;
    v64.is_nil = 1;
    v38 = TableFormatter.Table.string(colSeparator:maxColWidth:)(v37, v64);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    v57 = v38;
    v55._countAndFlagsBits = 10;
    v55._object = (void *)0xE100000000000000;
    v53._countAndFlagsBits = 2105354;
    v53._object = (void *)0xE300000000000000;
    sub_22DF974AC();
    sub_22DF974E8();
    sub_22DFDDA6C();
    swift_bridgeObjectRelease();
    return v61._countAndFlagsBits;
  }
  return result;
}

void sub_22DFD9788(uint64_t *a1@<X0>, void (*a2)(char *, char *)@<X1>, uint64_t *a3@<X8>)
{
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  char v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  _QWORD *v19;
  uint64_t v20;
  unint64_t v21;
  uint64_t v22;
  _QWORD v23[7];
  unint64_t v24;
  _BYTE v25[40];
  _OWORD v26[2];
  uint64_t v27;
  unint64_t v28;
  __int128 v29;
  uint64_t v30;
  __int128 v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  unint64_t v36;
  uint64_t v37;

  v5 = *a1;
  v6 = a1[1];
  v35 = *a1;
  v36 = v6;
  sub_22DF35140((uint64_t)(a1 + 2), (uint64_t)&v37);
  if (v6)
  {
    *(_QWORD *)&v29 = v5;
    *((_QWORD *)&v29 + 1) = v6;
    *(_QWORD *)&v26[0] = 0xD000000000000012;
    *((_QWORD *)&v26[0] + 1) = 0x800000022DFF19D0;
    sub_22DF974E8();
    sub_22DFDD9D0();
    OUTLINED_FUNCTION_42_0();
    v7 = MEMORY[0x22E32285C](v31, *((_QWORD *)&v31 + 1), v32, v33);
    v9 = v8;
    OUTLINED_FUNCTION_107();
  }
  else
  {
    OUTLINED_FUNCTION_42_0();
    v9 = 0xE100000000000000;
    v7 = 63;
  }
  sub_22DFDD52C();
  v10 = sub_22DFDD580();
  OUTLINED_FUNCTION_107();
  v11 = MEMORY[0x24BEE4AD8];
  if ((v10 & 1) != 0)
  {
    OUTLINED_FUNCTION_1_29();
    __swift_instantiateConcreteTypeFromMangledName(&qword_255DDB040);
    if (OUTLINED_FUNCTION_58_3())
    {
      OUTLINED_FUNCTION_7_27();
      v35 = 40;
      v36 = 0xE100000000000000;
      OUTLINED_FUNCTION_20_13();
      *(_QWORD *)&v29 = sub_22DFDD9DC();
      sub_22DFDDF10();
      sub_22DFDD568();
      OUTLINED_FUNCTION_107();
      sub_22DFDD568();
      v12 = 40;
      v13 = 0xE100000000000000;
      OUTLINED_FUNCTION_12_23();
      goto LABEL_20;
    }
    OUTLINED_FUNCTION_11_25();
    OUTLINED_FUNCTION_21_14(v14, &qword_255DDB048);
  }
  v24 = v9;
  OUTLINED_FUNCTION_8_29();
  __swift_instantiateConcreteTypeFromMangledName(&qword_255DDB030);
  if (OUTLINED_FUNCTION_58_3())
  {
    OUTLINED_FUNCTION_7_27();
    v27 = 0;
    v28 = 0xE000000000000000;
    sub_22DF55754((uint64_t)&v31, (uint64_t)&v35);
    sub_22DFDAEB0((uint64_t)&v35, (uint64_t)&v29, &qword_255DDB038);
    if (v30)
    {
      sub_22DF34CD0(&v29, (uint64_t)v26);
      sub_22DF55754((uint64_t)v26, (uint64_t)v25);
      sub_22DFDD520();
      OUTLINED_FUNCTION_10_24();
    }
    v9 = v24;
    sub_22DF34CE8((uint64_t)&v35, &qword_255DDB038);
    OUTLINED_FUNCTION_14_21();
    OUTLINED_FUNCTION_107();
    v12 = v27;
    v13 = v28;
    OUTLINED_FUNCTION_12_23();
  }
  else
  {
    OUTLINED_FUNCTION_11_25();
    OUTLINED_FUNCTION_21_14(v15, &qword_255DDB038);
    OUTLINED_FUNCTION_8_29();
    __swift_instantiateConcreteTypeFromMangledName(&qword_255DDB040);
    if (OUTLINED_FUNCTION_58_3())
    {
      OUTLINED_FUNCTION_7_27();
      OUTLINED_FUNCTION_1_29();
      sub_22DF33E44((_OWORD *)(v11 + 8), v26);
      __swift_instantiateConcreteTypeFromMangledName(qword_255DDB060);
      if ((OUTLINED_FUNCTION_58_3() & 1) == 0)
      {
        v17 = v33;
        v18 = v34;
        v19 = OUTLINED_FUNCTION_20_13();
        MEMORY[0x24BDAC7A8](v19);
        v23[2] = v17;
        v23[3] = v18;
        v23[4] = sub_22DF973AC;
        v23[5] = 0;
        v35 = sub_22DFAA584(a2, (uint64_t)v23, v17, MEMORY[0x24BEE0D00], MEMORY[0x24BEE4078], v18, MEMORY[0x24BEE40A8], v20);
        __swift_instantiateConcreteTypeFromMangledName(&qword_255DD8198);
        sub_22DF34E88(&qword_255DD81A0, &qword_255DD8198);
        v12 = sub_22DFDD4CC();
        v13 = v21;
        OUTLINED_FUNCTION_107();
        OUTLINED_FUNCTION_12_23();
        v9 = v24;
        goto LABEL_20;
      }
      __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)&v29);
      OUTLINED_FUNCTION_12_23();
    }
    else
    {
      OUTLINED_FUNCTION_11_25();
      OUTLINED_FUNCTION_21_14(v16, &qword_255DDB048);
    }
    v27 = 0;
    v28 = 0xE000000000000000;
    OUTLINED_FUNCTION_1_29();
    sub_22DF33E44((_OWORD *)(v11 + 8), &v31);
    sub_22DFDAEB0((uint64_t)&v31, (uint64_t)&v29, &qword_255DD7E80);
    v9 = v24;
    if (v30)
    {
      sub_22DF33E44(&v29, v26);
      sub_22DF35140((uint64_t)v26, (uint64_t)v25);
      sub_22DFDD520();
      OUTLINED_FUNCTION_10_24();
    }
    sub_22DF34CE8((uint64_t)&v31, &qword_255DD7E80);
    OUTLINED_FUNCTION_14_21();
    OUTLINED_FUNCTION_107();
    v12 = v27;
    v13 = v28;
  }
LABEL_20:
  __swift_instantiateConcreteTypeFromMangledName(&qword_255DD8208);
  v22 = swift_allocObject();
  *(_OWORD *)(v22 + 16) = xmmword_22DFE17A0;
  *(_QWORD *)(v22 + 32) = v7;
  *(_QWORD *)(v22 + 40) = v9;
  *(_QWORD *)(v22 + 48) = v12;
  *(_QWORD *)(v22 + 56) = v13;
  *a3 = v22;
  OUTLINED_FUNCTION_1_4();
}

uint64_t sub_22DFD9C84@<X0>(uint64_t a1@<X0>, uint64_t (*a2)(uint64_t *)@<X1>, _QWORD *a3@<X8>)
{
  uint64_t AssociatedTypeWitness;
  uint64_t *boxed_opaque_existential_1;
  uint64_t v8;
  uint64_t v10[4];

  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v10[3] = AssociatedTypeWitness;
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v10);
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(_QWORD *)(AssociatedTypeWitness - 8) + 16))(boxed_opaque_existential_1, a1, AssociatedTypeWitness);
  *a3 = a2(v10);
  a3[1] = v8;
  return __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)v10);
}

unint64_t static CallObservationUpdate.typeIdentifier.getter()
{
  return 0xD000000000000015;
}

void CallObservationUpdate.update.getter(uint64_t a1@<X8>)
{
  uint64_t v1;

  sub_22DFDAEB0(v1, a1, &qword_255DDD4A8);
}

uint64_t CallObservationUpdate.init(updateValue:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  sub_22DFDA15C(a1, a2, (uint64_t (*)(_QWORD))type metadata accessor for HPCall);
  __swift_instantiateConcreteTypeFromMangledName(&qword_255DDD4A8);
  return swift_storeEnumTagMultiPayload();
}

uint64_t sub_22DFD9DAC()
{
  sub_22DFD9F08();
  return sub_22DFDE084();
}

uint64_t sub_22DFD9DD4()
{
  sub_22DFD9F08();
  return sub_22DFDE090();
}

uint64_t CallObservationUpdate.encode(to:)(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_255DDD4B0);
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  OUTLINED_FUNCTION_80();
  v6 = v5 - v4;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_22DFD9F08();
  sub_22DFDE06C();
  __swift_instantiateConcreteTypeFromMangledName(&qword_255DDD4A8);
  sub_22DF34E88(&qword_255DDD4C0, &qword_255DDD4A8);
  sub_22DFDDEEC();
  return (*(uint64_t (**)(uint64_t, uint64_t))(v3 + 8))(v6, v2);
}

unint64_t sub_22DFD9F08()
{
  unint64_t result;

  result = qword_255DDD4B8;
  if (!qword_255DDD4B8)
  {
    result = MEMORY[0x22E323AEC](&unk_22DFEC5FC, &type metadata for CallObservationUpdate.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_255DDD4B8);
  }
  return result;
}

void CallObservationUpdate.init(from:)(_QWORD *a1@<X0>, uint64_t a2@<X8>)
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
  uint64_t v16;
  uint64_t v17;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_255DDD4A8);
  MEMORY[0x24BDAC7A8](v4);
  OUTLINED_FUNCTION_80();
  v17 = v6 - v5;
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_255DDD4C8);
  v16 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7);
  OUTLINED_FUNCTION_80();
  v10 = v9 - v8;
  v11 = type metadata accessor for CallObservationUpdate();
  MEMORY[0x24BDAC7A8](v11);
  OUTLINED_FUNCTION_80();
  v14 = v13 - v12;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_22DFD9F08();
  sub_22DFDE060();
  if (!v2)
  {
    sub_22DF34E88(&qword_255DDD4D0, &qword_255DDD4A8);
    sub_22DFDDE74();
    (*(void (**)(uint64_t, uint64_t))(v16 + 8))(v10, v7);
    sub_22DFDA114(v17, v14);
    sub_22DFDA15C(v14, a2, (uint64_t (*)(_QWORD))type metadata accessor for CallObservationUpdate);
  }
  OUTLINED_FUNCTION_42_0();
  OUTLINED_FUNCTION_1_4();
}

uint64_t type metadata accessor for CallObservationUpdate()
{
  uint64_t result;

  result = qword_255DDD660;
  if (!qword_255DDD660)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_22DFDA114(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_255DDD4A8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

void sub_22DFDA15C(uint64_t a1, uint64_t a2, uint64_t (*a3)(_QWORD))
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v5 = OUTLINED_FUNCTION_21_11(a1, a2, a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 32))(v3, v4, v5);
  OUTLINED_FUNCTION_1_2();
}

uint64_t static CallObservationUpdate.updateObservedValue(_:withUpdate:scope:)(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  sub_22DF34CE8(a1, &qword_255DD8980);
  sub_22DFDAEDC(a2, a1, (uint64_t (*)(_QWORD))type metadata accessor for HPCall);
  v4 = type metadata accessor for HPCall();
  return OUTLINED_FUNCTION_11_20(a1, 0, 1, v4);
}

void sub_22DFDA1EC(uint64_t a1)
{
  uint64_t v2;

  sub_22DF328BC(&qword_255DDD4D8, (void (*)(uint64_t))type metadata accessor for CallObservationUpdate);
  *(_QWORD *)(a1 + 16) = v2;
}

uint64_t sub_22DFDA228()
{
  return sub_22DFDA290(&qword_255DDD4E0, &qword_255DDD4E8, (uint64_t)&protocol conformance descriptor for HPCall, MEMORY[0x24BEE4AC0]);
}

uint64_t sub_22DFDA25C()
{
  return sub_22DFDA290(&qword_255DDD4F0, &qword_255DDD4F8, (uint64_t)&protocol conformance descriptor for HPCall, MEMORY[0x24BEE4AA8]);
}

uint64_t sub_22DFDA290(unint64_t *a1, _QWORD *a2, uint64_t a3, uint64_t a4)
{
  uint64_t result;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  result = *a1;
  if (!result)
  {
    v8 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_255DD8980);
    sub_22DF328BC(a2, (void (*)(uint64_t))type metadata accessor for HPCall);
    v10 = v9;
    result = MEMORY[0x22E323AEC](a4, v8, &v10);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_22DFDA314()
{
  return sub_22DFDA290(&qword_255DDD500, &qword_255DDD508, (uint64_t)&protocol conformance descriptor for HPCall, MEMORY[0x24BEE4AB8]);
}

void sub_22DFDA348()
{
  sub_22DF328BC(&qword_255DDD4E8, (void (*)(uint64_t))type metadata accessor for HPCall);
}

void sub_22DFDA374()
{
  sub_22DF328BC(&qword_255DDD4F8, (void (*)(uint64_t))type metadata accessor for HPCall);
}

void sub_22DFDA3A0(uint64_t a1)
{
  uint64_t v2;

  sub_22DF328BC(&qword_255DDD5C0, (void (*)(uint64_t))type metadata accessor for CallObservationUpdate);
  *(_QWORD *)(a1 + 8) = v2;
}

unint64_t sub_22DFDA3E0()
{
  static CallObservationUpdate.typeIdentifier.getter();
  return 0xD000000000000015;
}

void sub_22DFDA3FC(uint64_t a1)
{
  uint64_t v2;

  sub_22DF328BC(&qword_255DDD5F0, (void (*)(uint64_t))type metadata accessor for CallObservationUpdate);
  *(_QWORD *)(a1 + 8) = v2;
}

void sub_22DFDA438(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;

  sub_22DF328BC(&qword_255DDD5F8, (void (*)(uint64_t))type metadata accessor for CallObservationUpdate);
  *(_QWORD *)(a1 + 8) = v2;
  sub_22DF328BC(&qword_255DDD600, (void (*)(uint64_t))type metadata accessor for CallObservationUpdate);
  *(_QWORD *)(a1 + 16) = v3;
}

void sub_22DFDA494(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  CallObservationUpdate.init(from:)(a1, a2);
}

uint64_t sub_22DFDA4A8(_QWORD *a1)
{
  return CallObservationUpdate.encode(to:)(a1);
}

uint64_t *initializeBufferWithCopyOfBuffer for CallObservationUpdate(uint64_t *a1, uint64_t *a2)
{
  uint64_t v4;
  int v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;

  v4 = *(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_255DDD4A8) - 8);
  v5 = *(_DWORD *)(v4 + 80);
  if ((v5 & 0x20000) != 0)
  {
    v6 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v6 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else if (swift_getEnumCaseMultiPayload())
  {
    memcpy(a1, a2, *(_QWORD *)(v4 + 64));
  }
  else
  {
    v7 = sub_22DFDCEFC();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a1, a2, v7);
    v8 = type metadata accessor for HPCall();
    *((_BYTE *)a1 + *(int *)(v8 + 20)) = *((_BYTE *)a2 + *(int *)(v8 + 20));
    v9 = *(int *)(v8 + 24);
    v10 = (char *)a1 + v9;
    v11 = (char *)a2 + v9;
    v12 = sub_22DFDCEC0();
    if (__swift_getEnumTagSinglePayload((uint64_t)v11, 1, v12))
    {
      v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_255DD7828);
      memcpy(v10, v11, *(_QWORD *)(*(_QWORD *)(v13 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v12 - 8) + 16))(v10, v11, v12);
      __swift_storeEnumTagSinglePayload((uint64_t)v10, 0, 1, v12);
    }
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

uint64_t destroy for CallObservationUpdate(uint64_t a1)
{
  uint64_t result;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  __swift_instantiateConcreteTypeFromMangledName(&qword_255DDD4A8);
  result = swift_getEnumCaseMultiPayload();
  if (!(_DWORD)result)
  {
    v3 = sub_22DFDCEFC();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
    v4 = a1 + *(int *)(type metadata accessor for HPCall() + 24);
    v5 = sub_22DFDCEC0();
    result = __swift_getEnumTagSinglePayload(v4, 1, v5);
    if (!(_DWORD)result)
      return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(v4, v5);
  }
  return result;
}

char *initializeWithCopy for CallObservationUpdate(char *a1, char *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_255DDD4A8);
  if (swift_getEnumCaseMultiPayload())
  {
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v4 - 8) + 64));
  }
  else
  {
    v5 = sub_22DFDCEFC();
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a1, a2, v5);
    v6 = type metadata accessor for HPCall();
    a1[*(int *)(v6 + 20)] = a2[*(int *)(v6 + 20)];
    v7 = *(int *)(v6 + 24);
    v8 = &a1[v7];
    v9 = &a2[v7];
    v10 = sub_22DFDCEC0();
    if (__swift_getEnumTagSinglePayload((uint64_t)v9, 1, v10))
    {
      v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_255DD7828);
      memcpy(v8, v9, *(_QWORD *)(*(_QWORD *)(v11 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v10 - 8) + 16))(v8, v9, v10);
      __swift_storeEnumTagSinglePayload((uint64_t)v8, 0, 1, v10);
    }
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

char *assignWithCopy for CallObservationUpdate(char *a1, char *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;

  if (a1 != a2)
  {
    sub_22DF34CE8((uint64_t)a1, &qword_255DDD4A8);
    v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_255DDD4A8);
    if (swift_getEnumCaseMultiPayload())
    {
      memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v4 - 8) + 64));
    }
    else
    {
      v5 = sub_22DFDCEFC();
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a1, a2, v5);
      v6 = type metadata accessor for HPCall();
      a1[*(int *)(v6 + 20)] = a2[*(int *)(v6 + 20)];
      v7 = *(int *)(v6 + 24);
      v8 = &a1[v7];
      v9 = &a2[v7];
      v10 = sub_22DFDCEC0();
      if (__swift_getEnumTagSinglePayload((uint64_t)v9, 1, v10))
      {
        v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_255DD7828);
        memcpy(v8, v9, *(_QWORD *)(*(_QWORD *)(v11 - 8) + 64));
      }
      else
      {
        (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v10 - 8) + 16))(v8, v9, v10);
        __swift_storeEnumTagSinglePayload((uint64_t)v8, 0, 1, v10);
      }
      swift_storeEnumTagMultiPayload();
    }
  }
  return a1;
}

char *initializeWithTake for CallObservationUpdate(char *a1, char *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_255DDD4A8);
  if (swift_getEnumCaseMultiPayload())
  {
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v4 - 8) + 64));
  }
  else
  {
    v5 = sub_22DFDCEFC();
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v5 - 8) + 32))(a1, a2, v5);
    v6 = type metadata accessor for HPCall();
    a1[*(int *)(v6 + 20)] = a2[*(int *)(v6 + 20)];
    v7 = *(int *)(v6 + 24);
    v8 = &a1[v7];
    v9 = &a2[v7];
    v10 = sub_22DFDCEC0();
    if (__swift_getEnumTagSinglePayload((uint64_t)v9, 1, v10))
    {
      v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_255DD7828);
      memcpy(v8, v9, *(_QWORD *)(*(_QWORD *)(v11 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v10 - 8) + 32))(v8, v9, v10);
      __swift_storeEnumTagSinglePayload((uint64_t)v8, 0, 1, v10);
    }
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

char *assignWithTake for CallObservationUpdate(char *a1, char *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;

  if (a1 != a2)
  {
    sub_22DF34CE8((uint64_t)a1, &qword_255DDD4A8);
    v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_255DDD4A8);
    if (swift_getEnumCaseMultiPayload())
    {
      memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v4 - 8) + 64));
    }
    else
    {
      v5 = sub_22DFDCEFC();
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v5 - 8) + 32))(a1, a2, v5);
      v6 = type metadata accessor for HPCall();
      a1[*(int *)(v6 + 20)] = a2[*(int *)(v6 + 20)];
      v7 = *(int *)(v6 + 24);
      v8 = &a1[v7];
      v9 = &a2[v7];
      v10 = sub_22DFDCEC0();
      if (__swift_getEnumTagSinglePayload((uint64_t)v9, 1, v10))
      {
        v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_255DD7828);
        memcpy(v8, v9, *(_QWORD *)(*(_QWORD *)(v11 - 8) + 64));
      }
      else
      {
        (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v10 - 8) + 32))(v8, v9, v10);
        __swift_storeEnumTagSinglePayload((uint64_t)v8, 0, 1, v10);
      }
      swift_storeEnumTagMultiPayload();
    }
  }
  return a1;
}

uint64_t getEnumTagSinglePayload for CallObservationUpdate()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_22DFDAB9C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_255DDD4A8);
  return __swift_getEnumTagSinglePayload(a1, a2, v4);
}

uint64_t storeEnumTagSinglePayload for CallObservationUpdate()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_22DFDABE0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_255DDD4A8);
  return OUTLINED_FUNCTION_11_20(a1, a2, a2, v4);
}

uint64_t sub_22DFDAC18()
{
  uint64_t result;
  unint64_t v1;

  result = sub_22DFDAC80();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t sub_22DFDAC80()
{
  uint64_t result;

  result = qword_255DDD670;
  if (!qword_255DDD670)
  {
    type metadata accessor for HPCall();
    sub_22DF328BC(&qword_255DDD4E8, (void (*)(uint64_t))type metadata accessor for HPCall);
    sub_22DF328BC(&qword_255DDD4F8, (void (*)(uint64_t))type metadata accessor for HPCall);
    type metadata accessor for UpdateResult();
  }
  return result;
}

uint64_t storeEnumTagSinglePayload for CallObservationUpdate.CodingKeys(uint64_t a1, int a2, int a3)
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
    return ((uint64_t (*)(void))((char *)sub_22DFDAD94 + 4 * asc_22DFEC400[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_22DFDADB4 + 4 * byte_22DFEC405[v4]))();
}

_BYTE *sub_22DFDAD94(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_22DFDADB4(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_22DFDADBC(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_22DFDADC4(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_22DFDADCC(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_22DFDADD4(_DWORD *result)
{
  *result = 0;
  return result;
}

ValueMetadata *type metadata accessor for CallObservationUpdate.CodingKeys()
{
  return &type metadata for CallObservationUpdate.CodingKeys;
}

unint64_t sub_22DFDADF4()
{
  unint64_t result;

  result = qword_255DDD6A0;
  if (!qword_255DDD6A0)
  {
    result = MEMORY[0x22E323AEC](&unk_22DFEC5D4, &type metadata for CallObservationUpdate.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_255DDD6A0);
  }
  return result;
}

unint64_t sub_22DFDAE34()
{
  unint64_t result;

  result = qword_255DDD6A8;
  if (!qword_255DDD6A8)
  {
    result = MEMORY[0x22E323AEC](&unk_22DFEC544, &type metadata for CallObservationUpdate.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_255DDD6A8);
  }
  return result;
}

unint64_t sub_22DFDAE74()
{
  unint64_t result;

  result = qword_255DDD6B0;
  if (!qword_255DDD6B0)
  {
    result = MEMORY[0x22E323AEC](&unk_22DFEC56C, &type metadata for CallObservationUpdate.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_255DDD6B0);
  }
  return result;
}

void sub_22DFDAEB0(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v3;

  v3 = __swift_instantiateConcreteTypeFromMangledName(a3);
  OUTLINED_FUNCTION_6_26(v3);
  OUTLINED_FUNCTION_1_2();
}

void sub_22DFDAEDC(uint64_t a1, uint64_t a2, uint64_t (*a3)(_QWORD))
{
  uint64_t v3;

  v3 = OUTLINED_FUNCTION_21_11(a1, a2, a3);
  OUTLINED_FUNCTION_6_26(v3);
  OUTLINED_FUNCTION_1_2();
}

uint64_t sub_22DFDAEFC()
{
  uint64_t v0;

  sub_22DF6A814(*(id *)(v0 + 16), *(_BYTE *)(v0 + 24));
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_22DFDAF2C@<X0>(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  return sub_22DF97580(a1, a2);
}

uint64_t OUTLINED_FUNCTION_1_29()
{
  _OWORD *v0;
  uint64_t v1;
  uint64_t v2;

  *(_OWORD *)(v2 - 144) = *v0;
  return sub_22DF35140(v1, v2 - 128);
}

uint64_t OUTLINED_FUNCTION_6_26(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(a1 - 8) + 16))(v1, v2, a1);
}

uint64_t OUTLINED_FUNCTION_7_27()
{
  uint64_t v0;

  return sub_22DF34CD0((__int128 *)(v0 - 224), v0 - 184);
}

uint64_t OUTLINED_FUNCTION_8_29()
{
  _OWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  *(_OWORD *)(v3 - 144) = *v0;
  return sub_22DF35140(v1, v2);
}

uint64_t OUTLINED_FUNCTION_10_24()
{
  uint64_t v0;

  return __swift_destroy_boxed_opaque_existential_0Tm(v0 - 280);
}

double OUTLINED_FUNCTION_11_25()
{
  uint64_t v0;
  double result;

  *(_QWORD *)(v0 - 192) = 0;
  result = 0.0;
  *(_OWORD *)(v0 - 224) = 0u;
  *(_OWORD *)(v0 - 208) = 0u;
  return result;
}

uint64_t OUTLINED_FUNCTION_12_23()
{
  uint64_t v0;

  return __swift_destroy_boxed_opaque_existential_0Tm(v0 - 184);
}

uint64_t OUTLINED_FUNCTION_14_21()
{
  return sub_22DFDD568();
}

void OUTLINED_FUNCTION_18_19()
{
  sub_22DF46EF8();
}

_QWORD *OUTLINED_FUNCTION_20_13()
{
  uint64_t v0;
  uint64_t v1;

  return __swift_project_boxed_opaque_existential_1((_QWORD *)(v1 - 184), v0);
}

void OUTLINED_FUNCTION_21_14(uint64_t a1, uint64_t *a2)
{
  uint64_t v2;

  sub_22DF34CE8(v2 - 224, a2);
}

void static OpalTransport.rapportTransportServer<A>(servicesRouter:deviceToMember:)(uint64_t a1)
{
  type metadata accessor for RapportTransport(0, *(_QWORD *)(*(_QWORD *)a1 + 80), *(_QWORD *)(*(_QWORD *)a1 + 88), *(_QWORD *)(*(_QWORD *)a1 + 96));
  swift_retain();
  swift_retain();
  sub_22DF97754();
}

void static OpalTransport.rapportTransportClient<A>(deviceToMember:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  type metadata accessor for ServicesRouter(0, a3, a4, a5);
  swift_getExtendedExistentialTypeMetadata();
  sub_22DFDD694();
  ServicesRouter.__allocating_init(services:registerAllowedRequests:)();
  type metadata accessor for RapportTransport(0, a3, a4, a5);
  swift_retain();
  sub_22DF97754();
}

void sub_22DFDB118(uint64_t *a1)
{
  type metadata accessor for RapportTransport(255, *a1, a1[1], a1[2]);
  JUMPOUT(0x22E323AECLL);
}

BOOL static TransportError.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t TransportError.hash(into:)()
{
  return sub_22DFDE00C();
}

uint64_t TransportError.hashValue.getter()
{
  sub_22DFDE000();
  sub_22DFDE00C();
  return sub_22DFDE030();
}

unint64_t sub_22DFDB1D4()
{
  unint64_t result;

  result = qword_255DDD6B8;
  if (!qword_255DDD6B8)
  {
    result = MEMORY[0x22E323AEC](&protocol conformance descriptor for TransportError, &type metadata for TransportError);
    atomic_store(result, (unint64_t *)&qword_255DDD6B8);
  }
  return result;
}

uint64_t dispatch thunk of TransportService.requestHandler.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t dispatch thunk of TransportService.requestHandler.setter(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 16))();
}

uint64_t dispatch thunk of TransportService.requestHandler.modify(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 24))();
}

uint64_t dispatch thunk of TransportService.activate()(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v5;
  uint64_t (*v7)(uint64_t, uint64_t);

  v7 = (uint64_t (*)(uint64_t, uint64_t))(**(int **)(a2 + 32) + *(_QWORD *)(a2 + 32));
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_22DF549B8;
  return v7(a1, a2);
}

uint64_t dispatch thunk of TransportService.invalidate()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 40))();
}

uint64_t storeEnumTagSinglePayload for TransportError(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_22DFDB2E8 + 4 * byte_22DFEC655[v4]))();
  *a1 = a2 + 3;
  return ((uint64_t (*)(void))((char *)sub_22DFDB31C + 4 * byte_22DFEC650[v4]))();
}

uint64_t sub_22DFDB31C(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_22DFDB324(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x22DFDB32CLL);
  return result;
}

uint64_t sub_22DFDB338(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x22DFDB340);
  *(_BYTE *)result = a2 + 3;
  return result;
}

uint64_t sub_22DFDB344(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_22DFDB34C(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for TransportError()
{
  return &type metadata for TransportError;
}

uint64_t storeEnumTagSinglePayload for ClusterCreationError(uint64_t a1, int a2, int a3)
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
    return ((uint64_t (*)(void))((char *)sub_22DFDB3A8 + 4 * byte_22DFEC750[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_22DFDB3C8 + 4 * byte_22DFEC755[v4]))();
}

_BYTE *sub_22DFDB3A8(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_22DFDB3C8(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_22DFDB3D0(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_22DFDB3D8(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_22DFDB3E0(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_22DFDB3E8(_DWORD *result)
{
  *result = 0;
  return result;
}

ValueMetadata *type metadata accessor for ClusterCreationError()
{
  return &type metadata for ClusterCreationError;
}

unint64_t sub_22DFDB408()
{
  unint64_t result;

  result = qword_255DDD6C8;
  if (!qword_255DDD6C8)
  {
    result = MEMORY[0x22E323AEC](&unk_22DFEC7C8, &type metadata for ClusterCreationError);
    atomic_store(result, (unint64_t *)&qword_255DDD6C8);
  }
  return result;
}

uint64_t sub_22DFDCD7C()
{
  return MEMORY[0x24BDCB070]();
}

uint64_t sub_22DFDCD88()
{
  return MEMORY[0x24BDCB098]();
}

uint64_t sub_22DFDCD94()
{
  return MEMORY[0x24BDCB0C0]();
}

uint64_t sub_22DFDCDA0()
{
  return MEMORY[0x24BDCB220]();
}

uint64_t sub_22DFDCDAC()
{
  return MEMORY[0x24BDCB260]();
}

uint64_t sub_22DFDCDB8()
{
  return MEMORY[0x24BDCB268]();
}

uint64_t sub_22DFDCDC4()
{
  return MEMORY[0x24BDCB6C0]();
}

uint64_t sub_22DFDCDD0()
{
  return MEMORY[0x24BDCB750]();
}

uint64_t sub_22DFDCDDC()
{
  return MEMORY[0x24BDCB9D8]();
}

uint64_t sub_22DFDCDE8()
{
  return MEMORY[0x24BDCB9E0]();
}

uint64_t sub_22DFDCDF4()
{
  return MEMORY[0x24BDCB9E8]();
}

uint64_t sub_22DFDCE00()
{
  return MEMORY[0x24BDCBE60]();
}

uint64_t sub_22DFDCE0C()
{
  return MEMORY[0x24BDCBE68]();
}

uint64_t sub_22DFDCE18()
{
  return MEMORY[0x24BDCBE78]();
}

uint64_t sub_22DFDCE24()
{
  return MEMORY[0x24BDCBE80]();
}

uint64_t sub_22DFDCE30()
{
  return MEMORY[0x24BDCD2F0]();
}

uint64_t sub_22DFDCE3C()
{
  return MEMORY[0x24BDCD2F8]();
}

uint64_t sub_22DFDCE48()
{
  return MEMORY[0x24BDCD9D8]();
}

uint64_t sub_22DFDCE54()
{
  return MEMORY[0x24BDCDA68]();
}

uint64_t sub_22DFDCE60()
{
  return MEMORY[0x24BDCDAC0]();
}

uint64_t sub_22DFDCE6C()
{
  return MEMORY[0x24BDCDCA0]();
}

uint64_t sub_22DFDCE78()
{
  return MEMORY[0x24BDCDCC8]();
}

uint64_t sub_22DFDCE84()
{
  return MEMORY[0x24BDCDCD8]();
}

uint64_t sub_22DFDCE90()
{
  return MEMORY[0x24BDCDCE0]();
}

uint64_t sub_22DFDCE9C()
{
  return MEMORY[0x24BDCDCF8]();
}

uint64_t sub_22DFDCEA8()
{
  return MEMORY[0x24BDCE5F0]();
}

uint64_t sub_22DFDCEB4()
{
  return MEMORY[0x24BDCE858]();
}

uint64_t sub_22DFDCEC0()
{
  return MEMORY[0x24BDCE900]();
}

uint64_t _s15HomePodSettings6HPCallV2idSSvg_0()
{
  return MEMORY[0x24BDCE9B0]();
}

uint64_t sub_22DFDCED8()
{
  return MEMORY[0x24BDCE9D0]();
}

uint64_t sub_22DFDCEE4()
{
  return MEMORY[0x24BDCE9E0]();
}

uint64_t sub_22DFDCEF0()
{
  return MEMORY[0x24BDCEA40]();
}

uint64_t sub_22DFDCEFC()
{
  return MEMORY[0x24BDCEA58]();
}

uint64_t sub_22DFDCF08()
{
  return MEMORY[0x24BEE78A8]();
}

uint64_t sub_22DFDCF14()
{
  return MEMORY[0x24BEE78C0]();
}

uint64_t sub_22DFDCF20()
{
  return MEMORY[0x24BEE78D8]();
}

uint64_t sub_22DFDCF2C()
{
  return MEMORY[0x24BDB94B8]();
}

uint64_t sub_22DFDCF38()
{
  return MEMORY[0x24BDB9648]();
}

uint64_t sub_22DFDCF44()
{
  return MEMORY[0x24BDB97E8]();
}

uint64_t sub_22DFDCF50()
{
  return MEMORY[0x24BDB9A68]();
}

uint64_t sub_22DFDCF5C()
{
  return MEMORY[0x24BDB9AE0]();
}

uint64_t sub_22DFDCF68()
{
  return MEMORY[0x24BDB9B40]();
}

uint64_t sub_22DFDCF74()
{
  return MEMORY[0x24BDB9B50]();
}

uint64_t sub_22DFDCF80()
{
  return MEMORY[0x24BDB9C78]();
}

uint64_t sub_22DFDCF8C()
{
  return MEMORY[0x24BDB9C88]();
}

uint64_t sub_22DFDCF98()
{
  return MEMORY[0x24BDB9C90]();
}

uint64_t sub_22DFDCFA4()
{
  return MEMORY[0x24BDB9C98]();
}

uint64_t sub_22DFDCFB0()
{
  return MEMORY[0x24BDB9CB8]();
}

uint64_t sub_22DFDCFBC()
{
  return MEMORY[0x24BDB9CC0]();
}

uint64_t sub_22DFDCFC8()
{
  return MEMORY[0x24BDB9CD0]();
}

uint64_t sub_22DFDCFD4()
{
  return MEMORY[0x24BDB9CD8]();
}

uint64_t sub_22DFDCFE0()
{
  return MEMORY[0x24BDB9CE0]();
}

uint64_t sub_22DFDCFEC()
{
  return MEMORY[0x24BDB9CF8]();
}

uint64_t sub_22DFDCFF8()
{
  return MEMORY[0x24BDB9F20]();
}

uint64_t sub_22DFDD004()
{
  return MEMORY[0x24BDB9F30]();
}

uint64_t sub_22DFDD010()
{
  return MEMORY[0x24BDB9F90]();
}

uint64_t sub_22DFDD01C()
{
  return MEMORY[0x24BDB9FB0]();
}

uint64_t sub_22DFDD028()
{
  return MEMORY[0x24BDBA030]();
}

uint64_t sub_22DFDD034()
{
  return MEMORY[0x24BDBA0E8]();
}

uint64_t sub_22DFDD040()
{
  return MEMORY[0x24BDBA110]();
}

uint64_t sub_22DFDD04C()
{
  return MEMORY[0x24BEE54C8]();
}

uint64_t sub_22DFDD058()
{
  return MEMORY[0x24BEE5500]();
}

uint64_t sub_22DFDD064()
{
  return MEMORY[0x24BE17E30]();
}

uint64_t sub_22DFDD070()
{
  return MEMORY[0x24BE17E60]();
}

uint64_t sub_22DFDD07C()
{
  return MEMORY[0x24BE17E70]();
}

uint64_t sub_22DFDD088()
{
  return MEMORY[0x24BE17E78]();
}

uint64_t sub_22DFDD094()
{
  return MEMORY[0x24BE17EA0]();
}

uint64_t sub_22DFDD0A0()
{
  return MEMORY[0x24BE17EC0]();
}

uint64_t sub_22DFDD0AC()
{
  return MEMORY[0x24BE17EC8]();
}

uint64_t sub_22DFDD0B8()
{
  return MEMORY[0x24BE17ED0]();
}

uint64_t sub_22DFDD0C4()
{
  return MEMORY[0x24BE17ED8]();
}

uint64_t sub_22DFDD0D0()
{
  return MEMORY[0x24BE17EE0]();
}

uint64_t sub_22DFDD0DC()
{
  return MEMORY[0x24BE17EE8]();
}

uint64_t sub_22DFDD0E8()
{
  return MEMORY[0x24BE17EF0]();
}

uint64_t sub_22DFDD0F4()
{
  return MEMORY[0x24BE17EF8]();
}

uint64_t sub_22DFDD100()
{
  return MEMORY[0x24BE17F00]();
}

uint64_t sub_22DFDD10C()
{
  return MEMORY[0x24BE17F08]();
}

uint64_t sub_22DFDD118()
{
  return MEMORY[0x24BE17F10]();
}

uint64_t sub_22DFDD124()
{
  return MEMORY[0x24BE17F18]();
}

uint64_t sub_22DFDD130()
{
  return MEMORY[0x24BE17F20]();
}

uint64_t sub_22DFDD13C()
{
  return MEMORY[0x24BE17F28]();
}

uint64_t sub_22DFDD148()
{
  return MEMORY[0x24BE17F30]();
}

uint64_t sub_22DFDD154()
{
  return MEMORY[0x24BE17F38]();
}

uint64_t sub_22DFDD160()
{
  return MEMORY[0x24BE18040]();
}

uint64_t sub_22DFDD16C()
{
  return MEMORY[0x24BE18048]();
}

uint64_t sub_22DFDD178()
{
  return MEMORY[0x24BE18050]();
}

uint64_t sub_22DFDD184()
{
  return MEMORY[0x24BE18058]();
}

uint64_t sub_22DFDD190()
{
  return MEMORY[0x24BE18060]();
}

uint64_t sub_22DFDD19C()
{
  return MEMORY[0x24BE18068]();
}

uint64_t sub_22DFDD1A8()
{
  return MEMORY[0x24BE18070]();
}

uint64_t sub_22DFDD1B4()
{
  return MEMORY[0x24BE18078]();
}

uint64_t sub_22DFDD1C0()
{
  return MEMORY[0x24BE18080]();
}

uint64_t sub_22DFDD1CC()
{
  return MEMORY[0x24BE18088]();
}

uint64_t sub_22DFDD1D8()
{
  return MEMORY[0x24BE18090]();
}

uint64_t sub_22DFDD1E4()
{
  return MEMORY[0x24BE18098]();
}

uint64_t sub_22DFDD1F0()
{
  return MEMORY[0x24BE180A0]();
}

uint64_t sub_22DFDD1FC()
{
  return MEMORY[0x24BE180A8]();
}

uint64_t sub_22DFDD208()
{
  return MEMORY[0x24BE180B0]();
}

uint64_t sub_22DFDD214()
{
  return MEMORY[0x24BE180B8]();
}

uint64_t sub_22DFDD220()
{
  return MEMORY[0x24BE181D8]();
}

uint64_t sub_22DFDD22C()
{
  return MEMORY[0x24BE181E0]();
}

uint64_t sub_22DFDD238()
{
  return MEMORY[0x24BE18210]();
}

uint64_t sub_22DFDD244()
{
  return MEMORY[0x24BE18228]();
}

uint64_t sub_22DFDD250()
{
  return MEMORY[0x24BE18240]();
}

uint64_t sub_22DFDD25C()
{
  return MEMORY[0x24BE18248]();
}

uint64_t sub_22DFDD268()
{
  return MEMORY[0x24BE18258]();
}

uint64_t sub_22DFDD274()
{
  return MEMORY[0x24BE18260]();
}

uint64_t sub_22DFDD280()
{
  return MEMORY[0x24BE183A0]();
}

uint64_t sub_22DFDD28C()
{
  return MEMORY[0x24BE183A8]();
}

uint64_t sub_22DFDD298()
{
  return MEMORY[0x24BE183B8]();
}

uint64_t sub_22DFDD2A4()
{
  return MEMORY[0x24BE183C0]();
}

uint64_t sub_22DFDD2B0()
{
  return MEMORY[0x24BE183C8]();
}

uint64_t sub_22DFDD2BC()
{
  return MEMORY[0x24BE184B8]();
}

uint64_t sub_22DFDD2C8()
{
  return MEMORY[0x24BE18538]();
}

uint64_t sub_22DFDD2D4()
{
  return MEMORY[0x24BE18540]();
}

uint64_t sub_22DFDD2E0()
{
  return MEMORY[0x24BE18548]();
}

uint64_t sub_22DFDD2EC()
{
  return MEMORY[0x24BE18550]();
}

uint64_t sub_22DFDD2F8()
{
  return MEMORY[0x24BE18560]();
}

uint64_t sub_22DFDD304()
{
  return MEMORY[0x24BE18598]();
}

uint64_t sub_22DFDD310()
{
  return MEMORY[0x24BE185A0]();
}

uint64_t sub_22DFDD31C()
{
  return MEMORY[0x24BE18630]();
}

uint64_t sub_22DFDD328()
{
  return MEMORY[0x24BE186C0]();
}

uint64_t sub_22DFDD334()
{
  return MEMORY[0x24BE186C8]();
}

uint64_t sub_22DFDD340()
{
  return MEMORY[0x24BE18758]();
}

uint64_t sub_22DFDD34C()
{
  return MEMORY[0x24BE18768]();
}

uint64_t sub_22DFDD358()
{
  return MEMORY[0x24BE18820]();
}

uint64_t sub_22DFDD364()
{
  return MEMORY[0x24BE18830]();
}

uint64_t sub_22DFDD370()
{
  return MEMORY[0x24BE18848]();
}

uint64_t sub_22DFDD37C()
{
  return MEMORY[0x24BE18858]();
}

uint64_t sub_22DFDD388()
{
  return MEMORY[0x24BE188E0]();
}

uint64_t sub_22DFDD394()
{
  return MEMORY[0x24BE188F0]();
}

uint64_t sub_22DFDD3A0()
{
  return MEMORY[0x24BE188F8]();
}

uint64_t sub_22DFDD3AC()
{
  return MEMORY[0x24BE189A8]();
}

uint64_t sub_22DFDD3B8()
{
  return MEMORY[0x24BE189B0]();
}

uint64_t sub_22DFDD3C4()
{
  return MEMORY[0x24BE189C0]();
}

uint64_t sub_22DFDD3D0()
{
  return MEMORY[0x24BE189D0]();
}

uint64_t sub_22DFDD3DC()
{
  return MEMORY[0x24BEE01A8]();
}

uint64_t sub_22DFDD3E8()
{
  return MEMORY[0x24BEE01B8]();
}

uint64_t sub_22DFDD3F4()
{
  return MEMORY[0x24BEE01C0]();
}

uint64_t sub_22DFDD400()
{
  return MEMORY[0x24BDCF808]();
}

uint64_t sub_22DFDD40C()
{
  return MEMORY[0x24BDCF830]();
}

uint64_t sub_22DFDD418()
{
  return MEMORY[0x24BEE0270]();
}

uint64_t sub_22DFDD424()
{
  return MEMORY[0x24BEE0278]();
}

uint64_t sub_22DFDD430()
{
  return MEMORY[0x24BEE02B0]();
}

uint64_t sub_22DFDD43C()
{
  return MEMORY[0x24BEE0300]();
}

uint64_t sub_22DFDD448()
{
  return MEMORY[0x24BEE0328]();
}

uint64_t sub_22DFDD454()
{
  return MEMORY[0x24BEE03B0]();
}

uint64_t sub_22DFDD460()
{
  return MEMORY[0x24BEE03D0]();
}

uint64_t sub_22DFDD46C()
{
  return MEMORY[0x24BEE03E0]();
}

uint64_t sub_22DFDD478()
{
  return MEMORY[0x24BEE0418]();
}

uint64_t sub_22DFDD484()
{
  return MEMORY[0x24BEE0460]();
}

uint64_t sub_22DFDD490()
{
  return MEMORY[0x24BEE04A0]();
}

uint64_t sub_22DFDD49C()
{
  return MEMORY[0x24BEE04A8]();
}

uint64_t sub_22DFDD4A8()
{
  return MEMORY[0x24BEE04B0]();
}

uint64_t sub_22DFDD4B4()
{
  return MEMORY[0x24BEE0610]();
}

uint64_t sub_22DFDD4C0()
{
  return MEMORY[0x24BEE0618]();
}

uint64_t sub_22DFDD4CC()
{
  return MEMORY[0x24BEE07D0]();
}

uint64_t sub_22DFDD4D8()
{
  return MEMORY[0x24BEE07E0]();
}

uint64_t sub_22DFDD4E4()
{
  return MEMORY[0x24BEE07F0]();
}

uint64_t sub_22DFDD4F0()
{
  return MEMORY[0x24BEE0980]();
}

uint64_t sub_22DFDD4FC()
{
  return MEMORY[0x24BDCF9E0]();
}

uint64_t sub_22DFDD508()
{
  return MEMORY[0x24BDCFA18]();
}

uint64_t sub_22DFDD514()
{
  return MEMORY[0x24BDCFA28]();
}

uint64_t sub_22DFDD520()
{
  return MEMORY[0x24BEE09F0]();
}

uint64_t sub_22DFDD52C()
{
  return MEMORY[0x24BEE0A08]();
}

uint64_t sub_22DFDD538()
{
  return MEMORY[0x24BEE0A50]();
}

uint64_t sub_22DFDD544()
{
  return MEMORY[0x24BEE0B20]();
}

uint64_t sub_22DFDD550()
{
  return MEMORY[0x24BEE0B68]();
}

uint64_t sub_22DFDD55C()
{
  return MEMORY[0x24BEE0B70]();
}

uint64_t sub_22DFDD568()
{
  return MEMORY[0x24BEE0BC0]();
}

uint64_t sub_22DFDD574()
{
  return MEMORY[0x24BEE0C10]();
}

uint64_t sub_22DFDD580()
{
  return MEMORY[0x24BEE0CD0]();
}

uint64_t sub_22DFDD58C()
{
  return MEMORY[0x24BEE0CF0]();
}

uint64_t sub_22DFDD598()
{
  return MEMORY[0x24BEE0D98]();
}

uint64_t sub_22DFDD5A4()
{
  return MEMORY[0x24BEE0DD0]();
}

uint64_t sub_22DFDD5B0()
{
  return MEMORY[0x24BEE0DE0]();
}

uint64_t sub_22DFDD5BC()
{
  return MEMORY[0x24BEE0DE8]();
}

uint64_t sub_22DFDD5C8()
{
  return MEMORY[0x24BEE0DF8]();
}

uint64_t sub_22DFDD5D4()
{
  return MEMORY[0x24BEE0E80]();
}

uint64_t sub_22DFDD5E0()
{
  return MEMORY[0x24BEE0E98]();
}

uint64_t sub_22DFDD5EC()
{
  return MEMORY[0x24BEE0EA0]();
}

uint64_t sub_22DFDD5F8()
{
  return MEMORY[0x24BEE0EB0]();
}

uint64_t sub_22DFDD604()
{
  return MEMORY[0x24BEE0EB8]();
}

uint64_t sub_22DFDD610()
{
  return MEMORY[0x24BEE0ED8]();
}

uint64_t sub_22DFDD61C()
{
  return MEMORY[0x24BEE0EE0]();
}

uint64_t sub_22DFDD628()
{
  return MEMORY[0x24BEE0F30]();
}

uint64_t sub_22DFDD634()
{
  return MEMORY[0x24BEE1018]();
}

uint64_t sub_22DFDD640()
{
  return MEMORY[0x24BEE1098]();
}

uint64_t sub_22DFDD64C()
{
  return MEMORY[0x24BEE1110]();
}

uint64_t sub_22DFDD658()
{
  return MEMORY[0x24BEE1118]();
}

uint64_t sub_22DFDD664()
{
  return MEMORY[0x24BEE1120]();
}

uint64_t sub_22DFDD670()
{
  return MEMORY[0x24BEE1128]();
}

uint64_t sub_22DFDD67C()
{
  return MEMORY[0x24BEE1140]();
}

uint64_t sub_22DFDD688()
{
  return MEMORY[0x24BEE1160]();
}

uint64_t sub_22DFDD694()
{
  return MEMORY[0x24BEE1180]();
}

uint64_t sub_22DFDD6A0()
{
  return MEMORY[0x24BEE1190]();
}

uint64_t sub_22DFDD6AC()
{
  return MEMORY[0x24BEE11A0]();
}

uint64_t sub_22DFDD6B8()
{
  return MEMORY[0x24BEE11B8]();
}

uint64_t sub_22DFDD6C4()
{
  return MEMORY[0x24BEE11C8]();
}

uint64_t sub_22DFDD6D0()
{
  return MEMORY[0x24BEE11F8]();
}

uint64_t sub_22DFDD6DC()
{
  return MEMORY[0x24BEE1200]();
}

uint64_t sub_22DFDD6E8()
{
  return MEMORY[0x24BEE1208]();
}

uint64_t sub_22DFDD6F4()
{
  return MEMORY[0x24BEE1220]();
}

uint64_t sub_22DFDD700()
{
  return MEMORY[0x24BEE1228]();
}

uint64_t sub_22DFDD70C()
{
  return MEMORY[0x24BEE1230]();
}

uint64_t sub_22DFDD718()
{
  return MEMORY[0x24BEE1250]();
}

uint64_t sub_22DFDD724()
{
  return MEMORY[0x24BEE1288]();
}

uint64_t sub_22DFDD730()
{
  return MEMORY[0x24BEE6800]();
}

uint64_t sub_22DFDD73C()
{
  return MEMORY[0x24BEE6820]();
}

uint64_t sub_22DFDD748()
{
  return MEMORY[0x24BEE6828]();
}

uint64_t sub_22DFDD754()
{
  return MEMORY[0x24BEE6920]();
}

uint64_t sub_22DFDD760()
{
  return MEMORY[0x24BEE6928]();
}

uint64_t sub_22DFDD76C()
{
  return MEMORY[0x24BEE6988]();
}

uint64_t sub_22DFDD778()
{
  return MEMORY[0x24BEE6990]();
}

uint64_t sub_22DFDD784()
{
  return MEMORY[0x24BEE69A8]();
}

uint64_t sub_22DFDD790()
{
  return MEMORY[0x24BEE69E8]();
}

uint64_t sub_22DFDD79C()
{
  return MEMORY[0x24BEE69F8]();
}

uint64_t sub_22DFDD7A8()
{
  return MEMORY[0x24BEE6A18]();
}

uint64_t sub_22DFDD7B4()
{
  return MEMORY[0x24BEE6A30]();
}

uint64_t sub_22DFDD7C0()
{
  return MEMORY[0x24BEE6A38]();
}

uint64_t sub_22DFDD7CC()
{
  return MEMORY[0x24BEE6A40]();
}

uint64_t sub_22DFDD7D8()
{
  return MEMORY[0x24BEE6AA0]();
}

uint64_t sub_22DFDD7E4()
{
  return MEMORY[0x24BEE6AC0]();
}

uint64_t sub_22DFDD7F0()
{
  return MEMORY[0x24BEE6AD0]();
}

uint64_t sub_22DFDD7FC()
{
  return MEMORY[0x24BEE6B10]();
}

uint64_t sub_22DFDD808()
{
  return MEMORY[0x24BEE6B20]();
}

uint64_t sub_22DFDD814()
{
  return MEMORY[0x24BEE6B28]();
}

uint64_t sub_22DFDD820()
{
  return MEMORY[0x24BEE6B48]();
}

uint64_t sub_22DFDD82C()
{
  return MEMORY[0x24BEE6B98]();
}

uint64_t sub_22DFDD838()
{
  return MEMORY[0x24BEE6BB8]();
}

uint64_t sub_22DFDD844()
{
  return MEMORY[0x24BEE6C50]();
}

uint64_t sub_22DFDD850()
{
  return MEMORY[0x24BEE6C80]();
}

uint64_t sub_22DFDD85C()
{
  return MEMORY[0x24BEE6C90]();
}

uint64_t sub_22DFDD868()
{
  return MEMORY[0x24BEE6CA8]();
}

uint64_t sub_22DFDD874()
{
  return MEMORY[0x24BEE6CC0]();
}

uint64_t sub_22DFDD880()
{
  return MEMORY[0x24BEE6CC8]();
}

uint64_t sub_22DFDD88C()
{
  return MEMORY[0x24BEE6CD0]();
}

uint64_t sub_22DFDD898()
{
  return MEMORY[0x24BEE6CE0]();
}

uint64_t sub_22DFDD8A4()
{
  return MEMORY[0x24BEE6CE8]();
}

uint64_t sub_22DFDD8B0()
{
  return MEMORY[0x24BEE6D08]();
}

uint64_t sub_22DFDD8BC()
{
  return MEMORY[0x24BEE6D28]();
}

uint64_t sub_22DFDD8C8()
{
  return MEMORY[0x24BEE6D30]();
}

uint64_t sub_22DFDD8D4()
{
  return MEMORY[0x24BEE13A8]();
}

uint64_t sub_22DFDD8E0()
{
  return MEMORY[0x24BDCFCC0]();
}

uint64_t sub_22DFDD8EC()
{
  return MEMORY[0x24BEE1598]();
}

uint64_t sub_22DFDD8F8()
{
  return MEMORY[0x24BEE15A8]();
}

uint64_t sub_22DFDD904()
{
  return MEMORY[0x24BEE15B0]();
}

uint64_t sub_22DFDD910()
{
  return MEMORY[0x24BEE15C0]();
}

uint64_t sub_22DFDD91C()
{
  return MEMORY[0x24BEE15C8]();
}

uint64_t sub_22DFDD928()
{
  return MEMORY[0x24BEE15D8]();
}

uint64_t sub_22DFDD934()
{
  return MEMORY[0x24BEE15F8]();
}

uint64_t sub_22DFDD940()
{
  return MEMORY[0x24BEE1628]();
}

uint64_t sub_22DFDD94C()
{
  return MEMORY[0x24BEE1638]();
}

uint64_t sub_22DFDD958()
{
  return MEMORY[0x24BEE1640]();
}

uint64_t sub_22DFDD964()
{
  return MEMORY[0x24BEE1648]();
}

uint64_t sub_22DFDD970()
{
  return MEMORY[0x24BEE1658]();
}

uint64_t sub_22DFDD97C()
{
  return MEMORY[0x24BEE1668]();
}

uint64_t sub_22DFDD988()
{
  return MEMORY[0x24BEE1678]();
}

uint64_t sub_22DFDD994()
{
  return MEMORY[0x24BEE1690]();
}

uint64_t sub_22DFDD9A0()
{
  return MEMORY[0x24BEE16B0]();
}

uint64_t sub_22DFDD9AC()
{
  return MEMORY[0x24BEE16D8]();
}

uint64_t sub_22DFDD9B8()
{
  return MEMORY[0x24BEE16F8]();
}

uint64_t sub_22DFDD9C4()
{
  return MEMORY[0x24BEE18A0]();
}

uint64_t sub_22DFDD9D0()
{
  return MEMORY[0x24BEE7610]();
}

uint64_t sub_22DFDD9DC()
{
  return MEMORY[0x24BEE18D0]();
}

uint64_t sub_22DFDD9E8()
{
  return MEMORY[0x24BEE18E0]();
}

uint64_t sub_22DFDD9F4()
{
  return MEMORY[0x24BEE18E8]();
}

uint64_t sub_22DFDDA00()
{
  return MEMORY[0x24BEE18F8]();
}

uint64_t sub_22DFDDA0C()
{
  return MEMORY[0x24BEE1900]();
}

uint64_t sub_22DFDDA18()
{
  return MEMORY[0x24BEE1910]();
}

uint64_t sub_22DFDDA24()
{
  return MEMORY[0x24BEE1918]();
}

uint64_t sub_22DFDDA30()
{
  return MEMORY[0x24BEE1930]();
}

uint64_t sub_22DFDDA3C()
{
  return MEMORY[0x24BEE1938]();
}

uint64_t sub_22DFDDA48()
{
  return MEMORY[0x24BEE19B8]();
}

uint64_t sub_22DFDDA54()
{
  return MEMORY[0x24BEE1A20]();
}

uint64_t sub_22DFDDA60()
{
  return MEMORY[0x24BEE1A28]();
}

uint64_t sub_22DFDDA6C()
{
  return MEMORY[0x24BEE7648]();
}

uint64_t sub_22DFDDA78()
{
  return MEMORY[0x24BEE1B10]();
}

uint64_t sub_22DFDDA84()
{
  return MEMORY[0x24BEE1B68]();
}

uint64_t sub_22DFDDA90()
{
  return MEMORY[0x24BDCFED8]();
}

uint64_t sub_22DFDDA9C()
{
  return MEMORY[0x24BEE7910]();
}

uint64_t sub_22DFDDAA8()
{
  return MEMORY[0x24BEE7928]();
}

uint64_t sub_22DFDDAB4()
{
  return MEMORY[0x24BDCFF70]();
}

uint64_t sub_22DFDDAC0()
{
  return MEMORY[0x24BDCFFA0]();
}

uint64_t sub_22DFDDACC()
{
  return MEMORY[0x24BDCFFB0]();
}

uint64_t sub_22DFDDAD8()
{
  return MEMORY[0x24BDCFFD8]();
}

uint64_t sub_22DFDDAE4()
{
  return MEMORY[0x24BEE5688]();
}

uint64_t sub_22DFDDAF0()
{
  return MEMORY[0x24BEE5760]();
}

uint64_t sub_22DFDDAFC()
{
  return MEMORY[0x24BEE57A0]();
}

uint64_t sub_22DFDDB08()
{
  return MEMORY[0x24BDD0170]();
}

uint64_t sub_22DFDDB14()
{
  return MEMORY[0x24BEE5BB8]();
}

uint64_t sub_22DFDDB20()
{
  return MEMORY[0x24BEE5BC0]();
}

uint64_t sub_22DFDDB2C()
{
  return MEMORY[0x24BEE1C68]();
}

uint64_t sub_22DFDDB38()
{
  return MEMORY[0x24BEE1DB8]();
}

uint64_t sub_22DFDDB44()
{
  return MEMORY[0x24BEE1DC0]();
}

uint64_t sub_22DFDDB50()
{
  return MEMORY[0x24BEE1DF0]();
}

uint64_t sub_22DFDDB5C()
{
  return MEMORY[0x24BEE1E60]();
}

uint64_t sub_22DFDDB68()
{
  return MEMORY[0x24BEE1E70]();
}

uint64_t sub_22DFDDB74()
{
  return MEMORY[0x24BEE1F00]();
}

uint64_t sub_22DFDDB80()
{
  return MEMORY[0x24BEE1F48]();
}

uint64_t sub_22DFDDB8C()
{
  return MEMORY[0x24BDD0548]();
}

uint64_t sub_22DFDDB98()
{
  return MEMORY[0x24BDD0568]();
}

uint64_t sub_22DFDDBA4()
{
  return MEMORY[0x24BDD0638]();
}

uint64_t sub_22DFDDBB0()
{
  return MEMORY[0x24BEE20A8]();
}

uint64_t sub_22DFDDBBC()
{
  return MEMORY[0x24BEE2150]();
}

uint64_t sub_22DFDDBC8()
{
  return MEMORY[0x24BEE2168]();
}

uint64_t sub_22DFDDBD4()
{
  return MEMORY[0x24BEE22C0]();
}

uint64_t sub_22DFDDBE0()
{
  return MEMORY[0x24BEE22D0]();
}

uint64_t sub_22DFDDBEC()
{
  return MEMORY[0x24BEE22D8]();
}

uint64_t sub_22DFDDBF8()
{
  return MEMORY[0x24BEE22E0]();
}

uint64_t sub_22DFDDC04()
{
  return MEMORY[0x24BEE2300]();
}

uint64_t sub_22DFDDC10()
{
  return MEMORY[0x24BEE2330]();
}

uint64_t sub_22DFDDC1C()
{
  return MEMORY[0x24BEE2340]();
}

uint64_t sub_22DFDDC28()
{
  return MEMORY[0x24BEE2358]();
}

uint64_t sub_22DFDDC34()
{
  return MEMORY[0x24BEE2378]();
}

uint64_t sub_22DFDDC40()
{
  return MEMORY[0x24BEE23A0]();
}

uint64_t sub_22DFDDC4C()
{
  return MEMORY[0x24BEE23A8]();
}

uint64_t sub_22DFDDC58()
{
  return MEMORY[0x24BEE23E8]();
}

uint64_t sub_22DFDDC64()
{
  return MEMORY[0x24BEE24B8]();
}

uint64_t sub_22DFDDC70()
{
  return MEMORY[0x24BEE24C0]();
}

uint64_t sub_22DFDDC7C()
{
  return MEMORY[0x24BEE24C8]();
}

uint64_t sub_22DFDDC88()
{
  return MEMORY[0x24BEE24D0]();
}

uint64_t sub_22DFDDC94()
{
  return MEMORY[0x24BEE24D8]();
}

uint64_t sub_22DFDDCA0()
{
  return MEMORY[0x24BEE2510]();
}

uint64_t sub_22DFDDCAC()
{
  return MEMORY[0x24BEE2518]();
}

uint64_t sub_22DFDDCB8()
{
  return MEMORY[0x24BEE2568]();
}

uint64_t sub_22DFDDCC4()
{
  return MEMORY[0x24BEE2650]();
}

uint64_t sub_22DFDDCD0()
{
  return MEMORY[0x24BEE2658]();
}

uint64_t sub_22DFDDCDC()
{
  return MEMORY[0x24BEE26E8]();
}

uint64_t sub_22DFDDCE8()
{
  return MEMORY[0x24BEE2710]();
}

uint64_t sub_22DFDDCF4()
{
  return MEMORY[0x24BEE2838]();
}

uint64_t sub_22DFDDD00()
{
  return MEMORY[0x24BEE2950]();
}

uint64_t sub_22DFDDD0C()
{
  return MEMORY[0x24BEE29C0]();
}

uint64_t sub_22DFDDD18()
{
  return MEMORY[0x24BEE2A00]();
}

uint64_t sub_22DFDDD24()
{
  return MEMORY[0x24BEE2A08]();
}

uint64_t sub_22DFDDD30()
{
  return MEMORY[0x24BEE2B80]();
}

uint64_t sub_22DFDDD3C()
{
  return MEMORY[0x24BEE2BE0]();
}

uint64_t sub_22DFDDD48()
{
  return MEMORY[0x24BEE2E58]();
}

uint64_t sub_22DFDDD54()
{
  return MEMORY[0x24BEE2E68]();
}

uint64_t sub_22DFDDD60()
{
  return MEMORY[0x24BEE2E70]();
}

uint64_t sub_22DFDDD6C()
{
  return MEMORY[0x24BEE2EA8]();
}

uint64_t sub_22DFDDD78()
{
  return MEMORY[0x24BEE2EE0]();
}

uint64_t sub_22DFDDD84()
{
  return MEMORY[0x24BEE2F08]();
}

uint64_t sub_22DFDDD90()
{
  return MEMORY[0x24BEE2F18]();
}

uint64_t sub_22DFDDD9C()
{
  return MEMORY[0x24BEE2F40]();
}

uint64_t sub_22DFDDDA8()
{
  return MEMORY[0x24BEE2F48]();
}

uint64_t sub_22DFDDDB4()
{
  return MEMORY[0x24BEE3068]();
}

uint64_t sub_22DFDDDC0()
{
  return MEMORY[0x24BEE3088]();
}

uint64_t sub_22DFDDDCC()
{
  return MEMORY[0x24BEE3090]();
}

uint64_t sub_22DFDDDD8()
{
  return MEMORY[0x24BEE3098]();
}

uint64_t sub_22DFDDDE4()
{
  return MEMORY[0x24BEE30B0]();
}

uint64_t sub_22DFDDDF0()
{
  return MEMORY[0x24BEE30D0]();
}

uint64_t sub_22DFDDDFC()
{
  return MEMORY[0x24BEE3290]();
}

uint64_t sub_22DFDDE08()
{
  return MEMORY[0x24BEE6FA8]();
}

uint64_t sub_22DFDDE14()
{
  return MEMORY[0x24BEE32B8]();
}

uint64_t sub_22DFDDE20()
{
  return MEMORY[0x24BEE32C0]();
}

uint64_t sub_22DFDDE2C()
{
  return MEMORY[0x24BEE32D8]();
}

uint64_t sub_22DFDDE38()
{
  return MEMORY[0x24BEE32E0]();
}

uint64_t sub_22DFDDE44()
{
  return MEMORY[0x24BEE3308]();
}

uint64_t sub_22DFDDE50()
{
  return MEMORY[0x24BEE3350]();
}

uint64_t sub_22DFDDE5C()
{
  return MEMORY[0x24BEE3358]();
}

uint64_t sub_22DFDDE68()
{
  return MEMORY[0x24BEE3360]();
}

uint64_t sub_22DFDDE74()
{
  return MEMORY[0x24BEE3380]();
}

uint64_t sub_22DFDDE80()
{
  return MEMORY[0x24BEE33C8]();
}

uint64_t sub_22DFDDE8C()
{
  return MEMORY[0x24BEE33E0]();
}

uint64_t sub_22DFDDE98()
{
  return MEMORY[0x24BEE3408]();
}

uint64_t sub_22DFDDEA4()
{
  return MEMORY[0x24BEE3428]();
}

uint64_t sub_22DFDDEB0()
{
  return MEMORY[0x24BEE3430]();
}

uint64_t sub_22DFDDEBC()
{
  return MEMORY[0x24BEE3458]();
}

uint64_t sub_22DFDDEC8()
{
  return MEMORY[0x24BEE34A0]();
}

uint64_t sub_22DFDDED4()
{
  return MEMORY[0x24BEE34A8]();
}

uint64_t sub_22DFDDEE0()
{
  return MEMORY[0x24BEE34B0]();
}

uint64_t sub_22DFDDEEC()
{
  return MEMORY[0x24BEE34D0]();
}

uint64_t sub_22DFDDEF8()
{
  return MEMORY[0x24BEE3520]();
}

uint64_t sub_22DFDDF04()
{
  return MEMORY[0x24BEE3548]();
}

uint64_t sub_22DFDDF10()
{
  return MEMORY[0x24BEE3568]();
}

uint64_t sub_22DFDDF1C()
{
  return MEMORY[0x24BEE3880]();
}

uint64_t sub_22DFDDF28()
{
  return MEMORY[0x24BEE3930]();
}

uint64_t sub_22DFDDF34()
{
  return MEMORY[0x24BEE3938]();
}

uint64_t sub_22DFDDF40()
{
  return MEMORY[0x24BEE39B0]();
}

uint64_t sub_22DFDDF4C()
{
  return MEMORY[0x24BEE3A20]();
}

uint64_t sub_22DFDDF58()
{
  return MEMORY[0x24BEE3A30]();
}

uint64_t sub_22DFDDF64()
{
  return MEMORY[0x24BEE70E0]();
}

uint64_t sub_22DFDDF70()
{
  return MEMORY[0x24BEE3DE0]();
}

uint64_t sub_22DFDDF7C()
{
  return MEMORY[0x24BEE3ED0]();
}

uint64_t sub_22DFDDF88()
{
  return MEMORY[0x24BEE3ED8]();
}

uint64_t sub_22DFDDF94()
{
  return MEMORY[0x24BDD06E0]();
}

uint64_t sub_22DFDDFA0()
{
  return MEMORY[0x24BDD06F0]();
}

uint64_t sub_22DFDDFAC()
{
  return MEMORY[0x24BDD0708]();
}

uint64_t sub_22DFDDFB8()
{
  return MEMORY[0x24BEE3EF8]();
}

uint64_t sub_22DFDDFC4()
{
  return MEMORY[0x24BEE3F00]();
}

uint64_t sub_22DFDDFD0()
{
  return MEMORY[0x24BEE3F08]();
}

uint64_t sub_22DFDDFDC()
{
  return MEMORY[0x24BEE3F10]();
}

uint64_t sub_22DFDDFE8()
{
  return MEMORY[0x24BEE42C0]();
}

uint64_t sub_22DFDDFF4()
{
  return MEMORY[0x24BEE42D8]();
}

uint64_t sub_22DFDE000()
{
  return MEMORY[0x24BEE42E0]();
}

uint64_t sub_22DFDE00C()
{
  return MEMORY[0x24BEE42F8]();
}

uint64_t sub_22DFDE018()
{
  return MEMORY[0x24BEE4300]();
}

uint64_t sub_22DFDE024()
{
  return MEMORY[0x24BEE4318]();
}

uint64_t sub_22DFDE030()
{
  return MEMORY[0x24BEE4328]();
}

uint64_t sub_22DFDE03C()
{
  return MEMORY[0x24BEE4358]();
}

uint64_t sub_22DFDE048()
{
  return MEMORY[0x24BEE43D0]();
}

uint64_t sub_22DFDE054()
{
  return MEMORY[0x24BEE43D8]();
}

uint64_t sub_22DFDE060()
{
  return MEMORY[0x24BEE4608]();
}

uint64_t sub_22DFDE06C()
{
  return MEMORY[0x24BEE4638]();
}

uint64_t sub_22DFDE078()
{
  return MEMORY[0x24BE18AE0]();
}

uint64_t sub_22DFDE084()
{
  return MEMORY[0x24BEE4A08]();
}

uint64_t sub_22DFDE090()
{
  return MEMORY[0x24BEE4A10]();
}

uint64_t sub_22DFDE09C()
{
  return MEMORY[0x24BEE4A98]();
}

uint64_t ACMobileShimCopyTicket()
{
  return MEMORY[0x24BED9F30]();
}

void CFNotificationCenterAddObserver(CFNotificationCenterRef center, const void *observer, CFNotificationCallback callBack, CFStringRef name, const void *object, CFNotificationSuspensionBehavior suspensionBehavior)
{
  MEMORY[0x24BDBC040](center, observer, callBack, name, object, suspensionBehavior);
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return (CFNotificationCenterRef)MEMORY[0x24BDBC050]();
}

void CFNotificationCenterPostNotification(CFNotificationCenterRef center, CFNotificationName name, const void *object, CFDictionaryRef userInfo, Boolean deliverImmediately)
{
  MEMORY[0x24BDBC070](center, name, object, userInfo, deliverImmediately);
}

void CFNotificationCenterRemoveObserver(CFNotificationCenterRef center, const void *observer, CFNotificationName name, const void *object)
{
  MEMORY[0x24BDBC088](center, observer, name, object);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x24BDBC298](cf);
}

SEL NSSelectorFromString(NSString *aSelectorName)
{
  return (SEL)MEMORY[0x24BDD1218](aSelectorName);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x24BDD1240](aClass);
}

OSStatus SecItemAdd(CFDictionaryRef attributes, CFTypeRef *result)
{
  return MEMORY[0x24BDE8A70](attributes, result);
}

OSStatus SecItemCopyMatching(CFDictionaryRef query, CFTypeRef *result)
{
  return MEMORY[0x24BDE8A78](query, result);
}

OSStatus SecItemDelete(CFDictionaryRef query)
{
  return MEMORY[0x24BDE8A80](query);
}

OSStatus SecItemUpdate(CFDictionaryRef query, CFDictionaryRef attributesToUpdate)
{
  return MEMORY[0x24BDE8A88](query, attributesToUpdate);
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x24BDAC720](aBlock);
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x24BDAC730](a1, *(_QWORD *)&a2);
}

void _Block_release(const void *aBlock)
{
  MEMORY[0x24BDAC738](aBlock);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x24BDAC780](exception_object);
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
  MEMORY[0x24BDAC7A0](a1, a2, *(_QWORD *)&a3, a4);
}

uint64_t _os_feature_enabled_impl()
{
  return MEMORY[0x24BDACB60]();
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB80](dso, log, type, format, buf, *(_QWORD *)&size);
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

void bzero(void *a1, size_t a2)
{
  MEMORY[0x24BDAD320](a1, a2);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADCC0](queue, block);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x24BDADE98](predicate, block);
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

uint32_t notify_cancel(int token)
{
  return MEMORY[0x24BDAF138](*(_QWORD *)&token);
}

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return MEMORY[0x24BDAF170](name, out_token, queue, handler);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x24BEDCF68](a1);
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x24BEDCF78](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x24BEDCF88]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x24BEDCFA8](a1);
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDCFD0](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x24BEDCFE8]();
}

void objc_copyWeak(id *to, id *from)
{
  MEMORY[0x24BEDD030](to, from);
}

void objc_destroyWeak(id *location)
{
  MEMORY[0x24BEDD038](location);
}

void objc_enumerationMutation(id obj)
{
  MEMORY[0x24BEDD068](obj);
}

void objc_exception_throw(id exception)
{
  MEMORY[0x24BEDD078](exception);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x24BEDD0C0](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x24BEDD0E8](location);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x24BEDD108](a1, a2);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x24BEDD120](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x24BEDD130]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x24BEDD138]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x24BEDD148]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x24BEDD160]();
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

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B0](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B8](a1);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x24BEDD408](self, _cmd, newValue, offset);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x24BEDD410](location, obj);
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x24BEDD420](location, obj);
}

int objc_sync_enter(id obj)
{
  return MEMORY[0x24BEDD438](obj);
}

int objc_sync_exit(id obj)
{
  return MEMORY[0x24BEDD440](obj);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x24BDAF368](subsystem, category);
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

uint64_t swift_asyncLet_begin()
{
  return MEMORY[0x24BEE7198]();
}

uint64_t swift_asyncLet_finish()
{
  return MEMORY[0x24BEE71A0]();
}

uint64_t swift_asyncLet_get_throwing()
{
  return MEMORY[0x24BEE71B0]();
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

uint64_t swift_conformsToProtocol2()
{
  return MEMORY[0x24BEE4BF0]();
}

uint64_t swift_continuation_await()
{
  return MEMORY[0x24BEE71B8]();
}

uint64_t swift_continuation_init()
{
  return MEMORY[0x24BEE71C0]();
}

uint64_t swift_continuation_throwingResume()
{
  return MEMORY[0x24BEE71D0]();
}

uint64_t swift_continuation_throwingResumeWithError()
{
  return MEMORY[0x24BEE71D8]();
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

uint64_t swift_defaultActor_deallocate()
{
  return MEMORY[0x24BEE71E0]();
}

uint64_t swift_defaultActor_destroy()
{
  return MEMORY[0x24BEE71E8]();
}

uint64_t swift_defaultActor_initialize()
{
  return MEMORY[0x24BEE71F0]();
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

uint64_t swift_dynamicCastObjCProtocolConditional()
{
  return MEMORY[0x24BEE4C70]();
}

uint64_t swift_dynamicCastUnknownClass()
{
  return MEMORY[0x24BEE4C88]();
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

uint64_t swift_getDynamicType()
{
  return MEMORY[0x24BEE4D00]();
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

uint64_t swift_getExtendedExistentialTypeMetadata()
{
  return MEMORY[0x24BEE4D30]();
}

uint64_t swift_getExtendedExistentialTypeMetadata_unique()
{
  return MEMORY[0x24BEE4D38]();
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

uint64_t swift_getMetatypeMetadata()
{
  return MEMORY[0x24BEE4D98]();
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

uint64_t swift_getTupleTypeLayout2()
{
  return MEMORY[0x24BEE4DE0]();
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

uint64_t swift_isClassType()
{
  return MEMORY[0x24BEE4E60]();
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

uint64_t swift_setAtWritableKeyPath()
{
  return MEMORY[0x24BEE4F28]();
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

uint64_t swift_stdlib_isStackAllocationSafe()
{
  return MEMORY[0x24BEE4F48]();
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

uint64_t swift_unknownObjectRelease_n()
{
  return MEMORY[0x24BEE4F78]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x24BEE4F80]();
}

uint64_t swift_unknownObjectRetain_n()
{
  return MEMORY[0x24BEE4F88]();
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

uint64_t swift_updateClassMetadata2()
{
  return MEMORY[0x24BEE5008]();
}

uint64_t swift_weakAssign()
{
  return MEMORY[0x24BEE5010]();
}

uint64_t swift_weakCopyAssign()
{
  return MEMORY[0x24BEE5018]();
}

uint64_t swift_weakCopyInit()
{
  return MEMORY[0x24BEE5020]();
}

uint64_t swift_weakDestroy()
{
  return MEMORY[0x24BEE5028]();
}

uint64_t swift_weakInit()
{
  return MEMORY[0x24BEE5030]();
}

uint64_t swift_weakLoadStrong()
{
  return MEMORY[0x24BEE5038]();
}

uint64_t swift_weakTakeAssign()
{
  return MEMORY[0x24BEE5040]();
}

uint64_t swift_weakTakeInit()
{
  return MEMORY[0x24BEE5048]();
}

uint64_t swift_willThrow()
{
  return MEMORY[0x24BEE5050]();
}

