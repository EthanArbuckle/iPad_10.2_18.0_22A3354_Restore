uint64_t objectdestroy_14Tm()
{
  uint64_t v0;

  swift_release();
  swift_release();
  return swift_deallocObject();
}

uint64_t block_destroy_helper()
{
  return swift_release();
}

uint64_t block_destroy_helper_0()
{
  return swift_release();
}

uint64_t block_copy_helper(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_copy_helper_0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t __swift_memcpy9_8(uint64_t result, uint64_t *a2)
{
  uint64_t v2;

  v2 = *a2;
  *(_BYTE *)(result + 8) = *((_BYTE *)a2 + 8);
  *(_QWORD *)result = v2;
  return result;
}

uint64_t UserDomainConceptChangeProvider.udcChangesSubject.getter()
{
  return swift_retain();
}

char *UserDomainConceptChangeProvider.__allocating_init(conceptStore:)(void *a1)
{
  objc_class *v1;
  id v3;

  v3 = objc_allocWithZone(v1);
  return UserDomainConceptChangeProvider.init(conceptStore:)(a1);
}

char *UserDomainConceptChangeProvider.init(conceptStore:)(void *a1)
{
  char *v1;
  uint64_t v3;
  char *v4;
  id v5;
  char *v6;
  void *v7;
  char *v8;
  id v9;
  objc_super v11;
  uint64_t v12;
  char v13;

  v3 = OBJC_IVAR____TtC28HealthRecordsConceptsSupport31UserDomainConceptChangeProvider_udcChangesSubject;
  v12 = 0;
  v13 = 3;
  sub_1BC0CFC94();
  swift_allocObject();
  v4 = v1;
  *(_QWORD *)&v1[v3] = sub_1BC0D9AC8();
  *(_QWORD *)&v4[OBJC_IVAR____TtC28HealthRecordsConceptsSupport31UserDomainConceptChangeProvider_udcStore] = a1;
  v5 = a1;

  v11.receiver = v4;
  v11.super_class = (Class)type metadata accessor for UserDomainConceptChangeProvider();
  v6 = (char *)objc_msgSendSuper2(&v11, sel_init);
  v7 = *(void **)&v6[OBJC_IVAR____TtC28HealthRecordsConceptsSupport31UserDomainConceptChangeProvider_udcStore];
  v8 = v6;
  v9 = v7;
  objc_msgSend(v9, sel_setDelegate_, v8);

  return v8;
}

void sub_1BC0CFC94()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_1ED6B4F78)
  {
    v0 = sub_1BC0D9ABC();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_1ED6B4F78);
  }
}

uint64_t type metadata accessor for UserDomainConceptChangeProvider()
{
  return objc_opt_self();
}

char *UserDomainConceptChangeProvider.__allocating_init(with:)(void *a1)
{
  id v2;
  id v3;
  char *v4;

  v2 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0CB6D40]), sel_initWithHealthStore_, a1);
  v3 = objc_allocWithZone((Class)type metadata accessor for UserDomainConceptChangeProvider());
  v4 = UserDomainConceptChangeProvider.init(conceptStore:)(v2);

  return v4;
}

uint64_t sub_1BC0CFD78()
{
  return sub_1BC0CFDA0();
}

uint64_t sub_1BC0CFD88()
{
  return sub_1BC0CFDA0();
}

uint64_t sub_1BC0CFD98()
{
  return sub_1BC0CFDA0();
}

uint64_t sub_1BC0CFDA0()
{
  swift_bridgeObjectRetain();
  return sub_1BC0D9AB0();
}

uint64_t sub_1BC0CFDEC(void *a1, uint64_t a2, void *a3)
{
  id v5;
  id v6;

  sub_1BC0D01A8();
  sub_1BC0D9C18();
  v5 = a3;
  v6 = a1;
  swift_bridgeObjectRetain();
  sub_1BC0D9AB0();

  return swift_bridgeObjectRelease();
}

id UserDomainConceptChangeProvider.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

void UserDomainConceptChangeProvider.init()()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

id UserDomainConceptChangeProvider.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for UserDomainConceptChangeProvider();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t initializeBufferWithCopyOfBuffer for UserDomainConceptChange(uint64_t a1, uint64_t a2)
{
  char v3;

  v3 = *(_BYTE *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_BYTE *)(a1 + 8) = v3;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t destroy for UserDomainConceptChange()
{
  return swift_bridgeObjectRelease();
}

uint64_t assignWithCopy for UserDomainConceptChange(uint64_t a1, uint64_t a2)
{
  char v3;

  v3 = *(_BYTE *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_BYTE *)(a1 + 8) = v3;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t assignWithTake for UserDomainConceptChange(uint64_t a1, uint64_t a2)
{
  char v3;

  v3 = *(_BYTE *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_BYTE *)(a1 + 8) = v3;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for UserDomainConceptChange(uint64_t a1, unsigned int a2)
{
  unsigned int v3;
  int v4;

  if (!a2)
    return 0;
  if (a2 >= 0xFD && *(_BYTE *)(a1 + 9))
    return (*(_DWORD *)a1 + 253);
  v3 = *(unsigned __int8 *)(a1 + 8);
  if (v3 <= 3)
    v4 = -1;
  else
    v4 = v3 ^ 0xFF;
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for UserDomainConceptChange(uint64_t result, unsigned int a2, unsigned int a3)
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

uint64_t sub_1BC0D0070(uint64_t a1)
{
  if (*(unsigned __int8 *)(a1 + 8) <= 2u)
    return *(unsigned __int8 *)(a1 + 8);
  else
    return (*(_DWORD *)a1 + 3);
}

uint64_t sub_1BC0D008C(uint64_t result, unsigned int a2)
{
  if (a2 >= 3)
  {
    *(_QWORD *)result = a2 - 3;
    LOBYTE(a2) = 3;
  }
  *(_BYTE *)(result + 8) = a2;
  return result;
}

ValueMetadata *type metadata accessor for UserDomainConceptChange()
{
  return &type metadata for UserDomainConceptChange;
}

uint64_t method lookup function for UserDomainConceptChangeProvider()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of UserDomainConceptChangeProvider.__allocating_init(conceptStore:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 96))();
}

uint64_t dispatch thunk of UserDomainConceptChangeProvider.userDomainConceptStore(_:didAdd:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x68))();
}

uint64_t dispatch thunk of UserDomainConceptChangeProvider.userDomainConceptStore(_:didUpdate:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x70))();
}

uint64_t dispatch thunk of UserDomainConceptChangeProvider.userDomainConceptStore(_:didDelete:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x78))();
}

void type metadata accessor for HKListUserDomainType()
{
  unint64_t ForeignTypeMetadata;
  uint64_t v1;

  if (!qword_1ED6B4C00)
  {
    ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v1)
      atomic_store(ForeignTypeMetadata, (unint64_t *)&qword_1ED6B4C00);
  }
}

unint64_t sub_1BC0D01A8()
{
  unint64_t result;

  result = qword_1ED6B4F28;
  if (!qword_1ED6B4F28)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_1ED6B4F28);
  }
  return result;
}

id ListConceptManagerState.listUDC.getter()
{
  id *v0;
  id v1;
  id v2;

  v1 = *v0;
  v2 = *v0;
  return v1;
}

uint64_t ListConceptManagerState.listType.getter()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + 8);
}

uint64_t ListConceptManagerState.listName.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 16);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t ListConceptManagerState.concepts.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t ListConceptManagerState.listItems.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t ListConceptManagerState.nonlistItems.getter()
{
  return swift_bridgeObjectRetain();
}

__n128 ListConceptManagerState.init(concepts:list:)@<Q0>(id a1@<X1>, unint64_t a2@<X0>, uint64_t a3@<X8>)
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char v13;
  __n128 result;
  __int128 v15;
  _OWORD v16[3];
  uint64_t v17;
  char v18;

  v6 = objc_msgSend(a1, sel_listType);
  v7 = objc_msgSend(a1, sel_listName);
  if (v7)
  {
    v8 = v7;
    v9 = sub_1BC0D9BAC();
    v11 = v10;

  }
  else
  {
    v9 = 0;
    v11 = 0;
  }
  sub_1BC0D032C(a2, a1, (uint64_t)v6, v9, v11, 0, (uint64_t)v16);
  v12 = v17;
  v13 = v18;
  v15 = v16[1];
  result = (__n128)v16[2];
  *(_OWORD *)a3 = v16[0];
  *(_OWORD *)(a3 + 16) = v15;
  *(__n128 *)(a3 + 32) = result;
  *(_QWORD *)(a3 + 48) = v12;
  *(_BYTE *)(a3 + 56) = v13;
  return result;
}

void sub_1BC0D032C(unint64_t a1@<X0>, void *a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, char a6@<W5>, uint64_t a7@<X8>)
{
  id v14;
  id v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  char v19;
  id v20;
  unint64_t v21;
  uint64_t v22;
  id v23;
  uint64_t v24;
  uint64_t v25;

  if (a2)
  {
    v14 = a2;
    v15 = objc_msgSend(v14, sel_linkCollection);
    if (v15)
    {
      v16 = v15;
      v25 = a3;
      v17 = a4;
      v18 = a5;
      v19 = a6;
      v20 = objc_msgSend(v15, sel_links);

      sub_1BC0D7D28(0, &qword_1ED6B4F68);
      v21 = sub_1BC0D9C18();

      a6 = v19;
      a5 = v18;
      a4 = v17;
      a3 = v25;
      swift_bridgeObjectRetain();
      v22 = sub_1BC0D6B10(v21, a1);

      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
    }
    else
    {

      v22 = MEMORY[0x1E0DEE9D8];
    }
    v23 = v14;
    swift_bridgeObjectRetain();
    v24 = sub_1BC0D06B0(a1);
    swift_bridgeObjectRelease();

    a1 = v24;
  }
  else
  {
    v22 = MEMORY[0x1E0DEE9D8];
  }
  swift_bridgeObjectRetain_n();
  swift_bridgeObjectRetain();
  sub_1BC0D5610(a1);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  *(_QWORD *)a7 = a2;
  *(_QWORD *)(a7 + 8) = a3;
  *(_QWORD *)(a7 + 16) = a4;
  *(_QWORD *)(a7 + 24) = a5;
  *(_QWORD *)(a7 + 32) = v22;
  *(_QWORD *)(a7 + 40) = v22;
  *(_QWORD *)(a7 + 48) = a1;
  *(_BYTE *)(a7 + 56) = a6 & 1;
}

uint64_t ListConceptManagerState.init(concepts:listType:listName:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t v10;
  unint64_t v11;
  uint64_t result;
  uint64_t v13;

  v10 = MEMORY[0x1E0DEE9D8];
  v13 = MEMORY[0x1E0DEE9D8];
  v11 = swift_bridgeObjectRetain();
  result = sub_1BC0D5610(v11);
  *(_QWORD *)a5 = 0;
  *(_QWORD *)(a5 + 8) = a2;
  *(_QWORD *)(a5 + 16) = a3;
  *(_QWORD *)(a5 + 24) = a4;
  *(_QWORD *)(a5 + 32) = v13;
  *(_QWORD *)(a5 + 40) = v10;
  *(_QWORD *)(a5 + 48) = a1;
  *(_BYTE *)(a5 + 56) = 0;
  return result;
}

uint64_t HKListUserDomainConcept.linkElements<A>(from:)()
{
  void *v0;
  id v1;
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;

  v1 = objc_msgSend(v0, sel_linkCollection);
  if (!v1)
    return sub_1BC0D9C48();
  v2 = v1;
  v3 = objc_msgSend(v1, sel_links);

  sub_1BC0D7D28(0, &qword_1ED6B4F68);
  sub_1BC0D9C18();

  MEMORY[0x1E0C80A78](v4);
  sub_1BC0D776C(0, &qword_1ED6B4BF0, &qword_1ED6B4F68, 0x1E0CB6CF8, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0DEAEC8]);
  sub_1BC0D57E0();
  v5 = sub_1BC0D9BDC();
  swift_bridgeObjectRelease();
  return v5;
}

uint64_t sub_1BC0D06B0(unint64_t a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  char *v6;
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
  id v20;
  unint64_t v21;
  void *v22;
  id v23;
  unint64_t v24;
  uint64_t v25;
  uint64_t result;
  uint64_t v27;
  id v28;
  void *v29;
  id v30;
  void (*v31)(char *, char *, uint64_t);
  char *v32;
  unint64_t v33;
  unint64_t v34;
  char *v35;
  unint64_t v36;
  uint64_t v37;
  unint64_t v38;
  uint64_t v39;
  unint64_t v40;
  char *v41;
  BOOL v42;
  uint64_t v43;
  id v44;
  uint64_t v45;
  uint64_t v46;
  void (*v47)(char *, uint64_t, uint64_t);
  void (*v48)(char *, uint64_t, uint64_t, uint64_t);
  char v49;
  unint64_t v50;
  uint64_t v51;
  id v52;
  id v53;
  void *v54;
  char v55;
  uint64_t v56;
  char v57;
  uint64_t v58;
  uint64_t v59;
  char v60;
  id v61;
  char v62;
  uint64_t v63;
  uint64_t v64;
  id v65;
  char v66;
  uint64_t v67;
  uint64_t v68;
  unint64_t v69;
  uint64_t v70;
  unint64_t v71;
  char *v72;
  unint64_t v73;
  uint64_t v74;
  char *v75;
  unint64_t v76;
  char *v77;
  unint64_t v78;

  v69 = a1;
  sub_1BC0D5848(0, &qword_1ED6B4BD8, (uint64_t (*)(uint64_t))MEMORY[0x1E0CB0998], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0DEB940]);
  v2 = ((uint64_t (*)(void))MEMORY[0x1E0C80A78])();
  v4 = (char *)&v67 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v2);
  v6 = (char *)&v67 - v5;
  v7 = sub_1BC0D9A2C();
  v8 = *(_QWORD *)(v7 - 8);
  v9 = MEMORY[0x1E0C80A78](v7);
  v75 = (char *)&v67 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = MEMORY[0x1E0C80A78](v9);
  v13 = (char *)&v67 - v12;
  v14 = MEMORY[0x1E0C80A78](v11);
  v72 = (char *)&v67 - v15;
  v16 = MEMORY[0x1E0C80A78](v14);
  v18 = (char *)&v67 - v17;
  MEMORY[0x1E0C80A78](v16);
  v77 = (char *)&v67 - v19;
  v20 = objc_msgSend(v1, sel_linkCollection);
  v21 = MEMORY[0x1E0DEE9D8];
  if (v20)
  {
    v22 = v20;
    v23 = objc_msgSend(v20, sel_links);

    sub_1BC0D7D28(0, &qword_1ED6B4F68);
    v24 = sub_1BC0D9C18();

    if (v24 >> 62)
    {
      swift_bridgeObjectRetain();
      result = sub_1BC0D9D68();
      v25 = result;
      if (result)
        goto LABEL_4;
    }
    else
    {
      v25 = *(_QWORD *)((v24 & 0xFFFFFFFFFFFFF8) + 0x10);
      result = swift_bridgeObjectRetain();
      if (v25)
      {
LABEL_4:
        if (v25 < 1)
        {
          __break(1u);
          return result;
        }
        v27 = 0;
        v76 = MEMORY[0x1E0DEE9D8];
        v73 = v24 & 0xC000000000000001;
        v74 = v25;
        v71 = v24;
        do
        {
          if (v73)
            v28 = (id)MEMORY[0x1BCCEB248](v27, v24);
          else
            v28 = *(id *)(v24 + 8 * v27 + 32);
          v29 = v28;
          v30 = objc_msgSend(v28, sel_targetUUID);
          sub_1BC0D9A20();

          v31 = *(void (**)(char *, char *, uint64_t))(v8 + 32);
          v31(v4, v13, v7);
          (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v8 + 56))(v4, 0, 1, v7);

          if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48))(v4, 1, v7) == 1)
          {
            sub_1BC0D7AAC((uint64_t)v4, &qword_1ED6B4BD8, (uint64_t (*)(uint64_t))MEMORY[0x1E0CB0998]);
          }
          else
          {
            v32 = v72;
            v31(v72, v4, v7);
            v31(v75, v32, v7);
            if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
              v76 = sub_1BC0D4D9C(0, *(_QWORD *)(v76 + 16) + 1, 1, v76);
            v34 = *(_QWORD *)(v76 + 16);
            v33 = *(_QWORD *)(v76 + 24);
            if (v34 >= v33 >> 1)
              v76 = sub_1BC0D4D9C(v33 > 1, v34 + 1, 1, v76);
            v35 = v75;
            v36 = v76;
            *(_QWORD *)(v76 + 16) = v34 + 1;
            v31((char *)(v36+ ((*(unsigned __int8 *)(v8 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80))+ *(_QWORD *)(v8 + 72) * v34), v35, v7);
            v24 = v71;
          }
          ++v27;
        }
        while (v74 != v27);
        goto LABEL_20;
      }
    }
    v76 = MEMORY[0x1E0DEE9D8];
LABEL_20:
    swift_bridgeObjectRelease_n();
    v21 = MEMORY[0x1E0DEE9D8];
    goto LABEL_21;
  }
  v76 = MEMORY[0x1E0DEE9D8];
LABEL_21:
  v78 = v21;
  if (v69 >> 62)
    goto LABEL_74;
  v37 = *(_QWORD *)((v69 & 0xFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  for (; v37; v37 = sub_1BC0D9D68())
  {
    v38 = 0;
    v39 = *(_QWORD *)(v76 + 16);
    v71 = v37;
    v72 = (char *)(v69 & 0xC000000000000001);
    v67 = v69 + 32;
    v68 = v69 & 0xFFFFFFFFFFFFFF8;
    v70 = v39;
    while (1)
    {
      if (v72)
      {
        v41 = (char *)MEMORY[0x1BCCEB248](v38, v69);
        v42 = __OFADD__(v38, 1);
        v43 = v38 + 1;
        if (v42)
          goto LABEL_70;
      }
      else
      {
        if (v38 >= *(_QWORD *)(v68 + 16))
          goto LABEL_71;
        v41 = (char *)*(id *)(v67 + 8 * v38);
        v42 = __OFADD__(v38, 1);
        v43 = v38 + 1;
        if (v42)
        {
LABEL_70:
          __break(1u);
LABEL_71:
          __break(1u);
LABEL_72:
          __break(1u);
          goto LABEL_73;
        }
      }
      v74 = v43;
      v75 = v41;
      v44 = objc_msgSend(v41, sel_UUID, v67);
      sub_1BC0D9A20();

      if (v39)
      {
        v45 = v76 + ((*(unsigned __int8 *)(v8 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80));
        swift_bridgeObjectRetain();
        v46 = *(_QWORD *)(v8 + 72);
        v47 = *(void (**)(char *, uint64_t, uint64_t))(v8 + 16);
        while (1)
        {
          v47(v6, v45, v7);
          v48 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v8 + 56);
          v48(v6, 0, 1, v7);
          if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48))(v6, 1, v7) == 1)
            break;
          (*(void (**)(char *, char *, uint64_t))(v8 + 32))(v18, v6, v7);
          sub_1BC0D7CDC(&qword_1ED6B4BD0, (uint64_t (*)(uint64_t))MEMORY[0x1E0CB0998], MEMORY[0x1E0CB09D0]);
          v49 = sub_1BC0D9B94();
          (*(void (**)(char *, uint64_t))(v8 + 8))(v18, v7);
          if ((v49 & 1) != 0)
          {
LABEL_24:

            goto LABEL_25;
          }
          v45 += v46;
          if (!--v39)
            goto LABEL_40;
        }
      }
      else
      {
        swift_bridgeObjectRetain();
        v48 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v8 + 56);
LABEL_40:
        v48(v6, 1, 1, v7);
      }
      swift_bridgeObjectRelease();
      v50 = v78;
      if (v78 >> 62)
      {
        swift_bridgeObjectRetain();
        v51 = sub_1BC0D9D68();
        v52 = v75;
        if (!v51)
          goto LABEL_48;
      }
      else
      {
        v51 = *(_QWORD *)((v78 & 0xFFFFFFFFFFFFF8) + 0x10);
        swift_bridgeObjectRetain();
        v52 = v75;
        if (!v51)
          goto LABEL_48;
      }
      v73 = v51;
      if ((v50 & 0xC000000000000001) != 0)
        v53 = (id)MEMORY[0x1BCCEB248](0, v50);
      else
        v53 = *(id *)(v50 + 32);
      v54 = v53;
      sub_1BC0D7D28(0, (unint64_t *)&qword_1ED6B4F28);
      v55 = sub_1BC0D9CC0();

      if ((v55 & 1) != 0)
      {
LABEL_46:

LABEL_25:
        swift_bridgeObjectRelease();
        v39 = v70;
        v40 = v71;
        v38 = v74;
        goto LABEL_26;
      }
      if (v73 != 1)
      {
        if ((v50 & 0xC000000000000001) != 0)
        {
          MEMORY[0x1BCCEB248](1, v50);
          v57 = sub_1BC0D9CC0();
          swift_unknownObjectRelease();
          if ((v57 & 1) != 0)
            goto LABEL_46;
          if (v73 != 2)
          {
            v58 = 2;
            while (1)
            {
              MEMORY[0x1BCCEB248](v58, v50);
              v59 = v58 + 1;
              if (__OFADD__(v58, 1))
                goto LABEL_72;
              v60 = sub_1BC0D9CC0();
              swift_unknownObjectRelease();
              if ((v60 & 1) != 0)
                goto LABEL_24;
              ++v58;
              if (v59 == v73)
                goto LABEL_48;
            }
          }
          goto LABEL_48;
        }
        v61 = *(id *)(v50 + 40);
        v62 = sub_1BC0D9CC0();

        if ((v62 & 1) != 0)
          goto LABEL_46;
        if (v73 != 2)
          break;
      }
