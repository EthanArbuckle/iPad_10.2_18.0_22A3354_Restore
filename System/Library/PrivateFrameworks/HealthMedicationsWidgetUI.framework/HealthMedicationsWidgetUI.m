uint64_t sub_23DE4ACE4@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t inited;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  int *v9;
  char *v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t result;

  if (qword_25432AB88 != -1)
    swift_once();
  v2 = sub_23DE665E4();
  v4 = v3;
  sub_23DE4AEF0();
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_23DE67420;
  *(_QWORD *)(inited + 32) = sub_23DE665E4();
  *(_QWORD *)(inited + 40) = v6;
  *(_QWORD *)(inited + 48) = sub_23DE665E4();
  *(_QWORD *)(inited + 56) = v7;
  v8 = sub_23DE57378(inited);
  swift_bridgeObjectRelease();
  swift_setDeallocating();
  swift_arrayDestroy();
  v9 = (int *)type metadata accessor for MedicationsWidgetViewModel();
  v10 = (char *)a1 + v9[6];
  v11 = type metadata accessor for MedmojiIconConfiguration();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 56))(v10, 1, 1, v11);
  v12 = (char *)a1 + v9[8];
  v13 = sub_23DE666F8();
  result = (*(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v13 - 8) + 56))(v12, 1, 1, v13);
  *a1 = v2;
  a1[1] = v4;
  a1[2] = v8;
  *((_BYTE *)a1 + v9[7]) = 3;
  return result;
}

void sub_23DE4AEF0()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_25432B1D8)
  {
    v0 = sub_23DE66FBC();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_25432B1D8);
  }
}

uint64_t type metadata accessor for MedicationsWidgetViewModel()
{
  uint64_t result;

  result = qword_25432A9F8;
  if (!qword_25432A9F8)
    return swift_getSingletonMetadata();
  return result;
}

_QWORD *sub_23DE4AF80(_QWORD *a1, _QWORD *a2, int *a3)
{
  _QWORD *v4;
  int v5;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  unsigned int (*v13)(char *, uint64_t, uint64_t);
  uint64_t v14;
  uint64_t v15;
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
  uint64_t v26;

  v4 = a1;
  v5 = *(_DWORD *)(*((_QWORD *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v15 = *a2;
    *v4 = *a2;
    v4 = (_QWORD *)(v15 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    v7 = a2[1];
    *a1 = *a2;
    a1[1] = v7;
    a1[2] = a2[2];
    v8 = a3[6];
    v9 = (char *)a1 + v8;
    v10 = (char *)a2 + v8;
    v11 = type metadata accessor for MedmojiIconConfiguration();
    v12 = *(_QWORD *)(v11 - 8);
    v13 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    if (v13(v10, 1, v11))
    {
      sub_23DE4B174(0, qword_25432AAD0, (void (*)(uint64_t))type metadata accessor for MedmojiIconConfiguration);
      memcpy(v9, v10, *(_QWORD *)(*(_QWORD *)(v14 - 8) + 64));
    }
    else
    {
      v16 = sub_23DE66818();
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v16 - 8) + 16))(v9, v10, v16);
      v17 = *(int *)(v11 + 20);
      v18 = &v9[v17];
      v19 = &v10[v17];
      v20 = sub_23DE667DC();
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v20 - 8) + 16))(v18, v19, v20);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v12 + 56))(v9, 0, 1, v11);
    }
    v21 = a3[8];
    *((_BYTE *)v4 + a3[7]) = *((_BYTE *)a2 + a3[7]);
    v22 = (char *)v4 + v21;
    v23 = (char *)a2 + v21;
    v24 = sub_23DE666F8();
    v25 = *(_QWORD *)(v24 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v25 + 48))(v23, 1, v24))
    {
      sub_23DE4B174(0, &qword_25432A770, (void (*)(uint64_t))MEMORY[0x24BDCE900]);
      memcpy(v22, v23, *(_QWORD *)(*(_QWORD *)(v26 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v25 + 16))(v22, v23, v24);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v25 + 56))(v22, 0, 1, v24);
    }
  }
  return v4;
}

void sub_23DE4B174(uint64_t a1, unint64_t *a2, void (*a3)(uint64_t))
{
  unint64_t v4;
  uint64_t v5;

  if (!*a2)
  {
    a3(255);
    v4 = sub_23DE66EA8();
    if (!v5)
      atomic_store(v4, a2);
  }
}

uint64_t sub_23DE4B1C0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t result;

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v4 = a1 + *(int *)(a2 + 24);
  v5 = type metadata accessor for MedmojiIconConfiguration();
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 48))(v4, 1, v5))
  {
    v6 = sub_23DE66818();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 8))(v4, v6);
    v7 = v4 + *(int *)(v5 + 20);
    v8 = sub_23DE667DC();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 8))(v7, v8);
  }
  v9 = a1 + *(int *)(a2 + 32);
  v10 = sub_23DE666F8();
  v11 = *(_QWORD *)(v10 - 8);
  result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v11 + 48))(v9, 1, v10);
  if (!(_DWORD)result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(v11 + 8))(v9, v10);
  return result;
}

_QWORD *sub_23DE4B2B4(_QWORD *a1, _QWORD *a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  char *v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  unsigned int (*v12)(char *, uint64_t, uint64_t);
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;

  v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  a1[2] = a2[2];
  v7 = a3[6];
  v8 = (char *)a1 + v7;
  v9 = (char *)a2 + v7;
  v10 = type metadata accessor for MedmojiIconConfiguration();
  v11 = *(_QWORD *)(v10 - 8);
  v12 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v11 + 48);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  if (v12(v9, 1, v10))
  {
    sub_23DE4B174(0, qword_25432AAD0, (void (*)(uint64_t))type metadata accessor for MedmojiIconConfiguration);
    memcpy(v8, v9, *(_QWORD *)(*(_QWORD *)(v13 - 8) + 64));
  }
  else
  {
    v14 = sub_23DE66818();
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v14 - 8) + 16))(v8, v9, v14);
    v15 = *(int *)(v10 + 20);
    v16 = &v8[v15];
    v17 = &v9[v15];
    v18 = sub_23DE667DC();
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v18 - 8) + 16))(v16, v17, v18);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v11 + 56))(v8, 0, 1, v10);
  }
  v19 = a3[8];
  *((_BYTE *)a1 + a3[7]) = *((_BYTE *)a2 + a3[7]);
  v20 = (char *)a1 + v19;
  v21 = (char *)a2 + v19;
  v22 = sub_23DE666F8();
  v23 = *(_QWORD *)(v22 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v23 + 48))(v21, 1, v22))
  {
    sub_23DE4B174(0, &qword_25432A770, (void (*)(uint64_t))MEMORY[0x24BDCE900]);
    memcpy(v20, v21, *(_QWORD *)(*(_QWORD *)(v24 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v23 + 16))(v20, v21, v22);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v23 + 56))(v20, 0, 1, v22);
  }
  return a1;
}

_QWORD *sub_23DE4B47C(_QWORD *a1, _QWORD *a2, int *a3)
{
  uint64_t v6;
  char *v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t (*v11)(char *, uint64_t, uint64_t);
  int v12;
  int v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t (*v25)(char *, uint64_t, uint64_t);
  int v26;
  int v27;
  uint64_t v28;
  uint64_t v30;
  uint64_t v31;
  char *v32;
  char *v33;
  uint64_t v34;

  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v6 = a3[6];
  v7 = (char *)a1 + v6;
  v8 = (char *)a2 + v6;
  v9 = type metadata accessor for MedmojiIconConfiguration();
  v10 = *(_QWORD *)(v9 - 8);
  v11 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v10 + 48);
  v12 = v11(v7, 1, v9);
  v13 = v11(v8, 1, v9);
  if (v12)
  {
    if (!v13)
    {
      v14 = sub_23DE66818();
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v14 - 8) + 16))(v7, v8, v14);
      v15 = *(int *)(v9 + 20);
      v16 = &v7[v15];
      v17 = &v8[v15];
      v18 = sub_23DE667DC();
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v18 - 8) + 16))(v16, v17, v18);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v10 + 56))(v7, 0, 1, v9);
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  if (v13)
  {
    sub_23DE4B718((uint64_t)v7);
LABEL_6:
    sub_23DE4B174(0, qword_25432AAD0, (void (*)(uint64_t))type metadata accessor for MedmojiIconConfiguration);
    memcpy(v7, v8, *(_QWORD *)(*(_QWORD *)(v19 - 8) + 64));
    goto LABEL_7;
  }
  v30 = sub_23DE66818();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v30 - 8) + 24))(v7, v8, v30);
  v31 = *(int *)(v9 + 20);
  v32 = &v7[v31];
  v33 = &v8[v31];
  v34 = sub_23DE667DC();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v34 - 8) + 24))(v32, v33, v34);
LABEL_7:
  *((_BYTE *)a1 + a3[7]) = *((_BYTE *)a2 + a3[7]);
  v20 = a3[8];
  v21 = (char *)a1 + v20;
  v22 = (char *)a2 + v20;
  v23 = sub_23DE666F8();
  v24 = *(_QWORD *)(v23 - 8);
  v25 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v24 + 48);
  v26 = v25(v21, 1, v23);
  v27 = v25(v22, 1, v23);
  if (!v26)
  {
    if (!v27)
    {
      (*(void (**)(char *, char *, uint64_t))(v24 + 24))(v21, v22, v23);
      return a1;
    }
    (*(void (**)(char *, uint64_t))(v24 + 8))(v21, v23);
    goto LABEL_12;
  }
  if (v27)
  {
LABEL_12:
    sub_23DE4B174(0, &qword_25432A770, (void (*)(uint64_t))MEMORY[0x24BDCE900]);
    memcpy(v21, v22, *(_QWORD *)(*(_QWORD *)(v28 - 8) + 64));
    return a1;
  }
  (*(void (**)(char *, char *, uint64_t))(v24 + 16))(v21, v22, v23);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v24 + 56))(v21, 0, 1, v23);
  return a1;
}

uint64_t sub_23DE4B718(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata accessor for MedmojiIconConfiguration();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_23DE4B754(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  char *v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  const void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;

  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  v6 = a3[6];
  v7 = (char *)(a1 + v6);
  v8 = (char *)(a2 + v6);
  v9 = type metadata accessor for MedmojiIconConfiguration();
  v10 = *(_QWORD *)(v9 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v10 + 48))(v8, 1, v9))
  {
    sub_23DE4B174(0, qword_25432AAD0, (void (*)(uint64_t))type metadata accessor for MedmojiIconConfiguration);
    memcpy(v7, v8, *(_QWORD *)(*(_QWORD *)(v11 - 8) + 64));
  }
  else
  {
    v12 = sub_23DE66818();
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v12 - 8) + 32))(v7, v8, v12);
    v13 = *(int *)(v9 + 20);
    v14 = &v7[v13];
    v15 = &v8[v13];
    v16 = sub_23DE667DC();
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v16 - 8) + 32))(v14, v15, v16);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v10 + 56))(v7, 0, 1, v9);
  }
  v17 = a3[8];
  *(_BYTE *)(a1 + a3[7]) = *(_BYTE *)(a2 + a3[7]);
  v18 = (void *)(a1 + v17);
  v19 = (const void *)(a2 + v17);
  v20 = sub_23DE666F8();
  v21 = *(_QWORD *)(v20 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v21 + 48))(v19, 1, v20))
  {
    sub_23DE4B174(0, &qword_25432A770, (void (*)(uint64_t))MEMORY[0x24BDCE900]);
    memcpy(v18, v19, *(_QWORD *)(*(_QWORD *)(v22 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v21 + 32))(v18, v19, v20);
    (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v21 + 56))(v18, 0, 1, v20);
  }
  return a1;
}

_QWORD *sub_23DE4B904(_QWORD *a1, _QWORD *a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  char *v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t (*v12)(char *, uint64_t, uint64_t);
  int v13;
  int v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t (*v26)(char *, uint64_t, uint64_t);
  int v27;
  int v28;
  uint64_t v29;
  uint64_t v31;
  uint64_t v32;
  char *v33;
  char *v34;
  uint64_t v35;

  v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  swift_bridgeObjectRelease();
  v7 = a3[6];
  v8 = (char *)a1 + v7;
  v9 = (char *)a2 + v7;
  v10 = type metadata accessor for MedmojiIconConfiguration();
  v11 = *(_QWORD *)(v10 - 8);
  v12 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v11 + 48);
  v13 = v12(v8, 1, v10);
  v14 = v12(v9, 1, v10);
  if (v13)
  {
    if (!v14)
    {
      v15 = sub_23DE66818();
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v15 - 8) + 32))(v8, v9, v15);
      v16 = *(int *)(v10 + 20);
      v17 = &v8[v16];
      v18 = &v9[v16];
      v19 = sub_23DE667DC();
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v19 - 8) + 32))(v17, v18, v19);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v11 + 56))(v8, 0, 1, v10);
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  if (v14)
  {
    sub_23DE4B718((uint64_t)v8);
LABEL_6:
    sub_23DE4B174(0, qword_25432AAD0, (void (*)(uint64_t))type metadata accessor for MedmojiIconConfiguration);
    memcpy(v8, v9, *(_QWORD *)(*(_QWORD *)(v20 - 8) + 64));
    goto LABEL_7;
  }
  v31 = sub_23DE66818();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v31 - 8) + 40))(v8, v9, v31);
  v32 = *(int *)(v10 + 20);
  v33 = &v8[v32];
  v34 = &v9[v32];
  v35 = sub_23DE667DC();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v35 - 8) + 40))(v33, v34, v35);
LABEL_7:
  v21 = a3[8];
  *((_BYTE *)a1 + a3[7]) = *((_BYTE *)a2 + a3[7]);
  v22 = (char *)a1 + v21;
  v23 = (char *)a2 + v21;
  v24 = sub_23DE666F8();
  v25 = *(_QWORD *)(v24 - 8);
  v26 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v25 + 48);
  v27 = v26(v22, 1, v24);
  v28 = v26(v23, 1, v24);
  if (!v27)
  {
    if (!v28)
    {
      (*(void (**)(char *, char *, uint64_t))(v25 + 40))(v22, v23, v24);
      return a1;
    }
    (*(void (**)(char *, uint64_t))(v25 + 8))(v22, v24);
    goto LABEL_12;
  }
  if (v28)
  {
LABEL_12:
    sub_23DE4B174(0, &qword_25432A770, (void (*)(uint64_t))MEMORY[0x24BDCE900]);
    memcpy(v22, v23, *(_QWORD *)(*(_QWORD *)(v29 - 8) + 64));
    return a1;
  }
  (*(void (**)(char *, char *, uint64_t))(v25 + 32))(v22, v23, v24);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v25 + 56))(v22, 0, 1, v24);
  return a1;
}

uint64_t sub_23DE4BB84()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_23DE4BB90(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v4;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  if ((_DWORD)a2 == 0x7FFFFFFF)
  {
    v4 = *(_QWORD *)(a1 + 8);
    if (v4 >= 0xFFFFFFFF)
      LODWORD(v4) = -1;
    return (v4 + 1);
  }
  else
  {
    sub_23DE4B174(0, qword_25432AAD0, (void (*)(uint64_t))type metadata accessor for MedmojiIconConfiguration);
    v9 = *(_QWORD *)(v8 - 8);
    if (*(_DWORD *)(v9 + 84) == (_DWORD)a2)
    {
      v10 = v8;
      v11 = *(int *)(a3 + 24);
    }
    else
    {
      sub_23DE4B174(0, &qword_25432A770, (void (*)(uint64_t))MEMORY[0x24BDCE900]);
      v10 = v12;
      v9 = *(_QWORD *)(v12 - 8);
      v11 = *(int *)(a3 + 32);
    }
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v9 + 48))(a1 + v11, a2, v10);
  }
}

uint64_t sub_23DE4BC50()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_23DE4BC5C(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(_QWORD *)(result + 8) = (a2 - 1);
  }
  else
  {
    sub_23DE4B174(0, qword_25432AAD0, (void (*)(uint64_t))type metadata accessor for MedmojiIconConfiguration);
    v9 = *(_QWORD *)(v8 - 8);
    if (*(_DWORD *)(v9 + 84) == a3)
    {
      v10 = v8;
      v11 = *(int *)(a4 + 24);
    }
    else
    {
      sub_23DE4B174(0, &qword_25432A770, (void (*)(uint64_t))MEMORY[0x24BDCE900]);
      v10 = v12;
      v9 = *(_QWORD *)(v12 - 8);
      v11 = *(int *)(a4 + 32);
    }
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56))(v5 + v11, a2, a2, v10);
  }
  return result;
}

void sub_23DE4BD18()
{
  unint64_t v0;
  unint64_t v1;

  sub_23DE4B174(319, qword_25432AAD0, (void (*)(uint64_t))type metadata accessor for MedmojiIconConfiguration);
  if (v0 <= 0x3F)
  {
    sub_23DE4B174(319, &qword_25432A770, (void (*)(uint64_t))MEMORY[0x24BDCE900]);
    if (v1 <= 0x3F)
      swift_initStructMetadata();
  }
}

uint64_t *sub_23DE4BDDC(uint64_t *a1, uint64_t *a2, uint64_t a3)
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
    v7 = sub_23DE66818();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a1, a2, v7);
    v8 = *(int *)(a3 + 20);
    v9 = (char *)a1 + v8;
    v10 = (char *)a2 + v8;
    v11 = sub_23DE667DC();
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v11 - 8) + 16))(v9, v10, v11);
  }
  return a1;
}

uint64_t sub_23DE4BE84(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v4 = sub_23DE66818();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(a1, v4);
  v5 = a1 + *(int *)(a2 + 20);
  v6 = sub_23DE667DC();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 8))(v5, v6);
}

uint64_t sub_23DE4BEE0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v6 = sub_23DE66818();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(a1, a2, v6);
  v7 = *(int *)(a3 + 20);
  v8 = a1 + v7;
  v9 = a2 + v7;
  v10 = sub_23DE667DC();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 16))(v8, v9, v10);
  return a1;
}

uint64_t sub_23DE4BF5C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v6 = sub_23DE66818();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 24))(a1, a2, v6);
  v7 = *(int *)(a3 + 20);
  v8 = a1 + v7;
  v9 = a2 + v7;
  v10 = sub_23DE667DC();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 24))(v8, v9, v10);
  return a1;
}

uint64_t sub_23DE4BFD8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v6 = sub_23DE66818();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 32))(a1, a2, v6);
  v7 = *(int *)(a3 + 20);
  v8 = a1 + v7;
  v9 = a2 + v7;
  v10 = sub_23DE667DC();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 32))(v8, v9, v10);
  return a1;
}

uint64_t sub_23DE4C054(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v6 = sub_23DE66818();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 40))(a1, a2, v6);
  v7 = *(int *)(a3 + 20);
  v8 = a1 + v7;
  v9 = a2 + v7;
  v10 = sub_23DE667DC();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 40))(v8, v9, v10);
  return a1;
}

uint64_t sub_23DE4C0D0()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_23DE4C0DC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t, uint64_t);
  uint64_t v10;

  v6 = sub_23DE66818();
  v7 = *(_QWORD *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == (_DWORD)a2)
  {
    v8 = v6;
    v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    v10 = a1;
  }
  else
  {
    v8 = sub_23DE667DC();
    v10 = a1 + *(int *)(a3 + 20);
    v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 48);
  }
  return v9(v10, a2, v8);
}

uint64_t sub_23DE4C150()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_23DE4C15C(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v12;

  v8 = sub_23DE66818();
  v9 = *(_QWORD *)(v8 - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    v10 = v8;
    v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    v12 = a1;
  }
  else
  {
    v10 = sub_23DE667DC();
    v12 = a1 + *(int *)(a4 + 20);
    v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 56);
  }
  return v11(v12, a2, a2, v10);
}

uint64_t type metadata accessor for MedmojiIconConfiguration()
{
  uint64_t result;

  result = qword_25432AA98;
  if (!qword_25432AA98)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_23DE4C214()
{
  uint64_t result;
  unint64_t v1;
  unint64_t v2;

  result = sub_23DE66818();
  if (v1 <= 0x3F)
  {
    result = sub_23DE667DC();
    if (v2 <= 0x3F)
    {
      swift_initStructMetadata();
      return 0;
    }
  }
  return result;
}

uint64_t HKMedicationUserDomainConcept.title.getter()
{
  sub_23DE4C2D4();
  return sub_23DE66848();
}

unint64_t sub_23DE4C2D4()
{
  unint64_t result;

  result = qword_256D0CCD0[0];
  if (!qword_256D0CCD0[0])
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, qword_256D0CCD0);
  }
  return result;
}

uint64_t HKMedicationUserDomainConcept.visualConfig.getter@<X0>(uint64_t a1@<X8>)
{
  void *v1;
  void *v2;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v13;

  v2 = v1;
  sub_23DE4C478();
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)&v13 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = objc_msgSend(v2, sel_userVisualizationConfigJSONString);
  if (v7)
  {
    v8 = v7;
    sub_23DE66D94();

    sub_23DE6680C();
    v9 = sub_23DE66818();
    v10 = *(_QWORD *)(v9 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v10 + 48))(v6, 1, v9) != 1)
    {
      (*(void (**)(uint64_t, char *, uint64_t))(v10 + 32))(a1, v6, v9);
      return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v10 + 56))(a1, 0, 1, v9);
    }
    sub_23DE4C4CC((uint64_t)v6);
  }
  v11 = sub_23DE66818();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 56))(a1, 1, 1, v11);
}

void sub_23DE4C478()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_25432AF30)
  {
    sub_23DE66818();
    v0 = sub_23DE66EA8();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_25432AF30);
  }
}

uint64_t sub_23DE4C4CC(uint64_t a1)
{
  uint64_t v2;

  sub_23DE4C478();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

ValueMetadata *type metadata accessor for MedicationsWidgetConfiguration()
{
  return &type metadata for MedicationsWidgetConfiguration;
}

uint64_t sub_23DE4C518()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_23DE4C528@<X0>(uint64_t a1@<X8>)
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
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t OpaqueTypeConformance2;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  uint64_t v24;
  unint64_t v25;
  void (*v26)(unint64_t, _QWORD, uint64_t);
  uint64_t v27;
  uint64_t v29;
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
  unint64_t v40;
  uint64_t v41;
  uint64_t v42;

  v36 = a1;
  sub_23DE4CB64();
  v2 = v1;
  v30 = *(_QWORD *)(v1 - 8);
  MEMORY[0x24BDAC7A8]();
  v4 = (char *)&v29 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23DE4CC9C(0);
  v33 = v5;
  v31 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8]();
  v7 = (char *)&v29 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23DE4CDC8(0);
  v34 = *(_QWORD *)(v8 - 8);
  v35 = v8;
  MEMORY[0x24BDAC7A8]();
  v32 = (char *)&v29 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23DE66D94();
  type metadata accessor for MedicationsWidgetTimelineGenerator();
  swift_allocObject();
  v41 = sub_23DE54930();
  sub_23DE4CC10(0);
  v10 = type metadata accessor for MedicationsWidgetEntryView();
  v11 = sub_23DE4CD44(&qword_25432A960, (uint64_t (*)(uint64_t))type metadata accessor for MedicationsWidgetEntryView, (uint64_t)&unk_23DE6763C);
  v37 = v10;
  v38 = v11;
  swift_getOpaqueTypeConformance2();
  sub_23DE4CEA4();
  sub_23DE66CF8();
  if (qword_25432AB88 != -1)
    swift_once();
  v37 = sub_23DE665E4();
  v38 = v12;
  v13 = sub_23DE4CD44(&qword_25432AB50, (uint64_t (*)(uint64_t))sub_23DE4CB64, MEMORY[0x24BDFB170]);
  v14 = sub_23DE4CD84();
  v15 = MEMORY[0x24BEE0D00];
  sub_23DE66A58();
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v30 + 8))(v4, v2);
  v41 = sub_23DE665E4();
  v42 = v16;
  v37 = v2;
  v38 = v15;
  v39 = v13;
  v40 = v14;
  OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
  v19 = v32;
  v18 = v33;
  sub_23DE66A40();
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v31 + 8))(v7, v18);
  sub_23DE4CF6C(0, qword_25432AB90, (uint64_t (*)(uint64_t))MEMORY[0x24BDFAF10], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE3598]);
  v20 = sub_23DE66CD4();
  v21 = *(_QWORD *)(v20 - 8);
  v22 = *(_QWORD *)(v21 + 72);
  v23 = (*(unsigned __int8 *)(v21 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v21 + 80);
  v24 = swift_allocObject();
  *(_OWORD *)(v24 + 16) = xmmword_23DE674D0;
  v25 = v24 + v23;
  v26 = *(void (**)(unint64_t, _QWORD, uint64_t))(v21 + 104);
  v26(v25, *MEMORY[0x24BDFAF00], v20);
  v26(v25 + v22, *MEMORY[0x24BDFAEF0], v20);
  v26(v25 + 2 * v22, *MEMORY[0x24BDFAF08], v20);
  v37 = v18;
  v38 = MEMORY[0x24BEE0D00];
  v39 = OpaqueTypeConformance2;
  v40 = v14;
  swift_getOpaqueTypeConformance2();
  v27 = v35;
  sub_23DE66A4C();
  swift_bridgeObjectRelease();
  return (*(uint64_t (**)(char *, uint64_t))(v34 + 8))(v19, v27);
}

uint64_t sub_23DE4C988(uint64_t a1)
{
  uint64_t v2;
  char *v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t *v8;
  id v9;
  uint64_t v10;
  uint64_t v12;

  sub_23DE4CF6C(0, &qword_25432AE80, (uint64_t (*)(uint64_t))MEMORY[0x24BDCDAC0], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1C68]);
  MEMORY[0x24BDAC7A8]();
  v3 = (char *)&v12 - v2;
  type metadata accessor for MedicationsWidgetEntry();
  MEMORY[0x24BDAC7A8]();
  v5 = (char *)&v12 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = type metadata accessor for MedicationsWidgetEntryView();
  MEMORY[0x24BDAC7A8]();
  v8 = (uint64_t *)((char *)&v12 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0));
  sub_23DE4CEE8(a1, (uint64_t)v5);
  *v8 = swift_getKeyPath();
  sub_23DE4CF6C(0, &qword_25432AB30, (uint64_t (*)(uint64_t))MEMORY[0x24BDFAF10], MEMORY[0x24BDEB560]);
  swift_storeEnumTagMultiPayload();
  sub_23DE4CFC4((uint64_t)v5, (uint64_t)v8 + *(int *)(v6 + 20));
  v9 = (id)HKMedicationsRoomDeepLink();
  sub_23DE66650();

  v10 = sub_23DE6665C();
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 56))(v3, 0, 1, v10);
  sub_23DE4CD44(&qword_25432A960, (uint64_t (*)(uint64_t))type metadata accessor for MedicationsWidgetEntryView, (uint64_t)&unk_23DE6763C);
  sub_23DE66B60();
  sub_23DE4D008((uint64_t)v3);
  return sub_23DE4D05C((uint64_t)v8);
}

void sub_23DE4CB64()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_25432AB58)
  {
    sub_23DE4CC10(255);
    type metadata accessor for MedicationsWidgetEntryView();
    sub_23DE4CD44(&qword_25432A960, (uint64_t (*)(uint64_t))type metadata accessor for MedicationsWidgetEntryView, (uint64_t)&unk_23DE6763C);
    swift_getOpaqueTypeConformance2();
    v0 = sub_23DE66D04();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_25432AB58);
  }
}

void sub_23DE4CC10(uint64_t a1)
{
  unint64_t v2;
  uint64_t v3;
  _QWORD v4[2];

  if (!qword_25432AB48)
  {
    v4[0] = type metadata accessor for MedicationsWidgetEntryView();
    v4[1] = sub_23DE4CD44(&qword_25432A960, (uint64_t (*)(uint64_t))type metadata accessor for MedicationsWidgetEntryView, (uint64_t)&unk_23DE6763C);
    v2 = MEMORY[0x242646598](a1, v4, MEMORY[0x24BDFAC50], 0);
    if (!v3)
      atomic_store(v2, (unint64_t *)&qword_25432AB48);
  }
}

void sub_23DE4CC9C(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t v7;
  _QWORD v8[4];

  if (!qword_25432AB40)
  {
    sub_23DE4CB64();
    v3 = v2;
    v4 = sub_23DE4CD44(&qword_25432AB50, (uint64_t (*)(uint64_t))sub_23DE4CB64, MEMORY[0x24BDFB170]);
    v5 = sub_23DE4CD84();
    v8[0] = v3;
    v8[1] = MEMORY[0x24BEE0D00];
    v8[2] = v4;
    v8[3] = v5;
    v6 = MEMORY[0x242646598](a1, v8, MEMORY[0x24BDFABC8], 0);
    if (!v7)
      atomic_store(v6, (unint64_t *)&qword_25432AB40);
  }
}

uint64_t sub_23DE4CD44(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = a2(255);
    result = MEMORY[0x2426465BC](a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_23DE4CD84()
{
  unint64_t result;

  result = qword_25432AB60;
  if (!qword_25432AB60)
  {
    result = MEMORY[0x2426465BC](MEMORY[0x24BEE0D50], MEMORY[0x24BEE0D00]);
    atomic_store(result, (unint64_t *)&qword_25432AB60);
  }
  return result;
}

void sub_23DE4CDC8(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  unint64_t v5;
  uint64_t v6;
  _QWORD v7[4];

  if (!qword_25432AB38)
  {
    sub_23DE4CC9C(255);
    v3 = v2;
    sub_23DE4CB64();
    sub_23DE4CD44(&qword_25432AB50, (uint64_t (*)(uint64_t))sub_23DE4CB64, MEMORY[0x24BDFB170]);
    v4 = sub_23DE4CD84();
    v7[0] = v3;
    v7[1] = MEMORY[0x24BEE0D00];
    v7[2] = swift_getOpaqueTypeConformance2();
    v7[3] = v4;
    v5 = MEMORY[0x242646598](a1, v7, MEMORY[0x24BDFAB98], 0);
    if (!v6)
      atomic_store(v5, (unint64_t *)&qword_25432AB38);
  }
}

unint64_t sub_23DE4CEA4()
{
  unint64_t result;

  result = qword_25432A780;
  if (!qword_25432A780)
  {
    result = MEMORY[0x2426465BC](&unk_23DE675B4, &type metadata for MedicationsWidgetTimelineProvider);
    atomic_store(result, (unint64_t *)&qword_25432A780);
  }
  return result;
}

uint64_t sub_23DE4CEE8(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for MedicationsWidgetEntry();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_23DE4CF2C()
{
  return sub_23DE66980();
}

uint64_t sub_23DE4CF4C()
{
  return sub_23DE66980();
}

void sub_23DE4CF6C(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t), uint64_t (*a4)(uint64_t, uint64_t))
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

uint64_t sub_23DE4CFC4(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for MedicationsWidgetEntry();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_23DE4D008(uint64_t a1)
{
  uint64_t v2;

  sub_23DE4CF6C(0, &qword_25432AE80, (uint64_t (*)(uint64_t))MEMORY[0x24BDCDAC0], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1C68]);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_23DE4D05C(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata accessor for MedicationsWidgetEntryView();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_23DE4D098()
{
  sub_23DE4CDC8(255);
  sub_23DE4CC9C(255);
  sub_23DE4CB64();
  sub_23DE4CD44(&qword_25432AB50, (uint64_t (*)(uint64_t))sub_23DE4CB64, MEMORY[0x24BDFB170]);
  sub_23DE4CD84();
  swift_getOpaqueTypeConformance2();
  swift_getOpaqueTypeConformance2();
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_23DE4D16C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
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
  uint64_t v14;
  char *v15;
  uint64_t v16;
  char v17;
  void (*v18)(char *, uint64_t);
  char *v19;
  char v20;
  char *v21;
  char *v22;
  void (*v23)(char *, uint64_t);
  uint64_t v25;
  void (*v26)(char *, uint64_t, uint64_t);
  char *v27;
  char *v28;
  char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;

  v0 = sub_23DE66728();
  v1 = *(_QWORD *)(v0 - 8);
  v2 = MEMORY[0x24BDAC7A8](v0);
  v28 = (char *)&v25 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = MEMORY[0x24BDAC7A8](v2);
  v27 = (char *)&v25 - v5;
  v6 = MEMORY[0x24BDAC7A8](v4);
  v8 = (char *)&v25 - v7;
  MEMORY[0x24BDAC7A8](v6);
  v10 = (char *)&v25 - v9;
  v11 = sub_23DE66740();
  v30 = *(_QWORD *)(v11 - 8);
  v12 = MEMORY[0x24BDAC7A8](v11);
  v29 = (char *)&v25 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v12);
  v15 = (char *)&v25 - v14;
  sub_23DE6671C();
  sub_23DE66734();
  v16 = *MEMORY[0x24BDCEE80];
  v26 = *(void (**)(char *, uint64_t, uint64_t))(v1 + 104);
  v26(v8, v16, v0);
  sub_23DE4D78C();
  sub_23DE66DDC();
  sub_23DE66DDC();
  if (v33 == v31 && v34 == v32)
    v17 = 1;
  else
    v17 = sub_23DE66FC8();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v18 = *(void (**)(char *, uint64_t))(v1 + 8);
  v18(v8, v0);
  v18(v10, v0);
  v19 = v29;
  (*(void (**)(char *, char *, uint64_t))(v30 + 16))(v29, v15, v11);
  if ((v17 & 1) != 0)
  {
    v20 = 1;
  }
  else
  {
    v21 = v27;
    sub_23DE66734();
    v22 = v28;
    v26(v28, *MEMORY[0x24BDCEE88], v0);
    sub_23DE66DDC();
    sub_23DE66DDC();
    if (v33 == v31 && v34 == v32)
      v20 = 1;
    else
      v20 = sub_23DE66FC8();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    v18(v22, v0);
    v18(v21, v0);
    v19 = v29;
  }
  v23 = *(void (**)(char *, uint64_t))(v30 + 8);
  v23(v19, v11);
  v23(v15, v11);
  return v20 & 1;
}

uint64_t sub_23DE4D468(uint64_t a1)
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
  char *v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  void (*v16)(char *, _QWORD, uint64_t);
  char v17;
  void (*v18)(char *, uint64_t);
  char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  id v24;
  uint64_t result;
  char *v26;
  char v27;
  uint64_t v28;
  char *v29;
  char *v30;
  char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;

  v2 = sub_23DE66740();
  v32 = *(_QWORD *)(v2 - 8);
  v33 = v2;
  MEMORY[0x24BDAC7A8](v2);
  v31 = (char *)&v28 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = sub_23DE66728();
  v5 = *(_QWORD *)(v4 - 8);
  v6 = MEMORY[0x24BDAC7A8](v4);
  v29 = (char *)&v28 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = MEMORY[0x24BDAC7A8](v6);
  v30 = (char *)&v28 - v9;
  v10 = MEMORY[0x24BDAC7A8](v8);
  v12 = (char *)&v28 - v11;
  MEMORY[0x24BDAC7A8](v10);
  v14 = (char *)&v28 - v13;
  v15 = a1;
  sub_23DE66734();
  v16 = *(void (**)(char *, _QWORD, uint64_t))(v5 + 104);
  v16(v12, *MEMORY[0x24BDCEE70], v4);
  sub_23DE4D78C();
  sub_23DE66DDC();
  sub_23DE66DDC();
  if (v36 == v34 && v37 == v35)
    v17 = 1;
  else
    v17 = sub_23DE66FC8();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v18 = *(void (**)(char *, uint64_t))(v5 + 8);
  v18(v12, v4);
  v18(v14, v4);
  v19 = v31;
  v20 = v32;
  v21 = v15;
  v22 = v33;
  (*(void (**)(char *, uint64_t, uint64_t))(v32 + 16))(v31, v21, v33);
  if ((v17 & 1) != 0)
    goto LABEL_9;
  sub_23DE66734();
  v16(v29, *MEMORY[0x24BDCEE78], v4);
  sub_23DE66DDC();
  sub_23DE66DDC();
  if (v36 == v34 && v37 == v35)
  {
    swift_bridgeObjectRelease_n();
    v18(v29, v4);
    v18(v30, v4);
LABEL_9:
    (*(void (**)(char *, uint64_t))(v20 + 8))(v19, v22);
    goto LABEL_10;
  }
  v26 = v19;
  v27 = sub_23DE66FC8();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v18(v29, v4);
  v18(v30, v4);
  (*(void (**)(char *, uint64_t))(v20 + 8))(v26, v22);
  if ((v27 & 1) == 0)
    return 2;
LABEL_10:
  v23 = (void *)sub_23DE66704();
  v24 = objc_msgSend(v23, sel_positionOfDayPeriodInFormattedTime);

  result = 2;
  if ((unint64_t)v24 <= 2)
    return (2 - (_DWORD)v24);
  return result;
}

unint64_t sub_23DE4D78C()
{
  unint64_t result;
  uint64_t v1;

  result = qword_25432AEA0;
  if (!qword_25432AEA0)
  {
    v1 = sub_23DE66728();
    result = MEMORY[0x2426465BC](MEMORY[0x24BDCEE98], v1);
    atomic_store(result, (unint64_t *)&qword_25432AEA0);
  }
  return result;
}

id sub_23DE4D7D4()
{
  uint64_t ObjCClassFromMetadata;
  id result;

  type metadata accessor for MedicationsWidgetTimelineGenerator();
  ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  result = objc_msgSend((id)objc_opt_self(), sel_bundleForClass_, ObjCClassFromMetadata);
  qword_25432B780 = (uint64_t)result;
  return result;
}

ValueMetadata *type metadata accessor for MedicationsWidgetTimelineProvider()
{
  return &type metadata for MedicationsWidgetTimelineProvider;
}

unint64_t sub_23DE4D83C()
{
  unint64_t result;
  uint64_t v1;

  result = qword_25432AEF0;
  if (!qword_25432AEF0)
  {
    v1 = type metadata accessor for MedicationsWidgetEntry();
    result = MEMORY[0x2426465BC](&unk_23DE67E48, v1);
    atomic_store(result, (unint64_t *)&qword_25432AEF0);
  }
  return result;
}

uint64_t sub_23DE4D884@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
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
  void (*v15)(char *, uint64_t, uint64_t);
  NSObject *v16;
  os_log_type_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  int v30;
  uint64_t v31;
  uint64_t v32;

  v4 = sub_23DE66D4C();
  v5 = *(_QWORD *)(v4 - 8);
  v6 = ((uint64_t (*)(void))MEMORY[0x24BDAC7A8])();
  v8 = (char *)&v25 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v6);
  v10 = (char *)&v25 - v9;
  v11 = sub_23DE66878();
  v12 = *(_QWORD *)(v11 - 8);
  MEMORY[0x24BDAC7A8](v11);
  v14 = (char *)&v25 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23DE66860();
  v15 = *(void (**)(char *, uint64_t, uint64_t))(v5 + 16);
  v15(v10, a1, v4);
  v16 = sub_23DE6686C();
  v17 = sub_23DE66E54();
  v30 = v17;
  if (os_log_type_enabled(v16, v17))
  {
    v18 = swift_slowAlloc();
    v28 = v12;
    v19 = v18;
    v26 = swift_slowAlloc();
    v32 = v26;
    *(_DWORD *)v19 = 136446466;
    v29 = a2;
    v31 = sub_23DE54DF0(0xD000000000000021, 0x800000023DE67570, &v32);
    v27 = v11;
    sub_23DE66EB4();
    *(_WORD *)(v19 + 12) = 2082;
    v15(v8, (uint64_t)v10, v4);
    v20 = sub_23DE66DA0();
    v31 = sub_23DE54DF0(v20, v21, &v32);
    a2 = v29;
    sub_23DE66EB4();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v5 + 8))(v10, v4);
    _os_log_impl(&dword_23DE49000, v16, (os_log_type_t)v30, "[%{public}s] Returning placeholder for context %{public}s", (uint8_t *)v19, 0x16u);
    v22 = v26;
    swift_arrayDestroy();
    MEMORY[0x24264664C](v22, -1, -1);
    MEMORY[0x24264664C](v19, -1, -1);

    (*(void (**)(char *, uint64_t))(v28 + 8))(v14, v27);
  }
  else
  {
    (*(void (**)(char *, uint64_t))(v5 + 8))(v10, v4);

    (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v11);
  }
  sub_23DE666EC();
  v23 = type metadata accessor for MedicationsWidgetEntry();
  return sub_23DE4ACE4((uint64_t *)(a2 + *(int *)(v23 + 20)));
}

uint64_t sub_23DE4DB30(uint64_t a1, uint64_t a2, uint64_t (*a3)(_QWORD), uint64_t a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  void (*v18)(char *, uint64_t, uint64_t);
  NSObject *v19;
  os_log_type_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t (*v32)(_QWORD);
  int v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;

  v8 = sub_23DE66D4C();
  v9 = *(_QWORD *)(v8 - 8);
  v10 = MEMORY[0x24BDAC7A8](v8);
  v12 = (char *)&v28 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v10);
  v14 = (char *)&v28 - v13;
  v15 = sub_23DE66878();
  v34 = *(_QWORD *)(v15 - 8);
  v35 = v15;
  MEMORY[0x24BDAC7A8](v15);
  v17 = (char *)&v28 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23DE66860();
  v18 = *(void (**)(char *, uint64_t, uint64_t))(v9 + 16);
  v18(v14, a2, v8);
  v19 = sub_23DE6686C();
  v20 = sub_23DE66E54();
  v33 = v20;
  if (os_log_type_enabled(v19, v20))
  {
    v21 = swift_slowAlloc();
    v30 = a1;
    v22 = v21;
    v29 = swift_slowAlloc();
    v37 = v29;
    *(_DWORD *)v22 = 136446466;
    v32 = a3;
    v36 = sub_23DE54DF0(0xD000000000000021, 0x800000023DE67570, &v37);
    v31 = a4;
    sub_23DE66EB4();
    *(_WORD *)(v22 + 12) = 2082;
    v18(v12, (uint64_t)v14, v8);
    v23 = sub_23DE66DA0();
    v36 = sub_23DE54DF0(v23, v24, &v37);
    a3 = v32;
    sub_23DE66EB4();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v9 + 8))(v14, v8);
    _os_log_impl(&dword_23DE49000, v19, (os_log_type_t)v33, "[%{public}s] Returning snapshot for context %{public}s", (uint8_t *)v22, 0x16u);
    v25 = v29;
    swift_arrayDestroy();
    MEMORY[0x24264664C](v25, -1, -1);
    v26 = v22;
    a1 = v30;
    MEMORY[0x24264664C](v26, -1, -1);
  }
  else
  {
    (*(void (**)(char *, uint64_t))(v9 + 8))(v14, v8);
  }

  (*(void (**)(char *, uint64_t))(v34 + 8))(v17, v35);
  return a3(a1);
}

uint64_t sub_23DE4DDC8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
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
  char *v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  void (*v21)(char *, uint64_t, uint64_t);
  NSObject *v22;
  os_log_type_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;
  os_log_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  unint64_t v32;
  unint64_t v33;
  uint64_t v34;
  _QWORD *v35;
  uint64_t v36;
  uint64_t v37;
  char *v38;
  uint64_t v39;
  uint64_t (**v40)(uint64_t);
  _QWORD v42[2];
  os_log_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  int v47;
  void (*v48)(char *, uint64_t, uint64_t);
  uint64_t v49;
  char *v50;
  uint64_t v51;
  uint64_t v52;
  char *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  char *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61[2];

  v59 = a4;
  v51 = a2;
  v54 = sub_23DE66CD4();
  v58 = *(_QWORD *)(v54 - 8);
  MEMORY[0x24BDAC7A8](v54);
  v57 = (char *)v42 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_23DE666F8();
  v55 = *(_QWORD *)(v7 - 8);
  v56 = v7;
  MEMORY[0x24BDAC7A8](v7);
  v53 = (char *)v42 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = sub_23DE66D4C();
  v10 = *(_QWORD *)(v9 - 8);
  v11 = *(_QWORD *)(v10 + 64);
  v12 = MEMORY[0x24BDAC7A8](v9);
  v50 = (char *)v42 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = MEMORY[0x24BDAC7A8](v12);
  v15 = (char *)v42 - v14;
  MEMORY[0x24BDAC7A8](v13);
  v17 = (char *)v42 - v16;
  v18 = sub_23DE66878();
  v49 = *(_QWORD *)(v18 - 8);
  MEMORY[0x24BDAC7A8](v18);
  v20 = (char *)v42 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23DE66860();
  v21 = *(void (**)(char *, uint64_t, uint64_t))(v10 + 16);
  v52 = a1;
  v21(v17, a1, v9);
  v22 = sub_23DE6686C();
  v23 = sub_23DE66E54();
  v47 = v23;
  if (os_log_type_enabled(v22, v23))
  {
    v24 = swift_slowAlloc();
    v43 = v22;
    v25 = v24;
    v44 = swift_slowAlloc();
    v61[0] = v44;
    *(_DWORD *)v25 = 136446466;
    v45 = v18;
    v60 = sub_23DE54DF0(0xD000000000000021, 0x800000023DE67570, v61);
    v46 = v10;
    sub_23DE66EB4();
    *(_WORD *)(v25 + 12) = 2082;
    v42[1] = v25 + 14;
    v21(v15, (uint64_t)v17, v9);
    v26 = sub_23DE66DA0();
    v60 = sub_23DE54DF0(v26, v27, v61);
    v10 = v46;
    sub_23DE66EB4();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v10 + 8))(v17, v9);
    v28 = v43;
    _os_log_impl(&dword_23DE49000, v43, (os_log_type_t)v47, "[%{public}s] Requesting timeline for context %{public}s", (uint8_t *)v25, 0x16u);
    v29 = v44;
    swift_arrayDestroy();
    MEMORY[0x24264664C](v29, -1, -1);
    MEMORY[0x24264664C](v25, -1, -1);

    (*(void (**)(char *, uint64_t))(v49 + 8))(v20, v45);
  }
  else
  {
    (*(void (**)(char *, uint64_t))(v10 + 8))(v17, v9);

    (*(void (**)(char *, uint64_t))(v49 + 8))(v20, v18);
  }
  v48 = v21;
  v30 = v52;
  v21(v15, v52, v9);
  v31 = v9;
  v32 = (*(unsigned __int8 *)(v10 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  v33 = (v11 + v32 + 7) & 0xFFFFFFFFFFFFFFF8;
  v34 = swift_allocObject();
  v49 = *(_QWORD *)(v10 + 32);
  ((void (*)(unint64_t, char *, uint64_t))v49)(v34 + v32, v15, v31);
  v35 = (_QWORD *)(v34 + v33);
  *v35 = v51;
  v35[1] = a3;
  swift_retain();
  v36 = (uint64_t)v53;
  sub_23DE666EC();
  v37 = (uint64_t)v57;
  sub_23DE66D40();
  v38 = v50;
  v48(v50, v30, v31);
  v39 = swift_allocObject();
  ((void (*)(unint64_t, char *, uint64_t))v49)(v39 + v32, v38, v31);
  v40 = (uint64_t (**)(uint64_t))(v39 + v33);
  *v40 = sub_23DE4E8F4;
  v40[1] = (uint64_t (*)(uint64_t))v34;
  swift_retain();
  sub_23DE51994(v36, v37, (uint64_t)sub_23DE4E904, v39);
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v58 + 8))(v37, v54);
  (*(void (**)(uint64_t, uint64_t))(v55 + 8))(v36, v56);
  return swift_release();
}

uint64_t sub_23DE4E268(uint64_t a1, uint64_t a2, void (*a3)(_QWORD), uint64_t a4)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _BYTE *v15;
  uint64_t v16;
  _BYTE *v17;
  uint64_t v18;
  uint64_t v19;
  _BYTE *v20;
  void (*v21)(_BYTE *, uint64_t, uint64_t);
  NSObject *v22;
  os_log_type_t v23;
  int v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  unint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  _BYTE *v33;
  _BYTE v35[12];
  int v36;
  uint64_t v37;
  uint64_t v38;
  void (*v39)(_QWORD);
  uint64_t v40;
  uint64_t v41;
  _BYTE *v42;
  uint64_t v43;
  uint64_t v44;
  _BYTE *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;

  v43 = a1;
  v7 = sub_23DE66D1C();
  MEMORY[0x24BDAC7A8](v7);
  v45 = &v35[-((v8 + 15) & 0xFFFFFFFFFFFFFFF0)];
  sub_23DE4E910();
  v46 = v9;
  v44 = *(_QWORD *)(v9 - 8);
  MEMORY[0x24BDAC7A8](v9);
  v42 = &v35[-((v10 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v11 = sub_23DE66D4C();
  v12 = *(_QWORD *)(v11 - 8);
  v13 = MEMORY[0x24BDAC7A8](v11);
  v15 = &v35[-((v14 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x24BDAC7A8](v13);
  v17 = &v35[-v16];
  v18 = sub_23DE66878();
  v40 = *(_QWORD *)(v18 - 8);
  v41 = v18;
  MEMORY[0x24BDAC7A8](v18);
  v20 = &v35[-((v19 + 15) & 0xFFFFFFFFFFFFFFF0)];
  sub_23DE66860();
  v21 = *(void (**)(_BYTE *, uint64_t, uint64_t))(v12 + 16);
  v21(v17, a2, v11);
  v22 = sub_23DE6686C();
  v23 = sub_23DE66E54();
  v24 = v23;
  if (os_log_type_enabled(v22, v23))
  {
    v25 = swift_slowAlloc();
    v36 = v24;
    v26 = v25;
    v37 = swift_slowAlloc();
    v48 = v37;
    *(_DWORD *)v26 = 136446466;
    v38 = a4;
    v47 = sub_23DE54DF0(0xD000000000000021, 0x800000023DE67570, &v48);
    v39 = a3;
    sub_23DE66EB4();
    *(_WORD *)(v26 + 12) = 2082;
    v21(v15, (uint64_t)v17, v11);
    v27 = sub_23DE66DA0();
    v47 = sub_23DE54DF0(v27, v28, &v48);
    a3 = v39;
    sub_23DE66EB4();
    swift_bridgeObjectRelease();
    (*(void (**)(_BYTE *, uint64_t))(v12 + 8))(v17, v11);
    _os_log_impl(&dword_23DE49000, v22, (os_log_type_t)v36, "[%{public}s] Returning timeline for context %{public}s", (uint8_t *)v26, 0x16u);
    v29 = v37;
    swift_arrayDestroy();
    MEMORY[0x24264664C](v29, -1, -1);
    MEMORY[0x24264664C](v26, -1, -1);
  }
  else
  {
    (*(void (**)(_BYTE *, uint64_t))(v12 + 8))(v17, v11);
  }

  (*(void (**)(_BYTE *, uint64_t))(v40 + 8))(v20, v41);
  sub_23DE4E970();
  v30 = *(unsigned __int8 *)(*(_QWORD *)(type metadata accessor for MedicationsWidgetEntry() - 8) + 80);
  v31 = (v30 + 32) & ~v30;
  v32 = swift_allocObject();
  *(_OWORD *)(v32 + 16) = xmmword_23DE67580;
  sub_23DE4CEE8(v43, v32 + v31);
  sub_23DE66D10();
  sub_23DE4D83C();
  v33 = v42;
  sub_23DE66D58();
  a3(v33);
  return (*(uint64_t (**)(_BYTE *, uint64_t))(v44 + 8))(v33, v46);
}

uint64_t sub_23DE4E610(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _QWORD *v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  unint64_t v16;
  unint64_t v17;
  uint64_t v18;
  _QWORD *v19;
  uint64_t v20;
  _QWORD v22[2];
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;

  v25 = a2;
  v26 = a3;
  v5 = sub_23DE66D4C();
  v6 = *(_QWORD *)(v5 - 8);
  v7 = *(_QWORD *)(v6 + 64);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)v22 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = sub_23DE66CD4();
  v23 = *(_QWORD *)(v9 - 8);
  v24 = v9;
  MEMORY[0x24BDAC7A8](v9);
  v11 = (char *)v22 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = sub_23DE666F8();
  v13 = *(_QWORD *)(v12 - 8);
  MEMORY[0x24BDAC7A8](v12);
  v15 = (char *)v22 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v22[1] = *v3;
  sub_23DE666EC();
  sub_23DE66D40();
  (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))(v8, a1, v5);
  v16 = (*(unsigned __int8 *)(v6 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80);
  v17 = (v7 + v16 + 7) & 0xFFFFFFFFFFFFFFF8;
  v18 = swift_allocObject();
  (*(void (**)(unint64_t, char *, uint64_t))(v6 + 32))(v18 + v16, v8, v5);
  v19 = (_QWORD *)(v18 + v17);
  v20 = v26;
  *v19 = v25;
  v19[1] = v20;
  swift_retain();
  sub_23DE51994((uint64_t)v15, (uint64_t)v11, (uint64_t)sub_23DE4E904, v18);
  swift_release();
  (*(void (**)(char *, uint64_t))(v23 + 8))(v11, v24);
  return (*(uint64_t (**)(char *, uint64_t))(v13 + 8))(v15, v12);
}

uint64_t sub_23DE4E7C8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t *v3;

  return sub_23DE4DDC8(a1, a2, a3, *v3);
}

uint64_t sub_23DE4E7D0()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 16) = v1;
  *v1 = v0;
  v1[1] = sub_23DE4E83C;
  return sub_23DE66CE0();
}

uint64_t sub_23DE4E83C()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_23DE4E884()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 16) = v1;
  *v1 = v0;
  v1[1] = sub_23DE4EAA4;
  return sub_23DE66CEC();
}

uint64_t sub_23DE4E8F4(uint64_t a1)
{
  return sub_23DE4EA40(a1, (uint64_t (*)(uint64_t, unint64_t, _QWORD, _QWORD))sub_23DE4E268);
}

uint64_t sub_23DE4E904(uint64_t a1)
{
  return sub_23DE4EA40(a1, (uint64_t (*)(uint64_t, unint64_t, _QWORD, _QWORD))sub_23DE4DB30);
}

void sub_23DE4E910()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_256D0CCE8)
  {
    type metadata accessor for MedicationsWidgetEntry();
    sub_23DE4D83C();
    v0 = sub_23DE66D64();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_256D0CCE8);
  }
}

void sub_23DE4E970()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_256D0CCF0)
  {
    type metadata accessor for MedicationsWidgetEntry();
    v0 = sub_23DE66FBC();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_256D0CCF0);
  }
}

uint64_t objectdestroyTm()
{
  uint64_t v0;
  uint64_t v1;

  v1 = sub_23DE66D4C();
  (*(void (**)(unint64_t, uint64_t))(*(_QWORD *)(v1 - 8) + 8))(v0+ ((*(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80)), v1);
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_23DE4EA40(uint64_t a1, uint64_t (*a2)(uint64_t, unint64_t, _QWORD, _QWORD))
{
  uint64_t v2;
  uint64_t v4;
  unint64_t v5;
  _QWORD *v6;

  v4 = *(_QWORD *)(sub_23DE66D4C() - 8);
  v5 = (*(unsigned __int8 *)(v4 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  v6 = (_QWORD *)(v2 + ((*(_QWORD *)(v4 + 64) + v5 + 7) & 0xFFFFFFFFFFFFFFF8));
  return a2(a1, v2 + v5, *v6, v6[1]);
}

uint64_t *sub_23DE4EAA8(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5;
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
  int *v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  unsigned int (*v22)(char *, uint64_t, uint64_t);
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  char *v26;
  char *v27;
  uint64_t v28;
  uint64_t v29;
  char *v30;
  char *v31;
  uint64_t v32;
  void (*v34)(char *, char *);
  char *__dst;
  uint64_t v36;
  uint64_t v37;

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
    sub_23DE4CF6C(0, &qword_25432AB30, (uint64_t (*)(uint64_t))MEMORY[0x24BDFAF10], MEMORY[0x24BDEB560]);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v7 = sub_23DE66CD4();
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
    v12 = sub_23DE666F8();
    v36 = *(_QWORD *)(v12 - 8);
    v37 = v12;
    v34 = *(void (**)(char *, char *))(v36 + 16);
    v34(v10, v11);
    v13 = *(int *)(type metadata accessor for MedicationsWidgetEntry() + 20);
    v14 = &v10[v13];
    v15 = &v11[v13];
    v16 = *(_QWORD *)&v11[v13 + 8];
    *(_QWORD *)v14 = *(_QWORD *)&v11[v13];
    *((_QWORD *)v14 + 1) = v16;
    *((_QWORD *)v14 + 2) = *(_QWORD *)&v11[v13 + 16];
    v17 = (int *)type metadata accessor for MedicationsWidgetViewModel();
    v18 = v17[6];
    __dst = &v14[v18];
    v19 = &v15[v18];
    v20 = type metadata accessor for MedmojiIconConfiguration();
    v21 = *(_QWORD *)(v20 - 8);
    v22 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v21 + 48);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    if (v22(v19, 1, v20))
    {
      sub_23DE4CF6C(0, qword_25432AAD0, (uint64_t (*)(uint64_t))type metadata accessor for MedmojiIconConfiguration, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1C68]);
      memcpy(__dst, v19, *(_QWORD *)(*(_QWORD *)(v23 - 8) + 64));
    }
    else
    {
      v24 = sub_23DE66818();
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v24 - 8) + 16))(__dst, v19, v24);
      v25 = *(int *)(v20 + 20);
      v26 = &__dst[v25];
      v27 = &v19[v25];
      v28 = sub_23DE667DC();
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v28 - 8) + 16))(v26, v27, v28);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v21 + 56))(__dst, 0, 1, v20);
    }
    v14[v17[7]] = v15[v17[7]];
    v29 = v17[8];
    v30 = &v14[v29];
    v31 = &v15[v29];
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v36 + 48))(&v15[v29], 1, v37))
    {
      sub_23DE4CF6C(0, &qword_25432A770, (uint64_t (*)(uint64_t))MEMORY[0x24BDCE900], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1C68]);
      memcpy(v30, v31, *(_QWORD *)(*(_QWORD *)(v32 - 8) + 64));
    }
    else
    {
      ((void (*)(char *, char *, uint64_t))v34)(v30, v31, v37);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v36 + 56))(v30, 0, 1, v37);
    }
  }
  return a1;
}

uint64_t sub_23DE4ED8C(uint64_t a1, uint64_t a2)
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
  uint64_t v15;
  uint64_t result;
  void (*v17)(uint64_t, uint64_t);

  sub_23DE4CF6C(0, &qword_25432AB30, (uint64_t (*)(uint64_t))MEMORY[0x24BDFAF10], MEMORY[0x24BDEB560]);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v4 = sub_23DE66CD4();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(a1, v4);
  }
  else
  {
    swift_release();
  }
  v5 = a1 + *(int *)(a2 + 20);
  v6 = sub_23DE666F8();
  v7 = *(_QWORD *)(v6 - 8);
  v17 = *(void (**)(uint64_t, uint64_t))(v7 + 8);
  v17(v5, v6);
  v8 = v5 + *(int *)(type metadata accessor for MedicationsWidgetEntry() + 20);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v9 = type metadata accessor for MedicationsWidgetViewModel();
  v10 = v8 + *(int *)(v9 + 24);
  v11 = type metadata accessor for MedmojiIconConfiguration();
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 48))(v10, 1, v11))
  {
    v12 = sub_23DE66818();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 8))(v10, v12);
    v13 = v10 + *(int *)(v11 + 20);
    v14 = sub_23DE667DC();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 8))(v13, v14);
  }
  v15 = v8 + *(int *)(v9 + 32);
  result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(v15, 1, v6);
  if (!(_DWORD)result)
    return ((uint64_t (*)(uint64_t, uint64_t))v17)(v15, v6);
  return result;
}

_QWORD *sub_23DE4EF2C(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  char *v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  char *v13;
  uint64_t v14;
  int *v15;
  uint64_t v16;
  char *v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  unsigned int (*v21)(char *, uint64_t, uint64_t);
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  char *v25;
  char *v26;
  uint64_t v27;
  uint64_t v28;
  char *v29;
  char *v30;
  uint64_t v31;
  void (*v33)(char *, char *);
  uint64_t v34;
  uint64_t v35;
  _QWORD *v36;

  sub_23DE4CF6C(0, &qword_25432AB30, (uint64_t (*)(uint64_t))MEMORY[0x24BDFAF10], MEMORY[0x24BDEB560]);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v6 = sub_23DE66CD4();
    (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(a1, a2, v6);
  }
  else
  {
    *a1 = *a2;
    swift_retain();
  }
  swift_storeEnumTagMultiPayload();
  v7 = *(int *)(a3 + 20);
  v36 = a1;
  v8 = (char *)a1 + v7;
  v9 = (char *)a2 + v7;
  v10 = sub_23DE666F8();
  v34 = *(_QWORD *)(v10 - 8);
  v35 = v10;
  v33 = *(void (**)(char *, char *))(v34 + 16);
  v33(v8, v9);
  v11 = *(int *)(type metadata accessor for MedicationsWidgetEntry() + 20);
  v12 = &v8[v11];
  v13 = &v9[v11];
  v14 = *(_QWORD *)&v9[v11 + 8];
  *(_QWORD *)v12 = *(_QWORD *)&v9[v11];
  *((_QWORD *)v12 + 1) = v14;
  *((_QWORD *)v12 + 2) = *(_QWORD *)&v9[v11 + 16];
  v15 = (int *)type metadata accessor for MedicationsWidgetViewModel();
  v16 = v15[6];
  v17 = &v12[v16];
  v18 = &v13[v16];
  v19 = type metadata accessor for MedmojiIconConfiguration();
  v20 = *(_QWORD *)(v19 - 8);
  v21 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v20 + 48);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  if (v21(v18, 1, v19))
  {
    sub_23DE4CF6C(0, qword_25432AAD0, (uint64_t (*)(uint64_t))type metadata accessor for MedmojiIconConfiguration, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1C68]);
    memcpy(v17, v18, *(_QWORD *)(*(_QWORD *)(v22 - 8) + 64));
  }
  else
  {
    v23 = sub_23DE66818();
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v23 - 8) + 16))(v17, v18, v23);
    v24 = *(int *)(v19 + 20);
    v25 = &v17[v24];
    v26 = &v18[v24];
    v27 = sub_23DE667DC();
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v27 - 8) + 16))(v25, v26, v27);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v20 + 56))(v17, 0, 1, v19);
  }
  v12[v15[7]] = v13[v15[7]];
  v28 = v15[8];
  v29 = &v12[v28];
  v30 = &v13[v28];
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v34 + 48))(&v13[v28], 1, v35))
  {
    sub_23DE4CF6C(0, &qword_25432A770, (uint64_t (*)(uint64_t))MEMORY[0x24BDCE900], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1C68]);
    memcpy(v29, v30, *(_QWORD *)(*(_QWORD *)(v31 - 8) + 64));
  }
  else
  {
    ((void (*)(char *, char *, uint64_t))v33)(v29, v30, v35);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v34 + 56))(v29, 0, 1, v35);
  }
  return v36;
}

_QWORD *sub_23DE4F1E0(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  char *v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  char *v13;
  int *v14;
  uint64_t v15;
  char *v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t (*v20)(char *, uint64_t, uint64_t);
  int v21;
  int v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  char *v27;
  char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  char *v32;
  char *v33;
  uint64_t v34;
  uint64_t v35;
  char *v36;
  char *v37;
  uint64_t (*v38)(char *, uint64_t, uint64_t);
  int v39;
  int v40;
  _QWORD *v41;
  uint64_t v42;
  void (*v44)(char *, char *, uint64_t);
  uint64_t v45;
  _QWORD *v46;

  if (a1 != a2)
  {
    sub_23DE4F5A8((uint64_t)a1);
    sub_23DE4CF6C(0, &qword_25432AB30, (uint64_t (*)(uint64_t))MEMORY[0x24BDFAF10], MEMORY[0x24BDEB560]);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v6 = sub_23DE66CD4();
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
  v46 = a1;
  v8 = (char *)a1 + v7;
  v9 = (char *)a2 + v7;
  v10 = sub_23DE666F8();
  v45 = *(_QWORD *)(v10 - 8);
  v44 = *(void (**)(char *, char *, uint64_t))(v45 + 24);
  v44(v8, v9, v10);
  v11 = *(int *)(type metadata accessor for MedicationsWidgetEntry() + 20);
  v12 = &v8[v11];
  v13 = &v9[v11];
  *(_QWORD *)v12 = *(_QWORD *)&v9[v11];
  *((_QWORD *)v12 + 1) = *(_QWORD *)&v9[v11 + 8];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *((_QWORD *)v12 + 2) = *((_QWORD *)v13 + 2);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v14 = (int *)type metadata accessor for MedicationsWidgetViewModel();
  v15 = v14[6];
  v16 = &v12[v15];
  v17 = &v13[v15];
  v18 = type metadata accessor for MedmojiIconConfiguration();
  v19 = *(_QWORD *)(v18 - 8);
  v20 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v19 + 48);
  v21 = v20(v16, 1, v18);
  v22 = v20(v17, 1, v18);
  if (v21)
  {
    if (v22)
    {
      v23 = (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1C68];
LABEL_11:
      sub_23DE4CF6C(0, qword_25432AAD0, (uint64_t (*)(uint64_t))type metadata accessor for MedmojiIconConfiguration, v23);
      memcpy(v16, v17, *(_QWORD *)(*(_QWORD *)(v24 - 8) + 64));
      goto LABEL_14;
    }
    v25 = sub_23DE66818();
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v25 - 8) + 16))(v16, v17, v25);
    v26 = *(int *)(v18 + 20);
    v27 = &v16[v26];
    v28 = &v17[v26];
    v29 = sub_23DE667DC();
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v29 - 8) + 16))(v27, v28, v29);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v19 + 56))(v16, 0, 1, v18);
  }
  else
  {
    if (v22)
    {
      sub_23DE513F8((uint64_t)v16, (uint64_t (*)(_QWORD))type metadata accessor for MedmojiIconConfiguration);
      v23 = (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1C68];
      goto LABEL_11;
    }
    v30 = sub_23DE66818();
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v30 - 8) + 24))(v16, v17, v30);
    v31 = *(int *)(v18 + 20);
    v32 = &v16[v31];
    v33 = &v17[v31];
    v34 = sub_23DE667DC();
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v34 - 8) + 24))(v32, v33, v34);
  }
LABEL_14:
  v12[v14[7]] = v13[v14[7]];
  v35 = v14[8];
  v36 = &v12[v35];
  v37 = &v13[v35];
  v38 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v45 + 48);
  v39 = v38(&v12[v35], 1, v10);
  v40 = v38(v37, 1, v10);
  if (!v39)
  {
    v41 = v46;
    if (!v40)
    {
      v44(v36, v37, v10);
      return v41;
    }
    (*(void (**)(char *, uint64_t))(v45 + 8))(v36, v10);
    goto LABEL_19;
  }
  v41 = v46;
  if (v40)
  {
LABEL_19:
    sub_23DE4CF6C(0, &qword_25432A770, (uint64_t (*)(uint64_t))MEMORY[0x24BDCE900], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1C68]);
    memcpy(v36, v37, *(_QWORD *)(*(_QWORD *)(v42 - 8) + 64));
    return v41;
  }
  (*(void (**)(char *, char *, uint64_t))(v45 + 16))(v36, v37, v10);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v45 + 56))(v36, 0, 1, v10);
  return v41;
}

uint64_t sub_23DE4F5A8(uint64_t a1)
{
  uint64_t v2;

  sub_23DE4CF6C(0, &qword_25432AB30, (uint64_t (*)(uint64_t))MEMORY[0x24BDFAF10], MEMORY[0x24BDEB560]);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

char *sub_23DE4F5FC(char *a1, char *a2, uint64_t a3)
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
  char *v15;
  char *v16;
  int *v17;
  uint64_t v18;
  char *v19;
  char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  char *v26;
  char *v27;
  char *v28;
  uint64_t v29;
  char *v30;
  uint64_t v31;
  char *v32;
  char *v33;
  uint64_t v34;
  uint64_t v36;
  void (*v37)(char *, char *, uint64_t);

  sub_23DE4CF6C(0, &qword_25432AB30, (uint64_t (*)(uint64_t))MEMORY[0x24BDFAF10], MEMORY[0x24BDEB560]);
  v7 = v6;
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v8 = sub_23DE66CD4();
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
  v12 = sub_23DE666F8();
  v13 = *(_QWORD *)(v12 - 8);
  v37 = *(void (**)(char *, char *, uint64_t))(v13 + 32);
  v37(v10, v11, v12);
  v14 = *(int *)(type metadata accessor for MedicationsWidgetEntry() + 20);
  v15 = &v10[v14];
  v16 = &v11[v14];
  *(_OWORD *)v15 = *(_OWORD *)&v11[v14];
  *((_QWORD *)v15 + 2) = *(_QWORD *)&v11[v14 + 16];
  v17 = (int *)type metadata accessor for MedicationsWidgetViewModel();
  v18 = v17[6];
  v19 = &v15[v18];
  v20 = &v16[v18];
  v21 = type metadata accessor for MedmojiIconConfiguration();
  v22 = *(_QWORD *)(v21 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v22 + 48))(v20, 1, v21))
  {
    sub_23DE4CF6C(0, qword_25432AAD0, (uint64_t (*)(uint64_t))type metadata accessor for MedmojiIconConfiguration, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1C68]);
    memcpy(v19, v20, *(_QWORD *)(*(_QWORD *)(v23 - 8) + 64));
  }
  else
  {
    v24 = sub_23DE66818();
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v24 - 8) + 32))(v19, v20, v24);
    v25 = *(int *)(v21 + 20);
    v36 = v13;
    v26 = a1;
    v27 = &v19[v25];
    v28 = &v20[v25];
    v29 = sub_23DE667DC();
    v30 = v27;
    a1 = v26;
    v13 = v36;
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v29 - 8) + 32))(v30, v28, v29);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v22 + 56))(v19, 0, 1, v21);
  }
  v15[v17[7]] = v16[v17[7]];
  v31 = v17[8];
  v32 = &v15[v31];
  v33 = &v16[v31];
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v13 + 48))(&v16[v31], 1, v12))
  {
    sub_23DE4CF6C(0, &qword_25432A770, (uint64_t (*)(uint64_t))MEMORY[0x24BDCE900], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1C68]);
    memcpy(v32, v33, *(_QWORD *)(*(_QWORD *)(v34 - 8) + 64));
  }
  else
  {
    v37(v32, v33, v12);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v13 + 56))(v32, 0, 1, v12);
  }
  return a1;
}

char *sub_23DE4F8A4(char *a1, char *a2, uint64_t a3)
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
  int *v17;
  uint64_t v18;
  char *v19;
  char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t (*v23)(char *, uint64_t, uint64_t);
  int v24;
  int v25;
  uint64_t (*v26)(uint64_t, uint64_t);
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
  char *v39;
  char *v40;
  uint64_t (*v41)(char *, uint64_t, uint64_t);
  int v42;
  int v43;
  char *v44;
  uint64_t v45;
  void (*v47)(char *, char *, uint64_t);
  uint64_t v48;
  char *v49;

  if (a1 != a2)
  {
    sub_23DE4F5A8((uint64_t)a1);
    sub_23DE4CF6C(0, &qword_25432AB30, (uint64_t (*)(uint64_t))MEMORY[0x24BDFAF10], MEMORY[0x24BDEB560]);
    v7 = v6;
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v8 = sub_23DE66CD4();
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v8 - 8) + 32))(a1, a2, v8);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v7 - 8) + 64));
    }
  }
  v9 = *(int *)(a3 + 20);
  v49 = a1;
  v10 = &a1[v9];
  v11 = &a2[v9];
  v12 = sub_23DE666F8();
  v48 = *(_QWORD *)(v12 - 8);
  v47 = *(void (**)(char *, char *, uint64_t))(v48 + 40);
  v47(v10, v11, v12);
  v13 = *(int *)(type metadata accessor for MedicationsWidgetEntry() + 20);
  v14 = &v10[v13];
  v15 = &v11[v13];
  v16 = *(_QWORD *)&v11[v13 + 8];
  *(_QWORD *)v14 = *(_QWORD *)&v11[v13];
  *((_QWORD *)v14 + 1) = v16;
  swift_bridgeObjectRelease();
  *((_QWORD *)v14 + 2) = *((_QWORD *)v15 + 2);
  swift_bridgeObjectRelease();
  v17 = (int *)type metadata accessor for MedicationsWidgetViewModel();
  v18 = v17[6];
  v19 = &v14[v18];
  v20 = &v15[v18];
  v21 = type metadata accessor for MedmojiIconConfiguration();
  v22 = *(_QWORD *)(v21 - 8);
  v23 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v22 + 48);
  v24 = v23(v19, 1, v21);
  v25 = v23(v20, 1, v21);
  if (v24)
  {
    if (v25)
    {
      v26 = (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1C68];
LABEL_10:
      sub_23DE4CF6C(0, qword_25432AAD0, (uint64_t (*)(uint64_t))type metadata accessor for MedmojiIconConfiguration, v26);
      memcpy(v19, v20, *(_QWORD *)(*(_QWORD *)(v27 - 8) + 64));
      goto LABEL_13;
    }
    v28 = sub_23DE66818();
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v28 - 8) + 32))(v19, v20, v28);
    v29 = *(int *)(v21 + 20);
    v30 = &v19[v29];
    v31 = &v20[v29];
    v32 = sub_23DE667DC();
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v32 - 8) + 32))(v30, v31, v32);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v22 + 56))(v19, 0, 1, v21);
  }
  else
  {
    if (v25)
    {
      sub_23DE513F8((uint64_t)v19, (uint64_t (*)(_QWORD))type metadata accessor for MedmojiIconConfiguration);
      v26 = (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1C68];
      goto LABEL_10;
    }
    v33 = sub_23DE66818();
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v33 - 8) + 40))(v19, v20, v33);
    v34 = *(int *)(v21 + 20);
    v35 = &v19[v34];
    v36 = &v20[v34];
    v37 = sub_23DE667DC();
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v37 - 8) + 40))(v35, v36, v37);
  }
LABEL_13:
  v14[v17[7]] = v15[v17[7]];
  v38 = v17[8];
  v39 = &v14[v38];
  v40 = &v15[v38];
  v41 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v48 + 48);
  v42 = v41(&v14[v38], 1, v12);
  v43 = v41(v40, 1, v12);
  if (!v42)
  {
    v44 = v49;
    if (!v43)
    {
      v47(v39, v40, v12);
      return v44;
    }
    (*(void (**)(char *, uint64_t))(v48 + 8))(v39, v12);
    goto LABEL_18;
  }
  v44 = v49;
  if (v43)
  {
LABEL_18:
    sub_23DE4CF6C(0, &qword_25432A770, (uint64_t (*)(uint64_t))MEMORY[0x24BDCE900], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1C68]);
    memcpy(v39, v40, *(_QWORD *)(*(_QWORD *)(v45 - 8) + 64));
    return v44;
  }
  (*(void (**)(char *, char *, uint64_t))(v48 + 32))(v39, v40, v12);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v48 + 56))(v39, 0, 1, v12);
  return v44;
}

uint64_t sub_23DE4FC50()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_23DE4FC5C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t, uint64_t);
  uint64_t v10;

  sub_23DE4CF6C(0, &qword_25432AF88, (uint64_t (*)(uint64_t))MEMORY[0x24BDFAF10], MEMORY[0x24BDEB580]);
  v7 = *(_QWORD *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == (_DWORD)a2)
  {
    v8 = v6;
    v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    v10 = a1;
  }
  else
  {
    v8 = type metadata accessor for MedicationsWidgetEntry();
    v10 = a1 + *(int *)(a3 + 20);
    v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 48);
  }
  return v9(v10, a2, v8);
}

uint64_t sub_23DE4FCE8()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_23DE4FCF4(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v12;

  sub_23DE4CF6C(0, &qword_25432AF88, (uint64_t (*)(uint64_t))MEMORY[0x24BDFAF10], MEMORY[0x24BDEB580]);
  v9 = *(_QWORD *)(v8 - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    v10 = v8;
    v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    v12 = a1;
  }
  else
  {
    v10 = type metadata accessor for MedicationsWidgetEntry();
    v12 = a1 + *(int *)(a4 + 20);
    v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 56);
  }
  return v11(v12, a2, a2, v10);
}

uint64_t type metadata accessor for MedicationsWidgetEntryView()
{
  uint64_t result;

  result = qword_25432A968;
  if (!qword_25432A968)
    return swift_getSingletonMetadata();
  return result;
}

void sub_23DE4FDC4()
{
  unint64_t v0;
  unint64_t v1;

  sub_23DE4CF6C(319, &qword_25432AB30, (uint64_t (*)(uint64_t))MEMORY[0x24BDFAF10], MEMORY[0x24BDEB560]);
  if (v0 <= 0x3F)
  {
    type metadata accessor for MedicationsWidgetEntry();
    if (v1 <= 0x3F)
      swift_initStructMetadata();
  }
}

uint64_t sub_23DE4FE60()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_23DE4FE70@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t (*v2)(uint64_t, uint64_t, uint64_t);
  uint64_t v3;
  uint64_t v4;
  uint64_t (*v5)(uint64_t, uint64_t, uint64_t);
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
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
  uint64_t *v24;
  uint64_t (*v25)(uint64_t);
  uint64_t v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t v30;
  int *v31;
  uint64_t v32;
  char *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  char *v37;
  int v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t KeyPath;
  uint64_t v43;
  uint64_t (*v44)(uint64_t);
  uint64_t (*v45)(uint64_t, uint64_t);
  uint64_t (*v46)(uint64_t);
  uint64_t (*v47)(uint64_t);
  uint64_t v48;
  uint64_t v49;
  int *v50;
  uint64_t v51;
  uint64_t (*v52)(_QWORD);
  uint64_t v53;
  unint64_t *v54;
  void (*v55)(uint64_t, unint64_t *, uint64_t (*)(uint64_t, uint64_t, _QWORD));
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t (*v59)(uint64_t);
  uint64_t (*v60)(uint64_t, uint64_t);
  uint64_t (*v61)(uint64_t);
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t (*v69)(uint64_t);
  uint64_t (*v70)(uint64_t, uint64_t);
  uint64_t v71;
  uint64_t v72;
  uint64_t v74;
  char *v75;
  uint64_t v76;
  uint64_t *v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  char *v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  char *v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;

  v93 = a1;
  v2 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))MEMORY[0x24BDEF380];
  sub_23DE50A14(0, &qword_25432AFF8, MEMORY[0x24BDEF380]);
  v79 = v3;
  MEMORY[0x24BDAC7A8](v3);
  v80 = (uint64_t)&v75 - v4;
  v5 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))MEMORY[0x24BDEF3B8];
  sub_23DE50A14(0, &qword_25432B040, MEMORY[0x24BDEF3B8]);
  v92 = v6;
  MEMORY[0x24BDAC7A8](v6);
  v81 = (char *)&v75 - v7;
  v78 = type metadata accessor for MedicationsWidgetRectangularView();
  MEMORY[0x24BDAC7A8](v78);
  v76 = (uint64_t)&v75 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BDEB580];
  sub_23DE4CF6C(0, &qword_256D0CCF8, (uint64_t (*)(uint64_t))MEMORY[0x24BDED930], MEMORY[0x24BDEB580]);
  MEMORY[0x24BDAC7A8](v10);
  v77 = (uint64_t *)((char *)&v75 - v11);
  v86 = type metadata accessor for MedicationsWidgetInlineView();
  MEMORY[0x24BDAC7A8](v86);
  v75 = (char *)&v75 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23DE51508(0, &qword_25432B018, v2);
  v89 = v13;
  MEMORY[0x24BDAC7A8](v13);
  v91 = (uint64_t)&v75 - v14;
  sub_23DE50A74(0, &qword_25432AFF0, v2);
  v84 = v15;
  MEMORY[0x24BDAC7A8](v15);
  v85 = (uint64_t)&v75 - v16;
  sub_23DE50A74(0, &qword_25432B030, v5);
  v90 = v17;
  MEMORY[0x24BDAC7A8](v17);
  v87 = (char *)&v75 - v18;
  v19 = sub_23DE66740();
  v82 = *(_QWORD *)(v19 - 8);
  v83 = v19;
  MEMORY[0x24BDAC7A8](v19);
  v21 = (char *)&v75 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23DE4CF6C(0, &qword_25432AF80, (uint64_t (*)(uint64_t))MEMORY[0x24BDFADE0], v9);
  MEMORY[0x24BDAC7A8](v22);
  v24 = (uint64_t *)((char *)&v75 - v23);
  v25 = (uint64_t (*)(uint64_t))MEMORY[0x24BDFAF10];
  sub_23DE4CF6C(0, &qword_25432AF88, (uint64_t (*)(uint64_t))MEMORY[0x24BDFAF10], v9);
  MEMORY[0x24BDAC7A8](v26);
  v28 = (uint64_t *)((char *)&v75 - v27);
  v29 = type metadata accessor for MedicationsWidgetViewModel();
  MEMORY[0x24BDAC7A8](v29);
  v88 = (uint64_t)&v75 - ((v30 + 15) & 0xFFFFFFFFFFFFFFF0);
  v31 = (int *)type metadata accessor for MedicationsWidgetCircularView(0);
  MEMORY[0x24BDAC7A8](v31);
  v33 = (char *)&v75 - ((v32 + 15) & 0xFFFFFFFFFFFFFFF0);
  v34 = sub_23DE66CD4();
  v35 = *(_QWORD *)(v34 - 8);
  MEMORY[0x24BDAC7A8](v34);
  v37 = (char *)&v75 - ((v36 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23DE50C9C(&qword_25432AB30, v25, 0x6146746567646957, 0xEC000000796C696DLL, (uint64_t)v37);
  v38 = (*(uint64_t (**)(char *, uint64_t))(v35 + 88))(v37, v34);
  if (MEMORY[0x24BDFAEE8] && v38 == *MEMORY[0x24BDFAEE8] || v38 == *MEMORY[0x24BDFAF00])
  {
    v56 = v1 + *(int *)(type metadata accessor for MedicationsWidgetEntryView() + 20);
    v57 = type metadata accessor for MedicationsWidgetEntry();
    v58 = v88;
    sub_23DE51318(v56 + *(int *)(v57 + 20), v88, (uint64_t (*)(_QWORD))type metadata accessor for MedicationsWidgetViewModel);
    *v28 = swift_getKeyPath();
    v59 = (uint64_t (*)(uint64_t))MEMORY[0x24BDFAF10];
    v60 = (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BDEB560];
    sub_23DE4CF6C(0, &qword_25432AB30, (uint64_t (*)(uint64_t))MEMORY[0x24BDFAF10], MEMORY[0x24BDEB560]);
    swift_storeEnumTagMultiPayload();
    *v24 = swift_getKeyPath();
    v61 = (uint64_t (*)(uint64_t))MEMORY[0x24BDFADE0];
    sub_23DE4CF6C(0, &qword_25432AF78, (uint64_t (*)(uint64_t))MEMORY[0x24BDFADE0], v60);
    swift_storeEnumTagMultiPayload();
    sub_23DE6671C();
    LOBYTE(v60) = sub_23DE4D468((uint64_t)v21);
    (*(void (**)(char *, uint64_t))(v82 + 8))(v21, v83);
    sub_23DE5127C((uint64_t)v28, (uint64_t)v33, &qword_25432AF88, v59);
    sub_23DE5127C((uint64_t)v24, (uint64_t)&v33[v31[5]], &qword_25432AF80, v61);
    sub_23DE512D4(v58, (uint64_t)&v33[v31[6]]);
    v33[v31[7]] = (char)v60;
    v52 = type metadata accessor for MedicationsWidgetCircularView;
    sub_23DE51318((uint64_t)v33, v85, type metadata accessor for MedicationsWidgetCircularView);
    swift_storeEnumTagMultiPayload();
    sub_23DE4CD44(&qword_25432AEC0, type metadata accessor for MedicationsWidgetCircularView, (uint64_t)&unk_23DE67A28);
    sub_23DE4CD44(&qword_25432AEA8, (uint64_t (*)(uint64_t))type metadata accessor for MedicationsWidgetInlineView, (uint64_t)&unk_23DE67DDC);
    v62 = (uint64_t)v87;
    sub_23DE66A70();
    sub_23DE5135C(v62, v91, (uint64_t)&qword_25432B030, (uint64_t (*)(_QWORD, uint64_t, _QWORD))sub_23DE50A74);
    swift_storeEnumTagMultiPayload();
    sub_23DE50B0C();
    sub_23DE50BB4();
    sub_23DE66A70();
    sub_23DE513B0(v62, (uint64_t)&qword_25432B030, (uint64_t (*)(_QWORD, uint64_t, _QWORD))sub_23DE50A74);
    v63 = (uint64_t)v33;
  }
  else
  {
    if (v38 == *MEMORY[0x24BDFAF08])
    {
      v39 = v1 + *(int *)(type metadata accessor for MedicationsWidgetEntryView() + 20);
      v40 = type metadata accessor for MedicationsWidgetEntry();
      v41 = v88;
      sub_23DE51318(v39 + *(int *)(v40 + 20), v88, (uint64_t (*)(_QWORD))type metadata accessor for MedicationsWidgetViewModel);
      KeyPath = swift_getKeyPath();
      v43 = (uint64_t)v77;
      *v77 = KeyPath;
      v44 = (uint64_t (*)(uint64_t))MEMORY[0x24BDED930];
      v45 = (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BDEB560];
      sub_23DE4CF6C(0, &qword_256D0CD00, (uint64_t (*)(uint64_t))MEMORY[0x24BDED930], MEMORY[0x24BDEB560]);
      swift_storeEnumTagMultiPayload();
      *v28 = swift_getKeyPath();
      v46 = (uint64_t (*)(uint64_t))MEMORY[0x24BDFAF10];
      sub_23DE4CF6C(0, &qword_25432AB30, (uint64_t (*)(uint64_t))MEMORY[0x24BDFAF10], v45);
      swift_storeEnumTagMultiPayload();
      *v24 = swift_getKeyPath();
      v47 = (uint64_t (*)(uint64_t))MEMORY[0x24BDFADE0];
      sub_23DE4CF6C(0, &qword_25432AF78, (uint64_t (*)(uint64_t))MEMORY[0x24BDFADE0], v45);
      swift_storeEnumTagMultiPayload();
      v48 = swift_getKeyPath();
      v49 = v76;
      sub_23DE5127C(v43, v76, &qword_256D0CCF8, v44);
      v50 = (int *)v78;
      sub_23DE5127C((uint64_t)v28, v49 + *(int *)(v78 + 20), &qword_25432AF88, v46);
      sub_23DE5127C((uint64_t)v24, v49 + v50[6], &qword_25432AF80, v47);
      v51 = v49 + v50[7];
      *(_QWORD *)v51 = v48;
      *(_BYTE *)(v51 + 8) = 0;
      sub_23DE512D4(v41, v49 + v50[8]);
      v52 = (uint64_t (*)(_QWORD))type metadata accessor for MedicationsWidgetRectangularView;
      sub_23DE51318(v49, v80, (uint64_t (*)(_QWORD))type metadata accessor for MedicationsWidgetRectangularView);
      swift_storeEnumTagMultiPayload();
      sub_23DE4CD44(&qword_25432AED8, (uint64_t (*)(uint64_t))type metadata accessor for MedicationsWidgetRectangularView, (uint64_t)&unk_23DE67CC0);
      v53 = (uint64_t)v81;
      sub_23DE66A70();
      v54 = &qword_25432B040;
      v55 = sub_23DE50A14;
      sub_23DE5135C(v53, v91, (uint64_t)&qword_25432B040, (uint64_t (*)(_QWORD, uint64_t, _QWORD))sub_23DE50A14);
    }
    else
    {
      if (v38 != *MEMORY[0x24BDFAEF0])
      {
        swift_storeEnumTagMultiPayload();
        sub_23DE4CD44(&qword_25432AED8, (uint64_t (*)(uint64_t))type metadata accessor for MedicationsWidgetRectangularView, (uint64_t)&unk_23DE67CC0);
        v74 = (uint64_t)v81;
        sub_23DE66A70();
        sub_23DE5135C(v74, v91, (uint64_t)&qword_25432B040, (uint64_t (*)(_QWORD, uint64_t, _QWORD))sub_23DE50A14);
        swift_storeEnumTagMultiPayload();
        sub_23DE50B0C();
        sub_23DE50BB4();
        sub_23DE66A70();
        sub_23DE513B0(v74, (uint64_t)&qword_25432B040, (uint64_t (*)(_QWORD, uint64_t, _QWORD))sub_23DE50A14);
        return (*(uint64_t (**)(char *, uint64_t))(v35 + 8))(v37, v34);
      }
      v64 = v1 + *(int *)(type metadata accessor for MedicationsWidgetEntryView() + 20);
      v65 = type metadata accessor for MedicationsWidgetEntry();
      v66 = v88;
      sub_23DE51318(v64 + *(int *)(v65 + 20), v88, (uint64_t (*)(_QWORD))type metadata accessor for MedicationsWidgetViewModel);
      v67 = swift_getKeyPath();
      v68 = (uint64_t)v77;
      *v77 = v67;
      v69 = (uint64_t (*)(uint64_t))MEMORY[0x24BDED930];
      v70 = (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BDEB560];
      sub_23DE4CF6C(0, &qword_256D0CD00, (uint64_t (*)(uint64_t))MEMORY[0x24BDED930], MEMORY[0x24BDEB560]);
      swift_storeEnumTagMultiPayload();
      v71 = swift_getKeyPath();
      v72 = v86;
      v49 = (uint64_t)v75;
      *(_QWORD *)&v75[*(int *)(v86 + 20)] = v71;
      sub_23DE4CF6C(0, &qword_25432AB30, (uint64_t (*)(uint64_t))MEMORY[0x24BDFAF10], v70);
      swift_storeEnumTagMultiPayload();
      sub_23DE5127C(v68, v49, &qword_256D0CCF8, v69);
      sub_23DE512D4(v66, v49 + *(int *)(v72 + 24));
      v52 = (uint64_t (*)(_QWORD))type metadata accessor for MedicationsWidgetInlineView;
      sub_23DE51318(v49, v85, (uint64_t (*)(_QWORD))type metadata accessor for MedicationsWidgetInlineView);
      swift_storeEnumTagMultiPayload();
      sub_23DE4CD44(&qword_25432AEC0, type metadata accessor for MedicationsWidgetCircularView, (uint64_t)&unk_23DE67A28);
      sub_23DE4CD44(&qword_25432AEA8, (uint64_t (*)(uint64_t))type metadata accessor for MedicationsWidgetInlineView, (uint64_t)&unk_23DE67DDC);
      v53 = (uint64_t)v87;
      sub_23DE66A70();
      v54 = &qword_25432B030;
      v55 = sub_23DE50A74;
      sub_23DE5135C(v53, v91, (uint64_t)&qword_25432B030, (uint64_t (*)(_QWORD, uint64_t, _QWORD))sub_23DE50A74);
    }
    swift_storeEnumTagMultiPayload();
    sub_23DE50B0C();
    sub_23DE50BB4();
    sub_23DE66A70();
    sub_23DE513B0(v53, (uint64_t)v54, (uint64_t (*)(_QWORD, uint64_t, _QWORD))v55);
    v63 = v49;
  }
  return sub_23DE513F8(v63, v52);
}

uint64_t sub_23DE509F8()
{
  return sub_23DE66B90();
}

void sub_23DE50A14(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t, uint64_t, _QWORD))
{
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;

  if (!*a2)
  {
    v6 = type metadata accessor for MedicationsWidgetRectangularView();
    v7 = a3(a1, v6, MEMORY[0x24BDF5158]);
    if (!v8)
      atomic_store(v7, a2);
  }
}

void sub_23DE50A74(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t, uint64_t, uint64_t))
{
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;

  if (!*a2)
  {
    v6 = type metadata accessor for MedicationsWidgetCircularView(255);
    v7 = type metadata accessor for MedicationsWidgetInlineView();
    v8 = a3(a1, v6, v7);
    if (!v9)
      atomic_store(v8, a2);
  }
}

uint64_t sub_23DE50ADC@<X0>(uint64_t a1@<X8>)
{
  return sub_23DE50C9C(&qword_25432AB30, (uint64_t (*)(uint64_t))MEMORY[0x24BDFAF10], 0x6146746567646957, 0xEC000000796C696DLL, a1);
}

unint64_t sub_23DE50B0C()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;
  _QWORD v3[2];

  result = qword_25432B028;
  if (!qword_25432B028)
  {
    sub_23DE50A74(255, &qword_25432B030, MEMORY[0x24BDEF3B8]);
    v2 = v1;
    v3[0] = sub_23DE4CD44(&qword_25432AEC0, type metadata accessor for MedicationsWidgetCircularView, (uint64_t)&unk_23DE67A28);
    v3[1] = sub_23DE4CD44(&qword_25432AEA8, (uint64_t (*)(uint64_t))type metadata accessor for MedicationsWidgetInlineView, (uint64_t)&unk_23DE67DDC);
    result = MEMORY[0x2426465BC](MEMORY[0x24BDEF3E0], v2, v3);
    atomic_store(result, (unint64_t *)&qword_25432B028);
  }
  return result;
}

unint64_t sub_23DE50BB4()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;
  _QWORD v3[2];

  result = qword_25432B038;
  if (!qword_25432B038)
  {
    sub_23DE50A14(255, &qword_25432B040, MEMORY[0x24BDEF3B8]);
    v2 = v1;
    v3[0] = sub_23DE4CD44(&qword_25432AED8, (uint64_t (*)(uint64_t))type metadata accessor for MedicationsWidgetRectangularView, (uint64_t)&unk_23DE67CC0);
    v3[1] = MEMORY[0x24BDF5138];
    result = MEMORY[0x2426465BC](MEMORY[0x24BDEF3E0], v2, v3);
    atomic_store(result, (unint64_t *)&qword_25432B038);
  }
  return result;
}

uint64_t sub_23DE50C44@<X0>(uint64_t a1@<X8>)
{
  return sub_23DE50C9C(&qword_256D0CD00, (uint64_t (*)(uint64_t))MEMORY[0x24BDED930], 0xD000000000000010, 0x800000023DE67F40, a1);
}

uint64_t sub_23DE50C70@<X0>(uint64_t a1@<X8>)
{
  return sub_23DE50C9C(&qword_25432AF78, (uint64_t (*)(uint64_t))MEMORY[0x24BDFADE0], 0xD000000000000013, 0x800000023DE67F60, a1);
}

uint64_t sub_23DE50C9C@<X0>(unint64_t *a1@<X0>, uint64_t (*a2)(uint64_t)@<X1>, uint64_t a3@<X2>, unint64_t a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t v5;
  uint64_t v9;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  os_log_type_t v20;
  NSObject *v21;
  uint64_t v22;
  uint8_t *v23;
  uint64_t v24;
  uint64_t v25;
  unint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;

  v28 = a3;
  v9 = v5;
  v11 = sub_23DE669BC();
  v12 = *(_QWORD *)(v11 - 8);
  MEMORY[0x24BDAC7A8](v11);
  v14 = (char *)&v25 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23DE4CF6C(0, a1, a2, MEMORY[0x24BDEB560]);
  MEMORY[0x24BDAC7A8](v15);
  v17 = (char *)&v25 - v16;
  sub_23DE51434(v9, (uint64_t)&v25 - v16, a1, a2);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v18 = a2(0);
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(*(_QWORD *)(v18 - 8) + 32))(a5, v17, v18);
  }
  else
  {
    v20 = sub_23DE66E48();
    v21 = sub_23DE66AAC();
    if (os_log_type_enabled(v21, v20))
    {
      v26 = a4;
      v22 = swift_slowAlloc();
      v27 = a5;
      v23 = (uint8_t *)v22;
      v24 = swift_slowAlloc();
      v30 = v24;
      *(_DWORD *)v23 = 136315138;
      v29 = sub_23DE54DF0(v28, v26, &v30);
      sub_23DE66EB4();
      _os_log_impl(&dword_23DE49000, v21, v20, "Accessing Environment<%s>'s value outside of being installed on a View. This will always read the default value and will not update.", v23, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x24264664C](v24, -1, -1);
      MEMORY[0x24264664C](v23, -1, -1);
    }

    sub_23DE669B0();
    swift_getAtKeyPath();
    swift_release();
    return (*(uint64_t (**)(char *, uint64_t))(v12 + 8))(v14, v11);
  }
}

uint64_t sub_23DE50EE4(uint64_t a1, char a2)
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

  v4 = sub_23DE669BC();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if ((a2 & 1) != 0)
    return a1 & 1;
  swift_retain();
  v8 = sub_23DE66E48();
  v9 = sub_23DE66AAC();
  v10 = v8;
  if (os_log_type_enabled(v9, v8))
  {
    v11 = (uint8_t *)swift_slowAlloc();
    v12 = swift_slowAlloc();
    v15 = v12;
    *(_DWORD *)v11 = 136315138;
    v14 = sub_23DE54DF0(1819242306, 0xE400000000000000, &v15);
    sub_23DE66EB4();
    _os_log_impl(&dword_23DE49000, v9, v10, "Accessing Environment<%s>'s value outside of being installed on a View. This will always read the default value and will not update.", v11, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x24264664C](v12, -1, -1);
    MEMORY[0x24264664C](v11, -1, -1);
  }

  sub_23DE669B0();
  swift_getAtKeyPath();
  sub_23DE51598(a1, 0);
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  return v15;
}

uint64_t sub_23DE5109C()
{
  return sub_23DE66950();
}

uint64_t sub_23DE510BC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void (*a5)(_QWORD), uint64_t (*a6)(char *))
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

uint64_t sub_23DE51138(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_23DE510BC(a1, a2, a3, a4, (void (*)(_QWORD))MEMORY[0x24BDED930], MEMORY[0x24BDEE0E0]);
}

uint64_t sub_23DE51160()
{
  return sub_23DE6698C();
}

uint64_t sub_23DE51180(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_23DE510BC(a1, a2, a3, a4, (void (*)(_QWORD))MEMORY[0x24BDFADE0], MEMORY[0x24BDFAB68]);
}

uint64_t sub_23DE511A4()
{
  unsigned __int8 v1;

  sub_23DE66974();
  sub_23DE4CD44(&qword_256D0CD08, (uint64_t (*)(uint64_t))MEMORY[0x24BDFAAC0], MEMORY[0x24BDFAAB8]);
  sub_23DE669C8();
  return v1;
}

uint64_t sub_23DE51204@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;
  char v3;

  sub_23DE66974();
  sub_23DE4CD44(&qword_256D0CD08, (uint64_t (*)(uint64_t))MEMORY[0x24BDFAAC0], MEMORY[0x24BDFAAB8]);
  result = sub_23DE669C8();
  *a1 = v3;
  return result;
}

uint64_t sub_23DE5127C(uint64_t a1, uint64_t a2, unint64_t *a3, uint64_t (*a4)(uint64_t))
{
  uint64_t v6;

  sub_23DE4CF6C(0, a3, a4, MEMORY[0x24BDEB580]);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 32))(a2, a1, v6);
  return a2;
}

uint64_t sub_23DE512D4(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for MedicationsWidgetViewModel();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_23DE51318(uint64_t a1, uint64_t a2, uint64_t (*a3)(_QWORD))
{
  uint64_t v5;

  v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_23DE5135C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(_QWORD, uint64_t, _QWORD))
{
  uint64_t v6;

  v6 = a4(0, a3, MEMORY[0x24BDEF3B8]);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(a2, a1, v6);
  return a2;
}

uint64_t sub_23DE513B0(uint64_t a1, uint64_t a2, uint64_t (*a3)(_QWORD, uint64_t, _QWORD))
{
  uint64_t v4;

  v4 = a3(0, a2, MEMORY[0x24BDEF3B8]);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(a1, v4);
  return a1;
}

uint64_t sub_23DE513F8(uint64_t a1, uint64_t (*a2)(_QWORD))
{
  uint64_t v3;

  v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_23DE51434(uint64_t a1, uint64_t a2, unint64_t *a3, uint64_t (*a4)(uint64_t))
{
  uint64_t v6;

  sub_23DE4CF6C(0, a3, a4, MEMORY[0x24BDEB560]);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(a2, a1, v6);
  return a2;
}

unint64_t sub_23DE51490()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;
  _QWORD v3[2];

  result = qword_25432B070;
  if (!qword_25432B070)
  {
    sub_23DE51508(255, &qword_25432B078, MEMORY[0x24BDEF3B8]);
    v2 = v1;
    v3[0] = sub_23DE50B0C();
    v3[1] = sub_23DE50BB4();
    result = MEMORY[0x2426465BC](MEMORY[0x24BDEF3E0], v2, v3);
    atomic_store(result, (unint64_t *)&qword_25432B070);
  }
  return result;
}

void sub_23DE51508(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t, uint64_t, uint64_t))
{
  uint64_t (*v6)(uint64_t, uint64_t, _QWORD);
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;

  if (!*a2)
  {
    v6 = (uint64_t (*)(uint64_t, uint64_t, _QWORD))MEMORY[0x24BDEF3B8];
    sub_23DE50A74(255, &qword_25432B030, MEMORY[0x24BDEF3B8]);
    v8 = v7;
    sub_23DE50A14(255, &qword_25432B040, v6);
    v10 = a3(a1, v8, v9);
    if (!v11)
      atomic_store(v10, a2);
  }
}

uint64_t sub_23DE51598(uint64_t a1, char a2)
{
  uint64_t result;

  if ((a2 & 1) == 0)
    return swift_release();
  return result;
}

uint64_t sub_23DE515AC()
{
  return swift_getOpaqueTypeConformance2();
}

ValueMetadata *type metadata accessor for MedicationsWidget()
{
  return &type metadata for MedicationsWidget;
}

unint64_t sub_23DE515D4()
{
  unint64_t result;

  result = qword_25432A778;
  if (!qword_25432A778)
  {
    result = MEMORY[0x2426465BC](&unk_23DE67500, &type metadata for MedicationsWidgetConfiguration);
    atomic_store(result, (unint64_t *)&qword_25432A778);
  }
  return result;
}

uint64_t sub_23DE51618(char a1)
{
  return *(_QWORD *)&aNoneschepastdu[8 * a1];
}

uint64_t sub_23DE51638(char *a1, char *a2)
{
  return sub_23DE598C0(*a1, *a2);
}

uint64_t sub_23DE51644()
{
  return sub_23DE5164C();
}

uint64_t sub_23DE5164C()
{
  sub_23DE67010();
  sub_23DE66DAC();
  swift_bridgeObjectRelease();
  return sub_23DE67028();
}

uint64_t sub_23DE516B4()
{
  return sub_23DE516BC();
}

uint64_t sub_23DE516BC()
{
  sub_23DE66DAC();
  return swift_bridgeObjectRelease();
}

uint64_t sub_23DE516FC()
{
  return sub_23DE51704();
}

uint64_t sub_23DE51704()
{
  sub_23DE67010();
  sub_23DE66DAC();
  swift_bridgeObjectRelease();
  return sub_23DE67028();
}

uint64_t sub_23DE51768@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = sub_23DE58134();
  *a1 = result;
  return result;
}

uint64_t sub_23DE51794@<X0>(uint64_t *a1@<X8>)
{
  char *v1;
  uint64_t result;
  uint64_t v4;

  result = sub_23DE51618(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t sub_23DE517BC()
{
  return 1;
}

uint64_t sub_23DE517C4()
{
  sub_23DE67010();
  sub_23DE6701C();
  return sub_23DE67028();
}

uint64_t sub_23DE51804()
{
  return sub_23DE6701C();
}

uint64_t sub_23DE51828()
{
  sub_23DE67010();
  sub_23DE6701C();
  return sub_23DE67028();
}

id sub_23DE51874()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v14;

  v1 = v0;
  v2 = sub_23DE66740();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v14 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = OBJC_IVAR____TtC25HealthMedicationsWidgetUI34MedicationsWidgetTimelineGenerator____lazy_storage___dateFormatter;
  v7 = *(void **)(v1
                + OBJC_IVAR____TtC25HealthMedicationsWidgetUI34MedicationsWidgetTimelineGenerator____lazy_storage___dateFormatter);
  if (v7)
  {
    v8 = *(id *)(v1
               + OBJC_IVAR____TtC25HealthMedicationsWidgetUI34MedicationsWidgetTimelineGenerator____lazy_storage___dateFormatter);
  }
  else
  {
    v9 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDD1500]), sel_init);
    objc_msgSend(v9, sel_setDateStyle_, 0);
    objc_msgSend(v9, sel_setTimeStyle_, 1);
    sub_23DE6671C();
    v10 = (void *)sub_23DE66704();
    (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
    objc_msgSend(v9, sel_setLocale_, v10);

    v11 = *(void **)(v1 + v6);
    *(_QWORD *)(v1 + v6) = v9;
    v8 = v9;

    v7 = 0;
  }
  v12 = v7;
  return v8;
}

uint64_t sub_23DE51994(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t *v4;
  void (*v5)(uint64_t, char *, uint64_t);
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
  char *v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  id v31;
  id v32;
  char *v33;
  id v34;
  uint64_t v35;
  uint64_t v36;
  id v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  char *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  unint64_t v45;
  uint64_t v46;
  _QWORD *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  unint64_t v52;
  unint64_t v53;
  unint64_t v54;
  uint64_t v55;
  void *v56;
  _QWORD *v57;
  uint64_t v58;
  id v59;
  uint64_t v60;
  char *v61;
  uint64_t v63;
  char *v64;
  uint64_t v65;
  char *v66;
  uint64_t v67;
  uint64_t v68;
  void (*v69)(char *, uint64_t);
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  void (*v76)(uint64_t, char *, uint64_t);
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  char *v80;
  uint64_t v81;
  char *v82;
  uint64_t v83;
  uint64_t v84;
  char *v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  id v89;

  v86 = a4;
  v87 = a3;
  v84 = a2;
  v81 = a1;
  v88 = *v4;
  v83 = sub_23DE66CD4();
  v5 = *(void (**)(uint64_t, char *, uint64_t))(*(_QWORD *)(v83 - 8) + 64);
  v75 = *(_QWORD *)(v83 - 8);
  v76 = v5;
  MEMORY[0x24BDAC7A8](v83);
  v82 = (char *)&v63 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23DE4CF6C(0, &qword_25432B1A0, (uint64_t (*)(uint64_t))MEMORY[0x24BEE56F0], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1C68]);
  MEMORY[0x24BDAC7A8](v7);
  v66 = (char *)&v63 - v8;
  v74 = sub_23DE66E84();
  v72 = *(_QWORD *)(v74 - 8);
  MEMORY[0x24BDAC7A8](v74);
  v64 = (char *)&v63 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23DE4CF6C(0, &qword_25432AF70, MEMORY[0x24BE45F28], MEMORY[0x24BDB9ED8]);
  v11 = v10;
  v12 = *(_QWORD *)(v10 - 8);
  MEMORY[0x24BDAC7A8](v10);
  v14 = (char *)&v63 - v13;
  sub_23DE5763C();
  v16 = v15;
  v17 = *(_QWORD *)(v15 - 8);
  MEMORY[0x24BDAC7A8](v15);
  v19 = (char *)&v63 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23DE57714();
  v65 = v20;
  v67 = *(_QWORD *)(v20 - 8);
  MEMORY[0x24BDAC7A8](v20);
  v22 = (char *)&v63 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23DE577C8();
  v24 = *(_QWORD *)(v23 - 8);
  v77 = v23;
  v78 = v24;
  MEMORY[0x24BDAC7A8](v23);
  v85 = (char *)&v63 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
  v26 = sub_23DE666F8();
  v27 = *(_QWORD *)(v26 - 8);
  v68 = v26;
  v73 = *(_QWORD *)(v27 + 64);
  v71 = v27;
  MEMORY[0x24BDAC7A8](v26);
  v29 = (void *)v4[2];
  v69 = *(void (**)(char *, uint64_t))(v30 + 16);
  v80 = (char *)&v63 - ((v28 + 15) & 0xFFFFFFFFFFFFFFF0);
  v69(v80, v81);
  v31 = objc_allocWithZone((Class)sub_23DE6683C());
  v32 = v29;
  v70 = sub_23DE66830();
  sub_23DE66824();
  sub_23DE576B4();
  sub_23DE668C0();
  (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v11);
  sub_23DE57C58(0, &qword_25432B1F0);
  sub_23DE4CD44(&qword_25432AF38, (uint64_t (*)(uint64_t))sub_23DE5763C, MEMORY[0x24BDB94E0]);
  sub_23DE668D8();
  (*(void (**)(char *, uint64_t))(v17 + 8))(v19, v16);
  v33 = v64;
  sub_23DE66E78();
  v89 = *(id *)(v79 + OBJC_IVAR____TtC25HealthMedicationsWidgetUI34MedicationsWidgetTimelineGenerator_queue);
  v34 = v89;
  v35 = sub_23DE66E6C();
  v36 = (uint64_t)v66;
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v35 - 8) + 56))(v66, 1, 1, v35);
  *(_QWORD *)(swift_allocObject() + 16) = v88;
  sub_23DE54B78();
  sub_23DE4CD44(&qword_25432AF48, (uint64_t (*)(uint64_t))sub_23DE57714, MEMORY[0x24BDB95F8]);
  sub_23DE4CD44(&qword_25432B1A8, (uint64_t (*)(uint64_t))sub_23DE54B78, MEMORY[0x24BEE5670]);
  v37 = v34;
  v38 = v65;
  sub_23DE668CC();
  swift_release();
  sub_23DE57B74(v36, &qword_25432B1A0, (uint64_t (*)(uint64_t))MEMORY[0x24BEE56F0]);

  (*(void (**)(char *, uint64_t))(v72 + 8))(v33, v74);
  (*(void (**)(char *, uint64_t))(v67 + 8))(v22, v38);
  v39 = swift_allocObject();
  swift_weakInit();
  v40 = v75;
  v72 = *(_QWORD *)(v75 + 16);
  v41 = v82;
  v42 = v83;
  ((void (*)(char *, uint64_t, uint64_t))v72)(v82, v84, v83);
  v43 = *(unsigned __int8 *)(v40 + 80);
  v44 = (v43 + 24) & ~v43;
  v67 = v43 | 7;
  v74 = (uint64_t)v76 + 7;
  v45 = ((unint64_t)v76 + v44 + 7) & 0xFFFFFFFFFFFFFFF8;
  v46 = swift_allocObject();
  *(_QWORD *)(v46 + 16) = v39;
  v76 = *(void (**)(uint64_t, char *, uint64_t))(v40 + 32);
  v76(v46 + v44, v41, v42);
  v47 = (_QWORD *)(v46 + v45);
  v48 = v86;
  *v47 = v87;
  v47[1] = v48;
  *(_QWORD *)(v46 + ((v45 + 23) & 0xFFFFFFFFFFFFFFF8)) = v88;
  v49 = swift_allocObject();
  swift_weakInit();
  v50 = v68;
  ((void (*)(char *, uint64_t, uint64_t))v69)(v80, v81, v68);
  ((void (*)(char *, uint64_t, uint64_t))v72)(v41, v84, v42);
  v51 = v71;
  v52 = (*(unsigned __int8 *)(v71 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v71 + 80);
  v53 = (v73 + v43 + v52) & ~v43;
  v54 = (v74 + v53) & 0xFFFFFFFFFFFFFFF8;
  v55 = swift_allocObject();
  v56 = (void *)v70;
  *(_QWORD *)(v55 + 16) = v49;
  *(_QWORD *)(v55 + 24) = v56;
  (*(void (**)(unint64_t, char *, uint64_t))(v51 + 32))(v55 + v52, v80, v50);
  v76(v55 + v53, v82, v83);
  v57 = (_QWORD *)(v55 + v54);
  v58 = v86;
  *v57 = v87;
  v57[1] = v58;
  *(_QWORD *)(v55 + ((v54 + 23) & 0xFFFFFFFFFFFFFFF8)) = v88;
  sub_23DE4CD44(&qword_25432AF58, (uint64_t (*)(uint64_t))sub_23DE577C8, MEMORY[0x24BDB9908]);
  swift_retain_n();
  v59 = v56;
  v60 = v77;
  v61 = v85;
  sub_23DE668B4();
  swift_release();
  swift_release();
  (*(void (**)(char *, uint64_t))(v78 + 8))(v61, v60);
  swift_beginAccess();
  sub_23DE668A8();
  swift_endAccess();

  return swift_release();
}

uint64_t sub_23DE520DC()
{
  return sub_23DE66800() & 1;
}

uint64_t sub_23DE52100(uint64_t *a1, uint64_t a2, uint64_t a3, void (*a4)(_QWORD), uint64_t a5, uint64_t a6)
{
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
  uint64_t v19;
  char *v20;
  uint64_t v21;
  char *v22;
  uint64_t v23;
  uint64_t result;
  uint64_t v25;
  NSObject *v26;
  os_log_type_t v27;
  uint64_t v28;
  uint8_t *v29;
  uint64_t v30;
  uint64_t v31;
  unint64_t v32;
  uint8_t *v33;
  uint64_t inited;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  NSObject *v39;
  uint64_t v40;
  uint8_t *v41;
  uint64_t v42;
  uint64_t v43;
  unint64_t v44;
  uint8_t *v45;
  void (*v46)(_QWORD);
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

  v48 = a6;
  v51 = a3;
  v52 = a5;
  sub_23DE4CF6C(0, &qword_25432A770, (uint64_t (*)(uint64_t))MEMORY[0x24BDCE900], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1C68]);
  MEMORY[0x24BDAC7A8](v8);
  v10 = (char *)&v45 - v9;
  v11 = sub_23DE666F8();
  v49 = *(_QWORD *)(v11 - 8);
  v50 = v11;
  MEMORY[0x24BDAC7A8](v11);
  v13 = (char *)&v45 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = type metadata accessor for MedicationsWidgetEntry();
  MEMORY[0x24BDAC7A8](v14);
  v16 = (char *)&v45 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17 = sub_23DE66878();
  v53 = *(_QWORD *)(v17 - 8);
  v54 = v17;
  v18 = MEMORY[0x24BDAC7A8](v17);
  v20 = (char *)&v45 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v18);
  v22 = (char *)&v45 - v21;
  v23 = *a1;
  swift_beginAccess();
  result = swift_weakLoadStrong();
  if (result)
  {
    v25 = result;
    if (v23)
    {
      sub_23DE66860();
      v26 = sub_23DE6686C();
      v27 = sub_23DE66E3C();
      if (os_log_type_enabled(v26, v27))
      {
        v47 = v25;
        v28 = swift_slowAlloc();
        v46 = a4;
        v29 = (uint8_t *)v28;
        v30 = swift_slowAlloc();
        v56 = v30;
        *(_DWORD *)v29 = 136446210;
        v45 = v29 + 4;
        v31 = sub_23DE67034();
        v55 = sub_23DE54DF0(v31, v32, &v56);
        sub_23DE66EB4();
        swift_bridgeObjectRelease();
        _os_log_impl(&dword_23DE49000, v26, v27, "[%{public}s] Timed out waiting for medication summary", v29, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x24264664C](v30, -1, -1);
        v33 = v29;
        a4 = v46;
        MEMORY[0x24264664C](v33, -1, -1);
      }

      (*(void (**)(char *, uint64_t))(v53 + 8))(v22, v54);
      sub_23DE666EC();
      sub_23DE575F8(0, (unint64_t *)&qword_25432B1D8);
      inited = swift_initStackObject();
      *(_OWORD *)(inited + 16) = xmmword_23DE67420;
      if (qword_25432AB88 != -1)
        swift_once();
      *(_QWORD *)(inited + 32) = sub_23DE665E4();
      *(_QWORD *)(inited + 40) = v35;
      *(_QWORD *)(inited + 48) = sub_23DE665E4();
      *(_QWORD *)(inited + 56) = v36;
      v38 = v49;
      v37 = v50;
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v49 + 56))(v10, 1, 1, v50);
      sub_23DE53C50((uint64_t)v13, inited, v51, 3, 0, (uint64_t)v10, (uint64_t)v16);
      swift_bridgeObjectRelease();
      sub_23DE57B74((uint64_t)v10, &qword_25432A770, (uint64_t (*)(uint64_t))MEMORY[0x24BDCE900]);
      (*(void (**)(char *, uint64_t))(v38 + 8))(v13, v37);
      a4(v16);
      swift_release();
      return sub_23DE57BB8((uint64_t)v16);
    }
    else
    {
      sub_23DE66860();
      v39 = sub_23DE6686C();
      v40 = sub_23DE66E54();
      if (os_log_type_enabled(v39, (os_log_type_t)v40))
      {
        v41 = (uint8_t *)swift_slowAlloc();
        v42 = swift_slowAlloc();
        v56 = v42;
        *(_DWORD *)v41 = 136446210;
        v43 = sub_23DE67034();
        v55 = sub_23DE54DF0(v43, v44, &v56);
        sub_23DE66EB4();
        swift_bridgeObjectRelease();
        _os_log_impl(&dword_23DE49000, v39, (os_log_type_t)v40, "[%{public}s] Finished fetching medication day summary", v41, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x24264664C](v42, -1, -1);
        MEMORY[0x24264664C](v41, -1, -1);
      }

      swift_release();
      return (*(uint64_t (**)(char *, uint64_t))(v53 + 8))(v20, v54);
    }
  }
  return result;
}

uint64_t sub_23DE52650(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5, void (*a6)(uint64_t), uint64_t a7, uint64_t a8)
{
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
  char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  char *v30;
  uint64_t v31;
  char *v32;
  uint64_t result;
  unint64_t v34;
  id v35;
  NSObject *v36;
  os_log_type_t v37;
  _BOOL4 v38;
  uint64_t v39;
  uint64_t v40;
  unint64_t v41;
  id v42;
  id v43;
  uint64_t v44;
  unint64_t v45;
  unint64_t v46;
  unint64_t v47;
  uint64_t v48;
  unint64_t v49;
  unint64_t v50;
  unint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t i;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  double v59;
  char *v60;
  void (*v61)(char *, uint64_t);
  double v62;
  double v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  id v67;
  void *v68;
  uint64_t v69;
  void *v70;
  id v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  char *v75;
  id v76;
  void *v77;
  id v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  unint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  unint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  char *v92;
  id v93;
  void *v94;
  id v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  char *v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  unint64_t v110;
  void *v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  id v115;
  void *v116;
  char *v117;
  void *v118;
  id v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  id v123;
  void *v124;
  id v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t v128;
  unint64_t v129;
  uint64_t v130;
  uint64_t v131;
  uint64_t v132;
  uint64_t v133;
  uint64_t v134;
  unint64_t v135;
  id v136;
  void *v137;
  void *v138;
  id v139;
  uint64_t v140;
  id v141;
  void *v142;
  id v143;
  uint64_t v144;
  uint64_t v145;
  uint64_t v146;
  uint64_t v147;
  uint64_t v148;
  uint64_t v149;
  uint64_t v150;
  char *v151;
  uint64_t v152;
  uint64_t v153;
  uint64_t v154;
  uint64_t v155;
  uint64_t inited;
  unint64_t v157;
  void *v158;
  uint64_t v159;
  uint64_t v160;
  uint64_t v161;
  uint64_t v162;
  void (*v163)(uint64_t, uint64_t);
  uint64_t v164;
  uint64_t v165;
  uint64_t v166;
  uint64_t v167;
  uint64_t v168;
  uint64_t v169;
  uint64_t v170;
  uint64_t v171;
  uint64_t v172;
  uint64_t v173;
  uint64_t v174;
  uint64_t v175;
  uint64_t v176;
  uint64_t v177;
  uint64_t v178;
  uint64_t v179;
  uint64_t v180;
  _QWORD v181[3];
  uint64_t v182;
  int v183;
  unint64_t v184;
  char *v185;
  uint64_t v186;
  uint64_t v187;
  char *v188;
  __int128 v189;
  char *v190;
  uint64_t v191;
  __int128 v192;
  uint64_t v193;
  void (*v194)(uint64_t);
  uint64_t v195;
  uint64_t v196;
  unint64_t v197;
  char *v198;
  uint64_t v199;
  uint64_t v200;
  uint64_t v201;
  uint64_t v202;
  unint64_t v203;
  uint64_t v204;
  unint64_t v205;
  unint64_t v206;
  uint64_t v207;

  *(_QWORD *)&v192 = a8;
  v193 = a4;
  v194 = a6;
  v200 = a1;
  sub_23DE4CF6C(0, &qword_25432A770, (uint64_t (*)(uint64_t))MEMORY[0x24BDCE900], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1C68]);
  MEMORY[0x24BDAC7A8](v11);
  v13 = (char *)v181 - v12;
  v201 = sub_23DE666F8();
  v199 = *(_QWORD *)(v201 - 8);
  v14 = MEMORY[0x24BDAC7A8](v201);
  *(_QWORD *)&v189 = (char *)v181 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = MEMORY[0x24BDAC7A8](v14);
  v188 = (char *)v181 - v17;
  v18 = MEMORY[0x24BDAC7A8](v16);
  v187 = (uint64_t)v181 - v19;
  v20 = MEMORY[0x24BDAC7A8](v18);
  v198 = (char *)v181 - v21;
  v22 = MEMORY[0x24BDAC7A8](v20);
  v24 = (char *)v181 - v23;
  MEMORY[0x24BDAC7A8](v22);
  v196 = (uint64_t)v181 - v25;
  v26 = type metadata accessor for MedicationsWidgetEntry();
  v27 = MEMORY[0x24BDAC7A8](v26);
  v186 = (uint64_t)v181 - ((v28 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v27);
  v30 = (char *)v181 - v29;
  v197 = sub_23DE66878();
  v195 = *(_QWORD *)(v197 - 8);
  MEMORY[0x24BDAC7A8](v197);
  v32 = (char *)v181 - ((v31 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_beginAccess();
  result = swift_weakLoadStrong();
  if (!result)
    return result;
  v34 = result;
  sub_23DE66860();
  v35 = a3;
  v36 = sub_23DE6686C();
  v37 = sub_23DE66E54();
  v183 = v37;
  v38 = os_log_type_enabled(v36, v37);
  v190 = v13;
  v191 = a7;
  v185 = v30;
  if (v38)
  {
    v39 = swift_slowAlloc();
    v182 = swift_slowAlloc();
    v206 = v182;
    *(_DWORD *)v39 = 136446466;
    v40 = sub_23DE67034();
    *(_QWORD *)&v192 = v36;
    v204 = sub_23DE54DF0(v40, v41, (uint64_t *)&v206);
    v181[2] = &v205;
    sub_23DE66EB4();
    swift_bridgeObjectRelease();
    *(_WORD *)(v39 + 12) = 2080;
    v181[1] = v39 + 14;
    v42 = v35;
    v43 = objc_msgSend(v42, sel_description);
    v44 = sub_23DE66D94();
    v45 = v34;
    v47 = v46;

    v204 = sub_23DE54DF0(v44, v47, (uint64_t *)&v206);
    sub_23DE66EB4();

    v34 = v45;
    swift_bridgeObjectRelease();
    v35 = (id)v192;
    _os_log_impl(&dword_23DE49000, (os_log_t)v192, (os_log_type_t)v183, "[%{public}s] Creating snapshot from provider: %s", (uint8_t *)v39, 0x16u);
    v48 = v182;
    swift_arrayDestroy();
    MEMORY[0x24264664C](v48, -1, -1);
    MEMORY[0x24264664C](v39, -1, -1);
  }
  else
  {

  }
  (*(void (**)(char *, unint64_t))(v195 + 8))(v32, v197);
  v206 = MEMORY[0x24BEE4AF8];
  v49 = sub_23DE667E8();
  sub_23DE54BB4(v49);
  v50 = sub_23DE667F4();
  sub_23DE54BB4(v50);
  sub_23DE54D6C(&v206);
  v51 = v206;
  v52 = v199;
  if (v206 >> 62)
  {
LABEL_41:
    swift_bridgeObjectRetain();
    v53 = sub_23DE66F80();
    swift_bridgeObjectRelease();
    if (v53)
      goto LABEL_7;
  }
  else
  {
    v53 = *(_QWORD *)((v206 & 0xFFFFFFFFFFFFF8) + 0x10);
    if (v53)
    {
LABEL_7:
      v184 = v34;
      v195 = a5;
      v200 = 0;
      v197 = v51 & 0xC000000000000001;
      for (i = 4; ; ++i)
      {
        v56 = i - 4;
        if (v197)
        {
          v57 = MEMORY[0x242646220](i - 4, v51);
          a5 = i - 3;
          if (__OFADD__(v56, 1))
            goto LABEL_40;
        }
        else
        {
          v57 = *(_QWORD *)(v51 + 8 * i);
          swift_retain();
          a5 = i - 3;
          if (__OFADD__(v56, 1))
          {
LABEL_40:
            __break(1u);
            goto LABEL_41;
          }
        }
        v34 = v51;
        v58 = v53;
        sub_23DE667AC();
        sub_23DE666E0();
        if (v59 < 0.0 && sub_23DE667B8() != 4 && sub_23DE667B8() != 5)
        {
          swift_bridgeObjectRelease();
          v115 = sub_23DE51874();
          v116 = (void *)sub_23DE66D7C();
          v117 = v24;
          v118 = (void *)sub_23DE666C8();
          v119 = objc_msgSend(v115, sel_hm_localizableTimeStringKeyWithPrefix_date_, v116, v118);

          sub_23DE66D94();
          if (qword_25432AB88 != -1)
            swift_once();
          v198 = (char *)sub_23DE665E4();
          v187 = v120;
          swift_bridgeObjectRelease();
          sub_23DE57BF4();
          *(_QWORD *)&v192 = v121;
          v122 = swift_allocObject();
          v189 = xmmword_23DE67580;
          *(_OWORD *)(v122 + 16) = xmmword_23DE67580;
          v123 = sub_23DE51874();
          v124 = (void *)sub_23DE666C8();
          v125 = objc_msgSend(v123, sel_stringFromDate_, v124);

          v126 = sub_23DE66D94();
          v128 = v127;

          v206 = v126;
          v207 = v128;
          v204 = 32;
          v205 = 0xE100000000000000;
          v202 = 41154;
          v203 = 0xA200000000000000;
          v129 = sub_23DE4CD84();
          v130 = MEMORY[0x24BEE0D00];
          v131 = sub_23DE66EE4();
          v133 = v132;
          swift_bridgeObjectRelease();
          *(_QWORD *)(v122 + 56) = v130;
          v188 = (char *)sub_23DE57CA4();
          *(_QWORD *)(v122 + 64) = v188;
          *(_QWORD *)(v122 + 32) = v131;
          *(_QWORD *)(v122 + 40) = v133;
          v134 = sub_23DE66D88();
          v197 = v135;
          v198 = (char *)v134;
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          v136 = sub_23DE51874();
          v137 = (void *)sub_23DE66D7C();
          v181[0] = v117;
          v138 = (void *)sub_23DE666C8();
          v139 = objc_msgSend(v136, sel_hm_localizableTimeStringKeyWithPrefix_date_, v137, v138);

          sub_23DE66D94();
          v187 = sub_23DE665E4();
          swift_bridgeObjectRelease();
          v140 = swift_allocObject();
          *(_OWORD *)(v140 + 16) = v189;
          v141 = sub_23DE51874();
          v142 = (void *)sub_23DE666C8();
          v143 = objc_msgSend(v141, sel_stringFromDate_, v142);

          v144 = sub_23DE66D94();
          v146 = v145;

          v206 = v144;
          v207 = v146;
          v204 = 32;
          v205 = 0xE100000000000000;
          v202 = 41154;
          v203 = 0xA200000000000000;
          HIDWORD(v180) = HIDWORD(v129);
          v147 = MEMORY[0x24BEE0D00];
          v148 = sub_23DE66EE4();
          v150 = v149;
          swift_bridgeObjectRelease();
          v151 = v188;
          *(_QWORD *)(v140 + 56) = v147;
          *(_QWORD *)(v140 + 64) = v151;
          *(_QWORD *)(v140 + 32) = v148;
          *(_QWORD *)(v140 + 40) = v150;
          v152 = sub_23DE66D88();
          v154 = v153;
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          v155 = v196;
          sub_23DE53A4C(v196);
          sub_23DE575F8(0, (unint64_t *)&qword_25432B1D8);
          inited = swift_initStackObject();
          *(_OWORD *)(inited + 16) = xmmword_23DE67420;
          v157 = v197;
          *(_QWORD *)(inited + 32) = v198;
          *(_QWORD *)(inited + 40) = v157;
          *(_QWORD *)(inited + 48) = v152;
          *(_QWORD *)(inited + 56) = v154;
          v158 = (void *)sub_23DE667A0();
          v159 = (uint64_t)v190;
          sub_23DE667AC();
          v160 = v199;
          v161 = v201;
          (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v199 + 56))(v159, 0, 1, v201);
          v162 = (uint64_t)v185;
          sub_23DE53C50(v155, inited, v195, 1, v158, v159, (uint64_t)v185);
          swift_bridgeObjectRelease();

          sub_23DE57B74(v159, &qword_25432A770, (uint64_t (*)(uint64_t))MEMORY[0x24BDCE900]);
          v163 = *(void (**)(uint64_t, uint64_t))(v160 + 8);
          v163(v196, v161);
          v194(v162);
          swift_release();
          swift_release();
          swift_release();
          sub_23DE57BB8(v162);
          return ((uint64_t (*)(_QWORD, uint64_t))v163)(v181[0], v161);
        }
        v60 = v198;
        v55 = v201;
        (*(void (**)(char *, char *, uint64_t))(v52 + 16))(v198, v24, v201);
        if (v200)
          break;
        sub_23DE666E0();
        v55 = v201;
        v63 = v62;
        v61 = *(void (**)(char *, uint64_t))(v52 + 8);
        v61(v60, v201);
        if (v63 <= 0.0)
          goto LABEL_23;
        v53 = v58;
        if (sub_23DE667B8() == 4)
        {
          v55 = v201;
          goto LABEL_24;
        }
        v64 = sub_23DE667B8();
        v61(v24, v201);
        v51 = v34;
        if (v64 == 5)
        {
          swift_release();
          if (a5 == v53)
          {
            swift_bridgeObjectRelease();
LABEL_37:
            v164 = v187;
            sub_23DE53A4C(v187);
            sub_23DE575F8(0, (unint64_t *)&qword_25432B1D8);
            v165 = swift_initStackObject();
            *(_OWORD *)(v165 + 16) = xmmword_23DE67420;
            v166 = (uint64_t)v190;
            v167 = v195;
            if (qword_25432AB88 != -1)
              swift_once();
            *(_QWORD *)(v165 + 32) = sub_23DE665E4();
            *(_QWORD *)(v165 + 40) = v168;
            *(_QWORD *)(v165 + 48) = sub_23DE665E4();
            *(_QWORD *)(v165 + 56) = v169;
            v170 = v201;
            (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v199 + 56))(v166, 1, 1, v201);
            v171 = v186;
            sub_23DE53C50(v164, v165, v167, 3, 0, v166, v186);
            swift_bridgeObjectRelease();
            sub_23DE57B74(v166, &qword_25432A770, (uint64_t (*)(uint64_t))MEMORY[0x24BDCE900]);
            v61((char *)v164, v170);
            v194(v171);
            swift_release();
            v114 = v171;
            return sub_23DE57BB8(v114);
          }
          v200 = 0;
        }
        else
        {
          v200 = v57;
          v55 = v201;
          if (a5 == v53)
            goto LABEL_29;
        }
LABEL_9:
        v52 = v199;
      }
      v61 = *(void (**)(char *, uint64_t))(v52 + 8);
      v61(v60, v55);
LABEL_23:
      v53 = v58;
LABEL_24:
      v51 = v34;
      swift_release();
      v61(v24, v55);
      if (a5 == v53)
      {
LABEL_29:
        swift_bridgeObjectRelease();
        v65 = v200;
        if (v200)
        {
          swift_retain();
          v66 = v55;
          v67 = sub_23DE51874();
          v68 = (void *)sub_23DE66D7C();
          v69 = v196;
          sub_23DE667AC();
          v70 = (void *)sub_23DE666C8();
          v61((char *)v69, v66);
          v71 = objc_msgSend(v67, sel_hm_localizableTimeStringKeyWithPrefix_date_, v68, v70);

          sub_23DE66D94();
          if (qword_25432AB88 != -1)
            swift_once();
          v198 = (char *)sub_23DE665E4();
          v187 = v72;
          swift_bridgeObjectRelease();
          sub_23DE57BF4();
          v193 = v73;
          v74 = swift_allocObject();
          v192 = xmmword_23DE67580;
          *(_OWORD *)(v74 + 16) = xmmword_23DE67580;
          v75 = v188;
          sub_23DE667AC();
          v76 = sub_23DE51874();
          v77 = (void *)sub_23DE666C8();
          v78 = objc_msgSend(v76, sel_stringFromDate_, v77);

          v79 = sub_23DE66D94();
          v200 = v65;
          v81 = v80;

          v206 = v79;
          v207 = v81;
          v204 = 32;
          v205 = 0xE100000000000000;
          v202 = 41154;
          v203 = 0xA200000000000000;
          v82 = sub_23DE4CD84();
          v83 = MEMORY[0x24BEE0D00];
          v84 = sub_23DE66EE4();
          v86 = v85;
          swift_bridgeObjectRelease();
          v61(v75, v201);
          *(_QWORD *)(v74 + 56) = v83;
          v188 = (char *)sub_23DE57CA4();
          *(_QWORD *)(v74 + 64) = v188;
          *(_QWORD *)(v74 + 32) = v84;
          *(_QWORD *)(v74 + 40) = v86;
          v87 = sub_23DE66D88();
          v197 = v88;
          v198 = (char *)v87;
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          sub_23DE665E4();
          v89 = sub_23DE665E4();
          v186 = v90;
          v187 = v89;
          swift_bridgeObjectRelease();
          v91 = swift_allocObject();
          *(_OWORD *)(v91 + 16) = v192;
          v92 = (char *)v189;
          sub_23DE667AC();
          v93 = sub_23DE51874();
          v94 = (void *)sub_23DE666C8();
          v95 = objc_msgSend(v93, sel_stringFromDate_, v94);

          v96 = sub_23DE66D94();
          v98 = v97;

          v206 = v96;
          v207 = v98;
          v204 = 32;
          v205 = 0xE100000000000000;
          v202 = 41154;
          v203 = 0xA200000000000000;
          HIDWORD(v180) = HIDWORD(v82);
          v99 = MEMORY[0x24BEE0D00];
          v100 = sub_23DE66EE4();
          v102 = v101;
          swift_bridgeObjectRelease();
          v103 = v201;
          v61(v92, v201);
          v104 = v188;
          *(_QWORD *)(v91 + 56) = v99;
          *(_QWORD *)(v91 + 64) = v104;
          *(_QWORD *)(v91 + 32) = v100;
          *(_QWORD *)(v91 + 40) = v102;
          v105 = sub_23DE66D88();
          v107 = v106;
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          v108 = v196;
          sub_23DE667AC();
          sub_23DE575F8(0, (unint64_t *)&qword_25432B1D8);
          v109 = swift_initStackObject();
          *(_OWORD *)(v109 + 16) = xmmword_23DE67420;
          v110 = v197;
          *(_QWORD *)(v109 + 32) = v198;
          *(_QWORD *)(v109 + 40) = v110;
          *(_QWORD *)(v109 + 48) = v105;
          *(_QWORD *)(v109 + 56) = v107;
          v111 = (void *)sub_23DE667A0();
          v112 = (uint64_t)v190;
          sub_23DE667AC();
          (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v199 + 56))(v112, 0, 1, v103);
          v113 = (uint64_t)v185;
          sub_23DE53C50(v108, v109, v195, 2, v111, v112, (uint64_t)v185);
          swift_bridgeObjectRelease();

          sub_23DE57B74(v112, &qword_25432A770, (uint64_t (*)(uint64_t))MEMORY[0x24BDCE900]);
          v61((char *)v108, v103);
          v194(v113);
          swift_release();
          swift_release_n();
          v114 = v113;
          return sub_23DE57BB8(v114);
        }
        goto LABEL_37;
      }
      goto LABEL_9;
    }
  }
  swift_bridgeObjectRelease();
  v172 = v196;
  sub_23DE53A4C(v196);
  sub_23DE575F8(0, (unint64_t *)&qword_25432B1D8);
  v173 = swift_initStackObject();
  *(_OWORD *)(v173 + 16) = xmmword_23DE67420;
  if (qword_25432AB88 != -1)
    swift_once();
  *(_QWORD *)(v173 + 32) = sub_23DE665E4();
  *(_QWORD *)(v173 + 40) = v174;
  *(_QWORD *)(v173 + 48) = sub_23DE665E4();
  *(_QWORD *)(v173 + 56) = v175;
  v176 = v199;
  v177 = (uint64_t)v190;
  v178 = v201;
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v199 + 56))(v190, 1, 1, v201);
  v179 = (uint64_t)v185;
  sub_23DE53C50(v172, v173, a5, 0, 0, v177, (uint64_t)v185);
  swift_bridgeObjectRelease();
  sub_23DE57B74(v177, &qword_25432A770, (uint64_t (*)(uint64_t))MEMORY[0x24BDCE900]);
  (*(void (**)(uint64_t, uint64_t))(v176 + 8))(v172, v178);
  v194(v179);
  swift_release();
  v114 = v179;
  return sub_23DE57BB8(v114);
}

uint64_t sub_23DE53A4C@<X0>(uint64_t a1@<X8>)
{
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
  char *v13;
  uint64_t v14;
  char *v15;
  _QWORD v17[2];

  v17[1] = a1;
  v2 = sub_23DE66770();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)v17 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23DE4CF6C(0, &qword_25432A770, (uint64_t (*)(uint64_t))MEMORY[0x24BDCE900], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1C68]);
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)v17 - v7;
  v9 = sub_23DE666F8();
  v10 = *(_QWORD *)(v9 - 8);
  v11 = MEMORY[0x24BDAC7A8](v9);
  v13 = (char *)v17 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v11);
  v15 = (char *)v17 - v14;
  (*(void (**)(char *, _QWORD, uint64_t))(v3 + 104))(v5, *MEMORY[0x24BDCF220], v2);
  sub_23DE66764();
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  (*(void (**)(char *, uint64_t, uint64_t))(v10 + 16))(v13, v1, v9);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v10 + 48))(v8, 1, v9) == 1)
  {
    (*(void (**)(char *, char *, uint64_t))(v10 + 32))(v15, v13, v9);
    sub_23DE57B74((uint64_t)v8, &qword_25432A770, (uint64_t (*)(uint64_t))MEMORY[0x24BDCE900]);
  }
  else
  {
    (*(void (**)(char *, uint64_t))(v10 + 8))(v13, v9);
    (*(void (**)(char *, char *, uint64_t))(v10 + 32))(v15, v8, v9);
  }
  sub_23DE6674C();
  return (*(uint64_t (**)(char *, uint64_t))(v10 + 8))(v15, v9);
}

uint64_t sub_23DE53C50@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, void *a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X8>)
{
  uint64_t *v7;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t);
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
  _BYTE *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  _BYTE *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  _BYTE *v44;
  uint64_t (*v45)(uint64_t, uint64_t, uint64_t);
  NSObject *v46;
  os_log_type_t v47;
  int v48;
  _BOOL4 v49;
  uint64_t v50;
  uint64_t v51;
  unint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  unint64_t v56;
  uint64_t v57;
  unint64_t v58;
  uint64_t v59;
  void (*v60)(_BYTE *, uint64_t);
  os_log_t v61;
  uint64_t v62;
  uint64_t v63;
  void (*v64)(_BYTE *, uint64_t);
  uint64_t v65;
  uint64_t v66;
  void (*v67)(_BYTE *, uint64_t, uint64_t, uint64_t);
  _BYTE *v68;
  int v69;
  char v70;
  id v71;
  _BYTE *v72;
  uint64_t v73;
  uint64_t v74;
  void (*v75)(uint64_t, _BYTE *, uint64_t);
  uint64_t *v76;
  _BYTE *v77;
  NSObject *v78;
  os_log_type_t v79;
  uint8_t *v80;
  uint64_t v81;
  uint64_t v82;
  unint64_t v83;
  _BYTE *v84;
  uint64_t v85;
  uint64_t v86;
  _BYTE *v87;
  _BYTE *v88;
  _BYTE *v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t *v98;
  uint64_t v99;
  uint64_t v101;
  uint64_t v102;
  _BYTE *v103;
  uint64_t *v104;
  void (*v105)(uint64_t, _BYTE *, uint64_t);
  uint64_t v106;
  uint64_t v107;
  _BYTE v108[12];
  int v109;
  os_log_t v110;
  uint64_t v111;
  _BYTE *v112;
  uint64_t v113;
  _BYTE *v114;
  _BYTE *v115;
  _BYTE *v116;
  _BYTE *v117;
  _BYTE *v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  _BYTE *v122;
  uint64_t *v123;
  _BYTE *v124;
  _BYTE *v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t (*v128)(uint64_t, uint64_t, uint64_t);
  uint64_t v129;
  uint64_t v130;
  uint64_t v131;
  uint64_t v132;
  id v133;
  uint64_t v134;
  uint64_t v135;
  void (*v136)(_BYTE *, uint64_t, uint64_t);
  uint64_t v137;
  uint64_t v138;
  uint64_t v139;
  uint64_t v140;
  _BYTE *v141;
  uint64_t v142;
  _BYTE *v143;
  char v144;
  uint64_t v145;
  uint64_t v146;

  v131 = a6;
  v133 = a5;
  v142 = a4;
  v129 = a2;
  v140 = a7;
  v10 = *v7;
  v130 = type metadata accessor for MedicationsWidgetViewModel();
  MEMORY[0x24BDAC7A8](v130);
  v123 = (uint64_t *)&v108[-((v11 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v120 = sub_23DE667DC();
  v119 = *(_QWORD *)(v120 - 8);
  MEMORY[0x24BDAC7A8](v120);
  v118 = &v108[-((v12 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v13 = (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1C68];
  sub_23DE4CF6C(0, (unint64_t *)&qword_25432AF30, (uint64_t (*)(uint64_t))MEMORY[0x24BE45FA0], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1C68]);
  v15 = MEMORY[0x24BDAC7A8](v14);
  v115 = &v108[-((v16 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x24BDAC7A8](v15);
  v124 = &v108[-v17];
  v18 = sub_23DE66818();
  v126 = *(_QWORD *)(v18 - 8);
  v127 = v18;
  v19 = MEMORY[0x24BDAC7A8](v18);
  v112 = &v108[-((v20 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v21 = MEMORY[0x24BDAC7A8](v19);
  v116 = &v108[-v22];
  MEMORY[0x24BDAC7A8](v21);
  v114 = &v108[-v23];
  sub_23DE4CF6C(0, qword_25432AAD0, (uint64_t (*)(uint64_t))type metadata accessor for MedmojiIconConfiguration, v13);
  v25 = MEMORY[0x24BDAC7A8](v24);
  v117 = &v108[-((v26 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x24BDAC7A8](v25);
  v143 = &v108[-v27];
  v28 = sub_23DE66CD4();
  v29 = *(_QWORD *)(v28 - 8);
  v30 = MEMORY[0x24BDAC7A8](v28);
  v141 = &v108[-((v31 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x24BDAC7A8](v30);
  v33 = &v108[-v32];
  v34 = sub_23DE666F8();
  v35 = *(_QWORD *)(v34 - 8);
  v36 = MEMORY[0x24BDAC7A8](v34);
  v122 = &v108[-((v37 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x24BDAC7A8](v36);
  v39 = &v108[-v38];
  v40 = sub_23DE66878();
  v134 = *(_QWORD *)(v40 - 8);
  v135 = v40;
  v41 = MEMORY[0x24BDAC7A8](v40);
  v125 = &v108[-((v42 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x24BDAC7A8](v41);
  v44 = &v108[-v43];
  sub_23DE66860();
  v45 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v35 + 16);
  v132 = a1;
  v128 = v45;
  v45((uint64_t)v39, a1, v34);
  v137 = v29;
  v138 = a3;
  v136 = *(void (**)(_BYTE *, uint64_t, uint64_t))(v29 + 16);
  v136(v33, a3, v28);
  v46 = sub_23DE6686C();
  v47 = sub_23DE66E54();
  v48 = v47;
  v49 = os_log_type_enabled(v46, v47);
  v139 = v34;
  v113 = v10;
  v121 = v35;
  if (v49)
  {
    v50 = swift_slowAlloc();
    v111 = swift_slowAlloc();
    v146 = v111;
    *(_DWORD *)v50 = 136315906;
    v110 = v46;
    v51 = sub_23DE67034();
    v109 = v48;
    v145 = sub_23DE54DF0(v51, v52, &v146);
    sub_23DE66EB4();
    swift_bridgeObjectRelease();
    v53 = 8 * (char)v142;
    v54 = *(_QWORD *)&aNoneschepastdu[v53];
    *(_WORD *)(v50 + 12) = 2082;
    v145 = sub_23DE54DF0(v54, *(_QWORD *)&aUptodatealllog[v53 + 16], &v146);
    sub_23DE66EB4();
    swift_bridgeObjectRelease();
    *(_WORD *)(v50 + 22) = 2082;
    sub_23DE4CD44(&qword_25432AE98, (uint64_t (*)(uint64_t))MEMORY[0x24BDCE900], MEMORY[0x24BDCE988]);
    v55 = sub_23DE66FB0();
    v145 = sub_23DE54DF0(v55, v56, &v146);
    sub_23DE66EB4();
    swift_bridgeObjectRelease();
    (*(void (**)(_BYTE *, uint64_t))(v35 + 8))(v39, v34);
    *(_WORD *)(v50 + 32) = 2082;
    sub_23DE4CD44(&qword_25432B168, (uint64_t (*)(uint64_t))MEMORY[0x24BDFAF10], MEMORY[0x24BDFAF30]);
    v57 = sub_23DE66FB0();
    v145 = sub_23DE54DF0(v57, v58, &v146);
    sub_23DE66EB4();
    swift_bridgeObjectRelease();
    v59 = v137;
    v60 = *(void (**)(_BYTE *, uint64_t))(v137 + 8);
    v60(v33, v28);
    v61 = v110;
    _os_log_impl(&dword_23DE49000, v110, (os_log_type_t)v109, "[%s] Creating entry for state: %{public}s date: %{public}s family: %{public}s", (uint8_t *)v50, 0x2Au);
    v62 = v111;
    swift_arrayDestroy();
    MEMORY[0x24264664C](v62, -1, -1);
    MEMORY[0x24264664C](v50, -1, -1);

  }
  else
  {
    (*(void (**)(_BYTE *, uint64_t))(v35 + 8))(v39, v34);
    v59 = v137;
    v60 = *(void (**)(_BYTE *, uint64_t))(v137 + 8);
    v60(v33, v28);

  }
  v63 = v135;
  v64 = *(void (**)(_BYTE *, uint64_t))(v134 + 8);
  v64(v44, v135);
  v65 = v28;
  v66 = type metadata accessor for MedmojiIconConfiguration();
  v67 = *(void (**)(_BYTE *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v66 - 8) + 56);
  v67(v143, 1, 1, v66);
  v68 = v141;
  v136(v141, v138, v28);
  v69 = (*(uint64_t (**)(_BYTE *, uint64_t))(v59 + 88))(v68, v28);
  if (MEMORY[0x24BDFAEE8] && v69 == *MEMORY[0x24BDFAEE8])
  {
    v70 = v142;
    if (v142 == 1 && v133)
    {
      v71 = v133;
      v72 = v115;
      HKMedicationUserDomainConcept.visualConfig.getter((uint64_t)v115);
      v73 = v126;
      v74 = v127;
      if ((*(unsigned int (**)(_BYTE *, uint64_t, uint64_t))(v126 + 48))(v72, 1, v127) != 1)
      {
        v75 = *(void (**)(uint64_t, _BYTE *, uint64_t))(v73 + 32);
        v76 = (uint64_t *)&v144;
LABEL_19:
        v85 = *(v76 - 32);
        v75(v85, v72, v74);
        v86 = v73;
        v87 = v116;
        (*(void (**)(_BYTE *, uint64_t, uint64_t))(v73 + 16))(v116, v85, v74);
        v88 = v118;
        sub_23DE667D0();

        (*(void (**)(uint64_t, uint64_t))(v86 + 8))(v85, v74);
        v89 = v143;
        sub_23DE57B74((uint64_t)v143, qword_25432AAD0, (uint64_t (*)(uint64_t))type metadata accessor for MedmojiIconConfiguration);
        v90 = (uint64_t)v117;
        v75((uint64_t)v117, v87, v74);
        (*(void (**)(uint64_t, _BYTE *, uint64_t))(v119 + 32))(v90 + *(int *)(v66 + 20), v88, v120);
        v67((_BYTE *)v90, 0, 1, v66);
        sub_23DE574E0(v90, (uint64_t)v89);
        goto LABEL_20;
      }
LABEL_13:

      sub_23DE57B74((uint64_t)v72, (unint64_t *)&qword_25432AF30, (uint64_t (*)(uint64_t))MEMORY[0x24BE45FA0]);
      goto LABEL_20;
    }
    goto LABEL_20;
  }
  v70 = v142;
  if (v69 == *MEMORY[0x24BDFAF00])
  {
    if (v133)
    {
      v71 = v133;
      v72 = v124;
      HKMedicationUserDomainConcept.visualConfig.getter((uint64_t)v124);
      v73 = v126;
      v74 = v127;
      if ((*(unsigned int (**)(_BYTE *, uint64_t, uint64_t))(v126 + 48))(v72, 1, v127) != 1)
      {
        v75 = *(void (**)(uint64_t, _BYTE *, uint64_t))(v73 + 32);
        v76 = &v146;
        goto LABEL_19;
      }
      goto LABEL_13;
    }
LABEL_20:
    if (qword_25432AB88 != -1)
      swift_once();
    v91 = sub_23DE665E4();
    v93 = v92;
    v146 = MEMORY[0x24BEE4B08];
    v94 = swift_bridgeObjectRetain();
    v95 = sub_23DE57378(v94);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    v96 = type metadata accessor for MedicationsWidgetEntry();
    v97 = v140;
    v98 = (uint64_t *)(v140 + *(int *)(v96 + 20));
    v99 = v130;
    sub_23DE574E0((uint64_t)v143, (uint64_t)v98 + *(int *)(v130 + 24));
    sub_23DE5753C(v131, (uint64_t)v98 + *(int *)(v99 + 32));
    *v98 = v91;
    v98[1] = v93;
    v98[2] = v95;
    *((_BYTE *)v98 + *(int *)(v99 + 28)) = v70;
    return v128(v97, v132, v139);
  }
  if (v69 == *MEMORY[0x24BDFAF08] || v69 == *MEMORY[0x24BDFAEF0])
    goto LABEL_20;
  v142 = v65;
  v77 = v125;
  sub_23DE66860();
  v78 = sub_23DE6686C();
  v79 = sub_23DE66E48();
  if (os_log_type_enabled(v78, v79))
  {
    v80 = (uint8_t *)swift_slowAlloc();
    v81 = swift_slowAlloc();
    v146 = v81;
    *(_DWORD *)v80 = 136446210;
    v82 = sub_23DE67034();
    v145 = sub_23DE54DF0(v82, v83, &v146);
    sub_23DE66EB4();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_23DE49000, v78, v79, "[%{public}s] Requested unsupported widget family entry", v80, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x24264664C](v81, -1, -1);
    MEMORY[0x24264664C](v80, -1, -1);

    v84 = v125;
  }
  else
  {

    v84 = v77;
  }
  v64(v84, v63);
  v101 = v142;
  v102 = v121;
  v103 = v122;
  sub_23DE666EC();
  v104 = v123;
  sub_23DE4ACE4(v123);
  sub_23DE57B74((uint64_t)v143, qword_25432AAD0, (uint64_t (*)(uint64_t))type metadata accessor for MedmojiIconConfiguration);
  v105 = *(void (**)(uint64_t, _BYTE *, uint64_t))(v102 + 32);
  v106 = v140;
  v105(v140, v103, v139);
  v107 = type metadata accessor for MedicationsWidgetEntry();
  sub_23DE512D4((uint64_t)v104, v106 + *(int *)(v107 + 20));
  return ((uint64_t (*)(_BYTE *, uint64_t))v60)(v141, v101);
}

uint64_t sub_23DE547C0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v1 = v0 + OBJC_IVAR____TtC25HealthMedicationsWidgetUI34MedicationsWidgetTimelineGenerator_calendar;
  v2 = sub_23DE6677C();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);
  swift_bridgeObjectRelease();

  objc_release(*(id *)(v0
                     + OBJC_IVAR____TtC25HealthMedicationsWidgetUI34MedicationsWidgetTimelineGenerator____lazy_storage___dateFormatter));
  return swift_deallocClassInstance();
}

uint64_t sub_23DE54848()
{
  return type metadata accessor for MedicationsWidgetTimelineGenerator();
}

uint64_t type metadata accessor for MedicationsWidgetTimelineGenerator()
{
  uint64_t result;

  result = qword_25432A7B0;
  if (!qword_25432A7B0)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_23DE5488C()
{
  uint64_t result;
  unint64_t v1;

  result = sub_23DE6677C();
  if (v1 <= 0x3F)
  {
    result = swift_updateClassMetadata2();
    if (!result)
      return 0;
  }
  return result;
}

uint64_t sub_23DE54930()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t (*v4)(uint64_t);
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v1 = sub_23DE66E90();
  v7 = *(_QWORD *)(v1 - 8);
  v8 = v1;
  MEMORY[0x24BDAC7A8]();
  v3 = (char *)&v6 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23DE66E60();
  v4 = (uint64_t (*)(uint64_t))MEMORY[0x24BEE5688];
  MEMORY[0x24BDAC7A8]();
  sub_23DE66C8C();
  MEMORY[0x24BDAC7A8]();
  *(_QWORD *)(v0 + 16) = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDD3C40]), sel_init);
  sub_23DE66758();
  *(_QWORD *)(v0 + OBJC_IVAR____TtC25HealthMedicationsWidgetUI34MedicationsWidgetTimelineGenerator_cancellables) = MEMORY[0x24BEE4B08];
  v6 = OBJC_IVAR____TtC25HealthMedicationsWidgetUI34MedicationsWidgetTimelineGenerator_queue;
  sub_23DE54B78();
  sub_23DE66C80();
  v9 = MEMORY[0x24BEE4AF8];
  sub_23DE4CD44(&qword_25432AB78, v4, MEMORY[0x24BEE5698]);
  sub_23DE4CF6C(0, &qword_25432AB68, v4, MEMORY[0x24BEE1250]);
  sub_23DE57CE8(&qword_25432AB70, &qword_25432AB68, v4, MEMORY[0x24BEE12C8]);
  sub_23DE66EFC();
  (*(void (**)(char *, _QWORD, uint64_t))(v7 + 104))(v3, *MEMORY[0x24BEE5750], v8);
  *(_QWORD *)(v0 + v6) = sub_23DE66E9C();
  *(_QWORD *)(v0 + OBJC_IVAR____TtC25HealthMedicationsWidgetUI34MedicationsWidgetTimelineGenerator_timeoutInterval) = 0x4024000000000000;
  *(_QWORD *)(v0
            + OBJC_IVAR____TtC25HealthMedicationsWidgetUI34MedicationsWidgetTimelineGenerator____lazy_storage___dateFormatter) = 0;
  return v0;
}

unint64_t sub_23DE54B78()
{
  unint64_t result;

  result = qword_25432AB80;
  if (!qword_25432AB80)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_25432AB80);
  }
  return result;
}

uint64_t sub_23DE54BB4(unint64_t a1)
{
  unint64_t *v1;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  int isUniquelyReferenced_nonNull_bridgeObject;
  uint64_t v8;
  uint64_t v9;
  uint64_t result;
  uint64_t v11;
  uint64_t v12;
  BOOL v13;
  uint64_t v14;

  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    v3 = sub_23DE66F80();
    swift_bridgeObjectRelease();
  }
  else
  {
    v3 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
  }
  v4 = *v1;
  if (*v1 >> 62)
  {
    swift_bridgeObjectRetain();
    v5 = sub_23DE66F80();
    swift_bridgeObjectRelease();
    v6 = v5 + v3;
    if (!__OFADD__(v5, v3))
      goto LABEL_5;
LABEL_23:
    __break(1u);
    goto LABEL_24;
  }
  v5 = *(_QWORD *)((v4 & 0xFFFFFFFFFFFFF8) + 0x10);
  v6 = v5 + v3;
  if (__OFADD__(v5, v3))
    goto LABEL_23;
LABEL_5:
  v4 = *v1;
  isUniquelyReferenced_nonNull_bridgeObject = swift_isUniquelyReferenced_nonNull_bridgeObject();
  *v1 = v4;
  v5 = 0;
  if (isUniquelyReferenced_nonNull_bridgeObject && (v4 & 0x8000000000000000) == 0 && (v4 & 0x4000000000000000) == 0)
  {
    v8 = v4 & 0xFFFFFFFFFFFFFF8;
    if (v6 <= *(_QWORD *)((v4 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
      goto LABEL_15;
    v5 = 1;
  }
  if (v4 >> 62)
    goto LABEL_25;
  v9 = *(_QWORD *)((v4 & 0xFFFFFFFFFFFFF8) + 0x10);
  while (1)
  {
    if (v9 <= v6)
      v9 = v6;
    swift_bridgeObjectRetain();
    v4 = MEMORY[0x24264622C](v5, v9, 1, v4);
    swift_bridgeObjectRelease();
    *v1 = v4;
    v8 = v4 & 0xFFFFFFFFFFFFFF8;
LABEL_15:
    result = sub_23DE56FF0(v8 + 8 * *(_QWORD *)(v8 + 16) + 32, (*(_QWORD *)(v8 + 24) >> 1) - *(_QWORD *)(v8 + 16), a1);
    if (v11 >= v3)
      break;
LABEL_24:
    __break(1u);
LABEL_25:
    swift_bridgeObjectRetain();
    v9 = sub_23DE66F80();
    swift_bridgeObjectRelease();
  }
  if (v11 < 1)
    goto LABEL_19;
  v12 = *(_QWORD *)((*v1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  v13 = __OFADD__(v12, v11);
  v14 = v12 + v11;
  if (!v13)
  {
    *(_QWORD *)((*v1 & 0xFFFFFFFFFFFFFF8) + 0x10) = v14;
LABEL_19:
    swift_bridgeObjectRelease();
    return sub_23DE66DE8();
  }
  __break(1u);
  return result;
}

uint64_t sub_23DE54D6C(unint64_t *a1)
{
  unint64_t v2;
  int isUniquelyReferenced_nonNull_bridgeObject;
  uint64_t v4;
  uint64_t v6[2];

  v2 = *a1;
  isUniquelyReferenced_nonNull_bridgeObject = swift_isUniquelyReferenced_nonNull_bridgeObject();
  *a1 = v2;
  if (!isUniquelyReferenced_nonNull_bridgeObject
    || (v2 & 0x8000000000000000) != 0
    || (v2 & 0x4000000000000000) != 0)
  {
    sub_23DE57310(v2);
  }
  v4 = *(_QWORD *)((v2 & 0xFFFFFFFFFFFFFF8) + 0x10);
  v6[0] = (v2 & 0xFFFFFFFFFFFFFF8) + 32;
  v6[1] = v4;
  sub_23DE56058(v6);
  return sub_23DE66DE8();
}

uint64_t sub_23DE54DF0(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12[3];
  uint64_t ObjectType;

  v6 = sub_23DE54EC0(v12, 0, 0, 1, a1, a2);
  v7 = v12[0];
  if (v6)
  {
    v8 = v6;
    ObjectType = swift_getObjectType();
    v12[0] = v8;
    v9 = *a3;
    if (*a3)
    {
      sub_23DE575BC((uint64_t)v12, *a3);
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
      sub_23DE575BC((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v12);
  return v7;
}

uint64_t sub_23DE54EC0(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_23DE66EC0();
            result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    result = sub_23DE55078(a5, a6);
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
  v8 = sub_23DE66F44();
  if (!v8)
  {
    sub_23DE66F74();
    __break(1u);
LABEL_17:
    result = sub_23DE66F8C();
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

uint64_t sub_23DE55078(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v2 = sub_23DE5510C(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v2 = sub_23DE552F0(0, *(_QWORD *)(v2 + 16) + 1, 1, (char *)v2);
  v4 = *(_QWORD *)(v2 + 16);
  v3 = *(_QWORD *)(v2 + 24);
  if (v4 >= v3 >> 1)
    v2 = sub_23DE552F0(v3 > 1, v4 + 1, 1, (char *)v2);
  *(_QWORD *)(v2 + 16) = v4 + 1;
  *(_BYTE *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_23DE5510C(uint64_t a1, unint64_t a2)
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
      v3 = sub_23DE55280(v2, 0);
      if (v2 < 0)
        break;
      v4 = v3;
      v5 = sub_23DE66F20();
      if ((v6 & 1) != 0)
        goto LABEL_14;
      if (v5 == v2)
        return (uint64_t)v4;
      sub_23DE66F74();
      __break(1u);
LABEL_10:
      v2 = sub_23DE66DB8();
      if (!v2)
        return MEMORY[0x24BEE4AF8];
    }
    sub_23DE66F8C();
    __break(1u);
LABEL_14:
    result = sub_23DE66F74();
    __break(1u);
  }
  else
  {
    return MEMORY[0x24BEE4AF8];
  }
  return result;
}

_QWORD *sub_23DE55280(uint64_t a1, uint64_t a2)
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
  sub_23DE575F8(0, &qword_25432B1E0);
  v4 = (_QWORD *)swift_allocObject();
  v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_23DE552F0(char a1, int64_t a2, char a3, char *a4)
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
    sub_23DE575F8(0, &qword_25432B1E0);
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
  result = sub_23DE66F8C();
  __break(1u);
  return result;
}

uint64_t sub_23DE55448(char a1, int64_t a2, char a3)
{
  char **v3;
  uint64_t result;

  result = sub_23DE55464(a1, a2, a3, *v3);
  *v3 = (char *)result;
  return result;
}

uint64_t sub_23DE55464(char a1, int64_t a2, char a3, char *a4)
{
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  int64_t v11;
  uint64_t v12;
  char *v13;
  char *v14;
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
        goto LABEL_32;
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
    sub_23DE575F8(0, (unint64_t *)&qword_25432B1D8);
    v10 = (char *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    v12 = v11 - 32;
    if (v11 < 32)
      v12 = v11 - 17;
    *((_QWORD *)v10 + 2) = v8;
    *((_QWORD *)v10 + 3) = 2 * (v12 >> 4);
  }
  else
  {
    v10 = (char *)MEMORY[0x24BEE4AF8];
  }
  v13 = v10 + 32;
  v14 = a4 + 32;
  if ((a1 & 1) != 0)
  {
    if (v10 != a4 || v13 >= &v14[16 * v8])
      memmove(v13, v14, 16 * v8);
    *((_QWORD *)a4 + 2) = 0;
    goto LABEL_30;
  }
  if (v14 >= &v13[16 * v8] || v13 >= &v14[16 * v8])
  {
    swift_arrayInitWithCopy();
LABEL_30:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_32:
  result = sub_23DE66F8C();
  __break(1u);
  return result;
}

uint64_t sub_23DE555D8(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  uint64_t *v3;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  BOOL v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v17;
  _QWORD *v18;
  BOOL v19;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v21;

  v7 = *v3;
  sub_23DE67010();
  swift_bridgeObjectRetain();
  sub_23DE66DAC();
  v8 = sub_23DE67028();
  v9 = -1 << *(_BYTE *)(v7 + 32);
  v10 = v8 & ~v9;
  if (((*(_QWORD *)(v7 + 56 + ((v10 >> 3) & 0xFFFFFFFFFFFFF8)) >> v10) & 1) != 0)
  {
    v11 = *(_QWORD *)(v7 + 48);
    v12 = (_QWORD *)(v11 + 16 * v10);
    v13 = *v12 == a2 && v12[1] == a3;
    if (v13 || (sub_23DE66FC8() & 1) != 0)
    {
LABEL_7:
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      v14 = (uint64_t *)(*(_QWORD *)(*v3 + 48) + 16 * v10);
      v15 = v14[1];
      *a1 = *v14;
      a1[1] = v15;
      swift_bridgeObjectRetain();
      return 0;
    }
    v17 = ~v9;
    while (1)
    {
      v10 = (v10 + 1) & v17;
      if (((*(_QWORD *)(v7 + 56 + ((v10 >> 3) & 0xFFFFFFFFFFFFF8)) >> v10) & 1) == 0)
        break;
      v18 = (_QWORD *)(v11 + 16 * v10);
      v19 = *v18 == a2 && v18[1] == a3;
      if (v19 || (sub_23DE66FC8() & 1) != 0)
        goto LABEL_7;
    }
  }
  swift_bridgeObjectRelease();
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  v21 = *v3;
  *v3 = 0x8000000000000000;
  swift_bridgeObjectRetain();
  sub_23DE55A64(a2, a3, v10, isUniquelyReferenced_nonNull_native);
  *v3 = v21;
  swift_bridgeObjectRelease();
  *a1 = a2;
  a1[1] = a3;
  return 1;
}

uint64_t sub_23DE55784()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  int64_t v8;
  uint64_t v9;
  uint64_t result;
  int64_t v11;
  unint64_t v12;
  _QWORD *v13;
  unint64_t v14;
  unint64_t v15;
  int64_t v16;
  _QWORD *v17;
  unint64_t v18;
  int64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  unint64_t v25;
  char v26;
  unint64_t v27;
  BOOL v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;

  v1 = v0;
  v2 = *v0;
  sub_23DE57DA4(0, &qword_25432B1B0, MEMORY[0x24BEE0D00], MEMORY[0x24BEE0D10], MEMORY[0x24BEE24D8]);
  v3 = sub_23DE66F14();
  v4 = v3;
  if (!*(_QWORD *)(v2 + 16))
    goto LABEL_37;
  v5 = 1 << *(_BYTE *)(v2 + 32);
  v31 = v0;
  v32 = v2 + 56;
  if (v5 < 64)
    v6 = ~(-1 << v5);
  else
    v6 = -1;
  v7 = v6 & *(_QWORD *)(v2 + 56);
  v8 = (unint64_t)(v5 + 63) >> 6;
  v9 = v3 + 56;
  result = swift_retain();
  v11 = 0;
  while (1)
  {
    if (v7)
    {
      v14 = __clz(__rbit64(v7));
      v7 &= v7 - 1;
      v15 = v14 | (v11 << 6);
      goto LABEL_22;
    }
    v16 = v11 + 1;
    if (__OFADD__(v11, 1))
    {
LABEL_38:
      __break(1u);
LABEL_39:
      __break(1u);
      return result;
    }
    if (v16 >= v8)
      break;
    v17 = (_QWORD *)(v2 + 56);
    v18 = *(_QWORD *)(v32 + 8 * v16);
    ++v11;
    if (!v18)
    {
      v11 = v16 + 1;
      if (v16 + 1 >= v8)
        goto LABEL_31;
      v18 = *(_QWORD *)(v32 + 8 * v11);
      if (!v18)
      {
        v19 = v16 + 2;
        if (v19 >= v8)
        {
LABEL_31:
          swift_release();
          v1 = v31;
          goto LABEL_33;
        }
        v18 = *(_QWORD *)(v32 + 8 * v19);
        if (!v18)
        {
          while (1)
          {
            v11 = v19 + 1;
            if (__OFADD__(v19, 1))
              goto LABEL_39;
            if (v11 >= v8)
              goto LABEL_31;
            v18 = *(_QWORD *)(v32 + 8 * v11);
            ++v19;
            if (v18)
              goto LABEL_21;
          }
        }
        v11 = v19;
      }
    }
LABEL_21:
    v7 = (v18 - 1) & v18;
    v15 = __clz(__rbit64(v18)) + (v11 << 6);
LABEL_22:
    v20 = (uint64_t *)(*(_QWORD *)(v2 + 48) + 16 * v15);
    v21 = *v20;
    v22 = v20[1];
    sub_23DE67010();
    sub_23DE66DAC();
    result = sub_23DE67028();
    v23 = -1 << *(_BYTE *)(v4 + 32);
    v24 = result & ~v23;
    v25 = v24 >> 6;
    if (((-1 << v24) & ~*(_QWORD *)(v9 + 8 * (v24 >> 6))) != 0)
    {
      v12 = __clz(__rbit64((-1 << v24) & ~*(_QWORD *)(v9 + 8 * (v24 >> 6)))) | v24 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v26 = 0;
      v27 = (unint64_t)(63 - v23) >> 6;
      do
      {
        if (++v25 == v27 && (v26 & 1) != 0)
        {
          __break(1u);
          goto LABEL_38;
        }
        v28 = v25 == v27;
        if (v25 == v27)
          v25 = 0;
        v26 |= v28;
        v29 = *(_QWORD *)(v9 + 8 * v25);
      }
      while (v29 == -1);
      v12 = __clz(__rbit64(~v29)) + (v25 << 6);
    }
    *(_QWORD *)(v9 + ((v12 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v12;
    v13 = (_QWORD *)(*(_QWORD *)(v4 + 48) + 16 * v12);
    *v13 = v21;
    v13[1] = v22;
    ++*(_QWORD *)(v4 + 16);
  }
  swift_release();
  v1 = v31;
  v17 = (_QWORD *)(v2 + 56);
LABEL_33:
  v30 = 1 << *(_BYTE *)(v2 + 32);
  if (v30 > 63)
    bzero(v17, ((unint64_t)(v30 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  else
    *v17 = -1 << v30;
  *(_QWORD *)(v2 + 16) = 0;
LABEL_37:
  result = swift_release();
  *v1 = v4;
  return result;
}

uint64_t sub_23DE55A64(uint64_t result, uint64_t a2, unint64_t a3, char a4)
{
  uint64_t *v4;
  uint64_t *v5;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD *v15;
  BOOL v16;
  uint64_t v17;
  _QWORD *v18;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  BOOL v23;
  uint64_t v24;

  v5 = v4;
  v8 = result;
  v9 = *(_QWORD *)(*v4 + 16);
  v10 = *(_QWORD *)(*v4 + 24);
  if (v10 > v9 && (a4 & 1) != 0)
    goto LABEL_22;
  if ((a4 & 1) != 0)
  {
    sub_23DE55784();
  }
  else
  {
    if (v10 > v9)
    {
      result = (uint64_t)sub_23DE55BFC();
      goto LABEL_22;
    }
    sub_23DE55DB4();
  }
  v11 = *v4;
  sub_23DE67010();
  sub_23DE66DAC();
  result = sub_23DE67028();
  v12 = -1 << *(_BYTE *)(v11 + 32);
  a3 = result & ~v12;
  v13 = v11 + 56;
  if (((*(_QWORD *)(v11 + 56 + ((a3 >> 3) & 0xFFFFFFFFFFFFF8)) >> a3) & 1) != 0)
  {
    v14 = *(_QWORD *)(v11 + 48);
    v15 = (_QWORD *)(v14 + 16 * a3);
    v16 = *v15 == v8 && v15[1] == a2;
    if (v16 || (result = sub_23DE66FC8(), (result & 1) != 0))
    {
LABEL_21:
      result = sub_23DE66FD4();
      __break(1u);
    }
    else
    {
      v17 = ~v12;
      while (1)
      {
        a3 = (a3 + 1) & v17;
        if (((*(_QWORD *)(v13 + ((a3 >> 3) & 0xFFFFFFFFFFFFF8)) >> a3) & 1) == 0)
          break;
        v18 = (_QWORD *)(v14 + 16 * a3);
        if (*v18 != v8 || v18[1] != a2)
        {
          result = sub_23DE66FC8();
          if ((result & 1) == 0)
            continue;
        }
        goto LABEL_21;
      }
    }
  }
LABEL_22:
  v20 = *v5;
  *(_QWORD *)(*v5 + 8 * (a3 >> 6) + 56) |= 1 << a3;
  v21 = (uint64_t *)(*(_QWORD *)(v20 + 48) + 16 * a3);
  *v21 = v8;
  v21[1] = a2;
  v22 = *(_QWORD *)(v20 + 16);
  v23 = __OFADD__(v22, 1);
  v24 = v22 + 1;
  if (v23)
    __break(1u);
  else
    *(_QWORD *)(v20 + 16) = v24;
  return result;
}

void *sub_23DE55BFC()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *result;
  uint64_t v6;
  unint64_t v7;
  int64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  int64_t v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t v16;
  _QWORD *v17;
  uint64_t v18;
  _QWORD *v19;
  int64_t v20;
  unint64_t v21;
  int64_t v22;

  v1 = v0;
  sub_23DE57DA4(0, &qword_25432B1B0, MEMORY[0x24BEE0D00], MEMORY[0x24BEE0D10], MEMORY[0x24BEE24D8]);
  v2 = *v0;
  v3 = sub_23DE66F08();
  v4 = v3;
  if (!*(_QWORD *)(v2 + 16))
  {
LABEL_26:
    result = (void *)swift_release();
    *v1 = v4;
    return result;
  }
  result = (void *)(v3 + 56);
  v6 = v2 + 56;
  v7 = (unint64_t)((1 << *(_BYTE *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 56 + 8 * v7)
    result = memmove(result, (const void *)(v2 + 56), 8 * v7);
  v9 = 0;
  *(_QWORD *)(v4 + 16) = *(_QWORD *)(v2 + 16);
  v10 = 1 << *(_BYTE *)(v2 + 32);
  v11 = -1;
  if (v10 < 64)
    v11 = ~(-1 << v10);
  v12 = v11 & *(_QWORD *)(v2 + 56);
  v13 = (unint64_t)(v10 + 63) >> 6;
  while (1)
  {
    if (v12)
    {
      v14 = __clz(__rbit64(v12));
      v12 &= v12 - 1;
      v15 = v14 | (v9 << 6);
      goto LABEL_12;
    }
    v20 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v20 >= v13)
      goto LABEL_26;
    v21 = *(_QWORD *)(v6 + 8 * v20);
    ++v9;
    if (!v21)
    {
      v9 = v20 + 1;
      if (v20 + 1 >= v13)
        goto LABEL_26;
      v21 = *(_QWORD *)(v6 + 8 * v9);
      if (!v21)
        break;
    }
LABEL_25:
    v12 = (v21 - 1) & v21;
    v15 = __clz(__rbit64(v21)) + (v9 << 6);
LABEL_12:
    v16 = 16 * v15;
    v17 = (_QWORD *)(*(_QWORD *)(v2 + 48) + v16);
    v18 = v17[1];
    v19 = (_QWORD *)(*(_QWORD *)(v4 + 48) + v16);
    *v19 = *v17;
    v19[1] = v18;
    result = (void *)swift_bridgeObjectRetain();
  }
  v22 = v20 + 2;
  if (v22 >= v13)
    goto LABEL_26;
  v21 = *(_QWORD *)(v6 + 8 * v22);
  if (v21)
  {
    v9 = v22;
    goto LABEL_25;
  }
  while (1)
  {
    v9 = v22 + 1;
    if (__OFADD__(v22, 1))
      break;
    if (v9 >= v13)
      goto LABEL_26;
    v21 = *(_QWORD *)(v6 + 8 * v9);
    ++v22;
    if (v21)
      goto LABEL_25;
  }
LABEL_28:
  __break(1u);
  return result;
}

uint64_t sub_23DE55DB4()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t result;
  int64_t v11;
  unint64_t v12;
  _QWORD *v13;
  unint64_t v14;
  unint64_t v15;
  int64_t v16;
  unint64_t v17;
  int64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  unint64_t v24;
  char v25;
  unint64_t v26;
  BOOL v27;
  uint64_t v28;
  int64_t v29;

  v1 = v0;
  v2 = *v0;
  sub_23DE57DA4(0, &qword_25432B1B0, MEMORY[0x24BEE0D00], MEMORY[0x24BEE0D10], MEMORY[0x24BEE24D8]);
  v3 = sub_23DE66F14();
  v4 = v3;
  if (!*(_QWORD *)(v2 + 16))
  {
    result = swift_release();
LABEL_32:
    *v1 = v4;
    return result;
  }
  v5 = 1 << *(_BYTE *)(v2 + 32);
  v6 = v2 + 56;
  if (v5 < 64)
    v7 = ~(-1 << v5);
  else
    v7 = -1;
  v8 = v7 & *(_QWORD *)(v2 + 56);
  v29 = (unint64_t)(v5 + 63) >> 6;
  v9 = v3 + 56;
  result = swift_retain_n();
  v11 = 0;
  while (1)
  {
    if (v8)
    {
      v14 = __clz(__rbit64(v8));
      v8 &= v8 - 1;
      v15 = v14 | (v11 << 6);
      goto LABEL_21;
    }
    v16 = v11 + 1;
    if (__OFADD__(v11, 1))
    {
LABEL_33:
      __break(1u);
      goto LABEL_34;
    }
    if (v16 >= v29)
      goto LABEL_30;
    v17 = *(_QWORD *)(v6 + 8 * v16);
    ++v11;
    if (!v17)
    {
      v11 = v16 + 1;
      if (v16 + 1 >= v29)
        goto LABEL_30;
      v17 = *(_QWORD *)(v6 + 8 * v11);
      if (!v17)
      {
        v18 = v16 + 2;
        if (v18 >= v29)
        {
LABEL_30:
          result = swift_release_n();
          v1 = v0;
          goto LABEL_32;
        }
        v17 = *(_QWORD *)(v6 + 8 * v18);
        v11 = v18;
        if (!v17)
          break;
      }
    }
LABEL_20:
    v8 = (v17 - 1) & v17;
    v15 = __clz(__rbit64(v17)) + (v11 << 6);
LABEL_21:
    v19 = (uint64_t *)(*(_QWORD *)(v2 + 48) + 16 * v15);
    v20 = *v19;
    v21 = v19[1];
    sub_23DE67010();
    swift_bridgeObjectRetain();
    sub_23DE66DAC();
    result = sub_23DE67028();
    v22 = -1 << *(_BYTE *)(v4 + 32);
    v23 = result & ~v22;
    v24 = v23 >> 6;
    if (((-1 << v23) & ~*(_QWORD *)(v9 + 8 * (v23 >> 6))) != 0)
    {
      v12 = __clz(__rbit64((-1 << v23) & ~*(_QWORD *)(v9 + 8 * (v23 >> 6)))) | v23 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v25 = 0;
      v26 = (unint64_t)(63 - v22) >> 6;
      do
      {
        if (++v24 == v26 && (v25 & 1) != 0)
        {
          __break(1u);
          goto LABEL_33;
        }
        v27 = v24 == v26;
        if (v24 == v26)
          v24 = 0;
        v25 |= v27;
        v28 = *(_QWORD *)(v9 + 8 * v24);
      }
      while (v28 == -1);
      v12 = __clz(__rbit64(~v28)) + (v24 << 6);
    }
    *(_QWORD *)(v9 + ((v12 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v12;
    v13 = (_QWORD *)(*(_QWORD *)(v4 + 48) + 16 * v12);
    *v13 = v20;
    v13[1] = v21;
    ++*(_QWORD *)(v4 + 16);
  }
  while (1)
  {
    v11 = v18 + 1;
    if (__OFADD__(v18, 1))
      break;
    if (v11 >= v29)
      goto LABEL_30;
    v17 = *(_QWORD *)(v6 + 8 * v11);
    ++v18;
    if (v17)
      goto LABEL_20;
  }
LABEL_34:
  __break(1u);
  return result;
}

uint64_t sub_23DE56058(uint64_t *a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t result;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  _QWORD *v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  void (*v20)(char *, uint64_t);
  char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  char *v25;
  int v26;
  char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  uint64_t v35;
  _QWORD *v36;
  uint64_t v37;
  uint64_t v38;
  char *v39;
  char v40;
  void (*v41)(char *, uint64_t);
  char *v42;
  uint64_t v43;
  uint64_t v44;
  unint64_t v45;
  unint64_t v46;
  uint64_t v47;
  char *v48;
  char *v49;
  unint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  char v54;
  char *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  BOOL v61;
  unint64_t v62;
  char *v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  char *v68;
  uint64_t v69;
  uint64_t v70;
  BOOL v71;
  uint64_t v72;
  char v73;
  char *v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  BOOL v78;
  uint64_t v79;
  uint64_t v80;
  char *v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  char *v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  unint64_t v89;
  char *v90;
  char *v91;
  uint64_t v92;
  char *v93;
  uint64_t v94;
  uint64_t v95;
  unint64_t v96;
  char *v97;
  uint64_t v98;
  uint64_t v99;
  unint64_t v100;
  char *v101;
  char *v102;
  uint64_t v103;
  uint64_t v104;
  char *v105;
  unint64_t v106;
  uint64_t v107;
  char *v108;
  uint64_t *v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  _QWORD *v116;
  char *v117;
  uint64_t v118;
  uint64_t v119;
  char *v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;

  v121 = sub_23DE666F8();
  v119 = *(_QWORD *)(v121 - 8);
  v3 = MEMORY[0x24BDAC7A8](v121);
  v120 = (char *)&v107 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v3);
  v6 = (char *)&v107 - v5;
  v7 = a1[1];
  result = sub_23DE66FA4();
  if (result >= v7)
  {
    if (v7 < 0)
      goto LABEL_133;
    if (v7)
      return sub_23DE568B0(0, v7, 1, a1);
    return result;
  }
  if (v7 >= 0)
    v9 = v7;
  else
    v9 = v7 + 1;
  if (v7 < -1)
    goto LABEL_141;
  v112 = result;
  v118 = v1;
  v109 = a1;
  if (v7 < 2)
  {
    v12 = (char *)MEMORY[0x24BEE4AF8];
    v123 = MEMORY[0x24BEE4AF8];
    v117 = (char *)((MEMORY[0x24BEE4AF8] & 0xFFFFFFFFFFFFFF8) + 32);
    if (v7 != 1)
    {
      v16 = *(_QWORD *)(MEMORY[0x24BEE4AF8] + 16);
LABEL_99:
      v98 = v118;
      if (v16 >= 2)
      {
        v99 = *v109;
        do
        {
          v100 = v16 - 2;
          if (v16 < 2)
            goto LABEL_128;
          if (!v99)
            goto LABEL_140;
          v101 = v12;
          v102 = v12 + 32;
          v103 = *(_QWORD *)&v12[16 * v100 + 32];
          v104 = *(_QWORD *)&v12[16 * v16 + 24];
          sub_23DE56A44((char *)(v99 + 8 * v103), (char *)(v99 + 8 * *(_QWORD *)&v102[16 * v16 - 16]), (char *)(v99 + 8 * v104), v117);
          if (v98)
            break;
          if (v104 < v103)
            goto LABEL_129;
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
            v101 = sub_23DE56FDC((uint64_t)v101);
          if (v100 >= *((_QWORD *)v101 + 2))
            goto LABEL_130;
          v105 = &v101[16 * v100 + 32];
          *(_QWORD *)v105 = v103;
          *((_QWORD *)v105 + 1) = v104;
          v106 = *((_QWORD *)v101 + 2);
          if (v16 > v106)
            goto LABEL_131;
          v12 = v101;
          memmove(&v101[16 * v16 + 16], &v101[16 * v16 + 32], 16 * (v106 - v16));
          *((_QWORD *)v101 + 2) = v106 - 1;
          v16 = v106 - 1;
        }
        while (v106 > 2);
      }
LABEL_110:
      swift_bridgeObjectRelease();
      *(_QWORD *)((v123 & 0xFFFFFFFFFFFFF8) + 0x10) = 0;
      sub_23DE66DE8();
      return swift_bridgeObjectRelease();
    }
  }
  else
  {
    v10 = v9 >> 1;
    sub_23DE667C4();
    v11 = sub_23DE66DF4();
    *(_QWORD *)((v11 & 0xFFFFFFFFFFFFFF8) + 0x10) = v10;
    v117 = (char *)((v11 & 0xFFFFFFFFFFFFFF8) + 32);
    v123 = v11;
  }
  v13 = 0;
  v14 = *a1;
  v15 = *a1 + 16;
  v110 = *a1 - 8;
  v111 = v15;
  v12 = (char *)MEMORY[0x24BEE4AF8];
  v115 = v7;
  v122 = v14;
  while (1)
  {
    v17 = (uint64_t)v13;
    v18 = (uint64_t)v13 + 1;
    if ((uint64_t)v13 + 1 < v7)
    {
      swift_retain();
      swift_retain();
      sub_23DE667AC();
      v19 = v120;
      sub_23DE667AC();
      LODWORD(v116) = sub_23DE666D4();
      v20 = *(void (**)(char *, uint64_t))(v119 + 8);
      v21 = v19;
      v22 = v121;
      v20(v21, v121);
      v20(v6, v22);
      swift_release();
      v7 = v115;
      swift_release();
      v18 = v17 + 2;
      if (v17 + 2 < v7)
      {
        v114 = v17;
        v23 = v111 + 8 * v17;
        while (1)
        {
          v24 = v18;
          swift_retain();
          swift_retain();
          sub_23DE667AC();
          v25 = v120;
          sub_23DE667AC();
          v26 = sub_23DE666D4();
          v27 = v25;
          v28 = v121;
          v20(v27, v121);
          v20(v6, v28);
          swift_release();
          swift_release();
          if (((v116 ^ v26) & 1) != 0)
            break;
          v18 = v24 + 1;
          v23 += 8;
          v7 = v115;
          if (v115 == v24 + 1)
          {
            v18 = v115;
            goto LABEL_22;
          }
        }
        v7 = v115;
        v18 = v24;
LABEL_22:
        v17 = v114;
      }
      v29 = v122;
      if ((v116 & 1) != 0)
      {
        if (v18 < v17)
          goto LABEL_134;
        if (v17 < v18)
        {
          v30 = (uint64_t *)(v110 + 8 * v18);
          v31 = v18;
          v32 = v17;
          v33 = (uint64_t *)(v122 + 8 * v17);
          do
          {
            if (v32 != --v31)
            {
              if (!v29)
                goto LABEL_139;
              v34 = *v33;
              *v33 = *v30;
              *v30 = v34;
            }
            ++v32;
            --v30;
            ++v33;
          }
          while (v32 < v31);
        }
      }
    }
    if (v18 < v7)
    {
      if (__OFSUB__(v18, v17))
        goto LABEL_132;
      if (v18 - v17 < v112)
        break;
    }
LABEL_49:
    if (v18 < v17)
      goto LABEL_127;
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      v12 = sub_23DE56E40(0, *((_QWORD *)v12 + 2) + 1, 1, v12);
    v46 = *((_QWORD *)v12 + 2);
    v45 = *((_QWORD *)v12 + 3);
    v16 = v46 + 1;
    v47 = v122;
    if (v46 >= v45 >> 1)
    {
      v97 = sub_23DE56E40((char *)(v45 > 1), v46 + 1, 1, v12);
      v47 = v122;
      v12 = v97;
    }
    *((_QWORD *)v12 + 2) = v16;
    v48 = &v12[16 * v46 + 32];
    *(_QWORD *)v48 = v17;
    *((_QWORD *)v48 + 1) = v18;
    v116 = (_QWORD *)v18;
    if (v46)
    {
      v49 = v12 + 32;
      while (1)
      {
        v50 = v16 - 1;
        if (v16 >= 4)
        {
          v55 = &v49[16 * v16];
          v56 = *((_QWORD *)v55 - 8);
          v57 = *((_QWORD *)v55 - 7);
          v61 = __OFSUB__(v57, v56);
          v58 = v57 - v56;
          if (v61)
            goto LABEL_116;
          v60 = *((_QWORD *)v55 - 6);
          v59 = *((_QWORD *)v55 - 5);
          v61 = __OFSUB__(v59, v60);
          v53 = v59 - v60;
          v54 = v61;
          if (v61)
            goto LABEL_117;
          v62 = v16 - 2;
          v63 = &v49[16 * v16 - 32];
          v65 = *(_QWORD *)v63;
          v64 = *((_QWORD *)v63 + 1);
          v61 = __OFSUB__(v64, v65);
          v66 = v64 - v65;
          if (v61)
            goto LABEL_119;
          v61 = __OFADD__(v53, v66);
          v67 = v53 + v66;
          if (v61)
            goto LABEL_122;
          if (v67 >= v58)
          {
            v85 = &v49[16 * v50];
            v87 = *(_QWORD *)v85;
            v86 = *((_QWORD *)v85 + 1);
            v61 = __OFSUB__(v86, v87);
            v88 = v86 - v87;
            if (v61)
              goto LABEL_126;
            v78 = v53 < v88;
            goto LABEL_87;
          }
        }
        else
        {
          if (v16 != 3)
          {
            v79 = *((_QWORD *)v12 + 4);
            v80 = *((_QWORD *)v12 + 5);
            v61 = __OFSUB__(v80, v79);
            v72 = v80 - v79;
            v73 = v61;
            goto LABEL_81;
          }
          v52 = *((_QWORD *)v12 + 4);
          v51 = *((_QWORD *)v12 + 5);
          v61 = __OFSUB__(v51, v52);
          v53 = v51 - v52;
          v54 = v61;
        }
        if ((v54 & 1) != 0)
          goto LABEL_118;
        v62 = v16 - 2;
        v68 = &v49[16 * v16 - 32];
        v70 = *(_QWORD *)v68;
        v69 = *((_QWORD *)v68 + 1);
        v71 = __OFSUB__(v69, v70);
        v72 = v69 - v70;
        v73 = v71;
        if (v71)
          goto LABEL_121;
        v74 = &v49[16 * v50];
        v76 = *(_QWORD *)v74;
        v75 = *((_QWORD *)v74 + 1);
        v61 = __OFSUB__(v75, v76);
        v77 = v75 - v76;
        if (v61)
          goto LABEL_124;
        if (__OFADD__(v72, v77))
          goto LABEL_125;
        if (v72 + v77 >= v53)
        {
          v78 = v53 < v77;
LABEL_87:
          if (v78)
            v50 = v62;
          goto LABEL_89;
        }
LABEL_81:
        if ((v73 & 1) != 0)
          goto LABEL_120;
        v81 = &v49[16 * v50];
        v83 = *(_QWORD *)v81;
        v82 = *((_QWORD *)v81 + 1);
        v61 = __OFSUB__(v82, v83);
        v84 = v82 - v83;
        if (v61)
          goto LABEL_123;
        if (v84 < v72)
          goto LABEL_14;
LABEL_89:
        v89 = v50 - 1;
        if (v50 - 1 >= v16)
        {
          __break(1u);
LABEL_113:
          __break(1u);
LABEL_114:
          __break(1u);
LABEL_115:
          __break(1u);
LABEL_116:
          __break(1u);
LABEL_117:
          __break(1u);
LABEL_118:
          __break(1u);
LABEL_119:
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
LABEL_134:
          __break(1u);
LABEL_135:
          __break(1u);
          goto LABEL_136;
        }
        if (!v47)
          goto LABEL_138;
        v90 = v12;
        v91 = &v49[16 * v89];
        v92 = *(_QWORD *)v91;
        v93 = &v49[16 * v50];
        v94 = *((_QWORD *)v93 + 1);
        v95 = v118;
        sub_23DE56A44((char *)(v47 + 8 * *(_QWORD *)v91), (char *)(v47 + 8 * *(_QWORD *)v93), (char *)(v47 + 8 * v94), v117);
        v118 = v95;
        if (v95)
          goto LABEL_110;
        if (v94 < v92)
          goto LABEL_113;
        if (v50 > *((_QWORD *)v90 + 2))
          goto LABEL_114;
        *(_QWORD *)v91 = v92;
        *(_QWORD *)&v49[16 * v89 + 8] = v94;
        v96 = *((_QWORD *)v90 + 2);
        if (v50 >= v96)
          goto LABEL_115;
        v12 = v90;
        v16 = v96 - 1;
        memmove(&v49[16 * v50], v93 + 16, 16 * (v96 - 1 - v50));
        *((_QWORD *)v90 + 2) = v96 - 1;
        v47 = v122;
        if (v96 <= 2)
          goto LABEL_14;
      }
    }
    v16 = 1;
LABEL_14:
    v7 = v115;
    v13 = v116;
    if ((uint64_t)v116 >= v115)
      goto LABEL_99;
  }
  if (__OFADD__(v17, v112))
    goto LABEL_135;
  if (v17 + v112 >= v7)
    v35 = v7;
  else
    v35 = v17 + v112;
  if (v35 >= v17)
  {
    if (v18 != v35)
    {
      v113 = v35;
      v114 = v17;
      v108 = v12;
      v36 = (_QWORD *)(v110 + 8 * v18);
      do
      {
        v37 = v18;
        v38 = v114;
        v116 = v36;
        do
        {
          swift_retain();
          swift_retain();
          sub_23DE667AC();
          v39 = v120;
          sub_23DE667AC();
          v40 = sub_23DE666D4();
          v41 = *(void (**)(char *, uint64_t))(v119 + 8);
          v42 = v39;
          v43 = v121;
          v41(v42, v121);
          v41(v6, v43);
          swift_release();
          swift_release();
          if ((v40 & 1) == 0)
            break;
          if (!v122)
            goto LABEL_137;
          v44 = *v36;
          *v36 = v36[1];
          v36[1] = v44;
          --v36;
          ++v38;
        }
        while (v37 != v38);
        v18 = v37 + 1;
        v36 = v116 + 1;
      }
      while (v37 + 1 != v113);
      v18 = v113;
      v12 = v108;
      v17 = v114;
    }
    goto LABEL_49;
  }
LABEL_136:
  __break(1u);
LABEL_137:
  __break(1u);
LABEL_138:
  __break(1u);
LABEL_139:
  __break(1u);
LABEL_140:
  __break(1u);
LABEL_141:
  result = sub_23DE66F74();
  __break(1u);
  return result;
}

uint64_t sub_23DE568B0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t result;
  uint64_t v11;
  char *v12;
  _QWORD *v13;
  uint64_t v14;
  char *v15;
  char v16;
  void (*v17)(char *, uint64_t);
  char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  _QWORD *v24;
  char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;

  v23 = a1;
  v7 = sub_23DE666F8();
  v26 = *(_QWORD *)(v7 - 8);
  v27 = v7;
  v8 = MEMORY[0x24BDAC7A8](v7);
  v25 = (char *)&v21 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  result = MEMORY[0x24BDAC7A8](v8);
  v12 = (char *)&v21 - v11;
  v22 = a2;
  if (a3 != a2)
  {
    v28 = *a4;
    v13 = (_QWORD *)(v28 + 8 * a3 - 8);
LABEL_5:
    v14 = v23;
    v24 = v13;
    while (1)
    {
      swift_retain();
      swift_retain();
      sub_23DE667AC();
      v15 = v25;
      sub_23DE667AC();
      v16 = sub_23DE666D4();
      v17 = *(void (**)(char *, uint64_t))(v26 + 8);
      v18 = v15;
      v19 = v27;
      v17(v18, v27);
      v17(v12, v19);
      swift_release();
      result = swift_release();
      if ((v16 & 1) == 0)
      {
LABEL_4:
        ++a3;
        v13 = v24 + 1;
        if (a3 == v22)
          return result;
        goto LABEL_5;
      }
      if (!v28)
        break;
      v20 = *v13;
      *v13 = v13[1];
      v13[1] = v20;
      --v13;
      if (a3 == ++v14)
        goto LABEL_4;
    }
    __break(1u);
  }
  return result;
}

uint64_t sub_23DE56A44(char *a1, char *a2, char *a3, char *a4)
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
  char *v17;
  char *v18;
  char *v19;
  char v20;
  void (*v21)(char *, uint64_t);
  char *v22;
  uint64_t v23;
  char *v24;
  char *v25;
  char *v26;
  char *v27;
  char *v28;
  char *v29;
  char *v30;
  char v31;
  void (*v32)(char *, uint64_t);
  char *v33;
  uint64_t v34;
  char *v35;
  unint64_t v36;
  uint64_t result;
  uint64_t v38;
  char *v39;
  char *v40;
  char *v41;
  char *v42;
  char *v43;
  char *v44;
  char *v45;
  uint64_t v46;
  uint64_t v47;
  char *v48;
  char *v49;
  char *v50;

  v8 = sub_23DE666F8();
  v46 = *(_QWORD *)(v8 - 8);
  v47 = v8;
  v9 = MEMORY[0x24BDAC7A8](v8);
  v45 = (char *)&v38 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v9);
  v43 = a3;
  v44 = (char *)&v38 - v11;
  v12 = a2 - a1;
  v13 = a2 - a1 + 7;
  if (a2 - a1 >= 0)
    v13 = a2 - a1;
  v14 = v13 >> 3;
  v15 = a3 - a2;
  v16 = v15 / 8;
  v50 = a1;
  v40 = a4;
  v49 = a4;
  if (v13 >> 3 >= v15 / 8)
  {
    if (v15 < -7)
      goto LABEL_43;
    v25 = v40;
    if (v40 != a2 || &a2[8 * v16] <= v40)
      memmove(v40, a2, 8 * v16);
    v26 = &v25[8 * v16];
    v48 = v26;
    v50 = a2;
    if (v15 < 8 || a1 >= a2)
      goto LABEL_42;
    v27 = v43 - 8;
    v28 = a2;
    v39 = a1;
    while (1)
    {
      v43 = a2;
      v41 = v26;
      v42 = v27 + 8;
      v26 -= 8;
      v28 -= 8;
      swift_retain();
      swift_retain();
      v29 = v44;
      sub_23DE667AC();
      v30 = v45;
      sub_23DE667AC();
      v31 = sub_23DE666D4();
      v32 = *(void (**)(char *, uint64_t))(v46 + 8);
      v33 = v30;
      v34 = v47;
      v32(v33, v47);
      v32(v29, v34);
      swift_release();
      swift_release();
      if ((v31 & 1) != 0)
      {
        v26 = v41;
        if (v42 != v43 || v27 >= v43)
          *(_QWORD *)v27 = *(_QWORD *)v28;
        v50 = v28;
      }
      else
      {
        v48 = v26;
        v28 = v43;
        if (v42 >= v41 && v27 < v41)
        {
          v36 = (unint64_t)v39;
          v35 = v40;
          if (v42 != v41)
            *(_QWORD *)v27 = *(_QWORD *)v26;
          goto LABEL_40;
        }
        *(_QWORD *)v27 = *(_QWORD *)v26;
      }
      v36 = (unint64_t)v39;
      v35 = v40;
LABEL_40:
      if (v26 > v35)
      {
        v27 -= 8;
        a2 = v28;
        if ((unint64_t)v28 > v36)
          continue;
      }
      goto LABEL_42;
    }
  }
  if (v12 >= -7)
  {
    v17 = v40;
    if (v40 != a1 || &a1[8 * v14] <= v40)
      memmove(v40, a1, 8 * v14);
    v42 = &v17[8 * v14];
    v48 = v42;
    if (v12 >= 8 && a2 < v43)
    {
      v18 = v44;
      do
      {
        swift_retain();
        swift_retain();
        sub_23DE667AC();
        v19 = v45;
        sub_23DE667AC();
        v20 = sub_23DE666D4();
        v21 = *(void (**)(char *, uint64_t))(v46 + 8);
        v22 = v19;
        v23 = v47;
        v21(v22, v47);
        v21(v18, v23);
        swift_release();
        swift_release();
        if ((v20 & 1) != 0)
        {
          v24 = a2 + 8;
          if (a1 < a2 || a1 >= v24 || a1 != a2)
            *(_QWORD *)a1 = *(_QWORD *)a2;
        }
        else
        {
          if (a1 != v17)
            *(_QWORD *)a1 = *(_QWORD *)v17;
          v17 += 8;
          v49 = v17;
          v24 = a2;
        }
        a1 += 8;
        v50 = a1;
        if (v17 >= v42)
          break;
        a2 = v24;
      }
      while (v24 < v43);
    }
LABEL_42:
    sub_23DE56F34((void **)&v50, (const void **)&v49, &v48);
    return 1;
  }
LABEL_43:
  result = sub_23DE66F8C();
  __break(1u);
  return result;
}

char *sub_23DE56E40(char *result, int64_t a2, char a3, char *a4)
{
  char v5;
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  int64_t v11;
  uint64_t v12;
  char *v13;
  char *v14;

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
    sub_23DE57D30();
    v10 = (char *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    v12 = v11 - 32;
    if (v11 < 32)
      v12 = v11 - 17;
    *((_QWORD *)v10 + 2) = v8;
    *((_QWORD *)v10 + 3) = 2 * (v12 >> 4);
  }
  else
  {
    v10 = (char *)MEMORY[0x24BEE4AF8];
  }
  v13 = v10 + 32;
  v14 = a4 + 32;
  if ((v5 & 1) != 0)
  {
    if (v10 != a4 || v13 >= &v14[16 * v8])
      memmove(v13, v14, 16 * v8);
    *((_QWORD *)a4 + 2) = 0;
  }
  else
  {
    memcpy(v13, v14, 16 * v8);
  }
  swift_bridgeObjectRelease();
  return v10;
}

char *sub_23DE56F34(void **a1, const void **a2, _QWORD *a3)
{
  char *v3;
  uint64_t v4;
  uint64_t v5;
  char *result;
  uint64_t v7;

  v3 = (char *)*a2;
  v4 = *a3 - (_QWORD)v3;
  v5 = v4 + 7;
  if (v4 >= 0)
    v5 = *a3 - (_QWORD)v3;
  if (v4 <= -8)
  {
    result = (char *)sub_23DE66F8C();
    __break(1u);
  }
  else
  {
    result = (char *)*a1;
    v7 = v5 >> 3;
    if (result != v3 || result >= &v3[8 * v7])
      return (char *)memmove(result, v3, 8 * v7);
  }
  return result;
}

char *sub_23DE56FDC(uint64_t a1)
{
  return sub_23DE56E40(0, *(_QWORD *)(a1 + 16), 0, (char *)a1);
}

uint64_t sub_23DE56FF0(unint64_t a1, uint64_t a2, unint64_t a3)
{
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t);
  unint64_t i;
  void (*v13)(_QWORD *);
  uint64_t *v14;
  uint64_t v15;
  uint64_t result;
  uint64_t (*v17[4])();

  v6 = a3 >> 62;
  if (a3 >> 62)
  {
    swift_bridgeObjectRetain();
    v7 = sub_23DE66F80();
    swift_bridgeObjectRelease();
    if (!v7)
      return a3;
  }
  else
  {
    v7 = *(_QWORD *)((a3 & 0xFFFFFFFFFFFFF8) + 0x10);
    if (!v7)
      return a3;
  }
  if (!a1)
    goto LABEL_19;
  v8 = a3 & 0xFFFFFFFFFFFFFF8;
  if (v6)
  {
    swift_bridgeObjectRetain();
    v10 = sub_23DE66F80();
    swift_bridgeObjectRelease();
    if (v10 <= a2)
    {
      if (v7 >= 1)
      {
        v11 = (uint64_t (*)(uint64_t))MEMORY[0x24BE45E08];
        sub_23DE4CF6C(0, &qword_256D0CD10, (uint64_t (*)(uint64_t))MEMORY[0x24BE45E08], MEMORY[0x24BEE1250]);
        sub_23DE57CE8(&qword_256D0CD18, &qword_256D0CD10, v11, MEMORY[0x24BEE12E0]);
        swift_bridgeObjectRetain();
        for (i = 0; i != v7; ++i)
        {
          v13 = sub_23DE5721C(v17, i, a3);
          v15 = *v14;
          swift_retain();
          ((void (*)(uint64_t (**)(), _QWORD))v13)(v17, 0);
          *(_QWORD *)(a1 + 8 * i) = v15;
        }
        swift_bridgeObjectRelease();
        return a3;
      }
      goto LABEL_18;
    }
LABEL_17:
    __break(1u);
LABEL_18:
    __break(1u);
LABEL_19:
    __break(1u);
    goto LABEL_20;
  }
  v9 = *(_QWORD *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10);
  if (v9 > a2)
  {
    __break(1u);
    goto LABEL_17;
  }
  if (v8 + 32 >= a1 + 8 * v9 || v8 + 32 + 8 * v9 <= a1)
  {
    sub_23DE667C4();
    swift_arrayInitWithCopy();
    return a3;
  }
LABEL_20:
  result = sub_23DE66F8C();
  __break(1u);
  return result;
}

void (*sub_23DE5721C(uint64_t (**a1)(), unint64_t a2, uint64_t a3))(_QWORD *a1)
{
  uint64_t (*v6)();

  v6 = (uint64_t (*)())malloc(0x28uLL);
  *a1 = v6;
  *((_QWORD *)v6 + 4) = sub_23DE5729C(v6, a2, a3);
  return sub_23DE57270;
}

void sub_23DE57270(_QWORD *a1)
{
  void *v1;

  v1 = (void *)*a1;
  (*(void (**)(_QWORD))(*a1 + 32))(*a1);
  free(v1);
}

uint64_t (*sub_23DE5729C(uint64_t (*result)(), unint64_t a2, uint64_t a3))()
{
  uint64_t *v3;
  uint64_t v4;

  v3 = (uint64_t *)result;
  if ((a3 & 0xC000000000000001) != 0)
  {
    v4 = MEMORY[0x242646220](a2, a3);
    goto LABEL_5;
  }
  if ((a2 & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else if (*(_QWORD *)((a3 & 0xFFFFFFFFFFFFF8) + 0x10) > a2)
  {
    v4 = swift_retain();
LABEL_5:
    *v3 = v4;
    return sub_23DE57308;
  }
  __break(1u);
  return result;
}

uint64_t sub_23DE57308()
{
  return swift_release();
}

void sub_23DE57310(unint64_t a1)
{
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    sub_23DE66F80();
    swift_bridgeObjectRelease();
  }
  JUMPOUT(0x24264622CLL);
}

uint64_t sub_23DE57378(uint64_t result)
{
  unint64_t v1;
  unint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t *i;
  uint64_t v9;
  uint64_t v10;
  char v11;
  unint64_t v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;

  v1 = *(_QWORD *)(result + 16);
  if (!v1)
    return MEMORY[0x24BEE4AF8];
  v2 = 0;
  v3 = result + 40;
  v4 = -(uint64_t)v1;
  v5 = MEMORY[0x24BEE4AF8];
  v15 = result + 40;
  v16 = *(_QWORD *)(result + 16);
  do
  {
    if (v2 <= v1)
      v6 = v1;
    else
      v6 = v2;
    v7 = -(uint64_t)v6;
    for (i = (uint64_t *)(v3 + 16 * v2++); ; i += 2)
    {
      if (v7 + v2 == 1)
      {
        __break(1u);
        return result;
      }
      v10 = *(i - 1);
      v9 = *i;
      swift_bridgeObjectRetain_n();
      v11 = sub_23DE555D8(&v17, v10, v9);
      swift_bridgeObjectRelease();
      if ((v11 & 1) != 0)
        break;
      result = swift_bridgeObjectRelease();
      ++v2;
      if (v4 + v2 == 1)
        return v5;
    }
    result = swift_isUniquelyReferenced_nonNull_native();
    v18 = v5;
    if ((result & 1) == 0)
    {
      result = sub_23DE55448(0, *(_QWORD *)(v5 + 16) + 1, 1);
      v5 = v18;
    }
    v13 = *(_QWORD *)(v5 + 16);
    v12 = *(_QWORD *)(v5 + 24);
    if (v13 >= v12 >> 1)
    {
      result = sub_23DE55448(v12 > 1, v13 + 1, 1);
      v5 = v18;
    }
    *(_QWORD *)(v5 + 16) = v13 + 1;
    v14 = v5 + 16 * v13;
    *(_QWORD *)(v14 + 32) = v10;
    *(_QWORD *)(v14 + 40) = v9;
    v3 = v15;
    v1 = v16;
  }
  while (v4 + v2);
  return v5;
}

uint64_t sub_23DE574E0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  sub_23DE4CF6C(0, qword_25432AAD0, (uint64_t (*)(uint64_t))type metadata accessor for MedmojiIconConfiguration, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1C68]);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_23DE5753C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  sub_23DE4CF6C(0, &qword_25432A770, (uint64_t (*)(uint64_t))MEMORY[0x24BDCE900], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1C68]);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
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

uint64_t sub_23DE575BC(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

void sub_23DE575F8(uint64_t a1, unint64_t *a2)
{
  unint64_t v3;
  uint64_t v4;

  if (!*a2)
  {
    v3 = sub_23DE66FBC();
    if (!v4)
      atomic_store(v3, a2);
  }
}

void sub_23DE5763C()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_25432AF40)
  {
    sub_23DE4CF6C(255, &qword_25432AF70, MEMORY[0x24BE45F28], MEMORY[0x24BDB9ED8]);
    sub_23DE576B4();
    v0 = sub_23DE66884();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_25432AF40);
  }
}

unint64_t sub_23DE576B4()
{
  unint64_t result;
  uint64_t v1;

  result = qword_25432AF68;
  if (!qword_25432AF68)
  {
    sub_23DE4CF6C(255, &qword_25432AF70, MEMORY[0x24BE45F28], MEMORY[0x24BDB9ED8]);
    result = MEMORY[0x2426465BC](MEMORY[0x24BDB9EE8], v1);
    atomic_store(result, (unint64_t *)&qword_25432AF68);
  }
  return result;
}

void sub_23DE57714()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_25432AF50)
  {
    sub_23DE5763C();
    sub_23DE57C58(255, &qword_25432B1F0);
    sub_23DE4CD44(&qword_25432AF38, (uint64_t (*)(uint64_t))sub_23DE5763C, MEMORY[0x24BDB94E0]);
    v0 = sub_23DE66890();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_25432AF50);
  }
}

void sub_23DE577C8()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_25432AF60)
  {
    sub_23DE57714();
    sub_23DE54B78();
    sub_23DE4CD44(&qword_25432AF48, (uint64_t (*)(uint64_t))sub_23DE57714, MEMORY[0x24BDB95F8]);
    sub_23DE4CD44(&qword_25432B1A8, (uint64_t (*)(uint64_t))sub_23DE54B78, MEMORY[0x24BEE5670]);
    v0 = sub_23DE6689C();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_25432AF60);
  }
}

uint64_t sub_23DE57890()
{
  return swift_deallocObject();
}

uint64_t sub_23DE578A0@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  sub_23DE57DEC();
  result = swift_allocError();
  *a1 = result;
  return result;
}

uint64_t sub_23DE578DC()
{
  swift_weakDestroy();
  return swift_deallocObject();
}

uint64_t sub_23DE57900()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;

  v1 = sub_23DE66CD4();
  v2 = *(_QWORD *)(v1 - 8);
  v3 = (*(unsigned __int8 *)(v2 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  swift_release();
  (*(void (**)(unint64_t, uint64_t))(v2 + 8))(v0 + v3, v1);
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_23DE5799C(uint64_t *a1)
{
  uint64_t v1;
  uint64_t v3;
  unint64_t v4;
  unint64_t v5;

  v3 = *(_QWORD *)(sub_23DE66CD4() - 8);
  v4 = (*(unsigned __int8 *)(v3 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  v5 = (*(_QWORD *)(v3 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8;
  return sub_23DE52100(a1, *(_QWORD *)(v1 + 16), v1 + v4, *(void (**)(_QWORD))(v1 + v5), *(_QWORD *)(v1 + v5 + 8), *(_QWORD *)(v1 + ((v5 + 23) & 0xFFFFFFFFFFFFF8)));
}

uint64_t sub_23DE57A00()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;

  v1 = sub_23DE666F8();
  v2 = *(_QWORD *)(v1 - 8);
  v3 = (*(unsigned __int8 *)(v2 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  v4 = *(_QWORD *)(v2 + 64);
  v5 = sub_23DE66CD4();
  v6 = *(_QWORD *)(v5 - 8);
  v7 = (v3 + v4 + *(unsigned __int8 *)(v6 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80);
  swift_release();

  (*(void (**)(unint64_t, uint64_t))(v2 + 8))(v0 + v3, v1);
  (*(void (**)(unint64_t, uint64_t))(v6 + 8))(v0 + v7, v5);
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_23DE57AE4(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;

  v3 = *(_QWORD *)(sub_23DE666F8() - 8);
  v4 = (*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  v5 = *(_QWORD *)(v3 + 64);
  v6 = *(_QWORD *)(sub_23DE66CD4() - 8);
  v7 = (v4 + v5 + *(unsigned __int8 *)(v6 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80);
  v8 = (*(_QWORD *)(v6 + 64) + v7 + 7) & 0xFFFFFFFFFFFFFFF8;
  return sub_23DE52650(a1, *(_QWORD *)(v1 + 16), *(void **)(v1 + 24), v1 + v4, v1 + v7, *(void (**)(uint64_t))(v1 + v8), *(_QWORD *)(v1 + v8 + 8), *(_QWORD *)(v1 + ((v8 + 23) & 0xFFFFFFFFFFFFF8)));
}

uint64_t sub_23DE57B74(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t))
{
  uint64_t v4;

  sub_23DE4CF6C(0, a2, a3, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1C68]);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(a1, v4);
  return a1;
}

uint64_t sub_23DE57BB8(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata accessor for MedicationsWidgetEntry();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

void sub_23DE57BF4()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_25432B1E8)
  {
    sub_23DE57C58(255, &qword_25432B1F8);
    v0 = sub_23DE66FBC();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_25432B1E8);
  }
}

uint64_t sub_23DE57C58(uint64_t a1, unint64_t *a2)
{
  uint64_t result;

  result = *a2;
  if (!*a2)
  {
    result = swift_getExistentialTypeMetadata();
    atomic_store(result, a2);
  }
  return result;
}

unint64_t sub_23DE57CA4()
{
  unint64_t result;

  result = qword_25432B170;
  if (!qword_25432B170)
  {
    result = MEMORY[0x2426465BC](MEMORY[0x24BDCFB50], MEMORY[0x24BEE0D00]);
    atomic_store(result, (unint64_t *)&qword_25432B170);
  }
  return result;
}

uint64_t sub_23DE57CE8(unint64_t *a1, unint64_t *a2, uint64_t (*a3)(uint64_t), uint64_t a4)
{
  uint64_t result;
  uint64_t v7;

  result = *a1;
  if (!result)
  {
    sub_23DE4CF6C(255, a2, a3, MEMORY[0x24BEE1250]);
    result = MEMORY[0x2426465BC](a4, v7);
    atomic_store(result, a1);
  }
  return result;
}

void sub_23DE57D30()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_256D0CD20)
  {
    sub_23DE57DA4(255, &qword_256D0CD28, MEMORY[0x24BEE1768], MEMORY[0x24BEE1780], (uint64_t (*)(_QWORD, uint64_t, uint64_t))MEMORY[0x24BEE1B68]);
    v0 = sub_23DE66FBC();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_256D0CD20);
  }
}

void sub_23DE57DA4(uint64_t a1, unint64_t *a2, uint64_t a3, uint64_t a4, uint64_t (*a5)(_QWORD, uint64_t, uint64_t))
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

unint64_t sub_23DE57DEC()
{
  unint64_t result;

  result = qword_256D0CD30;
  if (!qword_256D0CD30)
  {
    result = MEMORY[0x2426465BC](&unk_23DE678B0, &type metadata for MedicationsWidgetTimelineGenerator.TimelineGeneratorError);
    atomic_store(result, (unint64_t *)&qword_256D0CD30);
  }
  return result;
}

uint64_t getEnumTagSinglePayload for MedicationsWidgetTimelineGenerator.TimelineGeneratorError(unsigned int *a1, int a2)
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

uint64_t storeEnumTagSinglePayload for MedicationsWidgetTimelineGenerator.TimelineGeneratorError(uint64_t a1, int a2, int a3)
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
    return ((uint64_t (*)(void))((char *)sub_23DE57EC8 + 4 * byte_23DE677D0[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_23DE57EE8 + 4 * byte_23DE677D5[v4]))();
}

_BYTE *sub_23DE57EC8(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_23DE57EE8(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_23DE57EF0(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_23DE57EF8(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_23DE57F00(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_23DE57F08(_DWORD *result)
{
  *result = 0;
  return result;
}

uint64_t sub_23DE57F14()
{
  return 0;
}

ValueMetadata *type metadata accessor for MedicationsWidgetTimelineGenerator.TimelineGeneratorError()
{
  return &type metadata for MedicationsWidgetTimelineGenerator.TimelineGeneratorError;
}

unint64_t sub_23DE57F30()
{
  unint64_t result;

  result = qword_256D0CD38;
  if (!qword_256D0CD38)
  {
    result = MEMORY[0x2426465BC](&unk_23DE67888, &type metadata for MedicationsWidgetTimelineGenerator.TimelineGeneratorError);
    atomic_store(result, (unint64_t *)&qword_256D0CD38);
  }
  return result;
}

_BYTE *__swift_memcpy1_1(_BYTE *result, _BYTE *a2)
{
  *result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for MedicationsWidgetTimelineGenerator.State(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int v6;
  BOOL v7;
  int v8;

  if (!a2)
    return 0;
  if (a2 < 0xFD)
    goto LABEL_17;
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
    if (v4)
      return (*a1 | (v4 << 8)) - 3;
  }
  else
  {
    if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
      return (*a1 | (v4 << 8)) - 3;
    }
    v4 = a1[1];
    if (a1[1])
      return (*a1 | (v4 << 8)) - 3;
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 4;
  v8 = v6 - 4;
  if (!v7)
    v8 = -1;
  return (v8 + 1);
}

uint64_t storeEnumTagSinglePayload for MedicationsWidgetTimelineGenerator.State(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_23DE5805C + 4 * byte_23DE677DF[v4]))();
  *a1 = a2 + 3;
  return ((uint64_t (*)(void))((char *)sub_23DE58090 + 4 * byte_23DE677DA[v4]))();
}

uint64_t sub_23DE58090(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_23DE58098(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x23DE580A0);
  return result;
}

uint64_t sub_23DE580AC(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x23DE580B4);
  *(_BYTE *)result = a2 + 3;
  return result;
}

uint64_t sub_23DE580B8(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23DE580C0(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23DE580CC(unsigned __int8 *a1)
{
  return *a1;
}

_BYTE *sub_23DE580D4(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

ValueMetadata *type metadata accessor for MedicationsWidgetTimelineGenerator.State()
{
  return &type metadata for MedicationsWidgetTimelineGenerator.State;
}

unint64_t sub_23DE580F0()
{
  unint64_t result;

  result = qword_256D0CD40;
  if (!qword_256D0CD40)
  {
    result = MEMORY[0x2426465BC](&unk_23DE67970, &type metadata for MedicationsWidgetTimelineGenerator.State);
    atomic_store(result, (unint64_t *)&qword_256D0CD40);
  }
  return result;
}

uint64_t sub_23DE58134()
{
  unint64_t v0;

  v0 = sub_23DE66F98();
  swift_bridgeObjectRelease();
  if (v0 >= 4)
    return 4;
  else
    return v0;
}

_QWORD *sub_23DE5817C(_QWORD *a1, _QWORD *a2, uint64_t a3)
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
  char *v15;
  uint64_t v16;
  int *v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  unsigned int (*v22)(char *, uint64_t, uint64_t);
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  char *v26;
  char *v27;
  uint64_t v28;
  uint64_t v29;
  char *v30;
  char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  char *__dst;
  uint64_t v37;
  _QWORD *v38;

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
    sub_23DE4CF6C(0, &qword_25432AB30, (uint64_t (*)(uint64_t))MEMORY[0x24BDFAF10], MEMORY[0x24BDEB560]);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v7 = sub_23DE66CD4();
      (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a1, a2, v7);
    }
    else
    {
      *a1 = *a2;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
    v9 = *(int *)(a3 + 20);
    v10 = (_QWORD *)((char *)a1 + v9);
    v11 = (_QWORD *)((char *)a2 + v9);
    sub_23DE4CF6C(0, &qword_25432AF78, (uint64_t (*)(uint64_t))MEMORY[0x24BDFADE0], MEMORY[0x24BDEB560]);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v12 = sub_23DE66CC8();
      (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v12 - 8) + 16))(v10, v11, v12);
    }
    else
    {
      *v10 = *v11;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
    v37 = a3;
    v38 = a2;
    v13 = *(int *)(a3 + 24);
    v14 = (_QWORD *)((char *)a1 + v13);
    v15 = (char *)a2 + v13;
    v16 = *(_QWORD *)((char *)a2 + v13 + 8);
    *v14 = *(_QWORD *)((char *)a2 + v13);
    v14[1] = v16;
    v14[2] = *(_QWORD *)((char *)a2 + v13 + 16);
    v17 = (int *)type metadata accessor for MedicationsWidgetViewModel();
    v18 = v17[6];
    __dst = (char *)v14 + v18;
    v19 = &v15[v18];
    v20 = type metadata accessor for MedmojiIconConfiguration();
    v21 = *(_QWORD *)(v20 - 8);
    v22 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v21 + 48);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    if (v22(v19, 1, v20))
    {
      sub_23DE4CF6C(0, qword_25432AAD0, (uint64_t (*)(uint64_t))type metadata accessor for MedmojiIconConfiguration, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1C68]);
      memcpy(__dst, v19, *(_QWORD *)(*(_QWORD *)(v23 - 8) + 64));
    }
    else
    {
      v24 = sub_23DE66818();
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v24 - 8) + 16))(__dst, v19, v24);
      v25 = *(int *)(v20 + 20);
      v26 = &__dst[v25];
      v27 = &v19[v25];
      v28 = sub_23DE667DC();
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v28 - 8) + 16))(v26, v27, v28);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v21 + 56))(__dst, 0, 1, v20);
    }
    *((_BYTE *)v14 + v17[7]) = v15[v17[7]];
    v29 = v17[8];
    v30 = (char *)v14 + v29;
    v31 = &v15[v29];
    v32 = sub_23DE666F8();
    v33 = *(_QWORD *)(v32 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v33 + 48))(v31, 1, v32))
    {
      sub_23DE4CF6C(0, &qword_25432A770, (uint64_t (*)(uint64_t))MEMORY[0x24BDCE900], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1C68]);
      memcpy(v30, v31, *(_QWORD *)(*(_QWORD *)(v34 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v33 + 16))(v30, v31, v32);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v33 + 56))(v30, 0, 1, v32);
    }
    *((_BYTE *)a1 + *(int *)(v37 + 28)) = *((_BYTE *)v38 + *(int *)(v37 + 28));
  }
  return a1;
}

uint64_t sub_23DE584D4(uint64_t a1, uint64_t a2)
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
  uint64_t v15;
  uint64_t v16;
  uint64_t result;

  sub_23DE4CF6C(0, &qword_25432AB30, (uint64_t (*)(uint64_t))MEMORY[0x24BDFAF10], MEMORY[0x24BDEB560]);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v4 = sub_23DE66CD4();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(a1, v4);
  }
  else
  {
    swift_release();
  }
  v5 = a1 + *(int *)(a2 + 20);
  sub_23DE4CF6C(0, &qword_25432AF78, (uint64_t (*)(uint64_t))MEMORY[0x24BDFADE0], MEMORY[0x24BDEB560]);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v6 = sub_23DE66CC8();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 8))(v5, v6);
  }
  else
  {
    swift_release();
  }
  v7 = a1 + *(int *)(a2 + 24);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v8 = type metadata accessor for MedicationsWidgetViewModel();
  v9 = v7 + *(int *)(v8 + 24);
  v10 = type metadata accessor for MedmojiIconConfiguration();
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 48))(v9, 1, v10))
  {
    v11 = sub_23DE66818();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 8))(v9, v11);
    v12 = v9 + *(int *)(v10 + 20);
    v13 = sub_23DE667DC();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v13 - 8) + 8))(v12, v13);
  }
  v14 = v7 + *(int *)(v8 + 32);
  v15 = sub_23DE666F8();
  v16 = *(_QWORD *)(v15 - 8);
  result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v16 + 48))(v14, 1, v15);
  if (!(_DWORD)result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(v16 + 8))(v14, v15);
  return result;
}

_QWORD *sub_23DE5869C(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  _QWORD *v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  char *v13;
  uint64_t v14;
  int *v15;
  uint64_t v16;
  char *v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  unsigned int (*v21)(char *, uint64_t, uint64_t);
  uint64_t v22;
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
  uint64_t v33;
  uint64_t v35;
  _QWORD *v36;
  _QWORD *v37;

  sub_23DE4CF6C(0, &qword_25432AB30, (uint64_t (*)(uint64_t))MEMORY[0x24BDFAF10], MEMORY[0x24BDEB560]);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v6 = sub_23DE66CD4();
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
  sub_23DE4CF6C(0, &qword_25432AF78, (uint64_t (*)(uint64_t))MEMORY[0x24BDFADE0], MEMORY[0x24BDEB560]);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v10 = sub_23DE66CC8();
    (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v10 - 8) + 16))(v8, v9, v10);
  }
  else
  {
    *v8 = *v9;
    swift_retain();
  }
  swift_storeEnumTagMultiPayload();
  v35 = a3;
  v36 = a2;
  v11 = *(int *)(a3 + 24);
  v37 = a1;
  v12 = (_QWORD *)((char *)a1 + v11);
  v13 = (char *)a2 + v11;
  v14 = *(_QWORD *)((char *)a2 + v11 + 8);
  *v12 = *(_QWORD *)((char *)a2 + v11);
  v12[1] = v14;
  v12[2] = *(_QWORD *)((char *)a2 + v11 + 16);
  v15 = (int *)type metadata accessor for MedicationsWidgetViewModel();
  v16 = v15[6];
  v17 = (char *)v12 + v16;
  v18 = &v13[v16];
  v19 = type metadata accessor for MedmojiIconConfiguration();
  v20 = *(_QWORD *)(v19 - 8);
  v21 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v20 + 48);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  if (v21(v18, 1, v19))
  {
    sub_23DE4CF6C(0, qword_25432AAD0, (uint64_t (*)(uint64_t))type metadata accessor for MedmojiIconConfiguration, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1C68]);
    memcpy(v17, v18, *(_QWORD *)(*(_QWORD *)(v22 - 8) + 64));
  }
  else
  {
    v23 = sub_23DE66818();
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v23 - 8) + 16))(v17, v18, v23);
    v24 = *(int *)(v19 + 20);
    v25 = &v17[v24];
    v26 = &v18[v24];
    v27 = sub_23DE667DC();
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v27 - 8) + 16))(v25, v26, v27);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v20 + 56))(v17, 0, 1, v19);
  }
  *((_BYTE *)v12 + v15[7]) = v13[v15[7]];
  v28 = v15[8];
  v29 = (char *)v12 + v28;
  v30 = &v13[v28];
  v31 = sub_23DE666F8();
  v32 = *(_QWORD *)(v31 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v32 + 48))(v30, 1, v31))
  {
    sub_23DE4CF6C(0, &qword_25432A770, (uint64_t (*)(uint64_t))MEMORY[0x24BDCE900], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1C68]);
    memcpy(v29, v30, *(_QWORD *)(*(_QWORD *)(v33 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v32 + 16))(v29, v30, v31);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v32 + 56))(v29, 0, 1, v31);
  }
  *((_BYTE *)v37 + *(int *)(v35 + 28)) = *((_BYTE *)v36 + *(int *)(v35 + 28));
  return v37;
}

_QWORD *sub_23DE589C8(_QWORD *a1, _QWORD *a2, uint64_t a3)
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
  char *v17;
  int *v18;
  uint64_t v19;
  char *v20;
  char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t (*v24)(char *, uint64_t, uint64_t);
  int v25;
  int v26;
  uint64_t (*v27)(uint64_t, uint64_t);
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  char *v31;
  char *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  char *v36;
  char *v37;
  uint64_t v38;
  uint64_t v39;
  char *v40;
  char *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t (*v44)(char *, uint64_t, uint64_t);
  int v45;
  int v46;
  _QWORD *v47;
  uint64_t v48;
  uint64_t v50;
  _QWORD *v51;

  if (a1 != a2)
  {
    v6 = (uint64_t (*)(uint64_t))MEMORY[0x24BDFAF10];
    v7 = (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BDEB560];
    sub_23DE5F0E0((uint64_t)a1, &qword_25432AB30, (uint64_t (*)(uint64_t))MEMORY[0x24BDFAF10], MEMORY[0x24BDEB560]);
    sub_23DE4CF6C(0, &qword_25432AB30, v6, v7);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v8 = sub_23DE66CD4();
      (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v8 - 8) + 16))(a1, a2, v8);
    }
    else
    {
      *a1 = *a2;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
    v9 = *(int *)(a3 + 20);
    v10 = (_QWORD *)((char *)a1 + v9);
    v11 = (_QWORD *)((char *)a2 + v9);
    v12 = (uint64_t (*)(uint64_t))MEMORY[0x24BDFADE0];
    v13 = (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BDEB560];
    sub_23DE5F0E0((uint64_t)a1 + v9, &qword_25432AF78, (uint64_t (*)(uint64_t))MEMORY[0x24BDFADE0], MEMORY[0x24BDEB560]);
    sub_23DE4CF6C(0, &qword_25432AF78, v12, v13);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v14 = sub_23DE66CC8();
      (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v14 - 8) + 16))(v10, v11, v14);
    }
    else
    {
      *v10 = *v11;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
  }
  v50 = a3;
  v51 = a2;
  v15 = *(int *)(a3 + 24);
  v16 = (_QWORD *)((char *)a1 + v15);
  v17 = (char *)a2 + v15;
  *v16 = *(_QWORD *)((char *)a2 + v15);
  v16[1] = *(_QWORD *)((char *)a2 + v15 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v16[2] = *((_QWORD *)v17 + 2);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v18 = (int *)type metadata accessor for MedicationsWidgetViewModel();
  v19 = v18[6];
  v20 = (char *)v16 + v19;
  v21 = &v17[v19];
  v22 = type metadata accessor for MedmojiIconConfiguration();
  v23 = *(_QWORD *)(v22 - 8);
  v24 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v23 + 48);
  v25 = v24(v20, 1, v22);
  v26 = v24(v21, 1, v22);
  if (v25)
  {
    if (v26)
    {
      v27 = (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1C68];
LABEL_14:
      sub_23DE4CF6C(0, qword_25432AAD0, (uint64_t (*)(uint64_t))type metadata accessor for MedmojiIconConfiguration, v27);
      memcpy(v20, v21, *(_QWORD *)(*(_QWORD *)(v28 - 8) + 64));
      goto LABEL_17;
    }
    v29 = sub_23DE66818();
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v29 - 8) + 16))(v20, v21, v29);
    v30 = *(int *)(v22 + 20);
    v31 = &v20[v30];
    v32 = &v21[v30];
    v33 = sub_23DE667DC();
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v33 - 8) + 16))(v31, v32, v33);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v23 + 56))(v20, 0, 1, v22);
  }
  else
  {
    if (v26)
    {
      sub_23DE513F8((uint64_t)v20, (uint64_t (*)(_QWORD))type metadata accessor for MedmojiIconConfiguration);
      v27 = (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1C68];
      goto LABEL_14;
    }
    v34 = sub_23DE66818();
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v34 - 8) + 24))(v20, v21, v34);
    v35 = *(int *)(v22 + 20);
    v36 = &v20[v35];
    v37 = &v21[v35];
    v38 = sub_23DE667DC();
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v38 - 8) + 24))(v36, v37, v38);
  }
LABEL_17:
  *((_BYTE *)v16 + v18[7]) = v17[v18[7]];
  v39 = v18[8];
  v40 = (char *)v16 + v39;
  v41 = &v17[v39];
  v42 = sub_23DE666F8();
  v43 = *(_QWORD *)(v42 - 8);
  v44 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v43 + 48);
  v45 = v44(v40, 1, v42);
  v46 = v44(v41, 1, v42);
  if (!v45)
  {
    v47 = v51;
    if (!v46)
    {
      (*(void (**)(char *, char *, uint64_t))(v43 + 24))(v40, v41, v42);
      goto LABEL_23;
    }
    (*(void (**)(char *, uint64_t))(v43 + 8))(v40, v42);
    goto LABEL_22;
  }
  v47 = v51;
  if (v46)
  {
LABEL_22:
    sub_23DE4CF6C(0, &qword_25432A770, (uint64_t (*)(uint64_t))MEMORY[0x24BDCE900], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1C68]);
    memcpy(v40, v41, *(_QWORD *)(*(_QWORD *)(v48 - 8) + 64));
    goto LABEL_23;
  }
  (*(void (**)(char *, char *, uint64_t))(v43 + 16))(v40, v41, v42);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v43 + 56))(v40, 0, 1, v42);
LABEL_23:
  *((_BYTE *)a1 + *(int *)(v50 + 28)) = *((_BYTE *)v47 + *(int *)(v50 + 28));
  return a1;
}

char *sub_23DE58E34(char *a1, char *a2, int *a3)
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
  int *v18;
  uint64_t v19;
  char *v20;
  char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  char *v27;
  int *v28;
  char *v29;
  char *v30;
  uint64_t v31;
  char *v32;
  uint64_t v33;
  char *v34;
  char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  char *v40;

  sub_23DE4CF6C(0, &qword_25432AB30, (uint64_t (*)(uint64_t))MEMORY[0x24BDFAF10], MEMORY[0x24BDEB560]);
  v7 = v6;
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v8 = sub_23DE66CD4();
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
  sub_23DE4CF6C(0, &qword_25432AF78, (uint64_t (*)(uint64_t))MEMORY[0x24BDFADE0], MEMORY[0x24BDEB560]);
  v13 = v12;
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v14 = sub_23DE66CC8();
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
  *(_OWORD *)v16 = *(_OWORD *)&a2[v15];
  *((_QWORD *)v16 + 2) = *(_QWORD *)&a2[v15 + 16];
  v18 = (int *)type metadata accessor for MedicationsWidgetViewModel();
  v19 = v18[6];
  v20 = &v16[v19];
  v21 = &v17[v19];
  v22 = type metadata accessor for MedmojiIconConfiguration();
  v23 = *(_QWORD *)(v22 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v23 + 48))(v21, 1, v22))
  {
    sub_23DE4CF6C(0, qword_25432AAD0, (uint64_t (*)(uint64_t))type metadata accessor for MedmojiIconConfiguration, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1C68]);
    memcpy(v20, v21, *(_QWORD *)(*(_QWORD *)(v24 - 8) + 64));
  }
  else
  {
    v25 = sub_23DE66818();
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v25 - 8) + 32))(v20, v21, v25);
    v26 = *(int *)(v22 + 20);
    v40 = a1;
    v27 = a2;
    v28 = a3;
    v29 = &v20[v26];
    v30 = &v21[v26];
    v31 = sub_23DE667DC();
    v32 = v29;
    a3 = v28;
    a2 = v27;
    a1 = v40;
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v31 - 8) + 32))(v32, v30, v31);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v23 + 56))(v20, 0, 1, v22);
  }
  v16[v18[7]] = v17[v18[7]];
  v33 = v18[8];
  v34 = &v16[v33];
  v35 = &v17[v33];
  v36 = sub_23DE666F8();
  v37 = *(_QWORD *)(v36 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v37 + 48))(v35, 1, v36))
  {
    sub_23DE4CF6C(0, &qword_25432A770, (uint64_t (*)(uint64_t))MEMORY[0x24BDCE900], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1C68]);
    memcpy(v34, v35, *(_QWORD *)(*(_QWORD *)(v38 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v37 + 32))(v34, v35, v36);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v37 + 56))(v34, 0, 1, v36);
  }
  a1[a3[7]] = a2[a3[7]];
  return a1;
}

char *sub_23DE59150(char *a1, char *a2, uint64_t a3)
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
  uint64_t v22;
  int *v23;
  uint64_t v24;
  char *v25;
  char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t (*v29)(char *, uint64_t, uint64_t);
  int v30;
  int v31;
  uint64_t (*v32)(uint64_t, uint64_t);
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  char *v36;
  char *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  char *v41;
  char *v42;
  uint64_t v43;
  uint64_t v44;
  char *v45;
  char *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t (*v49)(char *, uint64_t, uint64_t);
  int v50;
  int v51;
  char *v52;
  uint64_t v53;
  uint64_t v55;
  char *v56;

  if (a1 != a2)
  {
    v6 = (uint64_t (*)(uint64_t))MEMORY[0x24BDFAF10];
    v7 = (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BDEB560];
    sub_23DE5F0E0((uint64_t)a1, &qword_25432AB30, (uint64_t (*)(uint64_t))MEMORY[0x24BDFAF10], MEMORY[0x24BDEB560]);
    sub_23DE4CF6C(0, &qword_25432AB30, v6, v7);
    v9 = v8;
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v10 = sub_23DE66CD4();
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v10 - 8) + 32))(a1, a2, v10);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v9 - 8) + 64));
    }
    v11 = *(int *)(a3 + 20);
    v12 = &a1[v11];
    v13 = &a2[v11];
    v14 = (uint64_t (*)(uint64_t))MEMORY[0x24BDFADE0];
    v15 = (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BDEB560];
    sub_23DE5F0E0((uint64_t)&a1[v11], &qword_25432AF78, (uint64_t (*)(uint64_t))MEMORY[0x24BDFADE0], MEMORY[0x24BDEB560]);
    sub_23DE4CF6C(0, &qword_25432AF78, v14, v15);
    v17 = v16;
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v18 = sub_23DE66CC8();
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v18 - 8) + 32))(v12, v13, v18);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(v12, v13, *(_QWORD *)(*(_QWORD *)(v17 - 8) + 64));
    }
  }
  v55 = a3;
  v56 = a2;
  v19 = *(int *)(a3 + 24);
  v20 = &a1[v19];
  v21 = &a2[v19];
  v22 = *(_QWORD *)&a2[v19 + 8];
  *(_QWORD *)v20 = *(_QWORD *)&a2[v19];
  *((_QWORD *)v20 + 1) = v22;
  swift_bridgeObjectRelease();
  *((_QWORD *)v20 + 2) = *((_QWORD *)v21 + 2);
  swift_bridgeObjectRelease();
  v23 = (int *)type metadata accessor for MedicationsWidgetViewModel();
  v24 = v23[6];
  v25 = &v20[v24];
  v26 = &v21[v24];
  v27 = type metadata accessor for MedmojiIconConfiguration();
  v28 = *(_QWORD *)(v27 - 8);
  v29 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v28 + 48);
  v30 = v29(v25, 1, v27);
  v31 = v29(v26, 1, v27);
  if (v30)
  {
    if (v31)
    {
      v32 = (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1C68];
LABEL_13:
      sub_23DE4CF6C(0, qword_25432AAD0, (uint64_t (*)(uint64_t))type metadata accessor for MedmojiIconConfiguration, v32);
      memcpy(v25, v26, *(_QWORD *)(*(_QWORD *)(v33 - 8) + 64));
      goto LABEL_16;
    }
    v34 = sub_23DE66818();
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v34 - 8) + 32))(v25, v26, v34);
    v35 = *(int *)(v27 + 20);
    v36 = &v25[v35];
    v37 = &v26[v35];
    v38 = sub_23DE667DC();
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v38 - 8) + 32))(v36, v37, v38);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v28 + 56))(v25, 0, 1, v27);
  }
  else
  {
    if (v31)
    {
      sub_23DE513F8((uint64_t)v25, (uint64_t (*)(_QWORD))type metadata accessor for MedmojiIconConfiguration);
      v32 = (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1C68];
      goto LABEL_13;
    }
    v39 = sub_23DE66818();
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v39 - 8) + 40))(v25, v26, v39);
    v40 = *(int *)(v27 + 20);
    v41 = &v25[v40];
    v42 = &v26[v40];
    v43 = sub_23DE667DC();
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v43 - 8) + 40))(v41, v42, v43);
  }
LABEL_16:
  v20[v23[7]] = v21[v23[7]];
  v44 = v23[8];
  v45 = &v20[v44];
  v46 = &v21[v44];
  v47 = sub_23DE666F8();
  v48 = *(_QWORD *)(v47 - 8);
  v49 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v48 + 48);
  v50 = v49(v45, 1, v47);
  v51 = v49(v46, 1, v47);
  if (!v50)
  {
    v52 = v56;
    if (!v51)
    {
      (*(void (**)(char *, char *, uint64_t))(v48 + 40))(v45, v46, v47);
      goto LABEL_22;
    }
    (*(void (**)(char *, uint64_t))(v48 + 8))(v45, v47);
    goto LABEL_21;
  }
  v52 = v56;
  if (v51)
  {
LABEL_21:
    sub_23DE4CF6C(0, &qword_25432A770, (uint64_t (*)(uint64_t))MEMORY[0x24BDCE900], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1C68]);
    memcpy(v45, v46, *(_QWORD *)(*(_QWORD *)(v53 - 8) + 64));
    goto LABEL_22;
  }
  (*(void (**)(char *, char *, uint64_t))(v48 + 32))(v45, v46, v47);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v48 + 56))(v45, 0, 1, v47);
LABEL_22:
  a1[*(int *)(v55 + 28)] = v52[*(int *)(v55 + 28)];
  return a1;
}

uint64_t sub_23DE5959C()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_23DE595A8(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t, uint64_t);
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unsigned int v16;
  int v17;

  sub_23DE4CF6C(0, &qword_25432AF88, (uint64_t (*)(uint64_t))MEMORY[0x24BDFAF10], MEMORY[0x24BDEB580]);
  v7 = *(_QWORD *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == (_DWORD)a2)
  {
    v8 = v6;
    v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    v10 = a1;
    return v9(v10, a2, v8);
  }
  sub_23DE4CF6C(0, &qword_25432AF80, (uint64_t (*)(uint64_t))MEMORY[0x24BDFADE0], MEMORY[0x24BDEB580]);
  v12 = *(_QWORD *)(v11 - 8);
  if (*(_DWORD *)(v12 + 84) == (_DWORD)a2)
  {
    v8 = v11;
    v13 = a3[5];
LABEL_7:
    v10 = a1 + v13;
    v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v12 + 48);
    return v9(v10, a2, v8);
  }
  v14 = type metadata accessor for MedicationsWidgetViewModel();
  v12 = *(_QWORD *)(v14 - 8);
  if (*(_DWORD *)(v12 + 84) == (_DWORD)a2)
  {
    v8 = v14;
    v13 = a3[6];
    goto LABEL_7;
  }
  v16 = *(unsigned __int8 *)(a1 + a3[7]);
  if (v16 >= 2)
    v17 = ((v16 + 2147483646) & 0x7FFFFFFF) - 1;
  else
    v17 = -2;
  if (v17 < 0)
    v17 = -1;
  return (v17 + 1);
}

uint64_t sub_23DE596C0()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_23DE596CC(uint64_t a1, uint64_t a2, int a3, int *a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t result;

  sub_23DE4CF6C(0, &qword_25432AF88, (uint64_t (*)(uint64_t))MEMORY[0x24BDFAF10], MEMORY[0x24BDEB580]);
  v9 = *(_QWORD *)(v8 - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    v10 = v8;
    v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    v12 = a1;
    return v11(v12, a2, a2, v10);
  }
  sub_23DE4CF6C(0, &qword_25432AF80, (uint64_t (*)(uint64_t))MEMORY[0x24BDFADE0], MEMORY[0x24BDEB580]);
  v14 = *(_QWORD *)(v13 - 8);
  if (*(_DWORD *)(v14 + 84) == a3)
  {
    v10 = v13;
    v15 = a4[5];
LABEL_7:
    v12 = a1 + v15;
    v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v14 + 56);
    return v11(v12, a2, a2, v10);
  }
  result = type metadata accessor for MedicationsWidgetViewModel();
  v14 = *(_QWORD *)(result - 8);
  if (*(_DWORD *)(v14 + 84) == a3)
  {
    v10 = result;
    v15 = a4[6];
    goto LABEL_7;
  }
  *(_BYTE *)(a1 + a4[7]) = a2 + 2;
  return result;
}

uint64_t type metadata accessor for MedicationsWidgetCircularView(uint64_t a1)
{
  return sub_23DE5A920(a1, (uint64_t *)&unk_25432AEC8);
}

void sub_23DE597D8()
{
  unint64_t v0;
  unint64_t v1;
  unint64_t v2;

  sub_23DE4CF6C(319, &qword_25432AB30, (uint64_t (*)(uint64_t))MEMORY[0x24BDFAF10], MEMORY[0x24BDEB560]);
  if (v0 <= 0x3F)
  {
    sub_23DE4CF6C(319, &qword_25432AF78, (uint64_t (*)(uint64_t))MEMORY[0x24BDFADE0], MEMORY[0x24BDEB560]);
    if (v1 <= 0x3F)
    {
      type metadata accessor for MedicationsWidgetViewModel();
      if (v2 <= 0x3F)
        swift_initStructMetadata();
    }
  }
}

uint64_t sub_23DE598B0()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_23DE598C0(char a1, char a2)
{
  char v3;

  if (*(_QWORD *)&aNoneschepastdu_0[8 * a1] == *(_QWORD *)&aNoneschepastdu_0[8 * a2]
    && *(_QWORD *)&aUptodatealllog_0[8 * a1 + 16] == *(_QWORD *)&aUptodatealllog_0[8 * a2 + 16])
  {
    v3 = 1;
  }
  else
  {
    v3 = sub_23DE66FC8();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v3 & 1;
}

void sub_23DE59944(uint64_t a1)
{
  uint64_t (*v2)(uint64_t);
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;

  v11 = type metadata accessor for ImageView(0);
  MEMORY[0x24BDAC7A8](v11);
  sub_23DE5A7DC(0, &qword_25432B000, (uint64_t (*)(uint64_t))sub_23DE5A794, v2, MEMORY[0x24BDEF380]);
  MEMORY[0x24BDAC7A8](v3);
  sub_23DE5A794(0);
  MEMORY[0x24BDAC7A8](v4);
  sub_23DE5A770(0);
  v6 = MEMORY[0x24BDAC7A8](v5);
  MEMORY[0x24BDAC7A8](v6);
  v7 = sub_23DE66CA4();
  v8 = MEMORY[0x24BDAC7A8](v7);
  MEMORY[0x24BDAC7A8](v8);
  sub_23DE66C98();
  v9 = a1 + *(int *)(type metadata accessor for MedicationsWidgetCircularView(0) + 24);
  v10 = (char *)sub_23DE59B3C
      + 4
      * byte_23DE679E0[*(unsigned __int8 *)(v9 + *(int *)(type metadata accessor for MedicationsWidgetViewModel() + 28))];
  __asm { BR              X10 }
}

uint64_t sub_23DE59B3C()
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
  void (*v10)(uint64_t, uint64_t, uint64_t);
  uint64_t v11;
  uint64_t v12;
  void (*v13)(uint64_t, uint64_t);

  swift_bridgeObjectRelease();
  *(_QWORD *)v6 = sub_23DE66A28();
  *(_QWORD *)(v6 + 8) = 0;
  *(_BYTE *)(v6 + 16) = 1;
  sub_23DE5CFB0(0, &qword_25432AFA0, sub_23DE5A7B8);
  sub_23DE59E0C(*(_QWORD *)(v7 - 128), v6 + *(int *)(v8 + 44));
  sub_23DE51318(v6, v4, (uint64_t (*)(_QWORD))sub_23DE5A794);
  swift_storeEnumTagMultiPayload();
  sub_23DE4CD44(&qword_25432B0E0, (uint64_t (*)(uint64_t))sub_23DE5A794, MEMORY[0x24BDF4700]);
  sub_23DE4CD44(&qword_25432AF10, type metadata accessor for ImageView, (uint64_t)&unk_23DE67B28);
  sub_23DE66A70();
  sub_23DE513F8(v6, (uint64_t (*)(_QWORD))sub_23DE5A794);
  v9 = *(_QWORD *)(v7 - 104);
  v10 = *(void (**)(uint64_t, uint64_t, uint64_t))(v9 + 16);
  v10(v3, v5, v1);
  sub_23DE51318(v2, v0, (uint64_t (*)(_QWORD))sub_23DE5A770);
  v11 = *(_QWORD *)(v7 - 88);
  v10(v11, v3, v1);
  sub_23DE5A754(0);
  sub_23DE51318(v0, v11 + *(int *)(v12 + 48), (uint64_t (*)(_QWORD))sub_23DE5A770);
  sub_23DE513F8(v2, (uint64_t (*)(_QWORD))sub_23DE5A770);
  v13 = *(void (**)(uint64_t, uint64_t))(v9 + 8);
  v13(v5, v1);
  sub_23DE513F8(v0, (uint64_t (*)(_QWORD))sub_23DE5A770);
  return ((uint64_t (*)(uint64_t, uint64_t))v13)(v3, v1);
}

uint64_t sub_23DE59E0C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t (*v5)(uint64_t);
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  char v26;
  uint64_t v27;
  uint64_t (*v28)(uint64_t);
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;

  v43 = a2;
  sub_23DE5A954(0);
  v44 = v3;
  MEMORY[0x24BDAC7A8](v3);
  v38 = (uint64_t)&v37 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23DE5A7DC(0, &qword_25432B008, (uint64_t (*)(uint64_t))sub_23DE5A850, v5, MEMORY[0x24BDEF380]);
  v40 = v6;
  MEMORY[0x24BDAC7A8](v6);
  v42 = (uint64_t)&v37 - v7;
  sub_23DE5A850(0);
  v41 = v8;
  MEMORY[0x24BDAC7A8](v8);
  v10 = (char *)&v37 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v39 = type metadata accessor for ImageView(0);
  v11 = MEMORY[0x24BDAC7A8](v39);
  v13 = (char *)&v37 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v11);
  v15 = (uint64_t *)((char *)&v37 - v14);
  v16 = type metadata accessor for TimeView(0);
  v17 = MEMORY[0x24BDAC7A8](v16);
  v19 = (char *)&v37 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v17);
  v21 = (char *)&v37 - v20;
  v22 = type metadata accessor for MedicationsWidgetCircularView(0);
  v23 = v22;
  v24 = *(int *)(v22 + 28);
  v25 = a1;
  v26 = *(_BYTE *)(a1 + v24);
  if ((v26 & 1) != 0)
  {
    sub_23DE51318(v25 + *(int *)(v22 + 24), (uint64_t)v21, (uint64_t (*)(_QWORD))type metadata accessor for MedicationsWidgetViewModel);
    v21[*(int *)(v16 + 20)] = v26;
    v33 = sub_23DE66AF4();
    *v15 = swift_getKeyPath();
    sub_23DE4CF6C(0, &qword_25432AB30, (uint64_t (*)(uint64_t))MEMORY[0x24BDFAF10], MEMORY[0x24BDEB560]);
    swift_storeEnumTagMultiPayload();
    *(uint64_t *)((char *)v15 + *(int *)(v39 + 20)) = v33;
    v28 = type metadata accessor for TimeView;
    sub_23DE51318((uint64_t)v21, (uint64_t)v19, type metadata accessor for TimeView);
    sub_23DE51318((uint64_t)v15, (uint64_t)v13, type metadata accessor for ImageView);
    sub_23DE51318((uint64_t)v19, (uint64_t)v10, type metadata accessor for TimeView);
    sub_23DE5A86C(0);
    sub_23DE51318((uint64_t)v13, (uint64_t)&v10[*(int *)(v34 + 48)], type metadata accessor for ImageView);
    sub_23DE513F8((uint64_t)v13, type metadata accessor for ImageView);
    sub_23DE513F8((uint64_t)v19, type metadata accessor for TimeView);
    sub_23DE51318((uint64_t)v10, v42, (uint64_t (*)(_QWORD))sub_23DE5A850);
    swift_storeEnumTagMultiPayload();
    v35 = MEMORY[0x24BDF5428];
    sub_23DE4CD44(&qword_25432B120, (uint64_t (*)(uint64_t))sub_23DE5A850, MEMORY[0x24BDF5428]);
    sub_23DE4CD44(&qword_25432B130, (uint64_t (*)(uint64_t))sub_23DE5A954, v35);
    sub_23DE66A70();
    sub_23DE513F8((uint64_t)v10, (uint64_t (*)(_QWORD))sub_23DE5A850);
    sub_23DE513F8((uint64_t)v15, type metadata accessor for ImageView);
    v32 = (uint64_t)v21;
  }
  else
  {
    v27 = sub_23DE66AF4();
    *v15 = swift_getKeyPath();
    sub_23DE4CF6C(0, &qword_25432AB30, (uint64_t (*)(uint64_t))MEMORY[0x24BDFAF10], MEMORY[0x24BDEB560]);
    swift_storeEnumTagMultiPayload();
    *(uint64_t *)((char *)v15 + *(int *)(v39 + 20)) = v27;
    sub_23DE51318(v25 + *(int *)(v23 + 24), (uint64_t)v21, (uint64_t (*)(_QWORD))type metadata accessor for MedicationsWidgetViewModel);
    v21[*(int *)(v16 + 20)] = *(_BYTE *)(v25 + v24);
    v28 = type metadata accessor for ImageView;
    sub_23DE51318((uint64_t)v15, (uint64_t)v13, type metadata accessor for ImageView);
    sub_23DE51318((uint64_t)v21, (uint64_t)v19, type metadata accessor for TimeView);
    v29 = v38;
    sub_23DE51318((uint64_t)v13, v38, type metadata accessor for ImageView);
    sub_23DE5A970(0);
    sub_23DE51318((uint64_t)v19, v29 + *(int *)(v30 + 48), type metadata accessor for TimeView);
    sub_23DE513F8((uint64_t)v19, type metadata accessor for TimeView);
    sub_23DE513F8((uint64_t)v13, type metadata accessor for ImageView);
    sub_23DE51318(v29, v42, (uint64_t (*)(_QWORD))sub_23DE5A954);
    swift_storeEnumTagMultiPayload();
    v31 = MEMORY[0x24BDF5428];
    sub_23DE4CD44(&qword_25432B120, (uint64_t (*)(uint64_t))sub_23DE5A850, MEMORY[0x24BDF5428]);
    sub_23DE4CD44(&qword_25432B130, (uint64_t (*)(uint64_t))sub_23DE5A954, v31);
    sub_23DE66A70();
    sub_23DE513F8(v29, (uint64_t (*)(_QWORD))sub_23DE5A954);
    sub_23DE513F8((uint64_t)v21, type metadata accessor for TimeView);
    v32 = (uint64_t)v15;
  }
  return sub_23DE513F8(v32, v28);
}

uint64_t sub_23DE5A2F8(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  _BYTE *v4;
  _QWORD v6[2];

  sub_23DE5AAC0(0);
  MEMORY[0x24BDAC7A8](v2);
  v4 = (char *)v6 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  *v4 = sub_23DE66AB8();
  sub_23DE5ACB0();
  v6[1] = *(_QWORD *)(a1 + *(int *)(type metadata accessor for MedicationsWidgetCircularView(0) + 24) + 16);
  swift_getKeyPath();
  sub_23DE5EA04(0, &qword_25432B178, MEMORY[0x24BEE0D00], MEMORY[0x24BEE1250]);
  sub_23DE5ABF8();
  swift_bridgeObjectRetain();
  sub_23DE66C38();
  sub_23DE4CD44(&qword_25432AF90, (uint64_t (*)(uint64_t))sub_23DE5AAC0, MEMORY[0x24BDEBE40]);
  sub_23DE66B9C();
  return sub_23DE513F8((uint64_t)v4, (uint64_t (*)(_QWORD))sub_23DE5AAC0);
}

uint64_t sub_23DE5A474@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char v5;
  char v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char v10;
  char v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t result;

  sub_23DE4CD84();
  sub_23DE66ECC();
  v2 = sub_23DE66B3C();
  v4 = v3;
  v6 = v5 & 1;
  sub_23DE66BCC();
  v7 = sub_23DE66B18();
  v9 = v8;
  v11 = v10;
  v13 = v12;
  swift_release();
  sub_23DE5AD5C(v2, v4, v6);
  result = swift_bridgeObjectRelease();
  *(_QWORD *)a1 = v7;
  *(_QWORD *)(a1 + 8) = v9;
  *(_BYTE *)(a1 + 16) = v11 & 1;
  *(_QWORD *)(a1 + 24) = v13;
  return result;
}

uint64_t sub_23DE5A560()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _BYTE v9[16];
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  sub_23DE5A6C0();
  MEMORY[0x24BDAC7A8](v1);
  v3 = (uint64_t *)&v9[-((v2 + 15) & 0xFFFFFFFFFFFFFFF0)];
  *v3 = sub_23DE66C50();
  v3[1] = v4;
  sub_23DE5CFB0(0, &qword_25432AFB0, sub_23DE5A738);
  sub_23DE59944(v0);
  v10 = v0;
  sub_23DE5AA34(0);
  sub_23DE4CD44(&qword_25432B100, (uint64_t (*)(uint64_t))sub_23DE5A6C0, MEMORY[0x24BDF4750]);
  sub_23DE5AAC0(255);
  v6 = v5;
  v7 = sub_23DE4CD44(&qword_25432AF90, (uint64_t (*)(uint64_t))sub_23DE5AAC0, MEMORY[0x24BDEBE40]);
  v11 = v6;
  v12 = v7;
  swift_getOpaqueTypeConformance2();
  sub_23DE66B48();
  return sub_23DE513F8((uint64_t)v3, (uint64_t (*)(_QWORD))sub_23DE5A6C0);
}

void sub_23DE5A6C0()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_25432B108)
  {
    sub_23DE5A738(255);
    sub_23DE4CD44(&qword_25432B140, (uint64_t (*)(uint64_t))sub_23DE5A738, MEMORY[0x24BDF5428]);
    v0 = sub_23DE66C2C();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_25432B108);
  }
}

void sub_23DE5A738(uint64_t a1)
{
  sub_23DE4CF6C(a1, &qword_25432B148, (uint64_t (*)(uint64_t))sub_23DE5A754, MEMORY[0x24BDF53F0]);
}

void sub_23DE5A754(uint64_t a1)
{
  sub_23DE5A888(a1, &qword_25432B160, (void (*)(uint64_t))MEMORY[0x24BDFACB0], sub_23DE5A770);
}

void sub_23DE5A770(uint64_t a1)
{
  sub_23DE5A7DC(a1, &qword_25432B048, (uint64_t (*)(uint64_t))sub_23DE5A794, type metadata accessor for ImageView, MEMORY[0x24BDEF3B8]);
}

void sub_23DE5A794(uint64_t a1)
{
  sub_23DE5AAE4(a1, &qword_25432B0E8, (uint64_t (*)(uint64_t))sub_23DE5A7B8, (uint64_t (*)(void))sub_23DE5A98C, (uint64_t (*)(uint64_t, uint64_t, uint64_t))MEMORY[0x24BDF46E0]);
}

void sub_23DE5A7B8(uint64_t a1)
{
  sub_23DE5A7DC(a1, &qword_25432B058, (uint64_t (*)(uint64_t))sub_23DE5A850, (uint64_t (*)(uint64_t))sub_23DE5A954, MEMORY[0x24BDEF3B8]);
}

void sub_23DE5A7DC(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t), uint64_t (*a4)(uint64_t), uint64_t (*a5)(uint64_t, uint64_t, uint64_t))
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

void sub_23DE5A850(uint64_t a1)
{
  sub_23DE4CF6C(a1, &qword_25432B128, (uint64_t (*)(uint64_t))sub_23DE5A86C, MEMORY[0x24BDF53F0]);
}

void sub_23DE5A86C(uint64_t a1)
{
  sub_23DE5A888(a1, &qword_25432AF08, (void (*)(uint64_t))type metadata accessor for TimeView, (void (*)(uint64_t))type metadata accessor for ImageView);
}

void sub_23DE5A888(uint64_t a1, unint64_t *a2, void (*a3)(uint64_t), void (*a4)(uint64_t))
{
  unint64_t TupleTypeMetadata2;
  uint64_t v7;

  if (!*a2)
  {
    a3(255);
    a4(255);
    TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
    if (!v7)
      atomic_store(TupleTypeMetadata2, a2);
  }
}

uint64_t type metadata accessor for TimeView(uint64_t a1)
{
  return sub_23DE5A920(a1, (uint64_t *)&unk_25432AEF8);
}

uint64_t type metadata accessor for ImageView(uint64_t a1)
{
  return sub_23DE5A920(a1, (uint64_t *)&unk_25432AF18);
}

uint64_t sub_23DE5A920(uint64_t a1, uint64_t *a2)
{
  uint64_t result;

  result = *a2;
  if (!*a2)
    return swift_getSingletonMetadata();
  return result;
}

void sub_23DE5A954(uint64_t a1)
{
  sub_23DE4CF6C(a1, &qword_25432B138, (uint64_t (*)(uint64_t))sub_23DE5A970, MEMORY[0x24BDF53F0]);
}

void sub_23DE5A970(uint64_t a1)
{
  sub_23DE5A888(a1, &qword_25432AF28, (void (*)(uint64_t))type metadata accessor for ImageView, (void (*)(uint64_t))type metadata accessor for TimeView);
}

unint64_t sub_23DE5A98C()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD v4[2];

  result = qword_25432B050;
  if (!qword_25432B050)
  {
    sub_23DE5A7B8(255);
    v2 = v1;
    v3 = MEMORY[0x24BDF5428];
    v4[0] = sub_23DE4CD44(&qword_25432B120, (uint64_t (*)(uint64_t))sub_23DE5A850, MEMORY[0x24BDF5428]);
    v4[1] = sub_23DE4CD44(&qword_25432B130, (uint64_t (*)(uint64_t))sub_23DE5A954, v3);
    result = MEMORY[0x2426465BC](MEMORY[0x24BDEF3E0], v2, v4);
    atomic_store(result, (unint64_t *)&qword_25432B050);
  }
  return result;
}

uint64_t sub_23DE5AA2C()
{
  uint64_t v0;

  return sub_23DE5A2F8(*(_QWORD *)(v0 + 16));
}

void sub_23DE5AA34(uint64_t a1)
{
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;
  _QWORD v5[2];

  if (!qword_25432B0C8)
  {
    sub_23DE5AAC0(255);
    v5[0] = v2;
    v5[1] = sub_23DE4CD44(&qword_25432AF90, (uint64_t (*)(uint64_t))sub_23DE5AAC0, MEMORY[0x24BDEBE40]);
    v3 = MEMORY[0x242646598](a1, v5, MEMORY[0x24BDF29E0], 0);
    if (!v4)
      atomic_store(v3, (unint64_t *)&qword_25432B0C8);
  }
}

void sub_23DE5AAC0(uint64_t a1)
{
  sub_23DE5AAE4(a1, &qword_25432AF98, (uint64_t (*)(uint64_t))sub_23DE5AB54, (uint64_t (*)(void))sub_23DE5AC58, MEMORY[0x24BDEBE30]);
}

void sub_23DE5AAE4(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t), uint64_t (*a4)(void), uint64_t (*a5)(uint64_t, uint64_t, uint64_t))
{
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;

  if (!*a2)
  {
    v9 = a3(255);
    v10 = a4();
    v11 = a5(a1, v9, v10);
    if (!v12)
      atomic_store(v11, a2);
  }
}

void sub_23DE5AB54()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_25432B118)
  {
    sub_23DE5EA04(255, &qword_25432B178, MEMORY[0x24BEE0D00], MEMORY[0x24BEE1250]);
    sub_23DE5ABF8();
    v0 = sub_23DE66C44();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_25432B118);
  }
}

unint64_t sub_23DE5ABF8()
{
  unint64_t result;
  uint64_t v1;

  result = qword_25432B180;
  if (!qword_25432B180)
  {
    sub_23DE5EA04(255, &qword_25432B178, MEMORY[0x24BEE0D00], MEMORY[0x24BEE1250]);
    result = MEMORY[0x2426465BC](MEMORY[0x24BEE12D8], v1);
    atomic_store(result, (unint64_t *)&qword_25432B180);
  }
  return result;
}

unint64_t sub_23DE5AC58()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;

  result = qword_25432B110;
  if (!qword_25432B110)
  {
    sub_23DE5AB54();
    v2 = MEMORY[0x24BDF1F80];
    result = MEMORY[0x2426465BC](MEMORY[0x24BDF4A08], v1, &v2);
    atomic_store(result, (unint64_t *)&qword_25432B110);
  }
  return result;
}

void sub_23DE5ACB0()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_25432AFB8)
  {
    sub_23DE5AB54();
    sub_23DE5AD18();
    v0 = sub_23DE668E4();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_25432AFB8);
  }
}

unint64_t sub_23DE5AD18()
{
  unint64_t result;

  result = qword_256D0CD48;
  if (!qword_256D0CD48)
  {
    result = MEMORY[0x2426465BC](MEMORY[0x24BDEDC40], MEMORY[0x24BDEDC50]);
    atomic_store(result, (unint64_t *)&qword_256D0CD48);
  }
  return result;
}

uint64_t sub_23DE5AD5C(uint64_t a1, uint64_t a2, char a3)
{
  if ((a3 & 1) != 0)
    return swift_release();
  else
    return swift_bridgeObjectRelease();
}

uint64_t sub_23DE5AD6C()
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
  uint64_t v20;
  uint64_t (*v21)(uint64_t);
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
  char *v43;
  uint64_t v44;
  uint64_t v45;
  char *v46;
  uint64_t v47;
  char *v48;
  uint64_t v49;
  uint64_t v50;
  char *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  char *v55;
  uint64_t v56;
  uint64_t v57;
  void (*v58)(char *, char *, uint64_t);
  uint64_t v59;
  uint64_t v60;
  char *v61;
  char *v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  char *v66;
  char *v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  char *v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  char *v76;
  char v77;
  void (*v78)(char *, uint64_t);
  char *v79;
  uint64_t v80;
  void (*v81)(uint64_t *, _QWORD);
  uint64_t v82;
  char *v83;
  uint64_t v84;
  char *v85;
  uint64_t v86;
  char *v87;
  char *v88;
  char *v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  unsigned int (*v94)(uint64_t, uint64_t, uint64_t);
  uint64_t v95;
  char *v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  char *v100;
  char *v101;
  char v102;
  void (*v103)(char *, uint64_t);
  char *v104;
  uint64_t result;
  uint64_t v106;
  char *v107;
  uint64_t v108;
  char *v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  void (*v113)();
  char *v114;
  uint64_t v115;
  uint64_t v116;
  char *v117;
  uint64_t v118;
  char *v119;
  char *v120;
  uint64_t v121;
  uint64_t v122;
  char *v123;
  uint64_t v124;
  char *v125;
  uint64_t v126;
  uint64_t v127;
  char *v128;
  uint64_t v129;
  uint64_t v130;
  uint64_t v131;
  uint64_t v132;
  char *v133;
  uint64_t v134;
  char *v135;
  uint64_t v136;
  uint64_t v137;
  uint64_t v138;
  uint64_t v139;
  uint64_t v140;
  uint64_t v141;
  char *v142;
  char *v143;
  uint64_t v144;
  char *v145;
  uint64_t v146;
  char *v147;
  char *v148;
  char *v149;
  char *v150;
  char *v151;
  char *v152;
  uint64_t v153;
  char *v154;
  uint64_t v155;
  uint64_t v156;
  char *v157;
  uint64_t v158;
  uint64_t v159;
  char *v160;
  uint64_t v161;
  uint64_t v162;
  char *v163;
  uint64_t v164;
  char *v165;
  uint64_t v166;
  char *v167;
  uint64_t v168;
  char *v169;
  uint64_t v170;
  uint64_t v171;
  uint64_t v172;
  char *v173;
  uint64_t v174;
  uint64_t v175;
  uint64_t v176;

  sub_23DE5EDD8();
  v126 = v0;
  MEMORY[0x24BDAC7A8](v0);
  v125 = (char *)&v120 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  v131 = sub_23DE665C0();
  v130 = *(_QWORD *)(v131 - 8);
  MEMORY[0x24BDAC7A8](v131);
  v149 = (char *)&v120 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23DE5EE50();
  v124 = v3;
  MEMORY[0x24BDAC7A8](v3);
  v123 = (char *)&v120 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v136 = sub_23DE66518();
  v129 = *(_QWORD *)(v136 - 8);
  MEMORY[0x24BDAC7A8](v136);
  v135 = (char *)&v120 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v144 = sub_23DE6656C();
  MEMORY[0x24BDAC7A8](v144);
  v143 = (char *)&v120 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v134 = sub_23DE66614();
  v127 = *(_QWORD *)(v134 - 8);
  MEMORY[0x24BDAC7A8](v134);
  v133 = (char *)&v120 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23DE5EEC8();
  v132 = v8;
  MEMORY[0x24BDAC7A8](v8);
  v128 = (char *)&v120 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1C68];
  sub_23DE4CF6C(0, &qword_25432AE38, (uint64_t (*)(uint64_t))MEMORY[0x24BDCC138], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1C68]);
  MEMORY[0x24BDAC7A8](v11);
  v163 = (char *)&v120 - v12;
  sub_23DE5EF40();
  v161 = *(_QWORD *)(v13 - 8);
  v162 = v13;
  MEMORY[0x24BDAC7A8](v13);
  v160 = (char *)&v120 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = sub_23DE665FC();
  v158 = *(_QWORD *)(v15 - 8);
  v159 = v15;
  MEMORY[0x24BDAC7A8](v15);
  v157 = (char *)&v120 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v164 = sub_23DE66530();
  v172 = *(_QWORD *)(v164 - 8);
  v17 = MEMORY[0x24BDAC7A8](v164);
  v148 = (char *)&v120 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v17);
  v150 = (char *)&v120 - v19;
  v170 = sub_23DE66590();
  v174 = *(_QWORD *)(v170 - 8);
  MEMORY[0x24BDAC7A8](v170);
  v173 = (char *)&v120 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23DE4CF6C(0, &qword_25432AE50, v21, v10);
  MEMORY[0x24BDAC7A8](v22);
  v165 = (char *)&v120 - v23;
  v141 = sub_23DE6659C();
  v168 = *(_QWORD *)(v141 - 8);
  v24 = MEMORY[0x24BDAC7A8](v141);
  v169 = (char *)&v120 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v24);
  v167 = (char *)&v120 - v26;
  v166 = sub_23DE665A8();
  v154 = *(char **)(v166 - 8);
  MEMORY[0x24BDAC7A8](v166);
  v28 = (char *)&v120 - ((v27 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23DE5EF9C();
  v155 = v29;
  v30 = MEMORY[0x24BDAC7A8](v29);
  v151 = (char *)&v120 - ((v31 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v30);
  v171 = (uint64_t)&v120 - v32;
  v156 = sub_23DE666A4();
  v153 = *(_QWORD *)(v156 - 8);
  MEMORY[0x24BDAC7A8](v156);
  v152 = (char *)&v120 - ((v33 + 15) & 0xFFFFFFFFFFFFFFF0);
  v140 = sub_23DE665CC();
  v139 = *(_QWORD *)(v140 - 8);
  MEMORY[0x24BDAC7A8](v140);
  v145 = (char *)&v120 - ((v34 + 15) & 0xFFFFFFFFFFFFFFF0);
  v35 = sub_23DE66644();
  MEMORY[0x24BDAC7A8](v35);
  v147 = (char *)&v120 - ((v36 + 15) & 0xFFFFFFFFFFFFFFF0);
  v37 = sub_23DE66794();
  MEMORY[0x24BDAC7A8](v37);
  v38 = sub_23DE6677C();
  MEMORY[0x24BDAC7A8](v38);
  v142 = (char *)&v120 - ((v39 + 15) & 0xFFFFFFFFFFFFFFF0);
  v40 = sub_23DE66740();
  MEMORY[0x24BDAC7A8](v40);
  sub_23DE4CF6C(0, &qword_25432AE88, (uint64_t (*)(uint64_t))MEMORY[0x24BDCDEE8], v10);
  MEMORY[0x24BDAC7A8](v41);
  v43 = (char *)&v120 - v42;
  sub_23DE4CF6C(0, &qword_25432AE90, (uint64_t (*)(uint64_t))MEMORY[0x24BDCDF30], v10);
  MEMORY[0x24BDAC7A8](v44);
  v46 = (char *)&v120 - v45;
  v138 = sub_23DE666BC();
  v137 = *(_QWORD *)(v138 - 8);
  MEMORY[0x24BDAC7A8](v138);
  v48 = (char *)&v120 - ((v47 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23DE4CF6C(0, &qword_25432A770, (uint64_t (*)(uint64_t))MEMORY[0x24BDCE900], v10);
  MEMORY[0x24BDAC7A8](v49);
  v51 = (char *)&v120 - v50;
  v52 = sub_23DE666F8();
  v53 = *(_QWORD *)(v52 - 8);
  MEMORY[0x24BDAC7A8](v52);
  v55 = (char *)&v120 - ((v54 + 15) & 0xFFFFFFFFFFFFFFF0);
  v56 = type metadata accessor for MedicationsWidgetViewModel();
  sub_23DE5753C(v146 + *(int *)(v56 + 32), (uint64_t)v51);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v53 + 48))(v51, 1, v52) == 1)
  {
    sub_23DE5F0E0((uint64_t)v51, &qword_25432A770, (uint64_t (*)(uint64_t))MEMORY[0x24BDCE900], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1C68]);
    return 0;
  }
  v58 = *(void (**)(char *, char *, uint64_t))(v53 + 32);
  v122 = v52;
  v58(v55, v51, v52);
  v59 = sub_23DE6668C();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v59 - 8) + 56))(v46, 1, 1, v59);
  sub_23DE66674();
  v60 = sub_23DE66680();
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v60 - 8) + 56))(v43, 0, 1, v60);
  sub_23DE66710();
  sub_23DE66758();
  sub_23DE66788();
  sub_23DE66638();
  sub_23DE666B0();
  v61 = v152;
  v142 = v48;
  sub_23DE66668();
  v120 = v55;
  sub_23DE66698();
  (*(void (**)(char *, uint64_t))(v153 + 8))(v61, v156);
  sub_23DE665B4();
  v62 = v154;
  v63 = (uint64_t)v151;
  v64 = v166;
  v153 = *((_QWORD *)v154 + 2);
  ((void (*)(char *, char *, uint64_t))v153)(v151, v28, v166);
  v65 = sub_23DE4CD44(&qword_25432AE60, (uint64_t (*)(uint64_t))MEMORY[0x24BDCC4A8], MEMORY[0x24BDCC4C8]);
  v66 = v167;
  v156 = v65;
  sub_23DE66E00();
  v67 = (char *)*((_QWORD *)v62 + 1);
  v154 = v28;
  v152 = v67;
  ((void (*)(char *, uint64_t))v67)(v28, v64);
  v68 = v155;
  v69 = v168;
  v70 = v141;
  (*(void (**)(uint64_t, char *, uint64_t))(v168 + 32))(v63 + *(int *)(v155 + 36), v66, v141);
  v71 = v171;
  sub_23DE5F014(v63, v171, (uint64_t (*)(_QWORD))sub_23DE5EF9C);
  v72 = (char *)(v71 + *(int *)(v68 + 36));
  v155 = *(_QWORD *)(v69 + 16);
  LODWORD(v147) = *MEMORY[0x24BDCC0E8];
  v121 = v53;
  v73 = v64;
  v74 = v69;
  v75 = v70;
  v151 = v72;
  ((void (*)(char *, char *, uint64_t))v155)(v66, v72, v70);
  while (1)
  {
    v76 = v169;
    sub_23DE66E0C();
    sub_23DE4CD44(&qword_25432AE58, (uint64_t (*)(uint64_t))MEMORY[0x24BDCC498], MEMORY[0x24BDCC4A0]);
    v77 = sub_23DE66D70();
    v78 = *(void (**)(char *, uint64_t))(v74 + 8);
    v78(v76, v75);
    v79 = v66;
    v80 = v75;
    v78(v79, v75);
    if ((v77 & 1) != 0)
    {
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v174 + 56))(v165, 1, 1, v170);
LABEL_12:
      sub_23DE513F8(v71, (uint64_t (*)(_QWORD))sub_23DE5EF9C);
      v104 = v145;
      sub_23DE66560();
      sub_23DE4CD44(&qword_25432AE48, (uint64_t (*)(uint64_t))MEMORY[0x24BDCC290], MEMORY[0x24BDCC2A8]);
      v57 = sub_23DE66DD0();
      (*(void (**)(char *, uint64_t))(v139 + 8))(v104, v140);
      (*(void (**)(char *, uint64_t))(v137 + 8))(v142, v138);
      (*(void (**)(char *, uint64_t))(v121 + 8))(v120, v122);
      return v57;
    }
    v81 = (void (*)(uint64_t *, _QWORD))sub_23DE66E24();
    v82 = v174;
    v83 = v165;
    v84 = v170;
    (*(void (**)(char *))(v174 + 16))(v165);
    v81(&v175, 0);
    v85 = v154;
    ((void (*)(char *, uint64_t, uint64_t))v153)(v154, v71, v73);
    sub_23DE66E18();
    ((void (*)(char *, uint64_t))v152)(v85, v73);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v82 + 56))(v83, 0, 1, v84);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v82 + 48))(v83, 1, v84) == 1)
      goto LABEL_12;
    v86 = v80;
    v87 = v173;
    (*(void (**)(char *, char *, uint64_t))(v82 + 32))(v173, v83, v84);
    v88 = v157;
    sub_23DE66578();
    swift_getKeyPath();
    sub_23DE66548();
    v89 = v160;
    sub_23DE665F0();
    swift_release();
    (*(void (**)(char *, uint64_t))(v158 + 8))(v88, v159);
    swift_getKeyPath();
    sub_23DE5F09C();
    v90 = (uint64_t)v163;
    v91 = v82;
    v92 = v162;
    sub_23DE66620();
    swift_release();
    v93 = v172;
    (*(void (**)(char *, uint64_t))(v161 + 8))(v89, v92);
    v94 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v93 + 48);
    v95 = v164;
    if (v94(v90, 1, v164) == 1)
    {
      (*(void (**)(char *, uint64_t))(v91 + 8))(v87, v84);
      sub_23DE5F0E0(v90, &qword_25432AE38, (uint64_t (*)(uint64_t))MEMORY[0x24BDCC138], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1C68]);
      goto LABEL_5;
    }
    v96 = v149;
    v97 = v84;
    v98 = v172;
    v99 = v90;
    v100 = v150;
    (*(void (**)(char *, uint64_t, uint64_t))(v172 + 32))(v150, v99, v95);
    v101 = v148;
    (*(void (**)(char *, _QWORD, uint64_t))(v98 + 104))(v148, v147, v95);
    v102 = sub_23DE66524();
    v103 = *(void (**)(char *, uint64_t))(v98 + 8);
    v103(v101, v95);
    if ((v102 & 1) != 0)
      break;
    v103(v100, v95);
    (*(void (**)(char *, uint64_t))(v174 + 8))(v173, v97);
LABEL_5:
    v71 = v171;
    v75 = v86;
    v66 = v167;
    v74 = v168;
    v73 = v166;
    ((void (*)(char *, char *, uint64_t))v155)(v167, v151, v75);
  }
  v106 = (uint64_t)v128;
  sub_23DE66584();
  sub_23DE4CD44(&qword_25432B198, (uint64_t (*)(uint64_t))sub_23DE5EEC8, MEMORY[0x24BEE1BC0]);
  v107 = v133;
  sub_23DE665D8();
  sub_23DE513F8(v106, (uint64_t (*)(_QWORD))sub_23DE5EEC8);
  sub_23DE66608();
  v168 = *(_QWORD *)(v127 + 8);
  ((void (*)(char *, uint64_t))v168)(v107, v134);
  sub_23DE4CD44(&qword_25432AE48, (uint64_t (*)(uint64_t))MEMORY[0x24BDCC290], MEMORY[0x24BDCC2A8]);
  v175 = sub_23DE66DD0();
  v176 = v108;
  v109 = v135;
  sub_23DE6650C();
  v169 = (char *)sub_23DE4CD84();
  sub_23DE66ED8();
  v172 = *(_QWORD *)(v129 + 8);
  ((void (*)(char *, uint64_t))v172)(v109, v136);
  swift_bridgeObjectRelease();
  LOBYTE(v109) = *(_BYTE *)(v146 + *(int *)(type metadata accessor for TimeView(0) + 20));
  sub_23DE66584();
  if ((v109 & 1) != 0)
  {
    v115 = v130;
    v116 = v131;
    (*(void (**)(char *, uint64_t, uint64_t))(v130 + 16))(v96, v106 + *(int *)(v132 + 36), v131);
    sub_23DE513F8(v106, (uint64_t (*)(_QWORD))sub_23DE5EEC8);
    sub_23DE4CD44(&qword_25432AE70, (uint64_t (*)(uint64_t))MEMORY[0x24BDCC4F0], MEMORY[0x24BDCC508]);
    result = sub_23DE66D70();
    if ((result & 1) == 0)
      goto LABEL_21;
    v112 = (uint64_t)v123;
    (*(void (**)(char *, char *, uint64_t))(v115 + 32))(v123, v96, v116);
    v113 = sub_23DE5EE50;
    sub_23DE4CD44(&qword_256D0CD50, (uint64_t (*)(uint64_t))sub_23DE5EE50, MEMORY[0x24BEE2C50]);
    v114 = v133;
LABEL_19:
    v117 = v145;
    sub_23DE665D8();
    sub_23DE513F8(v112, (uint64_t (*)(_QWORD))v113);
    sub_23DE66608();
    ((void (*)(char *, uint64_t))v168)(v114, v134);
    v175 = sub_23DE66DD0();
    v176 = v118;
    v119 = v135;
    sub_23DE6650C();
    v57 = sub_23DE66ED8();
    ((void (*)(char *, uint64_t))v172)(v119, v136);
    swift_bridgeObjectRelease();
    v103(v150, v164);
    (*(void (**)(char *, uint64_t))(v174 + 8))(v173, v170);
    sub_23DE513F8(v171, (uint64_t (*)(_QWORD))sub_23DE5EF9C);
    (*(void (**)(char *, uint64_t))(v139 + 8))(v117, v140);
    (*(void (**)(char *, uint64_t))(v137 + 8))(v142, v138);
    (*(void (**)(char *, uint64_t))(v121 + 8))(v120, v122);
    return v57;
  }
  v110 = v130;
  v111 = v131;
  (*(void (**)(char *, uint64_t, uint64_t))(v130 + 16))(v96, v106, v131);
  sub_23DE513F8(v106, (uint64_t (*)(_QWORD))sub_23DE5EEC8);
  sub_23DE4CD44(&qword_25432AE70, (uint64_t (*)(uint64_t))MEMORY[0x24BDCC4F0], MEMORY[0x24BDCC508]);
  result = sub_23DE66D70();
  if ((result & 1) != 0)
  {
    v112 = (uint64_t)v125;
    (*(void (**)(char *, char *, uint64_t))(v110 + 32))(v125, v96, v111);
    v113 = sub_23DE5EDD8;
    sub_23DE4CD44(&qword_25432B1C8, (uint64_t (*)(uint64_t))sub_23DE5EDD8, MEMORY[0x24BEE2C68]);
    v114 = v133;
    goto LABEL_19;
  }
  __break(1u);
LABEL_21:
  __break(1u);
  return result;
}

uint64_t sub_23DE5C014@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t (*v6)(uint64_t, uint64_t, uint64_t);
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
  uint64_t v30;
  uint64_t v31;
  char *v32;
  char v33;
  uint64_t v34;
  unint64_t v35;
  unint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  char v40;
  char v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  char v45;
  char v46;
  char v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  char v53;
  char v54;
  uint64_t KeyPath;
  uint64_t v56;
  uint64_t v57;
  unint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  char v63;
  uint64_t v64;
  uint64_t v65;
  unint64_t v66;
  unint64_t v67;
  unint64_t v68;
  unint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  char v74;
  char v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  char v79;
  char v80;
  char v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  char v87;
  char v88;
  char *v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  unint64_t v97;
  unint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  char v102;
  char v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  char v107;
  uint64_t v108;
  uint64_t v109;
  char v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
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
  char v124;
  char v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t v128;
  char v129;
  char v130;
  uint64_t v131;
  uint64_t v132;
  uint64_t v133;
  uint64_t v134;
  uint64_t v135;
  uint64_t v136;
  uint64_t v137;
  uint64_t v138;
  unint64_t v139;
  unint64_t v140;
  uint64_t v141;
  uint64_t v142;
  uint64_t v143;
  char v144;
  uint64_t v145;
  uint64_t v146;
  uint64_t v147;
  char v148;
  uint64_t v149;
  uint64_t v150;
  uint64_t v151;
  uint64_t v152;
  uint64_t v153;
  char v154;
  uint64_t v155;
  uint64_t v156;
  uint64_t v157;
  uint64_t v158;
  unint64_t v159;
  uint64_t v160;
  char *v161;
  void (*v162)(char *, char *, uint64_t);
  void (*v163)(char *, char *, uint64_t);
  char *v164;
  uint64_t v165;
  char *v166;
  char *v167;
  char *v168;
  uint64_t v169;
  uint64_t v170;
  char *v171;
  uint64_t v172;
  char *v173;
  uint64_t v174;
  uint64_t v175;
  uint64_t v176;
  uint64_t v177;
  uint64_t v178;
  uint64_t v179;
  uint64_t v180;
  uint64_t v181;
  uint64_t v182;
  unint64_t v183;
  char v184;
  uint64_t v185;
  uint64_t v186;
  uint64_t v187;
  char v188;

  v181 = a1;
  sub_23DE5EA48(0);
  v4 = v3;
  v168 = *(char **)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v167 = (char *)&v160 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))MEMORY[0x24BDEF380];
  sub_23DE5E81C(0, &qword_25432B020, MEMORY[0x24BDEF380]);
  v8 = v7;
  MEMORY[0x24BDAC7A8](v7);
  v10 = (char *)&v160 - v9;
  sub_23DE5EBF8(0, &qword_25432B010, v6);
  v172 = v11;
  MEMORY[0x24BDAC7A8](v11);
  v13 = (char *)&v160 - v12;
  sub_23DE5E894(0);
  v15 = v14;
  MEMORY[0x24BDAC7A8](v14);
  v17 = (char *)&v160 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23DE5E9AC(0, &qword_25432B0D8, MEMORY[0x24BDF1FA8], MEMORY[0x24BDF1F80], MEMORY[0x24BDF29E0]);
  v175 = v18;
  v169 = *(_QWORD *)(v18 - 8);
  MEMORY[0x24BDAC7A8](v18);
  v20 = (char *)&v160 - v19;
  sub_23DE5E910();
  v174 = v21;
  v22 = MEMORY[0x24BDAC7A8](v21);
  v170 = (uint64_t)&v160 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  v24 = MEMORY[0x24BDAC7A8](v22);
  v171 = (char *)&v160 - v25;
  v26 = MEMORY[0x24BDAC7A8](v24);
  v173 = (char *)&v160 - v27;
  MEMORY[0x24BDAC7A8](v26);
  v176 = (uint64_t)&v160 - v28;
  sub_23DE5EBF8(0, &qword_25432B068, MEMORY[0x24BDEF3B8]);
  v30 = v29;
  MEMORY[0x24BDAC7A8](v29);
  v32 = (char *)&v160 - v31;
  v33 = sub_23DE4D16C();
  v179 = a2;
  v180 = v4;
  v177 = v30;
  v178 = v8;
  if ((v33 & 1) != 0)
  {
    v34 = sub_23DE5AD6C();
    v36 = v35;
    swift_bridgeObjectRelease();
    v182 = v34;
    v183 = v36;
    sub_23DE4CD84();
    v37 = sub_23DE66B3C();
    v39 = v38;
    v41 = v40 & 1;
    sub_23DE66AD0();
    v42 = sub_23DE66B24();
    v44 = v43;
    v46 = v45;
    swift_release();
    v47 = v46 & 1;
    sub_23DE5AD5C(v37, v39, v41);
    swift_bridgeObjectRelease();
    sub_23DE66AE8();
    v48 = sub_23DE66B0C();
    v50 = v49;
    v52 = v51;
    v54 = v53 & 1;
    sub_23DE5AD5C(v42, v44, v47);
    swift_bridgeObjectRelease();
    KeyPath = swift_getKeyPath();
    v182 = v48;
    v183 = v50;
    v184 = v54;
    v185 = v52;
    v186 = KeyPath;
    v187 = 1;
    v188 = 0;
    sub_23DE5EABC();
    v57 = v56;
    v58 = sub_23DE5EB30();
    v59 = (uint64_t)v167;
    sub_23DE66B9C();
    sub_23DE5AD5C(v48, v50, v54);
    swift_release();
    swift_bridgeObjectRelease();
    v60 = (uint64_t)v168;
    v61 = v180;
    (*((void (**)(char *, uint64_t, uint64_t))v168 + 2))(v10, v59, v180);
    swift_storeEnumTagMultiPayload();
    sub_23DE5ED04();
    v182 = v57;
    v183 = v58;
    swift_getOpaqueTypeConformance2();
    sub_23DE66A70();
    return (*(uint64_t (**)(uint64_t, uint64_t))(v60 + 8))(v59, v61);
  }
  else
  {
    v164 = v32;
    v165 = v15;
    v166 = v13;
    v167 = v17;
    v168 = v10;
    v63 = *(_BYTE *)(v181 + *(int *)(type metadata accessor for TimeView(0) + 20));
    v64 = sub_23DE5AD6C();
    v67 = v66;
    v69 = v68;
    if ((v63 & 1) != 0)
    {
      v120 = v65;
      swift_bridgeObjectRelease();
      v182 = v120;
      v183 = v69;
      v162 = (void (*)(char *, char *, uint64_t))sub_23DE4CD84();
      v121 = sub_23DE66B3C();
      v123 = v122;
      v125 = v124 & 1;
      sub_23DE66AF4();
      v126 = sub_23DE66B24();
      v128 = v127;
      v130 = v129;
      v132 = v131;
      swift_release();
      sub_23DE5AD5C(v121, v123, v125);
      swift_bridgeObjectRelease();
      v182 = v126;
      v183 = v128;
      v184 = v130 & 1;
      v185 = v132;
      sub_23DE66B9C();
      sub_23DE5AD5C(v126, v128, v130 & 1);
      swift_bridgeObjectRelease();
      v133 = swift_getKeyPath();
      v134 = v169;
      v163 = *(void (**)(char *, char *, uint64_t))(v169 + 16);
      v135 = (uint64_t)v173;
      v136 = v175;
      v163(v173, v20, v175);
      v137 = v135 + *(int *)(v174 + 36);
      *(_QWORD *)v137 = v133;
      *(_QWORD *)(v137 + 8) = 1;
      *(_BYTE *)(v137 + 16) = 0;
      v169 = *(_QWORD *)(v134 + 8);
      ((void (*)(char *, uint64_t))v169)(v20, v136);
      sub_23DE5F014(v135, v176, (uint64_t (*)(_QWORD))sub_23DE5E910);
      v138 = sub_23DE5AD6C();
      v140 = v139;
      swift_bridgeObjectRelease();
      v182 = v138;
      v183 = v140;
      v141 = sub_23DE66B3C();
      v143 = v142;
      LOBYTE(v135) = v144 & 1;
      sub_23DE66AD0();
      v145 = sub_23DE66B24();
      v147 = v146;
      LOBYTE(v120) = v148;
      swift_release();
      LOBYTE(v126) = v120 & 1;
      sub_23DE5AD5C(v141, v143, v135);
      swift_bridgeObjectRelease();
      sub_23DE66AE8();
      v149 = sub_23DE66B0C();
      v151 = v150;
      v153 = v152;
      LOBYTE(v120) = v154 & 1;
      v155 = v145;
      v112 = v176;
      sub_23DE5AD5C(v155, v147, v126);
      swift_bridgeObjectRelease();
      v182 = v149;
      v183 = v151;
      v184 = v120;
      v185 = v153;
      sub_23DE66B9C();
      sub_23DE5AD5C(v149, v151, v120);
      v111 = (uint64_t)v173;
      swift_bridgeObjectRelease();
      v113 = swift_getKeyPath();
      v114 = (uint64_t)v171;
      v115 = v175;
      v163(v171, v20, v175);
    }
    else
    {
      v70 = v64;
      swift_bridgeObjectRelease();
      v182 = v70;
      v183 = v67;
      v163 = (void (*)(char *, char *, uint64_t))sub_23DE4CD84();
      v71 = sub_23DE66B3C();
      v73 = v72;
      v75 = v74 & 1;
      sub_23DE66AD0();
      v76 = sub_23DE66B24();
      v78 = v77;
      v80 = v79;
      swift_release();
      v81 = v80 & 1;
      sub_23DE5AD5C(v71, v73, v75);
      swift_bridgeObjectRelease();
      sub_23DE66AE8();
      v82 = sub_23DE66B0C();
      v84 = v83;
      v86 = v85;
      v88 = v87 & 1;
      sub_23DE5AD5C(v76, v78, v81);
      swift_bridgeObjectRelease();
      v182 = v82;
      v183 = v84;
      v184 = v88;
      v185 = v86;
      v89 = v20;
      v161 = v20;
      sub_23DE66B9C();
      sub_23DE5AD5C(v82, v84, v88);
      swift_bridgeObjectRelease();
      v90 = swift_getKeyPath();
      v91 = v169;
      v162 = *(void (**)(char *, char *, uint64_t))(v169 + 16);
      v92 = (uint64_t)v173;
      v93 = v175;
      v162(v173, v89, v175);
      v94 = v92 + *(int *)(v174 + 36);
      *(_QWORD *)v94 = v90;
      *(_QWORD *)(v94 + 8) = 1;
      *(_BYTE *)(v94 + 16) = 0;
      v169 = *(_QWORD *)(v91 + 8);
      ((void (*)(char *, uint64_t))v169)(v89, v93);
      sub_23DE5F014(v92, v176, (uint64_t (*)(_QWORD))sub_23DE5E910);
      sub_23DE5AD6C();
      v96 = v95;
      v98 = v97;
      swift_bridgeObjectRelease();
      v182 = v96;
      v183 = v98;
      v99 = sub_23DE66B3C();
      v101 = v100;
      v103 = v102 & 1;
      sub_23DE66AF4();
      v104 = sub_23DE66B24();
      v106 = v105;
      LOBYTE(v78) = v107;
      v109 = v108;
      swift_release();
      LOBYTE(v89) = v78 & 1;
      v110 = v103;
      v111 = v92;
      v112 = v176;
      sub_23DE5AD5C(v99, v101, v110);
      swift_bridgeObjectRelease();
      v182 = v104;
      v183 = v106;
      v184 = (char)v89;
      v185 = v109;
      v20 = v161;
      sub_23DE66B9C();
      sub_23DE5AD5C(v104, v106, (char)v89);
      swift_bridgeObjectRelease();
      v113 = swift_getKeyPath();
      v114 = (uint64_t)v171;
      v115 = v175;
      v162(v171, v20, v175);
    }
    v116 = v114 + *(int *)(v174 + 36);
    *(_QWORD *)v116 = v113;
    *(_QWORD *)(v116 + 8) = 1;
    *(_BYTE *)(v116 + 16) = 0;
    ((void (*)(char *, uint64_t))v169)(v20, v115);
    sub_23DE5F014(v114, v111, (uint64_t (*)(_QWORD))sub_23DE5E910);
    sub_23DE51318(v112, v114, (uint64_t (*)(_QWORD))sub_23DE5E910);
    v117 = v170;
    sub_23DE51318(v111, v170, (uint64_t (*)(_QWORD))sub_23DE5E910);
    v118 = (uint64_t)v167;
    sub_23DE51318(v114, (uint64_t)v167, (uint64_t (*)(_QWORD))sub_23DE5E910);
    sub_23DE5E8B0();
    sub_23DE51318(v117, v118 + *(int *)(v119 + 48), (uint64_t (*)(_QWORD))sub_23DE5E910);
    sub_23DE513F8(v117, (uint64_t (*)(_QWORD))sub_23DE5E910);
    sub_23DE513F8(v114, (uint64_t (*)(_QWORD))sub_23DE5E910);
    sub_23DE51318(v118, (uint64_t)v166, (uint64_t (*)(_QWORD))sub_23DE5E894);
    swift_storeEnumTagMultiPayload();
    sub_23DE4CD44(&qword_25432B150, (uint64_t (*)(uint64_t))sub_23DE5E894, MEMORY[0x24BDF5428]);
    v156 = (uint64_t)v164;
    sub_23DE66A70();
    sub_23DE513F8(v118, (uint64_t (*)(_QWORD))sub_23DE5E894);
    sub_23DE513F8(v111, (uint64_t (*)(_QWORD))sub_23DE5E910);
    sub_23DE513F8(v112, (uint64_t (*)(_QWORD))sub_23DE5E910);
    sub_23DE5ECB0(v156, (uint64_t)v168);
    swift_storeEnumTagMultiPayload();
    sub_23DE5ED04();
    sub_23DE5EABC();
    v158 = v157;
    v159 = sub_23DE5EB30();
    v182 = v158;
    v183 = v159;
    swift_getOpaqueTypeConformance2();
    sub_23DE66A70();
    return sub_23DE5ED8C(v156);
  }
}

uint64_t sub_23DE5CD4C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;

  *(_QWORD *)a1 = sub_23DE66A28();
  *(_QWORD *)(a1 + 8) = 0;
  *(_BYTE *)(a1 + 16) = 1;
  sub_23DE5E7A8();
  return sub_23DE5C014(v1, a1 + *(int *)(v3 + 44));
}

uint64_t sub_23DE5CD90@<X0>(uint64_t a1@<X8>)
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
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t KeyPath;
  uint64_t v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t (*v22)(char *, uint64_t);
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;

  v25 = a1;
  v1 = sub_23DE66CD4();
  v2 = *(_QWORD *)(v1 - 8);
  MEMORY[0x24BDAC7A8](v1);
  v4 = (char *)&v24 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23DE5E9AC(0, &qword_25432B0B8, MEMORY[0x24BDF4108], MEMORY[0x24BDF40E8], MEMORY[0x24BDFAC10]);
  v6 = v5;
  v7 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v9 = (char *)&v24 - v8;
  sub_23DE5E604(0);
  v11 = v10;
  v12 = *(_QWORD *)(v10 - 8);
  MEMORY[0x24BDAC7A8](v10);
  v14 = (char *)&v24 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23DE50ADC((uint64_t)v4);
  (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
  v26 = sub_23DE66BFC();
  v15 = MEMORY[0x24BDF4108];
  v16 = MEMORY[0x24BDF40E8];
  sub_23DE66B54();
  swift_release();
  v26 = v15;
  v27 = v16;
  swift_getOpaqueTypeConformance2();
  sub_23DE66B84();
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  v17 = *(_QWORD *)(v24 + *(int *)(type metadata accessor for ImageView(0) + 20));
  KeyPath = swift_getKeyPath();
  v19 = v25;
  (*(void (**)(uint64_t, char *, uint64_t))(v12 + 16))(v25, v14, v11);
  sub_23DE5E6CC();
  v21 = (uint64_t *)(v19 + *(int *)(v20 + 36));
  *v21 = KeyPath;
  v21[1] = v17;
  v22 = *(uint64_t (**)(char *, uint64_t))(v12 + 8);
  swift_retain();
  return v22(v14, v11);
}

void sub_23DE5CFB0(uint64_t a1, unint64_t *a2, void (*a3)(uint64_t))
{
  unint64_t v4;
  uint64_t v5;

  if (!*a2)
  {
    a3(255);
    v4 = sub_23DE668E4();
    if (!v5)
      atomic_store(v4, a2);
  }
}

uint64_t *sub_23DE5D014(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5;
  uint64_t v7;
  uint64_t v8;

  v5 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v8 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v8 + ((v5 + 16) & ~(unint64_t)v5));
  }
  else
  {
    sub_23DE4CF6C(0, &qword_25432AB30, (uint64_t (*)(uint64_t))MEMORY[0x24BDFAF10], MEMORY[0x24BDEB560]);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v7 = sub_23DE66CD4();
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a1, a2, v7);
    }
    else
    {
      *a1 = *a2;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
    *(uint64_t *)((char *)a1 + *(int *)(a3 + 20)) = *(uint64_t *)((char *)a2 + *(int *)(a3 + 20));
  }
  swift_retain();
  return a1;
}

uint64_t sub_23DE5D100(uint64_t a1)
{
  uint64_t v2;

  sub_23DE4CF6C(0, &qword_25432AB30, (uint64_t (*)(uint64_t))MEMORY[0x24BDFAF10], MEMORY[0x24BDEB560]);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v2 = sub_23DE66CD4();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  }
  else
  {
    swift_release();
  }
  return swift_release();
}

_QWORD *sub_23DE5D184(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v6;

  sub_23DE4CF6C(0, &qword_25432AB30, (uint64_t (*)(uint64_t))MEMORY[0x24BDFAF10], MEMORY[0x24BDEB560]);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v6 = sub_23DE66CD4();
    (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(a1, a2, v6);
  }
  else
  {
    *a1 = *a2;
    swift_retain();
  }
  swift_storeEnumTagMultiPayload();
  *(_QWORD *)((char *)a1 + *(int *)(a3 + 20)) = *(_QWORD *)((char *)a2 + *(int *)(a3 + 20));
  swift_retain();
  return a1;
}

_QWORD *sub_23DE5D248(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t (*v6)(uint64_t);
  uint64_t (*v7)(uint64_t, uint64_t);
  uint64_t v8;

  if (a1 != a2)
  {
    v6 = (uint64_t (*)(uint64_t))MEMORY[0x24BDFAF10];
    v7 = (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BDEB560];
    sub_23DE5F0E0((uint64_t)a1, &qword_25432AB30, (uint64_t (*)(uint64_t))MEMORY[0x24BDFAF10], MEMORY[0x24BDEB560]);
    sub_23DE4CF6C(0, &qword_25432AB30, v6, v7);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v8 = sub_23DE66CD4();
      (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v8 - 8) + 16))(a1, a2, v8);
    }
    else
    {
      *a1 = *a2;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
  }
  *(_QWORD *)((char *)a1 + *(int *)(a3 + 20)) = *(_QWORD *)((char *)a2 + *(int *)(a3 + 20));
  swift_retain();
  swift_release();
  return a1;
}

char *sub_23DE5D348(char *a1, char *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  sub_23DE4CF6C(0, &qword_25432AB30, (uint64_t (*)(uint64_t))MEMORY[0x24BDFAF10], MEMORY[0x24BDEB560]);
  v7 = v6;
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v8 = sub_23DE66CD4();
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v8 - 8) + 32))(a1, a2, v8);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v7 - 8) + 64));
  }
  *(_QWORD *)&a1[*(int *)(a3 + 20)] = *(_QWORD *)&a2[*(int *)(a3 + 20)];
  return a1;
}

char *sub_23DE5D404(char *a1, char *a2, uint64_t a3)
{
  uint64_t (*v6)(uint64_t);
  uint64_t (*v7)(uint64_t, uint64_t);
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  if (a1 != a2)
  {
    v6 = (uint64_t (*)(uint64_t))MEMORY[0x24BDFAF10];
    v7 = (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BDEB560];
    sub_23DE5F0E0((uint64_t)a1, &qword_25432AB30, (uint64_t (*)(uint64_t))MEMORY[0x24BDFAF10], MEMORY[0x24BDEB560]);
    sub_23DE4CF6C(0, &qword_25432AB30, v6, v7);
    v9 = v8;
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v10 = sub_23DE66CD4();
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v10 - 8) + 32))(a1, a2, v10);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v9 - 8) + 64));
    }
  }
  *(_QWORD *)&a1[*(int *)(a3 + 20)] = *(_QWORD *)&a2[*(int *)(a3 + 20)];
  swift_release();
  return a1;
}

uint64_t sub_23DE5D4F8()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_23DE5D504(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  unint64_t v9;

  sub_23DE4CF6C(0, &qword_25432AF88, (uint64_t (*)(uint64_t))MEMORY[0x24BDFAF10], MEMORY[0x24BDEB580]);
  v7 = *(_QWORD *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == (_DWORD)a2)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, a2, v6);
  v9 = *(_QWORD *)(a1 + *(int *)(a3 + 20));
  if (v9 >= 0xFFFFFFFF)
    LODWORD(v9) = -1;
  return (v9 + 1);
}

uint64_t sub_23DE5D598()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

void sub_23DE5D5A4(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v8;
  uint64_t v9;

  sub_23DE4CF6C(0, &qword_25432AF88, (uint64_t (*)(uint64_t))MEMORY[0x24BDFAF10], MEMORY[0x24BDEB580]);
  v9 = *(_QWORD *)(v8 - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56))(a1, a2, a2, v8);
  else
    *(_QWORD *)(a1 + *(int *)(a4 + 20)) = (a2 - 1);
}

void sub_23DE5D634()
{
  unint64_t v0;

  sub_23DE4CF6C(319, &qword_25432AB30, (uint64_t (*)(uint64_t))MEMORY[0x24BDFAF10], MEMORY[0x24BDEB560]);
  if (v0 <= 0x3F)
    swift_initStructMetadata();
}

_QWORD *sub_23DE5D6C0(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  _QWORD *v4;
  int v5;
  uint64_t v6;
  int *v7;
  uint64_t v8;
  char *v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  unsigned int (*v13)(char *, uint64_t, uint64_t);
  uint64_t v14;
  uint64_t v15;
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
  uint64_t v26;

  v4 = a1;
  v5 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v15 = *a2;
    *v4 = *a2;
    v4 = (_QWORD *)(v15 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    v6 = a2[1];
    *a1 = *a2;
    a1[1] = v6;
    a1[2] = a2[2];
    v7 = (int *)type metadata accessor for MedicationsWidgetViewModel();
    v8 = v7[6];
    v9 = (char *)v4 + v8;
    v10 = (char *)a2 + v8;
    v11 = type metadata accessor for MedmojiIconConfiguration();
    v12 = *(_QWORD *)(v11 - 8);
    v13 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    if (v13(v10, 1, v11))
    {
      sub_23DE4CF6C(0, qword_25432AAD0, (uint64_t (*)(uint64_t))type metadata accessor for MedmojiIconConfiguration, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1C68]);
      memcpy(v9, v10, *(_QWORD *)(*(_QWORD *)(v14 - 8) + 64));
    }
    else
    {
      v16 = sub_23DE66818();
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v16 - 8) + 16))(v9, v10, v16);
      v17 = *(int *)(v11 + 20);
      v18 = &v9[v17];
      v19 = &v10[v17];
      v20 = sub_23DE667DC();
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v20 - 8) + 16))(v18, v19, v20);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v12 + 56))(v9, 0, 1, v11);
    }
    *((_BYTE *)v4 + v7[7]) = *((_BYTE *)a2 + v7[7]);
    v21 = v7[8];
    v22 = (char *)v4 + v21;
    v23 = (char *)a2 + v21;
    v24 = sub_23DE666F8();
    v25 = *(_QWORD *)(v24 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v25 + 48))(v23, 1, v24))
    {
      sub_23DE4CF6C(0, &qword_25432A770, (uint64_t (*)(uint64_t))MEMORY[0x24BDCE900], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1C68]);
      memcpy(v22, v23, *(_QWORD *)(*(_QWORD *)(v26 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v25 + 16))(v22, v23, v24);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v25 + 56))(v22, 0, 1, v24);
    }
    *((_BYTE *)v4 + *(int *)(a3 + 20)) = *((_BYTE *)a2 + *(int *)(a3 + 20));
  }
  return v4;
}

uint64_t sub_23DE5D8EC(uint64_t a1)
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
  uint64_t result;

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v2 = type metadata accessor for MedicationsWidgetViewModel();
  v3 = a1 + *(int *)(v2 + 24);
  v4 = type metadata accessor for MedmojiIconConfiguration();
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 48))(v3, 1, v4))
  {
    v5 = sub_23DE66818();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(v3, v5);
    v6 = v3 + *(int *)(v4 + 20);
    v7 = sub_23DE667DC();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 8))(v6, v7);
  }
  v8 = a1 + *(int *)(v2 + 32);
  v9 = sub_23DE666F8();
  v10 = *(_QWORD *)(v9 - 8);
  result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v10 + 48))(v8, 1, v9);
  if (!(_DWORD)result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(v10 + 8))(v8, v9);
  return result;
}

_QWORD *sub_23DE5D9E8(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v5;
  int *v6;
  uint64_t v7;
  char *v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  unsigned int (*v12)(char *, uint64_t, uint64_t);
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;

  v5 = a2[1];
  *a1 = *a2;
  a1[1] = v5;
  a1[2] = a2[2];
  v6 = (int *)type metadata accessor for MedicationsWidgetViewModel();
  v7 = v6[6];
  v8 = (char *)a1 + v7;
  v9 = (char *)a2 + v7;
  v10 = type metadata accessor for MedmojiIconConfiguration();
  v11 = *(_QWORD *)(v10 - 8);
  v12 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v11 + 48);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  if (v12(v9, 1, v10))
  {
    sub_23DE4CF6C(0, qword_25432AAD0, (uint64_t (*)(uint64_t))type metadata accessor for MedmojiIconConfiguration, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1C68]);
    memcpy(v8, v9, *(_QWORD *)(*(_QWORD *)(v13 - 8) + 64));
  }
  else
  {
    v14 = sub_23DE66818();
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v14 - 8) + 16))(v8, v9, v14);
    v15 = *(int *)(v10 + 20);
    v16 = &v8[v15];
    v17 = &v9[v15];
    v18 = sub_23DE667DC();
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v18 - 8) + 16))(v16, v17, v18);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v11 + 56))(v8, 0, 1, v10);
  }
  *((_BYTE *)a1 + v6[7]) = *((_BYTE *)a2 + v6[7]);
  v19 = v6[8];
  v20 = (char *)a1 + v19;
  v21 = (char *)a2 + v19;
  v22 = sub_23DE666F8();
  v23 = *(_QWORD *)(v22 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v23 + 48))(v21, 1, v22))
  {
    sub_23DE4CF6C(0, &qword_25432A770, (uint64_t (*)(uint64_t))MEMORY[0x24BDCE900], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1C68]);
    memcpy(v20, v21, *(_QWORD *)(*(_QWORD *)(v24 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v23 + 16))(v20, v21, v22);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v23 + 56))(v20, 0, 1, v22);
  }
  *((_BYTE *)a1 + *(int *)(a3 + 20)) = *((_BYTE *)a2 + *(int *)(a3 + 20));
  return a1;
}

_QWORD *sub_23DE5DBE8(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  int *v6;
  uint64_t v7;
  char *v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t (*v12)(char *, uint64_t, uint64_t);
  int v13;
  int v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  char *v24;
  char *v25;
  uint64_t v26;
  uint64_t v27;
  char *v28;
  char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t (*v32)(char *, uint64_t, uint64_t);
  int v33;
  int v34;
  uint64_t v35;

  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v6 = (int *)type metadata accessor for MedicationsWidgetViewModel();
  v7 = v6[6];
  v8 = (char *)a1 + v7;
  v9 = (char *)a2 + v7;
  v10 = type metadata accessor for MedmojiIconConfiguration();
  v11 = *(_QWORD *)(v10 - 8);
  v12 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v11 + 48);
  v13 = v12(v8, 1, v10);
  v14 = v12(v9, 1, v10);
  if (v13)
  {
    if (v14)
    {
      v15 = (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1C68];
LABEL_6:
      sub_23DE4CF6C(0, qword_25432AAD0, (uint64_t (*)(uint64_t))type metadata accessor for MedmojiIconConfiguration, v15);
      memcpy(v8, v9, *(_QWORD *)(*(_QWORD *)(v16 - 8) + 64));
      goto LABEL_9;
    }
    v17 = sub_23DE66818();
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v17 - 8) + 16))(v8, v9, v17);
    v18 = *(int *)(v10 + 20);
    v19 = &v8[v18];
    v20 = &v9[v18];
    v21 = sub_23DE667DC();
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v21 - 8) + 16))(v19, v20, v21);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v11 + 56))(v8, 0, 1, v10);
  }
  else
  {
    if (v14)
    {
      sub_23DE513F8((uint64_t)v8, (uint64_t (*)(_QWORD))type metadata accessor for MedmojiIconConfiguration);
      v15 = (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1C68];
      goto LABEL_6;
    }
    v22 = sub_23DE66818();
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v22 - 8) + 24))(v8, v9, v22);
    v23 = *(int *)(v10 + 20);
    v24 = &v8[v23];
    v25 = &v9[v23];
    v26 = sub_23DE667DC();
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v26 - 8) + 24))(v24, v25, v26);
  }
LABEL_9:
  *((_BYTE *)a1 + v6[7]) = *((_BYTE *)a2 + v6[7]);
  v27 = v6[8];
  v28 = (char *)a1 + v27;
  v29 = (char *)a2 + v27;
  v30 = sub_23DE666F8();
  v31 = *(_QWORD *)(v30 - 8);
  v32 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v31 + 48);
  v33 = v32(v28, 1, v30);
  v34 = v32(v29, 1, v30);
  if (!v33)
  {
    if (!v34)
    {
      (*(void (**)(char *, char *, uint64_t))(v31 + 24))(v28, v29, v30);
      goto LABEL_15;
    }
    (*(void (**)(char *, uint64_t))(v31 + 8))(v28, v30);
    goto LABEL_14;
  }
  if (v34)
  {
LABEL_14:
    sub_23DE4CF6C(0, &qword_25432A770, (uint64_t (*)(uint64_t))MEMORY[0x24BDCE900], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1C68]);
    memcpy(v28, v29, *(_QWORD *)(*(_QWORD *)(v35 - 8) + 64));
    goto LABEL_15;
  }
  (*(void (**)(char *, char *, uint64_t))(v31 + 16))(v28, v29, v30);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v31 + 56))(v28, 0, 1, v30);
LABEL_15:
  *((_BYTE *)a1 + *(int *)(a3 + 20)) = *((_BYTE *)a2 + *(int *)(a3 + 20));
  return a1;
}

uint64_t sub_23DE5DED4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  int *v6;
  uint64_t v7;
  char *v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  const void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;

  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  v6 = (int *)type metadata accessor for MedicationsWidgetViewModel();
  v7 = v6[6];
  v8 = (char *)(a1 + v7);
  v9 = (char *)(a2 + v7);
  v10 = type metadata accessor for MedmojiIconConfiguration();
  v11 = *(_QWORD *)(v10 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v11 + 48))(v9, 1, v10))
  {
    sub_23DE4CF6C(0, qword_25432AAD0, (uint64_t (*)(uint64_t))type metadata accessor for MedmojiIconConfiguration, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1C68]);
    memcpy(v8, v9, *(_QWORD *)(*(_QWORD *)(v12 - 8) + 64));
  }
  else
  {
    v13 = sub_23DE66818();
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v13 - 8) + 32))(v8, v9, v13);
    v14 = *(int *)(v10 + 20);
    v15 = &v8[v14];
    v16 = &v9[v14];
    v17 = sub_23DE667DC();
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v17 - 8) + 32))(v15, v16, v17);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v11 + 56))(v8, 0, 1, v10);
  }
  *(_BYTE *)(a1 + v6[7]) = *(_BYTE *)(a2 + v6[7]);
  v18 = v6[8];
  v19 = (void *)(a1 + v18);
  v20 = (const void *)(a2 + v18);
  v21 = sub_23DE666F8();
  v22 = *(_QWORD *)(v21 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v22 + 48))(v20, 1, v21))
  {
    sub_23DE4CF6C(0, &qword_25432A770, (uint64_t (*)(uint64_t))MEMORY[0x24BDCE900], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1C68]);
    memcpy(v19, v20, *(_QWORD *)(*(_QWORD *)(v23 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v22 + 32))(v19, v20, v21);
    (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v22 + 56))(v19, 0, 1, v21);
  }
  *(_BYTE *)(a1 + *(int *)(a3 + 20)) = *(_BYTE *)(a2 + *(int *)(a3 + 20));
  return a1;
}

_QWORD *sub_23DE5E0B8(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v6;
  int *v7;
  uint64_t v8;
  char *v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t (*v13)(char *, uint64_t, uint64_t);
  int v14;
  int v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  char *v21;
  uint64_t v22;
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
  uint64_t (*v33)(char *, uint64_t, uint64_t);
  int v34;
  int v35;
  uint64_t v36;

  v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  swift_bridgeObjectRelease();
  v7 = (int *)type metadata accessor for MedicationsWidgetViewModel();
  v8 = v7[6];
  v9 = (char *)a1 + v8;
  v10 = (char *)a2 + v8;
  v11 = type metadata accessor for MedmojiIconConfiguration();
  v12 = *(_QWORD *)(v11 - 8);
  v13 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v12 + 48);
  v14 = v13(v9, 1, v11);
  v15 = v13(v10, 1, v11);
  if (v14)
  {
    if (v15)
    {
      v16 = (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1C68];
LABEL_6:
      sub_23DE4CF6C(0, qword_25432AAD0, (uint64_t (*)(uint64_t))type metadata accessor for MedmojiIconConfiguration, v16);
      memcpy(v9, v10, *(_QWORD *)(*(_QWORD *)(v17 - 8) + 64));
      goto LABEL_9;
    }
    v18 = sub_23DE66818();
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v18 - 8) + 32))(v9, v10, v18);
    v19 = *(int *)(v11 + 20);
    v20 = &v9[v19];
    v21 = &v10[v19];
    v22 = sub_23DE667DC();
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v22 - 8) + 32))(v20, v21, v22);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v12 + 56))(v9, 0, 1, v11);
  }
  else
  {
    if (v15)
    {
      sub_23DE513F8((uint64_t)v9, (uint64_t (*)(_QWORD))type metadata accessor for MedmojiIconConfiguration);
      v16 = (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1C68];
      goto LABEL_6;
    }
    v23 = sub_23DE66818();
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v23 - 8) + 40))(v9, v10, v23);
    v24 = *(int *)(v11 + 20);
    v25 = &v9[v24];
    v26 = &v10[v24];
    v27 = sub_23DE667DC();
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v27 - 8) + 40))(v25, v26, v27);
  }
LABEL_9:
  *((_BYTE *)a1 + v7[7]) = *((_BYTE *)a2 + v7[7]);
  v28 = v7[8];
  v29 = (char *)a1 + v28;
  v30 = (char *)a2 + v28;
  v31 = sub_23DE666F8();
  v32 = *(_QWORD *)(v31 - 8);
  v33 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v32 + 48);
  v34 = v33(v29, 1, v31);
  v35 = v33(v30, 1, v31);
  if (!v34)
  {
    if (!v35)
    {
      (*(void (**)(char *, char *, uint64_t))(v32 + 40))(v29, v30, v31);
      goto LABEL_15;
    }
    (*(void (**)(char *, uint64_t))(v32 + 8))(v29, v31);
    goto LABEL_14;
  }
  if (v35)
  {
LABEL_14:
    sub_23DE4CF6C(0, &qword_25432A770, (uint64_t (*)(uint64_t))MEMORY[0x24BDCE900], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1C68]);
    memcpy(v29, v30, *(_QWORD *)(*(_QWORD *)(v36 - 8) + 64));
    goto LABEL_15;
  }
  (*(void (**)(char *, char *, uint64_t))(v32 + 32))(v29, v30, v31);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v32 + 56))(v29, 0, 1, v31);
LABEL_15:
  *((_BYTE *)a1 + *(int *)(a3 + 20)) = *((_BYTE *)a2 + *(int *)(a3 + 20));
  return a1;
}

uint64_t sub_23DE5E38C()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_23DE5E398(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  unsigned int v9;
  int v10;

  v6 = type metadata accessor for MedicationsWidgetViewModel();
  v7 = *(_QWORD *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == (_DWORD)a2)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, a2, v6);
  v9 = *(unsigned __int8 *)(a1 + *(int *)(a3 + 20));
  if (v9 >= 2)
    v10 = ((v9 + 2147483646) & 0x7FFFFFFF) - 1;
  else
    v10 = -2;
  if (v10 < 0)
    v10 = -1;
  return (v10 + 1);
}

uint64_t sub_23DE5E430()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_23DE5E43C(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result;
  uint64_t v9;

  result = type metadata accessor for MedicationsWidgetViewModel();
  v9 = *(_QWORD *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56))(a1, a2, a2, result);
  *(_BYTE *)(a1 + *(int *)(a4 + 20)) = a2 + 2;
  return result;
}

uint64_t sub_23DE5E4B4()
{
  uint64_t result;
  unint64_t v1;

  result = type metadata accessor for MedicationsWidgetViewModel();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t sub_23DE5E524()
{
  sub_23DE5A6C0();
  sub_23DE5AA34(255);
  sub_23DE4CD44(&qword_25432B100, (uint64_t (*)(uint64_t))sub_23DE5A6C0, MEMORY[0x24BDF4750]);
  sub_23DE5AAC0(255);
  sub_23DE4CD44(&qword_25432AF90, (uint64_t (*)(uint64_t))sub_23DE5AAC0, MEMORY[0x24BDEBE40]);
  swift_getOpaqueTypeConformance2();
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_23DE5E5E4()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_23DE5E5F4()
{
  return swift_getOpaqueTypeConformance2();
}

void sub_23DE5E604(uint64_t a1)
{
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;
  _QWORD v5[2];

  if (!qword_25432B0C0)
  {
    sub_23DE5E9AC(255, &qword_25432B0B8, MEMORY[0x24BDF4108], MEMORY[0x24BDF40E8], MEMORY[0x24BDFAC10]);
    v5[0] = v2;
    v5[1] = swift_getOpaqueTypeConformance2();
    v3 = MEMORY[0x242646598](a1, v5, MEMORY[0x24BDF2268], 0);
    if (!v4)
      atomic_store(v3, (unint64_t *)&qword_25432B0C0);
  }
}

void sub_23DE5E6CC()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_25432AFD8)
  {
    sub_23DE5E604(255);
    sub_23DE5E748(255, &qword_25432B098, &qword_25432B0B0, MEMORY[0x24BDF1948]);
    v0 = sub_23DE668F0();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_25432AFD8);
  }
}

void sub_23DE5E748(uint64_t a1, unint64_t *a2, unint64_t *a3, uint64_t a4)
{
  unint64_t v5;
  uint64_t v6;

  if (!*a2)
  {
    sub_23DE5EA04(255, a3, a4, (uint64_t (*)(_QWORD, uint64_t))MEMORY[0x24BEE1C68]);
    v5 = sub_23DE66A94();
    if (!v6)
      atomic_store(v5, a2);
  }
}

void sub_23DE5E7A8()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_25432AFA8)
  {
    sub_23DE5E81C(255, &qword_25432B088, MEMORY[0x24BDEF3B8]);
    v0 = sub_23DE668E4();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_25432AFA8);
  }
}

void sub_23DE5E81C(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t, uint64_t, uint64_t))
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;

  if (!*a2)
  {
    sub_23DE5EBF8(255, &qword_25432B068, MEMORY[0x24BDEF3B8]);
    v7 = v6;
    sub_23DE5EA48(255);
    v9 = a3(a1, v7, v8);
    if (!v10)
      atomic_store(v9, a2);
  }
}

void sub_23DE5E894(uint64_t a1)
{
  sub_23DE4CF6C(a1, &qword_25432B158, (uint64_t (*)(uint64_t))sub_23DE5E8B0, MEMORY[0x24BDF53F0]);
}

void sub_23DE5E8B0()
{
  unint64_t TupleTypeMetadata2;
  uint64_t v1;

  if (!qword_25432AFE8)
  {
    sub_23DE5E910();
    TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
    if (!v1)
      atomic_store(TupleTypeMetadata2, (unint64_t *)&qword_25432AFE8);
  }
}

void sub_23DE5E910()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_25432AFE0)
  {
    sub_23DE5E9AC(255, &qword_25432B0D8, MEMORY[0x24BDF1FA8], MEMORY[0x24BDF1F80], MEMORY[0x24BDF29E0]);
    sub_23DE5E748(255, &qword_25432B0A8, &qword_25432B188, MEMORY[0x24BEE1768]);
    v0 = sub_23DE668F0();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_25432AFE0);
  }
}

void sub_23DE5E9AC(uint64_t a1, unint64_t *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  unint64_t v6;
  uint64_t v7;
  _QWORD v8[2];

  if (!*a2)
  {
    v8[0] = a3;
    v8[1] = a4;
    v6 = MEMORY[0x242646598](0, v8, a5, 0);
    if (!v7)
      atomic_store(v6, a2);
  }
}

void sub_23DE5EA04(uint64_t a1, unint64_t *a2, uint64_t a3, uint64_t (*a4)(_QWORD, uint64_t))
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

void sub_23DE5EA48(uint64_t a1)
{
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;
  _QWORD v5[2];

  if (!qword_25432B0D0)
  {
    sub_23DE5EABC();
    v5[0] = v2;
    v5[1] = sub_23DE5EB30();
    v3 = MEMORY[0x242646598](a1, v5, MEMORY[0x24BDF29E0], 0);
    if (!v4)
      atomic_store(v3, (unint64_t *)&qword_25432B0D0);
  }
}

void sub_23DE5EABC()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_25432AFC8)
  {
    sub_23DE5E748(255, &qword_25432B0A8, &qword_25432B188, MEMORY[0x24BEE1768]);
    v0 = sub_23DE668F0();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_25432AFC8);
  }
}

unint64_t sub_23DE5EB30()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD v4[2];

  result = qword_25432AFC0;
  if (!qword_25432AFC0)
  {
    sub_23DE5EABC();
    v2 = v1;
    v3 = sub_23DE5EBB8(&qword_25432B0A0, &qword_25432B0A8, &qword_25432B188, MEMORY[0x24BEE1768]);
    v4[0] = MEMORY[0x24BDF1F80];
    v4[1] = v3;
    result = MEMORY[0x2426465BC](MEMORY[0x24BDED308], v2, v4);
    atomic_store(result, (unint64_t *)&qword_25432AFC0);
  }
  return result;
}

uint64_t sub_23DE5EBB8(unint64_t *a1, unint64_t *a2, unint64_t *a3, uint64_t a4)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    sub_23DE5E748(255, a2, a3, a4);
    result = MEMORY[0x2426465BC](MEMORY[0x24BDF1028], v6);
    atomic_store(result, a1);
  }
  return result;
}

void sub_23DE5EBF8(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t, uint64_t, uint64_t))
{
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;

  if (!*a2)
  {
    sub_23DE5E894(255);
    v7 = a3(a1, v6, v6);
    if (!v8)
      atomic_store(v7, a2);
  }
}

uint64_t sub_23DE5EC54@<X0>(uint64_t a1@<X8>)
{
  uint64_t result;
  char v3;

  result = sub_23DE66998();
  *(_QWORD *)a1 = result;
  *(_BYTE *)(a1 + 8) = v3 & 1;
  return result;
}

uint64_t sub_23DE5EC84()
{
  return sub_23DE669A4();
}

uint64_t sub_23DE5ECB0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  sub_23DE5EBF8(0, &qword_25432B068, MEMORY[0x24BDEF3B8]);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

unint64_t sub_23DE5ED04()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;
  _QWORD v3[2];

  result = qword_25432B060;
  if (!qword_25432B060)
  {
    sub_23DE5EBF8(255, &qword_25432B068, MEMORY[0x24BDEF3B8]);
    v2 = v1;
    v3[0] = sub_23DE4CD44(&qword_25432B150, (uint64_t (*)(uint64_t))sub_23DE5E894, MEMORY[0x24BDF5428]);
    v3[1] = v3[0];
    result = MEMORY[0x2426465BC](MEMORY[0x24BDEF3E0], v2, v3);
    atomic_store(result, (unint64_t *)&qword_25432B060);
  }
  return result;
}

uint64_t sub_23DE5ED8C(uint64_t a1)
{
  uint64_t v2;

  sub_23DE5EBF8(0, &qword_25432B068, MEMORY[0x24BDEF3B8]);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

void sub_23DE5EDD8()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_25432B1D0)
  {
    sub_23DE665C0();
    sub_23DE4CD44(&qword_25432AE68, (uint64_t (*)(uint64_t))MEMORY[0x24BDCC4F0], MEMORY[0x24BDCC500]);
    v0 = sub_23DE66F68();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_25432B1D0);
  }
}

void sub_23DE5EE50()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_25432B1C0)
  {
    sub_23DE665C0();
    sub_23DE4CD44(&qword_25432AE68, (uint64_t (*)(uint64_t))MEMORY[0x24BDCC4F0], MEMORY[0x24BDCC500]);
    v0 = sub_23DE66F5C();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_25432B1C0);
  }
}

void sub_23DE5EEC8()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_25432B190)
  {
    sub_23DE665C0();
    sub_23DE4CD44(&qword_25432AE68, (uint64_t (*)(uint64_t))MEMORY[0x24BDCC4F0], MEMORY[0x24BDCC500]);
    v0 = sub_23DE66E30();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_25432B190);
  }
}

void sub_23DE5EF40()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_25432AE78)
  {
    sub_23DE66548();
    v0 = sub_23DE6662C();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_25432AE78);
  }
}

void sub_23DE5EF9C()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_25432B1B8)
  {
    sub_23DE665A8();
    sub_23DE4CD44(&qword_25432AE60, (uint64_t (*)(uint64_t))MEMORY[0x24BDCC4A8], MEMORY[0x24BDCC4C8]);
    v0 = sub_23DE66F50();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_25432B1B8);
  }
}

uint64_t sub_23DE5F014(uint64_t a1, uint64_t a2, uint64_t (*a3)(_QWORD))
{
  uint64_t v5;

  v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_23DE5F058@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  sub_23DE66554();
  result = sub_23DE66548();
  *a1 = result;
  return result;
}

void sub_23DE5F084()
{
  sub_23DE6653C();
  __break(1u);
}

unint64_t sub_23DE5F09C()
{
  unint64_t result;

  result = qword_25432AE40;
  if (!qword_25432AE40)
  {
    result = MEMORY[0x2426465BC](MEMORY[0x24BDCC150], MEMORY[0x24BDCC170]);
    atomic_store(result, (unint64_t *)&qword_25432AE40);
  }
  return result;
}

uint64_t sub_23DE5F0E0(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t), uint64_t (*a4)(uint64_t, uint64_t))
{
  uint64_t v5;

  sub_23DE4CF6C(0, a2, a3, a4);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(a1, v5);
  return a1;
}

unint64_t sub_23DE5F120()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD v4[4];

  result = qword_25432AFD0;
  if (!qword_25432AFD0)
  {
    sub_23DE5E6CC();
    v2 = v1;
    sub_23DE5E9AC(255, &qword_25432B0B8, MEMORY[0x24BDF4108], MEMORY[0x24BDF40E8], MEMORY[0x24BDFAC10]);
    v4[2] = v3;
    v4[3] = swift_getOpaqueTypeConformance2();
    v4[0] = swift_getOpaqueTypeConformance2();
    v4[1] = sub_23DE5EBB8(&qword_25432B090, &qword_25432B098, &qword_25432B0B0, MEMORY[0x24BDF1948]);
    result = MEMORY[0x2426465BC](MEMORY[0x24BDED308], v2, v4);
    atomic_store(result, (unint64_t *)&qword_25432AFD0);
  }
  return result;
}

uint64_t sub_23DE5F218()
{
  return sub_23DE4CD44(&qword_25432B0F0, (uint64_t (*)(uint64_t))sub_23DE5F244, MEMORY[0x24BDF4700]);
}

void sub_23DE5F244()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_25432B0F8)
  {
    sub_23DE5E81C(255, &qword_25432B088, MEMORY[0x24BDEF3B8]);
    sub_23DE5F2B4();
    v0 = sub_23DE66C20();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_25432B0F8);
  }
}

unint64_t sub_23DE5F2B4()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;
  _QWORD v5[4];

  result = qword_25432B080;
  if (!qword_25432B080)
  {
    sub_23DE5E81C(255, &qword_25432B088, MEMORY[0x24BDEF3B8]);
    v2 = v1;
    v3 = sub_23DE5ED04();
    sub_23DE5EABC();
    v5[2] = v4;
    v5[3] = sub_23DE5EB30();
    v5[0] = v3;
    v5[1] = swift_getOpaqueTypeConformance2();
    result = MEMORY[0x2426465BC](MEMORY[0x24BDEF3E0], v2, v5);
    atomic_store(result, (unint64_t *)&qword_25432B080);
  }
  return result;
}

uint64_t *sub_23DE5F35C(uint64_t *a1, uint64_t *a2, int *a3)
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
  char *v18;
  char *v19;
  uint64_t v20;
  char v21;
  uint64_t v22;
  _QWORD *v23;
  char *v24;
  uint64_t v25;
  int *v26;
  uint64_t v27;
  char *v28;
  uint64_t v29;
  uint64_t v30;
  unsigned int (*v31)(char *, uint64_t, uint64_t);
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  char *v35;
  char *v36;
  uint64_t v37;
  uint64_t v38;
  char *v39;
  char *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  char *__dst;

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
    sub_23DE4CF6C(0, &qword_256D0CD00, (uint64_t (*)(uint64_t))MEMORY[0x24BDED930], MEMORY[0x24BDEB560]);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v7 = sub_23DE66908();
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
    sub_23DE4CF6C(0, &qword_25432AB30, (uint64_t (*)(uint64_t))MEMORY[0x24BDFAF10], MEMORY[0x24BDEB560]);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v12 = sub_23DE66CD4();
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
    sub_23DE4CF6C(0, &qword_25432AF78, (uint64_t (*)(uint64_t))MEMORY[0x24BDFADE0], MEMORY[0x24BDEB560]);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v16 = sub_23DE66CC8();
      (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v16 - 8) + 16))(v14, v15, v16);
    }
    else
    {
      *v14 = *v15;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
    v17 = a3[7];
    v18 = (char *)a1 + v17;
    v19 = (char *)a2 + v17;
    v20 = *(_QWORD *)v19;
    v21 = v19[8];
    sub_23DE5F758(*(_QWORD *)v19, v21);
    *(_QWORD *)v18 = v20;
    v18[8] = v21;
    v22 = a3[8];
    v23 = (uint64_t *)((char *)a1 + v22);
    v24 = (char *)a2 + v22;
    v25 = *(uint64_t *)((char *)a2 + v22 + 8);
    *v23 = *(uint64_t *)((char *)a2 + v22);
    v23[1] = v25;
    v23[2] = *(uint64_t *)((char *)a2 + v22 + 16);
    v26 = (int *)type metadata accessor for MedicationsWidgetViewModel();
    v27 = v26[6];
    __dst = (char *)v23 + v27;
    v28 = &v24[v27];
    v29 = type metadata accessor for MedmojiIconConfiguration();
    v30 = *(_QWORD *)(v29 - 8);
    v31 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v30 + 48);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    if (v31(v28, 1, v29))
    {
      sub_23DE4CF6C(0, qword_25432AAD0, (uint64_t (*)(uint64_t))type metadata accessor for MedmojiIconConfiguration, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1C68]);
      memcpy(__dst, v28, *(_QWORD *)(*(_QWORD *)(v32 - 8) + 64));
    }
    else
    {
      v33 = sub_23DE66818();
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v33 - 8) + 16))(__dst, v28, v33);
      v34 = *(int *)(v29 + 20);
      v35 = &__dst[v34];
      v36 = &v28[v34];
      v37 = sub_23DE667DC();
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v37 - 8) + 16))(v35, v36, v37);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v30 + 56))(__dst, 0, 1, v29);
    }
    *((_BYTE *)v23 + v26[7]) = v24[v26[7]];
    v38 = v26[8];
    v39 = (char *)v23 + v38;
    v40 = &v24[v38];
    v41 = sub_23DE666F8();
    v42 = *(_QWORD *)(v41 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v42 + 48))(v40, 1, v41))
    {
      sub_23DE4CF6C(0, &qword_25432A770, (uint64_t (*)(uint64_t))MEMORY[0x24BDCE900], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1C68]);
      memcpy(v39, v40, *(_QWORD *)(*(_QWORD *)(v43 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v42 + 16))(v39, v40, v41);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v42 + 56))(v39, 0, 1, v41);
    }
  }
  return a1;
}

uint64_t sub_23DE5F758(uint64_t a1, char a2)
{
  uint64_t result;

  if ((a2 & 1) == 0)
    return swift_retain();
  return result;
}

uint64_t sub_23DE5F764(uint64_t a1, int *a2)
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
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t result;

  sub_23DE4CF6C(0, &qword_256D0CD00, (uint64_t (*)(uint64_t))MEMORY[0x24BDED930], MEMORY[0x24BDEB560]);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v4 = sub_23DE66908();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(a1, v4);
  }
  else
  {
    swift_release();
  }
  v5 = a1 + a2[5];
  sub_23DE4CF6C(0, &qword_25432AB30, (uint64_t (*)(uint64_t))MEMORY[0x24BDFAF10], MEMORY[0x24BDEB560]);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v6 = sub_23DE66CD4();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 8))(v5, v6);
  }
  else
  {
    swift_release();
  }
  v7 = a1 + a2[6];
  sub_23DE4CF6C(0, &qword_25432AF78, (uint64_t (*)(uint64_t))MEMORY[0x24BDFADE0], MEMORY[0x24BDEB560]);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v8 = sub_23DE66CC8();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 8))(v7, v8);
  }
  else
  {
    swift_release();
  }
  sub_23DE51598(*(_QWORD *)(a1 + a2[7]), *(_BYTE *)(a1 + a2[7] + 8));
  v9 = a1 + a2[8];
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v10 = type metadata accessor for MedicationsWidgetViewModel();
  v11 = v9 + *(int *)(v10 + 24);
  v12 = type metadata accessor for MedmojiIconConfiguration();
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 48))(v11, 1, v12))
  {
    v13 = sub_23DE66818();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v13 - 8) + 8))(v11, v13);
    v14 = v11 + *(int *)(v12 + 20);
    v15 = sub_23DE667DC();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v15 - 8) + 8))(v14, v15);
  }
  v16 = v9 + *(int *)(v10 + 32);
  v17 = sub_23DE666F8();
  v18 = *(_QWORD *)(v17 - 8);
  result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v18 + 48))(v16, 1, v17);
  if (!(_DWORD)result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(v18 + 8))(v16, v17);
  return result;
}

_QWORD *sub_23DE5F9A4(_QWORD *a1, _QWORD *a2, int *a3)
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
  char *v16;
  char *v17;
  uint64_t v18;
  char v19;
  uint64_t v20;
  _QWORD *v21;
  char *v22;
  uint64_t v23;
  int *v24;
  uint64_t v25;
  char *v26;
  char *v27;
  uint64_t v28;
  uint64_t v29;
  unsigned int (*v30)(char *, uint64_t, uint64_t);
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  char *v34;
  char *v35;
  uint64_t v36;
  uint64_t v37;
  char *v38;
  char *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  _QWORD *v44;

  sub_23DE4CF6C(0, &qword_256D0CD00, (uint64_t (*)(uint64_t))MEMORY[0x24BDED930], MEMORY[0x24BDEB560]);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v6 = sub_23DE66908();
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
  sub_23DE4CF6C(0, &qword_25432AB30, (uint64_t (*)(uint64_t))MEMORY[0x24BDFAF10], MEMORY[0x24BDEB560]);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v10 = sub_23DE66CD4();
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
  sub_23DE4CF6C(0, &qword_25432AF78, (uint64_t (*)(uint64_t))MEMORY[0x24BDFADE0], MEMORY[0x24BDEB560]);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v14 = sub_23DE66CC8();
    (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v14 - 8) + 16))(v12, v13, v14);
  }
  else
  {
    *v12 = *v13;
    swift_retain();
  }
  swift_storeEnumTagMultiPayload();
  v15 = a3[7];
  v16 = (char *)a1 + v15;
  v17 = (char *)a2 + v15;
  v18 = *(_QWORD *)v17;
  v19 = v17[8];
  sub_23DE5F758(*(_QWORD *)v17, v19);
  *(_QWORD *)v16 = v18;
  v16[8] = v19;
  v20 = a3[8];
  v44 = a1;
  v21 = (_QWORD *)((char *)a1 + v20);
  v22 = (char *)a2 + v20;
  v23 = *(_QWORD *)((char *)a2 + v20 + 8);
  *v21 = *(_QWORD *)((char *)a2 + v20);
  v21[1] = v23;
  v21[2] = *(_QWORD *)((char *)a2 + v20 + 16);
  v24 = (int *)type metadata accessor for MedicationsWidgetViewModel();
  v25 = v24[6];
  v26 = (char *)v21 + v25;
  v27 = &v22[v25];
  v28 = type metadata accessor for MedmojiIconConfiguration();
  v29 = *(_QWORD *)(v28 - 8);
  v30 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v29 + 48);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  if (v30(v27, 1, v28))
  {
    sub_23DE4CF6C(0, qword_25432AAD0, (uint64_t (*)(uint64_t))type metadata accessor for MedmojiIconConfiguration, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1C68]);
    memcpy(v26, v27, *(_QWORD *)(*(_QWORD *)(v31 - 8) + 64));
  }
  else
  {
    v32 = sub_23DE66818();
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v32 - 8) + 16))(v26, v27, v32);
    v33 = *(int *)(v28 + 20);
    v34 = &v26[v33];
    v35 = &v27[v33];
    v36 = sub_23DE667DC();
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v36 - 8) + 16))(v34, v35, v36);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v29 + 56))(v26, 0, 1, v28);
  }
  *((_BYTE *)v21 + v24[7]) = v22[v24[7]];
  v37 = v24[8];
  v38 = (char *)v21 + v37;
  v39 = &v22[v37];
  v40 = sub_23DE666F8();
  v41 = *(_QWORD *)(v40 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v41 + 48))(v39, 1, v40))
  {
    sub_23DE4CF6C(0, &qword_25432A770, (uint64_t (*)(uint64_t))MEMORY[0x24BDCE900], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1C68]);
    memcpy(v38, v39, *(_QWORD *)(*(_QWORD *)(v42 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v41 + 16))(v38, v39, v40);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v41 + 56))(v38, 0, 1, v40);
  }
  return v44;
}

_QWORD *sub_23DE5FD74(_QWORD *a1, _QWORD *a2, int *a3)
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
  char *v21;
  char *v22;
  uint64_t v23;
  char v24;
  uint64_t v25;
  char v26;
  uint64_t v27;
  _QWORD *v28;
  char *v29;
  int *v30;
  uint64_t v31;
  char *v32;
  char *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t (*v36)(char *, uint64_t, uint64_t);
  int v37;
  uint64_t (*v38)(uint64_t, uint64_t);
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  char *v42;
  char *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  char *v47;
  char *v48;
  uint64_t v49;
  uint64_t v50;
  char *v51;
  char *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t (*v55)(char *, uint64_t, uint64_t);
  int v56;
  int v57;
  uint64_t v58;

  if (a1 != a2)
  {
    v6 = (uint64_t (*)(uint64_t))MEMORY[0x24BDED930];
    v7 = (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BDEB560];
    sub_23DE5F0E0((uint64_t)a1, &qword_256D0CD00, (uint64_t (*)(uint64_t))MEMORY[0x24BDED930], MEMORY[0x24BDEB560]);
    sub_23DE4CF6C(0, &qword_256D0CD00, v6, v7);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v8 = sub_23DE66908();
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
    v12 = (uint64_t (*)(uint64_t))MEMORY[0x24BDFAF10];
    v13 = (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BDEB560];
    sub_23DE5F0E0((uint64_t)a1 + v9, &qword_25432AB30, (uint64_t (*)(uint64_t))MEMORY[0x24BDFAF10], MEMORY[0x24BDEB560]);
    sub_23DE4CF6C(0, &qword_25432AB30, v12, v13);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v14 = sub_23DE66CD4();
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
    v18 = (uint64_t (*)(uint64_t))MEMORY[0x24BDFADE0];
    sub_23DE5F0E0((uint64_t)a1 + v15, &qword_25432AF78, (uint64_t (*)(uint64_t))MEMORY[0x24BDFADE0], v13);
    sub_23DE4CF6C(0, &qword_25432AF78, v18, v13);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v19 = sub_23DE66CC8();
      (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v19 - 8) + 16))(v16, v17, v19);
    }
    else
    {
      *v16 = *v17;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
  }
  v20 = a3[7];
  v21 = (char *)a1 + v20;
  v22 = (char *)a2 + v20;
  v23 = *(_QWORD *)v22;
  v24 = v22[8];
  sub_23DE5F758(*(_QWORD *)v22, v24);
  v25 = *(_QWORD *)v21;
  v26 = v21[8];
  *(_QWORD *)v21 = v23;
  v21[8] = v24;
  sub_23DE51598(v25, v26);
  v27 = a3[8];
  v28 = (_QWORD *)((char *)a1 + v27);
  v29 = (char *)a2 + v27;
  *v28 = *(_QWORD *)((char *)a2 + v27);
  v28[1] = *(_QWORD *)((char *)a2 + v27 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v28[2] = *((_QWORD *)v29 + 2);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v30 = (int *)type metadata accessor for MedicationsWidgetViewModel();
  v31 = v30[6];
  v32 = (char *)v28 + v31;
  v33 = &v29[v31];
  v34 = type metadata accessor for MedmojiIconConfiguration();
  v35 = *(_QWORD *)(v34 - 8);
  v36 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v35 + 48);
  LODWORD(v21) = v36(v32, 1, v34);
  v37 = v36(v33, 1, v34);
  if ((_DWORD)v21)
  {
    if (v37)
    {
      v38 = (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1C68];
LABEL_17:
      sub_23DE4CF6C(0, qword_25432AAD0, (uint64_t (*)(uint64_t))type metadata accessor for MedmojiIconConfiguration, v38);
      memcpy(v32, v33, *(_QWORD *)(*(_QWORD *)(v39 - 8) + 64));
      goto LABEL_20;
    }
    v40 = sub_23DE66818();
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v40 - 8) + 16))(v32, v33, v40);
    v41 = *(int *)(v34 + 20);
    v42 = &v32[v41];
    v43 = &v33[v41];
    v44 = sub_23DE667DC();
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v44 - 8) + 16))(v42, v43, v44);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v35 + 56))(v32, 0, 1, v34);
  }
  else
  {
    if (v37)
    {
      sub_23DE513F8((uint64_t)v32, (uint64_t (*)(_QWORD))type metadata accessor for MedmojiIconConfiguration);
      v38 = (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1C68];
      goto LABEL_17;
    }
    v45 = sub_23DE66818();
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v45 - 8) + 24))(v32, v33, v45);
    v46 = *(int *)(v34 + 20);
    v47 = &v32[v46];
    v48 = &v33[v46];
    v49 = sub_23DE667DC();
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v49 - 8) + 24))(v47, v48, v49);
  }
LABEL_20:
  *((_BYTE *)v28 + v30[7]) = v29[v30[7]];
  v50 = v30[8];
  v51 = (char *)v28 + v50;
  v52 = &v29[v50];
  v53 = sub_23DE666F8();
  v54 = *(_QWORD *)(v53 - 8);
  v55 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v54 + 48);
  v56 = v55(v51, 1, v53);
  v57 = v55(v52, 1, v53);
  if (!v56)
  {
    if (!v57)
    {
      (*(void (**)(char *, char *, uint64_t))(v54 + 24))(v51, v52, v53);
      return a1;
    }
    (*(void (**)(char *, uint64_t))(v54 + 8))(v51, v53);
    goto LABEL_25;
  }
  if (v57)
  {
LABEL_25:
    sub_23DE4CF6C(0, &qword_25432A770, (uint64_t (*)(uint64_t))MEMORY[0x24BDCE900], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1C68]);
    memcpy(v51, v52, *(_QWORD *)(*(_QWORD *)(v58 - 8) + 64));
    return a1;
  }
  (*(void (**)(char *, char *, uint64_t))(v54 + 16))(v51, v52, v53);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v54 + 56))(v51, 0, 1, v53);
  return a1;
}

char *sub_23DE60298(char *a1, char *a2, int *a3)
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
  uint64_t v22;
  char *v23;
  char *v24;
  char *v25;
  char *v26;
  int *v27;
  uint64_t v28;
  char *v29;
  char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  char *v36;
  char *v37;
  uint64_t v38;
  uint64_t v39;
  char *v40;
  char *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;

  sub_23DE4CF6C(0, &qword_256D0CD00, (uint64_t (*)(uint64_t))MEMORY[0x24BDED930], MEMORY[0x24BDEB560]);
  v7 = v6;
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v8 = sub_23DE66908();
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
  sub_23DE4CF6C(0, &qword_25432AB30, (uint64_t (*)(uint64_t))MEMORY[0x24BDFAF10], MEMORY[0x24BDEB560]);
  v13 = v12;
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v14 = sub_23DE66CD4();
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
  sub_23DE4CF6C(0, &qword_25432AF78, (uint64_t (*)(uint64_t))MEMORY[0x24BDFADE0], MEMORY[0x24BDEB560]);
  v19 = v18;
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v20 = sub_23DE66CC8();
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v20 - 8) + 32))(v16, v17, v20);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(v16, v17, *(_QWORD *)(*(_QWORD *)(v19 - 8) + 64));
  }
  v21 = a3[7];
  v22 = a3[8];
  v23 = &a1[v21];
  v24 = &a2[v21];
  *(_QWORD *)v23 = *(_QWORD *)v24;
  v23[8] = v24[8];
  v25 = &a1[v22];
  v26 = &a2[v22];
  *(_OWORD *)v25 = *(_OWORD *)&a2[v22];
  *((_QWORD *)v25 + 2) = *(_QWORD *)&a2[v22 + 16];
  v27 = (int *)type metadata accessor for MedicationsWidgetViewModel();
  v28 = v27[6];
  v29 = &v25[v28];
  v30 = &v26[v28];
  v31 = type metadata accessor for MedmojiIconConfiguration();
  v32 = *(_QWORD *)(v31 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v32 + 48))(v30, 1, v31))
  {
    sub_23DE4CF6C(0, qword_25432AAD0, (uint64_t (*)(uint64_t))type metadata accessor for MedmojiIconConfiguration, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1C68]);
    memcpy(v29, v30, *(_QWORD *)(*(_QWORD *)(v33 - 8) + 64));
  }
  else
  {
    v34 = sub_23DE66818();
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v34 - 8) + 32))(v29, v30, v34);
    v35 = *(int *)(v31 + 20);
    v36 = &v29[v35];
    v37 = &v30[v35];
    v38 = sub_23DE667DC();
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v38 - 8) + 32))(v36, v37, v38);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v32 + 56))(v29, 0, 1, v31);
  }
  v25[v27[7]] = v26[v27[7]];
  v39 = v27[8];
  v40 = &v25[v39];
  v41 = &v26[v39];
  v42 = sub_23DE666F8();
  v43 = *(_QWORD *)(v42 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v43 + 48))(v41, 1, v42))
  {
    sub_23DE4CF6C(0, &qword_25432A770, (uint64_t (*)(uint64_t))MEMORY[0x24BDCE900], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1C68]);
    memcpy(v40, v41, *(_QWORD *)(*(_QWORD *)(v44 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v43 + 32))(v40, v41, v42);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v43 + 56))(v40, 0, 1, v42);
  }
  return a1;
}

char *sub_23DE6062C(char *a1, char *a2, int *a3)
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
  uint64_t v29;
  uint64_t v30;
  char v31;
  uint64_t v32;
  char *v33;
  char *v34;
  uint64_t v35;
  int *v36;
  uint64_t v37;
  char *v38;
  char *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t (*v42)(char *, uint64_t, uint64_t);
  int v43;
  int v44;
  uint64_t (*v45)(uint64_t, uint64_t);
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  char *v49;
  char *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  char *v54;
  char *v55;
  uint64_t v56;
  uint64_t v57;
  char *v58;
  char *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t (*v62)(char *, uint64_t, uint64_t);
  int v63;
  int v64;
  uint64_t v65;

  if (a1 != a2)
  {
    v6 = (uint64_t (*)(uint64_t))MEMORY[0x24BDED930];
    v7 = (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BDEB560];
    sub_23DE5F0E0((uint64_t)a1, &qword_256D0CD00, (uint64_t (*)(uint64_t))MEMORY[0x24BDED930], MEMORY[0x24BDEB560]);
    sub_23DE4CF6C(0, &qword_256D0CD00, v6, v7);
    v9 = v8;
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v10 = sub_23DE66908();
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
    v14 = (uint64_t (*)(uint64_t))MEMORY[0x24BDFAF10];
    v15 = (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BDEB560];
    sub_23DE5F0E0((uint64_t)&a1[v11], &qword_25432AB30, (uint64_t (*)(uint64_t))MEMORY[0x24BDFAF10], MEMORY[0x24BDEB560]);
    sub_23DE4CF6C(0, &qword_25432AB30, v14, v15);
    v17 = v16;
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v18 = sub_23DE66CD4();
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
    v22 = (uint64_t (*)(uint64_t))MEMORY[0x24BDFADE0];
    sub_23DE5F0E0((uint64_t)&a1[v19], &qword_25432AF78, (uint64_t (*)(uint64_t))MEMORY[0x24BDFADE0], v15);
    sub_23DE4CF6C(0, &qword_25432AF78, v22, v15);
    v24 = v23;
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v25 = sub_23DE66CC8();
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v25 - 8) + 32))(v20, v21, v25);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(v20, v21, *(_QWORD *)(*(_QWORD *)(v24 - 8) + 64));
    }
  }
  v26 = a3[7];
  v27 = &a1[v26];
  v28 = &a2[v26];
  v29 = *(_QWORD *)v28;
  LOBYTE(v28) = v28[8];
  v30 = *(_QWORD *)v27;
  v31 = v27[8];
  *(_QWORD *)v27 = v29;
  v27[8] = (char)v28;
  sub_23DE51598(v30, v31);
  v32 = a3[8];
  v33 = &a1[v32];
  v34 = &a2[v32];
  v35 = *(_QWORD *)&a2[v32 + 8];
  *(_QWORD *)v33 = *(_QWORD *)&a2[v32];
  *((_QWORD *)v33 + 1) = v35;
  swift_bridgeObjectRelease();
  *((_QWORD *)v33 + 2) = *((_QWORD *)v34 + 2);
  swift_bridgeObjectRelease();
  v36 = (int *)type metadata accessor for MedicationsWidgetViewModel();
  v37 = v36[6];
  v38 = &v33[v37];
  v39 = &v34[v37];
  v40 = type metadata accessor for MedmojiIconConfiguration();
  v41 = *(_QWORD *)(v40 - 8);
  v42 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v41 + 48);
  v43 = v42(v38, 1, v40);
  v44 = v42(v39, 1, v40);
  if (v43)
  {
    if (v44)
    {
      v45 = (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1C68];
LABEL_16:
      sub_23DE4CF6C(0, qword_25432AAD0, (uint64_t (*)(uint64_t))type metadata accessor for MedmojiIconConfiguration, v45);
      memcpy(v38, v39, *(_QWORD *)(*(_QWORD *)(v46 - 8) + 64));
      goto LABEL_19;
    }
    v47 = sub_23DE66818();
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v47 - 8) + 32))(v38, v39, v47);
    v48 = *(int *)(v40 + 20);
    v49 = &v38[v48];
    v50 = &v39[v48];
    v51 = sub_23DE667DC();
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v51 - 8) + 32))(v49, v50, v51);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v41 + 56))(v38, 0, 1, v40);
  }
  else
  {
    if (v44)
    {
      sub_23DE513F8((uint64_t)v38, (uint64_t (*)(_QWORD))type metadata accessor for MedmojiIconConfiguration);
      v45 = (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1C68];
      goto LABEL_16;
    }
    v52 = sub_23DE66818();
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v52 - 8) + 40))(v38, v39, v52);
    v53 = *(int *)(v40 + 20);
    v54 = &v38[v53];
    v55 = &v39[v53];
    v56 = sub_23DE667DC();
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v56 - 8) + 40))(v54, v55, v56);
  }
LABEL_19:
  v33[v36[7]] = v34[v36[7]];
  v57 = v36[8];
  v58 = &v33[v57];
  v59 = &v34[v57];
  v60 = sub_23DE666F8();
  v61 = *(_QWORD *)(v60 - 8);
  v62 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v61 + 48);
  v63 = v62(v58, 1, v60);
  v64 = v62(v59, 1, v60);
  if (!v63)
  {
    if (!v64)
    {
      (*(void (**)(char *, char *, uint64_t))(v61 + 40))(v58, v59, v60);
      return a1;
    }
    (*(void (**)(char *, uint64_t))(v61 + 8))(v58, v60);
    goto LABEL_24;
  }
  if (v64)
  {
LABEL_24:
    sub_23DE4CF6C(0, &qword_25432A770, (uint64_t (*)(uint64_t))MEMORY[0x24BDCE900], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1C68]);
    memcpy(v58, v59, *(_QWORD *)(*(_QWORD *)(v65 - 8) + 64));
    return a1;
  }
  (*(void (**)(char *, char *, uint64_t))(v61 + 32))(v58, v59, v60);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v61 + 56))(v58, 0, 1, v60);
  return a1;
}

uint64_t sub_23DE60B20()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_23DE60B2C(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unsigned int v14;

  sub_23DE4CF6C(0, &qword_256D0CCF8, (uint64_t (*)(uint64_t))MEMORY[0x24BDED930], MEMORY[0x24BDEB580]);
  v7 = *(_QWORD *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == (_DWORD)a2)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, a2, v6);
  sub_23DE4CF6C(0, &qword_25432AF88, (uint64_t (*)(uint64_t))MEMORY[0x24BDFAF10], MEMORY[0x24BDEB580]);
  v10 = *(_QWORD *)(v9 - 8);
  if (*(_DWORD *)(v10 + 84) == (_DWORD)a2)
  {
    v11 = v9;
    v12 = a3[5];
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v10 + 48))(a1 + v12, a2, v11);
  }
  sub_23DE4CF6C(0, &qword_25432AF80, (uint64_t (*)(uint64_t))MEMORY[0x24BDFADE0], MEMORY[0x24BDEB580]);
  v10 = *(_QWORD *)(v13 - 8);
  if (*(_DWORD *)(v10 + 84) == (_DWORD)a2)
  {
    v11 = v13;
    v12 = a3[6];
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v10 + 48))(a1 + v12, a2, v11);
  }
  if ((_DWORD)a2 != 254)
  {
    v11 = type metadata accessor for MedicationsWidgetViewModel();
    v10 = *(_QWORD *)(v11 - 8);
    v12 = a3[8];
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v10 + 48))(a1 + v12, a2, v11);
  }
  v14 = *(unsigned __int8 *)(a1 + a3[7] + 8);
  if (v14 > 1)
    return (v14 ^ 0xFF) + 1;
  else
    return 0;
}

uint64_t sub_23DE60C60()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

void sub_23DE60C6C(uint64_t a1, uint64_t a2, int a3, int *a4)
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

  sub_23DE4CF6C(0, &qword_256D0CCF8, (uint64_t (*)(uint64_t))MEMORY[0x24BDED930], MEMORY[0x24BDEB580]);
  v9 = *(_QWORD *)(v8 - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    v10 = v8;
    v11 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    v12 = a1;
  }
  else
  {
    sub_23DE4CF6C(0, &qword_25432AF88, (uint64_t (*)(uint64_t))MEMORY[0x24BDFAF10], MEMORY[0x24BDEB580]);
    v14 = *(_QWORD *)(v13 - 8);
    if (*(_DWORD *)(v14 + 84) == a3)
    {
      v10 = v13;
      v15 = a4[5];
    }
    else
    {
      sub_23DE4CF6C(0, &qword_25432AF80, (uint64_t (*)(uint64_t))MEMORY[0x24BDFADE0], MEMORY[0x24BDEB580]);
      v14 = *(_QWORD *)(v16 - 8);
      if (*(_DWORD *)(v14 + 84) == a3)
      {
        v10 = v16;
        v15 = a4[6];
      }
      else
      {
        if (a3 == 254)
        {
          *(_BYTE *)(a1 + a4[7] + 8) = -(char)a2;
          return;
        }
        v10 = type metadata accessor for MedicationsWidgetViewModel();
        v14 = *(_QWORD *)(v10 - 8);
        v15 = a4[8];
      }
    }
    v12 = a1 + v15;
    v11 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v14 + 56);
  }
  v11(v12, a2, a2, v10);
}

uint64_t type metadata accessor for MedicationsWidgetRectangularView()
{
  uint64_t result;

  result = qword_25432AEE0;
  if (!qword_25432AEE0)
    return swift_getSingletonMetadata();
  return result;
}

void sub_23DE60DDC()
{
  unint64_t v0;
  unint64_t v1;
  unint64_t v2;
  unint64_t v3;

  sub_23DE4CF6C(319, &qword_256D0CD00, (uint64_t (*)(uint64_t))MEMORY[0x24BDED930], MEMORY[0x24BDEB560]);
  if (v0 <= 0x3F)
  {
    sub_23DE4CF6C(319, &qword_25432AB30, (uint64_t (*)(uint64_t))MEMORY[0x24BDFAF10], MEMORY[0x24BDEB560]);
    if (v1 <= 0x3F)
    {
      sub_23DE4CF6C(319, &qword_25432AF78, (uint64_t (*)(uint64_t))MEMORY[0x24BDFADE0], MEMORY[0x24BDEB560]);
      if (v2 <= 0x3F)
      {
        type metadata accessor for MedicationsWidgetViewModel();
        if (v3 <= 0x3F)
          swift_initStructMetadata();
      }
    }
  }
}

uint64_t sub_23DE60EE8()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_23DE60EF8()
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
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD v16[2];

  v1 = v0;
  v2 = sub_23DE66A88();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)v16 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23DE6258C();
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)v16 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23DE62CA4(0);
  MEMORY[0x24BDAC7A8](v9);
  v11 = (char *)v16 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(_QWORD *)v8 = sub_23DE66A34();
  *((_QWORD *)v8 + 1) = 0;
  v8[16] = 1;
  sub_23DE62CB8();
  sub_23DE610DC(v1, (uint64_t)&v8[*(int *)(v12 + 44)]);
  v13 = sub_23DE66C5C();
  sub_23DE623C0(0.0, 1, 0.0, 1, INFINITY, 0, 0.0, 1, (uint64_t)v11, 0.0, 1, 0.0, 1, v13, v14, (void (*)(uint64_t, uint64_t))sub_23DE62DB4, (uint64_t (*)(_QWORD))sub_23DE62CA4);
  sub_23DE513F8((uint64_t)v8, (uint64_t (*)(_QWORD))sub_23DE6258C);
  v16[1] = sub_23DE66BE4();
  sub_23DE66A7C();
  sub_23DE62D34();
  sub_23DE66BB4();
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  swift_release();
  return sub_23DE513F8((uint64_t)v11, (uint64_t (*)(_QWORD))sub_23DE62CA4);
}

uint64_t sub_23DE610DC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
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
  uint64_t *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  char *v36;
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
  char v60;
  uint64_t v61;
  void (*v62)(char *, _QWORD, uint64_t);
  char *v63;
  uint64_t v64;
  uint64_t KeyPath;
  char v66;
  uint64_t v67;
  char *v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t *v73;
  uint64_t v74;
  char *v75;
  uint64_t v76;
  uint64_t v77;
  char *v78;
  char *v79;
  void (*v80)(char *, uint64_t);
  char *v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t *v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  char v94;
  char v95;
  uint64_t v96;
  uint64_t v97;
  char *v98;
  uint64_t v99;
  void (*v100)(char *, uint64_t);
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  char v106;
  int v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  char v113;
  char v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  char v118;
  char v119;
  uint64_t v120;
  uint64_t v121;
  char v122;
  int v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t *v127;
  uint64_t v128;
  uint64_t OpaqueTypeConformance2;
  uint64_t v130;
  char v131;
  uint64_t v132;
  uint64_t v133;
  uint64_t v134;
  unint64_t v135;
  uint64_t v136;
  uint64_t v137;
  uint64_t v138;
  uint64_t v139;
  uint64_t v140;
  uint64_t *v141;
  uint64_t v142;
  char *v143;
  uint64_t v144;
  char *v145;
  uint64_t v146;
  uint64_t v147;
  char *v148;
  uint64_t v149;
  uint64_t v150;
  uint64_t v151;
  uint64_t v152;
  uint64_t v153;
  uint64_t v154;
  uint64_t v156;
  uint64_t v157;
  uint64_t v158;
  uint64_t v159;
  uint64_t v160;
  _BYTE *v161;
  uint64_t v162;
  char *v163;
  char *v164;
  uint64_t v165;
  char *v166;
  uint64_t v167;
  uint64_t v168;
  uint64_t v169;
  char *v170;
  uint64_t v171;
  char *v172;
  uint64_t v173;
  uint64_t v174;
  char *v175;
  uint64_t v176;
  uint64_t v177;
  uint64_t v178;
  uint64_t v179;
  uint64_t v180;
  uint64_t v181;
  char *v182;
  uint64_t v183;
  uint64_t v184;
  char *v185;
  char *v186;
  uint64_t v187;
  uint64_t v188;
  uint64_t v189;
  char *v190;
  uint64_t v191;
  uint64_t v192;
  uint64_t v193;
  uint64_t v194;
  uint64_t v195;
  uint64_t *v196;
  uint64_t v197;
  char *v198;
  uint64_t v199;
  uint64_t v200;
  uint64_t v201;
  uint64_t v202;
  char v203;
  uint64_t v204;
  uint64_t v205;

  v201 = a2;
  v3 = type metadata accessor for MedicationsWidgetRectangularView();
  v158 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v159 = v4;
  v160 = (uint64_t)&v156 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23DE5AAC0(0);
  MEMORY[0x24BDAC7A8](v5);
  v161 = (char *)&v156 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23DE62B6C(0);
  v195 = v7;
  MEMORY[0x24BDAC7A8](v7);
  v162 = (uint64_t)&v156 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23DE62AE0(0);
  v197 = v9;
  v165 = *(_QWORD *)(v9 - 8);
  MEMORY[0x24BDAC7A8](v9);
  v164 = (char *)&v156 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23DE62A28(0);
  v200 = v11;
  v167 = *(_QWORD *)(v11 - 8);
  v12 = MEMORY[0x24BDAC7A8](v11);
  v163 = (char *)&v156 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v12);
  v166 = (char *)&v156 - v14;
  sub_23DE62DC0(0, &qword_256D0CE30, MEMORY[0x24BDEF380]);
  v194 = v15;
  MEMORY[0x24BDAC7A8](v15);
  v196 = (uint64_t *)((char *)&v156 - v16);
  v17 = sub_23DE66908();
  v191 = *(_QWORD *)(v17 - 8);
  v192 = v17;
  v18 = MEMORY[0x24BDAC7A8](v17);
  v190 = (char *)&v156 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v18);
  v189 = (uint64_t)&v156 - v20;
  sub_23DE629B4(0);
  v22 = MEMORY[0x24BDAC7A8](v21);
  v199 = (uint64_t)&v156 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v22);
  v198 = (char *)&v156 - v24;
  v188 = sub_23DE66CC8();
  v187 = *(_QWORD *)(v188 - 8);
  v25 = MEMORY[0x24BDAC7A8](v188);
  v186 = (char *)&v156 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v25);
  v183 = (uint64_t)&v156 - v27;
  sub_23DE4CF6C(0, &qword_256D0CDA0, (uint64_t (*)(uint64_t))MEMORY[0x24BDF40C0], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BDF1008]);
  v177 = v28;
  MEMORY[0x24BDAC7A8](v28);
  v30 = (uint64_t *)((char *)&v156 - v29);
  v174 = sub_23DE66C08();
  v31 = *(_QWORD *)(v174 - 8);
  MEMORY[0x24BDAC7A8](v174);
  v172 = (char *)&v156 - ((v32 + 15) & 0xFFFFFFFFFFFFFFF0);
  v33 = sub_23DE66CD4();
  v34 = *(_QWORD *)(v33 - 8);
  MEMORY[0x24BDAC7A8](v33);
  v36 = (char *)&v156 - ((v35 + 15) & 0xFFFFFFFFFFFFFFF0);
  v37 = sub_23DE66A10();
  MEMORY[0x24BDAC7A8](v37);
  sub_23DE62878();
  v171 = v38;
  MEMORY[0x24BDAC7A8](v38);
  v40 = (char *)&v156 - ((v39 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23DE62864(0);
  v176 = v41;
  MEMORY[0x24BDAC7A8](v41);
  v173 = (uint64_t)&v156 - ((v42 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23DE627D8(0);
  v178 = v43;
  v179 = *(_QWORD *)(v43 - 8);
  MEMORY[0x24BDAC7A8](v43);
  v175 = (char *)&v156 - ((v44 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23DE62720(0);
  v181 = v45;
  v180 = *(_QWORD *)(v45 - 8);
  MEMORY[0x24BDAC7A8](v45);
  v170 = (char *)&v156 - ((v46 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23DE626A4();
  v184 = v47;
  MEMORY[0x24BDAC7A8](v47);
  v185 = (char *)&v156 - ((v48 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23DE62640();
  v50 = MEMORY[0x24BDAC7A8](v49);
  v193 = (uint64_t)&v156 - ((v51 + 15) & 0xFFFFFFFFFFFFFFF0);
  v52 = MEMORY[0x24BDAC7A8](v50);
  v182 = (char *)&v156 - v53;
  MEMORY[0x24BDAC7A8](v52);
  v202 = (uint64_t)&v156 - v54;
  sub_23DE66A04();
  sub_23DE669F8();
  v169 = v3;
  v168 = a1;
  sub_23DE50ADC((uint64_t)v36);
  (*(void (**)(char *, uint64_t))(v34 + 8))(v36, v33);
  sub_23DE66BFC();
  sub_23DE669E0();
  swift_release();
  sub_23DE669F8();
  v157 = a1 + *(int *)(v3 + 32);
  sub_23DE669EC();
  sub_23DE669F8();
  sub_23DE66A1C();
  v55 = sub_23DE66B30();
  v57 = v56;
  v59 = v58;
  LOBYTE(v36) = v60 & 1;
  v61 = v31;
  v62 = *(void (**)(char *, _QWORD, uint64_t))(v31 + 104);
  v63 = v172;
  v64 = v174;
  v62(v172, *MEMORY[0x24BDF40B0], v174);
  KeyPath = swift_getKeyPath();
  (*(void (**)(char *, char *, uint64_t))(v61 + 16))((char *)v30 + *(int *)(v177 + 28), v63, v64);
  *v30 = KeyPath;
  sub_23DE62F30((uint64_t)v30, (uint64_t)&v40[*(int *)(v171 + 36)]);
  *(_QWORD *)v40 = v55;
  *((_QWORD *)v40 + 1) = v57;
  v40[16] = (char)v36;
  *((_QWORD *)v40 + 3) = v59;
  sub_23DE62F8C(v55, v57, (char)v36);
  swift_bridgeObjectRetain();
  sub_23DE5F0E0((uint64_t)v30, &qword_256D0CDA0, (uint64_t (*)(uint64_t))MEMORY[0x24BDF40C0], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BDF1008]);
  (*(void (**)(char *, uint64_t))(v61 + 8))(v63, v64);
  v66 = (char)v36;
  v67 = v168;
  v68 = v170;
  sub_23DE5AD5C(v55, v57, v66);
  swift_bridgeObjectRelease();
  v69 = sub_23DE66B00();
  v70 = swift_getKeyPath();
  v71 = v173;
  sub_23DE51318((uint64_t)v40, v173, (uint64_t (*)(_QWORD))sub_23DE62878);
  v72 = v176;
  v73 = (uint64_t *)(v71 + *(int *)(v176 + 36));
  *v73 = v70;
  v73[1] = v69;
  sub_23DE513F8((uint64_t)v40, (uint64_t (*)(_QWORD))sub_23DE62878);
  v74 = sub_23DE62BFC(&qword_256D0CDA8, (uint64_t (*)(uint64_t))sub_23DE62864, (uint64_t (*)(void))sub_23DE628EC);
  v75 = v175;
  sub_23DE66B84();
  sub_23DE513F8(v71, (uint64_t (*)(_QWORD))sub_23DE62864);
  v204 = v72;
  v205 = v74;
  swift_getOpaqueTypeConformance2();
  v76 = v178;
  sub_23DE66B54();
  (*(void (**)(char *, uint64_t))(v179 + 8))(v75, v76);
  v77 = v183;
  sub_23DE50C70(v183);
  v78 = v186;
  sub_23DE66CBC();
  v79 = v78;
  LOBYTE(v78) = sub_23DE66CB0();
  v80 = *(void (**)(char *, uint64_t))(v187 + 8);
  v81 = v79;
  v82 = v188;
  v80(v81, v188);
  v80((char *)v77, v82);
  if ((v78 & 1) != 0)
    v83 = sub_23DE66BE4();
  else
    v83 = sub_23DE66BCC();
  v84 = v83;
  v85 = swift_getKeyPath();
  v86 = v180;
  v87 = (uint64_t)v185;
  v88 = v181;
  (*(void (**)(char *, char *, uint64_t))(v180 + 16))(v185, v68, v181);
  v89 = (uint64_t *)(v87 + *(int *)(v184 + 36));
  *v89 = v85;
  v89[1] = v84;
  (*(void (**)(char *, uint64_t))(v86 + 8))(v68, v88);
  if (qword_25432AB88 != -1)
    swift_once();
  v204 = sub_23DE665E4();
  v205 = v90;
  sub_23DE4CD84();
  v91 = sub_23DE66B3C();
  v93 = v92;
  v95 = v94 & 1;
  sub_23DE6303C();
  v96 = (uint64_t)v182;
  sub_23DE66BA8();
  sub_23DE5AD5C(v91, v93, v95);
  swift_bridgeObjectRelease();
  sub_23DE513F8(v87, (uint64_t (*)(_QWORD))sub_23DE626A4);
  sub_23DE5F014(v96, v202, (uint64_t (*)(_QWORD))sub_23DE62640);
  v97 = v189;
  sub_23DE50C44(v189);
  v98 = v190;
  sub_23DE668FC();
  sub_23DE4CD44(&qword_256D0CE48, (uint64_t (*)(uint64_t))MEMORY[0x24BDED930], MEMORY[0x24BDED950]);
  v99 = v192;
  LOBYTE(v91) = sub_23DE66EF0();
  v100 = *(void (**)(char *, uint64_t))(v191 + 8);
  v100(v98, v99);
  v100((char *)v97, v99);
  if ((v91 & 1) != 0)
  {
    v101 = sub_23DE66C68();
    v204 = MEMORY[0x2426460B8](45, 0xE100000000000000, v101);
    v205 = v102;
    v103 = sub_23DE66B3C();
    v191 = v104;
    v192 = v103;
    v189 = v105;
    v107 = v106 & 1;
    v108 = sub_23DE66C74();
    v204 = MEMORY[0x2426460B8](45, 0xE100000000000000, v108);
    v205 = v109;
    v110 = sub_23DE66B3C();
    v112 = v111;
    v114 = v113 & 1;
    sub_23DE66BF0();
    v115 = sub_23DE66B18();
    v117 = v116;
    v119 = v118;
    v121 = v120;
    swift_release();
    v122 = v119 & 1;
    sub_23DE5AD5C(v110, v112, v114);
    swift_bridgeObjectRelease();
    v123 = v107;
    v203 = v107;
    v125 = v191;
    v124 = v192;
    sub_23DE62F8C(v192, v191, v107);
    v126 = v189;
    swift_bridgeObjectRetain();
    sub_23DE62F8C(v115, v117, v122);
    swift_bridgeObjectRetain();
    LODWORD(v190) = v123;
    sub_23DE62F8C(v124, v125, v123);
    swift_bridgeObjectRetain();
    sub_23DE62F8C(v115, v117, v122);
    swift_bridgeObjectRetain();
    sub_23DE5AD5C(v115, v117, v122);
    swift_bridgeObjectRelease();
    sub_23DE5AD5C(v124, v125, v203);
    swift_bridgeObjectRelease();
    v127 = v196;
    *v196 = v124;
    v127[1] = v125;
    *((_BYTE *)v127 + 16) = v123;
    v127[3] = v126;
    v127[4] = v115;
    v127[5] = v117;
    *((_BYTE *)v127 + 48) = v122;
    v127[7] = v121;
    swift_storeEnumTagMultiPayload();
    sub_23DE4CF6C(0, &qword_256D0CDD8, (uint64_t (*)(uint64_t))sub_23DE629C8, MEMORY[0x24BDF53F0]);
    sub_23DE633E4(&qword_256D0CE50, &qword_256D0CDD8, (uint64_t (*)(uint64_t))sub_23DE629C8);
    v128 = sub_23DE62BFC(&qword_256D0CE00, (uint64_t (*)(uint64_t))sub_23DE62B6C, sub_23DE62C88);
    v204 = v195;
    v205 = v128;
    OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
    v204 = v197;
    v205 = OpaqueTypeConformance2;
    swift_getOpaqueTypeConformance2();
    v130 = (uint64_t)v198;
    sub_23DE66A70();
    sub_23DE5AD5C(v115, v117, v122);
    swift_bridgeObjectRelease();
    sub_23DE5AD5C(v192, v191, (char)v190);
    swift_bridgeObjectRelease();
  }
  else
  {
    v131 = sub_23DE66AC4();
    v132 = (uint64_t)v161;
    *v161 = v131;
    sub_23DE5ACB0();
    v204 = *(_QWORD *)(v157 + 16);
    swift_getKeyPath();
    v133 = v67;
    v134 = v160;
    sub_23DE51318(v133, v160, (uint64_t (*)(_QWORD))type metadata accessor for MedicationsWidgetRectangularView);
    v135 = (*(unsigned __int8 *)(v158 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v158 + 80);
    v136 = swift_allocObject();
    sub_23DE5F014(v134, v136 + v135, (uint64_t (*)(_QWORD))type metadata accessor for MedicationsWidgetRectangularView);
    sub_23DE5EA04(0, &qword_25432B178, MEMORY[0x24BEE0D00], MEMORY[0x24BEE1250]);
    sub_23DE5ABF8();
    swift_bridgeObjectRetain();
    sub_23DE66C38();
    v137 = sub_23DE66AD0();
    v138 = swift_getKeyPath();
    v139 = v162;
    sub_23DE51318(v132, v162, (uint64_t (*)(_QWORD))sub_23DE5AAC0);
    v140 = v195;
    v141 = (uint64_t *)(v139 + *(int *)(v195 + 36));
    *v141 = v138;
    v141[1] = v137;
    sub_23DE513F8(v132, (uint64_t (*)(_QWORD))sub_23DE5AAC0);
    v142 = sub_23DE62BFC(&qword_256D0CE00, (uint64_t (*)(uint64_t))sub_23DE62B6C, sub_23DE62C88);
    v143 = v164;
    sub_23DE66BC0();
    sub_23DE513F8(v139, (uint64_t (*)(_QWORD))sub_23DE62B6C);
    v204 = v140;
    v205 = v142;
    v144 = swift_getOpaqueTypeConformance2();
    v145 = v163;
    v146 = v197;
    sub_23DE66B9C();
    (*(void (**)(char *, uint64_t))(v165 + 8))(v143, v146);
    v147 = v167;
    v148 = v166;
    v149 = v200;
    (*(void (**)(char *, char *, uint64_t))(v167 + 32))(v166, v145, v200);
    (*(void (**)(uint64_t *, char *, uint64_t))(v147 + 16))(v196, v148, v149);
    swift_storeEnumTagMultiPayload();
    sub_23DE4CF6C(0, &qword_256D0CDD8, (uint64_t (*)(uint64_t))sub_23DE629C8, MEMORY[0x24BDF53F0]);
    sub_23DE633E4(&qword_256D0CE50, &qword_256D0CDD8, (uint64_t (*)(uint64_t))sub_23DE629C8);
    v204 = v146;
    v205 = v144;
    swift_getOpaqueTypeConformance2();
    v130 = (uint64_t)v198;
    sub_23DE66A70();
    (*(void (**)(char *, uint64_t))(v147 + 8))(v148, v149);
  }
  v150 = v202;
  v151 = v193;
  sub_23DE51318(v202, v193, (uint64_t (*)(_QWORD))sub_23DE62640);
  v152 = v199;
  sub_23DE51318(v130, v199, (uint64_t (*)(_QWORD))sub_23DE629B4);
  v153 = v201;
  sub_23DE51318(v151, v201, (uint64_t (*)(_QWORD))sub_23DE62640);
  sub_23DE62624(0);
  sub_23DE51318(v152, v153 + *(int *)(v154 + 48), (uint64_t (*)(_QWORD))sub_23DE629B4);
  sub_23DE513F8(v130, (uint64_t (*)(_QWORD))sub_23DE629B4);
  sub_23DE513F8(v150, (uint64_t (*)(_QWORD))sub_23DE62640);
  sub_23DE513F8(v152, (uint64_t (*)(_QWORD))sub_23DE629B4);
  return sub_23DE513F8(v151, (uint64_t (*)(_QWORD))sub_23DE62640);
}

uint64_t sub_23DE62238@<X0>(uint64_t a1@<X1>, uint64_t a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char v7;
  char v8;
  uint64_t v9;
  uint64_t v10;
  char v11;
  char v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char v16;
  char v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t result;

  sub_23DE4CD84();
  swift_bridgeObjectRetain();
  v4 = sub_23DE66B3C();
  v6 = v5;
  v8 = v7;
  v9 = a1 + *(int *)(type metadata accessor for MedicationsWidgetRectangularView() + 28);
  v10 = *(_QWORD *)v9;
  v11 = *(_BYTE *)(v9 + 8);
  sub_23DE5F758(*(_QWORD *)v9, v11);
  v12 = sub_23DE50EE4(v10, v11);
  sub_23DE51598(v10, v11);
  if ((v12 & 1) != 0)
    sub_23DE66BD8();
  v13 = sub_23DE66B18();
  v15 = v14;
  v17 = v16;
  v19 = v18;
  swift_release();
  sub_23DE5AD5C(v4, v6, v8 & 1);
  result = swift_bridgeObjectRelease();
  *(_QWORD *)a2 = v13;
  *(_QWORD *)(a2 + 8) = v15;
  *(_BYTE *)(a2 + 16) = v17 & 1;
  *(_QWORD *)(a2 + 24) = v19;
  return result;
}

double sub_23DE62368@<D0>(double a1@<X0>, char a2@<W1>, double a3@<X2>, char a4@<W3>, double a5@<X4>, char a6@<W5>, double a7@<X6>, char a8@<W7>, uint64_t a9@<X8>, double a10, char a11, double a12, char a13, uint64_t a14, uint64_t a15)
{
  double result;

  *(_QWORD *)&result = sub_23DE623C0(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, (void (*)(uint64_t, uint64_t))sub_23DE6342C, (uint64_t (*)(_QWORD))sub_23DE6365C).n128_u64[0];
  return result;
}

__n128 sub_23DE623C0@<Q0>(double a1@<X0>, char a2@<W1>, double a3@<X2>, char a4@<W3>, double a5@<X4>, char a6@<W5>, double a7@<X6>, char a8@<W7>, uint64_t a9@<X8>, double a10, char a11, double a12, char a13, uint64_t a14, uint64_t a15, void (*a16)(uint64_t, uint64_t), uint64_t (*a17)(_QWORD))
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
    sub_23DE66E48();
    v29 = (void *)sub_23DE66AAC();
    sub_23DE66854();

    v20 = a17;
  }
  sub_23DE66914();
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

void sub_23DE6258C()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_256D0CD58)
  {
    sub_23DE4CF6C(255, &qword_256D0CD60, (uint64_t (*)(uint64_t))sub_23DE62624, MEMORY[0x24BDF53F0]);
    sub_23DE633E4(&qword_256D0CE08, &qword_256D0CD60, (uint64_t (*)(uint64_t))sub_23DE62624);
    v0 = sub_23DE66C20();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_256D0CD58);
  }
}

void sub_23DE62624(uint64_t a1)
{
  sub_23DE5A888(a1, &qword_256D0CD68, (void (*)(uint64_t))sub_23DE62640, sub_23DE629B4);
}

void sub_23DE62640()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_256D0CD70)
  {
    sub_23DE626A4();
    sub_23DE66AA0();
    v0 = sub_23DE668F0();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_256D0CD70);
  }
}

void sub_23DE626A4()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_256D0CD78)
  {
    sub_23DE62720(255);
    sub_23DE5E748(255, &qword_256D0CDC0, &qword_256D0CDC8, MEMORY[0x24BDF3E48]);
    v0 = sub_23DE668F0();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_256D0CD78);
  }
}

void sub_23DE62720(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  _QWORD v6[2];

  if (!qword_256D0CD80)
  {
    sub_23DE627D8(255);
    v3 = v2;
    sub_23DE62864(255);
    sub_23DE62BFC(&qword_256D0CDA8, (uint64_t (*)(uint64_t))sub_23DE62864, (uint64_t (*)(void))sub_23DE628EC);
    v6[0] = v3;
    v6[1] = swift_getOpaqueTypeConformance2();
    v4 = MEMORY[0x242646598](a1, v6, MEMORY[0x24BDFAC10], 0);
    if (!v5)
      atomic_store(v4, (unint64_t *)&qword_256D0CD80);
  }
}

void sub_23DE627D8(uint64_t a1)
{
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;
  _QWORD v5[2];

  if (!qword_256D0CD88)
  {
    sub_23DE62864(255);
    v5[0] = v2;
    v5[1] = sub_23DE62BFC(&qword_256D0CDA8, (uint64_t (*)(uint64_t))sub_23DE62864, (uint64_t (*)(void))sub_23DE628EC);
    v3 = MEMORY[0x242646598](a1, v5, MEMORY[0x24BDF2268], 0);
    if (!v4)
      atomic_store(v3, (unint64_t *)&qword_256D0CD88);
  }
}

void sub_23DE62864(uint64_t a1)
{
  sub_23DE62B80(a1, &qword_256D0CD90, (void (*)(uint64_t))sub_23DE62878);
}

void sub_23DE62878()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_256D0CD98)
  {
    sub_23DE4CF6C(255, &qword_256D0CDA0, (uint64_t (*)(uint64_t))MEMORY[0x24BDF40C0], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BDF1008]);
    v0 = sub_23DE668F0();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_256D0CD98);
  }
}

unint64_t sub_23DE628EC()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;
  _QWORD v4[2];

  result = qword_256D0CDB0;
  if (!qword_256D0CDB0)
  {
    sub_23DE62878();
    v2 = v1;
    v3 = sub_23DE62954();
    v4[0] = MEMORY[0x24BDF1F80];
    v4[1] = v3;
    result = MEMORY[0x2426465BC](MEMORY[0x24BDED308], v2, v4);
    atomic_store(result, (unint64_t *)&qword_256D0CDB0);
  }
  return result;
}

unint64_t sub_23DE62954()
{
  unint64_t result;
  uint64_t v1;

  result = qword_256D0CDB8;
  if (!qword_256D0CDB8)
  {
    sub_23DE4CF6C(255, &qword_256D0CDA0, (uint64_t (*)(uint64_t))MEMORY[0x24BDF40C0], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BDF1008]);
    result = MEMORY[0x2426465BC](MEMORY[0x24BDF1028], v1);
    atomic_store(result, (unint64_t *)&qword_256D0CDB8);
  }
  return result;
}

void sub_23DE629B4(uint64_t a1)
{
  sub_23DE62DC0(a1, &qword_256D0CDD0, MEMORY[0x24BDEF3B8]);
}

void sub_23DE629C8()
{
  unint64_t TupleTypeMetadata2;
  uint64_t v1;

  if (!qword_256D0CDE0)
  {
    TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
    if (!v1)
      atomic_store(TupleTypeMetadata2, (unint64_t *)&qword_256D0CDE0);
  }
}

void sub_23DE62A28(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  _QWORD v6[2];

  if (!qword_256D0CDE8)
  {
    sub_23DE62AE0(255);
    v3 = v2;
    sub_23DE62B6C(255);
    sub_23DE62BFC(&qword_256D0CE00, (uint64_t (*)(uint64_t))sub_23DE62B6C, sub_23DE62C88);
    v6[0] = v3;
    v6[1] = swift_getOpaqueTypeConformance2();
    v4 = MEMORY[0x242646598](a1, v6, MEMORY[0x24BDF29E0], 0);
    if (!v5)
      atomic_store(v4, (unint64_t *)&qword_256D0CDE8);
  }
}

void sub_23DE62AE0(uint64_t a1)
{
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;
  _QWORD v5[2];

  if (!qword_256D0CDF0)
  {
    sub_23DE62B6C(255);
    v5[0] = v2;
    v5[1] = sub_23DE62BFC(&qword_256D0CE00, (uint64_t (*)(uint64_t))sub_23DE62B6C, sub_23DE62C88);
    v3 = MEMORY[0x242646598](a1, v5, MEMORY[0x24BDF3A38], 0);
    if (!v4)
      atomic_store(v3, (unint64_t *)&qword_256D0CDF0);
  }
}

void sub_23DE62B6C(uint64_t a1)
{
  sub_23DE62B80(a1, &qword_256D0CDF8, sub_23DE5AAC0);
}

void sub_23DE62B80(uint64_t a1, unint64_t *a2, void (*a3)(uint64_t))
{
  unint64_t v4;
  uint64_t v5;

  if (!*a2)
  {
    a3(255);
    sub_23DE5E748(255, &qword_25432B098, &qword_25432B0B0, MEMORY[0x24BDF1948]);
    v4 = sub_23DE668F0();
    if (!v5)
      atomic_store(v4, a2);
  }
}

uint64_t sub_23DE62BFC(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t (*a3)(void))
{
  uint64_t result;
  uint64_t v6;
  _QWORD v7[2];

  result = *a1;
  if (!result)
  {
    v6 = a2(255);
    v7[0] = a3();
    v7[1] = sub_23DE5EBB8(&qword_25432B090, &qword_25432B098, &qword_25432B0B0, MEMORY[0x24BDF1948]);
    result = MEMORY[0x2426465BC](MEMORY[0x24BDED308], v6, v7);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_23DE62C88()
{
  return sub_23DE4CD44(&qword_25432AF90, (uint64_t (*)(uint64_t))sub_23DE5AAC0, MEMORY[0x24BDEBE40]);
}

void sub_23DE62CA4(uint64_t a1)
{
  sub_23DE63670(a1, &qword_256D0CE10, (void (*)(uint64_t))sub_23DE6258C);
}

void sub_23DE62CB8()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_256D0CE18)
  {
    sub_23DE4CF6C(255, &qword_256D0CD60, (uint64_t (*)(uint64_t))sub_23DE62624, MEMORY[0x24BDF53F0]);
    v0 = sub_23DE668E4();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_256D0CE18);
  }
}

unint64_t sub_23DE62D34()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;
  _QWORD v3[2];

  result = qword_256D0CE20;
  if (!qword_256D0CE20)
  {
    sub_23DE62CA4(255);
    v2 = v1;
    v3[0] = sub_23DE4CD44(&qword_256D0CE28, (uint64_t (*)(uint64_t))sub_23DE6258C, MEMORY[0x24BDF4700]);
    v3[1] = MEMORY[0x24BDEDBB8];
    result = MEMORY[0x2426465BC](MEMORY[0x24BDED308], v2, v3);
    atomic_store(result, (unint64_t *)&qword_256D0CE20);
  }
  return result;
}

uint64_t sub_23DE62DB4(uint64_t a1, uint64_t a2)
{
  return sub_23DE51318(a1, a2, (uint64_t (*)(_QWORD))sub_23DE6258C);
}

void sub_23DE62DC0(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t, uint64_t, uint64_t))
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;

  if (!*a2)
  {
    sub_23DE4CF6C(255, &qword_256D0CDD8, (uint64_t (*)(uint64_t))sub_23DE629C8, MEMORY[0x24BDF53F0]);
    v7 = v6;
    sub_23DE62A28(255);
    v9 = a3(a1, v7, v8);
    if (!v10)
      atomic_store(v9, a2);
  }
}

uint64_t sub_23DE62E40@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  result = sub_23DE6695C();
  *a1 = result;
  return result;
}

uint64_t sub_23DE62E68()
{
  swift_retain();
  return sub_23DE66968();
}

uint64_t sub_23DE62E90()
{
  return sub_23DE66920();
}

uint64_t sub_23DE62EB0(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v6;

  v2 = sub_23DE66C08();
  MEMORY[0x24BDAC7A8](v2);
  (*(void (**)(char *, uint64_t))(v4 + 16))((char *)&v6 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0), a1);
  return sub_23DE6692C();
}

uint64_t sub_23DE62F30(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  sub_23DE4CF6C(0, &qword_256D0CDA0, (uint64_t (*)(uint64_t))MEMORY[0x24BDF40C0], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BDF1008]);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_23DE62F8C(uint64_t a1, uint64_t a2, char a3)
{
  if ((a3 & 1) != 0)
    return swift_retain();
  else
    return swift_bridgeObjectRetain();
}

uint64_t sub_23DE62F9C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  result = sub_23DE6695C();
  *a1 = result;
  return result;
}

uint64_t sub_23DE62FC4()
{
  swift_retain();
  return sub_23DE66968();
}

uint64_t sub_23DE62FEC@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  result = sub_23DE66938();
  *a1 = result;
  return result;
}

uint64_t sub_23DE63014()
{
  swift_retain();
  return sub_23DE66944();
}

unint64_t sub_23DE6303C()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD v5[4];

  result = qword_256D0CE38;
  if (!qword_256D0CE38)
  {
    sub_23DE626A4();
    v2 = v1;
    sub_23DE627D8(255);
    v4 = v3;
    sub_23DE62864(255);
    sub_23DE62BFC(&qword_256D0CDA8, (uint64_t (*)(uint64_t))sub_23DE62864, (uint64_t (*)(void))sub_23DE628EC);
    v5[2] = v4;
    v5[3] = swift_getOpaqueTypeConformance2();
    v5[0] = swift_getOpaqueTypeConformance2();
    v5[1] = sub_23DE5EBB8(&qword_256D0CE40, &qword_256D0CDC0, &qword_256D0CDC8, MEMORY[0x24BDF3E48]);
    result = MEMORY[0x2426465BC](MEMORY[0x24BDED308], v2, v5);
    atomic_store(result, (unint64_t *)&qword_256D0CE38);
  }
  return result;
}

uint64_t sub_23DE6312C()
{
  uint64_t v0;
  int *v1;
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

  v1 = (int *)type metadata accessor for MedicationsWidgetRectangularView();
  v2 = *(unsigned __int8 *)(*((_QWORD *)v1 - 1) + 80);
  v3 = (v2 + 16) & ~v2;
  v4 = v0 + v3;
  sub_23DE4CF6C(0, &qword_256D0CD00, (uint64_t (*)(uint64_t))MEMORY[0x24BDED930], MEMORY[0x24BDEB560]);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v5 = sub_23DE66908();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(v0 + v3, v5);
  }
  else
  {
    swift_release();
  }
  v6 = v4 + v1[5];
  sub_23DE4CF6C(0, &qword_25432AB30, (uint64_t (*)(uint64_t))MEMORY[0x24BDFAF10], MEMORY[0x24BDEB560]);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v7 = sub_23DE66CD4();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 8))(v6, v7);
  }
  else
  {
    swift_release();
  }
  v8 = v4 + v1[6];
  sub_23DE4CF6C(0, &qword_25432AF78, (uint64_t (*)(uint64_t))MEMORY[0x24BDFADE0], MEMORY[0x24BDEB560]);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v9 = sub_23DE66CC8();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 8))(v8, v9);
  }
  else
  {
    swift_release();
  }
  sub_23DE51598(*(_QWORD *)(v4 + v1[7]), *(_BYTE *)(v4 + v1[7] + 8));
  v10 = v4 + v1[8];
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v11 = type metadata accessor for MedicationsWidgetViewModel();
  v12 = v10 + *(int *)(v11 + 24);
  v13 = type metadata accessor for MedmojiIconConfiguration();
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v13 - 8) + 48))(v12, 1, v13))
  {
    v14 = sub_23DE66818();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 8))(v12, v14);
    v15 = v12 + *(int *)(v13 + 20);
    v16 = sub_23DE667DC();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v16 - 8) + 8))(v15, v16);
  }
  v17 = v10 + *(int *)(v11 + 32);
  v18 = sub_23DE666F8();
  v19 = *(_QWORD *)(v18 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v19 + 48))(v17, 1, v18))
    (*(void (**)(uint64_t, uint64_t))(v19 + 8))(v17, v18);
  return swift_deallocObject();
}

uint64_t sub_23DE63398@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;

  v3 = *(unsigned __int8 *)(*(_QWORD *)(type metadata accessor for MedicationsWidgetRectangularView() - 8) + 80);
  return sub_23DE62238(v1 + ((v3 + 16) & ~v3), a1);
}

uint64_t sub_23DE633E4(unint64_t *a1, unint64_t *a2, uint64_t (*a3)(uint64_t))
{
  uint64_t result;
  uint64_t v5;

  result = *a1;
  if (!result)
  {
    sub_23DE4CF6C(255, a2, a3, MEMORY[0x24BDF53F0]);
    result = MEMORY[0x2426465BC](MEMORY[0x24BDF5428], v5);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_23DE6342C(uint64_t a1, uint64_t a2)
{
  return sub_23DE51318(a1, a2, (uint64_t (*)(_QWORD))sub_23DE63438);
}

void sub_23DE63438()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_256D0CE58)
  {
    sub_23DE634B0();
    sub_23DE4CD44(&qword_256D0CE98, (uint64_t (*)(uint64_t))sub_23DE634B0, MEMORY[0x24BDF4498]);
    v0 = sub_23DE66C20();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_256D0CE58);
  }
}

void sub_23DE634B0()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_256D0CE60)
  {
    sub_23DE4CF6C(255, &qword_256D0CE68, (uint64_t (*)(uint64_t))sub_23DE63548, MEMORY[0x24BDF53F0]);
    sub_23DE633E4(&qword_256D0CE90, &qword_256D0CE68, (uint64_t (*)(uint64_t))sub_23DE63548);
    v0 = sub_23DE66C14();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_256D0CE60);
  }
}

void sub_23DE63548(uint64_t a1)
{
  sub_23DE5A888(a1, &qword_256D0CE70, (void (*)(uint64_t))sub_23DE63564, (void (*)(uint64_t))sub_23DE635E8);
}

void sub_23DE63564()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_256D0CE78)
  {
    sub_23DE5E9AC(255, &qword_256D0CE80, MEMORY[0x24BDF4108], MEMORY[0x24BDF40E8], MEMORY[0x24BDF2268]);
    sub_23DE66AA0();
    v0 = sub_23DE668F0();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_256D0CE78);
  }
}

void sub_23DE635E8()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_256D0CE88)
  {
    sub_23DE5E9AC(255, &qword_25432B0D8, MEMORY[0x24BDF1FA8], MEMORY[0x24BDF1F80], MEMORY[0x24BDF29E0]);
    v0 = sub_23DE66EA8();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_256D0CE88);
  }
}

void sub_23DE6365C(uint64_t a1)
{
  sub_23DE63670(a1, &qword_256D0CEA0, (void (*)(uint64_t))sub_23DE63438);
}

void sub_23DE63670(uint64_t a1, unint64_t *a2, void (*a3)(uint64_t))
{
  unint64_t v4;
  uint64_t v5;

  if (!*a2)
  {
    a3(255);
    v4 = sub_23DE668F0();
    if (!v5)
      atomic_store(v4, a2);
  }
}

uint64_t sub_23DE636C4()
{
  sub_23DE62CA4(255);
  sub_23DE62D34();
  return swift_getOpaqueTypeConformance2();
}

uint64_t *sub_23DE63720(uint64_t *a1, uint64_t *a2, uint64_t a3)
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
  char *v15;
  uint64_t v16;
  int *v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  unsigned int (*v22)(char *, uint64_t, uint64_t);
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  char *v26;
  char *v27;
  uint64_t v28;
  uint64_t v29;
  char *v30;
  char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  char *__dst;

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
    sub_23DE4CF6C(0, &qword_256D0CD00, (uint64_t (*)(uint64_t))MEMORY[0x24BDED930], MEMORY[0x24BDEB560]);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v7 = sub_23DE66908();
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
    sub_23DE4CF6C(0, &qword_25432AB30, (uint64_t (*)(uint64_t))MEMORY[0x24BDFAF10], MEMORY[0x24BDEB560]);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v12 = sub_23DE66CD4();
      (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v12 - 8) + 16))(v10, v11, v12);
    }
    else
    {
      *v10 = *v11;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
    v13 = *(int *)(a3 + 24);
    v14 = (uint64_t *)((char *)a1 + v13);
    v15 = (char *)a2 + v13;
    v16 = *(uint64_t *)((char *)a2 + v13 + 8);
    *v14 = *(uint64_t *)((char *)a2 + v13);
    v14[1] = v16;
    v14[2] = *(uint64_t *)((char *)a2 + v13 + 16);
    v17 = (int *)type metadata accessor for MedicationsWidgetViewModel();
    v18 = v17[6];
    __dst = (char *)v14 + v18;
    v19 = &v15[v18];
    v20 = type metadata accessor for MedmojiIconConfiguration();
    v21 = *(_QWORD *)(v20 - 8);
    v22 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v21 + 48);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    if (v22(v19, 1, v20))
    {
      sub_23DE4CF6C(0, qword_25432AAD0, (uint64_t (*)(uint64_t))type metadata accessor for MedmojiIconConfiguration, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1C68]);
      memcpy(__dst, v19, *(_QWORD *)(*(_QWORD *)(v23 - 8) + 64));
    }
    else
    {
      v24 = sub_23DE66818();
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v24 - 8) + 16))(__dst, v19, v24);
      v25 = *(int *)(v20 + 20);
      v26 = &__dst[v25];
      v27 = &v19[v25];
      v28 = sub_23DE667DC();
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v28 - 8) + 16))(v26, v27, v28);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v21 + 56))(__dst, 0, 1, v20);
    }
    *((_BYTE *)v14 + v17[7]) = v15[v17[7]];
    v29 = v17[8];
    v30 = (char *)v14 + v29;
    v31 = &v15[v29];
    v32 = sub_23DE666F8();
    v33 = *(_QWORD *)(v32 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v33 + 48))(v31, 1, v32))
    {
      sub_23DE4CF6C(0, &qword_25432A770, (uint64_t (*)(uint64_t))MEMORY[0x24BDCE900], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1C68]);
      memcpy(v30, v31, *(_QWORD *)(*(_QWORD *)(v34 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v33 + 16))(v30, v31, v32);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v33 + 56))(v30, 0, 1, v32);
    }
  }
  return a1;
}

uint64_t sub_23DE63A64(uint64_t a1, uint64_t a2)
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
  uint64_t v15;
  uint64_t v16;
  uint64_t result;

  sub_23DE4CF6C(0, &qword_256D0CD00, (uint64_t (*)(uint64_t))MEMORY[0x24BDED930], MEMORY[0x24BDEB560]);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v4 = sub_23DE66908();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(a1, v4);
  }
  else
  {
    swift_release();
  }
  v5 = a1 + *(int *)(a2 + 20);
  sub_23DE4CF6C(0, &qword_25432AB30, (uint64_t (*)(uint64_t))MEMORY[0x24BDFAF10], MEMORY[0x24BDEB560]);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v6 = sub_23DE66CD4();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 8))(v5, v6);
  }
  else
  {
    swift_release();
  }
  v7 = a1 + *(int *)(a2 + 24);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v8 = type metadata accessor for MedicationsWidgetViewModel();
  v9 = v7 + *(int *)(v8 + 24);
  v10 = type metadata accessor for MedmojiIconConfiguration();
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 48))(v9, 1, v10))
  {
    v11 = sub_23DE66818();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 8))(v9, v11);
    v12 = v9 + *(int *)(v10 + 20);
    v13 = sub_23DE667DC();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v13 - 8) + 8))(v12, v13);
  }
  v14 = v7 + *(int *)(v8 + 32);
  v15 = sub_23DE666F8();
  v16 = *(_QWORD *)(v15 - 8);
  result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v16 + 48))(v14, 1, v15);
  if (!(_DWORD)result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(v16 + 8))(v14, v15);
  return result;
}

_QWORD *sub_23DE63C2C(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  _QWORD *v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  char *v13;
  uint64_t v14;
  int *v15;
  uint64_t v16;
  char *v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  unsigned int (*v21)(char *, uint64_t, uint64_t);
  uint64_t v22;
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
  uint64_t v33;
  _QWORD *v35;

  sub_23DE4CF6C(0, &qword_256D0CD00, (uint64_t (*)(uint64_t))MEMORY[0x24BDED930], MEMORY[0x24BDEB560]);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v6 = sub_23DE66908();
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
  sub_23DE4CF6C(0, &qword_25432AB30, (uint64_t (*)(uint64_t))MEMORY[0x24BDFAF10], MEMORY[0x24BDEB560]);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v10 = sub_23DE66CD4();
    (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v10 - 8) + 16))(v8, v9, v10);
  }
  else
  {
    *v8 = *v9;
    swift_retain();
  }
  swift_storeEnumTagMultiPayload();
  v11 = *(int *)(a3 + 24);
  v35 = a1;
  v12 = (_QWORD *)((char *)a1 + v11);
  v13 = (char *)a2 + v11;
  v14 = *(_QWORD *)((char *)a2 + v11 + 8);
  *v12 = *(_QWORD *)((char *)a2 + v11);
  v12[1] = v14;
  v12[2] = *(_QWORD *)((char *)a2 + v11 + 16);
  v15 = (int *)type metadata accessor for MedicationsWidgetViewModel();
  v16 = v15[6];
  v17 = (char *)v12 + v16;
  v18 = &v13[v16];
  v19 = type metadata accessor for MedmojiIconConfiguration();
  v20 = *(_QWORD *)(v19 - 8);
  v21 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v20 + 48);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  if (v21(v18, 1, v19))
  {
    sub_23DE4CF6C(0, qword_25432AAD0, (uint64_t (*)(uint64_t))type metadata accessor for MedmojiIconConfiguration, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1C68]);
    memcpy(v17, v18, *(_QWORD *)(*(_QWORD *)(v22 - 8) + 64));
  }
  else
  {
    v23 = sub_23DE66818();
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v23 - 8) + 16))(v17, v18, v23);
    v24 = *(int *)(v19 + 20);
    v25 = &v17[v24];
    v26 = &v18[v24];
    v27 = sub_23DE667DC();
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v27 - 8) + 16))(v25, v26, v27);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v20 + 56))(v17, 0, 1, v19);
  }
  *((_BYTE *)v12 + v15[7]) = v13[v15[7]];
  v28 = v15[8];
  v29 = (char *)v12 + v28;
  v30 = &v13[v28];
  v31 = sub_23DE666F8();
  v32 = *(_QWORD *)(v31 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v32 + 48))(v30, 1, v31))
  {
    sub_23DE4CF6C(0, &qword_25432A770, (uint64_t (*)(uint64_t))MEMORY[0x24BDCE900], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1C68]);
    memcpy(v29, v30, *(_QWORD *)(*(_QWORD *)(v33 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v32 + 16))(v29, v30, v31);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v32 + 56))(v29, 0, 1, v31);
  }
  return v35;
}

_QWORD *sub_23DE63F44(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t (*v6)(uint64_t);
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  _QWORD *v10;
  uint64_t (*v11)(uint64_t);
  uint64_t v12;
  uint64_t v13;
  _QWORD *v14;
  char *v15;
  int *v16;
  uint64_t v17;
  char *v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t (*v22)(char *, uint64_t, uint64_t);
  int v23;
  int v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  char *v29;
  char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  char *v34;
  char *v35;
  uint64_t v36;
  uint64_t v37;
  char *v38;
  char *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t (*v42)(char *, uint64_t, uint64_t);
  int v43;
  int v44;
  uint64_t v45;

  if (a1 != a2)
  {
    v6 = (uint64_t (*)(uint64_t))MEMORY[0x24BDED930];
    sub_23DE6437C((uint64_t)a1, &qword_256D0CD00, (uint64_t (*)(uint64_t))MEMORY[0x24BDED930]);
    sub_23DE4CF6C(0, &qword_256D0CD00, v6, MEMORY[0x24BDEB560]);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v7 = sub_23DE66908();
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
    v11 = (uint64_t (*)(uint64_t))MEMORY[0x24BDFAF10];
    sub_23DE6437C((uint64_t)a1 + v8, &qword_25432AB30, (uint64_t (*)(uint64_t))MEMORY[0x24BDFAF10]);
    sub_23DE4CF6C(0, &qword_25432AB30, v11, MEMORY[0x24BDEB560]);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v12 = sub_23DE66CD4();
      (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v12 - 8) + 16))(v9, v10, v12);
    }
    else
    {
      *v9 = *v10;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
  }
  v13 = *(int *)(a3 + 24);
  v14 = (_QWORD *)((char *)a1 + v13);
  v15 = (char *)a2 + v13;
  *v14 = *(_QWORD *)((char *)a2 + v13);
  v14[1] = *(_QWORD *)((char *)a2 + v13 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v14[2] = *((_QWORD *)v15 + 2);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v16 = (int *)type metadata accessor for MedicationsWidgetViewModel();
  v17 = v16[6];
  v18 = (char *)v14 + v17;
  v19 = &v15[v17];
  v20 = type metadata accessor for MedmojiIconConfiguration();
  v21 = *(_QWORD *)(v20 - 8);
  v22 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v21 + 48);
  v23 = v22(v18, 1, v20);
  v24 = v22(v19, 1, v20);
  if (v23)
  {
    if (v24)
    {
      v25 = (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1C68];
LABEL_14:
      sub_23DE4CF6C(0, qword_25432AAD0, (uint64_t (*)(uint64_t))type metadata accessor for MedmojiIconConfiguration, v25);
      memcpy(v18, v19, *(_QWORD *)(*(_QWORD *)(v26 - 8) + 64));
      goto LABEL_17;
    }
    v27 = sub_23DE66818();
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v27 - 8) + 16))(v18, v19, v27);
    v28 = *(int *)(v20 + 20);
    v29 = &v18[v28];
    v30 = &v19[v28];
    v31 = sub_23DE667DC();
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v31 - 8) + 16))(v29, v30, v31);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v21 + 56))(v18, 0, 1, v20);
  }
  else
  {
    if (v24)
    {
      sub_23DE513F8((uint64_t)v18, (uint64_t (*)(_QWORD))type metadata accessor for MedmojiIconConfiguration);
      v25 = (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1C68];
      goto LABEL_14;
    }
    v32 = sub_23DE66818();
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v32 - 8) + 24))(v18, v19, v32);
    v33 = *(int *)(v20 + 20);
    v34 = &v18[v33];
    v35 = &v19[v33];
    v36 = sub_23DE667DC();
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v36 - 8) + 24))(v34, v35, v36);
  }
LABEL_17:
  *((_BYTE *)v14 + v16[7]) = v15[v16[7]];
  v37 = v16[8];
  v38 = (char *)v14 + v37;
  v39 = &v15[v37];
  v40 = sub_23DE666F8();
  v41 = *(_QWORD *)(v40 - 8);
  v42 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v41 + 48);
  v43 = v42(v38, 1, v40);
  v44 = v42(v39, 1, v40);
  if (!v43)
  {
    if (!v44)
    {
      (*(void (**)(char *, char *, uint64_t))(v41 + 24))(v38, v39, v40);
      return a1;
    }
    (*(void (**)(char *, uint64_t))(v41 + 8))(v38, v40);
    goto LABEL_22;
  }
  if (v44)
  {
LABEL_22:
    sub_23DE4CF6C(0, &qword_25432A770, (uint64_t (*)(uint64_t))MEMORY[0x24BDCE900], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1C68]);
    memcpy(v38, v39, *(_QWORD *)(*(_QWORD *)(v45 - 8) + 64));
    return a1;
  }
  (*(void (**)(char *, char *, uint64_t))(v41 + 16))(v38, v39, v40);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v41 + 56))(v38, 0, 1, v40);
  return a1;
}

uint64_t sub_23DE6437C(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t))
{
  uint64_t v4;

  sub_23DE4CF6C(0, a2, a3, MEMORY[0x24BDEB560]);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(a1, v4);
  return a1;
}

char *sub_23DE643C0(char *a1, char *a2, uint64_t a3)
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
  int *v18;
  uint64_t v19;
  char *v20;
  char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  char *v27;
  char *v28;
  uint64_t v29;
  uint64_t v30;
  char *v31;
  char *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;

  sub_23DE4CF6C(0, &qword_256D0CD00, (uint64_t (*)(uint64_t))MEMORY[0x24BDED930], MEMORY[0x24BDEB560]);
  v7 = v6;
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v8 = sub_23DE66908();
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
  sub_23DE4CF6C(0, &qword_25432AB30, (uint64_t (*)(uint64_t))MEMORY[0x24BDFAF10], MEMORY[0x24BDEB560]);
  v13 = v12;
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v14 = sub_23DE66CD4();
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v14 - 8) + 32))(v10, v11, v14);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(v10, v11, *(_QWORD *)(*(_QWORD *)(v13 - 8) + 64));
  }
  v15 = *(int *)(a3 + 24);
  v16 = &a1[v15];
  v17 = &a2[v15];
  *(_OWORD *)v16 = *(_OWORD *)&a2[v15];
  *((_QWORD *)v16 + 2) = *(_QWORD *)&a2[v15 + 16];
  v18 = (int *)type metadata accessor for MedicationsWidgetViewModel();
  v19 = v18[6];
  v20 = &v16[v19];
  v21 = &v17[v19];
  v22 = type metadata accessor for MedmojiIconConfiguration();
  v23 = *(_QWORD *)(v22 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v23 + 48))(v21, 1, v22))
  {
    sub_23DE4CF6C(0, qword_25432AAD0, (uint64_t (*)(uint64_t))type metadata accessor for MedmojiIconConfiguration, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1C68]);
    memcpy(v20, v21, *(_QWORD *)(*(_QWORD *)(v24 - 8) + 64));
  }
  else
  {
    v25 = sub_23DE66818();
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v25 - 8) + 32))(v20, v21, v25);
    v26 = *(int *)(v22 + 20);
    v27 = &v20[v26];
    v28 = &v21[v26];
    v29 = sub_23DE667DC();
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v29 - 8) + 32))(v27, v28, v29);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v23 + 56))(v20, 0, 1, v22);
  }
  v16[v18[7]] = v17[v18[7]];
  v30 = v18[8];
  v31 = &v16[v30];
  v32 = &v17[v30];
  v33 = sub_23DE666F8();
  v34 = *(_QWORD *)(v33 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v34 + 48))(v32, 1, v33))
  {
    sub_23DE4CF6C(0, &qword_25432A770, (uint64_t (*)(uint64_t))MEMORY[0x24BDCE900], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1C68]);
    memcpy(v31, v32, *(_QWORD *)(*(_QWORD *)(v35 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v34 + 32))(v31, v32, v33);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v34 + 56))(v31, 0, 1, v33);
  }
  return a1;
}

char *sub_23DE646B0(char *a1, char *a2, uint64_t a3)
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
  uint64_t v17;
  char *v18;
  char *v19;
  uint64_t v20;
  int *v21;
  uint64_t v22;
  char *v23;
  char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t (*v27)(char *, uint64_t, uint64_t);
  int v28;
  int v29;
  uint64_t (*v30)(uint64_t, uint64_t);
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  char *v34;
  char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  char *v39;
  char *v40;
  uint64_t v41;
  uint64_t v42;
  char *v43;
  char *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t (*v47)(char *, uint64_t, uint64_t);
  int v48;
  int v49;
  uint64_t v50;

  if (a1 != a2)
  {
    v6 = (uint64_t (*)(uint64_t))MEMORY[0x24BDED930];
    sub_23DE6437C((uint64_t)a1, &qword_256D0CD00, (uint64_t (*)(uint64_t))MEMORY[0x24BDED930]);
    sub_23DE4CF6C(0, &qword_256D0CD00, v6, MEMORY[0x24BDEB560]);
    v8 = v7;
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v9 = sub_23DE66908();
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
    v13 = (uint64_t (*)(uint64_t))MEMORY[0x24BDFAF10];
    sub_23DE6437C((uint64_t)&a1[v10], &qword_25432AB30, (uint64_t (*)(uint64_t))MEMORY[0x24BDFAF10]);
    sub_23DE4CF6C(0, &qword_25432AB30, v13, MEMORY[0x24BDEB560]);
    v15 = v14;
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v16 = sub_23DE66CD4();
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v16 - 8) + 32))(v11, v12, v16);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(v11, v12, *(_QWORD *)(*(_QWORD *)(v15 - 8) + 64));
    }
  }
  v17 = *(int *)(a3 + 24);
  v18 = &a1[v17];
  v19 = &a2[v17];
  v20 = *(_QWORD *)&a2[v17 + 8];
  *(_QWORD *)v18 = *(_QWORD *)&a2[v17];
  *((_QWORD *)v18 + 1) = v20;
  swift_bridgeObjectRelease();
  *((_QWORD *)v18 + 2) = *((_QWORD *)v19 + 2);
  swift_bridgeObjectRelease();
  v21 = (int *)type metadata accessor for MedicationsWidgetViewModel();
  v22 = v21[6];
  v23 = &v18[v22];
  v24 = &v19[v22];
  v25 = type metadata accessor for MedmojiIconConfiguration();
  v26 = *(_QWORD *)(v25 - 8);
  v27 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v26 + 48);
  v28 = v27(v23, 1, v25);
  v29 = v27(v24, 1, v25);
  if (v28)
  {
    if (v29)
    {
      v30 = (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1C68];
LABEL_13:
      sub_23DE4CF6C(0, qword_25432AAD0, (uint64_t (*)(uint64_t))type metadata accessor for MedmojiIconConfiguration, v30);
      memcpy(v23, v24, *(_QWORD *)(*(_QWORD *)(v31 - 8) + 64));
      goto LABEL_16;
    }
    v32 = sub_23DE66818();
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v32 - 8) + 32))(v23, v24, v32);
    v33 = *(int *)(v25 + 20);
    v34 = &v23[v33];
    v35 = &v24[v33];
    v36 = sub_23DE667DC();
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v36 - 8) + 32))(v34, v35, v36);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v26 + 56))(v23, 0, 1, v25);
  }
  else
  {
    if (v29)
    {
      sub_23DE513F8((uint64_t)v23, (uint64_t (*)(_QWORD))type metadata accessor for MedmojiIconConfiguration);
      v30 = (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1C68];
      goto LABEL_13;
    }
    v37 = sub_23DE66818();
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v37 - 8) + 40))(v23, v24, v37);
    v38 = *(int *)(v25 + 20);
    v39 = &v23[v38];
    v40 = &v24[v38];
    v41 = sub_23DE667DC();
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v41 - 8) + 40))(v39, v40, v41);
  }
LABEL_16:
  v18[v21[7]] = v19[v21[7]];
  v42 = v21[8];
  v43 = &v18[v42];
  v44 = &v19[v42];
  v45 = sub_23DE666F8();
  v46 = *(_QWORD *)(v45 - 8);
  v47 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v46 + 48);
  v48 = v47(v43, 1, v45);
  v49 = v47(v44, 1, v45);
  if (!v48)
  {
    if (!v49)
    {
      (*(void (**)(char *, char *, uint64_t))(v46 + 40))(v43, v44, v45);
      return a1;
    }
    (*(void (**)(char *, uint64_t))(v46 + 8))(v43, v45);
    goto LABEL_21;
  }
  if (v49)
  {
LABEL_21:
    sub_23DE4CF6C(0, &qword_25432A770, (uint64_t (*)(uint64_t))MEMORY[0x24BDCE900], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1C68]);
    memcpy(v43, v44, *(_QWORD *)(*(_QWORD *)(v50 - 8) + 64));
    return a1;
  }
  (*(void (**)(char *, char *, uint64_t))(v46 + 32))(v43, v44, v45);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v46 + 56))(v43, 0, 1, v45);
  return a1;
}

uint64_t sub_23DE64AC8()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_23DE64AD4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t, uint64_t);
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  sub_23DE4CF6C(0, &qword_256D0CCF8, (uint64_t (*)(uint64_t))MEMORY[0x24BDED930], MEMORY[0x24BDEB580]);
  v7 = *(_QWORD *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == (_DWORD)a2)
  {
    v8 = v6;
    v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    v10 = a1;
  }
  else
  {
    sub_23DE4CF6C(0, &qword_25432AF88, (uint64_t (*)(uint64_t))MEMORY[0x24BDFAF10], MEMORY[0x24BDEB580]);
    v12 = *(_QWORD *)(v11 - 8);
    if (*(_DWORD *)(v12 + 84) == (_DWORD)a2)
    {
      v8 = v11;
      v13 = *(int *)(a3 + 20);
    }
    else
    {
      v8 = type metadata accessor for MedicationsWidgetViewModel();
      v12 = *(_QWORD *)(v8 - 8);
      v13 = *(int *)(a3 + 24);
    }
    v10 = a1 + v13;
    v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v12 + 48);
  }
  return v9(v10, a2, v8);
}

uint64_t sub_23DE64B9C()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_23DE64BA8(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  sub_23DE4CF6C(0, &qword_256D0CCF8, (uint64_t (*)(uint64_t))MEMORY[0x24BDED930], MEMORY[0x24BDEB580]);
  v9 = *(_QWORD *)(v8 - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    v10 = v8;
    v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    v12 = a1;
  }
  else
  {
    sub_23DE4CF6C(0, &qword_25432AF88, (uint64_t (*)(uint64_t))MEMORY[0x24BDFAF10], MEMORY[0x24BDEB580]);
    v14 = *(_QWORD *)(v13 - 8);
    if (*(_DWORD *)(v14 + 84) == a3)
    {
      v10 = v13;
      v15 = *(int *)(a4 + 20);
    }
    else
    {
      v10 = type metadata accessor for MedicationsWidgetViewModel();
      v14 = *(_QWORD *)(v10 - 8);
      v15 = *(int *)(a4 + 24);
    }
    v12 = a1 + v15;
    v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v14 + 56);
  }
  return v11(v12, a2, a2, v10);
}

uint64_t type metadata accessor for MedicationsWidgetInlineView()
{
  uint64_t result;

  result = qword_25432AEB0;
  if (!qword_25432AEB0)
    return swift_getSingletonMetadata();
  return result;
}

void sub_23DE64CB4()
{
  unint64_t v0;
  unint64_t v1;
  unint64_t v2;

  sub_23DE4CF6C(319, &qword_256D0CD00, (uint64_t (*)(uint64_t))MEMORY[0x24BDED930], MEMORY[0x24BDEB560]);
  if (v0 <= 0x3F)
  {
    sub_23DE4CF6C(319, &qword_25432AB30, (uint64_t (*)(uint64_t))MEMORY[0x24BDFAF10], MEMORY[0x24BDEB560]);
    if (v1 <= 0x3F)
    {
      type metadata accessor for MedicationsWidgetViewModel();
      if (v2 <= 0x3F)
        swift_initStructMetadata();
    }
  }
}

uint64_t sub_23DE64D84()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_23DE64D94@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
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
  char *v14;
  uint64_t v15;
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
  char v27;
  char v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  char v36;
  char v37;
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
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  char *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  char v58;
  uint64_t v59;

  v54 = a2;
  sub_23DE635E8();
  v4 = MEMORY[0x24BDAC7A8](v3);
  v55 = (uint64_t)&v49 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v4);
  v53 = (char *)&v49 - v6;
  v7 = sub_23DE66CD4();
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7);
  v10 = (char *)&v49 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23DE5E9AC(0, &qword_256D0CE80, MEMORY[0x24BDF4108], MEMORY[0x24BDF40E8], MEMORY[0x24BDF2268]);
  v12 = v11;
  v50 = *(_QWORD *)(v11 - 8);
  MEMORY[0x24BDAC7A8](v11);
  v14 = (char *)&v49 - v13;
  sub_23DE63564();
  v16 = MEMORY[0x24BDAC7A8](v15);
  v52 = (uint64_t)&v49 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18 = MEMORY[0x24BDAC7A8](v16);
  v20 = (char *)&v49 - v19;
  MEMORY[0x24BDAC7A8](v18);
  v22 = (char *)&v49 - v21;
  v49 = type metadata accessor for MedicationsWidgetInlineView();
  v51 = a1;
  sub_23DE50ADC((uint64_t)v10);
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  v56 = sub_23DE66BFC();
  sub_23DE66B84();
  swift_release();
  if (qword_25432AB88 != -1)
    swift_once();
  v56 = sub_23DE665E4();
  v57 = v23;
  sub_23DE4CD84();
  v24 = sub_23DE66B3C();
  v26 = v25;
  v28 = v27 & 1;
  v56 = MEMORY[0x24BDF4108];
  v57 = MEMORY[0x24BDF40E8];
  swift_getOpaqueTypeConformance2();
  sub_23DE66BA8();
  sub_23DE5AD5C(v24, v26, v28);
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v50 + 8))(v14, v12);
  sub_23DE65474((uint64_t)v20, (uint64_t)v22);
  v29 = *(_QWORD *)(v51 + *(int *)(v49 + 24) + 16);
  v30 = *(_QWORD *)(v29 + 16);
  if (v30)
  {
    v31 = v29 + 16 * v30;
    v32 = *(_QWORD *)(v31 + 24);
    v56 = *(_QWORD *)(v31 + 16);
    v57 = v32;
    swift_bridgeObjectRetain();
    v33 = sub_23DE66B3C();
    v35 = v34;
    v56 = v33;
    v57 = v34;
    v37 = v36 & 1;
    v58 = v36 & 1;
    v59 = v38;
    v39 = MEMORY[0x24BDF1FA8];
    v40 = MEMORY[0x24BDF1F80];
    v41 = (uint64_t)v53;
    sub_23DE66B9C();
    sub_23DE5AD5C(v33, v35, v37);
    swift_bridgeObjectRelease();
    sub_23DE5E9AC(0, &qword_25432B0D8, v39, v40, MEMORY[0x24BDF29E0]);
    (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v42 - 8) + 56))(v41, 0, 1, v42);
  }
  else
  {
    sub_23DE5E9AC(0, &qword_25432B0D8, MEMORY[0x24BDF1FA8], MEMORY[0x24BDF1F80], MEMORY[0x24BDF29E0]);
    v41 = (uint64_t)v53;
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v43 - 8) + 56))(v53, 1, 1, v43);
  }
  v44 = v52;
  sub_23DE51318((uint64_t)v22, v52, (uint64_t (*)(_QWORD))sub_23DE63564);
  v45 = v55;
  sub_23DE51318(v41, v55, (uint64_t (*)(_QWORD))sub_23DE635E8);
  v46 = v54;
  sub_23DE51318(v44, v54, (uint64_t (*)(_QWORD))sub_23DE63564);
  sub_23DE63548(0);
  sub_23DE51318(v45, v46 + *(int *)(v47 + 48), (uint64_t (*)(_QWORD))sub_23DE635E8);
  sub_23DE513F8(v41, (uint64_t (*)(_QWORD))sub_23DE635E8);
  sub_23DE513F8((uint64_t)v22, (uint64_t (*)(_QWORD))sub_23DE63564);
  sub_23DE513F8(v45, (uint64_t (*)(_QWORD))sub_23DE635E8);
  return sub_23DE513F8(v44, (uint64_t (*)(_QWORD))sub_23DE63564);
}

uint64_t sub_23DE65288@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v13;

  v2 = v1;
  sub_23DE63438();
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)&v13 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(_QWORD *)v6 = sub_23DE66A34();
  *((_QWORD *)v6 + 1) = 0;
  v6[16] = 1;
  sub_23DE65394();
  v8 = &v6[*(int *)(v7 + 44)];
  *(_QWORD *)v8 = sub_23DE669D4();
  *((_QWORD *)v8 + 1) = 0;
  v8[16] = 1;
  sub_23DE653F8();
  sub_23DE64D94(v2, (uint64_t)&v8[*(int *)(v9 + 44)]);
  v10 = sub_23DE66C5C();
  sub_23DE62368(0.0, 1, 0.0, 1, INFINITY, 0, 0.0, 1, a1, 0.0, 1, 0.0, 1, v10, v11);
  return sub_23DE513F8((uint64_t)v6, (uint64_t (*)(_QWORD))sub_23DE63438);
}

void sub_23DE65394()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_256D0CEA8)
  {
    sub_23DE634B0();
    v0 = sub_23DE668E4();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_256D0CEA8);
  }
}

void sub_23DE653F8()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_256D0CEB0)
  {
    sub_23DE4CF6C(255, &qword_256D0CE68, (uint64_t (*)(uint64_t))sub_23DE63548, MEMORY[0x24BDF53F0]);
    v0 = sub_23DE668E4();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_256D0CEB0);
  }
}

uint64_t sub_23DE65474(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  sub_23DE63564();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

unint64_t sub_23DE654BC()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;
  _QWORD v3[2];

  result = qword_256D0CEB8;
  if (!qword_256D0CEB8)
  {
    sub_23DE6365C(255);
    v2 = v1;
    v3[0] = sub_23DE4CD44(&qword_256D0CEC0, (uint64_t (*)(uint64_t))sub_23DE63438, MEMORY[0x24BDF4700]);
    v3[1] = MEMORY[0x24BDEDBB8];
    result = MEMORY[0x2426465BC](MEMORY[0x24BDED308], v2, v3);
    atomic_store(result, (unint64_t *)&qword_256D0CEB8);
  }
  return result;
}

uint64_t *sub_23DE6553C(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  char *v10;
  uint64_t v11;
  int *v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  unsigned int (*v17)(char *, uint64_t, uint64_t);
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  char *v23;
  uint64_t v24;
  uint64_t v25;
  char *v26;
  char *v27;
  uint64_t v28;
  void (*v30)(uint64_t *, uint64_t *);
  char *__dst;
  uint64_t v32;
  uint64_t v33;

  v5 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v19 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v19 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    v7 = sub_23DE666F8();
    v32 = *(_QWORD *)(v7 - 8);
    v33 = v7;
    v30 = *(void (**)(uint64_t *, uint64_t *))(v32 + 16);
    v30(a1, a2);
    v8 = *(int *)(a3 + 20);
    v9 = (uint64_t *)((char *)a1 + v8);
    v10 = (char *)a2 + v8;
    v11 = *(uint64_t *)((char *)a2 + v8 + 8);
    *v9 = *(uint64_t *)((char *)a2 + v8);
    v9[1] = v11;
    v9[2] = *(uint64_t *)((char *)a2 + v8 + 16);
    v12 = (int *)type metadata accessor for MedicationsWidgetViewModel();
    v13 = v12[6];
    __dst = (char *)v9 + v13;
    v14 = &v10[v13];
    v15 = type metadata accessor for MedmojiIconConfiguration();
    v16 = *(_QWORD *)(v15 - 8);
    v17 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v16 + 48);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    if (v17(v14, 1, v15))
    {
      sub_23DE4B174(0, qword_25432AAD0, (void (*)(uint64_t))type metadata accessor for MedmojiIconConfiguration);
      memcpy(__dst, v14, *(_QWORD *)(*(_QWORD *)(v18 - 8) + 64));
    }
    else
    {
      v20 = sub_23DE66818();
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v20 - 8) + 16))(__dst, v14, v20);
      v21 = *(int *)(v15 + 20);
      v22 = &__dst[v21];
      v23 = &v14[v21];
      v24 = sub_23DE667DC();
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v24 - 8) + 16))(v22, v23, v24);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v16 + 56))(__dst, 0, 1, v15);
    }
    *((_BYTE *)v9 + v12[7]) = v10[v12[7]];
    v25 = v12[8];
    v26 = (char *)v9 + v25;
    v27 = &v10[v25];
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v32 + 48))(&v10[v25], 1, v33))
    {
      sub_23DE4B174(0, &qword_25432A770, (void (*)(uint64_t))MEMORY[0x24BDCE900]);
      memcpy(v26, v27, *(_QWORD *)(*(_QWORD *)(v28 - 8) + 64));
    }
    else
    {
      ((void (*)(char *, char *, uint64_t))v30)(v26, v27, v33);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v32 + 56))(v26, 0, 1, v33);
    }
  }
  return a1;
}

uint64_t sub_23DE65778(uint64_t a1, uint64_t a2)
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
  uint64_t result;
  void (*v15)(uint64_t, uint64_t);

  v4 = sub_23DE666F8();
  v5 = *(_QWORD *)(v4 - 8);
  v15 = *(void (**)(uint64_t, uint64_t))(v5 + 8);
  v15(a1, v4);
  v6 = a1 + *(int *)(a2 + 20);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v7 = type metadata accessor for MedicationsWidgetViewModel();
  v8 = v6 + *(int *)(v7 + 24);
  v9 = type metadata accessor for MedmojiIconConfiguration();
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 48))(v8, 1, v9))
  {
    v10 = sub_23DE66818();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 8))(v8, v10);
    v11 = v8 + *(int *)(v9 + 20);
    v12 = sub_23DE667DC();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 8))(v11, v12);
  }
  v13 = v6 + *(int *)(v7 + 32);
  result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v5 + 48))(v13, 1, v4);
  if (!(_DWORD)result)
    return ((uint64_t (*)(uint64_t, uint64_t))v15)(v13, v4);
  return result;
}

uint64_t sub_23DE658AC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  uint64_t v9;
  uint64_t v10;
  int *v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  unsigned int (*v16)(char *, uint64_t, uint64_t);
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  char *v21;
  uint64_t v22;
  uint64_t v23;
  char *v24;
  const void *v25;
  uint64_t v26;
  void (*v28)(uint64_t, uint64_t, uint64_t);
  char *__dst;
  uint64_t v30;
  uint64_t v31;

  v6 = sub_23DE666F8();
  v30 = *(_QWORD *)(v6 - 8);
  v28 = *(void (**)(uint64_t, uint64_t, uint64_t))(v30 + 16);
  v28(a1, a2, v6);
  v7 = *(int *)(a3 + 20);
  v31 = a1;
  v8 = (_QWORD *)(a1 + v7);
  v9 = a2 + v7;
  v10 = *(_QWORD *)(a2 + v7 + 8);
  *v8 = *(_QWORD *)(a2 + v7);
  v8[1] = v10;
  v8[2] = *(_QWORD *)(a2 + v7 + 16);
  v11 = (int *)type metadata accessor for MedicationsWidgetViewModel();
  v12 = v11[6];
  __dst = (char *)v8 + v12;
  v13 = (char *)(v9 + v12);
  v14 = type metadata accessor for MedmojiIconConfiguration();
  v15 = *(_QWORD *)(v14 - 8);
  v16 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v15 + 48);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  if (v16(v13, 1, v14))
  {
    sub_23DE4B174(0, qword_25432AAD0, (void (*)(uint64_t))type metadata accessor for MedmojiIconConfiguration);
    memcpy(__dst, v13, *(_QWORD *)(*(_QWORD *)(v17 - 8) + 64));
  }
  else
  {
    v18 = sub_23DE66818();
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v18 - 8) + 16))(__dst, v13, v18);
    v19 = *(int *)(v14 + 20);
    v20 = &__dst[v19];
    v21 = &v13[v19];
    v22 = sub_23DE667DC();
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v22 - 8) + 16))(v20, v21, v22);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v15 + 56))(__dst, 0, 1, v14);
  }
  *((_BYTE *)v8 + v11[7]) = *(_BYTE *)(v9 + v11[7]);
  v23 = v11[8];
  v24 = (char *)v8 + v23;
  v25 = (const void *)(v9 + v23);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v30 + 48))(v9 + v23, 1, v6))
  {
    sub_23DE4B174(0, &qword_25432A770, (void (*)(uint64_t))MEMORY[0x24BDCE900]);
    memcpy(v24, v25, *(_QWORD *)(*(_QWORD *)(v26 - 8) + 64));
  }
  else
  {
    v28((uint64_t)v24, (uint64_t)v25, v6);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v30 + 56))(v24, 0, 1, v6);
  }
  return v31;
}

uint64_t sub_23DE65AC4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  uint64_t v9;
  int *v10;
  uint64_t v11;
  char *v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t (*v16)(char *, uint64_t, uint64_t);
  int v17;
  int v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  char *v26;
  char *v27;
  uint64_t (*v28)(char *, uint64_t, uint64_t);
  int v29;
  int v30;
  uint64_t v31;
  uint64_t v33;
  uint64_t v34;
  char *v35;
  char *v36;
  uint64_t v37;
  void (*v38)(uint64_t, uint64_t, uint64_t);
  uint64_t v39;
  uint64_t v40;

  v6 = sub_23DE666F8();
  v39 = *(_QWORD *)(v6 - 8);
  v38 = *(void (**)(uint64_t, uint64_t, uint64_t))(v39 + 24);
  v38(a1, a2, v6);
  v7 = *(int *)(a3 + 20);
  v40 = a1;
  v8 = (_QWORD *)(a1 + v7);
  v9 = a2 + v7;
  *v8 = *(_QWORD *)(a2 + v7);
  v8[1] = *(_QWORD *)(a2 + v7 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v8[2] = *(_QWORD *)(v9 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v10 = (int *)type metadata accessor for MedicationsWidgetViewModel();
  v11 = v10[6];
  v12 = (char *)v8 + v11;
  v13 = (char *)(v9 + v11);
  v14 = type metadata accessor for MedmojiIconConfiguration();
  v15 = *(_QWORD *)(v14 - 8);
  v16 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v15 + 48);
  v17 = v16(v12, 1, v14);
  v18 = v16(v13, 1, v14);
  if (v17)
  {
    if (!v18)
    {
      v19 = sub_23DE66818();
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v19 - 8) + 16))(v12, v13, v19);
      v20 = *(int *)(v14 + 20);
      v21 = &v12[v20];
      v22 = &v13[v20];
      v23 = sub_23DE667DC();
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v23 - 8) + 16))(v21, v22, v23);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v15 + 56))(v12, 0, 1, v14);
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  if (v18)
  {
    sub_23DE4B718((uint64_t)v12);
LABEL_6:
    sub_23DE4B174(0, qword_25432AAD0, (void (*)(uint64_t))type metadata accessor for MedmojiIconConfiguration);
    memcpy(v12, v13, *(_QWORD *)(*(_QWORD *)(v24 - 8) + 64));
    goto LABEL_7;
  }
  v33 = sub_23DE66818();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v33 - 8) + 24))(v12, v13, v33);
  v34 = *(int *)(v14 + 20);
  v35 = &v12[v34];
  v36 = &v13[v34];
  v37 = sub_23DE667DC();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v37 - 8) + 24))(v35, v36, v37);
LABEL_7:
  *((_BYTE *)v8 + v10[7]) = *(_BYTE *)(v9 + v10[7]);
  v25 = v10[8];
  v26 = (char *)v8 + v25;
  v27 = (char *)(v9 + v25);
  v28 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v39 + 48);
  v29 = v28((char *)v8 + v25, 1, v6);
  v30 = v28(v27, 1, v6);
  if (!v29)
  {
    if (!v30)
    {
      v38((uint64_t)v26, (uint64_t)v27, v6);
      return v40;
    }
    (*(void (**)(char *, uint64_t))(v39 + 8))(v26, v6);
    goto LABEL_12;
  }
  if (v30)
  {
LABEL_12:
    sub_23DE4B174(0, &qword_25432A770, (void (*)(uint64_t))MEMORY[0x24BDCE900]);
    memcpy(v26, v27, *(_QWORD *)(*(_QWORD *)(v31 - 8) + 64));
    return v40;
  }
  (*(void (**)(char *, char *, uint64_t))(v39 + 16))(v26, v27, v6);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v39 + 56))(v26, 0, 1, v6);
  return v40;
}

uint64_t sub_23DE65DA4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  int *v11;
  uint64_t v12;
  char *v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  char *v22;
  uint64_t v23;
  char *v24;
  uint64_t v25;
  void *v26;
  const void *v27;
  uint64_t v28;
  uint64_t v30;
  void (*v31)(uint64_t, uint64_t, uint64_t);

  v6 = sub_23DE666F8();
  v7 = *(_QWORD *)(v6 - 8);
  v31 = *(void (**)(uint64_t, uint64_t, uint64_t))(v7 + 32);
  v31(a1, a2, v6);
  v8 = *(int *)(a3 + 20);
  v9 = a1 + v8;
  v10 = a2 + v8;
  *(_OWORD *)v9 = *(_OWORD *)(a2 + v8);
  *(_QWORD *)(v9 + 16) = *(_QWORD *)(a2 + v8 + 16);
  v11 = (int *)type metadata accessor for MedicationsWidgetViewModel();
  v12 = v11[6];
  v13 = (char *)(v9 + v12);
  v14 = (char *)(v10 + v12);
  v15 = type metadata accessor for MedmojiIconConfiguration();
  v16 = *(_QWORD *)(v15 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v16 + 48))(v14, 1, v15))
  {
    sub_23DE4B174(0, qword_25432AAD0, (void (*)(uint64_t))type metadata accessor for MedmojiIconConfiguration);
    memcpy(v13, v14, *(_QWORD *)(*(_QWORD *)(v17 - 8) + 64));
  }
  else
  {
    v18 = sub_23DE66818();
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v18 - 8) + 32))(v13, v14, v18);
    v19 = *(int *)(v15 + 20);
    v30 = v7;
    v20 = a1;
    v21 = &v13[v19];
    v22 = &v14[v19];
    v23 = sub_23DE667DC();
    v24 = v21;
    a1 = v20;
    v7 = v30;
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v23 - 8) + 32))(v24, v22, v23);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v16 + 56))(v13, 0, 1, v15);
  }
  *(_BYTE *)(v9 + v11[7]) = *(_BYTE *)(v10 + v11[7]);
  v25 = v11[8];
  v26 = (void *)(v9 + v25);
  v27 = (const void *)(v10 + v25);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(v10 + v25, 1, v6))
  {
    sub_23DE4B174(0, &qword_25432A770, (void (*)(uint64_t))MEMORY[0x24BDCE900]);
    memcpy(v26, v27, *(_QWORD *)(*(_QWORD *)(v28 - 8) + 64));
  }
  else
  {
    v31((uint64_t)v26, (uint64_t)v27, v6);
    (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v7 + 56))(v26, 0, 1, v6);
  }
  return a1;
}

uint64_t sub_23DE65FA8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  uint64_t v9;
  uint64_t v10;
  int *v11;
  uint64_t v12;
  char *v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t (*v17)(char *, uint64_t, uint64_t);
  int v18;
  int v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  char *v27;
  char *v28;
  uint64_t (*v29)(char *, uint64_t, uint64_t);
  int v30;
  int v31;
  uint64_t v32;
  uint64_t v34;
  uint64_t v35;
  char *v36;
  char *v37;
  uint64_t v38;
  void (*v39)(uint64_t, uint64_t, uint64_t);
  uint64_t v40;
  uint64_t v41;

  v6 = sub_23DE666F8();
  v40 = *(_QWORD *)(v6 - 8);
  v39 = *(void (**)(uint64_t, uint64_t, uint64_t))(v40 + 40);
  v39(a1, a2, v6);
  v7 = *(int *)(a3 + 20);
  v41 = a1;
  v8 = (_QWORD *)(a1 + v7);
  v9 = a2 + v7;
  v10 = *(_QWORD *)(a2 + v7 + 8);
  *v8 = *(_QWORD *)(a2 + v7);
  v8[1] = v10;
  swift_bridgeObjectRelease();
  v8[2] = *(_QWORD *)(v9 + 16);
  swift_bridgeObjectRelease();
  v11 = (int *)type metadata accessor for MedicationsWidgetViewModel();
  v12 = v11[6];
  v13 = (char *)v8 + v12;
  v14 = (char *)(v9 + v12);
  v15 = type metadata accessor for MedmojiIconConfiguration();
  v16 = *(_QWORD *)(v15 - 8);
  v17 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v16 + 48);
  v18 = v17(v13, 1, v15);
  v19 = v17(v14, 1, v15);
  if (v18)
  {
    if (!v19)
    {
      v20 = sub_23DE66818();
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v20 - 8) + 32))(v13, v14, v20);
      v21 = *(int *)(v15 + 20);
      v22 = &v13[v21];
      v23 = &v14[v21];
      v24 = sub_23DE667DC();
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v24 - 8) + 32))(v22, v23, v24);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v16 + 56))(v13, 0, 1, v15);
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  if (v19)
  {
    sub_23DE4B718((uint64_t)v13);
LABEL_6:
    sub_23DE4B174(0, qword_25432AAD0, (void (*)(uint64_t))type metadata accessor for MedmojiIconConfiguration);
    memcpy(v13, v14, *(_QWORD *)(*(_QWORD *)(v25 - 8) + 64));
    goto LABEL_7;
  }
  v34 = sub_23DE66818();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v34 - 8) + 40))(v13, v14, v34);
  v35 = *(int *)(v15 + 20);
  v36 = &v13[v35];
  v37 = &v14[v35];
  v38 = sub_23DE667DC();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v38 - 8) + 40))(v36, v37, v38);
LABEL_7:
  *((_BYTE *)v8 + v11[7]) = *(_BYTE *)(v9 + v11[7]);
  v26 = v11[8];
  v27 = (char *)v8 + v26;
  v28 = (char *)(v9 + v26);
  v29 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v40 + 48);
  v30 = v29((char *)v8 + v26, 1, v6);
  v31 = v29(v28, 1, v6);
  if (!v30)
  {
    if (!v31)
    {
      v39((uint64_t)v27, (uint64_t)v28, v6);
      return v41;
    }
    (*(void (**)(char *, uint64_t))(v40 + 8))(v27, v6);
    goto LABEL_12;
  }
  if (v31)
  {
LABEL_12:
    sub_23DE4B174(0, &qword_25432A770, (void (*)(uint64_t))MEMORY[0x24BDCE900]);
    memcpy(v27, v28, *(_QWORD *)(*(_QWORD *)(v32 - 8) + 64));
    return v41;
  }
  (*(void (**)(char *, char *, uint64_t))(v40 + 32))(v27, v28, v6);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v40 + 56))(v27, 0, 1, v6);
  return v41;
}

uint64_t sub_23DE66270()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_23DE6627C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t, uint64_t);
  uint64_t v10;

  v6 = sub_23DE666F8();
  v7 = *(_QWORD *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == (_DWORD)a2)
  {
    v8 = v6;
    v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    v10 = a1;
  }
  else
  {
    v8 = type metadata accessor for MedicationsWidgetViewModel();
    v10 = a1 + *(int *)(a3 + 20);
    v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 48);
  }
  return v9(v10, a2, v8);
}

uint64_t sub_23DE662F0()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_23DE662FC(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v12;

  v8 = sub_23DE666F8();
  v9 = *(_QWORD *)(v8 - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    v10 = v8;
    v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    v12 = a1;
  }
  else
  {
    v10 = type metadata accessor for MedicationsWidgetViewModel();
    v12 = a1 + *(int *)(a4 + 20);
    v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 56);
  }
  return v11(v12, a2, a2, v10);
}

uint64_t type metadata accessor for MedicationsWidgetEntry()
{
  uint64_t result;

  result = qword_25432A8D0;
  if (!qword_25432A8D0)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_23DE663B4()
{
  uint64_t result;
  unint64_t v1;
  unint64_t v2;

  result = sub_23DE666F8();
  if (v1 <= 0x3F)
  {
    result = type metadata accessor for MedicationsWidgetViewModel();
    if (v2 <= 0x3F)
    {
      swift_initStructMetadata();
      return 0;
    }
  }
  return result;
}

uint64_t sub_23DE66438@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;

  v3 = sub_23DE666F8();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 16))(a1, v1, v3);
}

uint64_t sub_23DE66470@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;

  type metadata accessor for MedicationsWidgetViewModel();
  sub_23DE66D28();
  v2 = sub_23DE66D34();
  return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 56))(a1, 0, 1, v2);
}

uint64_t sub_23DE664DC()
{
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for ResourceBundleClass()
{
  return objc_opt_self();
}

uint64_t sub_23DE6650C()
{
  return MEMORY[0x24BDCB620]();
}

uint64_t sub_23DE66518()
{
  return MEMORY[0x24BDCB750]();
}

uint64_t sub_23DE66524()
{
  return MEMORY[0x24BDCC0D0]();
}

uint64_t sub_23DE66530()
{
  return MEMORY[0x24BDCC138]();
}

uint64_t sub_23DE6653C()
{
  return MEMORY[0x24BDCC1A8]();
}

uint64_t sub_23DE66548()
{
  return MEMORY[0x24BDCC1B8]();
}

uint64_t sub_23DE66554()
{
  return MEMORY[0x24BDCC1C8]();
}

uint64_t sub_23DE66560()
{
  return MEMORY[0x24BDCC268]();
}

uint64_t sub_23DE6656C()
{
  return MEMORY[0x24BDCC290]();
}

uint64_t sub_23DE66578()
{
  return MEMORY[0x24BDCC460]();
}

uint64_t sub_23DE66584()
{
  return MEMORY[0x24BDCC478]();
}

uint64_t sub_23DE66590()
{
  return MEMORY[0x24BDCC480]();
}

uint64_t sub_23DE6659C()
{
  return MEMORY[0x24BDCC498]();
}

uint64_t sub_23DE665A8()
{
  return MEMORY[0x24BDCC4A8]();
}

uint64_t sub_23DE665B4()
{
  return MEMORY[0x24BDCC4E0]();
}

uint64_t sub_23DE665C0()
{
  return MEMORY[0x24BDCC4F0]();
}

uint64_t sub_23DE665CC()
{
  return MEMORY[0x24BDCC5A8]();
}

uint64_t sub_23DE665D8()
{
  return MEMORY[0x24BDCC610]();
}

uint64_t sub_23DE665E4()
{
  return MEMORY[0x24BDCC6D8]();
}

uint64_t sub_23DE665F0()
{
  return MEMORY[0x24BDCC858]();
}

uint64_t sub_23DE665FC()
{
  return MEMORY[0x24BDCC898]();
}

uint64_t sub_23DE66608()
{
  return MEMORY[0x24BDCC968]();
}

uint64_t sub_23DE66614()
{
  return MEMORY[0x24BDCC9A8]();
}

uint64_t sub_23DE66620()
{
  return MEMORY[0x24BDCD4E8]();
}

uint64_t sub_23DE6662C()
{
  return MEMORY[0x24BDCD4F8]();
}

uint64_t sub_23DE66638()
{
  return MEMORY[0x24BDCD6C8]();
}

uint64_t sub_23DE66644()
{
  return MEMORY[0x24BDCD6D8]();
}

uint64_t sub_23DE66650()
{
  return MEMORY[0x24BDCD9C0]();
}

uint64_t sub_23DE6665C()
{
  return MEMORY[0x24BDCDAC0]();
}

uint64_t sub_23DE66668()
{
  return MEMORY[0x24BDCDEA8]();
}

uint64_t sub_23DE66674()
{
  return MEMORY[0x24BDCDED0]();
}

uint64_t sub_23DE66680()
{
  return MEMORY[0x24BDCDEE8]();
}

uint64_t sub_23DE6668C()
{
  return MEMORY[0x24BDCDF30]();
}

uint64_t sub_23DE66698()
{
  return MEMORY[0x24BDCDF90]();
}

uint64_t sub_23DE666A4()
{
  return MEMORY[0x24BDCDFD8]();
}

uint64_t sub_23DE666B0()
{
  return MEMORY[0x24BDCE020]();
}

uint64_t sub_23DE666BC()
{
  return MEMORY[0x24BDCE2A0]();
}

uint64_t sub_23DE666C8()
{
  return MEMORY[0x24BDCE5D8]();
}

uint64_t sub_23DE666D4()
{
  return MEMORY[0x24BDCE5F0]();
}

uint64_t sub_23DE666E0()
{
  return MEMORY[0x24BDCE628]();
}

uint64_t sub_23DE666EC()
{
  return MEMORY[0x24BDCE8F8]();
}

uint64_t sub_23DE666F8()
{
  return MEMORY[0x24BDCE900]();
}

uint64_t sub_23DE66704()
{
  return MEMORY[0x24BDCEC90]();
}

uint64_t sub_23DE66710()
{
  return MEMORY[0x24BDCECA0]();
}

uint64_t sub_23DE6671C()
{
  return MEMORY[0x24BDCED58]();
}

uint64_t sub_23DE66728()
{
  return MEMORY[0x24BDCEE90]();
}

uint64_t sub_23DE66734()
{
  return MEMORY[0x24BDCEEA0]();
}

uint64_t sub_23DE66740()
{
  return MEMORY[0x24BDCEEA8]();
}

uint64_t sub_23DE6674C()
{
  return MEMORY[0x24BDCEFC8]();
}

uint64_t sub_23DE66758()
{
  return MEMORY[0x24BDCF0D0]();
}

uint64_t sub_23DE66764()
{
  return MEMORY[0x24BDCF160]();
}

uint64_t sub_23DE66770()
{
  return MEMORY[0x24BDCF290]();
}

uint64_t sub_23DE6677C()
{
  return MEMORY[0x24BDCF2D8]();
}

uint64_t sub_23DE66788()
{
  return MEMORY[0x24BDCF4E0]();
}

uint64_t sub_23DE66794()
{
  return MEMORY[0x24BDCF510]();
}

uint64_t sub_23DE667A0()
{
  return MEMORY[0x24BE45DF0]();
}

uint64_t sub_23DE667AC()
{
  return MEMORY[0x24BE45DF8]();
}

uint64_t sub_23DE667B8()
{
  return MEMORY[0x24BE45E00]();
}

uint64_t sub_23DE667C4()
{
  return MEMORY[0x24BE45E08]();
}

uint64_t sub_23DE667D0()
{
  return MEMORY[0x24BE45E10]();
}

uint64_t sub_23DE667DC()
{
  return MEMORY[0x24BE45E18]();
}

uint64_t sub_23DE667E8()
{
  return MEMORY[0x24BE45F10]();
}

uint64_t sub_23DE667F4()
{
  return MEMORY[0x24BE45F18]();
}

uint64_t sub_23DE66800()
{
  return MEMORY[0x24BE45F20]();
}

uint64_t sub_23DE6680C()
{
  return MEMORY[0x24BE45F98]();
}

uint64_t sub_23DE66818()
{
  return MEMORY[0x24BE45FA0]();
}

uint64_t sub_23DE66824()
{
  return MEMORY[0x24BE45FD8]();
}

uint64_t sub_23DE66830()
{
  return MEMORY[0x24BE45FE0]();
}

uint64_t sub_23DE6683C()
{
  return MEMORY[0x24BE45FE8]();
}

uint64_t sub_23DE66848()
{
  return MEMORY[0x24BE46090]();
}

uint64_t sub_23DE66854()
{
  return MEMORY[0x24BEE76F0]();
}

uint64_t sub_23DE66860()
{
  return MEMORY[0x24BE46118]();
}

uint64_t sub_23DE6686C()
{
  return MEMORY[0x24BEE78A8]();
}

uint64_t sub_23DE66878()
{
  return MEMORY[0x24BEE78D8]();
}

uint64_t sub_23DE66884()
{
  return MEMORY[0x24BDB94D0]();
}

uint64_t sub_23DE66890()
{
  return MEMORY[0x24BDB95E8]();
}

uint64_t sub_23DE6689C()
{
  return MEMORY[0x24BDB98F8]();
}

uint64_t sub_23DE668A8()
{
  return MEMORY[0x24BDB9B40]();
}

uint64_t sub_23DE668B4()
{
  return MEMORY[0x24BDB9FB0]();
}

uint64_t sub_23DE668C0()
{
  return MEMORY[0x24BDB9FC8]();
}

uint64_t sub_23DE668CC()
{
  return MEMORY[0x24BDBA098]();
}

uint64_t sub_23DE668D8()
{
  return MEMORY[0x24BDBA100]();
}

uint64_t sub_23DE668E4()
{
  return MEMORY[0x24BDEC530]();
}

uint64_t sub_23DE668F0()
{
  return MEMORY[0x24BDED2D0]();
}

uint64_t sub_23DE668FC()
{
  return MEMORY[0x24BDED918]();
}

uint64_t sub_23DE66908()
{
  return MEMORY[0x24BDED930]();
}

uint64_t sub_23DE66914()
{
  return MEMORY[0x24BDEDBA8]();
}

uint64_t sub_23DE66920()
{
  return MEMORY[0x24BDEDE90]();
}

uint64_t sub_23DE6692C()
{
  return MEMORY[0x24BDEDE98]();
}

uint64_t sub_23DE66938()
{
  return MEMORY[0x24BDEE038]();
}

uint64_t sub_23DE66944()
{
  return MEMORY[0x24BDEE048]();
}

uint64_t sub_23DE66950()
{
  return MEMORY[0x24BDEE0D8]();
}

uint64_t sub_23DE6695C()
{
  return MEMORY[0x24BDEE390]();
}

uint64_t sub_23DE66968()
{
  return MEMORY[0x24BDEE3A0]();
}

uint64_t sub_23DE66974()
{
  return MEMORY[0x24BDFAAC0]();
}

uint64_t sub_23DE66980()
{
  return MEMORY[0x24BDFAAE8]();
}

uint64_t sub_23DE6698C()
{
  return MEMORY[0x24BDFAB60]();
}

uint64_t sub_23DE66998()
{
  return MEMORY[0x24BDEE490]();
}

uint64_t sub_23DE669A4()
{
  return MEMORY[0x24BDEE4A0]();
}

uint64_t sub_23DE669B0()
{
  return MEMORY[0x24BDEE4E0]();
}

uint64_t sub_23DE669BC()
{
  return MEMORY[0x24BDEE4F8]();
}

uint64_t sub_23DE669C8()
{
  return MEMORY[0x24BDEE530]();
}

uint64_t sub_23DE669D4()
{
  return MEMORY[0x24BDEE730]();
}

uint64_t sub_23DE669E0()
{
  return MEMORY[0x24BDEEA08]();
}

uint64_t sub_23DE669EC()
{
  return MEMORY[0x24BDEEA18]();
}

uint64_t sub_23DE669F8()
{
  return MEMORY[0x24BDEEA28]();
}

uint64_t sub_23DE66A04()
{
  return MEMORY[0x24BDEEA30]();
}

uint64_t sub_23DE66A10()
{
  return MEMORY[0x24BDEEA40]();
}

uint64_t sub_23DE66A1C()
{
  return MEMORY[0x24BDEEA60]();
}

uint64_t sub_23DE66A28()
{
  return MEMORY[0x24BDEEF60]();
}

uint64_t sub_23DE66A34()
{
  return MEMORY[0x24BDEEF78]();
}

uint64_t sub_23DE66A40()
{
  return MEMORY[0x24BDFAB90]();
}

uint64_t sub_23DE66A4C()
{
  return MEMORY[0x24BDFABA0]();
}

uint64_t sub_23DE66A58()
{
  return MEMORY[0x24BDFABC0]();
}

uint64_t sub_23DE66A64()
{
  return MEMORY[0x24BDEF318]();
}

uint64_t sub_23DE66A70()
{
  return MEMORY[0x24BDEF3A0]();
}

uint64_t sub_23DE66A7C()
{
  return MEMORY[0x24BDFABF0]();
}

uint64_t sub_23DE66A88()
{
  return MEMORY[0x24BDF0DC8]();
}

uint64_t sub_23DE66A94()
{
  return MEMORY[0x24BDF1008]();
}

uint64_t sub_23DE66AA0()
{
  return MEMORY[0x24BDF1088]();
}

uint64_t sub_23DE66AAC()
{
  return MEMORY[0x24BDF1430]();
}

uint64_t sub_23DE66AB8()
{
  return MEMORY[0x24BDF1450]();
}

uint64_t sub_23DE66AC4()
{
  return MEMORY[0x24BDF1468]();
}

uint64_t sub_23DE66AD0()
{
  return MEMORY[0x24BDF15F8]();
}

uint64_t sub_23DE66ADC()
{
  return MEMORY[0x24BDF1640]();
}

uint64_t sub_23DE66AE8()
{
  return MEMORY[0x24BDF16D8]();
}

uint64_t sub_23DE66AF4()
{
  return MEMORY[0x24BDF17F8]();
}

uint64_t sub_23DE66B00()
{
  return MEMORY[0x24BDF1840]();
}

uint64_t sub_23DE66B0C()
{
  return MEMORY[0x24BDF1BE8]();
}

uint64_t sub_23DE66B18()
{
  return MEMORY[0x24BDF1D08]();
}

uint64_t sub_23DE66B24()
{
  return MEMORY[0x24BDF1DC8]();
}

uint64_t sub_23DE66B30()
{
  return MEMORY[0x24BDF1FC0]();
}

uint64_t sub_23DE66B3C()
{
  return MEMORY[0x24BDF1FF0]();
}

uint64_t sub_23DE66B48()
{
  return MEMORY[0x24BDFABF8]();
}

uint64_t sub_23DE66B54()
{
  return MEMORY[0x24BDFAC08]();
}

uint64_t sub_23DE66B60()
{
  return MEMORY[0x24BDFAC48]();
}

uint64_t sub_23DE66B6C()
{
  return MEMORY[0x24BDF2088]();
}

uint64_t sub_23DE66B78()
{
  return MEMORY[0x24BDF20A0]();
}

uint64_t sub_23DE66B84()
{
  return MEMORY[0x24BDF2260]();
}

uint64_t sub_23DE66B90()
{
  return MEMORY[0x24BDF2698]();
}

uint64_t sub_23DE66B9C()
{
  return MEMORY[0x24BDF29C8]();
}

uint64_t sub_23DE66BA8()
{
  return MEMORY[0x24BDF2B40]();
}

uint64_t sub_23DE66BB4()
{
  return MEMORY[0x24BDF2DE0]();
}

uint64_t sub_23DE66BC0()
{
  return MEMORY[0x24BDF3A30]();
}

uint64_t sub_23DE66BCC()
{
  return MEMORY[0x24BDF3C98]();
}

uint64_t sub_23DE66BD8()
{
  return MEMORY[0x24BDF3CF0]();
}

uint64_t sub_23DE66BE4()
{
  return MEMORY[0x24BDF3D30]();
}

uint64_t sub_23DE66BF0()
{
  return MEMORY[0x24BDF3E08]();
}

uint64_t sub_23DE66BFC()
{
  return MEMORY[0x24BDF3F80]();
}

uint64_t sub_23DE66C08()
{
  return MEMORY[0x24BDF40C0]();
}

uint64_t sub_23DE66C14()
{
  return MEMORY[0x24BDF4480]();
}

uint64_t sub_23DE66C20()
{
  return MEMORY[0x24BDF46E0]();
}

uint64_t sub_23DE66C2C()
{
  return MEMORY[0x24BDF4730]();
}

uint64_t sub_23DE66C38()
{
  return MEMORY[0x24BDF49A0]();
}

uint64_t sub_23DE66C44()
{
  return MEMORY[0x24BDF49C8]();
}

uint64_t sub_23DE66C50()
{
  return MEMORY[0x24BDF4F18]();
}

uint64_t sub_23DE66C5C()
{
  return MEMORY[0x24BDF4F20]();
}

uint64_t sub_23DE66C68()
{
  return MEMORY[0x24BDB8588]();
}

uint64_t sub_23DE66C74()
{
  return MEMORY[0x24BDB8590]();
}

uint64_t sub_23DE66C80()
{
  return MEMORY[0x24BEE54C8]();
}

uint64_t sub_23DE66C8C()
{
  return MEMORY[0x24BEE5500]();
}

uint64_t sub_23DE66C98()
{
  return MEMORY[0x24BDFACA8]();
}

uint64_t sub_23DE66CA4()
{
  return MEMORY[0x24BDFACB0]();
}

uint64_t sub_23DE66CB0()
{
  return MEMORY[0x24BDFADC0]();
}

uint64_t sub_23DE66CBC()
{
  return MEMORY[0x24BDFADC8]();
}

uint64_t sub_23DE66CC8()
{
  return MEMORY[0x24BDFADE0]();
}

uint64_t sub_23DE66CD4()
{
  return MEMORY[0x24BDFAF10]();
}

uint64_t sub_23DE66CE0()
{
  return MEMORY[0x24BDFB0A8]();
}

uint64_t sub_23DE66CEC()
{
  return MEMORY[0x24BDFB0B8]();
}

uint64_t sub_23DE66CF8()
{
  return MEMORY[0x24BDFB158]();
}

uint64_t sub_23DE66D04()
{
  return MEMORY[0x24BDFB160]();
}

uint64_t sub_23DE66D10()
{
  return MEMORY[0x24BDFB188]();
}

uint64_t sub_23DE66D1C()
{
  return MEMORY[0x24BDFB198]();
}

uint64_t sub_23DE66D28()
{
  return MEMORY[0x24BDFB268]();
}

uint64_t sub_23DE66D34()
{
  return MEMORY[0x24BDFB270]();
}

uint64_t sub_23DE66D40()
{
  return MEMORY[0x24BDFB310]();
}

uint64_t sub_23DE66D4C()
{
  return MEMORY[0x24BDFB320]();
}

uint64_t sub_23DE66D58()
{
  return MEMORY[0x24BDFB4D0]();
}

uint64_t sub_23DE66D64()
{
  return MEMORY[0x24BDFB4D8]();
}

uint64_t sub_23DE66D70()
{
  return MEMORY[0x24BEE0980]();
}

uint64_t sub_23DE66D7C()
{
  return MEMORY[0x24BDCF9E0]();
}

uint64_t sub_23DE66D88()
{
  return MEMORY[0x24BDCF9F0]();
}

uint64_t sub_23DE66D94()
{
  return MEMORY[0x24BDCFA28]();
}

uint64_t sub_23DE66DA0()
{
  return MEMORY[0x24BEE09F0]();
}

uint64_t sub_23DE66DAC()
{
  return MEMORY[0x24BEE0B20]();
}

uint64_t sub_23DE66DB8()
{
  return MEMORY[0x24BEE0C10]();
}

uint64_t sub_23DE66DC4()
{
  return MEMORY[0x24BEE0CE8]();
}

uint64_t sub_23DE66DD0()
{
  return MEMORY[0x24BEE0DC8]();
}

uint64_t sub_23DE66DDC()
{
  return MEMORY[0x24BEE0FD8]();
}

uint64_t sub_23DE66DE8()
{
  return MEMORY[0x24BEE1128]();
}

uint64_t sub_23DE66DF4()
{
  return MEMORY[0x24BEE1190]();
}

uint64_t sub_23DE66E00()
{
  return MEMORY[0x24BEE18A0]();
}

uint64_t sub_23DE66E0C()
{
  return MEMORY[0x24BEE1910]();
}

uint64_t sub_23DE66E18()
{
  return MEMORY[0x24BEE1918]();
}

uint64_t sub_23DE66E24()
{
  return MEMORY[0x24BEE1A28]();
}

uint64_t sub_23DE66E30()
{
  return MEMORY[0x24BEE1B68]();
}

uint64_t sub_23DE66E3C()
{
  return MEMORY[0x24BEE7910]();
}

uint64_t sub_23DE66E48()
{
  return MEMORY[0x24BEE7920]();
}

uint64_t sub_23DE66E54()
{
  return MEMORY[0x24BEE7928]();
}

uint64_t sub_23DE66E60()
{
  return MEMORY[0x24BEE5688]();
}

uint64_t sub_23DE66E6C()
{
  return MEMORY[0x24BEE56F0]();
}

uint64_t sub_23DE66E78()
{
  return MEMORY[0x24BEE5718]();
}

uint64_t sub_23DE66E84()
{
  return MEMORY[0x24BEE5728]();
}

uint64_t sub_23DE66E90()
{
  return MEMORY[0x24BEE5760]();
}

uint64_t sub_23DE66E9C()
{
  return MEMORY[0x24BEE57A0]();
}

uint64_t sub_23DE66EA8()
{
  return MEMORY[0x24BEE1C68]();
}

uint64_t sub_23DE66EB4()
{
  return MEMORY[0x24BEE1F00]();
}

uint64_t sub_23DE66EC0()
{
  return MEMORY[0x24BEE1F48]();
}

uint64_t sub_23DE66ECC()
{
  return MEMORY[0x24BDD0538]();
}

uint64_t sub_23DE66ED8()
{
  return MEMORY[0x24BDD0548]();
}

uint64_t sub_23DE66EE4()
{
  return MEMORY[0x24BDD0568]();
}

uint64_t sub_23DE66EF0()
{
  return MEMORY[0x24BEE2200]();
}

uint64_t sub_23DE66EFC()
{
  return MEMORY[0x24BEE22C0]();
}

uint64_t sub_23DE66F08()
{
  return MEMORY[0x24BEE24B8]();
}

uint64_t sub_23DE66F14()
{
  return MEMORY[0x24BEE24C0]();
}

uint64_t sub_23DE66F20()
{
  return MEMORY[0x24BEE2518]();
}

uint64_t sub_23DE66F2C()
{
  return MEMORY[0x24BEE2658]();
}

uint64_t sub_23DE66F38()
{
  return MEMORY[0x24BEE2660]();
}

uint64_t sub_23DE66F44()
{
  return MEMORY[0x24BEE2838]();
}

uint64_t sub_23DE66F50()
{
  return MEMORY[0x24BEE2C00]();
}

uint64_t sub_23DE66F5C()
{
  return MEMORY[0x24BEE2C38]();
}

uint64_t sub_23DE66F68()
{
  return MEMORY[0x24BEE2C58]();
}

uint64_t sub_23DE66F74()
{
  return MEMORY[0x24BEE2F40]();
}

uint64_t sub_23DE66F80()
{
  return MEMORY[0x24BEE3068]();
}

uint64_t sub_23DE66F8C()
{
  return MEMORY[0x24BEE30B0]();
}

uint64_t sub_23DE66F98()
{
  return MEMORY[0x24BEE3290]();
}

uint64_t sub_23DE66FA4()
{
  return MEMORY[0x24BEE3548]();
}

uint64_t sub_23DE66FB0()
{
  return MEMORY[0x24BEE3568]();
}

uint64_t sub_23DE66FBC()
{
  return MEMORY[0x24BEE3598]();
}

uint64_t sub_23DE66FC8()
{
  return MEMORY[0x24BEE3A30]();
}

uint64_t sub_23DE66FD4()
{
  return MEMORY[0x24BEE3ED0]();
}

uint64_t sub_23DE66FE0()
{
  return MEMORY[0x24BEE3EF8]();
}

uint64_t sub_23DE66FEC()
{
  return MEMORY[0x24BEE3F00]();
}

uint64_t sub_23DE66FF8()
{
  return MEMORY[0x24BEE3F08]();
}

uint64_t sub_23DE67004()
{
  return MEMORY[0x24BEE3F10]();
}

uint64_t sub_23DE67010()
{
  return MEMORY[0x24BEE42E0]();
}

uint64_t sub_23DE6701C()
{
  return MEMORY[0x24BEE42F8]();
}

uint64_t sub_23DE67028()
{
  return MEMORY[0x24BEE4328]();
}

uint64_t sub_23DE67034()
{
  return MEMORY[0x24BEE4A98]();
}

uint64_t HKMedicationsRoomDeepLink()
{
  return MEMORY[0x24BE45C48]();
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB90](dso, log, type, format, buf, *(_QWORD *)&size);
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x24BDAD320](a1, a2);
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

uint64_t swift_getTupleTypeMetadata2()
{
  return MEMORY[0x24BEE4DF8]();
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

uint64_t swift_isUniquelyReferenced_nonNull_bridgeObject()
{
  return MEMORY[0x24BEE4E90]();
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

