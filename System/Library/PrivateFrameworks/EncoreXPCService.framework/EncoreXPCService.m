uint64_t static AnySynchronizableState.subscript.getter@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v4;
  void (*v5)(_BYTE *, _QWORD);
  _BYTE v7[32];
  uint64_t v8;

  v4 = *a2;
  v8 = a1;
  swift_unknownObjectRetain();
  v5 = (void (*)(_BYTE *, _QWORD))swift_readAtKeyPath();
  (*(void (**)(uint64_t))(*(_QWORD *)(*(_QWORD *)(*MEMORY[0x24BEE35B8] + v4 + 8) - 8) + 16))(a3);
  v5(v7, 0);
  return swift_unknownObjectRelease();
}

uint64_t static AnySynchronizableState.subscript.setter(uint64_t a1, uint64_t a2, _QWORD *a3, _QWORD *a4)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint8_t *AssociatedTypeWitness;
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
  uint64_t v26;
  char *v27;
  void (*v28)(char *, uint64_t);
  void (*v29)(char *, uint64_t);
  uint64_t v30;
  NSObject *v31;
  os_log_type_t v32;
  BOOL v33;
  uint64_t v34;
  uint64_t v35;
  uint8_t *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  NSObject *v41;
  os_log_type_t v42;
  uint8_t *v43;
  void (*v44)(uint64_t *, _QWORD);
  void (*v45)(uint64_t, uint64_t, uint64_t);
  uint64_t v46;
  uint64_t v47;
  NSObject *v48;
  os_log_type_t v49;
  uint8_t *v50;
  char *v51;
  uint64_t v52;
  void (*v53)(uint64_t);
  uint64_t v54;
  uint64_t v55;
  uint8_t *v56;
  uint64_t v57;
  NSObject *v58;
  os_log_type_t v59;
  uint8_t *v60;
  char *v61;
  uint64_t v62;
  unint64_t v63;
  uint8_t *v64;
  char *v65;
  _QWORD v67[2];
  char *v68;
  void (**v69)(char *, uint64_t);
  char *v70;
  uint64_t v71;
  char *v72;
  uint64_t v73;
  uint64_t v74;
  uint8_t *v75;
  uint8_t *v76;
  char *v77;
  uint64_t v78;
  uint64_t v79;
  _QWORD *v80;
  _QWORD *v81;
  uint64_t v82;
  uint64_t v83[4];
  uint64_t v84;

  v82 = a1;
  v80 = a3;
  v6 = *a3;
  v7 = *MEMORY[0x24BEE35B8] + 8;
  v8 = *(_QWORD *)(*a4 + v7);
  v9 = *(_QWORD *)(v8 + 32);
  v10 = *(_QWORD *)(*a3 + *MEMORY[0x24BEE35B8]);
  AssociatedTypeWitness = (uint8_t *)swift_getAssociatedTypeWitness();
  v75 = (uint8_t *)*((_QWORD *)AssociatedTypeWitness - 1);
  v76 = AssociatedTypeWitness;
  v12 = ((uint64_t (*)(void))MEMORY[0x24BDAC7A8])();
  v67[1] = (char *)v67 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = MEMORY[0x24BDAC7A8](v12);
  v70 = (char *)v67 - v15;
  MEMORY[0x24BDAC7A8](v14);
  v77 = (char *)v67 - v16;
  v74 = v9;
  v79 = *(_QWORD *)(v9 + 8);
  v78 = swift_getAssociatedTypeWitness();
  v69 = *(void (***)(char *, uint64_t))(v78 - 8);
  v17 = MEMORY[0x24BDAC7A8](v78);
  v68 = (char *)v67 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  v19 = MEMORY[0x24BDAC7A8](v17);
  v20 = *(_QWORD *)(v6 + v7);
  v21 = *(_QWORD *)(v20 - 8);
  v22 = MEMORY[0x24BDAC7A8](v19);
  v24 = (char *)v67 - v23;
  v25 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v22);
  v27 = (char *)v67 - v26;
  v83[0] = a2;
  swift_unknownObjectRetain();
  swift_retain();
  swift_getAtKeyPath();
  swift_unknownObjectRelease();
  v81 = a4;
  swift_release();
  (*(void (**)(char *, char *, uint64_t))(v21 + 16))(v24, v27, v20);
  v28 = *(void (**)(char *, uint64_t))(v25 + 8);
  v72 = v27;
  v28(v27, v8);
  v73 = v8;
  LOBYTE(v25) = sub_23A8A93D8();
  v71 = v21;
  v29 = *(void (**)(char *, uint64_t))(v21 + 8);
  v29(v24, v20);
  if ((v25 & 1) != 0)
  {
    if (qword_2542D86C0 != -1)
      swift_once();
    v30 = sub_23A8A936C();
    __swift_project_value_buffer(v30, (uint64_t)qword_2542D87E8);
    v31 = sub_23A8A9360();
    v32 = sub_23A8A951C();
    v33 = os_log_type_enabled(v31, v32);
    v34 = v82;
    if (v33)
    {
      v35 = v20;
      v36 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v36 = 0;
      _os_log_impl(&dword_23A89B000, v31, v32, "#AnySynchronizableState: Instance value is already set to newValue. Skipping.", v36, 2u);
      MEMORY[0x23B85A7AC](v36, -1, -1);

      swift_unknownObjectRelease();
      swift_release();
      swift_release();
      v37 = v34;
      v38 = v35;
      return ((uint64_t (*)(uint64_t, uint64_t))v29)(v37, v38);
    }

    swift_unknownObjectRelease();
    swift_release();
    swift_release();
    v37 = v34;
LABEL_21:
    v38 = v20;
    return ((uint64_t (*)(uint64_t, uint64_t))v29)(v37, v38);
  }
  v67[0] = v28;
  sub_23A8A9384();
  sub_23A8A939C();
  v39 = v78;
  if (!swift_dynamicCast())
  {
    if (qword_2542D86C0 != -1)
      swift_once();
    v57 = sub_23A8A936C();
    __swift_project_value_buffer(v57, (uint64_t)qword_2542D87E8);
    swift_unknownObjectRetain_n();
    v58 = sub_23A8A9360();
    v59 = sub_23A8A9528();
    if (os_log_type_enabled(v58, v59))
    {
      v60 = (uint8_t *)swift_slowAlloc();
      v77 = (char *)swift_slowAlloc();
      v83[0] = (uint64_t)v77;
      *(_DWORD *)v60 = 136315138;
      v75 = v60 + 4;
      v76 = v60;
      v61 = v68;
      sub_23A8A9384();
      swift_getDynamicType();
      v69[1](v61, v39);
      v62 = sub_23A8A9714();
      v84 = sub_23A89DE70(v62, v63, v83);
      sub_23A8A9588();
      swift_unknownObjectRelease_n();
      swift_bridgeObjectRelease();
      v64 = v76;
      _os_log_impl(&dword_23A89B000, v58, v59, "#AnySynchronizableState: Failed to cast publisher; unexpected type %s. Not updating instance value.",
        v76,
        0xCu);
      v65 = v77;
      swift_arrayDestroy();
      MEMORY[0x23B85A7AC](v65, -1, -1);
      MEMORY[0x23B85A7AC](v64, -1, -1);

      swift_unknownObjectRelease();
    }
    else
    {

      swift_unknownObjectRelease_n();
    }
    swift_release();
    swift_release();
    v37 = v82;
    goto LABEL_21;
  }
  v69 = (void (**)(char *, uint64_t))v29;
  if (qword_2542D86C0 != -1)
    swift_once();
  v79 = v10;
  v40 = sub_23A8A936C();
  __swift_project_value_buffer(v40, (uint64_t)qword_2542D87E8);
  v41 = sub_23A8A9360();
  v42 = sub_23A8A951C();
  if (os_log_type_enabled(v41, v42))
  {
    v43 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v43 = 0;
    _os_log_impl(&dword_23A89B000, v41, v42, "#AnySynchronizableState: Publishing change to instance", v43, 2u);
    MEMORY[0x23B85A7AC](v43, -1, -1);
  }

  sub_23A8A9390();
  v84 = a2;
  swift_unknownObjectRetain();
  v44 = (void (*)(uint64_t *, _QWORD))swift_modifyAtReferenceWritableKeyPath();
  v45 = *(void (**)(uint64_t, uint64_t, uint64_t))(v71 + 24);
  v46 = v82;
  v78 = v20;
  v45(v47, v82, v20);
  v44(v83, 0);
  swift_unknownObjectRelease();
  v48 = sub_23A8A9360();
  v49 = sub_23A8A951C();
  if (os_log_type_enabled(v48, v49))
  {
    v50 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v50 = 0;
    _os_log_impl(&dword_23A89B000, v48, v49, "#AnySynchronizableState: Property value updated to newValue. Attempting to publish to SnippetService.", v50, 2u);
    MEMORY[0x23B85A7AC](v50, -1, -1);
  }

  v83[0] = a2;
  swift_unknownObjectRetain();
  swift_retain();
  v51 = v72;
  swift_getAtKeyPath();
  swift_unknownObjectRelease();
  swift_release();
  v52 = v73;
  v53 = *(void (**)(uint64_t))&v51[*(int *)(v73 + 52)];
  swift_retain();
  ((void (*)(char *, uint64_t))v67[0])(v51, v52);
  v54 = (uint64_t)v77;
  v53(v46);
  swift_release();
  SynchronizableObject.publish(change:)(v54, v79, v74);
  v55 = v46;
  v56 = v76;
  swift_unknownObjectRelease();
  swift_release();
  swift_release();
  swift_release();
  ((void (*)(uint64_t, uint64_t))v69)(v55, v78);
  return (*((uint64_t (**)(uint64_t, uint8_t *))v75 + 1))(v54, v56);
}

void (*static AnySynchronizableState.subscript.modify(_QWORD *a1, uint64_t a2, uint64_t *a3, uint64_t a4))(uint64_t **a1, char a2)
{
  _QWORD *v8;
  uint64_t v9;
  uint64_t v10;
  size_t v11;
  void *v12;

  v8 = malloc(0x38uLL);
  *a1 = v8;
  v8[1] = a3;
  v8[2] = a4;
  *v8 = a2;
  v9 = *(_QWORD *)(*MEMORY[0x24BEE35B8] + *a3 + 8);
  v8[3] = v9;
  v10 = *(_QWORD *)(v9 - 8);
  v8[4] = v10;
  v11 = *(_QWORD *)(v10 + 64);
  v8[5] = malloc(v11);
  v12 = malloc(v11);
  v8[6] = v12;
  static AnySynchronizableState.subscript.getter(a2, a3, (uint64_t)v12);
  return sub_23A89DA9C;
}

void sub_23A89DA9C(uint64_t **a1, char a2)
{
  uint64_t *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;
  _QWORD *v8;
  uint64_t v9;
  _QWORD *v10;
  _QWORD *v11;
  uint64_t v12;

  v2 = *a1;
  v3 = (void *)(*a1)[5];
  v4 = (void *)(*a1)[6];
  if ((a2 & 1) != 0)
  {
    v5 = v2[3];
    v6 = v2[4];
    v8 = (_QWORD *)v2[1];
    v7 = (_QWORD *)v2[2];
    v9 = *v2;
    (*(void (**)(uint64_t, void *, uint64_t))(v6 + 16))((*a1)[5], v4, v5);
    swift_retain();
    swift_retain();
    swift_unknownObjectRetain();
    static AnySynchronizableState.subscript.setter((uint64_t)v3, v9, v8, v7);
    (*(void (**)(void *, uint64_t))(v6 + 8))(v4, v5);
  }
  else
  {
    v11 = (_QWORD *)v2[1];
    v10 = (_QWORD *)v2[2];
    v12 = *v2;
    swift_retain();
    swift_retain();
    swift_unknownObjectRetain();
    static AnySynchronizableState.subscript.setter((uint64_t)v4, v12, v11, v10);
  }
  free(v4);
  free(v3);
  free(v2);
}

uint64_t AnySynchronizableState.wrappedValue.getter@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(*(_QWORD *)(a1 + 24) - 8) + 16))(a2, v2);
}

void sub_23A89DB98()
{
  type metadata accessor for AnySynchronizableState();
}

uint64_t sub_23A89DBC8(uint64_t a1)
{
  uint64_t v1;

  return AnySynchronizableState.wrappedValue.getter(a1, v1);
}

void sub_23A89DBE0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  uint64_t v9;
  __int128 v10;
  uint64_t v11;

  v4 = *(_QWORD *)(a4 + a3 - 32);
  v5 = *(_QWORD *)(a4 + a3 - 8);
  v8 = *(_OWORD *)(a4 + a3 - 24);
  MEMORY[0x24BDAC7A8](a1);
  (*(void (**)(char *))(v6 + 16))((char *)&v8 - v7);
  v9 = v4;
  v10 = v8;
  v11 = v5;
  type metadata accessor for AnySynchronizableState();
}

uint64_t sub_23A89DC64(uint64_t a1)
{
  uint64_t v1;

  return AnySynchronizableState.wrappedValue.setter(v1, a1);
}

uint64_t AnySynchronizableState.wrappedValue.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(*(_QWORD *)(a2 + 24) - 8) + 40))(v2, a1);
}

void (*AnySynchronizableState.wrappedValue.modify(_QWORD *a1, uint64_t a2))(void **a1, char a2)
{
  uint64_t v2;
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  size_t v8;
  void *v9;
  void (*v10)(void);

  v5 = malloc(0x30uLL);
  *a1 = v5;
  v6 = *(_QWORD *)(a2 + 24);
  *v5 = v2;
  v5[1] = v6;
  v7 = *(_QWORD *)(v6 - 8);
  v5[2] = v7;
  v8 = *(_QWORD *)(v7 + 64);
  v5[3] = malloc(v8);
  v9 = malloc(v8);
  v10 = *(void (**)(void))(v7 + 16);
  v5[4] = v9;
  v5[5] = v10;
  v10();
  return sub_23A89DD2C;
}

void sub_23A89DD2C(void **a1, char a2)
{
  _QWORD *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v2 = *a1;
  if ((a2 & 1) != 0)
  {
    v3 = (void *)v2[4];
    v5 = v2[2];
    v4 = (void *)v2[3];
    v7 = *v2;
    v6 = v2[1];
    ((void (*)(void *, void *, uint64_t))v2[5])(v4, v3, v6);
    (*(void (**)(uint64_t, void *, uint64_t))(v5 + 40))(v7, v4, v6);
    (*(void (**)(void *, uint64_t))(v5 + 8))(v3, v6);
  }
  else
  {
    v4 = (void *)v2[3];
    v3 = (void *)v2[4];
    (*(void (**)(_QWORD, void *, _QWORD))(v2[2] + 40))(*v2, v3, v2[1]);
  }
  free(v3);
  free(v4);
  free(v2);
}

void AnySynchronizableState.init(wrappedValue:_:)(uint64_t a1@<X0>, uint64_t a2@<X4>, uint64_t a3@<X8>)
{
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(a2 - 8) + 32))(a3, a1, a2);
  type metadata accessor for AnySynchronizableState();
}

uint64_t sub_23A89DE30(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;

  v4 = (_QWORD *)(v3 + *(int *)(result + 52));
  *v4 = v2;
  v4[1] = v1;
  return result;
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(_BYTE *)(*(_QWORD *)(a1 - 8) + 82) & 2) != 0)
    return *(_QWORD *)a2;
  return a2;
}

uint64_t sub_23A89DE70(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12[3];
  uint64_t ObjectType;

  v6 = sub_23A89E4E4(v12, 0, 0, 1, a1, a2);
  v7 = v12[0];
  if (v6)
  {
    v8 = v6;
    ObjectType = swift_getObjectType();
    v12[0] = v8;
    v9 = *a3;
    if (*a3)
    {
      sub_23A89E6BC((uint64_t)v12, *a3);
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
      sub_23A89E6BC((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v12);
  return v7;
}

void type metadata accessor for AnySynchronizableState()
{
  JUMPOUT(0x23B85A6D4);
}

uint64_t sub_23A89DF4C()
{
  return 32;
}

__n128 sub_23A89DF58(uint64_t a1, _OWORD *a2)
{
  __n128 result;
  __int128 v3;

  result = *(__n128 *)a1;
  v3 = *(_OWORD *)(a1 + 16);
  *a2 = *(_OWORD *)a1;
  a2[1] = v3;
  return result;
}

uint64_t sub_23A89DF64()
{
  return swift_allocateGenericValueMetadata();
}

uint64_t sub_23A89DF6C()
{
  uint64_t result;
  unint64_t v1;

  result = swift_checkMetadataState();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t *sub_23A89DFE4(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  uint64_t v9;
  _QWORD *v10;
  uint64_t v11;
  _QWORD *v12;

  v4 = a1;
  v5 = *(_QWORD *)(*(_QWORD *)(a3 + 24) - 8);
  v6 = *(_QWORD *)(v5 + 64);
  v7 = *(_DWORD *)(v5 + 80);
  if ((v7 & 0x1000F8) != 0 || ((v6 + 7) & 0xFFFFFFFFFFFFFFF8) + 16 > 0x18)
  {
    v9 = *a2;
    *v4 = *a2;
    v4 = (uint64_t *)(v9 + ((unsigned __int16)((v7 & 0xF8) + 23) & (unsigned __int16)~(v7 & 0xF8) & 0x1F8));
  }
  else
  {
    (*(void (**)(uint64_t *, uint64_t *))(v5 + 16))(a1, a2);
    v10 = (_QWORD *)(((unint64_t)a2 + v6 + 7) & 0xFFFFFFFFFFFFFFF8);
    v11 = v10[1];
    v12 = (_QWORD *)(((unint64_t)v4 + v6 + 7) & 0xFFFFFFFFFFFFFFF8);
    *v12 = *v10;
    v12[1] = v11;
  }
  swift_retain();
  return v4;
}

uint64_t sub_23A89E094(uint64_t a1, uint64_t a2)
{
  (*(void (**)(void))(*(_QWORD *)(*(_QWORD *)(a2 + 24) - 8) + 8))();
  return swift_release();
}

uint64_t sub_23A89E0D4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;
  _QWORD *v8;
  uint64_t v9;

  v5 = *(_QWORD *)(*(_QWORD *)(a3 + 24) - 8);
  (*(void (**)(void))(v5 + 16))();
  v6 = *(_QWORD *)(v5 + 64) + 7;
  v7 = (_QWORD *)((v6 + a1) & 0xFFFFFFFFFFFFFFF8);
  v8 = (_QWORD *)((v6 + a2) & 0xFFFFFFFFFFFFFFF8);
  v9 = v8[1];
  *v7 = *v8;
  v7[1] = v9;
  swift_retain();
  return a1;
}

uint64_t sub_23A89E134(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;
  _QWORD *v8;
  uint64_t v9;

  v5 = *(_QWORD *)(*(_QWORD *)(a3 + 24) - 8);
  (*(void (**)(void))(v5 + 24))();
  v6 = *(_QWORD *)(v5 + 64) + 7;
  v7 = (_QWORD *)((v6 + a1) & 0xFFFFFFFFFFFFFFF8);
  v8 = (_QWORD *)((v6 + a2) & 0xFFFFFFFFFFFFFFF8);
  v9 = v8[1];
  *v7 = *v8;
  v7[1] = v9;
  swift_retain();
  swift_release();
  return a1;
}

uint64_t sub_23A89E1A0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;

  v5 = *(_QWORD *)(*(_QWORD *)(a3 + 24) - 8);
  (*(void (**)(void))(v5 + 32))();
  *(_OWORD *)((*(_QWORD *)(v5 + 64) + 7 + a1) & 0xFFFFFFFFFFFFF8) = *(_OWORD *)((*(_QWORD *)(v5 + 64) + 7 + a2) & 0xFFFFFFFFFFFFF8);
  return a1;
}

uint64_t sub_23A89E1FC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;

  v5 = *(_QWORD *)(*(_QWORD *)(a3 + 24) - 8);
  (*(void (**)(void))(v5 + 40))();
  *(_OWORD *)((*(_QWORD *)(v5 + 64) + 7 + a1) & 0xFFFFFFFFFFFFFFF8) = *(_OWORD *)((*(_QWORD *)(v5 + 64) + 7 + a2) & 0xFFFFFFFFFFFFF8);
  swift_release();
  return a1;
}

uint64_t sub_23A89E260(uint64_t a1, unsigned int a2, uint64_t a3)
{
  uint64_t v4;
  unsigned int v5;
  unsigned int v6;
  uint64_t v7;
  unsigned int v8;
  unsigned int v9;
  uint64_t v10;
  unint64_t v12;

  v4 = *(_QWORD *)(*(_QWORD *)(a3 + 24) - 8);
  v5 = *(_DWORD *)(v4 + 84);
  if (v5 <= 0x7FFFFFFF)
    v6 = 0x7FFFFFFF;
  else
    v6 = *(_DWORD *)(v4 + 84);
  if (!a2)
    return 0;
  v7 = *(_QWORD *)(v4 + 64);
  if (v6 >= a2)
  {
    if (v5 < 0x7FFFFFFF)
    {
      v12 = *(_QWORD *)((a1 + v7 + 7) & 0xFFFFFFFFFFFFF8);
      if (v12 >= 0xFFFFFFFF)
        LODWORD(v12) = -1;
      return (v12 + 1);
    }
    else
    {
      return (*(uint64_t (**)(void))(v4 + 48))();
    }
  }
  else
  {
    if (((((v7 + 7) & 0xFFFFFFFFFFFFFFF8) + 16) & 0xFFFFFFF8) != 0)
      v8 = 2;
    else
      v8 = a2 - v6 + 1;
    if (v8 >= 0x10000)
      v9 = 4;
    else
      v9 = 2;
    if (v8 < 0x100)
      v9 = 1;
    if (v8 >= 2)
      v10 = v9;
    else
      v10 = 0;
    return ((uint64_t (*)(void))((char *)&loc_23A89E2DC + 4 * byte_23A8A9E00[v10]))();
  }
}

void sub_23A89E360(unsigned int *a1, unsigned int a2, unsigned int a3, uint64_t a4)
{
  uint64_t v5;
  unsigned int v6;
  unsigned int v7;
  int v8;
  int v9;
  unsigned int v10;

  v5 = *(_QWORD *)(*(_QWORD *)(a4 + 24) - 8);
  if (*(_DWORD *)(v5 + 84) <= 0x7FFFFFFFu)
    v6 = 0x7FFFFFFF;
  else
    v6 = *(_DWORD *)(v5 + 84);
  if (v6 >= a3)
  {
    v9 = 0;
    if (a2 <= v6)
      goto LABEL_17;
  }
  else
  {
    if (((*(_DWORD *)(v5 + 64) + 7) & 0xFFFFFFF8) == 0xFFFFFFF0)
      v7 = a3 - v6 + 1;
    else
      v7 = 2;
    if (v7 >= 0x10000)
      v8 = 4;
    else
      v8 = 2;
    if (v7 < 0x100)
      v8 = 1;
    if (v7 >= 2)
      v9 = v8;
    else
      v9 = 0;
    if (a2 <= v6)
LABEL_17:
      __asm { BR              X12 }
  }
  if (((*(_DWORD *)(v5 + 64) + 7) & 0xFFFFFFF8) != 0xFFFFFFF0)
  {
    v10 = ~v6 + a2;
    bzero(a1, ((*(_QWORD *)(v5 + 64) + 7) & 0xFFFFFFFFFFFFFFF8) + 16);
    *a1 = v10;
  }
  __asm { BR              X10 }
}

void sub_23A89E454()
{
  uint64_t v0;
  uint64_t v1;
  char v2;

  *(_BYTE *)(v0 + v1) = v2;
  JUMPOUT(0x23A89E4CCLL);
}

void sub_23A89E45C(uint64_t a1, int a2)
{
  uint64_t v2;
  uint64_t v3;

  *(_DWORD *)(v2 + v3) = 0;
  if (a2)
    JUMPOUT(0x23A89E464);
  JUMPOUT(0x23A89E4CCLL);
}

void sub_23A89E4A4()
{
  uint64_t v0;
  uint64_t v1;
  __int16 v2;

  *(_WORD *)(v0 + v1) = v2;
  JUMPOUT(0x23A89E4CCLL);
}

void sub_23A89E4AC()
{
  uint64_t v0;
  uint64_t v1;
  int v2;

  *(_DWORD *)(v0 + v1) = v2;
  JUMPOUT(0x23A89E4CCLL);
}

uint64_t sub_23A89E4B4(uint64_t a1, int a2, unsigned int a3)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  *(_WORD *)(v5 + v6) = 0;
  if (!a2)
    JUMPOUT(0x23A89E4CCLL);
  if (a3 < 0x7FFFFFFF)
  {
    if ((a2 & 0x80000000) == 0)
      JUMPOUT(0x23A89E4C8);
    JUMPOUT(0x23A89E4C0);
  }
  return (*(uint64_t (**)(uint64_t))(v4 + 56))(v5);
}