LABEL_48:
      v56 = swift_bridgeObjectRelease();
      MEMORY[0x1BCCEB11C](v56);
      v39 = v70;
      v40 = v71;
      v38 = v74;
      if (*(_QWORD *)((v78 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v78 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
        sub_1BC0D9C3C();
      sub_1BC0D9C60();
      sub_1BC0D9C24();
LABEL_26:
      (*(void (**)(char *, uint64_t))(v8 + 8))(v77, v7);
      if (v38 == v40)
        goto LABEL_75;
    }
    v63 = 6;
    while (1)
    {
      v64 = v63 - 3;
      if (__OFADD__(v63 - 4, 1))
        break;
      v65 = *(id *)(v50 + 8 * v63);
      v66 = sub_1BC0D9CC0();

      if ((v66 & 1) != 0)
        goto LABEL_24;
      ++v63;
      if (v64 == v73)
        goto LABEL_48;
    }
LABEL_73:
    __break(1u);
LABEL_74:
    swift_bridgeObjectRetain();
  }
LABEL_75:
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v78;
}

uint64_t HKListUserDomainConcept.nonlinkElements<A>(from:)(uint64_t a1, uint64_t a2)
{
  void *v2;
  void *v3;
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
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  uint64_t v22;
  char *v23;
  uint64_t v24;
  id v25;
  void *v26;
  id v27;
  unint64_t v28;
  uint64_t v29;
  uint64_t result;
  unint64_t v31;
  uint64_t v32;
  uint64_t v33;
  id v34;
  void *v35;
  id v36;
  void (*v37)(char *, char *, uint64_t);
  char *v38;
  unint64_t v39;
  unint64_t v40;
  unint64_t v41;
  uint64_t v42;
  unint64_t v43;
  char *v44;
  uint64_t v45;
  char v46;
  id v47;
  BOOL v48;
  unint64_t v49;
  id v50;
  char *v51;
  uint64_t v52;
  uint64_t v53;
  void (*v54)(char *, uint64_t, uint64_t);
  void (*v55)(char *, uint64_t, uint64_t, uint64_t);
  char *v56;
  char v57;
  void (*v58)(char *, uint64_t);
  id v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  char *v64;
  uint64_t v65;
  uint64_t v66;
  unint64_t v67;
  id v68;
  unint64_t v69;
  char *v70;
  char *v71;
  char *v72;
  id v73;
  uint64_t v74;
  uint64_t v75;

  v3 = v2;
  sub_1BC0D5848(0, &qword_1ED6B4BD8, (uint64_t (*)(uint64_t))MEMORY[0x1E0CB0998], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0DEB940]);
  v7 = MEMORY[0x1E0C80A78](v6);
  v9 = (char *)&v62 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v7);
  v11 = (char *)&v62 - v10;
  v12 = sub_1BC0D9A2C();
  v13 = *(_QWORD *)(v12 - 8);
  v14 = MEMORY[0x1E0C80A78](v12);
  v70 = (char *)&v62 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = MEMORY[0x1E0C80A78](v14);
  v72 = (char *)&v62 - v17;
  v18 = MEMORY[0x1E0C80A78](v16);
  v20 = (char *)&v62 - v19;
  v21 = MEMORY[0x1E0C80A78](v18);
  v23 = (char *)&v62 - v22;
  MEMORY[0x1E0C80A78](v21);
  v64 = (char *)&v62 - v24;
  v25 = objc_msgSend(v3, sel_linkCollection);
  v71 = v9;
  v65 = a1;
  v66 = a2;
  if (v25)
  {
    v26 = v25;
    v27 = objc_msgSend(v25, sel_links);

    sub_1BC0D7D28(0, &qword_1ED6B4F68);
    v28 = sub_1BC0D9C18();

    v67 = v28;
    if (v28 >> 62)
    {
      swift_bridgeObjectRetain();
      result = sub_1BC0D9D68();
      v29 = result;
      if (result)
        goto LABEL_4;
    }
    else
    {
      v29 = *(_QWORD *)((v28 & 0xFFFFFFFFFFFFF8) + 0x10);
      result = swift_bridgeObjectRetain();
      if (v29)
      {
LABEL_4:
        v31 = v67;
        if (v29 < 1)
        {
          __break(1u);
          return result;
        }
        v32 = 0;
        v68 = (id)(v67 & 0xC000000000000001);
        v69 = MEMORY[0x1E0DEE9D8];
        v33 = v29;
        do
        {
          if (v68)
            v34 = (id)MEMORY[0x1BCCEB248](v32, v31);
          else
            v34 = *(id *)(v31 + 8 * v32 + 32);
          v35 = v34;
          v36 = objc_msgSend(v34, sel_targetUUID);
          sub_1BC0D9A20();

          v37 = *(void (**)(char *, char *, uint64_t))(v13 + 32);
          v37(v11, v23, v12);
          (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v13 + 56))(v11, 0, 1, v12);

          if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v13 + 48))(v11, 1, v12) == 1)
          {
            sub_1BC0D7AAC((uint64_t)v11, &qword_1ED6B4BD8, (uint64_t (*)(uint64_t))MEMORY[0x1E0CB0998]);
          }
          else
          {
            v38 = v64;
            v37(v64, v11, v12);
            v37(v20, v38, v12);
            if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
              v69 = sub_1BC0D4D9C(0, *(_QWORD *)(v69 + 16) + 1, 1, v69);
            v40 = *(_QWORD *)(v69 + 16);
            v39 = *(_QWORD *)(v69 + 24);
            if (v40 >= v39 >> 1)
              v69 = sub_1BC0D4D9C(v39 > 1, v40 + 1, 1, v69);
            v41 = v69;
            *(_QWORD *)(v69 + 16) = v40 + 1;
            v37((char *)(v41+ ((*(unsigned __int8 *)(v13 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v13 + 80))+ *(_QWORD *)(v13 + 72) * v40), v20, v12);
            v31 = v67;
          }
          ++v32;
        }
        while (v33 != v32);
        goto LABEL_20;
      }
    }
    v69 = MEMORY[0x1E0DEE9D8];
LABEL_20:
    swift_bridgeObjectRelease_n();
    a1 = v65;
    a2 = v66;
    v9 = v71;
    goto LABEL_21;
  }
  v69 = MEMORY[0x1E0DEE9D8];
LABEL_21:
  v75 = sub_1BC0D9B88();
  v42 = swift_bridgeObjectRetain();
  if (!MEMORY[0x1BCCEB194](v42, a2))
    goto LABEL_42;
  v43 = 0;
  v44 = *(char **)(v69 + 16);
  v63 = a1 + 32;
  v64 = v44;
  while (1)
  {
    v46 = sub_1BC0D9C54();
    sub_1BC0D9C30();
    if ((v46 & 1) == 0)
      break;
    v47 = *(id *)(v63 + 8 * v43);
    v48 = __OFADD__(v43, 1);
    v49 = v43 + 1;
    if (v48)
      goto LABEL_41;
LABEL_27:
    v67 = v49;
    v68 = v47;
    v50 = objc_msgSend(v47, sel_UUID);
    sub_1BC0D9A20();

    v51 = v64;
    if (v64)
    {
      v52 = v69 + ((*(unsigned __int8 *)(v13 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v13 + 80));
      swift_bridgeObjectRetain();
      v53 = *(_QWORD *)(v13 + 72);
      v54 = *(void (**)(char *, uint64_t, uint64_t))(v13 + 16);
      while (1)
      {
        v54(v9, v52, v12);
        v55 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v13 + 56);
        v55(v9, 0, 1, v12);
        if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v13 + 48))(v9, 1, v12) == 1)
          break;
        v56 = v70;
        (*(void (**)(char *, char *, uint64_t))(v13 + 32))(v70, v9, v12);
        sub_1BC0D7CDC(&qword_1ED6B4BD0, (uint64_t (*)(uint64_t))MEMORY[0x1E0CB0998], MEMORY[0x1E0CB09D0]);
        v57 = sub_1BC0D9B94();
        v58 = *(void (**)(char *, uint64_t))(v13 + 8);
        v58(v56, v12);
        if ((v57 & 1) != 0)
        {

          swift_bridgeObjectRelease();
          v45 = v65;
          v60 = v66;
          goto LABEL_38;
        }
        v52 += v53;
        --v51;
        v9 = v71;
        if (!v51)
          goto LABEL_34;
      }
    }
    else
    {
      swift_bridgeObjectRetain();
      v55 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v13 + 56);
LABEL_34:
      v55(v9, 1, 1, v12);
    }
    swift_bridgeObjectRelease();
    v59 = v68;
    v73 = v68;
    v74 = v75;
    v60 = v66;
    v61 = sub_1BC0D9C84();
    MEMORY[0x1BCCEB5FC](MEMORY[0x1E0DEAF38], v61);
    MEMORY[0x1BCCEB5FC](MEMORY[0x1E0DEFD00], v60);
    if ((sub_1BC0D9BF4() & 1) != 0)
    {

      v58 = *(void (**)(char *, uint64_t))(v13 + 8);
      v45 = v65;
LABEL_38:
      v43 = v67;
      v58(v72, v12);
      v9 = v71;
    }
    else
    {
      v74 = (uint64_t)v59;
      sub_1BC0D9C6C();
      (*(void (**)(char *, uint64_t))(v13 + 8))(v72, v12);
      v45 = v65;
      v43 = v67;
    }
    if (v43 == MEMORY[0x1BCCEB194](v45, v60))
      goto LABEL_42;
  }
  v47 = (id)sub_1BC0D9D20();
  v48 = __OFADD__(v43, 1);
  v49 = v43 + 1;
  if (!v48)
    goto LABEL_27;
LABEL_41:
  __break(1u);
LABEL_42:
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v75;
}

double sub_1BC0D1574()
{
  uint64_t v0;
  double result;
  uint64_t v2;

  v0 = MEMORY[0x1E0DEE9D8];
  v2 = MEMORY[0x1E0DEE9D8];
  sub_1BC0D5610(MEMORY[0x1E0DEE9D8]);
  result = 0.0;
  xmmword_1EF3EF9F0 = 0u;
  *(_OWORD *)&qword_1EF3EFA00 = 0u;
  qword_1EF3EFA10 = v2;
  unk_1EF3EFA18 = v0;
  qword_1EF3EFA20 = v0;
  byte_1EF3EFA28 = 0;
  return result;
}

id static ListConceptManagerState.empty.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char v7;
  void *v8;
  id v10;

  if (qword_1EF3EF900 != -1)
    swift_once();
  v3 = qword_1EF3EFA00;
  v2 = unk_1EF3EFA08;
  v4 = qword_1EF3EFA10;
  v5 = unk_1EF3EFA18;
  v6 = qword_1EF3EFA20;
  v7 = byte_1EF3EFA28;
  v8 = (void *)xmmword_1EF3EF9F0;
  *(_OWORD *)a1 = xmmword_1EF3EF9F0;
  *(_QWORD *)(a1 + 16) = v3;
  *(_QWORD *)(a1 + 24) = v2;
  *(_QWORD *)(a1 + 32) = v4;
  *(_QWORD *)(a1 + 40) = v5;
  *(_QWORD *)(a1 + 48) = v6;
  *(_BYTE *)(a1 + 56) = v7;
  v10 = v8;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return v10;
}

double sub_1BC0D1678()
{
  uint64_t v0;
  double result;
  uint64_t v2;

  v0 = MEMORY[0x1E0DEE9D8];
  v2 = MEMORY[0x1E0DEE9D8];
  sub_1BC0D5610(MEMORY[0x1E0DEE9D8]);
  result = 0.0;
  xmmword_1ED6B4E00 = 0u;
  *(_OWORD *)&qword_1ED6B4E10 = 0u;
  qword_1ED6B4E20 = v2;
  unk_1ED6B4E28 = v0;
  qword_1ED6B4E30 = v0;
  byte_1ED6B4E38 = 1;
  return result;
}

uint64_t sub_1BC0D16D4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  _QWORD v8[2];

  sub_1BC0D5BB8();
  v2 = v1;
  v3 = *(_QWORD *)(v1 - 8);
  MEMORY[0x1E0C80A78](v1);
  v5 = (char *)v8 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8[1] = *(_QWORD *)(v0 + 40);
  sub_1BC0D7C38(0, &qword_1ED6B4EA0);
  sub_1BC0D5C48(&qword_1ED6B4F58, &qword_1ED6B4EA0);
  swift_retain();
  sub_1BC0D9B28();
  swift_release();
  sub_1BC0D7CDC(&qword_1ED6B4F48, (uint64_t (*)(uint64_t))sub_1BC0D5BB8, MEMORY[0x1E0C95AD0]);
  v6 = sub_1BC0D9B10();
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  return v6;
}

BOOL sub_1BC0D1800(uint64_t a1)
{
  return (*(_BYTE *)(a1 + 56) & 1) == 0;
}

uint64_t sub_1BC0D1810@<X0>(uint64_t a1@<X8>)
{
  id v2;
  uint64_t v3;
  uint64_t v5;
  void *v6;

  sub_1BC0D9AA4();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v6)
  {
    v2 = objc_msgSend(v6, sel_UUID);

    sub_1BC0D9A20();
    v3 = sub_1BC0D9A2C();
    return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 56))(a1, 0, 1, v3);
  }
  else
  {
    v5 = sub_1BC0D9A2C();
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 56))(a1, 1, 1, v5);
  }
}

uint64_t sub_1BC0D18F0()
{
  uint64_t v1;

  sub_1BC0D9AA4();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v1;
}

BOOL sub_1BC0D1950()
{
  void *v1;
  char v2;

  sub_1BC0D9AA4();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  return (v2 & 1) == 0;
}

uint64_t sub_1BC0D19C4()
{
  return sub_1BC0D9AA4();
}

uint64_t sub_1BC0D19E4()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;

  v1 = v0[12];
  v2 = v0[13];
  __swift_project_boxed_opaque_existential_1(v0 + 9, v1);
  return (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 16))(v1, v2);
}

uint64_t sub_1BC0D1A28()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;

  v1 = v0[12];
  v2 = v0[13];
  __swift_project_boxed_opaque_existential_1(v0 + 9, v1);
  return (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 8))(v1, v2);
}

uint64_t sub_1BC0D1A6C()
{
  _QWORD *v0;
  _QWORD *v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  id v5;
  uint64_t v6;
  uint64_t v7;

  v1 = v0;
  sub_1BC0D9DB0();
  sub_1BC0D9BC4();
  swift_bridgeObjectRelease();
  sub_1BC0D9BC4();
  v2 = v0 + 9;
  v3 = v0[12];
  v4 = v0[13];
  __swift_project_boxed_opaque_existential_1(v1 + 9, v1[12]);
  (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v3, v4);
  v5 = (id)HKStringFromListUserDomainType();
  sub_1BC0D9BAC();

  sub_1BC0D9BC4();
  swift_bridgeObjectRelease();
  sub_1BC0D9BC4();
  v7 = v1[12];
  v6 = v1[13];
  __swift_project_boxed_opaque_existential_1(v2, v7);
  (*(void (**)(uint64_t, uint64_t))(v6 + 16))(v7, v6);
  sub_1BC0D9BC4();
  swift_bridgeObjectRelease();
  sub_1BC0D9BC4();
  return 91;
}

_QWORD *ListConceptManager.__allocating_init(healthStore:provider:udcChangeProvider:test_skipInitialLoad:)(void *a1, uint64_t a2, char *a3, int a4)
{
  uint64_t v4;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD *v12;

  v9 = *(_QWORD *)(a2 + 24);
  v10 = *(_QWORD *)(a2 + 32);
  v11 = __swift_mutable_project_boxed_opaque_existential_1(a2, v9);
  v12 = sub_1BC0D6F50(a1, v11, a3, a4, v4, v9, v10);
  __swift_destroy_boxed_opaque_existential_1Tm(a2);
  return v12;
}

_QWORD *ListConceptManager.init(healthStore:provider:udcChangeProvider:test_skipInitialLoad:)(void *a1, uint64_t a2, char *a3, int a4)
{
  _QWORD *v4;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  _QWORD *v15;
  uint64_t v17;

  v9 = *(_QWORD *)(a2 + 24);
  v10 = *(_QWORD *)(a2 + 32);
  v11 = __swift_mutable_project_boxed_opaque_existential_1(a2, v9);
  MEMORY[0x1E0C80A78](v11);
  v13 = (char *)&v17 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *))(v14 + 16))(v13);
  v15 = sub_1BC0D64C0(a1, (uint64_t)v13, a3, a4, v4, v9, v10);
  __swift_destroy_boxed_opaque_existential_1Tm(a2);
  return v15;
}

uint64_t sub_1BC0D1CDC()
{
  uint64_t result;

  swift_beginAccess();
  result = swift_weakLoadStrong();
  if (result)
  {
    sub_1BC0D23B8();
    return swift_release();
  }
  return result;
}

uint64_t sub_1BC0D1D30()
{
  uint64_t result;

  swift_beginAccess();
  result = swift_weakLoadStrong();
  if (result)
  {
    sub_1BC0D23B8();
    return swift_release();
  }
  return result;
}

uint64_t sub_1BC0D1D84(uint64_t a1)
{
  void (*v1)(uint64_t);
  uint64_t v2;

  v1 = *(void (**)(uint64_t))(a1 + 32);
  v2 = swift_retain();
  v1(v2);
  return swift_release();
}

uint64_t sub_1BC0D1DB0(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *a1;
  v3 = *a2;
  swift_beginAccess();
  *(_QWORD *)(v3 + 16) = v2;
  swift_retain();
  return swift_release();
}

uint64_t sub_1BC0D1E0C()
{
  swift_beginAccess();
  return swift_retain();
}

uint64_t sub_1BC0D1E40(uint64_t a1)
{
  uint64_t v1;

  swift_beginAccess();
  *(_QWORD *)(v1 + 16) = a1;
  return swift_release();
}

uint64_t (*sub_1BC0D1E84())()
{
  swift_beginAccess();
  return j__swift_endAccess;
}

uint64_t sub_1BC0D1EC4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t (*v2)(uint64_t);
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  id v10;
  void *v11;
  _QWORD v13[2];
  _QWORD aBlock[5];
  uint64_t v15;

  v1 = sub_1BC0D9B4C();
  v2 = (uint64_t (*)(uint64_t))MEMORY[0x1E0DEF4F8];
  v3 = *(_QWORD *)(v1 - 8);
  MEMORY[0x1E0C80A78](v1);
  v5 = (char *)v13 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_1BC0D9B64();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x1E0C80A78](v6);
  v9 = (char *)v13 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = sub_1BC0D2150();
  aBlock[4] = sub_1BC0D7E50;
  v15 = v0;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_1BC0D1D84;
  aBlock[3] = &block_descriptor;
  v11 = _Block_copy(aBlock);
  swift_retain();
  sub_1BC0D9B58();
  v13[1] = MEMORY[0x1E0DEE9D8];
  sub_1BC0D7CDC(&qword_1ED6B4ED0, v2, MEMORY[0x1E0DEF510]);
  sub_1BC0D5848(0, &qword_1ED6B4ED8, v2, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0DEAEC8]);
  sub_1BC0D7018();
  sub_1BC0D9CF0();
  MEMORY[0x1BCCEB1D0](0, v9, v5, v11);
  _Block_release(v11);

  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v1);
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  return swift_release();
}

uint64_t ListConceptManager.deinit()
{
  uint64_t v0;
  void (*v1)(uint64_t);
  uint64_t v2;

  v1 = *(void (**)(uint64_t))(v0 + 24);
  if (v1)
  {
    v2 = swift_retain();
    v1(v2);
    sub_1BC0D7078((uint64_t)v1);
  }
  swift_release();
  sub_1BC0D7078(*(_QWORD *)(v0 + 24));
  swift_release();

  __swift_destroy_boxed_opaque_existential_1Tm(v0 + 72);
  swift_release();
  swift_release();
  swift_release();
  return v0;
}

uint64_t ListConceptManager.__deallocating_deinit()
{
  ListConceptManager.deinit();
  return swift_deallocClassInstance();
}

id sub_1BC0D2150()
{
  uint64_t v0;
  void *v1;
  id v2;
  void *v3;
  id v4;
  void *v5;
  id v6;

  v1 = *(void **)(v0 + 48);
  if (v1)
  {
    v2 = *(id *)(v0 + 48);
  }
  else
  {
    v3 = (void *)sub_1BC0D9BA0();
    v4 = (id)HKCreateSerialDispatchQueue();

    v5 = *(void **)(v0 + 48);
    *(_QWORD *)(v0 + 48) = v4;
    v2 = v4;

    v1 = 0;
  }
  v6 = v1;
  return v2;
}

