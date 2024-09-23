void destroy for DownloadsHostingView(uint64_t a1)
{

  if (*(_QWORD *)(a1 + 8))
    swift_release();
}

_QWORD *_s20_Translation_SwiftUI20DownloadsHostingViewVwCP_0(_QWORD *a1, uint64_t a2)
{
  void *v4;
  _OWORD *v5;
  uint64_t v6;
  _OWORD *v7;
  id v8;
  uint64_t v9;

  v4 = *(void **)a2;
  *a1 = *(_QWORD *)a2;
  v5 = a1 + 1;
  v7 = (_OWORD *)(a2 + 8);
  v6 = *(_QWORD *)(a2 + 8);
  v8 = v4;
  if (v6)
  {
    v9 = *(_QWORD *)(a2 + 16);
    a1[1] = v6;
    a1[2] = v9;
    swift_retain();
  }
  else
  {
    *v5 = *v7;
  }
  return a1;
}

uint64_t assignWithCopy for DownloadsHostingView(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v4 = *(void **)a2;
  v5 = *(void **)a1;
  *(_QWORD *)a1 = *(_QWORD *)a2;
  v6 = v4;

  v7 = *(_QWORD *)(a2 + 8);
  if (!*(_QWORD *)(a1 + 8))
  {
    if (v7)
    {
      v9 = *(_QWORD *)(a2 + 16);
      *(_QWORD *)(a1 + 8) = v7;
      *(_QWORD *)(a1 + 16) = v9;
      swift_retain();
      return a1;
    }
LABEL_7:
    *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
    return a1;
  }
  if (!v7)
  {
    swift_release();
    goto LABEL_7;
  }
  v8 = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 8) = v7;
  *(_QWORD *)(a1 + 16) = v8;
  swift_retain();
  swift_release();
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

uint64_t assignWithTake for DownloadsHostingView(uint64_t a1, _QWORD *a2)
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v4 = *(void **)a1;
  *(_QWORD *)a1 = *a2;

  v5 = a2[1];
  if (!*(_QWORD *)(a1 + 8))
  {
    if (v5)
    {
      v7 = a2[2];
      *(_QWORD *)(a1 + 8) = v5;
      *(_QWORD *)(a1 + 16) = v7;
      return a1;
    }
LABEL_7:
    *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 1);
    return a1;
  }
  if (!v5)
  {
    swift_release();
    goto LABEL_7;
  }
  v6 = a2[2];
  *(_QWORD *)(a1 + 8) = v5;
  *(_QWORD *)(a1 + 16) = v6;
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for DownloadsHostingView(uint64_t *a1, int a2)
{
  uint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *((_BYTE *)a1 + 24))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for DownloadsHostingView(uint64_t result, int a2, int a3)
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
      *(_QWORD *)result = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 24) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for DownloadsHostingView()
{
  return &type metadata for DownloadsHostingView;
}

uint64_t sub_23570CA7C()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_23570CA94()
{
  return sub_2357148C8();
}

uint64_t sub_23570CAAC()
{
  uint64_t v0;
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(v0 + 8);
  v2 = *(id *)v0;
  sub_23570CAFC(v1);
  return sub_235714718();
}

uint64_t sub_23570CAFC(uint64_t result)
{
  if (result)
    return swift_retain();
  return result;
}

unint64_t sub_23570CB10()
{
  unint64_t result;
  uint64_t v1;

  result = qword_256264868;
  if (!qword_256264868)
  {
    v1 = sub_235714724();
    result = MEMORY[0x23B7D497C](MEMORY[0x24BEBA7C8], v1);
    atomic_store(result, (unint64_t *)&qword_256264868);
  }
  return result;
}

uint64_t sub_23570CB58(uint64_t a1)
{
  return sub_23570CC10(a1, qword_2562650F8);
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

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(_BYTE *)(*(_QWORD *)(a1 - 8) + 82) & 2) != 0)
    return *(_QWORD *)a2;
  return a2;
}

uint64_t sub_23570CBCC(uint64_t a1)
{
  return sub_23570CC10(a1, qword_256265110);
}

uint64_t sub_23570CBEC(uint64_t a1)
{
  return sub_23570CC10(a1, qword_256265128);
}

uint64_t sub_23570CC10(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = sub_235714754();
  __swift_allocate_value_buffer(v3, a2);
  __swift_project_value_buffer(v3, (uint64_t)a2);
  return sub_235714748();
}

uint64_t initializeBufferWithCopyOfBuffer for SystemTranslationView(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *a2;
  *a1 = *a2;
  v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t destroy for SystemTranslationView(uint64_t a1)
{
  uint64_t result;

  result = swift_bridgeObjectRelease();
  if (*(_QWORD *)(a1 + 16))
    return swift_release();
  return result;
}

_QWORD *initializeWithCopy for SystemTranslationView(_QWORD *a1, _QWORD *a2)
{
  uint64_t v4;
  uint64_t v5;
  _OWORD *v6;
  uint64_t v7;

  v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  v6 = a2 + 2;
  v5 = a2[2];
  swift_bridgeObjectRetain();
  if (v5)
  {
    v7 = a2[3];
    a1[2] = v5;
    a1[3] = v7;
    swift_retain();
  }
  else
  {
    *((_OWORD *)a1 + 1) = *v6;
  }
  return a1;
}

_QWORD *assignWithCopy for SystemTranslationView(_QWORD *a1, _QWORD *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v4 = a2[2];
  if (!a1[2])
  {
    if (v4)
    {
      v6 = a2[3];
      a1[2] = v4;
      a1[3] = v6;
      swift_retain();
      return a1;
    }
LABEL_7:
    *((_OWORD *)a1 + 1) = *((_OWORD *)a2 + 1);
    return a1;
  }
  if (!v4)
  {
    swift_release();
    goto LABEL_7;
  }
  v5 = a2[3];
  a1[2] = v4;
  a1[3] = v5;
  swift_retain();
  swift_release();
  return a1;
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

_QWORD *assignWithTake for SystemTranslationView(_QWORD *a1, _QWORD *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  swift_bridgeObjectRelease();
  v5 = a2[2];
  if (!a1[2])
  {
    if (v5)
    {
      v7 = a2[3];
      a1[2] = v5;
      a1[3] = v7;
      return a1;
    }
LABEL_7:
    *((_OWORD *)a1 + 1) = *((_OWORD *)a2 + 1);
    return a1;
  }
  if (!v5)
  {
    swift_release();
    goto LABEL_7;
  }
  v6 = a2[3];
  a1[2] = v5;
  a1[3] = v6;
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for SystemTranslationView(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 32))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for SystemTranslationView(uint64_t result, int a2, int a3)
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
      *(_QWORD *)(result + 8) = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 32) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for SystemTranslationView()
{
  return &type metadata for SystemTranslationView;
}

unint64_t sub_23570CF24()
{
  unint64_t result;

  result = qword_256264870;
  if (!qword_256264870)
  {
    result = MEMORY[0x23B7D497C](&unk_235714F8C, &type metadata for SystemTranslationView);
    atomic_store(result, (unint64_t *)&qword_256264870);
  }
  return result;
}

id sub_23570CF68(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  id v7;
  id v8;
  void *v9;
  id v10;
  id v11;
  uint64_t v12;
  void *v13;
  _QWORD v15[6];

  v7 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBA7E8]), sel_initWithNibName_bundle_, 0, 0);
  v8 = objc_allocWithZone(MEMORY[0x24BDD1458]);
  swift_bridgeObjectRetain();
  v9 = (void *)sub_235714964();
  swift_bridgeObjectRelease();
  v10 = objc_msgSend(v8, sel_initWithString_, v9);

  objc_msgSend(v7, sel_setText_, v10);
  v11 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBA7E0]), sel_init);
  objc_msgSend(v11, sel_setOrigin_, 2);
  objc_msgSend(v7, sel_setSourceMeta_, v11);
  if (a4)
  {
    swift_retain();
    objc_msgSend(v7, sel_setIsSourceEditable_, 1);
    v12 = swift_allocObject();
    *(_QWORD *)(v12 + 16) = a4;
    *(_QWORD *)(v12 + 24) = a5;
    v15[4] = sub_23570D458;
    v15[5] = v12;
    v15[0] = MEMORY[0x24BDAC760];
    v15[1] = 1107296256;
    v15[2] = sub_23570D258;
    v15[3] = &block_descriptor;
    v13 = _Block_copy(v15);
    swift_retain();
    swift_release();
    objc_msgSend(v7, sel_setReplacementHandler_, v13);

    _Block_release(v13);
    sub_23570D478(a4);
  }
  else
  {

  }
  return v7;
}

uint64_t sub_23570D138(void *a1, void (*a2)(uint64_t, uint64_t))
{
  uint64_t v4;
  NSObject *v5;
  os_log_type_t v6;
  uint8_t *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  if (qword_256264860 != -1)
    swift_once();
  v4 = sub_235714754();
  __swift_project_value_buffer(v4, (uint64_t)qword_256265128);
  v5 = sub_23571473C();
  v6 = sub_2357149F4();
  if (os_log_type_enabled(v5, v6))
  {
    v7 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_23570B000, v5, v6, "Replacement action invoked through API", v7, 2u);
    MEMORY[0x23B7D49DC](v7, -1, -1);
  }

  v8 = objc_msgSend(a1, sel_string);
  v9 = sub_235714970();
  v11 = v10;

  a2(v9, v11);
  return swift_bridgeObjectRelease();
}

void sub_23570D258(uint64_t a1, void *a2)
{
  void (*v3)(void);
  id v4;

  v3 = *(void (**)(void))(a1 + 32);
  swift_retain();
  v4 = a2;
  v3();
  swift_release();

}

id sub_23570D2A8(uint64_t a1)
{
  uint64_t *v1;

  return sub_23570CF68(a1, *v1, v1[1], v1[2], v1[3]);
}

uint64_t sub_23570D2C4()
{
  return sub_23571482C();
}

unint64_t sub_23570D2FC(uint64_t a1)
{
  unint64_t result;

  result = sub_23570D320();
  *(_QWORD *)(a1 + 8) = result;
  return result;
}

unint64_t sub_23570D320()
{
  unint64_t result;

  result = qword_2562648A0;
  if (!qword_2562648A0)
  {
    result = MEMORY[0x23B7D497C](&unk_235714EF8, &type metadata for SystemTranslationView);
    atomic_store(result, (unint64_t *)&qword_2562648A0);
  }
  return result;
}

uint64_t sub_23570D364()
{
  return MEMORY[0x24BDF5560];
}

uint64_t sub_23570D370()
{
  sub_23570D320();
  return sub_235714868();
}

uint64_t sub_23570D3C0()
{
  sub_23570D320();
  return sub_235714838();
}

void sub_23570D410()
{
  sub_23570D320();
  sub_23571485C();
  __break(1u);
}

uint64_t sub_23570D434()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_23570D458(void *a1)
{
  uint64_t v1;

  return sub_23570D138(a1, *(void (**)(uint64_t, uint64_t))(v1 + 16));
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

uint64_t sub_23570D478(uint64_t result)
{
  if (result)
    return swift_release();
  return result;
}

uint64_t sub_23570D488@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  _OWORD v19[9];
  _OWORD v20[9];

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_256264980);
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)v19 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = *(_QWORD *)(a1 + 24);
  v8 = *(_QWORD *)(a1 + 32);
  v10 = (uint64_t *)(a1 + *(int *)(type metadata accessor for SystemTranslationViewModifier() + 32));
  v11 = *v10;
  v12 = v10[1];
  swift_bridgeObjectRetain();
  sub_23570CAFC(v11);
  v13 = sub_235714940();
  sub_23570D6F4(0.0, 1, 320.0, 0, 0.0, 1, 0.0, 1, (uint64_t)v20, 480.0, 0, 0.0, 1, v13, v14, v9, v8, v11, v12);
  swift_bridgeObjectRelease();
  sub_23570D478(v11);
  v19[6] = v20[6];
  v19[7] = v20[7];
  v19[8] = v20[8];
  v19[2] = v20[2];
  v19[3] = v20[3];
  v19[4] = v20[4];
  v19[5] = v20[5];
  v19[0] = v20[0];
  v19[1] = v20[1];
  __swift_instantiateConcreteTypeFromMangledName(&qword_256264988);
  sub_2357147F0();
  v15 = swift_allocObject();
  *(_OWORD *)(v15 + 16) = xmmword_235714FE0;
  sub_2357147E4();
  sub_2357147D8();
  sub_23570E6DC(v15);
  swift_setDeallocating();
  swift_arrayDestroy();
  swift_deallocClassInstance();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256264970);
  sub_23570E670();
  sub_2357148D4();
  swift_bridgeObjectRelease();
  sub_23570E944((uint64_t)v20);
  v16 = sub_235714790();
  LOBYTE(v8) = sub_235714898();
  (*(void (**)(uint64_t, char *, uint64_t))(v5 + 16))(a2, v7, v4);
  v17 = a2 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_256264958) + 36);
  *(_QWORD *)v17 = v16;
  *(_BYTE *)(v17 + 8) = v8;
  return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

uint64_t sub_23570D6F4@<X0>(double a1@<X0>, char a2@<W1>, double a3@<X2>, char a4@<W3>, double a5@<X4>, char a6@<W5>, double a7@<X6>, char a8@<W7>, uint64_t a9@<X8>, double a10, char a11, double a12, char a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19)
{
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v31;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;

  v20 = a18;
  v21 = a19;
  v22 = a16;
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
    sub_2357149E8();
    v31 = (void *)sub_235714880();
    sub_235714730();

    v22 = a16;
    v21 = a19;
    v20 = a18;
  }
  sub_23571479C();
  *(_QWORD *)a9 = v22;
  *(_QWORD *)(a9 + 8) = a17;
  *(_QWORD *)(a9 + 16) = v20;
  *(_QWORD *)(a9 + 24) = v21;
  *(_OWORD *)(a9 + 96) = v37;
  *(_OWORD *)(a9 + 112) = v38;
  *(_OWORD *)(a9 + 128) = v39;
  *(_OWORD *)(a9 + 32) = v33;
  *(_OWORD *)(a9 + 48) = v34;
  *(_OWORD *)(a9 + 64) = v35;
  *(_OWORD *)(a9 + 80) = v36;
  swift_bridgeObjectRetain();
  return sub_23570CAFC(v20);
}