uint64_t sub_23A89E4E4(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_23A8A9594();
            result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    result = sub_23A89E6F8(a5, a6);
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
  v8 = sub_23A8A9618();
  if (!v8)
  {
    sub_23A8A9624();
    __break(1u);
LABEL_17:
    result = sub_23A8A9654();
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

uint64_t __swift_destroy_boxed_opaque_existential_0(uint64_t a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(*(_QWORD *)(a1 + 24) - 8);
  if ((*(_BYTE *)(v1 + 82) & 2) != 0)
    return swift_release();
  else
    return (*(uint64_t (**)(void))(v1 + 8))();
}

uint64_t sub_23A89E6BC(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_23A89E6F8(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v2 = sub_23A89E78C(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v2 = sub_23A89E964(0, *(_QWORD *)(v2 + 16) + 1, 1, (char *)v2);
  v4 = *(_QWORD *)(v2 + 16);
  v3 = *(_QWORD *)(v2 + 24);
  if (v4 >= v3 >> 1)
    v2 = sub_23A89E964(v3 > 1, v4 + 1, 1, (char *)v2);
  *(_QWORD *)(v2 + 16) = v4 + 1;
  *(_BYTE *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_23A89E78C(uint64_t a1, unint64_t a2)
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
      v3 = sub_23A89E900(v2, 0);
      if (v2 < 0)
        break;
      v4 = v3;
      v5 = sub_23A8A95F4();
      if ((v6 & 1) != 0)
        goto LABEL_14;
      if (v5 == v2)
        return (uint64_t)v4;
      sub_23A8A9624();
      __break(1u);
LABEL_10:
      v2 = sub_23A8A9444();
      if (!v2)
        return MEMORY[0x24BEE4AF8];
    }
    sub_23A8A9654();
    __break(1u);
LABEL_14:
    result = sub_23A8A9624();
    __break(1u);
  }
  else
  {
    return MEMORY[0x24BEE4AF8];
  }
  return result;
}

_QWORD *sub_23A89E900(uint64_t a1, uint64_t a2)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_2569C7018);
  v4 = (_QWORD *)swift_allocObject();
  v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_23A89E964(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_2569C7018);
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
  result = sub_23A8A9654();
  __break(1u);
  return result;
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x23B85A704]((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t sub_23A89EAF4@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;

  v3 = *a1 + OBJC_IVAR____TtC16EncoreXPCService12AsyncService_events;
  swift_beginAccess();
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2542D8710);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, v3, v4);
}

uint64_t sub_23A89EB60(uint64_t a1, _QWORD *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v10;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2542D8710);
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v10 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, a1, v4);
  v8 = *a2 + OBJC_IVAR____TtC16EncoreXPCService12AsyncService_events;
  swift_beginAccess();
  (*(void (**)(uint64_t, char *, uint64_t))(v5 + 40))(v8, v7, v4);
  return swift_endAccess();
}

uint64_t sub_23A89EC28@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;

  v3 = v1 + OBJC_IVAR____TtC16EncoreXPCService12AsyncService_events;
  swift_beginAccess();
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2542D8710);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a1, v3, v4);
}

id sub_23A89EC90()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(uint64_t, uint64_t, uint64_t, uint64_t);
  id v14;
  objc_class *v15;
  id v16;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  objc_super v21;

  v1 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2542D86E0);
  v2 = *(_QWORD *)(v1 - 8);
  MEMORY[0x24BDAC7A8](v1);
  v4 = (char *)&v18 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_2542D8710);
  v5 = *(_QWORD *)(v19 - 8);
  MEMORY[0x24BDAC7A8](v19);
  v7 = (char *)&v18 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_2542D8700);
  MEMORY[0x24BDAC7A8](v8);
  v10 = (char *)&v18 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = (uint64_t)v0 + OBJC_IVAR____TtC16EncoreXPCService12AsyncService_continuation;
  v12 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2542D86F0);
  v13 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 56);
  v13(v11, 1, 1, v12);
  v13((uint64_t)v10, 1, 1, v12);
  v20 = v10;
  type metadata accessor for EncoreEvent();
  (*(void (**)(char *, _QWORD, uint64_t))(v2 + 104))(v4, *MEMORY[0x24BEE6A10], v1);
  v14 = v0;
  sub_23A8A94D4();
  (*(void (**)(uint64_t, char *, uint64_t))(v5 + 32))((uint64_t)v14 + OBJC_IVAR____TtC16EncoreXPCService12AsyncService_events, v7, v19);
  swift_beginAccess();
  sub_23A89F19C((uint64_t)v10, v11);
  swift_endAccess();

  v15 = (objc_class *)type metadata accessor for AsyncService();
  v21.receiver = v14;
  v21.super_class = v15;
  v16 = objc_msgSendSuper2(&v21, sel_init);
  sub_23A89F1E4((uint64_t)v10);
  return v16;
}

uint64_t sub_23A89EE94(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;

  sub_23A89F1E4(a2);
  v4 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2542D86F0);
  v5 = *(_QWORD *)(v4 - 8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 16))(a2, a1, v4);
  return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v5 + 56))(a2, 0, 1, v4);
}

id AsyncService.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for AsyncService();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for AsyncService()
{
  uint64_t result;

  result = qword_2542D86B0;
  if (!qword_2542D86B0)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_23A89EFEC()
{
  return type metadata accessor for AsyncService();
}

void sub_23A89EFF4()
{
  unint64_t v0;
  unint64_t v1;

  sub_23A89F0A4();
  if (v0 <= 0x3F)
  {
    sub_23A89F0F8();
    if (v1 <= 0x3F)
      swift_updateClassMetadata2();
  }
}

uint64_t method lookup function for AsyncService()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of AsyncService.events.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x60))();
}

void sub_23A89F0A4()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_2542D8718)
  {
    type metadata accessor for EncoreEvent();
    v0 = sub_23A8A94C8();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_2542D8718);
  }
}

void sub_23A89F0F8()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_2542D8708)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract((uint64_t *)&unk_2542D86F0);
    v0 = sub_23A8A957C();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_2542D8708);
  }
}

uint64_t __swift_instantiateConcreteTypeFromMangledNameAbstract(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x23B85A710](255, (char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t sub_23A89F194(uint64_t a1)
{
  uint64_t v1;

  return sub_23A89EE94(a1, *(_QWORD *)(v1 + 16));
}

uint64_t sub_23A89F19C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2542D8700);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 24))(a2, a1, v4);
  return a2;
}

uint64_t sub_23A89F1E4(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2542D8700);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t ServiceName.description.getter()
{
  uint64_t *v0;
  uint64_t v1;

  v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

EncoreXPCService::ServiceName __swiftcall ServiceName.init(stringLiteral:)(EncoreXPCService::ServiceName stringLiteral)
{
  EncoreXPCService::ServiceName *v1;

  *v1 = stringLiteral;
  return stringLiteral;
}

uint64_t static ServiceName.== infix(_:_:)(_QWORD *a1, _QWORD *a2)
{
  if (*a1 == *a2 && a1[1] == a2[1])
    return 1;
  else
    return sub_23A8A9690();
}

uint64_t sub_23A89F288()
{
  uint64_t *v0;
  uint64_t v1;

  v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_23A89F2B4(_QWORD *a1, _QWORD *a2)
{
  if (*a1 == *a2 && a1[1] == a2[1])
    return 1;
  else
    return sub_23A8A9690();
}

_QWORD *sub_23A89F2E4@<X0>(_QWORD *result@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v2;

  v2 = result[1];
  *a2 = *result;
  a2[1] = v2;
  return result;
}

uint64_t static EncoreEvent.secureCoding.getter()
{
  swift_beginAccess();
  return byte_2569C7020;
}

uint64_t static EncoreEvent.secureCoding.setter(char a1)
{
  uint64_t result;

  result = swift_beginAccess();
  byte_2569C7020 = a1;
  return result;
}

uint64_t (*static EncoreEvent.secureCoding.modify())()
{
  swift_beginAccess();
  return j__swift_endAccess;
}

uint64_t EncoreEvent.id.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + OBJC_IVAR___EncoreEvent_id);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t EncoreEvent.data.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + OBJC_IVAR___EncoreEvent_data);
  sub_23A89F46C(v1, *(_QWORD *)(v0 + OBJC_IVAR___EncoreEvent_data + 8));
  return v1;
}

uint64_t sub_23A89F46C(uint64_t a1, unint64_t a2)
{
  uint64_t result;

  if (a2 >> 62 != 1)
  {
    if (a2 >> 62 != 2)
      return result;
    swift_retain();
  }
  return swift_retain();
}

uint64_t EncoreEvent.serviceName.getter@<X0>(_QWORD *a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;

  v2 = *(_QWORD *)(v1 + OBJC_IVAR___EncoreEvent_serviceName + 8);
  *a1 = *(_QWORD *)(v1 + OBJC_IVAR___EncoreEvent_serviceName);
  a1[1] = v2;
  return swift_bridgeObjectRetain();
}

unint64_t sub_23A89F51C()
{
  uint64_t v0;

  v0 = sub_23A8A9414();
  MEMORY[0x24BDAC7A8](v0);
  sub_23A8A9408();
  sub_23A8A93FC();
  sub_23A8A95E8();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_23A8A9438();
  swift_bridgeObjectRelease();
  sub_23A8A9438();
  swift_bridgeObjectRetain();
  sub_23A8A9438();
  swift_bridgeObjectRelease();
  sub_23A8A9438();
  sub_23A8A9438();
  swift_bridgeObjectRelease();
  sub_23A8A9438();
  return 0xD000000000000010;
}

char *EncoreEvent.__allocating_init(value:serviceName:id:)(_QWORD *a1, uint64_t *a2, uint64_t a3, uint64_t a4)
{
  objc_class *v4;
  id v9;

  v9 = objc_allocWithZone(v4);
  return EncoreEvent.init(value:serviceName:id:)(a1, a2, a3, a4);
}

char *EncoreEvent.init(value:serviceName:id:)(_QWORD *a1, uint64_t *a2, uint64_t a3, uint64_t a4)
{
  char *v4;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t *v16;
  char *v17;
  uint64_t v18;
  uint64_t v20;
  uint64_t v21;
  objc_super v22;
  uint64_t v23;

  v20 = *a2;
  v23 = a2[1];
  v8 = OBJC_IVAR___EncoreEvent_jsonEncoder;
  sub_23A8A92F4();
  swift_allocObject();
  v9 = v4;
  *(_QWORD *)&v4[v8] = sub_23A8A92E8();
  v10 = OBJC_IVAR___EncoreEvent_jsonDecoder;
  sub_23A8A92D0();
  swift_allocObject();
  *(_QWORD *)&v9[v10] = sub_23A8A92C4();
  v11 = &v9[OBJC_IVAR___EncoreEvent_id];
  *(_QWORD *)v11 = a3;
  *((_QWORD *)v11 + 1) = a4;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  swift_retain();
  v12 = sub_23A8A92DC();
  if (v21)
  {
    swift_release();
    swift_bridgeObjectRelease();
    __swift_destroy_boxed_opaque_existential_0((uint64_t)a1);
    swift_bridgeObjectRelease();
    swift_release();

    swift_release();
    type metadata accessor for EncoreEvent();
    swift_deallocPartialClassInstance();
  }
  else
  {
    v14 = v12;
    v15 = v13;
    swift_release();
    v16 = (uint64_t *)&v9[OBJC_IVAR___EncoreEvent_data];
    *v16 = v14;
    v16[1] = v15;
    v17 = &v9[OBJC_IVAR___EncoreEvent_serviceName];
    v18 = v23;
    *(_QWORD *)v17 = v20;
    *((_QWORD *)v17 + 1) = v18;

    v22.receiver = v9;
    v22.super_class = (Class)type metadata accessor for EncoreEvent();
    v9 = (char *)objc_msgSendSuper2(&v22, sel_init);
    __swift_destroy_boxed_opaque_existential_0((uint64_t)a1);
  }
  return v9;
}

_QWORD *__swift_project_boxed_opaque_existential_1(_QWORD *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) & 0x20000) != 0)
    return (_QWORD *)(*result
                    + ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80)));
  return result;
}

uint64_t type metadata accessor for EncoreEvent()
{
  return objc_opt_self();
}

uint64_t sub_23A89F948()
{
  return sub_23A8A92B8();
}

void sub_23A89F98C(void *a1)
{
  uint64_t v1;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v3 = (void *)sub_23A8A93E4();
  v4 = (void *)sub_23A8A93E4();
  objc_msgSend(a1, sel_encodeObject_forKey_, v3, v4);

  v5 = (void *)sub_23A8A930C();
  v6 = (void *)sub_23A8A93E4();
  objc_msgSend(a1, sel_encodeObject_forKey_, v5, v6);

  if (*(_QWORD *)(v1 + OBJC_IVAR___EncoreEvent_serviceName + 8))
    v7 = (void *)sub_23A8A93E4();
  else
    v7 = 0;
  v8 = (id)sub_23A8A93E4();
  objc_msgSend(a1, sel_encodeObject_forKey_, v7, v8);

}

id EncoreEvent.__allocating_init(coder:)(void *a1)
{
  objc_class *v1;
  id v3;

  v3 = objc_allocWithZone(v1);
  return EncoreEvent.init(coder:)(a1);
}

id EncoreEvent.init(coder:)(void *a1)
{
  char *v1;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  NSObject *v24;
  os_log_type_t v25;
  uint8_t *v26;
  id v27;
  uint64_t *v28;
  objc_super v30;

  v3 = OBJC_IVAR___EncoreEvent_jsonEncoder;
  sub_23A8A92F4();
  swift_allocObject();
  v4 = v1;
  *(_QWORD *)&v1[v3] = sub_23A8A92E8();
  v5 = OBJC_IVAR___EncoreEvent_jsonDecoder;
  sub_23A8A92D0();
  swift_allocObject();
  *(_QWORD *)&v4[v5] = sub_23A8A92C4();
  sub_23A8A0B30(0, &qword_2569C7050);
  v6 = sub_23A8A9564();
  if (v6)
  {
    v7 = (void *)v6;
    sub_23A8A0B30(0, &qword_2569C7058);
    v8 = sub_23A8A9564();
    if (v8)
    {
      v9 = (void *)v8;
      v10 = sub_23A8A93F0();
      v11 = (uint64_t *)&v4[OBJC_IVAR___EncoreEvent_id];
      *v11 = v10;
      v11[1] = v12;
      v13 = v9;
      v14 = sub_23A8A9318();
      v16 = v15;

      v17 = (uint64_t *)&v4[OBJC_IVAR___EncoreEvent_data];
      *v17 = v14;
      v17[1] = v16;
      v18 = sub_23A8A9564();
      if (v18)
      {
        v19 = (void *)v18;
        v20 = sub_23A8A93F0();
        v22 = v21;

        swift_bridgeObjectRetain();
      }
      else
      {
        v20 = 0;
        v22 = 0;
      }

      swift_bridgeObjectRelease();
      v28 = (uint64_t *)&v4[OBJC_IVAR___EncoreEvent_serviceName];
      *v28 = v20;
      v28[1] = v22;

      v30.receiver = v4;
      v30.super_class = (Class)type metadata accessor for EncoreEvent();
      v27 = objc_msgSendSuper2(&v30, sel_init);

      return v27;
    }

  }
  if (qword_2542D86C0 != -1)
    swift_once();
  v23 = sub_23A8A936C();
  __swift_project_value_buffer(v23, (uint64_t)qword_2542D87E8);
  v24 = sub_23A8A9360();
  v25 = sub_23A8A9528();
  if (os_log_type_enabled(v24, v25))
  {
    v26 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v26 = 0;
    _os_log_impl(&dword_23A89B000, v24, v25, "Missing required key values", v26, 2u);
    MEMORY[0x23B85A7AC](v26, -1, -1);
  }

  swift_release();
  swift_release();
  type metadata accessor for EncoreEvent();
  swift_deallocPartialClassInstance();
  return 0;
}

id EncoreEvent.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

void EncoreEvent.init()()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

id EncoreEvent.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for EncoreEvent();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t SystemEvents.asDirectInvocation.getter()
{
  char *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  char v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  char *v10;
  uint64_t inited;
  void *v12;
  id v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t result;
  id v20;
  uint64_t v22[2];
  id v23[6];

  v23[5] = *(id *)MEMORY[0x24BDAC8D0];
  v1 = sub_23A8A9354();
  v2 = *(_QWORD *)(v1 - 8);
  MEMORY[0x24BDAC7A8](v1);
  v4 = (char *)v22 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0) + 96;
  v5 = *v0;
  v23[3] = &type metadata for SystemEvents;
  v23[4] = (id)sub_23A8A0B68();
  LOBYTE(v23[0]) = v5;
  v22[0] = 0;
  v22[1] = 0;
  sub_23A8A9348();
  v6 = sub_23A8A933C();
  v8 = v7;
  (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
  v9 = objc_allocWithZone((Class)type metadata accessor for EncoreEvent());
  v10 = EncoreEvent.init(value:serviceName:id:)(v23, v22, v6, v8);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2569C7068);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_23A8A9E90;
  v23[0] = (id)0xD000000000000011;
  v23[1] = (id)0x800000023A8ABC40;
  sub_23A8A95DC();
  v12 = (void *)objc_opt_self();
  v23[0] = 0;
  v13 = objc_msgSend(v12, sel_archivedDataWithRootObject_requiringSecureCoding_error_, v10, 1, v23);
  if (v13)
  {
    v14 = v13;
    v15 = v23[0];
    v16 = sub_23A8A9318();
    v18 = v17;

    *(_QWORD *)(inited + 96) = MEMORY[0x24BDCDDE8];
    *(_QWORD *)(inited + 72) = v16;
    *(_QWORD *)(inited + 80) = v18;
    sub_23A8A01B0(inited);

    return 0xD000000000000025;
  }
  else
  {
    v20 = v23[0];
    sub_23A8A9300();

    swift_willThrow();
    result = swift_unexpectedError();
    __break(1u);
  }
  return result;
}

unint64_t sub_23A8A01B0(uint64_t a1)
{
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t result;
  char v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  uint64_t v12;
  BOOL v13;
  uint64_t v14;
  _OWORD v15[2];
  uint64_t v16;
  __int128 v17;

  if (!*(_QWORD *)(a1 + 16))
  {
    v3 = (_QWORD *)MEMORY[0x24BEE4B00];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_2569C7178);
  v2 = sub_23A8A9648();
  v3 = (_QWORD *)v2;
  v4 = *(_QWORD *)(a1 + 16);
  if (!v4)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v3;
  }
  v5 = v2 + 64;
  v6 = a1 + 32;
  swift_retain();
  while (1)
  {
    sub_23A8A1414(v6, (uint64_t)v15);
    result = sub_23A8A4520((uint64_t)v15);
    if ((v8 & 1) != 0)
      break;
    *(_QWORD *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    v9 = v3[6] + 40 * result;
    v10 = v15[0];
    v11 = v15[1];
    *(_QWORD *)(v9 + 32) = v16;
    *(_OWORD *)v9 = v10;
    *(_OWORD *)(v9 + 16) = v11;
    result = (unint64_t)sub_23A8A145C(&v17, (_OWORD *)(v3[7] + 32 * result));
    v12 = v3[2];
    v13 = __OFADD__(v12, 1);
    v14 = v12 + 1;
    if (v13)
      goto LABEL_11;
    v3[2] = v14;
    v6 += 72;
    if (!--v4)
    {
      swift_release();
      goto LABEL_9;
    }
  }
  __break(1u);
LABEL_11:
  __break(1u);
  return result;
}

BOOL static SystemEvents.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t SystemEvents.hash(into:)()
{
  return sub_23A8A96CC();
}