void sub_1BC0D21DC(unint64_t a1@<X0>, void *a2@<X1>, uint64_t a3@<X8>)
{
  _QWORD *v3;
  _QWORD *v4;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id *v11;
  char v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  _QWORD *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  unint64_t v30;
  void *v31;
  uint64_t v32;
  __int128 v33;
  __int128 v34;
  uint64_t v35;
  char v36;
  _OWORD v37[3];
  uint64_t v38;
  char v39;

  v4 = v3;
  v8 = sub_1BC0D9B70();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x1E0C80A78](v8);
  v11 = (id *)((char *)v37 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0));
  *v11 = sub_1BC0D2150();
  (*(void (**)(id *, _QWORD, uint64_t))(v9 + 104))(v11, *MEMORY[0x1E0DEF740], v8);
  v12 = sub_1BC0D9B7C();
  (*(void (**)(id *, uint64_t))(v9 + 8))(v11, v8);
  if ((v12 & 1) != 0)
  {
    if (a2)
    {
      swift_bridgeObjectRetain();
      v13 = a2;
      v14 = objc_msgSend(v13, sel_listType);
      v15 = objc_msgSend(v13, sel_listName);
      if (v15)
      {
        v16 = v15;
        v17 = sub_1BC0D9BAC();
        v19 = v18;

      }
      else
      {
        v17 = 0;
        v19 = 0;
      }
      v30 = a1;
      v31 = a2;
      v32 = (uint64_t)v14;
      v27 = v17;
      v29 = v19;
    }
    else
    {
      v20 = v4 + 9;
      v21 = v4[12];
      v22 = v4[13];
      __swift_project_boxed_opaque_existential_1(v4 + 9, v21);
      v23 = *(uint64_t (**)(uint64_t, uint64_t))(v22 + 8);
      swift_bridgeObjectRetain();
      v24 = v23(v21, v22);
      v26 = v4[12];
      v25 = v4[13];
      __swift_project_boxed_opaque_existential_1(v20, v26);
      v27 = (*(uint64_t (**)(uint64_t, uint64_t))(v25 + 16))(v26, v25);
      v29 = v28;
      v30 = a1;
      v31 = 0;
      v32 = v24;
    }
    sub_1BC0D032C(v30, v31, v32, v27, v29, 0, (uint64_t)v37);
    v33 = v37[1];
    v34 = v37[2];
    v35 = v38;
    v36 = v39;
    *(_OWORD *)a3 = v37[0];
    *(_OWORD *)(a3 + 16) = v33;
    *(_OWORD *)(a3 + 32) = v34;
    *(_QWORD *)(a3 + 48) = v35;
    *(_BYTE *)(a3 + 56) = v36;
  }
  else
  {
    __break(1u);
  }
}

uint64_t sub_1BC0D23B8()
{
  uint64_t *v0;
  uint64_t *v1;
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
  id *v13;
  char v14;
  uint64_t result;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t);
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  id v28;
  uint64_t v29;

  v1 = v0;
  sub_1BC0D5848(0, &qword_1ED6B4F08, (uint64_t (*)(uint64_t))MEMORY[0x1E0DEF868], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0DEB940]);
  MEMORY[0x1E0C80A78](v2);
  v4 = (char *)&v26 - v3;
  sub_1BC0D7870();
  v6 = v5;
  v7 = *(_QWORD *)(v5 - 8);
  MEMORY[0x1E0C80A78](v5);
  v9 = (char *)&v26 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = sub_1BC0D9B70();
  v11 = *(_QWORD *)(v10 - 8);
  MEMORY[0x1E0C80A78](v10);
  v13 = (id *)((char *)&v26 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0));
  *v13 = sub_1BC0D2150();
  (*(void (**)(id *, _QWORD, uint64_t))(v11 + 104))(v13, *MEMORY[0x1E0DEF740], v10);
  v14 = sub_1BC0D9B7C();
  result = (*(uint64_t (**)(id *, uint64_t))(v11 + 8))(v13, v10);
  if ((v14 & 1) != 0)
  {
    v27 = *v1;
    v16 = v1[12];
    v17 = v1[13];
    __swift_project_boxed_opaque_existential_1(v1 + 9, v16);
    v29 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v17 + 24))(v1[7], v16, v17);
    v28 = sub_1BC0D2150();
    v18 = sub_1BC0D9CA8();
    v19 = (uint64_t (*)(uint64_t))MEMORY[0x1E0DEF868];
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v18 - 8) + 56))(v4, 1, 1, v18);
    sub_1BC0D7924();
    sub_1BC0D7D28(0, (unint64_t *)&unk_1ED6B4F18);
    sub_1BC0D7CDC(&qword_1ED6B4E70, (uint64_t (*)(uint64_t))sub_1BC0D7924, MEMORY[0x1E0C95D90]);
    sub_1BC0D7A54();
    sub_1BC0D9B34();
    sub_1BC0D7AAC((uint64_t)v4, &qword_1ED6B4F08, v19);

    swift_release();
    v20 = swift_allocObject();
    swift_weakInit();
    v21 = swift_allocObject();
    v22 = v27;
    *(_QWORD *)(v21 + 16) = v20;
    *(_QWORD *)(v21 + 24) = v22;
    v23 = swift_allocObject();
    swift_weakInit();
    v24 = swift_allocObject();
    *(_QWORD *)(v24 + 16) = sub_1BC0D7B1C;
    *(_QWORD *)(v24 + 24) = v23;
    sub_1BC0D7CDC(&qword_1ED6B4E60, (uint64_t (*)(uint64_t))sub_1BC0D7870, MEMORY[0x1E0C95CB8]);
    v25 = sub_1BC0D9B1C();
    swift_release();
    swift_release();
    (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
    v1[16] = v25;
    return swift_release();
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_1BC0D2700(void **a1, uint64_t a2, void *a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id *v8;
  void *v9;
  uint64_t result;
  _QWORD *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  id v34;
  int v35;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  uint64_t v41;
  uint64_t v42;
  char v43;

  v5 = sub_1BC0D9B70();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x1E0C80A78](v5);
  v8 = (id *)((char *)&v33 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0));
  v9 = *a1;
  swift_beginAccess();
  result = swift_weakLoadStrong();
  if (result)
  {
    v11 = (_QWORD *)result;
    if (v9)
    {
      v12 = v9;
      v35 = sub_1BC0D9C90();
      v34 = (id)HKLogHealthOntology();
      sub_1BC0D7668(0, &qword_1EF3EFA30, &qword_1EF3EFA38, MEMORY[0x1E0DEE208], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0DED1E8]);
      v13 = swift_allocObject();
      *(_OWORD *)(v13 + 16) = xmmword_1BC0DA330;
      v36 = a3;
      sub_1BC0D75F0();
      v14 = sub_1BC0D9BB8();
      v16 = v15;
      v17 = MEMORY[0x1E0DEA968];
      *(_QWORD *)(v13 + 56) = MEMORY[0x1E0DEA968];
      v18 = sub_1BC0D7624();
      *(_QWORD *)(v13 + 64) = v18;
      *(_QWORD *)(v13 + 32) = v14;
      *(_QWORD *)(v13 + 40) = v16;
      v36 = v9;
      v19 = v9;
      sub_1BC0D76C8(0, (unint64_t *)&qword_1ED6B4F40);
      v20 = sub_1BC0D9BB8();
      *(_QWORD *)(v13 + 96) = v17;
      *(_QWORD *)(v13 + 104) = v18;
      *(_QWORD *)(v13 + 72) = v20;
      *(_QWORD *)(v13 + 80) = v21;
      v22 = v34;
      sub_1BC0D9A50();

      swift_bridgeObjectRelease();
      *v8 = sub_1BC0D2150();
      (*(void (**)(id *, _QWORD, uint64_t))(v6 + 104))(v8, *MEMORY[0x1E0DEF740], v5);
      LOBYTE(v22) = sub_1BC0D9B7C();
      result = (*(uint64_t (**)(id *, uint64_t))(v6 + 8))(v8, v5);
      if ((v22 & 1) != 0)
      {
        v23 = v11[12];
        v24 = v11[13];
        __swift_project_boxed_opaque_existential_1(v11 + 9, v23);
        v25 = (*(uint64_t (**)(uint64_t, uint64_t))(v24 + 8))(v23, v24);
        v26 = v11[12];
        v27 = v11[13];
        __swift_project_boxed_opaque_existential_1(v11 + 9, v26);
        v28 = (*(uint64_t (**)(uint64_t, uint64_t))(v27 + 16))(v26, v27);
        v30 = v29;
        v31 = MEMORY[0x1E0DEE9D8];
        v36 = (void *)MEMORY[0x1E0DEE9D8];
        sub_1BC0D5610(MEMORY[0x1E0DEE9D8]);
        v32 = v36;
        v36 = 0;
        v37 = v25;
        v38 = v28;
        v39 = v30;
        v40 = v32;
        v41 = v31;
        v42 = v31;
        v43 = 0;
        sub_1BC0D9A98();

        swift_release();
        swift_bridgeObjectRelease_n();
        swift_bridgeObjectRelease();
        return swift_bridgeObjectRelease();
      }
      else
      {
        __break(1u);
      }
    }
    else
    {
      return swift_release();
    }
  }
  return result;
}

uint64_t sub_1BC0D29E0(unint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  id *v7;
  uint64_t result;
  _QWORD *v9;
  void *v10;
  void *v11;
  char v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  _OWORD v21[2];
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  char v27;
  __int128 v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  char v34;

  v4 = sub_1BC0D9B70();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x1E0C80A78](v4);
  v7 = (id *)((char *)v21 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0));
  swift_beginAccess();
  result = swift_weakLoadStrong();
  if (result)
  {
    v9 = (_QWORD *)result;
    v10 = sub_1BC0D2C44(a2);
    if (v10)
    {
      v11 = v10;
      sub_1BC0D21DC(a1, v10, (uint64_t)&v28);
      v21[0] = v28;
      v21[1] = v28;
      v22 = v29;
      v23 = v30;
      v24 = v31;
      v25 = v32;
      v26 = v33;
      v27 = v34;
      sub_1BC0D9A98();
      swift_release();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();

    }
    else
    {
      *v7 = sub_1BC0D2150();
      (*(void (**)(id *, _QWORD, uint64_t))(v5 + 104))(v7, *MEMORY[0x1E0DEF740], v4);
      v12 = sub_1BC0D9B7C();
      result = (*(uint64_t (**)(id *, uint64_t))(v5 + 8))(v7, v4);
      if ((v12 & 1) == 0)
      {
        __break(1u);
        return result;
      }
      v13 = v9[12];
      v14 = v9[13];
      __swift_project_boxed_opaque_existential_1(v9 + 9, v13);
      v15 = *(uint64_t (**)(uint64_t, uint64_t))(v14 + 8);
      swift_bridgeObjectRetain();
      v16 = v15(v13, v14);
      v17 = v9[12];
      v18 = v9[13];
      __swift_project_boxed_opaque_existential_1(v9 + 9, v17);
      v19 = (*(uint64_t (**)(uint64_t, uint64_t))(v18 + 16))(v17, v18);
      sub_1BC0D032C(a1, 0, v16, v19, v20, 0, (uint64_t)&v28);
      v21[0] = v28;
      sub_1BC0D9A98();
      swift_release();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
    }

    return swift_bridgeObjectRelease();
  }
  return result;
}

void *sub_1BC0D2C44(uint64_t a1)
{
  void *v1;
  int64_t v2;
  uint64_t v3;
  int64_t v4;
  unint64_t v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  int64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  v2 = a1;
  v3 = (unint64_t)a1 >> 62;
  if (!((unint64_t)a1 >> 62))
  {
    v4 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    if (v4)
      goto LABEL_3;
LABEL_39:
    swift_bridgeObjectRelease();
    return 0;
  }
  if (a1 < 0)
    v1 = (void *)a1;
  else
    v1 = (void *)(a1 & 0xFFFFFFFFFFFFFF8);
  swift_bridgeObjectRetain();
  v4 = sub_1BC0D9D68();
  if (!v4)
    goto LABEL_39;
LABEL_3:
  v5 = v2 & 0xC000000000000001;
  if ((v2 & 0xC000000000000001) != 0)
  {
    v6 = (id)MEMORY[0x1BCCEB248](0, v2);
  }
  else
  {
    if (!*(_QWORD *)((v2 & 0xFFFFFFFFFFFFF8) + 0x10))
    {
      __break(1u);
      goto LABEL_42;
    }
    v6 = *(id *)(v2 + 32);
  }
  v1 = v6;
  swift_bridgeObjectRelease();
  if (v4 < 1)
  {
LABEL_42:
    __break(1u);
    goto LABEL_43;
  }
  if (!v3)
  {
    v7 = *(_QWORD *)((v2 & 0xFFFFFFFFFFFFF8) + 0x10);
    if (v7)
    {
      swift_bridgeObjectRetain();
      goto LABEL_15;
    }
    __break(1u);
LABEL_48:
    __break(1u);
LABEL_49:
    __break(1u);
    goto LABEL_50;
  }
  if (v2 < 0)
    v7 = v2;
  else
    v7 = v2 & 0xFFFFFFFFFFFFFF8;
  swift_bridgeObjectRetain();
  if (sub_1BC0D9D68() < 1)
    goto LABEL_48;
  swift_bridgeObjectRetain();
  v7 = sub_1BC0D9D68();
  swift_bridgeObjectRelease();
LABEL_15:
  if (v7 < v4)
  {
LABEL_43:
    __break(1u);
    goto LABEL_44;
  }
  if (v5 && v4 != 1)
  {
    sub_1BC0D7D28(0, &qword_1ED6B4F30);
    v8 = 1;
    do
    {
      v9 = v8 + 1;
      sub_1BC0D9D14();
      v8 = v9;
    }
    while (v4 != v9);
  }
  if (v3)
  {
    swift_bridgeObjectRetain();
    v7 = sub_1BC0D9D74();
    v3 = v10;
    v5 = v11;
    v4 = v12;
    swift_bridgeObjectRelease_n();
    if ((v4 & 1) != 0)
      goto LABEL_25;
LABEL_24:
    v2 = sub_1BC0D5CD4(v7, v3, v5, v4);
    goto LABEL_31;
  }
  v7 = v2 & 0xFFFFFFFFFFFFFF8;
  v3 = (v2 & 0xFFFFFFFFFFFFFF8) + 32;
  v5 = 1;
  v4 = (2 * v4) | 1;
  if ((v4 & 1) == 0)
    goto LABEL_24;
LABEL_25:
  sub_1BC0D9DA4();
  swift_unknownObjectRetain_n();
  v13 = swift_dynamicCastClass();
  if (!v13)
  {
    swift_unknownObjectRelease();
    v13 = MEMORY[0x1E0DEE9D8];
  }
  v14 = *(_QWORD *)(v13 + 16);
  swift_release();
  if (__OFSUB__((unint64_t)v4 >> 1, v5))
    goto LABEL_49;
  if (v14 != ((unint64_t)v4 >> 1) - v5)
  {
LABEL_50:
    swift_unknownObjectRelease();
    goto LABEL_24;
  }
  v2 = swift_dynamicCastClass();
  if (!v2)
  {
    swift_unknownObjectRelease();
    v2 = MEMORY[0x1E0DEE9D8];
  }
LABEL_31:
  swift_unknownObjectRelease();
  if (v2 < 0 || (v2 & 0x4000000000000000) != 0)
  {
LABEL_44:
    if (sub_1BC0D9D68())
      goto LABEL_34;
LABEL_45:
    swift_release();
    return v1;
  }
  if (!*(_QWORD *)(v2 + 16))
    goto LABEL_45;
LABEL_34:
  v15 = sub_1BC0D2F18(v1, v2);

  swift_release();
  return (void *)v15;
}

uint64_t sub_1BC0D2F18(void *a1, unint64_t a2)
{
  uint64_t v2;
  os_log_type_t v5;
  NSObject *v6;
  unint64_t v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  id v12;
  uint64_t v13;
  id v14;
  unint64_t v15;
  unint64_t v16;
  uint64_t v17;
  id v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  id v23;
  void *v24;
  uint64_t v25;
  void *v26;
  id v27;
  id v28;
  uint64_t result;
  id v30;
  id v31;
  _QWORD *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t aBlock;
  unint64_t v37;
  void (*v38)(uint64_t, uint64_t, void *);
  void *v39;
  uint64_t (*v40)(char, void *);
  uint64_t v41;

  v5 = sub_1BC0D9C9C();
  v6 = (id)HKLogHealthOntology();
  v7 = a2 >> 62;
  v35 = v2;
  if (os_log_type_enabled(v6, v5))
  {
    swift_retain_n();
    swift_bridgeObjectRetain_n();
    v8 = a1;
    v9 = swift_slowAlloc();
    v32 = (_QWORD *)swift_slowAlloc();
    v33 = swift_slowAlloc();
    aBlock = v33;
    *(_DWORD *)v9 = 136446722;
    v10 = sub_1BC0D1A6C();
    sub_1BC0D4FB8(v10, v11, &aBlock);
    sub_1BC0D9CD8();
    swift_release_n();
    swift_bridgeObjectRelease();
    *(_WORD *)(v9 + 12) = 2050;
    if (v7)
    {
      swift_bridgeObjectRetain();
      sub_1BC0D9D68();
      swift_bridgeObjectRelease();
    }
    swift_bridgeObjectRelease();
    sub_1BC0D9CD8();
    swift_bridgeObjectRelease();
    *(_WORD *)(v9 + 22) = 2114;
    v12 = v8;
    sub_1BC0D9CD8();
    *v32 = v8;

    _os_log_impl(&dword_1BC0CE000, v6, v5, "%{public}s merge %{public}ld duplicate lists into %{public}@", (uint8_t *)v9, 0x20u);
    sub_1BC0D776C(0, &qword_1EF3EFA50, &qword_1EF3EFA58, 0x1E0DE7910, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0DEB940]);
    swift_arrayDestroy();
    MEMORY[0x1BCCEB680](v32, -1, -1);
    swift_arrayDestroy();
    MEMORY[0x1BCCEB680](v33, -1, -1);
    MEMORY[0x1BCCEB680](v9, -1, -1);

    v7 = a2 >> 62;
  }
  else
  {

  }
  v34 = swift_allocObject();
  *(_QWORD *)(v34 + 16) = a1;
  if (!v7)
  {
    v13 = *(_QWORD *)((a2 & 0xFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    v14 = a1;
    if (v13)
      goto LABEL_8;
LABEL_18:
    v22 = a1;
LABEL_19:
    swift_bridgeObjectRelease();
    v24 = *(void **)(v35 + 64);
    v25 = swift_allocObject();
    *(_QWORD *)(v25 + 16) = v35;
    *(_QWORD *)(v25 + 24) = v34;
    v40 = sub_1BC0D7764;
    v41 = v25;
    aBlock = MEMORY[0x1E0C809B0];
    v37 = 1107296256;
    v38 = sub_1BC0D37D0;
    v39 = &block_descriptor_27;
    v26 = _Block_copy(&aBlock);
    swift_retain();
    v27 = v22;
    swift_retain();
    swift_release();
    objc_msgSend(v24, sel_saveOrUpdateUserDomainConcept_completion_, v27, v26);
    _Block_release(v26);

    swift_beginAccess();
    v28 = *(id *)(v34 + 16);
    swift_release();
    return (uint64_t)v28;
  }
LABEL_17:
  swift_bridgeObjectRetain();
  v23 = a1;
  v13 = sub_1BC0D9D68();
  if (!v13)
    goto LABEL_18;
LABEL_8:
  v15 = a2;
  v16 = a2 & 0xC000000000000001;
  v17 = 4;
  while (1)
  {
    if (v16)
      v18 = (id)MEMORY[0x1BCCEB248](v17 - 4, v15);
    else
      v18 = *(id *)(v15 + 8 * v17);
    v19 = v18;
    v20 = v17 - 3;
    if (__OFADD__(v17 - 4, 1))
    {
      __break(1u);
      goto LABEL_17;
    }
    a2 = (unint64_t)objc_msgSend(a1, sel_copyUserDomainConceptByMergingInConcept_, v18);
    objc_opt_self();
    v21 = swift_dynamicCastObjCClass();
    if (!v21)
      break;
    v22 = (void *)v21;

    *(_QWORD *)(v34 + 16) = v22;
    ++v17;
    a1 = v22;
    if (v20 == v13)
      goto LABEL_19;
  }

  aBlock = 0;
  v37 = 0xE000000000000000;
  sub_1BC0D9CFC();
  swift_bridgeObjectRelease();
  aBlock = 0x7420656C62616E55;
  v37 = 0xEF2074736163206FLL;
  v30 = a1;
  v31 = objc_msgSend(v30, sel_description);
  sub_1BC0D9BAC();

  sub_1BC0D9BC4();
  swift_bridgeObjectRelease();
  sub_1BC0D9BC4();
  result = sub_1BC0D9D5C();
  __break(1u);
  return result;
}

uint64_t sub_1BC0D346C(char a1, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  os_log_type_t v11;
  NSObject *v12;
  id v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  id v18;
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;
  id v22;
  uint64_t v23;
  unint64_t v24;
  os_log_t v25;
  uint64_t v26;
  os_log_t v28;
  int v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33[3];

  v7 = sub_1BC0D9A2C();
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x1E0C80A78](v7);
  v10 = (char *)&v28 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  if ((a1 & 1) == 0)
  {
    v11 = sub_1BC0D9C90();
    v12 = (id)HKLogHealthOntology();
    if (os_log_type_enabled(v12, v11))
    {
      swift_retain();
      swift_retain();
      v13 = a2;
      swift_retain();
      swift_retain();
      v14 = a2;
      v15 = swift_slowAlloc();
      v30 = swift_slowAlloc();
      v33[0] = v30;
      *(_DWORD *)v15 = 136446722;
      v29 = v11;
      v16 = sub_1BC0D1A6C();
      v32 = sub_1BC0D4FB8(v16, v17, v33);
      sub_1BC0D9CD8();
      swift_release_n();
      swift_bridgeObjectRelease();
      *(_WORD *)(v15 + 12) = 2082;
      swift_beginAccess();
      v18 = objc_msgSend(*(id *)(a4 + 16), sel_UUID);
      sub_1BC0D9A20();

      sub_1BC0D7CDC(&qword_1EF3EFA68, (uint64_t (*)(uint64_t))MEMORY[0x1E0CB0998], MEMORY[0x1E0CB09F0]);
      v19 = sub_1BC0D9D8C();
      v28 = v12;
      v21 = v20;
      (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
      v31 = sub_1BC0D4FB8(v19, v21, v33);
      sub_1BC0D9CD8();
      swift_release_n();
      swift_bridgeObjectRelease();
      *(_WORD *)(v15 + 22) = 2082;
      v31 = (uint64_t)a2;
      v22 = a2;
      sub_1BC0D7668(0, &qword_1ED6B4F70, (unint64_t *)&qword_1ED6B4F40, MEMORY[0x1E0DEDAF0], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0DEB940]);
      v23 = sub_1BC0D9BB8();
      v31 = sub_1BC0D4FB8(v23, v24, v33);
      sub_1BC0D9CD8();
      swift_bridgeObjectRelease();

      v25 = v28;
      _os_log_impl(&dword_1BC0CE000, v28, (os_log_type_t)v29, "%{public}s error persisting merged list %{public}s: %{public}s", (uint8_t *)v15, 0x20u);
      v26 = v30;
      swift_arrayDestroy();
      MEMORY[0x1BCCEB680](v26, -1, -1);
      MEMORY[0x1BCCEB680](v15, -1, -1);

    }
    else
    {

    }
  }
  swift_beginAccess();
  LOBYTE(v31) = 1;
  swift_retain();
  sub_1BC0D9A98();
  return swift_release();
}

