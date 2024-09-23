uint64_t View.workoutPreview(_:isPresented:)(uint64_t a1, uint64_t a2, uint64_t a3, char a4, uint64_t a5, uint64_t a6)
{
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  int *v14;
  uint64_t v15;
  char *v16;
  char *v17;
  uint64_t v18;
  id v19;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;

  v23 = a6;
  v22 = a5;
  v10 = sub_23571A798();
  v11 = *(_QWORD *)(v10 - 8);
  MEMORY[0x24BDAC7A8]();
  v13 = (char *)&v21 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = (int *)type metadata accessor for WorkoutPreviewPresentingOverlayModifier();
  MEMORY[0x24BDAC7A8]();
  v16 = (char *)&v21 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v11 + 16))(v13, a1, v10);
  *(_QWORD *)&v16[v14[6]] = swift_getKeyPath();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256265140);
  swift_storeEnumTagMultiPayload();
  (*(void (**)(char *, char *, uint64_t))(v11 + 32))(v16, v13, v10);
  v17 = &v16[v14[5]];
  *(_QWORD *)v17 = a2;
  *((_QWORD *)v17 + 1) = a3;
  v17[16] = a4;
  v18 = v14[7];
  v19 = objc_allocWithZone((Class)sub_23571A7BC());
  swift_retain();
  swift_retain();
  *(_QWORD *)&v16[v18] = objc_msgSend(v19, sel_init);
  MEMORY[0x23B7D4B04](v16, v22, v14, v23);
  return sub_2357195C4((uint64_t)v16);
}

uint64_t type metadata accessor for WorkoutPreviewPresentingOverlayModifier()
{
  uint64_t result;

  result = qword_2562651B0;
  if (!qword_2562651B0)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_235718E7C(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _BYTE *v5;
  _BYTE v7[16];
  uint64_t v8;

  v2 = sub_23571A834();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = &v7[-((v4 + 15) & 0xFFFFFFFFFFFFFFF0)];
  type metadata accessor for WorkoutPreviewPresentingOverlayModifier();
  sub_23571935C((uint64_t)v5);
  v8 = a1;
  sub_23571A828();
  return (*(uint64_t (**)(_BYTE *, uint64_t))(v3 + 8))(v5, v2);
}

void sub_235718F28(void *a1, uint64_t a2)
{
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
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  id v27;
  uint64_t v28;
  uint64_t v29;
  char v30;
  uint64_t v31;

  v4 = type metadata accessor for WorkoutPreviewPresentingOverlayModifier();
  v5 = *(_QWORD *)(v4 - 8);
  v6 = *(_QWORD *)(v5 + 64);
  v7 = ((uint64_t (*)(void))MEMORY[0x24BDAC7A8])();
  v8 = (char *)&v25 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v7);
  v10 = (char *)&v25 - v9;
  v11 = sub_23571A798();
  v12 = *(_QWORD *)(v11 - 8);
  MEMORY[0x24BDAC7A8](v11);
  v14 = (char *)&v25 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a1)
  {
    v15 = a2 + *(int *)(v4 + 20);
    v16 = *(_QWORD *)v15;
    v17 = *(_QWORD *)(v15 + 8);
    LOBYTE(v15) = *(_BYTE *)(v15 + 16);
    v28 = v16;
    v29 = v17;
    v30 = v15;
    v27 = a1;
    v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_2562651F8);
    MEMORY[0x23B7D4B1C](&v31, v18);
    if (v31 == 1)
    {
      (*(void (**)(char *, uint64_t, uint64_t))(v12 + 16))(v14, a2, v11);
      sub_235719F88(a2, (uint64_t)v10);
      v19 = *(unsigned __int8 *)(v5 + 80);
      v26 = v11;
      v20 = (v19 + 16) & ~v19;
      v21 = swift_allocObject();
      sub_235719FD0((uint64_t)v10, v21 + v20);
      sub_235719F88(a2, (uint64_t)v8);
      v22 = swift_allocObject();
      sub_235719FD0((uint64_t)v8, v22 + v20);
      v23 = v27;
      sub_23571A7B0();

      swift_release();
      swift_release();
      (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v26);
    }
    else
    {
      v24 = v27;
      sub_23571A7A4();

    }
  }
}

uint64_t sub_235719138()
{
  type metadata accessor for WorkoutPreviewPresentingOverlayModifier();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2562651F8);
  return sub_23571A870();
}

uint64_t sub_23571919C(uint64_t result)
{
  if ((result & 1) == 0)
  {
    type metadata accessor for WorkoutPreviewPresentingOverlayModifier();
    __swift_instantiateConcreteTypeFromMangledName(&qword_2562651F8);
    return sub_23571A870();
  }
  return result;
}

