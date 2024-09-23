uint64_t sub_237F11708()
{
  uint64_t v0;

  v0 = sub_237F144B8();
  __swift_allocate_value_buffer(v0, qword_2568A8CB8);
  __swift_project_value_buffer(v0, (uint64_t)qword_2568A8CB8);
  return sub_237F144AC();
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x23B827848]((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t type metadata accessor for TimeView()
{
  uint64_t result;

  result = qword_2568A8D58;
  if (!qword_2568A8D58)
    return swift_getSingletonMetadata();
  return result;
}

char *sub_237F117F8(char *a1, char **a2, uint64_t a3)
{
  int v3;
  char *v4;
  char *v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  int *v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(char *, uint64_t, uint64_t);
  char *v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  void (*v21)(char *, uint64_t, uint64_t);
  uint64_t v22;
  char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  char *v27;
  const void *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  char *v33;
  uint64_t v34;
  uint64_t v35;

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
    v9 = *(uint64_t *)((char *)a2 + v6 + 8);
    *(_QWORD *)v7 = *(char **)((char *)a2 + v6);
    *((_QWORD *)v7 + 1) = v9;
    v10 = (int *)sub_237F14488();
    v11 = v10[5];
    v12 = &v7[v11];
    v13 = v8 + v11;
    v14 = sub_237F14404();
    v15 = *(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 16);
    v16 = v4;
    swift_bridgeObjectRetain();
    v15(v12, v13, v14);
    v17 = v10[6];
    v18 = &v7[v17];
    v19 = v8 + v17;
    v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_2568A8CE8);
    v21 = *(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v20 - 8) + 16);
    v21(v18, v19, v20);
    v21(&v7[v10[7]], v8 + v10[7], v20);
    v22 = v10[8];
    v23 = &v7[v22];
    v24 = v8 + v22;
    v25 = __swift_instantiateConcreteTypeFromMangledName(&qword_2568A8CF0);
    (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v25 - 8) + 16))(v23, v24, v25);
    v26 = v10[9];
    v27 = &v7[v26];
    v28 = (const void *)(v8 + v26);
    v29 = sub_237F14380();
    v30 = *(_QWORD *)(v29 - 8);
    if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v30 + 48))(v28, 1, v29))
    {
      v31 = __swift_instantiateConcreteTypeFromMangledName(qword_2568A8CF8);
      memcpy(v27, v28, *(_QWORD *)(*(_QWORD *)(v31 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, const void *, uint64_t))(v30 + 16))(v27, v28, v29);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v30 + 56))(v27, 0, 1, v29);
    }
    v32 = *(int *)(a3 + 24);
    v33 = &v5[v32];
    v34 = (uint64_t)a2 + v32;
    v35 = sub_237F143D4();
    (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v35 - 8) + 16))(v33, v34, v35);
  }
  return v5;
}

uint64_t sub_237F11A04(id *a1, uint64_t a2)
{
  char *v4;
  int *v5;
  char *v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  void (*v10)(char *, uint64_t);
  char *v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;

  v4 = (char *)a1 + *(int *)(a2 + 20);
  swift_bridgeObjectRelease();
  v5 = (int *)sub_237F14488();
  v6 = &v4[v5[5]];
  v7 = sub_237F14404();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v7 - 8) + 8))(v6, v7);
  v8 = &v4[v5[6]];
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_2568A8CE8);
  v10 = *(void (**)(char *, uint64_t))(*(_QWORD *)(v9 - 8) + 8);
  v10(v8, v9);
  v10(&v4[v5[7]], v9);
  v11 = &v4[v5[8]];
  v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_2568A8CF0);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v12 - 8) + 8))(v11, v12);
  v13 = &v4[v5[9]];
  v14 = sub_237F14380();
  v15 = *(_QWORD *)(v14 - 8);
  if (!(*(unsigned int (**)(char *, uint64_t, uint64_t))(v15 + 48))(v13, 1, v14))
    (*(void (**)(char *, uint64_t))(v15 + 8))(v13, v14);
  v16 = (char *)a1 + *(int *)(a2 + 24);
  v17 = sub_237F143D4();
  return (*(uint64_t (**)(char *, uint64_t))(*(_QWORD *)(v17 - 8) + 8))(v16, v17);
}

_QWORD *sub_237F11B48(_QWORD *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  void *v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  int *v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(char *, uint64_t, uint64_t);
  id v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  void (*v21)(char *, uint64_t, uint64_t);
  uint64_t v22;
  char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  char *v27;
  const void *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  char *v33;
  uint64_t v34;
  uint64_t v35;

  v5 = *(void **)a2;
  v4 = *(_QWORD *)(a2 + 8);
  *a1 = *(_QWORD *)a2;
  a1[1] = v4;
  v6 = *(int *)(a3 + 20);
  v7 = (char *)a1 + v6;
  v8 = a2 + v6;
  v9 = *(_QWORD *)(a2 + v6 + 8);
  *(_QWORD *)v7 = *(_QWORD *)(a2 + v6);
  *((_QWORD *)v7 + 1) = v9;
  v10 = (int *)sub_237F14488();
  v11 = v10[5];
  v12 = &v7[v11];
  v13 = v8 + v11;
  v14 = sub_237F14404();
  v15 = *(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 16);
  v16 = v5;
  swift_bridgeObjectRetain();
  v15(v12, v13, v14);
  v17 = v10[6];
  v18 = &v7[v17];
  v19 = v8 + v17;
  v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_2568A8CE8);
  v21 = *(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v20 - 8) + 16);
  v21(v18, v19, v20);
  v21(&v7[v10[7]], v8 + v10[7], v20);
  v22 = v10[8];
  v23 = &v7[v22];
  v24 = v8 + v22;
  v25 = __swift_instantiateConcreteTypeFromMangledName(&qword_2568A8CF0);
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v25 - 8) + 16))(v23, v24, v25);
  v26 = v10[9];
  v27 = &v7[v26];
  v28 = (const void *)(v8 + v26);
  v29 = sub_237F14380();
  v30 = *(_QWORD *)(v29 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v30 + 48))(v28, 1, v29))
  {
    v31 = __swift_instantiateConcreteTypeFromMangledName(qword_2568A8CF8);
    memcpy(v27, v28, *(_QWORD *)(*(_QWORD *)(v31 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, const void *, uint64_t))(v30 + 16))(v27, v28, v29);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v30 + 56))(v27, 0, 1, v29);
  }
  v32 = *(int *)(a3 + 24);
  v33 = (char *)a1 + v32;
  v34 = a2 + v32;
  v35 = sub_237F143D4();
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v35 - 8) + 16))(v33, v34, v35);
  return a1;
}