uint64_t sub_23570D8D0()
{
  return sub_235714778();
}

uint64_t sub_23570D8E8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  char *v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  unint64_t v11;
  uint64_t v12;
  _QWORD v14[4];

  v14[2] = a3;
  v14[3] = a1;
  v5 = *(_QWORD *)(a2 - 8);
  v6 = *(_QWORD *)(v5 + 64);
  MEMORY[0x24BDAC7A8](a1);
  v7 = sub_235714808();
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7);
  v10 = (char *)v14 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14[1] = *(_QWORD *)v3;
  (*(void (**)(char *, char *, uint64_t))(v8 + 16))(v10, &v3[*(int *)(a2 + 24)], v7);
  sub_23570E394((uint64_t)v3, (uint64_t)v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0));
  v11 = (*(unsigned __int8 *)(v5 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  v12 = swift_allocObject();
  sub_23570E48C((uint64_t)v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0), v12 + v11);
  __swift_instantiateConcreteTypeFromMangledName(&qword_256264950);
  __swift_instantiateConcreteTypeFromMangledName(&qword_256264958);
  sub_23570E54C();
  sub_23570E5DC();
  sub_2357148F8();
  swift_release();
  return (*(uint64_t (**)(char *, uint64_t))(v8 + 8))(v10, v7);
}

uint64_t View.translationPresentation(isPresented:text:attachmentAnchor:arrowEdge:replacementAction:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, char a3@<W2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, int a7@<W6>, uint64_t a8@<X7>, uint64_t a9@<X8>, uint64_t a10, uint64_t a11, uint64_t a12)
{
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  char *v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v26;
  int v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;

  v27 = a7;
  v26 = a4;
  v29 = a9;
  v30 = a12;
  v28 = a11;
  v18 = type metadata accessor for SystemTranslationViewModifier();
  v19 = MEMORY[0x24BDAC7A8](v18);
  v21 = (char *)&v26 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  v22 = &v21[*(int *)(v19 + 24)];
  v23 = sub_235714808();
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v23 - 8) + 16))(v22, a6, v23);
  *(_QWORD *)v21 = a1;
  *((_QWORD *)v21 + 1) = a2;
  v21[16] = a3;
  *((_QWORD *)v21 + 3) = v26;
  *((_QWORD *)v21 + 4) = a5;
  v21[*(int *)(v18 + 28)] = v27;
  v24 = (uint64_t *)&v21[*(int *)(v18 + 32)];
  *v24 = a8;
  v24[1] = a10;
  swift_retain();
  swift_retain();
  swift_bridgeObjectRetain();
  sub_23570CAFC(a8);
  MEMORY[0x23B7D45BC](v21, v28, v18, v30);
  return sub_23570DBFC((uint64_t)v21);
}

uint64_t type metadata accessor for SystemTranslationViewModifier()
{
  uint64_t result;

  result = qword_256264908;
  if (!qword_256264908)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_23570DBFC(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata accessor for SystemTranslationViewModifier();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_23570DC38(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  _QWORD v4[2];

  v1 = *(_QWORD *)(a1 + 8);
  type metadata accessor for SystemTranslationViewModifier();
  v2 = sub_235714784();
  v4[0] = v1;
  v4[1] = sub_23570E984(&qword_2562648A8, (uint64_t (*)(uint64_t))type metadata accessor for SystemTranslationViewModifier, (uint64_t)&unk_235715070);
  return MEMORY[0x23B7D497C](MEMORY[0x24BDED308], v2, v4);
}

uint64_t sub_23570DCB8(uint64_t a1, uint64_t *a2, int *a3)
{
  int v3;
  uint64_t v4;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(uint64_t, uint64_t, uint64_t);
  uint64_t v14;
  _QWORD *v15;
  _QWORD *v16;
  uint64_t v17;

  v3 = *(_DWORD *)(*((_QWORD *)a3 - 1) + 80);
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
    v8 = a2[4];
    *(_QWORD *)(a1 + 24) = a2[3];
    *(_QWORD *)(a1 + 32) = v8;
    v9 = a3[6];
    v10 = a1 + v9;
    v11 = (uint64_t)a2 + v9;
    v12 = sub_235714808();
    v13 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 16);
    swift_retain();
    swift_retain();
    swift_bridgeObjectRetain();
    v13(v10, v11, v12);
    v14 = a3[8];
    *(_BYTE *)(v7 + a3[7]) = *((_BYTE *)a2 + a3[7]);
    v15 = (_QWORD *)(v7 + v14);
    v16 = (uint64_t *)((char *)a2 + v14);
    if (*v16)
    {
      v17 = v16[1];
      *v15 = *v16;
      v15[1] = v17;
      swift_retain();
    }
    else
    {
      *(_OWORD *)v15 = *(_OWORD *)v16;
    }
  }
  return v7;
}

uint64_t sub_23570DDC4(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t result;

  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  v4 = a1 + *(int *)(a2 + 24);
  v5 = sub_235714808();
  result = (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(v4, v5);
  if (*(_QWORD *)(a1 + *(int *)(a2 + 32)))
    return swift_release();
  return result;
}

uint64_t sub_23570DE4C(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t, uint64_t, uint64_t);
  uint64_t v13;
  _QWORD *v14;
  _QWORD *v15;
  uint64_t v16;

  v6 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v6;
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
  v7 = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 32) = v7;
  v8 = a3[6];
  v9 = a1 + v8;
  v10 = a2 + v8;
  v11 = sub_235714808();
  v12 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 16);
  swift_retain();
  swift_retain();
  swift_bridgeObjectRetain();
  v12(v9, v10, v11);
  v13 = a3[8];
  *(_BYTE *)(a1 + a3[7]) = *(_BYTE *)(a2 + a3[7]);
  v14 = (_QWORD *)(a1 + v13);
  v15 = (_QWORD *)(a2 + v13);
  if (*v15)
  {
    v16 = v15[1];
    *v14 = *v15;
    v14[1] = v16;
    swift_retain();
  }
  else
  {
    *(_OWORD *)v14 = *(_OWORD *)v15;
  }
  return a1;
}

uint64_t sub_23570DF28(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

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
  v6 = a3[6];
  v7 = a1 + v6;
  v8 = a2 + v6;
  v9 = sub_235714808();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 24))(v7, v8, v9);
  *(_BYTE *)(a1 + a3[7]) = *(_BYTE *)(a2 + a3[7]);
  v10 = a3[8];
  v11 = (_QWORD *)(a1 + v10);
  v12 = (uint64_t *)(a2 + v10);
  v13 = *(_QWORD *)(a1 + v10);
  v14 = *v12;
  if (!v13)
  {
    if (v14)
    {
      v16 = v12[1];
      *v11 = v14;
      v11[1] = v16;
      swift_retain();
      return a1;
    }
LABEL_7:
    *(_OWORD *)v11 = *(_OWORD *)v12;
    return a1;
  }
  if (!v14)
  {
    swift_release();
    goto LABEL_7;
  }
  v15 = v12[1];
  *v11 = v14;
  v11[1] = v15;
  swift_retain();
  swift_release();
  return a1;
}

uint64_t sub_23570E04C(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t v14;

  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  v6 = a3[6];
  v7 = a1 + v6;
  v8 = a2 + v6;
  v9 = sub_235714808();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 32))(v7, v8, v9);
  v10 = a3[8];
  *(_BYTE *)(a1 + a3[7]) = *(_BYTE *)(a2 + a3[7]);
  v11 = (_QWORD *)(a1 + v10);
  v12 = (uint64_t *)(a2 + v10);
  v13 = *v12;
  if (*v12)
  {
    v14 = v12[1];
    *v11 = v13;
    v11[1] = v14;
  }
  else
  {
    *(_OWORD *)v11 = *(_OWORD *)v12;
  }
  return a1;
}

uint64_t sub_23570E0F8(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  swift_release();
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  swift_release();
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
  v6 = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 32) = v6;
  swift_bridgeObjectRelease();
  v7 = a3[6];
  v8 = a1 + v7;
  v9 = a2 + v7;
  v10 = sub_235714808();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 40))(v8, v9, v10);
  v11 = a3[8];
  *(_BYTE *)(a1 + a3[7]) = *(_BYTE *)(a2 + a3[7]);
  v12 = (_QWORD *)(a1 + v11);
  v13 = (uint64_t *)(a2 + v11);
  v14 = *v13;
  if (!*(_QWORD *)(a1 + v11))
  {
    if (v14)
    {
      v16 = v13[1];
      *v12 = v14;
      v12[1] = v16;
      return a1;
    }
LABEL_7:
    *(_OWORD *)v12 = *(_OWORD *)v13;
    return a1;
  }
  if (!v14)
  {
    swift_release();
    goto LABEL_7;
  }
  v15 = v13[1];
  *v12 = v14;
  v12[1] = v15;
  swift_release();
  return a1;
}

uint64_t sub_23570E1EC()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_23570E1F8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v4;
  uint64_t v8;

  if ((_DWORD)a2 == 0x7FFFFFFF)
  {
    v4 = *(_QWORD *)(a1 + 8);
    if (v4 >= 0xFFFFFFFF)
      LODWORD(v4) = -1;
    return (v4 + 1);
  }
  else
  {
    v8 = sub_235714808();
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 48))(a1 + *(int *)(a3 + 24), a2, v8);
  }
}

uint64_t sub_23570E274()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_23570E280(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5;
  uint64_t v7;

  v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(_QWORD *)(result + 8) = (a2 - 1);
  }
  else
  {
    v7 = sub_235714808();
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 56))(v5 + *(int *)(a4 + 24), a2, a2, v7);
  }
  return result;
}

uint64_t sub_23570E2F4()
{
  uint64_t result;
  unint64_t v1;

  result = sub_235714808();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t sub_23570E384()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_23570E394(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for SystemTranslationViewModifier();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_23570E3D8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v1 = type metadata accessor for SystemTranslationViewModifier();
  v2 = *(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80);
  v3 = v0 + ((v2 + 16) & ~v2);
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  v4 = v3 + *(int *)(v1 + 24);
  v5 = sub_235714808();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(v4, v5);
  if (*(_QWORD *)(v3 + *(int *)(v1 + 32)))
    swift_release();
  return swift_deallocObject();
}

uint64_t sub_23570E48C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for SystemTranslationViewModifier();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_23570E4D0@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;

  v3 = *(unsigned __int8 *)(*(_QWORD *)(type metadata accessor for SystemTranslationViewModifier() - 8) + 80);
  return sub_23570D488(v1 + ((v3 + 16) & ~v3), a1);
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x23B7D4964]((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

unint64_t sub_23570E54C()
{
  unint64_t result;
  uint64_t v1;

  result = qword_256264960;
  if (!qword_256264960)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256264950);
    result = MEMORY[0x23B7D497C](MEMORY[0x24BDEFB78], v1);
    atomic_store(result, (unint64_t *)&qword_256264960);
  }
  return result;
}

uint64_t __swift_instantiateConcreteTypeFromMangledNameAbstract(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x23B7D4970](255, (char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

unint64_t sub_23570E5DC()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[4];

  result = qword_256264968;
  if (!qword_256264968)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256264958);
    v2[2] = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256264970);
    v2[3] = sub_23570E670();
    v2[0] = swift_getOpaqueTypeConformance2();
    v2[1] = MEMORY[0x24BDF1050];
    result = MEMORY[0x23B7D497C](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_256264968);
  }
  return result;
}

unint64_t sub_23570E670()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_256264978;
  if (!qword_256264978)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256264970);
    v2[0] = sub_23570CF24();
    v2[1] = MEMORY[0x24BDEDBB8];
    result = MEMORY[0x23B7D497C](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_256264978);
  }
  return result;
}

uint64_t sub_23570E6DC(uint64_t a1)
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

  v2 = sub_2357147F0();
  v3 = *(_QWORD *)(v2 - 8);
  v4 = ((uint64_t (*)(void))MEMORY[0x24BDAC7A8])();
  v6 = (char *)&v27 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v4);
  v8 = (char *)&v27 - v7;
  v9 = *(_QWORD *)(a1 + 16);
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_256264990);
    v10 = sub_235714A18();
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
      sub_23570E984(&qword_256264998, (uint64_t (*)(uint64_t))MEMORY[0x24BDEEB10], MEMORY[0x24BDEEB20]);
      v14 = sub_23571494C();
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
          sub_23570E984((unint64_t *)&unk_2562649A0, (uint64_t (*)(uint64_t))MEMORY[0x24BDEEB10], MEMORY[0x24BDEEB28]);
          v20 = sub_235714958();
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

uint64_t sub_23570E944(uint64_t a1)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a1 + 16);
  swift_bridgeObjectRelease();
  sub_23570D478(v2);
  return a1;
}

uint64_t sub_23570E984(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = a2(255);
    result = MEMORY[0x23B7D497C](a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_23570E9C4()
{
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256264950);
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256264958);
  sub_23570E54C();
  sub_23570E5DC();
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_23570EA34()
{
  swift_getKeyPath();
  sub_23570F4DC();
  sub_2357146A0();
  swift_release();
  return swift_retain();
}

uint64_t sub_23570EAAC(uint64_t a1, uint64_t a2)
{
  *(_QWORD *)(a1 + OBJC_IVAR____TtC20_Translation_SwiftUI27TranslationSessionViewModel__translationSession) = a2;
  swift_retain();
  return swift_release();
}

void *sub_23570EAEC()
{
  uint64_t v0;
  void *v1;
  id v2;

  swift_getKeyPath();
  sub_23570F4DC();
  sub_2357146A0();
  swift_release();
  v1 = *(void **)(v0 + OBJC_IVAR____TtC20_Translation_SwiftUI27TranslationSessionViewModel__preflightConfiguration);
  v2 = v1;
  return v1;
}

void sub_23570EB68(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + OBJC_IVAR____TtC20_Translation_SwiftUI27TranslationSessionViewModel__preflightConfiguration);
  *(_QWORD *)(a1 + OBJC_IVAR____TtC20_Translation_SwiftUI27TranslationSessionViewModel__preflightConfiguration) = a2;
  v3 = a2;

}

