uint64_t AlarmConfirmation.init(snippetModel:)@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;

  sub_235FFC224();
  sub_235FF1BF4(&qword_25639C320, (uint64_t (*)(uint64_t))MEMORY[0x24BEAE580], MEMORY[0x24BEAE520]);
  *a2 = sub_235FFBF54();
  a2[1] = v4;
  v5 = type metadata accessor for AlarmConfirmation();
  return sub_235FF1BAC(a1, (uint64_t)a2 + *(int *)(v5 + 20), (uint64_t (*)(_QWORD))MEMORY[0x24BEA82C0]);
}

uint64_t type metadata accessor for AlarmConfirmation()
{
  uint64_t result;

  result = qword_25639C390;
  if (!qword_25639C390)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_235FF14C4(void **a1)
{
  void *v1;
  id v2;
  uint64_t v3;
  uint64_t result;

  v1 = *a1;
  if (*a1)
  {
    type metadata accessor for AlarmConfirmation();
    sub_235FFBE94();
    v2 = v1;
    v3 = sub_235FFBE64();
    sub_235FF5B90(v3);
    swift_bridgeObjectRelease();
    sub_235FFC218();

    return swift_bridgeObjectRelease();
  }
  else
  {
    sub_235FFC224();
    sub_235FF1BF4(&qword_25639C320, (uint64_t (*)(uint64_t))MEMORY[0x24BEAE580], MEMORY[0x24BEAE520]);
    result = sub_235FFBF48();
    __break(1u);
  }
  return result;
}

uint64_t sub_235FF15B4@<X0>(void (*a1)(void)@<X1>, uint64_t a2@<X8>)
{
  uint64_t result;
  uint64_t v5;
  char v6;
  uint64_t v7;

  type metadata accessor for AlarmConfirmation();
  a1();
  sub_235FF2600();
  result = sub_235FFC050();
  *(_QWORD *)a2 = result;
  *(_QWORD *)(a2 + 8) = v5;
  *(_BYTE *)(a2 + 16) = v6 & 1;
  *(_QWORD *)(a2 + 24) = v7;
  return result;
}

uint64_t AlarmConfirmation.body.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;
  uint64_t v6;

  v1 = *(_QWORD *)(type metadata accessor for AlarmConfirmation() - 8);
  v2 = *(_QWORD *)(v1 + 64);
  MEMORY[0x24BDAC7A8]();
  sub_235FF1B24(v0, (uint64_t)&v6 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0));
  v3 = (*(unsigned __int8 *)(v1 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80);
  v4 = swift_allocObject();
  sub_235FF1BAC((uint64_t)&v6 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0), v4 + v3, (uint64_t (*)(_QWORD))type metadata accessor for AlarmConfirmation);
  sub_235FFC17C();
  sub_235FF1BF4(&qword_25639C330, (uint64_t (*)(uint64_t))MEMORY[0x24BEADCE0], MEMORY[0x24BEADCC0]);
  return sub_235FFC158();
}

uint64_t sub_235FF1718@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
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
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v27;
  uint64_t v28;
  void (*v29)(char *, uint64_t);
  uint64_t v30;
  void (*v31)(char *, uint64_t, uint64_t);
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

  v37 = a2;
  v38 = sub_235FFC128();
  v3 = *(_QWORD *)(v38 - 8);
  MEMORY[0x24BDAC7A8]();
  v5 = (char *)&v27 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = *(_QWORD *)(type metadata accessor for AlarmConfirmation() - 8);
  v7 = *(_QWORD *)(v6 + 64);
  MEMORY[0x24BDAC7A8]();
  v8 = (char *)&v27 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_25639C3D8);
  v30 = *(_QWORD *)(v9 - 8);
  MEMORY[0x24BDAC7A8]();
  v11 = (char *)&v27 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v32 = __swift_instantiateConcreteTypeFromMangledName(&qword_25639C3E0);
  v36 = *(_QWORD *)(v32 - 8);
  MEMORY[0x24BDAC7A8]();
  v13 = (char *)&v27 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v28 = a1;
  sub_235FF1B24(a1, (uint64_t)v8);
  v14 = *(unsigned __int8 *)(v6 + 80);
  v35 = ((v14 + 16) & ~v14) + v7;
  v15 = (v14 + 16) & ~v14;
  v33 = v15;
  v34 = v14 | 7;
  v16 = swift_allocObject();
  sub_235FF1BAC((uint64_t)v8, v16 + v15, (uint64_t (*)(_QWORD))type metadata accessor for AlarmConfirmation);
  v40 = a1;
  sub_235FFC110();
  v17 = *MEMORY[0x24BEAD960];
  v31 = *(void (**)(char *, uint64_t, uint64_t))(v3 + 104);
  v18 = v38;
  v31(v5, v17, v38);
  v19 = sub_235FF247C(&qword_25639C3E8, &qword_25639C3D8, MEMORY[0x24BDF43B0]);
  sub_235FFC068();
  v29 = *(void (**)(char *, uint64_t))(v3 + 8);
  v29(v5, v18);
  v30 = *(_QWORD *)(v30 + 8);
  ((void (*)(char *, uint64_t))v30)(v11, v9);
  v44 = v9;
  v45 = v19;
  swift_getOpaqueTypeConformance2();
  v20 = v32;
  v21 = sub_235FFC05C();
  v36 = *(_QWORD *)(v36 + 8);
  ((void (*)(char *, uint64_t))v36)(v13, v20);
  v46 = MEMORY[0x24BDF4780];
  v47 = MEMORY[0x24BEAD938];
  v44 = v21;
  v22 = v28;
  sub_235FF1B24(v28, (uint64_t)v8);
  v23 = swift_allocObject();
  sub_235FF1BAC((uint64_t)v8, v23 + v33, (uint64_t (*)(_QWORD))type metadata accessor for AlarmConfirmation);
  v39 = v22;
  sub_235FFC110();
  v24 = v38;
  v31(v5, *MEMORY[0x24BEAD970], v38);
  sub_235FFC068();
  v29(v5, v24);
  ((void (*)(char *, uint64_t))v30)(v11, v9);
  v25 = sub_235FFC05C();
  ((void (*)(char *, uint64_t))v36)(v13, v20);
  v43 = MEMORY[0x24BEAD938];
  v42 = MEMORY[0x24BDF4780];
  v41 = v25;
  return sub_235FFC170();
}

uint64_t sub_235FF1B24(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for AlarmConfirmation();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x23B7EA178]((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t sub_235FF1BAC(uint64_t a1, uint64_t a2, uint64_t (*a3)(_QWORD))
{
  uint64_t v5;

  v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_235FF1BF4(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = a2(255);
    result = MEMORY[0x23B7EA190](a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_235FF1C34()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_235FF1C4C()
{
  return sub_235FFC0BC();
}

uint64_t sub_235FF1C64(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v7;

  v2 = *(_QWORD *)(a1 - 8);
  v3 = *(_QWORD *)(v2 + 64);
  MEMORY[0x24BDAC7A8]();
  sub_235FF1B24(v1, (uint64_t)&v7 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0));
  v4 = (*(unsigned __int8 *)(v2 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  v5 = swift_allocObject();
  sub_235FF1BAC((uint64_t)&v7 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0), v5 + v4, (uint64_t (*)(_QWORD))type metadata accessor for AlarmConfirmation);
  sub_235FFC17C();
  sub_235FF1BF4(&qword_25639C330, (uint64_t (*)(uint64_t))MEMORY[0x24BEADCE0], MEMORY[0x24BEADCC0]);
  return sub_235FFC158();
}

char *initializeBufferWithCopyOfBuffer for AlarmConfirmation(char *a1, char **a2, uint64_t a3)
{
  int v4;
  char *v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  void (*v11)(char *, uint64_t, uint64_t);
  int *v12;
  uint64_t v13;
  char *v14;
  _QWORD *v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;

  v4 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  v5 = *a2;
  *(_QWORD *)a1 = *a2;
  if ((v4 & 0x20000) != 0)
  {
    a1 = &v5[(v4 + 16) & ~(unint64_t)v4];
    swift_retain();
  }
  else
  {
    *((_QWORD *)a1 + 1) = a2[1];
    v6 = *(int *)(a3 + 20);
    v7 = &a1[v6];
    v8 = (uint64_t)a2 + v6;
    v9 = v5;
    v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_25639C328);
    v11 = *(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 16);
    v11(v7, v8, v10);
    v12 = (int *)sub_235FFBE94();
    v11(&v7[v12[5]], v8 + v12[5], v10);
    v13 = v12[6];
    v14 = &v7[v13];
    v15 = (_QWORD *)(v8 + v13);
    v16 = v15[1];
    *(_QWORD *)v14 = *v15;
    *((_QWORD *)v14 + 1) = v16;
    v17 = v12[7];
    v18 = &v7[v17];
    v19 = v8 + v17;
    swift_bridgeObjectRetain();
    v11(v18, v19, v10);
  }
  return a1;
}

uint64_t destroy for AlarmConfirmation(id *a1, uint64_t a2)
{
  char *v4;
  uint64_t v5;
  uint64_t v6;
  void (*v8)(char *, uint64_t);

  v4 = (char *)a1 + *(int *)(a2 + 20);
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_25639C328);
  v8 = *(void (**)(char *, uint64_t))(*(_QWORD *)(v5 - 8) + 8);
  v8(v4, v5);
  v6 = sub_235FFBE94();
  v8(&v4[*(int *)(v6 + 20)], v5);
  swift_bridgeObjectRelease();
  return ((uint64_t (*)(char *, uint64_t))v8)(&v4[*(int *)(v6 + 28)], v5);
}

_QWORD *initializeWithCopy for AlarmConfirmation(_QWORD *a1, uint64_t a2, uint64_t a3)
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  void (*v11)(char *, uint64_t, uint64_t);
  int *v12;
  uint64_t v13;
  char *v14;
  _QWORD *v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;

  v4 = *(void **)a2;
  v5 = *(_QWORD *)(a2 + 8);
  *a1 = *(_QWORD *)a2;
  a1[1] = v5;
  v6 = *(int *)(a3 + 20);
  v7 = (char *)a1 + v6;
  v8 = a2 + v6;
  v9 = v4;
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_25639C328);
  v11 = *(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 16);
  v11(v7, v8, v10);
  v12 = (int *)sub_235FFBE94();
  v11(&v7[v12[5]], v8 + v12[5], v10);
  v13 = v12[6];
  v14 = &v7[v13];
  v15 = (_QWORD *)(v8 + v13);
  v16 = v15[1];
  *(_QWORD *)v14 = *v15;
  *((_QWORD *)v14 + 1) = v16;
  v17 = v12[7];
  v18 = &v7[v17];
  v19 = v8 + v17;
  swift_bridgeObjectRetain();
  v11(v18, v19, v10);
  return a1;
}

uint64_t assignWithCopy for AlarmConfirmation(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(uint64_t, uint64_t, uint64_t);
  int *v14;
  uint64_t v15;
  _QWORD *v16;
  _QWORD *v17;

  v6 = *(void **)a1;
  v7 = *(void **)a2;
  *(_QWORD *)a1 = *(_QWORD *)a2;
  v8 = v7;

  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  v9 = *(int *)(a3 + 20);
  v10 = a1 + v9;
  v11 = a2 + v9;
  v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_25639C328);
  v13 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 24);
  v13(v10, v11, v12);
  v14 = (int *)sub_235FFBE94();
  v13(v10 + v14[5], v11 + v14[5], v12);
  v15 = v14[6];
  v16 = (_QWORD *)(v10 + v15);
  v17 = (_QWORD *)(v11 + v15);
  *v16 = *v17;
  v16[1] = v17[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v13(v10 + v14[7], v11 + v14[7], v12);
  return a1;
}

_OWORD *initializeWithTake for AlarmConfirmation(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  uint64_t v4;
  char *v5;
  char *v6;
  uint64_t v7;
  void (*v8)(char *, char *, uint64_t);
  int *v9;

  *a1 = *a2;
  v4 = *(int *)(a3 + 20);
  v5 = (char *)a1 + v4;
  v6 = (char *)a2 + v4;
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_25639C328);
  v8 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v7 - 8) + 32);
  v8(v5, v6, v7);
  v9 = (int *)sub_235FFBE94();
  v8(&v5[v9[5]], &v6[v9[5]], v7);
  *(_OWORD *)&v5[v9[6]] = *(_OWORD *)&v6[v9[6]];
  v8(&v5[v9[7]], &v6[v9[7]], v7);
  return a1;
}

uint64_t assignWithTake for AlarmConfirmation(uint64_t a1, _QWORD *a2, uint64_t a3)
{
  void *v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  void (*v11)(uint64_t, char *, uint64_t);
  int *v12;
  uint64_t v13;
  _QWORD *v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;

  v6 = *(void **)a1;
  *(_QWORD *)a1 = *a2;

  *(_QWORD *)(a1 + 8) = a2[1];
  v7 = *(int *)(a3 + 20);
  v8 = a1 + v7;
  v9 = (char *)a2 + v7;
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_25639C328);
  v11 = *(void (**)(uint64_t, char *, uint64_t))(*(_QWORD *)(v10 - 8) + 40);
  v11(v8, v9, v10);
  v12 = (int *)sub_235FFBE94();
  v11(v8 + v12[5], &v9[v12[5]], v10);
  v13 = v12[6];
  v14 = (_QWORD *)(v8 + v13);
  v15 = &v9[v13];
  v17 = *(_QWORD *)v15;
  v16 = *((_QWORD *)v15 + 1);
  *v14 = v17;
  v14[1] = v16;
  swift_bridgeObjectRelease();
  v11(v8 + v12[7], &v9[v12[7]], v10);
  return a1;
}

uint64_t getEnumTagSinglePayload for AlarmConfirmation()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_235FF2224(char *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  int v5;
  uint64_t v9;

  if ((_DWORD)a2 == 2147483646)
  {
    v4 = *(_QWORD *)a1;
    if (*(_QWORD *)a1 >= 0xFFFFFFFFuLL)
      LODWORD(v4) = -1;
    v5 = v4 - 1;
    if (v5 < 0)
      v5 = -1;
    return (v5 + 1);
  }
  else
  {
    v9 = sub_235FFBE94();
    return (*(uint64_t (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 48))(&a1[*(int *)(a3 + 20)], a2, v9);
  }
}

uint64_t storeEnumTagSinglePayload for AlarmConfirmation()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

char *sub_235FF22B8(char *result, uint64_t a2, int a3, uint64_t a4)
{
  char *v5;
  uint64_t v7;

  v5 = result;
  if (a3 == 2147483646)
  {
    *(_QWORD *)result = a2;
  }
  else
  {
    v7 = sub_235FFBE94();
    return (char *)(*(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 56))(&v5[*(int *)(a4 + 20)], a2, a2, v7);
  }
  return result;
}

uint64_t sub_235FF232C()
{
  uint64_t result;
  unint64_t v1;

  result = sub_235FFBE94();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t sub_235FF23A0()
{
  return sub_235FF247C(&qword_25639C3C8, &qword_25639C3D0, MEMORY[0x24BEADC00]);
}

uint64_t __swift_instantiateConcreteTypeFromMangledNameAbstract(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x23B7EA184](255, (char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t sub_235FF2414@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;

  v3 = *(unsigned __int8 *)(*(_QWORD *)(type metadata accessor for AlarmConfirmation() - 8) + 80);
  return sub_235FF1718(v1 + ((v3 + 16) & ~v3), a1);
}

uint64_t sub_235FF2454()
{
  return sub_235FF25A0();
}

uint64_t sub_235FF245C@<X0>(uint64_t a1@<X8>)
{
  return sub_235FF15B4(MEMORY[0x24BEA82B8], a1);
}

uint64_t sub_235FF247C(unint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    result = MEMORY[0x23B7EA190](a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t objectdestroyTm()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  id *v3;
  char *v4;
  uint64_t v5;
  void (*v6)(char *, uint64_t);
  uint64_t v7;

  v1 = type metadata accessor for AlarmConfirmation();
  v2 = *(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80);
  v3 = (id *)(v0 + ((v2 + 16) & ~v2));

  v4 = (char *)v3 + *(int *)(v1 + 20);
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_25639C328);
  v6 = *(void (**)(char *, uint64_t))(*(_QWORD *)(v5 - 8) + 8);
  v6(v4, v5);
  v7 = sub_235FFBE94();
  v6(&v4[*(int *)(v7 + 20)], v5);
  swift_bridgeObjectRelease();
  v6(&v4[*(int *)(v7 + 28)], v5);
  return swift_deallocObject();
}

uint64_t sub_235FF2598()
{
  return sub_235FF25A0();
}

uint64_t sub_235FF25A0()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(unsigned __int8 *)(*(_QWORD *)(type metadata accessor for AlarmConfirmation() - 8) + 80);
  return sub_235FF14C4((void **)(v0 + ((v1 + 16) & ~v1)));
}

uint64_t sub_235FF25E0@<X0>(uint64_t a1@<X8>)
{
  return sub_235FF15B4(MEMORY[0x24BEA82B0], a1);
}

unint64_t sub_235FF2600()
{
  unint64_t result;

  result = qword_25639C3F0;
  if (!qword_25639C3F0)
  {
    result = MEMORY[0x23B7EA190](MEMORY[0x24BEE0D50], MEMORY[0x24BEE0D00]);
    atomic_store(result, (unint64_t *)&qword_25639C3F0);
  }
  return result;
}

uint64_t sub_235FF2644()
{
  uint64_t v0;

  v0 = sub_235FFBF0C();
  __swift_allocate_value_buffer(v0, qword_25639C3F8);
  __swift_project_value_buffer(v0, (uint64_t)qword_25639C3F8);
  return sub_235FFBF00();
}

uint64_t AlarmSelector.init(snippetModel:)@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;

  sub_235FFC224();
  sub_235FF1BF4(&qword_25639C320, (uint64_t (*)(uint64_t))MEMORY[0x24BEAE580], MEMORY[0x24BEAE520]);
  *a2 = sub_235FFBF54();
  a2[1] = v4;
  v5 = type metadata accessor for AlarmSelector(0);
  return sub_235FF1BAC(a1, (uint64_t)a2 + *(int *)(v5 + 20), (uint64_t (*)(_QWORD))MEMORY[0x24BEA82A0]);
}

uint64_t type metadata accessor for AlarmSelector(uint64_t a1)
{
  return sub_235FF46EC(a1, qword_25639C4B8);
}

uint64_t AlarmSelector.body.getter@<X0>(uint64_t a1@<X8>)
{
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
  char *v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  char *v18;
  unint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t KeyPath;
  uint64_t v26;
  uint64_t v27;
  char *v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  char *v33;
  uint64_t v34;
  uint64_t v36;
  char *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  char *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;

  v47 = a1;
  v1 = sub_235FFC200();
  v45 = *(_QWORD *)(v1 - 8);
  v46 = v1;
  MEMORY[0x24BDAC7A8](v1);
  v44 = (char *)&v36 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v3 = sub_235FFBF18();
  v42 = *(_QWORD *)(v3 - 8);
  v43 = v3;
  MEMORY[0x24BDAC7A8](v3);
  v37 = (char *)&v36 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_25639C410);
  MEMORY[0x24BDAC7A8](v5);
  v7 = (uint64_t *)((char *)&v36 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0));
  v8 = type metadata accessor for AlarmSelector(0);
  v9 = *(_QWORD *)(v8 - 8);
  v10 = *(_QWORD *)(v9 + 64);
  MEMORY[0x24BDAC7A8](v8);
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_25639C418);
  v40 = *(_QWORD *)(v11 - 8);
  MEMORY[0x24BDAC7A8](v11);
  v13 = (char *)&v36 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v41 = __swift_instantiateConcreteTypeFromMangledName(&qword_25639C420);
  v14 = *(_QWORD *)(v41 - 8);
  MEMORY[0x24BDAC7A8](v41);
  v16 = (char *)&v36 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v39 = __swift_instantiateConcreteTypeFromMangledName(&qword_25639C428);
  MEMORY[0x24BDAC7A8](v39);
  v18 = (char *)&v36 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_235FF5204(v38, (uint64_t)&v36 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0), type metadata accessor for AlarmSelector);
  v19 = (*(unsigned __int8 *)(v9 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80);
  v20 = swift_allocObject();
  sub_235FF1BAC((uint64_t)&v36 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0), v20 + v19, type metadata accessor for AlarmSelector);
  __swift_instantiateConcreteTypeFromMangledName(&qword_25639C430);
  sub_235FF247C(&qword_25639C438, &qword_25639C430, MEMORY[0x24BEADE50]);
  sub_235FFC158();
  *v7 = sub_235FFC0E0();
  v21 = *MEMORY[0x24BEADC28];
  v22 = sub_235FFC164();
  v23 = *(_QWORD *)(v22 - 8);
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(v23 + 104))(v7, v21, v22);
  (*(void (**)(uint64_t *, _QWORD, uint64_t, uint64_t))(v23 + 56))(v7, 0, 1, v22);
  v24 = sub_235FF247C(&qword_25639C440, &qword_25639C418, MEMORY[0x24BEADC00]);
  MEMORY[0x23B7E9DD0](v7, v11, v24);
  sub_235FF37DC((uint64_t)v7, &qword_25639C410);
  (*(void (**)(char *, uint64_t))(v40 + 8))(v13, v11);
  KeyPath = swift_getKeyPath();
  v27 = v42;
  v26 = v43;
  v28 = v37;
  (*(void (**)(char *, _QWORD, uint64_t))(v42 + 104))(v37, *MEMORY[0x24BDEB3F0], v43);
  v29 = (uint64_t *)&v18[*(int *)(v39 + 36)];
  v30 = __swift_instantiateConcreteTypeFromMangledName(&qword_25639C448);
  (*(void (**)(char *, char *, uint64_t))(v27 + 16))((char *)v29 + *(int *)(v30 + 28), v28, v26);
  *v29 = KeyPath;
  v31 = v41;
  (*(void (**)(char *, char *, uint64_t))(v14 + 16))(v18, v16, v41);
  (*(void (**)(char *, uint64_t))(v27 + 8))(v28, v26);
  (*(void (**)(char *, uint64_t))(v14 + 8))(v16, v31);
  v33 = v44;
  v32 = v45;
  v34 = v46;
  (*(void (**)(char *, _QWORD, uint64_t))(v45 + 104))(v44, *MEMORY[0x24BEAE368], v46);
  sub_235FF3710();
  sub_235FFC098();
  (*(void (**)(char *, uint64_t))(v32 + 8))(v33, v34);
  return sub_235FF37DC((uint64_t)v18, &qword_25639C428);
}