BOOL sub_23A8A031C(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t sub_23A8A0338()
{
  return sub_23A8A96CC();
}

unint64_t sub_23A8A0364()
{
  _BYTE *v0;

  if (*v0)
    return 0xD000000000000013;
  else
    return 0xD000000000000012;
}

uint64_t sub_23A8A03A4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_23A8A12E8(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_23A8A03C8()
{
  return 0;
}

void sub_23A8A03D4(_BYTE *a1@<X8>)
{
  *a1 = 2;
}

uint64_t sub_23A8A03E0()
{
  sub_23A8A0BAC();
  return sub_23A8A96FC();
}

uint64_t sub_23A8A0408()
{
  sub_23A8A0BAC();
  return sub_23A8A9708();
}

uint64_t sub_23A8A0430()
{
  return 0;
}

void sub_23A8A043C(_BYTE *a1@<X8>)
{
  *a1 = 1;
}

uint64_t sub_23A8A0448()
{
  sub_23A8A0BF0();
  return sub_23A8A96FC();
}

uint64_t sub_23A8A0470()
{
  sub_23A8A0BF0();
  return sub_23A8A9708();
}

uint64_t sub_23A8A0498@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = swift_bridgeObjectRelease();
  *a1 = 1;
  return result;
}

uint64_t sub_23A8A04C4()
{
  sub_23A8A0C34();
  return sub_23A8A96FC();
}

uint64_t sub_23A8A04EC()
{
  sub_23A8A0C34();
  return sub_23A8A9708();
}

uint64_t SystemEvents.encode(to:)(_QWORD *a1)
{
  char *v1;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  char v12;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char v19;
  char v20;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569C7070);
  v16 = *(_QWORD *)(v3 - 8);
  v17 = v3;
  MEMORY[0x24BDAC7A8](v3);
  v5 = (char *)&v14 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569C7078);
  v14 = *(_QWORD *)(v6 - 8);
  v15 = v6;
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)&v14 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569C7080);
  v18 = *(_QWORD *)(v9 - 8);
  MEMORY[0x24BDAC7A8](v9);
  v11 = (char *)&v14 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = *v1;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_23A8A0BAC();
  sub_23A8A96F0();
  if ((v12 & 1) != 0)
  {
    v20 = 1;
    sub_23A8A0BF0();
    sub_23A8A9684();
    (*(void (**)(char *, uint64_t))(v16 + 8))(v5, v17);
  }
  else
  {
    v19 = 0;
    sub_23A8A0C34();
    sub_23A8A9684();
    (*(void (**)(char *, uint64_t))(v14 + 8))(v8, v15);
  }
  return (*(uint64_t (**)(char *, uint64_t))(v18 + 8))(v11, v9);
}

uint64_t SystemEvents.hashValue.getter()
{
  sub_23A8A96C0();
  sub_23A8A96CC();
  return sub_23A8A96D8();
}

uint64_t SystemEvents.init(from:)@<X0>(_QWORD *a1@<X0>, _BYTE *a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char v16;
  uint64_t v17;
  _BYTE *v18;
  uint64_t v19;
  _QWORD *v20;
  _QWORD *v21;
  char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v26;
  _QWORD *v27;
  uint64_t v28;
  uint64_t v29;
  _BYTE *v30;
  char *v31;
  uint64_t v32;
  uint64_t v33;
  char v34;
  char v35;

  v30 = a2;
  v29 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569C70A0);
  v32 = *(_QWORD *)(v29 - 8);
  MEMORY[0x24BDAC7A8](v29);
  v31 = (char *)&v26 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v28 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569C70A8);
  v4 = *(_QWORD *)(v28 - 8);
  MEMORY[0x24BDAC7A8](v28);
  v6 = (char *)&v26 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569C70B0);
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7);
  v10 = (char *)&v26 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_23A8A0BAC();
  v11 = v33;
  sub_23A8A96E4();
  if (v11)
    goto LABEL_7;
  v26 = v4;
  v27 = a1;
  v12 = v31;
  v13 = v32;
  v33 = v8;
  v14 = sub_23A8A9678();
  v15 = v7;
  if (*(_QWORD *)(v14 + 16) != 1)
  {
    v19 = sub_23A8A960C();
    swift_allocError();
    v21 = v20;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2569C70B8);
    *v21 = &type metadata for SystemEvents;
    sub_23A8A966C();
    sub_23A8A9600();
    (*(void (**)(_QWORD *, _QWORD, uint64_t))(*(_QWORD *)(v19 - 8) + 104))(v21, *MEMORY[0x24BEE26D0], v19);
    swift_willThrow();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v33 + 8))(v10, v15);
    a1 = v27;
LABEL_7:
    v24 = (uint64_t)a1;
    return __swift_destroy_boxed_opaque_existential_0(v24);
  }
  v16 = *(_BYTE *)(v14 + 32);
  if ((v16 & 1) != 0)
  {
    LODWORD(v28) = *(unsigned __int8 *)(v14 + 32);
    v35 = 1;
    sub_23A8A0BF0();
    sub_23A8A9660();
    v17 = v33;
    v18 = v30;
    (*(void (**)(char *, uint64_t))(v13 + 8))(v12, v29);
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v17 + 8))(v10, v15);
    v16 = v28;
  }
  else
  {
    v34 = 0;
    sub_23A8A0C34();
    v22 = v6;
    sub_23A8A9660();
    v23 = v33;
    v18 = v30;
    (*(void (**)(char *, uint64_t))(v26 + 8))(v22, v28);
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v23 + 8))(v10, v15);
  }
  *v18 = v16;
  v24 = (uint64_t)v27;
  return __swift_destroy_boxed_opaque_existential_0(v24);
}

uint64_t sub_23A8A0A84()
{
  sub_23A8A96C0();
  sub_23A8A96CC();
  return sub_23A8A96D8();
}

uint64_t sub_23A8A0AC8()
{
  sub_23A8A96C0();
  sub_23A8A96CC();
  return sub_23A8A96D8();
}

uint64_t sub_23A8A0B08@<X0>(_QWORD *a1@<X0>, _BYTE *a2@<X8>)
{
  return SystemEvents.init(from:)(a1, a2);
}

uint64_t sub_23A8A0B1C(_QWORD *a1)
{
  return SystemEvents.encode(to:)(a1);
}

uint64_t sub_23A8A0B30(uint64_t a1, unint64_t *a2)
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

unint64_t sub_23A8A0B68()
{
  unint64_t result;

  result = qword_2569C7060;
  if (!qword_2569C7060)
  {
    result = MEMORY[0x23B85A71C](&protocol conformance descriptor for SystemEvents, &type metadata for SystemEvents);
    atomic_store(result, (unint64_t *)&qword_2569C7060);
  }
  return result;
}

unint64_t sub_23A8A0BAC()
{
  unint64_t result;

  result = qword_2569C7088;
  if (!qword_2569C7088)
  {
    result = MEMORY[0x23B85A71C](&unk_23A8AA318, &type metadata for SystemEvents.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2569C7088);
  }
  return result;
}

unint64_t sub_23A8A0BF0()
{
  unint64_t result;

  result = qword_2569C7090;
  if (!qword_2569C7090)
  {
    result = MEMORY[0x23B85A71C](&unk_23A8AA2C8, &type metadata for SystemEvents.ReturnedToVoiceModeCodingKeys);
    atomic_store(result, (unint64_t *)&qword_2569C7090);
  }
  return result;
}

unint64_t sub_23A8A0C34()
{
  unint64_t result;

  result = qword_2569C7098;
  if (!qword_2569C7098)
  {
    result = MEMORY[0x23B85A71C](&unk_23A8AA278, &type metadata for SystemEvents.SnippetDisappearedCodingKeys);
    atomic_store(result, (unint64_t *)&qword_2569C7098);
  }
  return result;
}

unint64_t sub_23A8A0C7C()
{
  unint64_t result;

  result = qword_2569C70C0;
  if (!qword_2569C70C0)
  {
    result = MEMORY[0x23B85A71C](&protocol conformance descriptor for ServiceName, &type metadata for ServiceName);
    atomic_store(result, (unint64_t *)&qword_2569C70C0);
  }
  return result;
}

uint64_t sub_23A8A0CC0()
{
  return MEMORY[0x24BEE0D80];
}

unint64_t sub_23A8A0CD0()
{
  unint64_t result;

  result = qword_2569C70C8;
  if (!qword_2569C70C8)
  {
    result = MEMORY[0x23B85A71C](&protocol conformance descriptor for ServiceName, &type metadata for ServiceName);
    atomic_store(result, (unint64_t *)&qword_2569C70C8);
  }
  return result;
}

uint64_t sub_23A8A0D14()
{
  return MEMORY[0x24BEE0D90];
}

uint64_t sub_23A8A0D20()
{
  return MEMORY[0x24BEE0D88];
}

unint64_t sub_23A8A0D30()
{
  unint64_t result;

  result = qword_2569C70D0;
  if (!qword_2569C70D0)
  {
    result = MEMORY[0x23B85A71C](&protocol conformance descriptor for SystemEvents, &type metadata for SystemEvents);
    atomic_store(result, (unint64_t *)&qword_2569C70D0);
  }
  return result;
}

_QWORD *initializeBufferWithCopyOfBuffer for ServiceName(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t destroy for ServiceName()
{
  return swift_bridgeObjectRelease();
}

_QWORD *assignWithCopy for ServiceName(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

__n128 __swift_memcpy16_8(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  *a1 = *a2;
  return result;
}

_QWORD *assignWithTake for ServiceName(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for ServiceName(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 16))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for ServiceName(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for ServiceName()
{
  return &type metadata for ServiceName;
}

uint64_t method lookup function for EncoreEvent()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of static EncoreEvent.supportsSecureCoding.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 120))();
}

uint64_t dispatch thunk of EncoreEvent.__allocating_init(value:serviceName:id:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 128))();
}

uint64_t dispatch thunk of EncoreEvent.getValue<A>()()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x88))();
}

uint64_t dispatch thunk of EncoreEvent.encode(with:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x90))();
}

uint64_t dispatch thunk of EncoreEvent.__allocating_init(coder:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 152))();
}

_BYTE *__swift_memcpy1_1(_BYTE *result, _BYTE *a2)
{
  *result = *a2;
  return result;
}

ValueMetadata *type metadata accessor for SystemEvents()
{
  return &type metadata for SystemEvents;
}

uint64_t _s16EncoreXPCService12SystemEventsOwet_0(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int v6;
  BOOL v7;
  int v8;

  if (!a2)
    return 0;
  if (a2 < 0xFF)
    goto LABEL_17;
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
    if (v4)
      return (*a1 | (v4 << 8)) - 1;
  }
  else
  {
    if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
      return (*a1 | (v4 << 8)) - 1;
    }
    v4 = a1[1];
    if (a1[1])
      return (*a1 | (v4 << 8)) - 1;
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 2;
  v8 = v6 - 2;
  if (!v7)
    v8 = -1;
  return (v8 + 1);
}

uint64_t _s16EncoreXPCService12SystemEventsOwst_0(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_23A8A103C + 4 * byte_23A8A9EA5[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_23A8A1070 + 4 * byte_23A8A9EA0[v4]))();
}

uint64_t sub_23A8A1070(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_23A8A1078(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x23A8A1080);
  return result;
}

uint64_t sub_23A8A108C(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x23A8A1094);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_23A8A1098(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23A8A10A0(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23A8A10AC(unsigned __int8 *a1)
{
  return *a1;
}

_BYTE *sub_23A8A10B4(_BYTE *result, char a2)
{
  *result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for SystemEvents.CodingKeys()
{
  return &type metadata for SystemEvents.CodingKeys;
}

ValueMetadata *type metadata accessor for SystemEvents.SnippetDisappearedCodingKeys()
{
  return &type metadata for SystemEvents.SnippetDisappearedCodingKeys;
}

ValueMetadata *type metadata accessor for SystemEvents.ReturnedToVoiceModeCodingKeys()
{
  return &type metadata for SystemEvents.ReturnedToVoiceModeCodingKeys;
}

unint64_t sub_23A8A10F4()
{
  unint64_t result;

  result = qword_2569C7140;
  if (!qword_2569C7140)
  {
    result = MEMORY[0x23B85A71C](&unk_23A8AA250, &type metadata for SystemEvents.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2569C7140);
  }
  return result;
}

unint64_t sub_23A8A113C()
{
  unint64_t result;

  result = qword_2569C7148;
  if (!qword_2569C7148)
  {
    result = MEMORY[0x23B85A71C](&unk_23A8AA170, &type metadata for SystemEvents.SnippetDisappearedCodingKeys);
    atomic_store(result, (unint64_t *)&qword_2569C7148);
  }
  return result;
}

unint64_t sub_23A8A1184()
{
  unint64_t result;

  result = qword_2569C7150;
  if (!qword_2569C7150)
  {
    result = MEMORY[0x23B85A71C](&unk_23A8AA198, &type metadata for SystemEvents.SnippetDisappearedCodingKeys);
    atomic_store(result, (unint64_t *)&qword_2569C7150);
  }
  return result;
}

unint64_t sub_23A8A11CC()
{
  unint64_t result;

  result = qword_2569C7158;
  if (!qword_2569C7158)
  {
    result = MEMORY[0x23B85A71C](&unk_23A8AA120, &type metadata for SystemEvents.ReturnedToVoiceModeCodingKeys);
    atomic_store(result, (unint64_t *)&qword_2569C7158);
  }
  return result;
}

unint64_t sub_23A8A1214()
{
  unint64_t result;

  result = qword_2569C7160;
  if (!qword_2569C7160)
  {
    result = MEMORY[0x23B85A71C](&unk_23A8AA148, &type metadata for SystemEvents.ReturnedToVoiceModeCodingKeys);
    atomic_store(result, (unint64_t *)&qword_2569C7160);
  }
  return result;
}

unint64_t sub_23A8A125C()
{
  unint64_t result;

  result = qword_2569C7168;
  if (!qword_2569C7168)
  {
    result = MEMORY[0x23B85A71C](&unk_23A8AA1C0, &type metadata for SystemEvents.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2569C7168);
  }
  return result;
}

unint64_t sub_23A8A12A4()
{
  unint64_t result;

  result = qword_2569C7170;
  if (!qword_2569C7170)
  {
    result = MEMORY[0x23B85A71C](&unk_23A8AA1E8, &type metadata for SystemEvents.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2569C7170);
  }
  return result;
}

uint64_t sub_23A8A12E8(uint64_t a1, uint64_t a2)
{
  char v5;

  if (a1 == 0xD000000000000012 && a2 == 0x800000023A8ABD60 || (sub_23A8A9690() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0xD000000000000013 && a2 == 0x800000023A8ABD80)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    v5 = sub_23A8A9690();
    swift_bridgeObjectRelease();
    if ((v5 & 1) != 0)
      return 1;
    else
      return 2;
  }
}

uint64_t sub_23A8A13D0(uint64_t a1, unint64_t a2)
{
  uint64_t result;

  if (a2 >> 62 != 1)
  {
    if (a2 >> 62 != 2)
      return result;
    swift_release();
  }
  return swift_release();
}

uint64_t sub_23A8A1414(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2569C7180);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

_OWORD *sub_23A8A145C(_OWORD *a1, _OWORD *a2)
{
  __int128 v2;

  v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

unint64_t static EncoreService.machServiceName.getter()
{
  return 0xD000000000000021;
}

void sub_23A8A14A8()
{
  off_2569C71F0 = (_UNKNOWN *)MEMORY[0x24BEE4B00];
}

void sub_23A8A14BC(void **a1, _QWORD *a2)
{
  void *v2;
  void **v3;
  void *v4;
  id v5;

  v2 = *a1;
  v3 = (void **)(*a2 + OBJC_IVAR___EncoreService_endpoint);
  swift_beginAccess();
  v4 = *v3;
  *v3 = v2;
  v5 = v2;

}

void *sub_23A8A151C()
{
  uint64_t v0;
  void **v1;
  void *v2;
  id v3;

  v1 = (void **)(v0 + OBJC_IVAR___EncoreService_endpoint);
  swift_beginAccess();
  v2 = *v1;
  v3 = v2;
  return v2;
}

id sub_23A8A15B8()
{
  id result;
  id v1;
  void *v2;

  result = (id)qword_2542D8688;
  if (qword_2542D8688)
    return result;
  v1 = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for EncoreService(0)), sel_init);
  v2 = (void *)qword_2542D8688;
  qword_2542D8688 = (uint64_t)v1;

  result = (id)qword_2542D8688;
  if (qword_2542D8688)
    return result;
  __break(1u);
  return result;
}

uint64_t type metadata accessor for EncoreService(uint64_t a1)
{
  return sub_23A8A3D24(a1, (uint64_t *)&unk_2542D86A0);
}

id sub_23A8A161C()
{
  id result;
  id v1;
  void *v2;
  void *v3;

  result = (id)qword_2542D8688;
  if (qword_2542D8688)
    return result;
  v1 = objc_allocWithZone((Class)type metadata accessor for EncoreService(0));
  v2 = sub_23A8A17D0(0, 0);
  v3 = (void *)qword_2542D8688;
  qword_2542D8688 = (uint64_t)v2;

  result = (id)qword_2542D8688;
  if (qword_2542D8688)
    return result;
  __break(1u);
  return result;
}

id sub_23A8A1670()
{
  id v0;
  void *v1;
  uint64_t v2;
  id v3;
  uint64_t v4;
  NSObject *v5;
  os_log_type_t v6;
  uint8_t *v7;

  v0 = objc_allocWithZone((Class)type metadata accessor for EncoreService(0));
  v1 = sub_23A8A17D0(0xD000000000000021, 0x800000023A8ABDA0);
  swift_getObjectType();
  swift_deallocPartialClassInstance();
  v2 = qword_2542D86C0;
  v3 = v1;
  if (v2 != -1)
    swift_once();
  v4 = sub_23A8A936C();
  __swift_project_value_buffer(v4, (uint64_t)qword_2542D87E8);
  v5 = sub_23A8A9360();
  v6 = sub_23A8A951C();
  if (os_log_type_enabled(v5, v6))
  {
    v7 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_23A89B000, v5, v6, "EncoreService: init", v7, 2u);
    MEMORY[0x23B85A7AC](v7, -1, -1);
  }

  return v3;
}

void *sub_23A8A17D0(uint64_t a1, uint64_t a2)
{
  char *v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t (*v7)(uint64_t);
  uint64_t v8;
  char *v9;
  char *v10;
  uint64_t v11;
  objc_class *v12;
  id v13;
  void *v14;
  id v15;
  id v16;
  void *v17;
  id v18;
  _QWORD v20[2];
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  objc_super v24;
  uint64_t v25;

  v22 = a2;
  v20[0] = a1;
  v23 = sub_23A8A9540();
  v3 = *(_QWORD *)(v23 - 8);
  MEMORY[0x24BDAC7A8](v23);
  v5 = (char *)v20 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_23A8A9534();
  v7 = (uint64_t (*)(uint64_t))MEMORY[0x24BEE5688];
  MEMORY[0x24BDAC7A8](v6);
  v8 = sub_23A8A93CC();
  MEMORY[0x24BDAC7A8](v8);
  *(_QWORD *)&v2[OBJC_IVAR___EncoreService_listener] = 0;
  v9 = &v2[OBJC_IVAR___EncoreService_eventHandler];
  *(_QWORD *)v9 = 0;
  *((_QWORD *)v9 + 1) = 0;
  *(_QWORD *)&v2[OBJC_IVAR___EncoreService_endpoint] = 0;
  v21 = OBJC_IVAR___EncoreService_queue;
  v20[1] = sub_23A8A5CA0();
  v10 = v2;
  sub_23A8A93C0();
  v25 = MEMORY[0x24BEE4AF8];
  sub_23A8A5CDC(&qword_2542D8728, v7, MEMORY[0x24BEE5698]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2542D86D0);
  sub_23A8A5D1C(&qword_2542D86D8, &qword_2542D86D0);
  v11 = v22;
  sub_23A8A95AC();
  (*(void (**)(char *, _QWORD, uint64_t))(v3 + 104))(v5, *MEMORY[0x24BEE5750], v23);
  *(_QWORD *)&v2[v21] = sub_23A8A9558();

  v12 = (objc_class *)type metadata accessor for EncoreService(0);
  v24.receiver = v10;
  v24.super_class = v12;
  v13 = objc_msgSendSuper2(&v24, sel_init, v20[0]);
  v14 = v13;
  if (v11)
  {
    v15 = objc_allocWithZone(MEMORY[0x24BDD1998]);
    v16 = v14;
    swift_bridgeObjectRetain();
    v17 = (void *)sub_23A8A93E4();
    swift_bridgeObjectRelease();
    v18 = objc_msgSend(v15, sel_initWithMachServiceName_, v17);

    objc_msgSend(v18, sel_setDelegate_, v16);
    objc_msgSend(v18, sel_resume);
    swift_bridgeObjectRelease();

  }
  else
  {
    v18 = v13;
    sub_23A8A1AA0();
  }

  return v14;
}

void sub_23A8A1AA0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  NSObject *v3;
  os_log_type_t v4;
  uint8_t *v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  void **v10;
  void *v11;

  v1 = v0;
  if (qword_2542D86C0 != -1)
    swift_once();
  v2 = sub_23A8A936C();
  __swift_project_value_buffer(v2, (uint64_t)qword_2542D87E8);
  v3 = sub_23A8A9360();
  v4 = sub_23A8A951C();
  if (os_log_type_enabled(v3, v4))
  {
    v5 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_23A89B000, v3, v4, "EncoreService: initTestingLoopback", v5, 2u);
    MEMORY[0x23B85A7AC](v5, -1, -1);
  }

  v6 = objc_msgSend((id)objc_opt_self(), sel_anonymousListener);
  v7 = *(void **)(v1 + OBJC_IVAR___EncoreService_listener);
  *(_QWORD *)(v1 + OBJC_IVAR___EncoreService_listener) = v6;
  v8 = v6;

  v9 = objc_msgSend(v8, sel_endpoint);
  v10 = (void **)(v1 + OBJC_IVAR___EncoreService_endpoint);
  swift_beginAccess();
  v11 = *v10;
  *v10 = v9;

  objc_msgSend(v8, sel_setDelegate_, v1);
  objc_msgSend(v8, sel_resume);

}

uint64_t sub_23A8A1C24(void *a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t (*v4)(uint64_t);
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  void *v13;
  id v14;
  _QWORD v16[2];
  _QWORD aBlock[6];

  v3 = sub_23A8A93A8();
  v4 = (uint64_t (*)(uint64_t))MEMORY[0x24BEE5458];
  v5 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v7 = (char *)v16 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_23A8A93CC();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)v16 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16[0] = *(_QWORD *)(v1 + OBJC_IVAR___EncoreService_queue);
  v12 = swift_allocObject();
  *(_QWORD *)(v12 + 16) = a1;
  aBlock[4] = sub_23A8A200C;
  aBlock[5] = v12;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_23A8A1A9C;
  aBlock[3] = &block_descriptor;
  v13 = _Block_copy(aBlock);
  v14 = a1;
  sub_23A8A93B4();
  v16[1] = MEMORY[0x24BEE4AF8];
  sub_23A8A5CDC(&qword_2569C7200, v4, MEMORY[0x24BEE5468]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2569C7208);
  sub_23A8A5D1C(&qword_2569C7210, &qword_2569C7208);
  sub_23A8A95AC();
  MEMORY[0x23B85A194](0, v11, v7, v13);
  _Block_release(v13);
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v3);
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  return swift_release();
}