uint64_t sub_237F11D24(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  int *v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  void (*v21)(char *, uint64_t, uint64_t);
  uint64_t v22;
  char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  char *v27;
  char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t (*v31)(char *, uint64_t, uint64_t);
  int v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;

  v6 = *(void **)a1;
  v7 = *(void **)a2;
  *(_QWORD *)a1 = *(_QWORD *)a2;
  v8 = v7;

  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  v9 = *(int *)(a3 + 20);
  v10 = (char *)(a1 + v9);
  v11 = a2 + v9;
  *(_QWORD *)v10 = *(_QWORD *)(a2 + v9);
  *((_QWORD *)v10 + 1) = *(_QWORD *)(a2 + v9 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v12 = (int *)sub_237F14488();
  v13 = v12[5];
  v14 = &v10[v13];
  v15 = v11 + v13;
  v16 = sub_237F14404();
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v16 - 8) + 24))(v14, v15, v16);
  v17 = v12[6];
  v18 = &v10[v17];
  v19 = v11 + v17;
  v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_2568A8CE8);
  v21 = *(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v20 - 8) + 24);
  v21(v18, v19, v20);
  v21(&v10[v12[7]], v11 + v12[7], v20);
  v22 = v12[8];
  v23 = &v10[v22];
  v24 = v11 + v22;
  v25 = __swift_instantiateConcreteTypeFromMangledName(&qword_2568A8CF0);
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v25 - 8) + 24))(v23, v24, v25);
  v26 = v12[9];
  v27 = &v10[v26];
  v28 = (char *)(v11 + v26);
  v29 = sub_237F14380();
  v30 = *(_QWORD *)(v29 - 8);
  v31 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v30 + 48);
  LODWORD(v20) = v31(v27, 1, v29);
  v32 = v31(v28, 1, v29);
  if (!(_DWORD)v20)
  {
    if (!v32)
    {
      (*(void (**)(char *, char *, uint64_t))(v30 + 24))(v27, v28, v29);
      goto LABEL_7;
    }
    (*(void (**)(char *, uint64_t))(v30 + 8))(v27, v29);
    goto LABEL_6;
  }
  if (v32)
  {
LABEL_6:
    v33 = __swift_instantiateConcreteTypeFromMangledName(qword_2568A8CF8);
    memcpy(v27, v28, *(_QWORD *)(*(_QWORD *)(v33 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(char *, char *, uint64_t))(v30 + 16))(v27, v28, v29);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v30 + 56))(v27, 0, 1, v29);
LABEL_7:
  v34 = *(int *)(a3 + 24);
  v35 = a1 + v34;
  v36 = a2 + v34;
  v37 = sub_237F143D4();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v37 - 8) + 24))(v35, v36, v37);
  return a1;
}

_OWORD *sub_237F11F58(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
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
  void (*v18)(char *, char *, uint64_t);
  uint64_t v19;
  char *v20;
  char *v21;
  uint64_t v22;
  uint64_t v23;
  char *v24;
  char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  char *v30;
  char *v31;
  uint64_t v32;

  *a1 = *a2;
  v6 = *(int *)(a3 + 20);
  v7 = (char *)a1 + v6;
  v8 = (char *)a2 + v6;
  *(_OWORD *)((char *)a1 + v6) = *(_OWORD *)((char *)a2 + v6);
  v9 = (int *)sub_237F14488();
  v10 = v9[5];
  v11 = &v7[v10];
  v12 = &v8[v10];
  v13 = sub_237F14404();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v13 - 8) + 32))(v11, v12, v13);
  v14 = v9[6];
  v15 = &v7[v14];
  v16 = &v8[v14];
  v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_2568A8CE8);
  v18 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v17 - 8) + 32);
  v18(v15, v16, v17);
  v18(&v7[v9[7]], &v8[v9[7]], v17);
  v19 = v9[8];
  v20 = &v7[v19];
  v21 = &v8[v19];
  v22 = __swift_instantiateConcreteTypeFromMangledName(&qword_2568A8CF0);
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v22 - 8) + 32))(v20, v21, v22);
  v23 = v9[9];
  v24 = &v7[v23];
  v25 = &v8[v23];
  v26 = sub_237F14380();
  v27 = *(_QWORD *)(v26 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v27 + 48))(v25, 1, v26))
  {
    v28 = __swift_instantiateConcreteTypeFromMangledName(qword_2568A8CF8);
    memcpy(v24, v25, *(_QWORD *)(*(_QWORD *)(v28 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v27 + 32))(v24, v25, v26);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v27 + 56))(v24, 0, 1, v26);
  }
  v29 = *(int *)(a3 + 24);
  v30 = (char *)a1 + v29;
  v31 = (char *)a2 + v29;
  v32 = sub_237F143D4();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v32 - 8) + 32))(v30, v31, v32);
  return a1;
}