uint64_t sub_23571920C()
{
  return sub_23571A7EC();
}

uint64_t sub_235719224(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char v16;
  uint64_t v17;

  v3 = *(_QWORD *)(a2 - 8);
  v4 = *(_QWORD *)(v3 + 64);
  MEMORY[0x24BDAC7A8](a1);
  v6 = v2 + *(int *)(v5 + 20);
  v7 = *(_QWORD *)v6;
  v8 = *(_QWORD *)(v6 + 8);
  LOBYTE(v6) = *(_BYTE *)(v6 + 16);
  v14 = v7;
  v15 = v8;
  v16 = v6;
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_2562651F8);
  MEMORY[0x23B7D4B1C](&v17, v9);
  LOBYTE(v14) = v17;
  sub_235719F88(v2, (uint64_t)&v13 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0));
  v10 = (*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  v11 = swift_allocObject();
  sub_235719FD0((uint64_t)&v13 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0), v11 + v10);
  __swift_instantiateConcreteTypeFromMangledName(&qword_256265200);
  sub_23571A020();
  sub_23571A858();
  return swift_release();
}

uint64_t sub_23571935C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  os_log_type_t v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;

  v2 = v1;
  v4 = sub_23571A81C();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8]();
  v7 = (char *)&v16 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_256265140);
  MEMORY[0x24BDAC7A8]();
  v9 = (char *)&v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23571A24C(v2, (uint64_t)v9);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v10 = sub_23571A834();
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(*(_QWORD *)(v10 - 8) + 32))(a1, v9, v10);
  }
  else
  {
    v12 = sub_23571A888();
    v13 = sub_23571A840();
    if (os_log_type_enabled(v13, v12))
    {
      v14 = swift_slowAlloc();
      v15 = swift_slowAlloc();
      v17 = v15;
      *(_DWORD *)v14 = 136315138;
      *(_QWORD *)(v14 + 4) = sub_23571A294(0xD000000000000022, 0x800000023571AE90, &v17);
      _os_log_impl(&dword_235717000, v13, v12, "Accessing Environment<%s>'s value outside of being installed on a View. This will always read the default value and will not update.", (uint8_t *)v14, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x23B7D4D08](v15, -1, -1);
      MEMORY[0x23B7D4D08](v14, -1, -1);
    }

    sub_23571A810();
    swift_getAtKeyPath();
    swift_release();
    return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  }
}

uint64_t sub_235719564()
{
  return sub_23571A804();
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x23B7D4CA8]((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t sub_2357195C4(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata accessor for WorkoutPreviewPresentingOverlayModifier();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_235719600(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  _QWORD v4[2];

  v1 = *(_QWORD *)(a1 + 8);
  type metadata accessor for WorkoutPreviewPresentingOverlayModifier();
  v2 = sub_23571A7F8();
  v4[0] = v1;
  v4[1] = sub_23571965C();
  return MEMORY[0x23B7D4CC0](MEMORY[0x24BDED308], v2, v4);
}

unint64_t sub_23571965C()
{
  unint64_t result;
  uint64_t v1;

  result = qword_256265148;
  if (!qword_256265148)
  {
    v1 = type metadata accessor for WorkoutPreviewPresentingOverlayModifier();
    result = MEMORY[0x23B7D4CC0](&unk_23571AB60, v1);
    atomic_store(result, (unint64_t *)&qword_256265148);
  }
  return result;
}

uint64_t *sub_2357196A4(uint64_t *a1, uint64_t *a2, int *a3)
{
  int v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  char *v11;
  uint64_t v12;
  _QWORD *v13;
  _QWORD *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  id v19;

  v5 = *(_DWORD *)(*((_QWORD *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v16 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v16 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    v7 = sub_23571A798();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a1, a2, v7);
    v8 = a3[5];
    v9 = a3[6];
    v10 = (char *)a1 + v8;
    v11 = (char *)a2 + v8;
    v12 = *((_QWORD *)v11 + 1);
    *(_QWORD *)v10 = *(_QWORD *)v11;
    *((_QWORD *)v10 + 1) = v12;
    v10[16] = v11[16];
    v13 = (uint64_t *)((char *)a1 + v9);
    v14 = (uint64_t *)((char *)a2 + v9);
    swift_retain();
    swift_retain();
    __swift_instantiateConcreteTypeFromMangledName(&qword_256265140);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v15 = sub_23571A834();
      (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v15 - 8) + 16))(v13, v14, v15);
    }
    else
    {
      *v13 = *v14;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
    v17 = a3[7];
    v18 = *(void **)((char *)a2 + v17);
    *(uint64_t *)((char *)a1 + v17) = (uint64_t)v18;
    v19 = v18;
  }
  return a1;
}

void sub_2357197D0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v4 = sub_23571A798();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(a1, v4);
  swift_release();
  swift_release();
  v5 = a1 + *(int *)(a2 + 24);
  __swift_instantiateConcreteTypeFromMangledName(&qword_256265140);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v6 = sub_23571A834();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 8))(v5, v6);
  }
  else
  {
    swift_release();
  }

}