uint64_t sub_235FF2B68(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  _OWORD v11[2];
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  v2 = type metadata accessor for AlarmSelector(0);
  v3 = *(_QWORD *)(v2 - 8);
  v4 = *(_QWORD *)(v3 + 64);
  MEMORY[0x24BDAC7A8](v2);
  v5 = sub_235FFC1B8();
  MEMORY[0x24BDAC7A8](v5);
  v6 = sub_235FFBE7C();
  v15 = MEMORY[0x24BEE0D00];
  v16 = MEMORY[0x24BEAE5B8];
  v13 = v6;
  v14 = v7;
  v12 = 0;
  memset(v11, 0, sizeof(v11));
  sub_235FFC1AC();
  sub_235FF5204(a1, (uint64_t)v11 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0), type metadata accessor for AlarmSelector);
  v8 = (*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  v9 = swift_allocObject();
  sub_235FF1BAC((uint64_t)v11 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0), v9 + v8, type metadata accessor for AlarmSelector);
  __swift_instantiateConcreteTypeFromMangledName(&qword_25639C5B8);
  sub_235FF5114();
  return sub_235FFC188();
}

uint64_t sub_235FF2CD8()
{
  return sub_235FF50C8(sub_235FF2B68);
}

uint64_t sub_235FF2CE4(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD v10[4];

  v2 = type metadata accessor for AlarmSelector(0);
  v3 = *(_QWORD *)(v2 - 8);
  v4 = *(_QWORD *)(v3 + 64);
  v10[3] = *(_QWORD *)(a1 + *(int *)(MEMORY[0x24BDAC7A8](v2) + 20));
  sub_235FF5204(a1, (uint64_t)v10 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0), type metadata accessor for AlarmSelector);
  v5 = (*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  v6 = swift_allocObject();
  sub_235FF1BAC((uint64_t)v10 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0), v6 + v5, type metadata accessor for AlarmSelector);
  swift_bridgeObjectRetain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_25639C5D0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_25639C5D8);
  sub_235FF247C(&qword_25639C5E0, &qword_25639C5D0, MEMORY[0x24BEE12D8]);
  v7 = type metadata accessor for AlarmItemView(255);
  v8 = sub_235FF1BF4(&qword_25639C5C8, type metadata accessor for AlarmItemView, (uint64_t)&unk_235FFC698);
  v10[1] = v7;
  v10[2] = v8;
  swift_getOpaqueTypeConformance2();
  sub_235FF1BF4(&qword_25639C5E8, (uint64_t (*)(uint64_t))MEMORY[0x24BEA8310], MEMORY[0x24BEA8320]);
  return sub_235FFC11C();
}

uint64_t sub_235FF2E90@<X0>(uint64_t a1@<X0>, void **a2@<X1>, uint64_t a3@<X8>)
{
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
  char *v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t (*v24)(void);
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;
  unint64_t v28;
  uint64_t v29;
  char *v30;
  uint64_t result;
  uint64_t v32;
  id v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  char *v37;
  char *v38;
  uint64_t v39;
  uint64_t v40;
  char *v41;
  uint64_t v42;
  uint64_t v43;
  void **v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;

  v47 = a3;
  v43 = *(_QWORD *)(type metadata accessor for AlarmSelector(0) - 8);
  ((void (*)(void))MEMORY[0x24BDAC7A8])();
  v45 = v5;
  v46 = (uint64_t)&v32 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_235FFBD20();
  ((void (*)(void))MEMORY[0x24BDAC7A8])();
  v41 = (char *)&v32 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_235FFBE1C();
  ((void (*)(void))MEMORY[0x24BDAC7A8])();
  v37 = (char *)&v32 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_235FFBE04();
  ((void (*)(void))MEMORY[0x24BDAC7A8])();
  sub_235FFBDEC();
  ((void (*)(void))MEMORY[0x24BDAC7A8])();
  __swift_instantiateConcreteTypeFromMangledName(&qword_25639C5F0);
  ((void (*)(void))MEMORY[0x24BDAC7A8])();
  v9 = (char *)&v32 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_25639C5F8);
  ((void (*)(void))MEMORY[0x24BDAC7A8])();
  v11 = (char *)&v32 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v35 = *(_QWORD *)(sub_235FFBEE8() - 8);
  v12 = *(_QWORD *)(v35 + 64);
  v13 = ((uint64_t (*)(void))MEMORY[0x24BDAC7A8])();
  v36 = (uint64_t)&v32 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v13);
  v15 = (char *)&v32 - v14;
  v16 = type metadata accessor for AlarmItemView(0);
  MEMORY[0x24BDAC7A8](v16);
  v18 = (char *)&v32 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_25639C5D8);
  v39 = *(_QWORD *)(v19 - 8);
  v40 = v19;
  MEMORY[0x24BDAC7A8](v19);
  v38 = (char *)&v32 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  v42 = a1;
  sub_235FF5204(a1, (uint64_t)v15, (uint64_t (*)(_QWORD))MEMORY[0x24BEA8310]);
  v44 = a2;
  v21 = *a2;
  if (*a2)
  {
    v34 = v16;
    v33 = v21;
    sub_235FFBD5C();
    v22 = sub_235FFBD68();
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v22 - 8) + 56))(v11, 0, 1, v22);
    sub_235FFBD44();
    v23 = sub_235FFBD50();
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v23 - 8) + 56))(v9, 0, 1, v23);
    sub_235FFBDE0();
    sub_235FFBDF8();
    sub_235FFBE10();
    sub_235FFBD14();
    sub_235FFBD80();
    v24 = MEMORY[0x24BEA8310];
    sub_235FF1BAC((uint64_t)v15, (uint64_t)v18, (uint64_t (*)(_QWORD))MEMORY[0x24BEA8310]);
    *(_QWORD *)&v18[*(int *)(v34 + 20)] = v33;
    v25 = v36;
    sub_235FF5204(v42, v36, (uint64_t (*)(_QWORD))v24);
    v26 = v46;
    sub_235FF5204((uint64_t)v44, v46, type metadata accessor for AlarmSelector);
    v27 = (*(unsigned __int8 *)(v35 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v35 + 80);
    v28 = (v12 + *(unsigned __int8 *)(v43 + 80) + v27) & ~(unint64_t)*(unsigned __int8 *)(v43 + 80);
    v29 = swift_allocObject();
    sub_235FF1BAC(v25, v29 + v27, (uint64_t (*)(_QWORD))v24);
    sub_235FF1BAC(v26, v29 + v28, type metadata accessor for AlarmSelector);
    sub_235FF1BF4(&qword_25639C5C8, type metadata accessor for AlarmItemView, (uint64_t)&unk_235FFC698);
    v30 = v38;
    sub_235FFC080();
    swift_release();
    sub_235FF542C((uint64_t)v18, type metadata accessor for AlarmItemView);
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v39 + 32))(v47, v30, v40);
  }
  else
  {
    sub_235FFC224();
    sub_235FF1BF4(&qword_25639C320, (uint64_t (*)(uint64_t))MEMORY[0x24BEAE580], MEMORY[0x24BEAE520]);
    result = sub_235FFBF48();
    __break(1u);
  }
  return result;
}

uint64_t sub_235FF3384(uint64_t a1, id *a2)
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  NSObject *v8;
  os_log_type_t v9;
  _BOOL4 v10;
  uint8_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  id v17;
  uint64_t v18;
  uint64_t result;
  _QWORD v20[3];
  uint64_t v21;

  v4 = sub_235FFBEE8();
  MEMORY[0x24BDAC7A8]();
  v6 = (char *)v20 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_25639C310 != -1)
    swift_once();
  v7 = sub_235FFBF0C();
  __swift_project_value_buffer(v7, (uint64_t)qword_25639C3F8);
  sub_235FF5204(a1, (uint64_t)v6, (uint64_t (*)(_QWORD))MEMORY[0x24BEA8310]);
  v8 = sub_235FFBEF4();
  v9 = sub_235FFC254();
  v10 = os_log_type_enabled(v8, v9);
  v20[1] = v4;
  if (v10)
  {
    v20[0] = a2;
    v11 = (uint8_t *)swift_slowAlloc();
    v12 = swift_slowAlloc();
    *(_DWORD *)v11 = 136315138;
    v21 = v12;
    v13 = (uint64_t *)&v6[*(int *)(v4 + 32)];
    v14 = *v13;
    v15 = v13[1];
    swift_bridgeObjectRetain();
    v16 = v14;
    a2 = (id *)v20[0];
    v20[2] = sub_235FF5468(v16, v15, &v21);
    sub_235FFC260();
    swift_bridgeObjectRelease();
    sub_235FF542C((uint64_t)v6, (uint64_t (*)(_QWORD))MEMORY[0x24BEA8310]);
    _os_log_impl(&dword_235FEF000, v8, v9, "[AlarmItem send directInvocation: %s", v11, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x23B7EA1E4](v12, -1, -1);
    MEMORY[0x23B7EA1E4](v11, -1, -1);
  }
  else
  {
    sub_235FF542C((uint64_t)v6, (uint64_t (*)(_QWORD))MEMORY[0x24BEA8310]);
  }

  if (*a2)
  {
    v17 = *a2;
    v18 = sub_235FFBE70();
    sub_235FF5B90(v18);
    swift_bridgeObjectRelease();
    sub_235FFC218();

    return swift_bridgeObjectRelease();
  }
  else
  {
    sub_235FFC224();
    sub_235FF1BF4(&qword_25639C320, (uint64_t (*)(uint64_t))MEMORY[0x24BEAE580], MEMORY[0x24BEAE520]);
    result = sub_235FFBF48();
    __break(1u);
  }
  return result;
}

uint64_t sub_235FF3650()
{
  return sub_235FFBF60();
}

uint64_t sub_235FF3670()
{
  return sub_235FFBF60();
}

uint64_t sub_235FF3690(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v6;

  v2 = sub_235FFBF18();
  MEMORY[0x24BDAC7A8](v2);
  (*(void (**)(char *, uint64_t))(v4 + 16))((char *)&v6 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0), a1);
  return sub_235FFBF6C();
}

unint64_t sub_235FF3710()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[4];

  result = qword_25639C450;
  if (!qword_25639C450)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_25639C428);
    v2[2] = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_25639C418);
    v2[3] = sub_235FF247C(&qword_25639C440, &qword_25639C418, MEMORY[0x24BEADC00]);
    v2[0] = swift_getOpaqueTypeConformance2();
    v2[1] = sub_235FF247C(&qword_25639C458, &qword_25639C448, MEMORY[0x24BDF1028]);
    result = MEMORY[0x23B7EA190](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_25639C450);
  }
  return result;
}

uint64_t sub_235FF37DC(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_235FF3818()
{
  return swift_getOpaqueTypeConformance2();
}

char *initializeBufferWithCopyOfBuffer for AlarmSelector(char *a1, char **a2, uint64_t a3)
{
  int v3;
  char *v4;
  char *v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;

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
    *(_QWORD *)&a1[v6] = *(char **)((char *)a2 + v6);
    v9 = *(int *)(sub_235FFBE88() + 20);
    v10 = &v7[v9];
    v11 = v8 + v9;
    v12 = v4;
    swift_bridgeObjectRetain();
    v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_25639C328);
    (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v13 - 8) + 16))(v10, v11, v13);
  }
  return v5;
}

uint64_t destroy for AlarmSelector(id *a1, uint64_t a2)
{
  char *v4;
  char *v5;
  uint64_t v6;

  v4 = (char *)a1 + *(int *)(a2 + 20);
  swift_bridgeObjectRelease();
  v5 = &v4[*(int *)(sub_235FFBE88() + 20)];
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_25639C328);
  return (*(uint64_t (**)(char *, uint64_t))(*(_QWORD *)(v6 - 8) + 8))(v5, v6);
}

_QWORD *initializeWithCopy for AlarmSelector(_QWORD *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  void *v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  id v12;
  uint64_t v13;

  v5 = *(void **)a2;
  v4 = *(_QWORD *)(a2 + 8);
  *a1 = *(_QWORD *)a2;
  a1[1] = v4;
  v6 = *(int *)(a3 + 20);
  v7 = (char *)a1 + v6;
  v8 = a2 + v6;
  *(_QWORD *)((char *)a1 + v6) = *(_QWORD *)(a2 + v6);
  v9 = *(int *)(sub_235FFBE88() + 20);
  v10 = &v7[v9];
  v11 = v8 + v9;
  v12 = v5;
  swift_bridgeObjectRetain();
  v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_25639C328);
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v13 - 8) + 16))(v10, v11, v13);
  return a1;
}

uint64_t assignWithCopy for AlarmSelector(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;

  v6 = *(void **)a1;
  v7 = *(void **)a2;
  *(_QWORD *)a1 = *(_QWORD *)a2;
  v8 = v7;

  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  v9 = *(int *)(a3 + 20);
  v10 = a1 + v9;
  v11 = (_QWORD *)(a2 + v9);
  *(_QWORD *)(a1 + v9) = *v11;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v12 = *(int *)(sub_235FFBE88() + 20);
  v13 = v10 + v12;
  v14 = (char *)v11 + v12;
  v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_25639C328);
  (*(void (**)(uint64_t, char *, uint64_t))(*(_QWORD *)(v15 - 8) + 24))(v13, v14, v15);
  return a1;
}

_OWORD *initializeWithTake for AlarmSelector(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  uint64_t v4;
  char *v5;
  char *v6;
  uint64_t v7;
  char *v8;
  char *v9;
  uint64_t v10;

  *a1 = *a2;
  v4 = *(int *)(a3 + 20);
  v5 = (char *)a1 + v4;
  v6 = (char *)a2 + v4;
  *(_QWORD *)((char *)a1 + v4) = *(_QWORD *)((char *)a2 + v4);
  v7 = *(int *)(sub_235FFBE88() + 20);
  v8 = &v5[v7];
  v9 = &v6[v7];
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_25639C328);
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v10 - 8) + 32))(v8, v9, v10);
  return a1;
}

uint64_t assignWithTake for AlarmSelector(uint64_t a1, _QWORD *a2, uint64_t a3)
{
  void *v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;

  v6 = *(void **)a1;
  *(_QWORD *)a1 = *a2;

  *(_QWORD *)(a1 + 8) = a2[1];
  v7 = *(int *)(a3 + 20);
  v8 = a1 + v7;
  v9 = (_QWORD *)((char *)a2 + v7);
  *(_QWORD *)(a1 + v7) = *v9;
  swift_bridgeObjectRelease();
  v10 = *(int *)(sub_235FFBE88() + 20);
  v11 = v8 + v10;
  v12 = (char *)v9 + v10;
  v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_25639C328);
  (*(void (**)(uint64_t, char *, uint64_t))(*(_QWORD *)(v13 - 8) + 40))(v11, v12, v13);
  return a1;
}

uint64_t getEnumTagSinglePayload for AlarmSelector()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_235FF3BAC(char *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  int v5;
  uint64_t v9;

  if ((_DWORD)a2 == 2147483646)
  {
    v4 = *(_QWORD *)a1;
    if (*(_QWORD *)a1 >= 0xFFFFFFFFuLL)
      LODWORD(v4) = -1;
    v5 = v4 - 1;
    if (v5 < 0)
      v5 = -1;
    return (v5 + 1);
  }
  else
  {
    v9 = sub_235FFBE88();
    return (*(uint64_t (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 48))(&a1[*(int *)(a3 + 20)], a2, v9);
  }
}

uint64_t storeEnumTagSinglePayload for AlarmSelector()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

char *sub_235FF3C40(char *result, uint64_t a2, int a3, uint64_t a4)
{
  char *v5;
  uint64_t v7;

  v5 = result;
  if (a3 == 2147483646)
  {
    *(_QWORD *)result = a2;
  }
  else
  {
    v7 = sub_235FFBE88();
    return (char *)(*(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 56))(&v5[*(int *)(a4 + 20)], a2, a2, v7);
  }
  return result;
}

uint64_t sub_235FF3CB4()
{
  uint64_t result;
  unint64_t v1;

  result = sub_235FFBE88();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t sub_235FF3D28()
{
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_25639C428);
  sub_235FF3710();
  return swift_getOpaqueTypeConformance2();
}

uint64_t *sub_235FF3D74(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t *v4;
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
  _QWORD *v18;
  _QWORD *v19;
  uint64_t v20;
  uint64_t v21;
  _QWORD *v22;
  _QWORD *v23;
  uint64_t v24;
  uint64_t v25;
  char *v26;
  char *v27;
  uint64_t v28;
  void (*v29)(char *, char *, uint64_t);
  uint64_t v30;
  uint64_t v31;
  void *v32;
  char *v33;
  char *v34;
  uint64_t v35;
  void (*v36)(char *, char *, uint64_t);
  id v37;
  uint64_t v38;

  v4 = a1;
  v5 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v38 = *a2;
    *v4 = *a2;
    v4 = (uint64_t *)(v38 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    v7 = a2[1];
    *a1 = *a2;
    a1[1] = v7;
    v8 = (int *)sub_235FFBEE8();
    v9 = v8[5];
    v10 = (char *)v4 + v9;
    v11 = (char *)a2 + v9;
    swift_bridgeObjectRetain();
    v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_25639C328);
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v12 - 8) + 16))(v10, v11, v12);
    v13 = v8[6];
    v14 = (char *)v4 + v13;
    v15 = (char *)a2 + v13;
    v16 = __swift_instantiateConcreteTypeFromMangledName(qword_25639C4F0);
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v16 - 8) + 16))(v14, v15, v16);
    v17 = v8[7];
    v18 = (uint64_t *)((char *)v4 + v17);
    v19 = (uint64_t *)((char *)a2 + v17);
    v20 = v19[1];
    *v18 = *v19;
    v18[1] = v20;
    v21 = v8[8];
    v22 = (uint64_t *)((char *)v4 + v21);
    v23 = (uint64_t *)((char *)a2 + v21);
    v24 = v23[1];
    *v22 = *v23;
    v22[1] = v24;
    v25 = v8[9];
    v26 = (char *)v4 + v25;
    v27 = (char *)a2 + v25;
    v28 = sub_235FFBDEC();
    v29 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v28 - 8) + 16);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v29(v26, v27, v28);
    v30 = *(int *)(a3 + 20);
    v31 = *(int *)(a3 + 24);
    v32 = *(void **)((char *)a2 + v30);
    *(uint64_t *)((char *)v4 + v30) = (uint64_t)v32;
    v33 = (char *)v4 + v31;
    v34 = (char *)a2 + v31;
    v35 = sub_235FFBD8C();
    v36 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v35 - 8) + 16);
    v37 = v32;
    v36(v33, v34, v35);
  }
  return v4;
}

uint64_t sub_235FF3F08(uint64_t a1, uint64_t a2)
{
  int *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  swift_bridgeObjectRelease();
  v4 = (int *)sub_235FFBEE8();
  v5 = a1 + v4[5];
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_25639C328);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 8))(v5, v6);
  v7 = a1 + v4[6];
  v8 = __swift_instantiateConcreteTypeFromMangledName(qword_25639C4F0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 8))(v7, v8);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v9 = a1 + v4[9];
  v10 = sub_235FFBDEC();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 8))(v9, v10);

  v11 = a1 + *(int *)(a2 + 24);
  v12 = sub_235FFBD8C();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 8))(v11, v12);
}

_QWORD *sub_235FF4004(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v6;
  int *v7;
  uint64_t v8;
  char *v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD *v17;
  _QWORD *v18;
  uint64_t v19;
  uint64_t v20;
  _QWORD *v21;
  _QWORD *v22;
  uint64_t v23;
  uint64_t v24;
  char *v25;
  char *v26;
  uint64_t v27;
  void (*v28)(char *, char *, uint64_t);
  uint64_t v29;
  uint64_t v30;
  void *v31;
  char *v32;
  char *v33;
  uint64_t v34;
  void (*v35)(char *, char *, uint64_t);
  id v36;

  v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  v7 = (int *)sub_235FFBEE8();
  v8 = v7[5];
  v9 = (char *)a1 + v8;
  v10 = (char *)a2 + v8;
  swift_bridgeObjectRetain();
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_25639C328);
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v11 - 8) + 16))(v9, v10, v11);
  v12 = v7[6];
  v13 = (char *)a1 + v12;
  v14 = (char *)a2 + v12;
  v15 = __swift_instantiateConcreteTypeFromMangledName(qword_25639C4F0);
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v15 - 8) + 16))(v13, v14, v15);
  v16 = v7[7];
  v17 = (_QWORD *)((char *)a1 + v16);
  v18 = (_QWORD *)((char *)a2 + v16);
  v19 = v18[1];
  *v17 = *v18;
  v17[1] = v19;
  v20 = v7[8];
  v21 = (_QWORD *)((char *)a1 + v20);
  v22 = (_QWORD *)((char *)a2 + v20);
  v23 = v22[1];
  *v21 = *v22;
  v21[1] = v23;
  v24 = v7[9];
  v25 = (char *)a1 + v24;
  v26 = (char *)a2 + v24;
  v27 = sub_235FFBDEC();
  v28 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v27 - 8) + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v28(v25, v26, v27);
  v29 = *(int *)(a3 + 20);
  v30 = *(int *)(a3 + 24);
  v31 = *(void **)((char *)a2 + v29);
  *(_QWORD *)((char *)a1 + v29) = v31;
  v32 = (char *)a1 + v30;
  v33 = (char *)a2 + v30;
  v34 = sub_235FFBD8C();
  v35 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v34 - 8) + 16);
  v36 = v31;
  v35(v32, v33, v34);
  return a1;
}