uint64_t sub_237F1211C(uint64_t a1, _QWORD *a2, uint64_t a3)
{
  void *v6;
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
  char *v17;
  char *v18;
  uint64_t v19;
  void (*v20)(char *, char *, uint64_t);
  uint64_t v21;
  char *v22;
  char *v23;
  uint64_t v24;
  uint64_t v25;
  char *v26;
  char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t (*v30)(char *, uint64_t, uint64_t);
  int v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  char *v35;
  uint64_t v36;

  v6 = *(void **)a1;
  *(_QWORD *)a1 = *a2;

  *(_QWORD *)(a1 + 8) = a2[1];
  v7 = *(int *)(a3 + 20);
  v8 = (char *)(a1 + v7);
  v9 = (char *)a2 + v7;
  v10 = *(_QWORD *)((char *)a2 + v7 + 8);
  *(_QWORD *)v8 = *(_QWORD *)((char *)a2 + v7);
  *((_QWORD *)v8 + 1) = v10;
  swift_bridgeObjectRelease();
  v11 = (int *)sub_237F14488();
  v12 = v11[5];
  v13 = &v8[v12];
  v14 = &v9[v12];
  v15 = sub_237F14404();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v15 - 8) + 40))(v13, v14, v15);
  v16 = v11[6];
  v17 = &v8[v16];
  v18 = &v9[v16];
  v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_2568A8CE8);
  v20 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v19 - 8) + 40);
  v20(v17, v18, v19);
  v20(&v8[v11[7]], &v9[v11[7]], v19);
  v21 = v11[8];
  v22 = &v8[v21];
  v23 = &v9[v21];
  v24 = __swift_instantiateConcreteTypeFromMangledName(&qword_2568A8CF0);
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v24 - 8) + 40))(v22, v23, v24);
  v25 = v11[9];
  v26 = &v8[v25];
  v27 = &v9[v25];
  v28 = sub_237F14380();
  v29 = *(_QWORD *)(v28 - 8);
  v30 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v29 + 48);
  LODWORD(v19) = v30(v26, 1, v28);
  v31 = v30(v27, 1, v28);
  if (!(_DWORD)v19)
  {
    if (!v31)
    {
      (*(void (**)(char *, char *, uint64_t))(v29 + 40))(v26, v27, v28);
      goto LABEL_7;
    }
    (*(void (**)(char *, uint64_t))(v29 + 8))(v26, v28);
    goto LABEL_6;
  }
  if (v31)
  {
LABEL_6:
    v32 = __swift_instantiateConcreteTypeFromMangledName(qword_2568A8CF8);
    memcpy(v26, v27, *(_QWORD *)(*(_QWORD *)(v32 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(char *, char *, uint64_t))(v29 + 32))(v26, v27, v28);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v29 + 56))(v26, 0, 1, v28);
LABEL_7:
  v33 = *(int *)(a3 + 24);
  v34 = a1 + v33;
  v35 = (char *)a2 + v33;
  v36 = sub_237F143D4();
  (*(void (**)(uint64_t, char *, uint64_t))(*(_QWORD *)(v36 - 8) + 40))(v34, v35, v36);
  return a1;
}

uint64_t sub_237F1233C()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_237F12348(char *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  int v5;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

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
    v9 = sub_237F14488();
    v10 = *(_QWORD *)(v9 - 8);
    if (*(_DWORD *)(v10 + 84) == (_DWORD)a2)
    {
      v11 = v9;
      v12 = *(int *)(a3 + 20);
    }
    else
    {
      v11 = sub_237F143D4();
      v10 = *(_QWORD *)(v11 - 8);
      v12 = *(int *)(a3 + 24);
    }
    return (*(uint64_t (**)(char *, uint64_t, uint64_t))(v10 + 48))(&a1[v12], a2, v11);
  }
}

uint64_t sub_237F123F4()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

char *sub_237F12400(char *result, uint64_t a2, int a3, uint64_t a4)
{
  char *v5;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v5 = result;
  if (a3 == 2147483646)
  {
    *(_QWORD *)result = a2;
  }
  else
  {
    v8 = sub_237F14488();
    v9 = *(_QWORD *)(v8 - 8);
    if (*(_DWORD *)(v9 + 84) == a3)
    {
      v10 = v8;
      v11 = *(int *)(a4 + 20);
    }
    else
    {
      v10 = sub_237F143D4();
      v9 = *(_QWORD *)(v10 - 8);
      v11 = *(int *)(a4 + 24);
    }
    return (char *)(*(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(v9 + 56))(&v5[v11], a2, a2, v10);
  }
  return result;
}

uint64_t sub_237F1249C()
{
  uint64_t result;
  unint64_t v1;
  unint64_t v2;

  result = sub_237F14488();
  if (v1 <= 0x3F)
  {
    result = sub_237F143D4();
    if (v2 <= 0x3F)
    {
      swift_initStructMetadata();
      return 0;
    }
  }
  return result;
}

uint64_t sub_237F1252C()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_237F1253C@<X0>(uint64_t a1@<X8>)
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
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  char *v18;
  void (*v19)(char *, uint64_t);
  char *v20;
  uint64_t v21;
  void (*v22)(char *, uint64_t, uint64_t, uint64_t);
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  char *v26;
  uint64_t v27;
  char *v28;
  uint64_t v29;
  char *v30;
  uint64_t v31;
  uint64_t v32;
  void (*v33)(char *, uint64_t);
  char *v35;
  char *v36;
  char *v37;
  char *v38;
  uint64_t v39;
  uint64_t v40;
  char *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t KeyPath;
  uint64_t v51;

  v46 = a1;
  v45 = sub_237F142B4();
  v43 = *(_QWORD *)(v45 - 8);
  ((void (*)(void))MEMORY[0x24BDAC7A8])();
  v41 = (char *)&v35 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  v42 = __swift_instantiateConcreteTypeFromMangledName(&qword_2568A8DE0);
  v44 = *(_QWORD *)(v42 - 8);
  ((void (*)(void))MEMORY[0x24BDAC7A8])();
  v38 = (char *)&v35 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2568A8DE8);
  ((void (*)(void))MEMORY[0x24BDAC7A8])();
  v36 = (char *)&v35 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = sub_237F14338();
  v39 = *(_QWORD *)(v4 - 8);
  v40 = v4;
  v5 = ((uint64_t (*)(void))MEMORY[0x24BDAC7A8])();
  v37 = (char *)&v35 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v5);
  v35 = (char *)&v35 - v7;
  v8 = sub_237F1441C();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)&v35 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = sub_237F143F8();
  v13 = *(_QWORD *)(v12 - 8);
  v14 = MEMORY[0x24BDAC7A8](v12);
  v16 = (char *)&v35 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v14);
  v18 = (char *)&v35 - v17;
  type metadata accessor for TimeView();
  sub_237F143BC();
  sub_237F1447C();
  sub_237F143EC();
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  v19 = *(void (**)(char *, uint64_t))(v13 + 8);
  v19(v16, v12);
  sub_237F14488();
  sub_237F143E0();
  v19(v18, v12);
  v20 = v35;
  sub_237F1432C();
  KeyPath = swift_getKeyPath();
  swift_getKeyPath();
  v51 = sub_237F145E4();
  sub_237F13AD4();
  sub_237F142E4();
  v49 = swift_getKeyPath();
  swift_getKeyPath();
  v21 = sub_237F14518();
  v22 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v21 - 8) + 56);
  v23 = (uint64_t)v36;
  v22(v36, 1, 1, v21);
  sub_237F14530();
  sub_237F13B98(v23, &qword_2568A8DE8);
  sub_237F14524();
  v24 = sub_237F1453C();
  swift_release();
  v51 = v24;
  sub_237F13B48();
  sub_237F142E4();
  v48 = swift_getKeyPath();
  swift_getKeyPath();
  v22((char *)v23, 1, 1, v21);
  sub_237F14530();
  sub_237F13B98(v23, &qword_2568A8DE8);
  sub_237F14524();
  v25 = sub_237F1453C();
  swift_release();
  v51 = v25;
  sub_237F14308();
  v47 = swift_getKeyPath();
  swift_getKeyPath();
  sub_237F13BD8();
  v26 = v38;
  sub_237F14314();
  swift_release();
  v27 = v43;
  v28 = v41;
  v29 = v45;
  (*(void (**)(char *, _QWORD, uint64_t))(v43 + 104))(v41, *MEMORY[0x24BDCC0E8], v45);
  v30 = v37;
  v31 = v42;
  sub_237F14320();
  (*(void (**)(char *, uint64_t))(v27 + 8))(v28, v29);
  (*(void (**)(char *, uint64_t))(v44 + 8))(v26, v31);
  sub_237F142F0();
  v32 = v40;
  v33 = *(void (**)(char *, uint64_t))(v39 + 8);
  v33(v30, v40);
  return ((uint64_t (*)(char *, uint64_t))v33)(v20, v32);
}