uint64_t sub_235719884(uint64_t a1, uint64_t a2, int *a3)
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
  void *v16;
  id v17;

  v6 = sub_23571A798();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(a1, a2, v6);
  v7 = a3[5];
  v8 = a3[6];
  v9 = a1 + v7;
  v10 = a2 + v7;
  v11 = *(_QWORD *)(v10 + 8);
  *(_QWORD *)v9 = *(_QWORD *)v10;
  *(_QWORD *)(v9 + 8) = v11;
  *(_BYTE *)(v9 + 16) = *(_BYTE *)(v10 + 16);
  v12 = (_QWORD *)(a1 + v8);
  v13 = (_QWORD *)(a2 + v8);
  swift_retain();
  swift_retain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256265140);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v14 = sub_23571A834();
    (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v14 - 8) + 16))(v12, v13, v14);
  }
  else
  {
    *v12 = *v13;
    swift_retain();
  }
  swift_storeEnumTagMultiPayload();
  v15 = a3[7];
  v16 = *(void **)(a2 + v15);
  *(_QWORD *)(a1 + v15) = v16;
  v17 = v16;
  return a1;
}

uint64_t sub_235719984(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  _QWORD *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  id v17;

  v6 = sub_23571A798();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 24))(a1, a2, v6);
  v7 = a3[5];
  v8 = a1 + v7;
  v9 = a2 + v7;
  *(_QWORD *)(a1 + v7) = *(_QWORD *)(a2 + v7);
  swift_retain();
  swift_release();
  *(_QWORD *)(v8 + 8) = *(_QWORD *)(v9 + 8);
  swift_retain();
  swift_release();
  *(_BYTE *)(v8 + 16) = *(_BYTE *)(v9 + 16);
  if (a1 != a2)
  {
    v10 = a3[6];
    v11 = (_QWORD *)(a1 + v10);
    v12 = (_QWORD *)(a2 + v10);
    sub_235719ABC(a1 + v10);
    __swift_instantiateConcreteTypeFromMangledName(&qword_256265140);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v13 = sub_23571A834();
      (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v13 - 8) + 16))(v11, v12, v13);
    }
    else
    {
      *v11 = *v12;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
  }
  v14 = a3[7];
  v15 = *(void **)(a2 + v14);
  v16 = *(void **)(a1 + v14);
  *(_QWORD *)(a1 + v14) = v15;
  v17 = v15;

  return a1;
}

uint64_t sub_235719ABC(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_256265140);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_235719AFC(uint64_t a1, uint64_t a2, int *a3)
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

  v6 = sub_23571A798();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 32))(a1, a2, v6);
  v7 = a3[5];
  v8 = a3[6];
  v9 = a1 + v7;
  v10 = a2 + v7;
  *(_OWORD *)v9 = *(_OWORD *)v10;
  *(_BYTE *)(v9 + 16) = *(_BYTE *)(v10 + 16);
  v11 = (void *)(a1 + v8);
  v12 = (const void *)(a2 + v8);
  v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_256265140);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v14 = sub_23571A834();
    (*(void (**)(void *, const void *, uint64_t))(*(_QWORD *)(v14 - 8) + 32))(v11, v12, v14);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(v11, v12, *(_QWORD *)(*(_QWORD *)(v13 - 8) + 64));
  }
  *(_QWORD *)(a1 + a3[7]) = *(_QWORD *)(a2 + a3[7]);
  return a1;
}