uint64_t sub_23570EBA0()
{
  uint64_t v0;
  uint64_t v1;

  swift_getKeyPath();
  sub_23570F4DC();
  sub_2357146A0();
  swift_release();
  v1 = *(_QWORD *)(v0 + OBJC_IVAR____TtC20_Translation_SwiftUI27TranslationSessionViewModel__preflightCompletion);
  sub_23570CAFC(v1);
  return v1;
}

uint64_t sub_23570EC2C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t *v3;
  uint64_t v4;

  v3 = (uint64_t *)(a1 + OBJC_IVAR____TtC20_Translation_SwiftUI27TranslationSessionViewModel__preflightCompletion);
  v4 = *(_QWORD *)(a1 + OBJC_IVAR____TtC20_Translation_SwiftUI27TranslationSessionViewModel__preflightCompletion);
  *v3 = a2;
  v3[1] = a3;
  sub_23570CAFC(a2);
  return sub_23570D478(v4);
}

id sub_23570EC80(uint64_t a1)
{
  char *v1;
  char *v3;
  char *v4;
  id v5;
  id v6;
  id v7;
  objc_super v9;

  *(_QWORD *)&v1[OBJC_IVAR____TtC20_Translation_SwiftUI27TranslationSessionViewModel__preflightConfiguration] = 0;
  v3 = &v1[OBJC_IVAR____TtC20_Translation_SwiftUI27TranslationSessionViewModel__preflightCompletion];
  *(_QWORD *)v3 = 0;
  *((_QWORD *)v3 + 1) = 0;
  v4 = v1;
  sub_2357146AC();
  *(_QWORD *)&v4[OBJC_IVAR____TtC20_Translation_SwiftUI27TranslationSessionViewModel__translationSession] = a1;
  swift_retain();

  v9.receiver = v4;
  v9.super_class = (Class)type metadata accessor for TranslationSessionViewModel();
  v5 = objc_msgSendSuper2(&v9, sel_init);
  swift_getKeyPath();
  sub_23570F4DC();
  v6 = v5;
  sub_2357146A0();
  swift_release();
  v7 = v6;
  swift_retain();
  sub_2357146C4();
  swift_release();

  swift_release();
  return v7;
}

void sub_23570EDA0(void *a1, void *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v6;
  id v7;
  uint64_t v8;
  id v9;
  NSObject *v10;
  os_log_type_t v11;
  uint8_t *v12;
  _QWORD *v13;
  id v14;
  uint8_t *v15;
  id v16;
  id v17;
  void *v18;
  uint64_t v19;
  id v20;
  id v21;
  uint64_t v22;
  id v23;
  os_log_type_t v24;
  uint8_t *v25;
  id v26;
  void (*v27)(void *, void *);
  id v28;
  uint64_t KeyPath;
  uint64_t v30;
  _QWORD *v31;
  void *v32;

  v3 = v2;
  v32 = a2;
  if (a1)
  {
    v6 = qword_256264850;
    v7 = a2;
    if (v6 != -1)
      swift_once();
    v8 = sub_235714754();
    __swift_project_value_buffer(v8, (uint64_t)qword_2562650F8);
    v9 = a1;
    v10 = sub_23571473C();
    v11 = sub_2357149F4();
    if (!os_log_type_enabled(v10, v11))
    {

      goto LABEL_16;
    }
    v12 = (uint8_t *)swift_slowAlloc();
    v13 = (_QWORD *)swift_slowAlloc();
    *(_DWORD *)v12 = 138543362;
    v14 = v9;
    sub_235714A0C();
    *v13 = a1;

    _os_log_impl(&dword_23570B000, v10, v11, "User finished remote UI and provided completed configuration: %{public}@", v12, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_256264A70);
    swift_arrayDestroy();
    MEMORY[0x23B7D49DC](v13, -1, -1);
    v15 = v12;
    goto LABEL_14;
  }
  if (a2)
  {
    v16 = a2;
  }
  else
  {
    sub_235714970();
    v17 = objc_allocWithZone(MEMORY[0x24BDD1540]);
    v18 = (void *)sub_235714964();
    swift_bridgeObjectRelease();
    v16 = objc_msgSend(v17, sel_initWithDomain_code_userInfo_, v18, 20, 0);

  }
  v32 = v16;
  v19 = qword_256264850;
  v20 = a2;
  v21 = v16;
  if (v19 != -1)
    swift_once();
  v22 = sub_235714754();
  __swift_project_value_buffer(v22, (uint64_t)qword_2562650F8);
  v23 = v21;
  v10 = sub_23571473C();
  v24 = sub_2357149DC();
  if (os_log_type_enabled(v10, v24))
  {
    v25 = (uint8_t *)swift_slowAlloc();
    v31 = (_QWORD *)swift_slowAlloc();
    *(_DWORD *)v25 = 138412290;
    v26 = v23;
    sub_235714A0C();
    *v31 = v16;

    _os_log_impl(&dword_23570B000, v10, v24, "Reported that remote UI finished but didn't get finished configuration, reporting the error as: %@", v25, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_256264A70);
    swift_arrayDestroy();
    MEMORY[0x23B7D49DC](v31, -1, -1);
    v15 = v25;
LABEL_14:
    MEMORY[0x23B7D49DC](v15, -1, -1);

    goto LABEL_16;
  }

LABEL_16:
  swift_getKeyPath();
  sub_23570F4DC();
  sub_2357146A0();
  swift_release();
  v27 = *(void (**)(void *, void *))(v3
                                              + OBJC_IVAR____TtC20_Translation_SwiftUI27TranslationSessionViewModel__preflightCompletion);
  if (v27)
  {
    swift_beginAccess();
    sub_23570CAFC((uint64_t)v27);
    v28 = v32;
    v27(a1, v32);
    sub_23570D478((uint64_t)v27);

  }
  KeyPath = swift_getKeyPath();
  MEMORY[0x24BDAC7A8](KeyPath);
  sub_235714694();
  swift_release();
  v30 = swift_getKeyPath();
  MEMORY[0x24BDAC7A8](v30);
  sub_235714694();
  swift_release();

}

id sub_23570F2C0()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for TranslationSessionViewModel();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_23570F368()
{
  return type metadata accessor for TranslationSessionViewModel();
}

uint64_t type metadata accessor for TranslationSessionViewModel()
{
  uint64_t result;

  result = qword_2562649F8;
  if (!qword_2562649F8)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_23570F3AC()
{
  uint64_t result;
  unint64_t v1;

  result = sub_2357146B8();
  if (v1 <= 0x3F)
  {
    result = swift_updateClassMetadata2();
    if (!result)
      return 0;
  }
  return result;
}

unint64_t sub_23570F4DC()
{
  unint64_t result;
  uint64_t v1;

  result = qword_256264A68;
  if (!qword_256264A68)
  {
    v1 = type metadata accessor for TranslationSessionViewModel();
    result = MEMORY[0x23B7D497C](&unk_235715150, v1);
    atomic_store(result, (unint64_t *)&qword_256264A68);
  }
  return result;
}

void sub_23570F524(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  id v6;

  if (a2)
    v5 = sub_235714688();
  else
    v5 = 0;
  v6 = (id)v5;
  (*(void (**)(uint64_t, uint64_t))(a3 + 16))(a3, a1);

}

uint64_t sub_23570F57C()
{
  uint64_t v0;

  _Block_release(*(const void **)(v0 + 16));
  return swift_deallocObject();
}

void sub_23570F5A0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  sub_23570F524(a1, a2, *(_QWORD *)(v2 + 16));
}

uint64_t sub_23570F5A8(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  id v6;
  NSObject *v7;
  os_log_type_t v8;
  uint8_t *v9;
  id v10;
  uint64_t KeyPath;
  id v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD *v16;

  if (qword_256264850 != -1)
    swift_once();
  v5 = sub_235714754();
  __swift_project_value_buffer(v5, (uint64_t)qword_2562650F8);
  v6 = a1;
  v7 = sub_23571473C();
  v8 = sub_2357149F4();
  if (os_log_type_enabled(v7, v8))
  {
    v9 = (uint8_t *)swift_slowAlloc();
    v16 = (_QWORD *)swift_slowAlloc();
    *(_DWORD *)v9 = 138543362;
    v10 = v6;
    sub_235714A0C();
    *v16 = v6;

    _os_log_impl(&dword_23570B000, v7, v8, "Text session reported that it needs user action; will present UI with configuration: %{public}@",
      v9,
      0xCu);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_256264A70);
    swift_arrayDestroy();
    MEMORY[0x23B7D49DC](v16, -1, -1);
    MEMORY[0x23B7D49DC](v9, -1, -1);

  }
  else
  {

  }
  KeyPath = swift_getKeyPath();
  MEMORY[0x24BDAC7A8](KeyPath);
  sub_23570F4DC();
  v12 = v6;
  sub_235714694();
  swift_release();

  v13 = swift_allocObject();
  *(_QWORD *)(v13 + 16) = a2;
  *(_QWORD *)(v13 + 24) = a3;
  v14 = swift_getKeyPath();
  MEMORY[0x24BDAC7A8](v14);
  swift_retain();
  sub_235714694();
  swift_release();
  return swift_release();
}

void sub_23570F894()
{
  sub_23570F95C();
}

uint64_t sub_23570F8A8()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_23570F8CC()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 16))();
}

uint64_t sub_23570F8F4()
{
  return sub_23570F908();
}

uint64_t sub_23570F908()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t *v3;
  uint64_t v4;

  v1 = v0[3];
  v2 = v0[4];
  v3 = (uint64_t *)(v0[2] + OBJC_IVAR____TtC20_Translation_SwiftUI27TranslationSessionViewModel__preflightCompletion);
  v4 = *v3;
  *v3 = v1;
  v3[1] = v2;
  sub_23570CAFC(v1);
  return sub_23570D478(v4);
}

void sub_23570F95C()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  void *v3;
  id v4;

  v1 = *(_QWORD *)(v0 + 16);
  v2 = *(void **)(v0 + 24);
  v3 = *(void **)(v1 + OBJC_IVAR____TtC20_Translation_SwiftUI27TranslationSessionViewModel__preflightConfiguration);
  *(_QWORD *)(v1 + OBJC_IVAR____TtC20_Translation_SwiftUI27TranslationSessionViewModel__preflightConfiguration) = v2;
  v4 = v2;

}

uint64_t sub_23570F998()
{
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for _TranslationSwiftUIBundleObject()
{
  return objc_opt_self();
}

uint64_t View.translationTask(_:action:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  char *v13;
  int *v14;
  uint64_t v15;
  char *v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  __int128 v25;

  v23 = a5;
  v22 = a4;
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_256264B78);
  v9 = MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)&v22 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v9);
  v13 = (char *)&v22 - v12;
  v14 = (int *)type metadata accessor for TranslationTaskModifier();
  MEMORY[0x24BDAC7A8](v14);
  v16 = (char *)&v22 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23571002C(a1, (uint64_t)v16, &qword_256264B78);
  v17 = &v16[v14[5]];
  *(_QWORD *)v17 = a2;
  *((_QWORD *)v17 + 1) = a3;
  v18 = sub_2357146E8();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v18 - 8) + 56))(v13, 1, 1, v18);
  sub_23571002C((uint64_t)v13, (uint64_t)v11, &qword_256264B78);
  swift_retain();
  sub_235714910();
  sub_23570FBAC((uint64_t)v13);
  v19 = v14[7];
  v24 = 0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256264B80);
  sub_235714910();
  *(_OWORD *)&v16[v19] = v25;
  v20 = (uint64_t *)&v16[v14[8]];
  *v20 = swift_getKeyPath();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256264B88);
  swift_storeEnumTagMultiPayload();
  MEMORY[0x23B7D45BC](v16, v22, v14, v23);
  return sub_23570FF4C((uint64_t)v16);
}

uint64_t sub_23570FBAC(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_256264B78);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t View.translationTask(source:target:action:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X8>)
{
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  char *v11;
  int *v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  char *v24;
  void (*v25)(char *, uint64_t, uint64_t, uint64_t);
  char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  __int128 v40;

  v38 = a6;
  v36 = a7;
  v37 = a5;
  v33 = a3;
  v34 = a4;
  v31 = a1;
  v32 = a2;
  v35 = __swift_instantiateConcreteTypeFromMangledName(&qword_256264B78);
  v7 = MEMORY[0x24BDAC7A8](v35);
  v9 = (char *)&v31 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v7);
  v11 = (char *)&v31 - v10;
  v12 = (int *)type metadata accessor for TranslationTaskModifier();
  MEMORY[0x24BDAC7A8](v12);
  v14 = (char *)&v31 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_256264B90);
  v16 = MEMORY[0x24BDAC7A8](v15);
  v18 = (char *)&v31 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v16);
  v20 = (char *)&v31 - v19;
  v21 = sub_2357146E8();
  v22 = *(_QWORD *)(v21 - 8);
  MEMORY[0x24BDAC7A8](v21);
  v24 = (char *)&v31 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23571002C(v31, (uint64_t)v20, &qword_256264B90);
  sub_23571002C(v32, (uint64_t)v18, &qword_256264B90);
  sub_2357146DC();
  (*(void (**)(char *, char *, uint64_t))(v22 + 16))(v14, v24, v21);
  v25 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v22 + 56);
  v25(v14, 0, 1, v21);
  v26 = &v14[v12[5]];
  v27 = v34;
  *(_QWORD *)v26 = v33;
  *((_QWORD *)v26 + 1) = v27;
  v25(v11, 1, 1, v21);
  sub_23571002C((uint64_t)v11, (uint64_t)v9, &qword_256264B78);
  swift_retain();
  sub_235714910();
  sub_23570FBAC((uint64_t)v11);
  v28 = v12[7];
  v39 = 0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256264B80);
  sub_235714910();
  *(_OWORD *)&v14[v28] = v40;
  v29 = (uint64_t *)&v14[v12[8]];
  *v29 = swift_getKeyPath();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256264B88);
  swift_storeEnumTagMultiPayload();
  MEMORY[0x23B7D45BC](v14, v37, v12, v38);
  sub_23570FF4C((uint64_t)v14);
  return (*(uint64_t (**)(char *, uint64_t))(v22 + 8))(v24, v21);
}

uint64_t sub_23570FEA8()
{
  return sub_2357147A8();
}