_QWORD *sub_235FF416C(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  int *v6;
  uint64_t v7;
  char *v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD *v16;
  _QWORD *v17;
  uint64_t v18;
  _QWORD *v19;
  _QWORD *v20;
  uint64_t v21;
  char *v22;
  char *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  void *v27;
  id v28;
  uint64_t v29;
  char *v30;
  char *v31;
  uint64_t v32;

  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v6 = (int *)sub_235FFBEE8();
  v7 = v6[5];
  v8 = (char *)a1 + v7;
  v9 = (char *)a2 + v7;
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_25639C328);
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v10 - 8) + 24))(v8, v9, v10);
  v11 = v6[6];
  v12 = (char *)a1 + v11;
  v13 = (char *)a2 + v11;
  v14 = __swift_instantiateConcreteTypeFromMangledName(qword_25639C4F0);
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v14 - 8) + 24))(v12, v13, v14);
  v15 = v6[7];
  v16 = (_QWORD *)((char *)a1 + v15);
  v17 = (_QWORD *)((char *)a2 + v15);
  *v16 = *v17;
  v16[1] = v17[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v18 = v6[8];
  v19 = (_QWORD *)((char *)a1 + v18);
  v20 = (_QWORD *)((char *)a2 + v18);
  *v19 = *v20;
  v19[1] = v20[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v21 = v6[9];
  v22 = (char *)a1 + v21;
  v23 = (char *)a2 + v21;
  v24 = sub_235FFBDEC();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v24 - 8) + 24))(v22, v23, v24);
  v25 = *(int *)(a3 + 20);
  v26 = *(void **)((char *)a2 + v25);
  v27 = *(void **)((char *)a1 + v25);
  *(_QWORD *)((char *)a1 + v25) = v26;
  v28 = v26;

  v29 = *(int *)(a3 + 24);
  v30 = (char *)a1 + v29;
  v31 = (char *)a2 + v29;
  v32 = sub_235FFBD8C();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v32 - 8) + 24))(v30, v31, v32);
  return a1;
}

_OWORD *sub_235FF42F8(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  int *v6;
  uint64_t v7;
  char *v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  char *v21;
  uint64_t v22;

  *a1 = *a2;
  v6 = (int *)sub_235FFBEE8();
  v7 = v6[5];
  v8 = (char *)a1 + v7;
  v9 = (char *)a2 + v7;
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_25639C328);
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v10 - 8) + 32))(v8, v9, v10);
  v11 = v6[6];
  v12 = (char *)a1 + v11;
  v13 = (char *)a2 + v11;
  v14 = __swift_instantiateConcreteTypeFromMangledName(qword_25639C4F0);
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v14 - 8) + 32))(v12, v13, v14);
  *(_OWORD *)((char *)a1 + v6[7]) = *(_OWORD *)((char *)a2 + v6[7]);
  *(_OWORD *)((char *)a1 + v6[8]) = *(_OWORD *)((char *)a2 + v6[8]);
  v15 = v6[9];
  v16 = (char *)a1 + v15;
  v17 = (char *)a2 + v15;
  v18 = sub_235FFBDEC();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v18 - 8) + 32))(v16, v17, v18);
  v19 = *(int *)(a3 + 24);
  *(_QWORD *)((char *)a1 + *(int *)(a3 + 20)) = *(_QWORD *)((char *)a2 + *(int *)(a3 + 20));
  v20 = (char *)a1 + v19;
  v21 = (char *)a2 + v19;
  v22 = sub_235FFBD8C();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v22 - 8) + 32))(v20, v21, v22);
  return a1;
}

_QWORD *sub_235FF441C(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v6;
  int *v7;
  uint64_t v8;
  char *v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD *v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  _QWORD *v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  char *v27;
  char *v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  char *v33;
  char *v34;
  uint64_t v35;

  v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  swift_bridgeObjectRelease();
  v7 = (int *)sub_235FFBEE8();
  v8 = v7[5];
  v9 = (char *)a1 + v8;
  v10 = (char *)a2 + v8;
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_25639C328);
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v11 - 8) + 40))(v9, v10, v11);
  v12 = v7[6];
  v13 = (char *)a1 + v12;
  v14 = (char *)a2 + v12;
  v15 = __swift_instantiateConcreteTypeFromMangledName(qword_25639C4F0);
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v15 - 8) + 40))(v13, v14, v15);
  v16 = v7[7];
  v17 = (_QWORD *)((char *)a1 + v16);
  v18 = (_QWORD *)((char *)a2 + v16);
  v20 = *v18;
  v19 = v18[1];
  *v17 = v20;
  v17[1] = v19;
  swift_bridgeObjectRelease();
  v21 = v7[8];
  v22 = (_QWORD *)((char *)a1 + v21);
  v23 = (_QWORD *)((char *)a2 + v21);
  v25 = *v23;
  v24 = v23[1];
  *v22 = v25;
  v22[1] = v24;
  swift_bridgeObjectRelease();
  v26 = v7[9];
  v27 = (char *)a1 + v26;
  v28 = (char *)a2 + v26;
  v29 = sub_235FFBDEC();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v29 - 8) + 40))(v27, v28, v29);
  v30 = *(int *)(a3 + 20);
  v31 = *(void **)((char *)a1 + v30);
  *(_QWORD *)((char *)a1 + v30) = *(_QWORD *)((char *)a2 + v30);

  v32 = *(int *)(a3 + 24);
  v33 = (char *)a1 + v32;
  v34 = (char *)a2 + v32;
  v35 = sub_235FFBD8C();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v35 - 8) + 40))(v33, v34, v35);
  return a1;
}

uint64_t sub_235FF4574()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_235FF4580(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t, uint64_t);
  uint64_t v10;
  unint64_t v11;

  v6 = sub_235FFBEE8();
  v7 = *(_QWORD *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == (_DWORD)a2)
  {
    v8 = v6;
    v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    v10 = a1;
    return v9(v10, a2, v8);
  }
  if ((_DWORD)a2 != 0x7FFFFFFF)
  {
    v8 = sub_235FFBD8C();
    v10 = a1 + *(int *)(a3 + 24);
    v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 48);
    return v9(v10, a2, v8);
  }
  v11 = *(_QWORD *)(a1 + *(int *)(a3 + 20));
  if (v11 >= 0xFFFFFFFF)
    LODWORD(v11) = -1;
  return (v11 + 1);
}

uint64_t sub_235FF4628()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_235FF4634(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result;
  uint64_t v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v12;

  result = sub_235FFBEE8();
  v9 = *(_QWORD *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    v10 = result;
    v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    v12 = a1;
  }
  else
  {
    if (a3 == 0x7FFFFFFF)
    {
      *(_QWORD *)(a1 + *(int *)(a4 + 20)) = (a2 - 1);
      return result;
    }
    v10 = sub_235FFBD8C();
    v12 = a1 + *(int *)(a4 + 24);
    v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 56);
  }
  return v11(v12, a2, a2, v10);
}

uint64_t type metadata accessor for AlarmItemView(uint64_t a1)
{
  return sub_235FF46EC(a1, qword_25639C550);
}

uint64_t sub_235FF46EC(uint64_t a1, uint64_t *a2)
{
  uint64_t result;

  result = *a2;
  if (!*a2)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_235FF4720()
{
  uint64_t result;
  unint64_t v1;
  unint64_t v2;

  result = sub_235FFBEE8();
  if (v1 <= 0x3F)
  {
    result = sub_235FFBD8C();
    if (v2 <= 0x3F)
    {
      swift_initStructMetadata();
      return 0;
    }
  }
  return result;
}

uint64_t sub_235FF47B0()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_235FF47C0@<X0>(uint64_t a1@<X8>)
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
  uint64_t v10;
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
  char *v21;
  void (*v22)(char *, uint64_t);
  uint64_t v23;
  uint64_t v24;
  char *v25;
  char *v26;
  uint64_t v27;
  char *v28;
  uint64_t v29;
  char *v30;
  uint64_t v31;
  uint64_t v32;
  void (*v33)(char *, uint64_t);
  _QWORD v35[2];
  char *v36;
  uint64_t v37;
  uint64_t v38;
  char *v39;
  char *v40;
  uint64_t v41;
  uint64_t v42;
  char *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t KeyPath;
  uint64_t v52;

  v35[1] = a1;
  v47 = sub_235FFBC6C();
  v45 = *(_QWORD *)(v47 - 8);
  MEMORY[0x24BDAC7A8](v47);
  v43 = (char *)v35 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  v44 = __swift_instantiateConcreteTypeFromMangledName(&qword_25639C590);
  v46 = *(_QWORD *)(v44 - 8);
  MEMORY[0x24BDAC7A8](v44);
  v40 = (char *)v35 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_25639C598);
  v4 = *(_QWORD *)(v3 - 8);
  v37 = v3;
  v38 = v4;
  MEMORY[0x24BDAC7A8](v3);
  v6 = (char *)v35 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_235FFBCF0();
  v41 = *(_QWORD *)(v7 - 8);
  v42 = v7;
  v8 = MEMORY[0x24BDAC7A8](v7);
  v39 = (char *)v35 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v8);
  v36 = (char *)v35 - v10;
  v11 = sub_235FFBDC8();
  v12 = *(_QWORD *)(v11 - 8);
  MEMORY[0x24BDAC7A8](v11);
  v14 = (char *)v35 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = sub_235FFBDB0();
  v16 = *(_QWORD *)(v15 - 8);
  v17 = MEMORY[0x24BDAC7A8](v15);
  v19 = (char *)v35 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v17);
  v21 = (char *)v35 - v20;
  type metadata accessor for AlarmItemView(0);
  sub_235FFBD74();
  sub_235FFBEE8();
  sub_235FFBDA4();
  v22 = *(void (**)(char *, uint64_t))(v16 + 8);
  v22(v19, v15);
  sub_235FFBEDC();
  sub_235FFBD98();
  (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v11);
  v22(v21, v15);
  KeyPath = swift_getKeyPath();
  swift_getKeyPath();
  v52 = sub_235FFC0EC();
  sub_235FF4ECC();
  sub_235FFBC9C();
  v50 = swift_getKeyPath();
  swift_getKeyPath();
  sub_235FFBFA8();
  sub_235FFBFD8();
  v23 = sub_235FFBFFC();
  swift_release();
  v52 = v23;
  sub_235FF4F50();
  sub_235FFBC9C();
  v49 = swift_getKeyPath();
  swift_getKeyPath();
  sub_235FFBCCC();
  swift_release();
  v52 = sub_235FFBFF0();
  v25 = v36;
  v24 = v37;
  sub_235FFBCD8();
  swift_release();
  (*(void (**)(char *, uint64_t))(v38 + 8))(v6, v24);
  v48 = swift_getKeyPath();
  swift_getKeyPath();
  sub_235FF4FB4();
  v26 = v40;
  sub_235FFBCCC();
  swift_release();
  v27 = v45;
  v28 = v43;
  v29 = v47;
  (*(void (**)(char *, _QWORD, uint64_t))(v45 + 104))(v43, *MEMORY[0x24BDCC0E8], v47);
  v30 = v39;
  v31 = v44;
  sub_235FFBCD8();
  (*(void (**)(char *, uint64_t))(v27 + 8))(v28, v29);
  (*(void (**)(char *, uint64_t))(v46 + 8))(v26, v31);
  sub_235FFBCA8();
  v32 = v42;
  v33 = *(void (**)(char *, uint64_t))(v41 + 8);
  v33(v30, v42);
  return ((uint64_t (*)(char *, uint64_t))v33)(v25, v32);
}

uint64_t sub_235FF4C38@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char v7;
  char v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char v17;
  char v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char v22;
  char v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  char v27;
  char v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  _QWORD v33[2];
  __int128 v34;
  __int128 v35;
  uint64_t v36;
  __int128 v37;
  __int128 v38;
  uint64_t v39;
  __int128 v40;
  __int128 v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  __int128 v47;
  __int128 v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;

  v33[1] = a1;
  v2 = sub_235FFBCB4();
  MEMORY[0x24BDAC7A8](v2);
  sub_235FF47C0((uint64_t)v33 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0));
  v4 = sub_235FFC044();
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v51 = MEMORY[0x24BDF1FA8];
  v52 = MEMORY[0x24BEAD6B0];
  v11 = swift_allocObject();
  v50 = v11;
  *(_QWORD *)(v11 + 16) = v4;
  *(_QWORD *)(v11 + 24) = v6;
  *(_BYTE *)(v11 + 32) = v8 & 1;
  *(_QWORD *)(v11 + 40) = v10;
  v49 = 0;
  v47 = 0u;
  v48 = 0u;
  v12 = (uint64_t *)(v1 + *(int *)(sub_235FFBEE8() + 28));
  v13 = v12[1];
  v43 = *v12;
  v44 = v13;
  sub_235FF2600();
  swift_bridgeObjectRetain();
  v14 = sub_235FFC050();
  v16 = v15;
  v18 = v17 & 1;
  sub_235FFC008();
  v19 = sub_235FFC038();
  v21 = v20;
  v23 = v22;
  swift_release();
  sub_235FF4EB4(v14, v16, v18);
  swift_bridgeObjectRelease();
  sub_235FFC0EC();
  v24 = sub_235FFC02C();
  v26 = v25;
  v28 = v27;
  v30 = v29;
  swift_release();
  sub_235FF4EB4(v19, v21, v23 & 1);
  swift_bridgeObjectRelease();
  v45 = MEMORY[0x24BDF1FA8];
  v46 = MEMORY[0x24BEAD6B0];
  v31 = swift_allocObject();
  v43 = v31;
  *(_QWORD *)(v31 + 16) = v24;
  *(_QWORD *)(v31 + 24) = v26;
  *(_BYTE *)(v31 + 32) = v28 & 1;
  *(_QWORD *)(v31 + 40) = v30;
  v42 = 0;
  v40 = 0u;
  v41 = 0u;
  v39 = 0;
  v37 = 0u;
  v38 = 0u;
  v36 = 0;
  v34 = 0u;
  v35 = 0u;
  return sub_235FFC1C4();
}

uint64_t sub_235FF4E84()
{
  uint64_t v0;

  sub_235FF4EB4(*(_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 24), *(_BYTE *)(v0 + 32));
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_235FF4EB4(uint64_t a1, uint64_t a2, char a3)
{
  if ((a3 & 1) != 0)
    return swift_release();
  else
    return swift_bridgeObjectRelease();
}

unint64_t sub_235FF4ECC()
{
  unint64_t result;

  result = qword_25639C5A0;
  if (!qword_25639C5A0)
  {
    result = MEMORY[0x23B7EA190](MEMORY[0x24BDEACB8], MEMORY[0x24BDEACC8]);
    atomic_store(result, (unint64_t *)&qword_25639C5A0);
  }
  return result;
}

uint64_t sub_235FF4F14()
{
  return 8;
}

uint64_t sub_235FF4F20()
{
  return swift_release();
}

uint64_t sub_235FF4F28(_QWORD *a1, _QWORD *a2)
{
  *a2 = *a1;
  return swift_retain();
}

_QWORD *sub_235FF4F3C(_QWORD *result, _QWORD *a2)
{
  *a2 = *result;
  return result;
}

unint64_t sub_235FF4F50()
{
  unint64_t result;

  result = qword_25639C5A8;
  if (!qword_25639C5A8)
  {
    result = MEMORY[0x23B7EA190](MEMORY[0x24BDEACD0], MEMORY[0x24BDEACE0]);
    atomic_store(result, (unint64_t *)&qword_25639C5A8);
  }
  return result;
}

uint64_t sub_235FF4F98()
{
  return 8;
}

unint64_t sub_235FF4FB4()
{
  unint64_t result;

  result = qword_25639C5B0;
  if (!qword_25639C5B0)
  {
    result = MEMORY[0x23B7EA190](MEMORY[0x24BDCC150], MEMORY[0x24BDCC170]);
    atomic_store(result, (unint64_t *)&qword_25639C5B0);
  }
  return result;
}

uint64_t sub_235FF4FFC()
{
  return 8;
}

uint64_t objectdestroyTm_0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  id *v3;
  char *v4;
  char *v5;
  uint64_t v6;

  v1 = type metadata accessor for AlarmSelector(0);
  v2 = *(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80);
  v3 = (id *)(v0 + ((v2 + 16) & ~v2));

  v4 = (char *)v3 + *(int *)(v1 + 20);
  swift_bridgeObjectRelease();
  v5 = &v4[*(int *)(sub_235FFBE88() + 20)];
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_25639C328);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v6 - 8) + 8))(v5, v6);
  return swift_deallocObject();
}

uint64_t sub_235FF50BC()
{
  return sub_235FF50C8(sub_235FF2CE4);
}

uint64_t sub_235FF50C8(uint64_t (*a1)(uint64_t))
{
  uint64_t v1;
  uint64_t v2;

  v2 = *(unsigned __int8 *)(*(_QWORD *)(type metadata accessor for AlarmSelector(0) - 8) + 80);
  return a1(v1 + ((v2 + 16) & ~v2));
}

unint64_t sub_235FF5114()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[3];

  result = qword_25639C5C0;
  if (!qword_25639C5C0)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_25639C5B8);
    v2[1] = type metadata accessor for AlarmItemView(255);
    v2[2] = sub_235FF1BF4(&qword_25639C5C8, type metadata accessor for AlarmItemView, (uint64_t)&unk_235FFC698);
    v2[0] = swift_getOpaqueTypeConformance2();
    result = MEMORY[0x23B7EA190](MEMORY[0x24BDF4A08], v1, v2);
    atomic_store(result, (unint64_t *)&qword_25639C5C0);
  }
  return result;
}

uint64_t sub_235FF51B8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;

  v5 = *(unsigned __int8 *)(*(_QWORD *)(type metadata accessor for AlarmSelector(0) - 8) + 80);
  return sub_235FF2E90(a1, (void **)(v2 + ((v5 + 16) & ~v5)), a2);
}

uint64_t sub_235FF5204(uint64_t a1, uint64_t a2, uint64_t (*a3)(_QWORD))
{
  uint64_t v5;

  v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_235FF5248()
{
  uint64_t v0;
  int *v1;
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  void (*v11)(unint64_t, uint64_t);
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;

  v1 = (int *)sub_235FFBEE8();
  v2 = *((_QWORD *)v1 - 1);
  v3 = (*(unsigned __int8 *)(v2 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  v4 = *(_QWORD *)(v2 + 64);
  v5 = type metadata accessor for AlarmSelector(0);
  v6 = *(unsigned __int8 *)(*(_QWORD *)(v5 - 8) + 80);
  v7 = (v3 + v4 + v6) & ~v6;
  v8 = v0 + v3;
  swift_bridgeObjectRelease();
  v9 = v0 + v3 + v1[5];
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_25639C328);
  v11 = *(void (**)(unint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 8);
  v11(v9, v10);
  v12 = v8 + v1[6];
  v13 = __swift_instantiateConcreteTypeFromMangledName(qword_25639C4F0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v13 - 8) + 8))(v12, v13);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v14 = v8 + v1[9];
  v15 = sub_235FFBDEC();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v15 - 8) + 8))(v14, v15);

  v16 = v0 + v7 + *(int *)(v5 + 20);
  swift_bridgeObjectRelease();
  v17 = sub_235FFBE88();
  v11(v16 + *(int *)(v17 + 20), v10);
  return swift_deallocObject();
}

uint64_t sub_235FF53B4()
{
  uint64_t v0;
  uint64_t v1;
  unint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v1 = *(_QWORD *)(sub_235FFBEE8() - 8);
  v2 = (*(unsigned __int8 *)(v1 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80);
  v3 = *(_QWORD *)(v1 + 64);
  v4 = *(unsigned __int8 *)(*(_QWORD *)(type metadata accessor for AlarmSelector(0) - 8) + 80);
  return sub_235FF3384(v0 + v2, (id *)(v0 + ((v2 + v3 + v4) & ~v4)));
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(_BYTE *)(*(_QWORD *)(a1 - 8) + 82) & 2) != 0)
    return *(_QWORD *)a2;
  return a2;
}