uint64_t sub_23A8A1E0C()
{
  uint64_t v0;
  NSObject *v1;
  os_log_type_t v2;
  uint8_t *v3;
  uint64_t v4;
  uint64_t v5;

  if (qword_2542D86C0 != -1)
    swift_once();
  v0 = sub_23A8A936C();
  __swift_project_value_buffer(v0, (uint64_t)qword_2542D87E8);
  v1 = sub_23A8A9360();
  v2 = sub_23A8A951C();
  if (os_log_type_enabled(v1, v2))
  {
    v3 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)v3 = 134217984;
    if (qword_2569C6F90 != -1)
      swift_once();
    swift_beginAccess();
    sub_23A8A9588();
    _os_log_impl(&dword_23A89B000, v1, v2, "EncoreService: broadcast to clients: %ld", v3, 0xCu);
    MEMORY[0x23B85A7AC](v3, -1, -1);
  }

  if (qword_2569C6F90 != -1)
    swift_once();
  v4 = swift_beginAccess();
  MEMORY[0x24BDAC7A8](v4);
  v5 = swift_bridgeObjectRetain();
  sub_23A8A51CC(v5, (void (*)(uint64_t, uint64_t, uint64_t))sub_23A8A5C5C);
  return swift_bridgeObjectRelease();
}

uint64_t sub_23A8A1FE8()
{
  uint64_t v0;

  return swift_deallocObject();
}

uint64_t sub_23A8A200C()
{
  return sub_23A8A1E0C();
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

uint64_t sub_23A8A202C(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  id v10;
  NSObject *v11;
  os_log_type_t v12;
  uint64_t v13;
  _QWORD *v14;
  id v15;
  id v16;
  uint64_t v17;
  unint64_t v18;
  uint64_t v19;
  id v20;
  uint64_t result;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  id v25;
  uint64_t v26[4];

  v6 = type metadata accessor for ClientConnection(0);
  MEMORY[0x24BDAC7A8](v6);
  v8 = (uint64_t *)((char *)&v22 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0));
  if (qword_2542D86C0 != -1)
    swift_once();
  v9 = sub_23A8A936C();
  __swift_project_value_buffer(v9, (uint64_t)qword_2542D87E8);
  sub_23A8A3D58(a3, (uint64_t)v8);
  v10 = a4;
  v11 = sub_23A8A9360();
  v12 = sub_23A8A951C();
  if (os_log_type_enabled(v11, v12))
  {
    v13 = swift_slowAlloc();
    v14 = (_QWORD *)swift_slowAlloc();
    v23 = swift_slowAlloc();
    v25 = v10;
    v26[0] = v23;
    *(_DWORD *)v13 = 138412546;
    v24 = a3;
    v15 = v10;
    v16 = v10;
    sub_23A8A9588();
    *v14 = v15;

    *(_WORD *)(v13 + 12) = 2080;
    v17 = *v8;
    v18 = v8[1];
    swift_bridgeObjectRetain();
    v25 = (id)sub_23A89DE70(v17, v18, v26);
    a3 = v24;
    v10 = v15;
    sub_23A8A9588();
    swift_bridgeObjectRelease();
    sub_23A8A3EA8((uint64_t)v8);
    _os_log_impl(&dword_23A89B000, v11, v12, "EncoreService: broadcast %@ to %s", (uint8_t *)v13, 0x16u);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2569C7218);
    swift_arrayDestroy();
    MEMORY[0x23B85A7AC](v14, -1, -1);
    v19 = v23;
    swift_arrayDestroy();
    MEMORY[0x23B85A7AC](v19, -1, -1);
    MEMORY[0x23B85A7AC](v13, -1, -1);
  }
  else
  {

    sub_23A8A3EA8((uint64_t)v8);
  }

  v20 = objc_msgSend(*(id *)(a3 + 16), sel_remoteObjectProxy);
  sub_23A8A95A0();
  swift_unknownObjectRelease();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2569C7248);
  result = swift_dynamicCast();
  if ((result & 1) != 0)
  {
    objc_msgSend(v25, sel_handleEventWithEvent_, v10);
    return swift_unknownObjectRelease();
  }
  return result;
}

uint64_t sub_23A8A2370(void *a1)
{
  return sub_23A8A2954(a1, "EncoreService: echo %@");
}

uint64_t sub_23A8A23D0(void *a1)
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
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  id v15;
  NSObject *v16;
  os_log_type_t v17;
  uint64_t v18;
  uint8_t *v19;
  id v20;
  _QWORD *v21;
  uint8_t *v22;
  void (*v23)(id);
  uint64_t v24;
  uint64_t v25;
  id v26;
  uint64_t v27;
  uint64_t v29;
  _QWORD *v30;
  uint8_t *v31;
  char *v32;
  uint64_t v33;
  uint64_t v34;
  id v35;
  id v36;

  v2 = v1;
  v4 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2542D86F0);
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v29 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_2542D8700);
  MEMORY[0x24BDAC7A8](v8);
  v10 = (char *)&v29 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2569C7220);
  MEMORY[0x24BDAC7A8](v11);
  v13 = (char *)&v29 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_2542D86C0 != -1)
    swift_once();
  v14 = sub_23A8A936C();
  __swift_project_value_buffer(v14, (uint64_t)qword_2542D87E8);
  v15 = a1;
  v16 = sub_23A8A9360();
  v17 = sub_23A8A951C();
  if (os_log_type_enabled(v16, v17))
  {
    v33 = v2;
    v18 = swift_slowAlloc();
    v34 = v4;
    v19 = (uint8_t *)v18;
    v30 = (_QWORD *)swift_slowAlloc();
    v31 = v19;
    v32 = v7;
    *(_DWORD *)v19 = 138412290;
    v36 = v15;
    v20 = v15;
    v7 = v32;
    sub_23A8A9588();
    v21 = v30;
    *v30 = v15;

    v2 = v33;
    v22 = v31;
    _os_log_impl(&dword_23A89B000, v16, v17, "EncoreService: handleEvent %@", v31, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2569C7218);
    swift_arrayDestroy();
    MEMORY[0x23B85A7AC](v21, -1, -1);
    v4 = v34;
    MEMORY[0x23B85A7AC](v22, -1, -1);

  }
  else
  {

  }
  v23 = *(void (**)(id))(v2 + OBJC_IVAR___EncoreService_eventHandler);
  if (v23)
  {
    swift_retain();
    v23(v15);
    sub_23A8A3CB8((uint64_t)v23);
  }
  v24 = v2 + OBJC_IVAR____TtC16EncoreXPCService12AsyncService_continuation;
  swift_beginAccess();
  sub_23A8A3CC8(v24, (uint64_t)v10);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v5 + 48))(v10, 1, v4))
  {
    sub_23A8A5C64((uint64_t)v10, &qword_2542D8700);
    v25 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2569C7230);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v25 - 8) + 56))(v13, 1, 1, v25);
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v5 + 16))(v7, v10, v4);
    sub_23A8A5C64((uint64_t)v10, &qword_2542D8700);
    v35 = v15;
    v26 = v15;
    sub_23A8A94A4();
    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
    v27 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2569C7230);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v27 - 8) + 56))(v13, 0, 1, v27);
  }
  return sub_23A8A5C64((uint64_t)v13, (uint64_t *)&unk_2569C7220);
}

uint64_t sub_23A8A27D8(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v6;
  NSObject *v7;
  os_log_type_t v8;
  uint8_t *v9;
  _QWORD *v10;
  uint64_t v11;

  v3 = v2;
  if (qword_2542D86C0 != -1)
    swift_once();
  v6 = sub_23A8A936C();
  __swift_project_value_buffer(v6, (uint64_t)qword_2542D87E8);
  v7 = sub_23A8A9360();
  v8 = sub_23A8A951C();
  if (os_log_type_enabled(v7, v8))
  {
    v9 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v9 = 0;
    _os_log_impl(&dword_23A89B000, v7, v8, "EncoreService: subscribe", v9, 2u);
    MEMORY[0x23B85A7AC](v9, -1, -1);
  }

  v10 = (_QWORD *)(v3 + OBJC_IVAR___EncoreService_eventHandler);
  v11 = *(_QWORD *)(v3 + OBJC_IVAR___EncoreService_eventHandler);
  *v10 = a1;
  v10[1] = a2;
  swift_retain();
  return sub_23A8A3CB8(v11);
}

uint64_t sub_23A8A2948(void *a1)
{
  return sub_23A8A2954(a1, "EncoreService: publish %@");
}

uint64_t sub_23A8A2954(void *a1, const char *a2)
{
  uint64_t v4;
  id v5;
  NSObject *v6;
  os_log_type_t v7;
  uint8_t *v8;
  _QWORD *v9;
  id v10;

  if (qword_2542D86C0 != -1)
    swift_once();
  v4 = sub_23A8A936C();
  __swift_project_value_buffer(v4, (uint64_t)qword_2542D87E8);
  v5 = a1;
  v6 = sub_23A8A9360();
  v7 = sub_23A8A951C();
  if (os_log_type_enabled(v6, v7))
  {
    v8 = (uint8_t *)swift_slowAlloc();
    v9 = (_QWORD *)swift_slowAlloc();
    *(_DWORD *)v8 = 138412290;
    v10 = v5;
    sub_23A8A9588();
    *v9 = v5;

    _os_log_impl(&dword_23A89B000, v6, v7, a2, v8, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2569C7218);
    swift_arrayDestroy();
    MEMORY[0x23B85A7AC](v9, -1, -1);
    MEMORY[0x23B85A7AC](v8, -1, -1);

  }
  else
  {

  }
  return sub_23A8A1C24(v5);
}

uint64_t sub_23A8A2B58(uint64_t a1, void *a2)
{
  uint64_t v2;
  id v4;

  v4 = objc_msgSend((id)objc_opt_self(), sel_interfaceWithProtocol_, &unk_2569C8AB8);
  objc_msgSend(a2, sel_setExportedInterface_, v4);

  objc_msgSend(a2, sel_setExportedObject_, v2);
  objc_msgSend(a2, sel_resume);
  return 1;
}

void sub_23A8A2CBC(uint64_t a1, uint64_t a2, uint64_t a3, void (*a4)(void), uint64_t a5)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  NSObject *v15;
  os_log_type_t v16;
  uint8_t *v17;
  id v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  id v22;
  void *v23;
  id v24;
  void *v25;
  id v26;
  uint64_t v27;
  id v28;
  id v29;
  unint64_t v30;
  unint64_t v31;
  uint64_t v32;
  void *v33;
  void *v34;
  id v35;
  uint64_t v36;
  void *v37;
  void *v38;
  _QWORD *v39;
  uint64_t *v40;
  NSObject *v41;
  os_log_type_t v42;
  uint8_t *v43;
  uint64_t v44;
  uint64_t v45;
  unint64_t v46;
  void (*v47)(void);
  id v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  void *v52;
  uint64_t v53;
  uint64_t *v54;
  uint64_t v55;
  void (*v56)(void);
  _QWORD *v57;
  uint64_t aBlock;
  uint64_t v59;
  uint64_t (*v60)();
  void *v61;
  uint64_t (*v62)();
  uint64_t v63;
  uint64_t v64;

  v51 = a3;
  v56 = a4;
  v50 = a2;
  v57 = (_QWORD *)type metadata accessor for ClientConnection(0);
  v49 = *(v57 - 1);
  v7 = *(_QWORD *)(v49 + 64);
  v8 = MEMORY[0x24BDAC7A8](v57);
  v9 = MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)&v48 - v10;
  MEMORY[0x24BDAC7A8](v9);
  v13 = (char *)&v48 - v12;
  if (qword_2542D86C0 != -1)
    swift_once();
  v54 = (uint64_t *)((char *)&v48 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0));
  v55 = a5;
  v14 = sub_23A8A936C();
  v53 = __swift_project_value_buffer(v14, (uint64_t)qword_2542D87E8);
  v15 = sub_23A8A9360();
  v16 = sub_23A8A951C();
  if (os_log_type_enabled(v15, v16))
  {
    v17 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v17 = 0;
    _os_log_impl(&dword_23A89B000, v15, v16, "EncoreService: register new connection", v17, 2u);
    MEMORY[0x23B85A7AC](v17, -1, -1);
  }

  v18 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDD1988]), sel_initWithListenerEndpoint_, a1);
  v19 = objc_msgSend((id)objc_opt_self(), sel_interfaceWithProtocol_, &unk_2569C89C0);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2569C7430);
  v20 = swift_allocObject();
  *(_OWORD *)(v20 + 16) = xmmword_23A8A9E90;
  v21 = type metadata accessor for EncoreEvent();
  *(_QWORD *)(v20 + 56) = __swift_instantiateConcreteTypeFromMangledName(&qword_2569C7240);
  *(_QWORD *)(v20 + 32) = v21;
  v22 = objc_allocWithZone(MEMORY[0x24BDBCF20]);
  v23 = (void *)sub_23A8A9450();
  swift_bridgeObjectRelease();
  v24 = objc_msgSend(v22, sel_initWithArray_, v23);

  aBlock = 0;
  sub_23A8A9504();
  if (aBlock)
  {

    v25 = (void *)sub_23A8A94F8();
    swift_bridgeObjectRelease();
    objc_msgSend(v19, sel_setClasses_forSelector_argumentIndex_ofReply_, v25, sel_handleEventWithEvent_, 0, 0);

    objc_msgSend(v18, sel_setRemoteObjectInterface_, v19);
    objc_msgSend(v18, sel_resume);
    v26 = objc_msgSend(v18, sel_remoteObjectProxy);
    sub_23A8A95A0();
    swift_unknownObjectRelease();
    __swift_instantiateConcreteTypeFromMangledName(&qword_2569C7248);
    if (swift_dynamicCast())
    {
      v48 = v19;
      swift_unknownObjectRelease();
      v27 = v51;
      swift_bridgeObjectRetain();
      v28 = v18;
      v57 = v13;
      v29 = v28;
      sub_23A8A9324();
      *v57 = v50;
      v57[1] = v27;
      v57[2] = v29;
      sub_23A8A3D58((uint64_t)v57, (uint64_t)v11);
      v30 = (*(unsigned __int8 *)(v49 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v49 + 80);
      v31 = (v7 + v30 + 7) & 0xFFFFFFFFFFFFFFF8;
      v32 = swift_allocObject();
      sub_23A8A3DA0((uint64_t)v11, v32 + v30);
      v33 = v52;
      *(_QWORD *)(v32 + v31) = v52;
      v62 = sub_23A8A3DE4;
      v63 = v32;
      aBlock = MEMORY[0x24BDAC760];
      v59 = 1107296256;
      v60 = sub_23A8A1A9C;
      v61 = &block_descriptor_6;
      v34 = _Block_copy(&aBlock);
      v35 = v33;
      swift_release();
      objc_msgSend(v29, sel_setInterruptionHandler_, v34);
      _Block_release(v34);
      sub_23A8A3D58((uint64_t)v57, (uint64_t)v11);
      v36 = swift_allocObject();
      sub_23A8A3DA0((uint64_t)v11, v36 + v30);
      *(_QWORD *)(v36 + v31) = v35;
      v37 = v29;
      v62 = sub_23A8A3E9C;
      v63 = v36;
      aBlock = MEMORY[0x24BDAC760];
      v59 = 1107296256;
      v60 = sub_23A8A1A9C;
      v61 = &block_descriptor_12;
      v38 = _Block_copy(&aBlock);
      v35;
      v39 = v57;
      swift_release();
      objc_msgSend(v29, sel_setInvalidationHandler_, v38);
      _Block_release(v38);
      v40 = v54;
      sub_23A8A3D58((uint64_t)v39, (uint64_t)v54);
      v41 = sub_23A8A9360();
      v42 = sub_23A8A951C();
      if (os_log_type_enabled(v41, v42))
      {
        v43 = (uint8_t *)swift_slowAlloc();
        v44 = swift_slowAlloc();
        aBlock = v44;
        *(_DWORD *)v43 = 136315138;
        v53 = (uint64_t)v37;
        v45 = *v40;
        v46 = v40[1];
        swift_bridgeObjectRetain();
        v64 = sub_23A89DE70(v45, v46, &aBlock);
        sub_23A8A9588();
        v37 = (void *)v53;
        swift_bridgeObjectRelease();
        sub_23A8A3EA8((uint64_t)v40);
        _os_log_impl(&dword_23A89B000, v41, v42, "EncoreService: registered new client %s", v43, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x23B85A7AC](v44, -1, -1);
        v39 = v57;
        MEMORY[0x23B85A7AC](v43, -1, -1);
      }
      else
      {
        sub_23A8A3EA8((uint64_t)v40);
      }

      v47 = v56;
      sub_23A8A3620((uint64_t)v39);
      ((void (*)(uint64_t))v47)(1);

      sub_23A8A3EA8((uint64_t)v39);
    }
    else
    {
      v56();

    }
  }
  else
  {
    __break(1u);
  }
}

uint64_t sub_23A8A3360(uint64_t a1)
{
  void (*v1)(uint64_t);
  uint64_t v2;

  v1 = *(void (**)(uint64_t))(a1 + 32);
  v2 = swift_retain();
  v1(v2);
  return swift_release();
}

uint64_t sub_23A8A338C(uint64_t a1, uint64_t a2, const char *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  NSObject *v10;
  os_log_type_t v11;
  uint8_t *v12;
  uint64_t v13;
  const char *v14;
  unint64_t v15;
  uint64_t v16;
  const char *v17;
  _QWORD v19[3];
  uint64_t v20;

  v6 = type metadata accessor for ClientConnection(0);
  MEMORY[0x24BDAC7A8](v6);
  v8 = (_QWORD *)((char *)v19 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0));
  if (qword_2542D86C0 != -1)
    swift_once();
  v9 = sub_23A8A936C();
  __swift_project_value_buffer(v9, (uint64_t)qword_2542D87E8);
  sub_23A8A3D58(a1, (uint64_t)v8);
  v10 = sub_23A8A9360();
  v11 = sub_23A8A951C();
  if (os_log_type_enabled(v10, v11))
  {
    v19[1] = a2;
    v12 = (uint8_t *)swift_slowAlloc();
    v13 = swift_slowAlloc();
    v20 = v13;
    *(_DWORD *)v12 = 136315138;
    v19[0] = a1;
    v14 = a3;
    v16 = *v8;
    v15 = v8[1];
    swift_bridgeObjectRetain();
    v19[2] = sub_23A89DE70(v16, v15, &v20);
    sub_23A8A9588();
    swift_bridgeObjectRelease();
    sub_23A8A3EA8((uint64_t)v8);
    v17 = v14;
    a1 = v19[0];
    _os_log_impl(&dword_23A89B000, v10, v11, v17, v12, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x23B85A7AC](v13, -1, -1);
    MEMORY[0x23B85A7AC](v12, -1, -1);
  }
  else
  {
    sub_23A8A3EA8((uint64_t)v8);
  }

  return sub_23A8A3898(a1);
}

uint64_t sub_23A8A3620(uint64_t a1)
{
  return sub_23A8A38B4(a1, (uint64_t)&unk_250BB3060, (uint64_t)sub_23A8A5BD0, (uint64_t)&block_descriptor_42);
}

uint64_t sub_23A8A363C(uint64_t *a1)
{
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v9;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569C7348);
  MEMORY[0x24BDAC7A8](v2);
  v4 = (char *)&v9 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_2569C6F90 != -1)
    swift_once();
  v5 = *a1;
  v6 = a1[1];
  sub_23A8A3D58((uint64_t)a1, (uint64_t)v4);
  v7 = type metadata accessor for ClientConnection(0);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 56))(v4, 0, 1, v7);
  swift_beginAccess();
  swift_bridgeObjectRetain();
  sub_23A8A3738((uint64_t)v4, v5, v6);
  return swift_endAccess();
}

uint64_t sub_23A8A3738(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t *v3;
  uint64_t *v4;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v17;
  uint64_t v18;

  v4 = v3;
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569C7348);
  MEMORY[0x24BDAC7A8](v8);
  v10 = (char *)&v17 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = type metadata accessor for ClientConnection(0);
  MEMORY[0x24BDAC7A8](v11);
  v13 = (char *)&v17 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  if ((*(unsigned int (**)(uint64_t, uint64_t))(v14 + 48))(a1, 1) == 1)
  {
    sub_23A8A5C64(a1, &qword_2569C7348);
    sub_23A8A4758(a2, a3, (uint64_t)v10);
    swift_bridgeObjectRelease();
    return sub_23A8A5C64((uint64_t)v10, &qword_2569C7348);
  }
  else
  {
    sub_23A8A3DA0(a1, (uint64_t)v13);
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v18 = *v4;
    *v4 = 0x8000000000000000;
    sub_23A8A4DE4((uint64_t)v13, a2, a3, isUniquelyReferenced_nonNull_native);
    *v4 = v18;
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
}

uint64_t sub_23A8A3898(uint64_t a1)
{
  return sub_23A8A38B4(a1, (uint64_t)&unk_250BB2F48, (uint64_t)sub_23A8A4514, (uint64_t)&block_descriptor_19);
}

uint64_t sub_23A8A38B4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  void *v17;
  _QWORD v19[2];
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  _QWORD aBlock[6];

  v20 = a4;
  v19[0] = a3;
  v6 = sub_23A8A93A8();
  v22 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)v19 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v21 = sub_23A8A93CC();
  v9 = *(_QWORD *)(v21 - 8);
  MEMORY[0x24BDAC7A8](v21);
  v11 = (char *)v19 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = type metadata accessor for ClientConnection(0);
  v13 = *(_QWORD *)(v12 - 8);
  v14 = *(_QWORD *)(v13 + 64);
  MEMORY[0x24BDAC7A8](v12);
  v19[1] = *(_QWORD *)(v4 + OBJC_IVAR___EncoreService_queue);
  sub_23A8A3D58(a1, (uint64_t)v19 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0));
  v15 = (*(unsigned __int8 *)(v13 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v13 + 80);
  v16 = swift_allocObject();
  sub_23A8A3DA0((uint64_t)v19 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0), v16 + v15);
  aBlock[4] = v19[0];
  aBlock[5] = v16;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_23A8A1A9C;
  aBlock[3] = v20;
  v17 = _Block_copy(aBlock);
  sub_23A8A93B4();
  v23 = MEMORY[0x24BEE4AF8];
  sub_23A8A5CDC(&qword_2569C7200, (uint64_t (*)(uint64_t))MEMORY[0x24BEE5458], MEMORY[0x24BEE5468]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2569C7208);
  sub_23A8A5D1C(&qword_2569C7210, &qword_2569C7208);
  sub_23A8A95AC();
  MEMORY[0x23B85A194](0, v11, v8, v17);
  _Block_release(v17);
  (*(void (**)(char *, uint64_t))(v22 + 8))(v8, v6);
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v21);
  return swift_release();
}