uint64_t sub_235719BF0(uint64_t a1, uint64_t a2, int *a3)
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

  v6 = sub_23571A798();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 40))(a1, a2, v6);
  v7 = a3[5];
  v8 = a1 + v7;
  v9 = a2 + v7;
  *(_QWORD *)(a1 + v7) = *(_QWORD *)(a2 + v7);
  swift_release();
  *(_QWORD *)(v8 + 8) = *(_QWORD *)(v9 + 8);
  swift_release();
  *(_BYTE *)(v8 + 16) = *(_BYTE *)(v9 + 16);
  if (a1 != a2)
  {
    v10 = a3[6];
    v11 = (void *)(a1 + v10);
    v12 = (const void *)(a2 + v10);
    sub_235719ABC(a1 + v10);
    v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_256265140);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v14 = sub_23571A834();
      (*(void (**)(void *, const void *, uint64_t))(*(_QWORD *)(v14 - 8) + 32))(v11, v12, v14);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(v11, v12, *(_QWORD *)(*(_QWORD *)(v13 - 8) + 64));
    }
  }
  v15 = a3[7];
  v16 = *(void **)(a1 + v15);
  *(_QWORD *)(a1 + v15) = *(_QWORD *)(a2 + v15);

  return a1;
}

uint64_t sub_235719D18()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_235719D24(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t, uint64_t);
  uint64_t v10;
  unint64_t v11;

  v6 = sub_23571A798();
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
    v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_256265150);
    v10 = a1 + *(int *)(a3 + 24);
    v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 48);
    return v9(v10, a2, v8);
  }
  v11 = *(_QWORD *)(a1 + *(int *)(a3 + 20) + 8);
  if (v11 >= 0xFFFFFFFF)
    LODWORD(v11) = -1;
  return (v11 + 1);
}

uint64_t sub_235719DD4()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_235719DE0(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result;
  uint64_t v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v12;

  result = sub_23571A798();
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
      *(_QWORD *)(a1 + *(int *)(a4 + 20) + 8) = (a2 - 1);
      return result;
    }
    v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_256265150);
    v12 = a1 + *(int *)(a4 + 24);
    v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 56);
  }
  return v11(v12, a2, a2, v10);
}

void sub_235719E8C()
{
  unint64_t v0;
  unint64_t v1;

  sub_23571A798();
  if (v0 <= 0x3F)
  {
    sub_235719F24();
    if (v1 <= 0x3F)
      swift_initStructMetadata();
  }
}

void sub_235719F24()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_2562651C0)
  {
    sub_23571A834();
    v0 = sub_23571A7C8();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_2562651C0);
  }
}

uint64_t sub_235719F78()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_235719F88(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for WorkoutPreviewPresentingOverlayModifier();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_235719FD0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for WorkoutPreviewPresentingOverlayModifier();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_23571A014()
{
  return sub_23571A0C8(sub_235718E7C);
}

unint64_t sub_23571A020()
{
  unint64_t result;
  uint64_t v1;

  result = qword_256265208;
  if (!qword_256265208)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256265200);
    result = MEMORY[0x23B7D4CC0](MEMORY[0x24BDEFB78], v1);
    atomic_store(result, (unint64_t *)&qword_256265208);
  }
  return result;
}

uint64_t __swift_instantiateConcreteTypeFromMangledNameAbstract(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x23B7D4CB4](255, (char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

void sub_23571A0B0(void *a1)
{
  uint64_t v1;

  sub_235718F28(a1, *(_QWORD *)(v1 + 16));
}

uint64_t sub_23571A0BC()
{
  return sub_23571A0C8((uint64_t (*)(uint64_t))sub_235719138);
}

uint64_t sub_23571A0C8(uint64_t (*a1)(uint64_t))
{
  uint64_t v1;
  uint64_t v2;

  v2 = *(unsigned __int8 *)(*(_QWORD *)(type metadata accessor for WorkoutPreviewPresentingOverlayModifier() - 8) + 80);
  return a1(v1 + ((v2 + 16) & ~v2));
}

uint64_t objectdestroyTm()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v1 = type metadata accessor for WorkoutPreviewPresentingOverlayModifier();
  v2 = *(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80);
  v3 = v0 + ((v2 + 16) & ~v2);
  v4 = sub_23571A798();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  swift_release();
  swift_release();
  v5 = v3 + *(int *)(v1 + 24);
  __swift_instantiateConcreteTypeFromMangledName(&qword_256265140);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v6 = sub_23571A834();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 8))(v5, v6);
  }
  else
  {
    swift_release();
  }

  return swift_deallocObject();
}

uint64_t sub_23571A200(uint64_t a1)
{
  type metadata accessor for WorkoutPreviewPresentingOverlayModifier();
  return sub_23571919C(a1);
}

uint64_t sub_23571A24C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_256265140);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