uint64_t sub_235FF542C(uint64_t a1, uint64_t (*a2)(_QWORD))
{
  uint64_t v3;

  v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_235FF5468(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12[3];
  uint64_t ObjectType;

  v6 = sub_235FF5538(v12, 0, 0, 1, a1, a2);
  v7 = v12[0];
  if (v6)
  {
    v8 = v6;
    ObjectType = swift_getObjectType();
    v12[0] = v8;
    v9 = *a3;
    if (*a3)
    {
      sub_235FF5AC8((uint64_t)v12, *a3);
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
      sub_235FF5AC8((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v12);
  return v7;
}

uint64_t sub_235FF5538(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_235FFC26C();
            result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    result = sub_235FF56F0(a5, a6);
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
  v8 = sub_235FFC29C();
  if (!v8)
  {
    sub_235FFC2A8();
    __break(1u);
LABEL_17:
    result = sub_235FFC2C0();
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

uint64_t sub_235FF56F0(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v2 = sub_235FF5784(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v2 = sub_235FF595C(0, *(_QWORD *)(v2 + 16) + 1, 1, (char *)v2);
  v4 = *(_QWORD *)(v2 + 16);
  v3 = *(_QWORD *)(v2 + 24);
  if (v4 >= v3 >> 1)
    v2 = sub_235FF595C(v3 > 1, v4 + 1, 1, (char *)v2);
  *(_QWORD *)(v2 + 16) = v4 + 1;
  *(_BYTE *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_235FF5784(uint64_t a1, unint64_t a2)
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
      v3 = sub_235FF58F8(v2, 0);
      if (v2 < 0)
        break;
      v4 = v3;
      v5 = sub_235FFC290();
      if ((v6 & 1) != 0)
        goto LABEL_14;
      if (v5 == v2)
        return (uint64_t)v4;
      sub_235FFC2A8();
      __break(1u);
LABEL_10:
      v2 = sub_235FFC248();
      if (!v2)
        return MEMORY[0x24BEE4AF8];
    }
    sub_235FFC2C0();
    __break(1u);
LABEL_14:
    result = sub_235FFC2A8();
    __break(1u);
  }
  else
  {
    return MEMORY[0x24BEE4AF8];
  }
  return result;
}

_QWORD *sub_235FF58F8(uint64_t a1, uint64_t a2)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_25639C600);
  v4 = (_QWORD *)swift_allocObject();
  v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_235FF595C(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_25639C600);
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
  result = sub_235FFC2C0();
  __break(1u);
  return result;
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

uint64_t sub_235FF5AC8(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
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

uint64_t sub_235FF5B48()
{
  return sub_235FF1BF4(&qword_25639C608, MEMORY[0x24BEAE190], MEMORY[0x24BEAE168]);
}

uint64_t sub_235FF5B90(uint64_t a1)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_25639C890);
    v2 = sub_235FFC2B4();
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
    sub_235FF5AC8(*(_QWORD *)(a1 + 56) + 32 * v12, (uint64_t)v40);
    *(_QWORD *)&v39 = v19;
    *((_QWORD *)&v39 + 1) = v18;
    v37[2] = v39;
    v38[0] = v40[0];
    v38[1] = v40[1];
    *(_QWORD *)&v37[0] = v19;
    *((_QWORD *)&v37[0] + 1) = v18;
    swift_bridgeObjectRetain();
    swift_dynamicCast();
    sub_235FFBA90(v38, v32);
    v33 = v29;
    v34 = v30;
    v35 = v31;
    sub_235FFBA90(v32, v36);
    v29 = v33;
    v30 = v34;
    v31 = v35;
    sub_235FFBA90(v36, v37);
    sub_235FFBA90(v37, &v33);
    result = sub_235FFC284();
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
    result = (uint64_t)sub_235FFBA90(&v33, (_OWORD *)(*(_QWORD *)(v2 + 56) + 32 * v9));
    ++*(_QWORD *)(v2 + 16);
  }
  v16 = v8 + 5;
  if (v8 + 5 >= v27)
  {
LABEL_37:
    swift_release();
    sub_235FFBAA0();
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

uint64_t sub_235FF5F54(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_235FF6008(a1, a2, a3, &qword_25639C870);
}

uint64_t sub_235FF5F60(uint64_t a1, uint64_t a2)
{
  return keypath_hashTm(a1, a2, &qword_25639C870);
}

void sub_235FF5F6C()
{
  sub_235FF4ECC();
  sub_235FFBD08();
  __break(1u);
}

void sub_235FF5F90()
{
  sub_235FFBC84();
  __break(1u);
}

uint64_t sub_235FF5FA8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_235FF6008(a1, a2, a3, &qword_25639C868);
}

uint64_t sub_235FF5FB4(uint64_t a1, uint64_t a2)
{
  return keypath_hashTm(a1, a2, &qword_25639C868);
}

void sub_235FF5FC0()
{
  sub_235FF4F50();
  sub_235FFBD08();
  __break(1u);
}

void sub_235FF5FE4()
{
  sub_235FFBC90();
  __break(1u);
}

uint64_t sub_235FF5FFC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_235FF6008(a1, a2, a3, &qword_25639C860);
}

uint64_t sub_235FF6008(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  __swift_instantiateConcreteTypeFromMangledName(a4);
  return sub_235FFC23C() & 1;
}

uint64_t sub_235FF605C(uint64_t a1, uint64_t a2)
{
  return keypath_hashTm(a1, a2, &qword_25639C860);
}

uint64_t keypath_hashTm(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  __swift_instantiateConcreteTypeFromMangledName(a3);
  return sub_235FFC230();
}

void sub_235FF60A8()
{
  sub_235FF4FB4();
  sub_235FFBCFC();
  __break(1u);
}

void sub_235FF60CC()
{
  sub_235FFBC78();
  __break(1u);
}

uint64_t sub_235FF60E4()
{
  uint64_t v0;

  v0 = sub_235FFBF0C();
  __swift_allocate_value_buffer(v0, qword_25639C610);
  __swift_project_value_buffer(v0, (uint64_t)qword_25639C610);
  return sub_235FFBF00();
}

uint64_t AlarmSnippet.init(snippetModel:)@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result;
  uint64_t v5;

  sub_235FFC224();
  sub_235FF1BF4(&qword_25639C320, (uint64_t (*)(uint64_t))MEMORY[0x24BEAE580], MEMORY[0x24BEAE520]);
  result = sub_235FFBF54();
  *a2 = result;
  a2[1] = v5;
  a2[2] = a1;
  return result;
}

uint64_t AlarmSnippet.body.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  _QWORD *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t KeyPath;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;

  v37 = a1;
  v36 = sub_235FFBF18();
  v2 = *(_QWORD *)(v36 - 8);
  MEMORY[0x24BDAC7A8](v36);
  v4 = (char *)&v32 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_25639C410);
  MEMORY[0x24BDAC7A8](v5);
  v7 = (uint64_t *)((char *)&v32 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0));
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_25639C628);
  v33 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v10 = (char *)&v32 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_25639C630);
  v34 = *(_QWORD *)(v11 - 8);
  v35 = v11;
  MEMORY[0x24BDAC7A8](v11);
  v13 = (char *)&v32 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = *(void **)v1;
  v14 = *(_QWORD *)(v1 + 8);
  v16 = *(_QWORD *)(v1 + 16);
  v17 = (_QWORD *)swift_allocObject();
  v17[2] = v15;
  v17[3] = v14;
  v17[4] = v16;
  v18 = v15;
  swift_bridgeObjectRetain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_25639C638);
  sub_235FF65BC();
  sub_235FFC158();
  *v7 = sub_235FFC0E0();
  v19 = *MEMORY[0x24BEADC28];
  v20 = sub_235FFC164();
  v21 = *(_QWORD *)(v20 - 8);
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(v21 + 104))(v7, v19, v20);
  (*(void (**)(uint64_t *, _QWORD, uint64_t, uint64_t))(v21 + 56))(v7, 0, 1, v20);
  v22 = sub_235FF247C(&qword_25639C668, &qword_25639C628, MEMORY[0x24BEADC00]);
  MEMORY[0x23B7E9DD0](v7, v8, v22);
  sub_235FF37DC((uint64_t)v7, &qword_25639C410);
  (*(void (**)(char *, uint64_t))(v33 + 8))(v10, v8);
  KeyPath = swift_getKeyPath();
  v24 = v36;
  (*(void (**)(char *, _QWORD, uint64_t))(v2 + 104))(v4, *MEMORY[0x24BDEB3F0], v36);
  v25 = __swift_instantiateConcreteTypeFromMangledName(&qword_25639C670);
  v26 = v37;
  v27 = (uint64_t *)(v37 + *(int *)(v25 + 36));
  v28 = __swift_instantiateConcreteTypeFromMangledName(&qword_25639C448);
  (*(void (**)(char *, char *, uint64_t))(v2 + 16))((char *)v27 + *(int *)(v28 + 28), v4, v24);
  *v27 = KeyPath;
  v30 = v34;
  v29 = v35;
  (*(void (**)(uint64_t, char *, uint64_t))(v34 + 16))(v26, v13, v35);
  (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v24);
  return (*(uint64_t (**)(char *, uint64_t))(v30 + 8))(v13, v29);
}

uint64_t sub_235FF64A0(void *a1, uint64_t a2, uint64_t a3)
{
  _QWORD *v6;
  id v7;

  v6 = (_QWORD *)swift_allocObject();
  v6[2] = a1;
  v6[3] = a2;
  v6[4] = a3;
  v7 = a1;
  swift_bridgeObjectRetain_n();
  __swift_instantiateConcreteTypeFromMangledName(&qword_25639C8A0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_25639C650);
  sub_235FF247C(&qword_25639C8A8, &qword_25639C8A0, MEMORY[0x24BEE12D8]);
  sub_235FF6620();
  sub_235FF1BF4(&qword_25639C8B0, (uint64_t (*)(uint64_t))MEMORY[0x24BEA82F0], MEMORY[0x24BEA8300]);
  return sub_235FFC11C();
}

uint64_t sub_235FF65B0()
{
  uint64_t v0;

  return sub_235FF64A0(*(void **)(v0 + 16), *(_QWORD *)(v0 + 24), *(_QWORD *)(v0 + 32));
}

unint64_t sub_235FF65BC()
{
  unint64_t result;
  uint64_t v1;
  unint64_t v2;

  result = qword_25639C640;
  if (!qword_25639C640)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_25639C638);
    v2 = sub_235FF6620();
    result = MEMORY[0x23B7EA190](MEMORY[0x24BDF4A08], v1, &v2);
    atomic_store(result, (unint64_t *)&qword_25639C640);
  }
  return result;
}

unint64_t sub_235FF6620()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_25639C648;
  if (!qword_25639C648)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_25639C650);
    v2[0] = sub_235FF1BF4(&qword_25639C658, type metadata accessor for SleepAlarmView, (uint64_t)&unk_235FFC9F8);
    v2[1] = sub_235FF1BF4(&qword_25639C660, type metadata accessor for AlarmView, (uint64_t)&unk_235FFC9A8);
    result = MEMORY[0x23B7EA190](MEMORY[0x24BDEF3E0], v1, v2);
    atomic_store(result, (unint64_t *)&qword_25639C648);
  }
  return result;
}

uint64_t type metadata accessor for SleepAlarmView(uint64_t a1)
{
  return sub_235FF46EC(a1, qword_25639C7B0);
}

uint64_t type metadata accessor for AlarmView(uint64_t a1)
{
  return sub_235FF46EC(a1, qword_25639C718);
}

uint64_t sub_235FF66EC@<X0>(uint64_t a1@<X0>, void *a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
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
  uint64_t v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  char *v26;
  uint64_t v27;
  char *v28;
  uint64_t v29;
  uint64_t v30;
  char *v31;
  uint64_t v32;
  char *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t (*v37)(void);
  char v38;
  char *v39;
  uint64_t v40;
  uint64_t (*v41)(uint64_t);
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t (*v45)(void);
  char v46;
  char *v47;
  uint64_t v48;
  uint64_t result;
  _QWORD v50[3];
  char *v51;
  id v52;
  char *v53;
  char *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;

  v50[1] = a4;
  v50[2] = a3;
  v52 = a2;
  v58 = a5;
  v59 = type metadata accessor for AlarmView(0);
  v6 = MEMORY[0x24BDAC7A8](v59);
  v8 = (char *)v50 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v6);
  v51 = (char *)v50 - v9;
  v56 = __swift_instantiateConcreteTypeFromMangledName(&qword_25639C8B8);
  MEMORY[0x24BDAC7A8](v56);
  v57 = (uint64_t)v50 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = sub_235FFBD20();
  MEMORY[0x24BDAC7A8](v11);
  v54 = (char *)v50 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = sub_235FFBE1C();
  MEMORY[0x24BDAC7A8](v13);
  v53 = (char *)v50 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = sub_235FFBE04();
  MEMORY[0x24BDAC7A8](v15);
  v16 = sub_235FFBDEC();
  MEMORY[0x24BDAC7A8](v16);
  v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_25639C5F0);
  MEMORY[0x24BDAC7A8](v17);
  v19 = (char *)v50 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_25639C5F8);
  MEMORY[0x24BDAC7A8](v20);
  v22 = (char *)v50 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  v23 = sub_235FFBED0();
  v24 = MEMORY[0x24BDAC7A8](v23);
  v26 = (char *)v50 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v24);
  v28 = (char *)v50 - v27;
  v55 = type metadata accessor for SleepAlarmView(0);
  v29 = MEMORY[0x24BDAC7A8](v55);
  v31 = (char *)v50 - ((v30 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v29);
  v33 = (char *)v50 - v32;
  if ((sub_235FFBEA0() & 1) != 0)
  {
    sub_235FF5204(a1, (uint64_t)v28, (uint64_t (*)(_QWORD))MEMORY[0x24BEA82F0]);
    if (v52)
    {
      v34 = v55;
      v51 = &v31[*(int *)(v55 + 28)];
      v52 = v52;
      sub_235FFBD5C();
      v35 = sub_235FFBD68();
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v35 - 8) + 56))(v22, 0, 1, v35);
      sub_235FFBD44();
      v36 = sub_235FFBD50();
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v36 - 8) + 56))(v19, 0, 1, v36);
      sub_235FFBDE0();
      sub_235FFBDF8();
      sub_235FFBE10();
      sub_235FFBD14();
      sub_235FFBD80();
      v37 = MEMORY[0x24BEA82F0];
      sub_235FF5204((uint64_t)v28, (uint64_t)v31, (uint64_t (*)(_QWORD))MEMORY[0x24BEA82F0]);
      *(_QWORD *)&v31[*(int *)(v34 + 20)] = v52;
      v38 = sub_235FFBEB8();
      sub_235FF542C((uint64_t)v28, (uint64_t (*)(_QWORD))v37);
      v39 = &v31[*(int *)(v34 + 24)];
      *v39 = v38 & 1;
      *((_QWORD *)v39 + 1) = 0;
      sub_235FF1BAC((uint64_t)v31, (uint64_t)v33, type metadata accessor for SleepAlarmView);
      sub_235FF5204((uint64_t)v33, v57, type metadata accessor for SleepAlarmView);
      swift_storeEnumTagMultiPayload();
      sub_235FF1BF4(&qword_25639C658, type metadata accessor for SleepAlarmView, (uint64_t)&unk_235FFC9F8);
      sub_235FF1BF4(&qword_25639C660, type metadata accessor for AlarmView, (uint64_t)&unk_235FFC9A8);
      sub_235FFBF84();
      v40 = (uint64_t)v33;
      v41 = type metadata accessor for SleepAlarmView;
      return sub_235FF542C(v40, v41);
    }
  }
  else
  {
    sub_235FF5204(a1, (uint64_t)v26, (uint64_t (*)(_QWORD))MEMORY[0x24BEA82F0]);
    if (v52)
    {
      v42 = v59;
      v52 = v52;
      sub_235FFBD5C();
      v43 = sub_235FFBD68();
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v43 - 8) + 56))(v22, 0, 1, v43);
      sub_235FFBD44();
      v44 = sub_235FFBD50();
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v44 - 8) + 56))(v19, 0, 1, v44);
      sub_235FFBDE0();
      sub_235FFBDF8();
      sub_235FFBE10();
      sub_235FFBD14();
      sub_235FFBD80();
      v45 = MEMORY[0x24BEA82F0];
      sub_235FF5204((uint64_t)v26, (uint64_t)v8, (uint64_t (*)(_QWORD))MEMORY[0x24BEA82F0]);
      *(_QWORD *)&v8[*(int *)(v42 + 20)] = v52;
      v46 = sub_235FFBEB8();
      sub_235FF542C((uint64_t)v26, (uint64_t (*)(_QWORD))v45);
      v47 = &v8[*(int *)(v42 + 24)];
      *v47 = v46 & 1;
      *((_QWORD *)v47 + 1) = 0;
      v48 = (uint64_t)v51;
      sub_235FF1BAC((uint64_t)v8, (uint64_t)v51, type metadata accessor for AlarmView);
      sub_235FF5204(v48, v57, type metadata accessor for AlarmView);
      swift_storeEnumTagMultiPayload();
      sub_235FF1BF4(&qword_25639C658, type metadata accessor for SleepAlarmView, (uint64_t)&unk_235FFC9F8);
      sub_235FF1BF4(&qword_25639C660, type metadata accessor for AlarmView, (uint64_t)&unk_235FFC9A8);
      sub_235FFBF84();
      v40 = v48;
      v41 = type metadata accessor for AlarmView;
      return sub_235FF542C(v40, v41);
    }
  }
  sub_235FFC224();
  sub_235FF1BF4(&qword_25639C320, (uint64_t (*)(uint64_t))MEMORY[0x24BEAE580], MEMORY[0x24BEAE520]);
  swift_bridgeObjectRetain();
  result = sub_235FFBF48();
  __break(1u);
  return result;
}

uint64_t sub_235FF6D8C@<X0>(uint64_t a1@<X8>)
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
  void (*v24)(char *, uint64_t);
  char *v25;
  char v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void (*v31)(char *, uint64_t, uint64_t, uint64_t);
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  char *v38;
  uint64_t v39;
  char *v40;
  uint64_t v41;
  char *v42;
  uint64_t v43;
  uint64_t v44;
  void (*v45)(char *, uint64_t);
  uint64_t v47;
  char *v48;
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
  uint64_t KeyPath;
  uint64_t v60;
  uint64_t v61;
  char v62;

  v47 = a1;
  v2 = sub_235FFBC6C();
  v57 = *(_QWORD *)(v2 - 8);
  v58 = v2;
  MEMORY[0x24BDAC7A8](v2);
  v56 = (char *)&v47 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_25639C590);
  v54 = *(_QWORD *)(v4 - 8);
  v55 = v4;
  MEMORY[0x24BDAC7A8](v4);
  v53 = (char *)&v47 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_25639C858);
  MEMORY[0x24BDAC7A8](v6);
  v48 = (char *)&v47 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_235FFBCF0();
  v51 = *(_QWORD *)(v8 - 8);
  v52 = v8;
  v9 = MEMORY[0x24BDAC7A8](v8);
  v50 = (char *)&v47 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v9);
  v12 = (char *)&v47 - v11;
  v49 = sub_235FFBDC8();
  v13 = *(_QWORD *)(v49 - 8);
  MEMORY[0x24BDAC7A8](v49);
  v15 = (char *)&v47 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = sub_235FFBDB0();
  v17 = *(_QWORD *)(v16 - 8);
  v18 = MEMORY[0x24BDAC7A8](v16);
  v20 = (char *)&v47 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v18);
  v22 = (char *)&v47 - v21;
  v23 = type metadata accessor for AlarmView(0);
  sub_235FFBD74();
  sub_235FFBED0();
  sub_235FFBDA4();
  v24 = *(void (**)(char *, uint64_t))(v17 + 8);
  v24(v20, v16);
  sub_235FFBEC4();
  sub_235FFBD98();
  (*(void (**)(char *, uint64_t))(v13 + 8))(v15, v49);
  v24(v22, v16);
  v49 = (uint64_t)v12;
  sub_235FFBCE4();
  KeyPath = swift_getKeyPath();
  swift_getKeyPath();
  v25 = (char *)(v1 + *(int *)(v23 + 24));
  v26 = *v25;
  v27 = *((_QWORD *)v25 + 1);
  LOBYTE(v60) = v26;
  v61 = v27;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25639C828);
  sub_235FFC0F8();
  if (v62 == 1)
    v28 = sub_235FFC0EC();
  else
    v28 = sub_235FFC0D4();
  v60 = v28;
  sub_235FF4ECC();
  sub_235FFBC9C();
  v29 = swift_getKeyPath();
  *(&v47 - 2) = MEMORY[0x24BDAC7A8](v29);
  swift_getKeyPath();
  v30 = sub_235FFBFC0();
  v31 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v30 - 8) + 56);
  v32 = (uint64_t)v48;
  v31(v48, 1, 1, v30);
  sub_235FFBFE4();
  sub_235FF37DC(v32, &qword_25639C858);
  sub_235FFBFCC();
  v33 = sub_235FFBFFC();
  swift_release();
  v60 = v33;
  sub_235FF4F50();
  sub_235FFBC9C();
  v34 = swift_getKeyPath();
  *(&v47 - 2) = MEMORY[0x24BDAC7A8](v34);
  swift_getKeyPath();
  v31((char *)v32, 1, 1, v30);
  sub_235FFBFE4();
  sub_235FF37DC(v32, &qword_25639C858);
  sub_235FFBFD8();
  v35 = sub_235FFBFFC();
  swift_release();
  v60 = v35;
  v36 = v49;
  sub_235FFBCC0();
  v37 = swift_getKeyPath();
  *(&v47 - 2) = MEMORY[0x24BDAC7A8](v37);
  swift_getKeyPath();
  sub_235FF4FB4();
  v38 = v53;
  sub_235FFBCCC();
  swift_release();
  v40 = v56;
  v39 = v57;
  v41 = v58;
  (*(void (**)(char *, _QWORD, uint64_t))(v57 + 104))(v56, *MEMORY[0x24BDCC0E8], v58);
  v42 = v50;
  v43 = v55;
  sub_235FFBCD8();
  (*(void (**)(char *, uint64_t))(v39 + 8))(v40, v41);
  (*(void (**)(char *, uint64_t))(v54 + 8))(v38, v43);
  sub_235FFBCA8();
  v44 = v52;
  v45 = *(void (**)(char *, uint64_t))(v51 + 8);
  v45(v42, v52);
  return ((uint64_t (*)(uint64_t, uint64_t))v45)(v36, v44);
}