void sub_1BC0D37D0(uint64_t a1, uint64_t a2, void *a3)
{
  void (*v5)(uint64_t, void *);
  id v6;

  v5 = *(void (**)(uint64_t, void *))(a1 + 32);
  swift_retain();
  v6 = a3;
  v5(a2, a3);
  swift_release();

}

uint64_t sub_1BC0D3830(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _QWORD *v3;
  _QWORD *v4;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  _QWORD *v12;
  void *v13;
  _QWORD v15[6];

  v4 = v3;
  v8 = *v3;
  v9 = swift_allocObject();
  *(_QWORD *)(v9 + 16) = v4;
  v10 = (void *)v4[8];
  v11 = swift_allocObject();
  swift_weakInit();
  v12 = (_QWORD *)swift_allocObject();
  v12[2] = v8;
  v12[3] = a2;
  v12[4] = a3;
  v12[5] = v9;
  v12[6] = v11;
  v15[4] = sub_1BC0D75E0;
  v15[5] = v12;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 1107296256;
  v15[2] = sub_1BC0D37D0;
  v15[3] = &block_descriptor_15;
  v13 = _Block_copy(v15);
  swift_retain();
  sub_1BC0D7154(a2);
  swift_retain();
  swift_release();
  objc_msgSend(v10, sel_saveOrUpdateUserDomainConcept_completion_, a1, v13);
  _Block_release(v13);
  return swift_release();
}

uint64_t sub_1BC0D3974(char a1, void *a2, uint64_t a3, void (*a4)(_QWORD), uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  _QWORD *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  unint64_t v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  uint64_t result;
  uint64_t v31;
  id v32;
  void *v33;
  uint64_t (*v34)(uint64_t);
  id v35;
  int v36;
  uint64_t v37;
  uint64_t v38;
  id v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  _QWORD aBlock[6];

  v39 = a2;
  v12 = sub_1BC0D9B4C();
  v42 = *(_QWORD *)(v12 - 8);
  MEMORY[0x1E0C80A78](v12);
  v14 = (char *)&v35 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = sub_1BC0D9B64();
  v40 = *(_QWORD *)(v15 - 8);
  v41 = v15;
  MEMORY[0x1E0C80A78](v15);
  v17 = (char *)&v35 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18 = a7 + 16;
  if ((a1 & 1) == 0)
  {
    v36 = sub_1BC0D9C90();
    v35 = (id)HKLogHealthOntology();
    sub_1BC0D7668(0, &qword_1EF3EFA30, &qword_1EF3EFA38, MEMORY[0x1E0DEE208], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0DED1E8]);
    v19 = swift_allocObject();
    v38 = v12;
    v20 = (_QWORD *)v19;
    *(_OWORD *)(v19 + 16) = xmmword_1BC0DA330;
    aBlock[0] = a3;
    sub_1BC0D75F0();
    v21 = sub_1BC0D9BB8();
    v23 = v22;
    v20[7] = MEMORY[0x1E0DEA968];
    v24 = sub_1BC0D7624();
    v37 = v18;
    v25 = v24;
    v20[8] = v24;
    v20[4] = v21;
    v20[5] = v23;
    aBlock[0] = v39;
    v26 = v39;
    sub_1BC0D7668(0, &qword_1ED6B4F70, (unint64_t *)&qword_1ED6B4F40, MEMORY[0x1E0DEDAF0], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0DEB940]);
    v27 = sub_1BC0D9BB8();
    v20[12] = MEMORY[0x1E0DEA968];
    v20[13] = v25;
    v20[9] = v27;
    v20[10] = v28;
    v29 = v35;
    sub_1BC0D9A50();

    v12 = v38;
    swift_bridgeObjectRelease();
  }
  if (a4)
    a4(a1 & 1);
  swift_beginAccess();
  *(_QWORD *)(a6 + 16) = 0;
  swift_release();
  swift_beginAccess();
  result = swift_weakLoadStrong();
  if (result)
  {
    v31 = result;
    v32 = sub_1BC0D2150();
    aBlock[4] = sub_1BC0D7E50;
    aBlock[5] = v31;
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_1BC0D1D84;
    aBlock[3] = &block_descriptor_18;
    v33 = _Block_copy(aBlock);
    swift_retain();
    sub_1BC0D9B58();
    v43 = MEMORY[0x1E0DEE9D8];
    v34 = (uint64_t (*)(uint64_t))MEMORY[0x1E0DEF4F8];
    sub_1BC0D7CDC(&qword_1ED6B4ED0, (uint64_t (*)(uint64_t))MEMORY[0x1E0DEF4F8], MEMORY[0x1E0DEF510]);
    sub_1BC0D5848(0, &qword_1ED6B4ED8, v34, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0DEAEC8]);
    sub_1BC0D7018();
    sub_1BC0D9CF0();
    MEMORY[0x1BCCEB1D0](0, v17, v14, v33);
    _Block_release(v33);
    swift_release();

    (*(void (**)(char *, uint64_t))(v42 + 8))(v14, v12);
    (*(void (**)(char *, uint64_t))(v40 + 8))(v17, v41);
    return swift_release();
  }
  return result;
}

uint64_t sub_1BC0D3D30(_OWORD *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  __int128 v14;
  id v15;
  uint64_t v16;
  __int128 v17;
  void *v18;
  uint64_t (*v19)(uint64_t);
  _QWORD v21[2];
  _QWORD aBlock[6];
  _OWORD v23[2];
  _OWORD v24[2];

  v7 = sub_1BC0D9B4C();
  v21[0] = *(_QWORD *)(v7 - 8);
  MEMORY[0x1E0C80A78](v7);
  v9 = (char *)v21 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = sub_1BC0D9B64();
  v11 = *(_QWORD *)(v10 - 8);
  MEMORY[0x1E0C80A78](v10);
  v13 = (char *)v21 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = a1[1];
  v23[0] = *a1;
  v23[1] = v14;
  v24[0] = a1[2];
  *(_OWORD *)((char *)v24 + 9) = *(_OWORD *)((char *)a1 + 41);
  v15 = sub_1BC0D2150();
  v16 = swift_allocObject();
  v17 = a1[1];
  *(_OWORD *)(v16 + 24) = *a1;
  *(_QWORD *)(v16 + 16) = v3;
  *(_OWORD *)(v16 + 40) = v17;
  *(_OWORD *)(v16 + 56) = a1[2];
  *(_OWORD *)(v16 + 65) = *(_OWORD *)((char *)a1 + 41);
  *(_QWORD *)(v16 + 88) = a2;
  *(_QWORD *)(v16 + 96) = a3;
  aBlock[4] = sub_1BC0D70E4;
  aBlock[5] = v16;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_1BC0D1D84;
  aBlock[3] = &block_descriptor_3;
  v18 = _Block_copy(aBlock);
  swift_retain();
  sub_1BC0D70F4((void **)v23);
  sub_1BC0D7154(a2);
  sub_1BC0D9B58();
  v21[1] = MEMORY[0x1E0DEE9D8];
  v19 = (uint64_t (*)(uint64_t))MEMORY[0x1E0DEF4F8];
  sub_1BC0D7CDC(&qword_1ED6B4ED0, (uint64_t (*)(uint64_t))MEMORY[0x1E0DEF4F8], MEMORY[0x1E0DEF510]);
  sub_1BC0D5848(0, &qword_1ED6B4ED8, v19, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0DEAEC8]);
  sub_1BC0D7018();
  sub_1BC0D9CF0();
  MEMORY[0x1BCCEB1D0](0, v13, v9, v18);
  _Block_release(v18);

  (*(void (**)(char *, uint64_t))(v21[0] + 8))(v9, v7);
  (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v10);
  return swift_release();
}

void sub_1BC0D3F74(uint64_t a1, void **a2, void (*a3)(uint64_t), uint64_t a4)
{
  void *v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  char v13;
  id v14;
  id v15;
  void *v16;
  uint64_t v17;
  id v18;
  void *v19;

  sub_1BC0D9AA4();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v7 = *a2;
  if (v19)
  {
    if (!v7)
    {
LABEL_13:
      if (a3)
        a3(1);

      return;
    }
    v8 = v7;
    v9 = objc_msgSend(v8, sel_linkCollection);
    v10 = objc_msgSend(v19, sel_linkCollection);
    v11 = v10;
    if (v9)
    {
      if (v10)
      {
        sub_1BC0D7D28(0, &qword_1EF3EFA70);
        v12 = v9;
        v13 = sub_1BC0D9CC0();

        if ((v13 & 1) == 0)
          goto LABEL_21;
        goto LABEL_12;
      }
      v11 = v9;
    }
    else if (!v10)
    {
LABEL_12:

      goto LABEL_13;
    }

LABEL_21:
    v18 = objc_msgSend(v19, sel_copyUserDomainConceptByMergingInConcept_, v8);
    sub_1BC0D3830((uint64_t)v18, (uint64_t)a3, a4);

    return;
  }
  if (v7)
  {
    v14 = v7;
    v15 = objc_msgSend(v14, sel_linkCollection);
    if (v15)
    {
      v16 = v15;
      v17 = (uint64_t)objc_msgSend(v15, sel_count);

      if (v17 >= 1)
      {
        sub_1BC0D3830((uint64_t)v14, (uint64_t)a3, a4);

        return;
      }
    }

  }
  if (a3)
    a3(1);
}

uint64_t ListConceptManager.contains(_:)(uint64_t a1)
{
  void *v3;
  unint64_t v4;

  sub_1BC0D9AA4();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  LOBYTE(a1) = sub_1BC0D41E0(a1, v4);
  swift_bridgeObjectRelease();
  return a1 & 1;
}

uint64_t sub_1BC0D41E0(uint64_t a1, unint64_t a2)
{
  uint64_t v3;
  unint64_t v4;
  id v5;
  void *v6;
  char v7;
  uint64_t v9;
  uint64_t v10;
  char v11;
  unint64_t v12;
  id v13;
  char v14;

  if (a2 >> 62)
    goto LABEL_20;
  v3 = *(_QWORD *)((a2 & 0xFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  for (; v3; v3 = sub_1BC0D9D68())
  {
    v4 = a2 & 0xC000000000000001;
    if ((a2 & 0xC000000000000001) == 0)
    {
      v5 = *(id *)(a2 + 32);
      goto LABEL_5;
    }
    while (1)
    {
      v5 = (id)MEMORY[0x1BCCEB248](0, a2);
LABEL_5:
      v6 = v5;
      sub_1BC0D7D28(0, (unint64_t *)&qword_1ED6B4F28);
      v7 = sub_1BC0D9CC0();

      if ((v7 & 1) != 0)
      {
LABEL_6:
        swift_bridgeObjectRelease();
        return 1;
      }
      if (v3 == 1)
        goto LABEL_18;
      if (v4)
        break;
      v4 = 5;
      while (1)
      {
        v12 = v4 - 3;
        if (__OFADD__(v4 - 4, 1))
          break;
        v13 = *(id *)(a2 + 8 * v4);
        v14 = sub_1BC0D9CC0();

        if ((v14 & 1) != 0)
          goto LABEL_6;
        ++v4;
        if (v12 == v3)
          goto LABEL_18;
      }
      __break(1u);
    }
    v9 = 1;
    while (1)
    {
      MEMORY[0x1BCCEB248](v9, a2);
      v10 = v9 + 1;
      if (__OFADD__(v9, 1))
        break;
      v11 = sub_1BC0D9CC0();
      swift_unknownObjectRelease();
      if ((v11 & 1) != 0)
        goto LABEL_6;
      ++v9;
      if (v10 == v3)
        goto LABEL_18;
    }
    __break(1u);
LABEL_20:
    swift_bridgeObjectRetain();
  }
LABEL_18:
  swift_bridgeObjectRelease();
  return 0;
}

BOOL ListConceptManager.isListItemsEmpty.getter()
{
  uint64_t v0;
  void *v2;
  unint64_t v3;

  sub_1BC0D9AA4();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  if (v3 >> 62)
  {
    swift_bridgeObjectRetain();
    v0 = sub_1BC0D9D68();
    swift_bridgeObjectRelease();
  }
  else
  {
    v0 = *(_QWORD *)((v3 & 0xFFFFFFFFFFFFF8) + 0x10);
  }
  swift_bridgeObjectRelease();
  return v0 == 0;
}

BOOL ListConceptManager.isNonlistItemsEmpty.getter()
{
  uint64_t v0;
  void *v2;
  unint64_t v3;

  sub_1BC0D9AA4();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  if (v3 >> 62)
  {
    swift_bridgeObjectRetain();
    v0 = sub_1BC0D9D68();
    swift_bridgeObjectRelease();
  }
  else
  {
    v0 = *(_QWORD *)((v3 & 0xFFFFFFFFFFFFF8) + 0x10);
  }
  swift_bridgeObjectRelease();
  return v0 == 0;
}

BOOL ListConceptManager.hasNoItems.getter()
{
  uint64_t v0;
  uint64_t v2;
  void *v3;
  unint64_t v4;
  unint64_t v5;

  sub_1BC0D9AA4();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  if (v4 >> 62)
  {
    swift_bridgeObjectRetain();
    v0 = sub_1BC0D9D68();
    swift_bridgeObjectRelease();
  }
  else
  {
    v0 = *(_QWORD *)((v4 & 0xFFFFFFFFFFFFF8) + 0x10);
  }
  swift_bridgeObjectRelease();
  if (v0)
    return 0;
  sub_1BC0D9AA4();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  if (v5 >> 62)
  {
    swift_bridgeObjectRetain();
    v2 = sub_1BC0D9D68();
    swift_bridgeObjectRelease();
  }
  else
  {
    v2 = *(_QWORD *)((v5 & 0xFFFFFFFFFFFFF8) + 0x10);
  }
  swift_bridgeObjectRelease();
  return v2 == 0;
}

uint64_t ListConceptManager.listElements.getter()
{
  void *v1;
  uint64_t v2;

  sub_1BC0D9AA4();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  return v2;
}

uint64_t ListConceptManager.nonListElements.getter()
{
  void *v1;
  uint64_t v2;

  sub_1BC0D9AA4();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  return v2;
}

_QWORD *static ListConceptManager.pinnedLabs(for:udcChangeProvider:)(void *a1, void *a2)
{
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;

  v3 = a1;
  v4 = (id)HKStringFromListUserDomainType();
  v5 = sub_1BC0D9BAC();
  v7 = v6;

  type metadata accessor for ListConceptManager();
  v8 = (_QWORD *)swift_allocObject();
  return sub_1BC0D5E74(v3, 1, v5, v7, (char *)a2, 0, v8);
}

uint64_t sub_1BC0D4718()
{
  uint64_t v0;

  v0 = sub_1BC0D9C84();
  MEMORY[0x1BCCEB5FC](MEMORY[0x1E0DEAF38], v0);
  return sub_1BC0D9BE8();
}

uint64_t sub_1BC0D4798(id *a1, void *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  char *v10;
  id v11;
  id v12;
  void (*v13)(char *, uint64_t);
  _QWORD v15[2];

  v4 = sub_1BC0D9A2C();
  v5 = *(_QWORD *)(v4 - 8);
  v6 = MEMORY[0x1E0C80A78](v4);
  v8 = (char *)v15 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v6);
  v10 = (char *)v15 - v9;
  v11 = objc_msgSend(*a1, sel_UUID);
  sub_1BC0D9A20();

  v12 = objc_msgSend(a2, sel_targetUUID);
  sub_1BC0D9A20();

  LOBYTE(v12) = sub_1BC0D9A14();
  v13 = *(void (**)(char *, uint64_t))(v5 + 8);
  v13(v8, v4);
  v13(v10, v4);
  return v12 & 1;
}

__n128 ListConceptManagerState.state(byMoving:to:)@<Q0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  __int128 *v3;
  __int128 v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  char v11;
  id v12;
  void *v13;
  id v14;
  id v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  id v20;
  __n128 result;
  uint64_t v22;
  char v23;
  __int128 v24;
  __int128 v25;
  id v26;
  _OWORD v27[3];
  uint64_t v28;
  char v29;

  v5 = *v3;
  v7 = *((_QWORD *)v3 + 2);
  v6 = *((_QWORD *)v3 + 3);
  v9 = *((_QWORD *)v3 + 4);
  v8 = *((_QWORD *)v3 + 5);
  v10 = *((_QWORD *)v3 + 6);
  v11 = *((_BYTE *)v3 + 56);
  v26 = (id)v5;
  if (a1 != a2
    && (_QWORD)v5
    && (v25 = v5,
        v12 = objc_msgSend((id)v5, sel_listByMovingUserDomainConceptFromIndex_toIndex_),
        v5 = v25,
        v12))
  {
    v13 = v12;
    swift_bridgeObjectRetain();
    v14 = objc_msgSend(v13, sel_listType);
    v15 = objc_msgSend(v13, sel_listName);
    if (v15)
    {
      v16 = v15;
      v17 = sub_1BC0D9BAC();
      v19 = v18;

    }
    else
    {
      v17 = 0;
      v19 = 0;
    }
    sub_1BC0D032C(v9, v13, (uint64_t)v14, v17, v19, 0, (uint64_t)v27);
    v22 = v28;
    v23 = v29;
    v24 = v27[1];
    result = (__n128)v27[2];
    *(_OWORD *)a3 = v27[0];
    *(_OWORD *)(a3 + 16) = v24;
    *(__n128 *)(a3 + 32) = result;
    *(_QWORD *)(a3 + 48) = v22;
    *(_BYTE *)(a3 + 56) = v23;
  }
  else
  {
    *(_OWORD *)a3 = v5;
    *(_QWORD *)(a3 + 16) = v7;
    *(_QWORD *)(a3 + 24) = v6;
    *(_QWORD *)(a3 + 32) = v9;
    *(_QWORD *)(a3 + 40) = v8;
    *(_QWORD *)(a3 + 48) = v10;
    *(_BYTE *)(a3 + 56) = v11;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v20 = v26;
  }
  return result;
}

double ListConceptManagerState.state(byRemoving:)@<D0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  double result;

  *(_QWORD *)&result = sub_1BC0D4A48(a1, (SEL *)&selRef_listByRemovingUserDomainConcept_, a2).n128_u64[0];
  return result;
}

{
  double result;

  *(_QWORD *)&result = sub_1BC0D4A48(a1, (SEL *)&selRef_listByRemovingUserDomainConceptAtIndex_, a2).n128_u64[0];
  return result;
}

