ValueMetadata *type metadata accessor for RespirationRateArticleDataProvider()
{
  return &type metadata for RespirationRateArticleDataProvider;
}

unint64_t sub_231167758()
{
  return 0xD000000000000036;
}

id sub_231167780()
{
  sub_231168268(0, &qword_254150620);
  return sub_2311698C4(0xD000000000000023, 0x800000023116DB80);
}

uint64_t sub_2311677E0()
{
  uint64_t ObjCClassFromMetadata;
  id v1;
  uint64_t v2;

  type metadata accessor for HealthArticlesPluginDelegate();
  ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  v1 = objc_msgSend((id)objc_opt_self(), sel_bundleForClass_, ObjCClassFromMetadata);
  v2 = sub_23116D0C4();

  return v2;
}

uint64_t sub_2311678A4()
{
  uint64_t ObjCClassFromMetadata;
  id v1;
  uint64_t v2;

  type metadata accessor for HealthArticlesPluginDelegate();
  ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  v1 = objc_msgSend((id)objc_opt_self(), sel_bundleForClass_, ObjCClassFromMetadata);
  v2 = sub_23116D0C4();

  return v2;
}

uint64_t sub_231167968()
{
  uint64_t ObjCClassFromMetadata;
  id v1;
  uint64_t v2;

  type metadata accessor for HealthArticlesPluginDelegate();
  ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  v1 = objc_msgSend((id)objc_opt_self(), sel_bundleForClass_, ObjCClassFromMetadata);
  v2 = sub_23116D0C4();

  return v2;
}

uint64_t sub_231167A2C()
{
  unint64_t inited;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  sub_231168210();
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_23116D4C0;
  sub_231168268(0, &qword_2541506A0);
  *(_QWORD *)(inited + 32) = MEMORY[0x2348D4D60]((id)*MEMORY[0x24BDD3628]);
  sub_23116D1B4();
  if (inited >> 62)
  {
    swift_bridgeObjectRetain();
    v3 = sub_23116D268();
    swift_bridgeObjectRelease();
    if (v3)
      goto LABEL_3;
LABEL_5:
    v2 = MEMORY[0x24BEE4B08];
    goto LABEL_6;
  }
  if (!*(_QWORD *)((inited & 0xFFFFFFFFFFFFF8) + 0x10))
    goto LABEL_5;
LABEL_3:
  sub_23116BDB4(inited);
  v2 = v1;
LABEL_6:
  swift_bridgeObjectRelease();
  return v2;
}

uint64_t sub_231167B14()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;
  void (*v4)(_QWORD);
  uint64_t *v5;
  uint64_t ObjCClassFromMetadata;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t *v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  unint64_t v32;
  id v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  unint64_t v37;
  id v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  unint64_t v42;
  id v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  unint64_t v47;
  id v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  unsigned int v53;
  unsigned int v54;
  uint64_t v55;
  unint64_t v56;
  void (*v57)(unint64_t);

  sub_2311681BC();
  v0 = sub_23116D0F4();
  v1 = *(_QWORD *)(v0 - 8);
  v2 = *(_QWORD *)(v1 + 72);
  v3 = (*(unsigned __int8 *)(v1 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80);
  v55 = swift_allocObject();
  *(_OWORD *)(v55 + 16) = xmmword_23116D4D0;
  sub_231168268(0, &qword_254150620);
  v56 = v55 + v3;
  *(_QWORD *)v56 = sub_2311698C4(0xD000000000000023, 0x800000023116DB80);
  *(_BYTE *)(v56 + 8) = 0;
  v4 = *(void (**)(_QWORD))(v1 + 104);
  ((void (*)(unint64_t, _QWORD, uint64_t))v4)(v56, *MEMORY[0x24BE3F908], v0);
  v57 = v4;
  v5 = (uint64_t *)(v56 + v2);
  type metadata accessor for HealthArticlesPluginDelegate();
  ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  v7 = (void *)objc_opt_self();
  v8 = objc_msgSend(v7, sel_bundleForClass_, ObjCClassFromMetadata);
  v9 = sub_23116D0C4();
  v11 = v10;

  *v5 = v9;
  v5[1] = v11;
  ((void (*)(unint64_t, _QWORD, uint64_t))v4)(v56 + v2, *MEMORY[0x24BE3F910], v0);
  v12 = (uint64_t *)(v56 + 2 * v2);
  v13 = objc_msgSend(v7, sel_bundleForClass_, ObjCClassFromMetadata, 0xE000000000000000);
  v14 = sub_23116D0C4();
  v16 = v15;

  *v12 = v14;
  v12[1] = v16;
  v12[2] = 0;
  v54 = *MEMORY[0x24BE3F8D0];
  v4(v12);
  v17 = v56 + 3 * v2;
  v18 = objc_msgSend(v7, sel_bundleForClass_, ObjCClassFromMetadata, 0xE000000000000000);
  v19 = sub_23116D0C4();
  v21 = v20;

  *(_QWORD *)v17 = v19;
  *(_QWORD *)(v17 + 8) = v21;
  *(_BYTE *)(v17 + 16) = 0;
  v53 = *MEMORY[0x24BE3F930];
  v57(v17);
  v22 = (uint64_t *)(v56 + 4 * v2);
  v23 = objc_msgSend(v7, sel_bundleForClass_, ObjCClassFromMetadata, 0xE000000000000000);
  v24 = sub_23116D0C4();
  v26 = v25;

  *v22 = v24;
  v22[1] = v26;
  v22[2] = 0;
  ((void (*)(uint64_t *, _QWORD, uint64_t))v57)(v22, v54, v0);
  v27 = v56 + 5 * v2;
  v28 = objc_msgSend(v7, sel_bundleForClass_, ObjCClassFromMetadata, 0xE000000000000000);
  v29 = sub_23116D0C4();
  v31 = v30;

  *(_QWORD *)v27 = v29;
  *(_QWORD *)(v27 + 8) = v31;
  *(_BYTE *)(v27 + 16) = 0;
  ((void (*)(unint64_t, _QWORD, uint64_t))v57)(v27, v53, v0);
  v32 = v56 + 6 * v2;
  v33 = objc_msgSend(v7, sel_bundleForClass_, ObjCClassFromMetadata, 0xE000000000000000);
  v34 = sub_23116D0C4();
  v36 = v35;

  *(_QWORD *)v32 = v34;
  *(_QWORD *)(v32 + 8) = v36;
  *(_BYTE *)(v32 + 16) = 0;
  ((void (*)(unint64_t, _QWORD, uint64_t))v57)(v32, v53, v0);
  v37 = v56 + 7 * v2;
  v38 = objc_msgSend(v7, sel_bundleForClass_, ObjCClassFromMetadata, 0xE000000000000000);
  v39 = sub_23116D0C4();
  v41 = v40;

  *(_QWORD *)v37 = v39;
  *(_QWORD *)(v37 + 8) = v41;
  *(_BYTE *)(v37 + 16) = 0;
  ((void (*)(unint64_t, _QWORD, uint64_t))v57)(v37, v53, v0);
  v42 = v56 + 8 * v2;
  v43 = objc_msgSend(v7, sel_bundleForClass_, ObjCClassFromMetadata, 0xE000000000000000);
  v44 = sub_23116D0C4();
  v46 = v45;

  *(_QWORD *)v42 = v44;
  *(_QWORD *)(v42 + 8) = v46;
  *(_BYTE *)(v42 + 16) = 0;
  ((void (*)(unint64_t, _QWORD, uint64_t))v57)(v42, v53, v0);
  v47 = v56 + 9 * v2;
  v48 = objc_msgSend(v7, sel_bundleForClass_, ObjCClassFromMetadata, 0xE000000000000000);
  v49 = sub_23116D0C4();
  v51 = v50;

  *(_QWORD *)v47 = v49;
  *(_QWORD *)(v47 + 8) = v51;
  *(_BYTE *)(v47 + 16) = 0;
  ((void (*)(unint64_t, _QWORD, uint64_t))v57)(v47, v53, v0);
  return v55;
}

void sub_2311681BC()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_255EB5D60)
  {
    sub_23116D0F4();
    v0 = sub_23116D28C();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_255EB5D60);
  }
}

void sub_231168210()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_254150698)
  {
    v0 = sub_23116D28C();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_254150698);
  }
}

uint64_t sub_231168268(uint64_t a1, unint64_t *a2)
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