uint64_t sub_235FF7308@<X0>(uint64_t a1@<X8>)
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
  unsigned __int8 *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  char v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  char v30;
  char v31;
  char v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  char v36;
  char v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  char *v41;
  uint64_t v42;
  unint64_t v43;
  uint64_t v44;
  uint64_t v45;
  char *v46;
  uint64_t v47;
  uint64_t v48;
  char *v49;
  uint64_t v50;
  uint64_t v52;
  int v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  char *v59;
  uint64_t v60;
  char *v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  char *v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  int v70;
  uint64_t v71;
  __int128 v72;
  __int128 v73;
  uint64_t v74;
  __int128 v75;
  __int128 v76;
  uint64_t v77;
  __int128 v78;
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
  uint64_t v89;

  v2 = v1;
  v69 = a1;
  v3 = type metadata accessor for AlarmView(0);
  v57 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v58 = v4;
  v68 = (uint64_t)&v52 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = sub_235FFBCB4();
  MEMORY[0x24BDAC7A8](v5);
  v7 = (uint64_t)&v52 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v64 = sub_235FFC1F4();
  v60 = *(_QWORD *)(v64 - 8);
  MEMORY[0x24BDAC7A8](v64);
  v59 = (char *)&v52 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v67 = __swift_instantiateConcreteTypeFromMangledName(&qword_25639C878);
  v66 = *(_QWORD *)(v67 - 8);
  MEMORY[0x24BDAC7A8](v67);
  v65 = (char *)&v52 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v63 = __swift_instantiateConcreteTypeFromMangledName(&qword_25639C880);
  v62 = *(_QWORD *)(v63 - 8);
  MEMORY[0x24BDAC7A8](v63);
  v61 = (char *)&v52 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = (unsigned __int8 *)(v2 + *(int *)(v3 + 24));
  v70 = *v11;
  v12 = *((_QWORD *)v11 + 1);
  LOBYTE(v81) = v70;
  v82 = v12;
  v52 = __swift_instantiateConcreteTypeFromMangledName(&qword_25639C828);
  sub_235FFC104();
  v55 = v85;
  v54 = v86;
  v53 = v87;
  sub_235FF6D8C(v7);
  v13 = sub_235FFC044();
  v15 = v14;
  LOBYTE(v7) = v16;
  v18 = v17;
  v88 = MEMORY[0x24BDF1FA8];
  v89 = MEMORY[0x24BEAD6B0];
  v19 = swift_allocObject();
  v85 = v19;
  *(_QWORD *)(v19 + 16) = v13;
  *(_QWORD *)(v19 + 24) = v15;
  *(_BYTE *)(v19 + 32) = v7 & 1;
  *(_QWORD *)(v19 + 40) = v18;
  v20 = *(int *)(sub_235FFBED0() + 36);
  v71 = v2;
  v21 = (uint64_t *)(v2 + v20);
  v22 = v21[1];
  v81 = *v21;
  v82 = v22;
  sub_235FF2600();
  swift_bridgeObjectRetain();
  v23 = sub_235FFC050();
  v25 = v24;
  LOBYTE(v2) = v26 & 1;
  sub_235FFBFB4();
  v27 = sub_235FFC038();
  v29 = v28;
  v31 = v30;
  swift_release();
  sub_235FF4EB4(v23, v25, v2);
  swift_bridgeObjectRelease();
  LOBYTE(v81) = v70;
  v56 = v12;
  v82 = v12;
  sub_235FFC0F8();
  if (v78 == 1)
    sub_235FFC0EC();
  else
    sub_235FFC0D4();
  v32 = v31 & 1;
  v33 = sub_235FFC02C();
  v35 = v34;
  v37 = v36;
  v39 = v38;
  swift_release();
  sub_235FF4EB4(v27, v29, v32);
  swift_bridgeObjectRelease();
  v83 = MEMORY[0x24BDF1FA8];
  v84 = MEMORY[0x24BEAD6B0];
  v40 = swift_allocObject();
  v81 = v40;
  *(_QWORD *)(v40 + 16) = v33;
  *(_QWORD *)(v40 + 24) = v35;
  *(_BYTE *)(v40 + 32) = v37 & 1;
  *(_QWORD *)(v40 + 40) = v39;
  v80 = 0;
  v78 = 0u;
  v79 = 0u;
  v77 = 0;
  v76 = 0u;
  v75 = 0u;
  v74 = 0;
  v73 = 0u;
  v72 = 0u;
  v41 = v59;
  sub_235FFC1E8();
  LOBYTE(v85) = v70;
  v86 = v56;
  sub_235FFC0F8();
  LOBYTE(v85) = v81;
  v42 = v68;
  sub_235FF5204(v71, v68, type metadata accessor for AlarmView);
  v43 = (*(unsigned __int8 *)(v57 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v57 + 80);
  v44 = swift_allocObject();
  sub_235FF1BAC(v42, v44 + v43, type metadata accessor for AlarmView);
  v45 = sub_235FF1BF4(&qword_25639C888, (uint64_t (*)(uint64_t))MEMORY[0x24BEAE258], MEMORY[0x24BEAE248]);
  v46 = v65;
  v47 = v64;
  sub_235FFC0C8();
  swift_release();
  (*(void (**)(char *, uint64_t))(v60 + 8))(v41, v47);
  sub_235FF5204(v71, v42, type metadata accessor for AlarmView);
  v48 = swift_allocObject();
  sub_235FF1BAC(v42, v48 + v43, type metadata accessor for AlarmView);
  v85 = v47;
  v86 = MEMORY[0x24BEE1328];
  v87 = v45;
  v88 = MEMORY[0x24BEE1340];
  swift_getOpaqueTypeConformance2();
  v49 = v61;
  v50 = v67;
  sub_235FFC080();
  swift_release();
  (*(void (**)(char *, uint64_t))(v66 + 8))(v46, v50);
  return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v62 + 32))(v69, v49, v63);
}

uint64_t sub_235FF797C()
{
  uint64_t v0;
  NSObject *v1;
  os_log_type_t v2;
  uint8_t *v3;
  uint64_t v4;

  if (qword_25639C318 != -1)
    swift_once();
  v0 = sub_235FFBF0C();
  __swift_project_value_buffer(v0, (uint64_t)qword_25639C610);
  v1 = sub_235FFBEF4();
  v2 = sub_235FFC254();
  if (os_log_type_enabled(v1, v2))
  {
    v3 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)v3 = 67109120;
    sub_235FFC260();
    _os_log_impl(&dword_235FEF000, v1, v2, "[AlarmView.sendDirectInvocation]: %{BOOL}d", v3, 8u);
    MEMORY[0x23B7EA1E4](v3, -1, -1);
  }

  type metadata accessor for AlarmView(0);
  v4 = sub_235FFBE70();
  swift_bridgeObjectRelease();
  sub_235FF5B90(v4);
  swift_bridgeObjectRelease();
  sub_235FFC218();
  return swift_bridgeObjectRelease();
}

uint64_t sub_235FF7B28(uint64_t a1)
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
  char *v12;
  uint64_t v13;
  NSObject *v14;
  os_log_type_t v15;
  uint8_t *v16;
  uint64_t v17;
  char *v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint8_t *v23;
  uint8_t *v24;
  uint64_t v25;
  uint64_t v27;
  uint64_t v28;

  v2 = sub_235FFBE34();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v27 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_25639C678);
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)&v27 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = sub_235FFBD38();
  v10 = *(_QWORD *)(v9 - 8);
  MEMORY[0x24BDAC7A8](v9);
  v12 = (char *)&v27 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_25639C318 != -1)
    swift_once();
  v13 = sub_235FFBF0C();
  __swift_project_value_buffer(v13, (uint64_t)qword_25639C610);
  v14 = sub_235FFBEF4();
  v15 = sub_235FFC254();
  if (os_log_type_enabled(v14, v15))
  {
    v16 = (uint8_t *)swift_slowAlloc();
    v28 = v10;
    v17 = v9;
    v18 = v12;
    v19 = v5;
    v20 = a1;
    v21 = v3;
    v22 = v2;
    v23 = v16;
    *(_WORD *)v16 = 0;
    _os_log_impl(&dword_235FEF000, v14, v15, "[AlarmView.onSnippetTapped]: Performing punchout", v16, 2u);
    v24 = v23;
    v2 = v22;
    v3 = v21;
    a1 = v20;
    v5 = v19;
    v12 = v18;
    v9 = v17;
    v10 = v28;
    MEMORY[0x23B7EA1E4](v24, -1, -1);
  }

  v25 = sub_235FFBED0();
  sub_235FFB824(a1 + *(int *)(v25 + 56), (uint64_t)v8, &qword_25639C678);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v10 + 48))(v8, 1, v9) == 1)
    return sub_235FF37DC((uint64_t)v8, &qword_25639C678);
  (*(void (**)(char *, char *, uint64_t))(v10 + 32))(v12, v8, v9);
  type metadata accessor for AlarmView(0);
  sub_235FFBD2C();
  sub_235FFBE28();
  sub_235FFC20C();
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  return (*(uint64_t (**)(char *, uint64_t))(v10 + 8))(v12, v9);
}

uint64_t sub_235FF7DBC@<X0>(uint64_t a1@<X8>)
{
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
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  char *v20;
  void (*v21)(char *, uint64_t);
  char *v22;
  uint64_t v23;
  void (*v24)(char *, uint64_t, uint64_t, uint64_t);
  uint64_t v25;
  uint64_t v26;
  char *v27;
  uint64_t v28;
  char *v29;
  uint64_t v30;
  char *v31;
  uint64_t v32;
  uint64_t v33;
  void (*v34)(char *, uint64_t);
  uint64_t v36;
  char *v37;
  char *v38;
  char *v39;
  uint64_t v40;
  uint64_t v41;
  char *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t KeyPath;
  uint64_t v52;

  v47 = a1;
  v46 = sub_235FFBC6C();
  v44 = *(_QWORD *)(v46 - 8);
  MEMORY[0x24BDAC7A8](v46);
  v42 = (char *)&v36 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  v43 = __swift_instantiateConcreteTypeFromMangledName(&qword_25639C590);
  v45 = *(_QWORD *)(v43 - 8);
  MEMORY[0x24BDAC7A8](v43);
  v39 = (char *)&v36 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_25639C858);
  MEMORY[0x24BDAC7A8](v3);
  v5 = (char *)&v36 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_235FFBCF0();
  v40 = *(_QWORD *)(v6 - 8);
  v41 = v6;
  v7 = MEMORY[0x24BDAC7A8](v6);
  v38 = (char *)&v36 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v7);
  v37 = (char *)&v36 - v9;
  v10 = sub_235FFBDC8();
  v11 = *(_QWORD *)(v10 - 8);
  MEMORY[0x24BDAC7A8](v10);
  v13 = (char *)&v36 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = sub_235FFBDB0();
  v15 = *(_QWORD *)(v14 - 8);
  v16 = MEMORY[0x24BDAC7A8](v14);
  v18 = (char *)&v36 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v16);
  v20 = (char *)&v36 - v19;
  type metadata accessor for SleepAlarmView(0);
  sub_235FFBD74();
  sub_235FFBED0();
  sub_235FFBDA4();
  v21 = *(void (**)(char *, uint64_t))(v15 + 8);
  v21(v18, v14);
  sub_235FFBEC4();
  sub_235FFBD98();
  (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v10);
  v21(v20, v14);
  v22 = v37;
  sub_235FFBCE4();
  KeyPath = swift_getKeyPath();
  swift_getKeyPath();
  v52 = sub_235FFC0EC();
  sub_235FF4ECC();
  sub_235FFBC9C();
  v50 = swift_getKeyPath();
  swift_getKeyPath();
  v23 = sub_235FFBFC0();
  v24 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v23 - 8) + 56);
  v24(v5, 1, 1, v23);
  sub_235FFBFE4();
  sub_235FF37DC((uint64_t)v5, &qword_25639C858);
  sub_235FFBFCC();
  v25 = sub_235FFBFFC();
  swift_release();
  v52 = v25;
  sub_235FF4F50();
  sub_235FFBC9C();
  v49 = swift_getKeyPath();
  swift_getKeyPath();
  v24(v5, 1, 1, v23);
  sub_235FFBFE4();
  sub_235FF37DC((uint64_t)v5, &qword_25639C858);
  sub_235FFBFD8();
  v26 = sub_235FFBFFC();
  swift_release();
  v52 = v26;
  sub_235FFBCC0();
  v48 = swift_getKeyPath();
  swift_getKeyPath();
  sub_235FF4FB4();
  v27 = v39;
  sub_235FFBCCC();
  swift_release();
  v28 = v44;
  v29 = v42;
  v30 = v46;
  (*(void (**)(char *, _QWORD, uint64_t))(v44 + 104))(v42, *MEMORY[0x24BDCC0E8], v46);
  v31 = v38;
  v32 = v43;
  sub_235FFBCD8();
  (*(void (**)(char *, uint64_t))(v28 + 8))(v29, v30);
  (*(void (**)(char *, uint64_t))(v45 + 8))(v27, v32);
  sub_235FFBCA8();
  v33 = v41;
  v34 = *(void (**)(char *, uint64_t))(v40 + 8);
  v34(v31, v41);
  return ((uint64_t (*)(char *, uint64_t))v34)(v22, v33);
}

uint64_t sub_235FF8294@<X0>(uint64_t a1@<X8>)
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
  char *v19;
  uint64_t v20;
  char *v21;
  uint64_t v22;
  uint64_t v23;
  char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t *v27;
  unint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
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
  char v44;
  unint64_t v45;
  char *v46;
  char v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  unint64_t v52;
  uint64_t v53;
  unint64_t v54;
  char *v55;
  uint64_t v56;
  char *v57;
  uint64_t v58;
  uint64_t v60;
  uint64_t v61;
  char *v62;
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
  char *v73;
  uint64_t v74;
  uint64_t v75;
  char *v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  char *v80;
  uint64_t v81;
  unsigned __int8 v82;
  uint64_t v83;
  unint64_t v84;

  v2 = v1;
  v81 = a1;
  v79 = __swift_instantiateConcreteTypeFromMangledName(&qword_25639C7F0);
  MEMORY[0x24BDAC7A8](v79);
  v80 = (char *)&v60 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = type metadata accessor for SleepAlarmView(0);
  v5 = *(_QWORD *)(v4 - 8);
  v69 = v4;
  v70 = v5;
  MEMORY[0x24BDAC7A8](v4);
  v71 = v6;
  v72 = (uint64_t)&v60 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_25639C7F8);
  MEMORY[0x24BDAC7A8](v7);
  v68 = (char *)&v60 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v75 = __swift_instantiateConcreteTypeFromMangledName(&qword_25639C800);
  MEMORY[0x24BDAC7A8](v75);
  v74 = (uint64_t)&v60 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_25639C808);
  v77 = *(_QWORD *)(v10 - 8);
  v78 = v10;
  v11 = MEMORY[0x24BDAC7A8](v10);
  v73 = (char *)&v60 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v11);
  v76 = (char *)&v60 - v13;
  v14 = sub_235FFBE40();
  v65 = *(_QWORD *)(v14 - 8);
  v66 = v14;
  MEMORY[0x24BDAC7A8](v14);
  v62 = (char *)&v60 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = sub_235FFBE58();
  MEMORY[0x24BDAC7A8](v16);
  v17 = sub_235FFC140();
  v63 = *(_QWORD *)(v17 - 8);
  MEMORY[0x24BDAC7A8](v17);
  v19 = (char *)&v60 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  v64 = __swift_instantiateConcreteTypeFromMangledName(&qword_25639C810);
  v67 = *(_QWORD *)(v64 - 8);
  MEMORY[0x24BDAC7A8](v64);
  v21 = (char *)&v60 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  v22 = __swift_instantiateConcreteTypeFromMangledName(&qword_25639C818);
  MEMORY[0x24BDAC7A8](v22);
  v24 = (char *)&v60 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  v25 = sub_235FFBED0();
  v26 = *(int *)(v25 + 52);
  v27 = (uint64_t *)(v1 + *(int *)(v25 + 48));
  v28 = v27[1];
  v83 = *v27;
  v84 = v28;
  v29 = v2 + v26;
  v30 = sub_235FFBDEC();
  v31 = *(_QWORD *)(v30 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v31 + 16))(v24, v29, v30);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v31 + 56))(v24, 0, 1, v30);
  sub_235FF2600();
  swift_bridgeObjectRetain();
  v32 = v2;
  v61 = sub_235FFC278();
  v34 = v33;
  sub_235FF37DC((uint64_t)v24, &qword_25639C818);
  swift_bridgeObjectRelease();
  sub_235FFBE4C();
  sub_235FFC14C();
  v36 = v65;
  v35 = v66;
  v37 = v62;
  (*(void (**)(char *, _QWORD, uint64_t))(v65 + 104))(v62, *MEMORY[0x24BEAAC18], v66);
  v38 = sub_235FF1BF4(&qword_25639C820, (uint64_t (*)(uint64_t))MEMORY[0x24BEADA38], MEMORY[0x24BEADA20]);
  sub_235FFC074();
  (*(void (**)(char *, uint64_t))(v36 + 8))(v37, v35);
  v39 = v19;
  v40 = (uint64_t)v68;
  (*(void (**)(char *, uint64_t))(v63 + 8))(v39, v17);
  v83 = v17;
  v84 = v38;
  swift_getOpaqueTypeConformance2();
  v41 = v64;
  v42 = sub_235FFC05C();
  (*(void (**)(char *, uint64_t))(v67 + 8))(v21, v41);
  v43 = v32 + *(int *)(v69 + 24);
  v44 = *(_BYTE *)v43;
  v45 = *(_QWORD *)(v43 + 8);
  LOBYTE(v83) = v44;
  v84 = v45;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25639C828);
  sub_235FFC0F8();
  LODWORD(v41) = v82;
  *(_QWORD *)v40 = sub_235FFBF78();
  *(_QWORD *)(v40 + 8) = 0;
  *(_BYTE *)(v40 + 16) = 1;
  v46 = (char *)(v40 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_25639C830) + 44));
  if ((_DWORD)v41 == 1)
    sub_235FF8A60(v32, v42, v61, v34, v46);
  else
    sub_235FF9060(v32, v42, v61, v34, v46);
  swift_bridgeObjectRelease();
  v47 = sub_235FFBF90();
  v48 = v74;
  sub_235FFB824(v40, v74, &qword_25639C7F8);
  v49 = v75;
  v50 = v48 + *(int *)(v75 + 36);
  *(_BYTE *)v50 = v47;
  *(_OWORD *)(v50 + 8) = 0u;
  *(_OWORD *)(v50 + 24) = 0u;
  *(_BYTE *)(v50 + 40) = 1;
  sub_235FF37DC(v40, &qword_25639C7F8);
  v51 = v72;
  sub_235FF5204(v32, v72, type metadata accessor for SleepAlarmView);
  v52 = (*(unsigned __int8 *)(v70 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v70 + 80);
  v53 = swift_allocObject();
  sub_235FF1BAC(v51, v53 + v52, type metadata accessor for SleepAlarmView);
  v54 = sub_235FFB4F4();
  v55 = v73;
  sub_235FFC080();
  swift_release();
  sub_235FF37DC(v48, &qword_25639C800);
  v57 = v76;
  v56 = v77;
  v58 = v78;
  (*(void (**)(char *, char *, uint64_t))(v77 + 32))(v76, v55, v78);
  (*(void (**)(char *, char *, uint64_t))(v56 + 16))(v80, v57, v58);
  swift_storeEnumTagMultiPayload();
  v83 = v49;
  v84 = v54;
  swift_getOpaqueTypeConformance2();
  sub_235FFBF84();
  swift_release();
  return (*(uint64_t (**)(char *, uint64_t))(v56 + 8))(v57, v58);
}