unint64_t sub_23571A294(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v12[3];
  uint64_t ObjectType;

  v6 = sub_23571A364(v12, 0, 0, 1, a1, a2);
  v7 = v12[0];
  if (v6)
  {
    v8 = v6;
    ObjectType = swift_getObjectType();
    v12[0] = v8;
    v9 = *a3;
    if (*a3)
    {
      sub_23571A480((uint64_t)v12, *a3);
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
      sub_23571A480((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v12);
  return v7;
}

unint64_t sub_23571A364(unint64_t *a1, void *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
    result = sub_23571A4BC(a5, a6);
    *a1 = v11;
    return result;
  }
  if ((a5 & 0x1000000000000000) != 0)
  {
    result = (a6 & 0xFFFFFFFFFFFFFFFLL) + 32;
  }
  else
  {
    result = sub_23571A8A0();
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

uint64_t __swift_destroy_boxed_opaque_existential_0(uint64_t a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(*(_QWORD *)(a1 + 24) - 8);
  if ((*(_BYTE *)(v1 + 82) & 2) != 0)
    return swift_release();
  else
    return (*(uint64_t (**)(void))(v1 + 8))();
}

uint64_t sub_23571A480(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_23571A4BC(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v2 = sub_23571A550(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v2 = (uint64_t)sub_23571A64C(0, *(_QWORD *)(v2 + 16) + 1, 1, (char *)v2);
  v4 = *(_QWORD *)(v2 + 16);
  v3 = *(_QWORD *)(v2 + 24);
  if (v4 >= v3 >> 1)
    v2 = (uint64_t)sub_23571A64C((char *)(v3 > 1), v4 + 1, 1, (char *)v2);
  *(_QWORD *)(v2 + 16) = v4 + 1;
  *(_BYTE *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_23571A550(uint64_t a1, unint64_t a2)
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
      v3 = sub_23571A5E8(v2, 0);
      result = sub_23571A894();
      if ((v5 & 1) != 0)
        break;
      if (result == v2)
        return (uint64_t)v3;
      __break(1u);
LABEL_9:
      v2 = sub_23571A87C();
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

_QWORD *sub_23571A5E8(uint64_t a1, uint64_t a2)
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
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_256265210);
  v4 = (_QWORD *)swift_allocObject();
  v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

char *sub_23571A64C(char *result, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_256265210);
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
    if (v10 != a4 || v12 >= &v13[v8])
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

uint64_t sub_23571A738()
{
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256265200);
  sub_23571A020();
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_23571A798()
{
  return MEMORY[0x24BDFB700]();
}

uint64_t sub_23571A7A4()
{
  return MEMORY[0x24BEC6250]();
}

uint64_t sub_23571A7B0()
{
  return MEMORY[0x24BEC6258]();
}

uint64_t sub_23571A7BC()
{
  return MEMORY[0x24BEC6260]();
}

uint64_t sub_23571A7C8()
{
  return MEMORY[0x24BDEB560]();
}

uint64_t sub_23571A7D4()
{
  return MEMORY[0x24BDEBDE0]();
}

uint64_t sub_23571A7E0()
{
  return MEMORY[0x24BDEBDF0]();
}

uint64_t sub_23571A7EC()
{
  return MEMORY[0x24BDEBE00]();
}

uint64_t sub_23571A7F8()
{
  return MEMORY[0x24BDED2D0]();
}

uint64_t sub_23571A804()
{
  return MEMORY[0x24BDEE318]();
}

uint64_t sub_23571A810()
{
  return MEMORY[0x24BDEE4E0]();
}

uint64_t sub_23571A81C()
{
  return MEMORY[0x24BDEE4F8]();
}

uint64_t sub_23571A828()
{
  return MEMORY[0x24BDF1308]();
}

uint64_t sub_23571A834()
{
  return MEMORY[0x24BDF1310]();
}

uint64_t sub_23571A840()
{
  return MEMORY[0x24BDF1430]();
}

uint64_t sub_23571A84C()
{
  return MEMORY[0x24BDF38C0]();
}

uint64_t sub_23571A858()
{
  return MEMORY[0x24BDF3900]();
}

uint64_t sub_23571A864()
{
  return MEMORY[0x24BDF47B0]();
}

uint64_t sub_23571A870()
{
  return MEMORY[0x24BDF47B8]();
}

uint64_t sub_23571A87C()
{
  return MEMORY[0x24BEE0C10]();
}

uint64_t sub_23571A888()
{
  return MEMORY[0x24BEE7920]();
}

uint64_t sub_23571A894()
{
  return MEMORY[0x24BEE2518]();
}

uint64_t sub_23571A8A0()
{
  return MEMORY[0x24BEE2838]();
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

void objc_release(id a1)
{
  MEMORY[0x24BEDD188](a1);
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

uint64_t swift_deallocObject()
{
  return MEMORY[0x24BEE4C10]();
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