uint64_t sub_23A8A3AF4(uint64_t *a1)
{
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v8;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569C7348);
  MEMORY[0x24BDAC7A8](v2);
  v4 = (char *)&v8 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_2569C6F90 != -1)
    swift_once();
  v5 = *a1;
  v6 = a1[1];
  swift_beginAccess();
  swift_bridgeObjectRetain();
  sub_23A8A4758(v5, v6, (uint64_t)v4);
  swift_endAccess();
  swift_bridgeObjectRelease();
  return sub_23A8A5C64((uint64_t)v4, &qword_2569C7348);
}

void sub_23A8A3BD8()
{
  uint64_t v0;

  sub_23A8A3CB8(*(_QWORD *)(v0 + OBJC_IVAR___EncoreService_eventHandler));
}

id EncoreService.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for EncoreService(0);
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_23A8A3CB8(uint64_t result)
{
  if (result)
    return swift_release();
  return result;
}

uint64_t sub_23A8A3CC8(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2542D8700);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t type metadata accessor for ClientConnection(uint64_t a1)
{
  return sub_23A8A3D24(a1, qword_2569C7308);
}

uint64_t sub_23A8A3D24(uint64_t a1, uint64_t *a2)
{
  uint64_t result;

  result = *a2;
  if (!*a2)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_23A8A3D58(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for ClientConnection(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_23A8A3DA0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for ClientConnection(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_23A8A3DE4()
{
  return sub_23A8A5AB8("EncoreService: interruption on client %s");
}

uint64_t objectdestroy_2Tm()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v1 = type metadata accessor for ClientConnection(0);
  v2 = *(_QWORD *)(v1 - 8);
  v3 = (*(unsigned __int8 *)(v2 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  v4 = (*(_QWORD *)(v2 + 64) + v3 + 7) & 0xFFFFFFFFFFFFFFF8;
  v5 = v0 + v3;
  swift_bridgeObjectRelease();

  v6 = v5 + *(int *)(v1 + 24);
  v7 = sub_23A8A9330();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 8))(v6, v7);

  return swift_deallocObject();
}

uint64_t sub_23A8A3E9C()
{
  return sub_23A8A5AB8("EncoreService: invalidation on client %s");
}

uint64_t sub_23A8A3EA8(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata accessor for ClientConnection(0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

id sub_23A8A3EE4@<X0>(_QWORD *a1@<X0>, void **a2@<X8>)
{
  void **v3;
  void *v4;

  v3 = (void **)(*a1 + OBJC_IVAR___EncoreService_endpoint);
  swift_beginAccess();
  v4 = *v3;
  *a2 = *v3;
  return v4;
}

uint64_t sub_23A8A3F38()
{
  return type metadata accessor for EncoreService(0);
}

uint64_t sub_23A8A3F40()
{
  return swift_updateClassMetadata2();
}

uint64_t method lookup function for EncoreService()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of EncoreService.endpoint.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xF0))();
}

uint64_t dispatch thunk of static EncoreService.service.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 264))();
}

uint64_t dispatch thunk of static EncoreService.loopbackService.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 272))();
}

uint64_t dispatch thunk of EncoreService.broadcast(event:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x138))();
}

uint64_t dispatch thunk of EncoreService.echo(event:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x140))();
}

uint64_t dispatch thunk of EncoreService.handleEvent(event:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x148))();
}

uint64_t dispatch thunk of EncoreService.subscribe(completion:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x150))();
}

uint64_t dispatch thunk of EncoreService.publish(event:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x158))();
}

uint64_t dispatch thunk of EncoreService.listener(_:shouldAcceptNewConnection:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x160))();
}

uint64_t dispatch thunk of EncoreService.register(client:name:with:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x168))();
}

uint64_t *sub_23A8A4094(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t *v3;
  int v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  char *v8;
  char *v9;
  uint64_t v10;
  void (*v11)(char *, char *, uint64_t);
  id v12;
  uint64_t v13;

  v3 = a1;
  v4 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v4 & 0x20000) != 0)
  {
    v13 = *a2;
    *v3 = *a2;
    v3 = (uint64_t *)(v13 + ((v4 + 16) & ~(unint64_t)v4));
    swift_retain();
  }
  else
  {
    v5 = a2[1];
    *a1 = *a2;
    a1[1] = v5;
    v6 = (void *)a2[2];
    a1[2] = (uint64_t)v6;
    v7 = *(int *)(a3 + 24);
    v8 = (char *)a1 + v7;
    v9 = (char *)a2 + v7;
    v10 = sub_23A8A9330();
    v11 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v10 - 8) + 16);
    swift_bridgeObjectRetain();
    v12 = v6;
    v11(v8, v9, v10);
  }
  return v3;
}

uint64_t sub_23A8A4144(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;

  swift_bridgeObjectRelease();

  v4 = a1 + *(int *)(a2 + 24);
  v5 = sub_23A8A9330();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(v4, v5);
}

_QWORD *sub_23A8A4194(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v4;
  void *v5;
  uint64_t v6;
  char *v7;
  char *v8;
  uint64_t v9;
  void (*v10)(char *, char *, uint64_t);
  id v11;

  v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  v5 = (void *)a2[2];
  a1[2] = v5;
  v6 = *(int *)(a3 + 24);
  v7 = (char *)a1 + v6;
  v8 = (char *)a2 + v6;
  v9 = sub_23A8A9330();
  v10 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v9 - 8) + 16);
  swift_bridgeObjectRetain();
  v11 = v5;
  v10(v7, v8, v9);
  return a1;
}

_QWORD *sub_23A8A4218(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  char *v10;
  char *v11;
  uint64_t v12;

  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v6 = (void *)a2[2];
  v7 = (void *)a1[2];
  a1[2] = v6;
  v8 = v6;

  v9 = *(int *)(a3 + 24);
  v10 = (char *)a1 + v9;
  v11 = (char *)a2 + v9;
  v12 = sub_23A8A9330();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v12 - 8) + 24))(v10, v11, v12);
  return a1;
}

uint64_t sub_23A8A42A8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  v4 = *(int *)(a3 + 24);
  v5 = a1 + v4;
  v6 = a2 + v4;
  v7 = sub_23A8A9330();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 32))(v5, v6, v7);
  return a1;
}

_QWORD *sub_23A8A430C(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v6;
  void *v7;
  uint64_t v8;
  char *v9;
  char *v10;
  uint64_t v11;

  v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  swift_bridgeObjectRelease();
  v7 = (void *)a1[2];
  a1[2] = a2[2];

  v8 = *(int *)(a3 + 24);
  v9 = (char *)a1 + v8;
  v10 = (char *)a2 + v8;
  v11 = sub_23A8A9330();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v11 - 8) + 40))(v9, v10, v11);
  return a1;
}

uint64_t sub_23A8A4388()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_23A8A4394(uint64_t a1, uint64_t a2, uint64_t a3)
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
    v8 = sub_23A8A9330();
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 48))(a1 + *(int *)(a3 + 24), a2, v8);
  }
}

uint64_t sub_23A8A4410()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_23A8A441C(uint64_t result, uint64_t a2, int a3, uint64_t a4)
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
    v7 = sub_23A8A9330();
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 56))(v5 + *(int *)(a4 + 24), a2, a2, v7);
  }
  return result;
}

uint64_t sub_23A8A4490()
{
  uint64_t result;
  unint64_t v1;

  result = sub_23A8A9330();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t sub_23A8A4514()
{
  return sub_23A8A5BDC((uint64_t (*)(uint64_t))sub_23A8A3AF4);
}

unint64_t sub_23A8A4520(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_23A8A95C4();
  return sub_23A8A45B4(a1, v2);
}

unint64_t sub_23A8A4550(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  sub_23A8A96C0();
  sub_23A8A942C();
  v4 = sub_23A8A96D8();
  return sub_23A8A4678(a1, a2, v4);
}

unint64_t sub_23A8A45B4(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v6;
  char v7;
  _BYTE v9[40];

  v3 = -1 << *(_BYTE *)(v2 + 32);
  v4 = a2 & ~v3;
  if (((*(_QWORD *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFF8)) >> v4) & 1) != 0)
  {
    v6 = ~v3;
    do
    {
      sub_23A8A5D5C(*(_QWORD *)(v2 + 48) + 40 * v4, (uint64_t)v9);
      v7 = MEMORY[0x23B85A218](v9, a1);
      sub_23A8A5D98((uint64_t)v9);
      if ((v7 & 1) != 0)
        break;
      v4 = (v4 + 1) & v6;
    }
    while (((*(_QWORD *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFF8)) >> v4) & 1) != 0);
  }
  return v4;
}

unint64_t sub_23A8A4678(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v9;
  _QWORD *v10;
  BOOL v11;
  uint64_t v12;
  _QWORD *v13;
  BOOL v14;

  v4 = v3 + 64;
  v5 = -1 << *(_BYTE *)(v3 + 32);
  v6 = a3 & ~v5;
  if (((*(_QWORD *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8)) >> v6) & 1) != 0)
  {
    v9 = *(_QWORD *)(v3 + 48);
    v10 = (_QWORD *)(v9 + 16 * v6);
    v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (sub_23A8A9690() & 1) == 0)
    {
      v12 = ~v5;
      do
      {
        v6 = (v6 + 1) & v12;
        if (((*(_QWORD *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8)) >> v6) & 1) == 0)
          break;
        v13 = (_QWORD *)(v9 + 16 * v6);
        v14 = *v13 == a1 && v13[1] == a2;
      }
      while (!v14 && (sub_23A8A9690() & 1) == 0);
    }
  }
  return v6;
}

uint64_t sub_23A8A4758@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t *v3;
  uint64_t *v4;
  unint64_t v8;
  char v9;
  int isUniquelyReferenced_nonNull_native;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v16;
  uint64_t v17;

  v4 = v3;
  swift_bridgeObjectRetain();
  v8 = sub_23A8A4550(a1, a2);
  LOBYTE(a2) = v9;
  swift_bridgeObjectRelease();
  if ((a2 & 1) != 0)
  {
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v11 = *v4;
    v17 = *v4;
    *v4 = 0x8000000000000000;
    if (!isUniquelyReferenced_nonNull_native)
    {
      sub_23A8A4FA0();
      v11 = v17;
    }
    swift_bridgeObjectRelease();
    v12 = *(_QWORD *)(v11 + 56);
    v13 = type metadata accessor for ClientConnection(0);
    v14 = *(_QWORD *)(v13 - 8);
    sub_23A8A3DA0(v12 + *(_QWORD *)(v14 + 72) * v8, a3);
    sub_23A8A4BE8(v8, v11);
    *v4 = v11;
    swift_bridgeObjectRelease();
    return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v14 + 56))(a3, 0, 1, v13);
  }
  else
  {
    v16 = type metadata accessor for ClientConnection(0);
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v16 - 8) + 56))(a3, 1, 1, v16);
  }
}