uint64_t sub_235FF8A60@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, char *a5@<X8>)
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
  uint64_t *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char v21;
  char v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  char v26;
  char v27;
  char v28;
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
  char v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  char v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  char v52;
  char v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  char v57;
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
  void (*v69)(char *, char *, uint64_t);
  char *v70;
  uint64_t v71;
  char *v72;
  uint64_t v73;
  void (*v74)(char *, uint64_t);
  _QWORD v76[2];
  uint64_t v77;
  uint64_t v78;
  __int128 v79;
  char *v80;
  char *v81;
  uint64_t v82;
  char *v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  char *v89;
  char *v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  __int128 v94;
  __int128 v95;
  uint64_t v96;
  __int128 v97;
  __int128 v98;
  uint64_t v99;
  __int128 v100;
  __int128 v101;
  uint64_t v102;
  __int128 v103;
  __int128 v104;
  uint64_t v105;
  __int128 v106;
  __int128 v107;
  uint64_t v108;
  __int128 v109;
  __int128 v110;
  uint64_t v111;
  __int128 v112;
  __int128 v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;

  *(_QWORD *)&v79 = a3;
  *((_QWORD *)&v79 + 1) = a4;
  v77 = a2;
  v76[0] = a1;
  v89 = a5;
  v6 = sub_235FFBCB4();
  MEMORY[0x24BDAC7A8](v6);
  v78 = (uint64_t)v76 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_235FFC1DC();
  v87 = *(_QWORD *)(v8 - 8);
  v88 = v8;
  MEMORY[0x24BDAC7A8](v8);
  v83 = (char *)v76 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v86 = __swift_instantiateConcreteTypeFromMangledName(&qword_25639C848);
  v10 = MEMORY[0x24BDAC7A8](v86);
  v80 = (char *)v76 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v10);
  v84 = (uint64_t)v76 - v12;
  v85 = sub_235FFC1A0();
  v82 = *(_QWORD *)(v85 - 8);
  v13 = MEMORY[0x24BDAC7A8](v85);
  v81 = (char *)v76 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v13);
  v90 = (char *)v76 - v15;
  v16 = (uint64_t *)(a1 + *(int *)(sub_235FFBED0() + 40));
  v17 = v16[1];
  v115 = *v16;
  v116 = v17;
  v76[1] = sub_235FF2600();
  swift_bridgeObjectRetain();
  v18 = sub_235FFC050();
  v20 = v19;
  v22 = v21 & 1;
  sub_235FFC014();
  v23 = sub_235FFC038();
  v25 = v24;
  v27 = v26;
  swift_release();
  v28 = v27 & 1;
  sub_235FF4EB4(v18, v20, v22);
  swift_bridgeObjectRelease();
  sub_235FFC0EC();
  v29 = sub_235FFC02C();
  v31 = v30;
  v33 = v32;
  v35 = v34;
  swift_release();
  sub_235FF4EB4(v23, v25, v28);
  swift_bridgeObjectRelease();
  v117 = MEMORY[0x24BDF1FA8];
  v118 = MEMORY[0x24BEAD6B0];
  v36 = MEMORY[0x24BDF1FA8];
  v37 = swift_allocObject();
  v115 = v37;
  *(_QWORD *)(v37 + 16) = v29;
  *(_QWORD *)(v37 + 24) = v31;
  *(_BYTE *)(v37 + 32) = v33 & 1;
  *(_QWORD *)(v37 + 40) = v35;
  v114 = 0;
  v112 = 0u;
  v113 = 0u;
  v111 = 0;
  v109 = 0u;
  v110 = 0u;
  v108 = 0;
  v106 = 0u;
  v107 = 0u;
  v105 = 0;
  v103 = 0u;
  v104 = 0u;
  v102 = 0;
  v100 = 0u;
  v101 = 0u;
  v99 = 0;
  v97 = 0u;
  v98 = 0u;
  v96 = 0;
  v94 = 0u;
  v95 = 0u;
  v92 = MEMORY[0x24BDF4780];
  v93 = MEMORY[0x24BEAD938];
  v91 = v77;
  swift_retain();
  sub_235FFC194();
  sub_235FF7DBC(v78);
  v38 = sub_235FFC044();
  v40 = v39;
  LOBYTE(v29) = v41;
  v43 = v42;
  v117 = v36;
  v118 = MEMORY[0x24BEAD6B0];
  v44 = swift_allocObject();
  v115 = v44;
  *(_QWORD *)(v44 + 16) = v38;
  *(_QWORD *)(v44 + 24) = v40;
  *(_BYTE *)(v44 + 32) = v29 & 1;
  *(_QWORD *)(v44 + 40) = v43;
  v112 = v79;
  swift_bridgeObjectRetain();
  v45 = sub_235FFC050();
  v47 = v46;
  LOBYTE(v43) = v48 & 1;
  sub_235FFBFB4();
  v49 = sub_235FFC038();
  v51 = v50;
  v53 = v52;
  swift_release();
  LOBYTE(v23) = v53 & 1;
  sub_235FF4EB4(v45, v47, v43);
  swift_bridgeObjectRelease();
  sub_235FFC0EC();
  v54 = sub_235FFC02C();
  v56 = v55;
  LOBYTE(v43) = v57;
  v59 = v58;
  swift_release();
  sub_235FF4EB4(v49, v51, v23);
  swift_bridgeObjectRelease();
  *((_QWORD *)&v113 + 1) = MEMORY[0x24BDF1FA8];
  v114 = MEMORY[0x24BEAD6B0];
  v60 = swift_allocObject();
  *(_QWORD *)&v112 = v60;
  *(_QWORD *)(v60 + 16) = v54;
  *(_QWORD *)(v60 + 24) = v56;
  *(_BYTE *)(v60 + 32) = v43 & 1;
  *(_QWORD *)(v60 + 40) = v59;
  v111 = 0;
  v109 = 0u;
  v110 = 0u;
  v108 = 0;
  v106 = 0u;
  v107 = 0u;
  v105 = 0;
  v103 = 0u;
  v104 = 0u;
  v61 = v83;
  sub_235FFC1D0();
  LOBYTE(v45) = sub_235FFBF9C();
  v63 = v87;
  v62 = v88;
  v64 = (uint64_t)v80;
  (*(void (**)(char *, char *, uint64_t))(v87 + 16))(v80, v61, v88);
  v65 = v64 + *(int *)(v86 + 36);
  *(_BYTE *)v65 = v45;
  *(_OWORD *)(v65 + 8) = 0u;
  *(_OWORD *)(v65 + 24) = 0u;
  *(_BYTE *)(v65 + 40) = 1;
  (*(void (**)(char *, uint64_t))(v63 + 8))(v61, v62);
  v66 = v84;
  sub_235FFB7DC(v64, v84);
  v67 = v81;
  v68 = v82;
  v69 = *(void (**)(char *, char *, uint64_t))(v82 + 16);
  v70 = v90;
  v71 = v85;
  v69(v81, v90, v85);
  sub_235FFB824(v66, v64, &qword_25639C848);
  v72 = v89;
  v69(v89, v67, v71);
  v73 = __swift_instantiateConcreteTypeFromMangledName(&qword_25639C850);
  sub_235FFB824(v64, (uint64_t)&v72[*(int *)(v73 + 48)], &qword_25639C848);
  sub_235FF37DC(v66, &qword_25639C848);
  v74 = *(void (**)(char *, uint64_t))(v68 + 8);
  v74(v70, v71);
  sub_235FF37DC(v64, &qword_25639C848);
  return ((uint64_t (*)(char *, uint64_t))v74)(v67, v71);
}

uint64_t sub_235FF9060@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, char *a5@<X8>)
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
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char v21;
  char v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  char v26;
  char v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  char v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  char v40;
  char v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  char v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  char v51;
  char v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  char v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  char v63;
  char v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  char v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  char v72;
  char v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  char *v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  char *v83;
  uint64_t v84;
  void (*v85)(char *, char *, uint64_t);
  char *v86;
  uint64_t v87;
  char *v88;
  uint64_t v89;
  void (*v90)(char *, uint64_t);
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  char *v95;
  __int128 v96;
  char *v97;
  char *v98;
  uint64_t v99;
  char *v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  char *v106;
  unint64_t v107;
  char *v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  __int128 v112;
  __int128 v113;
  uint64_t v114;
  __int128 v115;
  __int128 v116;
  uint64_t v117;
  __int128 v118;
  __int128 v119;
  uint64_t v120;
  __int128 v121;
  __int128 v122;
  uint64_t v123;
  __int128 v124;
  __int128 v125;
  uint64_t v126;
  __int128 v127;
  __int128 v128;
  uint64_t v129;
  __int128 v130;
  __int128 v131;
  uint64_t v132;
  uint64_t v133;
  uint64_t v134;
  uint64_t v135;
  uint64_t v136;

  *(_QWORD *)&v96 = a3;
  *((_QWORD *)&v96 + 1) = a4;
  v93 = a1;
  v94 = a2;
  v5 = a1;
  v106 = a5;
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_25639C858);
  MEMORY[0x24BDAC7A8](v6);
  v95 = (char *)&v92 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_235FFC1DC();
  v104 = *(_QWORD *)(v8 - 8);
  v105 = v8;
  MEMORY[0x24BDAC7A8](v8);
  v100 = (char *)&v92 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v103 = __swift_instantiateConcreteTypeFromMangledName(&qword_25639C848);
  v10 = MEMORY[0x24BDAC7A8](v103);
  v97 = (char *)&v92 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v10);
  v101 = (uint64_t)&v92 - v12;
  v102 = sub_235FFC1A0();
  v99 = *(_QWORD *)(v102 - 8);
  v13 = MEMORY[0x24BDAC7A8](v102);
  v98 = (char *)&v92 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v13);
  v108 = (char *)&v92 - v15;
  v92 = sub_235FFBED0();
  v16 = (uint64_t *)(v5 + *(int *)(v92 + 40));
  v17 = v16[1];
  v133 = *v16;
  v134 = v17;
  v107 = sub_235FF2600();
  swift_bridgeObjectRetain();
  v18 = sub_235FFC050();
  v20 = v19;
  v22 = v21 & 1;
  sub_235FFC014();
  v23 = sub_235FFC038();
  v25 = v24;
  v27 = v26;
  swift_release();
  LOBYTE(v5) = v27 & 1;
  sub_235FF4EB4(v18, v20, v22);
  swift_bridgeObjectRelease();
  sub_235FFC0EC();
  v28 = sub_235FFC02C();
  v30 = v29;
  LOBYTE(v18) = v31;
  v33 = v32;
  swift_release();
  sub_235FF4EB4(v23, v25, v5);
  swift_bridgeObjectRelease();
  v135 = MEMORY[0x24BDF1FA8];
  v136 = MEMORY[0x24BEAD6B0];
  v34 = swift_allocObject();
  v133 = v34;
  *(_QWORD *)(v34 + 16) = v28;
  *(_QWORD *)(v34 + 24) = v30;
  *(_BYTE *)(v34 + 32) = v18 & 1;
  *(_QWORD *)(v34 + 40) = v33;
  v132 = 0;
  v130 = 0u;
  v131 = 0u;
  v129 = 0;
  v127 = 0u;
  v128 = 0u;
  v126 = 0;
  v124 = 0u;
  v125 = 0u;
  v123 = 0;
  v121 = 0u;
  v122 = 0u;
  v120 = 0;
  v118 = 0u;
  v119 = 0u;
  v117 = 0;
  v115 = 0u;
  v116 = 0u;
  v114 = 0;
  v112 = 0u;
  v113 = 0u;
  v110 = MEMORY[0x24BDF4780];
  v111 = MEMORY[0x24BEAD938];
  v109 = v94;
  swift_retain();
  sub_235FFC194();
  v35 = (uint64_t *)(v93 + *(int *)(v92 + 44));
  v36 = v35[1];
  v133 = *v35;
  v134 = v36;
  swift_bridgeObjectRetain();
  v37 = sub_235FFC050();
  v39 = v38;
  v41 = v40 & 1;
  v42 = sub_235FFBFC0();
  v43 = (uint64_t)v95;
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v42 - 8) + 56))(v95, 1, 1, v42);
  sub_235FFBFE4();
  sub_235FF37DC(v43, &qword_25639C858);
  v44 = sub_235FFC038();
  v46 = v45;
  LOBYTE(v18) = v47;
  swift_release();
  sub_235FF4EB4(v37, v39, v41);
  swift_bridgeObjectRelease();
  sub_235FFBFD8();
  v48 = sub_235FFC020();
  v50 = v49;
  v52 = v51 & 1;
  sub_235FF4EB4(v44, v46, v18 & 1);
  swift_bridgeObjectRelease();
  sub_235FFC0D4();
  v53 = sub_235FFC02C();
  v55 = v54;
  LOBYTE(v18) = v56;
  v58 = v57;
  swift_release();
  sub_235FF4EB4(v48, v50, v52);
  swift_bridgeObjectRelease();
  v135 = MEMORY[0x24BDF1FA8];
  v136 = MEMORY[0x24BEAD6B0];
  v59 = swift_allocObject();
  v133 = v59;
  *(_QWORD *)(v59 + 16) = v53;
  *(_QWORD *)(v59 + 24) = v55;
  *(_BYTE *)(v59 + 32) = v18 & 1;
  *(_QWORD *)(v59 + 40) = v58;
  v130 = v96;
  swift_bridgeObjectRetain();
  v60 = sub_235FFC050();
  v62 = v61;
  v64 = v63 & 1;
  sub_235FFBFB4();
  v65 = sub_235FFC038();
  v67 = v66;
  LOBYTE(v18) = v68;
  swift_release();
  LOBYTE(v23) = v18 & 1;
  sub_235FF4EB4(v60, v62, v64);
  swift_bridgeObjectRelease();
  sub_235FFC0D4();
  v69 = sub_235FFC02C();
  v71 = v70;
  v73 = v72;
  v75 = v74;
  swift_release();
  sub_235FF4EB4(v65, v67, v23);
  swift_bridgeObjectRelease();
  *((_QWORD *)&v131 + 1) = MEMORY[0x24BDF1FA8];
  v132 = MEMORY[0x24BEAD6B0];
  v76 = swift_allocObject();
  *(_QWORD *)&v130 = v76;
  *(_QWORD *)(v76 + 16) = v69;
  *(_QWORD *)(v76 + 24) = v71;
  *(_BYTE *)(v76 + 32) = v73 & 1;
  *(_QWORD *)(v76 + 40) = v75;
  v129 = 0;
  v127 = 0u;
  v128 = 0u;
  v126 = 0;
  v124 = 0u;
  v125 = 0u;
  v123 = 0;
  v121 = 0u;
  v122 = 0u;
  v77 = v100;
  sub_235FFC1D0();
  LOBYTE(v60) = sub_235FFBF9C();
  v79 = v104;
  v78 = v105;
  v80 = (uint64_t)v97;
  (*(void (**)(char *, char *, uint64_t))(v104 + 16))(v97, v77, v105);
  v81 = v80 + *(int *)(v103 + 36);
  *(_BYTE *)v81 = v60;
  *(_OWORD *)(v81 + 8) = 0u;
  *(_OWORD *)(v81 + 24) = 0u;
  *(_BYTE *)(v81 + 40) = 1;
  (*(void (**)(char *, uint64_t))(v79 + 8))(v77, v78);
  v82 = v101;
  sub_235FFB7DC(v80, v101);
  v83 = v98;
  v84 = v99;
  v85 = *(void (**)(char *, char *, uint64_t))(v99 + 16);
  v86 = v108;
  v87 = v102;
  v85(v98, v108, v102);
  sub_235FFB824(v82, v80, &qword_25639C848);
  v88 = v106;
  v85(v106, v83, v87);
  v89 = __swift_instantiateConcreteTypeFromMangledName(&qword_25639C850);
  sub_235FFB824(v80, (uint64_t)&v88[*(int *)(v89 + 48)], &qword_25639C848);
  sub_235FF37DC(v82, &qword_25639C848);
  v90 = *(void (**)(char *, uint64_t))(v84 + 8);
  v90(v86, v87);
  sub_235FF37DC(v80, &qword_25639C848);
  return ((uint64_t (*)(char *, uint64_t))v90)(v83, v87);
}

uint64_t sub_235FF97A8(uint64_t a1)
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
  char *v12;
  uint64_t v13;
  uint64_t v15;

  v2 = sub_235FFBE34();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v15 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_25639C678);
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)&v15 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = sub_235FFBD38();
  v10 = *(_QWORD *)(v9 - 8);
  MEMORY[0x24BDAC7A8](v9);
  v12 = (char *)&v15 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = sub_235FFBED0();
  sub_235FFB824(a1 + *(int *)(v13 + 56), (uint64_t)v8, &qword_25639C678);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v10 + 48))(v8, 1, v9) == 1)
    return sub_235FF37DC((uint64_t)v8, &qword_25639C678);
  (*(void (**)(char *, char *, uint64_t))(v10 + 32))(v12, v8, v9);
  type metadata accessor for SleepAlarmView(0);
  sub_235FFBD2C();
  sub_235FFBE28();
  sub_235FFC20C();
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  return (*(uint64_t (**)(char *, uint64_t))(v10 + 8))(v12, v9);
}

uint64_t static AlarmSnippet_Previews.previews.getter@<X0>(uint64_t a1@<X8>)
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
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void (*v18)(char *, uint64_t, uint64_t, uint64_t);
  _QWORD v20[2];
  uint64_t v21;
  char *v22;
  char *v23;
  char *v24;
  uint64_t v25;
  uint64_t v26;

  v25 = a1;
  v1 = sub_235FFBDEC();
  v2 = MEMORY[0x24BDAC7A8](v1);
  v24 = (char *)v20 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = MEMORY[0x24BDAC7A8](v2);
  v23 = (char *)v20 - v5;
  v6 = MEMORY[0x24BDAC7A8](v4);
  v20[1] = (char *)v20 - v7;
  MEMORY[0x24BDAC7A8](v6);
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_25639C678);
  MEMORY[0x24BDAC7A8](v8);
  v10 = (char *)v20 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = sub_235FFBDC8();
  v12 = MEMORY[0x24BDAC7A8](v11);
  v22 = (char *)v20 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = MEMORY[0x24BDAC7A8](v12);
  v20[0] = (char *)v20 - v15;
  v16 = MEMORY[0x24BDAC7A8](v14);
  MEMORY[0x24BDAC7A8](v16);
  __swift_instantiateConcreteTypeFromMangledName(&qword_25639C680);
  sub_235FFBED0();
  v21 = swift_allocObject();
  *(_OWORD *)(v21 + 16) = xmmword_235FFC840;
  sub_235FFBDBC();
  sub_235FFBDD4();
  v17 = sub_235FFBD38();
  v18 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v17 - 8) + 56);
  v18(v10, 1, 1, v17);
  sub_235FFBEAC();
  sub_235FFBDBC();
  sub_235FFBDD4();
  v18(v10, 1, 1, v17);
  sub_235FFBEAC();
  sub_235FFBDBC();
  sub_235FFBDD4();
  v18(v10, 1, 1, v17);
  sub_235FFBEAC();
  sub_235FFBDBC();
  sub_235FFBDD4();
  v18(v10, 1, 1, v17);
  sub_235FFBEAC();
  v26 = v21;
  sub_235FF9F18();
  sub_235FF9F5C();
  return sub_235FFC134();
}

uint64_t sub_235FF9EA8@<X0>(uint64_t *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v3;
  uint64_t result;
  uint64_t v5;

  v3 = *a1;
  sub_235FFC224();
  sub_235FF1BF4(&qword_25639C320, (uint64_t (*)(uint64_t))MEMORY[0x24BEAE580], MEMORY[0x24BEAE520]);
  swift_bridgeObjectRetain();
  result = sub_235FFBF54();
  *a2 = result;
  a2[1] = v5;
  a2[2] = v3;
  return result;
}

unint64_t sub_235FF9F18()
{
  unint64_t result;

  result = qword_25639C688;
  if (!qword_25639C688)
  {
    result = MEMORY[0x23B7EA190](MEMORY[0x24BEA8280], MEMORY[0x24BEA8290]);
    atomic_store(result, (unint64_t *)&qword_25639C688);
  }
  return result;
}

unint64_t sub_235FF9F5C()
{
  unint64_t result;

  result = qword_25639C690;
  if (!qword_25639C690)
  {
    result = MEMORY[0x23B7EA190](&protocol conformance descriptor for AlarmSnippet, &type metadata for AlarmSnippet);
    atomic_store(result, (unint64_t *)&qword_25639C690);
  }
  return result;
}

uint64_t sub_235FF9FA0()
{
  return swift_getOpaqueTypeConformance2();
}

unint64_t sub_235FF9FB4()
{
  unint64_t result;

  result = qword_25639C698;
  if (!qword_25639C698)
  {
    result = MEMORY[0x23B7EA190](&protocol conformance descriptor for AlarmSnippet_Previews, &type metadata for AlarmSnippet_Previews);
    atomic_store(result, (unint64_t *)&qword_25639C698);
  }
  return result;
}

uint64_t sub_235FF9FF8()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_235FFA010()
{
  sub_235FFBAA8();
  return sub_235FFBF3C();
}

uint64_t sub_235FFA048()
{
  sub_235FFBAA8();
  return sub_235FFBF30();
}

uint64_t destroy for AlarmSnippet(id *a1)
{

  return swift_bridgeObjectRelease();
}

_QWORD *_s16AlarmUIFramework12AlarmSnippetVwCP_0(_QWORD *a1, uint64_t a2)
{
  void *v3;
  uint64_t v4;
  id v5;

  v3 = *(void **)a2;
  v4 = *(_QWORD *)(a2 + 8);
  *a1 = *(_QWORD *)a2;
  a1[1] = v4;
  a1[2] = *(_QWORD *)(a2 + 16);
  v5 = v3;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for AlarmSnippet(uint64_t a1, uint64_t a2)
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
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
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

uint64_t assignWithTake for AlarmSnippet(uint64_t a1, _QWORD *a2)
{
  void *v4;
  uint64_t v5;

  v4 = *(void **)a1;
  *(_QWORD *)a1 = *a2;

  v5 = a2[2];
  *(_QWORD *)(a1 + 8) = a2[1];
  *(_QWORD *)(a1 + 16) = v5;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for AlarmSnippet(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 24))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 16);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for AlarmSnippet(uint64_t result, int a2, int a3)
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
      *(_QWORD *)(result + 16) = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 24) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for AlarmSnippet()
{
  return &type metadata for AlarmSnippet;
}

ValueMetadata *type metadata accessor for AlarmSnippet_Previews()
{
  return &type metadata for AlarmSnippet_Previews;
}

unint64_t sub_235FFA24C()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[4];

  result = qword_25639C6A0;
  if (!qword_25639C6A0)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_25639C670);
    v2[2] = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_25639C628);
    v2[3] = sub_235FF247C(&qword_25639C668, &qword_25639C628, MEMORY[0x24BEADC00]);
    v2[0] = swift_getOpaqueTypeConformance2();
    v2[1] = sub_235FF247C(&qword_25639C458, &qword_25639C448, MEMORY[0x24BDF1028]);
    result = MEMORY[0x23B7EA190](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_25639C6A0);
  }
  return result;
}

uint64_t sub_235FFA318()
{
  return sub_235FF247C(&qword_25639C6A8, &qword_25639C6B0, MEMORY[0x24BEAD9F0]);
}