uint64_t sub_237F12A28(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_237F12ADC(a1, a2, a3, &qword_2568A8E18);
}

uint64_t sub_237F12A34(uint64_t a1, uint64_t a2)
{
  return sub_237F12B3C(a1, a2, &qword_2568A8E18);
}

void sub_237F12A40()
{
  sub_237F13AD4();
  sub_237F14350();
  __break(1u);
}

void sub_237F12A64()
{
  sub_237F142CC();
  __break(1u);
}

uint64_t sub_237F12A7C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_237F12ADC(a1, a2, a3, &qword_2568A8E10);
}

uint64_t sub_237F12A88(uint64_t a1, uint64_t a2)
{
  return sub_237F12B3C(a1, a2, &qword_2568A8E10);
}

void sub_237F12A94()
{
  sub_237F13B48();
  sub_237F14350();
  __break(1u);
}

void sub_237F12AB8()
{
  sub_237F142D8();
  __break(1u);
}

uint64_t sub_237F12AD0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_237F12ADC(a1, a2, a3, &qword_2568A8E08);
}

uint64_t sub_237F12ADC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  __swift_instantiateConcreteTypeFromMangledName(a4);
  return sub_237F14644() & 1;
}

uint64_t sub_237F12B30(uint64_t a1, uint64_t a2)
{
  return sub_237F12B3C(a1, a2, &qword_2568A8E08);
}

uint64_t sub_237F12B3C(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  __swift_instantiateConcreteTypeFromMangledName(a3);
  return sub_237F14638();
}

void sub_237F12B7C()
{
  sub_237F13BD8();
  sub_237F14344();
  __break(1u);
}

void sub_237F12BA0()
{
  sub_237F142C0();
  __break(1u);
}

uint64_t sub_237F12BB8@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t KeyPath;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;

  v2 = v1;
  v40 = a1;
  v3 = sub_237F144C4();
  v38 = *(_QWORD *)(v3 - 8);
  v39 = v3;
  MEMORY[0x24BDAC7A8](v3);
  v5 = (char *)&v35 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2568A8D98);
  MEMORY[0x24BDAC7A8](v6);
  v8 = (uint64_t *)((char *)&v35 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0));
  v9 = type metadata accessor for TimeView();
  v10 = *(_QWORD *)(v9 - 8);
  v11 = *(_QWORD *)(v10 + 64);
  MEMORY[0x24BDAC7A8](v9);
  v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_2568A8DA0);
  v36 = *(_QWORD *)(v12 - 8);
  MEMORY[0x24BDAC7A8](v12);
  v14 = (char *)&v35 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v37 = __swift_instantiateConcreteTypeFromMangledName(&qword_2568A8DA8);
  v15 = *(_QWORD *)(v37 - 8);
  MEMORY[0x24BDAC7A8](v37);
  v17 = (char *)&v35 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_237F13694(v2, (uint64_t)&v35 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0));
  v18 = (*(unsigned __int8 *)(v10 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  v19 = swift_allocObject();
  sub_237F136DC((uint64_t)&v35 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0), v19 + v18, (uint64_t (*)(_QWORD))type metadata accessor for TimeView);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2568A8DB0);
  v20 = sub_237F14614();
  v21 = sub_237F1375C(&qword_2568A8DB8, (uint64_t (*)(uint64_t))MEMORY[0x24BEAE278], MEMORY[0x24BEAE268]);
  v41 = v20;
  v42 = v21;
  swift_getOpaqueTypeConformance2();
  sub_237F145F0();
  *v8 = sub_237F145D8();
  v22 = *MEMORY[0x24BEADC28];
  v23 = sub_237F145FC();
  v24 = *(_QWORD *)(v23 - 8);
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(v24 + 104))(v8, v22, v23);
  (*(void (**)(uint64_t *, _QWORD, uint64_t, uint64_t))(v24 + 56))(v8, 0, 1, v23);
  v25 = sub_237F13CF8(&qword_2568A8DC0, &qword_2568A8DA0, MEMORY[0x24BEADC00]);
  MEMORY[0x23B827698](v8, v12, v25);
  sub_237F13B98((uint64_t)v8, &qword_2568A8D98);
  (*(void (**)(char *, uint64_t))(v36 + 8))(v14, v12);
  KeyPath = swift_getKeyPath();
  v28 = v38;
  v27 = v39;
  (*(void (**)(char *, _QWORD, uint64_t))(v38 + 104))(v5, *MEMORY[0x24BDEB3F0], v39);
  v29 = __swift_instantiateConcreteTypeFromMangledName(&qword_2568A8DC8);
  v30 = v40;
  v31 = (uint64_t *)(v40 + *(int *)(v29 + 36));
  v32 = __swift_instantiateConcreteTypeFromMangledName(&qword_2568A8DD0);
  (*(void (**)(char *, char *, uint64_t))(v28 + 16))((char *)v31 + *(int *)(v32 + 28), v5, v27);
  *v31 = KeyPath;
  v33 = v37;
  (*(void (**)(uint64_t, char *, uint64_t))(v15 + 16))(v30, v17, v37);
  (*(void (**)(char *, uint64_t))(v28 + 8))(v5, v27);
  return (*(uint64_t (**)(char *, uint64_t))(v15 + 8))(v17, v33);
}