__n128 sub_1BC0D4A48@<Q0>(uint64_t a1@<X0>, SEL *a2@<X1>, uint64_t a3@<X8>)
{
  __int128 *v3;
  __int128 v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  char v11;
  id v12;
  void *v13;
  id v14;
  id v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  id v20;
  __n128 result;
  uint64_t v22;
  char v23;
  __int128 v24;
  __int128 v25;
  id v26;
  _OWORD v27[3];
  uint64_t v28;
  char v29;

  v5 = *v3;
  v7 = *((_QWORD *)v3 + 2);
  v6 = *((_QWORD *)v3 + 3);
  v9 = *((_QWORD *)v3 + 4);
  v8 = *((_QWORD *)v3 + 5);
  v10 = *((_QWORD *)v3 + 6);
  v11 = *((_BYTE *)v3 + 56);
  v26 = (id)v5;
  if ((_QWORD)v5 && (v25 = v5, v12 = objc_msgSend((id)v5, *a2, a1), v5 = v25, v12))
  {
    v13 = v12;
    swift_bridgeObjectRetain();
    v14 = objc_msgSend(v13, sel_listType);
    v15 = objc_msgSend(v13, sel_listName);
    if (v15)
    {
      v16 = v15;
      v17 = sub_1BC0D9BAC();
      v19 = v18;

    }
    else
    {
      v17 = 0;
      v19 = 0;
    }
    sub_1BC0D032C(v9, v13, (uint64_t)v14, v17, v19, 0, (uint64_t)v27);
    v22 = v28;
    v23 = v29;
    v24 = v27[1];
    result = (__n128)v27[2];
    *(_OWORD *)a3 = v27[0];
    *(_OWORD *)(a3 + 16) = v24;
    *(__n128 *)(a3 + 32) = result;
    *(_QWORD *)(a3 + 48) = v22;
    *(_BYTE *)(a3 + 56) = v23;
  }
  else
  {
    *(_OWORD *)a3 = v5;
    *(_QWORD *)(a3 + 16) = v7;
    *(_QWORD *)(a3 + 24) = v6;
    *(_QWORD *)(a3 + 32) = v9;
    *(_QWORD *)(a3 + 40) = v8;
    *(_QWORD *)(a3 + 48) = v10;
    *(_BYTE *)(a3 + 56) = v11;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v20 = v26;
  }
  return result;
}

__n128 ListConceptManagerState.state(byAdding:)@<Q0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  id v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char v19;
  __n128 result;
  __int128 v21;
  _OWORD v22[3];
  uint64_t v23;
  char v24;
  unint64_t v25;

  v5 = *(_QWORD *)(v2 + 8);
  v6 = *(_QWORD *)(v2 + 24);
  v7 = *(_QWORD *)(v2 + 32);
  if (!*(_QWORD *)v2
    || (v8 = objc_msgSend(*(id *)v2, sel_listByAddingUserDomainConcept_, a1)) == 0)
  {
    if (v6)
    {
      swift_bridgeObjectRetain();
      v9 = (void *)sub_1BC0D9BA0();
      swift_bridgeObjectRelease();
    }
    else
    {
      v9 = 0;
    }
    v10 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0CB6800]), sel_initWithListType_listName_, v5, v9);

    v8 = objc_msgSend(v10, sel_listByAddingUserDomainConcept_, a1);
  }
  v25 = v7;
  swift_bridgeObjectRetain();
  v11 = a1;
  MEMORY[0x1BCCEB11C]();
  if (*(_QWORD *)((v25 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v25 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
    sub_1BC0D9C3C();
  sub_1BC0D9C60();
  sub_1BC0D9C24();
  v12 = objc_msgSend(v8, sel_listType);
  v13 = objc_msgSend(v8, sel_listName);
  if (v13)
  {
    v14 = v13;
    v15 = sub_1BC0D9BAC();
    v17 = v16;

  }
  else
  {
    v15 = 0;
    v17 = 0;
  }
  sub_1BC0D032C(v25, v8, (uint64_t)v12, v15, v17, 0, (uint64_t)v22);
  v18 = v23;
  v19 = v24;
  v21 = v22[1];
  result = (__n128)v22[2];
  *(_OWORD *)a2 = v22[0];
  *(_OWORD *)(a2 + 16) = v21;
  *(__n128 *)(a2 + 32) = result;
  *(_QWORD *)(a2 + 48) = v18;
  *(_BYTE *)(a2 + 56) = v19;
  return result;
}

uint64_t sub_1BC0D4D9C(char a1, int64_t a2, char a3, unint64_t a4)
{
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  _QWORD *v13;
  size_t v14;
  BOOL v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  uint64_t result;

  if ((a3 & 1) != 0)
  {
    v6 = *(_QWORD *)(a4 + 24);
    v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_29;
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
  if (!v9)
  {
    v13 = (_QWORD *)MEMORY[0x1E0DEE9D8];
    goto LABEL_19;
  }
  sub_1BC0D5848(0, &qword_1ED6B4C08, (uint64_t (*)(uint64_t))MEMORY[0x1E0CB0998], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0DED1E8]);
  v10 = *(_QWORD *)(sub_1BC0D9A2C() - 8);
  v11 = *(_QWORD *)(v10 + 72);
  v12 = (*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  v13 = (_QWORD *)swift_allocObject();
  v14 = _swift_stdlib_malloc_size(v13);
  if (!v11 || (v14 - v12 == 0x8000000000000000 ? (v15 = v11 == -1) : (v15 = 0), v15))
  {
LABEL_29:
    result = sub_1BC0D9D50();
    __break(1u);
    return result;
  }
  v13[2] = v8;
  v13[3] = 2 * ((uint64_t)(v14 - v12) / v11);
LABEL_19:
  v16 = *(_QWORD *)(sub_1BC0D9A2C() - 8);
  v17 = (*(unsigned __int8 *)(v16 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v16 + 80);
  v18 = (unint64_t)v13 + v17;
  if ((a1 & 1) != 0)
  {
    if ((unint64_t)v13 < a4 || v18 >= a4 + v17 + *(_QWORD *)(v16 + 72) * v8)
    {
      swift_arrayInitWithTakeFrontToBack();
    }
    else if (v13 != (_QWORD *)a4)
    {
      swift_arrayInitWithTakeBackToFront();
    }
    *(_QWORD *)(a4 + 16) = 0;
  }
  else
  {
    sub_1BC0D6E38(0, v8, v18, a4);
  }
  swift_bridgeObjectRelease();
  return (uint64_t)v13;
}

uint64_t sub_1BC0D4FB8(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12[3];
  uint64_t ObjectType;

  v6 = sub_1BC0D5088(v12, 0, 0, 1, a1, a2);
  v7 = v12[0];
  if (v6)
  {
    v8 = v6;
    ObjectType = swift_getObjectType();
    v12[0] = v8;
    v9 = *a3;
    if (*a3)
    {
      sub_1BC0D77EC((uint64_t)v12, *a3);
      *a3 = v9 + 32;
    }
  }
  else
  {
    ObjectType = MEMORY[0x1E0DEC2B8];
    v12[0] = a1;
    v12[1] = a2;
    v10 = *a3;
    if (*a3)
    {
      sub_1BC0D77EC((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v12);
  return v7;
}

uint64_t sub_1BC0D5088(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_1BC0D9CE4();
            result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    result = sub_1BC0D5240(a5, a6);
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
  v8 = sub_1BC0D9D44();
  if (!v8)
  {
    sub_1BC0D9D50();
    __break(1u);
LABEL_17:
    result = sub_1BC0D9D80();
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

uint64_t sub_1BC0D5240(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v2 = sub_1BC0D52D4(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v2 = sub_1BC0D54B8(0, *(_QWORD *)(v2 + 16) + 1, 1, (char *)v2);
  v4 = *(_QWORD *)(v2 + 16);
  v3 = *(_QWORD *)(v2 + 24);
  if (v4 >= v3 >> 1)
    v2 = sub_1BC0D54B8(v3 > 1, v4 + 1, 1, (char *)v2);
  *(_QWORD *)(v2 + 16) = v4 + 1;
  *(_BYTE *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_1BC0D52D4(uint64_t a1, unint64_t a2)
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
      v3 = sub_1BC0D5448(v2, 0);
      if (v2 < 0)
        break;
      v4 = v3;
      v5 = sub_1BC0D9D08();
      if ((v6 & 1) != 0)
        goto LABEL_14;
      if (v5 == v2)
        return (uint64_t)v4;
      sub_1BC0D9D50();
      __break(1u);
LABEL_10:
      v2 = sub_1BC0D9BD0();
      if (!v2)
        return MEMORY[0x1E0DEE9D8];
    }
    sub_1BC0D9D80();
    __break(1u);
LABEL_14:
    result = sub_1BC0D9D50();
    __break(1u);
  }
  else
  {
    return MEMORY[0x1E0DEE9D8];
  }
  return result;
}

_QWORD *sub_1BC0D5448(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v4;
  size_t v5;

  if (a2 <= a1)
    v2 = a1;
  else
    v2 = a2;
  if (!v2)
    return (_QWORD *)MEMORY[0x1E0DEE9D8];
  sub_1BC0D782C(0, &qword_1EF3EFA60);
  v4 = (_QWORD *)swift_allocObject();
  v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_1BC0D54B8(char a1, int64_t a2, char a3, char *a4)
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
    sub_1BC0D782C(0, &qword_1EF3EFA60);
    v10 = (char *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    *((_QWORD *)v10 + 2) = v8;
    *((_QWORD *)v10 + 3) = 2 * v11 - 64;
  }
  else
  {
    v10 = (char *)MEMORY[0x1E0DEE9D8];
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
  result = sub_1BC0D9D80();
  __break(1u);
  return result;
}

uint64_t sub_1BC0D5610(unint64_t a1)
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
    v3 = sub_1BC0D9D68();
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
    v5 = sub_1BC0D9D68();
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
    v4 = MEMORY[0x1BCCEB254](v5, v9, 1, v4);
    swift_bridgeObjectRelease();
    *v1 = v4;
    v8 = v4 & 0xFFFFFFFFFFFFFF8;
LABEL_15:
    result = sub_1BC0D58A0(v8 + 8 * *(_QWORD *)(v8 + 16) + 32, (*(_QWORD *)(v8 + 24) >> 1) - *(_QWORD *)(v8 + 16), a1);
    if (v11 >= v3)
      break;
LABEL_24:
    __break(1u);
LABEL_25:
    swift_bridgeObjectRetain();
    v9 = sub_1BC0D9D68();
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
    return sub_1BC0D9C24();
  }
  __break(1u);
  return result;
}

uint64_t sub_1BC0D57C8()
{
  return sub_1BC0D4718();
}

unint64_t sub_1BC0D57E0()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1ED6B4BF8;
  if (!qword_1ED6B4BF8)
  {
    sub_1BC0D776C(255, &qword_1ED6B4BF0, &qword_1ED6B4F68, 0x1E0CB6CF8, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0DEAEC8]);
    result = MEMORY[0x1BCCEB5FC](MEMORY[0x1E0DEAF38], v1);
    atomic_store(result, (unint64_t *)&qword_1ED6B4BF8);
  }
  return result;
}

void sub_1BC0D5848(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t), uint64_t (*a4)(uint64_t, uint64_t))
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

uint64_t sub_1BC0D58A0(unint64_t a1, uint64_t a2, unint64_t a3)
{
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t i;
  void (*v12)(_QWORD *);
  id *v13;
  id v14;
  uint64_t result;
  void (*v16[4])(id *);

  v6 = a3 >> 62;
  if (a3 >> 62)
  {
    swift_bridgeObjectRetain();
    v7 = sub_1BC0D9D68();
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
    v10 = sub_1BC0D9D68();
    swift_bridgeObjectRelease();
    if (v10 <= a2)
    {
      if (v7 >= 1)
      {
        sub_1BC0D776C(0, &qword_1ED6B4EE8, (unint64_t *)&qword_1ED6B4F28, 0x1E0CB6CE8, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0DEAEC8]);
        sub_1BC0D7DB8();
        swift_bridgeObjectRetain();
        for (i = 0; i != v7; ++i)
        {
          v12 = sub_1BC0D5AC4(v16, i, a3);
          v14 = *v13;
          ((void (*)(void (**)(id *), _QWORD))v12)(v16, 0);
          *(_QWORD *)(a1 + 8 * i) = v14;
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
    sub_1BC0D7D28(0, (unint64_t *)&qword_1ED6B4F28);
    swift_arrayInitWithCopy();
    return a3;
  }
LABEL_20:
  result = sub_1BC0D9D80();
  __break(1u);
  return result;
}

void (*sub_1BC0D5AC4(void (**a1)(id *a1), unint64_t a2, uint64_t a3))(_QWORD *a1)
{
  void (*v6)(id *);

  v6 = (void (*)(id *))malloc(0x28uLL);
  *a1 = v6;
  *((_QWORD *)v6 + 4) = sub_1BC0D5B44(v6, a2, a3);
  return sub_1BC0D5B18;
}

void sub_1BC0D5B18(_QWORD *a1)
{
  void *v1;

  v1 = (void *)*a1;
  (*(void (**)(_QWORD))(*a1 + 32))(*a1);
  free(v1);
}

void (*sub_1BC0D5B44(void (*result)(id *a1), unint64_t a2, uint64_t a3))(id *a1)
{
  void (*v3)(id *);
  id v4;

  v3 = result;
  if ((a3 & 0xC000000000000001) != 0)
  {
    v4 = (id)MEMORY[0x1BCCEB248](a2, a3);
    goto LABEL_5;
  }
  if ((a2 & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else if (*(_QWORD *)((a3 & 0xFFFFFFFFFFFFF8) + 0x10) > a2)
  {
    v4 = *(id *)(a3 + 8 * a2 + 32);
LABEL_5:
    *(_QWORD *)v3 = v4;
    return sub_1BC0D5BB0;
  }
  __break(1u);
  return result;
}

void sub_1BC0D5BB0(id *a1)
{

}

void sub_1BC0D5BB8()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_1ED6B4F50)
  {
    sub_1BC0D7C38(255, &qword_1ED6B4EA0);
    sub_1BC0D5C48(&qword_1ED6B4F58, &qword_1ED6B4EA0);
    v0 = sub_1BC0D9A74();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_1ED6B4F50);
  }
}

uint64_t sub_1BC0D5C48(unint64_t *a1, unint64_t *a2)
{
  uint64_t result;
  uint64_t v4;

  result = *a1;
  if (!result)
  {
    sub_1BC0D7C38(255, a2);
    result = MEMORY[0x1BCCEB5FC](MEMORY[0x1E0C95FB8], v4);
    atomic_store(result, a1);
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

uint64_t __swift_mutable_project_boxed_opaque_existential_1(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t result;

  if ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) & 0x20000) != 0)
  {
    swift_makeBoxUnique();
    return v2;
  }
  return result;
}

uint64_t sub_1BC0D5CD4(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  unint64_t v4;
  uint64_t v5;
  uint64_t v8;
  _QWORD *v9;
  int64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t result;

  v4 = a4 >> 1;
  v5 = (a4 >> 1) - a3;
  if (!__OFSUB__(a4 >> 1, a3))
  {
    if (!v5)
      return MEMORY[0x1E0DEE9D8];
    v8 = v5;
    if (v5 <= 0)
    {
      v9 = (_QWORD *)MEMORY[0x1E0DEE9D8];
      if (v4 != a3)
      {
LABEL_7:
        if (v5 < 0)
          goto LABEL_19;
        v12 = a2 + 8 * a3;
        if (v12 < (unint64_t)&v9[v8 + 4] && (unint64_t)(v9 + 4) < v12 + v8 * 8)
          goto LABEL_19;
        sub_1BC0D7D28(0, &qword_1ED6B4F30);
        swift_arrayInitWithCopy();
        return (uint64_t)v9;
      }
    }
    else
    {
      sub_1BC0D782C(0, (unint64_t *)&qword_1ED6B4F38);
      v9 = (_QWORD *)swift_allocObject();
      v10 = _swift_stdlib_malloc_size(v9);
      v11 = v10 - 32;
      if (v10 < 32)
        v11 = v10 - 25;
      v9[2] = v5;
      v9[3] = (2 * (v11 >> 3)) | 1;
      if (v4 != a3)
        goto LABEL_7;
    }
    __break(1u);
  }
  __break(1u);
LABEL_19:
  result = sub_1BC0D9D80();
  __break(1u);
  return result;
}

_QWORD *sub_1BC0D5E74(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, char *a5, int a6, _QWORD *a7)
{
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  void *v21;
  id v22;
  id v23;
  id v24;
  void *v25;
  uint64_t v26;
  uint64_t (*v27)(uint64_t);
  uint64_t v28;
  uint64_t v29;
  void *v30;
  id v31;
  void *v32;
  char *v33;
  uint64_t (*v34)(uint64_t);
  char *v35;
  uint64_t v36;
  char *v38;
  uint64_t v39;
  uint64_t v40;
  char *v41;
  uint64_t v42;
  uint64_t v43;
  __int128 v44;
  uint64_t v45;
  uint64_t v46;
  char *v47;
  int v48;
  id v49;
  __int128 aBlock;
  uint64_t (*v51)(uint64_t);
  void *v52;
  uint64_t (*v53)();
  _QWORD *v54;
  uint64_t v55;
  char v56;
  _QWORD v57[6];

  v48 = a6;
  v47 = a5;
  v43 = sub_1BC0D9B4C();
  v42 = *(_QWORD *)(v43 - 8);
  MEMORY[0x1E0C80A78](v43);
  v41 = (char *)&v38 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v40 = sub_1BC0D9B64();
  v39 = *(_QWORD *)(v40 - 8);
  MEMORY[0x1E0C80A78](v40);
  v38 = (char *)&v38 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1BC0D5848(0, &qword_1ED6B4F08, (uint64_t (*)(uint64_t))MEMORY[0x1E0DEF868], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0DEB940]);
  MEMORY[0x1E0C80A78](v14);
  v16 = (char *)&v38 - v15;
  sub_1BC0D7B70();
  v45 = *(_QWORD *)(v17 - 8);
  v46 = v17;
  MEMORY[0x1E0C80A78](v17);
  v19 = (char *)&v38 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  v57[3] = &type metadata for LabsListDataProvider;
  v57[4] = &off_1E74AB1B8;
  v57[0] = a2;
  v57[1] = a3;
  v57[2] = a4;
  LOBYTE(aBlock) = 0;
  sub_1BC0D7C38(0, &qword_1ED6B4EA8);
  swift_allocObject();
  v20 = sub_1BC0D9AC8();
  a7[3] = 0;
  a7[4] = 0;
  a7[2] = v20;
  if (qword_1ED6B4E48 != -1)
    swift_once();
  v44 = xmmword_1ED6B4E00;
  aBlock = xmmword_1ED6B4E00;
  v51 = (uint64_t (*)(uint64_t))qword_1ED6B4E10;
  v52 = (void *)unk_1ED6B4E18;
  v53 = (uint64_t (*)())qword_1ED6B4E20;
  v54 = (_QWORD *)unk_1ED6B4E28;
  v55 = qword_1ED6B4E30;
  v56 = byte_1ED6B4E38;
  sub_1BC0D7C38(0, &qword_1ED6B4EA0);
  swift_allocObject();
  v21 = (void *)v44;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v22 = v21;
  a7[5] = sub_1BC0D9AC8();
  a7[6] = 0;
  a7[15] = 0;
  a7[16] = 0;
  a7[14] = 0;
  a7[7] = a1;
  v23 = objc_allocWithZone(MEMORY[0x1E0CB6D40]);
  v24 = a1;
  a7[8] = objc_msgSend(v23, sel_initWithHealthStore_, v24);
  sub_1BC0D7C90((uint64_t)v57, (uint64_t)(a7 + 9));
  v25 = v47;
  *(_QWORD *)&aBlock = *(_QWORD *)&v47[OBJC_IVAR____TtC28HealthRecordsConceptsSupport31UserDomainConceptChangeProvider_udcChangesSubject];
  swift_retain();
  v49 = sub_1BC0D2150();
  v26 = sub_1BC0D9CA8();
  v27 = (uint64_t (*)(uint64_t))MEMORY[0x1E0DEF868];
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v26 - 8) + 56))(v16, 1, 1, v26);
  sub_1BC0D7C38(0, (unint64_t *)&qword_1ED6B4F78);
  sub_1BC0D7D28(0, (unint64_t *)&unk_1ED6B4F18);
  sub_1BC0D5C48(&qword_1ED6B4F90, (unint64_t *)&qword_1ED6B4F78);
  sub_1BC0D7A54();
  sub_1BC0D9B34();
  sub_1BC0D7AAC((uint64_t)v16, &qword_1ED6B4F08, v27);

  swift_release();
  swift_allocObject();
  swift_weakInit();
  sub_1BC0D7CDC(&qword_1ED6B4F80, (uint64_t (*)(uint64_t))sub_1BC0D7B70, MEMORY[0x1E0C95CB8]);
  v28 = v46;
  v29 = sub_1BC0D9B40();
  swift_release();
  (*(void (**)(char *, uint64_t))(v45 + 8))(v19, v28);
  a7[15] = v29;
  swift_release();
  sub_1BC0D9A44();
  sub_1BC0D2150();
  swift_allocObject();
  swift_weakInit();
  a7[14] = sub_1BC0D9A38();
  swift_release();
  v30 = v25;
  if ((v48 & 1) != 0)
  {

    __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v57);
  }
  else
  {
    v31 = sub_1BC0D2150();
    v53 = sub_1BC0D7D24;
    v54 = a7;
    *(_QWORD *)&aBlock = MEMORY[0x1E0C809B0];
    *((_QWORD *)&aBlock + 1) = 1107296256;
    v51 = sub_1BC0D1D84;
    v52 = &block_descriptor_40;
    v32 = _Block_copy(&aBlock);
    swift_retain();
    v33 = v38;
    sub_1BC0D9B58();
    v49 = (id)MEMORY[0x1E0DEE9D8];
    v34 = (uint64_t (*)(uint64_t))MEMORY[0x1E0DEF4F8];
    sub_1BC0D7CDC(&qword_1ED6B4ED0, (uint64_t (*)(uint64_t))MEMORY[0x1E0DEF4F8], MEMORY[0x1E0DEF510]);
    sub_1BC0D5848(0, &qword_1ED6B4ED8, v34, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0DEAEC8]);
    sub_1BC0D7018();
    v35 = v41;
    v36 = v43;
    sub_1BC0D9CF0();
    MEMORY[0x1BCCEB1D0](0, v33, v35, v32);
    _Block_release(v32);

    __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v57);
    (*(void (**)(char *, uint64_t))(v42 + 8))(v35, v36);
    (*(void (**)(char *, uint64_t))(v39 + 8))(v33, v40);
    swift_release();
  }
  return a7;
}

