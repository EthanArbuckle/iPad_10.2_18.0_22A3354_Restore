void sub_211235F74(uint64_t a1@<X0>, char a2@<W1>, uint64_t a3@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t (*v12)(void);
  uint64_t v13;
  char *v14;
  _BYTE v16[40];

  v4 = v3;
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_254A9A278);
  MEMORY[0x24BDAC7A8](v8);
  v10 = &v16[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0) - 8];
  v11 = sub_21124579C();
  v12 = MEMORY[0x24BDED998];
  MEMORY[0x24BDAC7A8](v11);
  v14 = &v16[-((v13 + 15) & 0xFFFFFFFFFFFFFFF0) - 8];
  sub_2112455A4();
  sub_21120D608(v4, (uint64_t)v14, (uint64_t (*)(_QWORD))v12);
  sub_21120E7AC(v4, (uint64_t)v10, &qword_254A9A278);
  swift_retain();
  sub_211237708((uint64_t)v14, a1, (uint64_t)v16, a2, (uint64_t)v10, a3);
}

double sub_2112360AC@<D0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char v13;
  uint64_t v14;
  char v15;
  __int128 v16;
  double result;
  unint64_t v18[2];
  __int128 v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  char v23;
  uint64_t v24;
  char v25;
  __int128 v26;

  __swift_instantiateConcreteTypeFromMangledName(&qword_253D2B140);
  OUTLINED_FUNCTION_5();
  MEMORY[0x24BDAC7A8](v3);
  OUTLINED_FUNCTION_14();
  v6 = v5 - v4;
  sub_21120E7AC(v1, v5 - v4, &qword_253D2B140);
  v7 = objc_msgSend((id)objc_opt_self(), sel_sharedURLCache);
  sub_211233724(v6, (uint64_t)v7, (unint64_t)sub_2112361E4, 0, v18);
  v8 = v18[0];
  v9 = v18[1];
  v10 = v20;
  v11 = v21;
  type metadata accessor for ProductLockupCircleAsyncImage(0);
  sub_2112461BC();
  sub_211245604();
  v12 = v22;
  v13 = v23;
  v14 = v24;
  v15 = v25;
  v16 = v19;
  *(_QWORD *)a1 = v8;
  *(_QWORD *)(a1 + 8) = v9;
  *(_OWORD *)(a1 + 16) = v16;
  *(_QWORD *)(a1 + 32) = v10;
  *(_QWORD *)(a1 + 40) = v11;
  *(_QWORD *)(a1 + 48) = v12;
  *(_BYTE *)(a1 + 56) = v13;
  *(_QWORD *)(a1 + 64) = v14;
  *(_BYTE *)(a1 + 72) = v15;
  result = *(double *)&v26;
  *(_OWORD *)(a1 + 80) = v26;
  *(_QWORD *)(a1 + 96) = 0;
  *(_WORD *)(a1 + 104) = 1;
  return result;
}

double sub_2112361E4@<D0>(unint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  __n128 v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  double result;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  uint64_t v21;
  char v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[40];
  __int128 v26;
  __int128 v27;
  __int128 v28;
  char v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  uint64_t v35;
  char v36;
  __int128 v37;
  __int128 v38;
  uint64_t v39;

  v4 = sub_211246024();
  v5 = *(_QWORD *)(v4 - 8);
  v6 = MEMORY[0x24BDAC7A8](v4);
  v8 = (char *)&v23 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a1 >> 62)
  {
    v10 = objc_msgSend((id)objc_opt_self(), sel_ams_placeholderBackground);
    v11 = MEMORY[0x212BD6374](v10);
    sub_211245FDC();
    v12 = sub_211245FD0();
    swift_release();
    sub_2112455A4();
    v24 = v37;
    v23 = v38;
    v13 = v39;
    v14 = sub_2112461BC();
    *(_OWORD *)v25 = v24;
    *(_OWORD *)&v25[16] = v23;
    *(_QWORD *)&v25[32] = v13;
    *(_QWORD *)&v26 = v12;
    *((_QWORD *)&v26 + 1) = 256;
    *(_QWORD *)&v27 = v11;
    *((_QWORD *)&v27 + 1) = 256;
    *(_QWORD *)&v28 = v14;
    *((_QWORD *)&v28 + 1) = v15;
    v29 = 1;
    __swift_instantiateConcreteTypeFromMangledName(&qword_254A9F458);
    sub_211207BAC(&qword_254A9F460, &qword_254A9F458);
    sub_211245A3C();
  }
  else
  {
    (*(void (**)(char *, _QWORD, uint64_t, __n128))(v5 + 104))(v8, *MEMORY[0x24BDF3FD0], v4, v6);
    swift_retain();
    v9 = sub_211246030();
    (*(void (**)(char *, uint64_t))(v5 + 8))(v8, v4);
    *(_QWORD *)v25 = v9;
    memset(&v25[8], 0, 32);
    v26 = 0u;
    v27 = 0u;
    v28 = 0u;
    v29 = 0;
    swift_retain();
    __swift_instantiateConcreteTypeFromMangledName(&qword_254A9F458);
    sub_211207BAC(&qword_254A9F460, &qword_254A9F458);
    sub_211245A3C();
    sub_2111DC694(a1);
    swift_release();
  }
  result = *(double *)&v30;
  v17 = v31;
  v18 = v32;
  v19 = v33;
  v20 = v34;
  v21 = v35;
  v22 = v36;
  *(_OWORD *)a2 = v30;
  *(_OWORD *)(a2 + 16) = v17;
  *(_OWORD *)(a2 + 32) = v18;
  *(_OWORD *)(a2 + 48) = v19;
  *(_OWORD *)(a2 + 64) = v20;
  *(_QWORD *)(a2 + 80) = v21;
  *(_BYTE *)(a2 + 88) = v22;
  return result;
}

uint64_t destroy for ProductLockupArtwork(id *a1)
{

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

_QWORD *initializeWithCopy for ProductLockupArtwork(_QWORD *a1, uint64_t a2)
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  id v9;

  v3 = *(void **)a2;
  v4 = *(void **)(a2 + 8);
  *a1 = *(_QWORD *)a2;
  a1[1] = v4;
  v5 = *(_QWORD *)(a2 + 24);
  a1[2] = *(_QWORD *)(a2 + 16);
  a1[3] = v5;
  v6 = *(_QWORD *)(a2 + 40);
  a1[4] = *(_QWORD *)(a2 + 32);
  a1[5] = v6;
  v7 = *(_QWORD *)(a2 + 56);
  a1[6] = *(_QWORD *)(a2 + 48);
  a1[7] = v7;
  v8 = v3;
  v9 = v4;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for ProductLockupArtwork(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;

  v4 = *(void **)a2;
  v5 = *(void **)a1;
  *(_QWORD *)a1 = *(_QWORD *)a2;
  v6 = v4;

  v7 = *(void **)(a1 + 8);
  v8 = *(void **)(a2 + 8);
  *(_QWORD *)(a1 + 8) = v8;
  v9 = v8;

  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(a1 + 56) = *(_QWORD *)(a2 + 56);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t assignWithTake for ProductLockupArtwork(uint64_t a1, uint64_t a2)
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v4 = *(void **)(a1 + 8);
  *(_OWORD *)a1 = *(_OWORD *)a2;

  v5 = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = v5;
  swift_bridgeObjectRelease();
  v6 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v6;
  swift_bridgeObjectRelease();
  v7 = *(_QWORD *)(a2 + 56);
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(a1 + 56) = v7;
  swift_bridgeObjectRelease();
  return a1;
}

ValueMetadata *type metadata accessor for ProductLockupArtwork()
{
  return &type metadata for ProductLockupArtwork;
}

unint64_t sub_21123668C()
{
  unint64_t result;
  uint64_t v1;
  uint64_t OpaqueTypeConformance2;
  uint64_t v3;
  uint64_t v4;
  _QWORD v5[4];

  result = qword_254A9F248;
  if (!qword_254A9F248)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_254A9F250);
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_254A9F228);
    sub_211234A70();
    OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
    v3 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_254A9F218);
    sub_211207BAC(&qword_254A9F220, &qword_254A9F218);
    v5[2] = v3;
    v5[3] = v4;
    v5[0] = OpaqueTypeConformance2;
    v5[1] = swift_getOpaqueTypeConformance2();
    result = MEMORY[0x212BD7970](MEMORY[0x24BDEF3E0], v1, v5);
    atomic_store(result, (unint64_t *)&qword_254A9F248);
  }
  return result;
}

uint64_t sub_211236770()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t type metadata accessor for ProductLockupCircleAsyncImage(uint64_t a1)
{
  return sub_2111BCD48(a1, qword_254A9F310);
}

uint64_t type metadata accessor for ProductLockupAsyncImage(uint64_t a1)
{
  return sub_2111BCD48(a1, qword_254A9F3A0);
}

unint64_t sub_2112367A8()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_254A9F2A0;
  if (!qword_254A9F2A0)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_254A9F288);
    v2[0] = sub_21123680C();
    v2[1] = v2[0];
    result = MEMORY[0x212BD7970](MEMORY[0x24BDEF3E0], v1, v2);
    atomic_store(result, (unint64_t *)&qword_254A9F2A0);
  }
  return result;
}

unint64_t sub_21123680C()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;
  _QWORD v3[2];

  result = qword_254A9F2A8;
  if (!qword_254A9F2A8)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_254A9F280);
    sub_2111D89FC(&qword_254A9F290, (void (*)(uint64_t))type metadata accessor for ProductLockupAsyncImage);
    v3[0] = v2;
    v3[1] = v2;
    result = MEMORY[0x212BD7970](MEMORY[0x24BDEF3E0], v1, v3);
    atomic_store(result, (unint64_t *)&qword_254A9F2A8);
  }
  return result;
}

unint64_t sub_211236888()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD v5[2];

  result = qword_254A9F2B0;
  if (!qword_254A9F2B0)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_254A9F260);
    sub_2111D89FC(&qword_254A9F290, (void (*)(uint64_t))type metadata accessor for ProductLockupAsyncImage);
    v3 = v2;
    sub_2111D89FC(&qword_254A9F298, (void (*)(uint64_t))type metadata accessor for ProductLockupCircleAsyncImage);
    v5[0] = v3;
    v5[1] = v4;
    result = MEMORY[0x212BD7970](MEMORY[0x24BDEF3E0], v1, v5);
    atomic_store(result, (unint64_t *)&qword_254A9F2B0);
  }
  return result;
}

uint64_t sub_211236924(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for ProductLockupAsyncImage(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t *sub_211236968(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v5 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v9 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v9 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    v7 = sub_211244FE0();
    if (__swift_getEnumTagSinglePayload((uint64_t)a2, 1, v7))
    {
      v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_253D2B140);
      memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v8 - 8) + 64));
    }
    else
    {
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a1, a2, v7);
      __swift_storeEnumTagSinglePayload((uint64_t)a1, 0, 1, v7);
    }
    *(_OWORD *)((char *)a1 + *(int *)(a3 + 20)) = *(_OWORD *)((char *)a2 + *(int *)(a3 + 20));
  }
  return a1;
}

char *sub_211236A44(char *a1, char *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;

  v6 = sub_211244FE0();
  if (__swift_getEnumTagSinglePayload((uint64_t)a2, 1, v6))
  {
    v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_253D2B140);
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v7 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(a1, a2, v6);
    __swift_storeEnumTagSinglePayload((uint64_t)a1, 0, 1, v6);
  }
  *(_OWORD *)&a1[*(int *)(a3 + 20)] = *(_OWORD *)&a2[*(int *)(a3 + 20)];
  return a1;
}

char *sub_211236AF0(char *a1, char *a2, uint64_t a3)
{
  uint64_t v6;
  int EnumTagSinglePayload;
  int v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  char *v13;

  v6 = sub_211244FE0();
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
    v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_253D2B140);
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v10 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(a1, a2, v6);
  __swift_storeEnumTagSinglePayload((uint64_t)a1, 0, 1, v6);
LABEL_7:
  v11 = *(int *)(a3 + 20);
  v12 = &a1[v11];
  v13 = &a2[v11];
  *(_QWORD *)v12 = *(_QWORD *)v13;
  *((_QWORD *)v12 + 1) = *((_QWORD *)v13 + 1);
  return a1;
}

char *sub_211236BFC(char *a1, char *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;

  v6 = sub_211244FE0();
  if (__swift_getEnumTagSinglePayload((uint64_t)a2, 1, v6))
  {
    v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_253D2B140);
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v7 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v6 - 8) + 32))(a1, a2, v6);
    __swift_storeEnumTagSinglePayload((uint64_t)a1, 0, 1, v6);
  }
  *(_OWORD *)&a1[*(int *)(a3 + 20)] = *(_OWORD *)&a2[*(int *)(a3 + 20)];
  return a1;
}

char *sub_211236CA8(char *a1, char *a2, uint64_t a3)
{
  uint64_t v6;
  int EnumTagSinglePayload;
  int v8;
  uint64_t v9;
  uint64_t v10;

  v6 = sub_211244FE0();
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
    v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_253D2B140);
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v10 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v6 - 8) + 32))(a1, a2, v6);
  __swift_storeEnumTagSinglePayload((uint64_t)a1, 0, 1, v6);
LABEL_7:
  *(_OWORD *)&a1[*(int *)(a3 + 20)] = *(_OWORD *)&a2[*(int *)(a3 + 20)];
  return a1;
}

uint64_t sub_211236DA4()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_211236DB0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  OUTLINED_FUNCTION_49_4();
  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_253D2B140);
  return __swift_getEnumTagSinglePayload(v1, v0, v2);
}

uint64_t sub_211236DE4()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_211236DF0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  OUTLINED_FUNCTION_49_4();
  __swift_instantiateConcreteTypeFromMangledName(&qword_253D2B140);
  v0 = OUTLINED_FUNCTION_13_16();
  return __swift_storeEnumTagSinglePayload(v0, v1, v2, v3);
}

void sub_211236E1C()
{
  unint64_t v0;

  sub_21120F294(319, (unint64_t *)&qword_253D2B0F0, (uint64_t (*)(uint64_t))MEMORY[0x24BDCDAC0], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1C68]);
  if (v0 <= 0x3F)
    swift_initStructMetadata();
}

uint64_t *sub_211236EA4(uint64_t *a1, uint64_t *a2, int *a3)
{
  int v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

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
    v7 = sub_211244FE0();
    if (__swift_getEnumTagSinglePayload((uint64_t)a2, 1, v7))
    {
      v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_253D2B140);
      memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v8 - 8) + 64));
    }
    else
    {
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a1, a2, v7);
      __swift_storeEnumTagSinglePayload((uint64_t)a1, 0, 1, v7);
    }
    v10 = a3[6];
    *(uint64_t *)((char *)a1 + a3[5]) = *(uint64_t *)((char *)a2 + a3[5]);
    *(_OWORD *)((char *)a1 + v10) = *(_OWORD *)((char *)a2 + v10);
    *((_BYTE *)a1 + a3[7]) = *((_BYTE *)a2 + a3[7]);
  }
  return a1;
}

uint64_t sub_211236F90(uint64_t a1)
{
  uint64_t v2;
  uint64_t result;

  v2 = OUTLINED_FUNCTION_3_4();
  result = __swift_getEnumTagSinglePayload(a1, 1, v2);
  if (!(_DWORD)result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return result;
}

char *sub_211236FE4(char *a1, char *a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v6 = sub_211244FE0();
  if (__swift_getEnumTagSinglePayload((uint64_t)a2, 1, v6))
  {
    v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_253D2B140);
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v7 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(a1, a2, v6);
    __swift_storeEnumTagSinglePayload((uint64_t)a1, 0, 1, v6);
  }
  v8 = a3[6];
  *(_QWORD *)&a1[a3[5]] = *(_QWORD *)&a2[a3[5]];
  *(_OWORD *)&a1[v8] = *(_OWORD *)&a2[v8];
  a1[a3[7]] = a2[a3[7]];
  return a1;
}

char *sub_2112370A4(char *a1, char *a2, int *a3)
{
  uint64_t v6;
  int EnumTagSinglePayload;
  int v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  char *v13;

  v6 = sub_211244FE0();
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
    v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_253D2B140);
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v10 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(a1, a2, v6);
  __swift_storeEnumTagSinglePayload((uint64_t)a1, 0, 1, v6);
LABEL_7:
  *(_QWORD *)&a1[a3[5]] = *(_QWORD *)&a2[a3[5]];
  v11 = a3[6];
  v12 = &a1[v11];
  v13 = &a2[v11];
  *(_QWORD *)v12 = *(_QWORD *)v13;
  *((_QWORD *)v12 + 1) = *((_QWORD *)v13 + 1);
  a1[a3[7]] = a2[a3[7]];
  return a1;
}

char *sub_2112371C8(char *a1, char *a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v6 = sub_211244FE0();
  if (__swift_getEnumTagSinglePayload((uint64_t)a2, 1, v6))
  {
    v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_253D2B140);
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v7 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v6 - 8) + 32))(a1, a2, v6);
    __swift_storeEnumTagSinglePayload((uint64_t)a1, 0, 1, v6);
  }
  v8 = a3[6];
  *(_QWORD *)&a1[a3[5]] = *(_QWORD *)&a2[a3[5]];
  *(_OWORD *)&a1[v8] = *(_OWORD *)&a2[v8];
  a1[a3[7]] = a2[a3[7]];
  return a1;
}

char *sub_211237288(char *a1, char *a2, int *a3)
{
  uint64_t v6;
  int EnumTagSinglePayload;
  int v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v6 = sub_211244FE0();
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
    v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_253D2B140);
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v10 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v6 - 8) + 32))(a1, a2, v6);
  __swift_storeEnumTagSinglePayload((uint64_t)a1, 0, 1, v6);
LABEL_7:
  v11 = a3[6];
  *(_QWORD *)&a1[a3[5]] = *(_QWORD *)&a2[a3[5]];
  *(_OWORD *)&a1[v11] = *(_OWORD *)&a2[v11];
  a1[a3[7]] = a2[a3[7]];
  return a1;
}

uint64_t sub_211237398()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

void sub_2112373A4(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_253D2B140);
  if (*(_DWORD *)(*(_QWORD *)(v4 - 8) + 84) == (_DWORD)a2)
    OUTLINED_FUNCTION_7_9(a1, a2, v4);
  else
    OUTLINED_FUNCTION_10();
}

uint64_t sub_211237420()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

void sub_21123742C(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  char v4;
  uint64_t v5;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  OUTLINED_FUNCTION_49_4();
  if (*(_DWORD *)(*(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_253D2B140) - 8) + 84) == a3)
  {
    v8 = OUTLINED_FUNCTION_13_16();
    OUTLINED_FUNCTION_8_6(v8, v9, v10, v11);
  }
  else
  {
    *(_BYTE *)(v5 + *(int *)(a4 + 28)) = v4 + 1;
    OUTLINED_FUNCTION_10();
  }
}

void sub_211237484()
{
  unint64_t v0;

  sub_21120F294(319, (unint64_t *)&qword_253D2B0F0, (uint64_t (*)(uint64_t))MEMORY[0x24BDCDAC0], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1C68]);
  if (v0 <= 0x3F)
    swift_initStructMetadata();
}

unint64_t sub_211237528()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_254A9F3E0;
  if (!qword_254A9F3E0)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_254A9F3E8);
    v2[0] = sub_2112367A8();
    v2[1] = sub_211236888();
    result = MEMORY[0x212BD7970](MEMORY[0x24BDEF3E0], v1, v2);
    atomic_store(result, (unint64_t *)&qword_254A9F3E0);
  }
  return result;
}

uint64_t sub_211237594()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_2112375A4()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_2112375B4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v1 = *(unsigned __int8 *)(*(_QWORD *)(type metadata accessor for ProductLockupAsyncImage(0) - 8) + 80);
  v2 = (v1 + 16) & ~v1;
  v3 = OUTLINED_FUNCTION_3_4();
  if (!__swift_getEnumTagSinglePayload(v0 + v2, 1, v3))
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(v0 + v2, v3);
  return swift_deallocObject();
}

void sub_211237638(unint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;

  v5 = *(unsigned __int8 *)(*(_QWORD *)(type metadata accessor for ProductLockupAsyncImage(0) - 8) + 80);
  sub_211235A24(a1, v2 + ((v5 + 16) & ~v5), a2);
}

unint64_t sub_211237684()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;
  _QWORD v3[2];

  result = qword_254A9F430;
  if (!qword_254A9F430)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_254A9F418);
    sub_211207BAC(&qword_254A9F428, &qword_254A9F410);
    v3[0] = v2;
    v3[1] = MEMORY[0x24BDF3E20];
    result = MEMORY[0x212BD7970](MEMORY[0x24BDEF3E0], v1, v3);
    atomic_store(result, (unint64_t *)&qword_254A9F430);
  }
  return result;
}

void sub_211237708(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, char a4@<W3>, uint64_t a5@<X4>, uint64_t a6@<X8>)
{
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  char *v18;
  __int128 v19;
  char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;

  v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_254A9A278);
  MEMORY[0x24BDAC7A8](v12);
  v14 = (char *)&v26 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_254A9F438);
  MEMORY[0x24BDAC7A8](v15);
  v17 = (char *)&v26 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_21120D608(a1, (uint64_t)v17, (uint64_t (*)(_QWORD))MEMORY[0x24BDED998]);
  v18 = &v17[*(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_254A9F440) + 36)];
  v19 = *(_OWORD *)(a3 + 16);
  *(_OWORD *)v18 = *(_OWORD *)a3;
  *((_OWORD *)v18 + 1) = v19;
  *((_QWORD *)v18 + 4) = *(_QWORD *)(a3 + 32);
  *(_QWORD *)&v17[*(int *)(v15 + 52)] = a2;
  v20 = &v17[*(int *)(v15 + 56)];
  *v20 = 0;
  v20[1] = a4;
  sub_21120E7AC(a5, (uint64_t)v14, &qword_254A9A278);
  swift_retain();
  v21 = sub_2112461BC();
  v23 = v22;
  sub_2111C6F34(a5, &qword_254A9A278);
  swift_release();
  sub_2111F2CE8(a1, (uint64_t (*)(_QWORD))MEMORY[0x24BDED998]);
  v24 = a6 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_254A9F448) + 36);
  sub_21120E1A0((uint64_t)v14, v24, &qword_254A9A278);
  v25 = (uint64_t *)(v24 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_254A9F450) + 36));
  *v25 = v21;
  v25[1] = v23;
  sub_21120E1A0((uint64_t)v17, a6, &qword_254A9F438);
}

unint64_t sub_2112378C0()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD v4[2];

  result = qword_254A9F468;
  if (!qword_254A9F468)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_254A9F3F8);
    v2 = sub_21123795C(&qword_254A9F470, &qword_254A9F478);
    sub_211207BAC(&qword_254A9F4A0, &qword_254A9F3F0);
    v4[0] = v2;
    v4[1] = v3;
    result = MEMORY[0x212BD7970](MEMORY[0x24BDED308], v1, v4);
    atomic_store(result, (unint64_t *)&qword_254A9F468);
  }
  return result;
}

uint64_t sub_21123795C(unint64_t *a1, uint64_t *a2)
{
  uint64_t (*v2)(void);
  uint64_t result;
  uint64_t v5;
  _QWORD v6[2];

  result = *a1;
  if (!result)
  {
    v5 = OUTLINED_FUNCTION_4_16(0, a2);
    v6[0] = v2();
    v6[1] = MEMORY[0x24BDEEC40];
    result = MEMORY[0x212BD7970](MEMORY[0x24BDED308], v5, v6);
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_2112379C0()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;
  _QWORD v3[2];

  result = qword_254A9F480;
  if (!qword_254A9F480)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_254A9F488);
    sub_211207BAC(&qword_254A9F490, &qword_254A9F498);
    v3[0] = v2;
    v3[1] = MEMORY[0x24BDEBEE0];
    result = MEMORY[0x212BD7970](MEMORY[0x24BDED308], v1, v3);
    atomic_store(result, (unint64_t *)&qword_254A9F480);
  }
  return result;
}

unint64_t sub_211237A48()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD v4[2];

  result = qword_254A9F4A8;
  if (!qword_254A9F4A8)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_254A9F4B0);
    v2 = sub_21123795C(&qword_254A9F4B8, &qword_254A9F4C0);
    sub_211207BAC(&qword_254A9F4E8, &qword_254A9F4F0);
    v4[0] = v2;
    v4[1] = v3;
    result = MEMORY[0x212BD7970](MEMORY[0x24BDED308], v1, v4);
    atomic_store(result, (unint64_t *)&qword_254A9F4A8);
  }
  return result;
}

unint64_t sub_211237AE4()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;
  _QWORD v3[2];

  result = qword_254A9F4C8;
  if (!qword_254A9F4C8)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_254A9F4D0);
    sub_211207BAC(&qword_254A9F4D8, &qword_254A9F4E0);
    v3[0] = v2;
    v3[1] = MEMORY[0x24BDEBEE0];
    result = MEMORY[0x212BD7970](MEMORY[0x24BDED308], v1, v3);
    atomic_store(result, (unint64_t *)&qword_254A9F4C8);
  }
  return result;
}

uint64_t OUTLINED_FUNCTION_2_33(uint64_t a1)
{
  return CGSizeMake(a1);
}

uint64_t OUTLINED_FUNCTION_3_25()
{
  return sub_211245A3C();
}

void OUTLINED_FUNCTION_4_28(uint64_t a1)
{
  uint64_t (*v1)(_QWORD);
  uint64_t v2;

  sub_21120D608(a1, *(_QWORD *)(v2 - 272), v1);
}

uint64_t OUTLINED_FUNCTION_5_26()
{
  char v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  int *v6;
  _QWORD *v7;

  v6 = *(int **)(v2 - 224);
  *(_QWORD *)(v1 + v6[5]) = v5;
  v7 = (_QWORD *)(v1 + v6[6]);
  *v7 = v3;
  v7[1] = v4;
  *(_BYTE *)(v1 + v6[7]) = v0;
  return sub_211236924(v1, *(_QWORD *)(v2 - 288));
}

void OUTLINED_FUNCTION_6_23()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;

  sub_21120E7AC(v1, *(_QWORD *)(v2 - 200), v0);
}

uint64_t OUTLINED_FUNCTION_7_25()
{
  return sub_211245A3C();
}

uint64_t OUTLINED_FUNCTION_8_22()
{
  return swift_getOpaqueTypeConformance2();
}

void OUTLINED_FUNCTION_10_22()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;

  sub_21120E7AC(v1, *(_QWORD *)(v2 - 240), v0);
}

id OUTLINED_FUNCTION_11_19()
{
  void *v0;
  const char *v1;

  return objc_msgSend(v0, v1);
}

uint64_t OUTLINED_FUNCTION_12_20()
{
  return swift_bridgeObjectRetain();
}

uint64_t OUTLINED_FUNCTION_14_22()
{
  return sub_211245A3C();
}

void OUTLINED_FUNCTION_17_12()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(v1 - 256) = v0;
}

void OUTLINED_FUNCTION_19_13()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  *(_QWORD *)(v4 - 176) = v2;
  *(_QWORD *)(v4 - 168) = v0;
  *(_QWORD *)(v4 - 160) = v3;
  *(_QWORD *)(v4 - 152) = v1;
}

uint64_t OUTLINED_FUNCTION_24_10()
{
  return swift_storeEnumTagMultiPayload();
}

uint64_t OUTLINED_FUNCTION_25_14()
{
  return swift_bridgeObjectRetain();
}

void OUTLINED_FUNCTION_26_8(uint64_t a1)
{
  uint64_t (*v1)(_QWORD);
  uint64_t v2;

  sub_21120D608(a1, *(_QWORD *)(v2 - 304), v1);
}

void OUTLINED_FUNCTION_27_10()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  *(_QWORD *)(v7 - 176) = v3;
  *(_QWORD *)(v7 - 168) = v0;
  *(_QWORD *)(v7 - 160) = v4;
  *(_QWORD *)(v7 - 152) = v2;
  *(_QWORD *)(v7 - 144) = v5;
  *(_QWORD *)(v7 - 136) = v6;
  *(_QWORD *)(v7 - 128) = v1;
}

void OUTLINED_FUNCTION_28_10(_QWORD *a1)
{
  void (*v1)(uint64_t);

  sub_2111D89FC(a1, v1);
}

uint64_t OUTLINED_FUNCTION_30_7@<X0>(uint64_t a1@<X8>, double a2@<D0>, double a3@<D1>)
{
  return sub_211218598(*(_QWORD *)(a1 - 256), a2, a3);
}

void OUTLINED_FUNCTION_32_10()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  *(_QWORD *)(v3 - 144) = v1;
  *(_QWORD *)(v3 - 136) = v2;
  *(_QWORD *)(v3 - 128) = v0;
}

uint64_t OUTLINED_FUNCTION_34_5()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, _QWORD))(v1 + 8))(v2, *v0);
}

uint64_t OUTLINED_FUNCTION_35_6@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t (*a3)(uint64_t, uint64_t, uint64_t)@<X8>)
{
  uint64_t v3;

  return a3(a1, a2, v3);
}

uint64_t OUTLINED_FUNCTION_36_8()
{
  return swift_storeEnumTagMultiPayload();
}

uint64_t OUTLINED_FUNCTION_38_7()
{
  uint64_t v0;

  return v0;
}

void OUTLINED_FUNCTION_41_8()
{
  unint64_t v0;

  sub_2111DC694(v0);
}

uint64_t OUTLINED_FUNCTION_42_5()
{
  return swift_bridgeObjectRetain();
}

unint64_t OUTLINED_FUNCTION_44_5()
{
  return sub_211236888();
}

uint64_t OUTLINED_FUNCTION_45_7()
{
  unint64_t v0;
  uint64_t v1;

  return sub_2111D0594(v1, v0);
}

void OUTLINED_FUNCTION_46_4(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v3;

  sub_21120E1A0(a1, v3, a3);
}

double OUTLINED_FUNCTION_47_6@<D0>(uint64_t a1@<X8>)
{
  return *(double *)a1;
}

double OUTLINED_FUNCTION_48_3@<D0>(uint64_t a1@<X8>)
{
  return *(double *)a1;
}

void OUTLINED_FUNCTION_52_3()
{
  uint64_t v0;

}

uint64_t OUTLINED_FUNCTION_56_0()
{
  return swift_bridgeObjectRetain();
}

uint64_t OUTLINED_FUNCTION_59_2()
{
  return swift_release();
}

unint64_t *initializeBufferWithCopyOfBuffer for ReviewResult(unint64_t *a1, unint64_t *a2)
{
  unint64_t v3;

  v3 = *a2;
  sub_211237DF8(*a2);
  *a1 = v3;
  return a1;
}

unint64_t sub_211237DF8(unint64_t result)
{
  if (result >> 62 == 1)
    return (unint64_t)(id)(result & 0x3FFFFFFFFFFFFFFFLL);
  if (!(result >> 62))
    return (unint64_t)(id)result;
  return result;
}

void destroy for ReviewResult(unint64_t *a1)
{
  sub_21122C894(*a1);
}

unint64_t *assignWithCopy for ReviewResult(unint64_t *a1, unint64_t *a2)
{
  unint64_t v3;
  unint64_t v4;

  v3 = *a2;
  sub_211237DF8(*a2);
  v4 = *a1;
  *a1 = v3;
  sub_21122C894(v4);
  return a1;
}

unint64_t *assignWithTake for ReviewResult(unint64_t *a1, unint64_t *a2)
{
  unint64_t v3;

  v3 = *a1;
  *a1 = *a2;
  sub_21122C894(v3);
  return a1;
}

ValueMetadata *type metadata accessor for ReviewResult()
{
  return &type metadata for ReviewResult;
}

void sub_211237EA0(uint64_t a1)
{
  swift_bridgeObjectRelease();

}

_QWORD *sub_211237EC8(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;
  void *v4;
  id v5;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  v4 = (void *)a2[2];
  a1[2] = v4;
  swift_bridgeObjectRetain();
  v5 = v4;
  return a1;
}

_QWORD *sub_211237F00(_QWORD *a1, _QWORD *a2)
{
  void *v4;
  void *v5;
  id v6;

  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v4 = (void *)a1[2];
  v5 = (void *)a2[2];
  a1[2] = v5;
  v6 = v5;

  return a1;
}

uint64_t sub_211237F60(uint64_t a1, uint64_t a2)
{
  void *v4;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  swift_bridgeObjectRelease();
  v4 = *(void **)(a1 + 16);
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);

  return a1;
}

uint64_t sub_211237FA4(uint64_t a1, unsigned int a2)
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

uint64_t sub_211237FF8(uint64_t result, unsigned int a2, unsigned int a3)
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
      *(_QWORD *)(result + 8) = a2;
  }
  return result;
}

void type metadata accessor for SubmitReviewResponse()
{
  OUTLINED_FUNCTION_11_4();
}

void sub_211238058(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_254A9F558);
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v6 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_2112389EC();
  sub_211246A8C();
  sub_21124696C();
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  OUTLINED_FUNCTION_2_13();
}

uint64_t sub_211238134(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v9;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_254A9F548);
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v6 = (char *)&v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = (uint64_t)__swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_2112389EC();
  OUTLINED_FUNCTION_4_7();
  if (!v1)
  {
    v7 = sub_211246924();
    (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  }
  OUTLINED_FUNCTION_2_34();
  return v7;
}

uint64_t sub_211238230()
{
  uint64_t v0;
  unsigned int v1;

  v0 = sub_211246900();
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

uint64_t sub_211238284(char a1)
{
  if ((a1 & 1) != 0)
    return 0x676F6C616964;
  else
    return 0x692D776569766572;
}

void sub_2112382C0(_QWORD *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char v16;

  v13 = a3;
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_254A9F518);
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)&v12 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_211238764();
  sub_211246A8C();
  v14 = a4;
  v16 = 0;
  type metadata accessor for ReviewData();
  sub_2112387DC(&qword_254A9F520, (uint64_t)&protocol conformance descriptor for ReviewData);
  OUTLINED_FUNCTION_6_24();
  if (!v4)
  {
    v14 = a2;
    v15 = v13;
    v16 = 1;
    sub_21123881C();
    OUTLINED_FUNCTION_6_24();
  }
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  OUTLINED_FUNCTION_2_13();
}

void *sub_211238404(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v3;
  id v5;
  void *v6;
  void *v7;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_254A9F4F8);
  MEMORY[0x24BDAC7A8](v3);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_211238764();
  OUTLINED_FUNCTION_4_7();
  if (v1)
  {
    v6 = 0;
    OUTLINED_FUNCTION_2_34();
  }
  else
  {
    type metadata accessor for ReviewData();
    sub_2112387DC(&qword_254A9F508, (uint64_t)&protocol conformance descriptor for ReviewData);
    OUTLINED_FUNCTION_3_26();
    sub_2112387A0();
    v5 = v7;
    OUTLINED_FUNCTION_3_26();
    OUTLINED_FUNCTION_1_32();
    v6 = v7;
    OUTLINED_FUNCTION_2_34();

  }
  return v6;
}

uint64_t sub_21123858C()
{
  sub_2112389EC();
  return sub_211246A98();
}

uint64_t sub_2112385B4()
{
  sub_2112389EC();
  return sub_211246AA4();
}

uint64_t sub_2112385DC@<X0>(_QWORD *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v2;
  uint64_t result;
  uint64_t v5;

  result = sub_211238134(a1);
  if (!v2)
  {
    *a2 = result;
    a2[1] = v5;
  }
  return result;
}

void sub_211238604(_QWORD *a1)
{
  sub_211238058(a1);
}

void sub_21123861C(char *a1, char *a2)
{
  sub_2111EBE00(*a1, *a2);
}

void sub_211238628()
{
  sub_21123CD68();
}

uint64_t sub_211238630()
{
  return sub_21123CD74();
}

void sub_211238638()
{
  sub_21123D00C();
}

uint64_t sub_211238640@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = sub_211238230();
  *a1 = result;
  return result;
}

uint64_t sub_21123866C@<X0>(uint64_t *a1@<X8>)
{
  char *v1;
  uint64_t result;
  uint64_t v4;

  result = sub_211238284(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t sub_211238694()
{
  char *v0;

  return sub_211238284(*v0);
}

uint64_t sub_21123869C@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = sub_211238280();
  *a1 = result;
  return result;
}

void sub_2112386C0(_BYTE *a1@<X8>)
{
  *a1 = 2;
}

uint64_t sub_2112386CC()
{
  sub_211238764();
  return sub_211246A98();
}

uint64_t sub_2112386F4()
{
  sub_211238764();
  return sub_211246AA4();
}

void *sub_21123871C@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v2;
  void *result;
  uint64_t v5;
  uint64_t v6;

  result = sub_211238404(a1);
  if (!v2)
  {
    *a2 = result;
    a2[1] = v5;
    a2[2] = v6;
  }
  return result;
}

void sub_211238748(_QWORD *a1)
{
  uint64_t *v1;

  sub_2112382C0(a1, *v1, v1[1], v1[2]);
}

unint64_t sub_211238764()
{
  unint64_t result;

  result = qword_254A9F500;
  if (!qword_254A9F500)
  {
    result = MEMORY[0x212BD7970](&unk_21125B2AC, &unk_24CB58E68);
    atomic_store(result, (unint64_t *)&qword_254A9F500);
  }
  return result;
}

unint64_t sub_2112387A0()
{
  unint64_t result;

  result = qword_254A9F510;
  if (!qword_254A9F510)
  {
    result = MEMORY[0x212BD7970](&unk_21125B284, &unk_24CB58EE0);
    atomic_store(result, (unint64_t *)&qword_254A9F510);
  }
  return result;
}

uint64_t sub_2112387DC(unint64_t *a1, uint64_t a2)
{
  uint64_t result;
  uint64_t v5;

  result = *a1;
  if (!result)
  {
    v5 = type metadata accessor for ReviewData();
    result = MEMORY[0x212BD7970](a2, v5);
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_21123881C()
{
  unint64_t result;

  result = qword_254A9F528;
  if (!qword_254A9F528)
  {
    result = MEMORY[0x212BD7970](&unk_21125B25C, &unk_24CB58EE0);
    atomic_store(result, (unint64_t *)&qword_254A9F528);
  }
  return result;
}

uint64_t sub_211238858(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_2112388A4 + 4 * byte_21125B0D5[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_2112388D8 + 4 * byte_21125B0D0[v4]))();
}

uint64_t sub_2112388D8(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_2112388E0(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x2112388E8);
  return result;
}

uint64_t sub_2112388F4(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x2112388FCLL);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_211238900(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_211238908(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

void type metadata accessor for SubmitReviewResponse.CodingKeys()
{
  OUTLINED_FUNCTION_11_4();
}

void type metadata accessor for SubmitReviewResponse.Dialog()
{
  OUTLINED_FUNCTION_11_4();
}

unint64_t sub_211238930()
{
  unint64_t result;

  result = qword_254A9F530;
  if (!qword_254A9F530)
  {
    result = MEMORY[0x212BD7970](&unk_21125B234, &unk_24CB58E68);
    atomic_store(result, (unint64_t *)&qword_254A9F530);
  }
  return result;
}

unint64_t sub_211238970()
{
  unint64_t result;

  result = qword_254A9F538;
  if (!qword_254A9F538)
  {
    result = MEMORY[0x212BD7970](&unk_21125B16C, &unk_24CB58E68);
    atomic_store(result, (unint64_t *)&qword_254A9F538);
  }
  return result;
}

unint64_t sub_2112389B0()
{
  unint64_t result;

  result = qword_254A9F540;
  if (!qword_254A9F540)
  {
    result = MEMORY[0x212BD7970](&unk_21125B194, &unk_24CB58E68);
    atomic_store(result, (unint64_t *)&qword_254A9F540);
  }
  return result;
}

unint64_t sub_2112389EC()
{
  unint64_t result;

  result = qword_254A9F550;
  if (!qword_254A9F550)
  {
    result = MEMORY[0x212BD7970](&unk_21125B3B4, &type metadata for SubmitReviewResponse.Dialog.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_254A9F550);
  }
  return result;
}

uint64_t storeEnumTagSinglePayload for SubmitReviewResponse.Dialog.CodingKeys(uint64_t a1, int a2, int a3)
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
    return ((uint64_t (*)(void))((char *)sub_211238A68 + 4 * byte_21125B0DA[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_211238A88 + 4 * byte_21125B0DF[v4]))();
}

_BYTE *sub_211238A68(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_211238A88(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_211238A90(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_211238A98(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_211238AA0(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_211238AA8(_DWORD *result)
{
  *result = 0;
  return result;
}

ValueMetadata *type metadata accessor for SubmitReviewResponse.Dialog.CodingKeys()
{
  return &type metadata for SubmitReviewResponse.Dialog.CodingKeys;
}

unint64_t sub_211238AC8()
{
  unint64_t result;

  result = qword_254A9F560;
  if (!qword_254A9F560)
  {
    result = MEMORY[0x212BD7970](&unk_21125B38C, &type metadata for SubmitReviewResponse.Dialog.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_254A9F560);
  }
  return result;
}

unint64_t sub_211238B08()
{
  unint64_t result;

  result = qword_254A9F568;
  if (!qword_254A9F568)
  {
    result = MEMORY[0x212BD7970](&unk_21125B2FC, &type metadata for SubmitReviewResponse.Dialog.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_254A9F568);
  }
  return result;
}

unint64_t sub_211238B48()
{
  unint64_t result;

  result = qword_254A9F570;
  if (!qword_254A9F570)
  {
    result = MEMORY[0x212BD7970](&unk_21125B324, &type metadata for SubmitReviewResponse.Dialog.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_254A9F570);
  }
  return result;
}

uint64_t OUTLINED_FUNCTION_1_32()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 8))(v1, v0);
}

uint64_t OUTLINED_FUNCTION_2_34()
{
  uint64_t v0;

  return __swift_destroy_boxed_opaque_existential_0(v0);
}

uint64_t OUTLINED_FUNCTION_3_26()
{
  return sub_211246918();
}

uint64_t OUTLINED_FUNCTION_6_24()
{
  return sub_211246960();
}

uint64_t SubscriptionsView.model.getter()
{
  return swift_retain();
}

uint64_t sub_211238BBC@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  result = SubscriptionsView.model.getter();
  *a1 = result;
  return result;
}

void sub_211238BFC()
{
  uint64_t v0;

  v0 = swift_retain();
  SubscriptionsView.model.setter(v0);
}

void SubscriptionsView.model.setter(uint64_t a1)
{
  uint64_t v1;

  swift_release();
  *(_QWORD *)(v1 + 32) = a1;
  OUTLINED_FUNCTION_11();
}

uint64_t (*SubscriptionsView.model.modify())(_QWORD)
{
  return CGSizeMake;
}

uint64_t SubscriptionsView.$model.getter()
{
  type metadata accessor for SubscriptionsModel();
  sub_211238CD4();
  return sub_2112456D0();
}

uint64_t type metadata accessor for SubscriptionsModel()
{
  uint64_t result;

  result = qword_254A9F620;
  if (!qword_254A9F620)
    return swift_getSingletonMetadata();
  return result;
}

unint64_t sub_211238CD4()
{
  unint64_t result;
  uint64_t v1;

  result = qword_254A9F580;
  if (!qword_254A9F580)
  {
    v1 = type metadata accessor for SubscriptionsModel();
    result = MEMORY[0x212BD7970](&protocol conformance descriptor for SubscriptionsModel, v1);
    atomic_store(result, (unint64_t *)&qword_254A9F580);
  }
  return result;
}

void sub_211238D14(void *a1, uint64_t a2)
{
  id v3;
  uint64_t v4;
  void *v5;

  v3 = a1;
  swift_unknownObjectRetain();
  swift_retain();
  v4 = sub_2112390A4();
  if (v4)
  {
    v5 = (void *)v4;
    sub_211239CF8();
    sub_2111C2FA8(v3, a2, v5);
  }
  else
  {
    sub_211239CF8();
    sub_2111C3010(v3, a2);
  }
  OUTLINED_FUNCTION_17_1();
  OUTLINED_FUNCTION_10();
}

uint64_t SubscriptionsView.init(account:bag:model:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, _QWORD *a4@<X8>)
{
  uint64_t result;
  uint64_t v9;

  type metadata accessor for SubscriptionsModel();
  sub_211238CD4();
  swift_retain();
  result = sub_2112456C4();
  *a4 = a1;
  a4[1] = a2;
  a4[2] = a3;
  a4[3] = result;
  a4[4] = v9;
  return result;
}

void SubscriptionsView.makeViewController(context:)()
{
  uint64_t v0;

  sub_211238D14(*(void **)v0, *(_QWORD *)(v0 + 8));
}

void SubscriptionsView.update(_:context:)(void *a1)
{
  void *v2;
  void *v3;
  id v4;

  OUTLINED_FUNCTION_10_1();
  v2 = (void *)sub_2112390A4();
  OUTLINED_FUNCTION_44();
  objc_msgSend(a1, sel_setClientInfo_, v2);

  OUTLINED_FUNCTION_10_1();
  v3 = (void *)sub_21123921C();
  OUTLINED_FUNCTION_44();
  if (v3)
  {
    sub_211246318();

  }
  objc_msgSend(a1, sel_setMetricsOverlay_, 0);

}

uint64_t sub_211238F1C(uint64_t a1)
{
  return sub_2111D1B20(a1);
}

void sub_211238F54()
{
  sub_2111D1E78();
}

uint64_t sub_211238F8C()
{
  sub_211239994();
  return sub_211245BD4();
}

uint64_t sub_211238FDC()
{
  sub_211239994();
  return sub_211245BA4();
}

void sub_21123902C()
{
  sub_211239994();
  sub_211245BC8();
  __break(1u);
}

uint64_t sub_211239050@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  result = sub_2112390A4();
  *a1 = result;
  return result;
}

uint64_t sub_211239078(id *a1)
{
  id v1;

  v1 = *a1;
  return sub_2112390B8();
}

uint64_t sub_2112390A4()
{
  return sub_211239230();
}

uint64_t sub_2112390B8()
{
  return sub_2111C3614();
}

void sub_2112390CC()
{
  _QWORD *v0;
  _QWORD *v1;
  uint64_t KeyPath;

  v1 = OUTLINED_FUNCTION_11_1();
  *v0 = v1;
  v1[4] = swift_getKeyPath();
  KeyPath = swift_getKeyPath();
  v1[6] = OUTLINED_FUNCTION_3_1(KeyPath);
  OUTLINED_FUNCTION_10();
}

uint64_t sub_211239120()
{
  return sub_2111C37A8((uint64_t)&OBJC_IVAR____TtC20AppleMediaServicesUI18SubscriptionsModel__clientInfo, (uint64_t *)&unk_254A99CA0);
}

uint64_t sub_211239134(uint64_t a1)
{
  return sub_2111C3820(a1, (uint64_t *)&unk_254A9B6A0, (uint64_t)&OBJC_IVAR____TtC20AppleMediaServicesUI18SubscriptionsModel__clientInfo, (uint64_t *)&unk_254A99CA0);
}

void sub_211239150()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;

  v1 = OUTLINED_FUNCTION_12_0();
  OUTLINED_FUNCTION_10_6((uint64_t)v1);
  v2 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_254A9B6A0);
  *(_QWORD *)(v0 + 48) = OUTLINED_FUNCTION_4_0(v2);
  *(_QWORD *)(v0 + 56) = OUTLINED_FUNCTION_7_5();
  OUTLINED_FUNCTION_0_14();
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_254A99CA0);
  OUTLINED_FUNCTION_15_6();
  OUTLINED_FUNCTION_18_4();
  OUTLINED_FUNCTION_10();
}

void sub_2112391BC(uint64_t a1, char a2)
{
  sub_2111C3978(a1, a2, (void (*)(void *))sub_211239134);
}

uint64_t sub_2112391C8@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  result = sub_21123921C();
  *a1 = result;
  return result;
}

uint64_t sub_2112391F0(id *a1)
{
  id v1;

  v1 = *a1;
  return sub_2112392E0();
}

uint64_t sub_21123921C()
{
  return sub_211239230();
}

uint64_t sub_211239230()
{
  uint64_t v1;

  swift_getKeyPath();
  swift_getKeyPath();
  sub_2112454C0();
  OUTLINED_FUNCTION_44();
  OUTLINED_FUNCTION_17_1();
  return v1;
}

void sub_211239290(uint64_t *a1@<X8>)
{
  *a1 = sub_2112390A4();
  OUTLINED_FUNCTION_11();
}

void sub_2112392B8(uint64_t *a1@<X8>)
{
  *a1 = sub_21123921C();
  OUTLINED_FUNCTION_11();
}

uint64_t sub_2112392E0()
{
  return sub_2111C3614();
}

void sub_2112392F4()
{
  _QWORD *v0;
  _QWORD *v1;
  uint64_t KeyPath;

  v1 = OUTLINED_FUNCTION_11_1();
  *v0 = v1;
  v1[4] = swift_getKeyPath();
  KeyPath = swift_getKeyPath();
  v1[6] = OUTLINED_FUNCTION_3_1(KeyPath);
  OUTLINED_FUNCTION_10();
}

uint64_t sub_211239348()
{
  return sub_2111C37A8((uint64_t)&OBJC_IVAR____TtC20AppleMediaServicesUI18SubscriptionsModel__metricsOverlay, (uint64_t *)&unk_254A9F970);
}

uint64_t sub_21123935C(uint64_t a1)
{
  return sub_2111C3820(a1, (uint64_t *)&unk_254A99CC0, (uint64_t)&OBJC_IVAR____TtC20AppleMediaServicesUI18SubscriptionsModel__metricsOverlay, (uint64_t *)&unk_254A9F970);
}

void sub_211239378()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;

  v1 = OUTLINED_FUNCTION_12_0();
  OUTLINED_FUNCTION_10_6((uint64_t)v1);
  v2 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_254A99CC0);
  *(_QWORD *)(v0 + 48) = OUTLINED_FUNCTION_4_0(v2);
  *(_QWORD *)(v0 + 56) = OUTLINED_FUNCTION_7_5();
  OUTLINED_FUNCTION_0_14();
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_254A9F970);
  OUTLINED_FUNCTION_15_6();
  OUTLINED_FUNCTION_18_4();
  OUTLINED_FUNCTION_10();
}

void sub_2112393E4(uint64_t a1, char a2)
{
  sub_2111C3978(a1, a2, (void (*)(void *))sub_21123935C);
}

uint64_t sub_2112393F0@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;

  result = sub_211239454();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_211239418()
{
  swift_bridgeObjectRetain();
  return sub_2112394E4();
}

uint64_t sub_211239454()
{
  uint64_t v1;

  swift_getKeyPath();
  swift_getKeyPath();
  sub_2112454C0();
  OUTLINED_FUNCTION_17_1();
  OUTLINED_FUNCTION_44();
  return v1;
}

void sub_2112394BC(uint64_t *a1@<X8>)
{
  uint64_t v2;

  *a1 = sub_211239454();
  a1[1] = v2;
  OUTLINED_FUNCTION_11();
}

uint64_t sub_2112394E4()
{
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  return sub_2112454CC();
}

void sub_21123955C()
{
  _QWORD *v0;
  _QWORD *v1;
  uint64_t KeyPath;

  v1 = OUTLINED_FUNCTION_11_1();
  *v0 = v1;
  v1[4] = swift_getKeyPath();
  KeyPath = swift_getKeyPath();
  v1[6] = OUTLINED_FUNCTION_3_1(KeyPath);
  OUTLINED_FUNCTION_10();
}

uint64_t sub_2112395B0()
{
  return sub_2111C37A8((uint64_t)&OBJC_IVAR____TtC20AppleMediaServicesUI18SubscriptionsModel__subscriptionType, &qword_254A9F5A0);
}

uint64_t sub_2112395C4(uint64_t a1)
{
  return sub_2111C3820(a1, &qword_254A9CAE0, (uint64_t)&OBJC_IVAR____TtC20AppleMediaServicesUI18SubscriptionsModel__subscriptionType, &qword_254A9F5A0);
}

void sub_2112395E0()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;

  v1 = OUTLINED_FUNCTION_12_0();
  OUTLINED_FUNCTION_10_6((uint64_t)v1);
  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_254A9CAE0);
  *(_QWORD *)(v0 + 48) = OUTLINED_FUNCTION_4_0(v2);
  *(_QWORD *)(v0 + 56) = OUTLINED_FUNCTION_7_5();
  OUTLINED_FUNCTION_0_14();
  __swift_instantiateConcreteTypeFromMangledName(&qword_254A9F5A0);
  OUTLINED_FUNCTION_15_6();
  OUTLINED_FUNCTION_18_4();
  OUTLINED_FUNCTION_10();
}

void sub_21123964C(uint64_t a1, char a2)
{
  sub_2111C3978(a1, a2, (void (*)(void *))sub_2112395C4);
}

uint64_t SubscriptionsModel.__allocating_init(clientInfo:metricsOverlay:subscriptionType:)(void *a1, void *a2)
{
  uint64_t v4;

  v4 = swift_allocObject();
  SubscriptionsModel.init(clientInfo:metricsOverlay:subscriptionType:)(a1, a2);
  return v4;
}

uint64_t SubscriptionsModel.init(clientInfo:metricsOverlay:subscriptionType:)(void *a1, void *a2)
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
  id v20;
  id v21;
  uint64_t v23;

  v23 = __swift_instantiateConcreteTypeFromMangledName(&qword_254A9F5A0);
  v3 = *(_QWORD *)(v23 - 8);
  MEMORY[0x24BDAC7A8](v23);
  OUTLINED_FUNCTION_14();
  v6 = v5 - v4;
  v7 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_254A9F970);
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7);
  OUTLINED_FUNCTION_14();
  v11 = v10 - v9;
  v12 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_254A99CA0);
  v13 = *(_QWORD *)(v12 - 8);
  MEMORY[0x24BDAC7A8](v12);
  OUTLINED_FUNCTION_14();
  v16 = v15 - v14;
  v17 = v2 + OBJC_IVAR____TtC20AppleMediaServicesUI18SubscriptionsModel__clientInfo;
  __swift_instantiateConcreteTypeFromMangledName(&qword_254A99EA0);
  sub_211245490();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v13 + 32))(v17, v16, v12);
  v18 = v2 + OBJC_IVAR____TtC20AppleMediaServicesUI18SubscriptionsModel__metricsOverlay;
  __swift_instantiateConcreteTypeFromMangledName(&qword_254A99CD0);
  sub_211245490();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v8 + 32))(v18, v11, v7);
  v19 = v2 + OBJC_IVAR____TtC20AppleMediaServicesUI18SubscriptionsModel__subscriptionType;
  __swift_instantiateConcreteTypeFromMangledName(&qword_254A9CAF0);
  sub_211245490();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 32))(v19, v6, v23);
  v20 = a1;
  sub_2112390B8();
  v21 = a2;
  sub_2112392E0();
  sub_2112394E4();

  return v2;
}

uint64_t SubscriptionsModel.deinit()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v1 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_254A99CA0);
  OUTLINED_FUNCTION_0_1(v1);
  v2 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_254A9F970);
  OUTLINED_FUNCTION_0_1(v2);
  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_254A9F5A0);
  OUTLINED_FUNCTION_0_1(v3);
  return v0;
}

uint64_t SubscriptionsModel.__deallocating_deinit()
{
  SubscriptionsModel.deinit();
  return swift_deallocClassInstance();
}

unint64_t sub_211239934()
{
  unint64_t result;

  result = qword_254A9F5A8;
  if (!qword_254A9F5A8)
  {
    result = MEMORY[0x212BD7970](&protocol conformance descriptor for SubscriptionsView, &type metadata for SubscriptionsView);
    atomic_store(result, (unint64_t *)&qword_254A9F5A8);
  }
  return result;
}

unint64_t sub_211239970(uint64_t a1)
{
  unint64_t result;

  result = sub_211239994();
  *(_QWORD *)(a1 + 8) = result;
  return result;
}

unint64_t sub_211239994()
{
  unint64_t result;

  result = qword_254A9F5E8;
  if (!qword_254A9F5E8)
  {
    result = MEMORY[0x212BD7970](&protocol conformance descriptor for SubscriptionsView, &type metadata for SubscriptionsView);
    atomic_store(result, (unint64_t *)&qword_254A9F5E8);
  }
  return result;
}

unint64_t sub_2112399D4()
{
  unint64_t result;

  result = qword_254A9F5F0;
  if (!qword_254A9F5F0)
  {
    result = MEMORY[0x212BD7970](&protocol conformance descriptor for SubscriptionsView, &type metadata for SubscriptionsView);
    atomic_store(result, (unint64_t *)&qword_254A9F5F0);
  }
  return result;
}

uint64_t sub_211239A10@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  type metadata accessor for SubscriptionsModel();
  result = sub_211245484();
  *a1 = result;
  return result;
}

void sub_211239A54()
{
  sub_211239120();
  OUTLINED_FUNCTION_11();
}

uint64_t sub_211239A70(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_2111C3718(a1, a2, a3, a4, (uint64_t *)&unk_254A9B6A0, sub_211239134);
}

void sub_211239A94()
{
  sub_211239348();
  OUTLINED_FUNCTION_11();
}

uint64_t sub_211239AB0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_2111C3718(a1, a2, a3, a4, (uint64_t *)&unk_254A99CC0, sub_21123935C);
}

void sub_211239AD4()
{
  sub_2112395B0();
  OUTLINED_FUNCTION_11();
}

uint64_t sub_211239AF0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_2111C3718(a1, a2, a3, a4, &qword_254A9CAE0, sub_2112395C4);
}

ValueMetadata *type metadata accessor for SubscriptionsView()
{
  return &type metadata for SubscriptionsView;
}

uint64_t sub_211239B24()
{
  return type metadata accessor for SubscriptionsModel();
}

void sub_211239B2C()
{
  unint64_t v0;
  unint64_t v1;
  unint64_t v2;

  sub_2111C4188(319, qword_254A99D60, &qword_254A99EA0);
  if (v0 <= 0x3F)
  {
    sub_2111C4188(319, &qword_254A9FB20, &qword_254A99CD0);
    if (v1 <= 0x3F)
    {
      sub_2111C4188(319, (unint64_t *)&qword_254A9F630, &qword_254A9CAF0);
      if (v2 <= 0x3F)
        swift_updateClassMetadata2();
    }
  }
}

uint64_t method lookup function for SubscriptionsModel()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of SubscriptionsModel.clientInfo.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 104))();
}

uint64_t dispatch thunk of SubscriptionsModel.clientInfo.setter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 112))();
}

uint64_t dispatch thunk of SubscriptionsModel.clientInfo.modify()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 120))();
}

uint64_t dispatch thunk of SubscriptionsModel.$clientInfo.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 128))();
}

uint64_t dispatch thunk of SubscriptionsModel.$clientInfo.setter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 136))();
}

uint64_t dispatch thunk of SubscriptionsModel.$clientInfo.modify()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 144))();
}

uint64_t dispatch thunk of SubscriptionsModel.metricsOverlay.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 152))();
}

uint64_t dispatch thunk of SubscriptionsModel.metricsOverlay.setter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 160))();
}

uint64_t dispatch thunk of SubscriptionsModel.metricsOverlay.modify()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 168))();
}

uint64_t dispatch thunk of SubscriptionsModel.$metricsOverlay.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 176))();
}

uint64_t dispatch thunk of SubscriptionsModel.$metricsOverlay.setter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 184))();
}

uint64_t dispatch thunk of SubscriptionsModel.$metricsOverlay.modify()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 192))();
}

uint64_t dispatch thunk of SubscriptionsModel.subscriptionType.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 200))();
}

uint64_t dispatch thunk of SubscriptionsModel.subscriptionType.setter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 208))();
}

uint64_t dispatch thunk of SubscriptionsModel.subscriptionType.modify()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 216))();
}

uint64_t dispatch thunk of SubscriptionsModel.$subscriptionType.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 224))();
}

uint64_t dispatch thunk of SubscriptionsModel.$subscriptionType.setter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 232))();
}

uint64_t dispatch thunk of SubscriptionsModel.$subscriptionType.modify()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 240))();
}

uint64_t dispatch thunk of SubscriptionsModel.__allocating_init(clientInfo:metricsOverlay:subscriptionType:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 248))();
}

ValueMetadata *type metadata accessor for SubscriptionsView.SubscriptionsViewSpecifier()
{
  return &type metadata for SubscriptionsView.SubscriptionsViewSpecifier;
}

unint64_t sub_211239CF8()
{
  unint64_t result;

  result = qword_254A9F750;
  if (!qword_254A9F750)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_254A9F750);
  }
  return result;
}

void UIActionContext.account.getter()
{
  OUTLINED_FUNCTION_1_33(OBJC_IVAR___AMSUIActionContext_account);
  OUTLINED_FUNCTION_11();
}

uint64_t UIActionContext.bag.getter()
{
  return swift_unknownObjectRetain();
}

void UIActionContext.processInfo.getter()
{
  OUTLINED_FUNCTION_1_33(OBJC_IVAR___AMSUIActionContext_processInfo);
  OUTLINED_FUNCTION_11();
}

void UIActionContext.presentingViewController.getter()
{
  OUTLINED_FUNCTION_1_33(OBJC_IVAR___AMSUIActionContext_presentingViewController);
  OUTLINED_FUNCTION_11();
}

id UIActionContext.__allocating_init(account:bag:presentingViewController:processInfo:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  objc_class *v4;
  id v9;

  v9 = objc_allocWithZone(v4);
  return UIActionContext.init(account:bag:presentingViewController:processInfo:)(a1, a2, a3, a4);
}

id UIActionContext.init(account:bag:presentingViewController:processInfo:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  char *v4;
  objc_super v6;

  *(_QWORD *)&v4[OBJC_IVAR___AMSUIActionContext_account] = a1;
  *(_QWORD *)&v4[OBJC_IVAR___AMSUIActionContext_bag] = a2;
  *(_QWORD *)&v4[OBJC_IVAR___AMSUIActionContext_presentingViewController] = a3;
  *(_QWORD *)&v4[OBJC_IVAR___AMSUIActionContext_processInfo] = a4;
  v6.receiver = v4;
  v6.super_class = (Class)type metadata accessor for UIActionContext();
  return objc_msgSendSuper2(&v6, sel_init);
}

uint64_t type metadata accessor for UIActionContext()
{
  return objc_opt_self();
}

id UIActionContext.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

void UIActionContext.init()()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

id UIActionContext.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for UIActionContext();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

void sub_211239FD0()
{
  UIActionContext.account.getter();
}

uint64_t sub_211239FF0()
{
  return UIActionContext.bag.getter();
}

void sub_21123A010()
{
  UIActionContext.processInfo.getter();
}

uint64_t method lookup function for UIActionContext()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of UIActionContext.__allocating_init(account:bag:presentingViewController:processInfo:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 112))();
}

id OUTLINED_FUNCTION_1_33@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return *(id *)(v1 + a1);
}

uint64_t sub_21123A04C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;
  _QWORD *v8;

  __swift_instantiateConcreteTypeFromMangledName(&qword_254A9EF30);
  OUTLINED_FUNCTION_33_0();
  MEMORY[0x24BDAC7A8](v5);
  OUTLINED_FUNCTION_7_26();
  v6 = sub_211246570();
  __swift_storeEnumTagSinglePayload(v2, 1, 1, v6);
  v7 = (_QWORD *)OUTLINED_FUNCTION_15_0();
  v7[2] = 0;
  v7[3] = 0;
  v7[4] = a1;
  v7[5] = a2;
  v8 = (_QWORD *)OUTLINED_FUNCTION_15_0();
  v8[2] = 0;
  v8[3] = 0;
  v8[4] = &unk_254A9F810;
  v8[5] = v7;
  sub_21123B230(v2, (uint64_t)&unk_254A9F820, (uint64_t)v8);
  return swift_release();
}

uint64_t sub_21123A100()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  __swift_instantiateConcreteTypeFromMangledName(&qword_254A9BBF0);
  v0 = swift_allocObject();
  *(_OWORD *)(v0 + 16) = xmmword_211255210;
  v1 = sub_2111C63C4(0, (unint64_t *)&qword_254A99E68);
  v2 = sub_21123B47C(&qword_254A9F838, (unint64_t *)&qword_254A99E68, (uint64_t)off_24CB4DEE0, (uint64_t)&protocol conformance descriptor for AMSUIAlertDialogTask);
  *(_QWORD *)(v0 + 32) = v1;
  *(_QWORD *)(v0 + 40) = v2;
  v3 = sub_2111C63C4(0, (unint64_t *)&qword_254A9D240);
  v4 = sub_21123B47C(&qword_254A9F840, (unint64_t *)&qword_254A9D240, (uint64_t)off_24CB4DFA8, (uint64_t)&protocol conformance descriptor for AMSUIEngagementTask);
  *(_QWORD *)(v0 + 48) = v3;
  *(_QWORD *)(v0 + 56) = v4;
  v5 = sub_2111C63C4(0, (unint64_t *)&qword_254A9A050);
  v6 = sub_21123B47C(&qword_254A9F848, (unint64_t *)&qword_254A9A050, (uint64_t)off_24CB4DFC8, (uint64_t)&protocol conformance descriptor for AMSUIFamilyCircleStateTask);
  *(_QWORD *)(v0 + 64) = v5;
  *(_QWORD *)(v0 + 72) = v6;
  return v0;
}

uint64_t sub_21123A218()
{
  uint64_t v0;
  uint64_t v1;

  v0 = sub_211245130();
  __swift_allocate_value_buffer(v0, qword_254A9F7A8);
  __swift_project_value_buffer(v0, (uint64_t)qword_254A9F7A8);
  type metadata accessor for UIActionRunner();
  sub_21123A100();
  sub_21124516C();
  v1 = sub_211245160();
  sub_2111F5224(v1);
  return sub_211245124();
}

void static UIActionRunner.canHandle(_:context:)(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  uint64_t v15;

  OUTLINED_FUNCTION_13_18();
  OUTLINED_FUNCTION_33_0();
  MEMORY[0x24BDAC7A8](v3);
  OUTLINED_FUNCTION_0_5();
  OUTLINED_FUNCTION_33_0();
  MEMORY[0x24BDAC7A8](v4);
  OUTLINED_FUNCTION_7_26();
  v5 = sub_211245130();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  OUTLINED_FUNCTION_14();
  v9 = v8 - v7;
  if (qword_254A992C0 != -1)
    swift_once();
  v10 = __swift_project_value_buffer(v5, (uint64_t)qword_254A9F7A8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v6 + 16))(v9, v10, v5);
  if (a2)
  {
    OUTLINED_FUNCTION_14_23();
    sub_21123A574();
  }
  v11 = a2;
  sub_211245154();
  v12 = (*(uint64_t (**)(uint64_t, uint64_t))(v6 + 8))(v9, v5);
  OUTLINED_FUNCTION_12_21(v12, &qword_254A99FE0);
  sub_211245304();
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_253D2B190);
  OUTLINED_FUNCTION_8_0();
  *(_OWORD *)(swift_allocObject() + 16) = xmmword_211255200;
  v13 = (id)AMSSetLogKeyIfNeeded();
  sub_21124639C();

  type metadata accessor for UIActionRunner();
  sub_2112451D8();
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_35_1();
  OUTLINED_FUNCTION_46_0();
  sub_211245190();
  v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_254A99C08);
  OUTLINED_FUNCTION_9_22(v14);
  v15 = sub_211245178();
  OUTLINED_FUNCTION_12_21(v15, &qword_253D2B1A0);
  OUTLINED_FUNCTION_6_25();
  OUTLINED_FUNCTION_28_2();
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(_BYTE *)(*(_QWORD *)(a1 - 8) + 82) & 2) != 0)
    return *(_QWORD *)a2;
  return a2;
}

uint64_t type metadata accessor for UIActionRunner()
{
  return objc_opt_self();
}

unint64_t sub_21123A574()
{
  unint64_t result;
  uint64_t v1;

  result = qword_254A9F7C0;
  if (!qword_254A9F7C0)
  {
    v1 = type metadata accessor for UIActionContext();
    result = MEMORY[0x212BD7970](&protocol conformance descriptor for UIActionContext, v1);
    atomic_store(result, (unint64_t *)&qword_254A9F7C0);
  }
  return result;
}

uint64_t static UIActionRunner.handle(_:context:)(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;

  v3[12] = a2;
  v3[13] = v2;
  v3[11] = a1;
  v4 = sub_211245130();
  v3[14] = v4;
  v3[15] = *(_QWORD *)(v4 - 8);
  v3[16] = OUTLINED_FUNCTION_1_24();
  OUTLINED_FUNCTION_13_18();
  v3[17] = OUTLINED_FUNCTION_1_24();
  v5 = sub_21124537C();
  v3[18] = v5;
  v3[19] = *(_QWORD *)(v5 - 8);
  v3[20] = OUTLINED_FUNCTION_1_24();
  return swift_task_switch();
}

void sub_21123A6C0()
{
  _QWORD *v0;
  uint64_t v1;
  id v2;
  uint64_t v3;

  v1 = v0[11];
  sub_211245304();
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_253D2B190);
  OUTLINED_FUNCTION_8_0();
  *(_OWORD *)(swift_allocObject() + 16) = xmmword_211255200;
  v2 = (id)AMSSetLogKeyIfNeeded();
  sub_21124639C();

  type metadata accessor for UIActionRunner();
  sub_2112451D8();
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_35_1();
  OUTLINED_FUNCTION_46_0();
  sub_211245190();
  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_254A99C08);
  v0[7] = v1;
  v0[10] = v3;
  swift_bridgeObjectRetain();
  sub_211245178();
  sub_21123B374((uint64_t)(v0 + 7), &qword_253D2B1A0);
  OUTLINED_FUNCTION_6_25();
  OUTLINED_FUNCTION_28_2();
}

uint64_t sub_21123A804()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;
  _QWORD *v9;
  uint64_t v11;

  sub_21124534C();
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_17_13(v11);
  if (qword_254A992C0 != -1)
    swift_once();
  v3 = v0[15];
  v2 = v0[16];
  v4 = v0[14];
  v5 = v0[12];
  v6 = __swift_project_value_buffer(v4, (uint64_t)qword_254A9F7A8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16))(v2, v6, v4);
  v7 = (void *)v0[12];
  if (v5)
  {
    v0[5] = OUTLINED_FUNCTION_14_23();
    v0[6] = sub_21123A574();
    v0[2] = v7;
  }
  else
  {
    *(_QWORD *)(v1 + 32) = 0;
    *(_OWORD *)v1 = 0u;
    *(_OWORD *)(v1 + 16) = 0u;
  }
  v8 = v7;
  v9 = (_QWORD *)swift_task_alloc();
  v0[21] = v9;
  *v9 = v0;
  v9[1] = sub_21123A900;
  return sub_21124513C();
}

uint64_t sub_21123A900(uint64_t a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v4;

  v4 = *v2;
  *(_QWORD *)(v4 + 176) = v1;
  swift_task_dealloc();
  (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v4 + 120) + 8))(*(_QWORD *)(v4 + 128), *(_QWORD *)(v4 + 112));
  if (v1)
    return swift_task_switch();
  sub_21123B374(v4 + 16, &qword_254A99FE0);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(uint64_t))(v4 + 8))(a1);
}

uint64_t sub_21123A9E4()
{
  uint64_t v0;

  sub_21123B374(v0 + 16, &qword_254A99FE0);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_21123AABC(int a1, void *a2, void *aBlock)
{
  _QWORD *v3;
  uint64_t v5;
  id v6;
  _QWORD *v7;

  v3[2] = a2;
  v3[3] = _Block_copy(aBlock);
  v5 = sub_211246324();
  v3[4] = v5;
  swift_getObjCClassMetadata();
  v6 = a2;
  v7 = (_QWORD *)swift_task_alloc();
  v3[5] = v7;
  *v7 = v3;
  v7[1] = sub_21123AB6C;
  return static UIActionRunner.handle(_:context:)(v5, (uint64_t)a2);
}

uint64_t sub_21123AB6C()
{
  void *v0;
  uint64_t *v1;
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void (**v9)(_QWORD, _QWORD, _QWORD);

  v2 = v0;
  v3 = *v1;
  v4 = *(void **)(*v1 + 16);
  v5 = *v1;
  swift_task_dealloc();

  swift_bridgeObjectRelease();
  if (v0)
  {
    v6 = sub_211244F68();

    v7 = 0;
    v8 = (void *)v6;
  }
  else
  {
    v7 = sub_211246300();
    swift_bridgeObjectRelease();
    v6 = 0;
    v8 = (void *)v7;
  }
  v9 = *(void (***)(_QWORD, _QWORD, _QWORD))(v3 + 24);
  v9[2](v9, v7, v6);

  _Block_release(v9);
  return (*(uint64_t (**)(void))(v5 + 8))();
}

void static UIActionRunner.handle(_:context:)()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  id v3;
  uint64_t v4;
  uint64_t v5;

  sub_211245130();
  OUTLINED_FUNCTION_33_0();
  MEMORY[0x24BDAC7A8](v0);
  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_13_18();
  OUTLINED_FUNCTION_33_0();
  MEMORY[0x24BDAC7A8](v1);
  OUTLINED_FUNCTION_0_5();
  OUTLINED_FUNCTION_33_0();
  MEMORY[0x24BDAC7A8](v2);
  OUTLINED_FUNCTION_14();
  sub_211245304();
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_253D2B190);
  OUTLINED_FUNCTION_8_0();
  *(_OWORD *)(swift_allocObject() + 16) = xmmword_211255200;
  v3 = (id)AMSSetLogKeyIfNeeded();
  sub_21124639C();

  type metadata accessor for UIActionRunner();
  sub_2112451D8();
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_35_1();
  OUTLINED_FUNCTION_46_0();
  sub_211245190();
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_254A99C08);
  OUTLINED_FUNCTION_9_22(v4);
  v5 = sub_211245178();
  OUTLINED_FUNCTION_12_21(v5, &qword_253D2B1A0);
  OUTLINED_FUNCTION_6_25();
  OUTLINED_FUNCTION_28_2();
}

uint64_t sub_21123ADE0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;

  sub_21124534C();
  swift_bridgeObjectRelease();
  (*(void (**)(uint64_t, _QWORD))(*(_QWORD *)(v3 - 160) + 8))(v2, *(_QWORD *)(v3 - 152));
  if (qword_254A992C0 != -1)
    swift_once();
  v4 = __swift_project_value_buffer(v0, (uint64_t)qword_254A9F7A8);
  v5 = *(_QWORD *)(v3 - 144);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 16))(v1, v4, v0);
  v6 = *(void **)(v3 - 136);
  if (v6)
  {
    *(_QWORD *)(v3 - 104) = OUTLINED_FUNCTION_14_23();
    *(_QWORD *)(v3 - 96) = sub_21123A574();
    *(_QWORD *)(v3 - 128) = v6;
  }
  else
  {
    *(_QWORD *)(v3 - 96) = 0;
    *(_OWORD *)(v3 - 128) = 0u;
    *(_OWORD *)(v3 - 112) = 0u;
  }
  v7 = v6;
  v8 = sub_211245148();
  v9 = (*(uint64_t (**)(uint64_t, uint64_t))(v5 + 8))(v1, v0);
  OUTLINED_FUNCTION_12_21(v9, &qword_254A99FE0);
  return v8;
}

id sub_21123AF3C(void *a1)
{
  void *v1;

  swift_bridgeObjectRelease();

  return a1;
}

id UIActionRunner.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

id UIActionRunner.init()()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for UIActionRunner();
  return objc_msgSendSuper2(&v2, sel_init);
}

id UIActionRunner.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for UIActionRunner();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_21123B004()
{
  uint64_t v0;

  _Block_release(*(const void **)(v0 + 32));
  return swift_deallocObject();
}

uint64_t sub_21123B038()
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
  v2 = OUTLINED_FUNCTION_4_29(v1, (uint64_t)sub_211227FA8);
  return OUTLINED_FUNCTION_1_34(v2, v3, v4, v5, v6);
}

uint64_t sub_21123B084(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v3;
  _QWORD *v4;
  uint64_t (*v6)(void);

  v6 = (uint64_t (*)(void))((char *)a3 + *a3);
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v3 + 16) = v4;
  *v4 = v3;
  v4[1] = sub_21122809C;
  return v6();
}

uint64_t sub_21123B0DC()
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
  v2 = OUTLINED_FUNCTION_4_29(v1, (uint64_t)sub_21122809C);
  return OUTLINED_FUNCTION_1_34(v2, v3, v4, v5, v6);
}

uint64_t sub_21123B128(uint64_t a1, uint64_t a2, uint64_t a3, int *a4)
{
  uint64_t v4;
  _QWORD *v5;
  uint64_t (*v7)(void);

  v7 = (uint64_t (*)(void))((char *)a4 + *a4);
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v4 + 16) = v5;
  *v5 = v4;
  v5[1] = sub_21122809C;
  return v7();
}

uint64_t objectdestroy_5Tm_0()
{
  swift_unknownObjectRelease();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_21123B1AC(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  int *v6;
  _QWORD *v7;

  v4 = v1[2];
  v5 = v1[3];
  v6 = (int *)v1[4];
  v7 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v7;
  *v7 = v2;
  v7[1] = sub_21122809C;
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, int *))((char *)&dword_254A9F818 + dword_254A9F818))(a1, v4, v5, v6);
}

uint64_t sub_21123B230(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;

  v6 = sub_211246570();
  if (__swift_getEnumTagSinglePayload(a1, 1, v6) == 1)
  {
    sub_21123B374(a1, &qword_254A9EF30);
  }
  else
  {
    sub_211246564();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 8))(a1, v6);
  }
  if (*(_QWORD *)(a3 + 16))
  {
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_211246510();
    swift_unknownObjectRelease();
  }
  v7 = swift_allocObject();
  *(_QWORD *)(v7 + 16) = a2;
  *(_QWORD *)(v7 + 24) = a3;
  return swift_task_create();
}

uint64_t sub_21123B374(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  OUTLINED_FUNCTION_17_13(*(_QWORD *)(v3 - 8));
  return a1;
}

uint64_t sub_21123B3A8()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_21123B3CC(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  int *v4;
  _QWORD *v5;

  v4 = *(int **)(v1 + 16);
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_21122DEC0;
  return ((uint64_t (*)(uint64_t, int *))((char *)&dword_254A9F828 + dword_254A9F828))(a1, v4);
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

uint64_t sub_21123B47C(unint64_t *a1, unint64_t *a2, uint64_t a3, uint64_t a4)
{
  uint64_t result;
  uint64_t v7;

  result = *a1;
  if (!result)
  {
    v7 = sub_2111C63C4(255, a2);
    result = MEMORY[0x212BD7970](a4, v7);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t OUTLINED_FUNCTION_1_34(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t (*a5)(void))
{
  return a5();
}

uint64_t OUTLINED_FUNCTION_4_29@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v3;

  *a1 = v3;
  a1[1] = a2;
  return v2;
}

uint64_t OUTLINED_FUNCTION_6_25()
{
  return sub_211245190();
}

uint64_t OUTLINED_FUNCTION_7_26()
{
  return 0;
}

uint64_t OUTLINED_FUNCTION_9_22(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v2 - 104) = a1;
  *(_QWORD *)(v2 - 128) = v1;
  return swift_bridgeObjectRetain();
}

uint64_t OUTLINED_FUNCTION_12_21(uint64_t a1, uint64_t *a2)
{
  uint64_t v2;

  return sub_21123B374(v2 - 128, a2);
}

uint64_t OUTLINED_FUNCTION_13_18()
{
  return sub_2112451A8();
}

uint64_t OUTLINED_FUNCTION_14_23()
{
  return type metadata accessor for UIActionContext();
}

uint64_t OUTLINED_FUNCTION_17_13@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return (*(uint64_t (**)(uint64_t))(a1 + 8))(v1);
}

uint64_t sub_21123B550()
{
  uint64_t result;
  uint64_t v1;

  result = sub_21124639C();
  qword_254A9F850 = result;
  qword_254A9F858 = v1;
  return result;
}

uint64_t static UIActionRunnerError.errorDomain.getter()
{
  uint64_t v0;

  if (qword_254A992C8 != -1)
    swift_once();
  OUTLINED_FUNCTION_2_5();
  v0 = qword_254A9F850;
  swift_bridgeObjectRetain();
  return v0;
}

uint64_t static UIActionRunnerError.errorDomain.setter(uint64_t a1, uint64_t a2)
{
  if (qword_254A992C8 != -1)
    swift_once();
  OUTLINED_FUNCTION_2_5();
  qword_254A9F850 = a1;
  qword_254A9F858 = a2;
  return swift_bridgeObjectRelease();
}

uint64_t (*static UIActionRunnerError.errorDomain.modify())()
{
  if (qword_254A992C8 != -1)
    swift_once();
  OUTLINED_FUNCTION_2_5();
  return j__swift_endAccess;
}

uint64_t UIActionRunnerError.errorDescription.getter()
{
  return sub_2112463D8();
}

uint64_t UIActionRunnerError.init(rawValue:)@<X0>(uint64_t result@<X0>, BOOL *a2@<X8>)
{
  *a2 = result != 0;
  return result;
}

uint64_t UIActionRunnerError.rawValue.getter()
{
  return 0;
}

unint64_t sub_21123B6FC()
{
  unint64_t result;

  result = qword_254A9F860;
  if (!qword_254A9F860)
  {
    result = MEMORY[0x212BD7970](&protocol conformance descriptor for UIActionRunnerError, &type metadata for UIActionRunnerError);
    atomic_store(result, (unint64_t *)&qword_254A9F860);
  }
  return result;
}

uint64_t sub_21123B744@<X0>(uint64_t *a1@<X0>, BOOL *a2@<X8>)
{
  return UIActionRunnerError.init(rawValue:)(*a1, a2);
}

void sub_21123B74C(_QWORD *a1@<X8>)
{
  *a1 = 0;
}

uint64_t sub_21123B75C()
{
  sub_21123B900();
  sub_2111C05A8();
  return sub_211244E0C();
}

uint64_t sub_21123B7A4()
{
  return UIActionRunnerError.errorDescription.getter();
}

uint64_t sub_21123B7B8()
{
  sub_21123B8C4();
  return sub_211246A08();
}

uint64_t sub_21123B7E0()
{
  sub_21123B8C4();
  sub_21123B900();
  sub_2111C05A8();
  return sub_2112469F0();
}

uint64_t storeEnumTagSinglePayload for UIActionRunnerError(uint64_t a1, int a2, int a3)
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
    return ((uint64_t (*)(void))((char *)sub_21123B868 + 4 * byte_21125B720[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_21123B888 + 4 * byte_21125B725[v4]))();
}

_BYTE *sub_21123B868(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_21123B888(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_21123B890(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_21123B898(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_21123B8A0(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_21123B8A8(_DWORD *result)
{
  *result = 0;
  return result;
}

ValueMetadata *type metadata accessor for UIActionRunnerError()
{
  return &type metadata for UIActionRunnerError;
}

unint64_t sub_21123B8C4()
{
  unint64_t result;

  result = qword_254A9F868;
  if (!qword_254A9F868)
  {
    result = MEMORY[0x212BD7970](&protocol conformance descriptor for UIActionRunnerError, &type metadata for UIActionRunnerError);
    atomic_store(result, (unint64_t *)&qword_254A9F868);
  }
  return result;
}

unint64_t sub_21123B900()
{
  unint64_t result;

  result = qword_254A9F870;
  if (!qword_254A9F870)
  {
    result = MEMORY[0x212BD7970](&protocol conformance descriptor for UIActionRunnerError, &type metadata for UIActionRunnerError);
    atomic_store(result, (unint64_t *)&qword_254A9F870);
  }
  return result;
}

uint64_t sub_21123B93C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  __swift_instantiateConcreteTypeFromMangledName(&qword_254A97A00);
  OUTLINED_FUNCTION_5();
  MEMORY[0x24BDAC7A8](v1);
  OUTLINED_FUNCTION_14();
  v4 = v3 - v2;
  v5 = sub_211244E60();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  OUTLINED_FUNCTION_2();
  sub_211244E30();
  if (__swift_getEnumTagSinglePayload(v4, 1, v5) == 1)
  {
    sub_2111C7E2C(v4, &qword_254A97A00);
    return 0;
  }
  else
  {
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v6 + 32))(v0, v4, v5);
    sub_211244E48();
    v7 = sub_211244E54();
    OUTLINED_FUNCTION_41(v0, *(uint64_t (**)(uint64_t, uint64_t))(v6 + 8));
  }
  return v7;
}

uint64_t sub_21123BA44(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
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
  unint64_t v24;
  uint64_t v25;
  void (*v26)(uint64_t, unint64_t, uint64_t);
  uint64_t v27;
  char v29;
  uint64_t v30;
  uint64_t v32;
  uint64_t v33;

  v5 = sub_211244DF4();
  v33 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  OUTLINED_FUNCTION_14();
  v8 = v7 - v6;
  __swift_instantiateConcreteTypeFromMangledName(&qword_254A979F8);
  OUTLINED_FUNCTION_5();
  MEMORY[0x24BDAC7A8](v9);
  OUTLINED_FUNCTION_2();
  __swift_instantiateConcreteTypeFromMangledName(&qword_254A97A00);
  OUTLINED_FUNCTION_5();
  MEMORY[0x24BDAC7A8](v10);
  OUTLINED_FUNCTION_14();
  v13 = v12 - v11;
  v14 = sub_211244E60();
  v15 = *(_QWORD *)(v14 - 8);
  MEMORY[0x24BDAC7A8](v14);
  OUTLINED_FUNCTION_14();
  v18 = v17 - v16;
  sub_211244E30();
  if (__swift_getEnumTagSinglePayload(v13, 1, v14) == 1)
  {
    v19 = &qword_254A97A00;
    v20 = v13;
LABEL_19:
    sub_2111C7E2C(v20, v19);
    return 0;
  }
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v15 + 32))(v18, v13, v14);
  v21 = sub_211244E18();
  v22 = v21;
  if (v21)
  {
    v23 = *(_QWORD *)(v21 + 16);
    if (v23)
    {
      v32 = v2;
      v24 = v21 + ((*(unsigned __int8 *)(v33 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v33 + 80));
      v25 = *(_QWORD *)(v33 + 72);
      v26 = *(void (**)(uint64_t, unint64_t, uint64_t))(v33 + 16);
      swift_bridgeObjectRetain();
      while (1)
      {
        v26(v8, v24, v5);
        if (sub_211244DDC() == a1 && v27 == a2)
          break;
        v29 = sub_2112469C0();
        OUTLINED_FUNCTION_23();
        if ((v29 & 1) != 0)
          goto LABEL_16;
        OUTLINED_FUNCTION_41(v8, *(uint64_t (**)(uint64_t, uint64_t))(v33 + 8));
        v24 += v25;
        if (!--v23)
        {
          OUTLINED_FUNCTION_23();
          v30 = 1;
          v2 = v32;
          goto LABEL_17;
        }
      }
      OUTLINED_FUNCTION_23();
LABEL_16:
      swift_bridgeObjectRelease();
      v2 = v32;
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v33 + 32))(v32, v8, v5);
      v30 = 0;
    }
    else
    {
      v30 = 1;
    }
LABEL_17:
    __swift_storeEnumTagSinglePayload(v2, v30, 1, v5);
    OUTLINED_FUNCTION_23();
    if (__swift_getEnumTagSinglePayload(v2, 1, v5) != 1)
    {
      v22 = sub_211244DE8();
      OUTLINED_FUNCTION_0_37();
      OUTLINED_FUNCTION_41(v2, *(uint64_t (**)(uint64_t, uint64_t))(v33 + 8));
      return v22;
    }
    OUTLINED_FUNCTION_0_37();
    v19 = &qword_254A979F8;
    v20 = v2;
    goto LABEL_19;
  }
  OUTLINED_FUNCTION_0_37();
  return v22;
}

uint64_t OUTLINED_FUNCTION_0_37()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(v1 + 8))(v2, v0);
}

uint64_t sub_21123BD1C(uint64_t a1, uint64_t a2)
{
  _QWORD *v3;

  __swift_instantiateConcreteTypeFromMangledName(&qword_254A9EEB0);
  swift_allocError();
  *v3 = a2;
  return swift_continuation_throwingResumeWithError();
}

uint64_t sub_21123BD6C(uint64_t a1, char a2)
{
  **(_BYTE **)(*(_QWORD *)(a1 + 64) + 40) = a2;
  return swift_continuation_throwingResume();
}

uint64_t sub_21123BD7C(uint64_t a1, uint64_t a2)
{
  **(_QWORD **)(*(_QWORD *)(a1 + 64) + 40) = a2;
  return swift_continuation_throwingResume();
}

uint64_t sub_21123BD8C(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t v3;

  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 40);
  *(_QWORD *)v3 = a2;
  *(_BYTE *)(v3 + 8) = a3;
  return swift_continuation_throwingResume();
}

id sub_21123BDA0(uint64_t a1)
{
  id v2;
  void *v3;
  id v4;
  uint64_t v5;

  v2 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  v3 = (void *)sub_211244F98();
  v4 = objc_msgSend(v2, sel_initWithURL_, v3);

  v5 = sub_211244FE0();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(a1, v5);
  return v4;
}

uint64_t sub_21123BE1C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v5[47] = a4;
  v5[48] = a5;
  v5[45] = a2;
  v5[46] = a3;
  v5[44] = a1;
  v6 = sub_211244D70();
  v5[49] = v6;
  v5[50] = *(_QWORD *)(v6 - 8);
  v5[51] = OUTLINED_FUNCTION_1_24();
  v7 = sub_211245058();
  v5[52] = v7;
  v5[53] = *(_QWORD *)(v7 - 8);
  v5[54] = OUTLINED_FUNCTION_40_5();
  v5[55] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_253D2B140);
  v5[56] = OUTLINED_FUNCTION_1_24();
  v8 = sub_211244FE0();
  v5[57] = v8;
  v5[58] = *(_QWORD *)(v8 - 8);
  v5[59] = OUTLINED_FUNCTION_40_5();
  v5[60] = swift_task_alloc();
  OUTLINED_FUNCTION_13_11();
  return OUTLINED_FUNCTION_5_11();
}

uint64_t sub_21123BED4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t (*v4)(void);
  id v6;
  uint64_t v7;
  _QWORD *v8;

  if ((objc_msgSend((id)objc_opt_self(), sel_reviewComposerDemoMode) & 1) != 0)
  {
    swift_task_dealloc();
    OUTLINED_FUNCTION_23_11();
    OUTLINED_FUNCTION_48_2();
    OUTLINED_FUNCTION_36_0();
    OUTLINED_FUNCTION_26_1();
    OUTLINED_FUNCTION_10_17();
    OUTLINED_FUNCTION_13_11();
    return OUTLINED_FUNCTION_1_34(v1, v2, v3, 0, v4);
  }
  else
  {
    if (qword_254A992D0 != -1)
      swift_once();
    v6 = objc_msgSend(*(id *)(v0 + 376), sel_URLForKey_, qword_254A9F878);
    *(_QWORD *)(v0 + 488) = v6;
    *(_QWORD *)(v0 + 56) = v0 + 304;
    *(_QWORD *)(v0 + 16) = v0;
    *(_QWORD *)(v0 + 24) = sub_21123C024;
    v7 = swift_continuation_init();
    *(_QWORD *)(v0 + 248) = MEMORY[0x24BDAC760];
    v8 = (_QWORD *)(v0 + 248);
    v8[1] = 0x40000000;
    v8[2] = sub_21123C924;
    v8[3] = &block_descriptor_19;
    v8[4] = v7;
    objc_msgSend(v6, sel_valueWithCompletion_, v8);
    return swift_continuation_await();
  }
}

uint64_t sub_21123C024()
{
  uint64_t v0;

  OUTLINED_FUNCTION_15_20();
  *(_QWORD *)(v0 + 496) = *(_QWORD *)(v0 + 48);
  OUTLINED_FUNCTION_13_11();
  return OUTLINED_FUNCTION_5_11();
}

uint64_t sub_21123C068()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void (*v7)(uint64_t, uint64_t, uint64_t);
  uint64_t v9;
  id v10;
  id v11;
  uint64_t i;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  id v20;
  id v21;
  id v22;
  void *v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  id v27;
  uint64_t inited;
  void *v29;
  void *v30;
  id v31;
  id v32;
  uint64_t v33;
  _QWORD *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  id v38;

  v1 = *(void **)(v0 + 488);
  v3 = *(_QWORD *)(v0 + 464);
  v2 = *(_QWORD *)(v0 + 472);
  v5 = *(_QWORD *)(v0 + 448);
  v4 = *(_QWORD *)(v0 + 456);
  v6 = *(void **)(v0 + 304);
  sub_211244FA4();

  v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 32);
  v7(v5, v2, v4);
  __swift_storeEnumTagSinglePayload(v5, 0, 1, v4);

  if (__swift_getEnumTagSinglePayload(v5, 1, v4) == 1)
  {
    sub_2111E9B1C(*(_QWORD *)(v0 + 448));
    sub_2112467D4();
    OUTLINED_FUNCTION_3_27(0);
    sub_211246438();
    OUTLINED_FUNCTION_16_15(qword_254A9F878);
    sub_211246888();
    OUTLINED_FUNCTION_4_30();
    OUTLINED_FUNCTION_21_17();
    OUTLINED_FUNCTION_19_14();
    (id)OUTLINED_FUNCTION_10_23();

    OUTLINED_FUNCTION_18_14();
    OUTLINED_FUNCTION_1_35();
    OUTLINED_FUNCTION_48_2();
    OUTLINED_FUNCTION_36_0();
    OUTLINED_FUNCTION_26_1();
    OUTLINED_FUNCTION_10_17();
    OUTLINED_FUNCTION_12_16();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
  else
  {
    v9 = *(_QWORD *)(v0 + 384);
    v7(*(_QWORD *)(v0 + 480), *(_QWORD *)(v0 + 448), *(_QWORD *)(v0 + 456));
    v10 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BE08410]), sel_init);
    *(_QWORD *)(v0 + 504) = v10;
    v38 = v10;
    objc_msgSend(v10, sel_setDelegate_, v9);
    v11 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BE08400]), sel_init);
    *(_QWORD *)(v0 + 512) = v11;
    sub_21123C9F0();
    sub_211246774();
    for (i = 200; i != 300; ++i)
    {
      *(_QWORD *)(v0 + 320) = i;
      sub_211246768();
    }
    v13 = *(_QWORD *)(v0 + 472);
    v15 = *(_QWORD *)(v0 + 456);
    v14 = *(_QWORD *)(v0 + 464);
    v16 = *(_QWORD *)(v0 + 440);
    v18 = *(_QWORD *)(v0 + 416);
    v17 = *(_QWORD *)(v0 + 424);
    v35 = *(_QWORD *)(v0 + 480);
    v36 = *(_QWORD *)(v0 + 376);
    v37 = *(_QWORD *)(v0 + 368);
    (*(void (**)(uint64_t, _QWORD, uint64_t))(v17 + 32))(v16, *(_QWORD *)(v0 + 432), v18);
    sub_21124504C();
    sub_21124504C();
    v19 = (void *)sub_211245040();
    (*(void (**)(uint64_t, uint64_t))(v17 + 8))(v16, v18);
    objc_msgSend(v11, sel_setAllowedStatusCodes_, v19);

    objc_msgSend(v38, sel_setResponseDecoder_, v11);
    sub_21123CA30();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v14 + 16))(v13, v35, v15);
    v20 = sub_21123BDA0(v13);
    sub_211244D58();

    sub_211244D40();
    v21 = objc_msgSend((id)objc_opt_self(), sel_ams_sharedAccountStoreForMediaType_, *MEMORY[0x24BE07CB0]);
    *(_QWORD *)(v0 + 520) = v21;
    v22 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BE083F8]), sel_initWithBag_, v36);
    *(_QWORD *)(v0 + 528) = v22;
    v23 = *(void **)(v0 + 368);
    if (v37)
      v24 = *(id *)(v0 + 368);
    else
      v24 = objc_msgSend(v21, sel_ams_activeiTunesAccount);
    v26 = *(_QWORD *)(v0 + 352);
    v25 = *(_QWORD *)(v0 + 360);
    v27 = v23;
    objc_msgSend(v22, sel_setAccount_, v24);

    objc_msgSend(v22, sel_setRequestEncoding_, 3);
    __swift_instantiateConcreteTypeFromMangledName(&qword_254A97A18);
    inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_2112548D0;
    *(_QWORD *)(inited + 32) = 0x656D616E6B63696ELL;
    *(_QWORD *)(inited + 40) = 0xE800000000000000;
    *(_QWORD *)(inited + 48) = v26;
    *(_QWORD *)(inited + 56) = v25;
    swift_bridgeObjectRetain();
    OUTLINED_FUNCTION_20_14();
    sub_211246330();
    v29 = (void *)sub_211244D4C();
    OUTLINED_FUNCTION_20_14();
    v30 = (void *)sub_211246300();
    swift_bridgeObjectRelease();
    v31 = objc_msgSend(v22, sel_requestByEncodingRequest_parameters_, v29, v30);
    *(_QWORD *)(v0 + 536) = v31;

    v32 = objc_msgSend(v38, sel_dataTaskPromiseWithRequestPromise_, v31);
    *(_QWORD *)(v0 + 544) = v32;
    *(_QWORD *)(v0 + 120) = v0 + 328;
    *(_QWORD *)(v0 + 80) = v0;
    *(_QWORD *)(v0 + 88) = sub_21123C55C;
    v33 = swift_continuation_init();
    *(_QWORD *)(v0 + 208) = MEMORY[0x24BDAC760];
    v34 = (_QWORD *)(v0 + 208);
    v34[1] = 0x40000000;
    v34[2] = sub_21123C974;
    v34[3] = &block_descriptor_2;
    v34[4] = v33;
    objc_msgSend(v32, sel_resultWithCompletion_, v34);
    return swift_continuation_await();
  }
}

uint64_t sub_21123C55C()
{
  uint64_t v0;

  OUTLINED_FUNCTION_15_20();
  *(_QWORD *)(v0 + 552) = *(_QWORD *)(v0 + 112);
  OUTLINED_FUNCTION_13_11();
  return OUTLINED_FUNCTION_5_11();
}

uint64_t sub_21123C5A0()
{
  uint64_t v0;
  void *v1;
  id v2;
  uint64_t v3;
  unint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
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
  void *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;

  v1 = *(void **)(v0 + 328);

  v2 = objc_msgSend(v1, sel_data);
  v3 = sub_211245004();
  v5 = v4;

  v6 = sub_21123CB64();
  v38 = v7;
  v41 = v6;
  v32 = v9;
  v35 = v8;
  v10 = *(void **)(v0 + 536);
  v11 = *(void **)(v0 + 528);
  v12 = *(void **)(v0 + 504);
  v46 = *(void **)(v0 + 512);
  v47 = *(_QWORD *)(v0 + 464);
  v48 = *(_QWORD *)(v0 + 456);
  v49 = *(_QWORD *)(v0 + 480);
  v44 = *(_QWORD *)(v0 + 408);

  sub_2111D0594(v3, v5);
  v21 = OUTLINED_FUNCTION_13_19(v13, v14, v15, v16, v17, v18, v19, v20, v30, v32, v35, v38, v41, v44);
  OUTLINED_FUNCTION_12_22(v21, v22, v23, v24, v25, v26, v27, v28, v31, v33, v36, v39, v42, v45, (uint64_t)v46, v47, v48, v49);
  swift_task_dealloc();
  OUTLINED_FUNCTION_23_11();
  OUTLINED_FUNCTION_48_2();
  OUTLINED_FUNCTION_36_0();
  OUTLINED_FUNCTION_26_1();
  OUTLINED_FUNCTION_12_16();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v0 + 8))(v43, v40, v37, v34);
}

uint64_t sub_21123C744()
{
  uint64_t v0;
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;

  v2 = *(void **)(v0 + 488);
  v1 = *(void **)(v0 + 496);
  v4 = *(_QWORD *)(v0 + 448);
  v3 = *(_QWORD *)(v0 + 456);
  OUTLINED_FUNCTION_18_14();

  __swift_storeEnumTagSinglePayload(v4, 1, 1, v3);
  sub_2111E9B1C(*(_QWORD *)(v0 + 448));
  sub_2112467D4();
  OUTLINED_FUNCTION_3_27(0);
  sub_211246438();
  OUTLINED_FUNCTION_16_15(qword_254A9F878);
  sub_211246888();
  OUTLINED_FUNCTION_4_30();
  OUTLINED_FUNCTION_21_17();
  OUTLINED_FUNCTION_19_14();
  (id)OUTLINED_FUNCTION_10_23();

  OUTLINED_FUNCTION_18_14();
  OUTLINED_FUNCTION_1_35();
  OUTLINED_FUNCTION_48_2();
  OUTLINED_FUNCTION_36_0();
  OUTLINED_FUNCTION_26_1();
  OUTLINED_FUNCTION_10_17();
  OUTLINED_FUNCTION_12_16();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_21123C84C()
{
  uint64_t v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;

  v1 = *(void **)(v0 + 536);
  v2 = *(void **)(v0 + 528);
  v3 = *(void **)(v0 + 520);
  v4 = *(void **)(v0 + 504);
  v5 = *(void **)(v0 + 512);
  v12 = *(_QWORD *)(v0 + 480);
  v13 = *(void **)(v0 + 544);
  v10 = *(_QWORD *)(v0 + 464);
  v11 = *(_QWORD *)(v0 + 456);
  v6 = *(_QWORD *)(v0 + 400);
  v7 = *(_QWORD *)(v0 + 408);
  v8 = *(_QWORD *)(v0 + 392);
  swift_willThrow();

  (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v7, v8);
  (*(void (**)(uint64_t, uint64_t))(v10 + 8))(v12, v11);

  OUTLINED_FUNCTION_1_35();
  OUTLINED_FUNCTION_48_2();
  OUTLINED_FUNCTION_36_0();
  OUTLINED_FUNCTION_26_1();
  OUTLINED_FUNCTION_10_17();
  OUTLINED_FUNCTION_12_16();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_21123C924(uint64_t result, void *a2, char a3, void *a4)
{
  if (a4)
    return OUTLINED_FUNCTION_17_14((uint64_t)a4);
  if (a2)
    return sub_21123BD8C(*(_QWORD *)(result + 32), (uint64_t)a2, a3);
  __break(1u);
  return result;
}

uint64_t sub_21123C974(uint64_t result, void *a2, void *a3)
{
  if (a3)
    return OUTLINED_FUNCTION_17_14((uint64_t)a3);
  if (a2)
    return sub_21123BD7C(*(_QWORD *)(result + 32), (uint64_t)a2);
  __break(1u);
  return result;
}

uint64_t sub_21123C9BC()
{
  uint64_t result;

  result = sub_211246378();
  qword_254A9F878 = result;
  return result;
}

unint64_t sub_21123C9F0()
{
  unint64_t result;
  uint64_t v1;

  result = qword_254A9F888;
  if (!qword_254A9F888)
  {
    v1 = sub_211245058();
    result = MEMORY[0x212BD7970](MEMORY[0x24BDCF468], v1);
    atomic_store(result, (unint64_t *)&qword_254A9F888);
  }
  return result;
}

unint64_t sub_21123CA30()
{
  unint64_t result;

  result = qword_254A9AE80;
  if (!qword_254A9AE80)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_254A9AE80);
  }
  return result;
}

uint64_t OUTLINED_FUNCTION_1_35()
{
  return swift_task_dealloc();
}

uint64_t OUTLINED_FUNCTION_3_27@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v2 + 288) = a1;
  *(_QWORD *)(v2 + 296) = v1;
  return 0x756C617620676142;
}

uint64_t OUTLINED_FUNCTION_4_30()
{
  return sub_211246438();
}

uint64_t OUTLINED_FUNCTION_10_23()
{
  return AMSError();
}

uint64_t OUTLINED_FUNCTION_12_22(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18)
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(a16 + 8))(a18, a17);
}

uint64_t OUTLINED_FUNCTION_13_19(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14)
{
  uint64_t v14;
  uint64_t v15;

  return (*(uint64_t (**)(uint64_t, uint64_t))(v15 + 8))(a14, v14);
}

void OUTLINED_FUNCTION_15_20()
{
  _QWORD *v0;
  uint64_t v1;
  _QWORD *v2;

  v2 = (_QWORD *)(v1 - 8);
  *v2 = *v0;
  *v2 = *v0;
}

void OUTLINED_FUNCTION_16_15(uint64_t a1@<X8>)
{
  uint64_t v1;

  *(_QWORD *)(v1 + 336) = a1;
  type metadata accessor for AMSBagKey(0);
}

uint64_t OUTLINED_FUNCTION_17_14(uint64_t a1)
{
  uint64_t v1;

  return sub_21123BD1C(v1, a1);
}

uint64_t OUTLINED_FUNCTION_18_14()
{
  return swift_willThrow();
}

uint64_t OUTLINED_FUNCTION_19_14()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_20_14()
{
  uint64_t v0;

  return v0;
}

uint64_t OUTLINED_FUNCTION_21_17()
{
  return sub_211246378();
}

uint64_t sub_21123CB64()
{
  void *v0;
  void *v1;
  void *v2;
  uint64_t v4;

  sub_211244D94();
  swift_allocObject();
  sub_211244D88();
  sub_21123CC78();
  sub_211244D7C();
  if (v0)
  {
    v1 = (void *)sub_211246378();
    v2 = (void *)sub_211244F68();
    (id)AMSError();

    swift_willThrow();
    return swift_release();
  }
  else
  {
    swift_release();
    return v4;
  }
}

unint64_t sub_21123CC78()
{
  unint64_t result;

  result = qword_254A9F890;
  if (!qword_254A9F890)
  {
    result = MEMORY[0x212BD7970](&unk_211257230, &type metadata for EditNicknameResponse);
    atomic_store(result, (unint64_t *)&qword_254A9F890);
  }
  return result;
}

uint64_t sub_21123CCB4()
{
  return sub_21123CEE0();
}

void sub_21123CCC0()
{
  uint64_t v0;

  v0 = OUTLINED_FUNCTION_42_2();
  OUTLINED_FUNCTION_9_23(v0);
  OUTLINED_FUNCTION_1_36();
  OUTLINED_FUNCTION_40_4();
}

void sub_21123CCE8()
{
  OUTLINED_FUNCTION_42_2();
  OUTLINED_FUNCTION_8_23();
  OUTLINED_FUNCTION_1_36();
  OUTLINED_FUNCTION_40_4();
}

void sub_21123CD14()
{
  OUTLINED_FUNCTION_42_2();
  OUTLINED_FUNCTION_8_23();
  OUTLINED_FUNCTION_1_36();
  OUTLINED_FUNCTION_40_4();
}

void sub_21123CD40()
{
  OUTLINED_FUNCTION_42_2();
  OUTLINED_FUNCTION_10_24();
  OUTLINED_FUNCTION_1_36();
  OUTLINED_FUNCTION_40_4();
}

void sub_21123CD68()
{
  sub_21123D00C();
}

uint64_t sub_21123CD74()
{
  OUTLINED_FUNCTION_14_24();
  return OUTLINED_FUNCTION_5_27();
}

void sub_21123CDC8()
{
  OUTLINED_FUNCTION_10_24();
  OUTLINED_FUNCTION_11();
}

void sub_21123CDE4(uint64_t a1, char a2)
{
  __asm { BR              X10 }
}

uint64_t sub_21123CE28()
{
  OUTLINED_FUNCTION_14_24();
  return OUTLINED_FUNCTION_5_27();
}

uint64_t sub_21123CE80()
{
  sub_2112463F0();
  return swift_bridgeObjectRelease();
}

uint64_t sub_21123CEE0()
{
  sub_211246A5C();
  sub_2112463F0();
  swift_bridgeObjectRelease();
  return sub_211246A74();
}

void sub_21123CF64()
{
  uint64_t v0;

  v0 = OUTLINED_FUNCTION_4_31();
  OUTLINED_FUNCTION_9_23(v0);
  OUTLINED_FUNCTION_1_36();
  OUTLINED_FUNCTION_40_4();
}

void sub_21123CF8C()
{
  OUTLINED_FUNCTION_4_31();
  OUTLINED_FUNCTION_8_23();
  OUTLINED_FUNCTION_1_36();
  OUTLINED_FUNCTION_40_4();
}

void sub_21123CFB8()
{
  OUTLINED_FUNCTION_4_31();
  OUTLINED_FUNCTION_8_23();
  OUTLINED_FUNCTION_1_36();
  OUTLINED_FUNCTION_40_4();
}

void sub_21123CFE4()
{
  OUTLINED_FUNCTION_4_31();
  OUTLINED_FUNCTION_10_24();
  OUTLINED_FUNCTION_1_36();
  OUTLINED_FUNCTION_40_4();
}

void sub_21123D00C()
{
  OUTLINED_FUNCTION_4_31();
  OUTLINED_FUNCTION_14_24();
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_1_36();
  OUTLINED_FUNCTION_40_4();
}

uint64_t sub_21123D078()
{
  uint64_t v0;
  unsigned int v1;

  v0 = sub_211246900();
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

uint64_t sub_21123D0CC(char a1)
{
  if ((a1 & 1) != 0)
    return 0x617461646174656DLL;
  else
    return 0x692D776569766572;
}

void sub_21123D10C(char *a1, char *a2)
{
  sub_2111EBFB8(*a1, *a2);
}

uint64_t sub_21123D118()
{
  return sub_21123CCB4();
}

uint64_t sub_21123D120()
{
  return sub_21123CE80();
}

uint64_t sub_21123D128()
{
  return sub_21123CEE0();
}

uint64_t sub_21123D130@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = sub_21123D078();
  *a1 = result;
  return result;
}

void sub_21123D15C(uint64_t *a1@<X8>)
{
  char *v1;
  uint64_t v3;

  *a1 = sub_21123D0CC(*v1);
  a1[1] = v3;
  OUTLINED_FUNCTION_11();
}

uint64_t sub_21123D180()
{
  char *v0;

  return sub_21123D0CC(*v0);
}

uint64_t sub_21123D188@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = sub_21123D0C8();
  *a1 = result;
  return result;
}

uint64_t sub_21123D1AC()
{
  sub_21123D36C();
  return sub_211246A98();
}

uint64_t sub_21123D1D4()
{
  sub_21123D36C();
  return sub_211246AA4();
}

void UserReview.encode(to:)(_QWORD *a1)
{
  uint64_t *v1;
  uint64_t v2;
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
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char v21;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_254A9F898);
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = *v1;
  v8 = v1[1];
  v14 = v1[2];
  v15 = v8;
  v10 = v1[3];
  v12 = v1[4];
  v13 = v10;
  v11 = v1[5];
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_21123D36C();
  sub_211246A8C();
  v16 = v9;
  v21 = 0;
  type metadata accessor for ReviewData();
  sub_2112387DC(&qword_254A9F520, (uint64_t)&protocol conformance descriptor for ReviewData);
  OUTLINED_FUNCTION_11_20();
  if (!v2)
  {
    v16 = v15;
    v17 = v14;
    v18 = v13;
    v19 = v12;
    v20 = v11;
    v21 = 1;
    sub_21123D3A8();
    OUTLINED_FUNCTION_11_20();
  }
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  OUTLINED_FUNCTION_2_13();
}

unint64_t sub_21123D36C()
{
  unint64_t result;

  result = qword_254A9F8A0;
  if (!qword_254A9F8A0)
  {
    result = MEMORY[0x212BD7970](&unk_21125BA4C, &type metadata for UserReview.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_254A9F8A0);
  }
  return result;
}

unint64_t sub_21123D3A8()
{
  unint64_t result;

  result = qword_254A9F8A8;
  if (!qword_254A9F8A8)
  {
    result = MEMORY[0x212BD7970](&unk_21125AD1C, &type metadata for ReviewMetadata);
    atomic_store(result, (unint64_t *)&qword_254A9F8A8);
  }
  return result;
}

void UserReview.init(from:)(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;
  id v6;
  __int128 v7;
  __int128 v8;
  uint64_t v9;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_254A9F8B0);
  MEMORY[0x24BDAC7A8](v5);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_21123D36C();
  sub_211246A80();
  if (v2)
  {
    OUTLINED_FUNCTION_2_34();
  }
  else
  {
    type metadata accessor for ReviewData();
    sub_2112387DC(&qword_254A9F508, (uint64_t)&protocol conformance descriptor for ReviewData);
    OUTLINED_FUNCTION_13_20();
    sub_21123D578();
    v6 = (id)v7;
    OUTLINED_FUNCTION_13_20();
    OUTLINED_FUNCTION_6_26();
    *(_QWORD *)a2 = v6;
    *(_OWORD *)(a2 + 8) = v7;
    *(_OWORD *)(a2 + 24) = v8;
    *(_QWORD *)(a2 + 40) = v9;
    swift_bridgeObjectRetain();
    OUTLINED_FUNCTION_2_34();
    swift_bridgeObjectRelease();

  }
  OUTLINED_FUNCTION_2_13();
}

unint64_t sub_21123D578()
{
  unint64_t result;

  result = qword_254A9F8B8;
  if (!qword_254A9F8B8)
  {
    result = MEMORY[0x212BD7970](&unk_21125ACF4, &type metadata for ReviewMetadata);
    atomic_store(result, (unint64_t *)&qword_254A9F8B8);
  }
  return result;
}

void sub_21123D5B4(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  UserReview.init(from:)(a1, a2);
}

void sub_21123D5C8(_QWORD *a1)
{
  UserReview.encode(to:)(a1);
}

uint64_t destroy for UserReview(id *a1)
{

  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for UserReview(uint64_t a1, uint64_t a2)
{
  void *v3;
  id v4;

  v3 = *(void **)a2;
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  v4 = v3;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for UserReview(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  id v6;

  v4 = *(void **)a2;
  v5 = *(void **)a1;
  *(_QWORD *)a1 = *(_QWORD *)a2;
  v6 = v4;

  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t assignWithTake for UserReview(uint64_t a1, uint64_t a2)
{
  void *v4;

  v4 = *(void **)a1;
  *(_QWORD *)a1 = *(_QWORD *)a2;

  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  swift_bridgeObjectRelease();
  return a1;
}

ValueMetadata *type metadata accessor for UserReview()
{
  return &type metadata for UserReview;
}

uint64_t storeEnumTagSinglePayload for UserReview.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_21123D778 + 4 * byte_21125B8E9[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_21123D7AC + 4 * byte_21125B8E4[v4]))();
}

uint64_t sub_21123D7AC(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_21123D7B4(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x21123D7BCLL);
  return result;
}

uint64_t sub_21123D7C8(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x21123D7D0);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_21123D7D4(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_21123D7DC(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for UserReview.CodingKeys()
{
  return &type metadata for UserReview.CodingKeys;
}

unint64_t sub_21123D7FC()
{
  unint64_t result;

  result = qword_254A9F8C0;
  if (!qword_254A9F8C0)
  {
    result = MEMORY[0x212BD7970](&unk_21125BA24, &type metadata for UserReview.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_254A9F8C0);
  }
  return result;
}

unint64_t sub_21123D83C()
{
  unint64_t result;

  result = qword_254A9F8C8;
  if (!qword_254A9F8C8)
  {
    result = MEMORY[0x212BD7970](&unk_21125B95C, &type metadata for UserReview.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_254A9F8C8);
  }
  return result;
}

unint64_t sub_21123D87C()
{
  unint64_t result;

  result = qword_254A9F8D0;
  if (!qword_254A9F8D0)
  {
    result = MEMORY[0x212BD7970](&unk_21125B984, &type metadata for UserReview.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_254A9F8D0);
  }
  return result;
}

uint64_t OUTLINED_FUNCTION_1_36()
{
  return sub_211246A74();
}

uint64_t OUTLINED_FUNCTION_4_31()
{
  return sub_211246A5C();
}

uint64_t OUTLINED_FUNCTION_5_27()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_6_26()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 8))(v1, v0);
}

uint64_t OUTLINED_FUNCTION_8_23()
{
  return sub_211246A68();
}

void OUTLINED_FUNCTION_9_23(uint64_t a1, ...)
{
  char v1;
  va_list va;

  va_start(va, a1);
  sub_21123CDE4((uint64_t)va, v1);
}

uint64_t OUTLINED_FUNCTION_10_24()
{
  return sub_211246A68();
}

uint64_t OUTLINED_FUNCTION_11_20()
{
  return sub_211246990();
}

uint64_t OUTLINED_FUNCTION_13_20()
{
  return sub_211246948();
}

uint64_t OUTLINED_FUNCTION_14_24()
{
  return sub_2112463F0();
}

uint64_t sub_21123D91C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;

  v4[36] = a3;
  v4[37] = a4;
  v4[34] = a1;
  v4[35] = a2;
  v5 = sub_211244D70();
  v4[38] = v5;
  v4[39] = *(_QWORD *)(v5 - 8);
  v4[40] = OUTLINED_FUNCTION_1_24();
  __swift_instantiateConcreteTypeFromMangledName(&qword_253D2B140);
  v4[41] = OUTLINED_FUNCTION_1_24();
  v6 = sub_211244FE0();
  v4[42] = v6;
  v4[43] = *(_QWORD *)(v6 - 8);
  v4[44] = swift_task_alloc();
  v4[45] = swift_task_alloc();
  OUTLINED_FUNCTION_13_11();
  return OUTLINED_FUNCTION_5_11();
}

uint64_t sub_21123D9B8()
{
  uint64_t v0;
  uint64_t v1;
  id v2;
  id v4;
  uint64_t v5;
  _QWORD *v6;

  if ((objc_msgSend((id)objc_opt_self(), sel_reviewComposerDemoMode) & 1) != 0)
  {
    v1 = *(_QWORD *)(v0 + 272);
    v2 = objc_allocWithZone((Class)type metadata accessor for ReviewData());
    *(_QWORD *)v1 = sub_211225900(0, 0xE000000000000000, 0, 0xE000000000000000, 0, 0xE000000000000000, 0.0);
    *(int64x2_t *)(v1 + 8) = vdupq_n_s64(0x64uLL);
    *(_OWORD *)(v1 + 24) = xmmword_21125BAA0;
    *(_QWORD *)(v1 + 40) = 0xE000000000000000;
    swift_task_dealloc();
    swift_task_dealloc();
    OUTLINED_FUNCTION_48_2();
    OUTLINED_FUNCTION_36_0();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
  else
  {
    if (qword_254A992D8 != -1)
      swift_once();
    v4 = objc_msgSend(*(id *)(v0 + 288), sel_URLForKey_, qword_254A9F8D8);
    *(_QWORD *)(v0 + 368) = v4;
    *(_QWORD *)(v0 + 56) = v0 + 240;
    *(_QWORD *)(v0 + 16) = v0;
    *(_QWORD *)(v0 + 24) = sub_21123DB48;
    v5 = OUTLINED_FUNCTION_20_15();
    *(_QWORD *)(v0 + 184) = MEMORY[0x24BDAC760];
    v6 = (_QWORD *)(v0 + 184);
    v6[1] = 0x40000000;
    v6[2] = sub_21123C924;
    v6[3] = &block_descriptor_4;
    v6[4] = v5;
    objc_msgSend(v4, sel_valueWithCompletion_, v6);
    return swift_continuation_await();
  }
}

uint64_t sub_21123DB48()
{
  uint64_t v0;
  uint64_t v1;

  OUTLINED_FUNCTION_8_24();
  *(_QWORD *)(v0 + 376) = v1;
  OUTLINED_FUNCTION_13_11();
  return OUTLINED_FUNCTION_5_11();
}

uint64_t sub_21123DB88()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void (*v8)(uint64_t, uint64_t);
  uint64_t v9;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  id v18;
  id v19;
  id v20;
  void *v21;
  id v22;
  uint64_t v23;
  _QWORD *v24;

  v1 = *(void **)(v0 + 368);
  v3 = *(_QWORD *)(v0 + 344);
  v2 = *(_QWORD *)(v0 + 352);
  v5 = *(_QWORD *)(v0 + 328);
  v4 = *(_QWORD *)(v0 + 336);
  v6 = *(_QWORD *)(v0 + 280);
  v7 = *(void **)(v0 + 240);
  *(_QWORD *)(v0 + 384) = v7;

  sub_211244FA4();
  sub_21123E734(*(_QWORD *)(v6 + OBJC_IVAR____TtC20AppleMediaServicesUI13ReviewContext_itemVersion), *(_QWORD *)(v6 + OBJC_IVAR____TtC20AppleMediaServicesUI13ReviewContext_itemVersion + 8), v5);
  v8 = *(void (**)(uint64_t, uint64_t))(v3 + 8);
  *(_QWORD *)(v0 + 392) = v8;
  v8(v2, v4);
  if (__swift_getEnumTagSinglePayload(v5, 1, v4) == 1)
  {
    v9 = *(_QWORD *)(v0 + 328);

    sub_2111E9B1C(v9);
    sub_2112467D4();
    OUTLINED_FUNCTION_1_37(0);
    OUTLINED_FUNCTION_19_15(qword_254A9F8D8);
    OUTLINED_FUNCTION_16_16();
    OUTLINED_FUNCTION_4_30();
    OUTLINED_FUNCTION_13_21();
    OUTLINED_FUNCTION_19_14();
    (id)OUTLINED_FUNCTION_10_23();

    OUTLINED_FUNCTION_18_14();
    OUTLINED_FUNCTION_10_25();
    OUTLINED_FUNCTION_48_2();
    OUTLINED_FUNCTION_36_0();
    OUTLINED_FUNCTION_26_1();
    return OUTLINED_FUNCTION_1_0(*(uint64_t (**)(void))(v0 + 8));
  }
  else
  {
    v12 = *(_QWORD *)(v0 + 352);
    v11 = *(_QWORD *)(v0 + 360);
    v13 = *(_QWORD *)(v0 + 336);
    v14 = *(_QWORD *)(v0 + 344);
    v15 = *(_QWORD *)(v0 + 288);
    v16 = *(_QWORD *)(v0 + 296);
    (*(void (**)(uint64_t, _QWORD, uint64_t))(v14 + 32))(v11, *(_QWORD *)(v0 + 328), v13);
    v17 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BE08410]), sel_init);
    *(_QWORD *)(v0 + 400) = v17;
    objc_msgSend(v17, sel_setDelegate_, v16);
    sub_21123CA30();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v14 + 16))(v12, v11, v13);
    v18 = sub_21123BDA0(v12);
    sub_211244D58();

    *(_QWORD *)(v0 + 408) = objc_msgSend((id)objc_opt_self(), sel_ams_sharedAccountStoreForMediaType_, *MEMORY[0x24BE07CB0]);
    v19 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BE083F8]), sel_initWithBag_, v15);
    *(_QWORD *)(v0 + 416) = v19;
    v20 = OUTLINED_FUNCTION_16_2((uint64_t)v19, sel_ams_activeiTunesAccount);
    objc_msgSend(v19, sel_setAccount_, v20);

    v21 = (void *)sub_211244D4C();
    v22 = OUTLINED_FUNCTION_11_7(v19, sel_requestByEncodingRequest_parameters_);
    *(_QWORD *)(v0 + 424) = v22;

    *(_QWORD *)(v0 + 432) = objc_msgSend(v17, sel_dataTaskPromiseWithRequestPromise_, v22);
    *(_QWORD *)(v0 + 120) = v0 + 256;
    *(_QWORD *)(v0 + 80) = v0;
    *(_QWORD *)(v0 + 88) = sub_21123DEB8;
    v23 = OUTLINED_FUNCTION_20_15();
    *(_QWORD *)(v0 + 144) = MEMORY[0x24BDAC760];
    v24 = (_QWORD *)(v0 + 144);
    v24[1] = 0x40000000;
    v24[2] = sub_21123C974;
    v24[3] = &block_descriptor_5;
    v24[4] = v23;
    OUTLINED_FUNCTION_14_10(v23, sel_resultWithCompletion_);
    return swift_continuation_await();
  }
}

uint64_t sub_21123DEB8()
{
  uint64_t v0;

  *(_QWORD *)(*(_QWORD *)v0 + 440) = *(_QWORD *)(*(_QWORD *)v0 + 112);
  OUTLINED_FUNCTION_13_11();
  return OUTLINED_FUNCTION_5_11();
}

uint64_t sub_21123DF0C()
{
  uint64_t v0;
  _QWORD *v1;
  void *v2;
  uint64_t v3;
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void (*v19)(uint64_t, uint64_t);

  v1 = *(_QWORD **)(v0 + 272);
  v2 = *(void **)(v0 + 256);

  v4 = OUTLINED_FUNCTION_16_2(v3, sel_data);
  v5 = sub_211245004();
  v7 = v6;

  sub_21123EA5C(v7, v1);
  v8 = *(void **)(v0 + 416);
  v9 = *(void **)(v0 + 424);
  v11 = *(void **)(v0 + 400);
  v10 = *(void **)(v0 + 408);
  v18 = *(_QWORD *)(v0 + 360);
  v19 = *(void (**)(uint64_t, uint64_t))(v0 + 392);
  v17 = *(_QWORD *)(v0 + 336);
  v12 = *(_QWORD *)(v0 + 312);
  v15 = *(void **)(v0 + 384);
  v16 = *(_QWORD *)(v0 + 320);
  v14 = *(_QWORD *)(v0 + 304);
  sub_2111D0594(v5, (unint64_t)v7);

  (*(void (**)(uint64_t, uint64_t))(v12 + 8))(v16, v14);
  v19(v18, v17);
  swift_task_dealloc();
  OUTLINED_FUNCTION_36_0();
  OUTLINED_FUNCTION_48_2();
  OUTLINED_FUNCTION_26_1();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_21123E040()
{
  uint64_t v0;
  void *v1;
  void *v2;

  v2 = *(void **)(v0 + 368);
  v1 = *(void **)(v0 + 376);
  OUTLINED_FUNCTION_18_14();

  sub_2112467D4();
  OUTLINED_FUNCTION_1_37(0);
  OUTLINED_FUNCTION_19_15(qword_254A9F8D8);
  OUTLINED_FUNCTION_16_16();
  OUTLINED_FUNCTION_4_30();
  OUTLINED_FUNCTION_13_21();
  OUTLINED_FUNCTION_19_14();
  (id)OUTLINED_FUNCTION_10_23();

  OUTLINED_FUNCTION_18_14();
  OUTLINED_FUNCTION_10_25();
  OUTLINED_FUNCTION_48_2();
  OUTLINED_FUNCTION_36_0();
  OUTLINED_FUNCTION_26_1();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_21123E104()
{
  uint64_t v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t, uint64_t);
  void *v13;

  v2 = *(void **)(v0 + 416);
  v1 = *(void **)(v0 + 424);
  v3 = *(void **)(v0 + 400);
  v4 = *(void **)(v0 + 408);
  v5 = *(void **)(v0 + 384);
  v12 = *(void (**)(uint64_t, uint64_t))(v0 + 392);
  v13 = *(void **)(v0 + 432);
  v10 = *(_QWORD *)(v0 + 336);
  v11 = *(_QWORD *)(v0 + 360);
  v6 = *(_QWORD *)(v0 + 312);
  v7 = *(_QWORD *)(v0 + 320);
  v8 = *(_QWORD *)(v0 + 304);
  swift_willThrow();

  (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v7, v8);
  v12(v11, v10);

  OUTLINED_FUNCTION_10_25();
  OUTLINED_FUNCTION_48_2();
  OUTLINED_FUNCTION_36_0();
  OUTLINED_FUNCTION_26_1();
  return OUTLINED_FUNCTION_1_0(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_21123E1AC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _QWORD *v5;
  uint64_t v6;

  v5[19] = a4;
  v5[20] = a5;
  v5[17] = a2;
  v5[18] = a3;
  v5[16] = a1;
  v6 = sub_211244D70();
  v5[21] = v6;
  v5[22] = *(_QWORD *)(v6 - 8);
  v5[23] = OUTLINED_FUNCTION_1_24();
  OUTLINED_FUNCTION_13_11();
  return OUTLINED_FUNCTION_5_11();
}

uint64_t sub_21123E1FC()
{
  _QWORD *v0;
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  uint64_t v14;
  _QWORD *v15;

  if ((objc_msgSend((id)objc_opt_self(), sel_reviewComposerDemoMode) & 1) != 0)
  {
    OUTLINED_FUNCTION_15_21();
    OUTLINED_FUNCTION_13_11();
    OUTLINED_FUNCTION_14_25();
    __asm { BR              X3 }
  }
  v2 = sub_21123EB48(v0[16]);
  v0[24] = 0;
  v3 = v0[19];
  v4 = v0[20];
  v5 = v0[18];
  sub_211244D58();

  v6 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BE08410]), sel_init);
  v0[25] = v6;
  objc_msgSend(v6, sel_setDelegate_, v4);
  v7 = objc_msgSend((id)objc_opt_self(), sel_ams_sharedAccountStoreForMediaType_, *MEMORY[0x24BE07CB0]);
  v0[26] = v7;
  v8 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BE083F8]), sel_initWithBag_, v3);
  v0[27] = v8;
  v9 = (void *)v0[18];
  if (v5)
    v10 = (id)v0[18];
  else
    v10 = objc_msgSend(v7, sel_ams_activeiTunesAccount);
  v11 = v9;
  objc_msgSend(v8, sel_setAccount_, v10);

  v12 = (void *)sub_211244D4C();
  v13 = OUTLINED_FUNCTION_11_7(v8, sel_requestByEncodingRequest_parameters_);
  v0[28] = v13;

  v0[29] = objc_msgSend(v6, sel_dataTaskPromiseWithRequestPromise_, v13);
  v0[7] = v0 + 15;
  v0[2] = v0;
  v0[3] = sub_21123E44C;
  v14 = OUTLINED_FUNCTION_20_15();
  v0[10] = MEMORY[0x24BDAC760];
  v15 = v0 + 10;
  v15[1] = 0x40000000;
  v15[2] = sub_21123C974;
  v15[3] = &block_descriptor_20;
  v15[4] = v14;
  OUTLINED_FUNCTION_14_10(v14, sel_resultWithCompletion_);
  OUTLINED_FUNCTION_14_25();
  return swift_continuation_await();
}

uint64_t sub_21123E44C()
{
  uint64_t v0;
  uint64_t v1;

  OUTLINED_FUNCTION_8_24();
  *(_QWORD *)(v0 + 240) = v1;
  OUTLINED_FUNCTION_13_11();
  return OUTLINED_FUNCTION_5_11();
}

uint64_t sub_21123E48C()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  uint64_t v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;

  v1 = *(_QWORD *)(v0 + 192);
  v2 = *(void **)(v0 + 120);

  v4 = OUTLINED_FUNCTION_16_2(v3, sel_data);
  v5 = (void *)sub_211245004();
  v7 = v6;

  v9 = sub_21123F07C(v5, v7);
  v11 = v10;
  v12 = *(void **)(v0 + 216);
  v13 = *(void **)(v0 + 224);
  v14 = *(void **)(v0 + 200);
  v15 = *(void **)(v0 + 208);
  v17 = *(_QWORD *)(v0 + 176);
  v16 = *(_QWORD *)(v0 + 184);
  v18 = *(_QWORD *)(v0 + 168);
  if (v1)
  {
    (*(void (**)(uint64_t, uint64_t))(v17 + 8))(v16, v18);
    OUTLINED_FUNCTION_22_18();

    OUTLINED_FUNCTION_15_21();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
  else
  {
    v20 = v8;
    v21 = v9;
    v22 = v11;
    (*(void (**)(uint64_t, uint64_t))(v17 + 8))(v16, v18);
    OUTLINED_FUNCTION_22_18();

    OUTLINED_FUNCTION_15_21();
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v0 + 8))(v21, v22, v20);
  }
}

uint64_t sub_21123E5C0()
{
  uint64_t v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v1 = *(void **)(v0 + 232);
  v3 = *(void **)(v0 + 216);
  v2 = *(void **)(v0 + 224);
  v5 = *(void **)(v0 + 200);
  v4 = *(void **)(v0 + 208);
  v7 = *(_QWORD *)(v0 + 176);
  v6 = *(_QWORD *)(v0 + 184);
  v8 = *(_QWORD *)(v0 + 168);
  swift_willThrow();

  (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v6, v8);
  OUTLINED_FUNCTION_15_21();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_21123E64C()
{
  uint64_t result;

  result = sub_211246378();
  qword_254A9F8D8 = result;
  return result;
}

uint64_t OUTLINED_FUNCTION_1_37@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v2 + 224) = a1;
  *(_QWORD *)(v2 + 232) = v1;
  return sub_211246438();
}

void OUTLINED_FUNCTION_8_24()
{
  _QWORD *v0;
  uint64_t v1;
  _QWORD *v2;

  v2 = (_QWORD *)(v1 - 8);
  *v2 = *v0;
  *v2 = *v0;
}

uint64_t OUTLINED_FUNCTION_10_25()
{
  return swift_task_dealloc();
}

uint64_t OUTLINED_FUNCTION_13_21()
{
  return sub_211246378();
}

uint64_t OUTLINED_FUNCTION_15_21()
{
  return swift_task_dealloc();
}

uint64_t OUTLINED_FUNCTION_16_16()
{
  return sub_211246888();
}

void OUTLINED_FUNCTION_19_15(uint64_t a1@<X8>)
{
  uint64_t v1;

  *(_QWORD *)(v1 + 264) = a1;
  type metadata accessor for AMSBagKey(0);
}

uint64_t OUTLINED_FUNCTION_20_15()
{
  return swift_continuation_init();
}

uint64_t OUTLINED_FUNCTION_22_18()
{
  unint64_t v0;
  uint64_t v1;

  return sub_2111D0594(v1, v0);
}

uint64_t sub_21123E734@<X0>(uint64_t a1@<X3>, uint64_t a2@<X4>, uint64_t a3@<X8>)
{
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
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  uint64_t v22;
  unint64_t v23;
  void (*v24)(unint64_t, char *, uint64_t);
  uint64_t v25;
  unint64_t v26;
  uint64_t v27;
  unint64_t v28;
  void (*v29)(unint64_t, char *, uint64_t);
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;

  v38 = a1;
  v40 = a3;
  v39 = sub_211244E60();
  v37 = *(_QWORD *)(v39 - 8);
  OUTLINED_FUNCTION_33_0();
  MEMORY[0x24BDAC7A8](v4);
  OUTLINED_FUNCTION_1_7();
  v36 = v5;
  v6 = sub_211244DF4();
  v7 = *(_QWORD *)(v6 - 8);
  v8 = MEMORY[0x24BDAC7A8](v6);
  v10 = (char *)&v35 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = MEMORY[0x24BDAC7A8](v8);
  v13 = (char *)&v35 - v12;
  MEMORY[0x24BDAC7A8](v11);
  v15 = (char *)&v35 - v14;
  __swift_instantiateConcreteTypeFromMangledName(&qword_254A97A00);
  OUTLINED_FUNCTION_33_0();
  MEMORY[0x24BDAC7A8](v16);
  OUTLINED_FUNCTION_14();
  v19 = v18 - v17;
  sub_211244E30();
  sub_211244DD0();
  OUTLINED_FUNCTION_0_38();
  sub_211244DD0();
  if (a2)
  {
    sub_211244DD0();
    __swift_instantiateConcreteTypeFromMangledName(&qword_254A99FC0);
    v20 = *(_QWORD *)(v7 + 72);
    v21 = (*(unsigned __int8 *)(v7 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
    v22 = swift_allocObject();
    *(_OWORD *)(v22 + 16) = xmmword_211255210;
    v23 = v22 + v21;
    v24 = *(void (**)(unint64_t, char *, uint64_t))(v7 + 16);
    v24(v23, v15, v6);
    v24(v23 + v20, v13, v6);
    (*(void (**)(unint64_t, char *, uint64_t))(v7 + 32))(v23 + 2 * v20, v10, v6);
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_254A99FC0);
    v25 = *(_QWORD *)(v7 + 72);
    v26 = (*(unsigned __int8 *)(v7 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
    v27 = swift_allocObject();
    *(_OWORD *)(v27 + 16) = xmmword_211255200;
    v28 = v27 + v26;
    v29 = *(void (**)(unint64_t, char *, uint64_t))(v7 + 16);
    v29(v28, v15, v6);
    v29(v28 + v25, v13, v6);
  }
  v30 = v39;
  if (__swift_getEnumTagSinglePayload(v19, 1, v39))
    swift_bridgeObjectRelease();
  else
    sub_211244E24();
  if (__swift_getEnumTagSinglePayload(v19, 1, v30))
  {
    OUTLINED_FUNCTION_4_32((uint64_t)v13);
    OUTLINED_FUNCTION_4_32((uint64_t)v15);
    v31 = sub_211244FE0();
    __swift_storeEnumTagSinglePayload(v40, 1, 1, v31);
  }
  else
  {
    v33 = v36;
    v32 = v37;
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v37 + 16))(v36, v19, v30);
    sub_211244E3C();
    (*(void (**)(uint64_t, uint64_t))(v32 + 8))(v33, v30);
    OUTLINED_FUNCTION_4_32((uint64_t)v13);
    OUTLINED_FUNCTION_4_32((uint64_t)v15);
  }
  return sub_2111C7E2C(v19, &qword_254A97A00);
}

uint64_t sub_21123EA5C@<X0>(void *a1@<X1>, _QWORD *a2@<X8>)
{
  void *v2;
  uint64_t result;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  uint64_t v9;

  sub_211244D94();
  OUTLINED_FUNCTION_7_27();
  sub_211244D88();
  sub_21123F698();
  OUTLINED_FUNCTION_8_25();
  if (v2)
  {
    OUTLINED_FUNCTION_2_35();
    OUTLINED_FUNCTION_6_27();
    (id)OUTLINED_FUNCTION_1_38();

    swift_willThrow();
    return OUTLINED_FUNCTION_22();
  }
  else
  {
    result = OUTLINED_FUNCTION_22();
    *a2 = v6;
    *(_OWORD *)(a2 + 1) = v7;
    *(_OWORD *)(a2 + 3) = v8;
    a2[5] = v9;
  }
  return result;
}

id sub_21123EB48(uint64_t a1)
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
  char *v16;
  uint64_t v17;
  char *v18;
  id v19;
  unint64_t v20;
  uint64_t v21;
  void (*v22)(unint64_t, uint64_t, uint64_t);
  void (*v23)(char *, uint64_t);
  char *v24;
  id v25;
  void *v26;
  uint64_t inited;
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
  unint64_t v39;
  unint64_t v40;
  void *v41;
  uint64_t v43;
  void (*v44)(char *, uint64_t, uint64_t);
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;

  v48 = a1;
  v51 = sub_2112463CC();
  v50 = *(_QWORD *)(v51 - 8);
  OUTLINED_FUNCTION_33_0();
  MEMORY[0x24BDAC7A8](v1);
  OUTLINED_FUNCTION_1_7();
  v49 = v2;
  v3 = sub_211244DF4();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  OUTLINED_FUNCTION_14();
  v7 = v6 - v5;
  __swift_instantiateConcreteTypeFromMangledName(&qword_253D2B140);
  OUTLINED_FUNCTION_33_0();
  MEMORY[0x24BDAC7A8](v8);
  OUTLINED_FUNCTION_14();
  v11 = v10 - v9;
  v12 = sub_211244FE0();
  v13 = *(_QWORD *)(v12 - 8);
  v14 = MEMORY[0x24BDAC7A8](v12);
  v16 = (char *)&v43 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v14);
  v18 = (char *)&v43 - v17;
  sub_211244FC8();
  if (__swift_getEnumTagSinglePayload(v11, 1, v12) == 1)
  {
    sub_2111C7E2C(v11, &qword_253D2B140);
    v19 = (id)sub_211246378();
    (id)AMSError();

    swift_willThrow();
  }
  else
  {
    v44 = *(void (**)(char *, uint64_t, uint64_t))(v13 + 32);
    v44(v18, v11, v12);
    OUTLINED_FUNCTION_0_38();
    sub_211244DD0();
    __swift_instantiateConcreteTypeFromMangledName(&qword_254A99FC0);
    v20 = (*(unsigned __int8 *)(v4 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
    v21 = swift_allocObject();
    *(_OWORD *)(v21 + 16) = xmmword_2112548D0;
    v45 = v4;
    v22 = *(void (**)(unint64_t, uint64_t, uint64_t))(v4 + 16);
    v46 = v7;
    v47 = v3;
    v22(v21 + v20, v7, v3);
    sub_211244FD4();
    swift_bridgeObjectRelease();
    v23 = *(void (**)(char *, uint64_t))(v13 + 8);
    v24 = v18;
    v23(v18, v12);
    v44(v18, (uint64_t)v16, v12);
    sub_2111C63C4(0, (unint64_t *)&qword_254A9AE80);
    (*(void (**)(char *, char *, uint64_t))(v13 + 16))(v16, v18, v12);
    v25 = sub_21123BDA0((uint64_t)v16);
    v26 = (void *)sub_211246378();
    objc_msgSend(v25, sel_setHTTPMethod_, v26);

    __swift_instantiateConcreteTypeFromMangledName(&qword_254A99C10);
    inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_211255220;
    *(_QWORD *)(inited + 32) = 2036625250;
    *(_QWORD *)(inited + 40) = 0xE400000000000000;
    v28 = v48;
    v29 = *(_QWORD *)(v48 + OBJC_IVAR____TtC20AppleMediaServicesUI10ReviewData_body + 8);
    v30 = MEMORY[0x24BEE0D00];
    *(_QWORD *)(inited + 48) = *(_QWORD *)(v48 + OBJC_IVAR____TtC20AppleMediaServicesUI10ReviewData_body);
    *(_QWORD *)(inited + 56) = v29;
    *(_QWORD *)(inited + 72) = v30;
    *(_QWORD *)(inited + 80) = 0x656C746974;
    *(_QWORD *)(inited + 88) = 0xE500000000000000;
    v31 = *(_QWORD *)(v28 + OBJC_IVAR____TtC20AppleMediaServicesUI10ReviewData_title + 8);
    *(_QWORD *)(inited + 96) = *(_QWORD *)(v28 + OBJC_IVAR____TtC20AppleMediaServicesUI10ReviewData_title);
    *(_QWORD *)(inited + 104) = v31;
    *(_QWORD *)(inited + 120) = v30;
    *(_QWORD *)(inited + 128) = 0x656D616E6B63696ELL;
    *(_QWORD *)(inited + 136) = 0xE800000000000000;
    v32 = *(_QWORD *)(v28 + OBJC_IVAR____TtC20AppleMediaServicesUI10ReviewData_nickname + 8);
    *(_QWORD *)(inited + 144) = *(_QWORD *)(v28 + OBJC_IVAR____TtC20AppleMediaServicesUI10ReviewData_nickname);
    *(_QWORD *)(inited + 152) = v32;
    *(_QWORD *)(inited + 168) = v30;
    *(_QWORD *)(inited + 176) = 0x676E69746172;
    *(_QWORD *)(inited + 184) = 0xE600000000000000;
    v33 = *(_QWORD *)(v28 + OBJC_IVAR____TtC20AppleMediaServicesUI10ReviewData_rating);
    *(_QWORD *)(inited + 216) = MEMORY[0x24BEE13C8];
    *(_QWORD *)(inited + 192) = v33;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v34 = sub_211246330();
    sub_2111C8490(v34);
    v36 = v35;
    swift_bridgeObjectRelease();
    sub_21123F188(v36, 1);
    swift_bridgeObjectRelease();
    v19 = v25;
    v37 = v49;
    sub_2112463C0();
    v38 = sub_2112463A8();
    v40 = v39;
    swift_bridgeObjectRelease();
    (*(void (**)(uint64_t, uint64_t))(v50 + 8))(v37, v51);
    v41 = 0;
    if (v40 >> 60 != 15)
    {
      v41 = (void *)sub_211244FF8();
      sub_2111D0580(v38, v40);
    }
    objc_msgSend(v19, sel_setHTTPBody_, v41);

    (*(void (**)(uint64_t, uint64_t))(v45 + 8))(v46, v47);
    v23(v24, v12);
  }
  return v19;
}

uint64_t sub_21123F07C(void *a1, void *a2)
{
  void *v2;
  uint64_t v6;

  sub_211244D94();
  OUTLINED_FUNCTION_7_27();
  sub_211244D88();
  sub_21123F14C();
  OUTLINED_FUNCTION_8_25();
  if (v2)
  {
    OUTLINED_FUNCTION_2_35();
    OUTLINED_FUNCTION_6_27();
    (id)OUTLINED_FUNCTION_1_38();

    swift_willThrow();
    return OUTLINED_FUNCTION_22();
  }
  else
  {
    OUTLINED_FUNCTION_22();
    return v6;
  }
}

unint64_t sub_21123F14C()
{
  unint64_t result;

  result = qword_254A9F8F0;
  if (!qword_254A9F8F0)
  {
    result = MEMORY[0x212BD7970](&unk_21125B130, &unk_24CB58DD0);
    atomic_store(result, (unint64_t *)&qword_254A9F8F0);
  }
  return result;
}

uint64_t sub_21123F188(uint64_t a1, char a2)
{
  char v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t result;
  int64_t v8;
  unint64_t v9;
  unint64_t v10;
  int64_t v11;
  unint64_t v12;
  int64_t v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  int64_t v20;
  id v22;
  uint64_t v23;
  __int128 v24;
  uint64_t v25;
  _OWORD v26[2];
  __int128 v27;
  __int128 v28;
  _OWORD v29[2];
  uint64_t v30;
  __int128 v31;
  __int128 v32;
  uint64_t v33;
  __int128 v34;
  uint64_t v35;
  unint64_t v36;

  v35 = 0;
  v36 = 0xE000000000000000;
  v3 = 1;
  v4 = 1 << *(_BYTE *)(a1 + 32);
  v5 = -1;
  if (v4 < 64)
    v5 = ~(-1 << v4);
  v6 = v5 & *(_QWORD *)(a1 + 64);
  v20 = (unint64_t)(v4 + 63) >> 6;
  result = swift_bridgeObjectRetain();
  v8 = 0;
LABEL_4:
  if (v6)
  {
LABEL_5:
    v9 = __clz(__rbit64(v6));
    v6 &= v6 - 1;
    v10 = v9 | (v8 << 6);
    goto LABEL_6;
  }
  while (1)
  {
    v11 = v8 + 1;
    if (__OFADD__(v8, 1))
      break;
    if (v11 < v20)
    {
      v12 = *(_QWORD *)(v19 + 8 * v11);
      if (v12)
        goto LABEL_10;
      v13 = v8 + 2;
      ++v8;
      if (v11 + 1 < v20)
      {
        v12 = *(_QWORD *)(v19 + 8 * v13);
        if (v12)
          goto LABEL_13;
        v8 = v11 + 1;
        if (v11 + 2 < v20)
        {
          v12 = *(_QWORD *)(v19 + 8 * (v11 + 2));
          if (v12)
          {
            v11 += 2;
            goto LABEL_10;
          }
          v13 = v11 + 3;
          v8 = v11 + 2;
          if (v11 + 3 < v20)
          {
            v12 = *(_QWORD *)(v19 + 8 * v13);
            if (!v12)
            {
              while (1)
              {
                v11 = v13 + 1;
                if (__OFADD__(v13, 1))
                  goto LABEL_39;
                if (v11 >= v20)
                {
                  v8 = v20 - 1;
                  goto LABEL_24;
                }
                v12 = *(_QWORD *)(v19 + 8 * v11);
                ++v13;
                if (v12)
                  goto LABEL_10;
              }
            }
LABEL_13:
            v11 = v13;
LABEL_10:
            v6 = (v12 - 1) & v12;
            v10 = __clz(__rbit64(v12)) + (v11 << 6);
            v8 = v11;
LABEL_6:
            sub_2111C2BE4(*(_QWORD *)(a1 + 48) + 40 * v10, (uint64_t)&v27);
            sub_2111C0668(*(_QWORD *)(a1 + 56) + 32 * v10, (uint64_t)v29 + 8);
            goto LABEL_25;
          }
        }
      }
    }
LABEL_24:
    v6 = 0;
    v30 = 0;
    memset(v29, 0, sizeof(v29));
    v27 = 0u;
    v28 = 0u;
LABEL_25:
    sub_21123F564((uint64_t)&v27, (uint64_t)&v31);
    if (!*((_QWORD *)&v32 + 1))
    {
      swift_release();
      return v35;
    }
    v27 = v31;
    v28 = v32;
    *(_QWORD *)&v29[0] = v33;
    sub_2111C787C(&v34, v26);
    sub_2111C0668((uint64_t)v26, (uint64_t)&v24);
    sub_2111C63C4(0, (unint64_t *)&qword_253D2B180);
    if ((swift_dynamicCast() & 1) != 0)
    {
      v14 = objc_msgSend(v22, sel_stringValue);
      v15 = sub_21124639C();
      v17 = v16;

      v25 = MEMORY[0x24BEE0D00];
      *(_QWORD *)&v24 = v15;
      *((_QWORD *)&v24 + 1) = v17;
      __swift_destroy_boxed_opaque_existential_0((uint64_t)v26);
      sub_2111C787C(&v24, v26);
    }
    sub_2111C0668((uint64_t)v26, (uint64_t)&v24);
    if ((swift_dynamicCast() & 1) != 0)
    {
      if ((a2 & 1) != 0)
      {
        sub_21123F5AC((uint64_t)v22, v23);
        swift_bridgeObjectRelease();
      }
      if ((v3 & 1) != 0)
      {
        *(_QWORD *)&v24 = sub_21124678C();
        *((_QWORD *)&v24 + 1) = v18;
      }
      else
      {
        *(_QWORD *)&v24 = 38;
        *((_QWORD *)&v24 + 1) = 0xE100000000000000;
        sub_21124678C();
        sub_211246438();
        swift_bridgeObjectRelease();
      }
      sub_211246438();
      sub_211246438();
      swift_bridgeObjectRelease();
      sub_211246438();
      swift_bridgeObjectRelease();
      __swift_destroy_boxed_opaque_existential_0((uint64_t)v26);
      result = sub_2111C2C20((uint64_t)&v27);
      v3 = 0;
      goto LABEL_4;
    }
    __swift_destroy_boxed_opaque_existential_0((uint64_t)v26);
    result = sub_2111C2C20((uint64_t)&v27);
    if (v6)
      goto LABEL_5;
  }
  __break(1u);
LABEL_39:
  __break(1u);
  return result;
}

uint64_t sub_21123F564(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_254A9F8F8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_21123F5AC(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD v12[2];

  v4 = sub_211244DC4();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)v12 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12[0] = a1;
  v12[1] = a2;
  sub_211244DA0();
  sub_211244DB8();
  sub_2111E7B44();
  v8 = sub_211246744();
  v10 = v9;
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  if (v10)
    return v8;
  swift_bridgeObjectRetain();
  return a1;
}

unint64_t sub_21123F698()
{
  unint64_t result;

  result = qword_254A9F900;
  if (!qword_254A9F900)
  {
    result = MEMORY[0x212BD7970](&protocol conformance descriptor for UserReview, &type metadata for UserReview);
    atomic_store(result, (unint64_t *)&qword_254A9F900);
  }
  return result;
}

uint64_t OUTLINED_FUNCTION_0_38()
{
  return 0x6E6F6973726576;
}

uint64_t OUTLINED_FUNCTION_1_38()
{
  return AMSError();
}

uint64_t OUTLINED_FUNCTION_2_35()
{
  return sub_211246378();
}

uint64_t OUTLINED_FUNCTION_4_32(uint64_t a1)
{
  uint64_t (*v1)(uint64_t, uint64_t);
  uint64_t v2;

  return v1(a1, v2);
}

uint64_t OUTLINED_FUNCTION_6_27()
{
  return sub_211244F68();
}

uint64_t OUTLINED_FUNCTION_7_27()
{
  return swift_allocObject();
}

uint64_t OUTLINED_FUNCTION_8_25()
{
  return sub_211244D7C();
}

uint64_t _s20AppleMediaServicesUI25ViewRepresentableProviderPAAE20makeUIViewController7context1VQz05SwiftD00ijF7ContextVy1TQzG_tF_0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;

  v6 = (*(uint64_t (**)(void))(a3 + 40))();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(a3 + 48))(v6, a1, a2, a3);
  return v6;
}

uint64_t dispatch thunk of ViewRepresentableProvider.makeViewController(context:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 40))();
}

uint64_t OUTLINED_FUNCTION_0_39(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 48))();
}

void WebModel.__allocating_init(bag:account:clientInfo:appearance:clientOptions:loadUsingWebKit:metricsOverlay:handlers:)()
{
  uint64_t v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  int v5;
  uint64_t v6;
  uint64_t *v7;

  OUTLINED_FUNCTION_24_11();
  v0 = OUTLINED_FUNCTION_27_11();
  sub_211242890(v0, v1, v2, v3, v4, v5, v6, v7);
  OUTLINED_FUNCTION_38_8();
}

uint64_t WebModelHandlers.init(handleAuthenticateRequest:handleDelegateAction:handleDialogRequest:didResolveWithResult:didEncodeNetworkRequest:)@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, _QWORD *a9@<X8>, uint64_t a10, uint64_t a11)
{
  *a9 = result;
  a9[1] = a2;
  a9[2] = a3;
  a9[3] = a4;
  a9[4] = a5;
  a9[5] = a6;
  a9[6] = a7;
  a9[7] = a8;
  a9[8] = a10;
  a9[9] = a11;
  a9[10] = 0;
  a9[11] = 0;
  return result;
}

void WebView.init(model:)(uint64_t *a1@<X8>)
{
  uint64_t v2;

  type metadata accessor for WebModel();
  sub_21124295C();
  *a1 = sub_2112456C4();
  a1[1] = v2;
  OUTLINED_FUNCTION_10();
}

void sub_21123F85C(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v5;
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD v12[3];
  uint64_t v13;

  sub_2111ECCB4(a1, (uint64_t)v12);
  v5 = v13;
  if (!v13)
  {
    v11 = 0;
    if (!a2)
      goto LABEL_4;
    goto LABEL_3;
  }
  v6 = __swift_project_boxed_opaque_existential_1(v12, v13);
  v7 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v6);
  OUTLINED_FUNCTION_14();
  v10 = v9 - v8;
  (*(void (**)(uint64_t))(v7 + 16))(v9 - v8);
  v11 = sub_2112469B4();
  (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v10, v5);
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v12);
  if (a2)
LABEL_3:
    a2 = (void *)sub_211244F68();
LABEL_4:
  (*(void (**)(uint64_t, uint64_t, void *))(a3 + 16))(a3, v11, a2);
  swift_unknownObjectRelease();

  OUTLINED_FUNCTION_19();
}

id sub_21123F94C(uint64_t a1, void *a2, void *a3)
{
  id v5;

  v5 = objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_initWithBag_account_clientInfo_, a1, a2, a3);
  swift_unknownObjectRelease();

  return v5;
}

uint64_t WebView.model.getter()
{
  return swift_retain();
}

uint64_t sub_21123F9BC@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  result = WebView.model.getter();
  *a1 = result;
  return result;
}

void sub_21123F9F4()
{
  uint64_t v0;

  v0 = swift_retain();
  WebView.model.setter(v0);
}

void WebView.model.setter(uint64_t a1)
{
  uint64_t v1;

  swift_release();
  *(_QWORD *)(v1 + 8) = a1;
  OUTLINED_FUNCTION_11();
}

uint64_t (*WebView.model.modify())(_QWORD)
{
  return CGSizeMake;
}

uint64_t WebView.$model.getter()
{
  type metadata accessor for WebModel();
  sub_21124295C();
  return sub_2112456D0();
}

id WebView.makeViewController(context:)()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v8;

  sub_21124299C();
  OUTLINED_FUNCTION_30_0();
  sub_211240810();
  v1 = v0;
  OUTLINED_FUNCTION_17_1();
  OUTLINED_FUNCTION_30_0();
  sub_2112409F4();
  v3 = v2;
  OUTLINED_FUNCTION_17_1();
  OUTLINED_FUNCTION_30_0();
  sub_211240B60();
  v5 = v4;
  OUTLINED_FUNCTION_17_1();
  v6 = sub_21123F94C(v1, v3, v5);
  __swift_instantiateConcreteTypeFromMangledName(&qword_254A9F920);
  sub_211245C28();
  objc_msgSend(v6, sel_setDelegate_, v8);

  swift_unknownObjectWeakAssign();
  return v6;
}

void WebView.update(_:context:)(void *a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  id v16;

  OUTLINED_FUNCTION_21();
  sub_211240810();
  v2 = OUTLINED_FUNCTION_22();
  OUTLINED_FUNCTION_2_7(v2, sel_setBag_);
  swift_unknownObjectRelease();
  OUTLINED_FUNCTION_21();
  sub_2112409F4();
  v4 = v3;
  v5 = OUTLINED_FUNCTION_22();
  OUTLINED_FUNCTION_2_7(v5, sel_setAccount_);

  OUTLINED_FUNCTION_21();
  sub_211240CCC();
  v7 = v6;
  v8 = OUTLINED_FUNCTION_22();
  OUTLINED_FUNCTION_2_7(v8, sel_setAppearance_);

  OUTLINED_FUNCTION_21();
  LOBYTE(v7) = sub_211240FA0();
  OUTLINED_FUNCTION_22();
  objc_msgSend(a1, sel_setLoadUsingWebKit_, v7 & 1);
  OUTLINED_FUNCTION_21();
  sub_211240E38();
  v10 = v9;
  v11 = OUTLINED_FUNCTION_22();
  if (v10)
  {
    OUTLINED_FUNCTION_50_2();

    v10 = 0;
  }
  OUTLINED_FUNCTION_2_7(v11, sel_setClientOptions_);

  OUTLINED_FUNCTION_21();
  sub_211241190();
  v13 = v12;
  v14 = OUTLINED_FUNCTION_22();
  if (v13)
  {
    OUTLINED_FUNCTION_50_2();

    v13 = 0;
  }
  OUTLINED_FUNCTION_2_7(v14, sel_setMetricsOverlay_);

  OUTLINED_FUNCTION_21();
  sub_211240B60();
  v16 = v15;
  OUTLINED_FUNCTION_22();
  if (v16)
  {
    objc_msgSend(a1, sel_setClientInfo_, v16);

  }
  else
  {
    OUTLINED_FUNCTION_47_0();
  }
}

void WebView.makeCoordinator()()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  _QWORD v3[2];

  v2 = *v0;
  v1 = v0[1];
  type metadata accessor for WebView.Coordinator();
  v3[0] = v2;
  v3[1] = v1;
  OUTLINED_FUNCTION_30_0();
  sub_21123FD78(v3);
  OUTLINED_FUNCTION_35();
}

id sub_21123FD78(_QWORD *a1)
{
  objc_class *v1;
  char *v3;
  uint64_t v4;
  char *v5;
  objc_super v7;

  v3 = (char *)objc_allocWithZone(v1);
  v4 = a1[1];
  v5 = &v3[OBJC_IVAR____TtCV20AppleMediaServicesUI7WebView11Coordinator_parent];
  *(_QWORD *)v5 = *a1;
  *((_QWORD *)v5 + 1) = v4;
  v7.receiver = v3;
  v7.super_class = v1;
  return objc_msgSendSuper2(&v7, sel_init);
}

uint64_t sub_21123FDCC@<X0>(_QWORD *a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;

  v2 = *(_QWORD *)(v1 + OBJC_IVAR____TtCV20AppleMediaServicesUI7WebView11Coordinator_parent + 8);
  *a1 = *(_QWORD *)(v1 + OBJC_IVAR____TtCV20AppleMediaServicesUI7WebView11Coordinator_parent);
  a1[1] = v2;
  return swift_retain();
}

#error "21123FE08: call analysis failed (funcsize=41)"

void sub_21123FEA4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
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
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void (*v22)(uint64_t, uint64_t, uint64_t);
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  _QWORD v31[3];

  v7 = sub_21123FDCC(v31);
  OUTLINED_FUNCTION_68_2(v7, v8, v9, v10, v11, v12, v13, v14, v17, v18, v19);
  OUTLINED_FUNCTION_22();
  if (v20 != 1)
  {
    v15 = OUTLINED_FUNCTION_71_2();
    sub_2111CA348(v15);
    sub_2111C6444(v20, v21, (uint64_t)v22, v23, v24, v25, v26, v27, v28, v29, v30);
    if (v22)
    {
      v22(a2, a3, a4);
      v16 = OUTLINED_FUNCTION_71_2();
      sub_2111C64E4(v16);
    }
  }
  OUTLINED_FUNCTION_60_2();
}

#error "211240074: call analysis failed (funcsize=45)"

uint64_t sub_21124011C(void *a1, int a2, void *a3, void *a4, void *aBlock, uint64_t a6, uint64_t a7, void (*a8)(void))
{
  void *v12;
  id v13;
  id v14;
  id v15;

  v12 = _Block_copy(aBlock);
  *(_QWORD *)(OUTLINED_FUNCTION_14_2() + 16) = v12;
  v13 = a3;
  v14 = a4;
  v15 = a1;
  a8();

  return OUTLINED_FUNCTION_29_9();
}

void sub_2112401B0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  id v6;

  if (a2)
    v5 = sub_211244F68();
  else
    v5 = 0;
  v6 = (id)v5;
  (*(void (**)(uint64_t, uint64_t))(a3 + 16))(a3, a1);

}

void sub_211240208(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
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
  void (*v37)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v38;
  _QWORD v39[3];

  v9 = sub_21123FDCC(v39);
  OUTLINED_FUNCTION_68_2(v9, v10, v11, v12, v13, v14, v15, v16, v28, v30, v32);
  OUTLINED_FUNCTION_22();
  if (v34 != 1)
  {
    if (v37)
    {
      swift_retain();
      v17 = OUTLINED_FUNCTION_53_2();
      sub_2111C6444(v17, v18, v19, v20, v35, v36, (uint64_t)v37, v38, v29, v31, v33);
      v37(a2, a3, a4, a5);
      OUTLINED_FUNCTION_60_2();
      sub_2111C64E4(v21);
      return;
    }
    v22 = OUTLINED_FUNCTION_53_2();
    sub_2111C6444(v22, v23, v24, v25, v26, v27, 0, v38, v29, v31, v33);
  }
  OUTLINED_FUNCTION_60_2();
}

uint64_t sub_2112403B8(uint64_t a1, uint64_t a2)
{
  uint64_t result;
  void (*v4)(uint64_t);
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
  uint64_t v26[8];
  void (*v27)(uint64_t);
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;

  sub_21123FDCC(&v30);
  sub_211241634(v26);
  result = OUTLINED_FUNCTION_22();
  if (v26[0] != 1)
  {
    v25 = a2;
    v4 = v27;
    v6 = v28;
    v5 = v29;
    if (v27)
    {
      v23 = v26[6];
      v24 = v26[7];
      swift_retain();
      v7 = OUTLINED_FUNCTION_47_7();
      sub_2111C6444(v7, v8, v9, v10, v11, v12, v23, v24, (uint64_t)v4, v6, v5);
      v4(v25);
      return sub_2111C64E4((uint64_t)v4);
    }
    else
    {
      v22 = v29;
      v21 = v28;
      v13 = OUTLINED_FUNCTION_47_7();
      return sub_2111C6444(v13, v14, v15, v16, v17, v18, v19, v20, 0, v21, v22);
    }
  }
  return result;
}

#error "211240528: call analysis failed (funcsize=41)"

id WebView.Coordinator.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

void WebView.Coordinator.init()()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

id WebView.Coordinator.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for WebView.Coordinator();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

void sub_2112406C8()
{
  sub_2111D1B98();
}

void sub_2112406D0(void *a1)
{
  sub_2111D1E9C(a1);
}

void sub_2112406D8(_QWORD *a1@<X8>)
{
  uint64_t v2;

  WebView.makeCoordinator()();
  *a1 = v2;
}

uint64_t sub_2112406FC()
{
  sub_211243234();
  return sub_211245BD4();
}

uint64_t sub_21124074C()
{
  sub_211243234();
  return sub_211245BA4();
}

void sub_21124079C()
{
  sub_211243234();
  sub_211245BC8();
  __break(1u);
}

void sub_2112407C0(_QWORD *a1@<X8>)
{
  uint64_t v2;

  sub_211240810();
  *a1 = v2;
}

void sub_2112407E8()
{
  swift_unknownObjectRetain();
  sub_211240860();
}

void sub_211240810()
{
  swift_getKeyPath();
  swift_getKeyPath();
  OUTLINED_FUNCTION_65();
  OUTLINED_FUNCTION_17_1();
  OUTLINED_FUNCTION_44();
  OUTLINED_FUNCTION_35();
}

void sub_211240860()
{
  swift_getKeyPath();
  swift_getKeyPath();
  OUTLINED_FUNCTION_21();
  OUTLINED_FUNCTION_13_5();
  OUTLINED_FUNCTION_35();
}

void sub_2112408B0()
{
  uint64_t v0;
  void *v1;
  uint64_t KeyPath;
  uint64_t v3;

  v1 = OUTLINED_FUNCTION_11_1();
  OUTLINED_FUNCTION_28_4((uint64_t)v1);
  KeyPath = swift_getKeyPath();
  OUTLINED_FUNCTION_20_5(KeyPath);
  v3 = swift_getKeyPath();
  *(_QWORD *)(v0 + 48) = OUTLINED_FUNCTION_3_1(v3);
  OUTLINED_FUNCTION_10();
}

uint64_t sub_2112408FC()
{
  return sub_2111C37A8((uint64_t)&OBJC_IVAR____TtC20AppleMediaServicesUI8WebModel__bag, &qword_254A9F930);
}

void sub_211240910(uint64_t a1)
{
  sub_2111E272C(a1, &qword_254A9F938, (uint64_t)&OBJC_IVAR____TtC20AppleMediaServicesUI8WebModel__bag, &qword_254A9F930);
}

void sub_21124092C()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  void *v3;

  v1 = OUTLINED_FUNCTION_12_0();
  OUTLINED_FUNCTION_10_6((uint64_t)v1);
  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_254A9F938);
  *(_QWORD *)(v0 + 48) = OUTLINED_FUNCTION_4_0(v2);
  v3 = OUTLINED_FUNCTION_7_5();
  OUTLINED_FUNCTION_19_5((uint64_t)v3);
  OUTLINED_FUNCTION_0_14();
  __swift_instantiateConcreteTypeFromMangledName(&qword_254A9F930);
  OUTLINED_FUNCTION_15_6();
  OUTLINED_FUNCTION_18_4();
  OUTLINED_FUNCTION_10();
}

void sub_211240994(uint64_t a1, char a2)
{
  sub_2111C3978(a1, a2, (void (*)(void *))sub_211240910);
}

void sub_2112409A0(_QWORD *a1@<X8>)
{
  uint64_t v2;

  sub_2112409F4();
  *a1 = v2;
}

void sub_2112409C8(id *a1)
{
  id v1;

  v1 = *a1;
  sub_211240A08();
}

void sub_2112409F4()
{
  sub_2112411A4();
}

void sub_211240A08()
{
  sub_21124120C();
}

void sub_211240A1C()
{
  uint64_t v0;
  void *v1;
  uint64_t KeyPath;
  uint64_t v3;

  v1 = OUTLINED_FUNCTION_11_1();
  OUTLINED_FUNCTION_28_4((uint64_t)v1);
  KeyPath = swift_getKeyPath();
  OUTLINED_FUNCTION_20_5(KeyPath);
  v3 = swift_getKeyPath();
  *(_QWORD *)(v0 + 48) = OUTLINED_FUNCTION_3_1(v3);
  OUTLINED_FUNCTION_10();
}

uint64_t sub_211240A68()
{
  return sub_2111C37A8((uint64_t)&OBJC_IVAR____TtC20AppleMediaServicesUI8WebModel__account, &qword_254A99E90);
}

void sub_211240A7C(uint64_t a1)
{
  sub_2111E272C(a1, (uint64_t *)&unk_254A9B690, (uint64_t)&OBJC_IVAR____TtC20AppleMediaServicesUI8WebModel__account, &qword_254A99E90);
}

void sub_211240A98()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  void *v3;

  v1 = OUTLINED_FUNCTION_12_0();
  OUTLINED_FUNCTION_10_6((uint64_t)v1);
  v2 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_254A9B690);
  *(_QWORD *)(v0 + 48) = OUTLINED_FUNCTION_4_0(v2);
  v3 = OUTLINED_FUNCTION_7_5();
  OUTLINED_FUNCTION_19_5((uint64_t)v3);
  OUTLINED_FUNCTION_0_14();
  __swift_instantiateConcreteTypeFromMangledName(&qword_254A99E90);
  OUTLINED_FUNCTION_15_6();
  OUTLINED_FUNCTION_18_4();
  OUTLINED_FUNCTION_10();
}

void sub_211240B00(uint64_t a1, char a2)
{
  sub_2111C3978(a1, a2, (void (*)(void *))sub_211240A7C);
}

void sub_211240B0C(_QWORD *a1@<X8>)
{
  uint64_t v2;

  sub_211240B60();
  *a1 = v2;
}

void sub_211240B34(id *a1)
{
  id v1;

  v1 = *a1;
  sub_211240B74();
}

void sub_211240B60()
{
  sub_2112411A4();
}

void sub_211240B74()
{
  sub_21124120C();
}

void sub_211240B88()
{
  uint64_t v0;
  void *v1;
  uint64_t KeyPath;
  uint64_t v3;

  v1 = OUTLINED_FUNCTION_11_1();
  OUTLINED_FUNCTION_28_4((uint64_t)v1);
  KeyPath = swift_getKeyPath();
  OUTLINED_FUNCTION_20_5(KeyPath);
  v3 = swift_getKeyPath();
  *(_QWORD *)(v0 + 48) = OUTLINED_FUNCTION_3_1(v3);
  OUTLINED_FUNCTION_10();
}

uint64_t sub_211240BD4()
{
  return sub_2111C37A8((uint64_t)&OBJC_IVAR____TtC20AppleMediaServicesUI8WebModel__clientInfo, (uint64_t *)&unk_254A99CA0);
}

void sub_211240BE8(uint64_t a1)
{
  sub_2111E272C(a1, (uint64_t *)&unk_254A9B6A0, (uint64_t)&OBJC_IVAR____TtC20AppleMediaServicesUI8WebModel__clientInfo, (uint64_t *)&unk_254A99CA0);
}

void sub_211240C04()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  void *v3;

  v1 = OUTLINED_FUNCTION_12_0();
  OUTLINED_FUNCTION_10_6((uint64_t)v1);
  v2 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_254A9B6A0);
  *(_QWORD *)(v0 + 48) = OUTLINED_FUNCTION_4_0(v2);
  v3 = OUTLINED_FUNCTION_7_5();
  OUTLINED_FUNCTION_19_5((uint64_t)v3);
  OUTLINED_FUNCTION_0_14();
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_254A99CA0);
  OUTLINED_FUNCTION_15_6();
  OUTLINED_FUNCTION_18_4();
  OUTLINED_FUNCTION_10();
}

void sub_211240C6C(uint64_t a1, char a2)
{
  sub_2111C3978(a1, a2, (void (*)(void *))sub_211240BE8);
}

void sub_211240C78(_QWORD *a1@<X8>)
{
  uint64_t v2;

  sub_211240CCC();
  *a1 = v2;
}

void sub_211240CA0(id *a1)
{
  id v1;

  v1 = *a1;
  sub_211240CE0();
}

void sub_211240CCC()
{
  sub_2112411A4();
}

void sub_211240CE0()
{
  sub_21124120C();
}

void sub_211240CF4()
{
  uint64_t v0;
  void *v1;
  uint64_t KeyPath;
  uint64_t v3;

  v1 = OUTLINED_FUNCTION_11_1();
  OUTLINED_FUNCTION_28_4((uint64_t)v1);
  KeyPath = swift_getKeyPath();
  OUTLINED_FUNCTION_20_5(KeyPath);
  v3 = swift_getKeyPath();
  *(_QWORD *)(v0 + 48) = OUTLINED_FUNCTION_3_1(v3);
  OUTLINED_FUNCTION_10();
}

uint64_t sub_211240D40()
{
  return sub_2111C37A8((uint64_t)&OBJC_IVAR____TtC20AppleMediaServicesUI8WebModel__appearance, (uint64_t *)&unk_254A99E80);
}

void sub_211240D54(uint64_t a1)
{
  sub_2111E272C(a1, &qword_254A9F960, (uint64_t)&OBJC_IVAR____TtC20AppleMediaServicesUI8WebModel__appearance, (uint64_t *)&unk_254A99E80);
}

void sub_211240D70()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  void *v3;

  v1 = OUTLINED_FUNCTION_12_0();
  OUTLINED_FUNCTION_10_6((uint64_t)v1);
  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_254A9F960);
  *(_QWORD *)(v0 + 48) = OUTLINED_FUNCTION_4_0(v2);
  v3 = OUTLINED_FUNCTION_7_5();
  OUTLINED_FUNCTION_19_5((uint64_t)v3);
  OUTLINED_FUNCTION_0_14();
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_254A99E80);
  OUTLINED_FUNCTION_15_6();
  OUTLINED_FUNCTION_18_4();
  OUTLINED_FUNCTION_10();
}

void sub_211240DD8(uint64_t a1, char a2)
{
  sub_2111C3978(a1, a2, (void (*)(void *))sub_211240D54);
}

void sub_211240DE4(_QWORD *a1@<X8>)
{
  uint64_t v2;

  sub_211240E38();
  *a1 = v2;
}

void sub_211240E0C(id *a1)
{
  id v1;

  v1 = *a1;
  sub_211240E4C();
}

void sub_211240E38()
{
  sub_2112411A4();
}

void sub_211240E4C()
{
  sub_21124120C();
}

void sub_211240E60()
{
  uint64_t v0;
  void *v1;
  uint64_t KeyPath;
  uint64_t v3;

  v1 = OUTLINED_FUNCTION_11_1();
  OUTLINED_FUNCTION_28_4((uint64_t)v1);
  KeyPath = swift_getKeyPath();
  OUTLINED_FUNCTION_20_5(KeyPath);
  v3 = swift_getKeyPath();
  *(_QWORD *)(v0 + 48) = OUTLINED_FUNCTION_3_1(v3);
  OUTLINED_FUNCTION_10();
}

uint64_t sub_211240EAC()
{
  return sub_2111C37A8((uint64_t)&OBJC_IVAR____TtC20AppleMediaServicesUI8WebModel__clientOptions, (uint64_t *)&unk_254A9F970);
}

void sub_211240EC0(uint64_t a1)
{
  sub_2111E272C(a1, (uint64_t *)&unk_254A99CC0, (uint64_t)&OBJC_IVAR____TtC20AppleMediaServicesUI8WebModel__clientOptions, (uint64_t *)&unk_254A9F970);
}

void sub_211240EDC()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  void *v3;

  v1 = OUTLINED_FUNCTION_12_0();
  OUTLINED_FUNCTION_10_6((uint64_t)v1);
  v2 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_254A99CC0);
  *(_QWORD *)(v0 + 48) = OUTLINED_FUNCTION_4_0(v2);
  v3 = OUTLINED_FUNCTION_7_5();
  OUTLINED_FUNCTION_19_5((uint64_t)v3);
  OUTLINED_FUNCTION_0_14();
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_254A9F970);
  OUTLINED_FUNCTION_15_6();
  OUTLINED_FUNCTION_18_4();
  OUTLINED_FUNCTION_10();
}

void sub_211240F44(uint64_t a1, char a2)
{
  sub_2111C3978(a1, a2, (void (*)(void *))sub_211240EC0);
}

uint64_t sub_211240F50@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = sub_211240FA0();
  *a1 = result & 1;
  return result;
}

void sub_211240F7C()
{
  sub_211240FFC();
}

uint64_t sub_211240FA0()
{
  unsigned __int8 v1;

  swift_getKeyPath();
  swift_getKeyPath();
  OUTLINED_FUNCTION_65();
  OUTLINED_FUNCTION_17_1();
  OUTLINED_FUNCTION_44();
  return v1;
}

void sub_211240FFC()
{
  swift_getKeyPath();
  swift_getKeyPath();
  OUTLINED_FUNCTION_21();
  OUTLINED_FUNCTION_13_5();
  OUTLINED_FUNCTION_35();
}

void sub_21124104C()
{
  uint64_t v0;
  void *v1;
  uint64_t KeyPath;
  uint64_t v3;

  v1 = OUTLINED_FUNCTION_11_1();
  OUTLINED_FUNCTION_28_4((uint64_t)v1);
  KeyPath = swift_getKeyPath();
  OUTLINED_FUNCTION_20_5(KeyPath);
  v3 = swift_getKeyPath();
  *(_QWORD *)(v0 + 48) = OUTLINED_FUNCTION_3_1(v3);
  OUTLINED_FUNCTION_10();
}

uint64_t sub_211241098()
{
  return sub_2111C37A8((uint64_t)&OBJC_IVAR____TtC20AppleMediaServicesUI8WebModel__loadUsingWebKit, (uint64_t *)&unk_254A99A10);
}

void sub_2112410AC(uint64_t a1)
{
  sub_2111E272C(a1, &qword_254A9F990, (uint64_t)&OBJC_IVAR____TtC20AppleMediaServicesUI8WebModel__loadUsingWebKit, (uint64_t *)&unk_254A99A10);
}

void sub_2112410C8()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  void *v3;

  v1 = OUTLINED_FUNCTION_12_0();
  OUTLINED_FUNCTION_10_6((uint64_t)v1);
  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_254A9F990);
  *(_QWORD *)(v0 + 48) = OUTLINED_FUNCTION_4_0(v2);
  v3 = OUTLINED_FUNCTION_7_5();
  OUTLINED_FUNCTION_19_5((uint64_t)v3);
  OUTLINED_FUNCTION_0_14();
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_254A99A10);
  OUTLINED_FUNCTION_15_6();
  OUTLINED_FUNCTION_18_4();
  OUTLINED_FUNCTION_10();
}

void sub_211241130(uint64_t a1, char a2)
{
  sub_2111C3978(a1, a2, (void (*)(void *))sub_2112410AC);
}

void sub_21124113C(_QWORD *a1@<X8>)
{
  uint64_t v2;

  sub_211241190();
  *a1 = v2;
}

void sub_211241164(id *a1)
{
  id v1;

  v1 = *a1;
  sub_2112411F8();
}

void sub_211241190()
{
  sub_2112411A4();
}

void sub_2112411A4()
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_2112454C0();
  OUTLINED_FUNCTION_44();
  OUTLINED_FUNCTION_17_1();
  OUTLINED_FUNCTION_35();
}

void sub_2112411F8()
{
  sub_21124120C();
}

void sub_21124120C()
{
  swift_getKeyPath();
  swift_getKeyPath();
  OUTLINED_FUNCTION_21();
  sub_2112454CC();
  OUTLINED_FUNCTION_35();
}

void sub_211241264()
{
  uint64_t v0;
  void *v1;
  uint64_t KeyPath;
  uint64_t v3;

  v1 = OUTLINED_FUNCTION_11_1();
  OUTLINED_FUNCTION_28_4((uint64_t)v1);
  KeyPath = swift_getKeyPath();
  OUTLINED_FUNCTION_20_5(KeyPath);
  v3 = swift_getKeyPath();
  *(_QWORD *)(v0 + 48) = OUTLINED_FUNCTION_3_1(v3);
  OUTLINED_FUNCTION_10();
}

uint64_t sub_2112412B0()
{
  return sub_2111C37A8((uint64_t)&OBJC_IVAR____TtC20AppleMediaServicesUI8WebModel__metricsOverlay, (uint64_t *)&unk_254A9F970);
}

void sub_2112412C4(uint64_t a1)
{
  sub_2111E272C(a1, (uint64_t *)&unk_254A99CC0, (uint64_t)&OBJC_IVAR____TtC20AppleMediaServicesUI8WebModel__metricsOverlay, (uint64_t *)&unk_254A9F970);
}

void sub_2112412E0()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  void *v3;

  v1 = OUTLINED_FUNCTION_12_0();
  OUTLINED_FUNCTION_10_6((uint64_t)v1);
  v2 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_254A99CC0);
  *(_QWORD *)(v0 + 48) = OUTLINED_FUNCTION_4_0(v2);
  v3 = OUTLINED_FUNCTION_7_5();
  OUTLINED_FUNCTION_19_5((uint64_t)v3);
  OUTLINED_FUNCTION_0_14();
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_254A9F970);
  OUTLINED_FUNCTION_15_6();
  OUTLINED_FUNCTION_18_4();
  OUTLINED_FUNCTION_10();
}

void sub_211241348(uint64_t a1, char a2)
{
  sub_2111C3978(a1, a2, (void (*)(void *))sub_2112412C4);
}

uint64_t sub_211241354@<X0>(uint64_t a1@<X8>)
{
  uint64_t result;
  char v3;

  result = sub_2112413C4();
  *(_QWORD *)a1 = result;
  *(_BYTE *)(a1 + 8) = v3;
  return result;
}

void sub_211241380(uint64_t a1)
{
  sub_2111E5DD8(*(id *)a1, *(_BYTE *)(a1 + 8));
  sub_211241424();
}

uint64_t sub_2112413C4()
{
  uint64_t v1;

  swift_getKeyPath();
  swift_getKeyPath();
  OUTLINED_FUNCTION_65();
  OUTLINED_FUNCTION_17_1();
  OUTLINED_FUNCTION_44();
  return v1;
}

void sub_211241424()
{
  swift_getKeyPath();
  swift_getKeyPath();
  OUTLINED_FUNCTION_21();
  sub_2112454CC();
  OUTLINED_FUNCTION_47_0();
}

void sub_21124148C()
{
  uint64_t v0;
  void *v1;
  uint64_t KeyPath;
  uint64_t v3;

  v1 = OUTLINED_FUNCTION_11_1();
  OUTLINED_FUNCTION_28_4((uint64_t)v1);
  KeyPath = swift_getKeyPath();
  OUTLINED_FUNCTION_20_5(KeyPath);
  v3 = swift_getKeyPath();
  *(_QWORD *)(v0 + 48) = OUTLINED_FUNCTION_3_1(v3);
  OUTLINED_FUNCTION_10();
}

uint64_t sub_2112414D8()
{
  return sub_2111C37A8((uint64_t)&OBJC_IVAR____TtC20AppleMediaServicesUI8WebModel__resolveResult, &qword_254A99E78);
}

void sub_2112414EC(uint64_t a1)
{
  sub_2111E272C(a1, &qword_254A9F9B0, (uint64_t)&OBJC_IVAR____TtC20AppleMediaServicesUI8WebModel__resolveResult, &qword_254A99E78);
}

void sub_211241508()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  void *v3;

  v1 = OUTLINED_FUNCTION_12_0();
  OUTLINED_FUNCTION_10_6((uint64_t)v1);
  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_254A9F9B0);
  *(_QWORD *)(v0 + 48) = OUTLINED_FUNCTION_4_0(v2);
  v3 = OUTLINED_FUNCTION_7_5();
  OUTLINED_FUNCTION_19_5((uint64_t)v3);
  OUTLINED_FUNCTION_0_14();
  __swift_instantiateConcreteTypeFromMangledName(&qword_254A99E78);
  OUTLINED_FUNCTION_15_6();
  OUTLINED_FUNCTION_18_4();
  OUTLINED_FUNCTION_10();
}

void sub_211241570(uint64_t a1, char a2)
{
  sub_2111C3978(a1, a2, (void (*)(void *))sub_2112414EC);
}

double sub_21124157C@<D0>(_OWORD *a1@<X8>)
{
  __int128 v2;
  __int128 v3;
  double result;
  __int128 v5;
  _OWORD v6[4];
  __int128 v7;
  __int128 v8;

  sub_211241634((uint64_t *)v6);
  v2 = v6[1];
  *a1 = v6[0];
  a1[1] = v2;
  v3 = v6[3];
  a1[2] = v6[2];
  a1[3] = v3;
  result = *(double *)&v7;
  v5 = v8;
  a1[4] = v7;
  a1[5] = v5;
  return result;
}

uint64_t sub_2112415C4(uint64_t *a1)
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
  uint64_t v13[12];

  v1 = a1[1];
  v2 = a1[2];
  v3 = a1[3];
  v4 = a1[4];
  v5 = a1[5];
  v6 = a1[6];
  v7 = a1[7];
  v8 = a1[8];
  v9 = a1[9];
  v10 = a1[10];
  v11 = a1[11];
  v13[0] = *a1;
  v13[1] = v1;
  v13[2] = v2;
  v13[3] = v3;
  v13[4] = v4;
  v13[5] = v5;
  v13[6] = v6;
  v13[7] = v7;
  v13[8] = v8;
  v13[9] = v9;
  v13[10] = v10;
  v13[11] = v11;
  sub_211242B3C(v13[0], v1, v2, v3, v4, v5, v6, v7, v8, v9, v10);
  return sub_2112416B4(v13);
}

uint64_t sub_211241634@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v1;
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
  uint64_t v14;
  uint64_t v15;

  v3 = (uint64_t *)(v1 + OBJC_IVAR____TtC20AppleMediaServicesUI8WebModel_handlers);
  swift_beginAccess();
  v4 = *v3;
  v5 = v3[1];
  v6 = v3[2];
  v7 = v3[3];
  v8 = v3[4];
  v9 = v3[5];
  v10 = v3[6];
  v11 = v3[7];
  v12 = v3[8];
  v13 = v3[9];
  v14 = v3[10];
  v15 = v3[11];
  *a1 = *v3;
  a1[1] = v5;
  a1[2] = v6;
  a1[3] = v7;
  a1[4] = v8;
  a1[5] = v9;
  a1[6] = v10;
  a1[7] = v11;
  a1[8] = v12;
  a1[9] = v13;
  a1[10] = v14;
  a1[11] = v15;
  return sub_211242B3C(v4, v5, v6, v7, v8, v9, v10, v11, v12, v13, v14);
}

uint64_t sub_2112416B4(uint64_t *a1)
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
  __int128 v17;
  uint64_t v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;

  v2 = *a1;
  v3 = a1[1];
  v4 = a1[4];
  v21 = *(_OWORD *)(a1 + 5);
  v22 = *((_OWORD *)a1 + 1);
  v5 = a1[7];
  v20 = *((_OWORD *)a1 + 4);
  v6 = a1[10];
  v7 = a1[11];
  v8 = v1 + OBJC_IVAR____TtC20AppleMediaServicesUI8WebModel_handlers;
  swift_beginAccess();
  v9 = *(_QWORD *)v8;
  v10 = *(_QWORD *)(v8 + 8);
  v11 = *(_QWORD *)(v8 + 16);
  v12 = *(_QWORD *)(v8 + 24);
  v13 = *(_QWORD *)(v8 + 32);
  v14 = *(_QWORD *)(v8 + 40);
  v15 = *(_QWORD *)(v8 + 48);
  v16 = *(_QWORD *)(v8 + 56);
  v17 = *(_OWORD *)(v8 + 64);
  v18 = *(_QWORD *)(v8 + 80);
  *(_QWORD *)v8 = v2;
  *(_QWORD *)(v8 + 8) = v3;
  *(_OWORD *)(v8 + 16) = v22;
  *(_QWORD *)(v8 + 32) = v4;
  *(_OWORD *)(v8 + 40) = v21;
  *(_QWORD *)(v8 + 56) = v5;
  *(_OWORD *)(v8 + 64) = v20;
  *(_QWORD *)(v8 + 80) = v6;
  *(_QWORD *)(v8 + 88) = v7;
  return sub_2111C6444(v9, v10, v11, v12, v13, v14, v15, v16, v17, *((uint64_t *)&v17 + 1), v18);
}

void sub_21124177C()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_11();
}

void WebModel.init(bag:account:clientInfo:appearance:clientOptions:loadUsingWebKit:metricsOverlay:handlers:)()
{
  uint64_t v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  int v5;
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;

  OUTLINED_FUNCTION_24_11();
  v0 = OUTLINED_FUNCTION_27_11();
  sub_211242BDC(v0, v1, v2, v3, v4, v5, v6, v7, v8);
  OUTLINED_FUNCTION_38_8();
}

uint64_t sub_2112417E8(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  OUTLINED_FUNCTION_44_6(a1);
  *(_QWORD *)(v1 + 136) = OUTLINED_FUNCTION_51_3();
  v2 = OUTLINED_FUNCTION_2_23();
  OUTLINED_FUNCTION_65_1(v2, v3);
  return OUTLINED_FUNCTION_0_24();
}

void sub_21124182C()
{
  OUTLINED_FUNCTION_75_1();
}

uint64_t sub_211241854(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  id v4;
  uint64_t v5;
  _QWORD *v6;
  uint64_t v8;
  uint64_t (*v9)(void);

  v1[20] = a1;
  if (a1)
  {
    OUTLINED_FUNCTION_73_1();
    v3 = sub_211244F98();
    v4 = OUTLINED_FUNCTION_0_12(v3, sel_loadURL_);
    OUTLINED_FUNCTION_74_2((uint64_t)v4);
    v1[7] = v2;
    v5 = OUTLINED_FUNCTION_64_1((uint64_t)sub_2112418F0);
    v1[10] = MEMORY[0x24BDAC760];
    v6 = v1 + 10;
    v6[1] = 0x40000000;
    v6[2] = sub_2111C8B3C;
    v6[3] = &block_descriptor_21;
    v6[4] = v5;
    OUTLINED_FUNCTION_2_19(v5, sel_resultWithCompletion_);
    return OUTLINED_FUNCTION_39_5();
  }
  else
  {
    OUTLINED_FUNCTION_62_1();
    v8 = OUTLINED_FUNCTION_61_1();
    return OUTLINED_FUNCTION_17_15(v8, v9);
  }
}

uint64_t sub_2112418F0()
{
  OUTLINED_FUNCTION_15_22();
  return OUTLINED_FUNCTION_5_11();
}

uint64_t sub_211241928(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  OUTLINED_FUNCTION_44_6(a1);
  *(_QWORD *)(v1 + 136) = OUTLINED_FUNCTION_51_3();
  v2 = OUTLINED_FUNCTION_2_23();
  OUTLINED_FUNCTION_65_1(v2, v3);
  return OUTLINED_FUNCTION_0_24();
}

void sub_21124196C()
{
  OUTLINED_FUNCTION_75_1();
}

uint64_t sub_211241994(void *a1)
{
  _QWORD *v1;
  id v2;
  uint64_t v3;
  _QWORD *v4;
  uint64_t v6;
  uint64_t (*v7)(void);

  v1[20] = a1;
  if (a1)
  {
    v2 = objc_msgSend(a1, sel_loadBagValue_, v1[15]);
    v1[21] = v2;
    v1[7] = v1 + 23;
    v1[2] = v1;
    v1[3] = sub_2112418F0;
    v3 = swift_continuation_init();
    v1[10] = MEMORY[0x24BDAC760];
    v4 = v1 + 10;
    v4[1] = 0x40000000;
    v4[2] = sub_2111C8B3C;
    v4[3] = &block_descriptor_46;
    v4[4] = v3;
    objc_msgSend(v2, sel_resultWithCompletion_, v4);
    return swift_continuation_await();
  }
  else
  {
    OUTLINED_FUNCTION_62_1();
    v6 = OUTLINED_FUNCTION_61_1();
    return OUTLINED_FUNCTION_40_8(v6, v7);
  }
}

uint64_t sub_211241A4C(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  OUTLINED_FUNCTION_44_6(a1);
  *(_QWORD *)(v1 + 136) = OUTLINED_FUNCTION_51_3();
  v2 = OUTLINED_FUNCTION_2_23();
  OUTLINED_FUNCTION_65_1(v2, v3);
  return OUTLINED_FUNCTION_0_24();
}

void sub_211241A90()
{
  OUTLINED_FUNCTION_75_1();
}

uint64_t sub_211241AB8(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  id v4;
  uint64_t v5;
  _QWORD *v6;
  uint64_t v8;
  uint64_t (*v9)(void);

  v1[20] = a1;
  if (a1)
  {
    OUTLINED_FUNCTION_73_1();
    v3 = sub_211244D4C();
    v4 = OUTLINED_FUNCTION_0_12(v3, sel_loadRequest_);
    OUTLINED_FUNCTION_74_2((uint64_t)v4);
    v1[7] = v2;
    v5 = OUTLINED_FUNCTION_64_1((uint64_t)sub_211241B54);
    v1[10] = MEMORY[0x24BDAC760];
    v6 = v1 + 10;
    v6[1] = 0x40000000;
    v6[2] = sub_2111C8B3C;
    v6[3] = &block_descriptor_48;
    v6[4] = v5;
    OUTLINED_FUNCTION_2_19(v5, sel_resultWithCompletion_);
    return OUTLINED_FUNCTION_39_5();
  }
  else
  {
    OUTLINED_FUNCTION_62_1();
    v8 = OUTLINED_FUNCTION_61_1();
    return OUTLINED_FUNCTION_17_15(v8, v9);
  }
}

uint64_t sub_211241B54()
{
  OUTLINED_FUNCTION_15_22();
  return OUTLINED_FUNCTION_5_11();
}

uint64_t sub_211241B8C()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;

  v1 = *(void **)(v0 + 168);

  OUTLINED_FUNCTION_22();
  v2 = *(unsigned __int8 *)(v0 + 184);

  return OUTLINED_FUNCTION_17_15(v2, *(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_211241BD0()
{
  uint64_t v0;
  void *v1;
  void *v2;

  v1 = *(void **)(v0 + 168);
  v2 = *(void **)(v0 + 160);
  OUTLINED_FUNCTION_62_1();
  swift_willThrow();

  return OUTLINED_FUNCTION_40_8(0, *(uint64_t (**)(void))(v0 + 8));
}

uint64_t WebModel.deinit()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void (*v7)(uint64_t, uint64_t);
  uint64_t v8;
  uint64_t v9;

  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_254A9F930);
  OUTLINED_FUNCTION_0_1(v1);
  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_254A99E90);
  OUTLINED_FUNCTION_0_1(v2);
  v3 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_254A99CA0);
  OUTLINED_FUNCTION_0_1(v3);
  v4 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_254A99E80);
  OUTLINED_FUNCTION_0_1(v4);
  v5 = v0 + OBJC_IVAR____TtC20AppleMediaServicesUI8WebModel__clientOptions;
  v6 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_254A9F970);
  v7 = *(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 8);
  v7(v5, v6);
  v8 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_254A99A10);
  OUTLINED_FUNCTION_0_1(v8);
  v7(v0 + OBJC_IVAR____TtC20AppleMediaServicesUI8WebModel__metricsOverlay, v6);
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_254A99E78);
  OUTLINED_FUNCTION_0_1(v9);
  sub_2111C6444(*(_QWORD *)(v0 + OBJC_IVAR____TtC20AppleMediaServicesUI8WebModel_handlers), *(_QWORD *)(v0 + OBJC_IVAR____TtC20AppleMediaServicesUI8WebModel_handlers + 8), *(_QWORD *)(v0 + OBJC_IVAR____TtC20AppleMediaServicesUI8WebModel_handlers + 16), *(_QWORD *)(v0 + OBJC_IVAR____TtC20AppleMediaServicesUI8WebModel_handlers + 24), *(_QWORD *)(v0 + OBJC_IVAR____TtC20AppleMediaServicesUI8WebModel_handlers + 32), *(_QWORD *)(v0 + OBJC_IVAR____TtC20AppleMediaServicesUI8WebModel_handlers + 40), *(_QWORD *)(v0 + OBJC_IVAR____TtC20AppleMediaServicesUI8WebModel_handlers + 48), *(_QWORD *)(v0 + OBJC_IVAR____TtC20AppleMediaServicesUI8WebModel_handlers + 56), *(_QWORD *)(v0 + OBJC_IVAR____TtC20AppleMediaServicesUI8WebModel_handlers + 64), *(_QWORD *)(v0 + OBJC_IVAR____TtC20AppleMediaServicesUI8WebModel_handlers + 72), *(_QWORD *)(v0 + OBJC_IVAR____TtC20AppleMediaServicesUI8WebModel_handlers + 80));
  swift_unknownObjectWeakDestroy();
  return v0;
}

uint64_t WebModel.__deallocating_deinit()
{
  WebModel.deinit();
  return swift_deallocClassInstance();
}

uint64_t sub_211241D90@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  type metadata accessor for WebModel();
  result = sub_211245484();
  *a1 = result;
  return result;
}

uint64_t sub_211241DCC@<X0>(uint64_t *a1@<X0>, uint64_t (**a2)(uint64_t *a1, uint64_t *a2)@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t (*v6)(uint64_t *, uint64_t *);

  v3 = *a1;
  v4 = a1[1];
  if (*a1)
  {
    v5 = swift_allocObject();
    *(_QWORD *)(v5 + 16) = v3;
    *(_QWORD *)(v5 + 24) = v4;
    v6 = sub_211244364;
  }
  else
  {
    v6 = 0;
    v5 = 0;
  }
  *a2 = v6;
  a2[1] = (uint64_t (*)(uint64_t *, uint64_t *))v5;
  return sub_2111CA348(v3);
}

uint64_t sub_211241E30(uint64_t *a1, uint64_t *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t (*v6)(uint64_t, uint64_t, uint64_t);
  uint64_t v7;
  uint64_t result;

  v3 = *a1;
  v4 = a1[1];
  if (*a1)
  {
    v5 = swift_allocObject();
    *(_QWORD *)(v5 + 16) = v3;
    *(_QWORD *)(v5 + 24) = v4;
    v6 = sub_21124433C;
  }
  else
  {
    v6 = 0;
    v5 = 0;
  }
  v7 = *a2;
  sub_2111CA348(v3);
  result = sub_2111C64E4(v7);
  *a2 = (uint64_t)v6;
  a2[1] = v5;
  return result;
}

void WebModelHandlers.handleAuthenticateRequest.getter()
{
  OUTLINED_FUNCTION_27_5();
  OUTLINED_FUNCTION_11();
}

void WebModelHandlers.handleAuthenticateRequest.setter()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;

  OUTLINED_FUNCTION_46_1();
  sub_2111C64E4(*v1);
  *v1 = v2;
  v1[1] = v0;
  OUTLINED_FUNCTION_10();
}

uint64_t (*WebModelHandlers.handleAuthenticateRequest.modify())(_QWORD)
{
  return CGSizeMake;
}

uint64_t sub_211241F10@<X0>(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t (*v6)@<X0>(uint64_t *@<X0>, uint64_t *@<X1>, _BYTE *@<X8>);

  v3 = *(_QWORD *)(a1 + 16);
  v4 = *(_QWORD *)(a1 + 24);
  if (v3)
  {
    v5 = swift_allocObject();
    *(_QWORD *)(v5 + 16) = v3;
    *(_QWORD *)(v5 + 24) = v4;
    v6 = sub_211244334;
  }
  else
  {
    v6 = 0;
    v5 = 0;
  }
  *a2 = v6;
  a2[1] = v5;
  return sub_2111CA348(v3);
}

uint64_t sub_211241F74@<X0>(uint64_t *a1@<X0>, uint64_t *a2@<X1>, uint64_t (*a3)(uint64_t, uint64_t (*)(), uint64_t)@<X2>, _BYTE *a4@<X8>)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t result;

  v6 = *a1;
  v8 = *a2;
  v7 = a2[1];
  v9 = swift_allocObject();
  *(_QWORD *)(v9 + 16) = v8;
  *(_QWORD *)(v9 + 24) = v7;
  swift_retain();
  LOBYTE(a3) = a3(v6, sub_211244428, v9);
  result = swift_release();
  *a4 = a3 & 1;
  return result;
}

uint64_t sub_211242004(uint64_t *a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t (*v6)(uint64_t, uint64_t, uint64_t);
  uint64_t v7;
  uint64_t result;

  v3 = *a1;
  v4 = a1[1];
  if (*a1)
  {
    v5 = swift_allocObject();
    *(_QWORD *)(v5 + 16) = v3;
    *(_QWORD *)(v5 + 24) = v4;
    v6 = sub_21124432C;
  }
  else
  {
    v6 = 0;
    v5 = 0;
  }
  v7 = *(_QWORD *)(a2 + 16);
  sub_2111CA348(v3);
  result = sub_2111C64E4(v7);
  *(_QWORD *)(a2 + 16) = v6;
  *(_QWORD *)(a2 + 24) = v5;
  return result;
}

uint64_t sub_211242090(uint64_t a1, uint64_t a2, uint64_t a3, void (*a4)(unsigned __int8 *__return_ptr, uint64_t *, _QWORD *))
{
  uint64_t v7;
  unsigned __int8 v9;
  _QWORD v10[2];
  uint64_t v11;

  v11 = a1;
  v7 = swift_allocObject();
  *(_QWORD *)(v7 + 16) = a2;
  *(_QWORD *)(v7 + 24) = a3;
  v10[0] = sub_211244420;
  v10[1] = v7;
  swift_retain();
  a4(&v9, &v11, v10);
  swift_release();
  return v9;
}

void WebModelHandlers.handleDelegateAction.getter()
{
  OUTLINED_FUNCTION_27_5();
  OUTLINED_FUNCTION_11();
}

void WebModelHandlers.handleDelegateAction.setter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  OUTLINED_FUNCTION_46_1();
  sub_2111C64E4(*(_QWORD *)(v1 + 16));
  *(_QWORD *)(v1 + 16) = v2;
  *(_QWORD *)(v1 + 24) = v0;
  OUTLINED_FUNCTION_10();
}

uint64_t (*WebModelHandlers.handleDelegateAction.modify())(_QWORD)
{
  return CGSizeMake;
}

uint64_t sub_211242174@<X0>(uint64_t a1@<X0>, uint64_t (**a2)(uint64_t *a1, uint64_t *a2)@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t (*v6)(uint64_t *, uint64_t *);

  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  if (v3)
  {
    v5 = swift_allocObject();
    *(_QWORD *)(v5 + 16) = v3;
    *(_QWORD *)(v5 + 24) = v4;
    v6 = sub_211244304;
  }
  else
  {
    v6 = 0;
    v5 = 0;
  }
  *a2 = v6;
  a2[1] = (uint64_t (*)(uint64_t *, uint64_t *))v5;
  return sub_2111CA348(v3);
}

uint64_t sub_2112421D8(uint64_t *a1, uint64_t *a2, void (*a3)(uint64_t, uint64_t, uint64_t), uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v8 = *a1;
  v10 = *a2;
  v9 = a2[1];
  v11 = OUTLINED_FUNCTION_14_2();
  *(_QWORD *)(v11 + 16) = v10;
  *(_QWORD *)(v11 + 24) = v9;
  swift_retain();
  a3(v8, a6, v11);
  return OUTLINED_FUNCTION_29_9();
}

uint64_t sub_21124223C(uint64_t *a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t (*v6)(uint64_t, uint64_t, uint64_t);
  uint64_t v7;
  uint64_t result;

  v3 = *a1;
  v4 = a1[1];
  if (*a1)
  {
    v5 = swift_allocObject();
    *(_QWORD *)(v5 + 16) = v3;
    *(_QWORD *)(v5 + 24) = v4;
    v6 = sub_2112442B8;
  }
  else
  {
    v6 = 0;
    v5 = 0;
  }
  v7 = *(_QWORD *)(a2 + 32);
  sub_2111CA348(v3);
  result = sub_2111C64E4(v7);
  *(_QWORD *)(a2 + 32) = v6;
  *(_QWORD *)(a2 + 40) = v5;
  return result;
}

uint64_t sub_2112422C8(uint64_t a1, uint64_t a2, uint64_t a3, void (*a4)(uint64_t *, _QWORD *), uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v11;
  _QWORD v13[2];
  uint64_t v14;

  v14 = a1;
  v11 = OUTLINED_FUNCTION_14_2();
  *(_QWORD *)(v11 + 16) = a2;
  *(_QWORD *)(v11 + 24) = a3;
  v13[0] = a7;
  v13[1] = v11;
  swift_retain();
  a4(&v14, v13);
  return swift_release();
}

void WebModelHandlers.handleDialogRequest.getter()
{
  OUTLINED_FUNCTION_27_5();
  OUTLINED_FUNCTION_11();
}

void WebModelHandlers.handleDialogRequest.setter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  OUTLINED_FUNCTION_46_1();
  sub_2111C64E4(*(_QWORD *)(v1 + 32));
  *(_QWORD *)(v1 + 32) = v2;
  *(_QWORD *)(v1 + 40) = v0;
  OUTLINED_FUNCTION_10();
}

uint64_t (*WebModelHandlers.handleDialogRequest.modify())(_QWORD)
{
  return CGSizeMake;
}

uint64_t sub_211242394@<X0>(uint64_t a1@<X0>, uint64_t (**a2)(uint64_t *a1, uint64_t *a2, uint64_t *a3)@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t (*v6)(uint64_t *, uint64_t *, uint64_t *);

  v3 = *(_QWORD *)(a1 + 48);
  v4 = *(_QWORD *)(a1 + 56);
  if (v3)
  {
    v5 = swift_allocObject();
    *(_QWORD *)(v5 + 16) = v3;
    *(_QWORD *)(v5 + 24) = v4;
    v6 = sub_211244288;
  }
  else
  {
    v6 = 0;
    v5 = 0;
  }
  *a2 = v6;
  a2[1] = (uint64_t (*)(uint64_t *, uint64_t *, uint64_t *))v5;
  return sub_2111CA348(v3);
}

uint64_t sub_2112423F8(uint64_t *a1, uint64_t *a2, uint64_t *a3, void (*a4)(uint64_t, uint64_t, void (*)(uint64_t a1, uint64_t a2), uint64_t))
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v5 = *a1;
  v6 = *a2;
  v8 = *a3;
  v7 = a3[1];
  v9 = swift_allocObject();
  *(_QWORD *)(v9 + 16) = v8;
  *(_QWORD *)(v9 + 24) = v7;
  swift_retain();
  a4(v5, v6, sub_211244290, v9);
  return swift_release();
}

uint64_t sub_21124247C(uint64_t *a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t (*v6)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v7;
  uint64_t result;

  v3 = *a1;
  v4 = a1[1];
  if (*a1)
  {
    v5 = swift_allocObject();
    *(_QWORD *)(v5 + 16) = v3;
    *(_QWORD *)(v5 + 24) = v4;
    v6 = sub_211244260;
  }
  else
  {
    v6 = 0;
    v5 = 0;
  }
  v7 = *(_QWORD *)(a2 + 48);
  sub_2111CA348(v3);
  result = sub_2111C64E4(v7);
  *(_QWORD *)(a2 + 48) = v6;
  *(_QWORD *)(a2 + 56) = v5;
  return result;
}

uint64_t sub_211242508(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void (*a5)(uint64_t *, uint64_t *, _QWORD *))
{
  uint64_t v8;
  _QWORD v10[2];
  uint64_t v11;
  uint64_t v12;

  v11 = a2;
  v12 = a1;
  v8 = swift_allocObject();
  *(_QWORD *)(v8 + 16) = a3;
  *(_QWORD *)(v8 + 24) = a4;
  v10[0] = sub_211244268;
  v10[1] = v8;
  swift_retain();
  a5(&v12, &v11, v10);
  return swift_release();
}

void WebModelHandlers.didResolveWithResult.getter()
{
  OUTLINED_FUNCTION_27_5();
  OUTLINED_FUNCTION_11();
}

void WebModelHandlers.didResolveWithResult.setter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  OUTLINED_FUNCTION_46_1();
  sub_2111C64E4(*(_QWORD *)(v1 + 48));
  *(_QWORD *)(v1 + 48) = v2;
  *(_QWORD *)(v1 + 56) = v0;
  OUTLINED_FUNCTION_10();
}

uint64_t (*WebModelHandlers.didResolveWithResult.modify())(_QWORD)
{
  return CGSizeMake;
}

uint64_t sub_2112425E4@<X0>(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void (*v6)(_QWORD *);

  v3 = *(_QWORD *)(a1 + 64);
  v4 = *(_QWORD *)(a1 + 72);
  if (v3)
  {
    v5 = swift_allocObject();
    *(_QWORD *)(v5 + 16) = v3;
    *(_QWORD *)(v5 + 24) = v4;
    v6 = sub_211244240;
  }
  else
  {
    v6 = 0;
    v5 = 0;
  }
  *a2 = v6;
  a2[1] = v5;
  return sub_2111CA348(v3);
}

uint64_t sub_211242648(uint64_t *a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void (*v6)(uint64_t);
  uint64_t v7;
  uint64_t result;

  v3 = *a1;
  v4 = a1[1];
  if (*a1)
  {
    v5 = swift_allocObject();
    *(_QWORD *)(v5 + 16) = v3;
    *(_QWORD *)(v5 + 24) = v4;
    v6 = sub_211244218;
  }
  else
  {
    v6 = 0;
    v5 = 0;
  }
  v7 = *(_QWORD *)(a2 + 64);
  sub_2111CA348(v3);
  result = sub_2111C64E4(v7);
  *(_QWORD *)(a2 + 64) = v6;
  *(_QWORD *)(a2 + 72) = v5;
  return result;
}

void WebModelHandlers.didEncodeNetworkRequest.getter()
{
  OUTLINED_FUNCTION_27_5();
  OUTLINED_FUNCTION_11();
}

void WebModelHandlers.didEncodeNetworkRequest.setter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  OUTLINED_FUNCTION_46_1();
  sub_2111C64E4(*(_QWORD *)(v1 + 64));
  *(_QWORD *)(v1 + 64) = v2;
  *(_QWORD *)(v1 + 72) = v0;
  OUTLINED_FUNCTION_10();
}

uint64_t (*WebModelHandlers.didEncodeNetworkRequest.modify())(_QWORD)
{
  return CGSizeMake;
}

uint64_t sub_211242728@<X0>(uint64_t a1@<X0>, uint64_t (**a2)()@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t (*v6)();

  v3 = *(_QWORD *)(a1 + 80);
  v4 = *(_QWORD *)(a1 + 88);
  if (v3)
  {
    v5 = swift_allocObject();
    *(_QWORD *)(v5 + 16) = v3;
    *(_QWORD *)(v5 + 24) = v4;
    v6 = sub_211244424;
  }
  else
  {
    v6 = 0;
    v5 = 0;
  }
  *a2 = v6;
  a2[1] = (uint64_t (*)())v5;
  return sub_2111CA348(v3);
}

uint64_t sub_21124278C(uint64_t *a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t (*v6)();
  uint64_t v7;
  uint64_t result;

  v3 = *a1;
  v4 = a1[1];
  if (*a1)
  {
    v5 = swift_allocObject();
    *(_QWORD *)(v5 + 16) = v3;
    *(_QWORD *)(v5 + 24) = v4;
    v6 = sub_2112441F0;
  }
  else
  {
    v6 = 0;
    v5 = 0;
  }
  v7 = *(_QWORD *)(a2 + 80);
  sub_2111CA348(v3);
  result = sub_2111C64E4(v7);
  *(_QWORD *)(a2 + 80) = v6;
  *(_QWORD *)(a2 + 88) = v5;
  return result;
}

void WebModelHandlers.didFinishPurchaseWith.getter()
{
  OUTLINED_FUNCTION_27_5();
  OUTLINED_FUNCTION_11();
}

void WebModelHandlers.didFinishPurchaseWith.setter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  OUTLINED_FUNCTION_46_1();
  sub_2111C64E4(*(_QWORD *)(v1 + 80));
  *(_QWORD *)(v1 + 80) = v2;
  *(_QWORD *)(v1 + 88) = v0;
  OUTLINED_FUNCTION_10();
}

uint64_t (*WebModelHandlers.didFinishPurchaseWith.modify())(_QWORD)
{
  return CGSizeMake;
}

__n128 WebModelHandlers.init(handleAuthenticateRequest:handleDelegateAction:handleDialogRequest:didResolveWithResult:didEncodeNetworkRequest:didFinishPurchaseWith:)@<Q0>(unint64_t a1@<X0>, unint64_t a2@<X1>, unint64_t a3@<X2>, unint64_t a4@<X3>, unint64_t a5@<X4>, unint64_t a6@<X5>, unint64_t a7@<X6>, unint64_t a8@<X7>, __n128 *a9@<X8>, __n128 a10, unint64_t a11, unint64_t a12)
{
  __n128 result;

  result = a10;
  a9->n128_u64[0] = a1;
  a9->n128_u64[1] = a2;
  a9[1].n128_u64[0] = a3;
  a9[1].n128_u64[1] = a4;
  a9[2].n128_u64[0] = a5;
  a9[2].n128_u64[1] = a6;
  a9[3].n128_u64[0] = a7;
  a9[3].n128_u64[1] = a8;
  a9[4] = a10;
  a9[5].n128_u64[0] = a11;
  a9[5].n128_u64[1] = a12;
  return result;
}

uint64_t sub_211242890(uint64_t a1, void *a2, void *a3, void *a4, void *a5, int a6, uint64_t a7, uint64_t *a8)
{
  uint64_t v17;

  type metadata accessor for WebModel();
  v17 = swift_allocObject();
  return sub_211242BDC(a1, a2, a3, a4, a5, a6, a7, a8, v17);
}

uint64_t type metadata accessor for WebModel()
{
  uint64_t result;

  result = qword_254A9FAD8;
  if (!qword_254A9FAD8)
    return swift_getSingletonMetadata();
  return result;
}

unint64_t sub_21124295C()
{
  unint64_t result;
  uint64_t v1;

  result = qword_254A9F910;
  if (!qword_254A9F910)
  {
    v1 = type metadata accessor for WebModel();
    result = MEMORY[0x212BD7970](&protocol conformance descriptor for WebModel, v1);
    atomic_store(result, (unint64_t *)&qword_254A9F910);
  }
  return result;
}

unint64_t sub_21124299C()
{
  unint64_t result;

  result = qword_254A9A5D0;
  if (!qword_254A9A5D0)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_254A9A5D0);
  }
  return result;
}

uint64_t type metadata accessor for WebView.Coordinator()
{
  return objc_opt_self();
}

void sub_2112429F8()
{
  _QWORD *v0;
  uint64_t v1;

  OUTLINED_FUNCTION_21_5();
  sub_211240810();
  *v0 = v1;
  OUTLINED_FUNCTION_11();
}

void sub_211242A1C()
{
  _QWORD *v0;
  uint64_t v1;

  OUTLINED_FUNCTION_21_5();
  sub_2112409F4();
  *v0 = v1;
  OUTLINED_FUNCTION_11();
}

void sub_211242A40()
{
  _QWORD *v0;
  uint64_t v1;

  OUTLINED_FUNCTION_21_5();
  sub_211240B60();
  *v0 = v1;
  OUTLINED_FUNCTION_11();
}

void sub_211242A64()
{
  _QWORD *v0;
  uint64_t v1;

  OUTLINED_FUNCTION_21_5();
  sub_211240CCC();
  *v0 = v1;
  OUTLINED_FUNCTION_11();
}

void sub_211242A88()
{
  _QWORD *v0;
  uint64_t v1;

  OUTLINED_FUNCTION_21_5();
  sub_211240E38();
  *v0 = v1;
  OUTLINED_FUNCTION_11();
}

void sub_211242AAC()
{
  _BYTE *v0;

  OUTLINED_FUNCTION_21_5();
  *v0 = sub_211240FA0() & 1;
  OUTLINED_FUNCTION_11();
}

void sub_211242AD0()
{
  sub_211240FFC();
  OUTLINED_FUNCTION_11();
}

void sub_211242AF0()
{
  _QWORD *v0;
  uint64_t v1;

  OUTLINED_FUNCTION_21_5();
  sub_211241190();
  *v0 = v1;
  OUTLINED_FUNCTION_11();
}

void sub_211242B14()
{
  uint64_t v0;
  char v1;

  OUTLINED_FUNCTION_21_5();
  *(_QWORD *)v0 = sub_2112413C4();
  *(_BYTE *)(v0 + 8) = v1;
  OUTLINED_FUNCTION_11();
}

uint64_t sub_211242B3C(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11)
{
  if (result != 1)
  {
    sub_2111CA348(result);
    sub_2111CA348(a3);
    sub_2111CA348(a5);
    sub_2111CA348(a7);
    sub_2111CA348(a9);
    return sub_2111CA348(a11);
  }
  return result;
}

uint64_t sub_211242BDC(uint64_t a1, void *a2, void *a3, void *a4, void *a5, int a6, uint64_t a7, uint64_t *a8, uint64_t a9)
{
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  char *v15;
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
  uint64_t v27;
  uint64_t v28;
  void (*v29)(uint64_t, char *, uint64_t);
  uint64_t v30;
  uint64_t v31;
  char *v32;
  uint64_t v33;
  uint64_t v34;
  char *v35;
  uint64_t v36;
  id v37;
  id v38;
  id v39;
  id v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  __int128 v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
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
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  __int128 v68;
  uint64_t v69;
  __int128 v70;
  uint64_t v71;
  __int128 v72;
  uint64_t v73;
  uint64_t v74;
  id v75;
  id v76;
  id v77;
  id v78;
  int v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  char v83;

  v80 = a7;
  v79 = a6;
  v77 = a4;
  v78 = a5;
  v75 = a2;
  v76 = a3;
  v65 = a1;
  v64 = __swift_instantiateConcreteTypeFromMangledName(&qword_254A99E78);
  v63 = *(_QWORD *)(v64 - 8);
  MEMORY[0x24BDAC7A8](v64);
  v62 = (char *)&v54 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v61 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_254A99A10);
  v60 = *(_QWORD *)(v61 - 8);
  MEMORY[0x24BDAC7A8](v61);
  v59 = (char *)&v54 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v58 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_254A9F970);
  v57 = *(_QWORD *)(v58 - 8);
  MEMORY[0x24BDAC7A8](v58);
  v13 = (char *)&v54 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v56 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_254A99E80);
  v55 = *(_QWORD *)(v56 - 8);
  MEMORY[0x24BDAC7A8](v56);
  v15 = (char *)&v54 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_254A99CA0);
  v17 = *(_QWORD *)(v16 - 8);
  MEMORY[0x24BDAC7A8](v16);
  v19 = (char *)&v54 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_254A99E90);
  v21 = *(_QWORD *)(v20 - 8);
  MEMORY[0x24BDAC7A8](v20);
  v23 = (char *)&v54 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  v24 = *a8;
  v73 = a8[1];
  v74 = v24;
  v72 = *((_OWORD *)a8 + 1);
  v71 = a8[4];
  v70 = *(_OWORD *)(a8 + 5);
  v69 = a8[7];
  v68 = *((_OWORD *)a8 + 4);
  v67 = a8[10];
  v66 = a8[11];
  v25 = a9 + OBJC_IVAR____TtC20AppleMediaServicesUI8WebModel__account;
  v82 = 0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_254A99E98);
  sub_211245490();
  (*(void (**)(uint64_t, char *, uint64_t))(v21 + 32))(v25, v23, v20);
  v26 = a9 + OBJC_IVAR____TtC20AppleMediaServicesUI8WebModel__clientInfo;
  v82 = 0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_254A99EA0);
  sub_211245490();
  (*(void (**)(uint64_t, char *, uint64_t))(v17 + 32))(v26, v19, v16);
  v27 = a9 + OBJC_IVAR____TtC20AppleMediaServicesUI8WebModel__appearance;
  v82 = 0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_254A99EA8);
  sub_211245490();
  (*(void (**)(uint64_t, char *, uint64_t))(v55 + 32))(v27, v15, v56);
  v28 = a9 + OBJC_IVAR____TtC20AppleMediaServicesUI8WebModel__clientOptions;
  v82 = 0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_254A99CD0);
  sub_211245490();
  v29 = *(void (**)(uint64_t, char *, uint64_t))(v57 + 32);
  v30 = v58;
  v29(v28, v13, v58);
  v31 = a9 + OBJC_IVAR____TtC20AppleMediaServicesUI8WebModel__loadUsingWebKit;
  LOBYTE(v82) = 0;
  v32 = v59;
  sub_211245490();
  (*(void (**)(uint64_t, char *, uint64_t))(v60 + 32))(v31, v32, v61);
  v33 = a9 + OBJC_IVAR____TtC20AppleMediaServicesUI8WebModel__metricsOverlay;
  v82 = 0;
  sub_211245490();
  v29(v33, v13, v30);
  v34 = a9 + OBJC_IVAR____TtC20AppleMediaServicesUI8WebModel__resolveResult;
  v82 = 0;
  v83 = -1;
  __swift_instantiateConcreteTypeFromMangledName(qword_254A9FB30);
  v35 = v62;
  sub_211245490();
  (*(void (**)(uint64_t, char *, uint64_t))(v63 + 32))(v34, v35, v64);
  v36 = a9 + OBJC_IVAR____TtC20AppleMediaServicesUI8WebModel_handlers;
  *(_QWORD *)v36 = 1;
  *(_OWORD *)(v36 + 8) = 0u;
  *(_OWORD *)(v36 + 24) = 0u;
  *(_OWORD *)(v36 + 40) = 0u;
  *(_OWORD *)(v36 + 56) = 0u;
  *(_OWORD *)(v36 + 72) = 0u;
  *(_QWORD *)(v36 + 88) = 0;
  swift_unknownObjectWeakInit();
  swift_beginAccess();
  v81 = v65;
  swift_unknownObjectRetain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_254A99EB0);
  sub_211245490();
  swift_endAccess();
  v37 = v75;
  sub_211240A08();
  v38 = v76;
  sub_211240B74();
  v39 = v77;
  sub_211240CE0();
  v40 = v78;
  sub_211240E4C();
  sub_211240FFC();
  sub_2112411F8();
  swift_unknownObjectRelease();

  swift_beginAccess();
  v41 = *(_QWORD *)v36;
  v42 = *(_QWORD *)(v36 + 8);
  v43 = *(_QWORD *)(v36 + 16);
  v44 = *(_QWORD *)(v36 + 24);
  v45 = *(_QWORD *)(v36 + 32);
  v46 = *(_QWORD *)(v36 + 40);
  v47 = *(_QWORD *)(v36 + 48);
  v48 = *(_QWORD *)(v36 + 56);
  v49 = *(_OWORD *)(v36 + 64);
  v50 = *(_QWORD *)(v36 + 80);
  v51 = v73;
  *(_QWORD *)v36 = v74;
  *(_QWORD *)(v36 + 8) = v51;
  *(_OWORD *)(v36 + 16) = v72;
  *(_QWORD *)(v36 + 32) = v71;
  *(_OWORD *)(v36 + 40) = v70;
  *(_QWORD *)(v36 + 56) = v69;
  *(_OWORD *)(v36 + 64) = v68;
  v52 = v66;
  *(_QWORD *)(v36 + 80) = v67;
  *(_QWORD *)(v36 + 88) = v52;
  sub_2111C6444(v41, v42, v43, v44, v45, v46, v47, v48, v49, *((uint64_t *)&v49 + 1), v50);
  return a9;
}

unint64_t sub_2112431D4()
{
  unint64_t result;

  result = qword_254A9F9D0;
  if (!qword_254A9F9D0)
  {
    result = MEMORY[0x212BD7970](&protocol conformance descriptor for WebView, &type metadata for WebView);
    atomic_store(result, (unint64_t *)&qword_254A9F9D0);
  }
  return result;
}

unint64_t sub_211243210(uint64_t a1)
{
  unint64_t result;

  result = sub_211243234();
  *(_QWORD *)(a1 + 8) = result;
  return result;
}

unint64_t sub_211243234()
{
  unint64_t result;

  result = qword_254A9FA10;
  if (!qword_254A9FA10)
  {
    result = MEMORY[0x212BD7970](&protocol conformance descriptor for WebView, &type metadata for WebView);
    atomic_store(result, (unint64_t *)&qword_254A9FA10);
  }
  return result;
}

unint64_t sub_211243274()
{
  unint64_t result;

  result = qword_254A9FA18;
  if (!qword_254A9FA18)
  {
    result = MEMORY[0x212BD7970](&protocol conformance descriptor for WebView, &type metadata for WebView);
    atomic_store(result, (unint64_t *)&qword_254A9FA18);
  }
  return result;
}

void sub_2112432B8()
{
  sub_2112408FC();
  OUTLINED_FUNCTION_11();
}

void sub_2112432D4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  sub_2111D94D8(a1, a2, a3, a4, &qword_254A9F938, sub_211240910);
}

void sub_2112432F8()
{
  sub_211240A68();
  OUTLINED_FUNCTION_11();
}

void sub_211243314(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  sub_2111D94D8(a1, a2, a3, a4, (uint64_t *)&unk_254A9B690, sub_211240A7C);
}

void sub_211243338()
{
  sub_211240BD4();
  OUTLINED_FUNCTION_11();
}

void sub_211243354(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  sub_2111D94D8(a1, a2, a3, a4, (uint64_t *)&unk_254A9B6A0, sub_211240BE8);
}

void sub_211243378()
{
  sub_211240D40();
  OUTLINED_FUNCTION_11();
}

void sub_211243394(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  sub_2111D94D8(a1, a2, a3, a4, &qword_254A9F960, sub_211240D54);
}

void sub_2112433B8()
{
  sub_211240EAC();
  OUTLINED_FUNCTION_11();
}

void sub_2112433D4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  sub_2111D94D8(a1, a2, a3, a4, (uint64_t *)&unk_254A99CC0, sub_211240EC0);
}

void sub_2112433F8()
{
  sub_211241098();
  OUTLINED_FUNCTION_11();
}

void sub_211243414(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  sub_2111D94D8(a1, a2, a3, a4, &qword_254A9F990, sub_2112410AC);
}

void sub_211243438()
{
  sub_2112412B0();
  OUTLINED_FUNCTION_11();
}

void sub_211243454(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  sub_2111D94D8(a1, a2, a3, a4, (uint64_t *)&unk_254A99CC0, sub_2112412C4);
}

void sub_211243478()
{
  sub_2112414D8();
  OUTLINED_FUNCTION_11();
}

void sub_211243494(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  sub_2111D94D8(a1, a2, a3, a4, &qword_254A9F9B0, sub_2112414EC);
}

_QWORD *assignWithCopy for WebView(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_retain();
  swift_release();
  return a1;
}

_QWORD *assignWithTake for WebView(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_release();
  return a1;
}

ValueMetadata *type metadata accessor for WebView()
{
  return &type metadata for WebView;
}

uint64_t method lookup function for WebView.Coordinator()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of WebView.Coordinator.webViewController(_:handle:completion:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x78))();
}

{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x88))();
}

uint64_t dispatch thunk of WebView.Coordinator.webViewController(_:handleDelegateAction:completion:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x80))();
}

uint64_t dispatch thunk of WebView.Coordinator.webViewController(_:didResolveWithResult:error:completion:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x90))();
}

uint64_t dispatch thunk of WebView.Coordinator.webViewController(_:didEncodeNetworkRequest:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x98))();
}

uint64_t dispatch thunk of WebView.Coordinator.webViewController(_:didFinishPurchaseWith:error:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xA0))();
}

uint64_t sub_211243624()
{
  return type metadata accessor for WebModel();
}

void sub_21124362C()
{
  unint64_t v0;
  unint64_t v1;
  unint64_t v2;
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;

  sub_2111E53DC(319, (unint64_t *)&unk_254A9FB00, &qword_254A99EB0);
  if (v0 <= 0x3F)
  {
    sub_2111E53DC(319, (unint64_t *)&unk_254A9B790, &qword_254A99E98);
    if (v1 <= 0x3F)
    {
      sub_2111E53DC(319, qword_254A99D60, &qword_254A99EA0);
      if (v2 <= 0x3F)
      {
        sub_2111E53DC(319, (unint64_t *)&unk_254A9FB10, &qword_254A99EA8);
        if (v3 <= 0x3F)
        {
          sub_2111E53DC(319, &qword_254A9FB20, &qword_254A99CD0);
          if (v4 <= 0x3F)
          {
            sub_2111E5394();
            if (v5 <= 0x3F)
            {
              sub_2111E53DC(319, &qword_254A9FB28, qword_254A9FB30);
              if (v6 <= 0x3F)
                swift_updateClassMetadata2();
            }
          }
        }
      }
    }
  }
}

uint64_t method lookup function for WebModel()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of WebModel.bag.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 160))();
}

uint64_t dispatch thunk of WebModel.bag.setter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 168))();
}

uint64_t dispatch thunk of WebModel.bag.modify()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 176))();
}

uint64_t dispatch thunk of WebModel.$bag.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 184))();
}

uint64_t dispatch thunk of WebModel.$bag.setter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 192))();
}

uint64_t dispatch thunk of WebModel.$bag.modify()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 200))();
}

uint64_t dispatch thunk of WebModel.account.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 208))();
}

uint64_t dispatch thunk of WebModel.account.setter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 216))();
}

uint64_t dispatch thunk of WebModel.account.modify()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 224))();
}

uint64_t dispatch thunk of WebModel.$account.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 232))();
}

uint64_t dispatch thunk of WebModel.$account.setter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 240))();
}

uint64_t dispatch thunk of WebModel.$account.modify()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 248))();
}

uint64_t dispatch thunk of WebModel.clientInfo.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 256))();
}

uint64_t dispatch thunk of WebModel.clientInfo.setter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 264))();
}

uint64_t dispatch thunk of WebModel.clientInfo.modify()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 272))();
}

uint64_t dispatch thunk of WebModel.$clientInfo.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 280))();
}

uint64_t dispatch thunk of WebModel.$clientInfo.setter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 288))();
}

uint64_t dispatch thunk of WebModel.$clientInfo.modify()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 296))();
}

uint64_t dispatch thunk of WebModel.appearance.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 304))();
}

uint64_t dispatch thunk of WebModel.appearance.setter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 312))();
}

uint64_t dispatch thunk of WebModel.appearance.modify()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 320))();
}

uint64_t dispatch thunk of WebModel.$appearance.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 328))();
}

uint64_t dispatch thunk of WebModel.$appearance.setter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 336))();
}

uint64_t dispatch thunk of WebModel.$appearance.modify()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 344))();
}

uint64_t dispatch thunk of WebModel.clientOptions.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 352))();
}

uint64_t dispatch thunk of WebModel.clientOptions.setter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 360))();
}

uint64_t dispatch thunk of WebModel.clientOptions.modify()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 368))();
}

uint64_t dispatch thunk of WebModel.$clientOptions.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 376))();
}

uint64_t dispatch thunk of WebModel.$clientOptions.setter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 384))();
}

uint64_t dispatch thunk of WebModel.$clientOptions.modify()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 392))();
}

uint64_t dispatch thunk of WebModel.loadUsingWebKit.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 400))();
}

uint64_t dispatch thunk of WebModel.loadUsingWebKit.setter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 408))();
}

uint64_t dispatch thunk of WebModel.loadUsingWebKit.modify()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 416))();
}

uint64_t dispatch thunk of WebModel.$loadUsingWebKit.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 424))();
}

uint64_t dispatch thunk of WebModel.$loadUsingWebKit.setter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 432))();
}

uint64_t dispatch thunk of WebModel.$loadUsingWebKit.modify()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 440))();
}

uint64_t dispatch thunk of WebModel.metricsOverlay.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 448))();
}

uint64_t dispatch thunk of WebModel.metricsOverlay.setter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 456))();
}

uint64_t dispatch thunk of WebModel.metricsOverlay.modify()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 464))();
}

uint64_t dispatch thunk of WebModel.$metricsOverlay.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 472))();
}

uint64_t dispatch thunk of WebModel.$metricsOverlay.setter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 480))();
}

uint64_t dispatch thunk of WebModel.$metricsOverlay.modify()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 488))();
}

uint64_t dispatch thunk of WebModel.resolveResult.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 496))();
}

uint64_t dispatch thunk of WebModel.resolveResult.setter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 504))();
}

uint64_t dispatch thunk of WebModel.resolveResult.modify()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 512))();
}

uint64_t dispatch thunk of WebModel.$resolveResult.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 520))();
}

uint64_t dispatch thunk of WebModel.$resolveResult.setter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 528))();
}

uint64_t dispatch thunk of WebModel.$resolveResult.modify()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 536))();
}

uint64_t dispatch thunk of WebModel.handlers.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 544))();
}

uint64_t dispatch thunk of WebModel.handlers.setter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 552))();
}

uint64_t dispatch thunk of WebModel.handlers.modify()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 560))();
}

uint64_t dispatch thunk of WebModel.__allocating_init(bag:account:clientInfo:appearance:clientOptions:loadUsingWebKit:metricsOverlay:handlers:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 592))();
}

uint64_t dispatch thunk of WebModel.loadURL(_:)()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t (*v3)(void);

  v1 = (_QWORD *)OUTLINED_FUNCTION_24_9();
  *(_QWORD *)(v0 + 16) = v1;
  v2 = OUTLINED_FUNCTION_41_9(v1, (uint64_t)sub_21124442C);
  return OUTLINED_FUNCTION_20_16(v2, v3);
}

uint64_t dispatch thunk of WebModel.loadBagValue(_:)()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t (*v3)(void);

  v1 = (_QWORD *)OUTLINED_FUNCTION_24_9();
  *(_QWORD *)(v0 + 16) = v1;
  v2 = OUTLINED_FUNCTION_41_9(v1, (uint64_t)sub_21124442C);
  return OUTLINED_FUNCTION_20_16(v2, v3);
}

uint64_t dispatch thunk of WebModel.loadRequest(_:)()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t (*v3)(void);

  v1 = (_QWORD *)OUTLINED_FUNCTION_24_9();
  *(_QWORD *)(v0 + 16) = v1;
  v2 = OUTLINED_FUNCTION_41_9(v1, (uint64_t)sub_211243AE8);
  return OUTLINED_FUNCTION_20_16(v2, v3);
}

uint64_t sub_211243AE8(uint64_t a1)
{
  uint64_t *v1;
  uint64_t v4;

  v4 = *v1;
  swift_task_dealloc();
  return OUTLINED_FUNCTION_17_15(a1, *(uint64_t (**)(void))(v4 + 8));
}

_QWORD *destroy for WebModelHandlers(_QWORD *result)
{
  _QWORD *v1;

  v1 = result;
  if (*result)
    result = (_QWORD *)swift_release();
  if (v1[2])
    result = (_QWORD *)swift_release();
  if (v1[4])
    result = (_QWORD *)swift_release();
  if (v1[6])
    result = (_QWORD *)swift_release();
  if (v1[8])
    result = (_QWORD *)swift_release();
  if (v1[10])
    return (_QWORD *)swift_release();
  return result;
}

_QWORD *initializeWithCopy for WebModelHandlers(_QWORD *a1, _QWORD *a2)
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

  if (*a2)
  {
    v4 = a2[1];
    *a1 = *a2;
    a1[1] = v4;
    swift_retain();
  }
  else
  {
    *(_OWORD *)a1 = *(_OWORD *)a2;
  }
  v5 = a2[2];
  if (v5)
  {
    v6 = a2[3];
    a1[2] = v5;
    a1[3] = v6;
    swift_retain();
  }
  else
  {
    *((_OWORD *)a1 + 1) = *((_OWORD *)a2 + 1);
  }
  v7 = a2[4];
  if (v7)
  {
    v8 = a2[5];
    a1[4] = v7;
    a1[5] = v8;
    swift_retain();
  }
  else
  {
    *((_OWORD *)a1 + 2) = *((_OWORD *)a2 + 2);
  }
  v9 = a2[6];
  if (v9)
  {
    v10 = a2[7];
    a1[6] = v9;
    a1[7] = v10;
    swift_retain();
  }
  else
  {
    *((_OWORD *)a1 + 3) = *((_OWORD *)a2 + 3);
  }
  v11 = a2[8];
  if (v11)
  {
    v12 = a2[9];
    a1[8] = v11;
    a1[9] = v12;
    swift_retain();
  }
  else
  {
    *((_OWORD *)a1 + 4) = *((_OWORD *)a2 + 4);
  }
  v13 = a2[10];
  if (v13)
  {
    v14 = a2[11];
    a1[10] = v13;
    a1[11] = v14;
    swift_retain();
  }
  else
  {
    *((_OWORD *)a1 + 5) = *((_OWORD *)a2 + 5);
  }
  return a1;
}

_QWORD *assignWithCopy for WebModelHandlers(_QWORD *a1, _QWORD *a2)
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
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;

  v4 = *a2;
  if (*a1)
  {
    if (v4)
    {
      v5 = a2[1];
      *a1 = v4;
      a1[1] = v5;
      swift_retain();
      swift_release();
      goto LABEL_8;
    }
    swift_release();
  }
  else if (v4)
  {
    v6 = a2[1];
    *a1 = v4;
    a1[1] = v6;
    swift_retain();
    goto LABEL_8;
  }
  *(_OWORD *)a1 = *(_OWORD *)a2;
LABEL_8:
  v7 = a2[2];
  if (a1[2])
  {
    if (v7)
    {
      v8 = a2[3];
      a1[2] = v7;
      a1[3] = v8;
      swift_retain();
      swift_release();
      goto LABEL_15;
    }
    swift_release();
  }
  else if (v7)
  {
    v9 = a2[3];
    a1[2] = v7;
    a1[3] = v9;
    swift_retain();
    goto LABEL_15;
  }
  *((_OWORD *)a1 + 1) = *((_OWORD *)a2 + 1);
LABEL_15:
  v10 = a2[4];
  if (a1[4])
  {
    if (v10)
    {
      v11 = a2[5];
      a1[4] = v10;
      a1[5] = v11;
      swift_retain();
      swift_release();
      goto LABEL_22;
    }
    swift_release();
  }
  else if (v10)
  {
    v12 = a2[5];
    a1[4] = v10;
    a1[5] = v12;
    swift_retain();
    goto LABEL_22;
  }
  *((_OWORD *)a1 + 2) = *((_OWORD *)a2 + 2);
LABEL_22:
  v13 = a2[6];
  if (a1[6])
  {
    if (v13)
    {
      v14 = a2[7];
      a1[6] = v13;
      a1[7] = v14;
      swift_retain();
      swift_release();
      goto LABEL_29;
    }
    swift_release();
  }
  else if (v13)
  {
    v15 = a2[7];
    a1[6] = v13;
    a1[7] = v15;
    swift_retain();
    goto LABEL_29;
  }
  *((_OWORD *)a1 + 3) = *((_OWORD *)a2 + 3);
LABEL_29:
  v16 = a2[8];
  if (a1[8])
  {
    if (v16)
    {
      v17 = a2[9];
      a1[8] = v16;
      a1[9] = v17;
      swift_retain();
      swift_release();
      goto LABEL_36;
    }
    swift_release();
  }
  else if (v16)
  {
    v18 = a2[9];
    a1[8] = v16;
    a1[9] = v18;
    swift_retain();
    goto LABEL_36;
  }
  *((_OWORD *)a1 + 4) = *((_OWORD *)a2 + 4);
LABEL_36:
  v19 = a2[10];
  if (!a1[10])
  {
    if (v19)
    {
      v21 = a2[11];
      a1[10] = v19;
      a1[11] = v21;
      swift_retain();
      return a1;
    }
LABEL_42:
    *((_OWORD *)a1 + 5) = *((_OWORD *)a2 + 5);
    return a1;
  }
  if (!v19)
  {
    swift_release();
    goto LABEL_42;
  }
  v20 = a2[11];
  a1[10] = v19;
  a1[11] = v20;
  swift_retain();
  swift_release();
  return a1;
}

_QWORD *assignWithTake for WebModelHandlers(_QWORD *a1, _QWORD *a2)
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
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;

  v4 = *a2;
  if (*a1)
  {
    if (v4)
    {
      v5 = a2[1];
      *a1 = v4;
      a1[1] = v5;
      swift_release();
      goto LABEL_8;
    }
    swift_release();
  }
  else if (v4)
  {
    v6 = a2[1];
    *a1 = v4;
    a1[1] = v6;
    goto LABEL_8;
  }
  *(_OWORD *)a1 = *(_OWORD *)a2;
LABEL_8:
  v7 = a2[2];
  if (a1[2])
  {
    if (v7)
    {
      v8 = a2[3];
      a1[2] = v7;
      a1[3] = v8;
      swift_release();
      goto LABEL_15;
    }
    swift_release();
  }
  else if (v7)
  {
    v9 = a2[3];
    a1[2] = v7;
    a1[3] = v9;
    goto LABEL_15;
  }
  *((_OWORD *)a1 + 1) = *((_OWORD *)a2 + 1);
LABEL_15:
  v10 = a2[4];
  if (a1[4])
  {
    if (v10)
    {
      v11 = a2[5];
      a1[4] = v10;
      a1[5] = v11;
      swift_release();
      goto LABEL_22;
    }
    swift_release();
  }
  else if (v10)
  {
    v12 = a2[5];
    a1[4] = v10;
    a1[5] = v12;
    goto LABEL_22;
  }
  *((_OWORD *)a1 + 2) = *((_OWORD *)a2 + 2);
LABEL_22:
  v13 = a2[6];
  if (a1[6])
  {
    if (v13)
    {
      v14 = a2[7];
      a1[6] = v13;
      a1[7] = v14;
      swift_release();
      goto LABEL_29;
    }
    swift_release();
  }
  else if (v13)
  {
    v15 = a2[7];
    a1[6] = v13;
    a1[7] = v15;
    goto LABEL_29;
  }
  *((_OWORD *)a1 + 3) = *((_OWORD *)a2 + 3);
LABEL_29:
  v16 = a2[8];
  if (a1[8])
  {
    if (v16)
    {
      v17 = a2[9];
      a1[8] = v16;
      a1[9] = v17;
      swift_release();
      goto LABEL_36;
    }
    swift_release();
  }
  else if (v16)
  {
    v18 = a2[9];
    a1[8] = v16;
    a1[9] = v18;
    goto LABEL_36;
  }
  *((_OWORD *)a1 + 4) = *((_OWORD *)a2 + 4);
LABEL_36:
  v19 = a2[10];
  if (!a1[10])
  {
    if (v19)
    {
      v21 = a2[11];
      a1[10] = v19;
      a1[11] = v21;
      return a1;
    }
LABEL_42:
    *((_OWORD *)a1 + 5) = *((_OWORD *)a2 + 5);
    return a1;
  }
  if (!v19)
  {
    swift_release();
    goto LABEL_42;
  }
  v20 = a2[11];
  a1[10] = v19;
  a1[11] = v20;
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for WebModelHandlers(uint64_t *a1, unsigned int a2)
{
  int v2;
  uint64_t v3;

  if (a2)
  {
    if (a2 >= 0x7FFFFFFF && *((_BYTE *)a1 + 96))
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

uint64_t storeEnumTagSinglePayload for WebModelHandlers(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(_QWORD *)(result + 88) = 0;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_QWORD *)result = a2 - 0x7FFFFFFF;
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 96) = 1;
  }
  else
  {
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 96) = 0;
    if (a2)
      *(_QWORD *)result = a2;
  }
  return result;
}

ValueMetadata *type metadata accessor for WebModelHandlers()
{
  return &type metadata for WebModelHandlers;
}

uint64_t sub_2112441B4()
{
  uint64_t v0;

  _Block_release(*(const void **)(v0 + 16));
  return swift_deallocObject();
}

void sub_2112441D8(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  sub_2112401B0(a1, a2, *(_QWORD *)(v2 + 16));
}

uint64_t sub_2112441F4()
{
  swift_release();
  return swift_deallocObject();
}

void sub_211244218(uint64_t a1)
{
  uint64_t v1;
  void (*v2)(uint64_t *);
  uint64_t v3;

  v2 = *(void (**)(uint64_t *))(v1 + 16);
  v3 = a1;
  v2(&v3);
  OUTLINED_FUNCTION_49_5();
}

void sub_211244240(_QWORD *a1)
{
  uint64_t v1;

  (*(void (**)(_QWORD))(v1 + 16))(*a1);
  OUTLINED_FUNCTION_11();
}

uint64_t sub_211244260(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;

  return sub_211242508(a1, a2, a3, a4, *(void (**)(uint64_t *, uint64_t *, _QWORD *))(v4 + 16));
}

void sub_211244268(uint64_t a1, _QWORD *a2)
{
  uint64_t v2;

  (*(void (**)(uint64_t, _QWORD))(v2 + 16))(a1, *a2);
  OUTLINED_FUNCTION_11();
}

uint64_t sub_211244288(uint64_t *a1, uint64_t *a2, uint64_t *a3)
{
  uint64_t v3;

  return sub_2112423F8(a1, a2, a3, *(void (**)(uint64_t, uint64_t, void (*)(uint64_t, uint64_t), uint64_t))(v3 + 16));
}

void sub_211244290(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  void (*v3)(uint64_t, uint64_t *);
  uint64_t v4;

  v3 = *(void (**)(uint64_t, uint64_t *))(v2 + 16);
  v4 = a2;
  v3(a1, &v4);
  OUTLINED_FUNCTION_49_5();
}

uint64_t sub_2112442B8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;

  return sub_2112422C8(a1, a2, a3, *(void (**)(uint64_t *, _QWORD *))(v3 + 16), *(_QWORD *)(v3 + 24), (uint64_t)&unk_24CB59C30, (uint64_t)sub_2112442E0);
}

void sub_2112442E0(_QWORD *a1, _QWORD *a2)
{
  uint64_t v2;

  (*(void (**)(_QWORD, _QWORD))(v2 + 16))(*a1, *a2);
  OUTLINED_FUNCTION_11();
}

uint64_t sub_211244304(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;

  return sub_2112421D8(a1, a2, *(void (**)(uint64_t, uint64_t, uint64_t))(v2 + 16), *(_QWORD *)(v2 + 24), (uint64_t)&unk_24CB59C80, (uint64_t)sub_2112441F0);
}

uint64_t sub_21124432C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;

  return sub_211242090(a1, a2, a3, *(void (**)(unsigned __int8 *__return_ptr, uint64_t *, _QWORD *))(v3 + 16));
}

uint64_t sub_211244334@<X0>(uint64_t *a1@<X0>, uint64_t *a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t v3;

  return sub_211241F74(a1, a2, *(uint64_t (**)(uint64_t, uint64_t (*)(), uint64_t))(v3 + 16), a3);
}

uint64_t sub_21124433C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;

  return sub_2112422C8(a1, a2, a3, *(void (**)(uint64_t *, _QWORD *))(v3 + 16), *(_QWORD *)(v3 + 24), (uint64_t)&unk_24CB59D70, (uint64_t)sub_211244424);
}

uint64_t sub_211244364(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;

  return sub_2112421D8(a1, a2, *(void (**)(uint64_t, uint64_t, uint64_t))(v2 + 16), *(_QWORD *)(v2 + 24), (uint64_t)&unk_24CB59DC0, (uint64_t)sub_2112441F0);
}

void sub_21124438C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  void (*v3)(uint64_t *, uint64_t *);
  uint64_t v4;
  uint64_t v5;

  v3 = *(void (**)(uint64_t *, uint64_t *))(v2 + 16);
  v4 = a2;
  v5 = a1;
  v3(&v5, &v4);
  OUTLINED_FUNCTION_49_5();
}

uint64_t OUTLINED_FUNCTION_7_28(uint64_t result)
{
  return sub_2111C64E4(result);
}

void OUTLINED_FUNCTION_15_22()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t *v3;

  v2 = *v0;
  v3 = (uint64_t *)(v1 - 8);
  *v3 = *v0;
  *v3 = *v0;
  *(_QWORD *)(v2 + 176) = *(_QWORD *)(v2 + 48);
}

uint64_t OUTLINED_FUNCTION_17_15(uint64_t a1, uint64_t (*a2)(void))
{
  return a2();
}

uint64_t OUTLINED_FUNCTION_20_16(uint64_t a1, uint64_t (*a2)(void))
{
  return a2();
}

uint64_t OUTLINED_FUNCTION_24_11()
{
  return swift_getObjectType();
}

uint64_t OUTLINED_FUNCTION_27_11()
{
  uint64_t v0;

  return v0;
}

uint64_t OUTLINED_FUNCTION_29_9()
{
  return swift_release();
}

uint64_t OUTLINED_FUNCTION_39_5()
{
  return swift_continuation_await();
}

uint64_t OUTLINED_FUNCTION_40_8(uint64_t a1, uint64_t (*a2)(void))
{
  return a2();
}

uint64_t OUTLINED_FUNCTION_41_9@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v3;

  *a1 = v3;
  a1[1] = a2;
  return v2;
}

uint64_t OUTLINED_FUNCTION_42_6()
{
  uint64_t v0;

  return v0;
}

uint64_t OUTLINED_FUNCTION_44_6(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v2 + 120) = a1;
  *(_QWORD *)(v2 + 128) = v1;
  return sub_21124654C();
}

uint64_t OUTLINED_FUNCTION_45_8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  return sub_211241634((uint64_t *)va);
}

uint64_t OUTLINED_FUNCTION_47_7()
{
  uint64_t v0;

  return v0;
}

uint64_t OUTLINED_FUNCTION_48_4()
{
  uint64_t v0;

  return v0;
}

uint64_t OUTLINED_FUNCTION_50_2()
{
  return sub_211246318();
}

uint64_t OUTLINED_FUNCTION_51_3()
{
  return sub_211246540();
}

uint64_t OUTLINED_FUNCTION_53_2()
{
  uint64_t v0;

  return v0;
}

uint64_t OUTLINED_FUNCTION_54_0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11)
{
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  return sub_2111C6444(a1, a2, a3, v11, v12, v13, v14, a8, a9, a10, a11);
}

uint64_t OUTLINED_FUNCTION_61_1()
{
  return 0;
}

uint64_t OUTLINED_FUNCTION_62_1()
{
  return swift_release();
}

uint64_t OUTLINED_FUNCTION_64_1@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  *(_QWORD *)(v1 + 16) = v1;
  *(_QWORD *)(v1 + 24) = a1;
  return swift_continuation_init();
}

uint64_t OUTLINED_FUNCTION_65_1(uint64_t result, uint64_t a2)
{
  uint64_t v2;

  *(_QWORD *)(v2 + 144) = result;
  *(_QWORD *)(v2 + 152) = a2;
  return result;
}

uint64_t OUTLINED_FUNCTION_68_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  return sub_211241634((uint64_t *)va);
}

uint64_t OUTLINED_FUNCTION_70()
{
  return sub_211246300();
}

uint64_t OUTLINED_FUNCTION_71_2()
{
  uint64_t v0;

  return v0;
}

uint64_t OUTLINED_FUNCTION_72_2()
{
  return swift_bridgeObjectRelease();
}

void OUTLINED_FUNCTION_74_2(uint64_t a1)
{
  void *v1;
  uint64_t v2;

  *(_QWORD *)(v2 + 168) = a1;

}

void OUTLINED_FUNCTION_75_1()
{
  JUMPOUT(0x212BD7ACCLL);
}

uint64_t sub_2112446E4()
{
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for ResourceBundleClass()
{
  return objc_opt_self();
}

void getAIDAServiceTypeCloud_cold_1()
{
  uint64_t v0;

  dlerror();
  v0 = abort_report_np();
  __getAIDAServiceOwnersManagerClass_block_invoke_cold_1(v0);
}

void __getAIDAServiceOwnersManagerClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  __getCDPUIControllerClass_block_invoke_cold_1(v0);
}

void __getCDPUIControllerClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  __getAAUISignInFlowControllerDelegateClass_block_invoke_cold_1(v0);
}

void __getAAUISignInFlowControllerDelegateClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  __getAIDAMutableServiceContextClass_block_invoke_cold_1(v0);
}

void __getAIDAMutableServiceContextClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  __getAKAppleIDAuthenticationInAppContextClass_block_invoke_cold_1(v0);
}

void __getAKAppleIDAuthenticationInAppContextClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  __getPKVirtualCardClass_block_invoke_cold_1(v0);
}

void __getPKVirtualCardClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  __getPKPaymentPassClass_block_invoke_cold_1(v0);
}

void __getPKPaymentPassClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  __getPKPassLibraryClass_block_invoke_cold_1(v0);
}

void __getPKPassLibraryClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  __getAMSUIDDynamicImpressionItemClass_block_invoke_cold_1(v0);
}

void __getAMSUIDDynamicImpressionItemClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  __getAMSUIDDynamicImpressionMetricsClass_block_invoke_cold_1(v0);
}

void __getAMSUIDDynamicImpressionMetricsClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  __getAMSUIDDynamicImpressionMetricsIdentifierClass_block_invoke_cold_1(v0);
}

void __getAMSUIDDynamicImpressionMetricsIdentifierClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  __getAMSUIDDynamicViewControllerClass_block_invoke_cold_1(v0);
}

void __getAMSUIDDynamicViewControllerClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  __getFACircleContextClass_block_invoke_cold_1(v0);
}

void __getFACircleContextClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  __getFACircleStateControllerClass_block_invoke_cold_1(v0);
}

void __getFACircleStateControllerClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  __getOBWelcomeControllerClass_block_invoke_cold_1(v0);
}

void __getOBWelcomeControllerClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  __getOBBoldTrayButtonClass_block_invoke_cold_1(v0);
}

void __getOBBoldTrayButtonClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  __getOBLinkTrayButtonClass_block_invoke_cold_1(v0);
}

void __getOBLinkTrayButtonClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  __getOBPrivacyLinkControllerClass_block_invoke_cold_1(v0);
}

void __getOBPrivacyLinkControllerClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  __getPKPaymentRequestClass_block_invoke_cold_1(v0);
}

void __getPKPaymentRequestClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  __getPKPaymentSummaryItemClass_block_invoke_cold_1(v0);
}

void __getPKPaymentSummaryItemClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  __getPKPaymentAuthorizationControllerClass_block_invoke_cold_1(v0);
}

void __getPKPaymentAuthorizationControllerClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  __getPKPaymentAuthorizationResultClass_block_invoke_cold_1(v0);
}

void __getPKPaymentAuthorizationResultClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  __getSKAccountPageViewControllerClass_block_invoke_cold_1(v0);
}

void __getSKAccountPageViewControllerClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  __getAADeviceInfoClass_block_invoke_cold_1(v0);
}

void __getAADeviceInfoClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  __getAVPlayerItemClass_block_invoke_cold_1(v0);
}

void __getAVPlayerItemClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  __getAVPlayerViewControllerClass_block_invoke_cold_1(v0);
}

void __getAVPlayerViewControllerClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  __getAVPlayerClass_block_invoke_cold_1(v0);
}

void __getAVPlayerClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  __getAVAudioSessionClass_block_invoke_cold_1(v0);
}

void __getAVAudioSessionClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  __getASDPurchaseClass_block_invoke_cold_1(v0);
}

void __getASDPurchaseClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  __getASDPurchaseManagerClass_block_invoke_cold_1(v0);
}

void __getASDPurchaseManagerClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  __getSSPurchaseClass_block_invoke_cold_1(v0);
}

void __getSSPurchaseClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  __getSSMutableURLRequestPropertiesClass_block_invoke_cold_1(v0);
}

void __getSSMutableURLRequestPropertiesClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  __getSSPurchaseRequestClass_block_invoke_cold_1(v0);
}

void __getSSPurchaseRequestClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  __getAPRequestHandlerClass_block_invoke_cold_1(v0);
}

void __getAPRequestHandlerClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  __getASDAppQueryClass_block_invoke_cold_1(v0);
}

void __getASDAppQueryClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  __getASDSubscriptionEntitlementsClass_block_invoke_cold_1(v0);
}

void __getASDSubscriptionEntitlementsClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  __getPKPassLibraryClass_block_invoke_cold_1_0(v0);
}

void __getPKPassLibraryClass_block_invoke_cold_1_0()
{
  uint64_t v0;

  v0 = abort_report_np();
  __getPKPaymentAuthorizationControllerClass_block_invoke_cold_1_0(v0);
}

void __getPKPaymentAuthorizationControllerClass_block_invoke_cold_1_0()
{
  uint64_t v0;

  v0 = abort_report_np();
  __getAPRequestHandlerClass_block_invoke_cold_1_0(v0);
}

void __getAPRequestHandlerClass_block_invoke_cold_1_0()
{
  uint64_t v0;

  v0 = abort_report_np();
  __getAKAppleIDServerResourceLoadDelegateClass_block_invoke_cold_1(v0);
}

void __getAKAppleIDServerResourceLoadDelegateClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  __getFACircleContextClass_block_invoke_cold_1_0(v0);
}

void __getFACircleContextClass_block_invoke_cold_1_0()
{
  uint64_t v0;

  v0 = abort_report_np();
  __getFACircleStateControllerClass_block_invoke_cold_1_0(v0);
}

void __getFACircleStateControllerClass_block_invoke_cold_1_0()
{
  uint64_t v0;

  v0 = abort_report_np();
  __getPKAccountServiceClass_block_invoke_cold_1(v0);
}

void __getPKAccountServiceClass_block_invoke_cold_1()
{
  abort_report_np();
  sub_211244D40();
}

uint64_t sub_211244D40()
{
  return MEMORY[0x24BDCAFF8]();
}

uint64_t sub_211244D4C()
{
  return MEMORY[0x24BDCB030]();
}

uint64_t sub_211244D58()
{
  return MEMORY[0x24BDCB068]();
}

uint64_t sub_211244D64()
{
  return MEMORY[0x24BDCB070]();
}

uint64_t sub_211244D70()
{
  return MEMORY[0x24BDCB0C0]();
}

uint64_t sub_211244D7C()
{
  return MEMORY[0x24BDCB220]();
}

uint64_t sub_211244D88()
{
  return MEMORY[0x24BDCB260]();
}

uint64_t sub_211244D94()
{
  return MEMORY[0x24BDCB268]();
}

uint64_t sub_211244DA0()
{
  return MEMORY[0x24BDCB668]();
}

uint64_t sub_211244DAC()
{
  return MEMORY[0x24BDCB6C0]();
}

uint64_t sub_211244DB8()
{
  return MEMORY[0x24BDCB6F8]();
}

uint64_t sub_211244DC4()
{
  return MEMORY[0x24BDCB750]();
}

uint64_t sub_211244DD0()
{
  return MEMORY[0x24BDCB958]();
}

uint64_t sub_211244DDC()
{
  return MEMORY[0x24BDCB960]();
}

uint64_t sub_211244DE8()
{
  return MEMORY[0x24BDCB980]();
}

uint64_t sub_211244DF4()
{
  return MEMORY[0x24BDCB988]();
}

uint64_t sub_211244E00()
{
  return MEMORY[0x24BDCB9E0]();
}

uint64_t sub_211244E0C()
{
  return MEMORY[0x24BDCB9F0]();
}

uint64_t sub_211244E18()
{
  return MEMORY[0x24BDCBA58]();
}

uint64_t sub_211244E24()
{
  return MEMORY[0x24BDCBA60]();
}

uint64_t sub_211244E30()
{
  return MEMORY[0x24BDCBAB0]();
}

uint64_t sub_211244E3C()
{
  return MEMORY[0x24BDCBAC0]();
}

uint64_t sub_211244E48()
{
  return MEMORY[0x24BDCBB10]();
}

uint64_t sub_211244E54()
{
  return MEMORY[0x24BDCBB40]();
}

uint64_t sub_211244E60()
{
  return MEMORY[0x24BDCBB78]();
}

uint64_t sub_211244E6C()
{
  return MEMORY[0x24BDCBE60]();
}

uint64_t sub_211244E78()
{
  return MEMORY[0x24BDCBE68]();
}

uint64_t sub_211244E84()
{
  return MEMORY[0x24BDCBE78]();
}

uint64_t sub_211244E90()
{
  return MEMORY[0x24BDCBE80]();
}

uint64_t sub_211244E9C()
{
  return MEMORY[0x24BDB3C70]();
}

uint64_t sub_211244EA8()
{
  return MEMORY[0x24BDB3C98]();
}

uint64_t sub_211244EB4()
{
  return MEMORY[0x24BDCC2D8]();
}

uint64_t sub_211244EC0()
{
  return MEMORY[0x24BDCC2F8]();
}

uint64_t sub_211244ECC()
{
  return MEMORY[0x24BDCC5A8]();
}

uint64_t sub_211244ED8()
{
  return MEMORY[0x24BDCC5D8]();
}

uint64_t sub_211244EE4()
{
  return MEMORY[0x24BDCC6D8]();
}

uint64_t sub_211244EF0()
{
  return MEMORY[0x24BDCC890]();
}

uint64_t sub_211244EFC()
{
  return MEMORY[0x24BDCC898]();
}

uint64_t sub_211244F08()
{
  return MEMORY[0x24BDCD280]();
}

uint64_t sub_211244F14()
{
  return MEMORY[0x24BDCD288]();
}

uint64_t sub_211244F20()
{
  return MEMORY[0x24BDCD290]();
}

uint64_t sub_211244F2C()
{
  return MEMORY[0x24BDCD298]();
}

uint64_t sub_211244F38()
{
  return MEMORY[0x24BDCD2A8]();
}

uint64_t sub_211244F44()
{
  return MEMORY[0x24BDCD2B8]();
}

uint64_t sub_211244F50()
{
  return MEMORY[0x24BDCD2C0]();
}

uint64_t sub_211244F5C()
{
  return MEMORY[0x24BDB3CC0]();
}

uint64_t sub_211244F68()
{
  return MEMORY[0x24BDCD2F0]();
}

uint64_t sub_211244F74()
{
  return MEMORY[0x24BDCD2F8]();
}

uint64_t sub_211244F80()
{
  return MEMORY[0x24BDCD820]();
}

uint64_t sub_211244F8C()
{
  return MEMORY[0x24BDCD870]();
}

uint64_t sub_211244F98()
{
  return MEMORY[0x24BDCD8D0]();
}

uint64_t sub_211244FA4()
{
  return MEMORY[0x24BDCD9C0]();
}

uint64_t sub_211244FB0()
{
  return MEMORY[0x24BDCDA28]();
}

uint64_t sub_211244FBC()
{
  return MEMORY[0x24BDCDA48]();
}

uint64_t sub_211244FC8()
{
  return MEMORY[0x24BDCDA68]();
}

uint64_t sub_211244FD4()
{
  return MEMORY[0x24BDCDA90]();
}

uint64_t sub_211244FE0()
{
  return MEMORY[0x24BDCDAC0]();
}

uint64_t sub_211244FEC()
{
  return MEMORY[0x24BDCDB78]();
}

uint64_t sub_211244FF8()
{
  return MEMORY[0x24BDCDCA0]();
}

uint64_t sub_211245004()
{
  return MEMORY[0x24BDCDCE0]();
}

uint64_t sub_211245010()
{
  return MEMORY[0x24BDCE9B0]();
}

uint64_t sub_21124501C()
{
  return MEMORY[0x24BDCE9E0]();
}

uint64_t sub_211245028()
{
  return MEMORY[0x24BDCEA40]();
}

uint64_t sub_211245034()
{
  return MEMORY[0x24BDCEA58]();
}

uint64_t sub_211245040()
{
  return MEMORY[0x24BDCF368]();
}

uint64_t sub_21124504C()
{
  return MEMORY[0x24BDCF3B0]();
}

uint64_t sub_211245058()
{
  return MEMORY[0x24BDCF428]();
}

uint64_t sub_211245064()
{
  return MEMORY[0x24BEE5C38]();
}

uint64_t sub_211245070()
{
  return MEMORY[0x24BEE5C40]();
}

uint64_t sub_21124507C()
{
  return MEMORY[0x24BEE5C48]();
}

uint64_t sub_211245088()
{
  return MEMORY[0x24BEE5C50]();
}

uint64_t sub_211245094()
{
  return MEMORY[0x24BEE5C58]();
}

uint64_t sub_2112450A0()
{
  return MEMORY[0x24BEE5C60]();
}

uint64_t sub_2112450AC()
{
  return MEMORY[0x24BDCF760]();
}

uint64_t sub_2112450B8()
{
  return MEMORY[0x24BDCF788]();
}

uint64_t sub_2112450C4()
{
  return MEMORY[0x24BDC7A48]();
}

uint64_t sub_2112450D0()
{
  return MEMORY[0x24BDC7A88]();
}

uint64_t sub_2112450DC()
{
  return MEMORY[0x24BDC7A90]();
}

uint64_t sub_2112450E8()
{
  return MEMORY[0x24BDC7AD0]();
}

uint64_t sub_2112450F4()
{
  return MEMORY[0x24BDC7AD8]();
}

uint64_t sub_211245100()
{
  return MEMORY[0x24BDB3CC8]();
}

uint64_t sub_21124510C()
{
  return MEMORY[0x24BDB3CD8]();
}

uint64_t sub_211245118()
{
  return MEMORY[0x24BDB3CE0]();
}

uint64_t sub_211245124()
{
  return MEMORY[0x24BE07A30]();
}

uint64_t sub_211245130()
{
  return MEMORY[0x24BE07A38]();
}

uint64_t sub_21124513C()
{
  return MEMORY[0x24BE07A40]();
}

uint64_t sub_211245148()
{
  return MEMORY[0x24BE07A50]();
}

uint64_t sub_211245154()
{
  return MEMORY[0x24BE07A58]();
}

uint64_t sub_211245160()
{
  return MEMORY[0x24BE07A60]();
}

uint64_t sub_21124516C()
{
  return MEMORY[0x24BE07A68]();
}

uint64_t sub_211245178()
{
  return MEMORY[0x24BE07A78]();
}

uint64_t sub_211245184()
{
  return MEMORY[0x24BE07A80]();
}

uint64_t sub_211245190()
{
  return MEMORY[0x24BE07A88]();
}

uint64_t sub_21124519C()
{
  return MEMORY[0x24BE07A90]();
}

uint64_t sub_2112451A8()
{
  return MEMORY[0x24BE07A98]();
}

uint64_t sub_2112451B4()
{
  return MEMORY[0x24BE07AA0]();
}

uint64_t sub_2112451C0()
{
  return MEMORY[0x24BE07AA8]();
}

uint64_t sub_2112451CC()
{
  return MEMORY[0x24BE07AB0]();
}

uint64_t sub_2112451D8()
{
  return MEMORY[0x24BE07AB8]();
}

uint64_t sub_2112451E4()
{
  return MEMORY[0x24BE07AC0]();
}

uint64_t sub_2112451F0()
{
  return MEMORY[0x24BE07AC8]();
}

uint64_t sub_2112451FC()
{
  return MEMORY[0x24BE07AE8]();
}

uint64_t sub_211245208()
{
  return MEMORY[0x24BE07AF8]();
}

uint64_t sub_211245214()
{
  return MEMORY[0x24BE07B00]();
}

uint64_t sub_211245220()
{
  return MEMORY[0x24BE07B10]();
}

uint64_t sub_21124522C()
{
  return MEMORY[0x24BE07B18]();
}

uint64_t sub_211245238()
{
  return MEMORY[0x24BE07B20]();
}

uint64_t sub_211245244()
{
  return MEMORY[0x24BE07B28]();
}

uint64_t sub_211245250()
{
  return MEMORY[0x24BE07B38]();
}

uint64_t sub_21124525C()
{
  return MEMORY[0x24BE07B48]();
}

uint64_t sub_211245268()
{
  return MEMORY[0x24BE07B50]();
}

uint64_t sub_211245274()
{
  return MEMORY[0x24BE07B58]();
}

uint64_t sub_211245280()
{
  return MEMORY[0x24BE07B68]();
}

uint64_t sub_21124528C()
{
  return MEMORY[0x24BE07B78]();
}

uint64_t sub_211245298()
{
  return MEMORY[0x24BE07B88]();
}

uint64_t sub_2112452A4()
{
  return MEMORY[0x24BE07B98]();
}

uint64_t sub_2112452B0()
{
  return MEMORY[0x24BE07BA0]();
}

uint64_t sub_2112452BC()
{
  return MEMORY[0x24BE07BA8]();
}

uint64_t sub_2112452C8()
{
  return MEMORY[0x24BE07BB0]();
}

uint64_t sub_2112452D4()
{
  return MEMORY[0x24BE07BC0]();
}

uint64_t sub_2112452E0()
{
  return MEMORY[0x24BE07BC8]();
}

uint64_t sub_2112452EC()
{
  return MEMORY[0x24BE07BD0]();
}

uint64_t sub_2112452F8()
{
  return MEMORY[0x24BE07BD8]();
}

uint64_t sub_211245304()
{
  return MEMORY[0x24BE07BE0]();
}

uint64_t sub_211245310()
{
  return MEMORY[0x24BE07BF0]();
}

uint64_t sub_21124531C()
{
  return MEMORY[0x24BE07BF8]();
}

uint64_t sub_211245328()
{
  return MEMORY[0x24BE07C00]();
}

uint64_t sub_211245334()
{
  return MEMORY[0x24BE07C08]();
}

uint64_t sub_211245340()
{
  return MEMORY[0x24BE07C10]();
}

uint64_t sub_21124534C()
{
  return MEMORY[0x24BE07C18]();
}

uint64_t sub_211245358()
{
  return MEMORY[0x24BE07C20]();
}

uint64_t sub_211245364()
{
  return MEMORY[0x24BE07C30]();
}

uint64_t sub_211245370()
{
  return MEMORY[0x24BE07C38]();
}

uint64_t sub_21124537C()
{
  return MEMORY[0x24BE07C40]();
}

uint64_t sub_211245388()
{
  return MEMORY[0x24BDC77F0]();
}

uint64_t sub_211245394()
{
  return MEMORY[0x24BDC7808]();
}

uint64_t sub_2112453A0()
{
  return MEMORY[0x24BDC7818]();
}

uint64_t sub_2112453AC()
{
  return MEMORY[0x24BDC7820]();
}

uint64_t sub_2112453B8()
{
  return MEMORY[0x24BDC7838]();
}

uint64_t sub_2112453C4()
{
  return MEMORY[0x24BDC7840]();
}

uint64_t sub_2112453D0()
{
  return MEMORY[0x24BDC7850]();
}

uint64_t sub_2112453DC()
{
  return MEMORY[0x24BDC7858]();
}

uint64_t sub_2112453E8()
{
  return MEMORY[0x24BDC7870]();
}

uint64_t sub_2112453F4()
{
  return MEMORY[0x24BDC7880]();
}

uint64_t sub_211245400()
{
  return MEMORY[0x24BDC78A8]();
}

uint64_t sub_21124540C()
{
  return MEMORY[0x24BDC7920]();
}

uint64_t sub_211245418()
{
  return MEMORY[0x24BEE76F0]();
}

uint64_t sub_211245424()
{
  return MEMORY[0x24BE5E5F8]();
}

uint64_t sub_211245430()
{
  return MEMORY[0x24BE5E600]();
}

uint64_t sub_21124543C()
{
  return MEMORY[0x24BE5E610]();
}

uint64_t sub_211245448()
{
  return MEMORY[0x24BE5E618]();
}

uint64_t sub_211245454()
{
  return MEMORY[0x24BEBC0F0]();
}

uint64_t sub_211245460()
{
  return MEMORY[0x24BEBC120]();
}

uint64_t sub_21124546C()
{
  return MEMORY[0x24BEBC210]();
}

uint64_t sub_211245478()
{
  return MEMORY[0x24BEBCB20]();
}

uint64_t sub_211245484()
{
  return MEMORY[0x24BDB9C48]();
}

uint64_t sub_211245490()
{
  return MEMORY[0x24BDB9E98]();
}

uint64_t sub_21124549C()
{
  return MEMORY[0x24BDB9EA0]();
}

uint64_t sub_2112454A8()
{
  return MEMORY[0x24BDB9EA8]();
}

uint64_t sub_2112454B4()
{
  return MEMORY[0x24BDB9EC0]();
}

uint64_t sub_2112454C0()
{
  return MEMORY[0x24BDB9EC8]();
}

uint64_t sub_2112454CC()
{
  return MEMORY[0x24BDB9ED0]();
}

uint64_t sub_2112454D8()
{
  return MEMORY[0x24BDB9EF0]();
}

uint64_t sub_2112454E4()
{
  return MEMORY[0x24BDEAE98]();
}

uint64_t sub_2112454F0()
{
  return MEMORY[0x24BDEAEB0]();
}

uint64_t sub_2112454FC()
{
  return MEMORY[0x24BDEB040]();
}

uint64_t sub_211245508()
{
  return MEMORY[0x24BDEB0B0]();
}

uint64_t sub_211245514()
{
  return MEMORY[0x24BDEB0B8]();
}

uint64_t sub_211245520()
{
  return MEMORY[0x24BDEB0E0]();
}

uint64_t sub_21124552C()
{
  return MEMORY[0x24BDEB230]();
}

uint64_t sub_211245538()
{
  return MEMORY[0x24BDEB2A0]();
}

uint64_t sub_211245544()
{
  return MEMORY[0x24BDEB2B0]();
}

uint64_t sub_211245550()
{
  return MEMORY[0x24BDEB2F0]();
}

uint64_t sub_21124555C()
{
  return MEMORY[0x24BDEB4C0]();
}

uint64_t sub_211245568()
{
  return MEMORY[0x24BDEB4F8]();
}

uint64_t sub_211245574()
{
  return MEMORY[0x24BDEB540]();
}

uint64_t sub_211245580()
{
  return MEMORY[0x24BDEB560]();
}

uint64_t sub_21124558C()
{
  return MEMORY[0x24BDEB5B8]();
}

uint64_t sub_211245598()
{
  return MEMORY[0x24BDEB790]();
}

uint64_t sub_2112455A4()
{
  return MEMORY[0x24BDEB7B8]();
}

uint64_t sub_2112455B0()
{
  return MEMORY[0x24BDEB7E8]();
}

uint64_t sub_2112455BC()
{
  return MEMORY[0x24BDEB800]();
}

uint64_t sub_2112455C8()
{
  return MEMORY[0x24BDEB828]();
}

uint64_t sub_2112455D4()
{
  return MEMORY[0x24BDEBBC8]();
}

uint64_t sub_2112455E0()
{
  return MEMORY[0x24BDEBDE0]();
}

uint64_t sub_2112455EC()
{
  return MEMORY[0x24BDEBDF0]();
}

uint64_t sub_2112455F8()
{
  return MEMORY[0x24BDEBE00]();
}

uint64_t sub_211245604()
{
  return MEMORY[0x24BDEBED0]();
}

uint64_t sub_211245610()
{
  return MEMORY[0x24BDEC000]();
}

uint64_t sub_21124561C()
{
  return MEMORY[0x24BDEC130]();
}

uint64_t sub_211245628()
{
  return MEMORY[0x24BDEC260]();
}

uint64_t sub_211245634()
{
  return MEMORY[0x24BDEC280]();
}

uint64_t sub_211245640()
{
  return MEMORY[0x24BDEC348]();
}

uint64_t sub_21124564C()
{
  return MEMORY[0x24BDEC358]();
}

uint64_t sub_211245658()
{
  return MEMORY[0x24BDEC4E0]();
}

uint64_t sub_211245664()
{
  return MEMORY[0x24BDEC5A0]();
}

uint64_t sub_211245670()
{
  return MEMORY[0x24BDEC648]();
}

uint64_t sub_21124567C()
{
  return MEMORY[0x24BDEC778]();
}

uint64_t sub_211245688()
{
  return MEMORY[0x24BDEC7A8]();
}

uint64_t sub_211245694()
{
  return MEMORY[0x24BDEC7B0]();
}

uint64_t sub_2112456A0()
{
  return MEMORY[0x24BDEC8C0]();
}

uint64_t sub_2112456AC()
{
  return MEMORY[0x24BDEC950]();
}

uint64_t sub_2112456B8()
{
  return MEMORY[0x24BDEC958]();
}

uint64_t sub_2112456C4()
{
  return MEMORY[0x24BDEC998]();
}

uint64_t sub_2112456D0()
{
  return MEMORY[0x24BDEC9A0]();
}

uint64_t sub_2112456DC()
{
  return MEMORY[0x24BDECB20]();
}

uint64_t sub_2112456E8()
{
  return MEMORY[0x24BDECB30]();
}

uint64_t sub_2112456F4()
{
  return MEMORY[0x24BDECE00]();
}

uint64_t sub_211245700()
{
  return MEMORY[0x24BDECF50]();
}

uint64_t sub_21124570C()
{
  return MEMORY[0x24BDED198]();
}

uint64_t sub_211245718()
{
  return MEMORY[0x24BDED200]();
}

uint64_t sub_211245724()
{
  return MEMORY[0x24BDED2B0]();
}

uint64_t sub_211245730()
{
  return MEMORY[0x24BDED2D0]();
}

uint64_t sub_21124573C()
{
  return MEMORY[0x24BDED318]();
}

uint64_t sub_211245748()
{
  return MEMORY[0x24BDED3E0]();
}

uint64_t sub_211245754()
{
  return MEMORY[0x24BDED3F0]();
}

uint64_t sub_211245760()
{
  return MEMORY[0x24BDED790]();
}

uint64_t sub_21124576C()
{
  return MEMORY[0x24BDED860]();
}

uint64_t sub_211245778()
{
  return MEMORY[0x24BDED868]();
}

uint64_t sub_211245784()
{
  return MEMORY[0x24BDED8A0]();
}

uint64_t sub_211245790()
{
  return MEMORY[0x24BDED8A8]();
}

uint64_t sub_21124579C()
{
  return MEMORY[0x24BDED998]();
}

uint64_t sub_2112457A8()
{
  return MEMORY[0x24BDEDBA8]();
}

uint64_t sub_2112457B4()
{
  return MEMORY[0x24BDEDD00]();
}

uint64_t sub_2112457C0()
{
  return MEMORY[0x24BDEDD10]();
}

uint64_t sub_2112457CC()
{
  return MEMORY[0x24BDEE020]();
}

uint64_t sub_2112457D8()
{
  return MEMORY[0x24BDEE028]();
}

uint64_t sub_2112457E4()
{
  return MEMORY[0x24BDEE038]();
}

uint64_t sub_2112457F0()
{
  return MEMORY[0x24BDEE048]();
}

uint64_t sub_2112457FC()
{
  return MEMORY[0x24BDEE0B8]();
}

uint64_t sub_211245808()
{
  return MEMORY[0x24BDEE1D8]();
}

uint64_t sub_211245814()
{
  return MEMORY[0x24BDEE288]();
}

uint64_t sub_211245820()
{
  return MEMORY[0x24BDEE290]();
}

uint64_t sub_21124582C()
{
  return MEMORY[0x24BDEE390]();
}

uint64_t sub_211245838()
{
  return MEMORY[0x24BDEE3A0]();
}

uint64_t sub_211245844()
{
  return MEMORY[0x24BDEE468]();
}

uint64_t sub_211245850()
{
  return MEMORY[0x24BDEE478]();
}

uint64_t sub_21124585C()
{
  return MEMORY[0x24BDEE490]();
}

uint64_t sub_211245868()
{
  return MEMORY[0x24BDEE4A0]();
}

uint64_t sub_211245874()
{
  return MEMORY[0x24BDEE4C0]();
}

uint64_t sub_211245880()
{
  return MEMORY[0x24BDEE4D8]();
}

uint64_t sub_21124588C()
{
  return MEMORY[0x24BDEE4E0]();
}

uint64_t sub_211245898()
{
  return MEMORY[0x24BDEE4F8]();
}

uint64_t sub_2112458A4()
{
  return MEMORY[0x24BDEE530]();
}

uint64_t sub_2112458B0()
{
  return MEMORY[0x24BDEE538]();
}

uint64_t sub_2112458BC()
{
  return MEMORY[0x24BDEE608]();
}

uint64_t sub_2112458C8()
{
  return MEMORY[0x24BDEE628]();
}

uint64_t sub_2112458D4()
{
  return MEMORY[0x24BDEE630]();
}

uint64_t sub_2112458E0()
{
  return MEMORY[0x24BDEE700]();
}

uint64_t sub_2112458EC()
{
  return MEMORY[0x24BDEE730]();
}

uint64_t sub_2112458F8()
{
  return MEMORY[0x24BDEEA18]();
}

uint64_t sub_211245904()
{
  return MEMORY[0x24BDEEA28]();
}

uint64_t sub_211245910()
{
  return MEMORY[0x24BDEEA30]();
}

uint64_t sub_21124591C()
{
  return MEMORY[0x24BDEEA40]();
}

uint64_t sub_211245928()
{
  return MEMORY[0x24BDEEA50]();
}

uint64_t sub_211245934()
{
  return MEMORY[0x24BDEEA60]();
}

uint64_t sub_211245940()
{
  return MEMORY[0x24BDEEB40]();
}

uint64_t sub_21124594C()
{
  return MEMORY[0x24BDEEB88]();
}

uint64_t sub_211245958()
{
  return MEMORY[0x24BDEED70]();
}

uint64_t sub_211245964()
{
  return MEMORY[0x24BDEED88]();
}

uint64_t sub_211245970()
{
  return MEMORY[0x24BDEEF60]();
}

uint64_t sub_21124597C()
{
  return MEMORY[0x24BDEEF78]();
}

uint64_t sub_211245988()
{
  return MEMORY[0x24BDEF168]();
}

uint64_t sub_211245994()
{
  return MEMORY[0x24BDEF1B8]();
}

uint64_t sub_2112459A0()
{
  return MEMORY[0x24BDEF1D0]();
}

uint64_t sub_2112459AC()
{
  return MEMORY[0x24BDEF1F8]();
}

uint64_t sub_2112459B8()
{
  return MEMORY[0x24BDEF228]();
}

uint64_t sub_2112459C4()
{
  return MEMORY[0x24BDEF238]();
}

uint64_t sub_2112459D0()
{
  return MEMORY[0x24BDEF248]();
}

uint64_t sub_2112459DC()
{
  return MEMORY[0x24BDEF260]();
}

uint64_t sub_2112459E8()
{
  return MEMORY[0x24BDEF270]();
}

uint64_t sub_2112459F4()
{
  return MEMORY[0x24BDEF278]();
}

uint64_t sub_211245A00()
{
  return MEMORY[0x24BDEF288]();
}

uint64_t sub_211245A0C()
{
  return MEMORY[0x24BDEF298]();
}

uint64_t sub_211245A18()
{
  return MEMORY[0x24BDEF2A8]();
}

uint64_t sub_211245A24()
{
  return MEMORY[0x24BDEF2C0]();
}

uint64_t sub_211245A30()
{
  return MEMORY[0x24BDEF2C8]();
}

uint64_t sub_211245A3C()
{
  return MEMORY[0x24BDEF3A0]();
}

uint64_t sub_211245A48()
{
  return MEMORY[0x24BDEF560]();
}

uint64_t sub_211245A54()
{
  return MEMORY[0x24BDEF5C8]();
}

uint64_t sub_211245A60()
{
  return MEMORY[0x24BDEF5D8]();
}

uint64_t sub_211245A6C()
{
  return MEMORY[0x24BDEF6F0]();
}

uint64_t sub_211245A78()
{
  return MEMORY[0x24BDEF700]();
}

uint64_t sub_211245A84()
{
  return MEMORY[0x24BDEF730]();
}

uint64_t sub_211245A90()
{
  return MEMORY[0x24BDEF740]();
}

uint64_t sub_211245A9C()
{
  return MEMORY[0x24BDEF8C0]();
}

uint64_t sub_211245AA8()
{
  return MEMORY[0x24BDEF8D0]();
}

uint64_t sub_211245AB4()
{
  return MEMORY[0x24BDEF960]();
}

uint64_t sub_211245AC0()
{
  return MEMORY[0x24BDEF968]();
}

uint64_t sub_211245ACC()
{
  return MEMORY[0x24BDEFA78]();
}

uint64_t sub_211245AD8()
{
  return MEMORY[0x24BDEFCA8]();
}

uint64_t sub_211245AE4()
{
  return MEMORY[0x24BDEFCB8]();
}

uint64_t sub_211245AF0()
{
  return MEMORY[0x24BDEFCC8]();
}

uint64_t sub_211245AFC()
{
  return MEMORY[0x24BDEFDD8]();
}

uint64_t sub_211245B08()
{
  return MEMORY[0x24BDEFDE0]();
}

uint64_t sub_211245B14()
{
  return MEMORY[0x24BDEFEF8]();
}

uint64_t sub_211245B20()
{
  return MEMORY[0x24BDF0150]();
}

uint64_t sub_211245B2C()
{
  return MEMORY[0x24BDF02D0]();
}

uint64_t sub_211245B38()
{
  return MEMORY[0x24BDF04D0]();
}

uint64_t sub_211245B44()
{
  return MEMORY[0x24BDF0A10]();
}

uint64_t sub_211245B50()
{
  return MEMORY[0x24BDF0A20]();
}

uint64_t sub_211245B5C()
{
  return MEMORY[0x24BDF0AF0]();
}

uint64_t sub_211245B68()
{
  return MEMORY[0x24BDF0D98]();
}

uint64_t sub_211245B74()
{
  return MEMORY[0x24BDF0DA8]();
}

uint64_t sub_211245B80()
{
  return MEMORY[0x24BDF0EC0]();
}

uint64_t sub_211245B8C()
{
  return MEMORY[0x24BDF0ED0]();
}

uint64_t sub_211245B98()
{
  return MEMORY[0x24BDF0EE0]();
}

uint64_t sub_211245BA4()
{
  return MEMORY[0x24BDF0EF0]();
}

uint64_t sub_211245BB0()
{
  return MEMORY[0x24BDF0F00]();
}

uint64_t sub_211245BBC()
{
  return MEMORY[0x24BDF0F10]();
}

uint64_t sub_211245BC8()
{
  return MEMORY[0x24BDF0F18]();
}

uint64_t sub_211245BD4()
{
  return MEMORY[0x24BDF0F28]();
}

uint64_t sub_211245BE0()
{
  return MEMORY[0x24BDF0F38]();
}

uint64_t sub_211245BEC()
{
  return MEMORY[0x24BDF1088]();
}

uint64_t sub_211245BF8()
{
  return MEMORY[0x24BDF1148]();
}

uint64_t sub_211245C04()
{
  return MEMORY[0x24BDF12A0]();
}

uint64_t sub_211245C10()
{
  return MEMORY[0x24BDF12A8]();
}

uint64_t sub_211245C1C()
{
  return MEMORY[0x24BDF12B0]();
}

uint64_t sub_211245C28()
{
  return MEMORY[0x24BDF13A0]();
}

uint64_t sub_211245C34()
{
  return MEMORY[0x24BDF1430]();
}

uint64_t sub_211245C40()
{
  return MEMORY[0x24BDF1458]();
}

uint64_t sub_211245C4C()
{
  return MEMORY[0x24BDF1468]();
}

uint64_t sub_211245C58()
{
  return MEMORY[0x24BDF14A0]();
}

uint64_t sub_211245C64()
{
  return MEMORY[0x24BDF14A8]();
}

uint64_t sub_211245C70()
{
  return MEMORY[0x24BDF14C0]();
}

uint64_t sub_211245C7C()
{
  return MEMORY[0x24BDF14C8]();
}

uint64_t sub_211245C88()
{
  return MEMORY[0x24BDF14E0]();
}

uint64_t sub_211245C94()
{
  return MEMORY[0x24BDF14E8]();
}

uint64_t sub_211245CA0()
{
  return MEMORY[0x24BDF14F8]();
}

uint64_t sub_211245CAC()
{
  return MEMORY[0x24BDF1510]();
}

uint64_t sub_211245CB8()
{
  return MEMORY[0x24BDF1560]();
}

uint64_t sub_211245CC4()
{
  return MEMORY[0x24BDF1580]();
}

uint64_t sub_211245CD0()
{
  return MEMORY[0x24BDF15F8]();
}

uint64_t sub_211245CDC()
{
  return MEMORY[0x24BDF1640]();
}

uint64_t sub_211245CE8()
{
  return MEMORY[0x24BDF1678]();
}

uint64_t sub_211245CF4()
{
  return MEMORY[0x24BDF16A8]();
}

uint64_t sub_211245D00()
{
  return MEMORY[0x24BDF16D0]();
}

uint64_t sub_211245D0C()
{
  return MEMORY[0x24BDF1700]();
}

uint64_t sub_211245D18()
{
  return MEMORY[0x24BDF1750]();
}

uint64_t sub_211245D24()
{
  return MEMORY[0x24BDF1768]();
}

uint64_t sub_211245D30()
{
  return MEMORY[0x24BDF1778]();
}

uint64_t sub_211245D3C()
{
  return MEMORY[0x24BDF17F8]();
}

uint64_t sub_211245D48()
{
  return MEMORY[0x24BDF1828]();
}

uint64_t sub_211245D54()
{
  return MEMORY[0x24BDF1840]();
}

uint64_t sub_211245D60()
{
  return MEMORY[0x24BDF1900]();
}

uint64_t sub_211245D6C()
{
  return MEMORY[0x24BDF1A00]();
}

uint64_t sub_211245D78()
{
  return MEMORY[0x24BDF1BE8]();
}

uint64_t sub_211245D84()
{
  return MEMORY[0x24BDF1D08]();
}

uint64_t sub_211245D90()
{
  return MEMORY[0x24BDF1D18]();
}

uint64_t sub_211245D9C()
{
  return MEMORY[0x24BDF1D68]();
}

uint64_t sub_211245DA8()
{
  return MEMORY[0x24BDF1DC8]();
}

uint64_t sub_211245DB4()
{
  return MEMORY[0x24BDF1FC0]();
}

uint64_t sub_211245DC0()
{
  return MEMORY[0x24BDF1FF0]();
}

uint64_t sub_211245DCC()
{
  return MEMORY[0x24BDF1FF8]();
}

uint64_t sub_211245DD8()
{
  return MEMORY[0x24BDF2088]();
}

uint64_t sub_211245DE4()
{
  return MEMORY[0x24BDF20A0]();
}

uint64_t sub_211245DF0()
{
  return MEMORY[0x24BDF2138]();
}

uint64_t sub_211245DFC()
{
  return MEMORY[0x24BDF22B0]();
}

uint64_t sub_211245E08()
{
  return MEMORY[0x24BDF2370]();
}

uint64_t sub_211245E14()
{
  return MEMORY[0x24BDF2440]();
}

uint64_t sub_211245E20()
{
  return MEMORY[0x24BDF2548]();
}

uint64_t sub_211245E2C()
{
  return MEMORY[0x24BDF25E8]();
}

uint64_t sub_211245E38()
{
  return MEMORY[0x24BDF2698]();
}

uint64_t sub_211245E44()
{
  return MEMORY[0x24BDF27F0]();
}

uint64_t sub_211245E50()
{
  return MEMORY[0x24BDF2B50]();
}

uint64_t sub_211245E5C()
{
  return MEMORY[0x24BDF2C48]();
}

uint64_t sub_211245E68()
{
  return MEMORY[0x24BDF2CE8]();
}

uint64_t sub_211245E74()
{
  return MEMORY[0x24BDF2DB8]();
}

uint64_t sub_211245E80()
{
  return MEMORY[0x24BDF2E80]();
}

uint64_t sub_211245E8C()
{
  return MEMORY[0x24BDF2F08]();
}

uint64_t sub_211245E98()
{
  return MEMORY[0x24BDF2FD8]();
}

uint64_t sub_211245EA4()
{
  return MEMORY[0x24BDF3060]();
}

uint64_t sub_211245EB0()
{
  return MEMORY[0x24BDF3070]();
}

uint64_t sub_211245EBC()
{
  return MEMORY[0x24BDF30D8]();
}

uint64_t sub_211245EC8()
{
  return MEMORY[0x24BDF3198]();
}

uint64_t sub_211245ED4()
{
  return MEMORY[0x24BDF3390]();
}

uint64_t sub_211245EE0()
{
  return MEMORY[0x24BDF33B0]();
}

uint64_t sub_211245EEC()
{
  return MEMORY[0x24BDF33E8]();
}

uint64_t sub_211245EF8()
{
  return MEMORY[0x24BDF34C8]();
}

uint64_t sub_211245F04()
{
  return MEMORY[0x24BDF3640]();
}

uint64_t sub_211245F10()
{
  return MEMORY[0x24BDF3750]();
}

uint64_t sub_211245F1C()
{
  return MEMORY[0x24BDF3768]();
}

uint64_t sub_211245F28()
{
  return MEMORY[0x24BDF3800]();
}

uint64_t sub_211245F34()
{
  return MEMORY[0x24BDF3840]();
}

uint64_t sub_211245F40()
{
  return MEMORY[0x24BDF38C0]();
}

uint64_t sub_211245F4C()
{
  return MEMORY[0x24BDF38E0]();
}

uint64_t sub_211245F58()
{
  return MEMORY[0x24BDF3900]();
}

uint64_t sub_211245F64()
{
  return MEMORY[0x24BDF3920]();
}

uint64_t sub_211245F70()
{
  return MEMORY[0x24BDF3A68]();
}

uint64_t sub_211245F7C()
{
  return MEMORY[0x24BDF3BD8]();
}

uint64_t sub_211245F88()
{
  return MEMORY[0x24BDF3BE8]();
}

uint64_t sub_211245F94()
{
  return MEMORY[0x24BDF3C78]();
}

uint64_t sub_211245FA0()
{
  return MEMORY[0x24BDF3C90]();
}

uint64_t sub_211245FAC()
{
  return MEMORY[0x24BDF3CF0]();
}

uint64_t sub_211245FB8()
{
  return MEMORY[0x24BDF3D10]();
}

uint64_t sub_211245FC4()
{
  return MEMORY[0x24BDF3D30]();
}

uint64_t sub_211245FD0()
{
  return MEMORY[0x24BDF3D78]();
}

uint64_t sub_211245FDC()
{
  return MEMORY[0x24BDF3D88]();
}

uint64_t sub_211245FE8()
{
  return MEMORY[0x24BDF3E08]();
}

uint64_t sub_211245FF4()
{
  return MEMORY[0x24BDF3EB0]();
}

uint64_t sub_211246000()
{
  return MEMORY[0x24BDF3EC0]();
}

uint64_t sub_21124600C()
{
  return MEMORY[0x24BDF3F58]();
}

uint64_t sub_211246018()
{
  return MEMORY[0x24BDF3F80]();
}

uint64_t sub_211246024()
{
  return MEMORY[0x24BDF3FE8]();
}

uint64_t sub_211246030()
{
  return MEMORY[0x24BDF40D8]();
}

uint64_t sub_21124603C()
{
  return MEMORY[0x24BDF4130]();
}

uint64_t sub_211246048()
{
  return MEMORY[0x24BDF4280]();
}

uint64_t sub_211246054()
{
  return MEMORY[0x24BDF4290]();
}

uint64_t sub_211246060()
{
  return MEMORY[0x24BDF42A8]();
}

uint64_t sub_21124606C()
{
  return MEMORY[0x24BDF42B0]();
}

uint64_t sub_211246078()
{
  return MEMORY[0x24BDF4300]();
}

uint64_t sub_211246084()
{
  return MEMORY[0x24BDF4340]();
}

uint64_t sub_211246090()
{
  return MEMORY[0x24BDF44E0]();
}

uint64_t sub_21124609C()
{
  return MEMORY[0x24BDF44E8]();
}

uint64_t sub_2112460A8()
{
  return MEMORY[0x24BDF44F0]();
}

uint64_t sub_2112460B4()
{
  return MEMORY[0x24BDF4508]();
}

uint64_t sub_2112460C0()
{
  return MEMORY[0x24BDF4510]();
}

uint64_t sub_2112460CC()
{
  return MEMORY[0x24BDF4790]();
}

uint64_t sub_2112460D8()
{
  return MEMORY[0x24BDF47B0]();
}

uint64_t sub_2112460E4()
{
  return MEMORY[0x24BDF47B8]();
}

uint64_t sub_2112460F0()
{
  return MEMORY[0x24BDF47C8]();
}

uint64_t sub_2112460FC()
{
  return MEMORY[0x24BDF47E0]();
}

uint64_t sub_211246108()
{
  return MEMORY[0x24BDF4870]();
}

uint64_t sub_211246114()
{
  return MEMORY[0x24BDF4908]();
}

uint64_t sub_211246120()
{
  return MEMORY[0x24BDF4918]();
}

uint64_t sub_21124612C()
{
  return MEMORY[0x24BDF49A0]();
}

uint64_t sub_211246138()
{
  return MEMORY[0x24BDF49B8]();
}

uint64_t sub_211246144()
{
  return MEMORY[0x24BDF4A28]();
}

uint64_t sub_211246150()
{
  return MEMORY[0x24BDF4A40]();
}

uint64_t sub_21124615C()
{
  return MEMORY[0x24BDF4AC8]();
}

uint64_t sub_211246168()
{
  return MEMORY[0x24BDF4BE0]();
}

uint64_t sub_211246174()
{
  return MEMORY[0x24BDF4C00]();
}

uint64_t sub_211246180()
{
  return MEMORY[0x24BDF4C08]();
}

uint64_t sub_21124618C()
{
  return MEMORY[0x24BDF4C18]();
}

uint64_t sub_211246198()
{
  return MEMORY[0x24BDF4D08]();
}

uint64_t sub_2112461A4()
{
  return MEMORY[0x24BDF4EC0]();
}

uint64_t sub_2112461B0()
{
  return MEMORY[0x24BDF4EC8]();
}

uint64_t sub_2112461BC()
{
  return MEMORY[0x24BDF4F18]();
}

uint64_t sub_2112461C8()
{
  return MEMORY[0x24BDF4F20]();
}

uint64_t sub_2112461D4()
{
  return MEMORY[0x24BDF4FC8]();
}

uint64_t sub_2112461E0()
{
  return MEMORY[0x24BDF4FE0]();
}

uint64_t sub_2112461EC()
{
  return MEMORY[0x24BDF5360]();
}

uint64_t sub_2112461F8()
{
  return MEMORY[0x24BDF5478]();
}

uint64_t sub_211246204()
{
  return MEMORY[0x24BDF5490]();
}

uint64_t sub_211246210()
{
  return MEMORY[0x24BDF54A0]();
}

uint64_t sub_21124621C()
{
  return MEMORY[0x24BEE5458]();
}

uint64_t sub_211246228()
{
  return MEMORY[0x24BEE54C8]();
}

uint64_t sub_211246234()
{
  return MEMORY[0x24BEE5500]();
}

uint64_t sub_211246240()
{
  return MEMORY[0x24BEE5570]();
}

uint64_t sub_21124624C()
{
  return MEMORY[0x24BEE5590]();
}

uint64_t sub_211246258()
{
  return MEMORY[0x24BEE5628]();
}

uint64_t sub_211246264()
{
  return MEMORY[0x24BE5D228]();
}

uint64_t sub_211246270()
{
  return MEMORY[0x24BE5D230]();
}

uint64_t sub_21124627C()
{
  return MEMORY[0x24BE5D2E8]();
}

uint64_t sub_211246288()
{
  return MEMORY[0x24BE5D2F8]();
}

uint64_t sub_211246294()
{
  return MEMORY[0x24BE5D308]();
}

uint64_t sub_2112462A0()
{
  return MEMORY[0x24BE5D330]();
}

uint64_t sub_2112462AC()
{
  return MEMORY[0x24BE5D378]();
}

uint64_t sub_2112462B8()
{
  return MEMORY[0x24BE5D380]();
}

uint64_t sub_2112462C4()
{
  return MEMORY[0x24BE5E218]();
}

uint64_t sub_2112462D0()
{
  return MEMORY[0x24BE5E230]();
}

uint64_t sub_2112462DC()
{
  return MEMORY[0x24BE5E238]();
}

uint64_t sub_2112462E8()
{
  return MEMORY[0x24BE5E250]();
}

uint64_t sub_2112462F4()
{
  return MEMORY[0x24BE5E260]();
}

uint64_t sub_211246300()
{
  return MEMORY[0x24BDCF808]();
}

uint64_t sub_21124630C()
{
  return MEMORY[0x24BDCF818]();
}

uint64_t sub_211246318()
{
  return MEMORY[0x24BDCF828]();
}

uint64_t sub_211246324()
{
  return MEMORY[0x24BDCF830]();
}

uint64_t sub_211246330()
{
  return MEMORY[0x24BEE02B0]();
}

uint64_t sub_21124633C()
{
  return MEMORY[0x24BEE0618]();
}

uint64_t sub_211246348()
{
  return MEMORY[0x24BEE0620]();
}

uint64_t sub_211246354()
{
  return MEMORY[0x24BEE0708]();
}

uint64_t sub_211246360()
{
  return MEMORY[0x24BEE07E0]();
}

uint64_t sub_21124636C()
{
  return MEMORY[0x24BEE0980]();
}

uint64_t sub_211246378()
{
  return MEMORY[0x24BDCF9E0]();
}

uint64_t sub_211246384()
{
  return MEMORY[0x24BDCFA08]();
}

uint64_t sub_211246390()
{
  return MEMORY[0x24BDCFA18]();
}

uint64_t sub_21124639C()
{
  return MEMORY[0x24BDCFA28]();
}

uint64_t sub_2112463A8()
{
  return MEMORY[0x24BDCFA38]();
}

uint64_t sub_2112463B4()
{
  return MEMORY[0x24BDCFA78]();
}

uint64_t sub_2112463C0()
{
  return MEMORY[0x24BDCFAC8]();
}

uint64_t sub_2112463CC()
{
  return MEMORY[0x24BDCFAF8]();
}

uint64_t sub_2112463D8()
{
  return MEMORY[0x24BEE09F0]();
}

uint64_t sub_2112463E4()
{
  return MEMORY[0x24BEE0A50]();
}

uint64_t sub_2112463F0()
{
  return MEMORY[0x24BEE0B20]();
}

uint64_t sub_2112463FC()
{
  return MEMORY[0x24BEE0B68]();
}

uint64_t sub_211246408()
{
  return MEMORY[0x24BEE0B70]();
}

uint64_t sub_211246414()
{
  return MEMORY[0x24BEE0B78]();
}

uint64_t sub_211246420()
{
  return MEMORY[0x24BEE0B80]();
}

uint64_t sub_21124642C()
{
  return MEMORY[0x24BEE0BB0]();
}

uint64_t sub_211246438()
{
  return MEMORY[0x24BEE0BC0]();
}

uint64_t sub_211246444()
{
  return MEMORY[0x24BEE0C10]();
}

uint64_t sub_211246450()
{
  return MEMORY[0x24BEE0C30]();
}

uint64_t sub_21124645C()
{
  return MEMORY[0x24BEE0C60]();
}

uint64_t sub_211246468()
{
  return MEMORY[0x24BEE0C90]();
}

uint64_t sub_211246474()
{
  return MEMORY[0x24BEE0CA0]();
}

uint64_t sub_211246480()
{
  return MEMORY[0x24BEE0D98]();
}

uint64_t sub_21124648C()
{
  return MEMORY[0x24BEE0DD0]();
}

uint64_t sub_211246498()
{
  return MEMORY[0x24BEE0DE0]();
}

uint64_t sub_2112464A4()
{
  return MEMORY[0x24BEE1110]();
}

uint64_t sub_2112464B0()
{
  return MEMORY[0x24BDCFBA8]();
}

uint64_t sub_2112464BC()
{
  return MEMORY[0x24BDCFBC8]();
}

uint64_t sub_2112464C8()
{
  return MEMORY[0x24BEE1128]();
}

uint64_t sub_2112464D4()
{
  return MEMORY[0x24BEE1160]();
}

uint64_t sub_2112464E0()
{
  return MEMORY[0x24BEE1190]();
}

uint64_t sub_2112464EC()
{
  return MEMORY[0x24BEE11B8]();
}

uint64_t sub_2112464F8()
{
  return MEMORY[0x24BDCFC08]();
}

uint64_t sub_211246504()
{
  return MEMORY[0x24BDCFC20]();
}

uint64_t sub_211246510()
{
  return MEMORY[0x24BEE6800]();
}

uint64_t sub_21124651C()
{
  return MEMORY[0x24BEE6820]();
}

uint64_t sub_211246528()
{
  return MEMORY[0x24BEE6828]();
}

uint64_t sub_211246534()
{
  return MEMORY[0x24BEE68C8]();
}

uint64_t sub_211246540()
{
  return MEMORY[0x24BEE6920]();
}

uint64_t sub_21124654C()
{
  return MEMORY[0x24BEE6928]();
}

uint64_t sub_211246558()
{
  return MEMORY[0x24BEE6940]();
}

uint64_t sub_211246564()
{
  return MEMORY[0x24BEE6988]();
}

uint64_t sub_211246570()
{
  return MEMORY[0x24BEE6990]();
}

uint64_t sub_21124657C()
{
  return MEMORY[0x24BEE6B38]();
}

uint64_t sub_211246588()
{
  return MEMORY[0x24BDCFD38]();
}

uint64_t sub_211246594()
{
  return MEMORY[0x24BEE18A0]();
}

uint64_t sub_2112465A0()
{
  return MEMORY[0x24BEE1908]();
}

uint64_t sub_2112465AC()
{
  return MEMORY[0x24BEE1910]();
}

uint64_t sub_2112465B8()
{
  return MEMORY[0x24BDCFDF8]();
}

uint64_t sub_2112465C4()
{
  return MEMORY[0x24BE07C48]();
}

uint64_t sub_2112465D0()
{
  return MEMORY[0x24BEE7920]();
}

uint64_t sub_2112465DC()
{
  return MEMORY[0x24BE07C50]();
}

uint64_t sub_2112465E8()
{
  return MEMORY[0x24BE07C58]();
}

uint64_t sub_2112465F4()
{
  return MEMORY[0x24BEBCC98]();
}

uint64_t sub_211246600()
{
  return MEMORY[0x24BEBCCA0]();
}

uint64_t sub_21124660C()
{
  return MEMORY[0x24BEE56B8]();
}

uint64_t sub_211246618()
{
  return MEMORY[0x24BEE5770]();
}

uint64_t sub_211246624()
{
  return MEMORY[0x24BEE5790]();
}

uint64_t sub_211246630()
{
  return MEMORY[0x24BDF5520]();
}

uint64_t sub_21124663C()
{
  return MEMORY[0x24BE07C60]();
}

uint64_t sub_211246648()
{
  return MEMORY[0x24BE07C68]();
}

uint64_t sub_211246654()
{
  return MEMORY[0x24BDF5528]();
}

uint64_t sub_211246660()
{
  return MEMORY[0x24BDC7B18]();
}

uint64_t sub_21124666C()
{
  return MEMORY[0x24BDC7B30]();
}

uint64_t sub_211246678()
{
  return MEMORY[0x24BDC7B48]();
}

uint64_t sub_211246684()
{
  return MEMORY[0x24BDC7B50]();
}

uint64_t sub_211246690()
{
  return MEMORY[0x24BDC7B98]();
}

uint64_t sub_21124669C()
{
  return MEMORY[0x24BEBCFC0]();
}

uint64_t sub_2112466A8()
{
  return MEMORY[0x24BDD0170]();
}

uint64_t sub_2112466B4()
{
  return MEMORY[0x24BDD0178]();
}

uint64_t sub_2112466C0()
{
  return MEMORY[0x24BDD01E0]();
}

uint64_t sub_2112466CC()
{
  return MEMORY[0x24BDD01F0]();
}

uint64_t sub_2112466D8()
{
  return MEMORY[0x24BDD01F8]();
}

uint64_t sub_2112466E4()
{
  return MEMORY[0x24BEE5BC0]();
}

uint64_t sub_2112466F0()
{
  return MEMORY[0x24BEE5BD0]();
}

uint64_t sub_2112466FC()
{
  return MEMORY[0x24BEBD030]();
}

uint64_t sub_211246708()
{
  return MEMORY[0x24BEBD220]();
}

uint64_t sub_211246714()
{
  return MEMORY[0x24BEE1C68]();
}

uint64_t sub_211246720()
{
  return MEMORY[0x24BEE1E58]();
}

uint64_t sub_21124672C()
{
  return MEMORY[0x24BDD04C8]();
}

uint64_t sub_211246738()
{
  return MEMORY[0x24BDD0548]();
}

uint64_t sub_211246744()
{
  return MEMORY[0x24BDD0570]();
}

uint64_t sub_211246750()
{
  return MEMORY[0x24BDD0590]();
}

uint64_t sub_21124675C()
{
  return MEMORY[0x24BEE20A8]();
}

uint64_t sub_211246768()
{
  return MEMORY[0x24BEE2238]();
}

uint64_t sub_211246774()
{
  return MEMORY[0x24BEE22B8]();
}

uint64_t sub_211246780()
{
  return MEMORY[0x24BEE22C0]();
}

uint64_t sub_21124678C()
{
  return MEMORY[0x24BEE2398]();
}

uint64_t sub_211246798()
{
  return MEMORY[0x24BEE23A0]();
}

uint64_t sub_2112467A4()
{
  return MEMORY[0x24BEE23A8]();
}

uint64_t sub_2112467B0()
{
  return MEMORY[0x24BEE23E8]();
}

uint64_t sub_2112467BC()
{
  return MEMORY[0x24BEE2500]();
}

uint64_t sub_2112467C8()
{
  return MEMORY[0x24BEE2508]();
}

uint64_t sub_2112467D4()
{
  return MEMORY[0x24BEE2510]();
}

uint64_t sub_2112467E0()
{
  return MEMORY[0x24BEE2518]();
}

uint64_t sub_2112467EC()
{
  return MEMORY[0x24BEE2658]();
}

uint64_t sub_2112467F8()
{
  return MEMORY[0x24BEE2660]();
}

uint64_t sub_211246804()
{
  return MEMORY[0x24BEE2838]();
}

uint64_t sub_211246810()
{
  return MEMORY[0x24BEE2840]();
}

uint64_t sub_21124681C()
{
  return MEMORY[0x24BEE2908]();
}

uint64_t sub_211246828()
{
  return MEMORY[0x24BEE2938]();
}

uint64_t sub_211246834()
{
  return MEMORY[0x24BEE2958]();
}

uint64_t sub_211246840()
{
  return MEMORY[0x24BEE2980]();
}

uint64_t sub_21124684C()
{
  return MEMORY[0x24BEE2988]();
}

uint64_t sub_211246858()
{
  return MEMORY[0x24BEE6DB0]();
}

uint64_t sub_211246864()
{
  return MEMORY[0x24BEE6DB8]();
}

uint64_t sub_211246870()
{
  return MEMORY[0x24BEE6DC8]();
}

uint64_t sub_21124687C()
{
  return MEMORY[0x24BEE6E10]();
}

uint64_t sub_211246888()
{
  return MEMORY[0x24BEE2BE0]();
}

uint64_t sub_211246894()
{
  return MEMORY[0x24BEE2E58]();
}

uint64_t sub_2112468A0()
{
  return MEMORY[0x24BEE2E68]();
}

uint64_t sub_2112468AC()
{
  return MEMORY[0x24BEE2E70]();
}

uint64_t sub_2112468B8()
{
  return MEMORY[0x24BEE2F48]();
}

uint64_t sub_2112468C4()
{
  return MEMORY[0x24BEE3068]();
}

uint64_t sub_2112468D0()
{
  return MEMORY[0x24BEE3088]();
}

uint64_t sub_2112468DC()
{
  return MEMORY[0x24BEE3098]();
}

uint64_t sub_2112468E8()
{
  return MEMORY[0x24BEE31D0]();
}

uint64_t sub_2112468F4()
{
  return MEMORY[0x24BEE3278]();
}

uint64_t sub_211246900()
{
  return MEMORY[0x24BEE3290]();
}

uint64_t sub_21124690C()
{
  return MEMORY[0x24BEE32D8]();
}

uint64_t sub_211246918()
{
  return MEMORY[0x24BEE3308]();
}

uint64_t sub_211246924()
{
  return MEMORY[0x24BEE3350]();
}

uint64_t sub_211246930()
{
  return MEMORY[0x24BEE3360]();
}

uint64_t sub_21124693C()
{
  return MEMORY[0x24BEE3370]();
}

uint64_t sub_211246948()
{
  return MEMORY[0x24BEE3380]();
}

uint64_t sub_211246954()
{
  return MEMORY[0x24BEE3428]();
}

uint64_t sub_211246960()
{
  return MEMORY[0x24BEE3458]();
}

uint64_t sub_21124696C()
{
  return MEMORY[0x24BEE34A0]();
}

uint64_t sub_211246978()
{
  return MEMORY[0x24BEE34B0]();
}

uint64_t sub_211246984()
{
  return MEMORY[0x24BEE34C0]();
}

uint64_t sub_211246990()
{
  return MEMORY[0x24BEE34D0]();
}

uint64_t sub_21124699C()
{
  return MEMORY[0x24BEE3548]();
}

uint64_t sub_2112469A8()
{
  return MEMORY[0x24BEE7040]();
}

uint64_t sub_2112469B4()
{
  return MEMORY[0x24BEE3A20]();
}

uint64_t sub_2112469C0()
{
  return MEMORY[0x24BEE3A30]();
}

uint64_t sub_2112469CC()
{
  return MEMORY[0x24BEE70E0]();
}

uint64_t sub_2112469D8()
{
  return MEMORY[0x24BEE3ED8]();
}

uint64_t sub_2112469E4()
{
  return MEMORY[0x24BEE7148]();
}

uint64_t sub_2112469F0()
{
  return MEMORY[0x24BDD06D8]();
}

uint64_t sub_2112469FC()
{
  return MEMORY[0x24BDD06E0]();
}

uint64_t sub_211246A08()
{
  return MEMORY[0x24BDD06F0]();
}

uint64_t sub_211246A14()
{
  return MEMORY[0x24BDD0708]();
}

uint64_t sub_211246A20()
{
  return MEMORY[0x24BEE3EF8]();
}

uint64_t sub_211246A2C()
{
  return MEMORY[0x24BEE3F00]();
}

uint64_t sub_211246A38()
{
  return MEMORY[0x24BEE3F08]();
}

uint64_t sub_211246A44()
{
  return MEMORY[0x24BEE3F10]();
}

uint64_t sub_211246A50()
{
  return MEMORY[0x24BEE42C0]();
}

uint64_t sub_211246A5C()
{
  return MEMORY[0x24BEE42E0]();
}

uint64_t sub_211246A68()
{
  return MEMORY[0x24BEE42F8]();
}

uint64_t sub_211246A74()
{
  return MEMORY[0x24BEE4328]();
}

uint64_t sub_211246A80()
{
  return MEMORY[0x24BEE4608]();
}

uint64_t sub_211246A8C()
{
  return MEMORY[0x24BEE4638]();
}

uint64_t sub_211246A98()
{
  return MEMORY[0x24BEE4A08]();
}

uint64_t sub_211246AA4()
{
  return MEMORY[0x24BEE4A10]();
}

uint64_t AMSCustomError()
{
  return MEMORY[0x24BE07CF0]();
}

uint64_t AMSError()
{
  return MEMORY[0x24BE07D18]();
}

uint64_t AMSErrorIsEqual()
{
  return MEMORY[0x24BE07D28]();
}

uint64_t AMSErrorWithFormat()
{
  return MEMORY[0x24BE07D50]();
}

uint64_t AMSGenerateLogCorrelationKey()
{
  return MEMORY[0x24BE07D60]();
}

uint64_t AMSHashIfNeeded()
{
  return MEMORY[0x24BE07DF0]();
}

uint64_t AMSLogKey()
{
  return MEMORY[0x24BE07E08]();
}

uint64_t AMSLogableError()
{
  return MEMORY[0x24BE07E10]();
}

uint64_t AMSLogableURL()
{
  return MEMORY[0x24BE07E18]();
}

uint64_t AMSNormalisedCountryCodeForPaymentRequest()
{
  return MEMORY[0x24BE07EC8]();
}

uint64_t AMSSetLogKey()
{
  return MEMORY[0x24BE07FE0]();
}

uint64_t AMSSetLogKeyIfNeeded()
{
  return MEMORY[0x24BE07FE8]();
}

CFTimeInterval CACurrentMediaTime(void)
{
  CFTimeInterval result;

  MEMORY[0x24BDE5410]();
  return result;
}

CATransform3D *__cdecl CATransform3DMakeScale(CATransform3D *__return_ptr retstr, CGFloat sx, CGFloat sy, CGFloat sz)
{
  return (CATransform3D *)MEMORY[0x24BDE55D0](retstr, sx, sy, sz);
}

CFTypeID CFArrayGetTypeID(void)
{
  return MEMORY[0x24BDBB850]();
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x24BDBBEF8](cf);
}

void CFNotificationCenterAddObserver(CFNotificationCenterRef center, const void *observer, CFNotificationCallback callBack, CFStringRef name, const void *object, CFNotificationSuspensionBehavior suspensionBehavior)
{
  MEMORY[0x24BDBC040](center, observer, callBack, name, object, suspensionBehavior);
}

CFNotificationCenterRef CFNotificationCenterGetDistributedCenter(void)
{
  return (CFNotificationCenterRef)MEMORY[0x24BDBC058]();
}

Boolean CFPreferencesAppSynchronize(CFStringRef applicationID)
{
  return MEMORY[0x24BDBC150](applicationID);
}

Boolean CFPreferencesGetAppBooleanValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return MEMORY[0x24BDBC188](key, applicationID, keyExistsAndHasValidFormat);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x24BDBC298](cf);
}

CGAffineTransform *__cdecl CGAffineTransformMakeScale(CGAffineTransform *__return_ptr retstr, CGFloat sx, CGFloat sy)
{
  return (CGAffineTransform *)MEMORY[0x24BDBD8E0](retstr, sx, sy);
}

CGAffineTransform *__cdecl CGAffineTransformScale(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t, CGFloat sx, CGFloat sy)
{
  return (CGAffineTransform *)MEMORY[0x24BDBD900](retstr, t, sx, sy);
}

CGAffineTransform *__cdecl CGAffineTransformTranslate(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t, CGFloat tx, CGFloat ty)
{
  return (CGAffineTransform *)MEMORY[0x24BDBD908](retstr, t, tx, ty);
}

CGColorRef CGColorCreateGenericRGB(CGFloat red, CGFloat green, CGFloat blue, CGFloat alpha)
{
  return (CGColorRef)MEMORY[0x24BDBDAA8](red, green, blue, alpha);
}

CGFloat CGColorGetAlpha(CGColorRef color)
{
  CGFloat result;

  MEMORY[0x24BDBDAE8](color);
  return result;
}

CGImageRef CGImageCreateWithImageInRect(CGImageRef image, CGRect rect)
{
  return (CGImageRef)MEMORY[0x24BDBE5F8](image, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

void CGImageRelease(CGImageRef image)
{
  MEMORY[0x24BDBE770](image);
}

CGRect CGRectApplyAffineTransform(CGRect rect, CGAffineTransform *t)
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  MEMORY[0x24BDBEFB8](t, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

BOOL CGRectEqualToRect(CGRect rect1, CGRect rect2)
{
  return MEMORY[0x24BDBEFE0]((__n128)rect1.origin, *(__n128 *)&rect1.origin.y, (__n128)rect1.size, *(__n128 *)&rect1.size.height, (__n128)rect2.origin, *(__n128 *)&rect2.origin.y, (__n128)rect2.size, *(__n128 *)&rect2.size.height);
}

CGFloat CGRectGetHeight(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBEFE8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMaxX(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBEFF0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMaxY(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBEFF8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMidX(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBF000]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMidY(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBF008]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMinX(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBF010]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMinY(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBF018]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetWidth(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBF020]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGRect CGRectIntersection(CGRect r1, CGRect r2)
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  MEMORY[0x24BDBF040]((__n128)r1.origin, *(__n128 *)&r1.origin.y, (__n128)r1.size, *(__n128 *)&r1.size.height, (__n128)r2.origin, *(__n128 *)&r2.origin.y, (__n128)r2.size, *(__n128 *)&r2.size.height);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

uint64_t CPPhoneNumberCopyFormattedStringForTextMessage()
{
  return MEMORY[0x24BE046F8]();
}

uint64_t HSAAuthenticationRegisterIncomingAuthenticationTokenBlockWithIdentifier()
{
  return MEMORY[0x24BE3F2F8]();
}

uint64_t HSAAuthenticationUnregisterIncomingAuthenticationTokenBlockWithIdentifier()
{
  return MEMORY[0x24BE3F300]();
}

uint64_t MGGetBoolAnswer()
{
  return MEMORY[0x24BED8470]();
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x24BDD0B80](aClassName);
}

void NSLog(NSString *format, ...)
{
  MEMORY[0x24BDD1000](format);
}

NSString *__cdecl NSStringFromCGSize(CGSize size)
{
  return (NSString *)MEMORY[0x24BEBD2C8]((__n128)size, *(__n128 *)&size.height);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x24BDD1268](aSelector);
}

uint64_t PKCanMakePaymentsUsingNetworksIssuerCountryCodesWithCapabilities()
{
  return MEMORY[0x24BE6F1C8]();
}

uint64_t PRXCardDefaultSize()
{
  return MEMORY[0x24BE7B410]();
}

uint64_t PRXExpectedCardWidthForStyle()
{
  return MEMORY[0x24BE7B418]();
}

uint64_t PRXIsPad()
{
  return MEMORY[0x24BE7B420]();
}

CFTypeRef SecTaskCopyValueForEntitlement(SecTaskRef task, CFStringRef entitlement, CFErrorRef *error)
{
  return (CFTypeRef)MEMORY[0x24BDE8D48](task, entitlement, error);
}

SecTaskRef SecTaskCreateFromSelf(CFAllocatorRef allocator)
{
  return (SecTaskRef)MEMORY[0x24BDE8D70](allocator);
}

BOOL UIAccessibilityButtonShapesEnabled(void)
{
  return MEMORY[0x24BEBDDC0]();
}

BOOL UIAccessibilityDarkerSystemColorsEnabled(void)
{
  return MEMORY[0x24BEBDDE0]();
}

BOOL UIAccessibilityIsAssistiveTouchRunning(void)
{
  return MEMORY[0x24BEBDE08]();
}

BOOL UIAccessibilityIsBoldTextEnabled(void)
{
  return MEMORY[0x24BEBDE10]();
}

BOOL UIAccessibilityIsClosedCaptioningEnabled(void)
{
  return MEMORY[0x24BEBDE18]();
}

BOOL UIAccessibilityIsGrayscaleEnabled(void)
{
  return MEMORY[0x24BEBDE20]();
}

BOOL UIAccessibilityIsGuidedAccessEnabled(void)
{
  return MEMORY[0x24BEBDE28]();
}

BOOL UIAccessibilityIsInvertColorsEnabled(void)
{
  return MEMORY[0x24BEBDE30]();
}

BOOL UIAccessibilityIsMonoAudioEnabled(void)
{
  return MEMORY[0x24BEBDE38]();
}

BOOL UIAccessibilityIsOnOffSwitchLabelsEnabled(void)
{
  return MEMORY[0x24BEBDE40]();
}

BOOL UIAccessibilityIsReduceMotionEnabled(void)
{
  return MEMORY[0x24BEBDE48]();
}

BOOL UIAccessibilityIsReduceTransparencyEnabled(void)
{
  return MEMORY[0x24BEBDE50]();
}

BOOL UIAccessibilityIsShakeToUndoEnabled(void)
{
  return MEMORY[0x24BEBDE58]();
}

BOOL UIAccessibilityIsSpeakScreenEnabled(void)
{
  return MEMORY[0x24BEBDE60]();
}

BOOL UIAccessibilityIsSpeakSelectionEnabled(void)
{
  return MEMORY[0x24BEBDE68]();
}

BOOL UIAccessibilityIsSwitchControlRunning(void)
{
  return MEMORY[0x24BEBDE70]();
}

BOOL UIAccessibilityIsVideoAutoplayEnabled(void)
{
  return MEMORY[0x24BEBDE78]();
}

BOOL UIAccessibilityIsVoiceOverRunning(void)
{
  return MEMORY[0x24BEBDE80]();
}

BOOL UIAccessibilityPrefersCrossFadeTransitions(void)
{
  return MEMORY[0x24BEBDEA0]();
}

BOOL UIAccessibilityShouldDifferentiateWithoutColor(void)
{
  return MEMORY[0x24BEBDED0]();
}

BOOL UIContentSizeCategoryIsAccessibilityCategory(UIContentSizeCategory category)
{
  return MEMORY[0x24BEBE0B0](category);
}

void UIGraphicsBeginImageContext(CGSize size)
{
  MEMORY[0x24BEBE278]((__n128)size, *(__n128 *)&size.height);
}

void UIGraphicsBeginImageContextWithOptions(CGSize size, BOOL opaque, CGFloat scale)
{
  MEMORY[0x24BEBE280](opaque, (__n128)size, *(__n128 *)&size.height, scale);
}

void UIGraphicsEndImageContext(void)
{
  MEMORY[0x24BEBE298]();
}

CGContextRef UIGraphicsGetCurrentContext(void)
{
  return (CGContextRef)MEMORY[0x24BEBE2A8]();
}

UIImage *UIGraphicsGetImageFromCurrentImageContext(void)
{
  return (UIImage *)MEMORY[0x24BEBE2B0]();
}

NSData *__cdecl UIImageJPEGRepresentation(UIImage *image, CGFloat compressionQuality)
{
  return (NSData *)MEMORY[0x24BEBE2D8](image, compressionQuality);
}

NSData *__cdecl UIImagePNGRepresentation(UIImage *image)
{
  return (NSData *)MEMORY[0x24BEBE2E0](image);
}

uint64_t UIKeyboardOrderOutAutomatic()
{
  return MEMORY[0x24BEBE530]();
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

uint64_t _os_feature_enabled_impl()
{
  return MEMORY[0x24BDACB60]();
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB90](dso, log, type, format, buf, *(_QWORD *)&size);
}

uint64_t _sl_dlopen()
{
  return MEMORY[0x24BEAE670]();
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x24BEE4B38]();
}

uint64_t abort_report_np()
{
  return MEMORY[0x24BDAD010]();
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADC60](when, queue, block);
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
  MEMORY[0x24BDADCA8](queue);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADCC0](queue, block);
}

void dispatch_barrier_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADCE0](queue, block);
}

void dispatch_block_cancel(dispatch_block_t block)
{
  MEMORY[0x24BDADD10](block);
}

dispatch_block_t dispatch_block_create(dispatch_block_flags_t flags, dispatch_block_t block)
{
  return (dispatch_block_t)MEMORY[0x24BDADD18](flags, block);
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x24BDADDA8](identifier, flags);
}

dispatch_group_t dispatch_group_create(void)
{
  return (dispatch_group_t)MEMORY[0x24BDADDC8]();
}

void dispatch_group_enter(dispatch_group_t group)
{
  MEMORY[0x24BDADDD0](group);
}

void dispatch_group_leave(dispatch_group_t group)
{
  MEMORY[0x24BDADDD8](group);
}

intptr_t dispatch_group_wait(dispatch_group_t group, dispatch_time_t timeout)
{
  return MEMORY[0x24BDADDF0](group, timeout);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x24BDADE98](predicate, block);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x24BDADED0](label, attr);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADFE8](queue, block);
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x24BDADFF8](when, delta);
}

char *dlerror(void)
{
  return (char *)MEMORY[0x24BDAE068]();
}

void *__cdecl dlopen(const char *__path, int __mode)
{
  return (void *)MEMORY[0x24BDAE070](__path, *(_QWORD *)&__mode);
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x24BDAE088](__handle, __symbol);
}

void free(void *a1)
{
  MEMORY[0x24BDAE450](a1);
}

htmlParserCtxtPtr htmlCreateMemoryParserCtxt(const char *buffer, int size)
{
  return (htmlParserCtxtPtr)MEMORY[0x24BEDE558](buffer, *(_QWORD *)&size);
}

int htmlCtxtUseOptions(htmlParserCtxtPtr ctxt, int options)
{
  return MEMORY[0x24BEDE568](ctxt, *(_QWORD *)&options);
}

int htmlParseDocument(htmlParserCtxtPtr ctxt)
{
  return MEMORY[0x24BEDE5A8](ctxt);
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

void objc_autoreleasePoolPop(void *context)
{
  MEMORY[0x24BEDCFB0](context);
}

void *objc_autoreleasePoolPush(void)
{
  return (void *)MEMORY[0x24BEDCFC0]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDCFD0](a1);
}

id objc_begin_catch(void *exc_buf)
{
  return (id)MEMORY[0x24BEDCFD8](exc_buf);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x24BEDCFE8]();
}

void objc_copyStruct(void *dest, const void *src, ptrdiff_t size, BOOL atomic, BOOL hasStrong)
{
  MEMORY[0x24BEDD020](dest, src, size, atomic, hasStrong);
}

void objc_copyWeak(id *to, id *from)
{
  MEMORY[0x24BEDD030](to, from);
}

void objc_destroyWeak(id *location)
{
  MEMORY[0x24BEDD038](location);
}

void objc_end_catch(void)
{
  MEMORY[0x24BEDD050]();
}

void objc_enumerationMutation(id obj)
{
  MEMORY[0x24BEDD068](obj);
}

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x24BEDD088](name);
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x24BEDD0B0](self, _cmd, offset, atomic);
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

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x24BEDD2C0](a1);
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x24BEDD3D0](self, _cmd, newValue, offset);
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

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD458](a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
  MEMORY[0x24BDAF460](lock);
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
  MEMORY[0x24BDAF488](lock);
}

uint64_t os_variant_has_internal_content()
{
  return MEMORY[0x24BDAF4D0]();
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

uint64_t swift_getGenericMetadata()
{
  return MEMORY[0x24BEE4D80]();
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

uint64_t swift_getTupleTypeLayout2()
{
  return MEMORY[0x24BEE4DE0]();
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

uint64_t swift_willThrow()
{
  return MEMORY[0x24BEE5050]();
}

uint64_t swift_willThrowTypedImpl()
{
  return MEMORY[0x24BEE5058]();
}

xmlErrorPtr xmlCtxtGetLastError(void *ctx)
{
  return (xmlErrorPtr)MEMORY[0x24BEDE6C8](ctx);
}

void xmlFreeDoc(xmlDocPtr cur)
{
  MEMORY[0x24BEDE760](cur);
}

void xmlFreeParserCtxt(xmlParserCtxtPtr ctxt)
{
  MEMORY[0x24BEDE798](ctxt);
}

void xmlInitParser(void)
{
  MEMORY[0x24BEDE8C0]();
}

void xmlStopParser(xmlParserCtxtPtr ctxt)
{
  MEMORY[0x24BEDEC20](ctxt);
}

int xmlStrEqual(const xmlChar *str1, const xmlChar *str2)
{
  return MEMORY[0x24BEDEC28](str1, str2);
}

int xmlStrlen(const xmlChar *str)
{
  return MEMORY[0x24BEDEC78](str);
}