uint64_t sub_23A8A4880(uint64_t a1, int a2)
{
  uint64_t *v2;
  uint64_t *v3;
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
  uint64_t result;
  int64_t v17;
  unint64_t v18;
  _QWORD *v19;
  unint64_t v20;
  unint64_t v21;
  int64_t v22;
  _QWORD *v23;
  unint64_t v24;
  int64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  unint64_t v32;
  unint64_t v33;
  char v34;
  unint64_t v35;
  BOOL v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t *v39;
  int64_t v40;
  _QWORD *v41;
  uint64_t v42;
  int v43;

  v3 = v2;
  v5 = type metadata accessor for ClientConnection(0);
  v42 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)&v39 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2569C7350);
  v43 = a2;
  v9 = sub_23A8A963C();
  v10 = v9;
  if (!*(_QWORD *)(v8 + 16))
    goto LABEL_41;
  v11 = 1 << *(_BYTE *)(v8 + 32);
  v12 = *(_QWORD *)(v8 + 64);
  v41 = (_QWORD *)(v8 + 64);
  if (v11 < 64)
    v13 = ~(-1 << v11);
  else
    v13 = -1;
  v14 = v13 & v12;
  v39 = v2;
  v40 = (unint64_t)(v11 + 63) >> 6;
  v15 = v9 + 64;
  result = swift_retain();
  v17 = 0;
  while (1)
  {
    if (v14)
    {
      v20 = __clz(__rbit64(v14));
      v14 &= v14 - 1;
      v21 = v20 | (v17 << 6);
      goto LABEL_22;
    }
    v22 = v17 + 1;
    if (__OFADD__(v17, 1))
    {
LABEL_42:
      __break(1u);
LABEL_43:
      __break(1u);
      return result;
    }
    if (v22 >= v40)
      break;
    v23 = v41;
    v24 = v41[v22];
    ++v17;
    if (!v24)
    {
      v17 = v22 + 1;
      if (v22 + 1 >= v40)
        goto LABEL_34;
      v24 = v41[v17];
      if (!v24)
      {
        v25 = v22 + 2;
        if (v25 >= v40)
        {
LABEL_34:
          swift_release();
          v3 = v39;
          if ((v43 & 1) == 0)
            goto LABEL_41;
          goto LABEL_37;
        }
        v24 = v41[v25];
        if (!v24)
        {
          while (1)
          {
            v17 = v25 + 1;
            if (__OFADD__(v25, 1))
              goto LABEL_43;
            if (v17 >= v40)
              goto LABEL_34;
            v24 = v41[v17];
            ++v25;
            if (v24)
              goto LABEL_21;
          }
        }
        v17 = v25;
      }
    }
LABEL_21:
    v14 = (v24 - 1) & v24;
    v21 = __clz(__rbit64(v24)) + (v17 << 6);
LABEL_22:
    v26 = (uint64_t *)(*(_QWORD *)(v8 + 48) + 16 * v21);
    v28 = *v26;
    v27 = v26[1];
    v29 = *(_QWORD *)(v42 + 72);
    v30 = *(_QWORD *)(v8 + 56) + v29 * v21;
    if ((v43 & 1) != 0)
    {
      sub_23A8A3DA0(v30, (uint64_t)v7);
    }
    else
    {
      sub_23A8A3D58(v30, (uint64_t)v7);
      swift_bridgeObjectRetain();
    }
    sub_23A8A96C0();
    sub_23A8A942C();
    result = sub_23A8A96D8();
    v31 = -1 << *(_BYTE *)(v10 + 32);
    v32 = result & ~v31;
    v33 = v32 >> 6;
    if (((-1 << v32) & ~*(_QWORD *)(v15 + 8 * (v32 >> 6))) != 0)
    {
      v18 = __clz(__rbit64((-1 << v32) & ~*(_QWORD *)(v15 + 8 * (v32 >> 6)))) | v32 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v34 = 0;
      v35 = (unint64_t)(63 - v31) >> 6;
      do
      {
        if (++v33 == v35 && (v34 & 1) != 0)
        {
          __break(1u);
          goto LABEL_42;
        }
        v36 = v33 == v35;
        if (v33 == v35)
          v33 = 0;
        v34 |= v36;
        v37 = *(_QWORD *)(v15 + 8 * v33);
      }
      while (v37 == -1);
      v18 = __clz(__rbit64(~v37)) + (v33 << 6);
    }
    *(_QWORD *)(v15 + ((v18 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v18;
    v19 = (_QWORD *)(*(_QWORD *)(v10 + 48) + 16 * v18);
    *v19 = v28;
    v19[1] = v27;
    result = sub_23A8A3DA0((uint64_t)v7, *(_QWORD *)(v10 + 56) + v29 * v18);
    ++*(_QWORD *)(v10 + 16);
  }
  swift_release();
  v3 = v39;
  v23 = v41;
  if ((v43 & 1) == 0)
    goto LABEL_41;
LABEL_37:
  v38 = 1 << *(_BYTE *)(v8 + 32);
  if (v38 >= 64)
    bzero(v23, ((unint64_t)(v38 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  else
    *v23 = -1 << v38;
  *(_QWORD *)(v8 + 16) = 0;
LABEL_41:
  result = swift_release();
  *v3 = v10;
  return result;
}

unint64_t sub_23A8A4BE8(unint64_t result, uint64_t a2)
{
  int64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  _OWORD *v12;
  _OWORD *v13;
  uint64_t v14;
  uint64_t v15;
  int64_t v16;
  int64_t v17;
  unint64_t v18;
  uint64_t *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  BOOL v24;
  uint64_t v25;

  v3 = result;
  v4 = a2 + 64;
  v5 = -1 << *(_BYTE *)(a2 + 32);
  v6 = (result + 1) & ~v5;
  if (((1 << v6) & *(_QWORD *)(a2 + 64 + 8 * (v6 >> 6))) != 0)
  {
    v7 = ~v5;
    result = sub_23A8A95B8();
    if ((*(_QWORD *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      v8 = (result + 1) & v7;
      while (1)
      {
        sub_23A8A96C0();
        swift_bridgeObjectRetain();
        sub_23A8A942C();
        v9 = sub_23A8A96D8();
        result = swift_bridgeObjectRelease();
        v10 = v9 & v7;
        if (v3 >= (uint64_t)v8)
          break;
        if (v10 < v8)
          goto LABEL_11;
LABEL_12:
        v11 = *(_QWORD *)(a2 + 48);
        v12 = (_OWORD *)(v11 + 16 * v3);
        v13 = (_OWORD *)(v11 + 16 * v6);
        if (v3 != v6 || v12 >= v13 + 1)
          *v12 = *v13;
        v14 = *(_QWORD *)(a2 + 56);
        v15 = *(_QWORD *)(*(_QWORD *)(type metadata accessor for ClientConnection(0) - 8) + 72);
        v16 = v15 * v3;
        result = v14 + v15 * v3;
        v17 = v15 * v6;
        v18 = v14 + v15 * v6 + v15;
        if (v16 < v17 || result >= v18)
        {
          result = swift_arrayInitWithTakeFrontToBack();
        }
        else
        {
          v3 = v6;
          if (v16 == v17)
            goto LABEL_6;
          result = swift_arrayInitWithTakeBackToFront();
        }
        v3 = v6;
LABEL_6:
        v6 = (v6 + 1) & v7;
        if (((*(_QWORD *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8)) >> v6) & 1) == 0)
          goto LABEL_21;
      }
      if (v10 < v8)
        goto LABEL_6;
LABEL_11:
      if (v3 < (uint64_t)v10)
        goto LABEL_6;
      goto LABEL_12;
    }
LABEL_21:
    v20 = (uint64_t *)(v4 + 8 * ((unint64_t)v3 >> 6));
    v21 = *v20;
    v22 = (-1 << v3) - 1;
  }
  else
  {
    v20 = (uint64_t *)(v4 + 8 * (result >> 6));
    v22 = *v20;
    v21 = (-1 << result) - 1;
  }
  *v20 = v22 & v21;
  v23 = *(_QWORD *)(a2 + 16);
  v24 = __OFSUB__(v23, 1);
  v25 = v23 - 1;
  if (v24)
  {
    __break(1u);
  }
  else
  {
    *(_QWORD *)(a2 + 16) = v25;
    ++*(_DWORD *)(a2 + 36);
  }
  return result;
}

uint64_t sub_23A8A4DE4(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  _QWORD *v4;
  _QWORD **v5;
  _QWORD *v10;
  char v11;
  unint64_t v12;
  uint64_t v13;
  _BOOL8 v14;
  uint64_t v15;
  char v16;
  uint64_t v17;
  _QWORD *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t result;
  unint64_t v22;
  char v23;

  v5 = (_QWORD **)v4;
  v10 = (_QWORD *)*v4;
  v12 = sub_23A8A4550(a2, a3);
  v13 = v10[2];
  v14 = (v11 & 1) == 0;
  v15 = v13 + v14;
  if (__OFADD__(v13, v14))
  {
    __break(1u);
  }
  else
  {
    v16 = v11;
    v17 = v10[3];
    if (v17 >= v15 && (a4 & 1) != 0)
    {
LABEL_7:
      v18 = *v5;
      if ((v16 & 1) != 0)
      {
LABEL_8:
        v19 = v18[7];
        v20 = v19 + *(_QWORD *)(*(_QWORD *)(type metadata accessor for ClientConnection(0) - 8) + 72) * v12;
        return sub_23A8A5C18(a1, v20);
      }
      goto LABEL_11;
    }
    if (v17 >= v15 && (a4 & 1) == 0)
    {
      sub_23A8A4FA0();
      goto LABEL_7;
    }
    sub_23A8A4880(v15, a4 & 1);
    v22 = sub_23A8A4550(a2, a3);
    if ((v16 & 1) == (v23 & 1))
    {
      v12 = v22;
      v18 = *v5;
      if ((v16 & 1) != 0)
        goto LABEL_8;
LABEL_11:
      sub_23A8A4F18(v12, a2, a3, a1, v18);
      return swift_bridgeObjectRetain();
    }
  }
  result = sub_23A8A96A8();
  __break(1u);
  return result;
}

uint64_t sub_23A8A4F18(unint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, _QWORD *a5)
{
  _QWORD *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t result;
  uint64_t v12;
  BOOL v13;
  uint64_t v14;

  a5[(a1 >> 6) + 8] |= 1 << a1;
  v8 = (_QWORD *)(a5[6] + 16 * a1);
  *v8 = a2;
  v8[1] = a3;
  v9 = a5[7];
  v10 = type metadata accessor for ClientConnection(0);
  result = sub_23A8A3DA0(a4, v9 + *(_QWORD *)(*(_QWORD *)(v10 - 8) + 72) * a1);
  v12 = a5[2];
  v13 = __OFADD__(v12, 1);
  v14 = v12 + 1;
  if (v13)
    __break(1u);
  else
    a5[2] = v14;
  return result;
}

void *sub_23A8A4FA0()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *result;
  unint64_t v9;
  int64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  int64_t v15;
  unint64_t v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  _QWORD *v23;
  int64_t v24;
  unint64_t v25;
  int64_t v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t v30;

  v1 = v0;
  v2 = type metadata accessor for ClientConnection(0);
  v30 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v4 = (char *)&v27 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2569C7350);
  v5 = *v0;
  v6 = sub_23A8A9630();
  v7 = v6;
  if (!*(_QWORD *)(v5 + 16))
  {
    result = (void *)swift_release();
LABEL_28:
    *v1 = v7;
    return result;
  }
  v28 = v1;
  result = (void *)(v6 + 64);
  v9 = (unint64_t)((1 << *(_BYTE *)(v7 + 32)) + 63) >> 6;
  if (v7 != v5 || (unint64_t)result >= v5 + 64 + 8 * v9)
    result = memmove(result, (const void *)(v5 + 64), 8 * v9);
  v29 = v5 + 64;
  v11 = 0;
  *(_QWORD *)(v7 + 16) = *(_QWORD *)(v5 + 16);
  v12 = 1 << *(_BYTE *)(v5 + 32);
  v13 = -1;
  if (v12 < 64)
    v13 = ~(-1 << v12);
  v14 = v13 & *(_QWORD *)(v5 + 64);
  v15 = (unint64_t)(v12 + 63) >> 6;
  while (1)
  {
    if (v14)
    {
      v16 = __clz(__rbit64(v14));
      v14 &= v14 - 1;
      v17 = v16 | (v11 << 6);
      goto LABEL_12;
    }
    v24 = v11 + 1;
    if (__OFADD__(v11, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v24 >= v15)
      goto LABEL_26;
    v25 = *(_QWORD *)(v29 + 8 * v24);
    ++v11;
    if (!v25)
    {
      v11 = v24 + 1;
      if (v24 + 1 >= v15)
        goto LABEL_26;
      v25 = *(_QWORD *)(v29 + 8 * v11);
      if (!v25)
        break;
    }
LABEL_25:
    v14 = (v25 - 1) & v25;
    v17 = __clz(__rbit64(v25)) + (v11 << 6);
LABEL_12:
    v18 = 16 * v17;
    v19 = (uint64_t *)(*(_QWORD *)(v5 + 48) + 16 * v17);
    v21 = *v19;
    v20 = v19[1];
    v22 = *(_QWORD *)(v30 + 72) * v17;
    sub_23A8A3D58(*(_QWORD *)(v5 + 56) + v22, (uint64_t)v4);
    v23 = (_QWORD *)(*(_QWORD *)(v7 + 48) + v18);
    *v23 = v21;
    v23[1] = v20;
    sub_23A8A3DA0((uint64_t)v4, *(_QWORD *)(v7 + 56) + v22);
    result = (void *)swift_bridgeObjectRetain();
  }
  v26 = v24 + 2;
  if (v26 >= v15)
  {
LABEL_26:
    result = (void *)swift_release();
    v1 = v28;
    goto LABEL_28;
  }
  v25 = *(_QWORD *)(v29 + 8 * v26);
  if (v25)
  {
    v11 = v26;
    goto LABEL_25;
  }
  while (1)
  {
    v11 = v26 + 1;
    if (__OFADD__(v26, 1))
      break;
    if (v11 >= v15)
      goto LABEL_26;
    v25 = *(_QWORD *)(v29 + 8 * v11);
    ++v26;
    if (v25)
      goto LABEL_25;
  }
LABEL_30:
  __break(1u);
  return result;
}

uint64_t sub_23A8A51CC(uint64_t a1, void (*a2)(uint64_t, uint64_t, uint64_t))
{
  uint64_t v3;
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t result;
  int64_t v10;
  unint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  int64_t v19;
  unint64_t v20;
  int64_t v21;
  uint64_t v22;
  uint64_t v23;
  int64_t v24;
  uint64_t v25;
  void (*v26)(uint64_t, uint64_t, uint64_t);

  v26 = a2;
  v25 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569C7358);
  MEMORY[0x24BDAC7A8](v25);
  v4 = (uint64_t *)((char *)&v22 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0));
  v5 = *(_QWORD *)(a1 + 64);
  v23 = a1 + 64;
  v6 = 1 << *(_BYTE *)(a1 + 32);
  v7 = -1;
  if (v6 < 64)
    v7 = ~(-1 << v6);
  v8 = v7 & v5;
  v24 = (unint64_t)(v6 + 63) >> 6;
  result = swift_bridgeObjectRetain();
  v10 = 0;
  while (1)
  {
    if (v8)
    {
      v11 = __clz(__rbit64(v8));
      v8 &= v8 - 1;
      v12 = v11 | (v10 << 6);
      goto LABEL_5;
    }
    v19 = v10 + 1;
    if (__OFADD__(v10, 1))
    {
      __break(1u);
      goto LABEL_25;
    }
    if (v19 >= v24)
      return swift_release();
    v20 = *(_QWORD *)(v23 + 8 * v19);
    ++v10;
    if (!v20)
    {
      v10 = v19 + 1;
      if (v19 + 1 >= v24)
        return swift_release();
      v20 = *(_QWORD *)(v23 + 8 * v10);
      if (!v20)
      {
        v10 = v19 + 2;
        if (v19 + 2 >= v24)
          return swift_release();
        v20 = *(_QWORD *)(v23 + 8 * v10);
        if (!v20)
        {
          v10 = v19 + 3;
          if (v19 + 3 >= v24)
            return swift_release();
          v20 = *(_QWORD *)(v23 + 8 * v10);
          if (!v20)
            break;
        }
      }
    }
LABEL_22:
    v8 = (v20 - 1) & v20;
    v12 = __clz(__rbit64(v20)) + (v10 << 6);
LABEL_5:
    v13 = *(_QWORD *)(a1 + 56);
    v14 = (uint64_t *)(*(_QWORD *)(a1 + 48) + 16 * v12);
    v15 = *v14;
    v16 = v14[1];
    v17 = v13 + *(_QWORD *)(*(_QWORD *)(type metadata accessor for ClientConnection(0) - 8) + 72) * v12;
    v18 = (uint64_t)v4 + *(int *)(v25 + 48);
    sub_23A8A3D58(v17, v18);
    *v4 = v15;
    v4[1] = v16;
    swift_bridgeObjectRetain();
    v26(v15, v16, v18);
    result = sub_23A8A5C64((uint64_t)v4, &qword_2569C7358);
  }
  v21 = v19 + 4;
  if (v21 >= v24)
    return swift_release();
  v20 = *(_QWORD *)(v23 + 8 * v21);
  if (v20)
  {
    v10 = v21;
    goto LABEL_22;
  }
  while (1)
  {
    v10 = v21 + 1;
    if (__OFADD__(v21, 1))
      break;
    if (v10 >= v24)
      return swift_release();
    v20 = *(_QWORD *)(v23 + 8 * v10);
    ++v21;
    if (v20)
      goto LABEL_22;
  }
LABEL_25:
  __break(1u);
  return result;
}

void sub_23A8A5408(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, void (**a5)(_QWORD, _QWORD))
{
  _QWORD *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  _QWORD *v15;
  uint64_t v16;
  NSObject *v17;
  os_log_type_t v18;
  uint8_t *v19;
  id v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  id v24;
  void *v25;
  id v26;
  void *v27;
  id v28;
  uint64_t v29;
  id v30;
  void *v31;
  unint64_t v32;
  unint64_t v33;
  uint64_t v34;
  void *v35;
  void *v36;
  id v37;
  uint64_t v38;
  void *v39;
  id v40;
  void *v41;
  uint64_t v42;
  uint64_t *v43;
  NSObject *v44;
  os_log_type_t v45;
  uint8_t *v46;
  uint64_t v47;
  uint64_t v48;
  unint64_t v49;
  uint64_t v50;
  void (**v51)(_QWORD, _QWORD);
  id v52[2];
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  id v56;
  uint64_t v57;
  uint64_t *v58;
  void (**v59)(_QWORD, _QWORD);
  uint64_t aBlock;
  uint64_t v61;
  uint64_t (*v62)();
  void *v63;
  uint64_t (*v64)();
  uint64_t v65;
  uint64_t v66;

  v55 = a3;
  v56 = a4;
  v54 = a2;
  v7 = (_QWORD *)type metadata accessor for ClientConnection(0);
  v8 = *(v7 - 1);
  v52[1] = v7;
  v53 = v8;
  v9 = *(_QWORD *)(v8 + 64);
  v10 = MEMORY[0x24BDAC7A8](v7);
  v11 = MEMORY[0x24BDAC7A8](v10);
  v13 = (char *)v52 - v12;
  MEMORY[0x24BDAC7A8](v11);
  v15 = (id *)((char *)v52 - v14);
  if (qword_2542D86C0 != -1)
    swift_once();
  v58 = (uint64_t *)((char *)v52 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0));
  v59 = a5;
  v16 = sub_23A8A936C();
  v57 = __swift_project_value_buffer(v16, (uint64_t)qword_2542D87E8);
  v17 = sub_23A8A9360();
  v18 = sub_23A8A951C();
  if (os_log_type_enabled(v17, v18))
  {
    v19 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v19 = 0;
    _os_log_impl(&dword_23A89B000, v17, v18, "EncoreService: register new connection", v19, 2u);
    MEMORY[0x23B85A7AC](v19, -1, -1);
  }

  v20 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDD1988]), sel_initWithListenerEndpoint_, a1);
  v21 = objc_msgSend((id)objc_opt_self(), sel_interfaceWithProtocol_, &unk_2569C89C0);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2569C7430);
  v22 = swift_allocObject();
  *(_OWORD *)(v22 + 16) = xmmword_23A8A9E90;
  v23 = type metadata accessor for EncoreEvent();
  *(_QWORD *)(v22 + 56) = __swift_instantiateConcreteTypeFromMangledName(&qword_2569C7240);
  *(_QWORD *)(v22 + 32) = v23;
  v24 = objc_allocWithZone(MEMORY[0x24BDBCF20]);
  v25 = (void *)sub_23A8A9450();
  swift_bridgeObjectRelease();
  v26 = objc_msgSend(v24, sel_initWithArray_, v25);

  aBlock = 0;
  sub_23A8A9504();
  if (aBlock)
  {

    v27 = (void *)sub_23A8A94F8();
    swift_bridgeObjectRelease();
    objc_msgSend(v21, sel_setClasses_forSelector_argumentIndex_ofReply_, v27, sel_handleEventWithEvent_, 0, 0);

    objc_msgSend(v20, sel_setRemoteObjectInterface_, v21);
    objc_msgSend(v20, sel_resume);
    v28 = objc_msgSend(v20, sel_remoteObjectProxy);
    sub_23A8A95A0();
    swift_unknownObjectRelease();
    __swift_instantiateConcreteTypeFromMangledName(&qword_2569C7248);
    if ((swift_dynamicCast() & 1) != 0)
    {
      v52[0] = v21;
      swift_unknownObjectRelease();
      v29 = v55;
      swift_bridgeObjectRetain();
      v30 = v20;
      sub_23A8A9324();
      *v15 = v54;
      v15[1] = v29;
      v15[2] = v30;
      v31 = v30;
      sub_23A8A3D58((uint64_t)v15, (uint64_t)v13);
      v32 = (*(unsigned __int8 *)(v53 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v53 + 80);
      v33 = (v9 + v32 + 7) & 0xFFFFFFFFFFFFFFF8;
      v34 = swift_allocObject();
      sub_23A8A3DA0((uint64_t)v13, v34 + v32);
      v35 = v56;
      *(_QWORD *)(v34 + v33) = v56;
      v64 = sub_23A8A3DE4;
      v65 = v34;
      aBlock = MEMORY[0x24BDAC760];
      v61 = 1107296256;
      v62 = sub_23A8A1A9C;
      v63 = &block_descriptor_26;
      v36 = _Block_copy(&aBlock);
      v37 = v35;
      swift_release();
      objc_msgSend(v31, sel_setInterruptionHandler_, v36);
      _Block_release(v36);
      sub_23A8A3D58((uint64_t)v15, (uint64_t)v13);
      v38 = swift_allocObject();
      sub_23A8A3DA0((uint64_t)v13, v38 + v32);
      *(_QWORD *)(v38 + v33) = v37;
      v64 = sub_23A8A3E9C;
      v65 = v38;
      aBlock = MEMORY[0x24BDAC760];
      v61 = 1107296256;
      v62 = sub_23A8A1A9C;
      v63 = &block_descriptor_33;
      v39 = _Block_copy(&aBlock);
      v40 = v37;
      v41 = v31;
      v42 = (uint64_t)v15;
      swift_release();
      objc_msgSend(v31, sel_setInvalidationHandler_, v39);
      _Block_release(v39);
      v43 = v58;
      sub_23A8A3D58((uint64_t)v15, (uint64_t)v58);
      v44 = sub_23A8A9360();
      v45 = sub_23A8A951C();
      if (os_log_type_enabled(v44, v45))
      {
        v56 = v40;
        v46 = (uint8_t *)swift_slowAlloc();
        v47 = swift_slowAlloc();
        aBlock = v47;
        v57 = (uint64_t)v41;
        *(_DWORD *)v46 = 136315138;
        v48 = *v43;
        v49 = v43[1];
        swift_bridgeObjectRetain();
        v50 = v48;
        v42 = (uint64_t)v15;
        v66 = sub_23A89DE70(v50, v49, &aBlock);
        v41 = (void *)v57;
        sub_23A8A9588();
        swift_bridgeObjectRelease();
        sub_23A8A3EA8((uint64_t)v43);
        _os_log_impl(&dword_23A89B000, v44, v45, "EncoreService: registered new client %s", v46, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x23B85A7AC](v47, -1, -1);
        MEMORY[0x23B85A7AC](v46, -1, -1);
      }
      else
      {
        sub_23A8A3EA8((uint64_t)v43);
      }

      v51 = v59;
      sub_23A8A3620(v42);
      v51[2](v51, 1);

      sub_23A8A3EA8(v42);
    }
    else
    {
      v59[2](v59, 0);

    }
  }
  else
  {
    _Block_release(v59);
    __break(1u);
  }
}

uint64_t sub_23A8A5AB8(const char *a1)
{
  uint64_t v1;
  uint64_t v3;
  unint64_t v4;

  v3 = *(_QWORD *)(type metadata accessor for ClientConnection(0) - 8);
  v4 = (*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  return sub_23A8A338C(v1 + v4, *(_QWORD *)(v1 + ((*(_QWORD *)(v3 + 64) + v4 + 7) & 0xFFFFFFFFFFFFF8)), a1);
}

uint64_t sub_23A8A5B0C()
{
  uint64_t v0;

  _Block_release(*(const void **)(v0 + 16));
  return swift_deallocObject();
}

uint64_t sub_23A8A5B30(uint64_t a1)
{
  uint64_t v1;

  return sub_23A8A5F64(a1, *(_QWORD *)(v1 + 16));
}

uint64_t objectdestroy_15Tm()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v1 = type metadata accessor for ClientConnection(0);
  v2 = *(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80);
  v3 = v0 + ((v2 + 16) & ~v2);
  swift_bridgeObjectRelease();

  v4 = v3 + *(int *)(v1 + 24);
  v5 = sub_23A8A9330();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(v4, v5);
  return swift_deallocObject();
}

uint64_t sub_23A8A5BD0()
{
  return sub_23A8A5BDC((uint64_t (*)(uint64_t))sub_23A8A363C);
}

uint64_t sub_23A8A5BDC(uint64_t (*a1)(uint64_t))
{
  uint64_t v1;
  uint64_t v2;

  v2 = *(unsigned __int8 *)(*(_QWORD *)(type metadata accessor for ClientConnection(0) - 8) + 80);
  return a1(v1 + ((v2 + 16) & ~v2));
}

uint64_t sub_23A8A5C18(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for ClientConnection(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t sub_23A8A5C5C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;

  return sub_23A8A202C(a1, a2, a3, *(void **)(v3 + 16));
}

uint64_t sub_23A8A5C64(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

unint64_t sub_23A8A5CA0()
{
  unint64_t result;

  result = qword_2542D8730;
  if (!qword_2542D8730)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_2542D8730);
  }
  return result;
}

uint64_t sub_23A8A5CDC(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = a2(255);
    result = MEMORY[0x23B85A71C](a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_23A8A5D1C(unint64_t *a1, uint64_t *a2)
{
  uint64_t result;
  uint64_t v4;

  result = *a1;
  if (!result)
  {
    v4 = __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    result = MEMORY[0x23B85A71C](MEMORY[0x24BEE12C8], v4);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_23A8A5D5C(uint64_t a1, uint64_t a2)
{
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(MEMORY[0x24BEE23D0] - 8) + 16))(a2, a1);
  return a2;
}

uint64_t sub_23A8A5D98(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(MEMORY[0x24BEE23D0] - 8) + 8))();
  return a1;
}

void sub_23A8A5DFC()
{
  strcpy((char *)&qword_2542D8668, "EncoreBridge");
  unk_2542D8675 = 0;
  unk_2542D8676 = -5120;
}

uint64_t sub_23A8A5E28()
{
  uint64_t v0;

  v0 = sub_23A8A936C();
  __swift_allocate_value_buffer(v0, qword_2542D87E8);
  __swift_project_value_buffer(v0, (uint64_t)qword_2542D87E8);
  sub_23A8A5F28();
  if (qword_2542D8660 != -1)
    swift_once();
  swift_bridgeObjectRetain();
  sub_23A8A9570();
  return sub_23A8A9378();
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

unint64_t sub_23A8A5F28()
{
  unint64_t result;

  result = qword_2542D8738;
  if (!qword_2542D8738)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_2542D8738);
  }
  return result;
}

uint64_t sub_23A8A5F64(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(a2 + 16))(a2, a1);
}

unint64_t static SnippetService.DirectInvocationIdentifier.getter()
{
  return 0xD000000000000025;
}

unint64_t static SnippetService.EventDataKey.getter()
{
  return 0xD000000000000011;
}

uint64_t SnippetService.serviceName.getter@<X0>(_QWORD *a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;

  v2 = *(_QWORD *)(v1 + OBJC_IVAR____TtC16EncoreXPCService14SnippetService_serviceName + 8);
  *a1 = *(_QWORD *)(v1 + OBJC_IVAR____TtC16EncoreXPCService14SnippetService_serviceName);
  a1[1] = v2;
  return swift_bridgeObjectRetain();
}

char *sub_23A8A5FC8(uint64_t *a1, id *a2)
{
  char *v2;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  char *v8;
  char *v9;
  id v10;
  uint64_t v11;
  char *v12;
  id v13;
  char *v14;
  id *v15;
  void *v16;
  id v17;
  uint64_t v18;
  void *v19;
  const void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  id v24;
  void **v25;
  void *v26;
  id v27;
  void **v29;
  uint64_t aBlock;
  uint64_t v31;
  uint64_t (*v32)();
  void *v33;
  void (*v34)();
  uint64_t v35;
  objc_super v36;

  v4 = &v2[OBJC_IVAR____TtC16EncoreXPCService14SnippetService_eventHandler];
  *(_QWORD *)v4 = 0;
  *((_QWORD *)v4 + 1) = 0;
  *(_QWORD *)&v2[OBJC_IVAR____TtC16EncoreXPCService14SnippetService_encore] = 0;
  *(_QWORD *)&v2[OBJC_IVAR____TtC16EncoreXPCService14SnippetService_connection] = 0;
  v6 = *a1;
  v5 = a1[1];
  v7 = &v2[OBJC_IVAR____TtC16EncoreXPCService14SnippetService_serviceName];
  *(_QWORD *)v7 = *a1;
  *((_QWORD *)v7 + 1) = v5;
  v36.receiver = v2;
  v36.super_class = (Class)type metadata accessor for SnippetService();
  swift_bridgeObjectRetain();
  v8 = (char *)objc_msgSendSuper2(&v36, sel_init);
  v9 = v8;
  v10 = *a2;
  v11 = MEMORY[0x24BDAC760];
  if (*a2)
  {
    v12 = v8;
  }
  else
  {
    v13 = objc_allocWithZone(MEMORY[0x24BDD1988]);
    v14 = v9;
    v15 = a2;
    v16 = (void *)sub_23A8A93E4();
    v10 = objc_msgSend(v13, sel_initWithMachServiceName_options_, v16, 0);

    a2 = v15;
    *v15 = v10;
    if (!v10)
    {
LABEL_6:
      swift_bridgeObjectRelease();

      goto LABEL_7;
    }
  }
  v29 = a2;
  v17 = objc_msgSend((id)objc_opt_self(), sel_interfaceWithProtocol_, &unk_2569C8AB8);
  objc_msgSend(v10, sel_setRemoteObjectInterface_, v17);

  objc_msgSend(v10, sel_resume);
  v18 = swift_allocObject();
  *(_QWORD *)(v18 + 16) = v6;
  *(_QWORD *)(v18 + 24) = v5;
  v34 = sub_23A8A7DD4;
  v35 = v18;
  aBlock = v11;
  v31 = 1107296256;
  v32 = sub_23A8A1A9C;
  v33 = &block_descriptor_20;
  v19 = _Block_copy(&aBlock);
  swift_bridgeObjectRetain();
  swift_release();
  objc_msgSend(v10, sel_setInvalidationHandler_, v19);
  v20 = v19;
  a2 = v29;
  _Block_release(v20);
  v21 = *v29;
  if (!*v29)
    goto LABEL_6;
  v22 = swift_allocObject();
  *(_QWORD *)(v22 + 16) = v6;
  *(_QWORD *)(v22 + 24) = v5;
  v34 = sub_23A8A7DF4;
  v35 = v22;
  aBlock = v11;
  v31 = 1107296256;
  v32 = sub_23A8A1A9C;
  v33 = &block_descriptor_26_0;
  v23 = _Block_copy(&aBlock);
  swift_release();
  objc_msgSend(v21, sel_setInterruptionHandler_, v23);

  _Block_release(v23);
LABEL_7:
  v24 = *a2;
  v25 = (void **)&v9[OBJC_IVAR____TtC16EncoreXPCService14SnippetService_connection];
  swift_beginAccess();
  v26 = *v25;
  *v25 = v24;
  v27 = v24;

  return v9;
}

void sub_23A8A62B8(uint64_t a1, unint64_t a2, const char *a3)
{
  uint64_t v6;
  NSObject *v7;
  os_log_type_t v8;
  uint8_t *v9;
  uint64_t v10;
  uint64_t v11;

  if (qword_2542D86C0 != -1)
    swift_once();
  v6 = sub_23A8A936C();
  __swift_project_value_buffer(v6, (uint64_t)qword_2542D87E8);
  swift_bridgeObjectRetain_n();
  v7 = sub_23A8A9360();
  v8 = sub_23A8A9510();
  if (os_log_type_enabled(v7, v8))
  {
    v9 = (uint8_t *)swift_slowAlloc();
    v10 = swift_slowAlloc();
    v11 = v10;
    *(_DWORD *)v9 = 136315138;
    swift_bridgeObjectRetain();
    sub_23A89DE70(a1, a2, &v11);
    sub_23A8A9588();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_23A89B000, v7, v8, a3, v9, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x23B85A7AC](v10, -1, -1);
    MEMORY[0x23B85A7AC](v9, -1, -1);

  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
}

char *SnippetService.__allocating_init(serviceName:)(uint64_t *a1)
{
  uint64_t v1;
  id v2;
  char *v3;
  uint64_t v5[2];
  id v6;

  v1 = *a1;
  v5[1] = a1[1];
  v6 = 0;
  v5[0] = v1;
  v2 = objc_allocWithZone((Class)type metadata accessor for SnippetService());
  v3 = sub_23A8A5FC8(v5, &v6);

  return v3;
}