_QWORD *sub_1BC0D64C0(void *a1, uint64_t a2, char *a3, int a4, _QWORD *a5, uint64_t a6, uint64_t a7)
{
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  uint64_t *boxed_opaque_existential_1;
  uint64_t v21;
  void *v22;
  id v23;
  id v24;
  id v25;
  void *v26;
  uint64_t v27;
  uint64_t (*v28)(uint64_t);
  uint64_t v29;
  uint64_t v30;
  void *v31;
  id v32;
  void *v33;
  char *v34;
  uint64_t (*v35)(uint64_t);
  char *v36;
  uint64_t v37;
  char *v39;
  uint64_t v40;
  uint64_t v41;
  char *v42;
  uint64_t v43;
  uint64_t v44;
  __int128 v45;
  uint64_t v46;
  uint64_t v47;
  char *v48;
  int v49;
  id v50;
  __int128 aBlock;
  uint64_t (*v52)(uint64_t);
  void *v53;
  uint64_t (*v54)();
  _QWORD *v55;
  uint64_t v56;
  char v57;
  uint64_t v58[6];

  v49 = a4;
  v48 = a3;
  v44 = sub_1BC0D9B4C();
  v43 = *(_QWORD *)(v44 - 8);
  MEMORY[0x1E0C80A78](v44);
  v42 = (char *)&v39 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v41 = sub_1BC0D9B64();
  v40 = *(_QWORD *)(v41 - 8);
  MEMORY[0x1E0C80A78](v41);
  v39 = (char *)&v39 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1BC0D5848(0, &qword_1ED6B4F08, (uint64_t (*)(uint64_t))MEMORY[0x1E0DEF868], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0DEB940]);
  MEMORY[0x1E0C80A78](v14);
  v16 = (char *)&v39 - v15;
  sub_1BC0D7B70();
  v46 = *(_QWORD *)(v17 - 8);
  v47 = v17;
  MEMORY[0x1E0C80A78](v17);
  v19 = (char *)&v39 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  v58[3] = a6;
  v58[4] = a7;
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v58);
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(_QWORD *)(a6 - 8) + 32))(boxed_opaque_existential_1, a2, a6);
  LOBYTE(aBlock) = 0;
  sub_1BC0D7C38(0, &qword_1ED6B4EA8);
  swift_allocObject();
  v21 = sub_1BC0D9AC8();
  a5[3] = 0;
  a5[4] = 0;
  a5[2] = v21;
  if (qword_1ED6B4E48 != -1)
    swift_once();
  v45 = xmmword_1ED6B4E00;
  aBlock = xmmword_1ED6B4E00;
  v52 = (uint64_t (*)(uint64_t))qword_1ED6B4E10;
  v53 = (void *)unk_1ED6B4E18;
  v54 = (uint64_t (*)())qword_1ED6B4E20;
  v55 = (_QWORD *)unk_1ED6B4E28;
  v56 = qword_1ED6B4E30;
  v57 = byte_1ED6B4E38;
  sub_1BC0D7C38(0, &qword_1ED6B4EA0);
  swift_allocObject();
  v22 = (void *)v45;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v23 = v22;
  a5[5] = sub_1BC0D9AC8();
  a5[6] = 0;
  a5[15] = 0;
  a5[16] = 0;
  a5[14] = 0;
  a5[7] = a1;
  v24 = objc_allocWithZone(MEMORY[0x1E0CB6D40]);
  v25 = a1;
  a5[8] = objc_msgSend(v24, sel_initWithHealthStore_, v25);
  sub_1BC0D7C90((uint64_t)v58, (uint64_t)(a5 + 9));
  v26 = v48;
  *(_QWORD *)&aBlock = *(_QWORD *)&v48[OBJC_IVAR____TtC28HealthRecordsConceptsSupport31UserDomainConceptChangeProvider_udcChangesSubject];
  swift_retain();
  v50 = sub_1BC0D2150();
  v27 = sub_1BC0D9CA8();
  v28 = (uint64_t (*)(uint64_t))MEMORY[0x1E0DEF868];
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v27 - 8) + 56))(v16, 1, 1, v27);
  sub_1BC0D7C38(0, (unint64_t *)&qword_1ED6B4F78);
  sub_1BC0D7D28(0, (unint64_t *)&unk_1ED6B4F18);
  sub_1BC0D5C48(&qword_1ED6B4F90, (unint64_t *)&qword_1ED6B4F78);
  sub_1BC0D7A54();
  sub_1BC0D9B34();
  sub_1BC0D7AAC((uint64_t)v16, &qword_1ED6B4F08, v28);

  swift_release();
  swift_allocObject();
  swift_weakInit();
  sub_1BC0D7CDC(&qword_1ED6B4F80, (uint64_t (*)(uint64_t))sub_1BC0D7B70, MEMORY[0x1E0C95CB8]);
  v29 = v47;
  v30 = sub_1BC0D9B40();
  swift_release();
  (*(void (**)(char *, uint64_t))(v46 + 8))(v19, v29);
  a5[15] = v30;
  swift_release();
  sub_1BC0D9A44();
  sub_1BC0D2150();
  swift_allocObject();
  swift_weakInit();
  a5[14] = sub_1BC0D9A38();
  swift_release();
  v31 = v26;
  if ((v49 & 1) != 0)
  {

    __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v58);
  }
  else
  {
    v32 = sub_1BC0D2150();
    v54 = sub_1BC0D7E50;
    v55 = a5;
    *(_QWORD *)&aBlock = MEMORY[0x1E0C809B0];
    *((_QWORD *)&aBlock + 1) = 1107296256;
    v52 = sub_1BC0D1D84;
    v53 = &block_descriptor_48;
    v33 = _Block_copy(&aBlock);
    swift_retain();
    v34 = v39;
    sub_1BC0D9B58();
    v50 = (id)MEMORY[0x1E0DEE9D8];
    v35 = (uint64_t (*)(uint64_t))MEMORY[0x1E0DEF4F8];
    sub_1BC0D7CDC(&qword_1ED6B4ED0, (uint64_t (*)(uint64_t))MEMORY[0x1E0DEF4F8], MEMORY[0x1E0DEF510]);
    sub_1BC0D5848(0, &qword_1ED6B4ED8, v35, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0DEAEC8]);
    sub_1BC0D7018();
    v36 = v42;
    v37 = v44;
    sub_1BC0D9CF0();
    MEMORY[0x1BCCEB1D0](0, v34, v36, v33);
    _Block_release(v33);

    __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v58);
    (*(void (**)(char *, uint64_t))(v43 + 8))(v36, v37);
    (*(void (**)(char *, uint64_t))(v40 + 8))(v34, v41);
    swift_release();
  }
  return a5;
}

uint64_t sub_1BC0D6B10(unint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  id v13;
  BOOL v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  unint64_t v21;
  id v22;
  id v23;
  uint64_t v24;
  void (*v25)(char *, uint64_t);
  id v26;
  uint64_t v27;
  uint64_t v29;
  unint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  unint64_t v34;
  unint64_t v35;
  unint64_t v36;
  uint64_t v37;
  unint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  id v42;
  uint64_t v43;

  v41 = a2;
  v3 = sub_1BC0D9A2C();
  v39 = *(_QWORD *)(v3 - 8);
  v40 = v3;
  v4 = MEMORY[0x1E0C80A78](v3);
  v6 = (char *)&v29 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v4);
  v8 = (char *)&v29 - v7;
  v43 = MEMORY[0x1E0DEE9D8];
  if (a1 >> 62)
  {
LABEL_30:
    swift_bridgeObjectRetain();
    v9 = sub_1BC0D9D68();
    if (v9)
      goto LABEL_3;
  }
  else
  {
    v9 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    if (v9)
    {
LABEL_3:
      v10 = 0;
      v11 = v41 & 0xFFFFFFFFFFFFFF8;
      v32 = v41 & 0xFFFFFFFFFFFFFF8;
      v33 = v9;
      if (v41 < 0)
        v11 = v41;
      v30 = a1 + 32;
      v31 = v11;
      v38 = v41 & 0xC000000000000001;
      v35 = (unint64_t)v41 >> 62;
      v36 = a1 & 0xC000000000000001;
      v34 = a1;
      while (1)
      {
        if (v36)
          v13 = (id)MEMORY[0x1BCCEB248](v10, a1);
        else
          v13 = *(id *)(v30 + 8 * v10);
        v42 = v13;
        v14 = __OFADD__(v10, 1);
        v15 = v10 + 1;
        if (v14)
        {
LABEL_29:
          __break(1u);
          goto LABEL_30;
        }
        v37 = v15;
        if (v35)
        {
          v18 = v42;
          swift_bridgeObjectRetain();
          v16 = sub_1BC0D9D68();
          if (v16)
          {
LABEL_16:
            a1 = 4;
            while (1)
            {
              if (v38)
                v19 = (id)MEMORY[0x1BCCEB248](a1 - 4, v41);
              else
                v19 = *(id *)(v41 + 8 * a1);
              v20 = v19;
              v21 = a1 - 3;
              if (__OFADD__(a1 - 4, 1))
              {
                __break(1u);
                goto LABEL_29;
              }
              v22 = objc_msgSend(v19, sel_UUID);
              sub_1BC0D9A20();

              v23 = objc_msgSend(v42, sel_targetUUID);
              sub_1BC0D9A20();

              LOBYTE(v23) = sub_1BC0D9A14();
              v24 = v40;
              v25 = *(void (**)(char *, uint64_t))(v39 + 8);
              v25(v6, v40);
              v25(v8, v24);
              if ((v23 & 1) != 0)
                break;

              ++a1;
              if (v21 == v16)
                goto LABEL_6;
            }
            v26 = v42;

            v27 = swift_bridgeObjectRelease();
            MEMORY[0x1BCCEB11C](v27);
            a1 = v34;
            if (*(_QWORD *)((v43 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v43 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
              sub_1BC0D9C3C();
            sub_1BC0D9C60();
            sub_1BC0D9C24();
            goto LABEL_7;
          }
        }
        else
        {
          v16 = *(_QWORD *)(v32 + 16);
          v17 = v42;
          swift_bridgeObjectRetain();
          if (v16)
            goto LABEL_16;
        }
LABEL_6:
        v12 = v42;

        swift_bridgeObjectRelease();
        a1 = v34;
LABEL_7:
        v10 = v37;
        if (v37 == v33)
        {
          swift_bridgeObjectRelease();
          return v43;
        }
      }
    }
  }
  swift_bridgeObjectRelease();
  return MEMORY[0x1E0DEE9D8];
}

uint64_t sub_1BC0D6E38(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t result;

  v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    v8 = *(_QWORD *)(sub_1BC0D9A2C() - 8);
    v9 = *(unsigned __int8 *)(v8 + 80);
    v10 = *(_QWORD *)(v8 + 72);
    v11 = a4 + ((v9 + 32) & ~v9) + v10 * a1;
    v12 = v10 * v4;
    v13 = a3 + v12;
    v14 = v11 + v12;
    if (v11 >= v13 || v14 <= a3)
    {
      swift_arrayInitWithCopy();
      return v13;
    }
  }
  result = sub_1BC0D9D80();
  __break(1u);
  return result;
}

_QWORD *sub_1BC0D6F50(void *a1, uint64_t a2, char *a3, int a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v13;
  uint64_t v14;
  char *v15;
  _QWORD *v16;
  uint64_t v18;

  v13 = *(_QWORD *)(a6 - 8);
  MEMORY[0x1E0C80A78](a1);
  v15 = (char *)&v18 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for ListConceptManager();
  v16 = (_QWORD *)swift_allocObject();
  (*(void (**)(char *, uint64_t, uint64_t))(v13 + 16))(v15, a2, a6);
  return sub_1BC0D64C0(a1, (uint64_t)v15, a3, a4, v16, a6, a7);
}

unint64_t sub_1BC0D7018()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1ED6B4EE0;
  if (!qword_1ED6B4EE0)
  {
    sub_1BC0D5848(255, &qword_1ED6B4ED8, (uint64_t (*)(uint64_t))MEMORY[0x1E0DEF4F8], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0DEAEC8]);
    result = MEMORY[0x1BCCEB5FC](MEMORY[0x1E0DEAF38], v1);
    atomic_store(result, (unint64_t *)&qword_1ED6B4EE0);
  }
  return result;
}

uint64_t sub_1BC0D7078(uint64_t result)
{
  if (result)
    return swift_release();
  return result;
}

uint64_t sub_1BC0D7088()
{
  uint64_t v0;

  swift_release();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (*(_QWORD *)(v0 + 88))
    swift_release();
  return swift_deallocObject();
}

void sub_1BC0D70E4()
{
  uint64_t v0;

  sub_1BC0D3F74(*(_QWORD *)(v0 + 16), (void **)(v0 + 24), *(void (**)(uint64_t))(v0 + 88), *(_QWORD *)(v0 + 96));
}

void **sub_1BC0D70F4(void **a1)
{
  void *v2;
  id v3;

  v2 = *a1;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v3 = v2;
  return a1;
}

uint64_t sub_1BC0D7154(uint64_t result)
{
  if (result)
    return swift_retain();
  return result;
}

uint64_t type metadata accessor for ListConceptManager()
{
  return objc_opt_self();
}

uint64_t sub_1BC0D7184@<X0>(uint64_t *a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v3;

  v3 = *a1;
  swift_beginAccess();
  *a2 = *(_QWORD *)(v3 + 16);
  return swift_retain();
}

uint64_t initializeBufferWithCopyOfBuffer for ListConceptManagerState(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *a2;
  *a1 = *a2;
  v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t destroy for ListConceptManagerState(id *a1)
{

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for ListConceptManagerState(uint64_t a1, uint64_t a2)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  id v6;

  v3 = *(void **)a2;
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  v4 = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 32) = v4;
  v5 = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 48) = v5;
  *(_BYTE *)(a1 + 56) = *(_BYTE *)(a2 + 56);
  v6 = v3;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for ListConceptManagerState(uint64_t a1, uint64_t a2)
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
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + 56) = *(_BYTE *)(a2 + 56);
  return a1;
}

__n128 __swift_memcpy57_8(uint64_t a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;
  __int128 v4;

  result = *(__n128 *)a2;
  v3 = *(_OWORD *)(a2 + 16);
  v4 = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 41) = *(_OWORD *)(a2 + 41);
  *(_OWORD *)(a1 + 16) = v3;
  *(_OWORD *)(a1 + 32) = v4;
  *(__n128 *)a1 = result;
  return result;
}

uint64_t assignWithTake for ListConceptManagerState(uint64_t a1, uint64_t a2)
{
  void *v4;

  v4 = *(void **)a1;
  *(_QWORD *)a1 = *(_QWORD *)a2;

  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + 56) = *(_BYTE *)(a2 + 56);
  return a1;
}

uint64_t getEnumTagSinglePayload for ListConceptManagerState(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 57))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 32);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for ListConceptManagerState(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_BYTE *)(result + 56) = 0;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 57) = 1;
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2)
        return result;
LABEL_8:
      *(_QWORD *)(result + 32) = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 57) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for ListConceptManagerState()
{
  return &type metadata for ListConceptManagerState;
}

uint64_t method lookup function for ListConceptManager()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of ListConceptManager.publisher.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 160))();
}

uint64_t dispatch thunk of ListConceptManager.UUID.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 168))();
}

uint64_t dispatch thunk of ListConceptManager.listUDC.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 176))();
}

uint64_t dispatch thunk of ListConceptManager.hasLoadedData.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 184))();
}

uint64_t dispatch thunk of ListConceptManager.currentState.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 192))();
}

uint64_t dispatch thunk of ListConceptManager.listName.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 200))();
}

uint64_t dispatch thunk of ListConceptManager.listType.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 208))();
}

uint64_t dispatch thunk of ListConceptManager.description.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 216))();
}

uint64_t dispatch thunk of ListConceptManager.__allocating_init(healthStore:provider:udcChangeProvider:test_skipInitialLoad:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 224))();
}

uint64_t dispatch thunk of ListConceptManager.test_hasPersistedMerge.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 232))();
}

uint64_t dispatch thunk of ListConceptManager.test_hasPersistedMerge.setter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 240))();
}

uint64_t dispatch thunk of ListConceptManager.test_hasPersistedMerge.modify()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 248))();
}

uint64_t dispatch thunk of ListConceptManager.test_forceReload()()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 256))();
}

uint64_t dispatch thunk of ListConceptManager.commit(state:onCommitHandler:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 424))();
}

uint64_t sub_1BC0D755C()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_1BC0D7580()
{
  swift_weakDestroy();
  return swift_deallocObject();
}

uint64_t sub_1BC0D75A4()
{
  uint64_t v0;

  if (*(_QWORD *)(v0 + 24))
    swift_release();
  swift_release();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_1BC0D75E0(char a1, void *a2)
{
  uint64_t v2;

  return sub_1BC0D3974(a1, a2, *(_QWORD *)(v2 + 16), *(void (**)(_QWORD))(v2 + 24), *(_QWORD *)(v2 + 32), *(_QWORD *)(v2 + 40), *(_QWORD *)(v2 + 48));
}

unint64_t sub_1BC0D75F0()
{
  unint64_t result;

  result = qword_1EF3EFA40;
  if (!qword_1EF3EFA40)
  {
    type metadata accessor for ListConceptManager();
    result = swift_getMetatypeMetadata();
    atomic_store(result, (unint64_t *)&qword_1EF3EFA40);
  }
  return result;
}

unint64_t sub_1BC0D7624()
{
  unint64_t result;

  result = qword_1EF3EFA48;
  if (!qword_1EF3EFA48)
  {
    result = MEMORY[0x1BCCEB5FC](MEMORY[0x1E0CB1A70], MEMORY[0x1E0DEA968]);
    atomic_store(result, (unint64_t *)&qword_1EF3EFA48);
  }
  return result;
}

void sub_1BC0D7668(uint64_t a1, unint64_t *a2, unint64_t *a3, uint64_t a4, uint64_t (*a5)(uint64_t, uint64_t))
{
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;

  if (!*a2)
  {
    v8 = sub_1BC0D76C8(255, a3);
    v9 = a5(a1, v8);
    if (!v10)
      atomic_store(v9, a2);
  }
}

uint64_t sub_1BC0D76C8(uint64_t a1, unint64_t *a2)
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

uint64_t sub_1BC0D7714()
{
  uint64_t v0;

  return swift_deallocObject();
}

uint64_t sub_1BC0D7738()
{
  swift_release();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_1BC0D7764(char a1, void *a2)
{
  uint64_t v2;

  return sub_1BC0D346C(a1, a2, *(_QWORD *)(v2 + 16), *(_QWORD *)(v2 + 24));
}

void sub_1BC0D776C(uint64_t a1, unint64_t *a2, unint64_t *a3, uint64_t a4, uint64_t (*a5)(uint64_t, uint64_t))
{
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;

  if (!*a2)
  {
    v8 = sub_1BC0D7D28(255, a3);
    v9 = a5(a1, v8);
    if (!v10)
      atomic_store(v9, a2);
  }
}

uint64_t __swift_destroy_boxed_opaque_existential_1Tm(uint64_t a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(*(_QWORD *)(a1 + 24) - 8);
  if ((*(_BYTE *)(v1 + 82) & 2) != 0)
    return swift_release();
  else
    return (*(uint64_t (**)(void))(v1 + 8))();
}

uint64_t sub_1BC0D77EC(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

void sub_1BC0D782C(uint64_t a1, unint64_t *a2)
{
  unint64_t v3;
  uint64_t v4;

  if (!*a2)
  {
    v3 = sub_1BC0D9D98();
    if (!v4)
      atomic_store(v3, a2);
  }
}

void sub_1BC0D7870()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_1ED6B4E68)
  {
    sub_1BC0D7924();
    sub_1BC0D7D28(255, (unint64_t *)&unk_1ED6B4F18);
    sub_1BC0D7CDC(&qword_1ED6B4E70, (uint64_t (*)(uint64_t))sub_1BC0D7924, MEMORY[0x1E0C95D90]);
    sub_1BC0D7A54();
    v0 = sub_1BC0D9A80();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_1ED6B4E68);
  }
}

void sub_1BC0D7924()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_1ED6B4E78)
  {
    sub_1BC0D79A0();
    sub_1BC0D76C8(255, (unint64_t *)&qword_1ED6B4F40);
    v0 = sub_1BC0D9A8C();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_1ED6B4E78);
  }
}

