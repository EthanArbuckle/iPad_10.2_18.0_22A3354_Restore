uint64_t sub_23DE6C238()
{
  return swift_getOpaqueTypeConformance2();
}

ValueMetadata *type metadata accessor for MenstrualCyclesWidget()
{
  return &type metadata for MenstrualCyclesWidget;
}

unint64_t sub_23DE6C260()
{
  unint64_t result;

  result = qword_25432B988;
  if (!qword_25432B988)
  {
    result = MEMORY[0x2426473FC](&unk_23DE88784, &type metadata for MenstrualCyclesWidgetConfiguration);
    atomic_store(result, (unint64_t *)&qword_25432B988);
  }
  return result;
}

id sub_23DE6C2A4()
{
  uint64_t ObjCClassFromMetadata;
  id result;

  type metadata accessor for MenstrualCyclesWidgetTimelineGenerator();
  ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  result = objc_msgSend((id)objc_opt_self(), sel_bundleForClass_, ObjCClassFromMetadata);
  qword_25432BDC0 = (uint64_t)result;
  return result;
}

uint64_t MenstrualCyclesWidgetEntry.date.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;

  v3 = sub_23DE8745C();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 16))(a1, v1, v3);
}

uint64_t MenstrualCyclesWidgetEntry.dayIndex.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;

  v3 = v1 + *(int *)(type metadata accessor for MenstrualCyclesWidgetEntry(0) + 20);
  v4 = sub_23DE879CC();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a1, v3, v4);
}

uint64_t type metadata accessor for MenstrualCyclesWidgetEntry(uint64_t a1)
{
  return sub_23DE6C454(a1, (uint64_t *)&unk_25432B998);
}

uint64_t MenstrualCyclesWidgetEntry.dayIndex.setter(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;

  v3 = v1 + *(int *)(type metadata accessor for MenstrualCyclesWidgetEntry(0) + 20);
  v4 = sub_23DE879CC();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 40))(v3, a1, v4);
}

uint64_t (*MenstrualCyclesWidgetEntry.dayIndex.modify())()
{
  type metadata accessor for MenstrualCyclesWidgetEntry(0);
  return nullsub_1;
}

uint64_t MenstrualCyclesWidgetEntry.pregnancyState.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;

  v3 = type metadata accessor for MenstrualCyclesWidgetEntry(0);
  return sub_23DE6EED4(v1 + *(int *)(v3 + 24), a1, &qword_25432BB38, (void (*)(uint64_t))type metadata accessor for MenstrualCyclesWidgetEntry.State);
}

uint64_t type metadata accessor for MenstrualCyclesWidgetEntry.State(uint64_t a1)
{
  return sub_23DE6C454(a1, (uint64_t *)&unk_25432BB28);
}

uint64_t sub_23DE6C454(uint64_t a1, uint64_t *a2)
{
  uint64_t result;

  result = *a2;
  if (!*a2)
    return swift_getSingletonMetadata();
  return result;
}

void *MenstrualCyclesWidgetEntry.projection.getter()
{
  uint64_t v0;
  void *v1;
  id v2;

  v1 = *(void **)(v0 + *(int *)(type metadata accessor for MenstrualCyclesWidgetEntry(0) + 28));
  v2 = v1;
  return v1;
}

void MenstrualCyclesWidgetEntry.projection.setter(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;

  v3 = *(int *)(type metadata accessor for MenstrualCyclesWidgetEntry(0) + 28);

  *(_QWORD *)(v1 + v3) = a1;
}

uint64_t (*MenstrualCyclesWidgetEntry.projection.modify())()
{
  type metadata accessor for MenstrualCyclesWidgetEntry(0);
  return nullsub_1;
}

uint64_t MenstrualCyclesWidgetEntry.relevance.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;

  v3 = type metadata accessor for MenstrualCyclesWidgetEntry(0);
  return sub_23DE6EED4(v1 + *(int *)(v3 + 32), a1, &qword_25432B9D8, (void (*)(uint64_t))MEMORY[0x24BDFB270]);
}

void sub_23DE6C560(uint64_t a1, unint64_t *a2, void (*a3)(uint64_t))
{
  unint64_t v4;
  uint64_t v5;

  if (!*a2)
  {
    a3(255);
    v4 = sub_23DE87BC4();
    if (!v5)
      atomic_store(v4, a2);
  }
}

uint64_t MenstrualCyclesWidgetEntry.relevance.setter(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;

  v3 = v1 + *(int *)(type metadata accessor for MenstrualCyclesWidgetEntry(0) + 32);
  return sub_23DE6C5DC(a1, v3);
}

uint64_t sub_23DE6C5DC(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  sub_23DE6C560(0, &qword_25432B9D8, (void (*)(uint64_t))MEMORY[0x24BDFB270]);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t (*MenstrualCyclesWidgetEntry.relevance.modify())()
{
  type metadata accessor for MenstrualCyclesWidgetEntry(0);
  return nullsub_1;
}

uint64_t MenstrualCyclesWidgetEntry.lastMenstrualFlowDayIndex.getter()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + *(int *)(type metadata accessor for MenstrualCyclesWidgetEntry(0) + 36));
}

uint64_t MenstrualCyclesWidgetEntry.lastMenstrualFlowDayIndex.setter(uint64_t a1, char a2)
{
  uint64_t v2;
  uint64_t result;
  uint64_t v6;

  result = type metadata accessor for MenstrualCyclesWidgetEntry(0);
  v6 = v2 + *(int *)(result + 36);
  *(_QWORD *)v6 = a1;
  *(_BYTE *)(v6 + 8) = a2 & 1;
  return result;
}

uint64_t (*MenstrualCyclesWidgetEntry.lastMenstrualFlowDayIndex.modify())()
{
  type metadata accessor for MenstrualCyclesWidgetEntry(0);
  return nullsub_1;
}

BOOL MenstrualCyclesWidgetEntry.hasFlow.getter()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v3;

  v1 = (uint64_t *)(v0 + *(int *)(type metadata accessor for MenstrualCyclesWidgetEntry(0) + 36));
  if ((v1[1] & 1) != 0)
    return 0;
  v3 = *v1;
  return v3 == sub_23DE879C0();
}

uint64_t MenstrualCyclesWidgetEntry.init(date:dayIndex:pregnancyState:projection:relevance:lastMenstrualFlowDayIndex:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, char a7@<W6>, uint64_t a8@<X8>)
{
  int *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t result;

  v13 = (int *)type metadata accessor for MenstrualCyclesWidgetEntry(0);
  v14 = v13[7];
  v15 = a8 + v13[8];
  v16 = sub_23DE87A74();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v16 - 8) + 56))(v15, 1, 1, v16);
  v17 = a8 + v13[9];
  *(_QWORD *)v17 = 0;
  *(_BYTE *)(v17 + 8) = 1;
  v18 = sub_23DE8745C();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v18 - 8) + 32))(a8, a1, v18);
  v19 = a8 + v13[5];
  v20 = sub_23DE879CC();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v20 - 8) + 32))(v19, a2, v20);
  sub_23DE6C860(a3, a8 + v13[6]);
  *(_QWORD *)(a8 + v14) = a4;
  result = sub_23DE6C5DC(a5, v15);
  *(_QWORD *)v17 = a6;
  *(_BYTE *)(v17 + 8) = a7 & 1;
  return result;
}

uint64_t sub_23DE6C860(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  sub_23DE6C560(0, &qword_25432BB38, (void (*)(uint64_t))type metadata accessor for MenstrualCyclesWidgetEntry.State);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_23DE6C8B4@<X0>(void *a1@<X0>, double *a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  void (*v6)(char *, uint64_t);
  uint64_t v7;
  uint64_t v8;
  char *v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v18;
  id v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;

  sub_23DE6C560(0, &qword_25432B9E8, (void (*)(uint64_t))MEMORY[0x24BDCB878]);
  MEMORY[0x24BDAC7A8](v4);
  v6 = (void (*)(char *, uint64_t))((char *)&v23 - v5);
  sub_23DE6C560(0, &qword_25432B9F0, (void (*)(uint64_t))MEMORY[0x24BDCE900]);
  MEMORY[0x24BDAC7A8](v7);
  v9 = (char *)&v23 - v8;
  if (objc_msgSend(a1, sel_state) == (id)1
    && (v10 = objc_msgSend(a1, sel_sample)) != 0)
  {
    v11 = v10;
    v12 = v10;
    v13 = objc_msgSend(a1, sel_estimatedDueDate);
    if (v13)
    {
      v14 = v13;
      sub_23DE87444();

      v15 = sub_23DE8745C();
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v15 - 8) + 56))(v9, 0, 1, v15);
    }
    else
    {
      v18 = sub_23DE8745C();
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v18 - 8) + 56))(v9, 1, 1, v18);
    }
    v19 = objc_msgSend(a1, sel_pregnancyDuration);
    if (v19)
    {
      v20 = v19;
      sub_23DE87324();

      v21 = sub_23DE87348();
      (*(void (**)(void (*)(char *, uint64_t), _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v21 - 8)
                                                                                             + 56))(v6, 0, 1, v21);
    }
    else
    {
      v22 = sub_23DE87348();
      (*(void (**)(void (*)(char *, uint64_t), uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v22 - 8)
                                                                                              + 56))(v6, 1, 1, v22);
    }
    sub_23DE6CB18(v11, v9, v6, a2);

    sub_23DE6EE98((uint64_t)v6, &qword_25432B9E8, (void (*)(uint64_t))MEMORY[0x24BDCB878]);
    return sub_23DE6EE98((uint64_t)v9, &qword_25432B9F0, (void (*)(uint64_t))MEMORY[0x24BDCE900]);
  }
  else
  {

    sub_23DE6D5EC();
    return (*(uint64_t (**)(double *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v16 - 8) + 56))(a2, 1, 1, v16);
  }
}

uint64_t sub_23DE6CB18@<X0>(void *a1@<X0>, void *a2@<X1>, void (*a3)(char *, uint64_t)@<X2>, double *a4@<X8>)
{
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
  char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  char *v25;
  uint64_t v26;
  uint64_t v27;
  char *v28;
  uint64_t v29;
  uint64_t v30;
  char *v31;
  uint64_t v32;
  char *v33;
  void *v34;
  unint64_t *v35;
  void (*v36)(uint64_t);
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  id v42;
  double v43;
  double v44;
  double v45;
  double v46;
  void (*v47)(char *, char *, uint64_t);
  uint64_t v48;
  uint64_t v49;
  char *v50;
  id v51;
  char *v52;
  void (*v53)(char *, uint64_t);
  uint64_t v54;
  uint64_t v55;
  double *v56;
  char *v57;
  char *v58;
  char *v59;
  char *v60;
  uint64_t v61;
  uint64_t v62;
  char *v63;
  uint64_t v64;
  uint64_t v65;
  void (*v66)(char *, uint64_t);
  uint64_t v67;
  uint64_t v68;
  char *v69;
  id v70;
  double *v71;

  v66 = a3;
  v70 = a2;
  v71 = a4;
  v5 = sub_23DE874A4();
  v61 = *(_QWORD *)(v5 - 8);
  v62 = v5;
  MEMORY[0x24BDAC7A8](v5);
  v59 = (char *)&v58 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_23DE87534();
  MEMORY[0x24BDAC7A8](v7);
  v58 = (char *)&v58 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = sub_23DE879CC();
  MEMORY[0x24BDAC7A8](v9);
  v60 = (char *)&v58 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = sub_23DE8757C();
  v64 = *(_QWORD *)(v11 - 8);
  v65 = v11;
  MEMORY[0x24BDAC7A8](v11);
  v63 = (char *)&v58 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23DE6C560(0, &qword_25432B9E8, (void (*)(uint64_t))MEMORY[0x24BDCB878]);
  MEMORY[0x24BDAC7A8](v13);
  v15 = (char *)&v58 - v14;
  v16 = sub_23DE87348();
  v67 = *(_QWORD *)(v16 - 8);
  v68 = v16;
  MEMORY[0x24BDAC7A8](v16);
  v69 = (char *)&v58 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23DE6C560(0, &qword_25432B9F0, (void (*)(uint64_t))MEMORY[0x24BDCE900]);
  MEMORY[0x24BDAC7A8](v18);
  v20 = (char *)&v58 - v19;
  v21 = sub_23DE8745C();
  v22 = *(_QWORD *)(v21 - 8);
  v23 = MEMORY[0x24BDAC7A8](v21);
  v25 = (char *)&v58 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  v26 = MEMORY[0x24BDAC7A8](v23);
  v28 = (char *)&v58 - v27;
  v29 = MEMORY[0x24BDAC7A8](v26);
  v31 = (char *)&v58 - v30;
  MEMORY[0x24BDAC7A8](v29);
  v33 = (char *)&v58 - v32;
  if (!a1)
    goto LABEL_7;
  v34 = a1;
  sub_23DE6EED4((uint64_t)v70, (uint64_t)v20, &qword_25432B9F0, (void (*)(uint64_t))MEMORY[0x24BDCE900]);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v22 + 48))(v20, 1, v21) == 1)
  {
    v35 = &qword_25432B9F0;
    v36 = (void (*)(uint64_t))MEMORY[0x24BDCE900];
    v37 = (uint64_t)v20;
LABEL_6:
    sub_23DE6EE98(v37, v35, v36);
LABEL_7:
    sub_23DE6D5EC();
    return (*(uint64_t (**)(double *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v40 - 8) + 56))(v71, 1, 1, v40);
  }
  (*(void (**)(char *, char *, uint64_t))(v22 + 32))(v33, v20, v21);
  sub_23DE6EED4((uint64_t)v66, (uint64_t)v15, &qword_25432B9E8, (void (*)(uint64_t))MEMORY[0x24BDCB878]);
  v39 = v67;
  v38 = v68;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v67 + 48))(v15, 1, v68) == 1)
  {
    (*(void (**)(char *, uint64_t))(v22 + 8))(v33, v21);
    v35 = &qword_25432B9E8;
    v36 = (void (*)(uint64_t))MEMORY[0x24BDCB878];
    v37 = (uint64_t)v15;
    goto LABEL_6;
  }
  (*(void (**)(char *, char *, uint64_t))(v39 + 32))(v69, v15, v38);
  v70 = v34;
  v42 = objc_msgSend(v70, sel_startDate);
  sub_23DE87444();

  sub_23DE87420();
  v44 = v43;
  v66 = *(void (**)(char *, uint64_t))(v22 + 8);
  v66(v31, v21);
  sub_23DE8733C();
  v46 = v45 / v44;
  sub_23DE87450();
  v47 = *(void (**)(char *, char *, uint64_t))(v22 + 16);
  v47(v28, v31, v21);
  v48 = v61;
  v49 = v62;
  v50 = v59;
  (*(void (**)(char *, _QWORD, uint64_t))(v61 + 104))(v59, *MEMORY[0x24BDCEF70], v62);
  sub_23DE874B0();
  (*(void (**)(char *, uint64_t))(v48 + 8))(v50, v49);
  sub_23DE879B4();
  v47(v28, v33, v21);
  v47(v25, v31, v21);
  v51 = v70;
  v52 = v63;
  sub_23DE8754C();
  v53 = v66;
  v66(v31, v21);
  (*(void (**)(char *, uint64_t))(v67 + 8))(v69, v68);
  v53(v33, v21);
  sub_23DE6D5EC();
  v55 = v54;
  v56 = v71;
  v57 = (char *)v71 + *(int *)(v54 + 64);
  *(_QWORD *)v71 = v51;
  v56[1] = v46;
  (*(void (**)(char *, char *, uint64_t))(v64 + 32))(v57, v52, v65);
  return (*(uint64_t (**)(double *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v55 - 8) + 56))(v56, 0, 1, v55);
}

uint64_t sub_23DE6D03C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;

  v3 = sub_23DE8745C();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 16))(a1, v1, v3);
}

uint64_t sub_23DE6D074@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;

  return sub_23DE6EED4(v2 + *(int *)(a1 + 32), a2, &qword_25432B9D8, (void (*)(uint64_t))MEMORY[0x24BDFB270]);
}

uint64_t _s29HealthMenstrualCyclesWidgetUI0bcD5EntryV5StateO2eeoiySbAE_AEtFZ_0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  double *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  unsigned int (*v20)(uint64_t, uint64_t, uint64_t);
  char v21;
  void *v22;
  double v23;
  uint64_t v24;
  char *v25;
  uint64_t (*v26)(_QWORD);
  void *v27;
  double v28;
  char *v29;
  void (*v30)(char *, char *, uint64_t);
  char *v31;
  char *v32;
  char v33;
  void (*v34)(char *, uint64_t);
  void (*v35)(char *, uint64_t);
  char *v37;
  char *v38;

  v4 = sub_23DE8757C();
  v5 = *(_QWORD *)(v4 - 8);
  v6 = ((uint64_t (*)(void))MEMORY[0x24BDAC7A8])();
  v38 = (char *)&v37 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v37 - v8;
  v10 = type metadata accessor for MenstrualCyclesWidgetEntry.State(0);
  MEMORY[0x24BDAC7A8](v10);
  v12 = (double *)((char *)&v37 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0));
  sub_23DE6EF20();
  v14 = MEMORY[0x24BDAC7A8](v13);
  v16 = (char *)&v37 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17 = (uint64_t)&v16[*(int *)(v14 + 48)];
  sub_23DE6EF80(a1, (uint64_t)v16);
  sub_23DE6EF80(a2, v17);
  sub_23DE6D5EC();
  v19 = v18;
  v20 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v18 - 8) + 48);
  if (v20((uint64_t)v16, 1, v18) == 1)
  {
    v21 = 1;
    if (v20(v17, 1, v19) == 1)
    {
LABEL_11:
      v26 = type metadata accessor for MenstrualCyclesWidgetEntry.State;
      goto LABEL_12;
    }
  }
  else
  {
    v37 = v9;
    sub_23DE6EF80((uint64_t)v16, (uint64_t)v12);
    v22 = *(void **)v12;
    v23 = v12[1];
    v24 = *(int *)(v19 + 64);
    v25 = (char *)v12 + v24;
    if (v20(v17, 1, v19) != 1)
    {
      v27 = *(void **)v17;
      v28 = *(double *)(v17 + 8);
      v29 = (char *)(v17 + v24);
      v30 = *(void (**)(char *, char *, uint64_t))(v5 + 32);
      v31 = v37;
      v30(v37, v25, v4);
      v32 = v38;
      v30(v38, v29, v4);
      sub_23DE6F000(0, &qword_25432BB70);
      v33 = sub_23DE87BB8();

      if ((v33 & 1) != 0 && v23 == v28)
      {
        v21 = MEMORY[0x242646958](v31, v32);
        v34 = *(void (**)(char *, uint64_t))(v5 + 8);
        v34(v32, v4);
        v34(v31, v4);
      }
      else
      {
        v35 = *(void (**)(char *, uint64_t))(v5 + 8);
        v35(v32, v4);
        v35(v31, v4);
        v21 = 0;
      }
      goto LABEL_11;
    }
    (*(void (**)(char *, uint64_t))(v5 + 8))((char *)v12 + v24, v4);

  }
  v21 = 0;
  v26 = (uint64_t (*)(_QWORD))sub_23DE6EF20;
LABEL_12:
  sub_23DE6EFC4((uint64_t)v16, v26);
  return v21 & 1;
}

uint64_t *initializeBufferWithCopyOfBuffer for MenstrualCyclesWidgetEntry(uint64_t *a1, uint64_t *a2, int *a3)
{
  int v5;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  void **v13;
  void **v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  void (*v25)(char *, char *, uint64_t);
  id v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  char *v30;
  char *v31;
  uint64_t v32;
  uint64_t v33;
  unsigned int (*v34)(char *, uint64_t, uint64_t);
  id v35;
  uint64_t v36;
  uint64_t v37;
  char *v38;
  char *v39;
  void *v41;
  char *v42;
  char *v43;

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
    v7 = sub_23DE8745C();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a1, a2, v7);
    v8 = a3[5];
    v9 = (char *)a1 + v8;
    v10 = (char *)a2 + v8;
    v11 = sub_23DE879CC();
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v11 - 8) + 16))(v9, v10, v11);
    v12 = a3[6];
    v13 = (void **)((char *)a1 + v12);
    v14 = (void **)((char *)a2 + v12);
    v15 = type metadata accessor for MenstrualCyclesWidgetEntry.State(0);
    v16 = *(_QWORD *)(v15 - 8);
    if ((*(unsigned int (**)(void **, uint64_t, uint64_t))(v16 + 48))(v14, 1, v15))
    {
      sub_23DE6C560(0, &qword_25432BB38, (void (*)(uint64_t))type metadata accessor for MenstrualCyclesWidgetEntry.State);
      memcpy(v13, v14, *(_QWORD *)(*(_QWORD *)(v17 - 8) + 64));
    }
    else
    {
      sub_23DE6D5EC();
      v20 = v19;
      v21 = *(_QWORD *)(v19 - 8);
      if ((*(unsigned int (**)(void **, uint64_t, uint64_t))(v21 + 48))(v14, 1, v19))
      {
        memcpy(v13, v14, *(_QWORD *)(v16 + 64));
      }
      else
      {
        v22 = v14[1];
        v41 = *v14;
        *v13 = *v14;
        v13[1] = v22;
        v23 = *(int *)(v20 + 64);
        v42 = (char *)v14 + v23;
        v43 = (char *)v13 + v23;
        v24 = sub_23DE8757C();
        v25 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v24 - 8) + 16);
        v26 = v41;
        v25(v43, v42, v24);
        (*(void (**)(void **, _QWORD, uint64_t, uint64_t))(v21 + 56))(v13, 0, 1, v20);
      }
      (*(void (**)(void **, _QWORD, uint64_t, uint64_t))(v16 + 56))(v13, 0, 1, v15);
    }
    v27 = a3[7];
    v28 = a3[8];
    v29 = *(void **)((char *)a2 + v27);
    *(uint64_t *)((char *)a1 + v27) = (uint64_t)v29;
    v30 = (char *)a1 + v28;
    v31 = (char *)a2 + v28;
    v32 = sub_23DE87A74();
    v33 = *(_QWORD *)(v32 - 8);
    v34 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v33 + 48);
    v35 = v29;
    if (v34(v31, 1, v32))
    {
      sub_23DE6C560(0, &qword_25432B9D8, (void (*)(uint64_t))MEMORY[0x24BDFB270]);
      memcpy(v30, v31, *(_QWORD *)(*(_QWORD *)(v36 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v33 + 16))(v30, v31, v32);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v33 + 56))(v30, 0, 1, v32);
    }
    v37 = a3[9];
    v38 = (char *)a1 + v37;
    v39 = (char *)a2 + v37;
    *(_QWORD *)v38 = *(_QWORD *)v39;
    v38[8] = v39[8];
  }
  return a1;
}

void sub_23DE6D5EC()
{
  unint64_t TupleTypeMetadata3;
  uint64_t v1;

  if (!qword_25432BB58)
  {
    sub_23DE6F000(255, &qword_25432BB60);
    sub_23DE8757C();
    TupleTypeMetadata3 = swift_getTupleTypeMetadata3();
    if (!v1)
      atomic_store(TupleTypeMetadata3, (unint64_t *)&qword_25432BB58);
  }
}

uint64_t destroy for MenstrualCyclesWidgetEntry(uint64_t a1, int *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  id *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t result;

  v4 = sub_23DE8745C();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(a1, v4);
  v5 = a1 + a2[5];
  v6 = sub_23DE879CC();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 8))(v5, v6);
  v7 = (id *)(a1 + a2[6]);
  v8 = type metadata accessor for MenstrualCyclesWidgetEntry.State(0);
  if (!(*(unsigned int (**)(id *, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 48))(v7, 1, v8))
  {
    sub_23DE6D5EC();
    v10 = v9;
    if (!(*(unsigned int (**)(id *, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 48))(v7, 1, v9))
    {

      v11 = (char *)v7 + *(int *)(v10 + 64);
      v12 = sub_23DE8757C();
      (*(void (**)(char *, uint64_t))(*(_QWORD *)(v12 - 8) + 8))(v11, v12);
    }
  }

  v13 = a1 + a2[8];
  v14 = sub_23DE87A74();
  v15 = *(_QWORD *)(v14 - 8);
  result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v15 + 48))(v13, 1, v14);
  if (!(_DWORD)result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(v15 + 8))(v13, v14);
  return result;
}

uint64_t initializeWithCopy for MenstrualCyclesWidgetEntry(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void **v12;
  void **v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  void (*v23)(char *, char *, uint64_t);
  id v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  void *v28;
  const void *v29;
  uint64_t v30;
  uint64_t v31;
  unsigned int (*v32)(const void *, uint64_t, uint64_t);
  id v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  void *v39;
  char *v40;
  char *v41;

  v6 = sub_23DE8745C();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(a1, a2, v6);
  v7 = a3[5];
  v8 = a1 + v7;
  v9 = a2 + v7;
  v10 = sub_23DE879CC();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 16))(v8, v9, v10);
  v11 = a3[6];
  v12 = (void **)(a1 + v11);
  v13 = (void **)(a2 + v11);
  v14 = type metadata accessor for MenstrualCyclesWidgetEntry.State(0);
  v15 = *(_QWORD *)(v14 - 8);
  if ((*(unsigned int (**)(void **, uint64_t, uint64_t))(v15 + 48))(v13, 1, v14))
  {
    sub_23DE6C560(0, &qword_25432BB38, (void (*)(uint64_t))type metadata accessor for MenstrualCyclesWidgetEntry.State);
    memcpy(v12, v13, *(_QWORD *)(*(_QWORD *)(v16 - 8) + 64));
  }
  else
  {
    sub_23DE6D5EC();
    v18 = v17;
    v19 = *(_QWORD *)(v17 - 8);
    if ((*(unsigned int (**)(void **, uint64_t, uint64_t))(v19 + 48))(v13, 1, v17))
    {
      memcpy(v12, v13, *(_QWORD *)(v15 + 64));
    }
    else
    {
      v20 = v13[1];
      v39 = *v13;
      *v12 = *v13;
      v12[1] = v20;
      v21 = *(int *)(v18 + 64);
      v40 = (char *)v13 + v21;
      v41 = (char *)v12 + v21;
      v22 = sub_23DE8757C();
      v23 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v22 - 8) + 16);
      v24 = v39;
      v23(v41, v40, v22);
      (*(void (**)(void **, _QWORD, uint64_t, uint64_t))(v19 + 56))(v12, 0, 1, v18);
    }
    (*(void (**)(void **, _QWORD, uint64_t, uint64_t))(v15 + 56))(v12, 0, 1, v14);
  }
  v25 = a3[7];
  v26 = a3[8];
  v27 = *(void **)(a2 + v25);
  *(_QWORD *)(a1 + v25) = v27;
  v28 = (void *)(a1 + v26);
  v29 = (const void *)(a2 + v26);
  v30 = sub_23DE87A74();
  v31 = *(_QWORD *)(v30 - 8);
  v32 = *(unsigned int (**)(const void *, uint64_t, uint64_t))(v31 + 48);
  v33 = v27;
  if (v32(v29, 1, v30))
  {
    sub_23DE6C560(0, &qword_25432B9D8, (void (*)(uint64_t))MEMORY[0x24BDFB270]);
    memcpy(v28, v29, *(_QWORD *)(*(_QWORD *)(v34 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v31 + 16))(v28, v29, v30);
    (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v31 + 56))(v28, 0, 1, v30);
  }
  v35 = a3[9];
  v36 = a1 + v35;
  v37 = a2 + v35;
  *(_QWORD *)v36 = *(_QWORD *)v37;
  *(_BYTE *)(v36 + 8) = *(_BYTE *)(v37 + 8);
  return a1;
}

uint64_t assignWithCopy for MenstrualCyclesWidgetEntry(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void **v12;
  void **v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t (*v16)(void **, uint64_t, uint64_t);
  int v17;
  int v18;
  uint64_t v19;
  size_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t (*v27)(void **, uint64_t, uint64_t);
  int v28;
  int v29;
  void *v30;
  uint64_t v31;
  char *v32;
  uint64_t v33;
  void (*v34)(char *, char *, uint64_t);
  id v35;
  uint64_t v36;
  uint64_t v37;
  void (*v38)(char *, char *, uint64_t);
  id v39;
  uint64_t v40;
  void *v41;
  void *v42;
  id v43;
  uint64_t v44;
  void *v45;
  void *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t (*v49)(void *, uint64_t, uint64_t);
  int v50;
  int v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t *v55;
  uint64_t v56;
  void *v58;
  void *v59;
  id v60;
  uint64_t v61;
  char *v62;
  char *v63;
  uint64_t v64;
  char *v65;
  char *v66;
  char *v67;
  void *v68;

  v6 = sub_23DE8745C();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 24))(a1, a2, v6);
  v7 = a3[5];
  v8 = a1 + v7;
  v9 = a2 + v7;
  v10 = sub_23DE879CC();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 24))(v8, v9, v10);
  v11 = a3[6];
  v12 = (void **)(a1 + v11);
  v13 = (void **)(a2 + v11);
  v14 = type metadata accessor for MenstrualCyclesWidgetEntry.State(0);
  v15 = *(_QWORD *)(v14 - 8);
  v16 = *(uint64_t (**)(void **, uint64_t, uint64_t))(v15 + 48);
  v17 = v16(v12, 1, v14);
  v18 = v16(v13, 1, v14);
  if (!v17)
  {
    if (v18)
    {
      sub_23DE6EFC4((uint64_t)v12, type metadata accessor for MenstrualCyclesWidgetEntry.State);
LABEL_6:
      sub_23DE6C560(0, &qword_25432BB38, (void (*)(uint64_t))type metadata accessor for MenstrualCyclesWidgetEntry.State);
      v20 = *(_QWORD *)(*(_QWORD *)(v19 - 8) + 64);
LABEL_7:
      memcpy(v12, v13, v20);
      goto LABEL_15;
    }
    sub_23DE6D5EC();
    v25 = v24;
    v26 = *(_QWORD *)(v24 - 8);
    v27 = *(uint64_t (**)(void **, uint64_t, uint64_t))(v26 + 48);
    v28 = v27(v12, 1, v24);
    v29 = v27(v13, 1, v25);
    if (v28)
    {
      if (!v29)
      {
        v30 = *v13;
        *v12 = *v13;
        v12[1] = v13[1];
        v31 = *(int *)(v25 + 64);
        v32 = (char *)v12 + v31;
        v67 = (char *)v13 + v31;
        v33 = sub_23DE8757C();
        v34 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v33 - 8) + 16);
        v35 = v30;
        v34(v32, v67, v33);
        (*(void (**)(void **, _QWORD, uint64_t, uint64_t))(v26 + 56))(v12, 0, 1, v25);
        goto LABEL_15;
      }
    }
    else
    {
      if (!v29)
      {
        v58 = *v13;
        v59 = *v12;
        *v12 = *v13;
        v60 = v58;

        v12[1] = v13[1];
        v61 = *(int *)(v25 + 64);
        v62 = (char *)v12 + v61;
        v63 = (char *)v13 + v61;
        v64 = sub_23DE8757C();
        (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v64 - 8) + 24))(v62, v63, v64);
        goto LABEL_15;
      }
      sub_23DE6EFC4((uint64_t)v12, (uint64_t (*)(_QWORD))sub_23DE6D5EC);
    }
    v20 = *(_QWORD *)(v15 + 64);
    goto LABEL_7;
  }
  if (v18)
    goto LABEL_6;
  sub_23DE6D5EC();
  v22 = v21;
  v23 = *(_QWORD *)(v21 - 8);
  if ((*(unsigned int (**)(void **, uint64_t, uint64_t))(v23 + 48))(v13, 1, v21))
  {
    memcpy(v12, v13, *(_QWORD *)(v15 + 64));
  }
  else
  {
    v68 = *v13;
    *v12 = *v13;
    v12[1] = v13[1];
    v36 = *(int *)(v22 + 64);
    v65 = (char *)v13 + v36;
    v66 = (char *)v12 + v36;
    v37 = sub_23DE8757C();
    v38 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v37 - 8) + 16);
    v39 = v68;
    v38(v66, v65, v37);
    (*(void (**)(void **, _QWORD, uint64_t, uint64_t))(v23 + 56))(v12, 0, 1, v22);
  }
  (*(void (**)(void **, _QWORD, uint64_t, uint64_t))(v15 + 56))(v12, 0, 1, v14);
LABEL_15:
  v40 = a3[7];
  v41 = *(void **)(a1 + v40);
  v42 = *(void **)(a2 + v40);
  *(_QWORD *)(a1 + v40) = v42;
  v43 = v42;

  v44 = a3[8];
  v45 = (void *)(a1 + v44);
  v46 = (void *)(a2 + v44);
  v47 = sub_23DE87A74();
  v48 = *(_QWORD *)(v47 - 8);
  v49 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v48 + 48);
  v50 = v49(v45, 1, v47);
  v51 = v49(v46, 1, v47);
  if (!v50)
  {
    if (!v51)
    {
      (*(void (**)(void *, void *, uint64_t))(v48 + 24))(v45, v46, v47);
      goto LABEL_21;
    }
    (*(void (**)(void *, uint64_t))(v48 + 8))(v45, v47);
    goto LABEL_20;
  }
  if (v51)
  {
LABEL_20:
    sub_23DE6C560(0, &qword_25432B9D8, (void (*)(uint64_t))MEMORY[0x24BDFB270]);
    memcpy(v45, v46, *(_QWORD *)(*(_QWORD *)(v52 - 8) + 64));
    goto LABEL_21;
  }
  (*(void (**)(void *, void *, uint64_t))(v48 + 16))(v45, v46, v47);
  (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v48 + 56))(v45, 0, 1, v47);
LABEL_21:
  v53 = a3[9];
  v54 = a1 + v53;
  v55 = (uint64_t *)(a2 + v53);
  v56 = *v55;
  *(_BYTE *)(v54 + 8) = *((_BYTE *)v55 + 8);
  *(_QWORD *)v54 = v56;
  return a1;
}

uint64_t initializeWithTake for MenstrualCyclesWidgetEntry(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  _QWORD *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  char *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  const void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;

  v6 = sub_23DE8745C();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 32))(a1, a2, v6);
  v7 = a3[5];
  v8 = a1 + v7;
  v9 = a2 + v7;
  v10 = sub_23DE879CC();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 32))(v8, v9, v10);
  v11 = a3[6];
  v12 = (_QWORD *)(a1 + v11);
  v13 = (_QWORD *)(a2 + v11);
  v14 = type metadata accessor for MenstrualCyclesWidgetEntry.State(0);
  v15 = *(_QWORD *)(v14 - 8);
  if ((*(unsigned int (**)(_QWORD *, uint64_t, uint64_t))(v15 + 48))(v13, 1, v14))
  {
    sub_23DE6C560(0, &qword_25432BB38, (void (*)(uint64_t))type metadata accessor for MenstrualCyclesWidgetEntry.State);
    memcpy(v12, v13, *(_QWORD *)(*(_QWORD *)(v16 - 8) + 64));
  }
  else
  {
    sub_23DE6D5EC();
    v18 = v17;
    v19 = *(_QWORD *)(v17 - 8);
    if ((*(unsigned int (**)(_QWORD *, uint64_t, uint64_t))(v19 + 48))(v13, 1, v17))
    {
      memcpy(v12, v13, *(_QWORD *)(v15 + 64));
    }
    else
    {
      v20 = v13[1];
      *v12 = *v13;
      v12[1] = v20;
      v21 = *(int *)(v18 + 64);
      v22 = (char *)v12 + v21;
      v23 = (char *)v13 + v21;
      v24 = sub_23DE8757C();
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v24 - 8) + 32))(v22, v23, v24);
      (*(void (**)(_QWORD *, _QWORD, uint64_t, uint64_t))(v19 + 56))(v12, 0, 1, v18);
    }
    (*(void (**)(_QWORD *, _QWORD, uint64_t, uint64_t))(v15 + 56))(v12, 0, 1, v14);
  }
  v25 = a3[8];
  *(_QWORD *)(a1 + a3[7]) = *(_QWORD *)(a2 + a3[7]);
  v26 = (void *)(a1 + v25);
  v27 = (const void *)(a2 + v25);
  v28 = sub_23DE87A74();
  v29 = *(_QWORD *)(v28 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v29 + 48))(v27, 1, v28))
  {
    sub_23DE6C560(0, &qword_25432B9D8, (void (*)(uint64_t))MEMORY[0x24BDFB270]);
    memcpy(v26, v27, *(_QWORD *)(*(_QWORD *)(v30 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v29 + 32))(v26, v27, v28);
    (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v29 + 56))(v26, 0, 1, v28);
  }
  v31 = a3[9];
  v32 = a1 + v31;
  v33 = a2 + v31;
  *(_QWORD *)v32 = *(_QWORD *)v33;
  *(_BYTE *)(v32 + 8) = *(_BYTE *)(v33 + 8);
  return a1;
}

uint64_t assignWithTake for MenstrualCyclesWidgetEntry(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void **v12;
  void **v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t (*v16)(void **, uint64_t, uint64_t);
  int v17;
  int v18;
  uint64_t v19;
  size_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t (*v27)(void **, uint64_t, uint64_t);
  int v28;
  int v29;
  void *v30;
  uint64_t v31;
  char *v32;
  char *v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  char *v37;
  char *v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  uint64_t v42;
  void *v43;
  void *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t (*v47)(void *, uint64_t, uint64_t);
  int v48;
  int v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  void *v55;
  uint64_t v56;
  char *v57;
  char *v58;
  uint64_t v59;

  v6 = sub_23DE8745C();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 40))(a1, a2, v6);
  v7 = a3[5];
  v8 = a1 + v7;
  v9 = a2 + v7;
  v10 = sub_23DE879CC();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 40))(v8, v9, v10);
  v11 = a3[6];
  v12 = (void **)(a1 + v11);
  v13 = (void **)(a2 + v11);
  v14 = type metadata accessor for MenstrualCyclesWidgetEntry.State(0);
  v15 = *(_QWORD *)(v14 - 8);
  v16 = *(uint64_t (**)(void **, uint64_t, uint64_t))(v15 + 48);
  v17 = v16(v12, 1, v14);
  v18 = v16(v13, 1, v14);
  if (!v17)
  {
    if (v18)
    {
      sub_23DE6EFC4((uint64_t)v12, type metadata accessor for MenstrualCyclesWidgetEntry.State);
LABEL_6:
      sub_23DE6C560(0, &qword_25432BB38, (void (*)(uint64_t))type metadata accessor for MenstrualCyclesWidgetEntry.State);
      v20 = *(_QWORD *)(*(_QWORD *)(v19 - 8) + 64);
LABEL_7:
      memcpy(v12, v13, v20);
      goto LABEL_15;
    }
    sub_23DE6D5EC();
    v25 = v24;
    v26 = *(_QWORD *)(v24 - 8);
    v27 = *(uint64_t (**)(void **, uint64_t, uint64_t))(v26 + 48);
    v28 = v27(v12, 1, v24);
    v29 = v27(v13, 1, v25);
    if (v28)
    {
      if (!v29)
      {
        v30 = v13[1];
        *v12 = *v13;
        v12[1] = v30;
        v31 = *(int *)(v25 + 64);
        v32 = (char *)v12 + v31;
        v33 = (char *)v13 + v31;
        v34 = sub_23DE8757C();
        (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v34 - 8) + 32))(v32, v33, v34);
        (*(void (**)(void **, _QWORD, uint64_t, uint64_t))(v26 + 56))(v12, 0, 1, v25);
        goto LABEL_15;
      }
    }
    else
    {
      if (!v29)
      {
        v55 = *v12;
        *v12 = *v13;

        v12[1] = v13[1];
        v56 = *(int *)(v25 + 64);
        v57 = (char *)v12 + v56;
        v58 = (char *)v13 + v56;
        v59 = sub_23DE8757C();
        (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v59 - 8) + 40))(v57, v58, v59);
        goto LABEL_15;
      }
      sub_23DE6EFC4((uint64_t)v12, (uint64_t (*)(_QWORD))sub_23DE6D5EC);
    }
    v20 = *(_QWORD *)(v15 + 64);
    goto LABEL_7;
  }
  if (v18)
    goto LABEL_6;
  sub_23DE6D5EC();
  v22 = v21;
  v23 = *(_QWORD *)(v21 - 8);
  if ((*(unsigned int (**)(void **, uint64_t, uint64_t))(v23 + 48))(v13, 1, v21))
  {
    memcpy(v12, v13, *(_QWORD *)(v15 + 64));
  }
  else
  {
    v35 = v13[1];
    *v12 = *v13;
    v12[1] = v35;
    v36 = *(int *)(v22 + 64);
    v37 = (char *)v12 + v36;
    v38 = (char *)v13 + v36;
    v39 = sub_23DE8757C();
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v39 - 8) + 32))(v37, v38, v39);
    (*(void (**)(void **, _QWORD, uint64_t, uint64_t))(v23 + 56))(v12, 0, 1, v22);
  }
  (*(void (**)(void **, _QWORD, uint64_t, uint64_t))(v15 + 56))(v12, 0, 1, v14);
LABEL_15:
  v40 = a3[7];
  v41 = *(void **)(a1 + v40);
  *(_QWORD *)(a1 + v40) = *(_QWORD *)(a2 + v40);

  v42 = a3[8];
  v43 = (void *)(a1 + v42);
  v44 = (void *)(a2 + v42);
  v45 = sub_23DE87A74();
  v46 = *(_QWORD *)(v45 - 8);
  v47 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v46 + 48);
  v48 = v47(v43, 1, v45);
  v49 = v47(v44, 1, v45);
  if (!v48)
  {
    if (!v49)
    {
      (*(void (**)(void *, void *, uint64_t))(v46 + 40))(v43, v44, v45);
      goto LABEL_21;
    }
    (*(void (**)(void *, uint64_t))(v46 + 8))(v43, v45);
    goto LABEL_20;
  }
  if (v49)
  {
LABEL_20:
    sub_23DE6C560(0, &qword_25432B9D8, (void (*)(uint64_t))MEMORY[0x24BDFB270]);
    memcpy(v43, v44, *(_QWORD *)(*(_QWORD *)(v50 - 8) + 64));
    goto LABEL_21;
  }
  (*(void (**)(void *, void *, uint64_t))(v46 + 32))(v43, v44, v45);
  (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v46 + 56))(v43, 0, 1, v45);
LABEL_21:
  v51 = a3[9];
  v52 = a1 + v51;
  v53 = a2 + v51;
  *(_QWORD *)v52 = *(_QWORD *)v53;
  *(_BYTE *)(v52 + 8) = *(_BYTE *)(v53 + 8);
  return a1;
}

uint64_t getEnumTagSinglePayload for MenstrualCyclesWidgetEntry()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_23DE6E430(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  int v15;
  uint64_t v16;

  v6 = sub_23DE8745C();
  v7 = *(_QWORD *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == (_DWORD)a2)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, a2, v6);
  v9 = sub_23DE879CC();
  v10 = *(_QWORD *)(v9 - 8);
  if (*(_DWORD *)(v10 + 84) == (_DWORD)a2)
  {
    v11 = v9;
    v12 = a3[5];
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v10 + 48))(a1 + v12, a2, v11);
  }
  sub_23DE6C560(0, &qword_25432BB38, (void (*)(uint64_t))type metadata accessor for MenstrualCyclesWidgetEntry.State);
  v10 = *(_QWORD *)(v13 - 8);
  if (*(_DWORD *)(v10 + 84) == (_DWORD)a2)
  {
    v11 = v13;
    v12 = a3[6];
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v10 + 48))(a1 + v12, a2, v11);
  }
  if ((_DWORD)a2 != 2147483646)
  {
    sub_23DE6C560(0, &qword_25432B9D8, (void (*)(uint64_t))MEMORY[0x24BDFB270]);
    v11 = v16;
    v10 = *(_QWORD *)(v16 - 8);
    v12 = a3[8];
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v10 + 48))(a1 + v12, a2, v11);
  }
  v14 = *(_QWORD *)(a1 + a3[7]);
  if (v14 >= 0xFFFFFFFF)
    LODWORD(v14) = -1;
  v15 = v14 - 1;
  if (v15 < 0)
    v15 = -1;
  return (v15 + 1);
}

uint64_t storeEnumTagSinglePayload for MenstrualCyclesWidgetEntry()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

void sub_23DE6E558(uint64_t a1, uint64_t a2, int a3, int *a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;

  v8 = sub_23DE8745C();
  v9 = *(_QWORD *)(v8 - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    v10 = v8;
    v11 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    v12 = a1;
  }
  else
  {
    v13 = sub_23DE879CC();
    v14 = *(_QWORD *)(v13 - 8);
    if (*(_DWORD *)(v14 + 84) == a3)
    {
      v10 = v13;
      v15 = a4[5];
    }
    else
    {
      sub_23DE6C560(0, &qword_25432BB38, (void (*)(uint64_t))type metadata accessor for MenstrualCyclesWidgetEntry.State);
      v14 = *(_QWORD *)(v16 - 8);
      if (*(_DWORD *)(v14 + 84) == a3)
      {
        v10 = v16;
        v15 = a4[6];
      }
      else
      {
        if (a3 == 2147483646)
        {
          *(_QWORD *)(a1 + a4[7]) = a2;
          return;
        }
        sub_23DE6C560(0, &qword_25432B9D8, (void (*)(uint64_t))MEMORY[0x24BDFB270]);
        v10 = v17;
        v14 = *(_QWORD *)(v17 - 8);
        v15 = a4[8];
      }
    }
    v12 = a1 + v15;
    v11 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v14 + 56);
  }
  v11(v12, a2, a2, v10);
}

void sub_23DE6E664()
{
  unint64_t v0;
  unint64_t v1;
  unint64_t v2;
  unint64_t v3;

  sub_23DE8745C();
  if (v0 <= 0x3F)
  {
    sub_23DE879CC();
    if (v1 <= 0x3F)
    {
      sub_23DE6C560(319, &qword_25432BB38, (void (*)(uint64_t))type metadata accessor for MenstrualCyclesWidgetEntry.State);
      if (v2 <= 0x3F)
      {
        sub_23DE6C560(319, &qword_25432B9D8, (void (*)(uint64_t))MEMORY[0x24BDFB270]);
        if (v3 <= 0x3F)
          swift_initStructMetadata();
      }
    }
  }
}

char *initializeBufferWithCopyOfBuffer for MenstrualCyclesWidgetEntry.State(char *a1, char **a2, uint64_t a3)
{
  uint64_t v5;
  int v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  char *v11;
  char *v12;
  uint64_t v13;
  char *v14;
  char *v15;
  uint64_t v16;
  void (*v17)(char *, char *, uint64_t);
  char *v18;

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
    sub_23DE6D5EC();
    v8 = v7;
    v9 = *(_QWORD *)(v7 - 8);
    if ((*(unsigned int (**)(char **, uint64_t, uint64_t))(v9 + 48))(a2, 1, v7))
    {
      memcpy(a1, a2, *(_QWORD *)(v5 + 64));
    }
    else
    {
      v12 = *a2;
      v11 = a2[1];
      *(_QWORD *)a1 = *a2;
      *((_QWORD *)a1 + 1) = v11;
      v13 = *(int *)(v8 + 64);
      v14 = &a1[v13];
      v15 = (char *)a2 + v13;
      v16 = sub_23DE8757C();
      v17 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v16 - 8) + 16);
      v18 = v12;
      v17(v14, v15, v16);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v9 + 56))(a1, 0, 1, v8);
    }
  }
  return a1;
}

uint64_t destroy for MenstrualCyclesWidgetEntry.State(id *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t result;
  char *v5;
  uint64_t v6;

  sub_23DE6D5EC();
  v3 = v2;
  result = (*(uint64_t (**)(id *, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 48))(a1, 1, v2);
  if (!(_DWORD)result)
  {

    v5 = (char *)a1 + *(int *)(v3 + 64);
    v6 = sub_23DE8757C();
    return (*(uint64_t (**)(char *, uint64_t))(*(_QWORD *)(v6 - 8) + 8))(v5, v6);
  }
  return result;
}

void **initializeWithCopy for MenstrualCyclesWidgetEntry.State(void **a1, void **a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  char *v12;
  char *v13;
  uint64_t v14;
  void (*v15)(char *, char *, uint64_t);
  id v16;

  sub_23DE6D5EC();
  v7 = v6;
  v8 = *(_QWORD *)(v6 - 8);
  if ((*(unsigned int (**)(void **, uint64_t, uint64_t))(v8 + 48))(a2, 1, v6))
  {
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64));
  }
  else
  {
    v10 = *a2;
    v9 = a2[1];
    *a1 = *a2;
    a1[1] = v9;
    v11 = *(int *)(v7 + 64);
    v12 = (char *)a1 + v11;
    v13 = (char *)a2 + v11;
    v14 = sub_23DE8757C();
    v15 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v14 - 8) + 16);
    v16 = v10;
    v15(v12, v13, v14);
    (*(void (**)(void **, _QWORD, uint64_t, uint64_t))(v8 + 56))(a1, 0, 1, v7);
  }
  return a1;
}

void **assignWithCopy for MenstrualCyclesWidgetEntry.State(void **a1, void **a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t (*v9)(void **, uint64_t, uint64_t);
  int v10;
  int v11;
  void *v12;
  uint64_t v13;
  char *v14;
  char *v15;
  uint64_t v16;
  void (*v17)(char *, char *, uint64_t);
  id v18;
  void *v20;
  void *v21;
  id v22;
  uint64_t v23;
  char *v24;
  char *v25;
  uint64_t v26;

  sub_23DE6D5EC();
  v7 = v6;
  v8 = *(_QWORD *)(v6 - 8);
  v9 = *(uint64_t (**)(void **, uint64_t, uint64_t))(v8 + 48);
  v10 = v9(a1, 1, v6);
  v11 = v9(a2, 1, v7);
  if (!v10)
  {
    if (!v11)
    {
      v20 = *a2;
      v21 = *a1;
      *a1 = *a2;
      v22 = v20;

      a1[1] = a2[1];
      v23 = *(int *)(v7 + 64);
      v24 = (char *)a1 + v23;
      v25 = (char *)a2 + v23;
      v26 = sub_23DE8757C();
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v26 - 8) + 24))(v24, v25, v26);
      return a1;
    }
    sub_23DE6EFC4((uint64_t)a1, (uint64_t (*)(_QWORD))sub_23DE6D5EC);
    goto LABEL_6;
  }
  if (v11)
  {
LABEL_6:
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64));
    return a1;
  }
  v12 = *a2;
  *a1 = *a2;
  a1[1] = a2[1];
  v13 = *(int *)(v7 + 64);
  v14 = (char *)a1 + v13;
  v15 = (char *)a2 + v13;
  v16 = sub_23DE8757C();
  v17 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v16 - 8) + 16);
  v18 = v12;
  v17(v14, v15, v16);
  (*(void (**)(void **, _QWORD, uint64_t, uint64_t))(v8 + 56))(a1, 0, 1, v7);
  return a1;
}

_QWORD *initializeWithTake for MenstrualCyclesWidgetEntry.State(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  char *v12;
  uint64_t v13;

  sub_23DE6D5EC();
  v7 = v6;
  v8 = *(_QWORD *)(v6 - 8);
  if ((*(unsigned int (**)(_QWORD *, uint64_t, uint64_t))(v8 + 48))(a2, 1, v6))
  {
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64));
  }
  else
  {
    v9 = a2[1];
    *a1 = *a2;
    a1[1] = v9;
    v10 = *(int *)(v7 + 64);
    v11 = (char *)a1 + v10;
    v12 = (char *)a2 + v10;
    v13 = sub_23DE8757C();
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v13 - 8) + 32))(v11, v12, v13);
    (*(void (**)(_QWORD *, _QWORD, uint64_t, uint64_t))(v8 + 56))(a1, 0, 1, v7);
  }
  return a1;
}

void **assignWithTake for MenstrualCyclesWidgetEntry.State(void **a1, void **a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t (*v9)(void **, uint64_t, uint64_t);
  int v10;
  int v11;
  void *v12;
  uint64_t v13;
  char *v14;
  char *v15;
  uint64_t v16;
  void *v18;
  uint64_t v19;
  char *v20;
  char *v21;
  uint64_t v22;

  sub_23DE6D5EC();
  v7 = v6;
  v8 = *(_QWORD *)(v6 - 8);
  v9 = *(uint64_t (**)(void **, uint64_t, uint64_t))(v8 + 48);
  v10 = v9(a1, 1, v6);
  v11 = v9(a2, 1, v7);
  if (!v10)
  {
    if (!v11)
    {
      v18 = *a1;
      *a1 = *a2;

      a1[1] = a2[1];
      v19 = *(int *)(v7 + 64);
      v20 = (char *)a1 + v19;
      v21 = (char *)a2 + v19;
      v22 = sub_23DE8757C();
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v22 - 8) + 40))(v20, v21, v22);
      return a1;
    }
    sub_23DE6EFC4((uint64_t)a1, (uint64_t (*)(_QWORD))sub_23DE6D5EC);
    goto LABEL_6;
  }
  if (v11)
  {
LABEL_6:
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64));
    return a1;
  }
  v12 = a2[1];
  *a1 = *a2;
  a1[1] = v12;
  v13 = *(int *)(v7 + 64);
  v14 = (char *)a1 + v13;
  v15 = (char *)a2 + v13;
  v16 = sub_23DE8757C();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v16 - 8) + 32))(v14, v15, v16);
  (*(void (**)(void **, _QWORD, uint64_t, uint64_t))(v8 + 56))(a1, 0, 1, v7);
  return a1;
}

uint64_t getEnumTagSinglePayload for MenstrualCyclesWidgetEntry.State()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_23DE6ECF8(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  unsigned int v5;

  sub_23DE6D5EC();
  v5 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 48))(a1, a2, v4);
  if (v5 >= 2)
    return v5 - 1;
  else
    return 0;
}

uint64_t storeEnumTagSinglePayload for MenstrualCyclesWidgetEntry.State()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_23DE6ED50(uint64_t a1, int a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;

  if (a2)
    v5 = (a2 + 1);
  else
    v5 = 0;
  sub_23DE6D5EC();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 56))(a1, v5, a3, v6);
}

uint64_t sub_23DE6EDA0(uint64_t a1)
{
  uint64_t v2;

  sub_23DE6D5EC();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 48))(a1, 1, v2);
}

uint64_t sub_23DE6EDD8(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  sub_23DE6D5EC();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 56))(a1, a2, 1, v4);
}

uint64_t sub_23DE6EE18()
{
  uint64_t result;
  unint64_t v1;

  result = sub_23DE8757C();
  if (v1 <= 0x3F)
  {
    swift_getTupleTypeLayout3();
    swift_initEnumMetadataSinglePayload();
    return 0;
  }
  return result;
}

uint64_t sub_23DE6EE98(uint64_t a1, unint64_t *a2, void (*a3)(uint64_t))
{
  uint64_t v4;

  sub_23DE6C560(0, a2, a3);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(a1, v4);
  return a1;
}

uint64_t sub_23DE6EED4(uint64_t a1, uint64_t a2, unint64_t *a3, void (*a4)(uint64_t))
{
  uint64_t v6;

  sub_23DE6C560(0, a3, a4);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(a2, a1, v6);
  return a2;
}

void sub_23DE6EF20()
{
  unint64_t TupleTypeMetadata2;
  uint64_t v1;

  if (!qword_256D0D260)
  {
    type metadata accessor for MenstrualCyclesWidgetEntry.State(255);
    TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
    if (!v1)
      atomic_store(TupleTypeMetadata2, (unint64_t *)&qword_256D0D260);
  }
}

uint64_t sub_23DE6EF80(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for MenstrualCyclesWidgetEntry.State(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_23DE6EFC4(uint64_t a1, uint64_t (*a2)(_QWORD))
{
  uint64_t v3;

  v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_23DE6F000(uint64_t a1, unint64_t *a2)
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

uint64_t MenstrualCyclesWidgetTimelineProvider.init()@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  void (*v9)(char *, uint64_t, uint64_t);
  void (*v10)(char *, uint64_t);
  uint64_t v12;

  v2 = sub_23DE874A4();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v12 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDD3C40]), sel_init);
  type metadata accessor for MenstrualCyclesWidgetTimelineGenerator();
  v7 = swift_allocObject();
  sub_23DE8751C();
  v8 = *MEMORY[0x24BDCEF70];
  v9 = *(void (**)(char *, uint64_t, uint64_t))(v3 + 104);
  v9(v5, v8, v2);
  sub_23DE874B0();
  v10 = *(void (**)(char *, uint64_t))(v3 + 8);
  v10(v5, v2);
  *(_QWORD *)(v7 + 16) = v6;
  *a1 = v7;
  type metadata accessor for MenstrualCyclesWidgetTimelineProvider();
  v9(v5, v8, v2);
  sub_23DE874B0();
  return ((uint64_t (*)(char *, uint64_t))v10)(v5, v2);
}

uint64_t MenstrualCyclesWidgetTimelineProvider.placeholder(in:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  uint64_t (*v6)(uint64_t, uint64_t);
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
  char *v26;
  uint64_t v27;
  void (*v28)(char *, uint64_t, uint64_t);
  NSObject *v29;
  os_log_type_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  unint64_t v34;
  uint64_t v35;
  uint64_t v36;
  char *v37;
  uint64_t v38;
  void (*v39)(char *, char *, uint64_t);
  char *v40;
  uint64_t v41;
  char *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  void (*v48)(char *, uint64_t, uint64_t, uint64_t);
  uint64_t v49;
  uint64_t v50;
  int *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  char *v55;
  uint64_t v56;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  char *v62;
  uint64_t v63;
  char *v64;
  uint64_t v65;
  uint64_t v66;
  char *v67;
  char *v68;
  uint64_t v69;
  char *v70;
  uint64_t v71;
  char *v72;
  char *v73;
  uint64_t v74;
  uint64_t v75;
  char *v76;
  uint64_t v77;
  uint64_t v78[2];

  v3 = v2;
  v71 = a2;
  v69 = type metadata accessor for MenstrualCyclesWidgetEntry(0);
  MEMORY[0x24BDAC7A8](v69);
  v70 = (char *)&v58 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1C68];
  sub_23DE7349C(0, &qword_25432B9D8, (uint64_t (*)(uint64_t))MEMORY[0x24BDFB270], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1C68]);
  MEMORY[0x24BDAC7A8](v7);
  v68 = (char *)&v58 - v8;
  sub_23DE7349C(0, &qword_25432BB38, type metadata accessor for MenstrualCyclesWidgetEntry.State, v6);
  MEMORY[0x24BDAC7A8](v9);
  v67 = (char *)&v58 - v10;
  v63 = sub_23DE87534();
  v61 = *(_QWORD *)(v63 - 8);
  MEMORY[0x24BDAC7A8](v63);
  v62 = (char *)&v58 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = sub_23DE879CC();
  v65 = *(_QWORD *)(v12 - 8);
  v66 = v12;
  v13 = MEMORY[0x24BDAC7A8](v12);
  v72 = (char *)&v58 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v13);
  v76 = (char *)&v58 - v15;
  v16 = sub_23DE8745C();
  v74 = *(_QWORD *)(v16 - 8);
  v75 = v16;
  v17 = MEMORY[0x24BDAC7A8](v16);
  v64 = (char *)&v58 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v17);
  v73 = (char *)&v58 - v19;
  v20 = sub_23DE87A8C();
  v21 = *(_QWORD *)(v20 - 8);
  v22 = MEMORY[0x24BDAC7A8](v20);
  v24 = (char *)&v58 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v22);
  v26 = (char *)&v58 - v25;
  if (qword_25432B9F8 != -1)
    swift_once();
  v27 = sub_23DE875B8();
  __swift_project_value_buffer(v27, (uint64_t)qword_25432BDC8);
  v28 = *(void (**)(char *, uint64_t, uint64_t))(v21 + 16);
  v28(v26, a1, v20);
  v29 = sub_23DE875A0();
  v30 = sub_23DE87B88();
  if (os_log_type_enabled(v29, v30))
  {
    v31 = swift_slowAlloc();
    v60 = v3;
    v32 = v31;
    v59 = swift_slowAlloc();
    v78[0] = v59;
    *(_DWORD *)v32 = 136446466;
    v77 = sub_23DE7350C(0xD000000000000025, 0x800000023DE88350, v78);
    sub_23DE87BD0();
    *(_WORD *)(v32 + 12) = 2082;
    v28(v24, (uint64_t)v26, v20);
    v33 = sub_23DE87B10();
    v77 = sub_23DE7350C(v33, v34, v78);
    sub_23DE87BD0();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v21 + 8))(v26, v20);
    _os_log_impl(&dword_23DE6A000, v29, v30, "[%{public}s] Returning placeholder for context: %{public}s", (uint8_t *)v32, 0x16u);
    v35 = v59;
    swift_arrayDestroy();
    MEMORY[0x242647498](v35, -1, -1);
    v36 = v32;
    v3 = v60;
    MEMORY[0x242647498](v36, -1, -1);
  }
  else
  {
    (*(void (**)(char *, uint64_t))(v21 + 8))(v26, v20);
  }

  v37 = v73;
  sub_23DE87450();
  v38 = v75;
  v39 = *(void (**)(char *, char *, uint64_t))(v74 + 16);
  v40 = v64;
  v39(v64, v37, v75);
  v41 = type metadata accessor for MenstrualCyclesWidgetTimelineProvider();
  (*(void (**)(char *, uint64_t, uint64_t))(v61 + 16))(v62, v3 + *(int *)(v41 + 24), v63);
  v42 = v76;
  sub_23DE879B4();
  v39(v40, v37, v38);
  v43 = v65;
  v44 = v66;
  (*(void (**)(char *, char *, uint64_t))(v65 + 16))(v72, v42, v66);
  v45 = type metadata accessor for MenstrualCyclesWidgetEntry.State(0);
  v46 = (uint64_t)v67;
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v45 - 8) + 56))(v67, 1, 1, v45);
  v47 = sub_23DE87A74();
  v48 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v47 - 8) + 56);
  v49 = (uint64_t)v68;
  v48(v68, 1, 1, v47);
  v51 = (int *)v69;
  v50 = (uint64_t)v70;
  v63 = *(int *)(v69 + 28);
  v52 = (uint64_t)&v70[*(int *)(v69 + 32)];
  v48((char *)v52, 1, 1, v47);
  v53 = v50 + v51[9];
  *(_QWORD *)v53 = 0;
  *(_BYTE *)(v53 + 8) = 1;
  v54 = v74;
  v55 = v40;
  v56 = v75;
  (*(void (**)(uint64_t, char *, uint64_t))(v74 + 32))(v50, v55, v75);
  (*(void (**)(uint64_t, char *, uint64_t))(v43 + 32))(v50 + v51[5], v72, v44);
  sub_23DE6C860(v46, v50 + v51[6]);
  *(_QWORD *)(v50 + v63) = 0;
  sub_23DE6C5DC(v49, v52);
  *(_QWORD *)v53 = 0;
  *(_BYTE *)(v53 + 8) = 1;
  sub_23DE73D64(v50, v71, type metadata accessor for MenstrualCyclesWidgetEntry);
  (*(void (**)(char *, uint64_t))(v43 + 8))(v76, v44);
  return (*(uint64_t (**)(char *, uint64_t))(v54 + 8))(v73, v56);
}

void MenstrualCyclesWidgetTimelineProvider.getSnapshot(in:completion:)(uint64_t a1, void (*a2)(uint64_t), uint64_t a3)
{
  uint64_t (*v4)(uint64_t, uint64_t);
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
  uint64_t v28;
  char *v29;
  uint64_t v30;
  char *v31;
  uint64_t v32;
  void (*v33)(char *, uint64_t, uint64_t);
  NSObject *v34;
  os_log_type_t v35;
  _BOOL4 v36;
  uint64_t v37;
  uint64_t v38;
  unint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  void (*v43)(char *, uint64_t, uint64_t);
  uint64_t v44;
  uint64_t v45;
  char *v46;
  int v47;
  char *v48;
  char *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  void (*v53)(char *, uint64_t, uint64_t, uint64_t);
  uint64_t v54;
  uint64_t v55;
  int *v56;
  char *v57;
  uint64_t v58;
  char *v59;
  uint64_t v60;
  uint64_t v61;
  char *v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  id v66;
  void *v67;
  id v68;
  unsigned int v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  void (*v76)(char *, uint64_t, uint64_t, uint64_t);
  uint64_t v77;
  int *v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  char *v86;
  uint64_t v87;
  char *v88;
  char *v89;
  uint64_t v90;
  char *v91;
  char *v92;
  void (*v93)(uint64_t);
  uint64_t v94;
  uint64_t v95;
  char *v96;
  uint64_t v97;
  uint64_t v98;
  char *v99;
  uint64_t v100;
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
  uint64_t v111[2];

  v93 = a2;
  v94 = a3;
  v4 = (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1C68];
  sub_23DE7349C(0, &qword_25432B9D8, (uint64_t (*)(uint64_t))MEMORY[0x24BDFB270], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1C68]);
  MEMORY[0x24BDAC7A8](v5);
  v91 = (char *)&v85 - v6;
  sub_23DE7349C(0, &qword_25432BB38, type metadata accessor for MenstrualCyclesWidgetEntry.State, v4);
  MEMORY[0x24BDAC7A8](v7);
  v88 = (char *)&v85 - v8;
  v87 = type metadata accessor for MenstrualCyclesWidgetEntry(0);
  v9 = MEMORY[0x24BDAC7A8](v87);
  v89 = (char *)&v85 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v9);
  v90 = (uint64_t)&v85 - v11;
  v12 = sub_23DE87A14();
  v105 = *(_QWORD *)(v12 - 8);
  v106 = v12;
  v13 = MEMORY[0x24BDAC7A8](v12);
  v86 = (char *)&v85 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v13);
  v102 = (char *)&v85 - v15;
  v97 = sub_23DE87534();
  v95 = *(_QWORD *)(v97 - 8);
  MEMORY[0x24BDAC7A8](v97);
  v96 = (char *)&v85 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17 = sub_23DE879CC();
  v104 = *(_QWORD *)(v17 - 8);
  v18 = MEMORY[0x24BDAC7A8](v17);
  v92 = (char *)&v85 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v18);
  v21 = (char *)&v85 - v20;
  v107 = sub_23DE8745C();
  v109 = *(_QWORD *)(v107 - 8);
  v22 = MEMORY[0x24BDAC7A8](v107);
  v108 = (char *)&v85 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v22);
  v103 = (char *)&v85 - v24;
  v25 = sub_23DE87A8C();
  v26 = *(_QWORD *)(v25 - 8);
  v27 = MEMORY[0x24BDAC7A8](v25);
  v29 = (char *)&v85 - ((v28 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v27);
  v31 = (char *)&v85 - v30;
  if (qword_25432B9F8 != -1)
    swift_once();
  v32 = sub_23DE875B8();
  __swift_project_value_buffer(v32, (uint64_t)qword_25432BDC8);
  v33 = *(void (**)(char *, uint64_t, uint64_t))(v26 + 16);
  v100 = a1;
  v33(v31, a1, v25);
  v34 = sub_23DE875A0();
  v35 = sub_23DE87B88();
  v36 = os_log_type_enabled(v34, v35);
  v101 = v17;
  v99 = v21;
  if (v36)
  {
    v37 = swift_slowAlloc();
    v85 = swift_slowAlloc();
    v111[0] = v85;
    *(_DWORD *)v37 = 136446466;
    v110 = sub_23DE7350C(0xD000000000000025, 0x800000023DE88350, v111);
    sub_23DE87BD0();
    *(_WORD *)(v37 + 12) = 2082;
    v33(v29, (uint64_t)v31, v25);
    v38 = sub_23DE87B10();
    v110 = sub_23DE7350C(v38, v39, v111);
    v17 = v101;
    sub_23DE87BD0();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v26 + 8))(v31, v25);
    _os_log_impl(&dword_23DE6A000, v34, v35, "[%{public}s] Requesting snapshot for context: %{public}s", (uint8_t *)v37, 0x16u);
    v40 = v85;
    swift_arrayDestroy();
    MEMORY[0x242647498](v40, -1, -1);
    v41 = v37;
    v21 = v99;
    MEMORY[0x242647498](v41, -1, -1);
  }
  else
  {
    (*(void (**)(char *, uint64_t))(v26 + 8))(v31, v25);
  }

  v42 = (uint64_t)v103;
  sub_23DE87450();
  v43 = *(void (**)(char *, uint64_t, uint64_t))(v109 + 16);
  v44 = v107;
  v43(v108, v42, v107);
  v45 = type metadata accessor for MenstrualCyclesWidgetTimelineProvider();
  (*(void (**)(char *, uint64_t, uint64_t))(v95 + 16))(v96, v98 + *(int *)(v45 + 24), v97);
  sub_23DE879B4();
  v46 = v102;
  sub_23DE87A80();
  v47 = (*(uint64_t (**)(char *, uint64_t))(v105 + 88))(v46, v106);
  if (v47 != *MEMORY[0x24BDFAED8] && v47 != *MEMORY[0x24BDFAF08])
  {
    v48 = v108;
    v43(v108, v42, v44);
    v49 = v92;
    (*(void (**)(char *, char *, uint64_t))(v104 + 16))(v92, v21, v17);
    v50 = type metadata accessor for MenstrualCyclesWidgetEntry.State(0);
    v51 = (uint64_t)v88;
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v50 - 8) + 56))(v88, 1, 1, v50);
    v52 = sub_23DE87A74();
    v53 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v52 - 8) + 56);
    v54 = v109;
    v55 = (uint64_t)v91;
    v53(v91, 1, 1, v52);
    v56 = (int *)v87;
    v100 = *(int *)(v87 + 28);
    v57 = v89;
    v58 = (uint64_t)&v89[*(int *)(v87 + 32)];
    v53((char *)v58, 1, 1, v52);
    v59 = &v57[v56[9]];
    *(_QWORD *)v59 = 0;
    v59[8] = 1;
    v60 = v107;
    (*(void (**)(char *, char *, uint64_t))(v54 + 32))(v57, v48, v107);
    v61 = v104;
    v62 = v49;
    v63 = v101;
    (*(void (**)(char *, char *, uint64_t))(v104 + 32))(&v57[v56[5]], v62, v101);
    sub_23DE6C860(v51, (uint64_t)&v57[v56[6]]);
    *(_QWORD *)&v57[v100] = 0;
    sub_23DE6C5DC(v55, v58);
    *(_QWORD *)v59 = 0;
    v59[8] = 1;
    v64 = (uint64_t)v57;
    v65 = v90;
    sub_23DE73D64(v64, v90, type metadata accessor for MenstrualCyclesWidgetEntry);
    v93(v65);
    sub_23DE6EFC4(v65, type metadata accessor for MenstrualCyclesWidgetEntry);
    (*(void (**)(char *, uint64_t))(v61 + 8))(v99, v63);
    (*(void (**)(char *, uint64_t))(v54 + 8))(v103, v60);
    (*(void (**)(char *, uint64_t))(v105 + 8))(v102, v106);
    return;
  }
  v66 = objc_msgSend((id)objc_opt_self(), sel_sharedBehavior);
  if (!v66)
  {
    __break(1u);
    goto LABEL_15;
  }
  v67 = v66;
  v68 = objc_msgSend(v66, sel_features);

  if (!v68)
  {
LABEL_15:
    __break(1u);
    return;
  }
  v69 = objc_msgSend(v68, sel_seahorse);

  if (v69)
  {
    v70 = (uint64_t)v86;
    sub_23DE87A80();
    v71 = swift_allocObject();
    *(_QWORD *)(v71 + 16) = v93;
    *(_QWORD *)(v71 + 24) = v94;
    swift_retain();
    sub_23DE7E6B0(v42, v70, (uint64_t)sub_23DE73B98, v71);
    swift_release();
    (*(void (**)(uint64_t, uint64_t))(v105 + 8))(v70, v106);
    (*(void (**)(char *, uint64_t))(v104 + 8))(v21, v17);
    (*(void (**)(uint64_t, uint64_t))(v109 + 8))(v42, v44);
  }
  else
  {
    v43(v108, v42, v44);
    (*(void (**)(char *, char *, uint64_t))(v104 + 16))(v92, v21, v17);
    sub_23DE6D5EC();
    v73 = (uint64_t)v88;
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v72 - 8) + 56))(v88, 1, 1, v72);
    v74 = type metadata accessor for MenstrualCyclesWidgetEntry.State(0);
    (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v74 - 8) + 56))(v73, 0, 1, v74);
    v75 = sub_23DE87A74();
    v76 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v75 - 8) + 56);
    v77 = (uint64_t)v91;
    v76(v91, 1, 1, v75);
    v78 = (int *)v87;
    v106 = *(int *)(v87 + 28);
    v79 = (uint64_t)v89;
    v80 = (uint64_t)&v89[*(int *)(v87 + 32)];
    v76((char *)v80, 1, 1, v75);
    v81 = v79 + v78[9];
    *(_QWORD *)v81 = 0;
    *(_BYTE *)(v81 + 8) = 1;
    (*(void (**)(uint64_t, char *, uint64_t))(v109 + 32))(v79, v108, v44);
    v82 = v104;
    v83 = v101;
    (*(void (**)(uint64_t, char *, uint64_t))(v104 + 32))(v79 + v78[5], v92, v101);
    sub_23DE6C860(v73, v79 + v78[6]);
    *(_QWORD *)(v79 + v106) = 0;
    sub_23DE6C5DC(v77, v80);
    *(_QWORD *)v81 = 0;
    *(_BYTE *)(v81 + 8) = 1;
    v84 = v90;
    sub_23DE73D64(v79, v90, type metadata accessor for MenstrualCyclesWidgetEntry);
    v93(v84);
    sub_23DE6EFC4(v84, type metadata accessor for MenstrualCyclesWidgetEntry);
    (*(void (**)(char *, uint64_t))(v82 + 8))(v21, v83);
    (*(void (**)(uint64_t, uint64_t))(v109 + 8))(v42, v107);
  }
}

uint64_t sub_23DE70154(uint64_t a1, uint64_t (*a2)(_QWORD), uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  NSObject *v13;
  os_log_type_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t v20;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t (*v25)(_QWORD);
  uint64_t v26;
  uint64_t v27;

  sub_23DE7349C(0, &qword_25432B9D8, (uint64_t (*)(uint64_t))MEMORY[0x24BDFB270], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1C68]);
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)&v22 - v7;
  v9 = type metadata accessor for MenstrualCyclesWidgetEntry(0);
  MEMORY[0x24BDAC7A8](v9);
  v11 = (char *)&v22 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_25432B9F8 != -1)
    swift_once();
  v12 = sub_23DE875B8();
  __swift_project_value_buffer(v12, (uint64_t)qword_25432BDC8);
  sub_23DE73DA8(a1, (uint64_t)v11, type metadata accessor for MenstrualCyclesWidgetEntry);
  v13 = sub_23DE875A0();
  v14 = sub_23DE87B88();
  if (os_log_type_enabled(v13, v14))
  {
    v15 = swift_slowAlloc();
    v16 = swift_slowAlloc();
    v25 = a2;
    v17 = v16;
    v27 = v16;
    *(_DWORD *)v15 = 136446466;
    v24 = a3;
    v26 = sub_23DE7350C(0xD000000000000025, 0x800000023DE88350, &v27);
    v23 = a1;
    sub_23DE87BD0();
    *(_WORD *)(v15 + 12) = 2080;
    sub_23DE74388((uint64_t)&v11[*(int *)(v9 + 32)], (uint64_t)v8, &qword_25432B9D8, (uint64_t (*)(uint64_t))MEMORY[0x24BDFB270]);
    v18 = sub_23DE87B10();
    v26 = sub_23DE7350C(v18, v19, &v27);
    a1 = v23;
    sub_23DE87BD0();
    swift_bridgeObjectRelease();
    sub_23DE6EFC4((uint64_t)v11, type metadata accessor for MenstrualCyclesWidgetEntry);
    _os_log_impl(&dword_23DE6A000, v13, v14, "[%{public}s] Submitting entry with relevance: %s", (uint8_t *)v15, 0x16u);
    swift_arrayDestroy();
    v20 = v17;
    a2 = v25;
    MEMORY[0x242647498](v20, -1, -1);
    MEMORY[0x242647498](v15, -1, -1);
  }
  else
  {
    sub_23DE6EFC4((uint64_t)v11, type metadata accessor for MenstrualCyclesWidgetEntry);
  }

  return a2(a1);
}

uint64_t MenstrualCyclesWidgetTimelineProvider.getTimeline(in:completion:)(uint64_t a1, void (*a2)(char *), void (*a3)(char *))
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, uint64_t);
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
  _QWORD *v31;
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
  char *v44;
  uint64_t v45;
  void (*v46)(char *, uint64_t, uint64_t);
  NSObject *v47;
  os_log_type_t v48;
  _BOOL4 v49;
  uint64_t v50;
  uint64_t v51;
  unint64_t v52;
  uint64_t v53;
  uint64_t v54;
  void (*v55)(char *, uint64_t, uint64_t);
  uint64_t v56;
  void (*v57)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v58;
  char *v59;
  uint64_t v60;
  _QWORD *v61;
  unsigned int (*v62)(uint64_t, uint64_t, uint64_t);
  uint64_t v63;
  void (*v64)(char *, uint64_t, uint64_t);
  char *v65;
  uint64_t v66;
  void (*v67)(char *, uint64_t, uint64_t);
  char *v68;
  int v69;
  char *v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  void (*v75)(char *, uint64_t, uint64_t, uint64_t);
  uint64_t v76;
  int *v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  char *v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  unint64_t v85;
  uint64_t v86;
  char *v87;
  uint64_t v89;
  uint64_t (*v90)(uint64_t);
  uint64_t v91;
  char *v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  unint64_t v96;
  unint64_t v97;
  uint64_t v98;
  void (**v99)(char *);
  void (*v100)(char *);
  uint64_t v101;
  void (*v102)(uint64_t, uint64_t);
  uint64_t v103;
  uint64_t v104;
  char *v105;
  uint64_t v106;
  uint64_t v107;
  int v108;
  char *v109;
  uint64_t v110;
  char *v111;
  char *v112;
  uint64_t v113;
  char *v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  char *v119;
  char *v120;
  char *v121;
  uint64_t v122;
  void (*v123)(char *);
  void (*v124)(char *);
  uint64_t v125;
  char *v126;
  char *v127;
  void (*v128)(char *, uint64_t, uint64_t);
  char *v129;
  uint64_t v130;
  char *v131;
  uint64_t v132;
  uint64_t v133;
  uint64_t v134;
  char *v135;
  uint64_t v136;
  uint64_t v137;
  char *v138;
  uint64_t v139;
  _QWORD *v140;
  uint64_t v141;
  char *v142;
  uint64_t v143;
  uint64_t v144;
  uint64_t v145;

  v124 = a3;
  v123 = a2;
  v4 = sub_23DE87A5C();
  MEMORY[0x24BDAC7A8](v4);
  v120 = (char *)&v103 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23DE73BA0();
  v117 = v6;
  v118 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v119 = (char *)&v103 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1C68];
  sub_23DE7349C(0, &qword_25432B9D8, (uint64_t (*)(uint64_t))MEMORY[0x24BDFB270], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1C68]);
  MEMORY[0x24BDAC7A8](v9);
  v114 = (char *)&v103 - v10;
  sub_23DE7349C(0, &qword_25432BB38, type metadata accessor for MenstrualCyclesWidgetEntry.State, v8);
  MEMORY[0x24BDAC7A8](v11);
  v112 = (char *)&v103 - v12;
  v116 = type metadata accessor for MenstrualCyclesWidgetEntry(0);
  v113 = *(_QWORD *)(v116 - 8);
  v13 = MEMORY[0x24BDAC7A8](v116);
  v111 = (char *)&v103 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v13);
  v115 = (uint64_t)&v103 - v15;
  v136 = sub_23DE87A14();
  v139 = *(_QWORD *)(v136 - 8);
  MEMORY[0x24BDAC7A8](v136);
  v138 = (char *)&v103 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17 = sub_23DE87528();
  v130 = *(_QWORD *)(v17 - 8);
  MEMORY[0x24BDAC7A8](v17);
  v127 = (char *)&v103 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23DE7349C(0, &qword_25432B9F0, (uint64_t (*)(uint64_t))MEMORY[0x24BDCE900], v8);
  v20 = MEMORY[0x24BDAC7A8](v19);
  v110 = (uint64_t)&v103 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  v22 = MEMORY[0x24BDAC7A8](v20);
  v129 = (char *)&v103 - v23;
  MEMORY[0x24BDAC7A8](v22);
  v143 = (uint64_t)&v103 - v24;
  v25 = sub_23DE87534();
  v125 = *(_QWORD *)(v25 - 8);
  MEMORY[0x24BDAC7A8](v25);
  v126 = (char *)&v103 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0);
  v137 = sub_23DE879CC();
  v133 = *(_QWORD *)(v137 - 8);
  v27 = MEMORY[0x24BDAC7A8](v137);
  v131 = (char *)&v103 - ((v28 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v27);
  v142 = (char *)&v103 - v29;
  v30 = sub_23DE8745C();
  v31 = *(_QWORD **)(v30 - 8);
  v32 = MEMORY[0x24BDAC7A8](v30);
  v105 = (char *)&v103 - ((v33 + 15) & 0xFFFFFFFFFFFFFFF0);
  v34 = MEMORY[0x24BDAC7A8](v32);
  v109 = (char *)&v103 - v35;
  v36 = MEMORY[0x24BDAC7A8](v34);
  v135 = (char *)&v103 - v37;
  MEMORY[0x24BDAC7A8](v36);
  v141 = (uint64_t)&v103 - v38;
  v39 = sub_23DE87A8C();
  v40 = *(_QWORD *)(v39 - 8);
  v41 = MEMORY[0x24BDAC7A8](v39);
  v121 = (char *)&v103 - ((v42 + 15) & 0xFFFFFFFFFFFFFFF0);
  v106 = v42;
  MEMORY[0x24BDAC7A8](v41);
  v44 = (char *)&v103 - v43;
  if (qword_25432B9F8 != -1)
    swift_once();
  v45 = sub_23DE875B8();
  __swift_project_value_buffer(v45, (uint64_t)qword_25432BDC8);
  v46 = *(void (**)(char *, uint64_t, uint64_t))(v40 + 16);
  v46(v44, a1, v39);
  v47 = sub_23DE875A0();
  v48 = sub_23DE87B88();
  v108 = v48;
  v49 = os_log_type_enabled(v47, v48);
  v140 = v31;
  v132 = a1;
  v107 = v39;
  v122 = v40;
  v128 = v46;
  if (v49)
  {
    v50 = swift_slowAlloc();
    v103 = swift_slowAlloc();
    v145 = v103;
    *(_DWORD *)v50 = 136446466;
    v144 = sub_23DE7350C(0xD000000000000025, 0x800000023DE88350, &v145);
    v104 = v25;
    sub_23DE87BD0();
    *(_WORD *)(v50 + 12) = 2082;
    v46(v121, (uint64_t)v44, v39);
    v51 = sub_23DE87B10();
    v144 = sub_23DE7350C(v51, v52, &v145);
    v25 = v104;
    sub_23DE87BD0();
    v31 = v140;
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v122 + 8))(v44, v39);
    _os_log_impl(&dword_23DE6A000, v47, (os_log_type_t)v108, "[%{public}s] Requesting timeline for context: %{public}s", (uint8_t *)v50, 0x16u);
    v53 = v103;
    swift_arrayDestroy();
    MEMORY[0x242647498](v53, -1, -1);
    MEMORY[0x242647498](v50, -1, -1);
  }
  else
  {
    (*(void (**)(char *, uint64_t))(v40 + 8))(v44, v39);
  }

  v54 = v141;
  sub_23DE87450();
  v55 = (void (*)(char *, uint64_t, uint64_t))v31[2];
  v55(v135, v54, v30);
  v56 = type metadata accessor for MenstrualCyclesWidgetTimelineProvider();
  (*(void (**)(char *, uint64_t, uint64_t))(v125 + 16))(v126, v134 + *(int *)(v56 + 24), v25);
  sub_23DE879B4();
  v57 = (void (*)(uint64_t, uint64_t, uint64_t, uint64_t))v31[7];
  v57(v143, 1, 1, v30);
  v58 = v130;
  v59 = v127;
  (*(void (**)(char *, _QWORD, uint64_t))(v130 + 104))(v127, *MEMORY[0x24BDCF250], v17);
  v60 = (uint64_t)v129;
  sub_23DE87510();
  (*(void (**)(char *, uint64_t))(v58 + 8))(v59, v17);
  v61 = v31;
  v62 = (unsigned int (*)(uint64_t, uint64_t, uint64_t))v31[6];
  if (v62(v60, 1, v30) == 1)
  {
    sub_23DE73D20(v60, &qword_25432B9F0, (uint64_t (*)(uint64_t))MEMORY[0x24BDCE900]);
  }
  else
  {
    v63 = v143;
    sub_23DE73D20(v143, &qword_25432B9F0, (uint64_t (*)(uint64_t))MEMORY[0x24BDCE900]);
    v64 = (void (*)(char *, uint64_t, uint64_t))v61[4];
    v65 = v109;
    v64(v109, v60, v30);
    v64((char *)v63, (uint64_t)v65, v30);
    v57(v63, 0, 1, v30);
  }
  v66 = v132;
  v67 = v128;
  v68 = v138;
  sub_23DE87A80();
  v69 = (*(uint64_t (**)(char *, uint64_t))(v139 + 88))(v68, v136);
  if (v69 == *MEMORY[0x24BDFAED8] || v69 == *MEMORY[0x24BDFAF08])
  {
    v89 = v110;
    sub_23DE74388(v143, v110, &qword_25432B9F0, (uint64_t (*)(uint64_t))MEMORY[0x24BDCE900]);
    if (v62(v89, 1, v30) == 1)
    {
      v90 = (uint64_t (*)(uint64_t))MEMORY[0x24BDCE900];
      sub_23DE73D20(v143, &qword_25432B9F0, (uint64_t (*)(uint64_t))MEMORY[0x24BDCE900]);
      (*(void (**)(char *, uint64_t))(v133 + 8))(v142, v137);
      ((void (*)(uint64_t, uint64_t))v140[1])(v141, v30);
      return sub_23DE73D20(v89, &qword_25432B9F0, v90);
    }
    else
    {
      v91 = (uint64_t)v105;
      ((void (*)(char *, uint64_t, uint64_t))v140[4])(v105, v89, v30);
      v92 = v121;
      v93 = v66;
      v94 = v107;
      v67(v121, v93, v107);
      v95 = v122;
      v96 = (*(unsigned __int8 *)(v122 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v122 + 80);
      v97 = (v106 + v96 + 7) & 0xFFFFFFFFFFFFFFF8;
      v98 = swift_allocObject();
      (*(void (**)(unint64_t, char *, uint64_t))(v95 + 32))(v98 + v96, v92, v94);
      v99 = (void (**)(char *))(v98 + v97);
      v100 = v124;
      *v99 = v123;
      v99[1] = v100;
      swift_retain();
      v101 = v141;
      sub_23DE7B9DC(v141, v91, (uint64_t)sub_23DE73CC0, v98);
      swift_release();
      v102 = (void (*)(uint64_t, uint64_t))v140[1];
      v102(v91, v30);
      sub_23DE73D20(v143, &qword_25432B9F0, (uint64_t (*)(uint64_t))MEMORY[0x24BDCE900]);
      (*(void (**)(char *, uint64_t))(v133 + 8))(v142, v137);
      return ((uint64_t (*)(uint64_t, uint64_t))v102)(v101, v30);
    }
  }
  else
  {
    v70 = v135;
    v55(v135, v141, v30);
    v71 = v133;
    (*(void (**)(char *, char *, uint64_t))(v133 + 16))(v131, v142, v137);
    v72 = type metadata accessor for MenstrualCyclesWidgetEntry.State(0);
    v73 = (uint64_t)v112;
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v72 - 8) + 56))(v112, 1, 1, v72);
    v74 = sub_23DE87A74();
    v75 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v74 - 8) + 56);
    v76 = (uint64_t)v114;
    v75(v114, 1, 1, v74);
    v77 = (int *)v116;
    v134 = *(int *)(v116 + 28);
    v78 = (uint64_t)v111;
    v79 = (uint64_t)&v111[*(int *)(v116 + 32)];
    v75((char *)v79, 1, 1, v74);
    v80 = v78 + v77[9];
    *(_QWORD *)v80 = 0;
    *(_BYTE *)(v80 + 8) = 1;
    v81 = v70;
    v82 = v30;
    ((void (*)(uint64_t, char *, uint64_t))v140[4])(v78, v81, v30);
    v83 = v137;
    (*(void (**)(uint64_t, char *, uint64_t))(v71 + 32))(v78 + v77[5], v131, v137);
    sub_23DE6C860(v73, v78 + v77[6]);
    *(_QWORD *)(v78 + v134) = 0;
    sub_23DE6C5DC(v76, v79);
    *(_QWORD *)v80 = 0;
    *(_BYTE *)(v80 + 8) = 1;
    v84 = v115;
    sub_23DE73D64(v78, v115, type metadata accessor for MenstrualCyclesWidgetEntry);
    sub_23DE7349C(0, &qword_256D0D278, type metadata accessor for MenstrualCyclesWidgetEntry, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE3598]);
    v85 = (*(unsigned __int8 *)(v113 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v113 + 80);
    v86 = swift_allocObject();
    *(_OWORD *)(v86 + 16) = xmmword_23DE88350;
    sub_23DE73DA8(v84, v86 + v85, type metadata accessor for MenstrualCyclesWidgetEntry);
    sub_23DE87A50();
    sub_23DE73C00();
    v87 = v119;
    sub_23DE87A98();
    v123(v87);
    (*(void (**)(char *, uint64_t))(v118 + 8))(v87, v117);
    sub_23DE6EFC4(v84, type metadata accessor for MenstrualCyclesWidgetEntry);
    sub_23DE73D20(v143, &qword_25432B9F0, (uint64_t (*)(uint64_t))MEMORY[0x24BDCE900]);
    (*(void (**)(char *, uint64_t))(v71 + 8))(v142, v83);
    ((void (*)(uint64_t, uint64_t))v140[1])(v141, v82);
    return (*(uint64_t (**)(char *, uint64_t))(v139 + 8))(v138, v136);
  }
}

uint64_t sub_23DE710B8(uint64_t a1, uint64_t a2, void (*a3)(_QWORD), uint64_t a4)
{
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
  void (*v19)(char *, uint64_t, uint64_t);
  NSObject *v20;
  os_log_type_t v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  uint64_t v25;
  char *v26;
  _QWORD v28[2];
  void (*v29)(_QWORD);
  char *v30;
  char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;

  v34 = a1;
  v7 = sub_23DE87A5C();
  MEMORY[0x24BDAC7A8](v7);
  v31 = (char *)v28 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23DE73BA0();
  v32 = *(_QWORD *)(v9 - 8);
  v33 = v9;
  MEMORY[0x24BDAC7A8](v9);
  v30 = (char *)v28 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = sub_23DE87A8C();
  v12 = *(_QWORD *)(v11 - 8);
  v13 = MEMORY[0x24BDAC7A8](v11);
  v15 = (char *)v28 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v13);
  v17 = (char *)v28 - v16;
  if (qword_25432B9F8 != -1)
    swift_once();
  v18 = sub_23DE875B8();
  __swift_project_value_buffer(v18, (uint64_t)qword_25432BDC8);
  v19 = *(void (**)(char *, uint64_t, uint64_t))(v12 + 16);
  v19(v17, a2, v11);
  v20 = sub_23DE875A0();
  v21 = sub_23DE87B88();
  if (os_log_type_enabled(v20, v21))
  {
    v22 = swift_slowAlloc();
    v28[0] = swift_slowAlloc();
    v36 = v28[0];
    *(_DWORD *)v22 = 136446466;
    v29 = a3;
    v35 = sub_23DE7350C(0xD000000000000025, 0x800000023DE88350, &v36);
    v28[1] = a4;
    sub_23DE87BD0();
    *(_WORD *)(v22 + 12) = 2082;
    v19(v15, (uint64_t)v17, v11);
    v23 = sub_23DE87B10();
    v35 = sub_23DE7350C(v23, v24, &v36);
    a3 = v29;
    sub_23DE87BD0();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v12 + 8))(v17, v11);
    _os_log_impl(&dword_23DE6A000, v20, v21, "[%{public}s] Returning timeline for context: %{public}s", (uint8_t *)v22, 0x16u);
    v25 = v28[0];
    swift_arrayDestroy();
    MEMORY[0x242647498](v25, -1, -1);
    MEMORY[0x242647498](v22, -1, -1);
  }
  else
  {
    (*(void (**)(char *, uint64_t))(v12 + 8))(v17, v11);
  }

  swift_bridgeObjectRetain();
  sub_23DE87A44();
  type metadata accessor for MenstrualCyclesWidgetEntry(0);
  sub_23DE73C00();
  v26 = v30;
  sub_23DE87A98();
  a3(v26);
  return (*(uint64_t (**)(char *, uint64_t))(v32 + 8))(v26, v33);
}

uint64_t sub_23DE7140C(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;

  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v3;
  *v3 = v1;
  v3[1] = sub_23DE74484;
  return MenstrualCyclesWidgetTimelineProvider.relevances()(a1);
}

uint64_t MenstrualCyclesWidgetTimelineProvider.relevances()(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;

  v2[6] = a1;
  v2[7] = v1;
  v3 = sub_23DE87A14();
  v2[8] = v3;
  v2[9] = *(_QWORD *)(v3 - 8);
  v2[10] = swift_task_alloc();
  v4 = sub_23DE8745C();
  v2[11] = v4;
  v2[12] = *(_QWORD *)(v4 - 8);
  v2[13] = swift_task_alloc();
  v2[14] = type metadata accessor for MenstrualCyclesWidgetEntry(0);
  v2[15] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_23DE71508()
{
  _QWORD *v0;
  uint64_t v1;
  NSObject *v2;
  os_log_type_t v3;
  uint8_t *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  _QWORD *v12;
  uint64_t v14;

  if (qword_25432B9F8 != -1)
    swift_once();
  v1 = sub_23DE875B8();
  v0[16] = __swift_project_value_buffer(v1, (uint64_t)qword_25432BDC8);
  v2 = sub_23DE875A0();
  v3 = sub_23DE87B88();
  if (os_log_type_enabled(v2, v3))
  {
    v4 = (uint8_t *)swift_slowAlloc();
    v5 = swift_slowAlloc();
    v14 = v5;
    *(_DWORD *)v4 = 136446210;
    v0[5] = sub_23DE7350C(0xD000000000000025, 0x800000023DE88350, &v14);
    sub_23DE87BD0();
    _os_log_impl(&dword_23DE6A000, v2, v3, "[%{public}s] Fetching widget relevance", v4, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x242647498](v5, -1, -1);
    MEMORY[0x242647498](v4, -1, -1);
  }

  v6 = v0[13];
  v8 = v0[9];
  v7 = v0[10];
  v10 = v0[7];
  v9 = v0[8];
  sub_23DE87450();
  (*(void (**)(uint64_t, _QWORD, uint64_t))(v8 + 104))(v7, *MEMORY[0x24BDFAF08], v9);
  v11 = (_QWORD *)swift_task_alloc();
  v0[17] = v11;
  v11[2] = v10;
  v11[3] = v6;
  v11[4] = v7;
  v12 = (_QWORD *)swift_task_alloc();
  v0[18] = v12;
  *v12 = v0;
  v12[1] = sub_23DE7172C;
  return sub_23DE87C84();
}

uint64_t sub_23DE7172C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v2 = *(_QWORD *)(*(_QWORD *)v0 + 96);
  v1 = *(_QWORD *)(*(_QWORD *)v0 + 104);
  v4 = *(_QWORD *)(*(_QWORD *)v0 + 80);
  v3 = *(_QWORD *)(*(_QWORD *)v0 + 88);
  v5 = *(_QWORD *)(*(_QWORD *)v0 + 64);
  v6 = *(_QWORD *)(*(_QWORD *)v0 + 72);
  swift_task_dealloc();
  swift_task_dealloc();
  (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v4, v5);
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  return swift_task_switch();
}

uint64_t sub_23DE717CC()
{
  uint64_t v0;
  id v1;
  uint64_t v2;
  NSObject *v3;
  os_log_type_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  os_log_type_t v13;
  uint8_t *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v18;

  v1 = MenstrualCyclesWidgetRelevanceProvider.widgetRelevances(_:)(*(_QWORD *)(v0 + 120));
  v2 = MEMORY[0x24BEE4AE0];
  if (v1)
  {
    swift_bridgeObjectRetain_n();
    v3 = sub_23DE875A0();
    v4 = sub_23DE87B88();
    if (os_log_type_enabled(v3, v4))
    {
      v5 = swift_slowAlloc();
      v6 = swift_slowAlloc();
      v18 = v6;
      *(_DWORD *)v5 = 136446466;
      *(_QWORD *)(v0 + 24) = sub_23DE7350C(0xD000000000000025, 0x800000023DE88350, &v18);
      sub_23DE87BD0();
      *(_WORD *)(v5 + 12) = 2082;
      sub_23DE7443C(0, &qword_256D0D288, v2 + 8, MEMORY[0x24BDFAE00]);
      v8 = v7;
      v9 = swift_bridgeObjectRetain();
      v10 = MEMORY[0x242646F28](v9, v8);
      v12 = v11;
      swift_bridgeObjectRelease();
      *(_QWORD *)(v0 + 32) = sub_23DE7350C(v10, v12, &v18);
      sub_23DE87BD0();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_23DE6A000, v3, v4, "[%{public}s] Returning widget relevances %{public}s", (uint8_t *)v5, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x242647498](v6, -1, -1);
      MEMORY[0x242647498](v5, -1, -1);
    }
    else
    {
      swift_bridgeObjectRelease_n();
    }
  }
  else
  {
    v3 = sub_23DE875A0();
    v13 = sub_23DE87B88();
    if (os_log_type_enabled(v3, v13))
    {
      v14 = (uint8_t *)swift_slowAlloc();
      v15 = swift_slowAlloc();
      v18 = v15;
      *(_DWORD *)v14 = 136446210;
      *(_QWORD *)(v0 + 16) = sub_23DE7350C(0xD000000000000025, 0x800000023DE88350, &v18);
      sub_23DE87BD0();
      _os_log_impl(&dword_23DE6A000, v3, v13, "[%{public}s] No widget relevance", v14, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x242647498](v15, -1, -1);
      MEMORY[0x242647498](v14, -1, -1);
    }
  }

  v16 = *(_QWORD *)(v0 + 120);
  sub_23DE879F0();
  sub_23DE6EFC4(v16, type metadata accessor for MenstrualCyclesWidgetEntry);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_23DE71B14()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 16) = v1;
  *v1 = v0;
  v1[1] = sub_23DE74484;
  return sub_23DE87A20();
}

id MenstrualCyclesWidgetRelevanceProvider.widgetRelevances(_:)(uint64_t a1)
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
  char *v17;
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
  uint64_t v30;
  uint64_t v31;
  id *v32;
  uint64_t v33;
  char *v34;
  int *v35;
  uint64_t v36;
  id result;
  void *v38;
  unsigned int v39;
  uint64_t v40;
  NSObject *v41;
  os_log_type_t v42;
  uint8_t *v43;
  uint64_t v44;
  const char *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  char *v51;
  uint64_t v52;
  char *v53;
  void *v54;
  char *v55;
  char v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t *v59;
  uint64_t v60;
  uint64_t v61;
  void (*v62)(char *, char *, uint64_t);
  char *v63;
  NSObject *v64;
  os_log_type_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  char *v69;
  id v70;
  uint64_t v71;
  unint64_t v72;
  unint64_t v73;
  void (*v74)(char *, uint64_t);
  uint64_t v75;
  void *v76;
  unsigned int v77;
  id *v78;
  uint64_t v79;
  NSObject *v80;
  os_log_type_t v81;
  uint8_t *v82;
  uint64_t v83;
  const char *v84;
  uint64_t v85;
  uint64_t v86;
  char *v87;
  char *v88;
  uint64_t v89;
  void (*v90)(char *, uint64_t);
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  void (*v95)(char *, char *, uint64_t);
  char *v96;
  NSObject *v97;
  os_log_type_t v98;
  uint64_t v99;
  char *v100;
  id v101;
  uint64_t v102;
  uint64_t v103;
  unint64_t v104;
  unint64_t v105;
  void (*v106)(char *, uint64_t);
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  void (*v110)(char *, char *, uint64_t);
  char *v111;
  char *v112;
  NSObject *v113;
  os_log_type_t v114;
  int v115;
  uint64_t v116;
  uint64_t v117;
  char *v118;
  id v119;
  uint64_t v120;
  uint64_t v121;
  unint64_t v122;
  unint64_t v123;
  void (*v124)(char *, uint64_t);
  id v125;
  uint64_t v126;
  unint64_t v127;
  char *v128;
  uint64_t v129;
  void *v130;
  unsigned int v131;
  uint64_t v132;
  NSObject *v133;
  os_log_type_t v134;
  uint8_t *v135;
  uint64_t v136;
  const char *v137;
  void (*v138)(char *, uint64_t);
  char *v139;
  uint64_t v140;
  uint64_t v141;
  uint64_t v142;
  char *v143;
  void (*v144)(char *, uint64_t);
  uint64_t v145;
  id *v146;
  char *v147;
  char *v148;
  char *v149;
  char *v150;
  char *v151;
  char *v152;
  uint64_t v153;
  uint64_t v154;
  uint64_t v155;
  uint64_t v156;
  char *v157;
  uint64_t v158;
  uint64_t v159;
  char *v160;
  uint64_t v161;
  char *v162;
  uint64_t v163;
  uint64_t v164;
  char *v165;
  char *v166;
  uint64_t v167;
  uint64_t v168;
  uint64_t v169[4];
  uint64_t v170[2];

  v2 = sub_23DE8745C();
  v155 = *(_QWORD *)(v2 - 8);
  v156 = v2;
  MEMORY[0x24BDAC7A8](v2);
  v157 = (char *)&v145 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v159 = sub_23DE879CC();
  v164 = *(_QWORD *)(v159 - 8);
  v4 = MEMORY[0x24BDAC7A8](v159);
  v151 = (char *)&v145 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = MEMORY[0x24BDAC7A8](v4);
  v148 = (char *)&v145 - v7;
  v8 = MEMORY[0x24BDAC7A8](v6);
  v149 = (char *)&v145 - v9;
  v10 = MEMORY[0x24BDAC7A8](v8);
  v150 = (char *)&v145 - v11;
  v12 = MEMORY[0x24BDAC7A8](v10);
  v147 = (char *)&v145 - v13;
  MEMORY[0x24BDAC7A8](v12);
  v165 = (char *)&v145 - v14;
  v15 = sub_23DE874A4();
  v153 = *(_QWORD *)(v15 - 8);
  v154 = v15;
  MEMORY[0x24BDAC7A8](v15);
  v17 = (char *)&v145 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18 = sub_23DE87534();
  v167 = *(_QWORD *)(v18 - 8);
  v168 = v18;
  v19 = MEMORY[0x24BDAC7A8](v18);
  v152 = (char *)&v145 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v19);
  v166 = (char *)&v145 - v21;
  v163 = sub_23DE87300();
  v161 = *(_QWORD *)(v163 - 8);
  MEMORY[0x24BDAC7A8](v163);
  v160 = (char *)&v145 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  v23 = sub_23DE87318();
  MEMORY[0x24BDAC7A8](v23);
  v162 = (char *)&v145 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23DE7349C(0, &qword_25432BB38, type metadata accessor for MenstrualCyclesWidgetEntry.State, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1C68]);
  MEMORY[0x24BDAC7A8](v25);
  v27 = (char *)&v145 - v26;
  v28 = type metadata accessor for MenstrualCyclesWidgetEntry.State(0);
  v29 = *(_QWORD *)(v28 - 8);
  v30 = MEMORY[0x24BDAC7A8](v28);
  v32 = (id *)((char *)&v145 - ((v31 + 15) & 0xFFFFFFFFFFFFFFF0));
  MEMORY[0x24BDAC7A8](v30);
  v34 = (char *)&v145 - v33;
  v35 = (int *)type metadata accessor for MenstrualCyclesWidgetEntry(0);
  v36 = v35[6];
  v158 = a1;
  sub_23DE74388(a1 + v36, (uint64_t)v27, &qword_25432BB38, type metadata accessor for MenstrualCyclesWidgetEntry.State);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v29 + 48))(v27, 1, v28) == 1)
  {
    sub_23DE73D20((uint64_t)v27, &qword_25432BB38, type metadata accessor for MenstrualCyclesWidgetEntry.State);
    result = objc_msgSend((id)objc_opt_self(), sel_sharedBehavior);
    if (result)
    {
      v38 = result;
      v39 = objc_msgSend(result, sel_showSensitiveLogItems);

      if (v39)
      {
        if (qword_25432B9F8 != -1)
          swift_once();
        v40 = sub_23DE875B8();
        __swift_project_value_buffer(v40, (uint64_t)qword_25432BDC8);
        v41 = sub_23DE875A0();
        v42 = sub_23DE87B88();
        if (!os_log_type_enabled(v41, v42))
          goto LABEL_28;
        v43 = (uint8_t *)swift_slowAlloc();
        v44 = swift_slowAlloc();
        v169[0] = v44;
        *(_DWORD *)v43 = 136315138;
        v170[0] = sub_23DE7350C(0xD000000000000026, 0x800000023DE88380, v169);
        sub_23DE87BD0();
        v45 = "[%s] WidgetEntry pregnancy state was nil. Returning no relevance entries";
      }
      else
      {
        if (qword_25432B9F8 != -1)
          swift_once();
        v85 = sub_23DE875B8();
        __swift_project_value_buffer(v85, (uint64_t)qword_25432BDC8);
        v41 = sub_23DE875A0();
        v42 = sub_23DE87B88();
        if (!os_log_type_enabled(v41, v42))
          goto LABEL_28;
        v43 = (uint8_t *)swift_slowAlloc();
        v44 = swift_slowAlloc();
        v169[0] = v44;
        *(_DWORD *)v43 = 136315138;
        v170[0] = sub_23DE7350C(0xD000000000000026, 0x800000023DE88380, v169);
        sub_23DE87BD0();
        v45 = "[%s] Returning no relevance entries";
      }
      _os_log_impl(&dword_23DE6A000, v41, v42, v45, v43, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x242647498](v44, -1, -1);
      MEMORY[0x242647498](v43, -1, -1);
LABEL_28:

      return 0;
    }
    __break(1u);
    goto LABEL_65;
  }
  sub_23DE73D64((uint64_t)v27, (uint64_t)v34, type metadata accessor for MenstrualCyclesWidgetEntry.State);
  sub_23DE73DA8((uint64_t)v34, (uint64_t)v32, type metadata accessor for MenstrualCyclesWidgetEntry.State);
  sub_23DE6D5EC();
  v47 = v46;
  v48 = (uint64_t)v34;
  if ((*(unsigned int (**)(id *, uint64_t, uint64_t))(*(_QWORD *)(v46 - 8) + 48))(v32, 1, v46) != 1)
  {

    result = objc_msgSend((id)objc_opt_self(), sel_sharedBehavior);
    if (!result)
    {
LABEL_65:
      __break(1u);
      goto LABEL_66;
    }
    v76 = result;
    v77 = objc_msgSend(result, sel_showSensitiveLogItems);

    v78 = v32;
    if (v77)
    {
      if (qword_25432B9F8 != -1)
        swift_once();
      v79 = sub_23DE875B8();
      __swift_project_value_buffer(v79, (uint64_t)qword_25432BDC8);
      v80 = sub_23DE875A0();
      v81 = sub_23DE87B88();
      if (!os_log_type_enabled(v80, v81))
        goto LABEL_34;
      v82 = (uint8_t *)swift_slowAlloc();
      v83 = swift_slowAlloc();
      v169[0] = v83;
      *(_DWORD *)v82 = 136315138;
      v170[0] = sub_23DE7350C(0xD000000000000026, 0x800000023DE88380, v169);
      sub_23DE87BD0();
      v84 = "[%s] Pregnancy state is ongoing. Returning relevance entries";
    }
    else
    {
      if (qword_25432B9F8 != -1)
        swift_once();
      v86 = sub_23DE875B8();
      __swift_project_value_buffer(v86, (uint64_t)qword_25432BDC8);
      v80 = sub_23DE875A0();
      v81 = sub_23DE87B88();
      if (!os_log_type_enabled(v80, v81))
        goto LABEL_34;
      v82 = (uint8_t *)swift_slowAlloc();
      v83 = swift_slowAlloc();
      v169[0] = v83;
      *(_DWORD *)v82 = 136315138;
      v170[0] = sub_23DE7350C(0xD000000000000026, 0x800000023DE88380, v169);
      sub_23DE87BD0();
      v84 = "[%s] Returning relevance entries";
    }
    _os_log_impl(&dword_23DE6A000, v80, v81, v84, v82, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x242647498](v83, -1, -1);
    MEMORY[0x242647498](v82, -1, -1);
LABEL_34:

    v87 = v160;
    v88 = (char *)v78 + *(int *)(v47 + 64);
    sub_23DE73DEC();
    sub_23DE7443C(0, &qword_256D0D288, MEMORY[0x24BEE4AE0] + 8, MEMORY[0x24BDFAE00]);
    v89 = swift_allocObject();
    *(_OWORD *)(v89 + 16) = xmmword_23DE88360;
    sub_23DE872E8();
    sub_23DE8730C();
    v90 = *(void (**)(char *, uint64_t))(v161 + 8);
    v91 = v163;
    v90(v87, v163);
    sub_23DE87A08();
    sub_23DE872F4();
    sub_23DE8730C();
    v90(v87, v91);
    sub_23DE87A08();
    sub_23DE6EFC4(v48, type metadata accessor for MenstrualCyclesWidgetEntry.State);
    v92 = sub_23DE8757C();
    (*(void (**)(char *, uint64_t))(*(_QWORD *)(v92 - 8) + 8))(v88, v92);
    return (id)v89;
  }
  v50 = v153;
  v49 = v154;
  (*(void (**)(char *, _QWORD, uint64_t))(v153 + 104))(v17, *MEMORY[0x24BDCEF70], v154);
  v51 = v166;
  sub_23DE874B0();
  (*(void (**)(char *, uint64_t))(v50 + 8))(v17, v49);
  v52 = v158;
  (*(void (**)(char *, uint64_t, uint64_t))(v155 + 16))(v157, v158, v156);
  (*(void (**)(char *, char *, uint64_t))(v167 + 16))(v152, v51, v168);
  v53 = v165;
  sub_23DE879B4();
  v54 = *(void **)(v52 + v35[7]);
  if (!v54)
  {
    v57 = v159;
    v93 = v164;
    if (qword_25432B9F8 != -1)
      swift_once();
    v94 = sub_23DE875B8();
    __swift_project_value_buffer(v94, (uint64_t)qword_25432BDC8);
    v95 = *(void (**)(char *, char *, uint64_t))(v93 + 16);
    v96 = v151;
    v95(v151, v53, v57);
    v97 = sub_23DE875A0();
    v98 = sub_23DE87B64();
    if (os_log_type_enabled(v97, v98))
    {
      v99 = swift_slowAlloc();
      v163 = swift_slowAlloc();
      v170[0] = v163;
      *(_DWORD *)v99 = 136315394;
      v146 = v32;
      v169[0] = sub_23DE7350C(0xD000000000000026, 0x800000023DE88380, v170);
      sub_23DE87BD0();
      *(_WORD *)(v99 + 12) = 2080;
      v162 = (char *)(v99 + 14);
      v100 = v150;
      v95(v150, v96, v57);
      v95(v149, v100, v57);
      sub_23DE87C9C();
      v101 = (id)HKSensitiveLogItem();
      swift_unknownObjectRelease();
      sub_23DE87BE8();
      swift_unknownObjectRelease();
      v102 = sub_23DE87B10();
      v103 = v48;
      v105 = v104;
      v106 = *(void (**)(char *, uint64_t))(v93 + 8);
      v106(v100, v57);
      v169[0] = sub_23DE7350C(v102, v105, v170);
      sub_23DE87BD0();
      swift_bridgeObjectRelease();
      v106(v151, v57);
      _os_log_impl(&dword_23DE6A000, v97, v98, "[%s].WidgetRelevances: Current entry:%s has no projection", (uint8_t *)v99, 0x16u);
      v107 = v163;
      v32 = v146;
      swift_arrayDestroy();
      MEMORY[0x242647498](v107, -1, -1);
      MEMORY[0x242647498](v99, -1, -1);

      v106(v165, v57);
      (*(void (**)(char *, uint64_t))(v167 + 8))(v166, v168);
      v108 = v103;
LABEL_54:
      sub_23DE6EFC4(v108, type metadata accessor for MenstrualCyclesWidgetEntry.State);
      sub_23DE6EFC4((uint64_t)v32, type metadata accessor for MenstrualCyclesWidgetEntry.State);
      return 0;
    }

    v138 = *(void (**)(char *, uint64_t))(v93 + 8);
    v138(v96, v57);
LABEL_52:
    v139 = v53;
    goto LABEL_53;
  }
  v55 = v54;
  objc_msgSend(v55, sel_allDays);
  v56 = sub_23DE87B94();
  v57 = v159;
  v58 = v164;
  if ((v56 & 1) == 0)
  {
    if (qword_25432B9F8 != -1)
      swift_once();
    v109 = sub_23DE875B8();
    __swift_project_value_buffer(v109, (uint64_t)qword_25432BDC8);
    v110 = *(void (**)(char *, char *, uint64_t))(v58 + 16);
    v111 = v148;
    v110(v148, v53, v57);
    v112 = v55;
    v113 = sub_23DE875A0();
    v114 = sub_23DE87B88();
    v115 = v114;
    if (os_log_type_enabled(v113, v114))
    {
      v116 = swift_slowAlloc();
      v146 = v32;
      v117 = v116;
      v162 = (char *)swift_slowAlloc();
      v170[0] = (uint64_t)v162;
      *(_DWORD *)v117 = 136446722;
      LODWORD(v161) = v115;
      v169[0] = sub_23DE7350C(0xD000000000000026, 0x800000023DE88380, v170);
      sub_23DE87BD0();
      *(_WORD *)(v117 + 12) = 2080;
      v163 = v48;
      v160 = (char *)(v117 + 14);
      v118 = v150;
      v110(v150, v111, v57);
      v110(v149, v118, v57);
      sub_23DE87C9C();
      v119 = (id)HKSensitiveLogItem();
      swift_unknownObjectRelease();
      sub_23DE87BE8();
      swift_unknownObjectRelease();
      v120 = sub_23DE87B10();
      v121 = v57;
      v123 = v122;
      v124 = *(void (**)(char *, uint64_t))(v164 + 8);
      v124(v118, v121);
      v169[0] = sub_23DE7350C(v120, v123, v170);
      sub_23DE87BD0();
      swift_bridgeObjectRelease();
      v124(v111, v121);
      *(_WORD *)(v117 + 22) = 2080;
      v125 = (id)HKSensitiveLogItem();
      sub_23DE87BE8();
      swift_unknownObjectRelease();
      v126 = sub_23DE87B10();
      v169[0] = sub_23DE7350C(v126, v127, v170);
      sub_23DE87BD0();

      swift_bridgeObjectRelease();
      _os_log_impl(&dword_23DE6A000, v113, (os_log_type_t)v161, "[%{public}s].WidgetRelevances: Current entry:%s Conditions for relevances were not met. Returning no relevance entries. Projection : %s", (uint8_t *)v117, 0x20u);
      v128 = v162;
      swift_arrayDestroy();
      MEMORY[0x242647498](v128, -1, -1);
      v129 = v117;
      v32 = v146;
      MEMORY[0x242647498](v129, -1, -1);

      v124(v165, v121);
      goto LABEL_43;
    }

    v138 = *(void (**)(char *, uint64_t))(v164 + 8);
    v138(v111, v57);

    goto LABEL_52;
  }
  v59 = (uint64_t *)(v52 + v35[9]);
  if ((v59[1] & 1) == 0)
  {
    v60 = *v59;
    if (v60 == sub_23DE879C0())
    {
      if (qword_25432B9F8 != -1)
        swift_once();
      v61 = sub_23DE875B8();
      __swift_project_value_buffer(v61, (uint64_t)qword_25432BDC8);
      v62 = *(void (**)(char *, char *, uint64_t))(v58 + 16);
      v63 = v147;
      v62(v147, v165, v57);
      v64 = sub_23DE875A0();
      v65 = sub_23DE87B88();
      if (os_log_type_enabled(v64, v65))
      {
        v66 = swift_slowAlloc();
        v67 = swift_slowAlloc();
        v146 = v32;
        v68 = v67;
        v170[0] = v67;
        *(_DWORD *)v66 = 136446466;
        v157 = v55;
        v169[0] = sub_23DE7350C(0xD000000000000026, 0x800000023DE88380, v170);
        sub_23DE87BD0();
        *(_WORD *)(v66 + 12) = 2080;
        v162 = (char *)(v66 + 14);
        v69 = v150;
        v62(v150, v63, v57);
        v62(v149, v69, v57);
        sub_23DE87C9C();
        v70 = (id)HKSensitiveLogItem();
        swift_unknownObjectRelease();
        sub_23DE87BE8();
        swift_unknownObjectRelease();
        v71 = sub_23DE87B10();
        v163 = v48;
        v73 = v72;
        v74 = *(void (**)(char *, uint64_t))(v58 + 8);
        v74(v69, v57);
        v169[0] = sub_23DE7350C(v71, v73, v170);
        sub_23DE87BD0();
        swift_bridgeObjectRelease();
        v74(v147, v57);
        _os_log_impl(&dword_23DE6A000, v64, v65, "[%{public}s].WidgetRelevances: User has a log for entry:%s Returning no relevance", (uint8_t *)v66, 0x16u);
        swift_arrayDestroy();
        v75 = v68;
        v32 = v146;
        MEMORY[0x242647498](v75, -1, -1);
        MEMORY[0x242647498](v66, -1, -1);

        v74(v165, v57);
LABEL_43:
        (*(void (**)(char *, uint64_t))(v167 + 8))(v166, v168);
        v108 = v163;
        goto LABEL_54;
      }

      v138 = *(void (**)(char *, uint64_t))(v58 + 8);
      v138(v63, v57);

      v139 = v165;
LABEL_53:
      v138(v139, v57);
      (*(void (**)(char *, uint64_t))(v167 + 8))(v166, v168);
      v108 = v48;
      goto LABEL_54;
    }
  }
  result = objc_msgSend((id)objc_opt_self(), sel_sharedBehavior);
  if (result)
  {
    v130 = result;
    v131 = objc_msgSend(result, sel_showSensitiveLogItems);

    v146 = v32;
    v157 = v55;
    if (v131)
    {
      if (qword_25432B9F8 != -1)
        swift_once();
      v132 = sub_23DE875B8();
      __swift_project_value_buffer(v132, (uint64_t)qword_25432BDC8);
      v133 = sub_23DE875A0();
      v134 = sub_23DE87B88();
      if (!os_log_type_enabled(v133, v134))
        goto LABEL_62;
      v135 = (uint8_t *)swift_slowAlloc();
      v136 = swift_slowAlloc();
      v169[0] = v136;
      *(_DWORD *)v135 = 136315138;
      v170[0] = sub_23DE7350C(0xD000000000000026, 0x800000023DE88380, v169);
      v53 = v165;
      sub_23DE87BD0();
      v137 = "[%s].WidgetRelevances: Current day is a projected light red or dark red day and the user has not logged yet"
             ". Returning relevance entries";
    }
    else
    {
      if (qword_25432B9F8 != -1)
        swift_once();
      v140 = sub_23DE875B8();
      __swift_project_value_buffer(v140, (uint64_t)qword_25432BDC8);
      v133 = sub_23DE875A0();
      v134 = sub_23DE87B88();
      if (!os_log_type_enabled(v133, v134))
        goto LABEL_62;
      v135 = (uint8_t *)swift_slowAlloc();
      v136 = swift_slowAlloc();
      v169[0] = v136;
      *(_DWORD *)v135 = 136315138;
      v170[0] = sub_23DE7350C(0xD000000000000026, 0x800000023DE88380, v169);
      v53 = v165;
      sub_23DE87BD0();
      v137 = "[%s] Returning relevance entries";
    }
    _os_log_impl(&dword_23DE6A000, v133, v134, v137, v135, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x242647498](v136, -1, -1);
    MEMORY[0x242647498](v135, -1, -1);
LABEL_62:

    v141 = v163;
    v142 = v161;
    sub_23DE73DEC();
    sub_23DE7443C(0, &qword_256D0D288, MEMORY[0x24BEE4AE0] + 8, MEMORY[0x24BDFAE00]);
    v89 = swift_allocObject();
    *(_OWORD *)(v89 + 16) = xmmword_23DE88360;
    v143 = v160;
    sub_23DE872E8();
    sub_23DE8730C();
    v144 = *(void (**)(char *, uint64_t))(v142 + 8);
    v144(v143, v141);
    sub_23DE87A08();
    sub_23DE872F4();
    sub_23DE8730C();
    v144(v143, v141);
    sub_23DE87A08();

    (*(void (**)(char *, uint64_t))(v164 + 8))(v53, v57);
    (*(void (**)(char *, uint64_t))(v167 + 8))(v166, v168);
    sub_23DE6EFC4(v48, type metadata accessor for MenstrualCyclesWidgetEntry.State);
    sub_23DE6EFC4((uint64_t)v146, type metadata accessor for MenstrualCyclesWidgetEntry.State);
    return (id)v89;
  }
LABEL_66:
  __break(1u);
  return result;
}

uint64_t sub_23DE7324C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v14;

  sub_23DE74288();
  v8 = v7;
  v9 = *(_QWORD *)(v7 - 8);
  v10 = *(_QWORD *)(v9 + 64);
  MEMORY[0x24BDAC7A8](v7);
  (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))((char *)&v14 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v8);
  v11 = (*(unsigned __int8 *)(v9 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80);
  v12 = swift_allocObject();
  (*(void (**)(unint64_t, char *, uint64_t))(v9 + 32))(v12 + v11, (char *)&v14 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0), v8);
  sub_23DE7E6B0(a3, a4, (uint64_t)sub_23DE7434C, v12);
  return swift_release();
}

uint64_t sub_23DE73340(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t (*v4)(_QWORD);
  uint64_t v6;

  v2 = type metadata accessor for MenstrualCyclesWidgetEntry(0);
  MEMORY[0x24BDAC7A8](v2);
  sub_23DE73DA8(a1, (uint64_t)&v6 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0), v4);
  sub_23DE74288();
  return sub_23DE87B4C();
}

uint64_t sub_23DE733C8(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;

  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v3;
  *v3 = v1;
  v3[1] = sub_23DE73418;
  return MenstrualCyclesWidgetTimelineProvider.relevances()(a1);
}

uint64_t sub_23DE73418()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t type metadata accessor for MenstrualCyclesWidgetTimelineProvider()
{
  uint64_t result;

  result = qword_25432BB08;
  if (!qword_25432BB08)
    return swift_getSingletonMetadata();
  return result;
}

void sub_23DE7349C(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t), uint64_t (*a4)(uint64_t, uint64_t))
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

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(_BYTE *)(*(_QWORD *)(a1 - 8) + 82) & 2) != 0)
    return *(_QWORD *)a2;
  return a2;
}

uint64_t sub_23DE7350C(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12[3];
  uint64_t ObjectType;

  v6 = sub_23DE735DC(v12, 0, 0, 1, a1, a2);
  v7 = v12[0];
  if (v6)
  {
    v8 = v6;
    ObjectType = swift_getObjectType();
    v12[0] = v8;
    v9 = *a3;
    if (*a3)
    {
      sub_23DE74400((uint64_t)v12, *a3);
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
      sub_23DE74400((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v12);
  return v7;
}

uint64_t sub_23DE735DC(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_23DE87BDC();
            result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    result = sub_23DE73794(a5, a6);
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
  v8 = sub_23DE87C30();
  if (!v8)
  {
    sub_23DE87C3C();
    __break(1u);
LABEL_17:
    result = sub_23DE87C60();
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

uint64_t sub_23DE73794(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v2 = sub_23DE73828(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v2 = sub_23DE73A14(0, *(_QWORD *)(v2 + 16) + 1, 1, (char *)v2);
  v4 = *(_QWORD *)(v2 + 16);
  v3 = *(_QWORD *)(v2 + 24);
  if (v4 >= v3 >> 1)
    v2 = sub_23DE73A14(v3 > 1, v4 + 1, 1, (char *)v2);
  *(_QWORD *)(v2 + 16) = v4 + 1;
  *(_BYTE *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_23DE73828(uint64_t a1, unint64_t a2)
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
      v3 = sub_23DE7399C(v2, 0);
      if (v2 < 0)
        break;
      v4 = v3;
      v5 = sub_23DE87C18();
      if ((v6 & 1) != 0)
        goto LABEL_14;
      if (v5 == v2)
        return (uint64_t)v4;
      sub_23DE87C3C();
      __break(1u);
LABEL_10:
      v2 = sub_23DE87B28();
      if (!v2)
        return MEMORY[0x24BEE4AF8];
    }
    sub_23DE87C60();
    __break(1u);
LABEL_14:
    result = sub_23DE87C3C();
    __break(1u);
  }
  else
  {
    return MEMORY[0x24BEE4AF8];
  }
  return result;
}

_QWORD *sub_23DE7399C(uint64_t a1, uint64_t a2)
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
  sub_23DE7443C(0, &qword_256D0D2B0, MEMORY[0x24BEE4260], (uint64_t (*)(_QWORD, uint64_t))MEMORY[0x24BEE3598]);
  v4 = (_QWORD *)swift_allocObject();
  v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_23DE73A14(char a1, int64_t a2, char a3, char *a4)
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
    sub_23DE7443C(0, &qword_256D0D2B0, MEMORY[0x24BEE4260], (uint64_t (*)(_QWORD, uint64_t))MEMORY[0x24BEE3598]);
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
  result = sub_23DE87C60();
  __break(1u);
  return result;
}

uint64_t sub_23DE73B74()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_23DE73B98(uint64_t a1)
{
  uint64_t v1;

  return sub_23DE70154(a1, *(uint64_t (**)(_QWORD))(v1 + 16), *(_QWORD *)(v1 + 24));
}

void sub_23DE73BA0()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_256D0D268)
  {
    type metadata accessor for MenstrualCyclesWidgetEntry(255);
    sub_23DE73C00();
    v0 = sub_23DE87AA4();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_256D0D268);
  }
}

unint64_t sub_23DE73C00()
{
  unint64_t result;
  uint64_t v1;

  result = qword_256D0D270;
  if (!qword_256D0D270)
  {
    v1 = type metadata accessor for MenstrualCyclesWidgetEntry(255);
    result = MEMORY[0x2426473FC](&protocol conformance descriptor for MenstrualCyclesWidgetEntry, v1);
    atomic_store(result, (unint64_t *)&qword_256D0D270);
  }
  return result;
}

uint64_t sub_23DE73C48()
{
  uint64_t v0;
  uint64_t v1;

  v1 = sub_23DE87A8C();
  (*(void (**)(unint64_t, uint64_t))(*(_QWORD *)(v1 - 8) + 8))(v0+ ((*(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80)), v1);
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_23DE73CC0(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;

  v3 = *(_QWORD *)(sub_23DE87A8C() - 8);
  v4 = (*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  v5 = v1 + ((*(_QWORD *)(v3 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8);
  return sub_23DE710B8(a1, v1 + v4, *(void (**)(_QWORD))v5, *(_QWORD *)(v5 + 8));
}

uint64_t sub_23DE73D14(uint64_t a1)
{
  uint64_t *v1;

  return sub_23DE7324C(a1, v1[2], v1[3], v1[4]);
}

uint64_t sub_23DE73D20(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t))
{
  uint64_t v4;

  sub_23DE7349C(0, a2, a3, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1C68]);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(a1, v4);
  return a1;
}

uint64_t sub_23DE73D64(uint64_t a1, uint64_t a2, uint64_t (*a3)(_QWORD))
{
  uint64_t v5;

  v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_23DE73DA8(uint64_t a1, uint64_t a2, uint64_t (*a3)(_QWORD))
{
  uint64_t v5;

  v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

void sub_23DE73DEC()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_256D0D290[0])
  {
    sub_23DE7443C(255, &qword_256D0D288, MEMORY[0x24BEE4AE0] + 8, MEMORY[0x24BDFAE00]);
    v0 = sub_23DE87C78();
    if (!v1)
      atomic_store(v0, qword_256D0D290);
  }
}

uint64_t *initializeBufferWithCopyOfBuffer for MenstrualCyclesWidgetTimelineProvider(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v3;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  char *v7;
  char *v8;
  uint64_t v9;
  void (*v10)(char *, char *, uint64_t);

  v3 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  v4 = *a2;
  *a1 = *a2;
  if ((v3 & 0x20000) != 0)
  {
    v5 = (uint64_t *)(v4 + ((v3 + 16) & ~(unint64_t)v3));
    swift_retain();
  }
  else
  {
    v5 = a1;
    v6 = *(int *)(a3 + 24);
    v7 = (char *)a1 + v6;
    v8 = (char *)a2 + v6;
    v9 = sub_23DE87534();
    v10 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v9 - 8) + 16);
    swift_retain();
    v10(v7, v8, v9);
  }
  return v5;
}

uint64_t destroy for MenstrualCyclesWidgetTimelineProvider(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;

  swift_release();
  v4 = a1 + *(int *)(a2 + 24);
  v5 = sub_23DE87534();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(v4, v5);
}

_QWORD *initializeWithCopy for MenstrualCyclesWidgetTimelineProvider(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v4;
  char *v5;
  char *v6;
  uint64_t v7;
  void (*v8)(char *, char *, uint64_t);

  *a1 = *a2;
  v4 = *(int *)(a3 + 24);
  v5 = (char *)a1 + v4;
  v6 = (char *)a2 + v4;
  v7 = sub_23DE87534();
  v8 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v7 - 8) + 16);
  swift_retain();
  v8(v5, v6, v7);
  return a1;
}

_QWORD *assignWithCopy for MenstrualCyclesWidgetTimelineProvider(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v6;
  char *v7;
  char *v8;
  uint64_t v9;

  *a1 = *a2;
  swift_retain();
  swift_release();
  v6 = *(int *)(a3 + 24);
  v7 = (char *)a1 + v6;
  v8 = (char *)a2 + v6;
  v9 = sub_23DE87534();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v9 - 8) + 24))(v7, v8, v9);
  return a1;
}

_QWORD *initializeWithTake for MenstrualCyclesWidgetTimelineProvider(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v4;
  char *v5;
  char *v6;
  uint64_t v7;

  *a1 = *a2;
  v4 = *(int *)(a3 + 24);
  v5 = (char *)a1 + v4;
  v6 = (char *)a2 + v4;
  v7 = sub_23DE87534();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v7 - 8) + 32))(v5, v6, v7);
  return a1;
}

_QWORD *assignWithTake for MenstrualCyclesWidgetTimelineProvider(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v6;
  char *v7;
  char *v8;
  uint64_t v9;

  *a1 = *a2;
  swift_release();
  v6 = *(int *)(a3 + 24);
  v7 = (char *)a1 + v6;
  v8 = (char *)a2 + v6;
  v9 = sub_23DE87534();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v9 - 8) + 40))(v7, v8, v9);
  return a1;
}

uint64_t getEnumTagSinglePayload for MenstrualCyclesWidgetTimelineProvider()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_23DE740F8(char *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v8;

  if ((_DWORD)a2 == 0x7FFFFFFF)
  {
    v4 = *(_QWORD *)a1;
    if (*(_QWORD *)a1 >= 0xFFFFFFFFuLL)
      LODWORD(v4) = -1;
    return (v4 + 1);
  }
  else
  {
    v8 = sub_23DE87534();
    return (*(uint64_t (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 48))(&a1[*(int *)(a3 + 24)], a2, v8);
  }
}

uint64_t storeEnumTagSinglePayload for MenstrualCyclesWidgetTimelineProvider()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

char *sub_23DE74180(char *result, uint64_t a2, int a3, uint64_t a4)
{
  char *v5;
  uint64_t v7;

  v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(_QWORD *)result = (a2 - 1);
  }
  else
  {
    v7 = sub_23DE87534();
    return (char *)(*(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 56))(&v5[*(int *)(a4 + 24)], a2, a2, v7);
  }
  return result;
}

uint64_t sub_23DE741F4()
{
  uint64_t result;
  unint64_t v1;

  result = sub_23DE87534();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

ValueMetadata *type metadata accessor for MenstrualCyclesWidgetRelevanceProvider()
{
  return &type metadata for MenstrualCyclesWidgetRelevanceProvider;
}

void sub_23DE74288()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_25432BA00)
  {
    type metadata accessor for MenstrualCyclesWidgetEntry(255);
    v0 = sub_23DE87B58();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_25432BA00);
  }
}

uint64_t sub_23DE742EC()
{
  uint64_t v0;
  uint64_t v1;

  sub_23DE74288();
  (*(void (**)(unint64_t, uint64_t))(*(_QWORD *)(v1 - 8) + 8))(v0+ ((*(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80)), v1);
  return swift_deallocObject();
}

uint64_t sub_23DE7434C(uint64_t a1)
{
  sub_23DE74288();
  return sub_23DE73340(a1);
}

uint64_t sub_23DE74388(uint64_t a1, uint64_t a2, unint64_t *a3, uint64_t (*a4)(uint64_t))
{
  uint64_t v6;

  sub_23DE7349C(0, a3, a4, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1C68]);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(a2, a1, v6);
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

uint64_t sub_23DE74400(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

void sub_23DE7443C(uint64_t a1, unint64_t *a2, uint64_t a3, uint64_t (*a4)(_QWORD, uint64_t))
{
  unint64_t v5;
  uint64_t v6;

  if (!*a2)
  {
    v5 = a4(0, a3);
    if (!v6)
      atomic_store(v5, a2);
  }
}

id sub_23DE74488()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _BYTE *v4;
  id result;
  void *v6;
  unsigned int v7;
  uint64_t v8;
  _BYTE v9[16];

  v1 = sub_23DE8772C();
  v2 = *(_QWORD *)(v1 - 8);
  MEMORY[0x24BDAC7A8](v1);
  v4 = &v9[-((v3 + 15) & 0xFFFFFFFFFFFFFFF0)];
  result = objc_msgSend((id)objc_opt_self(), sel_sharedBehavior);
  if (result)
  {
    v6 = result;
    v7 = objc_msgSend(result, sel_isAppleWatch);

    (*(void (**)(_BYTE *, uint64_t, uint64_t))(v2 + 16))(v4, v0, v1);
    if (v7)
    {
      sub_23DE876E4();
      sub_23DE7AFC8(&qword_256D0D5E0, (uint64_t (*)(uint64_t))MEMORY[0x24BDFAAC0], MEMORY[0x24BDFAAB8]);
      sub_23DE87738();
      v8 = v9[15];
    }
    else
    {
      v8 = 0;
    }
    (*(void (**)(_BYTE *, uint64_t))(v2 + 8))(v4, v1);
    return (id)v8;
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t MenstrualCyclesWidgetRectangularView.body.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t (*v2)(void);
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12;

  v1 = MEMORY[0x24BDCDAC0];
  v2 = MEMORY[0x24BEE1C68];
  sub_23DE7349C(0, &qword_256D0D2B8, MEMORY[0x24BDCDAC0], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1C68]);
  MEMORY[0x24BDAC7A8](v3);
  v5 = (char *)&v12 - v4;
  sub_23DE7471C();
  MEMORY[0x24BDAC7A8](v6);
  v8 = (uint64_t *)((char *)&v12 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0));
  *v8 = sub_23DE879A8();
  v8[1] = v9;
  sub_23DE76188();
  sub_23DE75C5C(v0, (uint64_t)v8 + *(int *)(v10 + 44));
  sub_23DE87414();
  sub_23DE7AFC8(&qword_256D0D500, (uint64_t (*)(uint64_t))sub_23DE7471C, MEMORY[0x24BDF4750]);
  sub_23DE878AC();
  sub_23DE7A18C((uint64_t)v5, (uint64_t)&qword_256D0D2B8, v1, (uint64_t)v2, (uint64_t (*)(_QWORD))sub_23DE7349C);
  return sub_23DE6EFC4((uint64_t)v8, (uint64_t (*)(_QWORD))sub_23DE7471C);
}

void sub_23DE7471C()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_256D0D2C0)
  {
    sub_23DE7B008(255, &qword_256D0D2C8, (uint64_t (*)(uint64_t))sub_23DE7479C, (uint64_t (*)(uint64_t))sub_23DE753E4, (uint64_t (*)(uint64_t, uint64_t, uint64_t))MEMORY[0x24BDEF3B8]);
    sub_23DE75B1C();
    v0 = sub_23DE87984();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_256D0D2C0);
  }
}

void sub_23DE7479C(uint64_t a1)
{
  sub_23DE75408(a1, &qword_256D0D2D0, (uint64_t (*)(uint64_t))sub_23DE747C0, &qword_256D0D438, sub_23DE753C8);
}

void sub_23DE747C0(uint64_t a1)
{
  sub_23DE759D0(a1, &qword_256D0D2D8, sub_23DE747DC);
}

void sub_23DE747DC(uint64_t a1)
{
  sub_23DE747F8(a1, &qword_256D0D2E0, (uint64_t (*)(uint64_t))sub_23DE74878, &qword_256D0D430);
}

void sub_23DE747F8(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t), unint64_t *a4)
{
  unint64_t v7;
  uint64_t v8;

  if (!*a2)
  {
    a3(255);
    sub_23DE7AFC8(a4, a3, MEMORY[0x24BDF5428]);
    v7 = sub_23DE87978();
    if (!v8)
      atomic_store(v7, a2);
  }
}

void sub_23DE74878(uint64_t a1)
{
  sub_23DE7349C(a1, &qword_256D0D2E8, (uint64_t (*)(uint64_t))sub_23DE74894, MEMORY[0x24BDF53F0]);
}

void sub_23DE74894()
{
  unint64_t TupleTypeMetadata;
  uint64_t v1;

  if (!qword_256D0D2F0)
  {
    sub_23DE74920(255);
    sub_23DE74B98();
    sub_23DE74E8C(255);
    TupleTypeMetadata = swift_getTupleTypeMetadata();
    if (!v1)
      atomic_store(TupleTypeMetadata, (unint64_t *)&qword_256D0D2F0);
  }
}

void sub_23DE74920(uint64_t a1)
{
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;
  _QWORD v5[2];

  if (!qword_256D0D2F8)
  {
    sub_23DE749B4();
    v5[0] = v2;
    v5[1] = sub_23DE75234(&qword_256D0D320, (uint64_t (*)(uint64_t))sub_23DE749B4, (uint64_t (*)(void))sub_23DE74A50, (uint64_t (*)(void))sub_23DE74B30);
    v3 = MEMORY[0x2426473B4](a1, v5, MEMORY[0x24BDFAC10], 0);
    if (!v4)
      atomic_store(v3, (unint64_t *)&qword_256D0D2F8);
  }
}

void sub_23DE749B4()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_256D0D300)
  {
    sub_23DE75968(255, &qword_256D0D308, &qword_256D0D310, MEMORY[0x24BEE50B0]);
    sub_23DE75710(255, &qword_256D0D318, MEMORY[0x24BDF3E48], MEMORY[0x24BDF3E18], MEMORY[0x24BDF06F8]);
    v0 = sub_23DE87624();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_256D0D300);
  }
}

unint64_t sub_23DE74A50()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;
  _QWORD v4[2];

  result = qword_256D0D328;
  if (!qword_256D0D328)
  {
    sub_23DE75968(255, &qword_256D0D308, &qword_256D0D310, MEMORY[0x24BEE50B0]);
    v2 = v1;
    v3 = sub_23DE74AD0();
    v4[0] = MEMORY[0x24BDF1F80];
    v4[1] = v3;
    result = MEMORY[0x2426473FC](MEMORY[0x24BDED308], v2, v4);
    atomic_store(result, (unint64_t *)&qword_256D0D328);
  }
  return result;
}

unint64_t sub_23DE74AD0()
{
  unint64_t result;
  uint64_t v1;

  result = qword_256D0D330;
  if (!qword_256D0D330)
  {
    sub_23DE7443C(255, &qword_256D0D310, MEMORY[0x24BEE50B0], (uint64_t (*)(_QWORD, uint64_t))MEMORY[0x24BDF1008]);
    result = MEMORY[0x2426473FC](MEMORY[0x24BDF1028], v1);
    atomic_store(result, (unint64_t *)&qword_256D0D330);
  }
  return result;
}

unint64_t sub_23DE74B30()
{
  unint64_t result;
  uint64_t v1;

  result = qword_256D0D338;
  if (!qword_256D0D338)
  {
    sub_23DE75710(255, &qword_256D0D318, MEMORY[0x24BDF3E48], MEMORY[0x24BDF3E18], MEMORY[0x24BDF06F8]);
    result = MEMORY[0x2426473FC](MEMORY[0x24BDF0710], v1);
    atomic_store(result, (unint64_t *)&qword_256D0D338);
  }
  return result;
}

void sub_23DE74B98()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_256D0D340)
  {
    sub_23DE74C14();
    sub_23DE7443C(255, &qword_256D0D310, MEMORY[0x24BEE50B0], (uint64_t (*)(_QWORD, uint64_t))MEMORY[0x24BDF1008]);
    v0 = sub_23DE87624();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_256D0D340);
  }
}

void sub_23DE74C14()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_256D0D348)
  {
    sub_23DE74C90();
    sub_23DE74E2C(255, &qword_256D0D388, &qword_256D0D390, MEMORY[0x24BEE1768]);
    v0 = sub_23DE87624();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_256D0D348);
  }
}

void sub_23DE74C90()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_256D0D350)
  {
    sub_23DE74D0C();
    sub_23DE7443C(255, &qword_256D0D380, MEMORY[0x24BDEC3D0], (uint64_t (*)(_QWORD, uint64_t))MEMORY[0x24BDF1008]);
    v0 = sub_23DE87624();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_256D0D350);
  }
}

void sub_23DE74D0C()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_256D0D358)
  {
    sub_23DE74D90();
    sub_23DE75710(255, &qword_256D0D318, MEMORY[0x24BDF3E48], MEMORY[0x24BDF3E18], MEMORY[0x24BDF06F8]);
    v0 = sub_23DE87624();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_256D0D358);
  }
}

void sub_23DE74D90()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_256D0D360)
  {
    sub_23DE75710(255, &qword_256D0D368, MEMORY[0x24BDF1FA8], MEMORY[0x24BDECC80], (uint64_t (*)(_QWORD, uint64_t, uint64_t))MEMORY[0x24BDED2D0]);
    sub_23DE74E2C(255, &qword_256D0D370, &qword_256D0D378, MEMORY[0x24BDF1948]);
    v0 = sub_23DE87624();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_256D0D360);
  }
}

void sub_23DE74E2C(uint64_t a1, unint64_t *a2, unint64_t *a3, uint64_t a4)
{
  unint64_t v5;
  uint64_t v6;

  if (!*a2)
  {
    sub_23DE7443C(255, a3, a4, (uint64_t (*)(_QWORD, uint64_t))MEMORY[0x24BEE1C68]);
    v5 = sub_23DE877D4();
    if (!v6)
      atomic_store(v5, a2);
  }
}

void sub_23DE74E8C(uint64_t a1)
{
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;
  _QWORD v5[2];

  if (!qword_256D0D398)
  {
    sub_23DE74F20(255);
    v5[0] = v2;
    v5[1] = sub_23DE75234(&qword_256D0D400, (uint64_t (*)(uint64_t))sub_23DE74F20, sub_23DE751EC, sub_23DE753AC);
    v3 = MEMORY[0x2426473B4](a1, v5, MEMORY[0x24BDFAC10], 0);
    if (!v4)
      atomic_store(v3, (unint64_t *)&qword_256D0D398);
  }
}

void sub_23DE74F20(uint64_t a1)
{
  sub_23DE7B008(a1, &qword_256D0D3A0, (uint64_t (*)(uint64_t))sub_23DE74F44, (uint64_t (*)(uint64_t))sub_23DE75188, (uint64_t (*)(uint64_t, uint64_t, uint64_t))MEMORY[0x24BDED2D0]);
}

void sub_23DE74F44()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_256D0D3A8)
  {
    sub_23DE74FC0(255);
    sub_23DE7443C(255, &qword_256D0D310, MEMORY[0x24BEE50B0], (uint64_t (*)(_QWORD, uint64_t))MEMORY[0x24BDF1008]);
    v0 = sub_23DE87624();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_256D0D3A8);
  }
}

void sub_23DE74FC0(uint64_t a1)
{
  sub_23DE7B008(a1, &qword_256D0D3B0, (uint64_t (*)(uint64_t))sub_23DE74FE4, (uint64_t (*)(uint64_t))sub_23DE75150, (uint64_t (*)(uint64_t, uint64_t, uint64_t))MEMORY[0x24BDED2D0]);
}

void sub_23DE74FE4(uint64_t a1)
{
  sub_23DE759D0(a1, &qword_256D0D3B8, sub_23DE75000);
}

void sub_23DE75000(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t (*v5)(uint64_t);
  unint64_t v6;
  uint64_t v7;
  _QWORD v8[4];

  if (!qword_256D0D3C0)
  {
    sub_23DE750D4();
    v3 = v2;
    v4 = sub_23DE87588();
    v5 = (uint64_t (*)(uint64_t))MEMORY[0x24BE46CB0];
    v8[0] = v3;
    v8[1] = v4;
    v8[2] = sub_23DE7AFC8(&qword_256D0D3D0, (uint64_t (*)(uint64_t))sub_23DE750D4, MEMORY[0x24BDF3EE8]);
    v8[3] = sub_23DE7AFC8(&qword_256D0D3D8, v5, MEMORY[0x24BE46CA8]);
    v6 = MEMORY[0x2426473B4](a1, v8, MEMORY[0x24BDF2160], 0);
    if (!v7)
      atomic_store(v6, (unint64_t *)&qword_256D0D3C0);
  }
}

void sub_23DE750D4()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_256D0D3C8)
  {
    v0 = sub_23DE87948();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_256D0D3C8);
  }
}

void sub_23DE75150(uint64_t a1)
{
  sub_23DE7349C(a1, &qword_256D0D3E0, (uint64_t (*)(uint64_t))sub_23DE7516C, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BDF1008]);
}

void sub_23DE7516C(uint64_t a1)
{
  sub_23DE7349C(a1, &qword_256D0D3E8, (uint64_t (*)(uint64_t))MEMORY[0x24BDF4E58], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1C68]);
}

void sub_23DE75188()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_256D0D3F0)
  {
    sub_23DE6F000(255, &qword_256D0D3F8);
    v0 = sub_23DE877D4();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_256D0D3F0);
  }
}

uint64_t sub_23DE751EC()
{
  return sub_23DE75234(&qword_256D0D408, (uint64_t (*)(uint64_t))sub_23DE74F44, sub_23DE75210, (uint64_t (*)(void))sub_23DE74AD0);
}

uint64_t sub_23DE75210()
{
  return sub_23DE75234(&qword_256D0D410, (uint64_t (*)(uint64_t))sub_23DE74FC0, (uint64_t (*)(void))sub_23DE752A4, sub_23DE75390);
}

uint64_t sub_23DE75234(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t (*a3)(void), uint64_t (*a4)(void))
{
  uint64_t result;
  uint64_t v8;
  _QWORD v9[2];

  result = *a1;
  if (!result)
  {
    v8 = a2(255);
    v9[0] = a3();
    v9[1] = a4();
    result = MEMORY[0x2426473FC](MEMORY[0x24BDED308], v8, v9);
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_23DE752A4()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t (*v6)(uint64_t);
  _QWORD v7[6];

  result = qword_256D0D418;
  if (!qword_256D0D418)
  {
    sub_23DE74FE4(255);
    v2 = v1;
    sub_23DE750D4();
    v4 = v3;
    v5 = sub_23DE87588();
    v6 = (uint64_t (*)(uint64_t))MEMORY[0x24BE46CB0];
    v7[2] = v4;
    v7[3] = v5;
    v7[4] = sub_23DE7AFC8(&qword_256D0D3D0, (uint64_t (*)(uint64_t))sub_23DE750D4, MEMORY[0x24BDF3EE8]);
    v7[5] = sub_23DE7AFC8(&qword_256D0D3D8, v6, MEMORY[0x24BE46CA8]);
    v7[0] = swift_getOpaqueTypeConformance2();
    v7[1] = MEMORY[0x24BDEBEE0];
    result = MEMORY[0x2426473FC](MEMORY[0x24BDED308], v2, v7);
    atomic_store(result, (unint64_t *)&qword_256D0D418);
  }
  return result;
}

uint64_t sub_23DE75390()
{
  return sub_23DE7AFC8(&qword_256D0D420, (uint64_t (*)(uint64_t))sub_23DE75150, MEMORY[0x24BDF1028]);
}

uint64_t sub_23DE753AC()
{
  return sub_23DE7AFC8(&qword_256D0D428, (uint64_t (*)(uint64_t))sub_23DE75188, MEMORY[0x24BDF1028]);
}

uint64_t sub_23DE753C8()
{
  return sub_23DE7AFC8(&qword_256D0D440, (uint64_t (*)(uint64_t))sub_23DE747DC, MEMORY[0x24BDF4700]);
}

void sub_23DE753E4(uint64_t a1)
{
  sub_23DE75408(a1, &qword_256D0D448, (uint64_t (*)(uint64_t))sub_23DE754B8, &qword_256D0D4E0, sub_23DE75B00);
}

void sub_23DE75408(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t), unint64_t *a4, uint64_t (*a5)(void))
{
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  _QWORD v14[4];

  if (!*a2)
  {
    v10 = a3(255);
    v11 = sub_23DE75A98(a4, a3, a5, MEMORY[0x24BDEDBB8]);
    v14[0] = v10;
    v14[1] = MEMORY[0x24BDF3E48];
    v14[2] = v11;
    v14[3] = MEMORY[0x24BDF3E18];
    v12 = MEMORY[0x2426473B4](a1, v14, MEMORY[0x24BDF2DE8], 0);
    if (!v13)
      atomic_store(v12, a2);
  }
}

void sub_23DE754B8(uint64_t a1)
{
  sub_23DE759D0(a1, &qword_256D0D450, sub_23DE754D4);
}

void sub_23DE754D4(uint64_t a1)
{
  sub_23DE747F8(a1, &qword_256D0D458, (uint64_t (*)(uint64_t))sub_23DE754F0, &qword_256D0D4D8);
}

void sub_23DE754F0(uint64_t a1)
{
  sub_23DE7349C(a1, &qword_256D0D460, (uint64_t (*)(uint64_t))sub_23DE7550C, MEMORY[0x24BDF53F0]);
}

void sub_23DE7550C()
{
  unint64_t TupleTypeMetadata;
  uint64_t v1;

  if (!qword_256D0D468)
  {
    sub_23DE755C8(255);
    sub_23DE759D0(255, &qword_256D0D4A8, (void (*)(uint64_t))sub_23DE75858);
    sub_23DE759D0(255, &qword_256D0D4C8, (void (*)(uint64_t))sub_23DE75A2C);
    TupleTypeMetadata = swift_getTupleTypeMetadata();
    if (!v1)
      atomic_store(TupleTypeMetadata, (unint64_t *)&qword_256D0D468);
  }
}

void sub_23DE755C8(uint64_t a1)
{
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;
  _QWORD v5[2];

  if (!qword_256D0D470)
  {
    sub_23DE7563C();
    v5[0] = v2;
    v5[1] = sub_23DE75758();
    v3 = MEMORY[0x2426473B4](a1, v5, MEMORY[0x24BDFAC10], 0);
    if (!v4)
      atomic_store(v3, (unint64_t *)&qword_256D0D470);
  }
}

void sub_23DE7563C()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_256D0D478)
  {
    sub_23DE75694();
    v0 = sub_23DE877B0();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_256D0D478);
  }
}

void sub_23DE75694()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_256D0D480)
  {
    sub_23DE75710(255, (unint64_t *)&qword_256D0D488, MEMORY[0x24BDF4108], MEMORY[0x24BDEEC60], (uint64_t (*)(_QWORD, uint64_t, uint64_t))MEMORY[0x24BDED2D0]);
    v0 = sub_23DE87624();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_256D0D480);
  }
}

void sub_23DE75710(uint64_t a1, unint64_t *a2, uint64_t a3, uint64_t a4, uint64_t (*a5)(_QWORD, uint64_t, uint64_t))
{
  unint64_t v6;
  uint64_t v7;

  if (!*a2)
  {
    v6 = a5(0, a3, a4);
    if (!v7)
      atomic_store(v6, a2);
  }
}

unint64_t sub_23DE75758()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;
  _QWORD v3[2];

  result = qword_256D0D490;
  if (!qword_256D0D490)
  {
    sub_23DE7563C();
    v2 = v1;
    v3[0] = sub_23DE75A98(&qword_256D0D498, (uint64_t (*)(uint64_t))sub_23DE75694, (uint64_t (*)(void))sub_23DE757D8, MEMORY[0x24BDEBEE0]);
    v3[1] = v3[0];
    result = MEMORY[0x2426473FC](MEMORY[0x24BDEF3E0], v2, v3);
    atomic_store(result, (unint64_t *)&qword_256D0D490);
  }
  return result;
}

unint64_t sub_23DE757D8()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_256D0D4A0;
  if (!qword_256D0D4A0)
  {
    sub_23DE75710(255, (unint64_t *)&qword_256D0D488, MEMORY[0x24BDF4108], MEMORY[0x24BDEEC60], (uint64_t (*)(_QWORD, uint64_t, uint64_t))MEMORY[0x24BDED2D0]);
    v2[0] = MEMORY[0x24BDF40E8];
    v2[1] = MEMORY[0x24BDEEC40];
    result = MEMORY[0x2426473FC](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_256D0D4A0);
  }
  return result;
}

void sub_23DE75858()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_256D0D4B0)
  {
    sub_23DE758D4();
    sub_23DE7443C(255, &qword_256D0D310, MEMORY[0x24BEE50B0], (uint64_t (*)(_QWORD, uint64_t))MEMORY[0x24BDF1008]);
    v0 = sub_23DE87624();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_256D0D4B0);
  }
}

void sub_23DE758D4()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_256D0D4B8)
  {
    sub_23DE75968(255, &qword_256D0D4C0, &qword_256D0D380, MEMORY[0x24BDEC3D0]);
    sub_23DE74E2C(255, &qword_256D0D388, &qword_256D0D390, MEMORY[0x24BEE1768]);
    v0 = sub_23DE87624();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_256D0D4B8);
  }
}

void sub_23DE75968(uint64_t a1, unint64_t *a2, unint64_t *a3, uint64_t a4)
{
  unint64_t v5;
  uint64_t v6;

  if (!*a2)
  {
    sub_23DE7443C(255, a3, a4, (uint64_t (*)(_QWORD, uint64_t))MEMORY[0x24BDF1008]);
    v5 = sub_23DE87624();
    if (!v6)
      atomic_store(v5, a2);
  }
}

void sub_23DE759D0(uint64_t a1, unint64_t *a2, void (*a3)(uint64_t))
{
  unint64_t v4;
  uint64_t v5;

  if (!*a2)
  {
    a3(255);
    v4 = sub_23DE87624();
    if (!v5)
      atomic_store(v4, a2);
  }
}

void sub_23DE75A2C()
{
  unint64_t v0;
  uint64_t v1;
  _QWORD v2[2];

  if (!qword_256D0D4D0)
  {
    v2[0] = MEMORY[0x24BDF1FA8];
    v2[1] = MEMORY[0x24BDF1F80];
    v0 = MEMORY[0x2426473B4](0, v2, MEMORY[0x24BDFAC10], 0);
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_256D0D4D0);
  }
}

uint64_t sub_23DE75A98(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t (*a3)(void), uint64_t a4)
{
  uint64_t result;
  uint64_t v8;
  _QWORD v9[2];

  result = *a1;
  if (!result)
  {
    v8 = a2(255);
    v9[0] = a3();
    v9[1] = a4;
    result = MEMORY[0x2426473FC](MEMORY[0x24BDED308], v8, v9);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_23DE75B00()
{
  return sub_23DE7AFC8(&qword_256D0D4E8, (uint64_t (*)(uint64_t))sub_23DE754D4, MEMORY[0x24BDF4700]);
}

unint64_t sub_23DE75B1C()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t OpaqueTypeConformance2;
  uint64_t v7;
  _QWORD v8[6];

  result = qword_256D0D4F0;
  if (!qword_256D0D4F0)
  {
    sub_23DE7B008(255, &qword_256D0D2C8, (uint64_t (*)(uint64_t))sub_23DE7479C, (uint64_t (*)(uint64_t))sub_23DE753E4, (uint64_t (*)(uint64_t, uint64_t, uint64_t))MEMORY[0x24BDEF3B8]);
    v2 = v1;
    sub_23DE747C0(255);
    v3 = MEMORY[0x24BDEDBB8];
    sub_23DE75A98(&qword_256D0D438, (uint64_t (*)(uint64_t))sub_23DE747C0, sub_23DE753C8, MEMORY[0x24BDEDBB8]);
    v4 = MEMORY[0x24BDF3E48];
    v5 = MEMORY[0x24BDF3E18];
    OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
    sub_23DE754B8(255);
    v8[2] = v7;
    v8[3] = v4;
    v8[4] = sub_23DE75A98(&qword_256D0D4E0, (uint64_t (*)(uint64_t))sub_23DE754B8, sub_23DE75B00, v3);
    v8[5] = v5;
    v8[0] = OpaqueTypeConformance2;
    v8[1] = swift_getOpaqueTypeConformance2();
    result = MEMORY[0x2426473FC](MEMORY[0x24BDEF3E0], v2, v8);
    atomic_store(result, (unint64_t *)&qword_256D0D4F0);
  }
  return result;
}

uint64_t sub_23DE75C5C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t (*v7)(uint64_t);
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t (*v15)(void);
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  id *v19;
  uint64_t v20;
  char *v21;
  uint64_t v22;
  uint64_t v23;
  unsigned int (*v24)(char *, uint64_t, uint64_t);
  char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void (**v29)(char *, _QWORD);
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
  uint64_t v52;
  char *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  id v58;
  uint64_t v59;
  uint64_t v60;
  char *v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;

  v59 = a2;
  sub_23DE753E4(0);
  v4 = v3;
  v58 = *(id *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v6 = (char *)&v52 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23DE7B008(0, &qword_256D0D5E8, (uint64_t (*)(uint64_t))sub_23DE7479C, v7, MEMORY[0x24BDEF380]);
  MEMORY[0x24BDAC7A8](v8);
  v10 = (char *)&v52 - v9;
  sub_23DE7479C(0);
  v60 = v11;
  v55 = *(_QWORD *)(v11 - 8);
  MEMORY[0x24BDAC7A8](v11);
  v54 = (uint64_t)&v52 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = sub_23DE8757C();
  v56 = *(_QWORD *)(v13 - 8);
  v57 = v13;
  MEMORY[0x24BDAC7A8](v13);
  v53 = (char *)&v52 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = MEMORY[0x24BEE1C68];
  sub_23DE7349C(0, &qword_25432BB38, type metadata accessor for MenstrualCyclesWidgetEntry.State, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1C68]);
  v17 = MEMORY[0x24BDAC7A8](v16);
  v19 = (id *)((char *)&v52 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0));
  MEMORY[0x24BDAC7A8](v17);
  v21 = (char *)&v52 - v20;
  v22 = type metadata accessor for MenstrualCyclesWidgetRectangularView();
  sub_23DE7B568(a1 + *(int *)(v22 + 36), (uint64_t)v21, (uint64_t)&qword_25432BB38, (uint64_t)type metadata accessor for MenstrualCyclesWidgetEntry.State, (uint64_t)v15, (uint64_t (*)(_QWORD, uint64_t, uint64_t, uint64_t))sub_23DE7349C);
  v23 = type metadata accessor for MenstrualCyclesWidgetEntry.State(0);
  v24 = *(unsigned int (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v23 - 8) + 48);
  v61 = v21;
  if (v24(v21, 1, v23) != 1)
  {
    v25 = v6;
    v26 = v60;
    v52 = v4;
    sub_23DE7B568((uint64_t)v61, (uint64_t)v19, (uint64_t)&qword_25432BB38, (uint64_t)type metadata accessor for MenstrualCyclesWidgetEntry.State, (uint64_t)MEMORY[0x24BEE1C68], (uint64_t (*)(_QWORD, uint64_t, uint64_t, uint64_t))sub_23DE7349C);
    sub_23DE6D5EC();
    v28 = v27;
    if ((*(unsigned int (**)(id *, uint64_t, uint64_t))(*(_QWORD *)(v27 - 8) + 48))(v19, 1, v27) != 1)
    {
      v58 = *v19;
      v39 = (uint64_t)v58;
      v40 = (uint64_t)v53;
      (*(void (**)(char *, char *, uint64_t))(v56 + 32))(v53, (char *)v19 + *(int *)(v28 + 64), v57);
      v41 = v54;
      sub_23DE7621C(v39, v40, v54);
      v42 = v55;
      (*(void (**)(char *, uint64_t, uint64_t))(v55 + 16))(v10, v41, v26);
      swift_storeEnumTagMultiPayload();
      sub_23DE747C0(255);
      v44 = v43;
      v45 = sub_23DE75A98(&qword_256D0D438, (uint64_t (*)(uint64_t))sub_23DE747C0, sub_23DE753C8, MEMORY[0x24BDEDBB8]);
      v46 = MEMORY[0x24BDF3E48];
      v62 = v44;
      v63 = MEMORY[0x24BDF3E48];
      v47 = MEMORY[0x24BDF3E18];
      v64 = v45;
      v65 = MEMORY[0x24BDF3E18];
      swift_getOpaqueTypeConformance2();
      sub_23DE754B8(255);
      v49 = v48;
      v50 = sub_23DE75A98(&qword_256D0D4E0, (uint64_t (*)(uint64_t))sub_23DE754B8, sub_23DE75B00, MEMORY[0x24BDEDBB8]);
      v62 = v49;
      v63 = v46;
      v64 = v50;
      v65 = v47;
      swift_getOpaqueTypeConformance2();
      sub_23DE877A4();

      (*(void (**)(uint64_t, uint64_t))(v42 + 8))(v41, v26);
      (*(void (**)(uint64_t, uint64_t))(v56 + 8))(v40, v57);
      return sub_23DE7A18C((uint64_t)v61, (uint64_t)&qword_25432BB38, (uint64_t)type metadata accessor for MenstrualCyclesWidgetEntry.State, (uint64_t)MEMORY[0x24BEE1C68], (uint64_t (*)(_QWORD))sub_23DE7349C);
    }
    sub_23DE6EFC4((uint64_t)v19, type metadata accessor for MenstrualCyclesWidgetEntry.State);
    v4 = v52;
    v6 = v25;
  }
  sub_23DE76580((uint64_t)v6);
  v29 = (void (**)(char *, _QWORD))v58;
  (*((void (**)(char *, char *, uint64_t))v58 + 2))(v10, v6, v4);
  swift_storeEnumTagMultiPayload();
  sub_23DE747C0(255);
  v31 = v30;
  v32 = MEMORY[0x24BDEDBB8];
  v33 = sub_23DE75A98(&qword_256D0D438, (uint64_t (*)(uint64_t))sub_23DE747C0, sub_23DE753C8, MEMORY[0x24BDEDBB8]);
  v34 = MEMORY[0x24BDF3E48];
  v62 = v31;
  v63 = MEMORY[0x24BDF3E48];
  v35 = MEMORY[0x24BDF3E18];
  v64 = v33;
  v65 = MEMORY[0x24BDF3E18];
  swift_getOpaqueTypeConformance2();
  sub_23DE754B8(255);
  v37 = v36;
  v38 = sub_23DE75A98(&qword_256D0D4E0, (uint64_t (*)(uint64_t))sub_23DE754B8, sub_23DE75B00, v32);
  v62 = v37;
  v63 = v34;
  v64 = v38;
  v65 = v35;
  swift_getOpaqueTypeConformance2();
  sub_23DE877A4();
  v29[1](v6, v4);
  return sub_23DE7A18C((uint64_t)v61, (uint64_t)&qword_25432BB38, (uint64_t)type metadata accessor for MenstrualCyclesWidgetEntry.State, (uint64_t)MEMORY[0x24BEE1C68], (uint64_t (*)(_QWORD))sub_23DE7349C);
}

void sub_23DE76188()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_256D0D4F8)
  {
    sub_23DE7B008(255, &qword_256D0D2C8, (uint64_t (*)(uint64_t))sub_23DE7479C, (uint64_t (*)(uint64_t))sub_23DE753E4, (uint64_t (*)(uint64_t, uint64_t, uint64_t))MEMORY[0x24BDEF3B8]);
    v0 = sub_23DE87600();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_256D0D4F8);
  }
}

uint64_t sub_23DE7620C()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_23DE7621C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
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
  char *v14;
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
  uint64_t v25;
  uint64_t v26;
  void (*v27)(char *, uint64_t);
  uint64_t v28;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;

  v4 = v3;
  v30 = a1;
  v31 = a2;
  v36 = a3;
  v5 = sub_23DE877C8();
  v34 = *(_QWORD *)(v5 - 8);
  v35 = v5;
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)&v30 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_23DE875E8();
  v9 = *(_QWORD *)(v8 - 8);
  v10 = MEMORY[0x24BDAC7A8](v8);
  v12 = (char *)&v30 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v10);
  v14 = (char *)&v30 - v13;
  sub_23DE747DC(0);
  MEMORY[0x24BDAC7A8](v15);
  v17 = (uint64_t)&v30 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23DE747C0(0);
  MEMORY[0x24BDAC7A8](v18);
  v20 = (char *)&v30 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23DE7479C(0);
  v32 = *(_QWORD *)(v21 - 8);
  v33 = v21;
  MEMORY[0x24BDAC7A8](v21);
  v23 = (char *)&v30 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(_QWORD *)v17 = sub_23DE87768();
  *(_QWORD *)(v17 + 8) = 0;
  *(_BYTE *)(v17 + 16) = 0;
  sub_23DE7B07C(0, &qword_256D0D5F0, sub_23DE74878);
  sub_23DE77CEC(v4, v30, v31, (char *)(v17 + *(int *)(v24 + 44)));
  v25 = sub_23DE8799C();
  sub_23DE77B24(0.0, 1, 0.0, 1, INFINITY, 0, 0.0, 1, (uint64_t)v20, 0.0, 1, INFINITY, 0, v25, v26, (void (*)(uint64_t, uint64_t))sub_23DE7B0D8, (uint64_t (*)(_QWORD))sub_23DE747C0);
  sub_23DE6EFC4(v17, (uint64_t (*)(_QWORD))sub_23DE747DC);
  type metadata accessor for MenstrualCyclesWidgetRectangularView();
  sub_23DE8439C((uint64_t)v14);
  (*(void (**)(char *, _QWORD, uint64_t))(v9 + 104))(v12, *MEMORY[0x24BDEB400], v8);
  LOBYTE(v17) = sub_23DE875DC();
  v27 = *(void (**)(char *, uint64_t))(v9 + 8);
  v27(v12, v8);
  v27(v14, v8);
  sub_23DE6F000(0, &qword_256D0D3F8);
  if ((v17 & 1) != 0)
    v28 = sub_23DE87BA0();
  else
    v28 = sub_23DE87BAC();
  v37 = MEMORY[0x242646D0C](v28);
  sub_23DE877BC();
  sub_23DE75A98(&qword_256D0D438, (uint64_t (*)(uint64_t))sub_23DE747C0, sub_23DE753C8, MEMORY[0x24BDEDBB8]);
  sub_23DE87900();
  (*(void (**)(char *, uint64_t))(v34 + 8))(v7, v35);
  swift_release();
  sub_23DE6EFC4((uint64_t)v20, (uint64_t (*)(_QWORD))sub_23DE747C0);
  return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v32 + 32))(v36, v23, v33);
}

uint64_t sub_23DE76580@<X0>(uint64_t a1@<X8>)
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
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void (*v21)(char *, uint64_t);
  void *v22;
  char **v23;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;

  v2 = v1;
  v26 = a1;
  v27 = sub_23DE877C8();
  v25 = *(_QWORD *)(v27 - 8);
  MEMORY[0x24BDAC7A8](v27);
  v4 = (char *)&v25 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = sub_23DE875E8();
  v6 = *(_QWORD *)(v5 - 8);
  v7 = MEMORY[0x24BDAC7A8](v5);
  v9 = (char *)&v25 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v7);
  v11 = (char *)&v25 - v10;
  sub_23DE754D4(0);
  MEMORY[0x24BDAC7A8](v12);
  v14 = (uint64_t)&v25 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23DE754B8(0);
  MEMORY[0x24BDAC7A8](v15);
  v17 = (char *)&v25 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(_QWORD *)v14 = sub_23DE87768();
  *(_QWORD *)(v14 + 8) = 0;
  *(_BYTE *)(v14 + 16) = 0;
  sub_23DE7B07C(0, &qword_256D0D618, sub_23DE754F0);
  sub_23DE76BCC(v2, (char *)(v14 + *(int *)(v18 + 44)));
  v19 = sub_23DE8799C();
  sub_23DE77B24(0.0, 1, 0.0, 1, INFINITY, 0, 0.0, 1, (uint64_t)v17, 0.0, 1, INFINITY, 0, v19, v20, (void (*)(uint64_t, uint64_t))sub_23DE7B4FC, (uint64_t (*)(_QWORD))sub_23DE754B8);
  sub_23DE6EFC4(v14, (uint64_t (*)(_QWORD))sub_23DE754D4);
  type metadata accessor for MenstrualCyclesWidgetRectangularView();
  sub_23DE8439C((uint64_t)v11);
  (*(void (**)(char *, _QWORD, uint64_t))(v6 + 104))(v9, *MEMORY[0x24BDEB400], v5);
  LOBYTE(v14) = sub_23DE875DC();
  v21 = *(void (**)(char *, uint64_t))(v6 + 8);
  v21(v9, v5);
  v21(v11, v5);
  v22 = (void *)objc_opt_self();
  v23 = &selRef_systemWhiteColor;
  if ((v14 & 1) == 0)
    v23 = &selRef_systemBlackColor;
  v28 = MEMORY[0x242646D0C](objc_msgSend(v22, *v23, v25, v26));
  sub_23DE877BC();
  sub_23DE75A98(&qword_256D0D4E0, (uint64_t (*)(uint64_t))sub_23DE754B8, sub_23DE75B00, MEMORY[0x24BDEDBB8]);
  sub_23DE87900();
  (*(void (**)(char *, uint64_t))(v25 + 8))(v4, v27);
  swift_release();
  return sub_23DE6EFC4((uint64_t)v17, (uint64_t (*)(_QWORD))sub_23DE754B8);
}

uint64_t sub_23DE76884@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  int v12;
  uint64_t v13;
  uint64_t result;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  uint64_t v19;
  char v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  uint64_t v25;
  __int128 v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  __int128 v31;
  char v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  uint64_t v37;
  char v38;
  uint64_t v39;
  unsigned __int8 v40;
  uint64_t v41;
  unsigned __int8 v42;
  __int128 v43;

  v4 = sub_23DE87954();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v21 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_23DE87A14();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)&v21 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v11, a1, v8);
  LODWORD(a1) = (*(uint64_t (**)(char *, uint64_t))(v9 + 88))(v11, v8);
  v12 = *MEMORY[0x24BDFAED8];
  (*(void (**)(char *, _QWORD, uint64_t))(v5 + 104))(v7, *MEMORY[0x24BDF3FD0], v4);
  v13 = sub_23DE87960();
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  sub_23DE879A8();
  sub_23DE875F4();
  v25 = v13;
  v26 = xmmword_23DE88450;
  v27 = v39;
  v28 = v40;
  v29 = v41;
  v30 = v42;
  v31 = v43;
  if ((_DWORD)a1 == v12)
  {
    v32 = 0;
    sub_23DE75694();
    sub_23DE75A98(&qword_256D0D498, (uint64_t (*)(uint64_t))sub_23DE75694, (uint64_t (*)(void))sub_23DE757D8, MEMORY[0x24BDEBEE0]);
    result = sub_23DE877A4();
    v15 = v33;
    v16 = v34;
    v17 = v35;
    v18 = v36;
    v19 = v37;
    v20 = v38;
  }
  else
  {
    v32 = 1;
    sub_23DE75694();
    sub_23DE75A98(&qword_256D0D498, (uint64_t (*)(uint64_t))sub_23DE75694, (uint64_t (*)(void))sub_23DE757D8, MEMORY[0x24BDEBEE0]);
    sub_23DE877A4();
    v24 = v33;
    v23 = v34;
    v22 = v35;
    v21 = v36;
    v19 = v37;
    v20 = v38;
    result = (*(uint64_t (**)(char *, uint64_t))(v9 + 8))(v11, v8);
    v18 = v21;
    v17 = v22;
    v16 = v23;
    v15 = v24;
  }
  *(_OWORD *)a2 = v15;
  *(_OWORD *)(a2 + 16) = v16;
  *(_OWORD *)(a2 + 32) = v17;
  *(_OWORD *)(a2 + 48) = v18;
  *(_QWORD *)(a2 + 64) = v19;
  *(_BYTE *)(a2 + 72) = v20;
  return result;
}

uint64_t sub_23DE76BCC@<X0>(uint64_t a1@<X0>, char *a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  void (*v5)(uint64_t);
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
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void (*v32)(char *, uint64_t);
  id v33;
  id v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  char v39;
  char v40;
  char v41;
  uint64_t v42;
  uint64_t v43;
  char *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  void (*v49)(char *, _QWORD, uint64_t);
  uint64_t v50;
  void (*v51)(uint64_t, _QWORD, uint64_t, uint64_t);
  uint64_t v52;
  char *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  char v59;
  char v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  id v66;
  uint64_t v67;
  uint64_t v68;
  char v69;
  char v70;
  uint64_t v71;
  uint64_t v72;
  _QWORD *v73;
  uint64_t v74;
  char *v75;
  _QWORD *v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  id v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  char v90;
  char v91;
  char *v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  char v99;
  id v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  char v106;
  char v107;
  char *v108;
  uint64_t v109;
  uint64_t v110;
  char *v111;
  char *v112;
  void (*v113)(uint64_t, uint64_t);
  uint64_t v114;
  uint64_t v115;
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
  char *v127;
  void (*v128)(char *, char *, uint64_t);
  uint64_t v129;
  uint64_t v130;
  char *v131;
  int *v132;
  char *v133;
  char v134;
  char *v135;
  uint64_t v136;
  __int128 v137;
  __int128 v138;
  __int128 v139;
  __int128 v140;
  __int128 v141;
  __int128 v142;
  uint64_t v143;
  void (*v144)(char *, uint64_t);
  uint64_t v145;
  _QWORD v147[2];
  void (*v148)(char *);
  uint64_t v149;
  uint64_t v150;
  void (*v151)(char *, uint64_t);
  void (*v152)(uint64_t, _QWORD, uint64_t, uint64_t);
  void (*v153)(char *, _QWORD, uint64_t);
  unsigned int v154;
  uint64_t v155;
  char *v156;
  void (*v157)(char *, uint64_t, uint64_t);
  unint64_t v158;
  uint64_t v159;
  _QWORD *v160;
  char *v161;
  uint64_t v162;
  char *v163;
  uint64_t v164;
  uint64_t v165;
  uint64_t v166;
  char *v167;
  uint64_t v168;
  uint64_t v169;
  uint64_t v170;
  char *v171;
  uint64_t v172;
  uint64_t KeyPath;
  char *v174;
  char *v175;
  uint64_t v176;
  uint64_t v177;
  char *v178;
  uint64_t v179;
  uint64_t v180;
  char *v181;
  uint64_t v182;
  uint64_t v183;
  char *v184;
  _DWORD v185[2];
  _DWORD v186[2];
  _DWORD v187[2];
  _DWORD v188[2];
  char v189;
  __int128 v190;
  __int128 v191;
  __int128 v192;
  __int128 v193;
  __int128 v194;
  __int128 v195;
  __int128 v196;
  __int128 v197;
  char v198;
  __int128 v199;
  __int128 v200;
  __int128 v201;
  __int128 v202;
  uint64_t v203;
  uint64_t v204;
  uint64_t v205;
  char v206;
  _BYTE v207[7];
  uint64_t v208;
  uint64_t v209;
  uint64_t v210;
  uint64_t v211;
  char v212;
  unsigned __int8 v213;
  _BYTE v214[7];
  _BYTE v215[7];
  unsigned __int8 v216;
  _BYTE v217[7];
  _BYTE v218[7];
  unsigned __int8 v219;

  v167 = a2;
  sub_23DE75A2C();
  v164 = *(_QWORD *)(v3 - 8);
  v165 = v3;
  MEMORY[0x24BDAC7A8](v3);
  v163 = (char *)v147 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23DE759D0(0, &qword_256D0D4C8, v5);
  v162 = v6;
  v7 = MEMORY[0x24BDAC7A8](v6);
  v166 = (uint64_t)v147 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = MEMORY[0x24BDAC7A8](v7);
  v161 = (char *)v147 - v10;
  MEMORY[0x24BDAC7A8](v9);
  v183 = (uint64_t)v147 - v11;
  v179 = sub_23DE8760C();
  v160 = *(_QWORD **)(v179 - 8);
  v12 = MEMORY[0x24BDAC7A8](v179);
  v178 = (char *)v147 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v12);
  v177 = (uint64_t)v147 - v14;
  v15 = sub_23DE8784C();
  v172 = *(_QWORD *)(v15 - 8);
  KeyPath = v15;
  MEMORY[0x24BDAC7A8](v15);
  v171 = (char *)v147 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23DE7349C(0, &qword_256D0D5F8, (uint64_t (*)(uint64_t))MEMORY[0x24BDF1678], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1C68]);
  MEMORY[0x24BDAC7A8](v17);
  v175 = (char *)v147 - v18;
  v176 = sub_23DE87864();
  v170 = *(_QWORD *)(v176 - 8);
  MEMORY[0x24BDAC7A8](v176);
  v174 = (char *)v147 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  v20 = sub_23DE879FC();
  v21 = *(_QWORD *)(v20 - 8);
  MEMORY[0x24BDAC7A8](v20);
  v23 = (char *)v147 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  v24 = sub_23DE87A14();
  v25 = *(_QWORD *)(v24 - 8);
  MEMORY[0x24BDAC7A8](v24);
  v27 = (char *)v147 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23DE755C8(0);
  v182 = v28;
  v180 = *(_QWORD *)(v28 - 8);
  v29 = MEMORY[0x24BDAC7A8](v28);
  v181 = (char *)v147 - ((v30 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v29);
  v184 = (char *)v147 - v31;
  sub_23DE84340((uint64_t)v27);
  v150 = type metadata accessor for MenstrualCyclesWidgetRectangularView();
  sub_23DE84370((uint64_t)v23);
  (*(void (**)(char *, uint64_t))(v21 + 8))(v23, v20);
  v32 = *(void (**)(char *, uint64_t))(v25 + 8);
  v32(v27, v24);
  if (qword_25432B9E0 != -1)
    swift_once();
  v33 = (id)qword_25432BDC0;
  sub_23DE8796C();
  sub_23DE84340((uint64_t)v27);
  sub_23DE76884((uint64_t)v27, (uint64_t)&v199);
  swift_release();
  v32(v27, v24);
  v168 = *((_QWORD *)&v199 + 1);
  v169 = v199;
  v159 = v200;
  v149 = a1;
  v190 = v199;
  v191 = v200;
  v192 = v201;
  v193 = v202;
  *(_QWORD *)&v194 = v203;
  BYTE8(v194) = v204;
  sub_23DE7563C();
  sub_23DE75758();
  sub_23DE878A0();
  j__swift_release();
  v34 = (id)qword_25432BDC0;
  v156 = "IDGET_PREGNANCY_TITLE";
  *(_QWORD *)&v199 = sub_23DE87408();
  *((_QWORD *)&v199 + 1) = v35;
  v158 = sub_23DE7B0E4();
  v168 = sub_23DE87894();
  v169 = v36;
  v38 = v37;
  v40 = v39;

  v41 = v40 & 1;
  v42 = *MEMORY[0x24BDF1880];
  v43 = v170;
  v44 = v174;
  v45 = v176;
  v157 = *(void (**)(char *, uint64_t, uint64_t))(v170 + 104);
  v157(v174, v42, v176);
  v46 = *MEMORY[0x24BDF1668];
  v47 = sub_23DE87810();
  v48 = *(_QWORD *)(v47 - 8);
  v49 = *(void (**)(char *, _QWORD, uint64_t))(v48 + 104);
  v50 = (uint64_t)v175;
  v154 = v46;
  v153 = v49;
  v49(v175, v46, v47);
  v51 = *(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v48 + 56);
  v155 = v47;
  v152 = v51;
  v51(v50, 0, 1, v47);
  sub_23DE87834();
  sub_23DE7A18C(v50, (uint64_t)&qword_256D0D5F8, (uint64_t)MEMORY[0x24BDF1678], (uint64_t)MEMORY[0x24BEE1C68], (uint64_t (*)(_QWORD))sub_23DE7349C);
  v151 = *(void (**)(char *, uint64_t))(v43 + 8);
  v151(v44, v45);
  sub_23DE8781C();
  sub_23DE87840();
  swift_release();
  v53 = v171;
  v52 = v172;
  v54 = KeyPath;
  (*(void (**)(char *, _QWORD, uint64_t))(v172 + 104))(v171, *MEMORY[0x24BDF17C8], KeyPath);
  sub_23DE87858();
  swift_release();
  (*(void (**)(char *, uint64_t))(v52 + 8))(v53, v54);
  v55 = v168;
  v56 = sub_23DE8787C();
  v58 = v57;
  v60 = v59;
  swift_release();
  sub_23DE7B128(v55, v38, v41);
  swift_bridgeObjectRelease();
  v61 = v149;
  v62 = v150;
  v63 = v149 + *(int *)(v150 + 32);
  v64 = *(_QWORD *)v63;
  LOBYTE(v48) = *(_BYTE *)(v63 + 8);
  sub_23DE795B0(*(_QWORD *)v63, v48);
  LOBYTE(v55) = sub_23DE84644(v64, v48);
  sub_23DE7980C(v64, v48);
  if ((v55 & 1) != 0)
  {
    *(_QWORD *)&v199 = sub_23DE8790C();
    sub_23DE7B184();
    v65 = sub_23DE87930();
  }
  else
  {
    v66 = objc_msgSend((id)objc_opt_self(), sel_labelColor);
    v65 = MEMORY[0x242646D0C](v66);
  }
  *(_QWORD *)&v199 = v65;
  v67 = sub_23DE87870();
  v168 = v68;
  v169 = v67;
  v70 = v69;
  v170 = v71;
  sub_23DE7B128(v56, v58, v60 & 1);
  swift_release();
  swift_bridgeObjectRelease();
  KeyPath = swift_getKeyPath();
  v172 = swift_getKeyPath();
  v159 = swift_getKeyPath();
  LODWORD(v171) = sub_23DE87804();
  v150 = v61 + *(int *)(v62 + 28);
  v72 = v177;
  sub_23DE843CC(v177);
  LODWORD(v149) = *MEMORY[0x24BDECF28];
  v73 = v160;
  v148 = (void (*)(char *))v160[13];
  v75 = v178;
  v74 = v179;
  v148(v178);
  v147[1] = sub_23DE7AFC8(&qword_256D0D610, (uint64_t (*)(uint64_t))MEMORY[0x24BDECF50], MEMORY[0x24BDECF70]);
  sub_23DE87ABC();
  v76 = (_QWORD *)v73[1];
  v160 = v76;
  ((void (*)(char *, uint64_t))v76)(v75, v74);
  ((void (*)(uint64_t, uint64_t))v76)(v72, v74);
  sub_23DE875C4();
  v78 = v77;
  v80 = v79;
  v82 = v81;
  v84 = v83;
  v219 = v70 & 1;
  v216 = 0;
  v213 = 0;
  v85 = (id)qword_25432BDC0;
  *(_QWORD *)&v199 = sub_23DE87408();
  *((_QWORD *)&v199 + 1) = v86;
  v87 = sub_23DE87894();
  v89 = v88;
  LOBYTE(v74) = v90;

  v91 = v74 & 1;
  v92 = v174;
  v93 = v176;
  v157(v174, *MEMORY[0x24BDF18A8], v176);
  v94 = (uint64_t)v175;
  v95 = v155;
  v153(v175, v154, v155);
  v152(v94, 0, 1, v95);
  sub_23DE87834();
  sub_23DE7A18C(v94, (uint64_t)&qword_256D0D5F8, (uint64_t)MEMORY[0x24BDF1678], (uint64_t)MEMORY[0x24BEE1C68], (uint64_t (*)(_QWORD))sub_23DE7349C);
  v151(v92, v93);
  sub_23DE87828();
  sub_23DE87840();
  swift_release();
  v96 = sub_23DE8787C();
  v98 = v97;
  LOBYTE(v94) = v99;
  swift_release();
  sub_23DE7B128(v87, v89, v91);
  swift_bridgeObjectRelease();
  v100 = objc_msgSend((id)objc_opt_self(), sel_systemIndigoColor);
  *(_QWORD *)&v199 = MEMORY[0x242646D0C](v100);
  v101 = sub_23DE87870();
  v103 = v102;
  v105 = v104;
  v107 = v106 & 1;
  sub_23DE7B128(v96, v98, v94 & 1);
  swift_release();
  swift_bridgeObjectRelease();
  *(_QWORD *)&v199 = v101;
  *((_QWORD *)&v199 + 1) = v103;
  LOBYTE(v200) = v107;
  *((_QWORD *)&v200 + 1) = v105;
  v108 = v163;
  sub_23DE878A0();
  sub_23DE7B128(v101, v103, v107);
  swift_bridgeObjectRelease();
  LOBYTE(v101) = sub_23DE87804();
  v109 = v177;
  sub_23DE843CC(v177);
  v111 = v178;
  v110 = v179;
  ((void (*)(char *, _QWORD, uint64_t))v148)(v178, v149, v179);
  sub_23DE87ABC();
  v112 = v111;
  v113 = (void (*)(uint64_t, uint64_t))v160;
  ((void (*)(char *, uint64_t))v160)(v112, v110);
  v113(v109, v110);
  sub_23DE875C4();
  v115 = v114;
  v117 = v116;
  v119 = v118;
  v121 = v120;
  v123 = v164;
  v122 = v165;
  v124 = (uint64_t)v161;
  (*(void (**)(char *, char *, uint64_t))(v164 + 16))(v161, v108, v165);
  v125 = v124 + *(int *)(v162 + 36);
  *(_BYTE *)v125 = v101;
  *(_QWORD *)(v125 + 8) = v115;
  *(_QWORD *)(v125 + 16) = v117;
  *(_QWORD *)(v125 + 24) = v119;
  *(_QWORD *)(v125 + 32) = v121;
  *(_BYTE *)(v125 + 40) = 0;
  (*(void (**)(char *, uint64_t))(v123 + 8))(v108, v122);
  v126 = v183;
  sub_23DE7B50C(v124, v183);
  v127 = v181;
  v128 = *(void (**)(char *, char *, uint64_t))(v180 + 16);
  v129 = v182;
  v128(v181, v184, v182);
  v189 = 0;
  LOBYTE(v124) = v219;
  LODWORD(v178) = v219;
  v188[0] = *(_DWORD *)v218;
  *(_DWORD *)((char *)v188 + 3) = *(_DWORD *)&v218[3];
  v187[0] = *(_DWORD *)v217;
  *(_DWORD *)((char *)v187 + 3) = *(_DWORD *)&v217[3];
  LOBYTE(v123) = v216;
  LODWORD(v177) = v216;
  v186[0] = *(_DWORD *)v215;
  *(_DWORD *)((char *)v186 + 3) = *(_DWORD *)&v215[3];
  *(_DWORD *)((char *)v185 + 3) = *(_DWORD *)&v214[3];
  v185[0] = *(_DWORD *)v214;
  LODWORD(v179) = v213;
  v130 = v166;
  sub_23DE7B568(v126, v166, (uint64_t)&qword_256D0D4C8, (uint64_t)sub_23DE75A2C, MEMORY[0x24BDECC80], (uint64_t (*)(_QWORD, uint64_t, uint64_t, uint64_t))sub_23DE759D0);
  v131 = v167;
  v128(v167, v127, v129);
  sub_23DE7550C();
  v133 = &v131[v132[12]];
  v134 = v189;
  *(_QWORD *)v133 = 0;
  v133[8] = v134;
  v135 = &v131[v132[16]];
  *(_QWORD *)&v190 = v169;
  *((_QWORD *)&v190 + 1) = v168;
  LOBYTE(v191) = v124;
  *(_DWORD *)((char *)&v191 + 1) = v188[0];
  DWORD1(v191) = *(_DWORD *)((char *)v188 + 3);
  *((_QWORD *)&v191 + 1) = v170;
  *(_QWORD *)&v192 = KeyPath;
  BYTE8(v192) = 0;
  HIDWORD(v192) = *(_DWORD *)((char *)v187 + 3);
  *(_DWORD *)((char *)&v192 + 9) = v187[0];
  *(_QWORD *)&v193 = v172;
  *((_QWORD *)&v193 + 1) = 2;
  LOBYTE(v194) = v123;
  DWORD1(v194) = *(_DWORD *)((char *)v186 + 3);
  *(_DWORD *)((char *)&v194 + 1) = v186[0];
  v136 = v159;
  *((_QWORD *)&v194 + 1) = v159;
  *(_QWORD *)&v195 = 0x3FE0000000000000;
  BYTE8(v195) = (_BYTE)v171;
  HIDWORD(v195) = *(_DWORD *)((char *)v185 + 3);
  *(_DWORD *)((char *)&v195 + 9) = v185[0];
  *(_QWORD *)&v196 = v78;
  *((_QWORD *)&v196 + 1) = v80;
  *(_QWORD *)&v197 = v82;
  *((_QWORD *)&v197 + 1) = v84;
  v198 = v179;
  v137 = v196;
  v138 = v197;
  v135[128] = v179;
  *((_OWORD *)v135 + 6) = v137;
  *((_OWORD *)v135 + 7) = v138;
  v139 = v190;
  v140 = v191;
  v141 = v195;
  *((_OWORD *)v135 + 4) = v194;
  *((_OWORD *)v135 + 5) = v141;
  v142 = v193;
  *((_OWORD *)v135 + 2) = v192;
  *((_OWORD *)v135 + 3) = v142;
  *(_OWORD *)v135 = v139;
  *((_OWORD *)v135 + 1) = v140;
  v143 = MEMORY[0x24BDECC80];
  sub_23DE7B568(v130, (uint64_t)&v131[v132[20]], (uint64_t)&qword_256D0D4C8, (uint64_t)sub_23DE75A2C, MEMORY[0x24BDECC80], (uint64_t (*)(_QWORD, uint64_t, uint64_t, uint64_t))sub_23DE759D0);
  sub_23DE7B5B8((uint64_t)&v190);
  sub_23DE7A18C(v183, (uint64_t)&qword_256D0D4C8, (uint64_t)sub_23DE75A2C, v143, (uint64_t (*)(_QWORD))sub_23DE759D0);
  v144 = *(void (**)(char *, uint64_t))(v180 + 8);
  v145 = v182;
  v144(v184, v182);
  sub_23DE7A18C(v130, (uint64_t)&qword_256D0D4C8, (uint64_t)sub_23DE75A2C, v143, (uint64_t (*)(_QWORD))sub_23DE759D0);
  *(_QWORD *)&v199 = v169;
  *((_QWORD *)&v199 + 1) = v168;
  LOBYTE(v200) = (_BYTE)v178;
  *(_DWORD *)((char *)&v200 + 1) = v188[0];
  DWORD1(v200) = *(_DWORD *)((char *)v188 + 3);
  *((_QWORD *)&v200 + 1) = v170;
  *(_QWORD *)&v201 = KeyPath;
  BYTE8(v201) = 0;
  *(_DWORD *)((char *)&v201 + 9) = v187[0];
  HIDWORD(v201) = *(_DWORD *)((char *)v187 + 3);
  *(_QWORD *)&v202 = v172;
  *((_QWORD *)&v202 + 1) = 2;
  LOBYTE(v203) = v177;
  HIDWORD(v203) = *(_DWORD *)((char *)v186 + 3);
  *(_DWORD *)((char *)&v203 + 1) = v186[0];
  v204 = v136;
  v205 = 0x3FE0000000000000;
  v206 = (char)v171;
  *(_DWORD *)&v207[3] = *(_DWORD *)((char *)v185 + 3);
  *(_DWORD *)v207 = v185[0];
  v208 = v78;
  v209 = v80;
  v210 = v82;
  v211 = v84;
  v212 = v179;
  sub_23DE7B624((uint64_t)&v199);
  return ((uint64_t (*)(char *, uint64_t))v144)(v181, v145);
}

__n128 sub_23DE77B24@<Q0>(double a1@<X0>, char a2@<W1>, double a3@<X2>, char a4@<W3>, double a5@<X4>, char a6@<W5>, double a7@<X6>, char a8@<W7>, uint64_t a9@<X8>, double a10, char a11, double a12, char a13, uint64_t a14, uint64_t a15, void (*a16)(uint64_t, uint64_t), uint64_t (*a17)(_QWORD))
{
  uint64_t v17;
  uint64_t v18;
  uint64_t (*v20)(_QWORD);
  void *v29;
  _OWORD *v30;
  __n128 result;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __n128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;

  v18 = v17;
  v20 = a17;
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
    sub_23DE87B7C();
    v29 = (void *)sub_23DE877EC();
    sub_23DE87594();

    v20 = a17;
  }
  sub_23DE87630();
  a16(v18, a9);
  v30 = (_OWORD *)(a9 + *(int *)(v20(0) + 36));
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

uint64_t sub_23DE77CEC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, char *a4@<X8>)
{
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
  id v20;
  uint64_t v21;
  uint64_t v22;
  char v23;
  char v24;
  uint64_t v25;
  char v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t (*v31)(void);
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
  char v43;
  uint64_t v44;
  uint64_t KeyPath;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  char v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  char *v59;
  uint64_t v60;
  uint64_t v61;
  char *v62;
  uint64_t v63;
  id v64;
  unsigned __int8 v65;
  uint64_t v66;
  char *v67;
  void (*v68)(char *, char *, uint64_t);
  uint64_t v69;
  void (*v70)(char *, uint64_t, uint64_t);
  uint64_t v71;
  char *v72;
  char *v73;
  int *v74;
  char *v75;
  char v76;
  char *v77;
  char v78;
  uint64_t v79;
  void (*v80)(char *, uint64_t);
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  void (*v88)(uint64_t, uint64_t);
  void (*v89)(char *, uint64_t);
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  char *v94;
  void (*v95)(char *, uint64_t);
  uint64_t v96;
  void (*v97)(char *);
  unsigned int v98;
  void (*v99)(char *, uint64_t);
  void (*v100)(char *, _QWORD, uint64_t, uint64_t);
  uint64_t v101;
  void (*v102)(char *, uint64_t);
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  char *v106;
  char *v107;
  uint64_t v108;
  uint64_t v109;
  unint64_t v110;
  void (*v111)(char *, uint64_t, uint64_t);
  uint64_t v112;
  uint64_t v113;
  char *v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  char *v118;
  uint64_t v119;
  uint64_t v120;
  char *v121;
  _DWORD v122[2];
  _DWORD v123[2];
  _DWORD v124[2];
  _DWORD v125[2];
  _DWORD v126[2];
  char v127;
  unsigned __int8 v128;
  _BYTE v129[7];
  _BYTE v130[7];
  unsigned __int8 v131;
  _BYTE v132[7];
  _BYTE v133[7];
  unsigned __int8 v134;
  _BYTE v135[7];
  _DWORD v136[2];
  _DWORD v137[2];
  _DWORD v138[2];
  _DWORD v139[2];
  __int128 v140;
  __int128 v141;
  __int128 v142;
  __int128 v143;
  __int128 v144;
  __int128 v145;
  __int128 v146;
  __int128 v147;
  __int128 v148;
  __int128 v149;
  uint64_t v150;
  uint64_t v151;
  char v152;
  _BYTE v153[7];
  uint64_t v154;
  uint64_t v155;
  uint64_t v156;
  uint64_t v157;
  uint64_t v158;
  uint64_t v159;
  char v160;
  _BYTE v161[7];
  unint64_t v162;
  uint64_t v163;
  uint64_t v164;
  char *v165;
  char v166;
  _BYTE v167[7];
  uint64_t v168;
  uint64_t v169;
  char v170;
  _BYTE v171[7];
  void (*v172)(char *, uint64_t);
  uint64_t v173;

  v104 = a3;
  v113 = a2;
  v115 = a1;
  v106 = a4;
  sub_23DE74E8C(0);
  v108 = v4;
  v120 = *(_QWORD *)(v4 - 8);
  v5 = MEMORY[0x24BDAC7A8](v4);
  v107 = (char *)&v91 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v5);
  v119 = (uint64_t)&v91 - v7;
  v116 = sub_23DE8784C();
  v112 = *(_QWORD *)(v116 - 8);
  MEMORY[0x24BDAC7A8](v116);
  v114 = (char *)&v91 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23DE7349C(0, &qword_256D0D5F8, (uint64_t (*)(uint64_t))MEMORY[0x24BDF1678], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1C68]);
  MEMORY[0x24BDAC7A8](v9);
  v11 = (char *)&v91 - v10;
  v12 = sub_23DE87864();
  v13 = *(_QWORD *)(v12 - 8);
  MEMORY[0x24BDAC7A8](v12);
  v15 = (char *)&v91 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23DE74920(0);
  v105 = v16;
  v117 = *(_QWORD *)(v16 - 8);
  v17 = MEMORY[0x24BDAC7A8](v16);
  v118 = (char *)&v91 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v17);
  v121 = (char *)&v91 - v19;
  if (qword_25432B9E0 != -1)
    swift_once();
  v20 = (id)qword_25432BDC0;
  v150 = sub_23DE87408();
  v151 = v21;
  v110 = sub_23DE7B0E4();
  v101 = sub_23DE87894();
  v93 = v22;
  v24 = v23;
  v109 = v25;

  v26 = v24 & 1;
  v27 = *MEMORY[0x24BDF1860];
  v111 = *(void (**)(char *, uint64_t, uint64_t))(v13 + 104);
  v28 = v12;
  v92 = v12;
  v111(v15, v27, v12);
  LODWORD(v103) = *MEMORY[0x24BDF1668];
  v29 = v103;
  v30 = sub_23DE87810();
  v31 = MEMORY[0x24BDF1678];
  v32 = *(_QWORD *)(v30 - 8);
  v102 = *(void (**)(char *, uint64_t))(v32 + 104);
  v33 = v29;
  v34 = v30;
  v96 = v30;
  v102(v11, v33);
  v100 = *(void (**)(char *, _QWORD, uint64_t, uint64_t))(v32 + 56);
  v100(v11, 0, 1, v34);
  v94 = v15;
  sub_23DE87834();
  sub_23DE7A18C((uint64_t)v11, (uint64_t)&qword_256D0D5F8, (uint64_t)v31, (uint64_t)MEMORY[0x24BEE1C68], (uint64_t (*)(_QWORD))sub_23DE7349C);
  v99 = *(void (**)(char *, uint64_t))(v13 + 8);
  v99(v15, v28);
  sub_23DE87828();
  sub_23DE87840();
  swift_release();
  v98 = *MEMORY[0x24BDF17C8];
  v35 = v112;
  v97 = *(void (**)(char *))(v112 + 104);
  v36 = v114;
  v37 = v116;
  v97(v114);
  sub_23DE87858();
  swift_release();
  v95 = *(void (**)(char *, uint64_t))(v35 + 8);
  v95(v36, v37);
  v38 = v101;
  v39 = v93;
  v40 = sub_23DE8787C();
  v42 = v41;
  LOBYTE(v35) = v43;
  v112 = v44;
  swift_release();
  sub_23DE7B128(v38, v39, v26);
  swift_bridgeObjectRelease();
  KeyPath = swift_getKeyPath();
  v150 = sub_23DE87918();
  sub_23DE7B184();
  v46 = sub_23DE87930();
  v150 = v40;
  v151 = v42;
  v152 = v35 & 1;
  v154 = v112;
  v155 = KeyPath;
  v156 = 0x3FE0000000000000;
  v157 = v46;
  sub_23DE749B4();
  sub_23DE75234(&qword_256D0D320, (uint64_t (*)(uint64_t))sub_23DE749B4, (uint64_t (*)(void))sub_23DE74A50, (uint64_t (*)(void))sub_23DE74B30);
  sub_23DE878A0();
  sub_23DE7B128(v40, v42, v35 & 1);
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  v150 = sub_23DE787F8(v113);
  v151 = v47;
  v112 = sub_23DE87894();
  v109 = v48;
  LOBYTE(v35) = v49;
  v115 = v50;
  LODWORD(v101) = sub_23DE87804();
  sub_23DE875C4();
  v52 = v51;
  v54 = v53;
  v56 = v55;
  v58 = v57;
  v59 = v94;
  v60 = v92;
  v111(v94, *MEMORY[0x24BDF1880], v92);
  v61 = v96;
  ((void (*)(char *, _QWORD, uint64_t))v102)(v11, v103, v96);
  v100(v11, 0, 1, v61);
  sub_23DE87834();
  sub_23DE7A18C((uint64_t)v11, (uint64_t)&qword_256D0D5F8, (uint64_t)MEMORY[0x24BDF1678], (uint64_t)MEMORY[0x24BEE1C68], (uint64_t (*)(_QWORD))sub_23DE7349C);
  v99(v59, v60);
  sub_23DE8781C();
  sub_23DE87840();
  swift_release();
  v62 = v114;
  v63 = v116;
  ((void (*)(char *, _QWORD, uint64_t))v97)(v114, v98, v116);
  v103 = sub_23DE87858();
  swift_release();
  v95(v62, v63);
  v110 = swift_getKeyPath();
  v64 = objc_msgSend((id)objc_opt_self(), sel_labelColor);
  v116 = MEMORY[0x242646D0C](v64);
  v114 = (char *)swift_getKeyPath();
  v113 = swift_getKeyPath();
  v134 = v35 & 1;
  v131 = 0;
  v128 = 0;
  v102 = (void (*)(char *, uint64_t))swift_getKeyPath();
  v65 = v134;
  LODWORD(v99) = v134;
  v139[0] = *(_DWORD *)v133;
  *(_DWORD *)((char *)v139 + 3) = *(_DWORD *)&v133[3];
  v138[0] = *(_DWORD *)v132;
  *(_DWORD *)((char *)v138 + 3) = *(_DWORD *)&v132[3];
  LOBYTE(v38) = v131;
  LODWORD(v100) = v131;
  v137[0] = *(_DWORD *)v130;
  *(_DWORD *)((char *)v137 + 3) = *(_DWORD *)&v130[3];
  *(_DWORD *)((char *)v136 + 3) = *(_DWORD *)&v129[3];
  v136[0] = *(_DWORD *)v129;
  LODWORD(v111) = v128;
  v66 = v119;
  sub_23DE78A44(v104, v119);
  v67 = v118;
  v68 = *(void (**)(char *, char *, uint64_t))(v117 + 16);
  v69 = v105;
  v68(v118, v121, v105);
  v127 = 0;
  v126[0] = v139[0];
  *(_DWORD *)((char *)v126 + 3) = *(_DWORD *)((char *)v139 + 3);
  v125[0] = v138[0];
  *(_DWORD *)((char *)v125 + 3) = *(_DWORD *)((char *)v138 + 3);
  v124[0] = v137[0];
  *(_DWORD *)((char *)v124 + 3) = *(_DWORD *)((char *)v137 + 3);
  *(_DWORD *)((char *)v123 + 3) = *(_DWORD *)((char *)v136 + 3);
  v123[0] = v136[0];
  *(_DWORD *)((char *)v122 + 3) = *(_DWORD *)&v135[3];
  v122[0] = *(_DWORD *)v135;
  v70 = *(void (**)(char *, uint64_t, uint64_t))(v120 + 16);
  v72 = v107;
  v71 = v108;
  v70(v107, v66, v108);
  v73 = v106;
  v68(v106, v67, v69);
  sub_23DE74894();
  v75 = &v73[v74[12]];
  v76 = v127;
  *(_QWORD *)v75 = 0;
  v75[8] = v76;
  v77 = &v73[v74[16]];
  *(_QWORD *)&v140 = v112;
  *((_QWORD *)&v140 + 1) = v109;
  LOBYTE(v141) = v65;
  *(_DWORD *)((char *)&v141 + 1) = v126[0];
  DWORD1(v141) = *(_DWORD *)((char *)v126 + 3);
  *((_QWORD *)&v141 + 1) = v115;
  v78 = v101;
  LOBYTE(v142) = v101;
  DWORD1(v142) = *(_DWORD *)((char *)v125 + 3);
  *(_DWORD *)((char *)&v142 + 1) = v125[0];
  *((_QWORD *)&v142 + 1) = v52;
  *(_QWORD *)&v143 = v54;
  *((_QWORD *)&v143 + 1) = v56;
  *(_QWORD *)&v144 = v58;
  BYTE8(v144) = v38;
  HIDWORD(v144) = *(_DWORD *)((char *)v124 + 3);
  *(_DWORD *)((char *)&v144 + 9) = v124[0];
  v79 = v103;
  *(_QWORD *)&v145 = v110;
  *((_QWORD *)&v145 + 1) = v103;
  *(_QWORD *)&v146 = v116;
  *((_QWORD *)&v146 + 1) = v114;
  LOBYTE(v147) = 0;
  DWORD1(v147) = *(_DWORD *)((char *)v123 + 3);
  *(_DWORD *)((char *)&v147 + 1) = v123[0];
  *((_QWORD *)&v147 + 1) = v113;
  *(_QWORD *)&v148 = 2;
  BYTE8(v148) = (_BYTE)v111;
  HIDWORD(v148) = *(_DWORD *)((char *)v122 + 3);
  *(_DWORD *)((char *)&v148 + 9) = v122[0];
  v80 = v102;
  *(_QWORD *)&v149 = v102;
  *((_QWORD *)&v149 + 1) = 0x3FE0000000000000;
  v81 = v141;
  *(_OWORD *)v77 = v140;
  *((_OWORD *)v77 + 1) = v81;
  v82 = v142;
  v83 = v143;
  v84 = v145;
  *((_OWORD *)v77 + 4) = v144;
  *((_OWORD *)v77 + 5) = v84;
  *((_OWORD *)v77 + 2) = v82;
  *((_OWORD *)v77 + 3) = v83;
  v85 = v146;
  v86 = v147;
  v87 = v149;
  *((_OWORD *)v77 + 8) = v148;
  *((_OWORD *)v77 + 9) = v87;
  *((_OWORD *)v77 + 6) = v85;
  *((_OWORD *)v77 + 7) = v86;
  v70(&v73[v74[20]], (uint64_t)v72, v71);
  sub_23DE7B2C0((uint64_t)&v140);
  v88 = *(void (**)(uint64_t, uint64_t))(v120 + 8);
  v88(v119, v71);
  v89 = *(void (**)(char *, uint64_t))(v117 + 8);
  v89(v121, v69);
  v88((uint64_t)v72, v71);
  v150 = v112;
  v151 = v109;
  v152 = (char)v99;
  *(_DWORD *)v153 = v126[0];
  *(_DWORD *)&v153[3] = *(_DWORD *)((char *)v126 + 3);
  v154 = v115;
  LOBYTE(v155) = v78;
  *(_DWORD *)((char *)&v155 + 1) = v125[0];
  HIDWORD(v155) = *(_DWORD *)((char *)v125 + 3);
  v156 = v52;
  v157 = v54;
  v158 = v56;
  v159 = v58;
  v160 = (char)v100;
  *(_DWORD *)&v161[3] = *(_DWORD *)((char *)v124 + 3);
  *(_DWORD *)v161 = v124[0];
  v162 = v110;
  v163 = v79;
  v164 = v116;
  v165 = v114;
  v166 = 0;
  *(_DWORD *)&v167[3] = *(_DWORD *)((char *)v123 + 3);
  *(_DWORD *)v167 = v123[0];
  v168 = v113;
  v169 = 2;
  v170 = (char)v111;
  *(_DWORD *)&v171[3] = *(_DWORD *)((char *)v122 + 3);
  *(_DWORD *)v171 = v122[0];
  v172 = v80;
  v173 = 0x3FE0000000000000;
  sub_23DE7B364((uint64_t)&v150);
  return ((uint64_t (*)(char *, uint64_t))v89)(v118, v69);
}

uint64_t sub_23DE787F8(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  void *v12;
  void *v13;
  void (*v14)(char *, uint64_t);
  id v15;
  uint64_t v16;
  uint64_t v17;
  void (*v18)(char *, uint64_t);
  void *v19;
  id v20;
  uint64_t v22;
  uint64_t v23;
  id v24;
  uint64_t v25;
  uint64_t v26;

  v2 = sub_23DE8760C();
  v26 = *(_QWORD *)(v2 - 8);
  v3 = MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v22 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v3);
  v7 = (char *)&v22 - v6;
  v8 = sub_23DE8745C();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)&v22 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = (void *)objc_opt_self();
  sub_23DE87450();
  v13 = (void *)sub_23DE8742C();
  v14 = *(void (**)(char *, uint64_t))(v9 + 8);
  v23 = v8;
  v14(v11, v8);
  v24 = v12;
  v25 = a1;
  v15 = objc_msgSend(v12, sel_gestationalAgeStringOnDate_pregnancySample_, v13, a1);

  v16 = sub_23DE87AF8();
  type metadata accessor for MenstrualCyclesWidgetRectangularView();
  sub_23DE843CC((uint64_t)v7);
  v17 = v26;
  (*(void (**)(char *, _QWORD, uint64_t))(v26 + 104))(v5, *MEMORY[0x24BDECF38], v2);
  sub_23DE7AFC8(&qword_256D0D610, (uint64_t (*)(uint64_t))MEMORY[0x24BDECF50], MEMORY[0x24BDECF70]);
  LOBYTE(v15) = sub_23DE87ABC();
  v18 = *(void (**)(char *, uint64_t))(v17 + 8);
  v18(v5, v2);
  v18(v7, v2);
  if ((v15 & 1) == 0)
  {
    swift_bridgeObjectRelease();
    sub_23DE87450();
    v19 = (void *)sub_23DE8742C();
    v14(v11, v23);
    v20 = objc_msgSend(v24, sel_gestationalAgeCompactStringOnDate_pregnancySample_, v19, v25);

    v16 = sub_23DE87AF8();
  }
  return v16;
}

uint64_t sub_23DE78A44@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
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
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
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
  uint64_t v27;
  uint64_t v28;
  __int128 *v29;
  __int128 v30;
  uint64_t KeyPath;
  uint64_t v32;
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t *v42;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  char *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;

  v53 = a2;
  v54 = a1;
  sub_23DE7516C(0);
  MEMORY[0x24BDAC7A8](v2);
  v52 = (char *)&v44 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = sub_23DE87588();
  v47 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)&v44 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23DE750D4();
  v8 = v7;
  v44 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7);
  v10 = (char *)&v44 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23DE75000(0);
  v48 = v11;
  v46 = *(_QWORD *)(v11 - 8);
  MEMORY[0x24BDAC7A8](v11);
  v13 = (char *)&v44 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23DE74FE4(0);
  v45 = v14;
  MEMORY[0x24BDAC7A8](v14);
  v16 = (char *)&v44 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23DE74FC0(0);
  v49 = v17;
  MEMORY[0x24BDAC7A8](v17);
  v19 = (char *)&v44 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23DE74F44();
  v50 = v20;
  MEMORY[0x24BDAC7A8](v20);
  v22 = (char *)&v44 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23DE74F20(0);
  v51 = v23;
  MEMORY[0x24BDAC7A8](v23);
  v25 = (char *)&v44 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23DE87558();
  v55 = v26;
  v56 = xmmword_23DE88460;
  sub_23DE7B3F8();
  sub_23DE8793C();
  sub_23DE875D0();
  sub_23DE7AFC8(&qword_256D0D3D0, (uint64_t (*)(uint64_t))sub_23DE750D4, MEMORY[0x24BDF3EE8]);
  sub_23DE7AFC8(&qword_256D0D3D8, (uint64_t (*)(uint64_t))MEMORY[0x24BE46CB0], MEMORY[0x24BE46CA8]);
  sub_23DE878D0();
  (*(void (**)(char *, uint64_t))(v47 + 8))(v6, v4);
  (*(void (**)(char *, uint64_t))(v44 + 8))(v10, v8);
  sub_23DE879A8();
  sub_23DE875F4();
  v27 = v46;
  v28 = v48;
  (*(void (**)(char *, char *, uint64_t))(v46 + 16))(v16, v13, v48);
  v29 = (__int128 *)&v16[*(int *)(v45 + 36)];
  v30 = v57;
  *v29 = v56;
  v29[1] = v30;
  v29[2] = v58;
  (*(void (**)(char *, uint64_t))(v27 + 8))(v13, v28);
  KeyPath = swift_getKeyPath();
  v32 = sub_23DE87990();
  v33 = (uint64_t)v52;
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v32 - 8) + 56))(v52, 1, 1, v32);
  v34 = (uint64_t *)&v19[*(int *)(v49 + 36)];
  sub_23DE75150(0);
  sub_23DE73DA8(v33, (uint64_t)v34 + *(int *)(v35 + 28), (uint64_t (*)(_QWORD))sub_23DE7516C);
  *v34 = KeyPath;
  sub_23DE73DA8((uint64_t)v16, (uint64_t)v19, (uint64_t (*)(_QWORD))sub_23DE74FE4);
  sub_23DE6EFC4(v33, (uint64_t (*)(_QWORD))sub_23DE7516C);
  sub_23DE6EFC4((uint64_t)v16, (uint64_t (*)(_QWORD))sub_23DE74FE4);
  v36 = swift_getKeyPath();
  sub_23DE87564();
  v38 = v37;
  sub_23DE73DA8((uint64_t)v19, (uint64_t)v22, (uint64_t (*)(_QWORD))sub_23DE74FC0);
  v39 = (uint64_t *)&v22[*(int *)(v50 + 36)];
  *v39 = v36;
  v39[1] = v38;
  sub_23DE6EFC4((uint64_t)v19, (uint64_t (*)(_QWORD))sub_23DE74FC0);
  v40 = swift_getKeyPath();
  sub_23DE6F000(0, &qword_256D0D3F8);
  v41 = sub_23DE87BA0();
  sub_23DE73DA8((uint64_t)v22, (uint64_t)v25, (uint64_t (*)(_QWORD))sub_23DE74F44);
  v42 = (uint64_t *)&v25[*(int *)(v51 + 36)];
  *v42 = v40;
  v42[1] = v41;
  sub_23DE6EFC4((uint64_t)v22, (uint64_t (*)(_QWORD))sub_23DE74F44);
  sub_23DE75234(&qword_256D0D400, (uint64_t (*)(uint64_t))sub_23DE74F20, sub_23DE751EC, sub_23DE753AC);
  sub_23DE878A0();
  return sub_23DE6EFC4((uint64_t)v25, (uint64_t (*)(_QWORD))sub_23DE74F20);
}

uint64_t sub_23DE78F4C@<X0>(uint64_t a1@<X8>)
{
  uint64_t result;
  uint64_t v3;
  char v4;
  uint64_t v5;

  sub_23DE87744();
  result = sub_23DE87888();
  *(_QWORD *)a1 = result;
  *(_QWORD *)(a1 + 8) = v3;
  *(_BYTE *)(a1 + 16) = v4 & 1;
  *(_QWORD *)(a1 + 24) = v5;
  return result;
}

uint64_t sub_23DE78FB0(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t (*v4)(_QWORD);
  uint64_t v6;

  sub_23DE7516C(0);
  MEMORY[0x24BDAC7A8](v2);
  sub_23DE73DA8(a1, (uint64_t)&v6 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0), v4);
  return sub_23DE87690();
}

uint64_t sub_23DE79034()
{
  return sub_23DE878E8();
}

uint64_t sub_23DE7904C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t (*v2)(void);
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12;

  v1 = MEMORY[0x24BDCDAC0];
  v2 = MEMORY[0x24BEE1C68];
  sub_23DE7349C(0, &qword_256D0D2B8, MEMORY[0x24BDCDAC0], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1C68]);
  MEMORY[0x24BDAC7A8](v3);
  v5 = (char *)&v12 - v4;
  sub_23DE7471C();
  MEMORY[0x24BDAC7A8](v6);
  v8 = (uint64_t *)((char *)&v12 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0));
  *v8 = sub_23DE879A8();
  v8[1] = v9;
  sub_23DE76188();
  sub_23DE75C5C(v0, (uint64_t)v8 + *(int *)(v10 + 44));
  sub_23DE87414();
  sub_23DE7AFC8(&qword_256D0D500, (uint64_t (*)(uint64_t))sub_23DE7471C, MEMORY[0x24BDF4750]);
  sub_23DE878AC();
  sub_23DE7A18C((uint64_t)v5, (uint64_t)&qword_256D0D2B8, v1, (uint64_t)v2, (uint64_t (*)(_QWORD))sub_23DE7349C);
  return sub_23DE6EFC4((uint64_t)v8, (uint64_t (*)(_QWORD))sub_23DE7471C);
}

uint64_t *initializeBufferWithCopyOfBuffer for MenstrualCyclesWidgetRectangularView(uint64_t *a1, uint64_t *a2, int *a3)
{
  int v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  _QWORD *v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD *v14;
  _QWORD *v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD *v18;
  _QWORD *v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  char *v23;
  uint64_t v24;
  char v25;
  uint64_t v26;
  void **v27;
  void **v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  void *v36;
  uint64_t v37;
  char *v38;
  uint64_t v39;
  void (*v40)(char *, char *, uint64_t);
  id v41;
  char *v43;

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
    sub_23DE7349C(0, &qword_25432B9C0, (uint64_t (*)(uint64_t))MEMORY[0x24BDFAF10], MEMORY[0x24BDEB560]);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v7 = sub_23DE87A14();
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a1, a2, v7);
    }
    else
    {
      *a1 = *a2;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
    v9 = a3[5];
    v10 = (uint64_t *)((char *)a1 + v9);
    v11 = (uint64_t *)((char *)a2 + v9);
    sub_23DE7349C(0, &qword_256D0D508, (uint64_t (*)(uint64_t))MEMORY[0x24BDFADE0], MEMORY[0x24BDEB560]);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v12 = sub_23DE879FC();
      (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v12 - 8) + 16))(v10, v11, v12);
    }
    else
    {
      *v10 = *v11;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
    v13 = a3[6];
    v14 = (uint64_t *)((char *)a1 + v13);
    v15 = (uint64_t *)((char *)a2 + v13);
    sub_23DE7349C(0, &qword_256D0D510, (uint64_t (*)(uint64_t))MEMORY[0x24BDEB418], MEMORY[0x24BDEB560]);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v16 = sub_23DE875E8();
      (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v16 - 8) + 16))(v14, v15, v16);
    }
    else
    {
      *v14 = *v15;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
    v17 = a3[7];
    v18 = (uint64_t *)((char *)a1 + v17);
    v19 = (uint64_t *)((char *)a2 + v17);
    sub_23DE7349C(0, &qword_256D0D518, (uint64_t (*)(uint64_t))MEMORY[0x24BDECF50], MEMORY[0x24BDEB560]);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v20 = sub_23DE8760C();
      (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v20 - 8) + 16))(v18, v19, v20);
    }
    else
    {
      *v18 = *v19;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
    v21 = a3[8];
    v22 = (char *)a1 + v21;
    v23 = (char *)a2 + v21;
    v24 = *(_QWORD *)v23;
    v25 = v23[8];
    sub_23DE795B0(*(_QWORD *)v23, v25);
    *(_QWORD *)v22 = v24;
    v22[8] = v25;
    v26 = a3[9];
    v27 = (void **)((char *)a1 + v26);
    v28 = (void **)((char *)a2 + v26);
    v29 = type metadata accessor for MenstrualCyclesWidgetEntry.State(0);
    v30 = *(_QWORD *)(v29 - 8);
    if ((*(unsigned int (**)(void **, uint64_t, uint64_t))(v30 + 48))(v28, 1, v29))
    {
      sub_23DE7349C(0, &qword_25432BB38, type metadata accessor for MenstrualCyclesWidgetEntry.State, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1C68]);
      memcpy(v27, v28, *(_QWORD *)(*(_QWORD *)(v31 - 8) + 64));
    }
    else
    {
      sub_23DE6D5EC();
      v33 = v32;
      v34 = *(_QWORD *)(v32 - 8);
      if ((*(unsigned int (**)(void **, uint64_t, uint64_t))(v34 + 48))(v28, 1, v32))
      {
        memcpy(v27, v28, *(_QWORD *)(v30 + 64));
      }
      else
      {
        v36 = *v28;
        v35 = v28[1];
        *v27 = *v28;
        v27[1] = v35;
        v37 = *(int *)(v33 + 64);
        v38 = (char *)v27 + v37;
        v43 = (char *)v28 + v37;
        v39 = sub_23DE8757C();
        v40 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v39 - 8) + 16);
        v41 = v36;
        v40(v38, v43, v39);
        (*(void (**)(void **, _QWORD, uint64_t, uint64_t))(v34 + 56))(v27, 0, 1, v33);
      }
      (*(void (**)(void **, _QWORD, uint64_t, uint64_t))(v30 + 56))(v27, 0, 1, v29);
    }
  }
  return a1;
}

uint64_t sub_23DE795B0(uint64_t a1, char a2)
{
  uint64_t result;

  if ((a2 & 1) == 0)
    return swift_retain();
  return result;
}

uint64_t destroy for MenstrualCyclesWidgetRectangularView(uint64_t a1, int *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id *v11;
  uint64_t v12;
  uint64_t result;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;

  sub_23DE7349C(0, &qword_25432B9C0, (uint64_t (*)(uint64_t))MEMORY[0x24BDFAF10], MEMORY[0x24BDEB560]);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v4 = sub_23DE87A14();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(a1, v4);
  }
  else
  {
    swift_release();
  }
  v5 = a1 + a2[5];
  sub_23DE7349C(0, &qword_256D0D508, (uint64_t (*)(uint64_t))MEMORY[0x24BDFADE0], MEMORY[0x24BDEB560]);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v6 = sub_23DE879FC();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 8))(v5, v6);
  }
  else
  {
    swift_release();
  }
  v7 = a1 + a2[6];
  sub_23DE7349C(0, &qword_256D0D510, (uint64_t (*)(uint64_t))MEMORY[0x24BDEB418], MEMORY[0x24BDEB560]);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v8 = sub_23DE875E8();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 8))(v7, v8);
  }
  else
  {
    swift_release();
  }
  v9 = a1 + a2[7];
  sub_23DE7349C(0, &qword_256D0D518, (uint64_t (*)(uint64_t))MEMORY[0x24BDECF50], MEMORY[0x24BDEB560]);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v10 = sub_23DE8760C();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 8))(v9, v10);
  }
  else
  {
    swift_release();
  }
  sub_23DE7980C(*(_QWORD *)(a1 + a2[8]), *(_BYTE *)(a1 + a2[8] + 8));
  v11 = (id *)(a1 + a2[9]);
  v12 = type metadata accessor for MenstrualCyclesWidgetEntry.State(0);
  result = (*(uint64_t (**)(id *, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 48))(v11, 1, v12);
  if (!(_DWORD)result)
  {
    sub_23DE6D5EC();
    v15 = v14;
    result = (*(uint64_t (**)(id *, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 48))(v11, 1, v14);
    if (!(_DWORD)result)
    {

      v16 = (char *)v11 + *(int *)(v15 + 64);
      v17 = sub_23DE8757C();
      return (*(uint64_t (**)(char *, uint64_t))(*(_QWORD *)(v17 - 8) + 8))(v16, v17);
    }
  }
  return result;
}

uint64_t sub_23DE7980C(uint64_t a1, char a2)
{
  uint64_t result;

  if ((a2 & 1) == 0)
    return swift_release();
  return result;
}

_QWORD *initializeWithCopy for MenstrualCyclesWidgetRectangularView(_QWORD *a1, _QWORD *a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  _QWORD *v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  _QWORD *v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD *v16;
  _QWORD *v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  char *v21;
  uint64_t v22;
  char v23;
  uint64_t v24;
  void **v25;
  void **v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  void *v34;
  uint64_t v35;
  char *v36;
  uint64_t v37;
  void (*v38)(char *, char *, uint64_t);
  id v39;
  char *v41;

  sub_23DE7349C(0, &qword_25432B9C0, (uint64_t (*)(uint64_t))MEMORY[0x24BDFAF10], MEMORY[0x24BDEB560]);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v6 = sub_23DE87A14();
    (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(a1, a2, v6);
  }
  else
  {
    *a1 = *a2;
    swift_retain();
  }
  swift_storeEnumTagMultiPayload();
  v7 = a3[5];
  v8 = (_QWORD *)((char *)a1 + v7);
  v9 = (_QWORD *)((char *)a2 + v7);
  sub_23DE7349C(0, &qword_256D0D508, (uint64_t (*)(uint64_t))MEMORY[0x24BDFADE0], MEMORY[0x24BDEB560]);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v10 = sub_23DE879FC();
    (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v10 - 8) + 16))(v8, v9, v10);
  }
  else
  {
    *v8 = *v9;
    swift_retain();
  }
  swift_storeEnumTagMultiPayload();
  v11 = a3[6];
  v12 = (_QWORD *)((char *)a1 + v11);
  v13 = (_QWORD *)((char *)a2 + v11);
  sub_23DE7349C(0, &qword_256D0D510, (uint64_t (*)(uint64_t))MEMORY[0x24BDEB418], MEMORY[0x24BDEB560]);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v14 = sub_23DE875E8();
    (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v14 - 8) + 16))(v12, v13, v14);
  }
  else
  {
    *v12 = *v13;
    swift_retain();
  }
  swift_storeEnumTagMultiPayload();
  v15 = a3[7];
  v16 = (_QWORD *)((char *)a1 + v15);
  v17 = (_QWORD *)((char *)a2 + v15);
  sub_23DE7349C(0, &qword_256D0D518, (uint64_t (*)(uint64_t))MEMORY[0x24BDECF50], MEMORY[0x24BDEB560]);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v18 = sub_23DE8760C();
    (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v18 - 8) + 16))(v16, v17, v18);
  }
  else
  {
    *v16 = *v17;
    swift_retain();
  }
  swift_storeEnumTagMultiPayload();
  v19 = a3[8];
  v20 = (char *)a1 + v19;
  v21 = (char *)a2 + v19;
  v22 = *(_QWORD *)v21;
  v23 = v21[8];
  sub_23DE795B0(*(_QWORD *)v21, v23);
  *(_QWORD *)v20 = v22;
  v20[8] = v23;
  v24 = a3[9];
  v25 = (void **)((char *)a1 + v24);
  v26 = (void **)((char *)a2 + v24);
  v27 = type metadata accessor for MenstrualCyclesWidgetEntry.State(0);
  v28 = *(_QWORD *)(v27 - 8);
  if ((*(unsigned int (**)(void **, uint64_t, uint64_t))(v28 + 48))(v26, 1, v27))
  {
    sub_23DE7349C(0, &qword_25432BB38, type metadata accessor for MenstrualCyclesWidgetEntry.State, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1C68]);
    memcpy(v25, v26, *(_QWORD *)(*(_QWORD *)(v29 - 8) + 64));
  }
  else
  {
    sub_23DE6D5EC();
    v31 = v30;
    v32 = *(_QWORD *)(v30 - 8);
    if ((*(unsigned int (**)(void **, uint64_t, uint64_t))(v32 + 48))(v26, 1, v30))
    {
      memcpy(v25, v26, *(_QWORD *)(v28 + 64));
    }
    else
    {
      v34 = *v26;
      v33 = v26[1];
      *v25 = *v26;
      v25[1] = v33;
      v35 = *(int *)(v31 + 64);
      v36 = (char *)v25 + v35;
      v41 = (char *)v26 + v35;
      v37 = sub_23DE8757C();
      v38 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v37 - 8) + 16);
      v39 = v34;
      v38(v36, v41, v37);
      (*(void (**)(void **, _QWORD, uint64_t, uint64_t))(v32 + 56))(v25, 0, 1, v31);
    }
    (*(void (**)(void **, _QWORD, uint64_t, uint64_t))(v28 + 56))(v25, 0, 1, v27);
  }
  return a1;
}

_QWORD *assignWithCopy for MenstrualCyclesWidgetRectangularView(_QWORD *a1, _QWORD *a2, int *a3)
{
  uint64_t (*v6)(uint64_t);
  uint64_t (*v7)(uint64_t, uint64_t);
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  _QWORD *v11;
  uint64_t (*v12)(uint64_t);
  uint64_t (*v13)(uint64_t, uint64_t);
  uint64_t v14;
  uint64_t v15;
  _QWORD *v16;
  _QWORD *v17;
  uint64_t (*v18)(uint64_t);
  uint64_t v19;
  uint64_t v20;
  _QWORD *v21;
  _QWORD *v22;
  uint64_t (*v23)(uint64_t);
  uint64_t v24;
  uint64_t v25;
  char *v26;
  char *v27;
  uint64_t v28;
  char v29;
  uint64_t v30;
  char v31;
  uint64_t v32;
  void **v33;
  void **v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t (*v37)(void **, uint64_t, uint64_t);
  int v38;
  int v39;
  uint64_t (*v40)(uint64_t, uint64_t);
  uint64_t v41;
  size_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t (*v49)(void **, uint64_t, uint64_t);
  int v50;
  int v51;
  void *v52;
  uint64_t v53;
  char *v54;
  char *v55;
  uint64_t v56;
  void (*v57)(char *, char *, uint64_t);
  id v58;
  void *v59;
  uint64_t v60;
  char *v61;
  uint64_t v62;
  void (*v63)(char *, char *, uint64_t);
  id v64;
  void *v66;
  void *v67;
  id v68;
  uint64_t v69;
  char *v70;
  char *v71;
  uint64_t v72;
  char *v73;

  if (a1 != a2)
  {
    v6 = (uint64_t (*)(uint64_t))MEMORY[0x24BDFAF10];
    v7 = (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BDEB560];
    sub_23DE7A18C((uint64_t)a1, (uint64_t)&qword_25432B9C0, (uint64_t)MEMORY[0x24BDFAF10], MEMORY[0x24BDEB560], (uint64_t (*)(_QWORD))sub_23DE7349C);
    sub_23DE7349C(0, &qword_25432B9C0, v6, v7);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v8 = sub_23DE87A14();
      (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v8 - 8) + 16))(a1, a2, v8);
    }
    else
    {
      *a1 = *a2;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
    v9 = a3[5];
    v10 = (_QWORD *)((char *)a1 + v9);
    v11 = (_QWORD *)((char *)a2 + v9);
    v12 = (uint64_t (*)(uint64_t))MEMORY[0x24BDFADE0];
    v13 = (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BDEB560];
    sub_23DE7A18C((uint64_t)a1 + v9, (uint64_t)&qword_256D0D508, (uint64_t)MEMORY[0x24BDFADE0], MEMORY[0x24BDEB560], (uint64_t (*)(_QWORD))sub_23DE7349C);
    sub_23DE7349C(0, &qword_256D0D508, v12, v13);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v14 = sub_23DE879FC();
      (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v14 - 8) + 16))(v10, v11, v14);
    }
    else
    {
      *v10 = *v11;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
    v15 = a3[6];
    v16 = (_QWORD *)((char *)a1 + v15);
    v17 = (_QWORD *)((char *)a2 + v15);
    v18 = (uint64_t (*)(uint64_t))MEMORY[0x24BDEB418];
    sub_23DE7A18C((uint64_t)a1 + v15, (uint64_t)&qword_256D0D510, (uint64_t)MEMORY[0x24BDEB418], (uint64_t)v13, (uint64_t (*)(_QWORD))sub_23DE7349C);
    sub_23DE7349C(0, &qword_256D0D510, v18, v13);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v19 = sub_23DE875E8();
      (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v19 - 8) + 16))(v16, v17, v19);
    }
    else
    {
      *v16 = *v17;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
    v20 = a3[7];
    v21 = (_QWORD *)((char *)a1 + v20);
    v22 = (_QWORD *)((char *)a2 + v20);
    v23 = (uint64_t (*)(uint64_t))MEMORY[0x24BDECF50];
    sub_23DE7A18C((uint64_t)a1 + v20, (uint64_t)&qword_256D0D518, (uint64_t)MEMORY[0x24BDECF50], (uint64_t)v13, (uint64_t (*)(_QWORD))sub_23DE7349C);
    sub_23DE7349C(0, &qword_256D0D518, v23, v13);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v24 = sub_23DE8760C();
      (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v24 - 8) + 16))(v21, v22, v24);
    }
    else
    {
      *v21 = *v22;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
  }
  v25 = a3[8];
  v26 = (char *)a1 + v25;
  v27 = (char *)a2 + v25;
  v28 = *(_QWORD *)v27;
  v29 = v27[8];
  sub_23DE795B0(*(_QWORD *)v27, v29);
  v30 = *(_QWORD *)v26;
  v31 = v26[8];
  *(_QWORD *)v26 = v28;
  v26[8] = v29;
  sub_23DE7980C(v30, v31);
  v32 = a3[9];
  v33 = (void **)((char *)a1 + v32);
  v34 = (void **)((char *)a2 + v32);
  v35 = type metadata accessor for MenstrualCyclesWidgetEntry.State(0);
  v36 = *(_QWORD *)(v35 - 8);
  v37 = *(uint64_t (**)(void **, uint64_t, uint64_t))(v36 + 48);
  v38 = v37(v33, 1, v35);
  v39 = v37(v34, 1, v35);
  if (!v38)
  {
    if (!v39)
    {
      sub_23DE6D5EC();
      v47 = v46;
      v48 = *(_QWORD *)(v46 - 8);
      v49 = *(uint64_t (**)(void **, uint64_t, uint64_t))(v48 + 48);
      v50 = v49(v33, 1, v46);
      v51 = v49(v34, 1, v47);
      if (v50)
      {
        if (!v51)
        {
          v52 = *v34;
          *v33 = *v34;
          v33[1] = v34[1];
          v53 = *(int *)(v47 + 64);
          v54 = (char *)v33 + v53;
          v55 = (char *)v34 + v53;
          v56 = sub_23DE8757C();
          v57 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v56 - 8) + 16);
          v58 = v52;
          v57(v54, v55, v56);
          (*(void (**)(void **, _QWORD, uint64_t, uint64_t))(v48 + 56))(v33, 0, 1, v47);
          return a1;
        }
      }
      else
      {
        if (!v51)
        {
          v66 = *v34;
          v67 = *v33;
          *v33 = *v34;
          v68 = v66;

          v33[1] = v34[1];
          v69 = *(int *)(v47 + 64);
          v70 = (char *)v33 + v69;
          v71 = (char *)v34 + v69;
          v72 = sub_23DE8757C();
          (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v72 - 8) + 24))(v70, v71, v72);
          return a1;
        }
        sub_23DE6EFC4((uint64_t)v33, (uint64_t (*)(_QWORD))sub_23DE6D5EC);
      }
      v42 = *(_QWORD *)(v36 + 64);
      goto LABEL_21;
    }
    sub_23DE6EFC4((uint64_t)v33, type metadata accessor for MenstrualCyclesWidgetEntry.State);
    v40 = (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1C68];
LABEL_20:
    sub_23DE7349C(0, &qword_25432BB38, type metadata accessor for MenstrualCyclesWidgetEntry.State, v40);
    v42 = *(_QWORD *)(*(_QWORD *)(v41 - 8) + 64);
LABEL_21:
    memcpy(v33, v34, v42);
    return a1;
  }
  if (v39)
  {
    v40 = (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1C68];
    goto LABEL_20;
  }
  sub_23DE6D5EC();
  v44 = v43;
  v45 = *(_QWORD *)(v43 - 8);
  if ((*(unsigned int (**)(void **, uint64_t, uint64_t))(v45 + 48))(v34, 1, v43))
  {
    memcpy(v33, v34, *(_QWORD *)(v36 + 64));
  }
  else
  {
    v59 = *v34;
    *v33 = *v34;
    v33[1] = v34[1];
    v60 = *(int *)(v44 + 64);
    v61 = (char *)v33 + v60;
    v73 = (char *)v34 + v60;
    v62 = sub_23DE8757C();
    v63 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v62 - 8) + 16);
    v64 = v59;
    v63(v61, v73, v62);
    (*(void (**)(void **, _QWORD, uint64_t, uint64_t))(v45 + 56))(v33, 0, 1, v44);
  }
  (*(void (**)(void **, _QWORD, uint64_t, uint64_t))(v36 + 56))(v33, 0, 1, v35);
  return a1;
}

uint64_t sub_23DE7A18C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t (*a5)(_QWORD))
{
  uint64_t v6;

  v6 = a5(0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 8))(a1, v6);
  return a1;
}

char *initializeWithTake for MenstrualCyclesWidgetRectangularView(char *a1, char *a2, int *a3)
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
  uint64_t v15;
  char *v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  char *v29;
  char *v30;
  char *v31;
  char *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  char *v41;
  char *v42;
  uint64_t v43;

  sub_23DE7349C(0, &qword_25432B9C0, (uint64_t (*)(uint64_t))MEMORY[0x24BDFAF10], MEMORY[0x24BDEB560]);
  v7 = v6;
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v8 = sub_23DE87A14();
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v8 - 8) + 32))(a1, a2, v8);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v7 - 8) + 64));
  }
  v9 = a3[5];
  v10 = &a1[v9];
  v11 = &a2[v9];
  sub_23DE7349C(0, &qword_256D0D508, (uint64_t (*)(uint64_t))MEMORY[0x24BDFADE0], MEMORY[0x24BDEB560]);
  v13 = v12;
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v14 = sub_23DE879FC();
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v14 - 8) + 32))(v10, v11, v14);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(v10, v11, *(_QWORD *)(*(_QWORD *)(v13 - 8) + 64));
  }
  v15 = a3[6];
  v16 = &a1[v15];
  v17 = &a2[v15];
  sub_23DE7349C(0, &qword_256D0D510, (uint64_t (*)(uint64_t))MEMORY[0x24BDEB418], MEMORY[0x24BDEB560]);
  v19 = v18;
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v20 = sub_23DE875E8();
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v20 - 8) + 32))(v16, v17, v20);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(v16, v17, *(_QWORD *)(*(_QWORD *)(v19 - 8) + 64));
  }
  v21 = a3[7];
  v22 = &a1[v21];
  v23 = &a2[v21];
  sub_23DE7349C(0, &qword_256D0D518, (uint64_t (*)(uint64_t))MEMORY[0x24BDECF50], MEMORY[0x24BDEB560]);
  v25 = v24;
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v26 = sub_23DE8760C();
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v26 - 8) + 32))(v22, v23, v26);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(v22, v23, *(_QWORD *)(*(_QWORD *)(v25 - 8) + 64));
  }
  v27 = a3[8];
  v28 = a3[9];
  v29 = &a1[v27];
  v30 = &a2[v27];
  *(_QWORD *)v29 = *(_QWORD *)v30;
  v29[8] = v30[8];
  v31 = &a1[v28];
  v32 = &a2[v28];
  v33 = type metadata accessor for MenstrualCyclesWidgetEntry.State(0);
  v34 = *(_QWORD *)(v33 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v34 + 48))(v32, 1, v33))
  {
    sub_23DE7349C(0, &qword_25432BB38, type metadata accessor for MenstrualCyclesWidgetEntry.State, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1C68]);
    memcpy(v31, v32, *(_QWORD *)(*(_QWORD *)(v35 - 8) + 64));
  }
  else
  {
    sub_23DE6D5EC();
    v37 = v36;
    v38 = *(_QWORD *)(v36 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v38 + 48))(v32, 1, v36))
    {
      memcpy(v31, v32, *(_QWORD *)(v34 + 64));
    }
    else
    {
      v39 = *((_QWORD *)v32 + 1);
      *(_QWORD *)v31 = *(_QWORD *)v32;
      *((_QWORD *)v31 + 1) = v39;
      v40 = *(int *)(v37 + 64);
      v41 = &v31[v40];
      v42 = &v32[v40];
      v43 = sub_23DE8757C();
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v43 - 8) + 32))(v41, v42, v43);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v38 + 56))(v31, 0, 1, v37);
    }
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v34 + 56))(v31, 0, 1, v33);
  }
  return a1;
}

char *assignWithTake for MenstrualCyclesWidgetRectangularView(char *a1, char *a2, int *a3)
{
  uint64_t (*v6)(uint64_t);
  uint64_t (*v7)(uint64_t, uint64_t);
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  char *v13;
  uint64_t (*v14)(uint64_t);
  uint64_t (*v15)(uint64_t, uint64_t);
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  char *v21;
  uint64_t (*v22)(uint64_t);
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  char *v27;
  char *v28;
  uint64_t (*v29)(uint64_t);
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  char *v34;
  char *v35;
  uint64_t v36;
  uint64_t v37;
  char v38;
  uint64_t v39;
  void **v40;
  void **v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t (*v44)(void **, uint64_t, uint64_t);
  int v45;
  int v46;
  uint64_t (*v47)(uint64_t, uint64_t);
  uint64_t v48;
  size_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t (*v56)(void **, uint64_t, uint64_t);
  int v57;
  int v58;
  void *v59;
  uint64_t v60;
  char *v61;
  char *v62;
  uint64_t v63;
  void *v64;
  uint64_t v65;
  char *v66;
  char *v67;
  uint64_t v68;
  void *v70;
  uint64_t v71;
  char *v72;
  char *v73;
  uint64_t v74;

  if (a1 != a2)
  {
    v6 = (uint64_t (*)(uint64_t))MEMORY[0x24BDFAF10];
    v7 = (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BDEB560];
    sub_23DE7A18C((uint64_t)a1, (uint64_t)&qword_25432B9C0, (uint64_t)MEMORY[0x24BDFAF10], MEMORY[0x24BDEB560], (uint64_t (*)(_QWORD))sub_23DE7349C);
    sub_23DE7349C(0, &qword_25432B9C0, v6, v7);
    v9 = v8;
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v10 = sub_23DE87A14();
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v10 - 8) + 32))(a1, a2, v10);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v9 - 8) + 64));
    }
    v11 = a3[5];
    v12 = &a1[v11];
    v13 = &a2[v11];
    v14 = (uint64_t (*)(uint64_t))MEMORY[0x24BDFADE0];
    v15 = (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BDEB560];
    sub_23DE7A18C((uint64_t)&a1[v11], (uint64_t)&qword_256D0D508, (uint64_t)MEMORY[0x24BDFADE0], MEMORY[0x24BDEB560], (uint64_t (*)(_QWORD))sub_23DE7349C);
    sub_23DE7349C(0, &qword_256D0D508, v14, v15);
    v17 = v16;
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v18 = sub_23DE879FC();
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v18 - 8) + 32))(v12, v13, v18);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(v12, v13, *(_QWORD *)(*(_QWORD *)(v17 - 8) + 64));
    }
    v19 = a3[6];
    v20 = &a1[v19];
    v21 = &a2[v19];
    v22 = (uint64_t (*)(uint64_t))MEMORY[0x24BDEB418];
    sub_23DE7A18C((uint64_t)&a1[v19], (uint64_t)&qword_256D0D510, (uint64_t)MEMORY[0x24BDEB418], (uint64_t)v15, (uint64_t (*)(_QWORD))sub_23DE7349C);
    sub_23DE7349C(0, &qword_256D0D510, v22, v15);
    v24 = v23;
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v25 = sub_23DE875E8();
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v25 - 8) + 32))(v20, v21, v25);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(v20, v21, *(_QWORD *)(*(_QWORD *)(v24 - 8) + 64));
    }
    v26 = a3[7];
    v27 = &a1[v26];
    v28 = &a2[v26];
    v29 = (uint64_t (*)(uint64_t))MEMORY[0x24BDECF50];
    sub_23DE7A18C((uint64_t)&a1[v26], (uint64_t)&qword_256D0D518, (uint64_t)MEMORY[0x24BDECF50], (uint64_t)v15, (uint64_t (*)(_QWORD))sub_23DE7349C);
    sub_23DE7349C(0, &qword_256D0D518, v29, v15);
    v31 = v30;
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v32 = sub_23DE8760C();
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v32 - 8) + 32))(v27, v28, v32);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(v27, v28, *(_QWORD *)(*(_QWORD *)(v31 - 8) + 64));
    }
  }
  v33 = a3[8];
  v34 = &a1[v33];
  v35 = &a2[v33];
  v36 = *(_QWORD *)v35;
  LOBYTE(v35) = v35[8];
  v37 = *(_QWORD *)v34;
  v38 = v34[8];
  *(_QWORD *)v34 = v36;
  v34[8] = (char)v35;
  sub_23DE7980C(v37, v38);
  v39 = a3[9];
  v40 = (void **)&a1[v39];
  v41 = (void **)&a2[v39];
  v42 = type metadata accessor for MenstrualCyclesWidgetEntry.State(0);
  v43 = *(_QWORD *)(v42 - 8);
  v44 = *(uint64_t (**)(void **, uint64_t, uint64_t))(v43 + 48);
  v45 = v44(v40, 1, v42);
  v46 = v44(v41, 1, v42);
  if (!v45)
  {
    if (!v46)
    {
      sub_23DE6D5EC();
      v54 = v53;
      v55 = *(_QWORD *)(v53 - 8);
      v56 = *(uint64_t (**)(void **, uint64_t, uint64_t))(v55 + 48);
      v57 = v56(v40, 1, v53);
      v58 = v56(v41, 1, v54);
      if (v57)
      {
        if (!v58)
        {
          v59 = v41[1];
          *v40 = *v41;
          v40[1] = v59;
          v60 = *(int *)(v54 + 64);
          v61 = (char *)v40 + v60;
          v62 = (char *)v41 + v60;
          v63 = sub_23DE8757C();
          (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v63 - 8) + 32))(v61, v62, v63);
          (*(void (**)(void **, _QWORD, uint64_t, uint64_t))(v55 + 56))(v40, 0, 1, v54);
          return a1;
        }
      }
      else
      {
        if (!v58)
        {
          v70 = *v40;
          *v40 = *v41;

          v40[1] = v41[1];
          v71 = *(int *)(v54 + 64);
          v72 = (char *)v40 + v71;
          v73 = (char *)v41 + v71;
          v74 = sub_23DE8757C();
          (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v74 - 8) + 40))(v72, v73, v74);
          return a1;
        }
        sub_23DE6EFC4((uint64_t)v40, (uint64_t (*)(_QWORD))sub_23DE6D5EC);
      }
      v49 = *(_QWORD *)(v43 + 64);
      goto LABEL_20;
    }
    sub_23DE6EFC4((uint64_t)v40, type metadata accessor for MenstrualCyclesWidgetEntry.State);
    v47 = (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1C68];
LABEL_19:
    sub_23DE7349C(0, &qword_25432BB38, type metadata accessor for MenstrualCyclesWidgetEntry.State, v47);
    v49 = *(_QWORD *)(*(_QWORD *)(v48 - 8) + 64);
LABEL_20:
    memcpy(v40, v41, v49);
    return a1;
  }
  if (v46)
  {
    v47 = (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1C68];
    goto LABEL_19;
  }
  sub_23DE6D5EC();
  v51 = v50;
  v52 = *(_QWORD *)(v50 - 8);
  if ((*(unsigned int (**)(void **, uint64_t, uint64_t))(v52 + 48))(v41, 1, v50))
  {
    memcpy(v40, v41, *(_QWORD *)(v43 + 64));
  }
  else
  {
    v64 = v41[1];
    *v40 = *v41;
    v40[1] = v64;
    v65 = *(int *)(v51 + 64);
    v66 = (char *)v40 + v65;
    v67 = (char *)v41 + v65;
    v68 = sub_23DE8757C();
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v68 - 8) + 32))(v66, v67, v68);
    (*(void (**)(void **, _QWORD, uint64_t, uint64_t))(v52 + 56))(v40, 0, 1, v51);
  }
  (*(void (**)(void **, _QWORD, uint64_t, uint64_t))(v43 + 56))(v40, 0, 1, v42);
  return a1;
}

uint64_t getEnumTagSinglePayload for MenstrualCyclesWidgetRectangularView()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_23DE7AAB8(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unsigned int v15;
  uint64_t v16;

  sub_23DE7349C(0, &qword_256D0D520, (uint64_t (*)(uint64_t))MEMORY[0x24BDFAF10], MEMORY[0x24BDEB580]);
  v7 = *(_QWORD *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == (_DWORD)a2)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, a2, v6);
  sub_23DE7349C(0, &qword_256D0D528, (uint64_t (*)(uint64_t))MEMORY[0x24BDFADE0], MEMORY[0x24BDEB580]);
  v10 = *(_QWORD *)(v9 - 8);
  if (*(_DWORD *)(v10 + 84) == (_DWORD)a2)
  {
    v11 = v9;
    v12 = a3[5];
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v10 + 48))(a1 + v12, a2, v11);
  }
  sub_23DE7349C(0, &qword_256D0D530, (uint64_t (*)(uint64_t))MEMORY[0x24BDEB418], MEMORY[0x24BDEB580]);
  v10 = *(_QWORD *)(v13 - 8);
  if (*(_DWORD *)(v10 + 84) == (_DWORD)a2)
  {
    v11 = v13;
    v12 = a3[6];
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v10 + 48))(a1 + v12, a2, v11);
  }
  sub_23DE7349C(0, &qword_256D0D538, (uint64_t (*)(uint64_t))MEMORY[0x24BDECF50], MEMORY[0x24BDEB580]);
  v10 = *(_QWORD *)(v14 - 8);
  if (*(_DWORD *)(v10 + 84) == (_DWORD)a2)
  {
    v11 = v14;
    v12 = a3[7];
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v10 + 48))(a1 + v12, a2, v11);
  }
  if ((_DWORD)a2 != 254)
  {
    sub_23DE7349C(0, &qword_25432BB38, type metadata accessor for MenstrualCyclesWidgetEntry.State, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1C68]);
    v11 = v16;
    v10 = *(_QWORD *)(v16 - 8);
    v12 = a3[9];
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v10 + 48))(a1 + v12, a2, v11);
  }
  v15 = *(unsigned __int8 *)(a1 + a3[8] + 8);
  if (v15 > 1)
    return (v15 ^ 0xFF) + 1;
  else
    return 0;
}

uint64_t storeEnumTagSinglePayload for MenstrualCyclesWidgetRectangularView()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

void sub_23DE7AC4C(uint64_t a1, uint64_t a2, int a3, int *a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  sub_23DE7349C(0, &qword_256D0D520, (uint64_t (*)(uint64_t))MEMORY[0x24BDFAF10], MEMORY[0x24BDEB580]);
  v9 = *(_QWORD *)(v8 - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    v10 = v8;
    v11 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    v12 = a1;
  }
  else
  {
    sub_23DE7349C(0, &qword_256D0D528, (uint64_t (*)(uint64_t))MEMORY[0x24BDFADE0], MEMORY[0x24BDEB580]);
    v14 = *(_QWORD *)(v13 - 8);
    if (*(_DWORD *)(v14 + 84) == a3)
    {
      v10 = v13;
      v15 = a4[5];
    }
    else
    {
      sub_23DE7349C(0, &qword_256D0D530, (uint64_t (*)(uint64_t))MEMORY[0x24BDEB418], MEMORY[0x24BDEB580]);
      v14 = *(_QWORD *)(v16 - 8);
      if (*(_DWORD *)(v14 + 84) == a3)
      {
        v10 = v16;
        v15 = a4[6];
      }
      else
      {
        sub_23DE7349C(0, &qword_256D0D538, (uint64_t (*)(uint64_t))MEMORY[0x24BDECF50], MEMORY[0x24BDEB580]);
        v14 = *(_QWORD *)(v17 - 8);
        if (*(_DWORD *)(v14 + 84) == a3)
        {
          v10 = v17;
          v15 = a4[7];
        }
        else
        {
          if (a3 == 254)
          {
            *(_BYTE *)(a1 + a4[8] + 8) = -(char)a2;
            return;
          }
          sub_23DE7349C(0, &qword_25432BB38, type metadata accessor for MenstrualCyclesWidgetEntry.State, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1C68]);
          v10 = v18;
          v14 = *(_QWORD *)(v18 - 8);
          v15 = a4[9];
        }
      }
    }
    v12 = a1 + v15;
    v11 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v14 + 56);
  }
  v11(v12, a2, a2, v10);
}

uint64_t type metadata accessor for MenstrualCyclesWidgetRectangularView()
{
  uint64_t result;

  result = qword_256D0D598;
  if (!qword_256D0D598)
    return swift_getSingletonMetadata();
  return result;
}

void sub_23DE7AE10()
{
  unint64_t v0;
  unint64_t v1;
  unint64_t v2;
  unint64_t v3;
  unint64_t v4;

  sub_23DE7349C(319, &qword_25432B9C0, (uint64_t (*)(uint64_t))MEMORY[0x24BDFAF10], MEMORY[0x24BDEB560]);
  if (v0 <= 0x3F)
  {
    sub_23DE7349C(319, &qword_256D0D508, (uint64_t (*)(uint64_t))MEMORY[0x24BDFADE0], MEMORY[0x24BDEB560]);
    if (v1 <= 0x3F)
    {
      sub_23DE7349C(319, &qword_256D0D510, (uint64_t (*)(uint64_t))MEMORY[0x24BDEB418], MEMORY[0x24BDEB560]);
      if (v2 <= 0x3F)
      {
        sub_23DE7349C(319, &qword_256D0D518, (uint64_t (*)(uint64_t))MEMORY[0x24BDECF50], MEMORY[0x24BDEB560]);
        if (v3 <= 0x3F)
        {
          sub_23DE7349C(319, &qword_25432BB38, type metadata accessor for MenstrualCyclesWidgetEntry.State, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1C68]);
          if (v4 <= 0x3F)
            swift_initStructMetadata();
        }
      }
    }
  }
}

uint64_t sub_23DE7AF68()
{
  sub_23DE7471C();
  sub_23DE7AFC8(&qword_256D0D500, (uint64_t (*)(uint64_t))sub_23DE7471C, MEMORY[0x24BDF4750]);
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_23DE7AFC8(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = a2(255);
    result = MEMORY[0x2426473FC](a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

void sub_23DE7B008(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t), uint64_t (*a4)(uint64_t), uint64_t (*a5)(uint64_t, uint64_t, uint64_t))
{
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;

  if (!*a2)
  {
    v9 = a3(255);
    v10 = a4(255);
    v11 = a5(a1, v9, v10);
    if (!v12)
      atomic_store(v11, a2);
  }
}

void sub_23DE7B07C(uint64_t a1, unint64_t *a2, void (*a3)(uint64_t))
{
  unint64_t v4;
  uint64_t v5;

  if (!*a2)
  {
    a3(255);
    v4 = sub_23DE87600();
    if (!v5)
      atomic_store(v4, a2);
  }
}

uint64_t sub_23DE7B0D8(uint64_t a1, uint64_t a2)
{
  return sub_23DE73DA8(a1, a2, (uint64_t (*)(_QWORD))sub_23DE747DC);
}

unint64_t sub_23DE7B0E4()
{
  unint64_t result;

  result = qword_25432BB50;
  if (!qword_25432BB50)
  {
    result = MEMORY[0x2426473FC](MEMORY[0x24BEE0D50], MEMORY[0x24BEE0D00]);
    atomic_store(result, (unint64_t *)&qword_25432BB50);
  }
  return result;
}

uint64_t sub_23DE7B128(uint64_t a1, uint64_t a2, char a3)
{
  if ((a3 & 1) != 0)
    return swift_release();
  else
    return swift_bridgeObjectRelease();
}

uint64_t sub_23DE7B138@<X0>(_QWORD *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;

  result = sub_23DE8769C();
  *a1 = v3;
  return result;
}

uint64_t sub_23DE7B160()
{
  return sub_23DE876A8();
}

unint64_t sub_23DE7B184()
{
  unint64_t result;

  result = qword_256D0D600;
  if (!qword_256D0D600)
  {
    result = MEMORY[0x2426473FC](MEMORY[0x24BDF3E58], MEMORY[0x24BDF3E48]);
    atomic_store(result, (unint64_t *)&qword_256D0D600);
  }
  return result;
}

uint64_t sub_23DE7B1C8@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  result = sub_23DE876CC();
  *a1 = result;
  return result;
}

uint64_t sub_23DE7B1F0()
{
  swift_retain();
  return sub_23DE876D8();
}

uint64_t sub_23DE7B218@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = sub_23DE876B4();
  *a1 = result;
  return result;
}

uint64_t sub_23DE7B240()
{
  return sub_23DE876C0();
}

uint64_t sub_23DE7B264@<X0>(uint64_t a1@<X8>)
{
  uint64_t result;
  char v3;

  result = sub_23DE87708();
  *(_QWORD *)a1 = result;
  *(_BYTE *)(a1 + 8) = v3 & 1;
  return result;
}

uint64_t sub_23DE7B294()
{
  return sub_23DE87714();
}

uint64_t sub_23DE7B2C0(uint64_t a1)
{
  sub_23DE7B354(*(_QWORD *)a1, *(_QWORD *)(a1 + 8), *(_BYTE *)(a1 + 16));
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_bridgeObjectRetain();
  swift_retain();
  return a1;
}

uint64_t sub_23DE7B354(uint64_t a1, uint64_t a2, char a3)
{
  if ((a3 & 1) != 0)
    return swift_retain();
  else
    return swift_bridgeObjectRetain();
}

uint64_t sub_23DE7B364(uint64_t a1)
{
  sub_23DE7B128(*(_QWORD *)a1, *(_QWORD *)(a1 + 8), *(_BYTE *)(a1 + 16));
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  return a1;
}

unint64_t sub_23DE7B3F8()
{
  unint64_t result;

  result = qword_256D0D608;
  if (!qword_256D0D608)
  {
    result = MEMORY[0x2426473FC](MEMORY[0x24BEE13D0], MEMORY[0x24BEE13C8]);
    atomic_store(result, (unint64_t *)&qword_256D0D608);
  }
  return result;
}

uint64_t sub_23DE7B43C()
{
  return sub_23DE87684();
}

uint64_t sub_23DE7B460@<X0>(_QWORD *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;

  result = sub_23DE8763C();
  *a1 = v3;
  return result;
}

uint64_t sub_23DE7B488()
{
  return sub_23DE87648();
}

uint64_t sub_23DE7B4AC@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  result = sub_23DE87654();
  *a1 = result;
  return result;
}

uint64_t sub_23DE7B4D4(id *a1)
{
  id v1;

  v1 = *a1;
  return sub_23DE87660();
}

uint64_t sub_23DE7B4FC(uint64_t a1, uint64_t a2)
{
  return sub_23DE73DA8(a1, a2, (uint64_t (*)(_QWORD))sub_23DE754D4);
}

uint64_t sub_23DE7B50C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  sub_23DE759D0(0, &qword_256D0D4C8, (void (*)(uint64_t))sub_23DE75A2C);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_23DE7B568(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t (*a6)(_QWORD, uint64_t, uint64_t, uint64_t))
{
  uint64_t v8;

  v8 = a6(0, a3, a4, a5);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 16))(a2, a1, v8);
  return a2;
}

uint64_t sub_23DE7B5B8(uint64_t a1)
{
  sub_23DE7B354(*(_QWORD *)a1, *(_QWORD *)(a1 + 8), *(_BYTE *)(a1 + 16));
  swift_bridgeObjectRetain();
  swift_retain();
  swift_retain();
  swift_retain();
  return a1;
}

uint64_t sub_23DE7B624(uint64_t a1)
{
  sub_23DE7B128(*(_QWORD *)a1, *(_QWORD *)(a1 + 8), *(_BYTE *)(a1 + 16));
  swift_release();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  return a1;
}

id sub_23DE7B690()
{
  uint64_t ObjCClassFromMetadata;
  id result;

  type metadata accessor for MenstrualCyclesWidgetTimelineGenerator();
  ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  result = objc_msgSend((id)objc_opt_self(), sel_bundleForClass_, ObjCClassFromMetadata);
  qword_25432BDF0 = (uint64_t)result;
  return result;
}

uint64_t sub_23DE7B6E4()
{
  uint64_t v0;

  v0 = sub_23DE875B8();
  __swift_allocate_value_buffer(v0, qword_25432BDC8);
  __swift_project_value_buffer(v0, (uint64_t)qword_25432BDC8);
  return sub_23DE875AC();
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

uint64_t MenstrualCyclesWidgetTimelineGenerator.__allocating_init(healthStore:)(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v8;

  v2 = sub_23DE874A4();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v8 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = swift_allocObject();
  sub_23DE8751C();
  (*(void (**)(char *, _QWORD, uint64_t))(v3 + 104))(v5, *MEMORY[0x24BDCEF70], v2);
  sub_23DE874B0();
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  *(_QWORD *)(v6 + 16) = a1;
  return v6;
}

uint64_t String.init<A>(describingSensitive:)(uint64_t a1, uint64_t a2)
{
  id v4;
  uint64_t v5;

  sub_23DE87C90();
  v4 = (id)HKSensitiveLogItem();
  swift_unknownObjectRelease();
  sub_23DE87BE8();
  swift_unknownObjectRelease();
  v5 = sub_23DE87B10();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(a2 - 8) + 8))(a1, a2);
  return v5;
}

uint64_t MenstrualCyclesWidgetTimelineGenerator.init(healthStore:)(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v8;

  v3 = sub_23DE874A4();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v6 = (char *)&v8 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23DE8751C();
  (*(void (**)(char *, _QWORD, uint64_t))(v4 + 104))(v6, *MEMORY[0x24BDCEF70], v3);
  sub_23DE874B0();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  *(_QWORD *)(v1 + 16) = a1;
  return v1;
}

uint64_t sub_23DE7B9DC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t *v4;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  void (*v13)(char *, uint64_t, uint64_t);
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  uint64_t v19;
  unint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void (*v23)(uint64_t, char *, uint64_t);
  _QWORD *v24;
  uint64_t v25;
  void (*v26)(uint64_t (*)(char *), uint64_t);
  char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;

  v29 = a3;
  v30 = a4;
  v31 = *v4;
  v7 = sub_23DE8745C();
  v8 = *(_QWORD *)(v7 - 8);
  v9 = *(_QWORD *)(v8 + 64);
  v10 = MEMORY[0x24BDAC7A8](v7);
  v28 = (char *)&v28 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v10);
  v12 = (char *)&v28 - v11;
  v13 = *(void (**)(char *, uint64_t, uint64_t))(v8 + 16);
  v13((char *)&v28 - v11, a1, v7);
  v13((char *)&v28 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0), a2, v7);
  v14 = *(unsigned __int8 *)(v8 + 80);
  v15 = (v14 + 16) & ~v14;
  v16 = v9 + 7;
  v17 = (v9 + 7 + v15) & 0xFFFFFFFFFFFFFFF8;
  v18 = (v17 + 15) & 0xFFFFFFFFFFFFFFF8;
  v19 = (v14 + 16 + v18) & ~v14;
  v20 = (v16 + v19) & 0xFFFFFFFFFFFFFFF8;
  v21 = swift_allocObject();
  v22 = v21 + v15;
  v23 = *(void (**)(uint64_t, char *, uint64_t))(v8 + 32);
  v23(v22, v12, v7);
  *(_QWORD *)(v21 + v17) = v4;
  v24 = (_QWORD *)(v21 + v18);
  v25 = v30;
  *v24 = v29;
  v24[1] = v25;
  v23(v21 + v19, v28, v7);
  *(_QWORD *)(v21 + v20) = v31;
  v26 = *(void (**)(uint64_t (*)(char *), uint64_t))(*v4 + 136);
  swift_retain();
  swift_retain();
  v26(sub_23DE805D4, v21);
  return swift_release();
}

uint64_t sub_23DE7BB60(char *a1, uint64_t a2, uint64_t a3, void (*a4)(uint64_t), uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
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
  char *v30;
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
  char *v41;
  uint64_t v42;
  void (*v43)(char *, uint64_t, uint64_t);
  uint64_t v44;
  void (*v45)(char *, uint64_t, uint64_t);
  void (*v46)(char *, unint64_t, uint64_t);
  char *v47;
  int *v48;
  uint64_t v49;
  uint64_t v50;
  void (*v51)(char *, char *, uint64_t);
  uint64_t v52;
  char *v53;
  char *v54;
  double *v55;
  uint64_t v56;
  uint64_t v57;
  void (*v58)(char *, uint64_t, uint64_t, uint64_t);
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  char *v63;
  uint64_t v64;
  char *v65;
  id v66;
  uint64_t v67;
  void (*v68)(uint64_t);
  uint64_t v69;
  void (*v70)(char *, uint64_t, uint64_t);
  uint64_t v71;
  uint64_t v72;
  unint64_t *v73;
  unint64_t v74;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v76;
  unint64_t v77;
  unint64_t v78;
  uint64_t v79;
  char *v80;
  char *v81;
  uint64_t v82;
  char *v83;
  uint64_t v84;
  uint64_t v85;
  char *v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  NSObject *v90;
  os_log_type_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  unint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  unint64_t v100;
  unint64_t v101;
  unint64_t v102;
  uint64_t v103;
  uint64_t v104;
  double *v105;
  uint64_t v106;
  void (*v107)(char *, uint64_t, uint64_t, uint64_t);
  uint64_t v108;
  int *v109;
  uint64_t v110;
  char *v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  char *v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  unint64_t v121;
  char *v122;
  char *v123;
  char *v124;
  char *v125;
  uint64_t v126;
  void (*v127)(char *, char *, uint64_t);
  void (*v128)(uint64_t (*)(void *), char *);
  void (*v130)(char *, uint64_t, uint64_t, uint64_t);
  uint64_t v131;
  uint64_t v132;
  uint64_t v133;
  uint64_t v134;
  void (*v135)(char *, char *, uint64_t);
  uint64_t v136;
  char *v137;
  char *v138;
  uint64_t v139;
  uint64_t v140;
  uint64_t v141;
  char *v142;
  char *v143;
  char *v144;
  uint64_t v145;
  uint64_t v146;
  char *v147;
  char *v148;
  uint64_t v149;
  uint64_t v150;
  char *v151;
  uint64_t v152;
  uint64_t v153;
  void (*v154)(char *, uint64_t, uint64_t);
  uint64_t v155;
  uint64_t v156;
  uint64_t v157;
  char *v158;
  uint64_t v159;
  uint64_t v160;
  double *v161;
  char *v162;
  unint64_t *v163;
  char *v164;
  uint64_t v165;
  uint64_t v166;
  void (*v167)(uint64_t);
  uint64_t v168;
  uint64_t v169;
  unint64_t v170;
  char *v171;
  uint64_t v172;
  uint64_t v173;
  uint64_t v174;
  uint64_t v175;
  uint64_t v176;
  uint64_t v177;
  uint64_t v178;

  v159 = a7;
  v160 = a6;
  v167 = a4;
  v168 = a5;
  v170 = a3;
  v174 = a2;
  v164 = a1;
  v153 = sub_23DE874EC();
  v152 = *(_QWORD *)(v153 - 8);
  MEMORY[0x24BDAC7A8](v153);
  v151 = (char *)&v130 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v150 = sub_23DE874F8();
  v149 = *(_QWORD *)(v150 - 8);
  MEMORY[0x24BDAC7A8](v150);
  v148 = (char *)&v130 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v156 = sub_23DE874BC();
  v155 = *(_QWORD *)(v156 - 8);
  MEMORY[0x24BDAC7A8](v156);
  v147 = (char *)&v130 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1C68];
  sub_23DE7349C(0, &qword_256D0D640, (uint64_t (*)(uint64_t))MEMORY[0x24BDCF510], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1C68]);
  MEMORY[0x24BDAC7A8](v11);
  v143 = (char *)&v130 - v12;
  sub_23DE7349C(0, &qword_256D0D648, (uint64_t (*)(uint64_t))MEMORY[0x24BDCF2D8], v10);
  MEMORY[0x24BDAC7A8](v13);
  v142 = (char *)&v130 - v14;
  v146 = sub_23DE873FC();
  v145 = *(_QWORD *)(v146 - 8);
  MEMORY[0x24BDAC7A8](v146);
  v144 = (char *)&v130 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v165 = type metadata accessor for MenstrualCyclesWidgetEntry(0);
  v16 = *(_QWORD *)(v165 - 8);
  v17 = MEMORY[0x24BDAC7A8](v165);
  v141 = (uint64_t)&v130 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v17);
  v20 = (char *)&v130 - v19;
  sub_23DE7349C(0, &qword_25432B9D8, (uint64_t (*)(uint64_t))MEMORY[0x24BDFB270], v10);
  v22 = MEMORY[0x24BDAC7A8](v21);
  v138 = (char *)&v130 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v22);
  v162 = (char *)&v130 - v24;
  sub_23DE80A64(0);
  MEMORY[0x24BDAC7A8](v25);
  v161 = (double *)((char *)&v130 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0));
  v27 = sub_23DE87534();
  v28 = *(_QWORD *)(v27 - 8);
  MEMORY[0x24BDAC7A8](v27);
  v30 = (char *)&v130 - ((v29 + 15) & 0xFFFFFFFFFFFFFFF0);
  v31 = sub_23DE8745C();
  v32 = *(_QWORD *)(v31 - 8);
  v33 = MEMORY[0x24BDAC7A8](v31);
  v158 = (char *)&v130 - ((v34 + 15) & 0xFFFFFFFFFFFFFFF0);
  v157 = v34;
  MEMORY[0x24BDAC7A8](v33);
  v36 = (char *)&v130 - v35;
  v37 = sub_23DE879CC();
  v172 = *(_QWORD *)(v37 - 8);
  v173 = v37;
  v38 = MEMORY[0x24BDAC7A8](v37);
  v171 = (char *)&v130 - ((v39 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v38);
  v41 = (char *)&v130 - v40;
  v42 = swift_allocObject();
  v166 = v42;
  *(_QWORD *)(v42 + 16) = MEMORY[0x24BEE4AF8];
  v163 = (unint64_t *)(v42 + 16);
  v169 = v32;
  v43 = *(void (**)(char *, uint64_t, uint64_t))(v32 + 16);
  v44 = v174;
  v175 = v31;
  v45 = v43;
  ((void (*)(char *))v43)(v36);
  v139 = v28;
  v46 = *(void (**)(char *, unint64_t, uint64_t))(v28 + 16);
  v140 = v27;
  v46(v30, v170 + OBJC_IVAR____TtC29HealthMenstrualCyclesWidgetUI38MenstrualCyclesWidgetTimelineGenerator_gregorianCalendar, v27);
  v47 = v164;
  sub_23DE879B4();
  if (v47)
  {
    v132 = v16;
    v48 = (int *)v165;
    v136 = swift_allocBox();
    v134 = v49;
    v154 = v45;
    v45(v36, v44, v175);
    v50 = v172;
    v51 = *(void (**)(char *, char *, uint64_t))(v172 + 16);
    v137 = v41;
    v52 = v173;
    v51(v171, v41, v173);
    v53 = v47;
    v164 = v36;
    v54 = v53;
    v55 = v161;
    sub_23DE6C8B4(v53, v161);
    v56 = type metadata accessor for MenstrualCyclesWidgetEntry.State(0);
    (*(void (**)(double *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v56 - 8) + 56))(v55, 0, 1, v56);
    v57 = sub_23DE87A74();
    v58 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v57 - 8) + 56);
    v59 = (uint64_t)v162;
    v58(v162, 1, 1, v57);
    v133 = v48[7];
    v60 = (uint64_t)&v20[v48[8]];
    v131 = v57;
    v130 = v58;
    v58((char *)v60, 1, 1, v57);
    v62 = v174;
    v61 = v175;
    v63 = &v20[v48[9]];
    *(_QWORD *)v63 = 0;
    v63[8] = 1;
    v135 = *(void (**)(char *, char *, uint64_t))(v169 + 32);
    v135(v20, v164, v61);
    (*(void (**)(char *, char *, uint64_t))(v50 + 32))(&v20[v48[5]], v171, v52);
    v64 = v134;
    sub_23DE73D64((uint64_t)v55, (uint64_t)&v20[v48[6]], (uint64_t (*)(_QWORD))sub_23DE80A64);
    *(_QWORD *)&v20[v133] = 0;
    sub_23DE6C5DC(v59, v60);
    *(_QWORD *)v63 = 0;
    v63[8] = 1;
    sub_23DE73D64((uint64_t)v20, v64, type metadata accessor for MenstrualCyclesWidgetEntry);
    v171 = v54;
    v65 = v164;
    v66 = objc_msgSend(v54, sel_state);
    v68 = v167;
    v67 = v168;
    v69 = v166;
    v70 = v154;
    if (v66 == (id)1)
    {
      v154(v65, v62, v175);
      v162 = v171;
      sub_23DE86698(v162, v65, (char *)&v178);
      v71 = (uint64_t)v138;
      sub_23DE87A68();
      v130((char *)v71, 0, 1, v131);
      sub_23DE6C5DC(v71, v64 + *(int *)(v165 + 32));
      v72 = v141;
      sub_23DE73DA8(v64, v141, type metadata accessor for MenstrualCyclesWidgetEntry);
      v73 = v163;
      v74 = *v163;
      isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      *v73 = v74;
      if ((isUniquelyReferenced_nonNull_native & 1) == 0)
      {
        v74 = sub_23DE82D4C(0, *(_QWORD *)(v74 + 16) + 1, 1, v74);
        *v73 = v74;
      }
      v76 = v132;
      v78 = *(_QWORD *)(v74 + 16);
      v77 = *(_QWORD *)(v74 + 24);
      if (v78 >= v77 >> 1)
      {
        v74 = sub_23DE82D4C(v77 > 1, v78 + 1, 1, v74);
        *v163 = v74;
      }
      *(_QWORD *)(v74 + 16) = v78 + 1;
      sub_23DE73D64(v72, v74+ ((*(unsigned __int8 *)(v76 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v76 + 80))+ *(_QWORD *)(v76 + 72) * v78, type metadata accessor for MenstrualCyclesWidgetEntry);
      v165 = v170
           + OBJC_IVAR____TtC29HealthMenstrualCyclesWidgetUI38MenstrualCyclesWidgetTimelineGenerator_currentCalendar;
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v139 + 56))(v142, 1, 1, v140);
      v79 = sub_23DE87540();
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v79 - 8) + 56))(v143, 1, 1, v79);
      v80 = v144;
      sub_23DE873F0();
      v81 = v147;
      (*(void (**)(char *, _QWORD, uint64_t))(v155 + 104))(v147, *MEMORY[0x24BDCF020], v156);
      v82 = v149;
      v83 = v148;
      v84 = v150;
      (*(void (**)(char *, _QWORD, uint64_t))(v149 + 104))(v148, *MEMORY[0x24BDCF0B0], v150);
      v85 = v152;
      v86 = v151;
      v87 = v153;
      v88 = (*(uint64_t (**)(char *, _QWORD, uint64_t))(v152 + 104))(v151, *MEMORY[0x24BDCF068], v153);
      MEMORY[0x24BDAC7A8](v88);
      sub_23DE874E0();
      (*(void (**)(char *, uint64_t))(v85 + 8))(v86, v87);
      (*(void (**)(char *, uint64_t))(v82 + 8))(v83, v84);
      (*(void (**)(char *, uint64_t))(v155 + 8))(v81, v156);
      (*(void (**)(char *, uint64_t))(v145 + 8))(v80, v146);
      if (qword_25432B9F8 != -1)
        swift_once();
      v89 = sub_23DE875B8();
      __swift_project_value_buffer(v89, (uint64_t)qword_25432BDC8);
      v69 = v166;
      swift_retain_n();
      v90 = sub_23DE875A0();
      v91 = sub_23DE87B64();
      if (os_log_type_enabled(v90, v91))
      {
        v92 = swift_slowAlloc();
        v93 = swift_slowAlloc();
        v178 = v93;
        *(_DWORD *)v92 = 136380931;
        v94 = sub_23DE87CCC();
        v177 = sub_23DE7350C(v94, v95, &v178);
        sub_23DE87BD0();
        swift_bridgeObjectRelease();
        *(_WORD *)(v92 + 12) = 2080;
        sub_23DE7349C(0, &qword_256D0D650, (uint64_t (*)(uint64_t))sub_23DE80DB8, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE3598]);
        v96 = swift_allocObject();
        *(_OWORD *)(v96 + 16) = xmmword_23DE88350;
        swift_beginAccess();
        *(_QWORD *)(v96 + 32) = *(_QWORD *)(v69 + 16);
        sub_23DE80DB8(0);
        v98 = v97;
        swift_bridgeObjectRetain();
        v99 = MEMORY[0x242646F28](v96, v98);
        v101 = v100;
        swift_bridgeObjectRelease();
        v176 = sub_23DE7350C(v99, v101, &v178);
        sub_23DE87BD0();
        swift_release_n();
        swift_bridgeObjectRelease();
        _os_log_impl(&dword_23DE6A000, v90, v91, "[%{private}s] TimelineEntries in the generator are: %s", (uint8_t *)v92, 0x16u);
        swift_arrayDestroy();
        MEMORY[0x242647498](v93, -1, -1);
        MEMORY[0x242647498](v92, -1, -1);

      }
      else
      {

        swift_release_n();
      }
      v70 = v154;
      v68 = v167;
      v67 = v168;
      swift_beginAccess();
      v114 = swift_bridgeObjectRetain();
      v68(v114);
      swift_bridgeObjectRelease();
      v62 = v174;
      v65 = v164;
    }
    v115 = v69;
    v116 = v175;
    v70(v65, v62, v175);
    v117 = v158;
    v70(v158, v160, v116);
    v118 = *(unsigned __int8 *)(v169 + 80);
    v119 = (v118 + 56) & ~v118;
    v120 = (v157 + v118 + v119) & ~v118;
    v121 = (v157 + v120 + 7) & 0xFFFFFFFFFFFFFFF8;
    v122 = (char *)swift_allocObject();
    v123 = v65;
    v124 = v122;
    *((_QWORD *)v122 + 2) = v68;
    *((_QWORD *)v122 + 3) = v67;
    *((_QWORD *)v122 + 4) = v136;
    *((_QWORD *)v122 + 5) = v115;
    v125 = &v122[v119];
    v126 = v170;
    *((_QWORD *)v124 + 6) = v170;
    v127 = v135;
    v135(v125, v123, v116);
    v127(&v124[v120], v117, v116);
    *(_QWORD *)&v124[v121] = v159;
    v128 = *(void (**)(uint64_t (*)(void *), _QWORD *))(*(_QWORD *)v126 + 128);
    swift_retain();
    swift_retain();
    swift_retain();
    swift_retain();
    v128(sub_23DE80D30, v124);

    swift_release();
    (*(void (**)(char *, uint64_t))(v172 + 8))(v137, v173);
    swift_release();
  }
  else
  {
    sub_23DE7349C(0, &qword_256D0D278, type metadata accessor for MenstrualCyclesWidgetEntry, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE3598]);
    v102 = (*(unsigned __int8 *)(v16 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v16 + 80);
    v103 = swift_allocObject();
    *(_OWORD *)(v103 + 16) = xmmword_23DE88350;
    v170 = v103 + v102;
    v45(v36, v44, v175);
    (*(void (**)(char *, char *, uint64_t))(v172 + 16))(v171, v41, v173);
    v104 = type metadata accessor for MenstrualCyclesWidgetEntry.State(0);
    v105 = v161;
    (*(void (**)(double *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v104 - 8) + 56))(v161, 1, 1, v104);
    v106 = sub_23DE87A74();
    v107 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v106 - 8) + 56);
    v108 = (uint64_t)v162;
    v107(v162, 1, 1, v106);
    v109 = (int *)v165;
    v174 = *(int *)(v165 + 28);
    v110 = (uint64_t)&v20[*(int *)(v165 + 32)];
    v107((char *)v110, 1, 1, v106);
    v111 = &v20[v109[9]];
    *(_QWORD *)v111 = 0;
    v111[8] = 1;
    (*(void (**)(char *, char *, uint64_t))(v169 + 32))(v20, v36, v175);
    v112 = v172;
    v113 = v173;
    (*(void (**)(char *, char *, uint64_t))(v172 + 32))(&v20[v109[5]], v171, v173);
    sub_23DE73D64((uint64_t)v105, (uint64_t)&v20[v109[6]], (uint64_t (*)(_QWORD))sub_23DE80A64);
    *(_QWORD *)&v20[v174] = 0;
    sub_23DE6C5DC(v108, v110);
    *(_QWORD *)v111 = 0;
    v111[8] = 1;
    sub_23DE73D64((uint64_t)v20, v170, type metadata accessor for MenstrualCyclesWidgetEntry);
    v167(v103);
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v112 + 8))(v41, v113);
  }
  return swift_release();
}

uint64_t sub_23DE7CB14(void (*a1)(char *, char *, uint64_t), uint64_t a2, void (*a3)(char *, char *, uint64_t), void *a4, void (*a5)(uint64_t, _QWORD, uint64_t, id), void *a6, unint64_t *a7)
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
  char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
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
  char *v34;
  uint64_t v35;
  char *v36;
  uint64_t (*v37)(_QWORD);
  uint64_t v38;
  void (*v39)(char *, char *, uint64_t);
  uint64_t result;
  void (*v41)(char *, char *, uint64_t);
  void (*v42)(char *, char *, uint64_t);
  char *v43;
  double *v44;
  uint64_t v45;
  _QWORD *v46;
  void (*v47)(uint64_t, uint64_t, uint64_t, _QWORD *);
  int *v48;
  uint64_t v49;
  char *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  unint64_t *v54;
  unint64_t v55;
  char isUniquelyReferenced_nonNull_native;
  unint64_t v57;
  unint64_t v58;
  uint64_t v59;
  void (*v60)(char *, char *, uint64_t);
  void (*v61)(uint64_t, _QWORD, uint64_t, id);
  id v62;
  double *v63;
  uint64_t v64;
  char *v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  unint64_t *v69;
  id v70;
  char *v71;
  uint64_t v72;
  char *v73;
  uint64_t v74;
  uint64_t v75;
  void (*v76)(char *, char *, uint64_t);
  char v77[9];

  v69 = a7;
  v70 = a4;
  v61 = a5;
  v62 = a6;
  v60 = a3;
  v76 = a1;
  sub_23DE7349C(0, &qword_25432B9D8, (uint64_t (*)(uint64_t))MEMORY[0x24BDFB270], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1C68]);
  v8 = MEMORY[0x24BDAC7A8](v7);
  v65 = (char *)&v59 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v8);
  v72 = (uint64_t)&v59 - v10;
  sub_23DE80A64(0);
  MEMORY[0x24BDAC7A8](v11);
  v63 = (double *)((char *)&v59 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0));
  v64 = type metadata accessor for MenstrualCyclesWidgetEntry(0);
  v68 = *(_QWORD *)(v64 - 8);
  v13 = MEMORY[0x24BDAC7A8](v64);
  v66 = (uint64_t)&v59 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = MEMORY[0x24BDAC7A8](v13);
  v17 = (char *)&v59 - v16;
  MEMORY[0x24BDAC7A8](v15);
  v67 = (uint64_t)&v59 - v18;
  v19 = sub_23DE87534();
  v20 = *(_QWORD *)(v19 - 8);
  MEMORY[0x24BDAC7A8](v19);
  v22 = (char *)&v59 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  v23 = sub_23DE879CC();
  v74 = *(_QWORD *)(v23 - 8);
  v75 = v23;
  v24 = MEMORY[0x24BDAC7A8](v23);
  v71 = (char *)&v59 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v24);
  v73 = (char *)&v59 - v26;
  sub_23DE80DD4(0);
  MEMORY[0x24BDAC7A8](v27);
  v29 = (char *)&v59 - ((v28 + 15) & 0xFFFFFFFFFFFFFFF0);
  v30 = sub_23DE8745C();
  v31 = *(_QWORD *)(v30 - 8);
  v32 = MEMORY[0x24BDAC7A8](v30);
  v34 = (char *)&v59 - ((v33 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v32);
  v36 = (char *)&v59 - v35;
  sub_23DE73DA8((uint64_t)v76, (uint64_t)v29, (uint64_t (*)(_QWORD))sub_23DE80DD4);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v31 + 48))(v29, 1, v30) == 1)
  {
    v37 = (uint64_t (*)(_QWORD))sub_23DE80DD4;
    v38 = (uint64_t)v29;
  }
  else
  {
    v39 = *(void (**)(char *, char *, uint64_t))(v31 + 32);
    v39(v36, v29, v30);
    if ((sub_23DE87438() & 1) != 0)
    {
      result = (*(uint64_t (**)(char *, uint64_t))(v31 + 8))(v36, v30);
      *(_BYTE *)v60 = 1;
      return result;
    }
    v41 = *(void (**)(char *, char *, uint64_t))(v31 + 16);
    v41(v34, v36, v30);
    v60 = v39;
    v42 = v41;
    v76 = v41;
    (*(void (**)(char *, uint64_t, uint64_t))(v20 + 16))(v22, (uint64_t)v61+ OBJC_IVAR____TtC29HealthMenstrualCyclesWidgetUI38MenstrualCyclesWidgetTimelineGenerator_gregorianCalendar, v19);
    v43 = v73;
    sub_23DE879B4();
    v42(v34, v36, v30);
    (*(void (**)(char *, char *, uint64_t))(v74 + 16))(v71, v43, v75);
    v70 = v62;
    v44 = v63;
    sub_23DE6C8B4(v70, v63);
    v45 = type metadata accessor for MenstrualCyclesWidgetEntry.State(0);
    (*(void (**)(double *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v45 - 8) + 56))(v44, 0, 1, v45);
    v46 = (_QWORD *)sub_23DE87A74();
    v47 = *(void (**)(uint64_t, uint64_t, uint64_t, _QWORD *))(*(v46 - 1) + 56);
    v62 = v46;
    v47(v72, 1, 1, v46);
    v61 = (void (*)(uint64_t, _QWORD, uint64_t, id))v47;
    v48 = (int *)v64;
    v59 = *(int *)(v64 + 28);
    v49 = (uint64_t)&v17[*(int *)(v64 + 32)];
    v47(v49, 1, 1, v46);
    v50 = &v17[v48[9]];
    *(_QWORD *)v50 = 0;
    v50[8] = 1;
    v60(v17, v34, v30);
    (*(void (**)(char *, char *, uint64_t))(v74 + 32))(&v17[v48[5]], v71, v75);
    sub_23DE73D64((uint64_t)v44, (uint64_t)&v17[v48[6]], (uint64_t (*)(_QWORD))sub_23DE80A64);
    *(_QWORD *)&v17[v59] = 0;
    sub_23DE6C5DC(v72, v49);
    *(_QWORD *)v50 = 0;
    v50[8] = 1;
    v51 = v67;
    sub_23DE73D64((uint64_t)v17, v67, type metadata accessor for MenstrualCyclesWidgetEntry);
    v76(v34, v36, v30);
    sub_23DE86698(v70, v34, v77);
    v52 = (uint64_t)v65;
    sub_23DE87A68();
    v61(v52, 0, 1, v62);
    sub_23DE6C5DC(v52, v51 + v48[8]);
    v53 = v66;
    sub_23DE73DA8(v51, v66, type metadata accessor for MenstrualCyclesWidgetEntry);
    v54 = v69;
    v55 = *v69;
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    *v54 = v55;
    if ((isUniquelyReferenced_nonNull_native & 1) == 0)
    {
      v55 = sub_23DE82D4C(0, *(_QWORD *)(v55 + 16) + 1, 1, v55);
      *v54 = v55;
    }
    v58 = *(_QWORD *)(v55 + 16);
    v57 = *(_QWORD *)(v55 + 24);
    if (v58 >= v57 >> 1)
    {
      v55 = sub_23DE82D4C(v57 > 1, v58 + 1, 1, v55);
      *v54 = v55;
    }
    *(_QWORD *)(v55 + 16) = v58 + 1;
    sub_23DE73D64(v53, v55+ ((*(unsigned __int8 *)(v68 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v68 + 80))+ *(_QWORD *)(v68 + 72) * v58, type metadata accessor for MenstrualCyclesWidgetEntry);
    (*(void (**)(char *, uint64_t))(v74 + 8))(v73, v75);
    (*(void (**)(char *, uint64_t))(v31 + 8))(v36, v30);
    v38 = v51;
    v37 = type metadata accessor for MenstrualCyclesWidgetEntry;
  }
  return sub_23DE6EFC4(v38, v37);
}

uint64_t sub_23DE7D120(void *a1, void (*a2)(uint64_t), uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t (*v17)(uint64_t, uint64_t);
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
  char *v29;
  uint64_t v30;
  uint64_t v31;
  unint64_t *v32;
  unint64_t v33;
  char isUniquelyReferenced_nonNull_native;
  unint64_t v35;
  unint64_t v36;
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
  NSObject *v49;
  os_log_type_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  unint64_t v54;
  uint64_t v55;
  id v56;
  uint64_t v57;
  unint64_t v58;
  unint64_t v59;
  uint64_t v60;
  unint64_t v61;
  uint64_t v62;
  uint64_t v63;
  _QWORD v65[3];
  uint64_t v66;
  void (*v67)(uint64_t);
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  char *v71;
  uint64_t v72;
  uint64_t v73;
  char *v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  id v80;
  uint64_t v81;
  unint64_t *v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;

  v75 = a8;
  v76 = a6;
  v78 = a7;
  v81 = a3;
  v79 = sub_23DE874EC();
  v77 = *(_QWORD *)(v79 - 8);
  MEMORY[0x24BDAC7A8](v79);
  v74 = (char *)v65 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v73 = sub_23DE874F8();
  v72 = *(_QWORD *)(v73 - 8);
  MEMORY[0x24BDAC7A8](v73);
  v71 = (char *)v65 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = sub_23DE874BC();
  v83 = *(_QWORD *)(v14 - 8);
  v84 = v14;
  MEMORY[0x24BDAC7A8](v14);
  v16 = (char *)v65 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17 = (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1C68];
  sub_23DE7349C(0, &qword_256D0D640, (uint64_t (*)(uint64_t))MEMORY[0x24BDCF510], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1C68]);
  MEMORY[0x24BDAC7A8](v18);
  v20 = (char *)v65 - v19;
  sub_23DE7349C(0, &qword_256D0D648, (uint64_t (*)(uint64_t))MEMORY[0x24BDCF2D8], v17);
  MEMORY[0x24BDAC7A8](v21);
  v23 = (char *)v65 - v22;
  v70 = sub_23DE873FC();
  v69 = *(_QWORD *)(v70 - 8);
  MEMORY[0x24BDAC7A8](v70);
  v25 = (char *)v65 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  v26 = type metadata accessor for MenstrualCyclesWidgetEntry(0);
  v27 = *(_QWORD *)(v26 - 8);
  MEMORY[0x24BDAC7A8](v26);
  v29 = (char *)v65 - ((v28 + 15) & 0xFFFFFFFFFFFFFFF0);
  v30 = swift_projectBox();
  v31 = v30;
  if (a1)
  {
    v66 = a5;
    v32 = (unint64_t *)(a5 + 16);
    swift_beginAccess();
    v65[2] = v31;
    sub_23DE73DA8(v31, (uint64_t)v29, type metadata accessor for MenstrualCyclesWidgetEntry);
    swift_beginAccess();
    v33 = *v32;
    v80 = a1;
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v82 = v32;
    *v32 = v33;
    v67 = a2;
    if ((isUniquelyReferenced_nonNull_native & 1) == 0)
    {
      v33 = sub_23DE82D4C(0, *(_QWORD *)(v33 + 16) + 1, 1, v33);
      *v82 = v33;
    }
    v68 = a9;
    v36 = *(_QWORD *)(v33 + 16);
    v35 = *(_QWORD *)(v33 + 24);
    if (v36 >= v35 >> 1)
    {
      v33 = sub_23DE82D4C(v35 > 1, v36 + 1, 1, v33);
      *v82 = v33;
    }
    *(_QWORD *)(v33 + 16) = v36 + 1;
    sub_23DE73D64((uint64_t)v29, v33+ ((*(unsigned __int8 *)(v27 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v27 + 80))+ *(_QWORD *)(v27 + 72) * v36, type metadata accessor for MenstrualCyclesWidgetEntry);
    swift_endAccess();
    v65[1] = v76
           + OBJC_IVAR____TtC29HealthMenstrualCyclesWidgetUI38MenstrualCyclesWidgetTimelineGenerator_currentCalendar;
    v37 = sub_23DE87534();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v37 - 8) + 56))(v23, 1, 1, v37);
    v38 = sub_23DE87540();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v38 - 8) + 56))(v20, 1, 1, v38);
    sub_23DE873F0();
    v39 = v16;
    (*(void (**)(char *, _QWORD, uint64_t))(v83 + 104))(v16, *MEMORY[0x24BDCF020], v84);
    v40 = v72;
    v41 = v71;
    v42 = v73;
    (*(void (**)(char *, _QWORD, uint64_t))(v72 + 104))(v71, *MEMORY[0x24BDCF0B0], v73);
    v43 = v77;
    v44 = v74;
    v45 = v79;
    v46 = (*(uint64_t (**)(char *, _QWORD, uint64_t))(v77 + 104))(v74, *MEMORY[0x24BDCF068], v79);
    MEMORY[0x24BDAC7A8](v46);
    sub_23DE874E0();
    (*(void (**)(char *, uint64_t))(v43 + 8))(v44, v45);
    (*(void (**)(char *, uint64_t))(v40 + 8))(v41, v42);
    (*(void (**)(char *, uint64_t))(v83 + 8))(v39, v84);
    (*(void (**)(char *, uint64_t))(v69 + 8))(v25, v70);
    if (qword_25432B9F8 != -1)
      swift_once();
    v47 = sub_23DE875B8();
    __swift_project_value_buffer(v47, (uint64_t)qword_25432BDC8);
    v48 = v66;
    swift_retain_n();
    v49 = sub_23DE875A0();
    v50 = sub_23DE87B64();
    if (os_log_type_enabled(v49, v50))
    {
      v51 = swift_slowAlloc();
      v52 = swift_slowAlloc();
      v86 = v52;
      *(_DWORD *)v51 = 136380931;
      v53 = sub_23DE87CCC();
      v85 = sub_23DE7350C(v53, v54, &v86);
      sub_23DE87BD0();
      swift_bridgeObjectRelease();
      *(_WORD *)(v51 + 12) = 2080;
      v84 = v51 + 14;
      sub_23DE7349C(0, &qword_256D0D650, (uint64_t (*)(uint64_t))sub_23DE80DB8, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE3598]);
      v55 = swift_allocObject();
      *(_OWORD *)(v55 + 16) = xmmword_23DE88350;
      swift_beginAccess();
      *(_QWORD *)(v55 + 32) = *(_QWORD *)(v48 + 16);
      v85 = v55;
      sub_23DE7349C(0, &qword_256D0D660, (uint64_t (*)(uint64_t))sub_23DE80DB8, MEMORY[0x24BEE1250]);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      sub_23DE87C9C();
      v56 = (id)HKSensitiveLogItem();
      swift_unknownObjectRelease();
      sub_23DE87BE8();
      swift_unknownObjectRelease();
      v57 = sub_23DE87B10();
      v59 = v58;
      swift_bridgeObjectRelease();
      v85 = sub_23DE7350C(v57, v59, &v86);
      sub_23DE87BD0();
      swift_release_n();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_23DE6A000, v49, v50, "[%{private}s] TimelineEntries in the generator are: %s", (uint8_t *)v51, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x242647498](v52, -1, -1);
      MEMORY[0x242647498](v51, -1, -1);

    }
    else
    {

      swift_release_n();
    }
    swift_beginAccess();
    v63 = swift_bridgeObjectRetain();
    v67(v63);

  }
  else
  {
    v60 = v30;
    sub_23DE7349C(0, &qword_256D0D278, type metadata accessor for MenstrualCyclesWidgetEntry, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE3598]);
    v61 = (*(unsigned __int8 *)(v27 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v27 + 80);
    v62 = swift_allocObject();
    *(_OWORD *)(v62 + 16) = xmmword_23DE88350;
    swift_beginAccess();
    sub_23DE73DA8(v60, v62 + v61, type metadata accessor for MenstrualCyclesWidgetEntry);
    a2(v62);
  }
  return swift_bridgeObjectRelease();
}

uint64_t sub_23DE7DA1C(uint64_t a1, uint64_t a2, _BYTE *a3, uint64_t a4, void *a5, void *a6, uint64_t a7, unint64_t *a8, uint64_t a9)
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
  char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  char *v24;
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
  uint64_t result;
  id v36;
  unsigned int v37;
  id v38;
  unint64_t v39;
  uint64_t v40;
  char *v41;
  void *v42;
  int *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  id v47;
  NSObject *v48;
  os_log_type_t v49;
  int v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  unint64_t v55;
  uint64_t v56;
  unint64_t v57;
  uint8_t *v58;
  id v59;
  uint64_t v60;
  id v61;
  uint64_t v62;
  unint64_t v63;
  unint64_t v64;
  uint64_t v65;
  os_log_t v66;
  uint64_t v67;
  uint64_t v68;
  NSObject *v69;
  os_log_type_t v70;
  _BOOL4 v71;
  uint64_t v72;
  uint8_t *v73;
  uint64_t v74;
  uint64_t v75;
  unint64_t v76;
  uint64_t v77;
  uint64_t v78;
  void *v79;
  void *v80;
  id v81;
  id v82;
  void *v83;
  id v84;
  uint64_t v85;
  uint64_t v86;
  id v87;
  uint64_t v88;
  uint64_t v89;
  unint64_t *v90;
  uint64_t v91;
  uint64_t v92;
  unint64_t v93;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v95;
  unint64_t v96;
  unint64_t v97;
  os_log_t v98;
  int v99;
  void (*v100)(char *, char *, uint64_t);
  uint64_t v101;
  uint64_t v102;
  char *v103;
  uint64_t v104;
  void *v105;
  char *v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  char *v110;
  char *v111;
  char *v112;
  uint64_t v113;
  unint64_t *v114;
  uint64_t v115;
  id v116;
  uint64_t v117[4];
  uint64_t v118;

  v114 = a8;
  v115 = a7;
  v105 = a6;
  v116 = a5;
  v108 = type metadata accessor for MenstrualCyclesWidgetEntry(0);
  v113 = *(_QWORD *)(v108 - 8);
  MEMORY[0x24BDAC7A8](v108);
  v112 = (char *)&v98 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23DE7349C(0, &qword_25432B9D8, (uint64_t (*)(uint64_t))MEMORY[0x24BDFB270], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1C68]);
  MEMORY[0x24BDAC7A8](v12);
  v106 = (char *)&v98 - v13;
  v14 = sub_23DE87534();
  v15 = *(_QWORD *)(v14 - 8);
  MEMORY[0x24BDAC7A8](v14);
  v17 = (char *)&v98 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v107 = sub_23DE879CC();
  v109 = *(_QWORD *)(v107 - 8);
  v18 = MEMORY[0x24BDAC7A8](v107);
  v20 = (char *)&v98 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v18);
  v111 = (char *)&v98 - v21;
  sub_23DE80DD4(0);
  MEMORY[0x24BDAC7A8](v22);
  v24 = (char *)&v98 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  v25 = sub_23DE8745C();
  v26 = MEMORY[0x24BDAC7A8](v25);
  v110 = (char *)&v98 - ((v27 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v26);
  v29 = (char *)&v98 - v28;
  v30 = a1;
  v32 = v31;
  v34 = v33;
  sub_23DE73DA8(v30, (uint64_t)v24, (uint64_t (*)(_QWORD))sub_23DE80DD4);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v32 + 48))(v24, 1, v34) == 1)
    return sub_23DE6EFC4((uint64_t)v24, (uint64_t (*)(_QWORD))sub_23DE80DD4);
  (*(void (**)(char *, char *, uint64_t))(v32 + 32))(v29, v24, v34);
  if ((sub_23DE87438() & 1) != 0)
  {
    result = (*(uint64_t (**)(char *, uint64_t))(v32 + 8))(v29, v34);
    *a3 = 1;
  }
  else
  {
    v103 = v29;
    v102 = v32;
    v101 = a9;
    v36 = v116;
    v37 = objc_msgSend(v116, sel_menstruationProjectionsEnabled);
    v104 = v34;
    if (!v37)
      goto LABEL_14;
    v38 = objc_msgSend(v36, sel_menstruationProjections);
    sub_23DE6F000(0, &qword_256D0D630);
    v39 = sub_23DE87B34();

    if (v39 >> 62)
    {
      swift_bridgeObjectRetain();
      v40 = sub_23DE87C54();
      swift_bridgeObjectRelease();
    }
    else
    {
      v40 = *(_QWORD *)((v39 & 0xFFFFFFFFFFFFF8) + 0x10);
    }
    swift_bridgeObjectRelease();
    if (v40)
    {
      v41 = v103;
      v100 = *(void (**)(char *, char *, uint64_t))(v102 + 16);
      v100(v110, v103, v104);
      (*(void (**)(char *, uint64_t, uint64_t))(v15 + 16))(v17, (uint64_t)v105+ OBJC_IVAR____TtC29HealthMenstrualCyclesWidgetUI38MenstrualCyclesWidgetTimelineGenerator_gregorianCalendar, v14);
      sub_23DE879B4();
      v42 = sub_23DE7E530();
      v43 = (int *)v108;
      v44 = v107;
      v45 = v109;
      if (!v42)
      {
        if (qword_25432B9F8 != -1)
          swift_once();
        v46 = sub_23DE875B8();
        __swift_project_value_buffer(v46, (uint64_t)qword_25432BDC8);
        (*(void (**)(char *, char *, uint64_t))(v45 + 16))(v20, v111, v44);
        v47 = v116;
        v48 = sub_23DE875A0();
        v49 = sub_23DE87B64();
        v50 = v49;
        if (os_log_type_enabled(v48, v49))
        {
          v51 = swift_slowAlloc();
          v52 = swift_slowAlloc();
          v105 = 0;
          v53 = v52;
          v118 = v52;
          *(_DWORD *)v51 = 136446722;
          v98 = v48;
          v99 = v50;
          v54 = sub_23DE87CCC();
          v117[0] = sub_23DE7350C(v54, v55, &v118);
          sub_23DE87BD0();
          swift_bridgeObjectRelease();
          *(_WORD *)(v51 + 12) = 2082;
          sub_23DE80C0C();
          v56 = sub_23DE87C6C();
          v117[0] = sub_23DE7350C(v56, v57, &v118);
          sub_23DE87BD0();
          swift_bridgeObjectRelease();
          (*(void (**)(char *, uint64_t))(v109 + 8))(v20, v44);
          *(_WORD *)(v51 + 22) = 2080;
          v58 = (uint8_t *)v51;
          v59 = objc_msgSend(v47, sel_menstruationProjections);
          v60 = sub_23DE87B34();

          v117[0] = v60;
          sub_23DE80A04(0, &qword_256D0D668, &qword_256D0D630, 0x24BE46BE0, MEMORY[0x24BEE1250]);
          swift_bridgeObjectRetain();
          sub_23DE87C9C();
          v61 = (id)HKSensitiveLogItem();
          swift_unknownObjectRelease();
          sub_23DE87BE8();
          swift_unknownObjectRelease();
          v62 = sub_23DE87B10();
          v64 = v63;
          swift_bridgeObjectRelease();
          v65 = v62;
          v45 = v109;
          v117[0] = sub_23DE7350C(v65, v64, &v118);
          v44 = v107;
          sub_23DE87BD0();

          v41 = v103;
          swift_bridgeObjectRelease();
          v66 = v98;
          _os_log_impl(&dword_23DE6A000, v98, (os_log_type_t)v99, "[%{public}s] TimelineEntries: No projection found that contains %{public}s in %s", v58, 0x20u);
          v43 = (int *)v108;
          swift_arrayDestroy();
          v67 = v53;
          v42 = v105;
          MEMORY[0x242647498](v67, -1, -1);
          MEMORY[0x242647498](v58, -1, -1);

        }
        else
        {
          (*(void (**)(char *, uint64_t))(v45 + 8))(v20, v44);

        }
        v36 = v116;
      }
      v77 = v44;
      v72 = v115;
      swift_beginAccess();
      v78 = v43[7];
      v79 = *(void **)(v72 + v78);
      *(_QWORD *)(v72 + v78) = v42;
      v80 = v42;
      v81 = v42;

      v82 = objc_msgSend(v36, sel_lastMenstrualFlowDayIndex);
      v83 = v82;
      if (v82)
      {
        v84 = objc_msgSend(v82, sel_integerValue);

      }
      else
      {
        v84 = 0;
      }
      swift_beginAccess();
      v85 = v72 + v43[9];
      *(_QWORD *)v85 = v84;
      *(_BYTE *)(v85 + 8) = v83 == 0;
      v86 = (uint64_t)v110;
      v100(v110, v41, v104);
      v87 = v81;
      sub_23DE863C4(v80, v86, (char *)v117);
      v88 = (uint64_t)v106;
      sub_23DE87A68();

      (*(void (**)(char *, uint64_t))(v45 + 8))(v111, v77);
      v89 = sub_23DE87A74();
      (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v89 - 8) + 56))(v88, 0, 1, v89);
      swift_beginAccess();
      sub_23DE6C5DC(v88, v72 + v43[8]);
    }
    else
    {
LABEL_14:
      if (qword_25432B9F8 != -1)
        swift_once();
      v68 = sub_23DE875B8();
      __swift_project_value_buffer(v68, (uint64_t)qword_25432BDC8);
      v69 = sub_23DE875A0();
      v70 = sub_23DE87B88();
      v71 = os_log_type_enabled(v69, v70);
      v72 = v115;
      if (v71)
      {
        v73 = (uint8_t *)swift_slowAlloc();
        v74 = swift_slowAlloc();
        v117[0] = v74;
        *(_DWORD *)v73 = 136446210;
        v75 = sub_23DE87CCC();
        v118 = sub_23DE7350C(v75, v76, v117);
        sub_23DE87BD0();
        swift_bridgeObjectRelease();
        _os_log_impl(&dword_23DE6A000, v69, v70, "[%{public}s] TimelineEntries: Projections unavailable.", v73, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x242647498](v74, -1, -1);
        MEMORY[0x242647498](v73, -1, -1);
      }

    }
    v91 = v113;
    v90 = v114;
    v92 = (uint64_t)v112;
    swift_beginAccess();
    sub_23DE73DA8(v72, v92, type metadata accessor for MenstrualCyclesWidgetEntry);
    swift_beginAccess();
    v93 = *v90;
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    *v90 = v93;
    if ((isUniquelyReferenced_nonNull_native & 1) == 0)
    {
      v93 = sub_23DE82D4C(0, *(_QWORD *)(v93 + 16) + 1, 1, v93);
      *v90 = v93;
    }
    v95 = v102;
    v97 = *(_QWORD *)(v93 + 16);
    v96 = *(_QWORD *)(v93 + 24);
    if (v97 >= v96 >> 1)
    {
      v93 = sub_23DE82D4C(v96 > 1, v97 + 1, 1, v93);
      *v90 = v93;
    }
    *(_QWORD *)(v93 + 16) = v97 + 1;
    sub_23DE73D64(v92, v93+ ((*(unsigned __int8 *)(v91 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v91 + 80))+ *(_QWORD *)(v91 + 72) * v97, type metadata accessor for MenstrualCyclesWidgetEntry);
    swift_endAccess();
    return (*(uint64_t (**)(char *, uint64_t))(v95 + 8))(v103, v104);
  }
  return result;
}

void *sub_23DE7E530()
{
  void *v0;
  id v1;
  unint64_t v2;
  uint64_t v3;
  uint64_t v4;
  id v5;
  void *v6;
  uint64_t v7;
  id v8;

  v1 = objc_msgSend(v0, sel_menstruationProjections);
  sub_23DE6F000(0, &qword_256D0D630);
  v2 = sub_23DE87B34();

  if (v2 >> 62)
    goto LABEL_17;
  v3 = *(_QWORD *)((v2 & 0xFFFFFFFFFFFFF8) + 0x10);
  while (v3)
  {
    v4 = 4;
    while (1)
    {
      v5 = (v2 & 0xC000000000000001) != 0 ? (id)MEMORY[0x24264700C](v4 - 4, v2) : *(id *)(v2 + 8 * v4);
      v6 = v5;
      v7 = v4 - 3;
      if (__OFADD__(v4 - 4, 1))
        break;
      v8 = objc_msgSend(v5, sel_allDays);
      if (sub_23DE879C0() < (uint64_t)v8)
      {

        goto LABEL_13;
      }
      objc_msgSend(v6, sel_allDays);
      if ((sub_23DE87B94() & 1) != 0)
      {
        swift_bridgeObjectRelease();
        return v6;
      }

      ++v4;
      if (v7 == v3)
        goto LABEL_13;
    }
    __break(1u);
LABEL_17:
    swift_bridgeObjectRetain();
    v3 = sub_23DE87C54();
    swift_bridgeObjectRelease();
  }
LABEL_13:
  swift_bridgeObjectRelease();
  return 0;
}

uint64_t sub_23DE7E6B0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t *v4;
  uint64_t v6;
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
  char *v17;
  void (*v18)(char *, uint64_t, uint64_t);
  char *v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  unint64_t v26;
  unint64_t v27;
  char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void (*v33)(uint64_t (*)(uint64_t), char *);
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  char *v38;
  uint64_t v39;
  uint64_t v40;
  char *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;

  v43 = a3;
  v44 = a4;
  v45 = *v4;
  v39 = sub_23DE87534();
  v6 = *(_QWORD *)(v39 - 8);
  MEMORY[0x24BDAC7A8](v39);
  v8 = (char *)&v35 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = sub_23DE8745C();
  v10 = *(_QWORD *)(v9 - 8);
  v42 = *(_QWORD *)(v10 + 64);
  v37 = v10;
  MEMORY[0x24BDAC7A8](v9);
  v12 = (char *)&v35 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v40 = sub_23DE879CC();
  v13 = *(_QWORD *)(*(_QWORD *)(v40 - 8) + 64);
  v14 = *(_QWORD *)(v40 - 8);
  v15 = MEMORY[0x24BDAC7A8](v40);
  v38 = (char *)&v35 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v15);
  v17 = (char *)&v35 - v16;
  v18 = *(void (**)(char *, uint64_t, uint64_t))(v10 + 16);
  v36 = v9;
  v18(v12, a1, v9);
  (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))(v8, v46 + OBJC_IVAR____TtC29HealthMenstrualCyclesWidgetUI38MenstrualCyclesWidgetTimelineGenerator_gregorianCalendar, v39);
  v19 = v17;
  v41 = v17;
  sub_23DE879B4();
  v20 = swift_allocObject();
  swift_weakInit();
  v18(v12, a1, v9);
  v21 = v14;
  v35 = v14;
  v22 = v38;
  v23 = v40;
  (*(void (**)(char *, char *, uint64_t))(v14 + 16))(v38, v19, v40);
  v24 = v37;
  v25 = (*(unsigned __int8 *)(v37 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v37 + 80);
  v26 = (v42 + *(unsigned __int8 *)(v21 + 80) + v25) & ~(unint64_t)*(unsigned __int8 *)(v21 + 80);
  v27 = (v13 + v26 + 7) & 0xFFFFFFFFFFFFFFF8;
  v28 = (char *)swift_allocObject();
  v29 = v43;
  v30 = v44;
  *((_QWORD *)v28 + 2) = v20;
  *((_QWORD *)v28 + 3) = v29;
  *((_QWORD *)v28 + 4) = v30;
  (*(void (**)(char *, char *, uint64_t))(v24 + 32))(&v28[v25], v12, v36);
  v31 = v35;
  (*(void (**)(char *, char *, uint64_t))(v35 + 32))(&v28[v26], v22, v23);
  v32 = v46;
  *(_QWORD *)&v28[v27] = v45;
  v33 = *(void (**)(uint64_t (*)(uint64_t), char *))(*(_QWORD *)v32 + 136);
  swift_retain();
  swift_retain();
  v33(sub_23DE80740, v28);
  swift_release();
  (*(void (**)(char *, uint64_t))(v31 + 8))(v41, v23);
  return swift_release();
}

uint64_t sub_23DE7E950(void *a1, uint64_t a2, void (*a3)(uint64_t), uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
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
  char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  char *v24;
  uint64_t Strong;
  int *v26;
  uint64_t v27;
  uint64_t v28;
  void (*v29)(char *, uint64_t, uint64_t);
  void (*v30)(char *, uint64_t, uint64_t);
  uint64_t v31;
  double *v32;
  uint64_t v33;
  uint64_t v34;
  void (*v35)(char *, uint64_t, uint64_t, uint64_t);
  uint64_t v36;
  int *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  void (*v41)(char *, char *, uint64_t);
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  _BYTE *v47;
  void *v48;
  uint64_t v49;
  uint64_t v50;
  double *v51;
  uint64_t v52;
  void (*v53)(char *, uint64_t, uint64_t, uint64_t);
  uint64_t v54;
  int *v55;
  uint64_t v56;
  char *v57;
  uint64_t v58;
  uint64_t v59;
  char *v61;
  uint64_t v62;
  char *v63;
  unint64_t v64;
  unint64_t v65;
  unint64_t v66;
  char *v67;
  uint64_t v68;
  void (*v69)(uint64_t (*)(uint64_t), char *);
  void (*v70)(char *, char *, uint64_t);
  void (*v71)(uint64_t, char *, uint64_t);
  uint64_t v72;
  void (*v73)(char *, uint64_t, uint64_t, uint64_t);
  uint64_t v74;
  void (*v75)(char *, uint64_t, uint64_t);
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  void (*v81)(char *, uint64_t, uint64_t);
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  char *v85;
  char *v86;
  uint64_t v87;
  uint64_t v88;
  double *v89;
  char *v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  void (*v94)(uint64_t);
  void *v95;
  char *v96;
  uint64_t v97;
  uint64_t v98;
  char v99;

  v87 = a7;
  v97 = a6;
  v98 = a5;
  v93 = a4;
  v94 = a3;
  v95 = a1;
  v91 = type metadata accessor for MenstrualCyclesWidgetEntry(0);
  v7 = MEMORY[0x24BDAC7A8](v91);
  v9 = (char *)&v70 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v7);
  v92 = (uint64_t)&v70 - v10;
  sub_23DE7349C(0, &qword_25432B9D8, (uint64_t (*)(uint64_t))MEMORY[0x24BDFB270], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1C68]);
  v12 = MEMORY[0x24BDAC7A8](v11);
  v86 = (char *)&v70 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v12);
  v90 = (char *)&v70 - v14;
  sub_23DE80A64(0);
  MEMORY[0x24BDAC7A8](v15);
  v89 = (double *)((char *)&v70 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0));
  v17 = sub_23DE879CC();
  v18 = *(_QWORD *)(v17 - 8);
  v19 = *(_QWORD *)(v18 + 64);
  MEMORY[0x24BDAC7A8](v17);
  v20 = (char *)&v70 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  v21 = sub_23DE8745C();
  v22 = *(_QWORD *)(v21 - 8);
  v23 = *(_QWORD *)(v22 + 64);
  MEMORY[0x24BDAC7A8](v21);
  v24 = (char *)&v70 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_beginAccess();
  Strong = swift_weakLoadStrong();
  v88 = v17;
  v96 = v20;
  if (!Strong)
    goto LABEL_6;
  if (!v95)
  {
    swift_release();
LABEL_6:
    (*(void (**)(char *, uint64_t, uint64_t))(v22 + 16))((char *)&v70 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0), v98, v21);
    v84 = v18;
    (*(void (**)(char *, uint64_t, uint64_t))(v18 + 16))((char *)&v70 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0), v97, v17);
    v50 = type metadata accessor for MenstrualCyclesWidgetEntry.State(0);
    v51 = v89;
    (*(void (**)(double *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v50 - 8) + 56))(v89, 1, 1, v50);
    v52 = sub_23DE87A74();
    v53 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v52 - 8) + 56);
    v54 = (uint64_t)v90;
    v53(v90, 1, 1, v52);
    v55 = (int *)v91;
    v98 = *(int *)(v91 + 28);
    v56 = (uint64_t)&v9[*(int *)(v91 + 32)];
    v53((char *)v56, 1, 1, v52);
    v57 = &v9[v55[9]];
    *(_QWORD *)v57 = 0;
    v57[8] = 1;
    (*(void (**)(char *, char *, uint64_t))(v22 + 32))(v9, v24, v21);
    (*(void (**)(char *, char *, uint64_t))(v84 + 32))(&v9[v55[5]], v96, v88);
    sub_23DE73D64((uint64_t)v51, (uint64_t)&v9[v55[6]], (uint64_t (*)(_QWORD))sub_23DE80A64);
    *(_QWORD *)&v9[v98] = 0;
    sub_23DE6C5DC(v54, v56);
    *(_QWORD *)v57 = 0;
    v57[8] = 1;
    v58 = (uint64_t)v9;
    v59 = v92;
    sub_23DE73D64(v58, v92, type metadata accessor for MenstrualCyclesWidgetEntry);
    v94(v59);
    return sub_23DE6EFC4(v59, type metadata accessor for MenstrualCyclesWidgetEntry);
  }
  v72 = v23;
  v76 = v19;
  v83 = Strong;
  v26 = (int *)v91;
  v82 = swift_allocBox();
  v80 = v27;
  v28 = v22;
  v29 = *(void (**)(char *, uint64_t, uint64_t))(v22 + 16);
  v85 = (char *)&v70 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  v81 = v29;
  v29(v85, v98, v21);
  v30 = *(void (**)(char *, uint64_t, uint64_t))(v18 + 16);
  v79 = v21;
  v31 = v17;
  v75 = v30;
  v30(v20, v97, v17);
  v95 = v95;
  v32 = v89;
  sub_23DE6C8B4(v95, v89);
  v33 = type metadata accessor for MenstrualCyclesWidgetEntry.State(0);
  (*(void (**)(double *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v33 - 8) + 56))(v32, 0, 1, v33);
  v34 = sub_23DE87A74();
  v35 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v34 - 8) + 56);
  v36 = (uint64_t)v90;
  v37 = v26;
  v35(v90, 1, 1, v34);
  v78 = v26[7];
  v38 = v92;
  v39 = v92 + v26[8];
  v74 = v34;
  v73 = v35;
  v35((char *)v39, 1, 1, v34);
  v40 = v38 + v37[9];
  *(_QWORD *)v40 = 0;
  *(_BYTE *)(v40 + 8) = 1;
  v77 = v28;
  v41 = *(void (**)(char *, char *, uint64_t))(v28 + 32);
  v42 = v18;
  v43 = v79;
  v70 = v41;
  v41((char *)v38, v85, v79);
  v44 = v38 + v37[5];
  v71 = *(void (**)(uint64_t, char *, uint64_t))(v42 + 32);
  v71(v44, v96, v31);
  sub_23DE73D64((uint64_t)v32, v38 + v37[6], (uint64_t (*)(_QWORD))sub_23DE80A64);
  *(_QWORD *)(v38 + v78) = 0;
  v45 = v39;
  v46 = v80;
  sub_23DE6C5DC(v36, v45);
  *(_QWORD *)v40 = 0;
  *(_BYTE *)(v40 + 8) = 1;
  sub_23DE73D64(v38, v46, type metadata accessor for MenstrualCyclesWidgetEntry);
  if (objc_msgSend(v95, sel_state) == (id)1)
  {
    v47 = v85;
    v81(v85, v98, v43);
    v48 = v95;
    sub_23DE86698(v48, v47, &v99);
    v49 = (uint64_t)v86;
    sub_23DE87A68();
    v73((char *)v49, 0, 1, v74);
    sub_23DE6C5DC(v49, v46 + v37[8]);
    sub_23DE73DA8(v46, v38, type metadata accessor for MenstrualCyclesWidgetEntry);
    v94(v38);

    swift_release();
    sub_23DE6EFC4(v38, type metadata accessor for MenstrualCyclesWidgetEntry);
  }
  else
  {
    v61 = v96;
    v62 = v88;
    v75(v96, v97, v88);
    v63 = v85;
    v81(v85, v98, v43);
    v64 = (*(unsigned __int8 *)(v42 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v42 + 80);
    v65 = (v76 + *(unsigned __int8 *)(v77 + 80) + v64) & ~(unint64_t)*(unsigned __int8 *)(v77 + 80);
    v66 = (v72 + v65 + 7) & 0xFFFFFFFFFFFFFFF8;
    v67 = (char *)swift_allocObject();
    v68 = v93;
    *((_QWORD *)v67 + 2) = v94;
    *((_QWORD *)v67 + 3) = v68;
    *((_QWORD *)v67 + 4) = v82;
    v71((uint64_t)&v67[v64], v61, v62);
    v70(&v67[v65], v63, v43);
    *(_QWORD *)&v67[v66] = v87;
    v69 = *(void (**)(uint64_t (*)(uint64_t), char *))(*(_QWORD *)v83 + 128);
    swift_retain();
    swift_retain();
    v69(sub_23DE80B50, v67);
    swift_release();
    swift_release();

  }
  return swift_release();
}

uint64_t sub_23DE7F0A0(void *a1, void (*a2)(char *), uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, char *a7)
{
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
  id v23;
  id v24;
  unint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  id v32;
  NSObject *v33;
  os_log_type_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  unint64_t v39;
  uint64_t v40;
  id v41;
  uint64_t v42;
  uint64_t v43;
  id v44;
  uint64_t v45;
  unint64_t v46;
  unint64_t v47;
  os_log_t v48;
  uint64_t v49;
  void *v50;
  NSObject *v51;
  os_log_type_t v52;
  uint8_t *v53;
  uint64_t v54;
  uint64_t v55;
  unint64_t v56;
  void (*v57)(char *);
  uint64_t v58;
  uint64_t v59;
  void *v60;
  id v61;
  id v62;
  void *v63;
  id v64;
  uint64_t v65;
  uint64_t v66;
  id v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v71;
  os_log_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  void *v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  char *v82;
  uint64_t v83;
  char *v84;
  void (*v85)(char *);
  uint64_t v86;
  char *v87;
  uint64_t v88;
  uint64_t v89[4];
  uint64_t v90[4];

  v87 = a7;
  v88 = a5;
  v83 = a6;
  v81 = sub_23DE8745C();
  v80 = *(_QWORD *)(v81 - 8);
  MEMORY[0x24BDAC7A8](v81);
  v82 = (char *)&v71 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23DE7349C(0, &qword_25432B9D8, (uint64_t (*)(uint64_t))MEMORY[0x24BDFB270], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1C68]);
  MEMORY[0x24BDAC7A8](v11);
  v84 = (char *)&v71 - v12;
  v13 = sub_23DE879CC();
  v78 = *(_QWORD *)(v13 - 8);
  MEMORY[0x24BDAC7A8](v13);
  v15 = (char *)&v71 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = sub_23DE875B8();
  v17 = *(_QWORD *)(v16 - 8);
  MEMORY[0x24BDAC7A8](v16);
  v19 = (char *)&v71 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  v79 = type metadata accessor for MenstrualCyclesWidgetEntry(0);
  MEMORY[0x24BDAC7A8](v79);
  v21 = (char *)&v71 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  v22 = swift_projectBox();
  if (a1)
  {
    v85 = a2;
    v86 = a3;
    v23 = a1;
    if ((objc_msgSend(v23, sel_menstruationProjectionsEnabled) & 1) == 0)
      goto LABEL_11;
    v24 = objc_msgSend(v23, sel_menstruationProjections);
    v77 = sub_23DE6F000(0, &qword_256D0D630);
    v25 = sub_23DE87B34();

    if (v25 >> 62)
    {
      swift_bridgeObjectRetain();
      v26 = sub_23DE87C54();
      swift_bridgeObjectRelease();
    }
    else
    {
      v26 = *(_QWORD *)((v25 & 0xFFFFFFFFFFFFF8) + 0x10);
    }
    swift_bridgeObjectRelease();
    if (v26)
    {
      v27 = v13;
      v28 = sub_23DE7E530();
      if (!v28)
      {
        v76 = 0;
        if (qword_25432B9F8 != -1)
          swift_once();
        v29 = __swift_project_value_buffer(v16, (uint64_t)qword_25432BDC8);
        v30 = v17;
        (*(void (**)(char *, uint64_t, uint64_t))(v17 + 16))(v19, v29, v16);
        v31 = v27;
        (*(void (**)(char *, uint64_t, uint64_t))(v78 + 16))(v15, v88, v27);
        v32 = v23;
        v33 = sub_23DE875A0();
        v34 = sub_23DE87B64();
        LODWORD(v88) = v34;
        if (os_log_type_enabled(v33, v34))
        {
          v35 = swift_slowAlloc();
          v75 = v16;
          v36 = v35;
          v73 = swift_slowAlloc();
          v90[0] = v73;
          *(_DWORD *)v36 = 136446466;
          v72 = v33;
          v37 = sub_23DE87CCC();
          v74 = v30;
          v87 = v19;
          v38 = v32;
          v89[0] = sub_23DE7350C(v37, v39, v90);
          sub_23DE87BD0();
          swift_bridgeObjectRelease();
          *(_WORD *)(v36 + 12) = 2080;
          sub_23DE80C0C();
          v89[0] = sub_23DE87C6C();
          v89[1] = v40;
          v71 = v36 + 14;
          sub_23DE87B1C();
          v41 = objc_msgSend(v32, sel_menstruationProjections);
          v42 = v77;
          v43 = sub_23DE87B34();

          MEMORY[0x242646F28](v43, v42);
          v77 = (uint64_t)v15;
          sub_23DE87B1C();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRetain();
          sub_23DE87C9C();
          v44 = (id)HKSensitiveLogItem();
          swift_unknownObjectRelease();
          sub_23DE87BE8();
          swift_unknownObjectRelease();
          v45 = sub_23DE87B10();
          v47 = v46;
          swift_bridgeObjectRelease();
          v89[0] = sub_23DE7350C(v45, v47, v90);
          sub_23DE87BD0();

          swift_bridgeObjectRelease();
          (*(void (**)(uint64_t, uint64_t))(v78 + 8))(v77, v31);

          v48 = v72;
          _os_log_impl(&dword_23DE6A000, v72, (os_log_type_t)v88, "[%{public}s] Snapshot: No projections found that contains %s", (uint8_t *)v36, 0x16u);
          v49 = v73;
          swift_arrayDestroy();
          MEMORY[0x242647498](v49, -1, -1);
          MEMORY[0x242647498](v36, -1, -1);

          (*(void (**)(char *, uint64_t))(v74 + 8))(v87, v75);
        }
        else
        {

          (*(void (**)(char *, uint64_t))(v78 + 8))(v15, v31);
          (*(void (**)(char *, uint64_t))(v30 + 8))(v19, v16);
        }
        v28 = v76;
      }
      swift_beginAccess();
      v58 = v79;
      v59 = *(int *)(v79 + 28);
      v60 = *(void **)(v22 + v59);
      *(_QWORD *)(v22 + v59) = v28;
      v61 = v28;

      v50 = v23;
      v62 = objc_msgSend(v23, sel_lastMenstrualFlowDayIndex);
      v63 = v62;
      if (v62)
      {
        v64 = objc_msgSend(v62, sel_integerValue);

      }
      else
      {
        v64 = 0;
      }
      v57 = v85;
      swift_beginAccess();
      v65 = v22 + *(int *)(v58 + 36);
      *(_QWORD *)v65 = v64;
      *(_BYTE *)(v65 + 8) = v63 == 0;
      v66 = (uint64_t)v82;
      (*(void (**)(char *, uint64_t, uint64_t))(v80 + 16))(v82, v83, v81);
      v67 = v61;
      sub_23DE863C4(v28, v66, (char *)v89);
      v68 = (uint64_t)v84;
      sub_23DE87A68();

      v69 = sub_23DE87A74();
      (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v69 - 8) + 56))(v68, 0, 1, v69);
      swift_beginAccess();
      sub_23DE6C5DC(v68, v22 + *(int *)(v58 + 32));
    }
    else
    {
LABEL_11:
      v50 = v23;
      if (qword_25432B9F8 != -1)
        swift_once();
      __swift_project_value_buffer(v16, (uint64_t)qword_25432BDC8);
      v51 = sub_23DE875A0();
      v52 = sub_23DE87B88();
      if (os_log_type_enabled(v51, v52))
      {
        v53 = (uint8_t *)swift_slowAlloc();
        v54 = swift_slowAlloc();
        v89[0] = v54;
        *(_DWORD *)v53 = 136446210;
        v55 = sub_23DE87CCC();
        v90[0] = sub_23DE7350C(v55, v56, v89);
        sub_23DE87BD0();
        swift_bridgeObjectRelease();
        _os_log_impl(&dword_23DE6A000, v51, v52, "[%{public}s] Snapshot: Projections unavailable.", v53, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x242647498](v54, -1, -1);
        MEMORY[0x242647498](v53, -1, -1);
      }

      v57 = v85;
    }
    swift_beginAccess();
    sub_23DE73DA8(v22, (uint64_t)v21, type metadata accessor for MenstrualCyclesWidgetEntry);
    v57(v21);

  }
  else
  {
    swift_beginAccess();
    sub_23DE73DA8(v22, (uint64_t)v21, type metadata accessor for MenstrualCyclesWidgetEntry);
    a2(v21);
  }
  return sub_23DE6EFC4((uint64_t)v21, type metadata accessor for MenstrualCyclesWidgetEntry);
}

void sub_23DE7F9A8(uint64_t a1, uint64_t a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  _QWORD *v12;
  id v13;
  void *v14;
  id v15;
  id v16;
  void *v17;
  unint64_t aBlock;
  unint64_t v19;
  uint64_t (*v20)();
  void *v21;
  void (*v22)(void *, void *, void *);
  _QWORD *v23;

  v3 = v2;
  v6 = *v3;
  v7 = sub_23DE87480();
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7);
  v10 = (char *)&aBlock - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = swift_allocObject();
  swift_weakInit();
  v12 = (_QWORD *)swift_allocObject();
  v12[2] = v11;
  v12[3] = a1;
  v12[4] = a2;
  v12[5] = v6;
  v13 = objc_allocWithZone(MEMORY[0x24BE46B48]);
  v22 = sub_23DE80760;
  v23 = v12;
  aBlock = MEMORY[0x24BDAC760];
  v19 = 1107296256;
  v20 = sub_23DE8079C;
  v21 = &block_descriptor;
  v14 = _Block_copy(&aBlock);
  swift_retain();
  swift_retain();
  v15 = objc_msgSend(v13, sel_initWithUpdateHandler_, v14);
  _Block_release(v14);
  swift_release();
  swift_release();
  aBlock = 0;
  v19 = 0xE000000000000000;
  v16 = v15;
  sub_23DE87C0C();
  swift_bridgeObjectRelease();
  aBlock = 0xD000000000000027;
  v19 = 0x800000023DE89C10;
  sub_23DE87474();
  sub_23DE87468();
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  sub_23DE87B1C();
  swift_bridgeObjectRelease();
  v17 = (void *)sub_23DE87AEC();
  swift_bridgeObjectRelease();
  objc_msgSend(v16, sel_setDebugIdentifier_, v17);

  objc_msgSend((id)v3[2], sel_executeQuery_, v16);
}

void sub_23DE7FBD8(uint64_t a1, uint64_t a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  _QWORD *v12;
  id v13;
  void *v14;
  id v15;
  id v16;
  void *v17;
  unint64_t aBlock;
  unint64_t v19;
  uint64_t (*v20)();
  void *v21;
  void (*v22)(void *, void *, void *);
  _QWORD *v23;

  v3 = v2;
  v6 = *v3;
  v7 = sub_23DE87480();
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7);
  v10 = (char *)&aBlock - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = swift_allocObject();
  swift_weakInit();
  v12 = (_QWORD *)swift_allocObject();
  v12[2] = v11;
  v12[3] = a1;
  v12[4] = a2;
  v12[5] = v6;
  v13 = objc_allocWithZone(MEMORY[0x24BDD3CB8]);
  v22 = sub_23DE807E8;
  v23 = v12;
  aBlock = MEMORY[0x24BDAC760];
  v19 = 1107296256;
  v20 = sub_23DE8079C;
  v21 = &block_descriptor_17;
  v14 = _Block_copy(&aBlock);
  swift_retain();
  swift_retain();
  v15 = objc_msgSend(v13, sel_initWithUpdateHandler_, v14);
  _Block_release(v14);
  swift_release();
  swift_release();
  aBlock = 0;
  v19 = 0xE000000000000000;
  v16 = v15;
  sub_23DE87C0C();
  swift_bridgeObjectRelease();
  aBlock = 0xD000000000000027;
  v19 = 0x800000023DE89C10;
  sub_23DE87474();
  sub_23DE87468();
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  sub_23DE87B1C();
  swift_bridgeObjectRelease();
  v17 = (void *)sub_23DE87AEC();
  swift_bridgeObjectRelease();
  objc_msgSend(v16, sel_setDebugIdentifier_, v17);

  objc_msgSend((id)v3[2], sel_executeQuery_, v16);
}

void sub_23DE7FE08(void *a1, void *a2, void *a3, uint64_t a4, void (*a5)(_QWORD), uint64_t a6, uint64_t a7, char a8, const char *a9, const char *a10)
{
  uint64_t Strong;
  id v16;
  uint64_t v17;
  id v18;
  uint64_t v19;
  id v20;
  id v21;
  id v22;
  id v23;
  NSObject *v24;
  os_log_type_t v25;
  char v26;
  uint64_t v27;
  uint64_t v28;
  unint64_t v29;
  id v30;
  id v31;
  uint64_t v32;
  unint64_t v33;
  unint64_t v34;
  id v35;
  uint64_t v36;
  id v37;
  id v38;
  id v39;
  id v40;
  NSObject *v41;
  os_log_type_t v42;
  uint64_t v43;
  _QWORD *v44;
  uint64_t v45;
  uint64_t v46;
  unint64_t v47;
  id v48;
  uint64_t v49;
  unint64_t v50;
  id v51;
  id v52;
  _QWORD *v53;
  char *v54;
  void (*v55)(_QWORD);
  uint64_t v56[4];
  uint64_t v57;

  swift_beginAccess();
  Strong = swift_weakLoadStrong();
  if (Strong)
  {
    v16 = *(id *)(Strong + 16);
    swift_release();
    objc_msgSend(v16, sel_stopQuery_, a1);

  }
  if (a2)
  {
    v17 = qword_25432B9F8;
    v18 = a2;
    if (v17 != -1)
      swift_once();
    v19 = sub_23DE875B8();
    __swift_project_value_buffer(v19, (uint64_t)qword_25432BDC8);
    v20 = a1;
    v21 = v18;
    v22 = v20;
    v23 = v21;
    v24 = sub_23DE875A0();
    v25 = sub_23DE87B88();
    if (os_log_type_enabled(v24, v25))
    {
      v26 = a8;
      v27 = swift_slowAlloc();
      v53 = (_QWORD *)swift_slowAlloc();
      v54 = (char *)swift_slowAlloc();
      v57 = (uint64_t)v54;
      *(_DWORD *)v27 = 136446722;
      v55 = a5;
      v28 = sub_23DE87CCC();
      sub_23DE7350C(v28, v29, &v57);
      sub_23DE87BD0();
      swift_bridgeObjectRelease();
      *(_BYTE *)(v27 + 12) = v26;
      *(_BYTE *)(v27 + 13) = 8;
      v30 = v23;
      v31 = (id)HKSensitiveLogItem();
      sub_23DE87BE8();
      swift_unknownObjectRelease();
      v32 = sub_23DE87B10();
      v34 = v33;

      sub_23DE7350C(v32, v34, &v57);
      sub_23DE87BD0();

      swift_bridgeObjectRelease();
      *(_WORD *)(v27 + 22) = 2112;
      v56[0] = (uint64_t)v22;
      v35 = v22;
      a5 = v55;
      sub_23DE87BD0();
      *v53 = v22;

      _os_log_impl(&dword_23DE6A000, v24, v25, a9, (uint8_t *)v27, 0x20u);
      sub_23DE80A04(0, qword_25432BB78, &qword_25432BB70, 0x24BEDCDF0, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1C68]);
      swift_arrayDestroy();
      MEMORY[0x242647498](v53, -1, -1);
      swift_arrayDestroy();
      MEMORY[0x242647498](v54, -1, -1);
      MEMORY[0x242647498](v27, -1, -1);

    }
    else
    {

    }
    v52 = v23;
    a5(a2);

  }
  else
  {
    if (qword_25432B9F8 != -1)
      swift_once();
    v36 = sub_23DE875B8();
    __swift_project_value_buffer(v36, (uint64_t)qword_25432BDC8);
    v37 = a3;
    v38 = a1;
    v39 = a3;
    v40 = v38;
    v41 = sub_23DE875A0();
    v42 = sub_23DE87B70();
    if (os_log_type_enabled(v41, v42))
    {
      v43 = swift_slowAlloc();
      v44 = (_QWORD *)swift_slowAlloc();
      v45 = swift_slowAlloc();
      *(_DWORD *)v43 = 136446722;
      v56[0] = v45;
      v46 = sub_23DE87CCC();
      v57 = sub_23DE7350C(v46, v47, v56);
      sub_23DE87BD0();
      swift_bridgeObjectRelease();
      *(_WORD *)(v43 + 12) = 2080;
      v57 = (uint64_t)a3;
      v48 = a3;
      sub_23DE7349C(0, &qword_256D0D620, (uint64_t (*)(uint64_t))sub_23DE809B0, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1C68]);
      v49 = sub_23DE87B10();
      v57 = sub_23DE7350C(v49, v50, v56);
      sub_23DE87BD0();
      swift_bridgeObjectRelease();

      *(_WORD *)(v43 + 22) = 2112;
      v57 = (uint64_t)v40;
      v51 = v40;
      sub_23DE87BD0();
      *v44 = v40;

      _os_log_impl(&dword_23DE6A000, v41, v42, a10, (uint8_t *)v43, 0x20u);
      sub_23DE80A04(0, qword_25432BB78, &qword_25432BB70, 0x24BEDCDF0, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1C68]);
      swift_arrayDestroy();
      MEMORY[0x242647498](v44, -1, -1);
      swift_arrayDestroy();
      MEMORY[0x242647498](v45, -1, -1);
      MEMORY[0x242647498](v43, -1, -1);

      a5(0);
    }
    else
    {

      a5(0);
    }
  }
}

uint64_t MenstrualCyclesWidgetTimelineGenerator.deinit()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  void (*v3)(uint64_t, uint64_t);

  v1 = v0 + OBJC_IVAR____TtC29HealthMenstrualCyclesWidgetUI38MenstrualCyclesWidgetTimelineGenerator_currentCalendar;
  v2 = sub_23DE87534();
  v3 = *(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8);
  v3(v1, v2);
  v3(v0 + OBJC_IVAR____TtC29HealthMenstrualCyclesWidgetUI38MenstrualCyclesWidgetTimelineGenerator_gregorianCalendar, v2);
  return v0;
}

uint64_t MenstrualCyclesWidgetTimelineGenerator.__deallocating_deinit()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  void (*v3)(uint64_t, uint64_t);

  v1 = v0 + OBJC_IVAR____TtC29HealthMenstrualCyclesWidgetUI38MenstrualCyclesWidgetTimelineGenerator_currentCalendar;
  v2 = sub_23DE87534();
  v3 = *(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8);
  v3(v1, v2);
  v3(v0 + OBJC_IVAR____TtC29HealthMenstrualCyclesWidgetUI38MenstrualCyclesWidgetTimelineGenerator_gregorianCalendar, v2);
  return swift_deallocClassInstance();
}

uint64_t sub_23DE8051C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  void (*v6)(uint64_t, uint64_t);

  v1 = sub_23DE8745C();
  v2 = *(_QWORD *)(v1 - 8);
  v3 = *(unsigned __int8 *)(v2 + 80);
  v4 = (v3 + 16) & ~v3;
  v5 = (v3 + 16 + ((((*(_QWORD *)(v2 + 64) + 7 + v4) & 0xFFFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFFFF8)) & ~v3;
  v6 = *(void (**)(uint64_t, uint64_t))(v2 + 8);
  v6(v0 + v4, v1);
  swift_release();
  swift_release();
  v6(v0 + v5, v1);
  return swift_deallocObject();
}

uint64_t sub_23DE805D4(char *a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;

  v3 = *(_QWORD *)(sub_23DE8745C() - 8);
  v4 = *(unsigned __int8 *)(v3 + 80);
  v5 = (v4 + 16) & ~v4;
  v6 = *(_QWORD *)(v3 + 64) + 7;
  v7 = (v6 + v5) & 0xFFFFFFFFFFFFFFF8;
  return sub_23DE7BB60(a1, v1 + v5, *(_QWORD *)(v1 + v7), *(void (**)(uint64_t))(v1 + ((v7 + 15) & 0xFFFFFFFFFFFFFFF8)), *(_QWORD *)(v1 + ((v7 + 15) & 0xFFFFFFFFFFFFFFF8) + 8), v1 + ((v4 + 16 + ((v7 + 15) & 0xFFFFFFFFFFFFFFF8)) & ~v4), *(_QWORD *)(v1 + ((v6 + ((v4 + 16 + ((v7 + 15) & 0xFFFFFFFFFFFFFFF8)) & ~v4)) & 0xFFFFFFFFFFFFF8)));
}

uint64_t sub_23DE8064C()
{
  swift_weakDestroy();
  return swift_deallocObject();
}

uint64_t sub_23DE80670()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;

  v1 = sub_23DE8745C();
  v2 = *(_QWORD *)(v1 - 8);
  v3 = (*(unsigned __int8 *)(v2 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  v4 = *(_QWORD *)(v2 + 64);
  v5 = sub_23DE879CC();
  v6 = *(_QWORD *)(v5 - 8);
  v7 = (v3 + v4 + *(unsigned __int8 *)(v6 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80);
  swift_release();
  swift_release();
  (*(void (**)(unint64_t, uint64_t))(v2 + 8))(v0 + v3, v1);
  (*(void (**)(unint64_t, uint64_t))(v6 + 8))(v0 + v7, v5);
  return swift_deallocObject();
}

uint64_t sub_23DE80740(uint64_t a1)
{
  return sub_23DE80B6C(a1, (uint64_t (*)(_QWORD))MEMORY[0x24BDCE900], (uint64_t (*)(_QWORD))MEMORY[0x24BDD2488], (uint64_t (*)(uint64_t, _QWORD, _QWORD, _QWORD, char *, char *, _QWORD))sub_23DE7E950);
}

void sub_23DE80760(void *a1, void *a2, void *a3)
{
  uint64_t v3;

  sub_23DE7FE08(a1, a2, a3, *(_QWORD *)(v3 + 16), *(void (**)(_QWORD))(v3 + 24), *(_QWORD *)(v3 + 32), *(_QWORD *)(v3 + 40), 34, "[%{public}s] Fetched analysis: %{public}s query: %@", "[%{public}s] Error when querying analysis: %s query: %@");
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

uint64_t objectdestroy_9Tm()
{
  swift_release();
  swift_release();
  return swift_deallocObject();
}

void sub_23DE807E8(void *a1, void *a2, void *a3)
{
  uint64_t v3;

  sub_23DE7FE08(a1, a2, a3, *(_QWORD *)(v3 + 16), *(void (**)(_QWORD))(v3 + 24), *(_QWORD *)(v3 + 32), *(_QWORD *)(v3 + 40), 32, "[%{public}s] Fetched pregnancy model: %s query: %@", "[%{public}s] Error when querying pregnancy state: %s query: %@");
}

void sub_23DE80824(uint64_t a1, void *a2, void *a3, void *a4)
{
  void (*v7)(id, void *, void *);
  id v8;
  id v9;
  id v10;

  v7 = *(void (**)(id, void *, void *))(a1 + 32);
  swift_retain();
  v10 = a2;
  v8 = a3;
  v9 = a4;
  v7(v10, a3, a4);
  swift_release();

}

uint64_t sub_23DE808AC()
{
  return type metadata accessor for MenstrualCyclesWidgetTimelineGenerator();
}

uint64_t type metadata accessor for MenstrualCyclesWidgetTimelineGenerator()
{
  uint64_t result;

  result = qword_25432BB18;
  if (!qword_25432BB18)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_23DE808F0()
{
  uint64_t result;
  unint64_t v1;

  result = sub_23DE87534();
  if (v1 <= 0x3F)
  {
    result = swift_updateClassMetadata2();
    if (!result)
      return 0;
  }
  return result;
}

uint64_t method lookup function for MenstrualCyclesWidgetTimelineGenerator()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of MenstrualCyclesWidgetTimelineGenerator.__allocating_init(healthStore:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 104))();
}

uint64_t dispatch thunk of MenstrualCyclesWidgetTimelineGenerator.getTimelineOfEntries(for:endDate:completion:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 112))();
}

uint64_t dispatch thunk of MenstrualCyclesWidgetTimelineGenerator.snapshot(for:family:completion:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 120))();
}

uint64_t dispatch thunk of MenstrualCyclesWidgetTimelineGenerator.getCycleAnalysis(completion:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 128))();
}

uint64_t dispatch thunk of MenstrualCyclesWidgetTimelineGenerator.getPregnancyModel(completion:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 136))();
}

unint64_t sub_23DE809B0()
{
  unint64_t result;

  result = qword_256D0D628;
  if (!qword_256D0D628)
  {
    result = swift_getExistentialTypeMetadata();
    atomic_store(result, (unint64_t *)&qword_256D0D628);
  }
  return result;
}

void sub_23DE80A04(uint64_t a1, unint64_t *a2, unint64_t *a3, uint64_t a4, uint64_t (*a5)(uint64_t, uint64_t))
{
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;

  if (!*a2)
  {
    v8 = sub_23DE6F000(255, a3);
    v9 = a5(a1, v8);
    if (!v10)
      atomic_store(v9, a2);
  }
}

void sub_23DE80A64(uint64_t a1)
{
  sub_23DE7349C(a1, &qword_25432BB38, type metadata accessor for MenstrualCyclesWidgetEntry.State, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1C68]);
}

uint64_t sub_23DE80A80()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;

  v1 = sub_23DE879CC();
  v2 = *(_QWORD *)(v1 - 8);
  v3 = (*(unsigned __int8 *)(v2 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  v4 = *(_QWORD *)(v2 + 64);
  v5 = sub_23DE8745C();
  v6 = *(_QWORD *)(v5 - 8);
  v7 = (v3 + v4 + *(unsigned __int8 *)(v6 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80);
  swift_release();
  swift_release();
  (*(void (**)(unint64_t, uint64_t))(v2 + 8))(v0 + v3, v1);
  (*(void (**)(unint64_t, uint64_t))(v6 + 8))(v0 + v7, v5);
  return swift_deallocObject();
}

uint64_t sub_23DE80B50(uint64_t a1)
{
  return sub_23DE80B6C(a1, (uint64_t (*)(_QWORD))MEMORY[0x24BDD2488], (uint64_t (*)(_QWORD))MEMORY[0x24BDCE900], (uint64_t (*)(uint64_t, _QWORD, _QWORD, _QWORD, char *, char *, _QWORD))sub_23DE7F0A0);
}

uint64_t sub_23DE80B6C(uint64_t a1, uint64_t (*a2)(_QWORD), uint64_t (*a3)(_QWORD), uint64_t (*a4)(uint64_t, _QWORD, _QWORD, _QWORD, char *, char *, _QWORD))
{
  char *v4;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;

  v7 = *(_QWORD *)(a2(0) - 8);
  v8 = (*(unsigned __int8 *)(v7 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
  v9 = *(_QWORD *)(v7 + 64);
  v10 = *(_QWORD *)(a3(0) - 8);
  v11 = (v8 + v9 + *(unsigned __int8 *)(v10 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  return a4(a1, *((_QWORD *)v4 + 2), *((_QWORD *)v4 + 3), *((_QWORD *)v4 + 4), &v4[v8], &v4[v11], *(_QWORD *)&v4[(*(_QWORD *)(v10 + 64) + v11 + 7) & 0xFFFFFFFFFFFFF8]);
}

unint64_t sub_23DE80C0C()
{
  unint64_t result;
  uint64_t v1;

  result = qword_256D0D638;
  if (!qword_256D0D638)
  {
    v1 = sub_23DE879CC();
    result = MEMORY[0x2426473FC](MEMORY[0x24BDD24C8], v1);
    atomic_store(result, (unint64_t *)&qword_256D0D638);
  }
  return result;
}

uint64_t sub_23DE80C54()
{
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_23DE80C78()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void (*v6)(uint64_t, uint64_t);

  v1 = sub_23DE8745C();
  v2 = *(_QWORD *)(v1 - 8);
  v3 = *(unsigned __int8 *)(v2 + 80);
  v4 = (v3 + 56) & ~v3;
  v5 = (*(_QWORD *)(v2 + 64) + v3 + v4) & ~v3;
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  v6 = *(void (**)(uint64_t, uint64_t))(v2 + 8);
  v6(v0 + v4, v1);
  v6(v0 + v5, v1);
  return swift_deallocObject();
}

uint64_t sub_23DE80D30(void *a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;

  v3 = *(_QWORD *)(sub_23DE8745C() - 8);
  v4 = *(unsigned __int8 *)(v3 + 80);
  return sub_23DE7D120(a1, *(void (**)(uint64_t))(v1 + 16), *(_QWORD *)(v1 + 24), *(_QWORD *)(v1 + 32), *(_QWORD *)(v1 + 40), *(_QWORD *)(v1 + 48), v1 + ((v4 + 56) & ~v4), v1 + ((*(_QWORD *)(v3 + 64) + v4 + ((v4 + 56) & ~v4)) & ~v4), *(_QWORD *)(v1+ ((*(_QWORD *)(v3 + 64) + ((*(_QWORD *)(v3 + 64) + v4 + ((v4 + 56) & ~v4)) & ~v4) + 7) & 0xFFFFFFFFFFFFF8)));
}

uint64_t sub_23DE80DAC(void (*a1)(char *, char *, uint64_t), uint64_t a2, void (*a3)(char *, char *, uint64_t))
{
  uint64_t v3;

  return sub_23DE7CB14(a1, a2, a3, *(void **)(v3 + 16), *(void (**)(uint64_t, _QWORD, uint64_t, id))(v3 + 24), *(void **)(v3 + 32), *(unint64_t **)(v3 + 40));
}

void sub_23DE80DB8(uint64_t a1)
{
  sub_23DE7349C(a1, &qword_256D0D658, type metadata accessor for MenstrualCyclesWidgetEntry, MEMORY[0x24BEE1250]);
}

void sub_23DE80DD4(uint64_t a1)
{
  sub_23DE7349C(a1, &qword_25432B9F0, (uint64_t (*)(uint64_t))MEMORY[0x24BDCE900], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1C68]);
}

uint64_t sub_23DE80DF0(uint64_t a1, uint64_t a2, _BYTE *a3)
{
  uint64_t v3;

  return sub_23DE7DA1C(a1, a2, a3, *(_QWORD *)(v3 + 16), *(void **)(v3 + 24), *(void **)(v3 + 32), *(_QWORD *)(v3 + 40), *(unint64_t **)(v3 + 48), *(_QWORD *)(v3 + 56));
}

uint64_t MenstrualCyclesWidgetCircularView.body.getter@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;

  *a1 = sub_23DE879A8();
  a1[1] = v2;
  sub_23DE814DC();
  return sub_23DE80E60((char *)a1 + *(int *)(v3 + 44));
}

uint64_t sub_23DE80E60@<X0>(char *a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
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
  id v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  unint64_t v36;
  uint64_t v37;
  char v38;
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
  char v53;
  char v54;
  uint64_t v55;
  char *v56;
  uint64_t v57;
  char *v58;
  uint64_t v59;
  void (*v60)(char *, char *, uint64_t);
  char *v61;
  uint64_t v62;
  char *v63;
  uint64_t v64;
  void (*v65)(char *, uint64_t);
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
  char *v78;
  char *v79;
  uint64_t v80;
  char *v81;
  uint64_t v82;
  uint64_t v83;
  char *v84;
  uint64_t v85;
  uint64_t v86;
  char *v87;
  uint64_t v88;
  unint64_t v89;
  __int16 v90;

  v87 = a1;
  v1 = sub_23DE8775C();
  v85 = *(_QWORD *)(v1 - 8);
  v86 = v1;
  MEMORY[0x24BDAC7A8](v1);
  v84 = (char *)&v67 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v72 = sub_23DE87954();
  v70 = *(_QWORD *)(v72 - 8);
  MEMORY[0x24BDAC7A8](v72);
  v4 = (char *)&v67 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v69 = sub_23DE879FC();
  v68 = *(_QWORD *)(v69 - 8);
  MEMORY[0x24BDAC7A8](v69);
  v6 = (char *)&v67 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_23DE87A14();
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7);
  v10 = (char *)&v67 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23DE81724(0);
  v73 = v11;
  v71 = *(_QWORD *)(v11 - 8);
  MEMORY[0x24BDAC7A8](v11);
  v13 = (char *)&v67 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23DE81684(0);
  v75 = v14;
  v74 = *(_QWORD *)(v14 - 8);
  MEMORY[0x24BDAC7A8](v14);
  v16 = (char *)&v67 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23DE81628();
  v76 = v17;
  MEMORY[0x24BDAC7A8](v17);
  v19 = (char *)&v67 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23DE815C4();
  v77 = v20;
  v21 = MEMORY[0x24BDAC7A8](v20);
  v78 = (char *)&v67 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  v23 = MEMORY[0x24BDAC7A8](v21);
  v25 = (char *)&v67 - v24;
  MEMORY[0x24BDAC7A8](v23);
  v82 = (uint64_t)&v67 - v26;
  v83 = sub_23DE879E4();
  v80 = *(_QWORD *)(v83 - 8);
  v27 = MEMORY[0x24BDAC7A8](v83);
  v81 = (char *)&v67 - ((v28 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v27);
  v79 = (char *)&v67 - v29;
  sub_23DE879D8();
  sub_23DE84340((uint64_t)v10);
  type metadata accessor for MenstrualCyclesWidgetCircularView();
  sub_23DE84370((uint64_t)v6);
  (*(void (**)(char *, uint64_t))(v68 + 8))(v6, v69);
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  if (qword_25432B9E0 != -1)
    swift_once();
  v30 = (id)qword_25432BDC0;
  sub_23DE8796C();
  v31 = v70;
  v32 = v72;
  (*(void (**)(char *, _QWORD, uint64_t))(v70 + 104))(v4, *MEMORY[0x24BDF3FD0], v72);
  v33 = sub_23DE87960();
  swift_release();
  (*(void (**)(char *, uint64_t))(v31 + 8))(v4, v32);
  v88 = v33;
  v89 = 0;
  v90 = 1;
  sub_23DE81798();
  v35 = v34;
  v36 = sub_23DE757D8();
  sub_23DE878DC();
  swift_release();
  v88 = v35;
  v89 = v36;
  swift_getOpaqueTypeConformance2();
  v37 = v73;
  sub_23DE878A0();
  (*(void (**)(char *, uint64_t))(v71 + 8))(v13, v37);
  v38 = sub_23DE877F8();
  sub_23DE875C4();
  v40 = v39;
  v42 = v41;
  v44 = v43;
  v46 = v45;
  v47 = v74;
  v48 = v75;
  (*(void (**)(char *, char *, uint64_t))(v74 + 16))(v19, v16, v75);
  v49 = &v19[*(int *)(v76 + 36)];
  *v49 = v38;
  *((_QWORD *)v49 + 1) = v40;
  *((_QWORD *)v49 + 2) = v42;
  *((_QWORD *)v49 + 3) = v44;
  *((_QWORD *)v49 + 4) = v46;
  v49[40] = 0;
  (*(void (**)(char *, uint64_t))(v47 + 8))(v16, v48);
  sub_23DE87744();
  v50 = sub_23DE87888();
  v52 = v51;
  v54 = v53 & 1;
  sub_23DE823D0();
  v55 = (uint64_t)v78;
  sub_23DE878F4();
  sub_23DE7B128(v50, v52, v54);
  swift_bridgeObjectRelease();
  sub_23DE6EFC4((uint64_t)v19, (uint64_t (*)(_QWORD))sub_23DE81628);
  v56 = v84;
  sub_23DE87750();
  sub_23DE87618();
  (*(void (**)(char *, uint64_t))(v85 + 8))(v56, v86);
  sub_23DE6EFC4(v55, (uint64_t (*)(_QWORD))sub_23DE815C4);
  v57 = v82;
  sub_23DE82488((uint64_t)v25, v82);
  v59 = v80;
  v58 = v81;
  v60 = *(void (**)(char *, char *, uint64_t))(v80 + 16);
  v61 = v79;
  v62 = v83;
  v60(v81, v79, v83);
  sub_23DE824CC(v57, (uint64_t)v25);
  v63 = v87;
  v60(v87, v58, v62);
  sub_23DE81558();
  sub_23DE824CC((uint64_t)v25, (uint64_t)&v63[*(int *)(v64 + 48)]);
  sub_23DE6EFC4(v57, (uint64_t (*)(_QWORD))sub_23DE815C4);
  v65 = *(void (**)(char *, uint64_t))(v59 + 8);
  v65(v61, v62);
  sub_23DE6EFC4((uint64_t)v25, (uint64_t (*)(_QWORD))sub_23DE815C4);
  return ((uint64_t (*)(char *, uint64_t))v65)(v58, v62);
}

void sub_23DE814DC()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_256D0D670)
  {
    sub_23DE7349C(255, &qword_256D0D678, (uint64_t (*)(uint64_t))sub_23DE81558, MEMORY[0x24BDF53F0]);
    v0 = sub_23DE87600();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_256D0D670);
  }
}

void sub_23DE81558()
{
  unint64_t TupleTypeMetadata2;
  uint64_t v1;

  if (!qword_256D0D680)
  {
    sub_23DE879E4();
    sub_23DE815C4();
    TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
    if (!v1)
      atomic_store(TupleTypeMetadata2, (unint64_t *)&qword_256D0D680);
  }
}

void sub_23DE815C4()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_256D0D688)
  {
    sub_23DE81628();
    sub_23DE877E0();
    v0 = sub_23DE87624();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_256D0D688);
  }
}

void sub_23DE81628()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_256D0D690)
  {
    sub_23DE81684(255);
    v0 = sub_23DE87624();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_256D0D690);
  }
}

void sub_23DE81684(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  _QWORD v6[2];

  if (!qword_256D0D698)
  {
    sub_23DE81724(255);
    v3 = v2;
    sub_23DE81798();
    sub_23DE757D8();
    v6[0] = v3;
    v6[1] = swift_getOpaqueTypeConformance2();
    v4 = MEMORY[0x2426473B4](a1, v6, MEMORY[0x24BDFAC10], 0);
    if (!v5)
      atomic_store(v4, (unint64_t *)&qword_256D0D698);
  }
}

void sub_23DE81724(uint64_t a1)
{
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;
  _QWORD v5[2];

  if (!qword_256D0D6A0)
  {
    sub_23DE81798();
    v5[0] = v2;
    v5[1] = sub_23DE757D8();
    v3 = MEMORY[0x2426473B4](a1, v5, MEMORY[0x24BDF2268], 0);
    if (!v4)
      atomic_store(v3, (unint64_t *)&qword_256D0D6A0);
  }
}

void sub_23DE81798()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_256D0D488)
  {
    v0 = sub_23DE87624();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_256D0D488);
  }
}

uint64_t sub_23DE817F4()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_23DE81804@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;

  *a1 = sub_23DE879A8();
  a1[1] = v2;
  sub_23DE814DC();
  return sub_23DE80E60((char *)a1 + *(int *)(v3 + 44));
}

uint64_t *initializeBufferWithCopyOfBuffer for MenstrualCyclesWidgetCircularView(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  _QWORD *v11;
  uint64_t v12;

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
    sub_23DE7349C(0, &qword_25432B9C0, (uint64_t (*)(uint64_t))MEMORY[0x24BDFAF10], MEMORY[0x24BDEB560]);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v7 = sub_23DE87A14();
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a1, a2, v7);
    }
    else
    {
      *a1 = *a2;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
    v9 = *(int *)(a3 + 20);
    v10 = (uint64_t *)((char *)a1 + v9);
    v11 = (uint64_t *)((char *)a2 + v9);
    sub_23DE7349C(0, &qword_256D0D508, (uint64_t (*)(uint64_t))MEMORY[0x24BDFADE0], MEMORY[0x24BDEB560]);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v12 = sub_23DE879FC();
      (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v12 - 8) + 16))(v10, v11, v12);
    }
    else
    {
      *v10 = *v11;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

uint64_t destroy for MenstrualCyclesWidgetCircularView(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  sub_23DE7349C(0, &qword_25432B9C0, (uint64_t (*)(uint64_t))MEMORY[0x24BDFAF10], MEMORY[0x24BDEB560]);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v4 = sub_23DE87A14();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(a1, v4);
  }
  else
  {
    swift_release();
  }
  v5 = a1 + *(int *)(a2 + 20);
  sub_23DE7349C(0, &qword_256D0D508, (uint64_t (*)(uint64_t))MEMORY[0x24BDFADE0], MEMORY[0x24BDEB560]);
  if (swift_getEnumCaseMultiPayload() != 1)
    return swift_release();
  v6 = sub_23DE879FC();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 8))(v5, v6);
}

_QWORD *initializeWithCopy for MenstrualCyclesWidgetCircularView(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  _QWORD *v9;
  uint64_t v10;

  sub_23DE7349C(0, &qword_25432B9C0, (uint64_t (*)(uint64_t))MEMORY[0x24BDFAF10], MEMORY[0x24BDEB560]);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v6 = sub_23DE87A14();
    (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(a1, a2, v6);
  }
  else
  {
    *a1 = *a2;
    swift_retain();
  }
  swift_storeEnumTagMultiPayload();
  v7 = *(int *)(a3 + 20);
  v8 = (_QWORD *)((char *)a1 + v7);
  v9 = (_QWORD *)((char *)a2 + v7);
  sub_23DE7349C(0, &qword_256D0D508, (uint64_t (*)(uint64_t))MEMORY[0x24BDFADE0], MEMORY[0x24BDEB560]);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v10 = sub_23DE879FC();
    (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v10 - 8) + 16))(v8, v9, v10);
  }
  else
  {
    *v8 = *v9;
    swift_retain();
  }
  swift_storeEnumTagMultiPayload();
  return a1;
}

_QWORD *assignWithCopy for MenstrualCyclesWidgetCircularView(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t (*v6)(uint64_t);
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  _QWORD *v10;
  uint64_t (*v11)(uint64_t);
  uint64_t v12;

  if (a1 != a2)
  {
    v6 = (uint64_t (*)(uint64_t))MEMORY[0x24BDFAF10];
    sub_23DE81D58((uint64_t)a1, &qword_25432B9C0, (uint64_t (*)(uint64_t))MEMORY[0x24BDFAF10]);
    sub_23DE7349C(0, &qword_25432B9C0, v6, MEMORY[0x24BDEB560]);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v7 = sub_23DE87A14();
      (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a1, a2, v7);
    }
    else
    {
      *a1 = *a2;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
    v8 = *(int *)(a3 + 20);
    v9 = (_QWORD *)((char *)a1 + v8);
    v10 = (_QWORD *)((char *)a2 + v8);
    v11 = (uint64_t (*)(uint64_t))MEMORY[0x24BDFADE0];
    sub_23DE81D58((uint64_t)a1 + v8, &qword_256D0D508, (uint64_t (*)(uint64_t))MEMORY[0x24BDFADE0]);
    sub_23DE7349C(0, &qword_256D0D508, v11, MEMORY[0x24BDEB560]);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v12 = sub_23DE879FC();
      (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v12 - 8) + 16))(v9, v10, v12);
    }
    else
    {
      *v9 = *v10;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

uint64_t sub_23DE81D58(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t))
{
  uint64_t v4;

  sub_23DE7349C(0, a2, a3, MEMORY[0x24BDEB560]);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(a1, v4);
  return a1;
}

char *initializeWithTake for MenstrualCyclesWidgetCircularView(char *a1, char *a2, uint64_t a3)
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

  sub_23DE7349C(0, &qword_25432B9C0, (uint64_t (*)(uint64_t))MEMORY[0x24BDFAF10], MEMORY[0x24BDEB560]);
  v7 = v6;
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v8 = sub_23DE87A14();
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v8 - 8) + 32))(a1, a2, v8);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v7 - 8) + 64));
  }
  v9 = *(int *)(a3 + 20);
  v10 = &a1[v9];
  v11 = &a2[v9];
  sub_23DE7349C(0, &qword_256D0D508, (uint64_t (*)(uint64_t))MEMORY[0x24BDFADE0], MEMORY[0x24BDEB560]);
  v13 = v12;
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v14 = sub_23DE879FC();
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v14 - 8) + 32))(v10, v11, v14);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(v10, v11, *(_QWORD *)(*(_QWORD *)(v13 - 8) + 64));
  }
  return a1;
}

char *assignWithTake for MenstrualCyclesWidgetCircularView(char *a1, char *a2, uint64_t a3)
{
  uint64_t (*v6)(uint64_t);
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  char *v12;
  uint64_t (*v13)(uint64_t);
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  if (a1 != a2)
  {
    v6 = (uint64_t (*)(uint64_t))MEMORY[0x24BDFAF10];
    sub_23DE81D58((uint64_t)a1, &qword_25432B9C0, (uint64_t (*)(uint64_t))MEMORY[0x24BDFAF10]);
    sub_23DE7349C(0, &qword_25432B9C0, v6, MEMORY[0x24BDEB560]);
    v8 = v7;
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v9 = sub_23DE87A14();
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v9 - 8) + 32))(a1, a2, v9);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v8 - 8) + 64));
    }
    v10 = *(int *)(a3 + 20);
    v11 = &a1[v10];
    v12 = &a2[v10];
    v13 = (uint64_t (*)(uint64_t))MEMORY[0x24BDFADE0];
    sub_23DE81D58((uint64_t)&a1[v10], &qword_256D0D508, (uint64_t (*)(uint64_t))MEMORY[0x24BDFADE0]);
    sub_23DE7349C(0, &qword_256D0D508, v13, MEMORY[0x24BDEB560]);
    v15 = v14;
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v16 = sub_23DE879FC();
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v16 - 8) + 32))(v11, v12, v16);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(v11, v12, *(_QWORD *)(*(_QWORD *)(v15 - 8) + 64));
    }
  }
  return a1;
}

uint64_t getEnumTagSinglePayload for MenstrualCyclesWidgetCircularView()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_23DE82060(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t, uint64_t);
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  sub_23DE7349C(0, &qword_256D0D520, (uint64_t (*)(uint64_t))MEMORY[0x24BDFAF10], MEMORY[0x24BDEB580]);
  v7 = *(_QWORD *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == (_DWORD)a2)
  {
    v8 = v6;
    v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    v10 = a1;
  }
  else
  {
    sub_23DE7349C(0, &qword_256D0D528, (uint64_t (*)(uint64_t))MEMORY[0x24BDFADE0], MEMORY[0x24BDEB580]);
    v8 = v11;
    v12 = *(_QWORD *)(v11 - 8);
    v10 = a1 + *(int *)(a3 + 20);
    v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v12 + 48);
  }
  return v9(v10, a2, v8);
}

uint64_t storeEnumTagSinglePayload for MenstrualCyclesWidgetCircularView()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_23DE82110(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  sub_23DE7349C(0, &qword_256D0D520, (uint64_t (*)(uint64_t))MEMORY[0x24BDFAF10], MEMORY[0x24BDEB580]);
  v9 = *(_QWORD *)(v8 - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    v10 = v8;
    v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    v12 = a1;
  }
  else
  {
    sub_23DE7349C(0, &qword_256D0D528, (uint64_t (*)(uint64_t))MEMORY[0x24BDFADE0], MEMORY[0x24BDEB580]);
    v10 = v13;
    v14 = *(_QWORD *)(v13 - 8);
    v12 = a1 + *(int *)(a4 + 20);
    v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v14 + 56);
  }
  return v11(v12, a2, a2, v10);
}

uint64_t type metadata accessor for MenstrualCyclesWidgetCircularView()
{
  uint64_t result;

  result = qword_256D0D700;
  if (!qword_256D0D700)
    return swift_getSingletonMetadata();
  return result;
}

void sub_23DE821F8()
{
  unint64_t v0;
  unint64_t v1;

  sub_23DE7349C(319, &qword_25432B9C0, (uint64_t (*)(uint64_t))MEMORY[0x24BDFAF10], MEMORY[0x24BDEB560]);
  if (v0 <= 0x3F)
  {
    sub_23DE7349C(319, &qword_256D0D508, (uint64_t (*)(uint64_t))MEMORY[0x24BDFADE0], MEMORY[0x24BDEB560]);
    if (v1 <= 0x3F)
      swift_initStructMetadata();
  }
}

unint64_t sub_23DE822B0()
{
  unint64_t result;
  uint64_t v1;

  result = qword_256D0D738;
  if (!qword_256D0D738)
  {
    sub_23DE822F8();
    result = MEMORY[0x2426473FC](MEMORY[0x24BDF4750], v1);
    atomic_store(result, (unint64_t *)&qword_256D0D738);
  }
  return result;
}

void sub_23DE822F8()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_256D0D740)
  {
    sub_23DE7349C(255, &qword_256D0D678, (uint64_t (*)(uint64_t))sub_23DE81558, MEMORY[0x24BDF53F0]);
    sub_23DE82370();
    v0 = sub_23DE87984();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_256D0D740);
  }
}

unint64_t sub_23DE82370()
{
  unint64_t result;
  uint64_t v1;

  result = qword_256D0D748;
  if (!qword_256D0D748)
  {
    sub_23DE7349C(255, &qword_256D0D678, (uint64_t (*)(uint64_t))sub_23DE81558, MEMORY[0x24BDF53F0]);
    result = MEMORY[0x2426473FC](MEMORY[0x24BDF5428], v1);
    atomic_store(result, (unint64_t *)&qword_256D0D748);
  }
  return result;
}

unint64_t sub_23DE823D0()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD v5[4];

  result = qword_256D0D750;
  if (!qword_256D0D750)
  {
    sub_23DE81628();
    v2 = v1;
    sub_23DE81724(255);
    v4 = v3;
    sub_23DE81798();
    sub_23DE757D8();
    v5[2] = v4;
    v5[3] = swift_getOpaqueTypeConformance2();
    v5[0] = swift_getOpaqueTypeConformance2();
    v5[1] = MEMORY[0x24BDECC60];
    result = MEMORY[0x2426473FC](MEMORY[0x24BDED308], v2, v5);
    atomic_store(result, (unint64_t *)&qword_256D0D750);
  }
  return result;
}

uint64_t sub_23DE82488(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  sub_23DE815C4();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_23DE824CC(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  sub_23DE815C4();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

ValueMetadata *type metadata accessor for MenstrualCyclesWidgetConfiguration()
{
  return &type metadata for MenstrualCyclesWidgetConfiguration;
}

uint64_t sub_23DE82520()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_23DE82530@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  void (*v23)(char *, uint64_t, uint64_t);
  void (*v24)(char *, uint64_t);
  char *v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  unint64_t v29;
  uint64_t v30;
  char *v31;
  uint64_t v32;
  id v33;
  uint64_t v34;
  uint64_t OpaqueTypeConformance2;
  uint64_t v36;
  char *v37;
  uint64_t v38;
  _QWORD v40[2];
  uint64_t v41;
  char *v42;
  uint64_t v43;
  uint64_t v44;
  char *v45;
  uint64_t v46;
  char *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  char *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  unint64_t v56;
  uint64_t v57;
  uint64_t v58;

  v52 = a1;
  v1 = sub_23DE87498();
  MEMORY[0x24BDAC7A8](v1);
  v51 = (char *)v40 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v3 = sub_23DE87AD4();
  MEMORY[0x24BDAC7A8](v3);
  v42 = (char *)v40 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = sub_23DE874A4();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)v40 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v41 = type metadata accessor for MenstrualCyclesWidgetTimelineProvider();
  MEMORY[0x24BDAC7A8](v41);
  v10 = (_QWORD *)((char *)v40 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0));
  sub_23DE82B50();
  v43 = *(_QWORD *)(v11 - 8);
  v44 = v11;
  MEMORY[0x24BDAC7A8](v11);
  v13 = (char *)v40 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23DE82BC8(0);
  v48 = v14;
  v46 = *(_QWORD *)(v14 - 8);
  MEMORY[0x24BDAC7A8](v14);
  v45 = (char *)v40 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23DE82C70(0);
  v49 = *(_QWORD *)(v16 - 8);
  v50 = v16;
  MEMORY[0x24BDAC7A8](v16);
  v47 = (char *)v40 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18 = sub_23DE87AF8();
  v40[0] = v19;
  v40[1] = v18;
  v20 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDD3C40]), sel_init);
  type metadata accessor for MenstrualCyclesWidgetTimelineGenerator();
  v21 = swift_allocObject();
  sub_23DE8751C();
  v22 = *MEMORY[0x24BDCEF70];
  v23 = *(void (**)(char *, uint64_t, uint64_t))(v6 + 104);
  v23(v8, v22, v5);
  sub_23DE874B0();
  v24 = *(void (**)(char *, uint64_t))(v6 + 8);
  v24(v8, v5);
  *(_QWORD *)(v21 + 16) = v20;
  *v10 = v21;
  v23(v8, v22, v5);
  v25 = v13;
  sub_23DE874B0();
  v24(v8, v5);
  type metadata accessor for MenstrualCyclesWidgetEntryView();
  sub_23DE7AFC8(&qword_25432B9A8, (uint64_t (*)(uint64_t))type metadata accessor for MenstrualCyclesWidgetEntryView, (uint64_t)&protocol conformance descriptor for MenstrualCyclesWidgetEntryView);
  sub_23DE7AFC8(&qword_25432B990, (uint64_t (*)(uint64_t))type metadata accessor for MenstrualCyclesWidgetTimelineProvider, (uint64_t)&protocol conformance descriptor for MenstrualCyclesWidgetTimelineProvider);
  sub_23DE87A2C();
  sub_23DE87AE0();
  if (qword_25432BB68 != -1)
    swift_once();
  v26 = (id)qword_25432BDF0;
  sub_23DE8748C();
  v53 = sub_23DE87B04();
  v54 = v27;
  v28 = sub_23DE7AFC8(&qword_25432B9C8, (uint64_t (*)(uint64_t))sub_23DE82B50, MEMORY[0x24BDFB170]);
  v29 = sub_23DE7B0E4();
  v30 = MEMORY[0x24BEE0D00];
  v32 = v44;
  v31 = v45;
  sub_23DE8778C();
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v43 + 8))(v25, v32);
  sub_23DE87AE0();
  v33 = (id)qword_25432BDF0;
  sub_23DE8748C();
  v57 = sub_23DE87B04();
  v58 = v34;
  v53 = v32;
  v54 = v30;
  v55 = v28;
  v56 = v29;
  OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
  v37 = v47;
  v36 = v48;
  sub_23DE87774();
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v46 + 8))(v31, v36);
  sub_23DE83094();
  v53 = v36;
  v54 = v30;
  v55 = OpaqueTypeConformance2;
  v56 = v29;
  swift_getOpaqueTypeConformance2();
  v38 = v50;
  sub_23DE87780();
  swift_bridgeObjectRelease();
  return (*(uint64_t (**)(char *, uint64_t))(v49 + 8))(v37, v38);
}

uint64_t sub_23DE82A84@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v9;

  v4 = type metadata accessor for MenstrualCyclesWidgetEntry(0);
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)&v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23DE83228(a1, (uint64_t)v6);
  *a2 = swift_getKeyPath();
  sub_23DE7349C(0, &qword_25432B9C0, (uint64_t (*)(uint64_t))MEMORY[0x24BDFAF10], MEMORY[0x24BDEB560]);
  swift_storeEnumTagMultiPayload();
  v7 = type metadata accessor for MenstrualCyclesWidgetEntryView();
  return sub_23DE83270((uint64_t)v6, (uint64_t)a2 + *(int *)(v7 + 20));
}

void sub_23DE82B50()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_25432B9D0)
  {
    type metadata accessor for MenstrualCyclesWidgetEntryView();
    sub_23DE7AFC8(&qword_25432B9A8, (uint64_t (*)(uint64_t))type metadata accessor for MenstrualCyclesWidgetEntryView, (uint64_t)&protocol conformance descriptor for MenstrualCyclesWidgetEntryView);
    v0 = sub_23DE87A38();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_25432B9D0);
  }
}

void sub_23DE82BC8(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t v7;
  _QWORD v8[4];

  if (!qword_25432BB48)
  {
    sub_23DE82B50();
    v3 = v2;
    v4 = sub_23DE7AFC8(&qword_25432B9C8, (uint64_t (*)(uint64_t))sub_23DE82B50, MEMORY[0x24BDFB170]);
    v5 = sub_23DE7B0E4();
    v8[0] = v3;
    v8[1] = MEMORY[0x24BEE0D00];
    v8[2] = v4;
    v8[3] = v5;
    v6 = MEMORY[0x2426473B4](a1, v8, MEMORY[0x24BDFABC8], 0);
    if (!v7)
      atomic_store(v6, (unint64_t *)&qword_25432BB48);
  }
}

void sub_23DE82C70(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  unint64_t v5;
  uint64_t v6;
  _QWORD v7[4];

  if (!qword_25432BB40)
  {
    sub_23DE82BC8(255);
    v3 = v2;
    sub_23DE82B50();
    sub_23DE7AFC8(&qword_25432B9C8, (uint64_t (*)(uint64_t))sub_23DE82B50, MEMORY[0x24BDFB170]);
    v4 = sub_23DE7B0E4();
    v7[0] = v3;
    v7[1] = MEMORY[0x24BEE0D00];
    v7[2] = swift_getOpaqueTypeConformance2();
    v7[3] = v4;
    v5 = MEMORY[0x2426473B4](a1, v7, MEMORY[0x24BDFAB98], 0);
    if (!v6)
      atomic_store(v5, (unint64_t *)&qword_25432BB40);
  }
}

uint64_t sub_23DE82D4C(char a1, int64_t a2, char a3, unint64_t a4)
{
  return sub_23DE82D60(a1, a2, a3, a4, &qword_256D0D278, type metadata accessor for MenstrualCyclesWidgetEntry);
}

uint64_t sub_23DE82D60(char a1, int64_t a2, char a3, unint64_t a4, unint64_t *a5, uint64_t (*a6)(uint64_t))
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
  sub_23DE7349C(0, a5, a6, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE3598]);
  v13 = *(_QWORD *)(a6(0) - 8);
  v14 = *(_QWORD *)(v13 + 72);
  v15 = (*(unsigned __int8 *)(v13 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v13 + 80);
  v16 = (_QWORD *)swift_allocObject();
  v17 = _swift_stdlib_malloc_size(v16);
  if (!v14 || (v17 - v15 == 0x8000000000000000 ? (v18 = v14 == -1) : (v18 = 0), v18))
  {
LABEL_29:
    result = sub_23DE87C3C();
    __break(1u);
    return result;
  }
  v16[2] = v11;
  v16[3] = 2 * ((uint64_t)(v17 - v15) / v14);
LABEL_19:
  v19 = *(_QWORD *)(a6(0) - 8);
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
    sub_23DE82F7C(0, v11, v21, a4, a6);
  }
  swift_bridgeObjectRelease();
  return (uint64_t)v16;
}

uint64_t sub_23DE82F7C(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4, uint64_t (*a5)(_QWORD))
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
    v9 = *(_QWORD *)(a5(0) - 8);
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
  result = sub_23DE87C60();
  __break(1u);
  return result;
}

void sub_23DE83094()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  id v4;
  void *v5;
  id v6;
  unsigned int v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t v11;

  v0 = sub_23DE87A14();
  v1 = *(_QWORD *)(v0 - 8);
  MEMORY[0x24BDAC7A8](v0);
  v3 = (char *)&v11 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = objc_msgSend((id)objc_opt_self(), sel_sharedBehavior);
  if (!v4)
  {
    __break(1u);
    goto LABEL_9;
  }
  v5 = v4;
  v6 = objc_msgSend(v4, sel_features);

  if (!v6)
  {
LABEL_9:
    __break(1u);
    return;
  }
  v7 = objc_msgSend(v6, sel_seahorse);

  if (v7)
  {
    (*(void (**)(char *, _QWORD, uint64_t))(v1 + 104))(v3, *MEMORY[0x24BDFAED8], v0);
    v8 = sub_23DE82D60(0, 1, 1, MEMORY[0x24BEE4AF8], qword_25432BA08, (uint64_t (*)(uint64_t))MEMORY[0x24BDFAF10]);
    v10 = *(_QWORD *)(v8 + 16);
    v9 = *(_QWORD *)(v8 + 24);
    if (v10 >= v9 >> 1)
      v8 = sub_23DE82D60(v9 > 1, v10 + 1, 1, v8, qword_25432BA08, (uint64_t (*)(uint64_t))MEMORY[0x24BDFAF10]);
    *(_QWORD *)(v8 + 16) = v10 + 1;
    (*(void (**)(unint64_t, char *, uint64_t))(v1 + 32))(v8+ ((*(unsigned __int8 *)(v1 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80))+ *(_QWORD *)(v1 + 72) * v10, v3, v0);
  }
}

uint64_t sub_23DE83228(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for MenstrualCyclesWidgetEntry(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_23DE83270(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for MenstrualCyclesWidgetEntry(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_23DE832B4()
{
  sub_23DE82C70(255);
  sub_23DE82BC8(255);
  sub_23DE82B50();
  sub_23DE7AFC8(&qword_25432B9C8, (uint64_t (*)(uint64_t))sub_23DE82B50, MEMORY[0x24BDFB170]);
  sub_23DE7B0E4();
  swift_getOpaqueTypeConformance2();
  swift_getOpaqueTypeConformance2();
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_23DE83388@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X8>)
{
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
  unint64_t v19;
  uint64_t v20;
  void (*v21)(unint64_t, _QWORD, uint64_t);
  void (*v22)(char *, uint64_t);
  uint64_t v23;
  char v24;
  uint64_t v25;
  uint64_t v26;
  char v27;
  char v28;
  uint64_t v29;
  char v30;
  uint64_t v31;
  uint64_t v32;
  char v33;
  uint64_t v34;
  uint64_t v35;
  char v36;
  uint64_t v37;
  uint64_t v38;
  char v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t result;
  void (*v44)(char *, uint64_t);
  uint64_t v45;
  uint64_t v46;
  char *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;

  v53 = a2;
  v49 = a6;
  v50 = a5;
  v51 = a4;
  v52 = a3;
  v55 = a1;
  v48 = a7;
  sub_23DE7349C(0, &qword_25432B9F0, (uint64_t (*)(uint64_t))MEMORY[0x24BDCE900], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1C68]);
  MEMORY[0x24BDAC7A8](v7);
  v47 = (char *)&v44 - v8;
  v9 = sub_23DE87534();
  v10 = *(_QWORD *)(v9 - 8);
  MEMORY[0x24BDAC7A8](v9);
  v12 = (char *)&v44 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = sub_23DE873FC();
  v45 = *(_QWORD *)(v13 - 8);
  v46 = v13;
  MEMORY[0x24BDAC7A8](v13);
  v15 = (char *)&v44 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23DE8751C();
  sub_23DE7349C(0, &qword_256D0D758, (uint64_t (*)(uint64_t))MEMORY[0x24BDCF290], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE3598]);
  v16 = sub_23DE87528();
  v17 = *(_QWORD *)(v16 - 8);
  v18 = *(_QWORD *)(v17 + 72);
  v19 = (*(unsigned __int8 *)(v17 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v17 + 80);
  v20 = swift_allocObject();
  *(_OWORD *)(v20 + 16) = xmmword_23DE88800;
  v21 = *(void (**)(unint64_t, _QWORD, uint64_t))(v17 + 104);
  v21(v20 + v19, *MEMORY[0x24BDCF228], v16);
  v21(v20 + v19 + v18, *MEMORY[0x24BDCF240], v16);
  v21(v20 + v19 + 2 * v18, *MEMORY[0x24BDCF250], v16);
  v21(v20 + v19 + 3 * v18, *MEMORY[0x24BDCF220], v16);
  v21(v20 + v19 + 4 * v18, *MEMORY[0x24BDCF230], v16);
  v21(v20 + v19 + 5 * v18, *MEMORY[0x24BDCF258], v16);
  v21(v20 + v19 + 6 * v18, *MEMORY[0x24BDCF260], v16);
  sub_23DE86F98(v20);
  swift_setDeallocating();
  swift_arrayDestroy();
  swift_deallocClassInstance();
  sub_23DE874D4();
  swift_bridgeObjectRelease();
  v22 = *(void (**)(char *, uint64_t))(v10 + 8);
  v54 = v9;
  v44 = v22;
  v22(v12, v9);
  v23 = sub_23DE87390();
  if ((v24 & 1) != 0)
    v25 = 0;
  else
    v25 = v23;
  v26 = sub_23DE873A8();
  v28 = v27;
  v29 = sub_23DE87360();
  if ((v30 & 1) != 0)
    v31 = 0;
  else
    v31 = v29;
  v32 = sub_23DE87378();
  if ((v33 & 1) != 0)
    v34 = 0;
  else
    v34 = v32;
  v35 = sub_23DE873C0();
  if ((v36 & 1) != 0)
    v37 = 0;
  else
    v37 = v35;
  v38 = sub_23DE873D8();
  if ((v39 & 1) != 0)
    v40 = 0;
  else
    v40 = v38;
  if (__OFADD__(v25, v55))
  {
    __break(1u);
LABEL_27:
    __break(1u);
    goto LABEL_28;
  }
  if ((v28 & 1) != 0)
    v26 = 0;
  sub_23DE8739C();
  if (__OFADD__(v26, v53))
    goto LABEL_27;
  sub_23DE873B4();
  if (__OFADD__(v31, v52))
  {
LABEL_28:
    __break(1u);
    goto LABEL_29;
  }
  sub_23DE8736C();
  if (__OFADD__(v34, v51))
  {
LABEL_29:
    __break(1u);
    goto LABEL_30;
  }
  sub_23DE87384();
  if (__OFADD__(v37, v50))
  {
LABEL_30:
    __break(1u);
    goto LABEL_31;
  }
  sub_23DE873CC();
  if (__OFADD__(v40, v49))
  {
LABEL_31:
    __break(1u);
    goto LABEL_32;
  }
  sub_23DE873E4();
  sub_23DE8751C();
  v31 = (uint64_t)v47;
  sub_23DE87504();
  v44(v12, v54);
  v41 = sub_23DE8745C();
  v42 = *(_QWORD *)(v41 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v42 + 48))(v31, 1, v41) != 1)
  {
    (*(void (**)(char *, uint64_t))(v45 + 8))(v15, v46);
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v42 + 32))(v48, v31, v41);
  }
LABEL_32:
  sub_23DE83808(v31);
  result = sub_23DE87C48();
  __break(1u);
  return result;
}

uint64_t sub_23DE83808(uint64_t a1)
{
  uint64_t v2;

  sub_23DE7349C(0, &qword_25432B9F0, (uint64_t (*)(uint64_t))MEMORY[0x24BDCE900], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1C68]);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t MenstrualCyclesWidgetEntryView.init(entry:)@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v4;

  *a2 = swift_getKeyPath();
  sub_23DE7349C(0, &qword_25432B9C0, (uint64_t (*)(uint64_t))MEMORY[0x24BDFAF10], MEMORY[0x24BDEB560]);
  swift_storeEnumTagMultiPayload();
  v4 = type metadata accessor for MenstrualCyclesWidgetEntryView();
  return sub_23DE73D64(a1, (uint64_t)a2 + *(int *)(v4 + 20), type metadata accessor for MenstrualCyclesWidgetEntry);
}

void MenstrualCyclesWidgetEntryView.body.getter(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t (*v2)(uint64_t, uint64_t, uint64_t);
  uint64_t v3;
  uint64_t v4;
  uint64_t (*v5)(uint64_t, uint64_t);
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
  int *v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  char *v25;
  uint64_t v26;
  uint64_t v27;
  char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  char *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  char *v37;
  int v38;
  id v39;
  void *v40;
  id v41;
  unsigned int v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t KeyPath;
  uint64_t v46;
  uint64_t (*v47)(uint64_t, uint64_t);
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t (*v55)(uint64_t, uint64_t);
  char *v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t (*v59)(uint64_t, uint64_t);
  uint64_t *v60;
  uint64_t v61;
  uint64_t *v62;
  uint64_t *v63;
  uint64_t *v64;
  uint64_t *v65;
  uint64_t v66;
  char *v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;

  v76 = a1;
  v2 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))MEMORY[0x24BDEF380];
  sub_23DE86364(0, &qword_256D0D760, (uint64_t (*)(uint64_t))type metadata accessor for MenstrualCyclesWidgetRectangularView, MEMORY[0x24BDEF380]);
  v68 = v3;
  MEMORY[0x24BDAC7A8](v3);
  v69 = (uint64_t)&v61 - v4;
  v5 = (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BDEB580];
  sub_23DE7349C(0, &qword_256D0D538, (uint64_t (*)(uint64_t))MEMORY[0x24BDECF50], MEMORY[0x24BDEB580]);
  MEMORY[0x24BDAC7A8](v6);
  v65 = (uint64_t *)((char *)&v61 - v7);
  sub_23DE7349C(0, &qword_256D0D530, (uint64_t (*)(uint64_t))MEMORY[0x24BDEB418], v5);
  MEMORY[0x24BDAC7A8](v8);
  v64 = (uint64_t *)((char *)&v61 - v9);
  sub_23DE7349C(0, &qword_256D0D528, (uint64_t (*)(uint64_t))MEMORY[0x24BDFADE0], v5);
  MEMORY[0x24BDAC7A8](v10);
  v63 = (uint64_t *)((char *)&v61 - v11);
  sub_23DE7349C(0, &qword_256D0D520, (uint64_t (*)(uint64_t))MEMORY[0x24BDFAF10], v5);
  MEMORY[0x24BDAC7A8](v12);
  v62 = (uint64_t *)((char *)&v61 - v13);
  sub_23DE7349C(0, &qword_25432BB38, type metadata accessor for MenstrualCyclesWidgetEntry.State, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1C68]);
  MEMORY[0x24BDAC7A8](v14);
  v66 = (uint64_t)&v61 - v15;
  v16 = (int *)type metadata accessor for MenstrualCyclesWidgetRectangularView();
  MEMORY[0x24BDAC7A8](v16);
  v18 = (char *)&v61 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23DE84878(0);
  v72 = v19;
  MEMORY[0x24BDAC7A8](v19);
  v67 = (char *)&v61 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23DE86364(0, &qword_256D0D770, (uint64_t (*)(uint64_t))sub_23DE84894, v2);
  v74 = v21;
  MEMORY[0x24BDAC7A8](v21);
  v75 = (uint64_t)&v61 - v22;
  sub_23DE848A8(0, &qword_256D0D780, v2);
  v70 = v23;
  MEMORY[0x24BDAC7A8](v23);
  v25 = (char *)&v61 - v24;
  sub_23DE84894(0);
  v73 = v26;
  MEMORY[0x24BDAC7A8](v26);
  v28 = (char *)&v61 - ((v27 + 15) & 0xFFFFFFFFFFFFFFF0);
  v71 = type metadata accessor for MenstrualCyclesWidgetCircularView();
  v29 = MEMORY[0x24BDAC7A8](v71);
  v31 = (uint64_t *)((char *)&v61 - ((v30 + 15) & 0xFFFFFFFFFFFFFFF0));
  MEMORY[0x24BDAC7A8](v29);
  v33 = (char *)&v61 - v32;
  v34 = sub_23DE87A14();
  v35 = *(_QWORD *)(v34 - 8);
  MEMORY[0x24BDAC7A8](v34);
  v37 = (char *)&v61 - ((v36 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23DE84400(&qword_25432B9C0, (uint64_t (*)(uint64_t))MEMORY[0x24BDFAF10], 0x6146746567646957, 0xEC000000796C696DLL, (uint64_t)v37);
  v38 = (*(uint64_t (**)(char *, uint64_t))(v35 + 88))(v37, v34);
  if (v38 != *MEMORY[0x24BDFAED8])
  {
    if (MEMORY[0x24BDFAEE8] && v38 == *MEMORY[0x24BDFAEE8] || v38 == *MEMORY[0x24BDFAF00])
    {
      *v31 = swift_getKeyPath();
      v59 = (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BDEB560];
      sub_23DE7349C(0, &qword_25432B9C0, (uint64_t (*)(uint64_t))MEMORY[0x24BDFAF10], MEMORY[0x24BDEB560]);
      swift_storeEnumTagMultiPayload();
      v60 = (uint64_t *)((char *)v31 + *(int *)(v71 + 20));
      *v60 = swift_getKeyPath();
      sub_23DE7349C(0, &qword_256D0D508, (uint64_t (*)(uint64_t))MEMORY[0x24BDFADE0], v59);
      swift_storeEnumTagMultiPayload();
      sub_23DE73D64((uint64_t)v31, (uint64_t)v33, (uint64_t (*)(_QWORD))type metadata accessor for MenstrualCyclesWidgetCircularView);
      sub_23DE73DA8((uint64_t)v33, (uint64_t)v25, (uint64_t (*)(_QWORD))type metadata accessor for MenstrualCyclesWidgetCircularView);
      swift_storeEnumTagMultiPayload();
      sub_23DE7AFC8(&qword_256D0D790, (uint64_t (*)(uint64_t))type metadata accessor for MenstrualCyclesWidgetCircularView, (uint64_t)&protocol conformance descriptor for MenstrualCyclesWidgetCircularView);
      sub_23DE84990();
      sub_23DE877A4();
      sub_23DE73DA8((uint64_t)v28, v75, (uint64_t (*)(_QWORD))sub_23DE84894);
      swift_storeEnumTagMultiPayload();
      sub_23DE84910();
      sub_23DE877A4();
      sub_23DE6EFC4((uint64_t)v28, (uint64_t (*)(_QWORD))sub_23DE84894);
      sub_23DE6EFC4((uint64_t)v33, (uint64_t (*)(_QWORD))type metadata accessor for MenstrualCyclesWidgetCircularView);
      return;
    }
    if (v38 != *MEMORY[0x24BDFAF08])
    {
      swift_storeEnumTagMultiPayload();
      sub_23DE84910();
      sub_23DE877A4();
      (*(void (**)(char *, uint64_t))(v35 + 8))(v37, v34);
      return;
    }
  }
  v39 = objc_msgSend((id)objc_opt_self(), sel_sharedBehavior);
  if (!v39)
  {
    __break(1u);
    goto LABEL_16;
  }
  v40 = v39;
  v41 = objc_msgSend(v39, sel_features);

  if (!v41)
  {
LABEL_16:
    __break(1u);
    return;
  }
  v42 = objc_msgSend(v41, sel_seahorse);

  if (v42)
  {
    v43 = v1 + *(int *)(type metadata accessor for MenstrualCyclesWidgetEntryView() + 20);
    v44 = type metadata accessor for MenstrualCyclesWidgetEntry(0);
    sub_23DE84A10(v43 + *(int *)(v44 + 24), v66, &qword_25432BB38, type metadata accessor for MenstrualCyclesWidgetEntry.State, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1C68]);
    KeyPath = swift_getKeyPath();
    v46 = (uint64_t)v62;
    *v62 = KeyPath;
    v47 = (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BDEB560];
    sub_23DE7349C(0, &qword_25432B9C0, (uint64_t (*)(uint64_t))MEMORY[0x24BDFAF10], MEMORY[0x24BDEB560]);
    swift_storeEnumTagMultiPayload();
    v48 = swift_getKeyPath();
    v49 = (uint64_t)v63;
    *v63 = v48;
    sub_23DE7349C(0, &qword_256D0D508, (uint64_t (*)(uint64_t))MEMORY[0x24BDFADE0], v47);
    swift_storeEnumTagMultiPayload();
    v50 = swift_getKeyPath();
    v51 = (uint64_t)v64;
    *v64 = v50;
    sub_23DE7349C(0, &qword_256D0D510, (uint64_t (*)(uint64_t))MEMORY[0x24BDEB418], v47);
    swift_storeEnumTagMultiPayload();
    v52 = swift_getKeyPath();
    v53 = (uint64_t)v65;
    *v65 = v52;
    sub_23DE7349C(0, &qword_256D0D518, (uint64_t (*)(uint64_t))MEMORY[0x24BDECF50], v47);
    swift_storeEnumTagMultiPayload();
    v54 = swift_getKeyPath();
    v55 = (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BDEB580];
    sub_23DE84BD4(v46, (uint64_t)v18, &qword_256D0D520, (uint64_t (*)(uint64_t))MEMORY[0x24BDFAF10], MEMORY[0x24BDEB580]);
    sub_23DE84BD4(v49, (uint64_t)&v18[v16[5]], &qword_256D0D528, (uint64_t (*)(uint64_t))MEMORY[0x24BDFADE0], v55);
    sub_23DE84BD4(v51, (uint64_t)&v18[v16[6]], &qword_256D0D530, (uint64_t (*)(uint64_t))MEMORY[0x24BDEB418], v55);
    sub_23DE84BD4(v53, (uint64_t)&v18[v16[7]], &qword_256D0D538, (uint64_t (*)(uint64_t))MEMORY[0x24BDECF50], v55);
    v56 = &v18[v16[8]];
    *(_QWORD *)v56 = v54;
    v56[8] = 0;
    sub_23DE84BD4(v66, (uint64_t)&v18[v16[9]], &qword_25432BB38, type metadata accessor for MenstrualCyclesWidgetEntry.State, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1C68]);
    sub_23DE73DA8((uint64_t)v18, v69, (uint64_t (*)(_QWORD))type metadata accessor for MenstrualCyclesWidgetRectangularView);
    swift_storeEnumTagMultiPayload();
    sub_23DE7AFC8(&qword_256D0D7A0, (uint64_t (*)(uint64_t))type metadata accessor for MenstrualCyclesWidgetRectangularView, (uint64_t)&protocol conformance descriptor for MenstrualCyclesWidgetRectangularView);
    v57 = (uint64_t)v67;
    sub_23DE877A4();
    sub_23DE6EFC4((uint64_t)v18, (uint64_t (*)(_QWORD))type metadata accessor for MenstrualCyclesWidgetRectangularView);
  }
  else
  {
    swift_storeEnumTagMultiPayload();
    sub_23DE7AFC8(&qword_256D0D7A0, (uint64_t (*)(uint64_t))type metadata accessor for MenstrualCyclesWidgetRectangularView, (uint64_t)&protocol conformance descriptor for MenstrualCyclesWidgetRectangularView);
    v57 = (uint64_t)v67;
    sub_23DE877A4();
  }
  v58 = v75;
  sub_23DE73DA8(v57, (uint64_t)v25, (uint64_t (*)(_QWORD))sub_23DE84878);
  swift_storeEnumTagMultiPayload();
  sub_23DE7AFC8(&qword_256D0D790, (uint64_t (*)(uint64_t))type metadata accessor for MenstrualCyclesWidgetCircularView, (uint64_t)&protocol conformance descriptor for MenstrualCyclesWidgetCircularView);
  sub_23DE84990();
  sub_23DE877A4();
  sub_23DE73DA8((uint64_t)v28, v58, (uint64_t (*)(_QWORD))sub_23DE84894);
  swift_storeEnumTagMultiPayload();
  sub_23DE84910();
  sub_23DE877A4();
  sub_23DE6EFC4((uint64_t)v28, (uint64_t (*)(_QWORD))sub_23DE84894);
  sub_23DE6EFC4(v57, (uint64_t (*)(_QWORD))sub_23DE84878);
}

uint64_t sub_23DE84340@<X0>(uint64_t a1@<X8>)
{
  return sub_23DE84400(&qword_25432B9C0, (uint64_t (*)(uint64_t))MEMORY[0x24BDFAF10], 0x6146746567646957, 0xEC000000796C696DLL, a1);
}

uint64_t sub_23DE84370@<X0>(uint64_t a1@<X8>)
{
  return sub_23DE84400(&qword_256D0D508, (uint64_t (*)(uint64_t))MEMORY[0x24BDFADE0], 0xD000000000000013, 0x800000023DE89EB0, a1);
}

uint64_t sub_23DE8439C@<X0>(uint64_t a1@<X8>)
{
  return sub_23DE84400(&qword_256D0D510, (uint64_t (*)(uint64_t))MEMORY[0x24BDEB418], 0x686353726F6C6F43, 0xEB00000000656D65, a1);
}

uint64_t sub_23DE843CC@<X0>(uint64_t a1@<X8>)
{
  return sub_23DE84400(&qword_256D0D518, (uint64_t (*)(uint64_t))MEMORY[0x24BDECF50], 0x5463696D616E7944, 0xEF657A6953657079, a1);
}

uint64_t sub_23DE84400@<X0>(unint64_t *a1@<X0>, uint64_t (*a2)(uint64_t)@<X1>, uint64_t a3@<X2>, unint64_t a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t v5;
  uint64_t v8;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  os_log_type_t v20;
  NSObject *v21;
  os_log_type_t v22;
  uint8_t *v23;
  uint64_t v24;
  _QWORD v25[2];
  uint64_t v26;
  unint64_t v27;
  uint64_t v28;
  uint64_t v29;

  v26 = a3;
  v27 = a4;
  v8 = v5;
  v10 = sub_23DE8772C();
  v11 = *(_QWORD *)(v10 - 8);
  MEMORY[0x24BDAC7A8](v10);
  v13 = (char *)v25 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BDEB560];
  sub_23DE7349C(0, a1, a2, MEMORY[0x24BDEB560]);
  MEMORY[0x24BDAC7A8](v15);
  v17 = (char *)v25 - v16;
  sub_23DE84A10(v8, (uint64_t)v25 - v16, a1, a2, v14);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v18 = a2(0);
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(*(_QWORD *)(v18 - 8) + 32))(a5, v17, v18);
  }
  else
  {
    v20 = sub_23DE87B7C();
    v21 = sub_23DE877EC();
    v22 = v20;
    if (os_log_type_enabled(v21, v20))
    {
      v25[1] = a5;
      v23 = (uint8_t *)swift_slowAlloc();
      v24 = swift_slowAlloc();
      v29 = v24;
      *(_DWORD *)v23 = 136315138;
      v28 = sub_23DE7350C(v26, v27, &v29);
      sub_23DE87BD0();
      _os_log_impl(&dword_23DE6A000, v21, v22, "Accessing Environment<%s>'s value outside of being installed on a View. This will always read the default value and will not update.", v23, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x242647498](v24, -1, -1);
      MEMORY[0x242647498](v23, -1, -1);
    }

    sub_23DE87720();
    swift_getAtKeyPath();
    swift_release();
    return (*(uint64_t (**)(char *, uint64_t))(v11 + 8))(v13, v10);
  }
}

uint64_t sub_23DE84644(uint64_t a1, char a2)
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

  v4 = sub_23DE8772C();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if ((a2 & 1) != 0)
    return a1 & 1;
  swift_retain();
  v8 = sub_23DE87B7C();
  v9 = sub_23DE877EC();
  v10 = v8;
  if (os_log_type_enabled(v9, v8))
  {
    v11 = (uint8_t *)swift_slowAlloc();
    v12 = swift_slowAlloc();
    v15 = v12;
    *(_DWORD *)v11 = 136315138;
    v14 = sub_23DE7350C(1819242306, 0xE400000000000000, &v15);
    sub_23DE87BD0();
    _os_log_impl(&dword_23DE6A000, v9, v10, "Accessing Environment<%s>'s value outside of being installed on a View. This will always read the default value and will not update.", v11, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x242647498](v12, -1, -1);
    MEMORY[0x242647498](v11, -1, -1);
  }

  sub_23DE87720();
  swift_getAtKeyPath();
  sub_23DE7980C(a1, 0);
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  return v15;
}

uint64_t sub_23DE847FC()
{
  return sub_23DE876F0();
}

uint64_t sub_23DE8481C()
{
  return sub_23DE876F0();
}

uint64_t type metadata accessor for MenstrualCyclesWidgetEntryView()
{
  uint64_t result;

  result = qword_25432B9B0;
  if (!qword_25432B9B0)
    return swift_getSingletonMetadata();
  return result;
}

void sub_23DE84878(uint64_t a1)
{
  sub_23DE86364(a1, &qword_256D0D768, (uint64_t (*)(uint64_t))type metadata accessor for MenstrualCyclesWidgetRectangularView, (uint64_t (*)(uint64_t, uint64_t, _QWORD))MEMORY[0x24BDEF3B8]);
}

void sub_23DE84894(uint64_t a1)
{
  sub_23DE848A8(a1, &qword_256D0D778, (uint64_t (*)(uint64_t, uint64_t, uint64_t))MEMORY[0x24BDEF3B8]);
}

void sub_23DE848A8(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t, uint64_t, uint64_t))
{
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;

  if (!*a2)
  {
    v6 = type metadata accessor for MenstrualCyclesWidgetCircularView();
    sub_23DE84878(255);
    v8 = a3(a1, v6, v7);
    if (!v9)
      atomic_store(v8, a2);
  }
}

unint64_t sub_23DE84910()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;
  _QWORD v3[2];

  result = qword_256D0D788;
  if (!qword_256D0D788)
  {
    sub_23DE84894(255);
    v2 = v1;
    v3[0] = sub_23DE7AFC8(&qword_256D0D790, (uint64_t (*)(uint64_t))type metadata accessor for MenstrualCyclesWidgetCircularView, (uint64_t)&protocol conformance descriptor for MenstrualCyclesWidgetCircularView);
    v3[1] = sub_23DE84990();
    result = MEMORY[0x2426473FC](MEMORY[0x24BDEF3E0], v2, v3);
    atomic_store(result, (unint64_t *)&qword_256D0D788);
  }
  return result;
}

unint64_t sub_23DE84990()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;
  _QWORD v3[2];

  result = qword_256D0D798;
  if (!qword_256D0D798)
  {
    sub_23DE84878(255);
    v2 = v1;
    v3[0] = sub_23DE7AFC8(&qword_256D0D7A0, (uint64_t (*)(uint64_t))type metadata accessor for MenstrualCyclesWidgetRectangularView, (uint64_t)&protocol conformance descriptor for MenstrualCyclesWidgetRectangularView);
    v3[1] = MEMORY[0x24BDF5138];
    result = MEMORY[0x2426473FC](MEMORY[0x24BDEF3E0], v2, v3);
    atomic_store(result, (unint64_t *)&qword_256D0D798);
  }
  return result;
}

uint64_t sub_23DE84A10(uint64_t a1, uint64_t a2, unint64_t *a3, uint64_t (*a4)(uint64_t), uint64_t (*a5)(uint64_t, uint64_t))
{
  uint64_t v7;

  sub_23DE7349C(0, a3, a4, a5);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a2, a1, v7);
  return a2;
}

uint64_t sub_23DE84A60()
{
  return sub_23DE876FC();
}

uint64_t sub_23DE84A80(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_23DE84B08(a1, a2, a3, a4, (void (*)(_QWORD))MEMORY[0x24BDFADE0], MEMORY[0x24BDFAB68]);
}

uint64_t sub_23DE84AA4()
{
  return sub_23DE8766C();
}

uint64_t sub_23DE84AC4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_23DE84B08(a1, a2, a3, a4, (void (*)(_QWORD))MEMORY[0x24BDEB418], MEMORY[0x24BDEDEF8]);
}

uint64_t sub_23DE84AE8()
{
  return sub_23DE87678();
}

uint64_t sub_23DE84B08(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void (*a5)(_QWORD), uint64_t (*a6)(char *))
{
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v12;

  a5(0);
  MEMORY[0x24BDAC7A8]();
  v9 = (char *)&v12 - v8;
  (*(void (**)(char *, uint64_t))(v10 + 16))((char *)&v12 - v8, a1);
  return a6(v9);
}

uint64_t sub_23DE84B84(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_23DE84B08(a1, a2, a3, a4, (void (*)(_QWORD))MEMORY[0x24BDECF50], MEMORY[0x24BDEE028]);
}

id sub_23DE84BA8@<X0>(_BYTE *a1@<X8>)
{
  id result;

  result = sub_23DE74488();
  *a1 = result & 1;
  return result;
}

uint64_t sub_23DE84BD4(uint64_t a1, uint64_t a2, unint64_t *a3, uint64_t (*a4)(uint64_t), uint64_t (*a5)(uint64_t, uint64_t))
{
  uint64_t v7;

  sub_23DE7349C(0, a3, a4, a5);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 32))(a2, a1, v7);
  return a2;
}

uint64_t sub_23DE84C24()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t *initializeBufferWithCopyOfBuffer for MenstrualCyclesWidgetEntryView(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  char *v11;
  uint64_t v12;
  int *v13;
  uint64_t v14;
  char *v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  void **v19;
  void **v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  id v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  char *v34;
  char *v35;
  uint64_t v36;
  uint64_t v37;
  unsigned int (*v38)(char *, uint64_t, uint64_t);
  id v39;
  uint64_t v40;
  uint64_t v41;
  char *v42;
  char *v43;
  void (*v45)(char *, char *, uint64_t);
  void *v46;
  char *v47;
  char *v48;

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
    sub_23DE7349C(0, &qword_25432B9C0, (uint64_t (*)(uint64_t))MEMORY[0x24BDFAF10], MEMORY[0x24BDEB560]);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v7 = sub_23DE87A14();
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
    v12 = sub_23DE8745C();
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v12 - 8) + 16))(v10, v11, v12);
    v13 = (int *)type metadata accessor for MenstrualCyclesWidgetEntry(0);
    v14 = v13[5];
    v15 = &v10[v14];
    v16 = &v11[v14];
    v17 = sub_23DE879CC();
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v17 - 8) + 16))(v15, v16, v17);
    v18 = v13[6];
    v19 = (void **)&v10[v18];
    v20 = (void **)&v11[v18];
    v21 = type metadata accessor for MenstrualCyclesWidgetEntry.State(0);
    v22 = *(_QWORD *)(v21 - 8);
    if ((*(unsigned int (**)(void **, uint64_t, uint64_t))(v22 + 48))(v20, 1, v21))
    {
      sub_23DE7349C(0, &qword_25432BB38, type metadata accessor for MenstrualCyclesWidgetEntry.State, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1C68]);
      memcpy(v19, v20, *(_QWORD *)(*(_QWORD *)(v23 - 8) + 64));
    }
    else
    {
      sub_23DE6D5EC();
      v25 = v24;
      v26 = *(_QWORD *)(v24 - 8);
      if ((*(unsigned int (**)(void **, uint64_t, uint64_t))(v26 + 48))(v20, 1, v24))
      {
        memcpy(v19, v20, *(_QWORD *)(v22 + 64));
      }
      else
      {
        v27 = v20[1];
        v46 = *v20;
        *v19 = *v20;
        v19[1] = v27;
        v28 = *(int *)(v25 + 64);
        v47 = (char *)v20 + v28;
        v48 = (char *)v19 + v28;
        v29 = sub_23DE8757C();
        v45 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v29 - 8) + 16);
        v30 = v46;
        v45(v48, v47, v29);
        (*(void (**)(void **, _QWORD, uint64_t, uint64_t))(v26 + 56))(v19, 0, 1, v25);
      }
      (*(void (**)(void **, _QWORD, uint64_t, uint64_t))(v22 + 56))(v19, 0, 1, v21);
    }
    v31 = v13[7];
    v32 = *(void **)&v11[v31];
    *(_QWORD *)&v10[v31] = v32;
    v33 = v13[8];
    v34 = &v10[v33];
    v35 = &v11[v33];
    v36 = sub_23DE87A74();
    v37 = *(_QWORD *)(v36 - 8);
    v38 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v37 + 48);
    v39 = v32;
    if (v38(v35, 1, v36))
    {
      sub_23DE7349C(0, &qword_25432B9D8, (uint64_t (*)(uint64_t))MEMORY[0x24BDFB270], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1C68]);
      memcpy(v34, v35, *(_QWORD *)(*(_QWORD *)(v40 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v37 + 16))(v34, v35, v36);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v37 + 56))(v34, 0, 1, v36);
    }
    v41 = v13[9];
    v42 = &v10[v41];
    v43 = &v11[v41];
    *(_QWORD *)v42 = *(_QWORD *)v43;
    v42[8] = v43[8];
  }
  return a1;
}

uint64_t destroy for MenstrualCyclesWidgetEntryView(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  int *v7;
  uint64_t v8;
  uint64_t v9;
  id *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t result;

  sub_23DE7349C(0, &qword_25432B9C0, (uint64_t (*)(uint64_t))MEMORY[0x24BDFAF10], MEMORY[0x24BDEB560]);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v4 = sub_23DE87A14();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(a1, v4);
  }
  else
  {
    swift_release();
  }
  v5 = a1 + *(int *)(a2 + 20);
  v6 = sub_23DE8745C();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 8))(v5, v6);
  v7 = (int *)type metadata accessor for MenstrualCyclesWidgetEntry(0);
  v8 = v5 + v7[5];
  v9 = sub_23DE879CC();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 8))(v8, v9);
  v10 = (id *)(v5 + v7[6]);
  v11 = type metadata accessor for MenstrualCyclesWidgetEntry.State(0);
  if (!(*(unsigned int (**)(id *, uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 48))(v10, 1, v11))
  {
    sub_23DE6D5EC();
    v13 = v12;
    if (!(*(unsigned int (**)(id *, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 48))(v10, 1, v12))
    {

      v14 = (char *)v10 + *(int *)(v13 + 64);
      v15 = sub_23DE8757C();
      (*(void (**)(char *, uint64_t))(*(_QWORD *)(v15 - 8) + 8))(v14, v15);
    }
  }

  v16 = v5 + v7[8];
  v17 = sub_23DE87A74();
  v18 = *(_QWORD *)(v17 - 8);
  result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v18 + 48))(v16, 1, v17);
  if (!(_DWORD)result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(v18 + 8))(v16, v17);
  return result;
}

_QWORD *initializeWithCopy for MenstrualCyclesWidgetEntryView(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  char *v8;
  char *v9;
  uint64_t v10;
  int *v11;
  uint64_t v12;
  char *v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  void **v17;
  void **v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  id v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  char *v32;
  char *v33;
  uint64_t v34;
  uint64_t v35;
  unsigned int (*v36)(char *, uint64_t, uint64_t);
  id v37;
  uint64_t v38;
  uint64_t v39;
  char *v40;
  char *v41;
  void (*v43)(char *, char *, uint64_t);
  void *v44;
  char *v45;
  char *v46;

  sub_23DE7349C(0, &qword_25432B9C0, (uint64_t (*)(uint64_t))MEMORY[0x24BDFAF10], MEMORY[0x24BDEB560]);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v6 = sub_23DE87A14();
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
  v10 = sub_23DE8745C();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v10 - 8) + 16))(v8, v9, v10);
  v11 = (int *)type metadata accessor for MenstrualCyclesWidgetEntry(0);
  v12 = v11[5];
  v13 = &v8[v12];
  v14 = &v9[v12];
  v15 = sub_23DE879CC();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v15 - 8) + 16))(v13, v14, v15);
  v16 = v11[6];
  v17 = (void **)&v8[v16];
  v18 = (void **)&v9[v16];
  v19 = type metadata accessor for MenstrualCyclesWidgetEntry.State(0);
  v20 = *(_QWORD *)(v19 - 8);
  if ((*(unsigned int (**)(void **, uint64_t, uint64_t))(v20 + 48))(v18, 1, v19))
  {
    sub_23DE7349C(0, &qword_25432BB38, type metadata accessor for MenstrualCyclesWidgetEntry.State, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1C68]);
    memcpy(v17, v18, *(_QWORD *)(*(_QWORD *)(v21 - 8) + 64));
  }
  else
  {
    sub_23DE6D5EC();
    v23 = v22;
    v24 = *(_QWORD *)(v22 - 8);
    if ((*(unsigned int (**)(void **, uint64_t, uint64_t))(v24 + 48))(v18, 1, v22))
    {
      memcpy(v17, v18, *(_QWORD *)(v20 + 64));
    }
    else
    {
      v25 = v18[1];
      v44 = *v18;
      *v17 = *v18;
      v17[1] = v25;
      v26 = *(int *)(v23 + 64);
      v45 = (char *)v18 + v26;
      v46 = (char *)v17 + v26;
      v27 = sub_23DE8757C();
      v43 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v27 - 8) + 16);
      v28 = v44;
      v43(v46, v45, v27);
      (*(void (**)(void **, _QWORD, uint64_t, uint64_t))(v24 + 56))(v17, 0, 1, v23);
    }
    (*(void (**)(void **, _QWORD, uint64_t, uint64_t))(v20 + 56))(v17, 0, 1, v19);
  }
  v29 = v11[7];
  v30 = *(void **)&v9[v29];
  *(_QWORD *)&v8[v29] = v30;
  v31 = v11[8];
  v32 = &v8[v31];
  v33 = &v9[v31];
  v34 = sub_23DE87A74();
  v35 = *(_QWORD *)(v34 - 8);
  v36 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v35 + 48);
  v37 = v30;
  if (v36(v33, 1, v34))
  {
    sub_23DE7349C(0, &qword_25432B9D8, (uint64_t (*)(uint64_t))MEMORY[0x24BDFB270], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1C68]);
    memcpy(v32, v33, *(_QWORD *)(*(_QWORD *)(v38 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v35 + 16))(v32, v33, v34);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v35 + 56))(v32, 0, 1, v34);
  }
  v39 = v11[9];
  v40 = &v8[v39];
  v41 = &v9[v39];
  *(_QWORD *)v40 = *(_QWORD *)v41;
  v40[8] = v41[8];
  return a1;
}

_QWORD *assignWithCopy for MenstrualCyclesWidgetEntryView(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  char *v8;
  char *v9;
  uint64_t v10;
  int *v11;
  uint64_t v12;
  char *v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  void **v17;
  void **v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t (*v21)(void **, uint64_t, uint64_t);
  int v22;
  int v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  uint64_t v25;
  size_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t (*v32)(void **, uint64_t, uint64_t);
  int v33;
  int v34;
  void *v35;
  uint64_t v36;
  char *v37;
  uint64_t v38;
  void (*v39)(char *, char *, uint64_t);
  id v40;
  uint64_t v41;
  uint64_t v42;
  id v43;
  uint64_t v44;
  void *v45;
  void *v46;
  id v47;
  uint64_t v48;
  char *v49;
  char *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t (*v53)(char *, uint64_t, uint64_t);
  int v54;
  int v55;
  uint64_t v56;
  uint64_t v57;
  char *v58;
  char *v59;
  uint64_t v60;
  void *v62;
  void *v63;
  id v64;
  uint64_t v65;
  char *v66;
  char *v67;
  uint64_t v68;
  void (*v69)(char *, char *, uint64_t);
  char *v70;
  char *v71;
  char *v72;
  uint64_t v73;
  void *v74;

  if (a1 != a2)
  {
    sub_23DE85920((uint64_t)a1);
    sub_23DE7349C(0, &qword_25432B9C0, (uint64_t (*)(uint64_t))MEMORY[0x24BDFAF10], MEMORY[0x24BDEB560]);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v6 = sub_23DE87A14();
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
  v10 = sub_23DE8745C();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v10 - 8) + 24))(v8, v9, v10);
  v11 = (int *)type metadata accessor for MenstrualCyclesWidgetEntry(0);
  v12 = v11[5];
  v13 = &v8[v12];
  v14 = &v9[v12];
  v15 = sub_23DE879CC();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v15 - 8) + 24))(v13, v14, v15);
  v16 = v11[6];
  v17 = (void **)&v8[v16];
  v18 = (void **)&v9[v16];
  v19 = type metadata accessor for MenstrualCyclesWidgetEntry.State(0);
  v20 = *(_QWORD *)(v19 - 8);
  v21 = *(uint64_t (**)(void **, uint64_t, uint64_t))(v20 + 48);
  v22 = v21(v17, 1, v19);
  v23 = v21(v18, 1, v19);
  if (!v22)
  {
    if (v23)
    {
      sub_23DE6EFC4((uint64_t)v17, type metadata accessor for MenstrualCyclesWidgetEntry.State);
      v24 = (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1C68];
      goto LABEL_11;
    }
    sub_23DE6D5EC();
    v31 = v30;
    v73 = *(_QWORD *)(v30 - 8);
    v32 = *(uint64_t (**)(void **, uint64_t, uint64_t))(v73 + 48);
    v33 = v32(v17, 1, v30);
    v34 = v32(v18, 1, v31);
    if (v33)
    {
      if (!v34)
      {
        v35 = *v18;
        *v17 = *v18;
        v17[1] = v18[1];
        v36 = *(int *)(v31 + 64);
        v37 = (char *)v17 + v36;
        v71 = (char *)v18 + v36;
        v38 = sub_23DE8757C();
        v39 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v38 - 8) + 16);
        v40 = v35;
        v39(v37, v71, v38);
        (*(void (**)(void **, _QWORD, uint64_t, uint64_t))(v73 + 56))(v17, 0, 1, v31);
        goto LABEL_20;
      }
    }
    else
    {
      if (!v34)
      {
        v62 = *v18;
        v63 = *v17;
        *v17 = *v18;
        v64 = v62;

        v17[1] = v18[1];
        v65 = *(int *)(v31 + 64);
        v66 = (char *)v17 + v65;
        v67 = (char *)v18 + v65;
        v68 = sub_23DE8757C();
        (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v68 - 8) + 24))(v66, v67, v68);
        goto LABEL_20;
      }
      sub_23DE6EFC4((uint64_t)v17, (uint64_t (*)(_QWORD))sub_23DE6D5EC);
    }
    v26 = *(_QWORD *)(v20 + 64);
    goto LABEL_12;
  }
  if (v23)
  {
    v24 = (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1C68];
LABEL_11:
    sub_23DE7349C(0, &qword_25432BB38, type metadata accessor for MenstrualCyclesWidgetEntry.State, v24);
    v26 = *(_QWORD *)(*(_QWORD *)(v25 - 8) + 64);
LABEL_12:
    memcpy(v17, v18, v26);
    goto LABEL_20;
  }
  sub_23DE6D5EC();
  v28 = v27;
  v29 = *(_QWORD *)(v27 - 8);
  if ((*(unsigned int (**)(void **, uint64_t, uint64_t))(v29 + 48))(v18, 1, v27))
  {
    memcpy(v17, v18, *(_QWORD *)(v20 + 64));
  }
  else
  {
    v74 = *v18;
    *v17 = *v18;
    v17[1] = v18[1];
    v41 = *(int *)(v28 + 64);
    v70 = (char *)v18 + v41;
    v72 = (char *)v17 + v41;
    v42 = sub_23DE8757C();
    v69 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v42 - 8) + 16);
    v43 = v74;
    v69(v72, v70, v42);
    (*(void (**)(void **, _QWORD, uint64_t, uint64_t))(v29 + 56))(v17, 0, 1, v28);
  }
  (*(void (**)(void **, _QWORD, uint64_t, uint64_t))(v20 + 56))(v17, 0, 1, v19);
LABEL_20:
  v44 = v11[7];
  v45 = *(void **)&v8[v44];
  v46 = *(void **)&v9[v44];
  *(_QWORD *)&v8[v44] = v46;
  v47 = v46;

  v48 = v11[8];
  v49 = &v8[v48];
  v50 = &v9[v48];
  v51 = sub_23DE87A74();
  v52 = *(_QWORD *)(v51 - 8);
  v53 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v52 + 48);
  v54 = v53(v49, 1, v51);
  v55 = v53(v50, 1, v51);
  if (!v54)
  {
    if (!v55)
    {
      (*(void (**)(char *, char *, uint64_t))(v52 + 24))(v49, v50, v51);
      goto LABEL_26;
    }
    (*(void (**)(char *, uint64_t))(v52 + 8))(v49, v51);
    goto LABEL_25;
  }
  if (v55)
  {
LABEL_25:
    sub_23DE7349C(0, &qword_25432B9D8, (uint64_t (*)(uint64_t))MEMORY[0x24BDFB270], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1C68]);
    memcpy(v49, v50, *(_QWORD *)(*(_QWORD *)(v56 - 8) + 64));
    goto LABEL_26;
  }
  (*(void (**)(char *, char *, uint64_t))(v52 + 16))(v49, v50, v51);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v52 + 56))(v49, 0, 1, v51);
LABEL_26:
  v57 = v11[9];
  v58 = &v8[v57];
  v59 = &v9[v57];
  v60 = *(_QWORD *)v59;
  v58[8] = v59[8];
  *(_QWORD *)v58 = v60;
  return a1;
}

uint64_t sub_23DE85920(uint64_t a1)
{
  uint64_t v2;

  sub_23DE7349C(0, &qword_25432B9C0, (uint64_t (*)(uint64_t))MEMORY[0x24BDFAF10], MEMORY[0x24BDEB560]);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

char *initializeWithTake for MenstrualCyclesWidgetEntryView(char *a1, char *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  char *v11;
  uint64_t v12;
  int *v13;
  uint64_t v14;
  char *v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  char *v20;
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
  char *v32;
  char *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  char *v38;
  char *v39;
  char *v41;

  sub_23DE7349C(0, &qword_25432B9C0, (uint64_t (*)(uint64_t))MEMORY[0x24BDFAF10], MEMORY[0x24BDEB560]);
  v7 = v6;
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v8 = sub_23DE87A14();
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v8 - 8) + 32))(a1, a2, v8);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v7 - 8) + 64));
  }
  v9 = *(int *)(a3 + 20);
  v10 = &a1[v9];
  v11 = &a2[v9];
  v12 = sub_23DE8745C();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v12 - 8) + 32))(v10, v11, v12);
  v13 = (int *)type metadata accessor for MenstrualCyclesWidgetEntry(0);
  v14 = v13[5];
  v15 = &v10[v14];
  v16 = &v11[v14];
  v17 = sub_23DE879CC();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v17 - 8) + 32))(v15, v16, v17);
  v18 = v13[6];
  v19 = &v10[v18];
  v20 = &v11[v18];
  v21 = type metadata accessor for MenstrualCyclesWidgetEntry.State(0);
  v22 = *(_QWORD *)(v21 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v22 + 48))(v20, 1, v21))
  {
    sub_23DE7349C(0, &qword_25432BB38, type metadata accessor for MenstrualCyclesWidgetEntry.State, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1C68]);
    memcpy(v19, v20, *(_QWORD *)(*(_QWORD *)(v23 - 8) + 64));
  }
  else
  {
    sub_23DE6D5EC();
    v25 = v24;
    v26 = *(_QWORD *)(v24 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v26 + 48))(v20, 1, v24))
    {
      memcpy(v19, v20, *(_QWORD *)(v22 + 64));
    }
    else
    {
      v27 = *((_QWORD *)v20 + 1);
      *(_QWORD *)v19 = *(_QWORD *)v20;
      *((_QWORD *)v19 + 1) = v27;
      v28 = *(int *)(v25 + 64);
      v41 = &v19[v28];
      v29 = &v20[v28];
      v30 = sub_23DE8757C();
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v30 - 8) + 32))(v41, v29, v30);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v26 + 56))(v19, 0, 1, v25);
    }
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v22 + 56))(v19, 0, 1, v21);
  }
  *(_QWORD *)&v10[v13[7]] = *(_QWORD *)&v11[v13[7]];
  v31 = v13[8];
  v32 = &v10[v31];
  v33 = &v11[v31];
  v34 = sub_23DE87A74();
  v35 = *(_QWORD *)(v34 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v35 + 48))(v33, 1, v34))
  {
    sub_23DE7349C(0, &qword_25432B9D8, (uint64_t (*)(uint64_t))MEMORY[0x24BDFB270], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1C68]);
    memcpy(v32, v33, *(_QWORD *)(*(_QWORD *)(v36 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v35 + 32))(v32, v33, v34);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v35 + 56))(v32, 0, 1, v34);
  }
  v37 = v13[9];
  v38 = &v10[v37];
  v39 = &v11[v37];
  *(_QWORD *)v38 = *(_QWORD *)v39;
  v38[8] = v39[8];
  return a1;
}

char *assignWithTake for MenstrualCyclesWidgetEntryView(char *a1, char *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  char *v11;
  uint64_t v12;
  int *v13;
  uint64_t v14;
  char *v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  void **v19;
  void **v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t (*v23)(void **, uint64_t, uint64_t);
  int v24;
  int v25;
  uint64_t (*v26)(uint64_t, uint64_t);
  uint64_t v27;
  size_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t (*v34)(void **, uint64_t, uint64_t);
  int v35;
  int v36;
  void *v37;
  uint64_t v38;
  char *v39;
  char *v40;
  uint64_t v41;
  void *v42;
  uint64_t v43;
  char *v44;
  uint64_t v45;
  uint64_t v46;
  void *v47;
  uint64_t v48;
  char *v49;
  char *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t (*v53)(char *, uint64_t, uint64_t);
  int v54;
  int v55;
  uint64_t v56;
  uint64_t v57;
  char *v58;
  char *v59;
  void *v61;
  uint64_t v62;
  char *v63;
  char *v64;
  uint64_t v65;
  uint64_t v66;
  char *v67;

  if (a1 != a2)
  {
    sub_23DE85920((uint64_t)a1);
    sub_23DE7349C(0, &qword_25432B9C0, (uint64_t (*)(uint64_t))MEMORY[0x24BDFAF10], MEMORY[0x24BDEB560]);
    v7 = v6;
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v8 = sub_23DE87A14();
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v8 - 8) + 32))(a1, a2, v8);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v7 - 8) + 64));
    }
  }
  v9 = *(int *)(a3 + 20);
  v10 = &a1[v9];
  v11 = &a2[v9];
  v12 = sub_23DE8745C();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v12 - 8) + 40))(v10, v11, v12);
  v13 = (int *)type metadata accessor for MenstrualCyclesWidgetEntry(0);
  v14 = v13[5];
  v15 = &v10[v14];
  v16 = &v11[v14];
  v17 = sub_23DE879CC();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v17 - 8) + 40))(v15, v16, v17);
  v18 = v13[6];
  v19 = (void **)&v10[v18];
  v20 = (void **)&v11[v18];
  v21 = type metadata accessor for MenstrualCyclesWidgetEntry.State(0);
  v22 = *(_QWORD *)(v21 - 8);
  v23 = *(uint64_t (**)(void **, uint64_t, uint64_t))(v22 + 48);
  v24 = v23(v19, 1, v21);
  v25 = v23(v20, 1, v21);
  if (!v24)
  {
    if (v25)
    {
      sub_23DE6EFC4((uint64_t)v19, type metadata accessor for MenstrualCyclesWidgetEntry.State);
      v26 = (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1C68];
      goto LABEL_10;
    }
    sub_23DE6D5EC();
    v33 = v32;
    v66 = *(_QWORD *)(v32 - 8);
    v34 = *(uint64_t (**)(void **, uint64_t, uint64_t))(v66 + 48);
    v35 = v34(v19, 1, v32);
    v36 = v34(v20, 1, v33);
    if (v35)
    {
      if (!v36)
      {
        v37 = v20[1];
        *v19 = *v20;
        v19[1] = v37;
        v38 = *(int *)(v33 + 64);
        v39 = (char *)v19 + v38;
        v40 = (char *)v20 + v38;
        v41 = sub_23DE8757C();
        (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v41 - 8) + 32))(v39, v40, v41);
        (*(void (**)(void **, _QWORD, uint64_t, uint64_t))(v66 + 56))(v19, 0, 1, v33);
        goto LABEL_19;
      }
    }
    else
    {
      if (!v36)
      {
        v61 = *v19;
        *v19 = *v20;

        v19[1] = v20[1];
        v62 = *(int *)(v33 + 64);
        v63 = (char *)v19 + v62;
        v64 = (char *)v20 + v62;
        v65 = sub_23DE8757C();
        (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v65 - 8) + 40))(v63, v64, v65);
        goto LABEL_19;
      }
      sub_23DE6EFC4((uint64_t)v19, (uint64_t (*)(_QWORD))sub_23DE6D5EC);
    }
    v28 = *(_QWORD *)(v22 + 64);
    goto LABEL_11;
  }
  if (v25)
  {
    v26 = (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1C68];
LABEL_10:
    sub_23DE7349C(0, &qword_25432BB38, type metadata accessor for MenstrualCyclesWidgetEntry.State, v26);
    v28 = *(_QWORD *)(*(_QWORD *)(v27 - 8) + 64);
LABEL_11:
    memcpy(v19, v20, v28);
    goto LABEL_19;
  }
  sub_23DE6D5EC();
  v30 = v29;
  v31 = *(_QWORD *)(v29 - 8);
  if ((*(unsigned int (**)(void **, uint64_t, uint64_t))(v31 + 48))(v20, 1, v29))
  {
    memcpy(v19, v20, *(_QWORD *)(v22 + 64));
  }
  else
  {
    v42 = v20[1];
    *v19 = *v20;
    v19[1] = v42;
    v43 = *(int *)(v30 + 64);
    v67 = (char *)v19 + v43;
    v44 = (char *)v20 + v43;
    v45 = sub_23DE8757C();
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v45 - 8) + 32))(v67, v44, v45);
    (*(void (**)(void **, _QWORD, uint64_t, uint64_t))(v31 + 56))(v19, 0, 1, v30);
  }
  (*(void (**)(void **, _QWORD, uint64_t, uint64_t))(v22 + 56))(v19, 0, 1, v21);
LABEL_19:
  v46 = v13[7];
  v47 = *(void **)&v10[v46];
  *(_QWORD *)&v10[v46] = *(_QWORD *)&v11[v46];

  v48 = v13[8];
  v49 = &v10[v48];
  v50 = &v11[v48];
  v51 = sub_23DE87A74();
  v52 = *(_QWORD *)(v51 - 8);
  v53 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v52 + 48);
  v54 = v53(v49, 1, v51);
  v55 = v53(v50, 1, v51);
  if (!v54)
  {
    if (!v55)
    {
      (*(void (**)(char *, char *, uint64_t))(v52 + 40))(v49, v50, v51);
      goto LABEL_25;
    }
    (*(void (**)(char *, uint64_t))(v52 + 8))(v49, v51);
    goto LABEL_24;
  }
  if (v55)
  {
LABEL_24:
    sub_23DE7349C(0, &qword_25432B9D8, (uint64_t (*)(uint64_t))MEMORY[0x24BDFB270], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1C68]);
    memcpy(v49, v50, *(_QWORD *)(*(_QWORD *)(v56 - 8) + 64));
    goto LABEL_25;
  }
  (*(void (**)(char *, char *, uint64_t))(v52 + 32))(v49, v50, v51);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v52 + 56))(v49, 0, 1, v51);
LABEL_25:
  v57 = v13[9];
  v58 = &v10[v57];
  v59 = &v11[v57];
  *(_QWORD *)v58 = *(_QWORD *)v59;
  v58[8] = v59[8];
  return a1;
}

uint64_t getEnumTagSinglePayload for MenstrualCyclesWidgetEntryView()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_23DE86118(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t, uint64_t);
  uint64_t v10;

  sub_23DE7349C(0, &qword_256D0D520, (uint64_t (*)(uint64_t))MEMORY[0x24BDFAF10], MEMORY[0x24BDEB580]);
  v7 = *(_QWORD *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == (_DWORD)a2)
  {
    v8 = v6;
    v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    v10 = a1;
  }
  else
  {
    v8 = type metadata accessor for MenstrualCyclesWidgetEntry(0);
    v10 = a1 + *(int *)(a3 + 20);
    v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 48);
  }
  return v9(v10, a2, v8);
}

uint64_t storeEnumTagSinglePayload for MenstrualCyclesWidgetEntryView()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_23DE861B0(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v12;

  sub_23DE7349C(0, &qword_256D0D520, (uint64_t (*)(uint64_t))MEMORY[0x24BDFAF10], MEMORY[0x24BDEB580]);
  v9 = *(_QWORD *)(v8 - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    v10 = v8;
    v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    v12 = a1;
  }
  else
  {
    v10 = type metadata accessor for MenstrualCyclesWidgetEntry(0);
    v12 = a1 + *(int *)(a4 + 20);
    v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 56);
  }
  return v11(v12, a2, a2, v10);
}

void sub_23DE86244()
{
  unint64_t v0;
  unint64_t v1;

  sub_23DE7349C(319, &qword_25432B9C0, (uint64_t (*)(uint64_t))MEMORY[0x24BDFAF10], MEMORY[0x24BDEB560]);
  if (v0 <= 0x3F)
  {
    type metadata accessor for MenstrualCyclesWidgetEntry(319);
    if (v1 <= 0x3F)
      swift_initStructMetadata();
  }
}

unint64_t sub_23DE862E4()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;
  _QWORD v3[2];

  result = qword_256D0D7A8;
  if (!qword_256D0D7A8)
  {
    sub_23DE86364(255, &qword_256D0D7B0, (uint64_t (*)(uint64_t))sub_23DE84894, (uint64_t (*)(uint64_t, uint64_t, _QWORD))MEMORY[0x24BDEF3B8]);
    v2 = v1;
    v3[0] = sub_23DE84910();
    v3[1] = MEMORY[0x24BDF5138];
    result = MEMORY[0x2426473FC](MEMORY[0x24BDEF3E0], v2, v3);
    atomic_store(result, (unint64_t *)&qword_256D0D7A8);
  }
  return result;
}

void sub_23DE86364(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t), uint64_t (*a4)(uint64_t, uint64_t, _QWORD))
{
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;

  if (!*a2)
  {
    v7 = a3(255);
    v8 = a4(a1, v7, MEMORY[0x24BDF5158]);
    if (!v9)
      atomic_store(v8, a2);
  }
}

uint64_t sub_23DE863C4@<X0>(void *a1@<X0>, uint64_t a2@<X1>, char *a3@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  id v21;
  unsigned __int8 v22;
  void (*v23)(char *, uint64_t);
  uint64_t result;
  char v25;
  char v26;
  uint64_t v27;
  uint64_t v28;
  char v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  id v33;
  char *v34;
  uint64_t v35;

  v34 = a3;
  v35 = a2;
  v4 = sub_23DE874A4();
  v31 = *(_QWORD *)(v4 - 8);
  v32 = v4;
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)&v30 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_23DE87534();
  MEMORY[0x24BDAC7A8](v7);
  v8 = sub_23DE8745C();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)&v30 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = sub_23DE879CC();
  v13 = *(_QWORD *)(v12 - 8);
  v14 = MEMORY[0x24BDAC7A8](v12);
  v16 = (char *)&v30 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v14);
  v18 = (char *)&v30 - v17;
  v33 = a1;
  if (a1)
  {
    v30 = v9;
    (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v11, v35, v8);
    v20 = v31;
    v19 = v32;
    (*(void (**)(char *, _QWORD, uint64_t))(v31 + 104))(v6, *MEMORY[0x24BDCEF70], v32);
    sub_23DE874B0();
    (*(void (**)(char *, uint64_t))(v20 + 8))(v6, v19);
    sub_23DE879B4();
    v21 = v33;
    v22 = objc_msgSend(v33, sel_isPartiallyLogged);
    (*(void (**)(char *, char *, uint64_t))(v13 + 16))(v16, v18, v12);
    if ((v22 & 1) != 0)
    {
      v23 = *(void (**)(char *, uint64_t))(v13 + 8);
      v23(v16, v12);
LABEL_7:
      v27 = v35;
      v28 = v30;
      objc_msgSend(v21, sel_allDays);
      v29 = sub_23DE87B94();

      (*(void (**)(uint64_t, uint64_t))(v28 + 8))(v27, v8);
      result = ((uint64_t (*)(char *, uint64_t))v23)(v18, v12);
      v25 = v29 & 1;
      goto LABEL_8;
    }
    objc_msgSend(v21, sel_mostLikelyDays);
    v26 = sub_23DE87B94();
    v23 = *(void (**)(char *, uint64_t))(v13 + 8);
    v23(v16, v12);
    if ((v26 & 1) == 0)
      goto LABEL_7;

    (*(void (**)(uint64_t, uint64_t))(v30 + 8))(v35, v8);
    result = ((uint64_t (*)(char *, uint64_t))v23)(v18, v12);
    v25 = 2;
  }
  else
  {
    result = (*(uint64_t (**)(uint64_t, uint64_t))(v9 + 8))(v35, v8);
    v25 = 0;
  }
LABEL_8:
  *v34 = v25;
  return result;
}

uint64_t sub_23DE86698@<X0>(void *a1@<X0>, _BYTE *a2@<X1>, char *a3@<X8>)
{
  uint64_t v6;
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
  uint64_t v17;
  _BYTE *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  _BYTE *v23;
  uint64_t v24;
  _BYTE *v25;
  id v26;
  void *v27;
  void (*v28)(_BYTE *, _BYTE *, uint64_t);
  _BYTE *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  void (*v38)(_BYTE *, uint64_t);
  uint64_t v39;
  _BYTE *v40;
  _BYTE *v41;
  _BYTE *v42;
  _BYTE *v43;
  void (*v44)(_BYTE *, uint64_t);
  uint64_t v45;
  char v46;
  uint64_t v47;
  char v48;
  char v49;
  _BYTE *v50;
  void (*v51)(_BYTE *, uint64_t);
  uint64_t v52;
  uint64_t result;
  char v54;
  void (*v55)(_BYTE *, uint64_t);
  uint64_t v56;
  _BYTE v57[4];
  unsigned int v58;
  void (*v59)(uint64_t);
  __int128 v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  _BYTE *v64;
  uint64_t v65;
  char *v66;
  _BYTE *v67;
  uint64_t v68;
  _BYTE *v69;
  _BYTE *v70;
  uint64_t v71;
  uint64_t v72;
  _BYTE *v73;
  _BYTE *v74;
  uint64_t v75;
  uint64_t v76;
  id v77;

  v72 = sub_23DE87534();
  v68 = *(_QWORD *)(v72 - 8);
  MEMORY[0x24BDAC7A8](v72);
  v69 = &v57[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v7 = sub_23DE873FC();
  v71 = *(_QWORD *)(v7 - 8);
  v8 = MEMORY[0x24BDAC7A8](v7);
  v70 = &v57[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x24BDAC7A8](v8);
  v74 = &v57[-v10];
  v11 = sub_23DE8745C();
  v75 = *(_QWORD *)(v11 - 8);
  v76 = v11;
  v12 = MEMORY[0x24BDAC7A8](v11);
  v14 = &v57[-((v13 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x24BDAC7A8](v12);
  v73 = &v57[-v15];
  sub_23DE7349C(0, &qword_25432B9E8, (uint64_t (*)(uint64_t))MEMORY[0x24BDCB878], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1C68]);
  MEMORY[0x24BDAC7A8](v16);
  v18 = &v57[-v17];
  v19 = sub_23DE87348();
  v20 = *(_QWORD *)(v19 - 8);
  v21 = MEMORY[0x24BDAC7A8](v19);
  v23 = &v57[-((v22 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x24BDAC7A8](v21);
  v25 = &v57[-v24];
  v77 = a1;
  v26 = objc_msgSend(a1, sel_pregnancyDuration);
  if (!v26)
  {
    (*(void (**)(_BYTE *, uint64_t, uint64_t, uint64_t))(v20 + 56))(v18, 1, 1, v19);
    goto LABEL_8;
  }
  v27 = v26;
  sub_23DE87324();

  v28 = *(void (**)(_BYTE *, _BYTE *, uint64_t))(v20 + 32);
  v28(v18, v23, v19);
  (*(void (**)(_BYTE *, _QWORD, uint64_t, uint64_t))(v20 + 56))(v18, 0, 1, v19);
  if ((*(unsigned int (**)(_BYTE *, uint64_t, uint64_t))(v20 + 48))(v18, 1, v19) == 1)
  {
LABEL_8:

    (*(void (**)(_BYTE *, uint64_t))(v75 + 8))(a2, v76);
    result = sub_23DE86F44((uint64_t)v18);
LABEL_9:
    v54 = 0;
    goto LABEL_10;
  }
  v65 = v7;
  v66 = a3;
  v67 = v25;
  v28(v25, v18, v19);
  sub_23DE83388(0, 0, -1, 0, 0, 0, (uint64_t)v73);
  v29 = v69;
  sub_23DE8751C();
  sub_23DE7349C(0, &qword_256D0D758, (uint64_t (*)(uint64_t))MEMORY[0x24BDCF290], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE3598]);
  v63 = v30;
  v31 = sub_23DE87528();
  v64 = a2;
  v32 = *(_QWORD *)(v31 - 8);
  v33 = *(_QWORD *)(v32 + 72);
  v34 = *(unsigned __int8 *)(v32 + 80);
  v35 = (v34 + 32) & ~v34;
  v61 = v34 | 7;
  v62 = v35 + v33;
  v36 = swift_allocObject();
  v60 = xmmword_23DE88350;
  *(_OWORD *)(v36 + 16) = xmmword_23DE88350;
  v58 = *MEMORY[0x24BDCF1E8];
  v59 = *(void (**)(uint64_t))(v32 + 104);
  v59(v36 + v35);
  sub_23DE86F98(v36);
  swift_setDeallocating();
  swift_arrayDestroy();
  swift_deallocClassInstance();
  sub_23DE87330();
  sub_23DE874C8();
  swift_bridgeObjectRelease();
  v37 = v76;
  v38 = *(void (**)(_BYTE *, uint64_t))(v75 + 8);
  v38(v14, v76);
  v75 = *(_QWORD *)(v68 + 8);
  ((void (*)(_BYTE *, uint64_t))v75)(v29, v72);
  sub_23DE8751C();
  v39 = swift_allocObject();
  *(_OWORD *)(v39 + 16) = v60;
  ((void (*)(uint64_t, _QWORD, uint64_t))v59)(v39 + v35, v58, v31);
  sub_23DE86F98(v39);
  swift_setDeallocating();
  swift_arrayDestroy();
  swift_deallocClassInstance();
  sub_23DE87330();
  v40 = v70;
  v41 = v64;
  sub_23DE874C8();
  swift_bridgeObjectRelease();
  v42 = v14;
  v43 = v74;
  v44 = v38;
  v38(v42, v37);
  ((void (*)(_BYTE *, uint64_t))v75)(v29, v72);
  v45 = sub_23DE87354();
  if ((v46 & 1) != 0)
  {

    v38(v41, v37);
    v55 = *(void (**)(_BYTE *, uint64_t))(v71 + 8);
    v56 = v65;
    v55(v40, v65);
    v55(v43, v56);
    v38(v73, v37);
    result = (*(uint64_t (**)(_BYTE *, uint64_t))(v20 + 8))(v67, v19);
    a3 = v66;
    goto LABEL_9;
  }
  v47 = v45;
  v75 = sub_23DE87354();
  v49 = v48;

  v38(v41, v37);
  v50 = v40;
  v51 = *(void (**)(_BYTE *, uint64_t))(v71 + 8);
  v52 = v65;
  v51(v50, v65);
  v51(v43, v52);
  v44(v73, v37);
  result = (*(uint64_t (**)(_BYTE *, uint64_t))(v20 + 8))(v67, v19);
  a3 = v66;
  if ((v49 & 1) != 0 || v47 >= v75)
    goto LABEL_9;
  v54 = 2;
LABEL_10:
  *a3 = v54;
  return result;
}

float MenstrualCyclesWidgetEntry.RelevanceScore.rawValue.getter()
{
  char *v0;

  return flt_23DE88A48[*v0];
}

void MenstrualCyclesWidgetEntry.RelevanceScore.init(rawValue:)(char *a1@<X8>, float a2@<S0>)
{
  char v2;
  char v3;

  if (a2 == 0.0)
  {
    *a1 = 0;
  }
  else
  {
    if (a2 == 20.0)
      v2 = 2;
    else
      v2 = 3;
    if (a2 == 10.0)
      v3 = 1;
    else
      v3 = v2;
    *a1 = v3;
  }
}

BOOL sub_23DE86CA8(char *a1, char *a2)
{
  return flt_23DE88A48[*a1] == flt_23DE88A48[*a2];
}

unint64_t sub_23DE86CD0()
{
  unint64_t result;

  result = qword_256D0D7B8;
  if (!qword_256D0D7B8)
  {
    result = MEMORY[0x2426473FC](&protocol conformance descriptor for MenstrualCyclesWidgetEntry.RelevanceScore, &type metadata for MenstrualCyclesWidgetEntry.RelevanceScore);
    atomic_store(result, (unint64_t *)&qword_256D0D7B8);
  }
  return result;
}

uint64_t sub_23DE86D14()
{
  return sub_23DE86D5C();
}

uint64_t sub_23DE86D20()
{
  return sub_23DE87CB4();
}

uint64_t sub_23DE86D54()
{
  return sub_23DE86D5C();
}

uint64_t sub_23DE86D5C()
{
  sub_23DE87CA8();
  sub_23DE87CB4();
  return sub_23DE87CC0();
}

void sub_23DE86DA8(float *a1@<X0>, char *a2@<X8>)
{
  MenstrualCyclesWidgetEntry.RelevanceScore.init(rawValue:)(a2, *a1);
}

float sub_23DE86DB0@<S0>(float *a1@<X8>)
{
  char *v1;
  float result;

  result = flt_23DE88A48[*v1];
  *a1 = result;
  return result;
}

_BYTE *__swift_memcpy1_1(_BYTE *result, _BYTE *a2)
{
  *result = *a2;
  return result;
}

uint64_t _s14RelevanceScoreOwet(unsigned __int8 *a1, unsigned int a2)
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

uint64_t _s14RelevanceScoreOwst(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_23DE86EB4 + 4 * byte_23DE88975[v4]))();
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)sub_23DE86EE8 + 4 * asc_23DE88970[v4]))();
}

uint64_t sub_23DE86EE8(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_23DE86EF0(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x23DE86EF8);
  return result;
}

uint64_t sub_23DE86F04(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x23DE86F0CLL);
  *(_BYTE *)result = a2 + 2;
  return result;
}

uint64_t sub_23DE86F10(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23DE86F18(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23DE86F24(unsigned __int8 *a1)
{
  return *a1;
}

_BYTE *sub_23DE86F2C(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

ValueMetadata *type metadata accessor for MenstrualCyclesWidgetEntry.RelevanceScore()
{
  return &type metadata for MenstrualCyclesWidgetEntry.RelevanceScore;
}

uint64_t sub_23DE86F44(uint64_t a1)
{
  uint64_t v2;

  sub_23DE7349C(0, &qword_25432B9E8, (uint64_t (*)(uint64_t))MEMORY[0x24BDCB878], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1C68]);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_23DE86F98(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char v20;
  uint64_t v21;
  void (*v22)(char *, uint64_t);
  uint64_t result;
  uint64_t v24;
  BOOL v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void (*v31)(char *, uint64_t, uint64_t);
  uint64_t v32;

  v2 = sub_23DE87528();
  v3 = *(_QWORD *)(v2 - 8);
  v4 = MEMORY[0x24BDAC7A8](v2);
  v6 = (char *)&v27 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v4);
  v8 = (char *)&v27 - v7;
  v9 = *(_QWORD *)(a1 + 16);
  if (v9)
  {
    sub_23DE871EC();
    v10 = sub_23DE87BF4();
    v11 = 0;
    v12 = *(unsigned __int8 *)(v3 + 80);
    v28 = v9;
    v29 = a1 + ((v12 + 32) & ~v12);
    v13 = *(_QWORD *)(v3 + 72);
    v31 = *(void (**)(char *, uint64_t, uint64_t))(v3 + 16);
    v32 = v10 + 56;
    while (1)
    {
      v30 = v11;
      v31(v8, v29 + v13 * v11, v2);
      sub_23DE8725C(&qword_256D0D7C8, MEMORY[0x24BDCF2A8]);
      v14 = sub_23DE87AB0();
      v15 = ~(-1 << *(_BYTE *)(v10 + 32));
      v16 = v14 & v15;
      v17 = (v14 & (unint64_t)v15) >> 6;
      v18 = *(_QWORD *)(v32 + 8 * v17);
      v19 = 1 << (v14 & v15);
      if ((v19 & v18) != 0)
      {
        do
        {
          v31(v6, *(_QWORD *)(v10 + 48) + v16 * v13, v2);
          sub_23DE8725C(&qword_256D0D7D0, MEMORY[0x24BDCF2C0]);
          v20 = sub_23DE87AC8();
          v21 = v3;
          v22 = *(void (**)(char *, uint64_t))(v3 + 8);
          v22(v6, v2);
          if ((v20 & 1) != 0)
          {
            v22(v8, v2);
            v3 = v21;
            v9 = v28;
            goto LABEL_4;
          }
          v16 = (v16 + 1) & v15;
          v17 = v16 >> 6;
          v18 = *(_QWORD *)(v32 + 8 * (v16 >> 6));
          v19 = 1 << v16;
          v3 = v21;
        }
        while ((v18 & (1 << v16)) != 0);
        v9 = v28;
      }
      *(_QWORD *)(v32 + 8 * v17) = v19 | v18;
      result = (*(uint64_t (**)(unint64_t, char *, uint64_t))(v3 + 32))(*(_QWORD *)(v10 + 48) + v16 * v13, v8, v2);
      v24 = *(_QWORD *)(v10 + 16);
      v25 = __OFADD__(v24, 1);
      v26 = v24 + 1;
      if (v25)
        break;
      *(_QWORD *)(v10 + 16) = v26;
LABEL_4:
      v11 = v30 + 1;
      if (v30 + 1 == v9)
        return v10;
    }
    __break(1u);
  }
  else
  {
    return MEMORY[0x24BEE4B08];
  }
  return result;
}

void sub_23DE871EC()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_256D0D7C0)
  {
    sub_23DE87528();
    sub_23DE8725C(&qword_256D0D7C8, MEMORY[0x24BDCF2A8]);
    v0 = sub_23DE87C00();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_256D0D7C0);
  }
}

uint64_t sub_23DE8725C(unint64_t *a1, uint64_t a2)
{
  uint64_t result;
  uint64_t v5;

  result = *a1;
  if (!result)
  {
    v5 = sub_23DE87528();
    result = MEMORY[0x2426473FC](a2, v5);
    atomic_store(result, a1);
  }
  return result;
}

unint64_t WidgetFamily.menstrualCyclesImageName(for:)()
{
  return 0xD00000000000001FLL;
}

uint64_t sub_23DE872B8()
{
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for ResourceBundleClass()
{
  return objc_opt_self();
}

uint64_t sub_23DE872E8()
{
  return MEMORY[0x24BDB55F0]();
}

uint64_t sub_23DE872F4()
{
  return MEMORY[0x24BDB55F8]();
}

uint64_t sub_23DE87300()
{
  return MEMORY[0x24BDB5600]();
}

uint64_t sub_23DE8730C()
{
  return MEMORY[0x24BDB5628]();
}

uint64_t sub_23DE87318()
{
  return MEMORY[0x24BDB5630]();
}

uint64_t sub_23DE87324()
{
  return MEMORY[0x24BDCB828]();
}

uint64_t sub_23DE87330()
{
  return MEMORY[0x24BDCB848]();
}

uint64_t sub_23DE8733C()
{
  return MEMORY[0x24BDCB868]();
}

uint64_t sub_23DE87348()
{
  return MEMORY[0x24BDCB878]();
}

uint64_t sub_23DE87354()
{
  return MEMORY[0x24BDCBC48]();
}

uint64_t sub_23DE87360()
{
  return MEMORY[0x24BDCBCC8]();
}

uint64_t sub_23DE8736C()
{
  return MEMORY[0x24BDCBCE0]();
}

uint64_t sub_23DE87378()
{
  return MEMORY[0x24BDCBD08]();
}

uint64_t sub_23DE87384()
{
  return MEMORY[0x24BDCBD10]();
}

uint64_t sub_23DE87390()
{
  return MEMORY[0x24BDCBD18]();
}

uint64_t sub_23DE8739C()
{
  return MEMORY[0x24BDCBD28]();
}

uint64_t sub_23DE873A8()
{
  return MEMORY[0x24BDCBD38]();
}

uint64_t sub_23DE873B4()
{
  return MEMORY[0x24BDCBD48]();
}

uint64_t sub_23DE873C0()
{
  return MEMORY[0x24BDCBD60]();
}

uint64_t sub_23DE873CC()
{
  return MEMORY[0x24BDCBD68]();
}

uint64_t sub_23DE873D8()
{
  return MEMORY[0x24BDCBD70]();
}

uint64_t sub_23DE873E4()
{
  return MEMORY[0x24BDCBD78]();
}

uint64_t sub_23DE873F0()
{
  return MEMORY[0x24BDCBDA8]();
}

uint64_t sub_23DE873FC()
{
  return MEMORY[0x24BDCBDE0]();
}

uint64_t sub_23DE87408()
{
  return MEMORY[0x24BDCC6D8]();
}

uint64_t sub_23DE87414()
{
  return MEMORY[0x24BDCDA68]();
}

uint64_t sub_23DE87420()
{
  return MEMORY[0x24BDCE330]();
}

uint64_t sub_23DE8742C()
{
  return MEMORY[0x24BDCE5D8]();
}

uint64_t sub_23DE87438()
{
  return MEMORY[0x24BDCE5E8]();
}

uint64_t sub_23DE87444()
{
  return MEMORY[0x24BDCE878]();
}

uint64_t sub_23DE87450()
{
  return MEMORY[0x24BDCE8F8]();
}

uint64_t sub_23DE8745C()
{
  return MEMORY[0x24BDCE900]();
}

uint64_t sub_23DE87468()
{
  return MEMORY[0x24BDCE9B0]();
}

uint64_t sub_23DE87474()
{
  return MEMORY[0x24BDCEA40]();
}

uint64_t sub_23DE87480()
{
  return MEMORY[0x24BDCEA58]();
}

uint64_t sub_23DE8748C()
{
  return MEMORY[0x24BDCED58]();
}

uint64_t sub_23DE87498()
{
  return MEMORY[0x24BDCEEA8]();
}

uint64_t sub_23DE874A4()
{
  return MEMORY[0x24BDCEF80]();
}

uint64_t sub_23DE874B0()
{
  return MEMORY[0x24BDCEFA0]();
}

uint64_t sub_23DE874BC()
{
  return MEMORY[0x24BDCF028]();
}

uint64_t sub_23DE874C8()
{
  return MEMORY[0x24BDCF040]();
}

uint64_t sub_23DE874D4()
{
  return MEMORY[0x24BDCF050]();
}

uint64_t sub_23DE874E0()
{
  return MEMORY[0x24BDCF058]();
}

uint64_t sub_23DE874EC()
{
  return MEMORY[0x24BDCF078]();
}

uint64_t sub_23DE874F8()
{
  return MEMORY[0x24BDCF0B8]();
}

uint64_t sub_23DE87504()
{
  return MEMORY[0x24BDCF140]();
}

uint64_t sub_23DE87510()
{
  return MEMORY[0x24BDCF160]();
}

uint64_t sub_23DE8751C()
{
  return MEMORY[0x24BDCF1B0]();
}

uint64_t sub_23DE87528()
{
  return MEMORY[0x24BDCF290]();
}

uint64_t sub_23DE87534()
{
  return MEMORY[0x24BDCF2D8]();
}

uint64_t sub_23DE87540()
{
  return MEMORY[0x24BDCF510]();
}

uint64_t sub_23DE8754C()
{
  return MEMORY[0x24BE46C48]();
}

uint64_t sub_23DE87558()
{
  return MEMORY[0x24BE46C58]();
}

uint64_t sub_23DE87564()
{
  return MEMORY[0x24BE46C68]();
}

uint64_t sub_23DE87570()
{
  return MEMORY[0x24BE46C88]();
}

uint64_t sub_23DE8757C()
{
  return MEMORY[0x24BE46C90]();
}

uint64_t sub_23DE87588()
{
  return MEMORY[0x24BE46CB0]();
}

uint64_t sub_23DE87594()
{
  return MEMORY[0x24BEE76F0]();
}

uint64_t sub_23DE875A0()
{
  return MEMORY[0x24BEE78A8]();
}

uint64_t sub_23DE875AC()
{
  return MEMORY[0x24BEE78C0]();
}

uint64_t sub_23DE875B8()
{
  return MEMORY[0x24BEE78D8]();
}

uint64_t sub_23DE875C4()
{
  return MEMORY[0x24BDEB040]();
}

uint64_t sub_23DE875D0()
{
  return MEMORY[0x24BE46CC0]();
}

uint64_t sub_23DE875DC()
{
  return MEMORY[0x24BDEB3E0]();
}

uint64_t sub_23DE875E8()
{
  return MEMORY[0x24BDEB418]();
}

uint64_t sub_23DE875F4()
{
  return MEMORY[0x24BDEBED0]();
}

uint64_t sub_23DE87600()
{
  return MEMORY[0x24BDEC530]();
}

uint64_t sub_23DE8760C()
{
  return MEMORY[0x24BDECF50]();
}

uint64_t sub_23DE87618()
{
  return MEMORY[0x24BDED290]();
}

uint64_t sub_23DE87624()
{
  return MEMORY[0x24BDED2D0]();
}

uint64_t sub_23DE87630()
{
  return MEMORY[0x24BDEDBA8]();
}

uint64_t sub_23DE8763C()
{
  return MEMORY[0x24BE46CC8]();
}

uint64_t sub_23DE87648()
{
  return MEMORY[0x24BE46CD0]();
}

uint64_t sub_23DE87654()
{
  return MEMORY[0x24BE46CD8]();
}

uint64_t sub_23DE87660()
{
  return MEMORY[0x24BE46CE0]();
}

uint64_t sub_23DE8766C()
{
  return MEMORY[0x24BDEDEE8]();
}

uint64_t sub_23DE87678()
{
  return MEMORY[0x24BDEE020]();
}

uint64_t sub_23DE87684()
{
  return MEMORY[0x24BDEE148]();
}

uint64_t sub_23DE87690()
{
  return MEMORY[0x24BDEE150]();
}

uint64_t sub_23DE8769C()
{
  return MEMORY[0x24BDEE190]();
}

uint64_t sub_23DE876A8()
{
  return MEMORY[0x24BDEE198]();
}

uint64_t sub_23DE876B4()
{
  return MEMORY[0x24BDEE288]();
}

uint64_t sub_23DE876C0()
{
  return MEMORY[0x24BDEE290]();
}

uint64_t sub_23DE876CC()
{
  return MEMORY[0x24BDEE390]();
}

uint64_t sub_23DE876D8()
{
  return MEMORY[0x24BDEE3A0]();
}

uint64_t sub_23DE876E4()
{
  return MEMORY[0x24BDFAAC0]();
}

uint64_t sub_23DE876F0()
{
  return MEMORY[0x24BDFAAE8]();
}

uint64_t sub_23DE876FC()
{
  return MEMORY[0x24BDFAB60]();
}

uint64_t sub_23DE87708()
{
  return MEMORY[0x24BDEE490]();
}

uint64_t sub_23DE87714()
{
  return MEMORY[0x24BDEE4A0]();
}

uint64_t sub_23DE87720()
{
  return MEMORY[0x24BDEE4E0]();
}

uint64_t sub_23DE8772C()
{
  return MEMORY[0x24BDEE4F8]();
}

uint64_t sub_23DE87738()
{
  return MEMORY[0x24BDEE530]();
}

uint64_t sub_23DE87744()
{
  return MEMORY[0x24BDEEA50]();
}

uint64_t sub_23DE87750()
{
  return MEMORY[0x24BDEED50]();
}

uint64_t sub_23DE8775C()
{
  return MEMORY[0x24BDEED88]();
}

uint64_t sub_23DE87768()
{
  return MEMORY[0x24BDEEF78]();
}

uint64_t sub_23DE87774()
{
  return MEMORY[0x24BDFAB90]();
}

uint64_t sub_23DE87780()
{
  return MEMORY[0x24BDFABA0]();
}

uint64_t sub_23DE8778C()
{
  return MEMORY[0x24BDFABC0]();
}

uint64_t sub_23DE87798()
{
  return MEMORY[0x24BDEF318]();
}

uint64_t sub_23DE877A4()
{
  return MEMORY[0x24BDEF3A0]();
}

uint64_t sub_23DE877B0()
{
  return MEMORY[0x24BDEF3B8]();
}

uint64_t sub_23DE877BC()
{
  return MEMORY[0x24BDFABF0]();
}

uint64_t sub_23DE877C8()
{
  return MEMORY[0x24BDF0DC8]();
}

uint64_t sub_23DE877D4()
{
  return MEMORY[0x24BDF1008]();
}

uint64_t sub_23DE877E0()
{
  return MEMORY[0x24BDF1088]();
}

uint64_t sub_23DE877EC()
{
  return MEMORY[0x24BDF1430]();
}

uint64_t sub_23DE877F8()
{
  return MEMORY[0x24BDF14A8]();
}

uint64_t sub_23DE87804()
{
  return MEMORY[0x24BDF14C8]();
}

uint64_t sub_23DE87810()
{
  return MEMORY[0x24BDF1678]();
}

uint64_t sub_23DE8781C()
{
  return MEMORY[0x24BDF16A8]();
}

uint64_t sub_23DE87828()
{
  return MEMORY[0x24BDF1700]();
}

uint64_t sub_23DE87834()
{
  return MEMORY[0x24BDF1768]();
}

uint64_t sub_23DE87840()
{
  return MEMORY[0x24BDF1798]();
}

uint64_t sub_23DE8784C()
{
  return MEMORY[0x24BDF17D8]();
}

uint64_t sub_23DE87858()
{
  return MEMORY[0x24BDF1818]();
}

uint64_t sub_23DE87864()
{
  return MEMORY[0x24BDF1900]();
}

uint64_t sub_23DE87870()
{
  return MEMORY[0x24BDF1D18]();
}

uint64_t sub_23DE8787C()
{
  return MEMORY[0x24BDF1DC8]();
}

uint64_t sub_23DE87888()
{
  return MEMORY[0x24BDF1FC0]();
}

uint64_t sub_23DE87894()
{
  return MEMORY[0x24BDF1FF0]();
}

uint64_t sub_23DE878A0()
{
  return MEMORY[0x24BDFAC08]();
}

uint64_t sub_23DE878AC()
{
  return MEMORY[0x24BDFAC48]();
}

uint64_t sub_23DE878B8()
{
  return MEMORY[0x24BDF2088]();
}

uint64_t sub_23DE878C4()
{
  return MEMORY[0x24BDF20A0]();
}

uint64_t sub_23DE878D0()
{
  return MEMORY[0x24BDF2158]();
}

uint64_t sub_23DE878DC()
{
  return MEMORY[0x24BDF2260]();
}

uint64_t sub_23DE878E8()
{
  return MEMORY[0x24BDF2698]();
}

uint64_t sub_23DE878F4()
{
  return MEMORY[0x24BDF2B40]();
}

uint64_t sub_23DE87900()
{
  return MEMORY[0x24BDF2DE0]();
}

uint64_t sub_23DE8790C()
{
  return MEMORY[0x24BDF3CF0]();
}

uint64_t sub_23DE87918()
{
  return MEMORY[0x24BDF3D18]();
}

uint64_t sub_23DE87924()
{
  return MEMORY[0x24BDF3EB0]();
}

uint64_t sub_23DE87930()
{
  return MEMORY[0x24BDF3EC0]();
}

uint64_t sub_23DE8793C()
{
  return MEMORY[0x24BDF3ED0]();
}

uint64_t sub_23DE87948()
{
  return MEMORY[0x24BDF3ED8]();
}

uint64_t sub_23DE87954()
{
  return MEMORY[0x24BDF3FE8]();
}

uint64_t sub_23DE87960()
{
  return MEMORY[0x24BDF40D8]();
}

uint64_t sub_23DE8796C()
{
  return MEMORY[0x24BDF4130]();
}

uint64_t sub_23DE87978()
{
  return MEMORY[0x24BDF46E0]();
}

uint64_t sub_23DE87984()
{
  return MEMORY[0x24BDF4730]();
}

uint64_t sub_23DE87990()
{
  return MEMORY[0x24BDF4E58]();
}

uint64_t sub_23DE8799C()
{
  return MEMORY[0x24BDF4EC0]();
}

uint64_t sub_23DE879A8()
{
  return MEMORY[0x24BDF4F18]();
}

uint64_t sub_23DE879B4()
{
  return MEMORY[0x24BDD2458]();
}

uint64_t sub_23DE879C0()
{
  return MEMORY[0x24BDD2468]();
}

uint64_t sub_23DE879CC()
{
  return MEMORY[0x24BDD2488]();
}

uint64_t sub_23DE879D8()
{
  return MEMORY[0x24BDFACA8]();
}

uint64_t sub_23DE879E4()
{
  return MEMORY[0x24BDFACB0]();
}

uint64_t sub_23DE879F0()
{
  return MEMORY[0x24BDFACC0]();
}

uint64_t sub_23DE879FC()
{
  return MEMORY[0x24BDFADE0]();
}

uint64_t sub_23DE87A08()
{
  return MEMORY[0x24BDFADF8]();
}

uint64_t sub_23DE87A14()
{
  return MEMORY[0x24BDFAF10]();
}

uint64_t sub_23DE87A20()
{
  return MEMORY[0x24BDFB0B8]();
}

uint64_t sub_23DE87A2C()
{
  return MEMORY[0x24BDFB158]();
}

uint64_t sub_23DE87A38()
{
  return MEMORY[0x24BDFB160]();
}

uint64_t sub_23DE87A44()
{
  return MEMORY[0x24BDFB188]();
}

uint64_t sub_23DE87A50()
{
  return MEMORY[0x24BDFB190]();
}

uint64_t sub_23DE87A5C()
{
  return MEMORY[0x24BDFB198]();
}

uint64_t sub_23DE87A68()
{
  return MEMORY[0x24BDFB268]();
}

uint64_t sub_23DE87A74()
{
  return MEMORY[0x24BDFB270]();
}

uint64_t sub_23DE87A80()
{
  return MEMORY[0x24BDFB310]();
}

uint64_t sub_23DE87A8C()
{
  return MEMORY[0x24BDFB320]();
}

uint64_t sub_23DE87A98()
{
  return MEMORY[0x24BDFB4D0]();
}

uint64_t sub_23DE87AA4()
{
  return MEMORY[0x24BDFB4D8]();
}

uint64_t sub_23DE87AB0()
{
  return MEMORY[0x24BEE0610]();
}

uint64_t sub_23DE87ABC()
{
  return MEMORY[0x24BEE07E0]();
}

uint64_t sub_23DE87AC8()
{
  return MEMORY[0x24BEE0980]();
}

uint64_t sub_23DE87AD4()
{
  return MEMORY[0x24BDCF978]();
}

uint64_t sub_23DE87AE0()
{
  return MEMORY[0x24BDCF990]();
}

uint64_t sub_23DE87AEC()
{
  return MEMORY[0x24BDCF9E0]();
}

uint64_t sub_23DE87AF8()
{
  return MEMORY[0x24BDCFA28]();
}

uint64_t sub_23DE87B04()
{
  return MEMORY[0x24BDCFB20]();
}

uint64_t sub_23DE87B10()
{
  return MEMORY[0x24BEE09F0]();
}

uint64_t sub_23DE87B1C()
{
  return MEMORY[0x24BEE0BC0]();
}

uint64_t sub_23DE87B28()
{
  return MEMORY[0x24BEE0C10]();
}

uint64_t sub_23DE87B34()
{
  return MEMORY[0x24BDCFBC8]();
}

uint64_t sub_23DE87B40()
{
  return MEMORY[0x24BEE1120]();
}

uint64_t sub_23DE87B4C()
{
  return MEMORY[0x24BEE6828]();
}

uint64_t sub_23DE87B58()
{
  return MEMORY[0x24BEE6830]();
}

uint64_t sub_23DE87B64()
{
  return MEMORY[0x24BEE7908]();
}

uint64_t sub_23DE87B70()
{
  return MEMORY[0x24BEE7910]();
}

uint64_t sub_23DE87B7C()
{
  return MEMORY[0x24BEE7920]();
}

uint64_t sub_23DE87B88()
{
  return MEMORY[0x24BEE7928]();
}

uint64_t sub_23DE87B94()
{
  return MEMORY[0x24BDD2560]();
}

uint64_t sub_23DE87BA0()
{
  return MEMORY[0x24BE46CE8]();
}

uint64_t sub_23DE87BAC()
{
  return MEMORY[0x24BE46CF8]();
}

uint64_t sub_23DE87BB8()
{
  return MEMORY[0x24BEE5BC0]();
}

uint64_t sub_23DE87BC4()
{
  return MEMORY[0x24BEE1C68]();
}

uint64_t sub_23DE87BD0()
{
  return MEMORY[0x24BEE1F00]();
}

uint64_t sub_23DE87BDC()
{
  return MEMORY[0x24BEE1F48]();
}

uint64_t sub_23DE87BE8()
{
  return MEMORY[0x24BEE20A8]();
}

uint64_t sub_23DE87BF4()
{
  return MEMORY[0x24BEE24D0]();
}

uint64_t sub_23DE87C00()
{
  return MEMORY[0x24BEE24D8]();
}

uint64_t sub_23DE87C0C()
{
  return MEMORY[0x24BEE2510]();
}

uint64_t sub_23DE87C18()
{
  return MEMORY[0x24BEE2518]();
}

uint64_t sub_23DE87C24()
{
  return MEMORY[0x24BEE2658]();
}

uint64_t sub_23DE87C30()
{
  return MEMORY[0x24BEE2838]();
}

uint64_t sub_23DE87C3C()
{
  return MEMORY[0x24BEE2F40]();
}

uint64_t sub_23DE87C48()
{
  return MEMORY[0x24BEE2F48]();
}

uint64_t sub_23DE87C54()
{
  return MEMORY[0x24BEE3068]();
}

uint64_t sub_23DE87C60()
{
  return MEMORY[0x24BEE30B0]();
}

uint64_t sub_23DE87C6C()
{
  return MEMORY[0x24BEE3568]();
}

uint64_t sub_23DE87C78()
{
  return MEMORY[0x24BEE3598]();
}

uint64_t sub_23DE87C84()
{
  return MEMORY[0x24BEE7040]();
}

uint64_t sub_23DE87C90()
{
  return MEMORY[0x24BEE3A20]();
}

uint64_t sub_23DE87C9C()
{
  return MEMORY[0x24BEE3DE0]();
}

uint64_t sub_23DE87CA8()
{
  return MEMORY[0x24BEE42E0]();
}

uint64_t sub_23DE87CB4()
{
  return MEMORY[0x24BEE4310]();
}

uint64_t sub_23DE87CC0()
{
  return MEMORY[0x24BEE4328]();
}

uint64_t sub_23DE87CCC()
{
  return MEMORY[0x24BEE4A98]();
}

uint64_t HKSensitiveLogItem()
{
  return MEMORY[0x24BDD3730]();
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

uint64_t swift_getExistentialTypeMetadata()
{
  return MEMORY[0x24BEE4D28]();
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

uint64_t swift_getTupleTypeLayout3()
{
  return MEMORY[0x24BEE4DE8]();
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

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x24BEE4E20]();
}

uint64_t swift_initEnumMetadataSinglePayload()
{
  return MEMORY[0x24BEE4E40]();
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

uint64_t swift_projectBox()
{
  return MEMORY[0x24BEE4ED0]();
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

uint64_t swift_updateClassMetadata2()
{
  return MEMORY[0x24BEE5008]();
}

uint64_t swift_weakDestroy()
{
  return MEMORY[0x24BEE5028]();
}

uint64_t swift_weakInit()
{
  return MEMORY[0x24BEE5030]();
}