uint64_t sub_2311682A0(uint64_t a1)
{
  uint64_t *v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  NSObject *v11;
  os_log_type_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  unint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  char *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;

  v3 = *v1;
  v4 = sub_23116D0E8();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8]();
  v7 = (char *)&v27 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_23116D16C();
  v34 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8]();
  v10 = (char *)&v27 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23116D154();
  swift_retain_n();
  v11 = sub_23116D160();
  v12 = sub_23116D1D8();
  if (os_log_type_enabled(v11, v12))
  {
    v13 = swift_slowAlloc();
    v30 = v5;
    v14 = v13;
    v29 = swift_slowAlloc();
    v35 = v29;
    v36 = v3;
    *(_DWORD *)v14 = 136446466;
    v33 = v7;
    swift_getMetatypeMetadata();
    v32 = a1;
    v15 = sub_23116D184();
    v36 = sub_2311688E8(v15, v16, &v35);
    v31 = v4;
    sub_23116D208();
    swift_bridgeObjectRelease();
    *(_WORD *)(v14 + 12) = 2082;
    sub_23116927C();
    v18 = v17;
    v19 = sub_231169540();
    v20 = MEMORY[0x2348D4D24](v18, v19);
    v28 = v8;
    v21 = v20;
    v23 = v22;
    v7 = v33;
    swift_bridgeObjectRelease();
    v36 = sub_2311688E8(v21, v23, &v35);
    v4 = v31;
    sub_23116D208();
    swift_release_n();
    a1 = v32;
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_231165000, v11, v12, "[%{public}s] Creating ArticlesGeneratorPipeline with managed articles: %%%{public}s@", (uint8_t *)v14, 0x16u);
    v24 = v29;
    swift_arrayDestroy();
    MEMORY[0x2348D5018](v24, -1, -1);
    v25 = v14;
    v5 = v30;
    MEMORY[0x2348D5018](v25, -1, -1);

    (*(void (**)(char *, uint64_t))(v34 + 8))(v10, v28);
  }
  else
  {

    swift_release_n();
    (*(void (**)(char *, uint64_t))(v34 + 8))(v10, v8);
  }
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, a1, v4);
  sub_23116927C();
  sub_2311686DC();
  swift_allocObject();
  return sub_23116D13C();
}

uint64_t sub_231168584()
{
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for HealthArticlesPluginDelegate()
{
  return objc_opt_self();
}

uint64_t sub_2311685B4@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  type metadata accessor for HealthArticlesPluginDelegate();
  result = swift_allocObject();
  *a1 = result;
  return result;
}

uint64_t sub_2311685E4(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v2 = (void *)sub_23116D0DC();
  if (v2)
  {

    return MEMORY[0x24BEE4AF8];
  }
  else
  {
    sub_231169834(0, &qword_254150688, (void (*)(uint64_t))sub_231168688);
    v3 = swift_allocObject();
    *(_OWORD *)(v3 + 16) = xmmword_23116D5C0;
    v4 = sub_2311682A0(a1);
    sub_2311686DC();
    *(_QWORD *)(v3 + 56) = v5;
    *(_QWORD *)(v3 + 64) = sub_231168778();
    *(_QWORD *)(v3 + 32) = v4;
  }
  return v3;
}

unint64_t sub_231168688()
{
  unint64_t result;

  result = qword_254150648;
  if (!qword_254150648)
  {
    result = swift_getExistentialTypeMetadata();
    atomic_store(result, (unint64_t *)&qword_254150648);
  }
  return result;
}

void sub_2311686DC()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_254150660)
  {
    sub_231168734();
    v0 = sub_23116D148();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_254150660);
  }
}

unint64_t sub_231168734()
{
  unint64_t result;

  result = qword_254150630;
  if (!qword_254150630)
  {
    result = MEMORY[0x2348D4FB8](&unk_23116D7B4, &type metadata for HealthArticlesTileDataController);
    atomic_store(result, (unint64_t *)&qword_254150630);
  }
  return result;
}

unint64_t sub_231168778()
{
  unint64_t result;
  uint64_t v1;

  result = qword_254150658;
  if (!qword_254150658)
  {
    sub_2311686DC();
    result = MEMORY[0x2348D4FB8](MEMORY[0x24BE3F870], v1);
    atomic_store(result, (unint64_t *)&qword_254150658);
  }
  return result;
}

void sub_2311687C0(char a1)
{
  __asm { BR              X11 }
}

uint64_t sub_23116880C(uint64_t a1, unsigned __int8 a2, uint64_t a3)
{
  return ((uint64_t (*)(uint64_t))((char *)sub_231168860 + 4 * byte_23116D5D4[a2]))(a3 + 8);
}

uint64_t sub_231168860(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  char v4;

  if (a1 == a3 + 8 && v3 == 0x800000023116DAC0)
    v4 = 1;
  else
    v4 = sub_23116D298();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v4 & 1;
}