uint64_t sub_23570FEC8(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_256264BA0);
  MEMORY[0x24BDAC7A8](v2);
  sub_23571002C(a1, (uint64_t)&v5 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0), &qword_256264BA0);
  return sub_2357147B4();
}

uint64_t sub_23570FF4C(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata accessor for TranslationTaskModifier();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_23570FF88(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  _QWORD v4[2];

  v1 = *(_QWORD *)(a1 + 8);
  type metadata accessor for TranslationTaskModifier();
  v2 = sub_235714784();
  v4[0] = v1;
  v4[1] = sub_23570FFE4();
  return MEMORY[0x23B7D497C](MEMORY[0x24BDED308], v2, v4);
}

unint64_t sub_23570FFE4()
{
  unint64_t result;
  uint64_t v1;

  result = qword_256264B98;
  if (!qword_256264B98)
  {
    v1 = type metadata accessor for TranslationTaskModifier();
    result = MEMORY[0x23B7D497C](&unk_235715280, v1);
    atomic_store(result, (unint64_t *)&qword_256264B98);
  }
  return result;
}

uint64_t sub_23571002C(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t *sub_235710070(uint64_t *a1, uint64_t *a2, int *a3)
{
  int v5;
  uint64_t v7;
  uint64_t v8;
  unsigned int (*v9)(uint64_t *, uint64_t, uint64_t);
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD *v14;
  _QWORD *v15;
  uint64_t v16;
  char *v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  _QWORD *v23;
  char *v24;
  uint64_t v25;
  void *v26;
  _QWORD *v27;
  _QWORD *v28;
  id v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;

  v5 = *(_DWORD *)(*((_QWORD *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v11 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v11 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    v7 = sub_2357146E8();
    v8 = *(_QWORD *)(v7 - 8);
    v9 = *(unsigned int (**)(uint64_t *, uint64_t, uint64_t))(v8 + 48);
    if (v9(a2, 1, v7))
    {
      v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_256264B78);
      memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v10 - 8) + 64));
    }
    else
    {
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(v8 + 16))(a1, a2, v7);
      (*(void (**)(uint64_t *, _QWORD, uint64_t, uint64_t))(v8 + 56))(a1, 0, 1, v7);
    }
    v12 = a3[5];
    v13 = a3[6];
    v14 = (uint64_t *)((char *)a1 + v12);
    v15 = (uint64_t *)((char *)a2 + v12);
    v16 = v15[1];
    *v14 = *v15;
    v14[1] = v16;
    v17 = (char *)a1 + v13;
    v18 = (char *)a2 + v13;
    swift_retain();
    if (v9((uint64_t *)v18, 1, v7))
    {
      v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_256264B78);
      memcpy(v17, v18, *(_QWORD *)(*(_QWORD *)(v19 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v8 + 16))(v17, v18, v7);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v8 + 56))(v17, 0, 1, v7);
    }
    v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_256264BA8);
    *(_QWORD *)&v17[*(int *)(v20 + 28)] = *(_QWORD *)&v18[*(int *)(v20 + 28)];
    v21 = a3[7];
    v22 = a3[8];
    v23 = (uint64_t *)((char *)a1 + v21);
    v24 = (char *)a2 + v21;
    v26 = *(void **)v24;
    v25 = *((_QWORD *)v24 + 1);
    *v23 = *(_QWORD *)v24;
    v23[1] = v25;
    v27 = (uint64_t *)((char *)a1 + v22);
    v28 = (uint64_t *)((char *)a2 + v22);
    swift_retain();
    v29 = v26;
    swift_retain();
    __swift_instantiateConcreteTypeFromMangledName(&qword_256264B88);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v30 = sub_2357147FC();
      v31 = *(_QWORD *)(v30 - 8);
      if ((*(unsigned int (**)(_QWORD *, uint64_t, uint64_t))(v31 + 48))(v28, 1, v30))
      {
        v32 = __swift_instantiateConcreteTypeFromMangledName(&qword_256264BA0);
        memcpy(v27, v28, *(_QWORD *)(*(_QWORD *)(v32 - 8) + 64));
      }
      else
      {
        (*(void (**)(_QWORD *, _QWORD *, uint64_t))(v31 + 16))(v27, v28, v30);
        (*(void (**)(_QWORD *, _QWORD, uint64_t, uint64_t))(v31 + 56))(v27, 0, 1, v30);
      }
    }
    else
    {
      *v27 = *v28;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

uint64_t sub_2357102E4(uint64_t a1, int *a2)
{
  uint64_t v4;
  uint64_t v5;
  unsigned int (*v6)(uint64_t, uint64_t, uint64_t);
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t result;

  v4 = sub_2357146E8();
  v5 = *(_QWORD *)(v4 - 8);
  v6 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v5 + 48);
  if (!v6(a1, 1, v4))
    (*(void (**)(uint64_t, uint64_t))(v5 + 8))(a1, v4);
  swift_release();
  v7 = a1 + a2[6];
  if (!v6(v7, 1, v4))
    (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v7, v4);
  __swift_instantiateConcreteTypeFromMangledName(&qword_256264BA8);
  swift_release();

  swift_release();
  v8 = a1 + a2[8];
  __swift_instantiateConcreteTypeFromMangledName(&qword_256264B88);
  if (swift_getEnumCaseMultiPayload() != 1)
    return swift_release();
  v9 = sub_2357147FC();
  v10 = *(_QWORD *)(v9 - 8);
  result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v10 + 48))(v8, 1, v9);
  if (!(_DWORD)result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(v10 + 8))(v8, v9);
  return result;
}

char *sub_235710440(char *a1, char *a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  unsigned int (*v8)(char *, uint64_t, uint64_t);
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  char *v13;
  uint64_t v14;
  char *v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  char *v22;
  uint64_t v23;
  void *v24;
  char *v25;
  char *v26;
  id v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;

  v6 = sub_2357146E8();
  v7 = *(_QWORD *)(v6 - 8);
  v8 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v7 + 48);
  if (v8(a2, 1, v6))
  {
    v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_256264B78);
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v9 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v7 + 16))(a1, a2, v6);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v7 + 56))(a1, 0, 1, v6);
  }
  v10 = a3[5];
  v11 = a3[6];
  v12 = &a1[v10];
  v13 = &a2[v10];
  v14 = *((_QWORD *)v13 + 1);
  *(_QWORD *)v12 = *(_QWORD *)v13;
  *((_QWORD *)v12 + 1) = v14;
  v15 = &a1[v11];
  v16 = &a2[v11];
  swift_retain();
  if (v8(v16, 1, v6))
  {
    v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_256264B78);
    memcpy(v15, v16, *(_QWORD *)(*(_QWORD *)(v17 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v7 + 16))(v15, v16, v6);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v7 + 56))(v15, 0, 1, v6);
  }
  v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_256264BA8);
  *(_QWORD *)&v15[*(int *)(v18 + 28)] = *(_QWORD *)&v16[*(int *)(v18 + 28)];
  v19 = a3[7];
  v20 = a3[8];
  v21 = &a1[v19];
  v22 = &a2[v19];
  v24 = *(void **)v22;
  v23 = *((_QWORD *)v22 + 1);
  *(_QWORD *)v21 = *(_QWORD *)v22;
  *((_QWORD *)v21 + 1) = v23;
  v25 = &a1[v20];
  v26 = &a2[v20];
  swift_retain();
  v27 = v24;
  swift_retain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256264B88);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v28 = sub_2357147FC();
    v29 = *(_QWORD *)(v28 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v29 + 48))(v26, 1, v28))
    {
      v30 = __swift_instantiateConcreteTypeFromMangledName(&qword_256264BA0);
      memcpy(v25, v26, *(_QWORD *)(*(_QWORD *)(v30 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v29 + 16))(v25, v26, v28);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v29 + 56))(v25, 0, 1, v28);
    }
  }
  else
  {
    *(_QWORD *)v25 = *(_QWORD *)v26;
    swift_retain();
  }
  swift_storeEnumTagMultiPayload();
  return a1;
}

char *sub_235710688(char *a1, char *a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t (*v8)(char *, uint64_t, uint64_t);
  int v9;
  int v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  char *v18;
  int v19;
  int v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  char *v24;
  char *v25;
  void *v26;
  void *v27;
  id v28;
  uint64_t v29;
  char *v30;
  char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;

  v6 = sub_2357146E8();
  v7 = *(_QWORD *)(v6 - 8);
  v8 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v7 + 48);
  v9 = v8(a1, 1, v6);
  v10 = v8(a2, 1, v6);
  if (v9)
  {
    if (!v10)
    {
      (*(void (**)(char *, char *, uint64_t))(v7 + 16))(a1, a2, v6);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v7 + 56))(a1, 0, 1, v6);
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  if (v10)
  {
    (*(void (**)(char *, uint64_t))(v7 + 8))(a1, v6);
LABEL_6:
    v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_256264B78);
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v11 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(char *, char *, uint64_t))(v7 + 24))(a1, a2, v6);
LABEL_7:
  v12 = a3[5];
  v13 = &a1[v12];
  v14 = &a2[v12];
  v15 = *((_QWORD *)v14 + 1);
  *(_QWORD *)v13 = *(_QWORD *)v14;
  *((_QWORD *)v13 + 1) = v15;
  swift_retain();
  swift_release();
  v16 = a3[6];
  v17 = &a1[v16];
  v18 = &a2[v16];
  v19 = v8(&a1[v16], 1, v6);
  v20 = v8(v18, 1, v6);
  if (v19)
  {
    if (!v20)
    {
      (*(void (**)(char *, char *, uint64_t))(v7 + 16))(v17, v18, v6);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v7 + 56))(v17, 0, 1, v6);
      goto LABEL_13;
    }
    goto LABEL_12;
  }
  if (v20)
  {
    (*(void (**)(char *, uint64_t))(v7 + 8))(v17, v6);
LABEL_12:
    v21 = __swift_instantiateConcreteTypeFromMangledName(&qword_256264B78);
    memcpy(v17, v18, *(_QWORD *)(*(_QWORD *)(v21 - 8) + 64));
    goto LABEL_13;
  }
  (*(void (**)(char *, char *, uint64_t))(v7 + 24))(v17, v18, v6);
LABEL_13:
  v22 = __swift_instantiateConcreteTypeFromMangledName(&qword_256264BA8);
  *(_QWORD *)&v17[*(int *)(v22 + 28)] = *(_QWORD *)&v18[*(int *)(v22 + 28)];
  swift_retain();
  swift_release();
  v23 = a3[7];
  v24 = &a1[v23];
  v25 = &a2[v23];
  v26 = *(void **)&a1[v23];
  v27 = *(void **)&a2[v23];
  *(_QWORD *)v24 = v27;
  v28 = v27;

  *((_QWORD *)v24 + 1) = *((_QWORD *)v25 + 1);
  swift_retain();
  swift_release();
  if (a1 != a2)
  {
    v29 = a3[8];
    v30 = &a1[v29];
    v31 = &a2[v29];
    sub_23571456C((uint64_t)&a1[v29], &qword_256264B88);
    __swift_instantiateConcreteTypeFromMangledName(&qword_256264B88);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v32 = sub_2357147FC();
      v33 = *(_QWORD *)(v32 - 8);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v33 + 48))(v31, 1, v32))
      {
        v34 = __swift_instantiateConcreteTypeFromMangledName(&qword_256264BA0);
        memcpy(v30, v31, *(_QWORD *)(*(_QWORD *)(v34 - 8) + 64));
      }
      else
      {
        (*(void (**)(char *, char *, uint64_t))(v33 + 16))(v30, v31, v32);
        (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v33 + 56))(v30, 0, 1, v32);
      }
    }
    else
    {
      *(_QWORD *)v30 = *(_QWORD *)v31;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

char *sub_2357109B0(char *a1, char *a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  unsigned int (*v8)(char *, uint64_t, uint64_t);
  uint64_t v9;
  uint64_t v10;
  char *v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;

  v6 = sub_2357146E8();
  v7 = *(_QWORD *)(v6 - 8);
  v8 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v7 + 48);
  if (v8(a2, 1, v6))
  {
    v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_256264B78);
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v9 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v7 + 32))(a1, a2, v6);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v7 + 56))(a1, 0, 1, v6);
  }
  v10 = a3[6];
  *(_OWORD *)&a1[a3[5]] = *(_OWORD *)&a2[a3[5]];
  v11 = &a1[v10];
  v12 = &a2[v10];
  if (v8(&a2[v10], 1, v6))
  {
    v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_256264B78);
    memcpy(v11, v12, *(_QWORD *)(*(_QWORD *)(v13 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v7 + 32))(v11, v12, v6);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v7 + 56))(v11, 0, 1, v6);
  }
  v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_256264BA8);
  *(_QWORD *)&v11[*(int *)(v14 + 28)] = *(_QWORD *)&v12[*(int *)(v14 + 28)];
  v15 = a3[8];
  *(_OWORD *)&a1[a3[7]] = *(_OWORD *)&a2[a3[7]];
  v16 = &a1[v15];
  v17 = &a2[v15];
  v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_256264B88);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v19 = sub_2357147FC();
    v20 = *(_QWORD *)(v19 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v20 + 48))(v17, 1, v19))
    {
      v21 = __swift_instantiateConcreteTypeFromMangledName(&qword_256264BA0);
      memcpy(v16, v17, *(_QWORD *)(*(_QWORD *)(v21 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v20 + 32))(v16, v17, v19);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v20 + 56))(v16, 0, 1, v19);
    }
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(v16, v17, *(_QWORD *)(*(_QWORD *)(v18 - 8) + 64));
  }
  return a1;
}

