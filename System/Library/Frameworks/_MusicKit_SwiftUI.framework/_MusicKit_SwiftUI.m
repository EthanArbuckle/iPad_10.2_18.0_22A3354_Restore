void sub_226EE8888(_QWORD *a1@<X8>)
{
  *a1 = 0;
}

uint64_t EnvironmentValues.artworkLoadingObserver.getter()
{
  uint64_t v1;

  sub_226EE88CC();
  sub_226F01410();
  return v1;
}

unint64_t sub_226EE88CC()
{
  unint64_t result;

  result = qword_2558AC788;
  if (!qword_2558AC788)
  {
    result = MEMORY[0x2276A650C](&unk_226F01FBC, &_s15LoadingObserverVN);
    atomic_store(result, (unint64_t *)&qword_2558AC788);
  }
  return result;
}

uint64_t sub_226EE8908@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  result = EnvironmentValues.artworkLoadingObserver.getter();
  *a1 = result;
  return result;
}

uint64_t sub_226EE8930()
{
  swift_retain();
  return EnvironmentValues.artworkLoadingObserver.setter();
}

uint64_t EnvironmentValues.artworkLoadingObserver.setter()
{
  sub_226EE88CC();
  return sub_226F0141C();
}

uint64_t (*EnvironmentValues.artworkLoadingObserver.modify(uint64_t a1))(_QWORD *a1, char a2)
{
  uint64_t v1;

  *(_QWORD *)(a1 + 16) = v1;
  *(_QWORD *)(a1 + 24) = sub_226EE88CC();
  sub_226F01410();
  return sub_226EE89DC;
}

uint64_t sub_226EE89DC(_QWORD *a1, char a2)
{
  a1[1] = *a1;
  if ((a2 & 1) == 0)
    return OUTLINED_FUNCTION_0();
  swift_retain();
  OUTLINED_FUNCTION_0();
  return swift_release();
}

__n128 __swift_memcpy16_8(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  *a1 = *a2;
  return result;
}

uint64_t sub_226EE8A54(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 16))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t sub_226EE8A74(uint64_t result, int a2, int a3)
{
  char v3;

  if (a2)
  {
    *(_QWORD *)result = (a2 - 1);
    *(_QWORD *)(result + 8) = 0;
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
  *(_BYTE *)(result + 16) = v3;
  return result;
}

void type metadata accessor for CGSize(uint64_t a1)
{
  sub_226EE8D64(a1, &qword_253F43248);
}

ValueMetadata *_s15LoadingObserverVMa()
{
  return &_s15LoadingObserverVN;
}

uint64_t sub_226EE8AC0(uint64_t a1, id *a2)
{
  uint64_t result;

  result = sub_226F01740();
  *a2 = 0;
  return result;
}

uint64_t sub_226EE8B34(uint64_t a1, id *a2)
{
  char v3;

  v3 = sub_226F0174C();
  *a2 = 0;
  return v3 & 1;
}

uint64_t sub_226EE8BB0()
{
  uint64_t v0;

  sub_226F01758();
  v0 = sub_226F01734();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t sub_226EE8BE4()
{
  uint64_t *v0;

  return sub_226EE8C50(*v0, (uint64_t (*)(uint64_t))MEMORY[0x24BDCF9E0]);
}

uint64_t sub_226EE8C0C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  result = sub_226EE8BB0();
  *a1 = result;
  return result;
}

uint64_t sub_226EE8C30()
{
  uint64_t *v0;

  return sub_226EE8C50(*v0, MEMORY[0x24BEE0CD8]);
}

uint64_t sub_226EE8C50(uint64_t a1, uint64_t (*a2)(uint64_t))
{
  uint64_t v3;
  uint64_t v4;

  v3 = sub_226F01758();
  v4 = a2(v3);
  swift_bridgeObjectRelease();
  return v4;
}

uint64_t sub_226EE8C88()
{
  return sub_226EE8C90();
}

uint64_t sub_226EE8C90()
{
  sub_226F01758();
  sub_226F01770();
  return swift_bridgeObjectRelease();
}

uint64_t sub_226EE8CD0()
{
  return sub_226EFBAEC();
}

uint64_t sub_226EE8CD8()
{
  return sub_226EFA0BC();
}

uint64_t sub_226EE8CE4@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2;
  uint64_t result;

  v2 = sub_226F01734();
  result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_226EE8D28@<X0>(uint64_t *a1@<X8>)
{
  _QWORD *v1;
  uint64_t result;
  uint64_t v4;

  result = sub_226EFBB50(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

void type metadata accessor for MusicKit_SPI_SKCloudServiceSetupOptionsKey(uint64_t a1)
{
  sub_226EE8D64(a1, &qword_2558AC790);
}

void sub_226EE8D64(uint64_t a1, unint64_t *a2)
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

uint64_t sub_226EE8DA8()
{
  sub_226EE8E5C((unint64_t *)&qword_2558AC7B0, (uint64_t)&unk_226F02130);
  sub_226EE8E5C(&qword_2558AC7B8, (uint64_t)&unk_226F02090);
  return sub_226F018CC();
}

uint64_t sub_226EE8E14()
{
  return sub_226EE8E5C(&qword_2558AC798, (uint64_t)&unk_226F02058);
}

uint64_t sub_226EE8E38()
{
  return sub_226EE8E5C(&qword_2558AC7A0, (uint64_t)&unk_226F02030);
}

uint64_t sub_226EE8E5C(unint64_t *a1, uint64_t a2)
{
  uint64_t result;
  uint64_t v5;

  result = *a1;
  if (!result)
  {
    type metadata accessor for MusicKit_SPI_SKCloudServiceSetupOptionsKey(255);
    result = MEMORY[0x2276A650C](a2, v5);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_226EE8E9C()
{
  return sub_226EE8E5C(&qword_2558AC7A8, (uint64_t)&unk_226F020C0);
}

uint64_t OUTLINED_FUNCTION_0()
{
  return sub_226F0141C();
}

uint64_t static Artwork._LoadingError.== infix(_:_:)()
{
  return 1;
}

uint64_t Artwork._LoadingError.hash(into:)()
{
  return sub_226F01938();
}

uint64_t Artwork._LoadingError.hashValue.getter()
{
  sub_226F0192C();
  sub_226F01938();
  return sub_226F0195C();
}

uint64_t sub_226EE8F4C()
{
  return 1;
}

uint64_t sub_226EE8F54()
{
  return Artwork._LoadingError.hashValue.getter();
}

uint64_t sub_226EE8F68()
{
  return Artwork._LoadingError.hash(into:)();
}

uint64_t sub_226EE8F7C()
{
  sub_226F0192C();
  sub_226F01938();
  return sub_226F0195C();
}

unint64_t sub_226EE8FBC()
{
  unint64_t result;

  result = qword_2558AC7C0;
  if (!qword_2558AC7C0)
  {
    result = MEMORY[0x2276A650C](&protocol conformance descriptor for Artwork._LoadingError, &type metadata for Artwork._LoadingError);
    atomic_store(result, (unint64_t *)&qword_2558AC7C0);
  }
  return result;
}

uint64_t _s13_LoadingErrorOwet(unsigned int *a1, int a2)
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

uint64_t _s13_LoadingErrorOwst(uint64_t a1, int a2, int a3)
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
    return ((uint64_t (*)(void))((char *)sub_226EE908C + 4 * byte_226F02180[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_226EE90AC + 4 * byte_226F02185[v4]))();
}

_BYTE *sub_226EE908C(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_226EE90AC(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_226EE90B4(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_226EE90BC(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_226EE90C4(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_226EE90CC(_DWORD *result)
{
  *result = 0;
  return result;
}

uint64_t sub_226EE90D8()
{
  return 0;
}

ValueMetadata *type metadata accessor for Artwork._LoadingError()
{
  return &type metadata for Artwork._LoadingError;
}

uint64_t sub_226EE90F4()
{
  return swift_allocateGenericValueMetadata();
}

uint64_t sub_226EE90FC()
{
  uint64_t result;
  unint64_t v1;
  unint64_t v2;

  result = sub_226F01638();
  if (v1 <= 0x3F)
  {
    result = sub_226F015FC();
    if (v2 <= 0x3F)
    {
      swift_initEnumMetadataMultiPayload();
      return 0;
    }
  }
  return result;
}

uint64_t *sub_226EE9188(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  char *v11;
  void (*v12)(char *, char *, uint64_t);
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  v5 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v13 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v13 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v7 = a2[1];
      *a1 = *a2;
      a1[1] = v7;
      v8 = *(_QWORD *)(a3 + 16);
      v9 = *(int *)(sub_226F015FC() + 32);
      v10 = (char *)a1 + v9;
      v11 = (char *)a2 + v9;
      v12 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v8 - 8) + 16);
      swift_retain();
      swift_retain();
      v12(v10, v11, v8);
    }
    else
    {
      v14 = sub_226F0162C();
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v14 - 8) + 16))(a1, a2, v14);
      v15 = sub_226F01638();
      *(uint64_t *)((char *)a1 + *(int *)(v15 + 28)) = *(uint64_t *)((char *)a2 + *(int *)(v15 + 28));
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

uint64_t sub_226EE92B8(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v7;

  if (swift_getEnumCaseMultiPayload() == 1)
  {
    swift_release();
    swift_release();
    v4 = *(_QWORD *)(a2 + 16);
    v5 = a1 + *(int *)(sub_226F015FC() + 32);
    return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v5, v4);
  }
  else
  {
    v7 = sub_226F0162C();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 8))(a1, v7);
    sub_226F01638();
    return swift_release();
  }
}

_QWORD *sub_226EE935C(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  char *v10;
  void (*v11)(char *, char *, uint64_t);
  uint64_t v12;
  uint64_t v13;

  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v6 = a2[1];
    *a1 = *a2;
    a1[1] = v6;
    v7 = *(_QWORD *)(a3 + 16);
    v8 = *(int *)(sub_226F015FC() + 32);
    v9 = (char *)a1 + v8;
    v10 = (char *)a2 + v8;
    v11 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v7 - 8) + 16);
    swift_retain();
    swift_retain();
    v11(v9, v10, v7);
  }
  else
  {
    v12 = sub_226F0162C();
    (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v12 - 8) + 16))(a1, a2, v12);
    v13 = sub_226F01638();
    *(_QWORD *)((char *)a1 + *(int *)(v13 + 28)) = *(_QWORD *)((char *)a2 + *(int *)(v13 + 28));
    swift_retain();
  }
  swift_storeEnumTagMultiPayload();
  return a1;
}

_QWORD *sub_226EE9460(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  char *v8;
  char *v9;
  void (*v10)(char *, char *, uint64_t);
  uint64_t v11;
  uint64_t v12;

  if (a1 != a2)
  {
    (*(void (**)(_QWORD *, uint64_t))(*(_QWORD *)(a3 - 8) + 8))(a1, a3);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      *a1 = *a2;
      a1[1] = a2[1];
      v6 = *(_QWORD *)(a3 + 16);
      v7 = *(int *)(sub_226F015FC() + 32);
      v8 = (char *)a1 + v7;
      v9 = (char *)a2 + v7;
      v10 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v6 - 8) + 16);
      swift_retain();
      swift_retain();
      v10(v8, v9, v6);
    }
    else
    {
      v11 = sub_226F0162C();
      (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v11 - 8) + 16))(a1, a2, v11);
      v12 = sub_226F01638();
      *(_QWORD *)((char *)a1 + *(int *)(v12 + 28)) = *(_QWORD *)((char *)a2 + *(int *)(v12 + 28));
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

char *sub_226EE9588(char *a1, char *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v6 = *((_QWORD *)a2 + 1);
    *(_QWORD *)a1 = *(_QWORD *)a2;
    *((_QWORD *)a1 + 1) = v6;
    v7 = *(_QWORD *)(a3 + 16);
    v8 = sub_226F015FC();
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v7 - 8) + 32))(&a1[*(int *)(v8 + 32)], &a2[*(int *)(v8 + 32)], v7);
  }
  else
  {
    v9 = sub_226F0162C();
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v9 - 8) + 32))(a1, a2, v9);
    v10 = sub_226F01638();
    *(_QWORD *)&a1[*(int *)(v10 + 28)] = *(_QWORD *)&a2[*(int *)(v10 + 28)];
  }
  swift_storeEnumTagMultiPayload();
  return a1;
}

char *sub_226EE9660(char *a1, char *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  if (a1 != a2)
  {
    (*(void (**)(char *, uint64_t))(*(_QWORD *)(a3 - 8) + 8))(a1, a3);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v6 = *((_QWORD *)a2 + 1);
      *(_QWORD *)a1 = *(_QWORD *)a2;
      *((_QWORD *)a1 + 1) = v6;
      v7 = *(_QWORD *)(a3 + 16);
      v8 = sub_226F015FC();
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v7 - 8) + 32))(&a1[*(int *)(v8 + 32)], &a2[*(int *)(v8 + 32)], v7);
    }
    else
    {
      v9 = sub_226F0162C();
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v9 - 8) + 32))(a1, a2, v9);
      v10 = sub_226F01638();
      *(_QWORD *)&a1[*(int *)(v10 + 28)] = *(_QWORD *)&a2[*(int *)(v10 + 28)];
    }
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

uint64_t __swift_getEnumTagSinglePayload(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a3 - 8) + 48))();
}

uint64_t __swift_storeEnumTagSinglePayload(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a4 - 8) + 56))();
}

uint64_t sub_226EE9778()
{
  return swift_storeEnumTagMultiPayload();
}

uint64_t type metadata accessor for MusicLazyStateOrBinding(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for MusicLazyStateOrBinding);
}

uint64_t sub_226EE9794()
{
  return sub_226F01398();
}

uint64_t __swift_instantiateGenericMetadata(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _QWORD v6[3];

  v6[0] = a2;
  v6[1] = a3;
  v6[2] = a4;
  return MEMORY[0x2276A64A0](a1, v6, a5);
}

uint64_t *sub_226EE97D8(uint64_t *a1, uint64_t *a2, int *a3)
{
  int v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  _QWORD *v12;
  _QWORD *v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD *v16;
  _QWORD *v17;
  uint64_t v18;
  id v19;
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
    v7 = sub_226F016F8();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a1, a2, v7);
    v8 = a3[5];
    v9 = a3[6];
    v10 = *(void **)((char *)a2 + v8);
    *(uint64_t *)((char *)a1 + v8) = (uint64_t)v10;
    *(uint64_t *)((char *)a1 + v9) = *(uint64_t *)((char *)a2 + v9);
    v11 = a3[8];
    *(_OWORD *)((char *)a1 + a3[7]) = *(_OWORD *)((char *)a2 + a3[7]);
    v12 = (uint64_t *)((char *)a1 + v11);
    v13 = (uint64_t *)((char *)a2 + v11);
    v14 = v13[1];
    *v12 = *v13;
    v12[1] = v14;
    v15 = a3[9];
    v16 = (uint64_t *)((char *)a1 + v15);
    v17 = (uint64_t *)((char *)a2 + v15);
    v18 = v17[1];
    *v16 = *v17;
    v16[1] = v18;
    v19 = v10;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
  return a1;
}

uint64_t sub_226EE98AC(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_226F016F8();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(a1, v4);

  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t sub_226EE9910(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  _QWORD *v11;
  _QWORD *v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD *v15;
  _QWORD *v16;
  uint64_t v17;
  id v18;

  v6 = sub_226F016F8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(a1, a2, v6);
  v7 = a3[5];
  v8 = a3[6];
  v9 = *(void **)(a2 + v7);
  *(_QWORD *)(a1 + v7) = v9;
  *(_QWORD *)(a1 + v8) = *(_QWORD *)(a2 + v8);
  v10 = a3[8];
  *(_OWORD *)(a1 + a3[7]) = *(_OWORD *)(a2 + a3[7]);
  v11 = (_QWORD *)(a1 + v10);
  v12 = (_QWORD *)(a2 + v10);
  v13 = v12[1];
  *v11 = *v12;
  v11[1] = v13;
  v14 = a3[9];
  v15 = (_QWORD *)(a1 + v14);
  v16 = (_QWORD *)(a2 + v14);
  v17 = v16[1];
  *v15 = *v16;
  v15[1] = v17;
  v18 = v9;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t sub_226EE99B8(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  _QWORD *v12;
  _QWORD *v13;
  uint64_t v14;
  _QWORD *v15;
  _QWORD *v16;
  uint64_t v17;
  _QWORD *v18;
  _QWORD *v19;

  v6 = sub_226F016F8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 24))(a1, a2, v6);
  v7 = a3[5];
  v8 = *(void **)(a2 + v7);
  v9 = *(void **)(a1 + v7);
  *(_QWORD *)(a1 + v7) = v8;
  v10 = v8;

  *(_QWORD *)(a1 + a3[6]) = *(_QWORD *)(a2 + a3[6]);
  v11 = a3[7];
  v12 = (_QWORD *)(a1 + v11);
  v13 = (_QWORD *)(a2 + v11);
  *v12 = *v13;
  v12[1] = v13[1];
  v14 = a3[8];
  v15 = (_QWORD *)(a1 + v14);
  v16 = (_QWORD *)(a2 + v14);
  *v15 = *v16;
  v15[1] = v16[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v17 = a3[9];
  v18 = (_QWORD *)(a1 + v17);
  v19 = (_QWORD *)(a2 + v17);
  *v18 = *v19;
  v18[1] = v19[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_226EE9AA0(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v6 = sub_226F016F8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 32))(a1, a2, v6);
  v7 = a3[6];
  *(_QWORD *)(a1 + a3[5]) = *(_QWORD *)(a2 + a3[5]);
  *(_QWORD *)(a1 + v7) = *(_QWORD *)(a2 + v7);
  v8 = a3[8];
  *(_OWORD *)(a1 + a3[7]) = *(_OWORD *)(a2 + a3[7]);
  *(_OWORD *)(a1 + v8) = *(_OWORD *)(a2 + v8);
  *(_OWORD *)(a1 + a3[9]) = *(_OWORD *)(a2 + a3[9]);
  return a1;
}

uint64_t sub_226EE9B24(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD *v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;

  v6 = sub_226F016F8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 40))(a1, a2, v6);
  v7 = a3[5];
  v8 = *(void **)(a1 + v7);
  *(_QWORD *)(a1 + v7) = *(_QWORD *)(a2 + v7);

  v9 = a3[7];
  *(_QWORD *)(a1 + a3[6]) = *(_QWORD *)(a2 + a3[6]);
  *(_OWORD *)(a1 + v9) = *(_OWORD *)(a2 + v9);
  v10 = a3[8];
  v11 = (_QWORD *)(a1 + v10);
  v12 = (uint64_t *)(a2 + v10);
  v14 = *v12;
  v13 = v12[1];
  *v11 = v14;
  v11[1] = v13;
  swift_bridgeObjectRelease();
  v15 = a3[9];
  v16 = (_QWORD *)(a1 + v15);
  v17 = (uint64_t *)(a2 + v15);
  v19 = *v17;
  v18 = v17[1];
  *v16 = v19;
  v16[1] = v18;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_226EE9BD4()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_226EE9BE0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  unint64_t v8;

  v6 = OUTLINED_FUNCTION_23();
  if (*(_DWORD *)(*(_QWORD *)(v6 - 8) + 84) == (_DWORD)a2)
    return __swift_getEnumTagSinglePayload(a1, a2, v6);
  v8 = *(_QWORD *)(a1 + *(int *)(a3 + 20));
  if (v8 >= 0xFFFFFFFF)
    LODWORD(v8) = -1;
  return (v8 + 1);
}

uint64_t sub_226EE9C54()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_226EE9C60(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result;

  result = OUTLINED_FUNCTION_23();
  if (*(_DWORD *)(*(_QWORD *)(result - 8) + 84) == a3)
    return __swift_storeEnumTagSinglePayload(a1, a2, a2, result);
  *(_QWORD *)(a1 + *(int *)(a4 + 20)) = (a2 - 1);
  return result;
}

uint64_t _s10ParametersVMa()
{
  uint64_t result;

  result = qword_253F42F40;
  if (!qword_253F42F40)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_226EE9D08()
{
  uint64_t result;
  unint64_t v1;

  result = sub_226F016F8();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t sub_226EE9DA0()
{
  return sub_226EEA470(&qword_2558AC7C8, (uint64_t (*)(uint64_t))_s10ParametersVMa, (uint64_t)&unk_226F02350);
}

uint64_t sub_226EE9DCC(uint64_t a1, uint64_t a2)
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
  char *v20;
  uint64_t v21;
  uint64_t v22;
  char *v23;
  uint64_t v24;
  uint64_t v25;
  char *v26;
  uint64_t v27;
  uint64_t v28;
  char *v29;
  uint64_t v30;
  uint64_t v31;
  char *v32;
  uint64_t v33;
  uint64_t v34;
  char *v35;
  uint64_t v36;
  char *v37;
  char v38;
  uint64_t v39;
  uint64_t v40;
  int *v41;
  unsigned int v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  uint64_t v52;
  uint64_t v53;
  _QWORD *v54;
  uint64_t v55;
  _QWORD *v56;
  uint64_t v57;
  char v59;
  uint64_t v60;
  uint64_t v62;
  _QWORD *v63;
  uint64_t v64;
  _QWORD *v65;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  char *v73;
  uint64_t v74;

  v67 = _s10ParametersVMa();
  MEMORY[0x24BDAC7A8](v67);
  v73 = (char *)&v67 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  OUTLINED_FUNCTION_3();
  MEMORY[0x24BDAC7A8](v5);
  OUTLINED_FUNCTION_5();
  v74 = v6;
  OUTLINED_FUNCTION_3();
  MEMORY[0x24BDAC7A8](v7);
  OUTLINED_FUNCTION_5();
  v71 = v8;
  OUTLINED_FUNCTION_3();
  MEMORY[0x24BDAC7A8](v9);
  OUTLINED_FUNCTION_5();
  v72 = v10;
  OUTLINED_FUNCTION_3();
  MEMORY[0x24BDAC7A8](v11);
  OUTLINED_FUNCTION_5();
  v70 = v12;
  OUTLINED_FUNCTION_3();
  MEMORY[0x24BDAC7A8](v13);
  OUTLINED_FUNCTION_5();
  v69 = v14;
  OUTLINED_FUNCTION_3();
  MEMORY[0x24BDAC7A8](v15);
  OUTLINED_FUNCTION_5();
  v68 = v16;
  OUTLINED_FUNCTION_3();
  v18 = MEMORY[0x24BDAC7A8](v17);
  v20 = (char *)&v67 - v19;
  v21 = MEMORY[0x24BDAC7A8](v18);
  v23 = (char *)&v67 - v22;
  v24 = MEMORY[0x24BDAC7A8](v21);
  v26 = (char *)&v67 - v25;
  v27 = MEMORY[0x24BDAC7A8](v24);
  v29 = (char *)&v67 - v28;
  v30 = MEMORY[0x24BDAC7A8](v27);
  v32 = (char *)&v67 - v31;
  v33 = MEMORY[0x24BDAC7A8](v30);
  v35 = (char *)&v67 - v34;
  MEMORY[0x24BDAC7A8](v33);
  v37 = (char *)&v67 - v36;
  sub_226EEA4B0(a1, (uint64_t)&v67 - v36);
  sub_226EEA4B0(a2, (uint64_t)v35);
  v38 = sub_226F016EC();
  v39 = (uint64_t)v35;
  v40 = a2;
  sub_226EEA4F4(v39);
  sub_226EEA4F4((uint64_t)v37);
  OUTLINED_FUNCTION_13(a1);
  sub_226EEA4B0(a2, (uint64_t)v29);
  if ((v38 & 1) == 0)
  {
    OUTLINED_FUNCTION_2();
    OUTLINED_FUNCTION_1();
    OUTLINED_FUNCTION_19();
    OUTLINED_FUNCTION_14();
    v45 = v68;
    goto LABEL_15;
  }
  v41 = (int *)v67;
  v42 = objc_msgSend(*(id *)&v32[*(int *)(v67 + 20)], sel_isArtworkVisuallyIdenticalToCatalog_, *(_QWORD *)&v29[*(int *)(v67 + 20)]);
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_19();
  OUTLINED_FUNCTION_14();
  v44 = v71;
  v43 = v72;
  v45 = v68;
  if (!v42)
  {
LABEL_15:
    OUTLINED_FUNCTION_12();
    sub_226EEA4F4((uint64_t)v26);
    OUTLINED_FUNCTION_20();
    OUTLINED_FUNCTION_15();
    goto LABEL_16;
  }
  v46 = *(double *)&v26[v41[6]];
  sub_226EEA4F4((uint64_t)v26);
  v47 = *(double *)&v23[v41[6]];
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_20();
  OUTLINED_FUNCTION_15();
  if (v46 != v47)
  {
LABEL_16:
    sub_226EEA4F4(v45);
    OUTLINED_FUNCTION_9();
    OUTLINED_FUNCTION_11();
    OUTLINED_FUNCTION_7();
    goto LABEL_17;
  }
  v48 = *(double *)&v20[v41[7]];
  OUTLINED_FUNCTION_9();
  v49 = *(double *)(v45 + v41[7]);
  sub_226EEA4F4(v45);
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_7();
  if (v48 != v49)
  {
LABEL_17:
    OUTLINED_FUNCTION_9();
    OUTLINED_FUNCTION_12();
    OUTLINED_FUNCTION_21();
    OUTLINED_FUNCTION_13(v40);
    goto LABEL_18;
  }
  v50 = *(double *)&v23[v41[7] + 8];
  OUTLINED_FUNCTION_12();
  v51 = *(double *)&v20[v41[7] + 8];
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_21();
  OUTLINED_FUNCTION_13(v40);
  v52 = v74;
  if (v50 != v51)
  {
LABEL_18:
    OUTLINED_FUNCTION_2();
    OUTLINED_FUNCTION_1();
LABEL_19:
    OUTLINED_FUNCTION_6();
    OUTLINED_FUNCTION_0_0();
    goto LABEL_20;
  }
  v53 = v41[8];
  v54 = (_QWORD *)(v43 + v53);
  v55 = *(_QWORD *)(v43 + v53 + 8);
  v56 = (_QWORD *)(v44 + v53);
  v57 = v56[1];
  if (!v55)
  {
    swift_bridgeObjectRetain();
    OUTLINED_FUNCTION_2();
    OUTLINED_FUNCTION_1();
    if (!v57)
    {
LABEL_28:
      OUTLINED_FUNCTION_6();
      OUTLINED_FUNCTION_0_0();
      goto LABEL_29;
    }
    goto LABEL_26;
  }
  if (!v57)
  {
    OUTLINED_FUNCTION_8();
    OUTLINED_FUNCTION_2();
    OUTLINED_FUNCTION_1();
LABEL_26:
    swift_bridgeObjectRelease();
    goto LABEL_19;
  }
  if (*v54 == *v56 && v55 == v57)
  {
    OUTLINED_FUNCTION_8();
    OUTLINED_FUNCTION_2();
    OUTLINED_FUNCTION_1();
    OUTLINED_FUNCTION_17();
    goto LABEL_28;
  }
  v59 = OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0_0();
  if ((v59 & 1) == 0)
  {
LABEL_20:
    OUTLINED_FUNCTION_22();
    OUTLINED_FUNCTION_18();
LABEL_21:
    LOBYTE(v60) = 0;
    return v60 & 1;
  }
LABEL_29:
  v62 = v41[9];
  v63 = (_QWORD *)(v52 + v62);
  v64 = *(_QWORD *)(v52 + v62 + 8);
  v65 = (_QWORD *)(a1 + v62);
  v60 = v65[1];
  if (!v64)
  {
    swift_bridgeObjectRetain();
    OUTLINED_FUNCTION_22();
    OUTLINED_FUNCTION_18();
    if (!v60)
    {
      LOBYTE(v60) = 1;
      return v60 & 1;
    }
    swift_bridgeObjectRelease();
    goto LABEL_21;
  }
  if (v60)
  {
    if (*v63 == *v65 && v64 == v60)
      LOBYTE(v60) = 1;
    else
      LOBYTE(v60) = OUTLINED_FUNCTION_10();
  }
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_22();
  OUTLINED_FUNCTION_18();
  OUTLINED_FUNCTION_17();
  return v60 & 1;
}

uint64_t sub_226EEA260()
{
  uint64_t v0;
  int *v1;
  id v2;

  OUTLINED_FUNCTION_23();
  sub_226EEA470(&qword_2558AC7D0, (uint64_t (*)(uint64_t))MEMORY[0x24BDDF898], MEMORY[0x24BDDF8B0]);
  sub_226F0171C();
  v1 = (int *)_s10ParametersVMa();
  v2 = objc_msgSend(*(id *)(v0 + v1[5]), sel_visualIdenticalityIdentifier);
  if (v2)
  {
    objc_msgSend(v2, sel_hash);
    swift_unknownObjectRelease();
    OUTLINED_FUNCTION_4();
    sub_226F01938();
  }
  else
  {
    OUTLINED_FUNCTION_4();
  }
  sub_226F01950();
  OUTLINED_FUNCTION_16();
  OUTLINED_FUNCTION_16();
  if (*(_QWORD *)(v0 + v1[8] + 8))
  {
    OUTLINED_FUNCTION_4();
    swift_bridgeObjectRetain();
    sub_226F01770();
    swift_bridgeObjectRelease();
  }
  else
  {
    OUTLINED_FUNCTION_4();
  }
  if (!*(_QWORD *)(v0 + v1[9] + 8))
    return OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_4();
  swift_bridgeObjectRetain();
  sub_226F01770();
  return swift_bridgeObjectRelease();
}

uint64_t sub_226EEA3F0()
{
  sub_226F0192C();
  sub_226EEA260();
  return sub_226F0195C();
}

uint64_t sub_226EEA438()
{
  sub_226F0192C();
  sub_226EEA260();
  return sub_226F0195C();
}

uint64_t sub_226EEA470(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = a2(255);
    result = MEMORY[0x2276A650C](a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_226EEA4B0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = _s10ParametersVMa();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_226EEA4F4(uint64_t a1)
{
  uint64_t v2;

  v2 = _s10ParametersVMa();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t OUTLINED_FUNCTION_0_0()
{
  uint64_t v0;
  uint64_t v1;

  return sub_226EEA4B0(v0, *(_QWORD *)(v1 - 112));
}

uint64_t OUTLINED_FUNCTION_1()
{
  uint64_t v0;

  return sub_226EEA4F4(v0);
}

uint64_t OUTLINED_FUNCTION_2()
{
  uint64_t v0;

  return sub_226EEA4F4(v0);
}

uint64_t OUTLINED_FUNCTION_4()
{
  return sub_226F01944();
}

uint64_t OUTLINED_FUNCTION_6()
{
  uint64_t v0;
  uint64_t v1;

  return sub_226EEA4B0(v1, v0);
}

uint64_t OUTLINED_FUNCTION_7()
{
  uint64_t v0;
  uint64_t v1;

  return sub_226EEA4B0(v0, *(_QWORD *)(v1 - 136));
}

uint64_t OUTLINED_FUNCTION_8()
{
  return swift_bridgeObjectRetain();
}

uint64_t OUTLINED_FUNCTION_9()
{
  uint64_t v0;

  return sub_226EEA4F4(v0);
}

uint64_t OUTLINED_FUNCTION_10()
{
  return sub_226F018E4();
}

uint64_t OUTLINED_FUNCTION_11()
{
  uint64_t v0;
  uint64_t v1;

  return sub_226EEA4B0(v0, *(_QWORD *)(v1 - 144));
}

uint64_t OUTLINED_FUNCTION_12()
{
  uint64_t v0;

  return sub_226EEA4F4(v0);
}

uint64_t OUTLINED_FUNCTION_13(uint64_t a1)
{
  uint64_t v1;

  return sub_226EEA4B0(a1, v1);
}

uint64_t OUTLINED_FUNCTION_14()
{
  uint64_t v0;
  uint64_t v1;

  return sub_226EEA4B0(v1, v0);
}

uint64_t OUTLINED_FUNCTION_15()
{
  uint64_t v0;
  uint64_t v1;

  return sub_226EEA4B0(v0, v1);
}

uint64_t OUTLINED_FUNCTION_16()
{
  return sub_226F01950();
}

uint64_t OUTLINED_FUNCTION_17()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_18()
{
  uint64_t v0;

  return sub_226EEA4F4(v0);
}

uint64_t OUTLINED_FUNCTION_19()
{
  uint64_t v0;
  uint64_t v1;

  return sub_226EEA4B0(v0, v1);
}

uint64_t OUTLINED_FUNCTION_20()
{
  uint64_t v0;
  uint64_t v1;

  return sub_226EEA4B0(v1, v0);
}

uint64_t OUTLINED_FUNCTION_21()
{
  uint64_t v0;
  uint64_t v1;

  return sub_226EEA4B0(v0, v1);
}

uint64_t OUTLINED_FUNCTION_22()
{
  uint64_t v0;

  return sub_226EEA4F4(v0);
}

uint64_t OUTLINED_FUNCTION_23()
{
  return sub_226F016F8();
}

uint64_t sub_226EEA634()
{
  uint64_t v1;
  _BYTE v2[24];
  uint64_t v3;

  sub_226F016A4();
  if (v3)
  {
    sub_226EEA828();
    if (swift_dynamicCast())
      return v1;
    else
      return 0;
  }
  else
  {
    sub_226EEA884((uint64_t)v2);
    return 0;
  }
}

uint64_t sub_226EEA6A0()
{
  uint64_t result;
  uint64_t v1;
  _QWORD v2[4];

  sub_226F01698();
  sub_226F01674();
  __swift_project_boxed_opaque_existential_1(v2, v2[3]);
  sub_226F0168C();
  sub_226EEA828();
  if (swift_dynamicCast())
  {
    swift_release();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v2);
    return v1;
  }
  else
  {
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v2);
    v2[0] = 0;
    v2[1] = 0xE000000000000000;
    sub_226F01860();
    sub_226F01788();
    sub_226F01680();
    sub_226F01884();
    sub_226F01788();
    result = sub_226F018B4();
    __break(1u);
  }
  return result;
}

_QWORD *__swift_project_boxed_opaque_existential_1(_QWORD *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) & 0x20000) != 0)
    return (_QWORD *)(*result
                    + ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80)));
  return result;
}

unint64_t sub_226EEA828()
{
  unint64_t result;

  result = qword_253F43240;
  if (!qword_253F43240)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_253F43240);
  }
  return result;
}

uint64_t __swift_destroy_boxed_opaque_existential_1(uint64_t a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(*(_QWORD *)(a1 + 24) - 8);
  if ((*(_BYTE *)(v1 + 82) & 2) != 0)
    return swift_release();
  else
    return (*(uint64_t (**)(void))(v1 + 8))();
}

uint64_t sub_226EEA884(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_253F42DE8);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x2276A64F4]((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

void _ArtworkImageReader.init(content:)(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, _QWORD *a5@<X8>)
{
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  __swift_instantiateConcreteTypeFromMangledName(&qword_253F42E38);
  OUTLINED_FUNCTION_1_0();
  MEMORY[0x24BDAC7A8]();
  OUTLINED_FUNCTION_0_1();
  v12 = v11 - v10;
  type metadata accessor for _ArtworkImageReader(0, a3, a4, v13);
  v14 = type metadata accessor for ArtworkImage._Proxy();
  __swift_storeEnumTagSinglePayload(v12, 1, 1, v14);
  sub_226EEA9C0(v12);
  *a5 = a1;
  a5[1] = a2;
}

uint64_t type metadata accessor for _ArtworkImageReader(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for _ArtworkImageReader);
}

void sub_226EEA9C0(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;

  __swift_instantiateConcreteTypeFromMangledName(&qword_253F42E38);
  OUTLINED_FUNCTION_1_0();
  MEMORY[0x24BDAC7A8]();
  OUTLINED_FUNCTION_0_1();
  sub_226EEBA54(a1, v3 - v2);
  sub_226F015A8();
  sub_226EEADD0(a1);
  OUTLINED_FUNCTION_2_0();
}

uint64_t sub_226EEAA38()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_2558AC7E0);
  return sub_226F015B4();
}

uint64_t sub_226EEAA70(uint64_t a1)
{
  uint64_t v2;
  uint64_t v4;

  __swift_instantiateConcreteTypeFromMangledName(&qword_253F42E38);
  MEMORY[0x24BDAC7A8]();
  sub_226EEBA54(a1, (uint64_t)&v4 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0));
  __swift_instantiateConcreteTypeFromMangledName(&qword_2558AC7E0);
  sub_226F015C0();
  return sub_226EEADD0(a1);
}

uint64_t _ArtworkImageReader.body.getter@<X0>(uint64_t a1@<X0>, char *a2@<X8>)
{
  void (**v2)(_QWORD);
  void (**v3)(_QWORD);
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
  void (*v19)(uint64_t);
  uint64_t v20;
  char *v21;
  uint64_t v22;
  unint64_t v23;
  uint64_t v24;
  uint64_t v25;
  unint64_t v26;
  uint64_t v27;
  char *v28;
  void (*v29)(char *, char *, uint64_t);
  void (*v30)(char *, uint64_t);
  uint64_t v32;
  char *v33;
  uint64_t v34;
  uint64_t v35;
  char *v36;
  uint64_t v37;
  uint64_t v38;
  char *v39;
  _QWORD v40[2];

  v3 = v2;
  v39 = a2;
  v5 = *(_QWORD *)(*(_QWORD *)(a1 - 8) + 64);
  v34 = *(_QWORD *)(a1 - 8);
  v35 = v5;
  ((void (*)(void))MEMORY[0x24BDAC7A8])();
  v33 = (char *)&v32 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_253F42E38);
  OUTLINED_FUNCTION_1_0();
  ((void (*)(void))MEMORY[0x24BDAC7A8])();
  OUTLINED_FUNCTION_0_1();
  v9 = v8 - v7;
  v10 = *(_QWORD *)(a1 + 16);
  v38 = *(_QWORD *)(v10 - 8);
  OUTLINED_FUNCTION_1_0();
  ((void (*)(void))MEMORY[0x24BDAC7A8])();
  OUTLINED_FUNCTION_0_1();
  v13 = v12 - v11;
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2558AC7D8);
  v14 = sub_226F013BC();
  v37 = *(_QWORD *)(v14 - 8);
  OUTLINED_FUNCTION_1_0();
  v15 = ((uint64_t (*)(void))MEMORY[0x24BDAC7A8])();
  v17 = (char *)&v32 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v15);
  v36 = (char *)&v32 - v18;
  v19 = *v2;
  sub_226EEAA38();
  v19(v9);
  sub_226EEADD0(v9);
  v21 = v33;
  v20 = v34;
  (*(void (**)(char *, void (**)(_QWORD), uint64_t))(v34 + 16))(v33, v3, a1);
  v22 = v20;
  v23 = (*(unsigned __int8 *)(v20 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v20 + 80);
  v24 = swift_allocObject();
  v25 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(v24 + 16) = v10;
  *(_QWORD *)(v24 + 24) = v25;
  (*(void (**)(unint64_t, char *, uint64_t))(v22 + 32))(v24 + v23, v21, a1);
  sub_226EEAFDC();
  sub_226EEB018();
  sub_226F01500();
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v38 + 8))(v13, v10);
  v26 = sub_226EEB0BC();
  v40[0] = v25;
  v40[1] = v26;
  MEMORY[0x2276A650C](MEMORY[0x24BDED308], v14, v40);
  v28 = v36;
  v27 = v37;
  v29 = *(void (**)(char *, char *, uint64_t))(v37 + 16);
  v29(v36, v17, v14);
  v30 = *(void (**)(char *, uint64_t))(v27 + 8);
  v30(v17, v14);
  v29(v39, v28, v14);
  return ((uint64_t (*)(char *, uint64_t))v30)(v28, v14);
}

uint64_t __swift_instantiateConcreteTypeFromMangledNameAbstract(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x2276A6500](255, (char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t sub_226EEADD0(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_253F42E38);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_226EEAE10(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v11;

  __swift_instantiateConcreteTypeFromMangledName(&qword_253F42E38);
  MEMORY[0x24BDAC7A8]();
  v8 = (char *)&v11 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_226EEBA54(a1, (uint64_t)v8);
  type metadata accessor for _ArtworkImageReader(0, a3, a4, v9);
  return sub_226EEAA70((uint64_t)v8);
}

uint64_t sub_226EEAEB0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v5 = type metadata accessor for _ArtworkImageReader(0, *(_QWORD *)(v4 + 16), *(_QWORD *)(v4 + 24), a4);
  v6 = *(unsigned __int8 *)(*(_QWORD *)(v5 - 8) + 80);
  swift_release();
  v7 = v4 + ((v6 + 32) & ~v6) + *(int *)(v5 + 36);
  v8 = type metadata accessor for ArtworkImage._Proxy();
  if (!__swift_getEnumTagSinglePayload(v7, 1, v8))
  {
    v9 = sub_226F016F8();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 8))(v7, v9);

  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_2558AC7E0);
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_226EEAF84(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v6 = *(_QWORD *)(v4 + 16);
  v7 = *(_QWORD *)(v4 + 24);
  v8 = *(unsigned __int8 *)(*(_QWORD *)(type metadata accessor for _ArtworkImageReader(0, v6, v7, a4) - 8) + 80);
  return sub_226EEAE10(a1, v4 + ((v8 + 32) & ~v8), v6, v7);
}

unint64_t sub_226EEAFDC()
{
  unint64_t result;

  result = qword_2558AC7E8;
  if (!qword_2558AC7E8)
  {
    result = MEMORY[0x2276A650C](&unk_226F02A44, &_s18ProxyPreferenceKeyVN);
    atomic_store(result, (unint64_t *)&qword_2558AC7E8);
  }
  return result;
}

unint64_t sub_226EEB018()
{
  unint64_t result;
  uint64_t v1;
  unint64_t v2;

  result = qword_2558AC7F0;
  if (!qword_2558AC7F0)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_253F42E38);
    v2 = sub_226EEB07C();
    result = MEMORY[0x2276A650C](MEMORY[0x24BEE4AB8], v1, &v2);
    atomic_store(result, (unint64_t *)&qword_2558AC7F0);
  }
  return result;
}

unint64_t sub_226EEB07C()
{
  unint64_t result;
  uint64_t v1;

  result = qword_2558AC7F8;
  if (!qword_2558AC7F8)
  {
    v1 = type metadata accessor for ArtworkImage._Proxy();
    result = MEMORY[0x2276A650C](&protocol conformance descriptor for ArtworkImage._Proxy, v1);
    atomic_store(result, (unint64_t *)&qword_2558AC7F8);
  }
  return result;
}

unint64_t sub_226EEB0BC()
{
  unint64_t result;
  uint64_t v1;

  result = qword_2558AC800[0];
  if (!qword_2558AC800[0])
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2558AC7D8);
    result = MEMORY[0x2276A650C](MEMORY[0x24BDF09B0], v1);
    atomic_store(result, qword_2558AC800);
  }
  return result;
}

uint64_t sub_226EEB100()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_226EEB13C()
{
  return sub_226F014F4();
}

uint64_t sub_226EEB158()
{
  return swift_allocateGenericValueMetadata();
}

void sub_226EEB160()
{
  unint64_t v0;

  sub_226EEB99C();
  if (v0 <= 0x3F)
    swift_initStructMetadata();
}

_QWORD *sub_226EEB1D8(_QWORD *a1, uint64_t *a2, uint64_t a3)
{
  int v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  id v15;
  uint64_t v16;

  v4 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  v5 = *a2;
  if ((v4 & 0x20000) != 0)
  {
    *a1 = v5;
    a1 = (_QWORD *)(v5 + ((v4 + 16) & ~(unint64_t)v4));
  }
  else
  {
    v6 = a2[1];
    *a1 = v5;
    a1[1] = v6;
    v7 = *(int *)(a3 + 36);
    v8 = (char *)a1 + v7;
    v9 = (char *)a2 + v7;
    v10 = type metadata accessor for ArtworkImage._Proxy();
    swift_retain();
    if (__swift_getEnumTagSinglePayload((uint64_t)v9, 1, v10))
    {
      v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_253F42E38);
      memcpy(v8, v9, *(_QWORD *)(*(_QWORD *)(v11 - 8) + 64));
    }
    else
    {
      v12 = sub_226F016F8();
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v12 - 8) + 16))(v8, v9, v12);
      *(_OWORD *)&v8[*(int *)(v10 + 20)] = *(_OWORD *)&v9[*(int *)(v10 + 20)];
      v13 = *(int *)(v10 + 24);
      v14 = *(void **)&v9[v13];
      *(_QWORD *)&v8[v13] = v14;
      v15 = v14;
      __swift_storeEnumTagSinglePayload((uint64_t)v8, 0, 1, v10);
    }
    v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_2558AC7E0);
    *(_QWORD *)&v8[*(int *)(v16 + 28)] = *(_QWORD *)&v9[*(int *)(v16 + 28)];
  }
  swift_retain();
  return a1;
}

uint64_t sub_226EEB2FC(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  swift_release();
  v4 = a1 + *(int *)(a2 + 36);
  v5 = type metadata accessor for ArtworkImage._Proxy();
  if (!__swift_getEnumTagSinglePayload(v4, 1, v5))
  {
    v6 = sub_226F016F8();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 8))(v4, v6);

  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_2558AC7E0);
  return swift_release();
}

_QWORD *sub_226EEB388(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;
  uint64_t v14;

  v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  v5 = *(int *)(a3 + 36);
  v6 = (char *)a1 + v5;
  v7 = (char *)a2 + v5;
  v8 = type metadata accessor for ArtworkImage._Proxy();
  swift_retain();
  if (__swift_getEnumTagSinglePayload((uint64_t)v7, 1, v8))
  {
    v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_253F42E38);
    memcpy(v6, v7, *(_QWORD *)(*(_QWORD *)(v9 - 8) + 64));
  }
  else
  {
    v10 = sub_226F016F8();
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v10 - 8) + 16))(v6, v7, v10);
    *(_OWORD *)&v6[*(int *)(v8 + 20)] = *(_OWORD *)&v7[*(int *)(v8 + 20)];
    v11 = *(int *)(v8 + 24);
    v12 = *(void **)&v7[v11];
    *(_QWORD *)&v6[v11] = v12;
    v13 = v12;
    __swift_storeEnumTagSinglePayload((uint64_t)v6, 0, 1, v8);
  }
  v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_2558AC7E0);
  *(_QWORD *)&v6[*(int *)(v14 + 28)] = *(_QWORD *)&v7[*(int *)(v14 + 28)];
  swift_retain();
  return a1;
}

_QWORD *sub_226EEB484(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  char *v8;
  char *v9;
  uint64_t v10;
  int EnumTagSinglePayload;
  int v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  char *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  id v27;

  v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  swift_retain();
  swift_release();
  v7 = *(int *)(a3 + 36);
  v8 = (char *)a1 + v7;
  v9 = (char *)a2 + v7;
  v10 = type metadata accessor for ArtworkImage._Proxy();
  EnumTagSinglePayload = __swift_getEnumTagSinglePayload((uint64_t)v8, 1, v10);
  v12 = __swift_getEnumTagSinglePayload((uint64_t)v9, 1, v10);
  if (!EnumTagSinglePayload)
  {
    if (!v12)
    {
      v20 = sub_226F016F8();
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v20 - 8) + 24))(v8, v9, v20);
      v21 = *(int *)(v10 + 20);
      v22 = &v8[v21];
      v23 = &v9[v21];
      *(_QWORD *)v22 = *(_QWORD *)v23;
      *((_QWORD *)v22 + 1) = *((_QWORD *)v23 + 1);
      v24 = *(int *)(v10 + 24);
      v25 = *(void **)&v8[v24];
      v26 = *(void **)&v9[v24];
      *(_QWORD *)&v8[v24] = v26;
      v27 = v26;

      goto LABEL_7;
    }
    sub_226EEB618((uint64_t)v8);
    goto LABEL_6;
  }
  if (v12)
  {
LABEL_6:
    v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_253F42E38);
    memcpy(v8, v9, *(_QWORD *)(*(_QWORD *)(v17 - 8) + 64));
    goto LABEL_7;
  }
  v13 = sub_226F016F8();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v13 - 8) + 16))(v8, v9, v13);
  *(_OWORD *)&v8[*(int *)(v10 + 20)] = *(_OWORD *)&v9[*(int *)(v10 + 20)];
  v14 = *(int *)(v10 + 24);
  v15 = *(void **)&v9[v14];
  *(_QWORD *)&v8[v14] = v15;
  v16 = v15;
  __swift_storeEnumTagSinglePayload((uint64_t)v8, 0, 1, v10);
LABEL_7:
  v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_2558AC7E0);
  *(_QWORD *)&v8[*(int *)(v18 + 28)] = *(_QWORD *)&v9[*(int *)(v18 + 28)];
  swift_retain();
  swift_release();
  return a1;
}

uint64_t sub_226EEB618(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata accessor for ArtworkImage._Proxy();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

_OWORD *sub_226EEB654(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  uint64_t v4;
  char *v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  *a1 = *a2;
  v4 = *(int *)(a3 + 36);
  v5 = (char *)a1 + v4;
  v6 = (char *)a2 + v4;
  v7 = type metadata accessor for ArtworkImage._Proxy();
  if (__swift_getEnumTagSinglePayload((uint64_t)v6, 1, v7))
  {
    v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_253F42E38);
    memcpy(v5, v6, *(_QWORD *)(*(_QWORD *)(v8 - 8) + 64));
  }
  else
  {
    v9 = sub_226F016F8();
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v9 - 8) + 32))(v5, v6, v9);
    *(_OWORD *)&v5[*(int *)(v7 + 20)] = *(_OWORD *)&v6[*(int *)(v7 + 20)];
    *(_QWORD *)&v5[*(int *)(v7 + 24)] = *(_QWORD *)&v6[*(int *)(v7 + 24)];
    __swift_storeEnumTagSinglePayload((uint64_t)v5, 0, 1, v7);
  }
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_2558AC7E0);
  *(_QWORD *)&v5[*(int *)(v10 + 28)] = *(_QWORD *)&v6[*(int *)(v10 + 28)];
  return a1;
}

_OWORD *sub_226EEB738(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  uint64_t v6;
  char *v7;
  char *v8;
  uint64_t v9;
  int EnumTagSinglePayload;
  int v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v16;
  uint64_t v17;
  void *v18;

  *a1 = *a2;
  swift_release();
  v6 = *(int *)(a3 + 36);
  v7 = (char *)a1 + v6;
  v8 = (char *)a2 + v6;
  v9 = type metadata accessor for ArtworkImage._Proxy();
  EnumTagSinglePayload = __swift_getEnumTagSinglePayload((uint64_t)v7, 1, v9);
  v11 = __swift_getEnumTagSinglePayload((uint64_t)v8, 1, v9);
  if (!EnumTagSinglePayload)
  {
    if (!v11)
    {
      v16 = sub_226F016F8();
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v16 - 8) + 40))(v7, v8, v16);
      *(_OWORD *)&v7[*(int *)(v9 + 20)] = *(_OWORD *)&v8[*(int *)(v9 + 20)];
      v17 = *(int *)(v9 + 24);
      v18 = *(void **)&v7[v17];
      *(_QWORD *)&v7[v17] = *(_QWORD *)&v8[v17];

      goto LABEL_7;
    }
    sub_226EEB618((uint64_t)v7);
    goto LABEL_6;
  }
  if (v11)
  {
LABEL_6:
    v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_253F42E38);
    memcpy(v7, v8, *(_QWORD *)(*(_QWORD *)(v13 - 8) + 64));
    goto LABEL_7;
  }
  v12 = sub_226F016F8();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v12 - 8) + 32))(v7, v8, v12);
  *(_OWORD *)&v7[*(int *)(v9 + 20)] = *(_OWORD *)&v8[*(int *)(v9 + 20)];
  *(_QWORD *)&v7[*(int *)(v9 + 24)] = *(_QWORD *)&v8[*(int *)(v9 + 24)];
  __swift_storeEnumTagSinglePayload((uint64_t)v7, 0, 1, v9);
LABEL_7:
  v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_2558AC7E0);
  *(_QWORD *)&v7[*(int *)(v14 + 28)] = *(_QWORD *)&v8[*(int *)(v14 + 28)];
  swift_release();
  return a1;
}

uint64_t sub_226EEB8A4()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_226EEB8B0(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v8;

  if ((_DWORD)a2 == 0x7FFFFFFF)
  {
    v4 = *a1;
    if ((unint64_t)*a1 >= 0xFFFFFFFF)
      LODWORD(v4) = -1;
    return (v4 + 1);
  }
  else
  {
    v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_2558AC7E0);
    return __swift_getEnumTagSinglePayload((uint64_t)a1 + *(int *)(a3 + 36), a2, v8);
  }
}

uint64_t sub_226EEB928()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

void sub_226EEB934(_QWORD *a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v7;

  if (a3 == 0x7FFFFFFF)
  {
    *a1 = (a2 - 1);
    OUTLINED_FUNCTION_2_0();
  }
  else
  {
    v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_2558AC7E0);
    __swift_storeEnumTagSinglePayload((uint64_t)a1 + *(int *)(a4 + 36), a2, a2, v7);
  }
}

void sub_226EEB99C()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_2558AC888)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_253F42E38);
    v0 = sub_226F015D8();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_2558AC888);
  }
}

uint64_t sub_226EEB9F4(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  _QWORD v4[2];

  v1 = *(_QWORD *)(a1 + 8);
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2558AC7D8);
  v2 = sub_226F013BC();
  v4[0] = v1;
  v4[1] = sub_226EEB0BC();
  return MEMORY[0x2276A650C](MEMORY[0x24BDED308], v2, v4);
}

uint64_t sub_226EEBA54(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_253F42E38);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

void ArtworkLoader.__allocating_init(shouldEnforceUsageOnMainThread:)(char a1)
{
  swift_allocObject();
  ArtworkLoader.init(shouldEnforceUsageOnMainThread:)(a1);
  OUTLINED_FUNCTION_28();
}

uint64_t ArtworkLoader.init(shouldEnforceUsageOnMainThread:)(char a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;

  *(_BYTE *)(v1 + 16) = 0;
  *(_QWORD *)(v1 + 24) = 0;
  *(_QWORD *)(v1 + 32) = 0;
  *(_BYTE *)(v1 + 40) = 1;
  *(_QWORD *)(v1 + 48) = 0;
  v3 = v1 + OBJC_IVAR____TtC17_MusicKit_SwiftUI13ArtworkLoader_lastParameters;
  v4 = OUTLINED_FUNCTION_41();
  OUTLINED_FUNCTION_37(v3, v5, v6, v4);
  v7 = (_QWORD *)(v1 + OBJC_IVAR____TtC17_MusicKit_SwiftUI13ArtworkLoader_lastLoadingStatusHandler);
  *v7 = 0;
  v7[1] = 0;
  *(_QWORD *)(v1 + OBJC_IVAR____TtC17_MusicKit_SwiftUI13ArtworkLoader_cachedCloudArtworkCatalog) = 0;
  sub_226F012B4();
  *(_BYTE *)(v1 + OBJC_IVAR____TtC17_MusicKit_SwiftUI13ArtworkLoader_shouldEnforceUsageOnMainThread) = a1;
  return v1;
}

void sub_226EEBB8C()
{
  swift_getKeyPath();
  OUTLINED_FUNCTION_14_0();
  OUTLINED_FUNCTION_9_0();
  OUTLINED_FUNCTION_19_0();
}

uint64_t ArtworkLoader.deinit()
{
  uint64_t v0;
  uint64_t v1;
  unsigned __int8 v3;

  v3 = 3;
  sub_226EED790(&v3, 0, 1);

  sub_226EEE5A0(v0 + OBJC_IVAR____TtC17_MusicKit_SwiftUI13ArtworkLoader_lastParameters, &qword_253F42F88);
  sub_226EEDD60(*(_QWORD *)(v0 + OBJC_IVAR____TtC17_MusicKit_SwiftUI13ArtworkLoader_lastLoadingStatusHandler));

  v1 = sub_226F012C0();
  OUTLINED_FUNCTION_17_0(v1);
  return v0;
}

uint64_t ArtworkLoader.__deallocating_deinit()
{
  ArtworkLoader.deinit();
  return swift_deallocClassInstance();
}

void sub_226EEBC90()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_28();
}

uint64_t sub_226EEBCC8@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = sub_226EEBD60();
  *a1 = result & 1;
  return result;
}

void sub_226EEBCF4(_BYTE *a1@<X8>)
{
  *a1 = sub_226EEBD60() & 1;
  OUTLINED_FUNCTION_28();
}

void sub_226EEBD1C()
{
  sub_226EEBB8C();
}

void sub_226EEBD40()
{
  sub_226EEBB8C();
  OUTLINED_FUNCTION_28();
}

uint64_t sub_226EEBD60()
{
  uint64_t v0;

  swift_getKeyPath();
  sub_226EEEBA4(&qword_253F42CF0, (uint64_t (*)(uint64_t))type metadata accessor for ArtworkLoader, (uint64_t)&protocol conformance descriptor for ArtworkLoader);
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_39();
  OUTLINED_FUNCTION_1_1();
  return *(unsigned __int8 *)(v0 + 16);
}

uint64_t sub_226EEBDE4(uint64_t a1, char a2)
{
  uint64_t result;

  result = swift_beginAccess();
  *(_BYTE *)(a1 + 16) = a2;
  return result;
}

uint64_t sub_226EEBE34()
{
  uint64_t v0;

  return sub_226EEBDE4(*(_QWORD *)(v0 + 16), *(_BYTE *)(v0 + 24));
}

void sub_226EEBE50()
{
  uint64_t v0;
  _QWORD *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;

  v2 = OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_22_0((uint64_t)v2);
  OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_27(OBJC_IVAR____TtC17_MusicKit_SwiftUI13ArtworkLoader___observationRegistrar);
  sub_226EEEBA4(&qword_253F42CF0, (uint64_t (*)(uint64_t))type metadata accessor for ArtworkLoader, (uint64_t)&protocol conformance descriptor for ArtworkLoader);
  OUTLINED_FUNCTION_2_1(v3);
  OUTLINED_FUNCTION_15_0();
  *v1 = v0;
  OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_9_0();
  sub_226EEBC90();
  v1[7] = v4;
  OUTLINED_FUNCTION_7_0();
}

void sub_226EEBEDC(_QWORD *a1)
{
  sub_226EEC3E4(a1);
}

void sub_226EEBEE8()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_28();
}

uint64_t sub_226EEBF1C@<X0>(uint64_t a1@<X8>)
{
  uint64_t result;
  uint64_t v3;
  char v4;

  result = sub_226EEBF7C();
  *(_QWORD *)a1 = result;
  *(_QWORD *)(a1 + 8) = v3;
  *(_BYTE *)(a1 + 16) = v4 & 1;
  return result;
}

uint64_t sub_226EEBF4C()
{
  return sub_226EEC004();
}

uint64_t sub_226EEBF7C()
{
  uint64_t v0;

  swift_getKeyPath();
  sub_226EEEBA4(&qword_253F42CF0, (uint64_t (*)(uint64_t))type metadata accessor for ArtworkLoader, (uint64_t)&protocol conformance descriptor for ArtworkLoader);
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_39();
  OUTLINED_FUNCTION_1_1();
  return *(_QWORD *)(v0 + 24);
}

uint64_t sub_226EEC004()
{
  swift_getKeyPath();
  OUTLINED_FUNCTION_14_0();
  return OUTLINED_FUNCTION_15_0();
}

uint64_t sub_226EEC070(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  uint64_t result;

  result = swift_beginAccess();
  *(_QWORD *)(a1 + 24) = a2;
  *(_QWORD *)(a1 + 32) = a3;
  *(_BYTE *)(a1 + 40) = a4 & 1;
  return result;
}

void sub_226EEC0D8()
{
  uint64_t v0;
  _QWORD *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;

  v2 = OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_22_0((uint64_t)v2);
  OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_27(OBJC_IVAR____TtC17_MusicKit_SwiftUI13ArtworkLoader___observationRegistrar);
  sub_226EEEBA4(&qword_253F42CF0, (uint64_t (*)(uint64_t))type metadata accessor for ArtworkLoader, (uint64_t)&protocol conformance descriptor for ArtworkLoader);
  OUTLINED_FUNCTION_2_1(v3);
  OUTLINED_FUNCTION_15_0();
  *v1 = v0;
  OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_9_0();
  sub_226EEBEE8();
  v1[7] = v4;
  OUTLINED_FUNCTION_7_0();
}

void sub_226EEC164(_QWORD *a1)
{
  sub_226EEC3E4(a1);
}

void sub_226EEC170(uint64_t a1)
{
  uint64_t v1;
  void *v3;

  OUTLINED_FUNCTION_1_1();
  v3 = *(void **)(v1 + 48);
  *(_QWORD *)(v1 + 48) = a1;

}

void sub_226EEC1B0()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_28();
}

void *sub_226EEC1E4@<X0>(_QWORD *a1@<X8>)
{
  void *result;

  result = sub_226EEC238();
  *a1 = result;
  return result;
}

void sub_226EEC20C(id *a1)
{
  id v1;
  id v2;

  v1 = *a1;
  v2 = *a1;
  sub_226EEC2C4(v1);
}

void *sub_226EEC238()
{
  uint64_t v0;
  void *v1;
  id v2;

  swift_getKeyPath();
  sub_226EEEBA4(&qword_253F42CF0, (uint64_t (*)(uint64_t))type metadata accessor for ArtworkLoader, (uint64_t)&protocol conformance descriptor for ArtworkLoader);
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_39();
  OUTLINED_FUNCTION_1_1();
  v1 = *(void **)(v0 + 48);
  v2 = v1;
  return v1;
}

void sub_226EEC2C4(void *a1)
{
  swift_getKeyPath();
  OUTLINED_FUNCTION_14_0();
  OUTLINED_FUNCTION_9_0();

  OUTLINED_FUNCTION_19_0();
}

void sub_226EEC30C(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  sub_226EEC170((uint64_t)a2);
}

void sub_226EEC34C()
{
  uint64_t v0;
  _QWORD *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;

  v2 = OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_22_0((uint64_t)v2);
  OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_27(OBJC_IVAR____TtC17_MusicKit_SwiftUI13ArtworkLoader___observationRegistrar);
  sub_226EEEBA4(&qword_253F42CF0, (uint64_t (*)(uint64_t))type metadata accessor for ArtworkLoader, (uint64_t)&protocol conformance descriptor for ArtworkLoader);
  OUTLINED_FUNCTION_2_1(v3);
  OUTLINED_FUNCTION_15_0();
  *v1 = v0;
  OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_9_0();
  sub_226EEC1B0();
  v1[7] = v4;
  OUTLINED_FUNCTION_7_0();
}

void sub_226EEC3D8(_QWORD *a1)
{
  sub_226EEC3E4(a1);
}

void sub_226EEC3E4(_QWORD *a1)
{
  _QWORD *v1;

  v1 = (_QWORD *)*a1;
  (*(void (**)(_QWORD, _QWORD))(*a1 + 56))(*a1, 0);
  *v1 = v1[4];
  swift_getKeyPath();
  OUTLINED_FUNCTION_40();
  sub_226F0129C();
  swift_release();
  free(v1);
}

uint64_t sub_226EEC450(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;

  v3 = (_QWORD *)(v2 + OBJC_IVAR____TtC17_MusicKit_SwiftUI13ArtworkLoader_lastLoadingStatusHandler);
  v4 = *(_QWORD *)(v2 + OBJC_IVAR____TtC17_MusicKit_SwiftUI13ArtworkLoader_lastLoadingStatusHandler);
  *v3 = a1;
  v3[1] = a2;
  return sub_226EEDD60(v4);
}

void sub_226EEC470(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  v2 = *(void **)(v1 + OBJC_IVAR____TtC17_MusicKit_SwiftUI13ArtworkLoader_cachedCloudArtworkCatalog);
  *(_QWORD *)(v1 + OBJC_IVAR____TtC17_MusicKit_SwiftUI13ArtworkLoader_cachedCloudArtworkCatalog) = a1;

}

void sub_226EEC484(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, unsigned __int8 *a6, void (*a7)(_QWORD *), uint64_t a8, double a9, double a10, double a11, double a12, double a13, uint64_t a14, uint64_t a15)
{
  uint64_t v15;
  uint64_t v22;
  uint64_t (*v23)(void);
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  int *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  char *v31;
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
  uint64_t v43;
  uint64_t v44;
  char *v45;
  uint64_t v46;
  char *v47;
  uint64_t v48;
  uint64_t v49;
  double v50;
  double v51;
  char v52;
  BOOL v53;
  double v54;
  double v55;
  uint64_t v56;
  id v57;
  uint64_t (*v58)(void);
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t (*v66)(void);
  uint64_t v67;
  uint64_t v68;
  uint64_t (*v69)(void);
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  char v74;
  uint64_t v75;
  char v76;
  void (*v77)(uint64_t, uint64_t);
  void *v78;
  void *v79;
  uint64_t v80;
  double *v81;
  char *v82;
  char *v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t EnumTagSinglePayload;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  char v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  char v105;
  char v106;
  uint64_t v107;
  void (*v108)(_QWORD *);
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  int v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t (*v118)(void);
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t v128;
  unsigned __int8 v129[24];

  v109 = a8;
  v108 = a7;
  v123 = a5;
  v119 = a4;
  v120 = a3;
  v121 = a2;
  v128 = a1;
  v122 = __swift_instantiateConcreteTypeFromMangledName(qword_253F42F90);
  OUTLINED_FUNCTION_3_0();
  MEMORY[0x24BDAC7A8](v22);
  OUTLINED_FUNCTION_11_0();
  v118 = v23;
  v126 = OUTLINED_FUNCTION_23();
  v124 = *(_QWORD *)(v126 - 8);
  MEMORY[0x24BDAC7A8](v126);
  OUTLINED_FUNCTION_11_0();
  v110 = v24;
  v111 = __swift_instantiateConcreteTypeFromMangledName(&qword_253F43230);
  OUTLINED_FUNCTION_3_0();
  MEMORY[0x24BDAC7A8](v25);
  OUTLINED_FUNCTION_11_0();
  v117 = v26;
  v27 = (int *)OUTLINED_FUNCTION_41();
  OUTLINED_FUNCTION_3_0();
  v29 = MEMORY[0x24BDAC7A8](v28);
  v31 = (char *)&v107 - ((v30 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v29);
  v115 = (uint64_t)&v107 - v32;
  __swift_instantiateConcreteTypeFromMangledName(&qword_253F42F88);
  OUTLINED_FUNCTION_3_0();
  MEMORY[0x24BDAC7A8](v33);
  OUTLINED_FUNCTION_43();
  OUTLINED_FUNCTION_10_0();
  MEMORY[0x24BDAC7A8](v34);
  OUTLINED_FUNCTION_10_0();
  MEMORY[0x24BDAC7A8](v35);
  OUTLINED_FUNCTION_10_0();
  v37 = MEMORY[0x24BDAC7A8](v36);
  v125 = (uint64_t)&v107 - v38;
  MEMORY[0x24BDAC7A8](v37);
  v40 = (char *)&v107 - v39;
  __swift_instantiateConcreteTypeFromMangledName(&qword_253F43228);
  OUTLINED_FUNCTION_3_0();
  MEMORY[0x24BDAC7A8](v41);
  OUTLINED_FUNCTION_43();
  OUTLINED_FUNCTION_10_0();
  v43 = MEMORY[0x24BDAC7A8](v42);
  v45 = (char *)&v107 - v44;
  MEMORY[0x24BDAC7A8](v43);
  v47 = (char *)&v107 - v46;
  v48 = sub_226F01278();
  v49 = *(_QWORD *)(v48 - 8);
  MEMORY[0x24BDAC7A8](v48);
  OUTLINED_FUNCTION_26();
  v112 = *a6;
  v127 = v15;
  v50 = COERCE_DOUBLE(sub_226EEBF7C());
  if ((v52 & 1) != 0 || (v50 == a12 ? (v53 = v51 == a13) : (v53 = 0), !v53))
    sub_226EEC004();
  sub_226F0126C();
  sub_226F01260();
  v55 = v54;
  OUTLINED_FUNCTION_36(*(uint64_t (**)(uint64_t, uint64_t))(v49 + 8));
  v56 = sub_226EEA634();
  if (v56)
  {
    v57 = (id)v56;
    v58 = *(uint64_t (**)(void))(v124 + 16);
    v59 = v127;
    v60 = (uint64_t)v118;
    v61 = v120;
    v62 = v119;
    goto LABEL_27;
  }
  v59 = v127;
  v63 = v127 + OBJC_IVAR____TtC17_MusicKit_SwiftUI13ArtworkLoader_lastParameters;
  OUTLINED_FUNCTION_1_1();
  sub_226EEE060(v63, (uint64_t)v40, &qword_253F42F88);
  v64 = OUTLINED_FUNCTION_20_0();
  if ((_DWORD)v64)
  {
    OUTLINED_FUNCTION_21_0(v64, &qword_253F42F88);
    v65 = v126;
    __swift_storeEnumTagSinglePayload((uint64_t)v47, 1, 1, v126);
    v66 = *(uint64_t (**)(void))(v124 + 16);
  }
  else
  {
    v67 = v115;
    v68 = sub_226EEA4B0((uint64_t)v40, v115);
    OUTLINED_FUNCTION_21_0(v68, &qword_253F42F88);
    v69 = *(uint64_t (**)(void))(v124 + 16);
    v65 = v126;
    ((void (*)(char *, uint64_t, uint64_t))v69)(v47, v67, v126);
    sub_226EEA4F4(v67);
    OUTLINED_FUNCTION_30((uint64_t)v47);
    v66 = v69;
  }
  v60 = (uint64_t)v118;
  v70 = v117;
  v71 = v111;
  OUTLINED_FUNCTION_38(v66);
  OUTLINED_FUNCTION_30((uint64_t)v45);
  v72 = v70 + *(int *)(v71 + 48);
  sub_226EEE060((uint64_t)v47, v70, &qword_253F43228);
  sub_226EEE060((uint64_t)v45, v72, &qword_253F43228);
  OUTLINED_FUNCTION_24(v70);
  if (v53)
  {
    OUTLINED_FUNCTION_16_0((uint64_t)v45);
    OUTLINED_FUNCTION_16_0((uint64_t)v47);
    v73 = OUTLINED_FUNCTION_24(v72);
    v62 = v119;
    if (v53)
    {
      OUTLINED_FUNCTION_44(v73, &qword_253F43228);
      v61 = v120;
      goto LABEL_23;
    }
LABEL_20:
    OUTLINED_FUNCTION_44(v73, &qword_253F43230);
    v61 = v120;
LABEL_22:
    sub_226EEC470(0);
    goto LABEL_23;
  }
  sub_226EEE060(v70, v107, &qword_253F43228);
  OUTLINED_FUNCTION_24(v72);
  if (v74)
  {
    OUTLINED_FUNCTION_32((uint64_t)v45);
    OUTLINED_FUNCTION_32((uint64_t)v47);
    v73 = OUTLINED_FUNCTION_36(*(uint64_t (**)(uint64_t, uint64_t))(v124 + 8));
    v62 = v119;
    goto LABEL_20;
  }
  v75 = v110;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v124 + 32))(v110, v72, v65);
  sub_226EEEBA4(&qword_253F43220, (uint64_t (*)(uint64_t))MEMORY[0x24BDDF898], MEMORY[0x24BDDF8B8]);
  v76 = sub_226F01728();
  v77 = *(void (**)(uint64_t, uint64_t))(v124 + 8);
  v77(v75, v65);
  OUTLINED_FUNCTION_16_0((uint64_t)v45);
  OUTLINED_FUNCTION_16_0((uint64_t)v47);
  v77(v107, v65);
  v59 = v127;
  OUTLINED_FUNCTION_16_0(v70);
  v61 = v120;
  v62 = v119;
  if ((v76 & 1) == 0)
    goto LABEL_22;
LABEL_23:
  v78 = *(void **)(v59 + OBJC_IVAR____TtC17_MusicKit_SwiftUI13ArtworkLoader_cachedCloudArtworkCatalog);
  if (v78)
  {
    v57 = v78;
  }
  else
  {
    v79 = (void *)sub_226EEA6A0();
    v57 = v79;
    sub_226EEC470((uint64_t)v79);

  }
  v58 = v118;
LABEL_27:
  v80 = OUTLINED_FUNCTION_38(v58);
  *(_QWORD *)&v31[v27[5]] = sub_226EFDDC4(v80);
  *(double *)&v31[v27[6]] = a9;
  v81 = (double *)&v31[v27[7]];
  *v81 = a10;
  v81[1] = a11;
  v82 = &v31[v27[8]];
  *(_QWORD *)v82 = v121;
  *((_QWORD *)v82 + 1) = v61;
  v83 = &v31[v27[9]];
  v84 = v123;
  *(_QWORD *)v83 = v62;
  *((_QWORD *)v83 + 1) = v84;
  v85 = v59 + OBJC_IVAR____TtC17_MusicKit_SwiftUI13ArtworkLoader_lastParameters;
  OUTLINED_FUNCTION_1_1();
  v86 = v125;
  sub_226EEA4B0((uint64_t)v31, v125);
  OUTLINED_FUNCTION_31(v86);
  v87 = v60 + *(int *)(v122 + 48);
  sub_226EEE060(v85, v60, &qword_253F42F88);
  v88 = OUTLINED_FUNCTION_40();
  sub_226EEE060(v88, v89, &qword_253F42F88);
  if (OUTLINED_FUNCTION_20_0() == 1)
  {
    OUTLINED_FUNCTION_33();
    OUTLINED_FUNCTION_46();
    sub_226EEE5A0(v86, &qword_253F42F88);
    EnumTagSinglePayload = __swift_getEnumTagSinglePayload(v87, 1, (uint64_t)v27);
    if ((_DWORD)EnumTagSinglePayload == 1)
    {
      OUTLINED_FUNCTION_21_0(EnumTagSinglePayload, &qword_253F42F88);
LABEL_36:
      sub_226EEA4F4((uint64_t)v31);

      return;
    }
    goto LABEL_32;
  }
  v91 = v113;
  sub_226EEE060(v60, v113, &qword_253F42F88);
  if (__swift_getEnumTagSinglePayload(v87, 1, (uint64_t)v27) == 1)
  {
    OUTLINED_FUNCTION_33();
    OUTLINED_FUNCTION_46();
    sub_226EEE5A0(v125, &qword_253F42F88);
    EnumTagSinglePayload = sub_226EEA4F4(v91);
LABEL_32:
    OUTLINED_FUNCTION_21_0(EnumTagSinglePayload, qword_253F42F90);
    goto LABEL_33;
  }
  v95 = v115;
  sub_226EEE0E8(v87, v115);
  OUTLINED_FUNCTION_33();
  OUTLINED_FUNCTION_46();
  v96 = sub_226EE9DCC(v91, v95);
  sub_226EEA4F4(v95);
  OUTLINED_FUNCTION_32(v125);
  sub_226EEA4F4(v91);
  OUTLINED_FUNCTION_32(v60);
  if ((v96 & 1) != 0)
    goto LABEL_36;
LABEL_33:
  v92 = v116;
  sub_226EEE060(v85, v116, &qword_253F42F88);
  if (__swift_getEnumTagSinglePayload(v92, 1, (uint64_t)v27))
  {
    sub_226EEE5A0(v92, &qword_253F42F88);
    v93 = 0;
    v94 = 0;
  }
  else
  {
    v97 = v115;
    sub_226EEA4B0(v92, v115);
    sub_226EEE5A0(v92, &qword_253F42F88);
    v98 = v110;
    v99 = v126;
    ((void (*)(uint64_t, uint64_t, uint64_t))v118)(v110, v97, v126);
    sub_226EEA4F4(v97);
    v93 = sub_226F016E0();
    v94 = v100;
    (*(void (**)(uint64_t, uint64_t))(v124 + 8))(v98, v99);
  }
  v101 = sub_226F016E0();
  v103 = v102;
  if (v94)
  {
    if (v102)
    {
      if (v93 == v101 && v94 == v102)
      {
        swift_bridgeObjectRelease();
        OUTLINED_FUNCTION_47();
        OUTLINED_FUNCTION_23_0();
        goto LABEL_52;
      }
      v105 = sub_226F018E4();
      swift_bridgeObjectRelease();
      OUTLINED_FUNCTION_47();
      v106 = v105 | v112;
      v94 = v128;
      v93 = v114;
      if ((v106 & 1) != 0)
        goto LABEL_52;
      goto LABEL_50;
    }
    OUTLINED_FUNCTION_23_0();
  }
  else
  {
    OUTLINED_FUNCTION_23_0();
    if (!v103)
      goto LABEL_52;
  }
  OUTLINED_FUNCTION_47();
  if ((v112 & 1) == 0)
LABEL_50:
    sub_226EEC2C4(0);
LABEL_52:
  sub_226EEA4B0((uint64_t)v31, v93);
  OUTLINED_FUNCTION_31(v93);
  OUTLINED_FUNCTION_1_1();
  sub_226EEE0A0(v93, v85);
  swift_endAccess();
  sub_226EEDA48(v94, a14, a15, a10, a11, v55);
  v129[0] = 0;
  OUTLINED_FUNCTION_13_0(v129);
  if ((sub_226F016BC() & 1) != 0)
  {
    v129[0] = 2;
    sub_226EED790(v129, 2u, 0);
  }
  else
  {
    sub_226EECEAC((uint64_t)v31, v108);
  }

  sub_226EEA4F4((uint64_t)v31);
}

uint64_t sub_226EECEAC(uint64_t a1, void (*a2)(_QWORD *))
{
  uint64_t v2;
  int *v5;
  double *v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  id v22;
  uint64_t v23;
  void *v25;
  _QWORD v26[4];

  v5 = (int *)OUTLINED_FUNCTION_41();
  v6 = (double *)(a1 + v5[7]);
  v7 = *(double *)(a1 + v5[6]);
  v8 = *v6;
  v9 = v6[1];
  v10 = *(void **)(a1 + v5[5]);
  v11 = objc_msgSend(v10, sel_token);
  sub_226F01848();
  v12 = swift_unknownObjectRelease();
  OUTLINED_FUNCTION_42(v12, &qword_253F42DD8);
  v13 = swift_dynamicCast();
  if ((v13 & 1) != 0)
  {
    v14 = (uint64_t *)(a1 + v5[8]);
    v15 = v14[1];
    if (v15)
    {
      v16 = *v14;
      v17 = (uint64_t *)(a1 + v5[9]);
      if (v17[1])
      {
        v18 = *v17;
        v19 = v17[1];
      }
      else
      {
        v18 = sub_226F01758();
        v19 = v20;
      }
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      sub_226EEE944(v16, v15, v25);
      swift_bridgeObjectRelease();
      sub_226EEE988(v18, v19, v25);
    }

  }
  if (a2)
  {
    OUTLINED_FUNCTION_42(v13, (unint64_t *)&qword_253F43240);
    v26[3] = v21;
    v26[0] = v10;
    sub_226EEE900((uint64_t)a2);
    v22 = v10;
    a2(v26);
    sub_226EEDD60((uint64_t)a2);
    sub_226EEE910((uint64_t)v26);
  }
  objc_msgSend(v10, sel_setFittingSize_, v8 / v7, v9 / v7);
  v23 = OUTLINED_FUNCTION_18_0();
  swift_unknownObjectWeakInit();
  sub_226EED268(v2, 1, (uint64_t)sub_226EEE8F8, v23);
  return OUTLINED_FUNCTION_9_0();
}

void sub_226EED0BC(_QWORD *a1, void *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  _BYTE *v8;
  uint64_t v9;
  uint64_t v10;
  _BYTE *v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  void *v15;
  char v16;
  id v17;
  _BYTE v18[24];

  v6 = _s10ParametersVMa();
  MEMORY[0x24BDAC7A8](v6);
  v8 = &v18[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_253F42F88);
  MEMORY[0x24BDAC7A8](v9);
  v11 = &v18[-((v10 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v12 = a3 + 16;
  v13 = *a1 + OBJC_IVAR____TtC17_MusicKit_SwiftUI13ArtworkLoader_lastParameters;
  swift_beginAccess();
  sub_226EEE060(v13, (uint64_t)v11, &qword_253F42F88);
  if (__swift_getEnumTagSinglePayload((uint64_t)v11, 1, v6))
  {
    sub_226EEE5A0((uint64_t)v11, &qword_253F42F88);
    v14 = 0;
  }
  else
  {
    sub_226EEA4B0((uint64_t)v11, (uint64_t)v8);
    sub_226EEE5A0((uint64_t)v11, &qword_253F42F88);
    v14 = *(id *)&v8[*(int *)(v6 + 20)];
    sub_226EEA4F4((uint64_t)v8);
  }
  swift_beginAccess();
  v15 = (void *)MEMORY[0x2276A6608](v12);
  v16 = sub_226EFDFD0(v15, v14);

  if ((v16 & 1) != 0)
  {
    v17 = objc_msgSend(a2, sel_imageRepresentation);
    sub_226EED34C(v17);

  }
}

uint64_t sub_226EED268(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  void *v4;
  uint64_t v9;
  void *v10;
  _QWORD v12[6];

  v9 = swift_allocObject();
  *(_QWORD *)(v9 + 16) = a3;
  *(_QWORD *)(v9 + 24) = a4;
  v12[4] = sub_226EEE9D8;
  v12[5] = v9;
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 1107296256;
  v12[2] = sub_226EEE710;
  v12[3] = &block_descriptor;
  v10 = _Block_copy(v12);
  swift_retain();
  swift_retain();
  swift_release();
  objc_msgSend(v4, sel_setMainThreadBoundDestination_forRepresentationKinds_configurationBlock_, a1, a2, v10);
  _Block_release(v10);
  return swift_release();
}

void sub_226EED34C(void *a1)
{
  uint64_t v2;
  uint64_t v3;
  char *v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  _QWORD *v13;
  uint64_t v14;
  uint64_t v15;
  id v16;

  __swift_instantiateConcreteTypeFromMangledName(&qword_253F43238);
  OUTLINED_FUNCTION_3_0();
  MEMORY[0x24BDAC7A8](v2);
  v4 = (char *)&v15 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a1)
  {
    v5 = a1;
    v6 = sub_226EFE024();
    if (v6)
    {
      v16 = v6;
      sub_226EED744(v6);

    }
    else
    {
      v7 = sub_226F017DC();
      OUTLINED_FUNCTION_37((uint64_t)v4, v8, v9, v7);
      v10 = OUTLINED_FUNCTION_18_0();
      swift_weakInit();
      sub_226F017C4();
      v11 = v5;
      swift_retain();
      v12 = sub_226F017B8();
      v13 = (_QWORD *)OUTLINED_FUNCTION_18_0();
      v14 = MEMORY[0x24BEE6930];
      v13[2] = v12;
      v13[3] = v14;
      v13[4] = v11;
      v13[5] = v10;
      OUTLINED_FUNCTION_15_0();
      sub_226EED600((uint64_t)v4, (uint64_t)&unk_2558AC8A0, (uint64_t)v13);
      swift_release();

    }
  }
  else
  {
    sub_226EED744(0);
  }
}

uint64_t sub_226EED4AC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _QWORD *v5;
  _QWORD *v6;

  v5[5] = a5;
  v5[6] = sub_226F017C4();
  v5[7] = sub_226F017B8();
  v6 = (_QWORD *)swift_task_alloc();
  v5[8] = v6;
  *v6 = v5;
  v6[1] = sub_226EED514;
  return sub_226EFE064();
}

uint64_t sub_226EED514(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 72) = a1;
  swift_task_dealloc();
  sub_226F017AC();
  return swift_task_switch();
}

uint64_t sub_226EED58C()
{
  uint64_t v0;

  swift_release();
  OUTLINED_FUNCTION_1_1();
  if (swift_weakLoadStrong())
  {
    sub_226EED744(*(void **)(v0 + 72));
    swift_release();
  }

  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_226EED600(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;

  v6 = sub_226F017DC();
  if (__swift_getEnumTagSinglePayload(a1, 1, v6) == 1)
  {
    sub_226EEE5A0(a1, &qword_253F43238);
  }
  else
  {
    sub_226F017D0();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 8))(a1, v6);
  }
  if (*(_QWORD *)(a3 + 16))
  {
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_226F017AC();
    swift_unknownObjectRelease();
  }
  v7 = swift_allocObject();
  *(_QWORD *)(v7 + 16) = a2;
  *(_QWORD *)(v7 + 24) = a3;
  return swift_task_create();
}

void sub_226EED744(void *a1)
{
  id v2;
  char *v3;
  char v4;
  char v5;

  v2 = a1;
  sub_226EEC2C4(a1);
  if (a1)
  {
    v4 = 1;
    v3 = &v4;
  }
  else
  {
    v5 = 2;
    v3 = &v5;
  }
  OUTLINED_FUNCTION_13_0((unsigned __int8 *)v3);
  OUTLINED_FUNCTION_34();
}

void sub_226EED790(unsigned __int8 *a1, unsigned __int8 a2, char a3)
{
  uint64_t v3;
  uint64_t v4;
  int v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  int v12;
  void (*v13)(_QWORD *);
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void (*v20)(uint64_t);
  uint64_t v21;
  uint64_t v22;
  _QWORD aBlock[6];

  v7 = a2;
  v8 = sub_226F01644();
  MEMORY[0x24BDAC7A8](v8);
  v10 = (char *)&v21 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v22 = sub_226F0165C();
  v11 = *(_QWORD *)(v22 - 8);
  MEMORY[0x24BDAC7A8](v22);
  OUTLINED_FUNCTION_26();
  v12 = *a1;
  if (v7 == 2)
  {
    if ((*(_BYTE *)(v3 + OBJC_IVAR____TtC17_MusicKit_SwiftUI13ArtworkLoader_shouldEnforceUsageOnMainThread) & 1) == 0)
      goto LABEL_6;
  }
  else if ((v7 & 1) == 0)
  {
    goto LABEL_6;
  }
  if (!objc_msgSend((id)objc_opt_self(), sel_isMainThread))
  {
    __break(1u);
    return;
  }
LABEL_6:
  v13 = *(void (**)(_QWORD *))(v3
                                        + OBJC_IVAR____TtC17_MusicKit_SwiftUI13ArtworkLoader_lastLoadingStatusHandler);
  if (v13)
  {
    v14 = *(_QWORD *)(v3 + OBJC_IVAR____TtC17_MusicKit_SwiftUI13ArtworkLoader_lastLoadingStatusHandler + 8);
    if ((v12 - 1) >= 2)
    {
      v15 = swift_retain();
      if ((a3 & 1) == 0)
        goto LABEL_9;
    }
    else
    {
      swift_retain();
      v15 = sub_226EEC450(0, 0);
      if ((a3 & 1) == 0)
      {
LABEL_9:
        LOBYTE(aBlock[0]) = v12;
        v13(aBlock);
        OUTLINED_FUNCTION_35();
        return;
      }
    }
    OUTLINED_FUNCTION_42(v15, qword_253F43260);
    v21 = sub_226F01800();
    v16 = OUTLINED_FUNCTION_18_0();
    *(_QWORD *)(v16 + 16) = v13;
    *(_QWORD *)(v16 + 24) = v14;
    *(_BYTE *)(v16 + 32) = v12;
    aBlock[4] = sub_226EEEB74;
    aBlock[5] = v16;
    aBlock[0] = MEMORY[0x24BDAC760];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_226EEDA1C;
    aBlock[3] = &block_descriptor_34;
    v17 = _Block_copy(aBlock);
    swift_retain();
    swift_release();
    sub_226F01650();
    aBlock[0] = MEMORY[0x24BEE4AF8];
    sub_226EEEBA4(&qword_253F43308, (uint64_t (*)(uint64_t))MEMORY[0x24BEE5458], MEMORY[0x24BEE5468]);
    __swift_instantiateConcreteTypeFromMangledName(&qword_253F43310);
    sub_226EEEBE0();
    sub_226F01854();
    v18 = (void *)v21;
    MEMORY[0x2276A5FCC](0, v4, v10, v17);
    _Block_release(v17);

    OUTLINED_FUNCTION_35();
    v19 = OUTLINED_FUNCTION_40();
    v20(v19);
    (*(void (**)(uint64_t, uint64_t))(v11 + 8))(v4, v22);
  }
}

uint64_t sub_226EEDA1C(uint64_t a1)
{
  void (*v1)(uint64_t);
  uint64_t v2;

  v1 = *(void (**)(uint64_t))(a1 + 32);
  v2 = swift_retain();
  v1(v2);
  return swift_release();
}

uint64_t sub_226EEDA48(uint64_t a1, uint64_t a2, uint64_t a3, double a4, double a5, double a6)
{
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  double *v18;
  uint64_t v19;
  _BYTE v21[15];
  unsigned __int8 v22;

  v12 = OUTLINED_FUNCTION_23();
  v13 = *(_QWORD *)(v12 - 8);
  v14 = *(_QWORD *)(v13 + 64);
  MEMORY[0x24BDAC7A8](v12);
  v22 = 3;
  OUTLINED_FUNCTION_13_0(&v22);
  v15 = OUTLINED_FUNCTION_18_0();
  swift_weakInit();
  (*(void (**)(_BYTE *, uint64_t, uint64_t))(v13 + 16))(&v21[-((v14 + 15) & 0xFFFFFFFFFFFFFFF0)], a1, v12);
  v16 = (*(unsigned __int8 *)(v13 + 80) + 48) & ~(unint64_t)*(unsigned __int8 *)(v13 + 80);
  v17 = swift_allocObject();
  *(_QWORD *)(v17 + 16) = v15;
  *(double *)(v17 + 24) = a6;
  *(_QWORD *)(v17 + 32) = a2;
  *(_QWORD *)(v17 + 40) = a3;
  (*(void (**)(unint64_t, _BYTE *, uint64_t))(v13 + 32))(v17 + v16, &v21[-((v14 + 15) & 0xFFFFFFFFFFFFFFF0)], v12);
  v18 = (double *)(v17 + ((v14 + v16 + 7) & 0xFFFFFFFFFFFFFFF8));
  *v18 = a4;
  v18[1] = a5;
  v19 = OUTLINED_FUNCTION_40();
  sub_226EEE900(v19);
  return sub_226EEC450((uint64_t)sub_226EEEAC0, v17);
}

void sub_226EEDB98(unsigned __int8 *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  int v6;
  unsigned __int8 v8[16];

  v2 = sub_226F01278();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v8[-((v4 + 15) & 0xFFFFFFFFFFFFFFF0) - 8];
  v6 = *a1;
  swift_beginAccess();
  if (swift_weakLoadStrong())
  {
    v8[0] = v6;
    sub_226EEDD0C(v8);
    swift_release();
  }
  sub_226F0126C();
  sub_226F01260();
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  __asm { BR              X11 }
}

uint64_t sub_226EEDC9C(double a1)
{
  uint64_t (*v1)(uint64_t, uint64_t, double, double);
  uint64_t v2;
  uint64_t v3;
  double v4;
  double v5;
  uint64_t result;

  if (v1)
  {
    *(double *)(v3 - 136) = a1;
    *(_BYTE *)(v3 - 128) = 0;
    return v1(v2, v3 - 136, v5, v4);
  }
  return result;
}

void sub_226EEDCFC()
{
  uint64_t v0;

  if (!v0)
    JUMPOUT(0x226EEDCD8);
  JUMPOUT(0x226EEDCB8);
}

void sub_226EEDD0C(unsigned __int8 *a1)
{
  _BOOL4 v1;

  v1 = *a1 == 2;
  if ((sub_226EEBD60() & 1) != v1)
    sub_226EEBB8C();
}

uint64_t sub_226EEDD60(uint64_t result)
{
  if (result)
    return swift_release();
  return result;
}

uint64_t type metadata accessor for ArtworkLoader()
{
  uint64_t result;

  result = qword_253F42FF8;
  if (!qword_253F42FF8)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_226EEDDB0()
{
  uint64_t v0;

  return sub_226EEC070(*(_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 24), *(_QWORD *)(v0 + 32), *(_BYTE *)(v0 + 40));
}

uint64_t sub_226EEDDD0()
{
  sub_226EEEBA4(&qword_253F42CF0, (uint64_t (*)(uint64_t))type metadata accessor for ArtworkLoader, (uint64_t)&protocol conformance descriptor for ArtworkLoader);
  return sub_226F01284();
}

void sub_226EEDE70(void **a1@<X8>)
{
  *a1 = sub_226EEC238();
  OUTLINED_FUNCTION_28();
}

void sub_226EEDE98()
{
  uint64_t v0;

  sub_226EEC30C(*(_QWORD *)(v0 + 16), *(void **)(v0 + 24));
}

uint64_t sub_226EEDEB0(unsigned __int8 *a1)
{
  return ((uint64_t (*)(void))((char *)sub_226EEDED0 + 4 * byte_226F02414[*a1]))();
}

BOOL sub_226EEDED0@<W0>(int a1@<W8>)
{
  return a1 == 0;
}

void sub_226EEDF04()
{
  __asm { BR              X9 }
}

uint64_t sub_226EEDF34()
{
  return sub_226F01938();
}

void sub_226EEDF60()
{
  unsigned __int8 *v0;
  uint64_t v1;

  v1 = *v0;
  sub_226F0192C();
  __asm { BR              X9 }
}

uint64_t sub_226EEDF98()
{
  sub_226F01938();
  return sub_226F0195C();
}

void sub_226EEDFE8()
{
  unsigned __int8 *v0;
  uint64_t v1;

  v1 = *v0;
  sub_226F0192C();
  __asm { BR              X9 }
}

uint64_t sub_226EEE01C()
{
  sub_226F01938();
  return sub_226F0195C();
}

void sub_226EEE060(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, a1, v5);
  OUTLINED_FUNCTION_28();
}

uint64_t sub_226EEE0A0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_253F42F88);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t sub_226EEE0E8(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = _s10ParametersVMa();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_226EEE12C()
{
  return type metadata accessor for ArtworkLoader();
}

void sub_226EEE134()
{
  unint64_t v0;
  unint64_t v1;

  sub_226EEE2A0();
  if (v0 <= 0x3F)
  {
    sub_226F012C0();
    if (v1 <= 0x3F)
      swift_updateClassMetadata2();
  }
}

uint64_t method lookup function for ArtworkLoader()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of ArtworkLoader.__allocating_init(shouldEnforceUsageOnMainThread:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 144))();
}

uint64_t dispatch thunk of ArtworkLoader.didFailToLoadArtwork.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 176))();
}

uint64_t dispatch thunk of ArtworkLoader.didFailToLoadArtwork.setter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 184))();
}

uint64_t dispatch thunk of ArtworkLoader.didFailToLoadArtwork.modify()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 192))();
}

uint64_t dispatch thunk of ArtworkLoader.containerSize.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 224))();
}

uint64_t dispatch thunk of ArtworkLoader.containerSize.setter(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t v3;

  return (*(uint64_t (**)(uint64_t, uint64_t, _QWORD))(*(_QWORD *)v3 + 232))(a1, a2, a3 & 1);
}

uint64_t dispatch thunk of ArtworkLoader.containerSize.modify()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 240))();
}

uint64_t dispatch thunk of ArtworkLoader.image.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 272))();
}

uint64_t dispatch thunk of ArtworkLoader.image.setter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 280))();
}

uint64_t dispatch thunk of ArtworkLoader.image.modify()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 288))();
}

uint64_t dispatch thunk of ArtworkLoader.load(_:for:width:height:containerSize:rawCropStyle:rawImageFormat:reusePolicy:configurationHandler:loadingObserverHandler:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 368))();
}

void sub_226EEE2A0()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_253F42AF8)
  {
    _s10ParametersVMa();
    v0 = sub_226F01824();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_253F42AF8);
  }
}

_BYTE *__swift_memcpy1_1(_BYTE *result, _BYTE *a2)
{
  *result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for ArtworkLoader.SimplifiedLoadingStatus(unsigned __int8 *a1, unsigned int a2)
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
  if (a2 >= 0xFD)
  {
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
    v5 = (*a1 | (v4 << 8)) - 4;
    return (v5 + 1);
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 4;
  v5 = v6 - 4;
  if (!v7)
    v5 = -1;
  return (v5 + 1);
}

uint64_t storeEnumTagSinglePayload for ArtworkLoader.SimplifiedLoadingStatus(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_226EEE3D4 + 4 * byte_226F02429[v4]))();
  *a1 = a2 + 3;
  return ((uint64_t (*)(void))((char *)sub_226EEE408 + 4 * byte_226F02424[v4]))();
}

uint64_t sub_226EEE408(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_226EEE410(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x226EEE418);
  return result;
}

uint64_t sub_226EEE424(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x226EEE42CLL);
  *(_BYTE *)result = a2 + 3;
  return result;
}

uint64_t sub_226EEE430(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_226EEE438(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_226EEE444(unsigned __int8 *a1)
{
  return *a1;
}

_BYTE *sub_226EEE44C(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

ValueMetadata *type metadata accessor for ArtworkLoader.SimplifiedLoadingStatus()
{
  return &type metadata for ArtworkLoader.SimplifiedLoadingStatus;
}

unint64_t sub_226EEE468()
{
  unint64_t result;

  result = qword_2558AC890;
  if (!qword_2558AC890)
  {
    result = MEMORY[0x2276A650C](&unk_226F025B8, &type metadata for ArtworkLoader.SimplifiedLoadingStatus);
    atomic_store(result, &qword_2558AC890);
  }
  return result;
}

uint64_t sub_226EEE4A4()
{
  swift_weakDestroy();
  return swift_deallocObject();
}

uint64_t sub_226EEE4C8()
{
  uint64_t v0;

  swift_unknownObjectRelease();

  swift_release();
  return swift_deallocObject();
}

uint64_t sub_226EEE4FC(uint64_t a1)
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
  v8[1] = sub_226EEE574;
  return sub_226EED4AC(a1, v4, v5, v7, v6);
}

uint64_t sub_226EEE574()
{
  uint64_t v0;

  OUTLINED_FUNCTION_0_2();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

void sub_226EEE5A0(uint64_t a1, uint64_t *a2)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(a2);
  OUTLINED_FUNCTION_17_0(v2);
  OUTLINED_FUNCTION_28();
}

uint64_t sub_226EEE5C8(uint64_t a1, uint64_t a2, void (*a3)(uint64_t *, uint64_t))
{
  uint64_t result;
  uint64_t v7;
  uint64_t v8;
  _BYTE v9[32];

  sub_226EEE9F8(a1, (uint64_t)v9);
  type metadata accessor for ArtworkLoader();
  if (swift_dynamicCast() && v8)
  {
    v7 = v8;
    a3(&v7, a2);
    return swift_release();
  }
  else
  {
    sub_226EEE9F8(a1, (uint64_t)v9);
    sub_226F01860();
    sub_226F01788();
    sub_226F01884();
    sub_226F01788();
    result = sub_226F018B4();
    __break(1u);
  }
  return result;
}

uint64_t sub_226EEE710(uint64_t a1, uint64_t a2, void *a3)
{
  void (*v5)(_QWORD *, id);
  id v6;
  _QWORD v8[4];

  v5 = *(void (**)(_QWORD *, id))(a1 + 32);
  v8[3] = swift_getObjectType();
  v8[0] = a2;
  swift_retain();
  swift_unknownObjectRetain();
  v6 = a3;
  v5(v8, v6);
  swift_release();

  return __swift_destroy_boxed_opaque_existential_1((uint64_t)v8);
}

uint64_t sub_226EEE790(uint64_t a1, int *a2)
{
  uint64_t v2;
  _QWORD *v4;
  uint64_t (*v6)(uint64_t);

  v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v4;
  *v4 = v2;
  v4[1] = sub_226EEE7F4;
  return v6(a1);
}

uint64_t sub_226EEE7F4()
{
  uint64_t v0;

  OUTLINED_FUNCTION_0_2();
  return OUTLINED_FUNCTION_12_0(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_226EEE81C()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_226EEE840(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  int *v4;
  _QWORD *v5;

  v4 = *(int **)(v1 + 16);
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_226EEE8B0;
  return ((uint64_t (*)(uint64_t, int *))((char *)&dword_2558AC8A8 + dword_2558AC8A8))(a1, v4);
}

uint64_t sub_226EEE8B0()
{
  uint64_t v0;

  OUTLINED_FUNCTION_0_2();
  return OUTLINED_FUNCTION_12_0(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_226EEE8D4()
{
  swift_unknownObjectWeakDestroy();
  return swift_deallocObject();
}

void sub_226EEE8F8(_QWORD *a1, void *a2)
{
  uint64_t v2;

  sub_226EED0BC(a1, a2, v2);
}

uint64_t sub_226EEE900(uint64_t result)
{
  if (result)
    return swift_retain();
  return result;
}

uint64_t sub_226EEE910(uint64_t a1)
{
  destroy for _ArtworkCatalogConfigurationParameters();
  return a1;
}

void sub_226EEE944(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;

  v4 = (id)sub_226F01734();
  objc_msgSend(a3, sel_setCropStyle_, v4);

}

void sub_226EEE988(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;

  v4 = (id)sub_226F01734();
  swift_bridgeObjectRelease();
  objc_msgSend(a3, sel_setFormat_, v4);

}

uint64_t sub_226EEE9D8(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  return sub_226EEE5C8(a1, a2, *(void (**)(uint64_t *, uint64_t))(v2 + 16));
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

uint64_t sub_226EEE9F8(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_226EEEA34()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v1 = OUTLINED_FUNCTION_23();
  v2 = *(_QWORD *)(v1 - 8);
  v3 = *(unsigned __int8 *)(v2 + 80);
  swift_release();
  if (*(_QWORD *)(v0 + 32))
    swift_release();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + ((v3 + 48) & ~v3), v1);
  return swift_deallocObject();
}

void sub_226EEEAC0(unsigned __int8 *a1)
{
  OUTLINED_FUNCTION_23();
  sub_226EEDB98(a1);
}

void sub_226EEEB1C(uint64_t a1, unint64_t *a2)
{
  if (!*a2)
  {
    objc_opt_self();
    atomic_store(swift_getObjCClassMetadata(), a2);
  }
  OUTLINED_FUNCTION_28();
}

uint64_t sub_226EEEB50()
{
  swift_release();
  return swift_deallocObject();
}

void sub_226EEEB74()
{
  uint64_t v0;
  void (*v1)(char *);
  char v2;

  v1 = *(void (**)(char *))(v0 + 16);
  v2 = *(_BYTE *)(v0 + 32);
  v1(&v2);
  OUTLINED_FUNCTION_34();
}

void sub_226EEEBA4(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
{
  uint64_t v5;

  if (!*a1)
  {
    v5 = a2(255);
    atomic_store(MEMORY[0x2276A650C](a3, v5), a1);
  }
  OUTLINED_FUNCTION_28();
}

unint64_t sub_226EEEBE0()
{
  unint64_t result;
  uint64_t v1;

  result = qword_253F43318;
  if (!qword_253F43318)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_253F43310);
    result = MEMORY[0x2276A650C](MEMORY[0x24BEE12C8], v1);
    atomic_store(result, (unint64_t *)&qword_253F43318);
  }
  return result;
}

uint64_t OUTLINED_FUNCTION_0_2()
{
  _QWORD *v0;
  uint64_t v1;

  *(_QWORD *)(v1 - 8) = *v0;
  *(_QWORD *)(v1 - 8) = *v0;
  return swift_task_dealloc();
}

uint64_t OUTLINED_FUNCTION_1_1()
{
  return swift_beginAccess();
}

uint64_t OUTLINED_FUNCTION_2_1(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(v1 + 48) = a1;
  return sub_226F01290();
}

uint64_t OUTLINED_FUNCTION_4_0()
{
  return sub_226F012A8();
}

uint64_t OUTLINED_FUNCTION_5_0()
{
  return sub_226F01290();
}

void *OUTLINED_FUNCTION_6_0()
{
  return malloc(0x40uLL);
}

uint64_t OUTLINED_FUNCTION_8_0()
{
  return swift_getKeyPath();
}

uint64_t OUTLINED_FUNCTION_9_0()
{
  return swift_release();
}

void OUTLINED_FUNCTION_10_0()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(v1 - 256) = v0;
}

uint64_t OUTLINED_FUNCTION_12_0(uint64_t (*a1)(void))
{
  return a1();
}

void OUTLINED_FUNCTION_13_0(unsigned __int8 *a1)
{
  sub_226EED790(a1, 2u, 0);
}

uint64_t OUTLINED_FUNCTION_14_0()
{
  return sub_226EEDDD0();
}

uint64_t OUTLINED_FUNCTION_15_0()
{
  return swift_release();
}

void OUTLINED_FUNCTION_16_0(uint64_t a1)
{
  uint64_t *v1;

  sub_226EEE5A0(a1, v1);
}

uint64_t OUTLINED_FUNCTION_17_0(uint64_t a1)
{
  uint64_t v1;

  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(a1 - 8) + 8))(v1, a1);
}

uint64_t OUTLINED_FUNCTION_18_0()
{
  return swift_allocObject();
}

uint64_t OUTLINED_FUNCTION_20_0()
{
  uint64_t v0;
  uint64_t v1;

  return __swift_getEnumTagSinglePayload(v1, 1, v0);
}

void OUTLINED_FUNCTION_21_0(uint64_t a1, uint64_t *a2)
{
  uint64_t v2;

  sub_226EEE5A0(v2, a2);
}

uint64_t OUTLINED_FUNCTION_22_0(uint64_t result)
{
  uint64_t v1;
  _QWORD *v2;

  *v2 = result;
  *(_QWORD *)(result + 32) = v1;
  return result;
}

uint64_t OUTLINED_FUNCTION_24(uint64_t a1)
{
  uint64_t v1;

  return __swift_getEnumTagSinglePayload(a1, 1, v1);
}

void OUTLINED_FUNCTION_27(uint64_t a1@<X8>)
{
  uint64_t v1;
  _QWORD *v2;

  v2[5] = a1;
  *v2 = v1;
}

uint64_t OUTLINED_FUNCTION_30(uint64_t a1)
{
  uint64_t v1;

  return __swift_storeEnumTagSinglePayload(a1, 0, 1, v1);
}

uint64_t OUTLINED_FUNCTION_31(uint64_t a1)
{
  uint64_t v1;

  return __swift_storeEnumTagSinglePayload(a1, 0, 1, v1);
}

void OUTLINED_FUNCTION_32(uint64_t a1)
{
  uint64_t *v1;

  sub_226EEE5A0(a1, v1);
}

uint64_t OUTLINED_FUNCTION_33()
{
  return swift_bridgeObjectRetain();
}

uint64_t OUTLINED_FUNCTION_35()
{
  uint64_t v0;

  return sub_226EEDD60(v0);
}

uint64_t OUTLINED_FUNCTION_36@<X0>(uint64_t (*a1)(uint64_t, uint64_t)@<X8>)
{
  uint64_t v1;
  uint64_t v2;

  return a1(v1, v2);
}

uint64_t OUTLINED_FUNCTION_37(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_storeEnumTagSinglePayload(a1, 1, 1, a4);
}

uint64_t OUTLINED_FUNCTION_38@<X0>(uint64_t (*a1)(void)@<X8>)
{
  uint64_t v1;

  *(_QWORD *)(v1 - 296) = a1;
  return a1();
}

uint64_t OUTLINED_FUNCTION_39()
{
  return swift_release();
}

uint64_t OUTLINED_FUNCTION_40()
{
  uint64_t v0;

  return v0;
}

uint64_t OUTLINED_FUNCTION_41()
{
  return _s10ParametersVMa();
}

void OUTLINED_FUNCTION_42(uint64_t a1, unint64_t *a2)
{
  sub_226EEEB1C(0, a2);
}

void OUTLINED_FUNCTION_44(uint64_t a1, uint64_t *a2)
{
  uint64_t v2;

  sub_226EEE5A0(*(_QWORD *)(v2 - 304), a2);
}

uint64_t OUTLINED_FUNCTION_46()
{
  return swift_bridgeObjectRetain();
}

uint64_t OUTLINED_FUNCTION_47()
{
  return swift_bridgeObjectRelease();
}

uint64_t sub_226EEEEA0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD v13[3];
  uint64_t v14;

  v1 = v0;
  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_253F43300);
  MEMORY[0x24BDAC7A8](v2);
  v4 = (char *)v13 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_253F432E8);
  MEMORY[0x24BDAC7A8](v5);
  v7 = (_QWORD *)((char *)v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0));
  sub_226EF1710(v1, (uint64_t)v7, &qword_253F432E8);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v8 = *v7;
    v9 = v7[1];
    v10 = v7[2];
    v13[0] = v8;
    v13[1] = v9;
    v13[2] = v10;
    v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_253F42DD0);
    MEMORY[0x2276A5DA4](&v14, v11);
    swift_release();
    swift_release();
    swift_release();
  }
  else
  {
    sub_226EF173C((uint64_t)v7, (uint64_t)v4, &qword_253F43300);
    sub_226F01620();
    sub_226EEE5A0((uint64_t)v4, &qword_253F43300);
  }
  return v14;
}

void ArtworkImage.init(artwork:width:height:idealAspectRatio:contentMode:backgroundColor:rawCropStyle:rawImageFormat:reusePolicy:externalLoader:)(uint64_t a1@<X0>, uint64_t a2@<X1>, char a3@<W2>, uint64_t a4@<X3>, char a5@<W4>, uint64_t a6@<X5>, int a7@<W6>, int a8@<W7>, _QWORD *a9@<X8>, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, char *a15, uint64_t a16, uint64_t a17, uint64_t a18)
{
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  char v28;
  int *v29;
  char *v30;
  uint64_t v31;
  char *v32;
  char *v33;
  char *v34;
  _QWORD *v35;
  uint64_t v36;
  _QWORD *v37;
  uint64_t v38;
  void *GenericRGB;
  void *v40;
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
  int v54;
  int v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;

  v54 = a7;
  v55 = a8;
  v56 = a17;
  v48 = a16;
  v49 = a18;
  v52 = a13;
  v53 = a6;
  v60 = a10;
  v50 = a12;
  v51 = a14;
  v59 = __swift_instantiateConcreteTypeFromMangledName(&qword_253F432E8);
  OUTLINED_FUNCTION_3_0();
  MEMORY[0x24BDAC7A8](v24);
  OUTLINED_FUNCTION_43();
  v46 = v25;
  MEMORY[0x24BDAC7A8](v26);
  v47 = (uint64_t)&v45 - v27;
  v28 = *a15;
  v29 = (int *)type metadata accessor for ArtworkImage(0);
  v30 = (char *)a9 + v29[5];
  v31 = OUTLINED_FUNCTION_23();
  v57 = *(_QWORD *)(v31 - 8);
  v58 = v31;
  (*(void (**)(char *, uint64_t))(v57 + 16))(v30, a1);
  v32 = (char *)a9 + v29[6];
  *(_QWORD *)v32 = a2;
  v32[8] = a3 & 1;
  v33 = (char *)a9 + v29[7];
  *(_QWORD *)v33 = a4;
  v33[8] = a5 & 1;
  v34 = (char *)a9 + v29[8];
  *(_QWORD *)v34 = v53;
  v34[8] = v54 & 1;
  *((_BYTE *)a9 + v29[9]) = v55;
  v35 = (_QWORD *)((char *)a9 + v29[10]);
  v36 = v50;
  *v35 = a11;
  v35[1] = v36;
  v37 = (_QWORD *)((char *)a9 + v29[11]);
  v38 = v51;
  *v37 = v52;
  v37[1] = v38;
  *((_BYTE *)a9 + v29[12]) = v28;
  GenericRGB = (void *)sub_226F016D4();
  if (!GenericRGB)
    GenericRGB = CGColorCreateGenericRGB(0.0, 0.0, 0.0, 0.0);
  v40 = GenericRGB;
  v41 = v56;
  if (v60)
    v42 = v60;
  else
    v42 = MEMORY[0x2276A5D38](GenericRGB);
  *(_QWORD *)((char *)a9 + v29[13]) = v42;
  if (v41)
  {

    OUTLINED_FUNCTION_16_1();
    *a9 = v48;
    a9[1] = v41;
    a9[2] = v49;
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    type metadata accessor for ArtworkLoader();
    swift_allocObject();
    swift_retain();
    ArtworkLoader.init(shouldEnforceUsageOnMainThread:)(1);
    v43 = v46;
    sub_226F01614();
    swift_storeEnumTagMultiPayload();
    v44 = v47;
    sub_226EF173C(v43, v47, &qword_253F432E8);

    swift_release();
    OUTLINED_FUNCTION_16_1();
    sub_226EF173C(v44, (uint64_t)a9, &qword_253F432E8);
    OUTLINED_FUNCTION_4_1();
  }
}

uint64_t type metadata accessor for ArtworkImage(uint64_t a1)
{
  return sub_226EF0634(a1, qword_253F42B00);
}

void ArtworkImage.init(_:width:height:)()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char v4;
  uint64_t v5;
  _QWORD *v6;
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

  OUTLINED_FUNCTION_23();
  OUTLINED_FUNCTION_13_1();
  MEMORY[0x24BDAC7A8](v0);
  OUTLINED_FUNCTION_0_3(v1, v7);
  v2 = OUTLINED_FUNCTION_6_1();
  OUTLINED_FUNCTION_5_1(v2, v3, v4, v5, 0, v6, v8, v9, v10, v11, v12, v13, v14, v15, v16);
  OUTLINED_FUNCTION_8_1();
  OUTLINED_FUNCTION_7_1();
}

void ArtworkImage.init(_:width:)()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char v4;
  _QWORD *v5;
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

  OUTLINED_FUNCTION_23();
  OUTLINED_FUNCTION_13_1();
  MEMORY[0x24BDAC7A8](v0);
  OUTLINED_FUNCTION_0_3(v1, v6);
  v2 = OUTLINED_FUNCTION_6_1();
  OUTLINED_FUNCTION_5_1(v2, v3, v4, 0, 1, v5, v7, v8, v9, v10, v11, v12, v13, v14, v15);
  OUTLINED_FUNCTION_8_1();
  OUTLINED_FUNCTION_7_1();
}

void ArtworkImage.init(_:height:)(_QWORD *a1@<X8>, uint64_t a2@<D0>)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char v8;

  OUTLINED_FUNCTION_23();
  OUTLINED_FUNCTION_13_1();
  MEMORY[0x24BDAC7A8](v5);
  OUTLINED_FUNCTION_0_3(v6, v7);
  v8 = 0;
  OUTLINED_FUNCTION_5_1(v2, 0, 1, a2, 0, a1, 0, 0, 0, 0, 0, &v8, 0, 0, 0);
  OUTLINED_FUNCTION_8_1();
  OUTLINED_FUNCTION_7_1();
}

void static ArtworkImage.automaticallySized(with:)(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char v9;

  OUTLINED_FUNCTION_23();
  OUTLINED_FUNCTION_34_0();
  MEMORY[0x24BDAC7A8](v4);
  OUTLINED_FUNCTION_0_1();
  v7 = v6 - v5;
  (*(void (**)(uint64_t, uint64_t))(v8 + 16))(v6 - v5, a1);
  v9 = 0;
  OUTLINED_FUNCTION_5_1(v7, 0, 1, 0, 1, a2, 0, 0, 0, 0, 0, &v9, 0, 0, 0);
  OUTLINED_FUNCTION_2_0();
}

void ArtworkImage.init(base:idealAspectRatio:contentMode:backgroundColor:rawCropStyle:rawImageFormat:reusePolicy:externalLoader:)(uint64_t a1@<X0>, uint64_t a2@<X1>, char a3@<W2>, int a4@<W3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, _QWORD *a9@<X8>, uint64_t a10, unsigned __int8 *a11, uint64_t a12, uint64_t a13, uint64_t a14)
{
  int *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  _BYTE *v23;
  uint64_t v24;
  uint64_t v25;
  _BYTE *v26;
  uint64_t v27;
  uint64_t v28;
  _BYTE *v29;
  uint64_t v30;
  uint64_t v31;
  _BYTE *v32;
  uint64_t v33;
  _BYTE *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  void (*v40)(void);
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  int v46;
  uint64_t v47;
  uint64_t v48;
  _BYTE *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t *v53;
  uint64_t v54;
  uint64_t *v55;
  char v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  _BYTE v60[12];
  int v61;
  uint64_t v62;
  int v63;
  uint64_t v64;
  uint64_t v65;
  int v66;
  int v67;
  _QWORD *v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  int v74;
  char v75;

  v69 = a8;
  v70 = a6;
  v72 = a5;
  v73 = a7;
  v74 = a4;
  v71 = a2;
  v68 = a9;
  v16 = (int *)type metadata accessor for ArtworkImage(0);
  OUTLINED_FUNCTION_3_0();
  MEMORY[0x24BDAC7A8](v17);
  OUTLINED_FUNCTION_43();
  v19 = v18;
  v21 = MEMORY[0x24BDAC7A8](v20);
  v23 = &v60[-v22];
  v24 = MEMORY[0x24BDAC7A8](v21);
  v26 = &v60[-v25];
  v27 = MEMORY[0x24BDAC7A8](v24);
  v29 = &v60[-v28];
  v30 = MEMORY[0x24BDAC7A8](v27);
  v32 = &v60[-v31];
  MEMORY[0x24BDAC7A8](v30);
  v34 = &v60[-v33];
  OUTLINED_FUNCTION_23();
  OUTLINED_FUNCTION_34_0();
  MEMORY[0x24BDAC7A8](v35);
  OUTLINED_FUNCTION_0_1();
  v38 = v37 - v36;
  v63 = *a11;
  v40 = *(void (**)(void))(v39 + 16);
  v62 = v38;
  v40();
  v41 = v16[7];
  v42 = a1 + v16[6];
  v43 = *(_QWORD *)v42;
  v66 = *(unsigned __int8 *)(v42 + 8);
  v44 = a1 + v41;
  v45 = *(_QWORD *)(a1 + v41);
  v64 = v43;
  v65 = v45;
  v46 = *(unsigned __int8 *)(v44 + 8);
  v47 = OUTLINED_FUNCTION_22_1();
  sub_226EF0690(v47, v48, type metadata accessor for ArtworkImage);
  v67 = v46;
  if ((a3 & 1) != 0)
  {
    v49 = &v34[v16[8]];
    v71 = *(_QWORD *)v49;
    v61 = v49[8];
  }
  else
  {
    v61 = 0;
  }
  v50 = v72;
  OUTLINED_FUNCTION_28_0((uint64_t)v34);
  OUTLINED_FUNCTION_17_1(a1, (uint64_t)v32);
  if (v74 == 2)
    v74 = v32[v16[9]];
  OUTLINED_FUNCTION_28_0((uint64_t)v32);
  OUTLINED_FUNCTION_17_1(a1, (uint64_t)v29);
  v51 = v50;
  if (!v50)
  {
    v51 = *(_QWORD *)&v29[v16[13]];
    swift_retain();
  }
  v52 = a10;
  swift_retain();
  OUTLINED_FUNCTION_14_1((uint64_t)v29);
  OUTLINED_FUNCTION_29(a1, (uint64_t)v26);
  if (!v73)
  {
    v53 = (uint64_t *)&v26[v16[10]];
    v54 = v53[1];
    v70 = *v53;
    v73 = v54;
    swift_bridgeObjectRetain();
  }
  OUTLINED_FUNCTION_14_1((uint64_t)v26);
  OUTLINED_FUNCTION_29(a1, (uint64_t)v23);
  if (!a10)
  {
    v55 = (uint64_t *)&v23[v16[11]];
    v52 = v55[1];
    v69 = *v55;
    swift_bridgeObjectRetain();
  }
  OUTLINED_FUNCTION_14_1((uint64_t)v23);
  OUTLINED_FUNCTION_29(a1, v19);
  if (v63 == 2)
    v56 = *(_BYTE *)(v19 + v16[12]);
  else
    v56 = v63 & 1;
  v57 = v71;
  v58 = v19;
  v59 = v62;
  OUTLINED_FUNCTION_14_1(v58);
  v75 = v56;
  ArtworkImage.init(artwork:width:height:idealAspectRatio:contentMode:backgroundColor:rawCropStyle:rawImageFormat:reusePolicy:externalLoader:)(v59, v64, v66, v65, v67, v57, v61, v74, v68, v51, v70, v73, v69, v52, &v75, a12, a13, a14);
  swift_release();
  OUTLINED_FUNCTION_14_1(a1);
  OUTLINED_FUNCTION_4_1();
}

uint64_t ArtworkImage.artwork.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;

  v3 = v1 + *(int *)(OUTLINED_FUNCTION_1_2() + 20);
  v4 = OUTLINED_FUNCTION_23();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a1, v3, v4);
}

uint64_t ArtworkImage.width.getter()
{
  uint64_t v0;

  v0 = OUTLINED_FUNCTION_1_2();
  return OUTLINED_FUNCTION_19_1(*(int *)(v0 + 24));
}

uint64_t ArtworkImage.height.getter()
{
  uint64_t v0;

  v0 = OUTLINED_FUNCTION_1_2();
  return OUTLINED_FUNCTION_19_1(*(int *)(v0 + 28));
}

uint64_t ArtworkImage.idealAspectRatio.getter()
{
  uint64_t v0;

  v0 = OUTLINED_FUNCTION_1_2();
  return OUTLINED_FUNCTION_19_1(*(int *)(v0 + 32));
}

uint64_t ArtworkImage.contentMode.getter()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + *(int *)(OUTLINED_FUNCTION_1_2() + 36));
}

uint64_t ArtworkImage.rawCropStyle.getter()
{
  uint64_t v0;

  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_18_1();
  return v0;
}

uint64_t ArtworkImage.rawImageFormat.getter()
{
  uint64_t v0;

  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_18_1();
  return v0;
}

void ArtworkImage.reusePolicy.getter(_BYTE *a1@<X8>)
{
  uint64_t v1;

  *a1 = *(_BYTE *)(v1 + *(int *)(OUTLINED_FUNCTION_1_2() + 48));
  OUTLINED_FUNCTION_28();
}

uint64_t ArtworkImage.backgroundColor.getter()
{
  OUTLINED_FUNCTION_1_2();
  return swift_retain();
}

uint64_t ArtworkImage.containerSize.getter()
{
  uint64_t v0;
  int *v1;
  uint64_t v2;
  uint64_t v3;
  _BYTE v5[96];
  _BYTE v6[80];
  uint64_t v7;

  v1 = (int *)OUTLINED_FUNCTION_1_2();
  v2 = sub_226F016B0();
  v3 = sub_226F016C8();
  sub_226EFE780(v2, v3, *(double *)(v0 + v1[6]), *(_BYTE *)(v0 + v1[6] + 8), *(double *)(v0 + v1[7]), *(_BYTE *)(v0 + v1[7] + 8), *(double *)(v0 + v1[8]), *(_BYTE *)(v0 + v1[8] + 8), (uint64_t)v5, *(_BYTE *)(v0 + v1[9]));
  sub_226EF173C((uint64_t)v5, (uint64_t)v6, &qword_253F42CE0);
  if ((unint64_t)v6[57] << 8 == 768)
    return 0;
  else
    return v7;
}

void ArtworkImage.body.getter(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  int *v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;
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
  unint64_t v20;
  uint64_t v21;
  _QWORD *v22;
  void (*v23)(uint64_t, uint64_t);
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
  _QWORD *v35;
  uint64_t v36;
  uint64_t v37;
  _QWORD *v38;
  _QWORD *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  char v44;
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
  _QWORD *v55;
  uint64_t v56;
  uint64_t v57;
  _BYTE v58[96];
  _BYTE v59[96];
  _BYTE v60[104];

  v2 = v1;
  v56 = a1;
  v3 = (int *)OUTLINED_FUNCTION_1_2();
  v50 = *((_QWORD *)v3 - 1);
  v4 = *(_QWORD *)(v50 + 64);
  MEMORY[0x24BDAC7A8](v3);
  v54 = __swift_instantiateConcreteTypeFromMangledName(&qword_253F42DB0);
  OUTLINED_FUNCTION_3_0();
  MEMORY[0x24BDAC7A8](v5);
  OUTLINED_FUNCTION_11_0();
  v55 = v6;
  v7 = (int *)_s9BaseImageV18ArtworkLoaderImageVMa(0);
  OUTLINED_FUNCTION_3_0();
  MEMORY[0x24BDAC7A8](v8);
  OUTLINED_FUNCTION_0_1();
  v11 = v10 - v9;
  v51 = OUTLINED_FUNCTION_23();
  v53 = *(_QWORD *)(v51 - 8);
  MEMORY[0x24BDAC7A8](v51);
  OUTLINED_FUNCTION_11_0();
  v52 = v12;
  v57 = _s9BaseImageVMa(0);
  OUTLINED_FUNCTION_3_0();
  MEMORY[0x24BDAC7A8](v13);
  OUTLINED_FUNCTION_0_1();
  v16 = v15 - v14;
  v17 = v1 + v3[5];
  v18 = sub_226F016B0();
  v19 = sub_226F016C8();
  sub_226EFE780(v18, v19, *(double *)(v2 + v3[6]), *(_BYTE *)(v2 + v3[6] + 8), *(double *)(v2 + v3[7]), *(_BYTE *)(v2 + v3[7] + 8), *(double *)(v2 + v3[8]), *(_BYTE *)(v2 + v3[8] + 8), (uint64_t)v58, *(_BYTE *)(v2 + v3[9]));
  sub_226EF173C((uint64_t)v58, (uint64_t)v59, &qword_253F42CE0);
  if ((unint64_t)v59[57] << 8 == 768)
  {
    OUTLINED_FUNCTION_17_1(v2, (uint64_t)&v45 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0));
    v20 = (*(unsigned __int8 *)(v50 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v50 + 80);
    v21 = swift_allocObject();
    sub_226EF0664((uint64_t)&v45 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0), v21 + v20, type metadata accessor for ArtworkImage);
    v22 = v55;
    *v55 = sub_226EF0558;
    v22[1] = v21;
    swift_storeEnumTagMultiPayload();
    __swift_instantiateConcreteTypeFromMangledName(&qword_253F42D48);
    sub_226EEEBA4(&qword_253F42CC0, _s9BaseImageVMa, (uint64_t)&unk_226F02B74);
    sub_226EF05A0();
    sub_226F01434();
  }
  else
  {
    OUTLINED_FUNCTION_33_0(v60, v59);
    v23 = *(void (**)(uint64_t, uint64_t))(v53 + 16);
    v24 = v16;
    v25 = v51;
    v23(v52, v17);
    v26 = sub_226EEEEA0();
    v27 = v3[12];
    v28 = *(_QWORD *)(v2 + v3[13]);
    v29 = v3[11];
    v30 = (uint64_t *)(v2 + v3[10]);
    v31 = *v30;
    v32 = v30[1];
    v33 = *(_QWORD *)(v2 + v29 + 8);
    v47 = *(_QWORD *)(v2 + v29);
    v48 = v26;
    v46 = v33;
    LODWORD(v50) = *(unsigned __int8 *)(v2 + v27);
    v34 = *(int *)(v57 + 28);
    v35 = (_QWORD *)v24;
    v49 = v24;
    v36 = v24 + v34;
    *(_QWORD *)v36 = swift_getKeyPath();
    *(_BYTE *)(v36 + 8) = 0;
    OUTLINED_FUNCTION_33_0(v35, v60);
    v35[12] = v28;
    v37 = v52;
    ((void (*)(uint64_t, uint64_t, uint64_t))v23)(v11, v52, v25);
    *(_QWORD *)(v11 + v7[5]) = v48;
    OUTLINED_FUNCTION_33_0((void *)(v11 + v7[6]), v60);
    v38 = (_QWORD *)(v11 + v7[7]);
    *v38 = v31;
    v38[1] = v32;
    v39 = (_QWORD *)(v11 + v7[8]);
    v40 = v46;
    *v39 = v47;
    v39[1] = v40;
    *(_BYTE *)(v11 + v7[9]) = v50;
    v41 = v11 + v7[10];
    *(_QWORD *)v41 = swift_getKeyPath();
    *(_BYTE *)(v41 + 8) = 0;
    v42 = v11 + v7[11];
    *(_QWORD *)v42 = swift_getKeyPath();
    *(_BYTE *)(v42 + 40) = 0;
    v43 = v11 + v7[12];
    type metadata accessor for ArtworkLoadingObserver(0);
    sub_226EEEBA4((unint64_t *)&qword_253F42D00, type metadata accessor for ArtworkLoadingObserver, (uint64_t)&protocol conformance descriptor for ArtworkLoadingObserver);
    swift_retain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    *(_QWORD *)v43 = sub_226F01308();
    *(_BYTE *)(v43 + 8) = v44 & 1;
    (*(void (**)(uint64_t, uint64_t))(v53 + 8))(v37, v25);
    sub_226EF0664(v11, v49 + *(int *)(v57 + 24), _s9BaseImageV18ArtworkLoaderImageVMa);
    OUTLINED_FUNCTION_17_1(v49, (uint64_t)v55);
    swift_storeEnumTagMultiPayload();
    __swift_instantiateConcreteTypeFromMangledName(&qword_253F42D48);
    sub_226EEEBA4(&qword_253F42CC0, _s9BaseImageVMa, (uint64_t)&unk_226F02B74);
    sub_226EF05A0();
    sub_226F01434();
    OUTLINED_FUNCTION_28_0(v49);
  }
  OUTLINED_FUNCTION_4_1();
}

void sub_226EEFE54(uint64_t a1@<X0>, uint64_t a2@<X1>, _QWORD *a3@<X8>)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  int *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  double v20;
  char v21;
  double v22;
  double v23;
  double v24;
  double v25;
  char v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  char *v39;
  _QWORD *v40;
  char v41;
  _QWORD v42[3];
  char v43;
  uint64_t v44;
  char v45;
  double v46;
  char v47;
  char v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;

  v40 = a3;
  v5 = sub_226F016F8();
  v37 = *(_QWORD *)(v5 - 8);
  v38 = v5;
  MEMORY[0x24BDAC7A8](v5);
  v39 = (char *)&v37 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_226F01350();
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7);
  v10 = (char *)&v37 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = (int *)type metadata accessor for ArtworkImage(0);
  v12 = a2 + v11[5];
  v13 = sub_226F016B0();
  v14 = sub_226F016C8();
  sub_226F01344();
  v16 = v15;
  v18 = v17;
  v19 = a2 + v11[8];
  v20 = *(double *)v19;
  v21 = *(_BYTE *)(v19 + 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v8 + 16))(v10, a1, v7);
  if ((v21 & 1) != 0)
  {
    sub_226F01344();
    v23 = v22;
    sub_226F01344();
    v25 = v24;
    (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
    v20 = v23 / v25;
  }
  else
  {
    (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  }
  v26 = *(_BYTE *)(a2 + v11[9]);
  v42[0] = v13;
  v42[1] = v14;
  v42[2] = v16;
  v43 = 0;
  v44 = v18;
  v45 = 0;
  v46 = v20;
  v47 = 0;
  v48 = v26;
  v49 = v16;
  v50 = v18;
  v51 = v16;
  v52 = v18;
  v27 = (uint64_t)v39;
  (*(void (**)(char *, uint64_t, uint64_t))(v37 + 16))(v39, v12, v38);
  v28 = sub_226EEEEA0();
  v29 = v11[12];
  v30 = *(_QWORD *)(a2 + v11[13]);
  v31 = v11[11];
  v32 = (uint64_t *)(a2 + v11[10]);
  v33 = *v32;
  v34 = v32[1];
  v35 = *(_QWORD *)(a2 + v31);
  v36 = *(_QWORD *)(a2 + v31 + 8);
  v41 = *(_BYTE *)(a2 + v29);
  swift_bridgeObjectRetain();
  swift_retain();
  swift_bridgeObjectRetain();
  sub_226EF7B88(v27, v28, v42, v30, v33, v34, v35, v36, v40, &v41);
}

double sub_226EF0084()
{
  double result;

  qword_2558AC8D8 = 0;
  result = 0.0;
  xmmword_2558AC8B8 = 0u;
  unk_2558AC8C8 = 0u;
  return result;
}

__int128 *sub_226EF009C()
{
  if (qword_253F42CD8 != -1)
    swift_once();
  return &xmmword_2558AC8B8;
}

void sub_226EF00DC(uint64_t a1@<X8>)
{
  __int128 *v2;

  v2 = sub_226EF009C();
  sub_226EF1710((uint64_t)v2, a1, &qword_253F42D18);
}

uint64_t EnvironmentValues.artworkCatalogConfigurationHandler.getter()
{
  sub_226EF06E4();
  return sub_226F01410();
}

void sub_226EF0144()
{
  EnvironmentValues.artworkCatalogConfigurationHandler.getter();
  OUTLINED_FUNCTION_28();
}

void sub_226EF0160(uint64_t a1)
{
  _BYTE v1[40];

  sub_226EF1710(a1, (uint64_t)v1, &qword_253F42D18);
  EnvironmentValues.artworkCatalogConfigurationHandler.setter((uint64_t)v1);
}

void EnvironmentValues.artworkCatalogConfigurationHandler.setter(uint64_t a1)
{
  uint64_t v1;
  uint64_t *v2;
  _BYTE v3[40];

  sub_226EF1710(a1, (uint64_t)v3, &qword_253F42D18);
  sub_226EF06E4();
  sub_226F0141C();
  v1 = OUTLINED_FUNCTION_22_1();
  sub_226EEE5A0(v1, v2);
}

void (*EnvironmentValues.artworkCatalogConfigurationHandler.modify(_QWORD *a1))(void **a1, char a2)
{
  uint64_t v1;
  _QWORD *v3;

  v3 = malloc(0x88uLL);
  *a1 = v3;
  v3[15] = v1;
  v3[16] = sub_226EF06E4();
  sub_226F01410();
  return sub_226EF0264;
}

void sub_226EF0264(void **a1, char a2)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v2 = *a1;
  v3 = (uint64_t)*a1 + 40;
  if ((a2 & 1) != 0)
  {
    v4 = OUTLINED_FUNCTION_22_1();
    sub_226EF1710(v4, v5, &qword_253F42D18);
    sub_226EF1710(v3, (uint64_t)v2 + 80, &qword_253F42D18);
    OUTLINED_FUNCTION_23_1();
    sub_226EEE5A0(v3, &qword_253F42D18);
  }
  else
  {
    v6 = OUTLINED_FUNCTION_22_1();
    sub_226EF1710(v6, v7, &qword_253F42D18);
    OUTLINED_FUNCTION_23_1();
  }
  sub_226EEE5A0((uint64_t)v2, &qword_253F42D18);
  free(v2);
}

uint64_t _ArtworkCatalogConfigurationParameters.rawArtworkCatalog.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_226EEE9F8(v1, a1);
}

void ArtworkLoadingObserver.__allocating_init(handler:)(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = swift_allocObject();
  sub_226F012B4();
  *(_QWORD *)(v4 + 16) = a1;
  *(_QWORD *)(v4 + 24) = a2;
  OUTLINED_FUNCTION_2_0();
}

void ArtworkLoadingObserver.init(handler:)(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  sub_226F012B4();
  *(_QWORD *)(v2 + 16) = a1;
  *(_QWORD *)(v2 + 24) = a2;
  OUTLINED_FUNCTION_2_0();
}

void ArtworkLoadingObserver.deinit()
{
  uint64_t v0;

  swift_release();
  v0 = OUTLINED_FUNCTION_31_0();
  OUTLINED_FUNCTION_17_0(v0);
  OUTLINED_FUNCTION_28();
}

uint64_t ArtworkLoadingObserver.__deallocating_deinit()
{
  uint64_t v0;

  swift_release();
  v0 = OUTLINED_FUNCTION_31_0();
  OUTLINED_FUNCTION_17_0(v0);
  return swift_deallocClassInstance();
}

void sub_226EF0424()
{
  _QWORD *v0;
  uint64_t v1;

  OUTLINED_FUNCTION_30_0();
  *v0 = v1;
  OUTLINED_FUNCTION_28();
}

uint64_t sub_226EF0440@<X0>(_QWORD *a1@<X8>)
{
  uint64_t v1;

  *a1 = v1;
  return swift_retain();
}

uint64_t sub_226EF044C()
{
  uint64_t v0;
  uint64_t v1;
  unint64_t v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;

  v1 = OUTLINED_FUNCTION_1_2();
  v2 = (*(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80);
  __swift_instantiateConcreteTypeFromMangledName(&qword_253F432E8);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    swift_release();
    swift_release();
  }
  else
  {
    v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_253F432F8);
    (*(void (**)(unint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(v0 + v2, v3);
    __swift_instantiateConcreteTypeFromMangledName(&qword_253F43300);
  }
  swift_release();
  v4 = v0 + v2 + *(int *)(v1 + 20);
  v5 = OUTLINED_FUNCTION_23();
  (*(void (**)(unint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(v4, v5);
  OUTLINED_FUNCTION_32_0();
  OUTLINED_FUNCTION_32_0();
  swift_release();
  return swift_deallocObject();
}

void sub_226EF0558(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;

  v5 = *(unsigned __int8 *)(*(_QWORD *)(OUTLINED_FUNCTION_1_2() - 8) + 80);
  sub_226EEFE54(a1, v2 + ((v5 + 16) & ~v5), a2);
}

unint64_t sub_226EF05A0()
{
  unint64_t result;
  uint64_t v1;

  result = qword_253F42D40;
  if (!qword_253F42D40)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_253F42D48);
    result = MEMORY[0x2276A650C](MEMORY[0x24BDEC6F8], v1);
    atomic_store(result, (unint64_t *)&qword_253F42D40);
  }
  return result;
}

void sub_226EF05E4()
{
  _QWORD *v0;
  uint64_t v1;

  OUTLINED_FUNCTION_30_0();
  *v0 = v1;
  OUTLINED_FUNCTION_28();
}

void sub_226EF0600()
{
  EnvironmentValues.artworkCatalogConfigurationHandler.getter();
  OUTLINED_FUNCTION_28();
}

uint64_t type metadata accessor for ArtworkLoadingObserver(uint64_t a1)
{
  return sub_226EF0634(a1, (uint64_t *)&unk_253F42D08);
}

uint64_t sub_226EF0634(uint64_t a1, uint64_t *a2)
{
  uint64_t result;

  result = *a2;
  if (!*a2)
    return swift_getSingletonMetadata();
  return result;
}

void sub_226EF0664(uint64_t a1, uint64_t a2, uint64_t (*a3)(_QWORD))
{
  uint64_t v3;

  v3 = OUTLINED_FUNCTION_21_1(a1, a2, a3);
  OUTLINED_FUNCTION_11_1(*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 32));
  OUTLINED_FUNCTION_28();
}

void sub_226EF0690(uint64_t a1, uint64_t a2, uint64_t (*a3)(_QWORD))
{
  uint64_t v3;

  v3 = OUTLINED_FUNCTION_21_1(a1, a2, a3);
  OUTLINED_FUNCTION_11_1(*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 16));
  OUTLINED_FUNCTION_28();
}

void sub_226EF06BC(uint64_t a1, uint64_t (*a2)(_QWORD))
{
  uint64_t v2;

  v2 = a2(0);
  OUTLINED_FUNCTION_17_0(v2);
  OUTLINED_FUNCTION_28();
}

unint64_t sub_226EF06E4()
{
  unint64_t result;

  result = qword_253F42DF0;
  if (!qword_253F42DF0)
  {
    result = MEMORY[0x2276A650C](&unk_226F02820, &type metadata for ArtworkImage.CatalogConfigurationHandlerKey);
    atomic_store(result, (unint64_t *)&qword_253F42DF0);
  }
  return result;
}

uint64_t sub_226EF0720()
{
  return swift_getOpaqueTypeConformance2();
}

_QWORD *initializeBufferWithCopyOfBuffer for ArtworkImage(_QWORD *a1, _QWORD *a2, int *a3)
{
  _QWORD *v4;
  int v5;
  uint64_t v7;
  uint64_t v8;
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
  char *v19;
  char *v20;
  uint64_t v21;
  uint64_t v22;
  char *v23;
  char *v24;
  uint64_t v25;
  uint64_t v26;
  _QWORD *v27;
  _QWORD *v28;
  uint64_t v29;
  _QWORD *v30;
  _QWORD *v31;
  uint64_t v32;
  uint64_t v33;

  v4 = a1;
  v5 = *(_DWORD *)(*((_QWORD *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v8 = *a2;
    *a1 = *a2;
    v4 = (_QWORD *)(v8 + ((v5 + 16) & ~(unint64_t)v5));
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_253F432E8);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v7 = a2[1];
      *v4 = *a2;
      v4[1] = v7;
      v4[2] = a2[2];
      swift_retain();
      swift_retain();
    }
    else
    {
      v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_253F432F8);
      (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v9 - 8) + 16))(v4, a2, v9);
      v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_253F43300);
      *(_QWORD *)((char *)v4 + *(int *)(v10 + 28)) = *(_QWORD *)((char *)a2 + *(int *)(v10 + 28));
    }
    swift_retain();
    swift_storeEnumTagMultiPayload();
    v11 = a3[5];
    v12 = (char *)v4 + v11;
    v13 = (char *)a2 + v11;
    v14 = sub_226F016F8();
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v14 - 8) + 16))(v12, v13, v14);
    v15 = a3[6];
    v16 = a3[7];
    v17 = (char *)v4 + v15;
    v18 = (char *)a2 + v15;
    *(_QWORD *)v17 = *(_QWORD *)v18;
    v17[8] = v18[8];
    v19 = (char *)v4 + v16;
    v20 = (char *)a2 + v16;
    *(_QWORD *)v19 = *(_QWORD *)v20;
    v19[8] = v20[8];
    v21 = a3[8];
    v22 = a3[9];
    v23 = (char *)v4 + v21;
    v24 = (char *)a2 + v21;
    *(_QWORD *)v23 = *(_QWORD *)v24;
    v23[8] = v24[8];
    *((_BYTE *)v4 + v22) = *((_BYTE *)a2 + v22);
    v25 = a3[10];
    v26 = a3[11];
    v27 = (_QWORD *)((char *)v4 + v25);
    v28 = (_QWORD *)((char *)a2 + v25);
    v29 = v28[1];
    *v27 = *v28;
    v27[1] = v29;
    v30 = (_QWORD *)((char *)v4 + v26);
    v31 = (_QWORD *)((char *)a2 + v26);
    v32 = v31[1];
    *v30 = *v31;
    v30[1] = v32;
    v33 = a3[13];
    *((_BYTE *)v4 + a3[12]) = *((_BYTE *)a2 + a3[12]);
    *(_QWORD *)((char *)v4 + v33) = *(_QWORD *)((char *)a2 + v33);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
  swift_retain();
  return v4;
}

uint64_t destroy for ArtworkImage(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  __swift_instantiateConcreteTypeFromMangledName(&qword_253F432E8);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    swift_release();
    swift_release();
  }
  else
  {
    v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_253F432F8);
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(a1, v4);
    __swift_instantiateConcreteTypeFromMangledName(&qword_253F43300);
  }
  swift_release();
  v5 = a1 + *(int *)(a2 + 20);
  v6 = sub_226F016F8();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 8))(v5, v6);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_release();
}

_QWORD *initializeWithCopy for ArtworkImage(_QWORD *a1, _QWORD *a2, int *a3)
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
  char *v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  char *v22;
  uint64_t v23;
  uint64_t v24;
  _QWORD *v25;
  _QWORD *v26;
  uint64_t v27;
  _QWORD *v28;
  _QWORD *v29;
  uint64_t v30;
  uint64_t v31;

  __swift_instantiateConcreteTypeFromMangledName(&qword_253F432E8);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v6 = a2[1];
    *a1 = *a2;
    a1[1] = v6;
    a1[2] = a2[2];
    swift_retain();
    swift_retain();
  }
  else
  {
    v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_253F432F8);
    (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a1, a2, v7);
    v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_253F43300);
    *(_QWORD *)((char *)a1 + *(int *)(v8 + 28)) = *(_QWORD *)((char *)a2 + *(int *)(v8 + 28));
  }
  swift_retain();
  swift_storeEnumTagMultiPayload();
  v9 = a3[5];
  v10 = (char *)a1 + v9;
  v11 = (char *)a2 + v9;
  v12 = sub_226F016F8();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v12 - 8) + 16))(v10, v11, v12);
  v13 = a3[6];
  v14 = a3[7];
  v15 = (char *)a1 + v13;
  v16 = (char *)a2 + v13;
  *(_QWORD *)v15 = *(_QWORD *)v16;
  v15[8] = v16[8];
  v17 = (char *)a1 + v14;
  v18 = (char *)a2 + v14;
  *(_QWORD *)v17 = *(_QWORD *)v18;
  v17[8] = v18[8];
  v19 = a3[8];
  v20 = a3[9];
  v21 = (char *)a1 + v19;
  v22 = (char *)a2 + v19;
  *(_QWORD *)v21 = *(_QWORD *)v22;
  v21[8] = v22[8];
  *((_BYTE *)a1 + v20) = *((_BYTE *)a2 + v20);
  v23 = a3[10];
  v24 = a3[11];
  v25 = (_QWORD *)((char *)a1 + v23);
  v26 = (_QWORD *)((char *)a2 + v23);
  v27 = v26[1];
  *v25 = *v26;
  v25[1] = v27;
  v28 = (_QWORD *)((char *)a1 + v24);
  v29 = (_QWORD *)((char *)a2 + v24);
  v30 = v29[1];
  *v28 = *v29;
  v28[1] = v30;
  v31 = a3[13];
  *((_BYTE *)a1 + a3[12]) = *((_BYTE *)a2 + a3[12]);
  *(_QWORD *)((char *)a1 + v31) = *(_QWORD *)((char *)a2 + v31);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_retain();
  return a1;
}

_QWORD *assignWithCopy for ArtworkImage(_QWORD *a1, _QWORD *a2, int *a3)
{
  uint64_t v6;
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
  char *v20;
  char *v21;
  uint64_t v22;
  _QWORD *v23;
  _QWORD *v24;
  uint64_t v25;
  _QWORD *v26;
  _QWORD *v27;

  if (a1 != a2)
  {
    sub_226EEE5A0((uint64_t)a1, &qword_253F432E8);
    __swift_instantiateConcreteTypeFromMangledName(&qword_253F432E8);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      *a1 = *a2;
      a1[1] = a2[1];
      a1[2] = a2[2];
      swift_retain();
      swift_retain();
    }
    else
    {
      v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_253F432F8);
      (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(a1, a2, v6);
      v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_253F43300);
      *(_QWORD *)((char *)a1 + *(int *)(v7 + 28)) = *(_QWORD *)((char *)a2 + *(int *)(v7 + 28));
    }
    swift_retain();
    swift_storeEnumTagMultiPayload();
  }
  v8 = a3[5];
  v9 = (char *)a1 + v8;
  v10 = (char *)a2 + v8;
  v11 = sub_226F016F8();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v11 - 8) + 24))(v9, v10, v11);
  v12 = a3[6];
  v13 = (char *)a1 + v12;
  v14 = (char *)a2 + v12;
  v15 = *(_QWORD *)v14;
  v13[8] = v14[8];
  *(_QWORD *)v13 = v15;
  v16 = a3[7];
  v17 = (char *)a1 + v16;
  v18 = (char *)a2 + v16;
  LOBYTE(v15) = v18[8];
  *(_QWORD *)v17 = *(_QWORD *)v18;
  v17[8] = v15;
  v19 = a3[8];
  v20 = (char *)a1 + v19;
  v21 = (char *)a2 + v19;
  LOBYTE(v15) = v21[8];
  *(_QWORD *)v20 = *(_QWORD *)v21;
  v20[8] = v15;
  *((_BYTE *)a1 + a3[9]) = *((_BYTE *)a2 + a3[9]);
  v22 = a3[10];
  v23 = (_QWORD *)((char *)a1 + v22);
  v24 = (_QWORD *)((char *)a2 + v22);
  *v23 = *v24;
  v23[1] = v24[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v25 = a3[11];
  v26 = (_QWORD *)((char *)a1 + v25);
  v27 = (_QWORD *)((char *)a2 + v25);
  *v26 = *v27;
  v26[1] = v27[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *((_BYTE *)a1 + a3[12]) = *((_BYTE *)a2 + a3[12]);
  *(_QWORD *)((char *)a1 + a3[13]) = *(_QWORD *)((char *)a2 + a3[13]);
  swift_retain();
  swift_release();
  return a1;
}

char *initializeWithTake for ArtworkImage(char *a1, char *a2, int *a3)
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
  char *v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  char *v22;
  uint64_t v23;
  uint64_t v24;

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_253F432E8);
  if (swift_getEnumCaseMultiPayload())
  {
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v6 - 8) + 64));
  }
  else
  {
    v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_253F432F8);
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v7 - 8) + 32))(a1, a2, v7);
    v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_253F43300);
    *(_QWORD *)&a1[*(int *)(v8 + 28)] = *(_QWORD *)&a2[*(int *)(v8 + 28)];
    swift_storeEnumTagMultiPayload();
  }
  v9 = a3[5];
  v10 = &a1[v9];
  v11 = &a2[v9];
  v12 = sub_226F016F8();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v12 - 8) + 32))(v10, v11, v12);
  v13 = a3[6];
  v14 = a3[7];
  v15 = &a1[v13];
  v16 = &a2[v13];
  *(_QWORD *)v15 = *(_QWORD *)v16;
  v15[8] = v16[8];
  v17 = &a1[v14];
  v18 = &a2[v14];
  *(_QWORD *)v17 = *(_QWORD *)v18;
  v17[8] = v18[8];
  v19 = a3[8];
  v20 = a3[9];
  v21 = &a1[v19];
  v22 = &a2[v19];
  *(_QWORD *)v21 = *(_QWORD *)v22;
  v21[8] = v22[8];
  a1[v20] = a2[v20];
  v23 = a3[11];
  *(_OWORD *)&a1[a3[10]] = *(_OWORD *)&a2[a3[10]];
  *(_OWORD *)&a1[v23] = *(_OWORD *)&a2[v23];
  v24 = a3[13];
  a1[a3[12]] = a2[a3[12]];
  *(_QWORD *)&a1[v24] = *(_QWORD *)&a2[v24];
  return a1;
}

char *assignWithTake for ArtworkImage(char *a1, char *a2, int *a3)
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
  uint64_t v27;
  uint64_t v28;
  char *v29;
  char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;

  if (a1 != a2)
  {
    sub_226EEE5A0((uint64_t)a1, &qword_253F432E8);
    v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_253F432E8);
    if (swift_getEnumCaseMultiPayload())
    {
      memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v6 - 8) + 64));
    }
    else
    {
      v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_253F432F8);
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v7 - 8) + 32))(a1, a2, v7);
      v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_253F43300);
      *(_QWORD *)&a1[*(int *)(v8 + 28)] = *(_QWORD *)&a2[*(int *)(v8 + 28)];
      swift_storeEnumTagMultiPayload();
    }
  }
  v9 = a3[5];
  v10 = &a1[v9];
  v11 = &a2[v9];
  v12 = sub_226F016F8();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v12 - 8) + 40))(v10, v11, v12);
  v13 = a3[6];
  v14 = a3[7];
  v15 = &a1[v13];
  v16 = &a2[v13];
  *(_QWORD *)v15 = *(_QWORD *)v16;
  v15[8] = v16[8];
  v17 = &a1[v14];
  v18 = &a2[v14];
  *(_QWORD *)v17 = *(_QWORD *)v18;
  v17[8] = v18[8];
  v19 = a3[8];
  v20 = a3[9];
  v21 = &a1[v19];
  v22 = &a2[v19];
  *(_QWORD *)v21 = *(_QWORD *)v22;
  v21[8] = v22[8];
  a1[v20] = a2[v20];
  v23 = a3[10];
  v24 = &a1[v23];
  v25 = &a2[v23];
  v27 = *(_QWORD *)v25;
  v26 = *((_QWORD *)v25 + 1);
  *(_QWORD *)v24 = v27;
  *((_QWORD *)v24 + 1) = v26;
  swift_bridgeObjectRelease();
  v28 = a3[11];
  v29 = &a1[v28];
  v30 = &a2[v28];
  v32 = *(_QWORD *)v30;
  v31 = *((_QWORD *)v30 + 1);
  *(_QWORD *)v29 = v32;
  *((_QWORD *)v29 + 1) = v31;
  swift_bridgeObjectRelease();
  v33 = a3[13];
  a1[a3[12]] = a2[a3[12]];
  *(_QWORD *)&a1[v33] = *(_QWORD *)&a2[v33];
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for ArtworkImage()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_226EF10CC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v11;

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_253F432E8);
  if (*(_DWORD *)(*(_QWORD *)(v6 - 8) + 84) == (_DWORD)a2)
  {
    v7 = v6;
    v8 = a1;
    return __swift_getEnumTagSinglePayload(v8, a2, v7);
  }
  v9 = OUTLINED_FUNCTION_23();
  if (*(_DWORD *)(*(_QWORD *)(v9 - 8) + 84) == (_DWORD)a2)
  {
    v7 = v9;
    v8 = a1 + *(int *)(a3 + 20);
    return __swift_getEnumTagSinglePayload(v8, a2, v7);
  }
  v11 = *(_QWORD *)(a1 + *(int *)(a3 + 52));
  if (v11 >= 0xFFFFFFFF)
    LODWORD(v11) = -1;
  return (v11 + 1);
}

uint64_t storeEnumTagSinglePayload for ArtworkImage()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

void sub_226EF1178(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_253F432E8);
  if (*(_DWORD *)(*(_QWORD *)(v8 - 8) + 84) == a3)
  {
    v9 = v8;
    v10 = a1;
LABEL_5:
    __swift_storeEnumTagSinglePayload(v10, a2, a2, v9);
    return;
  }
  v11 = OUTLINED_FUNCTION_23();
  if (*(_DWORD *)(*(_QWORD *)(v11 - 8) + 84) == a3)
  {
    v9 = v11;
    v10 = a1 + *(int *)(a4 + 20);
    goto LABEL_5;
  }
  *(_QWORD *)(a1 + *(int *)(a4 + 52)) = (a2 - 1);
  OUTLINED_FUNCTION_2_0();
}

void sub_226EF120C()
{
  unint64_t v0;
  unint64_t v1;

  sub_226EF12CC(319);
  if (v0 <= 0x3F)
  {
    sub_226F016F8();
    if (v1 <= 0x3F)
      swift_initStructMetadata();
  }
}

void sub_226EF12CC(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;

  if (!qword_253F432F0)
  {
    v2 = type metadata accessor for ArtworkLoader();
    v5 = type metadata accessor for MusicLazyStateOrBinding(a1, v2, v3, v4);
    if (!v6)
      atomic_store(v5, (unint64_t *)&qword_253F432F0);
  }
}

uint64_t dispatch thunk of ArtworkCatalogConfigurationHandler.updateConfiguration(_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 8))();
}

uint64_t initializeBufferWithCopyOfBuffer for _ArtworkCatalogConfigurationParameters(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *a2;
  *a1 = *a2;
  v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t initializeWithCopy for _ArtworkCatalogConfigurationParameters(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 24) = v3;
  (**(void (***)(void))(v3 - 8))();
  return a1;
}

uint64_t *assignWithCopy for _ArtworkCatalogConfigurationParameters(uint64_t *a1, uint64_t *a2)
{
  __swift_assign_boxed_opaque_existential_0(a1, a2);
  return a1;
}

uint64_t *__swift_assign_boxed_opaque_existential_0(uint64_t *result, uint64_t *a2)
{
  uint64_t *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  uint64_t v10;
  _BYTE v11[24];

  if (result != a2)
  {
    v3 = result;
    v4 = result[3];
    v5 = a2[3];
    if (v4 == v5)
    {
      v9 = *(_QWORD *)(v4 - 8);
      if ((*(_BYTE *)(v9 + 82) & 2) != 0)
      {
        v10 = *a2;
        swift_retain();
        result = (uint64_t *)swift_release();
        *v3 = v10;
      }
      else
      {
        return (uint64_t *)(*(uint64_t (**)(uint64_t *, uint64_t *, uint64_t))(v9 + 24))(result, a2, result[3]);
      }
    }
    else
    {
      result[3] = v5;
      v6 = *(_QWORD *)(v4 - 8);
      v7 = *(_QWORD *)(v5 - 8);
      v8 = *(_DWORD *)(v7 + 80);
      if ((*(_BYTE *)(v6 + 82) & 2) != 0)
      {
        if ((v8 & 0x20000) != 0)
        {
          *result = *a2;
          swift_retain();
        }
        else
        {
          (*(void (**)(uint64_t *, uint64_t *, uint64_t))(v7 + 16))(result, a2, v5);
        }
        return (uint64_t *)swift_release();
      }
      else
      {
        (*(void (**)(_BYTE *, uint64_t *, uint64_t))(v6 + 32))(v11, result, v4);
        if ((v8 & 0x20000) != 0)
        {
          *v3 = *a2;
          swift_retain();
        }
        else
        {
          (*(void (**)(uint64_t *, uint64_t *, uint64_t))(v7 + 16))(v3, a2, v5);
        }
        return (uint64_t *)(*(uint64_t (**)(_BYTE *, uint64_t))(v6 + 8))(v11, v4);
      }
    }
  }
  return result;
}

__n128 __swift_memcpy32_8(_OWORD *a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;

  result = *(__n128 *)a2;
  v3 = *(_OWORD *)(a2 + 16);
  *a1 = *(_OWORD *)a2;
  a1[1] = v3;
  return result;
}

_OWORD *assignWithTake for _ArtworkCatalogConfigurationParameters(_OWORD *a1, _OWORD *a2)
{
  __int128 v4;

  __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  return a1;
}

uint64_t getEnumTagSinglePayload for _ArtworkCatalogConfigurationParameters(uint64_t a1, int a2)
{
  unint64_t v2;

  if (a2)
  {
    if (a2 < 0 && *(_BYTE *)(a1 + 32))
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

uint64_t storeEnumTagSinglePayload for _ArtworkCatalogConfigurationParameters(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_QWORD *)(result + 16) = 0;
    *(_QWORD *)(result + 24) = 0;
    *(_QWORD *)result = a2 ^ 0x80000000;
    *(_QWORD *)(result + 8) = 0;
    if (a3 < 0)
      *(_BYTE *)(result + 32) = 1;
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
    *(_BYTE *)(result + 32) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for _ArtworkCatalogConfigurationParameters()
{
  return &type metadata for _ArtworkCatalogConfigurationParameters;
}

uint64_t sub_226EF15E0()
{
  return type metadata accessor for ArtworkLoadingObserver(0);
}

uint64_t sub_226EF15E8()
{
  uint64_t result;
  unint64_t v1;

  result = sub_226F012C0();
  if (v1 <= 0x3F)
  {
    result = swift_updateClassMetadata2();
    if (!result)
      return 0;
  }
  return result;
}

uint64_t method lookup function for ArtworkLoadingObserver()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of ArtworkLoadingObserver.__allocating_init(handler:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 96))();
}

unint64_t sub_226EF167C()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;
  _QWORD v3[2];

  result = qword_253F42DB8;
  if (!qword_253F42DB8)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_253F42DC0);
    sub_226EEEBA4(&qword_253F42CC0, _s9BaseImageVMa, (uint64_t)&unk_226F02B74);
    v3[0] = v2;
    v3[1] = sub_226EF05A0();
    result = MEMORY[0x2276A650C](MEMORY[0x24BDEF3E0], v1, v3);
    atomic_store(result, (unint64_t *)&qword_253F42DB8);
  }
  return result;
}

ValueMetadata *type metadata accessor for ArtworkImage.CatalogConfigurationHandlerKey()
{
  return &type metadata for ArtworkImage.CatalogConfigurationHandlerKey;
}

void sub_226EF1710(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v3;

  v3 = OUTLINED_FUNCTION_20_1(a1, a2, a3);
  OUTLINED_FUNCTION_11_1(*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 16));
  OUTLINED_FUNCTION_28();
}

void sub_226EF173C(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v3;

  v3 = OUTLINED_FUNCTION_20_1(a1, a2, a3);
  OUTLINED_FUNCTION_11_1(*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 32));
  OUTLINED_FUNCTION_28();
}

uint64_t OUTLINED_FUNCTION_0_3@<X0>(uint64_t a1@<X8>, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  return (*(uint64_t (**)(char *, uint64_t, uint64_t))(v4 + 16))((char *)&a2 - ((a1 + 15) & 0xFFFFFFFFFFFFFFF0), v2, v3);
}

uint64_t OUTLINED_FUNCTION_1_2()
{
  return type metadata accessor for ArtworkImage(0);
}

void OUTLINED_FUNCTION_5_1(uint64_t a1@<X0>, uint64_t a2@<X1>, char a3@<W2>, uint64_t a4@<X3>, char a5@<W4>, _QWORD *a6@<X8>, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, char *a12, uint64_t a13, uint64_t a14, uint64_t a15)
{
  ArtworkImage.init(artwork:width:height:idealAspectRatio:contentMode:backgroundColor:rawCropStyle:rawImageFormat:reusePolicy:externalLoader:)(a1, a2, a3, a4, a5, 0, 1, 2, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15);
}

uint64_t OUTLINED_FUNCTION_6_1()
{
  uint64_t v0;
  uint64_t v1;

  *(_BYTE *)(v1 - 65) = 0;
  return v0;
}

uint64_t OUTLINED_FUNCTION_8_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 8))(v0, v1);
}

uint64_t OUTLINED_FUNCTION_11_1@<X0>(uint64_t (*a1)(uint64_t, uint64_t)@<X8>)
{
  uint64_t v1;
  uint64_t v2;

  return a1(v1, v2);
}

void OUTLINED_FUNCTION_14_1(uint64_t a1)
{
  uint64_t (*v1)(_QWORD);

  sub_226EF06BC(a1, v1);
}

uint64_t OUTLINED_FUNCTION_16_1()
{
  uint64_t v0;
  uint64_t v1;

  return (*(uint64_t (**)(uint64_t, _QWORD))(*(_QWORD *)(v1 - 120) + 8))(v0, *(_QWORD *)(v1 - 112));
}

void OUTLINED_FUNCTION_17_1(uint64_t a1, uint64_t a2)
{
  uint64_t (*v2)(_QWORD);

  sub_226EF0690(a1, a2, v2);
}

uint64_t OUTLINED_FUNCTION_18_1()
{
  return swift_bridgeObjectRetain();
}

uint64_t OUTLINED_FUNCTION_19_1@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return *(_QWORD *)(v1 + a1);
}

uint64_t OUTLINED_FUNCTION_20_1(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  return __swift_instantiateConcreteTypeFromMangledName(a3);
}

uint64_t OUTLINED_FUNCTION_21_1(uint64_t a1, uint64_t a2, uint64_t (*a3)(_QWORD))
{
  return a3(0);
}

uint64_t OUTLINED_FUNCTION_22_1()
{
  uint64_t v0;

  return v0;
}

uint64_t OUTLINED_FUNCTION_23_1()
{
  return sub_226F0141C();
}

void OUTLINED_FUNCTION_28_0(uint64_t a1)
{
  uint64_t (*v1)(_QWORD);

  sub_226EF06BC(a1, v1);
}

void OUTLINED_FUNCTION_29(uint64_t a1, uint64_t a2)
{
  uint64_t (*v2)(_QWORD);

  sub_226EF0690(a1, a2, v2);
}

uint64_t OUTLINED_FUNCTION_30_0()
{
  return sub_226F013D4();
}

uint64_t OUTLINED_FUNCTION_31_0()
{
  return sub_226F012C0();
}

uint64_t OUTLINED_FUNCTION_32_0()
{
  return swift_bridgeObjectRelease();
}

void *OUTLINED_FUNCTION_33_0(void *a1, const void *a2)
{
  return memcpy(a1, a2, 0x60uLL);
}

uint64_t sub_226EF1900@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  _BYTE *v2;
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
  char v23;
  uint64_t v24;
  uint64_t v25;
  unint64_t v26;
  unint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t OpaqueTypeConformance2;
  unint64_t v31;
  uint64_t v32;
  char *v33;
  char *v34;
  uint64_t v35;
  uint64_t v36;
  unint64_t v37;
  uint64_t v38;
  char *v39;
  uint64_t v40;
  uint64_t v41;
  char *v42;
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
  char *v54;
  uint64_t v55;
  uint64_t v56;
  char *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  char *v63;
  _OWORD v64[8];
  _OWORD v65[9];
  uint64_t v66;
  ValueMetadata *v67;
  uint64_t v68;
  unint64_t v69;
  _OWORD v70[20];
  __int128 v71;
  _QWORD v72[17];

  v50 = a1;
  v62 = a2;
  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_2558AC8F0);
  v4 = *(_QWORD *)(v3 - 8);
  v52 = v3;
  v53 = v4;
  MEMORY[0x24BDAC7A8](v3);
  v63 = (char *)&v44 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2558AC8F8);
  v7 = *(_QWORD *)(v6 - 8);
  v55 = v6;
  v56 = v7;
  MEMORY[0x24BDAC7A8](v6);
  v51 = (char *)&v44 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_2558AC900);
  v10 = *(_QWORD *)(v9 - 8);
  v58 = v9;
  v59 = v10;
  MEMORY[0x24BDAC7A8](v9);
  v54 = (char *)&v44 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_2558AC908);
  v60 = *(_QWORD *)(v12 - 8);
  v61 = v12;
  MEMORY[0x24BDAC7A8](v12);
  v57 = (char *)&v44 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  memcpy(v70, v2, sizeof(v70));
  v65[0] = *(_OWORD *)v2;
  LOBYTE(v65[1]) = v2[16];
  v14 = *((_QWORD *)&v70[1] + 1);
  v15 = *(_QWORD *)&v70[2];
  v48 = *((_QWORD *)&v70[3] + 1);
  v16 = *(_QWORD *)&v70[3];
  v49 = *((_QWORD *)&v70[2] + 1);
  v17 = *(_QWORD *)&v70[4];
  v46 = *((_QWORD *)&v70[5] + 1);
  v18 = *(_QWORD *)&v70[5];
  v47 = *((_QWORD *)&v70[4] + 1);
  v19 = *(_QWORD *)&v70[6];
  v44 = *((_QWORD *)&v70[7] + 1);
  v20 = *(_QWORD *)&v70[7];
  v45 = *((_QWORD *)&v70[6] + 1);
  v21 = *(_QWORD *)&v70[8];
  sub_226EF4D4C((uint64_t)v70);
  v22 = __swift_instantiateConcreteTypeFromMangledName(&qword_2558AC910);
  MEMORY[0x2276A5DA4](v72, v22);
  v23 = v72[0];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_226EF4128((uint64_t)v70);
  LOBYTE(v65[0]) = v23;
  *((_QWORD *)&v65[0] + 1) = v14;
  *(_QWORD *)&v65[1] = v15;
  *((_QWORD *)&v65[1] + 1) = v49;
  *(_QWORD *)&v65[2] = v16;
  *((_QWORD *)&v65[2] + 1) = v48;
  *(_QWORD *)&v65[3] = v17;
  *((_QWORD *)&v65[3] + 1) = v47;
  *(_QWORD *)&v65[4] = v18;
  *((_QWORD *)&v65[4] + 1) = v46;
  *(_QWORD *)&v65[5] = v19;
  *((_QWORD *)&v65[5] + 1) = v45;
  *(_QWORD *)&v65[6] = v20;
  *((_QWORD *)&v65[6] + 1) = v44;
  *(_QWORD *)&v65[7] = v21;
  v24 = swift_allocObject();
  memcpy((void *)(v24 + 16), v70, 0x140uLL);
  sub_226EF4D4C((uint64_t)v70);
  v25 = __swift_instantiateConcreteTypeFromMangledName(&qword_2558AC918);
  v26 = sub_226EF4ED4();
  v27 = sub_226EF4F18();
  sub_226F01530();
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v71 = v70[19];
  v65[0] = v70[19];
  v50 = __swift_instantiateConcreteTypeFromMangledName(&qword_2558AC930);
  sub_226F015B4();
  v28 = swift_allocObject();
  memcpy((void *)(v28 + 16), v70, 0x140uLL);
  sub_226EF4D4C((uint64_t)v70);
  v29 = __swift_instantiateConcreteTypeFromMangledName(&qword_2558AC8E0);
  *(_QWORD *)&v65[0] = v25;
  *((_QWORD *)&v65[0] + 1) = &type metadata for MusicSubscriptionOffer.SheetPresentationModifier.PresentationContext;
  *(_QWORD *)&v65[1] = v26;
  *((_QWORD *)&v65[1] + 1) = v27;
  OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
  v31 = sub_226EF4F60();
  v33 = v51;
  v32 = v52;
  v34 = v63;
  sub_226F01530();
  swift_release();
  (*(void (**)(char *, uint64_t))(v53 + 8))(v34, v32);
  memcpy(v65, (char *)&v70[10] + 8, 0x88uLL);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2558AC948);
  sub_226F015B4();
  sub_226EF40EC(&v66, v72);
  sub_226EF40EC(v72, v64);
  v35 = swift_allocObject();
  memcpy((void *)(v35 + 16), v70, 0x140uLL);
  sub_226EF4D4C((uint64_t)v70);
  *(_QWORD *)&v65[0] = v32;
  *((_QWORD *)&v65[0] + 1) = v29;
  *(_QWORD *)&v65[1] = OpaqueTypeConformance2;
  *((_QWORD *)&v65[1] + 1) = v31;
  v36 = swift_getOpaqueTypeConformance2();
  v37 = sub_226EF500C();
  v39 = v54;
  v38 = v55;
  sub_226F01530();
  swift_release();
  sub_226EF40EC(v64, v65);
  sub_226EF5048((uint64_t)v65);
  (*(void (**)(char *, uint64_t))(v56 + 8))(v33, v38);
  v64[0] = *(_OWORD *)((char *)&v70[9] + 8);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2558AC958);
  sub_226F015CC();
  v40 = swift_allocObject();
  memcpy((void *)(v40 + 16), v70, 0x140uLL);
  sub_226EF4D4C((uint64_t)v70);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2558AC960);
  v66 = v38;
  v67 = &_s17PresentationStateON;
  v68 = v36;
  v69 = v37;
  swift_getOpaqueTypeConformance2();
  sub_226EF5140();
  v42 = v57;
  v41 = v58;
  sub_226F01518();
  swift_release();
  swift_release();
  swift_release();
  (*(void (**)(char *, uint64_t))(v59 + 8))(v39, v41);
  v64[0] = v71;
  sub_226F015CC();
  sub_226EF3338(v66, (uint64_t)v67, v68, v62);
  swift_release();
  swift_release();
  return (*(uint64_t (**)(char *, uint64_t))(v60 + 8))(v42, v61);
}

__n128 sub_226EF1F74(int a1, char *a2, void *__src)
{
  char v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  __n128 result;
  __int128 v10;
  uint64_t v11;
  __int128 v12;
  uint64_t v13;
  uint64_t v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE __dst[320];

  v4 = *a2;
  v10 = *(_OWORD *)(a2 + 8);
  v5 = *((_QWORD *)a2 + 3);
  v6 = *((_QWORD *)a2 + 4);
  memcpy(__dst, __src, sizeof(__dst));
  LOBYTE(v11) = v4;
  v12 = v10;
  v13 = v5;
  v14 = v6;
  v7 = *(_OWORD *)(a2 + 56);
  v15 = *(_OWORD *)(a2 + 40);
  v16 = v7;
  v8 = *(_OWORD *)(a2 + 88);
  v17 = *(_OWORD *)(a2 + 72);
  v18 = v8;
  v19 = *(_OWORD *)(a2 + 104);
  sub_226EF2004(&v11);
  return result;
}

void sub_226EF2004(_QWORD *a1)
{
  uint64_t v1;
  int v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  int v11;
  char v12;
  uint64_t v13;
  int v14;
  uint64_t v15;
  id v16;
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
  NSObject *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  id v36;
  NSObject *v37;
  os_log_type_t v38;
  uint64_t v39;
  uint64_t v40;
  unint64_t v41;
  id v42;
  uint64_t v43;
  unint64_t v44;
  uint64_t v45;
  unint64_t v46;
  uint64_t v47;
  int v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  NSObject *v53;
  os_log_type_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  unint64_t v58;
  uint64_t v59;
  unint64_t v60;
  id v61;
  _QWORD *v62;
  char v63;
  id v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  os_log_type_t v72[8];
  uint64_t v73;
  NSObject *v74;
  uint64_t v75;
  void *v76;
  id v77;
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
  os_log_type_t type[8];
  os_log_t log;
  _BYTE v90[128];
  id v91;
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
  os_log_t v104;
  uint64_t v105;
  char v106;
  _QWORD __dst[17];
  _BYTE v108[128];
  _QWORD __src[17];
  _BYTE v110[128];
  _BYTE v111[128];
  _BYTE v112[136];

  v2 = *(unsigned __int8 *)a1;
  v3 = a1[2];
  v4 = a1[4];
  v83 = a1[1];
  v84 = a1[3];
  v5 = a1[6];
  v6 = a1[8];
  v85 = a1[5];
  v86 = a1[7];
  v7 = a1[10];
  v8 = a1[12];
  v87 = a1[9];
  *(_QWORD *)type = a1[11];
  v9 = a1[14];
  log = (os_log_t)a1[13];
  sub_226EF40EC((const void *)(v1 + 168), v112);
  v10 = *(_QWORD *)(v1 + 296);
  if (v2 != 1)
  {
    v12 = *(_BYTE *)(v1 + 304);
    v13 = *(_QWORD *)(v1 + 312);
    sub_226EF40EC(v112, __src);
    __src[16] = v10;
    memcpy(__dst, __src, sizeof(__dst));
    __swift_instantiateConcreteTypeFromMangledName(&qword_2558AC948);
    sub_226F015B4();
    sub_226EF40EC(v108, v110);
    sub_226EF40EC(v110, v111);
    v14 = sub_226EF5354((uint64_t)v111);
    if (v14)
    {
      if (v14 != 1)
        return;
      nullsub_1(v111);
      sub_226EF5048((uint64_t)v110);
    }
    else
    {
      v47 = nullsub_1(v111);

      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      v48 = *(unsigned __int8 *)(v47 + 120);
      if (v48 != 2 && v48 != 3)
      {
        sub_226EF40C8((uint64_t)&v91);
        memcpy(__dst, __src, sizeof(__dst));
        sub_226EF40EC(&v91, v90);
        sub_226F015C0();
        LOBYTE(__dst[0]) = v12;
        __dst[1] = v13;
        v90[0] = 2;
        __swift_instantiateConcreteTypeFromMangledName(&qword_2558AC930);
        goto LABEL_17;
      }
    }
    sub_226EF40C8((uint64_t)&v91);
    memcpy(__dst, __src, sizeof(__dst));
    sub_226EF40EC(&v91, v90);
LABEL_17:
    sub_226F015C0();
    return;
  }
  sub_226EF40EC(v112, __src);
  __src[16] = v10;
  memcpy(__dst, __src, sizeof(__dst));
  __swift_instantiateConcreteTypeFromMangledName(&qword_2558AC948);
  sub_226F015B4();
  sub_226EF40EC(v108, v110);
  sub_226EF40EC(v110, v111);
  v11 = sub_226EF5354((uint64_t)v111);
  if (v11)
  {
    if (v11 == 1)
    {
      nullsub_1(v111);
      sub_226EF5048((uint64_t)v110);
    }
    v91 = objc_msgSend(objc_allocWithZone((Class)MusicKit_SPI_SKCloudServiceSetupViewController), sel_init);
    v92 = v83;
    v93 = v3;
    v94 = v84;
    v95 = v4;
    v96 = v85;
    v97 = v5;
    v98 = v86;
    v99 = v6;
    v100 = v87;
    v101 = v7;
    v102 = *(_QWORD *)type;
    v103 = v8;
    v104 = log;
    v105 = v9;
    v106 = 2;
    sub_226EF5460((uint64_t)&v91);
    memcpy(__dst, __src, sizeof(__dst));
    sub_226EF40EC(&v91, v90);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    goto LABEL_17;
  }
  v15 = nullsub_1(v111);
  v16 = *(id *)(v15 + 8);
  v76 = *(void **)v15;
  v17 = *(_QWORD *)(v15 + 16);
  v18 = *(_QWORD *)(v15 + 24);
  v19 = v6;
  v21 = *(_QWORD *)(v15 + 32);
  v20 = *(_QWORD *)(v15 + 40);
  v23 = *(_QWORD *)(v15 + 48);
  v22 = *(_QWORD *)(v15 + 56);
  v25 = *(_QWORD *)(v15 + 64);
  v24 = *(_QWORD *)(v15 + 72);
  v27 = *(_QWORD *)(v15 + 80);
  v26 = *(_QWORD *)(v15 + 88);
  v29 = *(_QWORD *)(v15 + 96);
  v28 = *(_QWORD *)(v15 + 104);
  v30 = *(NSObject **)(v15 + 112);
  v63 = *(_BYTE *)(v15 + 120);
  __dst[0] = v83;
  __dst[1] = v3;
  __dst[2] = v84;
  v31 = v4;
  v32 = v27;
  __dst[3] = v31;
  __dst[4] = v85;
  v33 = v5;
  v34 = v25;
  v78 = v33;
  v79 = v3;
  __dst[5] = v33;
  __dst[6] = v86;
  v81 = v19;
  v82 = v17;
  __dst[7] = v19;
  __dst[8] = v87;
  __dst[9] = v7;
  __dst[10] = *(_QWORD *)type;
  __dst[11] = v8;
  __dst[12] = log;
  __dst[13] = v9;
  v71 = v18;
  *(_QWORD *)v72 = v16;
  v91 = v16;
  v92 = v17;
  v93 = v18;
  v94 = v21;
  v69 = v22;
  v70 = v20;
  v95 = v20;
  v96 = v23;
  v97 = v22;
  v98 = v25;
  v67 = v26;
  v68 = v24;
  v99 = v24;
  v100 = v27;
  v101 = v26;
  v102 = v29;
  v66 = v28;
  v103 = v28;
  v104 = v30;
  v80 = v29;
  v74 = v30;
  v75 = v31;
  if ((static MusicSubscriptionOffer.Options.== infix(_:_:)(__dst, &v91) & 1) != 0)
  {
    v73 = v32;
    v65 = v23;
    if (qword_2558AC730 != -1)
      swift_once();
    v35 = sub_226F012E4();
    __swift_project_value_buffer(v35, (uint64_t)qword_2558AE120);
    swift_bridgeObjectRetain();
    v36 = v76;
    swift_bridgeObjectRetain_n();
    swift_bridgeObjectRetain_n();
    swift_bridgeObjectRetain_n();
    swift_bridgeObjectRetain_n();
    swift_bridgeObjectRetain_n();
    swift_bridgeObjectRetain_n();
    swift_bridgeObjectRetain_n();
    v77 = v36;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v37 = sub_226F012CC();
    v38 = sub_226F017F4();
    if (os_log_type_enabled(v37, v38))
    {
      v39 = swift_slowAlloc();
      v62 = (_QWORD *)swift_slowAlloc();
      v61 = (id)swift_slowAlloc();
      v91 = v61;
      *(_DWORD *)v39 = 136315906;
      __dst[0] = v83;
      __dst[1] = v3;
      __dst[2] = v84;
      __dst[3] = v75;
      __dst[4] = v85;
      __dst[5] = v78;
      __dst[6] = v86;
      __dst[7] = v81;
      __dst[8] = v87;
      __dst[9] = v7;
      __dst[10] = *(_QWORD *)type;
      __dst[11] = v8;
      __dst[12] = log;
      __dst[13] = v9;
      v40 = MusicSubscriptionOffer.Options.description.getter();
      __dst[0] = sub_226EF91E8(v40, v41, (uint64_t *)&v91);
      sub_226F01830();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease();
      *(_WORD *)(v39 + 12) = 2112;
      __dst[0] = v77;
      v42 = v77;
      sub_226F01830();
      *v62 = v77;

      *(_WORD *)(v39 + 22) = 2080;
      __dst[0] = *(_QWORD *)v72;
      __dst[1] = v82;
      __dst[2] = v71;
      __dst[3] = v21;
      __dst[4] = v70;
      __dst[5] = v65;
      __dst[6] = v69;
      __dst[7] = v34;
      __dst[8] = v68;
      __dst[9] = v73;
      __dst[10] = v67;
      __dst[11] = v80;
      __dst[12] = v66;
      __dst[13] = v74;
      v43 = MusicSubscriptionOffer.Options.description.getter();
      __dst[0] = sub_226EF91E8(v43, v44, (uint64_t *)&v91);
      sub_226F01830();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease();
      *(_WORD *)(v39 + 32) = 2080;
      LOBYTE(__dst[0]) = v63;
      v45 = sub_226F01764();
      __dst[0] = sub_226EF91E8(v45, v46, (uint64_t *)&v91);
      sub_226F01830();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_226EE6000, v37, v38, "Unexpectedly changed presentation context for subscription offer to isPresented: true, options: %s while internal presentation state is .active(%@, %s, %s.", (uint8_t *)v39, 0x2Au);
      __swift_instantiateConcreteTypeFromMangledName(&qword_2558AC998);
      swift_arrayDestroy();
      MEMORY[0x2276A6584](v62, -1, -1);
      swift_arrayDestroy();
      MEMORY[0x2276A6584](v61, -1, -1);
      MEMORY[0x2276A6584](v39, -1, -1);

    }
    else
    {

      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease_n();

    }
  }
  else
  {
    if (qword_2558AC730 != -1)
      swift_once();
    v49 = sub_226F012E4();
    __swift_project_value_buffer(v49, (uint64_t)qword_2558AE120);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain_n();
    swift_bridgeObjectRetain_n();
    swift_bridgeObjectRetain_n();
    swift_bridgeObjectRetain_n();
    swift_bridgeObjectRetain_n();
    swift_bridgeObjectRetain_n();
    swift_bridgeObjectRetain_n();
    swift_bridgeObjectRetain();
    v50 = v21;
    swift_bridgeObjectRetain();
    v51 = v23;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v52 = v32;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v53 = sub_226F012CC();
    v54 = sub_226F017E8();
    if (os_log_type_enabled(v53, v54))
    {
      v55 = v52;
      v56 = swift_slowAlloc();
      v64 = (id)swift_slowAlloc();
      v91 = v64;
      *(_DWORD *)v56 = 136315394;
      __dst[0] = *(_QWORD *)v72;
      __dst[1] = v82;
      __dst[2] = v71;
      __dst[3] = v50;
      __dst[4] = v70;
      __dst[5] = v51;
      __dst[6] = v69;
      __dst[7] = v34;
      __dst[8] = v68;
      __dst[9] = v55;
      __dst[10] = v67;
      __dst[11] = v80;
      __dst[12] = v66;
      __dst[13] = v74;
      v57 = MusicSubscriptionOffer.Options.description.getter();
      __dst[0] = sub_226EF91E8(v57, v58, (uint64_t *)&v91);
      sub_226F01830();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease();
      *(_WORD *)(v56 + 12) = 2080;
      __dst[0] = v83;
      __dst[1] = v79;
      __dst[2] = v84;
      __dst[3] = v75;
      __dst[4] = v85;
      __dst[5] = v78;
      __dst[6] = v86;
      __dst[7] = v81;
      __dst[8] = v87;
      __dst[9] = v7;
      __dst[10] = *(_QWORD *)type;
      __dst[11] = v8;
      __dst[12] = log;
      __dst[13] = v9;
      v59 = MusicSubscriptionOffer.Options.description.getter();
      __dst[0] = sub_226EF91E8(v59, v60, (uint64_t *)&v91);
      sub_226F01830();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_226EE6000, v53, v54, "Updating subscription offer options while the subscription offer is presented is not supported. Attempting to update options from %s to %s.", (uint8_t *)v56, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x2276A6584](v64, -1, -1);
      MEMORY[0x2276A6584](v56, -1, -1);

    }
    else
    {

      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease_n();
    }
  }
}

_QWORD *sub_226EF2E00(uint64_t a1, _BYTE *a2)
{
  _QWORD *result;
  uint64_t v3;

  if (*a2 == 2)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_2558AC910);
    result = MEMORY[0x2276A5DA4](&v3);
    if ((v3 & 1) != 0)
    {
      LOBYTE(v3) = 0;
      return (_QWORD *)sub_226F015F0();
    }
  }
  return result;
}

void sub_226EF2E90(uint64_t a1, const void *a2, const void *a3)
{
  _BYTE v4[128];
  _BYTE __dst[320];
  _BYTE v6[128];

  sub_226EF40EC(a2, v6);
  memcpy(__dst, a3, sizeof(__dst));
  sub_226EF40EC(v6, v4);
  sub_226EF2EF0(v4);
}

void sub_226EF2EF0(const void *a1)
{
  const void *v1;
  int v2;
  uint64_t v3;
  void (*v4)(uint64_t);
  id v5;
  uint64_t v6;
  int v7;
  uint64_t *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  void *v18;
  _QWORD *v19;
  void *v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  __int128 aBlock;
  void (*v30)(uint64_t, uint64_t, void *);
  void *v31;
  void (*v32)(char, void *);
  _QWORD *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  __int128 v42;
  char v43;
  char v44;
  _OWORD __dst[20];
  __int128 v46;
  _BYTE v47[128];
  _BYTE v48[144];

  sub_226EF40EC(a1, v47);
  memcpy(__dst, v1, sizeof(__dst));
  sub_226EF40EC(v47, v48);
  v2 = sub_226EF5354((uint64_t)v48);
  if (v2)
  {
    if (v2 == 1)
    {
      v3 = *(_QWORD *)nullsub_1(v48);
      v4 = (void (*)(uint64_t))*((_QWORD *)&__dst[8] + 1);
      sub_226EF40EC(v47, &aBlock);
      v5 = *(id *)nullsub_1(&aBlock);
      v4(v3);
      sub_226EF5048((uint64_t)v47);
    }
    else
    {
      v46 = *(_OWORD *)((char *)&__dst[9] + 8);
      aBlock = *(_OWORD *)((char *)&__dst[9] + 8);
      __swift_instantiateConcreteTypeFromMangledName(&qword_2558AC958);
      sub_226F015B4();
      if (v42 == 1)
      {
        aBlock = v46;
        LOBYTE(v42) = 0;
        sub_226F015C0();
      }
      aBlock = __dst[0];
      LOBYTE(v30) = __dst[1];
      v42 = __dst[0];
      v43 = __dst[1];
      __swift_instantiateConcreteTypeFromMangledName(&qword_2558AC910);
      MEMORY[0x2276A5DA4](&v44);
      if (v44 == 1)
      {
        v42 = aBlock;
        v43 = (char)v30;
        v44 = 0;
        sub_226F015F0();
      }
    }
  }
  else
  {
    v6 = nullsub_1(v48);
    v7 = *(unsigned __int8 *)(v6 + 120);
    if (v7 == 2)
    {
      v9 = *(void **)v6;
      v10 = *(_QWORD *)(v6 + 16);
      v27 = *(_QWORD *)(v6 + 24);
      v28 = *(_QWORD *)(v6 + 8);
      v11 = *(_QWORD *)(v6 + 32);
      v12 = *(_QWORD *)(v6 + 48);
      v26 = *(_QWORD *)(v6 + 40);
      v13 = *(_QWORD *)(v6 + 64);
      v14 = *(_QWORD *)(v6 + 80);
      v23 = *(_QWORD *)(v6 + 88);
      v24 = *(_QWORD *)(v6 + 72);
      v15 = *(_QWORD *)(v6 + 96);
      v22 = *(_QWORD *)(v6 + 104);
      v16 = *(_QWORD *)(v6 + 112);
      v34 = *(_QWORD *)(v6 + 56);
      v25 = v34;
      v35 = v13;
      v36 = v24;
      v37 = v14;
      v38 = v23;
      v39 = v15;
      v40 = v22;
      v41 = v16;
      swift_bridgeObjectRetain();
      v17 = v9;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      sub_226EF9EA4();
      type metadata accessor for MusicKit_SPI_SKCloudServiceSetupOptionsKey(0);
      sub_226EEA470((unint64_t *)&qword_2558AC7B0, (uint64_t (*)(uint64_t))type metadata accessor for MusicKit_SPI_SKCloudServiceSetupOptionsKey, (uint64_t)&unk_226F02130);
      v18 = (void *)sub_226F01704();
      swift_bridgeObjectRelease();
      v19 = (_QWORD *)swift_allocObject();
      memcpy(v19 + 2, __dst, 0x140uLL);
      v19[42] = v17;
      v19[43] = v28;
      v19[44] = v10;
      v19[45] = v27;
      v19[46] = v11;
      v19[47] = v26;
      v19[48] = v12;
      v19[49] = v25;
      v19[50] = v13;
      v19[51] = v24;
      v19[52] = v14;
      v19[53] = v23;
      v19[54] = v15;
      v19[55] = v22;
      v19[56] = v16;
      v32 = sub_226EF5438;
      v33 = v19;
      *(_QWORD *)&aBlock = MEMORY[0x24BDAC760];
      *((_QWORD *)&aBlock + 1) = 1107296256;
      v30 = sub_226EF3A90;
      v31 = &block_descriptor_0;
      v20 = _Block_copy(&aBlock);
      v21 = v17;
      sub_226EF4D4C((uint64_t)__dst);
      swift_release();
      objc_msgSend(v21, sel_musicKit_loadWithOptions_completionHandler_, v18, v20);
      _Block_release(v20);

    }
    else
    {
      if (v7 == 3)
      {
        aBlock = *(_OWORD *)((char *)&__dst[9] + 8);
        LOBYTE(v42) = 1;
        v8 = &qword_2558AC958;
      }
      else
      {
        aBlock = __dst[19];
        LOBYTE(v42) = v7 & 1;
        v8 = &qword_2558AC930;
      }
      __swift_instantiateConcreteTypeFromMangledName(v8);
      sub_226F015C0();
      (*((void (**)(_QWORD))&__dst[8] + 1))(0);
    }
  }
}

void *sub_226EF32AC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  char v3;
  uint64_t v4;
  void *result;
  _BYTE v6[138];
  _BYTE __dst[144];

  memcpy(__dst, (const void *)(a1 + 168), 0x88uLL);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2558AC948);
  sub_226F015CC();
  memcpy(__dst, v6, 0x8AuLL);
  v3 = sub_226F014C4();
  v4 = sub_226F013C8();
  result = memcpy((void *)a2, __dst, 0x90uLL);
  *(_QWORD *)(a2 + 144) = v4;
  *(_BYTE *)(a2 + 152) = v3;
  return result;
}

uint64_t sub_226EF3338@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, char a3@<W2>, uint64_t a4@<X8>)
{
  uint64_t v4;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _BYTE *v12;
  uint64_t v13;
  _BYTE *v14;
  uint64_t v15;
  uint64_t v16;
  _BYTE *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t v22;
  _BYTE v24[24];
  uint64_t v25;

  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_2558AC978);
  v10 = MEMORY[0x24BDAC7A8](v9);
  v12 = &v24[-((v11 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x24BDAC7A8](v10);
  v14 = &v24[-v13];
  v15 = _s20FailureAlertModifierVMa();
  MEMORY[0x24BDAC7A8](v15);
  v17 = &v24[-((v16 + 15) & 0xFFFFFFFFFFFFFFF0)];
  *(_QWORD *)v17 = a1;
  *((_QWORD *)v17 + 1) = a2;
  v17[16] = a3;
  v24[15] = 0;
  swift_retain();
  swift_retain();
  sub_226F015A8();
  v18 = v25;
  v17[24] = v24[16];
  *((_QWORD *)v17 + 4) = v18;
  v19 = sub_226F0156C();
  __swift_storeEnumTagSinglePayload((uint64_t)v14, 1, 1, v19);
  sub_226EF51E8((uint64_t)v14, (uint64_t)v12);
  sub_226F015A8();
  sub_226EF5230((uint64_t)v14);
  v20 = (uint64_t *)&v17[*(int *)(v15 + 28)];
  *v20 = swift_getKeyPath();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2558AC980);
  swift_storeEnumTagMultiPayload();
  v21 = __swift_instantiateConcreteTypeFromMangledName(&qword_2558AC908);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v21 - 8) + 16))(a4, v4, v21);
  v22 = __swift_instantiateConcreteTypeFromMangledName(&qword_2558AC988);
  return sub_226EF5310((uint64_t)v17, a4 + *(int *)(v22 + 36));
}

void sub_226EF3514(char a1, void *a2, uint64_t a3, void *a4, uint64_t *a5)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  const void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  id v15;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  _BYTE __dst[320];
  _BYTE v29[128];
  _QWORD v30[15];
  char v31;
  _BYTE v32[128];
  _BYTE v33[136];

  v24 = a5[1];
  v25 = *a5;
  v22 = a5[3];
  v23 = a5[2];
  v20 = a5[5];
  v21 = a5[4];
  v18 = a5[7];
  v19 = a5[6];
  v7 = a5[9];
  v17 = a5[8];
  v8 = a5[10];
  v9 = a5[11];
  v10 = (const void *)(a3 + 168);
  v11 = a5[12];
  v12 = a5[13];
  memcpy(__dst, (const void *)(a3 + 168), 0x88uLL);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2558AC948);
  sub_226F015B4();
  sub_226EF40EC(v30, v32);
  sub_226EF40EC(v32, v33);
  if (sub_226EF5354((uint64_t)v33))
  {
    sub_226EF5048((uint64_t)v32);
  }
  else
  {
    v13 = nullsub_1(v33);

    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if (*(_BYTE *)(v13 + 120) == 2)
    {
      if (a2)
      {
        memcpy(__dst, (const void *)a3, sizeof(__dst));
        v14 = a2;
        sub_226EF37D8(a4, a2);

      }
      else if ((a1 & 1) != 0)
      {
        v30[0] = a4;
        v30[1] = v25;
        v30[2] = v24;
        v30[3] = v23;
        v30[4] = v22;
        v30[5] = v21;
        v30[6] = v20;
        v30[7] = v19;
        v30[8] = v18;
        v30[9] = v17;
        v30[10] = v7;
        v30[11] = v8;
        v30[12] = v9;
        v30[13] = v11;
        v30[14] = v12;
        v31 = 3;
        sub_226EF5460((uint64_t)v30);
        memcpy(__dst, v10, 0x88uLL);
        sub_226EF40EC(v30, v29);
        v15 = a4;
        sub_226EF5468((uint64_t)a5);
        sub_226F015C0();
      }
      else
      {
        sub_226F018B4();
        __break(1u);
      }
    }
  }
}

uint64_t sub_226EF37D8(void *a1, void *a2)
{
  _QWORD *v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char v16;
  id v17;
  id v18;
  id v19;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  _BYTE v32[128];
  _BYTE __dst[136];
  _QWORD v34[15];
  char v35;
  _QWORD __src[17];
  _BYTE v37[136];

  v5 = v2[3];
  v4 = v2[4];
  v6 = v2[6];
  v25 = v2[7];
  v26 = v2[5];
  v30 = v2[10];
  v31 = v2[8];
  v23 = v2[11];
  v24 = v2[9];
  v27 = v2[12];
  v29 = v2[14];
  v7 = v2[16];
  v21 = v2[15];
  v22 = v2[13];
  sub_226EF40EC(v2 + 21, v37);
  v8 = v2[37];
  v9 = (void *)sub_226F01230();
  v10 = objc_msgSend(v9, sel_domain);
  v11 = sub_226F01758();
  v13 = v12;

  if (v11 == sub_226F01758() && v13 == v14)
  {
    swift_bridgeObjectRelease_n();
  }
  else
  {
    v16 = sub_226F018E4();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if ((v16 & 1) == 0)
      goto LABEL_9;
  }
  if (!objc_msgSend(v9, sel_code))
  {
    sub_226EF55D4();
    v18 = sub_226EF3AF0(0xD000000000000022, 0x8000000226F037F0);
    if (!v18)
    {
      v34[0] = a1;
      v34[1] = v5;
      v34[2] = v4;
      v34[3] = v26;
      v34[4] = v6;
      v34[5] = v25;
      v34[6] = v31;
      v34[7] = v24;
      v34[8] = v30;
      v34[9] = v23;
      v34[10] = v27;
      v34[11] = v22;
      v34[12] = v29;
      v34[13] = v21;
      v34[14] = v7;
      v35 = 0;
      sub_226EF5460((uint64_t)v34);
      sub_226EF40EC(v37, __src);
      __src[16] = v8;
      memcpy(__dst, __src, sizeof(__dst));
      sub_226EF40EC(v34, v32);
      swift_bridgeObjectRetain();
      v19 = a1;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      sub_226EF54FC((uint64_t)__src);
      goto LABEL_12;
    }

  }
LABEL_9:
  v34[0] = a2;
  sub_226EF54F0((uint64_t)v34);
  sub_226EF40EC(v37, __src);
  __src[16] = v8;
  memcpy(__dst, __src, sizeof(__dst));
  sub_226EF40EC(v34, v32);
  sub_226EF54FC((uint64_t)__src);
  v17 = a2;
LABEL_12:
  __swift_instantiateConcreteTypeFromMangledName(&qword_2558AC948);
  sub_226F015C0();

  return sub_226EF5568((uint64_t)__src);
}

void sub_226EF3A90(uint64_t a1, uint64_t a2, void *a3)
{
  void (*v5)(uint64_t, void *);
  id v6;

  v5 = *(void (**)(uint64_t, void *))(a1 + 32);
  swift_retain();
  v6 = a3;
  v5(a2, a3);
  swift_release();

}

id sub_226EF3AF0(uint64_t a1, uint64_t a2)
{
  void *v2;
  id v3;
  id v4;
  id v5;
  id v7[2];

  v7[1] = *(id *)MEMORY[0x24BDAC8D0];
  if (a2)
  {
    v2 = (void *)sub_226F01734();
    swift_bridgeObjectRelease();
  }
  else
  {
    v2 = 0;
  }
  v7[0] = 0;
  v3 = objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_extensionWithIdentifier_error_, v2, v7);

  if (v3)
  {
    v4 = v7[0];
  }
  else
  {
    v5 = v7[0];
    sub_226F0123C();

    swift_willThrow();
  }
  return v3;
}

uint64_t sub_226EF3BD0(unsigned __int8 *a1, unsigned __int8 *a2)
{
  char v2;
  uint64_t v3;
  uint64_t v4;
  __int128 v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v13;
  uint64_t v14;
  uint64_t v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint64_t v22;
  uint64_t v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;

  if (*a1 == *a2)
  {
    v4 = *((_QWORD *)a2 + 3);
    v3 = *((_QWORD *)a2 + 4);
    v5 = *(_OWORD *)(a2 + 8);
    v7 = *((_QWORD *)a1 + 3);
    v6 = *((_QWORD *)a1 + 4);
    v21 = *(_OWORD *)(a1 + 8);
    v22 = v7;
    v23 = v6;
    v8 = *(_OWORD *)(a1 + 56);
    v24 = *(_OWORD *)(a1 + 40);
    v25 = v8;
    v9 = *(_OWORD *)(a1 + 88);
    v26 = *(_OWORD *)(a1 + 72);
    v27 = v9;
    v28 = *(_OWORD *)(a1 + 104);
    v13 = v5;
    v14 = v4;
    v15 = v3;
    v10 = *(_OWORD *)(a2 + 56);
    v16 = *(_OWORD *)(a2 + 40);
    v17 = v10;
    v11 = *(_OWORD *)(a2 + 88);
    v18 = *(_OWORD *)(a2 + 72);
    v19 = v11;
    v20 = *(_OWORD *)(a2 + 104);
    v2 = static MusicSubscriptionOffer.Options.== infix(_:_:)(&v21, &v13);
  }
  else
  {
    v2 = 0;
  }
  return v2 & 1;
}

uint64_t sub_226EF3C70()
{
  sub_226F01944();
  return MusicSubscriptionOffer.Options.hash(into:)();
}

uint64_t sub_226EF3D0C()
{
  sub_226F0192C();
  sub_226F01944();
  MusicSubscriptionOffer.Options.hash(into:)();
  return sub_226F0195C();
}

uint64_t sub_226EF3DD4()
{
  sub_226F0192C();
  sub_226F01944();
  MusicSubscriptionOffer.Options.hash(into:)();
  return sub_226F0195C();
}

uint64_t sub_226EF3E94()
{
  return sub_226F0132C();
}

uint64_t View.musicSubscriptionOffer(isPresented:options:onLoadCompletion:)(uint64_t a1, uint64_t a2, char a3, uint64_t *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char v14;
  uint64_t v15;
  char v16;
  uint64_t v17;
  uint64_t v19;
  uint64_t v20;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  _BYTE __dst[320];
  _BYTE v35[128];
  _BYTE __src[136];
  _QWORD v37[41];

  v9 = a4[1];
  v10 = a4[3];
  v28 = a4[2];
  v29 = *a4;
  v26 = a4[6];
  v27 = a4[4];
  v19 = a4[7];
  v20 = a4[5];
  v11 = a4[9];
  v12 = a4[11];
  v24 = a4[10];
  v25 = a4[8];
  v13 = a4[13];
  v23 = a4[12];
  swift_bridgeObjectRetain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  OUTLINED_FUNCTION_2_2();
  v14 = v37[0];
  v15 = v37[1];
  sub_226EF40C8((uint64_t)v35);
  sub_226EF40EC(v35, v37);
  sub_226F015A8();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2558AC8E0);
  OUTLINED_FUNCTION_2_2();
  v16 = v37[0];
  v17 = v37[1];
  v37[0] = a1;
  v37[1] = a2;
  LOBYTE(v37[2]) = a3;
  v37[3] = v29;
  v37[4] = v9;
  v37[5] = v28;
  v37[6] = v10;
  v37[7] = v27;
  v37[8] = v20;
  v37[9] = v26;
  v37[10] = v19;
  v37[11] = v25;
  v37[12] = v11;
  v37[13] = v24;
  v37[14] = v12;
  v37[15] = v23;
  v37[16] = v13;
  v37[17] = a5;
  v37[18] = a6;
  LOBYTE(v37[19]) = v14;
  v37[20] = v15;
  memcpy(&v37[21], __src, 0x88uLL);
  LOBYTE(v37[38]) = v16;
  v37[39] = v17;
  memcpy(__dst, v37, sizeof(__dst));
  MEMORY[0x2276A5CE4](__dst, a7, &type metadata for MusicSubscriptionOffer.SheetPresentationModifier, a8);
  return sub_226EF4128((uint64_t)v37);
}

double sub_226EF40C8(uint64_t a1)
{
  double result;

  result = 0.0;
  *(_OWORD *)(a1 + 105) = 0u;
  *(_OWORD *)(a1 + 80) = 0u;
  *(_OWORD *)(a1 + 96) = 0u;
  *(_OWORD *)(a1 + 48) = 0u;
  *(_OWORD *)(a1 + 64) = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  *(_OWORD *)(a1 + 32) = 0u;
  *(_OWORD *)a1 = 0u;
  *(_BYTE *)(a1 + 121) = 2;
  return result;
}

void *sub_226EF40EC(const void *a1, void *a2)
{
  __swift_memcpy122_8(a2, a1);
  return a2;
}

uint64_t sub_226EF4128(uint64_t a1)
{
  uint64_t v2;
  __int16 v3;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;

  v14 = *(_QWORD *)(a1 + 176);
  v15 = *(void **)(a1 + 168);
  v12 = *(_QWORD *)(a1 + 192);
  v13 = *(_QWORD *)(a1 + 184);
  v10 = *(_QWORD *)(a1 + 208);
  v11 = *(_QWORD *)(a1 + 200);
  v9 = *(_QWORD *)(a1 + 216);
  v7 = *(_OWORD *)(a1 + 232);
  v6 = *(_OWORD *)(a1 + 248);
  v5 = *(_OWORD *)(a1 + 264);
  v2 = *(_QWORD *)(a1 + 280);
  v3 = *(_WORD *)(a1 + 288);
  v8 = *(_QWORD *)(a1 + 224);
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  sub_226EF42A0(v15, v14, v13, v12, v11, v10, v9, v8, v7, *((uint64_t *)&v7 + 1), v6, *((uint64_t *)&v6 + 1), v5, *((uint64_t *)&v5 + 1), v2, v3, SHIBYTE(v3));
  swift_release();
  swift_release();
  return a1;
}

void sub_226EF42A0(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, char a16, char a17)
{
  if (a17 == 1)
  {

  }
  else if (!a17)
  {

    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
}

ValueMetadata *type metadata accessor for MusicSubscriptionOffer()
{
  return &type metadata for MusicSubscriptionOffer;
}

uint64_t sub_226EF4374(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  _QWORD v4[2];

  v1 = *(_QWORD *)(a1 + 8);
  v2 = sub_226F013BC();
  v4[0] = v1;
  v4[1] = sub_226EF43C8();
  return MEMORY[0x2276A650C](MEMORY[0x24BDED308], v2, v4);
}

unint64_t sub_226EF43C8()
{
  unint64_t result;

  result = qword_2558AC8E8;
  if (!qword_2558AC8E8)
  {
    result = MEMORY[0x2276A650C](&unk_226F028AC, &type metadata for MusicSubscriptionOffer.SheetPresentationModifier);
    atomic_store(result, (unint64_t *)&qword_2558AC8E8);
  }
  return result;
}

id sub_226EF4404(id result, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, char a16, char a17)
{
  id v17;
  id v18;

  v17 = result;
  if (a17 == 1)
    return result;
  if (!a17)
  {
    swift_bridgeObjectRetain();
    v18 = v17;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    return (id)swift_bridgeObjectRetain();
  }
  return result;
}

uint64_t destroy for MusicSubscriptionOffer.SheetPresentationModifier(uint64_t a1)
{
  void *v2;
  uint64_t v3;

  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  v2 = *(void **)(a1 + 168);
  v3 = *(_QWORD *)(a1 + 176);
  a1 += 168;
  sub_226EF42A0(v2, v3, *(_QWORD *)(a1 + 16), *(_QWORD *)(a1 + 24), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 80), *(_QWORD *)(a1 + 88), *(_QWORD *)(a1 + 96), *(_QWORD *)(a1 + 104), *(_QWORD *)(a1 + 112), *(_WORD *)(a1 + 120), HIBYTE(*(_WORD *)(a1 + 120)));
  swift_release();
  return swift_release();
}

uint64_t initializeWithCopy for MusicSubscriptionOffer.SheetPresentationModifier(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char v16;
  char v17;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;

  v4 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v4;
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
  v5 = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 32) = v5;
  v6 = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 48) = v6;
  v7 = *(_QWORD *)(a2 + 64);
  *(_QWORD *)(a1 + 56) = *(_QWORD *)(a2 + 56);
  *(_QWORD *)(a1 + 64) = v7;
  v8 = *(_QWORD *)(a2 + 80);
  *(_QWORD *)(a1 + 72) = *(_QWORD *)(a2 + 72);
  *(_QWORD *)(a1 + 80) = v8;
  v9 = *(_QWORD *)(a2 + 96);
  *(_QWORD *)(a1 + 88) = *(_QWORD *)(a2 + 88);
  *(_QWORD *)(a1 + 96) = v9;
  v10 = *(_QWORD *)(a2 + 112);
  *(_QWORD *)(a1 + 104) = *(_QWORD *)(a2 + 104);
  *(_QWORD *)(a1 + 112) = v10;
  *(_QWORD *)(a1 + 120) = *(_QWORD *)(a2 + 120);
  v11 = *(_QWORD *)(a2 + 144);
  *(_OWORD *)(a1 + 128) = *(_OWORD *)(a2 + 128);
  *(_QWORD *)(a1 + 144) = v11;
  *(_BYTE *)(a1 + 152) = *(_BYTE *)(a2 + 152);
  v12 = *(void **)(a2 + 168);
  *(_QWORD *)(a1 + 160) = *(_QWORD *)(a2 + 160);
  v25 = *(_QWORD *)(a2 + 176);
  v26 = v12;
  v23 = *(_QWORD *)(a2 + 192);
  v24 = *(_QWORD *)(a2 + 184);
  v21 = *(_QWORD *)(a2 + 208);
  v22 = *(_QWORD *)(a2 + 200);
  v19 = *(_QWORD *)(a2 + 224);
  v20 = *(_QWORD *)(a2 + 216);
  v29 = *(_QWORD *)(a2 + 240);
  v30 = *(_QWORD *)(a2 + 232);
  v13 = *(_QWORD *)(a2 + 264);
  v27 = *(_QWORD *)(a2 + 256);
  v28 = *(_QWORD *)(a2 + 248);
  v15 = *(_QWORD *)(a2 + 272);
  v14 = *(_QWORD *)(a2 + 280);
  v16 = *(_BYTE *)(a2 + 288);
  v17 = *(_BYTE *)(a2 + 289);
  swift_retain();
  swift_retain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_retain();
  swift_retain();
  sub_226EF4404(v26, v25, v24, v23, v22, v21, v20, v19, v30, v29, v28, v27, v13, v15, v14, v16, v17);
  *(_QWORD *)(a1 + 168) = v26;
  *(_QWORD *)(a1 + 176) = v25;
  *(_QWORD *)(a1 + 184) = v24;
  *(_QWORD *)(a1 + 192) = v23;
  *(_QWORD *)(a1 + 200) = v22;
  *(_QWORD *)(a1 + 208) = v21;
  *(_QWORD *)(a1 + 216) = v20;
  *(_QWORD *)(a1 + 224) = v19;
  *(_QWORD *)(a1 + 232) = v30;
  *(_QWORD *)(a1 + 240) = v29;
  *(_QWORD *)(a1 + 248) = v28;
  *(_QWORD *)(a1 + 256) = v27;
  *(_QWORD *)(a1 + 264) = v13;
  *(_QWORD *)(a1 + 272) = v15;
  *(_QWORD *)(a1 + 280) = v14;
  *(_BYTE *)(a1 + 288) = v16;
  *(_BYTE *)(a1 + 289) = v17;
  *(_QWORD *)(a1 + 296) = *(_QWORD *)(a2 + 296);
  *(_BYTE *)(a1 + 304) = *(_BYTE *)(a2 + 304);
  *(_QWORD *)(a1 + 312) = *(_QWORD *)(a2 + 312);
  swift_retain();
  swift_retain();
  return a1;
}

uint64_t assignWithCopy for MusicSubscriptionOffer.SheetPresentationModifier(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  uint64_t v24;
  __int16 v25;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  char v34;
  char v35;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  swift_retain();
  swift_release();
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  swift_retain();
  swift_release();
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 56) = *(_QWORD *)(a2 + 56);
  *(_QWORD *)(a1 + 64) = *(_QWORD *)(a2 + 64);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 72) = *(_QWORD *)(a2 + 72);
  *(_QWORD *)(a1 + 80) = *(_QWORD *)(a2 + 80);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 88) = *(_QWORD *)(a2 + 88);
  *(_QWORD *)(a1 + 96) = *(_QWORD *)(a2 + 96);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 104) = *(_QWORD *)(a2 + 104);
  *(_QWORD *)(a1 + 112) = *(_QWORD *)(a2 + 112);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 120) = *(_QWORD *)(a2 + 120);
  *(_QWORD *)(a1 + 128) = *(_QWORD *)(a2 + 128);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v4 = *(_QWORD *)(a2 + 144);
  *(_QWORD *)(a1 + 136) = *(_QWORD *)(a2 + 136);
  *(_QWORD *)(a1 + 144) = v4;
  swift_retain();
  swift_release();
  *(_BYTE *)(a1 + 152) = *(_BYTE *)(a2 + 152);
  *(_QWORD *)(a1 + 160) = *(_QWORD *)(a2 + 160);
  swift_retain();
  swift_release();
  v5 = *(void **)(a2 + 168);
  v6 = *(_QWORD *)(a2 + 176);
  v7 = *(_QWORD *)(a2 + 184);
  v8 = *(_QWORD *)(a2 + 192);
  v9 = *(_QWORD *)(a2 + 200);
  v10 = *(_QWORD *)(a2 + 208);
  v11 = *(_QWORD *)(a2 + 216);
  v12 = *(_QWORD *)(a2 + 224);
  v27 = *(_QWORD *)(a2 + 232);
  v28 = *(_QWORD *)(a2 + 240);
  v29 = *(_QWORD *)(a2 + 248);
  v30 = *(_QWORD *)(a2 + 256);
  v31 = *(_QWORD *)(a2 + 264);
  v32 = *(_QWORD *)(a2 + 272);
  v33 = *(_QWORD *)(a2 + 280);
  v34 = *(_BYTE *)(a2 + 288);
  v35 = *(_BYTE *)(a2 + 289);
  sub_226EF4404(v5, v6, v7, v8, v9, v10, v11, v12, v27, v28, v29, v30, v31, v32, v33, v34, v35);
  v13 = *(void **)(a1 + 168);
  v14 = *(_QWORD *)(a1 + 176);
  v15 = *(_QWORD *)(a1 + 184);
  v16 = *(_QWORD *)(a1 + 192);
  v17 = *(_QWORD *)(a1 + 200);
  v18 = *(_QWORD *)(a1 + 208);
  v19 = *(_QWORD *)(a1 + 216);
  v20 = *(_QWORD *)(a1 + 224);
  v21 = *(_OWORD *)(a1 + 232);
  v22 = *(_OWORD *)(a1 + 248);
  v23 = *(_OWORD *)(a1 + 264);
  v24 = *(_QWORD *)(a1 + 280);
  v25 = *(_WORD *)(a1 + 288);
  *(_QWORD *)(a1 + 168) = v5;
  *(_QWORD *)(a1 + 176) = v6;
  *(_QWORD *)(a1 + 184) = v7;
  *(_QWORD *)(a1 + 192) = v8;
  *(_QWORD *)(a1 + 200) = v9;
  *(_QWORD *)(a1 + 208) = v10;
  *(_QWORD *)(a1 + 216) = v11;
  *(_QWORD *)(a1 + 224) = v12;
  *(_QWORD *)(a1 + 232) = v27;
  *(_QWORD *)(a1 + 240) = v28;
  *(_QWORD *)(a1 + 248) = v29;
  *(_QWORD *)(a1 + 256) = v30;
  *(_QWORD *)(a1 + 264) = v31;
  *(_QWORD *)(a1 + 272) = v32;
  *(_QWORD *)(a1 + 280) = v33;
  *(_BYTE *)(a1 + 288) = v34;
  *(_BYTE *)(a1 + 289) = v35;
  sub_226EF42A0(v13, v14, v15, v16, v17, v18, v19, v20, v21, *((uint64_t *)&v21 + 1), v22, *((uint64_t *)&v22 + 1), v23, *((uint64_t *)&v23 + 1), v24, v25, SHIBYTE(v25));
  *(_QWORD *)(a1 + 296) = *(_QWORD *)(a2 + 296);
  swift_retain();
  swift_release();
  *(_BYTE *)(a1 + 304) = *(_BYTE *)(a2 + 304);
  *(_QWORD *)(a1 + 312) = *(_QWORD *)(a2 + 312);
  swift_retain();
  swift_release();
  return a1;
}

void *__swift_memcpy320_8(void *a1, const void *a2)
{
  return memcpy(a1, a2, 0x140uLL);
}

uint64_t assignWithTake for MusicSubscriptionOffer.SheetPresentationModifier(uint64_t a1, _QWORD *a2)
{
  _QWORD *v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  uint64_t v12;
  __int16 v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  uint64_t v28;
  __int16 v29;

  v2 = a2;
  *(_QWORD *)a1 = *a2;
  swift_release();
  *(_QWORD *)(a1 + 8) = v2[1];
  swift_release();
  *(_BYTE *)(a1 + 16) = *((_BYTE *)v2 + 16);
  v4 = v2[4];
  *(_QWORD *)(a1 + 24) = v2[3];
  *(_QWORD *)(a1 + 32) = v4;
  swift_bridgeObjectRelease();
  v5 = v2[6];
  *(_QWORD *)(a1 + 40) = v2[5];
  *(_QWORD *)(a1 + 48) = v5;
  swift_bridgeObjectRelease();
  v6 = v2[8];
  *(_QWORD *)(a1 + 56) = v2[7];
  *(_QWORD *)(a1 + 64) = v6;
  swift_bridgeObjectRelease();
  v7 = v2[10];
  *(_QWORD *)(a1 + 72) = v2[9];
  *(_QWORD *)(a1 + 80) = v7;
  swift_bridgeObjectRelease();
  v8 = v2[12];
  *(_QWORD *)(a1 + 88) = v2[11];
  *(_QWORD *)(a1 + 96) = v8;
  swift_bridgeObjectRelease();
  v9 = v2[14];
  *(_QWORD *)(a1 + 104) = v2[13];
  *(_QWORD *)(a1 + 112) = v9;
  swift_bridgeObjectRelease();
  v10 = v2[16];
  *(_QWORD *)(a1 + 120) = v2[15];
  *(_QWORD *)(a1 + 128) = v10;
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 136) = *(_OWORD *)(v2 + 17);
  swift_release();
  *(_BYTE *)(a1 + 152) = *((_BYTE *)v2 + 152);
  *(_QWORD *)(a1 + 160) = v2[20];
  swift_release();
  v11 = *(_OWORD *)(v2 + 21);
  v2 += 21;
  v12 = v2[14];
  v13 = *((_WORD *)v2 + 60);
  v14 = *(void **)(a1 + 168);
  v15 = *(_QWORD *)(a1 + 176);
  v16 = *(_QWORD *)(a1 + 184);
  v17 = *(_QWORD *)(a1 + 192);
  v18 = *(_QWORD *)(a1 + 200);
  v19 = *(_QWORD *)(a1 + 208);
  v20 = *(_QWORD *)(a1 + 216);
  v21 = *(_QWORD *)(a1 + 224);
  v22 = *(_OWORD *)(a1 + 232);
  v23 = *(_OWORD *)(a1 + 248);
  *(_OWORD *)(a1 + 168) = v11;
  v24 = *((_OWORD *)v2 + 2);
  *(_OWORD *)(a1 + 184) = *((_OWORD *)v2 + 1);
  *(_OWORD *)(a1 + 200) = v24;
  v25 = *((_OWORD *)v2 + 4);
  *(_OWORD *)(a1 + 216) = *((_OWORD *)v2 + 3);
  *(_OWORD *)(a1 + 232) = v25;
  v26 = *((_OWORD *)v2 + 6);
  *(_OWORD *)(a1 + 248) = *((_OWORD *)v2 + 5);
  v27 = *(_OWORD *)(a1 + 264);
  v28 = *(_QWORD *)(a1 + 280);
  v29 = *(_WORD *)(a1 + 288);
  *(_OWORD *)(a1 + 264) = v26;
  *(_QWORD *)(a1 + 280) = v12;
  *(_WORD *)(a1 + 288) = v13;
  sub_226EF42A0(v14, v15, v16, v17, v18, v19, v20, v21, v22, *((uint64_t *)&v22 + 1), v23, *((uint64_t *)&v23 + 1), v27, *((uint64_t *)&v27 + 1), v28, v29, SHIBYTE(v29));
  *(_QWORD *)(a1 + 296) = v2[16];
  swift_release();
  *(_BYTE *)(a1 + 304) = *((_BYTE *)v2 + 136);
  *(_QWORD *)(a1 + 312) = v2[18];
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for MusicSubscriptionOffer.SheetPresentationModifier(uint64_t a1, int a2)
{
  unint64_t v2;

  if (a2)
  {
    if (a2 < 0 && *(_BYTE *)(a1 + 320))
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

uint64_t storeEnumTagSinglePayload for MusicSubscriptionOffer.SheetPresentationModifier(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_QWORD *)(result + 312) = 0;
    *(_OWORD *)(result + 248) = 0u;
    *(_OWORD *)(result + 232) = 0u;
    *(_OWORD *)(result + 216) = 0u;
    *(_OWORD *)(result + 200) = 0u;
    *(_OWORD *)(result + 184) = 0u;
    *(_OWORD *)(result + 168) = 0u;
    *(_OWORD *)(result + 152) = 0u;
    *(_OWORD *)(result + 136) = 0u;
    *(_OWORD *)(result + 120) = 0u;
    *(_OWORD *)(result + 104) = 0u;
    *(_OWORD *)(result + 88) = 0u;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_OWORD *)(result + 296) = 0u;
    *(_OWORD *)(result + 280) = 0u;
    *(_OWORD *)(result + 264) = 0u;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 320) = 1;
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
    *(_BYTE *)(result + 320) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for MusicSubscriptionOffer.SheetPresentationModifier()
{
  return &type metadata for MusicSubscriptionOffer.SheetPresentationModifier;
}

uint64_t sub_226EF4D3C()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_226EF4D4C(uint64_t a1)
{
  uint64_t v2;
  __int16 v3;
  __int128 v5;
  uint64_t v6[3];
  uint64_t v7[2];
  int v8[2];
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;

  v14 = *(_QWORD *)(a1 + 176);
  v15 = *(void **)(a1 + 168);
  v12 = *(_QWORD *)(a1 + 192);
  v13 = *(_QWORD *)(a1 + 184);
  v10 = *(_QWORD *)(a1 + 208);
  v11 = *(_QWORD *)(a1 + 200);
  v9 = *(_QWORD *)(a1 + 216);
  *(_QWORD *)v8 = *(_QWORD *)(a1 + 224);
  *(_OWORD *)v7 = *(_OWORD *)(a1 + 232);
  *(_OWORD *)v6 = *(_OWORD *)(a1 + 248);
  v5 = *(_OWORD *)(a1 + 264);
  v2 = *(_QWORD *)(a1 + 280);
  v3 = *(_WORD *)(a1 + 288);
  swift_retain();
  swift_retain();
  swift_retain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_retain();
  sub_226EF4404(v15, v14, v13, v12, v11, v10, v9, v8[0], v7[0], v7[1], v6[0], v6[1], v5, *((uint64_t *)&v5 + 1), v2, v3, SHIBYTE(v3));
  swift_retain();
  swift_retain();
  return a1;
}

double sub_226EF4ECC(int a1, char *a2)
{
  uint64_t v2;
  double result;

  *(_QWORD *)&result = sub_226EF1F74(a1, a2, (void *)(v2 + 16)).n128_u64[0];
  return result;
}

unint64_t sub_226EF4ED4()
{
  unint64_t result;
  uint64_t v1;

  result = qword_2558AC920;
  if (!qword_2558AC920)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2558AC918);
    result = MEMORY[0x2276A650C](MEMORY[0x24BDEFB78], v1);
    atomic_store(result, (unint64_t *)&qword_2558AC920);
  }
  return result;
}

unint64_t sub_226EF4F18()
{
  unint64_t result;

  result = qword_2558AC928;
  if (!qword_2558AC928)
  {
    result = MEMORY[0x2276A650C](&unk_226F02984, &type metadata for MusicSubscriptionOffer.SheetPresentationModifier.PresentationContext);
    atomic_store(result, (unint64_t *)&qword_2558AC928);
  }
  return result;
}

_QWORD *sub_226EF4F58(uint64_t a1, _BYTE *a2)
{
  return sub_226EF2E00(a1, a2);
}

unint64_t sub_226EF4F60()
{
  unint64_t result;
  uint64_t v1;
  unint64_t v2;

  result = qword_2558AC938;
  if (!qword_2558AC938)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2558AC8E0);
    v2 = sub_226EF4FC4();
    result = MEMORY[0x2276A650C](MEMORY[0x24BEE4AB8], v1, &v2);
    atomic_store(result, (unint64_t *)&qword_2558AC938);
  }
  return result;
}

unint64_t sub_226EF4FC4()
{
  unint64_t result;

  result = qword_2558AC940;
  if (!qword_2558AC940)
  {
    result = MEMORY[0x2276A650C](&unk_226F03314, &_s18FailureAlertReasonON);
    atomic_store(result, (unint64_t *)&qword_2558AC940);
  }
  return result;
}

void sub_226EF5004(uint64_t a1, const void *a2)
{
  uint64_t v2;

  sub_226EF2E90(a1, a2, (const void *)(v2 + 16));
}

unint64_t sub_226EF500C()
{
  unint64_t result;

  result = qword_2558AC950;
  if (!qword_2558AC950)
  {
    result = MEMORY[0x2276A650C](&unk_226F03024, &_s17PresentationStateON);
    atomic_store(result, (unint64_t *)&qword_2558AC950);
  }
  return result;
}

uint64_t sub_226EF5048(uint64_t a1)
{
  sub_226EF42A0(*(void **)a1, *(_QWORD *)(a1 + 8), *(_QWORD *)(a1 + 16), *(_QWORD *)(a1 + 24), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 80), *(_QWORD *)(a1 + 88), *(_QWORD *)(a1 + 96), *(_QWORD *)(a1 + 104), *(_QWORD *)(a1 + 112), *(_WORD *)(a1 + 120), HIBYTE(*(_WORD *)(a1 + 120)));
  return a1;
}

uint64_t objectdestroyTm()
{
  OUTLINED_FUNCTION_3_1();
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  OUTLINED_FUNCTION_0_4();
  swift_release();
  swift_release();
  return OUTLINED_FUNCTION_1_3();
}

void *sub_226EF5138@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_226EF32AC(v1 + 16, a1);
}

unint64_t sub_226EF5140()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_2558AC968;
  if (!qword_2558AC968)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2558AC960);
    v2[0] = sub_226EF51AC();
    v2[1] = MEMORY[0x24BDF1050];
    result = MEMORY[0x2276A650C](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_2558AC968);
  }
  return result;
}

unint64_t sub_226EF51AC()
{
  unint64_t result;

  result = qword_2558AC970;
  if (!qword_2558AC970)
  {
    result = MEMORY[0x2276A650C](&unk_226F02EE8, &type metadata for CloudServiceSetupView);
    atomic_store(result, (unint64_t *)&qword_2558AC970);
  }
  return result;
}

uint64_t sub_226EF51E8(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2558AC978);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_226EF5230(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2558AC978);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_226EF5270()
{
  return sub_226F013E0();
}

uint64_t sub_226EF5290(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v6;

  v2 = sub_226F01368();
  MEMORY[0x24BDAC7A8](v2);
  (*(void (**)(char *, uint64_t))(v4 + 16))((char *)&v6 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0), a1);
  return sub_226F013EC();
}

uint64_t sub_226EF5310(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = _s20FailureAlertModifierVMa();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_226EF5354(uint64_t a1)
{
  if (*(unsigned __int8 *)(a1 + 121) <= 1u)
    return *(unsigned __int8 *)(a1 + 121);
  else
    return (*(_DWORD *)a1 + 2);
}

uint64_t sub_226EF536C()
{
  uint64_t v0;

  OUTLINED_FUNCTION_3_1();
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  OUTLINED_FUNCTION_0_4();
  swift_release();
  swift_release();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return OUTLINED_FUNCTION_1_3();
}

void sub_226EF5438(char a1, void *a2)
{
  uint64_t v2;

  sub_226EF3514(a1, a2, v2 + 16, *(void **)(v2 + 336), (uint64_t *)(v2 + 344));
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

uint64_t sub_226EF5460(uint64_t result)
{
  *(_BYTE *)(result + 121) = 0;
  return result;
}

uint64_t sub_226EF5468(uint64_t a1)
{
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t sub_226EF54F0(uint64_t result)
{
  *(_BYTE *)(result + 121) = 1;
  return result;
}

uint64_t sub_226EF54FC(uint64_t a1)
{
  sub_226EF4404(*(id *)a1, *(_QWORD *)(a1 + 8), *(_QWORD *)(a1 + 16), *(_QWORD *)(a1 + 24), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 80), *(_QWORD *)(a1 + 88), *(_QWORD *)(a1 + 96), *(_QWORD *)(a1 + 104), *(_QWORD *)(a1 + 112), *(_WORD *)(a1 + 120), HIBYTE(*(_WORD *)(a1 + 120)));
  swift_retain();
  return a1;
}

uint64_t sub_226EF5568(uint64_t a1)
{
  sub_226EF42A0(*(void **)a1, *(_QWORD *)(a1 + 8), *(_QWORD *)(a1 + 16), *(_QWORD *)(a1 + 24), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 80), *(_QWORD *)(a1 + 88), *(_QWORD *)(a1 + 96), *(_QWORD *)(a1 + 104), *(_QWORD *)(a1 + 112), *(_WORD *)(a1 + 120), HIBYTE(*(_WORD *)(a1 + 120)));
  swift_release();
  return a1;
}

unint64_t sub_226EF55D4()
{
  unint64_t result;

  result = qword_2558AC990;
  if (!qword_2558AC990)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_2558AC990);
  }
  return result;
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(_BYTE *)(*(_QWORD *)(a1 - 8) + 82) & 2) != 0)
    return *(_QWORD *)a2;
  return a2;
}

uint64_t destroy for MusicSubscriptionOffer.SheetPresentationModifier.PresentationContext()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for MusicSubscriptionOffer.SheetPresentationModifier.PresentationContext(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  *(_BYTE *)a1 = *(_BYTE *)a2;
  v3 = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  *(_QWORD *)(a1 + 16) = v3;
  v4 = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 32) = v4;
  v5 = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 48) = v5;
  v6 = *(_QWORD *)(a2 + 64);
  *(_QWORD *)(a1 + 56) = *(_QWORD *)(a2 + 56);
  *(_QWORD *)(a1 + 64) = v6;
  v7 = *(_QWORD *)(a2 + 80);
  *(_QWORD *)(a1 + 72) = *(_QWORD *)(a2 + 72);
  *(_QWORD *)(a1 + 80) = v7;
  v8 = *(_QWORD *)(a2 + 96);
  *(_QWORD *)(a1 + 88) = *(_QWORD *)(a2 + 88);
  *(_QWORD *)(a1 + 96) = v8;
  v9 = *(_QWORD *)(a2 + 112);
  *(_QWORD *)(a1 + 104) = *(_QWORD *)(a2 + 104);
  *(_QWORD *)(a1 + 112) = v9;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for MusicSubscriptionOffer.SheetPresentationModifier.PresentationContext(uint64_t a1, uint64_t a2)
{
  *(_BYTE *)a1 = *(_BYTE *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 56) = *(_QWORD *)(a2 + 56);
  *(_QWORD *)(a1 + 64) = *(_QWORD *)(a2 + 64);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 72) = *(_QWORD *)(a2 + 72);
  *(_QWORD *)(a1 + 80) = *(_QWORD *)(a2 + 80);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 88) = *(_QWORD *)(a2 + 88);
  *(_QWORD *)(a1 + 96) = *(_QWORD *)(a2 + 96);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 104) = *(_QWORD *)(a2 + 104);
  *(_QWORD *)(a1 + 112) = *(_QWORD *)(a2 + 112);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

void *__swift_memcpy120_8(void *a1, const void *a2)
{
  return memcpy(a1, a2, 0x78uLL);
}

uint64_t assignWithTake for MusicSubscriptionOffer.SheetPresentationModifier.PresentationContext(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  *(_BYTE *)a1 = *(_BYTE *)a2;
  v4 = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  *(_QWORD *)(a1 + 16) = v4;
  swift_bridgeObjectRelease();
  v5 = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 32) = v5;
  swift_bridgeObjectRelease();
  v6 = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 48) = v6;
  swift_bridgeObjectRelease();
  v7 = *(_QWORD *)(a2 + 64);
  *(_QWORD *)(a1 + 56) = *(_QWORD *)(a2 + 56);
  *(_QWORD *)(a1 + 64) = v7;
  swift_bridgeObjectRelease();
  v8 = *(_QWORD *)(a2 + 80);
  *(_QWORD *)(a1 + 72) = *(_QWORD *)(a2 + 72);
  *(_QWORD *)(a1 + 80) = v8;
  swift_bridgeObjectRelease();
  v9 = *(_QWORD *)(a2 + 96);
  *(_QWORD *)(a1 + 88) = *(_QWORD *)(a2 + 88);
  *(_QWORD *)(a1 + 96) = v9;
  swift_bridgeObjectRelease();
  v10 = *(_QWORD *)(a2 + 112);
  *(_QWORD *)(a1 + 104) = *(_QWORD *)(a2 + 104);
  *(_QWORD *)(a1 + 112) = v10;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for MusicSubscriptionOffer.SheetPresentationModifier.PresentationContext(uint64_t a1, int a2)
{
  unint64_t v2;

  if (a2)
  {
    if (a2 < 0 && *(_BYTE *)(a1 + 120))
    {
      LODWORD(v2) = *(_DWORD *)a1 + 0x7FFFFFFF;
    }
    else
    {
      v2 = *(_QWORD *)(a1 + 16);
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

uint64_t storeEnumTagSinglePayload for MusicSubscriptionOffer.SheetPresentationModifier.PresentationContext(uint64_t result, int a2, int a3)
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
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 120) = 1;
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
    *(_BYTE *)(result + 120) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for MusicSubscriptionOffer.SheetPresentationModifier.PresentationContext()
{
  return &type metadata for MusicSubscriptionOffer.SheetPresentationModifier.PresentationContext;
}

unint64_t sub_226EF598C()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD v4[6];

  result = qword_2558AC9A0;
  if (!qword_2558AC9A0)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2558AC988);
    v2 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2558AC900);
    v3 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2558AC960);
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2558AC8F8);
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2558AC8F0);
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2558AC8E0);
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2558AC918);
    sub_226EF4ED4();
    sub_226EF4F18();
    swift_getOpaqueTypeConformance2();
    sub_226EF4F60();
    swift_getOpaqueTypeConformance2();
    sub_226EF500C();
    v4[2] = v2;
    v4[3] = v3;
    v4[4] = swift_getOpaqueTypeConformance2();
    v4[5] = sub_226EF5140();
    v4[0] = swift_getOpaqueTypeConformance2();
    v4[1] = sub_226EEA470(&qword_2558AC9A8, (uint64_t (*)(uint64_t))_s20FailureAlertModifierVMa, (uint64_t)&unk_226F033C8);
    result = MEMORY[0x2276A650C](MEMORY[0x24BDED308], v1, v4);
    atomic_store(result, (unint64_t *)&qword_2558AC9A0);
  }
  return result;
}

void OUTLINED_FUNCTION_0_4()
{
  uint64_t v0;
  uint64_t v1;

  sub_226EF42A0(*(void **)(v1 + 184), *(_QWORD *)(v1 + 192), *(_QWORD *)(v1 + 200), *(_QWORD *)(v1 + 208), *(_QWORD *)(v1 + 216), *(_QWORD *)(v1 + 224), *(_QWORD *)(v1 + 232), *(_QWORD *)(v1 + 240), *(_QWORD *)(v1 + 248), *(_QWORD *)(v1 + 256), *(_QWORD *)(v0 + 248), *(_QWORD *)(v0 + 256), *(_QWORD *)(v1 + 280), *(_QWORD *)(v1 + 288), *(_QWORD *)(v1 + 296), *(_WORD *)(v1 + 304), HIBYTE(*(_WORD *)(v1 + 304)));
}

uint64_t OUTLINED_FUNCTION_1_3()
{
  return swift_deallocObject();
}

uint64_t OUTLINED_FUNCTION_2_2()
{
  return sub_226F015A8();
}

uint64_t OUTLINED_FUNCTION_3_1()
{
  return swift_release();
}

uint64_t ArtworkImage._Proxy.artwork.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;

  v3 = OUTLINED_FUNCTION_23();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 16))(a1, v1, v3);
}

double ArtworkImage._Proxy.size.getter()
{
  uint64_t v0;

  return *(double *)(v0 + *(int *)(OUTLINED_FUNCTION_0_5() + 20));
}

uint64_t type metadata accessor for ArtworkImage._Proxy()
{
  uint64_t result;

  result = qword_253F42DF8;
  if (!qword_253F42DF8)
    return swift_getSingletonMetadata();
  return result;
}

void *ArtworkImage._Proxy.image.getter()
{
  uint64_t v0;
  void *v1;
  id v2;

  v1 = *(void **)(v0 + *(int *)(OUTLINED_FUNCTION_0_5() + 24));
  v2 = v1;
  return v1;
}

void static ArtworkImage._Proxy.== infix(_:_:)(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  double v6;
  double v7;
  double *v8;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  id v14;

  if ((sub_226F016EC() & 1) != 0)
  {
    v4 = OUTLINED_FUNCTION_0_5();
    v5 = *(int *)(v4 + 20);
    v6 = *(double *)(a1 + v5);
    v7 = *(double *)(a1 + v5 + 8);
    v8 = (double *)(a2 + v5);
    if (v6 == *v8 && v7 == v8[1])
    {
      v10 = *(int *)(v4 + 24);
      v11 = *(void **)(a1 + v10);
      v12 = *(void **)(a2 + v10);
      if (v11)
      {
        if (v12)
        {
          sub_226EF5CF0();
          v13 = v12;
          v14 = v11;
          sub_226F01818();

        }
      }
    }
  }
  OUTLINED_FUNCTION_2_0();
}

unint64_t sub_226EF5CF0()
{
  unint64_t result;

  result = qword_253F42DE0;
  if (!qword_253F42DE0)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_253F42DE0);
  }
  return result;
}

uint64_t *_s6_ProxyVwCP(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;
  uint64_t v11;

  v5 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v11 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v11 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    v7 = sub_226F016F8();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a1, a2, v7);
    v8 = *(int *)(a3 + 24);
    *(_OWORD *)((char *)a1 + *(int *)(a3 + 20)) = *(_OWORD *)((char *)a2 + *(int *)(a3 + 20));
    v9 = *(void **)((char *)a2 + v8);
    *(uint64_t *)((char *)a1 + v8) = (uint64_t)v9;
    v10 = v9;
  }
  return a1;
}

void _s6_ProxyVwxx(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_226F016F8();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(a1, v4);

}

uint64_t _s6_ProxyVwcp(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;

  v6 = sub_226F016F8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(a1, a2, v6);
  v7 = *(int *)(a3 + 24);
  *(_OWORD *)(a1 + *(int *)(a3 + 20)) = *(_OWORD *)(a2 + *(int *)(a3 + 20));
  v8 = *(void **)(a2 + v7);
  *(_QWORD *)(a1 + v7) = v8;
  v9 = v8;
  return a1;
}

uint64_t _s6_ProxyVwca(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  _QWORD *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;

  v6 = sub_226F016F8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 24))(a1, a2, v6);
  v7 = *(int *)(a3 + 20);
  v8 = (_QWORD *)(a1 + v7);
  v9 = (_QWORD *)(a2 + v7);
  *v8 = *v9;
  v8[1] = v9[1];
  v10 = *(int *)(a3 + 24);
  v11 = *(void **)(a1 + v10);
  v12 = *(void **)(a2 + v10);
  *(_QWORD *)(a1 + v10) = v12;
  v13 = v12;

  return a1;
}

uint64_t _s6_ProxyVwtk(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;

  v6 = sub_226F016F8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 32))(a1, a2, v6);
  v7 = *(int *)(a3 + 24);
  *(_OWORD *)(a1 + *(int *)(a3 + 20)) = *(_OWORD *)(a2 + *(int *)(a3 + 20));
  *(_QWORD *)(a1 + v7) = *(_QWORD *)(a2 + v7);
  return a1;
}

uint64_t _s6_ProxyVwta(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  void *v8;

  v6 = sub_226F016F8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 40))(a1, a2, v6);
  v7 = *(int *)(a3 + 24);
  *(_OWORD *)(a1 + *(int *)(a3 + 20)) = *(_OWORD *)(a2 + *(int *)(a3 + 20));
  v8 = *(void **)(a1 + v7);
  *(_QWORD *)(a1 + v7) = *(_QWORD *)(a2 + v7);

  return a1;
}

uint64_t _s6_ProxyVwet()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

void sub_226EF5FD0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = OUTLINED_FUNCTION_23();
  if (*(_DWORD *)(*(_QWORD *)(v4 - 8) + 84) == (_DWORD)a2)
    __swift_getEnumTagSinglePayload(a1, a2, v4);
  else
    OUTLINED_FUNCTION_2_0();
}

uint64_t _s6_ProxyVwst()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_226EF6054(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result;

  result = OUTLINED_FUNCTION_23();
  if (*(_DWORD *)(*(_QWORD *)(result - 8) + 84) == a3)
    return __swift_storeEnumTagSinglePayload(a1, a2, a2, result);
  *(_QWORD *)(a1 + *(int *)(a4 + 24)) = a2;
  return result;
}

uint64_t sub_226EF60C4()
{
  uint64_t result;
  unint64_t v1;

  result = sub_226F016F8();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

ValueMetadata *_s18ProxyPreferenceKeyVMa()
{
  return &_s18ProxyPreferenceKeyVN;
}

uint64_t sub_226EF6150()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_253F42E38);
  __swift_allocate_value_buffer(v0, qword_2558AE0F0);
  v1 = __swift_project_value_buffer(v0, (uint64_t)qword_2558AE0F0);
  v2 = type metadata accessor for ArtworkImage._Proxy();
  return __swift_storeEnumTagSinglePayload(v1, 1, 1, v2);
}

uint64_t sub_226EF61B0()
{
  uint64_t v0;

  if (qword_2558AC720 != -1)
    swift_once();
  v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_253F42E38);
  return __swift_project_value_buffer(v0, (uint64_t)qword_2558AE0F0);
}

uint64_t sub_226EF61FC(uint64_t a1, void (*a2)(void))
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v12;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_253F42E38);
  v5 = MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v12 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v5);
  v9 = (char *)&v12 - v8;
  sub_226EF6324(a1, (uint64_t)v7);
  v10 = OUTLINED_FUNCTION_0_5();
  if (__swift_getEnumTagSinglePayload((uint64_t)v7, 1, v10) == 1)
  {
    a2();
    sub_226EEADD0((uint64_t)v7);
  }
  else
  {
    sub_226EF636C((uint64_t)v7, (uint64_t)v9);
    __swift_storeEnumTagSinglePayload((uint64_t)v9, 0, 1, v10);
  }
  return sub_226EF6324((uint64_t)v9, a1);
}

uint64_t sub_226EF62F4@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;

  v2 = sub_226EF61B0();
  return sub_226EEBA54(v2, a1);
}

uint64_t sub_226EF6324(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_253F42E38);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_226EF636C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for ArtworkImage._Proxy();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
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

uint64_t OUTLINED_FUNCTION_0_5()
{
  return type metadata accessor for ArtworkImage._Proxy();
}

uint64_t sub_226EF63F8(uint64_t a1)
{
  return sub_226EF643C(a1, qword_2558AE108);
}

uint64_t sub_226EF6418(uint64_t a1)
{
  return sub_226EF643C(a1, qword_2558AE120);
}

uint64_t sub_226EF643C(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = sub_226F012E4();
  __swift_allocate_value_buffer(v3, a2);
  __swift_project_value_buffer(v3, (uint64_t)a2);
  return sub_226F012D8();
}

_QWORD *sub_226EF64B0(_QWORD *a1, _QWORD *a2, int *a3)
{
  int v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  _QWORD *v12;
  uint64_t v13;
  _QWORD *v14;
  _QWORD *v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  char v20;
  uint64_t v21;
  char *v22;
  char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  __int128 v27;
  uint64_t v28;
  char *v29;
  char *v30;
  uint64_t v31;
  char v32;

  v5 = *(_DWORD *)(*((_QWORD *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v26 = *a2;
    *a1 = *a2;
    a1 = (_QWORD *)(v26 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    v7 = sub_226F016F8();
    (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a1, a2, v7);
    v8 = a3[6];
    *(_QWORD *)((char *)a1 + a3[5]) = *(_QWORD *)((char *)a2 + a3[5]);
    memcpy((char *)a1 + v8, (char *)a2 + v8, 0x60uLL);
    v9 = a3[7];
    v10 = a3[8];
    v11 = (_QWORD *)((char *)a1 + v9);
    v12 = (_QWORD *)((char *)a2 + v9);
    v13 = v12[1];
    *v11 = *v12;
    v11[1] = v13;
    v14 = (_QWORD *)((char *)a1 + v10);
    v15 = (_QWORD *)((char *)a2 + v10);
    v16 = v15[1];
    *v14 = *v15;
    v14[1] = v16;
    v17 = a3[10];
    *((_BYTE *)a1 + a3[9]) = *((_BYTE *)a2 + a3[9]);
    v18 = (char *)a1 + v17;
    v19 = *(_QWORD *)((char *)a2 + v17);
    v20 = *((_BYTE *)a2 + v17 + 8);
    swift_retain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    sub_226EF6658(v19, v20);
    *(_QWORD *)v18 = v19;
    v18[8] = v20;
    v21 = a3[11];
    v22 = (char *)a1 + v21;
    v23 = (char *)a2 + v21;
    if ((*((_BYTE *)a2 + v21 + 40) & 1) != 0)
    {
      v24 = *((_QWORD *)v23 + 3);
      if (v24)
      {
        v25 = *((_QWORD *)v23 + 4);
        *((_QWORD *)v22 + 3) = v24;
        *((_QWORD *)v22 + 4) = v25;
        (**(void (***)(char *))(v24 - 8))(v22);
      }
      else
      {
        v27 = *((_OWORD *)v23 + 1);
        *(_OWORD *)v22 = *(_OWORD *)v23;
        *((_OWORD *)v22 + 1) = v27;
        *((_QWORD *)v22 + 4) = *((_QWORD *)v23 + 4);
      }
      v22[40] = 1;
    }
    else
    {
      *(_QWORD *)v22 = *(_QWORD *)v23;
      v22[40] = 0;
      swift_retain();
    }
    v28 = a3[12];
    v29 = (char *)a1 + v28;
    v30 = (char *)a2 + v28;
    v31 = *(_QWORD *)v30;
    v32 = v30[8];
    j__swift_retain();
    *(_QWORD *)v29 = v31;
    v29[8] = v32;
  }
  return a1;
}

uint64_t sub_226EF6658(uint64_t a1, char a2)
{
  uint64_t result;

  if ((a2 & 1) == 0)
    return swift_retain();
  return result;
}

uint64_t sub_226EF6668(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;

  v4 = sub_226F016F8();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(a1, v4);
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_226EF671C(*(_QWORD *)(a1 + *(int *)(a2 + 40)), *(_BYTE *)(a1 + *(int *)(a2 + 40) + 8));
  v5 = a1 + *(int *)(a2 + 44);
  if ((*(_BYTE *)(v5 + 40) & 1) != 0)
  {
    if (*(_QWORD *)(v5 + 24))
      __swift_destroy_boxed_opaque_existential_1(v5);
  }
  else
  {
    swift_release();
  }
  return j__swift_release();
}

uint64_t sub_226EF671C(uint64_t a1, char a2)
{
  uint64_t result;

  if ((a2 & 1) == 0)
    return swift_release();
  return result;
}

uint64_t sub_226EF672C(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  _QWORD *v11;
  uint64_t v12;
  _QWORD *v13;
  _QWORD *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  __int128 v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  char v30;

  v6 = sub_226F016F8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(a1, a2, v6);
  v7 = a3[6];
  *(_QWORD *)(a1 + a3[5]) = *(_QWORD *)(a2 + a3[5]);
  memcpy((void *)(a1 + v7), (const void *)(a2 + v7), 0x60uLL);
  v8 = a3[7];
  v9 = a3[8];
  v10 = (_QWORD *)(a1 + v8);
  v11 = (_QWORD *)(a2 + v8);
  v12 = v11[1];
  *v10 = *v11;
  v10[1] = v12;
  v13 = (_QWORD *)(a1 + v9);
  v14 = (_QWORD *)(a2 + v9);
  v15 = v14[1];
  *v13 = *v14;
  v13[1] = v15;
  v16 = a3[10];
  *(_BYTE *)(a1 + a3[9]) = *(_BYTE *)(a2 + a3[9]);
  v17 = a1 + v16;
  v18 = *(_QWORD *)(a2 + v16);
  v19 = *(_BYTE *)(a2 + v16 + 8);
  swift_retain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_226EF6658(v18, v19);
  *(_QWORD *)v17 = v18;
  *(_BYTE *)(v17 + 8) = v19;
  v20 = a3[11];
  v21 = a1 + v20;
  v22 = a2 + v20;
  if ((*(_BYTE *)(a2 + v20 + 40) & 1) != 0)
  {
    v23 = *(_QWORD *)(v22 + 24);
    if (v23)
    {
      v24 = *(_QWORD *)(v22 + 32);
      *(_QWORD *)(v21 + 24) = v23;
      *(_QWORD *)(v21 + 32) = v24;
      (**(void (***)(uint64_t))(v23 - 8))(v21);
    }
    else
    {
      v25 = *(_OWORD *)(v22 + 16);
      *(_OWORD *)v21 = *(_OWORD *)v22;
      *(_OWORD *)(v21 + 16) = v25;
      *(_QWORD *)(v21 + 32) = *(_QWORD *)(v22 + 32);
    }
    *(_BYTE *)(v21 + 40) = 1;
  }
  else
  {
    *(_QWORD *)v21 = *(_QWORD *)v22;
    *(_BYTE *)(v21 + 40) = 0;
    swift_retain();
  }
  v26 = a3[12];
  v27 = a1 + v26;
  v28 = (uint64_t *)(a2 + v26);
  v29 = *v28;
  v30 = *((_BYTE *)v28 + 8);
  j__swift_retain();
  *(_QWORD *)v27 = v29;
  *(_BYTE *)(v27 + 8) = v30;
  return a1;
}

uint64_t sub_226EF68A8(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD *v14;
  _QWORD *v15;
  uint64_t v16;
  _QWORD *v17;
  _QWORD *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  char v23;
  uint64_t v24;
  char v25;
  uint64_t v26;
  uint64_t v27;
  __int128 *v28;
  uint64_t v29;
  __int128 v30;
  __int128 v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  char v36;

  v6 = sub_226F016F8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 24))(a1, a2, v6);
  *(_QWORD *)(a1 + a3[5]) = *(_QWORD *)(a2 + a3[5]);
  swift_retain();
  swift_release();
  v7 = a3[6];
  v8 = a1 + v7;
  v9 = a2 + v7;
  *(_QWORD *)v8 = *(_QWORD *)v9;
  *(_QWORD *)(v8 + 8) = *(_QWORD *)(v9 + 8);
  v10 = *(_QWORD *)(v9 + 16);
  *(_BYTE *)(v8 + 24) = *(_BYTE *)(v9 + 24);
  *(_QWORD *)(v8 + 16) = v10;
  v11 = *(_QWORD *)(v9 + 32);
  *(_BYTE *)(v8 + 40) = *(_BYTE *)(v9 + 40);
  *(_QWORD *)(v8 + 32) = v11;
  v12 = *(_QWORD *)(v9 + 48);
  *(_BYTE *)(v8 + 56) = *(_BYTE *)(v9 + 56);
  *(_QWORD *)(v8 + 48) = v12;
  *(_BYTE *)(v8 + 57) = *(_BYTE *)(v9 + 57);
  *(_QWORD *)(v8 + 64) = *(_QWORD *)(v9 + 64);
  *(_QWORD *)(v8 + 72) = *(_QWORD *)(v9 + 72);
  *(_QWORD *)(v8 + 80) = *(_QWORD *)(v9 + 80);
  *(_QWORD *)(v8 + 88) = *(_QWORD *)(v9 + 88);
  v13 = a3[7];
  v14 = (_QWORD *)(a1 + v13);
  v15 = (_QWORD *)(a2 + v13);
  *v14 = *v15;
  v14[1] = v15[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v16 = a3[8];
  v17 = (_QWORD *)(a1 + v16);
  v18 = (_QWORD *)(a2 + v16);
  *v17 = *v18;
  v17[1] = v18[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + a3[9]) = *(_BYTE *)(a2 + a3[9]);
  v19 = a3[10];
  v20 = a1 + v19;
  v21 = a2 + v19;
  v22 = *(_QWORD *)v21;
  v23 = *(_BYTE *)(v21 + 8);
  sub_226EF6658(*(_QWORD *)v21, v23);
  v24 = *(_QWORD *)v20;
  v25 = *(_BYTE *)(v20 + 8);
  *(_QWORD *)v20 = v22;
  *(_BYTE *)(v20 + 8) = v23;
  sub_226EF671C(v24, v25);
  if (a1 != a2)
  {
    v26 = a3[11];
    v27 = a1 + v26;
    v28 = (__int128 *)(a2 + v26);
    sub_226EF9954(a1 + v26, &qword_253F42D28);
    if ((*((_BYTE *)v28 + 40) & 1) != 0)
    {
      v29 = *((_QWORD *)v28 + 3);
      if (v29)
      {
        *(_QWORD *)(v27 + 24) = v29;
        *(_QWORD *)(v27 + 32) = *((_QWORD *)v28 + 4);
        (**(void (***)(uint64_t, __int128 *))(v29 - 8))(v27, v28);
      }
      else
      {
        v30 = *v28;
        v31 = v28[1];
        *(_QWORD *)(v27 + 32) = *((_QWORD *)v28 + 4);
        *(_OWORD *)v27 = v30;
        *(_OWORD *)(v27 + 16) = v31;
      }
      *(_BYTE *)(v27 + 40) = 1;
    }
    else
    {
      *(_QWORD *)v27 = *(_QWORD *)v28;
      *(_BYTE *)(v27 + 40) = 0;
      swift_retain();
    }
  }
  v32 = a3[12];
  v33 = a1 + v32;
  v34 = (uint64_t *)(a2 + v32);
  v35 = *v34;
  v36 = *((_BYTE *)v34 + 8);
  j__swift_retain();
  *(_QWORD *)v33 = v35;
  *(_BYTE *)(v33 + 8) = v36;
  j__swift_release();
  return a1;
}

uint64_t sub_226EF6AE0(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _OWORD *v14;
  _OWORD *v15;
  __int128 v16;
  uint64_t v17;
  uint64_t v18;

  v6 = sub_226F016F8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 32))(a1, a2, v6);
  v7 = a3[6];
  *(_QWORD *)(a1 + a3[5]) = *(_QWORD *)(a2 + a3[5]);
  memcpy((void *)(a1 + v7), (const void *)(a2 + v7), 0x60uLL);
  v8 = a3[8];
  *(_OWORD *)(a1 + a3[7]) = *(_OWORD *)(a2 + a3[7]);
  *(_OWORD *)(a1 + v8) = *(_OWORD *)(a2 + v8);
  v9 = a3[10];
  *(_BYTE *)(a1 + a3[9]) = *(_BYTE *)(a2 + a3[9]);
  v10 = a1 + v9;
  v11 = a2 + v9;
  *(_QWORD *)v10 = *(_QWORD *)v11;
  *(_BYTE *)(v10 + 8) = *(_BYTE *)(v11 + 8);
  v12 = a3[11];
  v13 = a3[12];
  v14 = (_OWORD *)(a1 + v12);
  v15 = (_OWORD *)(a2 + v12);
  v16 = v15[1];
  *v14 = *v15;
  v14[1] = v16;
  *(_OWORD *)((char *)v14 + 25) = *(_OWORD *)((char *)v15 + 25);
  v17 = a1 + v13;
  v18 = a2 + v13;
  *(_BYTE *)(v17 + 8) = *(_BYTE *)(v18 + 8);
  *(_QWORD *)v17 = *(_QWORD *)v18;
  return a1;
}

uint64_t sub_226EF6BB8(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  _QWORD *v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD *v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t v25;
  char v26;
  uint64_t v27;
  _OWORD *v28;
  _OWORD *v29;
  __int128 v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;

  v6 = sub_226F016F8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 40))(a1, a2, v6);
  *(_QWORD *)(a1 + a3[5]) = *(_QWORD *)(a2 + a3[5]);
  swift_release();
  v7 = a3[6];
  v8 = a3[7];
  v9 = a1 + v7;
  v10 = a2 + v7;
  *(_OWORD *)v9 = *(_OWORD *)v10;
  *(_QWORD *)(v9 + 16) = *(_QWORD *)(v10 + 16);
  *(_BYTE *)(v9 + 24) = *(_BYTE *)(v10 + 24);
  *(_QWORD *)(v9 + 32) = *(_QWORD *)(v10 + 32);
  *(_BYTE *)(v9 + 40) = *(_BYTE *)(v10 + 40);
  *(_QWORD *)(v9 + 48) = *(_QWORD *)(v10 + 48);
  *(_WORD *)(v9 + 56) = *(_WORD *)(v10 + 56);
  v11 = *(_OWORD *)(v10 + 80);
  *(_OWORD *)(v9 + 64) = *(_OWORD *)(v10 + 64);
  *(_OWORD *)(v9 + 80) = v11;
  v12 = (_QWORD *)(a1 + v8);
  v13 = (uint64_t *)(a2 + v8);
  v15 = *v13;
  v14 = v13[1];
  *v12 = v15;
  v12[1] = v14;
  swift_bridgeObjectRelease();
  v16 = a3[8];
  v17 = (_QWORD *)(a1 + v16);
  v18 = (uint64_t *)(a2 + v16);
  v20 = *v18;
  v19 = v18[1];
  *v17 = v20;
  v17[1] = v19;
  swift_bridgeObjectRelease();
  v21 = a3[10];
  *(_BYTE *)(a1 + a3[9]) = *(_BYTE *)(a2 + a3[9]);
  v22 = a1 + v21;
  v23 = (uint64_t *)(a2 + v21);
  v24 = *v23;
  LOBYTE(v23) = *((_BYTE *)v23 + 8);
  v25 = *(_QWORD *)v22;
  v26 = *(_BYTE *)(v22 + 8);
  *(_QWORD *)v22 = v24;
  *(_BYTE *)(v22 + 8) = (_BYTE)v23;
  sub_226EF671C(v25, v26);
  if (a1 != a2)
  {
    v27 = a3[11];
    v28 = (_OWORD *)(a2 + v27);
    v29 = (_OWORD *)(a1 + v27);
    sub_226EF9954(a1 + v27, &qword_253F42D28);
    v30 = v28[1];
    *v29 = *v28;
    v29[1] = v30;
    *(_OWORD *)((char *)v29 + 25) = *(_OWORD *)((char *)v28 + 25);
  }
  v31 = a3[12];
  v32 = a1 + v31;
  v33 = (uint64_t *)(a2 + v31);
  v34 = *v33;
  LOBYTE(v33) = *((_BYTE *)v33 + 8);
  *(_QWORD *)v32 = v34;
  *(_BYTE *)(v32 + 8) = (_BYTE)v33;
  j__swift_release();
  return a1;
}

uint64_t sub_226EF6D30()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

void sub_226EF6D3C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;

  v6 = OUTLINED_FUNCTION_23();
  if (*(_DWORD *)(*(_QWORD *)(v6 - 8) + 84) == (_DWORD)a2)
  {
    OUTLINED_FUNCTION_2_3(a1, a2, v6);
  }
  else
  {
    OUTLINED_FUNCTION_12_1(*(_QWORD *)(a1 + *(int *)(a3 + 20)));
    OUTLINED_FUNCTION_2_0();
  }
}

uint64_t sub_226EF6D94()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

void sub_226EF6DA0(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v8;

  v8 = OUTLINED_FUNCTION_23();
  if (*(_DWORD *)(*(_QWORD *)(v8 - 8) + 84) == a3)
  {
    OUTLINED_FUNCTION_3_2(a1, a2, a2, v8);
  }
  else
  {
    *(_QWORD *)(a1 + *(int *)(a4 + 20)) = (a2 - 1);
    OUTLINED_FUNCTION_2_0();
  }
}

uint64_t _s9BaseImageV18ArtworkLoaderImageVMa(uint64_t a1)
{
  return sub_226EF0634(a1, (uint64_t *)&unk_253F42CB0);
}

uint64_t sub_226EF6E14()
{
  uint64_t result;
  unint64_t v1;

  result = sub_226F016F8();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

_QWORD *sub_226EF6EC0(_QWORD *__dst, char *__src, uint64_t a3)
{
  _QWORD *v4;
  int v5;
  uint64_t v7;
  char *v8;
  char *v9;
  uint64_t v10;
  void (*v11)(char *, char *, uint64_t);
  int *v12;
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
  char *v23;
  uint64_t v24;
  uint64_t v25;
  char *v26;
  char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  __int128 v31;
  uint64_t v32;
  char *v33;
  char *v34;
  uint64_t v35;
  char v36;
  uint64_t v37;
  char *v38;
  char *v39;
  uint64_t v40;
  uint64_t v42;
  char *v43;

  v4 = __dst;
  v5 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v30 = *(_QWORD *)__src;
    *v4 = *(_QWORD *)__src;
    v4 = (_QWORD *)(v30 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    memcpy(__dst, __src, 0x60uLL);
    v4[12] = *((_QWORD *)__src + 12);
    v42 = a3;
    v43 = __src;
    v7 = *(int *)(a3 + 24);
    v8 = (char *)v4 + v7;
    v9 = &__src[v7];
    v10 = sub_226F016F8();
    v11 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v10 - 8) + 16);
    swift_retain();
    v11(v8, v9, v10);
    v12 = (int *)_s9BaseImageV18ArtworkLoaderImageVMa(0);
    *(_QWORD *)&v8[v12[5]] = *(_QWORD *)&v9[v12[5]];
    memcpy(&v8[v12[6]], &v9[v12[6]], 0x60uLL);
    v13 = v12[7];
    v14 = &v8[v13];
    v15 = &v9[v13];
    v16 = *((_QWORD *)v15 + 1);
    *(_QWORD *)v14 = *(_QWORD *)v15;
    *((_QWORD *)v14 + 1) = v16;
    v17 = v12[8];
    v18 = &v8[v17];
    v19 = &v9[v17];
    v20 = *((_QWORD *)v19 + 1);
    *(_QWORD *)v18 = *(_QWORD *)v19;
    *((_QWORD *)v18 + 1) = v20;
    v8[v12[9]] = v9[v12[9]];
    v21 = v12[10];
    v22 = &v8[v21];
    v23 = &v9[v21];
    v24 = *(_QWORD *)v23;
    LOBYTE(v11) = v23[8];
    swift_retain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    sub_226EF6658(v24, (char)v11);
    *(_QWORD *)v22 = v24;
    v22[8] = (char)v11;
    v25 = v12[11];
    v26 = &v8[v25];
    v27 = &v9[v25];
    if ((v9[v25 + 40] & 1) != 0)
    {
      v28 = *((_QWORD *)v27 + 3);
      if (v28)
      {
        v29 = *((_QWORD *)v27 + 4);
        *((_QWORD *)v26 + 3) = v28;
        *((_QWORD *)v26 + 4) = v29;
        (**(void (***)(char *))(v28 - 8))(v26);
      }
      else
      {
        v31 = *((_OWORD *)v27 + 1);
        *(_OWORD *)v26 = *(_OWORD *)v27;
        *((_OWORD *)v26 + 1) = v31;
        *((_QWORD *)v26 + 4) = *((_QWORD *)v27 + 4);
      }
      v26[40] = 1;
    }
    else
    {
      *(_QWORD *)v26 = *(_QWORD *)v27;
      v26[40] = 0;
      swift_retain();
    }
    v32 = v12[12];
    v33 = &v8[v32];
    v34 = &v9[v32];
    v35 = *(_QWORD *)v34;
    v36 = v34[8];
    j__swift_retain();
    *(_QWORD *)v33 = v35;
    v33[8] = v36;
    v37 = *(int *)(v42 + 28);
    v38 = (char *)v4 + v37;
    v39 = &v43[v37];
    v40 = *(_QWORD *)v39;
    LOBYTE(v35) = v39[8];
    sub_226EF6658(*(_QWORD *)v39, v35);
    *(_QWORD *)v38 = v40;
    v38[8] = v35;
  }
  return v4;
}

uint64_t sub_226EF70E8(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  swift_release();
  v4 = a1 + *(int *)(a2 + 24);
  v5 = sub_226F016F8();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(v4, v5);
  v6 = _s9BaseImageV18ArtworkLoaderImageVMa(0);
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_226EF671C(*(_QWORD *)(v4 + *(int *)(v6 + 40)), *(_BYTE *)(v4 + *(int *)(v6 + 40) + 8));
  v7 = v4 + *(int *)(v6 + 44);
  if ((*(_BYTE *)(v7 + 40) & 1) != 0)
  {
    if (*(_QWORD *)(v7 + 24))
      __swift_destroy_boxed_opaque_existential_1(v7);
  }
  else
  {
    swift_release();
  }
  j__swift_release();
  return sub_226EF671C(*(_QWORD *)(a1 + *(int *)(a2 + 28)), *(_BYTE *)(a1 + *(int *)(a2 + 28) + 8));
}

_QWORD *sub_226EF71D4(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v6;
  char *v7;
  char *v8;
  uint64_t v9;
  void (*v10)(char *, char *, uint64_t);
  int *v11;
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
  __int128 v29;
  uint64_t v30;
  char *v31;
  char *v32;
  uint64_t v33;
  char v34;
  uint64_t v35;
  char *v36;
  char *v37;
  uint64_t v38;
  uint64_t v40;
  _QWORD *v41;

  memcpy(a1, a2, 0x60uLL);
  a1[12] = a2[12];
  v40 = a3;
  v41 = a2;
  v6 = *(int *)(a3 + 24);
  v7 = (char *)a1 + v6;
  v8 = (char *)a2 + v6;
  v9 = sub_226F016F8();
  v10 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v9 - 8) + 16);
  swift_retain();
  v10(v7, v8, v9);
  v11 = (int *)_s9BaseImageV18ArtworkLoaderImageVMa(0);
  *(_QWORD *)&v7[v11[5]] = *(_QWORD *)&v8[v11[5]];
  memcpy(&v7[v11[6]], &v8[v11[6]], 0x60uLL);
  v12 = v11[7];
  v13 = &v7[v12];
  v14 = &v8[v12];
  v15 = *((_QWORD *)v14 + 1);
  *(_QWORD *)v13 = *(_QWORD *)v14;
  *((_QWORD *)v13 + 1) = v15;
  v16 = v11[8];
  v17 = &v7[v16];
  v18 = &v8[v16];
  v19 = *((_QWORD *)v18 + 1);
  *(_QWORD *)v17 = *(_QWORD *)v18;
  *((_QWORD *)v17 + 1) = v19;
  v7[v11[9]] = v8[v11[9]];
  v20 = v11[10];
  v21 = &v7[v20];
  v22 = &v8[v20];
  v23 = *(_QWORD *)v22;
  LOBYTE(v10) = v22[8];
  swift_retain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_226EF6658(v23, (char)v10);
  *(_QWORD *)v21 = v23;
  v21[8] = (char)v10;
  v24 = v11[11];
  v25 = &v7[v24];
  v26 = &v8[v24];
  if ((v8[v24 + 40] & 1) != 0)
  {
    v27 = *((_QWORD *)v26 + 3);
    if (v27)
    {
      v28 = *((_QWORD *)v26 + 4);
      *((_QWORD *)v25 + 3) = v27;
      *((_QWORD *)v25 + 4) = v28;
      (**(void (***)(char *))(v27 - 8))(v25);
    }
    else
    {
      v29 = *((_OWORD *)v26 + 1);
      *(_OWORD *)v25 = *(_OWORD *)v26;
      *((_OWORD *)v25 + 1) = v29;
      *((_QWORD *)v25 + 4) = *((_QWORD *)v26 + 4);
    }
    v25[40] = 1;
  }
  else
  {
    *(_QWORD *)v25 = *(_QWORD *)v26;
    v25[40] = 0;
    swift_retain();
  }
  v30 = v11[12];
  v31 = &v7[v30];
  v32 = &v8[v30];
  v33 = *(_QWORD *)v32;
  v34 = v32[8];
  j__swift_retain();
  *(_QWORD *)v31 = v33;
  v31[8] = v34;
  v35 = *(int *)(v40 + 28);
  v36 = (char *)a1 + v35;
  v37 = (char *)v41 + v35;
  v38 = *(_QWORD *)v37;
  LOBYTE(v33) = v37[8];
  sub_226EF6658(*(_QWORD *)v37, v33);
  *(_QWORD *)v36 = v38;
  v36[8] = v33;
  return a1;
}

uint64_t sub_226EF73C8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  int *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  _QWORD *v21;
  _QWORD *v22;
  uint64_t v23;
  _QWORD *v24;
  _QWORD *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  char v30;
  uint64_t v31;
  char v32;
  uint64_t v33;
  uint64_t v34;
  __int128 *v35;
  uint64_t v36;
  __int128 v37;
  __int128 v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t *v41;
  uint64_t v42;
  char v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  char v48;
  uint64_t v49;
  char v50;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  v6 = *(_QWORD *)(a2 + 16);
  *(_BYTE *)(a1 + 24) = *(_BYTE *)(a2 + 24);
  *(_QWORD *)(a1 + 16) = v6;
  v7 = *(_QWORD *)(a2 + 32);
  *(_BYTE *)(a1 + 40) = *(_BYTE *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = v7;
  v8 = *(_QWORD *)(a2 + 48);
  *(_BYTE *)(a1 + 56) = *(_BYTE *)(a2 + 56);
  *(_QWORD *)(a1 + 48) = v8;
  *(_BYTE *)(a1 + 57) = *(_BYTE *)(a2 + 57);
  *(_QWORD *)(a1 + 64) = *(_QWORD *)(a2 + 64);
  *(_QWORD *)(a1 + 72) = *(_QWORD *)(a2 + 72);
  *(_QWORD *)(a1 + 80) = *(_QWORD *)(a2 + 80);
  *(_QWORD *)(a1 + 88) = *(_QWORD *)(a2 + 88);
  *(_QWORD *)(a1 + 96) = *(_QWORD *)(a2 + 96);
  swift_retain();
  swift_release();
  v9 = *(int *)(a3 + 24);
  v10 = a1 + v9;
  v11 = a2 + v9;
  v12 = sub_226F016F8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 24))(v10, v11, v12);
  v13 = (int *)_s9BaseImageV18ArtworkLoaderImageVMa(0);
  *(_QWORD *)(v10 + v13[5]) = *(_QWORD *)(v11 + v13[5]);
  swift_retain();
  swift_release();
  v14 = v13[6];
  v15 = v10 + v14;
  v16 = v11 + v14;
  *(_QWORD *)v15 = *(_QWORD *)v16;
  *(_QWORD *)(v15 + 8) = *(_QWORD *)(v16 + 8);
  v17 = *(_QWORD *)(v16 + 16);
  *(_BYTE *)(v15 + 24) = *(_BYTE *)(v16 + 24);
  *(_QWORD *)(v15 + 16) = v17;
  v18 = *(_QWORD *)(v16 + 32);
  *(_BYTE *)(v15 + 40) = *(_BYTE *)(v16 + 40);
  *(_QWORD *)(v15 + 32) = v18;
  v19 = *(_QWORD *)(v16 + 48);
  *(_BYTE *)(v15 + 56) = *(_BYTE *)(v16 + 56);
  *(_QWORD *)(v15 + 48) = v19;
  *(_BYTE *)(v15 + 57) = *(_BYTE *)(v16 + 57);
  *(_QWORD *)(v15 + 64) = *(_QWORD *)(v16 + 64);
  *(_QWORD *)(v15 + 72) = *(_QWORD *)(v16 + 72);
  *(_QWORD *)(v15 + 80) = *(_QWORD *)(v16 + 80);
  *(_QWORD *)(v15 + 88) = *(_QWORD *)(v16 + 88);
  v20 = v13[7];
  v21 = (_QWORD *)(v10 + v20);
  v22 = (_QWORD *)(v11 + v20);
  *v21 = *v22;
  v21[1] = v22[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v23 = v13[8];
  v24 = (_QWORD *)(v10 + v23);
  v25 = (_QWORD *)(v11 + v23);
  *v24 = *v25;
  v24[1] = v25[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_BYTE *)(v10 + v13[9]) = *(_BYTE *)(v11 + v13[9]);
  v26 = v13[10];
  v27 = v10 + v26;
  v28 = v11 + v26;
  v29 = *(_QWORD *)v28;
  v30 = *(_BYTE *)(v28 + 8);
  sub_226EF6658(*(_QWORD *)v28, v30);
  v31 = *(_QWORD *)v27;
  v32 = *(_BYTE *)(v27 + 8);
  *(_QWORD *)v27 = v29;
  *(_BYTE *)(v27 + 8) = v30;
  sub_226EF671C(v31, v32);
  if (a1 != a2)
  {
    v33 = v13[11];
    v34 = v10 + v33;
    v35 = (__int128 *)(v11 + v33);
    sub_226EF9954(v10 + v33, &qword_253F42D28);
    if ((*((_BYTE *)v35 + 40) & 1) != 0)
    {
      v36 = *((_QWORD *)v35 + 3);
      if (v36)
      {
        *(_QWORD *)(v34 + 24) = v36;
        *(_QWORD *)(v34 + 32) = *((_QWORD *)v35 + 4);
        (**(void (***)(uint64_t, __int128 *))(v36 - 8))(v34, v35);
      }
      else
      {
        v37 = *v35;
        v38 = v35[1];
        *(_QWORD *)(v34 + 32) = *((_QWORD *)v35 + 4);
        *(_OWORD *)v34 = v37;
        *(_OWORD *)(v34 + 16) = v38;
      }
      *(_BYTE *)(v34 + 40) = 1;
    }
    else
    {
      *(_QWORD *)v34 = *(_QWORD *)v35;
      *(_BYTE *)(v34 + 40) = 0;
      swift_retain();
    }
  }
  v39 = v13[12];
  v40 = v10 + v39;
  v41 = (uint64_t *)(v11 + v39);
  v42 = *v41;
  v43 = *((_BYTE *)v41 + 8);
  j__swift_retain();
  *(_QWORD *)v40 = v42;
  *(_BYTE *)(v40 + 8) = v43;
  j__swift_release();
  v44 = *(int *)(a3 + 28);
  v45 = a1 + v44;
  v46 = a2 + v44;
  v47 = *(_QWORD *)v46;
  v48 = *(_BYTE *)(v46 + 8);
  sub_226EF6658(*(_QWORD *)v46, v48);
  v49 = *(_QWORD *)v45;
  v50 = *(_BYTE *)(v45 + 8);
  *(_QWORD *)v45 = v47;
  *(_BYTE *)(v45 + 8) = v48;
  sub_226EF671C(v49, v50);
  return a1;
}

_QWORD *sub_226EF76DC(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v6;
  char *v7;
  char *v8;
  uint64_t v9;
  int *v10;
  uint64_t v11;
  char *v12;
  char *v13;
  uint64_t v14;
  char *v15;
  char *v16;
  __int128 v17;
  uint64_t v18;
  char *v19;
  char *v20;
  uint64_t v21;
  char *v22;
  char *v23;

  memcpy(a1, a2, 0x60uLL);
  a1[12] = a2[12];
  v6 = *(int *)(a3 + 24);
  v7 = (char *)a1 + v6;
  v8 = (char *)a2 + v6;
  v9 = sub_226F016F8();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v9 - 8) + 32))(v7, v8, v9);
  v10 = (int *)_s9BaseImageV18ArtworkLoaderImageVMa(0);
  *(_QWORD *)&v7[v10[5]] = *(_QWORD *)&v8[v10[5]];
  memcpy(&v7[v10[6]], &v8[v10[6]], 0x60uLL);
  *(_OWORD *)&v7[v10[7]] = *(_OWORD *)&v8[v10[7]];
  *(_OWORD *)&v7[v10[8]] = *(_OWORD *)&v8[v10[8]];
  v7[v10[9]] = v8[v10[9]];
  v11 = v10[10];
  v12 = &v7[v11];
  v13 = &v8[v11];
  v12[8] = v13[8];
  *(_QWORD *)v12 = *(_QWORD *)v13;
  v14 = v10[11];
  v15 = &v7[v14];
  v16 = &v8[v14];
  *(_OWORD *)(v15 + 25) = *(_OWORD *)(v16 + 25);
  v17 = *((_OWORD *)v16 + 1);
  *(_OWORD *)v15 = *(_OWORD *)v16;
  *((_OWORD *)v15 + 1) = v17;
  v18 = v10[12];
  v19 = &v7[v18];
  v20 = &v8[v18];
  *(_QWORD *)v19 = *(_QWORD *)v20;
  v19[8] = v20[8];
  v21 = *(int *)(a3 + 28);
  v22 = (char *)a1 + v21;
  v23 = (char *)a2 + v21;
  v22[8] = v23[8];
  *(_QWORD *)v22 = *(_QWORD *)v23;
  return a1;
}

uint64_t sub_226EF7810(uint64_t a1, uint64_t a2, uint64_t a3)
{
  __int128 v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  int *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  __int128 v15;
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
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t v30;
  char v31;
  uint64_t v32;
  _OWORD *v33;
  _OWORD *v34;
  __int128 v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t *v42;
  uint64_t v43;
  uint64_t v44;
  char v45;

  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_BYTE *)(a1 + 24) = *(_BYTE *)(a2 + 24);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_BYTE *)(a1 + 40) = *(_BYTE *)(a2 + 40);
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  *(_WORD *)(a1 + 56) = *(_WORD *)(a2 + 56);
  v6 = *(_OWORD *)(a2 + 80);
  *(_OWORD *)(a1 + 64) = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 80) = v6;
  *(_QWORD *)(a1 + 96) = *(_QWORD *)(a2 + 96);
  swift_release();
  v7 = *(int *)(a3 + 24);
  v8 = a1 + v7;
  v9 = a2 + v7;
  v10 = sub_226F016F8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 40))(v8, v9, v10);
  v11 = (int *)_s9BaseImageV18ArtworkLoaderImageVMa(0);
  *(_QWORD *)(v8 + v11[5]) = *(_QWORD *)(v9 + v11[5]);
  swift_release();
  v12 = v11[6];
  v13 = v8 + v12;
  v14 = v9 + v12;
  *(_OWORD *)v13 = *(_OWORD *)v14;
  *(_QWORD *)(v13 + 16) = *(_QWORD *)(v14 + 16);
  *(_BYTE *)(v13 + 24) = *(_BYTE *)(v14 + 24);
  *(_QWORD *)(v13 + 32) = *(_QWORD *)(v14 + 32);
  *(_BYTE *)(v13 + 40) = *(_BYTE *)(v14 + 40);
  *(_QWORD *)(v13 + 48) = *(_QWORD *)(v14 + 48);
  *(_WORD *)(v13 + 56) = *(_WORD *)(v14 + 56);
  v15 = *(_OWORD *)(v14 + 80);
  *(_OWORD *)(v13 + 64) = *(_OWORD *)(v14 + 64);
  *(_OWORD *)(v13 + 80) = v15;
  v16 = v11[7];
  v17 = (_QWORD *)(v8 + v16);
  v18 = (uint64_t *)(v9 + v16);
  v20 = *v18;
  v19 = v18[1];
  *v17 = v20;
  v17[1] = v19;
  swift_bridgeObjectRelease();
  v21 = v11[8];
  v22 = (_QWORD *)(v8 + v21);
  v23 = (uint64_t *)(v9 + v21);
  v25 = *v23;
  v24 = v23[1];
  *v22 = v25;
  v22[1] = v24;
  swift_bridgeObjectRelease();
  *(_BYTE *)(v8 + v11[9]) = *(_BYTE *)(v9 + v11[9]);
  v26 = v11[10];
  v27 = v8 + v26;
  v28 = (uint64_t *)(v9 + v26);
  v29 = *v28;
  LOBYTE(v28) = *((_BYTE *)v28 + 8);
  v30 = *(_QWORD *)v27;
  v31 = *(_BYTE *)(v27 + 8);
  *(_QWORD *)v27 = v29;
  *(_BYTE *)(v27 + 8) = (_BYTE)v28;
  sub_226EF671C(v30, v31);
  if (a1 != a2)
  {
    v32 = v11[11];
    v33 = (_OWORD *)(v9 + v32);
    v34 = (_OWORD *)(v8 + v32);
    sub_226EF9954(v8 + v32, &qword_253F42D28);
    v35 = v33[1];
    *v34 = *v33;
    v34[1] = v35;
    *(_OWORD *)((char *)v34 + 25) = *(_OWORD *)((char *)v33 + 25);
  }
  v36 = v11[12];
  v37 = v8 + v36;
  v38 = (uint64_t *)(v9 + v36);
  v39 = *v38;
  LOBYTE(v38) = *((_BYTE *)v38 + 8);
  *(_QWORD *)v37 = v39;
  *(_BYTE *)(v37 + 8) = (_BYTE)v38;
  j__swift_release();
  v40 = *(int *)(a3 + 28);
  v41 = a1 + v40;
  v42 = (uint64_t *)(a2 + v40);
  v43 = *v42;
  LOBYTE(v42) = *((_BYTE *)v42 + 8);
  v44 = *(_QWORD *)v41;
  v45 = *(_BYTE *)(v41 + 8);
  *(_QWORD *)v41 = v43;
  *(_BYTE *)(v41 + 8) = (_BYTE)v42;
  sub_226EF671C(v44, v45);
  return a1;
}

uint64_t sub_226EF7A28()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

void sub_226EF7A34(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;

  if ((_DWORD)a2 == 0x7FFFFFFF)
  {
    OUTLINED_FUNCTION_12_1(*(_QWORD *)(a1 + 96));
    OUTLINED_FUNCTION_2_0();
  }
  else
  {
    v6 = OUTLINED_FUNCTION_8_2();
    OUTLINED_FUNCTION_2_3(a1 + *(int *)(a3 + 24), a2, v6);
  }
}

uint64_t sub_226EF7A88()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

void sub_226EF7A94(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v7;

  if (a3 == 0x7FFFFFFF)
  {
    *(_QWORD *)(a1 + 96) = (a2 - 1);
    OUTLINED_FUNCTION_2_0();
  }
  else
  {
    v7 = OUTLINED_FUNCTION_8_2();
    OUTLINED_FUNCTION_3_2(a1 + *(int *)(a4 + 24), a2, a2, v7);
  }
}

uint64_t _s9BaseImageVMa(uint64_t a1)
{
  return sub_226EF0634(a1, (uint64_t *)&unk_253F42CC8);
}

uint64_t sub_226EF7B00()
{
  uint64_t result;
  unint64_t v1;

  result = _s9BaseImageV18ArtworkLoaderImageVMa(319);
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

void sub_226EF7B88(uint64_t a1@<X0>, uint64_t a2@<X1>, const void *a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, _QWORD *a9@<X8>, char *a10)
{
  uint64_t v10;
  int *v16;
  uint64_t v17;
  char v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  uint64_t v22;
  _QWORD *v23;
  _QWORD *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  char v28;

  v16 = (int *)OUTLINED_FUNCTION_8_2();
  OUTLINED_FUNCTION_3_0();
  MEMORY[0x24BDAC7A8](v17);
  OUTLINED_FUNCTION_11_2();
  v18 = *a10;
  v19 = _s9BaseImageVMa(0);
  v20 = (char *)a9 + *(int *)(v19 + 28);
  *(_QWORD *)v20 = swift_getKeyPath();
  v20[8] = 0;
  OUTLINED_FUNCTION_33_0(a9, a3);
  a9[12] = a4;
  v21 = OUTLINED_FUNCTION_23();
  v22 = *(_QWORD *)(v21 - 8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v22 + 16))(v10, a1, v21);
  *(_QWORD *)(v10 + v16[5]) = a2;
  OUTLINED_FUNCTION_33_0((void *)(v10 + v16[6]), a3);
  v23 = (_QWORD *)(v10 + v16[7]);
  *v23 = a5;
  v23[1] = a6;
  v24 = (_QWORD *)(v10 + v16[8]);
  *v24 = a7;
  v24[1] = a8;
  *(_BYTE *)(v10 + v16[9]) = v18;
  v25 = v10 + v16[10];
  *(_QWORD *)v25 = swift_getKeyPath();
  *(_BYTE *)(v25 + 8) = 0;
  v26 = v10 + v16[11];
  *(_QWORD *)v26 = swift_getKeyPath();
  *(_BYTE *)(v26 + 40) = 0;
  v27 = v10 + v16[12];
  type metadata accessor for ArtworkLoadingObserver(0);
  sub_226EF9A40();
  *(_QWORD *)v27 = sub_226F01308();
  *(_BYTE *)(v27 + 8) = v28 & 1;
  (*(void (**)(uint64_t, uint64_t))(v22 + 8))(a1, v21);
  sub_226EF9A80(v10, (uint64_t)a9 + *(int *)(v19 + 24), _s9BaseImageV18ArtworkLoaderImageVMa);
  OUTLINED_FUNCTION_4_1();
}

void sub_226EF7D28(uint64_t a1@<X8>)
{
  char *v1;
  const void *v2;
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
  char v18;
  double v19;
  id v20;
  void *v21;
  id v22;
  _QWORD *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  char v29;
  BOOL v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v36;
  char v37;
  uint64_t v38;
  char v39;
  uint64_t v40;
  uint64_t v41;
  char v42[96];
  char v43[48];

  v2 = v1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_253F43218);
  OUTLINED_FUNCTION_3_0();
  MEMORY[0x24BDAC7A8](v3);
  OUTLINED_FUNCTION_11_0();
  v34 = v4;
  __swift_instantiateConcreteTypeFromMangledName(&qword_253F42E38);
  OUTLINED_FUNCTION_3_0();
  MEMORY[0x24BDAC7A8](v5);
  OUTLINED_FUNCTION_11_0();
  v33 = v6;
  v7 = sub_226F01590();
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7);
  OUTLINED_FUNCTION_0_1();
  v11 = v10 - v9;
  v32 = __swift_instantiateConcreteTypeFromMangledName(&qword_253F42DA8);
  OUTLINED_FUNCTION_3_0();
  MEMORY[0x24BDAC7A8](v12);
  OUTLINED_FUNCTION_0_1();
  v15 = v14 - v13;
  OUTLINED_FUNCTION_33_0(v43, v1);
  swift_getKeyPath();
  v16 = &v1[*(int *)(_s9BaseImageVMa(0) + 28)];
  v17 = *(_QWORD *)v16;
  v18 = v16[8];
  sub_226EF6658(*(_QWORD *)v16, v18);
  v19 = sub_226EF8A34(v17, v18);
  sub_226EF671C(v17, v18);
  sub_226EFE878(v19);
  swift_release();
  OUTLINED_FUNCTION_8_2();
  if (!sub_226EEC238())
  {
    if (qword_253F42CA8 != -1)
      swift_once();
    v20 = (id)qword_253F42CA0;
  }
  sub_226F01584();
  (*(void (**)(uint64_t, _QWORD, uint64_t))(v8 + 104))(v11, *MEMORY[0x24BDF3FD0], v7);
  v31 = sub_226F0159C();
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v11, v7);
  OUTLINED_FUNCTION_33_0(v42, v2);
  v21 = sub_226EEC238();
  if (v21)
  {
    v22 = v21;
    v23 = v2;
  }
  else
  {
    if (qword_253F42CA8 != -1)
      swift_once();
    v23 = v2;
    v22 = (id)qword_253F42CA0;
  }
  objc_msgSend(v22, sel_size);
  v25 = v24;
  v27 = v26;

  v30 = sub_226EFE8D8(v25, v27, 0);
  sub_226F01608();
  sub_226F01338();
  v28 = v23[12];
  swift_retain();
  v29 = sub_226F014B8();
  sub_226EF818C(v33);
  sub_226EF9DF0(v33, v34, &qword_253F42E38);
  sub_226EF9DF0(v34, v15 + *(int *)(v32 + 36), &qword_253F43218);
  *(_QWORD *)v15 = v31;
  *(_QWORD *)(v15 + 8) = 0;
  *(_BYTE *)(v15 + 16) = 1;
  *(_BYTE *)(v15 + 17) = v30;
  *(_WORD *)(v15 + 18) = 0;
  *(_BYTE *)(v15 + 20) = 1;
  *(_QWORD *)(v15 + 24) = v36;
  *(_BYTE *)(v15 + 32) = v37;
  *(_QWORD *)(v15 + 40) = v38;
  *(_BYTE *)(v15 + 48) = v39;
  *(_QWORD *)(v15 + 56) = v40;
  *(_QWORD *)(v15 + 64) = v41;
  *(_QWORD *)(v15 + 72) = v28;
  *(_BYTE *)(v15 + 80) = v29;
  swift_retain();
  swift_retain();
  sub_226EF9954(v34, &qword_253F43218);
  sub_226EF9954(v33, &qword_253F42E38);
  swift_release();
  swift_release();
  sub_226EF9A14(v15, a1, &qword_253F42DA8);
}

void sub_226EF818C(uint64_t a1@<X8>)
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
  char *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  id v22;
  void *v23;
  id v24;
  char v25;
  void *v26;
  id v27;
  uint64_t v28;
  uint64_t v29;
  char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;

  v3 = sub_226F016F8();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v6 = (char *)&v31 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_253F42E38);
  MEMORY[0x24BDAC7A8](v7);
  v9 = (char *)&v31 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_253F42F88);
  MEMORY[0x24BDAC7A8](v10);
  v12 = (char *)&v31 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = _s10ParametersVMa();
  MEMORY[0x24BDAC7A8](v13);
  v15 = (char *)&v31 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v32 = type metadata accessor for ArtworkImage._Proxy();
  v33 = a1;
  __swift_storeEnumTagSinglePayload(a1, 1, 1, v32);
  v16 = v1 + *(int *)(_s9BaseImageVMa(0) + 24);
  v17 = *(_QWORD *)(v16 + *(int *)(_s9BaseImageV18ArtworkLoaderImageVMa(0) + 20))
      + OBJC_IVAR____TtC17_MusicKit_SwiftUI13ArtworkLoader_lastParameters;
  swift_beginAccess();
  sub_226EF9DF0(v17, (uint64_t)v12, &qword_253F42F88);
  if (__swift_getEnumTagSinglePayload((uint64_t)v12, 1, v13) == 1)
  {
    sub_226EF9954((uint64_t)v12, &qword_253F42F88);
  }
  else
  {
    sub_226EF9A80((uint64_t)v12, (uint64_t)v15, (uint64_t (*)(_QWORD))_s10ParametersVMa);
    v31 = v4;
    (*(void (**)(char *, char *, uint64_t))(v4 + 16))(v6, v15, v3);
    v18 = &v15[*(int *)(v13 + 28)];
    v19 = *(_QWORD *)v18;
    v20 = *((_QWORD *)v18 + 1);
    v21 = sub_226EEC238();
    if (v21)
    {
      v22 = v21;
      if (qword_253F42CA8 != -1)
        swift_once();
    }
    else
    {
      if (qword_253F42CA8 != -1)
        swift_once();
      v22 = (id)qword_253F42CA0;
    }
    v23 = (void *)qword_253F42CA0;
    sub_226EF5CF0();
    v24 = v23;
    v25 = sub_226F01818();

    v26 = 0;
    if ((v25 & 1) == 0)
    {
      v26 = sub_226EEC238();
      if (!v26)
      {
        v26 = (void *)qword_253F42CA0;
        v27 = (id)qword_253F42CA0;
      }
    }
    sub_226EEA4F4((uint64_t)v15);
    v28 = v33;
    sub_226EF9954(v33, &qword_253F42E38);
    (*(void (**)(char *, char *, uint64_t))(v31 + 32))(v9, v6, v3);
    v29 = v32;
    v30 = &v9[*(int *)(v32 + 20)];
    *(_QWORD *)v30 = v19;
    *((_QWORD *)v30 + 1) = v20;
    *(_QWORD *)&v9[*(int *)(v29 + 24)] = v26;
    __swift_storeEnumTagSinglePayload((uint64_t)v9, 0, 1, v29);
    sub_226EF9A14((uint64_t)v9, v28, &qword_253F42E38);
  }
}

uint64_t sub_226EF84CC()
{
  uint64_t v0;
  uint64_t v1;
  _BYTE v3[96];

  v1 = _s9BaseImageV18ArtworkLoaderImageVMa(0);
  memcpy(v3, (const void *)(v0 + *(int *)(v1 + 24)), sizeof(v3));
  return sub_226EF850C(v0);
}

uint64_t sub_226EF850C(uint64_t a1)
{
  uint64_t v1;
  int *v2;
  uint64_t v3;
  uint64_t v4;
  char v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t);
  uint64_t v23;
  uint64_t v24;
  char v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  __int128 v31[2];
  _BYTE v32[24];
  uint64_t v33;
  unsigned __int8 v34[9];

  swift_getKeyPath();
  v2 = (int *)_s9BaseImageV18ArtworkLoaderImageVMa(0);
  v3 = v1 + v2[10];
  v4 = *(_QWORD *)v3;
  v5 = *(_BYTE *)(v3 + 8);
  sub_226EF6658(*(_QWORD *)v3, v5);
  v6 = sub_226EF8A34(v4, v5);
  sub_226EF671C(v4, v5);
  v7 = sub_226EFE878(v6);
  v9 = v8;
  swift_release();
  swift_getKeyPath();
  sub_226EF6658(v4, v5);
  v10 = sub_226EF8A34(v4, v5);
  sub_226EF671C(v4, v5);
  v11 = sub_226EFE878(v10);
  v13 = v12;
  swift_release();
  sub_226EF6658(v4, v5);
  v14 = sub_226EF8A34(v4, v5);
  sub_226EF671C(v4, v5);
  v15 = v2[8];
  v16 = (uint64_t *)(v1 + v2[7]);
  v17 = *v16;
  v18 = v16[1];
  v19 = *(_QWORD *)(v1 + v15);
  v20 = *(_QWORD *)(v1 + v15 + 8);
  v34[0] = *(_BYTE *)(v1 + v2[9]);
  sub_226EF8C3C((uint64_t)v32);
  if (v33)
  {
    sub_226EF998C((uint64_t)v32, (uint64_t)v31);
    v21 = swift_allocObject();
    sub_226EF99F4(v31, v21 + 16);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v32);
    v22 = sub_226EF9A0C;
  }
  else
  {
    sub_226EF9954((uint64_t)v32, &qword_253F42D18);
    v22 = 0;
    v21 = 0;
  }
  v23 = v1 + v2[12];
  v24 = *(_QWORD *)v23;
  v25 = *(_BYTE *)(v23 + 8);
  j__swift_retain();
  v26 = sub_226EF8E28(v24, v25);
  j__swift_release();
  if (v26)
  {
    v27 = *(_QWORD *)(v26 + 16);
    v28 = *(_QWORD *)(v26 + 24);
    swift_retain();
    swift_release();
  }
  else
  {
    v27 = 0;
    v28 = 0;
  }
  sub_226EEC484(a1, v17, v18, v19, v20, v34, (void (*)(_QWORD *))v22, v21, v14, v7, v9, v11, v13, v27, v28);
  sub_226EEDD60(v27);
  return sub_226EEDD60((uint64_t)v22);
}

uint64_t sub_226EF87AC(uint64_t a1, _QWORD *a2)
{
  uint64_t v3;
  uint64_t v4;

  v3 = a2[3];
  v4 = a2[4];
  __swift_project_boxed_opaque_existential_1(a2, v3);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v4 + 8))(a1, v3, v4);
}

uint64_t sub_226EF87F8()
{
  uint64_t result;

  result = sub_226EF8814();
  qword_253F42CA0 = result;
  return result;
}

uint64_t sub_226EF8814()
{
  id v0;
  uint64_t v1;
  uint64_t v7;
  void *v8;
  id v9;
  uint64_t result;
  _QWORD v11[6];

  v0 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD618]), sel_initWithSize_, 1.0, 1.0);
  v1 = swift_allocObject();
  __asm { FMOV            V0.2D, #1.0 }
  *(_OWORD *)(v1 + 16) = _Q0;
  v7 = swift_allocObject();
  *(_QWORD *)(v7 + 16) = sub_226EF8BF8;
  *(_QWORD *)(v7 + 24) = v1;
  v11[4] = sub_226EF8C04;
  v11[5] = v7;
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 1107296256;
  v11[2] = sub_226EF89EC;
  v11[3] = &block_descriptor_1;
  v8 = _Block_copy(v11);
  swift_retain();
  swift_release();
  v9 = objc_msgSend(v0, sel_imageWithActions_, v8);

  _Block_release(v8);
  LOBYTE(v0) = swift_isEscapingClosureAtFileLocation();
  swift_release();
  result = swift_release();
  if ((v0 & 1) == 0)
    return (uint64_t)v9;
  __break(1u);
  return result;
}

id sub_226EF8970(void *a1, double a2, double a3)
{
  id v6;

  v6 = objc_msgSend((id)objc_opt_self(), sel_clearColor);
  objc_msgSend(v6, sel_setFill);

  return objc_msgSend(a1, sel_fillRect_, 0.0, 0.0, a2, a3);
}

void sub_226EF89EC(uint64_t a1, void *a2)
{
  void (*v2)(void);
  id v3;

  v2 = *(void (**)(void))(a1 + 32);
  v3 = a2;
  v2();

}

uint64_t sub_226EF8A24()
{
  return swift_getOpaqueTypeConformance2();
}

double sub_226EF8A34(uint64_t a1, char a2)
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
  double v15;

  v4 = sub_226F01404();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if ((a2 & 1) != 0)
    return *(double *)&a1;
  swift_retain();
  v8 = sub_226F017F4();
  v9 = sub_226F014AC();
  v10 = v8;
  if (os_log_type_enabled(v9, v8))
  {
    v11 = (uint8_t *)swift_slowAlloc();
    v12 = swift_slowAlloc();
    v15 = *(double *)&v12;
    *(_DWORD *)v11 = 136315138;
    v14 = sub_226EF91E8(0x74616F6C464743, 0xE700000000000000, (uint64_t *)&v15);
    sub_226F01830();
    _os_log_impl(&dword_226EE6000, v9, v10, "Accessing Environment<%s>'s value outside of being installed on a View. This will always read the default value and will not update.", v11, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x2276A6584](v12, -1, -1);
    MEMORY[0x2276A6584](v11, -1, -1);
  }

  sub_226F013F8();
  swift_getAtKeyPath();
  sub_226EF671C(a1, 0);
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  return v15;
}

id sub_226EF8BF8(void *a1)
{
  uint64_t v1;

  return sub_226EF8970(a1, *(double *)(v1 + 16), *(double *)(v1 + 24));
}

uint64_t sub_226EF8C04()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 16))();
}

uint64_t block_copy_helper_1(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_1()
{
  return swift_release();
}

void sub_226EF8C3C(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  os_log_type_t v8;
  NSObject *v9;
  os_log_type_t v10;
  uint8_t *v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD v14[3];
  uint64_t v15;
  _QWORD v16[5];
  char v17;

  v2 = v1;
  v4 = sub_226F01404();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_226EF9DF0(v2, (uint64_t)v16, &qword_253F42D28);
  if (v17 == 1)
  {
    sub_226EF9A14((uint64_t)v16, a1, &qword_253F42D18);
  }
  else
  {
    v8 = sub_226F017F4();
    v9 = sub_226F014AC();
    v10 = v8;
    if (os_log_type_enabled(v9, v8))
    {
      v11 = (uint8_t *)swift_slowAlloc();
      v12 = swift_slowAlloc();
      v14[1] = a1;
      v13 = v12;
      v15 = v12;
      *(_DWORD *)v11 = 136315138;
      v14[2] = sub_226EF91E8(0xD00000000000002CLL, 0x8000000226F03BC0, &v15);
      sub_226F01830();
      _os_log_impl(&dword_226EE6000, v9, v10, "Accessing Environment<%s>'s value outside of being installed on a View. This will always read the default value and will not update.", v11, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x2276A6584](v13, -1, -1);
      MEMORY[0x2276A6584](v11, -1, -1);
    }

    sub_226F013F8();
    swift_getAtKeyPath();
    swift_release();
    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  }
}

uint64_t sub_226EF8E28(uint64_t a1, char a2)
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

  v4 = sub_226F01404();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_retain();
  if ((a2 & 1) == 0)
  {
    v8 = sub_226F017F4();
    v9 = sub_226F014AC();
    v10 = v8;
    if (os_log_type_enabled(v9, v8))
    {
      v11 = (uint8_t *)swift_slowAlloc();
      v12 = swift_slowAlloc();
      v15 = v12;
      *(_DWORD *)v11 = 136315138;
      v14 = sub_226EF91E8(0xD000000000000020, 0x8000000226F03B90, &v15);
      sub_226F01830();
      _os_log_impl(&dword_226EE6000, v9, v10, "Accessing Environment<%s>'s value outside of being installed on a View. This will always read the default value and will not update.", v11, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x2276A6584](v12, -1, -1);
      MEMORY[0x2276A6584](v11, -1, -1);
    }

    sub_226F013F8();
    swift_getAtKeyPath();
    j__swift_release();
    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
    return v15;
  }
  return a1;
}

void sub_226EF8FE8(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  os_log_type_t v12;
  NSObject *v13;
  os_log_type_t v14;
  uint8_t *v15;
  uint64_t v16;

  v3 = v1;
  v5 = sub_226F01404();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  OUTLINED_FUNCTION_0_1();
  v9 = v8 - v7;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2558AC980);
  OUTLINED_FUNCTION_3_0();
  MEMORY[0x24BDAC7A8](v10);
  OUTLINED_FUNCTION_11_2();
  sub_226EF9DF0(v3, v2, &qword_2558AC980);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v11 = sub_226F01368();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 32))(a1, v2, v11);
  }
  else
  {
    v12 = sub_226F017F4();
    v13 = sub_226F014AC();
    v14 = v12;
    if (os_log_type_enabled(v13, v12))
    {
      v15 = (uint8_t *)swift_slowAlloc();
      v16 = swift_slowAlloc();
      *(_DWORD *)v15 = 136315138;
      sub_226EF91E8(0x414C52556E65704FLL, 0xED00006E6F697463, &v16);
      sub_226F01830();
      _os_log_impl(&dword_226EE6000, v13, v14, "Accessing Environment<%s>'s value outside of being installed on a View. This will always read the default value and will not update.", v15, 0xCu);
      swift_arrayDestroy();
      OUTLINED_FUNCTION_16_2();
    }

    sub_226F013F8();
    swift_getAtKeyPath();
    swift_release();
    (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v9, v5);
  }
  OUTLINED_FUNCTION_4_1();
}

uint64_t sub_226EF91E8(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD v12[3];
  uint64_t ObjectType;

  v6 = sub_226EF92B8(v12, 0, 0, 1, a1, a2);
  v7 = v12[0];
  if (v6)
  {
    v8 = v6;
    ObjectType = swift_getObjectType();
    v12[0] = v8;
    v9 = *a3;
    if (*a3)
    {
      sub_226EEE9F8((uint64_t)v12, *a3);
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
      sub_226EEE9F8((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v12);
  return v7;
}

uint64_t sub_226EF92B8(_QWORD *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
{
  uint64_t v8;
  uint64_t result;
  uint64_t v11;
  _QWORD __src[2];

  if ((a6 & 0x2000000000000000) != 0)
  {
    if ((a4 & 1) == 0 && __dst && a3 - (uint64_t)__dst > (uint64_t)(HIBYTE(a6) & 0xF))
    {
      __src[0] = a5;
      __src[1] = a6 & 0xFFFFFFFFFFFFFFLL;
      sub_226EF940C((char *)__src, HIBYTE(a6) & 0xF, __dst);
      sub_226F0183C();
      result = 0;
      *a1 = __dst;
      return result;
    }
    goto LABEL_11;
  }
  if ((a6 & 0x1000000000000000) != 0)
  {
LABEL_11:
    result = sub_226EF94D0(a5, a6);
    *a1 = v11;
    return result;
  }
  if ((a5 & 0x1000000000000000) != 0)
  {
    v8 = (a6 & 0xFFFFFFFFFFFFFFFLL) + 32;
  }
  else
  {
    v8 = sub_226F01878();
    if (!v8)
    {
      result = sub_226F018A8();
      __break(1u);
      return result;
    }
  }
  *a1 = v8;
  if ((a6 & 0x8000000000000000) != 0)
    return 0;
  else
    return swift_unknownObjectRetain();
}

void *sub_226EF940C(char *__src, size_t __n, char *__dst)
{
  void *result;

  if ((__n & 0x8000000000000000) == 0 && (&__dst[__n] <= __src || &__src[__n] <= __dst))
    return memcpy(__dst, __src, __n);
  result = (void *)sub_226F018C0();
  __break(1u);
  return result;
}

uint64_t sub_226EF94D0(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v2 = sub_226EF9564(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v2 = (uint64_t)sub_226EF9738(0, *(_QWORD *)(v2 + 16) + 1, 1, v2);
  v4 = *(_QWORD *)(v2 + 16);
  v3 = *(_QWORD *)(v2 + 24);
  if (v4 >= v3 >> 1)
    v2 = (uint64_t)sub_226EF9738((char *)(v3 > 1), v4 + 1, 1, v2);
  *(_QWORD *)(v2 + 16) = v4 + 1;
  *(_BYTE *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_226EF9564(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  _QWORD *v3;
  _QWORD *v4;
  uint64_t v5;
  char v6;
  uint64_t result;

  if ((a2 & 0x1000000000000000) != 0)
  {
    v2 = sub_226F01794();
    if (v2)
      goto LABEL_6;
    return MEMORY[0x24BEE4AF8];
  }
  if ((a2 & 0x2000000000000000) != 0)
    v2 = HIBYTE(a2) & 0xF;
  else
    v2 = a1 & 0xFFFFFFFFFFFFLL;
  if (!v2)
    return MEMORY[0x24BEE4AF8];
LABEL_6:
  v3 = sub_226EF96D4(v2, 0);
  if ((v2 & 0x8000000000000000) == 0)
  {
    v4 = v3;
    v5 = sub_226F0186C();
    if ((v6 & 1) != 0 || v5 != v2)
      goto LABEL_14;
    return (uint64_t)v4;
  }
  sub_226F018C0();
  __break(1u);
LABEL_14:
  result = sub_226F018A8();
  __break(1u);
  return result;
}

_QWORD *sub_226EF96D4(uint64_t a1, uint64_t a2)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_2558AC9B0);
  v4 = (_QWORD *)swift_allocObject();
  v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

char *sub_226EF9738(char *result, int64_t a2, char a3, uint64_t a4)
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
    v6 = *(_QWORD *)(a4 + 24);
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
  v8 = *(_QWORD *)(a4 + 16);
  if (v7 <= v8)
    v9 = *(_QWORD *)(a4 + 16);
  else
    v9 = v7;
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_2558AC9B0);
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
  v13 = (char *)(a4 + 32);
  if ((v5 & 1) != 0)
  {
    sub_226EF98D0(v13, v8, v12);
    *(_QWORD *)(a4 + 16) = 0;
  }
  else
  {
    sub_226EF980C(v13, v8, v12);
  }
  swift_bridgeObjectRelease();
  return v10;
}

void *sub_226EF980C(char *__src, size_t __n, char *__dst)
{
  void *result;

  if ((__n & 0x8000000000000000) == 0 && (&__dst[__n] <= __src || &__src[__n] <= __dst))
    return memcpy(__dst, __src, __n);
  result = (void *)sub_226F018C0();
  __break(1u);
  return result;
}

char *sub_226EF98D0(char *__src, size_t __len, char *__dst)
{
  if ((__len & 0x8000000000000000) != 0)
  {
    __src = (char *)sub_226F018C0();
    __break(1u);
  }
  else if (__dst != __src || &__src[__len] <= __dst)
  {
    return (char *)memmove(__dst, __src, __len);
  }
  return __src;
}

void sub_226EF9954(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  OUTLINED_FUNCTION_28();
}

uint64_t sub_226EF998C(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  *(_QWORD *)(a2 + 32) = *(_QWORD *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_226EF99D0()
{
  uint64_t v0;

  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  return swift_deallocObject();
}

uint64_t sub_226EF99F4(__int128 *a1, uint64_t a2)
{
  __int128 v2;
  __int128 v3;

  v2 = *a1;
  v3 = a1[1];
  *(_QWORD *)(a2 + 32) = *((_QWORD *)a1 + 4);
  *(_OWORD *)a2 = v2;
  *(_OWORD *)(a2 + 16) = v3;
  return a2;
}

uint64_t sub_226EF9A0C(uint64_t a1)
{
  uint64_t v1;

  return sub_226EF87AC(a1, (_QWORD *)(v1 + 16));
}

void sub_226EF9A14(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v3;

  v3 = OUTLINED_FUNCTION_20_1(a1, a2, a3);
  OUTLINED_FUNCTION_4_2(v3);
  OUTLINED_FUNCTION_28();
}

unint64_t sub_226EF9A40()
{
  unint64_t result;
  uint64_t v1;

  result = qword_253F42D00;
  if (!qword_253F42D00)
  {
    v1 = type metadata accessor for ArtworkLoadingObserver(255);
    result = MEMORY[0x2276A650C](&protocol conformance descriptor for ArtworkLoadingObserver, v1);
    atomic_store(result, (unint64_t *)&qword_253F42D00);
  }
  return result;
}

void sub_226EF9A80(uint64_t a1, uint64_t a2, uint64_t (*a3)(_QWORD))
{
  uint64_t v3;

  v3 = a3(0);
  OUTLINED_FUNCTION_4_2(v3);
  OUTLINED_FUNCTION_28();
}

unint64_t sub_226EF9AB0()
{
  unint64_t result;
  uint64_t v1;
  unint64_t v2;
  uint64_t v3;
  _QWORD v4[2];

  result = qword_253F42DA0;
  if (!qword_253F42DA0)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_253F42DA8);
    v2 = sub_226EF9B34();
    sub_226EF9DB4(&qword_253F43210, &qword_253F43218, MEMORY[0x24BDF0B90]);
    v4[0] = v2;
    v4[1] = v3;
    result = MEMORY[0x2276A650C](MEMORY[0x24BDED308], v1, v4);
    atomic_store(result, (unint64_t *)&qword_253F42DA0);
  }
  return result;
}

unint64_t sub_226EF9B34()
{
  unint64_t result;
  uint64_t v1;
  unint64_t v2;
  uint64_t v3;
  _QWORD v4[2];

  result = qword_253F42D90;
  if (!qword_253F42D90)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_253F42D98);
    v2 = sub_226EF9BB8();
    sub_226EF9DB4(&qword_253F43200, &qword_253F43208, MEMORY[0x24BDF06D0]);
    v4[0] = v2;
    v4[1] = v3;
    result = MEMORY[0x2276A650C](MEMORY[0x24BDED308], v1, v4);
    atomic_store(result, (unint64_t *)&qword_253F42D90);
  }
  return result;
}

unint64_t sub_226EF9BB8()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_253F42D80;
  if (!qword_253F42D80)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_253F42D88);
    v2[0] = sub_226EF9C24();
    v2[1] = MEMORY[0x24BDEBEE0];
    result = MEMORY[0x2276A650C](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_253F42D80);
  }
  return result;
}

unint64_t sub_226EF9C24()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_253F42D70;
  if (!qword_253F42D70)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_253F42D78);
    v2[0] = sub_226EF9C90();
    v2[1] = sub_226EF9D78();
    result = MEMORY[0x2276A650C](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_253F42D70);
  }
  return result;
}

unint64_t sub_226EF9C90()
{
  unint64_t result;
  uint64_t v1;
  unint64_t v2;
  uint64_t v3;
  _QWORD v4[2];

  result = qword_253F42D60;
  if (!qword_253F42D60)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_253F42D68);
    v2 = sub_226EF9D14();
    sub_226EF9DB4(&qword_253F42D30, &qword_253F42D38, MEMORY[0x24BDEB950]);
    v4[0] = v2;
    v4[1] = v3;
    result = MEMORY[0x2276A650C](MEMORY[0x24BDED308], v1, v4);
    atomic_store(result, (unint64_t *)&qword_253F42D60);
  }
  return result;
}

unint64_t sub_226EF9D14()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_253F42D50;
  if (!qword_253F42D50)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_253F42D58);
    v2[0] = MEMORY[0x24BDF40E8];
    v2[1] = MEMORY[0x24BDEEC40];
    result = MEMORY[0x2276A650C](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_253F42D50);
  }
  return result;
}

unint64_t sub_226EF9D78()
{
  unint64_t result;

  result = qword_253F42DC8;
  if (!qword_253F42DC8)
  {
    result = MEMORY[0x2276A650C](MEMORY[0x24BDF1438], MEMORY[0x24BDF1448]);
    atomic_store(result, (unint64_t *)&qword_253F42DC8);
  }
  return result;
}

void sub_226EF9DB4(unint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v5;

  if (!*a1)
  {
    v5 = __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    atomic_store(MEMORY[0x2276A650C](a3, v5), a1);
  }
  OUTLINED_FUNCTION_28();
}

void sub_226EF9DF0(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v5 = OUTLINED_FUNCTION_20_1(a1, a2, a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(v3, v4, v5);
  OUTLINED_FUNCTION_28();
}

uint64_t OUTLINED_FUNCTION_1_4()
{
  return swift_deallocObject();
}

uint64_t OUTLINED_FUNCTION_2_3(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return __swift_getEnumTagSinglePayload(a1, a2, a3);
}

uint64_t OUTLINED_FUNCTION_3_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_storeEnumTagSinglePayload(a1, a2, a3, a4);
}

uint64_t OUTLINED_FUNCTION_4_2(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(a1 - 8) + 32))(v1, v2, a1);
}

uint64_t OUTLINED_FUNCTION_8_2()
{
  return _s9BaseImageV18ArtworkLoaderImageVMa(0);
}

uint64_t OUTLINED_FUNCTION_12_1@<X0>(unint64_t a1@<X8>)
{
  if (a1 >= 0xFFFFFFFF)
    LODWORD(a1) = -1;
  return (a1 + 1);
}

void OUTLINED_FUNCTION_16_2()
{
  JUMPOUT(0x2276A6584);
}

uint64_t sub_226EF9EA4()
{
  uint64_t *v0;
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
  __CFString *v11;
  __CFString *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  __CFString *v18;
  __CFString *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  __CFString *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  id v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  id v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;

  v2 = *v0;
  v1 = v0[1];
  v3 = v0[2];
  v4 = v0[3];
  v6 = v0[4];
  v5 = v0[5];
  v7 = v0[7];
  v8 = v0[9];
  v46 = v0[6];
  v47 = v0[8];
  v9 = v0[11];
  v48 = v0[10];
  v49 = v0[12];
  v50 = v0[13];
  type metadata accessor for MusicKit_SPI_SKCloudServiceSetupOptionsKey(0);
  sub_226EFB9F0();
  v54 = sub_226F01710();
  v10 = MEMORY[0x24BEE0D00];
  v53 = MEMORY[0x24BEE0D00];
  v51 = v2;
  v52 = v1;
  v11 = CFSTR("musicKit_action");
  swift_bridgeObjectRetain();
  sub_226EFBA30((uint64_t)&v51, v11);
  if (v5)
  {
    v53 = v10;
    v51 = v6;
    v52 = v5;
    swift_bridgeObjectRetain();
    v12 = CFSTR("musicKit_iTunesItemIdentifier");
    OUTLINED_FUNCTION_1_5(v12, v13, v14, v15, v16, v17);
  }
  v53 = v10;
  v51 = v3;
  v52 = v4;
  v18 = CFSTR("musicKit_messageIdentifier");
  OUTLINED_FUNCTION_13_2();
  sub_226EFBA30((uint64_t)&v51, v18);
  if (v7)
  {
    v53 = v10;
    v51 = v46;
    v52 = v7;
    swift_bridgeObjectRetain();
    v19 = CFSTR("musicKit_affiliateToken");
    OUTLINED_FUNCTION_1_5(v19, v20, v21, v22, v23, v24);
  }
  if (v8)
  {
    v53 = v10;
    v51 = v47;
    v52 = v8;
    OUTLINED_FUNCTION_33();
    v25 = CFSTR("musicKit_campaignToken");
    OUTLINED_FUNCTION_1_5(v25, v26, v27, v28, v29, v30);
  }
  if (v9)
  {
    v31 = qword_2558AC760;
    OUTLINED_FUNCTION_26_0();
    if (v31 != -1)
      swift_once();
    v53 = v10;
    v51 = v48;
    v52 = v9;
    v32 = (id)qword_2558AE138;
    OUTLINED_FUNCTION_1_5(v32, v33, v34, v35, v36, v37);
  }
  if (v50)
  {
    v38 = qword_2558AC768;
    OUTLINED_FUNCTION_8_3();
    if (v38 != -1)
      swift_once();
    v53 = v10;
    v51 = v49;
    v52 = v50;
    v39 = (id)qword_2558AE140;
    OUTLINED_FUNCTION_1_5(v39, v40, v41, v42, v43, v44);
  }
  return v54;
}

uint64_t sub_226EFA0BC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char v5;

  v0 = sub_226F01758();
  v2 = v1;
  if (v0 == sub_226F01758() && v2 == v3)
    v5 = 1;
  else
    v5 = OUTLINED_FUNCTION_0_6();
  OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_47();
  return v5 & 1;
}

uint64_t sub_226EFA134(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (a1 == a3 && a2 == a4)
    return 1;
  else
    return sub_226F018E4();
}

uint64_t static MusicSubscriptionOffer.Options.default.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  if (qword_2558AC758 != -1)
    swift_once();
  v2 = *((_QWORD *)&xmmword_2558AC9F8 + 1);
  v3 = qword_2558ACA08;
  v4 = unk_2558ACA10;
  v5 = xmmword_2558ACA18;
  v6 = qword_2558ACA60;
  *(_QWORD *)a1 = xmmword_2558AC9F8;
  *(_QWORD *)(a1 + 8) = v2;
  *(_QWORD *)(a1 + 16) = v3;
  *(_QWORD *)(a1 + 24) = v4;
  *(_QWORD *)(a1 + 32) = v5;
  *(_OWORD *)(a1 + 40) = *(__int128 *)((char *)&xmmword_2558ACA18 + 8);
  *(_OWORD *)(a1 + 56) = unk_2558ACA30;
  *(_OWORD *)(a1 + 72) = *(__int128 *)((char *)&xmmword_2558ACA38 + 8);
  *(_OWORD *)(a1 + 88) = unk_2558ACA50;
  *(_QWORD *)(a1 + 104) = v6;
  swift_bridgeObjectRetain();
  OUTLINED_FUNCTION_8_3();
  OUTLINED_FUNCTION_26_0();
  OUTLINED_FUNCTION_33();
  swift_bridgeObjectRetain();
  OUTLINED_FUNCTION_13_2();
  return swift_bridgeObjectRetain();
}

void sub_226EFA224()
{
  strcpy((char *)&qword_2558AC9B8, "sdkSubscribe");
  BYTE5(qword_2558AC9C0) = 0;
  HIWORD(qword_2558AC9C0) = -5120;
}

uint64_t static MusicSubscriptionOffer.Action.subscribe.getter@<X0>(_QWORD *a1@<X8>)
{
  return OUTLINED_FUNCTION_5_2(&qword_2558AC738, &qword_2558AC9B8, a1);
}

_QWORD *sub_226EFA26C@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  return sub_226EFA474(a1, (_QWORD *(*)(_QWORD *__return_ptr, _QWORD, _QWORD))MusicSubscriptionOffer.Action.init(rawValue:), a2);
}

void sub_226EFA278()
{
  OUTLINED_FUNCTION_32_1();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_17_2();
  OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_23_2();
  OUTLINED_FUNCTION_31_1();
}

uint64_t sub_226EFA2B0()
{
  swift_bridgeObjectRetain();
  OUTLINED_FUNCTION_17_2();
  return swift_bridgeObjectRelease();
}

void sub_226EFA2F0()
{
  sub_226F0192C();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_17_2();
  OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_23_2();
  OUTLINED_FUNCTION_31_1();
}

uint64_t MusicSubscriptionOffer.MessageIdentifier.init(_:)@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, _QWORD *a3@<X8>)
{
  *a3 = result;
  a3[1] = a2;
  return result;
}

uint64_t MusicSubscriptionOffer.MessageIdentifier.init(rawValue:)@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, _QWORD *a3@<X8>)
{
  *a3 = result;
  a3[1] = a2;
  return result;
}

void MusicSubscriptionOffer.MessageIdentifier.rawValue.getter()
{
  OUTLINED_FUNCTION_8_3();
  OUTLINED_FUNCTION_16_3();
  OUTLINED_FUNCTION_28();
}

void sub_226EFA35C()
{
  qword_2558AC9C8 = 1852403562;
  qword_2558AC9D0 = 0xE400000000000000;
}

uint64_t static MusicSubscriptionOffer.MessageIdentifier.join.getter@<X0>(_QWORD *a1@<X8>)
{
  return OUTLINED_FUNCTION_5_2(&qword_2558AC740, &qword_2558AC9C8, a1);
}

void sub_226EFA394()
{
  qword_2558AC9D8 = 0x636973754D646461;
  unk_2558AC9E0 = 0xE800000000000000;
}

uint64_t static MusicSubscriptionOffer.MessageIdentifier.addMusic.getter@<X0>(_QWORD *a1@<X8>)
{
  return OUTLINED_FUNCTION_5_2(&qword_2558AC748, &qword_2558AC9D8, a1);
}

void sub_226EFA3D4()
{
  qword_2558AC9E8 = 0x6973754D79616C70;
  unk_2558AC9F0 = 0xE900000000000063;
}

uint64_t static MusicSubscriptionOffer.MessageIdentifier.playMusic.getter@<X0>(_QWORD *a1@<X8>)
{
  return OUTLINED_FUNCTION_5_2(&qword_2558AC750, &qword_2558AC9E8, a1);
}

uint64_t sub_226EFA418@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X1>, uint64_t *a3@<X2>, _QWORD *a4@<X8>)
{
  uint64_t v7;

  if (*a1 != -1)
    swift_once();
  v7 = *a3;
  *a4 = *a2;
  a4[1] = v7;
  return swift_bridgeObjectRetain();
}

_QWORD *sub_226EFA468@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  return sub_226EFA474(a1, (_QWORD *(*)(_QWORD *__return_ptr, _QWORD, _QWORD))MusicSubscriptionOffer.MessageIdentifier.init(rawValue:), a2);
}

_QWORD *sub_226EFA474@<X0>(_QWORD *a1@<X0>, _QWORD *(*a2)(_QWORD *__return_ptr, _QWORD, _QWORD)@<X3>, _QWORD *a3@<X8>)
{
  _QWORD *result;
  uint64_t v5;
  _QWORD v6[2];

  result = a2(v6, *a1, a1[1]);
  v5 = v6[1];
  *a3 = v6[0];
  a3[1] = v5;
  return result;
}

void sub_226EFA4B0(_QWORD *a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;

  MusicSubscriptionOffer.MessageIdentifier.rawValue.getter();
  *a1 = v2;
  a1[1] = v3;
}

uint64_t sub_226EFA4D4(uint64_t *a1, uint64_t *a2)
{
  return sub_226EFA134(*a1, a1[1], *a2, a2[1]);
}

void sub_226EFA4E8()
{
  sub_226EFA278();
}

uint64_t sub_226EFA500()
{
  return sub_226EFA2B0();
}

void sub_226EFA518()
{
  sub_226EFA2F0();
}

uint64_t MusicSubscriptionOffer.Options.action.getter@<X0>(_QWORD *a1@<X8>)
{
  uint64_t v1;

  return OUTLINED_FUNCTION_19_2(*(_QWORD *)(v1 + 8), a1);
}

void MusicSubscriptionOffer.Options.action.setter(uint64_t *a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;

  v2 = *a1;
  v3 = a1[1];
  swift_bridgeObjectRelease();
  *v1 = v2;
  v1[1] = v3;
  OUTLINED_FUNCTION_2_0();
}

uint64_t (*MusicSubscriptionOffer.Options.action.modify())()
{
  return nullsub_1;
}

uint64_t MusicSubscriptionOffer.Options.messageIdentifier.getter@<X0>(_QWORD *a1@<X8>)
{
  uint64_t v1;

  return OUTLINED_FUNCTION_19_2(*(_QWORD *)(v1 + 24), a1);
}

void MusicSubscriptionOffer.Options.messageIdentifier.setter(uint64_t *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v2 = *a1;
  v3 = a1[1];
  swift_bridgeObjectRelease();
  *(_QWORD *)(v1 + 16) = v2;
  *(_QWORD *)(v1 + 24) = v3;
  OUTLINED_FUNCTION_2_0();
}

uint64_t (*MusicSubscriptionOffer.Options.messageIdentifier.modify())()
{
  return nullsub_1;
}

void MusicSubscriptionOffer.Options.itemID.getter()
{
  OUTLINED_FUNCTION_8_3();
  OUTLINED_FUNCTION_16_3();
  OUTLINED_FUNCTION_28();
}

void MusicSubscriptionOffer.Options.itemID.setter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  OUTLINED_FUNCTION_24_0();
  swift_bridgeObjectRelease();
  *(_QWORD *)(v1 + 32) = v2;
  *(_QWORD *)(v1 + 40) = v0;
  OUTLINED_FUNCTION_2_0();
}

uint64_t (*MusicSubscriptionOffer.Options.itemID.modify())()
{
  return nullsub_1;
}

void MusicSubscriptionOffer.Options.affiliateToken.getter()
{
  OUTLINED_FUNCTION_8_3();
  OUTLINED_FUNCTION_16_3();
  OUTLINED_FUNCTION_28();
}

void MusicSubscriptionOffer.Options.affiliateToken.setter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  OUTLINED_FUNCTION_24_0();
  swift_bridgeObjectRelease();
  *(_QWORD *)(v1 + 48) = v2;
  *(_QWORD *)(v1 + 56) = v0;
  OUTLINED_FUNCTION_2_0();
}

uint64_t (*MusicSubscriptionOffer.Options.affiliateToken.modify())()
{
  return nullsub_1;
}

void MusicSubscriptionOffer.Options.campaignToken.getter()
{
  OUTLINED_FUNCTION_8_3();
  OUTLINED_FUNCTION_16_3();
  OUTLINED_FUNCTION_28();
}

void MusicSubscriptionOffer.Options.campaignToken.setter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  OUTLINED_FUNCTION_24_0();
  swift_bridgeObjectRelease();
  *(_QWORD *)(v1 + 64) = v2;
  *(_QWORD *)(v1 + 72) = v0;
  OUTLINED_FUNCTION_2_0();
}

uint64_t (*MusicSubscriptionOffer.Options.campaignToken.modify())()
{
  return nullsub_1;
}

void MusicSubscriptionOffer.Options._figaroCampaignToken.getter()
{
  OUTLINED_FUNCTION_8_3();
  OUTLINED_FUNCTION_16_3();
  OUTLINED_FUNCTION_28();
}

void MusicSubscriptionOffer.Options._figaroCampaignToken.setter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  OUTLINED_FUNCTION_24_0();
  swift_bridgeObjectRelease();
  *(_QWORD *)(v1 + 80) = v2;
  *(_QWORD *)(v1 + 88) = v0;
  OUTLINED_FUNCTION_2_0();
}

uint64_t (*MusicSubscriptionOffer.Options._figaroCampaignToken.modify())()
{
  return nullsub_1;
}

void MusicSubscriptionOffer.Options._figaroCampaignGroup.getter()
{
  OUTLINED_FUNCTION_8_3();
  OUTLINED_FUNCTION_16_3();
  OUTLINED_FUNCTION_28();
}

void MusicSubscriptionOffer.Options._figaroCampaignGroup.setter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  OUTLINED_FUNCTION_24_0();
  swift_bridgeObjectRelease();
  *(_QWORD *)(v1 + 96) = v2;
  *(_QWORD *)(v1 + 104) = v0;
  OUTLINED_FUNCTION_2_0();
}

uint64_t (*MusicSubscriptionOffer.Options._figaroCampaignGroup.modify())()
{
  return nullsub_1;
}

double sub_226EFA768()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  double result;

  if (qword_2558AC738 != -1)
    swift_once();
  v1 = qword_2558AC9B8;
  v0 = qword_2558AC9C0;
  v2 = qword_2558AC740;
  swift_bridgeObjectRetain();
  if (v2 != -1)
    swift_once();
  v4 = qword_2558AC9C8;
  v3 = qword_2558AC9D0;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease_n();
  *(_QWORD *)&xmmword_2558AC9F8 = v1;
  *((_QWORD *)&xmmword_2558AC9F8 + 1) = v0;
  qword_2558ACA08 = v4;
  unk_2558ACA10 = v3;
  result = 0.0;
  xmmword_2558ACA18 = 0u;
  unk_2558ACA28 = 0u;
  xmmword_2558ACA38 = 0u;
  unk_2558ACA48 = 0u;
  unk_2558ACA58 = 0u;
  return result;
}

double MusicSubscriptionOffer.Options.init(action:messageIdentifier:itemID:affiliateToken:campaignToken:)@<D0>(uint64_t *a1@<X0>, uint64_t *a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, uint64_t a9@<X8>)
{
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  double result;

  v13 = *a1;
  v14 = a1[1];
  v15 = *a2;
  v16 = a2[1];
  if (qword_2558AC738 != -1)
    swift_once();
  v17 = qword_2558AC740;
  swift_bridgeObjectRetain();
  if (v17 != -1)
    swift_once();
  OUTLINED_FUNCTION_8_3();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  OUTLINED_FUNCTION_47();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_13_2();
  swift_bridgeObjectRelease_n();
  OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_14_2();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  *(_QWORD *)a9 = v13;
  *(_QWORD *)(a9 + 8) = v14;
  *(_QWORD *)(a9 + 16) = v15;
  *(_QWORD *)(a9 + 24) = v16;
  *(_QWORD *)(a9 + 32) = a3;
  *(_QWORD *)(a9 + 40) = a4;
  *(_QWORD *)(a9 + 48) = a5;
  *(_QWORD *)(a9 + 56) = a6;
  *(_QWORD *)(a9 + 64) = a7;
  *(_QWORD *)(a9 + 72) = a8;
  result = 0.0;
  *(_OWORD *)(a9 + 80) = 0u;
  *(_OWORD *)(a9 + 96) = 0u;
  return result;
}

uint64_t static MusicSubscriptionOffer.Options.== infix(_:_:)(_QWORD *a1, _QWORD *a2)
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
  BOOL v25;
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

  v2 = a1[2];
  v3 = a1[3];
  v4 = a1[4];
  v5 = a1[5];
  v38 = a1[6];
  v6 = a1[7];
  v34 = a1[8];
  v39 = a1[9];
  v31 = a1[10];
  v27 = a1[12];
  v29 = a1[13];
  v7 = a2[2];
  v8 = a2[3];
  v9 = a2[4];
  v10 = a2[5];
  v11 = a2[7];
  v37 = a2[6];
  v35 = a1[11];
  v36 = a2[9];
  v30 = a2[10];
  v32 = a2[11];
  v33 = a2[8];
  v12 = *a1 == *a2 && a1[1] == a2[1];
  v26 = a2[12];
  v28 = a2[13];
  if (v12 || (OUTLINED_FUNCTION_0_6(), result = OUTLINED_FUNCTION_20_2(), (v14 & 1) != 0))
  {
    v15 = v2 == v7 && v3 == v8;
    if (v15 || (OUTLINED_FUNCTION_0_6(), result = OUTLINED_FUNCTION_20_2(), (v16 & 1) != 0))
    {
      if (v5)
      {
        if (!v10)
          return 0;
        if (v4 != v9 || v5 != v10)
        {
          OUTLINED_FUNCTION_0_6();
          result = OUTLINED_FUNCTION_20_2();
          if ((v18 & 1) == 0)
            return result;
        }
      }
      else if (v10)
      {
        return 0;
      }
      if (v6)
      {
        if (!v11)
          return 0;
        if (v38 != v37 || v6 != v11)
        {
          OUTLINED_FUNCTION_0_6();
          result = OUTLINED_FUNCTION_20_2();
          if ((v20 & 1) == 0)
            return result;
        }
      }
      else if (v11)
      {
        return 0;
      }
      if (v39)
      {
        if (!v36)
          return 0;
        if (v34 != v33 || v39 != v36)
        {
          OUTLINED_FUNCTION_0_6();
          result = OUTLINED_FUNCTION_20_2();
          if ((v22 & 1) == 0)
            return result;
        }
      }
      else if (v36)
      {
        return 0;
      }
      if (v35)
      {
        if (!v32)
          return 0;
        if (v31 != v30 || v35 != v32)
        {
          OUTLINED_FUNCTION_0_6();
          result = OUTLINED_FUNCTION_20_2();
          if ((v24 & 1) == 0)
            return result;
        }
      }
      else if (v32)
      {
        return 0;
      }
      if (v29)
      {
        if (v28)
        {
          v25 = v27 == v26 && v29 == v28;
          if (v25 || (OUTLINED_FUNCTION_0_6() & 1) != 0)
            return 1;
        }
      }
      else if (!v28)
      {
        return 1;
      }
      return 0;
    }
  }
  return result;
}

uint64_t MusicSubscriptionOffer.Options.hash(into:)()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v6;

  v1 = v0[5];
  v2 = v0[7];
  v3 = v0[9];
  v4 = v0[13];
  v6 = v0[11];
  swift_bridgeObjectRetain();
  sub_226F01770();
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_26_0();
  OUTLINED_FUNCTION_36_0();
  OUTLINED_FUNCTION_9_1();
  OUTLINED_FUNCTION_7_2();
  if (v1)
  {
    swift_bridgeObjectRetain();
    sub_226F01770();
    swift_bridgeObjectRelease();
  }
  if (v2)
  {
    OUTLINED_FUNCTION_7_2();
    swift_bridgeObjectRetain();
    sub_226F01770();
    swift_bridgeObjectRelease();
    if (v3)
      goto LABEL_5;
  }
  else
  {
    OUTLINED_FUNCTION_7_2();
    if (v3)
    {
LABEL_5:
      OUTLINED_FUNCTION_7_2();
      OUTLINED_FUNCTION_13_2();
      sub_226F01770();
      OUTLINED_FUNCTION_14_2();
      if (v6)
        goto LABEL_6;
LABEL_10:
      OUTLINED_FUNCTION_7_2();
      if (v4)
        goto LABEL_7;
      return OUTLINED_FUNCTION_7_2();
    }
  }
  OUTLINED_FUNCTION_7_2();
  if (!v6)
    goto LABEL_10;
LABEL_6:
  OUTLINED_FUNCTION_7_2();
  OUTLINED_FUNCTION_26_0();
  OUTLINED_FUNCTION_36_0();
  OUTLINED_FUNCTION_9_1();
  if (v4)
  {
LABEL_7:
    OUTLINED_FUNCTION_7_2();
    OUTLINED_FUNCTION_33();
    sub_226F01770();
    return swift_bridgeObjectRelease();
  }
  return OUTLINED_FUNCTION_7_2();
}

uint64_t MusicSubscriptionOffer.Options.hashValue.getter()
{
  OUTLINED_FUNCTION_32_1();
  MusicSubscriptionOffer.Options.hash(into:)();
  return OUTLINED_FUNCTION_23_2();
}

uint64_t sub_226EFADD0()
{
  sub_226F0192C();
  MusicSubscriptionOffer.Options.hash(into:)();
  return sub_226F0195C();
}

uint64_t MusicSubscriptionOffer.Options.description.getter()
{
  uint64_t *v0;
  uint64_t v1;
  unint64_t v2;
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
  uint64_t v16;
  char v18;
  BOOL v19;
  uint64_t v20;
  unint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  __int128 v25;
  uint64_t v26;
  uint64_t v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  uint64_t v33;
  unint64_t v34;
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

  v1 = *v0;
  v2 = v0[1];
  v4 = v0[2];
  v3 = v0[3];
  v6 = v0[4];
  v5 = v0[5];
  v7 = v0[6];
  v8 = v0[7];
  v9 = v0[8];
  v10 = v0[9];
  v12 = v0[10];
  v11 = v0[11];
  v14 = v0[12];
  v13 = v0[13];
  v33 = *v0;
  v34 = v2;
  v35 = v4;
  v36 = v3;
  v37 = v6;
  v38 = v5;
  v39 = v7;
  v40 = v8;
  v41 = v9;
  v42 = v10;
  v22 = v10;
  v23 = v11;
  v43 = v12;
  v44 = v11;
  v45 = v14;
  v46 = v13;
  v24 = v13;
  if (qword_2558AC758 != -1)
    swift_once();
  v25 = xmmword_2558AC9F8;
  v26 = qword_2558ACA08;
  v27 = unk_2558ACA10;
  v28 = xmmword_2558ACA18;
  v29 = unk_2558ACA28;
  v30 = xmmword_2558ACA38;
  v31 = unk_2558ACA48;
  v32 = unk_2558ACA58;
  if ((static MusicSubscriptionOffer.Options.== infix(_:_:)(&v33, &v25) & 1) != 0)
    return 0x746C75616665642ELL;
  v33 = 0;
  v34 = 0xE000000000000000;
  v16 = qword_2558AC738;
  OUTLINED_FUNCTION_13_2();
  if (v16 != -1)
    swift_once();
  if (v1 == qword_2558AC9B8 && v2 == qword_2558AC9C0)
  {
    OUTLINED_FUNCTION_14_2();
  }
  else
  {
    v18 = OUTLINED_FUNCTION_0_6();
    OUTLINED_FUNCTION_14_2();
    if ((v18 & 1) == 0)
    {
      *(_QWORD *)&v25 = 0x203A6E6F69746361;
      *((_QWORD *)&v25 + 1) = 0xE800000000000000;
      v19 = qword_2558AC9B8 == v1 && qword_2558AC9C0 == v2;
      if (v19 || (OUTLINED_FUNCTION_0_6() & 1) != 0)
      {
        OUTLINED_FUNCTION_13_2();
      }
      else
      {
        OUTLINED_FUNCTION_22_2();
        swift_bridgeObjectRetain_n();
        sub_226F01788();
        OUTLINED_FUNCTION_14_2();
        OUTLINED_FUNCTION_21_2();
      }
      sub_226F01788();
      OUTLINED_FUNCTION_14_2();
      OUTLINED_FUNCTION_9_1();
      OUTLINED_FUNCTION_28_1();
      OUTLINED_FUNCTION_9_1();
      v21 = v34;
      v20 = v33 & 0xFFFFFFFFFFFFLL;
      goto LABEL_22;
    }
  }
  v20 = 0;
  v21 = 0xE000000000000000;
LABEL_22:
  if ((v21 & 0x2000000000000000) != 0)
    v20 = HIBYTE(v21) & 0xF;
  if (v20)
    sub_226F01788();
  OUTLINED_FUNCTION_11_3();
  sub_226F01860();
  OUTLINED_FUNCTION_12_2();
  *(_QWORD *)&v25 = 0xD000000000000013;
  *((_QWORD *)&v25 + 1) = 0x8000000226F03BF0;
  OUTLINED_FUNCTION_33();
  MusicSubscriptionOffer.MessageIdentifier.description.getter();
  sub_226F01788();
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_9_1();
  OUTLINED_FUNCTION_28_1();
  OUTLINED_FUNCTION_9_1();
  if (v5)
  {
    *(_QWORD *)&v25 = 0x44496D657469202CLL;
    *((_QWORD *)&v25 + 1) = 0xEA0000000000203ALL;
    sub_226F01668();
    sub_226F01788();
    OUTLINED_FUNCTION_17();
    OUTLINED_FUNCTION_4_3();
    OUTLINED_FUNCTION_17();
  }
  if (v8)
  {
    OUTLINED_FUNCTION_11_3();
    sub_226F01860();
    OUTLINED_FUNCTION_12_2();
    OUTLINED_FUNCTION_33_1();
    sub_226F01788();
    OUTLINED_FUNCTION_4_3();
    OUTLINED_FUNCTION_17();
  }
  if (v22)
  {
    OUTLINED_FUNCTION_11_3();
    sub_226F01860();
    OUTLINED_FUNCTION_12_2();
    OUTLINED_FUNCTION_33_1();
    OUTLINED_FUNCTION_6_2();
    OUTLINED_FUNCTION_4_3();
    OUTLINED_FUNCTION_17();
  }
  if (v23)
  {
    OUTLINED_FUNCTION_18_2();
    OUTLINED_FUNCTION_12_2();
    OUTLINED_FUNCTION_29_0();
    OUTLINED_FUNCTION_6_2();
    OUTLINED_FUNCTION_4_3();
    OUTLINED_FUNCTION_17();
  }
  if (v24)
  {
    OUTLINED_FUNCTION_18_2();
    OUTLINED_FUNCTION_12_2();
    OUTLINED_FUNCTION_29_0();
    OUTLINED_FUNCTION_6_2();
    OUTLINED_FUNCTION_4_3();
    OUTLINED_FUNCTION_17();
  }
  OUTLINED_FUNCTION_11_3();
  sub_226F01860();
  OUTLINED_FUNCTION_12_2();
  *(_QWORD *)&v25 = 0xD00000000000001FLL;
  *((_QWORD *)&v25 + 1) = 0x8000000226F03C10;
  OUTLINED_FUNCTION_6_2();
  OUTLINED_FUNCTION_17();
  sub_226F01788();
  return v25;
}

void MusicSubscriptionOffer.Action.description.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  BOOL v3;

  v1 = *(_QWORD *)(v0 + 8);
  if (qword_2558AC738 != -1)
    swift_once();
  OUTLINED_FUNCTION_35_0((uint64_t)&qword_2558AC9B8);
  v3 = v3 && v2 == v1;
  if (!v3 && (OUTLINED_FUNCTION_0_6() & 1) == 0)
  {
    OUTLINED_FUNCTION_22_2();
    OUTLINED_FUNCTION_8();
    OUTLINED_FUNCTION_6_2();
    OUTLINED_FUNCTION_17();
    OUTLINED_FUNCTION_21_2();
  }
  OUTLINED_FUNCTION_25();
}

void MusicSubscriptionOffer.MessageIdentifier.description.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  BOOL v3;
  uint64_t v4;
  BOOL v5;
  uint64_t v6;
  BOOL v7;

  v1 = *(_QWORD *)(v0 + 8);
  if (qword_2558AC740 != -1)
    swift_once();
  OUTLINED_FUNCTION_35_0((uint64_t)&qword_2558AC9C8);
  v3 = v3 && v2 == v1;
  if (!v3 && (OUTLINED_FUNCTION_0_6() & 1) == 0)
  {
    if (qword_2558AC748 != -1)
      swift_once();
    OUTLINED_FUNCTION_35_0((uint64_t)&qword_2558AC9D8);
    v5 = v3 && v4 == v1;
    if (!v5 && (OUTLINED_FUNCTION_0_6() & 1) == 0)
    {
      if (qword_2558AC750 != -1)
        swift_once();
      OUTLINED_FUNCTION_35_0((uint64_t)&qword_2558AC9E8);
      v7 = v3 && v6 == v1;
      if (!v7 && (OUTLINED_FUNCTION_0_6() & 1) == 0)
      {
        sub_226F01860();
        swift_bridgeObjectRelease();
        OUTLINED_FUNCTION_8();
        OUTLINED_FUNCTION_6_2();
        OUTLINED_FUNCTION_17();
        OUTLINED_FUNCTION_21_2();
      }
    }
  }
  OUTLINED_FUNCTION_25();
}

unint64_t sub_226EFB4B0()
{
  unint64_t result;

  result = qword_2558ACA68;
  if (!qword_2558ACA68)
  {
    result = MEMORY[0x2276A650C](&protocol conformance descriptor for MusicSubscriptionOffer.Action, &type metadata for MusicSubscriptionOffer.Action);
    atomic_store(result, (unint64_t *)&qword_2558ACA68);
  }
  return result;
}

unint64_t sub_226EFB4F0()
{
  unint64_t result;

  result = qword_2558ACA70;
  if (!qword_2558ACA70)
  {
    result = MEMORY[0x2276A650C](&protocol conformance descriptor for MusicSubscriptionOffer.MessageIdentifier, &type metadata for MusicSubscriptionOffer.MessageIdentifier);
    atomic_store(result, (unint64_t *)&qword_2558ACA70);
  }
  return result;
}

unint64_t sub_226EFB530()
{
  unint64_t result;

  result = qword_2558ACA78;
  if (!qword_2558ACA78)
  {
    result = MEMORY[0x2276A650C](&protocol conformance descriptor for MusicSubscriptionOffer.Options, &type metadata for MusicSubscriptionOffer.Options);
    atomic_store(result, (unint64_t *)&qword_2558ACA78);
  }
  return result;
}

void type metadata accessor for MusicSubscriptionOffer.Action()
{
  OUTLINED_FUNCTION_30_1();
}

_QWORD *_s17MessageIdentifierVwCP(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t _s17MessageIdentifierVwxx()
{
  return swift_bridgeObjectRelease();
}

_QWORD *_s6ActionVwca_0(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  OUTLINED_FUNCTION_47();
  return a1;
}

_QWORD *_s17MessageIdentifierVwta(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t _s6ActionVwet_0(uint64_t a1, int a2)
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

uint64_t sub_226EFB664(uint64_t result, int a2, int a3)
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

void type metadata accessor for MusicSubscriptionOffer.MessageIdentifier()
{
  OUTLINED_FUNCTION_30_1();
}

uint64_t _s7OptionsVwxx()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

_QWORD *_s7OptionsVwcp(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  v4 = a2[3];
  a1[2] = a2[2];
  a1[3] = v4;
  v5 = a2[5];
  a1[4] = a2[4];
  a1[5] = v5;
  v6 = a2[7];
  a1[6] = a2[6];
  a1[7] = v6;
  v7 = a2[9];
  a1[8] = a2[8];
  a1[9] = v7;
  v8 = a2[11];
  a1[10] = a2[10];
  a1[11] = v8;
  v9 = a2[13];
  a1[12] = a2[12];
  a1[13] = v9;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

_QWORD *_s7OptionsVwca(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  a1[3] = a2[3];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[4] = a2[4];
  a1[5] = a2[5];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[6] = a2[6];
  a1[7] = a2[7];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[8] = a2[8];
  a1[9] = a2[9];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[10] = a2[10];
  a1[11] = a2[11];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[12] = a2[12];
  a1[13] = a2[13];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

void *__swift_memcpy112_8(void *a1, const void *a2)
{
  return memcpy(a1, a2, 0x70uLL);
}

_QWORD *_s7OptionsVwta(_QWORD *a1, _QWORD *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  swift_bridgeObjectRelease();
  v5 = a2[3];
  a1[2] = a2[2];
  a1[3] = v5;
  swift_bridgeObjectRelease();
  v6 = a2[5];
  a1[4] = a2[4];
  a1[5] = v6;
  swift_bridgeObjectRelease();
  v7 = a2[7];
  a1[6] = a2[6];
  a1[7] = v7;
  swift_bridgeObjectRelease();
  v8 = a2[9];
  a1[8] = a2[8];
  a1[9] = v8;
  swift_bridgeObjectRelease();
  v9 = a2[11];
  a1[10] = a2[10];
  a1[11] = v9;
  swift_bridgeObjectRelease();
  v10 = a2[13];
  a1[12] = a2[12];
  a1[13] = v10;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t _s7OptionsVwet(uint64_t a1, int a2)
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

uint64_t _s7OptionsVwst(uint64_t result, int a2, int a3)
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
      *(_QWORD *)(result + 8) = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 112) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

void type metadata accessor for MusicSubscriptionOffer.Options()
{
  OUTLINED_FUNCTION_30_1();
}

unint64_t sub_226EFB9F0()
{
  unint64_t result;
  uint64_t v1;

  result = qword_2558AC7B0;
  if (!qword_2558AC7B0)
  {
    type metadata accessor for MusicKit_SPI_SKCloudServiceSetupOptionsKey(255);
    result = MEMORY[0x2276A650C](&unk_226F02130, v1);
    atomic_store(result, (unint64_t *)&qword_2558AC7B0);
  }
  return result;
}

void sub_226EFBA30(uint64_t a1, void *a2)
{
  _OWORD v3[2];

  if (*(_QWORD *)(a1 + 24))
  {
    sub_226EFBCF4((_OWORD *)a1, v3);
    sub_226EFBD04(v3, a2);

  }
  else
  {
    sub_226EEA884(a1);
    sub_226EFBBD4((uint64_t)a2, v3);

    sub_226EEA884((uint64_t)v3);
  }
}

uint64_t sub_226EFBA94()
{
  uint64_t result;

  result = sub_226F01734();
  qword_2558AE138 = result;
  return result;
}

uint64_t sub_226EFBAC0()
{
  uint64_t result;

  result = sub_226F01734();
  qword_2558AE140 = result;
  return result;
}

uint64_t sub_226EFBAEC()
{
  uint64_t v0;

  sub_226F01758();
  sub_226F0192C();
  OUTLINED_FUNCTION_36_0();
  v0 = OUTLINED_FUNCTION_23_2();
  OUTLINED_FUNCTION_9_1();
  return v0;
}

unint64_t sub_226EFBB54(uint64_t a1)
{
  uint64_t v2;

  sub_226F01758();
  sub_226F0192C();
  sub_226F01770();
  v2 = sub_226F0195C();
  swift_bridgeObjectRelease();
  return sub_226EFBEE0(a1, v2);
}

double sub_226EFBBD4@<D0>(uint64_t a1@<X0>, _OWORD *a2@<X8>)
{
  uint64_t *v2;
  uint64_t *v3;
  unint64_t v6;
  char v7;
  double result;
  uint64_t v9;

  v3 = v2;
  swift_bridgeObjectRetain();
  v6 = sub_226EFBB54(a1);
  LOBYTE(a1) = v7;
  swift_bridgeObjectRelease();
  if ((a1 & 1) != 0)
  {
    swift_isUniquelyReferenced_nonNull_native();
    v9 = *v3;
    *v3 = 0x8000000000000000;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2558ACA80);
    sub_226F01890();

    sub_226EFBCF4((_OWORD *)(*(_QWORD *)(v9 + 56) + 32 * v6), a2);
    type metadata accessor for MusicKit_SPI_SKCloudServiceSetupOptionsKey(0);
    sub_226EFB9F0();
    sub_226F0189C();
    *v3 = v9;
    swift_bridgeObjectRelease();
  }
  else
  {
    result = 0.0;
    *a2 = 0u;
    a2[1] = 0u;
  }
  return result;
}

_OWORD *sub_226EFBCF4(_OWORD *a1, _OWORD *a2)
{
  __int128 v2;

  v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t sub_226EFBD04(_OWORD *a1, void *a2)
{
  uint64_t *v2;
  uint64_t v6;

  swift_isUniquelyReferenced_nonNull_native();
  v6 = *v2;
  *v2 = 0x8000000000000000;
  sub_226EFBD70(a1, a2);
  *v2 = v6;
  return swift_bridgeObjectRelease();
}

_OWORD *sub_226EFBD70(_OWORD *a1, void *a2)
{
  _QWORD *v2;
  _QWORD **v3;
  _QWORD *v5;
  unint64_t v6;
  char v7;
  unint64_t v8;
  char v9;
  unint64_t v10;
  char v11;
  _QWORD *v12;
  _OWORD *v13;
  _OWORD *result;

  v3 = (_QWORD **)v2;
  v5 = (_QWORD *)*v2;
  v6 = sub_226EFBB54((uint64_t)a2);
  if (__OFADD__(v5[2], (v7 & 1) == 0))
  {
    __break(1u);
    goto LABEL_9;
  }
  v8 = v6;
  v9 = v7;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2558ACA80);
  if ((sub_226F01890() & 1) == 0)
    goto LABEL_5;
  v10 = sub_226EFBB54((uint64_t)a2);
  if ((v9 & 1) != (v11 & 1))
  {
LABEL_9:
    type metadata accessor for MusicKit_SPI_SKCloudServiceSetupOptionsKey(0);
    result = (_OWORD *)sub_226F018F0();
    __break(1u);
    return result;
  }
  v8 = v10;
LABEL_5:
  v12 = *v3;
  if ((v9 & 1) != 0)
  {
    v13 = (_OWORD *)(v12[7] + 32 * v8);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v13);
    return sub_226EFBCF4(a1, v13);
  }
  else
  {
    sub_226EFBE7C(v8, (uint64_t)a2, a1, v12);
    return a2;
  }
}

_OWORD *sub_226EFBE7C(unint64_t a1, uint64_t a2, _OWORD *a3, _QWORD *a4)
{
  _OWORD *result;
  uint64_t v6;
  BOOL v7;
  uint64_t v8;

  a4[(a1 >> 6) + 8] |= 1 << a1;
  *(_QWORD *)(a4[6] + 8 * a1) = a2;
  result = sub_226EFBCF4(a3, (_OWORD *)(a4[7] + 32 * a1));
  v6 = a4[2];
  v7 = __OFADD__(v6, 1);
  v8 = v6 + 1;
  if (v7)
    __break(1u);
  else
    a4[2] = v8;
  return result;
}

unint64_t sub_226EFBEE0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char v18;

  v3 = v2 + 64;
  v4 = -1 << *(_BYTE *)(v2 + 32);
  v5 = a2 & ~v4;
  if (((*(_QWORD *)(v2 + 64 + ((v5 >> 3) & 0xFFFFFFFFFFFFF8)) >> v5) & 1) != 0)
  {
    v6 = sub_226F01758();
    v8 = v7;
    if (v6 == sub_226F01758() && v8 == v9)
    {
LABEL_16:
      swift_bridgeObjectRelease_n();
      return v5;
    }
    v11 = sub_226F018E4();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if ((v11 & 1) == 0)
    {
      v12 = ~v4;
      v5 = (v5 + 1) & v12;
      if (((*(_QWORD *)(v3 + ((v5 >> 3) & 0xFFFFFFFFFFFFF8)) >> v5) & 1) != 0)
      {
        while (1)
        {
          v13 = sub_226F01758();
          v15 = v14;
          if (v13 == sub_226F01758() && v15 == v16)
            break;
          v18 = sub_226F018E4();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          if ((v18 & 1) == 0)
          {
            v5 = (v5 + 1) & v12;
            if (((*(_QWORD *)(v3 + ((v5 >> 3) & 0xFFFFFFFFFFFFF8)) >> v5) & 1) != 0)
              continue;
          }
          return v5;
        }
        goto LABEL_16;
      }
    }
  }
  return v5;
}

uint64_t OUTLINED_FUNCTION_0_6()
{
  return sub_226F018E4();
}

void OUTLINED_FUNCTION_1_5(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, ...)
{
  va_list va;

  va_start(va, a6);
  sub_226EFBA30((uint64_t)va, a1);
}

uint64_t OUTLINED_FUNCTION_4_3()
{
  return sub_226F01788();
}

uint64_t OUTLINED_FUNCTION_5_2@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X1>, _QWORD *a3@<X8>)
{
  return sub_226EFA418(a1, a2, a2 + 1, a3);
}

uint64_t OUTLINED_FUNCTION_6_2()
{
  return sub_226F01788();
}

uint64_t OUTLINED_FUNCTION_7_2()
{
  return sub_226F01944();
}

uint64_t OUTLINED_FUNCTION_8_3()
{
  return swift_bridgeObjectRetain();
}

uint64_t OUTLINED_FUNCTION_9_1()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_12_2()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_13_2()
{
  return swift_bridgeObjectRetain();
}

uint64_t OUTLINED_FUNCTION_14_2()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_16_3()
{
  uint64_t v0;

  return v0;
}

uint64_t OUTLINED_FUNCTION_17_2()
{
  return sub_226F01770();
}

uint64_t OUTLINED_FUNCTION_18_2()
{
  return sub_226F01860();
}

uint64_t OUTLINED_FUNCTION_19_2@<X0>(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v2;

  *a2 = v2;
  a2[1] = a1;
  return swift_bridgeObjectRetain();
}

uint64_t OUTLINED_FUNCTION_20_2()
{
  return 0;
}

uint64_t OUTLINED_FUNCTION_21_2()
{
  return sub_226F01788();
}

uint64_t OUTLINED_FUNCTION_23_2()
{
  return sub_226F0195C();
}

uint64_t OUTLINED_FUNCTION_26_0()
{
  return swift_bridgeObjectRetain();
}

uint64_t OUTLINED_FUNCTION_28_1()
{
  return sub_226F01788();
}

uint64_t OUTLINED_FUNCTION_32_1()
{
  return sub_226F0192C();
}

uint64_t OUTLINED_FUNCTION_35_0@<X0>(uint64_t a1@<X8>)
{
  return *(_QWORD *)a1;
}

uint64_t OUTLINED_FUNCTION_36_0()
{
  return sub_226F01770();
}

void destroy for CloudServiceSetupView(uint64_t a1)
{
  swift_release();
  swift_release();
  sub_226EF42A0(*(void **)(a1 + 16), *(_QWORD *)(a1 + 24), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 80), *(_QWORD *)(a1 + 88), *(_QWORD *)(a1 + 96), *(_QWORD *)(a1 + 104), *(_QWORD *)(a1 + 112), *(_QWORD *)(a1 + 120), *(_QWORD *)(a1 + 128), *(_WORD *)(a1 + 136), HIBYTE(*(_WORD *)(a1 + 136)));
}

uint64_t initializeWithCopy for CloudServiceSetupView(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char v10;
  char v11;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;

  v3 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v3;
  v20 = *(_QWORD *)(a2 + 24);
  v21 = *(void **)(a2 + 16);
  v18 = *(_QWORD *)(a2 + 40);
  v19 = *(_QWORD *)(a2 + 32);
  v16 = *(_QWORD *)(a2 + 56);
  v17 = *(_QWORD *)(a2 + 48);
  v14 = *(_QWORD *)(a2 + 72);
  v15 = *(_QWORD *)(a2 + 64);
  v4 = *(_QWORD *)(a2 + 88);
  v5 = *(_QWORD *)(a2 + 96);
  v6 = *(_QWORD *)(a2 + 104);
  v7 = *(_QWORD *)(a2 + 112);
  v8 = *(_QWORD *)(a2 + 120);
  v13 = *(_QWORD *)(a2 + 80);
  v9 = *(_QWORD *)(a2 + 128);
  v10 = *(_BYTE *)(a2 + 136);
  v11 = *(_BYTE *)(a2 + 137);
  swift_retain();
  swift_retain();
  sub_226EF4404(v21, v20, v19, v18, v17, v16, v15, v14, v13, v4, v5, v6, v7, v8, v9, v10, v11);
  *(_QWORD *)(a1 + 16) = v21;
  *(_QWORD *)(a1 + 24) = v20;
  *(_QWORD *)(a1 + 32) = v19;
  *(_QWORD *)(a1 + 40) = v18;
  *(_QWORD *)(a1 + 48) = v17;
  *(_QWORD *)(a1 + 56) = v16;
  *(_QWORD *)(a1 + 64) = v15;
  *(_QWORD *)(a1 + 72) = v14;
  *(_QWORD *)(a1 + 80) = v13;
  *(_QWORD *)(a1 + 88) = v4;
  *(_QWORD *)(a1 + 96) = v5;
  *(_QWORD *)(a1 + 104) = v6;
  *(_QWORD *)(a1 + 112) = v7;
  *(_QWORD *)(a1 + 120) = v8;
  *(_QWORD *)(a1 + 128) = v9;
  *(_BYTE *)(a1 + 136) = v10;
  *(_BYTE *)(a1 + 137) = v11;
  return a1;
}

uint64_t assignWithCopy for CloudServiceSetupView(uint64_t a1, _QWORD *a2)
{
  _QWORD *v2;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  uint64_t v23;
  __int16 v24;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  char v33;

  v2 = a2;
  *(_QWORD *)a1 = *a2;
  swift_retain();
  swift_release();
  *(_QWORD *)(a1 + 8) = v2[1];
  swift_retain();
  swift_release();
  v4 = (void *)v2[2];
  v5 = v2[3];
  v6 = v2[4];
  v7 = v2[5];
  v8 = v2[6];
  v9 = v2[7];
  v10 = v2[8];
  v11 = v2[9];
  v26 = v2[10];
  v27 = v2[11];
  v28 = v2[12];
  v29 = v2[13];
  v30 = v2[14];
  v31 = v2[15];
  v32 = v2[16];
  v33 = *((_BYTE *)v2 + 136);
  LOBYTE(v2) = *((_BYTE *)v2 + 137);
  sub_226EF4404(v4, v5, v6, v7, v8, v9, v10, v11, v26, v27, v28, v29, v30, v31, v32, v33, (char)v2);
  v12 = *(void **)(a1 + 16);
  v13 = *(_QWORD *)(a1 + 24);
  v14 = *(_QWORD *)(a1 + 32);
  v15 = *(_QWORD *)(a1 + 40);
  v16 = *(_QWORD *)(a1 + 48);
  v17 = *(_QWORD *)(a1 + 56);
  v18 = *(_QWORD *)(a1 + 64);
  v19 = *(_QWORD *)(a1 + 72);
  v20 = *(_OWORD *)(a1 + 80);
  v21 = *(_OWORD *)(a1 + 96);
  v22 = *(_OWORD *)(a1 + 112);
  v23 = *(_QWORD *)(a1 + 128);
  v24 = *(_WORD *)(a1 + 136);
  *(_QWORD *)(a1 + 16) = v4;
  *(_QWORD *)(a1 + 24) = v5;
  *(_QWORD *)(a1 + 32) = v6;
  *(_QWORD *)(a1 + 40) = v7;
  *(_QWORD *)(a1 + 48) = v8;
  *(_QWORD *)(a1 + 56) = v9;
  *(_QWORD *)(a1 + 64) = v10;
  *(_QWORD *)(a1 + 72) = v11;
  *(_QWORD *)(a1 + 80) = v26;
  *(_QWORD *)(a1 + 88) = v27;
  *(_QWORD *)(a1 + 96) = v28;
  *(_QWORD *)(a1 + 104) = v29;
  *(_QWORD *)(a1 + 112) = v30;
  *(_QWORD *)(a1 + 120) = v31;
  *(_QWORD *)(a1 + 128) = v32;
  *(_BYTE *)(a1 + 136) = v33;
  *(_BYTE *)(a1 + 137) = (_BYTE)v2;
  sub_226EF42A0(v12, v13, v14, v15, v16, v17, v18, v19, v20, *((uint64_t *)&v20 + 1), v21, *((uint64_t *)&v21 + 1), v22, *((uint64_t *)&v22 + 1), v23, v24, SHIBYTE(v24));
  return a1;
}

void *__swift_memcpy138_8(void *a1, const void *a2)
{
  return memcpy(a1, a2, 0x8AuLL);
}

uint64_t assignWithTake for CloudServiceSetupView(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  __int16 v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  uint64_t v17;
  __int16 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;

  swift_release();
  *(_OWORD *)a1 = *(_OWORD *)a2;
  swift_release();
  v4 = *(_QWORD *)(a2 + 128);
  v5 = *(_WORD *)(a2 + 136);
  v6 = *(void **)(a1 + 16);
  v7 = *(_QWORD *)(a1 + 24);
  v8 = *(_QWORD *)(a1 + 32);
  v9 = *(_QWORD *)(a1 + 40);
  v10 = *(_QWORD *)(a1 + 48);
  v11 = *(_QWORD *)(a1 + 56);
  v12 = *(_QWORD *)(a1 + 64);
  v13 = *(_QWORD *)(a1 + 72);
  v14 = *(_OWORD *)(a1 + 80);
  v15 = *(_OWORD *)(a1 + 96);
  v16 = *(_OWORD *)(a1 + 112);
  v17 = *(_QWORD *)(a1 + 128);
  v18 = *(_WORD *)(a1 + 136);
  v19 = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(a1 + 32) = v19;
  v20 = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 48) = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 64) = v20;
  v21 = *(_OWORD *)(a2 + 96);
  *(_OWORD *)(a1 + 80) = *(_OWORD *)(a2 + 80);
  *(_OWORD *)(a1 + 96) = v21;
  *(_OWORD *)(a1 + 112) = *(_OWORD *)(a2 + 112);
  *(_QWORD *)(a1 + 128) = v4;
  *(_WORD *)(a1 + 136) = v5;
  sub_226EF42A0(v6, v7, v8, v9, v10, v11, v12, v13, v14, *((uint64_t *)&v14 + 1), v15, *((uint64_t *)&v15 + 1), v16, *((uint64_t *)&v16 + 1), v17, v18, SHIBYTE(v18));
  return a1;
}

uint64_t getEnumTagSinglePayload for CloudServiceSetupView(uint64_t a1, int a2)
{
  unint64_t v2;

  if (a2)
  {
    if (a2 < 0 && *(_BYTE *)(a1 + 138))
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

uint64_t storeEnumTagSinglePayload for CloudServiceSetupView(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 120) = 0u;
    *(_OWORD *)(result + 104) = 0u;
    *(_OWORD *)(result + 88) = 0u;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_WORD *)(result + 136) = 0;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 138) = 1;
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
    *(_BYTE *)(result + 138) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for CloudServiceSetupView()
{
  return &type metadata for CloudServiceSetupView;
}

uint64_t sub_226EFC68C()
{
  return MEMORY[0x24BDF5560];
}

id sub_226EFC698()
{
  _BYTE v1[144];
  _BYTE v2[144];

  OUTLINED_FUNCTION_0_7(v2);
  _s11CoordinatorCMa();
  OUTLINED_FUNCTION_0_7(v1);
  sub_226EFCA44((uint64_t)v2);
  return sub_226EFCB54(v1);
}

uint64_t sub_226EFC6F0()
{
  uint64_t v0;
  void *v1;
  void *v2;
  uint64_t result;
  _BYTE v4[128];
  _QWORD v5[18];
  _QWORD __dst[18];
  _QWORD v7[16];
  _BYTE __src[144];
  _BYTE v9[128];
  _BYTE v10[128];

  OUTLINED_FUNCTION_0_7(__src);
  OUTLINED_FUNCTION_0_7(__dst);
  v0 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2558ACB30);
  MEMORY[0x2276A5DA4](v7);
  sub_226EF40EC(v7, v9);
  sub_226EF40EC(v9, v10);
  if (sub_226EF5354((uint64_t)v10))
  {
    sub_226EF5048((uint64_t)v9);
    __dst[0] = 0;
    __dst[1] = 0xE000000000000000;
    sub_226EFCA44((uint64_t)__src);
    sub_226F01860();
    v5[16] = __dst[0];
    v5[17] = __dst[1];
    sub_226F01788();
    memcpy(__dst, __src, 0x8AuLL);
    MEMORY[0x2276A5DA4](v5, v0);
    sub_226EF40EC(v5, __dst);
    sub_226EF40EC(__dst, v4);
    sub_226F01884();
    sub_226EF5048((uint64_t)__dst);
    sub_226F01788();
    result = sub_226F018B4();
    __break(1u);
  }
  else
  {
    v1 = *(void **)nullsub_1(v10);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    __swift_instantiateConcreteTypeFromMangledName(&qword_2558ACA88);
    sub_226F014A0();
    v2 = (void *)__dst[0];
    objc_msgSend(v1, sel_musicKit_setDelegate_, __dst[0]);

    return (uint64_t)v1;
  }
  return result;
}

id sub_226EFC920@<X0>(_QWORD *a1@<X8>)
{
  id result;

  result = sub_226EFC698();
  *a1 = result;
  return result;
}

uint64_t sub_226EFC944()
{
  return sub_226F01458();
}

uint64_t sub_226EFC97C()
{
  sub_226EFCB0C();
  return sub_226F01494();
}

uint64_t sub_226EFC9CC()
{
  sub_226EFCB0C();
  return sub_226F01464();
}

void sub_226EFCA1C()
{
  sub_226EFCB0C();
  sub_226F01488();
  __break(1u);
}

uint64_t sub_226EFCA44(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int16 v9;
  __int128 v11;
  uint64_t v12[2];
  uint64_t v13[2];
  uint64_t v14;
  void *v15;

  v2 = *(_QWORD *)(a1 + 32);
  v14 = *(_QWORD *)(a1 + 24);
  v15 = *(void **)(a1 + 16);
  v3 = *(_QWORD *)(a1 + 40);
  v4 = *(_QWORD *)(a1 + 48);
  v5 = *(_QWORD *)(a1 + 56);
  v6 = *(_QWORD *)(a1 + 64);
  v7 = *(_QWORD *)(a1 + 72);
  *(_OWORD *)v12 = *(_OWORD *)(a1 + 96);
  *(_OWORD *)v13 = *(_OWORD *)(a1 + 80);
  v11 = *(_OWORD *)(a1 + 112);
  v8 = *(_QWORD *)(a1 + 128);
  v9 = *(_WORD *)(a1 + 136);
  swift_retain();
  swift_retain();
  sub_226EF4404(v15, v14, v2, v3, v4, v5, v6, v7, v13[0], v13[1], v12[0], v12[1], v11, *((uint64_t *)&v11 + 1), v8, v9, SHIBYTE(v9));
  return a1;
}

unint64_t sub_226EFCB0C()
{
  unint64_t result;

  result = qword_2558ACA90;
  if (!qword_2558ACA90)
  {
    result = MEMORY[0x2276A650C](&unk_226F02F38, &type metadata for CloudServiceSetupView);
    atomic_store(result, (unint64_t *)&qword_2558ACA90);
  }
  return result;
}

void *OUTLINED_FUNCTION_0_7(void *a1)
{
  const void *v1;

  return memcpy(a1, v1, 0x8AuLL);
}

id sub_226EFCB54(const void *a1)
{
  objc_class *v1;
  char *v3;
  objc_super v5;

  v3 = (char *)objc_allocWithZone(v1);
  OUTLINED_FUNCTION_0_8(&v3[OBJC_IVAR____TtCV17_MusicKit_SwiftUI21CloudServiceSetupView11Coordinator_parent], a1);
  v5.receiver = v3;
  v5.super_class = v1;
  return objc_msgSendSuper2(&v5, sel_init);
}

uint64_t sub_226EFCBB4()
{
  uint64_t v0;
  uint64_t v2;
  _BYTE v3[144];
  _BYTE v4[144];
  _BYTE v5[128];

  OUTLINED_FUNCTION_0_8(v4, (const void *)(v0 + OBJC_IVAR____TtCV17_MusicKit_SwiftUI21CloudServiceSetupView11Coordinator_parent));
  sub_226EF40C8((uint64_t)v5);
  OUTLINED_FUNCTION_0_8(v3, v4);
  sub_226EF40EC(v5, &v2);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2558ACB30);
  return sub_226F015F0();
}

void sub_226EFCC70()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

id sub_226EFCCA8()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)_s11CoordinatorCMa();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t _s11CoordinatorCMa()
{
  return objc_opt_self();
}

uint64_t sub_226EFCD2C(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int16 v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  uint64_t v14;
  void *v15;

  v2 = *(_QWORD *)(a1 + 32);
  v14 = *(_QWORD *)(a1 + 24);
  v15 = *(void **)(a1 + 16);
  v3 = *(_QWORD *)(a1 + 40);
  v4 = *(_QWORD *)(a1 + 48);
  v5 = *(_QWORD *)(a1 + 56);
  v6 = *(_QWORD *)(a1 + 64);
  v7 = *(_QWORD *)(a1 + 72);
  v12 = *(_OWORD *)(a1 + 96);
  v13 = *(_OWORD *)(a1 + 80);
  v11 = *(_OWORD *)(a1 + 112);
  v8 = *(_QWORD *)(a1 + 128);
  v9 = *(_WORD *)(a1 + 136);
  swift_release();
  swift_release();
  sub_226EF42A0(v15, v14, v2, v3, v4, v5, v6, v7, v13, *((uint64_t *)&v13 + 1), v12, *((uint64_t *)&v12 + 1), v11, *((uint64_t *)&v11 + 1), v8, v9, SHIBYTE(v9));
  return a1;
}

void *OUTLINED_FUNCTION_0_8(void *a1, const void *a2)
{
  return memcpy(a1, a2, 0x8AuLL);
}

void _s17PresentationStateOwxx(uint64_t a1)
{
  sub_226EF42A0(*(void **)a1, *(_QWORD *)(a1 + 8), *(_QWORD *)(a1 + 16), *(_QWORD *)(a1 + 24), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 80), *(_QWORD *)(a1 + 88), *(_QWORD *)(a1 + 96), *(_QWORD *)(a1 + 104), *(_QWORD *)(a1 + 112), *(_WORD *)(a1 + 120), HIBYTE(*(_WORD *)(a1 + 120)));
}

uint64_t _s17PresentationStateOwcp(uint64_t a1, uint64_t a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char v19;
  char v20;

  v3 = *(id *)a2;
  v4 = *(_QWORD *)(a2 + 8);
  v5 = *(_QWORD *)(a2 + 16);
  v6 = *(_QWORD *)(a2 + 24);
  v7 = *(_QWORD *)(a2 + 32);
  v8 = *(_QWORD *)(a2 + 40);
  v9 = *(_QWORD *)(a2 + 48);
  v10 = *(_QWORD *)(a2 + 56);
  v11 = *(_QWORD *)(a2 + 64);
  v13 = *(_QWORD *)(a2 + 72);
  v14 = *(_QWORD *)(a2 + 80);
  v15 = *(_QWORD *)(a2 + 88);
  v16 = *(_QWORD *)(a2 + 96);
  v17 = *(_QWORD *)(a2 + 104);
  v18 = *(_QWORD *)(a2 + 112);
  v19 = *(_BYTE *)(a2 + 120);
  v20 = *(_BYTE *)(a2 + 121);
  sub_226EF4404(*(id *)a2, v4, v5, v6, v7, v8, v9, v10, v11, v13, v14, v15, v16, v17, v18, v19, v20);
  *(_QWORD *)a1 = v3;
  *(_QWORD *)(a1 + 8) = v4;
  *(_QWORD *)(a1 + 16) = v5;
  *(_QWORD *)(a1 + 24) = v6;
  *(_QWORD *)(a1 + 32) = v7;
  *(_QWORD *)(a1 + 40) = v8;
  *(_QWORD *)(a1 + 48) = v9;
  *(_QWORD *)(a1 + 56) = v10;
  *(_QWORD *)(a1 + 64) = v11;
  *(_QWORD *)(a1 + 72) = v13;
  *(_QWORD *)(a1 + 80) = v14;
  *(_QWORD *)(a1 + 88) = v15;
  *(_QWORD *)(a1 + 96) = v16;
  *(_QWORD *)(a1 + 104) = v17;
  *(_QWORD *)(a1 + 112) = v18;
  *(_BYTE *)(a1 + 120) = v19;
  *(_BYTE *)(a1 + 121) = v20;
  return a1;
}

uint64_t _s17PresentationStateOwca(uint64_t a1, uint64_t a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  uint64_t v23;
  __int16 v24;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  char v32;
  char v33;

  v3 = *(id *)a2;
  v4 = *(_QWORD *)(a2 + 8);
  v5 = *(_QWORD *)(a2 + 16);
  v6 = *(_QWORD *)(a2 + 24);
  v7 = *(_QWORD *)(a2 + 32);
  v8 = *(_QWORD *)(a2 + 40);
  v9 = *(_QWORD *)(a2 + 48);
  v10 = *(_QWORD *)(a2 + 56);
  v11 = *(_QWORD *)(a2 + 64);
  v26 = *(_QWORD *)(a2 + 72);
  v27 = *(_QWORD *)(a2 + 80);
  v28 = *(_QWORD *)(a2 + 88);
  v29 = *(_QWORD *)(a2 + 96);
  v30 = *(_QWORD *)(a2 + 104);
  v31 = *(_QWORD *)(a2 + 112);
  v32 = *(_BYTE *)(a2 + 120);
  v33 = *(_BYTE *)(a2 + 121);
  sub_226EF4404(*(id *)a2, v4, v5, v6, v7, v8, v9, v10, v11, v26, v27, v28, v29, v30, v31, v32, v33);
  v12 = *(void **)a1;
  v13 = *(_QWORD *)(a1 + 8);
  v14 = *(_QWORD *)(a1 + 16);
  v15 = *(_QWORD *)(a1 + 24);
  v16 = *(_QWORD *)(a1 + 32);
  v17 = *(_QWORD *)(a1 + 40);
  v18 = *(_QWORD *)(a1 + 48);
  v19 = *(_QWORD *)(a1 + 56);
  v20 = *(_OWORD *)(a1 + 64);
  v21 = *(_OWORD *)(a1 + 80);
  v22 = *(_OWORD *)(a1 + 96);
  v23 = *(_QWORD *)(a1 + 112);
  v24 = *(_WORD *)(a1 + 120);
  *(_QWORD *)a1 = v3;
  *(_QWORD *)(a1 + 8) = v4;
  *(_QWORD *)(a1 + 16) = v5;
  *(_QWORD *)(a1 + 24) = v6;
  *(_QWORD *)(a1 + 32) = v7;
  *(_QWORD *)(a1 + 40) = v8;
  *(_QWORD *)(a1 + 48) = v9;
  *(_QWORD *)(a1 + 56) = v10;
  *(_QWORD *)(a1 + 64) = v11;
  *(_QWORD *)(a1 + 72) = v26;
  *(_QWORD *)(a1 + 80) = v27;
  *(_QWORD *)(a1 + 88) = v28;
  *(_QWORD *)(a1 + 96) = v29;
  *(_QWORD *)(a1 + 104) = v30;
  *(_QWORD *)(a1 + 112) = v31;
  *(_BYTE *)(a1 + 120) = v32;
  *(_BYTE *)(a1 + 121) = v33;
  sub_226EF42A0(v12, v13, v14, v15, v16, v17, v18, v19, v20, *((uint64_t *)&v20 + 1), v21, *((uint64_t *)&v21 + 1), v22, *((uint64_t *)&v22 + 1), v23, v24, SHIBYTE(v24));
  return a1;
}

void *__swift_memcpy122_8(void *a1, const void *a2)
{
  return memcpy(a1, a2, 0x7AuLL);
}

uint64_t _s17PresentationStateOwta(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  __int16 v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  uint64_t v16;
  __int16 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;

  v3 = *(_QWORD *)(a2 + 112);
  v4 = *(_WORD *)(a2 + 120);
  v5 = *(void **)a1;
  v7 = *(_QWORD *)(a1 + 8);
  v6 = *(_QWORD *)(a1 + 16);
  v8 = *(_QWORD *)(a1 + 24);
  v9 = *(_QWORD *)(a1 + 32);
  v10 = *(_QWORD *)(a1 + 40);
  v11 = *(_QWORD *)(a1 + 48);
  v12 = *(_QWORD *)(a1 + 56);
  v13 = *(_OWORD *)(a1 + 64);
  v14 = *(_OWORD *)(a1 + 80);
  v15 = *(_OWORD *)(a1 + 96);
  v16 = *(_QWORD *)(a1 + 112);
  v17 = *(_WORD *)(a1 + 120);
  v18 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v18;
  v19 = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 48) = v19;
  v20 = *(_OWORD *)(a2 + 80);
  *(_OWORD *)(a1 + 64) = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 80) = v20;
  *(_OWORD *)(a1 + 96) = *(_OWORD *)(a2 + 96);
  *(_QWORD *)(a1 + 112) = v3;
  *(_WORD *)(a1 + 120) = v4;
  sub_226EF42A0(v5, v7, v6, v8, v9, v10, v11, v12, v13, *((uint64_t *)&v13 + 1), v14, *((uint64_t *)&v14 + 1), v15, *((uint64_t *)&v15 + 1), v16, v17, SHIBYTE(v17));
  return a1;
}

uint64_t _s17PresentationStateOwet(uint64_t a1, unsigned int a2)
{
  int v2;
  unsigned int v3;

  if (a2)
  {
    if (a2 >= 0xFE && *(_BYTE *)(a1 + 122))
    {
      v2 = *(_DWORD *)a1 + 253;
    }
    else
    {
      v3 = *(unsigned __int8 *)(a1 + 121);
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

uint64_t _s17PresentationStateOwst(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFD)
  {
    *(_OWORD *)(result + 104) = 0u;
    *(_OWORD *)(result + 88) = 0u;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_WORD *)(result + 120) = 0;
    *(_QWORD *)result = a2 - 254;
    if (a3 >= 0xFE)
      *(_BYTE *)(result + 122) = 1;
  }
  else
  {
    if (a3 >= 0xFE)
      *(_BYTE *)(result + 122) = 0;
    if (a2)
      *(_BYTE *)(result + 121) = -(char)a2;
  }
  return result;
}

uint64_t sub_226EFD1E0(uint64_t result, unsigned int a2)
{
  if (a2 >= 2)
  {
    *(_QWORD *)result = a2 - 2;
    *(_OWORD *)(result + 8) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 88) = 0u;
    *(_OWORD *)(result + 104) = 0u;
    LOBYTE(a2) = 2;
    *(_BYTE *)(result + 120) = 0;
  }
  *(_BYTE *)(result + 121) = a2;
  return result;
}

ValueMetadata *_s17PresentationStateOMa()
{
  return &_s17PresentationStateON;
}

BOOL sub_226EFD230(unsigned __int8 a1, unsigned __int8 a2)
{
  if (a1 == 2)
    return a2 == 2;
  if (a1 == 3)
    return a2 == 3;
  if ((a2 & 0xFE) == 2)
    return 0;
  return ((a2 ^ a1) & 1) == 0;
}

uint64_t sub_226EFD288(uint64_t a1, char a2)
{
  if (a2 != 2 && a2 != 3)
    sub_226F01938();
  return sub_226F01938();
}

uint64_t sub_226EFD2DC(char a1)
{
  OUTLINED_FUNCTION_32_1();
  if (a1 != 2 && a1 != 3)
    sub_226F01938();
  sub_226F01938();
  return sub_226F0195C();
}

BOOL sub_226EFD348(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return sub_226EFD230(*a1, *a2);
}

uint64_t sub_226EFD354()
{
  char *v0;

  return sub_226EFD2DC(*v0);
}

uint64_t sub_226EFD35C(uint64_t a1)
{
  char *v1;

  return sub_226EFD288(a1, *v1);
}

uint64_t sub_226EFD364()
{
  unsigned __int8 *v0;
  int v1;

  v1 = *v0;
  sub_226F0192C();
  if (v1 != 2 && v1 != 3)
    sub_226F01938();
  sub_226F01938();
  return sub_226F0195C();
}

BOOL sub_226EFD3D4(const void *a1, const void *a2)
{
  int v3;
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
  void *v37;
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
  unsigned __int8 v48;
  __int128 v49;
  uint64_t v50;
  uint64_t v51;
  unsigned __int8 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  uint64_t v57;
  char v58;
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
  void *v75;
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
  __int128 v92;
  uint64_t v93;
  uint64_t v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  uint64_t v101;
  uint64_t v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
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
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t v128;
  uint64_t v129;
  uint64_t v130;
  uint64_t v131;
  uint64_t v132;
  uint64_t v133;
  uint64_t v134;
  _BYTE v135[128];
  _BYTE v136[128];
  uint64_t v137;
  _BYTE v138[128];

  sub_226EF40EC(a1, &v124);
  sub_226EF40EC(a2, v135);
  sub_226EF40EC(&v124, v136);
  sub_226EF40EC(v135, &v137);
  sub_226EF40EC(&v124, v138);
  v3 = sub_226EF5354((uint64_t)v138);
  if (v3)
  {
    if (v3 == 1)
    {
      nullsub_1(v138);
      v4 = sub_226EF40EC(v135, &v108);
      v12 = OUTLINED_FUNCTION_0_9((uint64_t)v4, v5, v6, v7, v8, v9, v10, v11, v92, *((uint64_t *)&v92 + 1), v93, v94, v95, *((uint64_t *)&v95 + 1), v96, *((uint64_t *)&v96 + 1), v97, *((uint64_t *)&v97 + 1), v98,
              *((uint64_t *)&v98 + 1),
              v99,
              *((uint64_t *)&v99 + 1),
              v100,
              *((uint64_t *)&v100 + 1),
              v101,
              v102,
              v103,
              *((uint64_t *)&v103 + 1),
              v104,
              *((uint64_t *)&v104 + 1),
              v105,
              *((uint64_t *)&v105 + 1),
              v106,
              *((uint64_t *)&v106 + 1),
              v107,
              *((uint64_t *)&v107 + 1),
              v108);
      if ((_DWORD)v12 == 1)
      {
        v20 = nullsub_1(&v108);
        v28 = OUTLINED_FUNCTION_2_4(v20, v21, v22, v23, v24, v25, v26, v27, v92, *((uint64_t *)&v92 + 1), v93, v94, v95, *((uint64_t *)&v95 + 1), v96, *((uint64_t *)&v96 + 1), v97, *((uint64_t *)&v97 + 1), v98,
                *((uint64_t *)&v98 + 1),
                v99,
                *((uint64_t *)&v99 + 1),
                v100,
                *((uint64_t *)&v100 + 1),
                v101,
                v102,
                v103,
                *((uint64_t *)&v103 + 1),
                v104,
                *((uint64_t *)&v104 + 1),
                v105,
                *((uint64_t *)&v105 + 1),
                v106,
                *((uint64_t *)&v106 + 1),
                v107,
                *((uint64_t *)&v107 + 1),
                v108,
                v109,
                v110,
                v111,
                v112,
                v113,
                v114,
                v115,
                v116,
                v117,
                v118,
                v119,
                v120,
                v121,
                v122,
                v123,
                v124,
                v125,
                v126,
                v127,
                v128,
                v129,
                v130,
                v131,
                v132,
                v133,
                v134);
        OUTLINED_FUNCTION_4_4(v28, v29, v30, v31, v32, v33, v34, v35, v92, *((uint64_t *)&v92 + 1), v93, v94, v95, *((uint64_t *)&v95 + 1), v96, *((uint64_t *)&v96 + 1), v97, *((uint64_t *)&v97 + 1), v98,
          *((uint64_t *)&v98 + 1),
          v99,
          *((uint64_t *)&v99 + 1),
          v100,
          *((uint64_t *)&v100 + 1),
          v101,
          v102,
          v103,
          *((uint64_t *)&v103 + 1),
          v104,
          *((uint64_t *)&v104 + 1),
          v105,
          *((uint64_t *)&v105 + 1),
          v106,
          *((uint64_t *)&v106 + 1),
          v107,
          *((uint64_t *)&v107 + 1),
          v108,
          v109,
          v110,
          v111,
          v112,
          v113,
          v114,
          v115,
          v116,
          v117,
          v118,
          v119,
          v120,
          v121,
          v122,
          v123,
          v124);
LABEL_9:
        OUTLINED_FUNCTION_3_3();
        return 1;
      }
    }
    else
    {
      v75 = sub_226EF40EC(v135, &v108);
      v12 = OUTLINED_FUNCTION_0_9((uint64_t)v75, v76, v77, v78, v79, v80, v81, v82, v92, *((uint64_t *)&v92 + 1), v93, v94, v95, *((uint64_t *)&v95 + 1), v96, *((uint64_t *)&v96 + 1), v97, *((uint64_t *)&v97 + 1), v98,
              *((uint64_t *)&v98 + 1),
              v99,
              *((uint64_t *)&v99 + 1),
              v100,
              *((uint64_t *)&v100 + 1),
              v101,
              v102,
              v103,
              *((uint64_t *)&v103 + 1),
              v104,
              *((uint64_t *)&v104 + 1),
              v105,
              *((uint64_t *)&v105 + 1),
              v106,
              *((uint64_t *)&v106 + 1),
              v107,
              *((uint64_t *)&v107 + 1),
              v108);
      if ((_DWORD)v12 == 2)
        goto LABEL_9;
    }
    goto LABEL_10;
  }
  v36 = nullsub_1(v138);
  v37 = sub_226EF40EC(v135, &v108);
  v12 = OUTLINED_FUNCTION_0_9((uint64_t)v37, v38, v39, v40, v41, v42, v43, v44, v92, *((uint64_t *)&v92 + 1), v93, v94, v95, *((uint64_t *)&v95 + 1), v96, *((uint64_t *)&v96 + 1), v97, *((uint64_t *)&v97 + 1), v98,
          *((uint64_t *)&v98 + 1),
          v99,
          *((uint64_t *)&v99 + 1),
          v100,
          *((uint64_t *)&v100 + 1),
          v101,
          v102,
          v103,
          *((uint64_t *)&v103 + 1),
          v104,
          *((uint64_t *)&v104 + 1),
          v105,
          *((uint64_t *)&v105 + 1),
          v106,
          *((uint64_t *)&v106 + 1),
          v107,
          *((uint64_t *)&v107 + 1),
          v108);
  if ((_DWORD)v12)
  {
LABEL_10:
    v83 = OUTLINED_FUNCTION_2_4(v12, v13, v14, v15, v16, v17, v18, v19, v92, *((uint64_t *)&v92 + 1), v93, v94, v95, *((uint64_t *)&v95 + 1), v96, *((uint64_t *)&v96 + 1), v97, *((uint64_t *)&v97 + 1), v98,
            *((uint64_t *)&v98 + 1),
            v99,
            *((uint64_t *)&v99 + 1),
            v100,
            *((uint64_t *)&v100 + 1),
            v101,
            v102,
            v103,
            *((uint64_t *)&v103 + 1),
            v104,
            *((uint64_t *)&v104 + 1),
            v105,
            *((uint64_t *)&v105 + 1),
            v106,
            *((uint64_t *)&v106 + 1),
            v107,
            *((uint64_t *)&v107 + 1),
            v108,
            v109,
            v110,
            v111,
            v112,
            v113,
            v114,
            v115,
            v116,
            v117,
            v118,
            v119,
            v120,
            v121,
            v122,
            v123,
            v124,
            v125,
            v126,
            v127,
            v128,
            v129,
            v130,
            v131,
            v132,
            v133,
            v134);
    OUTLINED_FUNCTION_4_4(v83, v84, v85, v86, v87, v88, v89, v90, v92, *((uint64_t *)&v92 + 1), v93, v94, v95, *((uint64_t *)&v95 + 1), v96, *((uint64_t *)&v96 + 1), v97, *((uint64_t *)&v97 + 1), v98,
      *((uint64_t *)&v98 + 1),
      v99,
      *((uint64_t *)&v99 + 1),
      v100,
      *((uint64_t *)&v100 + 1),
      v101,
      v102,
      v103,
      *((uint64_t *)&v103 + 1),
      v104,
      *((uint64_t *)&v104 + 1),
      v105,
      *((uint64_t *)&v105 + 1),
      v106,
      *((uint64_t *)&v106 + 1),
      v107,
      *((uint64_t *)&v107 + 1),
      v108,
      v109,
      v110,
      v111,
      v112,
      v113,
      v114,
      v115,
      v116,
      v117,
      v118,
      v119,
      v120,
      v121,
      v122,
      v123,
      v124);
    OUTLINED_FUNCTION_3_3();
    return 0;
  }
  v45 = nullsub_1(&v108);
  v46 = *(_QWORD *)(v36 + 24);
  v47 = *(_QWORD *)(v36 + 32);
  v48 = *(_BYTE *)(v36 + 120);
  v49 = *(_OWORD *)(v45 + 8);
  v50 = *(_QWORD *)(v45 + 24);
  v51 = *(_QWORD *)(v45 + 32);
  v52 = *(_BYTE *)(v45 + 120);
  v100 = *(_OWORD *)(v36 + 8);
  v101 = v46;
  v102 = v47;
  v53 = *(_OWORD *)(v36 + 56);
  v103 = *(_OWORD *)(v36 + 40);
  v104 = v53;
  v54 = *(_OWORD *)(v36 + 88);
  v105 = *(_OWORD *)(v36 + 72);
  v106 = v54;
  v107 = *(_OWORD *)(v36 + 104);
  v92 = v49;
  v93 = v50;
  v94 = v51;
  v55 = *(_OWORD *)(v45 + 56);
  v95 = *(_OWORD *)(v45 + 40);
  v96 = v55;
  v56 = *(_OWORD *)(v45 + 88);
  v97 = *(_OWORD *)(v45 + 72);
  v98 = v56;
  v99 = *(_OWORD *)(v45 + 104);
  v57 = static MusicSubscriptionOffer.Options.== infix(_:_:)(&v100, &v92);
  v58 = v57;
  v66 = OUTLINED_FUNCTION_2_4(v57, v59, v60, v61, v62, v63, v64, v65, v92, *((uint64_t *)&v92 + 1), v93, v94, v95, *((uint64_t *)&v95 + 1), v96, *((uint64_t *)&v96 + 1), v97, *((uint64_t *)&v97 + 1), v98,
          *((uint64_t *)&v98 + 1),
          v99,
          *((uint64_t *)&v99 + 1),
          v100,
          *((uint64_t *)&v100 + 1),
          v101,
          v102,
          v103,
          *((uint64_t *)&v103 + 1),
          v104,
          *((uint64_t *)&v104 + 1),
          v105,
          *((uint64_t *)&v105 + 1),
          v106,
          *((uint64_t *)&v106 + 1),
          v107,
          *((uint64_t *)&v107 + 1),
          v108,
          v109,
          v110,
          v111,
          v112,
          v113,
          v114,
          v115,
          v116,
          v117,
          v118,
          v119,
          v120,
          v121,
          v122,
          v123,
          v124,
          v125,
          v126,
          v127,
          v128,
          v129,
          v130,
          v131,
          v132,
          v133,
          v134);
  OUTLINED_FUNCTION_4_4(v66, v67, v68, v69, v70, v71, v72, v73, v92, *((uint64_t *)&v92 + 1), v93, v94, v95, *((uint64_t *)&v95 + 1), v96, *((uint64_t *)&v96 + 1), v97, *((uint64_t *)&v97 + 1), v98,
    *((uint64_t *)&v98 + 1),
    v99,
    *((uint64_t *)&v99 + 1),
    v100,
    *((uint64_t *)&v100 + 1),
    v101,
    v102,
    v103,
    *((uint64_t *)&v103 + 1),
    v104,
    *((uint64_t *)&v104 + 1),
    v105,
    *((uint64_t *)&v105 + 1),
    v106,
    *((uint64_t *)&v106 + 1),
    v107,
    *((uint64_t *)&v107 + 1),
    v108,
    v109,
    v110,
    v111,
    v112,
    v113,
    v114,
    v115,
    v116,
    v117,
    v118,
    v119,
    v120,
    v121,
    v122,
    v123,
    v124);
  OUTLINED_FUNCTION_3_3();
  if ((v58 & 1) == 0)
    return 0;
  return sub_226EFD230(v48, v52);
}

uint64_t sub_226EFD580()
{
  const void *v0;
  int v1;
  int v2;
  _BYTE v4[128];
  _BYTE v5[128];

  sub_226EF40EC(v0, v4);
  sub_226EF40EC(v4, v5);
  v1 = sub_226EF5354((uint64_t)v5);
  if (v1)
  {
    if (v1 == 1)
      nullsub_1(v5);
    return sub_226F01770();
  }
  else
  {
    v2 = *(unsigned __int8 *)(nullsub_1(v5) + 120);
    sub_226F01770();
    MusicSubscriptionOffer.Options.hash(into:)();
    if (v2 != 3 && v2 != 2)
      sub_226F01938();
    return sub_226F01938();
  }
}

uint64_t sub_226EFD6E4()
{
  const void *v0;
  _BYTE v2[128];
  _BYTE v3[128];

  sub_226EF40EC(v0, v3);
  sub_226EF40EC(v3, v2);
  OUTLINED_FUNCTION_32_1();
  sub_226EFD580();
  return sub_226F0195C();
}

uint64_t sub_226EFD73C()
{
  const void *v0;
  _BYTE v2[128];
  _BYTE v3[128];

  sub_226EF40EC(v0, v3);
  sub_226EF40EC(v3, v2);
  sub_226F0192C();
  sub_226EFD580();
  return sub_226F0195C();
}

uint64_t sub_226EFD7A0(uint64_t a1)
{
  sub_226EF4404(*(id *)a1, *(_QWORD *)(a1 + 8), *(_QWORD *)(a1 + 16), *(_QWORD *)(a1 + 24), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 80), *(_QWORD *)(a1 + 88), *(_QWORD *)(a1 + 96), *(_QWORD *)(a1 + 104), *(_QWORD *)(a1 + 112), *(_WORD *)(a1 + 120), HIBYTE(*(_WORD *)(a1 + 120)));
  return a1;
}

uint64_t sub_226EFD800(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int16 v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  void *v15;

  v2 = *(_QWORD *)(a1 + 136);
  v15 = *(void **)(a1 + 128);
  v3 = *(_QWORD *)(a1 + 144);
  v4 = *(_QWORD *)(a1 + 152);
  v5 = *(_QWORD *)(a1 + 160);
  v6 = *(_QWORD *)(a1 + 168);
  v7 = *(_QWORD *)(a1 + 176);
  v8 = *(_QWORD *)(a1 + 184);
  v13 = *(_OWORD *)(a1 + 208);
  v14 = *(_OWORD *)(a1 + 192);
  v12 = *(_OWORD *)(a1 + 224);
  v9 = *(_QWORD *)(a1 + 240);
  v10 = *(_WORD *)(a1 + 248);
  sub_226EF42A0(*(void **)a1, *(_QWORD *)(a1 + 8), *(_QWORD *)(a1 + 16), *(_QWORD *)(a1 + 24), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 80), *(_QWORD *)(a1 + 88), *(_QWORD *)(a1 + 96), *(_QWORD *)(a1 + 104), *(_QWORD *)(a1 + 112), *(_WORD *)(a1 + 120), HIBYTE(*(_WORD *)(a1 + 120)));
  sub_226EF42A0(v15, v2, v3, v4, v5, v6, v7, v8, v14, *((uint64_t *)&v14 + 1), v13, *((uint64_t *)&v13 + 1), v12, *((uint64_t *)&v12 + 1), v9, v10, SHIBYTE(v10));
  return a1;
}

uint64_t _s17PresentationStateO14ActiveSubstateOwet(unsigned __int8 *a1, unsigned int a2)
{
  unsigned int v2;
  unsigned int v3;
  uint64_t v4;
  unsigned int v6;
  unsigned int v7;

  if (!a2)
    return 0;
  if (a2 < 0xFD)
  {
    v6 = *a1;
    if (v6 >= 2)
      v7 = v6 - 1;
    else
      v7 = 0;
    if (v7 >= 3)
      return v7 - 2;
    else
      return 0;
  }
  else
  {
    v2 = a2 + 3;
    if (a2 + 3 >= 0xFFFF00)
      v3 = 4;
    else
      v3 = 2;
    if (v2 >> 8 < 0xFF)
      v3 = 1;
    if (v2 >= 0x100)
      v4 = v3;
    else
      v4 = 0;
    return ((uint64_t (*)(void))((char *)&loc_226EFD940 + 4 * asc_226F02FC0[v4]))();
  }
}

uint64_t _s17PresentationStateO14ActiveSubstateOwst(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  unsigned int v3;
  int v4;
  uint64_t v5;

  v3 = a3 + 3;
  if (a3 + 3 >= 0xFFFF00)
    v4 = 4;
  else
    v4 = 2;
  if (v3 >> 8 < 0xFF)
    v4 = 1;
  if (v3 >= 0x100)
    LODWORD(v5) = v4;
  else
    LODWORD(v5) = 0;
  if (a3 >= 0xFD)
    v5 = v5;
  else
    v5 = 0;
  if (a2 <= 0xFC)
    return ((uint64_t (*)(void))((char *)&loc_226EFD9EC + 4 * byte_226F02FCA[v5]))();
  *a1 = a2 + 3;
  return ((uint64_t (*)(void))((char *)sub_226EFDA20 + 4 * byte_226F02FC5[v5]))();
}

uint64_t sub_226EFDA20(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_226EFDA28(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x226EFDA30);
  return result;
}

uint64_t sub_226EFDA3C(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x226EFDA44);
  *(_BYTE *)result = a2 + 3;
  return result;
}

uint64_t sub_226EFDA48(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_226EFDA50(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_226EFDA5C(unsigned __int8 *a1)
{
  unsigned int v1;

  v1 = *a1;
  if (v1 >= 2)
    return v1 - 1;
  else
    return 0;
}

_BYTE *sub_226EFDA70(_BYTE *result, int a2)
{
  if (a2)
    *result = a2 + 1;
  return result;
}

ValueMetadata *_s17PresentationStateO14ActiveSubstateOMa()
{
  return &_s17PresentationStateO14ActiveSubstateON;
}

unint64_t sub_226EFDA94()
{
  unint64_t result;

  result = qword_2558ACBA0;
  if (!qword_2558ACBA0)
  {
    result = MEMORY[0x2276A650C](&unk_226F0309C, &_s17PresentationStateO14ActiveSubstateON);
    atomic_store(result, (unint64_t *)&qword_2558ACBA0);
  }
  return result;
}

uint64_t OUTLINED_FUNCTION_0_9(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,char a37)
{
  return sub_226EF5354((uint64_t)&a37);
}

uint64_t OUTLINED_FUNCTION_2_4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  char a69;

  return sub_226EFD7A0((uint64_t)&a69);
}

uint64_t OUTLINED_FUNCTION_3_3()
{
  return sub_226EFD800((uint64_t)&STACK[0x260]);
}

uint64_t OUTLINED_FUNCTION_4_4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,char a53)
{
  return sub_226EFD7A0((uint64_t)&a53);
}

BOOL static ArtworkImage._ReusePolicy.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t ArtworkImage._ReusePolicy.hash(into:)()
{
  return sub_226F01938();
}

void *static ArtworkImage._ReusePolicy.allCases.getter()
{
  return &unk_24EF41728;
}

uint64_t ArtworkImage._ReusePolicy.hashValue.getter()
{
  sub_226F0192C();
  sub_226F01938();
  return sub_226F0195C();
}

void sub_226EFDB80(_QWORD *a1@<X8>)
{
  *a1 = &unk_24EF41728;
}

uint64_t sub_226EFDB9C()
{
  sub_226F0192C();
  sub_226F01938();
  return sub_226F0195C();
}

unint64_t sub_226EFDBE0()
{
  unint64_t result;
  uint64_t v1;

  result = qword_2558ACBA8;
  if (!qword_2558ACBA8)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2558ACBB0);
    result = MEMORY[0x2276A650C](MEMORY[0x24BEE12E0], v1);
    atomic_store(result, (unint64_t *)&qword_2558ACBA8);
  }
  return result;
}

unint64_t sub_226EFDC28()
{
  unint64_t result;

  result = qword_2558ACBB8;
  if (!qword_2558ACBB8)
  {
    result = MEMORY[0x2276A650C](&protocol conformance descriptor for ArtworkImage._ReusePolicy, &type metadata for ArtworkImage._ReusePolicy);
    atomic_store(result, &qword_2558ACBB8);
  }
  return result;
}

uint64_t _s12_ReusePolicyOwet(unsigned __int8 *a1, unsigned int a2)
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
  if (a2 >= 0xFF)
  {
    if (a2 + 1 >= 0xFFFF00)
      v2 = 4;
    else
      v2 = 2;
    if ((a2 + 1) >> 8 < 0xFF)
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
    v5 = (*a1 | (v4 << 8)) - 2;
    return (v5 + 1);
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 2;
  v5 = v6 - 2;
  if (!v7)
    v5 = -1;
  return (v5 + 1);
}

uint64_t _s12_ReusePolicyOwst(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_226EFDD38 + 4 * byte_226F030C9[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_226EFDD6C + 4 * byte_226F030C4[v4]))();
}

uint64_t sub_226EFDD6C(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_226EFDD74(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x226EFDD7CLL);
  return result;
}

uint64_t sub_226EFDD88(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x226EFDD90);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_226EFDD94(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_226EFDD9C(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

_BYTE *sub_226EFDDA8(_BYTE *result, char a2)
{
  *result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for ArtworkImage._ReusePolicy()
{
  return &type metadata for ArtworkImage._ReusePolicy;
}

id sub_226EFDDC4(uint64_t a1)
{
  void *v1;
  id v2;
  uint64_t v3;
  id v4;
  id v5;
  uint64_t v7;
  NSObject *v8;
  os_log_type_t v9;
  uint8_t *v10;
  _QWORD *v11;
  id v12;
  id v13;
  id v14[4];

  v2 = OUTLINED_FUNCTION_1_6(a1, sel_dataSource);
  if (v2)
  {
    v3 = (uint64_t)v2;
    v4 = OUTLINED_FUNCTION_1_6((uint64_t)v2, sel_token);
    sub_226F01848();
    swift_unknownObjectRelease();
    v5 = objc_allocWithZone(MEMORY[0x24BDDC6D8]);
    return sub_226EFE290(v14, v3);
  }
  else
  {
    if (qword_2558AC728 != -1)
      swift_once();
    v7 = sub_226F012E4();
    __swift_project_value_buffer(v7, (uint64_t)qword_2558AE108);
    v13 = v1;
    v8 = sub_226F012CC();
    v9 = sub_226F017F4();
    if (os_log_type_enabled(v8, v9))
    {
      v10 = (uint8_t *)swift_slowAlloc();
      v11 = (_QWORD *)swift_slowAlloc();
      *(_DWORD *)v10 = 138412290;
      v14[0] = v13;
      v12 = v13;
      sub_226F01830();
      *v11 = v13;

      _os_log_impl(&dword_226EE6000, v8, v9, "Data source for artwork catalog %@ was deallocated prematurely. Unable to make a proper fresh instance.", v10, 0xCu);
      __swift_instantiateConcreteTypeFromMangledName(&qword_2558AC998);
      swift_arrayDestroy();
      OUTLINED_FUNCTION_16_2();
    }

    return v13;
  }
}

uint64_t sub_226EFDFD0(id a1, id a2)
{
  uint64_t v2;
  uint64_t v3;

  if (!a2)
    return a1 == 0;
  if (!a1)
    return 0;
  if (a2 == a1)
    return 1;
  return (uint64_t)objc_msgSend(a2, sel_isArtworkVisuallyIdenticalToCatalog_, a1, v2, v3);
}

id sub_226EFE024()
{
  void *v0;
  id v1;

  v1 = objc_msgSend(v0, sel_isImagePrepared);
  if ((_DWORD)v1)
    return OUTLINED_FUNCTION_1_6((uint64_t)v1, sel_image);
  else
    return 0;
}

uint64_t sub_226EFE064()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(v1 + 128) = v0;
  return swift_task_switch();
}

uint64_t sub_226EFE07C()
{
  uint64_t v0;
  id v1;
  id v3;
  void *v4;
  uint64_t v5;
  _QWORD *v6;

  v1 = sub_226EFE024();
  if (v1)
    return (*(uint64_t (**)(id))(v0 + 8))(v1);
  v3 = objc_msgSend(*(id *)(v0 + 128), sel_image);
  *(_QWORD *)(v0 + 136) = v3;
  if (!v3)
    return (*(uint64_t (**)(id))(v0 + 8))(v1);
  v4 = v3;
  *(_QWORD *)(v0 + 56) = v0 + 120;
  *(_QWORD *)(v0 + 16) = v0;
  *(_QWORD *)(v0 + 24) = sub_226EFE158;
  v5 = swift_continuation_init();
  *(_QWORD *)(v0 + 80) = MEMORY[0x24BDAC760];
  v6 = (_QWORD *)(v0 + 80);
  v6[1] = 0x40000000;
  v6[2] = sub_226EFE1DC;
  v6[3] = &block_descriptor_2;
  v6[4] = v5;
  objc_msgSend(v4, sel_prepareForDisplayWithCompletionHandler_, v6);
  return swift_continuation_await();
}

uint64_t sub_226EFE158()
{
  return swift_task_switch();
}

uint64_t sub_226EFE1A4()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 120);

  return (*(uint64_t (**)(uint64_t))(v0 + 8))(v1);
}

uint64_t sub_226EFE1DC(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;

  v3 = *(_QWORD *)(a1 + 32);
  v4 = a2;
  return sub_226EFE208(v3, (uint64_t)a2);
}

uint64_t sub_226EFE208(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = a2;
  sub_226EFE248((uint64_t)&v3, *(_QWORD *)(*(_QWORD *)(a1 + 64) + 40));
  return swift_continuation_resume();
}

uint64_t sub_226EFE248(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_253F43250);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

id sub_226EFE290(_QWORD *a1, uint64_t a2)
{
  void *v2;
  id v5;

  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  v5 = objc_msgSend(v2, sel_initWithToken_dataSource_, sub_226F018D8(), a2);
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  return v5;
}

id OUTLINED_FUNCTION_1_6(uint64_t a1, const char *a2)
{
  void *v2;

  return objc_msgSend(v2, a2);
}

id sub_226EFE310()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_init);
}

id sub_226EFE364()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for MusicKit_SwiftUI_FinalClass()
{
  return objc_opt_self();
}

id sub_226EFE3B8()
{
  uint64_t ObjCClassFromMetadata;
  id result;

  type metadata accessor for MusicKit_SwiftUI_FinalClass();
  ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  result = objc_msgSend((id)objc_opt_self(), sel_bundleForClass_, ObjCClassFromMetadata);
  qword_2558AE148 = (uint64_t)result;
  return result;
}

uint64_t static Artwork._LoadingStatus.== infix(_:_:)(uint64_t a1)
{
  return ((uint64_t (*)(void))((char *)sub_226EFE434 + 4 * byte_226F031C0[*(unsigned __int8 *)(a1 + 8)]))();
}

BOOL sub_226EFE434@<W0>(double a1@<X8>)
{
  double v1;
  int v2;

  return !v2 && v1 == a1;
}

void Artwork._LoadingStatus.hash(into:)()
{
  __asm { BR              X10 }
}

uint64_t sub_226EFE4B8()
{
  sub_226F01938();
  return sub_226F01950();
}

uint64_t Artwork._LoadingStatus.hashValue.getter()
{
  sub_226F0192C();
  Artwork._LoadingStatus.hash(into:)();
  return sub_226F0195C();
}

uint64_t sub_226EFE55C()
{
  sub_226F0192C();
  Artwork._LoadingStatus.hash(into:)();
  return sub_226F0195C();
}

unint64_t sub_226EFE5AC()
{
  unint64_t result;

  result = qword_2558ACBF0;
  if (!qword_2558ACBF0)
  {
    result = MEMORY[0x2276A650C](&protocol conformance descriptor for Artwork._LoadingStatus, &type metadata for Artwork._LoadingStatus);
    atomic_store(result, (unint64_t *)&qword_2558ACBF0);
  }
  return result;
}

uint64_t __swift_memcpy9_8(uint64_t result, uint64_t *a2)
{
  uint64_t v2;

  v2 = *a2;
  *(_BYTE *)(result + 8) = *((_BYTE *)a2 + 8);
  *(_QWORD *)result = v2;
  return result;
}

uint64_t _s14_LoadingStatusOwet(uint64_t a1, unsigned int a2)
{
  int v2;
  unsigned int v3;

  if (a2)
  {
    if (a2 >= 0xFD && *(_BYTE *)(a1 + 9))
    {
      v2 = *(_DWORD *)a1 + 252;
    }
    else
    {
      v3 = *(unsigned __int8 *)(a1 + 8);
      if (v3 <= 3)
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

uint64_t _s14_LoadingStatusOwst(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFC)
  {
    *(_BYTE *)(result + 8) = 0;
    *(_QWORD *)result = a2 - 253;
    if (a3 >= 0xFD)
      *(_BYTE *)(result + 9) = 1;
  }
  else
  {
    if (a3 >= 0xFD)
      *(_BYTE *)(result + 9) = 0;
    if (a2)
      *(_BYTE *)(result + 8) = -(char)a2;
  }
  return result;
}

uint64_t sub_226EFE680(uint64_t a1)
{
  if (*(unsigned __int8 *)(a1 + 8) <= 2u)
    return *(unsigned __int8 *)(a1 + 8);
  else
    return (*(_DWORD *)a1 + 3);
}

uint64_t sub_226EFE698(uint64_t result, unsigned int a2)
{
  if (a2 >= 3)
  {
    *(_QWORD *)result = a2 - 3;
    LOBYTE(a2) = 3;
  }
  *(_BYTE *)(result + 8) = a2;
  return result;
}

ValueMetadata *type metadata accessor for Artwork._LoadingStatus()
{
  return &type metadata for Artwork._LoadingStatus;
}

void *__swift_memcpy96_8(void *a1, const void *a2)
{
  return memcpy(a1, a2, 0x60uLL);
}

uint64_t _s8GeometryVwet(uint64_t a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;

  if (a2)
  {
    if (a2 >= 0xFE && *(_BYTE *)(a1 + 96))
    {
      v2 = *(_DWORD *)a1 + 253;
    }
    else
    {
      if (*(unsigned __int8 *)(a1 + 57) <= 2u)
        v3 = 2;
      else
        v3 = *(unsigned __int8 *)(a1 + 57);
      v4 = v3 - 3;
      if (*(unsigned __int8 *)(a1 + 57) < 2u)
        v2 = -1;
      else
        v2 = v4;
    }
  }
  else
  {
    v2 = -1;
  }
  return (v2 + 1);
}

uint64_t _s8GeometryVwst(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFD)
  {
    *(_QWORD *)(result + 88) = 0;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_QWORD *)result = a2 - 254;
    if (a3 >= 0xFE)
      *(_BYTE *)(result + 96) = 1;
  }
  else
  {
    if (a3 >= 0xFE)
      *(_BYTE *)(result + 96) = 0;
    if (a2)
      *(_BYTE *)(result + 57) = a2 + 2;
  }
  return result;
}

ValueMetadata *_s8GeometryVMa()
{
  return &_s8GeometryVN;
}

uint64_t sub_226EFE780@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, double a3@<X2>, char a4@<W3>, double a5@<X4>, char a6@<W5>, double a7@<X6>, char a8@<W7>, uint64_t a9@<X8>, unsigned __int8 a10)
{
  uint64_t v10;
  uint64_t v11;
  double v12;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  unint64_t v19;

  v10 = a4 & 1;
  v11 = a6 & 1;
  v12 = 1.0;
  if (result >= 1 && a2 >= 1)
    v12 = (double)result / (double)a2;
  if ((a4 & 1) == 0)
  {
    if ((a6 & 1) == 0)
    {
      v14 = a5;
      v15 = a3;
      v16 = a3;
      v17 = a5;
      v18 = a5;
      if ((a8 & 1) != 0)
        goto LABEL_20;
      goto LABEL_15;
    }
    v15 = a3;
    v14 = a3 / v12;
    if ((a8 & 1) == 0)
    {
      v17 = a3 / a7;
      v16 = a3;
      goto LABEL_15;
    }
    v16 = a3;
    goto LABEL_19;
  }
  if ((a6 & 1) == 0)
  {
    v14 = a5;
    v16 = v12 * a5;
    if ((a8 & 1) == 0)
    {
      v15 = a5 * a7;
      v17 = a5;
LABEL_15:
      v18 = v17;
LABEL_20:
      v19 = a8 & 1 | ((unint64_t)a10 << 8);
      goto LABEL_21;
    }
    v15 = v16;
LABEL_19:
    v18 = v14;
    goto LABEL_20;
  }
  result = 0;
  a2 = 0;
  a3 = 0.0;
  v10 = 0;
  a5 = 0.0;
  v11 = 0;
  a7 = 0.0;
  v16 = 0.0;
  v14 = 0.0;
  v15 = 0.0;
  v19 = 768;
  v18 = 0.0;
LABEL_21:
  *(_QWORD *)a9 = result;
  *(_QWORD *)(a9 + 8) = a2;
  *(double *)(a9 + 16) = a3;
  *(_QWORD *)(a9 + 24) = v10;
  *(double *)(a9 + 32) = a5;
  *(_QWORD *)(a9 + 40) = v11;
  *(double *)(a9 + 48) = a7;
  *(_QWORD *)(a9 + 56) = v19;
  *(double *)(a9 + 64) = v16;
  *(double *)(a9 + 72) = v14;
  *(double *)(a9 + 80) = v15;
  *(double *)(a9 + 88) = v18;
  return result;
}

double sub_226EFE878(double a1)
{
  const void *v1;
  double result;
  float64x2_t v4;
  _BYTE __dst[96];

  memcpy(__dst, v1, sizeof(__dst));
  swift_getAtKeyPath();
  *(_QWORD *)&result = *(_OWORD *)&vmulq_n_f64(vrndaq_f64(vdivq_f64(v4, (float64x2_t)vdupq_lane_s64(*(uint64_t *)&a1, 0))), a1);
  return result;
}

BOOL sub_226EFE8D8(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t v3;
  double v7;
  _BYTE v9[14];
  char v10;
  char v11;
  double v12;
  char v13;

  sub_226EFEB04(v3 + 57, (uint64_t)&v10, &qword_253F42D20);
  sub_226EFEB04((uint64_t)&v10, (uint64_t)&v11, &qword_253F42D20);
  if (v11 != 2)
    return v11 & 1;
  if ((a3 & 1) != 0)
    return 0;
  sub_226EFEB04(v3 + 48, (uint64_t)v9, &qword_253F42C98);
  sub_226EFEB04((uint64_t)v9, (uint64_t)&v12, &qword_253F42C98);
  if ((v13 & 1) != 0)
    return 0;
  v7 = fabs((*(double *)&a1 / *(double *)&a2 - v12) / v12);
  if (v7 <= 2.22044605e-16)
    return 0;
  return v7 < 0.1;
}

BOOL sub_226EFE9C8(uint64_t a1, uint64_t a2)
{
  char v4;
  char v5;
  char v6;
  int v7;

  if (*(_QWORD *)a1 != *(_QWORD *)a2 || *(_QWORD *)(a1 + 8) != *(_QWORD *)(a2 + 8))
    return 0;
  v4 = *(_BYTE *)(a2 + 24);
  if ((*(_BYTE *)(a1 + 24) & 1) != 0)
  {
    if (!*(_BYTE *)(a2 + 24))
      return 0;
  }
  else
  {
    if (*(double *)(a1 + 16) != *(double *)(a2 + 16))
      v4 = 1;
    if ((v4 & 1) != 0)
      return 0;
  }
  v5 = *(_BYTE *)(a2 + 40);
  if ((*(_BYTE *)(a1 + 40) & 1) != 0)
  {
    if (!*(_BYTE *)(a2 + 40))
      return 0;
  }
  else
  {
    if (*(double *)(a1 + 32) != *(double *)(a2 + 32))
      v5 = 1;
    if ((v5 & 1) != 0)
      return 0;
  }
  v6 = *(_BYTE *)(a2 + 56);
  if ((*(_BYTE *)(a1 + 56) & 1) != 0)
  {
    if (!*(_BYTE *)(a2 + 56))
      return 0;
  }
  else
  {
    if (*(double *)(a1 + 48) != *(double *)(a2 + 48))
      v6 = 1;
    if ((v6 & 1) != 0)
      return 0;
  }
  v7 = *(unsigned __int8 *)(a2 + 57);
  if (*(_BYTE *)(a1 + 57) == 2)
  {
    if (v7 != 2)
      return 0;
  }
  else if (v7 == 2 || (sub_226F012F0() & 1) == 0)
  {
    return 0;
  }
  return *(double *)(a1 + 64) == *(double *)(a2 + 64)
      && *(double *)(a1 + 72) == *(double *)(a2 + 72)
      && *(double *)(a1 + 80) == *(double *)(a2 + 80)
      && *(double *)(a1 + 88) == *(double *)(a2 + 88);
}

uint64_t sub_226EFEB04(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t _s18FailureAlertReasonOwst(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_226EFEB94 + 4 * byte_226F032B5[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_226EFEBC8 + 4 * byte_226F032B0[v4]))();
}

uint64_t sub_226EFEBC8(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_226EFEBD0(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x226EFEBD8);
  return result;
}

uint64_t sub_226EFEBE4(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x226EFEBECLL);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_226EFEBF0(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_226EFEBF8(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *_s18FailureAlertReasonOMa()
{
  return &_s18FailureAlertReasonON;
}

void sub_226EFEC18()
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
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
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
  _QWORD v24[2];
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  unint64_t v28;

  v1 = OUTLINED_FUNCTION_2_5();
  MEMORY[0x24BDAC7A8](v1);
  v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_2558ACCE0);
  v20 = *(_QWORD *)(v19 - 8);
  MEMORY[0x24BDAC7A8](v19);
  OUTLINED_FUNCTION_11_0();
  v23 = v2;
  v21 = __swift_instantiateConcreteTypeFromMangledName(&qword_2558ACCE8);
  v22 = *(_QWORD *)(v21 - 8);
  MEMORY[0x24BDAC7A8](v21);
  OUTLINED_FUNCTION_11_0();
  v18 = v3;
  v4 = *(_QWORD *)(v0 + 8);
  v5 = *(_BYTE *)(v0 + 16);
  v25 = *(_QWORD *)v0;
  v26 = v4;
  LOBYTE(v27) = v5;
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2558ACCF0);
  MEMORY[0x2276A5DA4](v24, v6);
  OUTLINED_FUNCTION_6_3();
  v7 = swift_allocObject();
  OUTLINED_FUNCTION_10_1(v7);
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_2558ACCF8);
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_2558AC8E0);
  v10 = sub_226F00C98(&qword_2558ACD00, &qword_2558ACCF8, MEMORY[0x24BDEFB78]);
  v11 = sub_226EF4F60();
  sub_226F01530();
  swift_release();
  v12 = *(_QWORD *)(v0 + 32);
  LOBYTE(v25) = *(_BYTE *)(v0 + 24);
  v26 = v12;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2558AC958);
  sub_226F015B4();
  OUTLINED_FUNCTION_6_3();
  v13 = swift_allocObject();
  OUTLINED_FUNCTION_10_1(v13);
  v25 = v8;
  v26 = v9;
  v27 = v10;
  v28 = v11;
  v14 = OUTLINED_FUNCTION_4_5();
  v15 = MEMORY[0x24BEE1328];
  v16 = MEMORY[0x24BEE1340];
  sub_226F01530();
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v20 + 8))(v23, v19);
  v17 = *(_QWORD *)(v0 + 32);
  LOBYTE(v24[0]) = *(_BYTE *)(v0 + 24);
  v24[1] = v17;
  sub_226F015CC();
  v25 = v19;
  v26 = v15;
  v27 = v14;
  v28 = v16;
  OUTLINED_FUNCTION_4_5();
  sub_226F0150C();
  swift_release();
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v22 + 8))(v18, v21);
  OUTLINED_FUNCTION_4_1();
}

uint64_t sub_226EFEF30(uint64_t a1, unsigned __int8 *a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _BYTE *v8;
  uint64_t v9;
  _BYTE *v10;
  int v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _BYTE v16[15];
  char v17;
  char v18;
  uint64_t v19;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2558AC978);
  v6 = MEMORY[0x24BDAC7A8](v5);
  v8 = &v16[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x24BDAC7A8](v6);
  v10 = &v16[-v9];
  v11 = *a2;
  if (v11 == 2)
  {
    v12 = *(_QWORD *)(a3 + 32);
    v18 = *(_BYTE *)(a3 + 24);
    v19 = v12;
    v17 = 0;
  }
  else
  {
    sub_226EFF29C(v11 & 1, (uint64_t)&v16[-v9]);
    v13 = sub_226F0156C();
    __swift_storeEnumTagSinglePayload((uint64_t)v10, 0, 1, v13);
    _s20FailureAlertModifierVMa();
    sub_226EF51E8((uint64_t)v10, (uint64_t)v8);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2558ACC28);
    sub_226F015C0();
    sub_226F00F74((uint64_t)v10, &qword_2558AC978);
    v14 = *(_QWORD *)(a3 + 32);
    v18 = *(_BYTE *)(a3 + 24);
    v19 = v14;
    v17 = 1;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_2558AC958);
  return sub_226F015C0();
}

uint64_t sub_226EFF084(uint64_t a1, unsigned __int8 *a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t result;
  uint64_t v9;
  char v10;
  int v11;
  uint64_t v12;
  char v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char v17;
  uint64_t v18;

  v5 = _s20FailureAlertModifierVMa();
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  LODWORD(a2) = *a2;
  sub_226F00C44(a3, (uint64_t)v7);
  if ((_DWORD)a2 == 1)
    return sub_226F00D3C((uint64_t)v7);
  v9 = *((_QWORD *)v7 + 1);
  v10 = v7[16];
  v15 = *(_QWORD *)v7;
  v16 = v9;
  v17 = v10;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2558ACCF0);
  MEMORY[0x2276A5DA4](&v18);
  v11 = v18;
  result = sub_226F00D3C((uint64_t)v7);
  if (v11 != 2)
  {
    v12 = *(_QWORD *)(a3 + 8);
    v13 = *(_BYTE *)(a3 + 16);
    v15 = *(_QWORD *)a3;
    v16 = v12;
    v17 = v13;
    LOBYTE(v18) = 2;
    return sub_226F015F0();
  }
  return result;
}

uint64_t sub_226EFF174@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t result;
  uint64_t v7;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2558AC978);
  MEMORY[0x24BDAC7A8](v2);
  v4 = (char *)&v7 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  _s20FailureAlertModifierVMa();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2558ACC28);
  sub_226F015B4();
  v5 = sub_226F0156C();
  if (__swift_getEnumTagSinglePayload((uint64_t)v4, 1, v5) != 1)
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(*(_QWORD *)(v5 - 8) + 32))(a1, v4, v5);
  sub_226F00F74((uint64_t)v4, &qword_2558AC978);
  result = sub_226F018B4();
  __break(1u);
  return result;
}

uint64_t sub_226EFF29C@<X0>(char a1@<W0>, uint64_t a2@<X8>)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  BOOL v8;
  char v10;

  if ((a1 & 1) != 0)
    return sub_226EFFA74(a2);
  v3 = objc_msgSend((id)objc_opt_self(), sel_mainBundle);
  v4 = sub_226F00EDC(v3);
  if (!v5)
    return sub_226EFF734(a2);
  v6 = v4;
  v7 = v5;
  if (qword_2558AC778 != -1)
    swift_once();
  if (qword_2558ACC00)
  {
    v8 = v6 == qword_2558ACBF8 && v7 == qword_2558ACC00;
    if (v8 || (sub_226F018E4() & 1) != 0)
      goto LABEL_21;
  }
  if (qword_2558AC780 != -1)
    swift_once();
  if (qword_2558ACC10)
  {
    if (v6 != qword_2558ACC08 || v7 != qword_2558ACC10)
    {
      v10 = sub_226F018E4();
      swift_bridgeObjectRelease();
      if ((v10 & 1) == 0)
        return sub_226EFF734(a2);
      return sub_226EFF3F8(a2);
    }
LABEL_21:
    swift_bridgeObjectRelease();
    return sub_226EFF3F8(a2);
  }
  swift_bridgeObjectRelease();
  return sub_226EFF734(a2);
}

uint64_t sub_226EFF3F8@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  char v14;
  uint64_t v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char v20;
  char v21;
  unint64_t v22;
  uint64_t v23;
  _QWORD v25[4];
  int v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  char *v32;
  uint64_t v33;

  v33 = a1;
  v1 = _s20FailureAlertModifierVMa();
  v30 = *(_QWORD *)(v1 - 8);
  v2 = *(_QWORD *)(v30 + 64);
  MEMORY[0x24BDAC7A8](v1);
  v3 = sub_226F01560();
  v4 = MEMORY[0x24BDAC7A8](v3);
  v32 = (char *)v25 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v4);
  sub_226F01428();
  if (qword_2558AC770 != -1)
    swift_once();
  v6 = (id)qword_2558AE148;
  v7 = sub_226F014D0();
  v28 = v8;
  v29 = v7;
  v26 = v9;
  v27 = v10;
  sub_226F01428();
  v11 = v6;
  v12 = sub_226F014D0();
  v25[2] = v13;
  v25[3] = v12;
  v25[0] = v14 & 1;
  v25[1] = v15;
  sub_226F01428();
  v16 = v11;
  v17 = sub_226F014D0();
  v19 = v18;
  v21 = v20 & 1;
  sub_226F00C44(v31, (uint64_t)v25 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0));
  v22 = (*(unsigned __int8 *)(v30 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v30 + 80);
  v23 = swift_allocObject();
  sub_226EF5310((uint64_t)v25 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0), v23 + v22);
  sub_226F01554();
  sub_226F00F64(v17, v19, v21);
  swift_release();
  swift_bridgeObjectRelease();
  sub_226F01548();
  return sub_226F0153C();
}

uint64_t sub_226EFF734@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  char v14;
  uint64_t v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char v20;
  char v21;
  unint64_t v22;
  uint64_t v23;
  _QWORD v25[4];
  int v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  char *v32;
  uint64_t v33;

  v33 = a1;
  v1 = _s20FailureAlertModifierVMa();
  v30 = *(_QWORD *)(v1 - 8);
  v2 = *(_QWORD *)(v30 + 64);
  MEMORY[0x24BDAC7A8](v1);
  v3 = sub_226F01560();
  v4 = MEMORY[0x24BDAC7A8](v3);
  v32 = (char *)v25 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v4);
  sub_226F01428();
  if (qword_2558AC770 != -1)
    swift_once();
  v6 = (id)qword_2558AE148;
  v7 = sub_226F014D0();
  v28 = v8;
  v29 = v7;
  v26 = v9;
  v27 = v10;
  sub_226F01428();
  v11 = v6;
  v12 = sub_226F014D0();
  v25[2] = v13;
  v25[3] = v12;
  v25[0] = v14 & 1;
  v25[1] = v15;
  sub_226F01428();
  v16 = v11;
  v17 = sub_226F014D0();
  v19 = v18;
  v21 = v20 & 1;
  sub_226F00C44(v31, (uint64_t)v25 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0));
  v22 = (*(unsigned __int8 *)(v30 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v30 + 80);
  v23 = swift_allocObject();
  sub_226EF5310((uint64_t)v25 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0), v23 + v22);
  sub_226F01554();
  sub_226F00F64(v17, v19, v21);
  swift_release();
  swift_bridgeObjectRelease();
  sub_226F01548();
  return sub_226F0153C();
}

uint64_t sub_226EFFA74@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  char v14;
  uint64_t v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char v20;
  char v21;
  unint64_t v22;
  uint64_t v23;
  _QWORD v25[4];
  int v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  char *v32;
  uint64_t v33;

  v33 = a1;
  v1 = _s20FailureAlertModifierVMa();
  v30 = *(_QWORD *)(v1 - 8);
  v2 = *(_QWORD *)(v30 + 64);
  MEMORY[0x24BDAC7A8](v1);
  v3 = sub_226F01560();
  v4 = MEMORY[0x24BDAC7A8](v3);
  v32 = (char *)v25 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v4);
  sub_226F01428();
  if (qword_2558AC770 != -1)
    swift_once();
  v6 = (id)qword_2558AE148;
  v7 = sub_226F014D0();
  v28 = v8;
  v29 = v7;
  v26 = v9;
  v27 = v10;
  sub_226F01428();
  v11 = v6;
  v12 = sub_226F014D0();
  v25[2] = v13;
  v25[3] = v12;
  v25[0] = v14 & 1;
  v25[1] = v15;
  sub_226F01428();
  v16 = v11;
  v17 = sub_226F014D0();
  v19 = v18;
  v21 = v20 & 1;
  sub_226F00C44(v31, (uint64_t)v25 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0));
  v22 = (*(unsigned __int8 *)(v30 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v30 + 80);
  v23 = swift_allocObject();
  sub_226EF5310((uint64_t)v25 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0), v23 + v22);
  sub_226F01554();
  sub_226F00F64(v17, v19, v21);
  swift_release();
  swift_bridgeObjectRelease();
  sub_226F01548();
  return sub_226F0153C();
}

void sub_226EFFDB4()
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

  v0 = sub_226F01368();
  v1 = *(_QWORD *)(v0 - 8);
  MEMORY[0x24BDAC7A8](v0);
  OUTLINED_FUNCTION_0_1();
  v4 = v3 - v2;
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2558ACD08);
  MEMORY[0x24BDAC7A8](v5);
  OUTLINED_FUNCTION_0_1();
  v8 = v7 - v6;
  v9 = sub_226F01254();
  v10 = *(_QWORD *)(v9 - 8);
  MEMORY[0x24BDAC7A8](v9);
  OUTLINED_FUNCTION_0_1();
  v13 = v12 - v11;
  sub_226F01248();
  if (OUTLINED_FUNCTION_7_3(v8) == 1)
  {
    sub_226F00F74(v8, &qword_2558ACD08);
  }
  else
  {
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v10 + 32))(v13, v8, v9);
    OUTLINED_FUNCTION_2_5();
    sub_226EF8FE8(v4);
    sub_226F0135C();
    (*(void (**)(uint64_t, uint64_t))(v1 + 8))(v4, v0);
    (*(void (**)(uint64_t, uint64_t))(v10 + 8))(v13, v9);
  }
  OUTLINED_FUNCTION_4_1();
}

BOOL sub_226EFFF00(int a1, int a2)
{
  return ((a2 ^ a1) & 1) == 0;
}

uint64_t sub_226EFFF10()
{
  return sub_226F01938();
}

uint64_t sub_226EFFF34()
{
  sub_226F0192C();
  sub_226F01938();
  return sub_226F0195C();
}

void sub_226EFFF7C(_QWORD *a1@<X8>)
{
  *a1 = &unk_24EF41750;
}

BOOL sub_226EFFF8C(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return sub_226EFFF00(*a1, *a2);
}

uint64_t sub_226EFFF98()
{
  return sub_226EFFF34();
}

uint64_t sub_226EFFFA0()
{
  return sub_226EFFF10();
}

uint64_t sub_226EFFFA8()
{
  return sub_226F00C98(&qword_2558ACC18, &qword_2558ACC20, MEMORY[0x24BEE12E0]);
}

uint64_t sub_226EFFFD4(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  int v3;
  uint64_t v4;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD *v15;
  _QWORD *v16;
  uint64_t v17;

  v3 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  v4 = *a2;
  *(_QWORD *)a1 = *a2;
  if ((v3 & 0x20000) != 0)
  {
    v7 = v4 + ((v3 + 16) & ~(unint64_t)v3);
    swift_retain();
  }
  else
  {
    v7 = a1;
    *(_QWORD *)(a1 + 8) = a2[1];
    *(_BYTE *)(a1 + 16) = *((_BYTE *)a2 + 16);
    *(_BYTE *)(a1 + 24) = *((_BYTE *)a2 + 24);
    *(_QWORD *)(a1 + 32) = a2[4];
    v8 = *(int *)(a3 + 24);
    v9 = (char *)(a1 + v8);
    v10 = (char *)a2 + v8;
    v11 = sub_226F0156C();
    swift_retain();
    swift_retain();
    swift_retain();
    if (__swift_getEnumTagSinglePayload((uint64_t)v10, 1, v11))
    {
      v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_2558AC978);
      memcpy(v9, v10, *(_QWORD *)(*(_QWORD *)(v12 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v11 - 8) + 16))(v9, v10, v11);
      __swift_storeEnumTagSinglePayload((uint64_t)v9, 0, 1, v11);
    }
    v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_2558ACC28);
    *(_QWORD *)&v9[*(int *)(v13 + 28)] = *(_QWORD *)&v10[*(int *)(v13 + 28)];
    v14 = *(int *)(a3 + 28);
    v15 = (_QWORD *)(v7 + v14);
    v16 = (uint64_t *)((char *)a2 + v14);
    swift_retain();
    __swift_instantiateConcreteTypeFromMangledName(&qword_2558AC980);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v17 = sub_226F01368();
      (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v17 - 8) + 16))(v15, v16, v17);
    }
    else
    {
      *v15 = *v16;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
  }
  return v7;
}

uint64_t sub_226F00198(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  swift_release();
  swift_release();
  swift_release();
  v4 = a1 + *(int *)(a2 + 24);
  v5 = sub_226F0156C();
  if (!__swift_getEnumTagSinglePayload(v4, 1, v5))
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(v4, v5);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2558ACC28);
  swift_release();
  v6 = a1 + *(int *)(a2 + 28);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2558AC980);
  if (swift_getEnumCaseMultiPayload() != 1)
    return swift_release();
  v7 = sub_226F01368();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 8))(v6, v7);
}

uint64_t sub_226F00280(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  char *v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD *v14;
  _QWORD *v15;
  uint64_t v16;

  v6 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v6;
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
  *(_BYTE *)(a1 + 24) = *(_BYTE *)(a2 + 24);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  v7 = *(int *)(a3 + 24);
  v8 = (char *)(a1 + v7);
  v9 = (char *)(a2 + v7);
  v10 = sub_226F0156C();
  swift_retain();
  swift_retain();
  swift_retain();
  if (__swift_getEnumTagSinglePayload((uint64_t)v9, 1, v10))
  {
    v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_2558AC978);
    memcpy(v8, v9, *(_QWORD *)(*(_QWORD *)(v11 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v10 - 8) + 16))(v8, v9, v10);
    __swift_storeEnumTagSinglePayload((uint64_t)v8, 0, 1, v10);
  }
  v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_2558ACC28);
  *(_QWORD *)&v8[*(int *)(v12 + 28)] = *(_QWORD *)&v9[*(int *)(v12 + 28)];
  v13 = *(int *)(a3 + 28);
  v14 = (_QWORD *)(a1 + v13);
  v15 = (_QWORD *)(a2 + v13);
  swift_retain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2558AC980);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v16 = sub_226F01368();
    (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v16 - 8) + 16))(v14, v15, v16);
  }
  else
  {
    *v14 = *v15;
    swift_retain();
  }
  swift_storeEnumTagMultiPayload();
  return a1;
}

uint64_t sub_226F0040C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  char *v7;
  char *v8;
  uint64_t v9;
  int EnumTagSinglePayload;
  int v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD *v16;
  _QWORD *v17;
  uint64_t v18;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  swift_retain();
  swift_release();
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  swift_retain();
  swift_release();
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
  *(_BYTE *)(a1 + 24) = *(_BYTE *)(a2 + 24);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  swift_retain();
  swift_release();
  v6 = *(int *)(a3 + 24);
  v7 = (char *)(a1 + v6);
  v8 = (char *)(a2 + v6);
  v9 = sub_226F0156C();
  EnumTagSinglePayload = __swift_getEnumTagSinglePayload((uint64_t)v7, 1, v9);
  v11 = __swift_getEnumTagSinglePayload((uint64_t)v8, 1, v9);
  if (EnumTagSinglePayload)
  {
    if (!v11)
    {
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v9 - 8) + 16))(v7, v8, v9);
      __swift_storeEnumTagSinglePayload((uint64_t)v7, 0, 1, v9);
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  v12 = *(_QWORD *)(v9 - 8);
  if (v11)
  {
    (*(void (**)(char *, uint64_t))(v12 + 8))(v7, v9);
LABEL_6:
    v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_2558AC978);
    memcpy(v7, v8, *(_QWORD *)(*(_QWORD *)(v13 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(char *, char *, uint64_t))(v12 + 24))(v7, v8, v9);
LABEL_7:
  v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_2558ACC28);
  *(_QWORD *)&v7[*(int *)(v14 + 28)] = *(_QWORD *)&v8[*(int *)(v14 + 28)];
  swift_retain();
  swift_release();
  if (a1 != a2)
  {
    v15 = *(int *)(a3 + 28);
    v16 = (_QWORD *)(a1 + v15);
    v17 = (_QWORD *)(a2 + v15);
    sub_226F00F74(a1 + v15, &qword_2558AC980);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2558AC980);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v18 = sub_226F01368();
      (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v18 - 8) + 16))(v16, v17, v18);
    }
    else
    {
      *v16 = *v17;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

uint64_t sub_226F0061C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  char *v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const void *v14;
  uint64_t v15;
  uint64_t v16;

  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  v6 = *(int *)(a3 + 24);
  v7 = (char *)(a1 + v6);
  v8 = (char *)(a2 + v6);
  v9 = sub_226F0156C();
  if (__swift_getEnumTagSinglePayload((uint64_t)v8, 1, v9))
  {
    v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_2558AC978);
    memcpy(v7, v8, *(_QWORD *)(*(_QWORD *)(v10 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v9 - 8) + 32))(v7, v8, v9);
    __swift_storeEnumTagSinglePayload((uint64_t)v7, 0, 1, v9);
  }
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_2558ACC28);
  *(_QWORD *)&v7[*(int *)(v11 + 28)] = *(_QWORD *)&v8[*(int *)(v11 + 28)];
  v12 = *(int *)(a3 + 28);
  v13 = (void *)(a1 + v12);
  v14 = (const void *)(a2 + v12);
  v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_2558AC980);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v16 = sub_226F01368();
    (*(void (**)(void *, const void *, uint64_t))(*(_QWORD *)(v16 - 8) + 32))(v13, v14, v16);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(v13, v14, *(_QWORD *)(*(_QWORD *)(v15 - 8) + 64));
  }
  return a1;
}

uint64_t sub_226F00778(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  char *v7;
  char *v8;
  uint64_t v9;
  int EnumTagSinglePayload;
  int v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  const void *v17;
  uint64_t v18;
  uint64_t v19;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  swift_release();
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  swift_release();
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
  *(_BYTE *)(a1 + 24) = *(_BYTE *)(a2 + 24);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  swift_release();
  v6 = *(int *)(a3 + 24);
  v7 = (char *)(a1 + v6);
  v8 = (char *)(a2 + v6);
  v9 = sub_226F0156C();
  EnumTagSinglePayload = __swift_getEnumTagSinglePayload((uint64_t)v7, 1, v9);
  v11 = __swift_getEnumTagSinglePayload((uint64_t)v8, 1, v9);
  if (EnumTagSinglePayload)
  {
    if (!v11)
    {
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v9 - 8) + 32))(v7, v8, v9);
      __swift_storeEnumTagSinglePayload((uint64_t)v7, 0, 1, v9);
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  v12 = *(_QWORD *)(v9 - 8);
  if (v11)
  {
    (*(void (**)(char *, uint64_t))(v12 + 8))(v7, v9);
LABEL_6:
    v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_2558AC978);
    memcpy(v7, v8, *(_QWORD *)(*(_QWORD *)(v13 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(char *, char *, uint64_t))(v12 + 40))(v7, v8, v9);
LABEL_7:
  v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_2558ACC28);
  *(_QWORD *)&v7[*(int *)(v14 + 28)] = *(_QWORD *)&v8[*(int *)(v14 + 28)];
  swift_release();
  if (a1 != a2)
  {
    v15 = *(int *)(a3 + 28);
    v16 = (void *)(a1 + v15);
    v17 = (const void *)(a2 + v15);
    sub_226F00F74(a1 + v15, &qword_2558AC980);
    v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_2558AC980);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v19 = sub_226F01368();
      (*(void (**)(void *, const void *, uint64_t))(*(_QWORD *)(v19 - 8) + 32))(v16, v17, v19);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(v16, v17, *(_QWORD *)(*(_QWORD *)(v18 - 8) + 64));
    }
  }
  return a1;
}

uint64_t sub_226F0096C()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_226F00978(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v4;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  if ((_DWORD)a2 == 0x7FFFFFFF)
  {
    v4 = *(_QWORD *)(a1 + 8);
    if (v4 >= 0xFFFFFFFF)
      LODWORD(v4) = -1;
    return (v4 + 1);
  }
  else
  {
    v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_2558ACC28);
    if (*(_DWORD *)(*(_QWORD *)(v8 - 8) + 84) == (_DWORD)a2)
    {
      v9 = v8;
      v10 = *(int *)(a3 + 24);
    }
    else
    {
      v9 = __swift_instantiateConcreteTypeFromMangledName(qword_2558ACC30);
      v10 = *(int *)(a3 + 28);
    }
    return __swift_getEnumTagSinglePayload(a1 + v10, a2, v9);
  }
}

uint64_t sub_226F00A18()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

void sub_226F00A24(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  if (a3 == 0x7FFFFFFF)
  {
    *(_QWORD *)(a1 + 8) = (a2 - 1);
    OUTLINED_FUNCTION_2_0();
  }
  else
  {
    v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_2558ACC28);
    if (*(_DWORD *)(*(_QWORD *)(v8 - 8) + 84) == a3)
    {
      v9 = v8;
      v10 = *(int *)(a4 + 24);
    }
    else
    {
      v9 = __swift_instantiateConcreteTypeFromMangledName(qword_2558ACC30);
      v10 = *(int *)(a4 + 28);
    }
    __swift_storeEnumTagSinglePayload(a1 + v10, a2, a2, v9);
  }
}

uint64_t _s20FailureAlertModifierVMa()
{
  uint64_t result;

  result = qword_2558ACC90;
  if (!qword_2558ACC90)
    return swift_getSingletonMetadata();
  return result;
}

void sub_226F00AF0()
{
  unint64_t v0;
  unint64_t v1;

  sub_226F00B88();
  if (v0 <= 0x3F)
  {
    sub_226F00BE0();
    if (v1 <= 0x3F)
      swift_initStructMetadata();
  }
}

void sub_226F00B88()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_2558ACCA0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2558AC978);
    v0 = sub_226F015D8();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_2558ACCA0);
  }
}

void sub_226F00BE0()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_2558ACCA8[0])
  {
    sub_226F01368();
    v0 = sub_226F012FC();
    if (!v1)
      atomic_store(v0, qword_2558ACCA8);
  }
}

uint64_t sub_226F00C34()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_226F00C44(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = _s20FailureAlertModifierVMa();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_226F00C8C(uint64_t a1, uint64_t a2)
{
  return sub_226F00CE8(a1, a2, (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_226EFEF30);
}

uint64_t sub_226F00C98(unint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    result = MEMORY[0x2276A650C](a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_226F00CDC(uint64_t a1, uint64_t a2)
{
  return sub_226F00CE8(a1, a2, (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_226EFF084);
}

uint64_t sub_226F00CE8(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t, uint64_t, uint64_t))
{
  uint64_t v3;
  uint64_t v6;

  OUTLINED_FUNCTION_2_5();
  OUTLINED_FUNCTION_11_4();
  return a3(a1, a2, v3 + v6);
}

uint64_t sub_226F00D34@<X0>(uint64_t a1@<X8>)
{
  return sub_226EFF174(a1);
}

uint64_t sub_226F00D3C(uint64_t a1)
{
  uint64_t v2;

  v2 = _s20FailureAlertModifierVMa();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

void sub_226F00D78()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v0 = MRMediaRemoteCopyLocalDeviceSystemClassicalRoomApplicationDisplayID();
  if (v0)
  {
    v1 = (void *)v0;
    v2 = sub_226F01758();
    v4 = v3;

    qword_2558ACBF8 = v2;
    qword_2558ACC00 = v4;
  }
  else
  {
    __break(1u);
  }
}

void sub_226F00DC4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  if (qword_2558AC778 != -1)
    swift_once();
  v0 = qword_2558ACBF8;
  if (qword_2558ACC00)
  {
    swift_bridgeObjectRetain();
    v0 = sub_226F00E60();
    v2 = v1;
    swift_bridgeObjectRelease();
  }
  else
  {
    v2 = 0;
  }
  qword_2558ACC08 = v0;
  qword_2558ACC10 = v2;
}

uint64_t sub_226F00E60()
{
  uint64_t v1;

  swift_bridgeObjectRetain();
  v1 = sub_226F017A0();
  sub_226F0177C();
  return v1;
}

uint64_t sub_226F00EDC(void *a1)
{
  id v2;
  uint64_t v3;

  v2 = objc_msgSend(a1, sel_bundleIdentifier);

  if (!v2)
    return 0;
  v3 = sub_226F01758();

  return v3;
}

void sub_226F00F4C()
{
  OUTLINED_FUNCTION_0_10();
}

uint64_t sub_226F00F64(uint64_t a1, uint64_t a2, char a3)
{
  if ((a3 & 1) != 0)
    return swift_release();
  else
    return swift_bridgeObjectRelease();
}

uint64_t sub_226F00F74(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  OUTLINED_FUNCTION_17_0(v3);
  return a1;
}

uint64_t objectdestroyTm_0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v1 = OUTLINED_FUNCTION_2_5();
  v2 = *(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80);
  swift_release();
  swift_release();
  swift_release();
  v3 = v0 + ((v2 + 16) & ~v2) + *(int *)(v1 + 24);
  v4 = sub_226F0156C();
  if (!OUTLINED_FUNCTION_7_3(v3))
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2558ACC28);
  swift_release();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2558AC980);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v5 = sub_226F01368();
    OUTLINED_FUNCTION_17_0(v5);
  }
  else
  {
    swift_release();
  }
  return swift_deallocObject();
}

void sub_226F010A8()
{
  OUTLINED_FUNCTION_0_10();
}

void sub_226F010C0()
{
  OUTLINED_FUNCTION_2_5();
  OUTLINED_FUNCTION_11_4();
  sub_226EFFDB4();
  OUTLINED_FUNCTION_2_0();
}

uint64_t sub_226F010F8()
{
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2558ACCE8);
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2558ACCE0);
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2558ACCF8);
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2558AC8E0);
  sub_226F00C98(&qword_2558ACD00, &qword_2558ACCF8, MEMORY[0x24BDEFB78]);
  sub_226EF4F60();
  OUTLINED_FUNCTION_4_5();
  OUTLINED_FUNCTION_4_5();
  return OUTLINED_FUNCTION_4_5();
}

void OUTLINED_FUNCTION_0_10()
{
  sub_226F010C0();
}

uint64_t OUTLINED_FUNCTION_2_5()
{
  return _s20FailureAlertModifierVMa();
}

uint64_t OUTLINED_FUNCTION_4_5()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t OUTLINED_FUNCTION_6_3()
{
  uint64_t v0;
  uint64_t v1;

  return sub_226F00C44(v0, v1);
}

uint64_t OUTLINED_FUNCTION_7_3(uint64_t a1)
{
  uint64_t v1;

  return __swift_getEnumTagSinglePayload(a1, 1, v1);
}

uint64_t OUTLINED_FUNCTION_10_1(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  return sub_226EF5310(v2, a1 + v1);
}

uint64_t sub_226F01230()
{
  return MEMORY[0x24BDCD2F0]();
}

uint64_t sub_226F0123C()
{
  return MEMORY[0x24BDCD2F8]();
}

uint64_t sub_226F01248()
{
  return MEMORY[0x24BDCDA68]();
}

uint64_t sub_226F01254()
{
  return MEMORY[0x24BDCDAC0]();
}

uint64_t sub_226F01260()
{
  return MEMORY[0x24BDCDE90]();
}

uint64_t sub_226F0126C()
{
  return MEMORY[0x24BDCE880]();
}

uint64_t sub_226F01278()
{
  return MEMORY[0x24BDCE900]();
}

uint64_t sub_226F01284()
{
  return MEMORY[0x24BEE5C38]();
}

uint64_t sub_226F01290()
{
  return MEMORY[0x24BEE5C40]();
}

uint64_t sub_226F0129C()
{
  return MEMORY[0x24BEE5C48]();
}

uint64_t sub_226F012A8()
{
  return MEMORY[0x24BEE5C50]();
}

uint64_t sub_226F012B4()
{
  return MEMORY[0x24BEE5C58]();
}

uint64_t sub_226F012C0()
{
  return MEMORY[0x24BEE5C60]();
}

uint64_t sub_226F012CC()
{
  return MEMORY[0x24BEE78A8]();
}

uint64_t sub_226F012D8()
{
  return MEMORY[0x24BEE78C0]();
}

uint64_t sub_226F012E4()
{
  return MEMORY[0x24BEE78D8]();
}

uint64_t sub_226F012F0()
{
  return MEMORY[0x24BDEB450]();
}

uint64_t sub_226F012FC()
{
  return MEMORY[0x24BDEB560]();
}

uint64_t sub_226F01308()
{
  return MEMORY[0x24BDEB598]();
}

uint64_t sub_226F01314()
{
  return MEMORY[0x24BDEBDE0]();
}

uint64_t sub_226F01320()
{
  return MEMORY[0x24BDEBDF0]();
}

uint64_t sub_226F0132C()
{
  return MEMORY[0x24BDEBE00]();
}

uint64_t sub_226F01338()
{
  return MEMORY[0x24BDEBED0]();
}

uint64_t sub_226F01344()
{
  return MEMORY[0x24BDEC120]();
}

uint64_t sub_226F01350()
{
  return MEMORY[0x24BDEC148]();
}

uint64_t sub_226F0135C()
{
  return MEMORY[0x24BDEC298]();
}

uint64_t sub_226F01368()
{
  return MEMORY[0x24BDEC2E0]();
}

uint64_t sub_226F01374()
{
  return MEMORY[0x24BDEC348]();
}

uint64_t sub_226F01380()
{
  return MEMORY[0x24BDEC358]();
}

uint64_t sub_226F0138C()
{
  return MEMORY[0x24BDEC638]();
}

uint64_t sub_226F01398()
{
  return MEMORY[0x24BDECE58]();
}

uint64_t sub_226F013A4()
{
  return MEMORY[0x24BDECE68]();
}

uint64_t sub_226F013B0()
{
  return MEMORY[0x24BDECE78]();
}

uint64_t sub_226F013BC()
{
  return MEMORY[0x24BDED2D0]();
}

uint64_t sub_226F013C8()
{
  return MEMORY[0x24BDED3B0]();
}

uint64_t sub_226F013D4()
{
  return MEMORY[0x24BDEDF38]();
}

uint64_t sub_226F013E0()
{
  return MEMORY[0x24BDEE400]();
}

uint64_t sub_226F013EC()
{
  return MEMORY[0x24BDEE410]();
}

uint64_t sub_226F013F8()
{
  return MEMORY[0x24BDEE4E0]();
}

uint64_t sub_226F01404()
{
  return MEMORY[0x24BDEE4F8]();
}

uint64_t sub_226F01410()
{
  return MEMORY[0x24BDEE530]();
}

uint64_t sub_226F0141C()
{
  return MEMORY[0x24BDEE538]();
}

uint64_t sub_226F01428()
{
  return MEMORY[0x24BDEEA50]();
}

uint64_t sub_226F01434()
{
  return MEMORY[0x24BDEF3A0]();
}

uint64_t sub_226F01440()
{
  return MEMORY[0x24BDF0EC0]();
}

uint64_t sub_226F0144C()
{
  return MEMORY[0x24BDF0ED0]();
}

uint64_t sub_226F01458()
{
  return MEMORY[0x24BDF0EE0]();
}

uint64_t sub_226F01464()
{
  return MEMORY[0x24BDF0EF0]();
}

uint64_t sub_226F01470()
{
  return MEMORY[0x24BDF0F00]();
}

uint64_t sub_226F0147C()
{
  return MEMORY[0x24BDF0F10]();
}

uint64_t sub_226F01488()
{
  return MEMORY[0x24BDF0F18]();
}

uint64_t sub_226F01494()
{
  return MEMORY[0x24BDF0F28]();
}

uint64_t sub_226F014A0()
{
  return MEMORY[0x24BDF13A0]();
}

uint64_t sub_226F014AC()
{
  return MEMORY[0x24BDF1430]();
}

uint64_t sub_226F014B8()
{
  return MEMORY[0x24BDF14A8]();
}

uint64_t sub_226F014C4()
{
  return MEMORY[0x24BDF14C8]();
}

uint64_t sub_226F014D0()
{
  return MEMORY[0x24BDF1FC0]();
}

uint64_t sub_226F014DC()
{
  return MEMORY[0x24BDF2088]();
}

uint64_t sub_226F014E8()
{
  return MEMORY[0x24BDF20A0]();
}

uint64_t sub_226F014F4()
{
  return MEMORY[0x24BDF2698]();
}

uint64_t sub_226F01500()
{
  return MEMORY[0x24BDF2CD8]();
}

uint64_t sub_226F0150C()
{
  return MEMORY[0x24BDF3510]();
}

uint64_t sub_226F01518()
{
  return MEMORY[0x24BDF3640]();
}

uint64_t sub_226F01524()
{
  return MEMORY[0x24BDF38C0]();
}

uint64_t sub_226F01530()
{
  return MEMORY[0x24BDF38E0]();
}

uint64_t sub_226F0153C()
{
  return MEMORY[0x24BDF3B30]();
}

uint64_t sub_226F01548()
{
  return MEMORY[0x24BDF3B50]();
}

uint64_t sub_226F01554()
{
  return MEMORY[0x24BDF3B60]();
}

uint64_t sub_226F01560()
{
  return MEMORY[0x24BDF3B70]();
}

uint64_t sub_226F0156C()
{
  return MEMORY[0x24BDF3B80]();
}

uint64_t sub_226F01578()
{
  return MEMORY[0x24BDF3BD8]();
}

uint64_t sub_226F01584()
{
  return MEMORY[0x24BDF3F58]();
}

uint64_t sub_226F01590()
{
  return MEMORY[0x24BDF3FE8]();
}

uint64_t sub_226F0159C()
{
  return MEMORY[0x24BDF40D8]();
}

uint64_t sub_226F015A8()
{
  return MEMORY[0x24BDF4280]();
}

uint64_t sub_226F015B4()
{
  return MEMORY[0x24BDF4290]();
}

uint64_t sub_226F015C0()
{
  return MEMORY[0x24BDF42A8]();
}

uint64_t sub_226F015CC()
{
  return MEMORY[0x24BDF42B0]();
}

uint64_t sub_226F015D8()
{
  return MEMORY[0x24BDF42C0]();
}

uint64_t sub_226F015E4()
{
  return MEMORY[0x24BDF47B0]();
}

uint64_t sub_226F015F0()
{
  return MEMORY[0x24BDF47B8]();
}

uint64_t sub_226F015FC()
{
  return MEMORY[0x24BDF4870]();
}

uint64_t sub_226F01608()
{
  return MEMORY[0x24BDF4F18]();
}

uint64_t sub_226F01614()
{
  return MEMORY[0x24BDF51A0]();
}

uint64_t sub_226F01620()
{
  return MEMORY[0x24BDF51A8]();
}

uint64_t sub_226F0162C()
{
  return MEMORY[0x24BDF51C0]();
}

uint64_t sub_226F01638()
{
  return MEMORY[0x24BDF51D0]();
}

uint64_t sub_226F01644()
{
  return MEMORY[0x24BEE5458]();
}

uint64_t sub_226F01650()
{
  return MEMORY[0x24BEE54C8]();
}

uint64_t sub_226F0165C()
{
  return MEMORY[0x24BEE5500]();
}

uint64_t sub_226F01668()
{
  return MEMORY[0x24BDDEE70]();
}

uint64_t sub_226F01674()
{
  return MEMORY[0x24BDDF130]();
}

uint64_t sub_226F01680()
{
  return MEMORY[0x24BDDF138]();
}

uint64_t sub_226F0168C()
{
  return MEMORY[0x24BDDF1F8]();
}

uint64_t sub_226F01698()
{
  return MEMORY[0x24BDDF818]();
}

uint64_t sub_226F016A4()
{
  return MEMORY[0x24BDDF820]();
}

uint64_t sub_226F016B0()
{
  return MEMORY[0x24BDDF838]();
}

uint64_t sub_226F016BC()
{
  return MEMORY[0x24BDDF858]();
}

uint64_t sub_226F016C8()
{
  return MEMORY[0x24BDDF860]();
}

uint64_t sub_226F016D4()
{
  return MEMORY[0x24BDDF868]();
}

uint64_t sub_226F016E0()
{
  return MEMORY[0x24BDDF888]();
}

uint64_t sub_226F016EC()
{
  return MEMORY[0x24BDDF890]();
}

uint64_t sub_226F016F8()
{
  return MEMORY[0x24BDDF898]();
}

uint64_t sub_226F01704()
{
  return MEMORY[0x24BDCF808]();
}

uint64_t sub_226F01710()
{
  return MEMORY[0x24BEE02B0]();
}

uint64_t sub_226F0171C()
{
  return MEMORY[0x24BEE0618]();
}

uint64_t sub_226F01728()
{
  return MEMORY[0x24BEE0980]();
}

uint64_t sub_226F01734()
{
  return MEMORY[0x24BDCF9E0]();
}

uint64_t sub_226F01740()
{
  return MEMORY[0x24BDCFA08]();
}

uint64_t sub_226F0174C()
{
  return MEMORY[0x24BDCFA18]();
}

uint64_t sub_226F01758()
{
  return MEMORY[0x24BDCFA28]();
}

uint64_t sub_226F01764()
{
  return MEMORY[0x24BEE09F0]();
}

uint64_t sub_226F01770()
{
  return MEMORY[0x24BEE0B20]();
}

uint64_t sub_226F0177C()
{
  return MEMORY[0x24BEE0BB0]();
}

uint64_t sub_226F01788()
{
  return MEMORY[0x24BEE0BC0]();
}

uint64_t sub_226F01794()
{
  return MEMORY[0x24BEE0C10]();
}

uint64_t sub_226F017A0()
{
  return MEMORY[0x24BEE0DD0]();
}

uint64_t sub_226F017AC()
{
  return MEMORY[0x24BEE6800]();
}

uint64_t sub_226F017B8()
{
  return MEMORY[0x24BEE6920]();
}

uint64_t sub_226F017C4()
{
  return MEMORY[0x24BEE6928]();
}

uint64_t sub_226F017D0()
{
  return MEMORY[0x24BEE6988]();
}

uint64_t sub_226F017DC()
{
  return MEMORY[0x24BEE6990]();
}

uint64_t sub_226F017E8()
{
  return MEMORY[0x24BEE7910]();
}

uint64_t sub_226F017F4()
{
  return MEMORY[0x24BEE7920]();
}

uint64_t sub_226F01800()
{
  return MEMORY[0x24BEE5770]();
}

uint64_t sub_226F0180C()
{
  return MEMORY[0x24BEE5790]();
}

uint64_t sub_226F01818()
{
  return MEMORY[0x24BEE5BC0]();
}

uint64_t sub_226F01824()
{
  return MEMORY[0x24BEE1C68]();
}

uint64_t sub_226F01830()
{
  return MEMORY[0x24BEE1F00]();
}

uint64_t sub_226F0183C()
{
  return MEMORY[0x24BEE1F48]();
}

uint64_t sub_226F01848()
{
  return MEMORY[0x24BEE20A8]();
}

uint64_t sub_226F01854()
{
  return MEMORY[0x24BEE22C0]();
}

uint64_t sub_226F01860()
{
  return MEMORY[0x24BEE2510]();
}

uint64_t sub_226F0186C()
{
  return MEMORY[0x24BEE2518]();
}

uint64_t sub_226F01878()
{
  return MEMORY[0x24BEE2838]();
}

uint64_t sub_226F01884()
{
  return MEMORY[0x24BEE2BE0]();
}

uint64_t sub_226F01890()
{
  return MEMORY[0x24BEE2E58]();
}

uint64_t sub_226F0189C()
{
  return MEMORY[0x24BEE2E70]();
}

uint64_t sub_226F018A8()
{
  return MEMORY[0x24BEE2F40]();
}

uint64_t sub_226F018B4()
{
  return MEMORY[0x24BEE2F48]();
}

uint64_t sub_226F018C0()
{
  return MEMORY[0x24BEE30B0]();
}

uint64_t sub_226F018CC()
{
  return MEMORY[0x24BEE31D0]();
}

uint64_t sub_226F018D8()
{
  return MEMORY[0x24BEE3A20]();
}

uint64_t sub_226F018E4()
{
  return MEMORY[0x24BEE3A30]();
}

uint64_t sub_226F018F0()
{
  return MEMORY[0x24BEE3ED8]();
}

uint64_t sub_226F018FC()
{
  return MEMORY[0x24BEE3EF8]();
}

uint64_t sub_226F01908()
{
  return MEMORY[0x24BEE3F00]();
}

uint64_t sub_226F01914()
{
  return MEMORY[0x24BEE3F08]();
}

uint64_t sub_226F01920()
{
  return MEMORY[0x24BEE3F10]();
}

uint64_t sub_226F0192C()
{
  return MEMORY[0x24BEE42E0]();
}

uint64_t sub_226F01938()
{
  return MEMORY[0x24BEE42F8]();
}

uint64_t sub_226F01944()
{
  return MEMORY[0x24BEE4300]();
}

uint64_t sub_226F01950()
{
  return MEMORY[0x24BEE4318]();
}

uint64_t sub_226F0195C()
{
  return MEMORY[0x24BEE4328]();
}

CGColorRef CGColorCreateGenericRGB(CGFloat red, CGFloat green, CGFloat blue, CGFloat alpha)
{
  return (CGColorRef)MEMORY[0x24BDBDAA8](red, green, blue, alpha);
}

uint64_t MRMediaRemoteCopyLocalDeviceSystemClassicalRoomApplicationDisplayID()
{
  return MEMORY[0x24BE650D8]();
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

uint64_t objc_alloc_init()
{
  return MEMORY[0x24BEDCF88]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDCFD0](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x24BEDCFE8]();
}

void objc_destroyWeak(id *location)
{
  MEMORY[0x24BEDD038](location);
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

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B8](a1);
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x24BEDD420](location, obj);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
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

uint64_t swift_continuation_await()
{
  return MEMORY[0x24BEE71B8]();
}

uint64_t swift_continuation_init()
{
  return MEMORY[0x24BEE71C0]();
}

uint64_t swift_continuation_resume()
{
  return MEMORY[0x24BEE71C8]();
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

uint64_t swift_initEnumMetadataMultiPayload()
{
  return MEMORY[0x24BEE4E30]();
}

uint64_t swift_initStructMetadata()
{
  return MEMORY[0x24BEE4E58]();
}

uint64_t swift_isEscapingClosureAtFileLocation()
{
  return MEMORY[0x24BEE4E68]();
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