uint64_t sub_237F12F1C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
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
  char v11;
  char v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char v16;
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
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  char v37;
  char v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  char *v42;
  uint64_t v43;
  unint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  char *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  __int128 v58;
  __int128 v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;

  v49 = a1;
  v57 = a2;
  v2 = type metadata accessor for TimeView();
  v53 = *(_QWORD *)(v2 - 8);
  v54 = *(_QWORD *)(v53 + 64);
  MEMORY[0x24BDAC7A8](v2);
  v52 = (uint64_t)&v48 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = sub_237F142FC();
  MEMORY[0x24BDAC7A8](v4);
  v50 = (uint64_t)&v48 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v55 = sub_237F14614();
  v56 = *(_QWORD *)(v55 - 8);
  MEMORY[0x24BDAC7A8](v55);
  v51 = (char *)&v48 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v64 = sub_237F14470();
  v65 = v7;
  sub_237F137E0();
  v8 = sub_237F14578();
  v10 = v9;
  v12 = v11 & 1;
  sub_237F1450C();
  v13 = sub_237F14560();
  v15 = v14;
  v17 = v16;
  swift_release();
  v18 = v17 & 1;
  sub_237F13824(v8, v10, v12);
  swift_bridgeObjectRelease();
  LODWORD(v64) = sub_237F14500();
  v19 = sub_237F14554();
  v21 = v20;
  v23 = v22 & 1;
  sub_237F13824(v13, v15, v18);
  swift_bridgeObjectRelease();
  sub_237F145CC();
  v24 = sub_237F14548();
  v26 = v25;
  LOBYTE(v15) = v27;
  v29 = v28;
  swift_release();
  sub_237F13824(v19, v21, v23);
  swift_bridgeObjectRelease();
  v30 = MEMORY[0x24BDF1FA8];
  v31 = MEMORY[0x24BEAD6B0];
  v66 = MEMORY[0x24BDF1FA8];
  v67 = MEMORY[0x24BEAD6B0];
  v32 = swift_allocObject();
  v64 = v32;
  *(_QWORD *)(v32 + 16) = v24;
  *(_QWORD *)(v32 + 24) = v26;
  *(_BYTE *)(v32 + 32) = v15 & 1;
  *(_QWORD *)(v32 + 40) = v29;
  v33 = v49;
  sub_237F1253C(v50);
  v34 = sub_237F1456C();
  v36 = v35;
  v38 = v37;
  v40 = v39;
  v62 = v30;
  v63 = v31;
  v41 = swift_allocObject();
  v61 = v41;
  *(_QWORD *)(v41 + 16) = v34;
  *(_QWORD *)(v41 + 24) = v36;
  *(_BYTE *)(v41 + 32) = v38 & 1;
  *(_QWORD *)(v41 + 40) = v40;
  v60 = 0;
  v58 = 0u;
  v59 = 0u;
  v42 = v51;
  sub_237F14608();
  v43 = v52;
  sub_237F13694(v33, v52);
  v44 = (*(unsigned __int8 *)(v53 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v53 + 80);
  v45 = swift_allocObject();
  sub_237F136DC(v43, v45 + v44, (uint64_t (*)(_QWORD))type metadata accessor for TimeView);
  sub_237F1375C(&qword_2568A8DB8, (uint64_t (*)(uint64_t))MEMORY[0x24BEAE278], MEMORY[0x24BEAE268]);
  v46 = v55;
  sub_237F14590();
  swift_release();
  return (*(uint64_t (**)(char *, uint64_t))(v56 + 8))(v42, v46);
}

uint64_t sub_237F132F4()
{
  id *v0;
  id *v1;
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
  id *v20;
  uint64_t v21;
  uint64_t v22;
  uint8_t *v23;
  uint8_t *v24;
  char *v25;
  uint64_t v26;
  uint64_t result;
  id v28;
  uint64_t v29;
  uint64_t v30;

  v1 = v0;
  v2 = sub_237F14464();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v29 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = __swift_instantiateConcreteTypeFromMangledName(qword_2568A8CF8);
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)&v29 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = sub_237F14380();
  v10 = *(_QWORD *)(v9 - 8);
  MEMORY[0x24BDAC7A8](v9);
  v12 = (char *)&v29 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_2568A8CB0 != -1)
    swift_once();
  v13 = sub_237F144B8();
  __swift_project_value_buffer(v13, (uint64_t)qword_2568A8CB8);
  v14 = sub_237F144A0();
  v15 = sub_237F14650();
  if (os_log_type_enabled(v14, v15))
  {
    v16 = (uint8_t *)swift_slowAlloc();
    v30 = v10;
    v17 = v9;
    v18 = v12;
    v19 = v5;
    v20 = v1;
    v21 = v3;
    v22 = v2;
    v23 = v16;
    *(_WORD *)v16 = 0;
    _os_log_impl(&dword_237F10000, v14, v15, "[TimeView.onSnippetTapped]: Performing punchout", v16, 2u);
    v24 = v23;
    v2 = v22;
    v3 = v21;
    v1 = v20;
    v5 = v19;
    v12 = v18;
    v9 = v17;
    v10 = v30;
    MEMORY[0x23B8278B4](v24, -1, -1);
  }

  v25 = (char *)v1 + *(int *)(type metadata accessor for TimeView() + 20);
  v26 = sub_237F14488();
  sub_237F13A48((uint64_t)&v25[*(int *)(v26 + 36)], (uint64_t)v8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v10 + 48))(v8, 1, v9) == 1)
    return sub_237F13B98((uint64_t)v8, qword_2568A8CF8);
  (*(void (**)(char *, char *, uint64_t))(v10 + 32))(v12, v8, v9);
  if (*v1)
  {
    v28 = *v1;
    sub_237F14374();
    sub_237F14458();
    sub_237F14620();

    (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
    return (*(uint64_t (**)(char *, uint64_t))(v10 + 8))(v12, v9);
  }
  else
  {
    sub_237F1462C();
    sub_237F1375C(&qword_2568A8CE0, (uint64_t (*)(uint64_t))MEMORY[0x24BEAE580], MEMORY[0x24BEAE520]);
    result = sub_237F144D0();
    __break(1u);
  }
  return result;
}