void sub_1BC0D79A0()
{
  uint64_t (*v0)(uint64_t, uint64_t);
  unint64_t TupleTypeMetadata2;
  uint64_t v2;

  if (!qword_1ED6B4EF0)
  {
    v0 = (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0DEAEC8];
    sub_1BC0D776C(255, &qword_1ED6B4EE8, (unint64_t *)&qword_1ED6B4F28, 0x1E0CB6CE8, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0DEAEC8]);
    sub_1BC0D776C(255, &qword_1ED6B4EF8, &qword_1ED6B4F30, 0x1E0CB6800, v0);
    TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
    if (!v2)
      atomic_store(TupleTypeMetadata2, (unint64_t *)&qword_1ED6B4EF0);
  }
}

unint64_t sub_1BC0D7A54()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1ED6B4F10;
  if (!qword_1ED6B4F10)
  {
    v1 = sub_1BC0D7D28(255, (unint64_t *)&unk_1ED6B4F18);
    result = MEMORY[0x1BCCEB5FC](MEMORY[0x1E0DEF7F8], v1);
    atomic_store(result, (unint64_t *)&qword_1ED6B4F10);
  }
  return result;
}

uint64_t sub_1BC0D7AAC(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t))
{
  uint64_t v4;

  sub_1BC0D5848(0, a2, a3, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0DEB940]);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(a1, v4);
  return a1;
}

uint64_t sub_1BC0D7AF0()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_1BC0D7B14(void **a1)
{
  uint64_t v1;

  return sub_1BC0D2700(a1, *(_QWORD *)(v1 + 16), *(void **)(v1 + 24));
}

uint64_t sub_1BC0D7B1C(unint64_t a1, uint64_t a2)
{
  return sub_1BC0D29E0(a1, a2);
}

uint64_t sub_1BC0D7B24()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_1BC0D7B48(_QWORD *a1)
{
  uint64_t v1;

  return (*(uint64_t (**)(_QWORD, _QWORD))(v1 + 16))(*a1, a1[1]);
}

void sub_1BC0D7B70()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_1ED6B4F88)
  {
    sub_1BC0D7C38(255, (unint64_t *)&qword_1ED6B4F78);
    sub_1BC0D7D28(255, (unint64_t *)&unk_1ED6B4F18);
    sub_1BC0D5C48(&qword_1ED6B4F90, (unint64_t *)&qword_1ED6B4F78);
    sub_1BC0D7A54();
    v0 = sub_1BC0D9A80();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_1ED6B4F88);
  }
}

void sub_1BC0D7C38(uint64_t a1, unint64_t *a2)
{
  unint64_t v3;
  uint64_t v4;

  if (!*a2)
  {
    v3 = sub_1BC0D9ABC();
    if (!v4)
      atomic_store(v3, a2);
  }
}

uint64_t sub_1BC0D7C90(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  *(_QWORD *)(a2 + 32) = *(_QWORD *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_1BC0D7CD4()
{
  return sub_1BC0D1CDC();
}

uint64_t sub_1BC0D7CDC(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = a2(255);
    result = MEMORY[0x1BCCEB5FC](a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_1BC0D7D1C()
{
  return sub_1BC0D1D30();
}

uint64_t sub_1BC0D7D28(uint64_t a1, unint64_t *a2)
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

uint64_t *__swift_allocate_boxed_opaque_existential_1(uint64_t *a1)
{
  uint64_t *v1;
  uint64_t v2;

  v1 = a1;
  if ((*(_BYTE *)(*(_QWORD *)(a1[3] - 8) + 82) & 2) != 0)
  {
    *a1 = swift_allocBox();
    return (uint64_t *)v2;
  }
  return v1;
}

uint64_t sub_1BC0D7D9C(id *a1)
{
  uint64_t v1;

  return sub_1BC0D4798(a1, *(void **)(v1 + 24)) & 1;
}

unint64_t sub_1BC0D7DB8()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1EF3EFA78;
  if (!qword_1EF3EFA78)
  {
    sub_1BC0D776C(255, &qword_1ED6B4EE8, (unint64_t *)&qword_1ED6B4F28, 0x1E0CB6CE8, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0DEAEC8]);
    result = MEMORY[0x1BCCEB5FC](MEMORY[0x1E0DEAF50], v1);
    atomic_store(result, (unint64_t *)&qword_1EF3EFA78);
  }
  return result;
}

uint64_t static HKHealthStore.makeConceptPublisher<A>(with:entity:predicate:)(void *a1, uint64_t a2, void *a3, uint64_t a4)
{
  uint64_t v7;
  _QWORD *v8;
  id v9;
  id v10;
  uint64_t v11;

  sub_1BC0D9C84();
  sub_1BC0D7F38();
  v7 = sub_1BC0D9AD4();
  v8 = (_QWORD *)swift_allocObject();
  v8[2] = a4;
  v8[3] = a3;
  v8[4] = a1;
  v9 = a3;
  v10 = a1;
  sub_1BC0D9AE0();
  MEMORY[0x1BCCEB5FC](MEMORY[0x1E0C96108], v7);
  v11 = sub_1BC0D9B10();
  swift_release();
  return v11;
}

unint64_t sub_1BC0D7F38()
{
  unint64_t result;

  result = qword_1ED6B4F40;
  if (!qword_1ED6B4F40)
  {
    result = swift_getExistentialTypeMetadata();
    atomic_store(result, (unint64_t *)&qword_1ED6B4F40);
  }
  return result;
}

void sub_1BC0D7F8C(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  void *v12;
  id v13;
  _QWORD *v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  id v20;
  id v21;
  void *v22;
  unint64_t v23;
  unint64_t v24;
  void (*v25)(uint64_t, void *, void *, void *, uint64_t, void *);
  void *v26;
  uint64_t (*v27)(uint64_t, void *, int, char, uint64_t);
  _QWORD *v28;

  v8 = swift_allocObject();
  *(_QWORD *)(v8 + 16) = a1;
  *(_QWORD *)(v8 + 24) = a2;
  v9 = swift_allocObject();
  *(_QWORD *)(v9 + 16) = MEMORY[0x1E0DEE9D8];
  sub_1BC0D9098();
  v10 = swift_allocObject();
  *(_OWORD *)(v10 + 16) = xmmword_1BC0DA3F0;
  sub_1BC0D9BAC();
  v11 = objc_allocWithZone(MEMORY[0x1E0CB3928]);
  swift_retain();
  v12 = (void *)sub_1BC0D9BA0();
  swift_bridgeObjectRelease();
  v13 = objc_msgSend(v11, sel_initWithKey_ascending_, v12, 0);

  *(_QWORD *)(v10 + 32) = v13;
  sub_1BC0D9C24();
  v14 = (_QWORD *)swift_allocObject();
  v14[2] = a4;
  v14[3] = sub_1BC0D9070;
  v14[4] = v8;
  v14[5] = v9;
  v15 = objc_allocWithZone(MEMORY[0x1E0CB6D28]);
  sub_1BC0D7D28(0, &qword_1ED6B4F00);
  v16 = a4;
  swift_retain();
  v17 = a3;
  v18 = (void *)sub_1BC0D9C0C();
  swift_bridgeObjectRelease();
  v27 = sub_1BC0D90F4;
  v28 = v14;
  v23 = MEMORY[0x1E0C809B0];
  v24 = 1107296256;
  v25 = sub_1BC0D915C;
  v26 = &block_descriptor_0;
  v19 = _Block_copy(&v23);
  v20 = objc_msgSend(v15, sel_initWithPredicate_anchor_limit_sortDescriptors_resultsHandler_, v17, 0, 0, v18, v19);

  _Block_release(v19);
  swift_release();
  v23 = 0;
  v24 = 0xE000000000000000;
  v21 = v20;
  sub_1BC0D9CFC();
  swift_bridgeObjectRelease();
  v23 = 0xD000000000000011;
  v24 = 0x80000001BC0DAA80;
  sub_1BC0D7D28(0, &qword_1ED6B4F30);
  sub_1BC0D9DB0();
  sub_1BC0D9BC4();
  swift_bridgeObjectRelease();
  v22 = (void *)sub_1BC0D9BA0();
  swift_bridgeObjectRelease();
  objc_msgSend(v21, sel_setDebugIdentifier_, v22);

  objc_msgSend(v16, sel_executeQuery_, v21);
  swift_release();

}

void sub_1BC0D828C(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  void *v12;
  id v13;
  _QWORD *v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  id v20;
  id v21;
  void *v22;
  unint64_t v23;
  unint64_t v24;
  void (*v25)(uint64_t, void *, void *, void *, uint64_t, void *);
  void *v26;
  uint64_t (*v27)(uint64_t, void *, int, char, uint64_t);
  _QWORD *v28;

  v8 = swift_allocObject();
  *(_QWORD *)(v8 + 16) = a1;
  *(_QWORD *)(v8 + 24) = a2;
  v9 = swift_allocObject();
  *(_QWORD *)(v9 + 16) = MEMORY[0x1E0DEE9D8];
  sub_1BC0D9098();
  v10 = swift_allocObject();
  *(_OWORD *)(v10 + 16) = xmmword_1BC0DA3F0;
  sub_1BC0D9BAC();
  v11 = objc_allocWithZone(MEMORY[0x1E0CB3928]);
  swift_retain();
  v12 = (void *)sub_1BC0D9BA0();
  swift_bridgeObjectRelease();
  v13 = objc_msgSend(v11, sel_initWithKey_ascending_, v12, 0);

  *(_QWORD *)(v10 + 32) = v13;
  sub_1BC0D9C24();
  v14 = (_QWORD *)swift_allocObject();
  v14[2] = a4;
  v14[3] = sub_1BC0D9070;
  v14[4] = v8;
  v14[5] = v9;
  v15 = objc_allocWithZone(MEMORY[0x1E0CB6D28]);
  sub_1BC0D7D28(0, &qword_1ED6B4F00);
  v16 = a4;
  swift_retain();
  v17 = a3;
  v18 = (void *)sub_1BC0D9C0C();
  swift_bridgeObjectRelease();
  v27 = sub_1BC0D99BC;
  v28 = v14;
  v23 = MEMORY[0x1E0C809B0];
  v24 = 1107296256;
  v25 = sub_1BC0D915C;
  v26 = &block_descriptor_46;
  v19 = _Block_copy(&v23);
  v20 = objc_msgSend(v15, sel_initWithPredicate_anchor_limit_sortDescriptors_resultsHandler_, v17, 0, 0, v18, v19);

  _Block_release(v19);
  swift_release();
  v23 = 0;
  v24 = 0xE000000000000000;
  v21 = v20;
  sub_1BC0D9CFC();
  swift_bridgeObjectRelease();
  v23 = 0xD000000000000011;
  v24 = 0x80000001BC0DAA80;
  sub_1BC0D7D28(0, (unint64_t *)&qword_1ED6B4F28);
  sub_1BC0D9DB0();
  sub_1BC0D9BC4();
  swift_bridgeObjectRelease();
  v22 = (void *)sub_1BC0D9BA0();
  swift_bridgeObjectRelease();
  objc_msgSend(v21, sel_setDebugIdentifier_, v22);

  objc_msgSend(v16, sel_executeQuery_, v21);
  swift_release();

}

void sub_1BC0D858C(uint64_t a1, uint64_t a2, void *a3, void *a4, uint64_t a5)
{
  _QWORD *v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  void *v14;
  id v15;
  _QWORD *v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  void *v21;
  id v22;
  id v23;
  void *v24;
  unint64_t v25;
  unint64_t v26;
  void (*v27)(uint64_t, void *, void *, void *, uint64_t, void *);
  void *v28;
  uint64_t (*v29)(uint64_t, void *, uint64_t, int, uint64_t);
  _QWORD *v30;

  v10 = (_QWORD *)swift_allocObject();
  v10[2] = a5;
  v10[3] = a1;
  v10[4] = a2;
  v11 = swift_allocObject();
  swift_retain();
  *(_QWORD *)(v11 + 16) = sub_1BC0D9B88();
  sub_1BC0D9098();
  v12 = swift_allocObject();
  *(_OWORD *)(v12 + 16) = xmmword_1BC0DA3F0;
  sub_1BC0D9BAC();
  v13 = objc_allocWithZone(MEMORY[0x1E0CB3928]);
  v14 = (void *)sub_1BC0D9BA0();
  swift_bridgeObjectRelease();
  v15 = objc_msgSend(v13, sel_initWithKey_ascending_, v14, 0);

  *(_QWORD *)(v12 + 32) = v15;
  sub_1BC0D9C24();
  v16 = (_QWORD *)swift_allocObject();
  v16[2] = a5;
  v16[3] = a4;
  v16[4] = sub_1BC0D9234;
  v16[5] = v10;
  v16[6] = v11;
  v17 = objc_allocWithZone(MEMORY[0x1E0CB6D28]);
  sub_1BC0D7D28(0, &qword_1ED6B4F00);
  v18 = a4;
  swift_retain();
  v19 = a3;
  v20 = (void *)sub_1BC0D9C0C();
  swift_bridgeObjectRelease();
  v29 = sub_1BC0D92A0;
  v30 = v16;
  v25 = MEMORY[0x1E0C809B0];
  v26 = 1107296256;
  v27 = sub_1BC0D915C;
  v28 = &block_descriptor_27_0;
  v21 = _Block_copy(&v25);
  v22 = objc_msgSend(v17, sel_initWithPredicate_anchor_limit_sortDescriptors_resultsHandler_, v19, 0, 0, v20, v21);

  _Block_release(v21);
  swift_release();
  v25 = 0;
  v26 = 0xE000000000000000;
  v23 = v22;
  sub_1BC0D9CFC();
  swift_bridgeObjectRelease();
  v25 = 0xD000000000000011;
  v26 = 0x80000001BC0DAA80;
  sub_1BC0D9DB0();
  sub_1BC0D9BC4();
  swift_bridgeObjectRelease();
  v24 = (void *)sub_1BC0D9BA0();
  swift_bridgeObjectRelease();
  objc_msgSend(v23, sel_setDebugIdentifier_, v24);

  objc_msgSend(v18, sel_executeQuery_, v23);
  swift_release();

}

uint64_t sub_1BC0D8884()
{
  uint64_t v0;

  return swift_deallocObject();
}

void sub_1BC0D88B0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  sub_1BC0D858C(a1, a2, *(void **)(v2 + 24), *(void **)(v2 + 32), *(_QWORD *)(v2 + 16));
}

uint64_t sub_1BC0D88BC(uint64_t a1, void *a2, int a3, char a4, uint64_t a5, id a6, uint64_t (*a7)(uint64_t, uint64_t), int a8, uint64_t a9, uint64_t a10)
{
  uint64_t result;
  uint64_t v17;

  if (a5)
  {
    objc_msgSend(a6, sel_stopQuery_, a1);
    return a7(a5, 1);
  }
  else
  {
    objc_opt_self();
    result = swift_dynamicCastObjCClass();
    if (result)
    {
      swift_beginAccess();
      MEMORY[0x1BCCEB11C](a2);
      if (*(_QWORD *)((*(_QWORD *)(a9 + 16) & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((*(_QWORD *)(a9 + 16) & 0xFFFFFFFFFFFFFF8)
                                                                                         + 0x18) >> 1)
        sub_1BC0D9C3C();
      sub_1BC0D9C60();
      sub_1BC0D9C24();
      result = swift_endAccess();
    }
    if ((a4 & 1) != 0)
    {
      objc_msgSend(a6, sel_stopQuery_, a1);
      swift_beginAccess();
      v17 = swift_bridgeObjectRetain();
      a7(v17, 0);
      return swift_bridgeObjectRelease();
    }
  }
  return result;
}

uint64_t sub_1BC0D8A0C(uint64_t a1, void *a2, uint64_t a3, int a4, uint64_t a5, void *a6, uint64_t (*a7)(uint64_t, uint64_t), uint64_t a8, uint64_t a9, uint64_t a10)
{
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  _BYTE *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  _BYTE *v21;
  uint64_t v22;
  _BYTE *v23;
  uint64_t result;
  id v25;
  char v26;
  void (*v27)(_BYTE *, uint64_t, uint64_t, uint64_t);
  uint64_t v28;
  id v29;
  uint64_t v30;
  _BYTE v31[4];
  int v32;
  uint64_t v33;
  uint64_t (*v34)(uint64_t, uint64_t);
  uint64_t v35;
  id v36;
  void *v37;

  v33 = a8;
  v34 = a7;
  v35 = a1;
  v36 = a6;
  v13 = sub_1BC0D9CCC();
  v14 = *(_QWORD *)(v13 - 8);
  v15 = MEMORY[0x1E0C80A78](v13);
  v17 = &v31[-v16];
  v18 = *(_QWORD *)(a10 - 8);
  v19 = MEMORY[0x1E0C80A78](v15);
  v21 = &v31[-((v20 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x1E0C80A78](v19);
  v23 = &v31[-v22];
  if (a5)
  {
    objc_msgSend(v36, sel_stopQuery_, v35);
    return v34(a5, 1);
  }
  else
  {
    v32 = a4;
    v37 = a2;
    sub_1BC0D776C(0, &qword_1ED6B4F60, (unint64_t *)&qword_1ED6B4F28, 0x1E0CB6CE8, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0DEB940]);
    v25 = a2;
    v26 = swift_dynamicCast();
    v27 = *(void (**)(_BYTE *, uint64_t, uint64_t, uint64_t))(v18 + 56);
    v28 = v35;
    v29 = v36;
    if ((v26 & 1) != 0)
    {
      v27(v17, 0, 1, a10);
      (*(void (**)(_BYTE *, _BYTE *, uint64_t))(v18 + 32))(v23, v17, a10);
      (*(void (**)(_BYTE *, _BYTE *, uint64_t))(v18 + 16))(v21, v23, a10);
      swift_beginAccess();
      sub_1BC0D9C84();
      sub_1BC0D9C6C();
      swift_endAccess();
      result = (*(uint64_t (**)(_BYTE *, uint64_t))(v18 + 8))(v23, a10);
    }
    else
    {
      v27(v17, 1, 1, a10);
      result = (*(uint64_t (**)(_BYTE *, uint64_t))(v14 + 8))(v17, v13);
    }
    if ((v32 & 1) != 0)
    {
      objc_msgSend(v29, sel_stopQuery_, v28);
      swift_beginAccess();
      v30 = swift_bridgeObjectRetain();
      v34(v30, 0);
      return swift_bridgeObjectRelease();
    }
  }
  return result;
}

uint64_t HKHealthStore.makeUDCListsPublisher(for:)(uint64_t a1)
{
  void *v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  uint64_t v12;

  sub_1BC0D8D98();
  v4 = v3;
  v5 = *(_QWORD *)(v3 - 8);
  MEMORY[0x1E0C80A78](v3);
  v7 = (char *)&v12 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = swift_allocObject();
  *(_QWORD *)(v8 + 16) = a1;
  *(_QWORD *)(v8 + 24) = v1;
  sub_1BC0D8F94(0, &qword_1ED6B4E98, (uint64_t (*)(uint64_t, uint64_t, unint64_t, _QWORD))MEMORY[0x1E0C95D78]);
  sub_1BC0D98DC(&qword_1ED6B4E90, (uint64_t)&qword_1ED6B4E98, (uint64_t (*)(uint64_t, uint64_t, _QWORD))sub_1BC0D8F94);
  v9 = v1;
  sub_1BC0D9AF8();
  sub_1BC0D7CDC(&qword_1ED6B4BE0, (uint64_t (*)(uint64_t))sub_1BC0D8D98, MEMORY[0x1E0C96148]);
  v10 = sub_1BC0D9B10();
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  return v10;
}

void sub_1BC0D8D98()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_1ED6B4BE8)
  {
    sub_1BC0D8F94(255, &qword_1ED6B4E98, (uint64_t (*)(uint64_t, uint64_t, unint64_t, _QWORD))MEMORY[0x1E0C95D78]);
    sub_1BC0D98DC(&qword_1ED6B4E90, (uint64_t)&qword_1ED6B4E98, (uint64_t (*)(uint64_t, uint64_t, _QWORD))sub_1BC0D8F94);
    v0 = sub_1BC0D9B04();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_1ED6B4BE8);
  }
}

uint64_t sub_1BC0D8E28@<X0>(uint64_t a1@<X0>, void *a2@<X1>, uint64_t *a3@<X8>)
{
  id v5;
  uint64_t v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t result;

  v5 = objc_msgSend((id)objc_opt_self(), sel_predicateForListUserDomainConceptWithListType_, a1);
  v6 = swift_allocObject();
  *(_QWORD *)(v6 + 16) = v5;
  *(_QWORD *)(v6 + 24) = a2;
  sub_1BC0D8F94(0, &qword_1ED6B4EC8, (uint64_t (*)(uint64_t, uint64_t, unint64_t, _QWORD))MEMORY[0x1E0C960D8]);
  swift_allocObject();
  v7 = v5;
  v8 = a2;
  sub_1BC0D9AEC();
  sub_1BC0D9024(&qword_1ED6B4EC0, (uint64_t)&qword_1ED6B4EC8, (uint64_t (*)(uint64_t, uint64_t, _QWORD))sub_1BC0D8F94);
  v9 = sub_1BC0D9B10();

  result = swift_release();
  *a3 = v9;
  return result;
}

uint64_t sub_1BC0D8F48()
{
  uint64_t v0;

  return swift_deallocObject();
}

uint64_t sub_1BC0D8F6C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v1;

  return sub_1BC0D8E28(*(_QWORD *)(v1 + 16), *(void **)(v1 + 24), a1);
}

uint64_t dispatch thunk of ListConceptManagerDataProvider.listType.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t dispatch thunk of ListConceptManagerDataProvider.listName.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