char *sub_235710BD0(char *a1, char *a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t (*v8)(char *, uint64_t, uint64_t);
  int v9;
  int v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  char *v14;
  int v15;
  int v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  char *v21;
  void *v22;
  uint64_t v23;
  char *v24;
  char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;

  v6 = sub_2357146E8();
  v7 = *(_QWORD *)(v6 - 8);
  v8 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v7 + 48);
  v9 = v8(a1, 1, v6);
  v10 = v8(a2, 1, v6);
  if (v9)
  {
    if (!v10)
    {
      (*(void (**)(char *, char *, uint64_t))(v7 + 32))(a1, a2, v6);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v7 + 56))(a1, 0, 1, v6);
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  if (v10)
  {
    (*(void (**)(char *, uint64_t))(v7 + 8))(a1, v6);
LABEL_6:
    v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_256264B78);
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v11 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(char *, char *, uint64_t))(v7 + 40))(a1, a2, v6);
LABEL_7:
  *(_OWORD *)&a1[a3[5]] = *(_OWORD *)&a2[a3[5]];
  swift_release();
  v12 = a3[6];
  v13 = &a1[v12];
  v14 = &a2[v12];
  v15 = v8(&a1[v12], 1, v6);
  v16 = v8(v14, 1, v6);
  if (v15)
  {
    if (!v16)
    {
      (*(void (**)(char *, char *, uint64_t))(v7 + 32))(v13, v14, v6);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v7 + 56))(v13, 0, 1, v6);
      goto LABEL_13;
    }
    goto LABEL_12;
  }
  if (v16)
  {
    (*(void (**)(char *, uint64_t))(v7 + 8))(v13, v6);
LABEL_12:
    v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_256264B78);
    memcpy(v13, v14, *(_QWORD *)(*(_QWORD *)(v17 - 8) + 64));
    goto LABEL_13;
  }
  (*(void (**)(char *, char *, uint64_t))(v7 + 40))(v13, v14, v6);
LABEL_13:
  v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_256264BA8);
  *(_QWORD *)&v13[*(int *)(v18 + 28)] = *(_QWORD *)&v14[*(int *)(v18 + 28)];
  swift_release();
  v19 = a3[7];
  v20 = &a1[v19];
  v21 = &a2[v19];
  v22 = *(void **)&a1[v19];
  *(_QWORD *)v20 = *(_QWORD *)v21;

  *((_QWORD *)v20 + 1) = *((_QWORD *)v21 + 1);
  swift_release();
  if (a1 != a2)
  {
    v23 = a3[8];
    v24 = &a1[v23];
    v25 = &a2[v23];
    sub_23571456C((uint64_t)&a1[v23], &qword_256264B88);
    v26 = __swift_instantiateConcreteTypeFromMangledName(&qword_256264B88);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v27 = sub_2357147FC();
      v28 = *(_QWORD *)(v27 - 8);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v28 + 48))(v25, 1, v27))
      {
        v29 = __swift_instantiateConcreteTypeFromMangledName(&qword_256264BA0);
        memcpy(v24, v25, *(_QWORD *)(*(_QWORD *)(v29 - 8) + 64));
      }
      else
      {
        (*(void (**)(char *, char *, uint64_t))(v28 + 32))(v24, v25, v27);
        (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v28 + 56))(v24, 0, 1, v27);
      }
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(v24, v25, *(_QWORD *)(*(_QWORD *)(v26 - 8) + 64));
    }
  }
  return a1;
}

uint64_t sub_235710ED4()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_235710EE0(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t, uint64_t);
  uint64_t v10;
  unint64_t v11;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_256264B78);
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
    v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_256264BA8);
    v14 = *(_QWORD *)(v13 - 8);
    if (*(_DWORD *)(v14 + 84) == (_DWORD)a2)
    {
      v8 = v13;
      v15 = a3[6];
    }
    else
    {
      v8 = __swift_instantiateConcreteTypeFromMangledName(qword_256264BB0);
      v14 = *(_QWORD *)(v8 - 8);
      v15 = a3[8];
    }
    v10 = a1 + v15;
    v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v14 + 48);
    return v9(v10, a2, v8);
  }
  v11 = *(_QWORD *)(a1 + a3[5]);
  if (v11 >= 0xFFFFFFFF)
    LODWORD(v11) = -1;
  return (v11 + 1);
}

uint64_t sub_235710FB8()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_235710FC4(uint64_t a1, uint64_t a2, int a3, int *a4)
{
  uint64_t result;
  uint64_t v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  result = __swift_instantiateConcreteTypeFromMangledName(&qword_256264B78);
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
      *(_QWORD *)(a1 + a4[5]) = (a2 - 1);
      return result;
    }
    v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_256264BA8);
    v14 = *(_QWORD *)(v13 - 8);
    if (*(_DWORD *)(v14 + 84) == a3)
    {
      v10 = v13;
      v15 = a4[6];
    }
    else
    {
      v10 = __swift_instantiateConcreteTypeFromMangledName(qword_256264BB0);
      v14 = *(_QWORD *)(v10 - 8);
      v15 = a4[8];
    }
    v12 = a1 + v15;
    v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v14 + 56);
  }
  return v11(v12, a2, a2, v10);
}

uint64_t type metadata accessor for TranslationTaskModifier()
{
  uint64_t result;

  result = qword_256264C10;
  if (!qword_256264C10)
    return swift_getSingletonMetadata();
  return result;
}

void sub_2357110D4()
{
  unint64_t v0;
  unint64_t v1;
  unint64_t v2;

  sub_2357111B8();
  if (v0 <= 0x3F)
  {
    sub_23571120C(319, &qword_256264C28, &qword_256264B78, MEMORY[0x24BDF42C0]);
    if (v1 <= 0x3F)
    {
      sub_23571120C(319, qword_256264C30, &qword_256264BA0, MEMORY[0x24BDEB560]);
      if (v2 <= 0x3F)
        swift_initStructMetadata();
    }
  }
}

void sub_2357111B8()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_256264C20)
  {
    sub_2357146E8();
    v0 = sub_235714A00();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_256264C20);
  }
}

void sub_23571120C(uint64_t a1, unint64_t *a2, uint64_t *a3, uint64_t (*a4)(uint64_t, uint64_t))
{
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;

  if (!*a2)
  {
    v7 = __swift_instantiateConcreteTypeFromMangledNameAbstract(a3);
    v8 = a4(a1, v7);
    if (!v9)
      atomic_store(v8, a2);
  }
}

uint64_t sub_235711264()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_235711274@<X0>(uint64_t *a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v3;

  v3 = *a1;
  swift_getKeyPath();
  sub_23570E984((unint64_t *)&qword_256264A68, (uint64_t (*)(uint64_t))type metadata accessor for TranslationSessionViewModel, (uint64_t)&unk_235715150);
  sub_2357146A0();
  swift_release();
  *a2 = *(_QWORD *)(v3 + OBJC_IVAR____TtC20_Translation_SwiftUI27TranslationSessionViewModel__translationSession);
  return swift_retain();
}

uint64_t sub_23571130C()
{
  swift_getKeyPath();
  sub_23570E984((unint64_t *)&qword_256264A68, (uint64_t (*)(uint64_t))type metadata accessor for TranslationSessionViewModel, (uint64_t)&unk_235715150);
  swift_retain();
  sub_235714694();
  swift_release();
  return swift_release();
}

id sub_2357113C4@<X0>(uint64_t *a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v3;
  void *v4;

  v3 = *a1;
  swift_getKeyPath();
  sub_23570E984((unint64_t *)&qword_256264A68, (uint64_t (*)(uint64_t))type metadata accessor for TranslationSessionViewModel, (uint64_t)&unk_235715150);
  sub_2357146A0();
  swift_release();
  v4 = *(void **)(v3 + OBJC_IVAR____TtC20_Translation_SwiftUI27TranslationSessionViewModel__preflightConfiguration);
  *a2 = v4;
  return v4;
}

void sub_235711458(void **a1)
{
  void *v1;
  id v2;

  v1 = *a1;
  swift_getKeyPath();
  sub_23570E984((unint64_t *)&qword_256264A68, (uint64_t (*)(uint64_t))type metadata accessor for TranslationSessionViewModel, (uint64_t)&unk_235715150);
  v2 = v1;
  sub_235714694();
  swift_release();

}

uint64_t sub_23571150C@<X0>(uint64_t *a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t (*v7)(_QWORD *, _QWORD *);

  v3 = *a1;
  swift_getKeyPath();
  sub_23570E984((unint64_t *)&qword_256264A68, (uint64_t (*)(uint64_t))type metadata accessor for TranslationSessionViewModel, (uint64_t)&unk_235715150);
  sub_2357146A0();
  swift_release();
  v4 = *(_QWORD *)(v3 + OBJC_IVAR____TtC20_Translation_SwiftUI27TranslationSessionViewModel__preflightCompletion);
  v5 = *(_QWORD *)(v3 + OBJC_IVAR____TtC20_Translation_SwiftUI27TranslationSessionViewModel__preflightCompletion + 8);
  if (v4)
  {
    v6 = swift_allocObject();
    *(_QWORD *)(v6 + 16) = v4;
    *(_QWORD *)(v6 + 24) = v5;
    v7 = sub_235714524;
  }
  else
  {
    v7 = 0;
    v6 = 0;
  }
  *a2 = v7;
  a2[1] = v6;
  return sub_23570CAFC(v4);
}

uint64_t sub_2357115E0(uint64_t *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t (*v4)(uint64_t, uint64_t);
  uint64_t KeyPath;

  v2 = *a1;
  v1 = a1[1];
  if (*a1)
  {
    v3 = swift_allocObject();
    *(_QWORD *)(v3 + 16) = v2;
    *(_QWORD *)(v3 + 24) = v1;
    v4 = sub_2357144F0;
  }
  else
  {
    v4 = 0;
  }
  KeyPath = swift_getKeyPath();
  MEMORY[0x24BDAC7A8](KeyPath);
  sub_23570CAFC(v2);
  sub_23570E984((unint64_t *)&qword_256264A68, (uint64_t (*)(uint64_t))type metadata accessor for TranslationSessionViewModel, (uint64_t)&unk_235715150);
  sub_235714694();
  sub_23570D478((uint64_t)v4);
  return swift_release();
}

uint64_t sub_235711704@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
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
  uint64_t v19;
  uint64_t v20;
  char *v21;
  uint64_t v22;
  char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  _QWORD *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  _QWORD v40[2];
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;

  v46 = a1;
  v47 = a2;
  v3 = sub_2357149B8();
  v44 = *(_QWORD *)(v3 - 8);
  v45 = v3;
  MEMORY[0x24BDAC7A8](v3);
  v5 = (char *)v40 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = type metadata accessor for TranslationTaskModifier();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = v8;
  v43 = v8;
  v10 = (char *)v40 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_256264B78);
  MEMORY[0x24BDAC7A8](v11);
  v13 = (char *)v40 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_256264C70);
  MEMORY[0x24BDAC7A8](v14);
  v16 = (char *)v40 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v49 = __swift_instantiateConcreteTypeFromMangledName(&qword_256264C78);
  MEMORY[0x24BDAC7A8](v49);
  v48 = (uint64_t)v40 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v41 = v2;
  sub_23571002C(v2, (uint64_t)v13, &qword_256264B78);
  sub_235713554(v2, (uint64_t)v10);
  v18 = *(unsigned __int8 *)(v7 + 80);
  v19 = (v18 + 16) & ~v18;
  v40[0] = v18 | 7;
  v40[1] = v19 + v9;
  v20 = swift_allocObject();
  v42 = v19;
  sub_23571359C((uint64_t)v10, v20 + v19);
  sub_2357149AC();
  v21 = &v16[*(int *)(v14 + 36)];
  v22 = __swift_instantiateConcreteTypeFromMangledName(&qword_256264C90);
  sub_23571002C((uint64_t)v13, (uint64_t)&v21[*(int *)(v22 + 40)], &qword_256264B78);
  v23 = &v21[*(int *)(v22 + 36)];
  v24 = v44;
  v25 = v45;
  (*(void (**)(char *, char *, uint64_t))(v44 + 16))(v23, v5, v45);
  *(_QWORD *)v21 = &unk_256264C88;
  *((_QWORD *)v21 + 1) = v20;
  v26 = __swift_instantiateConcreteTypeFromMangledName(&qword_256264C98);
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v26 - 8) + 16))(v16, v46, v26);
  (*(void (**)(char *, uint64_t))(v24 + 8))(v5, v25);
  sub_23571456C((uint64_t)v13, &qword_256264B78);
  v27 = v41;
  sub_235713554(v41, (uint64_t)v10);
  v28 = swift_allocObject();
  sub_23571359C((uint64_t)v10, v28 + v19);
  v29 = v48;
  sub_23571002C((uint64_t)v16, v48, &qword_256264C70);
  v30 = (_QWORD *)(v29 + *(int *)(v49 + 36));
  *v30 = 0;
  v30[1] = 0;
  v30[2] = sub_235713690;
  v30[3] = v28;
  sub_23571456C((uint64_t)v16, &qword_256264C70);
  sub_235713554(v27, (uint64_t)v10);
  sub_2357149A0();
  v31 = sub_235714994();
  v32 = (v18 + 32) & ~v18;
  v33 = swift_allocObject();
  v34 = MEMORY[0x24BEE6930];
  *(_QWORD *)(v33 + 16) = v31;
  *(_QWORD *)(v33 + 24) = v34;
  sub_23571359C((uint64_t)v10, v33 + v32);
  sub_235713554(v27, (uint64_t)v10);
  v35 = sub_235714994();
  v36 = swift_allocObject();
  *(_QWORD *)(v36 + 16) = v35;
  *(_QWORD *)(v36 + 24) = v34;
  sub_23571359C((uint64_t)v10, v36 + v32);
  sub_235714934();
  sub_235713554(v27, (uint64_t)v10);
  v37 = swift_allocObject();
  sub_23571359C((uint64_t)v10, v37 + v42);
  __swift_instantiateConcreteTypeFromMangledName(&qword_256264CA0);
  sub_235713904();
  sub_235713A4C();
  v38 = v48;
  sub_2357148EC();
  swift_release();
  swift_release();
  swift_release();
  return sub_23571456C(v38, &qword_256264C78);
}

uint64_t sub_235711B70(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;

  v1[12] = a1;
  v1[13] = __swift_instantiateConcreteTypeFromMangledName(&qword_256264D18);
  v1[14] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256264B78);
  v1[15] = swift_task_alloc();
  v1[16] = swift_task_alloc();
  v1[17] = swift_task_alloc();
  v1[18] = swift_task_alloc();
  v1[19] = swift_task_alloc();
  v1[20] = swift_task_alloc();
  v2 = sub_2357146E8();
  v1[21] = v2;
  v1[22] = *(_QWORD *)(v2 - 8);
  v1[23] = swift_task_alloc();
  v1[24] = swift_task_alloc();
  v1[25] = sub_2357149A0();
  v1[26] = sub_235714994();
  v1[27] = sub_235714988();
  v1[28] = v3;
  return swift_task_switch();
}