uint64_t sub_237F135D4()
{
  return sub_237F144E8();
}

uint64_t sub_237F135F4(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v6;

  v2 = sub_237F144C4();
  MEMORY[0x24BDAC7A8](v2);
  (*(void (**)(char *, uint64_t))(v4 + 16))((char *)&v6 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0), a1);
  return sub_237F144F4();
}

uint64_t sub_237F13678()
{
  return sub_237F145C0();
}

uint64_t sub_237F13694(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for TimeView();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_237F136DC(uint64_t a1, uint64_t a2, uint64_t (*a3)(_QWORD))
{
  uint64_t v5;

  v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_237F13720@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;

  v3 = *(unsigned __int8 *)(*(_QWORD *)(type metadata accessor for TimeView() - 8) + 80);
  return sub_237F12F1C(v1 + ((v3 + 16) & ~v3), a1);
}

uint64_t sub_237F1375C(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = a2(255);
    result = MEMORY[0x23B827860](a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t __swift_instantiateConcreteTypeFromMangledNameAbstract(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x23B827854](255, (char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

unint64_t sub_237F137E0()
{
  unint64_t result;

  result = qword_2568A8DD8;
  if (!qword_2568A8DD8)
  {
    result = MEMORY[0x23B827860](MEMORY[0x24BEE0D50], MEMORY[0x24BEE0D00]);
    atomic_store(result, (unint64_t *)&qword_2568A8DD8);
  }
  return result;
}

uint64_t sub_237F13824(uint64_t a1, uint64_t a2, char a3)
{
  if ((a3 & 1) != 0)
    return swift_release();
  else
    return swift_bridgeObjectRelease();
}

uint64_t sub_237F13834()
{
  uint64_t v0;

  sub_237F13824(*(_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 24), *(_BYTE *)(v0 + 32));
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t objectdestroyTm()
{
  uint64_t v0;
  uint64_t v1;
  id *v2;
  char *v3;
  int *v4;
  char *v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  void (*v9)(char *, uint64_t);
  char *v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;

  v1 = type metadata accessor for TimeView();
  v2 = (id *)(v0
            + ((*(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80)));

  v3 = (char *)v2 + *(int *)(v1 + 20);
  swift_bridgeObjectRelease();
  v4 = (int *)sub_237F14488();
  v5 = &v3[v4[5]];
  v6 = sub_237F14404();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v6 - 8) + 8))(v5, v6);
  v7 = &v3[v4[6]];
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_2568A8CE8);
  v9 = *(void (**)(char *, uint64_t))(*(_QWORD *)(v8 - 8) + 8);
  v9(v7, v8);
  v9(&v3[v4[7]], v8);
  v10 = &v3[v4[8]];
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_2568A8CF0);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v11 - 8) + 8))(v10, v11);
  v12 = &v3[v4[9]];
  v13 = sub_237F14380();
  v14 = *(_QWORD *)(v13 - 8);
  if (!(*(unsigned int (**)(char *, uint64_t, uint64_t))(v14 + 48))(v12, 1, v13))
    (*(void (**)(char *, uint64_t))(v14 + 8))(v12, v13);
  v15 = (char *)v2 + *(int *)(v1 + 24);
  v16 = sub_237F143D4();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v16 - 8) + 8))(v15, v16);
  return swift_deallocObject();
}

uint64_t sub_237F139F8()
{
  type metadata accessor for TimeView();
  return sub_237F132F4();
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(_BYTE *)(*(_QWORD *)(a1 - 8) + 82) & 2) != 0)
    return *(_QWORD *)a2;
  return a2;
}

uint64_t sub_237F13A48(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(qword_2568A8CF8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
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

unint64_t sub_237F13AD4()
{
  unint64_t result;

  result = qword_2568A8DF0;
  if (!qword_2568A8DF0)
  {
    result = MEMORY[0x23B827860](MEMORY[0x24BDEACB8], MEMORY[0x24BDEACC8]);
    atomic_store(result, (unint64_t *)&qword_2568A8DF0);
  }
  return result;
}

uint64_t sub_237F13B18()
{
  return 8;
}

uint64_t sub_237F13B24()
{
  return swift_release();
}

uint64_t sub_237F13B2C(_QWORD *a1, _QWORD *a2)
{
  *a2 = *a1;
  return swift_retain();
}

_QWORD *sub_237F13B38(_QWORD *result, _QWORD *a2)
{
  *a2 = *result;
  return result;
}

unint64_t sub_237F13B48()
{
  unint64_t result;

  result = qword_2568A8DF8;
  if (!qword_2568A8DF8)
  {
    result = MEMORY[0x23B827860](MEMORY[0x24BDEACD0], MEMORY[0x24BDEACE0]);
    atomic_store(result, (unint64_t *)&qword_2568A8DF8);
  }
  return result;
}

uint64_t sub_237F13B8C()
{
  return 8;
}

uint64_t sub_237F13B98(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

unint64_t sub_237F13BD8()
{
  unint64_t result;

  result = qword_2568A8E00;
  if (!qword_2568A8E00)
  {
    result = MEMORY[0x23B827860](MEMORY[0x24BDCC150], MEMORY[0x24BDCC170]);
    atomic_store(result, (unint64_t *)&qword_2568A8E00);
  }
  return result;
}

uint64_t sub_237F13C1C()
{
  return 8;
}

unint64_t sub_237F13C2C()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[4];

  result = qword_2568A8E20;
  if (!qword_2568A8E20)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2568A8DC8);
    v2[2] = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2568A8DA0);
    v2[3] = sub_237F13CF8(&qword_2568A8DC0, &qword_2568A8DA0, MEMORY[0x24BEADC00]);
    v2[0] = swift_getOpaqueTypeConformance2();
    v2[1] = sub_237F13CF8(&qword_2568A8E28, &qword_2568A8DD0, MEMORY[0x24BDF1028]);
    result = MEMORY[0x23B827860](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_2568A8E20);
  }
  return result;
}