uint64_t dispatch thunk of ListConceptManagerDataProvider.makeAllConceptsPublisher(with:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 24))();
}

void sub_1BC0D8F8C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  sub_1BC0D7F8C(a1, a2, *(void **)(v2 + 16), *(void **)(v2 + 24));
}

void sub_1BC0D8F94(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t, uint64_t, unint64_t, _QWORD))
{
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t v10;

  if (!*a2)
  {
    sub_1BC0D776C(255, &qword_1ED6B4EF8, &qword_1ED6B4F30, 0x1E0CB6800, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0DEAEC8]);
    v7 = v6;
    v8 = sub_1BC0D7F38();
    v9 = a3(a1, v7, v8, MEMORY[0x1E0DEDB38]);
    if (!v10)
      atomic_store(v9, a2);
  }
}

uint64_t sub_1BC0D9024(unint64_t *a1, uint64_t a2, uint64_t (*a3)(uint64_t, uint64_t, _QWORD))
{
  uint64_t result;
  uint64_t v5;

  result = *a1;
  if (!result)
  {
    v5 = a3(255, a2, MEMORY[0x1E0C960D8]);
    result = MEMORY[0x1BCCEB5FC](MEMORY[0x1E0C96108], v5);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_1BC0D9074()
{
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

void sub_1BC0D9098()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_1ED6B4F38)
  {
    v0 = sub_1BC0D9D98();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_1ED6B4F38);
  }
}

uint64_t sub_1BC0D90F4(uint64_t a1, void *a2, int a3, char a4, uint64_t a5)
{
  uint64_t v5;

  return sub_1BC0D88BC(a1, a2, a3, a4, a5, *(id *)(v5 + 16), *(uint64_t (**)(uint64_t, uint64_t))(v5 + 24), *(_QWORD *)(v5 + 32), *(_QWORD *)(v5 + 40), 0x1E0CB6800);
}

uint64_t sub_1BC0D9124()
{
  uint64_t v0;

  return *(_QWORD *)v0;
}

uint64_t sub_1BC0D912C()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 8);
  swift_bridgeObjectRetain();
  return v1;
}

void sub_1BC0D915C(uint64_t a1, void *a2, void *a3, void *a4, uint64_t a5, void *a6)
{
  void (*v11)(id, void *, void *, uint64_t, void *);
  id v12;
  id v13;
  id v14;
  id v15;

  v11 = *(void (**)(id, void *, void *, uint64_t, void *))(a1 + 32);
  swift_retain();
  v15 = a2;
  v12 = a3;
  v13 = a4;
  v14 = a6;
  v11(v15, a3, a4, a5, a6);
  swift_release();

}

uint64_t sub_1BC0D9210()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_1BC0D9234(uint64_t a1, char a2)
{
  uint64_t v2;
  uint64_t (*v3)(uint64_t *);
  uint64_t v5;
  char v6;

  v3 = *(uint64_t (**)(uint64_t *))(v2 + 24);
  v5 = a1;
  v6 = a2 & 1;
  return v3(&v5);
}

uint64_t sub_1BC0D926C()
{
  uint64_t v0;

  swift_release();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_1BC0D92A0(uint64_t a1, void *a2, uint64_t a3, int a4, uint64_t a5)
{
  uint64_t v5;

  return sub_1BC0D8A0C(a1, a2, a3, a4, a5, *(void **)(v5 + 24), *(uint64_t (**)(uint64_t, uint64_t))(v5 + 32), *(_QWORD *)(v5 + 40), *(_QWORD *)(v5 + 48), *(_QWORD *)(v5 + 16));
}

uint64_t initializeBufferWithCopyOfBuffer for LabsListDataProvider(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t destroy for LabsListDataProvider()
{
  return swift_bridgeObjectRelease();
}

_QWORD *assignWithCopy for LabsListDataProvider(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  a1[2] = a2[2];
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

uint64_t assignWithTake for LabsListDataProvider(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for LabsListDataProvider(uint64_t a1, int a2)
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

uint64_t storeEnumTagSinglePayload for LabsListDataProvider(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for LabsListDataProvider()
{
  return &type metadata for LabsListDataProvider;
}

uint64_t sub_1BC0D9434(void *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  void *v6;
  id v7;
  uint64_t v8;
  id v9;
  id v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  id v14;
  id v15;
  uint64_t v16;
  uint64_t (*v17)(void);
  uint64_t v18;
  uint64_t v19;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;

  sub_1BC0D975C();
  v3 = *(_QWORD *)(v2 - 8);
  v21 = v2;
  v22 = v3;
  MEMORY[0x1E0C80A78](v2);
  v5 = (char *)&v21 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = (void *)objc_opt_self();
  v7 = objc_msgSend(v6, sel_predicateForMedicalUserDomainConceptWithCategoryType_, 2);
  v8 = swift_allocObject();
  *(_QWORD *)(v8 + 16) = v7;
  *(_QWORD *)(v8 + 24) = a1;
  sub_1BC0D984C(0, &qword_1ED6B4EB8, (uint64_t (*)(uint64_t, uint64_t, unint64_t, _QWORD))MEMORY[0x1E0C960D8]);
  swift_allocObject();
  v9 = v7;
  v10 = a1;
  v24 = sub_1BC0D9AEC();
  sub_1BC0D9024(&qword_1ED6B4EB0, (uint64_t)&qword_1ED6B4EB8, (uint64_t (*)(uint64_t, uint64_t, _QWORD))sub_1BC0D984C);
  v11 = sub_1BC0D9B10();

  swift_release();
  v12 = objc_msgSend(v6, sel_predicateForListUserDomainConceptWithListType_, 1);
  v13 = swift_allocObject();
  *(_QWORD *)(v13 + 16) = v12;
  *(_QWORD *)(v13 + 24) = v10;
  sub_1BC0D8F94(0, &qword_1ED6B4EC8, (uint64_t (*)(uint64_t, uint64_t, unint64_t, _QWORD))MEMORY[0x1E0C960D8]);
  swift_allocObject();
  v14 = v10;
  v15 = v12;
  v24 = sub_1BC0D9AEC();
  sub_1BC0D9024(&qword_1ED6B4EC0, (uint64_t)&qword_1ED6B4EC8, (uint64_t (*)(uint64_t, uint64_t, _QWORD))sub_1BC0D8F94);
  v16 = sub_1BC0D9B10();

  swift_release();
  v23 = v16;
  v24 = v11;
  v17 = MEMORY[0x1E0C95D78];
  sub_1BC0D984C(0, &qword_1ED6B4E88, (uint64_t (*)(uint64_t, uint64_t, unint64_t, _QWORD))MEMORY[0x1E0C95D78]);
  sub_1BC0D8F94(0, &qword_1ED6B4E98, (uint64_t (*)(uint64_t, uint64_t, unint64_t, _QWORD))v17);
  sub_1BC0D98DC(&qword_1ED6B4E80, (uint64_t)&qword_1ED6B4E88, (uint64_t (*)(uint64_t, uint64_t, _QWORD))sub_1BC0D984C);
  sub_1BC0D98DC(&qword_1ED6B4E90, (uint64_t)&qword_1ED6B4E98, (uint64_t (*)(uint64_t, uint64_t, _QWORD))sub_1BC0D8F94);
  swift_retain();
  swift_retain();
  sub_1BC0D9A68();
  sub_1BC0D7CDC(&qword_1ED6B4E50, (uint64_t (*)(uint64_t))sub_1BC0D975C, MEMORY[0x1E0C95698]);
  v18 = v21;
  v19 = sub_1BC0D9B10();
  swift_release();
  swift_release();
  (*(void (**)(char *, uint64_t))(v22 + 8))(v5, v18);
  return v19;
}

void sub_1BC0D975C()
{
  uint64_t (*v0)(void);
  unint64_t v1;
  uint64_t v2;

  if (!qword_1ED6B4E58)
  {
    v0 = MEMORY[0x1E0C95D78];
    sub_1BC0D984C(255, &qword_1ED6B4E88, (uint64_t (*)(uint64_t, uint64_t, unint64_t, _QWORD))MEMORY[0x1E0C95D78]);
    sub_1BC0D8F94(255, &qword_1ED6B4E98, (uint64_t (*)(uint64_t, uint64_t, unint64_t, _QWORD))v0);
    sub_1BC0D98DC(&qword_1ED6B4E80, (uint64_t)&qword_1ED6B4E88, (uint64_t (*)(uint64_t, uint64_t, _QWORD))sub_1BC0D984C);
    sub_1BC0D98DC(&qword_1ED6B4E90, (uint64_t)&qword_1ED6B4E98, (uint64_t (*)(uint64_t, uint64_t, _QWORD))sub_1BC0D8F94);
    v1 = sub_1BC0D9A5C();
    if (!v2)
      atomic_store(v1, (unint64_t *)&qword_1ED6B4E58);
  }
}

void sub_1BC0D984C(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t, uint64_t, unint64_t, _QWORD))
{
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t v10;

  if (!*a2)
  {
    sub_1BC0D776C(255, &qword_1ED6B4EE8, (unint64_t *)&qword_1ED6B4F28, 0x1E0CB6CE8, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0DEAEC8]);
    v7 = v6;
    v8 = sub_1BC0D7F38();
    v9 = a3(a1, v7, v8, MEMORY[0x1E0DEDB38]);
    if (!v10)
      atomic_store(v9, a2);
  }
}

uint64_t sub_1BC0D98DC(unint64_t *a1, uint64_t a2, uint64_t (*a3)(uint64_t, uint64_t, _QWORD))
{
  uint64_t result;
  uint64_t v5;

  result = *a1;
  if (!result)
  {
    v5 = a3(255, a2, MEMORY[0x1E0C95D78]);
    result = MEMORY[0x1BCCEB5FC](MEMORY[0x1E0C95D90], v5);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_1BC0D9928()
{
  uint64_t v0;

  return swift_deallocObject();
}

void sub_1BC0D9954(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  sub_1BC0D828C(a1, a2, *(void **)(v2 + 16), *(void **)(v2 + 24));
}

uint64_t sub_1BC0D995C()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_1BC0D9980(uint64_t a1, char a2)
{
  uint64_t v2;
  uint64_t (*v3)(uint64_t *);
  uint64_t v5;
  char v6;

  v3 = *(uint64_t (**)(uint64_t *))(v2 + 16);
  v5 = a1;
  v6 = a2 & 1;
  return v3(&v5);
}

uint64_t sub_1BC0D99BC(uint64_t a1, void *a2, int a3, char a4, uint64_t a5)
{
  uint64_t v5;

  return sub_1BC0D88BC(a1, a2, a3, a4, a5, *(id *)(v5 + 16), *(uint64_t (**)(uint64_t, uint64_t))(v5 + 24), *(_QWORD *)(v5 + 32), *(_QWORD *)(v5 + 40), 0x1E0CB6CE8);
}

uint64_t sub_1BC0D9A14()
{
  return MEMORY[0x1E0CB0948]();
}

uint64_t sub_1BC0D9A20()
{
  return MEMORY[0x1E0CB0958]();
}

uint64_t sub_1BC0D9A2C()
{
  return MEMORY[0x1E0CB0998]();
}

uint64_t sub_1BC0D9A38()
{
  return MEMORY[0x1E0D2BE90]();
}

uint64_t sub_1BC0D9A44()
{
  return MEMORY[0x1E0D2BEA8]();
}

uint64_t sub_1BC0D9A50()
{
  return MEMORY[0x1E0DF2080]();
}

uint64_t sub_1BC0D9A5C()
{
  return MEMORY[0x1E0C95680]();
}

uint64_t sub_1BC0D9A68()
{
  return MEMORY[0x1E0C95690]();
}

uint64_t sub_1BC0D9A74()
{
  return MEMORY[0x1E0C95AC0]();
}

uint64_t sub_1BC0D9A80()
{
  return MEMORY[0x1E0C95CA8]();
}

uint64_t sub_1BC0D9A8C()
{
  return MEMORY[0x1E0C95D78]();
}

uint64_t sub_1BC0D9A98()
{
  return MEMORY[0x1E0C95F60]();
}

uint64_t sub_1BC0D9AA4()
{
  return MEMORY[0x1E0C95F70]();
}

uint64_t sub_1BC0D9AB0()
{
  return MEMORY[0x1E0C95F78]();
}

uint64_t sub_1BC0D9ABC()
{
  return MEMORY[0x1E0C95F88]();
}

uint64_t sub_1BC0D9AC8()
{
  return MEMORY[0x1E0C95FA8]();
}

uint64_t sub_1BC0D9AD4()
{
  return MEMORY[0x1E0C960D8]();
}

uint64_t sub_1BC0D9AE0()
{
  return MEMORY[0x1E0C960F0]();
}

uint64_t sub_1BC0D9AEC()
{
  return MEMORY[0x1E0C96100]();
}

uint64_t sub_1BC0D9AF8()
{
  return MEMORY[0x1E0C96130]();
}

uint64_t sub_1BC0D9B04()
{
  return MEMORY[0x1E0C96138]();
}

uint64_t sub_1BC0D9B10()
{
  return MEMORY[0x1E0C961D0]();
}

uint64_t sub_1BC0D9B1C()
{
  return MEMORY[0x1E0C96290]();
}

uint64_t sub_1BC0D9B28()
{
  return MEMORY[0x1E0C96308]();
}

uint64_t sub_1BC0D9B34()
{
  return MEMORY[0x1E0C96378]();
}

uint64_t sub_1BC0D9B40()
{
  return MEMORY[0x1E0C96410]();
}

uint64_t sub_1BC0D9B4C()
{
  return MEMORY[0x1E0DEF4F8]();
}

uint64_t sub_1BC0D9B58()
{
  return MEMORY[0x1E0DEF578]();
}

uint64_t sub_1BC0D9B64()
{
  return MEMORY[0x1E0DEF5B0]();
}

uint64_t sub_1BC0D9B70()
{
  return MEMORY[0x1E0DEF748]();
}

uint64_t sub_1BC0D9B7C()
{
  return MEMORY[0x1E0DEF778]();
}

uint64_t sub_1BC0D9B88()
{
  return MEMORY[0x1E0DE9D70]();
}

uint64_t sub_1BC0D9B94()
{
  return MEMORY[0x1E0DEA568]();
}

uint64_t sub_1BC0D9BA0()
{
  return MEMORY[0x1E0CB1940]();
}

uint64_t sub_1BC0D9BAC()
{
  return MEMORY[0x1E0CB1980]();
}

uint64_t sub_1BC0D9BB8()
{
  return MEMORY[0x1E0DEA5F8]();
}

uint64_t sub_1BC0D9BC4()
{
  return MEMORY[0x1E0DEA800]();
}

uint64_t sub_1BC0D9BD0()
{
  return MEMORY[0x1E0DEA850]();
}

uint64_t sub_1BC0D9BDC()
{
  return MEMORY[0x1E0DEAAA8]();
}

uint64_t sub_1BC0D9BE8()
{
  return MEMORY[0x1E0DEAB00]();
}

uint64_t sub_1BC0D9BF4()
{
  return MEMORY[0x1E0DEABA0]();
}

uint64_t sub_1BC0D9C00()
{
  return MEMORY[0x1E0DEADA0]();
}

uint64_t sub_1BC0D9C0C()
{
  return MEMORY[0x1E0CB1AC0]();
}

uint64_t sub_1BC0D9C18()
{
  return MEMORY[0x1E0CB1AE8]();
}

uint64_t sub_1BC0D9C24()
{
  return MEMORY[0x1E0DEADB8]();
}

uint64_t sub_1BC0D9C30()
{
  return MEMORY[0x1E0DEADC8]();
}

uint64_t sub_1BC0D9C3C()
{
  return MEMORY[0x1E0DEADE8]();
}

uint64_t sub_1BC0D9C48()
{
  return MEMORY[0x1E0DEAE10]();
}

uint64_t sub_1BC0D9C54()
{
  return MEMORY[0x1E0DEAE38]();
}

uint64_t sub_1BC0D9C60()
{
  return MEMORY[0x1E0DEAE58]();
}

uint64_t sub_1BC0D9C6C()
{
  return MEMORY[0x1E0DEAE80]();
}

uint64_t sub_1BC0D9C78()
{
  return MEMORY[0x1E0DEAE98]();
}

uint64_t sub_1BC0D9C84()
{
  return MEMORY[0x1E0DEAEC8]();
}

uint64_t sub_1BC0D9C90()
{
  return MEMORY[0x1E0DF2280]();
}

uint64_t sub_1BC0D9C9C()
{
  return MEMORY[0x1E0DF2290]();
}

uint64_t sub_1BC0D9CA8()
{
  return MEMORY[0x1E0DEF868]();
}

uint64_t sub_1BC0D9CB4()
{
  return MEMORY[0x1E0DEF900]();
}

uint64_t sub_1BC0D9CC0()
{
  return MEMORY[0x1E0DEFCE0]();
}

uint64_t sub_1BC0D9CCC()
{
  return MEMORY[0x1E0DEB940]();
}

uint64_t sub_1BC0D9CD8()
{
  return MEMORY[0x1E0DEBC20]();
}

uint64_t sub_1BC0D9CE4()
{
  return MEMORY[0x1E0DEBC90]();
}

uint64_t sub_1BC0D9CF0()
{
  return MEMORY[0x1E0DEC060]();
}

uint64_t sub_1BC0D9CFC()
{
  return MEMORY[0x1E0DEC2A8]();
}

uint64_t sub_1BC0D9D08()
{
  return MEMORY[0x1E0DEC2B0]();
}

uint64_t sub_1BC0D9D14()
{
  return MEMORY[0x1E0DEC3D0]();
}

uint64_t sub_1BC0D9D20()
{
  return MEMORY[0x1E0DEC3D8]();
}

uint64_t sub_1BC0D9D2C()
{
  return MEMORY[0x1E0DEC3E0]();
}

uint64_t sub_1BC0D9D38()
{
  return MEMORY[0x1E0DEC3E8]();
}

uint64_t sub_1BC0D9D44()
{
  return MEMORY[0x1E0DEC588]();
}

uint64_t sub_1BC0D9D50()
{
  return MEMORY[0x1E0DECBE0]();
}

uint64_t sub_1BC0D9D5C()
{
  return MEMORY[0x1E0DECBE8]();
}

uint64_t sub_1BC0D9D68()
{
  return MEMORY[0x1E0DECD18]();
}

uint64_t sub_1BC0D9D74()
{
  return MEMORY[0x1E0DECD20]();
}

uint64_t sub_1BC0D9D80()
{
  return MEMORY[0x1E0DECD70]();
}

uint64_t sub_1BC0D9D8C()
{
  return MEMORY[0x1E0DED1D0]();
}

uint64_t sub_1BC0D9D98()
{
  return MEMORY[0x1E0DED1E8]();
}

uint64_t sub_1BC0D9DA4()
{
  return MEMORY[0x1E0DED770]();
}

uint64_t sub_1BC0D9DB0()
{
  return MEMORY[0x1E0DEE978]();
}

uint64_t HKCreateSerialDispatchQueue()
{
  return MEMORY[0x1E0CB4B08]();
}

uint64_t HKLogHealthOntology()
{
  return MEMORY[0x1E0CB52D0]();
}

uint64_t HKStringFromListUserDomainType()
{
  return MEMORY[0x1E0CB5FD8]();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x1E0C80928](aBlock);
}

void _Block_release(const void *aBlock)
{
  MEMORY[0x1E0C80958](aBlock);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81048](dso, log, type, format, buf, *(_QWORD *)&size);
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x1E0DEEA40]();
}

void free(void *a1)
{
  MEMORY[0x1E0C834A8](a1);
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

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x1E0DE7BB0](a1);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x1E0DE7D20](a1, a2);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x1E0DE7D30](a1, a2);
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

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7E68](a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1E0C84780](oslog, type);
}

uint64_t swift_allocBox()
{
  return MEMORY[0x1E0DEEA98]();
}

uint64_t swift_allocObject()
{
  return MEMORY[0x1E0DEEAB0]();
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

uint64_t swift_deallocClassInstance()
{
  return MEMORY[0x1E0DEEB50]();
}

uint64_t swift_deallocObject()
{
  return MEMORY[0x1E0DEEB60]();
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

uint64_t swift_getExistentialTypeMetadata()
{
  return MEMORY[0x1E0DEEC60]();
}

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x1E0DEEC78]();
}

uint64_t swift_getMetatypeMetadata()
{
  return MEMORY[0x1E0DEECC0]();
}

uint64_t swift_getObjCClassMetadata()
{
  return MEMORY[0x1E0DEECD8]();
}

uint64_t swift_getObjectType()
{
  return MEMORY[0x1E0DEECE0]();
}

uint64_t swift_getTupleTypeMetadata2()
{
  return MEMORY[0x1E0DEED20]();
}

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x1E0DEED50]();
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

uint64_t swift_slowAlloc()
{
  return MEMORY[0x1E0DEEE78]();
}

uint64_t swift_slowDealloc()
{
  return MEMORY[0x1E0DEEE80]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x1E0DEEEC0]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x1E0DEEED0]();
}

uint64_t swift_unknownObjectRetain_n()
{
  return MEMORY[0x1E0DEEED8]();
}

uint64_t swift_weakDestroy()
{
  return MEMORY[0x1E0DEEF98]();
}

uint64_t swift_weakInit()
{
  return MEMORY[0x1E0DEEFA0]();
}