uint64_t sub_235FFA35C()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_235FFA36C()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t *sub_235FFA380(uint64_t *a1, uint64_t *a2, int *a3)
{
  uint64_t *v4;
  int v5;
  uint64_t v6;
  int *v7;
  uint64_t v8;
  char *v9;
  char *v10;
  uint64_t v11;
  void (*v12)(char *, char *, uint64_t);
  uint64_t v13;
  char *v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  _QWORD *v22;
  _QWORD *v23;
  uint64_t v24;
  uint64_t v25;
  _QWORD *v26;
  _QWORD *v27;
  uint64_t v28;
  uint64_t v29;
  _QWORD *v30;
  _QWORD *v31;
  uint64_t v32;
  uint64_t v33;
  _QWORD *v34;
  _QWORD *v35;
  uint64_t v36;
  uint64_t v37;
  char *v38;
  uint64_t v39;
  void (*v40)(char *, char *, uint64_t);
  uint64_t v41;
  char *v42;
  char *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  void *v50;
  char *v51;
  char *v52;
  uint64_t v53;
  char *v54;
  char *v55;
  uint64_t v56;
  void (*v57)(char *, char *, uint64_t);
  id v58;
  char *v60;

  v4 = a1;
  v5 = *(_DWORD *)(*((_QWORD *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v47 = *a2;
    *v4 = *a2;
    v4 = (uint64_t *)(v47 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    v6 = a2[1];
    *a1 = *a2;
    a1[1] = v6;
    v7 = (int *)sub_235FFBED0();
    v8 = v7[5];
    v9 = (char *)v4 + v8;
    v10 = (char *)a2 + v8;
    swift_bridgeObjectRetain();
    v11 = __swift_instantiateConcreteTypeFromMangledName(qword_25639C6B8);
    v12 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v11 - 8) + 16);
    v12(v9, v10, v11);
    v13 = v7[6];
    v14 = (char *)v4 + v13;
    v15 = (char *)a2 + v13;
    v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_25639C328);
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v16 - 8) + 16))(v14, v15, v16);
    v17 = v7[7];
    v18 = (char *)v4 + v17;
    v19 = (char *)a2 + v17;
    v20 = __swift_instantiateConcreteTypeFromMangledName(qword_25639C4F0);
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v20 - 8) + 16))(v18, v19, v20);
    v12((char *)v4 + v7[8], (char *)a2 + v7[8], v11);
    v21 = v7[9];
    v22 = (uint64_t *)((char *)v4 + v21);
    v23 = (uint64_t *)((char *)a2 + v21);
    v24 = v23[1];
    *v22 = *v23;
    v22[1] = v24;
    v25 = v7[10];
    v26 = (uint64_t *)((char *)v4 + v25);
    v27 = (uint64_t *)((char *)a2 + v25);
    v28 = v27[1];
    *v26 = *v27;
    v26[1] = v28;
    v29 = v7[11];
    v30 = (uint64_t *)((char *)v4 + v29);
    v31 = (uint64_t *)((char *)a2 + v29);
    v32 = v31[1];
    *v30 = *v31;
    v30[1] = v32;
    v33 = v7[12];
    v34 = (uint64_t *)((char *)v4 + v33);
    v35 = (uint64_t *)((char *)a2 + v33);
    v36 = v35[1];
    *v34 = *v35;
    v34[1] = v36;
    v37 = v7[13];
    v60 = (char *)v4 + v37;
    v38 = (char *)a2 + v37;
    v39 = sub_235FFBDEC();
    v40 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v39 - 8) + 16);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v40(v60, v38, v39);
    v41 = v7[14];
    v42 = (char *)v4 + v41;
    v43 = (char *)a2 + v41;
    v44 = sub_235FFBD38();
    v45 = *(_QWORD *)(v44 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v45 + 48))(v43, 1, v44))
    {
      v46 = __swift_instantiateConcreteTypeFromMangledName(&qword_25639C678);
      memcpy(v42, v43, *(_QWORD *)(*(_QWORD *)(v46 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v45 + 16))(v42, v43, v44);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v45 + 56))(v42, 0, 1, v44);
    }
    v48 = a3[5];
    v49 = a3[6];
    v50 = *(void **)((char *)a2 + v48);
    *(uint64_t *)((char *)v4 + v48) = (uint64_t)v50;
    v51 = (char *)v4 + v49;
    v52 = (char *)a2 + v49;
    *v51 = *v52;
    *((_QWORD *)v51 + 1) = *((_QWORD *)v52 + 1);
    v53 = a3[7];
    v54 = (char *)v4 + v53;
    v55 = (char *)a2 + v53;
    v56 = sub_235FFBD8C();
    v57 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v56 - 8) + 16);
    v58 = v50;
    swift_retain();
    v57(v54, v55, v56);
  }
  return v4;
}

uint64_t sub_235FFA64C(uint64_t a1, uint64_t a2)
{
  int *v4;
  uint64_t v5;
  uint64_t v6;
  void (*v7)(uint64_t, uint64_t);
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

  swift_bridgeObjectRelease();
  v4 = (int *)sub_235FFBED0();
  v5 = a1 + v4[5];
  v6 = __swift_instantiateConcreteTypeFromMangledName(qword_25639C6B8);
  v7 = *(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 8);
  v7(v5, v6);
  v8 = a1 + v4[6];
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_25639C328);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 8))(v8, v9);
  v10 = a1 + v4[7];
  v11 = __swift_instantiateConcreteTypeFromMangledName(qword_25639C4F0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 8))(v10, v11);
  v7(a1 + v4[8], v6);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v12 = a1 + v4[13];
  v13 = sub_235FFBDEC();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v13 - 8) + 8))(v12, v13);
  v14 = a1 + v4[14];
  v15 = sub_235FFBD38();
  v16 = *(_QWORD *)(v15 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v16 + 48))(v14, 1, v15))
    (*(void (**)(uint64_t, uint64_t))(v16 + 8))(v14, v15);

  swift_release();
  v17 = a1 + *(int *)(a2 + 28);
  v18 = sub_235FFBD8C();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v18 - 8) + 8))(v17, v18);
}

char *sub_235FFA7FC(char *a1, char *a2, int *a3)
{
  uint64_t v5;
  int *v6;
  uint64_t v7;
  char *v8;
  char *v9;
  uint64_t v10;
  void (*v11)(char *, char *, uint64_t);
  uint64_t v12;
  char *v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  char *v22;
  uint64_t v23;
  uint64_t v24;
  char *v25;
  char *v26;
  uint64_t v27;
  uint64_t v28;
  char *v29;
  char *v30;
  uint64_t v31;
  uint64_t v32;
  char *v33;
  char *v34;
  uint64_t v35;
  uint64_t v36;
  char *v37;
  uint64_t v38;
  void (*v39)(char *, char *, uint64_t);
  uint64_t v40;
  char *v41;
  char *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  void *v48;
  char *v49;
  char *v50;
  uint64_t v51;
  char *v52;
  char *v53;
  uint64_t v54;
  void (*v55)(char *, char *, uint64_t);
  id v56;
  char *v58;

  v5 = *((_QWORD *)a2 + 1);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *((_QWORD *)a1 + 1) = v5;
  v6 = (int *)sub_235FFBED0();
  v7 = v6[5];
  v8 = &a1[v7];
  v9 = &a2[v7];
  swift_bridgeObjectRetain();
  v10 = __swift_instantiateConcreteTypeFromMangledName(qword_25639C6B8);
  v11 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v10 - 8) + 16);
  v11(v8, v9, v10);
  v12 = v6[6];
  v13 = &a1[v12];
  v14 = &a2[v12];
  v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_25639C328);
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v15 - 8) + 16))(v13, v14, v15);
  v16 = v6[7];
  v17 = &a1[v16];
  v18 = &a2[v16];
  v19 = __swift_instantiateConcreteTypeFromMangledName(qword_25639C4F0);
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v19 - 8) + 16))(v17, v18, v19);
  v11(&a1[v6[8]], &a2[v6[8]], v10);
  v20 = v6[9];
  v21 = &a1[v20];
  v22 = &a2[v20];
  v23 = *((_QWORD *)v22 + 1);
  *(_QWORD *)v21 = *(_QWORD *)v22;
  *((_QWORD *)v21 + 1) = v23;
  v24 = v6[10];
  v25 = &a1[v24];
  v26 = &a2[v24];
  v27 = *((_QWORD *)v26 + 1);
  *(_QWORD *)v25 = *(_QWORD *)v26;
  *((_QWORD *)v25 + 1) = v27;
  v28 = v6[11];
  v29 = &a1[v28];
  v30 = &a2[v28];
  v31 = *((_QWORD *)v30 + 1);
  *(_QWORD *)v29 = *(_QWORD *)v30;
  *((_QWORD *)v29 + 1) = v31;
  v32 = v6[12];
  v33 = &a1[v32];
  v34 = &a2[v32];
  v35 = *((_QWORD *)v34 + 1);
  *(_QWORD *)v33 = *(_QWORD *)v34;
  *((_QWORD *)v33 + 1) = v35;
  v36 = v6[13];
  v58 = &a1[v36];
  v37 = &a2[v36];
  v38 = sub_235FFBDEC();
  v39 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v38 - 8) + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v39(v58, v37, v38);
  v40 = v6[14];
  v41 = &a1[v40];
  v42 = &a2[v40];
  v43 = sub_235FFBD38();
  v44 = *(_QWORD *)(v43 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v44 + 48))(v42, 1, v43))
  {
    v45 = __swift_instantiateConcreteTypeFromMangledName(&qword_25639C678);
    memcpy(v41, v42, *(_QWORD *)(*(_QWORD *)(v45 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v44 + 16))(v41, v42, v43);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v44 + 56))(v41, 0, 1, v43);
  }
  v46 = a3[5];
  v47 = a3[6];
  v48 = *(void **)&a2[v46];
  *(_QWORD *)&a1[v46] = v48;
  v49 = &a1[v47];
  v50 = &a2[v47];
  *v49 = *v50;
  *((_QWORD *)v49 + 1) = *((_QWORD *)v50 + 1);
  v51 = a3[7];
  v52 = &a1[v51];
  v53 = &a2[v51];
  v54 = sub_235FFBD8C();
  v55 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v54 - 8) + 16);
  v56 = v48;
  swift_retain();
  v55(v52, v53, v54);
  return a1;
}

char *sub_235FFAA9C(char *a1, char *a2, int *a3)
{
  int *v6;
  uint64_t v7;
  char *v8;
  char *v9;
  uint64_t v10;
  void (*v11)(char *, char *, uint64_t);
  uint64_t v12;
  char *v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  char *v22;
  uint64_t v23;
  char *v24;
  char *v25;
  uint64_t v26;
  char *v27;
  char *v28;
  uint64_t v29;
  char *v30;
  char *v31;
  uint64_t v32;
  char *v33;
  char *v34;
  uint64_t v35;
  uint64_t v36;
  char *v37;
  char *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t (*v41)(char *, uint64_t, uint64_t);
  int v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  void *v46;
  id v47;
  uint64_t v48;
  char *v49;
  char *v50;
  uint64_t v51;
  char *v52;
  char *v53;
  uint64_t v54;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  *((_QWORD *)a1 + 1) = *((_QWORD *)a2 + 1);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v6 = (int *)sub_235FFBED0();
  v7 = v6[5];
  v8 = &a1[v7];
  v9 = &a2[v7];
  v10 = __swift_instantiateConcreteTypeFromMangledName(qword_25639C6B8);
  v11 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v10 - 8) + 24);
  v11(v8, v9, v10);
  v12 = v6[6];
  v13 = &a1[v12];
  v14 = &a2[v12];
  v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_25639C328);
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v15 - 8) + 24))(v13, v14, v15);
  v16 = v6[7];
  v17 = &a1[v16];
  v18 = &a2[v16];
  v19 = __swift_instantiateConcreteTypeFromMangledName(qword_25639C4F0);
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v19 - 8) + 24))(v17, v18, v19);
  v11(&a1[v6[8]], &a2[v6[8]], v10);
  v20 = v6[9];
  v21 = &a1[v20];
  v22 = &a2[v20];
  *(_QWORD *)v21 = *(_QWORD *)v22;
  *((_QWORD *)v21 + 1) = *((_QWORD *)v22 + 1);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v23 = v6[10];
  v24 = &a1[v23];
  v25 = &a2[v23];
  *(_QWORD *)v24 = *(_QWORD *)v25;
  *((_QWORD *)v24 + 1) = *((_QWORD *)v25 + 1);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v26 = v6[11];
  v27 = &a1[v26];
  v28 = &a2[v26];
  *(_QWORD *)v27 = *(_QWORD *)v28;
  *((_QWORD *)v27 + 1) = *((_QWORD *)v28 + 1);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v29 = v6[12];
  v30 = &a1[v29];
  v31 = &a2[v29];
  *(_QWORD *)v30 = *(_QWORD *)v31;
  *((_QWORD *)v30 + 1) = *((_QWORD *)v31 + 1);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v32 = v6[13];
  v33 = &a1[v32];
  v34 = &a2[v32];
  v35 = sub_235FFBDEC();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v35 - 8) + 24))(v33, v34, v35);
  v36 = v6[14];
  v37 = &a1[v36];
  v38 = &a2[v36];
  v39 = sub_235FFBD38();
  v40 = *(_QWORD *)(v39 - 8);
  v41 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v40 + 48);
  LODWORD(v10) = v41(v37, 1, v39);
  v42 = v41(v38, 1, v39);
  if (!(_DWORD)v10)
  {
    if (!v42)
    {
      (*(void (**)(char *, char *, uint64_t))(v40 + 24))(v37, v38, v39);
      goto LABEL_7;
    }
    (*(void (**)(char *, uint64_t))(v40 + 8))(v37, v39);
    goto LABEL_6;
  }
  if (v42)
  {
LABEL_6:
    v43 = __swift_instantiateConcreteTypeFromMangledName(&qword_25639C678);
    memcpy(v37, v38, *(_QWORD *)(*(_QWORD *)(v43 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(char *, char *, uint64_t))(v40 + 16))(v37, v38, v39);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v40 + 56))(v37, 0, 1, v39);
LABEL_7:
  v44 = a3[5];
  v45 = *(void **)&a2[v44];
  v46 = *(void **)&a1[v44];
  *(_QWORD *)&a1[v44] = v45;
  v47 = v45;

  v48 = a3[6];
  v49 = &a1[v48];
  v50 = &a2[v48];
  *v49 = *v50;
  *((_QWORD *)v49 + 1) = *((_QWORD *)v50 + 1);
  swift_retain();
  swift_release();
  v51 = a3[7];
  v52 = &a1[v51];
  v53 = &a2[v51];
  v54 = sub_235FFBD8C();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v54 - 8) + 24))(v52, v53, v54);
  return a1;
}

char *sub_235FFADCC(char *a1, char *a2, int *a3)
{
  int *v6;
  uint64_t v7;
  char *v8;
  char *v9;
  uint64_t v10;
  void (*v11)(char *, char *, uint64_t);
  uint64_t v12;
  char *v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  char *v22;
  uint64_t v23;
  uint64_t v24;
  char *v25;
  char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  char *v32;
  char *v33;
  uint64_t v34;

  *(_OWORD *)a1 = *(_OWORD *)a2;
  v6 = (int *)sub_235FFBED0();
  v7 = v6[5];
  v8 = &a1[v7];
  v9 = &a2[v7];
  v10 = __swift_instantiateConcreteTypeFromMangledName(qword_25639C6B8);
  v11 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v10 - 8) + 32);
  v11(v8, v9, v10);
  v12 = v6[6];
  v13 = &a1[v12];
  v14 = &a2[v12];
  v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_25639C328);
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v15 - 8) + 32))(v13, v14, v15);
  v16 = v6[7];
  v17 = &a1[v16];
  v18 = &a2[v16];
  v19 = __swift_instantiateConcreteTypeFromMangledName(qword_25639C4F0);
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v19 - 8) + 32))(v17, v18, v19);
  v11(&a1[v6[8]], &a2[v6[8]], v10);
  *(_OWORD *)&a1[v6[9]] = *(_OWORD *)&a2[v6[9]];
  *(_OWORD *)&a1[v6[10]] = *(_OWORD *)&a2[v6[10]];
  *(_OWORD *)&a1[v6[11]] = *(_OWORD *)&a2[v6[11]];
  *(_OWORD *)&a1[v6[12]] = *(_OWORD *)&a2[v6[12]];
  v20 = v6[13];
  v21 = &a1[v20];
  v22 = &a2[v20];
  v23 = sub_235FFBDEC();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v23 - 8) + 32))(v21, v22, v23);
  v24 = v6[14];
  v25 = &a1[v24];
  v26 = &a2[v24];
  v27 = sub_235FFBD38();
  v28 = *(_QWORD *)(v27 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v28 + 48))(v26, 1, v27))
  {
    v29 = __swift_instantiateConcreteTypeFromMangledName(&qword_25639C678);
    memcpy(v25, v26, *(_QWORD *)(*(_QWORD *)(v29 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v28 + 32))(v25, v26, v27);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v28 + 56))(v25, 0, 1, v27);
  }
  v30 = a3[6];
  *(_QWORD *)&a1[a3[5]] = *(_QWORD *)&a2[a3[5]];
  *(_OWORD *)&a1[v30] = *(_OWORD *)&a2[v30];
  v31 = a3[7];
  v32 = &a1[v31];
  v33 = &a2[v31];
  v34 = sub_235FFBD8C();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v34 - 8) + 32))(v32, v33, v34);
  return a1;
}

char *sub_235FFAFE8(char *a1, char *a2, int *a3)
{
  uint64_t v6;
  int *v7;
  uint64_t v8;
  char *v9;
  char *v10;
  uint64_t v11;
  void (*v12)(char *, char *, uint64_t);
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
  uint64_t *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  char *v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  char *v32;
  uint64_t *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  char *v37;
  uint64_t *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  char *v42;
  char *v43;
  uint64_t v44;
  uint64_t v45;
  char *v46;
  char *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t (*v50)(char *, uint64_t, uint64_t);
  int v51;
  uint64_t v52;
  uint64_t v53;
  void *v54;
  uint64_t v55;
  char *v56;
  char *v57;
  uint64_t v58;
  char *v59;
  char *v60;
  uint64_t v61;

  v6 = *((_QWORD *)a2 + 1);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *((_QWORD *)a1 + 1) = v6;
  swift_bridgeObjectRelease();
  v7 = (int *)sub_235FFBED0();
  v8 = v7[5];
  v9 = &a1[v8];
  v10 = &a2[v8];
  v11 = __swift_instantiateConcreteTypeFromMangledName(qword_25639C6B8);
  v12 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v11 - 8) + 40);
  v12(v9, v10, v11);
  v13 = v7[6];
  v14 = &a1[v13];
  v15 = &a2[v13];
  v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_25639C328);
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v16 - 8) + 40))(v14, v15, v16);
  v17 = v7[7];
  v18 = &a1[v17];
  v19 = &a2[v17];
  v20 = __swift_instantiateConcreteTypeFromMangledName(qword_25639C4F0);
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v20 - 8) + 40))(v18, v19, v20);
  v12(&a1[v7[8]], &a2[v7[8]], v11);
  v21 = v7[9];
  v22 = &a1[v21];
  v23 = (uint64_t *)&a2[v21];
  v25 = *v23;
  v24 = v23[1];
  *(_QWORD *)v22 = v25;
  *((_QWORD *)v22 + 1) = v24;
  swift_bridgeObjectRelease();
  v26 = v7[10];
  v27 = &a1[v26];
  v28 = (uint64_t *)&a2[v26];
  v30 = *v28;
  v29 = v28[1];
  *(_QWORD *)v27 = v30;
  *((_QWORD *)v27 + 1) = v29;
  swift_bridgeObjectRelease();
  v31 = v7[11];
  v32 = &a1[v31];
  v33 = (uint64_t *)&a2[v31];
  v35 = *v33;
  v34 = v33[1];
  *(_QWORD *)v32 = v35;
  *((_QWORD *)v32 + 1) = v34;
  swift_bridgeObjectRelease();
  v36 = v7[12];
  v37 = &a1[v36];
  v38 = (uint64_t *)&a2[v36];
  v40 = *v38;
  v39 = v38[1];
  *(_QWORD *)v37 = v40;
  *((_QWORD *)v37 + 1) = v39;
  swift_bridgeObjectRelease();
  v41 = v7[13];
  v42 = &a1[v41];
  v43 = &a2[v41];
  v44 = sub_235FFBDEC();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v44 - 8) + 40))(v42, v43, v44);
  v45 = v7[14];
  v46 = &a1[v45];
  v47 = &a2[v45];
  v48 = sub_235FFBD38();
  v49 = *(_QWORD *)(v48 - 8);
  v50 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v49 + 48);
  LODWORD(v11) = v50(v46, 1, v48);
  v51 = v50(v47, 1, v48);
  if (!(_DWORD)v11)
  {
    if (!v51)
    {
      (*(void (**)(char *, char *, uint64_t))(v49 + 40))(v46, v47, v48);
      goto LABEL_7;
    }
    (*(void (**)(char *, uint64_t))(v49 + 8))(v46, v48);
    goto LABEL_6;
  }
  if (v51)
  {
LABEL_6:
    v52 = __swift_instantiateConcreteTypeFromMangledName(&qword_25639C678);
    memcpy(v46, v47, *(_QWORD *)(*(_QWORD *)(v52 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(char *, char *, uint64_t))(v49 + 32))(v46, v47, v48);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v49 + 56))(v46, 0, 1, v48);
LABEL_7:
  v53 = a3[5];
  v54 = *(void **)&a1[v53];
  *(_QWORD *)&a1[v53] = *(_QWORD *)&a2[v53];

  v55 = a3[6];
  v56 = &a1[v55];
  v57 = &a2[v55];
  *v56 = *v57;
  *((_QWORD *)v56 + 1) = *((_QWORD *)v57 + 1);
  swift_release();
  v58 = a3[7];
  v59 = &a1[v58];
  v60 = &a2[v58];
  v61 = sub_235FFBD8C();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v61 - 8) + 40))(v59, v60, v61);
  return a1;
}

uint64_t sub_235FFB2BC()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t __swift_get_extra_inhabitant_indexTm(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t, uint64_t);
  uint64_t v10;
  unint64_t v11;

  v6 = sub_235FFBED0();
  v7 = *(_QWORD *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == (_DWORD)a2)
  {
    v8 = v6;
    v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    v10 = a1;
    return v9(v10, a2, v8);
  }
  if ((_DWORD)a2 != 0x7FFFFFFF)
  {
    v8 = sub_235FFBD8C();
    v10 = a1 + *(int *)(a3 + 28);
    v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 48);
    return v9(v10, a2, v8);
  }
  v11 = *(_QWORD *)(a1 + *(int *)(a3 + 20));
  if (v11 >= 0xFFFFFFFF)
    LODWORD(v11) = -1;
  return (v11 + 1);
}