uint64_t type metadata accessor for SnippetService()
{
  uint64_t result;

  result = qword_2569C7418;
  if (!qword_2569C7418)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_23A8A64F0(uint64_t a1, uint64_t a2)
{
  void (*v3)(uint64_t);

  v3 = *(void (**)(uint64_t))(a1 + 32);
  swift_retain();
  v3(a2);
  return swift_release();
}

uint64_t sub_23A8A652C()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(v1 + 48) = v0;
  return swift_task_switch();
}

uint64_t sub_23A8A6544()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;

  v1 = *(_QWORD *)(v0 + 48) + OBJC_IVAR____TtC16EncoreXPCService14SnippetService_connection;
  swift_beginAccess();
  v2 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 56) = v2;
  *v2 = v0;
  v2[1] = sub_23A8A65C8;
  v3 = *(_QWORD *)(v0 + 48);
  v2[13] = v1;
  v2[14] = v3;
  return swift_task_switch();
}

uint64_t sub_23A8A65C8(char a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v4;

  v4 = *v2;
  *(_QWORD *)(v4 + 64) = v1;
  swift_task_dealloc();
  if (v1)
    return swift_task_switch();
  swift_endAccess();
  return (*(uint64_t (**)(_QWORD))(v4 + 8))(a1 & 1);
}

uint64_t sub_23A8A6650()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  id v3;
  id v4;
  NSObject *v5;
  os_log_type_t v6;
  _BOOL4 v7;
  void *v8;
  uint8_t *v9;
  _QWORD *v10;
  id v11;
  uint64_t v12;

  swift_endAccess();
  if (qword_2542D86C0 != -1)
    swift_once();
  v1 = *(void **)(v0 + 64);
  v2 = sub_23A8A936C();
  __swift_project_value_buffer(v2, (uint64_t)qword_2542D87E8);
  v3 = v1;
  v4 = v1;
  v5 = sub_23A8A9360();
  v6 = sub_23A8A9528();
  v7 = os_log_type_enabled(v5, v6);
  v8 = *(void **)(v0 + 64);
  if (v7)
  {
    v9 = (uint8_t *)swift_slowAlloc();
    v10 = (_QWORD *)swift_slowAlloc();
    *(_DWORD *)v9 = 138412290;
    v11 = v8;
    v12 = _swift_stdlib_bridgeErrorToNSError();
    *(_QWORD *)(v0 + 40) = v12;
    sub_23A8A9588();
    *v10 = v12;

    _os_log_impl(&dword_23A89B000, v5, v6, "SnippetService register failed %@", v9, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2569C7218);
    swift_arrayDestroy();
    MEMORY[0x23B85A7AC](v10, -1, -1);
    MEMORY[0x23B85A7AC](v9, -1, -1);

  }
  else
  {

  }
  return (*(uint64_t (**)(_QWORD))(v0 + 8))(0);
}

uint64_t sub_23A8A6828(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v2 + 104) = a1;
  *(_QWORD *)(v2 + 112) = v1;
  return swift_task_switch();
}

uint64_t sub_23A8A6840()
{
  _QWORD *v0;
  void **v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;
  int v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  _QWORD *v13;
  _QWORD *v14;

  v1 = (void **)v0[13];
  __swift_instantiateConcreteTypeFromMangledName(&qword_2569C7440);
  v2 = swift_allocBox();
  v4 = v3;
  v0[15] = v2;
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569C7448);
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 56))(v4, 1, 1, v5);
  v6 = *v1;
  if (*v1)
  {
    v0[2] = MEMORY[0x24BDAC760];
    v0[6] = sub_23A8A7C2C;
    v0[7] = v2;
    v0[3] = 1107296256;
    v0[4] = sub_23A8A6C54;
    v0[5] = &block_descriptor_0;
    v7 = _Block_copy(v0 + 2);
    swift_retain();
    swift_release();
    v8 = objc_msgSend(v6, sel_remoteObjectProxyWithErrorHandler_, v7);
    _Block_release(v7);
    sub_23A8A95A0();
    swift_unknownObjectRelease();
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2569C7450);
    v9 = swift_dynamicCast();
    v10 = v0[12];
    if (!v9)
      v10 = 0;
  }
  else
  {
    v10 = 0;
  }
  v11 = v0[14];
  *(_QWORD *)(v11 + OBJC_IVAR____TtC16EncoreXPCService14SnippetService_encore) = v10;
  swift_unknownObjectRelease();
  v12 = objc_msgSend((id)objc_opt_self(), sel_anonymousListener);
  v0[16] = v12;
  objc_msgSend(v12, sel_setDelegate_, v11);
  objc_msgSend(v12, sel_resume);
  v13 = (_QWORD *)swift_task_alloc();
  v0[17] = v13;
  v13[2] = v4;
  v13[3] = v11;
  v13[4] = v12;
  v14 = (_QWORD *)swift_task_alloc();
  v0[18] = v14;
  *v14 = v0;
  v14[1] = sub_23A8A6A88;
  return sub_23A8A969C();
}

uint64_t sub_23A8A6A88()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 152) = v0;
  swift_task_dealloc();
  if (!v0)
    swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_23A8A6AF4()
{
  uint64_t v0;

  swift_release();
  return (*(uint64_t (**)(_QWORD))(v0 + 8))(*(unsigned __int8 *)(v0 + 160));
}

uint64_t sub_23A8A6B34()
{
  uint64_t v0;

  swift_release();
  swift_task_dealloc();
  return (*(uint64_t (**)(_QWORD))(v0 + 8))(0);
}

uint64_t sub_23A8A6B80()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  _BYTE *v3;
  uint64_t v4;
  uint64_t result;
  _BYTE v6[8];

  v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569C7448);
  v1 = *(_QWORD *)(v0 - 8);
  MEMORY[0x24BDAC7A8](v0);
  v3 = &v6[-((v2 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v4 = swift_projectBox();
  swift_beginAccess();
  result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v1 + 48))(v4, 1, v0);
  if (!(_DWORD)result)
  {
    (*(void (**)(_BYTE *, uint64_t, uint64_t))(v1 + 16))(v3, v4, v0);
    v6[7] = 0;
    sub_23A8A9468();
    return (*(uint64_t (**)(_BYTE *, uint64_t))(v1 + 8))(v3, v0);
  }
  return result;
}

void sub_23A8A6C54(uint64_t a1, void *a2)
{
  void (*v3)(void);
  id v4;

  v3 = *(void (**)(void))(a1 + 32);
  swift_retain();
  v4 = a2;
  v3();
  swift_release();

}

void sub_23A8A6CA4(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  void (*v14)(char *, uint64_t, uint64_t);
  id v15;
  unint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  _QWORD aBlock[6];

  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569C7448);
  v9 = *(_QWORD *)(v8 - 8);
  v10 = *(_QWORD *)(v9 + 64);
  MEMORY[0x24BDAC7A8](v8);
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569C7440);
  MEMORY[0x24BDAC7A8](v11);
  v13 = (char *)&aBlock[-1] - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = *(void (**)(char *, uint64_t, uint64_t))(v9 + 16);
  v14(v13, a1, v8);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v9 + 56))(v13, 0, 1, v8);
  swift_beginAccess();
  sub_23A8A7C58((uint64_t)v13, a2);
  v15 = objc_msgSend(a4, sel_endpoint);
  v14((char *)&aBlock[-1] - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v8);
  v16 = (*(unsigned __int8 *)(v9 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80);
  v17 = swift_allocObject();
  (*(void (**)(unint64_t, char *, uint64_t))(v9 + 32))(v17 + v16, (char *)&aBlock[-1] - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0), v8);
  v18 = *(void **)(a3 + OBJC_IVAR____TtC16EncoreXPCService14SnippetService_encore);
  if (v18)
  {
    swift_unknownObjectRetain();
    v19 = (void *)sub_23A8A93E4();
    v20 = swift_allocObject();
    *(_QWORD *)(v20 + 16) = sub_23A8A7D04;
    *(_QWORD *)(v20 + 24) = v17;
    aBlock[4] = sub_23A8A7D90;
    aBlock[5] = v20;
    aBlock[0] = MEMORY[0x24BDAC760];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_23A8A64F0;
    aBlock[3] = &block_descriptor_14;
    v21 = _Block_copy(aBlock);
    swift_retain();
    swift_release();
    objc_msgSend(v18, sel_registerWithClient_name_with_, v15, v19, v21);
    _Block_release(v21);
    swift_release();

    swift_unknownObjectRelease();
  }
  else
  {
    __break(1u);
  }
}

uint64_t sub_23A8A6F08()
{
  return sub_23A8A7898();
}

uint64_t sub_23A8A6F6C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v6;
  NSObject *v7;
  os_log_type_t v8;
  uint8_t *v9;
  _QWORD *v10;
  uint64_t v11;

  v3 = v2;
  if (qword_2542D86C0 != -1)
    swift_once();
  v6 = sub_23A8A936C();
  __swift_project_value_buffer(v6, (uint64_t)qword_2542D87E8);
  v7 = sub_23A8A9360();
  v8 = sub_23A8A9510();
  if (os_log_type_enabled(v7, v8))
  {
    v9 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v9 = 0;
    _os_log_impl(&dword_23A89B000, v7, v8, "SnippetService: subscribe", v9, 2u);
    MEMORY[0x23B85A7AC](v9, -1, -1);
  }

  v10 = (_QWORD *)(v3 + OBJC_IVAR____TtC16EncoreXPCService14SnippetService_eventHandler);
  v11 = *(_QWORD *)(v3 + OBJC_IVAR____TtC16EncoreXPCService14SnippetService_eventHandler);
  *v10 = a1;
  v10[1] = a2;
  swift_retain();
  return sub_23A8A3CB8(v11);
}

uint64_t sub_23A8A70DC(void *a1)
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
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  id v15;
  NSObject *v16;
  os_log_type_t v17;
  uint64_t v18;
  uint8_t *v19;
  id v20;
  _QWORD *v21;
  uint8_t *v22;
  void (*v23)(id);
  uint64_t v24;
  uint64_t v25;
  id v26;
  uint64_t v27;
  uint64_t v29;
  _QWORD *v30;
  uint8_t *v31;
  char *v32;
  uint64_t v33;
  uint64_t v34;
  id v35;
  id v36;

  v2 = v1;
  v4 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2542D86F0);
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v29 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_2542D8700);
  MEMORY[0x24BDAC7A8](v8);
  v10 = (char *)&v29 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2569C7220);
  MEMORY[0x24BDAC7A8](v11);
  v13 = (char *)&v29 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_2542D86C0 != -1)
    swift_once();
  v14 = sub_23A8A936C();
  __swift_project_value_buffer(v14, (uint64_t)qword_2542D87E8);
  v15 = a1;
  v16 = sub_23A8A9360();
  v17 = sub_23A8A9510();
  if (os_log_type_enabled(v16, v17))
  {
    v33 = v2;
    v18 = swift_slowAlloc();
    v34 = v4;
    v19 = (uint8_t *)v18;
    v30 = (_QWORD *)swift_slowAlloc();
    v31 = v19;
    v32 = v7;
    *(_DWORD *)v19 = 138412290;
    v36 = v15;
    v20 = v15;
    v7 = v32;
    sub_23A8A9588();
    v21 = v30;
    *v30 = v15;

    v2 = v33;
    v22 = v31;
    _os_log_impl(&dword_23A89B000, v16, v17, "SnippetService: handleEvent%@", v31, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2569C7218);
    swift_arrayDestroy();
    MEMORY[0x23B85A7AC](v21, -1, -1);
    v4 = v34;
    MEMORY[0x23B85A7AC](v22, -1, -1);

  }
  else
  {

  }
  v23 = *(void (**)(id))(v2 + OBJC_IVAR____TtC16EncoreXPCService14SnippetService_eventHandler);
  if (v23)
  {
    swift_retain();
    v23(v15);
    sub_23A8A3CB8((uint64_t)v23);
  }
  v24 = v2 + OBJC_IVAR____TtC16EncoreXPCService12AsyncService_continuation;
  swift_beginAccess();
  sub_23A8A3CC8(v24, (uint64_t)v10);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v5 + 48))(v10, 1, v4))
  {
    sub_23A8A5C64((uint64_t)v10, &qword_2542D8700);
    v25 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2569C7230);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v25 - 8) + 56))(v13, 1, 1, v25);
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v5 + 16))(v7, v10, v4);
    sub_23A8A5C64((uint64_t)v10, &qword_2542D8700);
    v35 = v15;
    v26 = v15;
    sub_23A8A94A4();
    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
    v27 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2569C7230);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v27 - 8) + 56))(v13, 0, 1, v27);
  }
  return sub_23A8A5C64((uint64_t)v13, (uint64_t *)&unk_2569C7220);
}

id sub_23A8A74E4(void *a1)
{
  return sub_23A8A7560(a1, "SnippetService: publish %@", (SEL *)&selRef_handleEventWithEvent_);
}

id sub_23A8A754C(void *a1)
{
  return sub_23A8A7560(a1, "SnippetService: echo %@", (SEL *)&selRef_echoWithEvent_);
}

id sub_23A8A7560(void *a1, char *a2, SEL *a3)
{
  uint64_t v3;
  uint64_t v6;
  uint64_t v8;
  id v9;
  NSObject *v10;
  os_log_type_t v11;
  uint8_t *v12;
  _QWORD *v13;
  uint64_t v14;
  id v15;
  id result;
  char *format;

  v6 = v3;
  if (qword_2542D86C0 != -1)
    swift_once();
  v8 = sub_23A8A936C();
  __swift_project_value_buffer(v8, (uint64_t)qword_2542D87E8);
  v9 = a1;
  v10 = sub_23A8A9360();
  v11 = sub_23A8A9510();
  if (os_log_type_enabled(v10, v11))
  {
    v12 = (uint8_t *)swift_slowAlloc();
    v13 = (_QWORD *)swift_slowAlloc();
    *(_DWORD *)v12 = 138412290;
    format = a2;
    v14 = v6;
    v15 = v9;
    sub_23A8A9588();
    *v13 = v9;

    v6 = v14;
    _os_log_impl(&dword_23A89B000, v10, v11, format, v12, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2569C7218);
    swift_arrayDestroy();
    MEMORY[0x23B85A7AC](v13, -1, -1);
    MEMORY[0x23B85A7AC](v12, -1, -1);

  }
  else
  {

  }
  result = *(id *)(v6 + OBJC_IVAR____TtC16EncoreXPCService14SnippetService_encore);
  if (result)
    return objc_msgSend(result, *a3, v9);
  __break(1u);
  return result;
}

void sub_23A8A77B0()
{
  uint64_t v0;

  swift_bridgeObjectRelease();
  sub_23A8A3CB8(*(_QWORD *)(v0 + OBJC_IVAR____TtC16EncoreXPCService14SnippetService_eventHandler));
  swift_unknownObjectRelease();

}

id SnippetService.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for SnippetService();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_23A8A7898()
{
  uint64_t v0;
  uint64_t v1;
  id v2;
  void *v3;
  uint64_t result;

  objc_msgSend((id)objc_opt_self(), sel_interfaceWithProtocol_, &unk_2569C89C0);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2569C7430);
  v0 = swift_allocObject();
  *(_OWORD *)(v0 + 16) = xmmword_23A8A9E90;
  v1 = type metadata accessor for EncoreEvent();
  *(_QWORD *)(v0 + 56) = __swift_instantiateConcreteTypeFromMangledName(&qword_2569C7240);
  *(_QWORD *)(v0 + 32) = v1;
  v2 = objc_allocWithZone(MEMORY[0x24BDBCF20]);
  v3 = (void *)sub_23A8A9450();
  swift_bridgeObjectRelease();
  objc_msgSend(v2, sel_initWithArray_, v3);

  result = sub_23A8A9504();
  __break(1u);
  return result;
}

uint64_t sub_23A8A7A4C()
{
  return type metadata accessor for SnippetService();
}

uint64_t sub_23A8A7A54()
{
  return swift_updateClassMetadata2();
}

uint64_t method lookup function for SnippetService()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of SnippetService.register()()
{
  _QWORD *v0;
  uint64_t v1;
  int *v2;
  _QWORD *v3;
  uint64_t (*v5)(void);

  v2 = *(int **)((*MEMORY[0x24BEE4EA0] & *v0) + 0x118);
  v5 = (uint64_t (*)(void))((char *)v2 + *v2);
  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v3;
  *v3 = v1;
  v3[1] = sub_23A8A7B1C;
  return v5();
}

uint64_t sub_23A8A7B1C(uint64_t a1)
{
  uint64_t *v1;
  uint64_t v4;

  v4 = *v1;
  swift_task_dealloc();
  return (*(uint64_t (**)(uint64_t))(v4 + 8))(a1);
}

uint64_t dispatch thunk of SnippetService.listener(_:shouldAcceptNewConnection:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x128))();
}

uint64_t dispatch thunk of SnippetService.subscribe(completion:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x130))();
}

uint64_t dispatch thunk of SnippetService.handleEvent(event:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x138))();
}

uint64_t dispatch thunk of SnippetService.publish(event:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x140))();
}

uint64_t dispatch thunk of SnippetService.echo(event:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x148))();
}

uint64_t sub_23A8A7BF8()
{
  uint64_t v0;

  _Block_release(*(const void **)(v0 + 16));
  return swift_deallocObject();
}

uint64_t sub_23A8A7C1C()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)(v0 + 16) + 16))();
}

uint64_t sub_23A8A7C2C()
{
  return sub_23A8A6B80();
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

void sub_23A8A7C4C(uint64_t a1)
{
  uint64_t v1;

  sub_23A8A6CA4(a1, *(_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 24), *(void **)(v1 + 32));
}

uint64_t sub_23A8A7C58(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569C7440);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t sub_23A8A7CA0()
{
  uint64_t v0;
  uint64_t v1;

  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569C7448);
  (*(void (**)(unint64_t, uint64_t))(*(_QWORD *)(v1 - 8) + 8))(v0+ ((*(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80)), v1);
  return swift_deallocObject();
}

uint64_t sub_23A8A7D04()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_2569C7448);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2569C7448);
  return sub_23A8A9468();
}

uint64_t sub_23A8A7D6C()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_23A8A7D90()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 16))();
}

uint64_t sub_23A8A7DB0()
{
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

void sub_23A8A7DD4()
{
  uint64_t v0;

  sub_23A8A62B8(*(_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 24), "Snippet Connection Invalidation on Service %s");
}

void sub_23A8A7DF4()
{
  uint64_t v0;

  sub_23A8A62B8(*(_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 24), "Snippet Connection Interruption on Service %s");
}

void SynchronizableObject.publish(change:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t AssociatedTypeWitness;
  uint64_t *boxed_opaque_existential_1;
  uint64_t (*v12)(uint64_t, uint64_t);
  char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  uint64_t v20;
  char *v21;
  char *v22;
  void *v23;
  uint64_t v25[2];
  uint64_t v26[7];

  v6 = sub_23A8A9354();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8]();
  v9 = (char *)&v25[-1] - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v26[3] = AssociatedTypeWitness;
  v26[4] = swift_getAssociatedConformanceWitness();
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v26);
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(_QWORD *)(AssociatedTypeWitness - 8) + 16))(boxed_opaque_existential_1, a1, AssociatedTypeWitness);
  v12 = *(uint64_t (**)(uint64_t, uint64_t))(a3 + 64);
  v13 = (char *)v12(a2, a3);
  v15 = *(_QWORD *)&v13[OBJC_IVAR____TtC16EncoreXPCService14SnippetService_serviceName];
  v14 = *(_QWORD *)&v13[OBJC_IVAR____TtC16EncoreXPCService14SnippetService_serviceName + 8];
  swift_bridgeObjectRetain();

  v25[0] = v15;
  v25[1] = v14;
  sub_23A8A9348();
  v16 = sub_23A8A933C();
  v18 = v17;
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  v19 = objc_allocWithZone((Class)type metadata accessor for EncoreEvent());
  v20 = v26[6];
  v21 = EncoreEvent.init(value:serviceName:id:)(v26, v25, v16, v18);
  if (!v20)
  {
    v22 = v21;
    v23 = (void *)v12(a2, a3);
    sub_23A8A74E4(v22);

  }
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

uint64_t SynchronizableObject.registerAndListenForChanges(handler:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  NSObject *v14;
  os_log_type_t v15;
  uint8_t *v16;
  uint64_t v17;
  _QWORD *v18;
  uint64_t v19;
  uint64_t v21;

  v5 = v4;
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569C7460);
  MEMORY[0x24BDAC7A8](v10);
  v12 = (char *)&v21 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  if ((*(uint64_t (**)(uint64_t, uint64_t))(a4 + 40))(a3, a4))
  {
    if (qword_2542D86C0 != -1)
      swift_once();
    v13 = sub_23A8A936C();
    __swift_project_value_buffer(v13, (uint64_t)qword_2542D87E8);
    v14 = sub_23A8A9360();
    v15 = sub_23A8A951C();
    if (os_log_type_enabled(v14, v15))
    {
      v16 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v16 = 0;
      _os_log_impl(&dword_23A89B000, v14, v15, "#SynchronizableObject: Cancelling existing subscription before updating.", v16, 2u);
      MEMORY[0x23B85A7AC](v16, -1, -1);
    }

    __swift_instantiateConcreteTypeFromMangledName(&qword_2569C7478);
    sub_23A8A94E0();
    swift_release();
  }
  v17 = sub_23A8A9498();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v17 - 8) + 56))(v12, 1, 1, v17);
  v18 = (_QWORD *)swift_allocObject();
  v18[2] = 0;
  v18[3] = 0;
  v18[4] = a3;
  v18[5] = a4;
  v18[6] = v5;
  v18[7] = a1;
  v18[8] = a2;
  swift_unknownObjectRetain();
  swift_retain();
  v19 = sub_23A8A8ECC((uint64_t)v12, (uint64_t)&unk_2569C7470, (uint64_t)v18);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(a4 + 48))(v19, a3, a4);
}

uint64_t sub_23A8A8220(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  _QWORD *v8;
  uint64_t AssociatedTypeWitness;
  uint64_t v10;
  uint64_t v11;

  v8[15] = a7;
  v8[16] = a8;
  v8[13] = a5;
  v8[14] = a6;
  v8[12] = a4;
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v8[17] = AssociatedTypeWitness;
  v8[18] = *(_QWORD *)(AssociatedTypeWitness - 8);
  v8[19] = swift_task_alloc();
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_2542D8710);
  v8[20] = v10;
  v8[21] = *(_QWORD *)(v10 - 8);
  v8[22] = swift_task_alloc();
  v11 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2569C7480);
  v8[23] = v11;
  v8[24] = *(_QWORD *)(v11 - 8);
  v8[25] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_23A8A82F8()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t (*v3)(uint64_t, uint64_t);
  char *v4;
  char *v5;
  _QWORD *v6;

  v2 = v0[15];
  v1 = v0[16];
  v3 = *(uint64_t (**)(uint64_t, uint64_t))(v1 + 64);
  v0[26] = v3;
  v4 = (char *)v3(v2, v1);
  v5 = &v4[OBJC_IVAR____TtC16EncoreXPCService14SnippetService_serviceName];
  v0[27] = *(_QWORD *)&v4[OBJC_IVAR____TtC16EncoreXPCService14SnippetService_serviceName];
  v0[28] = *((_QWORD *)v5 + 1);
  swift_bridgeObjectRetain();

  v0[29] = v3(v2, v1);
  v6 = (_QWORD *)swift_task_alloc();
  v0[30] = v6;
  *v6 = v0;
  v6[1] = sub_23A8A83A8;
  return sub_23A8A652C();
}

