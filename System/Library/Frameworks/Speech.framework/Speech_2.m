uint64_t sub_1B257B0E4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  _QWORD *v6;
  _QWORD *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  v6[21] = a5;
  v6[22] = a6;
  v6[19] = a3;
  v6[20] = a4;
  v6[18] = a2;
  v7 = *(_QWORD **)a4;
  v6[23] = *(_QWORD *)(*(_QWORD *)a4 + 104);
  v8 = v7[10];
  v6[24] = v8;
  swift_getAssociatedTypeWitness();
  v6[25] = v7[14];
  v9 = v7[11];
  v6[26] = v9;
  swift_getAssociatedTypeWitness();
  v6[27] = v7[15];
  v10 = v7[12];
  v6[28] = v10;
  swift_getAssociatedTypeWitness();
  sub_1B25CD108();
  swift_getTupleTypeMetadata3();
  sub_1B25CD108();
  v6[29] = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1ED36D060);
  v6[30] = sub_1B25CD6D8();
  v6[31] = swift_task_alloc();
  v11 = sub_1B25CD108();
  v6[32] = v11;
  v6[33] = *(_QWORD *)(v11 - 8);
  v6[34] = swift_task_alloc();
  v12 = *(_QWORD *)(v10 - 8);
  v6[35] = v12;
  v6[36] = *(_QWORD *)(v12 + 64);
  v6[37] = swift_task_alloc();
  v6[38] = swift_task_alloc();
  v13 = *(_QWORD *)(v9 - 8);
  v6[39] = v13;
  v6[40] = *(_QWORD *)(v13 + 64);
  v6[41] = swift_task_alloc();
  v14 = *(_QWORD *)(v8 - 8);
  v6[42] = v14;
  v6[43] = *(_QWORD *)(v14 + 64);
  v6[44] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EEFD71C0);
  v6[45] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_1B257B300()
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
  unint64_t v10;
  char *v11;
  unint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void (*v21)(uint64_t, uint64_t, uint64_t);
  unint64_t v22;
  unint64_t v23;
  _QWORD *v24;
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

  v2 = *(_QWORD *)(v0 + 352);
  v1 = *(_QWORD *)(v0 + 360);
  v27 = v2;
  v4 = *(_QWORD *)(v0 + 336);
  v3 = *(_QWORD *)(v0 + 344);
  v32 = *(_QWORD *)(v0 + 328);
  v33 = *(_QWORD *)(v0 + 320);
  v31 = *(_QWORD *)(v0 + 312);
  v35 = *(_QWORD *)(v0 + 264);
  v37 = *(_QWORD *)(v0 + 272);
  v39 = *(_QWORD *)(v0 + 256);
  v43 = *(_QWORD *)(v0 + 224);
  v5 = *(_QWORD *)(v0 + 208);
  v45 = *(_QWORD *)(v0 + 216);
  v6 = *(_QWORD *)(v0 + 192);
  v41 = *(_QWORD *)(v0 + 200);
  v7 = *(_QWORD *)(v0 + 184);
  v34 = *(_QWORD *)(v0 + 176);
  v30 = *(_QWORD *)(v0 + 168);
  v8 = *(_QWORD *)(v0 + 152);
  v29 = *(_QWORD *)(v0 + 160);
  v9 = sub_1B25CCCDC();
  __swift_storeEnumTagSinglePayload(v1, 1, 1, v9);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v4 + 16))(v2, v8, v6);
  v10 = (*(unsigned __int8 *)(v4 + 80) + 80) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  v11 = (char *)swift_allocObject();
  *((_QWORD *)v11 + 2) = 0;
  *((_QWORD *)v11 + 3) = 0;
  *((_QWORD *)v11 + 4) = v6;
  *((_QWORD *)v11 + 5) = v5;
  *((_QWORD *)v11 + 6) = v43;
  *((_QWORD *)v11 + 7) = v7;
  *((_QWORD *)v11 + 8) = v41;
  *((_QWORD *)v11 + 9) = v45;
  (*(void (**)(char *, uint64_t, uint64_t))(v4 + 32))(&v11[v10], v27, v6);
  *(_QWORD *)&v11[(v3 + v10 + 7) & 0xFFFFFFFFFFFFFFF8] = v29;
  OUTLINED_FUNCTION_109();
  OUTLINED_FUNCTION_85_7();
  sub_1B2550374(v1);
  v28 = v9;
  __swift_storeEnumTagSinglePayload(v1, 1, 1, v9);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v31 + 16))(v32, v30, v5);
  v12 = (*(unsigned __int8 *)(v31 + 80) + 80) & ~(unint64_t)*(unsigned __int8 *)(v31 + 80);
  v13 = (char *)swift_allocObject();
  *((_QWORD *)v13 + 2) = 0;
  *((_QWORD *)v13 + 3) = 0;
  *((_QWORD *)v13 + 4) = v6;
  *((_QWORD *)v13 + 5) = v5;
  *((_QWORD *)v13 + 6) = v43;
  *((_QWORD *)v13 + 7) = v7;
  *((_QWORD *)v13 + 8) = v41;
  *((_QWORD *)v13 + 9) = v45;
  (*(void (**)(char *, uint64_t, uint64_t))(v31 + 32))(&v13[v12], v32, v5);
  *(_QWORD *)&v13[(v33 + v12 + 7) & 0xFFFFFFFFFFFFFFF8] = v29;
  OUTLINED_FUNCTION_109();
  OUTLINED_FUNCTION_85_7();
  sub_1B2550374(v1);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v35 + 16))(v37, v34, v39);
  if (__swift_getEnumTagSinglePayload(v37, 1, v43) == 1)
  {
    (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 264) + 8))(*(_QWORD *)(v0 + 272), *(_QWORD *)(v0 + 256));
  }
  else
  {
    v14 = *(_QWORD *)(v0 + 360);
    v15 = *(_QWORD *)(v0 + 296);
    v16 = *(_QWORD *)(v0 + 304);
    v36 = v15;
    v18 = *(_QWORD *)(v0 + 280);
    v17 = *(_QWORD *)(v0 + 288);
    v19 = *(_QWORD *)(v0 + 224);
    v46 = *(_QWORD *)(v0 + 216);
    v42 = *(_QWORD *)(v0 + 208);
    v44 = *(_QWORD *)(v0 + 200);
    v38 = *(_QWORD *)(v0 + 192);
    v40 = *(_QWORD *)(v0 + 184);
    v20 = *(_QWORD *)(v0 + 160);
    v21 = *(void (**)(uint64_t, uint64_t, uint64_t))(v18 + 32);
    v21(v16, *(_QWORD *)(v0 + 272), v19);
    __swift_storeEnumTagSinglePayload(v14, 1, 1, v28);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v18 + 16))(v15, v16, v19);
    v22 = (*(unsigned __int8 *)(v18 + 80) + 80) & ~(unint64_t)*(unsigned __int8 *)(v18 + 80);
    v23 = (v17 + v22 + 7) & 0xFFFFFFFFFFFFFFF8;
    v24 = (_QWORD *)swift_allocObject();
    v24[2] = 0;
    v24[3] = 0;
    v24[4] = v38;
    v24[5] = v42;
    v24[6] = v19;
    v24[7] = v40;
    v24[8] = v44;
    v24[9] = v46;
    v21((uint64_t)v24 + v22, v36, v19);
    *(_QWORD *)((char *)v24 + v23) = v20;
    OUTLINED_FUNCTION_109();
    OUTLINED_FUNCTION_85_7();
    sub_1B2550374(v14);
    (*(void (**)(uint64_t, uint64_t))(v18 + 8))(v16, v19);
  }
  OUTLINED_FUNCTION_56_7();
  if ((sub_1B25CCD9C() & 1) != 0)
  {
    OUTLINED_FUNCTION_21_13();
    OUTLINED_FUNCTION_36();
    OUTLINED_FUNCTION_48();
    OUTLINED_FUNCTION_95();
    OUTLINED_FUNCTION_72();
    OUTLINED_FUNCTION_114();
    OUTLINED_FUNCTION_148();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
  else
  {
    v26 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 368) = v26;
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EEFD7220);
    *v26 = v0;
    v26[1] = sub_1B257B724;
    OUTLINED_FUNCTION_17();
    return sub_1B25CCD90();
  }
}

uint64_t sub_1B257B724()
{
  uint64_t v0;
  _QWORD *v1;
  _QWORD *v2;
  uint64_t v3;

  OUTLINED_FUNCTION_105();
  *v2 = *v1;
  *(_QWORD *)(v3 + 376) = v0;
  swift_task_dealloc();
  OUTLINED_FUNCTION_17();
  return OUTLINED_FUNCTION_8();
}

uint64_t sub_1B257B774()
{
  uint64_t v0;
  _QWORD *v2;

  OUTLINED_FUNCTION_56_7();
  if ((sub_1B25CCD9C() & 1) != 0)
  {
    OUTLINED_FUNCTION_21_13();
    OUTLINED_FUNCTION_36();
    OUTLINED_FUNCTION_48();
    OUTLINED_FUNCTION_95();
    OUTLINED_FUNCTION_72();
    OUTLINED_FUNCTION_114();
    OUTLINED_FUNCTION_148();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
  else
  {
    v2 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 368) = v2;
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EEFD7220);
    *v2 = v0;
    v2[1] = sub_1B257B724;
    OUTLINED_FUNCTION_17();
    return sub_1B25CCD90();
  }
}

void sub_1B257B84C()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;

  v1 = v0[47];
  v3 = v0[27];
  v2 = v0[28];
  v5 = v0[25];
  v4 = v0[26];
  v6 = v0[23];
  v7 = v0[24];
  v8 = (_QWORD *)swift_task_alloc();
  v8[2] = v7;
  v8[3] = v4;
  v8[4] = v2;
  v8[5] = v6;
  v8[6] = v5;
  v8[7] = v3;
  v8[8] = v1;
  v0[2] = v7;
  v0[3] = v4;
  v0[4] = v2;
  v0[5] = v6;
  v0[6] = v5;
  v0[7] = v3;
  OUTLINED_FUNCTION_32_14();
}

void sub_1B257BB24(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _QWORD *v5;
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  v5[37] = a4;
  v5[38] = a5;
  v6 = *(_QWORD **)a5;
  v14 = *(_QWORD *)(*(_QWORD *)a5 + 104);
  v5[39] = v14;
  v7 = v6[10];
  v5[40] = v7;
  v5[41] = swift_getAssociatedTypeWitness();
  v8 = v6[14];
  v5[42] = v8;
  v9 = v6[11];
  v5[43] = v9;
  swift_getAssociatedTypeWitness();
  v10 = v6[15];
  v5[44] = v10;
  v11 = v6[12];
  v5[45] = v11;
  swift_getAssociatedTypeWitness();
  sub_1B25CD108();
  v5[46] = swift_getTupleTypeMetadata3();
  sub_1B25CD108();
  v5[47] = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1ED36D060);
  v12 = sub_1B25CD6D8();
  v5[48] = v12;
  v5[49] = *(_QWORD *)(v12 - 8);
  v5[50] = swift_task_alloc();
  v13 = swift_task_alloc();
  v5[10] = v7;
  v5[51] = v13;
  v5[11] = v9;
  v5[12] = v11;
  v5[13] = v14;
  v5[14] = v8;
  v5[15] = v10;
  type metadata accessor for ZipStateMachine.ElementProducedAction();
}

uint64_t sub_1B257BC98(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t AssociatedTypeWitness;

  v2[52] = a1;
  v4 = sub_1B25CD108();
  v2[53] = v4;
  v2[54] = *(_QWORD *)(v4 - 8);
  v2[55] = swift_task_alloc();
  v2[56] = swift_task_alloc();
  v5 = sub_1B25CD108();
  v2[57] = v5;
  v2[58] = *(_QWORD *)(v5 - 8);
  v2[59] = swift_task_alloc();
  v2[60] = *(_QWORD *)(v3 - 8);
  v2[61] = swift_task_alloc();
  v2[62] = *(_QWORD *)(v1 - 8);
  v2[63] = swift_task_alloc();
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v2[64] = AssociatedTypeWitness;
  v2[65] = *(_QWORD *)(AssociatedTypeWitness - 8);
  v2[66] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_1B257BDAC()
{
  uint64_t v0;

  OUTLINED_FUNCTION_36_9(*(_QWORD *)(v0 + 496));
  OUTLINED_FUNCTION_35_13();
  OUTLINED_FUNCTION_17();
  return OUTLINED_FUNCTION_15_9();
}

void sub_1B257BDEC()
{
  OUTLINED_FUNCTION_48_8((uint64_t)sub_1B257BE2C);
  OUTLINED_FUNCTION_83_4();
}

uint64_t sub_1B257BE20()
{
  return OUTLINED_FUNCTION_22_8();
}

uint64_t sub_1B257BE2C()
{
  uint64_t v0;
  _QWORD *v2;

  OUTLINED_FUNCTION_19_9();
  if (v0)
  {
    swift_willThrow();
    OUTLINED_FUNCTION_17();
    return OUTLINED_FUNCTION_14_9();
  }
  else
  {
    swift_getAssociatedConformanceWitness();
    v2 = (_QWORD *)swift_task_alloc();
    OUTLINED_FUNCTION_18_12(v2);
    return OUTLINED_FUNCTION_13_10();
  }
}

uint64_t sub_1B257BEB0()
{
  OUTLINED_FUNCTION_12_13();
  OUTLINED_FUNCTION_17();
  return OUTLINED_FUNCTION_8();
}

#error "1B257BFD0: call analysis failed (funcsize=20)"

void sub_1B257C0C0(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, uint64_t a9@<X8>)
{
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
  uint64_t v21;
  uint64_t v22;
  char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t AssociatedTypeWitness;
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

  v30 = a5;
  v31 = a8;
  v25 = a4;
  v26 = a7;
  v24 = a6;
  v27 = a2;
  v34 = a9;
  v35 = a1;
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v10 = sub_1B25CD108();
  v32 = *(_QWORD *)(v10 - 8);
  v33 = v10;
  MEMORY[0x1E0C80A78](v10, v11);
  v13 = (char *)&v24 - v12;
  v14 = swift_getAssociatedTypeWitness();
  v29 = sub_1B25CD108();
  MEMORY[0x1E0C80A78](v29, v15);
  v17 = (char *)&v24 - v16;
  v18 = a3;
  v19 = swift_getAssociatedTypeWitness();
  v20 = sub_1B25CD108();
  MEMORY[0x1E0C80A78](v20, v21);
  v23 = (char *)&v24 - v22;
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v19 - 8) + 16))((char *)&v24 - v22, v27, v19);
  __swift_storeEnumTagSinglePayload((uint64_t)v23, 0, 1, v19);
  __swift_storeEnumTagSinglePayload((uint64_t)v17, 1, 1, v14);
  __swift_storeEnumTagSinglePayload((uint64_t)v13, 1, 1, AssociatedTypeWitness);
  v36 = v18;
  v37 = v25;
  v38 = v30;
  v39 = v24;
  v40 = v26;
  v41 = v31;
  type metadata accessor for ZipStateMachine();
}

void sub_1B257C298()
{
  sub_1B254040C();
}

uint64_t sub_1B257C2B0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  (*(void (**)(uint64_t, _QWORD))(*(_QWORD *)(v6 - 160) + 8))(v1, *(_QWORD *)(v6 - 152));
  (*(void (**)(uint64_t, _QWORD))(v0 + 8))(v3, *(_QWORD *)(v6 - 184));
  return (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 8))(v5, v4);
}

void sub_1B257C304(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _QWORD *v5;
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  v5[37] = a4;
  v5[38] = a5;
  v6 = *(_QWORD **)a5;
  v7 = *(_QWORD *)(*(_QWORD *)a5 + 104);
  v5[39] = v7;
  v8 = v6[10];
  v5[40] = v8;
  swift_getAssociatedTypeWitness();
  v14 = v6[14];
  v5[41] = v14;
  v9 = v6[11];
  v5[42] = v9;
  v5[43] = swift_getAssociatedTypeWitness();
  v10 = v6[15];
  v5[44] = v10;
  v11 = v6[12];
  v5[45] = v11;
  swift_getAssociatedTypeWitness();
  sub_1B25CD108();
  v5[46] = swift_getTupleTypeMetadata3();
  sub_1B25CD108();
  v5[47] = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1ED36D060);
  v12 = sub_1B25CD6D8();
  v5[48] = v12;
  v5[49] = *(_QWORD *)(v12 - 8);
  v5[50] = swift_task_alloc();
  v13 = swift_task_alloc();
  v5[10] = v8;
  v5[51] = v13;
  v5[11] = v9;
  v5[12] = v11;
  v5[13] = v7;
  v5[14] = v14;
  v5[15] = v10;
  type metadata accessor for ZipStateMachine.ElementProducedAction();
}

uint64_t sub_1B257C478(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t AssociatedTypeWitness;

  v3[52] = a1;
  v4 = sub_1B25CD108();
  v3[53] = v4;
  v3[54] = *(_QWORD *)(v4 - 8);
  v3[55] = swift_task_alloc();
  v3[56] = swift_task_alloc();
  v5 = sub_1B25CD108();
  v3[57] = v5;
  v3[58] = *(_QWORD *)(v5 - 8);
  v3[59] = swift_task_alloc();
  v3[60] = *(_QWORD *)(v1 - 8);
  v3[61] = swift_task_alloc();
  v3[62] = *(_QWORD *)(v2 - 8);
  v3[63] = swift_task_alloc();
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v3[64] = AssociatedTypeWitness;
  v3[65] = *(_QWORD *)(AssociatedTypeWitness - 8);
  v3[66] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_1B257C58C()
{
  uint64_t v0;

  OUTLINED_FUNCTION_36_9(*(_QWORD *)(v0 + 496));
  OUTLINED_FUNCTION_35_13();
  OUTLINED_FUNCTION_17();
  return OUTLINED_FUNCTION_15_9();
}

void sub_1B257C5CC()
{
  OUTLINED_FUNCTION_48_8((uint64_t)sub_1B257C60C);
  OUTLINED_FUNCTION_83_4();
}

uint64_t sub_1B257C600()
{
  return OUTLINED_FUNCTION_22_8();
}

uint64_t sub_1B257C60C()
{
  uint64_t v0;
  _QWORD *v2;

  OUTLINED_FUNCTION_19_9();
  if (v0)
  {
    swift_willThrow();
    OUTLINED_FUNCTION_17();
    return OUTLINED_FUNCTION_14_9();
  }
  else
  {
    swift_getAssociatedConformanceWitness();
    v2 = (_QWORD *)swift_task_alloc();
    OUTLINED_FUNCTION_18_12(v2);
    return OUTLINED_FUNCTION_13_10();
  }
}

uint64_t sub_1B257C690()
{
  OUTLINED_FUNCTION_12_13();
  OUTLINED_FUNCTION_17();
  return OUTLINED_FUNCTION_8();
}

uint64_t sub_1B257C6CC()
{
  uint64_t v0;
  uint64_t v1;

  OUTLINED_FUNCTION_249();
  OUTLINED_FUNCTION_61_10();
  OUTLINED_FUNCTION_216(v1);
  OUTLINED_FUNCTION_48();
  OUTLINED_FUNCTION_95();
  OUTLINED_FUNCTION_72();
  OUTLINED_FUNCTION_114();
  OUTLINED_FUNCTION_148();
  OUTLINED_FUNCTION_211();
  OUTLINED_FUNCTION_170();
  OUTLINED_FUNCTION_84_0();
  return OUTLINED_FUNCTION_36_1(*(uint64_t (**)(void))(v0 + 8));
}

#error "1B257C804: call analysis failed (funcsize=20)"

uint64_t sub_1B257C8F4()
{
  uint64_t v0;
  uint64_t v1;

  OUTLINED_FUNCTION_249();
  OUTLINED_FUNCTION_67_9();
  OUTLINED_FUNCTION_216(v1);
  OUTLINED_FUNCTION_48();
  OUTLINED_FUNCTION_95();
  OUTLINED_FUNCTION_72();
  OUTLINED_FUNCTION_114();
  OUTLINED_FUNCTION_148();
  OUTLINED_FUNCTION_211();
  OUTLINED_FUNCTION_170();
  OUTLINED_FUNCTION_84_0();
  return OUTLINED_FUNCTION_36_1(*(uint64_t (**)(void))(v0 + 8));
}

void sub_1B257C948(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, uint64_t a9@<X8>)
{
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
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t AssociatedTypeWitness;
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

  v29 = a5;
  v30 = a8;
  v24 = a4;
  v25 = a7;
  v23 = a6;
  v27 = a2;
  v33 = a9;
  v34 = a1;
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v10 = sub_1B25CD108();
  v31 = *(_QWORD *)(v10 - 8);
  v32 = v10;
  MEMORY[0x1E0C80A78](v10, v11);
  v13 = (char *)&v23 - v12;
  v14 = swift_getAssociatedTypeWitness();
  v28 = sub_1B25CD108();
  MEMORY[0x1E0C80A78](v28, v15);
  v17 = (char *)&v23 - v16;
  v18 = a3;
  v19 = swift_getAssociatedTypeWitness();
  v20 = sub_1B25CD108();
  MEMORY[0x1E0C80A78](v20, v21);
  __swift_storeEnumTagSinglePayload((uint64_t)&v23 - v22, 1, 1, v19);
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 16))(v17, v27, v14);
  __swift_storeEnumTagSinglePayload((uint64_t)v17, 0, 1, v14);
  __swift_storeEnumTagSinglePayload((uint64_t)v13, 1, 1, AssociatedTypeWitness);
  v35 = v18;
  v36 = v24;
  v37 = v29;
  v38 = v23;
  v39 = v25;
  v40 = v30;
  type metadata accessor for ZipStateMachine();
}

void sub_1B257CB20()
{
  sub_1B254040C();
}

uint64_t sub_1B257CB38()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  (*(void (**)(uint64_t, _QWORD))(*(_QWORD *)(v6 - 160) + 8))(v1, *(_QWORD *)(v6 - 152));
  (*(void (**)(uint64_t, _QWORD))(v0 + 8))(v3, *(_QWORD *)(v6 - 184));
  return (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 8))(v5, v4);
}

void sub_1B257CB8C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _QWORD *v5;
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  v5[37] = a4;
  v5[38] = a5;
  v6 = *(_QWORD **)a5;
  v7 = *(_QWORD *)(*(_QWORD *)a5 + 104);
  v5[39] = v7;
  v8 = v6[10];
  v5[40] = v8;
  swift_getAssociatedTypeWitness();
  v9 = v6[14];
  v5[41] = v9;
  v10 = v6[11];
  v5[42] = v10;
  swift_getAssociatedTypeWitness();
  v14 = v6[15];
  v5[43] = v14;
  v11 = v6[12];
  v5[44] = v11;
  v5[45] = swift_getAssociatedTypeWitness();
  v5[46] = sub_1B25CD108();
  v5[47] = swift_getTupleTypeMetadata3();
  sub_1B25CD108();
  v5[48] = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1ED36D060);
  v12 = sub_1B25CD6D8();
  v5[49] = v12;
  v5[50] = *(_QWORD *)(v12 - 8);
  v5[51] = swift_task_alloc();
  v13 = swift_task_alloc();
  v5[10] = v8;
  v5[52] = v13;
  v5[11] = v10;
  v5[12] = v11;
  v5[13] = v7;
  v5[14] = v9;
  v5[15] = v14;
  type metadata accessor for ZipStateMachine.ElementProducedAction();
}

uint64_t sub_1B257CD0C(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t AssociatedTypeWitness;

  v2[53] = a1;
  v5 = sub_1B25CD108();
  v2[54] = v5;
  v2[55] = *(_QWORD *)(v5 - 8);
  v2[56] = swift_task_alloc();
  v2[57] = swift_task_alloc();
  v2[58] = *(_QWORD *)(v4 - 8);
  v2[59] = swift_task_alloc();
  v2[60] = *(_QWORD *)(v3 - 8);
  v2[61] = swift_task_alloc();
  v2[62] = *(_QWORD *)(v1 - 8);
  v2[63] = swift_task_alloc();
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v2[64] = AssociatedTypeWitness;
  v2[65] = *(_QWORD *)(AssociatedTypeWitness - 8);
  v2[66] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_1B257CE10()
{
  uint64_t v0;

  OUTLINED_FUNCTION_36_9(*(_QWORD *)(v0 + 496));
  OUTLINED_FUNCTION_35_13();
  OUTLINED_FUNCTION_17();
  return OUTLINED_FUNCTION_15_9();
}

void sub_1B257CE50()
{
  OUTLINED_FUNCTION_48_8((uint64_t)sub_1B257CE90);
  OUTLINED_FUNCTION_83_4();
}

uint64_t sub_1B257CE84()
{
  return OUTLINED_FUNCTION_22_8();
}

uint64_t sub_1B257CE90()
{
  uint64_t v0;
  _QWORD *v2;

  OUTLINED_FUNCTION_19_9();
  if (v0)
  {
    swift_willThrow();
    OUTLINED_FUNCTION_17();
    return OUTLINED_FUNCTION_14_9();
  }
  else
  {
    swift_getAssociatedConformanceWitness();
    v2 = (_QWORD *)swift_task_alloc();
    OUTLINED_FUNCTION_18_12(v2);
    return OUTLINED_FUNCTION_13_10();
  }
}

uint64_t sub_1B257CF14()
{
  OUTLINED_FUNCTION_12_13();
  OUTLINED_FUNCTION_17();
  return OUTLINED_FUNCTION_8();
}

uint64_t sub_1B257CF50()
{
  uint64_t v0;
  uint64_t v1;

  OUTLINED_FUNCTION_249();
  OUTLINED_FUNCTION_61_10();
  OUTLINED_FUNCTION_216(v1);
  OUTLINED_FUNCTION_48();
  OUTLINED_FUNCTION_95();
  OUTLINED_FUNCTION_72();
  OUTLINED_FUNCTION_114();
  OUTLINED_FUNCTION_148();
  OUTLINED_FUNCTION_211();
  OUTLINED_FUNCTION_170();
  OUTLINED_FUNCTION_84_0();
  return OUTLINED_FUNCTION_36_1(*(uint64_t (**)(void))(v0 + 8));
}

#error "1B257D0C4: call analysis failed (funcsize=35)"

uint64_t sub_1B257D1DC()
{
  uint64_t v0;
  uint64_t v1;

  OUTLINED_FUNCTION_249();
  OUTLINED_FUNCTION_67_9();
  OUTLINED_FUNCTION_216(v1);
  OUTLINED_FUNCTION_48();
  OUTLINED_FUNCTION_95();
  OUTLINED_FUNCTION_72();
  OUTLINED_FUNCTION_114();
  OUTLINED_FUNCTION_148();
  OUTLINED_FUNCTION_211();
  OUTLINED_FUNCTION_170();
  OUTLINED_FUNCTION_84_0();
  return OUTLINED_FUNCTION_36_1(*(uint64_t (**)(void))(v0 + 8));
}

void sub_1B257D230()
{
  OUTLINED_FUNCTION_32_14();
}

void sub_1B257D28C()
{
  type metadata accessor for ZipStateMachine.ChildTaskSuspendedAction();
}

void sub_1B257D2A8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19)
{
  void (*v19)(uint64_t);
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t *v26;

  v22 = OUTLINED_FUNCTION_17_13();
  OUTLINED_FUNCTION_81_5(v19, (uint64_t)&a9, v20, v21, v22);
  v23 = a18;
  v24 = a19;
  if ((~a18 & 0xF00000000000000FLL) != 0 || (a19 & 0xF000000000000007) != 0xF000000000000007)
  {
    if (a19 < 0)
    {
      v25 = a19 & 0x7FFFFFFFFFFFFFFFLL;
      __swift_instantiateConcreteTypeFromMangledName(&qword_1ED36D060);
      OUTLINED_FUNCTION_172();
      *v26 = v25;
      OUTLINED_FUNCTION_57_6();
    }
    else
    {
      swift_continuation_throwingResume();
      sub_1B257DD50(v23, v24);
    }
  }
  OUTLINED_FUNCTION_42_13();
}

void sub_1B257D338()
{
  OUTLINED_FUNCTION_82_8();
}

void sub_1B257D374()
{
  sub_1B253FBF8();
}

uint64_t sub_1B257D388(uint64_t result, uint64_t a2)
{
  _QWORD *v2;

  *v2 = result;
  v2[1] = a2;
  return result;
}

void sub_1B257D3A8(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, uint64_t a9@<X8>)
{
  uint64_t AssociatedTypeWitness;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
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
  uint64_t v41;
  uint64_t v42;

  v31 = a5;
  v32 = a8;
  v26 = a4;
  v27 = a7;
  v25 = a6;
  v30 = a2;
  v35 = a9;
  v36 = a1;
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v11 = sub_1B25CD108();
  v33 = *(_QWORD *)(v11 - 8);
  v34 = v11;
  MEMORY[0x1E0C80A78](v11, v12);
  v14 = (char *)&v25 - v13;
  v15 = swift_getAssociatedTypeWitness();
  v16 = sub_1B25CD108();
  v28 = *(_QWORD *)(v16 - 8);
  v29 = v16;
  MEMORY[0x1E0C80A78](v16, v17);
  v19 = (char *)&v25 - v18;
  v20 = a3;
  v21 = swift_getAssociatedTypeWitness();
  v22 = sub_1B25CD108();
  MEMORY[0x1E0C80A78](v22, v23);
  __swift_storeEnumTagSinglePayload((uint64_t)&v25 - v24, 1, 1, v21);
  __swift_storeEnumTagSinglePayload((uint64_t)v19, 1, 1, v15);
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(AssociatedTypeWitness - 8) + 16))(v14, v30, AssociatedTypeWitness);
  __swift_storeEnumTagSinglePayload((uint64_t)v14, 0, 1, AssociatedTypeWitness);
  v37 = v20;
  v38 = v26;
  v39 = v31;
  v40 = v25;
  v41 = v27;
  v42 = v32;
  type metadata accessor for ZipStateMachine();
}

void sub_1B257D580()
{
  sub_1B254040C();
}

uint64_t sub_1B257D598()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  (*(void (**)(uint64_t, _QWORD))(*(_QWORD *)(v5 - 160) + 8))(v0, *(_QWORD *)(v5 - 152));
  (*(void (**)(uint64_t, _QWORD))(*(_QWORD *)(v5 - 200) + 8))(v2, *(_QWORD *)(v5 - 192));
  return (*(uint64_t (**)(uint64_t, uint64_t))(v1 + 8))(v4, v3);
}

void sub_1B257D5EC()
{
  OUTLINED_FUNCTION_82_8();
}

uint64_t sub_1B257D620()
{
  uint64_t (*v0)(void);
  uint64_t *v1;
  uint64_t result;
  uint64_t v3;
  uint64_t v4;

  result = v0();
  *v1 = result;
  v1[1] = v3;
  v1[2] = v4;
  return result;
}

void sub_1B257D644()
{
  type metadata accessor for ZipStateMachine();
}

void sub_1B257D680()
{
  sub_1B2541DCC();
}

uint64_t sub_1B257D690(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v4;

  *v4 = result;
  v4[1] = a2;
  v4[2] = a3;
  v4[3] = a4;
  return result;
}

uint64_t sub_1B257D6B0()
{
  uint64_t v0;

  swift_release();
  return v0;
}

uint64_t sub_1B257D6CC()
{
  sub_1B257D6B0();
  return swift_deallocClassInstance();
}

void type metadata accessor for ZipStorage()
{
  JUMPOUT(0x1B5E26140);
}

void sub_1B257D6F8()
{
  sub_1B2579EDC();
}

uint64_t sub_1B257D718(uint64_t result)
{
  if (result)
  {
    swift_release();
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_1B257D744(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  _QWORD *v5;

  v4 = swift_task_alloc();
  v5 = (_QWORD *)OUTLINED_FUNCTION_42_4(v4);
  *v5 = v2;
  v5[1] = sub_1B24DE4C4;
  return sub_1B2579F34(a1, v1);
}

void sub_1B257D794()
{
  sub_1B257ABE8();
}

void sub_1B257D79C()
{
  sub_1B257DCC8();
}

uint64_t sub_1B257D7B8(uint64_t result)
{
  if ((~result & 0xF000000000000007) != 0)
    return sub_1B2546F6C();
  return result;
}

void sub_1B257D7CC(uint64_t a1)
{
  uint64_t v1;

  sub_1B257A18C(a1, v1);
}

void sub_1B257D7D4(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;

  sub_1B257A4E4(a1, *(_QWORD *)(v2 + 16), *(_QWORD *)(v2 + 24), a2);
}

uint64_t sub_1B257D7EC()
{
  char *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v11;

  v1 = *((_QWORD *)v0 + 4);
  v11 = *((_QWORD *)v0 + 5);
  v2 = *((_QWORD *)v0 + 6);
  v3 = *(_QWORD *)(v1 - 8);
  v4 = (*(unsigned __int8 *)(v3 + 80) + 80) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  v5 = *(_QWORD *)(v11 - 8);
  v6 = (*(unsigned __int8 *)(v5 + 80) + ((*(_QWORD *)(v3 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8) + 8) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  v7 = *(_QWORD *)(v5 + 64);
  v8 = *(_QWORD *)(sub_1B25CD108() - 8);
  v9 = (v6 + v7 + *(unsigned __int8 *)(v8 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80);
  swift_unknownObjectRelease();
  (*(void (**)(char *, uint64_t))(v3 + 8))(&v0[v4], v1);
  swift_release();
  (*(void (**)(char *, uint64_t))(v5 + 8))(&v0[v6], v11);
  if (!__swift_getEnumTagSinglePayload((uint64_t)&v0[v9], 1, v2))
    (*(void (**)(char *, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(&v0[v9], v2);
  return swift_deallocObject();
}

uint64_t sub_1B257D918(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  _QWORD *v19;

  v4 = *(_QWORD *)(v1[4] - 8);
  v5 = (*(unsigned __int8 *)(v4 + 80) + 80) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  v6 = (*(_QWORD *)(v4 + 64) + v5 + 7) & 0xFFFFFFFFFFFFFFF8;
  v7 = *(_QWORD *)(v1[5] - 8);
  v8 = (*(unsigned __int8 *)(v7 + 80) + v6 + 8) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
  v9 = *(_QWORD *)(v7 + 64);
  v10 = *(unsigned __int8 *)(*(_QWORD *)(sub_1B25CD108() - 8) + 80);
  v11 = v8 + v9 + v10;
  v12 = v1[2];
  v13 = v1[3];
  v14 = (uint64_t)v1 + v5;
  v15 = *(_QWORD *)((char *)v1 + v6);
  v16 = (uint64_t)v1 + v8;
  v17 = (uint64_t)v1 + (v11 & ~v10);
  v18 = swift_task_alloc();
  v19 = (_QWORD *)OUTLINED_FUNCTION_42_4(v18);
  *v19 = v2;
  v19[1] = sub_1B24DE4C4;
  return sub_1B257AFFC(a1, v12, v13, v14, v15, v16, v17);
}

uint64_t sub_1B257DA04(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;

  v6 = v2[2];
  v7 = v2[3];
  v9 = v2[4];
  v8 = v2[5];
  v10 = swift_task_alloc();
  v11 = (_QWORD *)OUTLINED_FUNCTION_42_4(v10);
  *v11 = v3;
  v11[1] = sub_1B24EBFF4;
  return sub_1B257B0E4(a1, a2, v6, v7, v9, v8);
}

uint64_t sub_1B257DA80()
{
  OUTLINED_FUNCTION_2_12();
  OUTLINED_FUNCTION_43_8();
  OUTLINED_FUNCTION_77_8();
  OUTLINED_FUNCTION_75_11();
  return OUTLINED_FUNCTION_10_16();
}

void sub_1B257DAB4()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v0 = swift_task_alloc();
  v1 = (_QWORD *)OUTLINED_FUNCTION_42_4(v0);
  v2 = OUTLINED_FUNCTION_16_8(v1);
  sub_1B257BB24(v2, v3, v4, v5, v6);
}

uint64_t sub_1B257DB38()
{
  OUTLINED_FUNCTION_2_12();
  OUTLINED_FUNCTION_43_8();
  OUTLINED_FUNCTION_77_8();
  OUTLINED_FUNCTION_75_11();
  return OUTLINED_FUNCTION_10_16();
}

void sub_1B257DB6C()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  OUTLINED_FUNCTION_31_7();
  v0 = swift_task_alloc();
  v1 = (_QWORD *)OUTLINED_FUNCTION_42_4(v0);
  v2 = OUTLINED_FUNCTION_16_8(v1);
  sub_1B257C304(v2, v3, v4, v5, v6);
}

void sub_1B257DBC8()
{
  OUTLINED_FUNCTION_89_7();
  sub_1B257D644();
}

uint64_t sub_1B257DBE0(uint64_t result, id a2)
{
  if (result)
  {

    swift_bridgeObjectRelease();
    return swift_release();
  }
  return result;
}

uint64_t sub_1B257DC1C()
{
  OUTLINED_FUNCTION_2_12();
  OUTLINED_FUNCTION_43_8();
  OUTLINED_FUNCTION_77_8();
  OUTLINED_FUNCTION_75_11();
  return OUTLINED_FUNCTION_10_16();
}

void sub_1B257DC50()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  OUTLINED_FUNCTION_31_7();
  v0 = swift_task_alloc();
  v1 = (_QWORD *)OUTLINED_FUNCTION_42_4(v0);
  v2 = OUTLINED_FUNCTION_16_8(v1);
  sub_1B257CB8C(v2, v3, v4, v5, v6);
}

void sub_1B257DCAC()
{
  sub_1B257DCC8();
}

void sub_1B257DCC8()
{
  sub_1B257D5EC();
}

uint64_t sub_1B257DCEC(uint64_t result)
{
  if (result)
  {
    swift_release();
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_1B257DD1C()
{
  return sub_1B257DDF8();
}

void sub_1B257DD38()
{
  sub_1B257DDA8();
}

void sub_1B257DD50(uint64_t a1, uint64_t a2)
{
  if ((~a1 & 0xF00000000000000FLL) != 0 || (a2 & 0xF000000000000007) != 0xF000000000000007)
    sub_1B2543568(a1, a2);
}

uint64_t sub_1B257DD74()
{
  return sub_1B257DDF8();
}

void sub_1B257DD90()
{
  sub_1B257DDA8();
}

void sub_1B257DDA8()
{
  sub_1B257D338();
}

uint64_t sub_1B257DDDC()
{
  return sub_1B257DDF8();
}

uint64_t sub_1B257DDF8()
{
  uint64_t (*v0)(void);

  OUTLINED_FUNCTION_89_7();
  return v0();
}

void sub_1B257DE14()
{
  sub_1B257DDA8();
}

uint64_t OUTLINED_FUNCTION_2_12()
{
  return swift_unknownObjectRelease();
}

void OUTLINED_FUNCTION_3_15(_QWORD *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  uint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  a1[2] = v14;
  a1[3] = v11;
  a1[4] = v10;
  a1[5] = v15;
  a1[6] = v13;
  a1[7] = v16;
  a1[8] = a10;
  v12[28] = v14;
  v12[29] = v11;
  v12[30] = v10;
  v12[31] = v15;
  v12[32] = v13;
  v12[33] = v16;
  type metadata accessor for ZipStateMachine();
}

void OUTLINED_FUNCTION_5_14(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  a1[2] = v2;
  a1[3] = v7;
  a1[4] = v5;
  a1[5] = v4;
  a1[6] = v1;
  a1[7] = v6;
  v3[16] = v2;
  v3[17] = v7;
  v3[18] = v5;
  v3[19] = v4;
  v3[20] = v1;
  v3[21] = v6;
  type metadata accessor for ZipStateMachine();
}

uint64_t OUTLINED_FUNCTION_6_15()
{
  return swift_task_switch();
}

void OUTLINED_FUNCTION_7_12()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v2[22] = v1;
  v2[23] = v6;
  v2[24] = v4;
  v2[25] = v3;
  v2[26] = v0;
  v2[27] = v5;
  type metadata accessor for ZipStateMachine.UpstreamFinishedAction();
}

uint64_t OUTLINED_FUNCTION_10_16()
{
  return swift_deallocObject();
}

uint64_t OUTLINED_FUNCTION_11_12()
{
  uint64_t v0;
  uint64_t v1;

  __swift_storeEnumTagSinglePayload(v0, 1, 1, v1);
  return swift_storeEnumTagMultiPayload();
}

uint64_t OUTLINED_FUNCTION_12_13()
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
  *(_QWORD *)(v3 + 552) = v0;
  return swift_task_dealloc();
}

uint64_t OUTLINED_FUNCTION_13_10()
{
  return sub_1B25CCC7C();
}

uint64_t OUTLINED_FUNCTION_14_9()
{
  return swift_task_switch();
}

uint64_t OUTLINED_FUNCTION_15_9()
{
  return swift_task_switch();
}

void OUTLINED_FUNCTION_16_12(void (*a1)(uint64_t), uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12)
{
  uint64_t v12;
  uint64_t v13;

  sub_1B250B2AC(a1, v13, v12, a4, a12);
}

uint64_t OUTLINED_FUNCTION_17_13()
{
  return sub_1B25CD108();
}

uint64_t OUTLINED_FUNCTION_18_12(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  *(_QWORD *)(v3 + 544) = a1;
  *a1 = v2;
  a1[1] = v1;
  return *(_QWORD *)(v3 + 472);
}

void OUTLINED_FUNCTION_19_9()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t *v3;

  v2 = *v0;
  v3 = (uint64_t *)(v1 - 8);
  *v3 = *v0;
  *v3 = *v0;
  *(_QWORD *)(v2 + 536) = *(_QWORD *)(v2 + 48);
}

uint64_t OUTLINED_FUNCTION_21_13()
{
  return swift_task_dealloc();
}

uint64_t OUTLINED_FUNCTION_22_8()
{
  return swift_continuation_await();
}

uint64_t OUTLINED_FUNCTION_23_15(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v1 + 32))(v3, v2 + *(int *)(a1 + 48), v4);
}

uint64_t OUTLINED_FUNCTION_24_15(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15)
{
  uint64_t v15;
  uint64_t v16;

  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(a14 + 16))(a15, v15, v16);
}

uint64_t OUTLINED_FUNCTION_25_15@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v3;

  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(a2 + 32))(a1, v2, v3);
}

uint64_t OUTLINED_FUNCTION_26_13()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + 488);
}

uint64_t OUTLINED_FUNCTION_29_15()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return sub_1B257AABC(v0, v2, v1);
}

void OUTLINED_FUNCTION_32_14()
{
  type metadata accessor for ZipStateMachine();
}

uint64_t OUTLINED_FUNCTION_34_9(uint64_t a1, _QWORD *a2)
{
  uint64_t v2;

  *a2 = v2;
  return swift_continuation_throwingResumeWithError();
}

uint64_t OUTLINED_FUNCTION_35_13()
{
  return sub_1B25CCDB4();
}

uint64_t OUTLINED_FUNCTION_36_9@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t))(a1 + 16))(v1, *(_QWORD *)(v3 + 296), v2);
}

void OUTLINED_FUNCTION_37_9(void (*a1)(uint64_t), uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15)
{
  uint64_t v15;

  sub_1B250B2AC(a1, v15, a15, a14, a5);
}

uint64_t OUTLINED_FUNCTION_38_10@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return (*(uint64_t (**)(uint64_t))(a1 + 8))(v1);
}

uint64_t OUTLINED_FUNCTION_43_8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  return (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 8))(v1 + v3, v0);
}

uint64_t OUTLINED_FUNCTION_44_10()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(v0 + 8))(v1, v2);
}

uint64_t OUTLINED_FUNCTION_46_7()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return sub_1B257AABC(v1, v0, v2);
}

uint64_t OUTLINED_FUNCTION_48_8@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  *(_QWORD *)(v1 + 16) = v1;
  *(_QWORD *)(v1 + 24) = a1;
  return swift_continuation_init();
}

uint64_t OUTLINED_FUNCTION_49_10()
{
  return swift_getAssociatedTypeWitness();
}

uint64_t OUTLINED_FUNCTION_50_10()
{
  return swift_getTupleTypeMetadata2();
}

uint64_t OUTLINED_FUNCTION_52_11()
{
  return swift_retain();
}

uint64_t OUTLINED_FUNCTION_53_10()
{
  uint64_t v0;

  return sub_1B257DCEC(v0);
}

uint64_t OUTLINED_FUNCTION_55_10()
{
  return swift_task_alloc();
}

uint64_t OUTLINED_FUNCTION_56_7()
{
  uint64_t v0;

  return **(_QWORD **)(v0 + 144);
}

uint64_t OUTLINED_FUNCTION_57_6()
{
  return swift_continuation_throwingResumeWithError();
}

uint64_t OUTLINED_FUNCTION_58_9()
{
  uint64_t v0;
  uint64_t v1;

  return __swift_getEnumTagSinglePayload(v0, 1, v1);
}

uint64_t OUTLINED_FUNCTION_62_9()
{
  return sub_1B25CC8E0();
}

uint64_t OUTLINED_FUNCTION_63_9()
{
  return swift_task_alloc();
}

uint64_t OUTLINED_FUNCTION_64_11()
{
  return sub_1B25CCD84();
}

uint64_t OUTLINED_FUNCTION_65_8()
{
  return sub_1B25CCC70();
}

uint64_t OUTLINED_FUNCTION_72_9()
{
  uint64_t v0;

  return v0;
}

uint64_t OUTLINED_FUNCTION_73_8()
{
  uint64_t v0;

  return v0;
}

uint64_t OUTLINED_FUNCTION_75_11()
{
  uint64_t v0;

  return v0;
}

uint64_t OUTLINED_FUNCTION_76_8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16)
{
  uint64_t v16;

  return __swift_getEnumTagSinglePayload(v16, 1, a16);
}

uint64_t OUTLINED_FUNCTION_77_8()
{
  return swift_release();
}

void OUTLINED_FUNCTION_81_5(void (*a1)(uint64_t), uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  sub_1B250B2AC(a1, a2, a3, a4, a5);
}

void OUTLINED_FUNCTION_82_8()
{
  type metadata accessor for ZipStateMachine();
}

void OUTLINED_FUNCTION_83_4()
{
  sub_1B257D230();
}

void OUTLINED_FUNCTION_85_7()
{
  sub_1B24DD62C();
}

uint64_t OUTLINED_FUNCTION_86_5()
{
  return sub_1B25CCD3C();
}

unint64_t OUTLINED_FUNCTION_88_5()
{
  return sub_1B2518554();
}

uint64_t sub_1B257E398(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t result;
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
  unint64_t v16;
  uint64_t v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;

  v1 = *(_QWORD *)(a1 + 16);
  v2 = MEMORY[0x1E0DEE9D8];
  if (!v1)
    return MEMORY[0x1E0DEE9D8];
  v24 = MEMORY[0x1E0DEE9D8];
  sub_1B2505328();
  v4 = 0;
  result = v24;
  v20 = v1;
  v21 = a1 + 32;
  do
  {
    v23 = result;
    v6 = *(_QWORD *)(v21 + 8 * v4);
    v7 = *(_QWORD *)(v6 + 16);
    if (v7)
    {
      v22 = v4;
      swift_bridgeObjectRetain();
      sub_1B2505328();
      v8 = v2;
      v9 = *(_QWORD *)(type metadata accessor for CommandRecognizer.Interpretation(0) - 8);
      v10 = v6 + ((*(unsigned __int8 *)(v9 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80));
      v11 = *(_QWORD *)(v9 + 72);
      do
      {
        CommandRecognizer.Interpretation.description.getter();
        v13 = v12;
        v15 = v14;
        v16 = *(_QWORD *)(v8 + 16);
        if (v16 >= *(_QWORD *)(v8 + 24) >> 1)
          sub_1B2505328();
        *(_QWORD *)(v8 + 16) = v16 + 1;
        v17 = v8 + 16 * v16;
        *(_QWORD *)(v17 + 32) = v13;
        *(_QWORD *)(v17 + 40) = v15;
        v10 += v11;
        --v7;
      }
      while (v7);
      v2 = MEMORY[0x1E0DEE9D8];
      v1 = v20;
      v4 = v22;
    }
    else
    {
      swift_bridgeObjectRetain();
    }
    __swift_instantiateConcreteTypeFromMangledName(&qword_1ED36CFD0);
    sub_1B24EBFA4(&qword_1EEFD7158, &qword_1ED36CFD0);
    sub_1B25CC940();
    swift_bridgeObjectRelease();
    sub_1B25CCAE4();
    swift_bridgeObjectRelease();
    sub_1B25CCAE4();
    swift_bridgeObjectRelease();
    result = v23;
    v18 = *(_QWORD *)(v23 + 16);
    if (v18 >= *(_QWORD *)(v23 + 24) >> 1)
    {
      sub_1B2505328();
      result = v23;
    }
    ++v4;
    *(_QWORD *)(result + 16) = v18 + 1;
    v19 = result + 16 * v18;
    *(_QWORD *)(v19 + 32) = 2683;
    *(_QWORD *)(v19 + 40) = 0xE200000000000000;
  }
  while (v4 != v1);
  return result;
}

uint64_t sub_1B257E5F4(uint64_t a1)
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
  unint64_t v11;
  uint64_t v12;
  uint64_t v14;

  v1 = *(_QWORD *)(a1 + 16);
  v2 = MEMORY[0x1E0DEE9D8];
  if (v1)
  {
    v14 = MEMORY[0x1E0DEE9D8];
    sub_1B2505328();
    v2 = v14;
    v4 = *(_QWORD *)(type metadata accessor for CommandRecognizer.Argument(0) - 8);
    v5 = a1 + ((*(unsigned __int8 *)(v4 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80));
    v6 = *(_QWORD *)(v4 + 72);
    do
    {
      CommandRecognizer.Argument.description.getter();
      v8 = v7;
      v10 = v9;
      v11 = *(_QWORD *)(v14 + 16);
      if (v11 >= *(_QWORD *)(v14 + 24) >> 1)
        sub_1B2505328();
      *(_QWORD *)(v14 + 16) = v11 + 1;
      v12 = v14 + 16 * v11;
      *(_QWORD *)(v12 + 32) = v8;
      *(_QWORD *)(v12 + 40) = v10;
      v5 += v6;
      --v1;
    }
    while (v1);
  }
  return v2;
}

void sub_1B257E6F0(unint64_t a1, uint64_t *a2)
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
  id v13;
  void *v14;
  unint64_t v15;
  unint64_t v16;
  uint64_t v17;
  unint64_t v18;
  uint64_t *v19;
  id v20;
  uint64_t v21;

  v3 = v2;
  v19 = a2;
  v5 = type metadata accessor for CommandRecognizer.Argument(0);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x1E0C80A78](v5, v7);
  v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a1 >> 62)
    goto LABEL_18;
  v10 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
  while (v10)
  {
    v21 = MEMORY[0x1E0DEE9D8];
    sub_1B25057B4(0, v10 & ~(v10 >> 63), 0);
    if (v10 < 0)
    {
      __break(1u);
      return;
    }
    v11 = 0;
    v12 = v21;
    v18 = a1 & 0xC000000000000001;
    while (v10 != v11)
    {
      if (v18)
        v13 = (id)MEMORY[0x1B5E252C4](v11, a1);
      else
        v13 = *(id *)(a1 + 8 * v11 + 32);
      v14 = v13;
      v20 = v13;
      sub_1B25827B8(&v20, v19, (uint64_t)v9);
      if (v3)
      {
        swift_release();

        return;
      }
      v3 = 0;

      v21 = v12;
      v16 = *(_QWORD *)(v12 + 16);
      v15 = *(_QWORD *)(v12 + 24);
      if (v16 >= v15 >> 1)
      {
        sub_1B25057B4(v15 > 1, v16 + 1, 1);
        v12 = v21;
      }
      ++v11;
      *(_QWORD *)(v12 + 16) = v16 + 1;
      sub_1B2584E14((uint64_t)v9, v12+ ((*(unsigned __int8 *)(v6 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80))+ *(_QWORD *)(v6 + 72) * v16, type metadata accessor for CommandRecognizer.Argument);
      if (v10 == v11)
        return;
    }
    __break(1u);
LABEL_18:
    swift_bridgeObjectRetain();
    v10 = sub_1B25CD474();
    swift_bridgeObjectRelease();
  }
}

void sub_1B257E8C8(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;

  v3 = v1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EEFD71C0);
  OUTLINED_FUNCTION_30_0();
  MEMORY[0x1E0C80A78](v5, v6);
  OUTLINED_FUNCTION_42_3();
  v7 = swift_retain();
  sub_1B259EF18(v7);
  v8 = sub_1B25CCCDC();
  __swift_storeEnumTagSinglePayload(v2, 1, 1, v8);
  v9 = (_QWORD *)OUTLINED_FUNCTION_8_4();
  v9[2] = 0;
  v9[3] = 0;
  v9[4] = a1;
  v9[5] = v3;
  swift_retain();
  sub_1B24C52C0(v2, (uint64_t)&unk_1EEFDAE08, (uint64_t)v9);
  swift_release();
  OUTLINED_FUNCTION_262();
}

void sub_1B257E97C()
{
  sub_1B257E9B8();
}

void sub_1B257E990()
{
  sub_1B257E9B8();
}

void sub_1B257E9A4()
{
  sub_1B257E9B8();
}

void sub_1B257E9B8()
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
  uint64_t v18;
  uint64_t v19;
  _QWORD *v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  uint64_t v24;
  uint64_t v25;
  unint64_t v26;
  unint64_t v27;
  int64_t v28;
  unint64_t v29;
  int64_t v30;
  char v31;
  char v32;
  uint64_t v33;
  int64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  unint64_t v48;
  _QWORD v49[2];
  int64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t *v60;
  uint64_t *v61;
  uint64_t v62;
  int64_t v63;
  uint64_t v64;

  OUTLINED_FUNCTION_59_0();
  v61 = v0;
  v2 = v1;
  v4 = v3;
  v59 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEFD7688);
  OUTLINED_FUNCTION_30_0();
  MEMORY[0x1E0C80A78](v5, v6);
  OUTLINED_FUNCTION_767();
  v58 = v7;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EEFD76E8);
  OUTLINED_FUNCTION_30_0();
  MEMORY[0x1E0C80A78](v8, v9);
  OUTLINED_FUNCTION_767();
  v57 = v10;
  v11 = OUTLINED_FUNCTION_32_4();
  v56 = *(_QWORD *)(v11 - 8);
  MEMORY[0x1E0C80A78](v11, v12);
  OUTLINED_FUNCTION_767();
  v55 = v13;
  v60 = v2;
  v54 = __swift_instantiateConcreteTypeFromMangledName(v2);
  OUTLINED_FUNCTION_30_0();
  MEMORY[0x1E0C80A78](v14, v15);
  OUTLINED_FUNCTION_29_7();
  v53 = v16;
  MEMORY[0x1E0C80A78](v17, v18);
  v52 = (uint64_t)v49 - v19;
  v62 = v4;
  if (*(_QWORD *)(v4 + 16))
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EEFD7740);
    v20 = (_QWORD *)sub_1B25CD498();
  }
  else
  {
    v20 = (_QWORD *)MEMORY[0x1E0DEE9E0];
  }
  v51 = v62 + 64;
  OUTLINED_FUNCTION_38_11();
  v23 = v22 & v21;
  v49[1] = v24;
  v50 = (unint64_t)(63 - v24) >> 6;
  swift_bridgeObjectRetain();
  swift_retain();
  v63 = 0;
  v25 = v58;
  if (!v23)
    goto LABEL_6;
LABEL_5:
  v26 = __clz(__rbit64(v23));
  v23 &= v23 - 1;
  v27 = v26 | (v63 << 6);
  while (1)
  {
    v36 = v62;
    v37 = *(_QWORD *)(v56 + 72);
    v38 = v52;
    sub_1B254E940(*(_QWORD *)(v62 + 48) + v37 * v27, v52);
    v39 = *(_QWORD *)(*(_QWORD *)(v36 + 56) + 8 * v27);
    v40 = v54;
    *(_QWORD *)(v38 + *(int *)(v54 + 48)) = v39;
    v41 = v38;
    v42 = v53;
    sub_1B2584E40(v41, v53, v60);
    v43 = *(int *)(v40 + 48);
    v44 = (uint64_t *)(v25 + *(int *)(v59 + 48));
    OUTLINED_FUNCTION_60_5(v42, v25);
    v64 = *(_QWORD *)(v42 + v43);
    OUTLINED_FUNCTION_47_0();
    __swift_instantiateConcreteTypeFromMangledName(v61);
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EEFD7130);
    OUTLINED_FUNCTION_53();
    v45 = v57;
    OUTLINED_FUNCTION_60_5(v25, v57);
    v46 = *v44;
    v47 = v55;
    OUTLINED_FUNCTION_60_5(v45, v55);
    sub_1B25CD6A8();
    sub_1B255F958((uint64_t)&v64);
    sub_1B25CD6CC();
    v48 = sub_1B25CD1C8();
    *(_QWORD *)((char *)v20 + ((v48 >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << v48;
    OUTLINED_FUNCTION_60_5(v47, v20[6] + v48 * v37);
    *(_QWORD *)(v20[7] + 8 * v48) = v46;
    ++v20[2];
    if (v23)
      goto LABEL_5;
LABEL_6:
    v28 = v63 + 1;
    if (__OFADD__(v63, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v28 >= v50)
      goto LABEL_28;
    v29 = *(_QWORD *)(v51 + 8 * v28);
    v30 = v63 + 1;
    if (!v29)
    {
      OUTLINED_FUNCTION_36_10();
      if (v31 == v32)
        goto LABEL_28;
      OUTLINED_FUNCTION_30_11();
      if (!v29)
      {
        OUTLINED_FUNCTION_36_10();
        if (v31 == v32)
          goto LABEL_28;
        OUTLINED_FUNCTION_30_11();
        if (!v29)
        {
          OUTLINED_FUNCTION_36_10();
          if (v31 == v32)
            goto LABEL_28;
          OUTLINED_FUNCTION_30_11();
          if (!v29)
            break;
        }
      }
    }
LABEL_25:
    v23 = (v29 - 1) & v29;
    v27 = __clz(__rbit64(v29)) + (v30 << 6);
    v63 = v30;
  }
  v34 = v33 + 4;
  if (v34 >= v50)
  {
LABEL_28:
    swift_release();
    sub_1B24EADD4();
    OUTLINED_FUNCTION_7_1();
    return;
  }
  v29 = *(_QWORD *)(v51 + 8 * v34);
  if (v29)
  {
    v30 = v34;
    goto LABEL_25;
  }
  while (!__OFADD__(v34, 1))
  {
    OUTLINED_FUNCTION_36_10();
    if (v31 == v32)
      goto LABEL_28;
    OUTLINED_FUNCTION_30_11();
    v34 = v35 + 1;
    if (v29)
      goto LABEL_25;
  }
LABEL_30:
  __break(1u);
}

void sub_1B257EDB0(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  char v11;
  char v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  unint64_t v22;
  unint64_t v23;
  char v24;
  unint64_t v25;
  BOOL v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  __int128 v30;
  __int128 v31;
  uint64_t v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  uint64_t v36;
  _OWORD v37[2];
  _OWORD v38[2];

  if (*(_QWORD *)(a1 + 16))
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EEFD7540);
    v2 = sub_1B25CD498();
  }
  else
  {
    v2 = MEMORY[0x1E0DEE9E0];
  }
  v29 = a1 + 64;
  OUTLINED_FUNCTION_38_11();
  v5 = v4 & v3;
  v6 = v2 + 64;
  OUTLINED_FUNCTION_79_0();
  swift_retain();
  v7 = 0;
  if (!v5)
    goto LABEL_6;
LABEL_5:
  OUTLINED_FUNCTION_106_6();
  v9 = v8 | (v7 << 6);
  while (1)
  {
    v17 = (_QWORD *)(*(_QWORD *)(a1 + 48) + 16 * v9);
    v18 = v17[1];
    *(_QWORD *)&v38[0] = *v17;
    *((_QWORD *)&v38[0] + 1) = v18;
    swift_bridgeObjectRetain();
    OUTLINED_FUNCTION_47_0();
    OUTLINED_FUNCTION_53();
    OUTLINED_FUNCTION_53();
    v34 = v30;
    v35 = v31;
    v36 = v32;
    sub_1B24AB608(&v33, v37);
    v30 = v34;
    v31 = v35;
    v32 = v36;
    sub_1B24AB608(v37, v38);
    sub_1B24AB608(v38, &v34);
    v19 = sub_1B25CD258();
    v20 = -1 << *(_BYTE *)(v2 + 32);
    v21 = v19 & ~v20;
    v22 = v21 >> 6;
    if (((-1 << v21) & ~*(_QWORD *)(v6 + 8 * (v21 >> 6))) == 0)
    {
      v24 = 0;
      v25 = (unint64_t)(63 - v20) >> 6;
      while (++v22 != v25 || (v24 & 1) == 0)
      {
        v26 = v22 == v25;
        if (v22 == v25)
          v22 = 0;
        v24 |= v26;
        v27 = *(_QWORD *)(v6 + 8 * v22);
        if (v27 != -1)
        {
          v23 = __clz(__rbit64(~v27)) + (v22 << 6);
          goto LABEL_37;
        }
      }
      __break(1u);
LABEL_41:
      __break(1u);
      goto LABEL_42;
    }
    v23 = __clz(__rbit64((-1 << v21) & ~*(_QWORD *)(v6 + 8 * (v21 >> 6)))) | v21 & 0x7FFFFFFFFFFFFFC0;
LABEL_37:
    *(_QWORD *)(v6 + ((v23 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v23;
    v28 = *(_QWORD *)(v2 + 48) + 40 * v23;
    *(_OWORD *)v28 = v30;
    *(_OWORD *)(v28 + 16) = v31;
    *(_QWORD *)(v28 + 32) = v32;
    sub_1B24AB608(&v34, (_OWORD *)(*(_QWORD *)(v2 + 56) + 32 * v23));
    ++*(_QWORD *)(v2 + 16);
    if (v5)
      goto LABEL_5;
LABEL_6:
    if (__OFADD__(v7, 1))
      goto LABEL_41;
    OUTLINED_FUNCTION_105_5();
    if (v11 == v12)
      goto LABEL_39;
    v13 = *(_QWORD *)(v29 + 8 * v10);
    v14 = v10;
    if (!v13)
    {
      OUTLINED_FUNCTION_104_6();
      if (v11 == v12)
        goto LABEL_39;
      OUTLINED_FUNCTION_103_6();
      if (!v13)
      {
        OUTLINED_FUNCTION_104_6();
        if (v11 == v12)
          goto LABEL_39;
        OUTLINED_FUNCTION_103_6();
        if (!v13)
        {
          OUTLINED_FUNCTION_104_6();
          if (v11 == v12)
            goto LABEL_39;
          OUTLINED_FUNCTION_103_6();
          if (!v13)
            break;
        }
      }
    }
LABEL_27:
    v5 = (v13 - 1) & v13;
    v9 = __clz(__rbit64(v13)) + (v14 << 6);
    v7 = v14;
  }
  OUTLINED_FUNCTION_105_5();
  if (v11 == v12)
  {
LABEL_39:
    swift_release();
    sub_1B24EADD4();
    return;
  }
  v13 = *(_QWORD *)(v29 + 8 * v15);
  if (v13)
  {
    v14 = v15;
    goto LABEL_27;
  }
  while (!__OFADD__(v15, 1))
  {
    OUTLINED_FUNCTION_104_6();
    if (v11 == v12)
      goto LABEL_39;
    OUTLINED_FUNCTION_103_6();
    v15 = v16 + 1;
    if (v13)
      goto LABEL_27;
  }
LABEL_42:
  __break(1u);
}

uint64_t sub_1B257F10C(unint64_t a1)
{
  unint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t result;
  unint64_t v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  int64_t v19;
  unint64_t v20;
  int64_t v21;
  int64_t v22;
  uint64_t v23;
  id v24;
  uint64_t v25;
  unint64_t v26;
  unint64_t v27;
  unint64_t v28;
  char v29;
  unint64_t v30;
  BOOL v31;
  uint64_t v32;
  uint64_t v33;
  int64_t v34;
  unint64_t v35;
  int64_t v36;
  __int128 v37;
  __int128 v38;
  uint64_t v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  uint64_t v43;
  _OWORD v44[2];
  _OWORD v45[2];
  void *v46;
  uint64_t v47;

  v2 = a1 & 0xC000000000000001;
  if ((a1 & 0xC000000000000001) != 0)
  {
    if (sub_1B25CD210())
      goto LABEL_3;
LABEL_6:
    v3 = MEMORY[0x1E0DEE9E0];
    if (v2)
      goto LABEL_4;
    goto LABEL_7;
  }
  if (!*(_QWORD *)(a1 + 16))
    goto LABEL_6;
LABEL_3:
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EEFD7540);
  v3 = sub_1B25CD498();
  if (v2)
  {
LABEL_4:
    v4 = sub_1B25CD42C();
    v35 = 0;
    v5 = 0;
    v6 = 0;
    v7 = v4 | 0x8000000000000000;
    goto LABEL_11;
  }
LABEL_7:
  v8 = -1 << *(_BYTE *)(a1 + 32);
  v5 = ~v8;
  v35 = a1 + 64;
  v9 = -v8;
  if (v9 < 64)
    v10 = ~(-1 << v9);
  else
    v10 = -1;
  v6 = v10 & *(_QWORD *)(a1 + 64);
  v7 = a1;
LABEL_11:
  v34 = (unint64_t)(v5 + 64) >> 6;
  v11 = v3 + 64;
  swift_bridgeObjectRetain();
  result = swift_retain();
  v36 = 0;
  if ((v7 & 0x8000000000000000) != 0)
    goto LABEL_14;
LABEL_12:
  if (v6)
  {
    v13 = __clz(__rbit64(v6));
    v6 &= v6 - 1;
    v14 = v13 | (v36 << 6);
    goto LABEL_32;
  }
  v19 = v36 + 1;
  if (!__OFADD__(v36, 1))
  {
    if (v19 < v34)
    {
      v20 = *(_QWORD *)(v35 + 8 * v19);
      v21 = v36 + 1;
      if (v20)
        goto LABEL_31;
      v21 = v36 + 2;
      if (v36 + 2 >= v34)
        goto LABEL_44;
      v20 = *(_QWORD *)(v35 + 8 * v21);
      if (v20)
        goto LABEL_31;
      v21 = v36 + 3;
      if (v36 + 3 >= v34)
        goto LABEL_44;
      v20 = *(_QWORD *)(v35 + 8 * v21);
      if (v20)
        goto LABEL_31;
      v21 = v36 + 4;
      if (v36 + 4 >= v34)
        goto LABEL_44;
      v20 = *(_QWORD *)(v35 + 8 * v21);
      if (v20)
      {
LABEL_31:
        v6 = (v20 - 1) & v20;
        v14 = __clz(__rbit64(v20)) + (v21 << 6);
        v36 = v21;
LABEL_32:
        v18 = *(void **)(*(_QWORD *)(v7 + 48) + 8 * v14);
        v23 = *(_QWORD *)(*(_QWORD *)(v7 + 56) + 8 * v14);
        v46 = v18;
        v47 = v23;
        v24 = v18;
        swift_unknownObjectRetain();
        while (1)
        {
          *(_QWORD *)&v45[0] = v18;
          sub_1B24B3050(0, &qword_1ED36D030);
          swift_dynamicCast();
          swift_dynamicCast();
          v41 = v37;
          v42 = v38;
          v43 = v39;
          sub_1B24AB608(&v40, v44);
          v37 = v41;
          v38 = v42;
          v39 = v43;
          sub_1B24AB608(v44, v45);
          sub_1B24AB608(v45, &v41);
          result = sub_1B25CD258();
          v25 = -1 << *(_BYTE *)(v3 + 32);
          v26 = result & ~v25;
          v27 = v26 >> 6;
          if (((-1 << v26) & ~*(_QWORD *)(v11 + 8 * (v26 >> 6))) == 0)
            break;
          v28 = __clz(__rbit64((-1 << v26) & ~*(_QWORD *)(v11 + 8 * (v26 >> 6)))) | v26 & 0x7FFFFFFFFFFFFFC0;
LABEL_42:
          *(_QWORD *)(v11 + ((v28 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v28;
          v33 = *(_QWORD *)(v3 + 48) + 40 * v28;
          *(_OWORD *)v33 = v37;
          *(_OWORD *)(v33 + 16) = v38;
          *(_QWORD *)(v33 + 32) = v39;
          result = (uint64_t)sub_1B24AB608(&v41, (_OWORD *)(*(_QWORD *)(v3 + 56) + 32 * v28));
          ++*(_QWORD *)(v3 + 16);
          if ((v7 & 0x8000000000000000) == 0)
            goto LABEL_12;
LABEL_14:
          v15 = sub_1B25CD444();
          if (!v15)
            goto LABEL_44;
          v17 = v16;
          *(_QWORD *)&v41 = v15;
          sub_1B24B3050(0, &qword_1ED36D030);
          swift_dynamicCast();
          v47 = v17;
          v18 = v46;
        }
        v29 = 0;
        v30 = (unint64_t)(63 - v25) >> 6;
        while (++v27 != v30 || (v29 & 1) == 0)
        {
          v31 = v27 == v30;
          if (v27 == v30)
            v27 = 0;
          v29 |= v31;
          v32 = *(_QWORD *)(v11 + 8 * v27);
          if (v32 != -1)
          {
            v28 = __clz(__rbit64(~v32)) + (v27 << 6);
            goto LABEL_42;
          }
        }
        __break(1u);
        goto LABEL_46;
      }
      v22 = v36 + 5;
      if (v36 + 5 < v34)
      {
        v20 = *(_QWORD *)(v35 + 8 * v22);
        if (!v20)
        {
          while (1)
          {
            v21 = v22 + 1;
            if (__OFADD__(v22, 1))
              goto LABEL_47;
            if (v21 >= v34)
              goto LABEL_44;
            v20 = *(_QWORD *)(v35 + 8 * v21);
            ++v22;
            if (v20)
              goto LABEL_31;
          }
        }
        v21 = v36 + 5;
        goto LABEL_31;
      }
    }
LABEL_44:
    v46 = 0;
    v47 = 0;
    swift_release();
    sub_1B24EADD4();
    return v3;
  }
LABEL_46:
  __break(1u);
LABEL_47:
  __break(1u);
  return result;
}

uint64_t sub_1B257F598(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  char v14;
  id v16;

  v4 = OUTLINED_FUNCTION_32_4();
  OUTLINED_FUNCTION_30_0();
  MEMORY[0x1E0C80A78](v5, v6);
  OUTLINED_FUNCTION_78_4();
  v8 = *(unsigned __int8 *)(a1 + *(int *)(v7 + 32));
  v9 = sub_1B254E940(a1, v1);
  if (v8 != 1)
    goto LABEL_5;
  v10 = *(void **)(v2 + OBJC_IVAR____TtC6Speech17CommandRecognizer_activeSet);
  v11 = *(void **)(v1 + *(int *)(v4 + 36));
  if (!v10)
  {
    v16 = v11;
    OUTLINED_FUNCTION_64_12();
    if (!v11)
    {
      v14 = 1;
      return v14 & 1;
    }

    goto LABEL_6;
  }
  if (!v11)
  {
LABEL_5:
    OUTLINED_FUNCTION_64_12();
LABEL_6:
    v14 = 0;
    return v14 & 1;
  }
  OUTLINED_FUNCTION_73_4(v9, (unint64_t *)&qword_1EEFD7420);
  v12 = v10;
  v13 = v11;
  v14 = sub_1B25CD0D8();
  OUTLINED_FUNCTION_64_12();

  return v14 & 1;
}

void sub_1B257F690(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;
  id v14;
  char v15;
  uint64_t v16;
  uint64_t v17;
  id v18;

  v6 = OUTLINED_FUNCTION_32_4();
  OUTLINED_FUNCTION_30_0();
  MEMORY[0x1E0C80A78](v7, v8);
  OUTLINED_FUNCTION_78_4();
  v9 = sub_1B254E940(a1, v2);
  *(_BYTE *)(v2 + *(int *)(v6 + 32)) = 1;
  v10 = *(void **)(v3 + OBJC_IVAR____TtC6Speech17CommandRecognizer_activeSet);
  if (v10)
  {
    v11 = *(int *)(v6 + 36);
    v12 = *(void **)(v2 + v11);
    if (!v12)
    {
      *(_QWORD *)(v2 + v11) = v10;
      OUTLINED_FUNCTION_97_6();
      OUTLINED_FUNCTION_1_6(a2, 0);
      v18 = v10;
      goto LABEL_9;
    }
    OUTLINED_FUNCTION_73_4(v9, &qword_1ED36D030);
    v13 = v10;
    v14 = v12;
    v15 = sub_1B25CD0D8();

    if ((v15 & 1) != 0)
      goto LABEL_4;
LABEL_6:
    v16 = a2;
    v17 = 1;
    goto LABEL_7;
  }
  if (*(_QWORD *)(v2 + *(int *)(v6 + 36)))
    goto LABEL_6;
LABEL_4:
  OUTLINED_FUNCTION_97_6();
  v16 = a2;
  v17 = 0;
LABEL_7:
  OUTLINED_FUNCTION_1_6(v16, v17);
LABEL_9:
  OUTLINED_FUNCTION_64_12();
  OUTLINED_FUNCTION_233();
}

void sub_1B257F794()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  char v4;
  char v5;
  char v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  OUTLINED_FUNCTION_7_13();
  if (v4)
  {
    __break(1u);
LABEL_13:
    __break(1u);
    goto LABEL_14;
  }
  if (!OUTLINED_FUNCTION_12_14() || (OUTLINED_FUNCTION_62_10(), !(v6 ^ v4 | v5)))
  {
    OUTLINED_FUNCTION_46_8();
    sub_1B252BB90();
    v2 = v7;
  }
  if (!*(_QWORD *)(v0 + 16))
  {
    if (!v3)
      goto LABEL_11;
    goto LABEL_13;
  }
  OUTLINED_FUNCTION_13_11();
  if (v6 != v4)
  {
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  v8 = OUTLINED_FUNCTION_32_15();
  sub_1B252D934(v8, v9);
  if (!v3)
  {
LABEL_11:
    OUTLINED_FUNCTION_10_0();
    *v1 = v2;
    OUTLINED_FUNCTION_233();
    return;
  }
  OUTLINED_FUNCTION_51_8();
  if (!v4)
  {
    *(_QWORD *)(v2 + 16) = v10;
    goto LABEL_11;
  }
LABEL_15:
  __break(1u);
}

uint64_t sub_1B257F82C()
{
  return sub_1B257F874();
}

uint64_t sub_1B257F850()
{
  return sub_1B257F874();
}

uint64_t sub_1B257F874()
{
  unint64_t *v0;
  unint64_t v1;
  uint64_t *v2;
  uint64_t *v3;
  uint64_t *v4;
  uint64_t *v5;
  uint64_t *v6;
  uint64_t *v7;
  uint64_t *v8;
  uint64_t *v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  int isUniquelyReferenced_nonNull_bridgeObject;
  uint64_t v16;
  uint64_t v17;
  uint64_t result;
  uint64_t v19;
  uint64_t v20;
  BOOL v21;
  uint64_t v22;
  uint64_t v23;

  OUTLINED_FUNCTION_641();
  v3 = v2;
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v10 = v1;
  if (v1 >> 62)
  {
    OUTLINED_FUNCTION_168();
    v11 = sub_1B25CD474();
    swift_bridgeObjectRelease();
  }
  else
  {
    v11 = *(_QWORD *)((v1 & 0xFFFFFFFFFFFFF8) + 0x10);
  }
  v12 = *v0;
  if (*v0 >> 62)
  {
    OUTLINED_FUNCTION_224_0();
    v13 = sub_1B25CD474();
    OUTLINED_FUNCTION_365();
  }
  else
  {
    v13 = *(_QWORD *)((v12 & 0xFFFFFFFFFFFFF8) + 0x10);
  }
  v14 = v13 + v11;
  if (__OFADD__(v13, v11))
  {
    __break(1u);
    goto LABEL_24;
  }
  v12 = *v0;
  isUniquelyReferenced_nonNull_bridgeObject = swift_isUniquelyReferenced_nonNull_bridgeObject();
  *v0 = v12;
  v13 = 0;
  if (isUniquelyReferenced_nonNull_bridgeObject
    && (v12 & 0x8000000000000000) == 0
    && (v12 & 0x4000000000000000) == 0)
  {
    v16 = v12 & 0xFFFFFFFFFFFFFF8;
    if (v14 <= *(_QWORD *)((v12 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
      goto LABEL_16;
    v13 = 1;
  }
  v23 = v11;
  v11 = (uint64_t)v9;
  v9 = v7;
  v7 = v5;
  v5 = v3;
  if (v12 >> 62)
    goto LABEL_25;
  v17 = *(_QWORD *)((v12 & 0xFFFFFFFFFFFFF8) + 0x10);
  while (1)
  {
    if (v17 <= v14)
      v17 = v14;
    OUTLINED_FUNCTION_224_0();
    v12 = MEMORY[0x1B5E252D0](v13, v17, 1, v12);
    swift_bridgeObjectRelease();
    *v0 = v12;
    v16 = v12 & 0xFFFFFFFFFFFFFF8;
    v3 = v5;
    v5 = v7;
    v7 = v9;
    v9 = (uint64_t *)v11;
    v11 = v23;
LABEL_16:
    result = sub_1B2583780(v16 + 8 * *(_QWORD *)(v16 + 16) + 32, (*(_QWORD *)(v16 + 24) >> 1) - *(_QWORD *)(v16 + 16), v10, (void (*)(uint64_t, _QWORD, uint64_t))v9, v7, v5, (uint64_t (*)(_BYTE *, uint64_t, unint64_t, uint64_t, uint64_t))v3);
    if (v19 >= v11)
      break;
LABEL_24:
    __break(1u);
LABEL_25:
    OUTLINED_FUNCTION_224_0();
    v17 = sub_1B25CD474();
    OUTLINED_FUNCTION_365();
  }
  if (v19 < 1)
    goto LABEL_20;
  v20 = *(_QWORD *)((*v0 & 0xFFFFFFFFFFFFFF8) + 0x10);
  v21 = __OFADD__(v20, v19);
  v22 = v20 + v19;
  if (!v21)
  {
    *(_QWORD *)((*v0 & 0xFFFFFFFFFFFFFF8) + 0x10) = v22;
LABEL_20:
    swift_bridgeObjectRelease();
    return sub_1B25CCBBC();
  }
  __break(1u);
  return result;
}

void sub_1B257FA5C()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  char v4;
  char v5;
  char v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  OUTLINED_FUNCTION_7_13();
  if (v4)
  {
    __break(1u);
LABEL_13:
    __break(1u);
    goto LABEL_14;
  }
  if (!OUTLINED_FUNCTION_12_14() || (OUTLINED_FUNCTION_62_10(), !(v6 ^ v4 | v5)))
  {
    OUTLINED_FUNCTION_46_8();
    sub_1B252BBC8();
    v2 = v7;
  }
  if (!*(_QWORD *)(v0 + 16))
  {
    if (!v3)
      goto LABEL_11;
    goto LABEL_13;
  }
  OUTLINED_FUNCTION_13_11();
  if (v6 != v4)
  {
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  v8 = OUTLINED_FUNCTION_32_15();
  sub_1B252D9C4(v8, v9);
  if (!v3)
  {
LABEL_11:
    OUTLINED_FUNCTION_10_0();
    *v1 = v2;
    OUTLINED_FUNCTION_233();
    return;
  }
  OUTLINED_FUNCTION_51_8();
  if (!v4)
  {
    *(_QWORD *)(v2 + 16) = v10;
    goto LABEL_11;
  }
LABEL_15:
  __break(1u);
}

void sub_1B257FAF0()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  char v4;
  char v5;
  char v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;

  OUTLINED_FUNCTION_7_13();
  if (v4)
  {
    __break(1u);
LABEL_13:
    __break(1u);
    goto LABEL_14;
  }
  if (!OUTLINED_FUNCTION_12_14() || (OUTLINED_FUNCTION_62_10(), !(v6 ^ v4 | v5)))
  {
    OUTLINED_FUNCTION_46_8();
    sub_1B252BC90();
    v2 = v7;
  }
  if (!*(_QWORD *)(v0 + 16))
  {
    if (!v3)
      goto LABEL_11;
    goto LABEL_13;
  }
  OUTLINED_FUNCTION_13_11();
  if (v6 != v4)
  {
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  v8 = OUTLINED_FUNCTION_32_15();
  sub_1B252DB04(v8, v9, v10);
  if (!v3)
  {
LABEL_11:
    OUTLINED_FUNCTION_10_0();
    *v1 = v2;
    OUTLINED_FUNCTION_233();
    return;
  }
  OUTLINED_FUNCTION_51_8();
  if (!v4)
  {
    *(_QWORD *)(v2 + 16) = v11;
    goto LABEL_11;
  }
LABEL_15:
  __break(1u);
}

void sub_1B257FB88()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  char v4;
  char v5;
  char v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;

  OUTLINED_FUNCTION_7_13();
  if (v4)
  {
    __break(1u);
LABEL_13:
    __break(1u);
    goto LABEL_14;
  }
  if (!OUTLINED_FUNCTION_12_14() || (OUTLINED_FUNCTION_62_10(), !(v6 ^ v4 | v5)))
  {
    OUTLINED_FUNCTION_46_8();
    sub_1B252BE3C();
    v2 = v7;
  }
  if (!*(_QWORD *)(v0 + 16))
  {
    if (!v3)
      goto LABEL_11;
    goto LABEL_13;
  }
  OUTLINED_FUNCTION_13_11();
  if (v6 != v4)
  {
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  v8 = OUTLINED_FUNCTION_32_15();
  sub_1B252D814(v8, v9, v10);
  if (!v3)
  {
LABEL_11:
    OUTLINED_FUNCTION_10_0();
    *v1 = v2;
    OUTLINED_FUNCTION_233();
    return;
  }
  OUTLINED_FUNCTION_51_8();
  if (!v4)
  {
    *(_QWORD *)(v2 + 16) = v11;
    goto LABEL_11;
  }
LABEL_15:
  __break(1u);
}

void sub_1B257FC20(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t isUniquelyReferenced_nonNull_native;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  BOOL v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void (*v22)(_QWORD *, _QWORD);
  uint64_t *v23;
  uint64_t v24;
  uint64_t v25;
  unint64_t v26;
  int64_t v27;
  uint64_t v28;
  uint64_t v29;
  void (*v30)(_QWORD *, _QWORD);
  uint64_t *v31;
  uint64_t v33;
  _QWORD v34[4];
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;

  v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
    goto LABEL_16;
  }
  v2 = *v3;
  v5 = *(_QWORD *)(*v3 + 16);
  v6 = v5 + v4;
  if (__OFADD__(v5, v4))
  {
LABEL_16:
    __break(1u);
LABEL_17:
    __break(1u);
    goto LABEL_18;
  }
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  if (!(_DWORD)isUniquelyReferenced_nonNull_native || (v10 = *(_QWORD *)(v2 + 24) >> 1, v10 < v6))
  {
    if (v5 <= v6)
      v11 = v5 + v4;
    else
      v11 = v5;
    sub_1B252C024(isUniquelyReferenced_nonNull_native, v11, 1, v2);
    v2 = v12;
    v10 = *(_QWORD *)(v12 + 24) >> 1;
  }
  v13 = *(_QWORD *)(v2 + 16);
  v14 = v10 - v13;
  v15 = (uint64_t)sub_1B2583684(&v35, (_QWORD *)(v2 + 8 * v13 + 32), v10 - v13, a1, a2);
  if (v15 < v4)
    goto LABEL_17;
  if (v15 >= 1)
  {
    v16 = *(_QWORD *)(v2 + 16);
    v17 = __OFADD__(v16, v15);
    v18 = v16 + v15;
    if (v17)
    {
      __break(1u);
LABEL_39:
      v28 = v4 + 1;
LABEL_40:
      *(_QWORD *)(v2 + 16) = v28;
      goto LABEL_14;
    }
    *(_QWORD *)(v2 + 16) = v18;
  }
  if (v15 != v14)
  {
LABEL_14:
    *v3 = v2;
    return;
  }
LABEL_18:
  v19 = v36;
  v20 = v37;
  if (v37 == v36)
    goto LABEL_14;
  v4 = *(_QWORD *)(v2 + 16);
  v21 = v35;
  v22 = (void (*)(_QWORD *, _QWORD))sub_1B2584D6C(v34, v37);
  v24 = *v23;
  v22(v34, 0);
  if (v19 < v21)
  {
LABEL_41:
    __break(1u);
  }
  else if (v20 >= v21)
  {
    if (v20 < v19)
    {
      v25 = v20 + 1;
      while (1)
      {
        v26 = *(_QWORD *)(v2 + 24);
        v27 = v26 >> 1;
        v28 = v4 + 1;
        if ((uint64_t)(v26 >> 1) < v4 + 1)
        {
          sub_1B252C024(v26 > 1, v4 + 1, 1, v2);
          v2 = v33;
          v27 = *(_QWORD *)(v33 + 24) >> 1;
        }
        if (v4 < v27)
        {
          *(_QWORD *)(v2 + 8 * v4 + 32) = v24;
          if (v25 == v19)
            goto LABEL_40;
          v29 = v25;
          while (1)
          {
            v30 = (void (*)(_QWORD *, _QWORD))sub_1B2584D6C(v34, v29);
            v24 = *v31;
            v30(v34, 0);
            if (v25 < v21 || v29 >= v19)
            {
              __break(1u);
              goto LABEL_41;
            }
            ++v29;
            if (v4 + 1 >= v27)
              break;
            *(_QWORD *)(v2 + 40 + 8 * v4++) = v24;
            if (v19 == v29)
              goto LABEL_39;
          }
          ++v4;
          v25 = v29;
        }
        *(_QWORD *)(v2 + 16) = v4;
      }
    }
    goto LABEL_43;
  }
  __break(1u);
LABEL_43:
  __break(1u);
}

void sub_1B257FE54()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  char v4;
  char v5;
  char v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  OUTLINED_FUNCTION_7_13();
  if (v4)
  {
    __break(1u);
LABEL_13:
    __break(1u);
    goto LABEL_14;
  }
  if (!OUTLINED_FUNCTION_12_14() || (OUTLINED_FUNCTION_62_10(), !(v6 ^ v4 | v5)))
  {
    OUTLINED_FUNCTION_46_8();
    sub_1B252BFEC();
    v2 = v7;
  }
  if (!*(_QWORD *)(v0 + 16))
  {
    if (!v3)
      goto LABEL_11;
    goto LABEL_13;
  }
  v8 = (*(_QWORD *)(v2 + 24) >> 1) - *(_QWORD *)(v2 + 16);
  v9 = sub_1B25CC3B8();
  if (v8 < v3)
  {
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  sub_1B252DCDC(v0+ ((*(unsigned __int8 *)(*(_QWORD *)(v9 - 8) + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(v9 - 8) + 80)), v3);
  if (!v3)
  {
LABEL_11:
    OUTLINED_FUNCTION_10_0();
    *v1 = v2;
    OUTLINED_FUNCTION_233();
    return;
  }
  OUTLINED_FUNCTION_51_8();
  if (!v4)
  {
    *(_QWORD *)(v2 + 16) = v10;
    goto LABEL_11;
  }
LABEL_15:
  __break(1u);
}

void sub_1B257FF18(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  int64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t i;
  int64_t v12;
  char v13;
  char v14;
  unint64_t v15;
  int64_t v16;
  int64_t v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  uint64_t v25;
  _QWORD *v26;
  BOOL v27;
  uint64_t v28;
  unint64_t j;
  uint64_t v30;
  _QWORD *v31;
  BOOL v32;
  uint64_t v33;
  int64_t v34;
  int64_t v35;

  if (a1 == a2)
    return;
  OUTLINED_FUNCTION_55_11();
  if (!v27)
    return;
  v4 = 0;
  v5 = *(_QWORD *)(v3 + 56);
  v33 = v3 + 56;
  v6 = 1 << *(_BYTE *)(v3 + 32);
  if (v6 < 64)
    v7 = ~(-1 << v6);
  else
    v7 = -1;
  v8 = v7 & v5;
  v34 = (unint64_t)(v6 + 63) >> 6;
  v9 = a2 + 56;
  if ((v7 & v5) == 0)
    goto LABEL_9;
LABEL_8:
  v10 = __clz(__rbit64(v8));
  v8 &= v8 - 1;
  v35 = v4;
  for (i = v10 | (v4 << 6); ; i = __clz(__rbit64(v15)) + (v16 << 6))
  {
    v18 = v3;
    v19 = (uint64_t *)(*(_QWORD *)(v3 + 48) + 16 * i);
    v21 = *v19;
    v20 = v19[1];
    sub_1B25CD6A8();
    swift_bridgeObjectRetain();
    sub_1B25CCAB4();
    v22 = sub_1B25CD6CC();
    v23 = -1 << *(_BYTE *)(a2 + 32);
    v24 = v22 & ~v23;
    if (((*(_QWORD *)(v9 + ((v24 >> 3) & 0xFFFFFFFFFFFFF8)) >> v24) & 1) == 0)
      goto LABEL_42;
    v25 = *(_QWORD *)(a2 + 48);
    v26 = (_QWORD *)(v25 + 16 * v24);
    v27 = *v26 == v21 && v26[1] == v20;
    if (!v27 && (OUTLINED_FUNCTION_303_0() & 1) == 0)
    {
      v28 = ~v23;
      for (j = v24 + 1; ; j = v30 + 1)
      {
        v30 = j & v28;
        if (((*(_QWORD *)(v9 + (((j & v28) >> 3) & 0xFFFFFFFFFFFFF8)) >> (j & v28)) & 1) == 0)
          break;
        v31 = (_QWORD *)(v25 + 16 * v30);
        v32 = *v31 == v21 && v31[1] == v20;
        if (v32 || (OUTLINED_FUNCTION_303_0() & 1) != 0)
          goto LABEL_31;
      }
LABEL_42:
      OUTLINED_FUNCTION_101_1();
      return;
    }
LABEL_31:
    OUTLINED_FUNCTION_101_1();
    v3 = v18;
    v4 = v35;
    if (v8)
      goto LABEL_8;
LABEL_9:
    if (__OFADD__(v4, 1))
    {
      __break(1u);
      goto LABEL_44;
    }
    OUTLINED_FUNCTION_105_5();
    if (v13 == v14)
      return;
    v15 = *(_QWORD *)(v33 + 8 * v12);
    v16 = v12;
    if (!v15)
    {
      v16 = v12 + 1;
      if (v12 + 1 >= v34)
        return;
      v15 = *(_QWORD *)(v33 + 8 * v16);
      if (!v15)
      {
        v16 = v12 + 2;
        if (v12 + 2 >= v34)
          return;
        v15 = *(_QWORD *)(v33 + 8 * v16);
        if (!v15)
          break;
      }
    }
LABEL_24:
    v8 = (v15 - 1) & v15;
    v35 = v16;
  }
  OUTLINED_FUNCTION_105_5();
  if (v13 == v14)
    return;
  v15 = *(_QWORD *)(v33 + 8 * v17);
  if (v15)
  {
    v16 = v17;
    goto LABEL_24;
  }
  while (1)
  {
    v16 = v17 + 1;
    if (__OFADD__(v17, 1))
      break;
    if (v16 >= v34)
      return;
    v15 = *(_QWORD *)(v33 + 8 * v16);
    ++v17;
    if (v15)
      goto LABEL_24;
  }
LABEL_44:
  __break(1u);
}

void sub_1B2580180(uint64_t a1, uint64_t a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char v12;
  uint64_t v13;
  uint64_t v14;
  char v15;

  if (a1 != a2)
  {
    OUTLINED_FUNCTION_55_11();
    if (v8)
    {
      OUTLINED_FUNCTION_4_15();
      while (1)
      {
LABEL_5:
        if (v6)
        {
          OUTLINED_FUNCTION_288_2();
        }
        else
        {
          v9 = v5 + 1;
          if (__OFADD__(v5, 1))
          {
            __break(1u);
LABEL_30:
            __break(1u);
            return;
          }
          if (v9 >= v4)
            break;
          ++v5;
          if (!*(_QWORD *)(v3 + 8 * v9))
          {
            v5 = v9 + 1;
            if (v9 + 1 >= v4)
              break;
            if (!*(_QWORD *)(v3 + 8 * v5))
            {
              v5 = v9 + 2;
              if (v9 + 2 >= v4)
                break;
              if (!*(_QWORD *)(v3 + 8 * v5))
              {
                v5 = v9 + 3;
                if (v9 + 3 >= v4)
                  break;
                if (!*(_QWORD *)(v3 + 8 * v5))
                {
                  v10 = v9 + 4;
                  if (v10 >= v4)
                    break;
                  if (!*(_QWORD *)(v3 + 8 * v10))
                  {
                    while (1)
                    {
                      v5 = v10 + 1;
                      if (__OFADD__(v10, 1))
                        goto LABEL_30;
                      if (v5 >= v4)
                        goto LABEL_28;
                      ++v10;
                      if (*(_QWORD *)(v3 + 8 * v5))
                        goto LABEL_22;
                    }
                  }
                  v5 = v10;
                }
              }
            }
          }
LABEL_22:
          OUTLINED_FUNCTION_61_11();
        }
        OUTLINED_FUNCTION_39_8();
        OUTLINED_FUNCTION_39_3();
        OUTLINED_FUNCTION_2();
        OUTLINED_FUNCTION_29_16();
        if ((v12 & 1) == 0)
          break;
        if (v2 != *(unsigned __int8 *)(*(_QWORD *)(a2 + 48) + v11))
        {
          while (1)
          {
            OUTLINED_FUNCTION_43_9();
            if ((v15 & 1) == 0)
              goto LABEL_28;
            if (v2 == *(unsigned __int8 *)(v13 + v14))
              goto LABEL_5;
          }
        }
      }
    }
  }
LABEL_28:
  OUTLINED_FUNCTION_176_0();
}

void sub_1B25802BC(uint64_t a1, uint64_t a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char v12;
  uint64_t v13;
  uint64_t v14;
  char v15;

  if (a1 != a2)
  {
    OUTLINED_FUNCTION_55_11();
    if (v8)
    {
      OUTLINED_FUNCTION_4_15();
      while (1)
      {
LABEL_5:
        if (v6)
        {
          OUTLINED_FUNCTION_288_2();
        }
        else
        {
          v9 = v5 + 1;
          if (__OFADD__(v5, 1))
          {
            __break(1u);
LABEL_30:
            __break(1u);
            return;
          }
          if (v9 >= v4)
            break;
          ++v5;
          if (!*(_QWORD *)(v3 + 8 * v9))
          {
            v5 = v9 + 1;
            if (v9 + 1 >= v4)
              break;
            if (!*(_QWORD *)(v3 + 8 * v5))
            {
              v5 = v9 + 2;
              if (v9 + 2 >= v4)
                break;
              if (!*(_QWORD *)(v3 + 8 * v5))
              {
                v5 = v9 + 3;
                if (v9 + 3 >= v4)
                  break;
                if (!*(_QWORD *)(v3 + 8 * v5))
                {
                  v10 = v9 + 4;
                  if (v10 >= v4)
                    break;
                  if (!*(_QWORD *)(v3 + 8 * v10))
                  {
                    while (1)
                    {
                      v5 = v10 + 1;
                      if (__OFADD__(v10, 1))
                        goto LABEL_30;
                      if (v5 >= v4)
                        goto LABEL_28;
                      ++v10;
                      if (*(_QWORD *)(v3 + 8 * v5))
                        goto LABEL_22;
                    }
                  }
                  v5 = v10;
                }
              }
            }
          }
LABEL_22:
          OUTLINED_FUNCTION_61_11();
        }
        OUTLINED_FUNCTION_39_8();
        OUTLINED_FUNCTION_39_3();
        OUTLINED_FUNCTION_2();
        OUTLINED_FUNCTION_29_16();
        if ((v12 & 1) == 0)
          break;
        if (*(unsigned __int8 *)(*(_QWORD *)(a2 + 48) + v11) != v2)
        {
          while (1)
          {
            OUTLINED_FUNCTION_43_9();
            if ((v15 & 1) == 0)
              goto LABEL_28;
            if (*(unsigned __int8 *)(v13 + v14) == v2)
              goto LABEL_5;
          }
        }
      }
    }
  }
LABEL_28:
  OUTLINED_FUNCTION_176_0();
}

uint64_t sub_1B25803F4(uint64_t result)
{
  return sub_1B2580478(result);
}

uint64_t sub_1B2580400(uint64_t result)
{
  uint64_t v1;
  unint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char v7;
  unint64_t v8;

  if (result < 0)
  {
    __break(1u);
LABEL_9:
    __break(1u);
    goto LABEL_10;
  }
  v3 = OUTLINED_FUNCTION_44_11();
  result = sub_1B24E9E10(v3, v4, v5, v6);
  if ((v7 & 1) != 0)
    v8 = v2;
  else
    v8 = result;
  if ((v8 & 0x8000000000000000) != 0)
    goto LABEL_9;
  if (v2 >= v8)
  {
    sub_1B25CC760();
    return v1;
  }
LABEL_10:
  __break(1u);
  return result;
}

uint64_t sub_1B2580478(uint64_t result)
{
  uint64_t v1;
  unint64_t v2;
  uint64_t v3;
  uint64_t (*v4)(uint64_t);
  char v5;
  unint64_t v6;

  if (result < 0)
  {
    __break(1u);
LABEL_9:
    __break(1u);
    goto LABEL_10;
  }
  v3 = OUTLINED_FUNCTION_44_11();
  result = v4(v3);
  if ((v5 & 1) != 0)
    v6 = v2;
  else
    v6 = result;
  if ((v6 & 0x8000000000000000) != 0)
    goto LABEL_9;
  if (v2 >= v6)
    return v1;
LABEL_10:
  __break(1u);
  return result;
}

void sub_1B25804D4(uint64_t (*a1)(_QWORD *), uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v5;
  uint64_t (*v6)(_QWORD *);
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char v10;
  char isUniquelyReferenced_nonNull_native;
  unint64_t v12;
  uint64_t v13;
  _QWORD v15[2];
  uint64_t v16;

  v5 = *(_QWORD *)(a3 + 16);
  if (v5)
  {
    v6 = a1;
    v7 = 0;
    v8 = MEMORY[0x1E0DEE9D8];
    while (v7 < *(_QWORD *)(a3 + 16))
    {
      v9 = *(_QWORD *)(a3 + 8 * v7 + 32);
      v15[0] = v7;
      v15[1] = v9;
      v10 = v6(v15);
      if (v3)
      {
        swift_release();
        goto LABEL_15;
      }
      if ((v10 & 1) != 0)
      {
        isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
        v16 = v8;
        if ((isUniquelyReferenced_nonNull_native & 1) == 0)
        {
          sub_1B25055B4();
          v8 = v16;
        }
        v12 = *(_QWORD *)(v8 + 16);
        if (v12 >= *(_QWORD *)(v8 + 24) >> 1)
        {
          sub_1B25055B4();
          v8 = v16;
        }
        *(_QWORD *)(v8 + 16) = v12 + 1;
        v13 = v8 + 16 * v12;
        *(_QWORD *)(v13 + 32) = v7;
        *(_QWORD *)(v13 + 40) = v9;
        v6 = a1;
      }
      if (v5 == ++v7)
        goto LABEL_15;
    }
    __break(1u);
  }
  else
  {
LABEL_15:
    swift_bridgeObjectRelease();
  }
}

void CommandRecognizer.__allocating_init(transcriber:)()
{
  OUTLINED_FUNCTION_628();
  CommandRecognizer.init(transcriber:)();
  OUTLINED_FUNCTION_0();
}

void CommandRecognizer.init(transcriber:)()
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
  char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;

  OUTLINED_FUNCTION_59_0();
  v4 = v3;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EEFD7250);
  OUTLINED_FUNCTION_84_8();
  MEMORY[0x1E0C80A78](v5, v6);
  OUTLINED_FUNCTION_229();
  v21 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEFD7310);
  v7 = *(_QWORD *)(v21 - 8);
  MEMORY[0x1E0C80A78](v21, v8);
  OUTLINED_FUNCTION_56_0();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EEFD72B8);
  OUTLINED_FUNCTION_30_0();
  MEMORY[0x1E0C80A78](v9, v10);
  OUTLINED_FUNCTION_48_9();
  MEMORY[0x1E0C80A78](v11, v12);
  v14 = (char *)&v20 - v13;
  v15 = OBJC_IVAR____TtC6Speech17CommandRecognizer__worker;
  __swift_instantiateConcreteTypeFromMangledName(qword_1EEFD6D68);
  v16 = OUTLINED_FUNCTION_8_4();
  *(_BYTE *)(v16 + 24) = 0;
  *(_QWORD *)(v16 + 16) = 0;
  *(_QWORD *)(v0 + v15) = v16;
  *(_QWORD *)(v0 + OBJC_IVAR____TtC6Speech17CommandRecognizer_transcriber) = v4;
  *(_QWORD *)(v0 + OBJC_IVAR____TtC6Speech17CommandRecognizer_activeSet) = 0;
  v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEFD72A8);
  v18 = OUTLINED_FUNCTION_67_10(v17);
  OUTLINED_FUNCTION_75_12(v18, *MEMORY[0x1E0DF0A50]);
  swift_retain();
  OUTLINED_FUNCTION_47_12();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v7 + 32))(v0 + OBJC_IVAR____TtC6Speech17CommandRecognizer__results, v2, v21);
  sub_1B2584D38((uint64_t)v14, v1, &qword_1EEFD72B8);
  if (__swift_getEnumTagSinglePayload(v1, 1, v15) == 1)
  {
    __break(1u);
  }
  else
  {
    swift_release();
    v19 = OUTLINED_FUNCTION_35_14(OBJC_IVAR____TtC6Speech17CommandRecognizer_resultsBuilder);
    OUTLINED_FUNCTION_68_9(v19, &qword_1EEFD72B8);
    OUTLINED_FUNCTION_7_1();
  }
}

uint64_t CommandRecognizer.__allocating_init(transcriber:activeSet:)()
{
  uint64_t v0;

  v0 = OUTLINED_FUNCTION_628();
  CommandRecognizer.init(transcriber:activeSet:)();
  return v0;
}

void CommandRecognizer.init(transcriber:activeSet:)()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t *v3;
  uint64_t *v4;
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
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;

  OUTLINED_FUNCTION_59_0();
  v4 = v3;
  v6 = v5;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EEFD7250);
  OUTLINED_FUNCTION_84_8();
  MEMORY[0x1E0C80A78](v7, v8);
  OUTLINED_FUNCTION_229();
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEFD7310);
  v23 = *(_QWORD *)(v9 - 8);
  v24 = v9;
  MEMORY[0x1E0C80A78](v9, v10);
  OUTLINED_FUNCTION_56_0();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EEFD72B8);
  OUTLINED_FUNCTION_30_0();
  MEMORY[0x1E0C80A78](v11, v12);
  OUTLINED_FUNCTION_48_9();
  MEMORY[0x1E0C80A78](v13, v14);
  v16 = (char *)&v23 - v15;
  v17 = *v4;
  v18 = OBJC_IVAR____TtC6Speech17CommandRecognizer__worker;
  __swift_instantiateConcreteTypeFromMangledName(qword_1EEFD6D68);
  v19 = OUTLINED_FUNCTION_8_4();
  *(_BYTE *)(v19 + 24) = 0;
  *(_QWORD *)(v19 + 16) = 0;
  *(_QWORD *)(v0 + v18) = v19;
  *(_QWORD *)(v0 + OBJC_IVAR____TtC6Speech17CommandRecognizer_transcriber) = v6;
  *(_QWORD *)(v0 + OBJC_IVAR____TtC6Speech17CommandRecognizer_activeSet) = v17;
  v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEFD72A8);
  v21 = OUTLINED_FUNCTION_67_10(v20);
  OUTLINED_FUNCTION_75_12(v21, *MEMORY[0x1E0DF0A50]);
  swift_retain();
  OUTLINED_FUNCTION_47_12();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v23 + 32))(v0 + OBJC_IVAR____TtC6Speech17CommandRecognizer__results, v2, v24);
  sub_1B2584D38((uint64_t)v16, v1, &qword_1EEFD72B8);
  if (__swift_getEnumTagSinglePayload(v1, 1, v17) == 1)
  {
    __break(1u);
  }
  else
  {
    swift_release();
    v22 = OUTLINED_FUNCTION_35_14(OBJC_IVAR____TtC6Speech17CommandRecognizer_resultsBuilder);
    OUTLINED_FUNCTION_68_9(v22, &qword_1EEFD72B8);
    OUTLINED_FUNCTION_7_1();
  }
}

uint64_t sub_1B25809B4(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  void (*v3)(uint64_t);
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  sub_1B24EBD4C(a2, &qword_1EEFD72B8);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EEFD72A8);
  v2 = OUTLINED_FUNCTION_38_0();
  v3(v2);
  OUTLINED_FUNCTION_46_8();
  return OUTLINED_FUNCTION_12_0(v4, v5, v6, v7);
}

uint64_t sub_1B2580A14(uint64_t a1)
{
  uint64_t v1;

  return sub_1B25809B4(a1, *(_QWORD *)(v1 + 16));
}

uint64_t CommandRecognizer.results.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t (*v3)(void);

  __swift_instantiateConcreteTypeFromMangledName(&qword_1EEFD7310);
  v0 = OUTLINED_FUNCTION_22_0();
  return OUTLINED_FUNCTION_21_0(v0, v1, v2, v3);
}

double CommandRecognizer.Result.range.getter@<D0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  double result;

  v2 = *(_QWORD *)(v1 + 40);
  *(_QWORD *)a1 = *(_QWORD *)v1;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(v1 + 8);
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(v1 + 16);
  result = *(double *)(v1 + 32);
  *(double *)(a1 + 32) = result;
  *(_QWORD *)(a1 + 40) = v2;
  return result;
}

uint64_t CommandRecognizer.Result.resultsFinalToTime.getter()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + 48);
}

uint64_t CommandRecognizer.Result.transcriptionCommands.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t CommandRecognizer.Result.description.getter()
{
  CMTimeValue *v0;
  CMTimeValue v1;
  CMTimeEpoch v2;
  CMTimeValue v3;
  CMTimeEpoch v4;
  void *v5;
  uint64_t v6;
  CMTimeValue v7;
  CMTimeRange range;
  uint64_t v10;
  unint64_t v11;

  v1 = *v0;
  v2 = v0[2];
  v3 = v0[3];
  v4 = v0[5];
  *(_QWORD *)&range.start.timescale = 0xE000000000000000;
  sub_1B25CD2DC();
  v10 = 0;
  v11 = 0xE000000000000000;
  sub_1B25CCAE4();
  range.start.value = v1;
  *(_QWORD *)&range.start.timescale = v0[1];
  range.start.epoch = v2;
  range.duration.value = v3;
  *(_QWORD *)&range.duration.timescale = v0[4];
  range.duration.epoch = v4;
  v5 = (void *)CMTimeRangeCopyDescription(0, &range);
  if (!v5)
    v5 = (void *)sub_1B25CCA0C();
  range.start.value = (CMTimeValue)v5;
  type metadata accessor for CFString(0);
  sub_1B25CD3E4();

  OUTLINED_FUNCTION_18_1();
  v6 = OUTLINED_FUNCTION_79_0();
  v7 = sub_1B257E398(v6);
  OUTLINED_FUNCTION_10_0();
  range.start.value = v7;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED36CFD0);
  sub_1B24EBFA4(&qword_1EEFD7158, &qword_1ED36CFD0);
  OUTLINED_FUNCTION_80_9();
  OUTLINED_FUNCTION_54_9();
  OUTLINED_FUNCTION_96_7();
  OUTLINED_FUNCTION_101_1();
  OUTLINED_FUNCTION_79_5();
  return v10;
}

void CommandRecognizer.Interpretation.description.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  void (*v3)(uint64_t);
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD v13[6];

  OUTLINED_FUNCTION_59_0();
  v2 = OUTLINED_FUNCTION_9_14();
  v3 = (void (*)(uint64_t))MEMORY[0x1E0CB13A0];
  v4 = *(_QWORD *)(v2 - 8);
  MEMORY[0x1E0C80A78](v2, v5);
  OUTLINED_FUNCTION_52_6();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EEFD6998);
  OUTLINED_FUNCTION_30_0();
  MEMORY[0x1E0C80A78](v6, v7);
  v9 = (char *)v13 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13[4] = 0;
  v13[5] = 0xE000000000000000;
  sub_1B25CD2DC();
  OUTLINED_FUNCTION_18_1();
  sub_1B2584D38(v0, (uint64_t)v9, &qword_1EEFD6998);
  sub_1B25CCA6C();
  sub_1B25CCAE4();
  swift_bridgeObjectRelease();
  sub_1B25CCAE4();
  v10 = OUTLINED_FUNCTION_25_16();
  OUTLINED_FUNCTION_224_0();
  sub_1B25CCAE4();
  OUTLINED_FUNCTION_365();
  sub_1B25CCAE4();
  sub_1B2583900();
  sub_1B25CCAE4();
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_94_9();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v4 + 16))(v1, v0 + *(int *)(v10 + 32), v2);
  sub_1B2531930(&qword_1EEFDAD60, v3);
  sub_1B25CCB44();
  MEMORY[0x1B5E24B5C]();
  OUTLINED_FUNCTION_99_6();
  swift_release();
  OUTLINED_FUNCTION_101_1();
  sub_1B25CCAE4();
  v11 = OUTLINED_FUNCTION_79_0();
  v12 = sub_1B257E5F4(v11);
  OUTLINED_FUNCTION_10_0();
  v13[1] = v12;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED36CFD0);
  sub_1B24EBFA4(&qword_1EEFD7158, &qword_1ED36CFD0);
  OUTLINED_FUNCTION_80_9();
  OUTLINED_FUNCTION_54_9();
  OUTLINED_FUNCTION_96_7();
  OUTLINED_FUNCTION_101_1();
  OUTLINED_FUNCTION_79_5();
  OUTLINED_FUNCTION_7_1();
}

void _s6Speech17CommandRecognizerC22compatibleAudioFormatsSaySo13AVAudioFormatCGvg_0()
{
  void *v0;
  id v1;

  __swift_instantiateConcreteTypeFromMangledName(&qword_1EEFD7620);
  *(_OWORD *)(OUTLINED_FUNCTION_8_4() + 16) = xmmword_1B25DBD80;
  if (qword_1EEFD7FE8 != -1)
    swift_once();
  v0 = (void *)qword_1EEFE4208;
  OUTLINED_FUNCTION_52_12();
  v1 = v0;
  OUTLINED_FUNCTION_28_0();
}

void CommandRecognizer.availableCompatibleAudioFormats(clientID:)()
{
  void *v0;
  id v1;

  __swift_instantiateConcreteTypeFromMangledName(&qword_1EEFD7620);
  *(_OWORD *)(OUTLINED_FUNCTION_8_4() + 16) = xmmword_1B25DBD80;
  if (qword_1EEFD7FE8 != -1)
    swift_once();
  v0 = (void *)qword_1EEFE4208;
  OUTLINED_FUNCTION_52_12();
  v1 = v0;
  OUTLINED_FUNCTION_28_0();
}

uint64_t CommandRecognizer.transcriber.getter()
{
  return swift_retain();
}

id CommandRecognizer.activeSet.getter@<X0>(_QWORD *a1@<X8>)
{
  uint64_t v1;
  void *v2;

  v2 = *(void **)(v1 + OBJC_IVAR____TtC6Speech17CommandRecognizer_activeSet);
  *a1 = v2;
  return v2;
}

uint64_t CommandRecognizer.ActiveSet.init(suiteDictionary:resourceBaseURL:)@<X0>(unint64_t a1@<X0>, uint64_t a2@<X1>, _QWORD *a3@<X8>)
{
  uint64_t v3;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  void *v12;
  uint64_t inited;
  uint64_t v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t result;
  id v19;
  id v20;
  id v21;
  unint64_t v22;

  v7 = sub_1B25CC538();
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x1E0C80A78](v7, v9);
  OUTLINED_FUNCTION_52_6();
  OUTLINED_FUNCTION_73_4(v10, &qword_1EEFD73F0);
  sub_1B257F10C(a1);
  OUTLINED_FUNCTION_173();
  v11 = sub_1B2581150();
  if (v11)
  {
    v12 = v11;
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EEFD7620);
    inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_1B25DBD80;
    *(_QWORD *)(inited + 32) = v12;
    v22 = inited;
    sub_1B25CCBBC();
    if (v22 >> 62)
    {
      v21 = v12;
      OUTLINED_FUNCTION_47_0();
      v14 = sub_1B25CD474();
      OUTLINED_FUNCTION_173();
    }
    else
    {
      v14 = *(_QWORD *)((v22 & 0xFFFFFFFFFFFFF8) + 0x10);
      v15 = v12;
    }
    if (v14)
    {
      sub_1B2506670(v22);
      v17 = v16;
    }
    else
    {
      swift_bridgeObjectRelease();
      v17 = MEMORY[0x1E0DEE9E8];
    }
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v8 + 16))(v3, a2, v7);
    v20 = objc_allocWithZone(MEMORY[0x1E0D1F0F0]);
    v19 = sub_1B258304C(v17, v3);

    result = OUTLINED_FUNCTION_49_11();
  }
  else
  {
    result = OUTLINED_FUNCTION_49_11();
    v19 = 0;
  }
  *a3 = v19;
  return result;
}

id sub_1B2581150()
{
  id v0;
  void *v1;
  id v2;

  v0 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  v1 = (void *)sub_1B25CC8EC();
  swift_bridgeObjectRelease();
  v2 = objc_msgSend(v0, sel_initWithPlistJSONDictionary_, v1);

  return v2;
}

uint64_t static CommandRecognizer.ActiveSet.== infix(_:_:)(uint64_t a1)
{
  OUTLINED_FUNCTION_73_4(a1, &qword_1ED36D030);
  OUTLINED_FUNCTION_38_0();
  return sub_1B25CD0D8() & 1;
}

void CommandRecognizer.Interpretation.instanceIdentifier.getter(uint64_t a1@<X8>)
{
  uint64_t v1;

  sub_1B2584D38(v1, a1, &qword_1EEFD6998);
}

void CommandRecognizer.Interpretation.commandIdentifier.getter()
{
  OUTLINED_FUNCTION_25_16();
  OUTLINED_FUNCTION_47_0();
  OUTLINED_FUNCTION_38_0();
  OUTLINED_FUNCTION_0();
}

uint64_t CommandRecognizer.Interpretation.suiteIdentifiers.getter()
{
  OUTLINED_FUNCTION_25_16();
  return swift_bridgeObjectRetain();
}

uint64_t CommandRecognizer.Interpretation.range.getter()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + *(int *)(OUTLINED_FUNCTION_25_16() + 28));
}

uint64_t CommandRecognizer.Interpretation.verbIndexes.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t (*v3)(void);

  OUTLINED_FUNCTION_25_16();
  OUTLINED_FUNCTION_9_14();
  v0 = OUTLINED_FUNCTION_22_0();
  return OUTLINED_FUNCTION_21_0(v0, v1, v2, v3);
}

uint64_t CommandRecognizer.Interpretation.arguments.getter()
{
  OUTLINED_FUNCTION_25_16();
  return swift_bridgeObjectRetain();
}

void CommandRecognizer.Argument.description.getter()
{
  uint64_t v0;
  uint64_t v1;
  void (*v2)(uint64_t);
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  OUTLINED_FUNCTION_59_0();
  v1 = OUTLINED_FUNCTION_9_14();
  v2 = (void (*)(uint64_t))MEMORY[0x1E0CB13A0];
  MEMORY[0x1E0C80A78](v1, v3);
  OUTLINED_FUNCTION_42_3();
  sub_1B25CD2DC();
  sub_1B25CCAE4();
  sub_1B25CD3E4();
  OUTLINED_FUNCTION_94_9();
  swift_bridgeObjectRetain();
  sub_1B25CCAE4();
  swift_bridgeObjectRelease();
  sub_1B25CCAE4();
  v4 = type metadata accessor for CommandRecognizer.Argument(0);
  OUTLINED_FUNCTION_100_5(v4, v0 + *(int *)(v4 + 24));
  sub_1B2531930(&qword_1EEFDAD60, v2);
  v5 = OUTLINED_FUNCTION_63_10();
  v6 = MEMORY[0x1E0DEB418];
  MEMORY[0x1B5E24B5C](v5, MEMORY[0x1E0DEB418]);
  OUTLINED_FUNCTION_99_6();
  swift_release();
  swift_bridgeObjectRelease();
  v7 = OUTLINED_FUNCTION_18_1();
  OUTLINED_FUNCTION_100_5(v7, v0 + *(int *)(v4 + 28));
  v8 = OUTLINED_FUNCTION_63_10();
  MEMORY[0x1B5E24B5C](v8, v6);
  OUTLINED_FUNCTION_99_6();
  swift_release();
  swift_bridgeObjectRelease();
  sub_1B25CCAE4();
  OUTLINED_FUNCTION_7_1();
}

uint64_t static CommandRecognizer.Interpretation.== infix(_:_:)()
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
  char *v21;
  uint64_t v22;
  uint64_t v23;
  char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  char v28;
  char v29;
  void (*v30)(uint64_t, uint64_t);
  int *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  _QWORD *v37;
  BOOL v38;
  char v39;
  char v40;
  char v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t *v45;
  uint64_t v46;
  uint64_t v47;
  BOOL v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
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

  OUTLINED_FUNCTION_59_0();
  v68 = v2;
  v69 = v3;
  v5 = v4;
  v7 = v6;
  v8 = sub_1B25CC61C();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x1E0C80A78](v8, v10);
  OUTLINED_FUNCTION_229();
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEFDAD68);
  OUTLINED_FUNCTION_30_0();
  MEMORY[0x1E0C80A78](v12, v13);
  OUTLINED_FUNCTION_42_3();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EEFD6998);
  OUTLINED_FUNCTION_30_0();
  MEMORY[0x1E0C80A78](v14, v15);
  OUTLINED_FUNCTION_29_7();
  v59 = v16;
  v19 = MEMORY[0x1E0C80A78](v17, v18);
  v21 = (char *)&v56 - v20;
  MEMORY[0x1E0C80A78](v19, v22);
  v24 = (char *)&v56 - v23;
  v57 = v7;
  OUTLINED_FUNCTION_59_9(v7, (uint64_t)&v56 - v23);
  v58 = v5;
  OUTLINED_FUNCTION_59_9(v5, (uint64_t)v21);
  v25 = v0 + *(int *)(v11 + 48);
  OUTLINED_FUNCTION_59_9((uint64_t)v24, v0);
  OUTLINED_FUNCTION_59_9((uint64_t)v21, v25);
  OUTLINED_FUNCTION_66_4(v0);
  if (v28)
  {
    OUTLINED_FUNCTION_40_7((uint64_t)v21);
    OUTLINED_FUNCTION_40_7((uint64_t)v24);
    v26 = OUTLINED_FUNCTION_66_4(v25);
    if (v28)
    {
      OUTLINED_FUNCTION_68_9(v26, &qword_1EEFD6998);
      goto LABEL_11;
    }
LABEL_9:
    OUTLINED_FUNCTION_68_9(v26, &qword_1EEFDAD68);
    goto LABEL_24;
  }
  v27 = v59;
  sub_1B2584D38(v0, v59, &qword_1EEFD6998);
  OUTLINED_FUNCTION_66_4(v25);
  if (v28)
  {
    sub_1B24EBD4C((uint64_t)v21, &qword_1EEFD6998);
    sub_1B24EBD4C((uint64_t)v24, &qword_1EEFD6998);
    v26 = (*(uint64_t (**)(uint64_t, uint64_t))(v9 + 8))(v27, v8);
    goto LABEL_9;
  }
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v9 + 32))(v1, v25, v8);
  sub_1B2531930(&qword_1EEFDAD70, (void (*)(uint64_t))MEMORY[0x1E0CB0998]);
  v29 = sub_1B25CC994();
  v30 = *(void (**)(uint64_t, uint64_t))(v9 + 8);
  v30(v1, v8);
  OUTLINED_FUNCTION_40_7((uint64_t)v21);
  OUTLINED_FUNCTION_40_7((uint64_t)v24);
  v30(v27, v8);
  OUTLINED_FUNCTION_40_7(v0);
  if ((v29 & 1) == 0)
    goto LABEL_24;
LABEL_11:
  v31 = (int *)OUTLINED_FUNCTION_25_16();
  v32 = v31[5];
  v34 = v57;
  v33 = v58;
  v35 = *(_QWORD *)(v57 + v32);
  v36 = *(_QWORD *)(v57 + v32 + 8);
  v37 = (_QWORD *)(v58 + v32);
  v38 = v35 == *v37 && v36 == v37[1];
  if (v38 || (v39 = OUTLINED_FUNCTION_303_0(), v40 = 0, (v39 & 1) != 0))
  {
    sub_1B257FF18(*(_QWORD *)(v34 + v31[6]), *(_QWORD *)(v33 + v31[6]));
    if ((v41 & 1) != 0)
    {
      v42 = v31[7];
      v44 = *(_QWORD *)(v34 + v42);
      v43 = *(_QWORD *)(v34 + v42 + 8);
      v45 = (uint64_t *)(v33 + v42);
      v47 = *v45;
      v46 = v45[1];
      v48 = v44 == v47 && v43 == v46;
      if (v48 && (MEMORY[0x1B5E246D0](v34 + v31[8], v33 + v31[8]) & 1) != 0)
      {
        sub_1B2522ED8(*(_QWORD *)(v34 + v31[9]), *(_QWORD *)(v33 + v31[9]), v49, v50, v51, v52, v53, v54, v56, v57, v58, v59, v60, v61, v62, v63, v64, v65, v66,
          v67);
        return v40 & 1;
      }
    }
LABEL_24:
    v40 = 0;
  }
  return v40 & 1;
}

void CommandRecognizer.Argument.presence.getter(_BYTE *a1@<X8>)
{
  _BYTE *v1;

  *a1 = *v1;
}

_BYTE *CommandRecognizer.Argument.presence.setter(_BYTE *result)
{
  _BYTE *v1;

  *v1 = *result;
  return result;
}

uint64_t (*CommandRecognizer.Argument.presence.modify())(_QWORD, _QWORD)
{
  return nullsub_1;
}

void CommandRecognizer.Argument.text.getter()
{
  OUTLINED_FUNCTION_47_0();
  OUTLINED_FUNCTION_38_0();
  OUTLINED_FUNCTION_0();
}

void CommandRecognizer.Argument.text.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  swift_bridgeObjectRelease();
  *(_QWORD *)(v2 + 8) = a1;
  *(_QWORD *)(v2 + 16) = a2;
  OUTLINED_FUNCTION_262();
}

uint64_t (*CommandRecognizer.Argument.text.modify())(_QWORD, _QWORD)
{
  return nullsub_1;
}

uint64_t CommandRecognizer.Argument.indexes.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t (*v3)(void);

  OUTLINED_FUNCTION_95_7();
  OUTLINED_FUNCTION_9_14();
  v0 = OUTLINED_FUNCTION_22_0();
  return OUTLINED_FUNCTION_21_0(v0, v1, v2, v3);
}

uint64_t CommandRecognizer.Argument.indexes.setter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t (*v3)(void);

  OUTLINED_FUNCTION_88_6();
  OUTLINED_FUNCTION_9_14();
  v0 = OUTLINED_FUNCTION_58_10();
  return OUTLINED_FUNCTION_21_0(v0, v1, v2, v3);
}

uint64_t (*CommandRecognizer.Argument.indexes.modify())(_QWORD, _QWORD)
{
  type metadata accessor for CommandRecognizer.Argument(0);
  return nullsub_1;
}

uint64_t CommandRecognizer.Argument.adpositionIndexes.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t (*v3)(void);

  OUTLINED_FUNCTION_95_7();
  OUTLINED_FUNCTION_9_14();
  v0 = OUTLINED_FUNCTION_22_0();
  return OUTLINED_FUNCTION_21_0(v0, v1, v2, v3);
}

uint64_t CommandRecognizer.Argument.adpositionIndexes.setter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t (*v3)(void);

  OUTLINED_FUNCTION_88_6();
  OUTLINED_FUNCTION_9_14();
  v0 = OUTLINED_FUNCTION_58_10();
  return OUTLINED_FUNCTION_21_0(v0, v1, v2, v3);
}

uint64_t (*CommandRecognizer.Argument.adpositionIndexes.modify())(_QWORD, _QWORD)
{
  type metadata accessor for CommandRecognizer.Argument(0);
  return nullsub_1;
}

BOOL static CommandRecognizer.Argument.Presence.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t CommandRecognizer.Argument.Presence.hash(into:)()
{
  return sub_1B25CD6B4();
}

uint64_t CommandRecognizer.Argument.Presence.hashValue.getter()
{
  sub_1B25CD6A8();
  sub_1B25CD6B4();
  return OUTLINED_FUNCTION_2();
}

void static CommandRecognizer.Argument.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  BOOL v4;
  uint64_t v5;

  if (*a1 == *a2)
  {
    v4 = *((_QWORD *)a1 + 1) == *((_QWORD *)a2 + 1) && *((_QWORD *)a1 + 2) == *((_QWORD *)a2 + 2);
    if (v4 || (OUTLINED_FUNCTION_303_0() & 1) != 0)
    {
      v5 = type metadata accessor for CommandRecognizer.Argument(0);
      if ((MEMORY[0x1B5E246D0](&a1[*(int *)(v5 + 24)], &a2[*(int *)(v5 + 24)]) & 1) != 0)
        JUMPOUT(0x1B5E246D0);
    }
  }
  OUTLINED_FUNCTION_262();
}

uint64_t sub_1B2581A58()
{
  return swift_retain();
}

uint64_t sub_1B2581A6C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;

  *(_QWORD *)(v5 + 16) = a4;
  *(_QWORD *)(v5 + 24) = a5;
  return swift_task_switch();
}

uint64_t sub_1B2581A84()
{
  uint64_t v0;
  uint64_t result;

  if (*(_QWORD *)(v0 + 16))
    return swift_task_switch();
  __break(1u);
  return result;
}

uint64_t sub_1B2581AA0()
{
  uint64_t v0;

  sub_1B259DE54();
  return OUTLINED_FUNCTION_21(*(uint64_t (**)(void))(v0 + 8));
}

void sub_1B2581AC8(void *a1)
{
  uint64_t v3;

  if (object_getClass(a1) == (Class)_TtC6Speech22SpeechRecognizerWorker && a1 != 0)
  {
    v3 = (uint64_t)a1 + OBJC_IVAR____TtC6Speech22SpeechRecognizerWorker_supportedFeatures;
    swift_unknownObjectRetain();
    sub_1B257F598(v3);
    swift_unknownObjectRelease();
  }
  OUTLINED_FUNCTION_262();
}

void sub_1B2581B34()
{
  uint64_t v0;

  *(_BYTE *)(*(_QWORD *)(v0 + OBJC_IVAR____TtC6Speech17CommandRecognizer__worker) + 24) = 1;
}

void CommandRecognizer.recognizerObjectIdentifier.getter()
{
  if (sub_1B2581A58())
    swift_release();
  OUTLINED_FUNCTION_0();
}

uint64_t sub_1B2581B7C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, unint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, unsigned __int8 *a15, uint64_t a16, uint64_t a17, uint64_t a18)
{
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  int v27;
  int v28;
  uint64_t v29;
  unint64_t v30;
  int v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  unsigned int v35;
  uint64_t v36;
  uint64_t result;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  unint64_t v41;
  unint64_t v42;
  unint64_t v43;
  unint64_t v44;
  uint64_t v45;
  uint64_t v46;
  char **v47;
  unint64_t v48;
  uint64_t v49;
  uint64_t v50;
  void *v51;
  id v52;
  void *v53;
  unsigned __int8 v54;
  uint64_t v55;
  unint64_t v56;
  BOOL v57;
  id v58;
  int v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  unint64_t v63;
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
  unint64_t v79;
  unint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  NSObject *v85;
  os_log_type_t v86;
  unint64_t v87;
  uint8_t *v88;
  uint64_t v89;
  uint64_t v90;
  unint64_t v91;
  _BYTE v92[12];
  int v93;
  unint64_t v94;
  uint64_t v95;
  int v96;
  int v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  int v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  unint64_t v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  unint64_t v114;
  unint64_t v115;
  unint64_t v116;
  uint64_t v117;
  uint64_t v118;
  int v119;
  int v120;
  uint64_t v121;
  unint64_t v122;
  int v123;
  int v124;
  uint64_t v125;
  unint64_t v126;
  int v127;
  int v128;
  uint64_t v129;
  uint64_t v130;
  uint64_t v131;
  uint64_t v132;

  OUTLINED_FUNCTION_59_0();
  v131 = v19;
  v132 = v20;
  v22 = v21;
  v114 = v23;
  v25 = v24;
  v106 = *(_QWORD *)v26;
  v27 = *(_DWORD *)(v26 + 8);
  v28 = *(_DWORD *)(v26 + 12);
  v29 = *(_QWORD *)(v26 + 16);
  v30 = *(_QWORD *)(v26 + 24);
  v31 = *(_DWORD *)(v26 + 32);
  v105 = *(_DWORD *)(v26 + 36);
  v104 = *(_QWORD *)(v26 + 40);
  v103 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEFDADC8);
  v102 = *(_QWORD *)(v103 - 8);
  MEMORY[0x1E0C80A78](v103, v32);
  OUTLINED_FUNCTION_767();
  v101 = v33;
  v100 = v18;
  v34 = *(_QWORD *)(v18 + OBJC_IVAR____TtC6Speech17CommandRecognizer_transcriber);
  v35 = *a15;
  v36 = *(_QWORD *)(v34 + OBJC_IVAR____TtC6Speech11Transcriber_reportingOptions);
  result = sub_1B251CDC4(0, v36);
  if (v35 <= 2 && (result & 1) == 0)
    return result;
  v38 = *(_QWORD *)(v34 + OBJC_IVAR____TtC6Speech11Transcriber_transcriptionOptions);
  if ((sub_1B251CDC4(1, v38) & 1) != 0)
  {
    v114 = a9;
    v25 = v22;
  }
  else
  {
    result = sub_1B251CDC4(0, v38);
    if ((result & 1) == 0)
      return result;
  }
  v39 = v25;
  OUTLINED_FUNCTION_79_0();
  OUTLINED_FUNCTION_79_0();
  if ((sub_1B251CDC4(1, v36) & 1) == 0)
  {
    sub_1B2580478(1);
    sub_1B251C968();
    v39 = v40;
    sub_1B2580478(1);
    sub_1B251CA1C();
    v114 = v41;
  }
  v110 = *(_QWORD *)(v39 + 16);
  v97 = v27;
  v96 = v28;
  v95 = v29;
  v94 = v30;
  v93 = v31;
  if (!v110 || (v42 = v114, (v108 = *(_QWORD *)(v114 + 16)) == 0))
  {
    swift_bridgeObjectRelease();
    OUTLINED_FUNCTION_101_1();
    v45 = MEMORY[0x1E0DEE9D8];
LABEL_55:
    v42 = *(_QWORD *)a17;
    LODWORD(v30) = *(_DWORD *)(a17 + 8);
    LODWORD(v43) = *(_DWORD *)(a17 + 12);
    v49 = *(_QWORD *)(a17 + 16);
    v118 = v106;
    v119 = v97;
    v120 = v96;
    v121 = v95;
    v122 = v94;
    v123 = v93;
    v124 = v105;
    v125 = v104;
    v126 = v42;
    v127 = v30;
    v128 = v43;
    v129 = v49;
    v130 = v45;
    OUTLINED_FUNCTION_168();
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EEFD72A8);
    v83 = v101;
    sub_1B25CCDC0();
    (*(void (**)(uint64_t, uint64_t))(v102 + 8))(v83, v103);
    if (qword_1ED36CF48 != -1)
      goto LABEL_67;
    goto LABEL_56;
  }
  v99 = a18;
  v107 = v39 + 32;
  v43 = *(_QWORD *)(v39 + 32);
  v109 = v114 + 32;
  OUTLINED_FUNCTION_178();
  v44 = 0;
  v113 = 0;
  v45 = MEMORY[0x1E0DEE9D8];
  v46 = 1;
  v47 = &selRef_alternativeConfidences;
  v98 = v39;
  while (1)
  {
    v48 = *(_QWORD *)(v109 + 8 * v44);
    v44 = v46;
    v115 = v48;
    if (v43 >> 62)
    {
      swift_bridgeObjectRetain();
      OUTLINED_FUNCTION_178();
      v49 = sub_1B25CD474();
      OUTLINED_FUNCTION_345();
      if (!v49)
      {
LABEL_46:
        OUTLINED_FUNCTION_345();
        swift_bridgeObjectRelease();
        goto LABEL_47;
      }
    }
    else
    {
      v49 = *(_QWORD *)((v43 & 0xFFFFFFFFFFFFF8) + 0x10);
      swift_bridgeObjectRetain();
      if (!v49)
        goto LABEL_46;
    }
    v118 = MEMORY[0x1E0DEE9D8];
    if (v49 < 1)
      goto LABEL_66;
    v111 = v46;
    v112 = v45;
    v45 = 0;
    v50 = 0;
    v51 = 0;
    v116 = v43 & 0xC000000000000001;
    do
    {
      if (v116)
        v52 = (id)MEMORY[0x1B5E252C4](v50, v43);
      else
        v52 = *(id *)(v43 + 8 * v50 + 32);
      v53 = v52;
      v54 = 0;
      if (objc_msgSend(v52, v47[157]) && v51)
        v54 = objc_msgSend(v51, sel_hasSpaceAfter);
      if (objc_msgSend(v53, v47[157]))
      {
        v55 = v118;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          v64 = OUTLINED_FUNCTION_72_10();
          sub_1B252C024(v64, v65, v66, v55);
          v55 = v67;
        }
        v42 = *(_QWORD *)(v55 + 16);
        v56 = *(_QWORD *)(v55 + 24);
        v30 = v42 + 1;
        if (v42 >= v56 >> 1)
        {
          sub_1B252C024(v56 > 1, v42 + 1, 1, v55);
          v55 = v68;
        }
        *(_QWORD *)(v55 + 16) = v30;
        *(_QWORD *)(v55 + 8 * v42 + 32) = v45;
        v118 = v55;
        if ((v54 & 1) == 0)
        {
          v57 = __OFADD__(v45++, 1);
          if (v57)
            goto LABEL_63;
        }
      }
      v58 = objc_msgSend(v53, sel_tokenName);
      sub_1B25CCA18();
      LODWORD(v30) = v59;

      v60 = sub_1B25CCAC0();
      swift_bridgeObjectRelease();
      v61 = v45 + v60;
      if (__OFADD__(v45, v60))
      {
        __break(1u);
LABEL_61:
        __break(1u);
LABEL_62:
        __break(1u);
LABEL_63:
        __break(1u);
        goto LABEL_64;
      }
      if (v61 < v45)
        goto LABEL_61;
      sub_1B257FC20(v45, v61);
      if (objc_msgSend(v53, sel_hasSpaceAfter))
      {
        v62 = v118;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          v69 = OUTLINED_FUNCTION_72_10();
          sub_1B252C024(v69, v70, v71, v62);
          v62 = v72;
        }
        v42 = *(_QWORD *)(v62 + 16);
        v63 = *(_QWORD *)(v62 + 24);
        v45 = v42 + 1;
        if (v42 >= v63 >> 1)
        {
          sub_1B252C024(v63 > 1, v42 + 1, 1, v62);
          v62 = v73;
        }
        *(_QWORD *)(v62 + 16) = v45;
        *(_QWORD *)(v62 + 8 * v42 + 32) = v61;

        v118 = v62;
        v57 = __OFADD__(v61++, 1);
        if (v57)
          goto LABEL_62;
      }
      else
      {

      }
      ++v50;
      v45 = v61;
      v51 = v53;
      v47 = &selRef_alternativeConfidences;
    }
    while (v49 != v50);
    v74 = OUTLINED_FUNCTION_345();
    MEMORY[0x1E0C80A78](v74, v75);
    *(_QWORD *)&v92[-16] = &v118;
    *(_QWORD *)&v92[-8] = v99;
    v76 = v113;
    sub_1B258AA14((void (*)(id *))sub_1B2584D1C, (uint64_t)&v92[-32], v115);
    v78 = v77;
    v113 = v76;
    OUTLINED_FUNCTION_101_1();
    v45 = v112;
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    {
      OUTLINED_FUNCTION_72_10();
      sub_1B252C008();
      v45 = v81;
    }
    v39 = v98;
    v79 = *(_QWORD *)(v45 + 16);
    if (v79 >= *(_QWORD *)(v45 + 24) >> 1)
    {
      sub_1B252C008();
      v45 = v82;
    }
    *(_QWORD *)(v45 + 16) = v79 + 1;
    *(_QWORD *)(v45 + 8 * v79 + 32) = v78;

    swift_bridgeObjectRelease();
    v42 = v114;
    v44 = v111;
LABEL_47:
    if (v44 == v110)
      goto LABEL_53;
    if (v44 >= *(_QWORD *)(v39 + 16))
      break;
    if (v44 == v108)
    {
LABEL_53:
      swift_bridgeObjectRelease();
      OUTLINED_FUNCTION_101_1();
      goto LABEL_55;
    }
    v46 = v44 + 1;
    v43 = *(_QWORD *)(v107 + 8 * v44);
    v80 = *(_QWORD *)(v42 + 16);
    OUTLINED_FUNCTION_178();
    if (v44 >= v80)
      goto LABEL_65;
  }
LABEL_64:
  __break(1u);
LABEL_65:
  __break(1u);
LABEL_66:
  __break(1u);
LABEL_67:
  swift_once();
LABEL_56:
  v84 = sub_1B25CC8C8();
  __swift_project_value_buffer(v84, (uint64_t)qword_1ED36D980);
  OUTLINED_FUNCTION_168();
  v85 = sub_1B25CC8B0();
  v86 = sub_1B25CCFD0();
  if (os_log_type_enabled(v85, v86))
  {
    v87 = v42;
    v88 = (uint8_t *)swift_slowAlloc();
    v89 = swift_slowAlloc();
    *(_DWORD *)v88 = 136315138;
    v117 = v89;
    v118 = v106;
    v119 = v97;
    v120 = v96;
    v121 = v95;
    v122 = v94;
    v123 = v93;
    v124 = v105;
    v125 = v104;
    v126 = v87;
    v127 = v30;
    v128 = v43;
    v129 = v49;
    v130 = v45;
    v90 = CommandRecognizer.Result.description.getter();
    v118 = sub_1B2504AB0(v90, v91, &v117);
    sub_1B25CD12C();
    swift_bridgeObjectRelease_n();
    OUTLINED_FUNCTION_173();
    _os_log_impl(&dword_1B2494000, v85, v86, "CommandRecognizer: Yielded result %s", v88, 0xCu);
    swift_arrayDestroy();
    OUTLINED_FUNCTION_174();
  }

  return swift_bridgeObjectRelease_n();
}

uint64_t sub_1B25823F4@<X0>(void **a1@<X0>, uint64_t *a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
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
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  void *v21;
  id v22;
  unint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  id v31;
  char *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t result;
  char *v36;
  char *v37;
  uint64_t v38;
  id v39;
  void *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t *v44;
  uint64_t v45;
  char *v46;
  void (*v47)(char *, char *, uint64_t);
  uint64_t v48;
  int *v49;
  uint64_t *v50;
  uint64_t v51;
  _QWORD *v52;
  char *v53;
  char *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  char *v61;
  uint64_t v62;
  char *v63;
  uint64_t v64;

  v63 = (char *)a3;
  v57 = a4;
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEFDADD0);
  MEMORY[0x1E0C80A78](v6, v7);
  v9 = (char *)&v54 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = sub_1B25CC748();
  v60 = *(_QWORD *)(v10 - 8);
  v12 = MEMORY[0x1E0C80A78](v10, v11);
  v14 = (char *)&v54 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v12, v15);
  v61 = (char *)&v54 - v16;
  v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEFD6998);
  MEMORY[0x1E0C80A78](v17, v18);
  v20 = (char *)&v54 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  v21 = *a1;
  v22 = objc_msgSend(v21, sel_arguments);
  sub_1B24B3050(0, &qword_1EEFDADD8);
  v23 = sub_1B25CCBA4();

  v24 = v62;
  sub_1B257E6F0(v23, a2);
  v26 = v25;
  v62 = v24;
  swift_bridgeObjectRelease();
  v27 = (uint64_t)v63;
  v63 = v20;
  sub_1B2584D38(v27, (uint64_t)v20, &qword_1EEFD6998);
  v28 = objc_msgSend(v21, sel_commandIdentifier);
  v29 = sub_1B25CCA18();
  v58 = v30;
  v59 = v29;

  v31 = objc_msgSend(v21, sel_suiteIdentifiers);
  v56 = sub_1B25CCE38();

  v32 = (char *)objc_msgSend(v21, sel_range);
  v34 = v33;
  result = sub_1B25CC2D4();
  v36 = 0;
  v37 = 0;
  if (v32 != (char *)result)
  {
    v36 = &v32[v34];
    if (__OFADD__(v32, v34))
    {
      __break(1u);
      return result;
    }
    v37 = v32;
  }
  v54 = v36;
  v38 = *a2;
  swift_bridgeObjectRetain();
  v39 = objc_msgSend(v21, sel_verbIndexes);
  v55 = v26;
  if (v39)
  {
    v40 = v39;
    sub_1B25CC730();

    v41 = 0;
  }
  else
  {
    v41 = 1;
  }
  __swift_storeEnumTagSinglePayload((uint64_t)v9, v41, 1, v10);
  v42 = sub_1B2582BD4((uint64_t)v9, v38);
  swift_bridgeObjectRelease();
  sub_1B24EBD4C((uint64_t)v9, &qword_1EEFDADD0);
  sub_1B2531930(&qword_1EEFDADE0, (void (*)(uint64_t))MEMORY[0x1E0CB13A0]);
  sub_1B25CD1A4();
  v43 = *(_QWORD *)(v42 + 16);
  if (v43)
  {
    v44 = (uint64_t *)(v42 + 32);
    do
    {
      v45 = *v44++;
      v64 = v45;
      sub_1B25CD198();
      --v43;
    }
    while (v43);
  }
  swift_bridgeObjectRelease();
  v46 = v61;
  v47 = *(void (**)(char *, char *, uint64_t))(v60 + 32);
  v47(v61, v14, v10);
  v48 = v57;
  sub_1B2584E40((uint64_t)v63, v57, &qword_1EEFD6998);
  v49 = (int *)type metadata accessor for CommandRecognizer.Interpretation(0);
  v50 = (uint64_t *)(v48 + v49[5]);
  v51 = v58;
  *v50 = v59;
  v50[1] = v51;
  *(_QWORD *)(v48 + v49[6]) = v56;
  v52 = (_QWORD *)(v48 + v49[7]);
  v53 = v54;
  *v52 = v37;
  v52[1] = v53;
  result = ((uint64_t (*)(uint64_t, char *, uint64_t))v47)(v48 + v49[8], v46, v10);
  *(_QWORD *)(v48 + v49[9]) = v55;
  return result;
}

uint64_t sub_1B25827B8@<X0>(id *a1@<X0>, uint64_t *a2@<X1>, uint64_t a3@<X8>)
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
  uint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  char *v24;
  uint64_t v25;
  uint64_t v26;
  id v27;
  uint64_t v28;
  unint64_t v29;
  uint64_t v30;
  id v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t *v36;
  uint64_t v37;
  void (*v38)(char *, char *, uint64_t);
  uint64_t v39;
  id v40;
  void *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t *v47;
  uint64_t v48;
  unint64_t v49;
  uint64_t v50;
  char *v51;
  uint64_t v52;
  uint64_t result;
  uint64_t v54;
  uint64_t v55;
  uint64_t *v56;
  unint64_t v57;
  uint64_t v58;
  char *v59;
  unsigned int v60;
  char *v61;
  uint64_t v62;
  char *v63;
  uint64_t v64;

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEFDADD0);
  v8 = MEMORY[0x1E0C80A78](v6, v7);
  v59 = (char *)&v54 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v8, v10);
  v12 = (char *)&v54 - v11;
  v13 = sub_1B25CC748();
  v55 = *(_QWORD *)(v13 - 8);
  v15 = MEMORY[0x1E0C80A78](v13, v14);
  v17 = (char *)&v54 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v19 = MEMORY[0x1E0C80A78](v15, v18);
  v61 = (char *)&v54 - v20;
  v22 = MEMORY[0x1E0C80A78](v19, v21);
  v24 = (char *)&v54 - v23;
  MEMORY[0x1E0C80A78](v22, v25);
  v63 = (char *)&v54 - v26;
  v27 = *a1;
  v60 = objc_msgSend(*a1, sel_presence);
  if (v60 >= 4)
  {
    result = sub_1B25CD45C();
    __break(1u);
  }
  else
  {
    v28 = sub_1B2583720(v27);
    v57 = v29;
    v58 = v28;
    v56 = a2;
    v30 = *a2;
    swift_bridgeObjectRetain();
    v31 = objc_msgSend(v27, sel_indexes);
    v62 = a3;
    if (v31)
    {
      v32 = v31;
      sub_1B25CC730();

      v33 = 0;
    }
    else
    {
      v33 = 1;
    }
    __swift_storeEnumTagSinglePayload((uint64_t)v12, v33, 1, v13);
    v34 = sub_1B2582BD4((uint64_t)v12, v30);
    swift_bridgeObjectRelease();
    sub_1B24EBD4C((uint64_t)v12, &qword_1EEFDADD0);
    sub_1B2531930(&qword_1EEFDADE0, (void (*)(uint64_t))MEMORY[0x1E0CB13A0]);
    sub_1B25CD1A4();
    v35 = *(_QWORD *)(v34 + 16);
    if (v35)
    {
      v36 = (uint64_t *)(v34 + 32);
      do
      {
        v37 = *v36++;
        v64 = v37;
        sub_1B25CD198();
        --v35;
      }
      while (v35);
    }
    swift_bridgeObjectRelease();
    v38 = *(void (**)(char *, char *, uint64_t))(v55 + 32);
    v38(v63, v24, v13);
    v39 = *v56;
    swift_bridgeObjectRetain();
    v40 = objc_msgSend(v27, sel_adpositionIndexes);
    if (v40)
    {
      v41 = v40;
      v42 = (uint64_t)v59;
      sub_1B25CC730();

      v43 = 0;
      v44 = v62;
    }
    else
    {
      v43 = 1;
      v44 = v62;
      v42 = (uint64_t)v59;
    }
    __swift_storeEnumTagSinglePayload(v42, v43, 1, v13);
    v45 = sub_1B2582BD4(v42, v39);
    swift_bridgeObjectRelease();
    sub_1B24EBD4C(v42, &qword_1EEFDADD0);
    sub_1B25CD1A4();
    v46 = *(_QWORD *)(v45 + 16);
    if (v46)
    {
      v47 = (uint64_t *)(v45 + 32);
      do
      {
        v48 = *v47++;
        v64 = v48;
        sub_1B25CD198();
        --v46;
      }
      while (v46);
    }
    swift_bridgeObjectRelease();
    if (v57)
      v49 = v57;
    else
      v49 = 0xE000000000000000;
    if (v57)
      v50 = v58;
    else
      v50 = 0;
    v51 = v61;
    v38(v61, v17, v13);
    *(_BYTE *)v44 = v60;
    *(_QWORD *)(v44 + 8) = v50;
    *(_QWORD *)(v44 + 16) = v49;
    v52 = type metadata accessor for CommandRecognizer.Argument(0);
    v38((char *)(v44 + *(int *)(v52 + 24)), v63, v13);
    return ((uint64_t (*)(uint64_t, char *, uint64_t))v38)(v44 + *(int *)(v52 + 28), v51, v13);
  }
  return result;
}

uint64_t sub_1B2582BD4(uint64_t a1, uint64_t a2)
{
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
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEFDADD0);
  MEMORY[0x1E0C80A78](v4, v5);
  v7 = (char *)&v22 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_1B25CC748();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x1E0C80A78](v8, v10);
  v12 = (char *)&v22 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1B2584D38(a1, (uint64_t)v7, &qword_1EEFDADD0);
  if (__swift_getEnumTagSinglePayload((uint64_t)v7, 1, v8) == 1)
  {
    sub_1B24EBD4C((uint64_t)v7, &qword_1EEFDADD0);
    swift_bridgeObjectRetain();
  }
  else
  {
    v13 = (*(uint64_t (**)(char *, char *, uint64_t))(v9 + 32))(v12, v7, v8);
    MEMORY[0x1E0C80A78](v13, v14);
    *(&v22 - 2) = (uint64_t)v12;
    swift_bridgeObjectRetain();
    sub_1B25804D4((uint64_t (*)(_QWORD *))sub_1B2584DA8, (uint64_t)(&v22 - 4), a2);
    v16 = v15;
    v17 = *(_QWORD *)(v15 + 16);
    if (v17)
    {
      v23 = v9;
      v24 = MEMORY[0x1E0DEE9D8];
      sub_1B2505214();
      a2 = v24;
      v18 = *(_QWORD *)(v24 + 16);
      v19 = 40;
      do
      {
        v20 = *(_QWORD *)(v16 + v19);
        v24 = a2;
        if (v18 >= *(_QWORD *)(a2 + 24) >> 1)
        {
          sub_1B2505214();
          a2 = v24;
        }
        *(_QWORD *)(a2 + 16) = v18 + 1;
        *(_QWORD *)(a2 + 8 * v18 + 32) = v20;
        v19 += 16;
        ++v18;
        --v17;
      }
      while (v17);
      swift_bridgeObjectRelease();
      v9 = v23;
    }
    else
    {
      swift_bridgeObjectRelease();
      a2 = MEMORY[0x1E0DEE9D8];
    }
    (*(void (**)(char *, uint64_t))(v9 + 8))(v12, v8);
  }
  return a2;
}

uint64_t sub_1B2582DFC(void *a1)
{
  id v1;

  v1 = a1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EEFD72A8);
  return sub_1B25CCDCC();
}

void CommandRecognizer.deinit()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEFD7310);
  OUTLINED_FUNCTION_278_0(v1);
  swift_release();

  swift_release();
  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEFD72A8);
  OUTLINED_FUNCTION_278_0(v2);
  OUTLINED_FUNCTION_0();
}

uint64_t CommandRecognizer.__deallocating_deinit()
{
  CommandRecognizer.deinit();
  return swift_deallocClassInstance();
}

uint64_t sub_1B2582EEC()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 16) = v1;
  *v1 = v0;
  v1[1] = sub_1B2504888;
  return OUTLINED_FUNCTION_190_0();
}

uint64_t sub_1B2582F34(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, unint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, unsigned __int8 *a15, uint64_t a16, uint64_t a17, uint64_t a18)
{
  return sub_1B2581B7C(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18);
}

uint64_t sub_1B2582F54()
{
  uint64_t v0;
  uint64_t v1;

  CommandRecognizer.compatibleAudioFormats.getter();
  return sub_1B2509308(*(uint64_t (**)(uint64_t))(v0 + 8), v0, v1);
}

uint64_t sub_1B2582F88()
{
  uint64_t v0;
  uint64_t v1;

  CommandRecognizer.availableCompatibleAudioFormats(clientID:)();
  return sub_1B2509308(*(uint64_t (**)(uint64_t))(v0 + 8), v0, v1);
}

uint64_t sub_1B2582FBC()
{
  return sub_1B2581A58();
}

uint64_t sub_1B2582FDC(void *a1)
{
  char v1;

  sub_1B2581AC8(a1);
  return v1 & 1;
}

void sub_1B2583000()
{
  sub_1B2581B34();
}

uint64_t sub_1B2583020()
{
  return sub_1B25CC73C() & 1;
}

id sub_1B258304C(uint64_t a1, uint64_t a2)
{
  void *v2;
  void *v3;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;

  v3 = v2;
  sub_1B24B3050(0, &qword_1EEFD73F0);
  sub_1B2584DC4();
  v5 = (void *)sub_1B25CCE2C();
  swift_bridgeObjectRelease();
  v6 = (void *)sub_1B25CC4F0();
  v7 = objc_msgSend(v3, sel_initWithSuites_resourceBaseURL_, v5, v6);

  v8 = sub_1B25CC538();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 8))(a2, v8);
  return v7;
}

uint64_t type metadata accessor for CommandRecognizer.Interpretation(uint64_t a1)
{
  return sub_1B24B1B88(a1, (uint64_t *)&unk_1EEFDADA0);
}

void sub_1B2583114()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;
  _QWORD *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  int64_t v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  int64_t v23;
  unint64_t v24;
  int64_t v25;
  uint64_t v26;
  uint64_t v27;
  int64_t v28;
  uint64_t v29;
  _QWORD *v30;
  int64_t v31;
  uint64_t v32;
  uint64_t v33;

  OUTLINED_FUNCTION_59_0();
  v2 = v1;
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v9 = OUTLINED_FUNCTION_32_4();
  v10 = *(_QWORD *)(v9 - 8);
  v12 = MEMORY[0x1E0C80A78](v9, v11);
  v14 = (char *)&v28 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v12, v15);
  v17 = (char *)&v28 - v16;
  v33 = v2;
  v32 = v2 + 64;
  OUTLINED_FUNCTION_31_8();
  if (!v6)
  {
    v19 = 0;
LABEL_34:
    v27 = v32;
    *v8 = v33;
    v8[1] = v27;
    v8[2] = ~v18;
    v8[3] = v19;
    v8[4] = v0;
    OUTLINED_FUNCTION_7_1();
    return;
  }
  if (!v4)
  {
    v19 = 0;
    goto LABEL_34;
  }
  if (v4 < 0)
  {
LABEL_36:
    __break(1u);
    goto LABEL_37;
  }
  v29 = v18;
  v30 = v8;
  v19 = 0;
  v20 = 0;
  v31 = (unint64_t)(63 - v18) >> 6;
  v28 = v31 - 1;
  if (!v0)
    goto LABEL_6;
LABEL_5:
  OUTLINED_FUNCTION_106_6();
  v22 = v21 | (v19 << 6);
  while (1)
  {
    ++v20;
    v26 = *(_QWORD *)(v10 + 72);
    sub_1B254E940(*(_QWORD *)(v33 + 48) + v26 * v22, (uint64_t)v14);
    sub_1B2584E14((uint64_t)v14, (uint64_t)v17, (uint64_t (*)(_QWORD))type metadata accessor for SpeechRecognizerSupportedFeatures);
    sub_1B2584E14((uint64_t)v17, v6, (uint64_t (*)(_QWORD))type metadata accessor for SpeechRecognizerSupportedFeatures);
    if (v20 == v4)
      goto LABEL_33;
    v6 += v26;
    if (v0)
      goto LABEL_5;
LABEL_6:
    v23 = v19 + 1;
    if (__OFADD__(v19, 1))
    {
      __break(1u);
      goto LABEL_36;
    }
    if (v23 >= v31)
      goto LABEL_29;
    v24 = *(_QWORD *)(v32 + 8 * v23);
    if (!v24)
      break;
LABEL_15:
    v0 = (v24 - 1) & v24;
    v22 = __clz(__rbit64(v24)) + (v23 << 6);
    v19 = v23;
  }
  v19 += 2;
  if (v23 + 1 >= v31)
  {
    v0 = 0;
    v19 = v23;
    goto LABEL_33;
  }
  v24 = *(_QWORD *)(v32 + 8 * v19);
  if (v24)
    goto LABEL_11;
  v25 = v23 + 2;
  if (v23 + 2 >= v31)
    goto LABEL_29;
  v24 = *(_QWORD *)(v32 + 8 * v25);
  if (v24)
    goto LABEL_14;
  v19 = v23 + 3;
  if (v23 + 3 >= v31)
  {
    v0 = 0;
    v19 = v23 + 2;
    goto LABEL_33;
  }
  v24 = *(_QWORD *)(v32 + 8 * v19);
  if (v24)
  {
LABEL_11:
    v23 = v19;
    goto LABEL_15;
  }
  v25 = v23 + 4;
  if (v23 + 4 >= v31)
  {
LABEL_29:
    v0 = 0;
LABEL_33:
    v18 = v29;
    v8 = v30;
    goto LABEL_34;
  }
  v24 = *(_QWORD *)(v32 + 8 * v25);
  if (v24)
  {
LABEL_14:
    v23 = v25;
    goto LABEL_15;
  }
  while (1)
  {
    v23 = v25 + 1;
    if (__OFADD__(v25, 1))
      break;
    if (v23 >= v31)
    {
      v0 = 0;
      v19 = v28;
      goto LABEL_33;
    }
    v24 = *(_QWORD *)(v32 + 8 * v23);
    ++v25;
    if (v24)
      goto LABEL_15;
  }
LABEL_37:
  __break(1u);
}

void sub_1B2583394()
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

  OUTLINED_FUNCTION_641();
  v6 = v5;
  v7 = v5 + 64;
  OUTLINED_FUNCTION_31_8();
  if (v9 && (v10 = v8) != 0)
  {
    if (v8 < 0)
    {
LABEL_30:
      __break(1u);
    }
    else
    {
      OUTLINED_FUNCTION_26_14();
      if (!v2)
        goto LABEL_6;
LABEL_5:
      OUTLINED_FUNCTION_73_9();
      while (1)
      {
        ++v1;
        *v0 = *(_QWORD *)(*(_QWORD *)(v6 + 56) + 8 * v11);
        if (v1 == v10)
        {
          swift_retain();
          goto LABEL_28;
        }
        ++v0;
        swift_retain();
        if (v2)
          goto LABEL_5;
LABEL_6:
        v12 = v4 + 1;
        if (__OFADD__(v4, 1))
        {
          __break(1u);
          goto LABEL_30;
        }
        if (v12 >= v3)
          goto LABEL_28;
        if (!*(_QWORD *)(v7 + 8 * v12))
        {
          v4 += 2;
          if (v12 + 1 >= v3)
            goto LABEL_28;
          if (!*(_QWORD *)(v7 + 8 * v4))
          {
            if (v12 + 2 >= v3)
              goto LABEL_28;
            if (!*(_QWORD *)(v7 + 8 * (v12 + 2)))
            {
              v4 = v12 + 3;
              if (v12 + 3 >= v3)
                goto LABEL_28;
              if (!*(_QWORD *)(v7 + 8 * v4))
              {
                v13 = v12 + 4;
                if (v12 + 4 >= v3)
                  goto LABEL_28;
                if (!*(_QWORD *)(v7 + 8 * v13))
                  break;
              }
            }
          }
        }
LABEL_14:
        OUTLINED_FUNCTION_41_13();
      }
      while (1)
      {
        v14 = v13 + 1;
        if (__OFADD__(v13, 1))
          break;
        if (v14 >= v3)
          goto LABEL_28;
        ++v13;
        if (*(_QWORD *)(v7 + 8 * v14))
          goto LABEL_14;
      }
    }
    __break(1u);
  }
  else
  {
LABEL_28:
    OUTLINED_FUNCTION_74_7();
    OUTLINED_FUNCTION_632();
  }
}

void sub_1B258350C()
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
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  id v17;

  OUTLINED_FUNCTION_641();
  v6 = v5;
  v7 = v5 + 56;
  OUTLINED_FUNCTION_31_8();
  if (v9 && (v10 = v8) != 0)
  {
    if (v8 < 0)
    {
LABEL_30:
      __break(1u);
    }
    else
    {
      OUTLINED_FUNCTION_26_14();
      if (!v2)
        goto LABEL_6;
LABEL_5:
      OUTLINED_FUNCTION_73_9();
      while (1)
      {
        ++v1;
        v13 = *(void **)(*(_QWORD *)(v6 + 48) + 8 * v11);
        *v0 = v13;
        if (v1 == v10)
        {
          v17 = v13;
          goto LABEL_28;
        }
        ++v0;
        v14 = v13;
        if (v2)
          goto LABEL_5;
LABEL_6:
        v12 = v4 + 1;
        if (__OFADD__(v4, 1))
        {
          __break(1u);
          goto LABEL_30;
        }
        if (v12 >= v3)
          goto LABEL_28;
        if (!*(_QWORD *)(v7 + 8 * v12))
        {
          v4 += 2;
          if (v12 + 1 >= v3)
            goto LABEL_28;
          if (!*(_QWORD *)(v7 + 8 * v4))
          {
            if (v12 + 2 >= v3)
              goto LABEL_28;
            if (!*(_QWORD *)(v7 + 8 * (v12 + 2)))
            {
              v4 = v12 + 3;
              if (v12 + 3 >= v3)
                goto LABEL_28;
              if (!*(_QWORD *)(v7 + 8 * v4))
              {
                v15 = v12 + 4;
                if (v12 + 4 >= v3)
                  goto LABEL_28;
                if (!*(_QWORD *)(v7 + 8 * v15))
                  break;
              }
            }
          }
        }
LABEL_14:
        OUTLINED_FUNCTION_41_13();
      }
      while (1)
      {
        v16 = v15 + 1;
        if (__OFADD__(v15, 1))
          break;
        if (v16 >= v3)
          goto LABEL_28;
        ++v15;
        if (*(_QWORD *)(v7 + 8 * v16))
          goto LABEL_14;
      }
    }
    __break(1u);
  }
  else
  {
LABEL_28:
    OUTLINED_FUNCTION_74_7();
    OUTLINED_FUNCTION_632();
  }
}

_QWORD *sub_1B2583684(_QWORD *result, _QWORD *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;
  uint64_t v8;

  if (!a2)
    goto LABEL_5;
  if (!a3)
  {
LABEL_6:
    v5 = a4;
LABEL_7:
    *result = a4;
    result[1] = a5;
    result[2] = v5;
    return (_QWORD *)a3;
  }
  if (a3 < 0)
    goto LABEL_20;
  if (a5 == a4)
  {
LABEL_5:
    a3 = 0;
    goto LABEL_6;
  }
  if (a5 < a4)
    goto LABEL_21;
  if (a5 > a4)
  {
    v5 = a4 + 1;
    *a2 = a4;
    v6 = a3 - 1;
    if (a3 == 1)
      goto LABEL_7;
    v7 = a2 + 1;
    while (v6)
    {
      if (a5 == v5)
      {
        v5 = a5;
        a3 = a5 - a4;
        goto LABEL_7;
      }
      if (v5 >= a5)
        goto LABEL_19;
      v8 = v5 + 1;
      *v7++ = v5++;
      if (!--v6)
      {
        v5 = v8;
        goto LABEL_7;
      }
    }
    __break(1u);
LABEL_19:
    __break(1u);
LABEL_20:
    __break(1u);
LABEL_21:
    __break(1u);
  }
  __break(1u);
  return result;
}

uint64_t sub_1B2583720(void *a1)
{
  id v1;
  void *v2;
  uint64_t v3;

  v1 = objc_msgSend(a1, sel_text);
  if (!v1)
    return 0;
  v2 = v1;
  v3 = sub_1B25CCA18();

  return v3;
}

uint64_t sub_1B2583780(uint64_t result, uint64_t a2, unint64_t a3, void (*a4)(uint64_t, _QWORD, uint64_t), _QWORD *a5, uint64_t *a6, uint64_t (*a7)(_BYTE *, uint64_t, unint64_t, uint64_t, uint64_t))
{
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  uint64_t v20;
  void (*v21)(_BYTE *, _QWORD);
  uint64_t *v22;
  uint64_t v23;
  _BYTE v24[32];

  v13 = result;
  v14 = a3 >> 62;
  if (a3 >> 62)
  {
    OUTLINED_FUNCTION_79_0();
    v15 = sub_1B25CD474();
    result = OUTLINED_FUNCTION_10_0();
    if (!v15)
      return OUTLINED_FUNCTION_38_0();
  }
  else
  {
    v15 = *(_QWORD *)((a3 & 0xFFFFFFFFFFFFF8) + 0x10);
    if (!v15)
      return OUTLINED_FUNCTION_38_0();
  }
  if (v13)
  {
    if (v14)
    {
      OUTLINED_FUNCTION_79_0();
      v16 = sub_1B25CD474();
      result = OUTLINED_FUNCTION_10_0();
      if (v16 <= a2)
      {
        if (v15 >= 1)
        {
          sub_1B24EBFA4(a5, a6);
          v18 = v17;
          OUTLINED_FUNCTION_79_0();
          for (i = 0; i != v15; ++i)
          {
            v20 = __swift_instantiateConcreteTypeFromMangledName(a6);
            v21 = (void (*)(_BYTE *, _QWORD))a7(v24, i, a3, v20, v18);
            v23 = *v22;
            swift_retain();
            v21(v24, 0);
            *(_QWORD *)(v13 + 8 * i) = v23;
          }
          OUTLINED_FUNCTION_10_0();
          return OUTLINED_FUNCTION_38_0();
        }
        goto LABEL_16;
      }
    }
    else
    {
      if (*(_QWORD *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10) <= a2)
      {
        a4((a3 & 0xFFFFFFFFFFFFFF8) + 32, *(_QWORD *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10), v13);
        return OUTLINED_FUNCTION_38_0();
      }
      __break(1u);
    }
    __break(1u);
LABEL_16:
    __break(1u);
  }
  __break(1u);
  return result;
}

uint64_t sub_1B2583900()
{
  sub_1B25CD3E4();
  sub_1B25CCAE4();
  sub_1B25CD3E4();
  return 0;
}

uint64_t type metadata accessor for CommandRecognizer.Argument(uint64_t a1)
{
  return sub_1B24B1B88(a1, (uint64_t *)&unk_1EEFDADB0);
}

unint64_t sub_1B25839AC()
{
  unint64_t result;

  result = qword_1EEFDAD78[0];
  if (!qword_1EEFDAD78[0])
  {
    result = MEMORY[0x1B5E261DC](&protocol conformance descriptor for CommandRecognizer.Argument.Presence, &type metadata for CommandRecognizer.Argument.Presence);
    atomic_store(result, qword_1EEFDAD78);
  }
  return result;
}

void sub_1B25839E8(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;

  sub_1B2531930(&qword_1EEFD6F20, (void (*)(uint64_t))type metadata accessor for CommandRecognizer);
  *(_QWORD *)(a1 + 8) = v2;
  sub_1B2531930(&qword_1EEFD6F28, (void (*)(uint64_t))type metadata accessor for CommandRecognizer);
  *(_QWORD *)(a1 + 16) = v3;
}

uint64_t type metadata accessor for CommandRecognizer(uint64_t a1)
{
  return sub_1B24B1B88(a1, (uint64_t *)&unk_1EEFD6F30);
}

void sub_1B2583A58(uint64_t a1)
{
  uint64_t v2;

  sub_1B2531930(&qword_1EEFD6F28, (void (*)(uint64_t))type metadata accessor for CommandRecognizer);
  *(_QWORD *)(a1 + 8) = v2;
}

_UNKNOWN **sub_1B2583A94()
{
  return &protocol witness table for CommandRecognizer.Result;
}

uint64_t sub_1B2583AA0()
{
  return swift_getOpaqueTypeConformance2();
}

void sub_1B2583AB0()
{
  unint64_t v0;
  unint64_t v1;

  sub_1B2583B8C(319, &qword_1EEFD68A0, (uint64_t (*)(uint64_t, ValueMetadata *, uint64_t, _QWORD))MEMORY[0x1E0DF0AD0]);
  if (v0 <= 0x3F)
  {
    sub_1B2583B8C(319, &qword_1EEFD72B0, MEMORY[0x1E0DF0A78]);
    if (v1 <= 0x3F)
      swift_updateClassMetadata2();
  }
}

uint64_t method lookup function for CommandRecognizer()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of CommandRecognizer.__allocating_init(transcriber:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 120))();
}

uint64_t dispatch thunk of CommandRecognizer.__allocating_init(transcriber:activeSet:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 128))();
}

void sub_1B2583B8C(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t, ValueMetadata *, uint64_t, _QWORD))
{
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;

  if (!*a2)
  {
    v6 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1ED36D060);
    v7 = a3(a1, &type metadata for CommandRecognizer.Result, v6, MEMORY[0x1E0DEDB38]);
    if (!v8)
      atomic_store(v7, a2);
  }
}

uint64_t destroy for CommandRecognizer.Result()
{
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for CommandRecognizer.Result(uint64_t a1, uint64_t a2)
{
  __int128 v3;
  __int128 v4;
  uint64_t v5;

  v3 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v3;
  v4 = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 48) = v4;
  v5 = *(_QWORD *)(a2 + 72);
  *(_QWORD *)(a1 + 64) = *(_QWORD *)(a2 + 64);
  *(_QWORD *)(a1 + 72) = v5;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for CommandRecognizer.Result(uint64_t a1, uint64_t a2)
{
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_DWORD *)(a1 + 8) = *(_DWORD *)(a2 + 8);
  *(_DWORD *)(a1 + 12) = *(_DWORD *)(a2 + 12);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  *(_DWORD *)(a1 + 32) = *(_DWORD *)(a2 + 32);
  *(_DWORD *)(a1 + 36) = *(_DWORD *)(a2 + 36);
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  *(_DWORD *)(a1 + 56) = *(_DWORD *)(a2 + 56);
  *(_DWORD *)(a1 + 60) = *(_DWORD *)(a2 + 60);
  *(_QWORD *)(a1 + 64) = *(_QWORD *)(a2 + 64);
  *(_QWORD *)(a1 + 72) = *(_QWORD *)(a2 + 72);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

void *__swift_memcpy80_8(void *a1, const void *a2)
{
  return memcpy(a1, a2, 0x50uLL);
}

uint64_t assignWithTake for CommandRecognizer.Result(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 56) = *(_QWORD *)(a2 + 56);
  v3 = *(_QWORD *)(a2 + 72);
  *(_QWORD *)(a1 + 64) = *(_QWORD *)(a2 + 64);
  *(_QWORD *)(a1 + 72) = v3;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for CommandRecognizer.Result(uint64_t a1, int a2)
{
  unint64_t v2;

  if (a2)
  {
    if (a2 < 0 && *(_BYTE *)(a1 + 80))
    {
      LODWORD(v2) = *(_DWORD *)a1 + 0x7FFFFFFF;
    }
    else
    {
      v2 = *(_QWORD *)(a1 + 72);
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

uint64_t storeEnumTagSinglePayload for CommandRecognizer.Result(uint64_t result, int a2, int a3)
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
      *(_QWORD *)(result + 72) = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 80) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

void type metadata accessor for CommandRecognizer.Result()
{
  OUTLINED_FUNCTION_239_0();
}

void type metadata accessor for CommandRecognizer.ActiveSet()
{
  OUTLINED_FUNCTION_239_0();
}

uint64_t *initializeBufferWithCopyOfBuffer for CommandRecognizer.Interpretation(uint64_t *a1, uint64_t *a2, int *a3)
{
  int v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  _QWORD *v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  char *v17;
  uint64_t v18;
  void (*v19)(char *, char *, uint64_t);

  v5 = *(_DWORD *)(*((_QWORD *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v9 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v9 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    v7 = sub_1B25CC61C();
    if (__swift_getEnumTagSinglePayload((uint64_t)a2, 1, v7))
    {
      v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEFD6998);
      memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v8 - 8) + 64));
    }
    else
    {
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a1, a2, v7);
      __swift_storeEnumTagSinglePayload((uint64_t)a1, 0, 1, v7);
    }
    v10 = a3[5];
    v11 = a3[6];
    v12 = (uint64_t *)((char *)a1 + v10);
    v13 = (uint64_t *)((char *)a2 + v10);
    v14 = v13[1];
    *v12 = *v13;
    v12[1] = v14;
    *(uint64_t *)((char *)a1 + v11) = *(uint64_t *)((char *)a2 + v11);
    v15 = a3[8];
    *(_OWORD *)((char *)a1 + a3[7]) = *(_OWORD *)((char *)a2 + a3[7]);
    v16 = (char *)a1 + v15;
    v17 = (char *)a2 + v15;
    v18 = sub_1B25CC748();
    v19 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v18 - 8) + 16);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v19(v16, v17, v18);
    *(uint64_t *)((char *)a1 + a3[9]) = *(uint64_t *)((char *)a2 + a3[9]);
    swift_bridgeObjectRetain();
  }
  return a1;
}

uint64_t destroy for CommandRecognizer.Interpretation(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v4 = sub_1B25CC61C();
  if (!__swift_getEnumTagSinglePayload(a1, 1, v4))
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(a1, v4);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v5 = a1 + *(int *)(a2 + 32);
  v6 = sub_1B25CC748();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 8))(v5, v6);
  return swift_bridgeObjectRelease();
}

char *initializeWithCopy for CommandRecognizer.Interpretation(char *a1, char *a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  char *v15;
  uint64_t v16;
  void (*v17)(char *, char *, uint64_t);

  v6 = sub_1B25CC61C();
  if (__swift_getEnumTagSinglePayload((uint64_t)a2, 1, v6))
  {
    v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEFD6998);
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v7 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(a1, a2, v6);
    __swift_storeEnumTagSinglePayload((uint64_t)a1, 0, 1, v6);
  }
  v8 = a3[5];
  v9 = a3[6];
  v10 = &a1[v8];
  v11 = &a2[v8];
  v12 = *((_QWORD *)v11 + 1);
  *(_QWORD *)v10 = *(_QWORD *)v11;
  *((_QWORD *)v10 + 1) = v12;
  *(_QWORD *)&a1[v9] = *(_QWORD *)&a2[v9];
  v13 = a3[8];
  *(_OWORD *)&a1[a3[7]] = *(_OWORD *)&a2[a3[7]];
  v14 = &a1[v13];
  v15 = &a2[v13];
  v16 = sub_1B25CC748();
  v17 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v16 - 8) + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v17(v14, v15, v16);
  *(_QWORD *)&a1[a3[9]] = *(_QWORD *)&a2[a3[9]];
  swift_bridgeObjectRetain();
  return a1;
}

char *assignWithCopy for CommandRecognizer.Interpretation(char *a1, char *a2, int *a3)
{
  uint64_t v6;
  int EnumTagSinglePayload;
  int v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  char *v13;
  uint64_t v14;
  char *v15;
  char *v16;
  uint64_t v17;
  char *v18;
  char *v19;
  uint64_t v20;

  v6 = sub_1B25CC61C();
  EnumTagSinglePayload = __swift_getEnumTagSinglePayload((uint64_t)a1, 1, v6);
  v8 = __swift_getEnumTagSinglePayload((uint64_t)a2, 1, v6);
  if (!EnumTagSinglePayload)
  {
    v9 = *(_QWORD *)(v6 - 8);
    if (!v8)
    {
      (*(void (**)(char *, char *, uint64_t))(v9 + 24))(a1, a2, v6);
      goto LABEL_7;
    }
    (*(void (**)(char *, uint64_t))(v9 + 8))(a1, v6);
    goto LABEL_6;
  }
  if (v8)
  {
LABEL_6:
    v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEFD6998);
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v10 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(a1, a2, v6);
  __swift_storeEnumTagSinglePayload((uint64_t)a1, 0, 1, v6);
LABEL_7:
  v11 = a3[5];
  v12 = &a1[v11];
  v13 = &a2[v11];
  *(_QWORD *)v12 = *(_QWORD *)v13;
  *((_QWORD *)v12 + 1) = *((_QWORD *)v13 + 1);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)&a1[a3[6]] = *(_QWORD *)&a2[a3[6]];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v14 = a3[7];
  v15 = &a1[v14];
  v16 = &a2[v14];
  *(_QWORD *)v15 = *(_QWORD *)v16;
  *((_QWORD *)v15 + 1) = *((_QWORD *)v16 + 1);
  v17 = a3[8];
  v18 = &a1[v17];
  v19 = &a2[v17];
  v20 = sub_1B25CC748();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v20 - 8) + 24))(v18, v19, v20);
  *(_QWORD *)&a1[a3[9]] = *(_QWORD *)&a2[a3[9]];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

char *initializeWithTake for CommandRecognizer.Interpretation(char *a1, char *a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  char *v11;
  uint64_t v12;

  v6 = sub_1B25CC61C();
  if (__swift_getEnumTagSinglePayload((uint64_t)a2, 1, v6))
  {
    v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEFD6998);
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v7 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v6 - 8) + 32))(a1, a2, v6);
    __swift_storeEnumTagSinglePayload((uint64_t)a1, 0, 1, v6);
  }
  v8 = a3[6];
  *(_OWORD *)&a1[a3[5]] = *(_OWORD *)&a2[a3[5]];
  *(_QWORD *)&a1[v8] = *(_QWORD *)&a2[v8];
  v9 = a3[8];
  *(_OWORD *)&a1[a3[7]] = *(_OWORD *)&a2[a3[7]];
  v10 = &a1[v9];
  v11 = &a2[v9];
  v12 = sub_1B25CC748();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v12 - 8) + 32))(v10, v11, v12);
  *(_QWORD *)&a1[a3[9]] = *(_QWORD *)&a2[a3[9]];
  return a1;
}

char *assignWithTake for CommandRecognizer.Interpretation(char *a1, char *a2, int *a3)
{
  uint64_t v6;
  int EnumTagSinglePayload;
  int v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  char *v18;
  uint64_t v19;

  v6 = sub_1B25CC61C();
  EnumTagSinglePayload = __swift_getEnumTagSinglePayload((uint64_t)a1, 1, v6);
  v8 = __swift_getEnumTagSinglePayload((uint64_t)a2, 1, v6);
  if (!EnumTagSinglePayload)
  {
    v9 = *(_QWORD *)(v6 - 8);
    if (!v8)
    {
      (*(void (**)(char *, char *, uint64_t))(v9 + 40))(a1, a2, v6);
      goto LABEL_7;
    }
    (*(void (**)(char *, uint64_t))(v9 + 8))(a1, v6);
    goto LABEL_6;
  }
  if (v8)
  {
LABEL_6:
    v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEFD6998);
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v10 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v6 - 8) + 32))(a1, a2, v6);
  __swift_storeEnumTagSinglePayload((uint64_t)a1, 0, 1, v6);
LABEL_7:
  v11 = a3[5];
  v12 = &a1[v11];
  v13 = &a2[v11];
  v15 = *(_QWORD *)v13;
  v14 = *((_QWORD *)v13 + 1);
  *(_QWORD *)v12 = v15;
  *((_QWORD *)v12 + 1) = v14;
  swift_bridgeObjectRelease();
  *(_QWORD *)&a1[a3[6]] = *(_QWORD *)&a2[a3[6]];
  swift_bridgeObjectRelease();
  v16 = a3[8];
  *(_OWORD *)&a1[a3[7]] = *(_OWORD *)&a2[a3[7]];
  v17 = &a1[v16];
  v18 = &a2[v16];
  v19 = sub_1B25CC748();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v19 - 8) + 40))(v17, v18, v19);
  *(_QWORD *)&a1[a3[9]] = *(_QWORD *)&a2[a3[9]];
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for CommandRecognizer.Interpretation()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

void sub_1B258451C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEFD6998);
  if (*(_DWORD *)(*(_QWORD *)(v6 - 8) + 84) == (_DWORD)a2)
  {
    v7 = v6;
    v8 = a1;
  }
  else
  {
    if ((_DWORD)a2 == 0x7FFFFFFF)
    {
      OUTLINED_FUNCTION_37_0(*(_QWORD *)(a1 + *(int *)(a3 + 20) + 8));
      OUTLINED_FUNCTION_262();
      return;
    }
    v7 = OUTLINED_FUNCTION_9_14();
    v8 = a1 + *(int *)(a3 + 32);
  }
  OUTLINED_FUNCTION_11_0(v8, a2, v7);
}

uint64_t storeEnumTagSinglePayload for CommandRecognizer.Interpretation()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

void sub_1B25845AC(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEFD6998);
  if (*(_DWORD *)(*(_QWORD *)(v8 - 8) + 84) == a3)
  {
    v9 = v8;
    v10 = a1;
  }
  else
  {
    if (a3 == 0x7FFFFFFF)
    {
      *(_QWORD *)(a1 + *(int *)(a4 + 20) + 8) = (a2 - 1);
      OUTLINED_FUNCTION_262();
      return;
    }
    v9 = OUTLINED_FUNCTION_9_14();
    v10 = a1 + *(int *)(a4 + 32);
  }
  OUTLINED_FUNCTION_12_0(v10, a2, a2, v9);
}

void sub_1B2584638()
{
  unint64_t v0;
  unint64_t v1;

  sub_1B25846DC();
  if (v0 <= 0x3F)
  {
    sub_1B25CC748();
    if (v1 <= 0x3F)
      swift_initStructMetadata();
  }
}

void sub_1B25846DC()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_1EEFD67F8)
  {
    sub_1B25CC61C();
    v0 = sub_1B25CD108();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_1EEFD67F8);
  }
}

uint64_t *initializeBufferWithCopyOfBuffer for CommandRecognizer.Argument(uint64_t *a1, uint64_t *a2, uint64_t a3)
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

  v4 = a1;
  v5 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v13 = *a2;
    *v4 = *a2;
    v4 = (uint64_t *)(v13 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    *(_BYTE *)a1 = *(_BYTE *)a2;
    v7 = a2[2];
    a1[1] = a2[1];
    a1[2] = v7;
    v8 = *(int *)(a3 + 24);
    v9 = (char *)a1 + v8;
    v10 = (char *)a2 + v8;
    v11 = sub_1B25CC748();
    v12 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v11 - 8) + 16);
    swift_bridgeObjectRetain();
    v12(v9, v10, v11);
    v12((char *)v4 + *(int *)(a3 + 28), (char *)a2 + *(int *)(a3 + 28), v11);
  }
  return v4;
}

uint64_t destroy for CommandRecognizer.Argument(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  void (*v7)(uint64_t, uint64_t);

  swift_bridgeObjectRelease();
  v4 = a1 + *(int *)(a2 + 24);
  v5 = sub_1B25CC748();
  v7 = *(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8);
  v7(v4, v5);
  return ((uint64_t (*)(uint64_t, uint64_t))v7)(a1 + *(int *)(a2 + 28), v5);
}

uint64_t initializeWithCopy for CommandRecognizer.Argument(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(uint64_t, uint64_t, uint64_t);

  *(_BYTE *)a1 = *(_BYTE *)a2;
  v6 = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  *(_QWORD *)(a1 + 16) = v6;
  v7 = *(int *)(a3 + 24);
  v8 = a1 + v7;
  v9 = a2 + v7;
  v10 = sub_1B25CC748();
  v11 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 16);
  swift_bridgeObjectRetain();
  v11(v8, v9, v10);
  v11(a1 + *(int *)(a3 + 28), a2 + *(int *)(a3 + 28), v10);
  return a1;
}

uint64_t assignWithCopy for CommandRecognizer.Argument(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(uint64_t, uint64_t, uint64_t);

  *(_BYTE *)a1 = *(_BYTE *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v6 = *(int *)(a3 + 24);
  v7 = a1 + v6;
  v8 = a2 + v6;
  v9 = sub_1B25CC748();
  v10 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 24);
  v10(v7, v8, v9);
  v10(a1 + *(int *)(a3 + 28), a2 + *(int *)(a3 + 28), v9);
  return a1;
}

uint64_t initializeWithTake for CommandRecognizer.Argument(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(uint64_t, uint64_t, uint64_t);

  *(_BYTE *)a1 = *(_BYTE *)a2;
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  v6 = *(int *)(a3 + 24);
  v7 = a1 + v6;
  v8 = a2 + v6;
  v9 = sub_1B25CC748();
  v10 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 32);
  v10(v7, v8, v9);
  v10(a1 + *(int *)(a3 + 28), a2 + *(int *)(a3 + 28), v9);
  return a1;
}

uint64_t assignWithTake for CommandRecognizer.Argument(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(uint64_t, uint64_t, uint64_t);

  *(_BYTE *)a1 = *(_BYTE *)a2;
  v6 = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  *(_QWORD *)(a1 + 16) = v6;
  swift_bridgeObjectRelease();
  v7 = *(int *)(a3 + 24);
  v8 = a1 + v7;
  v9 = a2 + v7;
  v10 = sub_1B25CC748();
  v11 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 40);
  v11(v8, v9, v10);
  v11(a1 + *(int *)(a3 + 28), a2 + *(int *)(a3 + 28), v10);
  return a1;
}

uint64_t getEnumTagSinglePayload for CommandRecognizer.Argument()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

void sub_1B2584AF4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;

  if ((_DWORD)a2 == 0x7FFFFFFF)
  {
    OUTLINED_FUNCTION_37_0(*(_QWORD *)(a1 + 16));
    OUTLINED_FUNCTION_262();
  }
  else
  {
    v6 = OUTLINED_FUNCTION_9_14();
    OUTLINED_FUNCTION_11_0(a1 + *(int *)(a3 + 24), a2, v6);
  }
}

uint64_t storeEnumTagSinglePayload for CommandRecognizer.Argument()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

void sub_1B2584B54(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v7;

  if (a3 == 0x7FFFFFFF)
  {
    *(_QWORD *)(a1 + 16) = (a2 - 1);
    OUTLINED_FUNCTION_262();
  }
  else
  {
    v7 = OUTLINED_FUNCTION_9_14();
    OUTLINED_FUNCTION_12_0(a1 + *(int *)(a4 + 24), a2, a2, v7);
  }
}

uint64_t sub_1B2584BAC()
{
  uint64_t result;
  unint64_t v1;

  result = sub_1B25CC748();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t storeEnumTagSinglePayload for CommandRecognizer.Argument.Presence(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_1B2584C74 + 4 * byte_1B25E1035[v4]))();
  *a1 = a2 + 3;
  return ((uint64_t (*)(void))((char *)sub_1B2584CA8 + 4 * byte_1B25E1030[v4]))();
}

uint64_t sub_1B2584CA8(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_1B2584CB0(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x1B2584CB8);
  return result;
}

uint64_t sub_1B2584CC4(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x1B2584CCCLL);
  *(_BYTE *)result = a2 + 3;
  return result;
}

uint64_t sub_1B2584CD0(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1B2584CD8(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

void type metadata accessor for CommandRecognizer.Argument.Presence()
{
  OUTLINED_FUNCTION_239_0();
}

void sub_1B2584CF0()
{
  sub_1B24EBFA4(&qword_1EEFDADC0, &qword_1EEFD7310);
}

uint64_t sub_1B2584D1C@<X0>(void **a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;

  return sub_1B25823F4(a1, *(uint64_t **)(v2 + 16), *(_QWORD *)(v2 + 24), a2);
}

void sub_1B2584D38(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v5 = OUTLINED_FUNCTION_360(a1, a2, a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(v3, v4, v5);
  OUTLINED_FUNCTION_0();
}

uint64_t (*sub_1B2584D6C(_QWORD *a1, uint64_t a2))(_QWORD, _QWORD)
{
  *a1 = a2;
  return nullsub_1;
}

uint64_t sub_1B2584D84()
{
  return sub_1B2583020() & 1;
}

uint64_t sub_1B2584DA8()
{
  return sub_1B2584D84() & 1;
}

unint64_t sub_1B2584DC4()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1EEFD73F8;
  if (!qword_1EEFD73F8)
  {
    sub_1B24B3050(255, &qword_1EEFD73F0);
    result = MEMORY[0x1B5E261DC](MEMORY[0x1E0DEFCF8], v1);
    atomic_store(result, (unint64_t *)&qword_1EEFD73F8);
  }
  return result;
}

void sub_1B2584E14(uint64_t a1, uint64_t a2, uint64_t (*a3)(_QWORD))
{
  uint64_t v3;

  v3 = a3(0);
  OUTLINED_FUNCTION_33_10(v3);
  OUTLINED_FUNCTION_0();
}

void sub_1B2584E40(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v3;

  v3 = OUTLINED_FUNCTION_360(a1, a2, a3);
  OUTLINED_FUNCTION_33_10(v3);
  OUTLINED_FUNCTION_0();
}

uint64_t sub_1B2584E60()
{
  swift_unknownObjectRelease();
  swift_release();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_1B2584E94(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;

  v4 = v1[2];
  v5 = v1[3];
  v7 = v1[4];
  v6 = v1[5];
  v8 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v8;
  *v8 = v2;
  v8[1] = sub_1B2508AAC;
  return sub_1B2581A6C(a1, v4, v5, v7, v6);
}

uint64_t OUTLINED_FUNCTION_9_14()
{
  return sub_1B25CC748();
}

uint64_t OUTLINED_FUNCTION_12_14()
{
  return swift_isUniquelyReferenced_nonNull_native();
}

uint64_t OUTLINED_FUNCTION_25_16()
{
  return type metadata accessor for CommandRecognizer.Interpretation(0);
}

uint64_t OUTLINED_FUNCTION_32_15()
{
  uint64_t v0;

  return v0 + 32;
}

uint64_t OUTLINED_FUNCTION_33_10(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(a1 - 8) + 32))(v1, v2, a1);
}

uint64_t OUTLINED_FUNCTION_35_14@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 32))(v1 + a1, v2, v3);
}

uint64_t OUTLINED_FUNCTION_39_8()
{
  return sub_1B25CD6A8();
}

void OUTLINED_FUNCTION_40_7(uint64_t a1)
{
  uint64_t *v1;

  sub_1B24EBD4C(a1, v1);
}

uint64_t OUTLINED_FUNCTION_44_11()
{
  return 0;
}

uint64_t OUTLINED_FUNCTION_47_12()
{
  return sub_1B25CCDE4();
}

uint64_t OUTLINED_FUNCTION_49_11()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 8))(v0, v1);
}

uint64_t OUTLINED_FUNCTION_52_12()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(v0 + 32) = v1;
  return sub_1B25CCBBC();
}

uint64_t OUTLINED_FUNCTION_54_9()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_58_10()
{
  uint64_t v0;

  return v0;
}

void OUTLINED_FUNCTION_59_9(uint64_t a1, uint64_t a2)
{
  uint64_t *v2;

  sub_1B2584D38(a1, a2, v2);
}

void OUTLINED_FUNCTION_60_5(uint64_t a1, uint64_t a2)
{
  uint64_t (*v2)(_QWORD);

  sub_1B2584E14(a1, a2, v2);
}

uint64_t OUTLINED_FUNCTION_63_10()
{
  return sub_1B25CCB44();
}

uint64_t OUTLINED_FUNCTION_64_12()
{
  uint64_t v0;

  return sub_1B254E8C4(v0);
}

uint64_t OUTLINED_FUNCTION_66_4(uint64_t a1)
{
  uint64_t v1;

  return __swift_getEnumTagSinglePayload(a1, 1, v1);
}

uint64_t OUTLINED_FUNCTION_67_10(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t result;

  result = __swift_storeEnumTagSinglePayload(v1, 1, 1, a1);
  *(_QWORD *)(v2 - 96) = v1;
  return result;
}

void OUTLINED_FUNCTION_68_9(uint64_t a1, uint64_t *a2)
{
  uint64_t v2;

  sub_1B24EBD4C(v2, a2);
}

uint64_t OUTLINED_FUNCTION_72_10()
{
  return 0;
}

uint64_t OUTLINED_FUNCTION_74_7()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  *v0 = v1;
  v0[1] = v3;
  v0[2] = ~v4;
  v0[3] = v6;
  v0[4] = v5;
  return v2;
}

uint64_t OUTLINED_FUNCTION_75_12(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v2 + 104))(v3, a2, v4);
}

uint64_t OUTLINED_FUNCTION_79_5()
{
  return sub_1B25CCAE4();
}

uint64_t OUTLINED_FUNCTION_80_9()
{
  return sub_1B25CC940();
}

uint64_t OUTLINED_FUNCTION_88_6()
{
  return type metadata accessor for CommandRecognizer.Argument(0);
}

uint64_t OUTLINED_FUNCTION_94_9()
{
  return sub_1B25CCAE4();
}

uint64_t OUTLINED_FUNCTION_95_7()
{
  return type metadata accessor for CommandRecognizer.Argument(0);
}

uint64_t OUTLINED_FUNCTION_96_7()
{
  return sub_1B25CCAE4();
}

uint64_t OUTLINED_FUNCTION_97_6()
{
  uint64_t v0;
  uint64_t v1;

  return sub_1B254E940(v0, v1);
}

uint64_t OUTLINED_FUNCTION_99_6()
{
  return sub_1B25CCAE4();
}

uint64_t OUTLINED_FUNCTION_100_5(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t (*v4)(uint64_t, uint64_t, uint64_t);

  return v4(v3, a2, v2);
}

void sub_1B2585334()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v0 = sub_1B25CD108();
  v2 = MEMORY[0x1E0C80A78](v0, v1);
  v4 = MEMORY[0x1E0C80A78](v2, v3);
  MEMORY[0x1E0C80A78](v4, v5);
  type metadata accessor for ZipStorage();
}

void sub_1B2585418(uint64_t a1)
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

  *(_QWORD *)(v11 - 136) = a1;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v9 + 16))(v8, v3, v7);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v10 + 16))(v5, v3 + *(int *)(v4 + 68), v6);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v1 - 8) + 16))(v2, v3 + *(int *)(v4 + 72), v1);
  __swift_storeEnumTagSinglePayload(v2, 0, 1, v1);
  sub_1B25799B0(v8, v5, v2);
}

void sub_1B25854B0()
{
  type metadata accessor for AsyncZip3Sequence.Iterator.InternalClass();
}

uint64_t sub_1B25854E4()
{
  uint64_t v0;

  return sub_1B2518FA8(v0);
}

void type metadata accessor for AsyncZip3Sequence.Iterator.InternalClass()
{
  JUMPOUT(0x1B5E26140);
}

uint64_t sub_1B258550C()
{
  uint64_t result;
  unint64_t v1;
  unint64_t v2;
  unint64_t v3;

  result = swift_checkMetadataState();
  if (v1 <= 0x3F)
  {
    result = swift_checkMetadataState();
    if (v2 <= 0x3F)
    {
      result = swift_checkMetadataState();
      if (v3 <= 0x3F)
      {
        swift_initStructMetadata();
        return 0;
      }
    }
  }
  return result;
}

uint64_t *sub_1B25855B8(uint64_t *a1, uint64_t *a2, _QWORD *a3)
{
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  int v13;
  uint64_t v14;
  unint64_t v15;
  int v16;
  uint64_t v17;
  int v18;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  uint64_t v25;

  v4 = a1;
  v5 = a3[3];
  v6 = *(_QWORD *)(a3[2] - 8);
  v7 = *(_QWORD *)(v5 - 8);
  v8 = *(_DWORD *)(v7 + 80);
  v9 = v8;
  v10 = *(_QWORD *)(v6 + 64) + v8;
  v11 = *(_QWORD *)(v7 + 64);
  v12 = *(_QWORD *)(a3[4] - 8);
  v13 = *(_DWORD *)(v12 + 80);
  v14 = v13;
  v15 = ((v11 + v13 + (v10 & ~(unint64_t)v8)) & ~(unint64_t)v13)
      + *(_QWORD *)(v12 + 64);
  v16 = v8 | *(_DWORD *)(v6 + 80) | v13;
  v17 = v16;
  v18 = v16 & 0x100000;
  if (v17 <= 7 && v15 <= 0x18 && v18 == 0)
  {
    v22 = ~v9;
    v25 = a3[4];
    (*(void (**)(uint64_t *, uint64_t *))(v6 + 16))(a1, a2);
    v23 = ((unint64_t)a2 + v10) & v22;
    (*(void (**)(unint64_t, unint64_t, uint64_t))(v7 + 16))(((unint64_t)v4 + v10) & v22, v23, v5);
    (*(void (**)(unint64_t, unint64_t, uint64_t))(v12 + 16))(((((unint64_t)v4 + v10) & v22) + v11 + v14) & ~v14, (v23 + v11 + v14) & ~v14, v25);
  }
  else
  {
    v21 = *a2;
    *v4 = *a2;
    v4 = (uint64_t *)(v21 + ((v17 + 16) & ~v17));
    swift_retain();
  }
  return v4;
}

uint64_t sub_1B25856F0(uint64_t a1, _QWORD *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;

  v4 = *(_QWORD *)(a2[2] - 8);
  (*(void (**)(void))(v4 + 8))();
  v5 = *(_QWORD *)(v4 + 64) + a1;
  v6 = *(_QWORD *)(a2[3] - 8);
  v7 = (v5 + *(unsigned __int8 *)(v6 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80);
  (*(void (**)(unint64_t))(v6 + 8))(v7);
  return (*(uint64_t (**)(unint64_t))(*(_QWORD *)(a2[4] - 8) + 8))((v7
                                                                                       + *(_QWORD *)(v6 + 64)
                                                                                       + *(unsigned __int8 *)(*(_QWORD *)(a2[4] - 8) + 80)) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(a2[4] - 8) + 80));
}

uint64_t sub_1B2585770(uint64_t a1, uint64_t a2, _QWORD *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v6 = *(_QWORD *)(a3[2] - 8);
  (*(void (**)(void))(v6 + 16))();
  v7 = *(_QWORD *)(a3[3] - 8);
  v8 = *(unsigned __int8 *)(v7 + 80);
  v9 = *(_QWORD *)(v6 + 64) + v8;
  v10 = (v9 + a1) & ~v8;
  v11 = (v9 + a2) & ~v8;
  (*(void (**)(uint64_t, uint64_t))(v7 + 16))(v10, v11);
  v12 = *(_QWORD *)(a3[4] - 8);
  (*(void (**)(unint64_t, unint64_t))(v12 + 16))((*(_QWORD *)(v7 + 64) + *(unsigned __int8 *)(v12 + 80) + v10) & ~(unint64_t)*(unsigned __int8 *)(v12 + 80), (*(_QWORD *)(v7 + 64) + *(unsigned __int8 *)(v12 + 80) + v11) & ~(unint64_t)*(unsigned __int8 *)(v12 + 80));
  return a1;
}

uint64_t sub_1B2585818(uint64_t a1, uint64_t a2, _QWORD *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v6 = *(_QWORD *)(a3[2] - 8);
  (*(void (**)(void))(v6 + 24))();
  v7 = *(_QWORD *)(a3[3] - 8);
  v8 = *(unsigned __int8 *)(v7 + 80);
  v9 = *(_QWORD *)(v6 + 64) + v8;
  v10 = (v9 + a1) & ~v8;
  v11 = (v9 + a2) & ~v8;
  (*(void (**)(uint64_t, uint64_t))(v7 + 24))(v10, v11);
  v12 = *(_QWORD *)(a3[4] - 8);
  (*(void (**)(unint64_t, unint64_t))(v12 + 24))((*(_QWORD *)(v7 + 64) + *(unsigned __int8 *)(v12 + 80) + v10) & ~(unint64_t)*(unsigned __int8 *)(v12 + 80), (*(_QWORD *)(v7 + 64) + *(unsigned __int8 *)(v12 + 80) + v11) & ~(unint64_t)*(unsigned __int8 *)(v12 + 80));
  return a1;
}

uint64_t sub_1B25858C0(uint64_t a1, uint64_t a2, _QWORD *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v6 = *(_QWORD *)(a3[2] - 8);
  (*(void (**)(void))(v6 + 32))();
  v7 = *(_QWORD *)(a3[3] - 8);
  v8 = *(unsigned __int8 *)(v7 + 80);
  v9 = *(_QWORD *)(v6 + 64) + v8;
  v10 = (v9 + a1) & ~v8;
  v11 = (v9 + a2) & ~v8;
  (*(void (**)(uint64_t, uint64_t))(v7 + 32))(v10, v11);
  v12 = *(_QWORD *)(a3[4] - 8);
  (*(void (**)(unint64_t, unint64_t))(v12 + 32))((*(_QWORD *)(v7 + 64) + *(unsigned __int8 *)(v12 + 80) + v10) & ~(unint64_t)*(unsigned __int8 *)(v12 + 80), (*(_QWORD *)(v7 + 64) + *(unsigned __int8 *)(v12 + 80) + v11) & ~(unint64_t)*(unsigned __int8 *)(v12 + 80));
  return a1;
}

uint64_t sub_1B2585968(uint64_t a1, uint64_t a2, _QWORD *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v6 = *(_QWORD *)(a3[2] - 8);
  (*(void (**)(void))(v6 + 40))();
  v7 = *(_QWORD *)(a3[3] - 8);
  v8 = *(unsigned __int8 *)(v7 + 80);
  v9 = *(_QWORD *)(v6 + 64) + v8;
  v10 = (v9 + a1) & ~v8;
  v11 = (v9 + a2) & ~v8;
  (*(void (**)(uint64_t, uint64_t))(v7 + 40))(v10, v11);
  v12 = *(_QWORD *)(a3[4] - 8);
  (*(void (**)(unint64_t, unint64_t))(v12 + 40))((*(_QWORD *)(v7 + 64) + *(unsigned __int8 *)(v12 + 80) + v10) & ~(unint64_t)*(unsigned __int8 *)(v12 + 80), (*(_QWORD *)(v7 + 64) + *(unsigned __int8 *)(v12 + 80) + v11) & ~(unint64_t)*(unsigned __int8 *)(v12 + 80));
  return a1;
}

uint64_t sub_1B2585A10(uint64_t a1, unsigned int a2, _QWORD *a3)
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
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  int v19;
  uint64_t v20;
  char v21;
  int v22;
  unsigned int v23;
  int v24;
  int v25;

  v6 = a3[2];
  v5 = a3[3];
  v7 = *(_QWORD *)(v6 - 8);
  v8 = *(unsigned int *)(v7 + 84);
  v9 = *(_QWORD *)(v5 - 8);
  v10 = *(unsigned int *)(v9 + 84);
  if (v10 <= v8)
    v11 = *(_DWORD *)(v7 + 84);
  else
    v11 = *(_DWORD *)(v9 + 84);
  v12 = a3[4];
  v13 = *(_QWORD *)(v12 - 8);
  v14 = *(unsigned int *)(v13 + 84);
  if (v14 > v11)
    v11 = *(_DWORD *)(v13 + 84);
  if (!a2)
    return 0;
  v15 = *(unsigned __int8 *)(v9 + 80);
  v16 = *(_QWORD *)(v7 + 64) + v15;
  v17 = *(_QWORD *)(v9 + 64);
  v18 = *(unsigned __int8 *)(v13 + 80);
  v19 = a2 - v11;
  if (a2 <= v11)
    goto LABEL_25;
  v20 = ((v17 + v18 + (v16 & ~v15)) & ~v18) + *(_QWORD *)(v13 + 64);
  v21 = 8 * v20;
  if (v20 > 3)
    goto LABEL_9;
  v23 = ((v19 + ~(-1 << v21)) >> v21) + 1;
  if (HIWORD(v23))
  {
    v22 = *(_DWORD *)(a1 + v20);
    if (!v22)
      goto LABEL_25;
    goto LABEL_16;
  }
  if (v23 > 0xFF)
  {
    v22 = *(unsigned __int16 *)(a1 + v20);
    if (!*(_WORD *)(a1 + v20))
      goto LABEL_25;
    goto LABEL_16;
  }
  if (v23 >= 2)
  {
LABEL_9:
    v22 = *(unsigned __int8 *)(a1 + v20);
    if (!*(_BYTE *)(a1 + v20))
      goto LABEL_25;
LABEL_16:
    v24 = (v22 - 1) << v21;
    if (v20 > 3)
      v24 = 0;
    if (!(_DWORD)v20)
      return v11 + v24 + 1;
    if (v20 <= 3)
      v25 = v20;
    else
      v25 = 4;
    return ((uint64_t (*)(void))((char *)&loc_1B2585B10 + 4 * byte_1B25E1360[v25 - 1]))();
  }
LABEL_25:
  if (!v11)
    return 0;
  if ((_DWORD)v8 == v11)
  {
    v10 = v8;
    v5 = v6;
    return __swift_getEnumTagSinglePayload(a1, v10, v5);
  }
  a1 = (v16 + a1) & ~v15;
  if ((_DWORD)v10 == v11)
    return __swift_getEnumTagSinglePayload(a1, v10, v5);
  return __swift_getEnumTagSinglePayload((a1 + v17 + v18) & ~v18, v14, v12);
}

void sub_1B2585BA8(_WORD *a1, unsigned int a2, unsigned int a3, _QWORD *a4)
{
  uint64_t v5;
  uint64_t v6;
  unsigned int v7;
  uint64_t v8;
  size_t v9;
  char v10;
  unsigned int v11;
  unsigned int v12;
  unsigned int v13;
  int v14;

  v5 = *(_QWORD *)(a4[2] - 8);
  v6 = *(_QWORD *)(a4[3] - 8);
  if (*(_DWORD *)(v6 + 84) <= *(_DWORD *)(v5 + 84))
    v7 = *(_DWORD *)(v5 + 84);
  else
    v7 = *(_DWORD *)(v6 + 84);
  v8 = *(_QWORD *)(a4[4] - 8);
  if (*(_DWORD *)(v8 + 84) > v7)
    v7 = *(_DWORD *)(v8 + 84);
  v9 = ((*(_QWORD *)(v6 + 64)
       + *(unsigned __int8 *)(v8 + 80)
       + ((*(_QWORD *)(v5 + 64) + *(unsigned __int8 *)(v6 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80))) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80))
     + *(_QWORD *)(v8 + 64);
  v10 = 8 * v9;
  if (a3 > v7)
  {
    if (v9 <= 3)
    {
      v13 = ((a3 - v7 + ~(-1 << v10)) >> v10) + 1;
      if (HIWORD(v13))
      {
        v11 = 4u;
      }
      else if (v13 >= 0x100)
      {
        v11 = 2;
      }
      else
      {
        v11 = v13 > 1;
      }
    }
    else
    {
      v11 = 1u;
    }
  }
  else
  {
    v11 = 0u;
  }
  if (v7 < a2)
  {
    v12 = ~v7 + a2;
    if (v9 < 4)
    {
      if ((_DWORD)v9)
      {
        v14 = v12 & ~(-1 << v10);
        bzero(a1, v9);
        if ((_DWORD)v9 == 3)
        {
          *a1 = v14;
          *((_BYTE *)a1 + 2) = BYTE2(v14);
        }
        else if ((_DWORD)v9 == 2)
        {
          *a1 = v14;
        }
        else
        {
          *(_BYTE *)a1 = v14;
        }
      }
    }
    else
    {
      bzero(a1, v9);
      *(_DWORD *)a1 = v12;
    }
    __asm { BR              X10 }
  }
  __asm { BR              X5 }
}

void type metadata accessor for AsyncZip3Sequence()
{
  JUMPOUT(0x1B5E26140);
}

void type metadata accessor for AsyncZip3Sequence.Iterator()
{
  JUMPOUT(0x1B5E26140);
}

uint64_t sub_1B2585DF8()
{
  swift_getAssociatedTypeWitness();
  swift_getAssociatedConformanceWitness();
  return swift_getAssociatedConformanceWitness();
}

uint64_t sub_1B2585E88(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;

  v2[2] = a1;
  v2[3] = v1;
  v2[4] = OUTLINED_FUNCTION_3_9();
  v2[5] = OUTLINED_FUNCTION_3_9();
  v2[6] = OUTLINED_FUNCTION_3_9();
  v2[7] = sub_1B25CD108();
  v3 = OUTLINED_FUNCTION_0_4();
  v2[8] = v3;
  v4 = sub_1B25CD108();
  v2[9] = v4;
  v2[10] = *(_QWORD *)(v4 - 8);
  v2[11] = swift_task_alloc();
  v2[12] = *(_QWORD *)(v3 - 8);
  v2[13] = OUTLINED_FUNCTION_92();
  v2[14] = OUTLINED_FUNCTION_92();
  v2[15] = OUTLINED_FUNCTION_92();
  v2[16] = OUTLINED_FUNCTION_92();
  return swift_task_switch();
}

uint64_t sub_1B2585FA8()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 136) = v1;
  *v1 = v0;
  v1[1] = sub_1B2585FFC;
  return sub_1B2579B64(*(_QWORD *)(v0 + 88));
}

uint64_t sub_1B2585FFC()
{
  uint64_t v0;
  _QWORD *v1;
  _QWORD *v2;
  uint64_t v3;

  OUTLINED_FUNCTION_105();
  *v2 = *v1;
  *(_QWORD *)(v3 + 144) = v0;
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_1B2586058()
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
  uint64_t result;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void (*v30)(uint64_t, uint64_t);
  void (*v31)(uint64_t, uint64_t);
  void (*v32)(uint64_t, uint64_t);
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  void (*v38)(uint64_t, uint64_t, uint64_t);
  void (*v39)(uint64_t, uint64_t, uint64_t);
  void (*v40)(void);
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  void (*v44)(void);
  void (*v45)(uint64_t, uint64_t, uint64_t);
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

  v1 = *(_QWORD *)(v0 + 88);
  v2 = *(_QWORD *)(v0 + 64);
  if (__swift_getEnumTagSinglePayload(v1, 1, v2) == 1)
  {
    v3 = *(_QWORD *)(v0 + 16);
    (*(void (**)(uint64_t, _QWORD))(*(_QWORD *)(v0 + 80) + 8))(v1, *(_QWORD *)(v0 + 72));
    v4 = OUTLINED_FUNCTION_0_4();
    __swift_storeEnumTagSinglePayload(v3, 1, 1, v4);
LABEL_5:
    OUTLINED_FUNCTION_6_16();
    OUTLINED_FUNCTION_36();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
  v5 = *(_QWORD *)(v0 + 120);
  v49 = *(_QWORD *)(v0 + 128);
  v46 = *(_QWORD *)(v0 + 112);
  v47 = *(_QWORD *)(v0 + 104);
  v6 = *(_QWORD *)(v0 + 40);
  v53 = *(_QWORD *)(v0 + 48);
  v54 = *(_QWORD *)(v0 + 56);
  v7 = *(_QWORD *)(v0 + 32);
  v51 = *(_QWORD *)(v0 + 16);
  v8 = *(int *)(v2 + 48);
  v9 = v49 + v8;
  v48 = v49 + v8;
  v10 = *(int *)(v2 + 64);
  v11 = v49 + v10;
  v12 = v1 + v8;
  v41 = v49 + v10;
  v42 = v1 + v10;
  v13 = *(_QWORD *)(v7 - 8);
  v44 = *(void (**)(void))(v13 + 32);
  v44();
  v14 = *(_QWORD *)(v6 - 8);
  v45 = *(void (**)(uint64_t, uint64_t, uint64_t))(v14 + 32);
  v45(v9, v12, v6);
  v15 = *(_QWORD *)(v54 - 8);
  (*(void (**)(uint64_t, uint64_t))(v15 + 32))(v11, v42);
  v33 = OUTLINED_FUNCTION_0_4();
  v43 = v51 + *(int *)(v33 + 48);
  v37 = v13;
  v16 = v5 + *(int *)(v2 + 48);
  v17 = v5 + *(int *)(v2 + 64);
  v40 = *(void (**)(void))(v13 + 16);
  v40();
  v35 = v16;
  v36 = v14;
  v39 = *(void (**)(uint64_t, uint64_t, uint64_t))(v14 + 16);
  v39(v16, v48, v6);
  v38 = *(void (**)(uint64_t, uint64_t, uint64_t))(v15 + 16);
  v34 = v17;
  v38(v17, v41, v54);
  ((void (*)(uint64_t, uint64_t, uint64_t))v44)(v51, v5, v7);
  v18 = v46 + *(int *)(v2 + 48);
  v19 = v46 + *(int *)(v2 + 64);
  v40();
  v39(v18, v48, v6);
  v52 = v19;
  v38(v19, v41, v54);
  v45(v43, v18, v6);
  v20 = v47 + *(int *)(v2 + 48);
  v21 = v47 + *(int *)(v2 + 64);
  v40();
  v50 = v20;
  v39(v20, v48, v6);
  v38(v21, v41, v54);
  result = __swift_getEnumTagSinglePayload(v21, 1, v53);
  if ((_DWORD)result != 1)
  {
    v23 = *(_QWORD *)(v0 + 104);
    v55 = *(_QWORD *)(v0 + 112);
    v24 = *(_QWORD *)(v0 + 56);
    v26 = *(_QWORD *)(v0 + 40);
    v25 = *(_QWORD *)(v0 + 48);
    v27 = *(_QWORD *)(v0 + 32);
    v28 = *(_QWORD *)(v0 + 16);
    v29 = v28 + *(int *)(v33 + 64);
    (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 96) + 8))(*(_QWORD *)(v0 + 128), *(_QWORD *)(v0 + 64));
    (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v25 - 8) + 32))(v29, v21, v25);
    __swift_storeEnumTagSinglePayload(v28, 0, 1, v33);
    v30 = *(void (**)(uint64_t, uint64_t))(v36 + 8);
    v30(v50, v26);
    v31 = *(void (**)(uint64_t, uint64_t))(v37 + 8);
    v31(v23, v27);
    v32 = *(void (**)(uint64_t, uint64_t))(v15 + 8);
    v32(v52, v24);
    v31(v55, v27);
    v32(v34, v24);
    v30(v35, v26);
    goto LABEL_5;
  }
  __break(1u);
  return result;
}

uint64_t sub_1B2586400()
{
  uint64_t v0;

  OUTLINED_FUNCTION_6_16();
  OUTLINED_FUNCTION_36();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return OUTLINED_FUNCTION_68(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_1B2586450(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v2 + 16) = a1;
  *(_QWORD *)(v2 + 24) = v1;
  return swift_task_switch();
}

uint64_t sub_1B2586468()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 32) = v1;
  *v1 = v0;
  v1[1] = sub_1B2519CB4;
  return sub_1B2585E88(*(_QWORD *)(v0 + 16));
}

uint64_t sub_1B25864BC(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;

  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v3;
  *v3 = v1;
  v3[1] = sub_1B249C4EC;
  return sub_1B2586450(a1);
}

uint64_t sub_1B258650C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v4;
  uint64_t AssociatedTypeWitness;
  _QWORD *v6;

  v4[2] = a4;
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v4[3] = AssociatedTypeWitness;
  v4[4] = *(_QWORD *)(AssociatedTypeWitness - 8);
  v4[5] = swift_task_alloc();
  v6 = (_QWORD *)swift_task_alloc();
  v4[6] = v6;
  *v6 = v4;
  v6[1] = sub_1B25865E4;
  return sub_1B25CCC94();
}

uint64_t sub_1B25865E4()
{
  uint64_t v0;
  _QWORD *v1;
  _QWORD *v2;
  _QWORD *v3;

  v2 = (_QWORD *)*v1;
  v3 = (_QWORD *)*v1;
  swift_task_dealloc();
  if (v0)
  {
    (*(void (**)(_QWORD, _QWORD, _QWORD))(v2[4] + 32))(v2[2], v2[5], v2[3]);
    OUTLINED_FUNCTION_36();
  }
  else
  {
    swift_task_dealloc();
  }
  return OUTLINED_FUNCTION_68((uint64_t (*)(void))v3[1]);
}

void sub_1B2586654()
{
  JUMPOUT(0x1B5E261DCLL);
}

void sub_1B2586664()
{
  sub_1B2585334();
}

uint64_t sub_1B2586680(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;
  uint64_t result;

  result = (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v1 - 8) + 8))(v2, v1);
  *v3 = a1;
  return result;
}

uint64_t OUTLINED_FUNCTION_6_16()
{
  return swift_task_dealloc();
}

uint64_t sub_1B25866BC(_QWORD *a1)
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
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  void (*v22)(_QWORD *);
  uint64_t v23;

  v2 = sub_1B25CC8C8();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x1E0C80A78](v2, v4);
  v21 = (char *)&v20 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEFD71C8);
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x1E0C80A78](v6, v8);
  v10 = (char *)&v20 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = a1[2];
  if (!v11)
  {
LABEL_5:
    if (qword_1ED36CF48 != -1)
      swift_once();
    v18 = __swift_project_value_buffer(v2, (uint64_t)qword_1ED36D980);
    v19 = (uint64_t)v21;
    (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v21, v18, v2);
    sub_1B24B3B94((uint64_t)"/Library/Caches/com.apple.xbs/Sources/SpeechFramework/SpeechAnalyzer/Misc.swift", 79, 2, 167, v19);
  }
  v12 = a1[4];
  v13 = a1[5];
  v14 = OUTLINED_FUNCTION_79();
  *(_QWORD *)(v14 + 16) = v12;
  *(_QWORD *)(v14 + 24) = v13;
  if (v11 != 1)
  {
    swift_retain();
    goto LABEL_5;
  }
  v15 = v14;
  v16 = OUTLINED_FUNCTION_79();
  *(_QWORD *)(v16 + 16) = sub_1B2587338;
  *(_QWORD *)(v16 + 24) = v15;
  v22 = sub_1B2501B20;
  v23 = v16;
  swift_retain();
  swift_retain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EEFD71F0);
  sub_1B25CCCF4();
  swift_release();
  return (*(uint64_t (**)(char *, uint64_t))(v7 + 8))(v10, v6);
}

uint64_t sub_1B2586888(_QWORD *a1)
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
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  void (*v22)(_QWORD *);
  uint64_t v23;

  v2 = sub_1B25CC8C8();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x1E0C80A78](v2, v4);
  v21 = (char *)&v20 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = __swift_instantiateConcreteTypeFromMangledName(qword_1EEFDB060);
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x1E0C80A78](v6, v8);
  v10 = (char *)&v20 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = a1[2];
  if (!v11)
  {
LABEL_5:
    if (qword_1ED36CF48 != -1)
      swift_once();
    v18 = __swift_project_value_buffer(v2, (uint64_t)qword_1ED36D980);
    v19 = (uint64_t)v21;
    (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v21, v18, v2);
    sub_1B24B3B94((uint64_t)"/Library/Caches/com.apple.xbs/Sources/SpeechFramework/SpeechAnalyzer/Misc.swift", 79, 2, 167, v19);
  }
  v12 = a1[4];
  v13 = a1[5];
  v14 = swift_allocObject();
  *(_QWORD *)(v14 + 16) = v12;
  *(_QWORD *)(v14 + 24) = v13;
  if (v11 != 1)
  {
    swift_retain();
    goto LABEL_5;
  }
  v15 = v14;
  v16 = swift_allocObject();
  *(_QWORD *)(v16 + 16) = sub_1B25872C4;
  *(_QWORD *)(v16 + 24) = v15;
  v22 = sub_1B2500FA8;
  v23 = v16;
  swift_retain();
  swift_retain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EEFDA210);
  sub_1B25CCCF4();
  swift_release();
  return (*(uint64_t (**)(char *, uint64_t))(v7 + 8))(v10, v6);
}

void sub_1B2586A64()
{
  OUTLINED_FUNCTION_2_13();
}

void sub_1B2586A74(uint64_t a1)
{
  void *v1;

  if (a1)
  {
    sub_1B25A08F4(v1);
    swift_unknownObjectRelease();
  }
  else
  {
    OUTLINED_FUNCTION_0();
  }
}

void sub_1B2586A9C()
{
  OUTLINED_FUNCTION_2_13();
}

uint64_t sub_1B2586AB4(uint64_t result)
{
  void *v1;
  double v2;

  if (result)
  {
    sub_1B25A0D24(v1, v2);
    return swift_unknownObjectRelease();
  }
  return result;
}

uint64_t sub_1B2586AEC(void *a1, void *a2, char a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v9;
  uint64_t v10;

  v9 = sub_1B24A1BF0(a1, a2, a3, a4);
  v10 = v9;
  if (!v4 && !v9)
  {
    type metadata accessor for EARLanguageDetectorResultStream();
    v10 = swift_distributedActor_remote_initialize();
    *(_QWORD *)(v10 + 112) = a1;
    *(_QWORD *)(v10 + 120) = a2;
    *(_BYTE *)(v10 + 128) = a3;
    *(_QWORD *)(v10 + 136) = a4;
    sub_1B24A1AF4(a1, a2, a3);
    swift_retain();
  }
  return v10;
}

uint64_t type metadata accessor for EARLanguageDetectorResultStream()
{
  return objc_opt_self();
}

uint64_t sub_1B2586B90()
{
  uint64_t v0;

  sub_1B25CD6A8();
  type metadata accessor for EARLanguageDetectorResultStream();
  sub_1B24B87C4(&qword_1EEFDB038, v0, (uint64_t (*)(uint64_t))type metadata accessor for EARLanguageDetectorResultStream, (uint64_t)&unk_1B25E157C);
  sub_1B25CC91C();
  return sub_1B25CD6CC();
}

uint64_t sub_1B2586C00()
{
  uint64_t v0;
  uint64_t v1;

  if ((sub_1B25CC7C0() & 1) == 0)
  {
    type metadata accessor for EARLanguageDetectorResultStream();
    sub_1B24B87C4(&qword_1EEFDB050, v1, (uint64_t (*)(uint64_t))type metadata accessor for EARLanguageDetectorResultStream, (uint64_t)&unk_1B25E1604);
    return sub_1B25CC76C();
  }
  return v0;
}

uint64_t sub_1B2586C6C(uint64_t a1, uint64_t *a2)
{
  return sub_1B2586AEC(*(void **)a1, *(void **)(a1 + 8), *(_BYTE *)(a1 + 16), *a2);
}

uint64_t sub_1B2586C94()
{
  return sub_1B2586B90();
}

uint64_t sub_1B2586CB4()
{
  uint64_t v0;

  type metadata accessor for EARLanguageDetectorResultStream();
  sub_1B24B87C4(&qword_1EEFDB050, v0, (uint64_t (*)(uint64_t))type metadata accessor for EARLanguageDetectorResultStream, (uint64_t)&unk_1B25E1604);
  return sub_1B25CC79C();
}

uint64_t sub_1B2586D10()
{
  sub_1B25CD6A8();
  type metadata accessor for EARLanguageDetectorResultStream();
  sub_1B25CC91C();
  return sub_1B25CD6CC();
}

uint64_t sub_1B2586D64()
{
  uint64_t v0;

  type metadata accessor for EARLanguageDetectorResultStream();
  sub_1B24B87C4(&qword_1EEFDB050, v0, (uint64_t (*)(uint64_t))type metadata accessor for EARLanguageDetectorResultStream, (uint64_t)&unk_1B25E1604);
  return sub_1B25CC790();
}

uint64_t sub_1B2586DC0()
{
  uint64_t v0;

  type metadata accessor for EARLanguageDetectorResultStream();
  sub_1B24B87C4(&qword_1EEFDB050, v0, (uint64_t (*)(uint64_t))type metadata accessor for EARLanguageDetectorResultStream, (uint64_t)&unk_1B25E1604);
  sub_1B24A1DB8();
  return sub_1B25CC7A8();
}

uint64_t sub_1B2586E38@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t result;

  type metadata accessor for EARLanguageDetectorResultStream();
  sub_1B24B87C4(&qword_1EEFDB050, v3, (uint64_t (*)(uint64_t))type metadata accessor for EARLanguageDetectorResultStream, (uint64_t)&unk_1B25E1604);
  sub_1B24A1DF4();
  result = sub_1B25CC7B4();
  if (!v1)
    *a1 = result;
  return result;
}

id sub_1B2586EB8()
{
  id result;

  result = (id)xpcInterface_EARLanguageDetectorResultStream();
  qword_1EEFE4270 = (uint64_t)result;
  return result;
}

id sub_1B2586EDC(uint64_t a1, uint64_t a2)
{
  char *v2;
  uint64_t v5;
  char *v6;
  id v7;
  objc_super v9;

  v5 = OBJC_IVAR____TtCC6Speech31EARLanguageDetectorResultStream8XPCProxy_enqueue;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EEFDB048);
  swift_allocObject();
  v6 = v2;
  *(_QWORD *)&v2[v5] = sub_1B2550418();
  swift_retain();
  sub_1B254F7D8(a1, a2);
  swift_release();

  v9.receiver = v6;
  v9.super_class = (Class)type metadata accessor for EARLanguageDetectorResultStream.XPCProxy();
  v7 = objc_msgSendSuper2(&v9, sel_init);
  swift_release();
  sub_1B2550374(a2);
  return v7;
}

uint64_t sub_1B2586F9C(void *a1)
{
  uint64_t inited;
  uint64_t v3;
  id v4;

  __swift_instantiateConcreteTypeFromMangledName(&qword_1EEFDB058);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_1B25DB5B0;
  v3 = swift_allocObject();
  *(_QWORD *)(v3 + 16) = a1;
  *(_QWORD *)(inited + 32) = sub_1B25872F0;
  *(_QWORD *)(inited + 40) = v3;
  v4 = a1;
  sub_1B2586888((_QWORD *)inited);
  swift_setDeallocating();
  return sub_1B250036C();
}

uint64_t sub_1B2587080(void *a1, double a2)
{
  uint64_t inited;
  uint64_t v5;
  id v6;

  __swift_instantiateConcreteTypeFromMangledName(&qword_1EEFDB058);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_1B25DB5B0;
  v5 = OUTLINED_FUNCTION_79();
  *(_QWORD *)(v5 + 16) = a1;
  *(double *)(v5 + 24) = a2;
  *(_QWORD *)(inited + 32) = sub_1B258729C;
  *(_QWORD *)(inited + 40) = v5;
  v6 = a1;
  sub_1B2586888((_QWORD *)inited);
  swift_setDeallocating();
  return sub_1B250036C();
}

id sub_1B2587194()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for EARLanguageDetectorResultStream.XPCProxy();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for EARLanguageDetectorResultStream.XPCProxy()
{
  return objc_opt_self();
}

uint64_t sub_1B25871F4(uint64_t a1, uint64_t a2)
{
  return sub_1B24B87C4(&qword_1EEFDB030, a2, (uint64_t (*)(uint64_t))type metadata accessor for EARLanguageDetectorResultStream, (uint64_t)&unk_1B25E1554);
}

uint64_t sub_1B2587220(uint64_t a1, uint64_t a2)
{
  return sub_1B24B87C4(&qword_1EEFDB038, a2, (uint64_t (*)(uint64_t))type metadata accessor for EARLanguageDetectorResultStream, (uint64_t)&unk_1B25E157C);
}

uint64_t sub_1B258724C(uint64_t a1, uint64_t a2)
{
  return sub_1B24B87C4(&qword_1EEFDB040, a2, (uint64_t (*)(uint64_t))type metadata accessor for EARLanguageDetectorResultStream, (uint64_t)&unk_1B25E15BC);
}

uint64_t sub_1B2587278()
{
  uint64_t v0;

  return swift_deallocObject();
}

void sub_1B258729C()
{
  sub_1B2586A9C();
}

void sub_1B25872BC()
{
  OUTLINED_FUNCTION_0();
}

uint64_t sub_1B25872C4(uint64_t a1)
{
  uint64_t v1;

  return sub_1B2550B34(a1, *(uint64_t (**)(uint64_t *))(v1 + 16));
}

uint64_t sub_1B25872CC()
{
  uint64_t v0;

  return swift_deallocObject();
}

void sub_1B25872F0()
{
  sub_1B2586A64();
}

void sub_1B258730C()
{
  OUTLINED_FUNCTION_0();
}

uint64_t sub_1B2587314()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_1B2587338(uint64_t a1)
{
  uint64_t v1;

  return sub_1B2550D38(a1, *(uint64_t (**)(uint64_t *))(v1 + 16));
}

void OUTLINED_FUNCTION_2_13()
{
  JUMPOUT(0x1B5E26380);
}

uint64_t sub_1B2587358(void *a1)
{
  id v1;
  char v2;
  uint64_t result;
  char v4;
  uint64_t v5;

  if (!a1)
    return 12589;
  v1 = a1;
  if ((objc_msgSend(v1, sel_isFinal) & 1) != 0 || (sub_1B24BFBAC(), (v2 & 1) != 0))
  {

    return 12589;
  }
  result = sub_1B24BFBAC();
  if ((v4 & 1) == 0)
  {
    v5 = sub_1B25CD570();

    return v5;
  }
  __break(1u);
  return result;
}

_QWORD *sub_1B25873F8()
{
  uint64_t v0;
  _QWORD *result;

  type metadata accessor for Instrumentation();
  v0 = OUTLINED_FUNCTION_8_4();
  result = sub_1B2589894();
  qword_1EEFE4198 = v0;
  return result;
}

void sub_1B258742C()
{
  os_log_type_t v0;
  os_log_type_t v1;
  unint64_t v2;
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  id v17;
  uint64_t v18;
  NSObject *v19;
  os_log_type_t v20;
  uint8_t *v21;
  void *v22;
  id v23;
  id v24;
  void *v25;
  id v26;
  const char *v27;
  uint64_t v28;
  int v29;
  uint64_t v30;
  unint64_t v31;
  id v32;
  id v33;
  uint64_t v34;
  id v35;
  id v36;
  void *v37;
  uint64_t v38;
  unint64_t v39;
  uint64_t v40;
  uint64_t v41;
  unint64_t v42;

  OUTLINED_FUNCTION_59_0();
  v1 = v0;
  v3 = v2;
  v5 = v4;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EEFD6998);
  OUTLINED_FUNCTION_30_0();
  MEMORY[0x1E0C80A78](v6, v7);
  v9 = (char *)&v41 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = OUTLINED_FUNCTION_72_2();
  OUTLINED_FUNCTION_8_13();
  MEMORY[0x1E0C80A78](v11, v12);
  OUTLINED_FUNCTION_63_11(v5);
  OUTLINED_FUNCTION_118_0((uint64_t)v9, 1, v10);
  if (v13)
  {
    OUTLINED_FUNCTION_61_12();
  }
  else
  {
    OUTLINED_FUNCTION_23_16();
    sub_1B24BB7D0();
    OUTLINED_FUNCTION_67_8();
  }
  if (v3 >> 62)
  {
    OUTLINED_FUNCTION_22_9();
    v14 = sub_1B25CD474();
    OUTLINED_FUNCTION_10_0();
  }
  else
  {
    v14 = *(_QWORD *)((v3 & 0xFFFFFFFFFFFFF8) + 0x10);
  }
  if (v14 == 2)
  {
    sub_1B24B2E98(0, (v3 & 0xC000000000000001) == 0, v3);
    if ((v3 & 0xC000000000000001) != 0)
      OUTLINED_FUNCTION_64_13();
    v15 = *(_QWORD *)(v3 + 32);
    swift_retain();
    v16 = *(void **)(v15 + 16);
    v17 = v16;
    swift_release();
    sub_1B24B2E98(1uLL, 1, v3);
    if (v16)
    {
      v22 = *(void **)(*(_QWORD *)(v3 + 40) + 16);
      v23 = v22;
      v24 = objc_msgSend(v17, sel_startedOrChanged);
      if (v24)
      {
        v25 = v24;
        if ((objc_msgSend(v24, sel_exists) & 1) != 0)
        {
          v26 = v17;
          sub_1B24BB95C();
          OUTLINED_FUNCTION_69_2();
          OUTLINED_FUNCTION_43_10();
          sub_1B256BEE4(v27, v28, v29, v30, v31, (uint64_t)v26);
          if (v22)
          {
            v32 = v22;
            v33 = objc_msgSend(v32, sel_ended);

            if (v33
              || (v35 = OUTLINED_FUNCTION_72_11(v34, sel_failed),
                  v35,
                  v35))
            {
              v36 = OUTLINED_FUNCTION_72_11(v34, sel_ended);
              if (v36)
              {
                v37 = v36;
                objc_msgSend(v36, sel_status);

              }
              v41 = 0x3D737574617453;
              v42 = 0xE700000000000000;
              sub_1B25CCAE4();
              OUTLINED_FUNCTION_107();
              v38 = v41;
              v39 = v42;
              v40 = sub_1B24BB95C();
              sub_1B256C4EC("ondevice_preheat_time", 21, 2, v38, v39, v40);
              OUTLINED_FUNCTION_44_1();
            }

          }
          else
          {

          }
          goto LABEL_29;
        }

      }
    }
  }
  else if (v14 >= 1)
  {
    if (qword_1ED36CF48 != -1)
      swift_once();
    v18 = OUTLINED_FUNCTION_147();
    __swift_project_value_buffer(v18, (uint64_t)qword_1ED36D980);
    swift_bridgeObjectRetain();
    v19 = sub_1B25CC8B0();
    v20 = sub_1B25CCFDC();
    if (OUTLINED_FUNCTION_186_0(v20))
    {
      v21 = (uint8_t *)swift_slowAlloc();
      *(_DWORD *)v21 = 134217984;
      v41 = v14;
      sub_1B25CD12C();
      OUTLINED_FUNCTION_10_0();
      _os_log_impl(&dword_1B2494000, v19, v1, "Unexpected pending preheat event count %ld", v21, 0xCu);
      OUTLINED_FUNCTION_174();
    }

    OUTLINED_FUNCTION_10_0();
  }
LABEL_29:
  OUTLINED_FUNCTION_7_1();
}

void sub_1B2587864()
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
  char *v30;
  id v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  BOOL v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  NSObject *v39;
  os_log_type_t v40;
  uint8_t *v41;
  const char *v42;
  uint64_t v43;
  os_log_type_t v44;
  uint64_t v45;
  uint64_t v46;
  void (*v47)(char *, char *, uint64_t);
  char v48;
  uint64_t v49;
  NSObject *v50;
  os_log_type_t v51;
  uint8_t *v52;
  uint64_t v53;
  void (*v54)(uint64_t, uint64_t);
  uint64_t v55;
  uint64_t v56;
  char *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;

  OUTLINED_FUNCTION_59_0();
  v56 = v0;
  v59 = v2;
  v60 = v1;
  v61 = v3;
  v62 = v4;
  v6 = v5;
  v8 = v7;
  v9 = OUTLINED_FUNCTION_72_2();
  v58 = *(_QWORD *)(v9 - 8);
  MEMORY[0x1E0C80A78](v9, v10);
  OUTLINED_FUNCTION_29_7();
  v55 = v11;
  OUTLINED_FUNCTION_42_8();
  MEMORY[0x1E0C80A78](v12, v13);
  v57 = (char *)&v55 - v14;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EEFD6998);
  OUTLINED_FUNCTION_30_0();
  v17 = MEMORY[0x1E0C80A78](v15, v16);
  v19 = (char *)&v55 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  v21 = MEMORY[0x1E0C80A78](v17, v20);
  v23 = (char *)&v55 - v22;
  v25 = MEMORY[0x1E0C80A78](v21, v24);
  v27 = (char *)&v55 - v26;
  MEMORY[0x1E0C80A78](v25, v28);
  v30 = (char *)&v55 - v29;
  v31 = objc_msgSend((id)objc_opt_self(), sel_systemClientId);
  v32 = sub_1B25CCA18();
  v34 = v33;

  v35 = v32 == v8 && v34 == v6;
  if (v35)
  {
    OUTLINED_FUNCTION_267();
  }
  else
  {
    LOBYTE(v8) = sub_1B25CD5D0();
    OUTLINED_FUNCTION_101_1();
    if ((v8 & 1) == 0)
      goto LABEL_34;
  }
  if (!v60)
  {
    v36 = v61;
    OUTLINED_FUNCTION_37_10(v61);
    v37 = v62;
    goto LABEL_18;
  }
  v36 = v61;
  OUTLINED_FUNCTION_37_10(v61);
  v37 = v62;
  if (v59)
  {
LABEL_18:
    OUTLINED_FUNCTION_36_11();
    OUTLINED_FUNCTION_31_9();
    goto LABEL_19;
  }
  LODWORD(v8) = __swift_getEnumTagSinglePayload((uint64_t)v30, 1, v9);
  OUTLINED_FUNCTION_36_11();
  OUTLINED_FUNCTION_31_9();
  if ((_DWORD)v8 == 1)
  {
    OUTLINED_FUNCTION_118_0((uint64_t)v27, 1, v9);
    if (v35)
    {
      OUTLINED_FUNCTION_32_16();
      if (qword_1ED36CF48 != -1)
        swift_once();
      v38 = OUTLINED_FUNCTION_147();
      __swift_project_value_buffer(v38, (uint64_t)qword_1ED36D980);
      v39 = OUTLINED_FUNCTION_258_0();
      v40 = sub_1B25CCFD0();
      if (OUTLINED_FUNCTION_50_11(v40))
      {
        v41 = (uint8_t *)OUTLINED_FUNCTION_3_4();
        *(_WORD *)v41 = 0;
        v42 = "SELF: Preheating request being made; non-nil source but nil inputOrigin, asrId, & requestId";
        goto LABEL_25;
      }
LABEL_26:

      goto LABEL_34;
    }
  }
LABEL_19:
  OUTLINED_FUNCTION_32_16();
  sub_1B258A628(v36, (uint64_t)v23);
  OUTLINED_FUNCTION_118_0((uint64_t)v23, 1, v9);
  if (v35)
  {
    sub_1B250ADF4((uint64_t)v23);
    if (qword_1ED36CF48 != -1)
      swift_once();
    v43 = OUTLINED_FUNCTION_147();
    __swift_project_value_buffer(v43, (uint64_t)qword_1ED36D980);
    v39 = OUTLINED_FUNCTION_258_0();
    v44 = sub_1B25CCFDC();
    if (OUTLINED_FUNCTION_50_11(v44))
    {
      v41 = (uint8_t *)OUTLINED_FUNCTION_3_4();
      *(_WORD *)v41 = 0;
      v42 = "SELF: asrId is nil";
LABEL_25:
      _os_log_impl(&dword_1B2494000, v39, (os_log_type_t)v8, v42, v41, 2u);
      OUTLINED_FUNCTION_174();
    }
    goto LABEL_26;
  }
  v46 = (uint64_t)v57;
  v45 = v58;
  v47 = *(void (**)(char *, char *, uint64_t))(v58 + 32);
  v47(v57, v23, v9);
  OUTLINED_FUNCTION_63_11(v37);
  OUTLINED_FUNCTION_118_0((uint64_t)v19, 1, v9);
  if (v48)
  {
    OUTLINED_FUNCTION_61_12();
    if (qword_1ED36CF48 != -1)
      swift_once();
    v49 = OUTLINED_FUNCTION_147();
    __swift_project_value_buffer(v49, (uint64_t)qword_1ED36D980);
    v50 = OUTLINED_FUNCTION_258_0();
    v51 = sub_1B25CCFDC();
    if (OUTLINED_FUNCTION_186_0(v51))
    {
      v52 = (uint8_t *)OUTLINED_FUNCTION_3_4();
      *(_WORD *)v52 = 0;
      _os_log_impl(&dword_1B2494000, v50, (os_log_type_t)v37, "SELF: requestId is nil", v52, 2u);
      OUTLINED_FUNCTION_174();
    }

    (*(void (**)(uint64_t, uint64_t))(v45 + 8))(v46, v9);
  }
  else
  {
    v53 = v55;
    v47((char *)v55, v19, v9);
    sub_1B24BB9F8(v46, v53);
    v54 = *(void (**)(uint64_t, uint64_t))(v45 + 8);
    v54(v53, v9);
    v54(v46, v9);
  }
LABEL_34:
  OUTLINED_FUNCTION_7_1();
}

void sub_1B2587C88(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20)
{
  sub_1B2587F04(a1, a2, a3, a4, (uint64_t)sub_1B24BBBB8, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
    a20);
}

void sub_1B2587C94()
{
  sub_1B25882F0();
}

#error "1B2587D64: call analysis failed (funcsize=52)"

void sub_1B2587D8C()
{
  OUTLINED_FUNCTION_27_9();
}

void sub_1B2587DA8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20)
{
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;
  unint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  char *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  char v38;

  OUTLINED_FUNCTION_59_0();
  a19 = v21;
  a20 = v22;
  v24 = v23;
  v26 = v25;
  v28 = v27;
  v30 = v29;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EEFD6998);
  OUTLINED_FUNCTION_30_0();
  MEMORY[0x1E0C80A78](v31, v32);
  v34 = (char *)&a9 - ((v33 + 15) & 0xFFFFFFFFFFFFFFF0);
  v35 = OUTLINED_FUNCTION_72_2();
  OUTLINED_FUNCTION_8_13();
  MEMORY[0x1E0C80A78](v36, v37);
  OUTLINED_FUNCTION_5_15();
  OUTLINED_FUNCTION_118_0((uint64_t)v34, 1, v35);
  if (v38)
  {
    OUTLINED_FUNCTION_59_10();
  }
  else
  {
    OUTLINED_FUNCTION_9_15();
    sub_1B24BBDDC(v20, v30, v28, v26, v24);
    OUTLINED_FUNCTION_14_10();
  }
  OUTLINED_FUNCTION_7_14("ES: JIT Profile Build Load", 26);
  OUTLINED_FUNCTION_7_1();
}

void sub_1B2587E80()
{
  sub_1B25882F0();
}

void sub_1B2587EA0()
{
  sub_1B25882F0();
}

void sub_1B2587EC0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20)
{
  sub_1B2587F04(a1, a2, a3, a4, (uint64_t)sub_1B24BC0F8, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
    a20);
}

void sub_1B2587ECC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20)
{
  sub_1B2587F04(a1, a2, a3, a4, (uint64_t)sub_1B24BC104, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
    a20);
}

void sub_1B2587ED8()
{
  sub_1B25882F0();
}

void sub_1B2587EF8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20)
{
  sub_1B2587F04(a1, a2, a3, a4, (uint64_t)sub_1B24BC124, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
    a20);
}

void sub_1B2587F04(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20)
{
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void (*v23)(uint64_t, uint64_t, uint64_t, uint64_t);
  void (*v24)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  char *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  char v38;

  OUTLINED_FUNCTION_59_0();
  a19 = v21;
  a20 = v22;
  v24 = v23;
  v26 = v25;
  v28 = v27;
  v30 = v29;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EEFD6998);
  OUTLINED_FUNCTION_30_0();
  MEMORY[0x1E0C80A78](v31, v32);
  v34 = (char *)&a9 - ((v33 + 15) & 0xFFFFFFFFFFFFFFF0);
  v35 = OUTLINED_FUNCTION_72_2();
  OUTLINED_FUNCTION_8_13();
  MEMORY[0x1E0C80A78](v36, v37);
  OUTLINED_FUNCTION_5_15();
  OUTLINED_FUNCTION_118_0((uint64_t)v34, 1, v35);
  if (v38)
  {
    OUTLINED_FUNCTION_59_10();
  }
  else
  {
    OUTLINED_FUNCTION_9_15();
    v24(v20, v30, v28, v26);
    OUTLINED_FUNCTION_14_10();
  }
  OUTLINED_FUNCTION_7_1();
}

void sub_1B2587FC0()
{
  sub_1B2587FD8();
}

void sub_1B2587FCC()
{
  sub_1B2587FD8();
}

void sub_1B2587FD8()
{
  uint64_t v0;
  uint64_t v1;
  void (*v2)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t);
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
  char v18;
  uint64_t v19;
  void (*v20)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t);

  OUTLINED_FUNCTION_59_0();
  v19 = v1;
  v20 = v2;
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EEFD6998);
  OUTLINED_FUNCTION_30_0();
  MEMORY[0x1E0C80A78](v11, v12);
  v14 = (char *)&v19 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = OUTLINED_FUNCTION_72_2();
  v16 = *(_QWORD *)(v15 - 8);
  MEMORY[0x1E0C80A78](v15, v17);
  OUTLINED_FUNCTION_12_15();
  OUTLINED_FUNCTION_118_0((uint64_t)v14, 1, v15);
  if (v18)
  {
    OUTLINED_FUNCTION_32_16();
  }
  else
  {
    OUTLINED_FUNCTION_17_14(*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v16 + 32));
    v20(v0, v10, v8, v6, v4, v19);
    OUTLINED_FUNCTION_35_15(*(uint64_t (**)(uint64_t, uint64_t))(v16 + 8));
  }
  OUTLINED_FUNCTION_7_1();
}

void sub_1B25880B4()
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
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  char v15;
  _QWORD v16[4];

  OUTLINED_FUNCTION_59_0();
  v16[2] = v2;
  v16[3] = v3;
  v16[1] = v4;
  v6 = v5;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EEFD6998);
  OUTLINED_FUNCTION_30_0();
  MEMORY[0x1E0C80A78](v7, v8);
  v10 = (char *)v16 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  OUTLINED_FUNCTION_72_2();
  OUTLINED_FUNCTION_70_8();
  MEMORY[0x1E0C80A78](v11, v12);
  v14 = (char *)v16 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  OUTLINED_FUNCTION_37_10(v6);
  OUTLINED_FUNCTION_118_0((uint64_t)v10, 1, v1);
  if (v15)
  {
    OUTLINED_FUNCTION_36_11();
  }
  else
  {
    OUTLINED_FUNCTION_424((uint64_t)v14, (uint64_t)v10, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v0 + 32));
    sub_1B24BC21C();
    OUTLINED_FUNCTION_56_1((uint64_t)v14, *(uint64_t (**)(uint64_t, uint64_t))(v0 + 8));
  }
  OUTLINED_FUNCTION_7_1();
}

void sub_1B25881B0()
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
  uint64_t v14;
  uint64_t v15;
  char *v16;
  char v17;
  _QWORD v18[4];

  OUTLINED_FUNCTION_59_0();
  v18[2] = v2;
  v18[3] = v3;
  v18[1] = v4;
  v6 = v5;
  v8 = v7;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EEFD6998);
  OUTLINED_FUNCTION_30_0();
  MEMORY[0x1E0C80A78](v9, v10);
  v12 = (char *)v18 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  OUTLINED_FUNCTION_72_2();
  OUTLINED_FUNCTION_71_11();
  MEMORY[0x1E0C80A78](v13, v14);
  v16 = (char *)v18 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  OUTLINED_FUNCTION_37_10(v8);
  OUTLINED_FUNCTION_118_0((uint64_t)v12, 1, v1);
  if (v17)
  {
    OUTLINED_FUNCTION_36_11();
  }
  else
  {
    OUTLINED_FUNCTION_424((uint64_t)v16, (uint64_t)v12, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v0 + 32));
    sub_1B24BC290();
    OUTLINED_FUNCTION_56_1((uint64_t)v16, *(uint64_t (**)(uint64_t, uint64_t))(v0 + 8));
  }
  sub_1B256CAD4("ES: Last Speech Audio Packet", 28, 2, 0, 0xE000000000000000, v6);
  OUTLINED_FUNCTION_7_1();
}

void sub_1B25882D4()
{
  OUTLINED_FUNCTION_27_9();
}

void sub_1B25882F0()
{
  uint64_t v0;
  uint64_t v1;
  void (*v2)(uint64_t, uint64_t, uint64_t, _QWORD, unint64_t, uint64_t);
  uint64_t v3;
  uint64_t v4;
  void (*v5)(uint64_t, uint64_t, uint64_t, uint64_t);
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
  char v20;
  uint64_t v21;
  void (*v22)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v23;
  void (*v24)(uint64_t, uint64_t, uint64_t, _QWORD, unint64_t, uint64_t);

  OUTLINED_FUNCTION_59_0();
  v23 = v1;
  v24 = v2;
  v4 = v3;
  v22 = v5;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EEFD6998);
  OUTLINED_FUNCTION_30_0();
  MEMORY[0x1E0C80A78](v12, v13);
  v15 = (char *)&v21 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = OUTLINED_FUNCTION_72_2();
  v17 = *(_QWORD *)(v16 - 8);
  MEMORY[0x1E0C80A78](v16, v18);
  v19 = OUTLINED_FUNCTION_26_15();
  OUTLINED_FUNCTION_37_10(v19);
  OUTLINED_FUNCTION_118_0((uint64_t)v15, 1, v16);
  if (v20)
  {
    OUTLINED_FUNCTION_36_11();
  }
  else
  {
    OUTLINED_FUNCTION_424(v0, (uint64_t)v15, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v17 + 32));
    v22(v0, v11, v9, v7);
    OUTLINED_FUNCTION_56_1(v0, *(uint64_t (**)(uint64_t, uint64_t))(v17 + 8));
  }
  v24(v4, v23, 2, 0, 0xE000000000000000, v7);
  OUTLINED_FUNCTION_7_1();
}

void sub_1B2588400(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,void *a23,double *a24,uint64_t a25,__int128 *a26)
{
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  unint64_t v30;
  unint64_t v31;
  uint64_t v32;
  uint64_t v33;
  int v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  char *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  char v43;
  id v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  id v48;
  void *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  double *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  unint64_t v57;
  uint64_t v58;
  id v59;
  void *v60;
  id v61;
  id v62;
  void *v63;
  const char *v64;
  uint64_t v65;
  int v66;
  uint64_t v67;
  unint64_t v68;
  uint64_t v69;
  unint64_t v70;
  uint64_t v71;
  _QWORD v72[3];
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  int v76;
  double *v77;
  id v78;
  unint64_t v79;

  OUTLINED_FUNCTION_59_0();
  v27 = v26;
  v73 = v28;
  v74 = v29;
  v31 = v30;
  v72[1] = v32;
  v72[2] = v33;
  v76 = v34;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EEFD6998);
  OUTLINED_FUNCTION_30_0();
  MEMORY[0x1E0C80A78](v35, v36);
  v38 = (char *)v72 - ((v37 + 15) & 0xFFFFFFFFFFFFFFF0);
  v39 = OUTLINED_FUNCTION_72_2();
  OUTLINED_FUNCTION_8_13();
  MEMORY[0x1E0C80A78](v40, v41);
  v42 = OUTLINED_FUNCTION_26_15();
  OUTLINED_FUNCTION_63_11(v42);
  OUTLINED_FUNCTION_118_0((uint64_t)v38, 1, v39);
  v77 = a24;
  v75 = v27;
  if (v43)
  {
    OUTLINED_FUNCTION_61_12();
  }
  else
  {
    OUTLINED_FUNCTION_23_16();
    sub_1B24BD708();
    OUTLINED_FUNCTION_67_8();
  }
  if ((v76 & 1) != 0)
  {
    sub_1B25998E8(a26, v77);
    if (a23)
    {
      v44 = a23;
      v78 = objc_msgSend(v44, sel_code);
      v45 = sub_1B25CD570();
      v47 = v46;
      v48 = OUTLINED_FUNCTION_72_11(v45, sel_domain);
      if (!v48)
        goto LABEL_36;
      v49 = v48;
      sub_1B2599810(a26, v45, v47, v48);

      OUTLINED_FUNCTION_107();
    }
    else
    {
      v50 = sub_1B2599590(a26);
      sub_1B25990D4(104, v50);
      OUTLINED_FUNCTION_10_0();
    }
  }
  v51 = HIBYTE(v31) & 0xF;
  v52 = v73;
  if ((v31 & 0x2000000000000000) == 0)
    v51 = v73 & 0xFFFFFFFFFFFFLL;
  if (v51)
  {
    swift_bridgeObjectRetain();
  }
  else
  {
    v52 = 0xD000000000000018;
    v31 = 0x80000001B25D6530;
  }
  v53 = v77;
  sub_1B2559A34(v52, v31, v74, v75, a21, a22);
  OUTLINED_FUNCTION_101_1();
  v54 = *((_QWORD *)v53 + 14);
  if (!v54 || (v55 = *(_QWORD *)(v54 + 16)) == 0)
  {
LABEL_33:
    OUTLINED_FUNCTION_41_14();
    sub_1B25CD2DC();
    sub_1B25CCAE4();
    OUTLINED_FUNCTION_48_10();
    sub_1B25CCAE4();
    OUTLINED_FUNCTION_49_12();
    sub_1B25CCAE4();
    OUTLINED_FUNCTION_49_12();
    sub_1B25CCAE4();
    OUTLINED_FUNCTION_48_10();
    v69 = (uint64_t)v78;
    v70 = v79;
    v71 = mach_continuous_time();
    sub_1B256CAD4("ES: Engine Complete", 19, 2, v69, v70, v71);
    OUTLINED_FUNCTION_101_1();
    OUTLINED_FUNCTION_7_1();
    return;
  }
  swift_bridgeObjectRetain();
  v56 = 0;
  while (1)
  {
    v57 = *(_QWORD *)(v54 + 8 * v56 + 32);
    if (v57 >> 62)
    {
      swift_bridgeObjectRetain();
      v58 = OUTLINED_FUNCTION_659();
    }
    else
    {
      v58 = *(_QWORD *)((v57 & 0xFFFFFFFFFFFFF8) + 0x10);
      swift_bridgeObjectRetain();
    }
    if (v58 != 2)
    {
      OUTLINED_FUNCTION_173();
      goto LABEL_29;
    }
    if ((v57 & 0xC000000000000001) != 0)
    {
      v59 = (id)MEMORY[0x1B5E252C4](0, v57);
      goto LABEL_23;
    }
    if (!*(_QWORD *)((v57 & 0xFFFFFFFFFFFFF8) + 0x10))
      break;
    v59 = *(id *)(v57 + 32);
LABEL_23:
    v60 = v59;
    v61 = objc_msgSend(v59, sel_unsignedLongLongValue);

    if ((v57 & 0xC000000000000001) != 0)
    {
      v62 = (id)MEMORY[0x1B5E252C4](1, v57);
    }
    else
    {
      if (*(_QWORD *)((v57 & 0xFFFFFFFFFFFFF8) + 0x10) < 2uLL)
        goto LABEL_35;
      v62 = *(id *)(v57 + 40);
    }
    v63 = v62;
    OUTLINED_FUNCTION_173();
    objc_msgSend(v63, sel_unsignedLongLongValue);

    OUTLINED_FUNCTION_43_10();
    sub_1B256BEE4(v64, v65, v66, v67, v68, (uint64_t)v61);
    OUTLINED_FUNCTION_7_14("ES: ITN Process", 15);
LABEL_29:
    if (v55 == ++v56)
    {
      OUTLINED_FUNCTION_101_1();
      goto LABEL_33;
    }
  }
  __break(1u);
LABEL_35:
  __break(1u);
LABEL_36:
  __break(1u);
}

#error "1B2588918: call analysis failed (funcsize=87)"

void sub_1B25889D4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21)
{
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
  uint64_t v41;
  uint64_t v42;
  char v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;

  OUTLINED_FUNCTION_59_0();
  v25 = v24;
  v27 = v26;
  v29 = v28;
  v31 = v30;
  v48 = v32;
  v49 = v33;
  v47 = v34;
  v36 = v35;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EEFD6998);
  OUTLINED_FUNCTION_30_0();
  MEMORY[0x1E0C80A78](v37, v38);
  v40 = (char *)&v44 - ((v39 + 15) & 0xFFFFFFFFFFFFFFF0);
  OUTLINED_FUNCTION_72_2();
  OUTLINED_FUNCTION_70_8();
  MEMORY[0x1E0C80A78](v41, v42);
  OUTLINED_FUNCTION_316_1();
  OUTLINED_FUNCTION_78_5(v36);
  OUTLINED_FUNCTION_118_0((uint64_t)v40, 1, v22);
  if (v43)
  {
    OUTLINED_FUNCTION_76_9();
  }
  else
  {
    v45 = v29;
    v46 = v25;
    OUTLINED_FUNCTION_424(v23, (uint64_t)v40, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v21 + 32));
    sub_1B24BC450(v23, v47, v48, v49, v31, v45, v27, v46, a21);
    OUTLINED_FUNCTION_56_1(v23, *(uint64_t (**)(uint64_t, uint64_t))(v21 + 8));
  }
  OUTLINED_FUNCTION_7_1();
}

void sub_1B2588ADC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,void *a21)
{
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  unsigned int *v26;
  unsigned int *v27;
  void *v28;
  void *v29;
  unint64_t v30;
  uint64_t v31;
  void *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  char *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  char v45;
  uint64_t v46;
  id v47;
  id v48;
  uint64_t v49;
  unint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  id v54;
  void *v55;
  id v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  unint64_t v60;
  uint64_t v61;
  uint64_t v62;
  char v63;
  uint64_t v64;
  char v65;
  uint64_t v66;
  uint64_t v67;
  unint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  unint64_t v73;
  uint64_t v74;
  id v75;
  void *v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  unint64_t v80;

  OUTLINED_FUNCTION_59_0();
  v25 = v21;
  v27 = v26;
  v75 = v28;
  v76 = v29;
  v73 = v30;
  v74 = v31;
  v33 = v32;
  v72 = v34;
  v36 = v35;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EEFD6998);
  OUTLINED_FUNCTION_30_0();
  MEMORY[0x1E0C80A78](v37, v38);
  v40 = (char *)&v71 - ((v39 + 15) & 0xFFFFFFFFFFFFFFF0);
  OUTLINED_FUNCTION_72_2();
  OUTLINED_FUNCTION_71_11();
  MEMORY[0x1E0C80A78](v41, v42);
  OUTLINED_FUNCTION_316_1();
  v43 = *((unsigned __int8 *)v27 + 4);
  v44 = *v27;
  OUTLINED_FUNCTION_78_5((uint64_t)v36);
  OUTLINED_FUNCTION_118_0((uint64_t)v40, 1, v23);
  v77 = v25;
  if (v45)
  {
    OUTLINED_FUNCTION_76_9();
    if (!v33)
      goto LABEL_26;
  }
  else
  {
    v46 = v44 | (v43 << 32);
    OUTLINED_FUNCTION_424(v24, (uint64_t)v40, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v22 + 32));
    v36 = *(void **)(v25 + 16);
    BYTE4(v79) = BYTE4(v46);
    LODWORD(v79) = v46;
    sub_1B24BC5DC(v24, v72, v73, v33, v74, (int)v75, v76, (unsigned int *)&v79, (uint64_t)a21);
    OUTLINED_FUNCTION_56_1(v24, *(uint64_t (**)(uint64_t, uint64_t))(v22 + 8));
    if (!v33)
      goto LABEL_26;
  }
  v76 = a21;
  v47 = v33;
  v48 = objc_msgSend(objc_msgSend(v47, sel_recognition), sel_oneBest);
  OUTLINED_FUNCTION_69_2();
  OUTLINED_FUNCTION_60(v49, (unint64_t *)&unk_1EEFD68C0);
  v50 = OUTLINED_FUNCTION_170_0();

  if (v50 >> 62)
  {
    swift_bridgeObjectRetain();
    v51 = OUTLINED_FUNCTION_659();
    OUTLINED_FUNCTION_267();
    if (v51)
      goto LABEL_8;
LABEL_18:
    OUTLINED_FUNCTION_267();
    v53 = MEMORY[0x1E0DEE9D8];
    goto LABEL_19;
  }
  v51 = *(_QWORD *)((v50 & 0xFFFFFFFFFFFFF8) + 0x10);
  if (!v51)
    goto LABEL_18;
LABEL_8:
  v79 = MEMORY[0x1E0DEE9D8];
  OUTLINED_FUNCTION_62_11();
  if (v51 < 0)
  {
    __break(1u);
    goto LABEL_28;
  }
  v75 = v47;
  v52 = 0;
  v53 = v79;
  do
  {
    if ((v50 & 0xC000000000000001) != 0)
      v54 = (id)MEMORY[0x1B5E252C4](v52, v50);
    else
      v54 = OUTLINED_FUNCTION_54_1(v50 + 8 * v52);
    v55 = v54;
    v56 = objc_msgSend(v54, sel_tokenName);
    v57 = sub_1B25CCA18();
    v59 = v58;

    v79 = v53;
    v60 = *(_QWORD *)(v53 + 16);
    if (v60 >= *(_QWORD *)(v53 + 24) >> 1)
    {
      sub_1B2505328();
      v53 = v79;
    }
    ++v52;
    *(_QWORD *)(v53 + 16) = v60 + 1;
    v61 = v53 + 16 * v60;
    *(_QWORD *)(v61 + 32) = v57;
    *(_QWORD *)(v61 + 40) = v59;
  }
  while (v51 != v52);
  OUTLINED_FUNCTION_267();
  v47 = v75;
LABEL_19:
  v79 = v53;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED36CFD0);
  sub_1B24BFF74();
  OUTLINED_FUNCTION_39_9();
  v62 = OUTLINED_FUNCTION_44_1();
  if ((OUTLINED_FUNCTION_68_0(v62, sel_isFinal) & 1) != 0)
    goto LABEL_24;
  sub_1B24BFBAC();
  if ((v63 & 1) != 0)
    goto LABEL_24;
  v64 = sub_1B24BFBAC();
  if ((v65 & 1) == 0)
  {
    v66 = v64;
    if ((v64 & 0x8000000000000000) == 0)
    {
LABEL_25:
      OUTLINED_FUNCTION_41_14();
      sub_1B25CD2DC();
      swift_bridgeObjectRelease();
      OUTLINED_FUNCTION_54_10();
      v79 = v67;
      v80 = v68;
      sub_1B25CCAE4();
      OUTLINED_FUNCTION_107();
      v69 = OUTLINED_FUNCTION_13_12();
      OUTLINED_FUNCTION_68_0(v69, sel_isFinal);
      sub_1B25CCAE4();
      OUTLINED_FUNCTION_10_0();
      v70 = OUTLINED_FUNCTION_28_14();
      OUTLINED_FUNCTION_68_0(v70, sel_firstResultAfterResume);
      sub_1B25CCAE4();
      OUTLINED_FUNCTION_10_0();
      OUTLINED_FUNCTION_18_13();
      v78 = v66;
      sub_1B25CD570();
      OUTLINED_FUNCTION_74_8();
      OUTLINED_FUNCTION_10_0();
      sub_1B256CAD4("ES: Package Recognition", 23, 2, v79, v80, (uint64_t)v76);

      OUTLINED_FUNCTION_10_0();
LABEL_26:
      OUTLINED_FUNCTION_7_1();
      return;
    }
    __break(1u);
LABEL_24:
    v66 = -1;
    goto LABEL_25;
  }
LABEL_28:
  __break(1u);
}

void sub_1B2588ED4(uint64_t a1, uint64_t a2, unint64_t a3, void *a4, uint64_t a5, void *a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  char *v25;
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
  char v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  id v42;
  uint64_t v43;
  uint64_t v44;
  unint64_t v45;
  uint64_t v46;
  uint64_t v47;
  id v48;
  void *v49;
  id v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  unint64_t v54;
  uint64_t v55;
  id v56;
  uint64_t v57;
  char v58;
  uint64_t v59;
  char v60;
  uint64_t v61;
  unint64_t v62;
  uint64_t v63;
  id v64;
  uint64_t v65;
  id v66;
  double v67;
  uint64_t v68;
  uint64_t v69;
  const char *v70;
  uint64_t v71;
  int v72;
  uint64_t v73;
  unint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  double v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  const char *v83;
  uint64_t v84;
  int v85;
  uint64_t v86;
  unint64_t v87;
  const char *v88;
  uint64_t v89;
  int v90;
  uint64_t v91;
  unint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  char *v98;
  char *v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  id v107;
  uint64_t v108;
  uint64_t v109;
  void *v110;
  uint64_t v111;
  uint64_t v112;
  unint64_t v113;

  v10 = v8;
  v106 = a7;
  v107 = a6;
  v109 = a5;
  v110 = a4;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EEFD6998);
  OUTLINED_FUNCTION_30_0();
  v17 = MEMORY[0x1E0C80A78](v15, v16);
  v19 = (char *)&v97 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v17, v20);
  v101 = (uint64_t)&v97 - v21;
  OUTLINED_FUNCTION_42_8();
  MEMORY[0x1E0C80A78](v22, v23);
  v25 = (char *)&v97 - v24;
  v26 = OUTLINED_FUNCTION_72_2();
  OUTLINED_FUNCTION_8_13();
  MEMORY[0x1E0C80A78](v27, v28);
  OUTLINED_FUNCTION_29_7();
  v97 = v29;
  OUTLINED_FUNCTION_42_8();
  MEMORY[0x1E0C80A78](v30, v31);
  v99 = (char *)&v97 - v32;
  OUTLINED_FUNCTION_42_8();
  MEMORY[0x1E0C80A78](v33, v34);
  v36 = (char *)&v97 - v35;
  v102 = a1;
  sub_1B258A628(a1, (uint64_t)v25);
  OUTLINED_FUNCTION_118_0((uint64_t)v25, 1, v26);
  v98 = v19;
  v100 = v9;
  if (v37)
  {
    v38 = v10;
    sub_1B250ADF4((uint64_t)v25);
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v9 + 32))(v36, v25, v26);
    v38 = v10;
    sub_1B24BCAD8((uint64_t)v36, a2, a3, v110, (uint64_t)v107, v106, a8);
    (*(void (**)(char *, uint64_t))(v9 + 8))(v36, v26);
  }
  v39 = a3;
  v40 = a2;
  v41 = v110;
  if (v110)
  {
    v106 = a8;
    v107 = v110;
    v42 = OUTLINED_FUNCTION_77_9(objc_msgSend(v107, sel_recognition));
    OUTLINED_FUNCTION_69_2();
    OUTLINED_FUNCTION_60(v43, (unint64_t *)&unk_1EEFD68C0);
    v44 = OUTLINED_FUNCTION_170_0();

    if ((unint64_t)v44 >> 62)
    {
      swift_bridgeObjectRetain();
      v45 = OUTLINED_FUNCTION_659();
      OUTLINED_FUNCTION_107();
    }
    else
    {
      v45 = *(_QWORD *)((v44 & 0xFFFFFFFFFFFFF8) + 0x10);
    }
    v104 = v39;
    v105 = v38;
    v103 = v40;
    v108 = v26;
    if (v45)
    {
      v112 = MEMORY[0x1E0DEE9D8];
      OUTLINED_FUNCTION_62_11();
      if ((v45 & 0x8000000000000000) != 0)
      {
        __break(1u);
        goto LABEL_49;
      }
      v46 = 0;
      v47 = v112;
      do
      {
        if ((v44 & 0xC000000000000001) != 0)
          v48 = (id)MEMORY[0x1B5E252C4](v46, v44);
        else
          v48 = OUTLINED_FUNCTION_54_1(v44 + 8 * v46);
        v49 = v48;
        v50 = objc_msgSend(v48, sel_tokenName);
        v51 = sub_1B25CCA18();
        v53 = v52;

        v112 = v47;
        v54 = *(_QWORD *)(v47 + 16);
        if (v54 >= *(_QWORD *)(v47 + 24) >> 1)
        {
          sub_1B2505328();
          v47 = v112;
        }
        ++v46;
        *(_QWORD *)(v47 + 16) = v54 + 1;
        v55 = v47 + 16 * v54;
        *(_QWORD *)(v55 + 32) = v51;
        *(_QWORD *)(v55 + 40) = v53;
      }
      while (v45 != v46);
      OUTLINED_FUNCTION_107();
    }
    else
    {
      OUTLINED_FUNCTION_107();
      v47 = MEMORY[0x1E0DEE9D8];
    }
    v56 = v107;
    v112 = v47;
    __swift_instantiateConcreteTypeFromMangledName(&qword_1ED36CFD0);
    sub_1B24BFF74();
    OUTLINED_FUNCTION_39_9();
    swift_bridgeObjectRelease();
    if ((OUTLINED_FUNCTION_58_11() & 1) != 0)
    {
      v57 = -1;
    }
    else
    {
      sub_1B24BFBAC();
      if ((v58 & 1) == 0)
      {
        v59 = sub_1B24BFBAC();
        if ((v60 & 1) != 0)
        {
LABEL_61:
          __break(1u);
          return;
        }
        v57 = v59;
        if ((v59 & 0x8000000000000000) == 0)
          goto LABEL_25;
        __break(1u);
      }
      v57 = -1;
    }
LABEL_25:
    v112 = 0;
    v113 = 0xE000000000000000;
    sub_1B25CD2DC();
    swift_bridgeObjectRelease();
    OUTLINED_FUNCTION_54_10();
    v112 = v61;
    v113 = v62;
    sub_1B25CCAE4();
    swift_bridgeObjectRelease();
    OUTLINED_FUNCTION_13_12();
    OUTLINED_FUNCTION_58_11();
    sub_1B25CCAE4();
    swift_bridgeObjectRelease();
    v63 = OUTLINED_FUNCTION_28_14();
    OUTLINED_FUNCTION_68_0(v63, sel_firstResultAfterResume);
    sub_1B25CCAE4();
    swift_bridgeObjectRelease();
    OUTLINED_FUNCTION_18_13();
    v111 = v57;
    sub_1B25CD570();
    sub_1B25CCAE4();
    OUTLINED_FUNCTION_10_0();
    sub_1B256CAD4("ES: Final Recognition", 21, 2, v112, v113, v106);

    OUTLINED_FUNCTION_10_0();
    v40 = v103;
    v39 = v104;
    v26 = v108;
    v41 = v110;
  }
  v44 = *(_QWORD *)(v109 + 16);
  if ((unint64_t)v44 >= 2 && v41)
  {
    v36 = (char *)(v109 + 32);
    v64 = OUTLINED_FUNCTION_77_9(objc_msgSend(v41, sel_recognition));
    OUTLINED_FUNCTION_69_2();
    OUTLINED_FUNCTION_60(v65, (unint64_t *)&unk_1EEFD68C0);
    v45 = OUTLINED_FUNCTION_170_0();

    if (!(v45 >> 62))
    {
      if (*(_QWORD *)((v45 & 0xFFFFFFFFFFFFF8) + 0x10))
        goto LABEL_30;
      goto LABEL_50;
    }
LABEL_49:
    OUTLINED_FUNCTION_22_9();
    v96 = sub_1B25CD474();
    OUTLINED_FUNCTION_10_0();
    if (v96)
    {
LABEL_30:
      sub_1B24B2E98(0, (v45 & 0xC000000000000001) == 0, v45);
      if ((v45 & 0xC000000000000001) != 0)
        OUTLINED_FUNCTION_64_13();
      v66 = *(id *)(v45 + 32);
      OUTLINED_FUNCTION_10_0();
      objc_msgSend(v66, sel_start);

      OUTLINED_FUNCTION_53_11();
      if (v37)
      {
        __break(1u);
      }
      else if (v67 > -9.22337204e18)
      {
        if (v67 < 9.22337204e18)
        {
          v68 = (uint64_t)v67;
          if (v44 <= (uint64_t)v67)
            return;
          v108 = v26;
          if ((v68 & 0x8000000000000000) == 0)
          {
            v69 = *(_QWORD *)&v36[16 * v68 + 8];
            OUTLINED_FUNCTION_43_10();
            sub_1B256BEE4(v70, v71, v72, v73, v74, v75);
            sub_1B256C4EC("ES: Leading Silence Process", 27, 2, 0, 0xE000000000000000, v69);
            v76 = v101;
            sub_1B258A628(v102, v101);
            OUTLINED_FUNCTION_118_0(v76, 1, v108);
            if (v37)
            {
              sub_1B250ADF4(v76);
            }
            else
            {
              v77 = v100;
              v78 = (uint64_t)v99;
              (*(void (**)(char *, uint64_t, uint64_t))(v100 + 32))(v99, v76, v108);
              sub_1B24BCA60(v78, v40, v39, v69);
              (*(void (**)(uint64_t, uint64_t))(v77 + 8))(v78, v108);
            }
            OUTLINED_FUNCTION_53_11();
            if (!v37)
            {
              if (v79 > -9.22337204e18)
              {
                if (v79 < 9.22337204e18)
                {
                  v80 = (uint64_t)v79;
                  if (v44 <= (uint64_t)v79)
                    return;
                  v81 = v100;
                  if ((v80 & 0x8000000000000000) == 0)
                  {
                    v82 = *(_QWORD *)&v36[16 * v80 + 8];
                    v83 = (const char *)OUTLINED_FUNCTION_44_12();
                    sub_1B256BEE4(v83, v84, v85, v86, v87, v69);
                    v88 = (const char *)OUTLINED_FUNCTION_44_12();
                    sub_1B256C4EC(v88, v89, v90, v91, v92, v82);
                    v93 = (uint64_t)v98;
                    OUTLINED_FUNCTION_78_5(v102);
                    v94 = v108;
                    OUTLINED_FUNCTION_118_0(v93, 1, v108);
                    if (v37)
                    {
                      OUTLINED_FUNCTION_76_9();
                    }
                    else
                    {
                      v95 = v97;
                      (*(void (**)(uint64_t, uint64_t, uint64_t))(v81 + 32))(v97, v93, v94);
                      sub_1B24BCA6C(v95, v40, v39, v82);
                      (*(void (**)(uint64_t, uint64_t))(v81 + 8))(v95, v94);
                    }
                    return;
                  }
                  goto LABEL_60;
                }
LABEL_59:
                __break(1u);
LABEL_60:
                __break(1u);
                goto LABEL_61;
              }
LABEL_58:
              __break(1u);
              goto LABEL_59;
            }
LABEL_57:
            __break(1u);
            goto LABEL_58;
          }
LABEL_56:
          __break(1u);
          goto LABEL_57;
        }
LABEL_55:
        __break(1u);
        goto LABEL_56;
      }
      __break(1u);
      goto LABEL_55;
    }
LABEL_50:
    OUTLINED_FUNCTION_10_0();
  }
}

void sub_1B258969C()
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
  char v11;
  _QWORD v12[2];

  OUTLINED_FUNCTION_59_0();
  v12[0] = v0;
  v12[1] = v1;
  v3 = v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EEFD6998);
  OUTLINED_FUNCTION_30_0();
  MEMORY[0x1E0C80A78](v4, v5);
  v7 = (char *)v12 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = OUTLINED_FUNCTION_72_2();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x1E0C80A78](v8, v10);
  OUTLINED_FUNCTION_12_15();
  OUTLINED_FUNCTION_118_0((uint64_t)v7, 1, v8);
  if (v11)
  {
    OUTLINED_FUNCTION_32_16();
    __swift_storeEnumTagSinglePayload(v3, 1, 1, v8);
  }
  else
  {
    OUTLINED_FUNCTION_17_14(*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v9 + 32));
    sub_1B24BEBAC();
    OUTLINED_FUNCTION_35_15(*(uint64_t (**)(uint64_t, uint64_t))(v9 + 8));
  }
  OUTLINED_FUNCTION_7_1();
}

void sub_1B258978C(uint64_t a1, unint64_t a2, uint64_t a3)
{
  sub_1B256BEE4("ES: Time to Word", 16, 2, a1, a2, a3);
  OUTLINED_FUNCTION_7_14("ES: Time to Word", 16);
}

uint64_t sub_1B25897E4(uint64_t a1, __int128 *a2)
{
  return sub_1B25897F4(a1, a2, 101);
}

uint64_t sub_1B25897EC(uint64_t a1, __int128 *a2)
{
  return sub_1B25897F4(a1, a2, 102);
}

uint64_t sub_1B25897F4(uint64_t result, __int128 *a2, uint64_t a3)
{
  uint64_t v4;

  if ((result & 1) != 0)
  {
    v4 = sub_1B2599590(a2);
    sub_1B25990D4(a3, v4);
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t Instrumentation.deinit()
{
  uint64_t v0;

  swift_release();
  swift_release();
  swift_release();
  swift_release();
  return v0;
}

uint64_t Instrumentation.__deallocating_deinit()
{
  Instrumentation.deinit();
  return swift_deallocClassInstance();
}

_QWORD *sub_1B2589894()
{
  _QWORD *v0;
  _QWORD *v1;
  uint64_t v2;

  v1 = v0;
  type metadata accessor for SelfLoggingHelper();
  v2 = OUTLINED_FUNCTION_8_4();
  *(_QWORD *)(v2 + 16) = objc_msgSend((id)objc_opt_self(), sel_sharedStream);
  v1[2] = v2;
  type metadata accessor for SignpostHelper();
  swift_allocObject();
  v1[3] = sub_1B256BDCC();
  type metadata accessor for PowerlogHelper();
  v1[4] = OUTLINED_FUNCTION_8_4();
  type metadata accessor for CoreAnalyticsLoggingHelper();
  v1[5] = OUTLINED_FUNCTION_8_4();
  return v1;
}

uint64_t sub_1B2589938(uint64_t a1, uint64_t a2, char **a3, char a4, char a5, double a6, double a7, double a8, double a9, double a10, double a11, double a12, double a13)
{
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
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
  double v38;
  double v39;
  void *v40;
  void *v41;
  int v42;
  int v43;
  int v44;
  char v45;
  void *v46;
  void *v47;
  int v48;
  char v49;
  void *v50;
  unint64_t v51;
  uint64_t v52;
  uint64_t v53;
  char v54;
  uint64_t v55;
  uint64_t v56;
  char v57;
  void *v58;
  void *v59;
  double v60;
  void *v61;
  void *v62;
  void *v63;
  uint64_t v64;
  unsigned int v65;
  char v66;
  double v67;
  char **v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  double v73;
  id v74;
  uint64_t v75;
  id v76;
  _BYTE *v77;
  id v78;
  unint64_t v79;
  double v80;
  int v81;
  BOOL v82;
  int v83;
  double v84;
  char v85;
  unint64_t v86;
  uint64_t v87;
  uint64_t v88;
  mach_timebase_info v89;
  id v90;
  uint64_t v91;
  uint64_t v92;
  unint64_t v93;
  uint64_t v94;
  uint64_t v95;
  double *v96;
  double v97;
  id v98;
  uint64_t v99;
  uint64_t v100;
  id v101;
  id v102;
  double v103;
  double v104;
  float v105;
  char **v107;
  mach_timebase_info info;
  uint64_t v114;

  v15 = v13;
  v114 = *MEMORY[0x1E0C80C00];
  *(_QWORD *)(v15 + 16) = 0;
  *(_QWORD *)(v15 + 24) = 0;
  *(_DWORD *)(v15 + 32) = 0;
  *(_BYTE *)(v15 + 36) = 1;
  *(_QWORD *)(v15 + 40) = 0;
  *(_QWORD *)(v15 + 48) = 0;
  *(_DWORD *)(v15 + 56) = 0;
  *(_BYTE *)(v15 + 60) = 1;
  *(_QWORD *)(v15 + 72) = 0;
  *(_QWORD *)(v15 + 80) = 0;
  *(_QWORD *)(v15 + 64) = 0;
  *(_QWORD *)(v15 + 85) = 0;
  *(_OWORD *)(v15 + 96) = 0u;
  *(_OWORD *)(v15 + 112) = 0u;
  *(_QWORD *)(v15 + 128) = 0;
  *(_BYTE *)(v15 + 136) = 1;
  *(_QWORD *)(v15 + 144) = 0;
  *(_BYTE *)(v15 + 152) = 1;
  *(_DWORD *)(v15 + 156) = 0;
  *(_BYTE *)(v15 + 160) = 1;
  *(_WORD *)(v15 + 161) = 0;
  *(_BYTE *)(v15 + 163) = 0;
  *(_QWORD *)(v15 + 168) = 0;
  *(_BYTE *)(v15 + 176) = 0;
  *(_OWORD *)(v15 + 184) = xmmword_1B25DCAE0;
  *(_OWORD *)(v15 + 200) = xmmword_1B25DCAE0;
  *(_QWORD *)(v15 + 216) = 0;
  *(_QWORD *)(v15 + 224) = 0;
  *(_QWORD *)(v15 + 232) = 0xE000000000000000;
  *(_BYTE *)(v15 + 240) = 0;
  *(_DWORD *)(v15 + 244) = 0;
  *(_BYTE *)(v15 + 248) = 0;
  *(_OWORD *)(v15 + 256) = 0u;
  *(_OWORD *)(v15 + 272) = 0u;
  *(_OWORD *)(v15 + 288) = 0u;
  if (a1)
  {
    OUTLINED_FUNCTION_20_13(0xD000000000000015, 0x80000001B25D63A0);
    *(_QWORD *)(v15 + 16) = v23;
    *(_QWORD *)(v15 + 24) = v24;
    OUTLINED_FUNCTION_19_10();
    v25 = OUTLINED_FUNCTION_67_11();
    OUTLINED_FUNCTION_20_13(v25, v26);
    *(_QWORD *)(v15 + 40) = v27;
    *(_QWORD *)(v15 + 48) = v28;
    OUTLINED_FUNCTION_19_10();
    OUTLINED_FUNCTION_20_13(0x646F6365642D4D50, 0xEA00000000007265);
    *(_QWORD *)(v15 + 96) = v29;
    *(_QWORD *)(v15 + 104) = v30;
    OUTLINED_FUNCTION_19_10();
    OUTLINED_FUNCTION_20_13(0x7475706E692D4D50, 0xE800000000000000);
    *(_QWORD *)(v15 + 184) = v31;
    *(_QWORD *)(v15 + 192) = v32;
    OUTLINED_FUNCTION_19_10();
    OUTLINED_FUNCTION_20_13(0x757074756F2D4D50, 0xE900000000000074);
    *(_QWORD *)(v15 + 200) = v33;
    *(_QWORD *)(v15 + 208) = v34;
    OUTLINED_FUNCTION_19_10();
    OUTLINED_FUNCTION_20_13(0x64657355454E41, 0xE700000000000000);
    v14 = v35;
    v37 = v36;
    OUTLINED_FUNCTION_107();
    *(_QWORD *)(v15 + 224) = v14;
    *(_QWORD *)(v15 + 232) = v37;
    swift_bridgeObjectRelease();
  }
  v38 = 0.0;
  v39 = 0.0;
  if (a2)
  {
    OUTLINED_FUNCTION_16_13(0xD00000000000001BLL, 0x80000001B25D6360);
    v41 = v40;
    v42 = 0;
    v43 = 0;
    if (v40)
    {
      OUTLINED_FUNCTION_57_7();
      v43 = v44;

    }
    OUTLINED_FUNCTION_55_12();
    *(_DWORD *)(v15 + 32) = v43;
    *(_BYTE *)(v15 + 36) = v45;
    OUTLINED_FUNCTION_16_13(5394003, 0xE300000000000000);
    v47 = v46;
    if (v46)
    {
      OUTLINED_FUNCTION_57_7();
      v42 = v48;

    }
    OUTLINED_FUNCTION_55_12();
    *(_DWORD *)(v15 + 56) = v42;
    *(_BYTE *)(v15 + 60) = v49;
    OUTLINED_FUNCTION_16_13(0x6573557265676145, 0xE900000000000064);
    if (v50)
    {
      OUTLINED_FUNCTION_69_10(v50);
      OUTLINED_FUNCTION_79_6();
    }
    else
    {
      LODWORD(v14) = 2;
    }
    *(_BYTE *)(v15 + 80) = v14;
    v51 = OUTLINED_FUNCTION_67_11();
    OUTLINED_FUNCTION_16_13(v51, v52);
    if (v53)
    {
      OUTLINED_FUNCTION_24_16(v53, sel_unsignedIntValue);
      OUTLINED_FUNCTION_79_6();
    }
    else
    {
      LODWORD(v14) = 0;
    }
    OUTLINED_FUNCTION_55_12();
    *(_DWORD *)(v15 + 88) = v14;
    *(_BYTE *)(v15 + 92) = v54;
    v55 = sub_1B25CCA18();
    v57 = v56;
    OUTLINED_FUNCTION_16_13(v55, v56);
    v59 = v58;
    OUTLINED_FUNCTION_44_1();
    if (v59)
    {
      objc_msgSend(v59, sel_doubleValue);
      v39 = v60;

    }
    else
    {
      v39 = 0.0;
    }
    OUTLINED_FUNCTION_16_13(0x7355656D4C746F61, 0xEA00000000006465);
    if (v61)
    {
      OUTLINED_FUNCTION_69_10(v61);
      OUTLINED_FUNCTION_79_6();
    }
    else
    {
      v57 = 2;
    }
    *(_BYTE *)(v15 + 240) = v57;
    OUTLINED_FUNCTION_16_13(0xD00000000000001ELL, 0x80000001B25D6380);
    v63 = v62;
    v64 = OUTLINED_FUNCTION_173();
    if (v63)
    {
      v65 = OUTLINED_FUNCTION_24_16(v64, sel_unsignedIntValue);

    }
    else
    {
      v65 = 0;
    }
    OUTLINED_FUNCTION_55_12();
    *(_DWORD *)(v15 + 244) = v65;
    *(_BYTE *)(v15 + 248) = v66;
  }
  v67 = a7 * 1000.0;
  *(double *)(v15 + 64) = a6;
  *(double *)(v15 + 72) = a7 * 1000.0;
  if (a3)
  {
    v68 = a3;
    v69 = sub_1B258A508(v68);
    if (v69)
    {
      v70 = v69;
      *(_QWORD *)(v15 + 112) = v69;
      swift_bridgeObjectRetain();
      OUTLINED_FUNCTION_44_1();
      *(_DWORD *)(v15 + 156) = 0;
      *(_BYTE *)(v15 + 160) = 0;
      v71 = *(_QWORD *)(v70 + 16);
      if (v71)
      {
        v107 = a3;
        v72 = 0;
        v73 = 0.0;
        a3 = &selRef_unsignedIntegerValue;
        do
        {
          v74 = *(id *)(v70 + 8 * v72 + 32);
          if ((unint64_t)v74 >> 62)
          {
            swift_bridgeObjectRetain();
            v75 = sub_1B25CD474();
          }
          else
          {
            v75 = *(_QWORD *)(((unint64_t)v74 & 0xFFFFFFFFFFFFF8) + 0x10);
            swift_bridgeObjectRetain();
          }
          if (v75 == 2)
          {
            if (((unint64_t)v74 & 0xC000000000000001) != 0)
              OUTLINED_FUNCTION_68_10();
            if (!*(_QWORD *)(((unint64_t)v74 & 0xFFFFFFFFFFFFF8) + 0x10))
            {
              __break(1u);
LABEL_66:
              __break(1u);
LABEL_67:
              __break(1u);
LABEL_68:
              __break(1u);
LABEL_69:
              v87 = sub_1B25CD474();
              if (!v87)
              {
LABEL_70:
                OUTLINED_FUNCTION_44_1();
                v89 = (mach_timebase_info)MEMORY[0x1E0DEE9D8];
                goto LABEL_71;
              }
LABEL_56:
              info = (mach_timebase_info)MEMORY[0x1E0DEE9D8];
              sub_1B250535C();
              if ((v87 & 0x8000000000000000) == 0)
              {
                v88 = 0;
                v89 = info;
                do
                {
                  if (((unint64_t)v74 & 0xC000000000000001) != 0)
                    OUTLINED_FUNCTION_68_10();
                  v90 = OUTLINED_FUNCTION_54_1((uint64_t)v74 + 8 * v88);
                  objc_msgSend(v90, sel_doubleValue);
                  v92 = v91;

                  info = v89;
                  v93 = *(_QWORD *)(*(_QWORD *)&v89 + 16);
                  if (v93 >= *(_QWORD *)(*(_QWORD *)&v89 + 24) >> 1)
                  {
                    sub_1B250535C();
                    v89 = info;
                  }
                  ++v88;
                  *(_QWORD *)(*(_QWORD *)&v89 + 16) = v93 + 1;
                  *(_QWORD *)(*(_QWORD *)&v89 + 8 * v93 + 32) = v92;
                }
                while (v87 != v88);
                OUTLINED_FUNCTION_44_1();
                goto LABEL_71;
              }
LABEL_88:
              __break(1u);
LABEL_89:
              __break(1u);
            }
            v76 = *((id *)v74 + 4);
            v77 = objc_msgSend(v76, sel_unsignedLongLongValue);

            if (((unint64_t)v74 & 0xC000000000000001) != 0)
              OUTLINED_FUNCTION_68_10();
            if (*(_QWORD *)(((unint64_t)v74 & 0xFFFFFFFFFFFFF8) + 0x10) < 2uLL)
              goto LABEL_68;
            v78 = *((id *)v74 + 5);
            OUTLINED_FUNCTION_44_1();
            v74 = objc_msgSend(v78, sel_unsignedLongLongValue);

            if (v74 < v77)
              goto LABEL_66;
            info = 0;
            mach_timebase_info(&info);
            if (info.numer)
            {
              LODWORD(v79) = info.denom;
              v80 = (double)v79 / (double)info.numer * 1000000000.0;
            }
            else
            {
              v80 = 0.0;
            }
            if ((*(_BYTE *)(v15 + 160) & 1) != 0)
              goto LABEL_89;
            v81 = *(_DWORD *)(v15 + 156);
            v82 = __CFADD__(v81, 1);
            v83 = v81 + 1;
            if (v82)
              goto LABEL_67;
            v73 = v73 + (double)(unint64_t)((_BYTE *)v74 - v77) / v80;
            *(_DWORD *)(v15 + 156) = v83;
          }
          else
          {
            OUTLINED_FUNCTION_44_1();
          }
          ++v72;
        }
        while (v71 != v72);
        OUTLINED_FUNCTION_173();
        a3 = v107;
      }
      else
      {
        OUTLINED_FUNCTION_173();
      }
      OUTLINED_FUNCTION_53_11();
      if (v85)
        goto LABEL_85;
      if (v84 <= -1.0)
      {
LABEL_86:
        __break(1u);
        goto LABEL_87;
      }
      if (v84 >= 1.84467441e19)
      {
LABEL_87:
        __break(1u);
        goto LABEL_88;
      }
      *(_QWORD *)(v15 + 144) = (unint64_t)v84;
      *(_BYTE *)(v15 + 152) = 0;
    }
    v86 = sub_1B258A568(v68);
    if (v86)
    {
      v74 = (id)v86;
      if (v86 >> 62)
        goto LABEL_69;
      v87 = *(_QWORD *)((v86 & 0xFFFFFFFFFFFFFF8) + 0x10);
      if (!v87)
        goto LABEL_70;
      goto LABEL_56;
    }
    v89 = 0;
LABEL_71:
    *(mach_timebase_info *)(v15 + 120) = v89;
    swift_bridgeObjectRelease();
    v94 = *(_QWORD *)(v15 + 120);
    v38 = 0.0;
    if (v94)
    {
      v95 = *(_QWORD *)(v94 + 16);
      if (v95)
      {
        v96 = (double *)(v94 + 32);
        do
        {
          v97 = *v96++;
          v38 = v38 + v97;
          --v95;
        }
        while (v95);
      }
    }
    v98 = objc_msgSend(v68, sel_itnDurationInNs);
    v99 = sub_1B25CD6E4();

    *(_QWORD *)(v15 + 128) = v99;
    *(_BYTE *)(v15 + 136) = 0;
    v101 = OUTLINED_FUNCTION_24_16(v100, sel_isEmojiPersonalizationUsed);
    *(_BYTE *)(v15 + 161) = (_BYTE)v101;
    v102 = OUTLINED_FUNCTION_24_16((uint64_t)v101, sel_isEmojiDisambiguationUsed);
    *(_BYTE *)(v15 + 162) = (_BYTE)v102;
    *(_BYTE *)(v15 + 163) = OUTLINED_FUNCTION_24_16((uint64_t)v102, sel_isEmojiExpectedButNotRecognized);
    *(_QWORD *)(v15 + 168) = sub_1B258A5D4(v68);
    OUTLINED_FUNCTION_19_10();
    objc_msgSend(v68, sel_cpuMillionInstructionsPerSecond);
    v104 = v103;

    if ((~*(_QWORD *)&v104 & 0x7FF0000000000000) != 0)
    {
      if (v104 > -1.0)
      {
        if (v104 < 1.84467441e19)
        {
          *(_QWORD *)(v15 + 216) = (unint64_t)v104;
          v67 = *(double *)(v15 + 72);
          goto LABEL_79;
        }
        goto LABEL_84;
      }
    }
    else
    {
      __break(1u);
    }
    __break(1u);
LABEL_84:
    __break(1u);
LABEL_85:
    __break(1u);
    goto LABEL_86;
  }
LABEL_79:

  if (v67 > 0.0)
  {
    v105 = v39 / (v67 + v38 * -1000.0);
    *(float *)(v15 + 84) = v105;
  }
  *(_BYTE *)(v15 + 176) = a4 & 1;
  *(_BYTE *)(v15 + 81) = a5 & 1;
  *(_BYTE *)(v15 + 83) = a5 & 1;
  *(_BYTE *)(v15 + 82) = 0;
  *(double *)(v15 + 256) = a8;
  *(double *)(v15 + 264) = a9;
  *(double *)(v15 + 272) = a10;
  *(double *)(v15 + 280) = a11;
  *(double *)(v15 + 288) = a12;
  *(double *)(v15 + 296) = a13;
  return v15;
}

uint64_t RequestEndMetrics.deinit()
{
  uint64_t v0;

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t RequestEndMetrics.__deallocating_deinit()
{
  RequestEndMetrics.deinit();
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for Instrumentation()
{
  return objc_opt_self();
}

uint64_t method lookup function for Instrumentation()
{
  return swift_lookUpClassMethod();
}

uint64_t type metadata accessor for RequestEndMetrics()
{
  return objc_opt_self();
}

uint64_t method lookup function for RequestEndMetrics()
{
  return swift_lookUpClassMethod();
}

uint64_t destroy for RequestParameters()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for RequestParameters(uint64_t a1, uint64_t a2)
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
  *(_BYTE *)(a1 + 32) = *(_BYTE *)(a2 + 32);
  v5 = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 48) = v5;
  *(_WORD *)(a1 + 56) = *(_WORD *)(a2 + 56);
  *(_BYTE *)(a1 + 58) = *(_BYTE *)(a2 + 58);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for RequestParameters(uint64_t a1, uint64_t a2)
{
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + 32) = *(_BYTE *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + 56) = *(_BYTE *)(a2 + 56);
  *(_BYTE *)(a1 + 57) = *(_BYTE *)(a2 + 57);
  *(_BYTE *)(a1 + 58) = *(_BYTE *)(a2 + 58);
  return a1;
}

__n128 __swift_memcpy59_8(uint64_t a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;
  __int128 v4;

  result = *(__n128 *)a2;
  v3 = *(_OWORD *)(a2 + 16);
  v4 = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 43) = *(_OWORD *)(a2 + 43);
  *(_OWORD *)(a1 + 16) = v3;
  *(_OWORD *)(a1 + 32) = v4;
  *(__n128 *)a1 = result;
  return result;
}

uint64_t assignWithTake for RequestParameters(uint64_t a1, uint64_t a2)
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
  v6 = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 48) = v6;
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + 56) = *(_BYTE *)(a2 + 56);
  *(_BYTE *)(a1 + 57) = *(_BYTE *)(a2 + 57);
  *(_BYTE *)(a1 + 58) = *(_BYTE *)(a2 + 58);
  return a1;
}

uint64_t getEnumTagSinglePayload for RequestParameters(uint64_t a1, int a2)
{
  unint64_t v2;

  if (a2)
  {
    if (a2 < 0 && *(_BYTE *)(a1 + 59))
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

uint64_t storeEnumTagSinglePayload for RequestParameters(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_BYTE *)(result + 58) = 0;
    *(_WORD *)(result + 56) = 0;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 59) = 1;
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
    *(_BYTE *)(result + 59) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for RequestParameters()
{
  return &type metadata for RequestParameters;
}

uint64_t sub_1B258A508(void *a1)
{
  id v1;
  void *v2;
  uint64_t v3;

  v1 = objc_msgSend(a1, sel_allItnRunIntervals);
  if (!v1)
    return 0;
  v2 = v1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED36CFE0);
  v3 = sub_1B25CCBA4();

  return v3;
}

uint64_t sub_1B258A568(void *a1)
{
  id v1;
  void *v2;
  uint64_t v3;

  v1 = objc_msgSend(a1, sel_pauseDurations);
  if (!v1)
    return 0;
  v2 = v1;
  sub_1B24ADA58(0, (unint64_t *)&qword_1EEFD7478);
  v3 = sub_1B25CCBA4();

  return v3;
}

uint64_t sub_1B258A5D4(void *a1)
{
  id v1;
  void *v2;
  uint64_t v3;

  v1 = objc_msgSend(a1, sel_recognizedEmojis);
  if (!v1)
    return 0;
  v2 = v1;
  v3 = sub_1B25CCBA4();

  return v3;
}

uint64_t sub_1B258A628(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEFD6998);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t OUTLINED_FUNCTION_5_15()
{
  uint64_t v0;
  uint64_t v1;

  return sub_1B258A628(v1, v0);
}

void OUTLINED_FUNCTION_7_14(const char *a1, uint64_t a2)
{
  uint64_t v2;

  sub_1B256C4EC(a1, a2, 2, 0, 0xE000000000000000, v2);
}

uint64_t OUTLINED_FUNCTION_9_15()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v3 + 32))(v2, v1, v0);
}

uint64_t OUTLINED_FUNCTION_12_15()
{
  uint64_t v0;
  uint64_t v1;

  return sub_1B258A628(v0, v1);
}

uint64_t OUTLINED_FUNCTION_13_12()
{
  return sub_1B25CCAE4();
}

uint64_t OUTLINED_FUNCTION_14_10()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 8))(v1, v0);
}

void OUTLINED_FUNCTION_16_13(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  sub_1B2549194(a1, a2, v2);
}

uint64_t OUTLINED_FUNCTION_17_14@<X0>(uint64_t (*a1)(uint64_t, uint64_t, uint64_t)@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  return a1(v3, v2, v1);
}

uint64_t OUTLINED_FUNCTION_18_13()
{
  return sub_1B25CCAE4();
}

uint64_t OUTLINED_FUNCTION_19_10()
{
  return swift_bridgeObjectRelease();
}

void OUTLINED_FUNCTION_20_13(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  sub_1B254914C(a1, a2, v2);
}

uint64_t OUTLINED_FUNCTION_22_9()
{
  return swift_bridgeObjectRetain();
}

uint64_t OUTLINED_FUNCTION_23_16()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v3 + 32))(v2, v1, v0);
}

id OUTLINED_FUNCTION_24_16(uint64_t a1, const char *a2)
{
  void *v2;

  return objc_msgSend(v2, a2);
}

uint64_t OUTLINED_FUNCTION_26_15()
{
  uint64_t v0;

  return v0;
}

void OUTLINED_FUNCTION_27_9()
{
  sub_1B25882F0();
}

uint64_t OUTLINED_FUNCTION_28_14()
{
  return sub_1B25CCAE4();
}

uint64_t OUTLINED_FUNCTION_31_9()
{
  uint64_t v0;
  uint64_t v1;

  return sub_1B258A628(v0, v1);
}

uint64_t OUTLINED_FUNCTION_32_16()
{
  uint64_t v0;

  return sub_1B250ADF4(v0);
}

uint64_t OUTLINED_FUNCTION_35_15@<X0>(uint64_t (*a1)(uint64_t, uint64_t)@<X8>)
{
  uint64_t v1;
  uint64_t v2;

  return a1(v2, v1);
}

uint64_t OUTLINED_FUNCTION_36_11()
{
  uint64_t v0;

  return sub_1B250ADF4(v0);
}

uint64_t OUTLINED_FUNCTION_37_10(uint64_t a1)
{
  uint64_t v1;

  return sub_1B258A628(a1, v1);
}

uint64_t OUTLINED_FUNCTION_39_9()
{
  return sub_1B25CC940();
}

void OUTLINED_FUNCTION_41_14()
{
  uint64_t v0;

  *(_QWORD *)(v0 - 96) = 0;
  *(_QWORD *)(v0 - 88) = 0xE000000000000000;
}

uint64_t OUTLINED_FUNCTION_44_12()
{
  uint64_t v0;

  return v0;
}

uint64_t OUTLINED_FUNCTION_48_10()
{
  return sub_1B25CCE20();
}

uint64_t OUTLINED_FUNCTION_49_12()
{
  return sub_1B25CCE08();
}

BOOL OUTLINED_FUNCTION_50_11(os_log_type_t a1)
{
  NSObject *v1;

  return os_log_type_enabled(v1, a1);
}

id OUTLINED_FUNCTION_57_7()
{
  uint64_t v0;
  void *v1;

  return objc_msgSend(v1, (SEL)(v0 + 2770));
}

id OUTLINED_FUNCTION_58_11()
{
  uint64_t v0;
  void *v1;

  return objc_msgSend(v1, (SEL)(v0 + 536));
}

uint64_t OUTLINED_FUNCTION_59_10()
{
  uint64_t v0;

  return sub_1B250ADF4(v0);
}

uint64_t OUTLINED_FUNCTION_61_12()
{
  uint64_t v0;

  return sub_1B250ADF4(v0);
}

void OUTLINED_FUNCTION_62_11()
{
  sub_1B2505328();
}

uint64_t OUTLINED_FUNCTION_63_11(uint64_t a1)
{
  uint64_t v1;

  return sub_1B258A628(a1, v1);
}

void OUTLINED_FUNCTION_64_13()
{
  JUMPOUT(0x1B5E252C4);
}

unint64_t OUTLINED_FUNCTION_67_11()
{
  return 0xD000000000000011;
}

void OUTLINED_FUNCTION_68_10()
{
  JUMPOUT(0x1B5E252C4);
}

id OUTLINED_FUNCTION_69_10(void *a1)
{
  uint64_t v1;

  return objc_msgSend(a1, (SEL)(v1 + 1864));
}

id OUTLINED_FUNCTION_72_11(uint64_t a1, const char *a2)
{
  void *v2;

  return objc_msgSend(v2, a2);
}

uint64_t OUTLINED_FUNCTION_74_8()
{
  return sub_1B25CCAE4();
}

uint64_t OUTLINED_FUNCTION_76_9()
{
  uint64_t v0;

  return sub_1B250ADF4(v0);
}

id OUTLINED_FUNCTION_77_9(void *a1)
{
  uint64_t v1;

  return objc_msgSend(a1, (SEL)(v1 + 290));
}

uint64_t OUTLINED_FUNCTION_78_5(uint64_t a1)
{
  uint64_t v1;

  return sub_1B258A628(a1, v1);
}

void OUTLINED_FUNCTION_79_6()
{
  void *v0;

}

uint64_t sub_1B258A968()
{
  return swift_initClassMetadata2();
}

uint64_t sub_1B258A9B4()
{
  uint64_t v0;

  swift_unknownObjectWeakDestroy();
  swift_unknownObjectWeakDestroy();
  swift_unknownObjectWeakDestroy();
  swift_release();
  return v0;
}

uint64_t sub_1B258A9E8()
{
  sub_1B258A9B4();
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for SpeechAnalyzerClientInterface(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for SpeechAnalyzerClientInterface);
}

void sub_1B258AA14(void (*a1)(id *), uint64_t a2, unint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  void *v14;
  unint64_t v15;
  unint64_t v16;
  uint64_t v17;
  unint64_t v18;
  uint64_t v19;
  void (*v20)(id *);
  uint64_t v21;
  id v22;
  uint64_t v23;

  v4 = v3;
  v20 = a1;
  v21 = a2;
  v6 = type metadata accessor for CommandRecognizer.Interpretation(0);
  v19 = *(_QWORD *)(v6 - 8);
  MEMORY[0x1E0C80A78](v6, v7);
  v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a3 >> 62)
    goto LABEL_18;
  v10 = *(_QWORD *)((a3 & 0xFFFFFFFFFFFFF8) + 0x10);
  while (v10)
  {
    v23 = MEMORY[0x1E0DEE9D8];
    sub_1B2505604(0, v10 & ~(v10 >> 63), 0);
    if (v10 < 0)
    {
      __break(1u);
      return;
    }
    v11 = 0;
    v12 = v23;
    v18 = a3 & 0xC000000000000001;
    while (v10 != v11)
    {
      if (v18)
        v13 = (id)MEMORY[0x1B5E252C4](v11, a3);
      else
        v13 = *(id *)(a3 + 8 * v11 + 32);
      v14 = v13;
      v22 = v13;
      v20(&v22);
      if (v4)
      {
        swift_release();

        return;
      }
      v4 = 0;

      v23 = v12;
      v16 = *(_QWORD *)(v12 + 16);
      v15 = *(_QWORD *)(v12 + 24);
      if (v16 >= v15 >> 1)
      {
        sub_1B2505604(v15 > 1, v16 + 1, 1);
        v12 = v23;
      }
      ++v11;
      *(_QWORD *)(v12 + 16) = v16 + 1;
      sub_1B2594514((uint64_t)v9, v12+ ((*(unsigned __int8 *)(v19 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v19 + 80))+ *(_QWORD *)(v19 + 72) * v16);
      if (v10 == v11)
        return;
    }
    __break(1u);
LABEL_18:
    swift_bridgeObjectRetain();
    v10 = sub_1B25CD474();
    swift_bridgeObjectRelease();
  }
}

uint64_t sub_1B258ABEC(uint64_t a1, void (*a2)(uint64_t))
{
  uint64_t v3;
  uint64_t result;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v3 = *(_QWORD *)(a1 + 16);
  result = MEMORY[0x1E0DEE9D8];
  if (v3)
  {
    v9 = MEMORY[0x1E0DEE9D8];
    sub_1B25CD384();
    v6 = *(_QWORD *)(type metadata accessor for TranscriptionSegment(0) - 8);
    v7 = a1 + ((*(unsigned __int8 *)(v6 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80));
    v8 = *(_QWORD *)(v6 + 72);
    do
    {
      a2(v7);
      sub_1B25CD36C();
      sub_1B25CD390();
      sub_1B25CD39C();
      sub_1B25CD378();
      v7 += v8;
      --v3;
    }
    while (v3);
    return v9;
  }
  return result;
}

uint64_t sub_1B258ACCC(uint64_t a1, uint64_t (*a2)(uint64_t))
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v12;

  v2 = *(_QWORD *)(a1 + 16);
  v3 = MEMORY[0x1E0DEE9D8];
  if (v2)
  {
    v12 = MEMORY[0x1E0DEE9D8];
    sub_1B25057F0();
    v3 = v12;
    v6 = *(_QWORD *)(sub_1B25CC3B8() - 8);
    v7 = a1 + ((*(unsigned __int8 *)(v6 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80));
    v8 = *(_QWORD *)(v6 + 72);
    do
    {
      v9 = a2(v7);
      v10 = *(_QWORD *)(v12 + 16);
      if (v10 >= *(_QWORD *)(v12 + 24) >> 1)
        sub_1B25057F0();
      *(_QWORD *)(v12 + 16) = v10 + 1;
      *(_QWORD *)(v12 + 8 * v10 + 32) = v9;
      v7 += v8;
      --v2;
    }
    while (v2);
  }
  return v3;
}

uint64_t sub_1B258ADCC(uint64_t a1, uint64_t a2)
{
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
  unint64_t v16;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;

  v4 = sub_1B25CC388();
  v19 = *(_QWORD *)(v4 - 8);
  v20 = v4;
  MEMORY[0x1E0C80A78](v4, v5);
  v7 = (char *)&v18 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = *(_QWORD *)(a1 + 16);
  if (v8)
  {
    v21 = MEMORY[0x1E0DEE9D8];
    sub_1B25057F0();
    v9 = *(_QWORD *)(sub_1B25CC3B8() - 8);
    v10 = a1 + ((*(unsigned __int8 *)(v9 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80));
    v18 = *(_QWORD *)(v9 + 72);
    v11 = a2;
    do
    {
      v12 = sub_1B25CC394();
      MEMORY[0x1E0C80A78](v12, v13);
      *(&v18 - 2) = v10;
      *(&v18 - 1) = a2;
      v14 = sub_1B258AFA8((void (*)(uint64_t *__return_ptr, char *))sub_1B2594558, (uint64_t)(&v18 - 4));
      (*(void (**)(char *, uint64_t))(v19 + 8))(v7, v20);
      v15 = v21;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_1B25057F0();
        v15 = v21;
      }
      v16 = *(_QWORD *)(v15 + 16);
      if (v16 >= *(_QWORD *)(v15 + 24) >> 1)
      {
        sub_1B25057F0();
        v15 = v21;
      }
      *(_QWORD *)(v15 + 16) = v16 + 1;
      *(_QWORD *)(v15 + 8 * v16 + 32) = v14;
      v10 += v18;
      --v8;
      a2 = v11;
    }
    while (v8);
    sub_1B2534B44(v11);
  }
  else
  {
    sub_1B2534B44(a2);
    return MEMORY[0x1E0DEE9D8];
  }
  return v15;
}

uint64_t sub_1B258AFA8(void (*a1)(uint64_t *__return_ptr, char *), uint64_t a2)
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
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t result;
  uint64_t v18;
  void (*v19)(char *, _QWORD);
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void (*v25)(uint64_t *__return_ptr, char *);
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  char v29[32];
  uint64_t v30;
  uint64_t v31;

  v4 = v3;
  v25 = a1;
  v26 = a2;
  v5 = sub_1B25CC364();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x1E0C80A78](v5, v7);
  v9 = (char *)&v20 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = sub_1B25CC37C();
  v21 = *(_QWORD *)(v10 - 8);
  v22 = v10;
  MEMORY[0x1E0C80A78](v10, v11);
  v13 = (char *)&v20 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1B25CC388();
  sub_1B2531930(&qword_1EEFDB2D8, (void (*)(uint64_t))MEMORY[0x1E0CAF160]);
  v15 = v14;
  v16 = sub_1B25CCE98();
  result = MEMORY[0x1E0DEE9D8];
  if (v16)
  {
    v31 = MEMORY[0x1E0DEE9D8];
    v28 = v16;
    sub_1B25CD384();
    v24 = v15;
    result = sub_1B25CCE8C();
    v18 = v28;
    if ((v28 & 0x8000000000000000) == 0)
    {
      v23 = v2;
      while (v18)
      {
        v28 = v18;
        v19 = (void (*)(char *, _QWORD))sub_1B25CCF58();
        (*(void (**)(char *))(v6 + 16))(v9);
        v19(v29, 0);
        v25(&v30, v9);
        if (v4)
        {
          (*(void (**)(char *, uint64_t))(v6 + 8))(v9, v5);
          (*(void (**)(char *, uint64_t))(v21 + 8))(v13, v22);
          return swift_release();
        }
        (*(void (**)(char *, uint64_t))(v6 + 8))(v9, v5);
        v27 = v30;
        sub_1B25CD36C();
        sub_1B25CD390();
        v4 = 0;
        sub_1B25CD39C();
        sub_1B25CD378();
        result = sub_1B25CCEE0();
        v18 = v28 - 1;
        if (v28 == 1)
        {
          (*(void (**)(char *, uint64_t))(v21 + 8))(v13, v22);
          return v31;
        }
      }
      __break(1u);
    }
    __break(1u);
  }
  return result;
}

void sub_1B258B228(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,void *a21,uint64_t a22,uint64_t a23)
{
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
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
  id v45;
  id v46;
  id v47;
  id v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;

  OUTLINED_FUNCTION_59_0();
  v50 = v25;
  v51 = v23;
  v27 = v26;
  v29 = v28;
  v31 = v30;
  v33 = v32;
  v35 = v34;
  v37 = v36;
  v49 = v38;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EEFD71C0);
  OUTLINED_FUNCTION_30_0();
  MEMORY[0x1E0C80A78](v39, v40);
  OUTLINED_FUNCTION_99_7();
  v41 = sub_1B25CCCDC();
  OUTLINED_FUNCTION_291_0(v24, v42, v43, v41);
  v44 = (_QWORD *)OUTLINED_FUNCTION_8_4();
  v44[2] = 0;
  v44[3] = 0;
  v44[4] = v37;
  v44[5] = v35;
  v44[6] = v33;
  v44[7] = v31;
  v44[8] = v29;
  v44[9] = v27;
  v44[10] = v49;
  v44[11] = v50;
  v44[12] = a21;
  v44[13] = a22;
  v44[14] = a23;
  v44[15] = v51;
  v45 = a21;
  swift_retain();
  swift_bridgeObjectRetain();
  v46 = v33;
  v47 = v31;
  v48 = v29;
  swift_unknownObjectRetain();
  swift_unknownObjectRetain();
  swift_unknownObjectRetain();
  sub_1B24C52C0(v24, (uint64_t)&unk_1EEFDB348, (uint64_t)v44);
  swift_release();
  OUTLINED_FUNCTION_7_1();
}

uint64_t sub_1B258B33C(uint64_t a1, char a2, char a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t (*v5)(uint64_t, _QWORD *, _QWORD, _QWORD);
  _QWORD v7[2];
  __int128 v8;
  uint64_t v9;
  uint64_t v10;

  v4 = *(_QWORD *)(a1 + 40);
  v5 = *(uint64_t (**)(uint64_t, _QWORD *, _QWORD, _QWORD))(a4 + 16);
  v7[0] = *(_QWORD *)a1;
  v7[1] = *(_QWORD *)(a1 + 8);
  v8 = *(_OWORD *)(a1 + 16);
  v9 = *(_QWORD *)(a1 + 32);
  v10 = v4;
  return v5(a4, v7, a2 & 1, a3 & 1);
}

void sub_1B258B39C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  _QWORD *v11;

  __swift_instantiateConcreteTypeFromMangledName(&qword_1EEFD71C0);
  OUTLINED_FUNCTION_30_0();
  MEMORY[0x1E0C80A78](v5, v6);
  OUTLINED_FUNCTION_315_0();
  v7 = OUTLINED_FUNCTION_37_4();
  OUTLINED_FUNCTION_291_0(v2, v8, v9, v7);
  v10 = (_QWORD *)OUTLINED_FUNCTION_8_4();
  v10[2] = 0;
  v10[3] = 0;
  v10[4] = a1;
  v10[5] = a2;
  v11 = (_QWORD *)OUTLINED_FUNCTION_8_4();
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = &unk_1EEFDB1C0;
  v11[5] = v10;
  sub_1B2592600(v2, (uint64_t)&unk_1EEFDB1D0, (uint64_t)v11);
  swift_release();
  OUTLINED_FUNCTION_262();
}

uint64_t sub_1B258B444()
{
  uint64_t v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  OUTLINED_FUNCTION_123_2();
  v2 = v1;
  v4 = v3;
  OUTLINED_FUNCTION_124_5();
  OUTLINED_FUNCTION_124_5();
  OUTLINED_FUNCTION_124_5();
  *(_QWORD *)(v0 + 40) = 0;
  swift_unknownObjectWeakAssign();
  swift_unknownObjectRelease();
  swift_unknownObjectWeakAssign();

  swift_unknownObjectWeakAssign();
  return v0;
}

void sub_1B258B4DC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t *v5;
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
  void *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  unint64_t v27;
  unint64_t v28;
  uint64_t v29;
  unint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;

  OUTLINED_FUNCTION_59_0();
  v38 = v2;
  v39 = v3;
  v37 = v4;
  v6 = __swift_instantiateConcreteTypeFromMangledName(v5);
  v7 = *(_QWORD *)(v6 - 8);
  v8 = *(_QWORD *)(v7 + 64);
  MEMORY[0x1E0C80A78](v6, v9);
  v10 = (char *)&v34 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EEFD71C0);
  OUTLINED_FUNCTION_30_0();
  MEMORY[0x1E0C80A78](v11, v12);
  OUTLINED_FUNCTION_98_7();
  v13 = sub_1B25CC8C8();
  v14 = *(_QWORD *)(v13 - 8);
  MEMORY[0x1E0C80A78](v13, v15);
  OUTLINED_FUNCTION_41_1();
  v18 = v17 - v16;
  if (qword_1ED36CF48 != -1)
    swift_once();
  v19 = __swift_project_value_buffer(v13, (uint64_t)qword_1ED36D980);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v14 + 16))(v18, v19, v13);
  sub_1B24B3798(*(_QWORD *)(v0 + 40) == 0, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SpeechFramework/SpeechAnalyzer/SpeechAnalyzerClientInterface.swift", 104, 2, 31, v18);
  (*(void (**)(uint64_t, uint64_t))(v14 + 8))(v18, v13);
  v20 = OUTLINED_FUNCTION_37_4();
  OUTLINED_FUNCTION_291_0(v1, v21, v22, v20);
  v36 = OUTLINED_FUNCTION_3_10();
  MEMORY[0x1B5E26380](v0 + 16);
  swift_unknownObjectWeakInit();
  swift_unknownObjectRelease();
  v35 = OUTLINED_FUNCTION_3_10();
  v23 = (void *)MEMORY[0x1B5E26380](v0 + 24);
  swift_unknownObjectWeakInit();

  v24 = OUTLINED_FUNCTION_3_10();
  v25 = MEMORY[0x1B5E26380](v0 + 32);
  v34 = v1;
  v26 = (void *)v25;
  swift_unknownObjectWeakInit();

  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))((char *)&v34 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0), v37, v6);
  v27 = (*(unsigned __int8 *)(v7 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
  v28 = (v8 + v27 + 7) & 0xFFFFFFFFFFFFFFF8;
  v29 = v6;
  v30 = (v28 + 15) & 0xFFFFFFFFFFFFFFF8;
  v31 = swift_allocObject();
  *(_QWORD *)(v31 + 16) = 0;
  *(_QWORD *)(v31 + 24) = 0;
  (*(void (**)(unint64_t, char *, uint64_t))(v7 + 32))(v31 + v27, v10, v29);
  *(_QWORD *)(v31 + v28) = v36;
  v32 = v34;
  *(_QWORD *)(v31 + v30) = v35;
  *(_QWORD *)(v31 + ((v30 + 15) & 0xFFFFFFFFFFFFFFF8)) = v24;
  sub_1B24C52C0(v32, v39, v31);
  *(_QWORD *)(v0 + 40) = v33;
  swift_release();
  OUTLINED_FUNCTION_7_1();
}

uint64_t sub_1B258B758(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  _QWORD *v7;
  uint64_t v8;
  uint64_t v9;

  v7[52] = a6;
  v7[53] = a7;
  v7[50] = a4;
  v7[51] = a5;
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEFDB1F8);
  v7[54] = v8;
  v7[55] = *(_QWORD *)(v8 - 8);
  v7[56] = swift_task_alloc();
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEFDB318);
  v7[57] = v9;
  v7[58] = *(_QWORD *)(v9 - 8);
  v7[59] = swift_task_alloc();
  return swift_task_switch();
}

#error "1B258B890: call analysis failed (funcsize=39)"

uint64_t sub_1B258B89C()
{
  OUTLINED_FUNCTION_81();
  OUTLINED_FUNCTION_17();
  return OUTLINED_FUNCTION_8();
}

void sub_1B258B8E8()
{
  uint64_t v0;

  OUTLINED_FUNCTION_249();
  if (*(_QWORD *)(v0 + 392))
    OUTLINED_FUNCTION_74_9();
  OUTLINED_FUNCTION_32_17();
  OUTLINED_FUNCTION_15_3();
  OUTLINED_FUNCTION_136_3();
}

uint64_t sub_1B258BA04(uint64_t a1)
{
  uint64_t v1;

  if (a1)
  {
    OUTLINED_FUNCTION_28_15();
    OUTLINED_FUNCTION_3_10();
    OUTLINED_FUNCTION_15_3();
    OUTLINED_FUNCTION_75_13();
  }
  OUTLINED_FUNCTION_39_10();
  OUTLINED_FUNCTION_36();
  return OUTLINED_FUNCTION_36_1(*(uint64_t (**)(void))(v1 + 8));
}

void sub_1B258BADC()
{
  uint64_t v0;
  _QWORD *v1;

  OUTLINED_FUNCTION_249();
  OUTLINED_FUNCTION_71_12();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED36D060);
  if (OUTLINED_FUNCTION_96_8())
  {
    OUTLINED_FUNCTION_92_8();
  }
  else
  {
    v0 = OUTLINED_FUNCTION_66_5();
    OUTLINED_FUNCTION_110_2(v0, v1);
  }
  OUTLINED_FUNCTION_40_8();
  OUTLINED_FUNCTION_15_3();
  OUTLINED_FUNCTION_97_7();
}

uint64_t sub_1B258BB44(uint64_t a1)
{
  uint64_t v1;

  if (a1)
  {
    OUTLINED_FUNCTION_29_17();
    OUTLINED_FUNCTION_3_10();
    OUTLINED_FUNCTION_15_3();
    OUTLINED_FUNCTION_149_0();
  }
  OUTLINED_FUNCTION_670();
  OUTLINED_FUNCTION_39_10();
  OUTLINED_FUNCTION_36();
  return OUTLINED_FUNCTION_36_1(*(uint64_t (**)(void))(v1 + 8));
}

uint64_t sub_1B258BC38()
{
  OUTLINED_FUNCTION_81();
  OUTLINED_FUNCTION_17();
  return OUTLINED_FUNCTION_8();
}

uint64_t sub_1B258BC84(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  _QWORD *v7;
  uint64_t v8;
  uint64_t v9;

  v7[52] = a6;
  v7[53] = a7;
  v7[50] = a4;
  v7[51] = a5;
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEFDB200);
  v7[54] = v8;
  v7[55] = *(_QWORD *)(v8 - 8);
  v7[56] = swift_task_alloc();
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEFDB280);
  v7[57] = v9;
  v7[58] = *(_QWORD *)(v9 - 8);
  v7[59] = swift_task_alloc();
  return swift_task_switch();
}

#error "1B258BDBC: call analysis failed (funcsize=39)"

uint64_t sub_1B258BDC8()
{
  OUTLINED_FUNCTION_81();
  OUTLINED_FUNCTION_17();
  return OUTLINED_FUNCTION_8();
}

void sub_1B258BE14()
{
  uint64_t v0;

  OUTLINED_FUNCTION_249();
  if (*(_QWORD *)(v0 + 392))
    OUTLINED_FUNCTION_74_9();
  OUTLINED_FUNCTION_32_17();
  OUTLINED_FUNCTION_15_3();
  OUTLINED_FUNCTION_136_3();
}

uint64_t sub_1B258BF30(uint64_t a1)
{
  uint64_t v1;

  if (a1)
  {
    OUTLINED_FUNCTION_28_15();
    OUTLINED_FUNCTION_3_10();
    OUTLINED_FUNCTION_15_3();
    OUTLINED_FUNCTION_75_13();
  }
  OUTLINED_FUNCTION_39_10();
  OUTLINED_FUNCTION_36();
  return OUTLINED_FUNCTION_36_1(*(uint64_t (**)(void))(v1 + 8));
}

void sub_1B258C008()
{
  uint64_t v0;
  _QWORD *v1;

  OUTLINED_FUNCTION_249();
  OUTLINED_FUNCTION_71_12();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED36D060);
  if (OUTLINED_FUNCTION_96_8())
  {
    OUTLINED_FUNCTION_92_8();
  }
  else
  {
    v0 = OUTLINED_FUNCTION_66_5();
    OUTLINED_FUNCTION_110_2(v0, v1);
  }
  OUTLINED_FUNCTION_40_8();
  OUTLINED_FUNCTION_15_3();
  OUTLINED_FUNCTION_97_7();
}

uint64_t sub_1B258C070(uint64_t a1)
{
  uint64_t v1;

  if (a1)
  {
    OUTLINED_FUNCTION_29_17();
    OUTLINED_FUNCTION_3_10();
    OUTLINED_FUNCTION_15_3();
    OUTLINED_FUNCTION_149_0();
  }
  OUTLINED_FUNCTION_670();
  OUTLINED_FUNCTION_39_10();
  OUTLINED_FUNCTION_36();
  return OUTLINED_FUNCTION_36_1(*(uint64_t (**)(void))(v1 + 8));
}

uint64_t sub_1B258C164()
{
  OUTLINED_FUNCTION_81();
  OUTLINED_FUNCTION_17();
  return OUTLINED_FUNCTION_8();
}

uint64_t sub_1B258C1B0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  _QWORD *v7;
  uint64_t v8;
  uint64_t v9;

  v7[52] = a6;
  v7[53] = a7;
  v7[50] = a4;
  v7[51] = a5;
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEFDB210);
  v7[54] = v8;
  v7[55] = *(_QWORD *)(v8 - 8);
  v7[56] = swift_task_alloc();
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEFDB2B0);
  v7[57] = v9;
  v7[58] = *(_QWORD *)(v9 - 8);
  v7[59] = swift_task_alloc();
  return swift_task_switch();
}

#error "1B258C2E8: call analysis failed (funcsize=39)"

uint64_t sub_1B258C2F4()
{
  OUTLINED_FUNCTION_81();
  OUTLINED_FUNCTION_17();
  return OUTLINED_FUNCTION_8();
}

void sub_1B258C340()
{
  uint64_t v0;

  OUTLINED_FUNCTION_249();
  if (*(_QWORD *)(v0 + 392))
    OUTLINED_FUNCTION_74_9();
  OUTLINED_FUNCTION_32_17();
  OUTLINED_FUNCTION_15_3();
  OUTLINED_FUNCTION_136_3();
}

uint64_t sub_1B258C45C(uint64_t a1)
{
  uint64_t v1;

  if (a1)
  {
    OUTLINED_FUNCTION_28_15();
    OUTLINED_FUNCTION_3_10();
    OUTLINED_FUNCTION_15_3();
    OUTLINED_FUNCTION_75_13();
  }
  OUTLINED_FUNCTION_39_10();
  OUTLINED_FUNCTION_36();
  return OUTLINED_FUNCTION_36_1(*(uint64_t (**)(void))(v1 + 8));
}

void sub_1B258C534()
{
  uint64_t v0;
  _QWORD *v1;

  OUTLINED_FUNCTION_249();
  OUTLINED_FUNCTION_71_12();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED36D060);
  if (OUTLINED_FUNCTION_96_8())
  {
    OUTLINED_FUNCTION_92_8();
  }
  else
  {
    v0 = OUTLINED_FUNCTION_66_5();
    OUTLINED_FUNCTION_110_2(v0, v1);
  }
  OUTLINED_FUNCTION_40_8();
  OUTLINED_FUNCTION_15_3();
  OUTLINED_FUNCTION_97_7();
}

uint64_t sub_1B258C59C(uint64_t a1)
{
  uint64_t v1;

  if (a1)
  {
    OUTLINED_FUNCTION_29_17();
    OUTLINED_FUNCTION_3_10();
    OUTLINED_FUNCTION_15_3();
    OUTLINED_FUNCTION_149_0();
  }
  OUTLINED_FUNCTION_670();
  OUTLINED_FUNCTION_39_10();
  OUTLINED_FUNCTION_36();
  return OUTLINED_FUNCTION_36_1(*(uint64_t (**)(void))(v1 + 8));
}

uint64_t sub_1B258C690()
{
  OUTLINED_FUNCTION_81();
  OUTLINED_FUNCTION_17();
  return OUTLINED_FUNCTION_8();
}

void sub_1B258C6DC()
{
  OUTLINED_FUNCTION_15_3();
  OUTLINED_FUNCTION_97_7();
}

void sub_1B258C710(void *a1)
{
  uint64_t v1;
  SEL *v2;
  uint64_t v3;
  uint64_t v5;
  void *v6;

  if (a1)
  {
    OUTLINED_FUNCTION_15_3();
    v5 = MEMORY[0x1B5E26380](v3 + 16);
    if (v5)
    {
      v6 = (void *)v5;
      objc_msgSend(a1, *v2, v5, v1);
      OUTLINED_FUNCTION_51_2();

    }
    else
    {
      OUTLINED_FUNCTION_51_2();
    }
  }
  OUTLINED_FUNCTION_20_2();
}

uint64_t sub_1B258C764(uint64_t a1)
{
  void (*v1)(uint64_t);
  uint64_t v2;

  v1 = *(void (**)(uint64_t))(a1 + 32);
  v2 = swift_retain();
  v1(v2);
  return swift_release();
}

void sub_1B258C790(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;

  v3 = a1 + 16;
  swift_beginAccess();
  v4 = MEMORY[0x1B5E26380](v3);
  if (v4)
  {
    v5 = (void *)v4;
    swift_beginAccess();
    v6 = MEMORY[0x1B5E26380](a2 + 16);
    if (v6)
    {
      v7 = (void *)v6;
      objc_msgSend(v5, sel_speechAnalyzer_didStopLanguageDetectorWithError_, v6, 0);
      swift_unknownObjectRelease();

    }
    else
    {
      swift_unknownObjectRelease();
    }
  }
}

void sub_1B258C834(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  void *v4;

  v3 = a1 + 16;
  swift_beginAccess();
  if (MEMORY[0x1B5E26380](v3))
  {
    swift_beginAccess();
    v4 = (void *)MEMORY[0x1B5E26380](a2 + 16);
    swift_unknownObjectRelease();

  }
}

void sub_1B258C8B0(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;

  v3 = a1 + 16;
  swift_beginAccess();
  v4 = MEMORY[0x1B5E26380](v3);
  if (v4)
  {
    v5 = (void *)v4;
    swift_beginAccess();
    v6 = MEMORY[0x1B5E26380](a2 + 16);
    if (v6)
    {
      v7 = (void *)v6;
      if ((objc_msgSend(v5, sel_respondsToSelector_, sel_speechAnalyzerDidProduceAllTranscriberResults_) & 1) != 0)
        objc_msgSend(v5, sel_speechAnalyzerDidProduceAllTranscriberResults_, v7);
      swift_unknownObjectRelease();

    }
    else
    {
      swift_unknownObjectRelease();
    }
  }
}

void sub_1B258C970()
{
  OUTLINED_FUNCTION_15_3();
  OUTLINED_FUNCTION_97_7();
}

void sub_1B258C9A4(void *a1)
{
  SEL *v1;
  uint64_t v2;
  uint64_t v4;
  void *v5;
  void *v6;

  if (a1)
  {
    OUTLINED_FUNCTION_15_3();
    v4 = MEMORY[0x1B5E26380](v2 + 16);
    if (v4)
    {
      v5 = (void *)v4;
      v6 = (void *)OUTLINED_FUNCTION_121_4();
      objc_msgSend(a1, *v1, v5, v6);
      OUTLINED_FUNCTION_51_2();

    }
    else
    {
      OUTLINED_FUNCTION_51_2();
    }
  }
  OUTLINED_FUNCTION_20_2();
}

uint64_t sub_1B258CA04()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;

  v1 = *v0;
  if (*v0)
  {
    swift_retain_n();
    sub_1B252BAD0();
    v3 = v2;
    v4 = *(_QWORD *)(v2 + 16);
    if (v4 >= *(_QWORD *)(v2 + 24) >> 1)
    {
      sub_1B252BAD0();
      v3 = v20;
    }
    sub_1B2531930(&qword_1EEFD6B80, (void (*)(uint64_t))type metadata accessor for Transcriber);
    *(_QWORD *)(v3 + 16) = v4 + 1;
    v5 = v3 + 16 * v4;
    *(_QWORD *)(v5 + 32) = v1;
    *(_QWORD *)(v5 + 40) = v6;
    swift_release();
  }
  else
  {
    v3 = MEMORY[0x1E0DEE9D8];
  }
  v7 = v0[1];
  if (v7)
  {
    swift_retain_n();
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    {
      sub_1B252BAD0();
      v3 = v21;
    }
    v8 = *(_QWORD *)(v3 + 16);
    if (v8 >= *(_QWORD *)(v3 + 24) >> 1)
    {
      sub_1B252BAD0();
      v3 = v22;
    }
    sub_1B2531930(&qword_1EEFD6B80, (void (*)(uint64_t))type metadata accessor for Transcriber);
    *(_QWORD *)(v3 + 16) = v8 + 1;
    v9 = v3 + 16 * v8;
    *(_QWORD *)(v9 + 32) = v7;
    *(_QWORD *)(v9 + 40) = v10;
    swift_release();
  }
  v11 = v0[2];
  if (v11)
  {
    swift_retain_n();
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    {
      sub_1B252BAD0();
      v3 = v23;
    }
    v12 = *(_QWORD *)(v3 + 16);
    if (v12 >= *(_QWORD *)(v3 + 24) >> 1)
    {
      sub_1B252BAD0();
      v3 = v24;
    }
    sub_1B2531930(qword_1EEFD6828, (void (*)(uint64_t))type metadata accessor for EndpointDetector);
    *(_QWORD *)(v3 + 16) = v12 + 1;
    v13 = v3 + 16 * v12;
    *(_QWORD *)(v13 + 32) = v11;
    *(_QWORD *)(v13 + 40) = v14;
    swift_release();
  }
  v15 = v0[3];
  if (v15)
  {
    swift_retain_n();
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    {
      sub_1B252BAD0();
      v3 = v25;
    }
    v16 = *(_QWORD *)(v3 + 16);
    if (v16 >= *(_QWORD *)(v3 + 24) >> 1)
    {
      sub_1B252BAD0();
      v3 = v26;
    }
    sub_1B2531930(&qword_1EEFD91E8, (void (*)(uint64_t))type metadata accessor for LanguageDetector);
    *(_QWORD *)(v3 + 16) = v16 + 1;
    v17 = v3 + 16 * v16;
    *(_QWORD *)(v17 + 32) = v15;
    *(_QWORD *)(v17 + 40) = v18;
    swift_release();
  }
  return v3;
}

void sub_1B258CCCC()
{
  uint64_t v0;
  id v1;

  v1 = *(id *)(v0 + OBJC_IVAR____TtC6Speech31ObjCSpeechAnalyzerConfiguration_audioFormat);
  OUTLINED_FUNCTION_0();
}

void sub_1B258CD3C(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  v2 = *(void **)(v1 + OBJC_IVAR____TtC6Speech31ObjCSpeechAnalyzerConfiguration_audioFormat);
  *(_QWORD *)(v1 + OBJC_IVAR____TtC6Speech31ObjCSpeechAnalyzerConfiguration_audioFormat) = a1;

}

id sub_1B258CD50(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, void *a5)
{
  char *v5;
  uint64_t v11;
  char *v12;
  __int128 v13;
  void *v14;
  char *v15;
  id v16;
  char *v17;
  id v18;
  id v19;
  objc_super v21;

  v11 = OBJC_IVAR____TtC6Speech31ObjCSpeechAnalyzerConfiguration_audioFormat;
  *(_QWORD *)&v5[OBJC_IVAR____TtC6Speech31ObjCSpeechAnalyzerConfiguration_audioFormat] = 0;
  v12 = &v5[OBJC_IVAR____TtC6Speech31ObjCSpeechAnalyzerConfiguration_modules];
  v13 = *(_OWORD *)(a1 + 16);
  *(_OWORD *)v12 = *(_OWORD *)a1;
  *((_OWORD *)v12 + 1) = v13;
  *((_OWORD *)v12 + 2) = *(_OWORD *)(a1 + 32);
  *((_QWORD *)v12 + 6) = *(_QWORD *)(a1 + 48);
  v14 = *(void **)&v5[v11];
  *(_QWORD *)&v5[v11] = a2;
  v15 = v5;
  sub_1B2593B7C(a1);
  v16 = a2;

  v17 = &v15[OBJC_IVAR____TtC6Speech31ObjCSpeechAnalyzerConfiguration_clientIdentifier];
  *(_QWORD *)v17 = a3;
  *((_QWORD *)v17 + 1) = a4;
  *(_QWORD *)&v15[OBJC_IVAR____TtC6Speech31ObjCSpeechAnalyzerConfiguration_queue] = a5;
  v18 = a5;

  v21.receiver = v15;
  v21.super_class = (Class)type metadata accessor for ObjCSpeechAnalyzerConfiguration();
  v19 = objc_msgSendSuper2(&v21, sel_init);

  sub_1B2593BF8(a1);
  return v19;
}

void sub_1B258CE48()
{
  OUTLINED_FUNCTION_153_2();
  __break(1u);
}

id sub_1B258CE78(uint64_t a1)
{
  return sub_1B25917C4(a1, type metadata accessor for ObjCSpeechAnalyzerConfiguration);
}

uint64_t type metadata accessor for ObjCSpeechAnalyzerConfiguration()
{
  return objc_opt_self();
}

void sub_1B258CF44(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,void *a21,void *a22,void *a23,unsigned __int8 a24,uint64_t a25,uint64_t a26,__int128 a27,uint64_t a28)
{
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  uint64_t v35;
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
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  char *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  id v55;
  uint64_t v56;
  id v57;
  id v58;
  id v59;
  uint64_t v60;
  id v61;
  char *v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  id v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  id v74;
  id ObjectType;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  id v80;
  id v81;
  id v82;
  uint64_t v83;
  uint64_t v84;
  __int128 v85;
  void *v86;
  void *v87;
  uint64_t v88;
  uint64_t v89;
  int v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  _BYTE v94[64];

  OUTLINED_FUNCTION_59_0();
  v30 = v29;
  v92 = v32;
  v93 = v31;
  v91 = v33;
  v81 = v34;
  v76 = v35;
  v37 = v36;
  v90 = a24;
  v89 = a25;
  v87 = v38;
  v88 = a26;
  v85 = a27;
  v84 = a28;
  v86 = a22;
  v82 = a21;
  v80 = a23;
  ObjectType = (id)swift_getObjectType();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EEFD8928);
  OUTLINED_FUNCTION_30_0();
  MEMORY[0x1E0C80A78](v39, v40);
  OUTLINED_FUNCTION_767();
  v83 = v41;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EEFD8930);
  OUTLINED_FUNCTION_30_0();
  MEMORY[0x1E0C80A78](v42, v43);
  OUTLINED_FUNCTION_767();
  v79 = v44;
  v45 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEFD8948);
  v46 = *(_QWORD *)(v45 - 8);
  MEMORY[0x1E0C80A78](v45, v47);
  v49 = (char *)&v71 - ((v48 + 15) & 0xFFFFFFFFFFFFFFF0);
  v78 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEFD8940);
  v77 = *(_QWORD *)(v78 - 8);
  MEMORY[0x1E0C80A78](v78, v50);
  OUTLINED_FUNCTION_767();
  v72 = v51;
  v73 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEFD8938);
  v52 = *(_QWORD *)(v73 - 8);
  MEMORY[0x1E0C80A78](v73, v53);
  OUTLINED_FUNCTION_767();
  v71 = v54;
  v55 = v28;
  v74 = v55;
  v56 = v76;
  sub_1B258D328();
  v57 = objc_allocWithZone((Class)type metadata accessor for ObjCSpeechAnalyzerConfiguration());
  sub_1B2593B7C((uint64_t)v94);
  v58 = v81;
  ObjectType = v81;
  v59 = v30;
  v60 = v37;
  v61 = v59;
  v62 = (char *)sub_1B258CD50((uint64_t)v94, v58, v60, v56, v59);
  (*(void (**)(char *, _QWORD, uint64_t))(v46 + 104))(v49, *MEMORY[0x1E0DF07B8], v45);
  v63 = v71;
  v64 = v72;
  sub_1B25CCCE8();
  (*(void (**)(char *, uint64_t))(v46 + 8))(v49, v45);

  v65 = v79;
  v66 = v73;
  OUTLINED_FUNCTION_307(v79, v63, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v52 + 16));
  __swift_storeEnumTagSinglePayload(v65, 0, 1, v66);
  v67 = v77;
  v68 = v83;
  v69 = v78;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v77 + 16))(v83, v64, v78);
  __swift_storeEnumTagSinglePayload(v68, 0, 1, v69);
  v70 = objc_allocWithZone((Class)type metadata accessor for ObjCSpeechAnalyzer());
  sub_1B258D89C(v87, v62, v65, v68, v86, v90, v89, v88, v85, *((uint64_t *)&v85 + 1), v84);

  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  sub_1B2593BF8((uint64_t)v94);
  (*(void (**)(uint64_t, uint64_t))(v67 + 8))(v64, v69);
  OUTLINED_FUNCTION_156(v63, *(uint64_t (**)(uint64_t, uint64_t))(v52 + 8));
  swift_getObjectType();
  swift_deallocPartialClassInstance();
  OUTLINED_FUNCTION_7_1();
}

void sub_1B258D328()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  char v25;
  uint64_t v26;
  char v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  id v31;
  id v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  unint64_t v36;
  unint64_t v37;
  uint64_t v38;
  void (*v39)(uint64_t, unint64_t, uint64_t);
  unint64_t v40;
  unint64_t v41;
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
  uint64_t *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62[3];
  char v63;

  OUTLINED_FUNCTION_59_0();
  v2 = v1;
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v55 = v11;
  v56 = v12;
  v14 = v13;
  v15 = sub_1B25CC6F4();
  v61 = *(_QWORD *)(v15 - 8);
  MEMORY[0x1E0C80A78](v15, v16);
  v17 = OUTLINED_FUNCTION_98_7();
  v53 = type metadata accessor for ClientInfo(v17);
  OUTLINED_FUNCTION_30_0();
  MEMORY[0x1E0C80A78](v18, v19);
  OUTLINED_FUNCTION_767();
  v54 = v20;
  v59 = v14;
  if (v10)
  {
    v21 = qword_1ED36CF48;
    v22 = v10;
    if (v21 != -1)
      swift_once();
    v23 = sub_1B25CC8C8();
    v24 = __swift_project_value_buffer(v23, (uint64_t)qword_1ED36D980);
    v25 = ((unint64_t)OUTLINED_FUNCTION_39_0(v24, sel_transcriptionOptions) & 1) == 0;
    sub_1B24B3768(v25, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SpeechFramework/SpeechAnalyzer/ObjCSpeechAnalyzer.swift", 93, 2, 280, v24);
    v27 = ((unint64_t)OUTLINED_FUNCTION_39_0(v26, sel_transcriptionOptions) & 2) == 0;
    sub_1B24B3780(v27, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SpeechFramework/SpeechAnalyzer/ObjCSpeechAnalyzer.swift", 93, 2, 281, v24);

    if (v6)
    {
      swift_unknownObjectRetain();
      v28 = v22;
      v29 = OUTLINED_FUNCTION_131_4();
      LOBYTE(v62[0]) = 1;
      v57 = OUTLINED_FUNCTION_131_4();
      if (v4)
      {
        swift_unknownObjectRetain();
        sub_1B255CC14((uint64_t)objc_msgSend(v28, sel_taskHint), &v63);
        OUTLINED_FUNCTION_72_12();
        OUTLINED_FUNCTION_24_13();
        v60 = OUTLINED_FUNCTION_109_7();
        OUTLINED_FUNCTION_189();

        swift_unknownObjectRelease();
      }
      else
      {

        swift_unknownObjectRelease();
        v60 = 0;
      }
      v30 = v57;
      v14 = v59;
      if (!v2)
        goto LABEL_20;
    }
    else
    {
      v60 = 0;
      v30 = 0;
      v29 = 0;
      v14 = v59;
      if (!v2)
        goto LABEL_20;
    }
  }
  else
  {
    v60 = 0;
    v30 = 0;
    v29 = 0;
    if (!v2)
      goto LABEL_20;
  }
  if (!v8)
  {
LABEL_20:
    v42 = 0;
    goto LABEL_23;
  }
  v58 = v30;
  v52 = v29;
  OUTLINED_FUNCTION_433();
  v31 = v8;
  v32 = objc_msgSend(v31, sel_languageConstraints);
  v33 = sub_1B25CCBA4();

  v34 = *(_QWORD *)(v33 + 16);
  if (v34)
  {
    v49 = v6;
    v50 = v4;
    v51 = v2;
    v62[0] = MEMORY[0x1E0DEE9D8];
    sub_1B25053AC(0, v34, 0);
    v35 = v62[0];
    v36 = (*(unsigned __int8 *)(v61 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v61 + 80);
    v48 = v33;
    v37 = v33 + v36;
    v38 = *(_QWORD *)(v61 + 72);
    v39 = *(void (**)(uint64_t, unint64_t, uint64_t))(v61 + 16);
    do
    {
      v39(v0, v37, v15);
      v62[0] = v35;
      v41 = *(_QWORD *)(v35 + 16);
      v40 = *(_QWORD *)(v35 + 24);
      if (v41 >= v40 >> 1)
      {
        sub_1B25053AC(v40 > 1, v41 + 1, 1);
        v35 = v62[0];
      }
      *(_QWORD *)(v35 + 16) = v41 + 1;
      (*(void (**)(unint64_t, uint64_t, uint64_t))(v61 + 32))(v35 + v36 + v41 * v38, v0, v15);
      v37 += v38;
      --v34;
    }
    while (v34);
    swift_bridgeObjectRelease();
    v4 = v50;
    v2 = v51;
    v6 = v49;
    v14 = v59;
  }
  else
  {
    OUTLINED_FUNCTION_101_1();
    v35 = MEMORY[0x1E0DEE9D8];
  }
  v62[0] = v35;
  v62[1] = (uint64_t)objc_msgSend(v31, sel_alternativeCount, v48);
  v43 = v54 + *(int *)(v53 + 32);
  v44 = type metadata accessor for ClientInfo.LoggingInfo(0);
  OUTLINED_FUNCTION_291_0(v43, v45, v46, v44);
  *(_QWORD *)v54 = v55;
  *(_QWORD *)(v54 + 8) = v56;
  *(_QWORD *)(v54 + 16) = 0;
  *(_QWORD *)(v54 + 24) = 0xE000000000000000;
  *(_OWORD *)(v54 + 32) = xmmword_1B25DCAE0;
  *(_OWORD *)(v54 + 48) = xmmword_1B25DCAE0;
  type metadata accessor for LanguageDetector(0);
  OUTLINED_FUNCTION_24_13();
  swift_bridgeObjectRetain();
  LanguageDetector.init(options:clientInfo:)(v62, v54);
  v42 = v47;

  OUTLINED_FUNCTION_619();
  v29 = v52;
  v30 = v58;
LABEL_23:
  swift_unknownObjectRetain();
  OUTLINED_FUNCTION_433();
  swift_unknownObjectRetain();
  *v14 = v29;
  v14[1] = v30;
  v14[2] = v60;
  v14[3] = v42;
  v14[4] = v6;
  v14[5] = v4;
  v14[6] = v2;
  OUTLINED_FUNCTION_7_1();
}

id sub_1B258D89C(void *a1, char *a2, uint64_t a3, uint64_t a4, void *a5, int a6, char a7, uint64_t a8, unint64_t a9, uint64_t a10, uint64_t a11)
{
  char *v11;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  char *v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  id v27;
  uint64_t v28;
  objc_super v35;

  swift_getObjectType();
  v16 = (uint64_t)&v11[OBJC_IVAR____TtC6Speech18ObjCSpeechAnalyzer_inputStreamBuilder];
  v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEFD8940);
  OUTLINED_FUNCTION_291_0(v16, v18, v19, v17);
  *(_QWORD *)&v11[OBJC_IVAR____TtC6Speech18ObjCSpeechAnalyzer_normalizedTranscriber] = 0;
  *(_QWORD *)&v11[OBJC_IVAR____TtC6Speech18ObjCSpeechAnalyzer_contextualizedTranscriber] = 0;
  *(_QWORD *)&v11[OBJC_IVAR____TtC6Speech18ObjCSpeechAnalyzer_endpointDetector] = 0;
  *(_QWORD *)&v11[OBJC_IVAR____TtC6Speech18ObjCSpeechAnalyzer_languageDetector] = 0;
  v20 = *(void **)&a2[OBJC_IVAR____TtC6Speech31ObjCSpeechAnalyzerConfiguration_queue];
  *(_QWORD *)&v11[OBJC_IVAR____TtC6Speech18ObjCSpeechAnalyzer_queue] = v20;
  swift_beginAccess();
  v21 = v11;
  v22 = v20;
  sub_1B2593C74(a4, v16);
  swift_endAccess();
  v23 = *(_QWORD *)&a2[OBJC_IVAR____TtC6Speech31ObjCSpeechAnalyzerConfiguration_modules + 32];
  v24 = *(_QWORD *)&a2[OBJC_IVAR____TtC6Speech31ObjCSpeechAnalyzerConfiguration_modules + 40];
  v25 = *(_QWORD *)&a2[OBJC_IVAR____TtC6Speech31ObjCSpeechAnalyzerConfiguration_modules + 48];
  OUTLINED_FUNCTION_433();
  swift_unknownObjectRetain();
  swift_unknownObjectRetain();
  sub_1B258DAAC(a1, (uint64_t)a2, v23, v24, v25);
  OUTLINED_FUNCTION_619();
  swift_unknownObjectRelease();
  OUTLINED_FUNCTION_51_2();
  v26 = sub_1B258E2CC(a5, a7, a8, a9, a3, a6, (uint64_t)a2, a10, a11);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  *(_QWORD *)&v21[OBJC_IVAR____TtC6Speech18ObjCSpeechAnalyzer_speechAnalyzer] = v26;

  v35.receiver = v21;
  v35.super_class = (Class)type metadata accessor for ObjCSpeechAnalyzer();
  v27 = objc_msgSendSuper2(&v35, sel_init);
  sub_1B24C4564(a10);

  sub_1B24EBD4C(a4, &qword_1EEFD8928);
  OUTLINED_FUNCTION_21_10(v28, &qword_1EEFD8930);
  return v27;
}

uint64_t sub_1B258DAAC(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
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
  uint64_t v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  char *v27;
  uint64_t v28;
  uint64_t result;
  uint64_t v30;
  uint64_t v31;
  _QWORD *v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  char *v36;
  uint64_t v37;
  id v38;
  id v39;
  void (*v40)(char *, uint64_t, uint64_t);
  char *v41;
  uint64_t v42;
  uint64_t v43;
  char *v44;
  char *v45;
  uint64_t v46;
  id v47;
  id v48;
  char *v49;
  void (*v50)(char *, uint64_t);
  uint64_t v51;
  void *v52;
  id v53;
  id v54;
  char *v55;
  uint64_t v56;
  id v57;
  id v58;
  char *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  _QWORD *v65;
  char *v66;
  uint64_t v67;
  char *v68;
  uint64_t v69;
  char *v70;
  uint64_t v71;
  char *v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  char *v79;
  uint64_t v80;
  char *v81;
  uint64_t v82;
  id v83;
  uint64_t v84;

  v77 = a4;
  v83 = a1;
  v84 = a3;
  v80 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEFD91A8);
  v78 = *(_QWORD *)(v80 - 8);
  MEMORY[0x1E0C80A78](v80, v7);
  v79 = (char *)&v56 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEFDB1F8);
  v82 = *(_QWORD *)(v9 - 8);
  MEMORY[0x1E0C80A78](v9, v10);
  v81 = (char *)&v56 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v71 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEFD72F0);
  v69 = *(_QWORD *)(v71 - 8);
  MEMORY[0x1E0C80A78](v71, v12);
  v70 = (char *)&v56 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v74 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEFDB200);
  v73 = *(_QWORD *)(v74 - 8);
  MEMORY[0x1E0C80A78](v74, v14);
  v72 = (char *)&v56 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEFDB208);
  MEMORY[0x1E0C80A78](v16, v17);
  v19 = (char *)&v56 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  v76 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEFDB210);
  v75 = *(_QWORD *)(v76 - 8);
  MEMORY[0x1E0C80A78](v76, v20);
  v22 = (char *)&v56 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  v23 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEFD72C8);
  v25 = MEMORY[0x1E0C80A78](v23, v24);
  v27 = (char *)&v56 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0);
  result = MEMORY[0x1E0C80A78](v25, v28);
  v32 = (_QWORD *)(a2 + OBJC_IVAR____TtC6Speech31ObjCSpeechAnalyzerConfiguration_modules);
  v33 = *(_QWORD *)(a2 + OBJC_IVAR____TtC6Speech31ObjCSpeechAnalyzerConfiguration_modules);
  if (v33)
  {
    v34 = v32[1];
    if (v34)
    {
      if (v84)
      {
        v63 = v9;
        v64 = a5;
        v62 = a2;
        v35 = *(void **)(a2 + OBJC_IVAR____TtC6Speech31ObjCSpeechAnalyzerConfiguration_queue);
        v65 = (_QWORD *)(a2 + OBJC_IVAR____TtC6Speech31ObjCSpeechAnalyzerConfiguration_modules);
        v67 = result;
        v68 = v27;
        v66 = v22;
        v36 = (char *)&v56 - v30;
        v37 = v31;
        __swift_instantiateConcreteTypeFromMangledName(&qword_1EEFDB230);
        swift_initStackObject();
        swift_unknownObjectRetain_n();
        v38 = v35;
        v39 = v83;
        swift_retain();
        swift_retain();
        v58 = v38;
        v57 = v39;
        sub_1B258B444();
        v61 = v37;
        v40 = *(void (**)(char *, uint64_t, uint64_t))(v37 + 16);
        v41 = v66;
        v40(v36, v33 + OBJC_IVAR____TtC6Speech11Transcriber__multisegmentResults, v67);
        v60 = v34;
        v42 = v34 + OBJC_IVAR____TtC6Speech11Transcriber__multisegmentResults;
        v43 = v67;
        v32 = v65;
        v40(v68, v42, v67);
        v59 = v36;
        v44 = v36;
        v45 = v68;
        v40(v19, (uint64_t)v44, v43);
        v40(&v19[*(int *)(v16 + 52)], (uint64_t)v45, v43);
        sub_1B24ADA58(0, &qword_1EEFDB240);
        sub_1B24EBFA4(&qword_1EEFDB248, &qword_1EEFDB208);
        sub_1B25CD3F0();
        sub_1B258B4DC();
        v46 = v32[2];
        if (v46)
        {
          if (v77)
          {
            __swift_instantiateConcreteTypeFromMangledName(&qword_1EEFDB250);
            swift_initStackObject();
            swift_unknownObjectRetain_n();
            v47 = v58;
            v48 = v57;
            swift_retain();
            sub_1B258B444();
            (*(void (**)(char *, uint64_t, uint64_t))(v69 + 16))(v70, v46 + OBJC_IVAR____TtC6Speech16EndpointDetector__results, v71);
            v69 = sub_1B24ADA58(0, &qword_1EEFDB260);
            sub_1B24EBFA4(&qword_1EEFD7300, &qword_1EEFD72F0);
            v49 = v72;
            sub_1B25CD3F0();
            sub_1B258B4DC();
            swift_release();
            swift_release();
            swift_release();
            swift_release();
            swift_release();
            swift_unknownObjectRelease();
            swift_unknownObjectRelease();
            (*(void (**)(char *, uint64_t))(v73 + 8))(v49, v74);
          }
          else
          {
            swift_release();
            swift_release();
            swift_release();
            swift_unknownObjectRelease();
          }
          (*(void (**)(char *, uint64_t))(v75 + 8))(v66, v76);
        }
        else
        {
          swift_release();
          swift_release();
          swift_release();
          swift_unknownObjectRelease();
          (*(void (**)(char *, uint64_t))(v75 + 8))(v41, v76);
        }
        v50 = *(void (**)(char *, uint64_t))(v61 + 8);
        v50(v45, v43);
        result = ((uint64_t (*)(char *, uint64_t))v50)(v59, v43);
        a5 = v64;
        v9 = v63;
        a2 = v62;
      }
    }
  }
  if (a5)
  {
    v51 = v32[3];
    if (v51)
    {
      v52 = *(void **)(a2 + OBJC_IVAR____TtC6Speech31ObjCSpeechAnalyzerConfiguration_queue);
      __swift_instantiateConcreteTypeFromMangledName(&qword_1EEFDB218);
      swift_initStackObject();
      swift_unknownObjectRetain_n();
      v53 = v83;
      swift_retain();
      v54 = v52;
      sub_1B258B444();
      (*(void (**)(char *, uint64_t, uint64_t))(v78 + 16))(v79, v51 + OBJC_IVAR____TtC6Speech16LanguageDetector__results, v80);
      sub_1B24ADA58(0, &qword_1EEFDB228);
      sub_1B24EBFA4(&qword_1EEFD9220, &qword_1EEFD91A8);
      v55 = v81;
      sub_1B25CD3F0();
      sub_1B258B4DC();
      swift_release();
      swift_release();
      swift_unknownObjectRelease();
      return (*(uint64_t (**)(char *, uint64_t))(v82 + 8))(v55, v9);
    }
  }
  return result;
}

uint64_t sub_1B258E2CC(void *a1, char a2, uint64_t a3, unint64_t a4, uint64_t a5, int a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
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
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  char *v34;
  uint64_t v35;
  uint64_t v36;
  char *v37;
  uint64_t v38;
  id v39;
  void *v40;
  id v41;
  uint64_t v42;
  id v43;
  uint64_t v44;
  id v45;
  char v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  id v58;
  id v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t result;
  uint64_t v63;
  char *v64;
  void *v65;
  uint64_t v66;
  uint64_t v67;
  char v68;
  uint64_t v69;
  int v70;
  uint64_t v71;
  uint64_t v72;
  unint64_t v73;
  unint64_t v74;
  uint64_t v75;
  void *v76;
  uint64_t v77;
  uint64_t v78;
  __int128 v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  void *v89;
  __int128 v90;
  id v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  id v95;
  char *v96;
  char *v97;
  uint64_t v98;
  char *v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  unint64_t v107;
  uint64_t v108;
  unint64_t v109;
  uint64_t v110;
  int v111;
  int v112;
  __int128 v113;
  __int128 v114;
  __int128 v115;
  uint64_t v116;

  v103 = a8;
  v104 = a5;
  v105 = a7;
  HIDWORD(v102) = a6;
  v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEFD8930);
  MEMORY[0x1E0C80A78](v13, v14);
  v100 = (uint64_t)&v95 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = type metadata accessor for ClientInfo(0);
  v18 = MEMORY[0x1E0C80A78](v16, v17);
  v98 = (uint64_t)&v95 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  v21 = MEMORY[0x1E0C80A78](v18, v20);
  v23 = (char *)&v95 - v22;
  MEMORY[0x1E0C80A78](v21, v24);
  v106 = (uint64_t)&v95 - v25;
  v26 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEFD6AC8);
  MEMORY[0x1E0C80A78](v26, v27);
  v29 = (char *)&v95 - ((v28 + 15) & 0xFFFFFFFFFFFFFFF0);
  v30 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEFD6E90);
  v32 = MEMORY[0x1E0C80A78](v30, v31);
  v34 = (char *)&v95 - ((v33 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v32, v35);
  v37 = (char *)&v95 - v36;
  v101 = (uint64_t)&v95 - v36;
  v99 = v34;
  v97 = v23;
  if (a1)
  {
    *(_QWORD *)&v113 = a1;
    sub_1B258FF78((id *)&v113, (uint64_t)&v95 - v36);
    v38 = type metadata accessor for AnalysisOptions(0);
    __swift_storeEnumTagSinglePayload((uint64_t)v37, 0, 1, v38);
    v39 = objc_msgSend(a1, sel_loggingInfo);
    if (v39)
    {
      v40 = v39;
      v41 = objc_msgSend(v39, sel_asrID);
      v42 = (uint64_t)v29;
      sub_1B25CC604();

      v43 = objc_msgSend(v40, sel_requestID);
      v44 = type metadata accessor for ClientInfo.LoggingInfo(0);
      sub_1B25CC604();

      v45 = objc_msgSend(v40, sel_dictationUIInteractionID);
      v46 = a2;
      v47 = sub_1B25CCA18();
      v49 = v48;

      v50 = (uint64_t *)(v42 + *(int *)(v44 + 24));
      *v50 = v47;
      v50[1] = v49;
      a2 = v46;
      v29 = (char *)v42;
      __swift_storeEnumTagSinglePayload(v42, 0, 1, v44);

      goto LABEL_6;
    }
  }
  else
  {
    v51 = type metadata accessor for AnalysisOptions(0);
    __swift_storeEnumTagSinglePayload((uint64_t)v37, 1, 1, v51);
    v39 = 0;
  }
  v52 = type metadata accessor for ClientInfo.LoggingInfo((uint64_t)v39);
  __swift_storeEnumTagSinglePayload((uint64_t)v29, 1, 1, v52);
LABEL_6:
  v54 = v104;
  v53 = v105;
  v56 = *(_QWORD *)(v105 + OBJC_IVAR____TtC6Speech31ObjCSpeechAnalyzerConfiguration_clientIdentifier);
  v55 = *(_QWORD *)(v105 + OBJC_IVAR____TtC6Speech31ObjCSpeechAnalyzerConfiguration_clientIdentifier + 8);
  v57 = v106;
  sub_1B25943B4((uint64_t)v29, v106 + *(int *)(v16 + 32), &qword_1EEFD6AC8);
  *(_QWORD *)v57 = v56;
  *(_QWORD *)(v57 + 8) = v55;
  *(_QWORD *)(v57 + 16) = 0;
  *(_QWORD *)(v57 + 24) = 0xE000000000000000;
  *(_OWORD *)(v57 + 32) = xmmword_1B25DCAE0;
  *(_OWORD *)(v57 + 48) = xmmword_1B25DCAE0;
  v58 = objc_allocWithZone((Class)type metadata accessor for AnalysisContext());
  swift_bridgeObjectRetain();
  v59 = objc_msgSend(v58, sel_init);
  if (a3)
  {
    swift_bridgeObjectRetain();
    sub_1B254A228(a2, a3);
  }
  if (a4)
  {
    if (a4 >> 62)
    {
      swift_bridgeObjectRetain();
      v60 = sub_1B25CD474();
      swift_bridgeObjectRelease();
    }
    else
    {
      v60 = *(_QWORD *)((a4 & 0xFFFFFFFFFFFFFF8) + 0x10);
    }
    v61 = MEMORY[0x1E0DEE9D8];
    if (v60)
    {
      *(_QWORD *)&v113 = MEMORY[0x1E0DEE9D8];
      result = sub_1B2505390(0, v60 & ~(v60 >> 63), 0);
      if (v60 < 0)
      {
        __break(1u);
LABEL_30:
        __break(1u);
        goto LABEL_31;
      }
      v95 = v59;
      v96 = v29;
      v63 = 0;
      v61 = v113;
      v107 = a4 & 0xC000000000000001;
      v108 = v60;
      v109 = a4;
      do
      {
        if (v107)
          v64 = (char *)MEMORY[0x1B5E252C4](v63, a4);
        else
          v64 = (char *)*(id *)(a4 + 8 * v63 + 32);
        v65 = v64;
        v67 = *(_QWORD *)&v64[OBJC_IVAR___SFContextualNamedEntity_contextualNamedEntity];
        v66 = *(_QWORD *)&v64[OBJC_IVAR___SFContextualNamedEntity_contextualNamedEntity + 8];
        v68 = v64[OBJC_IVAR___SFContextualNamedEntity_contextualNamedEntity + 16];
        v69 = *(_QWORD *)&v64[OBJC_IVAR___SFContextualNamedEntity_contextualNamedEntity + 24];
        v70 = v64[OBJC_IVAR___SFContextualNamedEntity_contextualNamedEntity + 32];
        v71 = *(_QWORD *)&v64[OBJC_IVAR___SFContextualNamedEntity_contextualNamedEntity + 40];
        v111 = v64[OBJC_IVAR___SFContextualNamedEntity_contextualNamedEntity + 48];
        v112 = v70;
        v72 = *(_QWORD *)&v64[OBJC_IVAR___SFContextualNamedEntity_contextualNamedEntity + 64];
        v110 = *(_QWORD *)&v64[OBJC_IVAR___SFContextualNamedEntity_contextualNamedEntity + 56];
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();

        *(_QWORD *)&v113 = v61;
        v74 = *(_QWORD *)(v61 + 16);
        v73 = *(_QWORD *)(v61 + 24);
        if (v74 >= v73 >> 1)
        {
          sub_1B2505390(v73 > 1, v74 + 1, 1);
          v61 = v113;
        }
        ++v63;
        *(_QWORD *)(v61 + 16) = v74 + 1;
        v75 = v61 + 72 * v74;
        *(_QWORD *)(v75 + 32) = v67;
        *(_QWORD *)(v75 + 40) = v66;
        *(_BYTE *)(v75 + 48) = v68;
        *(_QWORD *)(v75 + 56) = v69;
        *(_BYTE *)(v75 + 64) = v112;
        *(_QWORD *)(v75 + 72) = v71;
        *(_BYTE *)(v75 + 80) = v111;
        a4 = v109;
        *(_QWORD *)(v75 + 88) = v110;
        *(_QWORD *)(v75 + 96) = v72;
      }
      while (v108 != v63);
      v53 = v105;
      v57 = v106;
      v29 = v96;
      v54 = v104;
      v59 = v95;
    }
    sub_1B254A438(v61);
  }
  v76 = v59;
  v77 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEFD8938);
  if (__swift_getEnumTagSinglePayload(v54, 1, v77) == 1)
  {
    v78 = (uint64_t)v97;
    sub_1B2594388(v57, (uint64_t)v97, type metadata accessor for ClientInfo);
    v79 = *(_OWORD *)(v53 + OBJC_IVAR____TtC6Speech31ObjCSpeechAnalyzerConfiguration_modules + 16);
    v113 = *(_OWORD *)(v53 + OBJC_IVAR____TtC6Speech31ObjCSpeechAnalyzerConfiguration_modules);
    v114 = v79;
    v115 = *(_OWORD *)(v53 + OBJC_IVAR____TtC6Speech31ObjCSpeechAnalyzerConfiguration_modules + 32);
    v116 = *(_QWORD *)(v53 + OBJC_IVAR____TtC6Speech31ObjCSpeechAnalyzerConfiguration_modules + 48);
    v80 = sub_1B258CA04();
    v81 = v101;
    v82 = (uint64_t)v99;
    sub_1B25943B4(v101, (uint64_t)v99, &qword_1EEFD6E90);
    type metadata accessor for SpeechAnalyzer();
    swift_allocObject();
    v83 = v103;
    sub_1B24AB754(v103);
    SpeechAnalyzer.init(client:modules:options:restrictedLogging:didChangeVolatileRange:)(v78, v80, v82, BYTE4(v102) & 1, v83, a9, v84, v85, (uint64_t)v95, (uint64_t)v96, (uint64_t)v97, v98, (uint64_t)v99, v100, v101, v102, v103, v104, v105,
      v106);
    v87 = v86;

LABEL_27:
    sub_1B24EACC4(v57, type metadata accessor for ClientInfo);
    sub_1B24EBD4C((uint64_t)v29, &qword_1EEFD6AC8);
    sub_1B24EBD4C(v81, &qword_1EEFD6E90);
    return v87;
  }
  sub_1B2594388(v57, v98, type metadata accessor for ClientInfo);
  v88 = v100;
  sub_1B25943B4(v54, v100, &qword_1EEFD8930);
  result = __swift_getEnumTagSinglePayload(v88, 1, v77);
  if ((_DWORD)result == 1)
    goto LABEL_30;
  v89 = *(void **)(v53 + OBJC_IVAR____TtC6Speech31ObjCSpeechAnalyzerConfiguration_audioFormat);
  if (v89)
  {
    v90 = *(_OWORD *)(v53 + OBJC_IVAR____TtC6Speech31ObjCSpeechAnalyzerConfiguration_modules + 16);
    v113 = *(_OWORD *)(v53 + OBJC_IVAR____TtC6Speech31ObjCSpeechAnalyzerConfiguration_modules);
    v114 = v90;
    v115 = *(_OWORD *)(v53 + OBJC_IVAR____TtC6Speech31ObjCSpeechAnalyzerConfiguration_modules + 32);
    v116 = *(_QWORD *)(v53 + OBJC_IVAR____TtC6Speech31ObjCSpeechAnalyzerConfiguration_modules + 48);
    v91 = v89;
    v92 = sub_1B258CA04();
    v81 = v101;
    v93 = (uint64_t)v99;
    sub_1B25943B4(v101, (uint64_t)v99, &qword_1EEFD6E90);
    type metadata accessor for SpeechAnalyzer();
    swift_allocObject();
    v94 = v103;
    sub_1B24AB754(v103);
    v87 = sub_1B2512D74(v98, v100, v91, v92, v93, BYTE4(v102) & 1, v76, v94, a9);
    goto LABEL_27;
  }
LABEL_31:
  __break(1u);
  return result;
}

void sub_1B258EA2C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  void *v3;
  void *v4;
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
  id v17;
  uint64_t v18;
  uint64_t v19;

  OUTLINED_FUNCTION_123_2();
  v4 = v3;
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEFD8940);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x1E0C80A78](v5, v7);
  OUTLINED_FUNCTION_42_3();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EEFD8928);
  OUTLINED_FUNCTION_30_0();
  MEMORY[0x1E0C80A78](v8, v9);
  OUTLINED_FUNCTION_41_1();
  v12 = v11 - v10;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EEFDB198);
  OUTLINED_FUNCTION_30_0();
  MEMORY[0x1E0C80A78](v13, v14);
  OUTLINED_FUNCTION_315_0();
  v15 = v0 + OBJC_IVAR____TtC6Speech18ObjCSpeechAnalyzer_inputStreamBuilder;
  OUTLINED_FUNCTION_15_3();
  sub_1B25943B4(v15, v12, &qword_1EEFD8928);
  if (OUTLINED_FUNCTION_17_3(v12))
  {
    sub_1B24EBD4C(v12, &qword_1EEFD8928);
    v16 = 1;
  }
  else
  {
    OUTLINED_FUNCTION_307(v2, v12, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v6 + 16));
    sub_1B24EBD4C(v12, &qword_1EEFD8928);
    v17 = v4;
    sub_1B25CCCF4();
    OUTLINED_FUNCTION_156(v2, *(uint64_t (**)(uint64_t, uint64_t))(v6 + 8));
    v16 = 0;
  }
  v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEFDB1A0);
  v19 = __swift_storeEnumTagSinglePayload(v1, v16, 1, v18);
  OUTLINED_FUNCTION_21_10(v19, &qword_1EEFDB198);
  OUTLINED_FUNCTION_462();
}

void sub_1B258EBAC()
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

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEFD8940);
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x1E0C80A78](v3, v5);
  OUTLINED_FUNCTION_42_3();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EEFD8928);
  OUTLINED_FUNCTION_30_0();
  MEMORY[0x1E0C80A78](v6, v7);
  OUTLINED_FUNCTION_315_0();
  v8 = v0 + OBJC_IVAR____TtC6Speech18ObjCSpeechAnalyzer_inputStreamBuilder;
  OUTLINED_FUNCTION_15_3();
  sub_1B25943B4(v8, v1, &qword_1EEFD8928);
  v9 = OUTLINED_FUNCTION_17_3(v1);
  if ((_DWORD)v9)
  {
    OUTLINED_FUNCTION_21_10(v9, &qword_1EEFD8928);
  }
  else
  {
    v10 = OUTLINED_FUNCTION_307(v2, v1, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v4 + 16));
    OUTLINED_FUNCTION_21_10(v10, &qword_1EEFD8928);
    sub_1B25CCD00();
    OUTLINED_FUNCTION_156(v2, *(uint64_t (**)(uint64_t, uint64_t))(v4 + 8));
  }
}

#error "1B258EEE8: call analysis failed (funcsize=153)"

uint64_t sub_1B258EF2C@<X0>(void **a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  void *v12;
  id v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unsigned __int8 v18;
  id v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  unsigned __int8 v25;
  unsigned __int8 v26;
  int *v27;
  uint64_t result;
  uint64_t *v29;
  _QWORD v30[2];

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED36CF08);
  v6 = MEMORY[0x1E0C80A78](v4, v5);
  v8 = (char *)v30 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v6, v9);
  v11 = (char *)v30 - v10;
  v12 = *a1;
  v13 = objc_msgSend(v12, sel_supplementalModelURL);
  if (v13)
  {
    v14 = v13;
    sub_1B25CC508();

    v15 = sub_1B25CC538();
    v16 = 0;
  }
  else
  {
    v15 = sub_1B25CC538();
    v16 = 1;
  }
  v17 = 1;
  __swift_storeEnumTagSinglePayload((uint64_t)v11, v16, 1, v15);
  v18 = objc_msgSend(v12, sel_farField);
  v19 = objc_msgSend(v12, sel_modelOverrideURL);
  if (v19)
  {
    v20 = v19;
    sub_1B25CC508();

    v17 = 0;
  }
  v21 = sub_1B25CC538();
  __swift_storeEnumTagSinglePayload((uint64_t)v8, v17, 1, v21);
  v22 = sub_1B2593CBC(v12);
  v24 = v23;
  v25 = objc_msgSend(v12, sel_atypicalSpeech);
  v26 = objc_msgSend(v12, sel_enableParallelLoading);
  sub_1B24B3084((uint64_t)v11, a2);
  v27 = (int *)type metadata accessor for Transcriber.ModelOptions(0);
  *(_BYTE *)(a2 + v27[5]) = v18;
  result = sub_1B24B3084((uint64_t)v8, a2 + v27[6]);
  *(_QWORD *)(a2 + v27[8]) = MEMORY[0x1E0DEE9D8];
  v29 = (uint64_t *)(a2 + v27[7]);
  *v29 = v22;
  v29[1] = v24;
  *(_BYTE *)(a2 + v27[9]) = v25;
  *(_BYTE *)(a2 + v27[10]) = v26;
  *(_QWORD *)(a2 + v27[11]) = 0;
  return result;
}

uint64_t sub_1B258F128(char a1)
{
  char v3;
  char v4;
  char v5;
  char v6;
  char v7;
  char v8;
  uint64_t v9;

  v9 = MEMORY[0x1E0DEE9E8];
  if ((a1 & 1) != 0)
  {
    sub_1B24E2458((uint64_t)&v3, 0);
    if ((a1 & 2) == 0)
    {
LABEL_3:
      if ((a1 & 0x20) == 0)
        goto LABEL_4;
      goto LABEL_11;
    }
  }
  else if ((a1 & 2) == 0)
  {
    goto LABEL_3;
  }
  sub_1B24E2458((uint64_t)&v4, 1);
  if ((a1 & 0x20) == 0)
  {
LABEL_4:
    if ((a1 & 4) == 0)
      goto LABEL_5;
    goto LABEL_12;
  }
LABEL_11:
  sub_1B24E2458((uint64_t)&v5, 2);
  if ((a1 & 4) == 0)
  {
LABEL_5:
    if ((a1 & 8) == 0)
      goto LABEL_6;
LABEL_13:
    sub_1B24E2458((uint64_t)&v7, 4);
    if ((a1 & 0x10) == 0)
      return v9;
    goto LABEL_7;
  }
LABEL_12:
  sub_1B24E2458((uint64_t)&v6, 3);
  if ((a1 & 8) != 0)
    goto LABEL_13;
LABEL_6:
  if ((a1 & 0x10) != 0)
LABEL_7:
    sub_1B24E2458((uint64_t)&v8, 5);
  return v9;
}

uint64_t sub_1B258F24C(uint64_t a1, const void *a2)
{
  uint64_t v2;

  *(_QWORD *)(v2 + 544) = a1;
  memcpy((void *)(v2 + 16), a2, 0x209uLL);
  return swift_task_switch();
}

uint64_t sub_1B258F294(uint64_t a1)
{
  uint64_t v1;
  id *v2;
  _BYTE v4[264];
  _BYTE v5[264];

  v2 = *(id **)(v1 + 544);
  OUTLINED_FUNCTION_60(a1, &qword_1EEFDB240);
  sub_1B259406C(v1 + 16);
  sub_1B2534B44(v1 + 280);
  OUTLINED_FUNCTION_152_0(v4, (const void *)(v1 + 16));
  sub_1B259406C(v1 + 16);
  sub_1B2534B44(v1 + 16);
  OUTLINED_FUNCTION_152_0(v5, (const void *)(v1 + 280));
  *v2 = sub_1B258F33C(v4, v5);
  return OUTLINED_FUNCTION_119(*(uint64_t (**)(void))(v1 + 8));
}

id sub_1B258F33C(const void *a1, const void *a2)
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  id v12;
  id v13;
  _QWORD v15[33];
  _QWORD v16[33];
  _BYTE v17[264];

  OUTLINED_FUNCTION_152_0(v16, a1);
  OUTLINED_FUNCTION_152_0(v17, a2);
  v4 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  v5 = v16[0];
  v6 = v16[2];
  v7 = v16[3];
  v8 = v16[5];
  OUTLINED_FUNCTION_60((uint64_t)v4, &qword_1EEFDB2C8);
  OUTLINED_FUNCTION_152_0(v15, a1);
  v9 = v16[1];
  v10 = v16[4];
  sub_1B25318AC((uint64_t)v16);
  v11 = sub_1B2591CA8(v15);
  OUTLINED_FUNCTION_152_0(v15, v17);
  v12 = sub_1B2591CA8(v15);
  v15[0] = v5;
  v15[1] = v9;
  v15[2] = v6;
  v15[3] = v7;
  v15[4] = v10;
  v15[5] = v8;
  v13 = objc_msgSend(v4, sel_initWithRange_normalizedTranscriberMultisegmentResult_contextualizedTranscriberMultisegmentResult_, v15, v11, v12);

  sub_1B2534B44((uint64_t)v16);
  return v13;
}

uint64_t sub_1B258F458(uint64_t a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;
  __int128 v4;
  __int128 v5;

  v3 = *a2;
  *(_QWORD *)(v2 + 16) = a1;
  *(_QWORD *)(v2 + 24) = v3;
  v4 = *(_OWORD *)(a2 + 1);
  *((_QWORD *)&v4 + 1) = a2[4];
  v5 = *(_OWORD *)(a2 + 5);
  *(_OWORD *)(v2 + 32) = *((_OWORD *)a2 + 1);
  *(_OWORD *)(v2 + 48) = v5;
  *(_QWORD *)(v2 + 128) = a2[7];
  *(_OWORD *)(v2 + 64) = *((_OWORD *)a2 + 4);
  *(_QWORD *)(v2 + 80) = a2[10];
  *(_QWORD *)(v2 + 88) = a2[11];
  *(_OWORD *)(v2 + 96) = *((_OWORD *)a2 + 6);
  *(_OWORD *)(v2 + 112) = v4;
  return swift_task_switch();
}

uint64_t sub_1B258F4B0(uint64_t a1)
{
  uint64_t v1;
  double v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  id *v15;
  double v16[14];

  v3 = *(double *)(v1 + 96);
  v2 = *(double *)(v1 + 104);
  v4 = *(double *)(v1 + 88);
  v5 = *(double *)(v1 + 80);
  v7 = *(double *)(v1 + 64);
  v6 = *(double *)(v1 + 72);
  v9 = *(double *)(v1 + 48);
  v8 = *(double *)(v1 + 56);
  v11 = *(double *)(v1 + 32);
  v10 = *(double *)(v1 + 40);
  v12 = *(double *)(v1 + 24);
  v15 = *(id **)(v1 + 16);
  OUTLINED_FUNCTION_60(a1, &qword_1EEFDB260);
  v13 = *(double *)(v1 + 120);
  v16[1] = *(double *)(v1 + 112);
  v16[0] = v12;
  v16[2] = v11;
  v16[3] = v10;
  v16[4] = v13;
  v16[5] = v9;
  v16[6] = v8;
  v16[7] = *(double *)(v1 + 128);
  v16[8] = v7;
  v16[9] = v6;
  v16[10] = v5;
  v16[11] = v4;
  v16[12] = v3;
  v16[13] = v2;
  swift_bridgeObjectRetain();
  *v15 = sub_1B258F58C(v16);
  return (*(uint64_t (**)(void))(v1 + 8))();
}

id sub_1B258F58C(double *a1)
{
  double v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  double v8;
  uint64_t v9;
  double v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  void *v15;
  id v16;
  uint64_t v18;
  _QWORD v19[6];

  v1 = *a1;
  v2 = *((_QWORD *)a1 + 1);
  v3 = *((_QWORD *)a1 + 2);
  v4 = *((_QWORD *)a1 + 3);
  v5 = *((_QWORD *)a1 + 4);
  v6 = *((_QWORD *)a1 + 5);
  v7 = *((_QWORD *)a1 + 9);
  v8 = a1[10];
  v9 = *((_QWORD *)a1 + 11);
  v10 = a1[12];
  v11 = *(_QWORD *)(v9 + 16);
  if (v11)
  {
    v18 = *((_QWORD *)a1 + 5);
    v19[0] = MEMORY[0x1E0DEE9D8];
    swift_bridgeObjectRetain();
    sub_1B25CD384();
    v12 = 0;
    do
    {
      v13 = v12 + 1;
      objc_msgSend(objc_allocWithZone(MEMORY[0x1E0CB37E8]), sel_initWithInteger_, *(_QWORD *)(v9 + 8 * v12 + 32));
      sub_1B25CD36C();
      sub_1B25CD390();
      sub_1B25CD39C();
      sub_1B25CD378();
      v12 = v13;
    }
    while (v11 != v13);
    OUTLINED_FUNCTION_10_0();
    v6 = v18;
  }
  v14 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  OUTLINED_FUNCTION_60((uint64_t)v14, (unint64_t *)&qword_1EEFD7478);
  v15 = (void *)sub_1B25CCB98();
  OUTLINED_FUNCTION_173();
  *(double *)v19 = v1;
  v19[1] = v2;
  v19[2] = v3;
  v19[3] = v4;
  v19[4] = v5;
  v19[5] = v6;
  v16 = objc_msgSend(v14, sel_initWithRange_wordCount_eosLikelihood_pauseCounts_silencePosterior_, v19, v7, v15, v8, v10);
  OUTLINED_FUNCTION_10_0();

  return v16;
}

uint64_t sub_1B258F734(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;

  v2[2] = a1;
  v2[3] = a2;
  v3 = type metadata accessor for LanguageDetector.LocaleAlternative(0);
  v2[4] = v3;
  v2[5] = *(_QWORD *)(v3 - 8);
  v2[6] = swift_task_alloc();
  v4 = sub_1B25CC6F4();
  v2[7] = v4;
  v2[8] = *(_QWORD *)(v4 - 8);
  v2[9] = swift_task_alloc();
  v2[10] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_1B258F7CC()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  _OWORD *v4;
  __int128 v5;
  __int128 v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  id *v19;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;

  v1 = (uint64_t *)(v0 + 88);
  v2 = *(_QWORD *)(v0 + 80);
  v3 = *(_QWORD *)(v0 + 64);
  v4 = *(_OWORD **)(v0 + 24);
  v6 = v4[1];
  v5 = v4[2];
  *(_OWORD *)(v0 + 88) = *v4;
  *(_OWORD *)(v0 + 104) = v6;
  *(_OWORD *)(v0 + 120) = v5;
  v7 = type metadata accessor for LanguageDetector.Result(0);
  OUTLINED_FUNCTION_307(v2, (uint64_t)v4 + *(int *)(v7 + 24), *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v3 + 16));
  v8 = *(_QWORD *)((char *)v4 + *(int *)(v7 + 28));
  v9 = *(_QWORD *)(v8 + 16);
  if (v9)
  {
    v10 = *(_QWORD *)(v0 + 40);
    v22 = *(_QWORD *)(v0 + 32);
    v23 = *(_QWORD *)(v0 + 64);
    OUTLINED_FUNCTION_95_1();
    sub_1B25CD384();
    v11 = v8 + ((*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80));
    v21 = *(_QWORD *)(v10 + 72);
    do
    {
      v12 = *(_QWORD *)(v0 + 72);
      v13 = *(_QWORD *)(v0 + 48);
      sub_1B2594388(v11, v13, type metadata accessor for LanguageDetector.LocaleAlternative);
      sub_1B25CC634();
      v15 = v14;
      v16 = objc_allocWithZone(MEMORY[0x1E0C99DC8]);
      v17 = sub_1B25CCA0C();
      OUTLINED_FUNCTION_69();
      objc_msgSend(v16, sel_initWithLocaleIdentifier_, v17);
      OUTLINED_FUNCTION_260_2();
      sub_1B25CC688();

      objc_msgSend(objc_allocWithZone((Class)SFLocaleAlternative), sel_initWithLocale_confidence_, sub_1B25CC670(), *(double *)(v13 + *(int *)(v22 + 20)));
      OUTLINED_FUNCTION_260_2();
      OUTLINED_FUNCTION_156(v12, *(uint64_t (**)(uint64_t, uint64_t))(v23 + 8));
      sub_1B24EACC4(v13, type metadata accessor for LanguageDetector.LocaleAlternative);
      sub_1B25CD36C();
      sub_1B25CD390();
      sub_1B25CD39C();
      sub_1B25CD378();
      v11 += v21;
      --v9;
    }
    while (v9);
    swift_bridgeObjectRelease();
    v1 = (uint64_t *)(v0 + 88);
  }
  v18 = *(_QWORD *)(v0 + 80);
  v19 = *(id **)(v0 + 16);
  sub_1B25CC640();
  objc_allocWithZone((Class)SFLanguageDetectorResult);
  *v19 = sub_1B259238C(v1, v18);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_1B258FA50(unsigned __int8 *a1, void *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _BYTE *v10;
  uint64_t v11;
  uint64_t v12;
  _BYTE *v13;
  int v14;
  id v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t inited;
  id v21;
  uint64_t v22;
  uint64_t v23;
  _BYTE v25[15];
  char v26;
  uint64_t v27;

  v4 = sub_1B25CC6F4();
  MEMORY[0x1E0C80A78](v4, v5);
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEFD6B20);
  v8 = MEMORY[0x1E0C80A78](v6, v7);
  v10 = &v25[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x1E0C80A78](v8, v11);
  v13 = &v25[-v12];
  v14 = *a1;
  v15 = objc_msgSend(a2, sel_modelOptions);
  if (v15)
  {
    v16 = v15;
    v27 = (uint64_t)v15;
    sub_1B258FCC0((void **)&v27, (uint64_t)v13);
    v17 = type metadata accessor for Transcriber.ModelOptions(0);
    __swift_storeEnumTagSinglePayload((uint64_t)v13, 0, 1, v17);

  }
  else
  {
    v18 = type metadata accessor for Transcriber.ModelOptions(0);
    __swift_storeEnumTagSinglePayload((uint64_t)v13, 1, 1, v18);
  }
  v19 = sub_1B258F128((char)objc_msgSend(a2, sel_transcriptionOptions));
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EEFDB338);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_1B25DB5B0;
  *(_BYTE *)(inited + 32) = v14;
  v27 = sub_1B258FEFC(inited, v19);
  if (!v14)
  {
    sub_1B25930EC(4u, &v26);
    sub_1B25930EC(3u, &v26);
  }
  v21 = objc_msgSend(a2, sel_locale);
  sub_1B25CC688();

  sub_1B255CC14((uint64_t)objc_msgSend(a2, sel_taskHint), &v26);
  sub_1B25943B4((uint64_t)v13, (uint64_t)v10, &qword_1EEFD6B20);
  sub_1B25063BC();
  sub_1B25062EC();
  type metadata accessor for Transcriber(0);
  swift_allocObject();
  Transcriber.init(locale:taskHint:modelOptions:transcriptionOptions:reportingOptions:attributeOptions:)();
  v23 = v22;
  sub_1B24EBD4C((uint64_t)v13, &qword_1EEFD6B20);
  return v23;
}

uint64_t sub_1B258FCC0@<X0>(void **a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  void *v12;
  id v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  unsigned __int8 v17;
  id v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  unsigned __int8 v28;
  unsigned __int8 v29;
  int *v30;
  uint64_t result;
  uint64_t *v32;
  uint64_t v33;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED36CF08);
  v6 = MEMORY[0x1E0C80A78](v4, v5);
  v8 = (char *)&v33 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v6, v9);
  v11 = (char *)&v33 - v10;
  v12 = *a1;
  v13 = objc_msgSend(v12, sel_supplementalModelURL);
  if (v13)
  {
    v14 = v13;
    sub_1B25CC508();

    v15 = sub_1B25CC538();
    v16 = 0;
  }
  else
  {
    v15 = sub_1B25CC538();
    v16 = 1;
  }
  __swift_storeEnumTagSinglePayload((uint64_t)v11, v16, 1, v15);
  v17 = objc_msgSend(v12, sel_farField);
  v18 = objc_msgSend(v12, sel_modelOverrideURL);
  if (v18)
  {
    v19 = v18;
    sub_1B25CC508();

    v20 = sub_1B25CC538();
    v21 = (uint64_t)v8;
    v22 = 0;
  }
  else
  {
    v20 = sub_1B25CC538();
    v21 = (uint64_t)v8;
    v22 = 1;
  }
  __swift_storeEnumTagSinglePayload(v21, v22, 1, v20);
  v23 = objc_msgSend(v12, sel_speechProfileURLs);
  sub_1B25CC538();
  v24 = sub_1B25CCBA4();

  v25 = sub_1B2593CBC(v12);
  v27 = v26;
  v28 = objc_msgSend(v12, sel_atypicalSpeech);
  v29 = objc_msgSend(v12, sel_enableParallelLoading);
  sub_1B24B3084((uint64_t)v11, a2);
  v30 = (int *)type metadata accessor for Transcriber.ModelOptions(0);
  *(_BYTE *)(a2 + v30[5]) = v17;
  result = sub_1B24B3084((uint64_t)v8, a2 + v30[6]);
  *(_QWORD *)(a2 + v30[8]) = v24;
  v32 = (uint64_t *)(a2 + v30[7]);
  *v32 = v25;
  v32[1] = v27;
  *(_BYTE *)(a2 + v30[9]) = v28;
  *(_BYTE *)(a2 + v30[10]) = v29;
  *(_QWORD *)(a2 + v30[11]) = 0;
  return result;
}

uint64_t sub_1B258FEFC(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t i;
  uint64_t v5;
  uint64_t v6;
  char v8;
  uint64_t v9;

  v9 = a2;
  v3 = *(_QWORD *)(a1 + 16);
  if (v3)
  {
    for (i = 0; i != v3; ++i)
    {
      v5 = a1 + i;
      sub_1B24E2458((uint64_t)&v8, *(unsigned __int8 *)(v5 + 32));
    }
    swift_bridgeObjectRelease();
    return v9;
  }
  else
  {
    v6 = a2;
    swift_bridgeObjectRelease();
  }
  return v6;
}

uint64_t sub_1B258FF78@<X0>(id *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  uint64_t v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t result;
  uint64_t *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;

  v4 = sub_1B25CCCDC();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x1E0C80A78](v4, v6);
  v8 = (char *)&v26 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = *a1;
  v10 = objc_msgSend(*a1, sel_powerContext);
  if (v10)
  {
    v11 = v10;
    v12 = objc_msgSend(v10, "ane");
    v13 = sub_1B25CCA18();
    v26 = v14;
    v27 = v13;

    v15 = objc_msgSend(v11, "cpu");
    v29 = sub_1B25CCA18();
    v28 = v16;

    v17 = objc_msgSend(v11, "gpu");
    v18 = sub_1B25CCA18();
    v20 = v19;

  }
  else
  {
    v26 = 0;
    v27 = 0;
    v29 = 0;
    v28 = 0;
    v18 = 0;
    v20 = 0;
  }
  if (objc_msgSend(v9, sel_highPriority, v26, v27))
    sub_1B25CCCB8();
  else
    sub_1B25CCCC4();
  v21 = v27;
  v22 = v26;
  (*(void (**)(uint64_t, char *, uint64_t))(v5 + 32))(a2, v8, v4);
  result = type metadata accessor for AnalysisOptions(0);
  *(_BYTE *)(a2 + *(int *)(result + 20)) = 0;
  v24 = (uint64_t *)(a2 + *(int *)(result + 24));
  *v24 = v21;
  v24[1] = v22;
  v25 = v28;
  v24[2] = v29;
  v24[3] = v25;
  v24[4] = v18;
  v24[5] = v20;
  return result;
}

uint64_t sub_1B259012C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  uint64_t v13;

  *(_QWORD *)(v8 + 160) = v13;
  *(_OWORD *)(v8 + 128) = v11;
  *(_OWORD *)(v8 + 144) = v12;
  *(_OWORD *)(v8 + 112) = v10;
  *(_QWORD *)(v8 + 96) = a7;
  *(_QWORD *)(v8 + 104) = a8;
  *(_QWORD *)(v8 + 80) = a5;
  *(_QWORD *)(v8 + 88) = a6;
  *(_QWORD *)(v8 + 72) = a4;
  return swift_task_switch();
}

uint64_t sub_1B2590168()
{
  uint64_t v0;
  _QWORD *v1;

  sub_1B258D328();
  type metadata accessor for SpeechAnalyzer();
  *(_QWORD *)(v0 + 168) = sub_1B258CA04();
  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 176) = v1;
  *v1 = v0;
  v1[1] = sub_1B2590200;
  return static SpeechAnalyzer.bestAvailableAudioFormat(compatibleWith:considering:)();
}

uint64_t sub_1B2590200(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 184) = a1;
  swift_task_dealloc();
  OUTLINED_FUNCTION_173();
  OUTLINED_FUNCTION_17();
  return OUTLINED_FUNCTION_8();
}

uint64_t sub_1B2590254()
{
  uint64_t v0;
  void *v1;
  void (*v2)(void);
  uint64_t v3;
  void *v4;
  uint64_t v5;
  id v6;
  id v7;

  OUTLINED_FUNCTION_249();
  v1 = *(void **)(v0 + 184);
  v2 = *(void (**)(void))(v0 + 144);
  v3 = *(_QWORD *)(v0 + 80);
  v4 = *(void **)(v0 + 88);
  v5 = *(_QWORD *)(v0 + 72);
  objc_allocWithZone((Class)type metadata accessor for ObjCSpeechAnalyzerConfiguration());
  sub_1B2593B7C(v0 + 16);
  v6 = v1;
  OUTLINED_FUNCTION_95_1();
  v7 = sub_1B258CD50(v0 + 16, v1, v5, v3, v4);
  v2();

  sub_1B2593BF8(v0 + 16);
  return OUTLINED_FUNCTION_36_1(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_1B25902E8()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(v1 + 64) = v0;
  return OUTLINED_FUNCTION_6_0();
}

uint64_t sub_1B25902F8()
{
  uint64_t v0;

  *(_QWORD *)(v0 + 72) = *(_QWORD *)(*(_QWORD *)(v0 + 64) + OBJC_IVAR____TtC6Speech18ObjCSpeechAnalyzer_speechAnalyzer);
  return swift_task_switch();
}

uint64_t sub_1B259031C()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 72) + OBJC_IVAR____TtC6Speech14SpeechAnalyzer_internalVolatileRange;
  *(_QWORD *)(v0 + 80) = *(_QWORD *)v1;
  *(_QWORD *)(v0 + 88) = *(_QWORD *)(v1 + 8);
  *(_QWORD *)(v0 + 96) = *(_QWORD *)(v1 + 16);
  *(_QWORD *)(v0 + 104) = *(_QWORD *)(v1 + 24);
  *(_QWORD *)(v0 + 112) = *(_QWORD *)(v1 + 32);
  *(_QWORD *)(v0 + 120) = *(_QWORD *)(v1 + 40);
  *(_BYTE *)(v0 + 128) = *(_BYTE *)(v1 + 48);
  return OUTLINED_FUNCTION_6_0();
}

uint64_t sub_1B2590370()
{
  uint64_t v0;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  if ((*(_BYTE *)(v0 + 128) & 1) != 0)
    return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(v0 + 8))(0, 0, 0);
  v3 = *(_QWORD *)(v0 + 112);
  v2 = *(_QWORD *)(v0 + 120);
  v4 = *(_QWORD *)(v0 + 88);
  *(_QWORD *)(v0 + 16) = *(_QWORD *)(v0 + 80);
  *(_QWORD *)(v0 + 24) = v4;
  *(_OWORD *)(v0 + 32) = *(_OWORD *)(v0 + 96);
  *(_QWORD *)(v0 + 48) = v3;
  *(_QWORD *)(v0 + 56) = v2;
  v5 = sub_1B25CCF7C();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v0 + 8))(v5, v6, v7);
}

uint64_t sub_1B25903E0()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(v1 + 16) = v0;
  return OUTLINED_FUNCTION_6_0();
}

uint64_t sub_1B25903F0()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;

  OUTLINED_FUNCTION_102_5(*(_QWORD *)(v1 + 16));
  if (!v0)
    return OUTLINED_FUNCTION_15_0(*(uint64_t (**)(void))(v1 + 8));
  OUTLINED_FUNCTION_289();
  v2 = (_QWORD *)OUTLINED_FUNCTION_654();
  *(_QWORD *)(v1 + 32) = v2;
  OUTLINED_FUNCTION_18_0(v2, (uint64_t)sub_1B251F75C);
  return Transcriber.cancelPendingResultsAndPause()();
}

uint64_t sub_1B2590458()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(v1 + 16) = v0;
  return OUTLINED_FUNCTION_6_0();
}

uint64_t sub_1B2590468()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;

  OUTLINED_FUNCTION_102_5(*(_QWORD *)(v1 + 16));
  if (!v0)
    return OUTLINED_FUNCTION_15_0(*(uint64_t (**)(void))(v1 + 8));
  OUTLINED_FUNCTION_289();
  v2 = (_QWORD *)OUTLINED_FUNCTION_654();
  *(_QWORD *)(v1 + 32) = v2;
  OUTLINED_FUNCTION_18_0(v2, (uint64_t)sub_1B251F82C);
  return Transcriber.resume()();
}

uint64_t sub_1B25904D0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  _QWORD *v4;

  v4[4] = a3;
  v4[5] = v3;
  v4[2] = a1;
  v4[3] = a2;
  return OUTLINED_FUNCTION_6_0();
}

uint64_t sub_1B25904E4()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char v4;
  _QWORD *v5;

  OUTLINED_FUNCTION_55();
  v1 = v0[4];
  v3 = v0[2];
  v2 = v0[3];
  v4 = sub_1B25CD09C();
  if ((v4 & 1) == 0)
  {
    v3 = 0;
    v2 = 0;
    v1 = 0;
  }
  v5 = (_QWORD *)swift_task_alloc();
  v0[6] = v5;
  *v5 = v0;
  v5[1] = sub_1B2590584;
  return SpeechAnalyzer.finalize(through:)(v3, v2, v1, (v4 & 1) == 0);
}

uint64_t sub_1B2590584()
{
  uint64_t v0;

  OUTLINED_FUNCTION_105();
  OUTLINED_FUNCTION_81();
  return OUTLINED_FUNCTION_21(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_1B25905B0()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(v1 + 16) = v0;
  return OUTLINED_FUNCTION_6_0();
}

uint64_t sub_1B25905C0()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 24) = v1;
  OUTLINED_FUNCTION_18_0(v1, (uint64_t)sub_1B24F4958);
  return SpeechAnalyzer.finalizeAndFinishThroughEndOfInput()();
}

uint64_t sub_1B2590614()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(v1 + 16) = v0;
  return OUTLINED_FUNCTION_6_0();
}

uint64_t sub_1B2590624()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;

  OUTLINED_FUNCTION_102_5(*(_QWORD *)(v1 + 16));
  if (!v0)
    return OUTLINED_FUNCTION_14_0(MEMORY[0x1E0DEE9E8], *(uint64_t (**)(void))(v1 + 8));
  OUTLINED_FUNCTION_289();
  v2 = (_QWORD *)OUTLINED_FUNCTION_654();
  *(_QWORD *)(v1 + 32) = v2;
  OUTLINED_FUNCTION_18_0(v2, (uint64_t)sub_1B2590688);
  return OUTLINED_FUNCTION_82_9();
}

uint64_t sub_1B2590688(uint64_t a1)
{
  OUTLINED_FUNCTION_12_16(a1);
  OUTLINED_FUNCTION_17();
  return OUTLINED_FUNCTION_8();
}

uint64_t sub_1B25906C4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;

  v1 = *(_QWORD *)(v0 + 40);
  v2 = OUTLINED_FUNCTION_247_2();
  if (v1)
  {
    v3 = *(void **)(v0 + 40);
    v4 = OUTLINED_FUNCTION_39_0(v2, sel_tasks);

    v5 = sub_1B25CCE38();
    v6 = sub_1B2590794(v5);
    OUTLINED_FUNCTION_69();
  }
  else
  {
    v6 = MEMORY[0x1E0DEE9E8];
  }
  return (*(uint64_t (**)(uint64_t))(v0 + 8))(v6);
}

uint64_t sub_1B2590764()
{
  uint64_t v0;

  OUTLINED_FUNCTION_247_2();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_1B2590794(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  int64_t v8;
  uint64_t result;
  int64_t v10;
  unint64_t v11;
  unint64_t v12;
  int64_t v13;
  unint64_t v14;
  int64_t v15;
  int64_t v16;
  uint64_t v17;
  uint64_t v18;
  __int128 v19;
  uint64_t v20;

  if (*(_QWORD *)(a1 + 16))
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EEFD74B8);
    v2 = sub_1B25CD2B8();
  }
  else
  {
    v2 = MEMORY[0x1E0DEE9E8];
  }
  v4 = a1 + 56;
  v3 = *(_QWORD *)(a1 + 56);
  v20 = v2;
  v5 = -1 << *(_BYTE *)(a1 + 32);
  if (-v5 < 64)
    v6 = ~(-1 << -(char)v5);
  else
    v6 = -1;
  v7 = v6 & v3;
  v8 = (unint64_t)(63 - v5) >> 6;
  result = swift_bridgeObjectRetain();
  v10 = 0;
  if (!v7)
    goto LABEL_9;
LABEL_8:
  v11 = __clz(__rbit64(v7));
  v7 &= v7 - 1;
  v12 = v11 | (v10 << 6);
  while (1)
  {
    sub_1B24EBD10(*(_QWORD *)(a1 + 48) + 40 * v12, (uint64_t)&v19);
    swift_dynamicCast();
    result = sub_1B25937C8(v17, v18);
    if (v7)
      goto LABEL_8;
LABEL_9:
    v13 = v10 + 1;
    if (__OFADD__(v10, 1))
    {
      __break(1u);
      goto LABEL_29;
    }
    if (v13 >= v8)
      goto LABEL_27;
    v14 = *(_QWORD *)(v4 + 8 * v13);
    v15 = v10 + 1;
    if (!v14)
    {
      v15 = v10 + 2;
      if (v10 + 2 >= v8)
        goto LABEL_27;
      v14 = *(_QWORD *)(v4 + 8 * v15);
      if (!v14)
      {
        v15 = v10 + 3;
        if (v10 + 3 >= v8)
          goto LABEL_27;
        v14 = *(_QWORD *)(v4 + 8 * v15);
        if (!v14)
        {
          v15 = v10 + 4;
          if (v10 + 4 >= v8)
            goto LABEL_27;
          v14 = *(_QWORD *)(v4 + 8 * v15);
          if (!v14)
            break;
        }
      }
    }
LABEL_24:
    v7 = (v14 - 1) & v14;
    v12 = __clz(__rbit64(v14)) + (v15 << 6);
    v10 = v15;
  }
  v16 = v10 + 5;
  if (v10 + 5 >= v8)
  {
LABEL_27:
    sub_1B24EADD4();
    return v20;
  }
  v14 = *(_QWORD *)(v4 + 8 * v16);
  if (v14)
  {
    v15 = v10 + 5;
    goto LABEL_24;
  }
  while (1)
  {
    v15 = v16 + 1;
    if (__OFADD__(v16, 1))
      break;
    if (v15 >= v8)
      goto LABEL_27;
    v14 = *(_QWORD *)(v4 + 8 * v15);
    ++v16;
    if (v14)
      goto LABEL_24;
  }
LABEL_29:
  __break(1u);
  return result;
}

uint64_t sub_1B2590994()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(v1 + 16) = v0;
  return OUTLINED_FUNCTION_6_0();
}

uint64_t sub_1B25909A4()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;

  OUTLINED_FUNCTION_102_5(*(_QWORD *)(v1 + 16));
  if (!v0)
    return (*(uint64_t (**)(_QWORD, unint64_t))(v1 + 8))(0, 0xE000000000000000);
  OUTLINED_FUNCTION_289();
  v2 = (_QWORD *)OUTLINED_FUNCTION_654();
  *(_QWORD *)(v1 + 32) = v2;
  OUTLINED_FUNCTION_18_0(v2, (uint64_t)sub_1B2590A10);
  return OUTLINED_FUNCTION_82_9();
}

uint64_t sub_1B2590A10(uint64_t a1)
{
  OUTLINED_FUNCTION_12_16(a1);
  OUTLINED_FUNCTION_17();
  return OUTLINED_FUNCTION_8();
}

uint64_t sub_1B2590A4C()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  id v4;
  unint64_t v5;
  unint64_t v6;

  v2 = *(_QWORD *)(v1 + 40);
  v3 = OUTLINED_FUNCTION_247_2();
  if (v2)
  {
    v4 = OUTLINED_FUNCTION_39_0(v3, sel_language);
    OUTLINED_FUNCTION_260_2();
    v2 = sub_1B25CCA18();
    v6 = v5;

  }
  else
  {
    v6 = 0xE000000000000000;
  }
  return (*(uint64_t (**)(uint64_t, unint64_t))(v1 + 8))(v2, v6);
}

uint64_t sub_1B2590ACC()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(v1 + 16) = v0;
  return OUTLINED_FUNCTION_6_0();
}

uint64_t sub_1B2590ADC()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;

  OUTLINED_FUNCTION_102_5(*(_QWORD *)(v1 + 16));
  if (v0)
  {
    OUTLINED_FUNCTION_289();
    v2 = (_QWORD *)OUTLINED_FUNCTION_654();
    *(_QWORD *)(v1 + 32) = v2;
    OUTLINED_FUNCTION_18_0(v2, (uint64_t)sub_1B2590B50);
    return Transcriber.recognitionStatistics.getter();
  }
  else
  {
    OUTLINED_FUNCTION_154_4();
    return OUTLINED_FUNCTION_14_0(MEMORY[0x1E0DEE9E0], *(uint64_t (**)(void))(v1 + 8));
  }
}

uint64_t sub_1B2590B50(uint64_t a1)
{
  OUTLINED_FUNCTION_12_16(a1);
  OUTLINED_FUNCTION_17();
  return OUTLINED_FUNCTION_8();
}

uint64_t sub_1B2590B8C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v1 = *(_QWORD *)(v0 + 40);
  OUTLINED_FUNCTION_247_2();
  if (v1)
  {
    v2 = *(_QWORD *)(v0 + 40);
  }
  else
  {
    OUTLINED_FUNCTION_154_4();
    v2 = MEMORY[0x1E0DEE9E0];
  }
  return (*(uint64_t (**)(uint64_t))(v0 + 8))(v2);
}

uint64_t sub_1B2590BD8()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(v1 + 16) = v0;
  return OUTLINED_FUNCTION_6_0();
}

uint64_t sub_1B2590BE8()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;

  OUTLINED_FUNCTION_102_5(*(_QWORD *)(v1 + 16));
  if (v0)
  {
    OUTLINED_FUNCTION_289();
    v2 = (_QWORD *)OUTLINED_FUNCTION_654();
    *(_QWORD *)(v1 + 32) = v2;
    OUTLINED_FUNCTION_18_0(v2, (uint64_t)sub_1B2590C5C);
    return Transcriber.recognitionUtterenceStatistics.getter();
  }
  else
  {
    OUTLINED_FUNCTION_154_4();
    return OUTLINED_FUNCTION_14_0(MEMORY[0x1E0DEE9E0], *(uint64_t (**)(void))(v1 + 8));
  }
}

uint64_t sub_1B2590C5C(uint64_t a1)
{
  OUTLINED_FUNCTION_12_16(a1);
  OUTLINED_FUNCTION_17();
  return OUTLINED_FUNCTION_8();
}

char *sub_1B2590C98(unint64_t a1)
{
  void *v1;
  uint64_t v2;
  void *v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *result;
  uint64_t v10;
  id v11;
  void *v12;
  unint64_t v13;
  unint64_t v14;
  _QWORD *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  _QWORD *v19;
  id v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;

  v3 = v1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EEFD71C0);
  OUTLINED_FUNCTION_30_0();
  MEMORY[0x1E0C80A78](v5, v6);
  OUTLINED_FUNCTION_315_0();
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    v7 = sub_1B25CD474();
    OUTLINED_FUNCTION_101_1();
  }
  else
  {
    v7 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
  }
  v8 = MEMORY[0x1E0DEE9D8];
  if (!v7)
  {
LABEL_13:
    v16 = OUTLINED_FUNCTION_37_4();
    OUTLINED_FUNCTION_291_0(v2, v17, v18, v16);
    v19 = (_QWORD *)OUTLINED_FUNCTION_8_4();
    v19[2] = 0;
    v19[3] = 0;
    v19[4] = v3;
    v19[5] = v8;
    v20 = v3;
    sub_1B24C53B8(v2, (uint64_t)&unk_1EEFDB190, (uint64_t)v19);
    return (char *)swift_release();
  }
  v26 = MEMORY[0x1E0DEE9D8];
  result = sub_1B25053E8(0, v7 & ~(v7 >> 63), 0);
  if ((v7 & 0x8000000000000000) == 0)
  {
    v21 = v2;
    v22 = v1;
    v10 = 0;
    v8 = v26;
    do
    {
      if ((a1 & 0xC000000000000001) != 0)
        v11 = (id)MEMORY[0x1B5E252C4](v10, a1);
      else
        v11 = *(id *)(a1 + 8 * v10 + 32);
      v12 = v11;
      objc_msgSend(v11, sel_CMTimeValue, v21, v22);

      v14 = *(_QWORD *)(v26 + 16);
      v13 = *(_QWORD *)(v26 + 24);
      if (v14 >= v13 >> 1)
        sub_1B25053E8((char *)(v13 > 1), v14 + 1, 1);
      *(_QWORD *)(v26 + 16) = v14 + 1;
      v15 = (_QWORD *)(v26 + 24 * v14);
      v15[4] = v23;
      ++v10;
      v15[5] = v24;
      v15[6] = v25;
    }
    while (v7 != v10);
    v2 = v21;
    v3 = v22;
    goto LABEL_13;
  }
  __break(1u);
  return result;
}

uint64_t sub_1B2590E68(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _QWORD *v5;

  v5[3] = a4;
  v5[4] = a5;
  v5[2] = a1;
  return swift_task_switch();
}

uint64_t sub_1B2590E84()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;

  v1 = *(_QWORD *)(*(_QWORD *)(v0 + 24) + OBJC_IVAR____TtC6Speech18ObjCSpeechAnalyzer_normalizedTranscriber);
  *(_QWORD *)(v0 + 40) = v1;
  if (v1)
  {
    OUTLINED_FUNCTION_289();
    v2 = (_QWORD *)OUTLINED_FUNCTION_654();
    *(_QWORD *)(v0 + 48) = v2;
    *v2 = v0;
    v2[1] = sub_1B2590F10;
    return Transcriber.requestResultAtEndpoints(_:)(*(_QWORD *)(v0 + 32));
  }
  else
  {
    **(_BYTE **)(v0 + 16) = 1;
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
}

uint64_t sub_1B2590F10()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 56) = v0;
  swift_task_dealloc();
  if (v0)
    OUTLINED_FUNCTION_670();
  swift_release();
  OUTLINED_FUNCTION_17();
  return OUTLINED_FUNCTION_0_0();
}

uint64_t sub_1B2590F80()
{
  uint64_t v0;

  **(_BYTE **)(v0 + 16) = *(_QWORD *)(v0 + 56) != 0;
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_1B2591010(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v2 + 16) = a1;
  *(_QWORD *)(v2 + 24) = v1;
  return OUTLINED_FUNCTION_6_0();
}

uint64_t sub_1B2591020()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 32) = v1;
  v2 = OUTLINED_FUNCTION_108_6(v1, (uint64_t)sub_1B2519CB4);
  return SpeechAnalyzer.prepareToAnalyze(reportingInto:)(v2);
}

uint64_t sub_1B2591074(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v3;

  v3[3] = a2;
  v3[4] = v2;
  v3[2] = a1;
  return OUTLINED_FUNCTION_6_0();
}

uint64_t sub_1B2591088()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;

  v1 = *(_QWORD *)(v0 + 24);
  v2 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 40) = v2;
  v3 = OUTLINED_FUNCTION_108_6(v2, (uint64_t)sub_1B25910E0);
  return SpeechAnalyzer.setInputAudioFile(_:withAudioFormat:)(v3, v1);
}

uint64_t sub_1B25910E0()
{
  uint64_t v0;

  OUTLINED_FUNCTION_105();
  OUTLINED_FUNCTION_81();
  return OUTLINED_FUNCTION_21(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_1B2591184(uint64_t a1, void *a2, const void *a3, void *a4)
{
  _QWORD *v4;
  uint64_t v8;
  uint64_t v9;
  id v10;
  _QWORD *v11;

  v4[2] = a2;
  v4[3] = a4;
  v8 = sub_1B25CC538();
  v4[4] = v8;
  v4[5] = *(_QWORD *)(v8 - 8);
  v9 = swift_task_alloc();
  v4[6] = v9;
  v4[7] = _Block_copy(a3);
  sub_1B25CC508();
  v10 = a2;
  a4;
  v11 = (_QWORD *)swift_task_alloc();
  v4[8] = v11;
  *v11 = v4;
  v11[1] = sub_1B259124C;
  return sub_1B2591074(v9, (uint64_t)v10);
}

uint64_t sub_1B259124C()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v9;

  v2 = *v1;
  v9 = v2;
  v3 = *(_QWORD *)(v2 + 40);
  v4 = *(void **)(v2 + 24);
  v5 = *(void **)(v2 + 16);
  OUTLINED_FUNCTION_19_3(&v9);
  OUTLINED_FUNCTION_257(*(uint64_t (**)(uint64_t, uint64_t))(v3 + 8));

  v6 = *(_QWORD *)(v2 + 56);
  if (v0)
  {
    v7 = (void *)OUTLINED_FUNCTION_121_4();
    OUTLINED_FUNCTION_670();
    OUTLINED_FUNCTION_257(*(uint64_t (**)(uint64_t, uint64_t))(v6 + 16));

  }
  else
  {
    OUTLINED_FUNCTION_46_2();
  }
  _Block_release(*(const void **)(v2 + 56));
  OUTLINED_FUNCTION_36();
  return ((uint64_t (*)(void))v1[1])();
}

uint64_t sub_1B25912F0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  _QWORD *v4;

  v4[4] = a3;
  v4[5] = v3;
  v4[2] = a1;
  v4[3] = a2;
  return OUTLINED_FUNCTION_6_0();
}

uint64_t sub_1B2591304()
{
  _QWORD *v0;
  uint64_t v1;
  id v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t result;
  uint64_t v9;
  char *v10;
  void *v11;
  uint64_t v12;
  char v13;
  uint64_t v14;
  char v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  unint64_t v19;
  unint64_t v20;
  _QWORD *v21;
  id v22;
  _QWORD *v23;
  unint64_t v24;
  uint64_t v25;
  unint64_t v26;
  uint64_t v27;
  char v28;
  uint64_t v29;
  uint64_t v30;

  v1 = v0[3];
  v2 = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for AnalysisContext()), sel_init);
  v0[6] = v2;
  if (v1)
  {
    v4 = v0[2];
    v3 = v0[3];
    swift_bridgeObjectRetain();
    sub_1B254A228(v4, v3);
  }
  v5 = v0[4];
  if (!v5)
    goto LABEL_17;
  if (v5 >> 62)
  {
    swift_bridgeObjectRetain();
    v6 = sub_1B25CD474();
    OUTLINED_FUNCTION_69();
  }
  else
  {
    v6 = *(_QWORD *)((v5 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  v7 = MEMORY[0x1E0DEE9D8];
  if (!v6)
  {
LABEL_16:
    sub_1B254A438(v7);
LABEL_17:
    v21 = (_QWORD *)swift_task_alloc();
    v0[7] = v21;
    OUTLINED_FUNCTION_18_0(v21, (uint64_t)sub_1B2591544);
    return SpeechAnalyzer.setContext(_:)((uint64_t)v2);
  }
  v30 = MEMORY[0x1E0DEE9D8];
  result = sub_1B2505390(0, v6 & ~(v6 >> 63), 0);
  if ((v6 & 0x8000000000000000) == 0)
  {
    v22 = v2;
    v23 = v0;
    v9 = 0;
    v7 = v30;
    v24 = v0[4] & 0xC000000000000001;
    v25 = v6;
    v26 = v5;
    do
    {
      if (v24)
        v10 = (char *)MEMORY[0x1B5E252C4](v9, v5);
      else
        v10 = (char *)*(id *)(v5 + 8 * v9 + 32);
      v11 = v10;
      v12 = *(_QWORD *)&v10[OBJC_IVAR___SFContextualNamedEntity_contextualNamedEntity + 8];
      v29 = *(_QWORD *)&v10[OBJC_IVAR___SFContextualNamedEntity_contextualNamedEntity];
      v13 = v10[OBJC_IVAR___SFContextualNamedEntity_contextualNamedEntity + 16];
      v14 = *(_QWORD *)&v10[OBJC_IVAR___SFContextualNamedEntity_contextualNamedEntity + 24];
      v15 = v10[OBJC_IVAR___SFContextualNamedEntity_contextualNamedEntity + 32];
      v16 = *(_QWORD *)&v10[OBJC_IVAR___SFContextualNamedEntity_contextualNamedEntity + 40];
      v28 = v10[OBJC_IVAR___SFContextualNamedEntity_contextualNamedEntity + 48];
      v17 = *(_QWORD *)&v10[OBJC_IVAR___SFContextualNamedEntity_contextualNamedEntity + 64];
      v27 = *(_QWORD *)&v10[OBJC_IVAR___SFContextualNamedEntity_contextualNamedEntity + 56];
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();

      v19 = *(_QWORD *)(v30 + 16);
      v18 = *(_QWORD *)(v30 + 24);
      if (v19 >= v18 >> 1)
        sub_1B2505390(v18 > 1, v19 + 1, 1);
      ++v9;
      *(_QWORD *)(v30 + 16) = v19 + 1;
      v20 = v30 + 72 * v19;
      *(_QWORD *)(v20 + 32) = v29;
      *(_QWORD *)(v20 + 40) = v12;
      *(_BYTE *)(v20 + 48) = v13;
      *(_QWORD *)(v20 + 56) = v14;
      *(_BYTE *)(v20 + 64) = v15;
      *(_QWORD *)(v20 + 72) = v16;
      *(_BYTE *)(v20 + 80) = v28;
      v5 = v26;
      *(_QWORD *)(v20 + 88) = v27;
      *(_QWORD *)(v20 + 96) = v17;
    }
    while (v25 != v9);
    v2 = v22;
    v0 = v23;
    goto LABEL_16;
  }
  __break(1u);
  return result;
}

uint64_t sub_1B2591544()
{
  uint64_t v0;
  _QWORD *v1;
  _QWORD *v2;
  uint64_t v3;

  OUTLINED_FUNCTION_105();
  *v2 = *v1;
  *(_QWORD *)(v3 + 64) = v0;
  swift_task_dealloc();
  OUTLINED_FUNCTION_17();
  return OUTLINED_FUNCTION_8();
}

uint64_t sub_1B2591594()
{
  uint64_t v0;

  return OUTLINED_FUNCTION_21(*(uint64_t (**)(void))(v0 + 8));
}

void sub_1B2591638()
{
  OUTLINED_FUNCTION_153_2();
  __break(1u);
}

uint64_t sub_1B259165C(uint64_t a1, uint64_t a2, void *aBlock, void *a4)
{
  _QWORD *v4;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;

  v4[2] = a4;
  v4[3] = _Block_copy(aBlock);
  if (a1)
  {
    a1 = sub_1B25CCA18();
    v9 = v8;
  }
  else
  {
    v9 = 0;
  }
  v4[4] = v9;
  if (a2)
  {
    type metadata accessor for SFContextualNamedEntity();
    a2 = sub_1B25CCBA4();
  }
  v4[5] = a2;
  a4;
  v10 = (_QWORD *)swift_task_alloc();
  v4[6] = v10;
  *v10 = v4;
  v10[1] = sub_1B2591724;
  return sub_1B25912F0(a1, v9, a2);
}

uint64_t sub_1B2591724(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t *a14, uint64_t a15, uint64_t a16)
{
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t *v20;
  void *v21;
  uint64_t v22;
  void *v23;

  OUTLINED_FUNCTION_55();
  a15 = v18;
  a16 = v19;
  a14 = v17;
  v20 = (uint64_t *)*v17;
  a14 = v20;
  v21 = (void *)v20[2];
  OUTLINED_FUNCTION_19_3(&a14);

  OUTLINED_FUNCTION_10_0();
  OUTLINED_FUNCTION_69();
  v22 = v20[3];
  if (v16)
  {
    v23 = (void *)OUTLINED_FUNCTION_121_4();
    OUTLINED_FUNCTION_670();
    OUTLINED_FUNCTION_257(*(uint64_t (**)(uint64_t, uint64_t))(v22 + 16));

  }
  else
  {
    OUTLINED_FUNCTION_46_2();
  }
  _Block_release((const void *)v20[3]);
  return OUTLINED_FUNCTION_119((uint64_t (*)(void))v17[1]);
}

id sub_1B25917B4()
{
  return sub_1B25917C4(0, type metadata accessor for ObjCSpeechAnalyzer);
}

id sub_1B25917C4(uint64_t a1, uint64_t (*a2)(void))
{
  void *v2;
  objc_super v4;

  v4.receiver = v2;
  v4.super_class = (Class)a2();
  return objc_msgSendSuper2(&v4, sel_dealloc);
}

uint64_t type metadata accessor for ObjCSpeechAnalyzer()
{
  uint64_t result;

  result = qword_1EEFDB110;
  if (!qword_1EEFDB110)
    return swift_getSingletonMetadata();
  return result;
}

void sub_1B25918AC()
{
  unint64_t v0;

  sub_1B2591944();
  if (v0 <= 0x3F)
    swift_updateClassMetadata2();
}

void sub_1B2591944()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_1EEFDB180)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EEFD8940);
    v0 = sub_1B25CD108();
    if (!v1)
      atomic_store(v0, &qword_1EEFDB180);
  }
}

uint64_t destroy for FixedFunctionPipeline()
{
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  return swift_unknownObjectRelease();
}

_QWORD *initializeWithCopy for FixedFunctionPipeline(_QWORD *a1, _QWORD *a2)
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
  a1[6] = a2[6];
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_unknownObjectRetain();
  swift_unknownObjectRetain();
  swift_unknownObjectRetain();
  return a1;
}

_QWORD *assignWithCopy for FixedFunctionPipeline(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  swift_retain();
  swift_release();
  a1[1] = a2[1];
  swift_retain();
  swift_release();
  a1[2] = a2[2];
  swift_retain();
  swift_release();
  a1[3] = a2[3];
  swift_retain();
  swift_release();
  a1[4] = a2[4];
  swift_unknownObjectRetain();
  swift_unknownObjectRelease();
  a1[5] = a2[5];
  swift_unknownObjectRetain();
  swift_unknownObjectRelease();
  a1[6] = a2[6];
  swift_unknownObjectRetain();
  swift_unknownObjectRelease();
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

uint64_t assignWithTake for FixedFunctionPipeline(uint64_t a1, uint64_t a2)
{
  swift_release();
  *(_OWORD *)a1 = *(_OWORD *)a2;
  swift_release();
  swift_release();
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  swift_release();
  swift_unknownObjectRelease();
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  swift_unknownObjectRelease();
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  swift_unknownObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for FixedFunctionPipeline(uint64_t *a1, unsigned int a2)
{
  int v2;
  uint64_t v3;

  if (a2)
  {
    if (a2 >= 0x7FFFFFFF && *((_BYTE *)a1 + 56))
    {
      v2 = *(_DWORD *)a1 + 2147483646;
    }
    else
    {
      v3 = *a1;
      if ((unint64_t)*a1 >= 0xFFFFFFFF)
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

uint64_t storeEnumTagSinglePayload for FixedFunctionPipeline(uint64_t result, unsigned int a2, unsigned int a3)
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
      *(_QWORD *)result = a2;
  }
  return result;
}

ValueMetadata *type metadata accessor for FixedFunctionPipeline()
{
  return &type metadata for FixedFunctionPipeline;
}

id sub_1B2591CA8(const void *a1)
{
  uint64_t v1;
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;
  id v9;
  _QWORD v11[2];
  __int128 v12;
  uint64_t v13;
  uint64_t v14;
  _BYTE v15[108];
  uint64_t v16;
  uint64_t v17;
  __int128 v18;
  uint64_t v19;
  uint64_t v20;

  OUTLINED_FUNCTION_152_0(v15, a1);
  v1 = swift_bridgeObjectRetain();
  sub_1B258ABEC(v1, (void (*)(uint64_t))sub_1B2594160);
  v2 = OUTLINED_FUNCTION_10_0();
  OUTLINED_FUNCTION_60(v2, &qword_1EEFDB2D0);
  v3 = (void *)sub_1B25CCB98();
  OUTLINED_FUNCTION_101_1();
  v4 = swift_bridgeObjectRetain();
  sub_1B258ACCC(v4, sub_1B2594168);
  OUTLINED_FUNCTION_101_1();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EEFD9A58);
  v5 = (void *)OUTLINED_FUNCTION_156_2();
  swift_bridgeObjectRelease();
  v6 = v15[104];
  v7 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  sub_1B25CC760();
  v8 = (void *)OUTLINED_FUNCTION_156_2();
  v11[0] = v16;
  v11[1] = v17;
  v12 = v18;
  v13 = v19;
  v14 = v20;
  v9 = objc_msgSend(v7, sel_initWithSegments_transcriptions_earResultType_nBestChoices_recognitionAudioRange_, v3, v5, v6, v8, v11);
  sub_1B2534B44((uint64_t)v15);

  return v9;
}

uint64_t sub_1B2591E20(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _BYTE *v8;
  uint64_t v9;
  _BYTE v11[16];
  uint64_t v12;
  uint64_t v13;

  v4 = sub_1B25CC388();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x1E0C80A78](v4, v6);
  v8 = &v11[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  sub_1B25CC394();
  v12 = a1;
  v13 = a2;
  v9 = sub_1B258AFA8((void (*)(uint64_t *__return_ptr, char *))sub_1B2594170, (uint64_t)v11);
  (*(void (**)(_BYTE *, uint64_t))(v5 + 8))(v8, v4);
  return v9;
}

id sub_1B2591ED0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, __int128 *a3@<X2>, _QWORD *a4@<X8>)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  __int128 v16;
  id result;
  uint64_t v18;
  _QWORD *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;

  v18 = a2;
  v19 = a4;
  v6 = sub_1B25CC3B8();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x1E0C80A78](v6, v8);
  v10 = (char *)&v18 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = sub_1B25CC364();
  v12 = *(_QWORD *)(v11 - 8);
  MEMORY[0x1E0C80A78](v11, v13);
  v15 = (char *)&v18 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1B24ADA58(0, &qword_1EEFDB2E0);
  (*(void (**)(char *, uint64_t, uint64_t))(v12 + 16))(v15, a1, v11);
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v10, v18, v6);
  v16 = a3[1];
  v20 = *a3;
  v21 = v16;
  v22 = a3[2];
  result = sub_1B2592004((uint64_t)v15, (uint64_t)v10);
  *v19 = result;
  return result;
}

id sub_1B2592004(uint64_t a1, uint64_t a2)
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
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  double v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  double v27;
  char v28;
  char v29;

  sub_1B25CC334();
  OUTLINED_FUNCTION_30_0();
  MEMORY[0x1E0C80A78](v4, v5);
  OUTLINED_FUNCTION_99_7();
  v6 = sub_1B25CC430();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x1E0C80A78](v6, v8);
  OUTLINED_FUNCTION_41_1();
  v11 = v10 - v9;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EEFDB2E8);
  OUTLINED_FUNCTION_30_0();
  MEMORY[0x1E0C80A78](v12, v13);
  OUTLINED_FUNCTION_42_3();
  sub_1B2531ABC();
  OUTLINED_FUNCTION_118_5();
  if ((v29 & 1) != 0)
  {
    v14 = 0.0;
    v15 = 0.0;
  }
  else
  {
    sub_1B25CD0B4();
    v17 = v16;
    sub_1B25CD0B4();
    v15 = v17 - v18;
    sub_1B25CD0B4();
    v14 = v19;
  }
  sub_1B25CC358();
  sub_1B24EBFA4(&qword_1EEFDB2F0, &qword_1EEFDB2E8);
  sub_1B25CC3DC();
  sub_1B24EBD4C(v2, &qword_1EEFDB2E8);
  sub_1B25CC424();
  (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v11, v6);
  sub_1B2531930(&qword_1EEFDB2F8, (void (*)(uint64_t))MEMORY[0x1E0CAEF10]);
  sub_1B25CCB14();
  v20 = (void *)sub_1B25CCA0C();
  OUTLINED_FUNCTION_173();
  sub_1B2531A80();
  OUTLINED_FUNCTION_118_5();
  if (v28)
    v21 = 0.0;
  else
    v21 = v27;
  v22 = objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_initWithText_confidence_startTime_duration_, v20, v21, v15, v14);

  v23 = sub_1B25CC3B8();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v23 - 8) + 8))(a2, v23);
  v24 = sub_1B25CC364();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v24 - 8) + 8))(a1, v24);
  return v22;
}

id sub_1B259227C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _BYTE *v8;
  uint64_t v9;
  id v10;
  _BYTE v12[16];
  uint64_t v13;
  uint64_t v14;

  v4 = sub_1B25CC388();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x1E0C80A78](v4, v6);
  v8 = &v12[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  sub_1B25CC394();
  v13 = a1;
  v14 = a2;
  sub_1B258AFA8((void (*)(uint64_t *__return_ptr, char *))sub_1B2594558, (uint64_t)v12);
  (*(void (**)(_BYTE *, uint64_t))(v5 + 8))(v8, v4);
  type metadata accessor for TranscriptionSegment(0);
  sub_1B25318AC(a2);
  v9 = swift_bridgeObjectRetain();
  sub_1B258ADCC(v9, a2);
  swift_bridgeObjectRelease();
  v10 = objc_allocWithZone((Class)SFAnalyzerTranscriptionSegment);
  return sub_1B25924B4();
}

id sub_1B259238C(uint64_t *a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  id v16;
  _QWORD v17[6];

  v4 = *a1;
  v5 = a1[2];
  v6 = a1[3];
  v7 = a1[5];
  v8 = (void *)sub_1B25CC670();
  sub_1B24ADA58(0, &qword_1EEFDB330);
  v9 = a1[1];
  v10 = a1[4];
  v11 = (void *)sub_1B25CCB98();
  swift_bridgeObjectRelease();
  v12 = (void *)sub_1B25CCA0C();
  swift_bridgeObjectRelease();
  v17[0] = v4;
  v17[1] = v9;
  v17[2] = v5;
  v17[3] = v6;
  v17[4] = v10;
  v17[5] = v7;
  v13 = objc_msgSend(v16, sel_initWithRange_dominantLocale_alternatives_detectedLanguageCode_, v17, v8, v11, v12);

  v14 = sub_1B25CC6F4();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 8))(a2, v14);
  return v13;
}

id sub_1B25924B4()
{
  void *v0;
  void *v1;
  void *v2;
  id v3;

  sub_1B24ADA58(0, &qword_1EEFDB2E0);
  v1 = (void *)sub_1B25CCB98();
  swift_bridgeObjectRelease();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EEFD9A58);
  v2 = (void *)sub_1B25CCB98();
  swift_bridgeObjectRelease();
  v3 = objc_msgSend(v0, sel_initWithText_alternatives_, v1, v2);

  return v3;
}

uint64_t sub_1B2592558(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v3;
  _QWORD *v4;
  uint64_t (*v6)(void);

  v6 = (uint64_t (*)(void))((char *)a3 + *a3);
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v3 + 16) = v4;
  *v4 = v3;
  v4[1] = sub_1B2501B24;
  return v6();
}

uint64_t sub_1B25925AC(uint64_t a1, uint64_t a2, uint64_t a3, int *a4)
{
  uint64_t v4;
  _QWORD *v5;
  uint64_t (*v7)(void);

  v7 = (uint64_t (*)(void))((char *)a4 + *a4);
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v4 + 16) = v5;
  *v5 = v4;
  v5[1] = sub_1B2501B24;
  return v7();
}

uint64_t sub_1B2592600(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;

  v6 = sub_1B25CCCDC();
  if (__swift_getEnumTagSinglePayload(a1, 1, v6) == 1)
  {
    sub_1B24EBD4C(a1, &qword_1EEFD71C0);
  }
  else
  {
    sub_1B25CCCD0();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 8))(a1, v6);
  }
  if (*(_QWORD *)(a3 + 16))
  {
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_1B25CCC40();
    swift_unknownObjectRelease();
  }
  v7 = swift_allocObject();
  *(_QWORD *)(v7 + 16) = a2;
  *(_QWORD *)(v7 + 24) = a3;
  return swift_task_create();
}

uint64_t sub_1B2592744(uint64_t a1, int *a2)
{
  uint64_t v2;
  _QWORD *v4;
  uint64_t (*v6)(uint64_t);

  v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v4;
  *v4 = v2;
  v4[1] = sub_1B254BF18;
  return v6(a1);
}

uint64_t sub_1B25927A8()
{
  uint64_t v0;

  OUTLINED_FUNCTION_140_0();

  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_103_7();
  return swift_deallocObject();
}

uint64_t sub_1B25927D0()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  OUTLINED_FUNCTION_55();
  v1 = swift_task_alloc();
  v2 = (_QWORD *)OUTLINED_FUNCTION_42_4(v1);
  *v2 = v0;
  v2[1] = sub_1B2501B24;
  v3 = OUTLINED_FUNCTION_90_9();
  return sub_1B2590E68(v3, v4, v5, v6, v7);
}

void sub_1B259282C()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  void *v3;
  uint64_t v4;
  unint64_t v5;
  char v6;
  BOOL v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char v13;
  char v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;

  __swift_instantiateConcreteTypeFromMangledName(&qword_1EEFD8FE8);
  OUTLINED_FUNCTION_17_15();
  OUTLINED_FUNCTION_76_10();
  if (v2)
  {
    v3 = (void *)OUTLINED_FUNCTION_4_16();
    if (v6)
      v7 = (unint64_t)v3 >= v5;
    else
      v7 = 1;
    if (v7)
      OUTLINED_FUNCTION_33_11(v3, v4);
    OUTLINED_FUNCTION_7_15();
    if (!v10)
      goto LABEL_10;
LABEL_9:
    OUTLINED_FUNCTION_36_12();
    while (1)
    {
      OUTLINED_FUNCTION_133_4();
      if (v19)
        goto LABEL_9;
LABEL_10:
      if (__OFADD__(v9, 1))
      {
        __break(1u);
        goto LABEL_30;
      }
      if (v9 + 1 >= v8)
        goto LABEL_28;
      OUTLINED_FUNCTION_142_3();
      if (!v11)
      {
        OUTLINED_FUNCTION_141_3();
        if (v13 == v14)
          goto LABEL_28;
        if (!*(_QWORD *)(v1 + 8 * v12))
        {
          OUTLINED_FUNCTION_138_2();
          if (v13 == v14)
            goto LABEL_28;
          if (!*(_QWORD *)(v1 + 8 * v15))
          {
            OUTLINED_FUNCTION_135_4();
            if (v13 == v14)
              goto LABEL_28;
            if (!*(_QWORD *)(v1 + 8 * v17))
              break;
          }
        }
      }
LABEL_25:
      OUTLINED_FUNCTION_35_16();
    }
    while (!__OFADD__(v17, 1))
    {
      if (v17 + 1 >= v16)
        goto LABEL_28;
      OUTLINED_FUNCTION_139_2();
      if (v18)
        goto LABEL_25;
    }
LABEL_30:
    __break(1u);
  }
  else
  {
LABEL_28:
    OUTLINED_FUNCTION_75_3();
    *v0 = v0;
    OUTLINED_FUNCTION_262();
  }
}

void sub_1B2592908()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  unint64_t v9;
  char v10;
  BOOL v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD *v15;
  uint64_t v16;
  _QWORD *v17;

  OUTLINED_FUNCTION_123_2();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EEFD74B8);
  OUTLINED_FUNCTION_17_15();
  OUTLINED_FUNCTION_76_10();
  if (!v6)
  {
LABEL_26:
    OUTLINED_FUNCTION_75_3();
    *v0 = v0;
    OUTLINED_FUNCTION_462();
    return;
  }
  v7 = (void *)OUTLINED_FUNCTION_4_16();
  if (v10)
    v11 = (unint64_t)v7 >= v9;
  else
    v11 = 1;
  if (v11)
    OUTLINED_FUNCTION_33_11(v7, v8);
  OUTLINED_FUNCTION_13_13();
  if (!v5)
    goto LABEL_10;
LABEL_9:
  OUTLINED_FUNCTION_51_9();
  while (1)
  {
    v15 = (_QWORD *)(*(_QWORD *)(v1 + 48) + 16 * v12);
    v16 = v15[1];
    v17 = (_QWORD *)(v0[6] + 16 * v12);
    *v17 = *v15;
    v17[1] = v16;
    swift_bridgeObjectRetain();
    if (v5)
      goto LABEL_9;
LABEL_10:
    v13 = v4 + 1;
    if (__OFADD__(v4, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v13 >= v3)
      goto LABEL_26;
    ++v4;
    if (!*(_QWORD *)(v2 + 8 * v13))
    {
      v4 = v13 + 1;
      if (v13 + 1 >= v3)
        goto LABEL_26;
      if (!*(_QWORD *)(v2 + 8 * v4))
      {
        v4 = v13 + 2;
        if (v13 + 2 >= v3)
          goto LABEL_26;
        if (!*(_QWORD *)(v2 + 8 * v4))
          break;
      }
    }
LABEL_23:
    OUTLINED_FUNCTION_50_12();
  }
  v14 = v13 + 3;
  if (v14 >= v3)
    goto LABEL_26;
  if (*(_QWORD *)(v2 + 8 * v14))
  {
    v4 = v14;
    goto LABEL_23;
  }
  while (1)
  {
    v4 = v14 + 1;
    if (__OFADD__(v14, 1))
      break;
    if (v4 >= v3)
      goto LABEL_26;
    ++v14;
    if (*(_QWORD *)(v2 + 8 * v4))
      goto LABEL_23;
  }
LABEL_28:
  __break(1u);
}

void sub_1B2592A14()
{
  sub_1B2592A2C(&qword_1EEFD74A8);
}

void sub_1B2592A20()
{
  sub_1B2592A2C(&qword_1EEFD74A0);
}

void sub_1B2592A2C(uint64_t *a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  unint64_t v6;
  char v7;
  BOOL v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char v14;
  char v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;

  __swift_instantiateConcreteTypeFromMangledName(a1);
  OUTLINED_FUNCTION_17_15();
  OUTLINED_FUNCTION_76_10();
  if (v3)
  {
    v4 = (void *)OUTLINED_FUNCTION_4_16();
    if (v7)
      v8 = (unint64_t)v4 >= v6;
    else
      v8 = 1;
    if (v8)
      OUTLINED_FUNCTION_33_11(v4, v5);
    OUTLINED_FUNCTION_7_15();
    if (!v11)
      goto LABEL_10;
LABEL_9:
    OUTLINED_FUNCTION_36_12();
    while (1)
    {
      OUTLINED_FUNCTION_134_3();
      if (v20)
        goto LABEL_9;
LABEL_10:
      if (__OFADD__(v10, 1))
      {
        __break(1u);
        goto LABEL_30;
      }
      if (v10 + 1 >= v9)
        goto LABEL_28;
      OUTLINED_FUNCTION_142_3();
      if (!v12)
      {
        OUTLINED_FUNCTION_141_3();
        if (v14 == v15)
          goto LABEL_28;
        if (!*(_QWORD *)(v2 + 8 * v13))
        {
          OUTLINED_FUNCTION_138_2();
          if (v14 == v15)
            goto LABEL_28;
          if (!*(_QWORD *)(v2 + 8 * v16))
          {
            OUTLINED_FUNCTION_135_4();
            if (v14 == v15)
              goto LABEL_28;
            if (!*(_QWORD *)(v2 + 8 * v18))
              break;
          }
        }
      }
LABEL_25:
      OUTLINED_FUNCTION_35_16();
    }
    while (!__OFADD__(v18, 1))
    {
      if (v18 + 1 >= v17)
        goto LABEL_28;
      OUTLINED_FUNCTION_139_2();
      if (v19)
        goto LABEL_25;
    }
LABEL_30:
    __break(1u);
  }
  else
  {
LABEL_28:
    OUTLINED_FUNCTION_75_3();
    *v1 = v1;
    OUTLINED_FUNCTION_262();
  }
}

void sub_1B2592B00()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  unint64_t v9;
  char v10;
  BOOL v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  OUTLINED_FUNCTION_123_2();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EEFD8E08);
  OUTLINED_FUNCTION_17_15();
  OUTLINED_FUNCTION_76_10();
  if (!v6)
  {
LABEL_26:
    OUTLINED_FUNCTION_75_3();
    *v0 = v0;
    OUTLINED_FUNCTION_462();
    return;
  }
  v7 = (void *)OUTLINED_FUNCTION_4_16();
  if (v10)
    v11 = (unint64_t)v7 >= v9;
  else
    v11 = 1;
  if (v11)
    OUTLINED_FUNCTION_33_11(v7, v8);
  OUTLINED_FUNCTION_13_13();
  if (!v5)
    goto LABEL_10;
LABEL_9:
  OUTLINED_FUNCTION_51_9();
  while (1)
  {
    *(_QWORD *)(v0[6] + 8 * v12) = *(_QWORD *)(*(_QWORD *)(v1 + 48) + 8 * v12);
    swift_retain();
    if (v5)
      goto LABEL_9;
LABEL_10:
    v13 = v4 + 1;
    if (__OFADD__(v4, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v13 >= v3)
      goto LABEL_26;
    ++v4;
    if (!*(_QWORD *)(v2 + 8 * v13))
    {
      v4 = v13 + 1;
      if (v13 + 1 >= v3)
        goto LABEL_26;
      if (!*(_QWORD *)(v2 + 8 * v4))
      {
        v4 = v13 + 2;
        if (v13 + 2 >= v3)
          goto LABEL_26;
        if (!*(_QWORD *)(v2 + 8 * v4))
          break;
      }
    }
LABEL_23:
    OUTLINED_FUNCTION_50_12();
  }
  v14 = v13 + 3;
  if (v14 >= v3)
    goto LABEL_26;
  if (*(_QWORD *)(v2 + 8 * v14))
  {
    v4 = v14;
    goto LABEL_23;
  }
  while (1)
  {
    v4 = v14 + 1;
    if (__OFADD__(v14, 1))
      break;
    if (v4 >= v3)
      goto LABEL_26;
    ++v14;
    if (*(_QWORD *)(v2 + 8 * v4))
      goto LABEL_23;
  }
LABEL_28:
  __break(1u);
}

void sub_1B2592C04()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  unint64_t v9;
  char v10;
  BOOL v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  id v16;

  OUTLINED_FUNCTION_123_2();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EEFD8F38);
  OUTLINED_FUNCTION_17_15();
  OUTLINED_FUNCTION_76_10();
  if (!v6)
  {
LABEL_26:
    OUTLINED_FUNCTION_75_3();
    *v0 = v0;
    OUTLINED_FUNCTION_462();
    return;
  }
  v7 = (void *)OUTLINED_FUNCTION_4_16();
  if (v10)
    v11 = (unint64_t)v7 >= v9;
  else
    v11 = 1;
  if (v11)
    OUTLINED_FUNCTION_33_11(v7, v8);
  OUTLINED_FUNCTION_13_13();
  if (!v5)
    goto LABEL_10;
LABEL_9:
  OUTLINED_FUNCTION_51_9();
  while (1)
  {
    v15 = *(void **)(*(_QWORD *)(v1 + 48) + 8 * v12);
    *(_QWORD *)(v0[6] + 8 * v12) = v15;
    v16 = v15;
    if (v5)
      goto LABEL_9;
LABEL_10:
    v13 = v4 + 1;
    if (__OFADD__(v4, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v13 >= v3)
      goto LABEL_26;
    ++v4;
    if (!*(_QWORD *)(v2 + 8 * v13))
    {
      v4 = v13 + 1;
      if (v13 + 1 >= v3)
        goto LABEL_26;
      if (!*(_QWORD *)(v2 + 8 * v4))
      {
        v4 = v13 + 2;
        if (v13 + 2 >= v3)
          goto LABEL_26;
        if (!*(_QWORD *)(v2 + 8 * v4))
          break;
      }
    }
LABEL_23:
    OUTLINED_FUNCTION_50_12();
  }
  v14 = v13 + 3;
  if (v14 >= v3)
    goto LABEL_26;
  if (*(_QWORD *)(v2 + 8 * v14))
  {
    v4 = v14;
    goto LABEL_23;
  }
  while (1)
  {
    v4 = v14 + 1;
    if (__OFADD__(v14, 1))
      break;
    if (v4 >= v3)
      goto LABEL_26;
    ++v14;
    if (*(_QWORD *)(v2 + 8 * v4))
      goto LABEL_23;
  }
LABEL_28:
  __break(1u);
}

void sub_1B2592D08()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  void *v3;
  uint64_t v4;
  unint64_t v5;
  char v6;
  BOOL v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char v13;
  char v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;

  __swift_instantiateConcreteTypeFromMangledName(&qword_1EEFD8F18);
  OUTLINED_FUNCTION_17_15();
  OUTLINED_FUNCTION_76_10();
  if (v2)
  {
    v3 = (void *)OUTLINED_FUNCTION_4_16();
    if (v6)
      v7 = (unint64_t)v3 >= v5;
    else
      v7 = 1;
    if (v7)
      OUTLINED_FUNCTION_33_11(v3, v4);
    OUTLINED_FUNCTION_7_15();
    if (!v10)
      goto LABEL_10;
LABEL_9:
    OUTLINED_FUNCTION_36_12();
    while (1)
    {
      OUTLINED_FUNCTION_133_4();
      if (v19)
        goto LABEL_9;
LABEL_10:
      if (__OFADD__(v9, 1))
      {
        __break(1u);
        goto LABEL_30;
      }
      if (v9 + 1 >= v8)
        goto LABEL_28;
      OUTLINED_FUNCTION_142_3();
      if (!v11)
      {
        OUTLINED_FUNCTION_141_3();
        if (v13 == v14)
          goto LABEL_28;
        if (!*(_QWORD *)(v1 + 8 * v12))
        {
          OUTLINED_FUNCTION_138_2();
          if (v13 == v14)
            goto LABEL_28;
          if (!*(_QWORD *)(v1 + 8 * v15))
          {
            OUTLINED_FUNCTION_135_4();
            if (v13 == v14)
              goto LABEL_28;
            if (!*(_QWORD *)(v1 + 8 * v17))
              break;
          }
        }
      }
LABEL_25:
      OUTLINED_FUNCTION_35_16();
    }
    while (!__OFADD__(v17, 1))
    {
      if (v17 + 1 >= v16)
        goto LABEL_28;
      OUTLINED_FUNCTION_139_2();
      if (v18)
        goto LABEL_25;
    }
LABEL_30:
    __break(1u);
  }
  else
  {
LABEL_28:
    OUTLINED_FUNCTION_75_3();
    *v0 = v0;
    OUTLINED_FUNCTION_262();
  }
}

void sub_1B2592DE4()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  void *v3;
  uint64_t v4;
  unint64_t v5;
  char v6;
  BOOL v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char v13;
  char v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;

  __swift_instantiateConcreteTypeFromMangledName(&qword_1EEFD74B0);
  OUTLINED_FUNCTION_17_15();
  OUTLINED_FUNCTION_76_10();
  if (v2)
  {
    v3 = (void *)OUTLINED_FUNCTION_4_16();
    if (v6)
      v7 = (unint64_t)v3 >= v5;
    else
      v7 = 1;
    if (v7)
      OUTLINED_FUNCTION_33_11(v3, v4);
    OUTLINED_FUNCTION_7_15();
    if (!v10)
      goto LABEL_10;
LABEL_9:
    OUTLINED_FUNCTION_36_12();
    while (1)
    {
      OUTLINED_FUNCTION_134_3();
      if (v19)
        goto LABEL_9;
LABEL_10:
      if (__OFADD__(v9, 1))
      {
        __break(1u);
        goto LABEL_30;
      }
      if (v9 + 1 >= v8)
        goto LABEL_28;
      OUTLINED_FUNCTION_142_3();
      if (!v11)
      {
        OUTLINED_FUNCTION_141_3();
        if (v13 == v14)
          goto LABEL_28;
        if (!*(_QWORD *)(v1 + 8 * v12))
        {
          OUTLINED_FUNCTION_138_2();
          if (v13 == v14)
            goto LABEL_28;
          if (!*(_QWORD *)(v1 + 8 * v15))
          {
            OUTLINED_FUNCTION_135_4();
            if (v13 == v14)
              goto LABEL_28;
            if (!*(_QWORD *)(v1 + 8 * v17))
              break;
          }
        }
      }
LABEL_25:
      OUTLINED_FUNCTION_35_16();
    }
    while (!__OFADD__(v17, 1))
    {
      if (v17 + 1 >= v16)
        goto LABEL_28;
      OUTLINED_FUNCTION_139_2();
      if (v18)
        goto LABEL_25;
    }
LABEL_30:
    __break(1u);
  }
  else
  {
LABEL_28:
    OUTLINED_FUNCTION_75_3();
    *v0 = v0;
    OUTLINED_FUNCTION_262();
  }
}

void sub_1B2592EC0()
{
  sub_1B2592EE8();
}

void sub_1B2592ED4()
{
  sub_1B2592EE8();
}

void sub_1B2592EE8()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t *v2;
  uint64_t *v3;
  uint64_t (*v4)(_QWORD);
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  unint64_t v15;
  int64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  int64_t v22;
  unint64_t v23;
  unint64_t i;
  int64_t v25;
  unint64_t v26;
  int64_t v27;
  unint64_t v28;
  uint64_t v29;
  uint64_t *v30;

  OUTLINED_FUNCTION_59_0();
  v2 = v1;
  v3 = v0;
  v5 = v4(0);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x1E0C80A78](v5, v7);
  v9 = (char *)&v29 - v8;
  __swift_instantiateConcreteTypeFromMangledName(v2);
  v10 = *v0;
  v11 = sub_1B25CD294();
  v12 = v11;
  if (!*(_QWORD *)(v10 + 16))
  {
    OUTLINED_FUNCTION_144();
LABEL_30:
    *v3 = v12;
    OUTLINED_FUNCTION_7_1();
    return;
  }
  v30 = v3;
  v13 = (void *)(v11 + 56);
  v14 = v10 + 56;
  v15 = (unint64_t)((1 << *(_BYTE *)(v12 + 32)) + 63) >> 6;
  if (v12 != v10 || (unint64_t)v13 >= v10 + 56 + 8 * v15)
    memmove(v13, (const void *)(v10 + 56), 8 * v15);
  v17 = 0;
  *(_QWORD *)(v12 + 16) = *(_QWORD *)(v10 + 16);
  v18 = 1 << *(_BYTE *)(v10 + 32);
  v19 = *(_QWORD *)(v10 + 56);
  v20 = -1;
  if (v18 < 64)
    v20 = ~(-1 << v18);
  v21 = v20 & v19;
  v22 = (unint64_t)(v18 + 63) >> 6;
  if ((v20 & v19) == 0)
    goto LABEL_12;
LABEL_11:
  v23 = __clz(__rbit64(v21));
  v21 &= v21 - 1;
  for (i = v23 | (v17 << 6); ; i = __clz(__rbit64(v26)) + (v17 << 6))
  {
    v28 = *(_QWORD *)(v6 + 72) * i;
    (*(void (**)(char *, unint64_t, uint64_t))(v6 + 16))(v9, *(_QWORD *)(v10 + 48) + v28, v5);
    (*(void (**)(unint64_t, char *, uint64_t))(v6 + 32))(*(_QWORD *)(v12 + 48) + v28, v9, v5);
    if (v21)
      goto LABEL_11;
LABEL_12:
    v25 = v17 + 1;
    if (__OFADD__(v17, 1))
    {
      __break(1u);
      goto LABEL_32;
    }
    if (v25 >= v22)
      goto LABEL_28;
    v26 = *(_QWORD *)(v14 + 8 * v25);
    ++v17;
    if (!v26)
    {
      v17 = v25 + 1;
      if (v25 + 1 >= v22)
        goto LABEL_28;
      v26 = *(_QWORD *)(v14 + 8 * v17);
      if (!v26)
      {
        v17 = v25 + 2;
        if (v25 + 2 >= v22)
          goto LABEL_28;
        v26 = *(_QWORD *)(v14 + 8 * v17);
        if (!v26)
          break;
      }
    }
LABEL_25:
    v21 = (v26 - 1) & v26;
  }
  v27 = v25 + 3;
  if (v27 >= v22)
  {
LABEL_28:
    OUTLINED_FUNCTION_144();
    v3 = v30;
    goto LABEL_30;
  }
  v26 = *(_QWORD *)(v14 + 8 * v27);
  if (v26)
  {
    v17 = v27;
    goto LABEL_25;
  }
  while (1)
  {
    v17 = v27 + 1;
    if (__OFADD__(v27, 1))
      break;
    if (v17 >= v22)
      goto LABEL_28;
    v26 = *(_QWORD *)(v14 + 8 * v17);
    ++v27;
    if (v26)
      goto LABEL_25;
  }
LABEL_32:
  __break(1u);
}

uint64_t sub_1B25930EC@<X0>(unsigned __int8 a1@<W0>, _BYTE *a2@<X8>)
{
  uint64_t *v2;
  uint64_t v5;
  uint64_t result;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  int isUniquelyReferenced_nonNull_native;
  uint64_t v12;
  uint64_t v13;

  v5 = *v2;
  sub_1B25CD6A8();
  sub_1B25CD6B4();
  result = sub_1B25CD6CC();
  v7 = -1 << *(_BYTE *)(v5 + 32);
  v8 = result & ~v7;
  if (((*(_QWORD *)(v5 + 56 + ((v8 >> 3) & 0xFFFFFFFFFFFFF8)) >> v8) & 1) == 0)
  {
LABEL_9:
    *a2 = 6;
    return result;
  }
  v9 = *(_QWORD *)(v5 + 48);
  if (*(unsigned __int8 *)(v9 + v8) != a1)
  {
    v10 = ~v7;
    do
    {
      v8 = (v8 + 1) & v10;
      if (((*(_QWORD *)(v5 + 56 + ((v8 >> 3) & 0xFFFFFFFFFFFFF8)) >> v8) & 1) == 0)
        goto LABEL_9;
    }
    while (*(unsigned __int8 *)(v9 + v8) != a1);
  }
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  v12 = *v2;
  v13 = *v2;
  *v2 = 0x8000000000000000;
  if (!isUniquelyReferenced_nonNull_native)
  {
    sub_1B2592A2C(&qword_1EEFD74A8);
    v12 = v13;
  }
  *a2 = *(_BYTE *)(*(_QWORD *)(v12 + 48) + v8);
  sub_1B2593490(v8);
  *v2 = v13;
  return swift_bridgeObjectRelease();
}

unint64_t sub_1B259321C(uint64_t a1)
{
  uint64_t *v1;
  uint64_t v3;
  uint64_t v4;
  char v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  int isUniquelyReferenced_nonNull_native;
  uint64_t v13;
  uint64_t v15;

  v3 = *v1;
  if ((*v1 & 0xC000000000000001) == 0)
  {
    sub_1B25CD6A8();
    sub_1B25CD6B4();
    v7 = sub_1B25CD6CC();
    v8 = -1 << *(_BYTE *)(v3 + 32);
    v9 = v7 & ~v8;
    if (((*(_QWORD *)(v3 + 56 + ((v9 >> 3) & 0xFFFFFFFFFFFFF8)) >> v9) & 1) != 0)
    {
      v10 = *(_QWORD *)(v3 + 48);
      if (*(_QWORD *)(v10 + 8 * v9) == a1)
      {
LABEL_12:
        isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
        v13 = *v1;
        v15 = *v1;
        *v1 = 0x8000000000000000;
        if (!isUniquelyReferenced_nonNull_native)
        {
          sub_1B2592B00();
          v13 = v15;
        }
        v6 = *(_QWORD *)(*(_QWORD *)(v13 + 48) + 8 * v9);
        sub_1B259362C(v9);
        *v1 = v15;
        goto LABEL_15;
      }
      v11 = ~v8;
      while (1)
      {
        v9 = (v9 + 1) & v11;
        if (((*(_QWORD *)(v3 + 56 + ((v9 >> 3) & 0xFFFFFFFFFFFFF8)) >> v9) & 1) == 0)
          break;
        if (*(_QWORD *)(v10 + 8 * v9) == a1)
          goto LABEL_12;
      }
    }
    return 0;
  }
  if (v3 < 0)
    v4 = *v1;
  else
    v4 = v3 & 0xFFFFFFFFFFFFFF8;
  OUTLINED_FUNCTION_95_1();
  swift_retain();
  v5 = sub_1B25CD240();
  OUTLINED_FUNCTION_75_3();
  if ((v5 & 1) == 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  v6 = sub_1B2593390(v4, a1);
LABEL_15:
  swift_bridgeObjectRelease();
  return v6;
}

unint64_t sub_1B2593390(uint64_t a1, uint64_t a2)
{
  uint64_t *v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t result;
  uint64_t v10;
  uint64_t v11;

  swift_bridgeObjectRelease();
  v4 = sub_1B25CD210();
  v5 = swift_unknownObjectRetain();
  v6 = sub_1B24E2C5C(v5, v4);
  sub_1B25CD6A8();
  sub_1B25CD6B4();
  v7 = sub_1B25CD6CC();
  v8 = -1 << *(_BYTE *)(v6 + 32);
  result = v7 & ~v8;
  if (((*(_QWORD *)(v6 + 56 + ((result >> 3) & 0xFFFFFFFFFFFFF8)) >> result) & 1) != 0)
  {
    v10 = *(_QWORD *)(v6 + 48);
    if (*(_QWORD *)(v10 + 8 * result) == a2)
    {
LABEL_6:
      sub_1B259362C(result);
      *v2 = v6;
      return a2;
    }
    v11 = ~v8;
    while (1)
    {
      result = (result + 1) & v11;
      if (((*(_QWORD *)(v6 + 56 + ((result >> 3) & 0xFFFFFFFFFFFFF8)) >> result) & 1) == 0)
        break;
      if (*(_QWORD *)(v10 + 8 * result) == a2)
        goto LABEL_6;
    }
    __break(1u);
  }
  __break(1u);
  return result;
}

unint64_t sub_1B2593490(unint64_t result)
{
  uint64_t *v1;
  int64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v13;
  _BYTE *v14;
  _BYTE *v15;
  BOOL v16;
  uint64_t v17;
  BOOL v18;
  uint64_t v19;

  v2 = result;
  v3 = *v1;
  v4 = *v1 + 56;
  v5 = -1 << *(_BYTE *)(*v1 + 32);
  v6 = (result + 1) & ~v5;
  if (((1 << v6) & *(_QWORD *)(v4 + 8 * (v6 >> 6))) != 0)
  {
    v7 = ~v5;
    swift_retain();
    v8 = sub_1B25CD1B0();
    if ((*(_QWORD *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      v9 = (v8 + 1) & v7;
      do
      {
        sub_1B25CD6A8();
        sub_1B25CD6B4();
        v10 = sub_1B25CD6CC() & v7;
        if (v2 >= (uint64_t)v9)
        {
          if (v10 >= v9 && v2 >= v10)
          {
LABEL_15:
            v13 = *(_QWORD *)(v3 + 48);
            v14 = (_BYTE *)(v13 + v2);
            v15 = (_BYTE *)(v13 + v6);
            v16 = v2 != v6 || v14 >= v15 + 1;
            v2 = v6;
            if (v16)
            {
              *v14 = *v15;
              v2 = v6;
            }
          }
        }
        else if (v10 >= v9 || v2 >= v10)
        {
          goto LABEL_15;
        }
        v6 = (v6 + 1) & v7;
      }
      while (((*(_QWORD *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8)) >> v6) & 1) != 0);
    }
    *(_QWORD *)(v4 + (((unint64_t)v2 >> 3) & 0x1FFFFFFFFFFFFFF8)) &= (-1 << v2) - 1;
    result = swift_release();
  }
  else
  {
    *(_QWORD *)(v4 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) &= (-1 << result) - 1;
  }
  v17 = *(_QWORD *)(v3 + 16);
  v18 = __OFSUB__(v17, 1);
  v19 = v17 - 1;
  if (v18)
  {
    __break(1u);
  }
  else
  {
    *(_QWORD *)(v3 + 16) = v19;
    ++*(_DWORD *)(v3 + 36);
  }
  return result;
}

unint64_t sub_1B259362C(unint64_t result)
{
  uint64_t *v1;
  int64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v13;
  _QWORD *v14;
  _QWORD *v15;
  BOOL v16;
  uint64_t v17;
  BOOL v18;
  uint64_t v19;

  v2 = result;
  v3 = *v1;
  v4 = *v1 + 56;
  v5 = -1 << *(_BYTE *)(*v1 + 32);
  v6 = (result + 1) & ~v5;
  if (((1 << v6) & *(_QWORD *)(v4 + 8 * (v6 >> 6))) != 0)
  {
    v7 = ~v5;
    swift_retain();
    v8 = sub_1B25CD1B0();
    if ((*(_QWORD *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      v9 = (v8 + 1) & v7;
      do
      {
        sub_1B25CD6A8();
        sub_1B25CD6B4();
        v10 = sub_1B25CD6CC() & v7;
        if (v2 >= (uint64_t)v9)
        {
          if (v10 >= v9 && v2 >= v10)
          {
LABEL_15:
            v13 = *(_QWORD *)(v3 + 48);
            v14 = (_QWORD *)(v13 + 8 * v2);
            v15 = (_QWORD *)(v13 + 8 * v6);
            v16 = v2 != v6 || v14 >= v15 + 1;
            v2 = v6;
            if (v16)
            {
              *v14 = *v15;
              v2 = v6;
            }
          }
        }
        else if (v10 >= v9 || v2 >= v10)
        {
          goto LABEL_15;
        }
        v6 = (v6 + 1) & v7;
      }
      while (((*(_QWORD *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8)) >> v6) & 1) != 0);
    }
    *(_QWORD *)(v4 + (((unint64_t)v2 >> 3) & 0x1FFFFFFFFFFFFFF8)) &= (-1 << v2) - 1;
    result = swift_release();
  }
  else
  {
    *(_QWORD *)(v4 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) &= (-1 << result) - 1;
  }
  v17 = *(_QWORD *)(v3 + 16);
  v18 = __OFSUB__(v17, 1);
  v19 = v17 - 1;
  if (v18)
  {
    __break(1u);
  }
  else
  {
    *(_QWORD *)(v3 + 16) = v19;
    ++*(_DWORD *)(v3 + 36);
  }
  return result;
}

uint64_t sub_1B25937C8(uint64_t a1, uint64_t a2)
{
  uint64_t *v2;
  uint64_t v5;
  uint64_t result;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  BOOL v12;
  _QWORD *v13;
  uint64_t v14;
  _QWORD *v15;
  _QWORD *v17;
  uint64_t v18;
  BOOL v19;
  uint64_t v20;

  v5 = *v2;
  sub_1B25CD6A8();
  sub_1B25CCAB4();
  result = sub_1B25CD6CC();
  v7 = -1 << *(_BYTE *)(v5 + 32);
  v8 = result & ~v7;
  v9 = v5 + 56;
  if (((*(_QWORD *)(v5 + 56 + ((v8 >> 3) & 0xFFFFFFFFFFFFF8)) >> v8) & 1) != 0)
  {
    v10 = *(_QWORD *)(v5 + 48);
    v11 = (_QWORD *)(v10 + 16 * v8);
    v12 = *v11 == a1 && v11[1] == a2;
    if (v12 || (result = sub_1B25CD5D0(), (result & 1) != 0))
    {
LABEL_7:
      v13 = (_QWORD *)(v10 + 16 * v8);
      result = swift_bridgeObjectRelease();
      *v13 = a1;
      v13[1] = a2;
      return result;
    }
    v14 = ~v7;
    while (1)
    {
      v8 = (v8 + 1) & v14;
      if (((*(_QWORD *)(v9 + ((v8 >> 3) & 0xFFFFFFFFFFFFF8)) >> v8) & 1) == 0)
        break;
      v15 = (_QWORD *)(v10 + 16 * v8);
      if (*v15 != a1 || v15[1] != a2)
      {
        result = sub_1B25CD5D0();
        if ((result & 1) == 0)
          continue;
      }
      goto LABEL_7;
    }
  }
  if (*(_QWORD *)(v5 + 16) >= *(_QWORD *)(v5 + 24))
  {
    __break(1u);
    goto LABEL_21;
  }
  *(_QWORD *)(v9 + ((v8 >> 3) & 0xFFFFFFFFFFFFFF8)) |= 1 << v8;
  v17 = (_QWORD *)(*(_QWORD *)(v5 + 48) + 16 * v8);
  *v17 = a1;
  v17[1] = a2;
  v18 = *(_QWORD *)(v5 + 16);
  v19 = __OFADD__(v18, 1);
  v20 = v18 + 1;
  if (v19)
  {
LABEL_21:
    __break(1u);
    return result;
  }
  *(_QWORD *)(v5 + 16) = v20;
  return result;
}

uint64_t sub_1B2593934()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t (*v6)(void);

  OUTLINED_FUNCTION_55();
  v1 = (_QWORD *)OUTLINED_FUNCTION_152_2();
  *(_QWORD *)(v0 + 16) = v1;
  v2 = OUTLINED_FUNCTION_27_10(v1, (uint64_t)sub_1B2501B24);
  return OUTLINED_FUNCTION_314(v2, v3, v4, v5, v6);
}

uint64_t sub_1B259397C()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t (*v6)(void);

  OUTLINED_FUNCTION_55();
  v1 = (_QWORD *)OUTLINED_FUNCTION_152_2();
  *(_QWORD *)(v0 + 16) = v1;
  v2 = OUTLINED_FUNCTION_27_10(v1, (uint64_t)sub_1B2501B24);
  return OUTLINED_FUNCTION_314(v2, v3, v4, v5, v6);
}

uint64_t objectdestroy_30Tm()
{
  OUTLINED_FUNCTION_140_0();
  swift_release();
  OUTLINED_FUNCTION_103_7();
  return swift_deallocObject();
}

uint64_t sub_1B25939E4()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t (*v4)(uint64_t);

  v1 = swift_task_alloc();
  v2 = (_QWORD *)OUTLINED_FUNCTION_42_4(v1);
  *v2 = v0;
  v2[1] = sub_1B2501B24;
  v3 = OUTLINED_FUNCTION_90_9();
  return v4(v3);
}

uint64_t sub_1B2593A50()
{
  OUTLINED_FUNCTION_193_2();
  return swift_deallocObject();
}

uint64_t sub_1B2593A70(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  int *v4;
  uint64_t v5;
  _QWORD *v6;

  v4 = *(int **)(v1 + 16);
  v5 = swift_task_alloc();
  v6 = (_QWORD *)OUTLINED_FUNCTION_42_4(v5);
  *v6 = v2;
  v6[1] = sub_1B24DE4C4;
  return ((uint64_t (*)(uint64_t, int *))((char *)&dword_1EEFDB1D8 + dword_1EEFDB1D8))(a1, v4);
}

uint64_t objectdestroy_26Tm()
{
  uint64_t v0;

  _Block_release(*(const void **)(v0 + 32));
  OUTLINED_FUNCTION_103_7();
  return swift_deallocObject();
}

uint64_t sub_1B2593B14()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t (*v6)(void);

  OUTLINED_FUNCTION_55();
  v1 = (_QWORD *)OUTLINED_FUNCTION_152_2();
  *(_QWORD *)(v0 + 16) = v1;
  v2 = OUTLINED_FUNCTION_27_10(v1, (uint64_t)sub_1B2501B24);
  return OUTLINED_FUNCTION_314(v2, v3, v4, v5, v6);
}

uint64_t sub_1B2593B58()
{
  uint64_t v0;

  _Block_release(*(const void **)(v0 + 16));
  return swift_deallocObject();
}

uint64_t sub_1B2593B7C(uint64_t a1)
{
  swift_unknownObjectRetain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_unknownObjectRetain();
  swift_unknownObjectRetain();
  return a1;
}

uint64_t sub_1B2593BF8(uint64_t a1)
{
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  return a1;
}

uint64_t sub_1B2593C74(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEFD8928);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 24))(a2, a1, v4);
  return a2;
}

uint64_t sub_1B2593CBC(void *a1)
{
  id v1;
  void *v2;
  uint64_t v3;

  v1 = objc_msgSend(a1, sel_taskForMemoryLock);
  if (!v1)
    return 0;
  v2 = v1;
  v3 = sub_1B25CCA18();

  return v3;
}

uint64_t sub_1B2593D1C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v7;
  _QWORD *v15;

  v15 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v7 + 16) = v15;
  *v15 = v7;
  v15[1] = sub_1B2501B24;
  return sub_1B258B758(a1, a2, a3, a4, a5, a6, a7);
}

uint64_t sub_1B2593DB4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v7;
  _QWORD *v15;

  v15 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v7 + 16) = v15;
  *v15 = v7;
  v15[1] = sub_1B2501B24;
  return sub_1B258BC84(a1, a2, a3, a4, a5, a6, a7);
}

uint64_t sub_1B2593E4C()
{
  return objectdestroy_63Tm();
}

uint64_t sub_1B2593E58()
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

  __swift_instantiateConcreteTypeFromMangledName(&qword_1EEFDB200);
  OUTLINED_FUNCTION_11_13();
  v0 = OUTLINED_FUNCTION_147_2();
  v1 = (_QWORD *)OUTLINED_FUNCTION_42_4(v0);
  v2 = OUTLINED_FUNCTION_15_10(v1);
  return OUTLINED_FUNCTION_19_11(v2, v3, v4, v5, v6, v7, v8, v9);
}

void sub_1B2593EB4()
{
  OUTLINED_FUNCTION_94_10();
  sub_1B258C970();
}

uint64_t block_copy_helper_9(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_9()
{
  return swift_release();
}

void sub_1B2593EF0()
{
  uint64_t v0;

  sub_1B258C834(*(_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 24));
}

void sub_1B2593EFC()
{
  OUTLINED_FUNCTION_94_10();
  sub_1B258C6DC();
}

uint64_t sub_1B2593F1C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v7;
  _QWORD *v15;

  v15 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v7 + 16) = v15;
  *v15 = v7;
  v15[1] = sub_1B2501B24;
  return sub_1B258C1B0(a1, a2, a3, a4, a5, a6, a7);
}

uint64_t sub_1B2593FB4()
{
  return objectdestroy_63Tm();
}

uint64_t sub_1B2593FC0()
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

  __swift_instantiateConcreteTypeFromMangledName(&qword_1EEFDB210);
  OUTLINED_FUNCTION_11_13();
  v0 = OUTLINED_FUNCTION_147_2();
  v1 = (_QWORD *)OUTLINED_FUNCTION_42_4(v0);
  v2 = OUTLINED_FUNCTION_15_10(v1);
  return OUTLINED_FUNCTION_19_11(v2, v3, v4, v5, v6, v7, v8, v9);
}

void sub_1B259401C()
{
  OUTLINED_FUNCTION_94_10();
  sub_1B258C970();
}

void sub_1B2594040()
{
  uint64_t v0;

  sub_1B258C8B0(*(_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 24));
}

void sub_1B259404C()
{
  OUTLINED_FUNCTION_94_10();
  sub_1B258C6DC();
}

uint64_t sub_1B259406C(uint64_t a1)
{
  uint64_t v2;
  uint64_t v4;

  v2 = *(_QWORD *)(a1 + 160);
  v4 = *(_QWORD *)(a1 + 424);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_1B25317F0(v2);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_1B25317F0(v4);
  swift_bridgeObjectRetain();
  return a1;
}

id sub_1B2594160(uint64_t a1)
{
  uint64_t v1;

  return sub_1B259227C(a1, *(_QWORD *)(v1 + 16));
}

uint64_t sub_1B2594168(uint64_t a1)
{
  uint64_t v1;

  return sub_1B2591E20(a1, *(_QWORD *)(v1 + 16));
}

id sub_1B2594170@<X0>(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v2;

  return sub_1B2591ED0(a1, *(_QWORD *)(v2 + 16), *(__int128 **)(v2 + 24), a2);
}

uint64_t sub_1B259418C()
{
  swift_unknownObjectWeakDestroy();
  return swift_deallocObject();
}

uint64_t sub_1B25941B0()
{
  return objectdestroy_63Tm();
}

uint64_t objectdestroy_63Tm()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;
  unint64_t v3;

  OUTLINED_FUNCTION_59_0();
  v2 = *(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(v1) - 8);
  v3 = (*(unsigned __int8 *)(v2 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  OUTLINED_FUNCTION_140_0();
  OUTLINED_FUNCTION_156(v0 + v3, *(uint64_t (**)(uint64_t, uint64_t))(v2 + 8));
  swift_release();
  swift_release();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_1B2594260()
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

  __swift_instantiateConcreteTypeFromMangledName(&qword_1EEFDB1F8);
  OUTLINED_FUNCTION_11_13();
  v0 = OUTLINED_FUNCTION_147_2();
  v1 = (_QWORD *)OUTLINED_FUNCTION_42_4(v0);
  v2 = OUTLINED_FUNCTION_15_10(v1);
  return OUTLINED_FUNCTION_19_11(v2, v3, v4, v5, v6, v7, v8, v9);
}

uint64_t objectdestroy_70Tm()
{
  uint64_t v0;

  OUTLINED_FUNCTION_162_2();
  OUTLINED_FUNCTION_193_2();

  return swift_deallocObject();
}

void sub_1B25942E8()
{
  OUTLINED_FUNCTION_94_10();
  sub_1B258C970();
}

uint64_t objectdestroy_76Tm()
{
  OUTLINED_FUNCTION_162_2();
  OUTLINED_FUNCTION_193_2();
  return swift_deallocObject();
}

void sub_1B2594330()
{
  uint64_t v0;

  sub_1B258C790(*(_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 24));
}

uint64_t objectdestroy_84Tm()
{
  uint64_t v0;

  OUTLINED_FUNCTION_162_2();
  OUTLINED_FUNCTION_193_2();

  return swift_deallocObject();
}

void sub_1B2594368()
{
  OUTLINED_FUNCTION_94_10();
  sub_1B258C6DC();
}

void sub_1B2594388(uint64_t a1, uint64_t a2, uint64_t (*a3)(_QWORD))
{
  uint64_t v3;

  v3 = a3(0);
  OUTLINED_FUNCTION_73_10(v3);
  OUTLINED_FUNCTION_0();
}

void sub_1B25943B4(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v3;

  v3 = __swift_instantiateConcreteTypeFromMangledName(a3);
  OUTLINED_FUNCTION_73_10(v3);
  OUTLINED_FUNCTION_0();
}

uint64_t sub_1B25943E0()
{
  id *v0;

  OUTLINED_FUNCTION_140_0();
  swift_bridgeObjectRelease();

  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();

  swift_release();
  return swift_deallocObject();
}

uint64_t sub_1B2594448(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD *v12;

  v4 = v1[2];
  v5 = v1[3];
  v6 = v1[4];
  v7 = v1[5];
  v8 = v1[6];
  v9 = v1[7];
  v10 = v1[8];
  v11 = swift_task_alloc();
  v12 = (_QWORD *)OUTLINED_FUNCTION_42_4(v11);
  *v12 = v2;
  v12[1] = sub_1B2501B24;
  return sub_1B259012C(a1, v4, v5, v6, v7, v8, v9, v10);
}

uint64_t sub_1B2594514(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for CommandRecognizer.Interpretation(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

id sub_1B2594558@<X0>(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  return sub_1B2594170(a1, a2);
}

uint64_t OUTLINED_FUNCTION_4_16()
{
  uint64_t v0;

  return v0 + 56;
}

void OUTLINED_FUNCTION_7_15()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(v0 + 16) = *(_QWORD *)(v1 + 16);
}

uint64_t OUTLINED_FUNCTION_9_16()
{
  _QWORD *v0;

  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(v0[55] + 16))(v0[56], v0[50], v0[54]);
}

uint64_t OUTLINED_FUNCTION_12_16(uint64_t a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *v2;
  *(_QWORD *)(v3 - 8) = *v2;
  *(_QWORD *)(v3 - 8) = *v2;
  *(_QWORD *)(v4 + 40) = a1;
  *(_QWORD *)(v4 + 48) = v1;
  return swift_task_dealloc();
}

void OUTLINED_FUNCTION_13_13()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(v0 + 16) = *(_QWORD *)(v1 + 16);
}

uint64_t OUTLINED_FUNCTION_15_10(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  *a1 = v3;
  a1[1] = v1;
  return v2;
}

uint64_t OUTLINED_FUNCTION_17_15()
{
  return sub_1B25CD294();
}

uint64_t OUTLINED_FUNCTION_19_11(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t (*a8)(void))
{
  return a8();
}

uint64_t OUTLINED_FUNCTION_20_14(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  *(_QWORD *)(v2 + 496) = a1;
  *a1 = v2;
  a1[1] = v1;
  return v3;
}

uint64_t OUTLINED_FUNCTION_21_14()
{
  return swift_unknownObjectWeakInit();
}

uint64_t OUTLINED_FUNCTION_27_10@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v3;

  *a1 = v3;
  a1[1] = a2;
  return v2;
}

uint64_t OUTLINED_FUNCTION_30_12(_QWORD *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  uint64_t v10;
  uint64_t v11;

  *a1 = v11;
  a1[1] = v10;
  return a10;
}

uint64_t OUTLINED_FUNCTION_32_17()
{
  _QWORD *v0;

  return (*(uint64_t (**)(_QWORD, _QWORD))(v0[58] + 8))(v0[59], v0[57]);
}

void *OUTLINED_FUNCTION_33_11@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  const void *v2;

  return memmove(a1, v2, 8 * a2);
}

uint64_t OUTLINED_FUNCTION_39_10()
{
  return swift_task_dealloc();
}

uint64_t OUTLINED_FUNCTION_40_8()
{
  _QWORD *v0;

  return (*(uint64_t (**)(_QWORD, _QWORD))(v0[58] + 8))(v0[59], v0[57]);
}

uint64_t OUTLINED_FUNCTION_48_11()
{
  return swift_unknownObjectWeakInit();
}

uint64_t OUTLINED_FUNCTION_49_13()
{
  return sub_1B25CCDB4();
}

void OUTLINED_FUNCTION_63_12()
{
  JUMPOUT(0x1B5E26380);
}

id OUTLINED_FUNCTION_64_14()
{
  void *v0;

  return v0;
}

void OUTLINED_FUNCTION_65_9()
{
  JUMPOUT(0x1B5E26380);
}

uint64_t OUTLINED_FUNCTION_66_5()
{
  return swift_allocError();
}

uint64_t OUTLINED_FUNCTION_67_12()
{
  return swift_unknownObjectWeakInit();
}

uint64_t OUTLINED_FUNCTION_68_11()
{
  return swift_unknownObjectWeakInit();
}

uint64_t OUTLINED_FUNCTION_69_11()
{
  return swift_unknownObjectWeakInit();
}

void OUTLINED_FUNCTION_71_12()
{
  uint64_t v0;

  *(_QWORD *)(v0 + 384) = *(_QWORD *)(v0 + 376);
}

uint64_t OUTLINED_FUNCTION_72_12()
{
  uint64_t v0;

  *(_QWORD *)(v0 - 112) = 0;
  *(_QWORD *)(v0 - 104) = 0;
  *(_QWORD *)(v0 - 96) = 0;
  *(_WORD *)(v0 - 88) = 256;
  return type metadata accessor for EndpointDetector();
}

uint64_t OUTLINED_FUNCTION_73_10(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(a1 - 8) + 16))(v1, v2, a1);
}

void OUTLINED_FUNCTION_74_9()
{
  JUMPOUT(0x1B5E26380);
}

void OUTLINED_FUNCTION_75_13()
{
  JUMPOUT(0x1B5E26380);
}

uint64_t OUTLINED_FUNCTION_82_9()
{
  return sub_1B252488C();
}

void *OUTLINED_FUNCTION_83_5@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  const void *v2;
  uint64_t v3;

  *(_QWORD *)(v3 + 128) = a1;
  *(_QWORD *)(v3 + 136) = v1;
  return _Block_copy(v2);
}

id OUTLINED_FUNCTION_84_9(uint64_t a1, const char *a2)
{
  uint64_t v2;
  void *v3;

  return objc_msgSend(v3, a2, v2);
}

id OUTLINED_FUNCTION_86_6(uint64_t a1, const char *a2)
{
  void *v2;
  uint64_t v3;

  return objc_msgSend(v2, a2, v3);
}

void *OUTLINED_FUNCTION_87_8@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  const void *v2;
  uint64_t v3;

  *(_QWORD *)(v3 + 80) = a1;
  *(_QWORD *)(v3 + 88) = v1;
  return _Block_copy(v2);
}

id OUTLINED_FUNCTION_88_7()
{
  void *v0;

  return v0;
}

uint64_t OUTLINED_FUNCTION_90_9()
{
  uint64_t v0;

  return v0;
}

id OUTLINED_FUNCTION_91_8(uint64_t a1, const char *a2)
{
  void *v2;
  uint64_t v3;

  return objc_msgSend(v2, a2, v3);
}

void OUTLINED_FUNCTION_92_8()
{
  void *v0;

}

uint64_t OUTLINED_FUNCTION_93_8()
{
  return swift_release();
}

uint64_t OUTLINED_FUNCTION_94_10()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + 16);
}

uint64_t OUTLINED_FUNCTION_95_8()
{
  return swift_release();
}

uint64_t OUTLINED_FUNCTION_96_8()
{
  return sub_1B25CD5A0();
}

void OUTLINED_FUNCTION_97_7()
{
  JUMPOUT(0x1B5E26380);
}

uint64_t OUTLINED_FUNCTION_98_7()
{
  return 0;
}

uint64_t OUTLINED_FUNCTION_99_7()
{
  return 0;
}

void OUTLINED_FUNCTION_102_5(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v2 + 24) = *(_QWORD *)(a1 + v1);
}

uint64_t OUTLINED_FUNCTION_103_7()
{
  uint64_t v0;

  return v0;
}

uint64_t OUTLINED_FUNCTION_109_7()
{
  uint64_t v0;

  return EndpointDetector.init(taskHint:detectionOptions:)((unsigned __int8 *)(v0 - 81), (__int128 *)(v0 - 112));
}

void OUTLINED_FUNCTION_110_2(uint64_t a1, _QWORD *a2)
{
  _QWORD *v2;

  *a2 = *v2;
}

uint64_t OUTLINED_FUNCTION_118_5()
{
  return sub_1B25CC370();
}

uint64_t OUTLINED_FUNCTION_119_3()
{
  return swift_release();
}

uint64_t OUTLINED_FUNCTION_121_4()
{
  return sub_1B25CC4CC();
}

uint64_t OUTLINED_FUNCTION_124_5()
{
  return swift_unknownObjectWeakInit();
}

uint64_t OUTLINED_FUNCTION_131_4()
{
  void *v0;
  uint64_t v1;

  return sub_1B258FA50((unsigned __int8 *)(v1 - 112), v0);
}

void *OUTLINED_FUNCTION_132_2@<X0>(const void *aBlock@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v3;

  *(_QWORD *)(v3 + 32) = a2;
  *(_QWORD *)(v3 + 40) = v2;
  return _Block_copy(aBlock);
}

void OUTLINED_FUNCTION_133_4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(*(_QWORD *)(v1 + 48) + 8 * v0) = *(_QWORD *)(*(_QWORD *)(v2 + 48) + 8 * v0);
}

void OUTLINED_FUNCTION_134_3()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  *(_BYTE *)(*(_QWORD *)(v1 + 48) + v0) = *(_BYTE *)(*(_QWORD *)(v2 + 48) + v0);
}

void OUTLINED_FUNCTION_136_3()
{
  JUMPOUT(0x1B5E26380);
}

void OUTLINED_FUNCTION_137_3()
{
  const void *v0;

  _Block_release(v0);
}

uint64_t OUTLINED_FUNCTION_147_2()
{
  return swift_task_alloc();
}

void OUTLINED_FUNCTION_148_3()
{
  const void *v0;

  _Block_release(v0);
}

void OUTLINED_FUNCTION_149_0()
{
  JUMPOUT(0x1B5E26380);
}

void OUTLINED_FUNCTION_150_2()
{
  JUMPOUT(0x1B5E26380);
}

uint64_t OUTLINED_FUNCTION_152_2()
{
  return swift_task_alloc();
}

uint64_t OUTLINED_FUNCTION_153_2()
{
  return _swift_stdlib_reportUnimplementedInitializer();
}

uint64_t OUTLINED_FUNCTION_154_4()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_156_2()
{
  return sub_1B25CCB98();
}

id sub_1B2594C10(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, double a6)
{
  id v12;
  _QWORD v14[2];
  char v15;
  double v16;
  char v17;
  uint64_t v18;
  char v19;
  uint64_t v20;
  uint64_t v21;

  swift_getObjectType();
  v14[0] = a1;
  v14[1] = a2;
  v15 = 1;
  v16 = a6;
  v17 = 0;
  v18 = a3;
  v19 = 0;
  v20 = a4;
  v21 = a5;
  v12 = sub_1B2594CB8((uint64_t)v14);
  OUTLINED_FUNCTION_0_8();
  return v12;
}

id sub_1B2594CB8(uint64_t a1)
{
  char *v2;
  uint64_t v3;
  char v4;
  uint64_t v5;
  char v6;
  uint64_t v7;
  char v8;
  char *v9;
  objc_super v11;

  v2 = (char *)objc_allocWithZone((Class)SFContextualNamedEntity);
  v3 = *(_QWORD *)(a1 + 8);
  v4 = *(_BYTE *)(a1 + 16);
  v5 = *(_QWORD *)(a1 + 24);
  v6 = *(_BYTE *)(a1 + 32);
  v7 = *(_QWORD *)(a1 + 40);
  v8 = *(_BYTE *)(a1 + 48);
  v9 = &v2[OBJC_IVAR___SFContextualNamedEntity_contextualNamedEntity];
  *(_QWORD *)v9 = *(_QWORD *)a1;
  *((_QWORD *)v9 + 1) = v3;
  v9[16] = v4;
  *((_QWORD *)v9 + 3) = v5;
  v9[32] = v6;
  *((_QWORD *)v9 + 5) = v7;
  v9[48] = v8;
  *(_OWORD *)(v9 + 56) = *(_OWORD *)(a1 + 56);
  v11.receiver = v2;
  v11.super_class = (Class)SFContextualNamedEntity;
  return objc_msgSendSuper2(&v11, sel_init);
}

id sub_1B2594DF0(uint64_t a1, uint64_t a2)
{
  id v4;
  _QWORD v6[2];
  char v7;
  uint64_t v8;
  char v9;
  uint64_t v10;
  char v11;
  uint64_t v12;
  uint64_t v13;

  swift_getObjectType();
  v6[0] = a1;
  v6[1] = a2;
  v7 = 2;
  v8 = 0;
  v9 = 1;
  v10 = 0;
  v11 = 1;
  v12 = 0;
  v13 = 0;
  v4 = sub_1B2594CB8((uint64_t)v6);
  OUTLINED_FUNCTION_0_8();
  return v4;
}

void __swiftcall SFContextualNamedEntity.init()(SFContextualNamedEntity *__return_ptr retstr)
{
  objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_init);
}

void SFContextualNamedEntity.init()()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

unint64_t type metadata accessor for SFContextualNamedEntity()
{
  unint64_t result;

  result = qword_1EEFDB358;
  if (!qword_1EEFDB358)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_1EEFDB358);
  }
  return result;
}

uint64_t OUTLINED_FUNCTION_0_8()
{
  return swift_deallocPartialClassInstance();
}

uint64_t related decl 'e' for SFSpeechErrorCode.init(_:description:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t inited;
  uint64_t v6;
  uint64_t v8;

  type metadata accessor for SFSpeechError(0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EEFD9608);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_1B25DB5B0;
  *(_QWORD *)(inited + 32) = sub_1B25CCA18();
  *(_QWORD *)(inited + 40) = v6;
  *(_QWORD *)(inited + 72) = MEMORY[0x1E0DEA968];
  *(_QWORD *)(inited + 48) = a2;
  *(_QWORD *)(inited + 56) = a3;
  sub_1B25CC904();
  sub_1B2595010();
  sub_1B25CC4B4();
  return v8;
}

unint64_t sub_1B2595010()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1EEFD8220;
  if (!qword_1EEFD8220)
  {
    type metadata accessor for SFSpeechError(255);
    result = MEMORY[0x1B5E261DC](&unk_1B25DAA04, v1);
    atomic_store(result, (unint64_t *)&qword_1EEFD8220);
  }
  return result;
}

uint64_t static SFSpeechErrorCode.incompatibleAudioFormats.getter()
{
  return 5;
}

uint64_t static SFSpeechErrorCode.audioDisordered.getter()
{
  return 2;
}

uint64_t static SFSpeechErrorCode.unexpectedAudioFormat.getter()
{
  return 3;
}

uint64_t static SFSpeechErrorCode.noModel.getter()
{
  return 4;
}

id sub_1B2595090()
{
  uint64_t ObjCClassFromMetadata;
  id result;

  type metadata accessor for SpeechAnalyzer();
  ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  result = objc_msgSend((id)objc_opt_self(), sel_bundleForClass_, ObjCClassFromMetadata);
  qword_1EEFDB360 = (uint64_t)result;
  return result;
}

id static NSBundle.speech.getter()
{
  if (qword_1EEFD8028 != -1)
    swift_once();
  return (id)qword_1EEFDB360;
}

uint64_t static SFSpeechErrorCode.invalidJitProfile.getter()
{
  return 6;
}

uint64_t static SFSpeechErrorCode.moduleOutputFailed.getter()
{
  return 9;
}

uint64_t sub_1B2595144(void *a1, void *a2, char a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v9;
  uint64_t v10;

  v9 = sub_1B24A1B80(a1, a2, a3, a4);
  v10 = v9;
  if (!v4 && !v9)
  {
    type metadata accessor for EAREuclid();
    v10 = swift_distributedActor_remote_initialize();
    *(_QWORD *)(v10 + 112) = a1;
    *(_QWORD *)(v10 + 120) = a2;
    *(_BYTE *)(v10 + 128) = a3;
    *(_QWORD *)(v10 + 136) = a4;
    sub_1B24A1AF4(a1, a2, a3);
    OUTLINED_FUNCTION_289();
  }
  return v10;
}

void sub_1B25951C4(uint64_t a1, void *a2, void *a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  unint64_t v12;
  char v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
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
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  unint64_t v37;
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
  void *v54;
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
  void *v72;
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
  __int128 v85;
  uint64_t v86;
  uint64_t v87;
  __int128 v88;
  uint64_t v89;
  uint64_t v90;
  __int128 aBlock;
  uint64_t v92;
  uint64_t v93;
  void *v94;
  uint64_t v95;

  v12 = 0xD00000000000001FLL;
  if (a1 == 0xD000000000000018 && (OUTLINED_FUNCTION_18_14(), v13) || (OUTLINED_FUNCTION_58_2() & 1) != 0)
  {
    objc_msgSend(a3, sel_hello);
    return;
  }
  if (a1 == 0xD000000000000040 && (OUTLINED_FUNCTION_18_14(), v13)
    || (v14 = OUTLINED_FUNCTION_58_2(), (v14 & 1) != 0))
  {
    v20 = *(_QWORD *)(a4 + 16);
    if (v20)
    {
      v21 = OUTLINED_FUNCTION_51_10(v14, v15, v16, v17, v18, v19);
      if (!v90)
      {
        __break(1u);
        goto LABEL_68;
      }
      OUTLINED_FUNCTION_42_14(v21, v22, v23, v24, v25, v26, v27, v28, v79, v82, v85, *((uint64_t *)&v85 + 1), v86, v87, v88, v89, v90, aBlock);
      v12 = MEMORY[0x1E0DEE9B8];
      OUTLINED_FUNCTION_30_13();
      OUTLINED_FUNCTION_62_12();
      OUTLINED_FUNCTION_49_14();
      if (v20 >= 2)
      {
        sub_1B251AC38(a4 + 64, (uint64_t)&v85);
        if (v87)
        {
          sub_1B24AB608(&v85, &v88);
          swift_dynamicCast();
          if (a5)
          {
            v29 = OUTLINED_FUNCTION_79();
            *(_QWORD *)(v29 + 16) = a5;
            *(_QWORD *)(v29 + 24) = a6;
            v94 = sub_1B2597AE8;
            v95 = v29;
            OUTLINED_FUNCTION_19_12((uint64_t)sub_1B259798C, v79, v82, v85, *((uint64_t *)&v85 + 1), v86, v87, v88, *((uint64_t *)&v88 + 1), v89, v90, MEMORY[0x1E0C809B0], 1107296256, v92, v93);
            OUTLINED_FUNCTION_289();
            v30 = swift_release();
            OUTLINED_FUNCTION_52_13(v30, sel_findNearestNeighbors_numberOfNeighbors_reply_);

LABEL_14:
            OUTLINED_FUNCTION_93();
            return;
          }
          goto LABEL_69;
        }
LABEL_68:
        __break(1u);
LABEL_69:
        __break(1u);
        goto LABEL_70;
      }
    }
    else
    {
      __break(1u);
    }
    __break(1u);
    goto LABEL_49;
  }
  if (a1 == 0xD000000000000030 && (OUTLINED_FUNCTION_18_14(), v13)
    || (v31 = OUTLINED_FUNCTION_58_2(), (v31 & 1) != 0))
  {
    v37 = *(_QWORD *)(a4 + 16);
    if (v37)
    {
      v38 = OUTLINED_FUNCTION_51_10(v31, v32, v33, v34, v35, v36);
      if (!v90)
      {
LABEL_70:
        __break(1u);
        goto LABEL_71;
      }
      OUTLINED_FUNCTION_42_14(v38, v39, v40, v41, v42, v43, v44, v45, v79, v82, v85, *((uint64_t *)&v85 + 1), v86, v87, v88, v89, v90, aBlock);
      v12 = MEMORY[0x1E0DEE9B8];
      OUTLINED_FUNCTION_30_13();
      OUTLINED_FUNCTION_62_12();
      OUTLINED_FUNCTION_49_14();
      if (v37 >= 2)
      {
        v46 = sub_1B251AC38(a4 + 64, (uint64_t)&v88);
        if (v90)
        {
          OUTLINED_FUNCTION_42_14(v46, v47, v48, v49, v50, v51, v52, v53, v79, v82, v85, *((uint64_t *)&v85 + 1), v86, v87, v88, v89, v90, aBlock);
          OUTLINED_FUNCTION_30_13();
          v54 = (void *)sub_1B25CCA0C();
          OUTLINED_FUNCTION_107();
          if (a5)
          {
            v55 = OUTLINED_FUNCTION_79();
            *(_QWORD *)(v55 + 16) = a5;
            *(_QWORD *)(v55 + 24) = a6;
            v94 = sub_1B2597B7C;
            v95 = v55;
            OUTLINED_FUNCTION_19_12((uint64_t)sub_1B24A1930, v80, v83, v85, *((uint64_t *)&v85 + 1), v86, v87, v88, *((uint64_t *)&v88 + 1), v89, v90, MEMORY[0x1E0C809B0], 1107296256, v92, v93);
            OUTLINED_FUNCTION_289();
            v56 = swift_release();
            OUTLINED_FUNCTION_52_13(v56, sel_distanceBetweenSource_target_reply_);
            OUTLINED_FUNCTION_93();

            return;
          }
          goto LABEL_72;
        }
LABEL_71:
        __break(1u);
LABEL_72:
        __break(1u);
        goto LABEL_73;
      }
    }
    else
    {
      __break(1u);
    }
    __break(1u);
    goto LABEL_56;
  }
  if (a1 != 0xD00000000000002CLL || (OUTLINED_FUNCTION_18_14(), !v13))
  {
    v57 = OUTLINED_FUNCTION_58_2();
    if ((v57 & 1) == 0)
    {
      if (a1 == 0xD000000000000021 && (OUTLINED_FUNCTION_18_14(), v13) || (OUTLINED_FUNCTION_58_2() & 1) != 0)
      {
        if (a5)
        {
          v73 = OUTLINED_FUNCTION_79();
          *(_QWORD *)(v73 + 16) = a5;
          *(_QWORD *)(v73 + 24) = a6;
          v94 = sub_1B2597B7C;
          v95 = v73;
          OUTLINED_FUNCTION_19_12((uint64_t)sub_1B24A1930, v79, v82, v85, *((uint64_t *)&v85 + 1), v86, v87, v88, *((uint64_t *)&v88 + 1), v89, v90, MEMORY[0x1E0C809B0], 1107296256, v92, v93);
          OUTLINED_FUNCTION_21_15();
          OUTLINED_FUNCTION_144();
          objc_msgSend(a3, sel_maxInputLengthWithReply_, a5);
          goto LABEL_14;
        }
        goto LABEL_75;
      }
      if (a1 == 0xD00000000000001FLL && (OUTLINED_FUNCTION_18_14(), v13) || (OUTLINED_FUNCTION_58_2() & 1) != 0)
      {
        if (a5)
        {
          v74 = OUTLINED_FUNCTION_79();
          *(_QWORD *)(v74 + 16) = a5;
          *(_QWORD *)(v74 + 24) = a6;
          v94 = sub_1B2597A60;
          v95 = v74;
          OUTLINED_FUNCTION_19_12((uint64_t)sub_1B24A1930, v79, v82, v85, *((uint64_t *)&v85 + 1), v86, v87, v88, *((uint64_t *)&v88 + 1), v89, v90, MEMORY[0x1E0C809B0], 1107296256, v92, v93);
          OUTLINED_FUNCTION_21_15();
          OUTLINED_FUNCTION_144();
          objc_msgSend(a3, sel_embeddingDimWithReply_, a5);
          goto LABEL_14;
        }
        goto LABEL_76;
      }
      if (a1 == 0xD00000000000001ELL && (OUTLINED_FUNCTION_18_14(), v13) || (OUTLINED_FUNCTION_58_2() & 1) != 0)
      {
        if (a5)
        {
          v75 = OUTLINED_FUNCTION_79();
          *(_QWORD *)(v75 + 16) = a5;
          *(_QWORD *)(v75 + 24) = a6;
          v94 = sub_1B2597B74;
          v95 = v75;
          OUTLINED_FUNCTION_19_12((uint64_t)sub_1B24A1698, v79, v82, v85, *((uint64_t *)&v85 + 1), v86, v87, v88, *((uint64_t *)&v88 + 1), v89, v90, MEMORY[0x1E0C809B0], 1107296256, v92, v93);
          OUTLINED_FUNCTION_21_15();
          OUTLINED_FUNCTION_144();
          objc_msgSend(a3, sel_fullVersionWithReply_, a5);
          goto LABEL_14;
        }
        goto LABEL_77;
      }
LABEL_49:
      if (a1 == v12 && (OUTLINED_FUNCTION_18_14(), v13) || (OUTLINED_FUNCTION_58_2() & 1) != 0)
      {
        if (a5)
        {
          v76 = OUTLINED_FUNCTION_79();
          *(_QWORD *)(v76 + 16) = a5;
          *(_QWORD *)(v76 + 24) = a6;
          v94 = sub_1B2597B74;
          v95 = v76;
          OUTLINED_FUNCTION_19_12((uint64_t)sub_1B24A1698, v79, v82, v85, *((uint64_t *)&v85 + 1), v86, v87, v88, *((uint64_t *)&v88 + 1), v89, v90, MEMORY[0x1E0C809B0], 1107296256, v92, v93);
          OUTLINED_FUNCTION_21_15();
          OUTLINED_FUNCTION_144();
          objc_msgSend(a3, sel_majorVersionWithReply_, a5);
          goto LABEL_14;
        }
        goto LABEL_78;
      }
LABEL_56:
      if (a1 == v12 && (OUTLINED_FUNCTION_18_14(), v13) || (OUTLINED_FUNCTION_58_2() & 1) != 0)
      {
        if (a5)
        {
          v77 = OUTLINED_FUNCTION_79();
          *(_QWORD *)(v77 + 16) = a5;
          *(_QWORD *)(v77 + 24) = a6;
          v94 = sub_1B2597B74;
          v95 = v77;
          OUTLINED_FUNCTION_19_12((uint64_t)sub_1B24A1698, v79, v82, v85, *((uint64_t *)&v85 + 1), v86, v87, v88, *((uint64_t *)&v88 + 1), v89, v90, MEMORY[0x1E0C809B0], 1107296256, v92, v93);
          OUTLINED_FUNCTION_21_15();
          OUTLINED_FUNCTION_144();
          objc_msgSend(a3, sel_minorVersionWithReply_, a5);
          goto LABEL_14;
        }
        goto LABEL_79;
      }
      goto LABEL_62;
    }
  }
  if (*(_QWORD *)(a4 + 16))
  {
    v63 = OUTLINED_FUNCTION_51_10(v57, v58, v59, v60, v61, v62);
    if (v90)
    {
      OUTLINED_FUNCTION_42_14(v63, v64, v65, v66, v67, v68, v69, v70, v79, v82, v85, *((uint64_t *)&v85 + 1), v86, v87, v88, v89, v90, aBlock);
      __swift_instantiateConcreteTypeFromMangledName(&qword_1ED36CFD0);
      OUTLINED_FUNCTION_30_13();
      sub_1B25CCB98();
      OUTLINED_FUNCTION_49_14();
      if (a5)
      {
        v71 = OUTLINED_FUNCTION_79();
        *(_QWORD *)(v71 + 16) = a5;
        *(_QWORD *)(v71 + 24) = a6;
        v94 = sub_1B2597AC8;
        v95 = v71;
        v72 = OUTLINED_FUNCTION_19_12((uint64_t)sub_1B2597A68, v81, v84, v85, *((uint64_t *)&v85 + 1), v86, v87, v88, *((uint64_t *)&v88 + 1), v89, v90, MEMORY[0x1E0C809B0], 1107296256, v92, v93);
        OUTLINED_FUNCTION_289();
        swift_release();
        objc_msgSend(a3, sel_computeEmbeddings_reply_, a2, v72);
        OUTLINED_FUNCTION_93();

        return;
      }
      goto LABEL_74;
    }
LABEL_73:
    __break(1u);
LABEL_74:
    __break(1u);
LABEL_75:
    __break(1u);
LABEL_76:
    __break(1u);
LABEL_77:
    __break(1u);
LABEL_78:
    __break(1u);
LABEL_79:
    __break(1u);
    goto LABEL_80;
  }
  __break(1u);
LABEL_62:
  if (a1 == v12 && (OUTLINED_FUNCTION_18_14(), v13) || (OUTLINED_FUNCTION_58_2() & 1) != 0)
  {
    if (a5)
    {
      v78 = OUTLINED_FUNCTION_79();
      *(_QWORD *)(v78 + 16) = a5;
      *(_QWORD *)(v78 + 24) = a6;
      v94 = sub_1B24AB6D4;
      v95 = v78;
      OUTLINED_FUNCTION_19_12((uint64_t)sub_1B24A1698, v79, v82, v85, *((uint64_t *)&v85 + 1), v86, v87, v88, *((uint64_t *)&v88 + 1), v89, v90, MEMORY[0x1E0C809B0], 1107296256, v92, v93);
      OUTLINED_FUNCTION_21_15();
      OUTLINED_FUNCTION_144();
      objc_msgSend(a3, sel_patchVersionWithReply_, a5);
      goto LABEL_14;
    }
LABEL_80:
    __break(1u);
  }
}

uint64_t sub_1B259595C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v4[8] = a3;
  v4[9] = v3;
  v4[6] = a1;
  v4[7] = a2;
  v5 = OUTLINED_FUNCTION_61();
  v4[10] = v5;
  v4[11] = *(_QWORD *)(v5 - 8);
  v4[12] = OUTLINED_FUNCTION_7_0();
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEFD8520);
  v4[13] = v6;
  v4[14] = *(_QWORD *)(v6 - 8);
  v4[15] = OUTLINED_FUNCTION_7_0();
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED36CF30);
  v4[16] = v7;
  v4[17] = *(_QWORD *)(v7 - 8);
  v4[18] = OUTLINED_FUNCTION_7_0();
  OUTLINED_FUNCTION_17();
  return OUTLINED_FUNCTION_8();
}

uint64_t sub_1B25959E4()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t (*v8)(void);
  _QWORD *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t (*v14)(void);

  if ((swift_distributed_actor_is_remote() & 1) == 0)
    return OUTLINED_FUNCTION_15();
  v1 = v0[18];
  v3 = v0[6];
  v2 = v0[7];
  v4 = OUTLINED_FUNCTION_35_11();
  v0[2] = v3;
  v0[3] = v2;
  v0[4] = v4;
  OUTLINED_FUNCTION_168();
  OUTLINED_FUNCTION_63_13();
  OUTLINED_FUNCTION_99();
  OUTLINED_FUNCTION_126();
  if (v1)
  {
    (*(void (**)(_QWORD, _QWORD))(v0[17] + 8))(v0[18], v0[16]);
    swift_bridgeObjectRelease();
    swift_task_dealloc();
    OUTLINED_FUNCTION_36();
    OUTLINED_FUNCTION_48();
    v8 = (uint64_t (*)(void))OUTLINED_FUNCTION_22();
    return OUTLINED_FUNCTION_23(v8);
  }
  else
  {
    v5 = v0[15];
    v0[5] = v0[8];
    sub_1B25CC7F0();
    sub_1B2498D6C(v5);
    nullsub_1(v6, v7);
    OUTLINED_FUNCTION_67();
    OUTLINED_FUNCTION_82();
    sub_1B25CC7E4();
    v10 = (_QWORD *)OUTLINED_FUNCTION_39();
    v0[19] = v10;
    *v10 = v0;
    v10[1] = sub_1B2595BB4;
    v11 = OUTLINED_FUNCTION_41(v0[9]);
    return OUTLINED_FUNCTION_16(v11, v12, v13, v14);
  }
}

uint64_t sub_1B2595BB4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  OUTLINED_FUNCTION_13_7();
  if (!v1)
    *(_QWORD *)(v2 + 168) = v0;
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_17();
  return OUTLINED_FUNCTION_31();
}

uint64_t sub_1B2595C08()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v1 = *(_QWORD *)(v0 + 136);
  v2 = *(_QWORD *)(v0 + 112);
  (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 88) + 8))(*(_QWORD *)(v0 + 96), *(_QWORD *)(v0 + 80));
  OUTLINED_FUNCTION_164_0(*(uint64_t (**)(uint64_t, uint64_t))(v2 + 8));
  OUTLINED_FUNCTION_41_15(*(uint64_t (**)(uint64_t, uint64_t))(v1 + 8));
  OUTLINED_FUNCTION_36();
  OUTLINED_FUNCTION_95();
  swift_task_dealloc();
  return (*(uint64_t (**)(_QWORD))(v0 + 8))(*(_QWORD *)(v0 + 168));
}

void sub_1B2595C90()
{
  sub_1B2596E8C();
}

uint64_t sub_1B2595CA8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v1 = *(_QWORD *)(v0 + 136);
  v2 = *(_QWORD *)(v0 + 112);
  OUTLINED_FUNCTION_30(*(_QWORD *)(v0 + 88));
  OUTLINED_FUNCTION_164_0(*(uint64_t (**)(uint64_t, uint64_t))(v2 + 8));
  OUTLINED_FUNCTION_41_15(*(uint64_t (**)(uint64_t, uint64_t))(v1 + 8));
  swift_task_dealloc();
  OUTLINED_FUNCTION_48();
  OUTLINED_FUNCTION_95();
  return OUTLINED_FUNCTION_68(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_1B2595D20(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  _QWORD *v3;
  uint64_t v5;
  uint64_t *v6;
  uint64_t result;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  _QWORD *v13;

  v3[2] = a3;
  v5 = *a2;
  v3[3] = *a2;
  v3[4] = *(_QWORD *)(v5 - 8);
  v6 = (uint64_t *)swift_task_alloc();
  v3[5] = v6;
  result = swift_conformsToProtocol();
  if (result)
  {
    sub_1B2550EE0();
    v8 = *v6;
    v9 = v6[1];
    v10 = a2[1];
    v3[6] = v10;
    v3[7] = *(_QWORD *)(v10 - 8);
    v11 = (uint64_t *)swift_task_alloc();
    v3[8] = v11;
    result = swift_conformsToProtocol();
    if (result)
    {
      sub_1B2550EE0();
      v12 = *v11;
      v13 = (_QWORD *)swift_task_alloc();
      v3[9] = v13;
      *v13 = v3;
      v13[1] = sub_1B2595EA4;
      return sub_1B259595C(v8, v9, v12);
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
  return result;
}

uint64_t sub_1B2595EA4(uint64_t a1)
{
  uint64_t (**v1)(void);
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v2 = *((_QWORD *)*v1 + 7);
  v4 = *((_QWORD *)*v1 + 4);
  v3 = *((_QWORD *)*v1 + 5);
  v5 = *((_QWORD *)*v1 + 3);
  OUTLINED_FUNCTION_15_2(a1);
  (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v3, v5);
  OUTLINED_FUNCTION_257(*(uint64_t (**)(uint64_t, uint64_t))(v2 + 8));
  OUTLINED_FUNCTION_48();
  swift_task_dealloc();
  return OUTLINED_FUNCTION_23(v1[1]);
}

uint64_t sub_1B2595F20(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;

  v5[10] = a4;
  v5[11] = v4;
  v5[8] = a2;
  v5[9] = a3;
  v5[7] = a1;
  v6 = OUTLINED_FUNCTION_61();
  v5[12] = v6;
  v5[13] = *(_QWORD *)(v6 - 8);
  v5[14] = OUTLINED_FUNCTION_7_0();
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED36CF30);
  v5[15] = v7;
  v5[16] = *(_QWORD *)(v7 - 8);
  v5[17] = swift_task_alloc();
  v5[18] = swift_task_alloc();
  OUTLINED_FUNCTION_17();
  return OUTLINED_FUNCTION_8();
}

uint64_t sub_1B2595FA8()
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
  uint64_t (*v9)(void);
  _QWORD *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t (*v15)(void);

  if ((swift_distributed_actor_is_remote() & 1) == 0)
    return OUTLINED_FUNCTION_15();
  v1 = v0[18];
  v3 = v0[7];
  v2 = v0[8];
  v4 = OUTLINED_FUNCTION_35_11();
  v0[2] = v3;
  v0[6] = v4;
  v0[3] = v2;
  OUTLINED_FUNCTION_168();
  OUTLINED_FUNCTION_99();
  OUTLINED_FUNCTION_126();
  if (v1)
  {
    OUTLINED_FUNCTION_30(v0[16]);
    swift_bridgeObjectRelease();
    swift_task_dealloc();
    OUTLINED_FUNCTION_36();
    OUTLINED_FUNCTION_48();
    v9 = (uint64_t (*)(void))OUTLINED_FUNCTION_22();
    return OUTLINED_FUNCTION_23(v9);
  }
  else
  {
    v5 = v0[17];
    v6 = v0[10];
    v0[4] = v0[9];
    v0[5] = v6;
    swift_bridgeObjectRetain();
    OUTLINED_FUNCTION_99();
    v7 = sub_1B24985F0(v5);
    nullsub_1(v7, v8);
    OUTLINED_FUNCTION_67();
    OUTLINED_FUNCTION_82();
    OUTLINED_FUNCTION_74();
    v11 = (_QWORD *)OUTLINED_FUNCTION_39();
    v0[19] = v11;
    *v11 = v0;
    v11[1] = sub_1B259619C;
    v12 = OUTLINED_FUNCTION_41(v0[11]);
    return OUTLINED_FUNCTION_16(v12, v13, v14, v15);
  }
}

uint64_t sub_1B259619C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  OUTLINED_FUNCTION_13_7();
  if (!v1)
    *(_QWORD *)(v2 + 168) = v0;
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_17();
  return OUTLINED_FUNCTION_31();
}

uint64_t sub_1B25961F0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void (*v5)(uint64_t, uint64_t);

  v1 = *(_QWORD *)(v0 + 136);
  v2 = *(_QWORD *)(v0 + 144);
  v3 = *(_QWORD *)(v0 + 120);
  v4 = *(_QWORD *)(v0 + 128);
  (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 104) + 8))(*(_QWORD *)(v0 + 112), *(_QWORD *)(v0 + 96));
  v5 = *(void (**)(uint64_t, uint64_t))(v4 + 8);
  v5(v1, v3);
  v5(v2, v3);
  OUTLINED_FUNCTION_36();
  OUTLINED_FUNCTION_48();
  swift_task_dealloc();
  return (*(uint64_t (**)(_QWORD))(v0 + 8))(*(_QWORD *)(v0 + 168));
}

void sub_1B2596278()
{
  sub_1B2597044();
}

uint64_t sub_1B2596290()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void (*v5)(uint64_t, uint64_t);

  v1 = *(_QWORD *)(v0 + 136);
  v2 = *(_QWORD *)(v0 + 144);
  v3 = *(_QWORD *)(v0 + 120);
  v4 = *(_QWORD *)(v0 + 128);
  OUTLINED_FUNCTION_30(*(_QWORD *)(v0 + 104));
  v5 = *(void (**)(uint64_t, uint64_t))(v4 + 8);
  v5(v1, v3);
  v5(v2, v3);
  swift_task_dealloc();
  OUTLINED_FUNCTION_48();
  OUTLINED_FUNCTION_95();
  return OUTLINED_FUNCTION_68(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_1B2596304(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;

  v2[4] = a1;
  v2[5] = v1;
  v3 = OUTLINED_FUNCTION_61();
  v2[6] = v3;
  v2[7] = *(_QWORD *)(v3 - 8);
  v2[8] = OUTLINED_FUNCTION_7_0();
  v4 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED36CF38);
  v2[9] = v4;
  v2[10] = *(_QWORD *)(v4 - 8);
  v2[11] = OUTLINED_FUNCTION_7_0();
  OUTLINED_FUNCTION_17();
  return OUTLINED_FUNCTION_8();
}

uint64_t sub_1B2596368(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t (*a10)(void))
{
  _QWORD *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD *v16;

  OUTLINED_FUNCTION_149();
  if ((swift_distributed_actor_is_remote() & 1) == 0)
    return OUTLINED_FUNCTION_13_9();
  v11 = v10[11];
  v12 = v10[4];
  v13 = OUTLINED_FUNCTION_35_11();
  v10[3] = v12;
  v10[2] = v13;
  OUTLINED_FUNCTION_168();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED36CFD0);
  OUTLINED_FUNCTION_63_13();
  OUTLINED_FUNCTION_99();
  sub_1B2498684(v11);
  nullsub_1(v14, v15);
  OUTLINED_FUNCTION_67();
  OUTLINED_FUNCTION_82();
  OUTLINED_FUNCTION_74();
  v16 = (_QWORD *)OUTLINED_FUNCTION_25();
  v10[12] = v16;
  *v16 = v10;
  v16[1] = sub_1B25964B4;
  return OUTLINED_FUNCTION_84_2(v10[5], v10[8], (uint64_t)(v10 + 2), a10);
}

uint64_t sub_1B25964B4(uint64_t a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v4;

  v4 = *v2;
  *(_QWORD *)(*v2 + 104) = v1;
  swift_task_dealloc();
  if (!v1)
    *(_QWORD *)(v4 + 112) = a1;
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_17();
  return OUTLINED_FUNCTION_31();
}

uint64_t sub_1B2596528()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 80);
  (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 56) + 8))(*(_QWORD *)(v0 + 64), *(_QWORD *)(v0 + 48));
  OUTLINED_FUNCTION_41_15(*(uint64_t (**)(uint64_t, uint64_t))(v1 + 8));
  OUTLINED_FUNCTION_36();
  OUTLINED_FUNCTION_95();
  return (*(uint64_t (**)(_QWORD))(v0 + 8))(*(_QWORD *)(v0 + 112));
}

void sub_1B2596588()
{
  sub_1B25971B8();
}

uint64_t sub_1B25965A0()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 80);
  OUTLINED_FUNCTION_30(*(_QWORD *)(v0 + 56));
  OUTLINED_FUNCTION_41_15(*(uint64_t (**)(uint64_t, uint64_t))(v1 + 8));
  swift_task_dealloc();
  OUTLINED_FUNCTION_48();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_1B25965FC()
{
  _QWORD *v0;
  uint64_t v1;

  v1 = OUTLINED_FUNCTION_28_13();
  v0[4] = v1;
  v0[5] = *(_QWORD *)(v1 - 8);
  v0[6] = OUTLINED_FUNCTION_7_0();
  OUTLINED_FUNCTION_17();
  return OUTLINED_FUNCTION_8();
}

uint64_t sub_1B259663C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t (*v3)(void);
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t (*v9)(void);

  OUTLINED_FUNCTION_149();
  if ((OUTLINED_FUNCTION_122() & 1) == 0)
    return OUTLINED_FUNCTION_13_9();
  v2 = OUTLINED_FUNCTION_47();
  OUTLINED_FUNCTION_35(v2);
  if (v0)
  {
    OUTLINED_FUNCTION_107();
    OUTLINED_FUNCTION_77();
    v3 = (uint64_t (*)(void))OUTLINED_FUNCTION_22();
    return OUTLINED_FUNCTION_23(v3);
  }
  else
  {
    OUTLINED_FUNCTION_67();
    OUTLINED_FUNCTION_82();
    OUTLINED_FUNCTION_74();
    v5 = (_QWORD *)OUTLINED_FUNCTION_25();
    *(_QWORD *)(v1 + 64) = v5;
    v6 = OUTLINED_FUNCTION_19(v5, (uint64_t)sub_1B25966E0);
    return OUTLINED_FUNCTION_84_2(v6, v7, v8, v9);
  }
}

uint64_t sub_1B25966E0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  OUTLINED_FUNCTION_11_11();
  swift_bridgeObjectRelease();
  if (!v1)
    *(_QWORD *)(v2 + 80) = v0;
  OUTLINED_FUNCTION_17();
  return OUTLINED_FUNCTION_31();
}

void sub_1B259672C()
{
  sub_1B2597234();
}

uint64_t sub_1B2596744()
{
  _QWORD *v0;
  uint64_t v1;

  v1 = OUTLINED_FUNCTION_28_13();
  v0[4] = v1;
  v0[5] = *(_QWORD *)(v1 - 8);
  v0[6] = OUTLINED_FUNCTION_7_0();
  OUTLINED_FUNCTION_17();
  return OUTLINED_FUNCTION_8();
}

uint64_t sub_1B2596784()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t (*v3)(void);
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t (*v9)(void);

  OUTLINED_FUNCTION_149();
  if ((OUTLINED_FUNCTION_122() & 1) == 0)
    return OUTLINED_FUNCTION_13_9();
  v2 = OUTLINED_FUNCTION_47();
  OUTLINED_FUNCTION_35(v2);
  if (v0)
  {
    OUTLINED_FUNCTION_107();
    OUTLINED_FUNCTION_77();
    v3 = (uint64_t (*)(void))OUTLINED_FUNCTION_22();
    return OUTLINED_FUNCTION_23(v3);
  }
  else
  {
    OUTLINED_FUNCTION_67();
    OUTLINED_FUNCTION_82();
    OUTLINED_FUNCTION_74();
    v5 = (_QWORD *)OUTLINED_FUNCTION_25();
    *(_QWORD *)(v1 + 64) = v5;
    v6 = OUTLINED_FUNCTION_19(v5, (uint64_t)sub_1B2596828);
    return OUTLINED_FUNCTION_84_2(v6, v7, v8, v9);
  }
}

uint64_t sub_1B2596828()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  OUTLINED_FUNCTION_11_11();
  swift_bridgeObjectRelease();
  if (!v1)
    *(_QWORD *)(v2 + 80) = v0;
  OUTLINED_FUNCTION_17();
  return OUTLINED_FUNCTION_31();
}

uint64_t sub_1B2596874()
{
  uint64_t v0;

  OUTLINED_FUNCTION_101();
  OUTLINED_FUNCTION_36();
  return (*(uint64_t (**)(_QWORD))(v0 + 8))(*(_QWORD *)(v0 + 80));
}

void sub_1B25968AC()
{
  sub_1B25972B0();
}

uint64_t sub_1B25968C4()
{
  uint64_t v0;

  OUTLINED_FUNCTION_6_14();
  OUTLINED_FUNCTION_77();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_1B25968F8()
{
  _QWORD *v0;
  uint64_t v1;

  v1 = OUTLINED_FUNCTION_28_13();
  v0[4] = v1;
  v0[5] = *(_QWORD *)(v1 - 8);
  v0[6] = OUTLINED_FUNCTION_7_0();
  OUTLINED_FUNCTION_17();
  return OUTLINED_FUNCTION_8();
}

uint64_t sub_1B2596938()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t (*v3)(void);
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t (*v9)(void);

  OUTLINED_FUNCTION_149();
  if ((OUTLINED_FUNCTION_122() & 1) == 0)
    return OUTLINED_FUNCTION_13_9();
  v2 = OUTLINED_FUNCTION_47();
  OUTLINED_FUNCTION_35(v2);
  if (v0)
  {
    OUTLINED_FUNCTION_107();
    OUTLINED_FUNCTION_77();
    v3 = (uint64_t (*)(void))OUTLINED_FUNCTION_22();
    return OUTLINED_FUNCTION_45(v3);
  }
  else
  {
    OUTLINED_FUNCTION_67();
    OUTLINED_FUNCTION_82();
    OUTLINED_FUNCTION_74();
    v5 = (_QWORD *)OUTLINED_FUNCTION_25();
    *(_QWORD *)(v1 + 64) = v5;
    v6 = OUTLINED_FUNCTION_19(v5, (uint64_t)sub_1B25969D4);
    return OUTLINED_FUNCTION_84_2(v6, v7, v8, v9);
  }
}

uint64_t sub_1B25969D4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  OUTLINED_FUNCTION_10_17();
  OUTLINED_FUNCTION_58_12();
  if (!v1)
  {
    *(_QWORD *)(v3 + 80) = v0;
    *(_QWORD *)(v3 + 88) = v2;
  }
  OUTLINED_FUNCTION_17();
  return OUTLINED_FUNCTION_15_9();
}

uint64_t sub_1B2596A1C()
{
  uint64_t v0;

  OUTLINED_FUNCTION_101();
  OUTLINED_FUNCTION_36();
  return (*(uint64_t (**)(_QWORD, _QWORD))(v0 + 8))(*(_QWORD *)(v0 + 88), *(_QWORD *)(v0 + 80));
}

void sub_1B2596A54()
{
  sub_1B2597374();
}

uint64_t sub_1B2596A6C()
{
  _QWORD *v0;
  uint64_t v1;

  v1 = OUTLINED_FUNCTION_28_13();
  v0[4] = v1;
  v0[5] = *(_QWORD *)(v1 - 8);
  v0[6] = OUTLINED_FUNCTION_7_0();
  OUTLINED_FUNCTION_17();
  return OUTLINED_FUNCTION_8();
}

uint64_t sub_1B2596AAC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t (*v3)(void);
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t (*v9)(void);

  OUTLINED_FUNCTION_149();
  if ((OUTLINED_FUNCTION_122() & 1) == 0)
    return OUTLINED_FUNCTION_13_9();
  v2 = OUTLINED_FUNCTION_47();
  OUTLINED_FUNCTION_35(v2);
  if (v0)
  {
    OUTLINED_FUNCTION_107();
    OUTLINED_FUNCTION_77();
    v3 = (uint64_t (*)(void))OUTLINED_FUNCTION_22();
    return OUTLINED_FUNCTION_45(v3);
  }
  else
  {
    OUTLINED_FUNCTION_67();
    OUTLINED_FUNCTION_74();
    v5 = (_QWORD *)OUTLINED_FUNCTION_25();
    *(_QWORD *)(v1 + 64) = v5;
    v6 = OUTLINED_FUNCTION_19(v5, (uint64_t)sub_1B2596B4C);
    return OUTLINED_FUNCTION_84_2(v6, v7, v8, v9);
  }
}

uint64_t sub_1B2596B4C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  OUTLINED_FUNCTION_10_17();
  OUTLINED_FUNCTION_58_12();
  if (!v1)
  {
    *(_QWORD *)(v3 + 80) = v0;
    *(_QWORD *)(v3 + 88) = v2;
  }
  OUTLINED_FUNCTION_17();
  return OUTLINED_FUNCTION_15_9();
}

void sub_1B2596B94()
{
  sub_1B25973F0();
}

uint64_t sub_1B2596BAC()
{
  _QWORD *v0;
  uint64_t v1;

  v1 = OUTLINED_FUNCTION_28_13();
  v0[4] = v1;
  v0[5] = *(_QWORD *)(v1 - 8);
  v0[6] = OUTLINED_FUNCTION_7_0();
  OUTLINED_FUNCTION_17();
  return OUTLINED_FUNCTION_8();
}

uint64_t sub_1B2596BEC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t (*v3)(void);
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t (*v9)(void);

  OUTLINED_FUNCTION_149();
  if ((OUTLINED_FUNCTION_122() & 1) == 0)
    return OUTLINED_FUNCTION_13_9();
  v2 = OUTLINED_FUNCTION_47();
  OUTLINED_FUNCTION_35(v2);
  if (v0)
  {
    OUTLINED_FUNCTION_107();
    OUTLINED_FUNCTION_77();
    v3 = (uint64_t (*)(void))OUTLINED_FUNCTION_22();
    return OUTLINED_FUNCTION_45(v3);
  }
  else
  {
    OUTLINED_FUNCTION_67();
    OUTLINED_FUNCTION_74();
    v5 = (_QWORD *)OUTLINED_FUNCTION_25();
    *(_QWORD *)(v1 + 64) = v5;
    v6 = OUTLINED_FUNCTION_19(v5, (uint64_t)sub_1B2596B4C);
    return OUTLINED_FUNCTION_84_2(v6, v7, v8, v9);
  }
}

void sub_1B2596C8C()
{
  sub_1B259746C();
}

uint64_t sub_1B2596CA4()
{
  _QWORD *v0;
  uint64_t v1;

  v1 = OUTLINED_FUNCTION_28_13();
  v0[4] = v1;
  v0[5] = *(_QWORD *)(v1 - 8);
  v0[6] = OUTLINED_FUNCTION_7_0();
  OUTLINED_FUNCTION_17();
  return OUTLINED_FUNCTION_8();
}

uint64_t sub_1B2596CE4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t (*v3)(void);
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t (*v9)(void);

  OUTLINED_FUNCTION_149();
  if ((OUTLINED_FUNCTION_122() & 1) == 0)
    return OUTLINED_FUNCTION_13_9();
  v2 = OUTLINED_FUNCTION_47();
  OUTLINED_FUNCTION_35(v2);
  if (v0)
  {
    OUTLINED_FUNCTION_107();
    OUTLINED_FUNCTION_77();
    v3 = (uint64_t (*)(void))OUTLINED_FUNCTION_22();
    return OUTLINED_FUNCTION_45(v3);
  }
  else
  {
    OUTLINED_FUNCTION_67();
    OUTLINED_FUNCTION_74();
    v5 = (_QWORD *)OUTLINED_FUNCTION_25();
    *(_QWORD *)(v1 + 64) = v5;
    v6 = OUTLINED_FUNCTION_19(v5, (uint64_t)sub_1B2596B4C);
    return OUTLINED_FUNCTION_84_2(v6, v7, v8, v9);
  }
}

void sub_1B2596D84()
{
  sub_1B25974E8();
}

uint64_t sub_1B2596D9C()
{
  _QWORD *v0;
  uint64_t v1;

  v1 = OUTLINED_FUNCTION_28_13();
  v0[4] = v1;
  v0[5] = *(_QWORD *)(v1 - 8);
  v0[6] = OUTLINED_FUNCTION_7_0();
  OUTLINED_FUNCTION_17();
  return OUTLINED_FUNCTION_8();
}

uint64_t sub_1B2596DDC()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t (*v7)(void);

  OUTLINED_FUNCTION_149();
  if ((OUTLINED_FUNCTION_122() & 1) == 0)
    return OUTLINED_FUNCTION_13_9();
  v1 = OUTLINED_FUNCTION_47();
  v0[7] = v1;
  v0[2] = v1;
  nullsub_1(v1, v2);
  OUTLINED_FUNCTION_82();
  OUTLINED_FUNCTION_74();
  v3 = (_QWORD *)OUTLINED_FUNCTION_25();
  v0[8] = v3;
  v4 = OUTLINED_FUNCTION_19(v3, (uint64_t)sub_1B25787F4);
  return OUTLINED_FUNCTION_84_2(v4, v5, v6, v7);
}

void sub_1B2596E8C()
{
  OUTLINED_FUNCTION_4_12();
  __break(1u);
}

uint64_t sub_1B2596EBC(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  _QWORD *v3;
  uint64_t v5;
  uint64_t *v6;
  uint64_t result;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD *v14;

  v3[2] = a3;
  v5 = *a2;
  v3[3] = *a2;
  v3[4] = *(_QWORD *)(v5 - 8);
  v6 = (uint64_t *)swift_task_alloc();
  v3[5] = v6;
  result = swift_conformsToProtocol();
  if (result)
  {
    sub_1B2550EE0();
    v8 = *v6;
    v9 = v6[1];
    v10 = a2[1];
    v3[6] = v10;
    v3[7] = *(_QWORD *)(v10 - 8);
    v11 = (uint64_t *)swift_task_alloc();
    v3[8] = v11;
    result = swift_conformsToProtocol();
    if (result)
    {
      sub_1B2550EE0();
      v12 = *v11;
      v13 = v11[1];
      v14 = (_QWORD *)swift_task_alloc();
      v3[9] = v14;
      *v14 = v3;
      v14[1] = sub_1B2597B80;
      return sub_1B2595F20(v8, v9, v12, v13);
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
  return result;
}

void sub_1B2597044()
{
  OUTLINED_FUNCTION_4_12();
  __break(1u);
}

uint64_t sub_1B2597074(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  _QWORD *v3;
  uint64_t v4;
  uint64_t *v5;
  uint64_t result;
  uint64_t v7;
  _QWORD *v8;

  v3[2] = a3;
  v4 = *a2;
  v3[3] = *a2;
  v3[4] = *(_QWORD *)(v4 - 8);
  v5 = (uint64_t *)swift_task_alloc();
  v3[5] = v5;
  result = swift_conformsToProtocol();
  if (result)
  {
    sub_1B2550EE0();
    v7 = *v5;
    v8 = (_QWORD *)swift_task_alloc();
    v3[6] = v8;
    *v8 = v3;
    v8[1] = sub_1B2597160;
    return sub_1B2596304(v7);
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_1B2597160(uint64_t a1)
{
  uint64_t (**v1)(void);
  uint64_t v2;

  v2 = *((_QWORD *)*v1 + 4);
  OUTLINED_FUNCTION_15_2(a1);
  OUTLINED_FUNCTION_257(*(uint64_t (**)(uint64_t, uint64_t))(v2 + 8));
  OUTLINED_FUNCTION_48();
  return v1[1]();
}

void sub_1B25971B8()
{
  OUTLINED_FUNCTION_4_12();
  __break(1u);
}

uint64_t sub_1B25971E8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  _QWORD *v4;

  *(_QWORD *)(v3 + 16) = a3;
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v3 + 24) = v4;
  *v4 = v3;
  v4[1] = sub_1B25798BC;
  return sub_1B25965FC();
}

void sub_1B2597234()
{
  OUTLINED_FUNCTION_4_12();
  __break(1u);
}

uint64_t sub_1B2597264(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  _QWORD *v4;

  *(_QWORD *)(v3 + 16) = a3;
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v3 + 24) = v4;
  *v4 = v3;
  v4[1] = sub_1B2578BA8;
  return sub_1B2596744();
}

void sub_1B25972B0()
{
  OUTLINED_FUNCTION_4_12();
  __break(1u);
}

uint64_t sub_1B25972E0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  _QWORD *v4;

  *(_QWORD *)(v3 + 16) = a3;
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v3 + 24) = v4;
  *v4 = v3;
  v4[1] = sub_1B259732C;
  return sub_1B25968F8();
}

uint64_t sub_1B259732C(uint64_t a1, uint64_t a2)
{
  uint64_t *v2;
  _QWORD *v3;
  uint64_t v5;

  v3 = *(_QWORD **)(*v2 + 16);
  v5 = *v2;
  *v3 = a1;
  v3[1] = a2;
  swift_task_dealloc();
  return OUTLINED_FUNCTION_21(*(uint64_t (**)(void))(v5 + 8));
}

void sub_1B2597374()
{
  OUTLINED_FUNCTION_4_12();
  __break(1u);
}

uint64_t sub_1B25973A4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  _QWORD *v4;

  *(_QWORD *)(v3 + 16) = a3;
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v3 + 24) = v4;
  *v4 = v3;
  v4[1] = sub_1B2597B08;
  return sub_1B2596A6C();
}

void sub_1B25973F0()
{
  OUTLINED_FUNCTION_4_12();
  __break(1u);
}

uint64_t sub_1B2597420(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  _QWORD *v4;

  *(_QWORD *)(v3 + 16) = a3;
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v3 + 24) = v4;
  *v4 = v3;
  v4[1] = sub_1B2597B08;
  return sub_1B2596BAC();
}

void sub_1B259746C()
{
  OUTLINED_FUNCTION_4_12();
  __break(1u);
}

uint64_t sub_1B259749C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  _QWORD *v4;

  *(_QWORD *)(v3 + 16) = a3;
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v3 + 24) = v4;
  *v4 = v3;
  v4[1] = sub_1B2597B08;
  return sub_1B2596CA4();
}

void sub_1B25974E8()
{
  OUTLINED_FUNCTION_4_12();
  __break(1u);
}

uint64_t sub_1B2597518()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 16) = v1;
  *v1 = v0;
  v1[1] = sub_1B250AF74;
  return sub_1B2596D9C();
}

uint64_t type metadata accessor for EAREuclid()
{
  return objc_opt_self();
}

uint64_t sub_1B2597580()
{
  uint64_t v0;

  sub_1B25CD6A8();
  type metadata accessor for EAREuclid();
  sub_1B24B87C4(&qword_1EEFD6910, v0, (uint64_t (*)(uint64_t))type metadata accessor for EAREuclid, (uint64_t)&unk_1B25E1D14);
  sub_1B25CC91C();
  return sub_1B25CD6CC();
}

uint64_t sub_1B25975F0()
{
  uint64_t v0;
  uint64_t v1;

  if ((sub_1B25CC7C0() & 1) == 0)
  {
    type metadata accessor for EAREuclid();
    sub_1B24B87C4(&qword_1EEFD6908, v1, (uint64_t (*)(uint64_t))type metadata accessor for EAREuclid, (uint64_t)&unk_1B25E1D9C);
    return sub_1B25CC76C();
  }
  return v0;
}

uint64_t sub_1B259765C(uint64_t a1, uint64_t *a2)
{
  return sub_1B2595144(*(void **)a1, *(void **)(a1 + 8), *(_BYTE *)(a1 + 16), *a2);
}

uint64_t sub_1B2597684()
{
  return sub_1B2597580();
}

uint64_t sub_1B25976A4()
{
  uint64_t v0;

  type metadata accessor for EAREuclid();
  sub_1B24B87C4(&qword_1EEFD6908, v0, (uint64_t (*)(uint64_t))type metadata accessor for EAREuclid, (uint64_t)&unk_1B25E1D9C);
  return sub_1B25CC79C();
}

uint64_t sub_1B2597700()
{
  sub_1B25CD6A8();
  type metadata accessor for EAREuclid();
  sub_1B25CC91C();
  return sub_1B25CD6CC();
}

uint64_t sub_1B2597754()
{
  uint64_t v0;

  type metadata accessor for EAREuclid();
  sub_1B24B87C4(&qword_1EEFD6908, v0, (uint64_t (*)(uint64_t))type metadata accessor for EAREuclid, (uint64_t)&unk_1B25E1D9C);
  return sub_1B25CC790();
}

uint64_t sub_1B25977B0()
{
  uint64_t v0;

  type metadata accessor for EAREuclid();
  sub_1B24B87C4(&qword_1EEFD6908, v0, (uint64_t (*)(uint64_t))type metadata accessor for EAREuclid, (uint64_t)&unk_1B25E1D9C);
  sub_1B24A1DB8();
  return sub_1B25CC7A8();
}

uint64_t sub_1B2597828@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t result;

  type metadata accessor for EAREuclid();
  sub_1B24B87C4(&qword_1EEFD6908, v3, (uint64_t (*)(uint64_t))type metadata accessor for EAREuclid, (uint64_t)&unk_1B25E1D9C);
  sub_1B24A1DF4();
  result = sub_1B25CC7B4();
  if (!v1)
    *a1 = result;
  return result;
}

uint64_t sub_1B25978A8(uint64_t a1, uint64_t a2)
{
  return sub_1B24B87C4(&qword_1EEFD6918, a2, (uint64_t (*)(uint64_t))type metadata accessor for EAREuclid, (uint64_t)&unk_1B25E1CEC);
}

uint64_t sub_1B25978D4(uint64_t a1, uint64_t a2)
{
  return sub_1B24B87C4(&qword_1EEFD6910, a2, (uint64_t (*)(uint64_t))type metadata accessor for EAREuclid, (uint64_t)&unk_1B25E1D14);
}

uint64_t sub_1B2597900(uint64_t a1, uint64_t a2)
{
  return sub_1B24B87C4(&qword_1EEFD6920, a2, (uint64_t (*)(uint64_t))type metadata accessor for EAREuclid, (uint64_t)&unk_1B25E1D54);
}

uint64_t sub_1B259792C()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t block_copy_helper_10(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_10()
{
  return swift_release();
}

id sub_1B2597968()
{
  id result;

  result = xpcInterface_EAREuclid();
  qword_1EEFE4108 = (uint64_t)result;
  return result;
}

uint64_t sub_1B259798C(uint64_t a1)
{
  void (*v1)(uint64_t);
  uint64_t v2;

  v1 = *(void (**)(uint64_t))(a1 + 32);
  sub_1B24ADA58(0, &qword_1EEFDB408);
  v2 = sub_1B25CCBA4();
  swift_retain();
  v1(v2);
  swift_release();
  return swift_bridgeObjectRelease();
}

uint64_t sub_1B25979F8(void *a1, void (*a2)(_QWORD *))
{
  id v4;
  _QWORD v6[4];

  v6[3] = sub_1B24ADA58(0, (unint64_t *)&qword_1EEFD7478);
  v6[0] = a1;
  v4 = a1;
  a2(v6);
  return sub_1B24B8848((uint64_t)v6);
}

uint64_t sub_1B2597A60(void *a1)
{
  uint64_t v1;

  return sub_1B25979F8(a1, *(void (**)(_QWORD *))(v1 + 16));
}

uint64_t sub_1B2597A68(uint64_t a1)
{
  void (*v1)(uint64_t);
  uint64_t v2;

  v1 = *(void (**)(uint64_t))(a1 + 32);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED36CFE0);
  v2 = sub_1B25CCBA4();
  swift_retain();
  v1(v2);
  swift_release();
  return swift_bridgeObjectRelease();
}

uint64_t sub_1B2597AC8(uint64_t a1)
{
  uint64_t v1;

  return sub_1B255C7AC(a1, *(void (**)(_QWORD *))(v1 + 16), *(_QWORD *)(v1 + 24), &qword_1EEFD6928);
}

uint64_t sub_1B2597AE8(uint64_t a1)
{
  uint64_t v1;

  return sub_1B255C7AC(a1, *(void (**)(_QWORD *))(v1 + 16), *(_QWORD *)(v1 + 24), &qword_1EEFD8510);
}

uint64_t OUTLINED_FUNCTION_10_17()
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
  *(_QWORD *)(v3 + 72) = v0;
  return swift_task_dealloc();
}

void *OUTLINED_FUNCTION_19_12@<X0>(uint64_t a1@<X8>, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, char aBlock, uint64_t a13, uint64_t a14, uint64_t a15)
{
  uint64_t v15;

  a14 = a1;
  a15 = v15;
  return _Block_copy(&aBlock);
}

uint64_t OUTLINED_FUNCTION_21_15()
{
  return swift_retain();
}

uint64_t OUTLINED_FUNCTION_30_13()
{
  return swift_dynamicCast();
}

uint64_t OUTLINED_FUNCTION_41_15@<X0>(uint64_t (*a1)(uint64_t, uint64_t)@<X8>)
{
  uint64_t v1;
  uint64_t v2;

  return a1(v2, v1);
}

_OWORD *OUTLINED_FUNCTION_42_14(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, __int128 a15, uint64_t a16, uint64_t a17, __int128 a18)
{
  return sub_1B24AB608(&a15, &a18);
}

uint64_t OUTLINED_FUNCTION_49_14()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_51_10(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, ...)
{
  uint64_t v6;
  va_list va;

  va_start(va, a6);
  return sub_1B251AC38(v6 + 32, (uint64_t)va);
}

id OUTLINED_FUNCTION_52_13(uint64_t a1, const char *a2)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  return objc_msgSend(v2, a2, v4, v5, v3);
}

uint64_t OUTLINED_FUNCTION_58_12()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_62_12()
{
  return sub_1B25CCA0C();
}

uint64_t OUTLINED_FUNCTION_63_13()
{
  return 0x656372756F73;
}

uint64_t sub_1B2597C54()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;

  v1[3] = v0;
  v2 = OUTLINED_FUNCTION_61();
  v1[4] = v2;
  v1[5] = *(_QWORD *)(v2 - 8);
  v1[6] = OUTLINED_FUNCTION_7_0();
  OUTLINED_FUNCTION_17();
  return OUTLINED_FUNCTION_8();
}

uint64_t sub_1B2597C98()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t (*v3)(void);
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t (*v9)(void);

  if ((OUTLINED_FUNCTION_122() & 1) == 0)
    return OUTLINED_FUNCTION_15();
  v2 = OUTLINED_FUNCTION_47();
  OUTLINED_FUNCTION_35(v2);
  if (v0)
  {
    OUTLINED_FUNCTION_107();
    OUTLINED_FUNCTION_77();
    v3 = (uint64_t (*)(void))OUTLINED_FUNCTION_22();
    return OUTLINED_FUNCTION_23(v3);
  }
  else
  {
    OUTLINED_FUNCTION_82();
    OUTLINED_FUNCTION_74();
    v5 = (_QWORD *)OUTLINED_FUNCTION_25();
    *(_QWORD *)(v1 + 64) = v5;
    v6 = OUTLINED_FUNCTION_19(v5, (uint64_t)sub_1B249E92C);
    return OUTLINED_FUNCTION_16(v6, v7, v8, v9);
  }
}

uint64_t sub_1B2597D48()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 16) = v1;
  *v1 = v0;
  v1[1] = sub_1B24EBFF4;
  return sub_1B2597C54();
}

uint64_t sub_1B2597D90(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;

  v3[6] = a2;
  v3[7] = v2;
  v3[5] = a1;
  v4 = OUTLINED_FUNCTION_61();
  v3[8] = v4;
  v3[9] = *(_QWORD *)(v4 - 8);
  v3[10] = OUTLINED_FUNCTION_7_0();
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEFD69D8);
  v3[11] = v5;
  v3[12] = *(_QWORD *)(v5 - 8);
  v3[13] = OUTLINED_FUNCTION_7_0();
  OUTLINED_FUNCTION_17();
  return OUTLINED_FUNCTION_8();
}

uint64_t sub_1B2597DF8()
{
  _QWORD *v0;
  uint64_t v1;
  unint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t (*v11)(void);

  if ((swift_distributed_actor_is_remote() & 1) == 0)
    return OUTLINED_FUNCTION_15();
  v1 = v0[13];
  v2 = v0[6];
  v3 = v0[5];
  v4 = OUTLINED_FUNCTION_58();
  v0[2] = v3;
  v0[3] = v2;
  v0[4] = v4;
  sub_1B249B498(v3, v2);
  sub_1B25CC7F0();
  v5 = sub_1B24986B0(v1);
  nullsub_1(v5, v6);
  OUTLINED_FUNCTION_82();
  OUTLINED_FUNCTION_74();
  v7 = (_QWORD *)OUTLINED_FUNCTION_39();
  v0[14] = v7;
  *v7 = v0;
  v7[1] = sub_1B2597F40;
  v8 = OUTLINED_FUNCTION_41(v0[7]);
  return OUTLINED_FUNCTION_16(v8, v9, v10, v11);
}

uint64_t sub_1B2597F40()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 120) = v0;
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_17();
  return OUTLINED_FUNCTION_0_0();
}

uint64_t sub_1B2597FA0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t (*v2)(void);

  v1 = *(_QWORD *)(v0 + 96);
  OUTLINED_FUNCTION_30(*(_QWORD *)(v0 + 72));
  OUTLINED_FUNCTION_41_15(*(uint64_t (**)(uint64_t, uint64_t))(v1 + 8));
  OUTLINED_FUNCTION_91();
  OUTLINED_FUNCTION_36();
  v2 = (uint64_t (*)(void))OUTLINED_FUNCTION_66();
  return OUTLINED_FUNCTION_56(v2);
}

uint64_t sub_1B2597FE4()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 96);
  OUTLINED_FUNCTION_30(*(_QWORD *)(v0 + 72));
  OUTLINED_FUNCTION_41_15(*(uint64_t (**)(uint64_t, uint64_t))(v1 + 8));
  swift_task_dealloc();
  OUTLINED_FUNCTION_48();
  return OUTLINED_FUNCTION_56(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_1B2598034()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;

  v1[3] = v0;
  v2 = OUTLINED_FUNCTION_61();
  v1[4] = v2;
  v1[5] = *(_QWORD *)(v2 - 8);
  v1[6] = OUTLINED_FUNCTION_7_0();
  OUTLINED_FUNCTION_17();
  return OUTLINED_FUNCTION_8();
}

uint64_t sub_1B2598078()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t (*v3)(void);
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t (*v9)(void);

  if ((OUTLINED_FUNCTION_122() & 1) == 0)
    return OUTLINED_FUNCTION_15();
  v2 = OUTLINED_FUNCTION_47();
  OUTLINED_FUNCTION_35(v2);
  if (v0)
  {
    OUTLINED_FUNCTION_107();
    OUTLINED_FUNCTION_77();
    v3 = (uint64_t (*)(void))OUTLINED_FUNCTION_22();
    return OUTLINED_FUNCTION_23(v3);
  }
  else
  {
    OUTLINED_FUNCTION_82();
    OUTLINED_FUNCTION_74();
    v5 = (_QWORD *)OUTLINED_FUNCTION_25();
    *(_QWORD *)(v1 + 64) = v5;
    v6 = OUTLINED_FUNCTION_19(v5, (uint64_t)sub_1B249C410);
    return OUTLINED_FUNCTION_16(v6, v7, v8, v9);
  }
}

uint64_t sub_1B2598128()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;

  v1[3] = v0;
  v2 = OUTLINED_FUNCTION_61();
  v1[4] = v2;
  v1[5] = *(_QWORD *)(v2 - 8);
  v1[6] = OUTLINED_FUNCTION_7_0();
  OUTLINED_FUNCTION_17();
  return OUTLINED_FUNCTION_8();
}

uint64_t sub_1B259816C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t (*v3)(void);
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t (*v9)(void);

  if ((OUTLINED_FUNCTION_122() & 1) == 0)
    return OUTLINED_FUNCTION_15();
  v2 = OUTLINED_FUNCTION_47();
  OUTLINED_FUNCTION_35(v2);
  if (v0)
  {
    OUTLINED_FUNCTION_107();
    OUTLINED_FUNCTION_77();
    v3 = (uint64_t (*)(void))OUTLINED_FUNCTION_22();
    return OUTLINED_FUNCTION_23(v3);
  }
  else
  {
    OUTLINED_FUNCTION_82();
    OUTLINED_FUNCTION_74();
    v5 = (_QWORD *)OUTLINED_FUNCTION_25();
    *(_QWORD *)(v1 + 64) = v5;
    v6 = OUTLINED_FUNCTION_19(v5, (uint64_t)sub_1B249E92C);
    return OUTLINED_FUNCTION_16(v6, v7, v8, v9);
  }
}

uint64_t sub_1B259821C(float a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  *(_QWORD *)(v2 + 24) = v1;
  *(float *)(v2 + 108) = a1;
  v3 = OUTLINED_FUNCTION_61();
  *(_QWORD *)(v2 + 32) = v3;
  *(_QWORD *)(v2 + 40) = *(_QWORD *)(v3 - 8);
  *(_QWORD *)(v2 + 48) = OUTLINED_FUNCTION_7_0();
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEFD69F0);
  *(_QWORD *)(v2 + 56) = v4;
  *(_QWORD *)(v2 + 64) = *(_QWORD *)(v4 - 8);
  *(_QWORD *)(v2 + 72) = OUTLINED_FUNCTION_7_0();
  OUTLINED_FUNCTION_17();
  return OUTLINED_FUNCTION_8();
}

uint64_t sub_1B2598284()
{
  uint64_t v0;
  uint64_t v1;
  int v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t (*v12)(void);

  if ((OUTLINED_FUNCTION_122() & 1) == 0)
    return OUTLINED_FUNCTION_15();
  v1 = *(_QWORD *)(v0 + 72);
  v2 = *(_DWORD *)(v0 + 108);
  v3 = OUTLINED_FUNCTION_58();
  *(_DWORD *)(v0 + 104) = v2;
  *(_QWORD *)(v0 + 16) = v3;
  sub_1B25CC7F0();
  v4 = sub_1B2498D0C(v1);
  v6 = nullsub_1(v4, v5);
  nullsub_1(v6, v7);
  OUTLINED_FUNCTION_82();
  sub_1B25CC7E4();
  v8 = (_QWORD *)OUTLINED_FUNCTION_39();
  *(_QWORD *)(v0 + 80) = v8;
  *v8 = v0;
  v8[1] = sub_1B25983F0;
  v9 = OUTLINED_FUNCTION_41(*(_QWORD *)(v0 + 24));
  return OUTLINED_FUNCTION_16(v9, v10, v11, v12);
}

uint64_t sub_1B25983F0(uint64_t a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v4;

  v4 = *v2;
  *(_QWORD *)(*v2 + 88) = v1;
  swift_task_dealloc();
  if (!v1)
    *(_QWORD *)(v4 + 96) = a1;
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_17();
  return swift_task_switch();
}

uint64_t sub_1B2598470()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 64);
  (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 40) + 8))(*(_QWORD *)(v0 + 48), *(_QWORD *)(v0 + 32));
  OUTLINED_FUNCTION_41_15(*(uint64_t (**)(uint64_t, uint64_t))(v1 + 8));
  OUTLINED_FUNCTION_36();
  swift_task_dealloc();
  return (*(uint64_t (**)(_QWORD))(v0 + 8))(*(_QWORD *)(v0 + 96));
}

void sub_1B25984D4()
{
  sub_1B2598BC4();
}

uint64_t sub_1B25984EC()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 64);
  OUTLINED_FUNCTION_30(*(_QWORD *)(v0 + 40));
  OUTLINED_FUNCTION_41_15(*(uint64_t (**)(uint64_t, uint64_t))(v1 + 8));
  swift_task_dealloc();
  OUTLINED_FUNCTION_48();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_1B2598548(void *a1, void *a2, char a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v9;
  uint64_t v10;

  v9 = sub_1B24A1B48(a1, a2, a3, a4);
  v10 = v9;
  if (!v4 && !v9)
  {
    type metadata accessor for EARSpeechRecognitionAudioBuffer();
    v10 = swift_distributedActor_remote_initialize();
    *(_QWORD *)(v10 + 112) = a1;
    *(_QWORD *)(v10 + 120) = a2;
    *(_BYTE *)(v10 + 128) = a3;
    *(_QWORD *)(v10 + 136) = a4;
    sub_1B24A1AF4(a1, a2, a3);
    swift_retain();
  }
  return v10;
}

void sub_1B25985CC(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  char v11;
  __int128 v12;
  void *v13;
  int v14;
  uint64_t v15;
  void *v16;
  double v17;
  _QWORD aBlock[3];
  void *v19;
  uint64_t (*v20)(uint64_t);
  uint64_t v21;
  int v22;
  __int128 v23;
  uint64_t v24;
  __int128 v25;

  if (a1 == 0xD00000000000002ELL && (OUTLINED_FUNCTION_29(), v11) || (sub_1B25CD5D0() & 1) != 0)
  {
    objc_msgSend(a3, sel_hello);
    return;
  }
  if (a1 == 0xD00000000000003DLL && (OUTLINED_FUNCTION_29(), v11) || (OUTLINED_FUNCTION_12() & 1) != 0)
  {
    if (*(_QWORD *)(a4 + 16))
    {
      sub_1B251AC38(a4 + 32, (uint64_t)aBlock);
      if (v19)
      {
        if ((swift_dynamicCast() & 1) != 0)
        {
          v12 = v25;
          v13 = (void *)sub_1B25CC580();
          sub_1B24AB6DC(v12, *((unint64_t *)&v12 + 1));
LABEL_15:
          objc_msgSend(a3, sel_addAudioSampleData_, v13);

          return;
        }
      }
      else
      {
        sub_1B24B8848((uint64_t)aBlock);
      }
      v13 = 0;
      goto LABEL_15;
    }
    __break(1u);
    goto LABEL_32;
  }
  if (a1 == 0xD000000000000031 && (OUTLINED_FUNCTION_29(), v11) || (OUTLINED_FUNCTION_12() & 1) != 0)
  {
    objc_msgSend(a3, sel_endAudio);
    return;
  }
  if (a1 == 0xD00000000000003ALL && (OUTLINED_FUNCTION_29(), v11) || (OUTLINED_FUNCTION_12() & 1) != 0)
  {
    objc_msgSend(a3, sel_cancelRecognition);
    return;
  }
  if (a1 == 0xD000000000000052 && (OUTLINED_FUNCTION_29(), v11) || (OUTLINED_FUNCTION_12() & 1) != 0)
  {
    if (*(_QWORD *)(a4 + 16))
    {
      sub_1B251AC38(a4 + 32, (uint64_t)&v23);
      if (v24)
      {
        sub_1B24AB608(&v23, &v25);
        swift_dynamicCast();
        if (a5)
        {
          v14 = v22;
          v15 = swift_allocObject();
          *(_QWORD *)(v15 + 16) = a5;
          *(_QWORD *)(v15 + 24) = a6;
          v20 = sub_1B25990A4;
          v21 = v15;
          aBlock[0] = MEMORY[0x1E0C809B0];
          aBlock[1] = 1107296256;
          aBlock[2] = sub_1B24A19CC;
          v19 = &block_descriptor_14;
          v16 = _Block_copy(aBlock);
          swift_retain();
          swift_release();
          LODWORD(v17) = v14;
          objc_msgSend(a3, sel_packetArrivalTimestampFromAudioTimestamp_reply_, v16, v17);
          _Block_release(v16);
          return;
        }
        goto LABEL_34;
      }
LABEL_33:
      __break(1u);
LABEL_34:
      __break(1u);
      return;
    }
LABEL_32:
    __break(1u);
    goto LABEL_33;
  }
}

uint64_t sub_1B25988B4(uint64_t a1, uint64_t *a2)
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t *v4;
  uint64_t result;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;

  v3 = *a2;
  v2[2] = *a2;
  v2[3] = *(_QWORD *)(v3 - 8);
  v4 = (uint64_t *)swift_task_alloc();
  v2[4] = v4;
  result = swift_conformsToProtocol();
  if (result)
  {
    sub_1B2550EE0();
    v6 = *v4;
    v7 = v4[1];
    v8 = (_QWORD *)swift_task_alloc();
    v2[5] = v8;
    *v8 = v2;
    v8[1] = sub_1B25989A0;
    return sub_1B2597D90(v6, v7);
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_1B25989A0()
{
  uint64_t v0;

  OUTLINED_FUNCTION_81();
  OUTLINED_FUNCTION_24_17();
  OUTLINED_FUNCTION_48();
  return OUTLINED_FUNCTION_3_5(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_1B25989E4()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 16) = v1;
  *v1 = v0;
  v1[1] = sub_1B24DE4C4;
  return sub_1B2598034();
}

uint64_t sub_1B2598A2C()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 16) = v1;
  *v1 = v0;
  v1[1] = sub_1B24EBFF4;
  return sub_1B2598128();
}

uint64_t sub_1B2598A74(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  _QWORD *v3;
  uint64_t v4;
  float *v5;
  uint64_t result;
  float v7;
  _QWORD *v8;

  v3[2] = a3;
  v4 = *a2;
  v3[3] = *a2;
  v3[4] = *(_QWORD *)(v4 - 8);
  v5 = (float *)swift_task_alloc();
  v3[5] = v5;
  result = swift_conformsToProtocol();
  if (result)
  {
    sub_1B2550EE0();
    v7 = *v5;
    v8 = (_QWORD *)swift_task_alloc();
    v3[6] = v8;
    *v8 = v3;
    v8[1] = sub_1B2598B68;
    return sub_1B259821C(v7);
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_1B2598B68(uint64_t a1)
{
  uint64_t *v1;
  uint64_t v3;

  v3 = *v1;
  **(_QWORD **)(*v1 + 16) = a1;
  swift_task_dealloc();
  OUTLINED_FUNCTION_24_17();
  OUTLINED_FUNCTION_48();
  return OUTLINED_FUNCTION_3_5(*(uint64_t (**)(void))(v3 + 8));
}

void sub_1B2598BC4()
{
  sub_1B25CD45C();
  __break(1u);
}

uint64_t type metadata accessor for EARSpeechRecognitionAudioBuffer()
{
  return objc_opt_self();
}

uint64_t sub_1B2598C2C()
{
  uint64_t v0;

  sub_1B25CD6A8();
  type metadata accessor for EARSpeechRecognitionAudioBuffer();
  sub_1B24B87C4(&qword_1EEFD7098, v0, (uint64_t (*)(uint64_t))type metadata accessor for EARSpeechRecognitionAudioBuffer, (uint64_t)&unk_1B25E2028);
  sub_1B25CC91C();
  return sub_1B25CD6CC();
}

uint64_t sub_1B2598C9C()
{
  uint64_t v0;
  uint64_t v1;

  if ((sub_1B25CC7C0() & 1) == 0)
  {
    type metadata accessor for EARSpeechRecognitionAudioBuffer();
    sub_1B24B87C4(&qword_1EEFD7090, v1, (uint64_t (*)(uint64_t))type metadata accessor for EARSpeechRecognitionAudioBuffer, (uint64_t)&unk_1B25E20B0);
    return sub_1B25CC76C();
  }
  return v0;
}

uint64_t sub_1B2598D08(uint64_t a1, uint64_t *a2)
{
  return sub_1B2598548(*(void **)a1, *(void **)(a1 + 8), *(_BYTE *)(a1 + 16), *a2);
}

uint64_t sub_1B2598D30()
{
  return sub_1B2598C2C();
}

uint64_t sub_1B2598D50()
{
  uint64_t v0;

  type metadata accessor for EARSpeechRecognitionAudioBuffer();
  sub_1B24B87C4(&qword_1EEFD7090, v0, (uint64_t (*)(uint64_t))type metadata accessor for EARSpeechRecognitionAudioBuffer, (uint64_t)&unk_1B25E20B0);
  return sub_1B25CC79C();
}

uint64_t sub_1B2598DAC()
{
  sub_1B25CD6A8();
  type metadata accessor for EARSpeechRecognitionAudioBuffer();
  sub_1B25CC91C();
  return sub_1B25CD6CC();
}

uint64_t sub_1B2598E00()
{
  uint64_t v0;

  type metadata accessor for EARSpeechRecognitionAudioBuffer();
  sub_1B24B87C4(&qword_1EEFD7090, v0, (uint64_t (*)(uint64_t))type metadata accessor for EARSpeechRecognitionAudioBuffer, (uint64_t)&unk_1B25E20B0);
  return sub_1B25CC790();
}

uint64_t sub_1B2598E5C()
{
  uint64_t v0;

  type metadata accessor for EARSpeechRecognitionAudioBuffer();
  sub_1B24B87C4(&qword_1EEFD7090, v0, (uint64_t (*)(uint64_t))type metadata accessor for EARSpeechRecognitionAudioBuffer, (uint64_t)&unk_1B25E20B0);
  sub_1B24A1DB8();
  return sub_1B25CC7A8();
}

uint64_t sub_1B2598ED4@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t result;

  type metadata accessor for EARSpeechRecognitionAudioBuffer();
  sub_1B24B87C4(&qword_1EEFD7090, v3, (uint64_t (*)(uint64_t))type metadata accessor for EARSpeechRecognitionAudioBuffer, (uint64_t)&unk_1B25E20B0);
  sub_1B24A1DF4();
  result = sub_1B25CC7B4();
  if (!v1)
    *a1 = result;
  return result;
}

uint64_t sub_1B2598F54(uint64_t a1, uint64_t a2)
{
  return sub_1B24B87C4((unint64_t *)&unk_1EEFD6858, a2, (uint64_t (*)(uint64_t))type metadata accessor for EARSpeechRecognitionAudioBuffer, (uint64_t)&unk_1B25E2000);
}

uint64_t sub_1B2598F80(uint64_t a1, uint64_t a2)
{
  return sub_1B24B87C4(&qword_1EEFD7098, a2, (uint64_t (*)(uint64_t))type metadata accessor for EARSpeechRecognitionAudioBuffer, (uint64_t)&unk_1B25E2028);
}

uint64_t sub_1B2598FAC(uint64_t a1, uint64_t a2)
{
  return sub_1B24B87C4(&qword_1EEFD70A0, a2, (uint64_t (*)(uint64_t))type metadata accessor for EARSpeechRecognitionAudioBuffer, (uint64_t)&unk_1B25E2068);
}

void sub_1B2598FD8()
{
  void *v0;
  void *v1;
  id v2;

  v0 = (void *)objc_opt_self();
  v1 = &unk_1EEFF2FC0;
  v2 = objc_msgSend(v0, sel_interfaceWithProtocol_, v1);

  qword_1EEFE41B8 = (uint64_t)v2;
}

uint64_t sub_1B259903C(uint64_t a1, void (*a2)(_QWORD *))
{
  _QWORD v3[4];

  v3[3] = MEMORY[0x1E0DEE190];
  v3[0] = a1;
  a2(v3);
  return sub_1B24B8848((uint64_t)v3);
}

uint64_t sub_1B2599080()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_1B25990A4(uint64_t a1)
{
  uint64_t v1;

  return sub_1B259903C(a1, *(void (**)(_QWORD *))(v1 + 16));
}

uint64_t block_copy_helper_11(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_11()
{
  return swift_release();
}

uint64_t OUTLINED_FUNCTION_24_17()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 8))(v0, v1);
}

void sub_1B25990D4(uint64_t a1, uint64_t a2)
{
  __CFString *v3;
  uint64_t v4;
  void *v5;
  _QWORD v6[6];

  v3 = SFAnalyticsEventTypeGetName(a1);
  if (!v3)
  {
    sub_1B25CCA18();
    v3 = (__CFString *)sub_1B25CCA0C();
    swift_bridgeObjectRelease();
  }
  v4 = swift_allocObject();
  *(_QWORD *)(v4 + 16) = a2;
  v6[4] = sub_1B2599A80;
  v6[5] = v4;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 1107296256;
  v6[2] = sub_1B259950C;
  v6[3] = &block_descriptor_15;
  v5 = _Block_copy(v6);
  swift_bridgeObjectRetain();
  swift_release();
  AnalyticsSendEventLazy();
  _Block_release(v5);

}

void sub_1B25991B4(uint64_t a1)
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t *v6;
  unint64_t *v7;
  unint64_t v8;
  uint64_t v9;
  unint64_t i;
  int64_t v11;
  unint64_t v12;
  int64_t v13;
  int64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  unint64_t v19;
  char v20;
  uint64_t v21;
  unint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  unint64_t *v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  BOOL v30;
  uint64_t v31;
  int64_t v32;
  uint64_t v33;
  uint64_t v34;
  int64_t v35;
  uint64_t v36;
  char v37[32];
  _QWORD v38[2];
  uint64_t v39;
  _QWORD v40[6];

  if (*(_QWORD *)(a1 + 16))
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EEFDB460);
    v2 = (_QWORD *)sub_1B25CD498();
  }
  else
  {
    v2 = (_QWORD *)MEMORY[0x1E0DEE9E0];
  }
  sub_1B2599AA4(a1, v40);
  v3 = v40[0];
  v4 = v40[3];
  v5 = v40[4];
  v32 = (unint64_t)(v40[2] + 64) >> 6;
  v33 = v40[1];
  v6 = &v39;
  swift_bridgeObjectRetain();
  v7 = &qword_1ED36D030;
  v8 = 0x1E0DE7910uLL;
  v9 = MEMORY[0x1E0DEE9B8] + 8;
  if (!v5)
    goto LABEL_6;
LABEL_5:
  v34 = (v5 - 1) & v5;
  v35 = v4;
  for (i = __clz(__rbit64(v5)) | (v4 << 6); ; i = __clz(__rbit64(v12)) + (v13 << 6))
  {
    v15 = (uint64_t *)(*(_QWORD *)(v3 + 48) + 16 * i);
    v17 = *v15;
    v16 = v15[1];
    sub_1B24BFFF8(*(_QWORD *)(v3 + 56) + 32 * i, (uint64_t)v6);
    v38[0] = v17;
    v38[1] = v16;
    sub_1B24BFFF8((uint64_t)v6, (uint64_t)v37);
    swift_bridgeObjectRetain_n();
    sub_1B2599ADC((uint64_t)v38);
    sub_1B24ADA58(0, v7);
    if (!swift_dynamicCast())
    {
      swift_bridgeObjectRelease();

      sub_1B24EADD4();
      swift_release();
      return;
    }
    v18 = sub_1B24E113C(v17, v16);
    v19 = v18;
    if ((v20 & 1) != 0)
    {
      v21 = v9;
      v22 = v8;
      v23 = v6;
      v24 = v3;
      v25 = v7;
      v26 = (uint64_t *)(v2[6] + 16 * v18);
      swift_bridgeObjectRelease();
      *v26 = v17;
      v26[1] = v16;
      v7 = v25;
      v3 = v24;
      v6 = v23;
      v8 = v22;
      v9 = v21;
      v27 = v2[7];

      *(_QWORD *)(v27 + 8 * v19) = v36;
      goto LABEL_28;
    }
    if (v2[2] >= v2[3])
      break;
    *(_QWORD *)((char *)v2 + ((v18 >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << v18;
    v28 = (uint64_t *)(v2[6] + 16 * v18);
    *v28 = v17;
    v28[1] = v16;
    *(_QWORD *)(v2[7] + 8 * v18) = v36;
    v29 = v2[2];
    v30 = __OFADD__(v29, 1);
    v31 = v29 + 1;
    if (v30)
      goto LABEL_33;
    v2[2] = v31;
LABEL_28:
    v5 = v34;
    v4 = v35;
    if (v34)
      goto LABEL_5;
LABEL_6:
    v11 = v4 + 1;
    if (__OFADD__(v4, 1))
      goto LABEL_34;
    if (v11 >= v32)
      goto LABEL_31;
    v12 = *(_QWORD *)(v33 + 8 * v11);
    v13 = v4 + 1;
    if (!v12)
    {
      v13 = v4 + 2;
      if (v4 + 2 >= v32)
        goto LABEL_31;
      v12 = *(_QWORD *)(v33 + 8 * v13);
      if (!v12)
      {
        v13 = v4 + 3;
        if (v4 + 3 >= v32)
          goto LABEL_31;
        v12 = *(_QWORD *)(v33 + 8 * v13);
        if (!v12)
        {
          v13 = v4 + 4;
          if (v4 + 4 >= v32)
            goto LABEL_31;
          v12 = *(_QWORD *)(v33 + 8 * v13);
          if (!v12)
          {
            v13 = v4 + 5;
            if (v4 + 5 >= v32)
              goto LABEL_31;
            v12 = *(_QWORD *)(v33 + 8 * v13);
            if (!v12)
            {
              v14 = v4 + 6;
              while (v14 < v32)
              {
                v12 = *(_QWORD *)(v33 + 8 * v14++);
                if (v12)
                {
                  v13 = v14 - 1;
                  goto LABEL_21;
                }
              }
LABEL_31:
              sub_1B24EADD4();
              return;
            }
          }
        }
      }
    }
LABEL_21:
    v34 = (v12 - 1) & v12;
    v35 = v13;
  }
  __break(1u);
LABEL_33:
  __break(1u);
LABEL_34:
  __break(1u);
}

id sub_1B259950C(uint64_t a1)
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
    sub_1B24ADA58(0, &qword_1ED36D030);
    v4 = (void *)sub_1B25CC8EC();
    swift_bridgeObjectRelease();
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

uint64_t sub_1B2599590(__int128 *a1)
{
  uint64_t inited;
  uint64_t v3;
  __int128 v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  uint64_t v8;
  uint64_t v9;
  char v10;
  uint64_t v11;
  __int128 v12;
  uint64_t v13;
  char v14;
  uint64_t v15;
  char v16;
  uint64_t v17;
  char v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;

  __swift_instantiateConcreteTypeFromMangledName(&qword_1EEFD9608);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_1B25E2110;
  *(_QWORD *)(inited + 32) = sub_1B25CCA18();
  *(_QWORD *)(inited + 40) = v3;
  v5 = MEMORY[0x1E0DEA968];
  v22 = *a1;
  v4 = v22;
  *(_QWORD *)(inited + 72) = MEMORY[0x1E0DEA968];
  *(_OWORD *)(inited + 48) = v4;
  *(_QWORD *)(inited + 80) = sub_1B25CCA18();
  *(_QWORD *)(inited + 88) = v6;
  v21 = a1[1];
  v7 = v21;
  *(_QWORD *)(inited + 120) = v5;
  *(_OWORD *)(inited + 96) = v7;
  *(_QWORD *)(inited + 128) = sub_1B25CCA18();
  *(_QWORD *)(inited + 136) = v8;
  v9 = MEMORY[0x1E0DEAFA0];
  v10 = *((_BYTE *)a1 + 32);
  *(_QWORD *)(inited + 168) = MEMORY[0x1E0DEAFA0];
  *(_BYTE *)(inited + 144) = v10;
  *(_QWORD *)(inited + 176) = sub_1B25CCA18();
  *(_QWORD *)(inited + 184) = v11;
  v20 = *(__int128 *)((char *)a1 + 40);
  v12 = v20;
  *(_QWORD *)(inited + 216) = v5;
  *(_OWORD *)(inited + 192) = v12;
  *(_QWORD *)(inited + 224) = sub_1B25CCA18();
  *(_QWORD *)(inited + 232) = v13;
  v14 = *((_BYTE *)a1 + 56);
  *(_QWORD *)(inited + 264) = v9;
  *(_BYTE *)(inited + 240) = v14;
  *(_QWORD *)(inited + 272) = sub_1B25CCA18();
  *(_QWORD *)(inited + 280) = v15;
  v16 = *((_BYTE *)a1 + 57);
  *(_QWORD *)(inited + 312) = v9;
  *(_BYTE *)(inited + 288) = v16;
  *(_QWORD *)(inited + 320) = sub_1B25CCA18();
  *(_QWORD *)(inited + 328) = v17;
  v18 = *((_BYTE *)a1 + 58);
  *(_QWORD *)(inited + 360) = v9;
  *(_BYTE *)(inited + 336) = v18;
  sub_1B2599A34((uint64_t)&v22);
  sub_1B2599A34((uint64_t)&v21);
  sub_1B2599A34((uint64_t)&v20);
  return sub_1B25CC904();
}

uint64_t sub_1B259971C(__int128 *a1)
{
  uint64_t v1;

  sub_1B2599590(a1);
  sub_1B25CCA18();
  v1 = swift_bridgeObjectRetain();
  OUTLINED_FUNCTION_4_17(v1);
  OUTLINED_FUNCTION_5_16(100);
  return OUTLINED_FUNCTION_2_14();
}

uint64_t sub_1B259978C(__int128 *a1)
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

  sub_1B2599590(a1);
  sub_1B25CCA18();
  OUTLINED_FUNCTION_3_16();
  OUTLINED_FUNCTION_1_11(v1, v2, v3, v4, v5);
  sub_1B25CCA18();
  OUTLINED_FUNCTION_3_16();
  OUTLINED_FUNCTION_1_11(v6, v7, v8, v9, v10);
  OUTLINED_FUNCTION_5_16(103);
  return OUTLINED_FUNCTION_2_14();
}

uint64_t sub_1B2599810(__int128 *a1, uint64_t a2, uint64_t a3, void *a4)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD v11[3];
  uint64_t v12;
  uint64_t v13;

  v13 = sub_1B2599590(a1);
  v7 = sub_1B25CCA18();
  v9 = v8;
  v12 = MEMORY[0x1E0DEA968];
  v11[0] = a2;
  v11[1] = a3;
  swift_bridgeObjectRetain();
  sub_1B2549250((uint64_t)v11, v7, v9);
  sub_1B25CCA18();
  v12 = sub_1B24ADA58(0, &qword_1EEFD67D0);
  v11[0] = a4;
  OUTLINED_FUNCTION_4_17((uint64_t)a4);
  OUTLINED_FUNCTION_5_16(105);
  return swift_bridgeObjectRelease();
}

uint64_t sub_1B25998E8(__int128 *a1, double *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  double v55;
  double v56;
  double v57;
  double v58;
  double v59;
  double v60;
  double v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  double v70;
  double v71;
  double v72;
  double v73;
  double v74;
  double v75;
  double v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  double v85;
  double v86;
  double v87;
  double v88;
  double v89;
  double v90;
  double v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  double v100;
  double v101;
  double v102;
  double v103;
  double v104;
  double v105;
  double v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  double v115;
  double v116;
  double v117;
  double v118;
  double v119;
  double v120;
  double v121;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t v128;
  uint64_t v129;
  uint64_t v130;
  double v131;
  double v132;
  double v133;
  double v134;
  double v135;
  double v136;
  double v137;
  double v138;
  uint64_t v139;
  uint64_t v140;
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
  uint64_t v156;
  uint64_t v157;
  uint64_t v158;
  uint64_t v159;
  uint64_t v160;
  uint64_t v161;
  uint64_t v162;

  sub_1B2599590(a1);
  sub_1B25CCA18();
  OUTLINED_FUNCTION_3_16();
  OUTLINED_FUNCTION_0_9(a2[9] / 1000.0, v3, v4, v5, v6, v7, v8, v9, v10, 1000.0, v11, v12, v13, v14, v15, v16, v123, v131, v139,
    v147,
    v155);
  sub_1B25CCA18();
  OUTLINED_FUNCTION_3_16();
  OUTLINED_FUNCTION_0_9(a2[8], v17, v18, v19, v20, v21, v22, v23, v24, v25, v26, v27, v28, v29, v30, v31, v124, v132, v140,
    v148,
    v156);
  sub_1B25CCA18();
  OUTLINED_FUNCTION_3_16();
  OUTLINED_FUNCTION_0_9(a2[32], v32, v33, v34, v35, v36, v37, v38, v39, v40, v41, v42, v43, v44, v45, v46, v125, v133, v141,
    v149,
    v157);
  sub_1B25CCA18();
  OUTLINED_FUNCTION_3_16();
  OUTLINED_FUNCTION_0_9(a2[33], v47, v48, v49, v50, v51, v52, v53, v54, v55, v56, v57, v58, v59, v60, v61, v126, v134, v142,
    v150,
    v158);
  sub_1B25CCA18();
  OUTLINED_FUNCTION_3_16();
  OUTLINED_FUNCTION_0_9(a2[34], v62, v63, v64, v65, v66, v67, v68, v69, v70, v71, v72, v73, v74, v75, v76, v127, v135, v143,
    v151,
    v159);
  sub_1B25CCA18();
  OUTLINED_FUNCTION_3_16();
  OUTLINED_FUNCTION_0_9(a2[35], v77, v78, v79, v80, v81, v82, v83, v84, v85, v86, v87, v88, v89, v90, v91, v128, v136, v144,
    v152,
    v160);
  sub_1B25CCA18();
  OUTLINED_FUNCTION_3_16();
  OUTLINED_FUNCTION_0_9(a2[36], v92, v93, v94, v95, v96, v97, v98, v99, v100, v101, v102, v103, v104, v105, v106, v129, v137, v145,
    v153,
    v161);
  sub_1B25CCA18();
  OUTLINED_FUNCTION_3_16();
  OUTLINED_FUNCTION_0_9(a2[37], v107, v108, v109, v110, v111, v112, v113, v114, v115, v116, v117, v118, v119, v120, v121, v130, v138, v146,
    v154,
    v162);
  OUTLINED_FUNCTION_5_16(106);
  return OUTLINED_FUNCTION_2_14();
}

uint64_t type metadata accessor for CoreAnalyticsLoggingHelper()
{
  return objc_opt_self();
}

uint64_t sub_1B2599A34(uint64_t a1)
{
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t sub_1B2599A5C()
{
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

void sub_1B2599A80()
{
  uint64_t v0;

  sub_1B25991B4(*(_QWORD *)(v0 + 16));
}

uint64_t block_copy_helper_12(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_12()
{
  return swift_release();
}

uint64_t sub_1B2599AA4@<X0>(uint64_t a1@<X0>, _QWORD *a2@<X8>)
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

uint64_t sub_1B2599ADC(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(qword_1EEFDB468);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

void OUTLINED_FUNCTION_0_9(double a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, double a10, double a11, double a12, double a13, double a14, double a15, double a16, uint64_t a17, double a18, uint64_t a19, uint64_t a20,uint64_t a21)
{
  uint64_t v14;

  a21 = v14;
  a18 = a1;
  sub_1B2549250((uint64_t)&a18, a4, a5);
}

void OUTLINED_FUNCTION_1_11(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, ...)
{
  va_list va;

  va_start(va, a5);
  sub_1B2549250((uint64_t)va, a3, a4);
}

uint64_t OUTLINED_FUNCTION_2_14()
{
  return swift_bridgeObjectRelease();
}

void OUTLINED_FUNCTION_4_17(uint64_t a1, ...)
{
  uint64_t v1;
  uint64_t v2;
  va_list va;

  va_start(va, a1);
  sub_1B2549250((uint64_t)va, v1, v2);
}

void OUTLINED_FUNCTION_5_16(uint64_t a1)
{
  uint64_t v1;

  sub_1B25990D4(a1, v1);
}

void sub_1B2599B84(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v9;

  v9 = sub_1B25CCBE0();
  if (MEMORY[0x1B5E24BD4](v9, a5))
    sub_1B259A40C(v9, a5, a7);
  else
    swift_bridgeObjectRelease();
  type metadata accessor for UniquedSequence.Iterator();
}

uint64_t sub_1B2599C1C(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t AssociatedTypeWitness;
  uint64_t result;
  _QWORD *v9;

  *(_QWORD *)(v3 + *(int *)(a1 + 56)) = v5;
  OUTLINED_FUNCTION_4_18();
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(AssociatedTypeWitness - 8) + 32))(v3, v4, AssociatedTypeWitness);
  v9 = (_QWORD *)(v3 + *(int *)(a1 + 52));
  *v9 = v2;
  v9[1] = v1;
  return result;
}

uint64_t sub_1B2599C88@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t AssociatedTypeWitness;
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
  void (*v23)(char *, char *, uint64_t);
  char v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t AssociatedConformanceWitness;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;

  v4 = v3;
  v31 = a3;
  v6 = *(_QWORD *)(a1 + 24);
  v34 = *(_QWORD *)(v6 - 8);
  v7 = MEMORY[0x1E0C80A78](a1, a2);
  v9 = MEMORY[0x1E0C80A78](v7, v8);
  v11 = (char *)&v28 - v10;
  v33 = *(_QWORD *)(v9 + 32);
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v13 = sub_1B25CD108();
  v29 = *(_QWORD *)(v13 - 8);
  v30 = v13;
  OUTLINED_FUNCTION_0_10();
  MEMORY[0x1E0C80A78](v14, v15);
  v17 = (char *)&v28 - v16;
  v35 = *(_QWORD *)(AssociatedTypeWitness - 8);
  OUTLINED_FUNCTION_0_10();
  MEMORY[0x1E0C80A78](v18, v19);
  v21 = (char *)&v28 - v20;
  v22 = swift_getAssociatedTypeWitness();
  AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
  v33 = v22;
  sub_1B25CD114();
  if (__swift_getEnumTagSinglePayload((uint64_t)v17, 1, AssociatedTypeWitness) == 1)
  {
LABEL_5:
    (*(void (**)(char *, uint64_t))(v29 + 8))(v17, v30);
    v25 = 1;
    v26 = v31;
  }
  else
  {
    v23 = *(void (**)(char *, char *, uint64_t))(v35 + 32);
    while (1)
    {
      v23(v21, v17, AssociatedTypeWitness);
      (*(void (**)(char *))(v4 + *(int *)(a1 + 52)))(v21);
      OUTLINED_FUNCTION_4_18();
      sub_1B25CCE80();
      v24 = sub_1B25CCE68();
      (*(void (**)(char *, uint64_t))(v34 + 8))(v11, v6);
      if ((v24 & 1) != 0)
        break;
      (*(void (**)(char *, uint64_t))(v35 + 8))(v21, AssociatedTypeWitness);
      sub_1B25CD114();
      if (__swift_getEnumTagSinglePayload((uint64_t)v17, 1, AssociatedTypeWitness) == 1)
        goto LABEL_5;
    }
    v26 = v31;
    v23((char *)v31, v21, AssociatedTypeWitness);
    v25 = 0;
  }
  return __swift_storeEnumTagSinglePayload(v26, v25, 1, AssociatedTypeWitness);
}

void sub_1B2599F10(uint64_t a1, uint64_t a2)
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
  char *v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;

  v3 = v2;
  v5 = *(_QWORD *)(a1 + 16);
  v6 = *(_QWORD *)(v5 - 8);
  v7 = MEMORY[0x1E0C80A78](a1, a2);
  v9 = (char *)&v20 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = *(_QWORD *)(v7 + 32);
  swift_getAssociatedTypeWitness();
  OUTLINED_FUNCTION_0_10();
  MEMORY[0x1E0C80A78](v11, v12);
  v14 = (char *)&v20 - v13;
  (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))(v9, v3, v5);
  sub_1B25CCB38();
  v15 = (uint64_t *)(v3 + *(int *)(a1 + 52));
  v16 = *v15;
  v17 = v15[1];
  v18 = *(_QWORD *)(a1 + 24);
  v19 = *(_QWORD *)(a1 + 40);
  swift_retain();
  sub_1B2599B84((uint64_t)v14, v16, v17, v5, v18, v10, v19);
}

void sub_1B259A028(uint64_t a1, uint64_t a2)
{
  sub_1B2599F10(a1, a2);
}

uint64_t sub_1B259A03C()
{
  uint64_t v0;
  uint64_t v1;

  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v0 - 8) + 8))(v1, v0);
}

uint64_t Sequence.uniqued<A>(on:)(void (*a1)(char *), uint64_t a2, uint64_t a3, uint64_t a4, void (*a5)(char *, char *, uint64_t), uint64_t a6)
{
  uint64_t v6;
  uint64_t v8;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t AssociatedTypeWitness;
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
  char *v25;
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
  char v39;
  char *v40;
  _QWORD v42[2];
  uint64_t v43;
  void (*v44)(char *, char *, uint64_t);
  char *v45;
  uint64_t v46;
  uint64_t v47;
  void (*v48)(char *);
  uint64_t v49;
  uint64_t v50;
  char *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;

  v49 = a2;
  v50 = a6;
  v8 = a4;
  v48 = a1;
  v46 = *(_QWORD *)(a4 - 8);
  MEMORY[0x1E0C80A78](a1, a2);
  OUTLINED_FUNCTION_29_7();
  v47 = v10;
  MEMORY[0x1E0C80A78](v11, v12);
  v45 = (char *)v42 - v13;
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v53 = *(_QWORD *)(AssociatedTypeWitness - 8);
  MEMORY[0x1E0C80A78](AssociatedTypeWitness, v15);
  OUTLINED_FUNCTION_29_7();
  v43 = v16;
  MEMORY[0x1E0C80A78](v17, v18);
  v20 = (char *)v42 - v19;
  sub_1B25CD108();
  OUTLINED_FUNCTION_0_10();
  v23 = MEMORY[0x1E0C80A78](v21, v22);
  v25 = (char *)v42 - v24;
  v26 = *(_QWORD *)(a3 - 8);
  MEMORY[0x1E0C80A78](v23, v27);
  v29 = (char *)v42 - ((v28 + 15) & 0xFFFFFFFFFFFFFFF0);
  v44 = a5;
  v30 = a3;
  v52 = swift_getAssociatedTypeWitness();
  v42[1] = *(_QWORD *)(v52 - 8);
  OUTLINED_FUNCTION_0_10();
  MEMORY[0x1E0C80A78](v31, v32);
  v51 = (char *)v42 - v33;
  OUTLINED_FUNCTION_4_18();
  v34 = sub_1B25CCBE0();
  if (MEMORY[0x1B5E24BD4](v34, v8))
  {
    v35 = sub_1B259A40C(v34, v8, v50);
  }
  else
  {
    swift_bridgeObjectRelease();
    v35 = MEMORY[0x1E0DEE9E8];
  }
  v36 = v42[0];
  v55 = v35;
  v54 = sub_1B25CCBE0();
  (*(void (**)(char *, uint64_t, uint64_t))(v26 + 16))(v29, v36, v30);
  sub_1B25CCB38();
  swift_getAssociatedConformanceWitness();
  sub_1B25CD114();
  if (__swift_getEnumTagSinglePayload((uint64_t)v25, 1, AssociatedTypeWitness) == 1)
  {
LABEL_10:
    OUTLINED_FUNCTION_2_15();
    swift_bridgeObjectRelease();
    return v54;
  }
  else
  {
    v44 = *(void (**)(char *, char *, uint64_t))(v53 + 32);
    while (1)
    {
      v44(v20, v25, AssociatedTypeWitness);
      v48(v20);
      if (v6)
        break;
      OUTLINED_FUNCTION_4_18();
      sub_1B25CCE80();
      v37 = v8;
      v38 = v45;
      v39 = sub_1B25CCE68();
      v40 = v38;
      v8 = v37;
      (*(void (**)(char *, uint64_t))(v46 + 8))(v40, v37);
      if ((v39 & 1) != 0)
      {
        (*(void (**)(uint64_t, char *, uint64_t))(v53 + 16))(v43, v20, AssociatedTypeWitness);
        sub_1B25CCC34();
        sub_1B25CCC1C();
      }
      OUTLINED_FUNCTION_1_12();
      sub_1B25CD114();
      if (__swift_getEnumTagSinglePayload((uint64_t)v25, 1, AssociatedTypeWitness) == 1)
        goto LABEL_10;
    }
    OUTLINED_FUNCTION_1_12();
    OUTLINED_FUNCTION_2_15();
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
}

uint64_t sub_1B259A40C(uint64_t a1, uint64_t a2, uint64_t a3)
{
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
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  char v19;
  uint64_t (*v20)(char *, unint64_t, uint64_t);
  uint64_t result;
  BOOL v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;
  unint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  char v34;
  void (*v35)(char *, uint64_t);
  char *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  char *v40;
  uint64_t v41;
  uint64_t v42;
  void (*v43)(char *, char *, uint64_t);
  uint64_t v44;
  uint64_t v45;
  char *v46;
  uint64_t v47;
  uint64_t v48;

  v5 = a1;
  v47 = *(_QWORD *)(a2 - 8);
  v6 = MEMORY[0x1E0C80A78](a1, a2);
  v8 = (char *)&v39 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = MEMORY[0x1E0C80A78](v6, v9);
  v46 = (char *)&v39 - v11;
  v39 = v12;
  v14 = MEMORY[0x1E0C80A78](v10, v13);
  v16 = (char *)&v39 - v15;
  if (MEMORY[0x1B5E24BBC](v14))
  {
    sub_1B25CD2C4();
    v17 = sub_1B25CD2B8();
  }
  else
  {
    v17 = MEMORY[0x1E0DEE9E8];
  }
  v42 = MEMORY[0x1B5E24BD4](v5, a2);
  if (v42)
  {
    v18 = 0;
    v45 = v17 + 56;
    v40 = v16;
    v41 = v5;
    while (1)
    {
      v19 = sub_1B25CCBF8();
      sub_1B25CCBC8();
      if ((v19 & 1) != 0)
      {
        v20 = *(uint64_t (**)(char *, unint64_t, uint64_t))(v47 + 16);
        result = v20(v16, v5+ ((*(unsigned __int8 *)(v47 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v47 + 80))+ *(_QWORD *)(v47 + 72) * v18, a2);
      }
      else
      {
        result = sub_1B25CD30C();
        if (v39 != 8)
          goto LABEL_24;
        v48 = result;
        v20 = *(uint64_t (**)(char *, unint64_t, uint64_t))(v47 + 16);
        v20(v16, (unint64_t)&v48, a2);
        result = swift_unknownObjectRelease();
      }
      v22 = __OFADD__(v18, 1);
      v23 = v18 + 1;
      if (v22)
        break;
      v24 = v47;
      v43 = *(void (**)(char *, char *, uint64_t))(v47 + 32);
      v44 = v23;
      v43(v46, v16, a2);
      v25 = sub_1B25CC910();
      v26 = -1 << *(_BYTE *)(v17 + 32);
      v27 = v25 & ~v26;
      v28 = v27 >> 6;
      v29 = *(_QWORD *)(v45 + 8 * (v27 >> 6));
      v30 = 1 << v27;
      v31 = *(_QWORD *)(v24 + 72);
      if (((1 << v27) & v29) != 0)
      {
        v32 = ~v26;
        while (1)
        {
          v20(v8, *(_QWORD *)(v17 + 48) + v31 * v27, a2);
          v33 = a3;
          v34 = sub_1B25CC994();
          v35 = *(void (**)(char *, uint64_t))(v47 + 8);
          v35(v8, a2);
          if ((v34 & 1) != 0)
            break;
          v27 = (v27 + 1) & v32;
          v28 = v27 >> 6;
          v29 = *(_QWORD *)(v45 + 8 * (v27 >> 6));
          v30 = 1 << v27;
          a3 = v33;
          if ((v29 & (1 << v27)) == 0)
          {
            v16 = v40;
            v5 = v41;
            goto LABEL_14;
          }
        }
        v35(v46, a2);
        a3 = v33;
        v16 = v40;
        v5 = v41;
      }
      else
      {
LABEL_14:
        v36 = v46;
        *(_QWORD *)(v45 + 8 * v28) = v30 | v29;
        result = ((uint64_t (*)(unint64_t, char *, uint64_t))v43)(*(_QWORD *)(v17 + 48) + v31 * v27, v36, a2);
        v37 = *(_QWORD *)(v17 + 16);
        v22 = __OFADD__(v37, 1);
        v38 = v37 + 1;
        if (v22)
          goto LABEL_23;
        *(_QWORD *)(v17 + 16) = v38;
      }
      v18 = v44;
      if (v44 == v42)
        goto LABEL_21;
    }
    __break(1u);
LABEL_23:
    __break(1u);
LABEL_24:
    __break(1u);
  }
  else
  {
LABEL_21:
    swift_bridgeObjectRelease();
    return v17;
  }
  return result;
}

void sub_1B259A718()
{
  JUMPOUT(0x1B5E261DCLL);
}

void sub_1B259A728()
{
  JUMPOUT(0x1B5E261DCLL);
}

void type metadata accessor for UniquedSequence.Iterator()
{
  JUMPOUT(0x1B5E26140);
}

uint64_t sub_1B259A744()
{
  uint64_t result;
  unint64_t v1;

  result = swift_getAssociatedTypeWitness();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t *sub_1B259A7E0(uint64_t *a1, uint64_t *a2)
{
  uint64_t AssociatedTypeWitness;
  uint64_t v5;
  uint64_t v6;
  int v7;
  uint64_t v9;
  _QWORD *v10;
  _QWORD *v11;
  uint64_t v12;

  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v5 = *(_QWORD *)(AssociatedTypeWitness - 8);
  v6 = *(_QWORD *)(v5 + 64);
  v7 = *(_DWORD *)(v5 + 80);
  if ((v7 & 0x1000F8) != 0 || ((((v6 + 7) & 0xFFFFFFFFFFFFFFF8) + 23) & 0xFFFFFFFFFFFFFFF8) + 8 > 0x18)
  {
    v9 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v9 + ((unsigned __int16)((v7 & 0xF8) + 23) & (unsigned __int16)~(v7 & 0xF8) & 0x1F8));
    swift_retain();
  }
  else
  {
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(v5 + 16))(a1, a2, AssociatedTypeWitness);
    v10 = (_QWORD *)(((unint64_t)a1 + v6 + 7) & 0xFFFFFFFFFFFFFFF8);
    v11 = (_QWORD *)(((unint64_t)a2 + v6 + 7) & 0xFFFFFFFFFFFFFFF8);
    v12 = v11[1];
    *v10 = *v11;
    v10[1] = v12;
    *(_QWORD *)(((unint64_t)v10 + 23) & 0xFFFFFFFFFFFFF8) = *(_QWORD *)(((unint64_t)v11 + 23) & 0xFFFFFFFFFFFFF8);
    swift_retain();
    swift_bridgeObjectRetain();
  }
  return a1;
}

uint64_t sub_1B259A8DC(uint64_t a1)
{
  uint64_t AssociatedTypeWitness;

  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(AssociatedTypeWitness - 8) + 8))(a1, AssociatedTypeWitness);
  swift_release();
  return swift_bridgeObjectRelease();
}

uint64_t sub_1B259A954(uint64_t a1, uint64_t a2)
{
  uint64_t AssociatedTypeWitness;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;
  _QWORD *v8;
  uint64_t v9;

  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v5 = *(_QWORD *)(AssociatedTypeWitness - 8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 16))(a1, a2, AssociatedTypeWitness);
  v6 = *(_QWORD *)(v5 + 64) + 7;
  v7 = (_QWORD *)((v6 + a1) & 0xFFFFFFFFFFFFFFF8);
  v8 = (_QWORD *)((v6 + a2) & 0xFFFFFFFFFFFFFFF8);
  v9 = v8[1];
  *v7 = *v8;
  v7[1] = v9;
  *(_QWORD *)(((unint64_t)v7 + 23) & 0xFFFFFFFFFFFFF8) = *(_QWORD *)(((unint64_t)v8 + 23) & 0xFFFFFFFFFFFFF8);
  swift_retain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t sub_1B259A9FC(uint64_t a1, uint64_t a2)
{
  uint64_t AssociatedTypeWitness;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;
  _QWORD *v8;
  uint64_t v9;

  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v5 = *(_QWORD *)(AssociatedTypeWitness - 8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 24))(a1, a2, AssociatedTypeWitness);
  v6 = *(_QWORD *)(v5 + 64) + 7;
  v7 = (_QWORD *)((v6 + a1) & 0xFFFFFFFFFFFFFFF8);
  v8 = (_QWORD *)((v6 + a2) & 0xFFFFFFFFFFFFFFF8);
  v9 = v8[1];
  *v7 = *v8;
  v7[1] = v9;
  swift_retain();
  swift_release();
  *(_QWORD *)(((unint64_t)v7 + 23) & 0xFFFFFFFFFFFFFFF8) = *(_QWORD *)(((unint64_t)v8 + 23) & 0xFFFFFFFFFFFFF8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_1B259AAB8(uint64_t a1, uint64_t a2)
{
  uint64_t AssociatedTypeWitness;
  uint64_t v5;
  uint64_t v6;
  _OWORD *v7;
  _OWORD *v8;

  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v5 = *(_QWORD *)(AssociatedTypeWitness - 8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 32))(a1, a2, AssociatedTypeWitness);
  v6 = *(_QWORD *)(v5 + 64) + 7;
  v7 = (_OWORD *)((v6 + a1) & 0xFFFFFFFFFFFFFFF8);
  v8 = (_OWORD *)((v6 + a2) & 0xFFFFFFFFFFFFFFF8);
  *v7 = *v8;
  *(_QWORD *)(((unint64_t)v7 + 23) & 0xFFFFFFFFFFFFF8) = *(_QWORD *)(((unint64_t)v8 + 23) & 0xFFFFFFFFFFFFF8);
  return a1;
}

uint64_t sub_1B259AB4C(uint64_t a1, uint64_t a2)
{
  uint64_t AssociatedTypeWitness;
  uint64_t v5;
  uint64_t v6;
  _OWORD *v7;
  uint64_t v8;
  unint64_t v9;

  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v5 = *(_QWORD *)(AssociatedTypeWitness - 8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 40))(a1, a2, AssociatedTypeWitness);
  v6 = *(_QWORD *)(v5 + 64) + 7;
  v7 = (_OWORD *)((v6 + a1) & 0xFFFFFFFFFFFFFFF8);
  v8 = v6 + a2;
  v9 = (v8 & 0xFFFFFFFFFFFFFFF8) + 23;
  *v7 = *(_OWORD *)(v8 & 0xFFFFFFFFFFFFFFF8);
  swift_release();
  *(_QWORD *)(((unint64_t)v7 + 23) & 0xFFFFFFFFFFFFFFF8) = *(_QWORD *)(v9 & 0xFFFFFFFFFFFFF8);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_1B259ABF4(uint64_t a1, unsigned int a2)
{
  uint64_t AssociatedTypeWitness;
  uint64_t v5;
  uint64_t v6;
  unsigned int v7;
  uint64_t v8;
  unsigned int v9;
  unsigned int v10;
  uint64_t v11;
  unint64_t v13;

  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v5 = *(_QWORD *)(AssociatedTypeWitness - 8);
  v6 = *(unsigned int *)(v5 + 84);
  if (v6 <= 0x7FFFFFFF)
    v7 = 0x7FFFFFFF;
  else
    v7 = *(_DWORD *)(v5 + 84);
  if (!a2)
    return 0;
  v8 = *(_QWORD *)(v5 + 64);
  if (v7 < a2)
  {
    if (((((((v8 + 7) & 0xFFFFFFFFFFFFFFF8) + 23) & 0xFFFFFFFFFFFFFFF8) + 8) & 0xFFFFFFF8) != 0)
      v9 = 2;
    else
      v9 = a2 - v7 + 1;
    if (v9 >= 0x10000)
      v10 = 4;
    else
      v10 = 2;
    if (v9 < 0x100)
      v10 = 1;
    if (v9 >= 2)
      v11 = v10;
    else
      v11 = 0;
    __asm { BR              X14 }
  }
  if (v6 >= 0x7FFFFFFF)
    return __swift_getEnumTagSinglePayload(a1, v6, AssociatedTypeWitness);
  v13 = *(_QWORD *)((a1 + v8 + 7) & 0xFFFFFFFFFFFFF8);
  if (v13 >= 0xFFFFFFFF)
    LODWORD(v13) = -1;
  return (v13 + 1);
}

void sub_1B259AD3C(unsigned int *a1, unsigned int a2, unsigned int a3)
{
  uint64_t v6;
  unsigned int v7;
  unsigned int v8;
  int v9;
  int v10;
  unsigned int v11;

  v6 = *(_QWORD *)(swift_getAssociatedTypeWitness() - 8);
  if (*(_DWORD *)(v6 + 84) <= 0x7FFFFFFFu)
    v7 = 0x7FFFFFFF;
  else
    v7 = *(_DWORD *)(v6 + 84);
  if (v7 >= a3)
  {
    v10 = 0u;
  }
  else
  {
    if (((((*(_DWORD *)(v6 + 64) + 7) & 0xFFFFFFF8) + 23) & 0xFFFFFFF8) == 0xFFFFFFF8)
      v8 = a3 - v7 + 1;
    else
      v8 = 2;
    if (v8 >= 0x10000)
      v9 = 4;
    else
      v9 = 2;
    if (v8 < 0x100)
      v9 = 1;
    if (v8 >= 2)
      v10 = v9;
    else
      v10 = 0;
  }
  if (a2 > v7)
  {
    if (((((*(_DWORD *)(v6 + 64) + 7) & 0xFFFFFFF8) + 23) & 0xFFFFFFF8) != 0xFFFFFFF8)
    {
      v11 = ~v7 + a2;
      bzero(a1, ((((*(_QWORD *)(v6 + 64) + 7) & 0xFFFFFFFFFFFFFFF8) + 23) & 0xFFFFFFFFFFFFFFF8) + 8);
      *a1 = v11;
    }
    __asm { BR              X10 }
  }
  __asm { BR              X11 }
}

uint64_t sub_1B259AE54@<X0>(uint64_t a1@<X2>, uint64_t a2@<X3>, uint64_t a3@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t result;
  _QWORD *v7;
  uint64_t v8;

  *(_BYTE *)(v3 + v5) = 0;
  if ((_DWORD)v4)
  {
    if (a1 < 0x7FFFFFFF)
    {
      v7 = (_QWORD *)((v3 + a3 + 7) & 0xFFFFFFFFFFFFFFF8);
      if ((v4 & 0x80000000) != 0)
      {
        v8 = v4 ^ 0x80000000;
        v7[1] = 0;
      }
      else
      {
        v8 = (v4 - 1);
      }
      *v7 = v8;
    }
    else
    {
      return __swift_storeEnumTagSinglePayload(v3, v4, a1, a2);
    }
  }
  return result;
}

uint64_t sub_1B259AEE8()
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

uint64_t *sub_1B259AF60(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  uint64_t v9;
  _QWORD *v10;
  uint64_t v11;
  _QWORD *v12;

  v4 = a1;
  v5 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  v6 = *(_QWORD *)(v5 + 64);
  v7 = *(_DWORD *)(v5 + 80);
  if ((v7 & 0x1000F8) != 0 || ((v6 + 7) & 0xFFFFFFFFFFFFFFF8) + 16 > 0x18)
  {
    v9 = *a2;
    *v4 = *a2;
    v4 = (uint64_t *)(v9 + ((unsigned __int16)((v7 & 0xF8) + 23) & (unsigned __int16)~(v7 & 0xF8) & 0x1F8));
  }
  else
  {
    (*(void (**)(uint64_t *, uint64_t *))(v5 + 16))(a1, a2);
    v10 = (_QWORD *)(((unint64_t)a2 + v6 + 7) & 0xFFFFFFFFFFFFFFF8);
    v11 = v10[1];
    v12 = (_QWORD *)(((unint64_t)v4 + v6 + 7) & 0xFFFFFFFFFFFFFFF8);
    *v12 = *v10;
    v12[1] = v11;
  }
  swift_retain();
  return v4;
}

uint64_t sub_1B259B010(uint64_t a1, uint64_t a2)
{
  (*(void (**)(void))(*(_QWORD *)(*(_QWORD *)(a2 + 16) - 8) + 8))();
  return swift_release();
}

uint64_t sub_1B259B050(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;
  _QWORD *v8;
  uint64_t v9;

  v5 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  (*(void (**)(void))(v5 + 16))();
  v6 = *(_QWORD *)(v5 + 64) + 7;
  v7 = (_QWORD *)((v6 + a1) & 0xFFFFFFFFFFFFFFF8);
  v8 = (_QWORD *)((v6 + a2) & 0xFFFFFFFFFFFFFFF8);
  v9 = v8[1];
  *v7 = *v8;
  v7[1] = v9;
  swift_retain();
  return a1;
}

uint64_t sub_1B259B0B0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;
  _QWORD *v8;
  uint64_t v9;

  v5 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  (*(void (**)(void))(v5 + 24))();
  v6 = *(_QWORD *)(v5 + 64) + 7;
  v7 = (_QWORD *)((v6 + a1) & 0xFFFFFFFFFFFFFFF8);
  v8 = (_QWORD *)((v6 + a2) & 0xFFFFFFFFFFFFFFF8);
  v9 = v8[1];
  *v7 = *v8;
  v7[1] = v9;
  swift_retain();
  swift_release();
  return a1;
}

uint64_t sub_1B259B11C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;

  v5 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  (*(void (**)(void))(v5 + 32))();
  *(_OWORD *)((*(_QWORD *)(v5 + 64) + 7 + a1) & 0xFFFFFFFFFFFFF8) = *(_OWORD *)((*(_QWORD *)(v5 + 64) + 7 + a2) & 0xFFFFFFFFFFFFF8);
  return a1;
}

uint64_t sub_1B259B178(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;

  v5 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  (*(void (**)(void))(v5 + 40))();
  *(_OWORD *)((*(_QWORD *)(v5 + 64) + 7 + a1) & 0xFFFFFFFFFFFFFFF8) = *(_OWORD *)((*(_QWORD *)(v5 + 64) + 7 + a2) & 0xFFFFFFFFFFFFF8);
  swift_release();
  return a1;
}

uint64_t sub_1B259B1DC(uint64_t a1, unsigned int a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unsigned int v7;
  uint64_t v8;
  unsigned int v9;
  unsigned int v10;
  uint64_t v11;
  unint64_t v13;

  v4 = *(_QWORD *)(a3 + 16);
  v5 = *(_QWORD *)(v4 - 8);
  v6 = *(unsigned int *)(v5 + 84);
  if (v6 <= 0x7FFFFFFF)
    v7 = 0x7FFFFFFF;
  else
    v7 = *(_DWORD *)(v5 + 84);
  if (!a2)
    return 0;
  v8 = *(_QWORD *)(v5 + 64);
  if (v7 >= a2)
  {
    if (v6 < 0x7FFFFFFF)
    {
      v13 = *(_QWORD *)((a1 + v8 + 7) & 0xFFFFFFFFFFFFF8);
      if (v13 >= 0xFFFFFFFF)
        LODWORD(v13) = -1;
      return (v13 + 1);
    }
    else
    {
      return __swift_getEnumTagSinglePayload(a1, v6, v4);
    }
  }
  else
  {
    if (((((v8 + 7) & 0xFFFFFFFFFFFFFFF8) + 16) & 0xFFFFFFF8) != 0)
      v9 = 2;
    else
      v9 = a2 - v7 + 1;
    if (v9 >= 0x10000)
      v10 = 4;
    else
      v10 = 2;
    if (v9 < 0x100)
      v10 = 1;
    if (v9 >= 2)
      v11 = v10;
    else
      v11 = 0;
    return ((uint64_t (*)(void))((char *)&loc_1B259B258 + 4 * byte_1B25E214F[v11]))();
  }
}

void sub_1B259B2D8(unsigned int *a1, unsigned int a2, unsigned int a3, uint64_t a4)
{
  uint64_t v5;
  unsigned int v6;
  unsigned int v7;
  int v8;
  int v9;
  unsigned int v10;

  v5 = *(_QWORD *)(*(_QWORD *)(a4 + 16) - 8);
  if (*(_DWORD *)(v5 + 84) <= 0x7FFFFFFFu)
    v6 = 0x7FFFFFFF;
  else
    v6 = *(_DWORD *)(v5 + 84);
  if (v6 >= a3)
  {
    v9 = 0u;
  }
  else
  {
    if (((*(_DWORD *)(v5 + 64) + 7) & 0xFFFFFFF8) == 0xFFFFFFF0)
      v7 = a3 - v6 + 1;
    else
      v7 = 2;
    if (v7 >= 0x10000)
      v8 = 4;
    else
      v8 = 2;
    if (v7 < 0x100)
      v8 = 1;
    if (v7 >= 2)
      v9 = v8;
    else
      v9 = 0;
  }
  if (a2 > v6)
  {
    if (((*(_DWORD *)(v5 + 64) + 7) & 0xFFFFFFF8) != 0xFFFFFFF0)
    {
      v10 = ~v6 + a2;
      bzero(a1, ((*(_QWORD *)(v5 + 64) + 7) & 0xFFFFFFFFFFFFFFF8) + 16);
      *a1 = v10;
    }
    __asm { BR              X10 }
  }
  __asm { BR              X11 }
}

uint64_t sub_1B259B3C4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t result;
  _QWORD *v8;
  uint64_t v9;

  *(_BYTE *)(v5 + v6) = 0;
  if ((_DWORD)a2)
  {
    if (a3 < 0x7FFFFFFF)
    {
      v8 = (_QWORD *)((v5 + v4 + 7) & 0xFFFFFFFFFFFFFFF8);
      if ((a2 & 0x80000000) != 0)
      {
        v9 = a2 ^ 0x80000000;
        v8[1] = 0;
      }
      else
      {
        v9 = (a2 - 1);
      }
      *v8 = v9;
    }
    else
    {
      return __swift_storeEnumTagSinglePayload(v5, a2, a3, a4);
    }
  }
  return result;
}

void type metadata accessor for UniquedSequence()
{
  JUMPOUT(0x1B5E26140);
}

uint64_t OUTLINED_FUNCTION_1_12()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 96) + 8))(v0, v1);
}

uint64_t OUTLINED_FUNCTION_2_15()
{
  uint64_t v0;

  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 - 184) + 8))(*(_QWORD *)(v0 - 112), *(_QWORD *)(v0 - 104));
}

uint64_t OUTLINED_FUNCTION_4_18()
{
  return 0;
}

void sub_1B259B4A0()
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
  void *v11;
  id v12;
  uint64_t v13;

  v0 = sub_1B25CC6DC();
  v1 = *(_QWORD *)(v0 - 8);
  v3 = MEMORY[0x1E0C80A78](v0, v2);
  v5 = (char *)&v13 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v3, v6);
  v8 = (char *)&v13 - v7;
  sub_1B25CC6E8();
  sub_1B259B5CC();
  v10 = v9;
  (*(void (**)(char *, char *, uint64_t))(v1 + 16))(v5, v8, v0);
  if (!v10)
    sub_1B25CC6C4();
  OUTLINED_FUNCTION_1_13((uint64_t)v5);
  v11 = (void *)sub_1B25CCA0C();
  v12 = (id)_AFPreferencesReplacementLanguageForLocalRecognizerLanguageCode();

  if (v12)
  {
    sub_1B25CCA18();

    OUTLINED_FUNCTION_1_13((uint64_t)v8);
    swift_bridgeObjectRelease();
  }
  else
  {
    OUTLINED_FUNCTION_1_13((uint64_t)v8);
  }
  OUTLINED_FUNCTION_462();
}

void sub_1B259B5CC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD v15[2];

  v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEFD69A8);
  MEMORY[0x1E0C80A78](v0, v1);
  v3 = (char *)v15 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEFD69A0);
  MEMORY[0x1E0C80A78](v4, v5);
  v7 = (char *)v15 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1B25CC6B8();
  v8 = sub_1B25CC664();
  if (__swift_getEnumTagSinglePayload((uint64_t)v7, 1, v8) == 1)
  {
    v9 = &qword_1EEFD69A0;
    v10 = (uint64_t)v7;
  }
  else
  {
    v11 = sub_1B25CC640();
    v13 = v12;
    (*(void (**)(char *, uint64_t))(*(_QWORD *)(v8 - 8) + 8))(v7, v8);
    sub_1B25CC6D0();
    v14 = sub_1B25CC6A0();
    if (__swift_getEnumTagSinglePayload((uint64_t)v3, 1, v14) != 1)
    {
      sub_1B25CC640();
      (*(void (**)(char *, uint64_t))(*(_QWORD *)(v14 - 8) + 8))(v3, v14);
      v15[0] = v11;
      v15[1] = v13;
      sub_1B25CCAE4();
      sub_1B25CCAE4();
      swift_bridgeObjectRelease();
      goto LABEL_7;
    }
    swift_bridgeObjectRelease();
    v9 = &qword_1EEFD69A8;
    v10 = (uint64_t)v3;
  }
  sub_1B24C0034(v10, v9);
LABEL_7:
  OUTLINED_FUNCTION_462();
}

double sub_1B259B76C()
{
  unint64_t v0;
  mach_timebase_info v2[2];

  v2[1] = *(mach_timebase_info *)MEMORY[0x1E0C80C00];
  v2[0] = 0;
  mach_timebase_info(v2);
  if (!v2[0].numer)
    return 0.0;
  LODWORD(v0) = v2[0].denom;
  return (double)v0 / (double)v2[0].numer * 1000000000.0;
}

uint64_t OUTLINED_FUNCTION_1_13(uint64_t a1)
{
  uint64_t v1;
  uint64_t (*v2)(uint64_t, uint64_t);

  return v2(a1, v1);
}

uint64_t sub_1B259B7F0(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;

  v3 = v1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EEFD71C0);
  OUTLINED_FUNCTION_30_0();
  MEMORY[0x1E0C80A78](v5, v6);
  OUTLINED_FUNCTION_42_3();
  v7 = OUTLINED_FUNCTION_122_0();
  sub_1B259EF18(v7);
  v8 = sub_1B25CCCDC();
  OUTLINED_FUNCTION_4_19(v8);
  v9 = (_QWORD *)OUTLINED_FUNCTION_8_4();
  v9[2] = 0;
  v9[3] = 0;
  v9[4] = a1;
  v9[5] = v3;
  swift_retain();
  sub_1B24C52C0(v2, (uint64_t)&unk_1EEFDB5A8, (uint64_t)v9);
  return swift_release();
}

uint64_t EndpointDetector.__allocating_init(taskHint:detectionOptions:)(unsigned __int8 *a1, __int128 *a2)
{
  uint64_t v4;

  v4 = OUTLINED_FUNCTION_628();
  EndpointDetector.init(taskHint:detectionOptions:)(a1, a2);
  return v4;
}

uint64_t EndpointDetector.results.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;

  v3 = v1 + OBJC_IVAR____TtC6Speech16EndpointDetector__results;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEFD72F0);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a1, v3, v4);
}

uint64_t EndpointDetector.init(taskHint:detectionOptions:)(unsigned __int8 *a1, __int128 *a2)
{
  uint64_t v2;
  uint64_t v3;
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
  _BYTE *v20;
  uint64_t v21;
  uint64_t v22;
  _BYTE *v23;
  uint64_t v24;
  uint64_t v25;
  int v26;
  char v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  char v31;
  uint64_t v32;
  uint64_t result;
  _BYTE v34[4];
  int v35;
  uint64_t v36;
  __int128 v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  _BYTE *v42;

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEFD6898);
  v38 = *(_QWORD *)(v6 - 8);
  v39 = v6;
  MEMORY[0x1E0C80A78](v6, v7);
  OUTLINED_FUNCTION_41_1();
  v10 = v9 - v8;
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEFD72F0);
  v40 = *(_QWORD *)(v11 - 8);
  v41 = v11;
  MEMORY[0x1E0C80A78](v11, v12);
  OUTLINED_FUNCTION_41_1();
  v15 = v14 - v13;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EEFD7298);
  OUTLINED_FUNCTION_30_0();
  v18 = MEMORY[0x1E0C80A78](v16, v17);
  v20 = &v34[-((v19 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x1E0C80A78](v18, v21);
  v23 = &v34[-v22];
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EEFD6730);
  OUTLINED_FUNCTION_30_0();
  MEMORY[0x1E0C80A78](v24, v25);
  OUTLINED_FUNCTION_42_3();
  v26 = *a1;
  v37 = *a2;
  v36 = *((_QWORD *)a2 + 2);
  v35 = *((unsigned __int8 *)a2 + 24);
  v27 = *((_BYTE *)a2 + 25);
  v28 = OUTLINED_FUNCTION_23_0();
  OUTLINED_FUNCTION_4_19(v28);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EEFD67D8);
  v29 = swift_allocObject();
  *(_DWORD *)(v29 + ((*(unsigned int *)(*(_QWORD *)v29 + 48) + 3) & 0x1FFFFFFFCLL)) = 0;
  sub_1B24AD25C(v3, v29 + *(_QWORD *)(*MEMORY[0x1E0DEC528] + *(_QWORD *)v29 + 16), (uint64_t *)&unk_1EEFD6730);
  sub_1B24EBD4C(v3, (uint64_t *)&unk_1EEFD6730);
  *(_QWORD *)(v2 + 48) = v29;
  __swift_instantiateConcreteTypeFromMangledName(qword_1EEFD6D68);
  v30 = OUTLINED_FUNCTION_8_4();
  *(_BYTE *)(v30 + 24) = 0;
  *(_QWORD *)(v30 + 16) = 0;
  *(_QWORD *)(v2 + 56) = v30;
  if (v26 == 16)
    v31 = 0;
  else
    v31 = v26;
  *(_BYTE *)(v2 + 16) = v31;
  *(_OWORD *)(v2 + 20) = v37;
  *(_QWORD *)(v2 + 36) = v36;
  *(_BYTE *)(v2 + 44) = v35;
  *(_BYTE *)(v2 + 45) = v27;
  v32 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEFD7288);
  __swift_storeEnumTagSinglePayload((uint64_t)v23, 1, 1, v32);
  v42 = v23;
  (*(void (**)(uint64_t, _QWORD, uint64_t))(v38 + 104))(v10, *MEMORY[0x1E0DF0A50], v39);
  sub_1B25CCDE4();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v40 + 32))(v2 + OBJC_IVAR____TtC6Speech16EndpointDetector__results, v15, v41);
  sub_1B24AD25C((uint64_t)v23, (uint64_t)v20, &qword_1EEFD7298);
  result = __swift_getEnumTagSinglePayload((uint64_t)v20, 1, v32);
  if ((_DWORD)result == 1)
  {
    __break(1u);
  }
  else
  {
    (*(void (**)(uint64_t, _BYTE *, uint64_t))(*(_QWORD *)(v32 - 8) + 32))(v2 + OBJC_IVAR____TtC6Speech16EndpointDetector_resultsBuilder, v20, v32);
    sub_1B24EBD4C((uint64_t)v23, &qword_1EEFD7298);
    return v2;
  }
  return result;
}

uint64_t sub_1B259BC10(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  sub_1B24EBD4C(a2, &qword_1EEFD7298);
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEFD7288);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return __swift_storeEnumTagSinglePayload(a2, 0, 1, v4);
}

uint64_t sub_1B259BC80(uint64_t a1)
{
  uint64_t v1;

  return sub_1B259BC10(a1, *(_QWORD *)(v1 + 16));
}

uint64_t EndpointDetector.__allocating_init(taskHint:detectionOptions:)(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  char v3;
  char v4;
  uint64_t v5;
  __int128 v7;
  __int128 v8;
  uint64_t v9;
  char v10;
  char v11;
  unsigned __int8 v12;

  v7 = *(_OWORD *)a2;
  v2 = *(_QWORD *)(a2 + 16);
  v3 = *(_BYTE *)(a2 + 24);
  v4 = *(_BYTE *)(a2 + 25);
  sub_1B255CC14(a1, (char *)&v12);
  v8 = v7;
  v9 = v2;
  v10 = v3;
  v11 = v4;
  v5 = OUTLINED_FUNCTION_628();
  EndpointDetector.init(taskHint:detectionOptions:)(&v12, &v8);
  return v5;
}

void EndpointDetector.availableCompatibleAudioFormats(clientID:)()
{
  void *v0;
  id v1;

  __swift_instantiateConcreteTypeFromMangledName(&qword_1EEFD7620);
  *(_OWORD *)(OUTLINED_FUNCTION_8_4() + 16) = xmmword_1B25DBD80;
  if (qword_1EEFD7FE8 != -1)
    swift_once();
  v0 = (void *)qword_1EEFE4208;
  OUTLINED_FUNCTION_52_12();
  v1 = v0;
  OUTLINED_FUNCTION_28_0();
}

uint64_t sub_1B259BD80()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  _QWORD *v3;

  v1[2] = v0;
  sub_1B25CCA00();
  v1[3] = OUTLINED_FUNCTION_24_8();
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EEFD6730);
  v1[4] = OUTLINED_FUNCTION_24_8();
  v2 = OUTLINED_FUNCTION_23_0();
  v1[5] = v2;
  v1[6] = *(_QWORD *)(v2 - 8);
  v1[7] = swift_task_alloc();
  v1[8] = swift_task_alloc();
  type metadata accessor for AssetsInventory();
  swift_initStaticObject();
  v3 = (_QWORD *)swift_task_alloc();
  v1[9] = v3;
  *v3 = v1;
  v3[1] = sub_1B259BE3C;
  return sub_1B2572684();
}

uint64_t sub_1B259BE3C(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 80) = a1;
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_1B259BE98()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t (*v6)(void);
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  os_unfair_lock_s *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  v2 = v0[4];
  v1 = v0[5];
  sub_1B251BF20(v0[10], v2);
  OUTLINED_FUNCTION_173();
  if (__swift_getEnumTagSinglePayload(v2, 1, v1) == 1)
  {
    sub_1B24EBD4C(v0[4], (uint64_t *)&unk_1EEFD6730);
    sub_1B25CC9AC();
    if (qword_1EEFD8028 != -1)
      swift_once();
    v3 = (id)qword_1EEFDB360;
    sub_1B25CC6AC();
    v4 = sub_1B25CCA60();
    related decl 'e' for SFSpeechErrorCode.init(_:description:)(4, v4, v5);
    swift_willThrow();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    v6 = (uint64_t (*)(void))v0[1];
  }
  else
  {
    v7 = v0[8];
    v8 = v0[2];
    (*(void (**)(uint64_t, _QWORD, _QWORD))(v0[6] + 32))(v7, v0[4], v0[5]);
    v9 = *(_QWORD *)(v8 + 48);
    v10 = swift_task_alloc();
    *(_QWORD *)(v10 + 16) = v7;
    v11 = v9 + *(_QWORD *)(*MEMORY[0x1E0DEC528] + *(_QWORD *)v9 + 16);
    v12 = (os_unfair_lock_s *)(v9 + ((*(unsigned int *)(*(_QWORD *)v9 + 48) + 3) & 0x1FFFFFFFCLL));
    os_unfair_lock_lock(v12);
    sub_1B2573924(v11, *(_QWORD *)(v10 + 16));
    os_unfair_lock_unlock(v12);
    v13 = v0[8];
    v14 = v0[5];
    v15 = v0[6];
    swift_task_dealloc();
    (*(void (**)(uint64_t, uint64_t))(v15 + 8))(v13, v14);
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    v6 = (uint64_t (*)(void))v0[1];
  }
  return v6();
}

uint64_t sub_1B259C0DC()
{
  return swift_retain();
}

uint64_t sub_1B259C0E8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;

  *(_QWORD *)(v5 + 16) = a4;
  *(_QWORD *)(v5 + 24) = a5;
  return swift_task_switch();
}

uint64_t sub_1B259C100()
{
  uint64_t v0;
  uint64_t result;

  if (*(_QWORD *)(v0 + 16))
    return swift_task_switch();
  __break(1u);
  return result;
}

uint64_t sub_1B259C11C()
{
  uint64_t v0;

  sub_1B259DECC(*(_QWORD *)(v0 + 24), *(_QWORD *)(v0 + 16));
  return OUTLINED_FUNCTION_21(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_1B259C144(void *a1)
{
  uint64_t v3;
  char v4;

  if (object_getClass(a1) != (Class)_TtC6Speech22SpeechRecognizerWorker || a1 == 0)
    return 0;
  v3 = (uint64_t)a1 + OBJC_IVAR____TtC6Speech22SpeechRecognizerWorker_supportedFeatures;
  swift_unknownObjectRetain();
  v4 = sub_1B259C1B8(v3);
  swift_unknownObjectRelease();
  return v4 & 1;
}

uint64_t sub_1B259C1B8(uint64_t a1)
{
  _BYTE *v1;
  uint64_t v3;
  uint64_t v4;
  char v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  CMTimeValue v9;
  unint64_t v10;
  CMTimeEpoch v11;
  unint64_t v12;
  uint64_t v13;
  BOOL v14;
  CMTimeValue v15;
  CMTimeScale v16;
  CMTimeEpoch v17;
  CMTimeFlags v18;
  double v19;
  double v20;
  CMTimeValue v21;
  uint64_t v22;
  CMTimeValue v23;
  unint64_t v24;
  CMTimeValue v25;
  int v26;
  CMTimeValue v27;
  CMTimeScale v28;
  CMTimeEpoch v29;
  CMTimeFlags v30;
  CMTimeValue value;
  uint64_t v32;
  unint64_t v33;
  CMTimeValue v34;
  uint64_t v35;
  NSObject *v36;
  os_log_type_t v37;
  uint8_t *v38;
  uint64_t v39;
  unint64_t v40;
  unint64_t v41;
  CMTimeValue v43;
  CMTimeValue v44;
  CMTimeValue v45;
  CMTimeValue v46;
  CMTimeEpoch v47;
  CMTimeValue v48;
  unint64_t v49;
  char v50;
  CMTime v51;
  CMTime rhs;
  CMTime lhs;

  v3 = type metadata accessor for SpeechRecognizerSupportedFeatures();
  v4 = *(_QWORD *)(a1 + *(int *)(v3 + 20));
  v5 = v1[16];
  LOBYTE(lhs.value) = v5;
  v6 = TaskHint.preferredModelTaskNames.getter();
  v7 = sub_1B259DBA8(v6, v4);
  OUTLINED_FUNCTION_173();
  v8 = a1 + *(int *)(v3 + 44);
  v9 = *(_QWORD *)v8;
  v10 = *(_QWORD *)(v8 + 8);
  v11 = *(_QWORD *)(v8 + 16);
  v12 = HIDWORD(v10);
  v13 = MEMORY[0x1E0CA2E68];
  v50 = *(_BYTE *)(v8 + 25) | *(_BYTE *)(v8 + 24);
  if ((v50 & 1) != 0)
  {
    if ((v7 & 1) != 0)
    {
      v48 = *(_QWORD *)v8;
      v49 = HIDWORD(v10);
      v47 = *(_QWORD *)(v8 + 16);
      v14 = 0;
      goto LABEL_10;
    }
    v23 = MEMORY[0x1E0DEE9D8];
LABEL_20:
    lhs.value = 0;
    *(_QWORD *)&lhs.timescale = 0xE000000000000000;
    sub_1B25CD2DC();
    rhs.value = lhs.value;
    *(_QWORD *)&rhs.timescale = *(_QWORD *)&lhs.timescale;
    sub_1B25CCAE4();
    if ((v1[45] & 1) != 0 || (v1[44] & 1) != 0)
    {
      v27 = *(_QWORD *)v13;
      v28 = *(_DWORD *)(v13 + 8);
      v30 = *(_DWORD *)(v13 + 12);
      v29 = *(_QWORD *)(v13 + 16);
    }
    else
    {
      OUTLINED_FUNCTION_40_9();
    }
    lhs.value = v27;
    lhs.timescale = v28;
    lhs.flags = v30;
    lhs.epoch = v29;
    type metadata accessor for CMTime(0);
    OUTLINED_FUNCTION_25_17();
    OUTLINED_FUNCTION_8_5();
    if ((v50 & 1) != 0)
    {
      v9 = *(_QWORD *)v13;
      LODWORD(v10) = *(_DWORD *)(v13 + 8);
      LODWORD(v12) = *(_DWORD *)(v13 + 12);
      v11 = *(_QWORD *)(v13 + 16);
    }
    lhs.value = v9;
    lhs.timescale = v10;
    lhs.flags = v12;
    lhs.epoch = v11;
    OUTLINED_FUNCTION_25_17();
    value = rhs.value;
    v32 = *(_QWORD *)&rhs.timescale;
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    {
      OUTLINED_FUNCTION_7_16();
      v23 = v43;
    }
    v33 = *(_QWORD *)(v23 + 16);
    if (v33 >= *(_QWORD *)(v23 + 24) >> 1)
    {
      OUTLINED_FUNCTION_7_16();
      v23 = v44;
    }
    v26 = 0;
    *(_QWORD *)(v23 + 16) = v33 + 1;
    v34 = v23 + 16 * v33;
    *(_QWORD *)(v34 + 32) = value;
    *(_QWORD *)(v34 + 40) = v32;
    goto LABEL_31;
  }
  if ((v1[45] & 1) != 0 || (v1[44] & 1) != 0)
  {
    v15 = *MEMORY[0x1E0CA2E68];
    v16 = *(_DWORD *)(MEMORY[0x1E0CA2E68] + 8);
    v18 = *(_DWORD *)(MEMORY[0x1E0CA2E68] + 12);
    v17 = *(_QWORD *)(MEMORY[0x1E0CA2E68] + 16);
  }
  else
  {
    OUTLINED_FUNCTION_40_9();
  }
  rhs.epoch = v17;
  lhs.value = v9;
  *(_QWORD *)&lhs.timescale = v10;
  v49 = HIDWORD(v10);
  lhs.epoch = v11;
  rhs.value = v15;
  rhs.timescale = v16;
  rhs.flags = v18;
  CMTimeSubtract(&v51, &lhs, &rhs);
  sub_1B25CD0B4();
  v20 = fabs(v19);
  v14 = v20 <= 0.001;
  if ((v7 & 1) == 0)
  {
    v23 = MEMORY[0x1E0DEE9D8];
    LODWORD(v12) = HIDWORD(v10);
    if (v20 <= 0.001)
    {
      if (!*(_QWORD *)(MEMORY[0x1E0DEE9D8] + 16))
      {
        swift_bridgeObjectRelease();
        v26 = 1;
        return v26 & (v7 ^ 1u);
      }
      goto LABEL_19;
    }
    goto LABEL_20;
  }
  v47 = v11;
  v48 = v9;
LABEL_10:
  lhs.value = 0;
  *(_QWORD *)&lhs.timescale = 0xE000000000000000;
  sub_1B25CD2DC();
  swift_bridgeObjectRelease();
  lhs.value = 0xD000000000000013;
  *(_QWORD *)&lhs.timescale = 0x80000001B25D6F60;
  LOBYTE(rhs.value) = v5;
  TaskHint.preferredModelTaskNames.getter();
  MEMORY[0x1B5E24B5C]();
  sub_1B25CCAE4();
  OUTLINED_FUNCTION_267();
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_8_5();
  OUTLINED_FUNCTION_133();
  sub_1B25CCE44();
  sub_1B25CCAE4();
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_267();
  v21 = lhs.value;
  v22 = *(_QWORD *)&lhs.timescale;
  v23 = MEMORY[0x1E0DEE9D8];
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
  {
    OUTLINED_FUNCTION_7_16();
    v23 = v45;
  }
  v24 = *(_QWORD *)(v23 + 16);
  if (v24 >= *(_QWORD *)(v23 + 24) >> 1)
  {
    OUTLINED_FUNCTION_7_16();
    v23 = v46;
  }
  *(_QWORD *)(v23 + 16) = v24 + 1;
  v25 = v23 + 16 * v24;
  *(_QWORD *)(v25 + 32) = v21;
  *(_QWORD *)(v25 + 40) = v22;
  if (!v14)
  {
    v11 = v47;
    v9 = v48;
    LODWORD(v12) = v49;
    goto LABEL_20;
  }
LABEL_19:
  v26 = 1;
LABEL_31:
  if (qword_1ED36CF48 != -1)
    swift_once();
  v35 = OUTLINED_FUNCTION_147();
  __swift_project_value_buffer(v35, (uint64_t)qword_1ED36D980);
  swift_bridgeObjectRetain_n();
  v36 = sub_1B25CC8B0();
  v37 = sub_1B25CCFD0();
  if (os_log_type_enabled(v36, v37))
  {
    v38 = (uint8_t *)OUTLINED_FUNCTION_246();
    lhs.value = OUTLINED_FUNCTION_246();
    *(_DWORD *)v38 = 136315138;
    rhs.value = v23;
    OUTLINED_FUNCTION_133();
    __swift_instantiateConcreteTypeFromMangledName(&qword_1ED36CFD0);
    sub_1B24EBFA4(&qword_1EEFD7158, &qword_1ED36CFD0);
    v39 = sub_1B25CC940();
    v41 = v40;
    swift_bridgeObjectRelease();
    rhs.value = sub_1B2504AB0(v39, v41, &lhs.value);
    sub_1B25CD12C();
    OUTLINED_FUNCTION_26_3();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_1B2494000, v36, v37, "EndpointDetector.isWorkerUsable: Worker not usable because %s", v38, 0xCu);
    swift_arrayDestroy();
    OUTLINED_FUNCTION_174();
  }
  OUTLINED_FUNCTION_26_3();

  return v26 & (v7 ^ 1u);
}

uint64_t sub_1B259C710@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  CMTimeValue v3;
  unint64_t v4;
  CMTimeEpoch v5;
  char v6;
  char v7;
  NSObject *v8;
  CMTimeValue v9;
  CMTimeScale v10;
  CMTimeEpoch v11;
  uint64_t v12;
  uint64_t v13;
  CMTimeValue v14;
  uint64_t v15;
  CMTimeEpoch v16;
  double v17;
  uint64_t v18;
  os_log_type_t v19;
  uint8_t *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  os_log_type_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v29;
  os_log_type_t v30;
  uint64_t v31;
  uint64_t v32;
  CMTime v35;
  CMTime rhs;
  CMTime lhs;

  v3 = *(_QWORD *)(v2 + 20);
  v4 = *(_QWORD *)(v2 + 28);
  v5 = *(_QWORD *)(v2 + 36);
  v6 = *(_BYTE *)(v2 + 44);
  v7 = *(_BYTE *)(v2 + 45);
  if ((v7 & 1) != 0 || (*(_BYTE *)(v2 + 44) & 1) != 0)
  {
    v9 = *MEMORY[0x1E0CA2E68];
    v10 = *(_DWORD *)(MEMORY[0x1E0CA2E68] + 8);
    v8 = *(unsigned int *)(MEMORY[0x1E0CA2E68] + 12);
    v11 = *(_QWORD *)(MEMORY[0x1E0CA2E68] + 16);
  }
  else
  {
    v8 = HIDWORD(v4);
    v9 = v3;
    v10 = v4;
    v11 = v5;
  }
  v12 = type metadata accessor for SpeechRecognizerSupportedFeatures();
  v13 = a1 + *(int *)(v12 + 44);
  if ((*(_BYTE *)(v13 + 25) & 1) != 0 || (*(_BYTE *)(v13 + 24) & 1) != 0)
  {
    if (qword_1ED36CF48 != -1)
      swift_once();
    v23 = OUTLINED_FUNCTION_147();
    OUTLINED_FUNCTION_6_3(v23, (uint64_t)qword_1ED36D980);
    v24 = OUTLINED_FUNCTION_34_1();
    if (OUTLINED_FUNCTION_111_1(v24))
    {
      *(_WORD *)OUTLINED_FUNCTION_246() = 0;
      OUTLINED_FUNCTION_19_13(&dword_1B2494000, v25, v26, "EndpointDetector.makeWorkerUsable: no detection options, making usable");
      OUTLINED_FUNCTION_174();
    }

    sub_1B254E940(a1, a2);
    v27 = a2 + *(int *)(v12 + 44);
    *(_QWORD *)v27 = v3;
    *(_QWORD *)(v27 + 8) = v4;
    *(_QWORD *)(v27 + 16) = v5;
    *(_BYTE *)(v27 + 24) = v6;
    *(_BYTE *)(v27 + 25) = v7;
    return __swift_storeEnumTagSinglePayload(a2, 0, 1, v12);
  }
  else
  {
    v14 = *(_QWORD *)v13;
    v15 = *(_QWORD *)(v13 + 8);
    v16 = *(_QWORD *)(v13 + 16);
    rhs.epoch = v11;
    lhs.value = v14;
    *(_QWORD *)&lhs.timescale = v15;
    lhs.epoch = v16;
    rhs.value = v9;
    rhs.timescale = v10;
    rhs.flags = v8;
    CMTimeSubtract(&v35, &lhs, &rhs);
    sub_1B25CD0B4();
    if (fabs(v17) <= 0.001)
    {
      if (qword_1ED36CF48 != -1)
        swift_once();
      v29 = OUTLINED_FUNCTION_147();
      OUTLINED_FUNCTION_6_3(v29, (uint64_t)qword_1ED36D980);
      v30 = OUTLINED_FUNCTION_34_1();
      if (OUTLINED_FUNCTION_111_1(v30))
      {
        *(_WORD *)OUTLINED_FUNCTION_246() = 0;
        OUTLINED_FUNCTION_19_13(&dword_1B2494000, v31, v32, "EndpointDetector.makeWorkerUsable: already usable");
        OUTLINED_FUNCTION_174();
      }

      sub_1B254E940(a1, a2);
      v21 = a2;
      v22 = 0;
    }
    else
    {
      if (qword_1ED36CF48 != -1)
        swift_once();
      v18 = OUTLINED_FUNCTION_147();
      OUTLINED_FUNCTION_6_3(v18, (uint64_t)qword_1ED36D980);
      v19 = OUTLINED_FUNCTION_34_1();
      if (os_log_type_enabled(v8, v19))
      {
        v20 = (uint8_t *)OUTLINED_FUNCTION_246();
        *(_WORD *)v20 = 0;
        _os_log_impl(&dword_1B2494000, v8, v19, "EndpointDetector.makeWorkerUsable: detectAfterTime different, cannot make usable", v20, 2u);
        OUTLINED_FUNCTION_174();
      }

      v21 = a2;
      v22 = 1;
    }
    return __swift_storeEnumTagSinglePayload(v21, v22, 1, v12);
  }
}

uint64_t sub_1B259CA00@<X0>(uint64_t a1@<X8>)
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
  char *v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  os_unfair_lock_s *v17;
  unsigned int v18;
  _QWORD *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t inited;
  uint64_t v23;
  uint64_t v24;
  char v26;
  uint64_t v27;
  uint64_t v28;
  char v29;
  char v30;
  uint64_t result;
  uint64_t v32;
  uint64_t v33;
  __int128 v34;
  uint64_t v35;
  char v36;
  char v37;

  v3 = v1;
  v33 = a1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EEFD6B20);
  OUTLINED_FUNCTION_30_0();
  MEMORY[0x1E0C80A78](v4, v5);
  OUTLINED_FUNCTION_42_3();
  v6 = OUTLINED_FUNCTION_23_0();
  v7 = *(_QWORD *)(v6 - 8);
  v9 = MEMORY[0x1E0C80A78](v6, v8);
  v11 = (char *)&v32 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v9, v12);
  v14 = (char *)&v32 - v13;
  v15 = *(_QWORD *)(v1 + 48);
  v16 = v15 + *(_QWORD *)(*MEMORY[0x1E0DEC528] + *(_QWORD *)v15 + 16);
  v17 = (os_unfair_lock_s *)(v15 + ((*(unsigned int *)(*(_QWORD *)v15 + 48) + 3) & 0x1FFFFFFFCLL));
  os_unfair_lock_lock(v17);
  sub_1B2573D68(v16, (uint64_t)v14);
  os_unfair_lock_unlock(v17);
  v18 = *(unsigned __int8 *)(v3 + 16);
  LOBYTE(v34) = *(_BYTE *)(v3 + 16);
  v19 = (_QWORD *)TaskHint.preferredModelTaskNames.getter();
  if (v19[2])
  {
    v20 = v19[4];
    v21 = v19[5];
    OUTLINED_FUNCTION_133();
    OUTLINED_FUNCTION_173();
    (*(void (**)(char *, char *, uint64_t))(v7 + 16))(v11, v14, v6);
    __swift_instantiateConcreteTypeFromMangledName(qword_1ED36D150);
    inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_1B25DB5B0;
    *(_QWORD *)(inited + 32) = v20;
    *(_QWORD *)(inited + 40) = v21;
    sub_1B2506144();
    v24 = v23;
    v26 = v18 == 1 || v18 == 6;
    v27 = type metadata accessor for Transcriber.ModelOptions(0);
    OUTLINED_FUNCTION_4_19(v27);
    v28 = *(_QWORD *)(v3 + 36);
    v29 = *(_BYTE *)(v3 + 44);
    v30 = *(_BYTE *)(v3 + 45);
    v34 = *(_OWORD *)(v3 + 20);
    v35 = v28;
    v36 = v29;
    v37 = v30;
    sub_1B255F76C((uint64_t)v11, v24, (v18 > 0xF) | (0x311Cu >> v18) & 1, v26, 0, 0, v2, &v34, v33, MEMORY[0x1E0DEE9E8], MEMORY[0x1E0DEE9E8], MEMORY[0x1E0DEE9E8]);
    return (*(uint64_t (**)(char *, uint64_t))(v7 + 8))(v14, v6);
  }
  else
  {
    result = OUTLINED_FUNCTION_173();
    __break(1u);
  }
  return result;
}

void sub_1B259CC18()
{
  uint64_t v0;

  *(_BYTE *)(*(_QWORD *)(v0 + 56) + 24) = 1;
}

void EndpointDetector.recognizerObjectIdentifier.getter()
{
  if (sub_1B259C0DC())
    swift_release();
  OUTLINED_FUNCTION_0();
}

double EndpointDetector.ModuleOutput.range.getter@<D0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  double result;

  v2 = *(_QWORD *)(v1 + 40);
  *(_QWORD *)a1 = *(_QWORD *)v1;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(v1 + 8);
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(v1 + 16);
  result = *(double *)(v1 + 32);
  *(double *)(a1 + 32) = result;
  *(_QWORD *)(a1 + 40) = v2;
  return result;
}

uint64_t EndpointDetector.ModuleOutput.resultsFinalToTime.getter()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + 48);
}

uint64_t EndpointDetector.ModuleOutput.wordCount.getter()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + 72);
}

double EndpointDetector.ModuleOutput.eosLikelihood.getter()
{
  uint64_t v0;

  return *(double *)(v0 + 80);
}

uint64_t EndpointDetector.ModuleOutput.pauseCounts.getter()
{
  return swift_bridgeObjectRetain();
}

double EndpointDetector.ModuleOutput.silencePosterior.getter()
{
  uint64_t v0;

  return *(double *)(v0 + 96);
}

double EndpointDetector.ModuleOutput.acousticEndpointerScore.getter()
{
  uint64_t v0;

  return *(double *)(v0 + 104);
}

uint64_t EndpointDetector.ModuleOutput.description.getter()
{
  CMTimeValue *v0;
  CMTimeValue v1;
  CMTimeEpoch v2;
  CMTimeValue v3;
  CMTimeEpoch v4;
  CMTimeValue v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  CMTimeRange v10;
  uint64_t v11;
  unint64_t v12;

  v1 = *v0;
  v2 = v0[2];
  v3 = v0[3];
  v4 = v0[5];
  v5 = v0[9];
  *(_QWORD *)&v10.start.timescale = 0xE000000000000000;
  sub_1B25CD2DC();
  v11 = 0;
  v12 = 0xE000000000000000;
  OUTLINED_FUNCTION_8_14();
  v10.start.value = v1;
  *(_QWORD *)&v10.start.timescale = v0[1];
  v10.start.epoch = v2;
  v10.duration.value = v3;
  *(_QWORD *)&v10.duration.timescale = v0[4];
  v10.duration.epoch = v4;
  v6 = (void *)CMTimeRangeCopyDescription(0, &v10);
  if (!v6)
    v6 = (void *)sub_1B25CCA0C();
  v10.start.value = (CMTimeValue)v6;
  type metadata accessor for CFString(0);
  sub_1B25CD3E4();

  sub_1B25CCAE4();
  v10.start.value = v5;
  v7 = MEMORY[0x1E0DEB418];
  sub_1B25CD570();
  sub_1B25CCAE4();
  swift_bridgeObjectRelease();
  sub_1B25CCAE4();
  OUTLINED_FUNCTION_15_11();
  sub_1B25CCAE4();
  v8 = swift_bridgeObjectRetain();
  MEMORY[0x1B5E24B5C](v8, v7);
  sub_1B25CCAE4();
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_267();
  OUTLINED_FUNCTION_8_14();
  OUTLINED_FUNCTION_15_11();
  OUTLINED_FUNCTION_8_14();
  OUTLINED_FUNCTION_15_11();
  sub_1B25CCAE4();
  return v11;
}

uint64_t EndpointDetector.DetectionOptions.detectAfterTime.getter()
{
  uint64_t v0;

  return *(_QWORD *)v0;
}

Speech::EndpointDetector::DetectionOptions __swiftcall EndpointDetector.DetectionOptions.init(detectAfterTime:)(Speech::EndpointDetector::DetectionOptions detectAfterTime)
{
  uint64_t v1;

  *(_QWORD *)v1 = detectAfterTime.detectAfterTime.value.value;
  *(_QWORD *)(v1 + 8) = *(_QWORD *)&detectAfterTime.detectAfterTime.value.timescale;
  *(_QWORD *)(v1 + 16) = detectAfterTime.detectAfterTime.value.epoch;
  *(_BYTE *)(v1 + 24) = detectAfterTime.detectAfterTime.is_nil;
  return detectAfterTime;
}

BOOL static EndpointDetector.DetectionOptions.== infix(_:_:)(uint64_t a1, uint64_t a2)
{
  if ((*(_BYTE *)(a1 + 24) & 1) == 0)
    return (*(_BYTE *)(a2 + 24) & 1) == 0 && (sub_1B25CD060() & 1) != 0;
  return (*(_BYTE *)(a2 + 24) & 1) != 0;
}

uint64_t EndpointDetector.DetectionOptions.hash(into:)()
{
  uint64_t v0;

  if (*(_BYTE *)(v0 + 24) == 1)
    return sub_1B25CD6C0();
  sub_1B25CD6C0();
  return sub_1B25CD084();
}

uint64_t EndpointDetector.DetectionOptions.hashValue.getter()
{
  uint64_t v0;
  int v1;

  v1 = *(unsigned __int8 *)(v0 + 24);
  sub_1B25CD6A8();
  sub_1B25CD6C0();
  if (v1 != 1)
    sub_1B25CD084();
  return sub_1B25CD6CC();
}

uint64_t sub_1B259D084()
{
  uint64_t v0;
  int v1;

  v1 = *(unsigned __int8 *)(v0 + 24);
  sub_1B25CD6A8();
  sub_1B25CD6C0();
  if (v1 != 1)
    sub_1B25CD084();
  return sub_1B25CD6CC();
}

uint64_t sub_1B259D100(uint64_t a1, uint64_t a2, uint64_t a3, double a4, double a5, double a6)
{
  uint64_t v10;
  int v11;
  int v12;
  uint64_t v13;
  int v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  uint64_t v22;
  uint64_t v23;
  NSObject *v24;
  os_log_type_t v25;
  uint8_t *v26;
  uint64_t v27;
  uint64_t v28;
  unint64_t v29;
  unint64_t v31;
  unsigned int v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  int v37;
  uint64_t v38;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  int v43;
  int v44;
  uint64_t v45;
  uint64_t v46;
  int v47;
  int v48;
  uint64_t v49;
  uint64_t v50;
  unint64_t v51;
  uint64_t v52;
  uint64_t v53;
  double v54;
  uint64_t v55;
  double v56;
  double v57;

  v10 = *(_QWORD *)a2;
  v11 = *(_DWORD *)(a2 + 8);
  v12 = *(_DWORD *)(a2 + 12);
  v13 = *(_QWORD *)(a2 + 24);
  v38 = *(_QWORD *)(a2 + 16);
  v14 = *(_DWORD *)(a2 + 32);
  v37 = *(_DWORD *)(a2 + 36);
  v15 = *(_QWORD *)(a2 + 40);
  v40 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEFD7238);
  v16 = *(_QWORD *)(v40 - 8);
  MEMORY[0x1E0C80A78](v40, v17);
  OUTLINED_FUNCTION_41_1();
  v20 = v19 - v18;
  v42 = v10;
  v43 = v11;
  v44 = v12;
  v45 = v38;
  v46 = v13;
  v36 = v13;
  v47 = v14;
  v48 = v37;
  v35 = v15;
  v49 = v15;
  v50 = sub_1B25CCF7C();
  v33 = v50;
  v32 = v21;
  v51 = v21;
  v31 = HIDWORD(v21);
  v34 = v22;
  v52 = v22;
  v53 = a1;
  v54 = a4;
  v55 = a3;
  v56 = a5;
  v57 = a6;
  swift_bridgeObjectRetain_n();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EEFD7288);
  sub_1B25CCDC0();
  (*(void (**)(uint64_t, uint64_t))(v16 + 8))(v20, v40);
  if (qword_1ED36CF48 != -1)
    swift_once();
  v23 = OUTLINED_FUNCTION_147();
  __swift_project_value_buffer(v23, (uint64_t)qword_1ED36D980);
  swift_bridgeObjectRetain();
  v24 = sub_1B25CC8B0();
  v25 = sub_1B25CCFD0();
  if (os_log_type_enabled(v24, v25))
  {
    v26 = (uint8_t *)OUTLINED_FUNCTION_246();
    v27 = OUTLINED_FUNCTION_246();
    *(_DWORD *)v26 = 136315138;
    v41 = v27;
    v42 = v10;
    v43 = v11;
    v44 = v12;
    v45 = v38;
    v46 = v36;
    v47 = v14;
    v48 = v37;
    v49 = v35;
    v50 = v33;
    v51 = __PAIR64__(v31, v32);
    v52 = v34;
    v53 = a1;
    v54 = a4;
    v55 = a3;
    v56 = a5;
    v57 = a6;
    v28 = EndpointDetector.ModuleOutput.description.getter();
    v42 = sub_1B2504AB0(v28, v29, &v41);
    sub_1B25CD12C();
    OUTLINED_FUNCTION_34_10();
    OUTLINED_FUNCTION_173();
    _os_log_impl(&dword_1B2494000, v24, v25, "EndpointDetector: Yielded result %s", v26, 0xCu);
    swift_arrayDestroy();
    OUTLINED_FUNCTION_174();
  }

  return OUTLINED_FUNCTION_34_10();
}

uint64_t sub_1B259D458(void *a1)
{
  id v1;

  v1 = a1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EEFD7288);
  return sub_1B25CCDCC();
}

void EndpointDetector.deinit()
{
  uint64_t v0;
  uint64_t v1;

  swift_release();
  swift_release();
  v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEFD72F0);
  OUTLINED_FUNCTION_278_0(v0);
  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEFD7288);
  OUTLINED_FUNCTION_278_0(v1);
  OUTLINED_FUNCTION_0();
}

uint64_t EndpointDetector.__deallocating_deinit()
{
  EndpointDetector.deinit();
  return swift_deallocClassInstance();
}

uint64_t sub_1B259D528()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 16) = v1;
  *v1 = v0;
  v1[1] = sub_1B2504888;
  return sub_1B259BD80();
}

uint64_t sub_1B259D578()
{
  uint64_t v0;
  uint64_t v1;

  v1 = EndpointDetector.compatibleAudioFormats.getter();
  return sub_1B2509308(*(uint64_t (**)(uint64_t))(v0 + 8), v0, v1);
}

uint64_t sub_1B259D5AC()
{
  uint64_t v0;
  uint64_t v1;

  EndpointDetector.availableCompatibleAudioFormats(clientID:)();
  return sub_1B2509308(*(uint64_t (**)(uint64_t))(v0 + 8), v0, v1);
}

uint64_t sub_1B259D5E0()
{
  return sub_1B259C0DC();
}

uint64_t sub_1B259D600(void *a1)
{
  return sub_1B259C144(a1) & 1;
}

void sub_1B259D624()
{
  sub_1B259CC18();
}

unint64_t sub_1B259D648()
{
  unint64_t result;

  result = qword_1EEFDB570[0];
  if (!qword_1EEFDB570[0])
  {
    result = MEMORY[0x1B5E261DC](&protocol conformance descriptor for EndpointDetector.DetectionOptions, &type metadata for EndpointDetector.DetectionOptions);
    atomic_store(result, qword_1EEFDB570);
  }
  return result;
}

void sub_1B259D684(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;

  sub_1B2531930(qword_1EEFD6828, (void (*)(uint64_t))type metadata accessor for EndpointDetector);
  *(_QWORD *)(a1 + 8) = v2;
  sub_1B2531930(&qword_1EEFD6EB0, (void (*)(uint64_t))type metadata accessor for EndpointDetector);
  *(_QWORD *)(a1 + 16) = v3;
}

uint64_t type metadata accessor for EndpointDetector()
{
  uint64_t result;

  result = qword_1EEFD6EB8;
  if (!qword_1EEFD6EB8)
    return swift_getSingletonMetadata();
  return result;
}

void sub_1B259D718(uint64_t a1)
{
  uint64_t v2;

  sub_1B2531930(&qword_1EEFD6EB0, (void (*)(uint64_t))type metadata accessor for EndpointDetector);
  *(_QWORD *)(a1 + 8) = v2;
}

_UNKNOWN **sub_1B259D754()
{
  return &protocol witness table for EndpointDetector.ModuleOutput;
}

uint64_t sub_1B259D760()
{
  return swift_getOpaqueTypeConformance2();
}

void sub_1B259D770()
{
  unint64_t v0;
  unint64_t v1;

  sub_1B259D84C(319, &qword_1EEFD72F8, (uint64_t (*)(uint64_t, ValueMetadata *, uint64_t, _QWORD))MEMORY[0x1E0DF0AD0]);
  if (v0 <= 0x3F)
  {
    sub_1B259D84C(319, &qword_1EEFD7290, MEMORY[0x1E0DF0A78]);
    if (v1 <= 0x3F)
      swift_updateClassMetadata2();
  }
}

uint64_t method lookup function for EndpointDetector()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of EndpointDetector.__allocating_init(taskHint:detectionOptions:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 128))();
}

void sub_1B259D84C(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t, ValueMetadata *, uint64_t, _QWORD))
{
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;

  if (!*a2)
  {
    v6 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1ED36D060);
    v7 = a3(a1, &type metadata for EndpointDetector.ModuleOutput, v6, MEMORY[0x1E0DEDB38]);
    if (!v8)
      atomic_store(v7, a2);
  }
}

uint64_t destroy for EndpointDetector.ModuleOutput()
{
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for EndpointDetector.ModuleOutput(uint64_t a1, uint64_t a2)
{
  __int128 v3;
  __int128 v4;

  v3 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v3;
  v4 = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 48) = v4;
  *(_QWORD *)(a1 + 64) = *(_QWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 72) = *(_OWORD *)(a2 + 72);
  *(_QWORD *)(a1 + 88) = *(_QWORD *)(a2 + 88);
  *(_OWORD *)(a1 + 96) = *(_OWORD *)(a2 + 96);
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for EndpointDetector.ModuleOutput(uint64_t a1, uint64_t a2)
{
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_DWORD *)(a1 + 8) = *(_DWORD *)(a2 + 8);
  *(_DWORD *)(a1 + 12) = *(_DWORD *)(a2 + 12);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  *(_DWORD *)(a1 + 32) = *(_DWORD *)(a2 + 32);
  *(_DWORD *)(a1 + 36) = *(_DWORD *)(a2 + 36);
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  *(_DWORD *)(a1 + 56) = *(_DWORD *)(a2 + 56);
  *(_DWORD *)(a1 + 60) = *(_DWORD *)(a2 + 60);
  *(_QWORD *)(a1 + 64) = *(_QWORD *)(a2 + 64);
  *(_QWORD *)(a1 + 72) = *(_QWORD *)(a2 + 72);
  *(_QWORD *)(a1 + 80) = *(_QWORD *)(a2 + 80);
  *(_QWORD *)(a1 + 88) = *(_QWORD *)(a2 + 88);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 96) = *(_QWORD *)(a2 + 96);
  *(_QWORD *)(a1 + 104) = *(_QWORD *)(a2 + 104);
  return a1;
}

void *__swift_memcpy112_8(void *a1, const void *a2)
{
  return memcpy(a1, a2, 0x70uLL);
}

uint64_t assignWithTake for EndpointDetector.ModuleOutput(uint64_t a1, uint64_t a2)
{
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 56) = *(_QWORD *)(a2 + 56);
  *(_OWORD *)(a1 + 64) = *(_OWORD *)(a2 + 64);
  *(_QWORD *)(a1 + 80) = *(_QWORD *)(a2 + 80);
  *(_QWORD *)(a1 + 88) = *(_QWORD *)(a2 + 88);
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 96) = *(_OWORD *)(a2 + 96);
  return a1;
}

uint64_t getEnumTagSinglePayload for EndpointDetector.ModuleOutput(uint64_t a1, int a2)
{
  unint64_t v2;

  if (a2)
  {
    if (a2 < 0 && *(_BYTE *)(a1 + 112))
    {
      LODWORD(v2) = *(_DWORD *)a1 + 0x7FFFFFFF;
    }
    else
    {
      v2 = *(_QWORD *)(a1 + 88);
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

uint64_t storeEnumTagSinglePayload for EndpointDetector.ModuleOutput(uint64_t result, int a2, int a3)
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
      *(_QWORD *)(result + 88) = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 112) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for EndpointDetector.ModuleOutput()
{
  return &type metadata for EndpointDetector.ModuleOutput;
}

__n128 __swift_memcpy25_4(uint64_t a1, uint64_t a2)
{
  __n128 result;

  result = *(__n128 *)a2;
  *(_OWORD *)(a1 + 9) = *(_OWORD *)(a2 + 9);
  *(__n128 *)a1 = result;
  return result;
}

uint64_t getEnumTagSinglePayload for EndpointDetector.DetectionOptions(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 25))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t storeEnumTagSinglePayload for EndpointDetector.DetectionOptions(uint64_t result, int a2, int a3)
{
  char v3;

  if (a2)
  {
    *(_QWORD *)(result + 8) = 0;
    *(_QWORD *)(result + 16) = 0;
    *(_BYTE *)(result + 24) = 0;
    *(_QWORD *)result = (a2 - 1);
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

ValueMetadata *type metadata accessor for EndpointDetector.DetectionOptions()
{
  return &type metadata for EndpointDetector.DetectionOptions;
}

void sub_1B259DB7C()
{
  sub_1B24EBFA4(&qword_1EEFD7300, &qword_1EEFD72F0);
}

uint64_t sub_1B259DBA8(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  _QWORD *v13;
  BOOL v14;
  uint64_t v15;
  unint64_t i;
  uint64_t v17;
  _QWORD *v18;
  BOOL v19;
  uint64_t v20;
  uint64_t v22;

  if (!*(_QWORD *)(a2 + 16))
    return 1;
  v2 = *(_QWORD *)(a1 + 16);
  if (!v2)
    return 1;
  v22 = a1 + 32;
  v4 = a2 + 56;
  swift_bridgeObjectRetain();
  v5 = 0;
  while (!*(_QWORD *)(a2 + 16))
  {
LABEL_20:
    if (++v5 == v2)
    {
      v20 = 1;
      goto LABEL_24;
    }
  }
  v6 = (uint64_t *)(v22 + 16 * v5);
  v8 = *v6;
  v7 = v6[1];
  sub_1B25CD6A8();
  swift_bridgeObjectRetain();
  sub_1B25CCAB4();
  v9 = sub_1B25CD6CC();
  v10 = -1 << *(_BYTE *)(a2 + 32);
  v11 = v9 & ~v10;
  if (((*(_QWORD *)(v4 + ((v11 >> 3) & 0xFFFFFFFFFFFFF8)) >> v11) & 1) == 0)
  {
LABEL_19:
    swift_bridgeObjectRelease();
    goto LABEL_20;
  }
  v12 = *(_QWORD *)(a2 + 48);
  v13 = (_QWORD *)(v12 + 16 * v11);
  v14 = *v13 == v8 && v13[1] == v7;
  if (!v14 && (sub_1B25CD5D0() & 1) == 0)
  {
    v15 = ~v10;
    for (i = v11 + 1; ; i = v17 + 1)
    {
      v17 = i & v15;
      if (((*(_QWORD *)(v4 + (((i & v15) >> 3) & 0xFFFFFFFFFFFFF8)) >> (i & v15)) & 1) == 0)
        break;
      v18 = (_QWORD *)(v12 + 16 * v17);
      v19 = *v18 == v8 && v18[1] == v7;
      if (v19 || (sub_1B25CD5D0() & 1) != 0)
        goto LABEL_23;
    }
    goto LABEL_19;
  }
LABEL_23:
  swift_bridgeObjectRelease();
  v20 = 0;
LABEL_24:
  swift_bridgeObjectRelease();
  return v20;
}

uint64_t sub_1B259DD30()
{
  swift_unknownObjectRelease();
  swift_release();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_1B259DD64(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;

  v4 = v1[2];
  v5 = v1[3];
  v7 = v1[4];
  v6 = v1[5];
  v8 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v8;
  *v8 = v2;
  v8[1] = sub_1B2508AAC;
  return sub_1B259C0E8(a1, v4, v5, v7, v6);
}

void sub_1B259DDDC()
{
  uint64_t v0;

  OUTLINED_FUNCTION_8_4();
  OUTLINED_FUNCTION_33_12((uint64_t)&off_1E647D660);
  OUTLINED_FUNCTION_12_17();
  OUTLINED_FUNCTION_122_0();
  sub_1B2568CBC();
  OUTLINED_FUNCTION_22_10();
  OUTLINED_FUNCTION_31_10();
  OUTLINED_FUNCTION_30_14(v0);
  swift_release();
  OUTLINED_FUNCTION_223();
}

void sub_1B259DE54()
{
  uint64_t v0;

  OUTLINED_FUNCTION_8_4();
  OUTLINED_FUNCTION_33_12((uint64_t)&off_1E647E158);
  OUTLINED_FUNCTION_12_17();
  OUTLINED_FUNCTION_122_0();
  sub_1B2568CBC();
  OUTLINED_FUNCTION_22_10();
  OUTLINED_FUNCTION_31_10();
  OUTLINED_FUNCTION_30_14(v0);
  swift_release();
  OUTLINED_FUNCTION_223();
}

uint64_t sub_1B259DECC(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v3 = swift_allocObject();
  *(_QWORD *)(v3 + 24) = &off_1E647DF40;
  swift_unknownObjectWeakInit();
  v4 = (uint64_t *)(a2 + OBJC_IVAR____TtC6Speech22SpeechRecognizerWorker_delegates);
  swift_beginAccess();
  swift_retain();
  sub_1B2568CBC();
  v5 = *(_QWORD *)(*v4 + 16);
  sub_1B2568DC0(v5);
  v6 = *v4;
  *(_QWORD *)(v6 + 16) = v5 + 1;
  v7 = v6 + 16 * v5;
  *(_QWORD *)(v7 + 32) = j__OUTLINED_FUNCTION_3_17;
  *(_QWORD *)(v7 + 40) = v3;
  swift_endAccess();
  return swift_release();
}

uint64_t sub_1B259DF94()
{
  swift_unknownObjectWeakDestroy();
  return swift_deallocObject();
}

void OUTLINED_FUNCTION_3_17(uint64_t *a1@<X8>)
{
  uint64_t v1;

  sub_1B24F7BC4(v1, a1);
}

uint64_t OUTLINED_FUNCTION_4_19(uint64_t a1)
{
  uint64_t v1;

  return __swift_storeEnumTagSinglePayload(v1, 1, 1, a1);
}

void OUTLINED_FUNCTION_7_16()
{
  sub_1B252BA14();
}

uint64_t OUTLINED_FUNCTION_8_14()
{
  return sub_1B25CCAE4();
}

uint64_t OUTLINED_FUNCTION_12_17()
{
  return swift_beginAccess();
}

uint64_t OUTLINED_FUNCTION_15_11()
{
  return sub_1B25CCE08();
}

void OUTLINED_FUNCTION_19_13(void *a1, uint64_t a2, uint64_t a3, const char *a4)
{
  NSObject *v4;
  os_log_type_t v5;
  uint8_t *v6;

  _os_log_impl(a1, v4, v5, a4, v6, 2u);
}

uint64_t OUTLINED_FUNCTION_22_10()
{
  uint64_t v0;

  return sub_1B2568DC0(*(_QWORD *)(*(_QWORD *)v0 + 16));
}

uint64_t OUTLINED_FUNCTION_25_17()
{
  return sub_1B25CD3E4();
}

uint64_t OUTLINED_FUNCTION_30_14@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(a1 + 32) = v1;
  *(_QWORD *)(a1 + 40) = v2;
  return swift_endAccess();
}

void OUTLINED_FUNCTION_31_10()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 16) = v0 + 1;
}

uint64_t OUTLINED_FUNCTION_33_12@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  *(_QWORD *)(v1 + 24) = a1;
  return swift_unknownObjectWeakInit();
}

uint64_t OUTLINED_FUNCTION_34_10()
{
  return swift_bridgeObjectRelease_n();
}

uint64_t sub_1B259E09C(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t result;
  int v10;
  unint64_t v11;
  int v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;

  v3 = type metadata accessor for EARLocaleAlternative();
  v20 = *(_QWORD *)(v3 - 8);
  v21 = v3;
  MEMORY[0x1E0C80A78](v3, v4);
  v6 = (char *)&v18 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = *(_QWORD *)(a1 + 16);
  v8 = MEMORY[0x1E0DEE9D8];
  if (!v7)
    return v8;
  v18 = v1;
  v23 = MEMORY[0x1E0DEE9D8];
  sub_1B2505824(0, v7, 0);
  v8 = v23;
  result = sub_1B2534960(a1);
  if ((result & 0x8000000000000000) == 0)
  {
    v11 = result;
    if (result < 1 << *(_BYTE *)(a1 + 32))
    {
      v12 = v10;
      v13 = a1 + 64;
      v19 = a1 + 64;
      while ((*(_QWORD *)(v13 + 8 * (v11 >> 6)) & (1 << v11)) != 0)
      {
        if (v12 != *(_DWORD *)(a1 + 36))
          goto LABEL_18;
        v22 = v7;
        v14 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8 * v11);
        swift_bridgeObjectRetain();
        sub_1B25CC628();
        *(_QWORD *)&v6[*(int *)(v21 + 20)] = v14;
        v23 = v8;
        v15 = (uint64_t)v6;
        v17 = *(_QWORD *)(v8 + 16);
        v16 = *(_QWORD *)(v8 + 24);
        if (v17 >= v16 >> 1)
        {
          sub_1B2505824(v16 > 1, v17 + 1, 1);
          v8 = v23;
        }
        *(_QWORD *)(v8 + 16) = v17 + 1;
        result = sub_1B25A1C50(v15, v8+ ((*(unsigned __int8 *)(v20 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v20 + 80))+ *(_QWORD *)(v20 + 72) * v17);
        if ((uint64_t)v11 >= -(-1 << *(_BYTE *)(a1 + 32)))
          goto LABEL_19;
        v13 = v19;
        if ((*(_QWORD *)(v19 + 8 * (v11 >> 6)) & (1 << v11)) == 0)
          goto LABEL_20;
        if (v12 != *(_DWORD *)(a1 + 36))
          goto LABEL_21;
        v6 = (char *)v15;
        result = sub_1B25CD1BC();
        v7 = v22 - 1;
        if (v22 == 1)
          return v8;
        v11 = result;
        if ((result & 0x8000000000000000) == 0)
        {
          v12 = *(_DWORD *)(a1 + 36);
          if (result < 1 << *(_BYTE *)(a1 + 32))
            continue;
        }
        goto LABEL_22;
      }
      __break(1u);
LABEL_18:
      __break(1u);
LABEL_19:
      __break(1u);
LABEL_20:
      __break(1u);
LABEL_21:
      __break(1u);
    }
  }
LABEL_22:
  __break(1u);
  return result;
}

uint64_t sub_1B259E2DC(_OWORD *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;

  *(_QWORD *)(v4 + 24) = a3;
  *(_QWORD *)(v4 + 32) = v3;
  *(_QWORD *)(v4 + 16) = a2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EEFD6E90);
  *(_QWORD *)(v4 + 40) = swift_task_alloc();
  *(_QWORD *)(v4 + 48) = swift_task_alloc();
  *(_OWORD *)(v4 + 56) = *a1;
  OUTLINED_FUNCTION_17();
  return OUTLINED_FUNCTION_2_0();
}

void sub_1B259E350()
{
  _QWORD *v0;
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  int EnumTagSinglePayload;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  uint64_t v15;
  _QWORD *v16;

  OUTLINED_FUNCTION_49();
  if (v0[7] == 1)
  {
    v1 = objc_allocWithZone((Class)_SFLanguageDetectorOptions);
    v2 = 0;
    v3 = 10;
  }
  else
  {
    v4 = v0[8];
    if (v4 < 0)
    {
      __break(1u);
      return;
    }
    objc_allocWithZone((Class)_SFLanguageDetectorOptions);
    v2 = swift_bridgeObjectRetain();
    v3 = v4;
  }
  v5 = sub_1B25A18A0(v2, v3);
  v0[9] = v5;
  v6 = v0[6];
  v7 = v0[3];
  v8 = sub_1B250B778();
  v0[10] = v8;
  sub_1B24AD25C(v7, v6, &qword_1EEFD6E90);
  v9 = type metadata accessor for AnalysisOptions(0);
  EnumTagSinglePayload = __swift_getEnumTagSinglePayload(v6, 1, v9);
  v11 = v0[6];
  if (EnumTagSinglePayload == 1)
  {
    sub_1B254E678(v0[6], &qword_1EEFD6E90);
    v12 = 0;
  }
  else
  {
    sub_1B25CCCD0();
    if (*(_QWORD *)(v11 + *(int *)(v9 + 24) + 8))
    {
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
    }
    v13 = v0[6];
    v14 = objc_allocWithZone((Class)_SFAnalysisOptions);
    sub_1B25A1918();
    v12 = v15;
    sub_1B25A1CC0(v13);
  }
  v0[11] = v12;
  if (qword_1ED36D218 != -1)
    swift_once();
  v16 = (_QWORD *)swift_task_alloc();
  v0[12] = v16;
  *v16 = v0;
  v16[1] = sub_1B259E564;
  sub_1B24B6CA4((uint64_t)v5, (uint64_t)v8, v12);
}

uint64_t sub_1B259E564(uint64_t a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v3;

  v3 = *v2;
  *(_QWORD *)(v3 + 104) = a1;
  *(_QWORD *)(v3 + 112) = v1;
  OUTLINED_FUNCTION_237();
  OUTLINED_FUNCTION_17();
  return OUTLINED_FUNCTION_8();
}

uint64_t sub_1B259E5C0()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;

  v1 = v0[13];
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EEFDB658);
  v2 = OUTLINED_FUNCTION_8_4();
  v0[15] = v2;
  *(_QWORD *)(v2 + 16) = v1;
  OUTLINED_FUNCTION_289();
  v3 = (_QWORD *)swift_task_alloc();
  v0[16] = v3;
  *v3 = v0;
  v3[1] = sub_1B259E630;
  return sub_1B2578708();
}

uint64_t sub_1B259E630()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 136) = v0;
  swift_task_dealloc();
  OUTLINED_FUNCTION_17();
  return OUTLINED_FUNCTION_8();
}

uint64_t sub_1B259E688()
{
  uint64_t v0;
  void *v1;
  void *v2;
  void *v3;
  uint64_t v4;

  v2 = *(void **)(v0 + 80);
  v1 = *(void **)(v0 + 88);
  v3 = *(void **)(v0 + 72);
  sub_1B24AD25C(*(_QWORD *)(v0 + 24), *(_QWORD *)(v0 + 40), &qword_1EEFD6E90);
  v4 = swift_allocObject();
  sub_1B259F544();
  OUTLINED_FUNCTION_50_4();

  OUTLINED_FUNCTION_95();
  swift_task_dealloc();
  return OUTLINED_FUNCTION_185(v4, *(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_1B259E734()
{
  uint64_t v0;
  void *v1;
  void *v2;

  v2 = *(void **)(v0 + 80);
  swift_release();
  swift_release();

  OUTLINED_FUNCTION_42_15();
  OUTLINED_FUNCTION_48();
  OUTLINED_FUNCTION_95();
  return OUTLINED_FUNCTION_3_5(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_1B259E788()
{
  uint64_t v0;
  void *v1;

  OUTLINED_FUNCTION_42_15();
  OUTLINED_FUNCTION_48();
  OUTLINED_FUNCTION_95();
  return OUTLINED_FUNCTION_3_5(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_1B259E7C8()
{
  return sub_1B259E7EC();
}

uint64_t sub_1B259E7EC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
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
  uint64_t v18;
  unint64_t v19;
  uint64_t v20;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;

  OUTLINED_FUNCTION_59_0();
  v24 = v1;
  v25 = v2;
  v22 = v3;
  v23 = v4;
  v6 = v5;
  v8 = __swift_instantiateConcreteTypeFromMangledName(v7);
  v9 = *(_QWORD *)(v8 - 8);
  v10 = *(_QWORD *)(v9 + 64);
  MEMORY[0x1E0C80A78](v8, v11);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EEFD71C0);
  OUTLINED_FUNCTION_30_0();
  MEMORY[0x1E0C80A78](v12, v13);
  OUTLINED_FUNCTION_41_1();
  v16 = v15 - v14;
  sub_1B24AD25C(v6, v15 - v14, &qword_1EEFD71C0);
  v17 = v0 + *(_QWORD *)(*(_QWORD *)v0 + 96);
  v18 = OUTLINED_FUNCTION_8_4();
  swift_weakInit();
  (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))((char *)&v22 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0), v17, v8);
  v19 = (*(unsigned __int8 *)(v9 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80);
  v20 = swift_allocObject();
  *(_QWORD *)(v20 + 16) = 0;
  *(_QWORD *)(v20 + 24) = 0;
  (*(void (**)(unint64_t, char *, uint64_t))(v9 + 32))(v20 + v19, (char *)&v22 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0), v8);
  *(_QWORD *)(v20 + ((v10 + v19 + 7) & 0xFFFFFFFFFFFFFFF8)) = v18;
  sub_1B24C52C0(v16, v23, v20);
  return swift_release();
}

uint64_t sub_1B259E940(uint64_t result, uint64_t a2)
{
  uint64_t v3;

  if (result)
  {
    if (a2 + 0x4000000000000000 < 0)
    {
      __break(1u);
    }
    else
    {
      v3 = 2 * a2;
      if (2 * a2)
      {
        if (v3 <= 14)
        {
          return sub_1B25CC544();
        }
        else
        {
          sub_1B25CC310();
          OUTLINED_FUNCTION_24_13();
          sub_1B25CC304();
          if ((unint64_t)v3 >= 0x7FFFFFFF)
          {
            sub_1B25CC55C();
            result = OUTLINED_FUNCTION_8_4();
            *(_QWORD *)(result + 16) = 0;
            *(_QWORD *)(result + 24) = v3;
          }
          else
          {
            return a2 << 33;
          }
        }
      }
      else
      {
        return 0;
      }
    }
  }
  return result;
}

uint64_t sub_1B259EA00()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(v1 + 16) = v0;
  return OUTLINED_FUNCTION_10_3();
}

uint64_t sub_1B259EA14()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;
  uint64_t (*v4)(uint64_t);

  v1 = *(_QWORD *)(*(_QWORD *)(v0 + 16) + 120);
  v4 = (uint64_t (*)(uint64_t))((char *)&dword_1EEFDA3C0 + dword_1EEFDA3C0);
  v2 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 24) = v2;
  OUTLINED_FUNCTION_18_0(v2, (uint64_t)sub_1B259EA74);
  return v4(v1);
}

uint64_t sub_1B259EA74(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;

  v4 = OUTLINED_FUNCTION_81();
  if (!v1)
    v4 = a1;
  return OUTLINED_FUNCTION_185(v4, *(uint64_t (**)(void))(v2 + 8));
}

id sub_1B259EAB8()
{
  return sub_1B259EAC4(sub_1B25A1BCC);
}

id sub_1B259EAC4(void (*a1)(void))
{
  id v2;
  id v3;
  id v4;

  v2 = objc_msgSend((id)objc_opt_self(), sel_anonymousListener);
  v3 = objc_msgSend(v2, sel_endpoint);
  v4 = v3;
  sub_1B2556C8C(a1);

  return v3;
}

uint64_t sub_1B259EB7C(uint64_t a1)
{
  return sub_1B259EB90(a1, (uint64_t)&unk_1E6485130, (uint64_t)sub_1B25A1BE0);
}

uint64_t sub_1B259EB90(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  os_unfair_lock_s *v7;

  v7 = *(os_unfair_lock_s **)(*(_QWORD *)(v3 + 128) + 16);
  OUTLINED_FUNCTION_289();
  swift_retain();
  os_unfair_lock_lock(v7);
  sub_1B259EC14(v3, a1, a2, a3);
  os_unfair_lock_unlock(v7);
  swift_release();
  return swift_release();
}

uint64_t sub_1B259EC14(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;

  v5 = *(void **)(a2 + 112);
  v6 = *(void **)(a2 + 120);
  v7 = *(unsigned __int8 *)(a2 + 128);
  v8 = swift_allocObject();
  swift_weakInit();
  swift_beginAccess();
  sub_1B24A1AF4(v5, v6, v7);
  swift_retain();
  sub_1B2569514(a4, v8, (uint64_t)v5, (uint64_t)v6, v7);
  swift_endAccess();
  sub_1B24AB77C(v5, v6, v7);
  return swift_release();
}

uint64_t sub_1B259ECF4(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t), uint64_t a4)
{
  uint64_t Strong;

  OUTLINED_FUNCTION_15_3();
  Strong = swift_weakLoadStrong();
  if (Strong)
    sub_1B24ADAD8(a2, 255, a3, a4);
  return Strong;
}

void sub_1B259ED6C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v1 = OUTLINED_FUNCTION_147();
  v2 = *(_QWORD *)(v1 - 8);
  MEMORY[0x1E0C80A78](v1, v3);
  OUTLINED_FUNCTION_41_1();
  v6 = v5 - v4;
  if (qword_1ED36CF48 != -1)
    swift_once();
  v7 = __swift_project_value_buffer(v1, (uint64_t)qword_1ED36D980);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v2 + 16))(v6, v7, v1);
  sub_1B24B37D4((*(_BYTE *)(v0 + 24) & 1) == 0, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SpeechFramework/SpeechAnalyzer/Misc.swift", 79, 2, 30, v6);
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v6, v1);
  OUTLINED_FUNCTION_262();
}

uint64_t sub_1B259EE38()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v8;

  v1 = sub_1B25CC8C8();
  v2 = *(_QWORD *)(v1 - 8);
  MEMORY[0x1E0C80A78](v1, v3);
  v5 = (char *)&v8 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_1ED36CF48 != -1)
    swift_once();
  v6 = __swift_project_value_buffer(v1, (uint64_t)qword_1ED36D980);
  (*(void (**)(char *, uint64_t, uint64_t))(v2 + 16))(v5, v6, v1);
  sub_1B24B37D4((*(_BYTE *)(v0 + 32) & 1) == 0, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SpeechFramework/SpeechAnalyzer/Misc.swift", 79, 2, 30, (uint64_t)v5);
  return (*(uint64_t (**)(char *, uint64_t))(v2 + 8))(v5, v1);
}

uint64_t sub_1B259EF1C(uint64_t a1)
{
  uint64_t v1;

  sub_1B259ED6C();
  *(_QWORD *)(v1 + 16) = a1;
  return swift_release();
}

uint64_t sub_1B259EF44(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v5;

  sub_1B259EE38();
  v5 = *(_QWORD *)(v2 + 16);
  *(_QWORD *)(v2 + 16) = a1;
  *(_QWORD *)(v2 + 24) = a2;
  return sub_1B24C4564(v5);
}

void sub_1B259EF78()
{
  sub_1B259EF9C();
}

void sub_1B259EF9C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t *v2;
  uint64_t *v3;
  uint64_t *v4;
  uint64_t *v5;
  uint64_t *v6;
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
  uint64_t v22;
  uint64_t v23;

  OUTLINED_FUNCTION_59_0();
  v3 = v2;
  v5 = v4;
  v7 = v6;
  v9 = __swift_instantiateConcreteTypeFromMangledName(v8);
  v10 = *(_QWORD *)(v9 - 8);
  MEMORY[0x1E0C80A78](v9, v11);
  OUTLINED_FUNCTION_41_1();
  v14 = v13 - v12;
  v23 = __swift_instantiateConcreteTypeFromMangledName(v7);
  v15 = *(_QWORD *)(v23 - 8);
  MEMORY[0x1E0C80A78](v23, v16);
  OUTLINED_FUNCTION_41_1();
  v19 = v18 - v17;
  v20 = __swift_instantiateConcreteTypeFromMangledName(v5);
  v21 = *(_QWORD *)(v20 - 8);
  MEMORY[0x1E0C80A78](v20, v22);
  OUTLINED_FUNCTION_622();
  __swift_instantiateConcreteTypeFromMangledName(v3);
  (*(void (**)(uint64_t, _QWORD, uint64_t))(v10 + 104))(v14, *MEMORY[0x1E0DF07B8], v9);
  sub_1B25CCCE8();
  (*(void (**)(uint64_t, uint64_t))(v10 + 8))(v14, v9);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v21 + 32))(v0 + *(_QWORD *)(*(_QWORD *)v0 + 96), v1, v20);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v15 + 32))(v0 + *(_QWORD *)(*(_QWORD *)v0 + 104), v19, v23);
  OUTLINED_FUNCTION_7_1();
}

uint64_t sub_1B259F0DC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _QWORD *v5;
  uint64_t v6;

  v5[7] = a4;
  v5[8] = a5;
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEFD6890);
  v5[9] = v6;
  v5[10] = *(_QWORD *)(v6 - 8);
  v5[11] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_1B259F140()
{
  uint64_t v0;
  _QWORD *v1;

  OUTLINED_FUNCTION_23_10();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EEFD7200);
  sub_1B25CCD18();
  OUTLINED_FUNCTION_15_3();
  v0 = swift_task_alloc();
  v1 = (_QWORD *)OUTLINED_FUNCTION_21_8(v0);
  OUTLINED_FUNCTION_0_6(v1);
  return OUTLINED_FUNCTION_8_10();
}

uint64_t sub_1B259F1A8()
{
  OUTLINED_FUNCTION_81();
  OUTLINED_FUNCTION_17();
  return OUTLINED_FUNCTION_8();
}

uint64_t sub_1B259F1E4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  _QWORD *v6;

  v2 = *(_QWORD *)(v0 + 40);
  v1 = *(_QWORD *)(v0 + 48);
  *(_QWORD *)(v0 + 104) = v2;
  *(_QWORD *)(v0 + 112) = v1;
  if (v2)
  {
    v3 = OUTLINED_FUNCTION_30_6();
    *(_QWORD *)(v0 + 120) = v3;
    if (v3)
    {
      return OUTLINED_FUNCTION_2_0();
    }
    else
    {
      OUTLINED_FUNCTION_61_13();
      v5 = swift_task_alloc();
      v6 = (_QWORD *)OUTLINED_FUNCTION_21_8(v5);
      *v6 = v0;
      v6[1] = sub_1B259F1A8;
      OUTLINED_FUNCTION_17();
      return OUTLINED_FUNCTION_21_16();
    }
  }
  else
  {
    OUTLINED_FUNCTION_20_8();
    swift_task_dealloc();
    return OUTLINED_FUNCTION_3_5(*(uint64_t (**)(void))(v0 + 8));
  }
}

uint64_t sub_1B259F290(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v9;

  OUTLINED_FUNCTION_19_7(a1, a2, a3, a4, a5, a6, a7, a8, v9);
  OUTLINED_FUNCTION_17();
  return OUTLINED_FUNCTION_8();
}

uint64_t sub_1B259F2BC()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;

  sub_1B24C4564(*(_QWORD *)(v0 + 104));
  OUTLINED_FUNCTION_50_4();
  v1 = swift_task_alloc();
  v2 = (_QWORD *)OUTLINED_FUNCTION_21_8(v1);
  OUTLINED_FUNCTION_0_6(v2);
  return OUTLINED_FUNCTION_11_7();
}

uint64_t sub_1B259F310(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _QWORD *v5;
  uint64_t v6;

  v5[7] = a4;
  v5[8] = a5;
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEFDB680);
  v5[9] = v6;
  v5[10] = *(_QWORD *)(v6 - 8);
  v5[11] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_1B259F374()
{
  uint64_t v0;
  _QWORD *v1;

  OUTLINED_FUNCTION_23_10();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EEFDB668);
  sub_1B25CCD18();
  OUTLINED_FUNCTION_15_3();
  v0 = swift_task_alloc();
  v1 = (_QWORD *)OUTLINED_FUNCTION_21_8(v0);
  OUTLINED_FUNCTION_0_6(v1);
  return OUTLINED_FUNCTION_8_10();
}

uint64_t sub_1B259F3DC()
{
  OUTLINED_FUNCTION_81();
  OUTLINED_FUNCTION_17();
  return OUTLINED_FUNCTION_8();
}

uint64_t sub_1B259F418()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  _QWORD *v6;

  v2 = *(_QWORD *)(v0 + 40);
  v1 = *(_QWORD *)(v0 + 48);
  *(_QWORD *)(v0 + 104) = v2;
  *(_QWORD *)(v0 + 112) = v1;
  if (v2)
  {
    v3 = OUTLINED_FUNCTION_30_6();
    *(_QWORD *)(v0 + 120) = v3;
    if (v3)
    {
      return OUTLINED_FUNCTION_2_0();
    }
    else
    {
      OUTLINED_FUNCTION_61_13();
      v5 = swift_task_alloc();
      v6 = (_QWORD *)OUTLINED_FUNCTION_21_8(v5);
      *v6 = v0;
      v6[1] = sub_1B259F3DC;
      OUTLINED_FUNCTION_17();
      return OUTLINED_FUNCTION_21_16();
    }
  }
  else
  {
    OUTLINED_FUNCTION_20_8();
    swift_task_dealloc();
    return OUTLINED_FUNCTION_3_5(*(uint64_t (**)(void))(v0 + 8));
  }
}

uint64_t sub_1B259F4C4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v9;

  OUTLINED_FUNCTION_19_7(a1, a2, a3, a4, a5, a6, a7, a8, v9);
  OUTLINED_FUNCTION_17();
  return OUTLINED_FUNCTION_8();
}

uint64_t sub_1B259F4F0()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;

  sub_1B24C4564(*(_QWORD *)(v0 + 104));
  OUTLINED_FUNCTION_50_4();
  v1 = swift_task_alloc();
  v2 = (_QWORD *)OUTLINED_FUNCTION_21_8(v1);
  OUTLINED_FUNCTION_0_6(v2);
  return OUTLINED_FUNCTION_11_7();
}

void sub_1B259F544()
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
  char *v21;
  uint64_t v22;
  uint64_t v23;
  char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  int EnumTagSinglePayload;
  uint64_t v30;
  os_unfair_lock_s *v31;
  uint64_t v32;
  uint64_t v33;
  NSObject *v34;
  os_log_type_t v35;
  uint8_t *v36;
  uint64_t v37;
  uint64_t v38;
  unint64_t v39;
  void (*v40)(char *, uint64_t);
  _QWORD v41[3];
  char *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;

  OUTLINED_FUNCTION_59_0();
  v3 = v2;
  v5 = v4;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EEFD71C0);
  OUTLINED_FUNCTION_30_0();
  MEMORY[0x1E0C80A78](v6, v7);
  OUTLINED_FUNCTION_622();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EEFD6E90);
  OUTLINED_FUNCTION_30_0();
  MEMORY[0x1E0C80A78](v8, v9);
  OUTLINED_FUNCTION_41_1();
  v12 = v11 - v10;
  v13 = sub_1B25CCCDC();
  v14 = *(_QWORD *)(v13 - 8);
  v16 = MEMORY[0x1E0C80A78](v13, v15);
  v42 = (char *)v41 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v19 = MEMORY[0x1E0C80A78](v16, v18);
  v21 = (char *)v41 - v20;
  MEMORY[0x1E0C80A78](v19, v22);
  v24 = (char *)v41 - v23;
  swift_defaultActor_initialize();
  *(_QWORD *)(v0 + 112) = 0;
  *(_OWORD *)(v0 + 128) = 0u;
  *(_OWORD *)(v0 + 144) = 0u;
  *(_OWORD *)(v0 + 160) = 0u;
  *(_BYTE *)(v0 + 176) = 1;
  *(_QWORD *)(v0 + 192) = 0;
  *(_QWORD *)(v0 + 200) = 0;
  *(_QWORD *)(v0 + 184) = 0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EEFD9190);
  v25 = OUTLINED_FUNCTION_8_4();
  *(_QWORD *)(v25 + 16) = 0;
  *(_QWORD *)(v25 + 24) = 0;
  *(_BYTE *)(v25 + 32) = 0;
  v26 = MEMORY[0x1E0DEE9D8];
  *(_QWORD *)(v0 + 208) = v25;
  *(_QWORD *)(v0 + 216) = v26;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EEFDB660);
  OUTLINED_FUNCTION_24_13();
  sub_1B259EF9C();
  *(_QWORD *)(v0 + 224) = v27;
  *(_QWORD *)(v0 + 120) = v5;
  v43 = v3;
  sub_1B24AD25C(v3, v12, &qword_1EEFD6E90);
  v28 = type metadata accessor for AnalysisOptions(0);
  EnumTagSinglePayload = __swift_getEnumTagSinglePayload(v12, 1, v28);
  v44 = v5;
  if (EnumTagSinglePayload == 1)
  {
    OUTLINED_FUNCTION_289();
    sub_1B254E678(v12, &qword_1EEFD6E90);
    sub_1B25CCD60();
  }
  else
  {
    (*(void (**)(char *, uint64_t, uint64_t))(v14 + 16))(v21, v12, v13);
    OUTLINED_FUNCTION_289();
    sub_1B25A1CC0(v12);
    (*(void (**)(char *, char *, uint64_t))(v14 + 32))(v24, v21, v13);
  }
  OUTLINED_FUNCTION_53_12(v1);
  __swift_storeEnumTagSinglePayload(v1, 0, 1, v13);
  sub_1B259E7EC();
  sub_1B254E678(v1, &qword_1EEFD71C0);
  v30 = (uint64_t)v42;
  if (qword_1ED36D200 != -1)
    swift_once();
  v31 = (os_unfair_lock_s *)qword_1ED36D958;
  v32 = OUTLINED_FUNCTION_99_1();
  sub_1B25A1AF0(v32, v31);
  OUTLINED_FUNCTION_50_4();
  if (qword_1ED36CF48 != -1)
    swift_once();
  v33 = OUTLINED_FUNCTION_147();
  __swift_project_value_buffer(v33, (uint64_t)qword_1ED36D980);
  OUTLINED_FUNCTION_53_12(v30);
  v34 = sub_1B25CC8B0();
  v35 = sub_1B25CCFC4();
  if (os_log_type_enabled(v34, v35))
  {
    v36 = (uint8_t *)OUTLINED_FUNCTION_246();
    v37 = OUTLINED_FUNCTION_246();
    v41[1] = v14;
    v41[2] = v24;
    v46 = v37;
    *(_DWORD *)v36 = 136315138;
    sub_1B24ADAD8(&qword_1EEFD7108, 255, (uint64_t (*)(uint64_t))MEMORY[0x1E0DF0750], MEMORY[0x1E0DF0768]);
    v38 = sub_1B25CD570();
    v45 = sub_1B2504AB0(v38, v39, &v46);
    sub_1B25CD12C();
    swift_bridgeObjectRelease();
    OUTLINED_FUNCTION_58_13();
    _os_log_impl(&dword_1B2494000, v34, v35, "LanguageDetectorWorker: Operating at priority %s", v36, 0xCu);
    swift_arrayDestroy();
    OUTLINED_FUNCTION_174();
  }

  swift_release();
  v40 = *(void (**)(char *, uint64_t))(v14 + 8);
  OUTLINED_FUNCTION_58_13();
  sub_1B254E678(v43, &qword_1EEFD6E90);
  v40(v24, v13);
  OUTLINED_FUNCTION_7_1();
}

uint64_t sub_1B259F9A8(uint64_t a1, const void *a2, _OWORD *a3)
{
  uint64_t v3;
  uint64_t v4;
  __int128 v6;
  uint64_t v7;

  v6 = a3[1];
  *(_OWORD *)(v4 + 216) = *a3;
  *(_QWORD *)(v4 + 200) = a3;
  *(_QWORD *)(v4 + 208) = v3;
  *(_QWORD *)(v4 + 192) = a1;
  *(_OWORD *)(v4 + 232) = v6;
  *(_OWORD *)(v4 + 248) = a3[2];
  v7 = OUTLINED_FUNCTION_147();
  *(_QWORD *)(v4 + 264) = v7;
  *(_QWORD *)(v4 + 272) = *(_QWORD *)(v7 - 8);
  *(_QWORD *)(v4 + 280) = swift_task_alloc();
  *(_QWORD *)(v4 + 288) = swift_task_alloc();
  memcpy((void *)(v4 + 16), a2, 0x41uLL);
  return OUTLINED_FUNCTION_2_0();
}

uint64_t sub_1B259FA48()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;
  unsigned int v9;
  uint64_t v10;
  id v11;
  id v12;
  uint64_t v13;
  char v14;
  id v15;
  void *v16;
  uint64_t v17;
  _QWORD *v18;
  uint64_t v20;
  id v21;
  id v22;
  uint64_t v23;
  _QWORD *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t (*v28)(uint64_t, uint64_t, uint64_t);

  OUTLINED_FUNCTION_49();
  v1 = *(_QWORD **)(v0 + 208);
  v2 = v1[23];
  if (v2)
  {
    *(_QWORD *)(v0 + 336) = *(_QWORD *)(v2 + 16);
    v3 = qword_1ED36CF48;
    swift_retain();
    if (v3 != -1)
      swift_once();
    v4 = *(_QWORD *)(v0 + 288);
    v27 = *(_QWORD *)(v0 + 280);
    v5 = __swift_project_value_buffer(*(_QWORD *)(v0 + 264), (uint64_t)qword_1ED36D980);
    v6 = OUTLINED_FUNCTION_18_15(v5);
    v7 = *(void **)(v0 + 16);
    v8 = OUTLINED_FUNCTION_86_1(v6, sel_format);
    v9 = objc_msgSend(v8, sel_channelCount);

    OUTLINED_FUNCTION_33_13(v9 == 1, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SpeechFramework/SpeechAnalyzer/LanguageDetectorWorker.swift");
    OUTLINED_FUNCTION_31_11();
    v10 = OUTLINED_FUNCTION_24_18(v27);
    v11 = OUTLINED_FUNCTION_86_1(v10, sel_format);
    v12 = objc_msgSend(v11, sel_commonFormat);

    v14 = v12 == (id)3 && OUTLINED_FUNCTION_86_1(v13, sel_int16ChannelData) != 0;
    OUTLINED_FUNCTION_32_18(v14, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SpeechFramework/SpeechAnalyzer/LanguageDetectorWorker.swift");
    v20 = OUTLINED_FUNCTION_62_13();
    v21 = OUTLINED_FUNCTION_86_1(v20, sel_int16ChannelData);
    v22 = OUTLINED_FUNCTION_86_1((uint64_t)v21, (const char *)(v4 + 3830));
    objc_msgSend(v22, sel_channelCount);

    *(_QWORD *)(v0 + 352) = OUTLINED_FUNCTION_54_12(objc_msgSend(v7, sel_frameLength));
    *(_QWORD *)(v0 + 360) = v23;
    v24 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 368) = v24;
    v25 = OUTLINED_FUNCTION_39_11(v24, (uint64_t)sub_1B259FFE4);
    return OUTLINED_FUNCTION_11_14(v25, v26);
  }
  else
  {
    v15 = objc_msgSend(*(id *)(v0 + 16), sel_format);
    v16 = (void *)v1[24];
    v1[24] = v15;

    v17 = v1[15];
    OUTLINED_FUNCTION_289();
    sub_1B24EA014((id *)(v0 + 16));
    v28 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))((char *)&dword_1EEFDA2E8 + dword_1EEFDA2E8);
    v18 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 296) = v18;
    *v18 = v0;
    v18[1] = sub_1B259FC98;
    return v28(v17, *(_QWORD *)(v0 + 208), v0 + 16);
  }
}

uint64_t sub_1B259FC98()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t *v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_176();
  v3 = *v2;
  *(_QWORD *)(v0 + 304) = v4;
  OUTLINED_FUNCTION_237();
  if (!v1)
    return OUTLINED_FUNCTION_2_0();
  swift_task_dealloc();
  OUTLINED_FUNCTION_48();
  return OUTLINED_FUNCTION_15_0(*(uint64_t (**)(void))(v3 + 8));
}

uint64_t sub_1B259FD00()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v1 = *(_QWORD *)(v0 + 304);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EEFDB620);
  v2 = OUTLINED_FUNCTION_8_4();
  *(_QWORD *)(v0 + 312) = v2;
  *(_QWORD *)(v2 + 16) = v1;
  OUTLINED_FUNCTION_289();
  OUTLINED_FUNCTION_17();
  return OUTLINED_FUNCTION_8();
}

uint64_t sub_1B259FD4C()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 320) = v1;
  OUTLINED_FUNCTION_18_0(v1, (uint64_t)sub_1B259FD94);
  return sub_1B251A088();
}

uint64_t sub_1B259FD94()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;

  OUTLINED_FUNCTION_176();
  OUTLINED_FUNCTION_177(v2);
  *(_QWORD *)(v0 + 328) = v1;
  swift_task_dealloc();
  return OUTLINED_FUNCTION_2_0();
}

uint64_t sub_1B259FDE8()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;
  unsigned int v6;
  uint64_t v7;
  id v8;
  id v9;
  uint64_t v10;
  char v11;
  uint64_t v12;
  id v13;
  id v14;
  uint64_t v15;
  _QWORD *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v20;

  OUTLINED_FUNCTION_49();
  *(_QWORD *)(v0[26] + 184) = v0[39];
  swift_release();
  v0[42] = v0[38];
  if (qword_1ED36CF48 != -1)
    swift_once();
  v1 = v0[36];
  v20 = v0[35];
  v2 = __swift_project_value_buffer(v0[33], (uint64_t)qword_1ED36D980);
  v3 = OUTLINED_FUNCTION_18_15(v2);
  v4 = (void *)v0[2];
  v5 = OUTLINED_FUNCTION_86_1(v3, sel_format);
  v6 = objc_msgSend(v5, sel_channelCount);

  OUTLINED_FUNCTION_33_13(v6 == 1, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SpeechFramework/SpeechAnalyzer/LanguageDetectorWorker.swift");
  OUTLINED_FUNCTION_31_11();
  v7 = OUTLINED_FUNCTION_24_18(v20);
  v8 = OUTLINED_FUNCTION_86_1(v7, sel_format);
  v9 = objc_msgSend(v8, sel_commonFormat);

  v11 = v9 == (id)3 && OUTLINED_FUNCTION_86_1(v10, sel_int16ChannelData) != 0;
  OUTLINED_FUNCTION_32_18(v11, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SpeechFramework/SpeechAnalyzer/LanguageDetectorWorker.swift");
  v12 = OUTLINED_FUNCTION_62_13();
  v13 = OUTLINED_FUNCTION_86_1(v12, sel_int16ChannelData);
  v14 = OUTLINED_FUNCTION_86_1((uint64_t)v13, (const char *)(v1 + 3830));
  objc_msgSend(v14, sel_channelCount);

  v0[44] = OUTLINED_FUNCTION_54_12(objc_msgSend(v4, sel_frameLength));
  v0[45] = v15;
  v16 = (_QWORD *)swift_task_alloc();
  v0[46] = v16;
  v17 = OUTLINED_FUNCTION_39_11(v16, (uint64_t)sub_1B259FFE4);
  return OUTLINED_FUNCTION_11_14(v17, v18);
}

uint64_t sub_1B259FFA4()
{
  uint64_t v0;

  swift_release();
  swift_release();
  swift_task_dealloc();
  OUTLINED_FUNCTION_48();
  return OUTLINED_FUNCTION_15_0(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_1B259FFE4()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;

  OUTLINED_FUNCTION_176();
  OUTLINED_FUNCTION_177(v2);
  *(_QWORD *)(v0 + 376) = v1;
  swift_task_dealloc();
  return OUTLINED_FUNCTION_2_0();
}

void sub_1B25A0038()
{
  os_log_type_t v0;
  uint64_t v1;
  NSObject *v2;
  os_log_type_t v3;
  unint64_t v4;
  uint64_t v5;
  uint8_t *v6;
  uint64_t v7;
  uint64_t *v8;
  uint64_t *v9;
  uint64_t *v10;
  uint64_t *v11;
  uint64_t *v12;
  _QWORD *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  __int128 v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  NSObject *v23;
  os_log_type_t v24;
  uint8_t *v25;
  _QWORD *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void (*v30)(void);
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;

  sub_1B249B498(*(_QWORD *)(v1 + 352), *(_QWORD *)(v1 + 360));
  v2 = sub_1B25CC8B0();
  v3 = sub_1B25CCFC4();
  if (OUTLINED_FUNCTION_9_1(v3))
  {
    v5 = *(_QWORD *)(v1 + 352);
    v4 = *(_QWORD *)(v1 + 360);
    v6 = (uint8_t *)OUTLINED_FUNCTION_246();
    *(_DWORD *)v6 = 134217984;
    *(_QWORD *)(v1 + 184) = sub_1B25CC598();
    sub_1B25CD12C();
    sub_1B24AB6DC(v5, v4);
    _os_log_impl(&dword_1B2494000, v2, v0, "Added audio: %ld", v6, 0xCu);
    OUTLINED_FUNCTION_174();
  }
  sub_1B24AB6DC(*(_QWORD *)(v1 + 352), *(_QWORD *)(v1 + 360));
  v7 = *(_QWORD *)(v1 + 208);

  if (*(_BYTE *)(v7 + 176) == 1)
  {
    v8 = (uint64_t *)(v1 + 256);
    v9 = (uint64_t *)(v1 + 248);
    v10 = (uint64_t *)(v1 + 240);
    v11 = (uint64_t *)(v1 + 232);
    v12 = (uint64_t *)(v1 + 224);
    v13 = (_QWORD *)(v1 + 216);
  }
  else
  {
    v13 = (_QWORD *)(v1 + 136);
    v15 = *(_QWORD *)(v7 + 160);
    v14 = *(_QWORD *)(v7 + 168);
    v16 = *(_QWORD *)(v7 + 136);
    v17 = *(_OWORD *)(v7 + 144);
    *(_QWORD *)(v1 + 88) = *(_QWORD *)(v7 + 128);
    *(_QWORD *)(v1 + 96) = v16;
    *(_OWORD *)(v1 + 104) = v17;
    *(_QWORD *)(v1 + 120) = v15;
    *(_QWORD *)(v1 + 128) = v14;
    sub_1B25CCF94();
    v12 = (uint64_t *)(v1 + 144);
    v11 = (uint64_t *)(v1 + 152);
    v10 = (uint64_t *)(v1 + 160);
    v9 = (uint64_t *)(v1 + 168);
    v8 = (uint64_t *)(v1 + 176);
  }
  v18 = *v8;
  v19 = *v9;
  v20 = *v10;
  v21 = *v11;
  v22 = *v12;
  *(_QWORD *)(v7 + 128) = *v13;
  *(_QWORD *)(v7 + 136) = v22;
  *(_QWORD *)(v7 + 144) = v21;
  *(_QWORD *)(v7 + 152) = v20;
  *(_QWORD *)(v7 + 160) = v19;
  *(_QWORD *)(v7 + 168) = v18;
  *(_BYTE *)(v7 + 176) = 0;
  v23 = sub_1B25CC8B0();
  v24 = sub_1B25CCFC4();
  if (OUTLINED_FUNCTION_9_1(v24))
  {
    v25 = (uint8_t *)OUTLINED_FUNCTION_246();
    *(_WORD *)v25 = 0;
    _os_log_impl(&dword_1B2494000, v23, (os_log_type_t)v13, "Processing audio", v25, 2u);
    OUTLINED_FUNCTION_174();
  }

  if ((*(_BYTE *)(v7 + 176) & 1) != 0)
  {
    __break(1u);
  }
  else
  {
    v26 = *(_QWORD **)(v1 + 192);
    v27 = *(_QWORD *)(v7 + 160);
    v32 = *(_QWORD *)(v7 + 152);
    v33 = *(_QWORD *)(v7 + 168);
    v28 = *(_QWORD *)(v7 + 136);
    v31 = *(_QWORD *)(v7 + 144);
    v29 = *(_QWORD *)(v7 + 128);
    swift_release();
    OUTLINED_FUNCTION_293_1();
    OUTLINED_FUNCTION_95();
    swift_task_dealloc();
    *v26 = v29;
    v26[1] = v28;
    v26[2] = v31;
    v26[3] = v32;
    v26[4] = v27;
    v26[5] = v33;
    v30 = (void (*)(void))OUTLINED_FUNCTION_66();
    v30();
  }
}

uint64_t sub_1B25A02AC()
{
  uint64_t v0;

  swift_release();
  OUTLINED_FUNCTION_293_1();
  swift_task_dealloc();
  OUTLINED_FUNCTION_48();
  return OUTLINED_FUNCTION_15_0(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_1B25A02EC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v4;

  v4[4] = a3;
  v4[5] = a4;
  v4[2] = a1;
  v4[3] = a2;
  return OUTLINED_FUNCTION_10_3();
}

void sub_1B25A0304()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  double v9;
  double v10;
  _QWORD *v11;

  v1 = v0[4];
  v2 = *(_QWORD *)(v0[3] + 136);
  type metadata accessor for EARLanguageDetectorResultStream();
  v3 = swift_allocObject();
  OUTLINED_FUNCTION_289();
  OUTLINED_FUNCTION_99_1();
  swift_defaultActor_initialize();
  *(_QWORD *)(v3 + 152) = 0;
  swift_unknownObjectWeakInit();
  *(_QWORD *)(v3 + 136) = v2;
  OUTLINED_FUNCTION_289();
  *(_QWORD *)(v3 + 112) = sub_1B259EAC4(sub_1B25A1BCC);
  *(_QWORD *)(v3 + 120) = v4;
  *(_BYTE *)(v3 + 128) = v5;
  *(_QWORD *)(v3 + 152) = &off_1E647C728;
  swift_unknownObjectWeakAssign();
  OUTLINED_FUNCTION_289();
  sub_1B259EB90(v3, (uint64_t)&unk_1E6485108, (uint64_t)sub_1B25A1BC4);
  swift_release_n();
  OUTLINED_FUNCTION_50_4();
  *(_QWORD *)(v1 + 200) = v3;
  swift_release();
  v6 = *(_QWORD *)(v1 + 200);
  v0[6] = v6;
  if (!v6)
    goto LABEL_9;
  v7 = swift_retain();
  v8 = OUTLINED_FUNCTION_86_1(v7, sel_format);
  objc_msgSend(v8, sel_sampleRate);
  v10 = v9;

  if ((~*(_QWORD *)&v10 & 0x7FF0000000000000) != 0)
  {
    if (v10 > -1.0)
    {
      if (v10 < 1.84467441e19)
      {
        v11 = (_QWORD *)swift_task_alloc();
        v0[7] = v11;
        *v11 = v0;
        v11[1] = sub_1B25A049C;
        sub_1B2578BDC(v6, (unint64_t)v10);
        return;
      }
      goto LABEL_8;
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
LABEL_8:
  __break(1u);
LABEL_9:
  __break(1u);
}

uint64_t sub_1B25A049C(uint64_t a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v4;
  uint64_t v6;

  v6 = *v2;
  v4 = v6;
  OUTLINED_FUNCTION_177(&v6);
  *(_QWORD *)(v4 + 64) = v1;
  swift_task_dealloc();
  if (!v1)
  {
    swift_release();
    *(_QWORD *)(v4 + 72) = a1;
  }
  return swift_task_switch();
}

uint64_t sub_1B25A051C()
{
  uint64_t v0;
  uint64_t (*v1)(void);

  **(_QWORD **)(v0 + 16) = *(_QWORD *)(v0 + 72);
  v1 = (uint64_t (*)(void))OUTLINED_FUNCTION_66();
  return v1();
}

uint64_t sub_1B25A0538()
{
  uint64_t v0;

  swift_release();
  return OUTLINED_FUNCTION_21(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_1B25A0564(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v2 + 16) = a1;
  *(_QWORD *)(v2 + 24) = v1;
  return OUTLINED_FUNCTION_10_3();
}

uint64_t sub_1B25A0578()
{
  _QWORD *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  id v4;
  uint64_t (*v6)(void);

  v1 = (void *)v0[2];
  v2 = v0[3];
  *(_QWORD *)(v2 + 184) = 0;
  swift_release();
  v3 = *(void **)(v2 + 192);
  *(_QWORD *)(v2 + 192) = v1;

  v6 = (uint64_t (*)(void))v0[1];
  v4 = v1;
  return v6();
}

void (*sub_1B25A05D0())(__n128 *a1)
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void (*v5)(__n128 *);

  v1 = *(_QWORD *)(v0 + 208);
  v2 = *(_QWORD *)(v1 + 16);
  v3 = *(_QWORD *)(v1 + 24);
  if (v2)
  {
    v4 = swift_allocObject();
    *(_QWORD *)(v4 + 16) = v2;
    *(_QWORD *)(v4 + 24) = v3;
    v5 = sub_1B25003F0;
  }
  else
  {
    v5 = 0;
  }
  sub_1B24AB754(v2);
  return v5;
}

void sub_1B25A0640(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;

  v5 = *(_QWORD *)(v2 + 208);
  v6 = OUTLINED_FUNCTION_8_4();
  *(_QWORD *)(v6 + 16) = a1;
  *(_QWORD *)(v6 + 24) = a2;
  OUTLINED_FUNCTION_99_1();
  sub_1B259EF44((uint64_t)sub_1B250110C, v6);
  *(_BYTE *)(v5 + 32) = 1;
  OUTLINED_FUNCTION_262();
}

uint64_t sub_1B25A0698(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  uint64_t v4;
  uint64_t v5;

  *(_QWORD *)(v5 + 16) = v4;
  *(_BYTE *)(v5 + 48) = a4;
  return OUTLINED_FUNCTION_10_3();
}

uint64_t sub_1B25A06B0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t (*v3)(void);

  if (*(_BYTE *)(v0 + 48) == 1 && (v1 = *(_QWORD *)(*(_QWORD *)(v0 + 16) + 184), (*(_QWORD *)(v0 + 24) = v1) != 0))
  {
    swift_retain();
    OUTLINED_FUNCTION_17();
    return OUTLINED_FUNCTION_8();
  }
  else
  {
    v3 = (uint64_t (*)(void))OUTLINED_FUNCTION_66();
    return OUTLINED_FUNCTION_21(v3);
  }
}

uint64_t sub_1B25A0704()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 32) = v1;
  OUTLINED_FUNCTION_18_0(v1, (uint64_t)sub_1B25A0744);
  return OUTLINED_FUNCTION_26_16();
}

uint64_t sub_1B25A0744()
{
  OUTLINED_FUNCTION_6_4();
  return OUTLINED_FUNCTION_2_0();
}

uint64_t sub_1B25A078C(char a1)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v2 + 16) = v1;
  *(_BYTE *)(v2 + 48) = a1;
  return OUTLINED_FUNCTION_10_3();
}

uint64_t sub_1B25A07A4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t (*v3)(void);

  if (*(_BYTE *)(v0 + 48) == 1 && (v1 = *(_QWORD *)(*(_QWORD *)(v0 + 16) + 184), (*(_QWORD *)(v0 + 24) = v1) != 0))
  {
    swift_retain();
    OUTLINED_FUNCTION_17();
    return OUTLINED_FUNCTION_8();
  }
  else
  {
    v3 = (uint64_t (*)(void))OUTLINED_FUNCTION_66();
    return OUTLINED_FUNCTION_21(v3);
  }
}

uint64_t sub_1B25A07F8()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 32) = v1;
  OUTLINED_FUNCTION_18_0(v1, (uint64_t)sub_1B25A0838);
  return OUTLINED_FUNCTION_26_16();
}

uint64_t sub_1B25A0838()
{
  OUTLINED_FUNCTION_6_4();
  return OUTLINED_FUNCTION_2_0();
}

uint64_t sub_1B25A0880()
{
  uint64_t (*v0)(void);

  swift_release();
  v0 = (uint64_t (*)(void))OUTLINED_FUNCTION_66();
  return OUTLINED_FUNCTION_21(v0);
}

void sub_1B25A08A8(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v4 = a1 + 16;
  OUTLINED_FUNCTION_15_3();
  v5 = MEMORY[0x1B5E26380](v4);
  v6 = *(_QWORD *)(a1 + 24);
  *a2 = v5;
  a2[1] = v6;
  OUTLINED_FUNCTION_279_1();
}

uint64_t sub_1B25A08F4(void *a1)
{
  uint64_t v2;
  uint64_t v3;
  id v4;

  __swift_instantiateConcreteTypeFromMangledName(&qword_1EEFDB638);
  v2 = OUTLINED_FUNCTION_142_0();
  *(_OWORD *)(v2 + 16) = xmmword_1B25DB5B0;
  v3 = OUTLINED_FUNCTION_8_4();
  *(_QWORD *)(v3 + 16) = a1;
  *(_QWORD *)(v2 + 32) = sub_1B25A1CB8;
  *(_QWORD *)(v2 + 40) = v3;
  v4 = a1;
  sub_1B24F84D0();
  swift_setDeallocating();
  return sub_1B250036C();
}

void sub_1B25A0984(uint64_t *a1, void *a2)
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
  unint64_t v13;
  void (*v14)(__n128 *);
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  id v18;
  uint64_t v19;
  void (*v20)(uint64_t *__return_ptr, uint64_t);
  uint64_t v21;
  uint64_t v22;
  _QWORD v23[4];
  unsigned int v24;
  int v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  __int128 v29;
  uint64_t v30;
  uint64_t v31;

  v3 = *a1;
  *(_QWORD *)(*a1 + 200) = 0;
  swift_release();
  if ((*(_BYTE *)(v3 + 176) & 1) == 0)
  {
    v5 = *(_QWORD *)(v3 + 160);
    v4 = *(_QWORD *)(v3 + 168);
    v6 = *(_QWORD *)(v3 + 136);
    v27 = *(_QWORD *)(v3 + 128);
    v28 = v6;
    v29 = *(_OWORD *)(v3 + 144);
    v30 = v5;
    v31 = v4;
    v7 = sub_1B25CCF7C();
    v8 = *MEMORY[0x1E0CA2E68];
    v9 = *(_QWORD *)(MEMORY[0x1E0CA2E68] + 16);
    v23[0] = v7;
    v23[1] = v10;
    v23[2] = v11;
    v23[3] = v8;
    v12 = *(unsigned int *)(MEMORY[0x1E0CA2E68] + 12);
    v24 = *(_DWORD *)(MEMORY[0x1E0CA2E68] + 8);
    v25 = v12;
    v26 = v9;
    v13 = v24 | (unint64_t)(v12 << 32);
    *(_QWORD *)(v3 + 128) = v7;
    *(_QWORD *)(v3 + 136) = v10;
    *(_QWORD *)(v3 + 144) = v11;
    *(_QWORD *)(v3 + 152) = v8;
    *(_QWORD *)(v3 + 160) = v13;
    *(_QWORD *)(v3 + 168) = v9;
    *(_BYTE *)(v3 + 176) = 0;
    v14 = sub_1B25A05D0();
    if (v14)
    {
      v15 = (uint64_t)v14;
      v14((__n128 *)v23);
      sub_1B24C4564(v15);
    }
  }
  if (a2)
  {
    swift_beginAccess();
    v16 = *(_QWORD *)(v3 + 216);
    v17 = *(_QWORD *)(v16 + 16);
    if (v17)
    {
      v18 = a2;
      swift_bridgeObjectRetain();
      v19 = v16 + 40;
      do
      {
        v20 = *(void (**)(uint64_t *__return_ptr, uint64_t))(v19 - 8);
        v21 = swift_retain();
        v20(&v22, v21);
        if (v22)
        {
          sub_1B2504154(a2);
          swift_release();
          swift_unknownObjectRelease();
        }
        else
        {
          swift_release();
        }
        v19 += 16;
        --v17;
      }
      while (v17);
      swift_bridgeObjectRelease();

    }
  }
}

uint64_t sub_1B25A0B08(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  _QWORD *v3;

  v1[2] = a1;
  v2 = sub_1B25CC6F4();
  v1[3] = v2;
  v1[4] = *(_QWORD *)(v2 - 8);
  v1[5] = swift_task_alloc();
  v3 = (_QWORD *)swift_task_alloc();
  v1[6] = v3;
  OUTLINED_FUNCTION_18_0(v3, (uint64_t)sub_1B25A0B78);
  return sub_1B2578888();
}

uint64_t sub_1B25A0B78()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t *v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_176();
  v3 = *v2;
  *(_QWORD *)(v0 + 56) = v4;
  OUTLINED_FUNCTION_237();
  if (v1)
  {
    swift_task_dealloc();
    return OUTLINED_FUNCTION_15_0(*(uint64_t (**)(void))(v3 + 8));
  }
  else
  {
    OUTLINED_FUNCTION_17();
    return OUTLINED_FUNCTION_2_0();
  }
}

uint64_t sub_1B25A0BD8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t (*v10)(void);
  uint64_t v12;

  v1 = *(_QWORD *)(v0 + 56);
  v2 = *(_QWORD *)(v1 + 16);
  if (v2)
  {
    v3 = *(_QWORD *)(v0 + 32);
    v12 = MEMORY[0x1E0DEE9D8];
    sub_1B25053AC(0, v2, 0);
    v4 = v12;
    v5 = v1 + 40;
    do
    {
      swift_bridgeObjectRetain();
      sub_1B25CC628();
      v7 = *(_QWORD *)(v12 + 16);
      v6 = *(_QWORD *)(v12 + 24);
      if (v7 >= v6 >> 1)
        sub_1B25053AC(v6 > 1, v7 + 1, 1);
      v8 = *(_QWORD *)(v0 + 40);
      v9 = *(_QWORD *)(v0 + 24);
      *(_QWORD *)(v12 + 16) = v7 + 1;
      (*(void (**)(unint64_t, uint64_t, uint64_t))(v3 + 32))(v12+ ((*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80))+ *(_QWORD *)(v3 + 72) * v7, v8, v9);
      v5 += 16;
      --v2;
    }
    while (v2);
    swift_bridgeObjectRelease();
  }
  else
  {
    swift_bridgeObjectRelease();
    v4 = MEMORY[0x1E0DEE9D8];
  }
  **(_QWORD **)(v0 + 16) = v4;
  swift_task_dealloc();
  v10 = (uint64_t (*)(void))OUTLINED_FUNCTION_66();
  return v10();
}

uint64_t sub_1B25A0D0C(uint64_t a1)
{
  if (a1 == 1)
    return sub_1B25CC658();
  else
    return sub_1B25CC64C();
}

uint64_t sub_1B25A0D24(void *a1, double a2)
{
  uint64_t v4;
  uint64_t v5;
  id v6;

  __swift_instantiateConcreteTypeFromMangledName(&qword_1EEFDB638);
  v4 = OUTLINED_FUNCTION_142_0();
  *(_OWORD *)(v4 + 16) = xmmword_1B25DB5B0;
  v5 = OUTLINED_FUNCTION_8_4();
  *(double *)(v5 + 16) = a2;
  *(_QWORD *)(v5 + 24) = a1;
  *(_QWORD *)(v4 + 32) = sub_1B25A1C44;
  *(_QWORD *)(v4 + 40) = v5;
  v6 = a1;
  sub_1B24F84D0();
  swift_setDeallocating();
  return sub_1B250036C();
}

_QWORD *sub_1B25A0DC0(uint64_t *a1, void *a2, Float64 a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *result;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  double v18;
  __int128 v19;
  void (*v20)(__n128 *);
  uint64_t v21;
  id v22;
  id v23;
  uint64_t v24;
  _QWORD *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t i;
  _QWORD *(*v29)(uint64_t *__return_ptr, uint64_t);
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  id v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  id v40;
  uint64_t v41;
  uint64_t v42;
  char *v43;
  uint64_t v44;
  uint64_t v45;
  id v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  _OWORD v50[3];
  __int128 v51[2];
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  __int128 v56;
  uint64_t v57;
  uint64_t v58;

  v46 = a2;
  v45 = sub_1B25CC6F4();
  v44 = *(_QWORD *)(v45 - 8);
  MEMORY[0x1E0C80A78](v45, v5);
  v43 = (char *)&v38 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_1B25CC664();
  v8 = *(_QWORD *)(v7 - 8);
  result = (_QWORD *)MEMORY[0x1E0C80A78](v7, v9);
  v47 = (uint64_t)&v38 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = *a1;
  v13 = *(void **)(*a1 + 192);
  if (!v13 || (*(_BYTE *)(v12 + 176) & 1) != 0)
    return result;
  v15 = *(_QWORD *)(v12 + 160);
  v14 = *(_QWORD *)(v12 + 168);
  v16 = *(_QWORD *)(v12 + 136);
  v54 = *(_QWORD *)(v12 + 128);
  v55 = v16;
  v56 = *(_OWORD *)(v12 + 144);
  v57 = v15;
  v58 = v14;
  v17 = v13;
  result = objc_msgSend(v17, sel_sampleRate);
  if ((~*(_QWORD *)&v18 & 0x7FF0000000000000) == 0)
  {
    __break(1u);
    goto LABEL_22;
  }
  if (v18 <= -2147483650.0)
  {
LABEL_22:
    __break(1u);
LABEL_23:
    __break(1u);
LABEL_24:
    __break(1u);
    return result;
  }
  if (v18 >= 2147483650.0)
    goto LABEL_23;
  v40 = v17;
  v41 = v8;
  v42 = v7;
  CMTimeMakeWithSeconds((CMTime *)v51, a3, (int)v18);
  sub_1B25CCF7C();
  sub_1B25CD06C();
  sub_1B25CCF88();
  v19 = v50[1];
  *(_OWORD *)(v12 + 128) = v50[0];
  *(_OWORD *)(v12 + 144) = v19;
  *(_OWORD *)(v12 + 160) = v50[2];
  *(_BYTE *)(v12 + 176) = 0;
  v20 = sub_1B25A05D0();
  if (v20)
  {
    v21 = (uint64_t)v20;
    v20((__n128 *)v50);
    sub_1B24C4564(v21);
  }
  v22 = v46;
  v23 = objc_msgSend(v46, sel_confidences);
  sub_1B2578188();
  v24 = sub_1B25CC8F8();

  v25 = sub_1B2530A60(v24);
  swift_bridgeObjectRelease();
  sub_1B25A0D0C((uint64_t)objc_msgSend(v22, sel_detectedLangauge));
  swift_beginAccess();
  v26 = *(_QWORD *)(*(_QWORD *)(v12 + 216) + 16);
  if (!v26)
  {
    swift_release();
    goto LABEL_19;
  }
  v27 = v26 - 1;
  v39 = swift_bridgeObjectRetain();
  for (i = v39 + 40; ; i += 16)
  {
    v29 = *(_QWORD *(**)(uint64_t *__return_ptr, uint64_t))(i - 8);
    v30 = swift_retain();
    result = v29(&v49, v30);
    if (v49)
      break;
    swift_release();
    if (!v27)
      goto LABEL_18;
LABEL_15:
    --v27;
  }
  v48 = v27;
  if ((*(_BYTE *)(v12 + 176) & 1) != 0)
    goto LABEL_24;
  v32 = *(_QWORD *)(v12 + 160);
  v31 = *(_QWORD *)(v12 + 168);
  v33 = *(_QWORD *)(v12 + 136);
  *(_QWORD *)&v51[0] = *(_QWORD *)(v12 + 128);
  *((_QWORD *)&v51[0] + 1) = v33;
  v34 = v12;
  v51[1] = *(_OWORD *)(v12 + 144);
  v52 = v32;
  v53 = v31;
  v35 = sub_1B259E09C((uint64_t)v25);
  v36 = objc_msgSend(v46, sel_dominantLocale);
  sub_1B25CCA18();

  v37 = (uint64_t)v43;
  sub_1B25CC628();
  sub_1B25041A0(v51, v35, v47, v37);
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
  (*(void (**)(uint64_t, uint64_t))(v44 + 8))(v37, v45);
  swift_release();
  v27 = v48;
  if (v48)
  {
    v12 = v34;
    goto LABEL_15;
  }
LABEL_18:
  swift_release();
  swift_bridgeObjectRelease();
LABEL_19:

  return (_QWORD *)(*(uint64_t (**)(uint64_t, uint64_t))(v41 + 8))(v47, v42);
}

uint64_t sub_1B25A1244(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v6;
  _QWORD *v7;
  id v8;

  __swift_instantiateConcreteTypeFromMangledName(&qword_1EEFDB638);
  v6 = OUTLINED_FUNCTION_142_0();
  *(_OWORD *)(v6 + 16) = xmmword_1B25DB5B0;
  v7 = (_QWORD *)OUTLINED_FUNCTION_8_4();
  v7[2] = a1;
  v7[3] = a2;
  v7[4] = a3;
  *(_QWORD *)(v6 + 32) = sub_1B25A1C14;
  *(_QWORD *)(v6 + 40) = v7;
  swift_unknownObjectRetain();
  v8 = a3;
  sub_1B24F84D0();
  swift_setDeallocating();
  return sub_1B250036C();
}

uint64_t sub_1B25A12F0(uint64_t result, uint64_t a2, uint64_t a3, void *a4)
{
  uint64_t v5;
  uint64_t v6;
  BOOL v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(uint64_t *__return_ptr, uint64_t);
  uint64_t v12;
  uint64_t v13;

  v5 = *(_QWORD *)result;
  v6 = *(_QWORD *)(*(_QWORD *)result + 200);
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)result + 120) + 16) == a2 || (v6 ? (v7 = v6 == a2) : (v7 = 0), v7))
  {
    result = swift_beginAccess();
    v8 = *(_QWORD *)(v5 + 216);
    v9 = *(_QWORD *)(v8 + 16);
    if (v9)
    {
      swift_retain();
      swift_bridgeObjectRetain();
      swift_retain();
      v10 = v8 + 40;
      do
      {
        v11 = *(void (**)(uint64_t *__return_ptr, uint64_t))(v10 - 8);
        v12 = swift_retain();
        v11(&v13, v12);
        if (v13)
        {
          sub_1B2504154(a4);
          swift_release();
          swift_unknownObjectRelease();
        }
        else
        {
          swift_release();
        }
        v10 += 16;
        --v9;
      }
      while (v9);
      swift_bridgeObjectRelease();
      swift_release();
      return swift_release();
    }
  }
  return result;
}

uint64_t sub_1B25A13FC()
{
  uint64_t v0;

  swift_bridgeObjectRelease();
  swift_release();
  swift_release();

  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  swift_defaultActor_destroy();
  return v0;
}

uint64_t sub_1B25A1458()
{
  sub_1B25A13FC();
  return swift_defaultActor_deallocate();
}

uint64_t sub_1B25A1470()
{
  sub_1B25CD6A8();
  sub_1B25CD6B4();
  return sub_1B25CD6CC();
}

uint64_t sub_1B25A14B4()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 16) = v1;
  *v1 = v0;
  v1[1] = sub_1B24EBFF4;
  return OUTLINED_FUNCTION_190_0();
}

uint64_t sub_1B25A14F8(uint64_t a1, const void *a2, _OWORD *a3)
{
  uint64_t v3;
  _QWORD *v6;

  *(_QWORD *)(v3 + 16) = a1;
  v6 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v3 + 24) = v6;
  *v6 = v3;
  v6[1] = sub_1B25A1564;
  return sub_1B259F9A8(v3 + 32, a2, a3);
}

uint64_t sub_1B25A1564()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;
  _OWORD *v4;
  __int128 v5;
  __int128 v6;

  OUTLINED_FUNCTION_176();
  OUTLINED_FUNCTION_177(v3);
  swift_task_dealloc();
  if (!v1)
  {
    v4 = *(_OWORD **)(v0 + 16);
    v5 = *(_OWORD *)(v0 + 32);
    v6 = *(_OWORD *)(v0 + 64);
    v4[1] = *(_OWORD *)(v0 + 48);
    v4[2] = v6;
    *v4 = v5;
  }
  return OUTLINED_FUNCTION_15_0(*(uint64_t (**)(void))(v2 + 8));
}

uint64_t sub_1B25A15B0(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;

  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v3;
  *v3 = v1;
  v3[1] = sub_1B24EBFF4;
  return sub_1B25A0564(a1);
}

uint64_t sub_1B25A15FC(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v2 + 16) = a1;
  *(_QWORD *)(v2 + 24) = v1;
  return swift_task_switch();
}

uint64_t sub_1B25A1614()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char v3;
  __int128 v4;
  __int128 v5;

  v2 = *(_QWORD *)(v0 + 16);
  v1 = *(_QWORD *)(v0 + 24);
  v3 = *(_BYTE *)(v1 + 176);
  v4 = *(_OWORD *)(v1 + 144);
  v5 = *(_OWORD *)(v1 + 160);
  *(_OWORD *)v2 = *(_OWORD *)(v1 + 128);
  *(_OWORD *)(v2 + 16) = v4;
  *(_OWORD *)(v2 + 32) = v5;
  *(_BYTE *)(v2 + 48) = v3;
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_1B25A163C(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  uint64_t v4;
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;

  v6 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v4 + 16) = v6;
  *v6 = v4;
  v6[1] = sub_1B24EBFF4;
  return sub_1B25A0698((uint64_t)v6, v7, v8, a4);
}

uint64_t sub_1B25A1688(char a1)
{
  uint64_t v1;
  _QWORD *v3;

  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v3;
  *v3 = v1;
  v3[1] = sub_1B24DE4C4;
  return sub_1B25A078C(a1);
}

uint64_t sub_1B25A16D8()
{
  return sub_1B25A1470();
}

uint64_t EARLocaleAlternative.locale.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;

  v3 = sub_1B25CC6F4();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 16))(a1, v1, v3);
}

double EARLocaleAlternative.confidence.getter()
{
  uint64_t v0;

  return *(double *)(v0 + *(int *)(type metadata accessor for EARLocaleAlternative() + 20));
}

uint64_t type metadata accessor for EARLocaleAlternative()
{
  uint64_t result;

  result = qword_1EEFDB5B0;
  if (!qword_1EEFDB5B0)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t type metadata accessor for LanguageDetectorWorker()
{
  return objc_opt_self();
}

uint64_t getEnumTagSinglePayload for EARLocaleAlternative()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_1B25A17B4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v2 = OUTLINED_FUNCTION_17_5();
  return __swift_getEnumTagSinglePayload(v1, v0, v2);
}

uint64_t storeEnumTagSinglePayload for EARLocaleAlternative()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_1B25A17E8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v2 = OUTLINED_FUNCTION_17_5();
  return __swift_storeEnumTagSinglePayload(v1, v0, v0, v2);
}

void sub_1B25A1814(uint64_t a1, uint64_t a2)
{
  sub_1B24ADAD8(qword_1EEFDB5C0, a2, (uint64_t (*)(uint64_t))type metadata accessor for LanguageDetectorWorker, (uint64_t)&unk_1B25E2540);
}

void sub_1B25A1840(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  sub_1B24ADAD8(&qword_1EEFDB5F8, a2, (uint64_t (*)(uint64_t))type metadata accessor for LanguageDetectorWorker, (uint64_t)&unk_1B25E2568);
  *(_QWORD *)(a1 + 8) = v3;
}

uint64_t sub_1B25A187C()
{
  swift_release();
  return swift_deallocObject();
}

id sub_1B25A18A0(uint64_t a1, uint64_t a2)
{
  void *v2;
  void *v4;
  id v5;

  if (a1)
  {
    sub_1B25CC6F4();
    v4 = (void *)sub_1B25CCB98();
    swift_bridgeObjectRelease();
  }
  else
  {
    v4 = 0;
  }
  v5 = objc_msgSend(v2, sel_initWithLanguageConstraints_alternativesCount_, v4, a2);

  return v5;
}

void sub_1B25A1918()
{
  void *v0;
  uint64_t v1;
  char v2;
  char v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;

  OUTLINED_FUNCTION_59_0();
  v3 = v2;
  v5 = v4;
  v6 = v1;
  v8 = v7;
  if (v9)
  {
    v10 = (void *)sub_1B25CCA0C();
    swift_bridgeObjectRelease();
    if (v6)
      goto LABEL_3;
LABEL_6:
    v11 = 0;
    if (v5)
      goto LABEL_4;
LABEL_7:
    v12 = 0;
    goto LABEL_8;
  }
  v10 = 0;
  if (!v1)
    goto LABEL_6;
LABEL_3:
  v11 = (void *)sub_1B25CCA0C();
  swift_bridgeObjectRelease();
  if (!v5)
    goto LABEL_7;
LABEL_4:
  v12 = (void *)sub_1B25CCA0C();
  swift_bridgeObjectRelease();
LABEL_8:
  objc_msgSend(v0, sel_initWithPriority_aneContext_cpuContext_gpuContext_keepANEModelLoaded_, v8, v10, v11, v12, v3 & 1);

  OUTLINED_FUNCTION_7_1();
}

uint64_t sub_1B25A19F4(uint64_t *a1, uint64_t a2, uint64_t a3, void (*a4)(uint64_t *__return_ptr))
{
  uint64_t v5;
  uint64_t result;
  uint64_t v7;

  a4(&v7);
  v5 = *a1 + 8;
  result = sub_1B25CD12C();
  *a1 = v5;
  return result;
}

uint64_t sub_1B25A1A4C@<X0>(uint64_t (*a1)(void)@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result;

  result = a1();
  *a2 = result;
  return result;
}

uint64_t sub_1B25A1A74()
{
  swift_weakDestroy();
  return swift_deallocObject();
}

void sub_1B25A1A98(uint64_t a1, os_unfair_lock_s *a2)
{
  uint64_t *v3;
  os_unfair_lock_s *v4;

  v3 = (uint64_t *)&a2[4];
  v4 = a2 + 6;
  os_unfair_lock_lock(a2 + 6);
  sub_1B25098A0(v3, a1, (uint64_t)&off_1E647B440);
  os_unfair_lock_unlock(v4);
}

void sub_1B25A1AF0(uint64_t a1, os_unfair_lock_s *a2)
{
  uint64_t *v3;
  os_unfair_lock_s *v4;

  v3 = (uint64_t *)&a2[4];
  v4 = a2 + 6;
  os_unfair_lock_lock(a2 + 6);
  sub_1B25098A0(v3, a1, (uint64_t)&off_1E647C788);
  os_unfair_lock_unlock(v4);
}

uint64_t sub_1B25A1B48@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result;
  uint64_t v4;

  result = sub_1B259ECF4(a1, &qword_1EEFDA1D0, (uint64_t (*)(uint64_t))type metadata accessor for EARSpeechRecognitionResultStream, (uint64_t)&unk_1B25DE614);
  *a2 = result;
  a2[1] = v4;
  return result;
}

uint64_t sub_1B25A1B88@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result;
  uint64_t v4;

  result = sub_1B259ECF4(a1, &qword_1EEFDB050, (uint64_t (*)(uint64_t))type metadata accessor for EARLanguageDetectorResultStream, (uint64_t)&unk_1B25E1604);
  *a2 = result;
  a2[1] = v4;
  return result;
}

uint64_t sub_1B25A1BC4@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v1;

  return sub_1B25A1B88(v1, a1);
}

void sub_1B25A1BCC()
{
  sub_1B2557404();
}

uint64_t sub_1B25A1BE0@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v1;

  return sub_1B25A1B48(v1, a1);
}

uint64_t sub_1B25A1BE8()
{
  uint64_t v0;

  swift_unknownObjectRelease();

  return swift_deallocObject();
}

uint64_t sub_1B25A1C14(uint64_t a1)
{
  uint64_t v1;

  return sub_1B25A12F0(a1, *(_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 24), *(void **)(v1 + 32));
}

uint64_t sub_1B25A1C20()
{
  uint64_t v0;

  return swift_deallocObject();
}

_QWORD *sub_1B25A1C44(uint64_t *a1)
{
  uint64_t v1;

  return sub_1B25A0DC0(a1, *(void **)(v1 + 24), *(Float64 *)(v1 + 16));
}

uint64_t sub_1B25A1C50(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for EARLocaleAlternative();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_1B25A1C94()
{
  uint64_t v0;

  return swift_deallocObject();
}

void sub_1B25A1CB8(uint64_t *a1)
{
  uint64_t v1;

  sub_1B25A0984(a1, *(void **)(v1 + 16));
}

uint64_t sub_1B25A1CC0(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata accessor for AnalysisOptions(0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_1B25A1CFC()
{
  return objectdestroy_3Tm(&qword_1EEFDB668);
}

uint64_t sub_1B25A1D08()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  __swift_instantiateConcreteTypeFromMangledName(&qword_1EEFDB668);
  OUTLINED_FUNCTION_4_10();
  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 16) = v1;
  v2 = OUTLINED_FUNCTION_16_8(v1);
  return sub_1B259F310(v2, v3, v4, v5, v6);
}

uint64_t sub_1B25A1D70()
{
  return objectdestroy_3Tm(&qword_1EEFD7200);
}

uint64_t sub_1B25A1D7C()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  __swift_instantiateConcreteTypeFromMangledName(&qword_1EEFD7200);
  OUTLINED_FUNCTION_4_10();
  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 16) = v1;
  v2 = OUTLINED_FUNCTION_16_8(v1);
  return sub_1B259F0DC(v2, v3, v4, v5, v6);
}

uint64_t OUTLINED_FUNCTION_11_14(uint64_t a1, uint64_t a2)
{
  return sub_1B251A218(a1, a2);
}

uint64_t OUTLINED_FUNCTION_18_15(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  *(_QWORD *)(v2 + 344) = a1;
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v1 + 16))(v4, a1, v3);
}

uint64_t OUTLINED_FUNCTION_21_16()
{
  return sub_1B25CCD24();
}

uint64_t OUTLINED_FUNCTION_24_18(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t (*v3)(uint64_t, uint64_t, uint64_t);

  return v3(a1, v2, v1);
}

uint64_t OUTLINED_FUNCTION_26_16()
{
  return sub_1B251A5F4();
}

uint64_t OUTLINED_FUNCTION_31_11()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(v0 + 8))(v2, v1);
}

void OUTLINED_FUNCTION_32_18(char a1, uint64_t a2)
{
  uint64_t v2;

  sub_1B24B384C(a1, a2, 97, 2, 71, v2);
}

void OUTLINED_FUNCTION_33_13(char a1, uint64_t a2)
{
  uint64_t v2;

  sub_1B24B3834(a1, a2, 97, 2, 70, v2);
}

uint64_t OUTLINED_FUNCTION_39_11@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v3;

  *a1 = v3;
  a1[1] = a2;
  return v2;
}

void OUTLINED_FUNCTION_42_15()
{
  uint64_t v0;

}

uint64_t OUTLINED_FUNCTION_53_12(uint64_t a1)
{
  uint64_t (*v1)(uint64_t, uint64_t, uint64_t);
  uint64_t v2;
  uint64_t v3;

  return v1(a1, v3, v2);
}

uint64_t OUTLINED_FUNCTION_54_12(unsigned int a1)
{
  uint64_t v1;

  return sub_1B259E940(v1, a1);
}

uint64_t OUTLINED_FUNCTION_58_13()
{
  uint64_t (*v0)(uint64_t, uint64_t);
  uint64_t v1;
  uint64_t v2;

  return v0(v2, v1);
}

uint64_t OUTLINED_FUNCTION_61_13()
{
  uint64_t v0;

  return sub_1B24C4564(v0);
}

uint64_t OUTLINED_FUNCTION_62_13()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t (*v2)(uint64_t, uint64_t);

  return v2(v0, v1);
}

uint64_t compatibilityInitializeAvailabilityCheck()
{
  return _initializeAvailabilityCheck(1);
}

uint64_t __isPlatformVersionAtLeast(uint64_t a1, int a2, int a3, int a4)
{
  BOOL v8;

  if (qword_1EEFDD3F8 == -1)
  {
    if (qword_1EEFDD400)
      return _availability_version_check();
  }
  else
  {
    dispatch_once_f(&qword_1EEFDD3F8, 0, (dispatch_function_t)initializeAvailabilityCheck);
    if (qword_1EEFDD400)
      return _availability_version_check();
  }
  if (qword_1EEFDD3F0 == -1)
  {
    v8 = _MergedGlobals < a2;
    if (_MergedGlobals > a2)
      return 1;
  }
  else
  {
    dispatch_once_f(&qword_1EEFDD3F0, 0, (dispatch_function_t)compatibilityInitializeAvailabilityCheck);
    v8 = _MergedGlobals < a2;
    if (_MergedGlobals > a2)
      return 1;
  }
  if (v8)
    return 0;
  if (dword_1EEFDD3E4 > a3)
    return 1;
  return dword_1EEFDD3E4 >= a3 && dword_1EEFDD3E8 >= a4;
}

uint64_t initializeAvailabilityCheck()
{
  return _initializeAvailabilityCheck(0);
}

uint64_t _initializeAvailabilityCheck(uint64_t result)
{
  uint64_t (*v1)(void);
  BOOL v2;
  unsigned __int8 *v4;
  uint64_t (*v5)(_QWORD);
  unint64_t v6;
  uint64_t (*v7)(_QWORD, uint64_t, _QWORD, _QWORD);
  uint64_t (*v8)(_QWORD, const char *, uint64_t, unsigned __int8 *);
  uint64_t (*v9)(uint64_t, uint64_t);
  uint64_t (*v10)(uint64_t);
  uint64_t (*v11)(void);
  FILE *v12;
  FILE *v13;
  uint64_t v14;
  size_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  FILE *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  FILE *v27;
  unsigned int (*v28)(uint64_t, char *, uint64_t, uint64_t);
  char v29[32];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v1 = (uint64_t (*)(void))qword_1EEFDD400;
  if (qword_1EEFDD400)
    v2 = (_DWORD)result == 0;
  else
    v2 = 0;
  if (!v2)
  {
    if (MEMORY[0x1E0C80CC0])
    {
      qword_1EEFDD400 = (uint64_t)MEMORY[0x1E0C80CC0];
      v1 = MEMORY[0x1E0C80CC0];
    }
    if (!v1 || (_DWORD)result != 0)
    {
      result = (uint64_t)dlsym((void *)0xFFFFFFFFFFFFFFFELL, "kCFAllocatorNull");
      if (result)
      {
        v4 = *(unsigned __int8 **)result;
        result = (uint64_t)dlsym((void *)0xFFFFFFFFFFFFFFFELL, "CFDataCreateWithBytesNoCopy");
        if (result)
        {
          v5 = (uint64_t (*)(_QWORD))result;
          v6 = (unint64_t)dlsym((void *)0xFFFFFFFFFFFFFFFELL, "CFPropertyListCreateWithData");
          result = (uint64_t)dlsym((void *)0xFFFFFFFFFFFFFFFELL, "CFPropertyListCreateFromXMLData");
          if (v6 | result)
          {
            v7 = (uint64_t (*)(_QWORD, uint64_t, _QWORD, _QWORD))result;
            result = (uint64_t)dlsym((void *)0xFFFFFFFFFFFFFFFELL, "CFStringCreateWithCStringNoCopy");
            if (result)
            {
              v8 = (uint64_t (*)(_QWORD, const char *, uint64_t, unsigned __int8 *))result;
              result = (uint64_t)dlsym((void *)0xFFFFFFFFFFFFFFFELL, "CFDictionaryGetValue");
              if (result)
              {
                v9 = (uint64_t (*)(uint64_t, uint64_t))result;
                result = (uint64_t)dlsym((void *)0xFFFFFFFFFFFFFFFELL, "CFGetTypeID");
                if (result)
                {
                  v10 = (uint64_t (*)(uint64_t))result;
                  result = (uint64_t)dlsym((void *)0xFFFFFFFFFFFFFFFELL, "CFStringGetTypeID");
                  if (result)
                  {
                    v11 = (uint64_t (*)(void))result;
                    result = (uint64_t)dlsym((void *)0xFFFFFFFFFFFFFFFELL, "CFStringGetCString");
                    v28 = (unsigned int (*)(uint64_t, char *, uint64_t, uint64_t))result;
                    if (result)
                    {
                      result = (uint64_t)dlsym((void *)0xFFFFFFFFFFFFFFFELL, "CFRelease");
                      if (result)
                      {
                        v12 = (FILE *)result;
                        result = (uint64_t)fopen("/System/Library/CoreServices/SystemVersion.plist", "r");
                        if (result)
                        {
                          v13 = (FILE *)result;
                          v27 = v12;
                          fseek((FILE *)result, 0, 2);
                          v14 = MEMORY[0x1B5E25B10](v13);
                          if (v14 < 0)
                          {
                            v16 = 0;
                          }
                          else
                          {
                            v15 = v14;
                            rewind(v13);
                            v16 = malloc(v15);
                            if (v16)
                            {
                              v26 = v16;
                              if (fread(v16, 1uLL, v15, v13) == v15)
                              {
                                v17 = v5(0);
                                if (v17)
                                {
                                  v18 = v17;
                                  v19 = v13;
                                  if (v6)
                                    v20 = ((uint64_t (*)(_QWORD, uint64_t, _QWORD, _QWORD, _QWORD))v6)(0, v17, 0, 0, 0);
                                  else
                                    v20 = v7(0, v17, 0, 0);
                                  v21 = v20;
                                  if (v20)
                                  {
                                    v22 = v8(0, "ProductVersion", 1536, v4);
                                    if (v22)
                                    {
                                      v23 = v22;
                                      v24 = v9(v21, v22);
                                      ((void (*)(uint64_t))v27)(v23);
                                      if (v24)
                                      {
                                        v25 = v10(v24);
                                        if (v25 == v11())
                                        {
                                          if (v28(v24, v29, 32, 134217984))
                                            sscanf(v29, "%d.%d.%d", &_MergedGlobals, &dword_1EEFDD3E4, &dword_1EEFDD3E8);
                                        }
                                      }
                                    }
                                    ((void (*)(uint64_t))v27)(v21);
                                    v19 = v13;
                                  }
                                  ((void (*)(uint64_t))v27)(v18);
                                }
                                else
                                {
                                  v19 = v13;
                                }
                                v16 = v26;
                              }
                              else
                              {
                                v16 = v26;
                                v19 = v13;
                              }
                              goto LABEL_41;
                            }
                          }
                          v19 = v13;
LABEL_41:
                          free(v16);
                          return fclose(v19);
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
  return result;
}

id AFPhrasesAndUtterancesForEARSausage(void *a1, uint64_t a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  unint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;
  char v11;
  uint64_t v12;
  void *i;
  void *v14;
  id v15;
  id v16;
  id v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t j;
  void *v30;
  void *v31;
  uint64_t v32;
  unint64_t v33;
  unint64_t v34;
  void *v35;
  void *v36;
  uint64_t v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  unint64_t v43;
  id obj;
  uint64_t v46;
  void *v47;
  id v48;
  id v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  _QWORD v54[4];
  id v55;
  void *v56;
  id v57;
  uint64_t v58;
  char v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  _BYTE v64[128];
  _BYTE v65[128];
  uint64_t v66;

  v66 = *MEMORY[0x1E0C80C00];
  v3 = a1;
  objc_msgSend(MEMORY[0x1E0C99E40], "orderedSetWithArray:", a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  if (objc_msgSend(v5, "count"))
  {
    v7 = 0;
    v8 = MEMORY[0x1E0C9AA60];
    do
    {
      v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CFEA70]), "initWithInterpretationIndices:confidenceScore:", v8, 0);
      objc_msgSend(v9, "setSource:", 2);
      objc_msgSend(v6, "addObject:", v9);

      ++v7;
    }
    while (v7 < objc_msgSend(v5, "count"));
  }
  v47 = v5;
  v10 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v60 = 0u;
  v61 = 0u;
  v62 = 0u;
  v63 = 0u;
  obj = v3;
  v48 = (id)objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v60, v65, 16);
  if (v48)
  {
    v11 = 0;
    v12 = 0;
    v46 = *(_QWORD *)v61;
    do
    {
      for (i = 0; i != v48; i = (char *)i + 1)
      {
        if (*(_QWORD *)v61 != v46)
          objc_enumerationMutation(obj);
        v14 = *(void **)(*((_QWORD *)&v60 + 1) + 8 * (_QWORD)i);
        v15 = objc_alloc_init(MEMORY[0x1E0CFEA50]);
        v16 = objc_alloc_init(MEMORY[0x1E0C99E10]);
        v54[0] = MEMORY[0x1E0C809B0];
        v54[1] = 3221225472;
        v54[2] = __AFPhrasesAndUtterancesForEARSausage_block_invoke;
        v54[3] = &unk_1E64852F8;
        v17 = v6;
        v58 = v12;
        v55 = v17;
        v56 = v14;
        v59 = v11 & 1;
        v18 = v16;
        v57 = v18;
        objc_msgSend(v47, "enumerateObjectsUsingBlock:", v54);
        v19 = objc_msgSend(v18, "count");
        if (v19)
        {
          v20 = v19;
          objc_msgSend(v14, "firstObject");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "lastObject");
          v22 = v6;
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = objc_msgSend(v23, "hasSpaceAfter") ^ 1;

          objc_msgSend(v18, "array");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          v25 = (void *)objc_msgSend(v24, "copy");
          objc_msgSend(v15, "setInterpretations:", v25);

          v6 = v22;
          objc_msgSend(v15, "setIsLowConfidence:", v20 != 1);
          objc_msgSend(v10, "addObject:", v15);
          ++v12;
        }

      }
      v48 = (id)objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v60, v65, 16);
    }
    while (v48);
  }

  v52 = 0u;
  v53 = 0u;
  v50 = 0u;
  v51 = 0u;
  v49 = v6;
  v26 = objc_msgSend(v49, "countByEnumeratingWithState:objects:count:", &v50, v64, 16);
  if (v26)
  {
    v27 = v26;
    v28 = *(_QWORD *)v51;
    do
    {
      for (j = 0; j != v27; ++j)
      {
        if (*(_QWORD *)v51 != v28)
          objc_enumerationMutation(v49);
        v30 = *(void **)(*((_QWORD *)&v50 + 1) + 8 * j);
        objc_msgSend(v30, "interpretationIndices");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v32 = objc_msgSend(v31, "count");

        if (v32)
        {
          v33 = 0;
          v34 = 0;
          do
          {
            objc_msgSend(v30, "interpretationIndices");
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v35, "objectAtIndex:", v33);
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            v37 = objc_msgSend(v36, "unsignedIntegerValue");

            objc_msgSend(v10, "objectAtIndex:", v33);
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v38, "interpretations");
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v39, "objectAtIndex:", v37);
            v40 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v40, "tokens");
            v41 = (void *)objc_claimAutoreleasedReturnValue();
            v34 += objc_msgSend(v41, "count");

            ++v33;
            objc_msgSend(v30, "interpretationIndices");
            v42 = (void *)objc_claimAutoreleasedReturnValue();
            v43 = objc_msgSend(v42, "count");

          }
          while (v33 < v43);
          if (v34)
            objc_msgSend(v30, "setConfidenceScore:", (uint64_t)((double)objc_msgSend(v30, "confidenceScore") / (double)v34));
        }
      }
      v27 = objc_msgSend(v49, "countByEnumeratingWithState:objects:count:", &v50, v64, 16);
    }
    while (v27);
  }

  return v10;
}

id AFTokensForEARTokens(void *a1, char a2)
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  double v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v3 = a1;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v3, "count"));
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v18;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v18 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * v9);
        v11 = objc_alloc_init(MEMORY[0x1E0CFEA68]);
        objc_msgSend(v10, "tokenName", (_QWORD)v17);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "setText:", v12);

        objc_msgSend(v10, "phoneSequence");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "setPhoneSequence:", v13);

        objc_msgSend(v10, "start");
        objc_msgSend(v11, "setStartTime:");
        objc_msgSend(v10, "silenceStart");
        objc_msgSend(v11, "setSilenceStartTime:");
        objc_msgSend(v10, "end");
        objc_msgSend(v11, "setEndTime:");
        objc_msgSend(v11, "setRemoveSpaceBefore:", a2 & 1);
        a2 = objc_msgSend(v10, "hasSpaceAfter") ^ 1;
        objc_msgSend(v10, "confidence");
        objc_msgSend(v11, "setConfidenceScore:", (uint64_t)v14);
        objc_msgSend(v10, "ipaPhoneSequence");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "setIpaPhoneSequence:", v15);

        objc_msgSend(v4, "addObject:", v11);
        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v7);
  }

  return v4;
}

BOOL LSRPreferenceProfanityAllowed()
{
  const __CFString *v0;
  _BOOL8 result;
  Boolean keyExistsAndHasValidFormat;

  v0 = (const __CFString *)*MEMORY[0x1E0CFEB50];
  if (!CFPreferencesAppValueIsForced(CFSTR("Profanity Allowed"), (CFStringRef)*MEMORY[0x1E0CFEB50]))
    return 1;
  keyExistsAndHasValidFormat = 1;
  result = CFPreferencesGetAppBooleanValue(CFSTR("Profanity Allowed"), v0, &keyExistsAndHasValidFormat) != 0;
  if (!keyExistsAndHasValidFormat)
    return 1;
  return result;
}

BOOL LSRShouldCensorSpeech()
{
  void *v0;
  _BOOL8 v1;

  objc_msgSend(MEMORY[0x1E0D47230], "sharedConnection");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "effectiveBoolValueForSetting:", *MEMORY[0x1E0D46F28]) == 1;

  return v1;
}

id LSRSpellingReplacementLanguage(void *a1)
{
  if (a1)
  {
    objc_msgSend(&unk_1E64986B8, "objectForKey:", a1);
    a1 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return a1;
}

uint64_t SFEntitledAssetTypeForTaskHint(unint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  v1 = 3;
  if (a1 >= 4)
    v2 = 0;
  else
    v2 = 3;
  if (((1 << (a1 + 23)) & 0x4FF) == 0)
    v1 = 7;
  if (a1 - 1001 <= 0xA)
    return v1;
  else
    return v2;
}

id SFReplacementLocaleCodeForLocaleIdentifier(void *a1)
{
  id v1;
  void *v2;

  v1 = a1;
  if (v1)
  {
    if (SFReplacementLocaleCodeForLocaleIdentifier_onceToken != -1)
      dispatch_once(&SFReplacementLocaleCodeForLocaleIdentifier_onceToken, &__block_literal_global);
    +[SFUtilities stringByReplacingUnderscoresWithHyphens:](SFUtilities, "stringByReplacingUnderscoresWithHyphens:", v1);
    v2 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend((id)SFReplacementLocaleCodeForLocaleIdentifier_sReplacementLocaleCodeForLocaleIdentifier, "objectForKey:", v2);
    v1 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v1;
}

const __CFString *SFEntitledAssetTypeToString(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 6)
    return CFSTR("Unknown");
  else
    return off_1E6485350[a1 - 1];
}

uint64_t SFEntitledAssetTypeFromString(void *a1)
{
  id v1;
  uint64_t v2;

  v1 = a1;
  if ((objc_msgSend(v1, "isEqualToString:", CFSTR("Hammer")) & 1) != 0)
  {
    v2 = 1;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("Assistant")) & 1) != 0)
  {
    v2 = 3;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("GeoLMRegionMapping")) & 1) != 0)
  {
    v2 = 4;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("GeoLMRegionSpecific")) & 1) != 0)
  {
    v2 = 5;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("LanguageDetector")) & 1) != 0)
  {
    v2 = 6;
  }
  else if (objc_msgSend(v1, "isEqualToString:", CFSTR("GeneralASR")))
  {
    v2 = 7;
  }
  else
  {
    v2 = 0;
  }

  return v2;
}

uint64_t SFEntitledAssetTypeForTaskName(void *a1)
{
  id v1;
  void *v2;
  char v3;
  uint64_t v4;
  void *v5;
  int v6;

  v1 = a1;
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("Dictation"), CFSTR("VoiceMail"), CFSTR("Captioning"), CFSTR("SearchOrMessaging"), CFSTR("WebSearch"), CFSTR("DictationCC"), CFSTR("SpellCC"), CFSTR("SiriDictation"), CFSTR("Spelling"), CFSTR("Tshot"), CFSTR("Unspecified"), CFSTR("Confirmation"), CFSTR("FoundInCalls"), 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "containsObject:", v1);

  if ((v3 & 1) != 0)
  {
    v4 = 3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("OfflineTranscription"), CFSTR("LiveTranscription"), 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "containsObject:", v1);

    if (v6)
      v4 = 7;
    else
      v4 = 0;
  }

  return v4;
}

uint64_t __Block_byref_object_copy_(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose_(uint64_t a1)
{

}

void sub_1B25A792C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id SFUserIdHash(uint64_t a1)
{
  void *v1;
  void *v2;

  if (a1)
  {
    objc_msgSend(CFSTR("UserEx"), "stringByAppendingString:", a1);
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    SFHash64String(v1);
    v2 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v2 = 0;
  }
  return v2;
}

id SFUserIdHashToString(void *a1)
{
  if (a1)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%llx"), objc_msgSend(a1, "unsignedLongLongValue"));
    a1 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return a1;
}

id SFUserIdHashFromString(void *a1)
{
  id v1;
  uint64_t v2;
  void *v3;

  v1 = a1;
  v2 = SFScanHexString((uint64_t)v1);
  if (v2 || objc_msgSend(v1, "isEqual:", CFSTR("0")))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v2);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

__CFString *SFUserDescription(void *a1, void *a2)
{
  unint64_t v3;
  unint64_t v4;
  void *v5;
  __CFString *v6;
  void *v7;
  void *v8;
  __CFString *v9;
  __CFString *v10;

  v3 = a1;
  v4 = a2;
  v5 = (void *)v4;
  if (v3 | v4)
  {
    if (v3)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("\"%@\""), v3);
      v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
      if (v5)
      {
LABEL_4:
        v7 = (void *)MEMORY[0x1E0CB3940];
        SFUserIdHashToString(v5);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "stringWithFormat:", CFSTR("<%@>"), v8);
        v9 = (__CFString *)objc_claimAutoreleasedReturnValue();

LABEL_8:
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@:%@%@"), CFSTR("UserEx"), v6, v9);
        v10 = (__CFString *)objc_claimAutoreleasedReturnValue();

        goto LABEL_9;
      }
    }
    else
    {
      v6 = &stru_1E6486C88;
      if (v4)
        goto LABEL_4;
    }
    v9 = &stru_1E6486C88;
    goto LABEL_8;
  }
  v10 = CFSTR("Default");
LABEL_9:

  return v10;
}

id SFUserIdHashFromDataSiteURL(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  NSObject *v4;
  int v6;
  const char *v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v1 = a1;
  objc_msgSend(v1, "lastPathComponent");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v2, "isEqual:", CFSTR("Default")) & 1) != 0)
  {
LABEL_5:
    v3 = 0;
    goto LABEL_6;
  }
  SFUserIdHashFromString(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    v4 = SFLogFramework;
    if (os_log_type_enabled((os_log_t)SFLogFramework, OS_LOG_TYPE_ERROR))
    {
      v6 = 136315394;
      v7 = "SFUserIdHashFromDataSiteURL";
      v8 = 2112;
      v9 = v1;
      _os_log_error_impl(&dword_1B2494000, v4, OS_LOG_TYPE_ERROR, "%s Unrecognized dataSiteURL: %@", (uint8_t *)&v6, 0x16u);
    }
    goto LABEL_5;
  }
LABEL_6:

  return v3;
}

uint64_t SFProtectionClassForDataSiteURL(void *a1)
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "lastPathComponent");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v1, "isEqual:", CFSTR("Default")))
    v2 = 3;
  else
    v2 = 6;

  return v2;
}

id SFDataSiteURL(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = a2;
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:relativeToURL:", CFSTR("UserEx"), 1, a1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    SFUserIdHashToString(v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:relativeToURL:", v5, 1, v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:relativeToURL:", CFSTR("Default"), 1, a1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v6;
}

id _detectDataSites(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  void *v4;
  int v5;
  int v6;
  BOOL v7;
  void *v8;
  void *v9;
  int v10;
  int v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  void *v21;
  int v22;
  int v23;
  BOOL v24;
  NSObject *v25;
  NSObject *v27;
  void *v28;
  void *v29;
  id v30;
  id v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  id v36;
  unsigned __int8 v37;
  uint8_t v38[128];
  uint8_t buf[4];
  const char *v40;
  __int16 v41;
  id v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v1 = a1;
  v31 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = 0;
  objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:relativeToURL:", CFSTR("Default"), 1, v1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "path");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v2, "fileExistsAtPath:isDirectory:", v4, &v37);
  v6 = v37;

  if (v5)
    v7 = v6 == 0;
  else
    v7 = 1;
  if (!v7)
    objc_msgSend(v31, "addObject:", v3);
  objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:relativeToURL:", CFSTR("UserEx"), 1, v1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "path");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v2, "fileExistsAtPath:isDirectory:", v9, &v37);
  v11 = v37;

  if (!v10 || !v11)
    goto LABEL_22;
  objc_msgSend(v8, "path");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = 0;
  objc_msgSend(v2, "contentsOfDirectoryAtPath:error:", v12, &v36);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v36;

  if (v13)
  {
    v28 = v14;
    v29 = v3;
    v30 = v1;
    v34 = 0u;
    v35 = 0u;
    v32 = 0u;
    v33 = 0u;
    v15 = v13;
    v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v32, v38, 16);
    if (v16)
    {
      v17 = v16;
      v18 = *(_QWORD *)v33;
      do
      {
        for (i = 0; i != v17; ++i)
        {
          if (*(_QWORD *)v33 != v18)
            objc_enumerationMutation(v15);
          objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:relativeToURL:", *(_QWORD *)(*((_QWORD *)&v32 + 1) + 8 * i), 1, v8, v28);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "path");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v22 = objc_msgSend(v2, "fileExistsAtPath:isDirectory:", v21, &v37);
          v23 = v37;

          if (v22)
            v24 = v23 == 0;
          else
            v24 = 1;
          if (!v24)
            objc_msgSend(v31, "addObject:", v20);

        }
        v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v32, v38, 16);
      }
      while (v17);
    }

    v3 = v29;
    v1 = v30;
LABEL_22:
    v25 = SFLogFramework;
    if (os_log_type_enabled((os_log_t)SFLogFramework, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315394;
      v40 = "_detectDataSites";
      v41 = 2112;
      v42 = v31;
      _os_log_debug_impl(&dword_1B2494000, v25, OS_LOG_TYPE_DEBUG, "%s Managed data sites: %@", buf, 0x16u);
    }
    goto LABEL_24;
  }
  v27 = SFLogFramework;
  if (os_log_type_enabled((os_log_t)SFLogFramework, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    v40 = "_detectDataSites";
    v41 = 2112;
    v42 = v14;
    _os_log_error_impl(&dword_1B2494000, v27, OS_LOG_TYPE_ERROR, "%s Failed to resolve UserEx data site directories: %@", buf, 0x16u);
  }

LABEL_24:
  return v31;
}

id SFSpeechProfileRootDirectoryURL()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;

  v0 = (void *)MEMORY[0x1E0C99E98];
  objc_msgSend((id)CPSharedResourcesDirectory(), "stringByAppendingPathComponent:", CFSTR("Library/Assistant/SiriVocabulary"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  +[SFSpeechProfileContainerManager sharedInstance](SFSpeechProfileContainerManager, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "containerForCurrentPersona");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "url");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v5 = v4;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", v1, 1);
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;

  objc_msgSend(v0, "fileURLWithPath:isDirectory:relativeToURL:", CFSTR("Modules"), 1, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v0, "fileURLWithPath:isDirectory:relativeToURL:", CFSTR("CESR"), 1, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

id SFSpeechProfileSiteDirectories()
{
  void *v0;
  void *v1;

  SFSpeechProfileRootDirectoryURL();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  _detectDataSites(v0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  return v1;
}

const __CFString *SFModelTaskToString(unint64_t a1)
{
  if (a1 > 0xA)
    return CFSTR("Invalid Task");
  else
    return off_1E64854C0[a1];
}

id SFLSRGetInterface()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  _QWORD v29[3];
  uint64_t v30;
  _QWORD v31[2];
  _QWORD v32[2];
  _QWORD v33[2];
  _QWORD v34[3];
  _QWORD v35[2];
  _QWORD v36[2];
  _QWORD v37[2];

  v37[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EEFF3140);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = (void *)MEMORY[0x1E0C99E60];
  v37[0] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v37, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setWithArray:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", v3, sel_startRecordedAudioDictationWithParameters_, 0, 0);

  v4 = (void *)MEMORY[0x1E0C99E60];
  v36[0] = objc_opt_class();
  v36[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v36, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setWithArray:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", v6, sel_installedLanguagesForAssetType_completion_, 0, 1);

  v7 = (void *)MEMORY[0x1E0C99E60];
  v35[0] = objc_opt_class();
  v35[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v35, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setWithArray:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", v9, sel_initializeWithSandboxExtensions_, 0, 0);

  v10 = (void *)MEMORY[0x1E0C99E60];
  v34[0] = objc_opt_class();
  v34[1] = objc_opt_class();
  v34[2] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v34, 3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setWithArray:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", v12, sel_logCoreAnalyticsEvent_withAnalytics_, 1, 0);

  v13 = (void *)MEMORY[0x1E0C99E60];
  v33[0] = objc_opt_class();
  v33[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v33, 2);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setWithArray:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", v15, sel_createPhraseCountsArtifactWithIdentifier_rawPhraseCountsPath_customPronunciationsPath_writeToDirectory_sandboxExtensions_completion_, 5, 0);

  v16 = (void *)MEMORY[0x1E0C99E60];
  v32[0] = objc_opt_class();
  v32[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v32, 2);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setWithArray:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", v18, sel_createNgramCountsArtifactFromPhraseCountArtifact_writeToDirectory_sandboxExtensions_completion_, 2, 0);

  v19 = (void *)MEMORY[0x1E0C99E60];
  v31[0] = objc_opt_class();
  v31[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v31, 2);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setWithArray:", v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", v21, sel_trainAppLmFromNgramCountsArtifact_forApp_language_writeToDirectory_sandboxExtensions_completion_, 4, 0);

  v22 = (void *)MEMORY[0x1E0C99E60];
  v30 = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v30, 1);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setWithArray:", v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", v24, sel_setPurgeabilityForAssetWithConfig_purgeable_clientID_completion_, 0, 0);

  v25 = (void *)MEMORY[0x1E0C99E60];
  v29[0] = objc_opt_class();
  v29[1] = objc_opt_class();
  v29[2] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v29, 3);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setWithArray:", v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", v27, sel_subscriptionsForClientId_completion_, 0, 1);

  return v0;
}

id SFLSRDelegateGetInterface()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EEFEB088);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", objc_opt_class());
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", v1, sel_localSpeechRecognitionDidRecognizePartialResult_rawPartialResult_, 0, 0);

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", v2, sel_localSpeechRecognitionDidRecognizePartialResult_rawPartialResult_, 1, 0);

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", v3, sel_localSpeechRecognitionDidFinishRecognition_, 0, 0);

  return v0;
}

void sub_1B25ABF70(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B25AC190(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B25AC290(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B25AC568(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B25AC838(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B25AC8DC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B25AC9A4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B25ACCB8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B25ACEF4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__625(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__626(uint64_t a1)
{

}

void sub_1B25AD65C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,char a32)
{
  _Block_object_dispose(&a32, 8);
  _Unwind_Resume(a1);
}

void sub_1B25AF2B8(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1B25AF338(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

id ExpandTranscription(void *a1)
{
  id v1;
  id v2;
  void *v3;
  id v4;
  id v5;
  id v6;
  void *v7;
  id v8;
  _QWORD v10[4];
  id v11;
  id v12;
  id v13;

  v1 = a1;
  v2 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(v2, "addObject:", v1);
  objc_msgSend(v1, "segments");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __ExpandTranscription_block_invoke;
  v10[3] = &unk_1E6485720;
  v11 = v1;
  v12 = v3;
  v4 = v2;
  v13 = v4;
  v5 = v3;
  v6 = v1;
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", v10);
  v7 = v13;
  v8 = v4;

  return v8;
}

void sub_1B25AFED4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1B25B4938(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  id *v20;
  id *v21;

  objc_destroyWeak(v21);
  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1B25B69C0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v9;
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 64), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__1440(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__1441(uint64_t a1)
{

}

__CFString *SFAnalyticsEventTypeGetName(uint64_t a1)
{
  __CFString *v2;

  if (a1 > 200)
  {
    if (a1 <= 300)
    {
      if (a1 == 201)
      {
        v2 = CFSTR("com.apple.speechapi.AssetRequested");
        return v2;
      }
      if (a1 == 202)
      {
        v2 = CFSTR("com.apple.speechapi.AssetRequestCompleted");
        return v2;
      }
    }
    else
    {
      switch(a1)
      {
        case 301:
          v2 = CFSTR("com.apple.speechapi.PrepareStarted");
          return v2;
        case 302:
          v2 = CFSTR("com.apple.speechapi.PrepareCompleted");
          return v2;
        case 303:
          v2 = CFSTR("com.apple.speechapi.PrepareFailed");
          return v2;
      }
    }
LABEL_20:
    v2 = (__CFString *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("unknown.%ld"), a1);
    return v2;
  }
  v2 = CFSTR("com.apple.speechapi.RequestStarted");
  switch(a1)
  {
    case 'd':
      return v2;
    case 'e':
      v2 = CFSTR("com.apple.speechapi.StopSpeech");
      break;
    case 'f':
      v2 = CFSTR("com.apple.speechapi.CancelSpeech");
      break;
    case 'g':
      v2 = CFSTR("com.apple.speechapi.ResultPackage");
      break;
    case 'h':
      v2 = CFSTR("com.apple.speechapi.RequestCompleted");
      break;
    case 'i':
      v2 = CFSTR("com.apple.speechapi.RequestFailed");
      break;
    case 'j':
      v2 = CFSTR("com.apple.speechapi.RequestPerformance");
      break;
    default:
      goto LABEL_20;
  }
  return v2;
}

void sub_1B25B9ED8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id *a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,id location)
{
  id *v31;
  uint64_t v32;

  objc_destroyWeak(v31);
  objc_destroyWeak(&location);
  objc_destroyWeak(a10);
  objc_destroyWeak((id *)(v32 - 128));
  _Unwind_Resume(a1);
}

void sub_1B25BA43C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B25BA588(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B25BB35C(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 224), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__1549(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__1550(uint64_t a1)
{

}

uint64_t SFEntitledAssetStatusIsInstalled(void *a1)
{
  void *v1;
  id v2;
  void *v3;
  uint64_t v4;

  v1 = (void *)MEMORY[0x1E0CB3940];
  v2 = a1;
  objc_msgSend(v1, "stringWithFormat:", CFSTR("%@:"), CFSTR("Version"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "containsString:", v3);

  return v4;
}

void sub_1B25BE660(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_list va;

  va_start(va, a8);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t SFEntitledAssetStatusIsHighQuality(void *a1)
{
  id v1;
  void *v2;
  uint64_t v3;

  v1 = a1;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@:"), CFSTR("HQ"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v1, "containsString:", v2) & 1) != 0)
    v3 = 1;
  else
    v3 = objc_msgSend(v1, "isEqualToString:", CFSTR("HQ"));

  return v3;
}

void sub_1B25C13F4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  char a72;

  _Block_object_dispose(&a72, 8);
  _Unwind_Resume(a1);
}

void sub_1B25C1768(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31,uint64_t a32,uint64_t a33,uint64_t a34,char a35)
{
  _Block_object_dispose(&a31, 8);
  _Block_object_dispose(&a35, 8);
  _Unwind_Resume(a1);
}

void sub_1B25C2CF8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B25C3E9C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__1741(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__1742(uint64_t a1)
{

}

id VoiceAnalyticsForSegment(void *a1, double a2, double a3)
{
  id v5;
  id v6;
  void *v7;
  char v8;
  void *i;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  double v14;
  double v15;
  void *v16;
  unint64_t v17;
  unint64_t v18;
  unint64_t v19;
  unint64_t v20;
  void *v21;
  SFAcousticFeature *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  SFAcousticFeature *v27;
  uint64_t v28;
  SFAcousticFeature *v29;
  uint64_t v30;
  SFAcousticFeature *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  id v36;
  id v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  uint64_t v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  _BYTE v48[128];
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v5 = a1;
  objc_msgSend(v5, "acousticFeatures");
  v44 = 0u;
  v45 = 0u;
  v46 = 0u;
  v47 = 0u;
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v44, v48, 16);
  if (!v7)
  {

    v33 = 0;
    v34 = 0;
    v35 = 0;
    v36 = 0;
    goto LABEL_34;
  }
  v38 = v5;
  v39 = 0;
  v8 = 0;
  v40 = 0;
  v41 = 0;
  v42 = 0;
  v43 = *(_QWORD *)v45;
  do
  {
    for (i = 0; i != v7; i = (char *)i + 1)
    {
      if (*(_QWORD *)v45 != v43)
        objc_enumerationMutation(v6);
      v10 = *(void **)(*((_QWORD *)&v44 + 1) + 8 * (_QWORD)i);
      objc_msgSend(v6, "objectForKey:", v10, v38);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "acousticFeatureValuePerFrame");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "count");

      if (v13)
      {
        objc_msgSend(v11, "frameDuration");
        if (v14 > 1.0)
          v14 = v14 / 1000.0;
        if (v14 == 0.0)
          v15 = 1.0;
        else
          v15 = v14;
        objc_msgSend(v11, "acousticFeatureValuePerFrame");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v16, "count");

        if (v17 >= (unint64_t)(a2 / v15))
          v18 = (unint64_t)(a2 / v15);
        else
          v18 = v17;
        if (v17 >= (unint64_t)(a3 / v15))
          v19 = (unint64_t)(a3 / v15);
        else
          v19 = v17;
        v20 = v19 - v18;
        v21 = (void *)MEMORY[0x1B5E25BAC]();
        if (objc_msgSend(v10, "isEqualToString:", CFSTR("jitter")))
        {
          v22 = [SFAcousticFeature alloc];
          objc_msgSend(v11, "acousticFeatureValuePerFrame");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "subarrayWithRange:", v18, v20);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          v25 = -[SFAcousticFeature _initWithAcousticFeatureValue:frameDuration:](v22, "_initWithAcousticFeatureValue:frameDuration:", v24, v15);
          v26 = v42;
          v42 = (void *)v25;
          goto LABEL_26;
        }
        if (objc_msgSend(v10, "isEqualToString:", CFSTR("shimmer")))
        {
          v27 = [SFAcousticFeature alloc];
          objc_msgSend(v11, "acousticFeatureValuePerFrame");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "subarrayWithRange:", v18, v20);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          v28 = -[SFAcousticFeature _initWithAcousticFeatureValue:frameDuration:](v27, "_initWithAcousticFeatureValue:frameDuration:", v24, v15);
          v26 = v41;
          v41 = (void *)v28;
          goto LABEL_26;
        }
        if (objc_msgSend(v10, "isEqualToString:", CFSTR("pitch")))
        {
          v29 = [SFAcousticFeature alloc];
          objc_msgSend(v11, "acousticFeatureValuePerFrame");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "subarrayWithRange:", v18, v20);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          v30 = -[SFAcousticFeature _initWithAcousticFeatureValue:frameDuration:](v29, "_initWithAcousticFeatureValue:frameDuration:", v24, v15);
          v26 = v40;
          v40 = (void *)v30;
          goto LABEL_26;
        }
        if (objc_msgSend(v10, "isEqualToString:", CFSTR("voicing")))
        {
          v31 = [SFAcousticFeature alloc];
          objc_msgSend(v11, "acousticFeatureValuePerFrame");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "subarrayWithRange:", v18, v20);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          v32 = -[SFAcousticFeature _initWithAcousticFeatureValue:frameDuration:](v31, "_initWithAcousticFeatureValue:frameDuration:", v24, v15);
          v26 = v39;
          v39 = (void *)v32;
LABEL_26:

        }
        objc_autoreleasePoolPop(v21);
        v8 = 1;
      }

    }
    v7 = (void *)objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v44, v48, 16);
  }
  while (v7);

  if ((v8 & 1) != 0)
  {
    v34 = v41;
    v33 = v42;
    v7 = v39;
    v35 = v40;
    v36 = -[SFVoiceAnalytics _initWithJitter:shimmer:pitch:voicing:]([SFVoiceAnalytics alloc], "_initWithJitter:shimmer:pitch:voicing:", v42, v41, v40, v39);
    v5 = v38;
  }
  else
  {
    v36 = 0;
    v5 = v38;
    v7 = v39;
    v34 = v41;
    v33 = v42;
    v35 = v40;
  }
LABEL_34:

  return v36;
}

uint64_t SFIsTV()
{
  return 0;
}

uint64_t SFIsIOS()
{
  return 1;
}

uint64_t SFIsMac()
{
  return 0;
}

uint64_t SFSupportsANE()
{
  return MGGetBoolAnswer();
}

uint64_t SFIsInternalInstall()
{
  if (SFIsInternalInstall_onceToken != -1)
    dispatch_once(&SFIsInternalInstall_onceToken, &__block_literal_global_1717);
  return SFIsInternalInstall_isInternal;
}

_QWORD *SFSetError(_QWORD *result, id a2)
{
  _QWORD *v2;

  if (result)
  {
    if (a2)
    {
      v2 = result;
      result = objc_retainAutorelease(a2);
      *v2 = result;
    }
  }
  return result;
}

id SFHash64(void *a1)
{
  id v1;
  void *v2;
  unsigned int v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  void *v7;
  unint64_t v8;
  unint64_t v9;

  v1 = a1;
  v2 = v1;
  if (v1)
  {
    v3 = objc_msgSend(v1, "length");
    v4 = objc_msgSend(objc_retainAutorelease(v2), "bytes");
    if (v3 >= 0x10)
    {
      v5 = 0;
      v6 = 0;
      do
      {
        v8 = 0x9DDFEA08EB382D69
           * ((0x9DDFEA08EB382D69 * *(_QWORD *)(v4 + v5)) ^ ((0x9DDFEA08EB382D69 * *(_QWORD *)(v4 + v5)) >> 44));
        v9 = 0x9DDFEA08EB382D69
           * ((0x9DDFEA08EB382D69 * *(_QWORD *)(v4 + v5 + 8)) ^ ((0x9DDFEA08EB382D69 * *(_QWORD *)(v4 + v5 + 8)) >> 44));
        v6 -= 0x622015F714C7D297 * ((v9 ^ (v9 >> 41)) + (v8 ^ (v8 >> 41)));
        v5 += 16;
      }
      while (v5 < (v3 & 0xFFFFFFF0));
    }
    else
    {
      LODWORD(v5) = 0;
      v6 = 0;
    }
    if (v3 > v5)
      __memcpy_chk();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

id SFHash64String(void *a1)
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "dataUsingEncoding:", 4);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  SFHash64(v1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

uint64_t SFScanHexString(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v4;

  v4 = 0;
  objc_msgSend(MEMORY[0x1E0CB3900], "scannerWithString:", a1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "scanHexLongLong:", &v4);
  v2 = v4;

  return v2;
}

id SFGetOrCreateDirectoryPath(uint64_t a1, _QWORD *a2)
{
  id v3;
  void *v4;
  void *v5;

  if (a1)
  {
    objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", a1, 1);
    v3 = (id)objc_claimAutoreleasedReturnValue();
    SFGetOrCreateDirectoryURL(v3, a2);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], -1000, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = v5;
    v4 = 0;
    if (a2 && v5)
    {
      v3 = objc_retainAutorelease(v5);
      v4 = 0;
      *a2 = v3;
    }
  }

  return v4;
}

id SFGetOrCreateDirectoryURL(void *a1, _QWORD *a2)
{
  id v3;
  void *v4;
  int v5;
  id v6;
  void *v7;
  void *v8;

  v3 = a1;
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v3, 1, 0, a2);

    v6 = 0;
    if (v5)
      v6 = v3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], -1000, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (a2 && v7)
      *a2 = objc_retainAutorelease(v7);

    v6 = 0;
  }

  return v6;
}

uint64_t SFRemoveItemIfExistsAtPath(void *a1, _QWORD *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  v3 = a1;
  if (objc_msgSend(v3, "length"))
  {
    objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    v5 = SFRemoveItemIfExistsAtURL(v4, a2);
    return v5;
  }
  else
  {
    v7 = (void *)MEMORY[0x1E0CB35C8];
    v8 = *MEMORY[0x1E0CB28A8];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid path: \"%@\""), v3, *MEMORY[0x1E0CB2D50]);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v14[0] = v9;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, &v13, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "errorWithDomain:code:userInfo:", v8, -1000, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if (a2)
    {
      if (v11)
        *a2 = objc_retainAutorelease(v11);
    }

    return 0;
  }
}

uint64_t SFRemoveItemIfExistsAtURL(void *a1, _QWORD *a2)
{
  id v3;
  void *v4;
  char v5;
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  id v16;
  uint64_t v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x1E0C80C00];
  v3 = a1;
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 0;
    v5 = objc_msgSend(v4, "removeItemAtURL:error:", v3, &v16);
    v6 = v16;
    v7 = v6;
    if ((v5 & 1) != 0)
    {

LABEL_9:
      v13 = 1;
      goto LABEL_10;
    }
    v14 = objc_msgSend(v6, "code");

    if (v14 == 4)
      goto LABEL_9;
    v13 = 0;
    if (a2 && v7)
    {
      v7 = objc_retainAutorelease(v7);
      v13 = 0;
      *a2 = v7;
    }
  }
  else
  {
    v8 = (void *)MEMORY[0x1E0CB35C8];
    v9 = *MEMORY[0x1E0CB28A8];
    v17 = *MEMORY[0x1E0CB2D50];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid item URL: %@"), 0);
    v7 = (id)objc_claimAutoreleasedReturnValue();
    v18[0] = v7;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, &v17, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "errorWithDomain:code:userInfo:", v9, -1000, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if (a2 && v11)
      *a2 = objc_retainAutorelease(v11);

    v13 = 0;
  }
LABEL_10:

  return v13;
}

uint64_t SFWritePropertyList(uint64_t a1, void *a2, int a3, uint64_t a4)
{
  id v7;
  void *v8;
  id v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  char v16;
  NSObject *v17;
  unsigned __int8 v19;
  uint8_t buf[4];
  const char *v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  int v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  objc_msgSend(MEMORY[0x1E0CB38B0], "dataWithPropertyList:format:options:error:", a1, 200, 0, a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "length"))
  {
    objc_msgSend(v7, "path");
    v9 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v10 = open_dprotected_np((const char *)objc_msgSend(v9, "UTF8String"), 1538, a3, 0, 384);

    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3608]), "initWithFileDescriptor:closeOnDealloc:", v10, 1);
    v12 = objc_msgSend(v11, "writeData:error:", v8, a4);
    if ((v12 & 1) == 0)
    {
      objc_msgSend(v7, "URLByDeletingLastPathComponent");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "path");
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      v19 = 0;
      objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "fileExistsAtPath:isDirectory:", v14, &v19);

      if ((v16 & 1) == 0)
      {
        v17 = SFLogFramework;
        if (os_log_type_enabled((os_log_t)SFLogFramework, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315650;
          v21 = "SFWritePropertyList";
          v22 = 2112;
          v23 = v14;
          v24 = 1024;
          v25 = v19;
          _os_log_error_impl(&dword_1B2494000, v17, OS_LOG_TYPE_ERROR, "%s Parent directory: %@ does not exist (isDirectory: %i)", buf, 0x1Cu);
        }
      }

    }
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

id SFReadPropertyList(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfURL:options:error:", a1, 0, a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0CB38B0], "propertyListWithData:options:format:error:", v5, a2, 0, a3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

BOOL IsNarrowBand(void *a1)
{
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  double mSampleRate;
  uint64_t i;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t j;
  const AudioStreamBasicDescription *StreamBasicDescription;
  _BOOL8 v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v1 = a1;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v2 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
  if (v2)
  {
    v3 = v2;
    v4 = *(_QWORD *)v21;
    mSampleRate = 0.0;
    do
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v21 != v4)
          objc_enumerationMutation(v1);
        v7 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
        v16 = 0u;
        v17 = 0u;
        v18 = 0u;
        v19 = 0u;
        objc_msgSend(v7, "formatDescriptions", 0);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
        if (v9)
        {
          v10 = v9;
          v11 = *(_QWORD *)v17;
          do
          {
            for (j = 0; j != v10; ++j)
            {
              if (*(_QWORD *)v17 != v11)
                objc_enumerationMutation(v8);
              StreamBasicDescription = CMAudioFormatDescriptionGetStreamBasicDescription(*(CMAudioFormatDescriptionRef *)(*((_QWORD *)&v16 + 1) + 8 * j));
              if (StreamBasicDescription && mSampleRate < StreamBasicDescription->mSampleRate)
                mSampleRate = StreamBasicDescription->mSampleRate;
            }
            v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
          }
          while (v10);
        }

      }
      v3 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
    }
    while (v3);
  }
  else
  {
    mSampleRate = 0.0;
  }
  v14 = mSampleRate <= 8000.0 && mSampleRate > 0.0;

  return v14;
}

void sub_1B25C68B8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__1927(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__1928(uint64_t a1)
{

}

void sub_1B25C7C80(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id xpcInterface_EARSpeechRecognizer()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v20;
  _QWORD v21[2];
  _QWORD v22[3];
  _QWORD v23[2];

  v23[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EEFF2F60);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = (void *)MEMORY[0x1E0C99E60];
  v2 = objc_opt_class();
  objc_msgSend(v1, "setWithObjects:", v2, objc_opt_class(), 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", v3, sel_setExtraLmList_sandboxExtensions_, 0, 0);

  v4 = (void *)MEMORY[0x1E0C99E60];
  v5 = objc_opt_class();
  objc_msgSend(v4, "setWithObjects:", v5, objc_opt_class(), 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", v6, sel_setExtraLmList_sandboxExtensions_, 1, 0);

  v7 = (void *)MEMORY[0x1E0C99E60];
  v23[0] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v23, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setWithArray:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", v9, sel_modelInfoWithReply_, 0, 1);

  v10 = (void *)MEMORY[0x1E0C99E60];
  v22[0] = objc_opt_class();
  v22[1] = objc_opt_class();
  v22[2] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v22, 3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setWithArray:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", v12, sel_recognitionStatisticsWithReply_, 0, 1);

  v13 = (void *)MEMORY[0x1E0C99E60];
  v21[0] = objc_opt_class();
  v21[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 2);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setWithArray:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", v15, sel_recognitionUtterenceStatisticsWithReply_, 0, 1);

  v16 = (void *)MEMORY[0x1E0C99E60];
  v20 = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v20, 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setWithArray:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", v18, sel_recognitionMetricsWithReply_, 0, 1);

  return v0;
}

id xpcInterface_EARSpeechRecognitionResultStream()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[4];

  v8[3] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EEFE6E40);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = (void *)MEMORY[0x1E0C99E60];
  v2 = objc_opt_class();
  objc_msgSend(v1, "setWithObjects:", v2, objc_opt_class(), 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", v3, sel_speechRecognizerDidProduceEndpointFeaturesWithWordCount_trailingSilenceDuration_eosLikelihood_pauseCounts_silencePosterior_processedAudioDurationInMilliseconds_acousticEndpointerScore_, 3, 0);

  v4 = (void *)MEMORY[0x1E0C99E60];
  v8[0] = objc_opt_class();
  v8[1] = objc_opt_class();
  v8[2] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setWithArray:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", v6, sel_speechRecognizerDidRecognizeFinalResultMultiUserPackages_, 0, 0);

  return v0;
}

id xpcInterface_LSRAssets()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EEFF3020);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = (void *)MEMORY[0x1E0C99E60];
  v2 = objc_opt_class();
  objc_msgSend(v1, "setWithObjects:", v2, objc_opt_class(), 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", v3, sel_getContextualNamedEntitySourcesForApplication_taskName_reply_, 0, 1);

  v4 = (void *)MEMORY[0x1E0C99E60];
  v5 = objc_opt_class();
  objc_msgSend(v4, "setWithObjects:", v5, objc_opt_class(), 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", v6, sel_getContextualRankedContactSourcesForApplication_taskName_reply_, 0, 1);

  return v0;
}

id xpcInterface_EAREuclid()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[3];

  v8[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EEFF3080);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = (void *)MEMORY[0x1E0C99E60];
  v2 = objc_opt_class();
  objc_msgSend(v1, "setWithObjects:", v2, objc_opt_class(), 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", v3, sel_findNearestNeighbors_numberOfNeighbors_reply_, 0, 1);

  v4 = (void *)MEMORY[0x1E0C99E60];
  v8[0] = objc_opt_class();
  v8[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setWithArray:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", v6, sel_computeEmbeddings_reply_, 0, 1);

  return v0;
}

id xpcInterface_EARLanguageDetector()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EEFF31A0);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = (void *)MEMORY[0x1E0C99E60];
  v5[0] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setWithArray:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", v3, sel_modelInfoWithReply_, 0, 1);

  return v0;
}

uint64_t xpcInterface_EARLanguageDetectorResultStream()
{
  return objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EEFE7168);
}

void sub_1B25C9C80(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B25CA3D0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B25CA5C4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B25CA7D8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B25CA96C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B25CAE3C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,char a38)
{
  _Block_object_dispose(&a38, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__2470(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__2471(uint64_t a1)
{

}

SFEntitledAssetConfig *SFEntitledAssetConfigForLanguageDetector()
{
  return -[SFEntitledAssetConfig initWithLanguage:assetType:]([SFEntitledAssetConfig alloc], "initWithLanguage:assetType:", CFSTR("none"), 6);
}

void SFLogInitIfNeeded()
{
  if (SFLogInitIfNeeded_once != -1)
    dispatch_once(&SFLogInitIfNeeded_once, &__block_literal_global_2502);
}

uint64_t sub_1B25CC2D4()
{
  return MEMORY[0x1E0CADE58]();
}

uint64_t sub_1B25CC2E0()
{
  return MEMORY[0x1E0CADF88]();
}

uint64_t sub_1B25CC2EC()
{
  return MEMORY[0x1E0CAE418]();
}

uint64_t sub_1B25CC2F8()
{
  return MEMORY[0x1E0CAE4B8]();
}

uint64_t sub_1B25CC304()
{
  return MEMORY[0x1E0CAE8B8]();
}

uint64_t sub_1B25CC310()
{
  return MEMORY[0x1E0CAE910]();
}

uint64_t sub_1B25CC31C()
{
  return MEMORY[0x1E0CAE920]();
}

uint64_t sub_1B25CC328()
{
  return MEMORY[0x1E0CAE928]();
}

uint64_t sub_1B25CC334()
{
  return MEMORY[0x1E0CAEF10]();
}

uint64_t sub_1B25CC340()
{
  return MEMORY[0x1E0CAEF60]();
}

uint64_t sub_1B25CC34C()
{
  return MEMORY[0x1E0CAF0B8]();
}

uint64_t sub_1B25CC358()
{
  return MEMORY[0x1E0CAF130]();
}

uint64_t sub_1B25CC364()
{
  return MEMORY[0x1E0CAF138]();
}

uint64_t sub_1B25CC370()
{
  return MEMORY[0x1E0CAF148]();
}

uint64_t sub_1B25CC37C()
{
  return MEMORY[0x1E0CAF150]();
}

uint64_t sub_1B25CC388()
{
  return MEMORY[0x1E0CAF160]();
}

uint64_t sub_1B25CC394()
{
  return MEMORY[0x1E0CAF1A0]();
}

uint64_t sub_1B25CC3A0()
{
  return MEMORY[0x1E0CAF1D8]();
}

uint64_t sub_1B25CC3AC()
{
  return MEMORY[0x1E0CAF238]();
}

uint64_t sub_1B25CC3B8()
{
  return MEMORY[0x1E0CAF240]();
}

uint64_t sub_1B25CC3C4()
{
  return MEMORY[0x1E0CAF278]();
}

uint64_t sub_1B25CC3D0()
{
  return MEMORY[0x1E0CAF2B0]();
}

uint64_t sub_1B25CC3DC()
{
  return MEMORY[0x1E0CAF2C0]();
}

uint64_t sub_1B25CC3E8()
{
  return MEMORY[0x1E0CAF458]();
}

uint64_t sub_1B25CC3F4()
{
  return MEMORY[0x1E0CAF460]();
}

uint64_t sub_1B25CC400()
{
  return MEMORY[0x1E0CAF558]();
}

uint64_t sub_1B25CC40C()
{
  return MEMORY[0x1E0CAF560]();
}

uint64_t sub_1B25CC418()
{
  return MEMORY[0x1E0CAF568]();
}

uint64_t sub_1B25CC424()
{
  return MEMORY[0x1E0CAF570]();
}

uint64_t sub_1B25CC430()
{
  return MEMORY[0x1E0CAF5A8]();
}

uint64_t sub_1B25CC43C()
{
  return MEMORY[0x1E0CAF6A0]();
}

uint64_t sub_1B25CC448()
{
  return MEMORY[0x1E0CAF6A8]();
}

uint64_t sub_1B25CC454()
{
  return MEMORY[0x1E0CAF6B0]();
}

uint64_t sub_1B25CC460()
{
  return MEMORY[0x1E0CAF6C0]();
}

uint64_t sub_1B25CC46C()
{
  return MEMORY[0x1E0CAF8D8]();
}

uint64_t sub_1B25CC478()
{
  return MEMORY[0x1E0CAF8E8]();
}

uint64_t sub_1B25CC484()
{
  return MEMORY[0x1E0CAF8F8]();
}

uint64_t sub_1B25CC490()
{
  return MEMORY[0x1E0CAF900]();
}

uint64_t sub_1B25CC49C()
{
  return MEMORY[0x1E0CAF920]();
}

uint64_t sub_1B25CC4A8()
{
  return MEMORY[0x1E0CAF930]();
}

uint64_t sub_1B25CC4B4()
{
  return MEMORY[0x1E0CAF940]();
}

uint64_t sub_1B25CC4C0()
{
  return MEMORY[0x1E0CAF970]();
}

uint64_t sub_1B25CC4CC()
{
  return MEMORY[0x1E0CAF980]();
}

uint64_t sub_1B25CC4D8()
{
  return MEMORY[0x1E0CAF990]();
}

uint64_t sub_1B25CC4E4()
{
  return MEMORY[0x1E0CAFD90]();
}

uint64_t sub_1B25CC4F0()
{
  return MEMORY[0x1E0CAFE38]();
}

uint64_t sub_1B25CC4FC()
{
  return MEMORY[0x1E0CAFE80]();
}

uint64_t sub_1B25CC508()
{
  return MEMORY[0x1E0CAFF00]();
}

uint64_t sub_1B25CC514()
{
  return MEMORY[0x1E0CAFF40]();
}

uint64_t sub_1B25CC520()
{
  return MEMORY[0x1E0CAFFD0]();
}

uint64_t sub_1B25CC52C()
{
  return MEMORY[0x1E0CAFFE0]();
}

uint64_t sub_1B25CC538()
{
  return MEMORY[0x1E0CAFFF8]();
}

uint64_t sub_1B25CC544()
{
  return MEMORY[0x1E0CB0080]();
}

uint64_t sub_1B25CC550()
{
  return MEMORY[0x1E0CB00A0]();
}

uint64_t sub_1B25CC55C()
{
  return MEMORY[0x1E0CB0140]();
}

uint64_t sub_1B25CC568()
{
  return MEMORY[0x1E0CB01B0]();
}

uint64_t sub_1B25CC574()
{
  return MEMORY[0x1E0CB01D8]();
}

uint64_t sub_1B25CC580()
{
  return MEMORY[0x1E0CB01F0]();
}

uint64_t sub_1B25CC58C()
{
  return MEMORY[0x1E0CB0228]();
}

uint64_t sub_1B25CC598()
{
  return MEMORY[0x1E0CB0260]();
}

uint64_t sub_1B25CC5A4()
{
  return MEMORY[0x1E0CB0270]();
}

uint64_t sub_1B25CC5B0()
{
  return MEMORY[0x1E0CB07C0]();
}

uint64_t sub_1B25CC5BC()
{
  return MEMORY[0x1E0CB07E8]();
}

uint64_t sub_1B25CC5C8()
{
  return MEMORY[0x1E0CB0870]();
}

uint64_t sub_1B25CC5D4()
{
  return MEMORY[0x1E0CB0900]();
}

uint64_t sub_1B25CC5E0()
{
  return MEMORY[0x1E0CB0910]();
}

uint64_t sub_1B25CC5EC()
{
  return MEMORY[0x1E0CB0930]();
}

uint64_t sub_1B25CC5F8()
{
  return MEMORY[0x1E0CB0948]();
}

uint64_t sub_1B25CC604()
{
  return MEMORY[0x1E0CB0958]();
}

uint64_t sub_1B25CC610()
{
  return MEMORY[0x1E0CB0988]();
}

uint64_t sub_1B25CC61C()
{
  return MEMORY[0x1E0CB0998]();
}

uint64_t sub_1B25CC628()
{
  return MEMORY[0x1E0CB0A80]();
}

uint64_t sub_1B25CC634()
{
  return MEMORY[0x1E0CB0A90]();
}

uint64_t sub_1B25CC640()
{
  return MEMORY[0x1E0CB0AC0]();
}

uint64_t sub_1B25CC64C()
{
  return MEMORY[0x1E0CB0AD0]();
}

uint64_t sub_1B25CC658()
{
  return MEMORY[0x1E0CB0AD8]();
}

uint64_t sub_1B25CC664()
{
  return MEMORY[0x1E0CB0AE8]();
}

uint64_t sub_1B25CC670()
{
  return MEMORY[0x1E0CB0BE0]();
}

uint64_t sub_1B25CC67C()
{
  return MEMORY[0x1E0CB0C20]();
}

uint64_t sub_1B25CC688()
{
  return MEMORY[0x1E0CB0C30]();
}

uint64_t sub_1B25CC694()
{
  return MEMORY[0x1E0CB0C38]();
}

uint64_t sub_1B25CC6A0()
{
  return MEMORY[0x1E0CB0C48]();
}

uint64_t sub_1B25CC6AC()
{
  return MEMORY[0x1E0CB0CC8]();
}

uint64_t sub_1B25CC6B8()
{
  return MEMORY[0x1E0CB0D80]();
}

uint64_t sub_1B25CC6C4()
{
  return MEMORY[0x1E0CB0D90]();
}

uint64_t sub_1B25CC6D0()
{
  return MEMORY[0x1E0CB0DA8]();
}

uint64_t sub_1B25CC6DC()
{
  return MEMORY[0x1E0CB0DB8]();
}

uint64_t sub_1B25CC6E8()
{
  return MEMORY[0x1E0CB0DF0]();
}

uint64_t sub_1B25CC6F4()
{
  return MEMORY[0x1E0CB0E38]();
}

uint64_t sub_1B25CC700()
{
  return MEMORY[0x1E0CB0F38]();
}

uint64_t sub_1B25CC70C()
{
  return MEMORY[0x1E0CB10C8]();
}

uint64_t sub_1B25CC718()
{
  return MEMORY[0x1E0CB11F0]();
}

uint64_t sub_1B25CC724()
{
  return MEMORY[0x1E0CB12B8]();
}

uint64_t sub_1B25CC730()
{
  return MEMORY[0x1E0CB12C0]();
}

uint64_t sub_1B25CC73C()
{
  return MEMORY[0x1E0CB1348]();
}

uint64_t sub_1B25CC748()
{
  return MEMORY[0x1E0CB13A0]();
}

uint64_t sub_1B25CC754()
{
  return MEMORY[0x1E0CB1628]();
}

uint64_t sub_1B25CC760()
{
  return MEMORY[0x1E0CB1658]();
}

uint64_t sub_1B25CC76C()
{
  return MEMORY[0x1E0DEFAD0]();
}

uint64_t sub_1B25CC778()
{
  return MEMORY[0x1E0DEFAF8]();
}

uint64_t sub_1B25CC784()
{
  return MEMORY[0x1E0DEFB00]();
}

uint64_t sub_1B25CC790()
{
  return MEMORY[0x1E0DEFB08]();
}

uint64_t sub_1B25CC79C()
{
  return MEMORY[0x1E0DEFB10]();
}

uint64_t sub_1B25CC7A8()
{
  return MEMORY[0x1E0DEFB18]();
}

uint64_t sub_1B25CC7B4()
{
  return MEMORY[0x1E0DEFB20]();
}

uint64_t sub_1B25CC7C0()
{
  return MEMORY[0x1E0DEFB30]();
}

uint64_t sub_1B25CC7CC()
{
  return MEMORY[0x1E0DEFB38]();
}

uint64_t sub_1B25CC7D8()
{
  return MEMORY[0x1E0DEFB40]();
}

uint64_t sub_1B25CC7E4()
{
  return MEMORY[0x1E0DEFB50]();
}

uint64_t sub_1B25CC7F0()
{
  return MEMORY[0x1E0DEFB58]();
}

uint64_t sub_1B25CC7FC()
{
  return MEMORY[0x1E0DEFB60]();
}

uint64_t sub_1B25CC808()
{
  return MEMORY[0x1E0DEFB68]();
}

uint64_t sub_1B25CC814()
{
  return MEMORY[0x1E0CF1378]();
}

uint64_t sub_1B25CC820()
{
  return MEMORY[0x1E0DF2100]();
}

uint64_t sub_1B25CC82C()
{
  return MEMORY[0x1E0DF2108]();
}

uint64_t sub_1B25CC838()
{
  return MEMORY[0x1E0DF2118]();
}

uint64_t sub_1B25CC844()
{
  return MEMORY[0x1E0DF2130]();
}

uint64_t sub_1B25CC850()
{
  return MEMORY[0x1E0DF2150]();
}

uint64_t sub_1B25CC85C()
{
  return MEMORY[0x1E0DF2170]();
}

uint64_t sub_1B25CC868()
{
  return MEMORY[0x1E0DF2198]();
}

uint64_t sub_1B25CC874()
{
  return MEMORY[0x1E0DF2210]();
}

uint64_t sub_1B25CC880()
{
  return MEMORY[0x1E0DF2218]();
}

uint64_t sub_1B25CC88C()
{
  return MEMORY[0x1E0DF2220]();
}

uint64_t sub_1B25CC898()
{
  return MEMORY[0x1E0DF2228]();
}

uint64_t sub_1B25CC8A4()
{
  return MEMORY[0x1E0DF2238]();
}

uint64_t sub_1B25CC8B0()
{
  return MEMORY[0x1E0DF2240]();
}

uint64_t sub_1B25CC8BC()
{
  return MEMORY[0x1E0DF2248]();
}

uint64_t sub_1B25CC8C8()
{
  return MEMORY[0x1E0DF2258]();
}

uint64_t sub_1B25CC8D4()
{
  return MEMORY[0x1E0DF2268]();
}

uint64_t sub_1B25CC8E0()
{
  return MEMORY[0x1E0DF05B0]();
}

uint64_t sub_1B25CC8EC()
{
  return MEMORY[0x1E0CB17D8]();
}

uint64_t sub_1B25CC8F8()
{
  return MEMORY[0x1E0CB1808]();
}

uint64_t sub_1B25CC904()
{
  return MEMORY[0x1E0DE9E78]();
}

uint64_t sub_1B25CC910()
{
  return MEMORY[0x1E0DEA1B8]();
}

uint64_t sub_1B25CC91C()
{
  return MEMORY[0x1E0DEA1C0]();
}

uint64_t sub_1B25CC928()
{
  return MEMORY[0x1E0DEA318]();
}

uint64_t sub_1B25CC934()
{
  return MEMORY[0x1E0DEA350]();
}

uint64_t sub_1B25CC940()
{
  return MEMORY[0x1E0DEA3B0]();
}

uint64_t sub_1B25CC94C()
{
  return MEMORY[0x1E0DEA3C0]();
}

uint64_t sub_1B25CC958()
{
  return MEMORY[0x1E0DEA3C8]();
}

uint64_t sub_1B25CC964()
{
  return MEMORY[0x1E0DEA3D0]();
}

uint64_t sub_1B25CC970()
{
  return MEMORY[0x1E0DEA3E0]();
}

uint64_t sub_1B25CC97C()
{
  return MEMORY[0x1E0DEA3E8]();
}

uint64_t sub_1B25CC988()
{
  return MEMORY[0x1E0DEA3F0]();
}

uint64_t sub_1B25CC994()
{
  return MEMORY[0x1E0DEA568]();
}

uint64_t sub_1B25CC9A0()
{
  return MEMORY[0x1E0CB1850]();
}

uint64_t sub_1B25CC9AC()
{
  return MEMORY[0x1E0CB18A0]();
}

uint64_t sub_1B25CC9B8()
{
  return MEMORY[0x1E0CB18C0]();
}

uint64_t sub_1B25CC9C4()
{
  return MEMORY[0x1E0CB18D0]();
}

uint64_t sub_1B25CC9D0()
{
  return MEMORY[0x1E0CB18D8]();
}

uint64_t sub_1B25CC9DC()
{
  return MEMORY[0x1E0CB18E0]();
}

uint64_t sub_1B25CC9E8()
{
  return MEMORY[0x1E0CB18E8]();
}

uint64_t sub_1B25CC9F4()
{
  return MEMORY[0x1E0CB18F0]();
}

uint64_t sub_1B25CCA00()
{
  return MEMORY[0x1E0CB18F8]();
}

uint64_t sub_1B25CCA0C()
{
  return MEMORY[0x1E0CB1940]();
}

uint64_t sub_1B25CCA18()
{
  return MEMORY[0x1E0CB1980]();
}

uint64_t sub_1B25CCA24()
{
  return MEMORY[0x1E0CB1988]();
}

uint64_t sub_1B25CCA30()
{
  return MEMORY[0x1E0CB1990]();
}

uint64_t sub_1B25CCA3C()
{
  return MEMORY[0x1E0CB19C0]();
}

uint64_t sub_1B25CCA48()
{
  return MEMORY[0x1E0CB19E8]();
}

uint64_t sub_1B25CCA54()
{
  return MEMORY[0x1E0CB1A18]();
}

uint64_t sub_1B25CCA60()
{
  return MEMORY[0x1E0CB1A40]();
}

uint64_t sub_1B25CCA6C()
{
  return MEMORY[0x1E0DEA5F8]();
}

uint64_t sub_1B25CCA78()
{
  return MEMORY[0x1E0DEA618]();
}

uint64_t sub_1B25CCA84()
{
  return MEMORY[0x1E0DEA630]();
}

uint64_t sub_1B25CCA90()
{
  return MEMORY[0x1E0DEA658]();
}

uint64_t sub_1B25CCA9C()
{
  return MEMORY[0x1E0DEA680]();
}

uint64_t sub_1B25CCAA8()
{
  return MEMORY[0x1E0DEA708]();
}

uint64_t sub_1B25CCAB4()
{
  return MEMORY[0x1E0DEA758]();
}

uint64_t sub_1B25CCAC0()
{
  return MEMORY[0x1E0DEA7B8]();
}

uint64_t sub_1B25CCACC()
{
  return MEMORY[0x1E0DEA7D8]();
}

uint64_t sub_1B25CCAD8()
{
  return MEMORY[0x1E0DEA7F0]();
}

uint64_t sub_1B25CCAE4()
{
  return MEMORY[0x1E0DEA800]();
}

uint64_t sub_1B25CCAF0()
{
  return MEMORY[0x1E0DEA840]();
}

uint64_t sub_1B25CCAFC()
{
  return MEMORY[0x1E0DEA850]();
}

uint64_t sub_1B25CCB08()
{
  return MEMORY[0x1E0DEA8F8]();
}

uint64_t sub_1B25CCB14()
{
  return MEMORY[0x1E0DEAA38]();
}

uint64_t sub_1B25CCB20()
{
  return MEMORY[0x1E0DEAA40]();
}

uint64_t sub_1B25CCB2C()
{
  return MEMORY[0x1E0DEAA50]();
}

uint64_t sub_1B25CCB38()
{
  return MEMORY[0x1E0DEAA58]();
}

uint64_t sub_1B25CCB44()
{
  return MEMORY[0x1E0DEAA70]();
}

uint64_t sub_1B25CCB50()
{
  return MEMORY[0x1E0DEAAB8]();
}

uint64_t sub_1B25CCB5C()
{
  return MEMORY[0x1E0DEAAC8]();
}

uint64_t sub_1B25CCB68()
{
  return MEMORY[0x1E0DEAAD0]();
}

uint64_t sub_1B25CCB74()
{
  return MEMORY[0x1E0DEAAD8]();
}

uint64_t sub_1B25CCB80()
{
  return MEMORY[0x1E0DEABC8]();
}

uint64_t sub_1B25CCB8C()
{
  return MEMORY[0x1E0DEADA0]();
}

uint64_t sub_1B25CCB98()
{
  return MEMORY[0x1E0CB1AC0]();
}

uint64_t sub_1B25CCBA4()
{
  return MEMORY[0x1E0CB1AE8]();
}

uint64_t sub_1B25CCBB0()
{
  return MEMORY[0x1E0DEADB0]();
}

uint64_t sub_1B25CCBBC()
{
  return MEMORY[0x1E0DEADB8]();
}

uint64_t sub_1B25CCBC8()
{
  return MEMORY[0x1E0DEADC8]();
}

uint64_t sub_1B25CCBD4()
{
  return MEMORY[0x1E0DEADE8]();
}

uint64_t sub_1B25CCBE0()
{
  return MEMORY[0x1E0DEAE10]();
}

uint64_t sub_1B25CCBEC()
{
  return MEMORY[0x1E0DEAE28]();
}

uint64_t sub_1B25CCBF8()
{
  return MEMORY[0x1E0DEAE38]();
}

uint64_t sub_1B25CCC04()
{
  return MEMORY[0x1E0DEAE58]();
}

uint64_t sub_1B25CCC10()
{
  return MEMORY[0x1E0DEAE60]();
}

uint64_t sub_1B25CCC1C()
{
  return MEMORY[0x1E0DEAE80]();
}

uint64_t sub_1B25CCC28()
{
  return MEMORY[0x1E0DEAEA0]();
}

uint64_t sub_1B25CCC34()
{
  return MEMORY[0x1E0DEAEC8]();
}

uint64_t sub_1B25CCC40()
{
  return MEMORY[0x1E0DF05B8]();
}

uint64_t sub_1B25CCC4C()
{
  return MEMORY[0x1E0DF05C8]();
}

uint64_t sub_1B25CCC58()
{
  return MEMORY[0x1E0DF05D0]();
}

uint64_t sub_1B25CCC64()
{
  return MEMORY[0x1E0DF05D8]();
}

uint64_t sub_1B25CCC70()
{
  return MEMORY[0x1E0DF05E0]();
}

uint64_t sub_1B25CCC7C()
{
  return MEMORY[0x1E0DF0688]();
}

uint64_t sub_1B25CCC88()
{
  return MEMORY[0x1E0DF0698]();
}

uint64_t sub_1B25CCC94()
{
  return MEMORY[0x1E0DF06B8]();
}

uint64_t sub_1B25CCCA0()
{
  return MEMORY[0x1E0DF06F8]();
}

uint64_t sub_1B25CCCAC()
{
  return MEMORY[0x1E0DF0718]();
}

uint64_t sub_1B25CCCB8()
{
  return MEMORY[0x1E0DF0730]();
}

uint64_t sub_1B25CCCC4()
{
  return MEMORY[0x1E0DF0740]();
}

uint64_t sub_1B25CCCD0()
{
  return MEMORY[0x1E0DF0748]();
}

uint64_t sub_1B25CCCDC()
{
  return MEMORY[0x1E0DF0750]();
}

uint64_t sub_1B25CCCE8()
{
  return MEMORY[0x1E0DF0770]();
}

uint64_t sub_1B25CCCF4()
{
  return MEMORY[0x1E0DF07D8]();
}

uint64_t sub_1B25CCD00()
{
  return MEMORY[0x1E0DF07E0]();
}

uint64_t sub_1B25CCD0C()
{
  return MEMORY[0x1E0DF07E8]();
}

uint64_t sub_1B25CCD18()
{
  return MEMORY[0x1E0DF07F8]();
}

uint64_t sub_1B25CCD24()
{
  return MEMORY[0x1E0DF0800]();
}

uint64_t sub_1B25CCD30()
{
  return MEMORY[0x1E0DF0838]();
}

uint64_t sub_1B25CCD3C()
{
  return MEMORY[0x1E0DF0870]();
}

uint64_t sub_1B25CCD48()
{
  return MEMORY[0x1E0DF0878]();
}

uint64_t sub_1B25CCD54()
{
  return MEMORY[0x1E0DF08A8]();
}

uint64_t sub_1B25CCD60()
{
  return MEMORY[0x1E0DF08C0]();
}

uint64_t sub_1B25CCD6C()
{
  return MEMORY[0x1E0DF08C8]();
}

uint64_t sub_1B25CCD78()
{
  return MEMORY[0x1E0DF08E0]();
}

uint64_t sub_1B25CCD84()
{
  return MEMORY[0x1E0DF0918]();
}

uint64_t sub_1B25CCD90()
{
  return MEMORY[0x1E0DF0958]();
}

uint64_t sub_1B25CCD9C()
{
  return MEMORY[0x1E0DF0978]();
}

uint64_t sub_1B25CCDA8()
{
  return MEMORY[0x1E0DF09A8]();
}

uint64_t sub_1B25CCDB4()
{
  return MEMORY[0x1E0DF09D0]();
}

uint64_t sub_1B25CCDC0()
{
  return MEMORY[0x1E0DF0A68]();
}

uint64_t sub_1B25CCDCC()
{
  return MEMORY[0x1E0DF0A70]();
}

uint64_t sub_1B25CCDD8()
{
  return MEMORY[0x1E0DF0AD0]();
}

uint64_t sub_1B25CCDE4()
{
  return MEMORY[0x1E0DF0AD8]();
}

uint64_t sub_1B25CCDF0()
{
  return MEMORY[0x1E0CB1B48]();
}

uint64_t sub_1B25CCDFC()
{
  return MEMORY[0x1E0DEAFE8]();
}

uint64_t sub_1B25CCE08()
{
  return MEMORY[0x1E0DEB030]();
}

uint64_t sub_1B25CCE14()
{
  return MEMORY[0x1E0CB1B88]();
}

uint64_t sub_1B25CCE20()
{
  return MEMORY[0x1E0DEB160]();
}

uint64_t sub_1B25CCE2C()
{
  return MEMORY[0x1E0CB1BB0]();
}

uint64_t sub_1B25CCE38()
{
  return MEMORY[0x1E0CB1BD8]();
}

uint64_t sub_1B25CCE44()
{
  return MEMORY[0x1E0DEB220]();
}

uint64_t sub_1B25CCE50()
{
  return MEMORY[0x1E0DEB258]();
}

uint64_t sub_1B25CCE5C()
{
  return MEMORY[0x1E0DEB2A8]();
}

uint64_t sub_1B25CCE68()
{
  return MEMORY[0x1E0DEB2E8]();
}

uint64_t sub_1B25CCE74()
{
  return MEMORY[0x1E0DEB310]();
}

uint64_t sub_1B25CCE80()
{
  return MEMORY[0x1E0DEB388]();
}

uint64_t sub_1B25CCE8C()
{
  return MEMORY[0x1E0DEB528]();
}

uint64_t sub_1B25CCE98()
{
  return MEMORY[0x1E0DEB560]();
}

uint64_t sub_1B25CCEA4()
{
  return MEMORY[0x1E0DEB570]();
}

uint64_t sub_1B25CCEB0()
{
  return MEMORY[0x1E0DEB578]();
}

uint64_t sub_1B25CCEBC()
{
  return MEMORY[0x1E0DEB580]();
}

uint64_t sub_1B25CCEC8()
{
  return MEMORY[0x1E0DEB5A0]();
}

uint64_t sub_1B25CCED4()
{
  return MEMORY[0x1E0DEB5A8]();
}

uint64_t sub_1B25CCEE0()
{
  return MEMORY[0x1E0DEB5B0]();
}

uint64_t sub_1B25CCEEC()
{
  return MEMORY[0x1E0DEB5E8]();
}

uint64_t sub_1B25CCEF8()
{
  return MEMORY[0x1E0DEB5F0]();
}

uint64_t sub_1B25CCF04()
{
  return MEMORY[0x1E0DEB5F8]();
}

uint64_t sub_1B25CCF10()
{
  return MEMORY[0x1E0DEB600]();
}

uint64_t sub_1B25CCF1C()
{
  return MEMORY[0x1E0DEB608]();
}

uint64_t sub_1B25CCF28()
{
  return MEMORY[0x1E0DEB660]();
}

uint64_t sub_1B25CCF34()
{
  return MEMORY[0x1E0DEB6A0]();
}

uint64_t sub_1B25CCF40()
{
  return MEMORY[0x1E0DEB6C0]();
}

uint64_t sub_1B25CCF4C()
{
  return MEMORY[0x1E0DEB6C8]();
}

uint64_t sub_1B25CCF58()
{
  return MEMORY[0x1E0DEB6D0]();
}

uint64_t sub_1B25CCF64()
{
  return MEMORY[0x1E0DEF170]();
}

uint64_t sub_1B25CCF70()
{
  return MEMORY[0x1E0DEF180]();
}

uint64_t sub_1B25CCF7C()
{
  return MEMORY[0x1E0DEF190]();
}

uint64_t sub_1B25CCF88()
{
  return MEMORY[0x1E0DEF198]();
}

uint64_t sub_1B25CCF94()
{
  return MEMORY[0x1E0DEF1A0]();
}

uint64_t sub_1B25CCFA0()
{
  return MEMORY[0x1E0DEF1B0]();
}

uint64_t sub_1B25CCFAC()
{
  return MEMORY[0x1E0CB1CF8]();
}

uint64_t sub_1B25CCFB8()
{
  return MEMORY[0x1E0D990E8]();
}

uint64_t sub_1B25CCFC4()
{
  return MEMORY[0x1E0DF2270]();
}

uint64_t sub_1B25CCFD0()
{
  return MEMORY[0x1E0DF2278]();
}

uint64_t sub_1B25CCFDC()
{
  return MEMORY[0x1E0DF2280]();
}

uint64_t sub_1B25CCFE8()
{
  return MEMORY[0x1E0DF2288]();
}

uint64_t sub_1B25CCFF4()
{
  return MEMORY[0x1E0DF2290]();
}

uint64_t sub_1B25CD000()
{
  return MEMORY[0x1E0CB1E68]();
}

uint64_t sub_1B25CD00C()
{
  return MEMORY[0x1E0DF2298]();
}

uint64_t sub_1B25CD018()
{
  return MEMORY[0x1E0DF22A0]();
}

uint64_t sub_1B25CD024()
{
  return MEMORY[0x1E0DF22A8]();
}

uint64_t sub_1B25CD030()
{
  return MEMORY[0x1E0DEF2E0]();
}

uint64_t sub_1B25CD03C()
{
  return MEMORY[0x1E0DEF2E8]();
}

uint64_t sub_1B25CD048()
{
  return MEMORY[0x1E0DEF2F0]();
}

uint64_t sub_1B25CD054()
{
  return MEMORY[0x1E0DEF2F8]();
}

uint64_t sub_1B25CD060()
{
  return MEMORY[0x1E0DEF300]();
}

uint64_t sub_1B25CD06C()
{
  return MEMORY[0x1E0DEF308]();
}

uint64_t sub_1B25CD078()
{
  return MEMORY[0x1E0DEF318]();
}

uint64_t sub_1B25CD084()
{
  return MEMORY[0x1E0DEF320]();
}

uint64_t sub_1B25CD090()
{
  return MEMORY[0x1E0DEF328]();
}

uint64_t sub_1B25CD09C()
{
  return MEMORY[0x1E0DEF330]();
}

uint64_t sub_1B25CD0A8()
{
  return MEMORY[0x1E0DEF338]();
}

uint64_t sub_1B25CD0B4()
{
  return MEMORY[0x1E0DEF340]();
}

uint64_t sub_1B25CD0C0()
{
  return MEMORY[0x1E0CB20E0]();
}

uint64_t sub_1B25CD0CC()
{
  return MEMORY[0x1E0DEFCD8]();
}

uint64_t sub_1B25CD0D8()
{
  return MEMORY[0x1E0DEFCE0]();
}

uint64_t sub_1B25CD0E4()
{
  return MEMORY[0x1E0DEFCE8]();
}

uint64_t sub_1B25CD0F0()
{
  return MEMORY[0x1E0DEFCF0]();
}

uint64_t sub_1B25CD0FC()
{
  return MEMORY[0x1E0DF22B0]();
}

uint64_t sub_1B25CD108()
{
  return MEMORY[0x1E0DEB940]();
}

uint64_t sub_1B25CD114()
{
  return MEMORY[0x1E0DEBB68]();
}

uint64_t sub_1B25CD120()
{
  return MEMORY[0x1E0CB23E0]();
}

uint64_t sub_1B25CD12C()
{
  return MEMORY[0x1E0DEBC20]();
}

uint64_t sub_1B25CD138()
{
  return MEMORY[0x1E0DEBC90]();
}

uint64_t sub_1B25CD144()
{
  return MEMORY[0x1E0CB2410]();
}

uint64_t sub_1B25CD150()
{
  return MEMORY[0x1E0CB2460]();
}

uint64_t sub_1B25CD15C()
{
  return MEMORY[0x1E0CB24A8]();
}

uint64_t sub_1B25CD168()
{
  return MEMORY[0x1E0CB2540]();
}

uint64_t sub_1B25CD174()
{
  return MEMORY[0x1E0CB25A8]();
}

uint64_t sub_1B25CD180()
{
  return MEMORY[0x1E0DEBE50]();
}

uint64_t sub_1B25CD18C()
{
  return MEMORY[0x1E0DEBE58]();
}

uint64_t sub_1B25CD198()
{
  return MEMORY[0x1E0DEBFE8]();
}

uint64_t sub_1B25CD1A4()
{
  return MEMORY[0x1E0DEC058]();
}

uint64_t sub_1B25CD1B0()
{
  return MEMORY[0x1E0DEC068]();
}

uint64_t sub_1B25CD1BC()
{
  return MEMORY[0x1E0DEC070]();
}

uint64_t sub_1B25CD1C8()
{
  return MEMORY[0x1E0DEC078]();
}

uint64_t sub_1B25CD1D4()
{
  return MEMORY[0x1E0DEC0A8]();
}

uint64_t sub_1B25CD1E0()
{
  return MEMORY[0x1E0DEC0B0]();
}

uint64_t sub_1B25CD1EC()
{
  return MEMORY[0x1E0DEC0B8]();
}

uint64_t sub_1B25CD1F8()
{
  return MEMORY[0x1E0DEC0D0]();
}

uint64_t sub_1B25CD204()
{
  return MEMORY[0x1E0DEC0D8]();
}

uint64_t sub_1B25CD210()
{
  return MEMORY[0x1E0DEC0E0]();
}

uint64_t sub_1B25CD21C()
{
  return MEMORY[0x1E0DEC0F8]();
}

uint64_t sub_1B25CD228()
{
  return MEMORY[0x1E0DEC100]();
}

uint64_t sub_1B25CD234()
{
  return MEMORY[0x1E0DEC110]();
}

uint64_t sub_1B25CD240()
{
  return MEMORY[0x1E0DEC118]();
}

uint64_t sub_1B25CD24C()
{
  return MEMORY[0x1E0DEC128]();
}

uint64_t sub_1B25CD258()
{
  return MEMORY[0x1E0DEC168]();
}

uint64_t sub_1B25CD264()
{
  return MEMORY[0x1E0DEC178]();
}

uint64_t sub_1B25CD270()
{
  return MEMORY[0x1E0DEC180]();
}

uint64_t sub_1B25CD27C()
{
  return MEMORY[0x1E0DEC188]();
}

uint64_t sub_1B25CD288()
{
  return MEMORY[0x1E0DEC1B0]();
}

uint64_t sub_1B25CD294()
{
  return MEMORY[0x1E0DEC248]();
}

uint64_t sub_1B25CD2A0()
{
  return MEMORY[0x1E0DEC250]();
}

uint64_t sub_1B25CD2AC()
{
  return MEMORY[0x1E0DEC258]();
}

uint64_t sub_1B25CD2B8()
{
  return MEMORY[0x1E0DEC260]();
}

uint64_t sub_1B25CD2C4()
{
  return MEMORY[0x1E0DEC268]();
}

uint64_t sub_1B25CD2D0()
{
  return MEMORY[0x1E0DEC280]();
}

uint64_t sub_1B25CD2DC()
{
  return MEMORY[0x1E0DEC2A8]();
}

uint64_t sub_1B25CD2E8()
{
  return MEMORY[0x1E0DEC2B0]();
}

uint64_t sub_1B25CD2F4()
{
  return MEMORY[0x1E0DEC2F0]();
}

uint64_t sub_1B25CD300()
{
  return MEMORY[0x1E0DEC338]();
}

uint64_t sub_1B25CD30C()
{
  return MEMORY[0x1E0DEC3D8]();
}

uint64_t sub_1B25CD318()
{
  return MEMORY[0x1E0DEC3E0]();
}

uint64_t sub_1B25CD324()
{
  return MEMORY[0x1E0DEC3E8]();
}

uint64_t sub_1B25CD330()
{
  return MEMORY[0x1E0DEC470]();
}

uint64_t sub_1B25CD33C()
{
  return MEMORY[0x1E0DEC498]();
}

uint64_t sub_1B25CD348()
{
  return MEMORY[0x1E0DEC508]();
}

uint64_t sub_1B25CD354()
{
  return MEMORY[0x1E0DEC530]();
}

uint64_t sub_1B25CD360()
{
  return MEMORY[0x1E0DEC588]();
}

uint64_t sub_1B25CD36C()
{
  return MEMORY[0x1E0DEC660]();
}

uint64_t sub_1B25CD378()
{
  return MEMORY[0x1E0DEC670]();
}

uint64_t sub_1B25CD384()
{
  return MEMORY[0x1E0DEC688]();
}

uint64_t sub_1B25CD390()
{
  return MEMORY[0x1E0DEC6C0]();
}

uint64_t sub_1B25CD39C()
{
  return MEMORY[0x1E0DEC6C8]();
}

uint64_t sub_1B25CD3A8()
{
  return MEMORY[0x1E0DF0B20]();
}

uint64_t sub_1B25CD3B4()
{
  return MEMORY[0x1E0DF0B50]();
}

uint64_t sub_1B25CD3C0()
{
  return MEMORY[0x1E0DF0B60]();
}

uint64_t sub_1B25CD3CC()
{
  return MEMORY[0x1E0DF0B98]();
}

uint64_t sub_1B25CD3D8()
{
  return MEMORY[0x1E0DF0BA0]();
}

uint64_t sub_1B25CD3E4()
{
  return MEMORY[0x1E0DEC8E0]();
}

uint64_t sub_1B25CD3F0()
{
  return MEMORY[0x1E0DF0C68]();
}

uint64_t sub_1B25CD3FC()
{
  return MEMORY[0x1E0DEC8F8]();
}

uint64_t sub_1B25CD408()
{
  return MEMORY[0x1E0DECAE0]();
}

uint64_t sub_1B25CD414()
{
  return MEMORY[0x1E0DECAF8]();
}

uint64_t sub_1B25CD420()
{
  return MEMORY[0x1E0DECB00]();
}

uint64_t sub_1B25CD42C()
{
  return MEMORY[0x1E0DECB40]();
}

uint64_t sub_1B25CD438()
{
  return MEMORY[0x1E0DECB80]();
}

uint64_t sub_1B25CD444()
{
  return MEMORY[0x1E0DECBB8]();
}

uint64_t sub_1B25CD450()
{
  return MEMORY[0x1E0DECBE0]();
}

uint64_t sub_1B25CD45C()
{
  return MEMORY[0x1E0DECBE8]();
}

uint64_t sub_1B25CD468()
{
  return MEMORY[0x1E0DECC00]();
}

uint64_t sub_1B25CD474()
{
  return MEMORY[0x1E0DECD18]();
}

uint64_t sub_1B25CD480()
{
  return MEMORY[0x1E0DECD38]();
}

uint64_t sub_1B25CD48C()
{
  return MEMORY[0x1E0DECD40]();
}

uint64_t sub_1B25CD498()
{
  return MEMORY[0x1E0DECD50]();
}

uint64_t sub_1B25CD4A4()
{
  return MEMORY[0x1E0DECD70]();
}

uint64_t sub_1B25CD4B0()
{
  return MEMORY[0x1E0DECDB8]();
}

uint64_t sub_1B25CD4BC()
{
  return MEMORY[0x1E0DECDD8]();
}

uint64_t sub_1B25CD4C8()
{
  return MEMORY[0x1E0DECE18]();
}

uint64_t sub_1B25CD4D4()
{
  return MEMORY[0x1E0DECF28]();
}

uint64_t sub_1B25CD4E0()
{
  return MEMORY[0x1E0DF0D38]();
}

uint64_t sub_1B25CD4EC()
{
  return MEMORY[0x1E0DECF40]();
}

uint64_t sub_1B25CD4F8()
{
  return MEMORY[0x1E0DECFC0]();
}

uint64_t sub_1B25CD504()
{
  return MEMORY[0x1E0DECFE0]();
}

uint64_t sub_1B25CD510()
{
  return MEMORY[0x1E0DECFF0]();
}

uint64_t sub_1B25CD51C()
{
  return MEMORY[0x1E0DED038]();
}

uint64_t sub_1B25CD528()
{
  return MEMORY[0x1E0DED0F0]();
}

uint64_t sub_1B25CD534()
{
  return MEMORY[0x1E0DED110]();
}

uint64_t sub_1B25CD540()
{
  return MEMORY[0x1E0DED120]();
}

uint64_t sub_1B25CD54C()
{
  return MEMORY[0x1E0DED1A0]();
}

uint64_t sub_1B25CD558()
{
  return MEMORY[0x1E0DED1B0]();
}

uint64_t sub_1B25CD564()
{
  return MEMORY[0x1E0DF0DB0]();
}

uint64_t sub_1B25CD570()
{
  return MEMORY[0x1E0DED1D0]();
}

uint64_t sub_1B25CD57C()
{
  return MEMORY[0x1E0DED1E0]();
}

uint64_t sub_1B25CD588()
{
  return MEMORY[0x1E0DF0DD0]();
}

uint64_t sub_1B25CD594()
{
  return MEMORY[0x1E0DF0DE0]();
}

uint64_t sub_1B25CD5A0()
{
  return MEMORY[0x1E0DED4A0]();
}

uint64_t sub_1B25CD5AC()
{
  return MEMORY[0x1E0DED548]();
}

uint64_t sub_1B25CD5B8()
{
  return MEMORY[0x1E0DED568]();
}

uint64_t sub_1B25CD5C4()
{
  return MEMORY[0x1E0DED5F0]();
}

uint64_t sub_1B25CD5D0()
{
  return MEMORY[0x1E0DED600]();
}

uint64_t sub_1B25CD5DC()
{
  return MEMORY[0x1E0DF0E78]();
}

uint64_t sub_1B25CD5E8()
{
  return MEMORY[0x1E0DED770]();
}

uint64_t sub_1B25CD5F4()
{
  return MEMORY[0x1E0DF0EC0]();
}

uint64_t sub_1B25CD600()
{
  return MEMORY[0x1E0DF0ED0]();
}

uint64_t sub_1B25CD60C()
{
  return MEMORY[0x1E0DED9F8]();
}

uint64_t sub_1B25CD618()
{
  return MEMORY[0x1E0DEDA08]();
}

uint64_t sub_1B25CD624()
{
  return MEMORY[0x1E0DEDAE0]();
}

uint64_t sub_1B25CD630()
{
  return MEMORY[0x1E0DEDAE8]();
}

uint64_t sub_1B25CD63C()
{
  return MEMORY[0x1E0CB2628]();
}

uint64_t sub_1B25CD648()
{
  return MEMORY[0x1E0CB2640]();
}

uint64_t sub_1B25CD654()
{
  return MEMORY[0x1E0CB2650]();
}

uint64_t sub_1B25CD660()
{
  return MEMORY[0x1E0DEDB10]();
}

uint64_t sub_1B25CD66C()
{
  return MEMORY[0x1E0DEDB18]();
}

uint64_t sub_1B25CD678()
{
  return MEMORY[0x1E0DEDB20]();
}

uint64_t sub_1B25CD684()
{
  return MEMORY[0x1E0DEDB28]();
}

uint64_t sub_1B25CD690()
{
  return MEMORY[0x1E0DEDED8]();
}

uint64_t sub_1B25CD69C()
{
  return MEMORY[0x1E0DEDEF0]();
}

uint64_t sub_1B25CD6A8()
{
  return MEMORY[0x1E0DEDEF8]();
}

uint64_t sub_1B25CD6B4()
{
  return MEMORY[0x1E0DEDF10]();
}

uint64_t sub_1B25CD6C0()
{
  return MEMORY[0x1E0DEDF18]();
}

uint64_t sub_1B25CD6CC()
{
  return MEMORY[0x1E0DEDF40]();
}

uint64_t sub_1B25CD6D8()
{
  return MEMORY[0x1E0DEE030]();
}

uint64_t sub_1B25CD6E4()
{
  return MEMORY[0x1E0CB2708]();
}

uint64_t sub_1B25CD6F0()
{
  return MEMORY[0x1E0CB2710]();
}

uint64_t sub_1B25CD6FC()
{
  return MEMORY[0x1E0DEE240]();
}

uint64_t sub_1B25CD708()
{
  return MEMORY[0x1E0DEE270]();
}

uint64_t sub_1B25CD714()
{
  return MEMORY[0x1E0DEE768]();
}

uint64_t sub_1B25CD720()
{
  return MEMORY[0x1E0DEE8E0]();
}

uint64_t sub_1B25CD72C()
{
  return MEMORY[0x1E0DEE8E8]();
}

uint64_t sub_1B25CD738()
{
  return MEMORY[0x1E0DEE978]();
}

uint64_t AFDictationLanguageForKeyboardLanguage()
{
  return MEMORY[0x1E0CFE480]();
}

uint64_t AFOfflineDictationCapable()
{
  return MEMORY[0x1E0CFE580]();
}

uint64_t AFPreferencesSupportedDictationLanguages()
{
  return MEMORY[0x1E0CFE5E8]();
}

uint64_t AnalyticsSendEventLazy()
{
  return MEMORY[0x1E0D15428]();
}

CFHTTPMessageRef CFHTTPMessageCreateResponse(CFAllocatorRef alloc, CFIndex statusCode, CFStringRef statusDescription, CFStringRef httpVersion)
{
  return (CFHTTPMessageRef)MEMORY[0x1E0C92840](alloc, statusCode, statusDescription, httpVersion);
}

void CFHTTPMessageSetHeaderFieldValue(CFHTTPMessageRef message, CFStringRef headerField, CFStringRef value)
{
  MEMORY[0x1E0C92868](message, headerField, value);
}

Boolean CFPreferencesAppValueIsForced(CFStringRef key, CFStringRef applicationID)
{
  return MEMORY[0x1E0C98A38](key, applicationID);
}

Boolean CFPreferencesGetAppBooleanValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return MEMORY[0x1E0C98A70](key, applicationID, keyExistsAndHasValidFormat);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x1E0C98BC0](cf);
}

CFStringTokenizerTokenType CFStringTokenizerAdvanceToNextToken(CFStringTokenizerRef tokenizer)
{
  return MEMORY[0x1E0C99208](tokenizer);
}

CFStringTokenizerRef CFStringTokenizerCreate(CFAllocatorRef alloc, CFStringRef string, CFRange range, CFOptionFlags options, CFLocaleRef locale)
{
  return (CFStringTokenizerRef)MEMORY[0x1E0C99220](alloc, string, range.location, range.length, options, locale);
}

CFRange CFStringTokenizerGetCurrentTokenRange(CFStringTokenizerRef tokenizer)
{
  CFIndex v1;
  CFIndex v2;
  CFRange result;

  v1 = MEMORY[0x1E0C99230](tokenizer);
  result.length = v2;
  result.location = v1;
  return result;
}

uint64_t CFURLResponseCreateWithHTTPResponse()
{
  return MEMORY[0x1E0C92A58]();
}

const AudioStreamBasicDescription *__cdecl CMAudioFormatDescriptionGetStreamBasicDescription(CMAudioFormatDescriptionRef desc)
{
  return (const AudioStreamBasicDescription *)MEMORY[0x1E0C9EAD8](desc);
}

OSStatus CMBlockBufferCopyDataBytes(CMBlockBufferRef theSourceBuffer, size_t offsetToData, size_t dataLength, void *destination)
{
  return MEMORY[0x1E0C9EB68](theSourceBuffer, offsetToData, dataLength, destination);
}

size_t CMBlockBufferGetDataLength(CMBlockBufferRef theBuffer)
{
  return MEMORY[0x1E0C9EB98](theBuffer);
}

OSStatus CMBlockBufferGetDataPointer(CMBlockBufferRef theBuffer, size_t offset, size_t *lengthAtOffsetOut, size_t *totalLengthOut, char **dataPointerOut)
{
  return MEMORY[0x1E0C9EBA8](theBuffer, offset, lengthAtOffsetOut, totalLengthOut, dataPointerOut);
}

OSStatus CMSampleBufferCopyPCMDataIntoAudioBufferList(CMSampleBufferRef sbuf, int32_t frameOffset, int32_t numFrames, AudioBufferList *bufferList)
{
  return MEMORY[0x1E0C9EF30](sbuf, *(_QWORD *)&frameOffset, *(_QWORD *)&numFrames, bufferList);
}

CMBlockBufferRef CMSampleBufferGetDataBuffer(CMSampleBufferRef sbuf)
{
  return (CMBlockBufferRef)MEMORY[0x1E0C9EFB0](sbuf);
}

CMFormatDescriptionRef CMSampleBufferGetFormatDescription(CMSampleBufferRef sbuf)
{
  return (CMFormatDescriptionRef)MEMORY[0x1E0C9EFD0](sbuf);
}

CMItemCount CMSampleBufferGetNumSamples(CMSampleBufferRef sbuf)
{
  return MEMORY[0x1E0C9EFE0](sbuf);
}

CFStringRef CMTimeCopyDescription(CFAllocatorRef allocator, CMTime *time)
{
  return (CFStringRef)MEMORY[0x1E0C9F2F8](allocator, time);
}

Float64 CMTimeGetSeconds(CMTime *time)
{
  Float64 result;

  MEMORY[0x1E0C9F310](time);
  return result;
}

CMTime *__cdecl CMTimeMakeWithSeconds(CMTime *__return_ptr retstr, Float64 seconds, int32_t preferredTimescale)
{
  return (CMTime *)MEMORY[0x1E0C9F330](retstr, *(_QWORD *)&preferredTimescale, seconds);
}

Boolean CMTimeRangeContainsTime(CMTimeRange *range, CMTime *time)
{
  return MEMORY[0x1E0C9F3A0](range, time);
}

CFStringRef CMTimeRangeCopyDescription(CFAllocatorRef allocator, CMTimeRange *range)
{
  return (CFStringRef)MEMORY[0x1E0C9F3B8](allocator, range);
}

CMTime *__cdecl CMTimeSubtract(CMTime *__return_ptr retstr, CMTime *lhs, CMTime *rhs)
{
  return (CMTime *)MEMORY[0x1E0C9F400](retstr, lhs, rhs);
}

uint64_t CPSharedResourcesDirectory()
{
  return MEMORY[0x1E0CFA6C0]();
}

uint64_t MGGetBoolAnswer()
{
  return MEMORY[0x1E0DE2B50]();
}

uint64_t MobileGestalt_copy_buildVersion_obj()
{
  return MEMORY[0x1E0DE2BB0]();
}

uint64_t MobileGestalt_get_current_device()
{
  return MEMORY[0x1E0DE2C00]();
}

uint64_t MobileGestalt_get_deviceClassNumber()
{
  return MEMORY[0x1E0DE2C08]();
}

void NSLog(NSString *format, ...)
{
  MEMORY[0x1E0CB2D88](format);
}

NSArray *__cdecl NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory directory, NSSearchPathDomainMask domainMask, BOOL expandTilde)
{
  return (NSArray *)MEMORY[0x1E0CB3178](directory, domainMask, expandTilde);
}

NSString *__cdecl NSStringFromRange(NSRange range)
{
  return (NSString *)MEMORY[0x1E0CB3220](range.location, range.length);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x1E0CB3230](aSelector);
}

NSString *NSTemporaryDirectory(void)
{
  return (NSString *)MEMORY[0x1E0CB3250]();
}

uint64_t PLLogRegisteredEvent()
{
  return MEMORY[0x1E0D7FE28]();
}

uint64_t TCCAccessPreflight()
{
  return MEMORY[0x1E0DB0FF0]();
}

uint64_t TCCAccessRequest()
{
  return MEMORY[0x1E0DB1018]();
}

uint64_t TCCAccessRestricted()
{
  return MEMORY[0x1E0DB1048]();
}

uint64_t _AFPreferencesLanguageCode()
{
  return MEMORY[0x1E0CFEB08]();
}

uint64_t _AFPreferencesReplacementLanguageForLocalRecognizerLanguageCode()
{
  return MEMORY[0x1E0CFEB18]();
}

uint64_t _AFPreferencesValueForKeyWithContext()
{
  return MEMORY[0x1E0CFEB30]();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x1E0C80928](aBlock);
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x1E0C80948](a1, *(_QWORD *)&a2);
}

void _Block_release(const void *aBlock)
{
  MEMORY[0x1E0C80958](aBlock);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x1E0C80A20](exception_object);
}

int *__error(void)
{
  return (int *)MEMORY[0x1E0C80AC0]();
}

uint64_t __memcpy_chk()
{
  return MEMORY[0x1E0C80B68]();
}

uint64_t _availability_version_check()
{
  return MEMORY[0x1E0C80CC0]();
}

uint64_t _os_feature_enabled_impl()
{
  return MEMORY[0x1E0C81010]();
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81020](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81038](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81040](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81048](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_signpost_emit_with_name_impl(void *dso, os_log_t log, os_signpost_type_t type, os_signpost_id_t spid, const char *name, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C810D0](dso, log, type, spid, name, format, buf, *(_QWORD *)&size);
}

uint64_t _sl_dlopen()
{
  return MEMORY[0x1E0DA88F0]();
}

uint64_t _swift_stdlib_bridgeErrorToNSError()
{
  return MEMORY[0x1E0DEEA28]();
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x1E0DEEA40]();
}

uint64_t _swift_stdlib_strtod_clocale()
{
  return MEMORY[0x1E0DEEA50]();
}

uint64_t _swift_stdlib_strtof_clocale()
{
  return MEMORY[0x1E0DEEA58]();
}

int atoi(const char *a1)
{
  return MEMORY[0x1E0C81668](a1);
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x1E0C81758](a1, a2);
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
  MEMORY[0x1E0C82BE8](queue);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82C00](queue, block);
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x1E0C82D00](identifier, flags);
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

void dispatch_group_notify(dispatch_group_t group, dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82D38](group, queue, block);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x1E0C82E08](predicate, block);
}

void dispatch_once_f(dispatch_once_t *predicate, void *context, dispatch_function_t function)
{
  MEMORY[0x1E0C82E10](predicate, context, function);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x1E0C82E48](label, attr);
}

void dispatch_resume(dispatch_object_t object)
{
  MEMORY[0x1E0C82EA0](object);
}

void dispatch_source_cancel(dispatch_source_t source)
{
  MEMORY[0x1E0C82F10](source);
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return (dispatch_source_t)MEMORY[0x1E0C82F20](type, handle, mask, queue);
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
  MEMORY[0x1E0C82F58](source, handler);
}

void dispatch_source_set_timer(dispatch_source_t source, dispatch_time_t start, uint64_t interval, uint64_t leeway)
{
  MEMORY[0x1E0C82F78](source, start, interval, leeway);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82F90](queue, block);
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x1E0C82FB8](when, delta);
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x1E0C83050](__handle, __symbol);
}

int fclose(FILE *a1)
{
  return MEMORY[0x1E0C832F8](a1);
}

FILE *__cdecl fopen(const char *__filename, const char *__mode)
{
  return (FILE *)MEMORY[0x1E0C83460](__filename, __mode);
}

size_t fread(void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return MEMORY[0x1E0C834A0](__ptr, __size, __nitems, __stream);
}

void free(void *a1)
{
  MEMORY[0x1E0C834A8](a1);
}

int fseek(FILE *a1, uint64_t a2, int a3)
{
  return MEMORY[0x1E0C83530](a1, a2, *(_QWORD *)&a3);
}

uint64_t ftell(FILE *a1)
{
  return MEMORY[0x1E0C83580](a1);
}

uint64_t mach_continuous_time(void)
{
  return MEMORY[0x1E0C83C70]();
}

uint64_t mach_get_times()
{
  return MEMORY[0x1E0C83C88]();
}

kern_return_t mach_timebase_info(mach_timebase_info_t info)
{
  return MEMORY[0x1E0C83DB8](info);
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

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x1E0DE7BD0](a1);
}

void objc_autoreleasePoolPop(void *context)
{
  MEMORY[0x1E0DE7BD8](context);
}

void *objc_autoreleasePoolPush(void)
{
  return (void *)MEMORY[0x1E0DE7BE0]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7BE8](a1);
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

void objc_enumerationMutation(id obj)
{
  MEMORY[0x1E0DE7C90](obj);
}

id objc_getAssociatedObject(id object, const void *key)
{
  return (id)MEMORY[0x1E0DE7CA8](object, key);
}

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x1E0DE7CB0](name);
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

uint64_t objc_opt_new()
{
  return MEMORY[0x1E0DE7D48]();
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

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x1E0DE7E70](a1);
}

void objc_setAssociatedObject(id object, const void *key, id value, void *policy)
{
  MEMORY[0x1E0DE7F40](object, key, value, policy);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x1E0DE7FA0](self, _cmd, newValue, offset);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x1E0DE7FB0](location, obj);
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x1E0DE7FB8](location, obj);
}

int objc_sync_enter(id obj)
{
  return MEMORY[0x1E0DE7FC8](obj);
}

int objc_sync_exit(id obj)
{
  return MEMORY[0x1E0DE7FD0](obj);
}

Class object_getClass(id a1)
{
  return (Class)MEMORY[0x1E0DE7FF8](a1);
}

int open_dprotected_np(const char *a1, int a2, int a3, int a4, ...)
{
  return MEMORY[0x1E0C84488](a1, *(_QWORD *)&a2, *(_QWORD *)&a3, *(_QWORD *)&a4);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x1E0C84728](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1E0C84780](oslog, type);
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
  MEMORY[0x1E0C84998](lock);
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
  MEMORY[0x1E0C849B0](lock);
}

void rewind(FILE *a1)
{
  MEMORY[0x1E0C85120](a1);
}

uint64_t sandbox_extension_issue_file()
{
  return MEMORY[0x1E0C851A8]();
}

int sscanf(const char *a1, const char *a2, ...)
{
  return MEMORY[0x1E0C85498](a1, a2);
}

char *__cdecl strerror(int __errnum)
{
  return (char *)MEMORY[0x1E0C85548](*(_QWORD *)&__errnum);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x1E0C85578](__s);
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

uint64_t swift_conformsToProtocol()
{
  return MEMORY[0x1E0DEEB38]();
}

uint64_t swift_conformsToProtocol2()
{
  return MEMORY[0x1E0DEEB40]();
}

uint64_t swift_continuation_await()
{
  return MEMORY[0x1E0DF0F88]();
}

uint64_t swift_continuation_init()
{
  return MEMORY[0x1E0DF0F90]();
}

uint64_t swift_continuation_resume()
{
  return MEMORY[0x1E0DF0F98]();
}

uint64_t swift_continuation_throwingResume()
{
  return MEMORY[0x1E0DF0FA0]();
}

uint64_t swift_continuation_throwingResumeWithError()
{
  return MEMORY[0x1E0DF0FA8]();
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

uint64_t swift_defaultActor_deallocate()
{
  return MEMORY[0x1E0DF0FB0]();
}

uint64_t swift_defaultActor_destroy()
{
  return MEMORY[0x1E0DF0FB8]();
}

uint64_t swift_defaultActor_initialize()
{
  return MEMORY[0x1E0DF0FC0]();
}

uint64_t swift_distributedActor_remote_initialize()
{
  return MEMORY[0x1E0DF0FC8]();
}

uint64_t swift_distributed_actor_is_remote()
{
  return MEMORY[0x1E0DF0FD0]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x1E0DEEB80]();
}

uint64_t swift_dynamicCastClass()
{
  return MEMORY[0x1E0DEEB88]();
}

uint64_t swift_dynamicCastObjCClass()
{
  return MEMORY[0x1E0DEEBA8]();
}

uint64_t swift_dynamicCastObjCProtocolConditional()
{
  return MEMORY[0x1E0DEEBB8]();
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

uint64_t swift_getFunctionTypeMetadata()
{
  return MEMORY[0x1E0DEEC88]();
}

uint64_t swift_getGenericMetadata()
{
  return MEMORY[0x1E0DEECB0]();
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

uint64_t swift_getOpaqueTypeConformance2()
{
  return MEMORY[0x1E0DEECE8]();
}

uint64_t swift_getSingletonMetadata()
{
  return MEMORY[0x1E0DEECF8]();
}

uint64_t swift_getTupleTypeLayout2()
{
  return MEMORY[0x1E0DEED08]();
}

uint64_t swift_getTupleTypeLayout3()
{
  return MEMORY[0x1E0DEED10]();
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

uint64_t swift_initClassMetadata2()
{
  return MEMORY[0x1E0DEED58]();
}

uint64_t swift_initEnumMetadataMultiPayload()
{
  return MEMORY[0x1E0DEED60]();
}

uint64_t swift_initEnumMetadataSingleCase()
{
  return MEMORY[0x1E0DEED68]();
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

uint64_t swift_isUniquelyReferenced_nonNull_bridgeObject()
{
  return MEMORY[0x1E0DEEDC8]();
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

uint64_t swift_stdlib_isStackAllocationSafe()
{
  return MEMORY[0x1E0DEEE88]();
}

uint64_t swift_storeEnumTagMultiPayload()
{
  return MEMORY[0x1E0DEEE98]();
}

uint64_t swift_storeEnumTagSinglePayloadGeneric()
{
  return MEMORY[0x1E0DEEEA0]();
}

uint64_t swift_taskGroup_wait_next_throwing()
{
  return MEMORY[0x1E0DF0FF0]();
}

uint64_t swift_task_alloc()
{
  return MEMORY[0x1E0DF1000]();
}

uint64_t swift_task_create()
{
  return MEMORY[0x1E0DF1008]();
}

uint64_t swift_task_dealloc()
{
  return MEMORY[0x1E0DF1010]();
}

uint64_t swift_task_isCancelled()
{
  return MEMORY[0x1E0DF1020]();
}

uint64_t swift_task_switch()
{
  return MEMORY[0x1E0DF1050]();
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

uint64_t swift_unknownObjectRetain_n()
{
  return MEMORY[0x1E0DEEED8]();
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