uint64_t sub_235FFB374()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t __swift_store_extra_inhabitant_indexTm(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result;
  uint64_t v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v12;

  result = sub_235FFBED0();
  v9 = *(_QWORD *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    v10 = result;
    v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    v12 = a1;
  }
  else
  {
    if (a3 == 0x7FFFFFFF)
    {
      *(_QWORD *)(a1 + *(int *)(a4 + 20)) = (a2 - 1);
      return result;
    }
    v10 = sub_235FFBD8C();
    v12 = a1 + *(int *)(a4 + 28);
    v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 56);
  }
  return v11(v12, a2, a2, v10);
}

uint64_t sub_235FFB428()
{
  uint64_t result;
  unint64_t v1;
  unint64_t v2;

  result = sub_235FFBED0();
  if (v1 <= 0x3F)
  {
    result = sub_235FFBD8C();
    if (v2 <= 0x3F)
    {
      swift_initStructMetadata();
      return 0;
    }
  }
  return result;
}

uint64_t sub_235FFB4C4()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_235FFB4D4()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_235FFB4E4()
{
  return objectdestroy_6Tm(type metadata accessor for SleepAlarmView);
}

unint64_t sub_235FFB4F4()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_25639C838;
  if (!qword_25639C838)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_25639C800);
    v2[0] = sub_235FF247C(&qword_25639C840, &qword_25639C7F8, MEMORY[0x24BDF4700]);
    v2[1] = MEMORY[0x24BDECC60];
    result = MEMORY[0x23B7EA190](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_25639C838);
  }
  return result;
}

uint64_t sub_235FFB578()
{
  return objectdestroy_6Tm(type metadata accessor for SleepAlarmView);
}

uint64_t objectdestroy_6Tm(uint64_t (*a1)(_QWORD))
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  int *v5;
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
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;

  v2 = a1(0);
  v3 = *(unsigned __int8 *)(*(_QWORD *)(v2 - 8) + 80);
  v4 = v1 + ((v3 + 16) & ~v3);
  swift_bridgeObjectRelease();
  v5 = (int *)sub_235FFBED0();
  v6 = v4 + v5[5];
  v7 = __swift_instantiateConcreteTypeFromMangledName(qword_25639C6B8);
  v8 = *(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 8);
  v8(v6, v7);
  v9 = v4 + v5[6];
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_25639C328);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 8))(v9, v10);
  v11 = v4 + v5[7];
  v12 = __swift_instantiateConcreteTypeFromMangledName(qword_25639C4F0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 8))(v11, v12);
  v8(v4 + v5[8], v7);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v13 = v4 + v5[13];
  v14 = sub_235FFBDEC();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 8))(v13, v14);
  v15 = v4 + v5[14];
  v16 = sub_235FFBD38();
  v17 = *(_QWORD *)(v16 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v17 + 48))(v15, 1, v16))
    (*(void (**)(uint64_t, uint64_t))(v17 + 8))(v15, v16);

  swift_release();
  v18 = v4 + *(int *)(v2 + 28);
  v19 = sub_235FFBD8C();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v19 - 8) + 8))(v18, v19);
  return swift_deallocObject();
}

uint64_t sub_235FFB77C()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(unsigned __int8 *)(*(_QWORD *)(type metadata accessor for SleepAlarmView(0) - 8) + 80);
  return sub_235FF97A8(v0 + ((v1 + 16) & ~v1));
}

uint64_t sub_235FFB7AC()
{
  uint64_t v0;

  sub_235FF4EB4(*(_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 24), *(_BYTE *)(v0 + 32));
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_235FFB7DC(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_25639C848);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_235FFB824(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

void sub_235FFB868()
{
  sub_235FFBC84();
  __break(1u);
}

void sub_235FFB884()
{
  sub_235FF4ECC();
  sub_235FFBD08();
  __break(1u);
}

uint64_t sub_235FFB8A8()
{
  return 8;
}

uint64_t sub_235FFB8B4()
{
  return swift_release();
}

uint64_t sub_235FFB8BC(_QWORD *a1, _QWORD *a2)
{
  *a2 = *a1;
  return swift_retain();
}

uint64_t sub_235FFB8C8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_235FF6008(a1, a2, a3, &qword_25639C870) & 1;
}

uint64_t sub_235FFB8E8(uint64_t a1, uint64_t a2)
{
  return keypath_hashTm(a1, a2, &qword_25639C870);
}

_QWORD *sub_235FFB8F4(_QWORD *result, _QWORD *a2)
{
  *a2 = *result;
  return result;
}

void sub_235FFB900()
{
  sub_235FFBC90();
  __break(1u);
}

void sub_235FFB91C()
{
  sub_235FF4F50();
  sub_235FFBD08();
  __break(1u);
}

uint64_t sub_235FFB940()
{
  return 8;
}

uint64_t sub_235FFB94C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_235FF6008(a1, a2, a3, &qword_25639C868) & 1;
}

uint64_t sub_235FFB96C(uint64_t a1, uint64_t a2)
{
  return keypath_hashTm(a1, a2, &qword_25639C868);
}

void sub_235FFB978()
{
  sub_235FFBC78();
  __break(1u);
}

void sub_235FFB994()
{
  sub_235FF4FB4();
  sub_235FFBCFC();
  __break(1u);
}

uint64_t sub_235FFB9B8()
{
  return 8;
}

uint64_t sub_235FFB9C4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_235FF6008(a1, a2, a3, &qword_25639C860) & 1;
}

uint64_t sub_235FFB9E4(uint64_t a1, uint64_t a2)
{
  return keypath_hashTm(a1, a2, &qword_25639C860);
}

uint64_t sub_235FFB9F0()
{
  return objectdestroy_6Tm(type metadata accessor for AlarmView);
}

uint64_t sub_235FFB9FC(unsigned __int8 *a1, unsigned __int8 *a2)
{
  uint64_t result;

  type metadata accessor for AlarmView(0);
  result = *a2;
  if (*a1 != (_DWORD)result)
    return sub_235FF797C();
  return result;
}

uint64_t sub_235FFBA58()
{
  return objectdestroy_6Tm(type metadata accessor for AlarmView);
}

uint64_t sub_235FFBA64()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(unsigned __int8 *)(*(_QWORD *)(type metadata accessor for AlarmView(0) - 8) + 80);
  return sub_235FF7B28(v0 + ((v1 + 16) & ~v1));
}

_OWORD *sub_235FFBA90(_OWORD *a1, _OWORD *a2)
{
  __int128 v2;

  v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t sub_235FFBAA0()
{
  return swift_release();
}

unint64_t sub_235FFBAA8()
{
  unint64_t result;

  result = qword_25639C898;
  if (!qword_25639C898)
  {
    result = MEMORY[0x23B7EA190](&protocol conformance descriptor for AlarmSnippet_Previews, &type metadata for AlarmSnippet_Previews);
    atomic_store(result, (unint64_t *)&qword_25639C898);
  }
  return result;
}

uint64_t objectdestroyTm_1()
{
  uint64_t v0;

  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_235FFBB1C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;

  return sub_235FF66EC(a1, *(void **)(v2 + 16), *(_QWORD *)(v2 + 24), *(_QWORD *)(v2 + 32), a2);
}

unint64_t sub_235FFBB2C()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[4];

  result = qword_25639C8C0;
  if (!qword_25639C8C0)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_25639C8C8);
    v2[2] = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_25639C800);
    v2[3] = sub_235FFB4F4();
    v2[0] = swift_getOpaqueTypeConformance2();
    v2[1] = v2[0];
    result = MEMORY[0x23B7EA190](MEMORY[0x24BDEF3E0], v1, v2);
    atomic_store(result, (unint64_t *)&qword_25639C8C0);
  }
  return result;
}

uint64_t sub_235FFBBB8()
{
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_25639C878);
  sub_235FFC1F4();
  sub_235FF1BF4(&qword_25639C888, (uint64_t (*)(uint64_t))MEMORY[0x24BEAE258], MEMORY[0x24BEAE248]);
  swift_getOpaqueTypeConformance2();
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_235FFBC6C()
{
  return MEMORY[0x24BDCC138]();
}

uint64_t sub_235FFBC78()
{
  return MEMORY[0x24BDCC1A8]();
}

uint64_t sub_235FFBC84()
{
  return MEMORY[0x24BDEAD50]();
}

uint64_t sub_235FFBC90()
{
  return MEMORY[0x24BDEAD60]();
}

uint64_t sub_235FFBC9C()
{
  return MEMORY[0x24BDCC2D8]();
}

uint64_t sub_235FFBCA8()
{
  return MEMORY[0x24BDCC358]();
}

uint64_t sub_235FFBCB4()
{
  return MEMORY[0x24BDCC5A8]();
}

uint64_t sub_235FFBCC0()
{
  return MEMORY[0x24BDCC848]();
}

uint64_t sub_235FFBCCC()
{
  return MEMORY[0x24BDCC868]();
}

uint64_t sub_235FFBCD8()
{
  return MEMORY[0x24BDCC878]();
}

uint64_t sub_235FFBCE4()
{
  return MEMORY[0x24BDCC890]();
}

uint64_t sub_235FFBCF0()
{
  return MEMORY[0x24BDCC898]();
}

uint64_t sub_235FFBCFC()
{
  return MEMORY[0x24BDCD2D0]();
}

uint64_t sub_235FFBD08()
{
  return MEMORY[0x24BDEAD90]();
}

uint64_t sub_235FFBD14()
{
  return MEMORY[0x24BDCD6C8]();
}

uint64_t sub_235FFBD20()
{
  return MEMORY[0x24BDCD6D8]();
}

uint64_t sub_235FFBD2C()
{
  return MEMORY[0x24BDCD820]();
}

uint64_t sub_235FFBD38()
{
  return MEMORY[0x24BDCDAC0]();
}

uint64_t sub_235FFBD44()
{
  return MEMORY[0x24BDCDED0]();
}

uint64_t sub_235FFBD50()
{
  return MEMORY[0x24BDCDEE8]();
}

uint64_t sub_235FFBD5C()
{
  return MEMORY[0x24BDCDF18]();
}

uint64_t sub_235FFBD68()
{
  return MEMORY[0x24BDCDF30]();
}

uint64_t sub_235FFBD74()
{
  return MEMORY[0x24BDCDFF0]();
}

uint64_t sub_235FFBD80()
{
  return MEMORY[0x24BDCE020]();
}

uint64_t sub_235FFBD8C()
{
  return MEMORY[0x24BDCE2A0]();
}

uint64_t sub_235FFBD98()
{
  return MEMORY[0x24BDCE300]();
}

uint64_t sub_235FFBDA4()
{
  return MEMORY[0x24BDCE308]();
}

uint64_t sub_235FFBDB0()
{
  return MEMORY[0x24BDCE318]();
}

uint64_t sub_235FFBDBC()
{
  return MEMORY[0x24BDCE8F8]();
}

uint64_t sub_235FFBDC8()
{
  return MEMORY[0x24BDCE900]();
}

uint64_t sub_235FFBDD4()
{
  return MEMORY[0x24BDCEB18]();
}

uint64_t sub_235FFBDE0()
{
  return MEMORY[0x24BDCECA0]();
}

uint64_t sub_235FFBDEC()
{
  return MEMORY[0x24BDCEEA8]();
}

uint64_t sub_235FFBDF8()
{
  return MEMORY[0x24BDCF0D0]();
}

uint64_t sub_235FFBE04()
{
  return MEMORY[0x24BDCF2D8]();
}

uint64_t sub_235FFBE10()
{
  return MEMORY[0x24BDCF4E0]();
}

uint64_t sub_235FFBE1C()
{
  return MEMORY[0x24BDCF510]();
}

uint64_t sub_235FFBE28()
{
  return MEMORY[0x24BEAA6A8]();
}

uint64_t sub_235FFBE34()
{
  return MEMORY[0x24BEAA6D8]();
}

uint64_t sub_235FFBE40()
{
  return MEMORY[0x24BEAAC48]();
}

uint64_t sub_235FFBE4C()
{
  return MEMORY[0x24BEAD2C0]();
}

uint64_t sub_235FFBE58()
{
  return MEMORY[0x24BEAD2E8]();
}

uint64_t sub_235FFBE64()
{
  return MEMORY[0x24BEA8428]();
}

uint64_t sub_235FFBE70()
{
  return MEMORY[0x24BEA8430]();
}

uint64_t sub_235FFBE7C()
{
  return MEMORY[0x24BEA8298]();
}

uint64_t sub_235FFBE88()
{
  return MEMORY[0x24BEA82A0]();
}

uint64_t sub_235FFBE94()
{
  return MEMORY[0x24BEA82C0]();
}

uint64_t sub_235FFBEA0()
{
  return MEMORY[0x24BEA82D0]();
}

uint64_t sub_235FFBEAC()
{
  return MEMORY[0x24BEA82D8]();
}

uint64_t sub_235FFBEB8()
{
  return MEMORY[0x24BEA82E0]();
}

uint64_t sub_235FFBEC4()
{
  return MEMORY[0x24BEA82E8]();
}

uint64_t sub_235FFBED0()
{
  return MEMORY[0x24BEA82F0]();
}

uint64_t sub_235FFBEDC()
{
  return MEMORY[0x24BEA8308]();
}

uint64_t sub_235FFBEE8()
{
  return MEMORY[0x24BEA8310]();
}

uint64_t sub_235FFBEF4()
{
  return MEMORY[0x24BEE78A8]();
}

uint64_t sub_235FFBF00()
{
  return MEMORY[0x24BEE78C0]();
}

uint64_t sub_235FFBF0C()
{
  return MEMORY[0x24BEE78D8]();
}

uint64_t sub_235FFBF18()
{
  return MEMORY[0x24BDEB418]();
}

uint64_t sub_235FFBF24()
{
  return MEMORY[0x24BDED388]();
}

uint64_t sub_235FFBF30()
{
  return MEMORY[0x24BDED398]();
}

uint64_t sub_235FFBF3C()
{
  return MEMORY[0x24BDED3A8]();
}

uint64_t sub_235FFBF48()
{
  return MEMORY[0x24BDEDE50]();
}

uint64_t sub_235FFBF54()
{
  return MEMORY[0x24BDEDE60]();
}

uint64_t sub_235FFBF60()
{
  return MEMORY[0x24BDEDEE8]();
}

uint64_t sub_235FFBF6C()
{
  return MEMORY[0x24BDEDEF8]();
}

uint64_t sub_235FFBF78()
{
  return MEMORY[0x24BDEEF60]();
}

uint64_t sub_235FFBF84()
{
  return MEMORY[0x24BDEF3A0]();
}

uint64_t sub_235FFBF90()
{
  return MEMORY[0x24BDF14C0]();
}

uint64_t sub_235FFBF9C()
{
  return MEMORY[0x24BDF14C8]();
}

uint64_t sub_235FFBFA8()
{
  return MEMORY[0x24BDF1560]();
}

uint64_t sub_235FFBFB4()
{
  return MEMORY[0x24BDF1580]();
}

uint64_t sub_235FFBFC0()
{
  return MEMORY[0x24BDF1678]();
}

uint64_t sub_235FFBFCC()
{
  return MEMORY[0x24BDF16B0]();
}

uint64_t sub_235FFBFD8()
{
  return MEMORY[0x24BDF16D0]();
}

uint64_t sub_235FFBFE4()
{
  return MEMORY[0x24BDF1750]();
}

uint64_t sub_235FFBFF0()
{
  return MEMORY[0x24BDF1790]();
}

uint64_t sub_235FFBFFC()
{
  return MEMORY[0x24BDF1798]();
}

uint64_t sub_235FFC008()
{
  return MEMORY[0x24BDF1828]();
}

uint64_t sub_235FFC014()
{
  return MEMORY[0x24BDF1840]();
}

uint64_t sub_235FFC020()
{
  return MEMORY[0x24BDF1BE8]();
}

uint64_t sub_235FFC02C()
{
  return MEMORY[0x24BDF1D08]();
}

uint64_t sub_235FFC038()
{
  return MEMORY[0x24BDF1DC8]();
}

uint64_t sub_235FFC044()
{
  return MEMORY[0x24BDF1FD8]();
}

uint64_t sub_235FFC050()
{
  return MEMORY[0x24BDF1FF0]();
}

uint64_t sub_235FFC05C()
{
  return MEMORY[0x24BEAD6D0]();
}

uint64_t sub_235FFC068()
{
  return MEMORY[0x24BEAD708]();
}

uint64_t sub_235FFC074()
{
  return MEMORY[0x24BEAD740]();
}

uint64_t sub_235FFC080()
{
  return MEMORY[0x24BEAD7C0]();
}

uint64_t sub_235FFC08C()
{
  return MEMORY[0x24BEAD840]();
}

uint64_t sub_235FFC098()
{
  return MEMORY[0x24BEAD898]();
}

uint64_t sub_235FFC0A4()
{
  return MEMORY[0x24BDF2088]();
}

uint64_t sub_235FFC0B0()
{
  return MEMORY[0x24BDF20A0]();
}

uint64_t sub_235FFC0BC()
{
  return MEMORY[0x24BDF2698]();
}

uint64_t sub_235FFC0C8()
{
  return MEMORY[0x24BDF38E0]();
}

uint64_t sub_235FFC0D4()
{
  return MEMORY[0x24BDF3CA8]();
}

uint64_t sub_235FFC0E0()
{
  return MEMORY[0x24BDF3CF0]();
}

uint64_t sub_235FFC0EC()
{
  return MEMORY[0x24BDF3D30]();
}

uint64_t sub_235FFC0F8()
{
  return MEMORY[0x24BDF4290]();
}

uint64_t sub_235FFC104()
{
  return MEMORY[0x24BDF42B0]();
}

uint64_t sub_235FFC110()
{
  return MEMORY[0x24BDF4340]();
}

uint64_t sub_235FFC11C()
{
  return MEMORY[0x24BDF49B8]();
}

uint64_t sub_235FFC128()
{
  return MEMORY[0x24BEAD990]();
}

uint64_t sub_235FFC134()
{
  return MEMORY[0x24BEAD9C8]();
}

uint64_t sub_235FFC140()
{
  return MEMORY[0x24BEADA38]();
}

uint64_t sub_235FFC14C()
{
  return MEMORY[0x24BEADA60]();
}

uint64_t sub_235FFC158()
{
  return MEMORY[0x24BEADBD0]();
}

uint64_t sub_235FFC164()
{
  return MEMORY[0x24BEADC38]();
}

uint64_t sub_235FFC170()
{
  return MEMORY[0x24BEADCD0]();
}

uint64_t sub_235FFC17C()
{
  return MEMORY[0x24BEADCE0]();
}

uint64_t sub_235FFC188()
{
  return MEMORY[0x24BEADE28]();
}

uint64_t sub_235FFC194()
{
  return MEMORY[0x24BEADE88]();
}

uint64_t sub_235FFC1A0()
{
  return MEMORY[0x24BEADE90]();
}

uint64_t sub_235FFC1AC()
{
  return MEMORY[0x24BEADF18]();
}

uint64_t sub_235FFC1B8()
{
  return MEMORY[0x24BEADF28]();
}

uint64_t sub_235FFC1C4()
{
  return MEMORY[0x24BEAE178]();
}

uint64_t sub_235FFC1D0()
{
  return MEMORY[0x24BEAE220]();
}

uint64_t sub_235FFC1DC()
{
  return MEMORY[0x24BEAE228]();
}

uint64_t sub_235FFC1E8()
{
  return MEMORY[0x24BEAE250]();
}

uint64_t sub_235FFC1F4()
{
  return MEMORY[0x24BEAE258]();
}

uint64_t sub_235FFC200()
{
  return MEMORY[0x24BEAE380]();
}

uint64_t sub_235FFC20C()
{
  return MEMORY[0x24BEAE550]();
}

uint64_t sub_235FFC218()
{
  return MEMORY[0x24BEAE568]();
}

uint64_t sub_235FFC224()
{
  return MEMORY[0x24BEAE580]();
}

uint64_t sub_235FFC230()
{
  return MEMORY[0x24BEE0620]();
}

uint64_t sub_235FFC23C()
{
  return MEMORY[0x24BEE0980]();
}

uint64_t sub_235FFC248()
{
  return MEMORY[0x24BEE0C10]();
}

uint64_t sub_235FFC254()
{
  return MEMORY[0x24BEE7928]();
}

uint64_t sub_235FFC260()
{
  return MEMORY[0x24BEE1F00]();
}

uint64_t sub_235FFC26C()
{
  return MEMORY[0x24BEE1F48]();
}

uint64_t sub_235FFC278()
{
  return MEMORY[0x24BDD04E8]();
}

uint64_t sub_235FFC284()
{
  return MEMORY[0x24BEE23A0]();
}

uint64_t sub_235FFC290()
{
  return MEMORY[0x24BEE2518]();
}

uint64_t sub_235FFC29C()
{
  return MEMORY[0x24BEE2838]();
}

uint64_t sub_235FFC2A8()
{
  return MEMORY[0x24BEE2F40]();
}

uint64_t sub_235FFC2B4()
{
  return MEMORY[0x24BEE3098]();
}

uint64_t sub_235FFC2C0()
{
  return MEMORY[0x24BEE30B0]();
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

id objc_retain(id a1)
{
  return (id)MEMORY[0x24BEDD2A0](a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

uint64_t swift_allocObject()
{
  return MEMORY[0x24BEE4B70]();
}

uint64_t swift_arrayDestroy()
{
  return MEMORY[0x24BEE4B98]();
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x24BEE4BC0]();
}

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x24BEE4BD0]();
}

uint64_t swift_bridgeObjectRetain_n()
{
  return MEMORY[0x24BEE4BD8]();
}

uint64_t swift_deallocObject()
{
  return MEMORY[0x24BEE4C10]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x24BEE4C38]();
}

uint64_t swift_getEnumTagSinglePayloadGeneric()
{
  return MEMORY[0x24BEE4D10]();
}

uint64_t swift_getKeyPath()
{
  return MEMORY[0x24BEE4D88]();
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