uint64_t sub_23A8A83A8(char a1)
{
  uint64_t v1;
  void *v2;

  v2 = *(void **)(*(_QWORD *)v1 + 232);
  *(_BYTE *)(*(_QWORD *)v1 + 296) = a1;
  swift_task_dealloc();

  return swift_task_switch();
}

uint64_t sub_23A8A8408()
{
  uint64_t v0;
  uint64_t v1;
  NSObject *v2;
  os_log_type_t v3;
  _BOOL4 v4;
  unint64_t v5;
  uint64_t v6;
  uint8_t *v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  os_log_type_t v11;
  _BOOL4 v12;
  unint64_t v13;
  uint64_t v14;
  uint8_t *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  char *v21;
  _QWORD *v22;
  uint64_t v24;

  if (*(_BYTE *)(v0 + 296) == 1)
  {
    if (qword_2542D86C0 != -1)
      swift_once();
    v1 = sub_23A8A936C();
    *(_QWORD *)(v0 + 248) = __swift_project_value_buffer(v1, (uint64_t)qword_2542D87E8);
    swift_bridgeObjectRetain();
    v2 = sub_23A8A9360();
    v3 = sub_23A8A951C();
    v4 = os_log_type_enabled(v2, v3);
    v5 = *(_QWORD *)(v0 + 224);
    if (v4)
    {
      v6 = *(_QWORD *)(v0 + 216);
      v7 = (uint8_t *)swift_slowAlloc();
      v8 = swift_slowAlloc();
      v24 = v8;
      *(_DWORD *)v7 = 136446210;
      swift_bridgeObjectRetain();
      *(_QWORD *)(v0 + 88) = sub_23A89DE70(v6, v5, &v24);
      sub_23A8A9588();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_23A89B000, v2, v3, "#SynchronizableObject: Registered SceneHost: %{public}s", v7, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x23B85A7AC](v8, -1, -1);
      MEMORY[0x23B85A7AC](v7, -1, -1);
    }
    else
    {
      swift_bridgeObjectRelease_n();
    }

    v18 = *(_QWORD *)(v0 + 168);
    v17 = *(_QWORD *)(v0 + 176);
    v19 = *(_QWORD *)(v0 + 160);
    v20 = (char *)(*(uint64_t (**)(_QWORD, _QWORD))(v0 + 208))(*(_QWORD *)(v0 + 120), *(_QWORD *)(v0 + 128));
    v21 = &v20[OBJC_IVAR____TtC16EncoreXPCService12AsyncService_events];
    swift_beginAccess();
    (*(void (**)(uint64_t, char *, uint64_t))(v18 + 16))(v17, v21, v19);

    sub_23A8A94B0();
    (*(void (**)(uint64_t, uint64_t))(v18 + 8))(v17, v19);
    *(_QWORD *)(v0 + 256) = 0;
    v22 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 264) = v22;
    *v22 = v0;
    v22[1] = sub_23A8A8824;
    return sub_23A8A94BC();
  }
  else
  {
    if (qword_2542D86C0 != -1)
      swift_once();
    v9 = sub_23A8A936C();
    __swift_project_value_buffer(v9, (uint64_t)qword_2542D87E8);
    swift_bridgeObjectRetain();
    v10 = sub_23A8A9360();
    v11 = sub_23A8A9528();
    v12 = os_log_type_enabled(v10, v11);
    v13 = *(_QWORD *)(v0 + 224);
    if (v12)
    {
      v14 = *(_QWORD *)(v0 + 216);
      v15 = (uint8_t *)swift_slowAlloc();
      v16 = swift_slowAlloc();
      v24 = v16;
      *(_DWORD *)v15 = 136446210;
      swift_bridgeObjectRetain();
      *(_QWORD *)(v0 + 64) = sub_23A89DE70(v14, v13, &v24);
      sub_23A8A9588();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_23A89B000, v10, v11, "#SynchronizableObject: Failed to register SceneHost: %{public}s. Please check logs for SnippetService.", v15, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x23B85A7AC](v16, -1, -1);
      MEMORY[0x23B85A7AC](v15, -1, -1);
    }
    else
    {
      swift_bridgeObjectRelease_n();
    }

    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
}

uint64_t sub_23A8A8824()
{
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_23A8A8878()
{
  _QWORD *v0;
  char *v1;
  uint64_t (*v2)(uint64_t, uint64_t);
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  char v11;
  uint64_t (*v12)(void);
  _QWORD *v13;
  uint64_t v15;

  v1 = (char *)v0[9];
  v0[34] = v1;
  if (!v1)
  {
    (*(void (**)(_QWORD, _QWORD))(v0[24] + 8))(v0[25], v0[23]);
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    v12 = (uint64_t (*)(void))v0[1];
    return v12();
  }
  v2 = (uint64_t (*)(uint64_t, uint64_t))v0[26];
  v4 = v0[15];
  v3 = v0[16];
  v6 = *(_QWORD *)&v1[OBJC_IVAR___EncoreEvent_serviceName];
  v5 = *(_QWORD *)&v1[OBJC_IVAR___EncoreEvent_serviceName + 8];
  swift_bridgeObjectRetain();
  v7 = (char *)v2(v4, v3);
  v9 = *(_QWORD *)&v7[OBJC_IVAR____TtC16EncoreXPCService14SnippetService_serviceName];
  v8 = *(_QWORD *)&v7[OBJC_IVAR____TtC16EncoreXPCService14SnippetService_serviceName + 8];
  swift_bridgeObjectRetain();

  if (!v5)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    goto LABEL_11;
  }
  if (v6 == v9 && v5 == v8)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    goto LABEL_13;
  }
  v11 = sub_23A8A9690();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if ((v11 & 1) == 0)
  {
LABEL_11:

    v0[32] = v0[32];
    v13 = (_QWORD *)swift_task_alloc();
    v0[33] = v13;
    *v13 = v0;
    v13[1] = sub_23A8A8824;
    return sub_23A8A94BC();
  }
LABEL_13:
  v15 = v0[32];
  sub_23A8A94EC();
  if (v15)
  {
    (*(void (**)(_QWORD, _QWORD))(v0[24] + 8))(v0[25], v0[23]);

    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    v12 = (uint64_t (*)(void))v0[1];
    return v12();
  }
  swift_getAssociatedConformanceWitness();
  sub_23A89F948();
  v0[35] = 0;
  sub_23A8A9480();
  v0[36] = sub_23A8A9474();
  sub_23A8A945C();
  return swift_task_switch();
}

uint64_t sub_23A8A8CD4()
{
  uint64_t v0;
  uint64_t v1;
  void (*v2)(uint64_t);

  v1 = *(_QWORD *)(v0 + 152);
  v2 = *(void (**)(uint64_t))(v0 + 104);
  swift_release();
  v2(v1);
  return swift_task_switch();
}

uint64_t sub_23A8A8D28()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;

  v2 = *(_QWORD *)(v0 + 144);
  v1 = *(_QWORD *)(v0 + 152);
  v3 = *(_QWORD *)(v0 + 136);

  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  *(_QWORD *)(v0 + 256) = *(_QWORD *)(v0 + 280);
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 264) = v4;
  *v4 = v0;
  v4[1] = sub_23A8A8824;
  return sub_23A8A94BC();
}

uint64_t sub_23A8A8DBC()
{
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_23A8A8DF0(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;

  v4 = v1[4];
  v5 = v1[5];
  v6 = v1[2];
  v7 = v1[3];
  v8 = v1[6];
  v9 = v1[7];
  v10 = v1[8];
  v11 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v11;
  *v11 = v2;
  v11[1] = sub_23A8A8E84;
  return sub_23A8A8220(a1, v6, v7, v8, v9, v10, v4, v5);
}

uint64_t sub_23A8A8E84()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_23A8A8ECC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;

  v5 = sub_23A8A9498();
  v6 = *(_QWORD *)(v5 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v6 + 48))(a1, 1, v5) != 1)
  {
    sub_23A8A948C();
    (*(void (**)(uint64_t, uint64_t))(v6 + 8))(a1, v5);
    if (!*(_QWORD *)(a3 + 16))
      return swift_task_create();
    goto LABEL_3;
  }
  sub_23A8A9278(a1);
  if (*(_QWORD *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_23A8A945C();
    swift_unknownObjectRelease();
  }
  return swift_task_create();
}

Swift::Void __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> SynchronizableObject.publishViewDisappeared()()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  NSObject *v9;
  os_log_type_t v10;
  uint8_t *v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  uint64_t v20;
  char *v21;
  char *v22;
  void *v23;
  uint64_t v25[2];
  _QWORD v26[7];

  v2 = v1;
  v3 = v0;
  v4 = sub_23A8A9354();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v25[-1] - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_2542D86C0 != -1)
    swift_once();
  v8 = sub_23A8A936C();
  __swift_project_value_buffer(v8, (uint64_t)qword_2542D87E8);
  v9 = sub_23A8A9360();
  v10 = sub_23A8A951C();
  if (os_log_type_enabled(v9, v10))
  {
    v11 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v11 = 0;
    _os_log_impl(&dword_23A89B000, v9, v10, "#SynchronizableObject: Publishing that view will disappear and marking as cancelled", v11, 2u);
    MEMORY[0x23B85A7AC](v11, -1, -1);
  }

  if ((*(uint64_t (**)(uint64_t, uint64_t))(v2 + 40))(v3, v2))
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_2569C7478);
    sub_23A8A94E0();
    swift_release();
  }
  v26[3] = &type metadata for SystemEvents;
  v26[4] = sub_23A8A0B68();
  LOBYTE(v26[0]) = 0;
  v12 = *(uint64_t (**)(uint64_t, uint64_t))(v2 + 64);
  v13 = (char *)v12(v3, v2);
  v15 = *(_QWORD *)&v13[OBJC_IVAR____TtC16EncoreXPCService14SnippetService_serviceName];
  v14 = *(_QWORD *)&v13[OBJC_IVAR____TtC16EncoreXPCService14SnippetService_serviceName + 8];
  swift_bridgeObjectRetain();

  v25[0] = v15;
  v25[1] = v14;
  sub_23A8A9348();
  v16 = sub_23A8A933C();
  v18 = v17;
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  v19 = objc_allocWithZone((Class)type metadata accessor for EncoreEvent());
  v20 = v26[6];
  v21 = EncoreEvent.init(value:serviceName:id:)(v26, v25, v16, v18);
  if (!v20)
  {
    v22 = v21;
    v23 = (void *)v12(v3, v2);
    sub_23A8A74E4(v22);

  }
}

uint64_t dispatch thunk of SynchronizableObject.subscription.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 40))();
}

uint64_t dispatch thunk of SynchronizableObject.subscription.setter(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 48))();
}

uint64_t dispatch thunk of SynchronizableObject.subscription.modify(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 56))();
}

uint64_t dispatch thunk of SynchronizableObject.snippetService.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 64))();
}

uint64_t sub_23A8A9278(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569C7460);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_23A8A92B8()
{
  return MEMORY[0x24BDCB220]();
}

uint64_t sub_23A8A92C4()
{
  return MEMORY[0x24BDCB260]();
}

uint64_t sub_23A8A92D0()
{
  return MEMORY[0x24BDCB268]();
}

uint64_t sub_23A8A92DC()
{
  return MEMORY[0x24BDCB3B8]();
}

uint64_t sub_23A8A92E8()
{
  return MEMORY[0x24BDCB400]();
}

uint64_t sub_23A8A92F4()
{
  return MEMORY[0x24BDCB410]();
}

uint64_t sub_23A8A9300()
{
  return MEMORY[0x24BDCD2F8]();
}

uint64_t sub_23A8A930C()
{
  return MEMORY[0x24BDCDCA0]();
}

uint64_t sub_23A8A9318()
{
  return MEMORY[0x24BDCDCE0]();
}

uint64_t sub_23A8A9324()
{
  return MEMORY[0x24BDCE610]();
}

uint64_t sub_23A8A9330()
{
  return MEMORY[0x24BDCE900]();
}

uint64_t sub_23A8A933C()
{
  return MEMORY[0x24BDCE9B0]();
}

uint64_t sub_23A8A9348()
{
  return MEMORY[0x24BDCEA40]();
}

uint64_t sub_23A8A9354()
{
  return MEMORY[0x24BDCEA58]();
}

uint64_t sub_23A8A9360()
{
  return MEMORY[0x24BEE78A8]();
}

uint64_t sub_23A8A936C()
{
  return MEMORY[0x24BEE78D8]();
}

uint64_t sub_23A8A9378()
{
  return MEMORY[0x24BEE78E8]();
}

uint64_t sub_23A8A9384()
{
  return MEMORY[0x24BDB9C40]();
}

uint64_t sub_23A8A9390()
{
  return MEMORY[0x24BDB9D68]();
}

uint64_t sub_23A8A939C()
{
  return MEMORY[0x24BDB9D80]();
}

uint64_t sub_23A8A93A8()
{
  return MEMORY[0x24BEE5458]();
}

uint64_t sub_23A8A93B4()
{
  return MEMORY[0x24BEE54C8]();
}

uint64_t sub_23A8A93C0()
{
  return MEMORY[0x24BEE54E0]();
}

uint64_t sub_23A8A93CC()
{
  return MEMORY[0x24BEE5500]();
}

uint64_t sub_23A8A93D8()
{
  return MEMORY[0x24BEE0980]();
}

uint64_t sub_23A8A93E4()
{
  return MEMORY[0x24BDCF9E0]();
}

uint64_t sub_23A8A93F0()
{
  return MEMORY[0x24BDCFA28]();
}

uint64_t sub_23A8A93FC()
{
  return MEMORY[0x24BDCFA48]();
}

uint64_t sub_23A8A9408()
{
  return MEMORY[0x24BDCFAC8]();
}

uint64_t sub_23A8A9414()
{
  return MEMORY[0x24BDCFAF8]();
}

uint64_t sub_23A8A9420()
{
  return MEMORY[0x24BEE09F0]();
}

uint64_t sub_23A8A942C()
{
  return MEMORY[0x24BEE0B20]();
}

uint64_t sub_23A8A9438()
{
  return MEMORY[0x24BEE0BC0]();
}

uint64_t sub_23A8A9444()
{
  return MEMORY[0x24BEE0C10]();
}

uint64_t sub_23A8A9450()
{
  return MEMORY[0x24BDCFBA8]();
}

uint64_t sub_23A8A945C()
{
  return MEMORY[0x24BEE6800]();
}

uint64_t sub_23A8A9468()
{
  return MEMORY[0x24BEE6828]();
}

uint64_t sub_23A8A9474()
{
  return MEMORY[0x24BEE6920]();
}

uint64_t sub_23A8A9480()
{
  return MEMORY[0x24BEE6928]();
}

uint64_t sub_23A8A948C()
{
  return MEMORY[0x24BEE6988]();
}

uint64_t sub_23A8A9498()
{
  return MEMORY[0x24BEE6990]();
}

uint64_t sub_23A8A94A4()
{
  return MEMORY[0x24BEE6A30]();
}

uint64_t sub_23A8A94B0()
{
  return MEMORY[0x24BEE6A50]();
}

uint64_t sub_23A8A94BC()
{
  return MEMORY[0x24BEE6A58]();
}

uint64_t sub_23A8A94C8()
{
  return MEMORY[0x24BEE6A98]();
}

uint64_t sub_23A8A94D4()
{
  return MEMORY[0x24BEE6AA0]();
}

uint64_t sub_23A8A94E0()
{
  return MEMORY[0x24BEE6AD0]();
}

uint64_t sub_23A8A94EC()
{
  return MEMORY[0x24BEE6B20]();
}

uint64_t sub_23A8A94F8()
{
  return MEMORY[0x24BDCFCC0]();
}

uint64_t sub_23A8A9504()
{
  return MEMORY[0x24BDCFCC8]();
}

uint64_t sub_23A8A9510()
{
  return MEMORY[0x24BEE78F0]();
}

uint64_t sub_23A8A951C()
{
  return MEMORY[0x24BEE7908]();
}

uint64_t sub_23A8A9528()
{
  return MEMORY[0x24BEE7910]();
}

uint64_t sub_23A8A9534()
{
  return MEMORY[0x24BEE5688]();
}

uint64_t sub_23A8A9540()
{
  return MEMORY[0x24BEE5760]();
}

uint64_t sub_23A8A954C()
{
  return MEMORY[0x24BEE5790]();
}

uint64_t sub_23A8A9558()
{
  return MEMORY[0x24BEE57A0]();
}

uint64_t sub_23A8A9564()
{
  return MEMORY[0x24BDD0170]();
}

uint64_t sub_23A8A9570()
{
  return MEMORY[0x24BEE79A0]();
}

uint64_t sub_23A8A957C()
{
  return MEMORY[0x24BEE1C68]();
}

uint64_t sub_23A8A9588()
{
  return MEMORY[0x24BEE1F00]();
}

uint64_t sub_23A8A9594()
{
  return MEMORY[0x24BEE1F48]();
}

uint64_t sub_23A8A95A0()
{
  return MEMORY[0x24BEE20A8]();
}

uint64_t sub_23A8A95AC()
{
  return MEMORY[0x24BEE22C0]();
}

uint64_t sub_23A8A95B8()
{
  return MEMORY[0x24BEE22D0]();
}

uint64_t sub_23A8A95C4()
{
  return MEMORY[0x24BEE23A0]();
}

uint64_t sub_23A8A95D0()
{
  return MEMORY[0x24BEE23A8]();
}

uint64_t sub_23A8A95DC()
{
  return MEMORY[0x24BEE23E8]();
}

uint64_t sub_23A8A95E8()
{
  return MEMORY[0x24BEE2510]();
}

uint64_t sub_23A8A95F4()
{
  return MEMORY[0x24BEE2518]();
}

uint64_t sub_23A8A9600()
{
  return MEMORY[0x24BEE26E8]();
}

uint64_t sub_23A8A960C()
{
  return MEMORY[0x24BEE2710]();
}

uint64_t sub_23A8A9618()
{
  return MEMORY[0x24BEE2838]();
}

uint64_t sub_23A8A9624()
{
  return MEMORY[0x24BEE2F40]();
}

uint64_t sub_23A8A9630()
{
  return MEMORY[0x24BEE3080]();
}

uint64_t sub_23A8A963C()
{
  return MEMORY[0x24BEE3088]();
}

uint64_t sub_23A8A9648()
{
  return MEMORY[0x24BEE3098]();
}

uint64_t sub_23A8A9654()
{
  return MEMORY[0x24BEE30B0]();
}

uint64_t sub_23A8A9660()
{
  return MEMORY[0x24BEE32B8]();
}

uint64_t sub_23A8A966C()
{
  return MEMORY[0x24BEE32C0]();
}

uint64_t sub_23A8A9678()
{
  return MEMORY[0x24BEE33C8]();
}

uint64_t sub_23A8A9684()
{
  return MEMORY[0x24BEE3408]();
}

uint64_t sub_23A8A9690()
{
  return MEMORY[0x24BEE3A30]();
}

uint64_t sub_23A8A969C()
{
  return MEMORY[0x24BEE70E0]();
}

uint64_t sub_23A8A96A8()
{
  return MEMORY[0x24BEE3ED8]();
}

uint64_t sub_23A8A96B4()
{
  return MEMORY[0x24BDD0708]();
}

uint64_t sub_23A8A96C0()
{
  return MEMORY[0x24BEE42E0]();
}

uint64_t sub_23A8A96CC()
{
  return MEMORY[0x24BEE42F8]();
}

uint64_t sub_23A8A96D8()
{
  return MEMORY[0x24BEE4328]();
}

uint64_t sub_23A8A96E4()
{
  return MEMORY[0x24BEE4608]();
}

uint64_t sub_23A8A96F0()
{
  return MEMORY[0x24BEE4638]();
}

uint64_t sub_23A8A96FC()
{
  return MEMORY[0x24BEE4A08]();
}

uint64_t sub_23A8A9708()
{
  return MEMORY[0x24BEE4A10]();
}

uint64_t sub_23A8A9714()
{
  return MEMORY[0x24BEE4A98]();
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

uint64_t _swift_stdlib_bridgeErrorToNSError()
{
  return MEMORY[0x24BEE4B30]();
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x24BEE4B38]();
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

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDCFD0](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x24BEDCFE8]();
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

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B0](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B8](a1);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x24BEDD410](location, obj);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
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

uint64_t swift_allocateGenericValueMetadata()
{
  return MEMORY[0x24BEE4B80]();
}

uint64_t swift_arrayDestroy()
{
  return MEMORY[0x24BEE4B98]();
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

uint64_t swift_checkMetadataState()
{
  return MEMORY[0x24BEE4BE0]();
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

uint64_t swift_getDynamicType()
{
  return MEMORY[0x24BEE4D00]();
}

uint64_t swift_getEnumTagSinglePayloadGeneric()
{
  return MEMORY[0x24BEE4D10]();
}

uint64_t swift_getErrorValue()
{
  return MEMORY[0x24BEE4D18]();
}

uint64_t swift_getGenericMetadata()
{
  return MEMORY[0x24BEE4D80]();
}

uint64_t swift_getObjCClassMetadata()
{
  return MEMORY[0x24BEE4DB0]();
}

uint64_t swift_getObjectType()
{
  return MEMORY[0x24BEE4DB8]();
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

uint64_t swift_initStackObject()
{
  return MEMORY[0x24BEE4E48]();
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

uint64_t swift_modifyAtReferenceWritableKeyPath()
{
  return MEMORY[0x24BEE4EB8]();
}

uint64_t swift_once()
{
  return MEMORY[0x24BEE4EC8]();
}

uint64_t swift_projectBox()
{
  return MEMORY[0x24BEE4ED0]();
}

uint64_t swift_readAtKeyPath()
{
  return MEMORY[0x24BEE4ED8]();
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

uint64_t swift_unexpectedError()
{
  return MEMORY[0x24BEE4F68]();
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

uint64_t swift_updateClassMetadata2()
{
  return MEMORY[0x24BEE5008]();
}

uint64_t swift_willThrow()
{
  return MEMORY[0x24BEE5050]();
}

