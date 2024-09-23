AskToCore::ATURL::Parameter_optional __swiftcall ATURL.Parameter.init(rawValue:)(Swift::String rawValue)
{
  char *v1;
  char *v2;
  unint64_t v3;
  AskToCore::ATURL::Parameter_optional result;
  char v5;

  v2 = v1;
  v3 = sub_236B167BC();
  result.value = swift_bridgeObjectRelease();
  v5 = 3;
  if (v3 < 3)
    v5 = v3;
  *v2 = v5;
  return result;
}

uint64_t ATURL.Parameter.rawValue.getter()
{
  _BYTE *v0;
  unint64_t v1;

  v1 = 0xD00000000000001BLL;
  if (*v0 != 1)
    v1 = 0xD000000000000010;
  if (*v0)
    return v1;
  else
    return 0x7265566F546B7361;
}

uint64_t sub_236AF94E4(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return sub_236B13E0C(*a1, *a2);
}

uint64_t sub_236AF94F0()
{
  return sub_236B10830();
}

uint64_t sub_236AF94F8()
{
  sub_236B16588();
  return swift_bridgeObjectRelease();
}

uint64_t sub_236AF958C()
{
  return sub_236B10A3C();
}

AskToCore::ATURL::Parameter_optional sub_236AF9594(Swift::String *a1)
{
  return ATURL.Parameter.init(rawValue:)(*a1);
}

void sub_236AF95A0(uint64_t *a1@<X8>)
{
  _BYTE *v1;
  int v2;
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;
  BOOL v6;
  uint64_t v7;

  v2 = *v1;
  v3 = 0xEC0000006E6F6973;
  v4 = 0xD00000000000001BLL;
  v5 = 0x8000000236B18990;
  if (v2 != 1)
  {
    v4 = 0xD000000000000010;
    v5 = 0x8000000236B189B0;
  }
  v6 = v2 == 0;
  if (*v1)
    v7 = v4;
  else
    v7 = 0x7265566F546B7361;
  if (!v6)
    v3 = v5;
  *a1 = v7;
  a1[1] = v3;
}

void sub_236AF9618()
{
  __int128 *v0;
  _QWORD v1[5];
  _BYTE v2[40];

  sub_236AFD73C(v0, (uint64_t)v1);
  sub_236AFD73C(v0, (uint64_t)v2);
  __asm { BR              X10 }
}

uint64_t sub_236AF968C()
{
  uint64_t v1;

  sub_236B16738();
  sub_236B16594();
  sub_236B16594();
  sub_236B16594();
  sub_236B16594();
  swift_bridgeObjectRelease();
  return v1;
}

void sub_236AF98B4()
{
  __int128 *v0;
  _BYTE v1[40];

  sub_236AFD73C(v0, (uint64_t)v1);
  sub_236AF9618();
}

uint64_t ATURL.Parser.isValid(_:)()
{

  return 1;
}

uint64_t ATURL.Parser.parse<A>(_:from:)@<X0>(uint64_t a1@<X0>, void (*a2)(char *, unint64_t, uint64_t)@<X1>, void *a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  char *v21;
  int v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  unint64_t v34;
  void (*v35)(char *, unint64_t, uint64_t);
  uint64_t v36;
  uint64_t v37;
  unint64_t v38;
  unint64_t v39;
  char v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  unint64_t v47;
  unint64_t v48;
  unint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  void *v54;
  id v55;
  id v56;
  uint64_t v57;
  unint64_t v58;
  unint64_t v59;
  void *v60;
  uint64_t v61;
  id v62;
  void *v63;
  void *v64;
  uint64_t v65;
  id v66;
  uint64_t v67;
  char *v68;
  unint64_t v69;
  unint64_t v70;
  void *v71;
  char *v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  void *v76;
  uint64_t v77;
  void (*v78)(char *, unint64_t, uint64_t);
  uint64_t v79;
  uint64_t v80;
  id v81[2];

  v78 = a2;
  v73 = a5;
  v81[1] = *(id *)MEMORY[0x24BDAC8D0];
  v8 = sub_236B16384();
  v80 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v10 = (char *)&v67 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_25643ACC0);
  v12 = MEMORY[0x24BDAC7A8](v11);
  v79 = (uint64_t)&v67 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v12);
  v15 = (char *)&v67 - v14;
  v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_25643ACC8);
  v17 = MEMORY[0x24BDAC7A8](v16);
  v19 = (char *)&v67 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v17);
  v21 = (char *)&v67 - v20;
  v74 = a1;
  v75 = a4;
  sub_236AFA0FC((uint64_t)a3, (char *)v81);
  v22 = LOBYTE(v81[0]);
  if (LOBYTE(v81[0]) == 3)
  {
    v81[0] = a3;
    swift_getMetatypeMetadata();
    v23 = sub_236B1657C();
    v25 = v24;
    sub_236AFD0E8();
    swift_allocError();
    *(_QWORD *)v26 = v23;
    *(_QWORD *)(v26 + 8) = v25;
    *(_QWORD *)(v26 + 16) = 0;
    *(_QWORD *)(v26 + 24) = 0;
    *(_BYTE *)(v26 + 32) = 0;
    return swift_willThrow();
  }
  v71 = a3;
  v28 = 0xEC0000006E6F6973;
  sub_236B163A8();
  v72 = v21;
  sub_236AFD788((uint64_t)v21, (uint64_t)v19, &qword_25643ACC8);
  v29 = sub_236B163CC();
  v30 = *(_QWORD *)(v29 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v30 + 48))(v19, 1, v29) == 1)
  {
    sub_236AFD12C((uint64_t)v19, &qword_25643ACC8);
LABEL_23:
    v33 = v80;
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v80 + 56))(v15, 1, 1, v8);
    goto LABEL_28;
  }
  v31 = sub_236B16390();
  (*(void (**)(char *, uint64_t))(v30 + 8))(v19, v29);
  if (!v31)
    goto LABEL_23;
  v68 = v15;
  v32 = *(_QWORD *)(v31 + 16);
  v33 = v80;
  if (!v32)
  {
LABEL_22:
    v15 = v68;
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v33 + 56))(v68, 1, 1, v8);
    goto LABEL_27;
  }
  v34 = v31 + ((*(unsigned __int8 *)(v80 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v80 + 80));
  v35 = *(void (**)(char *, unint64_t, uint64_t))(v80 + 16);
  v77 = *(_QWORD *)(v80 + 72);
  v78 = v35;
  v67 = v31;
  swift_bridgeObjectRetain();
  v69 = 0x8000000236B189B0;
  v70 = 0x8000000236B18990;
  while (1)
  {
    v78(v10, v34, v8);
    v36 = sub_236B1636C();
    if (v22)
    {
      if (v22 == 1)
        v38 = 0xD00000000000001BLL;
      else
        v38 = 0xD000000000000010;
      if (v22 == 1)
        v39 = v70;
      else
        v39 = v69;
      if (v36 != v38)
        goto LABEL_19;
    }
    else
    {
      v39 = 0xEC0000006E6F6973;
      if (v36 != 0x7265566F546B7361)
        goto LABEL_19;
    }
    if (v37 == v39)
    {
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease_n();
      goto LABEL_26;
    }
LABEL_19:
    v40 = sub_236B168AC();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if ((v40 & 1) != 0)
      break;
    v33 = v80;
    (*(void (**)(char *, uint64_t))(v80 + 8))(v10, v8);
    v34 += v77;
    if (!--v32)
    {
      swift_bridgeObjectRelease();
      goto LABEL_22;
    }
  }
  swift_bridgeObjectRelease();
  v33 = v80;
LABEL_26:
  v15 = v68;
  (*(void (**)(char *, char *, uint64_t))(v33 + 32))(v68, v10, v8);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v33 + 56))(v15, 0, 1, v8);
LABEL_27:
  swift_bridgeObjectRelease();
LABEL_28:
  v41 = (uint64_t)v15;
  v42 = (uint64_t)v15;
  v43 = v79;
  sub_236AFD788(v42, v79, &qword_25643ACC0);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v33 + 48))(v43, 1, v8) == 1)
  {
    sub_236AFD12C(v43, &qword_25643ACC0);
    goto LABEL_32;
  }
  sub_236B16378();
  v45 = v44;
  (*(void (**)(uint64_t, uint64_t))(v33 + 8))(v43, v8);
  if (v45 && (v46 = sub_236B16420(), v48 = v47, swift_bridgeObjectRelease(), v48 >> 60 != 15))
  {
    v54 = (void *)sub_236B1642C();
    v81[0] = 0;
    v55 = objc_msgSend(v54, sel_decompressedDataUsingAlgorithm_error_, 3, v81);

    v56 = v81[0];
    if (!v55)
    {
      v63 = v56;
      v64 = (void *)sub_236B16408();

      swift_willThrow();
      sub_236AFD0E8();
      swift_allocError();
      *(_QWORD *)v65 = v64;
      *(_QWORD *)(v65 + 8) = 0;
      *(_QWORD *)(v65 + 16) = 0;
      *(_QWORD *)(v65 + 24) = 0;
      *(_BYTE *)(v65 + 32) = 3;
      v66 = v64;
      swift_willThrow();
      sub_236AFD168(v46, v48);

      goto LABEL_37;
    }
    v57 = sub_236B16444();
    v59 = v58;

    sub_236B16330();
    swift_allocObject();
    sub_236AFD1C0(v57, v59);
    sub_236B16324();
    v60 = v76;
    sub_236B16318();
    if (!v60)
    {
      sub_236AFD168(v46, v48);
      swift_release();
      sub_236AFD17C(v57, v59);
      sub_236AFD17C(v57, v59);
      goto LABEL_37;
    }
    swift_release();
    sub_236AFD17C(v57, v59);
    sub_236AFD0E8();
    swift_allocError();
    *(_QWORD *)v61 = v60;
    *(_QWORD *)(v61 + 8) = 0;
    *(_QWORD *)(v61 + 16) = 0;
    *(_QWORD *)(v61 + 24) = 0;
    *(_BYTE *)(v61 + 32) = 2;
    v62 = v60;
    swift_willThrow();
    sub_236AFD168(v46, v48);

    sub_236AFD17C(v57, v59);
    sub_236AFD12C(v41, &qword_25643ACC0);
    return sub_236AFD12C((uint64_t)v72, &qword_25643ACC8);
  }
  else
  {
LABEL_32:
    v49 = 0x7265566F546B7361;
    if (v22)
    {
      if (v22 == 1)
      {
        v49 = 0xD00000000000001BLL;
        v28 = 0x8000000236B18990;
      }
      else
      {
        v28 = 0x8000000236B189B0;
        v49 = 0xD000000000000010;
      }
    }
    v81[0] = v71;
    swift_getMetatypeMetadata();
    v50 = sub_236B1657C();
    v52 = v51;
    sub_236AFD0E8();
    swift_allocError();
    *(_QWORD *)v53 = v49;
    *(_QWORD *)(v53 + 8) = v28;
    *(_QWORD *)(v53 + 16) = v50;
    *(_QWORD *)(v53 + 24) = v52;
    *(_BYTE *)(v53 + 32) = 1;
    swift_willThrow();
LABEL_37:
    sub_236AFD12C(v41, &qword_25643ACC0);
    return sub_236AFD12C((uint64_t)v72, &qword_25643ACC8);
  }
}

void sub_236AFA0FC(uint64_t a1@<X1>, char *a2@<X8>)
{
  uint64_t v3;
  NSObject *v4;
  os_log_type_t v5;
  uint8_t *v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  char v10;
  uint64_t v11;

  if (type metadata accessor for ATPayload() == a1)
  {
    v10 = 2;
  }
  else
  {
    if (qword_25643AC78 != -1)
      swift_once();
    v3 = sub_236B164F8();
    __swift_project_value_buffer(v3, (uint64_t)qword_25643DF48);
    v4 = sub_236B164E0();
    v5 = sub_236B16690();
    if (os_log_type_enabled(v4, v5))
    {
      v6 = (uint8_t *)swift_slowAlloc();
      v7 = swift_slowAlloc();
      v11 = v7;
      *(_DWORD *)v6 = 136315138;
      swift_getMetatypeMetadata();
      v8 = sub_236B1657C();
      sub_236AFB308(v8, v9, &v11);
      sub_236B166FC();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_236AF7000, v4, v5, "Unknown ATURL.Parameter for type %s.", v6, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x23B7FC480](v7, -1, -1);
      MEMORY[0x23B7FC480](v6, -1, -1);
    }

    v10 = 3;
  }
  *a2 = v10;
}

unint64_t sub_236AFA2A8(uint64_t a1)
{
  _QWORD *v2;
  uint64_t v3;
  _QWORD *v4;
  unsigned __int8 v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t result;
  char v9;
  _QWORD *v10;
  uint64_t v11;
  BOOL v12;
  uint64_t v13;

  if (!*(_QWORD *)(a1 + 16))
  {
    v2 = (_QWORD *)MEMORY[0x24BEE4B00];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_25643AD78);
  v2 = (_QWORD *)sub_236B167A4();
  v3 = *(_QWORD *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  v4 = (_QWORD *)(a1 + 48);
  while (1)
  {
    v5 = *((_BYTE *)v4 - 16);
    v7 = *(v4 - 1);
    v6 = *v4;
    swift_bridgeObjectRetain();
    result = sub_236AFB948(v5);
    if ((v9 & 1) != 0)
      break;
    *(_QWORD *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    *(_BYTE *)(v2[6] + result) = v5;
    v10 = (_QWORD *)(v2[7] + 16 * result);
    *v10 = v7;
    v10[1] = v6;
    v11 = v2[2];
    v12 = __OFADD__(v11, 1);
    v13 = v11 + 1;
    if (v12)
      goto LABEL_11;
    v4 += 3;
    v2[2] = v13;
    if (!--v3)
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

unint64_t sub_236AFA3B4(uint64_t a1)
{
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t result;
  char v10;
  uint64_t *v11;
  uint64_t v12;
  BOOL v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  __int128 v17;

  if (!*(_QWORD *)(a1 + 16))
  {
    v3 = (_QWORD *)MEMORY[0x24BEE4B00];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_25643ACF0);
  v2 = sub_236B167A4();
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
    sub_236AFD788(v6, (uint64_t)&v15, &qword_25643ACF8);
    v7 = v15;
    v8 = v16;
    result = sub_236AFBA14(v15, v16);
    if ((v10 & 1) != 0)
      break;
    *(_QWORD *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    v11 = (uint64_t *)(v3[6] + 16 * result);
    *v11 = v7;
    v11[1] = v8;
    result = (unint64_t)sub_236AFD7CC(&v17, (_OWORD *)(v3[7] + 32 * result));
    v12 = v3[2];
    v13 = __OFADD__(v12, 1);
    v14 = v12 + 1;
    if (v13)
      goto LABEL_11;
    v3[2] = v14;
    v6 += 48;
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

unint64_t sub_236AFA4E8(uint64_t a1)
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t result;
  char v9;
  uint64_t *v10;
  uint64_t v11;
  BOOL v12;
  uint64_t v13;

  if (!*(_QWORD *)(a1 + 16))
  {
    v2 = (_QWORD *)MEMORY[0x24BEE4B00];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_25643AD60);
  v2 = (_QWORD *)sub_236B167A4();
  v3 = *(_QWORD *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  v4 = (uint64_t *)(a1 + 48);
  while (1)
  {
    v5 = *(v4 - 2);
    v6 = *(v4 - 1);
    v7 = *v4;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    result = sub_236AFBA14(v5, v6);
    if ((v9 & 1) != 0)
      break;
    *(_QWORD *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    v10 = (uint64_t *)(v2[6] + 16 * result);
    *v10 = v5;
    v10[1] = v6;
    *(_QWORD *)(v2[7] + 8 * result) = v7;
    v11 = v2[2];
    v12 = __OFADD__(v11, 1);
    v13 = v11 + 1;
    if (v12)
      goto LABEL_11;
    v4 += 3;
    v2[2] = v13;
    if (!--v3)
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

uint64_t sub_236AFA600(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t result;
  int64_t v13;
  unint64_t v14;
  int64_t v15;
  uint64_t v16;
  int64_t v17;
  char *v18;
  unint64_t v19;
  unint64_t v20;
  uint64_t v21;
  int64_t v22;
  unint64_t v23;
  unint64_t v24;
  char *v25;
  uint64_t v26;

  v2 = sub_236B16384();
  v3 = *(_QWORD *)(v2 - 8);
  v4 = MEMORY[0x24BDAC7A8](v2);
  v25 = (char *)&v21 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v21 - v6;
  v8 = *(_QWORD *)(a1 + 64);
  v21 = a1 + 64;
  v9 = 1 << *(_BYTE *)(a1 + 32);
  v10 = -1;
  if (v9 < 64)
    v10 = ~(-1 << v9);
  v11 = v10 & v8;
  v22 = (unint64_t)(v9 + 63) >> 6;
  v26 = a1;
  result = swift_bridgeObjectRetain();
  v13 = 0;
  v14 = MEMORY[0x24BEE4AF8];
  v23 = 0x8000000236B189B0;
  v24 = 0x8000000236B18990;
  if (!v11)
    goto LABEL_5;
LABEL_4:
  for (v11 &= v11 - 1; ; v11 = (v16 - 1) & v16)
  {
    swift_bridgeObjectRetain();
    sub_236B16360();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    v18 = v25;
    (*(void (**)(char *, char *, uint64_t))(v3 + 16))(v25, v7, v2);
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      v14 = sub_236AFB100(0, *(_QWORD *)(v14 + 16) + 1, 1, v14);
    v20 = *(_QWORD *)(v14 + 16);
    v19 = *(_QWORD *)(v14 + 24);
    if (v20 >= v19 >> 1)
      v14 = sub_236AFB100(v19 > 1, v20 + 1, 1, v14);
    *(_QWORD *)(v14 + 16) = v20 + 1;
    (*(void (**)(unint64_t, char *, uint64_t))(v3 + 32))(v14+ ((*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80))+ *(_QWORD *)(v3 + 72) * v20, v18, v2);
    result = (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v7, v2);
    if (v11)
      goto LABEL_4;
LABEL_5:
    v15 = v13 + 1;
    if (__OFADD__(v13, 1))
    {
      __break(1u);
      goto LABEL_27;
    }
    if (v15 >= v22)
      goto LABEL_25;
    v16 = *(_QWORD *)(v21 + 8 * v15);
    ++v13;
    if (!v16)
    {
      v13 = v15 + 1;
      if (v15 + 1 >= v22)
        goto LABEL_25;
      v16 = *(_QWORD *)(v21 + 8 * v13);
      if (!v16)
      {
        v13 = v15 + 2;
        if (v15 + 2 >= v22)
          goto LABEL_25;
        v16 = *(_QWORD *)(v21 + 8 * v13);
        if (!v16)
          break;
      }
    }
LABEL_18:
    ;
  }
  v17 = v15 + 3;
  if (v17 >= v22)
  {
LABEL_25:
    swift_release();
    return v14;
  }
  v16 = *(_QWORD *)(v21 + 8 * v17);
  if (v16)
  {
    v13 = v17;
    goto LABEL_18;
  }
  while (1)
  {
    v13 = v17 + 1;
    if (__OFADD__(v17, 1))
      break;
    if (v13 >= v22)
      goto LABEL_25;
    v16 = *(_QWORD *)(v21 + 8 * v13);
    ++v17;
    if (v16)
      goto LABEL_18;
  }
LABEL_27:
  __break(1u);
  return result;
}

uint64_t static ATURL.create(using:)@<X0>(char *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  NSObject *v21;
  os_log_type_t v22;
  _BOOL4 v23;
  uint8_t *v24;
  void *v25;
  uint64_t v26;
  unint64_t v27;
  unint64_t v28;
  NSObject *v29;
  os_log_type_t v30;
  uint8_t *v31;
  void *v32;
  uint64_t v33;
  unint64_t v34;
  unint64_t v35;
  void *v36;
  unint64_t v37;
  id v38;
  id v39;
  uint64_t v40;
  unint64_t v41;
  unint64_t v42;
  uint64_t v43;
  unint64_t v44;
  unint64_t v45;
  NSObject *v46;
  os_log_type_t v47;
  _BOOL4 v48;
  uint8_t *v49;
  void *v50;
  void *v51;
  uint64_t v52;
  char *v53;
  void *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  char isUniquelyReferenced_nonNull_native;
  id v59;
  uint64_t v60;
  uint64_t v61;
  char v62;
  uint64_t v63;
  char *v64;
  char v65;
  id v66;
  uint64_t v67;
  uint64_t v68;
  uint8_t *v69;
  char *v70;
  char *v71;
  uint64_t v72;
  char *v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  unint64_t v79;
  uint64_t v80;
  id v81[2];

  v81[1] = *(id *)MEMORY[0x24BDAC8D0];
  v5 = sub_236B163CC();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v67 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = sub_236B16570();
  MEMORY[0x24BDAC7A8](v9);
  v11 = (char *)&v67 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_236B16354();
  swift_allocObject();
  v12 = sub_236B16348();
  v81[0] = a1;
  type metadata accessor for ATPayload();
  sub_236AFD954(&qword_25643B4F0, (uint64_t)&protocol conformance descriptor for ATPayload);
  v13 = sub_236B1633C();
  if (v2)
    return swift_release();
  v16 = v13;
  v70 = v11;
  v71 = a1;
  v79 = v14;
  v72 = 0;
  v73 = v8;
  v75 = v5;
  if (qword_25643AC78 != -1)
    swift_once();
  v17 = sub_236B164F8();
  v18 = __swift_project_value_buffer(v17, (uint64_t)qword_25643DF48);
  v19 = v16;
  v20 = v79;
  sub_236AFD1C0(v16, v79);
  sub_236AFD1C0(v16, v20);
  v78 = v18;
  v21 = sub_236B164E0();
  v22 = sub_236B1669C();
  v23 = os_log_type_enabled(v21, v22);
  v76 = a2;
  v77 = v12;
  v74 = v6;
  if (v23)
  {
    v24 = (uint8_t *)swift_slowAlloc();
    v25 = (void *)swift_slowAlloc();
    v81[0] = v25;
    *(_DWORD *)v24 = 136315138;
    v69 = v24 + 4;
    sub_236AFD1C0(v19, v20);
    v26 = sub_236B16414();
    v28 = v27;
    sub_236AFD17C(v19, v20);
    v80 = sub_236AFB308(v26, v28, (uint64_t *)v81);
    sub_236B166FC();
    swift_bridgeObjectRelease();
    sub_236AFD17C(v19, v20);
    sub_236AFD17C(v19, v20);
    _os_log_impl(&dword_236AF7000, v21, v22, "Encoded payload data: %s", v24, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x23B7FC480](v25, -1, -1);
    MEMORY[0x23B7FC480](v24, -1, -1);
  }
  else
  {
    sub_236AFD17C(v19, v20);
    sub_236AFD17C(v19, v20);
  }

  sub_236AFD1C0(v19, v20);
  sub_236AFD1C0(v19, v20);
  v29 = sub_236B164E0();
  v30 = sub_236B1669C();
  if (os_log_type_enabled(v29, v30))
  {
    v31 = (uint8_t *)swift_slowAlloc();
    v32 = (void *)swift_slowAlloc();
    v81[0] = v32;
    *(_DWORD *)v31 = 136315138;
    sub_236B16564();
    v33 = sub_236B16558();
    if (v34)
    {
      v35 = v34;
    }
    else
    {
      v33 = 7104878;
      v35 = 0xE300000000000000;
    }
    v80 = sub_236AFB308(v33, v35, (uint64_t *)v81);
    sub_236B166FC();
    v20 = v79;
    swift_bridgeObjectRelease();
    sub_236AFD17C(v19, v20);
    sub_236AFD17C(v19, v20);
    _os_log_impl(&dword_236AF7000, v29, v30, "Encoded payload JSON: %s", v31, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x23B7FC480](v32, -1, -1);
    MEMORY[0x23B7FC480](v31, -1, -1);
  }
  else
  {
    sub_236AFD17C(v19, v20);
    sub_236AFD17C(v19, v20);
  }

  v36 = (void *)sub_236B1642C();
  v81[0] = 0;
  v37 = v20;
  v38 = objc_msgSend(v36, sel_compressedDataUsingAlgorithm_error_, 3, v81);

  v39 = v81[0];
  if (!v38)
  {
    v51 = v39;
    sub_236B16408();

    swift_willThrow();
    sub_236AFD17C(v19, v37);
    return swift_release();
  }
  v40 = sub_236B16444();
  v42 = v41;

  v69 = (uint8_t *)v42;
  v70 = (char *)v40;
  v43 = sub_236B16438();
  v45 = v44;
  swift_bridgeObjectRetain_n();
  v46 = sub_236B164E0();
  v47 = sub_236B1669C();
  v48 = os_log_type_enabled(v46, v47);
  v68 = v43;
  if (v48)
  {
    v49 = (uint8_t *)swift_slowAlloc();
    v50 = (void *)swift_slowAlloc();
    v81[0] = v50;
    *(_DWORD *)v49 = 136315138;
    swift_bridgeObjectRetain();
    v80 = sub_236AFB308(v43, v45, (uint64_t *)v81);
    sub_236B166FC();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_236AF7000, v46, v47, "Zipped and encoded payload data to base64: %s", v49, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x23B7FC480](v50, -1, -1);
    MEMORY[0x23B7FC480](v49, -1, -1);

  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  v52 = v74;
  v53 = v71;
  v54 = (void *)sub_236AFA2A8(MEMORY[0x24BEE4AF8]);
  LOWORD(v81[0]) = *(_WORD *)&v53[OBJC_IVAR____TtC9AskToCore9ATPayload_version];
  v55 = sub_236B16894();
  v57 = v56;
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  v81[0] = v54;
  sub_236AFC71C(v55, v57, 0, isUniquelyReferenced_nonNull_native);
  v59 = v81[0];
  swift_bridgeObjectRelease();
  v60 = *(_QWORD *)&v53[OBJC_IVAR____TtC9AskToCore9ATPayload_clientBundleIdentifier + 8];
  if (v60)
  {
    v61 = *(_QWORD *)&v53[OBJC_IVAR____TtC9AskToCore9ATPayload_clientBundleIdentifier];
    swift_bridgeObjectRetain();
    v62 = swift_isUniquelyReferenced_nonNull_native();
    v81[0] = v59;
    sub_236AFC71C(v61, v60, 1u, v62);
    v59 = v81[0];
    swift_bridgeObjectRelease();
  }
  v63 = v75;
  v64 = v73;
  v65 = swift_isUniquelyReferenced_nonNull_native();
  v81[0] = v59;
  sub_236AFC71C(v68, v45, 2u, v65);
  v66 = v81[0];
  swift_bridgeObjectRelease();
  sub_236B163C0();
  sub_236AFA600((uint64_t)v66);
  sub_236B1639C();
  sub_236B163B4();
  (*(void (**)(char *, uint64_t))(v52 + 8))(v64, v63);
  sub_236AFD17C(v19, v79);
  sub_236AFD17C((uint64_t)v70, (unint64_t)v69);
  swift_bridgeObjectRelease();
  return swift_release();
}

uint64_t sub_236AFB100(char a1, int64_t a2, char a3, unint64_t a4)
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
    v13 = (_QWORD *)MEMORY[0x24BEE4AF8];
    goto LABEL_19;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_25643AD70);
  v10 = *(_QWORD *)(sub_236B16384() - 8);
  v11 = *(_QWORD *)(v10 + 72);
  v12 = (*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  v13 = (_QWORD *)swift_allocObject();
  v14 = _swift_stdlib_malloc_size(v13);
  if (!v11 || (v14 - v12 == 0x8000000000000000 ? (v15 = v11 == -1) : (v15 = 0), v15))
  {
LABEL_29:
    result = sub_236B16774();
    __break(1u);
    return result;
  }
  v13[2] = v8;
  v13[3] = 2 * ((uint64_t)(v14 - v12) / v11);
LABEL_19:
  v16 = *(_QWORD *)(sub_236B16384() - 8);
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
    sub_236AFD83C(0, v8, v18, a4);
  }
  swift_bridgeObjectRelease();
  return (uint64_t)v13;
}

uint64_t sub_236AFB308(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12[3];
  uint64_t ObjectType;

  v6 = sub_236AFB3D8(v12, 0, 0, 1, a1, a2);
  v7 = v12[0];
  if (v6)
  {
    v8 = v6;
    ObjectType = swift_getObjectType();
    v12[0] = v8;
    v9 = *a3;
    if (*a3)
    {
      sub_236AFD7FC((uint64_t)v12, *a3);
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
      sub_236AFD7FC((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v12);
  return v7;
}

uint64_t sub_236AFB3D8(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_236B16708();
            result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    result = sub_236AFB590(a5, a6);
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
  v8 = sub_236B1675C();
  if (!v8)
  {
    sub_236B16774();
    __break(1u);
LABEL_17:
    result = sub_236B167B0();
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

uint64_t sub_236AFB590(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v2 = sub_236AFB624(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v2 = sub_236AFB7FC(0, *(_QWORD *)(v2 + 16) + 1, 1, (char *)v2);
  v4 = *(_QWORD *)(v2 + 16);
  v3 = *(_QWORD *)(v2 + 24);
  if (v4 >= v3 >> 1)
    v2 = sub_236AFB7FC(v3 > 1, v4 + 1, 1, (char *)v2);
  *(_QWORD *)(v2 + 16) = v4 + 1;
  *(_BYTE *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_236AFB624(uint64_t a1, unint64_t a2)
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
      v3 = sub_236AFB798(v2, 0);
      if (v2 < 0)
        break;
      v4 = v3;
      v5 = sub_236B16744();
      if ((v6 & 1) != 0)
        goto LABEL_14;
      if (v5 == v2)
        return (uint64_t)v4;
      sub_236B16774();
      __break(1u);
LABEL_10:
      v2 = sub_236B165A0();
      if (!v2)
        return MEMORY[0x24BEE4AF8];
    }
    sub_236B167B0();
    __break(1u);
LABEL_14:
    result = sub_236B16774();
    __break(1u);
  }
  else
  {
    return MEMORY[0x24BEE4AF8];
  }
  return result;
}

_QWORD *sub_236AFB798(uint64_t a1, uint64_t a2)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_25643AD68);
  v4 = (_QWORD *)swift_allocObject();
  v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_236AFB7FC(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_25643AD68);
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
  result = sub_236B167B0();
  __break(1u);
  return result;
}

unint64_t sub_236AFB948(unsigned __int8 a1)
{
  uint64_t v2;

  sub_236B16918();
  sub_236B16588();
  swift_bridgeObjectRelease();
  v2 = sub_236B16960();
  return sub_236AFBA78(a1, v2);
}

unint64_t sub_236AFBA14(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  sub_236B16918();
  sub_236B16588();
  v4 = sub_236B16960();
  return sub_236AFBC38(a1, a2, v4);
}

unint64_t sub_236AFBA78(unsigned __int8 a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  int v9;
  unint64_t v10;
  unint64_t v11;
  char v12;

  v3 = -1 << *(_BYTE *)(v2 + 32);
  v4 = a2 & ~v3;
  if (((*(_QWORD *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFF8)) >> v4) & 1) != 0)
  {
    v6 = ~v3;
    while (1)
    {
      if (*(_BYTE *)(*(_QWORD *)(v2 + 48) + v4))
      {
        if (*(_BYTE *)(*(_QWORD *)(v2 + 48) + v4) == 1)
        {
          v7 = 0xD00000000000001BLL;
          v8 = 0x8000000236B18990;
          v9 = a1;
          if (!a1)
            goto LABEL_17;
        }
        else
        {
          v8 = 0x8000000236B189B0;
          v7 = 0xD000000000000010;
          v9 = a1;
          if (!a1)
          {
LABEL_17:
            v11 = 0xEC0000006E6F6973;
            if (v7 != 0x7265566F546B7361)
              goto LABEL_19;
            goto LABEL_18;
          }
        }
      }
      else
      {
        v7 = 0x7265566F546B7361;
        v8 = 0xEC0000006E6F6973;
        v9 = a1;
        if (!a1)
          goto LABEL_17;
      }
      if (v9 == 1)
        v10 = 0xD00000000000001BLL;
      else
        v10 = 0xD000000000000010;
      if (v9 == 1)
        v11 = 0x8000000236B18990;
      else
        v11 = 0x8000000236B189B0;
      if (v7 != v10)
        goto LABEL_19;
LABEL_18:
      if (v8 == v11)
      {
        swift_bridgeObjectRelease_n();
        return v4;
      }
LABEL_19:
      v12 = sub_236B168AC();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if ((v12 & 1) == 0)
      {
        v4 = (v4 + 1) & v6;
        if (((*(_QWORD *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFF8)) >> v4) & 1) != 0)
          continue;
      }
      return v4;
    }
  }
  return v4;
}

unint64_t sub_236AFBC38(uint64_t a1, uint64_t a2, uint64_t a3)
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
    if (!v11 && (sub_236B168AC() & 1) == 0)
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
      while (!v14 && (sub_236B168AC() & 1) == 0);
    }
  }
  return v6;
}

uint64_t sub_236AFBD18(uint64_t a1, char a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t result;
  int64_t v13;
  unint64_t v14;
  _QWORD *v15;
  unint64_t v16;
  unint64_t v17;
  int64_t v18;
  _QWORD *v19;
  unint64_t v20;
  int64_t v21;
  char v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;
  unint64_t v28;
  char v29;
  unint64_t v30;
  BOOL v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t *v34;
  int64_t v35;
  uint64_t v36;
  char v37;

  v3 = v2;
  v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25643AD78);
  v37 = a2;
  v6 = sub_236B16798();
  v7 = v6;
  if (!*(_QWORD *)(v5 + 16))
    goto LABEL_40;
  v34 = v2;
  v8 = 1 << *(_BYTE *)(v5 + 32);
  v36 = v5 + 64;
  if (v8 < 64)
    v9 = ~(-1 << v8);
  else
    v9 = -1;
  v10 = v9 & *(_QWORD *)(v5 + 64);
  v35 = (unint64_t)(v8 + 63) >> 6;
  v11 = v6 + 64;
  result = swift_retain();
  v13 = 0;
  while (1)
  {
    if (v10)
    {
      v16 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      v17 = v16 | (v13 << 6);
      goto LABEL_22;
    }
    v18 = v13 + 1;
    if (__OFADD__(v13, 1))
    {
LABEL_41:
      __break(1u);
LABEL_42:
      __break(1u);
      return result;
    }
    if (v18 >= v35)
      break;
    v19 = (_QWORD *)(v5 + 64);
    v20 = *(_QWORD *)(v36 + 8 * v18);
    ++v13;
    if (!v20)
    {
      v13 = v18 + 1;
      if (v18 + 1 >= v35)
        goto LABEL_33;
      v20 = *(_QWORD *)(v36 + 8 * v13);
      if (!v20)
      {
        v21 = v18 + 2;
        if (v21 >= v35)
        {
LABEL_33:
          swift_release();
          v3 = v34;
          if ((v37 & 1) == 0)
            goto LABEL_40;
          goto LABEL_36;
        }
        v20 = *(_QWORD *)(v36 + 8 * v21);
        if (!v20)
        {
          while (1)
          {
            v13 = v21 + 1;
            if (__OFADD__(v21, 1))
              goto LABEL_42;
            if (v13 >= v35)
              goto LABEL_33;
            v20 = *(_QWORD *)(v36 + 8 * v13);
            ++v21;
            if (v20)
              goto LABEL_21;
          }
        }
        v13 = v21;
      }
    }
LABEL_21:
    v10 = (v20 - 1) & v20;
    v17 = __clz(__rbit64(v20)) + (v13 << 6);
LABEL_22:
    v22 = *(_BYTE *)(*(_QWORD *)(v5 + 48) + v17);
    v23 = (uint64_t *)(*(_QWORD *)(v5 + 56) + 16 * v17);
    v24 = *v23;
    v25 = v23[1];
    if ((v37 & 1) == 0)
      swift_bridgeObjectRetain();
    sub_236B16918();
    sub_236B16588();
    swift_bridgeObjectRelease();
    result = sub_236B16960();
    v26 = -1 << *(_BYTE *)(v7 + 32);
    v27 = result & ~v26;
    v28 = v27 >> 6;
    if (((-1 << v27) & ~*(_QWORD *)(v11 + 8 * (v27 >> 6))) != 0)
    {
      v14 = __clz(__rbit64((-1 << v27) & ~*(_QWORD *)(v11 + 8 * (v27 >> 6)))) | v27 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v29 = 0;
      v30 = (unint64_t)(63 - v26) >> 6;
      do
      {
        if (++v28 == v30 && (v29 & 1) != 0)
        {
          __break(1u);
          goto LABEL_41;
        }
        v31 = v28 == v30;
        if (v28 == v30)
          v28 = 0;
        v29 |= v31;
        v32 = *(_QWORD *)(v11 + 8 * v28);
      }
      while (v32 == -1);
      v14 = __clz(__rbit64(~v32)) + (v28 << 6);
    }
    *(_QWORD *)(v11 + ((v14 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v14;
    *(_BYTE *)(*(_QWORD *)(v7 + 48) + v14) = v22;
    v15 = (_QWORD *)(*(_QWORD *)(v7 + 56) + 16 * v14);
    *v15 = v24;
    v15[1] = v25;
    ++*(_QWORD *)(v7 + 16);
  }
  swift_release();
  v3 = v34;
  v19 = (_QWORD *)(v5 + 64);
  if ((v37 & 1) == 0)
    goto LABEL_40;
LABEL_36:
  v33 = 1 << *(_BYTE *)(v5 + 32);
  if (v33 >= 64)
    bzero(v19, ((unint64_t)(v33 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  else
    *v19 = -1 << v33;
  *(_QWORD *)(v5 + 16) = 0;
LABEL_40:
  result = swift_release();
  *v3 = v7;
  return result;
}

uint64_t sub_236AFC094(uint64_t a1, char a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t result;
  int64_t v13;
  unint64_t v14;
  _QWORD *v15;
  unint64_t v16;
  unint64_t v17;
  int64_t v18;
  unint64_t v19;
  int64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t v23;
  _OWORD *v24;
  uint64_t v25;
  unint64_t v26;
  unint64_t v27;
  char v28;
  unint64_t v29;
  BOOL v30;
  uint64_t v31;
  uint64_t v32;
  int64_t v33;
  _QWORD *v34;
  _OWORD v35[2];

  v3 = v2;
  v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25643ACF0);
  v6 = sub_236B16798();
  v7 = v6;
  if (*(_QWORD *)(v5 + 16))
  {
    v8 = 1 << *(_BYTE *)(v5 + 32);
    v34 = (_QWORD *)(v5 + 64);
    if (v8 < 64)
      v9 = ~(-1 << v8);
    else
      v9 = -1;
    v10 = v9 & *(_QWORD *)(v5 + 64);
    v33 = (unint64_t)(v8 + 63) >> 6;
    v11 = v6 + 64;
    result = swift_retain();
    v13 = 0;
    while (1)
    {
      if (v10)
      {
        v16 = __clz(__rbit64(v10));
        v10 &= v10 - 1;
        v17 = v16 | (v13 << 6);
      }
      else
      {
        v18 = v13 + 1;
        if (__OFADD__(v13, 1))
        {
LABEL_40:
          __break(1u);
LABEL_41:
          __break(1u);
          return result;
        }
        if (v18 >= v33)
          goto LABEL_34;
        v19 = v34[v18];
        ++v13;
        if (!v19)
        {
          v13 = v18 + 1;
          if (v18 + 1 >= v33)
            goto LABEL_34;
          v19 = v34[v13];
          if (!v19)
          {
            v20 = v18 + 2;
            if (v20 >= v33)
            {
LABEL_34:
              swift_release();
              v3 = v2;
              if ((a2 & 1) != 0)
              {
                v32 = 1 << *(_BYTE *)(v5 + 32);
                if (v32 >= 64)
                  bzero(v34, ((unint64_t)(v32 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                else
                  *v34 = -1 << v32;
                *(_QWORD *)(v5 + 16) = 0;
              }
              break;
            }
            v19 = v34[v20];
            if (!v19)
            {
              while (1)
              {
                v13 = v20 + 1;
                if (__OFADD__(v20, 1))
                  goto LABEL_41;
                if (v13 >= v33)
                  goto LABEL_34;
                v19 = v34[v13];
                ++v20;
                if (v19)
                  goto LABEL_21;
              }
            }
            v13 = v20;
          }
        }
LABEL_21:
        v10 = (v19 - 1) & v19;
        v17 = __clz(__rbit64(v19)) + (v13 << 6);
      }
      v21 = (uint64_t *)(*(_QWORD *)(v5 + 48) + 16 * v17);
      v23 = *v21;
      v22 = v21[1];
      v24 = (_OWORD *)(*(_QWORD *)(v5 + 56) + 32 * v17);
      if ((a2 & 1) != 0)
      {
        sub_236AFD7CC(v24, v35);
      }
      else
      {
        sub_236AFD7FC((uint64_t)v24, (uint64_t)v35);
        swift_bridgeObjectRetain();
      }
      sub_236B16918();
      sub_236B16588();
      result = sub_236B16960();
      v25 = -1 << *(_BYTE *)(v7 + 32);
      v26 = result & ~v25;
      v27 = v26 >> 6;
      if (((-1 << v26) & ~*(_QWORD *)(v11 + 8 * (v26 >> 6))) != 0)
      {
        v14 = __clz(__rbit64((-1 << v26) & ~*(_QWORD *)(v11 + 8 * (v26 >> 6)))) | v26 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        v28 = 0;
        v29 = (unint64_t)(63 - v25) >> 6;
        do
        {
          if (++v27 == v29 && (v28 & 1) != 0)
          {
            __break(1u);
            goto LABEL_40;
          }
          v30 = v27 == v29;
          if (v27 == v29)
            v27 = 0;
          v28 |= v30;
          v31 = *(_QWORD *)(v11 + 8 * v27);
        }
        while (v31 == -1);
        v14 = __clz(__rbit64(~v31)) + (v27 << 6);
      }
      *(_QWORD *)(v11 + ((v14 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v14;
      v15 = (_QWORD *)(*(_QWORD *)(v7 + 48) + 16 * v14);
      *v15 = v23;
      v15[1] = v22;
      result = (uint64_t)sub_236AFD7CC(v35, (_OWORD *)(*(_QWORD *)(v7 + 56) + 32 * v14));
      ++*(_QWORD *)(v7 + 16);
    }
  }
  result = swift_release();
  *v3 = v7;
  return result;
}

void *sub_236AFC390()
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
  uint64_t *v16;
  uint64_t v17;
  uint64_t v18;
  _QWORD *v19;
  int64_t v20;
  unint64_t v21;
  int64_t v22;

  v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25643AD78);
  v2 = *v0;
  v3 = sub_236B1678C();
  v4 = v3;
  if (!*(_QWORD *)(v2 + 16))
  {
LABEL_26:
    result = (void *)swift_release();
    *v1 = v4;
    return result;
  }
  result = (void *)(v3 + 64);
  v6 = v2 + 64;
  v7 = (unint64_t)((1 << *(_BYTE *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 64 + 8 * v7)
    result = memmove(result, (const void *)(v2 + 64), 8 * v7);
  v9 = 0;
  *(_QWORD *)(v4 + 16) = *(_QWORD *)(v2 + 16);
  v10 = 1 << *(_BYTE *)(v2 + 32);
  v11 = -1;
  if (v10 < 64)
    v11 = ~(-1 << v10);
  v12 = v11 & *(_QWORD *)(v2 + 64);
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
    v16 = (uint64_t *)(*(_QWORD *)(v2 + 56) + 16 * v15);
    v18 = *v16;
    v17 = v16[1];
    *(_BYTE *)(*(_QWORD *)(v4 + 48) + v15) = *(_BYTE *)(*(_QWORD *)(v2 + 48) + v15);
    v19 = (_QWORD *)(*(_QWORD *)(v4 + 56) + 16 * v15);
    *v19 = v18;
    v19[1] = v17;
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

void *sub_236AFC538()
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
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  _QWORD *v21;
  int64_t v22;
  unint64_t v23;
  int64_t v24;
  uint64_t *v25;
  _OWORD v26[2];

  v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25643ACF0);
  v2 = *v0;
  v3 = sub_236B1678C();
  v4 = v3;
  if (!*(_QWORD *)(v2 + 16))
  {
    result = (void *)swift_release();
LABEL_28:
    *v1 = v4;
    return result;
  }
  v25 = v1;
  result = (void *)(v3 + 64);
  v6 = v2 + 64;
  v7 = (unint64_t)((1 << *(_BYTE *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 64 + 8 * v7)
    result = memmove(result, (const void *)(v2 + 64), 8 * v7);
  v9 = 0;
  *(_QWORD *)(v4 + 16) = *(_QWORD *)(v2 + 16);
  v10 = 1 << *(_BYTE *)(v2 + 32);
  v11 = -1;
  if (v10 < 64)
    v11 = ~(-1 << v10);
  v12 = v11 & *(_QWORD *)(v2 + 64);
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
    v22 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v22 >= v13)
      goto LABEL_26;
    v23 = *(_QWORD *)(v6 + 8 * v22);
    ++v9;
    if (!v23)
    {
      v9 = v22 + 1;
      if (v22 + 1 >= v13)
        goto LABEL_26;
      v23 = *(_QWORD *)(v6 + 8 * v9);
      if (!v23)
        break;
    }
LABEL_25:
    v12 = (v23 - 1) & v23;
    v15 = __clz(__rbit64(v23)) + (v9 << 6);
LABEL_12:
    v16 = 16 * v15;
    v17 = (uint64_t *)(*(_QWORD *)(v2 + 48) + 16 * v15);
    v19 = *v17;
    v18 = v17[1];
    v20 = 32 * v15;
    sub_236AFD7FC(*(_QWORD *)(v2 + 56) + 32 * v15, (uint64_t)v26);
    v21 = (_QWORD *)(*(_QWORD *)(v4 + 48) + v16);
    *v21 = v19;
    v21[1] = v18;
    sub_236AFD7CC(v26, (_OWORD *)(*(_QWORD *)(v4 + 56) + v20));
    result = (void *)swift_bridgeObjectRetain();
  }
  v24 = v22 + 2;
  if (v24 >= v13)
  {
LABEL_26:
    result = (void *)swift_release();
    v1 = v25;
    goto LABEL_28;
  }
  v23 = *(_QWORD *)(v6 + 8 * v24);
  if (v23)
  {
    v9 = v24;
    goto LABEL_25;
  }
  while (1)
  {
    v9 = v24 + 1;
    if (__OFADD__(v24, 1))
      break;
    if (v9 >= v13)
      goto LABEL_26;
    v23 = *(_QWORD *)(v6 + 8 * v9);
    ++v24;
    if (v23)
      goto LABEL_25;
  }
LABEL_30:
  __break(1u);
  return result;
}

uint64_t sub_236AFC71C(uint64_t a1, uint64_t a2, unsigned __int8 a3, char a4)
{
  _QWORD *v4;
  _QWORD *v5;
  uint64_t v10;
  char v11;
  unint64_t v12;
  uint64_t v13;
  _BOOL8 v14;
  uint64_t result;
  char v16;
  uint64_t v17;
  _QWORD *v18;
  _QWORD *v19;
  char v20;
  _QWORD *v21;
  uint64_t v22;
  BOOL v23;
  uint64_t v24;

  v5 = v4;
  v10 = *v4;
  v12 = sub_236AFB948(a3);
  v13 = *(_QWORD *)(v10 + 16);
  v14 = (v11 & 1) == 0;
  result = v13 + v14;
  if (__OFADD__(v13, v14))
  {
    __break(1u);
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  v16 = v11;
  v17 = *(_QWORD *)(v10 + 24);
  if (v17 >= result && (a4 & 1) != 0)
    goto LABEL_7;
  if (v17 >= result && (a4 & 1) == 0)
  {
    result = (uint64_t)sub_236AFC390();
LABEL_7:
    v18 = (_QWORD *)*v5;
    if ((v16 & 1) != 0)
    {
LABEL_8:
      v19 = (_QWORD *)(v18[7] + 16 * v12);
      result = swift_bridgeObjectRelease();
      *v19 = a1;
      v19[1] = a2;
      return result;
    }
LABEL_11:
    v18[(v12 >> 6) + 8] |= 1 << v12;
    *(_BYTE *)(v18[6] + v12) = a3;
    v21 = (_QWORD *)(v18[7] + 16 * v12);
    *v21 = a1;
    v21[1] = a2;
    v22 = v18[2];
    v23 = __OFADD__(v22, 1);
    v24 = v22 + 1;
    if (!v23)
    {
      v18[2] = v24;
      return result;
    }
    goto LABEL_14;
  }
  sub_236AFBD18(result, a4 & 1);
  result = sub_236AFB948(a3);
  if ((v16 & 1) == (v20 & 1))
  {
    v12 = result;
    v18 = (_QWORD *)*v5;
    if ((v16 & 1) != 0)
      goto LABEL_8;
    goto LABEL_11;
  }
LABEL_15:
  result = sub_236B168D0();
  __break(1u);
  return result;
}

_OWORD *sub_236AFC858(_OWORD *a1, uint64_t a2, uint64_t a3, char a4)
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
  _OWORD *v19;
  _OWORD *result;
  unint64_t v21;
  char v22;

  v5 = (_QWORD **)v4;
  v10 = (_QWORD *)*v4;
  v12 = sub_236AFBA14(a2, a3);
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
        v19 = (_OWORD *)(v18[7] + 32 * v12);
        __swift_destroy_boxed_opaque_existential_0((uint64_t)v19);
        return sub_236AFD7CC(a1, v19);
      }
      goto LABEL_11;
    }
    if (v17 >= v15 && (a4 & 1) == 0)
    {
      sub_236AFC538();
      goto LABEL_7;
    }
    sub_236AFC094(v15, a4 & 1);
    v21 = sub_236AFBA14(a2, a3);
    if ((v16 & 1) == (v22 & 1))
    {
      v12 = v21;
      v18 = *v5;
      if ((v16 & 1) != 0)
        goto LABEL_8;
LABEL_11:
      sub_236AFC988(v12, a2, a3, a1, v18);
      return (_OWORD *)swift_bridgeObjectRetain();
    }
  }
  result = (_OWORD *)sub_236B168D0();
  __break(1u);
  return result;
}

_OWORD *sub_236AFC988(unint64_t a1, uint64_t a2, uint64_t a3, _OWORD *a4, _QWORD *a5)
{
  _QWORD *v6;
  _OWORD *result;
  uint64_t v8;
  BOOL v9;
  uint64_t v10;

  a5[(a1 >> 6) + 8] |= 1 << a1;
  v6 = (_QWORD *)(a5[6] + 16 * a1);
  *v6 = a2;
  v6[1] = a3;
  result = sub_236AFD7CC(a4, (_OWORD *)(a5[7] + 32 * a1));
  v8 = a5[2];
  v9 = __OFADD__(v8, 1);
  v10 = v8 + 1;
  if (v9)
    __break(1u);
  else
    a5[2] = v10;
  return result;
}

id sub_236AFC9F0()
{
  void *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t v20;
  void (*v21)(char *, unint64_t, uint64_t);
  uint64_t v22;
  char v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  unint64_t v30;
  unint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  void *v37;
  id v38;
  id v39;
  uint64_t v40;
  uint64_t v41;
  unint64_t v42;
  unint64_t v43;
  uint64_t v44;
  id v45;
  void *v46;
  void *v47;
  uint64_t v48;
  id v49;
  uint64_t v50;
  void *v51;
  char *v52;
  char *v53;
  unint64_t v54;
  void *v55;
  uint64_t v56;
  uint64_t v57;
  id v58[2];

  v1 = v0;
  v58[1] = *(id *)MEMORY[0x24BDAC8D0];
  v2 = sub_236B16384();
  v57 = *(_QWORD *)(v2 - 8);
  ((void (*)(void))MEMORY[0x24BDAC7A8])();
  v4 = (char *)&v50 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_25643ACC0);
  v5 = ((uint64_t (*)(void))MEMORY[0x24BDAC7A8])();
  v56 = (uint64_t)&v50 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v50 - v7;
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_25643ACC8);
  v10 = MEMORY[0x24BDAC7A8](v9);
  v12 = (char *)&v50 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v10);
  v14 = (char *)&v50 - v13;
  v55 = (void *)type metadata accessor for ATPayload();
  sub_236B163A8();
  sub_236AFD788((uint64_t)v14, (uint64_t)v12, &qword_25643ACC8);
  v15 = sub_236B163CC();
  v16 = *(_QWORD *)(v15 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v16 + 48))(v12, 1, v15) == 1)
  {
    sub_236AFD12C((uint64_t)v12, &qword_25643ACC8);
LABEL_12:
    v24 = v57;
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v57 + 56))(v8, 1, 1, v2);
    goto LABEL_13;
  }
  v17 = sub_236B16390();
  (*(void (**)(char *, uint64_t))(v16 + 8))(v12, v15);
  if (!v17)
    goto LABEL_12;
  v18 = *(_QWORD *)(v17 + 16);
  if (v18)
  {
    v51 = v0;
    v52 = v14;
    v53 = v8;
    v19 = v17 + ((*(unsigned __int8 *)(v57 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v57 + 80));
    v20 = *(_QWORD *)(v57 + 72);
    v21 = *(void (**)(char *, unint64_t, uint64_t))(v57 + 16);
    v50 = v17;
    swift_bridgeObjectRetain();
    v54 = 0x8000000236B189B0;
    while (1)
    {
      v21(v4, v19, v2);
      if (sub_236B1636C() == 0xD000000000000010 && v22 == v54)
        break;
      v23 = sub_236B168AC();
      swift_bridgeObjectRelease();
      if ((v23 & 1) != 0)
        goto LABEL_23;
      (*(void (**)(char *, uint64_t))(v57 + 8))(v4, v2);
      v19 += v20;
      if (!--v18)
      {
        swift_bridgeObjectRelease();
        v14 = v52;
        v8 = v53;
        v1 = v51;
        goto LABEL_11;
      }
    }
    swift_bridgeObjectRelease();
LABEL_23:
    swift_bridgeObjectRelease();
    v24 = v57;
    v8 = v53;
    (*(void (**)(char *, char *, uint64_t))(v57 + 32))(v53, v4, v2);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v24 + 56))(v8, 0, 1, v2);
    swift_bridgeObjectRelease();
    v1 = v51;
    v14 = v52;
  }
  else
  {
LABEL_11:
    v24 = v57;
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v57 + 56))(v8, 1, 1, v2);
    swift_bridgeObjectRelease();
  }
LABEL_13:
  v25 = v56;
  sub_236AFD788((uint64_t)v8, v56, &qword_25643ACC0);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v24 + 48))(v25, 1, v2) == 1)
  {
    sub_236AFD12C(v25, &qword_25643ACC0);
LABEL_17:
    v58[0] = v55;
    __swift_instantiateConcreteTypeFromMangledName(&qword_25643AD80);
    v32 = sub_236B1657C();
    v34 = v33;
    sub_236AFD0E8();
    swift_allocError();
    *(_QWORD *)v35 = 0xD000000000000010;
    *(_QWORD *)(v35 + 8) = 0x8000000236B189B0;
    *(_QWORD *)(v35 + 16) = v32;
    *(_QWORD *)(v35 + 24) = v34;
    *(_BYTE *)(v35 + 32) = 1;
    swift_willThrow();
LABEL_18:
    sub_236AFD12C((uint64_t)v8, &qword_25643ACC0);
    return (id)sub_236AFD12C((uint64_t)v14, &qword_25643ACC8);
  }
  v26 = v1;
  sub_236B16378();
  v28 = v27;
  (*(void (**)(uint64_t, uint64_t))(v24 + 8))(v25, v2);
  if (!v28)
    goto LABEL_17;
  v29 = sub_236B16420();
  v31 = v30;
  swift_bridgeObjectRelease();
  if (v31 >> 60 == 15)
    goto LABEL_17;
  v37 = (void *)sub_236B1642C();
  v58[0] = 0;
  v38 = objc_msgSend(v37, sel_decompressedDataUsingAlgorithm_error_, 3, v58);

  v39 = v58[0];
  if (!v38)
  {
    v46 = v39;
    v47 = (void *)sub_236B16408();

    swift_willThrow();
    sub_236AFD0E8();
    swift_allocError();
    *(_QWORD *)v48 = v47;
    *(_QWORD *)(v48 + 8) = 0;
    *(_QWORD *)(v48 + 16) = 0;
    *(_QWORD *)(v48 + 24) = 0;
    *(_BYTE *)(v48 + 32) = 3;
    v49 = v47;
    swift_willThrow();
    sub_236AFD168(v29, v31);

    goto LABEL_18;
  }
  v40 = (uint64_t)v14;
  v41 = sub_236B16444();
  v43 = v42;

  sub_236B16330();
  swift_allocObject();
  sub_236AFD1C0(v41, v43);
  sub_236B16324();
  sub_236AFD954(&qword_25643AD88, (uint64_t)&protocol conformance descriptor for ATPayload);
  sub_236B16318();
  if (v26)
  {
    swift_release();
    sub_236AFD17C(v41, v43);
    sub_236AFD0E8();
    swift_allocError();
    *(_QWORD *)v44 = v26;
    *(_QWORD *)(v44 + 8) = 0;
    *(_QWORD *)(v44 + 16) = 0;
    *(_QWORD *)(v44 + 24) = 0;
    *(_BYTE *)(v44 + 32) = 2;
    v45 = v26;
    swift_willThrow();
    sub_236AFD168(v29, v31);

    sub_236AFD17C(v41, v43);
    v14 = (char *)v40;
    goto LABEL_18;
  }
  sub_236AFD168(v29, v31);
  swift_release();
  sub_236AFD17C(v41, v43);
  sub_236AFD17C(v41, v43);
  sub_236AFD12C((uint64_t)v8, &qword_25643ACC0);
  sub_236AFD12C(v40, &qword_25643ACC8);
  return v58[0];
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x23B7FC3E4]((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

unint64_t sub_236AFD0E8()
{
  unint64_t result;

  result = qword_25643ACD0;
  if (!qword_25643ACD0)
  {
    result = MEMORY[0x23B7FC3FC](&unk_236B17528, &type metadata for ATURL.Parser.Error);
    atomic_store(result, (unint64_t *)&qword_25643ACD0);
  }
  return result;
}

uint64_t sub_236AFD12C(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_236AFD168(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15)
    return sub_236AFD17C(a1, a2);
  return a1;
}

uint64_t sub_236AFD17C(uint64_t a1, unint64_t a2)
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

uint64_t sub_236AFD1C0(uint64_t a1, unint64_t a2)
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

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(_BYTE *)(*(_QWORD *)(a1 - 8) + 82) & 2) != 0)
    return *(_QWORD *)a2;
  return a2;
}

unint64_t sub_236AFD220()
{
  unint64_t result;

  result = qword_25643ACE0;
  if (!qword_25643ACE0)
  {
    result = MEMORY[0x23B7FC3FC](&protocol conformance descriptor for ATURL.Parameter, &type metadata for ATURL.Parameter);
    atomic_store(result, (unint64_t *)&qword_25643ACE0);
  }
  return result;
}

ValueMetadata *type metadata accessor for ATURL()
{
  return &type metadata for ATURL;
}

_BYTE *__swift_memcpy1_1(_BYTE *result, _BYTE *a2)
{
  *result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for ATURL.Parameter(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int v6;
  BOOL v7;
  int v8;

  if (!a2)
    return 0;
  if (a2 < 0xFE)
    goto LABEL_17;
  if (a2 + 2 >= 0xFFFF00)
    v2 = 4;
  else
    v2 = 2;
  if ((a2 + 2) >> 8 < 0xFF)
    v3 = 1;
  else
    v3 = v2;
  if (v3 == 4)
  {
    v4 = *(_DWORD *)(a1 + 1);
    if (v4)
      return (*a1 | (v4 << 8)) - 2;
  }
  else
  {
    if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
      return (*a1 | (v4 << 8)) - 2;
    }
    v4 = a1[1];
    if (a1[1])
      return (*a1 | (v4 << 8)) - 2;
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 3;
  v8 = v6 - 3;
  if (!v7)
    v8 = -1;
  return (v8 + 1);
}

uint64_t storeEnumTagSinglePayload for ATURL.Parameter(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 2 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 2) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xFE)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xFD)
    return ((uint64_t (*)(void))((char *)&loc_236AFD360 + 4 * byte_236B173D9[v4]))();
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)sub_236AFD394 + 4 * byte_236B173D4[v4]))();
}

uint64_t sub_236AFD394(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_236AFD39C(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x236AFD3A4);
  return result;
}

uint64_t sub_236AFD3B0(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x236AFD3B8);
  *(_BYTE *)result = a2 + 2;
  return result;
}

uint64_t sub_236AFD3BC(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_236AFD3C4(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_236AFD3D0(unsigned __int8 *a1)
{
  return *a1;
}

_BYTE *sub_236AFD3DC(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

ValueMetadata *type metadata accessor for ATURL.Parameter()
{
  return &type metadata for ATURL.Parameter;
}

ValueMetadata *type metadata accessor for ATURL.Parser()
{
  return &type metadata for ATURL.Parser;
}

void type metadata accessor for CGImage()
{
  unint64_t ForeignTypeMetadata;
  uint64_t v1;

  if (!qword_25643ACE8)
  {
    ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v1)
      atomic_store(ForeignTypeMetadata, (unint64_t *)&qword_25643ACE8);
  }
}

uint64_t initializeBufferWithCopyOfBuffer for ATURL.Parser.Error(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *a2;
  *a1 = *a2;
  v3 = v2 + 16;
  swift_retain();
  return v3;
}

id sub_236AFD488(id result, uint64_t a2, uint64_t a3, uint64_t a4, char a5)
{
  switch(a5)
  {
    case 0:
      goto LABEL_3;
    case 1:
      swift_bridgeObjectRetain();
LABEL_3:
      result = (id)swift_bridgeObjectRetain();
      break;
    case 2:
    case 3:
      result = result;
      break;
    default:
      return result;
  }
  return result;
}

void destroy for ATURL.Parser.Error(uint64_t a1)
{
  sub_236AFD4FC(*(void **)a1, *(_QWORD *)(a1 + 8), *(_QWORD *)(a1 + 16), *(_QWORD *)(a1 + 24), *(_BYTE *)(a1 + 32));
}

void sub_236AFD4FC(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5)
{
  switch(a5)
  {
    case 0:
      goto LABEL_3;
    case 1:
      swift_bridgeObjectRelease();
LABEL_3:
      swift_bridgeObjectRelease();
      break;
    case 2:
    case 3:

      break;
    default:
      return;
  }
}

uint64_t initializeWithCopy for ATURL.Parser.Error(uint64_t a1, uint64_t a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char v7;

  v3 = *(id *)a2;
  v4 = *(_QWORD *)(a2 + 8);
  v5 = *(_QWORD *)(a2 + 16);
  v6 = *(_QWORD *)(a2 + 24);
  v7 = *(_BYTE *)(a2 + 32);
  sub_236AFD488(*(id *)a2, v4, v5, v6, v7);
  *(_QWORD *)a1 = v3;
  *(_QWORD *)(a1 + 8) = v4;
  *(_QWORD *)(a1 + 16) = v5;
  *(_QWORD *)(a1 + 24) = v6;
  *(_BYTE *)(a1 + 32) = v7;
  return a1;
}

uint64_t assignWithCopy for ATURL.Parser.Error(uint64_t a1, uint64_t a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char v12;

  v3 = *(id *)a2;
  v4 = *(_QWORD *)(a2 + 8);
  v5 = *(_QWORD *)(a2 + 16);
  v6 = *(_QWORD *)(a2 + 24);
  v7 = *(_BYTE *)(a2 + 32);
  sub_236AFD488(*(id *)a2, v4, v5, v6, v7);
  v8 = *(void **)a1;
  v9 = *(_QWORD *)(a1 + 8);
  v10 = *(_QWORD *)(a1 + 16);
  v11 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)a1 = v3;
  *(_QWORD *)(a1 + 8) = v4;
  *(_QWORD *)(a1 + 16) = v5;
  *(_QWORD *)(a1 + 24) = v6;
  v12 = *(_BYTE *)(a1 + 32);
  *(_BYTE *)(a1 + 32) = v7;
  sub_236AFD4FC(v8, v9, v10, v11, v12);
  return a1;
}

__n128 __swift_memcpy33_8(uint64_t a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;

  result = *(__n128 *)a2;
  v3 = *(_OWORD *)(a2 + 16);
  *(_BYTE *)(a1 + 32) = *(_BYTE *)(a2 + 32);
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

uint64_t assignWithTake for ATURL.Parser.Error(uint64_t a1, uint64_t a2)
{
  char v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  char v9;

  v3 = *(_BYTE *)(a2 + 32);
  v4 = *(void **)a1;
  v6 = *(_QWORD *)(a1 + 8);
  v5 = *(_QWORD *)(a1 + 16);
  v7 = *(_QWORD *)(a1 + 24);
  v8 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v8;
  v9 = *(_BYTE *)(a1 + 32);
  *(_BYTE *)(a1 + 32) = v3;
  sub_236AFD4FC(v4, v6, v5, v7, v9);
  return a1;
}

uint64_t getEnumTagSinglePayload for ATURL.Parser.Error(uint64_t a1, unsigned int a2)
{
  unsigned int v3;
  int v4;

  if (!a2)
    return 0;
  if (a2 >= 0xFD && *(_BYTE *)(a1 + 33))
    return (*(_DWORD *)a1 + 253);
  v3 = *(unsigned __int8 *)(a1 + 32);
  if (v3 <= 3)
    v4 = -1;
  else
    v4 = v3 ^ 0xFF;
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for ATURL.Parser.Error(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFC)
  {
    *(_QWORD *)(result + 16) = 0;
    *(_QWORD *)(result + 24) = 0;
    *(_BYTE *)(result + 32) = 0;
    *(_QWORD *)result = a2 - 253;
    *(_QWORD *)(result + 8) = 0;
    if (a3 >= 0xFD)
      *(_BYTE *)(result + 33) = 1;
  }
  else
  {
    if (a3 >= 0xFD)
      *(_BYTE *)(result + 33) = 0;
    if (a2)
      *(_BYTE *)(result + 32) = -(char)a2;
  }
  return result;
}

uint64_t sub_236AFD718(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 32);
}

uint64_t sub_236AFD720(uint64_t result, char a2)
{
  *(_BYTE *)(result + 32) = a2;
  return result;
}

ValueMetadata *type metadata accessor for ATURL.Parser.Error()
{
  return &type metadata for ATURL.Parser.Error;
}

uint64_t sub_236AFD73C(__int128 *a1, uint64_t a2)
{
  __int128 v2;
  __int128 v3;

  v2 = *a1;
  v3 = a1[1];
  *(_BYTE *)(a2 + 32) = *((_BYTE *)a1 + 32);
  *(_OWORD *)a2 = v2;
  *(_OWORD *)(a2 + 16) = v3;
  return a2;
}

uint64_t sub_236AFD754(uint64_t a1)
{
  sub_236AFD4FC(*(void **)a1, *(_QWORD *)(a1 + 8), *(_QWORD *)(a1 + 16), *(_QWORD *)(a1 + 24), *(_BYTE *)(a1 + 32));
  return a1;
}

uint64_t sub_236AFD788(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

_OWORD *sub_236AFD7CC(_OWORD *a1, _OWORD *a2)
{
  __int128 v2;

  v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
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

uint64_t sub_236AFD7FC(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_236AFD83C(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
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
    v8 = *(_QWORD *)(sub_236B16384() - 8);
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
  result = sub_236B167B0();
  __break(1u);
  return result;
}

uint64_t sub_236AFD954(unint64_t *a1, uint64_t a2)
{
  uint64_t result;
  uint64_t v5;

  result = *a1;
  if (!result)
  {
    v5 = type metadata accessor for ATPayload();
    result = MEMORY[0x23B7FC3FC](a2, v5);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_236AFD994(uint64_t a1)
{
  return sub_236AFDAB4(a1, qword_25643DF30);
}

uint64_t sub_236AFD9B8(uint64_t a1)
{
  return sub_236AFDAB4(a1, qword_25643DF48);
}

uint64_t sub_236AFD9DC(uint64_t a1)
{
  return sub_236AFDAB4(a1, qword_25643DF60);
}

uint64_t sub_236AFDA00(uint64_t a1)
{
  return sub_236AFDAB4(a1, qword_25643DF78);
}

uint64_t sub_236AFDA28(uint64_t a1)
{
  return sub_236AFDAB4(a1, qword_25643DF90);
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

uint64_t sub_236AFDA94(uint64_t a1)
{
  return sub_236AFDAB4(a1, qword_25643DFA8);
}

uint64_t sub_236AFDAB4(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = sub_236B164F8();
  __swift_allocate_value_buffer(v3, a2);
  __swift_project_value_buffer(v3, (uint64_t)a2);
  return sub_236B164EC();
}

uint64_t PayloadImage.clientIconImageData.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)v0;
  sub_236AFDB60(*(_QWORD *)v0, *(_QWORD *)(v0 + 8));
  return v1;
}

uint64_t sub_236AFDB60(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15)
    return sub_236AFD1C0(a1, a2);
  return a1;
}

uint64_t PayloadImage.associatedContentIconImageData.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 16);
  sub_236AFD1C0(v1, *(_QWORD *)(v0 + 24));
  return v1;
}

uint64_t PayloadImage.cornerRadiusIncluded.getter()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + 32);
}

uint64_t PayloadImage.init(clientIconImageData:associatedContentIconImageData:cornerRadiusIncluded:)@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, char a5@<W4>, uint64_t a6@<X8>)
{
  *(_QWORD *)a6 = result;
  *(_QWORD *)(a6 + 8) = a2;
  *(_QWORD *)(a6 + 16) = a3;
  *(_QWORD *)(a6 + 24) = a4;
  *(_BYTE *)(a6 + 32) = a5;
  return result;
}

uint64_t destroy for PayloadImage(uint64_t *a1)
{
  unint64_t v2;

  v2 = a1[1];
  if (v2 >> 60 != 15)
    sub_236AFD17C(*a1, v2);
  return sub_236AFD17C(a1[2], a1[3]);
}

uint64_t initializeWithCopy for PayloadImage(uint64_t a1, uint64_t *a2)
{
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;

  v4 = a2[1];
  if (v4 >> 60 == 15)
  {
    *(_OWORD *)a1 = *(_OWORD *)a2;
  }
  else
  {
    v5 = *a2;
    sub_236AFD1C0(*a2, a2[1]);
    *(_QWORD *)a1 = v5;
    *(_QWORD *)(a1 + 8) = v4;
  }
  v6 = a2[2];
  v7 = a2[3];
  sub_236AFD1C0(v6, v7);
  *(_QWORD *)(a1 + 16) = v6;
  *(_QWORD *)(a1 + 24) = v7;
  *(_BYTE *)(a1 + 32) = *((_BYTE *)a2 + 32);
  return a1;
}

uint64_t assignWithCopy for PayloadImage(uint64_t a1, uint64_t a2)
{
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;

  v4 = *(_QWORD *)(a2 + 8);
  if (*(_QWORD *)(a1 + 8) >> 60 != 15)
  {
    if (v4 >> 60 != 15)
    {
      v6 = *(_QWORD *)a2;
      sub_236AFD1C0(*(_QWORD *)a2, *(_QWORD *)(a2 + 8));
      v7 = *(_QWORD *)a1;
      v8 = *(_QWORD *)(a1 + 8);
      *(_QWORD *)a1 = v6;
      *(_QWORD *)(a1 + 8) = v4;
      sub_236AFD17C(v7, v8);
      goto LABEL_8;
    }
    sub_236AFDD30(a1);
    goto LABEL_6;
  }
  if (v4 >> 60 == 15)
  {
LABEL_6:
    *(_OWORD *)a1 = *(_OWORD *)a2;
    goto LABEL_8;
  }
  v5 = *(_QWORD *)a2;
  sub_236AFD1C0(*(_QWORD *)a2, *(_QWORD *)(a2 + 8));
  *(_QWORD *)a1 = v5;
  *(_QWORD *)(a1 + 8) = v4;
LABEL_8:
  v9 = *(_QWORD *)(a2 + 16);
  v10 = *(_QWORD *)(a2 + 24);
  sub_236AFD1C0(v9, v10);
  v11 = *(_QWORD *)(a1 + 16);
  v12 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a1 + 16) = v9;
  *(_QWORD *)(a1 + 24) = v10;
  sub_236AFD17C(v11, v12);
  *(_BYTE *)(a1 + 32) = *(_BYTE *)(a2 + 32);
  return a1;
}

uint64_t sub_236AFDD30(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(MEMORY[0x24BDCDDE8] - 8) + 8))();
  return a1;
}

uint64_t assignWithTake for PayloadImage(uint64_t a1, uint64_t a2)
{
  unint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;

  v4 = *(_QWORD *)(a1 + 8);
  if (v4 >> 60 != 15)
  {
    v5 = *(_QWORD *)(a2 + 8);
    if (v5 >> 60 != 15)
    {
      v6 = *(_QWORD *)a1;
      *(_QWORD *)a1 = *(_QWORD *)a2;
      *(_QWORD *)(a1 + 8) = v5;
      sub_236AFD17C(v6, v4);
      goto LABEL_6;
    }
    sub_236AFDD30(a1);
  }
  *(_OWORD *)a1 = *(_OWORD *)a2;
LABEL_6:
  v7 = *(_QWORD *)(a1 + 16);
  v8 = *(_QWORD *)(a1 + 24);
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  sub_236AFD17C(v7, v8);
  *(_BYTE *)(a1 + 32) = *(_BYTE *)(a2 + 32);
  return a1;
}

uint64_t getEnumTagSinglePayload for PayloadImage(uint64_t a1, unsigned int a2)
{
  unsigned int v3;
  BOOL v4;
  int v5;

  if (!a2)
    return 0;
  if (a2 >= 0xFF && *(_BYTE *)(a1 + 33))
    return (*(_DWORD *)a1 + 255);
  v3 = *(unsigned __int8 *)(a1 + 32);
  v4 = v3 >= 2;
  v5 = (v3 + 2147483646) & 0x7FFFFFFF;
  if (!v4)
    v5 = -1;
  return (v5 + 1);
}

uint64_t storeEnumTagSinglePayload for PayloadImage(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFE)
  {
    *(_QWORD *)(result + 16) = 0;
    *(_QWORD *)(result + 24) = 0;
    *(_BYTE *)(result + 32) = 0;
    *(_QWORD *)result = a2 - 255;
    *(_QWORD *)(result + 8) = 0;
    if (a3 >= 0xFF)
      *(_BYTE *)(result + 33) = 1;
  }
  else
  {
    if (a3 >= 0xFF)
      *(_BYTE *)(result + 33) = 0;
    if (a2)
      *(_BYTE *)(result + 32) = a2 + 1;
  }
  return result;
}

ValueMetadata *type metadata accessor for PayloadImage()
{
  return &type metadata for PayloadImage;
}

id AskToExtension.configuration.getter@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X3>, _QWORD *a4@<X8>)
{
  uint64_t v4;
  id result;

  result = sub_236B16264(v4, a1, a2, a3);
  *a4 = result;
  return result;
}

uint64_t dispatch thunk of AskToExtension.messagesDataPayload(for:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 16))();
}

void sub_236AFDED8(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  type metadata accessor for _AskToExtensionConfiguration(255, *a1, a1[1], a4);
  JUMPOUT(0x23B7FC3FCLL);
}

uint64_t ATRecipientGroup.debugDescription.getter(unsigned __int16 a1)
{
  uint64_t result;

  if (a1 == 0xFFFF)
    return 0x6E6F2D6576696CLL;
  if (!a1)
    return 0xD000000000000019;
  result = sub_236B168C4();
  __break(1u);
  return result;
}

uint64_t ATRecipientGroup.isFamily.getter(unsigned __int16 a1)
{
  uint64_t result;

  if (a1 == 0xFFFF)
    return 0;
  if (!a1)
    return 1;
  result = sub_236B168C4();
  __break(1u);
  return result;
}

uint64_t ATRecipientGroup.init(rawValue:)(unsigned __int16 a1)
{
  int v1;
  int v2;

  v1 = a1;
  if (a1)
  {
    if (a1 == 0xFFFF)
      v1 = 0xFFFF;
    else
      v1 = 0;
    v2 = a1 != 0xFFFF;
  }
  else
  {
    v2 = 0;
  }
  return v1 | (v2 << 16);
}

BOOL sub_236AFE008(unsigned __int16 *a1, unsigned __int16 *a2)
{
  return *a1 == *a2;
}

unint64_t sub_236AFE020()
{
  unint64_t result;

  result = qword_25643AF10;
  if (!qword_25643AF10)
  {
    result = MEMORY[0x23B7FC3FC](&protocol conformance descriptor for ATRecipientGroup, &type metadata for ATRecipientGroup);
    atomic_store(result, (unint64_t *)&qword_25643AF10);
  }
  return result;
}

uint64_t sub_236AFE064()
{
  sub_236B16918();
  sub_236B1693C();
  return sub_236B16960();
}

uint64_t sub_236AFE0A8()
{
  return sub_236B1693C();
}

uint64_t sub_236AFE0D0()
{
  sub_236B16918();
  sub_236B1693C();
  return sub_236B16960();
}

_WORD *sub_236AFE110@<X0>(_WORD *result@<X0>, uint64_t a2@<X8>)
{
  int v2;
  __int16 v3;
  BOOL v4;
  BOOL v5;
  __int16 v6;

  v2 = (unsigned __int16)*result;
  if (v2 == 0xFFFF)
    v3 = -1;
  else
    v3 = 0;
  v4 = v2 != 0xFFFF;
  v5 = v2 == 0;
  if (*result)
    v6 = v3;
  else
    v6 = 0;
  if (v5)
    v4 = 0;
  *(_WORD *)a2 = v6;
  *(_BYTE *)(a2 + 2) = v4;
  return result;
}

void sub_236AFE140(_WORD *a1@<X8>)
{
  _WORD *v1;

  *a1 = *v1;
}

uint64_t sub_236AFE14C()
{
  sub_236AFE27C();
  return sub_236B165E8();
}

uint64_t sub_236AFE1A8()
{
  sub_236AFE27C();
  return sub_236B165D0();
}

uint64_t sub_236AFE1F4()
{
  _WORD *v0;
  uint64_t result;

  if ((unsigned __int16)*v0 == 0xFFFF)
    return 0x6E6F2D6576696CLL;
  if (!*v0)
    return 0xD000000000000019;
  result = sub_236B168C4();
  __break(1u);
  return result;
}

ValueMetadata *type metadata accessor for ATRecipientGroup()
{
  return &type metadata for ATRecipientGroup;
}

unint64_t sub_236AFE27C()
{
  unint64_t result;

  result = qword_25643AF18;
  if (!qword_25643AF18)
  {
    result = MEMORY[0x23B7FC3FC](&protocol conformance descriptor for ATRecipientGroup, &type metadata for ATRecipientGroup);
    atomic_store(result, (unint64_t *)&qword_25643AF18);
  }
  return result;
}

uint64_t static Metrics.ResponseJourney.log(clientBundleIdentifier:questionTopic:checkpoint:)(uint64_t a1, uint64_t a2, void *a3, unsigned __int16 a4)
{
  uint64_t v8;
  NSObject *v9;
  os_log_type_t v10;
  uint8_t *v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t inited;
  id v16;
  __int128 v18[2];
  uint64_t v19[6];

  if (qword_25643AC98 != -1)
    swift_once();
  v8 = sub_236B164F8();
  __swift_project_value_buffer(v8, (uint64_t)qword_25643DFA8);
  v9 = sub_236B164E0();
  v10 = sub_236B1669C();
  if (os_log_type_enabled(v9, v10))
  {
    v11 = (uint8_t *)swift_slowAlloc();
    v12 = swift_slowAlloc();
    v19[0] = v12;
    *(_DWORD *)v11 = 136446210;
    v13 = Metrics.ResponseJourney.Checkpoint.description.getter(a4);
    *(_QWORD *)&v18[0] = sub_236AFB308(v13, v14, v19);
    sub_236B166FC();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_236AF7000, v9, v10, "Logging response journey metric with checkpoint %{public}s", v11, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x23B7FC480](v12, -1, -1);
    MEMORY[0x23B7FC480](v11, -1, -1);
  }

  v19[3] = (uint64_t)&type metadata for Metrics.ResponseJourney.Checkpoint;
  v19[4] = sub_236B0007C();
  LOWORD(v19[0]) = a4;
  type metadata accessor for ResponseJourneyEvent();
  inited = swift_initStackObject();
  sub_236B000E0((uint64_t)v19, (uint64_t)v18);
  *(_WORD *)(inited + 32) = 1;
  *(_QWORD *)(inited + 16) = 0xD000000000000026;
  *(_QWORD *)(inited + 24) = 0x8000000236B19260;
  *(_QWORD *)(inited + 40) = a1;
  *(_QWORD *)(inited + 48) = a2;
  swift_bridgeObjectRetain();
  v16 = a3;
  swift_bridgeObjectRelease();
  *(_QWORD *)(inited + 56) = v16;
  sub_236B00124(v18, inited + 64);
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v19);
  swift_retain();
  sub_236AFFD04();
  swift_release();
  swift_setDeallocating();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return __swift_destroy_boxed_opaque_existential_0(inited + 64);
}

uint64_t static Metrics.RequestSend.log(requestIdentifier:clientBundleIdentifier:sentSuccessfully:errorDomain:errorIdentifier:rawRecipientGroup:)(uint64_t a1, uint64_t a2, uint64_t a3, char a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, __int16 a9)
{
  int *v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  _QWORD *v18;
  __int16 v19;
  uint64_t v20;
  NSObject *v21;
  os_log_type_t v22;
  uint8_t *v23;
  uint64_t v24;
  uint64_t v25;
  char v26;
  uint8_t *v27;
  uint8_t *v28;
  char *v29;
  uint64_t v30;
  _QWORD *v31;
  _QWORD *v32;
  _QWORD *v33;
  unint64_t v34;
  id v35;
  void *v36;
  void *v37;
  id v38;
  uint64_t v40;
  uint64_t v41;

  v13 = (int *)type metadata accessor for RequestSendEvent(0);
  v14 = MEMORY[0x24BDAC7A8](v13);
  v16 = (char *)&v40 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v14);
  v18 = (uint64_t *)((char *)&v40 - v17);
  if (qword_25643AC98 != -1)
    swift_once();
  v19 = a9;
  v20 = sub_236B164F8();
  __swift_project_value_buffer(v20, (uint64_t)qword_25643DFA8);
  v21 = sub_236B164E0();
  v22 = sub_236B1669C();
  if (os_log_type_enabled(v21, v22))
  {
    v23 = (uint8_t *)swift_slowAlloc();
    v41 = a3;
    v24 = a1;
    v25 = a2;
    v26 = a4;
    v27 = v23;
    *(_WORD *)v23 = 0;
    _os_log_impl(&dword_236AF7000, v21, v22, "Logging request send metric", v23, 2u);
    v28 = v27;
    a4 = v26;
    a2 = v25;
    a1 = v24;
    v19 = a9;
    a3 = v41;
    MEMORY[0x23B7FC480](v28, -1, -1);
  }

  v29 = (char *)v18 + v13[5];
  v30 = sub_236B164BC();
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v30 - 8) + 16))(v29, a1, v30);
  *v18 = 0xD000000000000022;
  v18[1] = 0x8000000236B19290;
  v31 = (_QWORD *)((char *)v18 + v13[6]);
  v32 = (_QWORD *)((char *)v18 + v13[8]);
  *v32 = 0;
  v32[1] = 0;
  v33 = (_QWORD *)((char *)v18 + v13[9]);
  *v33 = 0;
  v33[1] = 0;
  *v31 = a2;
  v31[1] = a3;
  *((_BYTE *)v18 + v13[7]) = a4 & 1;
  *(_WORD *)((char *)v18 + v13[10]) = v19;
  sub_236B00198((uint64_t)v18, (uint64_t)v16, type metadata accessor for RequestSendEvent);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v34 = sub_236AFF8F0();
  sub_236AFF30C(v34);
  swift_bridgeObjectRelease();
  v35 = objc_allocWithZone(MEMORY[0x24BDFC2A0]);
  v36 = (void *)sub_236B16540();
  swift_bridgeObjectRelease();
  v37 = (void *)sub_236B16504();
  swift_bridgeObjectRelease();
  v38 = objc_msgSend(v35, sel_initWithEventName_eventCategory_initData_, v36, 0, v37);

  if (qword_25643ACA8 != -1)
    swift_once();
  objc_msgSend((id)qword_25643AF28, sel_sendEvent_, v38);

  sub_236B001DC((uint64_t)v18, type metadata accessor for RequestSendEvent);
  return sub_236B001DC((uint64_t)v16, type metadata accessor for RequestSendEvent);
}

uint64_t static Metrics.ResponseSend.log(requestIdentifier:clientBundleIdentifier:sentSuccessfully:rawOriginalRecipientGroup:answerKind:responseCount:)(uint64_t a1, uint64_t a2, uint64_t a3, char a4, __int16 a5, __int16 a6, uint64_t a7)
{
  int *v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  _QWORD *v17;
  uint64_t v18;
  NSObject *v19;
  os_log_type_t v20;
  uint8_t *v21;
  char v22;
  __int16 v23;
  __int16 v24;
  uint64_t v25;
  uint8_t *v26;
  uint8_t *v27;
  char *v28;
  uint64_t v29;
  _QWORD *v30;
  unint64_t v31;
  id v32;
  void *v33;
  void *v34;
  id v35;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;

  v39 = a1;
  v40 = a2;
  v12 = (int *)type metadata accessor for ResponseSendEvent(0);
  v13 = MEMORY[0x24BDAC7A8](v12);
  v15 = (char *)&v37 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v13);
  v17 = (uint64_t *)((char *)&v37 - v16);
  if (qword_25643AC98 != -1)
    swift_once();
  v18 = sub_236B164F8();
  __swift_project_value_buffer(v18, (uint64_t)qword_25643DFA8);
  v19 = sub_236B164E0();
  v20 = sub_236B1669C();
  if (os_log_type_enabled(v19, v20))
  {
    v21 = (uint8_t *)swift_slowAlloc();
    v38 = a3;
    v22 = a4;
    v23 = a5;
    v24 = a6;
    v25 = a7;
    v26 = v21;
    *(_WORD *)v21 = 0;
    _os_log_impl(&dword_236AF7000, v19, v20, "Logging response send metric", v21, 2u);
    v27 = v26;
    a7 = v25;
    a6 = v24;
    a5 = v23;
    a4 = v22;
    a3 = v38;
    MEMORY[0x23B7FC480](v27, -1, -1);
  }

  v28 = (char *)v17 + v12[5];
  v29 = sub_236B164BC();
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v29 - 8) + 16))(v28, v39, v29);
  *v17 = 0xD000000000000023;
  v17[1] = 0x8000000236B192C0;
  v30 = (_QWORD *)((char *)v17 + v12[6]);
  *v30 = v40;
  v30[1] = a3;
  *((_BYTE *)v17 + v12[7]) = a4 & 1;
  *(_WORD *)((char *)v17 + v12[8]) = a5;
  *(_WORD *)((char *)v17 + v12[9]) = a6;
  *(_QWORD *)((char *)v17 + v12[10]) = a7;
  sub_236B00198((uint64_t)v17, (uint64_t)v15, type metadata accessor for ResponseSendEvent);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v31 = sub_236AFFB4C();
  sub_236AFF30C(v31);
  swift_bridgeObjectRelease();
  v32 = objc_allocWithZone(MEMORY[0x24BDFC2A0]);
  v33 = (void *)sub_236B16540();
  swift_bridgeObjectRelease();
  v34 = (void *)sub_236B16504();
  swift_bridgeObjectRelease();
  v35 = objc_msgSend(v32, sel_initWithEventName_eventCategory_initData_, v33, 0, v34);

  if (qword_25643ACA8 != -1)
    swift_once();
  objc_msgSend((id)qword_25643AF28, sel_sendEvent_, v35);

  sub_236B001DC((uint64_t)v17, type metadata accessor for ResponseSendEvent);
  return sub_236B001DC((uint64_t)v15, type metadata accessor for ResponseSendEvent);
}

uint64_t Metrics.RequestJourney.Checkpoint.description.getter(unsigned __int16 a1)
{
  unint64_t v1;
  uint64_t result;

  if (a1 <= 0x3E7u)
  {
    if (a1 <= 0x1F3u)
    {
      if (a1 <= 0xC7u)
      {
        if (!a1)
        {
          v1 = 0x6C616974696E69;
          goto LABEL_48;
        }
        if (a1 == 100)
        {
          v1 = 0xD000000000000022;
          goto LABEL_48;
        }
      }
      else
      {
        switch(a1)
        {
          case 0xC8u:
            v1 = 0xD000000000000020;
            goto LABEL_48;
          case 0x12Cu:
            v1 = 0xD000000000000016;
LABEL_48:
            sub_236B16894();
            sub_236B16594();
            swift_bridgeObjectRelease();
            sub_236B16594();
            swift_bridgeObjectRetain();
            sub_236B16594();
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            return v1;
          case 0x190u:
            v1 = 0xD00000000000001FLL;
            goto LABEL_48;
        }
      }
      goto LABEL_49;
    }
    if (a1 <= 0x2BBu)
    {
      if (a1 == 500)
      {
        v1 = 0xD000000000000020;
        goto LABEL_48;
      }
      if (a1 != 600)
        goto LABEL_49;
    }
    else if (a1 != 700)
    {
      if (a1 == 800)
      {
        v1 = 0xD000000000000018;
        goto LABEL_48;
      }
      if (a1 == 900)
      {
        v1 = 0xD00000000000001ALL;
        goto LABEL_48;
      }
      goto LABEL_49;
    }
LABEL_45:
    v1 = 0xD00000000000001ELL;
    goto LABEL_48;
  }
  if (a1 > 0x5DBu)
  {
    if (a1 <= 0x6A3u)
    {
      if (a1 == 1500)
      {
        v1 = 0xD00000000000001FLL;
        goto LABEL_48;
      }
      if (a1 == 1600)
      {
        v1 = 0xD00000000000002ALL;
        goto LABEL_48;
      }
    }
    else
    {
      switch(a1)
      {
        case 0x6A4u:
          v1 = 0xD000000000000020;
          goto LABEL_48;
        case 0x708u:
          v1 = 0xD00000000000001BLL;
          goto LABEL_48;
        case 0x76Cu:
          v1 = 0xD000000000000011;
          goto LABEL_48;
      }
    }
    goto LABEL_49;
  }
  if (a1 <= 0x4AFu)
  {
    if (a1 == 1000)
    {
      v1 = 0xD000000000000018;
      goto LABEL_48;
    }
    if (a1 == 1100)
    {
      v1 = 0xD00000000000001FLL;
      goto LABEL_48;
    }
    goto LABEL_49;
  }
  switch(a1)
  {
    case 0x4B0u:
      v1 = 0xD000000000000028;
      goto LABEL_48;
    case 0x514u:
      v1 = 0xD00000000000001BLL;
      goto LABEL_48;
    case 0x578u:
      goto LABEL_45;
  }
LABEL_49:
  result = sub_236B168C4();
  __break(1u);
  return result;
}

uint64_t Metrics.RequestJourney.Checkpoint.init(rawValue:)(uint64_t a1)
{
  return sub_236AFF200(a1, (uint64_t (*)(void))sub_236B00218);
}

uint64_t sub_236AFEF00@<X0>(unsigned __int16 *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t result;

  result = sub_236B00218(*a1);
  *(_WORD *)a2 = result;
  *(_BYTE *)(a2 + 2) = BYTE2(result) & 1;
  return result;
}

uint64_t sub_236AFEF30()
{
  unsigned __int16 *v0;

  return Metrics.RequestJourney.Checkpoint.description.getter(*v0);
}

uint64_t Metrics.ResponseJourney.Checkpoint.description.getter(unsigned __int16 a1)
{
  unint64_t v1;
  uint64_t result;

  if (a1 > 0x2BBu)
  {
    if (a1 <= 0x3E7u)
    {
      switch(a1)
      {
        case 0x2BCu:
          v1 = 0xD000000000000020;
          goto LABEL_34;
        case 0x320u:
          v1 = 0xD000000000000017;
          goto LABEL_34;
        case 0x384u:
          v1 = 0xD000000000000019;
          goto LABEL_34;
      }
    }
    else if (a1 > 0x4AFu)
    {
      if (a1 == 1200)
      {
        v1 = 0xD000000000000028;
        goto LABEL_34;
      }
      if (a1 == 1300)
      {
        v1 = 0xD000000000000019;
        goto LABEL_34;
      }
    }
    else
    {
      if (a1 == 1000)
      {
        v1 = 0xD000000000000013;
        goto LABEL_34;
      }
      if (a1 == 1100)
      {
        v1 = 0xD000000000000012;
        goto LABEL_34;
      }
    }
  }
  else if (a1 <= 0x12Bu)
  {
    switch(a1)
    {
      case 0u:
        v1 = 0x6C616974696E69;
        goto LABEL_34;
      case 0x64u:
        v1 = 0xD000000000000017;
        goto LABEL_34;
      case 0xC8u:
        goto LABEL_27;
    }
  }
  else if (a1 > 0x1F3u)
  {
    if (a1 == 500)
    {
      v1 = 0xD00000000000001BLL;
      goto LABEL_34;
    }
    if (a1 == 600)
    {
      v1 = 0xD000000000000027;
      goto LABEL_34;
    }
  }
  else
  {
    if (a1 == 300)
    {
      v1 = 0xD000000000000029;
LABEL_34:
      sub_236B16894();
      sub_236B16594();
      swift_bridgeObjectRelease();
      sub_236B16594();
      swift_bridgeObjectRetain();
      sub_236B16594();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      return v1;
    }
    if (a1 == 400)
    {
LABEL_27:
      v1 = 0xD000000000000016;
      goto LABEL_34;
    }
  }
  result = sub_236B168C4();
  __break(1u);
  return result;
}

uint64_t Metrics.ResponseJourney.Checkpoint.init(rawValue:)(uint64_t a1)
{
  return sub_236AFF200(a1, (uint64_t (*)(void))sub_236B0032C);
}

uint64_t sub_236AFF200(uint64_t a1, uint64_t (*a2)(void))
{
  return a2() & 0x1FFFF;
}

uint64_t sub_236AFF220@<X0>(unsigned __int16 *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t result;

  result = sub_236B0032C(*a1);
  *(_WORD *)a2 = result;
  *(_BYTE *)(a2 + 2) = BYTE2(result) & 1;
  return result;
}

uint64_t sub_236AFF250()
{
  unsigned __int16 *v0;

  return Metrics.ResponseJourney.Checkpoint.description.getter(*v0);
}

id sub_236AFF258()
{
  id result;

  result = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDFC2B0]), sel_init);
  qword_25643AF20 = (uint64_t)result;
  return result;
}

void sub_236AFF288()
{
  void *v0;
  id v1;
  id v2;
  id v3;

  if (qword_25643ACA0 != -1)
    swift_once();
  v0 = (void *)qword_25643AF20;
  v1 = objc_allocWithZone(MEMORY[0x24BDFC2A8]);
  v2 = v0;
  v3 = objc_msgSend(v1, sel_initWithTransport_, v2);

  qword_25643AF28 = (uint64_t)v3;
}

uint64_t sub_236AFF30C(uint64_t a1)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_25643B438);
    v2 = sub_236B167A4();
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
    sub_236AFD7FC(*(_QWORD *)(a1 + 56) + 32 * v12, (uint64_t)v40);
    *(_QWORD *)&v39 = v19;
    *((_QWORD *)&v39 + 1) = v18;
    v37[2] = v39;
    v38[0] = v40[0];
    v38[1] = v40[1];
    *(_QWORD *)&v37[0] = v19;
    *((_QWORD *)&v37[0] + 1) = v18;
    swift_bridgeObjectRetain();
    swift_dynamicCast();
    sub_236AFD7CC(v38, v32);
    v33 = v29;
    v34 = v30;
    v35 = v31;
    sub_236AFD7CC(v32, v36);
    v29 = v33;
    v30 = v34;
    v31 = v35;
    sub_236AFD7CC(v36, v37);
    sub_236AFD7CC(v37, &v33);
    result = sub_236B16720();
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
    result = (uint64_t)sub_236AFD7CC(&v33, (_OWORD *)(*(_QWORD *)(v2 + 56) + 32 * v9));
    ++*(_QWORD *)(v2 + 16);
  }
  v16 = v8 + 5;
  if (v8 + 5 >= v27)
  {
LABEL_37:
    swift_release();
    sub_236B0122C();
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

unint64_t sub_236AFF6D0()
{
  uint64_t v0;
  uint64_t inited;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  _QWORD *v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v16;

  __swift_instantiateConcreteTypeFromMangledName(&qword_25643B430);
  inited = swift_initStackObject();
  v2 = inited;
  *(_OWORD *)(inited + 16) = xmmword_236B17700;
  *(_QWORD *)(inited + 32) = 0xD000000000000013;
  *(_QWORD *)(inited + 40) = 0x8000000236B197E0;
  v3 = MEMORY[0x24BEE3F30];
  *(_WORD *)(inited + 48) = *(_WORD *)(v0 + 32);
  *(_QWORD *)(inited + 72) = v3;
  *(_QWORD *)(inited + 80) = 0xD000000000000016;
  *(_QWORD *)(inited + 88) = 0x8000000236B189D0;
  v4 = *(_QWORD *)(v0 + 40);
  v5 = *(_QWORD *)(v0 + 48);
  v6 = MEMORY[0x24BEE0D00];
  if (!v5)
    v4 = 0x6E776F6E6B6E55;
  v7 = 0xE700000000000000;
  if (v5)
    v7 = *(_QWORD *)(v0 + 48);
  *(_QWORD *)(inited + 96) = v4;
  *(_QWORD *)(inited + 104) = v7;
  *(_QWORD *)(inited + 120) = v6;
  strcpy((char *)(inited + 128), "questionTopic");
  *(_WORD *)(inited + 142) = -4864;
  v8 = (_QWORD *)(*(_QWORD *)(v0 + 56) + OBJC_IVAR___ATQuestionTopic_rawValue);
  v9 = v8[1];
  *(_QWORD *)(inited + 144) = *v8;
  *(_QWORD *)(inited + 152) = v9;
  *(_QWORD *)(inited + 168) = v6;
  strcpy((char *)(inited + 176), "checkpointV2");
  *(_BYTE *)(inited + 189) = 0;
  *(_WORD *)(inited + 190) = -5120;
  v10 = *(_QWORD *)(v0 + 88);
  v11 = __swift_project_boxed_opaque_existential_1((_QWORD *)(v0 + 64), v10);
  v12 = *(_QWORD *)(v10 - 8);
  MEMORY[0x24BDAC7A8](v11);
  v14 = (char *)&v16 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *))(v12 + 16))(v14);
  *(_QWORD *)(v2 + 216) = v3;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_236B165B8();
  (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v10);
  return sub_236AFA3B4(v2);
}

uint64_t sub_236AFF8B0()
{
  uint64_t v0;

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  __swift_destroy_boxed_opaque_existential_0(v0 + 64);
  return swift_deallocClassInstance();
}

unint64_t sub_236AFF8F0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t inited;
  int *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t *v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  __int16 v13;
  unint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t v17;
  char isUniquelyReferenced_nonNull_native;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;
  char v22;
  _OWORD v24[2];
  __int128 v25;
  uint64_t v26;

  v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25643B430);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_236B17700;
  *(_QWORD *)(inited + 32) = 0xD000000000000011;
  *(_QWORD *)(inited + 40) = 0x8000000236B198B0;
  v3 = (int *)type metadata accessor for RequestSendEvent(0);
  v4 = sub_236B16480();
  v5 = MEMORY[0x24BEE0D00];
  *(_QWORD *)(inited + 48) = v4;
  *(_QWORD *)(inited + 56) = v6;
  *(_QWORD *)(inited + 72) = v5;
  *(_QWORD *)(inited + 80) = 0xD000000000000016;
  *(_QWORD *)(inited + 88) = 0x8000000236B189D0;
  v7 = (uint64_t *)(v0 + v3[6]);
  v9 = *v7;
  v8 = v7[1];
  v10 = 0x6E776F6E6B6E55;
  if (v8)
    v10 = v9;
  v11 = 0xE700000000000000;
  if (v8)
    v11 = v8;
  *(_QWORD *)(inited + 96) = v10;
  *(_QWORD *)(inited + 104) = v11;
  *(_QWORD *)(inited + 120) = v5;
  *(_QWORD *)(inited + 128) = 0xD000000000000010;
  *(_QWORD *)(inited + 136) = 0x8000000236B198D0;
  v12 = MEMORY[0x24BEE1328];
  *(_BYTE *)(inited + 144) = *(_BYTE *)(v0 + v3[7]);
  *(_QWORD *)(inited + 168) = v12;
  strcpy((char *)(inited + 176), "recipientGroup");
  *(_BYTE *)(inited + 191) = -18;
  v13 = *(_WORD *)(v0 + v3[10]);
  *(_QWORD *)(inited + 216) = MEMORY[0x24BEE3F30];
  *(_WORD *)(inited + 192) = v13;
  swift_bridgeObjectRetain();
  v14 = sub_236AFA3B4(inited);
  v15 = (uint64_t *)(v1 + v3[8]);
  v16 = v15[1];
  if (v16)
  {
    v17 = *v15;
    v26 = v5;
    *(_QWORD *)&v25 = v17;
    *((_QWORD *)&v25 + 1) = v16;
    sub_236AFD7CC(&v25, v24);
    swift_bridgeObjectRetain();
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    sub_236AFC858(v24, 0x6D6F44726F727265, 0xEB000000006E6961, isUniquelyReferenced_nonNull_native);
    swift_bridgeObjectRelease();
  }
  v19 = (uint64_t *)(v1 + v3[9]);
  v20 = v19[1];
  if (v20)
  {
    v21 = *v19;
    v26 = v5;
    *(_QWORD *)&v25 = v21;
    *((_QWORD *)&v25 + 1) = v20;
    sub_236AFD7CC(&v25, v24);
    swift_bridgeObjectRetain();
    v22 = swift_isUniquelyReferenced_nonNull_native();
    sub_236AFC858(v24, 0x656449726F727265, 0xEF7265696669746ELL, v22);
    swift_bridgeObjectRelease();
  }
  return v14;
}

unint64_t sub_236AFFB4C()
{
  uint64_t v0;
  uint64_t inited;
  int *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t *v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  __swift_instantiateConcreteTypeFromMangledName(&qword_25643B430);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_236B17710;
  *(_QWORD *)(inited + 32) = 0xD000000000000011;
  *(_QWORD *)(inited + 40) = 0x8000000236B198B0;
  v2 = (int *)type metadata accessor for ResponseSendEvent(0);
  v3 = sub_236B16480();
  v4 = MEMORY[0x24BEE0D00];
  *(_QWORD *)(inited + 48) = v3;
  *(_QWORD *)(inited + 56) = v5;
  *(_QWORD *)(inited + 72) = v4;
  *(_QWORD *)(inited + 80) = 0xD000000000000016;
  *(_QWORD *)(inited + 88) = 0x8000000236B189D0;
  v6 = (uint64_t *)(v0 + v2[6]);
  v8 = *v6;
  v7 = v6[1];
  v9 = 0x6E776F6E6B6E55;
  if (v7)
    v9 = v8;
  v10 = 0xE700000000000000;
  if (v7)
    v10 = v7;
  *(_QWORD *)(inited + 96) = v9;
  *(_QWORD *)(inited + 104) = v10;
  *(_QWORD *)(inited + 120) = v4;
  *(_QWORD *)(inited + 128) = 0xD000000000000010;
  *(_QWORD *)(inited + 136) = 0x8000000236B198D0;
  v11 = MEMORY[0x24BEE1328];
  *(_BYTE *)(inited + 144) = *(_BYTE *)(v0 + v2[7]);
  *(_QWORD *)(inited + 168) = v11;
  *(_QWORD *)(inited + 176) = 0xD000000000000016;
  *(_QWORD *)(inited + 184) = 0x8000000236B198F0;
  v12 = MEMORY[0x24BEE3F30];
  *(_WORD *)(inited + 192) = *(_WORD *)(v0 + v2[8]);
  *(_QWORD *)(inited + 216) = v12;
  *(_QWORD *)(inited + 224) = 0x694B726577736E61;
  *(_QWORD *)(inited + 232) = 0xEA0000000000646ELL;
  *(_WORD *)(inited + 240) = *(_WORD *)(v0 + v2[9]);
  *(_QWORD *)(inited + 264) = v12;
  strcpy((char *)(inited + 272), "responseCount");
  *(_WORD *)(inited + 286) = -4864;
  v13 = *(_QWORD *)(v0 + v2[10]);
  *(_QWORD *)(inited + 312) = MEMORY[0x24BEE1768];
  *(_QWORD *)(inited + 288) = v13;
  swift_bridgeObjectRetain();
  return sub_236AFA3B4(inited);
}

void sub_236AFFD04()
{
  unint64_t v0;
  id v1;
  void *v2;
  void *v3;
  id v4;

  swift_bridgeObjectRetain();
  v0 = sub_236AFF6D0();
  sub_236AFF30C(v0);
  swift_bridgeObjectRelease();
  v1 = objc_allocWithZone(MEMORY[0x24BDFC2A0]);
  v2 = (void *)sub_236B16540();
  swift_bridgeObjectRelease();
  v3 = (void *)sub_236B16504();
  swift_bridgeObjectRelease();
  v4 = objc_msgSend(v1, sel_initWithEventName_eventCategory_initData_, v2, 0, v3);

  if (qword_25643ACA8 != -1)
    swift_once();
  objc_msgSend((id)qword_25643AF28, sel_sendEvent_, v4);

}

uint64_t _s9AskToCore7MetricsO11SendJourneyO3log22clientBundleIdentifier13questionTopic10checkpointySSSg_0aB010ATQuestionC0L0CAC07RequestF0O10CheckpointOtFZ_0(uint64_t a1, uint64_t a2, void *a3, unsigned __int16 a4)
{
  uint64_t v8;
  NSObject *v9;
  os_log_type_t v10;
  uint8_t *v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t inited;
  id v16;
  __int128 v18[2];
  uint64_t v19[6];

  if (qword_25643AC98 != -1)
    swift_once();
  v8 = sub_236B164F8();
  __swift_project_value_buffer(v8, (uint64_t)qword_25643DFA8);
  v9 = sub_236B164E0();
  v10 = sub_236B1669C();
  if (os_log_type_enabled(v9, v10))
  {
    v11 = (uint8_t *)swift_slowAlloc();
    v12 = swift_slowAlloc();
    v19[0] = v12;
    *(_DWORD *)v11 = 136446210;
    v13 = Metrics.RequestJourney.Checkpoint.description.getter(a4);
    *(_QWORD *)&v18[0] = sub_236AFB308(v13, v14, v19);
    sub_236B166FC();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_236AF7000, v9, v10, "Logging request journey metric with checkpoint %{public}s", v11, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x23B7FC480](v12, -1, -1);
    MEMORY[0x23B7FC480](v11, -1, -1);
  }

  v19[3] = (uint64_t)&type metadata for Metrics.RequestJourney.Checkpoint;
  v19[4] = sub_236B01234();
  LOWORD(v19[0]) = a4;
  type metadata accessor for RequestJourneyEvent();
  inited = swift_initStackObject();
  sub_236B000E0((uint64_t)v19, (uint64_t)v18);
  *(_WORD *)(inited + 32) = 1;
  *(_QWORD *)(inited + 16) = 0xD000000000000022;
  *(_QWORD *)(inited + 24) = 0x8000000236B19910;
  *(_QWORD *)(inited + 40) = a1;
  *(_QWORD *)(inited + 48) = a2;
  swift_bridgeObjectRetain();
  v16 = a3;
  swift_bridgeObjectRelease();
  *(_QWORD *)(inited + 56) = v16;
  sub_236B00124(v18, inited + 64);
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v19);
  swift_retain();
  sub_236AFFD04();
  swift_release();
  swift_setDeallocating();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return __swift_destroy_boxed_opaque_existential_0(inited + 64);
}

unint64_t sub_236B0007C()
{
  unint64_t result;

  result = qword_25643AF30;
  if (!qword_25643AF30)
  {
    result = MEMORY[0x23B7FC3FC](&unk_236B178A4, &type metadata for Metrics.ResponseJourney.Checkpoint);
    atomic_store(result, (unint64_t *)&qword_25643AF30);
  }
  return result;
}

uint64_t type metadata accessor for ResponseJourneyEvent()
{
  return objc_opt_self();
}

uint64_t sub_236B000E0(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  *(_QWORD *)(a2 + 32) = *(_QWORD *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_236B00124(__int128 *a1, uint64_t a2)
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

uint64_t type metadata accessor for RequestSendEvent(uint64_t a1)
{
  return sub_236B00164(a1, qword_25643B3E0);
}

uint64_t type metadata accessor for ResponseSendEvent(uint64_t a1)
{
  return sub_236B00164(a1, qword_25643B338);
}

uint64_t sub_236B00164(uint64_t a1, uint64_t *a2)
{
  uint64_t result;

  result = *a2;
  if (!*a2)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_236B00198(uint64_t a1, uint64_t a2, uint64_t (*a3)(_QWORD))
{
  uint64_t v5;

  v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_236B001DC(uint64_t a1, uint64_t (*a2)(_QWORD))
{
  uint64_t v3;

  v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_236B00218(unsigned __int16 a1)
{
  int v1;
  int v2;

  v1 = a1;
  if (a1 > 0x3E7u)
  {
    if (a1 > 0x5DBu)
    {
      if (a1 <= 0x6A3u)
      {
        if (a1 != 1500 && a1 != 1600)
          goto LABEL_37;
      }
      else if (a1 != 1700 && a1 != 1800 && a1 != 1900)
      {
        goto LABEL_37;
      }
    }
    else if (a1 <= 0x4AFu)
    {
      if (a1 != 1000 && a1 != 1100)
        goto LABEL_37;
    }
    else if (a1 != 1200 && a1 != 1300 && a1 != 1400)
    {
      goto LABEL_37;
    }
  }
  else if (a1 > 0x1F3u)
  {
    if (a1 <= 0x2BBu)
    {
      if (a1 != 500 && a1 != 600)
        goto LABEL_37;
    }
    else if (a1 != 700 && a1 != 800 && a1 != 900)
    {
      goto LABEL_37;
    }
  }
  else if (a1 <= 0xC7u)
  {
    if (a1 && a1 != 100)
      goto LABEL_37;
  }
  else if (a1 != 200 && a1 != 300 && a1 != 400)
  {
LABEL_37:
    v1 = 0;
    v2 = 1;
    return v1 | (v2 << 16);
  }
  v2 = 0;
  return v1 | (v2 << 16);
}

uint64_t sub_236B0032C(unsigned __int16 a1)
{
  int v1;
  int v2;

  v1 = a1;
  if (a1 > 0x2BBu)
  {
    if (a1 <= 0x3E7u)
    {
      if (a1 != 700 && a1 != 800 && a1 != 900)
        goto LABEL_27;
    }
    else if (a1 > 0x4AFu)
    {
      if (a1 != 1200 && a1 != 1300)
        goto LABEL_27;
    }
    else if (a1 != 1000 && a1 != 1100)
    {
      goto LABEL_27;
    }
  }
  else if (a1 <= 0x12Bu)
  {
    if (a1 && a1 != 100 && a1 != 200)
      goto LABEL_27;
  }
  else if (a1 > 0x1F3u)
  {
    if (a1 != 500 && a1 != 600)
      goto LABEL_27;
  }
  else if (a1 != 300 && a1 != 400)
  {
LABEL_27:
    v1 = 0;
    v2 = 1;
    return v1 | (v2 << 16);
  }
  v2 = 0;
  return v1 | (v2 << 16);
}

unint64_t sub_236B003FC()
{
  unint64_t result;

  result = qword_25643AF38;
  if (!qword_25643AF38)
  {
    result = MEMORY[0x23B7FC3FC](&protocol conformance descriptor for Metrics.RequestJourney.Checkpoint, &type metadata for Metrics.RequestJourney.Checkpoint);
    atomic_store(result, (unint64_t *)&qword_25643AF38);
  }
  return result;
}

uint64_t sub_236B00440(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_236B00538(a1, a2, a3, (uint64_t (*)(void))sub_236B00454, (uint64_t (*)(void))sub_236B00498);
}

unint64_t sub_236B00454()
{
  unint64_t result;

  result = qword_25643AF40;
  if (!qword_25643AF40)
  {
    result = MEMORY[0x23B7FC3FC](&protocol conformance descriptor for Metrics.RequestJourney.Checkpoint, &type metadata for Metrics.RequestJourney.Checkpoint);
    atomic_store(result, (unint64_t *)&qword_25643AF40);
  }
  return result;
}

unint64_t sub_236B00498()
{
  unint64_t result;

  result = qword_25643AF48;
  if (!qword_25643AF48)
  {
    result = MEMORY[0x23B7FC3FC](&protocol conformance descriptor for Metrics.RequestJourney.Checkpoint, &type metadata for Metrics.RequestJourney.Checkpoint);
    atomic_store(result, (unint64_t *)&qword_25643AF48);
  }
  return result;
}

unint64_t sub_236B004E0()
{
  unint64_t result;

  result = qword_25643AF50;
  if (!qword_25643AF50)
  {
    result = MEMORY[0x23B7FC3FC](&protocol conformance descriptor for Metrics.ResponseJourney.Checkpoint, &type metadata for Metrics.ResponseJourney.Checkpoint);
    atomic_store(result, (unint64_t *)&qword_25643AF50);
  }
  return result;
}

uint64_t sub_236B00524(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_236B00538(a1, a2, a3, (uint64_t (*)(void))sub_236B00568, (uint64_t (*)(void))sub_236B005AC);
}

uint64_t sub_236B00538(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(void), uint64_t (*a5)(void))
{
  uint64_t result;

  *(_QWORD *)(a1 + 8) = a4();
  result = a5();
  *(_QWORD *)(a1 + 16) = result;
  return result;
}

unint64_t sub_236B00568()
{
  unint64_t result;

  result = qword_25643AF58;
  if (!qword_25643AF58)
  {
    result = MEMORY[0x23B7FC3FC](&protocol conformance descriptor for Metrics.ResponseJourney.Checkpoint, &type metadata for Metrics.ResponseJourney.Checkpoint);
    atomic_store(result, (unint64_t *)&qword_25643AF58);
  }
  return result;
}

unint64_t sub_236B005AC()
{
  unint64_t result;

  result = qword_25643AF60;
  if (!qword_25643AF60)
  {
    result = MEMORY[0x23B7FC3FC](&protocol conformance descriptor for Metrics.ResponseJourney.Checkpoint, &type metadata for Metrics.ResponseJourney.Checkpoint);
    atomic_store(result, (unint64_t *)&qword_25643AF60);
  }
  return result;
}

ValueMetadata *type metadata accessor for Metrics()
{
  return &type metadata for Metrics;
}

ValueMetadata *type metadata accessor for Metrics.SendJourney()
{
  return &type metadata for Metrics.SendJourney;
}

ValueMetadata *type metadata accessor for Metrics.RequestJourney()
{
  return &type metadata for Metrics.RequestJourney;
}

ValueMetadata *type metadata accessor for Metrics.ResponseJourney()
{
  return &type metadata for Metrics.ResponseJourney;
}

ValueMetadata *type metadata accessor for Metrics.RequestSend()
{
  return &type metadata for Metrics.RequestSend;
}

ValueMetadata *type metadata accessor for Metrics.ResponseSend()
{
  return &type metadata for Metrics.ResponseSend;
}

ValueMetadata *type metadata accessor for Metrics.RequestJourney.Checkpoint()
{
  return &type metadata for Metrics.RequestJourney.Checkpoint;
}

ValueMetadata *type metadata accessor for Metrics.ResponseJourney.Checkpoint()
{
  return &type metadata for Metrics.ResponseJourney.Checkpoint;
}

uint64_t type metadata accessor for JourneyEvent()
{
  return objc_opt_self();
}

uint64_t type metadata accessor for RequestJourneyEvent()
{
  return objc_opt_self();
}

_QWORD *sub_236B006B0(_QWORD *a1, _QWORD *a2, int *a3)
{
  _QWORD *v4;
  int v5;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  char *v10;
  uint64_t v11;
  void (*v12)(char *, char *, uint64_t);
  uint64_t v13;
  uint64_t v14;
  _QWORD *v15;
  _QWORD *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;

  v4 = a1;
  v5 = *(_DWORD *)(*((_QWORD *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v19 = *a2;
    *v4 = *a2;
    v4 = (_QWORD *)(v19 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    v7 = a2[1];
    *a1 = *a2;
    a1[1] = v7;
    v8 = a3[5];
    v9 = (char *)a1 + v8;
    v10 = (char *)a2 + v8;
    v11 = sub_236B164BC();
    v12 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v11 - 8) + 16);
    swift_bridgeObjectRetain();
    v12(v9, v10, v11);
    v13 = a3[6];
    v14 = a3[7];
    v15 = (_QWORD *)((char *)v4 + v13);
    v16 = (_QWORD *)((char *)a2 + v13);
    v17 = v16[1];
    *v15 = *v16;
    v15[1] = v17;
    *((_BYTE *)v4 + v14) = *((_BYTE *)a2 + v14);
    v18 = a3[9];
    *(_WORD *)((char *)v4 + a3[8]) = *(_WORD *)((char *)a2 + a3[8]);
    *(_WORD *)((char *)v4 + v18) = *(_WORD *)((char *)a2 + v18);
    *(_QWORD *)((char *)v4 + a3[10]) = *(_QWORD *)((char *)a2 + a3[10]);
    swift_bridgeObjectRetain();
  }
  return v4;
}

uint64_t sub_236B0079C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;

  swift_bridgeObjectRelease();
  v4 = a1 + *(int *)(a2 + 20);
  v5 = sub_236B164BC();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(v4, v5);
  return swift_bridgeObjectRelease();
}

_QWORD *sub_236B007FC(_QWORD *a1, _QWORD *a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  char *v8;
  char *v9;
  uint64_t v10;
  void (*v11)(char *, char *, uint64_t);
  uint64_t v12;
  uint64_t v13;
  _QWORD *v14;
  _QWORD *v15;
  uint64_t v16;
  uint64_t v17;

  v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  v7 = a3[5];
  v8 = (char *)a1 + v7;
  v9 = (char *)a2 + v7;
  v10 = sub_236B164BC();
  v11 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v10 - 8) + 16);
  swift_bridgeObjectRetain();
  v11(v8, v9, v10);
  v12 = a3[6];
  v13 = a3[7];
  v14 = (_QWORD *)((char *)a1 + v12);
  v15 = (_QWORD *)((char *)a2 + v12);
  v16 = v15[1];
  *v14 = *v15;
  v14[1] = v16;
  *((_BYTE *)a1 + v13) = *((_BYTE *)a2 + v13);
  v17 = a3[9];
  *(_WORD *)((char *)a1 + a3[8]) = *(_WORD *)((char *)a2 + a3[8]);
  *(_WORD *)((char *)a1 + v17) = *(_WORD *)((char *)a2 + v17);
  *(_QWORD *)((char *)a1 + a3[10]) = *(_QWORD *)((char *)a2 + a3[10]);
  swift_bridgeObjectRetain();
  return a1;
}

_QWORD *sub_236B008BC(_QWORD *a1, _QWORD *a2, int *a3)
{
  uint64_t v6;
  char *v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  _QWORD *v12;

  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v6 = a3[5];
  v7 = (char *)a1 + v6;
  v8 = (char *)a2 + v6;
  v9 = sub_236B164BC();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v9 - 8) + 24))(v7, v8, v9);
  v10 = a3[6];
  v11 = (_QWORD *)((char *)a1 + v10);
  v12 = (_QWORD *)((char *)a2 + v10);
  *v11 = *v12;
  v11[1] = v12[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *((_BYTE *)a1 + a3[7]) = *((_BYTE *)a2 + a3[7]);
  *(_WORD *)((char *)a1 + a3[8]) = *(_WORD *)((char *)a2 + a3[8]);
  *(_WORD *)((char *)a1 + a3[9]) = *(_WORD *)((char *)a2 + a3[9]);
  *(_QWORD *)((char *)a1 + a3[10]) = *(_QWORD *)((char *)a2 + a3[10]);
  return a1;
}

_OWORD *sub_236B0099C(_OWORD *a1, _OWORD *a2, int *a3)
{
  uint64_t v6;
  char *v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  *a1 = *a2;
  v6 = a3[5];
  v7 = (char *)a1 + v6;
  v8 = (char *)a2 + v6;
  v9 = sub_236B164BC();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v9 - 8) + 32))(v7, v8, v9);
  v10 = a3[7];
  *(_OWORD *)((char *)a1 + a3[6]) = *(_OWORD *)((char *)a2 + a3[6]);
  *((_BYTE *)a1 + v10) = *((_BYTE *)a2 + v10);
  v11 = a3[9];
  *(_WORD *)((char *)a1 + a3[8]) = *(_WORD *)((char *)a2 + a3[8]);
  *(_WORD *)((char *)a1 + v11) = *(_WORD *)((char *)a2 + v11);
  *(_QWORD *)((char *)a1 + a3[10]) = *(_QWORD *)((char *)a2 + a3[10]);
  return a1;
}

_QWORD *sub_236B00A3C(_QWORD *a1, _QWORD *a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  char *v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;

  v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  swift_bridgeObjectRelease();
  v7 = a3[5];
  v8 = (char *)a1 + v7;
  v9 = (char *)a2 + v7;
  v10 = sub_236B164BC();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v10 - 8) + 40))(v8, v9, v10);
  v11 = a3[6];
  v12 = (_QWORD *)((char *)a1 + v11);
  v13 = (_QWORD *)((char *)a2 + v11);
  v15 = *v13;
  v14 = v13[1];
  *v12 = v15;
  v12[1] = v14;
  swift_bridgeObjectRelease();
  v16 = a3[8];
  *((_BYTE *)a1 + a3[7]) = *((_BYTE *)a2 + a3[7]);
  *(_WORD *)((char *)a1 + v16) = *(_WORD *)((char *)a2 + v16);
  v17 = a3[10];
  *(_WORD *)((char *)a1 + a3[9]) = *(_WORD *)((char *)a2 + a3[9]);
  *(_QWORD *)((char *)a1 + v17) = *(_QWORD *)((char *)a2 + v17);
  return a1;
}

uint64_t sub_236B00AF4()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_236B00B04()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_236B00B14()
{
  return sub_236B01168();
}

_QWORD *sub_236B00B34(_QWORD *a1, _QWORD *a2, int *a3)
{
  _QWORD *v4;
  int v5;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  char *v10;
  uint64_t v11;
  void (*v12)(char *, char *, uint64_t);
  uint64_t v13;
  uint64_t v14;
  _QWORD *v15;
  _QWORD *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  _QWORD *v20;
  _QWORD *v21;
  uint64_t v22;
  _QWORD *v23;
  _QWORD *v24;
  uint64_t v25;
  uint64_t v26;

  v4 = a1;
  v5 = *(_DWORD *)(*((_QWORD *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v26 = *a2;
    *v4 = *a2;
    v4 = (_QWORD *)(v26 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    v7 = a2[1];
    *a1 = *a2;
    a1[1] = v7;
    v8 = a3[5];
    v9 = (char *)a1 + v8;
    v10 = (char *)a2 + v8;
    v11 = sub_236B164BC();
    v12 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v11 - 8) + 16);
    swift_bridgeObjectRetain();
    v12(v9, v10, v11);
    v13 = a3[6];
    v14 = a3[7];
    v15 = (_QWORD *)((char *)v4 + v13);
    v16 = (_QWORD *)((char *)a2 + v13);
    v17 = v16[1];
    *v15 = *v16;
    v15[1] = v17;
    *((_BYTE *)v4 + v14) = *((_BYTE *)a2 + v14);
    v18 = a3[8];
    v19 = a3[9];
    v20 = (_QWORD *)((char *)v4 + v18);
    v21 = (_QWORD *)((char *)a2 + v18);
    v22 = v21[1];
    *v20 = *v21;
    v20[1] = v22;
    v23 = (_QWORD *)((char *)v4 + v19);
    v24 = (_QWORD *)((char *)a2 + v19);
    v25 = v24[1];
    *v23 = *v24;
    v23[1] = v25;
    *(_WORD *)((char *)v4 + a3[10]) = *(_WORD *)((char *)a2 + a3[10]);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
  return v4;
}

uint64_t sub_236B00C40(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;

  swift_bridgeObjectRelease();
  v4 = a1 + *(int *)(a2 + 20);
  v5 = sub_236B164BC();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(v4, v5);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

_QWORD *sub_236B00CC0(_QWORD *a1, _QWORD *a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  char *v8;
  char *v9;
  uint64_t v10;
  void (*v11)(char *, char *, uint64_t);
  uint64_t v12;
  uint64_t v13;
  _QWORD *v14;
  _QWORD *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  _QWORD *v19;
  _QWORD *v20;
  uint64_t v21;
  _QWORD *v22;
  _QWORD *v23;
  uint64_t v24;

  v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  v7 = a3[5];
  v8 = (char *)a1 + v7;
  v9 = (char *)a2 + v7;
  v10 = sub_236B164BC();
  v11 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v10 - 8) + 16);
  swift_bridgeObjectRetain();
  v11(v8, v9, v10);
  v12 = a3[6];
  v13 = a3[7];
  v14 = (_QWORD *)((char *)a1 + v12);
  v15 = (_QWORD *)((char *)a2 + v12);
  v16 = v15[1];
  *v14 = *v15;
  v14[1] = v16;
  *((_BYTE *)a1 + v13) = *((_BYTE *)a2 + v13);
  v17 = a3[8];
  v18 = a3[9];
  v19 = (_QWORD *)((char *)a1 + v17);
  v20 = (_QWORD *)((char *)a2 + v17);
  v21 = v20[1];
  *v19 = *v20;
  v19[1] = v21;
  v22 = (_QWORD *)((char *)a1 + v18);
  v23 = (_QWORD *)((char *)a2 + v18);
  v24 = v23[1];
  *v22 = *v23;
  v22[1] = v24;
  *(_WORD *)((char *)a1 + a3[10]) = *(_WORD *)((char *)a2 + a3[10]);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

_QWORD *sub_236B00DA0(_QWORD *a1, _QWORD *a2, int *a3)
{
  uint64_t v6;
  char *v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  _QWORD *v12;
  uint64_t v13;
  _QWORD *v14;
  _QWORD *v15;
  uint64_t v16;
  _QWORD *v17;
  _QWORD *v18;

  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v6 = a3[5];
  v7 = (char *)a1 + v6;
  v8 = (char *)a2 + v6;
  v9 = sub_236B164BC();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v9 - 8) + 24))(v7, v8, v9);
  v10 = a3[6];
  v11 = (_QWORD *)((char *)a1 + v10);
  v12 = (_QWORD *)((char *)a2 + v10);
  *v11 = *v12;
  v11[1] = v12[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *((_BYTE *)a1 + a3[7]) = *((_BYTE *)a2 + a3[7]);
  v13 = a3[8];
  v14 = (_QWORD *)((char *)a1 + v13);
  v15 = (_QWORD *)((char *)a2 + v13);
  *v14 = *v15;
  v14[1] = v15[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v16 = a3[9];
  v17 = (_QWORD *)((char *)a1 + v16);
  v18 = (_QWORD *)((char *)a2 + v16);
  *v17 = *v18;
  v17[1] = v18[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_WORD *)((char *)a1 + a3[10]) = *(_WORD *)((char *)a2 + a3[10]);
  return a1;
}

_OWORD *sub_236B00EC0(_OWORD *a1, _OWORD *a2, int *a3)
{
  uint64_t v6;
  char *v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  *a1 = *a2;
  v6 = a3[5];
  v7 = (char *)a1 + v6;
  v8 = (char *)a2 + v6;
  v9 = sub_236B164BC();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v9 - 8) + 32))(v7, v8, v9);
  v10 = a3[7];
  *(_OWORD *)((char *)a1 + a3[6]) = *(_OWORD *)((char *)a2 + a3[6]);
  *((_BYTE *)a1 + v10) = *((_BYTE *)a2 + v10);
  v11 = a3[9];
  *(_OWORD *)((char *)a1 + a3[8]) = *(_OWORD *)((char *)a2 + a3[8]);
  *(_OWORD *)((char *)a1 + v11) = *(_OWORD *)((char *)a2 + v11);
  *(_WORD *)((char *)a1 + a3[10]) = *(_WORD *)((char *)a2 + a3[10]);
  return a1;
}

_QWORD *sub_236B00F60(_QWORD *a1, _QWORD *a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  char *v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
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
  _QWORD *v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t v25;

  v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  swift_bridgeObjectRelease();
  v7 = a3[5];
  v8 = (char *)a1 + v7;
  v9 = (char *)a2 + v7;
  v10 = sub_236B164BC();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v10 - 8) + 40))(v8, v9, v10);
  v11 = a3[6];
  v12 = (_QWORD *)((char *)a1 + v11);
  v13 = (_QWORD *)((char *)a2 + v11);
  v15 = *v13;
  v14 = v13[1];
  *v12 = v15;
  v12[1] = v14;
  swift_bridgeObjectRelease();
  v16 = a3[8];
  *((_BYTE *)a1 + a3[7]) = *((_BYTE *)a2 + a3[7]);
  v17 = (_QWORD *)((char *)a1 + v16);
  v18 = (_QWORD *)((char *)a2 + v16);
  v20 = *v18;
  v19 = v18[1];
  *v17 = v20;
  v17[1] = v19;
  swift_bridgeObjectRelease();
  v21 = a3[9];
  v22 = (_QWORD *)((char *)a1 + v21);
  v23 = (_QWORD *)((char *)a2 + v21);
  v25 = *v23;
  v24 = v23[1];
  *v22 = v25;
  v22[1] = v24;
  swift_bridgeObjectRelease();
  *(_WORD *)((char *)a1 + a3[10]) = *(_WORD *)((char *)a2 + a3[10]);
  return a1;
}

uint64_t sub_236B0103C()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t __swift_get_extra_inhabitant_indexTm(uint64_t a1, uint64_t a2, uint64_t a3)
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
    v8 = sub_236B164BC();
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 48))(a1 + *(int *)(a3 + 20), a2, v8);
  }
}

uint64_t sub_236B010C8()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t __swift_store_extra_inhabitant_indexTm(uint64_t result, uint64_t a2, int a3, uint64_t a4)
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
    v7 = sub_236B164BC();
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 56))(v5 + *(int *)(a4 + 20), a2, a2, v7);
  }
  return result;
}

uint64_t sub_236B0114C()
{
  return sub_236B01168();
}

uint64_t sub_236B01168()
{
  uint64_t result;
  unint64_t v1;

  result = sub_236B164BC();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
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

uint64_t sub_236B0122C()
{
  return swift_release();
}

unint64_t sub_236B01234()
{
  unint64_t result;

  result = qword_25643B440;
  if (!qword_25643B440)
  {
    result = MEMORY[0x23B7FC3FC](&unk_236B177C0, &type metadata for Metrics.RequestJourney.Checkpoint);
    atomic_store(result, (unint64_t *)&qword_25643B440);
  }
  return result;
}

uint64_t sub_236B01284(unsigned __int8 a1)
{
  return ((uint64_t (*)(uint64_t, unint64_t))((char *)sub_236B012B8 + 4 * byte_236B17A98[a1]))(0x6E6F6973726576, 0xE700000000000000);
}

unint64_t sub_236B012B8()
{
  return 0xD000000000000016;
}

uint64_t sub_236B013B4(unsigned __int8 a1)
{
  return ((uint64_t (*)(uint64_t, unint64_t))((char *)sub_236B013E8 + 4 * byte_236B17AA2[a1]))(0x6E6F6973726576, 0xE700000000000000);
}

unint64_t sub_236B013E8()
{
  return 0xD000000000000016;
}

uint64_t sub_236B014E4(unsigned __int8 *a1, unsigned __int8 *a2)
{
  unsigned __int8 v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char v8;

  v2 = *a2;
  v3 = sub_236B01284(*a1);
  v5 = v4;
  if (v3 == sub_236B01284(v2) && v5 == v6)
    v8 = 1;
  else
    v8 = sub_236B168AC();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v8 & 1;
}

uint64_t sub_236B0156C()
{
  unsigned __int8 *v0;
  unsigned __int8 v1;

  v1 = *v0;
  sub_236B16918();
  sub_236B01284(v1);
  sub_236B16588();
  swift_bridgeObjectRelease();
  return sub_236B16960();
}

uint64_t sub_236B015CC()
{
  unsigned __int8 *v0;

  sub_236B01284(*v0);
  sub_236B16588();
  return swift_bridgeObjectRelease();
}

uint64_t sub_236B0160C()
{
  unsigned __int8 *v0;
  unsigned __int8 v1;

  v1 = *v0;
  sub_236B16918();
  sub_236B01284(v1);
  sub_236B16588();
  swift_bridgeObjectRelease();
  return sub_236B16960();
}

uint64_t sub_236B01668@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = sub_236B04634();
  *a1 = result;
  return result;
}

uint64_t sub_236B01694@<X0>(uint64_t *a1@<X8>)
{
  unsigned __int8 *v1;
  uint64_t result;
  uint64_t v4;

  result = sub_236B01284(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t sub_236B016BC()
{
  unsigned __int8 *v0;

  return sub_236B013B4(*v0);
}

uint64_t sub_236B016C4@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = sub_236B04634();
  *a1 = result;
  return result;
}

uint64_t sub_236B016E8()
{
  return 0;
}

void sub_236B016F4(_BYTE *a1@<X8>)
{
  *a1 = 10;
}

uint64_t sub_236B01700()
{
  sub_236B04C3C();
  return sub_236B16990();
}

uint64_t sub_236B01728()
{
  sub_236B04C3C();
  return sub_236B1699C();
}

uint64_t static ATPayload.currentVersion.getter()
{
  return 3;
}

uint64_t ATPayload.version.getter()
{
  uint64_t v0;

  return *(unsigned __int16 *)(v0 + OBJC_IVAR____TtC9AskToCore9ATPayload_version);
}

uint64_t ATPayload.clientBundleIdentifier.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + OBJC_IVAR____TtC9AskToCore9ATPayload_clientBundleIdentifier);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t ATPayload.clientAdamIdentifier.getter()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + OBJC_IVAR____TtC9AskToCore9ATPayload_clientAdamIdentifier);
}

uint64_t ATPayload.messageGUID.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + OBJC_IVAR____TtC9AskToCore9ATPayload_messageGUID);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t ATPayload.rawRecipientGroup.getter()
{
  uint64_t v0;

  return *(unsigned __int16 *)(v0 + OBJC_IVAR____TtC9AskToCore9ATPayload_rawRecipientGroup);
}

uint64_t ATPayload.isForFamily.getter()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + OBJC_IVAR____TtC9AskToCore9ATPayload_isForFamily);
}

id ATPayload.question.getter()
{
  uint64_t v0;

  return *(id *)(v0 + OBJC_IVAR____TtC9AskToCore9ATPayload_question);
}

void *ATPayload.response.getter()
{
  uint64_t v0;
  void *v1;
  id v2;

  v1 = *(void **)(v0 + OBJC_IVAR____TtC9AskToCore9ATPayload_response);
  v2 = v1;
  return v1;
}

uint64_t ATPayload.allResponses.getter()
{
  return swift_bridgeObjectRetain();
}

unint64_t ATPayload.dictionaryRepresentation.getter()
{
  return sub_236B01BE4();
}

unint64_t sub_236B01BE4()
{
  uint64_t v0;
  uint64_t v1;
  unint64_t v2;
  __int16 v3;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  _OWORD v15[2];
  __int128 v16;
  uint64_t v17;
  uint64_t v18;

  swift_getObjectType();
  v18 = v0;
  v2 = sub_236AFA3B4(MEMORY[0x24BEE4AF8]);
  v3 = *(_WORD *)(v0 + OBJC_IVAR____TtC9AskToCore9ATPayload_version);
  v17 = MEMORY[0x24BEE3F30];
  LOWORD(v16) = v3;
  sub_236AFD7CC(&v16, v15);
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  sub_236AFC858(v15, 0x6E6F6973726576, 0xE700000000000000, isUniquelyReferenced_nonNull_native);
  swift_bridgeObjectRelease();
  sub_236B16354();
  swift_allocObject();
  v5 = sub_236B16348();
  sub_236B05140(&qword_25643B4F0, v6, (uint64_t (*)(uint64_t))type metadata accessor for ATPayload, (uint64_t)&protocol conformance descriptor for ATPayload);
  v7 = v5;
  v8 = sub_236B1633C();
  if (v1)
  {
    swift_release();
    swift_bridgeObjectRelease();
    sub_236B0524C();
    swift_allocError();
    *(_QWORD *)v10 = v1;
    *(_QWORD *)(v10 + 8) = 0;
    *(_BYTE *)(v10 + 16) = 1;
    swift_willThrow();
  }
  else
  {
    v11 = v8;
    v12 = v9;
    v17 = MEMORY[0x24BDCDDE8];
    *(_QWORD *)&v16 = v8;
    *((_QWORD *)&v16 + 1) = v9;
    sub_236AFD7CC(&v16, v15);
    sub_236AFD1C0(v11, v12);
    v13 = swift_isUniquelyReferenced_nonNull_native();
    sub_236AFC858(v15, 1635017060, 0xE400000000000000, v13);
    v7 = v2;
    swift_bridgeObjectRelease();
    sub_236AFD17C(v11, v12);
    swift_release();
  }
  return v7;
}

NSObject *ATPayload.__allocating_init(dictionaryRepresentation:)(uint64_t a1)
{
  objc_class *v1;
  id v3;
  NSObject *v4;

  v3 = objc_allocWithZone(v1);
  swift_getObjectType();
  v4 = sub_236B01E9C(a1);
  swift_deallocPartialClassInstance();
  return v4;
}

NSObject *ATPayload.init(dictionaryRepresentation:)(uint64_t a1)
{
  NSObject *v2;

  swift_getObjectType();
  v2 = sub_236B01E9C(a1);
  swift_deallocPartialClassInstance();
  return v2;
}

NSObject *sub_236B01E9C(uint64_t a1)
{
  objc_class *v1;
  uint64_t v2;
  uint64_t v4;
  objc_class *v5;
  unint64_t v6;
  char v7;
  uint64_t v8;
  NSObject *v9;
  os_log_type_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  NSObject *v19;
  os_log_type_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  uint64_t v24;
  unint64_t v25;
  unint64_t v26;
  uint64_t v27;
  uint64_t v28;
  __int128 v29;
  unint64_t v31;
  char v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  os_log_type_t v36;
  uint64_t v37;
  uint64_t v38;
  unint64_t v39;
  uint64_t v40;
  unint64_t v41;
  unint64_t v42;
  uint64_t v43;
  void *v44;
  id v45;
  _BYTE *v46;
  uint64_t v47;
  os_log_type_t type;
  uint64_t v49;
  unint64_t v50;
  uint64_t v51[4];
  uint64_t v52;

  if (!*(_QWORD *)(a1 + 16)
    || (v4 = v2, v5 = v1, v6 = sub_236AFBA14(0x6E6F6973726576, 0xE700000000000000), (v7 & 1) == 0)
    || (sub_236AFD7FC(*(_QWORD *)(a1 + 56) + 32 * v6, (uint64_t)v51), !swift_dynamicCast()))
  {
    if (qword_25643AC80 != -1)
      swift_once();
    v18 = sub_236B164F8();
    __swift_project_value_buffer(v18, (uint64_t)qword_25643DF60);
    swift_bridgeObjectRetain();
    v19 = sub_236B164E0();
    v20 = sub_236B16690();
    if (os_log_type_enabled(v19, v20))
    {
      v21 = swift_slowAlloc();
      v52 = swift_slowAlloc();
      v51[0] = v52;
      *(_DWORD *)v21 = 136315650;
      __swift_instantiateConcreteTypeFromMangledName(&qword_25643AD80);
      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_25643B550);
      v22 = sub_236B1657C();
      sub_236AFB308(v22, v23, v51);
      sub_236B166FC();
      swift_bridgeObjectRelease();
      *(_WORD *)(v21 + 12) = 2080;
      sub_236AFB308(0x6E6F6973726576, 0xE700000000000000, v51);
      sub_236B166FC();
      *(_WORD *)(v21 + 22) = 2080;
      swift_bridgeObjectRetain();
      v24 = sub_236B1651C();
      v26 = v25;
      swift_bridgeObjectRelease();
      sub_236AFB308(v24, v26, v51);
      sub_236B166FC();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_236AF7000, v19, v20, "Failed %s init. Could not find required value for key \"%s\" in dictionary: %s", (uint8_t *)v21, 0x20u);
      v27 = v52;
      swift_arrayDestroy();
      MEMORY[0x23B7FC480](v27, -1, -1);
      MEMORY[0x23B7FC480](v21, -1, -1);

    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
    sub_236B0524C();
    swift_allocError();
    v29 = xmmword_236B17CD0;
    goto LABEL_15;
  }
  if (qword_25643AC80 != -1)
    swift_once();
  v8 = sub_236B164F8();
  __swift_project_value_buffer(v8, (uint64_t)qword_25643DF60);
  swift_bridgeObjectRetain_n();
  v9 = sub_236B164E0();
  v10 = sub_236B1669C();
  if (os_log_type_enabled(v9, v10))
  {
    type = v10;
    v11 = swift_slowAlloc();
    v47 = swift_slowAlloc();
    v51[0] = v47;
    *(_DWORD *)v11 = 136315650;
    __swift_instantiateConcreteTypeFromMangledName(&qword_25643AD80);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_25643B550);
    v52 = v2;
    v12 = sub_236B1657C();
    sub_236AFB308(v12, v13, v51);
    sub_236B166FC();
    swift_bridgeObjectRelease();
    *(_WORD *)(v11 + 12) = 512;
    sub_236B166FC();
    *(_WORD *)(v11 + 16) = 2080;
    swift_bridgeObjectRetain();
    v14 = sub_236B1651C();
    v16 = v15;
    swift_bridgeObjectRelease();
    v17 = v14;
    v4 = v52;
    v49 = sub_236AFB308(v17, v16, v51);
    sub_236B166FC();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_236AF7000, v9, type, "Creating %s with dictionary. Had version %hd. dictionary: %s", (uint8_t *)v11, 0x1Au);
    swift_arrayDestroy();
    MEMORY[0x23B7FC480](v47, -1, -1);
    MEMORY[0x23B7FC480](v11, -1, -1);

    if (!*(_QWORD *)(a1 + 16))
      goto LABEL_22;
  }
  else
  {

    swift_bridgeObjectRelease_n();
    if (!*(_QWORD *)(a1 + 16))
      goto LABEL_22;
  }
  v31 = sub_236AFBA14(1635017060, 0xE400000000000000);
  if ((v32 & 1) == 0
    || (sub_236AFD7FC(*(_QWORD *)(a1 + 56) + 32 * v31, (uint64_t)v51), !swift_dynamicCast()))
  {
LABEL_22:
    swift_bridgeObjectRetain();
    v19 = sub_236B164E0();
    v36 = sub_236B16690();
    if (os_log_type_enabled(v19, v36))
    {
      v37 = swift_slowAlloc();
      v52 = swift_slowAlloc();
      v51[0] = v52;
      *(_DWORD *)v37 = 136315650;
      __swift_instantiateConcreteTypeFromMangledName(&qword_25643AD80);
      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_25643B550);
      v38 = sub_236B1657C();
      sub_236AFB308(v38, v39, v51);
      sub_236B166FC();
      swift_bridgeObjectRelease();
      *(_WORD *)(v37 + 12) = 2080;
      sub_236AFB308(1635017060, 0xE400000000000000, v51);
      sub_236B166FC();
      *(_WORD *)(v37 + 22) = 2080;
      swift_bridgeObjectRetain();
      v40 = sub_236B1651C();
      v42 = v41;
      swift_bridgeObjectRelease();
      sub_236AFB308(v40, v42, v51);
      sub_236B166FC();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_236AF7000, v19, v36, "Failed %s init. Could not find required value for key \"%s\" in dictionary: %s", (uint8_t *)v37, 0x20u);
      v43 = v52;
      swift_arrayDestroy();
      MEMORY[0x23B7FC480](v43, -1, -1);
      MEMORY[0x23B7FC480](v37, -1, -1);

    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
    sub_236B0524C();
    swift_allocError();
    v29 = xmmword_236B17CC0;
LABEL_15:
    *(_OWORD *)v28 = v29;
    *(_BYTE *)(v28 + 16) = 0;
    swift_willThrow();
    return v19;
  }
  swift_bridgeObjectRelease();
  sub_236B16330();
  swift_allocObject();
  v33 = sub_236B16324();
  sub_236B05140(&qword_25643AD88, v34, (uint64_t (*)(uint64_t))type metadata accessor for ATPayload, (uint64_t)&protocol conformance descriptor for ATPayload);
  v19 = v33;
  sub_236B16318();
  if (v4)
  {
    sub_236B0524C();
    swift_allocError();
    *(_QWORD *)v35 = v4;
    *(_QWORD *)(v35 + 8) = 0;
    *(_BYTE *)(v35 + 16) = 2;
    swift_willThrow();
    swift_release();
    sub_236AFD17C(v49, v50);
  }
  else
  {
    v44 = (void *)v51[0];
    v45 = objc_allocWithZone(v5);
    v46 = v44;
    v19 = sub_236B02B10(v46);
    swift_release();
    sub_236AFD17C(v49, v50);

  }
  return v19;
}

id ATPayload.__allocating_init(clientBundleIdentifier:clientAdamIdentifier:rawRecipientGroup:isForFamily:question:)(uint64_t a1, uint64_t a2, uint64_t a3, char a4, __int16 a5, char a6, uint64_t a7)
{
  char v13;
  uint64_t v14;
  uint64_t v15;

  v13 = a4 & 1;
  v14 = sub_236B16480();
  return sub_236B0467C(3, a1, a2, a3, v13, v14, v15, a5, a6, a7, 0, 0);
}

id ATPayload.__allocating_init(originalPayload:newResponse:)(_BYTE *a1, void *a2)
{
  objc_class *v2;
  id v5;

  v5 = objc_allocWithZone(v2);
  return ATPayload.init(originalPayload:newResponse:)(a1, a2);
}

id ATPayload.init(originalPayload:newResponse:)(_BYTE *a1, void *a2)
{
  void *v2;
  uint64_t v5;
  id v6;
  id v7;
  uint64_t v8;
  char v9;
  uint64_t v10;
  uint64_t v11;
  char v12;
  void *v13;
  __int16 v14;
  id v15;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;

  v5 = MEMORY[0x24BEE4AF8];
  if (*(_QWORD *)&a1[OBJC_IVAR____TtC9AskToCore9ATPayload_allResponses])
    v5 = *(_QWORD *)&a1[OBJC_IVAR____TtC9AskToCore9ATPayload_allResponses];
  v19 = v5;
  v6 = v2;
  swift_bridgeObjectRetain();
  v7 = a2;
  MEMORY[0x23B7FBC1C]();
  if (*(_QWORD *)((v19 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v19 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
    sub_236B16630();
  sub_236B1663C();
  sub_236B16624();
  swift_getObjectType();

  v8 = *(_QWORD *)&a1[OBJC_IVAR____TtC9AskToCore9ATPayload_clientBundleIdentifier + 8];
  v17 = *(_QWORD *)&a1[OBJC_IVAR____TtC9AskToCore9ATPayload_clientAdamIdentifier];
  v18 = *(_QWORD *)&a1[OBJC_IVAR____TtC9AskToCore9ATPayload_clientBundleIdentifier];
  v9 = a1[OBJC_IVAR____TtC9AskToCore9ATPayload_clientAdamIdentifier + 8];
  v10 = *(_QWORD *)&a1[OBJC_IVAR____TtC9AskToCore9ATPayload_messageGUID];
  v11 = *(_QWORD *)&a1[OBJC_IVAR____TtC9AskToCore9ATPayload_messageGUID + 8];
  v12 = a1[OBJC_IVAR____TtC9AskToCore9ATPayload_isForFamily];
  v13 = *(void **)&a1[OBJC_IVAR____TtC9AskToCore9ATPayload_question];
  v14 = *(_WORD *)&a1[OBJC_IVAR____TtC9AskToCore9ATPayload_rawRecipientGroup];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v15 = sub_236B0467C(3, v18, v8, v17, v9, v10, v11, v14, v12, (uint64_t)v13, (uint64_t)v7, v19);

  swift_deallocPartialClassInstance();
  return v15;
}

id sub_236B02AE0(_BYTE *a1)
{
  objc_class *v1;
  id v3;

  v3 = objc_allocWithZone(v1);
  return sub_236B02B10(a1);
}

id sub_236B02B10(_BYTE *a1)
{
  uint64_t v2;
  uint64_t v3;
  char v4;
  void *v5;
  void *v6;
  uint64_t v7;
  __int16 v8;
  __int16 v9;
  id v10;
  id v11;
  id v12;
  uint64_t v14;
  char v15;
  uint64_t v16;
  uint64_t v17;

  swift_getObjectType();
  v2 = *(_QWORD *)&a1[OBJC_IVAR____TtC9AskToCore9ATPayload_clientBundleIdentifier + 8];
  v17 = *(_QWORD *)&a1[OBJC_IVAR____TtC9AskToCore9ATPayload_clientBundleIdentifier];
  v16 = *(_QWORD *)&a1[OBJC_IVAR____TtC9AskToCore9ATPayload_clientAdamIdentifier];
  v15 = a1[OBJC_IVAR____TtC9AskToCore9ATPayload_clientAdamIdentifier + 8];
  v3 = *(_QWORD *)&a1[OBJC_IVAR____TtC9AskToCore9ATPayload_messageGUID + 8];
  v14 = *(_QWORD *)&a1[OBJC_IVAR____TtC9AskToCore9ATPayload_messageGUID];
  v4 = a1[OBJC_IVAR____TtC9AskToCore9ATPayload_isForFamily];
  v5 = *(void **)&a1[OBJC_IVAR____TtC9AskToCore9ATPayload_question];
  v6 = *(void **)&a1[OBJC_IVAR____TtC9AskToCore9ATPayload_response];
  v7 = *(_QWORD *)&a1[OBJC_IVAR____TtC9AskToCore9ATPayload_allResponses];
  v8 = *(_WORD *)&a1[OBJC_IVAR____TtC9AskToCore9ATPayload_rawRecipientGroup];
  v9 = *(_WORD *)&a1[OBJC_IVAR____TtC9AskToCore9ATPayload_version];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v10 = v5;
  v11 = v6;
  swift_bridgeObjectRetain();
  v12 = sub_236B0467C(v9, v17, v2, v16, v15, v14, v3, v8, v4, (uint64_t)v10, (uint64_t)v6, v7);

  swift_deallocPartialClassInstance();
  return v12;
}

void *ATPayload.__allocating_init(from:)(_QWORD *a1)
{
  return sub_236B047A0(a1);
}

uint64_t ATPayload.encode(to:)(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v10;
  uint64_t v11;

  v3 = v1;
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_25643B4A0);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v10 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_236B04C3C();
  sub_236B16984();
  LOBYTE(v11) = 0;
  sub_236B16888();
  if (!v2)
  {
    LOBYTE(v11) = 1;
    sub_236B16834();
    LOBYTE(v11) = 2;
    sub_236B1684C();
    LOBYTE(v11) = 5;
    sub_236B16858();
    LOBYTE(v11) = 3;
    sub_236B16888();
    LOBYTE(v11) = 4;
    sub_236B16864();
    v11 = *(_QWORD *)(v3 + OBJC_IVAR____TtC9AskToCore9ATPayload_question);
    HIBYTE(v10) = 6;
    type metadata accessor for ATQuestion();
    sub_236B05140((unint64_t *)&unk_25643B4B0, 255, (uint64_t (*)(uint64_t))type metadata accessor for ATQuestion, (uint64_t)&protocol conformance descriptor for ATQuestion);
    sub_236B1687C();
    v11 = *(_QWORD *)(v3 + OBJC_IVAR____TtC9AskToCore9ATPayload_response);
    HIBYTE(v10) = 7;
    type metadata accessor for ATResponse();
    sub_236B05140(&qword_25643B810, 255, (uint64_t (*)(uint64_t))type metadata accessor for ATResponse, (uint64_t)&protocol conformance descriptor for ATResponse);
    sub_236B16840();
    v11 = *(_QWORD *)(v3 + OBJC_IVAR____TtC9AskToCore9ATPayload_allResponses);
    HIBYTE(v10) = 8;
    __swift_instantiateConcreteTypeFromMangledName(&qword_25643B4C0);
    sub_236B05180(&qword_25643B4C8, &qword_25643B810, (uint64_t)&protocol conformance descriptor for ATResponse, MEMORY[0x24BEE12A0]);
    sub_236B16840();
    LOWORD(v11) = 0;
    HIBYTE(v10) = 9;
    sub_236B04CC4();
    sub_236B1687C();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

uint64_t static ATPayload.supportsSecureCoding.getter()
{
  return 1;
}

id ATPayload.__allocating_init(coder:)(void *a1)
{
  objc_class *v1;
  id v3;

  v3 = objc_allocWithZone(v1);
  return ATPayload.init(coder:)(a1);
}

id ATPayload.init(coder:)(void *a1)
{
  void *v1;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  uint64_t v13;
  void *v14;
  void *v15;

  swift_getObjectType();
  sub_236B04E6C(0, &qword_25643B4D8);
  v3 = sub_236B166C0();
  if (v3)
  {
    v4 = (void *)v3;
    v5 = sub_236B16444();
    v7 = v6;
    v8 = objc_allocWithZone(MEMORY[0x24BDD1620]);
    v9 = sub_236B04D08();
    sub_236AFD17C(v5, v7);
    sub_236B05140(&qword_25643AD88, v13, (uint64_t (*)(uint64_t))type metadata accessor for ATPayload, (uint64_t)&protocol conformance descriptor for ATPayload);
    sub_236B166B4();
    if (v15)
    {
      v11 = objc_msgSend(v1, sel_initWithCopying_, v15);

      objc_msgSend(v9, sel_finishDecoding);
      return v11;
    }
    sub_236B16690();
    sub_236B04E6C(0, (unint64_t *)&unk_25643B4E0);
    v14 = (void *)sub_236B166E4();
    sub_236B164D4();

    objc_msgSend(v9, sel_finishDecoding);
  }
  else
  {
    sub_236B16690();
    sub_236B04E6C(0, (unint64_t *)&unk_25643B4E0);
    v10 = (void *)sub_236B166E4();
    sub_236B164D4();

  }
  swift_getObjectType();
  swift_deallocPartialClassInstance();
  return 0;
}

Swift::Void __swiftcall ATPayload.encode(with:)(NSCoder with)
{
  id v2;
  uint64_t v3;
  id v4;
  void *v5;
  void *v6;

  swift_getObjectType();
  v2 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDD1618]), sel_initRequiringSecureCoding_, 1);
  sub_236B05140(&qword_25643B4F0, v3, (uint64_t (*)(uint64_t))type metadata accessor for ATPayload, (uint64_t)&protocol conformance descriptor for ATPayload);
  sub_236B166A8();
  objc_msgSend(v2, sel_finishEncoding);
  v4 = objc_msgSend(v2, sel_encodedData);
  if (v4)
  {
    v5 = v4;
    v6 = (void *)sub_236B16540();
    -[objc_class encodeObject:forKey:](with.super.isa, sel_encodeObject_forKey_, v5, v6);

  }
  else
  {
    __break(1u);
  }
}

id ATPayload.copy(with:)@<X0>(_QWORD *a1@<X8>)
{
  void *v1;
  objc_class *ObjectType;
  id v4;
  id result;

  ObjectType = (objc_class *)swift_getObjectType();
  v4 = objc_allocWithZone(ObjectType);
  result = sub_236B02B10(v1);
  a1[3] = ObjectType;
  *a1 = result;
  return result;
}

uint64_t ATPayload.isEqual(_:)(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  BOOL v6;
  BOOL v7;
  id v8;
  char v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  char v14;
  unint64_t v15;
  unint64_t v16;
  unsigned __int8 v17;
  _BYTE *v19;
  _BYTE v20[24];
  uint64_t v21;

  v2 = v1;
  swift_getObjectType();
  sub_236B04DE4(a1, (uint64_t)v20);
  if (!v21)
  {
    sub_236B04E2C((uint64_t)v20);
    goto LABEL_36;
  }
  if ((swift_dynamicCast() & 1) == 0)
  {
LABEL_36:
    v17 = 0;
    return v17 & 1;
  }
  if (*(unsigned __int16 *)(v1 + OBJC_IVAR____TtC9AskToCore9ATPayload_version) != *(unsigned __int16 *)&v19[OBJC_IVAR____TtC9AskToCore9ATPayload_version])
    goto LABEL_35;
  v4 = *(_QWORD *)(v1 + OBJC_IVAR____TtC9AskToCore9ATPayload_clientBundleIdentifier + 8);
  v5 = *(_QWORD *)&v19[OBJC_IVAR____TtC9AskToCore9ATPayload_clientBundleIdentifier + 8];
  if (v4)
  {
    if (!v5)
      goto LABEL_35;
    v6 = *(_QWORD *)(v1 + OBJC_IVAR____TtC9AskToCore9ATPayload_clientBundleIdentifier) == *(_QWORD *)&v19[OBJC_IVAR____TtC9AskToCore9ATPayload_clientBundleIdentifier]
      && v4 == v5;
    if (!v6 && (sub_236B168AC() & 1) == 0)
      goto LABEL_35;
  }
  else if (v5)
  {
    goto LABEL_35;
  }
  if ((*(_BYTE *)(v1 + OBJC_IVAR____TtC9AskToCore9ATPayload_clientAdamIdentifier + 8) & 1) != 0)
  {
    if ((v19[OBJC_IVAR____TtC9AskToCore9ATPayload_clientAdamIdentifier + 8] & 1) == 0)
      goto LABEL_35;
  }
  else if ((v19[OBJC_IVAR____TtC9AskToCore9ATPayload_clientAdamIdentifier + 8] & 1) != 0
         || *(_QWORD *)(v1 + OBJC_IVAR____TtC9AskToCore9ATPayload_clientAdamIdentifier) != *(_QWORD *)&v19[OBJC_IVAR____TtC9AskToCore9ATPayload_clientAdamIdentifier])
  {
    goto LABEL_35;
  }
  v7 = *(_QWORD *)(v1 + OBJC_IVAR____TtC9AskToCore9ATPayload_messageGUID) == *(_QWORD *)&v19[OBJC_IVAR____TtC9AskToCore9ATPayload_messageGUID]
    && *(_QWORD *)(v1 + OBJC_IVAR____TtC9AskToCore9ATPayload_messageGUID + 8) == *(_QWORD *)&v19[OBJC_IVAR____TtC9AskToCore9ATPayload_messageGUID
                                                                                               + 8];
  if (!v7 && (sub_236B168AC() & 1) == 0)
    goto LABEL_35;
  if (*(unsigned __int16 *)(v1 + OBJC_IVAR____TtC9AskToCore9ATPayload_rawRecipientGroup) != *(unsigned __int16 *)&v19[OBJC_IVAR____TtC9AskToCore9ATPayload_rawRecipientGroup])
    goto LABEL_35;
  if (*(unsigned __int8 *)(v1 + OBJC_IVAR____TtC9AskToCore9ATPayload_isForFamily) != v19[OBJC_IVAR____TtC9AskToCore9ATPayload_isForFamily])
    goto LABEL_35;
  sub_236B04E6C(0, &qword_25643B500);
  v8 = *(id *)&v19[OBJC_IVAR____TtC9AskToCore9ATPayload_question];
  v9 = sub_236B166CC();

  if ((v9 & 1) == 0)
    goto LABEL_35;
  v10 = *(void **)(v2 + OBJC_IVAR____TtC9AskToCore9ATPayload_response);
  v11 = *(void **)&v19[OBJC_IVAR____TtC9AskToCore9ATPayload_response];
  if (!v10)
  {
    if (!v11)
      goto LABEL_32;
LABEL_35:

    goto LABEL_36;
  }
  if (!v11)
    goto LABEL_35;
  type metadata accessor for ATResponse();
  v12 = v11;
  v13 = v10;
  v14 = sub_236B166CC();

  if ((v14 & 1) == 0)
    goto LABEL_35;
LABEL_32:
  v15 = *(_QWORD *)(v2 + OBJC_IVAR____TtC9AskToCore9ATPayload_allResponses);
  v16 = *(_QWORD *)&v19[OBJC_IVAR____TtC9AskToCore9ATPayload_allResponses];
  if (!v15)
  {
    swift_bridgeObjectRetain();

    if (!v16)
    {
      v17 = 1;
      return v17 & 1;
    }
    swift_bridgeObjectRelease();
    goto LABEL_36;
  }
  if (!v16)
    goto LABEL_35;
  swift_bridgeObjectRetain_n();
  swift_bridgeObjectRetain();
  v17 = sub_236B04234(v15, v16, (uint64_t (*)(_QWORD))type metadata accessor for ATResponse);
  swift_bridgeObjectRelease_n();
  swift_bridgeObjectRelease();

  return v17 & 1;
}

uint64_t ATPayload.hash.getter()
{
  uint64_t v0;
  uint64_t v1;
  id v2;
  void *v3;
  id v4;
  unint64_t v5;
  _OWORD v7[4];
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  uint64_t v13;

  v1 = v0;
  sub_236B1696C();
  sub_236B1693C();
  if (*(_QWORD *)(v0 + OBJC_IVAR____TtC9AskToCore9ATPayload_clientBundleIdentifier + 8))
  {
    sub_236B16930();
    swift_bridgeObjectRetain();
    sub_236B16588();
    swift_bridgeObjectRelease();
  }
  else
  {
    sub_236B16930();
  }
  if (*(_BYTE *)(v0 + OBJC_IVAR____TtC9AskToCore9ATPayload_clientAdamIdentifier + 8) == 1)
  {
    sub_236B16930();
  }
  else
  {
    sub_236B16930();
    sub_236B16948();
  }
  swift_bridgeObjectRetain();
  sub_236B16588();
  swift_bridgeObjectRelease();
  sub_236B1693C();
  sub_236B16930();
  v2 = *(id *)(v0 + OBJC_IVAR____TtC9AskToCore9ATPayload_question);
  sub_236B166D8();

  v3 = *(void **)(v1 + OBJC_IVAR____TtC9AskToCore9ATPayload_response);
  sub_236B16930();
  if (v3)
  {
    v4 = v3;
    sub_236B166D8();

  }
  v5 = *(_QWORD *)(v1 + OBJC_IVAR____TtC9AskToCore9ATPayload_allResponses);
  sub_236B16930();
  if (v5)
  {
    swift_bridgeObjectRetain();
    sub_236B04520((uint64_t)v7, v5);
    swift_bridgeObjectRelease();
  }
  v11 = v7[2];
  v12 = v7[3];
  v13 = v8;
  v9 = v7[0];
  v10 = v7[1];
  return sub_236B16954();
}

uint64_t ATPayload.description.getter()
{
  uint64_t v0;
  uint64_t v1;
  id v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v1 = v0;
  sub_236B16738();
  swift_getObjectType();
  __swift_instantiateConcreteTypeFromMangledName(&qword_25643AD80);
  sub_236B1657C();
  sub_236B16594();
  swift_bridgeObjectRelease();
  sub_236B16594();
  sub_236B16894();
  sub_236B16594();
  swift_bridgeObjectRelease();
  sub_236B16594();
  swift_bridgeObjectRetain();
  sub_236B16594();
  swift_bridgeObjectRelease();
  sub_236B16594();
  sub_236B16894();
  sub_236B16594();
  swift_bridgeObjectRelease();
  sub_236B16594();
  swift_bridgeObjectRetain();
  sub_236B16594();
  swift_bridgeObjectRelease();
  sub_236B16594();
  sub_236B16894();
  sub_236B16594();
  swift_bridgeObjectRelease();
  sub_236B16594();
  sub_236B16594();
  swift_bridgeObjectRelease();
  sub_236B16594();
  v2 = *(id *)(v0 + OBJC_IVAR____TtC9AskToCore9ATPayload_question);
  v3 = objc_msgSend(v2, sel_description);
  sub_236B1654C();

  sub_236B16594();
  swift_bridgeObjectRelease();
  sub_236B16594();
  if (*(_QWORD *)(v1 + OBJC_IVAR____TtC9AskToCore9ATPayload_response))
    ATResponse.description.getter();
  sub_236B16594();
  swift_bridgeObjectRelease();
  sub_236B16594();
  v4 = *(_QWORD *)(v1 + OBJC_IVAR____TtC9AskToCore9ATPayload_allResponses);
  if (v4)
    v5 = v4;
  else
    v5 = MEMORY[0x24BEE4AF8];
  v6 = type metadata accessor for ATResponse();
  swift_bridgeObjectRetain();
  MEMORY[0x23B7FBC40](v5, v6);
  sub_236B16594();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_236B16594();
  return 0;
}

id ATPayload.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

void ATPayload.init()()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

id ATPayload.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

void *sub_236B041E0@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v2;
  void *result;

  result = sub_236B047A0(a1);
  if (!v2)
    *a2 = result;
  return result;
}

uint64_t sub_236B04208(_QWORD *a1)
{
  return ATPayload.encode(to:)(a1);
}

id sub_236B04228(unint64_t a1, unint64_t a2)
{
  return sub_236B04234(a1, a2, (uint64_t (*)(_QWORD))type metadata accessor for ATAnswerChoice);
}

id sub_236B04234(unint64_t a1, unint64_t a2, uint64_t (*a3)(_QWORD))
{
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id result;
  void *v14;
  id v15;
  void *v16;
  char v17;
  unint64_t v18;
  uint64_t v19;
  unint64_t v20;
  id v21;
  void *v22;
  id v23;
  void *v24;
  unint64_t v26;
  unint64_t v27;
  void **v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  unint64_t v33;

  v4 = a2;
  v5 = a1;
  v6 = a1 >> 62;
  if (!(a1 >> 62))
  {
    v7 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
    v8 = a2 >> 62;
    if (!(a2 >> 62))
      goto LABEL_3;
LABEL_47:
    swift_bridgeObjectRetain();
    v32 = sub_236B16780();
    swift_bridgeObjectRelease();
    if (v7 == v32)
      goto LABEL_4;
LABEL_48:
    LOBYTE(v7) = 0;
    return (id)(v7 & 1);
  }
  swift_bridgeObjectRetain();
  v7 = sub_236B16780();
  swift_bridgeObjectRelease();
  v8 = (unint64_t)v4 >> 62;
  if ((unint64_t)v4 >> 62)
    goto LABEL_47;
LABEL_3:
  if (v7 != *(_QWORD *)((v4 & 0xFFFFFFFFFFFFF8) + 0x10))
    goto LABEL_48;
LABEL_4:
  if (!v7)
    goto LABEL_37;
  v9 = v5 & 0xFFFFFFFFFFFFFF8;
  if (v5 < 0)
    v9 = v5;
  if (!v6)
    v9 = (v5 & 0xFFFFFFFFFFFFFF8) + 32;
  v10 = v4 & 0xFFFFFFFFFFFFFF8;
  v11 = (v4 & 0xFFFFFFFFFFFFFF8) + 32;
  if (v4 < 0)
    v12 = v4;
  else
    v12 = v4 & 0xFFFFFFFFFFFFFF8;
  if (v8)
    v11 = v12;
  if (v9 == v11)
  {
LABEL_37:
    LOBYTE(v7) = 1;
    return (id)(v7 & 1);
  }
  if ((v7 & 0x8000000000000000) != 0)
    goto LABEL_54;
  v33 = v5 & 0xC000000000000001;
  if ((v5 & 0xC000000000000001) != 0)
    goto LABEL_55;
  for (result = *(id *)(v5 + 32); ; result = (id)MEMORY[0x23B7FBD78](0, v5))
  {
    v14 = result;
    if ((v4 & 0xC000000000000001) == 0)
      break;
    v15 = (id)MEMORY[0x23B7FBD78](0, v4);
LABEL_21:
    v16 = v15;
    a3 = (uint64_t (*)(_QWORD))a3(0);
    v17 = sub_236B166CC();

    if ((v17 & 1) == 0)
      goto LABEL_48;
    v18 = v7 - 1;
    if (v7 == 1)
      return (id)(v7 & 1);
    if (((v4 | v5) & 0xC000000000000001) != 0)
    {
      v19 = 0;
      v20 = v7 - 2;
      while (v18 != v19)
      {
        v7 = v19 + 1;
        if (v33)
          v21 = (id)MEMORY[0x23B7FBD78](v19 + 1, v5);
        else
          v21 = *(id *)(v5 + 40 + 8 * v19);
        v22 = v21;
        if ((v4 & 0xC000000000000001) != 0)
        {
          v23 = (id)MEMORY[0x23B7FBD78](v19 + 1, v4);
        }
        else
        {
          if (v7 >= *(_QWORD *)(v10 + 16))
            goto LABEL_53;
          v23 = *(id *)(v4 + 40 + 8 * v19);
        }
        v24 = v23;
        v7 = sub_236B166CC();

        if ((v7 & 1) != 0 && v20 != v19++)
          continue;
        return (id)(v7 & 1);
      }
      __break(1u);
    }
    else
    {
      v26 = *(_QWORD *)(v10 + 16);
      if (v26 <= 1)
        v26 = 1;
      v27 = v26 - 1;
      v28 = (void **)(v5 + 40);
      v10 = v4 + 40;
      while (v18)
      {
        if (!v27)
          goto LABEL_52;
        v30 = *v28++;
        v29 = v30;
        v31 = *(void **)v10;
        v10 += 8;
        v4 = v29;
        v5 = v31;
        v7 = sub_236B166CC();

        if ((v7 & 1) != 0)
        {
          --v27;
          if (--v18)
            continue;
        }
        return (id)(v7 & 1);
      }
    }
    __break(1u);
LABEL_52:
    __break(1u);
LABEL_53:
    __break(1u);
LABEL_54:
    __break(1u);
LABEL_55:
    ;
  }
  if (*(_QWORD *)(v10 + 16))
  {
    v15 = *(id *)(v4 + 32);
    goto LABEL_21;
  }
  __break(1u);
  return result;
}

void sub_236B04520(uint64_t a1, unint64_t a2)
{
  uint64_t v3;
  uint64_t i;
  void **v5;
  void *v6;
  id v7;

  if (a2 >> 62)
  {
    swift_bridgeObjectRetain();
    sub_236B16780();
    swift_bridgeObjectRelease();
    sub_236B16924();
    swift_bridgeObjectRetain();
    v3 = sub_236B16780();
    swift_bridgeObjectRelease();
    if (!v3)
      return;
  }
  else
  {
    sub_236B16924();
    v3 = *(_QWORD *)((a2 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (!v3)
      return;
  }
  if (v3 < 1)
  {
    __break(1u);
  }
  else if ((a2 & 0xC000000000000001) != 0)
  {
    for (i = 0; i != v3; ++i)
    {
      MEMORY[0x23B7FBD78](i, a2);
      sub_236B166D8();
      swift_unknownObjectRelease();
    }
  }
  else
  {
    v5 = (void **)(a2 + 32);
    do
    {
      v6 = *v5++;
      v7 = v6;
      sub_236B166D8();

      --v3;
    }
    while (v3);
  }
}

uint64_t sub_236B04634()
{
  unint64_t v0;

  v0 = sub_236B167BC();
  swift_bridgeObjectRelease();
  if (v0 >= 0xA)
    return 10;
  else
    return v0;
}

id sub_236B0467C(__int16 a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5, uint64_t a6, uint64_t a7, __int16 a8, char a9, uint64_t a10, uint64_t a11, uint64_t a12)
{
  objc_class *v19;
  _BYTE *v20;
  _QWORD *v21;
  char *v22;
  _QWORD *v23;
  objc_super v26;

  v19 = (objc_class *)type metadata accessor for ATPayload();
  v20 = objc_allocWithZone(v19);
  *(_WORD *)&v20[OBJC_IVAR____TtC9AskToCore9ATPayload_version] = a1;
  v21 = &v20[OBJC_IVAR____TtC9AskToCore9ATPayload_clientBundleIdentifier];
  *v21 = a2;
  v21[1] = a3;
  v22 = &v20[OBJC_IVAR____TtC9AskToCore9ATPayload_clientAdamIdentifier];
  *(_QWORD *)v22 = a4;
  v22[8] = a5 & 1;
  v23 = &v20[OBJC_IVAR____TtC9AskToCore9ATPayload_messageGUID];
  *v23 = a6;
  v23[1] = a7;
  *(_WORD *)&v20[OBJC_IVAR____TtC9AskToCore9ATPayload_rawRecipientGroup] = a8;
  v20[OBJC_IVAR____TtC9AskToCore9ATPayload_isForFamily] = a9;
  *(_QWORD *)&v20[OBJC_IVAR____TtC9AskToCore9ATPayload_question] = a10;
  *(_QWORD *)&v20[OBJC_IVAR____TtC9AskToCore9ATPayload_response] = a11;
  *(_QWORD *)&v20[OBJC_IVAR____TtC9AskToCore9ATPayload_allResponses] = a12;
  v26.receiver = v20;
  v26.super_class = v19;
  return objc_msgSendSuper2(&v26, sel_init);
}

void *sub_236B047A0(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  void *v7;
  __int16 v8;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  int v14;
  uint64_t v15;
  char v16;
  __int16 v17;
  uint64_t v18;
  int v19;
  int v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  int v26;
  uint64_t v27;
  char v28;
  uint64_t v29;

  v3 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_25643B520);
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v6 = (char *)&v18 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_236B04C3C();
  sub_236B16978();
  if (v1)
  {
    __swift_destroy_boxed_opaque_existential_0((uint64_t)a1);
  }
  else
  {
    LOBYTE(v29) = 0;
    v8 = sub_236B16828();
    LOBYTE(v29) = 1;
    v10 = sub_236B167C8();
    v12 = v11;
    LOBYTE(v29) = 2;
    v13 = sub_236B167F8();
    v26 = v14;
    v27 = v13;
    LOBYTE(v29) = 5;
    v24 = sub_236B16804();
    v25 = v15;
    type metadata accessor for ATQuestion();
    v28 = 6;
    sub_236B05140((unint64_t *)&unk_25643B7F0, 255, (uint64_t (*)(uint64_t))type metadata accessor for ATQuestion, (uint64_t)&protocol conformance descriptor for ATQuestion);
    sub_236B1681C();
    v23 = v29;
    type metadata accessor for ATResponse();
    v28 = 7;
    sub_236B05140(&qword_25643B530, 255, (uint64_t (*)(uint64_t))type metadata accessor for ATResponse, (uint64_t)&protocol conformance descriptor for ATResponse);
    sub_236B167E0();
    v22 = v29;
    __swift_instantiateConcreteTypeFromMangledName(&qword_25643B4C0);
    v28 = 8;
    sub_236B05180(&qword_25643B538, &qword_25643B530, (uint64_t)&protocol conformance descriptor for ATResponse, MEMORY[0x24BEE12D0]);
    sub_236B167E0();
    v21 = v29;
    v28 = 9;
    sub_236B05208();
    sub_236B1681C();
    v20 = (unsigned __int16)v29;
    LOBYTE(v29) = 3;
    v19 = sub_236B167EC();
    LOBYTE(v29) = 4;
    v16 = sub_236B167D4();
    if ((v19 & 0x10000) != 0)
      v17 = v20;
    else
      v17 = v19;
    v7 = sub_236B0467C(v8, v10, v12, v27, v26 & 1, v24, v25, v17, (v16 == 2) | (v16 & 1), v23, v22, v21);
    (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
    __swift_destroy_boxed_opaque_existential_0((uint64_t)a1);
  }
  return v7;
}

unint64_t sub_236B04C3C()
{
  unint64_t result;

  result = qword_25643B4A8;
  if (!qword_25643B4A8)
  {
    result = MEMORY[0x23B7FC3FC](&unk_236B17C54, &type metadata for ATPayload.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_25643B4A8);
  }
  return result;
}

uint64_t __swift_instantiateConcreteTypeFromMangledNameAbstract(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x23B7FC3F0](255, (char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

unint64_t sub_236B04CC4()
{
  unint64_t result;

  result = qword_25643B4D0;
  if (!qword_25643B4D0)
  {
    result = MEMORY[0x23B7FC3FC](&protocol conformance descriptor for ATRecipientGroup, &type metadata for ATRecipientGroup);
    atomic_store(result, (unint64_t *)&qword_25643B4D0);
  }
  return result;
}

id sub_236B04D08()
{
  void *v0;
  void *v1;
  id v2;
  id v3;
  id v4;
  id v6[2];

  v6[1] = *(id *)MEMORY[0x24BDAC8D0];
  v1 = (void *)sub_236B1642C();
  v6[0] = 0;
  v2 = objc_msgSend(v0, sel_initForReadingFromData_error_, v1, v6);

  if (v2)
  {
    v3 = v6[0];
  }
  else
  {
    v4 = v6[0];
    sub_236B16408();

    swift_willThrow();
  }
  return v2;
}

uint64_t type metadata accessor for ATPayload()
{
  return objc_opt_self();
}

uint64_t sub_236B04DE4(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_25643B4F8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_236B04E2C(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_25643B4F8);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_236B04E6C(uint64_t a1, unint64_t *a2)
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

uint64_t sub_236B04EA4(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t result;

  *(_QWORD *)(a1 + 16) = sub_236B05140(&qword_25643AD88, a2, (uint64_t (*)(uint64_t))type metadata accessor for ATPayload, (uint64_t)&protocol conformance descriptor for ATPayload);
  result = sub_236B05140(&qword_25643B4F0, v3, (uint64_t (*)(uint64_t))type metadata accessor for ATPayload, (uint64_t)&protocol conformance descriptor for ATPayload);
  *(_QWORD *)(a1 + 24) = result;
  return result;
}

uint64_t method lookup function for ATPayload()
{
  return swift_lookUpClassMethod();
}

uint64_t getEnumTagSinglePayload for ATPayload.CodingKeys(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int v6;
  BOOL v7;
  int v8;

  if (!a2)
    return 0;
  if (a2 < 0xF7)
    goto LABEL_17;
  if (a2 + 9 >= 0xFFFF00)
    v2 = 4;
  else
    v2 = 2;
  if ((a2 + 9) >> 8 < 0xFF)
    v3 = 1;
  else
    v3 = v2;
  if (v3 == 4)
  {
    v4 = *(_DWORD *)(a1 + 1);
    if (v4)
      return (*a1 | (v4 << 8)) - 9;
  }
  else
  {
    if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
      return (*a1 | (v4 << 8)) - 9;
    }
    v4 = a1[1];
    if (a1[1])
      return (*a1 | (v4 << 8)) - 9;
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 0xA;
  v8 = v6 - 10;
  if (!v7)
    v8 = -1;
  return (v8 + 1);
}

uint64_t storeEnumTagSinglePayload for ATPayload.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 9 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 9) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xF7)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xF6)
    return ((uint64_t (*)(void))((char *)&loc_236B04FE8 + 4 * byte_236B17AB1[v4]))();
  *a1 = a2 + 9;
  return ((uint64_t (*)(void))((char *)sub_236B0501C + 4 * byte_236B17AAC[v4]))();
}

uint64_t sub_236B0501C(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_236B05024(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x236B0502CLL);
  return result;
}

uint64_t sub_236B05038(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x236B05040);
  *(_BYTE *)result = a2 + 9;
  return result;
}

uint64_t sub_236B05044(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_236B0504C(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for ATPayload.CodingKeys()
{
  return &type metadata for ATPayload.CodingKeys;
}

unint64_t sub_236B0506C()
{
  unint64_t result;

  result = qword_25643B508;
  if (!qword_25643B508)
  {
    result = MEMORY[0x23B7FC3FC](&unk_236B17C2C, &type metadata for ATPayload.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_25643B508);
  }
  return result;
}

unint64_t sub_236B050B4()
{
  unint64_t result;

  result = qword_25643B510;
  if (!qword_25643B510)
  {
    result = MEMORY[0x23B7FC3FC](&unk_236B17B64, &type metadata for ATPayload.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_25643B510);
  }
  return result;
}

unint64_t sub_236B050FC()
{
  unint64_t result;

  result = qword_25643B518;
  if (!qword_25643B518)
  {
    result = MEMORY[0x23B7FC3FC](&unk_236B17B8C, &type metadata for ATPayload.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_25643B518);
  }
  return result;
}

uint64_t sub_236B05140(unint64_t *a1, uint64_t a2, uint64_t (*a3)(uint64_t), uint64_t a4)
{
  uint64_t result;
  uint64_t v7;

  result = *a1;
  if (!result)
  {
    v7 = a3(a2);
    result = MEMORY[0x23B7FC3FC](a4, v7);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_236B05180(unint64_t *a1, unint64_t *a2, uint64_t a3, uint64_t a4)
{
  uint64_t result;
  uint64_t v9;
  uint64_t v10;

  result = *a1;
  if (!result)
  {
    v9 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_25643B4C0);
    v10 = sub_236B05140(a2, 255, (uint64_t (*)(uint64_t))type metadata accessor for ATResponse, a3);
    result = MEMORY[0x23B7FC3FC](a4, v9, &v10);
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_236B05208()
{
  unint64_t result;

  result = qword_25643B540;
  if (!qword_25643B540)
  {
    result = MEMORY[0x23B7FC3FC](&protocol conformance descriptor for ATRecipientGroup, &type metadata for ATRecipientGroup);
    atomic_store(result, (unint64_t *)&qword_25643B540);
  }
  return result;
}

unint64_t sub_236B0524C()
{
  unint64_t result;

  result = qword_25643B548;
  if (!qword_25643B548)
  {
    result = MEMORY[0x23B7FC3FC](&unk_236B18210, &type metadata for DictionaryRepresentableError);
    atomic_store(result, (unint64_t *)&qword_25643B548);
  }
  return result;
}

uint64_t ATDaemonConnectionManager.__allocating_init()()
{
  uint64_t v0;

  v0 = swift_allocObject();
  ATDaemonConnectionManager.init()();
  return v0;
}

uint64_t ATDaemonConnectionManager.init()()
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
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;
  void *v14;
  uint64_t v15;
  void *v16;
  id v17;
  uint64_t v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t);
  void *v22;
  uint64_t (*v23)();
  uint64_t v24;

  v1 = v0;
  *(_BYTE *)(v0 + 24) = 0;
  if (qword_25643AC70 != -1)
    swift_once();
  v2 = sub_236B164F8();
  __swift_project_value_buffer(v2, (uint64_t)qword_25643DF30);
  v3 = sub_236B164E0();
  v4 = sub_236B1669C();
  if (os_log_type_enabled(v3, v4))
  {
    v5 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_236AF7000, v3, v4, "Daemon connection manager initialized", v5, 2u);
    MEMORY[0x23B7FC480](v5, -1, -1);
  }

  v6 = objc_allocWithZone(MEMORY[0x24BDD1988]);
  v7 = (void *)sub_236B16540();
  v8 = objc_msgSend(v6, sel_initWithMachServiceName_options_, v7, 0);

  *(_QWORD *)(v1 + 16) = v8;
  v9 = objc_msgSend((id)objc_opt_self(), sel_interfaceWithProtocol_, &unk_256441040);
  objc_msgSend(v8, sel_setRemoteObjectInterface_, v9);
  v10 = swift_allocObject();
  swift_weakInit();
  v23 = sub_236B070DC;
  v24 = v10;
  v11 = MEMORY[0x24BDAC760];
  v19 = MEMORY[0x24BDAC760];
  v20 = 1107296256;
  v21 = sub_236B0557C;
  v22 = &block_descriptor;
  v12 = _Block_copy(&v19);
  v13 = v8;
  swift_release();
  objc_msgSend(v13, sel_setInterruptionHandler_, v12);
  _Block_release(v12);

  v14 = *(void **)(v1 + 16);
  v15 = swift_allocObject();
  swift_weakInit();
  v23 = sub_236B07114;
  v24 = v15;
  v19 = v11;
  v20 = 1107296256;
  v21 = sub_236B0557C;
  v22 = &block_descriptor_4;
  v16 = _Block_copy(&v19);
  v17 = v14;
  swift_release();
  objc_msgSend(v17, sel_setInvalidationHandler_, v16);
  _Block_release(v16);

  return v1;
}

uint64_t sub_236B0557C(uint64_t a1)
{
  void (*v1)(uint64_t);
  uint64_t v2;

  v1 = *(void (**)(uint64_t))(a1 + 32);
  v2 = swift_retain();
  v1(v2);
  return swift_release();
}

uint64_t sub_236B055A8(uint64_t a1, const char *a2)
{
  uint64_t v3;
  NSObject *v4;
  os_log_type_t v5;
  uint8_t *v6;
  uint64_t result;

  if (qword_25643AC70 != -1)
    swift_once();
  v3 = sub_236B164F8();
  __swift_project_value_buffer(v3, (uint64_t)qword_25643DF30);
  v4 = sub_236B164E0();
  v5 = sub_236B16690();
  if (os_log_type_enabled(v4, v5))
  {
    v6 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_236AF7000, v4, v5, a2, v6, 2u);
    MEMORY[0x23B7FC480](v6, -1, -1);
  }

  swift_beginAccess();
  result = swift_weakLoadStrong();
  if (result)
  {
    *(_BYTE *)(result + 24) = 0;
    return swift_release();
  }
  return result;
}

uint64_t ATDaemonConnectionManager.deinit()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  NSObject *v3;
  os_log_type_t v4;
  uint8_t *v5;

  v1 = v0;
  if (qword_25643AC70 != -1)
    swift_once();
  v2 = sub_236B164F8();
  __swift_project_value_buffer(v2, (uint64_t)qword_25643DF30);
  v3 = sub_236B164E0();
  v4 = sub_236B1669C();
  if (os_log_type_enabled(v3, v4))
  {
    v5 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_236AF7000, v3, v4, "Daemon connection manager deinitialized", v5, 2u);
    MEMORY[0x23B7FC480](v5, -1, -1);
  }

  ATDaemonConnectionManager.disconnectIfNecessary()();
  return v1;
}

Swift::Void __swiftcall ATDaemonConnectionManager.disconnectIfNecessary()()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  NSObject *v3;
  os_log_type_t v4;
  uint8_t *v5;
  uint64_t v6;
  int v7;
  NSObject *v8;
  os_log_type_t v9;
  _BOOL4 v10;
  uint8_t *v11;
  uint8_t *v12;
  uint64_t v13;

  v1 = v0;
  if (qword_25643AC70 != -1)
    swift_once();
  v2 = sub_236B164F8();
  __swift_project_value_buffer(v2, (uint64_t)qword_25643DF30);
  v3 = sub_236B164E0();
  v4 = sub_236B1669C();
  if (os_log_type_enabled(v3, v4))
  {
    v5 = (uint8_t *)swift_slowAlloc();
    v6 = swift_slowAlloc();
    v13 = v6;
    *(_DWORD *)v5 = 136315138;
    sub_236AFB308(0xD000000000000017, 0x8000000236B19CC0, &v13);
    sub_236B166FC();
    _os_log_impl(&dword_236AF7000, v3, v4, "%s called", v5, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x23B7FC480](v6, -1, -1);
    MEMORY[0x23B7FC480](v5, -1, -1);
  }

  v7 = *(unsigned __int8 *)(v0 + 24);
  v8 = sub_236B164E0();
  v9 = sub_236B1669C();
  v10 = os_log_type_enabled(v8, v9);
  if (v7 == 1)
  {
    if (v10)
    {
      v11 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v11 = 0;
      _os_log_impl(&dword_236AF7000, v8, v9, "Disconnecting from daemon", v11, 2u);
      MEMORY[0x23B7FC480](v11, -1, -1);
    }

    *(_BYTE *)(v1 + 24) = 0;
    objc_msgSend(*(id *)(v1 + 16), sel_invalidate);
  }
  else
  {
    if (v10)
    {
      v12 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v12 = 0;
      _os_log_impl(&dword_236AF7000, v8, v9, "Skipping invalidation because the connection is already invalid", v12, 2u);
      MEMORY[0x23B7FC480](v12, -1, -1);
    }

  }
}

uint64_t ATDaemonConnectionManager.__deallocating_deinit()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  NSObject *v3;
  os_log_type_t v4;
  uint8_t *v5;

  v1 = v0;
  if (qword_25643AC70 != -1)
    swift_once();
  v2 = sub_236B164F8();
  __swift_project_value_buffer(v2, (uint64_t)qword_25643DF30);
  v3 = sub_236B164E0();
  v4 = sub_236B1669C();
  if (os_log_type_enabled(v3, v4))
  {
    v5 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_236AF7000, v3, v4, "Daemon connection manager deinitialized", v5, 2u);
    MEMORY[0x23B7FC480](v5, -1, -1);
  }

  ATDaemonConnectionManager.disconnectIfNecessary()();
  return swift_deallocClassInstance();
}

void sub_236B05AD4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  NSObject *v3;
  os_log_type_t v4;
  uint8_t *v5;
  uint64_t v6;
  char v7;
  NSObject *v8;
  os_log_type_t v9;
  _BOOL4 v10;
  uint8_t *v11;
  uint8_t *v12;
  uint64_t v13;

  v1 = v0;
  if (qword_25643AC70 != -1)
    swift_once();
  v2 = sub_236B164F8();
  __swift_project_value_buffer(v2, (uint64_t)qword_25643DF30);
  v3 = sub_236B164E0();
  v4 = sub_236B1669C();
  if (os_log_type_enabled(v3, v4))
  {
    v5 = (uint8_t *)swift_slowAlloc();
    v6 = swift_slowAlloc();
    v13 = v6;
    *(_DWORD *)v5 = 136315138;
    sub_236AFB308(0xD000000000000014, 0x8000000236B19E10, &v13);
    sub_236B166FC();
    _os_log_impl(&dword_236AF7000, v3, v4, "%s called", v5, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x23B7FC480](v6, -1, -1);
    MEMORY[0x23B7FC480](v5, -1, -1);
  }

  v7 = *(_BYTE *)(v0 + 24);
  v8 = sub_236B164E0();
  v9 = sub_236B1669C();
  v10 = os_log_type_enabled(v8, v9);
  if ((v7 & 1) != 0)
  {
    if (v10)
    {
      v11 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v11 = 0;
      _os_log_impl(&dword_236AF7000, v8, v9, "Skipping resume because there's already a connection", v11, 2u);
      MEMORY[0x23B7FC480](v11, -1, -1);
    }

  }
  else
  {
    if (v10)
    {
      v12 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v12 = 0;
      _os_log_impl(&dword_236AF7000, v8, v9, "Connecting to daemon", v12, 2u);
      MEMORY[0x23B7FC480](v12, -1, -1);
    }

    *(_BYTE *)(v1 + 24) = 1;
    objc_msgSend(*(id *)(v1 + 16), sel_resume);
  }
}

uint64_t sub_236B05D28()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(v1 + 24) = v0;
  return swift_task_switch();
}

uint64_t sub_236B05D40()
{
  uint64_t v0;
  uint64_t v1;
  NSObject *v2;
  os_log_type_t v3;
  uint8_t *v4;
  _QWORD *v5;

  if (qword_25643AC70 != -1)
    swift_once();
  v1 = sub_236B164F8();
  __swift_project_value_buffer(v1, (uint64_t)qword_25643DF30);
  v2 = sub_236B164E0();
  v3 = sub_236B1669C();
  if (os_log_type_enabled(v2, v3))
  {
    v4 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_236AF7000, v2, v3, "Obtaining synchronous daemon proxy", v4, 2u);
    MEMORY[0x23B7FC480](v4, -1, -1);
  }

  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 32) = v5;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25643B598);
  *v5 = v0;
  v5[1] = sub_236B05E84;
  return sub_236B168B8();
}

uint64_t sub_236B05E84()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 40) = v0;
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_236B05EE8()
{
  uint64_t v0;

  return (*(uint64_t (**)(_QWORD))(v0 + 8))(*(_QWORD *)(v0 + 16));
}

uint64_t sub_236B05EF4()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_236B05F00(uint64_t a1, uint64_t a2)
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  NSObject *v6;
  os_log_type_t v7;
  uint8_t *v8;
  uint64_t v10;
  _QWORD *v11;
  uint64_t v12;
  _QWORD aBlock[6];

  v2 = *(void **)(a2 + 16);
  aBlock[4] = sub_236B060FC;
  aBlock[5] = 0;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_236B062BC;
  aBlock[3] = &block_descriptor_20;
  v3 = _Block_copy(aBlock);
  v4 = objc_msgSend(v2, sel_remoteObjectProxyWithErrorHandler_, v3);
  _Block_release(v3);
  sub_236B16714();
  swift_unknownObjectRelease();
  __swift_instantiateConcreteTypeFromMangledName(&qword_25643B598);
  if ((swift_dynamicCast() & 1) != 0)
  {
    if (qword_25643AC70 != -1)
      swift_once();
    v5 = sub_236B164F8();
    __swift_project_value_buffer(v5, (uint64_t)qword_25643DF30);
    v6 = sub_236B164E0();
    v7 = sub_236B1669C();
    if (os_log_type_enabled(v6, v7))
    {
      v8 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v8 = 0;
      _os_log_impl(&dword_236AF7000, v6, v7, "Successfully obtained synchronous daemon proxy", v8, 2u);
      MEMORY[0x23B7FC480](v8, -1, -1);
    }

    aBlock[0] = v12;
    __swift_instantiateConcreteTypeFromMangledName(&qword_25643B5A8);
    return sub_236B16654();
  }
  else
  {
    sub_236B073EC();
    v10 = swift_allocError();
    *v11 = 0;
    aBlock[0] = v10;
    __swift_instantiateConcreteTypeFromMangledName(&qword_25643B5A8);
    return sub_236B16648();
  }
}

void sub_236B060FC(void *a1)
{
  uint64_t v2;
  id v3;
  id v4;
  os_log_type_t v5;
  uint8_t *v6;
  _QWORD *v7;
  id v8;
  NSObject *oslog;
  uint64_t v10;

  if (qword_25643AC70 != -1)
    swift_once();
  v2 = sub_236B164F8();
  __swift_project_value_buffer(v2, (uint64_t)qword_25643DF30);
  v3 = a1;
  v4 = a1;
  oslog = sub_236B164E0();
  v5 = sub_236B16690();
  if (os_log_type_enabled(oslog, v5))
  {
    v6 = (uint8_t *)swift_slowAlloc();
    v7 = (_QWORD *)swift_slowAlloc();
    *(_DWORD *)v6 = 138412290;
    v8 = a1;
    v10 = _swift_stdlib_bridgeErrorToNSError();
    sub_236B166FC();
    *v7 = v10;

    _os_log_impl(&dword_236AF7000, oslog, v5, "Error obtaining remote object proxy: %@", v6, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_25643B498);
    swift_arrayDestroy();
    MEMORY[0x23B7FC480](v7, -1, -1);
    MEMORY[0x23B7FC480](v6, -1, -1);
  }
  else
  {

  }
}

void sub_236B062BC(uint64_t a1, void *a2)
{
  void (*v3)(void);
  id v4;

  v3 = *(void (**)(void))(a1 + 32);
  swift_retain();
  v4 = a2;
  v3();
  swift_release();

}

uint64_t ATDaemonConnectionManager.send(question:to:)(uint64_t a1, __int16 a2)
{
  uint64_t v2;
  uint64_t v3;

  *(_WORD *)(v3 + 176) = a2;
  *(_QWORD *)(v3 + 136) = a1;
  *(_QWORD *)(v3 + 144) = v2;
  return swift_task_switch();
}

uint64_t sub_236B06328()
{
  _QWORD *v0;
  uint64_t v1;
  NSObject *v2;
  os_log_type_t v3;
  uint8_t *v4;
  uint64_t v5;
  _QWORD *v6;
  uint64_t v8;

  if (qword_25643AC70 != -1)
    swift_once();
  v1 = sub_236B164F8();
  __swift_project_value_buffer(v1, (uint64_t)qword_25643DF30);
  v2 = sub_236B164E0();
  v3 = sub_236B16684();
  if (os_log_type_enabled(v2, v3))
  {
    v4 = (uint8_t *)swift_slowAlloc();
    v5 = swift_slowAlloc();
    v8 = v5;
    *(_DWORD *)v4 = 136315138;
    v0[16] = sub_236AFB308(0xD000000000000012, 0x8000000236B19D00, &v8);
    sub_236B166FC();
    _os_log_impl(&dword_236AF7000, v2, v3, "%s called", v4, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x23B7FC480](v5, -1, -1);
    MEMORY[0x23B7FC480](v4, -1, -1);
  }

  sub_236B05AD4();
  v6 = (_QWORD *)swift_task_alloc();
  v0[19] = v6;
  *v6 = v0;
  v6[1] = sub_236B064E0;
  v6[3] = v0[18];
  return swift_task_switch();
}

uint64_t sub_236B064E0(uint64_t a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v3;

  v3 = *v2;
  *(_QWORD *)(v3 + 160) = a1;
  swift_task_dealloc();
  if (v1)
    return (*(uint64_t (**)(void))(v3 + 8))();
  else
    return swift_task_switch();
}

uint64_t sub_236B06554()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;

  v1 = *(void **)(v0 + 160);
  v2 = *(__int16 *)(v0 + 176);
  v3 = *(_QWORD *)(v0 + 136);
  *(_QWORD *)(v0 + 56) = v0 + 120;
  *(_QWORD *)(v0 + 16) = v0;
  *(_QWORD *)(v0 + 24) = sub_236B06600;
  v4 = swift_continuation_init();
  *(_QWORD *)(v0 + 80) = MEMORY[0x24BDAC760];
  v5 = (_QWORD *)(v0 + 80);
  v5[1] = 0x40000000;
  v5[2] = sub_236B066DC;
  v5[3] = &block_descriptor_6;
  v5[4] = v4;
  objc_msgSend(v1, sel_sendWithQuestion_to_completionHandler_, v3, v2, v5);
  return swift_continuation_await();
}

uint64_t sub_236B06600()
{
  uint64_t v0;

  *(_QWORD *)(*(_QWORD *)v0 + 168) = *(_QWORD *)(*(_QWORD *)v0 + 48);
  return swift_task_switch();
}

uint64_t sub_236B06660()
{
  uint64_t v0;

  swift_unknownObjectRelease();
  return (*(uint64_t (**)(_QWORD))(v0 + 8))(*(_QWORD *)(v0 + 120));
}

uint64_t sub_236B06698()
{
  uint64_t v0;

  swift_willThrow();
  swift_unknownObjectRelease();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_236B066DC(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v3;
  _QWORD *v5;
  id v6;
  uint64_t v8;
  uint64_t v9;

  v3 = *(_QWORD *)(a1 + 32);
  if (a3)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_25643B588);
    swift_allocError();
    *v5 = a3;
    v6 = a3;
    return swift_continuation_throwingResumeWithError();
  }
  else
  {
    if (a2)
      v8 = sub_236B1660C();
    else
      v8 = 0;
    v9 = v8;
    sub_236B0739C((uint64_t)&v9, *(_QWORD *)(*(_QWORD *)(v3 + 64) + 40));
    return swift_continuation_throwingResume();
  }
}

uint64_t ATDaemonConnectionManager.sendResponse(_:to:)(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v3;

  v3[17] = a2;
  v3[18] = v2;
  v3[16] = a1;
  return swift_task_switch();
}

uint64_t sub_236B067B0()
{
  _QWORD *v0;
  uint64_t v1;
  NSObject *v2;
  os_log_type_t v3;
  uint8_t *v4;
  uint64_t v5;
  _QWORD *v6;
  uint64_t v8;

  if (qword_25643AC70 != -1)
    swift_once();
  v1 = sub_236B164F8();
  __swift_project_value_buffer(v1, (uint64_t)qword_25643DF30);
  v2 = sub_236B164E0();
  v3 = sub_236B16684();
  if (os_log_type_enabled(v2, v3))
  {
    v4 = (uint8_t *)swift_slowAlloc();
    v5 = swift_slowAlloc();
    v8 = v5;
    *(_DWORD *)v4 = 136315138;
    v0[15] = sub_236AFB308(0xD000000000000013, 0x8000000236B19D40, &v8);
    sub_236B166FC();
    _os_log_impl(&dword_236AF7000, v2, v3, "%s called", v4, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x23B7FC480](v5, -1, -1);
    MEMORY[0x23B7FC480](v4, -1, -1);
  }

  sub_236B05AD4();
  v6 = (_QWORD *)swift_task_alloc();
  v0[19] = v6;
  *v6 = v0;
  v6[1] = sub_236B06968;
  v6[3] = v0[18];
  return swift_task_switch();
}

uint64_t sub_236B06968(uint64_t a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v3;

  v3 = *v2;
  *(_QWORD *)(v3 + 160) = a1;
  swift_task_dealloc();
  if (v1)
    return (*(uint64_t (**)(void))(v3 + 8))();
  else
    return swift_task_switch();
}

uint64_t sub_236B069DC()
{
  _QWORD *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;

  v1 = (void *)v0[20];
  v2 = v0[16];
  v3 = sub_236B16600();
  v0[21] = v3;
  v0[2] = v0;
  v0[3] = sub_236B06A90;
  v4 = swift_continuation_init();
  v0[10] = MEMORY[0x24BDAC760];
  v5 = v0 + 10;
  v5[1] = 0x40000000;
  v5[2] = sub_236B06B74;
  v5[3] = &block_descriptor_9;
  v5[4] = v4;
  objc_msgSend(v1, sel_sendResponse_to_completionHandler_, v2, v3, v5);
  return swift_continuation_await();
}

uint64_t sub_236B06A90()
{
  uint64_t v0;

  *(_QWORD *)(*(_QWORD *)v0 + 176) = *(_QWORD *)(*(_QWORD *)v0 + 48);
  return swift_task_switch();
}

uint64_t sub_236B06AF0()
{
  uint64_t v0;
  void *v1;

  v1 = *(void **)(v0 + 168);
  swift_unknownObjectRelease();

  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_236B06B28()
{
  uint64_t v0;
  void *v1;

  v1 = *(void **)(v0 + 168);
  swift_willThrow();
  swift_unknownObjectRelease();

  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_236B06B74(uint64_t a1, void *a2)
{
  _QWORD *v3;
  id v4;

  if (!a2)
    return swift_continuation_throwingResume();
  __swift_instantiateConcreteTypeFromMangledName(&qword_25643B588);
  swift_allocError();
  *v3 = a2;
  v4 = a2;
  return swift_continuation_throwingResumeWithError();
}

uint64_t ATDaemonConnectionManager.sendResponsePayloadViaIDS(_:to:)(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  _QWORD *v6;

  v6 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v3 + 16) = v6;
  *v6 = v3;
  v6[1] = sub_236B06C58;
  v6[17] = a2;
  v6[18] = v2;
  v6[16] = a1;
  return swift_task_switch();
}

uint64_t sub_236B06C58()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t ATDaemonConnectionManager.screenTimeDidReceiveAnswer(_:forRequestWithID:responderDSID:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;
  _QWORD *v6;

  v6[20] = a5;
  v6[21] = v5;
  v6[18] = a3;
  v6[19] = a4;
  v6[16] = a1;
  v6[17] = a2;
  return swift_task_switch();
}

uint64_t sub_236B06CC0()
{
  _QWORD *v0;
  uint64_t v1;
  NSObject *v2;
  os_log_type_t v3;
  uint8_t *v4;
  uint64_t v5;
  _QWORD *v6;
  uint64_t v8;

  if (qword_25643AC70 != -1)
    swift_once();
  v1 = sub_236B164F8();
  __swift_project_value_buffer(v1, (uint64_t)qword_25643DF30);
  v2 = sub_236B164E0();
  v3 = sub_236B1669C();
  if (os_log_type_enabled(v2, v3))
  {
    v4 = (uint8_t *)swift_slowAlloc();
    v5 = swift_slowAlloc();
    v8 = v5;
    *(_DWORD *)v4 = 136315138;
    v0[15] = sub_236AFB308(0xD00000000000003DLL, 0x8000000236B19D60, &v8);
    sub_236B166FC();
    _os_log_impl(&dword_236AF7000, v2, v3, "%s called", v4, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x23B7FC480](v5, -1, -1);
    MEMORY[0x23B7FC480](v4, -1, -1);
  }

  sub_236B05AD4();
  v6 = (_QWORD *)swift_task_alloc();
  v0[22] = v6;
  *v6 = v0;
  v6[1] = sub_236B06E78;
  v6[3] = v0[21];
  return swift_task_switch();
}

uint64_t sub_236B06E78(uint64_t a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v3;

  v3 = *v2;
  *(_QWORD *)(v3 + 184) = a1;
  swift_task_dealloc();
  if (v1)
    return (*(uint64_t (**)(void))(v3 + 8))();
  else
    return swift_task_switch();
}

uint64_t sub_236B06EEC()
{
  _QWORD *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;

  v1 = (void *)v0[23];
  v2 = v0[16];
  v3 = sub_236B16540();
  v0[24] = v3;
  v4 = sub_236B16540();
  v0[25] = v4;
  v0[2] = v0;
  v0[3] = sub_236B06FC0;
  v5 = swift_continuation_init();
  v0[10] = MEMORY[0x24BDAC760];
  v6 = v0 + 10;
  v6[1] = 0x40000000;
  v6[2] = sub_236B06B74;
  v6[3] = &block_descriptor_14;
  v6[4] = v5;
  objc_msgSend(v1, sel_screenTimeDidReceiveAnswer_forRequestWithID_responderDSID_completionHandler_, v2, v3, v4, v6);
  return swift_continuation_await();
}

uint64_t sub_236B06FC0()
{
  uint64_t v0;

  *(_QWORD *)(*(_QWORD *)v0 + 208) = *(_QWORD *)(*(_QWORD *)v0 + 48);
  return swift_task_switch();
}

uint64_t sub_236B07020()
{
  uint64_t v0;
  void *v1;
  void *v2;

  v1 = *(void **)(v0 + 192);
  v2 = *(void **)(v0 + 200);
  swift_unknownObjectRelease();

  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_236B07060()
{
  uint64_t v0;
  void *v1;
  void *v2;

  v1 = *(void **)(v0 + 200);
  v2 = *(void **)(v0 + 192);
  swift_willThrow();
  swift_unknownObjectRelease();

  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_236B070B8()
{
  swift_weakDestroy();
  return swift_deallocObject();
}

uint64_t sub_236B070DC()
{
  uint64_t v0;

  return sub_236B055A8(v0, "Daemon connection interrupted");
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

uint64_t sub_236B07114()
{
  uint64_t v0;

  return sub_236B055A8(v0, "Daemon connection invalidated");
}

uint64_t type metadata accessor for ATDaemonConnectionManager()
{
  return objc_opt_self();
}

uint64_t method lookup function for ATDaemonConnectionManager()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of ATDaemonConnectionManager.__allocating_init()()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 96))();
}

_QWORD *initializeBufferWithCopyOfBuffer for ATDaemonConnectionManager.ConnectionError(_QWORD *a1, void **a2)
{
  void *v3;
  id v4;

  v3 = *a2;
  if ((unint64_t)*a2 >= 0xFFFFFFFF)
    v4 = v3;
  *a1 = v3;
  return a1;
}

void destroy for ATDaemonConnectionManager.ConnectionError(void **a1)
{
  void *v1;

  v1 = *a1;
  if ((unint64_t)v1 >= 0xFFFFFFFF)

}

void **assignWithCopy for ATDaemonConnectionManager.ConnectionError(void **a1, void **a2)
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  v3 = *a1;
  v4 = *a2;
  if ((unint64_t)v3 < 0xFFFFFFFF)
  {
    if ((unint64_t)v4 >= 0xFFFFFFFF)
      v7 = v4;
    *a1 = v4;
  }
  else if ((unint64_t)v4 < 0xFFFFFFFF)
  {

    *a1 = *a2;
  }
  else
  {
    v5 = v4;
    v6 = *a1;
    *a1 = v4;

  }
  return a1;
}

_QWORD *__swift_memcpy8_8(_QWORD *result, _QWORD *a2)
{
  *result = *a2;
  return result;
}

void **assignWithTake for ATDaemonConnectionManager.ConnectionError(void **a1, unint64_t *a2)
{
  void *v3;
  unint64_t v4;

  v3 = *a1;
  v4 = *a2;
  if ((unint64_t)v3 < 0xFFFFFFFF)
    goto LABEL_5;
  if (v4 < 0xFFFFFFFF)
  {

LABEL_5:
    *a1 = (void *)v4;
    return a1;
  }
  *a1 = (void *)v4;

  return a1;
}

uint64_t getEnumTagSinglePayload for ATDaemonConnectionManager.ConnectionError(uint64_t *a1, unsigned int a2)
{
  uint64_t v3;
  unsigned int v4;
  unsigned int v5;

  if (!a2)
    return 0;
  if (a2 >= 0x7FFFFFFD && *((_BYTE *)a1 + 8))
    return (*(_DWORD *)a1 + 2147483645);
  v3 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF)
    LODWORD(v3) = -1;
  v4 = v3 + 1;
  v5 = v3 - 2;
  if (v4 >= 4)
    return v5;
  else
    return 0;
}

uint64_t storeEnumTagSinglePayload for ATDaemonConnectionManager.ConnectionError(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 >= 0x7FFFFFFD)
  {
    *(_QWORD *)result = 0;
    *(_DWORD *)result = a2 - 2147483645;
    if (a3 >= 0x7FFFFFFD)
      *(_BYTE *)(result + 8) = 1;
  }
  else
  {
    if (a3 >= 0x7FFFFFFD)
      *(_BYTE *)(result + 8) = 0;
    if (a2)
      *(_QWORD *)result = a2 + 2;
  }
  return result;
}

uint64_t sub_236B07354(uint64_t *a1)
{
  uint64_t v1;

  v1 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF)
    LODWORD(v1) = -1;
  return (v1 + 1);
}

_QWORD *sub_236B0736C(_QWORD *result, int a2)
{
  unsigned int v2;

  if (a2 < 0)
  {
    v2 = a2 ^ 0x80000000;
  }
  else
  {
    if (!a2)
      return result;
    v2 = a2 - 1;
  }
  *result = v2;
  return result;
}

ValueMetadata *type metadata accessor for ATDaemonConnectionManager.ConnectionError()
{
  return &type metadata for ATDaemonConnectionManager.ConnectionError;
}

uint64_t sub_236B0739C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_25643B590);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_236B073E4(uint64_t a1)
{
  uint64_t v1;

  return sub_236B05F00(a1, v1);
}

unint64_t sub_236B073EC()
{
  unint64_t result;

  result = qword_25643B5A0;
  if (!qword_25643B5A0)
  {
    result = MEMORY[0x23B7FC3FC](&protocol conformance descriptor for ATDaemonConnectionManager.ConnectionError, &type metadata for ATDaemonConnectionManager.ConnectionError);
    atomic_store(result, (unint64_t *)&qword_25643B5A0);
  }
  return result;
}

id Icon.image.getter()
{
  id *v0;

  return *v0;
}

double Icon.scale.getter()
{
  uint64_t v0;

  return *(double *)(v0 + 8);
}

uint64_t Icon.isBlank.getter()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + 16);
}

uint64_t Icon.isComposite.getter()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + 17);
}

uint64_t sub_236B07464()
{
  sub_236B16738();
  sub_236B16594();
  swift_bridgeObjectRetain();
  sub_236B16594();
  swift_bridgeObjectRelease();
  sub_236B16594();
  swift_bridgeObjectRetain();
  sub_236B16594();
  swift_bridgeObjectRelease();
  sub_236B16594();
  return 0;
}

void sub_236B07554()
{
  off_25643B5B0 = &unk_250815788;
}

uint64_t sub_236B07568(uint64_t a1, unint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t inited;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  _QWORD *v17;
  BOOL v18;
  uint64_t v19;
  _QWORD *v20;
  BOOL v21;
  uint64_t v22;
  uint64_t v23;
  NSObject *v24;
  os_log_type_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  unint64_t v29;
  unint64_t v30;
  uint64_t v32;
  uint64_t v33;
  char *v34;
  uint64_t v35[9];

  if (!a2)
    return 0;
  v4 = qword_25643ACB0;
  swift_bridgeObjectRetain();
  if (v4 != -1)
    swift_once();
  v32 = *((_QWORD *)off_25643B5B0 + 2);
  if (v32)
  {
    v34 = (char *)off_25643B5B0 + 32;
    swift_bridgeObjectRetain_n();
    v5 = 0;
    do
    {
      v6 = &v34[32 * v5];
      v8 = *(_QWORD *)v6;
      v7 = *((_QWORD *)v6 + 1);
      v10 = *((_QWORD *)v6 + 2);
      v9 = *((_QWORD *)v6 + 3);
      __swift_instantiateConcreteTypeFromMangledName(&qword_25643B780);
      inited = swift_initStackObject();
      *(_OWORD *)(inited + 16) = xmmword_236B17DA0;
      v33 = v8;
      *(_QWORD *)(inited + 32) = v8;
      *(_QWORD *)(inited + 40) = v7;
      *(_QWORD *)(inited + 48) = v10;
      *(_QWORD *)(inited + 56) = v9;
      swift_bridgeObjectRetain_n();
      swift_bridgeObjectRetain_n();
      v12 = sub_236B09DF0(inited);
      swift_setDeallocating();
      swift_arrayDestroy();
      if (*(_QWORD *)(v12 + 16))
      {
        sub_236B16918();
        sub_236B16588();
        v13 = sub_236B16960();
        v14 = -1 << *(_BYTE *)(v12 + 32);
        v15 = v13 & ~v14;
        if (((*(_QWORD *)(v12 + 56 + ((v15 >> 3) & 0xFFFFFFFFFFFFF8)) >> v15) & 1) != 0)
        {
          v16 = *(_QWORD *)(v12 + 48);
          v17 = (_QWORD *)(v16 + 16 * v15);
          v18 = *v17 == a1 && v17[1] == a2;
          if (v18 || (sub_236B168AC() & 1) != 0)
          {
LABEL_21:
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            v22 = v33;
            goto LABEL_25;
          }
          v19 = ~v14;
          while (1)
          {
            v15 = (v15 + 1) & v19;
            if (((*(_QWORD *)(v12 + 56 + ((v15 >> 3) & 0xFFFFFFFFFFFFF8)) >> v15) & 1) == 0)
              break;
            v20 = (_QWORD *)(v16 + 16 * v15);
            v21 = *v20 == a1 && v20[1] == a2;
            if (v21 || (sub_236B168AC() & 1) != 0)
              goto LABEL_21;
          }
        }
      }
      ++v5;
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
    }
    while (v5 != v32);
    swift_bridgeObjectRelease_n();
  }
  swift_bridgeObjectRetain_n();
  v22 = a1;
LABEL_25:
  if (qword_25643AC88 != -1)
    swift_once();
  v23 = sub_236B164F8();
  __swift_project_value_buffer(v23, (uint64_t)qword_25643DF78);
  swift_bridgeObjectRetain_n();
  swift_bridgeObjectRetain_n();
  swift_bridgeObjectRetain();
  v24 = sub_236B164E0();
  v25 = sub_236B1669C();
  if (os_log_type_enabled(v24, v25))
  {
    v26 = swift_slowAlloc();
    v27 = swift_slowAlloc();
    v35[0] = v27;
    *(_DWORD *)v26 = 136315394;
    swift_bridgeObjectRetain();
    sub_236AFB308(a1, a2, v35);
    sub_236B166FC();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v26 + 12) = 2080;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v28 = sub_236B07464();
    v30 = v29;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    sub_236AFB308(v28, v30, v35);
    sub_236B166FC();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_236AF7000, v24, v25, "Platform correct bundle identifier for %s is %s", (uint8_t *)v26, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x23B7FC480](v27, -1, -1);
    MEMORY[0x23B7FC480](v26, -1, -1);

  }
  else
  {

    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease_n();
  }
  return v22;
}

id IconProvider.init()@<X0>(_QWORD *a1@<X8>)
{
  id result;

  result = objc_msgSend(objc_allocWithZone(MEMORY[0x24BE51AB0]), sel_initWithSize_scale_, 60.0, 60.0, 3.0);
  *a1 = result;
  return result;
}

id sub_236B07A68(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, char a6)
{
  id result;
  void *v11;
  void *v12;
  unsigned int v13;
  SEL *v14;
  char **v15;
  id v16;
  void *v17;
  id v18;
  id v19;
  uint64_t v20;
  NSObject *v21;
  os_log_type_t v22;
  uint8_t *v23;
  uint64_t v24;
  uint64_t v25;
  unint64_t v26;
  unint64_t v27;
  uint64_t v28;
  uint8_t *v29;
  uint64_t v30;
  NSObject *v31;
  os_log_type_t v32;
  uint8_t *v33;
  SEL *v34;
  uint64_t v35;
  unint64_t v36;
  unint64_t v37;
  uint64_t v38;
  id v39;
  void *v40;
  id v41;
  id v42;
  uint64_t v43;
  NSObject *v44;
  os_log_type_t v45;
  uint8_t *v46;
  uint64_t v47;
  uint64_t v48;
  unint64_t v49;
  unint64_t v50;
  uint64_t v51;
  NSObject *v52;
  os_log_type_t v53;
  uint8_t *v54;
  uint64_t v55;
  uint64_t v56;
  unsigned int v57;
  uint64_t v58;
  unsigned int v59;
  uint64_t v60;

  result = objc_msgSend((id)objc_opt_self(), sel_defaultWorkspace);
  if (result)
  {
    v11 = result;
    swift_bridgeObjectRetain();
    v12 = (void *)sub_236B16540();
    swift_bridgeObjectRelease();
    v13 = objc_msgSend(v11, sel_applicationIsInstalled_, v12);

    v14 = (SEL *)&selRef_prepareImageForDescriptor_;
    v15 = &selRef_prepareImageForDescriptor_;
    if (a1 != 0xD000000000000019 || a2 != 0x8000000236B19EE0)
    {
      if ((sub_236B168AC() & 1) == 0)
      {
        if ((v13 & 1) == 0)
        {
          if (qword_25643AC88 != -1)
            swift_once();
          v51 = sub_236B164F8();
          __swift_project_value_buffer(v51, (uint64_t)qword_25643DF78);
          v52 = sub_236B164E0();
          v53 = sub_236B1669C();
          if (os_log_type_enabled(v52, v53))
          {
            v54 = (uint8_t *)swift_slowAlloc();
            *(_WORD *)v54 = 0;
            _os_log_impl(&dword_236AF7000, v52, v53, "Not using IconServices because !isAppInstalled && !appHasSystemIcon", v54, 2u);
            MEMORY[0x23B7FC480](v54, -1, -1);
          }

          return 0;
        }
        v19 = 0;
        goto LABEL_17;
      }
      if ((sub_236B168AC() & 1) == 0)
      {
        v59 = v13;
        v19 = 0;
        if (!v59)
          goto LABEL_23;
        goto LABEL_17;
      }
    }
    v57 = v13;
    v16 = objc_allocWithZone(MEMORY[0x24BE51A90]);
    v17 = (void *)sub_236B16540();
    v18 = objc_msgSend(v16, sel_initWithType_, v17);

    v19 = objc_msgSend(v18, sel_prepareImageForDescriptor_, a5);
    if (v19)
    {
      if (qword_25643AC88 != -1)
        swift_once();
      v20 = sub_236B164F8();
      __swift_project_value_buffer(v20, (uint64_t)qword_25643DF78);
      swift_bridgeObjectRetain_n();
      swift_bridgeObjectRetain_n();
      v21 = sub_236B164E0();
      v22 = sub_236B1669C();
      if (os_log_type_enabled(v21, v22))
      {
        v23 = (uint8_t *)swift_slowAlloc();
        v55 = a5;
        v24 = swift_slowAlloc();
        v60 = v24;
        *(_DWORD *)v23 = 136315138;
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        v25 = sub_236B07464();
        v27 = v26;
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        sub_236AFB308(v25, v27, &v60);
        v14 = (SEL *)&selRef_prepareImageForDescriptor_;
        sub_236B166FC();
        swift_bridgeObjectRelease_n();
        swift_bridgeObjectRelease_n();
        swift_bridgeObjectRelease();
        _os_log_impl(&dword_236AF7000, v21, v22, "App with bundle ID %s has a system icon image! Using that.", v23, 0xCu);
        swift_arrayDestroy();
        v28 = v24;
        a5 = v55;
        MEMORY[0x23B7FC480](v28, -1, -1);
        v29 = v23;
        v15 = &selRef_prepareImageForDescriptor_;
        MEMORY[0x23B7FC480](v29, -1, -1);

      }
      else
      {

        swift_bridgeObjectRelease_n();
        swift_bridgeObjectRelease_n();
      }
      if (!objc_msgSend(v19, v15[4]) || (a6 & 1) != 0)
      {
LABEL_24:
        if (!objc_msgSend(v19, v15[4]) || (a6 & 1) != 0)
          return v19;
        if (qword_25643AC88 != -1)
          swift_once();
        v43 = sub_236B164F8();
        __swift_project_value_buffer(v43, (uint64_t)qword_25643DF78);
        swift_bridgeObjectRetain_n();
        swift_bridgeObjectRetain_n();
        v44 = sub_236B164E0();
        v45 = sub_236B1669C();
        if (os_log_type_enabled(v44, v45))
        {
          v46 = (uint8_t *)swift_slowAlloc();
          v47 = swift_slowAlloc();
          v60 = v47;
          *(_DWORD *)v46 = 136315138;
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          v48 = sub_236B07464();
          v50 = v49;
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          sub_236AFB308(v48, v50, &v60);
          sub_236B166FC();
          swift_bridgeObjectRelease_n();
          swift_bridgeObjectRelease_n();
          swift_bridgeObjectRelease();
          _os_log_impl(&dword_236AF7000, v44, v45, "Icon for app with bundle ID %s was a placeholder. Removing as placeholders were not allowed", v46, 0xCu);
          swift_arrayDestroy();
          MEMORY[0x23B7FC480](v47, -1, -1);
          MEMORY[0x23B7FC480](v46, -1, -1);

        }
        else
        {

          swift_bridgeObjectRelease_n();
          swift_bridgeObjectRelease_n();
        }
        return 0;
      }
    }
    if (!v57)
    {
LABEL_23:
      if (!v19)
        return v19;
      goto LABEL_24;
    }
LABEL_17:
    if (qword_25643AC88 != -1)
      swift_once();
    v30 = sub_236B164F8();
    __swift_project_value_buffer(v30, (uint64_t)qword_25643DF78);
    swift_bridgeObjectRetain_n();
    swift_bridgeObjectRetain_n();
    v31 = sub_236B164E0();
    v32 = sub_236B1669C();
    if (os_log_type_enabled(v31, v32))
    {
      v33 = (uint8_t *)swift_slowAlloc();
      v56 = a5;
      v58 = swift_slowAlloc();
      v60 = v58;
      *(_DWORD *)v33 = 136315138;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      v34 = v14;
      v35 = sub_236B07464();
      v37 = v36;
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      v38 = v35;
      v14 = v34;
      sub_236AFB308(v38, v37, &v60);
      sub_236B166FC();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease_n();
      v15 = &selRef_prepareImageForDescriptor_;
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_236AF7000, v31, v32, "Trying to use bundle ID to get IconServices icon for app with bundle ID %s", v33, 0xCu);
      swift_arrayDestroy();
      a5 = v56;
      MEMORY[0x23B7FC480](v58, -1, -1);
      MEMORY[0x23B7FC480](v33, -1, -1);

    }
    else
    {

      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease_n();
    }
    v39 = objc_allocWithZone(MEMORY[0x24BE51A90]);
    swift_bridgeObjectRetain();
    v40 = (void *)sub_236B16540();
    swift_bridgeObjectRelease();
    v41 = objc_msgSend(v39, sel_initWithBundleIdentifier_, v40);

    v42 = objc_msgSend(v41, *v14, a5);
    v19 = v42;
    goto LABEL_23;
  }
  __break(1u);
  return result;
}

double IconProvider.clientIcon(for:isBadge:)@<D0>(uint64_t a1@<X0>, char a2@<W1>, uint64_t a3@<X8>)
{
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  double result;
  char v10;
  char v11;
  _QWORD v12[2];
  char v13;
  char v14;

  if ((*(_BYTE *)(a1 + OBJC_IVAR____TtC9AskToCore9ATPayload_clientAdamIdentifier + 8) & 1) != 0)
  {
    v6 = 0;
    v7 = 0;
  }
  else
  {
    v12[0] = *(_QWORD *)(a1 + OBJC_IVAR____TtC9AskToCore9ATPayload_clientAdamIdentifier);
    v6 = sub_236B16894();
    v7 = v8;
  }
  sub_236B08410(a2 & 1, *(_QWORD *)(a1 + OBJC_IVAR____TtC9AskToCore9ATPayload_clientBundleIdentifier), *(_QWORD *)(a1 + OBJC_IVAR____TtC9AskToCore9ATPayload_clientBundleIdentifier + 8), v6, v7, (uint64_t)v12);
  swift_bridgeObjectRelease();
  result = *(double *)&v12[1];
  v10 = v13;
  v11 = v14;
  *(_QWORD *)a3 = v12[0];
  *(double *)(a3 + 8) = result;
  *(_BYTE *)(a3 + 16) = v10;
  *(_BYTE *)(a3 + 17) = v11;
  return result;
}

void sub_236B08410(char a1@<W0>, uint64_t a2@<X1>, unint64_t a3@<X2>, uint64_t a4@<X3>, unint64_t a5@<X4>, uint64_t a6@<X8>)
{
  id *v6;
  id v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  id v24;
  uint64_t v25;
  NSObject *v26;
  os_log_type_t v27;
  uint8_t *v28;
  id v29;
  id v30;
  uint64_t v31;
  uint64_t v32;
  char v33;
  uint64_t v34;
  NSObject *v35;
  os_log_type_t v36;
  uint64_t v37;
  uint64_t v38;
  unint64_t v39;
  uint64_t v40;
  unint64_t v41;
  id v42;
  id v43;
  void *v44;
  id v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v49;

  v12 = *v6;
  v13 = v12;
  if ((a1 & 1) != 0)
  {
    objc_msgSend(v12, sel_size);
    v15 = v14 * 0.333333333;
    objc_msgSend(v13, sel_size);
    v17 = v16 * 0.333333333;
    objc_msgSend(v13, sel_scale);
    v19 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BE51AB0]), sel_initWithSize_scale_, v15, v17, v18);

    v13 = v19;
  }
  v20 = sub_236B07568(a2, a3);
  if (v21
    && (v24 = sub_236B07A68(v20, v21, v22, v23, (uint64_t)v13, 0),
        swift_bridgeObjectRelease(),
        swift_bridgeObjectRelease(),
        v24))
  {
    if (qword_25643AC88 != -1)
      swift_once();
    v25 = sub_236B164F8();
    __swift_project_value_buffer(v25, (uint64_t)qword_25643DF78);
    v26 = sub_236B164E0();
    v27 = sub_236B1669C();
    if (os_log_type_enabled(v26, v27))
    {
      v28 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v28 = 0;
      _os_log_impl(&dword_236AF7000, v26, v27, "Got icon from Iconservices.", v28, 2u);
      MEMORY[0x23B7FC480](v28, -1, -1);
    }

    v29 = objc_msgSend(v24, sel_CGImage);
    if (v29)
    {
      v30 = v29;
      objc_msgSend(v24, sel_scale);
      v32 = v31;

      v33 = 0;
LABEL_30:
      *(_QWORD *)a6 = v30;
      *(_QWORD *)(a6 + 8) = v32;
      *(_BYTE *)(a6 + 16) = v33;
      *(_BYTE *)(a6 + 17) = 0;
      return;
    }
  }
  else
  {
    if (qword_25643AC88 != -1)
      swift_once();
    v34 = sub_236B164F8();
    __swift_project_value_buffer(v34, (uint64_t)qword_25643DF78);
    swift_bridgeObjectRetain_n();
    swift_bridgeObjectRetain_n();
    v35 = sub_236B164E0();
    v36 = sub_236B16690();
    if (os_log_type_enabled(v35, v36))
    {
      v37 = swift_slowAlloc();
      v38 = swift_slowAlloc();
      v49 = v38;
      *(_DWORD *)v37 = 136315394;
      if (!a3)
        a2 = 7104878;
      v47 = a6;
      if (a3)
        v39 = a3;
      else
        v39 = 0xE300000000000000;
      swift_bridgeObjectRetain();
      sub_236AFB308(a2, v39, &v49);
      sub_236B166FC();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease();
      *(_WORD *)(v37 + 12) = 2080;
      if (a5)
        v40 = a4;
      else
        v40 = 7104878;
      if (a5)
        v41 = a5;
      else
        v41 = 0xE300000000000000;
      swift_bridgeObjectRetain();
      sub_236AFB308(v40, v41, &v49);
      a6 = v47;
      sub_236B166FC();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_236AF7000, v35, v36, "Nothing worked! Falling back to generic blank icon. bundleIdentifier: %s, adamIdentifier: %s", (uint8_t *)v37, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x23B7FC480](v38, -1, -1);
      MEMORY[0x23B7FC480](v37, -1, -1);

    }
    else
    {

      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease_n();
    }
    v42 = objc_msgSend((id)objc_opt_self(), sel_genericApplicationIcon);
    v43 = objc_msgSend(v42, sel_imageForDescriptor_, v13);
    if (v43)
    {
      v44 = v43;
      v45 = objc_msgSend(v43, sel_CGImage);
      if (v45)
      {
        v30 = v45;
        objc_msgSend(v44, sel_scale);
        v32 = v46;

        v33 = 1;
        goto LABEL_30;
      }
    }
    else
    {
      __break(1u);
    }
    __break(1u);
  }
  __break(1u);
}

double IconProvider.associatedContentIcon(for:)@<D0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  unint64_t v9;
  double result;
  char v11;
  char v12;
  _QWORD v13[2];
  char v14;
  char v15;

  v3 = *(_QWORD *)(a1 + OBJC_IVAR____TtC9AskToCore9ATPayload_question);
  v4 = (uint64_t *)(v3 + OBJC_IVAR____TtC5AskTo10ATQuestion_associatedContentBundleIdentifier);
  swift_beginAccess();
  v5 = *v4;
  v6 = v4[1];
  v7 = (uint64_t *)(v3 + OBJC_IVAR____TtC5AskTo10ATQuestion_associatedContentAdamIdentifier);
  swift_beginAccess();
  v8 = *v7;
  v9 = v7[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_236B08410(0, v5, v6, v8, v9, (uint64_t)v13);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  result = *(double *)&v13[1];
  v11 = v14;
  v12 = v15;
  *(_QWORD *)a2 = v13[0];
  *(double *)(a2 + 8) = result;
  *(_BYTE *)(a2 + 16) = v11;
  *(_BYTE *)(a2 + 17) = v12;
  return result;
}

void sub_236B089D0(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  __int16 v4;
  void *v5;
  __int16 v6;
  CGImage *v7;
  id v8;
  double v9;
  double v10;
  uint64_t v11;
  size_t Width;
  size_t v13;
  size_t Height;
  size_t v15;
  CGColorSpace *DeviceRGB;
  CGContext *v17;
  size_t v18;
  CGImageRef Image;
  CGImageRef v20;
  uint64_t v21;
  NSObject *v22;
  os_log_type_t v23;
  uint8_t *v24;
  uint64_t v25;
  os_log_type_t v26;
  uint8_t *v27;

  v4 = *(unsigned __int8 *)(a1 + 16);
  v5 = *(void **)a2;
  v6 = *(unsigned __int8 *)(a2 + 16);
  v7 = (CGImage *)*(id *)a1;
  v8 = v5;
  v9 = (double)(uint64_t)CGImageGetWidth(v7) * 0.0833333333;
  if ((~*(_QWORD *)&v9 & 0x7FF0000000000000) == 0)
  {
    __break(1u);
    goto LABEL_26;
  }
  if (v9 <= -9.22337204e18)
  {
LABEL_26:
    __break(1u);
    goto LABEL_27;
  }
  if (v9 >= 9.22337204e18)
  {
LABEL_27:
    __break(1u);
    goto LABEL_28;
  }
  v10 = (double)(uint64_t)CGImageGetWidth(v7) * 0.333333333;
  if ((~*(_QWORD *)&v10 & 0x7FF0000000000000) == 0)
  {
LABEL_28:
    __break(1u);
    goto LABEL_29;
  }
  if (v10 <= -9.22337204e18)
  {
LABEL_29:
    __break(1u);
    goto LABEL_30;
  }
  if (v10 >= 9.22337204e18)
  {
LABEL_30:
    __break(1u);
    goto LABEL_31;
  }
  v11 = (uint64_t)v9;
  Width = CGImageGetWidth(v7);
  v13 = Width + (uint64_t)v9;
  if (__OFADD__(Width, (uint64_t)v9))
  {
LABEL_31:
    __break(1u);
    goto LABEL_32;
  }
  Height = CGImageGetHeight(v7);
  v15 = Height + v11;
  if (__OFADD__(Height, v11))
  {
LABEL_32:
    __break(1u);
    goto LABEL_33;
  }
  if ((v13 - 0x2000000000000000) >> 62 != 3)
  {
LABEL_33:
    __break(1u);
LABEL_34:
    __break(1u);
    goto LABEL_35;
  }
  DeviceRGB = CGColorSpaceCreateDeviceRGB();
  v17 = CGBitmapContextCreate(0, v13, v15, 8uLL, 4 * v13, DeviceRGB, 0x2002u);

  if (!v17)
  {
    if (qword_25643AC88 == -1)
    {
LABEL_16:
      v21 = sub_236B164F8();
      __swift_project_value_buffer(v21, (uint64_t)qword_25643DF78);
      v22 = sub_236B164E0();
      v23 = sub_236B16690();
      if (os_log_type_enabled(v22, v23))
      {
        v24 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)v24 = 0;
        _os_log_impl(&dword_236AF7000, v22, v23, "Composite context was nil. Failing to composite icons.", v24, 2u);
        MEMORY[0x23B7FC480](v24, -1, -1);
      }

      goto LABEL_24;
    }
LABEL_36:
    swift_once();
    goto LABEL_16;
  }
  CGImageGetWidth(v7);
  CGImageGetHeight(v7);
  sub_236B16678();
  v18 = CGImageGetWidth(v7);
  if (__OFSUB__(v18, (uint64_t)v10))
    goto LABEL_34;
  if (__OFADD__(v18 - (uint64_t)v10, v11))
  {
LABEL_35:
    __break(1u);
    goto LABEL_36;
  }
  sub_236B16678();
  Image = CGBitmapContextCreateImage(v17);
  if (Image)
  {
    v20 = Image;

    *(_QWORD *)a3 = v20;
    *(_QWORD *)(a3 + 8) = 0x4008000000000000;
    *(_WORD *)(a3 + 16) = v4 | v6 | 0x100;
    return;
  }
  if (qword_25643AC88 != -1)
    swift_once();
  v25 = sub_236B164F8();
  __swift_project_value_buffer(v25, (uint64_t)qword_25643DF78);
  v22 = sub_236B164E0();
  v26 = sub_236B16690();
  if (os_log_type_enabled(v22, v26))
  {
    v27 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v27 = 0;
    _os_log_impl(&dword_236AF7000, v22, v26, "Resulting composite image was nil. Failing to composite icons.", v27, 2u);
    MEMORY[0x23B7FC480](v27, -1, -1);
  }

LABEL_24:
  *(_QWORD *)a3 = 0;
  *(_QWORD *)(a3 + 8) = 0;
  *(_WORD *)(a3 + 16) = 0;
}

void IconProvider.compositeIcon(for:)(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t *v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t *v10;
  unint64_t v11;
  uint64_t v12;
  unint64_t v13;
  id v14;
  uint64_t v15;
  char v16;
  uint64_t v17;
  unint64_t v18;
  id v19;
  uint64_t v20;
  char v21;
  char v22;
  id v23;
  unsigned int v24;
  uint64_t v25;
  NSObject *v26;
  os_log_type_t v27;
  uint8_t *v28;
  _QWORD v29[2];
  char v30;
  char v31;
  _QWORD v32[2];
  char v33;
  char v34;
  id v35;
  uint64_t v36;
  unsigned __int16 v37;

  v5 = *v2;
  v32[0] = *v2;
  v6 = *(_QWORD *)(a1 + OBJC_IVAR____TtC9AskToCore9ATPayload_question);
  v7 = (uint64_t *)(v6 + OBJC_IVAR____TtC5AskTo10ATQuestion_associatedContentBundleIdentifier);
  swift_beginAccess();
  v8 = *v7;
  v9 = v7[1];
  v10 = (uint64_t *)(v6 + OBJC_IVAR____TtC5AskTo10ATQuestion_associatedContentAdamIdentifier);
  swift_beginAccess();
  v17 = *v10;
  v11 = v10[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_236B08410(0, v8, v9, v17, v11, (uint64_t)&v35);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v12 = 0;
  v13 = 0;
  v14 = v35;
  v15 = v36;
  v16 = v37;
  LOBYTE(v17) = HIBYTE(v37);
  if ((*(_BYTE *)(a1 + OBJC_IVAR____TtC9AskToCore9ATPayload_clientAdamIdentifier + 8) & 1) == 0)
  {
    v35 = *(id *)(a1 + OBJC_IVAR____TtC9AskToCore9ATPayload_clientAdamIdentifier);
    v12 = sub_236B16894();
    v13 = v18;
  }
  v32[0] = v5;
  sub_236B08410(1, *(_QWORD *)(a1 + OBJC_IVAR____TtC9AskToCore9ATPayload_clientBundleIdentifier), *(_QWORD *)(a1 + OBJC_IVAR____TtC9AskToCore9ATPayload_clientBundleIdentifier + 8), v12, v13, (uint64_t)&v35);
  swift_bridgeObjectRelease();
  v19 = v35;
  v20 = v36;
  v21 = HIBYTE(v37);
  if ((v16 & 1) == 0)
  {
    if ((v37 & 1) == 0)
    {
      v32[0] = v14;
      v32[1] = v15;
      v33 = 0;
      v34 = v17;
      v29[0] = v35;
      v29[1] = v36;
      v30 = 0;
      v31 = HIBYTE(v37);
      sub_236B089D0((uint64_t)v32, (uint64_t)v29, (uint64_t)&v35);
      v23 = v35;
      if (v35)
      {
        v15 = v36;
        v24 = v37;

        v22 = v24 & 1;
        LODWORD(v17) = (v24 >> 8) & 1;
        v14 = v23;
        goto LABEL_12;
      }
      if (qword_25643AC88 != -1)
        swift_once();
      v25 = sub_236B164F8();
      __swift_project_value_buffer(v25, (uint64_t)qword_25643DF78);
      v26 = sub_236B164E0();
      v27 = sub_236B16690();
      if (os_log_type_enabled(v26, v27))
      {
        v28 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)v28 = 0;
        _os_log_impl(&dword_236AF7000, v26, v27, "Composite icon was nil. Returning associatedContentIcon only.", v28, 2u);
        MEMORY[0x23B7FC480](v28, -1, -1);

        goto LABEL_8;
      }

    }
LABEL_8:
    v22 = 0;
    goto LABEL_12;
  }
  if ((_BYTE)v37)
  {

    v22 = 1;
  }
  else
  {

    v22 = 0;
    v14 = v19;
    v15 = v20;
    LOBYTE(v17) = v21;
  }
LABEL_12:
  *(_QWORD *)a2 = v14;
  *(_QWORD *)(a2 + 8) = v15;
  *(_BYTE *)(a2 + 16) = v22;
  *(_BYTE *)(a2 + 17) = v17;
}

CGImageRef sub_236B0907C(CGImage *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  NSObject *v6;
  os_log_type_t v7;
  uint8_t *v8;
  uint64_t Width;
  CGImageRef result;
  int64_t v11;
  CGColorSpace *DeviceRGB;
  CGContext *v13;
  double v14;
  CGFloat v15;
  const CGPath *v16;
  CGImageRef Image;
  NSObject *v18;
  os_log_type_t v19;
  uint8_t *v20;
  NSObject *v21;
  os_log_type_t v22;
  uint8_t *v23;
  uint64_t v24;
  uint8_t *v25;
  uint64_t v26;
  CGImageRef v27;
  CGRect v28;

  v27 = a1;
  v1 = sub_236B164C8();
  v2 = *(_QWORD *)(v1 - 8);
  MEMORY[0x24BDAC7A8](v1);
  v4 = (char *)&v26 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_25643AC88 != -1)
    swift_once();
  v5 = sub_236B164F8();
  __swift_project_value_buffer(v5, (uint64_t)qword_25643DF78);
  v6 = sub_236B164E0();
  v7 = sub_236B1669C();
  if (os_log_type_enabled(v6, v7))
  {
    v8 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v8 = 0;
    _os_log_impl(&dword_236AF7000, v6, v7, "Attempting to add corner radius to image from Data", v8, 2u);
    MEMORY[0x23B7FC480](v8, -1, -1);
  }

  Width = CGImageGetWidth(v27);
  result = (CGImageRef)CGImageGetHeight(v27);
  if ((unint64_t)(Width - 0x2000000000000000) >> 62 != 3)
  {
    __break(1u);
    return result;
  }
  v11 = (int64_t)result;
  DeviceRGB = CGColorSpaceCreateDeviceRGB();
  v13 = CGBitmapContextCreate(0, Width, v11, 8uLL, 4 * Width, DeviceRGB, 0x2002u);

  if (!v13)
  {
    v21 = sub_236B164E0();
    v22 = sub_236B16690();
    if (os_log_type_enabled(v21, v22))
    {
      v23 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v23 = 0;
      _os_log_impl(&dword_236AF7000, v21, v22, "Rounded corner image context was nil. Returning the original image with no corner radius.", v23, 2u);
      MEMORY[0x23B7FC480](v23, -1, -1);
    }

    return v27;
  }
  v14 = 0.0666666667;
  if (Width == v11)
    v14 = 0.25;
  v15 = v14 * (double)Width;
  v28.origin.x = 0.0;
  v28.origin.y = 0.0;
  v28.size.width = (double)Width;
  v28.size.height = (double)v11;
  v16 = CGPathCreateWithRoundedRect(v28, v15, v15, 0);
  CGContextAddPath(v13, v16);
  (*(void (**)(char *, _QWORD, uint64_t))(v2 + 104))(v4, *MEMORY[0x24BDBD730], v1);
  sub_236B1666C();
  (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
  sub_236B16678();
  Image = CGBitmapContextCreateImage(v13);
  v18 = sub_236B164E0();
  if (!Image)
  {
    v24 = sub_236B16690();
    if (os_log_type_enabled(v18, (os_log_type_t)v24))
    {
      v25 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v25 = 0;
      _os_log_impl(&dword_236AF7000, v18, (os_log_type_t)v24, "Resulting rounded corner image was nil. Returning the original image with no corner radius.", v25, 2u);
      MEMORY[0x23B7FC480](v25, -1, -1);
    }

    return v27;
  }
  v19 = sub_236B1669C();
  if (os_log_type_enabled(v18, v19))
  {
    v20 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v20 = 0;
    _os_log_impl(&dword_236AF7000, v18, v19, "Added corner radius to image from Data", v20, 2u);
    MEMORY[0x23B7FC480](v20, -1, -1);
  }

  return Image;
}

void IconProvider.icon(from:questionIdentifier:isScreenTimeRequest:)(uint64_t a1@<X0>, char a2@<W2>, uint64_t a3@<X8>)
{
  void **v3;
  unint64_t v6;
  uint64_t v7;
  int v8;
  void *v9;
  const __CFData *v10;
  CGImageSource *v11;
  CGImage *ImageAtIndex;
  CGImage *v13;
  uint64_t v14;
  NSObject *v15;
  os_log_type_t v16;
  uint8_t *v17;
  uint64_t v18;
  NSObject *v19;
  os_log_type_t v20;
  uint8_t *v21;
  double v22;
  CGImageRef v23;
  CGImageRef v24;
  double v25;
  const __CFData *v26;
  NSObject *v27;
  CGImageRef v28;
  uint64_t v29;
  os_log_type_t v30;
  uint8_t *v31;
  uint64_t v32;
  NSObject *v33;
  os_log_type_t v34;
  uint8_t *v35;
  id v36;
  void *v37;
  CGImage *v38;
  CGImage *v39;
  __int16 v40;
  __int16 v41;
  __int16 v42;
  id v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  id v49;
  id v50;
  void *v51;
  id v52;
  id v53;
  CGImage *v54;
  CGImage *v55;
  double v56;
  CGImage *v57;
  __int16 v58;
  id v59;
  id v60;
  void *v61;
  CGImage *v62;
  double v63;
  id v64;
  CGImage *v65;
  double v66;
  CGImageRef v67;
  double v68;
  uint64_t v69;
  CGImage *v70;
  double v71;
  uint64_t v72;
  CGImage *v73;
  double v74;
  __int16 v75;

  v7 = *(_QWORD *)a1;
  v6 = *(_QWORD *)(a1 + 8);
  v8 = *(unsigned __int8 *)(a1 + 32);
  v9 = *v3;
  v10 = (const __CFData *)sub_236B1642C();
  v11 = CGImageSourceCreateWithData(v10, 0);

  if (!v11)
  {
    if (qword_25643AC88 != -1)
      swift_once();
    v14 = sub_236B164F8();
    __swift_project_value_buffer(v14, (uint64_t)qword_25643DF78);
    v15 = sub_236B164E0();
    v16 = sub_236B16690();
    if (os_log_type_enabled(v15, v16))
    {
      v17 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v17 = 0;
      _os_log_impl(&dword_236AF7000, v15, v16, "Image source was nil for existing image data.", v17, 2u);
      MEMORY[0x23B7FC480](v17, -1, -1);
    }

    goto LABEL_15;
  }
  ImageAtIndex = CGImageSourceCreateImageAtIndex(v11, 0, 0);
  if (!ImageAtIndex)
  {
    if (qword_25643AC88 != -1)
      swift_once();
    v18 = sub_236B164F8();
    __swift_project_value_buffer(v18, (uint64_t)qword_25643DF78);
    v19 = sub_236B164E0();
    v20 = sub_236B16690();
    if (os_log_type_enabled(v19, v20))
    {
      v21 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v21 = 0;
      _os_log_impl(&dword_236AF7000, v19, v20, "Image was nil for existing image data image source.", v21, 2u);
      MEMORY[0x23B7FC480](v21, -1, -1);
    }

LABEL_15:
    v13 = 0;
    v22 = 0.0;
    goto LABEL_18;
  }
  v13 = ImageAtIndex;
  if (v8)
  {

  }
  else
  {
    v23 = sub_236B0907C(ImageAtIndex);

    v13 = v23;
  }
  v22 = 3.0;
LABEL_18:
  if (v6 >> 60 == 15)
  {
    v24 = 0;
    v25 = 0.0;
    goto LABEL_35;
  }
  sub_236AFD1C0(v7, v6);
  v26 = (const __CFData *)sub_236B1642C();
  v27 = CGImageSourceCreateWithData(v26, 0);

  if (!v27)
  {
    if (qword_25643AC88 != -1)
      swift_once();
    v29 = sub_236B164F8();
    __swift_project_value_buffer(v29, (uint64_t)qword_25643DF78);
    v27 = sub_236B164E0();
    v30 = sub_236B16690();
    if (os_log_type_enabled(v27, v30))
    {
      v31 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v31 = 0;
      _os_log_impl(&dword_236AF7000, v27, v30, "Image source was nil for existing image data.", v31, 2u);
      MEMORY[0x23B7FC480](v31, -1, -1);
    }
    sub_236AFD168(v7, v6);
    goto LABEL_33;
  }
  v28 = CGImageSourceCreateImageAtIndex((CGImageSourceRef)v27, 0, 0);
  if (!v28)
  {
    if (qword_25643AC88 != -1)
      swift_once();
    v32 = sub_236B164F8();
    __swift_project_value_buffer(v32, (uint64_t)qword_25643DF78);
    v33 = sub_236B164E0();
    v34 = sub_236B16690();
    if (os_log_type_enabled(v33, v34))
    {
      v35 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v35 = 0;
      _os_log_impl(&dword_236AF7000, v33, v34, "Image was nil for existing image data image source.", v35, 2u);
      MEMORY[0x23B7FC480](v35, -1, -1);
    }
    sub_236AFD168(v7, v6);

LABEL_33:
    v24 = 0;
    v25 = 0.0;
    goto LABEL_34;
  }
  v24 = v28;
  sub_236AFD168(v7, v6);
  v25 = 3.0;
LABEL_34:

LABEL_35:
  v36 = objc_msgSend((id)objc_opt_self(), sel_imageDescriptorNamed_, *MEMORY[0x24BE51AC8]);
  v37 = v36;
  if (!v13)
  {
    if (v24)
    {

      v41 = 0;
      v22 = v25;
LABEL_57:
      v42 = 0;
      v13 = v24;
      goto LABEL_58;
    }
    v59 = objc_msgSend((id)objc_opt_self(), sel_genericApplicationIcon);
    v64 = objc_msgSend(v59, sel_imageForDescriptor_, v37);
    if (v64)
    {
      v61 = v64;
      v65 = (CGImage *)objc_msgSend(v64, sel_CGImage);
      if (v65)
      {
        v24 = v65;
        objc_msgSend(v61, sel_scale);
        v22 = v66;

        goto LABEL_54;
      }
      goto LABEL_65;
    }
LABEL_64:
    __break(1u);
LABEL_65:
    __break(1u);
    goto LABEL_66;
  }
  if (v24)
  {
    v70 = v13;
    v71 = v22;
    LOWORD(v72) = 0;
    v67 = v24;
    v68 = v25;
    LOWORD(v69) = 0;
    v38 = v13;
    v39 = v24;
    sub_236B089D0((uint64_t)&v70, (uint64_t)&v67, (uint64_t)&v73);
    v13 = v73;
    if (v73)
    {
      v40 = v75;
      v22 = v74;

      v41 = v40 & 1;
      if ((v40 & 0x100) == 0)
      {
LABEL_39:
        v42 = 0;
LABEL_58:
        *(_QWORD *)a3 = v13;
        *(double *)(a3 + 8) = v22;
        *(_WORD *)(a3 + 16) = v42 | v41;
        return;
      }
      goto LABEL_61;
    }
    v59 = objc_msgSend((id)objc_opt_self(), sel_genericApplicationIcon, v67, *(_QWORD *)&v68, v69, v70, *(_QWORD *)&v71, v72);
    v60 = objc_msgSend(v59, sel_imageForDescriptor_, v37);
    if (v60)
    {
      v61 = v60;
      v62 = (CGImage *)objc_msgSend(v60, sel_CGImage);
      if (v62)
      {
        v24 = v62;
        objc_msgSend(v61, sel_scale);
        v22 = v63;

LABEL_54:
        v41 = 1;
        goto LABEL_57;
      }
    }
    else
    {
      __break(1u);
    }
    __break(1u);
    goto LABEL_64;
  }
  if ((a2 & 1) == 0)
  {

    v41 = 0;
    v24 = v13;
    goto LABEL_57;
  }
  v24 = v13;
  v43 = v9;
  objc_msgSend(v43, sel_size);
  v45 = v44 * 0.333333333;
  objc_msgSend(v43, sel_size);
  v47 = v46 * 0.333333333;
  objc_msgSend(v43, sel_scale);
  v49 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BE51AB0]), sel_initWithSize_scale_, v45, v47, v48);

  v50 = objc_allocWithZone(MEMORY[0x24BE51A90]);
  v51 = (void *)sub_236B16540();
  v52 = objc_msgSend(v50, sel_initWithType_, v51);

  v53 = objc_msgSend(v52, sel_prepareImageForDescriptor_, v49);
  if (!v53)
  {

    v41 = 0;
    goto LABEL_57;
  }
  v54 = (CGImage *)objc_msgSend(v53, sel_CGImage);
  if (v54)
  {
    v55 = v54;
    objc_msgSend(v53, sel_scale);
    v70 = v24;
    v71 = v22;
    LOWORD(v72) = 0;
    v67 = v55;
    v68 = v56;
    LOWORD(v69) = 0;
    sub_236B089D0((uint64_t)&v70, (uint64_t)&v67, (uint64_t)&v73);

    v57 = v73;
    if (!v73)
    {
      v41 = 0;
      goto LABEL_39;
    }
    v58 = v75;
    v22 = v74;

    v41 = v58 & 1;
    if ((v58 & 0x100) == 0)
    {
      v42 = 0;
      v13 = v57;
      goto LABEL_58;
    }
    v13 = v57;
LABEL_61:
    v42 = 256;
    goto LABEL_58;
  }
LABEL_66:

  __break(1u);
}

double static IconProvider.Spec.effectiveSizeWithBadge.getter()
{
  return 65.0;
}

double static IconProvider.Spec.effectiveSizeWithoutBadge.getter()
{
  return 60.0;
}

void destroy for ContactFormatter(id *a1)
{

}

uint64_t _s9AskToCore4IconVwCP_0(uint64_t a1, uint64_t a2)
{
  void *v3;
  uint64_t v4;
  id v5;

  v3 = *(void **)a2;
  v4 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v4;
  *(_WORD *)(a1 + 16) = *(_WORD *)(a2 + 16);
  v5 = v3;
  return a1;
}

uint64_t assignWithCopy for Icon(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  id v6;

  v4 = *(void **)a2;
  v5 = *(void **)a1;
  *(_QWORD *)a1 = *(_QWORD *)a2;
  v6 = v4;

  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
  *(_BYTE *)(a1 + 17) = *(_BYTE *)(a2 + 17);
  return a1;
}

__n128 __swift_memcpy18_8(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  a1[1].n128_u16[0] = a2[1].n128_u16[0];
  *a1 = result;
  return result;
}

uint64_t assignWithTake for Icon(uint64_t a1, uint64_t a2)
{
  void *v4;

  v4 = *(void **)a1;
  *(_QWORD *)a1 = *(_QWORD *)a2;

  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
  *(_BYTE *)(a1 + 17) = *(_BYTE *)(a2 + 17);
  return a1;
}

uint64_t getEnumTagSinglePayload for Icon(uint64_t *a1, int a2)
{
  uint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *((_BYTE *)a1 + 18))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for Icon(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_WORD *)(result + 16) = 0;
    *(_QWORD *)result = a2 ^ 0x80000000;
    *(_QWORD *)(result + 8) = 0;
    if (a3 < 0)
      *(_BYTE *)(result + 18) = 1;
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
    *(_BYTE *)(result + 18) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for Icon()
{
  return &type metadata for Icon;
}

ValueMetadata *type metadata accessor for IconProvider()
{
  return &type metadata for IconProvider;
}

ValueMetadata *type metadata accessor for IconProvider.Spec()
{
  return &type metadata for IconProvider.Spec;
}

uint64_t sub_236B09DF0(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t result;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD *v16;
  BOOL v17;
  uint64_t v18;
  _QWORD *v19;
  _QWORD *v21;
  uint64_t v22;
  BOOL v23;
  uint64_t v24;
  uint64_t v25;

  v1 = *(_QWORD *)(a1 + 16);
  if (v1)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_25643B5B8);
    v3 = sub_236B1672C();
    v4 = 0;
    v5 = v3 + 56;
    v25 = a1 + 32;
    while (1)
    {
      v6 = (uint64_t *)(v25 + 16 * v4);
      v8 = *v6;
      v7 = v6[1];
      sub_236B16918();
      swift_bridgeObjectRetain();
      sub_236B16588();
      result = sub_236B16960();
      v10 = -1 << *(_BYTE *)(v3 + 32);
      v11 = result & ~v10;
      v12 = v11 >> 6;
      v13 = *(_QWORD *)(v5 + 8 * (v11 >> 6));
      v14 = 1 << v11;
      if (((1 << v11) & v13) != 0)
      {
        v15 = *(_QWORD *)(v3 + 48);
        v16 = (_QWORD *)(v15 + 16 * v11);
        v17 = *v16 == v8 && v16[1] == v7;
        if (v17 || (result = sub_236B168AC(), (result & 1) != 0))
        {
LABEL_3:
          swift_bridgeObjectRelease();
          goto LABEL_4;
        }
        v18 = ~v10;
        while (1)
        {
          v11 = (v11 + 1) & v18;
          v12 = v11 >> 6;
          v13 = *(_QWORD *)(v5 + 8 * (v11 >> 6));
          v14 = 1 << v11;
          if ((v13 & (1 << v11)) == 0)
            break;
          v19 = (_QWORD *)(v15 + 16 * v11);
          if (*v19 != v8 || v19[1] != v7)
          {
            result = sub_236B168AC();
            if ((result & 1) == 0)
              continue;
          }
          goto LABEL_3;
        }
      }
      *(_QWORD *)(v5 + 8 * v12) = v14 | v13;
      v21 = (_QWORD *)(*(_QWORD *)(v3 + 48) + 16 * v11);
      *v21 = v8;
      v21[1] = v7;
      v22 = *(_QWORD *)(v3 + 16);
      v23 = __OFADD__(v22, 1);
      v24 = v22 + 1;
      if (v23)
      {
        __break(1u);
        return result;
      }
      *(_QWORD *)(v3 + 16) = v24;
LABEL_4:
      if (++v4 == v1)
        return v3;
    }
  }
  return MEMORY[0x24BEE4B08];
}

unint64_t ATDaemonMachServiceName.getter()
{
  return 0xD000000000000010;
}

uint64_t initializeBufferWithCopyOfBuffer for ContactFormatter(uint64_t a1, uint64_t a2)
{
  void *v3;
  id v4;

  v3 = *(void **)a2;
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_BYTE *)(a1 + 8) = *(_BYTE *)(a2 + 8);
  v4 = v3;
  return a1;
}

uint64_t assignWithCopy for ContactFormatter(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  id v6;

  v4 = *(void **)a2;
  v5 = *(void **)a1;
  *(_QWORD *)a1 = *(_QWORD *)a2;
  v6 = v4;

  *(_BYTE *)(a1 + 8) = *(_BYTE *)(a2 + 8);
  return a1;
}

uint64_t __swift_memcpy9_8(uint64_t result, uint64_t *a2)
{
  uint64_t v2;

  v2 = *a2;
  *(_BYTE *)(result + 8) = *((_BYTE *)a2 + 8);
  *(_QWORD *)result = v2;
  return result;
}

uint64_t assignWithTake for ContactFormatter(uint64_t a1, uint64_t a2)
{
  void *v4;

  v4 = *(void **)a1;
  *(_QWORD *)a1 = *(_QWORD *)a2;

  *(_BYTE *)(a1 + 8) = *(_BYTE *)(a2 + 8);
  return a1;
}

uint64_t getEnumTagSinglePayload for ContactFormatter(uint64_t *a1, int a2)
{
  uint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *((_BYTE *)a1 + 9))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for ContactFormatter(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_BYTE *)(result + 8) = 0;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 9) = 1;
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
    *(_BYTE *)(result + 9) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for ContactFormatter()
{
  return &type metadata for ContactFormatter;
}

BOOL sub_236B0A110(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t sub_236B0A128()
{
  sub_236B16918();
  sub_236B16924();
  return sub_236B16960();
}

uint64_t sub_236B0A16C()
{
  return sub_236B16924();
}

uint64_t sub_236B0A194()
{
  sub_236B16918();
  sub_236B16924();
  return sub_236B16960();
}

void sub_236B0A1D4(id *a1, char a2, int a3, int a4, id a5)
{
  unint64_t v6;
  id v7;
  void *v8;
  id v9;
  unint64_t v10;
  id v11;
  void *v12;
  id v13;
  uint64_t v14;
  id v15;
  id v16;
  void *v17;
  id v18;
  id v19;
  uint64_t v20;

  v6 = (unint64_t)a1;
  v7 = objc_msgSend(a5, sel_stringFromContact_, a1);
  if (v7)
  {
    v8 = v7;
    sub_236B1654C();

    return;
  }
  v9 = objc_msgSend((id)v6, sel_emailAddresses);
  __swift_instantiateConcreteTypeFromMangledName(&qword_25643B5C0);
  v10 = sub_236B1660C();

  if (v10 >> 62)
  {
    swift_bridgeObjectRetain();
    v14 = sub_236B16780();
    swift_bridgeObjectRelease();
    if (v14)
      goto LABEL_5;
LABEL_11:
    swift_bridgeObjectRelease();
    goto LABEL_12;
  }
  if (!*(_QWORD *)((v10 & 0xFFFFFFFFFFFFF8) + 0x10))
    goto LABEL_11;
LABEL_5:
  if ((v10 & 0xC000000000000001) != 0)
  {
    v11 = (id)MEMORY[0x23B7FBD78](0, v10);
  }
  else
  {
    if (!*(_QWORD *)((v10 & 0xFFFFFFFFFFFFF8) + 0x10))
    {
      __break(1u);
LABEL_21:
      swift_bridgeObjectRetain();
      v20 = sub_236B16780();
      swift_bridgeObjectRelease();
      if (v20)
        goto LABEL_15;
      goto LABEL_22;
    }
    v11 = *(id *)(v10 + 32);
  }
  v12 = v11;
  swift_bridgeObjectRelease();
  v13 = objc_msgSend(v12, sel_value);

  if (v13)
  {
    sub_236B1654C();

    return;
  }
LABEL_12:
  if ((a2 & 1) == 0)
  {
LABEL_23:
    swift_bridgeObjectRetain();
    return;
  }
  v15 = objc_msgSend((id)v6, sel_phoneNumbers);
  v6 = sub_236B1660C();

  if (v6 >> 62)
    goto LABEL_21;
  if (!*(_QWORD *)((v6 & 0xFFFFFFFFFFFFF8) + 0x10))
  {
LABEL_22:
    swift_bridgeObjectRelease();
    goto LABEL_23;
  }
LABEL_15:
  if ((v6 & 0xC000000000000001) != 0)
  {
    v16 = (id)MEMORY[0x23B7FBD78](0, v6);
    goto LABEL_18;
  }
  if (*(_QWORD *)((v6 & 0xFFFFFFFFFFFFF8) + 0x10))
  {
    v16 = *(id *)(v6 + 32);
LABEL_18:
    v17 = v16;
    swift_bridgeObjectRelease();
    v18 = objc_msgSend(v17, sel_value);

    v19 = objc_msgSend(v18, sel_stringValue);
    sub_236B1654C();

    return;
  }
  __break(1u);
}

uint64_t getEnumTagSinglePayload for ContactFormatter.Style(unsigned __int8 *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for ContactFormatter.Style(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_236B0A544 + 4 * byte_236B17DF5[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_236B0A578 + 4 * asc_236B17DF0[v4]))();
}

uint64_t sub_236B0A578(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_236B0A580(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x236B0A588);
  return result;
}

uint64_t sub_236B0A594(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x236B0A59CLL);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_236B0A5A0(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_236B0A5A8(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

_BYTE *sub_236B0A5B4(_BYTE *result, char a2)
{
  *result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for ContactFormatter.Style()
{
  return &type metadata for ContactFormatter.Style;
}

unint64_t sub_236B0A5D4()
{
  unint64_t result;

  result = qword_25643B5C8;
  if (!qword_25643B5C8)
  {
    result = MEMORY[0x23B7FC3FC](&unk_236B17E8C, &type metadata for ContactFormatter.Style);
    atomic_store(result, (unint64_t *)&qword_25643B5C8);
  }
  return result;
}

uint64_t sub_236B0A61C(unsigned __int8 a1)
{
  return ((uint64_t (*)(uint64_t, unint64_t))((char *)sub_236B0A650 + 4 * byte_236B17EB8[a1]))(0x64496D6574737973, 0xE800000000000000);
}

uint64_t sub_236B0A650()
{
  return 0x6E6F6973726576;
}

uint64_t sub_236B0A668()
{
  return 25705;
}

uint64_t sub_236B0A674()
{
  return 0x6369706F74;
}

uint64_t sub_236B0A688()
{
  return 0x656C746974;
}

uint64_t sub_236B0A69C()
{
  return 0x7972616D6D7573;
}

unint64_t sub_236B0A6B4()
{
  return 0xD000000000000010;
}

uint64_t sub_236B0A6D0()
{
  return 0x6843726577736E61;
}

unint64_t sub_236B0A6F4()
{
  return 0xD00000000000001CLL;
}

uint64_t sub_236B0A760()
{
  return 0x6974617269707865;
}

uint64_t sub_236B0A784(unsigned __int8 a1)
{
  return ((uint64_t (*)(uint64_t, unint64_t))((char *)sub_236B0A7B8 + 4 * byte_236B17EC5[a1]))(0x64496D6574737973, 0xE800000000000000);
}

uint64_t sub_236B0A7B8()
{
  return 0x6E6F6973726576;
}

uint64_t sub_236B0A7D0()
{
  return 25705;
}

uint64_t sub_236B0A7DC()
{
  return 0x6369706F74;
}

uint64_t sub_236B0A7F0()
{
  return 0x656C746974;
}

uint64_t sub_236B0A804()
{
  return 0x7972616D6D7573;
}

unint64_t sub_236B0A81C()
{
  return 0xD000000000000010;
}

uint64_t sub_236B0A838()
{
  return 0x6843726577736E61;
}

unint64_t sub_236B0A85C()
{
  return 0xD00000000000001CLL;
}

uint64_t sub_236B0A8C8()
{
  return 0x6974617269707865;
}

uint64_t sub_236B0A8EC(unsigned __int8 *a1, unsigned __int8 *a2)
{
  unsigned __int8 v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char v8;

  v2 = *a2;
  v3 = sub_236B0A61C(*a1);
  v5 = v4;
  if (v3 == sub_236B0A61C(v2) && v5 == v6)
    v8 = 1;
  else
    v8 = sub_236B168AC();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v8 & 1;
}

uint64_t sub_236B0A974()
{
  unsigned __int8 *v0;
  unsigned __int8 v1;

  v1 = *v0;
  sub_236B16918();
  sub_236B0A61C(v1);
  sub_236B16588();
  swift_bridgeObjectRelease();
  return sub_236B16960();
}

uint64_t sub_236B0A9D4()
{
  unsigned __int8 *v0;

  sub_236B0A61C(*v0);
  sub_236B16588();
  return swift_bridgeObjectRelease();
}

uint64_t sub_236B0AA14()
{
  unsigned __int8 *v0;
  unsigned __int8 v1;

  v1 = *v0;
  sub_236B16918();
  sub_236B0A61C(v1);
  sub_236B16588();
  swift_bridgeObjectRelease();
  return sub_236B16960();
}

uint64_t sub_236B0AA70@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = sub_236B0F648();
  *a1 = result;
  return result;
}

uint64_t sub_236B0AA9C@<X0>(uint64_t *a1@<X8>)
{
  unsigned __int8 *v1;
  uint64_t result;
  uint64_t v4;

  result = sub_236B0A61C(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t sub_236B0AAC4()
{
  unsigned __int8 *v0;

  return sub_236B0A784(*v0);
}

uint64_t sub_236B0AACC@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = sub_236B0F648();
  *a1 = result;
  return result;
}

void sub_236B0AAF0(_BYTE *a1@<X8>)
{
  *a1 = 13;
}

uint64_t sub_236B0AAFC()
{
  sub_236B0FA40();
  return sub_236B16990();
}

uint64_t sub_236B0AB24()
{
  sub_236B0FA40();
  return sub_236B1699C();
}

uint64_t ATQuestion.Topic.rawValue.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + OBJC_IVAR___ATQuestionTopic_rawValue);
  swift_bridgeObjectRetain();
  return v1;
}

id ATQuestion.Topic.__allocating_init(rawValue:)(uint64_t a1, uint64_t a2)
{
  objc_class *v2;
  char *v5;
  char *v6;
  objc_super v8;

  v5 = (char *)objc_allocWithZone(v2);
  v6 = &v5[OBJC_IVAR___ATQuestionTopic_rawValue];
  *(_QWORD *)v6 = a1;
  *((_QWORD *)v6 + 1) = a2;
  v8.receiver = v5;
  v8.super_class = v2;
  return objc_msgSendSuper2(&v8, sel_init);
}

id ATQuestion.Topic.init(rawValue:)(uint64_t a1, uint64_t a2)
{
  char *v2;
  objc_class *ObjectType;
  char *v6;
  objc_super v8;

  ObjectType = (objc_class *)swift_getObjectType();
  v6 = &v2[OBJC_IVAR___ATQuestionTopic_rawValue];
  *(_QWORD *)v6 = a1;
  *((_QWORD *)v6 + 1) = a2;
  v8.receiver = v2;
  v8.super_class = ObjectType;
  return objc_msgSendSuper2(&v8, sel_init);
}

uint64_t ATQuestion.Topic.isEqual(_:)(uint64_t a1)
{
  uint64_t v1;
  char v4;
  char *v6;
  _BYTE v7[24];
  uint64_t v8;

  swift_getObjectType();
  sub_236AFD788(a1, (uint64_t)v7, &qword_25643B4F8);
  if (!v8)
  {
    sub_236AFD12C((uint64_t)v7, &qword_25643B4F8);
    goto LABEL_9;
  }
  if ((swift_dynamicCast() & 1) == 0)
  {
LABEL_9:
    v4 = 0;
    return v4 & 1;
  }
  if (*(_QWORD *)(v1 + OBJC_IVAR___ATQuestionTopic_rawValue) == *(_QWORD *)&v6[OBJC_IVAR___ATQuestionTopic_rawValue]
    && *(_QWORD *)(v1 + OBJC_IVAR___ATQuestionTopic_rawValue + 8) == *(_QWORD *)&v6[OBJC_IVAR___ATQuestionTopic_rawValue
                                                                                  + 8])
  {

    v4 = 1;
  }
  else
  {
    v4 = sub_236B168AC();

  }
  return v4 & 1;
}

uint64_t ATQuestion.Topic.hash.getter()
{
  return sub_236B165AC();
}

id ATQuestion.Topic.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

void ATQuestion.Topic.init()()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

id sub_236B0AE84@<X0>(uint64_t *a1@<X0>, _QWORD *a2@<X8>)
{
  objc_class *v2;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  char *v7;
  id result;
  objc_super v9;

  v4 = *a1;
  v5 = a1[1];
  v6 = (char *)objc_allocWithZone(v2);
  v7 = &v6[OBJC_IVAR___ATQuestionTopic_rawValue];
  *(_QWORD *)v7 = v4;
  *((_QWORD *)v7 + 1) = v5;
  v9.receiver = v6;
  v9.super_class = v2;
  result = objc_msgSendSuper2(&v9, sel_init);
  *a2 = result;
  return result;
}

uint64_t sub_236B0AEE4@<X0>(_QWORD *a1@<X8>)
{
  return sub_236B0EDCC(&OBJC_IVAR___ATQuestionTopic_rawValue, a1);
}

uint64_t sub_236B0AEF0(uint64_t a1, uint64_t a2)
{
  sub_236B05140(&qword_25643B6C0, a2, (uint64_t (*)(uint64_t))type metadata accessor for ATQuestion.Topic, (uint64_t)&protocol conformance descriptor for ATQuestion.Topic);
  return sub_236B165DC();
}

uint64_t sub_236B0AF58(uint64_t a1, uint64_t a2)
{
  sub_236B05140(&qword_25643B6C0, a2, (uint64_t (*)(uint64_t))type metadata accessor for ATQuestion.Topic, (uint64_t)&protocol conformance descriptor for ATQuestion.Topic);
  return sub_236B165C4();
}

uint64_t ATQuestion.systemId.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;

  v3 = v1 + OBJC_IVAR____TtC5AskTo10ATQuestion_systemId;
  v4 = sub_236B164BC();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a1, v3, v4);
}

double ATQuestion.version.getter()
{
  uint64_t v0;

  return *(double *)(v0 + OBJC_IVAR____TtC5AskTo10ATQuestion_version);
}

id sub_236B0B01C()
{
  void *v0;

  swift_bridgeObjectRetain();
  v0 = (void *)sub_236B16540();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t ATQuestion.id.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + OBJC_IVAR____TtC5AskTo10ATQuestion_id);
  swift_bridgeObjectRetain();
  return v1;
}

id ATQuestion.topic.getter()
{
  uint64_t v0;
  id *v1;

  v1 = (id *)(v0 + OBJC_IVAR____TtC5AskTo10ATQuestion_topic);
  swift_beginAccess();
  return *v1;
}

void ATQuestion.topic.setter(void *a1)
{
  uint64_t v1;
  void **v3;
  void *v4;

  v3 = (void **)(v1 + OBJC_IVAR____TtC5AskTo10ATQuestion_topic);
  swift_beginAccess();
  v4 = *v3;
  *v3 = a1;

}

uint64_t (*ATQuestion.topic.modify())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t ATQuestion.title.getter()
{
  return sub_236B0B308(&OBJC_IVAR____TtC5AskTo10ATQuestion_title);
}

uint64_t ATQuestion.title.setter(uint64_t a1, uint64_t a2)
{
  return sub_236B0B3D8(a1, a2, &OBJC_IVAR____TtC5AskTo10ATQuestion_title);
}

uint64_t (*ATQuestion.title.modify())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

id sub_236B0B298()
{
  void *v0;

  swift_beginAccess();
  swift_bridgeObjectRetain();
  v0 = (void *)sub_236B16540();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t ATQuestion.summary.getter()
{
  return sub_236B0B308(&OBJC_IVAR____TtC5AskTo10ATQuestion_summary);
}

uint64_t sub_236B0B308(_QWORD *a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v3;

  v2 = (uint64_t *)(v1 + *a1);
  swift_beginAccess();
  v3 = *v2;
  swift_bridgeObjectRetain();
  return v3;
}

uint64_t sub_236B0B364(uint64_t a1, uint64_t a2, uint64_t a3, _QWORD *a4)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t *v9;

  v6 = sub_236B1654C();
  v8 = v7;
  v9 = (uint64_t *)(a1 + *a4);
  swift_beginAccess();
  *v9 = v6;
  v9[1] = v8;
  return swift_bridgeObjectRelease();
}

uint64_t ATQuestion.summary.setter(uint64_t a1, uint64_t a2)
{
  return sub_236B0B3D8(a1, a2, &OBJC_IVAR____TtC5AskTo10ATQuestion_summary);
}

uint64_t sub_236B0B3D8(uint64_t a1, uint64_t a2, _QWORD *a3)
{
  uint64_t v3;
  _QWORD *v6;

  v6 = (_QWORD *)(v3 + *a3);
  swift_beginAccess();
  *v6 = a1;
  v6[1] = a2;
  return swift_bridgeObjectRelease();
}

uint64_t (*ATQuestion.summary.modify())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t ATQuestion.notificationText.getter()
{
  return sub_236B0B308(&OBJC_IVAR____TtC5AskTo10ATQuestion_notificationText);
}

uint64_t ATQuestion.notificationText.setter(uint64_t a1, uint64_t a2)
{
  return sub_236B0B3D8(a1, a2, &OBJC_IVAR____TtC5AskTo10ATQuestion_notificationText);
}

uint64_t (*ATQuestion.notificationText.modify())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t ATQuestion.answerChoices.getter()
{
  swift_beginAccess();
  return swift_bridgeObjectRetain();
}

uint64_t ATQuestion.answerChoices.setter(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;

  v3 = (_QWORD *)(v1 + OBJC_IVAR____TtC5AskTo10ATQuestion_answerChoices);
  swift_beginAccess();
  *v3 = a1;
  return swift_bridgeObjectRelease();
}

uint64_t (*ATQuestion.answerChoices.modify())()
{
  swift_beginAccess();
  return j__swift_endAccess;
}

uint64_t ATQuestion.associatedContentDisplayName.getter()
{
  return sub_236B0B308(&OBJC_IVAR____TtC5AskTo10ATQuestion_associatedContentDisplayName);
}

uint64_t ATQuestion.associatedContentDisplayName.setter(uint64_t a1, uint64_t a2)
{
  return sub_236B0B3D8(a1, a2, &OBJC_IVAR____TtC5AskTo10ATQuestion_associatedContentDisplayName);
}

uint64_t (*ATQuestion.associatedContentDisplayName.modify())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t ATQuestion.associatedContentIdentifier.getter()
{
  return sub_236B0B308(&OBJC_IVAR____TtC5AskTo10ATQuestion_associatedContentIdentifier);
}

uint64_t ATQuestion.associatedContentIdentifier.setter(uint64_t a1, uint64_t a2)
{
  return sub_236B0B3D8(a1, a2, &OBJC_IVAR____TtC5AskTo10ATQuestion_associatedContentIdentifier);
}

uint64_t (*ATQuestion.associatedContentIdentifier.modify())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t ATQuestion.associatedContentBundleIdentifier.getter()
{
  return sub_236B0B308(&OBJC_IVAR____TtC5AskTo10ATQuestion_associatedContentBundleIdentifier);
}

uint64_t ATQuestion.associatedContentBundleIdentifier.setter(uint64_t a1, uint64_t a2)
{
  return sub_236B0B3D8(a1, a2, &OBJC_IVAR____TtC5AskTo10ATQuestion_associatedContentBundleIdentifier);
}

uint64_t (*ATQuestion.associatedContentBundleIdentifier.modify())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

id sub_236B0B80C(uint64_t a1, uint64_t a2, _QWORD *a3)
{
  uint64_t v3;
  void *v4;

  v3 = a1 + *a3;
  swift_beginAccess();
  if (!*(_QWORD *)(v3 + 8))
    return 0;
  swift_bridgeObjectRetain();
  v4 = (void *)sub_236B16540();
  swift_bridgeObjectRelease();
  return v4;
}

uint64_t ATQuestion.associatedContentAdamIdentifier.getter()
{
  return sub_236B0B308(&OBJC_IVAR____TtC5AskTo10ATQuestion_associatedContentAdamIdentifier);
}

uint64_t sub_236B0B898(uint64_t a1, uint64_t a2, uint64_t a3, _QWORD *a4)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t *v9;

  if (a3)
  {
    v6 = sub_236B1654C();
    v8 = v7;
  }
  else
  {
    v6 = 0;
    v8 = 0;
  }
  v9 = (uint64_t *)(a1 + *a4);
  swift_beginAccess();
  *v9 = v6;
  v9[1] = v8;
  return swift_bridgeObjectRelease();
}

uint64_t ATQuestion.associatedContentAdamIdentifier.setter(uint64_t a1, uint64_t a2)
{
  return sub_236B0B3D8(a1, a2, &OBJC_IVAR____TtC5AskTo10ATQuestion_associatedContentAdamIdentifier);
}

uint64_t (*ATQuestion.associatedContentAdamIdentifier.modify())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t ATQuestion.expirationDate.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;

  v3 = v1 + OBJC_IVAR____TtC5AskTo10ATQuestion_expirationDate;
  swift_beginAccess();
  return sub_236AFD788(v3, a1, &qword_25643B5E0);
}

uint64_t ATQuestion.expirationDate.setter(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;

  v3 = v1 + OBJC_IVAR____TtC5AskTo10ATQuestion_expirationDate;
  swift_beginAccess();
  sub_236B0BBF0(a1, v3);
  return swift_endAccess();
}

uint64_t sub_236B0BBF0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_25643B5E0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t (*ATQuestion.expirationDate.modify())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

id ATQuestion.__allocating_init(topic:title:summary:)(void *a1)
{
  objc_class *v1;
  objc_class *v2;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v13;
  uint64_t v14;

  v2 = v1;
  v14 = sub_236B164BC();
  v4 = *(_QWORD *)(v14 - 8);
  MEMORY[0x24BDAC7A8](v14);
  v6 = (char *)&v13 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = objc_allocWithZone(v2);
  sub_236B164B0();
  sub_236B16480();
  v8 = (void *)sub_236B16540();
  swift_bridgeObjectRelease();
  v9 = (void *)sub_236B16540();
  swift_bridgeObjectRelease();
  v10 = (void *)sub_236B16540();
  swift_bridgeObjectRelease();
  v11 = objc_msgSend(v7, sel_initWithId_topic_title_summary_, v8, a1, v9, v10);

  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v14);
  return v11;
}

id ATQuestion.init(topic:title:summary:)(void *a1)
{
  void *v1;
  void *v2;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v12;
  uint64_t v13;

  v2 = v1;
  v13 = sub_236B164BC();
  v4 = *(_QWORD *)(v13 - 8);
  MEMORY[0x24BDAC7A8](v13);
  v6 = (char *)&v12 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_236B164B0();
  sub_236B16480();
  v7 = (void *)sub_236B16540();
  swift_bridgeObjectRelease();
  v8 = (void *)sub_236B16540();
  swift_bridgeObjectRelease();
  v9 = (void *)sub_236B16540();
  swift_bridgeObjectRelease();
  v10 = objc_msgSend(v2, sel_initWithId_topic_title_summary_, v7, a1, v8, v9);

  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v13);
  return v10;
}

id ATQuestion.__allocating_init(id:topic:title:summary:)(uint64_t a1, uint64_t a2, void *a3)
{
  objc_class *v3;
  objc_class *v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v17;
  uint64_t v18;

  v4 = v3;
  v17 = a3;
  v18 = sub_236B164BC();
  v5 = *(_QWORD *)(v18 - 8);
  MEMORY[0x24BDAC7A8](v18);
  v7 = (char *)&v17 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = objc_allocWithZone(v4);
  sub_236B164B0();
  v9 = (void *)sub_236B1648C();
  v10 = (void *)sub_236B16540();
  swift_bridgeObjectRelease();
  v11 = (void *)sub_236B16540();
  swift_bridgeObjectRelease();
  v12 = (void *)sub_236B16540();
  swift_bridgeObjectRelease();
  type metadata accessor for ATAnswerChoice();
  v13 = (void *)sub_236B16600();
  v14 = v17;
  v15 = objc_msgSend(v8, sel_initWithSystemId_version_id_topic_title_summary_notificationText_answerChoices_, v9, v10, v17, v11, v12, 0, 1.0, v13);

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v18);
  return v15;
}

id ATQuestion.init(id:topic:title:summary:)(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;

  v4 = sub_236B0F690(a1, a2, (uint64_t)a3);

  return v4;
}

id ATQuestion.__allocating_init(systemId:version:id:topic:title:summary:notificationText:answerChoices:)(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, double a9, __int128 a10, uint64_t a11)
{
  objc_class *v11;
  id v21;
  id v22;

  v21 = objc_allocWithZone(v11);
  v22 = sub_236B0F7FC(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, *((uint64_t *)&a10 + 1), a11);

  return v22;
}

id ATQuestion.init(systemId:version:id:topic:title:summary:notificationText:answerChoices:)(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, double a9, uint64_t a10, uint64_t a11, uint64_t a12)
{
  id v13;

  v13 = sub_236B0F7FC(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12);

  return v13;
}

id ATQuestion.__allocating_init(from:)(_QWORD *a1)
{
  objc_class *v1;
  id v3;

  v3 = objc_allocWithZone(v1);
  return ATQuestion.init(from:)(a1);
}

id ATQuestion.init(from:)(_QWORD *a1)
{
  char *v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  char *v9;
  char *v10;
  char *v11;
  char *v12;
  char *v13;
  char *v14;
  uint64_t v15;
  void (*v16)(char *, uint64_t, uint64_t, uint64_t);
  uint64_t v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t *v38;
  uint64_t v39;
  char *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t *v56;
  uint64_t v57;
  id v58;
  uint64_t v59;
  uint64_t v60;
  char *v61;
  uint64_t v62;
  char *v63;
  char *v64;
  uint64_t v65;
  _QWORD *v66;
  uint64_t v67;
  objc_class *ObjectType;
  uint64_t v69;
  uint64_t *v70;
  uint64_t *v71;
  uint64_t *v72;
  uint64_t *v73;
  char *v74;
  objc_super v75;
  char v76;
  char v77;
  char v78;
  char v79;
  uint64_t v80;
  char v81;
  uint64_t v82;
  uint64_t *v83;

  ObjectType = (objc_class *)swift_getObjectType();
  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_25643B5E0);
  MEMORY[0x24BDAC7A8](v3);
  v61 = (char *)&v59 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = sub_236B164BC();
  v65 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v64 = (char *)&v59 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v62 = __swift_instantiateConcreteTypeFromMangledName(&qword_25643B5E8);
  v60 = *(_QWORD *)(v62 - 8);
  MEMORY[0x24BDAC7A8](v62);
  v8 = (char *)&v59 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = &v1[OBJC_IVAR____TtC5AskTo10ATQuestion_notificationText];
  *(_QWORD *)v9 = 0;
  *((_QWORD *)v9 + 1) = 0;
  v83 = (uint64_t *)v9;
  v74 = &v1[OBJC_IVAR____TtC5AskTo10ATQuestion_answerChoices];
  *(_QWORD *)&v1[OBJC_IVAR____TtC5AskTo10ATQuestion_answerChoices] = MEMORY[0x24BEE4AF8];
  v10 = &v1[OBJC_IVAR____TtC5AskTo10ATQuestion_associatedContentDisplayName];
  *(_QWORD *)v10 = 0;
  *((_QWORD *)v10 + 1) = 0;
  v73 = (uint64_t *)v10;
  v11 = &v1[OBJC_IVAR____TtC5AskTo10ATQuestion_associatedContentIdentifier];
  *(_QWORD *)v11 = 0;
  *((_QWORD *)v11 + 1) = 0;
  v72 = (uint64_t *)v11;
  v12 = &v1[OBJC_IVAR____TtC5AskTo10ATQuestion_associatedContentBundleIdentifier];
  *(_QWORD *)v12 = 0;
  *((_QWORD *)v12 + 1) = 0;
  v71 = (uint64_t *)v12;
  v13 = &v1[OBJC_IVAR____TtC5AskTo10ATQuestion_associatedContentAdamIdentifier];
  *(_QWORD *)v13 = 0;
  *((_QWORD *)v13 + 1) = 0;
  v70 = (uint64_t *)v13;
  v14 = &v1[OBJC_IVAR____TtC5AskTo10ATQuestion_expirationDate];
  v15 = sub_236B16474();
  v16 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v15 - 8) + 56);
  v67 = (uint64_t)v14;
  v16(v14, 1, 1, v15);
  v17 = a1[3];
  v66 = a1;
  __swift_project_boxed_opaque_existential_1(a1, v17);
  sub_236B0FA40();
  v18 = v1;
  v63 = v8;
  v19 = v69;
  sub_236B16978();
  if (v19)
  {
    __swift_destroy_boxed_opaque_existential_0((uint64_t)v66);
    v58 = ObjectType;
    v24 = v67;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    sub_236AFD12C(v24, &qword_25643B5E0);

    swift_deallocPartialClassInstance();
  }
  else
  {
    v20 = v60;
    v21 = (uint64_t)v61;
    LOBYTE(v82) = 0;
    sub_236B05140(&qword_25643B5F8, 255, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEAA8]);
    sub_236B1681C();
    (*(void (**)(char *, char *, uint64_t))(v65 + 32))(&v18[OBJC_IVAR____TtC5AskTo10ATQuestion_systemId], v64, v5);
    LOBYTE(v82) = 1;
    sub_236B16810();
    *(_QWORD *)&v18[OBJC_IVAR____TtC5AskTo10ATQuestion_version] = v22;
    LOBYTE(v82) = 2;
    v23 = sub_236B16804();
    v26 = (uint64_t *)&v18[OBJC_IVAR____TtC5AskTo10ATQuestion_id];
    *v26 = v23;
    v26[1] = v27;
    type metadata accessor for ATQuestion.Topic();
    v81 = 3;
    sub_236B05140(&qword_25643B600, v28, (uint64_t (*)(uint64_t))type metadata accessor for ATQuestion.Topic, (uint64_t)&protocol conformance descriptor for ATQuestion.Topic);
    sub_236B1681C();
    *(_QWORD *)&v18[OBJC_IVAR____TtC5AskTo10ATQuestion_topic] = v82;
    LOBYTE(v82) = 4;
    v29 = sub_236B16804();
    v30 = (uint64_t *)&v18[OBJC_IVAR____TtC5AskTo10ATQuestion_title];
    *v30 = v29;
    v30[1] = v31;
    LOBYTE(v82) = 5;
    v32 = sub_236B16804();
    v33 = (uint64_t *)&v18[OBJC_IVAR____TtC5AskTo10ATQuestion_summary];
    *v33 = v32;
    v33[1] = v34;
    LOBYTE(v82) = 6;
    v35 = sub_236B167C8();
    v37 = v36;
    v38 = v83;
    swift_beginAccess();
    *v38 = v35;
    v38[1] = v37;
    swift_bridgeObjectRelease();
    __swift_instantiateConcreteTypeFromMangledName(&qword_25643B608);
    v81 = 7;
    sub_236B0FAA4(&qword_25643B610, &qword_25643B618, (uint64_t)&protocol conformance descriptor for ATAnswerChoice, MEMORY[0x24BEE12D0]);
    sub_236B1681C();
    v39 = v80;
    v40 = v74;
    swift_beginAccess();
    *(_QWORD *)v40 = v39;
    swift_bridgeObjectRelease();
    LOBYTE(v80) = 8;
    v41 = sub_236B167C8();
    v43 = v42;
    v44 = v73;
    swift_beginAccess();
    *v44 = v41;
    v44[1] = v43;
    swift_bridgeObjectRelease();
    v79 = 9;
    v45 = sub_236B167C8();
    v47 = v46;
    v48 = v72;
    swift_beginAccess();
    *v48 = v45;
    v48[1] = v47;
    swift_bridgeObjectRelease();
    v78 = 10;
    v49 = sub_236B167C8();
    v51 = v50;
    v52 = v71;
    swift_beginAccess();
    *v52 = v49;
    v52[1] = v51;
    swift_bridgeObjectRelease();
    v77 = 11;
    v53 = sub_236B167C8();
    v55 = v54;
    v56 = v70;
    swift_beginAccess();
    *v56 = v53;
    v56[1] = v55;
    swift_bridgeObjectRelease();
    v76 = 12;
    sub_236B05140(&qword_25643B620, 255, (uint64_t (*)(uint64_t))MEMORY[0x24BDCE900], MEMORY[0x24BDCE960]);
    sub_236B167E0();
    (*(void (**)(char *, uint64_t))(v20 + 8))(v63, v62);
    v57 = v67;
    swift_beginAccess();
    sub_236B0BBF0(v21, v57);
    swift_endAccess();

    v75.receiver = v18;
    v75.super_class = ObjectType;
    v58 = objc_msgSendSuper2(&v75, sel_init);
    __swift_destroy_boxed_opaque_existential_0((uint64_t)v66);
  }
  return v58;
}

uint64_t ATQuestion.encode(to:)(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  _BYTE *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _BYTE *v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v15;
  uint64_t v16;
  _BYTE v17[80];
  char v18;
  uint64_t v19;
  char v20;
  char v21;
  char v22;
  uint64_t v23;
  char v24;
  char v25;

  v3 = v1;
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_25643B5E0);
  MEMORY[0x24BDAC7A8](v5);
  v7 = &v17[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_25643B628);
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v11 = &v17[-((v10 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_236B0FA40();
  sub_236B16984();
  v24 = 0;
  sub_236B164BC();
  sub_236B05140(&qword_25643B630, 255, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEA70]);
  sub_236B1687C();
  if (!v2)
  {
    v24 = 1;
    sub_236B16870();
    v24 = 2;
    sub_236B16858();
    v12 = (uint64_t *)(v3 + OBJC_IVAR____TtC5AskTo10ATQuestion_topic);
    swift_beginAccess();
    v23 = *v12;
    v22 = 3;
    type metadata accessor for ATQuestion.Topic();
    sub_236B05140(&qword_25643B638, v13, (uint64_t (*)(uint64_t))type metadata accessor for ATQuestion.Topic, (uint64_t)&protocol conformance descriptor for ATQuestion.Topic);
    sub_236B1687C();
    swift_beginAccess();
    v22 = 4;
    swift_bridgeObjectRetain();
    sub_236B16858();
    swift_bridgeObjectRelease();
    swift_beginAccess();
    v21 = 5;
    swift_bridgeObjectRetain();
    sub_236B16858();
    swift_bridgeObjectRelease();
    swift_beginAccess();
    v20 = 6;
    swift_bridgeObjectRetain();
    sub_236B16834();
    swift_bridgeObjectRelease();
    v15 = (uint64_t *)(v3 + OBJC_IVAR____TtC5AskTo10ATQuestion_answerChoices);
    swift_beginAccess();
    v19 = *v15;
    v18 = 7;
    __swift_instantiateConcreteTypeFromMangledName(&qword_25643B608);
    sub_236B0FAA4((unint64_t *)&unk_25643B640, (unint64_t *)&unk_25643B740, (uint64_t)&protocol conformance descriptor for ATAnswerChoice, MEMORY[0x24BEE12A0]);
    sub_236B1687C();
    swift_beginAccess();
    v18 = 8;
    swift_bridgeObjectRetain();
    sub_236B16834();
    swift_bridgeObjectRelease();
    swift_beginAccess();
    v17[56] = 9;
    swift_bridgeObjectRetain();
    sub_236B16834();
    swift_bridgeObjectRelease();
    swift_beginAccess();
    v17[32] = 10;
    swift_bridgeObjectRetain();
    sub_236B16834();
    swift_bridgeObjectRelease();
    swift_beginAccess();
    v17[8] = 11;
    swift_bridgeObjectRetain();
    sub_236B16834();
    swift_bridgeObjectRelease();
    v16 = v3 + OBJC_IVAR____TtC5AskTo10ATQuestion_expirationDate;
    swift_beginAccess();
    sub_236AFD788(v16, (uint64_t)v7, &qword_25643B5E0);
    v25 = 12;
    sub_236B16474();
    sub_236B05140(&qword_25643B650, 255, (uint64_t (*)(uint64_t))MEMORY[0x24BDCE900], MEMORY[0x24BDCE920]);
    sub_236B16840();
    sub_236AFD12C((uint64_t)v7, &qword_25643B5E0);
  }
  return (*(uint64_t (**)(_BYTE *, uint64_t))(v9 + 8))(v11, v8);
}

uint64_t ATQuestion.isEqual(_:)(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  char *v6;
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
  char *v17;
  char *v18;
  void **v19;
  char *v20;
  void *v21;
  void **v22;
  void *v23;
  id v24;
  id v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t v28;
  char *v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t v32;
  char *v33;
  uint64_t *v34;
  uint64_t v35;
  uint64_t v36;
  char *v37;
  uint64_t v38;
  uint64_t *v39;
  _BYTE *v40;
  char v41;
  unint64_t *v43;
  unint64_t v44;
  unint64_t *v45;
  unint64_t v46;
  unsigned __int8 v47;
  uint64_t *v48;
  uint64_t v49;
  char *v50;
  uint64_t v51;
  uint64_t *v52;
  uint64_t v53;
  uint64_t v54;
  char *v55;
  uint64_t v56;
  uint64_t *v57;
  uint64_t v58;
  uint64_t v59;
  char *v60;
  uint64_t v61;
  uint64_t *v62;
  uint64_t v63;
  uint64_t v64;
  char *v65;
  uint64_t v66;
  uint64_t v67;
  char *v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  unsigned int (*v72)(uint64_t, uint64_t, uint64_t);
  uint64_t v73;
  uint64_t v74;
  void (*v75)(char *, uint64_t);
  uint64_t v76;
  char *v77;
  uint64_t v78;
  char *v79;
  uint64_t v80;
  uint64_t v81;
  char *v82;
  _BYTE v83[24];
  uint64_t v84;

  v2 = v1;
  swift_getObjectType();
  v4 = sub_236B16474();
  v80 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)&v76 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_25643B658);
  MEMORY[0x24BDAC7A8](v7);
  v81 = (uint64_t)&v76 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_25643B5E0);
  v10 = MEMORY[0x24BDAC7A8](v9);
  v12 = (char *)&v76 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = MEMORY[0x24BDAC7A8](v10);
  v15 = (char *)&v76 - v14;
  MEMORY[0x24BDAC7A8](v13);
  v17 = (char *)&v76 - v16;
  sub_236AFD788(a1, (uint64_t)v83, &qword_25643B4F8);
  if (!v84)
  {
    v39 = &qword_25643B4F8;
    v40 = v83;
LABEL_22:
    sub_236AFD12C((uint64_t)v40, v39);
    goto LABEL_24;
  }
  if ((swift_dynamicCast() & 1) != 0)
  {
    v18 = v82;
    if ((sub_236B16498() & 1) == 0
      || *(double *)(v2 + OBJC_IVAR____TtC5AskTo10ATQuestion_version) != *(double *)&v18[OBJC_IVAR____TtC5AskTo10ATQuestion_version]
      || (*(_QWORD *)(v2 + OBJC_IVAR____TtC5AskTo10ATQuestion_id) != *(_QWORD *)&v18[OBJC_IVAR____TtC5AskTo10ATQuestion_id]
       || *(_QWORD *)(v2 + OBJC_IVAR____TtC5AskTo10ATQuestion_id + 8) != *(_QWORD *)&v18[OBJC_IVAR____TtC5AskTo10ATQuestion_id
                                                                                       + 8])
      && (sub_236B168AC() & 1) == 0)
    {

      goto LABEL_24;
    }
    v77 = v12;
    v78 = v4;
    v79 = (char *)sub_236B04E6C(0, &qword_25643B500);
    v19 = (void **)(v2 + OBJC_IVAR____TtC5AskTo10ATQuestion_topic);
    swift_beginAccess();
    v20 = v18;
    v21 = *v19;
    v22 = (void **)&v20[OBJC_IVAR____TtC5AskTo10ATQuestion_topic];
    swift_beginAccess();
    v23 = *v22;
    v24 = v21;
    v25 = v23;
    LOBYTE(v21) = sub_236B166CC();

    if ((v21 & 1) != 0)
    {
      v26 = (uint64_t *)(v2 + OBJC_IVAR____TtC5AskTo10ATQuestion_title);
      swift_beginAccess();
      v27 = *v26;
      v28 = v26[1];
      v79 = v20;
      v29 = &v20[OBJC_IVAR____TtC5AskTo10ATQuestion_title];
      swift_beginAccess();
      if ((v27 != *(_QWORD *)v29 || v28 != *((_QWORD *)v29 + 1)) && (sub_236B168AC() & 1) == 0)
        goto LABEL_27;
      v30 = (uint64_t *)(v2 + OBJC_IVAR____TtC5AskTo10ATQuestion_summary);
      swift_beginAccess();
      v31 = *v30;
      v32 = v30[1];
      v33 = &v79[OBJC_IVAR____TtC5AskTo10ATQuestion_summary];
      swift_beginAccess();
      if ((v31 != *(_QWORD *)v33 || v32 != *((_QWORD *)v33 + 1)) && (sub_236B168AC() & 1) == 0)
        goto LABEL_27;
      v34 = (uint64_t *)(v2 + OBJC_IVAR____TtC5AskTo10ATQuestion_notificationText);
      swift_beginAccess();
      v36 = *v34;
      v35 = v34[1];
      v37 = &v79[OBJC_IVAR____TtC5AskTo10ATQuestion_notificationText];
      swift_beginAccess();
      v38 = *((_QWORD *)v37 + 1);
      if (v35)
      {
        if (!v38 || (v36 != *(_QWORD *)v37 || v35 != v38) && (sub_236B168AC() & 1) == 0)
          goto LABEL_27;
      }
      else if (v38)
      {
        goto LABEL_27;
      }
      v43 = (unint64_t *)(v2 + OBJC_IVAR____TtC5AskTo10ATQuestion_answerChoices);
      swift_beginAccess();
      v44 = *v43;
      v20 = v79;
      v45 = (unint64_t *)&v79[OBJC_IVAR____TtC5AskTo10ATQuestion_answerChoices];
      swift_beginAccess();
      v46 = *v45;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      v47 = sub_236B04228(v44, v46);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if ((v47 & 1) != 0)
      {
        v48 = (uint64_t *)(v2 + OBJC_IVAR____TtC5AskTo10ATQuestion_associatedContentDisplayName);
        swift_beginAccess();
        v49 = v48[1];
        v76 = *v48;
        v50 = &v20[OBJC_IVAR____TtC5AskTo10ATQuestion_associatedContentDisplayName];
        swift_beginAccess();
        v51 = *((_QWORD *)v50 + 1);
        if (v49)
        {
          if (!v51 || (v76 != *(_QWORD *)v50 || v49 != v51) && (sub_236B168AC() & 1) == 0)
            goto LABEL_27;
        }
        else if (v51)
        {
          goto LABEL_27;
        }
        v52 = (uint64_t *)(v2 + OBJC_IVAR____TtC5AskTo10ATQuestion_associatedContentIdentifier);
        swift_beginAccess();
        v54 = *v52;
        v53 = v52[1];
        v55 = &v79[OBJC_IVAR____TtC5AskTo10ATQuestion_associatedContentIdentifier];
        swift_beginAccess();
        v56 = *((_QWORD *)v55 + 1);
        if (v53)
        {
          if (!v56 || (v54 != *(_QWORD *)v55 || v53 != v56) && (sub_236B168AC() & 1) == 0)
            goto LABEL_27;
        }
        else if (v56)
        {
          goto LABEL_27;
        }
        v57 = (uint64_t *)(v2 + OBJC_IVAR____TtC5AskTo10ATQuestion_associatedContentBundleIdentifier);
        swift_beginAccess();
        v59 = *v57;
        v58 = v57[1];
        v60 = &v79[OBJC_IVAR____TtC5AskTo10ATQuestion_associatedContentBundleIdentifier];
        swift_beginAccess();
        v61 = *((_QWORD *)v60 + 1);
        if (v58)
        {
          if (!v61 || (v59 != *(_QWORD *)v60 || v58 != v61) && (sub_236B168AC() & 1) == 0)
            goto LABEL_27;
        }
        else if (v61)
        {
          goto LABEL_27;
        }
        v62 = (uint64_t *)(v2 + OBJC_IVAR____TtC5AskTo10ATQuestion_associatedContentAdamIdentifier);
        swift_beginAccess();
        v64 = *v62;
        v63 = v62[1];
        v65 = &v79[OBJC_IVAR____TtC5AskTo10ATQuestion_associatedContentAdamIdentifier];
        swift_beginAccess();
        v66 = *((_QWORD *)v65 + 1);
        if (v63)
        {
          if (v66 && (v64 == *(_QWORD *)v65 && v63 == v66 || (sub_236B168AC() & 1) != 0))
            goto LABEL_58;
        }
        else if (!v66)
        {
LABEL_58:
          v67 = v2 + OBJC_IVAR____TtC5AskTo10ATQuestion_expirationDate;
          swift_beginAccess();
          sub_236AFD788(v67, (uint64_t)v17, &qword_25643B5E0);
          v68 = &v79[OBJC_IVAR____TtC5AskTo10ATQuestion_expirationDate];
          swift_beginAccess();
          sub_236AFD788((uint64_t)v68, (uint64_t)v15, &qword_25643B5E0);
          v69 = v81;
          v70 = v81 + *(int *)(v7 + 48);
          sub_236AFD788((uint64_t)v17, v81, &qword_25643B5E0);
          sub_236AFD788((uint64_t)v15, v70, &qword_25643B5E0);
          v71 = v80;
          v72 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v80 + 48);
          v73 = v78;
          if (v72(v69, 1, v78) == 1)
          {

            sub_236AFD12C((uint64_t)v15, &qword_25643B5E0);
            sub_236AFD12C((uint64_t)v17, &qword_25643B5E0);
            if (v72(v70, 1, v73) == 1)
            {
              sub_236AFD12C(v69, &qword_25643B5E0);
              v41 = 1;
              return v41 & 1;
            }
          }
          else
          {
            v74 = (uint64_t)v77;
            sub_236AFD788(v69, (uint64_t)v77, &qword_25643B5E0);
            if (v72(v70, 1, v73) != 1)
            {
              (*(void (**)(char *, uint64_t, uint64_t))(v71 + 32))(v6, v70, v73);
              sub_236B05140(&qword_25643B668, 255, (uint64_t (*)(uint64_t))MEMORY[0x24BDCE900], MEMORY[0x24BDCE958]);
              v41 = sub_236B16534();

              v75 = *(void (**)(char *, uint64_t))(v71 + 8);
              v75(v6, v73);
              sub_236AFD12C((uint64_t)v15, &qword_25643B5E0);
              sub_236AFD12C((uint64_t)v17, &qword_25643B5E0);
              v75((char *)v74, v73);
              sub_236AFD12C(v69, &qword_25643B5E0);
              return v41 & 1;
            }

            sub_236AFD12C((uint64_t)v15, &qword_25643B5E0);
            sub_236AFD12C((uint64_t)v17, &qword_25643B5E0);
            (*(void (**)(uint64_t, uint64_t))(v71 + 8))(v74, v73);
          }
          v39 = (uint64_t *)&unk_25643B658;
          v40 = (_BYTE *)v69;
          goto LABEL_22;
        }
LABEL_27:

        goto LABEL_24;
      }
    }

  }
LABEL_24:
  v41 = 0;
  return v41 & 1;
}

uint64_t sub_236B0DE4C(void *a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(_OWORD *))
{
  id v6;
  id v7;
  char v8;
  _OWORD v10[2];

  if (a3)
  {
    v6 = a1;
    swift_unknownObjectRetain();
    sub_236B16714();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v10, 0, sizeof(v10));
    v7 = a1;
  }
  v8 = a4(v10);

  sub_236AFD12C((uint64_t)v10, &qword_25643B4F8);
  return v8 & 1;
}

uint64_t ATQuestion.hash.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _BYTE *v5;
  uint64_t v6;
  uint64_t v7;
  _BYTE *v8;
  id *v9;
  id v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  _BYTE v20[248];
  _OWORD v21[4];
  uint64_t v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  uint64_t v27;

  v1 = v0;
  v2 = sub_236B16474();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = &v20[-((v4 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_25643B5E0);
  MEMORY[0x24BDAC7A8](v6);
  v8 = &v20[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  sub_236B1696C();
  sub_236B164BC();
  sub_236B05140(&qword_25643B670, 255, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEA88]);
  sub_236B16528();
  sub_236B16948();
  swift_bridgeObjectRetain();
  sub_236B16588();
  swift_bridgeObjectRelease();
  v9 = (id *)(v0 + OBJC_IVAR____TtC5AskTo10ATQuestion_topic);
  swift_beginAccess();
  v10 = *v9;
  sub_236B166D8();

  swift_beginAccess();
  swift_bridgeObjectRetain();
  sub_236B16588();
  swift_bridgeObjectRelease();
  swift_beginAccess();
  swift_bridgeObjectRetain();
  sub_236B16588();
  swift_bridgeObjectRelease();
  v11 = v1 + OBJC_IVAR____TtC5AskTo10ATQuestion_notificationText;
  swift_beginAccess();
  if (*(_QWORD *)(v11 + 8))
  {
    sub_236B16930();
    swift_bridgeObjectRetain();
    sub_236B16588();
    swift_bridgeObjectRelease();
  }
  else
  {
    sub_236B16930();
  }
  v12 = (uint64_t *)(v1 + OBJC_IVAR____TtC5AskTo10ATQuestion_answerChoices);
  swift_beginAccess();
  v13 = *v12;
  swift_bridgeObjectRetain();
  sub_236B0451C(v21, v13);
  swift_bridgeObjectRelease();
  v14 = v1 + OBJC_IVAR____TtC5AskTo10ATQuestion_associatedContentDisplayName;
  swift_beginAccess();
  if (*(_QWORD *)(v14 + 8))
  {
    sub_236B16930();
    swift_bridgeObjectRetain();
    sub_236B16588();
    swift_bridgeObjectRelease();
  }
  else
  {
    sub_236B16930();
  }
  v15 = v1 + OBJC_IVAR____TtC5AskTo10ATQuestion_associatedContentIdentifier;
  swift_beginAccess();
  if (*(_QWORD *)(v15 + 8))
  {
    sub_236B16930();
    swift_bridgeObjectRetain();
    sub_236B16588();
    swift_bridgeObjectRelease();
  }
  else
  {
    sub_236B16930();
  }
  v16 = v1 + OBJC_IVAR____TtC5AskTo10ATQuestion_associatedContentBundleIdentifier;
  swift_beginAccess();
  if (*(_QWORD *)(v16 + 8))
  {
    sub_236B16930();
    swift_bridgeObjectRetain();
    sub_236B16588();
    swift_bridgeObjectRelease();
  }
  else
  {
    sub_236B16930();
  }
  v17 = v1 + OBJC_IVAR____TtC5AskTo10ATQuestion_associatedContentAdamIdentifier;
  swift_beginAccess();
  if (*(_QWORD *)(v17 + 8))
  {
    sub_236B16930();
    swift_bridgeObjectRetain();
    sub_236B16588();
    swift_bridgeObjectRelease();
  }
  else
  {
    sub_236B16930();
  }
  v18 = v1 + OBJC_IVAR____TtC5AskTo10ATQuestion_expirationDate;
  swift_beginAccess();
  sub_236AFD788(v18, (uint64_t)v8, &qword_25643B5E0);
  if ((*(unsigned int (**)(_BYTE *, uint64_t, uint64_t))(v3 + 48))(v8, 1, v2) == 1)
  {
    sub_236B16930();
  }
  else
  {
    (*(void (**)(_BYTE *, _BYTE *, uint64_t))(v3 + 32))(v5, v8, v2);
    sub_236B16930();
    sub_236B05140(&qword_25643B678, 255, (uint64_t (*)(uint64_t))MEMORY[0x24BDCE900], MEMORY[0x24BDCE930]);
    sub_236B16528();
    (*(void (**)(_BYTE *, uint64_t))(v3 + 8))(v5, v2);
  }
  v25 = v21[2];
  v26 = v21[3];
  v27 = v22;
  v23 = v21[0];
  v24 = v21[1];
  return sub_236B16954();
}

uint64_t ATQuestion.description.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t result;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  unint64_t v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  uint64_t v23;
  uint64_t ObjectType;
  unint64_t v25;
  uint64_t v26;
  unint64_t v27;

  v1 = v0;
  v2 = sub_236B16474();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v21 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  ObjectType = 0;
  v25 = 0xE000000000000000;
  sub_236B16738();
  v26 = ObjectType;
  v27 = v25;
  ObjectType = swift_getObjectType();
  __swift_instantiateConcreteTypeFromMangledName(&qword_25643B680);
  sub_236B1657C();
  sub_236B16594();
  swift_bridgeObjectRelease();
  sub_236B16594();
  sub_236B16480();
  sub_236B16594();
  swift_bridgeObjectRelease();
  sub_236B16594();
  sub_236B16660();
  sub_236B16594();
  swift_bridgeObjectRetain();
  sub_236B16594();
  swift_bridgeObjectRelease();
  sub_236B16594();
  swift_beginAccess();
  swift_bridgeObjectRetain();
  sub_236B16594();
  swift_bridgeObjectRelease();
  sub_236B16594();
  swift_beginAccess();
  swift_bridgeObjectRetain();
  sub_236B16594();
  swift_bridgeObjectRelease();
  sub_236B16594();
  swift_beginAccess();
  swift_bridgeObjectRetain();
  sub_236B16594();
  swift_bridgeObjectRelease();
  sub_236B16594();
  swift_beginAccess();
  swift_bridgeObjectRetain();
  sub_236B16594();
  swift_bridgeObjectRelease();
  sub_236B16594();
  swift_beginAccess();
  swift_bridgeObjectRetain();
  sub_236B16594();
  swift_bridgeObjectRelease();
  sub_236B16594();
  swift_beginAccess();
  swift_bridgeObjectRetain();
  sub_236B16594();
  swift_bridgeObjectRelease();
  sub_236B16594();
  swift_beginAccess();
  swift_bridgeObjectRetain();
  sub_236B16594();
  swift_bridgeObjectRelease();
  sub_236B16594();
  swift_beginAccess();
  swift_bridgeObjectRetain();
  sub_236B16594();
  swift_bridgeObjectRelease();
  sub_236B16594();
  v6 = v0 + OBJC_IVAR____TtC5AskTo10ATQuestion_expirationDate;
  swift_beginAccess();
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v3 + 48))(v6, 1, v2))
  {
    (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, v6, v2);
    sub_236B16450();
    (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  }
  sub_236B16594();
  swift_bridgeObjectRelease();
  sub_236B16594();
  v7 = (uint64_t *)(v1 + OBJC_IVAR____TtC5AskTo10ATQuestion_answerChoices);
  swift_beginAccess();
  v8 = *v7;
  if (!((unint64_t)*v7 >> 62))
  {
    v9 = *(_QWORD *)((v8 & 0xFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    if (v9)
      goto LABEL_5;
LABEL_15:
    swift_bridgeObjectRelease();
    v12 = MEMORY[0x24BEE4AF8];
LABEL_16:
    MEMORY[0x23B7FBC40](v12, MEMORY[0x24BEE0D00]);
    sub_236B16594();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    sub_236B16594();
    return v26;
  }
  swift_bridgeObjectRetain();
  v9 = sub_236B16780();
  if (!v9)
    goto LABEL_15;
LABEL_5:
  v23 = MEMORY[0x24BEE4AF8];
  result = sub_236B0F4C4(0, v9 & ~(v9 >> 63), 0);
  if ((v9 & 0x8000000000000000) == 0)
  {
    v11 = 0;
    v12 = v23;
    v22 = v8 & 0xC000000000000001;
    v13 = v8;
    do
    {
      if (v22)
        v14 = (char *)MEMORY[0x23B7FBD78](v11, v8);
      else
        v14 = (char *)*(id *)(v8 + 8 * v11 + 32);
      v15 = v14;
      v17 = *(_QWORD *)&v14[OBJC_IVAR____TtC5AskTo14ATAnswerChoice_id];
      v16 = *(_QWORD *)&v14[OBJC_IVAR____TtC5AskTo14ATAnswerChoice_id + 8];
      swift_bridgeObjectRetain();

      v23 = v12;
      v19 = *(_QWORD *)(v12 + 16);
      v18 = *(_QWORD *)(v12 + 24);
      if (v19 >= v18 >> 1)
      {
        sub_236B0F4C4(v18 > 1, v19 + 1, 1);
        v12 = v23;
      }
      ++v11;
      *(_QWORD *)(v12 + 16) = v19 + 1;
      v20 = v12 + 16 * v19;
      *(_QWORD *)(v20 + 32) = v17;
      *(_QWORD *)(v20 + 40) = v16;
      v8 = v13;
    }
    while (v9 != v11);
    swift_bridgeObjectRelease();
    goto LABEL_16;
  }
  __break(1u);
  return result;
}

void ATQuestion.init()()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

id _s5AskTo10ATQuestionC5TopicCfD_0()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_236B0EDC0@<X0>(_QWORD *a1@<X8>)
{
  return sub_236B0EDCC(&OBJC_IVAR____TtC5AskTo10ATQuestion_id, a1);
}

uint64_t sub_236B0EDCC@<X0>(_QWORD *a1@<X2>, _QWORD *a2@<X8>)
{
  _QWORD *v2;
  _QWORD *v3;
  uint64_t v4;

  v3 = (_QWORD *)(*v2 + *a1);
  v4 = v3[1];
  *a2 = *v3;
  a2[1] = v4;
  return swift_bridgeObjectRetain();
}

id sub_236B0EDE4@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  objc_class *v2;
  uint64_t v3;
  id v6;
  id result;

  v6 = objc_allocWithZone(v2);
  result = ATQuestion.init(from:)(a1);
  if (!v3)
    *a2 = result;
  return result;
}

uint64_t sub_236B0EE30(_QWORD *a1)
{
  return ATQuestion.encode(to:)(a1);
}

uint64_t static ATQuestion.supportsSecureCoding.getter()
{
  return 1;
}

id ATQuestion.init(coder:)(void *a1)
{
  objc_class *v1;
  id v3;

  v3 = objc_msgSend(objc_allocWithZone(v1), sel_initWithCoder_, a1);

  return v3;
}

{
  void *v1;
  objc_class *ObjectType;
  id v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  id v15;
  id v16;
  void *v17;
  void *v18;

  ObjectType = (objc_class *)swift_getObjectType();
  sub_236B04E6C(0, &qword_25643B4D8);
  v4 = v1;
  v5 = sub_236B166C0();
  if (v5)
  {
    v6 = (void *)v5;
    v7 = sub_236B16444();
    v9 = v8;
    v10 = objc_allocWithZone(MEMORY[0x24BDD1620]);
    v11 = sub_236B04D08();
    sub_236AFD17C(v7, v9);
    sub_236B05140((unint64_t *)&unk_25643B7F0, 255, (uint64_t (*)(uint64_t))type metadata accessor for ATQuestion, (uint64_t)&protocol conformance descriptor for ATQuestion);
    sub_236B166B4();

    if (v18)
    {
      v15 = objc_allocWithZone(ObjectType);
      v16 = sub_236B0FB68((uint64_t)v18);

      swift_getObjectType();
      swift_deallocPartialClassInstance();
      v13 = v16;
      objc_msgSend(v11, sel_finishDecoding);

      return v13;
    }
    sub_236B16690();
    sub_236B04E6C(0, (unint64_t *)&unk_25643B4E0);
    v17 = (void *)sub_236B166E4();
    sub_236B164D4();

    objc_msgSend(v11, sel_finishDecoding);
  }
  else
  {

    sub_236B16690();
    sub_236B04E6C(0, (unint64_t *)&unk_25643B4E0);
    v12 = (void *)sub_236B166E4();
    sub_236B164D4();

  }
  swift_getObjectType();
  swift_deallocPartialClassInstance();
  return 0;
}

Swift::Void __swiftcall ATQuestion.encode(with:)(NSCoder with)
{
  id v2;
  id v3;
  void *v4;
  void *v5;

  swift_getObjectType();
  v2 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDD1618]), sel_initRequiringSecureCoding_, 1);
  sub_236B05140((unint64_t *)&unk_25643B4B0, 255, (uint64_t (*)(uint64_t))type metadata accessor for ATQuestion, (uint64_t)&protocol conformance descriptor for ATQuestion);
  sub_236B166A8();
  objc_msgSend(v2, sel_finishEncoding);
  v3 = objc_msgSend(v2, sel_encodedData);
  if (v3)
  {
    v4 = v3;
    v5 = (void *)sub_236B16540();
    -[objc_class encodeObject:forKey:](with.super.isa, sel_encodeObject_forKey_, v4, v5);

  }
  else
  {
    __break(1u);
  }
}

uint64_t sub_236B0F4C4(char a1, int64_t a2, char a3)
{
  char **v3;
  uint64_t result;

  result = sub_236B0F4E0(a1, a2, a3, *v3);
  *v3 = (char *)result;
  return result;
}

uint64_t sub_236B0F4E0(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_25643B780);
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
  result = sub_236B167B0();
  __break(1u);
  return result;
}

uint64_t sub_236B0F648()
{
  unint64_t v0;

  v0 = sub_236B167BC();
  swift_bridgeObjectRelease();
  if (v0 >= 0xD)
    return 13;
  else
    return v0;
}

id sub_236B0F690(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v14;
  uint64_t v15;

  v15 = sub_236B164BC();
  v4 = *(_QWORD *)(v15 - 8);
  MEMORY[0x24BDAC7A8](v15);
  v6 = (char *)&v14 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_236B164B0();
  v7 = (void *)sub_236B1648C();
  v8 = (void *)sub_236B16540();
  swift_bridgeObjectRelease();
  v9 = (void *)sub_236B16540();
  swift_bridgeObjectRelease();
  v10 = (void *)sub_236B16540();
  swift_bridgeObjectRelease();
  type metadata accessor for ATAnswerChoice();
  v11 = (void *)sub_236B16600();
  v12 = objc_msgSend(v14, sel_initWithSystemId_version_id_topic_title_summary_notificationText_answerChoices_, v7, v8, a3, v9, v10, 0, 1.0, v11);

  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v15);
  return v12;
}

id sub_236B0F7FC(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, double a9, uint64_t a10, uint64_t a11, uint64_t a12)
{
  char *v12;
  char *v13;
  char *v19;
  char *v20;
  char *v21;
  char *v22;
  char *v23;
  char *v24;
  char *v25;
  uint64_t v26;
  char *v27;
  uint64_t v28;
  uint64_t v29;
  char *v30;
  char *v31;
  char *v32;
  char *v33;
  id v34;
  id v35;
  objc_class *ObjectType;
  objc_super v42;

  v13 = v12;
  ObjectType = (objc_class *)swift_getObjectType();
  v19 = &v12[OBJC_IVAR____TtC5AskTo10ATQuestion_notificationText];
  *(_QWORD *)v19 = 0;
  *((_QWORD *)v19 + 1) = 0;
  v20 = &v12[OBJC_IVAR____TtC5AskTo10ATQuestion_answerChoices];
  *(_QWORD *)&v12[OBJC_IVAR____TtC5AskTo10ATQuestion_answerChoices] = MEMORY[0x24BEE4AF8];
  v21 = &v12[OBJC_IVAR____TtC5AskTo10ATQuestion_associatedContentDisplayName];
  *(_QWORD *)v21 = 0;
  *((_QWORD *)v21 + 1) = 0;
  v22 = &v12[OBJC_IVAR____TtC5AskTo10ATQuestion_associatedContentIdentifier];
  *(_QWORD *)v22 = 0;
  *((_QWORD *)v22 + 1) = 0;
  v23 = &v12[OBJC_IVAR____TtC5AskTo10ATQuestion_associatedContentBundleIdentifier];
  *(_QWORD *)v23 = 0;
  *((_QWORD *)v23 + 1) = 0;
  v24 = &v12[OBJC_IVAR____TtC5AskTo10ATQuestion_associatedContentAdamIdentifier];
  *(_QWORD *)v24 = 0;
  *((_QWORD *)v24 + 1) = 0;
  v25 = &v12[OBJC_IVAR____TtC5AskTo10ATQuestion_expirationDate];
  v26 = sub_236B16474();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v26 - 8) + 56))(v25, 1, 1, v26);
  v27 = &v13[OBJC_IVAR____TtC5AskTo10ATQuestion_systemId];
  v28 = sub_236B164BC();
  v29 = *(_QWORD *)(v28 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v29 + 16))(v27, a1, v28);
  *(double *)&v13[OBJC_IVAR____TtC5AskTo10ATQuestion_version] = a9;
  v30 = &v13[OBJC_IVAR____TtC5AskTo10ATQuestion_id];
  *(_QWORD *)v30 = a2;
  *((_QWORD *)v30 + 1) = a3;
  *(_QWORD *)&v13[OBJC_IVAR____TtC5AskTo10ATQuestion_topic] = a4;
  v31 = &v13[OBJC_IVAR____TtC5AskTo10ATQuestion_title];
  *(_QWORD *)v31 = a5;
  *((_QWORD *)v31 + 1) = a6;
  v32 = &v13[OBJC_IVAR____TtC5AskTo10ATQuestion_summary];
  *(_QWORD *)v32 = a7;
  *((_QWORD *)v32 + 1) = a8;
  swift_beginAccess();
  *(_QWORD *)v19 = a10;
  *((_QWORD *)v19 + 1) = a11;
  v33 = v13;
  v34 = a4;
  swift_bridgeObjectRelease();
  swift_beginAccess();
  *(_QWORD *)v20 = a12;

  swift_bridgeObjectRelease();
  v42.receiver = v33;
  v42.super_class = ObjectType;
  v35 = objc_msgSendSuper2(&v42, sel_init);
  (*(void (**)(uint64_t, uint64_t))(v29 + 8))(a1, v28);
  return v35;
}

unint64_t sub_236B0FA40()
{
  unint64_t result;

  result = qword_25643B5F0;
  if (!qword_25643B5F0)
  {
    result = MEMORY[0x23B7FC3FC](&unk_236B18164, &type metadata for ATQuestion.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_25643B5F0);
  }
  return result;
}

uint64_t type metadata accessor for ATQuestion.Topic()
{
  return objc_opt_self();
}

uint64_t sub_236B0FAA4(unint64_t *a1, unint64_t *a2, uint64_t a3, uint64_t a4)
{
  uint64_t result;
  uint64_t v9;
  uint64_t v10;

  result = *a1;
  if (!result)
  {
    v9 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_25643B608);
    v10 = sub_236B05140(a2, 255, (uint64_t (*)(uint64_t))type metadata accessor for ATAnswerChoice, a3);
    result = MEMORY[0x23B7FC3FC](a4, v9, &v10);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t type metadata accessor for ATQuestion()
{
  uint64_t result;

  result = qword_25643B688;
  if (!qword_25643B688)
    return swift_getSingletonMetadata();
  return result;
}

id sub_236B0FB68(uint64_t a1)
{
  char *v1;
  char *v2;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  char *v7;
  char *v8;
  char *v9;
  char *v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  void **v19;
  void *v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t v23;
  char *v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t v27;
  char *v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t v31;
  char *v32;
  id v33;
  uint64_t *v34;
  uint64_t v35;
  char *v36;
  uint64_t *v37;
  uint64_t v38;
  uint64_t v39;
  char *v40;
  uint64_t *v41;
  uint64_t v42;
  uint64_t v43;
  char *v44;
  uint64_t *v45;
  uint64_t v46;
  uint64_t v47;
  char *v48;
  uint64_t *v49;
  uint64_t v50;
  uint64_t v51;
  char *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v58;
  uint64_t v59;
  char *v60;
  char *v61;
  char *v62;
  char *v63;
  char *v64;
  uint64_t v65;
  uint64_t v66;
  objc_class *ObjectType;
  objc_super v68;

  v2 = v1;
  ObjectType = (objc_class *)swift_getObjectType();
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_25643B5E0);
  MEMORY[0x24BDAC7A8](v4);
  v66 = (uint64_t)&v58 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = &v1[OBJC_IVAR____TtC5AskTo10ATQuestion_notificationText];
  *(_QWORD *)v6 = 0;
  *((_QWORD *)v6 + 1) = 0;
  v60 = &v1[OBJC_IVAR____TtC5AskTo10ATQuestion_answerChoices];
  *(_QWORD *)&v1[OBJC_IVAR____TtC5AskTo10ATQuestion_answerChoices] = MEMORY[0x24BEE4AF8];
  v7 = &v1[OBJC_IVAR____TtC5AskTo10ATQuestion_associatedContentDisplayName];
  v61 = &v1[OBJC_IVAR____TtC5AskTo10ATQuestion_associatedContentDisplayName];
  *(_QWORD *)v7 = 0;
  *((_QWORD *)v7 + 1) = 0;
  v8 = &v1[OBJC_IVAR____TtC5AskTo10ATQuestion_associatedContentIdentifier];
  v62 = &v1[OBJC_IVAR____TtC5AskTo10ATQuestion_associatedContentIdentifier];
  *(_QWORD *)v8 = 0;
  *((_QWORD *)v8 + 1) = 0;
  v9 = &v1[OBJC_IVAR____TtC5AskTo10ATQuestion_associatedContentBundleIdentifier];
  v63 = &v1[OBJC_IVAR____TtC5AskTo10ATQuestion_associatedContentBundleIdentifier];
  *(_QWORD *)v9 = 0;
  *((_QWORD *)v9 + 1) = 0;
  v10 = &v1[OBJC_IVAR____TtC5AskTo10ATQuestion_associatedContentAdamIdentifier];
  v64 = &v1[OBJC_IVAR____TtC5AskTo10ATQuestion_associatedContentAdamIdentifier];
  *(_QWORD *)v10 = 0;
  *((_QWORD *)v10 + 1) = 0;
  v11 = &v1[OBJC_IVAR____TtC5AskTo10ATQuestion_expirationDate];
  v65 = (uint64_t)v11;
  v12 = sub_236B16474();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 56))(v11, 1, 1, v12);
  v13 = a1 + OBJC_IVAR____TtC5AskTo10ATQuestion_systemId;
  v14 = &v2[OBJC_IVAR____TtC5AskTo10ATQuestion_systemId];
  v15 = sub_236B164BC();
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v15 - 8) + 16))(v14, v13, v15);
  *(_QWORD *)&v2[OBJC_IVAR____TtC5AskTo10ATQuestion_version] = *(_QWORD *)(a1
                                                                         + OBJC_IVAR____TtC5AskTo10ATQuestion_version);
  v17 = *(_QWORD *)(a1 + OBJC_IVAR____TtC5AskTo10ATQuestion_id);
  v59 = *(_QWORD *)(a1 + OBJC_IVAR____TtC5AskTo10ATQuestion_id + 8);
  v16 = v59;
  v18 = &v2[OBJC_IVAR____TtC5AskTo10ATQuestion_id];
  *(_QWORD *)v18 = v17;
  *((_QWORD *)v18 + 1) = v16;
  v19 = (void **)(a1 + OBJC_IVAR____TtC5AskTo10ATQuestion_topic);
  swift_beginAccess();
  v20 = *v19;
  *(_QWORD *)&v2[OBJC_IVAR____TtC5AskTo10ATQuestion_topic] = *v19;
  v21 = (uint64_t *)(a1 + OBJC_IVAR____TtC5AskTo10ATQuestion_title);
  swift_beginAccess();
  v22 = *v21;
  v23 = v21[1];
  v24 = &v2[OBJC_IVAR____TtC5AskTo10ATQuestion_title];
  *(_QWORD *)v24 = v22;
  *((_QWORD *)v24 + 1) = v23;
  v25 = (uint64_t *)(a1 + OBJC_IVAR____TtC5AskTo10ATQuestion_summary);
  swift_beginAccess();
  v26 = *v25;
  v27 = v25[1];
  v28 = &v2[OBJC_IVAR____TtC5AskTo10ATQuestion_summary];
  *(_QWORD *)v28 = v26;
  *((_QWORD *)v28 + 1) = v27;
  v29 = (uint64_t *)(a1 + OBJC_IVAR____TtC5AskTo10ATQuestion_notificationText);
  swift_beginAccess();
  v30 = *v29;
  v31 = v29[1];
  swift_beginAccess();
  *(_QWORD *)v6 = v30;
  *((_QWORD *)v6 + 1) = v31;
  v32 = v2;
  swift_bridgeObjectRetain();
  v33 = v20;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v34 = (uint64_t *)(a1 + OBJC_IVAR____TtC5AskTo10ATQuestion_answerChoices);
  swift_beginAccess();
  v35 = *v34;
  v36 = v60;
  swift_beginAccess();
  *(_QWORD *)v36 = v35;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v37 = (uint64_t *)(a1 + OBJC_IVAR____TtC5AskTo10ATQuestion_associatedContentDisplayName);
  swift_beginAccess();
  v39 = *v37;
  v38 = v37[1];
  v40 = v61;
  swift_beginAccess();
  *(_QWORD *)v40 = v39;
  *((_QWORD *)v40 + 1) = v38;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v41 = (uint64_t *)(a1 + OBJC_IVAR____TtC5AskTo10ATQuestion_associatedContentIdentifier);
  swift_beginAccess();
  v43 = *v41;
  v42 = v41[1];
  v44 = v62;
  swift_beginAccess();
  *(_QWORD *)v44 = v43;
  *((_QWORD *)v44 + 1) = v42;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v45 = (uint64_t *)(a1 + OBJC_IVAR____TtC5AskTo10ATQuestion_associatedContentBundleIdentifier);
  swift_beginAccess();
  v47 = *v45;
  v46 = v45[1];
  v48 = v63;
  swift_beginAccess();
  *(_QWORD *)v48 = v47;
  *((_QWORD *)v48 + 1) = v46;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v49 = (uint64_t *)(a1 + OBJC_IVAR____TtC5AskTo10ATQuestion_associatedContentAdamIdentifier);
  swift_beginAccess();
  v51 = *v49;
  v50 = v49[1];
  v52 = v64;
  swift_beginAccess();
  *(_QWORD *)v52 = v51;
  *((_QWORD *)v52 + 1) = v50;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v53 = a1 + OBJC_IVAR____TtC5AskTo10ATQuestion_expirationDate;
  swift_beginAccess();
  v54 = v53;
  v55 = v66;
  sub_236AFD788(v54, v66, &qword_25643B5E0);
  v56 = v65;
  swift_beginAccess();
  sub_236B0BBF0(v55, v56);
  swift_endAccess();

  v68.receiver = v32;
  v68.super_class = ObjectType;
  return objc_msgSendSuper2(&v68, sel_init);
}

uint64_t sub_236B10028()
{
  return MEMORY[0x24BEE0D10];
}

uint64_t sub_236B10034()
{
  return type metadata accessor for ATQuestion();
}

void sub_236B1003C()
{
  unint64_t v0;
  unint64_t v1;

  sub_236B164BC();
  if (v0 <= 0x3F)
  {
    sub_236B10144();
    if (v1 <= 0x3F)
      swift_updateClassMetadata2();
  }
}

uint64_t method lookup function for ATQuestion()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of ATQuestion.__allocating_init(systemId:version:id:topic:title:summary:notificationText:answerChoices:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 184))();
}

uint64_t dispatch thunk of ATQuestion.__allocating_init(from:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 200))();
}

void sub_236B10144()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_25643B698)
  {
    sub_236B16474();
    v0 = sub_236B166F0();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_25643B698);
  }
}

uint64_t method lookup function for ATQuestion.Topic()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of ATQuestion.Topic.__allocating_init(rawValue:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 88))();
}

uint64_t getEnumTagSinglePayload for ATQuestion.CodingKeys(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int v6;
  BOOL v7;
  int v8;

  if (!a2)
    return 0;
  if (a2 < 0xF4)
    goto LABEL_17;
  if (a2 + 12 >= 0xFFFF00)
    v2 = 4;
  else
    v2 = 2;
  if ((a2 + 12) >> 8 < 0xFF)
    v3 = 1;
  else
    v3 = v2;
  if (v3 == 4)
  {
    v4 = *(_DWORD *)(a1 + 1);
    if (v4)
      return (*a1 | (v4 << 8)) - 12;
  }
  else
  {
    if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
      return (*a1 | (v4 << 8)) - 12;
    }
    v4 = a1[1];
    if (a1[1])
      return (*a1 | (v4 << 8)) - 12;
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 0xD;
  v8 = v6 - 13;
  if (!v7)
    v8 = -1;
  return (v8 + 1);
}

uint64_t storeEnumTagSinglePayload for ATQuestion.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 12 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 12) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xF4)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xF3)
    return ((uint64_t (*)(void))((char *)&loc_236B10288 + 4 * byte_236B17ED7[v4]))();
  *a1 = a2 + 12;
  return ((uint64_t (*)(void))((char *)sub_236B102BC + 4 * byte_236B17ED2[v4]))();
}

uint64_t sub_236B102BC(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_236B102C4(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x236B102CCLL);
  return result;
}

uint64_t sub_236B102D8(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x236B102E0);
  *(_BYTE *)result = a2 + 12;
  return result;
}

uint64_t sub_236B102E4(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_236B102EC(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for ATQuestion.CodingKeys()
{
  return &type metadata for ATQuestion.CodingKeys;
}

unint64_t sub_236B1030C()
{
  unint64_t result;

  result = qword_25643B6A8;
  if (!qword_25643B6A8)
  {
    result = MEMORY[0x23B7FC3FC](&unk_236B1813C, &type metadata for ATQuestion.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_25643B6A8);
  }
  return result;
}

unint64_t sub_236B10354()
{
  unint64_t result;

  result = qword_25643B6B0;
  if (!qword_25643B6B0)
  {
    result = MEMORY[0x23B7FC3FC](&unk_236B18074, &type metadata for ATQuestion.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_25643B6B0);
  }
  return result;
}

unint64_t sub_236B1039C()
{
  unint64_t result;

  result = qword_25643B6B8;
  if (!qword_25643B6B8)
  {
    result = MEMORY[0x23B7FC3FC](&unk_236B1809C, &type metadata for ATQuestion.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_25643B6B8);
  }
  return result;
}

id sub_236B103EC(id result, id a2, char a3)
{
  if (a3 == 2 || a3 == 1)
    return result;
  if (!a3)
    return (id)swift_bridgeObjectRetain();
  return result;
}

void destroy for DictionaryRepresentableError(uint64_t a1)
{
  sub_236B10424(*(void **)a1, *(id *)(a1 + 8), *(_BYTE *)(a1 + 16));
}

void sub_236B10424(void *a1, id a2, char a3)
{
  if (a3 == 2 || a3 == 1)
  {

  }
  else if (!a3)
  {
    swift_bridgeObjectRelease();
  }
}

uint64_t _s9AskToCore28DictionaryRepresentableErrorOwCP_0(uint64_t a1, uint64_t a2)
{
  id v3;
  void *v4;
  char v5;

  v3 = *(id *)a2;
  v4 = *(void **)(a2 + 8);
  v5 = *(_BYTE *)(a2 + 16);
  sub_236B103EC(*(id *)a2, v4, v5);
  *(_QWORD *)a1 = v3;
  *(_QWORD *)(a1 + 8) = v4;
  *(_BYTE *)(a1 + 16) = v5;
  return a1;
}

uint64_t assignWithCopy for DictionaryRepresentableError(uint64_t a1, uint64_t a2)
{
  id v3;
  void *v4;
  char v5;
  void *v6;
  void *v7;
  char v8;

  v3 = *(id *)a2;
  v4 = *(void **)(a2 + 8);
  v5 = *(_BYTE *)(a2 + 16);
  sub_236B103EC(*(id *)a2, v4, v5);
  v6 = *(void **)a1;
  v7 = *(void **)(a1 + 8);
  *(_QWORD *)a1 = v3;
  *(_QWORD *)(a1 + 8) = v4;
  v8 = *(_BYTE *)(a1 + 16);
  *(_BYTE *)(a1 + 16) = v5;
  sub_236B10424(v6, v7, v8);
  return a1;
}

__n128 __swift_memcpy17_8(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  a1[1].n128_u8[0] = a2[1].n128_u8[0];
  *a1 = result;
  return result;
}

uint64_t assignWithTake for DictionaryRepresentableError(uint64_t a1, uint64_t a2)
{
  char v3;
  void *v4;
  void *v5;
  char v6;

  v3 = *(_BYTE *)(a2 + 16);
  v4 = *(void **)a1;
  v5 = *(void **)(a1 + 8);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  v6 = *(_BYTE *)(a1 + 16);
  *(_BYTE *)(a1 + 16) = v3;
  sub_236B10424(v4, v5, v6);
  return a1;
}

uint64_t getEnumTagSinglePayload for DictionaryRepresentableError(uint64_t a1, unsigned int a2)
{
  unsigned int v3;
  int v4;

  if (!a2)
    return 0;
  if (a2 >= 0xFE && *(_BYTE *)(a1 + 17))
    return (*(_DWORD *)a1 + 254);
  v3 = *(unsigned __int8 *)(a1 + 16);
  if (v3 <= 2)
    v4 = -1;
  else
    v4 = v3 ^ 0xFF;
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for DictionaryRepresentableError(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFD)
  {
    *(_BYTE *)(result + 16) = 0;
    *(_QWORD *)result = a2 - 254;
    *(_QWORD *)(result + 8) = 0;
    if (a3 >= 0xFE)
      *(_BYTE *)(result + 17) = 1;
  }
  else
  {
    if (a3 >= 0xFE)
      *(_BYTE *)(result + 17) = 0;
    if (a2)
      *(_BYTE *)(result + 16) = -(char)a2;
  }
  return result;
}

uint64_t sub_236B105CC(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 16);
}

uint64_t sub_236B105D4(uint64_t result, char a2)
{
  *(_BYTE *)(result + 16) = a2;
  return result;
}

ValueMetadata *type metadata accessor for DictionaryRepresentableError()
{
  return &type metadata for DictionaryRepresentableError;
}

uint64_t Transport.debugDescription.getter(__int16 a1)
{
  uint64_t result;

  if (!a1)
    return 0x6567617373654D69;
  result = sub_236B168C4();
  __break(1u);
  return result;
}

uint64_t Transport.init(rawValue:)(__int16 a1)
{
  return (a1 != 0) << 16;
}

unint64_t sub_236B1065C()
{
  unint64_t result;

  result = qword_25643B6C8;
  if (!qword_25643B6C8)
  {
    result = MEMORY[0x23B7FC3FC](&protocol conformance descriptor for Transport, &type metadata for Transport);
    atomic_store(result, (unint64_t *)&qword_25643B6C8);
  }
  return result;
}

_WORD *sub_236B106A0@<X0>(_WORD *result@<X0>, uint64_t a2@<X8>)
{
  BOOL v2;

  v2 = *result != 0;
  *(_WORD *)a2 = 0;
  *(_BYTE *)(a2 + 2) = v2;
  return result;
}

uint64_t sub_236B106B8()
{
  sub_236B107C0();
  return sub_236B165E8();
}

uint64_t sub_236B10714()
{
  sub_236B107C0();
  return sub_236B165D0();
}

uint64_t sub_236B10760()
{
  _WORD *v0;
  uint64_t result;

  if (!*v0)
    return 0x6567617373654D69;
  result = sub_236B168C4();
  __break(1u);
  return result;
}

ValueMetadata *type metadata accessor for Transport()
{
  return &type metadata for Transport;
}

unint64_t sub_236B107C0()
{
  unint64_t result;

  result = qword_25643B6D0;
  if (!qword_25643B6D0)
  {
    result = MEMORY[0x23B7FC3FC](&protocol conformance descriptor for Transport, &type metadata for Transport);
    atomic_store(result, (unint64_t *)&qword_25643B6D0);
  }
  return result;
}

unint64_t static AskToExtensionPoint.identifier.getter()
{
  return 0xD000000000000019;
}

ValueMetadata *type metadata accessor for AskToExtensionPoint()
{
  return &type metadata for AskToExtensionPoint;
}

uint64_t sub_236B10830()
{
  sub_236B16918();
  sub_236B16588();
  swift_bridgeObjectRelease();
  return sub_236B16960();
}

void sub_236B108E8(char a1)
{
  sub_236B16918();
  __asm { BR              X10 }
}

uint64_t sub_236B1092C()
{
  sub_236B16588();
  swift_bridgeObjectRelease();
  return sub_236B16960();
}

void sub_236B10994(uint64_t a1, char a2)
{
  sub_236B16918();
  __asm { BR              X10 }
}

uint64_t sub_236B109D4()
{
  sub_236B16588();
  swift_bridgeObjectRelease();
  return sub_236B16960();
}

uint64_t sub_236B10A3C()
{
  sub_236B16918();
  sub_236B16588();
  swift_bridgeObjectRelease();
  return sub_236B16960();
}

void sub_236B10AF4(char *a1)
{
  sub_236B13CD4(*a1);
}

void sub_236B10B00()
{
  char *v0;

  sub_236B108E8(*v0);
}

void sub_236B10B08()
{
  __asm { BR              X10 }
}

uint64_t sub_236B10B38()
{
  sub_236B16588();
  return swift_bridgeObjectRelease();
}

void sub_236B10B8C(uint64_t a1)
{
  char *v1;

  sub_236B10994(a1, *v1);
}

uint64_t sub_236B10B94@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = sub_236B12FAC();
  *a1 = result;
  return result;
}

uint64_t sub_236B10BC0()
{
  unsigned __int8 *v0;

  return ((uint64_t (*)(void))((char *)sub_236B10BE4 + 4 * byte_236B183A4[*v0]))();
}

void sub_236B10BE4(_QWORD *a1@<X8>)
{
  *a1 = 0x656C746974;
  a1[1] = 0xE500000000000000;
}

void sub_236B10BFC(_QWORD *a1@<X8>)
{
  *a1 = 0xD000000000000015;
  a1[1] = 0x8000000236B18C10;
}

void sub_236B10C1C(_QWORD *a1@<X8>)
{
  *a1 = 1684957547;
  a1[1] = 0xE400000000000000;
}

uint64_t sub_236B10C30()
{
  unsigned __int8 *v0;

  return ((uint64_t (*)(uint64_t, unint64_t))((char *)sub_236B10C54 + 4 * byte_236B183A8[*v0]))(25705, 0xE200000000000000);
}

uint64_t sub_236B10C54()
{
  return 0x656C746974;
}

unint64_t sub_236B10C68()
{
  return 0xD000000000000015;
}

uint64_t sub_236B10C84()
{
  return 1684957547;
}

uint64_t sub_236B10C94@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = sub_236B12FAC();
  *a1 = result;
  return result;
}

void sub_236B10CB8(_BYTE *a1@<X8>)
{
  *a1 = 4;
}

uint64_t sub_236B10CC4()
{
  sub_236B11B78();
  return sub_236B16990();
}

uint64_t sub_236B10CEC()
{
  sub_236B11B78();
  return sub_236B1699C();
}

uint64_t ATAnswerChoice.Kind.init(rawValue:)(unsigned __int16 a1)
{
  int v1;
  int v2;
  int v3;

  v1 = a1;
  if (a1)
  {
    if (a1 == 2)
      v2 = 2;
    else
      v2 = 0;
    v3 = a1 != 2;
    if (a1 == 1)
      v1 = 1;
    else
      v1 = v2;
    if (a1 == 1)
      v3 = 0;
  }
  else
  {
    v3 = 0;
  }
  return v1 | (v3 << 16);
}

unsigned __int16 *sub_236B10D54@<X0>(unsigned __int16 *result@<X0>, uint64_t a2@<X8>)
{
  unsigned int v2;
  BOOL v3;

  v2 = *result;
  v3 = v2 > 2;
  if (v2 > 2)
    LOWORD(v2) = 0;
  *(_WORD *)a2 = v2;
  *(_BYTE *)(a2 + 2) = v3;
  return result;
}

uint64_t sub_236B10D70()
{
  sub_236B13464();
  return sub_236B165E8();
}

uint64_t sub_236B10DCC()
{
  sub_236B13464();
  return sub_236B165D0();
}

uint64_t ATAnswerChoice.id.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + OBJC_IVAR____TtC5AskTo14ATAnswerChoice_id);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t ATAnswerChoice.title.getter()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;

  v1 = (uint64_t *)(v0 + OBJC_IVAR____TtC5AskTo14ATAnswerChoice_title);
  swift_beginAccess();
  v2 = *v1;
  swift_bridgeObjectRetain();
  return v2;
}

uint64_t ATAnswerChoice.title.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v5;

  v5 = (_QWORD *)(v2 + OBJC_IVAR____TtC5AskTo14ATAnswerChoice_title);
  swift_beginAccess();
  *v5 = a1;
  v5[1] = a2;
  return swift_bridgeObjectRelease();
}

uint64_t (*ATAnswerChoice.title.modify())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t ATAnswerChoice.completedRequestTitle.getter()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;

  v1 = (uint64_t *)(v0 + OBJC_IVAR____TtC5AskTo14ATAnswerChoice_completedRequestTitle);
  swift_beginAccess();
  v2 = *v1;
  swift_bridgeObjectRetain();
  return v2;
}

uint64_t ATAnswerChoice.completedRequestTitle.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v5;

  v5 = (_QWORD *)(v2 + OBJC_IVAR____TtC5AskTo14ATAnswerChoice_completedRequestTitle);
  swift_beginAccess();
  *v5 = a1;
  v5[1] = a2;
  return swift_bridgeObjectRelease();
}

uint64_t (*ATAnswerChoice.completedRequestTitle.modify())()
{
  swift_beginAccess();
  return j__swift_endAccess;
}

uint64_t ATAnswerChoice.kind.getter()
{
  uint64_t v0;
  unsigned __int16 *v1;

  v1 = (unsigned __int16 *)(v0 + OBJC_IVAR____TtC5AskTo14ATAnswerChoice_kind);
  swift_beginAccess();
  return *v1;
}

uint64_t ATAnswerChoice.kind.setter(__int16 a1)
{
  uint64_t v1;
  _WORD *v3;
  uint64_t result;

  v3 = (_WORD *)(v1 + OBJC_IVAR____TtC5AskTo14ATAnswerChoice_kind);
  result = swift_beginAccess();
  *v3 = a1;
  return result;
}

uint64_t (*ATAnswerChoice.kind.modify())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

id ATAnswerChoice.__allocating_init(id:title:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  objc_class *v4;
  char *v9;
  char *v10;
  char *v11;
  char *v12;
  objc_super v14;

  v9 = (char *)objc_allocWithZone(v4);
  v10 = &v9[OBJC_IVAR____TtC5AskTo14ATAnswerChoice_completedRequestTitle];
  *(_QWORD *)v10 = 0;
  *((_QWORD *)v10 + 1) = 0;
  *(_WORD *)&v9[OBJC_IVAR____TtC5AskTo14ATAnswerChoice_kind] = 0;
  v11 = &v9[OBJC_IVAR____TtC5AskTo14ATAnswerChoice_id];
  *(_QWORD *)v11 = a1;
  *((_QWORD *)v11 + 1) = a2;
  v12 = &v9[OBJC_IVAR____TtC5AskTo14ATAnswerChoice_title];
  *(_QWORD *)v12 = a3;
  *((_QWORD *)v12 + 1) = a4;
  v14.receiver = v9;
  v14.super_class = v4;
  return objc_msgSendSuper2(&v14, sel_init);
}

id ATAnswerChoice.init(id:title:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  char *v4;
  objc_class *ObjectType;
  char *v10;
  char *v11;
  char *v12;
  objc_super v14;

  ObjectType = (objc_class *)swift_getObjectType();
  v10 = &v4[OBJC_IVAR____TtC5AskTo14ATAnswerChoice_completedRequestTitle];
  *(_QWORD *)v10 = 0;
  *((_QWORD *)v10 + 1) = 0;
  *(_WORD *)&v4[OBJC_IVAR____TtC5AskTo14ATAnswerChoice_kind] = 0;
  v11 = &v4[OBJC_IVAR____TtC5AskTo14ATAnswerChoice_id];
  *(_QWORD *)v11 = a1;
  *((_QWORD *)v11 + 1) = a2;
  v12 = &v4[OBJC_IVAR____TtC5AskTo14ATAnswerChoice_title];
  *(_QWORD *)v12 = a3;
  *((_QWORD *)v12 + 1) = a4;
  v14.receiver = v4;
  v14.super_class = ObjectType;
  return objc_msgSendSuper2(&v14, sel_init);
}

id ATAnswerChoice.__allocating_init(id:title:completedRequestTitle:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  objc_class *v6;
  char *v13;
  char *v14;
  char *v15;
  char *v16;
  objc_super v18;

  v13 = (char *)objc_allocWithZone(v6);
  v14 = &v13[OBJC_IVAR____TtC5AskTo14ATAnswerChoice_completedRequestTitle];
  *(_QWORD *)v14 = 0;
  *((_QWORD *)v14 + 1) = 0;
  *(_WORD *)&v13[OBJC_IVAR____TtC5AskTo14ATAnswerChoice_kind] = 0;
  v15 = &v13[OBJC_IVAR____TtC5AskTo14ATAnswerChoice_id];
  *(_QWORD *)v15 = a1;
  *((_QWORD *)v15 + 1) = a2;
  v16 = &v13[OBJC_IVAR____TtC5AskTo14ATAnswerChoice_title];
  *(_QWORD *)v16 = a3;
  *((_QWORD *)v16 + 1) = a4;
  swift_beginAccess();
  *(_QWORD *)v14 = a5;
  *((_QWORD *)v14 + 1) = a6;
  swift_bridgeObjectRelease();
  v18.receiver = v13;
  v18.super_class = v6;
  return objc_msgSendSuper2(&v18, sel_init);
}

id ATAnswerChoice.init(id:title:completedRequestTitle:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  char *v6;
  objc_class *ObjectType;
  char *v14;
  char *v15;
  char *v16;
  objc_super v18;

  ObjectType = (objc_class *)swift_getObjectType();
  v14 = &v6[OBJC_IVAR____TtC5AskTo14ATAnswerChoice_completedRequestTitle];
  *(_QWORD *)v14 = 0;
  *((_QWORD *)v14 + 1) = 0;
  *(_WORD *)&v6[OBJC_IVAR____TtC5AskTo14ATAnswerChoice_kind] = 0;
  v15 = &v6[OBJC_IVAR____TtC5AskTo14ATAnswerChoice_id];
  *(_QWORD *)v15 = a1;
  *((_QWORD *)v15 + 1) = a2;
  v16 = &v6[OBJC_IVAR____TtC5AskTo14ATAnswerChoice_title];
  *(_QWORD *)v16 = a3;
  *((_QWORD *)v16 + 1) = a4;
  swift_beginAccess();
  *(_QWORD *)v14 = a5;
  *((_QWORD *)v14 + 1) = a6;
  swift_bridgeObjectRelease();
  v18.receiver = v6;
  v18.super_class = ObjectType;
  return objc_msgSendSuper2(&v18, sel_init);
}

id ATAnswerChoice.__allocating_init(from:)(_QWORD *a1)
{
  objc_class *v1;
  id v3;

  v3 = objc_allocWithZone(v1);
  return ATAnswerChoice.init(from:)(a1);
}

id ATAnswerChoice.init(from:)(_QWORD *a1)
{
  char *v1;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  char *v6;
  char *v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t *v13;
  char *v14;
  char *v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  char *v26;
  id v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  _QWORD *v31;
  objc_class *ObjectType;
  uint64_t *v33;
  char *v34;
  char *v35;
  objc_super v36;
  char v37;
  char v38;
  __int16 v39;

  ObjectType = (objc_class *)swift_getObjectType();
  v30 = __swift_instantiateConcreteTypeFromMangledName(&qword_25643B700);
  v3 = *(_QWORD *)(v30 - 8);
  MEMORY[0x24BDAC7A8](v30);
  v5 = (char *)&v28 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = &v1[OBJC_IVAR____TtC5AskTo14ATAnswerChoice_completedRequestTitle];
  *(_QWORD *)v6 = 0;
  *((_QWORD *)v6 + 1) = 0;
  v33 = (uint64_t *)v6;
  v7 = &v1[OBJC_IVAR____TtC5AskTo14ATAnswerChoice_kind];
  *(_WORD *)&v1[OBJC_IVAR____TtC5AskTo14ATAnswerChoice_kind] = 0;
  v8 = a1[3];
  v31 = a1;
  __swift_project_boxed_opaque_existential_1(a1, v8);
  sub_236B11B78();
  v34 = v1;
  v9 = v35;
  sub_236B16978();
  if (v9)
  {
    v13 = v33;
    v14 = v34;
    __swift_destroy_boxed_opaque_existential_0((uint64_t)v31);
    v27 = (id)v13[1];

    swift_bridgeObjectRelease();
    swift_deallocPartialClassInstance();
  }
  else
  {
    v35 = v7;
    v10 = v3;
    v38 = 0;
    v11 = v30;
    v12 = sub_236B16804();
    v16 = v34;
    v17 = (uint64_t *)&v34[OBJC_IVAR____TtC5AskTo14ATAnswerChoice_id];
    *v17 = v12;
    v17[1] = v18;
    v38 = 1;
    v19 = sub_236B16804();
    v20 = (uint64_t *)&v16[OBJC_IVAR____TtC5AskTo14ATAnswerChoice_title];
    *v20 = v19;
    v20[1] = v21;
    v38 = 2;
    v22 = sub_236B167C8();
    v29 = v23;
    v24 = v33;
    swift_beginAccess();
    v25 = v29;
    *v24 = v22;
    v24[1] = v25;
    swift_bridgeObjectRelease();
    v37 = 3;
    sub_236B11BBC();
    sub_236B1681C();
    (*(void (**)(char *, uint64_t))(v10 + 8))(v5, v11);
    LOWORD(v17) = v39;
    v26 = v35;
    swift_beginAccess();
    *(_WORD *)v26 = (_WORD)v17;

    v36.receiver = v16;
    v36.super_class = ObjectType;
    v27 = objc_msgSendSuper2(&v36, sel_init);
    __swift_destroy_boxed_opaque_existential_0((uint64_t)v31);
  }
  return v27;
}

unint64_t sub_236B11B78()
{
  unint64_t result;

  result = qword_25643B708;
  if (!qword_25643B708)
  {
    result = MEMORY[0x23B7FC3FC](&unk_236B18670, &type metadata for ATAnswerChoice.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_25643B708);
  }
  return result;
}

unint64_t sub_236B11BBC()
{
  unint64_t result;

  result = qword_25643B710;
  if (!qword_25643B710)
  {
    result = MEMORY[0x23B7FC3FC](&protocol conformance descriptor for ATAnswerChoice.Kind, &type metadata for ATAnswerChoice.Kind);
    atomic_store(result, (unint64_t *)&qword_25643B710);
  }
  return result;
}

uint64_t ATAnswerChoice.encode(to:)(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _BYTE *v8;
  __int16 *v10;
  _BYTE v11[6];
  __int16 v12;
  char v13;
  char v14;
  char v15;

  v3 = v1;
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_25643B718);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = &v11[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_236B11B78();
  sub_236B16984();
  v15 = 0;
  sub_236B16858();
  if (!v2)
  {
    swift_beginAccess();
    v14 = 1;
    swift_bridgeObjectRetain();
    sub_236B16858();
    swift_bridgeObjectRelease();
    swift_beginAccess();
    v13 = 2;
    swift_bridgeObjectRetain();
    sub_236B16834();
    swift_bridgeObjectRelease();
    v10 = (__int16 *)(v3 + OBJC_IVAR____TtC5AskTo14ATAnswerChoice_kind);
    swift_beginAccess();
    v12 = *v10;
    v11[5] = 3;
    sub_236B11E38();
    sub_236B1687C();
  }
  return (*(uint64_t (**)(_BYTE *, uint64_t))(v6 + 8))(v8, v5);
}

unint64_t sub_236B11E38()
{
  unint64_t result;

  result = qword_25643B720;
  if (!qword_25643B720)
  {
    result = MEMORY[0x23B7FC3FC](&protocol conformance descriptor for ATAnswerChoice.Kind, &type metadata for ATAnswerChoice.Kind);
    atomic_store(result, (unint64_t *)&qword_25643B720);
  }
  return result;
}

BOOL ATAnswerChoice.isEqual(_:)(uint64_t a1)
{
  uint64_t v1;
  BOOL v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  BOOL v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  unsigned __int16 *v14;
  int v15;
  char *v16;
  char *v18;
  _BYTE v19[24];
  uint64_t v20;

  swift_getObjectType();
  sub_236B04DE4(a1, (uint64_t)v19);
  if (v20)
  {
    if ((swift_dynamicCast() & 1) != 0)
    {
      v3 = *(_QWORD *)(v1 + OBJC_IVAR____TtC5AskTo14ATAnswerChoice_id) == *(_QWORD *)&v18[OBJC_IVAR____TtC5AskTo14ATAnswerChoice_id]
        && *(_QWORD *)(v1 + OBJC_IVAR____TtC5AskTo14ATAnswerChoice_id + 8) == *(_QWORD *)&v18[OBJC_IVAR____TtC5AskTo14ATAnswerChoice_id
                                                                                            + 8];
      if (v3 || (sub_236B168AC() & 1) != 0)
      {
        v4 = (uint64_t *)(v1 + OBJC_IVAR____TtC5AskTo14ATAnswerChoice_title);
        swift_beginAccess();
        v5 = *v4;
        v6 = v4[1];
        v7 = &v18[OBJC_IVAR____TtC5AskTo14ATAnswerChoice_title];
        swift_beginAccess();
        v8 = v5 == *(_QWORD *)v7 && v6 == *((_QWORD *)v7 + 1);
        if (v8 || (sub_236B168AC() & 1) != 0)
        {
          v9 = (uint64_t *)(v1 + OBJC_IVAR____TtC5AskTo14ATAnswerChoice_completedRequestTitle);
          swift_beginAccess();
          v10 = *v9;
          v11 = v9[1];
          v12 = &v18[OBJC_IVAR____TtC5AskTo14ATAnswerChoice_completedRequestTitle];
          swift_beginAccess();
          v13 = *((_QWORD *)v12 + 1);
          if (v11)
          {
            if (v13 && (v10 == *(_QWORD *)v12 && v11 == v13 || (sub_236B168AC() & 1) != 0))
              goto LABEL_18;
          }
          else if (!v13)
          {
LABEL_18:
            v14 = (unsigned __int16 *)(v1 + OBJC_IVAR____TtC5AskTo14ATAnswerChoice_kind);
            swift_beginAccess();
            v15 = *v14;
            v16 = &v18[OBJC_IVAR____TtC5AskTo14ATAnswerChoice_kind];
            swift_beginAccess();
            LODWORD(v16) = *(unsigned __int16 *)v16;

            return v15 == (_DWORD)v16;
          }
        }
      }

    }
  }
  else
  {
    sub_236B04E2C((uint64_t)v19);
  }
  return 0;
}

uint64_t ATAnswerChoice.hash.getter()
{
  uint64_t v0;
  uint64_t v1;

  sub_236B1696C();
  swift_bridgeObjectRetain();
  sub_236B16588();
  swift_bridgeObjectRelease();
  swift_beginAccess();
  swift_bridgeObjectRetain();
  sub_236B16588();
  swift_bridgeObjectRelease();
  v1 = v0 + OBJC_IVAR____TtC5AskTo14ATAnswerChoice_completedRequestTitle;
  swift_beginAccess();
  if (*(_QWORD *)(v1 + 8))
  {
    sub_236B16930();
    swift_bridgeObjectRetain();
    sub_236B16588();
    swift_bridgeObjectRelease();
  }
  else
  {
    sub_236B16930();
  }
  swift_beginAccess();
  sub_236B1693C();
  return sub_236B16954();
}

uint64_t ATAnswerChoice.description.getter()
{
  sub_236B16738();
  swift_getObjectType();
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_25643B730);
  sub_236B1657C();
  sub_236B16594();
  swift_bridgeObjectRelease();
  sub_236B16594();
  swift_bridgeObjectRetain();
  sub_236B16594();
  swift_bridgeObjectRelease();
  sub_236B16594();
  swift_beginAccess();
  swift_bridgeObjectRetain();
  sub_236B16594();
  swift_bridgeObjectRelease();
  sub_236B16594();
  swift_beginAccess();
  swift_bridgeObjectRetain();
  sub_236B16594();
  swift_bridgeObjectRelease();
  sub_236B16594();
  swift_beginAccess();
  sub_236B16768();
  sub_236B16594();
  return 0;
}

id ATAnswerChoice.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

void ATAnswerChoice.init()()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

id ATAnswerChoice.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_236B125D4@<X0>(_QWORD *a1@<X8>)
{
  _QWORD *v1;
  _QWORD *v2;
  uint64_t v3;

  v2 = (_QWORD *)(*v1 + OBJC_IVAR____TtC5AskTo14ATAnswerChoice_id);
  v3 = v2[1];
  *a1 = *v2;
  a1[1] = v3;
  return swift_bridgeObjectRetain();
}

id sub_236B125F0@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  objc_class *v2;
  uint64_t v3;
  id v6;
  id result;

  v6 = objc_allocWithZone(v2);
  result = ATAnswerChoice.init(from:)(a1);
  if (!v3)
    *a2 = result;
  return result;
}

uint64_t sub_236B1263C(_QWORD *a1)
{
  return ATAnswerChoice.encode(to:)(a1);
}

uint64_t static ATAnswerChoice.supportsSecureCoding.getter()
{
  return 1;
}

id ATAnswerChoice.init(coder:)(void *a1)
{
  objc_class *v1;
  id v3;

  v3 = objc_msgSend(objc_allocWithZone(v1), sel_initWithCoder_, a1);

  return v3;
}

{
  void *v1;
  void *ObjectType;
  id v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  id v10;
  os_log_type_t v11;
  NSObject *v12;
  os_log_type_t v13;
  uint8_t *v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  id v18;
  id v19;
  id v20;
  id v21;
  uint64_t v23;
  NSObject *v24;
  os_log_type_t v25;
  uint8_t *v26;
  uint64_t v27;
  uint64_t v28;
  unint64_t v29;
  uint64_t v30;
  id v31;

  ObjectType = (void *)swift_getObjectType();
  sub_236B04E6C(0, &qword_25643B4D8);
  v4 = v1;
  v5 = sub_236B166C0();
  if (!v5)
  {

    v11 = sub_236B16690();
    sub_236B04E6C(0, (unint64_t *)&unk_25643B4E0);
    v12 = sub_236B166E4();
    v13 = v11;
    if (os_log_type_enabled(v12, v11))
    {
      v14 = (uint8_t *)swift_slowAlloc();
      v15 = swift_slowAlloc();
      v30 = v15;
      v31 = ObjectType;
      *(_DWORD *)v14 = 136315138;
      swift_getMetatypeMetadata();
      v16 = sub_236B1657C();
      v31 = (id)sub_236AFB308(v16, v17, &v30);
      sub_236B166FC();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_236AF7000, v12, v13, "Not initializing %s (coder had nil value for key \"data\")", v14, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x23B7FC480](v15, -1, -1);
      MEMORY[0x23B7FC480](v14, -1, -1);
    }

    goto LABEL_8;
  }
  v6 = (void *)v5;
  v7 = sub_236B16444();
  v9 = v8;
  v10 = objc_allocWithZone(MEMORY[0x24BDD1620]);
  v18 = sub_236B04D08();
  sub_236AFD17C(v7, v9);
  sub_236B13168(&qword_25643B618, (uint64_t)&protocol conformance descriptor for ATAnswerChoice);
  sub_236B166B4();

  if (!v31)
  {
    v23 = sub_236B16690();
    sub_236B04E6C(0, (unint64_t *)&unk_25643B4E0);
    v24 = sub_236B166E4();
    v25 = v23;
    if (os_log_type_enabled(v24, (os_log_type_t)v23))
    {
      v26 = (uint8_t *)swift_slowAlloc();
      v27 = swift_slowAlloc();
      v30 = v27;
      v31 = ObjectType;
      *(_DWORD *)v26 = 136315138;
      swift_getMetatypeMetadata();
      v28 = sub_236B1657C();
      v31 = (id)sub_236AFB308(v28, v29, &v30);
      sub_236B166FC();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_236AF7000, v24, v25, "Not initializing %s (unarchiver had nil value for key \"value\")", v26, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x23B7FC480](v27, -1, -1);
      MEMORY[0x23B7FC480](v26, -1, -1);
    }

    objc_msgSend(v18, sel_finishDecoding);
LABEL_8:
    swift_getObjectType();
    swift_deallocPartialClassInstance();
    return 0;
  }
  v19 = objc_allocWithZone((Class)ObjectType);
  v20 = sub_236B12FF4((uint64_t)v31);

  swift_getObjectType();
  swift_deallocPartialClassInstance();
  v21 = v20;
  objc_msgSend(v18, sel_finishDecoding);

  return v21;
}

Swift::Void __swiftcall ATAnswerChoice.encode(with:)(NSCoder with)
{
  uint64_t v1;
  id v3;
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  swift_getObjectType();
  v3 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDD1618]), sel_initRequiringSecureCoding_, 1);
  v9 = v1;
  sub_236B13168((unint64_t *)&unk_25643B740, (uint64_t)&protocol conformance descriptor for ATAnswerChoice);
  sub_236B166A8();
  objc_msgSend(v3, sel_finishEncoding, v7, v8);
  v4 = objc_msgSend(v3, sel_encodedData);
  if (v4)
  {
    v5 = v4;
    v6 = (void *)sub_236B16540();
    -[objc_class encodeObject:forKey:](with.super.isa, sel_encodeObject_forKey_, v5, v6);

  }
  else
  {
    __break(1u);
  }
}

uint64_t type metadata accessor for ATAnswerChoice()
{
  return objc_opt_self();
}

uint64_t sub_236B12FAC()
{
  unint64_t v0;

  v0 = sub_236B167BC();
  swift_bridgeObjectRelease();
  if (v0 >= 4)
    return 4;
  else
    return v0;
}

id sub_236B12FF4(uint64_t a1)
{
  char *v1;
  char *v2;
  objc_class *ObjectType;
  char *v5;
  char *v6;
  uint64_t v7;
  char *v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  _WORD *v17;
  objc_super v19;

  v2 = v1;
  ObjectType = (objc_class *)swift_getObjectType();
  v5 = &v1[OBJC_IVAR____TtC5AskTo14ATAnswerChoice_completedRequestTitle];
  *(_QWORD *)v5 = 0;
  *((_QWORD *)v5 + 1) = 0;
  v6 = &v1[OBJC_IVAR____TtC5AskTo14ATAnswerChoice_kind];
  *(_WORD *)v6 = 0;
  v7 = *(_QWORD *)(a1 + OBJC_IVAR____TtC5AskTo14ATAnswerChoice_id + 8);
  v8 = &v2[OBJC_IVAR____TtC5AskTo14ATAnswerChoice_id];
  *(_QWORD *)v8 = *(_QWORD *)(a1 + OBJC_IVAR____TtC5AskTo14ATAnswerChoice_id);
  *((_QWORD *)v8 + 1) = v7;
  v9 = (uint64_t *)(a1 + OBJC_IVAR____TtC5AskTo14ATAnswerChoice_title);
  swift_beginAccess();
  v10 = *v9;
  v11 = v9[1];
  v12 = &v2[OBJC_IVAR____TtC5AskTo14ATAnswerChoice_title];
  *(_QWORD *)v12 = v10;
  *((_QWORD *)v12 + 1) = v11;
  v13 = (uint64_t *)(a1 + OBJC_IVAR____TtC5AskTo14ATAnswerChoice_completedRequestTitle);
  swift_beginAccess();
  v15 = *v13;
  v14 = v13[1];
  swift_beginAccess();
  *(_QWORD *)v5 = v15;
  *((_QWORD *)v5 + 1) = v14;
  v16 = v2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v17 = (_WORD *)(a1 + OBJC_IVAR____TtC5AskTo14ATAnswerChoice_kind);
  swift_beginAccess();
  LOWORD(v17) = *v17;
  swift_beginAccess();
  *(_WORD *)v6 = (_WORD)v17;

  v19.receiver = v16;
  v19.super_class = ObjectType;
  return objc_msgSendSuper2(&v19, sel_init);
}

uint64_t sub_236B13168(unint64_t *a1, uint64_t a2)
{
  uint64_t result;
  uint64_t v5;

  result = *a1;
  if (!result)
  {
    v5 = type metadata accessor for ATAnswerChoice();
    result = MEMORY[0x23B7FC3FC](a2, v5);
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_236B131A8()
{
  unint64_t result;

  result = qword_25643B750;
  if (!qword_25643B750)
  {
    result = MEMORY[0x23B7FC3FC](&protocol conformance descriptor for ATAnswerChoice.Kind, &type metadata for ATAnswerChoice.Kind);
    atomic_store(result, (unint64_t *)&qword_25643B750);
  }
  return result;
}

uint64_t method lookup function for ATAnswerChoice()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of ATAnswerChoice.__allocating_init(id:title:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 112))();
}

uint64_t dispatch thunk of ATAnswerChoice.__allocating_init(id:title:completedRequestTitle:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 120))();
}

uint64_t dispatch thunk of ATAnswerChoice.__allocating_init(from:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 136))();
}

ValueMetadata *type metadata accessor for ATAnswerChoice.Kind()
{
  return &type metadata for ATAnswerChoice.Kind;
}

uint64_t getEnumTagSinglePayload for ATAnswerChoice.CodingKeys(unsigned __int8 *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for ATAnswerChoice.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_236B1330C + 4 * byte_236B183B1[v4]))();
  *a1 = a2 + 3;
  return ((uint64_t (*)(void))((char *)sub_236B13340 + 4 * byte_236B183AC[v4]))();
}

uint64_t sub_236B13340(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_236B13348(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x236B13350);
  return result;
}

uint64_t sub_236B1335C(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x236B13364);
  *(_BYTE *)result = a2 + 3;
  return result;
}

uint64_t sub_236B13368(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_236B13370(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for ATAnswerChoice.CodingKeys()
{
  return &type metadata for ATAnswerChoice.CodingKeys;
}

unint64_t sub_236B13390()
{
  unint64_t result;

  result = qword_25643B760;
  if (!qword_25643B760)
  {
    result = MEMORY[0x23B7FC3FC](&unk_236B18648, &type metadata for ATAnswerChoice.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_25643B760);
  }
  return result;
}

unint64_t sub_236B133D8()
{
  unint64_t result;

  result = qword_25643B768;
  if (!qword_25643B768)
  {
    result = MEMORY[0x23B7FC3FC](&unk_236B18580, &type metadata for ATAnswerChoice.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_25643B768);
  }
  return result;
}

unint64_t sub_236B13420()
{
  unint64_t result;

  result = qword_25643B770;
  if (!qword_25643B770)
  {
    result = MEMORY[0x23B7FC3FC](&unk_236B185A8, &type metadata for ATAnswerChoice.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_25643B770);
  }
  return result;
}

unint64_t sub_236B13464()
{
  unint64_t result;

  result = qword_25643B778;
  if (!qword_25643B778)
  {
    result = MEMORY[0x23B7FC3FC](&protocol conformance descriptor for ATAnswerChoice.Kind, &type metadata for ATAnswerChoice.Kind);
    atomic_store(result, (unint64_t *)&qword_25643B778);
  }
  return result;
}

unint64_t sub_236B134A8()
{
  id v0;
  unint64_t result;

  v0 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDBACF8]), sel_init);
  result = sub_236AFA4E8(MEMORY[0x24BEE4AF8]);
  qword_25643E028 = (uint64_t)v0;
  unk_25643E030 = result;
  return result;
}

uint64_t sub_236B134F4(uint64_t a1, unint64_t a2, void *a3, uint64_t a4)
{
  unint64_t v8;
  char v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  os_log_type_t v13;
  uint8_t *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  id v19;
  uint64_t v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  id v25;
  id v26;
  id v27;
  uint64_t v28;
  void *v29;
  id v30;
  id v31;
  id v32;
  id v33;
  void *v34;
  uint64_t v35;
  id v36;
  id v37;
  NSObject *v38;
  os_log_type_t v39;
  uint64_t v40;
  _QWORD *v41;
  void *v42;
  id v43;
  uint64_t v45;
  id v46;
  uint64_t v47[2];

  v47[1] = *MEMORY[0x24BDAC8D0];
  if (*(_QWORD *)(a4 + 16))
  {
    swift_bridgeObjectRetain();
    v8 = sub_236AFBA14(a1, a2);
    if ((v9 & 1) != 0)
    {
      v10 = *(_QWORD *)(*(_QWORD *)(a4 + 56) + 8 * v8);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      if (qword_25643AC90 != -1)
        swift_once();
      v11 = sub_236B164F8();
      __swift_project_value_buffer(v11, (uint64_t)qword_25643DF90);
      swift_bridgeObjectRetain_n();
      v12 = sub_236B164E0();
      v13 = sub_236B1669C();
      if (os_log_type_enabled(v12, v13))
      {
        v14 = (uint8_t *)swift_slowAlloc();
        v15 = swift_slowAlloc();
        v47[0] = v15;
        *(_DWORD *)v14 = 136315138;
        swift_bridgeObjectRetain();
        v46 = (id)sub_236AFB308(a1, a2, v47);
        sub_236B166FC();
        swift_bridgeObjectRelease_n();
        _os_log_impl(&dword_236AF7000, v12, v13, "Using cached results for responder handle %s", v14, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x23B7FC480](v15, -1, -1);
        MEMORY[0x23B7FC480](v14, -1, -1);

      }
      else
      {

        swift_bridgeObjectRelease_n();
      }
      return v10;
    }
    swift_bridgeObjectRelease();
  }
  v16 = (void *)objc_opt_self();
  __swift_instantiateConcreteTypeFromMangledName(&qword_25643B780);
  v17 = swift_allocObject();
  *(_OWORD *)(v17 + 16) = xmmword_236B186C0;
  *(_QWORD *)(v17 + 32) = a1;
  *(_QWORD *)(v17 + 40) = a2;
  swift_bridgeObjectRetain();
  v18 = (void *)sub_236B16600();
  swift_bridgeObjectRelease();
  v19 = objc_msgSend(v16, sel_predicateForContactsMatchingHandleStrings_, v18);

  __swift_instantiateConcreteTypeFromMangledName(&qword_25643B788);
  v20 = swift_allocObject();
  *(_OWORD *)(v20 + 16) = xmmword_236B186D0;
  v21 = (void *)objc_opt_self();
  v22 = objc_msgSend(v21, sel_descriptorForRequiredKeysForStyle_, 0);
  v23 = (void *)*MEMORY[0x24BDBA288];
  *(_QWORD *)(v20 + 32) = v22;
  *(_QWORD *)(v20 + 40) = v23;
  v24 = (void *)*MEMORY[0x24BDBA348];
  *(_QWORD *)(v20 + 48) = *MEMORY[0x24BDBA348];
  v47[0] = v20;
  sub_236B16624();
  v25 = v23;
  v26 = v24;
  v27 = objc_msgSend(v21, sel_descriptorForRequiredKeysForStyle_, 1000);
  v28 = swift_unknownObjectRetain();
  MEMORY[0x23B7FBC1C](v28);
  if (*(_QWORD *)((v47[0] & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v47[0] & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
    sub_236B16630();
  sub_236B1663C();
  sub_236B16624();
  swift_unknownObjectRelease();
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_25643B790);
  v29 = (void *)sub_236B16600();
  swift_bridgeObjectRelease();
  v46 = 0;
  v30 = objc_msgSend(a3, sel_unifiedContactsMatchingPredicate_keysToFetch_error_, v19, v29, &v46);

  v31 = v46;
  if (v30)
  {
    sub_236B13B64();
    v10 = sub_236B1660C();
    v32 = v31;

  }
  else
  {
    v33 = v46;
    v34 = (void *)sub_236B16408();

    swift_willThrow();
    if (qword_25643AC90 != -1)
      swift_once();
    v35 = sub_236B164F8();
    __swift_project_value_buffer(v35, (uint64_t)qword_25643DF90);
    swift_bridgeObjectRetain();
    v36 = v34;
    swift_bridgeObjectRetain();
    v37 = v34;
    v38 = sub_236B164E0();
    v39 = sub_236B16690();
    if (os_log_type_enabled(v38, v39))
    {
      v40 = swift_slowAlloc();
      v41 = (_QWORD *)swift_slowAlloc();
      v42 = (void *)swift_slowAlloc();
      v46 = v42;
      *(_DWORD *)v40 = 136315394;
      swift_bridgeObjectRetain();
      sub_236AFB308(a1, a2, (uint64_t *)&v46);
      sub_236B166FC();
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v40 + 12) = 2112;
      v43 = v34;
      v45 = _swift_stdlib_bridgeErrorToNSError();
      sub_236B166FC();
      *v41 = v45;

      _os_log_impl(&dword_236AF7000, v38, v39, "Error fetching contacts for responder handle %s: %@", (uint8_t *)v40, 0x16u);
      __swift_instantiateConcreteTypeFromMangledName(&qword_25643B498);
      swift_arrayDestroy();
      MEMORY[0x23B7FC480](v41, -1, -1);
      swift_arrayDestroy();
      MEMORY[0x23B7FC480](v42, -1, -1);
      MEMORY[0x23B7FC480](v40, -1, -1);

    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
    return 0;
  }
  return v10;
}

unint64_t sub_236B13B64()
{
  unint64_t result;

  result = qword_25643B7A0;
  if (!qword_25643B7A0)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_25643B7A0);
  }
  return result;
}

uint64_t sub_236B13BA0(unsigned __int8 a1, unsigned __int8 a2)
{
  unint64_t v2;
  unint64_t v3;
  int v4;
  unint64_t v5;
  unint64_t v6;
  int v7;
  char v8;

  v2 = 0xD000000000000010;
  v3 = 0x8000000236B18C30;
  v4 = a1;
  if (a1)
  {
    if (a1 == 1)
      v5 = 0x65646E6F70736572;
    else
      v5 = 0x6E416E65736F6863;
    if (v4 == 1)
      v6 = 0xEF656C646E614872;
    else
      v6 = 0xEC00000072657773;
    v7 = a2;
    if (!a2)
      goto LABEL_15;
    goto LABEL_9;
  }
  v5 = 0xD000000000000010;
  v6 = 0x8000000236B18C30;
  v7 = a2;
  if (a2)
  {
LABEL_9:
    if (v7 == 1)
      v2 = 0x65646E6F70736572;
    else
      v2 = 0x6E416E65736F6863;
    if (v7 == 1)
      v3 = 0xEF656C646E614872;
    else
      v3 = 0xEC00000072657773;
  }
LABEL_15:
  if (v5 == v2 && v6 == v3)
    v8 = 1;
  else
    v8 = sub_236B168AC();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v8 & 1;
}

void sub_236B13CD4(char a1)
{
  __asm { BR              X10 }
}

uint64_t sub_236B13D0C(uint64_t a1, unsigned __int8 a2)
{
  return ((uint64_t (*)(uint64_t))((char *)sub_236B13D6C + 4 * byte_236B186EC[a2]))(0x656C746974);
}

uint64_t sub_236B13D6C(uint64_t a1)
{
  uint64_t v1;
  char v2;

  if (a1 == 0x656C746974 && v1 == 0xE500000000000000)
    v2 = 1;
  else
    v2 = sub_236B168AC();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v2 & 1;
}

uint64_t sub_236B13E0C(unsigned __int8 a1, unsigned __int8 a2)
{
  unint64_t v2;
  unint64_t v3;
  int v4;
  unint64_t v5;
  unint64_t v6;
  int v7;
  char v8;

  v2 = 0xEC0000006E6F6973;
  v3 = 0x7265566F546B7361;
  v4 = a1;
  if (a1)
  {
    if (a1 == 1)
      v5 = 0xD00000000000001BLL;
    else
      v5 = 0xD000000000000010;
    if (v4 == 1)
      v6 = 0x8000000236B18990;
    else
      v6 = 0x8000000236B189B0;
    v7 = a2;
    if (!a2)
      goto LABEL_15;
    goto LABEL_9;
  }
  v5 = 0x7265566F546B7361;
  v6 = 0xEC0000006E6F6973;
  v7 = a2;
  if (a2)
  {
LABEL_9:
    if (v7 == 1)
      v3 = 0xD00000000000001BLL;
    else
      v3 = 0xD000000000000010;
    if (v7 == 1)
      v2 = 0x8000000236B18990;
    else
      v2 = 0x8000000236B189B0;
  }
LABEL_15:
  if (v5 == v3 && v6 == v2)
    v8 = 1;
  else
    v8 = sub_236B168AC();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v8 & 1;
}

uint64_t ATResponse.description.getter()
{
  sub_236B16738();
  swift_getObjectType();
  __swift_instantiateConcreteTypeFromMangledName(&qword_25643B7B0);
  sub_236B1657C();
  sub_236B16594();
  swift_bridgeObjectRelease();
  sub_236B16594();
  swift_beginAccess();
  sub_236B164BC();
  sub_236B05140(&qword_25643B7C0, 255, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEAB8]);
  sub_236B16894();
  sub_236B16594();
  swift_bridgeObjectRelease();
  sub_236B16594();
  swift_bridgeObjectRetain();
  sub_236B16594();
  swift_bridgeObjectRelease();
  sub_236B16594();
  swift_beginAccess();
  swift_bridgeObjectRetain();
  sub_236B16594();
  swift_bridgeObjectRelease();
  sub_236B16594();
  swift_bridgeObjectRetain();
  sub_236B16594();
  swift_bridgeObjectRelease();
  sub_236B16594();
  return 0;
}

uint64_t sub_236B14178(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return sub_236B13BA0(*a1, *a2);
}

uint64_t sub_236B14184()
{
  sub_236B16918();
  sub_236B16588();
  swift_bridgeObjectRelease();
  return sub_236B16960();
}

uint64_t sub_236B1423C()
{
  sub_236B16588();
  return swift_bridgeObjectRelease();
}

uint64_t sub_236B142D0()
{
  sub_236B16918();
  sub_236B16588();
  swift_bridgeObjectRelease();
  return sub_236B16960();
}

uint64_t sub_236B14384@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = sub_236B1591C();
  *a1 = result;
  return result;
}

void sub_236B143B0(unint64_t *a1@<X8>)
{
  _BYTE *v1;
  int v2;
  unint64_t v3;
  unint64_t v4;
  uint64_t v5;
  BOOL v6;
  unint64_t v7;

  v2 = *v1;
  v3 = 0x8000000236B18C30;
  v4 = 0xEF656C646E614872;
  v5 = 0x65646E6F70736572;
  if (v2 != 1)
  {
    v5 = 0x6E416E65736F6863;
    v4 = 0xEC00000072657773;
  }
  v6 = v2 == 0;
  if (*v1)
    v7 = v5;
  else
    v7 = 0xD000000000000010;
  if (!v6)
    v3 = v4;
  *a1 = v7;
  a1[1] = v3;
}

unint64_t sub_236B14428()
{
  _BYTE *v0;
  uint64_t v1;

  v1 = 0x65646E6F70736572;
  if (*v0 != 1)
    v1 = 0x6E416E65736F6863;
  if (*v0)
    return v1;
  else
    return 0xD000000000000010;
}

uint64_t sub_236B1449C@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = sub_236B1591C();
  *a1 = result;
  return result;
}

void sub_236B144C0(_BYTE *a1@<X8>)
{
  *a1 = 3;
}

uint64_t sub_236B144CC()
{
  sub_236B15A5C();
  return sub_236B16990();
}

uint64_t sub_236B144F4()
{
  sub_236B15A5C();
  return sub_236B1699C();
}

id ATResponse.originalQuestion.getter()
{
  uint64_t v0;
  id *v1;

  v1 = (id *)(v0 + OBJC_IVAR____TtC9AskToCore10ATResponse_originalQuestion);
  swift_beginAccess();
  return *v1;
}

void ATResponse.originalQuestion.setter(void *a1)
{
  uint64_t v1;
  void **v3;
  void *v4;

  v3 = (void **)(v1 + OBJC_IVAR____TtC9AskToCore10ATResponse_originalQuestion);
  swift_beginAccess();
  v4 = *v3;
  *v3 = a1;

}

uint64_t (*ATResponse.originalQuestion.modify())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t ATResponse.responderHandle.getter()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;

  v1 = (uint64_t *)(v0 + OBJC_IVAR____TtC9AskToCore10ATResponse_responderHandle);
  swift_beginAccess();
  v2 = *v1;
  swift_bridgeObjectRetain();
  return v2;
}

uint64_t ATResponse.responderHandle.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v5;

  v5 = (_QWORD *)(v2 + OBJC_IVAR____TtC9AskToCore10ATResponse_responderHandle);
  swift_beginAccess();
  *v5 = a1;
  v5[1] = a2;
  return swift_bridgeObjectRelease();
}

uint64_t (*ATResponse.responderHandle.modify())()
{
  swift_beginAccess();
  return j__swift_endAccess;
}

uint64_t ATResponse.responderDisplayName.getter()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  uint64_t *v3;
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t result;
  id *v11;
  id *v12;
  uint64_t v13;
  uint64_t v14;

  if (qword_25643ACB8 != -1)
    swift_once();
  v1 = (void *)qword_25643E028;
  v2 = unk_25643E030;
  v3 = (uint64_t *)(v0 + OBJC_IVAR____TtC9AskToCore10ATResponse_responderHandle);
  swift_beginAccess();
  v4 = *v3;
  v5 = v3[1];
  swift_bridgeObjectRetain();
  v6 = sub_236B134F4(v4, v5, v1, v2);
  swift_bridgeObjectRelease();
  v7 = *v3;
  v8 = v3[1];
  if (!v6)
  {
    swift_bridgeObjectRetain();
    return v7;
  }
  if (!(v6 >> 62))
  {
    v9 = *(_QWORD *)((v6 & 0xFFFFFFFFFFFFFF8) + 0x10);
    result = swift_bridgeObjectRetain();
    if (v9)
      goto LABEL_6;
LABEL_12:
    swift_bridgeObjectRelease();
    return v7;
  }
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v14 = sub_236B16780();
  result = swift_bridgeObjectRelease();
  if (!v14)
    goto LABEL_12;
LABEL_6:
  if ((v6 & 0xC000000000000001) != 0)
  {
    v11 = (id *)MEMORY[0x23B7FBD78](0, v6);
    goto LABEL_9;
  }
  if (*(_QWORD *)((v6 & 0xFFFFFFFFFFFFFF8) + 0x10))
  {
    v11 = (id *)*(id *)(v6 + 32);
LABEL_9:
    v12 = v11;
    swift_bridgeObjectRelease();
    sub_236B0A1D4(v12, 1, v7, v8, *(id *)(v0 + OBJC_IVAR____TtC9AskToCore10ATResponse_displayNameContactFormatter));
    v7 = v13;
    swift_bridgeObjectRelease();

    return v7;
  }
  __break(1u);
  return result;
}

id ATResponse.chosenAnswer.getter()
{
  uint64_t v0;

  return *(id *)(v0 + OBJC_IVAR____TtC9AskToCore10ATResponse_chosenAnswer);
}

id ATResponse.__allocating_init(originalQuestion:responderHandle:chosenAnswer:)(void *a1, uint64_t a2, uint64_t a3, void *a4)
{
  objc_class *v4;
  id v9;
  id v10;

  v9 = objc_allocWithZone(v4);
  v10 = sub_236B15964(a1, a2, a3, a4);

  return v10;
}

id ATResponse.init(originalQuestion:responderHandle:chosenAnswer:)(void *a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v6;

  v6 = sub_236B15964(a1, a2, a3, a4);

  return v6;
}

id ATResponse.__allocating_init(from:)(_QWORD *a1)
{
  objc_class *v1;
  id v3;

  v3 = objc_allocWithZone(v1);
  return ATResponse.init(from:)(a1);
}

id ATResponse.init(from:)(_QWORD *a1)
{
  char *v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  char *v7;
  id v8;
  char *v9;
  id v10;
  uint64_t v11;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  objc_class *ObjectType;
  objc_super v23;
  char v24;
  uint64_t v25;

  ObjectType = (objc_class *)swift_getObjectType();
  v21 = __swift_instantiateConcreteTypeFromMangledName(&qword_25643B7E0);
  v4 = *(_QWORD *)(v21 - 8);
  MEMORY[0x24BDAC7A8](v21);
  v6 = (char *)&v20 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = &v1[OBJC_IVAR____TtC9AskToCore10ATResponse_displayNameContactFormatter];
  v8 = objc_allocWithZone(MEMORY[0x24BDBACC0]);
  v9 = v1;
  v10 = objc_msgSend(v8, sel_init);
  objc_msgSend(v10, sel_setStyle_, 1000);
  *(_QWORD *)v7 = v10;
  v7[8] = 1;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_236B15A5C();
  sub_236B16978();
  if (v2)
  {
    __swift_destroy_boxed_opaque_existential_0((uint64_t)a1);
    v19 = *(id *)v7;

    swift_deallocPartialClassInstance();
  }
  else
  {
    v11 = v4;
    type metadata accessor for ATQuestion();
    v24 = 0;
    sub_236B05140((unint64_t *)&unk_25643B7F0, 255, (uint64_t (*)(uint64_t))type metadata accessor for ATQuestion, (uint64_t)&protocol conformance descriptor for ATQuestion);
    sub_236B1681C();
    v13 = v9;
    v14 = OBJC_IVAR____TtC9AskToCore10ATResponse_originalQuestion;
    *(_QWORD *)&v13[OBJC_IVAR____TtC9AskToCore10ATResponse_originalQuestion] = v25;
    LOBYTE(v25) = 1;
    v15 = sub_236B16804();
    v20 = v14;
    v16 = (uint64_t *)&v13[OBJC_IVAR____TtC9AskToCore10ATResponse_responderHandle];
    *v16 = v15;
    v16[1] = v17;
    type metadata accessor for ATAnswerChoice();
    v24 = 2;
    sub_236B05140(&qword_25643B618, 255, (uint64_t (*)(uint64_t))type metadata accessor for ATAnswerChoice, (uint64_t)&protocol conformance descriptor for ATAnswerChoice);
    v18 = v21;
    sub_236B1681C();
    (*(void (**)(char *, uint64_t))(v11 + 8))(v6, v18);
    *(_QWORD *)&v13[OBJC_IVAR____TtC9AskToCore10ATResponse_chosenAnswer] = v25;

    v23.receiver = v13;
    v23.super_class = ObjectType;
    v19 = objc_msgSendSuper2(&v23, sel_init);
    __swift_destroy_boxed_opaque_existential_0((uint64_t)a1);
  }
  return v19;
}

uint64_t ATResponse.encode(to:)(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _BYTE *v8;
  uint64_t *v9;
  _BYTE v11[8];
  uint64_t v12;
  uint64_t v13;

  v3 = v1;
  v5 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_25643B800);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = &v11[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_236B15A5C();
  sub_236B16984();
  v9 = (uint64_t *)(v3 + OBJC_IVAR____TtC9AskToCore10ATResponse_originalQuestion);
  swift_beginAccess();
  v13 = *v9;
  LOBYTE(v12) = 0;
  type metadata accessor for ATQuestion();
  sub_236B05140((unint64_t *)&unk_25643B4B0, 255, (uint64_t (*)(uint64_t))type metadata accessor for ATQuestion, (uint64_t)&protocol conformance descriptor for ATQuestion);
  sub_236B1687C();
  if (!v2)
  {
    swift_beginAccess();
    LOBYTE(v12) = 1;
    swift_bridgeObjectRetain();
    sub_236B16858();
    swift_bridgeObjectRelease();
    v12 = *(_QWORD *)(v3 + OBJC_IVAR____TtC9AskToCore10ATResponse_chosenAnswer);
    v11[7] = 2;
    type metadata accessor for ATAnswerChoice();
    sub_236B05140((unint64_t *)&unk_25643B740, 255, (uint64_t (*)(uint64_t))type metadata accessor for ATAnswerChoice, (uint64_t)&protocol conformance descriptor for ATAnswerChoice);
    sub_236B1687C();
  }
  return (*(uint64_t (**)(_BYTE *, uint64_t))(v6 + 8))(v8, v5);
}

uint64_t static ATResponse.supportsSecureCoding.getter()
{
  return 1;
}

id ATResponse.__allocating_init(coder:)(void *a1)
{
  objc_class *v1;
  id v3;

  v3 = objc_allocWithZone(v1);
  return ATResponse.init(coder:)(a1);
}

id ATResponse.init(coder:)(void *a1)
{
  void *v1;
  objc_class *ObjectType;
  id v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  uint64_t v15;
  id v16;
  id v17;
  void *v18;
  void *v19;

  ObjectType = (objc_class *)swift_getObjectType();
  sub_236B04E6C(0, &qword_25643B4D8);
  v4 = v1;
  v5 = sub_236B166C0();
  if (v5)
  {
    v6 = (void *)v5;
    v7 = sub_236B16444();
    v9 = v8;
    v10 = objc_allocWithZone(MEMORY[0x24BDD1620]);
    v11 = sub_236B04D08();
    sub_236AFD17C(v7, v9);
    sub_236B05140(&qword_25643B530, v15, (uint64_t (*)(uint64_t))type metadata accessor for ATResponse, (uint64_t)&protocol conformance descriptor for ATResponse);
    sub_236B166B4();

    if (v19)
    {
      v16 = objc_allocWithZone(ObjectType);
      v17 = sub_236B15AC0((uint64_t)v19);

      swift_getObjectType();
      swift_deallocPartialClassInstance();
      v13 = v17;
      objc_msgSend(v11, sel_finishDecoding);

      return v13;
    }
    sub_236B16690();
    sub_236B04E6C(0, (unint64_t *)&unk_25643B4E0);
    v18 = (void *)sub_236B166E4();
    sub_236B164D4();

    objc_msgSend(v11, sel_finishDecoding);
  }
  else
  {

    sub_236B16690();
    sub_236B04E6C(0, (unint64_t *)&unk_25643B4E0);
    v12 = (void *)sub_236B166E4();
    sub_236B164D4();

  }
  swift_getObjectType();
  swift_deallocPartialClassInstance();
  return 0;
}

Swift::Void __swiftcall ATResponse.encode(with:)(NSCoder with)
{
  id v2;
  uint64_t v3;
  id v4;
  void *v5;
  void *v6;

  swift_getObjectType();
  v2 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDD1618]), sel_initRequiringSecureCoding_, 1);
  sub_236B05140(&qword_25643B810, v3, (uint64_t (*)(uint64_t))type metadata accessor for ATResponse, (uint64_t)&protocol conformance descriptor for ATResponse);
  sub_236B166A8();
  objc_msgSend(v2, sel_finishEncoding);
  v4 = objc_msgSend(v2, sel_encodedData);
  if (v4)
  {
    v5 = v4;
    v6 = (void *)sub_236B16540();
    -[objc_class encodeObject:forKey:](with.super.isa, sel_encodeObject_forKey_, v5, v6);

  }
  else
  {
    __break(1u);
  }
}

void ATResponse.copy(with:)(_QWORD *a1@<X8>)
{
  void *v1;
  objc_class *ObjectType;
  id v4;
  id v5;
  id v6;

  ObjectType = (objc_class *)swift_getObjectType();
  v4 = objc_allocWithZone(ObjectType);
  v5 = v1;
  v6 = sub_236B15AC0((uint64_t)v5);

  a1[3] = ObjectType;
  *a1 = v6;
}

id ATResponse.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

void ATResponse.init()()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

id ATResponse.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

id sub_236B158B0@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  objc_class *v2;
  uint64_t v3;
  id v6;
  id result;

  v6 = objc_allocWithZone(v2);
  result = ATResponse.init(from:)(a1);
  if (!v3)
    *a2 = result;
  return result;
}

uint64_t sub_236B158FC(_QWORD *a1)
{
  return ATResponse.encode(to:)(a1);
}

uint64_t sub_236B1591C()
{
  unint64_t v0;

  v0 = sub_236B167BC();
  swift_bridgeObjectRelease();
  if (v0 >= 3)
    return 3;
  else
    return v0;
}

id sub_236B15964(void *a1, uint64_t a2, uint64_t a3, void *a4)
{
  char *v4;
  char *v5;
  objc_class *ObjectType;
  char *v11;
  id v12;
  char *v13;
  id v14;
  char *v15;
  id v16;
  id v17;
  objc_super v19;

  v5 = v4;
  ObjectType = (objc_class *)swift_getObjectType();
  v11 = &v5[OBJC_IVAR____TtC9AskToCore10ATResponse_displayNameContactFormatter];
  v12 = objc_allocWithZone(MEMORY[0x24BDBACC0]);
  v13 = v5;
  v14 = objc_msgSend(v12, sel_init);
  objc_msgSend(v14, sel_setStyle_, 1000);
  *(_QWORD *)v11 = v14;
  v11[8] = 1;
  *(_QWORD *)&v13[OBJC_IVAR____TtC9AskToCore10ATResponse_originalQuestion] = a1;
  v15 = &v13[OBJC_IVAR____TtC9AskToCore10ATResponse_responderHandle];
  *(_QWORD *)v15 = a2;
  *((_QWORD *)v15 + 1) = a3;
  *(_QWORD *)&v13[OBJC_IVAR____TtC9AskToCore10ATResponse_chosenAnswer] = a4;
  v16 = a1;
  v17 = a4;

  v19.receiver = v13;
  v19.super_class = ObjectType;
  return objc_msgSendSuper2(&v19, sel_init);
}

unint64_t sub_236B15A5C()
{
  unint64_t result;

  result = qword_25643B7E8;
  if (!qword_25643B7E8)
  {
    result = MEMORY[0x23B7FC3FC](&unk_236B1886C, &type metadata for ATResponse.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_25643B7E8);
  }
  return result;
}

uint64_t type metadata accessor for ATResponse()
{
  return objc_opt_self();
}

id sub_236B15AC0(uint64_t a1)
{
  char *v1;
  char *v2;
  objc_class *ObjectType;
  char *v5;
  id v6;
  char *v7;
  id v8;
  void **v9;
  void *v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  void *v15;
  id v16;
  id v17;
  objc_super v19;

  v2 = v1;
  ObjectType = (objc_class *)swift_getObjectType();
  v5 = &v2[OBJC_IVAR____TtC9AskToCore10ATResponse_displayNameContactFormatter];
  v6 = objc_allocWithZone(MEMORY[0x24BDBACC0]);
  v7 = v2;
  v8 = objc_msgSend(v6, sel_init);
  objc_msgSend(v8, sel_setStyle_, 1000);
  *(_QWORD *)v5 = v8;
  v5[8] = 1;
  v9 = (void **)(a1 + OBJC_IVAR____TtC9AskToCore10ATResponse_originalQuestion);
  swift_beginAccess();
  v10 = *v9;
  *(_QWORD *)&v7[OBJC_IVAR____TtC9AskToCore10ATResponse_originalQuestion] = *v9;
  v11 = (uint64_t *)(a1 + OBJC_IVAR____TtC9AskToCore10ATResponse_responderHandle);
  swift_beginAccess();
  v12 = *v11;
  v13 = v11[1];
  v14 = &v7[OBJC_IVAR____TtC9AskToCore10ATResponse_responderHandle];
  *(_QWORD *)v14 = v12;
  *((_QWORD *)v14 + 1) = v13;
  v15 = *(void **)(a1 + OBJC_IVAR____TtC9AskToCore10ATResponse_chosenAnswer);
  *(_QWORD *)&v7[OBJC_IVAR____TtC9AskToCore10ATResponse_chosenAnswer] = v15;
  v16 = v10;
  swift_bridgeObjectRetain();
  v17 = v15;

  v19.receiver = v7;
  v19.super_class = ObjectType;
  return objc_msgSendSuper2(&v19, sel_init);
}

uint64_t method lookup function for ATResponse()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of ATResponse.__allocating_init(originalQuestion:responderHandle:chosenAnswer:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 112))();
}

uint64_t dispatch thunk of ATResponse.__allocating_init(from:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 128))();
}

uint64_t storeEnumTagSinglePayload for ATResponse.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 2 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 2) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xFE)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xFD)
    return ((uint64_t (*)(void))((char *)&loc_236B15C68 + 4 * byte_236B186F5[v4]))();
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)sub_236B15C9C + 4 * byte_236B186F0[v4]))();
}

uint64_t sub_236B15C9C(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_236B15CA4(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x236B15CACLL);
  return result;
}

uint64_t sub_236B15CB8(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x236B15CC0);
  *(_BYTE *)result = a2 + 2;
  return result;
}

uint64_t sub_236B15CC4(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_236B15CCC(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for ATResponse.CodingKeys()
{
  return &type metadata for ATResponse.CodingKeys;
}

unint64_t sub_236B15CEC()
{
  unint64_t result;

  result = qword_25643B818;
  if (!qword_25643B818)
  {
    result = MEMORY[0x23B7FC3FC](&unk_236B18844, &type metadata for ATResponse.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_25643B818);
  }
  return result;
}

unint64_t sub_236B15D34()
{
  unint64_t result;

  result = qword_25643B820;
  if (!qword_25643B820)
  {
    result = MEMORY[0x23B7FC3FC](&unk_236B1877C, &type metadata for ATResponse.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_25643B820);
  }
  return result;
}

unint64_t sub_236B15D7C()
{
  unint64_t result;

  result = qword_25643B828[0];
  if (!qword_25643B828[0])
  {
    result = MEMORY[0x23B7FC3FC](&unk_236B187A4, &type metadata for ATResponse.CodingKeys);
    atomic_store(result, qword_25643B828);
  }
  return result;
}

uint64_t sub_236B15DC4()
{
  uint64_t result;
  unint64_t v1;

  result = swift_checkMetadataState();
  if (v1 <= 0x3F)
  {
    result = swift_initClassMetadata2();
    if (!result)
      return 0;
  }
  return result;
}

uint64_t sub_236B15E34(void *a1, uint64_t a2)
{
  id v4;

  v4 = objc_msgSend((id)objc_opt_self(), sel_interfaceWithProtocol_, &unk_256441100);
  objc_msgSend(a1, sel_setExportedInterface_, v4);

  objc_msgSend(a1, sel_setExportedObject_, a2);
  objc_msgSend(a1, sel_resume);
  return 1;
}

uint64_t sub_236B15ECC(uint64_t a1, void (*a2)(_QWORD, uint64_t, unint64_t))
{
  _QWORD *v2;
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;

  v4 = (*(uint64_t (**)(uint64_t, _QWORD))(*(_QWORD *)((*MEMORY[0x24BEE4EA0] & *v2) + 0x58) + 16))(a1, *(_QWORD *)((*MEMORY[0x24BEE4EA0] & *v2) + 0x50));
  v6 = v5;
  sub_236AFD1C0(v4, v5);
  a2(0, v4, v6);
  sub_236AFD17C(v4, v6);
  return sub_236AFD17C(v4, v6);
}

uint64_t sub_236B15FA8(void *a1, int a2, void *a3, void *aBlock)
{
  void *v6;
  id v7;
  id v8;

  v6 = _Block_copy(aBlock);
  *(_QWORD *)(swift_allocObject() + 16) = v6;
  v7 = a3;
  v8 = a1;
  sub_236B15ECC((uint64_t)v7, sub_236B162E4);

  return swift_release();
}

void sub_236B16028(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  void *v6;
  uint64_t v7;
  id v8;

  if (a1)
    v6 = (void *)sub_236B163FC();
  else
    v6 = 0;
  if (a3 >> 60 == 15)
    v7 = 0;
  else
    v7 = sub_236B1642C();
  v8 = (id)v7;
  (*(void (**)(uint64_t, void *))(a4 + 16))(a4, v6);

}

void sub_236B160B0()
{
  sub_236B16294();
}

id sub_236B160CC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v4;
  objc_class *v5;
  objc_super v7;

  v5 = (objc_class *)type metadata accessor for _AskToExtensionConfiguration.ExportedObject(0, *(_QWORD *)((*MEMORY[0x24BEE4EA0] & *v4) + 0x50), *(_QWORD *)((*MEMORY[0x24BEE4EA0] & *v4) + 0x58), a4);
  v7.receiver = v4;
  v7.super_class = v5;
  return objc_msgSendSuper2(&v7, sel_dealloc);
}

uint64_t sub_236B16118(char *a1)
{
  return (*(uint64_t (**)(char *))(*(_QWORD *)(*(_QWORD *)((*MEMORY[0x24BEE4EA0] & *(_QWORD *)a1) + 0x50)
                                                       - 8)
                                           + 8))(&a1[*(_QWORD *)((*MEMORY[0x24BEE4EA0] & *(_QWORD *)a1) + 0x60)]);
}

uint64_t type metadata accessor for _AskToExtensionConfiguration.ExportedObject(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for _AskToExtensionConfiguration.ExportedObject);
}

uint64_t sub_236B16150()
{
  return swift_allocateGenericValueMetadata();
}

uint64_t type metadata accessor for _AskToExtensionConfiguration(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for _AskToExtensionConfiguration);
}

uint64_t sub_236B16164(void *a1)
{
  uint64_t *v1;

  sub_236B15E34(a1, *v1);
  return 1;
}

uint64_t sub_236B16180(uint64_t a1)
{
  uint64_t result;

  result = MEMORY[0x23B7FC3FC](&unk_236B18958);
  *(_QWORD *)(a1 + 8) = result;
  return result;
}

id sub_236B161AC(uint64_t a1)
{
  char *v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  objc_class *v5;
  objc_super v7;

  v2 = (_QWORD *)(*MEMORY[0x24BEE4EA0] & *(_QWORD *)v1);
  v3 = v2[10];
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 16))(&v1[v2[12]], a1, v3);
  v5 = (objc_class *)type metadata accessor for _AskToExtensionConfiguration.ExportedObject(0, v3, v2[11], v4);
  v7.receiver = v1;
  v7.super_class = v5;
  return objc_msgSendSuper2(&v7, sel_init);
}

id sub_236B1622C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  id v6;

  v6 = objc_allocWithZone((Class)type metadata accessor for _AskToExtensionConfiguration.ExportedObject(0, *(_QWORD *)(v4 + 80), *(_QWORD *)(v4 + 88), a4));
  return sub_236B161AC(a1);
}

id sub_236B16264(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  type metadata accessor for _AskToExtensionConfiguration.ExportedObject(0, a2, a3, a4);
  return sub_236B1622C(a1, v5, v6, v7);
}

void sub_236B16294()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

uint64_t sub_236B162C0()
{
  uint64_t v0;

  _Block_release(*(const void **)(v0 + 16));
  return swift_deallocObject();
}

void sub_236B162E4(uint64_t a1, uint64_t a2, unint64_t a3)
{
  uint64_t v3;

  sub_236B16028(a1, a2, a3, *(_QWORD *)(v3 + 16));
}

uint64_t __swift_instantiateGenericMetadata(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _QWORD v6[3];

  v6[0] = a2;
  v6[1] = a3;
  v6[2] = a4;
  return MEMORY[0x23B7FC3A8](a1, v6, a5);
}

uint64_t sub_236B16318()
{
  return MEMORY[0x24BDCB220]();
}

uint64_t sub_236B16324()
{
  return MEMORY[0x24BDCB260]();
}

uint64_t sub_236B16330()
{
  return MEMORY[0x24BDCB268]();
}

uint64_t sub_236B1633C()
{
  return MEMORY[0x24BDCB3B8]();
}

uint64_t sub_236B16348()
{
  return MEMORY[0x24BDCB400]();
}

uint64_t sub_236B16354()
{
  return MEMORY[0x24BDCB410]();
}

uint64_t sub_236B16360()
{
  return MEMORY[0x24BDCB958]();
}

uint64_t sub_236B1636C()
{
  return MEMORY[0x24BDCB960]();
}

uint64_t sub_236B16378()
{
  return MEMORY[0x24BDCB980]();
}

uint64_t sub_236B16384()
{
  return MEMORY[0x24BDCB988]();
}

uint64_t sub_236B16390()
{
  return MEMORY[0x24BDCBA58]();
}

uint64_t sub_236B1639C()
{
  return MEMORY[0x24BDCBA60]();
}

uint64_t sub_236B163A8()
{
  return MEMORY[0x24BDCBAB0]();
}

uint64_t sub_236B163B4()
{
  return MEMORY[0x24BDCBAC0]();
}

uint64_t sub_236B163C0()
{
  return MEMORY[0x24BDCBB68]();
}

uint64_t sub_236B163CC()
{
  return MEMORY[0x24BDCBB78]();
}

uint64_t sub_236B163D8()
{
  return MEMORY[0x24BDCBE60]();
}

uint64_t sub_236B163E4()
{
  return MEMORY[0x24BDCBE68]();
}

uint64_t sub_236B163F0()
{
  return MEMORY[0x24BDCBE80]();
}

uint64_t sub_236B163FC()
{
  return MEMORY[0x24BDCD2F0]();
}

uint64_t sub_236B16408()
{
  return MEMORY[0x24BDCD2F8]();
}

uint64_t sub_236B16414()
{
  return MEMORY[0x24BDCDBE0]();
}

uint64_t sub_236B16420()
{
  return MEMORY[0x24BDCDC08]();
}

uint64_t sub_236B1642C()
{
  return MEMORY[0x24BDCDCA0]();
}

uint64_t sub_236B16438()
{
  return MEMORY[0x24BDCDCA8]();
}

uint64_t sub_236B16444()
{
  return MEMORY[0x24BDCDCE0]();
}

uint64_t sub_236B16450()
{
  return MEMORY[0x24BDCE2D0]();
}

uint64_t sub_236B1645C()
{
  return MEMORY[0x24BDCE5D8]();
}

uint64_t sub_236B16468()
{
  return MEMORY[0x24BDCE878]();
}

uint64_t sub_236B16474()
{
  return MEMORY[0x24BDCE900]();
}

uint64_t sub_236B16480()
{
  return MEMORY[0x24BDCE9B0]();
}

uint64_t sub_236B1648C()
{
  return MEMORY[0x24BDCE9D0]();
}

uint64_t sub_236B16498()
{
  return MEMORY[0x24BDCE9E0]();
}

uint64_t sub_236B164A4()
{
  return MEMORY[0x24BDCE9F8]();
}

uint64_t sub_236B164B0()
{
  return MEMORY[0x24BDCEA40]();
}

uint64_t sub_236B164BC()
{
  return MEMORY[0x24BDCEA58]();
}

uint64_t sub_236B164C8()
{
  return MEMORY[0x24BDBD738]();
}

uint64_t sub_236B164D4()
{
  return MEMORY[0x24BEE76F0]();
}

uint64_t sub_236B164E0()
{
  return MEMORY[0x24BEE78A8]();
}

uint64_t sub_236B164EC()
{
  return MEMORY[0x24BEE78C0]();
}

uint64_t sub_236B164F8()
{
  return MEMORY[0x24BEE78D8]();
}

uint64_t sub_236B16504()
{
  return MEMORY[0x24BDCF808]();
}

uint64_t sub_236B16510()
{
  return MEMORY[0x24BDCF830]();
}

uint64_t sub_236B1651C()
{
  return MEMORY[0x24BEE0270]();
}

uint64_t sub_236B16528()
{
  return MEMORY[0x24BEE0618]();
}

uint64_t sub_236B16534()
{
  return MEMORY[0x24BEE0980]();
}

uint64_t sub_236B16540()
{
  return MEMORY[0x24BDCF9E0]();
}

uint64_t sub_236B1654C()
{
  return MEMORY[0x24BDCFA28]();
}

uint64_t sub_236B16558()
{
  return MEMORY[0x24BDCFA48]();
}

uint64_t sub_236B16564()
{
  return MEMORY[0x24BDCFAC8]();
}

uint64_t sub_236B16570()
{
  return MEMORY[0x24BDCFAF8]();
}

uint64_t sub_236B1657C()
{
  return MEMORY[0x24BEE09F0]();
}

uint64_t sub_236B16588()
{
  return MEMORY[0x24BEE0B20]();
}

uint64_t sub_236B16594()
{
  return MEMORY[0x24BEE0BC0]();
}

uint64_t sub_236B165A0()
{
  return MEMORY[0x24BEE0C10]();
}

uint64_t sub_236B165AC()
{
  return MEMORY[0x24BEE0CD8]();
}

uint64_t sub_236B165B8()
{
  return MEMORY[0x24BEE0FD8]();
}

uint64_t sub_236B165C4()
{
  return MEMORY[0x24BEE1000]();
}

uint64_t sub_236B165D0()
{
  return MEMORY[0x24BEE1030]();
}

uint64_t sub_236B165DC()
{
  return MEMORY[0x24BEE1080]();
}

uint64_t sub_236B165E8()
{
  return MEMORY[0x24BEE10B0]();
}

uint64_t sub_236B165F4()
{
  return MEMORY[0x24BEE1110]();
}

uint64_t sub_236B16600()
{
  return MEMORY[0x24BDCFBA8]();
}

uint64_t sub_236B1660C()
{
  return MEMORY[0x24BDCFBC8]();
}

uint64_t sub_236B16618()
{
  return MEMORY[0x24BEE1120]();
}

uint64_t sub_236B16624()
{
  return MEMORY[0x24BEE1128]();
}

uint64_t sub_236B16630()
{
  return MEMORY[0x24BEE1160]();
}

uint64_t sub_236B1663C()
{
  return MEMORY[0x24BEE11B8]();
}

uint64_t sub_236B16648()
{
  return MEMORY[0x24BEE6820]();
}

uint64_t sub_236B16654()
{
  return MEMORY[0x24BEE6828]();
}

uint64_t sub_236B16660()
{
  return MEMORY[0x24BEE13A8]();
}

uint64_t sub_236B1666C()
{
  return MEMORY[0x24BDBD778]();
}

uint64_t sub_236B16678()
{
  return MEMORY[0x24BDBD780]();
}

uint64_t sub_236B16684()
{
  return MEMORY[0x24BEE7908]();
}

uint64_t sub_236B16690()
{
  return MEMORY[0x24BEE7910]();
}

uint64_t sub_236B1669C()
{
  return MEMORY[0x24BEE7928]();
}

uint64_t sub_236B166A8()
{
  return MEMORY[0x24BDCFF70]();
}

uint64_t sub_236B166B4()
{
  return MEMORY[0x24BDCFFA0]();
}

uint64_t sub_236B166C0()
{
  return MEMORY[0x24BDD0170]();
}

uint64_t sub_236B166CC()
{
  return MEMORY[0x24BEE5BC0]();
}

uint64_t sub_236B166D8()
{
  return MEMORY[0x24BEE5BC8]();
}

uint64_t sub_236B166E4()
{
  return MEMORY[0x24BEE7978]();
}

uint64_t sub_236B166F0()
{
  return MEMORY[0x24BEE1C68]();
}

uint64_t sub_236B166FC()
{
  return MEMORY[0x24BEE1F00]();
}

uint64_t sub_236B16708()
{
  return MEMORY[0x24BEE1F48]();
}

uint64_t sub_236B16714()
{
  return MEMORY[0x24BEE20A8]();
}

uint64_t sub_236B16720()
{
  return MEMORY[0x24BEE23A0]();
}

uint64_t sub_236B1672C()
{
  return MEMORY[0x24BEE24D0]();
}

uint64_t sub_236B16738()
{
  return MEMORY[0x24BEE2510]();
}

uint64_t sub_236B16744()
{
  return MEMORY[0x24BEE2518]();
}

uint64_t sub_236B16750()
{
  return MEMORY[0x24BEE2658]();
}

uint64_t sub_236B1675C()
{
  return MEMORY[0x24BEE2838]();
}

uint64_t sub_236B16768()
{
  return MEMORY[0x24BEE2BE0]();
}

uint64_t sub_236B16774()
{
  return MEMORY[0x24BEE2F40]();
}

uint64_t sub_236B16780()
{
  return MEMORY[0x24BEE3068]();
}

uint64_t sub_236B1678C()
{
  return MEMORY[0x24BEE3080]();
}

uint64_t sub_236B16798()
{
  return MEMORY[0x24BEE3088]();
}

uint64_t sub_236B167A4()
{
  return MEMORY[0x24BEE3098]();
}

uint64_t sub_236B167B0()
{
  return MEMORY[0x24BEE30B0]();
}

uint64_t sub_236B167BC()
{
  return MEMORY[0x24BEE3290]();
}

uint64_t sub_236B167C8()
{
  return MEMORY[0x24BEE32D8]();
}

uint64_t sub_236B167D4()
{
  return MEMORY[0x24BEE32E0]();
}

uint64_t sub_236B167E0()
{
  return MEMORY[0x24BEE3308]();
}

uint64_t sub_236B167EC()
{
  return MEMORY[0x24BEE3318]();
}

uint64_t sub_236B167F8()
{
  return MEMORY[0x24BEE3348]();
}

uint64_t sub_236B16804()
{
  return MEMORY[0x24BEE3350]();
}

uint64_t sub_236B16810()
{
  return MEMORY[0x24BEE3360]();
}

uint64_t sub_236B1681C()
{
  return MEMORY[0x24BEE3380]();
}

uint64_t sub_236B16828()
{
  return MEMORY[0x24BEE3390]();
}

uint64_t sub_236B16834()
{
  return MEMORY[0x24BEE3428]();
}

uint64_t sub_236B16840()
{
  return MEMORY[0x24BEE3458]();
}

uint64_t sub_236B1684C()
{
  return MEMORY[0x24BEE3490]();
}

uint64_t sub_236B16858()
{
  return MEMORY[0x24BEE34A0]();
}

uint64_t sub_236B16864()
{
  return MEMORY[0x24BEE34A8]();
}

uint64_t sub_236B16870()
{
  return MEMORY[0x24BEE34B0]();
}

uint64_t sub_236B1687C()
{
  return MEMORY[0x24BEE34D0]();
}

uint64_t sub_236B16888()
{
  return MEMORY[0x24BEE34E0]();
}

uint64_t sub_236B16894()
{
  return MEMORY[0x24BEE3568]();
}

uint64_t sub_236B168A0()
{
  return MEMORY[0x24BEE3A20]();
}

uint64_t sub_236B168AC()
{
  return MEMORY[0x24BEE3A30]();
}

uint64_t sub_236B168B8()
{
  return MEMORY[0x24BEE70E0]();
}

uint64_t sub_236B168C4()
{
  return MEMORY[0x24BEE3D98]();
}

uint64_t sub_236B168D0()
{
  return MEMORY[0x24BEE3ED8]();
}

uint64_t sub_236B168DC()
{
  return MEMORY[0x24BDD0708]();
}

uint64_t sub_236B168E8()
{
  return MEMORY[0x24BEE3EF8]();
}

uint64_t sub_236B168F4()
{
  return MEMORY[0x24BEE3F00]();
}

uint64_t sub_236B16900()
{
  return MEMORY[0x24BEE3F08]();
}

uint64_t sub_236B1690C()
{
  return MEMORY[0x24BEE3F10]();
}

uint64_t sub_236B16918()
{
  return MEMORY[0x24BEE42E0]();
}

uint64_t sub_236B16924()
{
  return MEMORY[0x24BEE42F8]();
}

uint64_t sub_236B16930()
{
  return MEMORY[0x24BEE4300]();
}

uint64_t sub_236B1693C()
{
  return MEMORY[0x24BEE4308]();
}

uint64_t sub_236B16948()
{
  return MEMORY[0x24BEE4318]();
}

uint64_t sub_236B16954()
{
  return MEMORY[0x24BEE4320]();
}

uint64_t sub_236B16960()
{
  return MEMORY[0x24BEE4328]();
}

uint64_t sub_236B1696C()
{
  return MEMORY[0x24BEE4330]();
}

uint64_t sub_236B16978()
{
  return MEMORY[0x24BEE4608]();
}

uint64_t sub_236B16984()
{
  return MEMORY[0x24BEE4638]();
}

uint64_t sub_236B16990()
{
  return MEMORY[0x24BEE4A08]();
}

uint64_t sub_236B1699C()
{
  return MEMORY[0x24BEE4A10]();
}

CGContextRef CGBitmapContextCreate(void *data, size_t width, size_t height, size_t bitsPerComponent, size_t bytesPerRow, CGColorSpaceRef space, uint32_t bitmapInfo)
{
  return (CGContextRef)MEMORY[0x24BDBD918](data, width, height, bitsPerComponent, bytesPerRow, space, *(_QWORD *)&bitmapInfo);
}

CGImageRef CGBitmapContextCreateImage(CGContextRef context)
{
  return (CGImageRef)MEMORY[0x24BDBD920](context);
}

CGColorSpaceRef CGColorSpaceCreateDeviceRGB(void)
{
  return (CGColorSpaceRef)MEMORY[0x24BDBDB88]();
}

void CGContextAddPath(CGContextRef c, CGPathRef path)
{
  MEMORY[0x24BDBDCE0](c, path);
}

size_t CGImageGetHeight(CGImageRef image)
{
  return MEMORY[0x24BDBE680](image);
}

size_t CGImageGetWidth(CGImageRef image)
{
  return MEMORY[0x24BDBE6E0](image);
}

CGImageRef CGImageSourceCreateImageAtIndex(CGImageSourceRef isrc, size_t index, CFDictionaryRef options)
{
  return (CGImageRef)MEMORY[0x24BDD9158](isrc, index, options);
}

CGImageSourceRef CGImageSourceCreateWithData(CFDataRef data, CFDictionaryRef options)
{
  return (CGImageSourceRef)MEMORY[0x24BDD9170](data, options);
}

CGPathRef CGPathCreateWithRoundedRect(CGRect rect, CGFloat cornerWidth, CGFloat cornerHeight, const CGAffineTransform *transform)
{
  return (CGPathRef)MEMORY[0x24BDBEEB0](transform, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, cornerWidth, cornerHeight);
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

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x24BEDCFA8](a1);
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDCFD0](a1);
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

uint64_t swift_getMetatypeMetadata()
{
  return MEMORY[0x24BEE4D98]();
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

uint64_t swift_initClassMetadata2()
{
  return MEMORY[0x24BEE4E28]();
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