uint64_t sub_235711CA4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  void *v3;
  uint64_t v4;
  NSObject *v5;
  os_log_type_t v6;
  uint8_t *v7;
  void *v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unsigned int (*v14)(uint64_t, uint64_t, uint64_t);
  uint64_t v15;
  uint64_t v17;
  _QWORD *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void (*v24)(uint64_t, _QWORD, uint64_t, uint64_t);
  uint64_t v25;
  unsigned int v26;
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
  void (*v41)(uint64_t, uint64_t);
  uint64_t v42;
  NSObject *v43;
  os_log_type_t v44;
  uint8_t *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  void (*v51)(uint64_t, _QWORD, uint64_t, uint64_t);
  uint64_t v52;
  uint64_t v53;
  id v54;
  uint64_t v55;
  id v56;
  uint64_t v57;
  uint64_t v58;
  _QWORD *v59;
  uint64_t v60;
  NSObject *v61;
  os_log_type_t v62;
  _BOOL4 v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint8_t *v67;
  void (*v68)(uint64_t, uint64_t, uint64_t);
  _OWORD *v69;
  void (*v70)(uint64_t, uint64_t, uint64_t);

  v1 = *(_QWORD *)(v0 + 96);
  v2 = v1 + *(int *)(type metadata accessor for TranslationTaskModifier() + 28);
  *(_OWORD *)(v0 + 32) = *(_OWORD *)v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256264CF8);
  sub_23571491C();
  v3 = *(void **)(v0 + 64);
  if (v3)
  {
    swift_getKeyPath();
    *(_QWORD *)(v0 + 80) = v3;
    sub_23570E984((unint64_t *)&qword_256264A68, (uint64_t (*)(uint64_t))type metadata accessor for TranslationSessionViewModel, (uint64_t)&unk_235715150);
    sub_2357146A0();
    swift_release();
    swift_retain();

    if (qword_256264858 != -1)
      swift_once();
    v4 = sub_235714754();
    __swift_project_value_buffer(v4, (uint64_t)qword_256265110);
    v5 = sub_23571473C();
    v6 = sub_2357149D0();
    if (os_log_type_enabled(v5, v6))
    {
      v7 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_23570B000, v5, v6, "Cancelling previous session because a configuration was triggered", v7, 2u);
      MEMORY[0x23B7D49DC](v7, -1, -1);
    }

    sub_235714700();
    v8 = *(void **)v2;
    v9 = *(_QWORD *)(v2 + 8);
    *(_QWORD *)(v0 + 16) = *(_QWORD *)v2;
    *(_QWORD *)(v0 + 24) = v9;
    *(_QWORD *)(v0 + 72) = 0;
    swift_retain();
    v10 = v8;
    sub_235714928();
    swift_release();

    swift_release();
  }
  v12 = *(_QWORD *)(v0 + 168);
  v11 = *(_QWORD *)(v0 + 176);
  v13 = *(_QWORD *)(v0 + 160);
  sub_23571002C(*(_QWORD *)(v0 + 96), v13, &qword_256264B78);
  v14 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v11 + 48);
  if (v14(v13, 1, v12) == 1)
  {
    v15 = *(_QWORD *)(v0 + 160);
    swift_release();
    sub_23571456C(v15, &qword_256264B78);
LABEL_9:
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
  v69 = (_OWORD *)v2;
  v17 = *(_QWORD *)(v0 + 192);
  v19 = *(_QWORD *)(v0 + 168);
  v18 = *(_QWORD **)(v0 + 176);
  v20 = *(_QWORD *)(v0 + 152);
  v21 = *(_QWORD *)(v0 + 144);
  v22 = *(_QWORD *)(v0 + 104);
  v23 = *(_QWORD *)(v0 + 112);
  v68 = (void (*)(uint64_t, uint64_t, uint64_t))v18[4];
  v68(v17, *(_QWORD *)(v0 + 160), v19);
  __swift_instantiateConcreteTypeFromMangledName(&qword_256264BA8);
  sub_23571491C();
  v70 = (void (*)(uint64_t, uint64_t, uint64_t))v18[2];
  v70(v21, v17, v19);
  v24 = (void (*)(uint64_t, _QWORD, uint64_t, uint64_t))v18[7];
  v24(v21, 0, 1, v19);
  v25 = v23 + *(int *)(v22 + 48);
  sub_23571002C(v20, v23, &qword_256264B78);
  sub_23571002C(v21, v25, &qword_256264B78);
  v26 = v14(v23, 1, v19);
  v27 = *(_QWORD *)(v0 + 168);
  if (v26 != 1)
  {
    sub_23571002C(*(_QWORD *)(v0 + 112), *(_QWORD *)(v0 + 136), &qword_256264B78);
    if (v14(v25, 1, v27) != 1)
    {
      v33 = *(_QWORD *)(v0 + 176);
      v34 = *(_QWORD *)(v0 + 184);
      v35 = *(_QWORD *)(v0 + 168);
      v37 = *(_QWORD *)(v0 + 144);
      v36 = *(_QWORD *)(v0 + 152);
      v38 = *(_QWORD *)(v0 + 136);
      v39 = *(_QWORD *)(v0 + 112);
      v68(v34, v25, v35);
      sub_23570E984((unint64_t *)&unk_256264D30, (uint64_t (*)(uint64_t))MEMORY[0x24BDF6378], MEMORY[0x24BDF6388]);
      v40 = sub_235714958();
      v41 = *(void (**)(uint64_t, uint64_t))(v33 + 8);
      v41(v34, v35);
      sub_23571456C(v37, &qword_256264B78);
      sub_23571456C(v36, &qword_256264B78);
      v41(v38, v35);
      sub_23571456C(v39, &qword_256264B78);
      if ((v40 & 1) == 0)
        goto LABEL_23;
      goto LABEL_17;
    }
    v30 = *(_QWORD *)(v0 + 168);
    v29 = *(_QWORD *)(v0 + 176);
    v31 = *(_QWORD *)(v0 + 152);
    v32 = *(_QWORD *)(v0 + 136);
    sub_23571456C(*(_QWORD *)(v0 + 144), &qword_256264B78);
    sub_23571456C(v31, &qword_256264B78);
    (*(void (**)(uint64_t, uint64_t))(v29 + 8))(v32, v30);
LABEL_15:
    sub_23571456C(*(_QWORD *)(v0 + 112), &qword_256264D18);
    goto LABEL_23;
  }
  v28 = *(_QWORD *)(v0 + 152);
  sub_23571456C(*(_QWORD *)(v0 + 144), &qword_256264B78);
  sub_23571456C(v28, &qword_256264B78);
  if (v14(v25, 1, v27) != 1)
    goto LABEL_15;
  sub_23571456C(*(_QWORD *)(v0 + 112), &qword_256264B78);
LABEL_17:
  if ((sub_2357146D0() & 1) == 0)
  {
    swift_release();
    if (qword_256264858 != -1)
      swift_once();
    v60 = sub_235714754();
    __swift_project_value_buffer(v60, (uint64_t)qword_256265110);
    v61 = sub_23571473C();
    v62 = sub_2357149D0();
    v63 = os_log_type_enabled(v61, v62);
    v64 = *(_QWORD *)(v0 + 192);
    v65 = *(_QWORD *)(v0 + 168);
    v66 = *(_QWORD *)(v0 + 176);
    if (v63)
    {
      v67 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v67 = 0;
      _os_log_impl(&dword_23570B000, v61, v62, "Not triggering translation on configuration since it hasn't changed; the view is likely reappearing",
        v67,
        2u);
      MEMORY[0x23B7D49DC](v67, -1, -1);
    }

    (*(void (**)(uint64_t, uint64_t))(v66 + 8))(v64, v65);
    goto LABEL_9;
  }
  if (qword_256264858 != -1)
    swift_once();
  v42 = sub_235714754();
  __swift_project_value_buffer(v42, (uint64_t)qword_256265110);
  v43 = sub_23571473C();
  v44 = sub_2357149D0();
  if (os_log_type_enabled(v43, v44))
  {
    v45 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v45 = 0;
    _os_log_impl(&dword_23570B000, v43, v44, "Configurations are identical but both were created internally, so allowing to change", v45, 2u);
    MEMORY[0x23B7D49DC](v45, -1, -1);
  }

LABEL_23:
  v46 = *(_QWORD *)(v0 + 192);
  v47 = *(_QWORD *)(v0 + 184);
  v48 = *(_QWORD *)(v0 + 168);
  v49 = *(_QWORD *)(v0 + 120);
  v50 = *(_QWORD *)(v0 + 128);
  v51 = v24;
  v52 = *(_QWORD *)(v0 + 96);
  v70(v50, v46, v48);
  v51(v50, 0, 1, v48);
  sub_23571002C(v50, v49, &qword_256264B78);
  sub_235714928();
  sub_23571456C(v50, &qword_256264B78);
  sub_23571470C();
  v70(v47, v46, v48);
  v53 = sub_2357146F4();
  *(_QWORD *)(v0 + 232) = v53;
  v54 = objc_allocWithZone((Class)type metadata accessor for TranslationSessionViewModel());
  v55 = swift_retain();
  v56 = sub_23570EC80(v55);
  *(_OWORD *)(v0 + 48) = *v69;
  *(_QWORD *)(v0 + 88) = v56;
  sub_235714928();
  v57 = swift_task_alloc();
  *(_QWORD *)(v0 + 240) = v57;
  *(_QWORD *)(v57 + 16) = v52;
  *(_QWORD *)(v57 + 24) = v53;
  v58 = swift_task_alloc();
  *(_QWORD *)(v0 + 248) = v58;
  *(_QWORD *)(v58 + 16) = v52;
  *(_QWORD *)(v0 + 256) = sub_235714994();
  v59 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 264) = v59;
  *v59 = v0;
  v59[1] = sub_235712498;
  return sub_235714A3C();
}

uint64_t sub_235712498()
{
  swift_task_dealloc();
  swift_release();
  swift_task_dealloc();
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_235712508()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v1 = *(_QWORD *)(v0 + 192);
  v2 = *(_QWORD *)(v0 + 168);
  v3 = *(_QWORD *)(v0 + 176);
  swift_release();
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v1, v2);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_2357125CC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _QWORD *v3;
  uint64_t v4;

  v3[2] = a2;
  v3[3] = a3;
  sub_2357149A0();
  v3[4] = sub_235714994();
  v3[5] = sub_235714988();
  v3[6] = v4;
  return swift_task_switch();
}

uint64_t sub_235712638()
{
  _QWORD *v0;
  uint64_t v1;
  _QWORD *v2;
  _QWORD *v3;
  uint64_t (*v5)(_QWORD);

  v1 = v0[2];
  v2 = (_QWORD *)(v1 + *(int *)(type metadata accessor for TranslationTaskModifier() + 20));
  v5 = (uint64_t (*)(_QWORD))(*(int *)*v2 + *v2);
  v3 = (_QWORD *)swift_task_alloc();
  v0[7] = v3;
  *v3 = v0;
  v3[1] = sub_2357126A8;
  return v5(v0[3]);
}

uint64_t sub_2357126A8()
{
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_2357126F4()
{
  uint64_t v0;

  swift_release();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_235712728()
{
  uint64_t v0;
  NSObject *v1;
  os_log_type_t v2;
  uint8_t *v3;
  uint64_t result;
  void *v5;

  if (qword_256264858 != -1)
    swift_once();
  v0 = sub_235714754();
  __swift_project_value_buffer(v0, (uint64_t)qword_256265110);
  v1 = sub_23571473C();
  v2 = sub_2357149C4();
  if (os_log_type_enabled(v1, v2))
  {
    v3 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_23570B000, v1, v2, "Received cancel while performing client 'action', asking session to cancel pending work", v3, 2u);
    MEMORY[0x23B7D49DC](v3, -1, -1);
  }

  type metadata accessor for TranslationTaskModifier();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256264CF8);
  result = sub_23571491C();
  if (v5)
  {
    swift_getKeyPath();
    sub_23570E984((unint64_t *)&qword_256264A68, (uint64_t (*)(uint64_t))type metadata accessor for TranslationSessionViewModel, (uint64_t)&unk_235715150);
    sub_2357146A0();
    swift_release();
    swift_retain();

    sub_235714700();
    return swift_release();
  }
  return result;
}

uint64_t sub_2357128AC(uint64_t a1)
{
  void **v1;
  uint64_t result;
  uint64_t v3;
  NSObject *v4;
  os_log_type_t v5;
  uint8_t *v6;
  void *v7;
  id v8;
  void *v9;

  v1 = (void **)(a1 + *(int *)(type metadata accessor for TranslationTaskModifier() + 28));
  __swift_instantiateConcreteTypeFromMangledName(&qword_256264CF8);
  result = sub_23571491C();
  if (v9)
  {
    swift_getKeyPath();
    sub_23570E984((unint64_t *)&qword_256264A68, (uint64_t (*)(uint64_t))type metadata accessor for TranslationSessionViewModel, (uint64_t)&unk_235715150);
    sub_2357146A0();
    swift_release();
    swift_retain();

    if (qword_256264858 != -1)
      swift_once();
    v3 = sub_235714754();
    __swift_project_value_buffer(v3, (uint64_t)qword_256265110);
    v4 = sub_23571473C();
    v5 = sub_2357149D0();
    if (os_log_type_enabled(v4, v5))
    {
      v6 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v6 = 0;
      MEMORY[0x23B7D49DC](v6, -1, -1);
    }

    sub_235714700();
    v7 = *v1;
    swift_retain();
    v8 = v7;
    sub_235714928();
    swift_release();

    return swift_release();
  }
  return result;
}