uint64_t sub_237F13CF8(unint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    result = MEMORY[0x23B827860](a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t ClockUIPlugin.__allocating_init()()
{
  return swift_allocObject();
}

uint64_t ClockUIPlugin.init()()
{
  uint64_t v0;

  return v0;
}

uint64_t ClockUIPlugin.snippet(for:mode:idiom:)(uint64_t a1)
{
  return sub_237F13DD8(a1);
}

uint64_t ClockUIPlugin.deinit()
{
  uint64_t v0;

  return v0;
}

uint64_t ClockUIPlugin.__deallocating_deinit()
{
  return swift_deallocClassInstance();
}

uint64_t sub_237F13D94@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  result = swift_allocObject();
  *a1 = result;
  return result;
}

uint64_t sub_237F13DC4(uint64_t a1)
{
  return sub_237F13DD8(a1);
}

uint64_t sub_237F13DD8(uint64_t a1)
{
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
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(void);
  uint64_t v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  uint64_t (*v23)(_QWORD);
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v29;
  uint64_t v30;
  char *v31;
  char *v32;

  v30 = a1;
  v1 = sub_237F14368();
  MEMORY[0x24BDAC7A8](v1);
  v32 = (char *)&v29 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v3 = sub_237F1444C();
  MEMORY[0x24BDAC7A8](v3);
  v31 = (char *)&v29 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = sub_237F14434();
  MEMORY[0x24BDAC7A8](v5);
  v6 = sub_237F1441C();
  MEMORY[0x24BDAC7A8](v6);
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_2568A8CD0);
  MEMORY[0x24BDAC7A8](v7);
  v9 = (char *)&v29 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_2568A8CD8);
  MEMORY[0x24BDAC7A8](v10);
  v12 = (char *)&v29 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = type metadata accessor for TimeView();
  MEMORY[0x24BDAC7A8](v13);
  v15 = (uint64_t *)((char *)&v29 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0));
  v16 = sub_237F14488();
  v17 = MEMORY[0x24BEA8360];
  MEMORY[0x24BDAC7A8](v16);
  v19 = (char *)&v29 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  v20 = sub_237F14494();
  MEMORY[0x24BDAC7A8](v20);
  v22 = (char *)&v29 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_237F14234(v30, (uint64_t)v22, v23);
  sub_237F141F0((uint64_t)v22, (uint64_t)v19);
  sub_237F14234((uint64_t)v19, (uint64_t)v15 + *(int *)(v13 + 20), (uint64_t (*)(_QWORD))v17);
  sub_237F1462C();
  sub_237F1375C(&qword_2568A8CE0, (uint64_t (*)(uint64_t))MEMORY[0x24BEAE580], MEMORY[0x24BEAE520]);
  *v15 = sub_237F144DC();
  v15[1] = v24;
  v30 = (uint64_t)v15 + *(int *)(v13 + 24);
  sub_237F143A4();
  v25 = sub_237F143B0();
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v25 - 8) + 56))(v12, 0, 1, v25);
  sub_237F1438C();
  v26 = sub_237F14398();
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v26 - 8) + 56))(v9, 0, 1, v26);
  sub_237F14410();
  sub_237F14428();
  sub_237F14440();
  sub_237F1435C();
  sub_237F143C8();
  sub_237F1375C(&qword_2568A8E38, (uint64_t (*)(uint64_t))type metadata accessor for TimeView, (uint64_t)&unk_237F14848);
  v27 = sub_237F14584();
  sub_237F14278((uint64_t)v15, (uint64_t (*)(_QWORD))type metadata accessor for TimeView);
  sub_237F14278((uint64_t)v19, (uint64_t (*)(_QWORD))MEMORY[0x24BEA8360]);
  return v27;
}

uint64_t sub_237F14190()
{
  return sub_237F1375C(&qword_2568A8E30, (uint64_t (*)(uint64_t))MEMORY[0x24BEA8378], MEMORY[0x24BEA8370]);
}

uint64_t type metadata accessor for ClockUIPlugin()
{
  return objc_opt_self();
}

uint64_t method lookup function for ClockUIPlugin()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of ClockUIPlugin.__allocating_init()()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 80))();
}