uint64_t sub_2311688E8(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12[3];
  uint64_t ObjectType;

  v6 = sub_2311689B8(v12, 0, 0, 1, a1, a2);
  v7 = v12[0];
  if (v6)
  {
    v8 = v6;
    ObjectType = swift_getObjectType();
    v12[0] = v8;
    v9 = *a3;
    if (*a3)
    {
      sub_2311695BC((uint64_t)v12, *a3);
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
      sub_2311695BC((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  sub_23116959C((uint64_t)v12);
  return v7;
}

uint64_t sub_2311689B8(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_23116D214();
            result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    result = sub_231168B70(a5, a6);
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
  v8 = sub_23116D250();
  if (!v8)
  {
    sub_23116D25C();
    __break(1u);
LABEL_17:
    result = sub_23116D274();
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

uint64_t sub_231168B70(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v2 = sub_231168C04(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v2 = sub_231168DE8(0, *(_QWORD *)(v2 + 16) + 1, 1, (char *)v2);
  v4 = *(_QWORD *)(v2 + 16);
  v3 = *(_QWORD *)(v2 + 24);
  if (v4 >= v3 >> 1)
    v2 = sub_231168DE8(v3 > 1, v4 + 1, 1, (char *)v2);
  *(_QWORD *)(v2 + 16) = v4 + 1;
  *(_BYTE *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_231168C04(uint64_t a1, unint64_t a2)
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
      v3 = sub_231168D78(v2, 0);
      if (v2 < 0)
        break;
      v4 = v3;
      v5 = sub_23116D238();
      if ((v6 & 1) != 0)
        goto LABEL_14;
      if (v5 == v2)
        return (uint64_t)v4;
      sub_23116D25C();
      __break(1u);
LABEL_10:
      v2 = sub_23116D19C();
      if (!v2)
        return MEMORY[0x24BEE4AF8];
    }
    sub_23116D274();
    __break(1u);
LABEL_14:
    result = sub_23116D25C();
    __break(1u);
  }
  else
  {
    return MEMORY[0x24BEE4AF8];
  }
  return result;
}

_QWORD *sub_231168D78(uint64_t a1, uint64_t a2)
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
  sub_231169880(0, &qword_255EB5D68);
  v4 = (_QWORD *)swift_allocObject();
  v5 = j__malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_231168DE8(char a1, int64_t a2, char a3, char *a4)
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
    sub_231169880(0, &qword_255EB5D68);
    v10 = (char *)swift_allocObject();
    v11 = j__malloc_size(v10);
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
  result = sub_23116D274();
  __break(1u);
  return result;
}

uint64_t sub_231168F40(char a1, int64_t a2, char a3)
{
  uint64_t *v3;
  uint64_t result;

  result = sub_231168F78(a1, a2, a3, (_QWORD *)*v3);
  *v3 = result;
  return result;
}

uint64_t sub_231168F5C(char a1, int64_t a2, char a3)
{
  char **v3;
  uint64_t result;

  result = sub_231169124(a1, a2, a3, *v3);
  *v3 = (char *)result;
  return result;
}

uint64_t sub_231168F78(char a1, int64_t a2, char a3, _QWORD *a4)
{
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  size_t v11;
  unint64_t v12;
  unint64_t v13;
  uint64_t result;

  if ((a3 & 1) != 0)
  {
    v6 = a4[3];
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
  v8 = a4[2];
  if (v7 <= v8)
    v9 = a4[2];
  else
    v9 = v7;
  if (v9)
  {
    sub_231169834(0, &qword_254150690, (void (*)(uint64_t))sub_231169540);
    v10 = (_QWORD *)swift_allocObject();
    v11 = j__malloc_size(v10);
    v10[2] = v8;
    v10[3] = 2 * ((uint64_t)(v11 - 32) / 48);
  }
  else
  {
    v10 = (_QWORD *)MEMORY[0x24BEE4AF8];
  }
  v12 = (unint64_t)(v10 + 4);
  v13 = (unint64_t)(a4 + 4);
  if ((a1 & 1) != 0)
  {
    if (v10 != a4 || v12 >= v13 + 48 * v8)
      memmove(v10 + 4, a4 + 4, 48 * v8);
    a4[2] = 0;
    goto LABEL_28;
  }
  if (v13 >= v12 + 48 * v8 || v12 >= v13 + 48 * v8)
  {
    sub_231169540();
    swift_arrayInitWithCopy();
LABEL_28:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_30:
  result = sub_23116D274();
  __break(1u);
  return result;
}

uint64_t sub_231169124(char a1, int64_t a2, char a3, char *a4)
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
    sub_231169880(0, &qword_254150680);
    v10 = (char *)swift_allocObject();
    v11 = j__malloc_size(v10);
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
    swift_release();
    return (uint64_t)v10;
  }
LABEL_30:
  result = sub_23116D274();
  __break(1u);
  return result;
}

void sub_23116927C()
{
  __asm { BR              X8; loc_231169300 }
}

unint64_t sub_231169540()
{
  unint64_t result;

  result = qword_254150650;
  if (!qword_254150650)
  {
    result = swift_getExistentialTypeMetadata();
    atomic_store(result, (unint64_t *)&qword_254150650);
  }
  return result;
}

uint64_t sub_23116959C(uint64_t a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(*(_QWORD *)(a1 + 24) - 8);
  if ((*(_BYTE *)(v1 + 82) & 2) != 0)
    return swift_release();
  else
    return (*(uint64_t (**)(void))(v1 + 8))();
}

uint64_t sub_2311695BC(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

unint64_t sub_2311695FC()
{
  unint64_t result;

  result = qword_254150638;
  if (!qword_254150638)
  {
    result = MEMORY[0x2348D4FB8](&unk_23116DA5C, &type metadata for TimeInDaylightArticleDataProvider);
    atomic_store(result, (unint64_t *)&qword_254150638);
  }
  return result;
}

unint64_t sub_231169640()
{
  unint64_t result;

  result = qword_254150640;
  if (!qword_254150640)
  {
    result = MEMORY[0x2348D4FB8](&unk_23116D9F4, &type metadata for TimeInDaylightArticleDataProvider);
    atomic_store(result, (unint64_t *)&qword_254150640);
  }
  return result;
}

_OWORD *sub_231169684(__int128 *a1, _OWORD *a2)
{
  __int128 v2;
  __int128 v3;

  v2 = *a1;
  v3 = a1[2];
  a2[1] = a1[1];
  a2[2] = v3;
  *a2 = v2;
  return a2;
}

unint64_t sub_23116969C()
{
  unint64_t result;

  result = qword_254150768;
  if (!qword_254150768)
  {
    result = MEMORY[0x2348D4FB8](&unk_23116D978, &type metadata for BloodGlucoseArticleDataProvider);
    atomic_store(result, (unint64_t *)&qword_254150768);
  }
  return result;
}

unint64_t sub_2311696E0()
{
  unint64_t result;

  result = qword_254150770;
  if (!qword_254150770)
  {
    result = MEMORY[0x2348D4FB8](&unk_23116D910, &type metadata for BloodGlucoseArticleDataProvider);
    atomic_store(result, (unint64_t *)&qword_254150770);
  }
  return result;
}

unint64_t sub_231169724()
{
  unint64_t result;

  result = qword_2541506A8;
  if (!qword_2541506A8)
  {
    result = MEMORY[0x2348D4FB8](&unk_23116D58C, &type metadata for RespirationRateArticleDataProvider);
    atomic_store(result, (unint64_t *)&qword_2541506A8);
  }
  return result;
}

unint64_t sub_231169768()
{
  unint64_t result;

  result = qword_2541506B0;
  if (!qword_2541506B0)
  {
    result = MEMORY[0x2348D4FB8](&unk_23116D524, &type metadata for RespirationRateArticleDataProvider);
    atomic_store(result, (unint64_t *)&qword_2541506B0);
  }
  return result;
}

unint64_t sub_2311697AC()
{
  unint64_t result;

  result = qword_255EB5D70;
  if (!qword_255EB5D70)
  {
    result = MEMORY[0x2348D4FB8](&unk_23116D8A4, &type metadata for ExampleArticleDataProvider);
    atomic_store(result, (unint64_t *)&qword_255EB5D70);
  }
  return result;
}

unint64_t sub_2311697F0()
{
  unint64_t result;

  result = qword_255EB5D78;
  if (!qword_255EB5D78)
  {
    result = MEMORY[0x2348D4FB8](&unk_23116D83C, &type metadata for ExampleArticleDataProvider);
    atomic_store(result, (unint64_t *)&qword_255EB5D78);
  }
  return result;
}

void sub_231169834(uint64_t a1, unint64_t *a2, void (*a3)(uint64_t))
{
  unint64_t v4;
  uint64_t v5;

  if (!*a2)
  {
    a3(255);
    v4 = sub_23116D28C();
    if (!v5)
      atomic_store(v4, a2);
  }
}

void sub_231169880(uint64_t a1, unint64_t *a2)
{
  unint64_t v3;
  uint64_t v4;

  if (!*a2)
  {
    v3 = sub_23116D28C();
    if (!v4)
      atomic_store(v3, a2);
  }
}

id sub_2311698C4(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  id v10;
  void *v11;
  unint64_t v12;
  id v13;
  NSObject *v14;
  os_log_type_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;

  v3 = v2;
  v6 = sub_23116D16C();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8]();
  v9 = (char *)&v21 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_254150628 != -1)
    swift_once();
  v10 = (id)qword_254150B80;
  swift_bridgeObjectRetain();
  v11 = (void *)sub_23116D178();
  swift_bridgeObjectRelease();
  v12 = 0x24BEBD000uLL;
  v13 = objc_msgSend((id)objc_opt_self(), sel_imageNamed_inBundle_, v11, v10);

  if (!v13)
  {
    sub_23116D154();
    swift_bridgeObjectRetain_n();
    v14 = sub_23116D160();
    v15 = sub_23116D1CC();
    if (os_log_type_enabled(v14, v15))
    {
      v16 = swift_slowAlloc();
      v22 = swift_slowAlloc();
      v23 = v22;
      *(_DWORD *)v16 = 136446466;
      v21 = v16 + 4;
      v24 = v3;
      swift_getMetatypeMetadata();
      v17 = sub_23116D184();
      v24 = sub_2311688E8(v17, v18, &v23);
      sub_23116D208();
      swift_bridgeObjectRelease();
      *(_WORD *)(v16 + 12) = 2082;
      swift_bridgeObjectRetain();
      v24 = sub_2311688E8(a1, a2, &v23);
      v12 = 9863680000;
      sub_23116D208();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_231165000, v14, v15, "[%{public}s] Could not find image in HealthArticles with name %{public}s", (uint8_t *)v16, 0x16u);
      v19 = v22;
      swift_arrayDestroy();
      MEMORY[0x2348D5018](v19, -1, -1);
      MEMORY[0x2348D5018](v16, -1, -1);

    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
    (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
    return objc_msgSend(objc_allocWithZone(*(Class *)(v12 + 1600)), sel_init);
  }
  return v13;
}

id sub_231169B7C()
{
  uint64_t ObjCClassFromMetadata;
  id result;

  type metadata accessor for HealthArticlesPluginDelegate();
  ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  result = objc_msgSend((id)objc_opt_self(), sel_bundleForClass_, ObjCClassFromMetadata);
  qword_254150B80 = (uint64_t)result;
  return result;
}

uint64_t sub_231169BD0(unsigned __int8 a1)
{
  return ((uint64_t (*)(unint64_t, unint64_t))((char *)sub_231169C08
                                                                     + 4 * asc_23116D660[a1]))(0xD00000000000002ELL, 0x800000023116DA90);
}

uint64_t sub_231169C08(uint64_t a1)
{
  return a1 + 8;
}

void sub_231169C40(char *a1)
{
  sub_2311687C0(*a1);
}

void sub_231169C4C()
{
  char *v0;

  sub_231169C54(*v0);
}

void sub_231169C54(char a1)
{
  sub_23116D2A4();
  __asm { BR              X10 }
}

uint64_t sub_231169CAC()
{
  sub_23116D190();
  swift_bridgeObjectRelease();
  return sub_23116D2B0();
}

void sub_231169D14(uint64_t a1)
{
  char *v1;

  sub_231169D1C(a1, *v1);
}

void sub_231169D1C(uint64_t a1, char a2)
{
  __asm { BR              X10 }
}

uint64_t sub_231169D60()
{
  sub_23116D190();
  return swift_bridgeObjectRelease();
}

void sub_231169DAC(uint64_t a1)
{
  char *v1;

  sub_231169DB4(a1, *v1);
}

void sub_231169DB4(uint64_t a1, char a2)
{
  sub_23116D2A4();
  __asm { BR              X10 }
}

uint64_t sub_231169E08()
{
  sub_23116D190();
  swift_bridgeObjectRelease();
  return sub_23116D2B0();
}

uint64_t sub_231169E70@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = sub_23116A13C();
  *a1 = result;
  return result;
}

uint64_t sub_231169E9C@<X0>(uint64_t *a1@<X8>)
{
  unsigned __int8 *v1;
  uint64_t result;
  uint64_t v4;

  result = sub_231169BD0(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

_BYTE *initializeBufferWithCopyOfBuffer for HealthArticlesIdentifiers(_BYTE *result, _BYTE *a2)
{
  *result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for HealthArticlesIdentifiers(unsigned __int8 *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for HealthArticlesIdentifiers(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_231169FB0 + 4 * byte_23116D675[v4]))();
  *a1 = a2 + 3;
  return ((uint64_t (*)(void))((char *)sub_231169FE4 + 4 * byte_23116D670[v4]))();
}

uint64_t sub_231169FE4(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_231169FEC(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x231169FF4);
  return result;
}

uint64_t sub_23116A000(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x23116A008);
  *(_BYTE *)result = a2 + 3;
  return result;
}

uint64_t sub_23116A00C(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23116A014(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23116A020(unsigned __int8 *a1)
{
  return *a1;
}

_BYTE *sub_23116A02C(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

ValueMetadata *type metadata accessor for HealthArticlesIdentifiers()
{
  return &type metadata for HealthArticlesIdentifiers;
}

unint64_t sub_23116A048()
{
  unint64_t result;
  uint64_t v1;

  result = qword_255EB5D80;
  if (!qword_255EB5D80)
  {
    sub_23116A090();
    result = MEMORY[0x2348D4FB8](MEMORY[0x24BEE12E0], v1);
    atomic_store(result, (unint64_t *)&qword_255EB5D80);
  }
  return result;
}

void sub_23116A090()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_255EB5D88)
  {
    v0 = sub_23116D1C0();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_255EB5D88);
  }
}

void sub_23116A0E4(_QWORD *a1@<X8>)
{
  *a1 = &unk_250007028;
}

unint64_t sub_23116A0F8()
{
  unint64_t result;

  result = qword_255EB5D90;
  if (!qword_255EB5D90)
  {
    result = MEMORY[0x2348D4FB8](&unk_23116D74C, &type metadata for HealthArticlesIdentifiers);
    atomic_store(result, (unint64_t *)&qword_255EB5D90);
  }
  return result;
}

uint64_t sub_23116A13C()
{
  unint64_t v0;

  v0 = sub_23116D280();
  swift_bridgeObjectRelease();
  if (v0 >= 4)
    return 4;
  else
    return v0;
}

ValueMetadata *type metadata accessor for HealthArticlesTileDataController()
{
  return &type metadata for HealthArticlesTileDataController;
}

void sub_23116A194()
{
  char *v0;

  sub_23116D16C();
  MEMORY[0x24BDAC7A8]();
  swift_bridgeObjectRetain();
  v0 = (char *)sub_23116A228 + 4 * byte_23116D780[sub_23116A13C()];
  __asm { BR              X10 }
}

unint64_t sub_23116A228()
{
  _QWORD *v0;
  unint64_t result;

  v0[3] = &type metadata for ExampleArticleDataProvider;
  v0[4] = sub_2311697AC();
  result = sub_2311697F0();
  v0[5] = result;
  return result;
}

unint64_t sub_23116A470()
{
  unint64_t result;

  result = qword_255EB5D98;
  if (!qword_255EB5D98)
  {
    result = swift_getMetatypeMetadata();
    atomic_store(result, (unint64_t *)&qword_255EB5D98);
  }
  return result;
}

ValueMetadata *type metadata accessor for ExampleArticleDataProvider()
{
  return &type metadata for ExampleArticleDataProvider;
}

unint64_t sub_23116A4BC()
{
  return 0xD00000000000002ELL;
}

id sub_23116A4E4()
{
  sub_231168268(0, &qword_254150620);
  return sub_2311698C4(0xD00000000000001ALL, 0x800000023116E060);
}

uint64_t sub_23116A538()
{
  uint64_t ObjCClassFromMetadata;
  id v1;
  uint64_t v2;

  type metadata accessor for HealthArticlesPluginDelegate();
  ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  v1 = objc_msgSend((id)objc_opt_self(), sel_bundleForClass_, ObjCClassFromMetadata);
  v2 = sub_23116D0C4();

  return v2;
}

uint64_t sub_23116A5F8()
{
  uint64_t ObjCClassFromMetadata;
  id v1;
  uint64_t v2;

  type metadata accessor for HealthArticlesPluginDelegate();
  ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  v1 = objc_msgSend((id)objc_opt_self(), sel_bundleForClass_, ObjCClassFromMetadata);
  v2 = sub_23116D0C4();

  return v2;
}

uint64_t sub_23116A6C0()
{
  uint64_t ObjCClassFromMetadata;
  id v1;
  uint64_t v2;

  type metadata accessor for HealthArticlesPluginDelegate();
  ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  v1 = objc_msgSend((id)objc_opt_self(), sel_bundleForClass_, ObjCClassFromMetadata);
  v2 = sub_23116D0C4();

  return v2;
}

id sub_23116A784()
{
  unint64_t inited;
  id result;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  sub_231168210();
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_23116D4C0;
  sub_231168268(0, &qword_2541506A0);
  result = objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_quantityTypeForIdentifier_, *MEMORY[0x24BDD3678]);
  if (result)
  {
    *(_QWORD *)(inited + 32) = result;
    sub_23116D1B4();
    if (inited >> 62)
    {
      swift_bridgeObjectRetain();
      v4 = sub_23116D268();
      swift_bridgeObjectRelease();
      if (v4)
        goto LABEL_4;
    }
    else if (*(_QWORD *)((inited & 0xFFFFFFFFFFFFF8) + 0x10))
    {
LABEL_4:
      sub_23116BDB4(inited);
      v3 = v2;
LABEL_7:
      swift_bridgeObjectRelease();
      return (id)v3;
    }
    v3 = MEMORY[0x24BEE4B08];
    goto LABEL_7;
  }
  __break(1u);
  return result;
}

uint64_t sub_23116A880()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;
  void (*v5)(unint64_t, uint64_t, uint64_t);
  uint64_t *v6;
  uint64_t ObjCClassFromMetadata;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;

  sub_2311681BC();
  v0 = sub_23116D0F4();
  v1 = *(_QWORD *)(v0 - 8);
  v32 = v0;
  v2 = *(_QWORD *)(v1 + 72);
  v3 = (*(unsigned __int8 *)(v1 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80);
  v30 = 4 * v2;
  v31 = swift_allocObject();
  *(_OWORD *)(v31 + 16) = xmmword_23116D800;
  v4 = v31 + v3;
  sub_231168268(0, &qword_254150620);
  *(_QWORD *)v4 = sub_2311698C4(0xD00000000000001ALL, 0x800000023116E060);
  *(_BYTE *)(v4 + 8) = 0;
  v5 = *(void (**)(unint64_t, uint64_t, uint64_t))(v1 + 104);
  v5(v4, *MEMORY[0x24BE3F908], v0);
  v6 = (uint64_t *)(v4 + v2);
  type metadata accessor for HealthArticlesPluginDelegate();
  ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  v8 = (void *)objc_opt_self();
  v9 = objc_msgSend(v8, sel_bundleForClass_, ObjCClassFromMetadata);
  v10 = sub_23116D0C4();
  v12 = v11;

  *v6 = v10;
  v6[1] = v12;
  v5(v4 + v2, *MEMORY[0x24BE3F910], v32);
  v13 = (uint64_t *)(v4 + 2 * v2);
  v14 = objc_msgSend(v8, sel_bundleForClass_, ObjCClassFromMetadata, 0xE000000000000000);
  v15 = sub_23116D0C4();
  v17 = v16;

  *v13 = v15;
  v13[1] = v17;
  v13[2] = 0;
  v5((unint64_t)v13, *MEMORY[0x24BE3F8D0], v32);
  v18 = v4 + 3 * v2;
  v19 = objc_msgSend(v8, sel_bundleForClass_, ObjCClassFromMetadata, 0xE000000000000000);
  v20 = sub_23116D0C4();
  v22 = v21;

  *(_QWORD *)v18 = v20;
  *(_QWORD *)(v18 + 8) = v22;
  *(_BYTE *)(v18 + 16) = 0;
  v23 = *MEMORY[0x24BE3F930];
  v5(v18, v23, v32);
  v24 = v4 + v30;
  v25 = objc_msgSend(v8, sel_bundleForClass_, ObjCClassFromMetadata, 0xE000000000000000);
  v26 = sub_23116D0C4();
  v28 = v27;

  *(_QWORD *)v24 = v26;
  *(_QWORD *)(v24 + 8) = v28;
  *(_BYTE *)(v24 + 16) = 0;
  v5(v24, v23, v32);
  return v31;
}

ValueMetadata *type metadata accessor for BloodGlucoseArticleDataProvider()
{
  return &type metadata for BloodGlucoseArticleDataProvider;
}

unint64_t sub_23116AC34()
{
  return 0xD000000000000033;
}

id sub_23116AC5C()
{
  sub_231168268(0, &qword_254150620);
  return sub_2311698C4(0xD00000000000001ALL, 0x800000023116E100);
}

uint64_t sub_23116ACB0()
{
  uint64_t ObjCClassFromMetadata;
  id v1;
  uint64_t v2;

  type metadata accessor for HealthArticlesPluginDelegate();
  ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  v1 = objc_msgSend((id)objc_opt_self(), sel_bundleForClass_, ObjCClassFromMetadata);
  v2 = sub_23116D0C4();

  return v2;
}

uint64_t sub_23116AD74()
{
  uint64_t ObjCClassFromMetadata;
  id v1;
  uint64_t v2;

  type metadata accessor for HealthArticlesPluginDelegate();
  ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  v1 = objc_msgSend((id)objc_opt_self(), sel_bundleForClass_, ObjCClassFromMetadata);
  v2 = sub_23116D0C4();

  return v2;
}

uint64_t sub_23116AE38()
{
  uint64_t ObjCClassFromMetadata;
  id v1;
  uint64_t v2;

  type metadata accessor for HealthArticlesPluginDelegate();
  ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  v1 = objc_msgSend((id)objc_opt_self(), sel_bundleForClass_, ObjCClassFromMetadata);
  v2 = sub_23116D0C4();

  return v2;
}

uint64_t sub_23116AEFC()
{
  unint64_t inited;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  sub_231168210();
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_23116D4C0;
  sub_231168268(0, &qword_2541506A0);
  *(_QWORD *)(inited + 32) = MEMORY[0x2348D4D60]((id)*MEMORY[0x24BDD3398]);
  sub_23116D1B4();
  if (inited >> 62)
  {
    swift_bridgeObjectRetain();
    v3 = sub_23116D268();
    swift_bridgeObjectRelease();
    if (v3)
      goto LABEL_3;
LABEL_5:
    v2 = MEMORY[0x24BEE4B08];
    goto LABEL_6;
  }
  if (!*(_QWORD *)((inited & 0xFFFFFFFFFFFFF8) + 0x10))
    goto LABEL_5;
LABEL_3:
  sub_23116BDB4(inited);
  v2 = v1;
LABEL_6:
  swift_bridgeObjectRelease();
  return v2;
}

uint64_t sub_23116AFE4()
{
  uint64_t v0;
  uint64_t v1;
  unint64_t v2;
  uint64_t v3;
  unint64_t v4;
  void (*v5)(_QWORD);
  uint64_t *v6;
  unint64_t v7;
  uint64_t ObjCClassFromMetadata;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  unint64_t v29;
  id v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t *v34;
  id v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  unint64_t v39;
  id v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  unint64_t v44;
  id v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t *v49;
  id v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  unint64_t v54;
  id v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  unint64_t v59;
  id v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  unint64_t v64;
  id v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  unint64_t v69;
  id v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  unint64_t v74;
  id v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  unint64_t v79;
  id v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t *v84;
  id v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  unint64_t v89;
  id v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  unint64_t v94;
  id v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  unint64_t v99;
  id v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  unint64_t v104;
  id v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v110;
  unsigned int v111;
  void (*v112)(uint64_t *);
  unsigned int v113;

  sub_2311681BC();
  v0 = sub_23116D0F4();
  v1 = *(_QWORD *)(v0 - 8);
  v2 = (*(unsigned __int8 *)(v1 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80);
  v3 = *(_QWORD *)(v1 + 72);
  v110 = swift_allocObject();
  *(_OWORD *)(v110 + 16) = xmmword_23116D8D0;
  v4 = v110 + v2;
  sub_231168268(0, &qword_254150620);
  *(_QWORD *)v4 = sub_2311698C4(0xD00000000000001ALL, 0x800000023116E100);
  *(_BYTE *)(v4 + 8) = 0;
  v5 = *(void (**)(_QWORD))(v1 + 104);
  ((void (*)(unint64_t, _QWORD, uint64_t))v5)(v110 + v2, *MEMORY[0x24BE3F908], v0);
  v112 = (void (*)(uint64_t *))v5;
  v6 = (uint64_t *)(v110 + v2 + v3);
  v7 = v110 + v2;
  type metadata accessor for HealthArticlesPluginDelegate();
  ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  v9 = (void *)objc_opt_self();
  v10 = objc_msgSend(v9, sel_bundleForClass_, ObjCClassFromMetadata);
  v11 = sub_23116D0C4();
  v13 = v12;

  *v6 = v11;
  v6[1] = v13;
  ((void (*)(uint64_t *, _QWORD, uint64_t))v5)(v6, *MEMORY[0x24BE3F910], v0);
  v14 = (uint64_t *)(v7 + 2 * v3);
  v15 = objc_msgSend(v9, sel_bundleForClass_, ObjCClassFromMetadata, 0xE000000000000000);
  v16 = sub_23116D0C4();
  v18 = v17;

  *v14 = v16;
  v14[1] = v18;
  v14[2] = 0;
  v111 = *MEMORY[0x24BE3F8D0];
  v112(v14);
  v19 = v7 + 3 * v3;
  v20 = objc_msgSend(v9, sel_bundleForClass_, ObjCClassFromMetadata, 0xE000000000000000);
  v21 = sub_23116D0C4();
  v23 = v22;

  *(_QWORD *)v19 = v21;
  *(_QWORD *)(v19 + 8) = v23;
  *(_BYTE *)(v19 + 16) = 0;
  v113 = *MEMORY[0x24BE3F930];
  v112((uint64_t *)v19);
  v24 = v7 + 4 * v3;
  v25 = objc_msgSend(v9, sel_bundleForClass_, ObjCClassFromMetadata, 0xE000000000000000);
  v26 = sub_23116D0C4();
  v28 = v27;

  *(_QWORD *)v24 = v26;
  *(_QWORD *)(v24 + 8) = v28;
  *(_BYTE *)(v24 + 16) = 0;
  ((void (*)(unint64_t, _QWORD, uint64_t))v112)(v24, v113, v0);
  v29 = v7 + 5 * v3;
  v30 = objc_msgSend(v9, sel_bundleForClass_, ObjCClassFromMetadata, 0xE000000000000000);
  v31 = sub_23116D0C4();
  v33 = v32;

  *(_QWORD *)v29 = v31;
  *(_QWORD *)(v29 + 8) = v33;
  *(_BYTE *)(v29 + 16) = 0;
  ((void (*)(unint64_t, _QWORD, uint64_t))v112)(v29, v113, v0);
  v34 = (uint64_t *)(v7 + 6 * v3);
  v35 = objc_msgSend(v9, sel_bundleForClass_, ObjCClassFromMetadata, 0xE000000000000000);
  v36 = sub_23116D0C4();
  v38 = v37;

  *v34 = v36;
  v34[1] = v38;
  v34[2] = 0;
  ((void (*)(uint64_t *, _QWORD, uint64_t))v112)(v34, v111, v0);
  v39 = v7 + 7 * v3;
  v40 = objc_msgSend(v9, sel_bundleForClass_, ObjCClassFromMetadata, 0xE000000000000000);
  v41 = sub_23116D0C4();
  v43 = v42;

  *(_QWORD *)v39 = v41;
  *(_QWORD *)(v39 + 8) = v43;
  *(_BYTE *)(v39 + 16) = 0;
  ((void (*)(unint64_t, _QWORD, uint64_t))v112)(v39, v113, v0);
  v44 = v7 + 8 * v3;
  v45 = objc_msgSend(v9, sel_bundleForClass_, ObjCClassFromMetadata, 0xE000000000000000);
  v46 = sub_23116D0C4();
  v48 = v47;

  *(_QWORD *)v44 = v46;
  *(_QWORD *)(v44 + 8) = v48;
  *(_BYTE *)(v44 + 16) = 0;
  ((void (*)(unint64_t, _QWORD, uint64_t))v112)(v44, v113, v0);
  v49 = (uint64_t *)(v7 + 9 * v3);
  v50 = objc_msgSend(v9, sel_bundleForClass_, ObjCClassFromMetadata, 0xE000000000000000);
  v51 = sub_23116D0C4();
  v53 = v52;

  *v49 = v51;
  v49[1] = v53;
  v49[2] = 0;
  ((void (*)(uint64_t *, _QWORD, uint64_t))v112)(v49, v111, v0);
  v54 = v7 + 10 * v3;
  v55 = objc_msgSend(v9, sel_bundleForClass_, ObjCClassFromMetadata, 0xE000000000000000);
  v56 = sub_23116D0C4();
  v58 = v57;

  *(_QWORD *)v54 = v56;
  *(_QWORD *)(v54 + 8) = v58;
  *(_BYTE *)(v54 + 16) = 0;
  ((void (*)(unint64_t, _QWORD, uint64_t))v112)(v54, v113, v0);
  v59 = v7 + 11 * v3;
  v60 = objc_msgSend(v9, sel_bundleForClass_, ObjCClassFromMetadata, 0xE000000000000000);
  v61 = sub_23116D0C4();
  v63 = v62;

  *(_QWORD *)v59 = v61;
  *(_QWORD *)(v59 + 8) = v63;
  *(_BYTE *)(v59 + 16) = 0;
  ((void (*)(unint64_t, _QWORD, uint64_t))v112)(v59, v113, v0);
  v64 = v7 + 12 * v3;
  v65 = objc_msgSend(v9, sel_bundleForClass_, ObjCClassFromMetadata, 0xE000000000000000);
  v66 = sub_23116D0C4();
  v68 = v67;

  *(_QWORD *)v64 = v66;
  *(_QWORD *)(v64 + 8) = v68;
  *(_BYTE *)(v64 + 16) = 0;
  ((void (*)(unint64_t, _QWORD, uint64_t))v112)(v64, v113, v0);
  v69 = v7 + 13 * v3;
  v70 = objc_msgSend(v9, sel_bundleForClass_, ObjCClassFromMetadata, 0xE000000000000000);
  v71 = sub_23116D0C4();
  v73 = v72;

  *(_QWORD *)v69 = v71;
  *(_QWORD *)(v69 + 8) = v73;
  *(_BYTE *)(v69 + 16) = 0;
  ((void (*)(unint64_t, _QWORD, uint64_t))v112)(v69, v113, v0);
  v74 = v7 + 14 * v3;
  v75 = objc_msgSend(v9, sel_bundleForClass_, ObjCClassFromMetadata, 0xE000000000000000);
  v76 = sub_23116D0C4();
  v78 = v77;

  *(_QWORD *)v74 = v76;
  *(_QWORD *)(v74 + 8) = v78;
  *(_BYTE *)(v74 + 16) = 0;
  ((void (*)(unint64_t, _QWORD, uint64_t))v112)(v74, v113, v0);
  v79 = v7 + 15 * v3;
  v80 = objc_msgSend(v9, sel_bundleForClass_, ObjCClassFromMetadata, 0xE000000000000000);
  v81 = sub_23116D0C4();
  v83 = v82;

  *(_QWORD *)v79 = v81;
  *(_QWORD *)(v79 + 8) = v83;
  *(_BYTE *)(v79 + 16) = 0;
  ((void (*)(unint64_t, _QWORD, uint64_t))v112)(v79, v113, v0);
  v84 = (uint64_t *)(v7 + 16 * v3);
  v85 = objc_msgSend(v9, sel_bundleForClass_, ObjCClassFromMetadata, 0xE000000000000000);
  v86 = sub_23116D0C4();
  v88 = v87;

  *v84 = v86;
  v84[1] = v88;
  v84[2] = 0;
  ((void (*)(uint64_t *, _QWORD, uint64_t))v112)(v84, v111, v0);
  v89 = v7 + 17 * v3;
  v90 = objc_msgSend(v9, sel_bundleForClass_, ObjCClassFromMetadata, 0xE000000000000000);
  v91 = sub_23116D0C4();
  v93 = v92;

  *(_QWORD *)v89 = v91;
  *(_QWORD *)(v89 + 8) = v93;
  *(_BYTE *)(v89 + 16) = 0;
  ((void (*)(unint64_t, _QWORD, uint64_t))v112)(v89, v113, v0);
  v94 = v7 + 18 * v3;
  v95 = objc_msgSend(v9, sel_bundleForClass_, ObjCClassFromMetadata, 0xE000000000000000);
  v96 = sub_23116D0C4();
  v98 = v97;

  *(_QWORD *)v94 = v96;
  *(_QWORD *)(v94 + 8) = v98;
  *(_BYTE *)(v94 + 16) = 0;
  ((void (*)(unint64_t, _QWORD, uint64_t))v112)(v94, v113, v0);
  v99 = v7 + 19 * v3;
  v100 = objc_msgSend(v9, sel_bundleForClass_, ObjCClassFromMetadata, 0xE000000000000000);
  v101 = sub_23116D0C4();
  v103 = v102;

  *(_QWORD *)v99 = v101;
  *(_QWORD *)(v99 + 8) = v103;
  *(_BYTE *)(v99 + 16) = 0;
  ((void (*)(unint64_t, _QWORD, uint64_t))v112)(v99, v113, v0);
  v104 = v7 + 20 * v3;
  v105 = objc_msgSend(v9, sel_bundleForClass_, ObjCClassFromMetadata, 0xE000000000000000);
  v106 = sub_23116D0C4();
  v108 = v107;

  *(_QWORD *)v104 = v106;
  *(_QWORD *)(v104 + 8) = v108;
  *(_BYTE *)(v104 + 16) = 0;
  ((void (*)(unint64_t, _QWORD, uint64_t))v112)(v104, v113, v0);
  return v110;
}

ValueMetadata *type metadata accessor for TimeInDaylightArticleDataProvider()
{
  return &type metadata for TimeInDaylightArticleDataProvider;
}

unint64_t sub_23116BD38()
{
  return 0xD000000000000035;
}

id sub_23116BD60()
{
  sub_231168268(0, &qword_254150620);
  return sub_2311698C4(0xD000000000000023, 0x800000023116E500);
}

void sub_23116BDB4(unint64_t a1)
{
  unint64_t v1;
  unint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  BOOL v9;
  uint64_t v10;
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
  uint64_t v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  unint64_t v28;
  unint64_t v29;
  uint64_t v30;
  uint64_t v31;
  id v32;
  char v33;
  uint64_t v34;
  id v35;
  char v36;
  uint64_t v37;
  uint64_t v38;
  unint64_t v39;
  unint64_t v40;
  uint64_t v41;
  uint64_t v42;

  v1 = a1;
  v2 = a1 >> 62;
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    v5 = sub_23116D268();
    swift_bridgeObjectRelease();
    if (v5)
    {
LABEL_3:
      sub_23116CFDC();
      v3 = sub_23116D220();
      if (!v2)
        goto LABEL_4;
LABEL_8:
      swift_bridgeObjectRetain();
      v4 = sub_23116D268();
      swift_bridgeObjectRelease();
      if (!v4)
        return;
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
    return;
LABEL_9:
  v6 = v3 + 56;
  v42 = v4;
  if ((v1 & 0xC000000000000001) != 0)
  {
    v7 = 0;
    v40 = v1;
    while (1)
    {
      while (1)
      {
        v8 = MEMORY[0x2348D4DC0](v7, v1);
        v9 = __OFADD__(v7++, 1);
        if (v9)
        {
          __break(1u);
          goto LABEL_36;
        }
        v10 = v8;
        v11 = sub_23116D1F0();
        v12 = -1 << *(_BYTE *)(v3 + 32);
        v13 = v11 & ~v12;
        v14 = v13 >> 6;
        v15 = *(_QWORD *)(v6 + 8 * (v13 >> 6));
        v16 = 1 << v13;
        if (((1 << v13) & v15) != 0)
          break;
LABEL_20:
        *(_QWORD *)(v6 + 8 * v14) = v16 | v15;
        *(_QWORD *)(*(_QWORD *)(v3 + 48) + 8 * v13) = v10;
        v22 = *(_QWORD *)(v3 + 16);
        v9 = __OFADD__(v22, 1);
        v23 = v22 + 1;
        if (v9)
          goto LABEL_37;
        *(_QWORD *)(v3 + 16) = v23;
        if (v7 == v4)
          return;
      }
      sub_231168268(0, &qword_254150668);
      v17 = *(id *)(*(_QWORD *)(v3 + 48) + 8 * v13);
      v18 = sub_23116D1FC();

      if ((v18 & 1) == 0)
      {
        v19 = ~v12;
        while (1)
        {
          v13 = (v13 + 1) & v19;
          v14 = v13 >> 6;
          v15 = *(_QWORD *)(v6 + 8 * (v13 >> 6));
          v16 = 1 << v13;
          if ((v15 & (1 << v13)) == 0)
            break;
          v20 = *(id *)(*(_QWORD *)(v3 + 48) + 8 * v13);
          v21 = sub_23116D1FC();

          if ((v21 & 1) != 0)
            goto LABEL_11;
        }
        v1 = v40;
        v4 = v42;
        goto LABEL_20;
      }
LABEL_11:
      swift_unknownObjectRelease();
      v1 = v40;
      v4 = v42;
      if (v7 == v42)
        return;
    }
  }
  v24 = 0;
  v39 = v1 + 32;
  v41 = *(_QWORD *)((v1 & 0xFFFFFFFFFFFFF8) + 0x10);
  while (v24 != v41)
  {
    v25 = *(id *)(v39 + 8 * v24);
    v26 = sub_23116D1F0();
    v27 = -1 << *(_BYTE *)(v3 + 32);
    v28 = v26 & ~v27;
    v29 = v28 >> 6;
    v30 = *(_QWORD *)(v6 + 8 * (v28 >> 6));
    v31 = 1 << v28;
    if (((1 << v28) & v30) != 0)
    {
      sub_231168268(0, &qword_254150668);
      v32 = *(id *)(*(_QWORD *)(v3 + 48) + 8 * v28);
      v33 = sub_23116D1FC();

      if ((v33 & 1) != 0)
      {
LABEL_24:

        goto LABEL_25;
      }
      v34 = ~v27;
      while (1)
      {
        v28 = (v28 + 1) & v34;
        v29 = v28 >> 6;
        v30 = *(_QWORD *)(v6 + 8 * (v28 >> 6));
        v31 = 1 << v28;
        if ((v30 & (1 << v28)) == 0)
          break;
        v35 = *(id *)(*(_QWORD *)(v3 + 48) + 8 * v28);
        v36 = sub_23116D1FC();

        if ((v36 & 1) != 0)
          goto LABEL_24;
      }
    }
    *(_QWORD *)(v6 + 8 * v29) = v31 | v30;
    *(_QWORD *)(*(_QWORD *)(v3 + 48) + 8 * v28) = v25;
    v37 = *(_QWORD *)(v3 + 16);
    v9 = __OFADD__(v37, 1);
    v38 = v37 + 1;
    if (v9)
      goto LABEL_38;
    *(_QWORD *)(v3 + 16) = v38;
LABEL_25:
    if (++v24 == v42)
      return;
  }
LABEL_36:
  __break(1u);
LABEL_37:
  __break(1u);
LABEL_38:
  __break(1u);
}

uint64_t sub_23116C10C()
{
  uint64_t ObjCClassFromMetadata;
  id v1;
  uint64_t v2;

  type metadata accessor for HealthArticlesPluginDelegate();
  ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  v1 = objc_msgSend((id)objc_opt_self(), sel_bundleForClass_, ObjCClassFromMetadata);
  v2 = sub_23116D0C4();

  return v2;
}

uint64_t sub_23116C1D0()
{
  uint64_t ObjCClassFromMetadata;
  id v1;
  uint64_t v2;

  type metadata accessor for HealthArticlesPluginDelegate();
  ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  v1 = objc_msgSend((id)objc_opt_self(), sel_bundleForClass_, ObjCClassFromMetadata);
  v2 = sub_23116D0C4();

  return v2;
}

uint64_t sub_23116C294()
{
  uint64_t ObjCClassFromMetadata;
  id v1;
  uint64_t v2;

  type metadata accessor for HealthArticlesPluginDelegate();
  ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  v1 = objc_msgSend((id)objc_opt_self(), sel_bundleForClass_, ObjCClassFromMetadata);
  v2 = sub_23116D0C4();

  return v2;
}

id sub_23116C358()
{
  unint64_t inited;
  id result;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  sub_231168210();
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_23116D4C0;
  sub_231168268(0, &qword_2541506A0);
  result = objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_quantityTypeForIdentifier_, *MEMORY[0x24BDD3688]);
  if (result)
  {
    *(_QWORD *)(inited + 32) = result;
    sub_23116D1B4();
    if (inited >> 62)
    {
      swift_bridgeObjectRetain();
      v4 = sub_23116D268();
      swift_bridgeObjectRelease();
      if (v4)
        goto LABEL_4;
    }
    else if (*(_QWORD *)((inited & 0xFFFFFFFFFFFFF8) + 0x10))
    {
LABEL_4:
      sub_23116BDB4(inited);
      v3 = v2;
LABEL_7:
      swift_bridgeObjectRelease();
      return (id)v3;
    }
    v3 = MEMORY[0x24BEE4B08];
    goto LABEL_7;
  }
  __break(1u);
  return result;
}

uint64_t sub_23116C454()
{
  uint64_t v0;
  uint64_t v1;
  unint64_t v2;
  uint64_t v3;
  unint64_t v4;
  void (*v5)(_QWORD);
  uint64_t *v6;
  uint64_t ObjCClassFromMetadata;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t *v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t *v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t *v29;
  id v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  unint64_t v34;
  id v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  unint64_t v39;
  id v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  unint64_t v44;
  id v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t *v49;
  id v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  unint64_t v54;
  id v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  unint64_t v59;
  id v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t *v64;
  id v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  unint64_t v69;
  id v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  unint64_t v74;
  id v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t *v79;
  id v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  unint64_t v84;
  id v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  unint64_t v89;
  id v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v95;
  unsigned int v96;
  unsigned int v97;
  void (*v98)(uint64_t *);

  sub_2311681BC();
  v0 = sub_23116D0F4();
  v1 = *(_QWORD *)(v0 - 8);
  v2 = (*(unsigned __int8 *)(v1 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80);
  v3 = *(_QWORD *)(v1 + 72);
  v95 = swift_allocObject();
  *(_OWORD *)(v95 + 16) = xmmword_23116D9B0;
  v4 = v95 + v2;
  sub_231168268(0, &qword_254150620);
  *(_QWORD *)v4 = sub_2311698C4(0xD000000000000023, 0x800000023116E500);
  *(_BYTE *)(v4 + 8) = 0;
  v5 = *(void (**)(_QWORD))(v1 + 104);
  ((void (*)(unint64_t, _QWORD, uint64_t))v5)(v4, *MEMORY[0x24BE3F908], v0);
  v98 = (void (*)(uint64_t *))v5;
  v6 = (uint64_t *)(v4 + v3);
  type metadata accessor for HealthArticlesPluginDelegate();
  ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  v8 = (void *)objc_opt_self();
  v9 = objc_msgSend(v8, sel_bundleForClass_, ObjCClassFromMetadata);
  v10 = sub_23116D0C4();
  v12 = v11;

  *v6 = v10;
  v6[1] = v12;
  ((void (*)(unint64_t, _QWORD, uint64_t))v5)(v4 + v3, *MEMORY[0x24BE3F910], v0);
  v13 = (uint64_t *)(v4 + 2 * v3);
  v14 = v8;
  v15 = objc_msgSend(v8, sel_bundleForClass_, ObjCClassFromMetadata, 0xE000000000000000);
  v16 = sub_23116D0C4();
  v18 = v17;

  *v13 = v16;
  v13[1] = v18;
  v13[2] = 0;
  v96 = *MEMORY[0x24BE3F8D0];
  v98(v13);
  v19 = v4 + 3 * v3;
  v20 = objc_msgSend(v14, sel_bundleForClass_, ObjCClassFromMetadata, 0xE000000000000000);
  v21 = sub_23116D0C4();
  v23 = v22;

  *(_QWORD *)v19 = v21;
  *(_QWORD *)(v19 + 8) = v23;
  *(_BYTE *)(v19 + 16) = 0;
  v97 = *MEMORY[0x24BE3F930];
  v98((uint64_t *)v19);
  v24 = (uint64_t *)(v4 + 4 * v3);
  v25 = objc_msgSend(v14, sel_bundleForClass_, ObjCClassFromMetadata, 0xE000000000000000);
  v26 = sub_23116D0C4();
  v28 = v27;

  *v24 = v26;
  v24[1] = v28;
  v24[2] = 0;
  ((void (*)(uint64_t *, _QWORD, uint64_t))v98)(v24, v96, v0);
  v29 = (uint64_t *)(v4 + 5 * v3);
  v30 = objc_msgSend(v14, sel_bundleForClass_, ObjCClassFromMetadata, 0xE000000000000000);
  v31 = sub_23116D0C4();
  v33 = v32;

  *v29 = v31;
  v29[1] = v33;
  v29[2] = 0;
  ((void (*)(uint64_t *, _QWORD, uint64_t))v98)(v29, v96, v0);
  v34 = v4 + 6 * v3;
  v35 = objc_msgSend(v14, sel_bundleForClass_, ObjCClassFromMetadata, 0xE000000000000000);
  v36 = sub_23116D0C4();
  v38 = v37;

  *(_QWORD *)v34 = v36;
  *(_QWORD *)(v34 + 8) = v38;
  *(_BYTE *)(v34 + 16) = 0;
  ((void (*)(unint64_t, _QWORD, uint64_t))v98)(v34, v97, v0);
  v39 = v4 + 7 * v3;
  v40 = objc_msgSend(v14, sel_bundleForClass_, ObjCClassFromMetadata, 0xE000000000000000);
  v41 = sub_23116D0C4();
  v43 = v42;

  *(_QWORD *)v39 = v41;
  *(_QWORD *)(v39 + 8) = v43;
  *(_BYTE *)(v39 + 16) = 0;
  ((void (*)(unint64_t, _QWORD, uint64_t))v98)(v39, v97, v0);
  v44 = v4 + 8 * v3;
  v45 = objc_msgSend(v14, sel_bundleForClass_, ObjCClassFromMetadata, 0xE000000000000000);
  v46 = sub_23116D0C4();
  v48 = v47;

  *(_QWORD *)v44 = v46;
  *(_QWORD *)(v44 + 8) = v48;
  *(_BYTE *)(v44 + 16) = 0;
  ((void (*)(unint64_t, _QWORD, uint64_t))v98)(v44, v97, v0);
  v49 = (uint64_t *)(v4 + 9 * v3);
  v50 = objc_msgSend(v14, sel_bundleForClass_, ObjCClassFromMetadata, 0xE000000000000000);
  v51 = sub_23116D0C4();
  v53 = v52;

  *v49 = v51;
  v49[1] = v53;
  v49[2] = 0;
  ((void (*)(uint64_t *, _QWORD, uint64_t))v98)(v49, v96, v0);
  v54 = v4 + 10 * v3;
  v55 = objc_msgSend(v14, sel_bundleForClass_, ObjCClassFromMetadata, 0xE000000000000000);
  v56 = sub_23116D0C4();
  v58 = v57;

  *(_QWORD *)v54 = v56;
  *(_QWORD *)(v54 + 8) = v58;
  *(_BYTE *)(v54 + 16) = 0;
  ((void (*)(unint64_t, _QWORD, uint64_t))v98)(v54, v97, v0);
  v59 = v4 + 11 * v3;
  v60 = objc_msgSend(v14, sel_bundleForClass_, ObjCClassFromMetadata, 0xE000000000000000);
  v61 = sub_23116D0C4();
  v63 = v62;

  *(_QWORD *)v59 = v61;
  *(_QWORD *)(v59 + 8) = v63;
  *(_BYTE *)(v59 + 16) = 0;
  ((void (*)(unint64_t, _QWORD, uint64_t))v98)(v59, v97, v0);
  v64 = (uint64_t *)(v4 + 12 * v3);
  v65 = objc_msgSend(v14, sel_bundleForClass_, ObjCClassFromMetadata, 0xE000000000000000);
  v66 = sub_23116D0C4();
  v68 = v67;

  *v64 = v66;
  v64[1] = v68;
  v64[2] = 0;
  ((void (*)(uint64_t *, _QWORD, uint64_t))v98)(v64, v96, v0);
  v69 = v4 + 13 * v3;
  v70 = objc_msgSend(v14, sel_bundleForClass_, ObjCClassFromMetadata, 0xE000000000000000);
  v71 = sub_23116D0C4();
  v73 = v72;

  *(_QWORD *)v69 = v71;
  *(_QWORD *)(v69 + 8) = v73;
  *(_BYTE *)(v69 + 16) = 0;
  ((void (*)(unint64_t, _QWORD, uint64_t))v98)(v69, v97, v0);
  v74 = v4 + 14 * v3;
  v75 = objc_msgSend(v14, sel_bundleForClass_, ObjCClassFromMetadata, 0xE000000000000000);
  v76 = sub_23116D0C4();
  v78 = v77;

  *(_QWORD *)v74 = v76;
  *(_QWORD *)(v74 + 8) = v78;
  *(_BYTE *)(v74 + 16) = 0;
  ((void (*)(unint64_t, _QWORD, uint64_t))v98)(v74, v97, v0);
  v79 = (uint64_t *)(v4 + 15 * v3);
  v80 = objc_msgSend(v14, sel_bundleForClass_, ObjCClassFromMetadata, 0xE000000000000000);
  v81 = sub_23116D0C4();
  v83 = v82;

  *v79 = v81;
  v79[1] = v83;
  v79[2] = 0;
  ((void (*)(uint64_t *, _QWORD, uint64_t))v98)(v79, v96, v0);
  v84 = v4 + 16 * v3;
  v85 = objc_msgSend(v14, sel_bundleForClass_, ObjCClassFromMetadata, 0xE000000000000000);
  v86 = sub_23116D0C4();
  v88 = v87;

  *(_QWORD *)v84 = v86;
  *(_QWORD *)(v84 + 8) = v88;
  *(_BYTE *)(v84 + 16) = 0;
  ((void (*)(unint64_t, _QWORD, uint64_t))v98)(v84, v97, v0);
  v89 = v4 + 17 * v3;
  v90 = objc_msgSend(v14, sel_bundleForClass_, ObjCClassFromMetadata, 0xE000000000000000);
  v91 = sub_23116D0C4();
  v93 = v92;

  *(_QWORD *)v89 = v91;
  *(_QWORD *)(v89 + 8) = v93;
  *(_BYTE *)(v89 + 16) = 0;
  ((void (*)(unint64_t, _QWORD, uint64_t))v98)(v89, v97, v0);
  return v95;
}

void sub_23116CFDC()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_254150678)
  {
    sub_231168268(255, &qword_254150668);
    sub_23116D04C();
    v0 = sub_23116D22C();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_254150678);
  }
}

unint64_t sub_23116D04C()
{
  unint64_t result;
  uint64_t v1;

  result = qword_254150670;
  if (!qword_254150670)
  {
    v1 = sub_231168268(255, &qword_254150668);
    result = MEMORY[0x2348D4FB8](MEMORY[0x24BEE5BD8], v1);
    atomic_store(result, (unint64_t *)&qword_254150670);
  }
  return result;
}

uint64_t type metadata accessor for ResourceBundleClass()
{
  return objc_opt_self();
}

uint64_t sub_23116D0C4()
{
  return MEMORY[0x24BDCC6D8]();
}

uint64_t sub_23116D0D0()
{
  return MEMORY[0x24BE47298]();
}

uint64_t sub_23116D0DC()
{
  return MEMORY[0x24BE47988]();
}

uint64_t sub_23116D0E8()
{
  return MEMORY[0x24BE479B8]();
}

uint64_t sub_23116D0F4()
{
  return MEMORY[0x24BE3F938]();
}

uint64_t sub_23116D100()
{
  return MEMORY[0x24BE3F9B0]();
}

uint64_t sub_23116D10C()
{
  return MEMORY[0x24BE3F9B8]();
}

uint64_t sub_23116D118()
{
  return MEMORY[0x24BE3F9C0]();
}

uint64_t sub_23116D124()
{
  return MEMORY[0x24BE3F9D8]();
}

uint64_t sub_23116D130()
{
  return MEMORY[0x24BE3F9E0]();
}

uint64_t sub_23116D13C()
{
  return MEMORY[0x24BE3F840]();
}

uint64_t sub_23116D148()
{
  return MEMORY[0x24BE3F858]();
}

uint64_t sub_23116D154()
{
  return MEMORY[0x24BE484C8]();
}

uint64_t sub_23116D160()
{
  return MEMORY[0x24BEE78A8]();
}

uint64_t sub_23116D16C()
{
  return MEMORY[0x24BEE78D8]();
}

uint64_t sub_23116D178()
{
  return MEMORY[0x24BDCF9E0]();
}

uint64_t sub_23116D184()
{
  return MEMORY[0x24BEE09F0]();
}

uint64_t sub_23116D190()
{
  return MEMORY[0x24BEE0B20]();
}

uint64_t sub_23116D19C()
{
  return MEMORY[0x24BEE0C10]();
}

uint64_t sub_23116D1A8()
{
  return MEMORY[0x24BEE1120]();
}

uint64_t sub_23116D1B4()
{
  return MEMORY[0x24BEE1128]();
}

uint64_t sub_23116D1C0()
{
  return MEMORY[0x24BEE1250]();
}

uint64_t sub_23116D1CC()
{
  return MEMORY[0x24BEE7910]();
}

uint64_t sub_23116D1D8()
{
  return MEMORY[0x24BEE7928]();
}

uint64_t sub_23116D1E4()
{
  return MEMORY[0x24BDD2530]();
}

uint64_t sub_23116D1F0()
{
  return MEMORY[0x24BEE5BB8]();
}

uint64_t sub_23116D1FC()
{
  return MEMORY[0x24BEE5BC0]();
}

uint64_t sub_23116D208()
{
  return MEMORY[0x24BEE1F00]();
}

uint64_t sub_23116D214()
{
  return MEMORY[0x24BEE1F48]();
}

uint64_t sub_23116D220()
{
  return MEMORY[0x24BEE24D0]();
}

uint64_t sub_23116D22C()
{
  return MEMORY[0x24BEE24D8]();
}

uint64_t sub_23116D238()
{
  return MEMORY[0x24BEE2518]();
}

uint64_t sub_23116D244()
{
  return MEMORY[0x24BEE2658]();
}

uint64_t sub_23116D250()
{
  return MEMORY[0x24BEE2838]();
}

uint64_t sub_23116D25C()
{
  return MEMORY[0x24BEE2F40]();
}

uint64_t sub_23116D268()
{
  return MEMORY[0x24BEE3068]();
}

uint64_t sub_23116D274()
{
  return MEMORY[0x24BEE30B0]();
}

uint64_t sub_23116D280()
{
  return MEMORY[0x24BEE3290]();
}

uint64_t sub_23116D28C()
{
  return MEMORY[0x24BEE3598]();
}

uint64_t sub_23116D298()
{
  return MEMORY[0x24BEE3A30]();
}

uint64_t sub_23116D2A4()
{
  return MEMORY[0x24BEE42E0]();
}

uint64_t sub_23116D2B0()
{
  return MEMORY[0x24BEE4328]();
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

uint64_t swift_arrayInitWithCopy()
{
  return MEMORY[0x24BEE4BA0]();
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

uint64_t swift_getExistentialTypeMetadata()
{
  return MEMORY[0x24BEE4D28]();
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

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x24BEE4E20]();
}

uint64_t swift_initStackObject()
{
  return MEMORY[0x24BEE4E48]();
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

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x24BEE4F70]();
}