uint64_t sub_235712A7C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
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
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  char *v18;
  void *v19;
  id v20;
  unint64_t v21;
  uint64_t v22;
  id v23;
  unint64_t v24;
  char *v25;
  unsigned __int8 v26;
  char v27;
  char v28;
  char v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  char *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  char *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  __int128 v46;
  uint64_t v47;
  char *v48;

  v4 = type metadata accessor for TranslationTaskModifier();
  v5 = *(_QWORD *)(v4 - 8);
  v6 = *(_QWORD *)(v5 + 64);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v38 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_256264CE0);
  v39 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v10 = (char *)&v38 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_256264CF0);
  v42 = *(_QWORD *)(v11 - 8);
  v43 = v11;
  MEMORY[0x24BDAC7A8](v11);
  v41 = (char *)&v38 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_256264CD8);
  v44 = *(_QWORD *)(v13 - 8);
  v45 = v13;
  v14 = MEMORY[0x24BDAC7A8](v13);
  v16 = (char *)&v38 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v14);
  v40 = (uint64_t)&v38 - v17;
  v46 = *(_OWORD *)(a1 + *(int *)(v4 + 28));
  __swift_instantiateConcreteTypeFromMangledName(&qword_256264CF8);
  sub_23571491C();
  v18 = v48;
  if (!v48)
  {
    v36 = 1;
LABEL_10:
    v30 = v45;
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v44 + 56))(a2, v36, 1, v30);
  }
  v38 = a2;
  swift_getKeyPath();
  *(_QWORD *)&v46 = v18;
  sub_23570E984((unint64_t *)&qword_256264A68, (uint64_t (*)(uint64_t))type metadata accessor for TranslationSessionViewModel, (uint64_t)&unk_235715150);
  sub_2357146A0();
  swift_release();
  v19 = *(void **)&v18[OBJC_IVAR____TtC20_Translation_SwiftUI27TranslationSessionViewModel__preflightConfiguration];
  v20 = v19;

  if (!v19)
  {
    v36 = 1;
    a2 = v38;
    goto LABEL_10;
  }
  sub_235713554(a1, (uint64_t)&v38 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0));
  v21 = (*(unsigned __int8 *)(v5 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  v22 = swift_allocObject();
  sub_23571359C((uint64_t)v7, v22 + v21);
  *(_QWORD *)&v46 = v20;
  *((_QWORD *)&v46 + 1) = sub_235713D2C;
  v47 = v22;
  v23 = v20;
  sub_235712F4C();
  v24 = sub_235713B64();
  sub_2357148D4();
  swift_release();

  swift_bridgeObjectRelease();
  *(_QWORD *)&v46 = &type metadata for DownloadsHostingView;
  *((_QWORD *)&v46 + 1) = v24;
  swift_getOpaqueTypeConformance2();
  v25 = v41;
  sub_2357148E0();
  (*(void (**)(char *, uint64_t))(v39 + 8))(v10, v8);
  v26 = sub_235714898();
  v27 = sub_23571488C();
  v28 = sub_2357148A4();
  sub_2357148A4();
  if (sub_2357148A4() != v26)
    v28 = sub_2357148A4();
  sub_2357148A4();
  v29 = sub_2357148A4();
  a2 = v38;
  v30 = v45;
  if (v29 != v27)
    v28 = sub_2357148A4();
  v31 = sub_235714790();

  v33 = v42;
  v32 = v43;
  (*(void (**)(char *, char *, uint64_t))(v42 + 16))(v16, v25, v43);
  v34 = &v16[*(int *)(v30 + 36)];
  *(_QWORD *)v34 = v31;
  v34[8] = v28;
  (*(void (**)(char *, uint64_t))(v33 + 8))(v25, v32);
  v35 = v40;
  sub_2357143EC((uint64_t)v16, v40, &qword_256264CD8);
  sub_2357143EC(v35, a2, &qword_256264CD8);
  v36 = 0;
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v44 + 56))(a2, v36, 1, v30);
}

void sub_235712E70(void *a1, void *a2)
{
  id v3;
  void *v5;

  if (a2)
  {
    type metadata accessor for TranslationTaskModifier();
    v3 = a2;
    __swift_instantiateConcreteTypeFromMangledName(&qword_256264CF8);
    sub_23571491C();
    if (v5)
    {
      v3 = v3;
      sub_23570EDA0(0, a2);

    }
  }
  else
  {
    type metadata accessor for TranslationTaskModifier();
    __swift_instantiateConcreteTypeFromMangledName(&qword_256264CF8);
    sub_23571491C();
    v3 = v5;
    if (!v5)
      return;
    sub_23570EDA0(a1, 0);
  }

}

uint64_t sub_235712F4C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
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
  char *v15;
  uint64_t v16;
  unsigned int (*v17)(uint64_t, uint64_t, uint64_t);
  char v18;
  void (*v19)(char *, uint64_t);
  uint64_t v20;
  uint64_t v21;
  uint64_t v23;

  v0 = sub_2357147FC();
  v1 = *(_QWORD *)(v0 - 8);
  MEMORY[0x24BDAC7A8](v0);
  v3 = (char *)&v23 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_256264D00);
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)&v23 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_256264BA0);
  v8 = MEMORY[0x24BDAC7A8](v7);
  v10 = (char *)&v23 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = MEMORY[0x24BDAC7A8](v8);
  v13 = (char *)&v23 - v12;
  MEMORY[0x24BDAC7A8](v11);
  v15 = (char *)&v23 - v14;
  type metadata accessor for TranslationTaskModifier();
  sub_235713D78((uint64_t)v15);
  (*(void (**)(char *, _QWORD, uint64_t))(v1 + 104))(v13, *MEMORY[0x24BDEFEE8], v0);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v1 + 56))(v13, 0, 1, v0);
  v16 = (uint64_t)&v6[*(int *)(v4 + 48)];
  sub_23571002C((uint64_t)v15, (uint64_t)v6, &qword_256264BA0);
  sub_23571002C((uint64_t)v13, v16, &qword_256264BA0);
  v17 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v1 + 48);
  if (v17((uint64_t)v6, 1, v0) != 1)
  {
    sub_23571002C((uint64_t)v6, (uint64_t)v10, &qword_256264BA0);
    if (v17(v16, 1, v0) != 1)
    {
      (*(void (**)(char *, uint64_t, uint64_t))(v1 + 32))(v3, v16, v0);
      sub_23570E984(&qword_256264D08, (uint64_t (*)(uint64_t))MEMORY[0x24BDEFEF8], MEMORY[0x24BDEFF08]);
      v18 = sub_235714958();
      v19 = *(void (**)(char *, uint64_t))(v1 + 8);
      v19(v3, v0);
      sub_23571456C((uint64_t)v13, &qword_256264BA0);
      sub_23571456C((uint64_t)v15, &qword_256264BA0);
      v19(v10, v0);
      sub_23571456C((uint64_t)v6, &qword_256264BA0);
      if ((v18 & 1) != 0)
        goto LABEL_8;
      return MEMORY[0x24BEE4B08];
    }
    sub_23571456C((uint64_t)v13, &qword_256264BA0);
    sub_23571456C((uint64_t)v15, &qword_256264BA0);
    (*(void (**)(char *, uint64_t))(v1 + 8))(v10, v0);
LABEL_6:
    sub_23571456C((uint64_t)v6, &qword_256264D00);
    return MEMORY[0x24BEE4B08];
  }
  sub_23571456C((uint64_t)v13, &qword_256264BA0);
  sub_23571456C((uint64_t)v15, &qword_256264BA0);
  if (v17(v16, 1, v0) != 1)
    goto LABEL_6;
  sub_23571456C((uint64_t)v6, &qword_256264BA0);
LABEL_8:
  __swift_instantiateConcreteTypeFromMangledName(&qword_256264988);
  sub_2357147F0();
  v20 = swift_allocObject();
  *(_OWORD *)(v20 + 16) = xmmword_235714FE0;
  sub_2357147E4();
  sub_2357147D8();
  v21 = sub_23570E6DC(v20);
  swift_setDeallocating();
  swift_arrayDestroy();
  swift_deallocClassInstance();
  return v21;
}

void sub_2357132FC(BOOL *a1@<X8>)
{
  uint64_t v2;
  BOOL v3;
  char *v4;

  type metadata accessor for TranslationTaskModifier();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256264CF8);
  sub_23571491C();
  if (!v4)
    goto LABEL_5;
  swift_getKeyPath();
  sub_23570E984((unint64_t *)&qword_256264A68, (uint64_t (*)(uint64_t))type metadata accessor for TranslationSessionViewModel, (uint64_t)&unk_235715150);
  sub_2357146A0();
  swift_release();
  if (!*(_QWORD *)&v4[OBJC_IVAR____TtC20_Translation_SwiftUI27TranslationSessionViewModel__preflightCompletion])
  {

LABEL_5:
    v3 = 0;
    goto LABEL_6;
  }
  swift_getKeyPath();
  sub_2357146A0();
  swift_release();
  v2 = *(_QWORD *)&v4[OBJC_IVAR____TtC20_Translation_SwiftUI27TranslationSessionViewModel__preflightConfiguration];

  v3 = v2 != 0;
LABEL_6:
  *a1 = v3;
}

void sub_235713424(_BYTE *a1)
{
  uint64_t v1;
  os_log_type_t v2;
  uint8_t *v3;
  NSObject *oslog;
  void *v5;

  if ((*a1 & 1) != 0)
  {
    if (qword_256264850 != -1)
      swift_once();
    v1 = sub_235714754();
    __swift_project_value_buffer(v1, (uint64_t)qword_2562650F8);
    oslog = sub_23571473C();
    v2 = sub_2357149DC();
    if (os_log_type_enabled(oslog, v2))
    {
      v3 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v3 = 0;
      _os_log_impl(&dword_23570B000, oslog, v2, "Attempted to force present API UI via Binding which isn't supported, not doing anything", v3, 2u);
      MEMORY[0x23B7D49DC](v3, -1, -1);
    }

  }
  else
  {
    type metadata accessor for TranslationTaskModifier();
    __swift_instantiateConcreteTypeFromMangledName(&qword_256264CF8);
    sub_23571491C();
    if (v5)
    {
      sub_23570EDA0(0, 0);

    }
  }
}

uint64_t sub_235713554(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for TranslationTaskModifier();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_23571359C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for TranslationTaskModifier();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_2357135E0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;

  v2 = *(unsigned __int8 *)(*(_QWORD *)(type metadata accessor for TranslationTaskModifier() - 8) + 80);
  v3 = v0 + ((v2 + 16) & ~v2);
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v4;
  *v4 = v1;
  v4[1] = sub_235713644;
  return sub_235711B70(v3);
}

uint64_t sub_235713644()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_235713690()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(unsigned __int8 *)(*(_QWORD *)(type metadata accessor for TranslationTaskModifier() - 8) + 80);
  return sub_2357128AC(v0 + ((v1 + 16) & ~v1));
}

void sub_2357136C0(BOOL *a1@<X8>)
{
  type metadata accessor for TranslationTaskModifier();
  sub_2357132FC(a1);
}

uint64_t objectdestroy_6Tm()
{
  uint64_t v0;
  int *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unsigned int (*v7)(uint64_t, uint64_t, uint64_t);
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v1 = (int *)type metadata accessor for TranslationTaskModifier();
  v2 = *(unsigned __int8 *)(*((_QWORD *)v1 - 1) + 80);
  v3 = (v2 + 32) & ~v2;
  swift_unknownObjectRelease();
  v4 = v0 + v3;
  v5 = sub_2357146E8();
  v6 = *(_QWORD *)(v5 - 8);
  v7 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v6 + 48);
  if (!v7(v0 + v3, 1, v5))
    (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v0 + v3, v5);
  swift_release();
  v8 = v4 + v1[6];
  if (!v7(v8, 1, v5))
    (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v8, v5);
  __swift_instantiateConcreteTypeFromMangledName(&qword_256264BA8);
  swift_release();

  swift_release();
  v9 = v4 + v1[8];
  __swift_instantiateConcreteTypeFromMangledName(&qword_256264B88);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v10 = sub_2357147FC();
    v11 = *(_QWORD *)(v10 - 8);
    if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v11 + 48))(v9, 1, v10))
      (*(void (**)(uint64_t, uint64_t))(v11 + 8))(v9, v10);
  }
  else
  {
    swift_release();
  }
  return swift_deallocObject();
}

void sub_235713884(_BYTE *a1)
{
  type metadata accessor for TranslationTaskModifier();
  sub_235713424(a1);
}

uint64_t sub_2357138C8@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;

  v3 = *(unsigned __int8 *)(*(_QWORD *)(type metadata accessor for TranslationTaskModifier() - 8) + 80);
  return sub_235712A7C(v1 + ((v3 + 16) & ~v3), a1);
}

unint64_t sub_235713904()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_256264CA8;
  if (!qword_256264CA8)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256264C78);
    v2[0] = sub_235713970();
    v2[1] = MEMORY[0x24BDF0910];
    result = MEMORY[0x23B7D497C](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_256264CA8);
  }
  return result;
}

unint64_t sub_235713970()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_256264CB0;
  if (!qword_256264CB0)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256264C70);
    v2[0] = sub_235713A0C(&qword_256264CB8, &qword_256264C98, MEMORY[0x24BDEFB78]);
    v2[1] = sub_235713A0C(&qword_256264CC0, &qword_256264C90, MEMORY[0x24BDEECB8]);
    result = MEMORY[0x23B7D497C](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_256264CB0);
  }
  return result;
}

uint64_t sub_235713A0C(unint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    result = MEMORY[0x23B7D497C](a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_235713A4C()
{
  unint64_t result;
  uint64_t v1;
  unint64_t v2;

  result = qword_256264CC8;
  if (!qword_256264CC8)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256264CA0);
    v2 = sub_235713AB0();
    result = MEMORY[0x23B7D497C](MEMORY[0x24BDF5578], v1, &v2);
    atomic_store(result, (unint64_t *)&qword_256264CC8);
  }
  return result;
}

unint64_t sub_235713AB0()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;
  _QWORD v3[4];

  result = qword_256264CD0;
  if (!qword_256264CD0)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256264CD8);
    v2 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256264CE0);
    sub_235713B64();
    v3[2] = v2;
    v3[3] = swift_getOpaqueTypeConformance2();
    v3[0] = swift_getOpaqueTypeConformance2();
    v3[1] = MEMORY[0x24BDF1050];
    result = MEMORY[0x23B7D497C](MEMORY[0x24BDED308], v1, v3);
    atomic_store(result, (unint64_t *)&qword_256264CD0);
  }
  return result;
}