uint64_t sub_237F141F0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_237F14488();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_237F14234(uint64_t a1, uint64_t a2, uint64_t (*a3)(_QWORD))
{
  uint64_t v5;

  v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_237F14278(uint64_t a1, uint64_t (*a2)(_QWORD))
{
  uint64_t v3;

  v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_237F142B4()
{
  return MEMORY[0x24BDCC138]();
}

uint64_t sub_237F142C0()
{
  return MEMORY[0x24BDCC1A8]();
}

uint64_t sub_237F142CC()
{
  return MEMORY[0x24BDEAD50]();
}

uint64_t sub_237F142D8()
{
  return MEMORY[0x24BDEAD60]();
}

uint64_t sub_237F142E4()
{
  return MEMORY[0x24BDCC2D8]();
}

uint64_t sub_237F142F0()
{
  return MEMORY[0x24BDCC358]();
}

uint64_t sub_237F142FC()
{
  return MEMORY[0x24BDCC5A8]();
}

uint64_t sub_237F14308()
{
  return MEMORY[0x24BDCC848]();
}

uint64_t sub_237F14314()
{
  return MEMORY[0x24BDCC868]();
}

uint64_t sub_237F14320()
{
  return MEMORY[0x24BDCC878]();
}

uint64_t sub_237F1432C()
{
  return MEMORY[0x24BDCC890]();
}

uint64_t sub_237F14338()
{
  return MEMORY[0x24BDCC898]();
}

uint64_t sub_237F14344()
{
  return MEMORY[0x24BDCD2D0]();
}

uint64_t sub_237F14350()
{
  return MEMORY[0x24BDEAD90]();
}

uint64_t sub_237F1435C()
{
  return MEMORY[0x24BDCD6C8]();
}

uint64_t sub_237F14368()
{
  return MEMORY[0x24BDCD6D8]();
}

uint64_t sub_237F14374()
{
  return MEMORY[0x24BDCD820]();
}

uint64_t sub_237F14380()
{
  return MEMORY[0x24BDCDAC0]();
}

uint64_t sub_237F1438C()
{
  return MEMORY[0x24BDCDED0]();
}

uint64_t sub_237F14398()
{
  return MEMORY[0x24BDCDEE8]();
}

uint64_t sub_237F143A4()
{
  return MEMORY[0x24BDCDF18]();
}

uint64_t sub_237F143B0()
{
  return MEMORY[0x24BDCDF30]();
}

uint64_t sub_237F143BC()
{
  return MEMORY[0x24BDCDFF0]();
}

uint64_t sub_237F143C8()
{
  return MEMORY[0x24BDCE020]();
}

uint64_t sub_237F143D4()
{
  return MEMORY[0x24BDCE2A0]();
}

uint64_t sub_237F143E0()
{
  return MEMORY[0x24BDCE300]();
}

uint64_t sub_237F143EC()
{
  return MEMORY[0x24BDCE308]();
}

uint64_t sub_237F143F8()
{
  return MEMORY[0x24BDCE318]();
}

uint64_t sub_237F14404()
{
  return MEMORY[0x24BDCE900]();
}

uint64_t sub_237F14410()
{
  return MEMORY[0x24BDCECA0]();
}

uint64_t sub_237F1441C()
{
  return MEMORY[0x24BDCEEA8]();
}

uint64_t sub_237F14428()
{
  return MEMORY[0x24BDCF0D0]();
}

uint64_t sub_237F14434()
{
  return MEMORY[0x24BDCF2D8]();
}

uint64_t sub_237F14440()
{
  return MEMORY[0x24BDCF4E0]();
}

uint64_t sub_237F1444C()
{
  return MEMORY[0x24BDCF510]();
}

uint64_t sub_237F14458()
{
  return MEMORY[0x24BEAA6A8]();
}

uint64_t sub_237F14464()
{
  return MEMORY[0x24BEAA6D8]();
}

uint64_t sub_237F14470()
{
  return MEMORY[0x24BEA8350]();
}

uint64_t sub_237F1447C()
{
  return MEMORY[0x24BEA8358]();
}

uint64_t sub_237F14488()
{
  return MEMORY[0x24BEA8360]();
}

uint64_t sub_237F14494()
{
  return MEMORY[0x24BEA8378]();
}

uint64_t sub_237F144A0()
{
  return MEMORY[0x24BEE78A8]();
}

uint64_t sub_237F144AC()
{
  return MEMORY[0x24BEE78C0]();
}

uint64_t sub_237F144B8()
{
  return MEMORY[0x24BEE78D8]();
}

uint64_t sub_237F144C4()
{
  return MEMORY[0x24BDEB418]();
}

uint64_t sub_237F144D0()
{
  return MEMORY[0x24BDEDE50]();
}

uint64_t sub_237F144DC()
{
  return MEMORY[0x24BDEDE60]();
}

uint64_t sub_237F144E8()
{
  return MEMORY[0x24BDEDEE8]();
}

uint64_t sub_237F144F4()
{
  return MEMORY[0x24BDEDEF8]();
}

uint64_t sub_237F14500()
{
  return MEMORY[0x24BDEFCC8]();
}

uint64_t sub_237F1450C()
{
  return MEMORY[0x24BDF1580]();
}

uint64_t sub_237F14518()
{
  return MEMORY[0x24BDF1678]();
}

uint64_t sub_237F14524()
{
  return MEMORY[0x24BDF16D0]();
}

uint64_t sub_237F14530()
{
  return MEMORY[0x24BDF1750]();
}

uint64_t sub_237F1453C()
{
  return MEMORY[0x24BDF1798]();
}

uint64_t sub_237F14548()
{
  return MEMORY[0x24BDF1D08]();
}

uint64_t sub_237F14554()
{
  return MEMORY[0x24BDF1D18]();
}

uint64_t sub_237F14560()
{
  return MEMORY[0x24BDF1DC8]();
}

uint64_t sub_237F1456C()
{
  return MEMORY[0x24BDF1FD8]();
}

uint64_t sub_237F14578()
{
  return MEMORY[0x24BDF1FF0]();
}

uint64_t sub_237F14584()
{
  return MEMORY[0x24BEAD6D0]();
}

uint64_t sub_237F14590()
{
  return MEMORY[0x24BEAD7C0]();
}

uint64_t sub_237F1459C()
{
  return MEMORY[0x24BEAD840]();
}

uint64_t sub_237F145A8()
{
  return MEMORY[0x24BDF2088]();
}

uint64_t sub_237F145B4()
{
  return MEMORY[0x24BDF20A0]();
}

uint64_t sub_237F145C0()
{
  return MEMORY[0x24BDF2698]();
}

uint64_t sub_237F145CC()
{
  return MEMORY[0x24BDF3CA8]();
}

uint64_t sub_237F145D8()
{
  return MEMORY[0x24BDF3CF0]();
}

uint64_t sub_237F145E4()
{
  return MEMORY[0x24BDF3D30]();
}

uint64_t sub_237F145F0()
{
  return MEMORY[0x24BEADBD0]();
}

uint64_t sub_237F145FC()
{
  return MEMORY[0x24BEADC38]();
}

uint64_t sub_237F14608()
{
  return MEMORY[0x24BEAE270]();
}

uint64_t sub_237F14614()
{
  return MEMORY[0x24BEAE278]();
}

uint64_t sub_237F14620()
{
  return MEMORY[0x24BEAE550]();
}

uint64_t sub_237F1462C()
{
  return MEMORY[0x24BEAE580]();
}

uint64_t sub_237F14638()
{
  return MEMORY[0x24BEE0620]();
}

uint64_t sub_237F14644()
{
  return MEMORY[0x24BEE0980]();
}

uint64_t sub_237F14650()
{
  return MEMORY[0x24BEE7928]();
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB90](dso, log, type, format, buf, *(_QWORD *)&size);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x24BDAEE80](__dst, __src, __n);
}

uint64_t objc_opt_self()
{
  return MEMORY[0x24BEDD168]();
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

uint64_t swift_allocObject()
{
  return MEMORY[0x24BEE4B70]();
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x24BEE4BC0]();
}

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x24BEE4BD0]();
}

uint64_t swift_deallocClassInstance()
{
  return MEMORY[0x24BEE4C00]();
}

uint64_t swift_deallocObject()
{
  return MEMORY[0x24BEE4C10]();
}

uint64_t swift_getEnumTagSinglePayloadGeneric()
{
  return MEMORY[0x24BEE4D10]();
}

uint64_t swift_getKeyPath()
{
  return MEMORY[0x24BEE4D88]();
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