unint64_t sub_235713B64()
{
  unint64_t result;

  result = qword_256264CE8;
  if (!qword_256264CE8)
  {
    result = MEMORY[0x23B7D497C](&unk_235714E48, &type metadata for DownloadsHostingView);
    atomic_store(result, (unint64_t *)&qword_256264CE8);
  }
  return result;
}

uint64_t objectdestroyTm()
{
  uint64_t v0;
  int *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unsigned int (*v7)(uint64_t, uint64_t, uint64_t);
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v1 = (int *)type metadata accessor for TranslationTaskModifier();
  v2 = *(unsigned __int8 *)(*((_QWORD *)v1 - 1) + 80);
  v3 = (v2 + 16) & ~v2;
  v4 = v0 + v3;
  v5 = sub_2357146E8();
  v6 = *(_QWORD *)(v5 - 8);
  v7 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v6 + 48);
  if (!v7(v0 + v3, 1, v5))
    (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v0 + v3, v5);
  swift_release();
  v8 = v4 + v1[6];
  if (!v7(v8, 1, v5))
    (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v8, v5);
  __swift_instantiateConcreteTypeFromMangledName(&qword_256264BA8);
  swift_release();

  swift_release();
  v9 = v4 + v1[8];
  __swift_instantiateConcreteTypeFromMangledName(&qword_256264B88);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v10 = sub_2357147FC();
    v11 = *(_QWORD *)(v10 - 8);
    if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v11 + 48))(v9, 1, v10))
      (*(void (**)(uint64_t, uint64_t))(v11 + 8))(v9, v10);
  }
  else
  {
    swift_release();
  }
  return swift_deallocObject();
}

void sub_235713D2C(void *a1, void *a2)
{
  type metadata accessor for TranslationTaskModifier();
  sub_235712E70(a1, a2);
}

uint64_t sub_235713D78@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  os_log_type_t v12;
  NSObject *v13;
  os_log_type_t v14;
  uint8_t *v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD v18[3];
  uint64_t v19;

  v2 = v1;
  v4 = sub_2357147CC();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)v18 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_256264B88);
  MEMORY[0x24BDAC7A8](v8);
  v10 = (char *)v18 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23571002C(v2, (uint64_t)v10, &qword_256264B88);
  if (swift_getEnumCaseMultiPayload() == 1)
    return sub_2357143EC((uint64_t)v10, a1, &qword_256264BA0);
  v12 = sub_2357149E8();
  v13 = sub_235714880();
  v14 = v12;
  if (os_log_type_enabled(v13, v12))
  {
    v15 = (uint8_t *)swift_slowAlloc();
    v16 = swift_slowAlloc();
    v18[1] = a1;
    v17 = v16;
    v19 = v16;
    *(_DWORD *)v15 = 136315138;
    v18[2] = sub_235713FA8(0xD000000000000020, 0x80000002357162C0, &v19);
    sub_235714A0C();
    _os_log_impl(&dword_23570B000, v13, v14, "Accessing Environment<%s>'s value outside of being installed on a View. This will always read the default value and will not update.", v15, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x23B7D49DC](v17, -1, -1);
    MEMORY[0x23B7D49DC](v15, -1, -1);
  }

  sub_2357147C0();
  swift_getAtKeyPath();
  swift_release();
  return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

unint64_t sub_235713FA8(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v12[3];
  uint64_t ObjectType;

  v6 = sub_235714078(v12, 0, 0, 1, a1, a2);
  v7 = v12[0];
  if (v6)
  {
    v8 = v6;
    ObjectType = swift_getObjectType();
    v12[0] = v8;
    v9 = *a3;
    if (*a3)
    {
      sub_235714450((uint64_t)v12, *a3);
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
      sub_235714450((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v12);
  return v7;
}

unint64_t sub_235714078(unint64_t *a1, void *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
    result = sub_235714174(a5, a6);
    *a1 = v11;
    return result;
  }
  if ((a5 & 0x1000000000000000) != 0)
  {
    result = (a6 & 0xFFFFFFFFFFFFFFFLL) + 32;
  }
  else
  {
    result = sub_235714A30();
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

uint64_t sub_235714174(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v2 = sub_235714208(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v2 = (uint64_t)sub_235714304(0, *(_QWORD *)(v2 + 16) + 1, 1, (char *)v2);
  v4 = *(_QWORD *)(v2 + 16);
  v3 = *(_QWORD *)(v2 + 24);
  if (v4 >= v3 >> 1)
    v2 = (uint64_t)sub_235714304((char *)(v3 > 1), v4 + 1, 1, (char *)v2);
  *(_QWORD *)(v2 + 16) = v4 + 1;
  *(_BYTE *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_235714208(uint64_t a1, unint64_t a2)
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
      v3 = sub_2357142A0(v2, 0);
      result = sub_235714A24();
      if ((v5 & 1) != 0)
        break;
      if (result == v2)
        return (uint64_t)v3;
      __break(1u);
LABEL_9:
      v2 = sub_23571497C();
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

_QWORD *sub_2357142A0(uint64_t a1, uint64_t a2)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_256264D10);
  v4 = (_QWORD *)swift_allocObject();
  v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

char *sub_235714304(char *result, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_256264D10);
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

uint64_t sub_2357143EC(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 32))(a2, a1, v5);
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

uint64_t sub_235714450(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

void sub_235714490()
{
  uint64_t v0;

  sub_23570EB68(*(_QWORD *)(v0 + 16), *(void **)(v0 + 24));
}

uint64_t sub_2357144B0()
{
  uint64_t *v0;

  return sub_23570EC2C(v0[2], v0[3], v0[4]);
}

uint64_t sub_2357144CC()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_2357144F0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t (*v3)(uint64_t *, uint64_t *);
  uint64_t v5;
  uint64_t v6;

  v3 = *(uint64_t (**)(uint64_t *, uint64_t *))(v2 + 16);
  v5 = a2;
  v6 = a1;
  return v3(&v6, &v5);
}

uint64_t sub_235714524(_QWORD *a1, _QWORD *a2)
{
  uint64_t v2;

  return (*(uint64_t (**)(_QWORD, _QWORD))(v2 + 16))(*a1, *a2);
}

uint64_t sub_235714554()
{
  uint64_t v0;

  return sub_23570EAAC(*(_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 24));
}

uint64_t sub_23571456C(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_2357145A8(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;

  v5 = *(_QWORD *)(v1 + 16);
  v4 = *(_QWORD *)(v1 + 24);
  v6 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v6;
  *v6 = v2;
  v6[1] = sub_235713644;
  return sub_2357125CC(a1, v5, v4);
}

uint64_t sub_23571460C()
{
  return sub_235712728();
}

uint64_t sub_235714614()
{
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256264C78);
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256264CA0);
  sub_235713904();
  sub_235713A4C();
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_235714688()
{
  return MEMORY[0x24BDCD2F0]();
}

uint64_t sub_235714694()
{
  return MEMORY[0x24BEE5C38]();
}

uint64_t sub_2357146A0()
{
  return MEMORY[0x24BEE5C40]();
}

uint64_t sub_2357146AC()
{
  return MEMORY[0x24BEE5C58]();
}

uint64_t sub_2357146B8()
{
  return MEMORY[0x24BEE5C60]();
}

uint64_t sub_2357146C4()
{
  return MEMORY[0x24BDF6360]();
}

uint64_t sub_2357146D0()
{
  return MEMORY[0x24BDF6368]();
}

uint64_t sub_2357146DC()
{
  return MEMORY[0x24BDF6370]();
}

uint64_t sub_2357146E8()
{
  return MEMORY[0x24BDF6378]();
}

uint64_t sub_2357146F4()
{
  return MEMORY[0x24BDF6390]();
}

uint64_t sub_235714700()
{
  return MEMORY[0x24BDF6398]();
}

uint64_t sub_23571470C()
{
  return MEMORY[0x24BDF63A0]();
}

uint64_t sub_235714718()
{
  return MEMORY[0x24BEBA7C0]();
}

uint64_t sub_235714724()
{
  return MEMORY[0x24BEBA7D0]();
}

uint64_t sub_235714730()
{
  return MEMORY[0x24BEE76F0]();
}

uint64_t sub_23571473C()
{
  return MEMORY[0x24BEE78A8]();
}

uint64_t sub_235714748()
{
  return MEMORY[0x24BEE78C0]();
}

uint64_t sub_235714754()
{
  return MEMORY[0x24BEE78D8]();
}

uint64_t sub_235714760()
{
  return MEMORY[0x24BDEBDE0]();
}

uint64_t sub_23571476C()
{
  return MEMORY[0x24BDEBDF0]();
}

uint64_t sub_235714778()
{
  return MEMORY[0x24BDEBE00]();
}

uint64_t sub_235714784()
{
  return MEMORY[0x24BDED2D0]();
}

uint64_t sub_235714790()
{
  return MEMORY[0x24BDED3B0]();
}

uint64_t sub_23571479C()
{
  return MEMORY[0x24BDEDBA8]();
}

uint64_t sub_2357147A8()
{
  return MEMORY[0x24BDEE1D8]();
}

uint64_t sub_2357147B4()
{
  return MEMORY[0x24BDEE1E0]();
}

uint64_t sub_2357147C0()
{
  return MEMORY[0x24BDEE4E0]();
}

uint64_t sub_2357147CC()
{
  return MEMORY[0x24BDEE4F8]();
}

uint64_t sub_2357147D8()
{
  return MEMORY[0x24BDEEAF0]();
}

uint64_t sub_2357147E4()
{
  return MEMORY[0x24BDEEB00]();
}

uint64_t sub_2357147F0()
{
  return MEMORY[0x24BDEEB10]();
}

uint64_t sub_2357147FC()
{
  return MEMORY[0x24BDEFEF8]();
}

uint64_t sub_235714808()
{
  return MEMORY[0x24BDF02D0]();
}

uint64_t sub_235714814()
{
  return MEMORY[0x24BDF0EC0]();
}

uint64_t sub_235714820()
{
  return MEMORY[0x24BDF0ED0]();
}

uint64_t sub_23571482C()
{
  return MEMORY[0x24BDF0EE0]();
}

uint64_t sub_235714838()
{
  return MEMORY[0x24BDF0EF0]();
}

uint64_t sub_235714844()
{
  return MEMORY[0x24BDF0F00]();
}

uint64_t sub_235714850()
{
  return MEMORY[0x24BDF0F10]();
}

uint64_t sub_23571485C()
{
  return MEMORY[0x24BDF0F18]();
}

uint64_t sub_235714868()
{
  return MEMORY[0x24BDF0F28]();
}

uint64_t sub_235714874()
{
  return MEMORY[0x24BDF0F38]();
}

uint64_t sub_235714880()
{
  return MEMORY[0x24BDF1430]();
}

uint64_t sub_23571488C()
{
  return MEMORY[0x24BDF14A0]();
}

uint64_t sub_235714898()
{
  return MEMORY[0x24BDF14C8]();
}

uint64_t sub_2357148A4()
{
  return MEMORY[0x24BDF14E8]();
}

uint64_t sub_2357148B0()
{
  return MEMORY[0x24BDF2088]();
}

uint64_t sub_2357148BC()
{
  return MEMORY[0x24BDF20A0]();
}

uint64_t sub_2357148C8()
{
  return MEMORY[0x24BDF2698]();
}

uint64_t sub_2357148D4()
{
  return MEMORY[0x24BDF2E70]();
}

uint64_t sub_2357148E0()
{
  return MEMORY[0x24BDF32C8]();
}

uint64_t sub_2357148EC()
{
  return MEMORY[0x24BDF3640]();
}

uint64_t sub_2357148F8()
{
  return MEMORY[0x24BDF3800]();
}

uint64_t sub_235714904()
{
  return MEMORY[0x24BDF38C0]();
}

uint64_t sub_235714910()
{
  return MEMORY[0x24BDF4280]();
}

uint64_t sub_23571491C()
{
  return MEMORY[0x24BDF4290]();
}

uint64_t sub_235714928()
{
  return MEMORY[0x24BDF42A8]();
}

uint64_t sub_235714934()
{
  return MEMORY[0x24BDF47F8]();
}

uint64_t sub_235714940()
{
  return MEMORY[0x24BDF4F18]();
}

uint64_t sub_23571494C()
{
  return MEMORY[0x24BEE0610]();
}

uint64_t sub_235714958()
{
  return MEMORY[0x24BEE0980]();
}

uint64_t sub_235714964()
{
  return MEMORY[0x24BDCF9E0]();
}

uint64_t sub_235714970()
{
  return MEMORY[0x24BDCFA28]();
}

uint64_t sub_23571497C()
{
  return MEMORY[0x24BEE0C10]();
}

uint64_t sub_235714988()
{
  return MEMORY[0x24BEE6800]();
}

uint64_t sub_235714994()
{
  return MEMORY[0x24BEE6920]();
}

uint64_t sub_2357149A0()
{
  return MEMORY[0x24BEE6928]();
}

uint64_t sub_2357149AC()
{
  return MEMORY[0x24BEE6940]();
}

uint64_t sub_2357149B8()
{
  return MEMORY[0x24BEE6990]();
}

uint64_t sub_2357149C4()
{
  return MEMORY[0x24BEE78F0]();
}

uint64_t sub_2357149D0()
{
  return MEMORY[0x24BEE7908]();
}

uint64_t sub_2357149DC()
{
  return MEMORY[0x24BEE7910]();
}

uint64_t sub_2357149E8()
{
  return MEMORY[0x24BEE7920]();
}

uint64_t sub_2357149F4()
{
  return MEMORY[0x24BEE7928]();
}

uint64_t sub_235714A00()
{
  return MEMORY[0x24BEE1C68]();
}

uint64_t sub_235714A0C()
{
  return MEMORY[0x24BEE1F00]();
}

uint64_t sub_235714A18()
{
  return MEMORY[0x24BEE24D0]();
}

uint64_t sub_235714A24()
{
  return MEMORY[0x24BEE2518]();
}

uint64_t sub_235714A30()
{
  return MEMORY[0x24BEE2838]();
}

uint64_t sub_235714A3C()
{
  return MEMORY[0x24BEE7098]();
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

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B8](a1);
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

uint64_t swift_beginAccess()
{
  return MEMORY[0x24BEE4BB8]();
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

