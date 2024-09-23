void sub_1D714F350(uint64_t a1@<X0>, uint64_t a2@<X5>, void *a3@<X6>, _QWORD *a4@<X8>)
{
  void *v6;
  void *v7;
  void *ObjCClassFromMetadata;
  void *v9;
  void *v10;
  id v11;
  uint64_t v14;

  v6 = (void *)sub_1D7160F14();
  sub_1D7160FC8();
  if (!a2)
  {
    v7 = 0;
    if (!a3)
      goto LABEL_4;
    goto LABEL_3;
  }
  v7 = (void *)sub_1D7160E0C();
  if (a3)
  {
LABEL_3:
    sub_1D7160CB4((unint64_t)a3);
    sub_1D7153C90();
    a3 = (void *)sub_1D7160FD4();
    swift_bridgeObjectRelease();
  }
LABEL_4:
  ObjCClassFromMetadata = (void *)swift_getObjCClassFromMetadata();
  v9 = (void *)sub_1D7160ED8();
  v10 = (void *)sub_1D7160F14();
  v11 = objc_msgSend(ObjCClassFromMetadata, sel__msv_errorWithDomain_code_underlyingError_underlyingErrors_userInfo_debugDescriptionFormat_arguments_, v6, v14, v7, a3, v9, v10, a1);

  *a4 = v11;
}

uint64_t OUTLINED_FUNCTION_0_0(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  char v4;

  *(_QWORD *)(v2 + 48) = a1;
  *(_BYTE *)(v2 + 16) = v4;
  *(_BYTE *)(v2 + 258) = *(_BYTE *)__swift_project_boxed_opaque_existential_1(v1, v3);
  return sub_1D7160E30();
}

uint64_t OUTLINED_FUNCTION_0_1()
{
  return swift_release();
}

uint64_t sub_1D714F59C(uint64_t a1, void (*a2)(uint64_t *__return_ptr, uint64_t))
{
  _QWORD *v4;
  uint64_t v5;
  _QWORD *v6;
  uint64_t v7;
  uint64_t v9;

  sub_1D716128C();
  v4 = (_QWORD *)swift_allocObject();
  v4[2] = 8;
  v4[3] = 0;
  v4[4] = 0;
  v4[5] = 0;
  v5 = *(_QWORD *)(a1 + 16);
  if (v5)
  {
    v6 = (_QWORD *)(a1 + 32);
    do
    {
      __swift_project_boxed_opaque_existential_1(v6, v6[3]);
      sub_1D71613A0();
      sub_1D7161274();
      swift_bridgeObjectRelease();
      v6 += 5;
      --v5;
    }
    while (v5);
  }
  v7 = sub_1D7161280();
  a2(&v9, v7);
  swift_release();
  return v9;
}

void sub_1D714F670()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  _QWORD *v3;

  OUTLINED_FUNCTION_0_2();
  sub_1D714F350(v0, v1, v2, v3);
}

uint64_t static NSError.error<A>(domain:code:underlyingError:underlyingErrors:userInfo:debugDescription:)()
{
  return sub_1D714F59C(MEMORY[0x1E0DEE9D8], (void (*)(uint64_t *__return_ptr, uint64_t))sub_1D714F670);
}

void sub_1D714F6E8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;

  v5 = sub_1D7160E48();
  if (a1)
  {
    if (v5 != 0x8000000000000000 || a1 != -1)
    {
      sub_1D7151348(0, (v5 / a1) & ~((v5 / a1) >> 63), 0, MEMORY[0x1E0DEE9D8]);
      __asm { BR              X10 }
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
  JUMPOUT(0x1D714F900);
}

void RandomAccessCollection<>.chunkRanges(by:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v7;
  uint64_t AssociatedTypeWitness;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
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
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  void (*v36)(uint64_t, uint64_t, uint64_t);
  void (*v37)(uint64_t, uint64_t);
  uint64_t v38;
  uint64_t v39;
  void (*v40)(uint64_t, uint64_t);
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
  char *v58;
  char *v59;
  uint64_t v60;
  char *v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t TupleTypeMetadata2;
  char *v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;

  v78 = a2;
  v7 = *(_QWORD *)(*(_QWORD *)(a3 + 8) + 8);
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  OUTLINED_FUNCTION_24();
  TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
  OUTLINED_FUNCTION_21();
  ((void (*)(void))MEMORY[0x1E0C80A78])();
  OUTLINED_FUNCTION_5();
  v64 = v9;
  OUTLINED_FUNCTION_17();
  ((void (*)(void))MEMORY[0x1E0C80A78])();
  v65 = (uint64_t)&v52 - v10;
  OUTLINED_FUNCTION_24();
  v69 = v11;
  v12 = sub_1D71610F4();
  v63 = *(_QWORD *)(v12 - 8);
  OUTLINED_FUNCTION_21();
  ((void (*)(void))MEMORY[0x1E0C80A78])();
  OUTLINED_FUNCTION_5();
  v62 = v13;
  OUTLINED_FUNCTION_17();
  ((void (*)(void))MEMORY[0x1E0C80A78])();
  v61 = (char *)&v52 - v14;
  OUTLINED_FUNCTION_24();
  sub_1D7161160();
  OUTLINED_FUNCTION_2();
  ((void (*)(void))MEMORY[0x1E0C80A78])();
  v16 = (char *)&v52 - v15;
  v73 = *(_QWORD *)(AssociatedTypeWitness - 8);
  OUTLINED_FUNCTION_21();
  ((void (*)(void))MEMORY[0x1E0C80A78])();
  OUTLINED_FUNCTION_5();
  v68 = v17;
  OUTLINED_FUNCTION_17();
  ((void (*)(void))MEMORY[0x1E0C80A78])();
  v67 = (char *)&v52 - v18;
  OUTLINED_FUNCTION_17();
  v19 = ((uint64_t (*)(void))MEMORY[0x1E0C80A78])();
  v21 = (char *)&v52 - v20;
  MEMORY[0x1E0C80A78](v19);
  v23 = (char *)&v52 - v22;
  v56 = sub_1D7161208();
  OUTLINED_FUNCTION_2();
  MEMORY[0x1E0C80A78](v24);
  OUTLINED_FUNCTION_19();
  v55 = v25;
  v75 = sub_1D71612D4();
  v54 = *(_QWORD *)(v75 - 8);
  OUTLINED_FUNCTION_2();
  MEMORY[0x1E0C80A78](v26);
  OUTLINED_FUNCTION_19();
  v74 = v27;
  v77 = a4;
  v28 = swift_getAssociatedTypeWitness();
  sub_1D7161160();
  OUTLINED_FUNCTION_2();
  MEMORY[0x1E0C80A78](v29);
  OUTLINED_FUNCTION_19();
  v31 = v30;
  v57 = *(_QWORD *)(v28 - 8);
  OUTLINED_FUNCTION_2();
  MEMORY[0x1E0C80A78](v32);
  OUTLINED_FUNCTION_19();
  v76 = v33;
  v70 = v12;
  v80 = sub_1D7160ECC();
  v71 = v7;
  v72 = v4;
  v34 = sub_1D71610D0();
  if (!a1)
  {
LABEL_13:
    __break(1u);
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  if (v34 == 0x8000000000000000 && a1 == -1)
    goto LABEL_14;
  v60 = sub_1D7161034();
  sub_1D7161004();
  v79 = a1;
  swift_getAssociatedConformanceWitness();
  sub_1D714FF4C();
  sub_1D71610B8();
  if (__swift_getEnumTagSinglePayload(v31, 1, v28) != 1)
  {
    v36 = *(void (**)(uint64_t, uint64_t, uint64_t))(v57 + 32);
    v53 = v28;
    v36(v76, v31, v28);
    sub_1D71610C4();
    sub_1D71610DC();
    sub_1D7161394();
    v37 = *(void (**)(uint64_t, uint64_t))(v73 + 8);
    OUTLINED_FUNCTION_10((uint64_t)v21);
    OUTLINED_FUNCTION_10((uint64_t)v23);
    sub_1D71611FC();
    sub_1D71612C8();
    if (__swift_getEnumTagSinglePayload((uint64_t)v16, 1, AssociatedTypeWitness) == 1)
    {
LABEL_11:
      (*(void (**)(uint64_t, uint64_t))(v54 + 8))(v74, v75);
      (*(void (**)(uint64_t, uint64_t))(v57 + 8))(v76, v53);
      OUTLINED_FUNCTION_4();
      return;
    }
    v59 = v21;
    v58 = v16;
    while (1)
    {
      OUTLINED_FUNCTION_6((uint64_t)v23, (uint64_t)v16);
      v38 = (uint64_t)v67;
      sub_1D7161178();
      v39 = v68;
      sub_1D71610DC();
      sub_1D7161328();
      OUTLINED_FUNCTION_10(v39);
      OUTLINED_FUNCTION_10(v38);
      if ((sub_1D7160F08() & 1) == 0)
        break;
      v40 = v37;
      v41 = (uint64_t)v23;
      v42 = v65;
      v43 = TupleTypeMetadata2;
      v44 = v65 + *(int *)(TupleTypeMetadata2 + 48);
      OUTLINED_FUNCTION_23(v65, v41);
      OUTLINED_FUNCTION_6(v44, (uint64_t)v21);
      v45 = v64;
      v46 = v64 + *(int *)(v43 + 48);
      OUTLINED_FUNCTION_23(v64, v42);
      OUTLINED_FUNCTION_23(v46, v44);
      v47 = v62;
      OUTLINED_FUNCTION_6(v62, v45);
      v40(v46, AssociatedTypeWitness);
      v48 = *(int *)(v43 + 48);
      v23 = (char *)v41;
      v37 = v40;
      v49 = v45 + v48;
      OUTLINED_FUNCTION_6(v45, v42);
      OUTLINED_FUNCTION_6(v49, v44);
      v50 = v70;
      OUTLINED_FUNCTION_6(v47 + *(int *)(v70 + 36), v49);
      v51 = v45;
      v16 = v58;
      v21 = v59;
      v40(v51, AssociatedTypeWitness);
      (*(void (**)(char *, uint64_t, uint64_t))(v63 + 32))(v61, v47, v50);
      sub_1D716101C();
      OUTLINED_FUNCTION_10((uint64_t)v23);
      sub_1D71612C8();
      if (__swift_getEnumTagSinglePayload((uint64_t)v16, 1, AssociatedTypeWitness) == 1)
        goto LABEL_11;
    }
    __break(1u);
    goto LABEL_13;
  }
LABEL_15:
  __break(1u);
}

unint64_t sub_1D714FF4C()
{
  unint64_t result;

  result = qword_1ED56FB68;
  if (!qword_1ED56FB68)
  {
    result = MEMORY[0x1D82937B8](MEMORY[0x1E0DEB460], MEMORY[0x1E0DEB418]);
    atomic_store(result, (unint64_t *)&qword_1ED56FB68);
  }
  return result;
}

uint64_t __swift_getEnumTagSinglePayload(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a3 - 8) + 48))();
}

void Sequence.chunked(by:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
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
  uint64_t v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v22;
  void (*v23)(char *, char *, uint64_t);
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
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

  v7 = OUTLINED_FUNCTION_27();
  v28 = *(_QWORD *)(v7 - 8);
  OUTLINED_FUNCTION_2();
  MEMORY[0x1E0C80A78](v8);
  v10 = (char *)&v28 - v9;
  sub_1D7161160();
  OUTLINED_FUNCTION_2();
  MEMORY[0x1E0C80A78](v11);
  v13 = (char *)&v28 - v12;
  v30 = *(_QWORD *)(a2 - 8);
  OUTLINED_FUNCTION_21();
  MEMORY[0x1E0C80A78](v14);
  v31 = (char *)&v28 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v36 = OUTLINED_FUNCTION_27();
  v16 = *(_QWORD *)(v36 - 8);
  MEMORY[0x1E0C80A78](v36);
  v18 = (char *)&v28 - v17;
  v19 = sub_1D7161034();
  v39 = sub_1D7160ECC();
  v32 = v3;
  v33 = a3;
  v34 = a2;
  v20 = sub_1D7160FBC();
  if (!a1)
  {
    __break(1u);
LABEL_16:
    __break(1u);
    return;
  }
  if (v20 == 0x8000000000000000 && a1 == -1)
    goto LABEL_16;
  v29 = v16;
  OUTLINED_FUNCTION_24();
  v35 = sub_1D7161034();
  sub_1D7161004();
  v38 = sub_1D7160ECC();
  v22 = a1;
  sub_1D7161004();
  (*(void (**)(char *, uint64_t, uint64_t))(v30 + 16))(v31, v32, v34);
  sub_1D7160FB0();
  swift_getAssociatedConformanceWitness();
  sub_1D716116C();
  if (__swift_getEnumTagSinglePayload((uint64_t)v13, 1, v7) != 1)
  {
    v23 = *(void (**)(char *, char *, uint64_t))(v28 + 32);
    do
    {
      v23(v10, v13, v7);
      sub_1D716101C();
      v24 = v38;
      v25 = OUTLINED_FUNCTION_11();
      v26 = MEMORY[0x1D8293134](v25, v7);
      swift_bridgeObjectRelease();
      if (v26 == v22)
      {
        v37 = v24;
        OUTLINED_FUNCTION_11();
        sub_1D716101C();
        sub_1D7161028();
      }
      sub_1D716116C();
    }
    while (__swift_getEnumTagSinglePayload((uint64_t)v13, 1, v7) != 1);
  }
  (*(void (**)(char *, uint64_t))(v29 + 8))(v18, v36);
  v27 = v38;
  v37 = v38;
  MEMORY[0x1D82937B8](MEMORY[0x1E0DEAF50], v19);
  if ((sub_1D71610E8() & 1) != 0)
  {
    OUTLINED_FUNCTION_3();
  }
  else
  {
    v37 = v27;
    sub_1D716101C();
  }
  OUTLINED_FUNCTION_4();
}

void static Data.printableCharacter(for:)(unsigned __int8 a1)
{
  uint64_t v1;
  uint64_t v2;

  if (isprint(a1))
  {
    OUTLINED_FUNCTION_0();
    v2 = v1;
    MEMORY[0x1D8293080](&v2);
  }
  OUTLINED_FUNCTION_20();
}

uint64_t Data.chunked(by:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;

  sub_1D714F6E8(a1, a2, a3);
  OUTLINED_FUNCTION_14();
  v3 = OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_22();
  return v3;
}

uint64_t sub_1D7150370(uint64_t a1, uint64_t a2, unint64_t a3)
{
  int64_t v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v16;

  v5 = *(_QWORD *)(a1 + 16);
  if (v5)
  {
    v16 = MEMORY[0x1E0DEE9D8];
    sub_1D715174C(0, v5, 0);
    v7 = v16;
    v8 = a1 + 40;
    do
    {
      v9 = sub_1D7160E54();
      v11 = v10;
      v13 = *(_QWORD *)(v16 + 16);
      v12 = *(_QWORD *)(v16 + 24);
      if (v13 >= v12 >> 1)
        sub_1D715174C((char *)(v12 > 1), v13 + 1, 1);
      v8 += 16;
      *(_QWORD *)(v16 + 16) = v13 + 1;
      v14 = v16 + 16 * v13;
      *(_QWORD *)(v14 + 32) = v9;
      *(_QWORD *)(v14 + 40) = v11;
      --v5;
    }
    while (v5);
    sub_1D71517A0(a2, a3);
  }
  else
  {
    sub_1D71517A0(a2, a3);
    return MEMORY[0x1E0DEE9D8];
  }
  return v7;
}

uint64_t sub_1D715048C(uint64_t a1, unint64_t a2)
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

void Data.HexDumpLine.offset.getter()
{
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_26();
  OUTLINED_FUNCTION_7();
}

void Data.HexDumpLine.offset.setter(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;

  swift_bridgeObjectRelease();
  *v2 = a1;
  v2[1] = a2;
  OUTLINED_FUNCTION_8();
}

uint64_t (*Data.HexDumpLine.offset.modify())()
{
  return nullsub_1;
}

void Data.HexDumpLine.hex.getter()
{
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_26();
  OUTLINED_FUNCTION_7();
}

void Data.HexDumpLine.hex.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  swift_bridgeObjectRelease();
  *(_QWORD *)(v2 + 16) = a1;
  *(_QWORD *)(v2 + 24) = a2;
  OUTLINED_FUNCTION_8();
}

uint64_t (*Data.HexDumpLine.hex.modify())()
{
  return nullsub_1;
}

void Data.HexDumpLine.text.getter()
{
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_26();
  OUTLINED_FUNCTION_7();
}

void Data.HexDumpLine.text.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  swift_bridgeObjectRelease();
  *(_QWORD *)(v2 + 32) = a1;
  *(_QWORD *)(v2 + 40) = a2;
  OUTLINED_FUNCTION_8();
}

uint64_t (*Data.HexDumpLine.text.modify())()
{
  return nullsub_1;
}

uint64_t Data.HexDumpLine.line.getter()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t result;

  v1 = *v0;
  v2 = v0[6];
  if (v2 + 0x4000000000000000 < 0)
  {
    __break(1u);
  }
  else if (!__OFADD__(2 * v2, 8))
  {
    sub_1D71506F8();
    sub_1D7161190();
    swift_bridgeObjectRetain();
    _sSo14MSVSQLDatabaseC15MediaFoundationE22StatementInterpolationV06StringE0V13appendLiteralyySSF_0();
    _sSo14MSVSQLDatabaseC15MediaFoundationE22StatementInterpolationV06StringE0V13appendLiteralyySSF_0();
    swift_bridgeObjectRelease();
    _sSo14MSVSQLDatabaseC15MediaFoundationE22StatementInterpolationV06StringE0V13appendLiteralyySSF_0();
    swift_bridgeObjectRetain();
    _sSo14MSVSQLDatabaseC15MediaFoundationE22StatementInterpolationV06StringE0V13appendLiteralyySSF_0();
    OUTLINED_FUNCTION_3();
    return v1;
  }
  __break(1u);
  return result;
}

unint64_t sub_1D71506F8()
{
  unint64_t result;

  result = qword_1F00AF788;
  if (!qword_1F00AF788)
  {
    result = MEMORY[0x1D82937B8](MEMORY[0x1E0DEA9B8], MEMORY[0x1E0DEA968]);
    atomic_store(result, (unint64_t *)&qword_1F00AF788);
  }
  return result;
}

uint64_t Data.hexDump(bytesPerRow:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _QWORD *v3;
  char *v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;

  sub_1D714F6E8(a1, a2, a3);
  OUTLINED_FUNCTION_14();
  v3 = (_QWORD *)OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_22();
  if (v3[2])
  {
    v4 = (char *)MEMORY[0x1E0DEE9D8];
    v5 = v3[4];
    v6 = v3[5];
    sub_1D7152168(0, &qword_1F00AF790, &qword_1F00AF798);
    v7 = OUTLINED_FUNCTION_25();
    *(_OWORD *)(v7 + 16) = xmmword_1D7161760;
    *(_QWORD *)(v7 + 56) = MEMORY[0x1E0DEB418];
    *(_QWORD *)(v7 + 64) = MEMORY[0x1E0DEB490];
    *(_QWORD *)(v7 + 32) = 0;
    sub_1D715048C(v5, v6);
    sub_1D7160F2C();
    v8 = sub_1D7160E48();
    sub_1D7151348(0, (v8 / 2) & ~((v8 / 2) >> 63), 0, v4);
    __asm { BR              X8 }
  }
  OUTLINED_FUNCTION_3();
  return MEMORY[0x1E0DEE9D8];
}

char *sub_1D7151348(char *result, int64_t a2, char a3, char *a4)
{
  char v5;
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
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
    sub_1D71521F8(0, &qword_1F00AF848, (void (*)(uint64_t))sub_1D7152304);
    v10 = (char *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    *((_QWORD *)v10 + 2) = v8;
    *((_QWORD *)v10 + 3) = 2 * ((uint64_t)(v11 - 32) / 16);
  }
  else
  {
    v10 = (char *)MEMORY[0x1E0DEE9D8];
  }
  v12 = v10 + 32;
  v13 = a4 + 32;
  if ((v5 & 1) != 0)
  {
    if (v10 != a4 || &v13[16 * v8] <= v12)
      memmove(v12, v13, 16 * v8);
    *((_QWORD *)a4 + 2) = 0;
  }
  else
  {
    memcpy(v12, v13, 16 * v8);
  }
  swift_bridgeObjectRelease();
  return v10;
}

char *sub_1D7151448(char *result, int64_t a2, char a3, char *a4)
{
  char v5;
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
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
    sub_1D7152354(0, &qword_1F00AF838, (uint64_t)&type metadata for Data.HexDumpLine, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0DED1E8]);
    v10 = (char *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    *((_QWORD *)v10 + 2) = v8;
    *((_QWORD *)v10 + 3) = 2 * ((uint64_t)(v11 - 32) / 56);
  }
  else
  {
    v10 = (char *)MEMORY[0x1E0DEE9D8];
  }
  v12 = v10 + 32;
  v13 = a4 + 32;
  if ((v5 & 1) != 0)
  {
    if (v10 != a4 || &v13[56 * v8] <= v12)
      memmove(v12, v13, 56 * v8);
    *((_QWORD *)a4 + 2) = 0;
  }
  else
  {
    swift_arrayInitWithCopy();
  }
  swift_bridgeObjectRelease();
  return v10;
}

_QWORD *sub_1D7151568(_QWORD *result, int64_t a2, char a3, _QWORD *a4)
{
  char v5;
  unint64_t v6;
  _QWORD *v7;
  uint64_t v8;
  _QWORD *v9;
  _QWORD *v10;

  v5 = (char)result;
  if ((a3 & 1) != 0)
  {
    v6 = a4[3];
    v7 = (_QWORD *)(v6 >> 1);
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if ((uint64_t)(v7 + 0x800000000000000) < 0)
      {
        __break(1u);
        return result;
      }
      v7 = (_QWORD *)(v6 & 0xFFFFFFFFFFFFFFFELL);
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2)
        v7 = (_QWORD *)a2;
    }
  }
  else
  {
    v7 = (_QWORD *)a2;
  }
  v8 = a4[2];
  if ((uint64_t)v7 <= v8)
    v9 = (_QWORD *)a4[2];
  else
    v9 = v7;
  if (v9)
  {
    sub_1D71521F8(0, &qword_1F00AF818, (void (*)(uint64_t))sub_1D7152238);
    v10 = (_QWORD *)OUTLINED_FUNCTION_15();
    OUTLINED_FUNCTION_13(v10);
  }
  else
  {
    v9 = (_QWORD *)MEMORY[0x1E0DEE9D8];
  }
  if ((v5 & 1) != 0)
  {
    if (v9 != a4 || &a4[2 * v8 + 4] <= v9 + 4)
      memmove(v9 + 4, a4 + 4, 16 * v8);
    a4[2] = 0;
  }
  else
  {
    sub_1D71522C4();
    swift_arrayInitWithCopy();
  }
  OUTLINED_FUNCTION_3();
  return v9;
}

uint64_t sub_1D7151664(uint64_t result, int64_t a2, char a3, _QWORD *a4)
{
  char v5;
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  char *v11;
  char *v12;

  v5 = result;
  if ((a3 & 1) != 0)
  {
    v6 = a4[3];
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
  v8 = a4[2];
  if (v7 <= v8)
    v9 = a4[2];
  else
    v9 = v7;
  if (v9)
  {
    sub_1D7152354(0, &qword_1F00AF810, MEMORY[0x1E0DEA968], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0DED1E8]);
    v10 = (_QWORD *)OUTLINED_FUNCTION_15();
    OUTLINED_FUNCTION_13(v10);
  }
  else
  {
    v9 = MEMORY[0x1E0DEE9D8];
  }
  v11 = (char *)(v9 + 32);
  v12 = (char *)(a4 + 4);
  if ((v5 & 1) != 0)
  {
    if ((_QWORD *)v9 != a4 || &v12[16 * v8] <= v11)
      memmove(v11, v12, 16 * v8);
    a4[2] = 0;
  }
  else
  {
    swift_arrayInitWithCopy();
  }
  OUTLINED_FUNCTION_3();
  return v9;
}

char *sub_1D715174C(char *a1, int64_t a2, char a3)
{
  char **v3;
  char *result;

  result = sub_1D7151BE0(a1, a2, a3, *v3);
  *v3 = result;
  return result;
}

char *sub_1D7151768(char *a1, int64_t a2, char a3)
{
  char **v3;
  char *result;

  result = sub_1D7151CF0(a1, a2, a3, *v3);
  *v3 = result;
  return result;
}

char *sub_1D7151784(char *a1, int64_t a2, char a3)
{
  char **v3;
  char *result;

  result = sub_1D7151E00(a1, a2, a3, *v3);
  *v3 = result;
  return result;
}

uint64_t sub_1D71517A0(uint64_t a1, unint64_t a2)
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

uint64_t sub_1D71517E4(unint64_t *a1, unint64_t *a2, uint64_t a3, uint64_t a4)
{
  uint64_t result;
  uint64_t v7;

  result = *a1;
  if (!result)
  {
    sub_1D7152354(255, a2, a3, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0DEAEC8]);
    result = MEMORY[0x1D82937B8](a4, v7);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t _s11HexDumpLineVwCP(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *a2;
  *a1 = *a2;
  v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t _s11HexDumpLineVwxx()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

_QWORD *_s11HexDumpLineVwcp(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  v4 = a2[3];
  a1[2] = a2[2];
  a1[3] = v4;
  v5 = a2[5];
  a1[4] = a2[4];
  a1[5] = v5;
  a1[6] = a2[6];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

_QWORD *_s11HexDumpLineVwca(_QWORD *a1, _QWORD *a2)
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
  return a1;
}

__n128 __swift_memcpy56_8(uint64_t a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;
  __int128 v4;

  result = *(__n128 *)a2;
  v3 = *(_OWORD *)(a2 + 16);
  v4 = *(_OWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 16) = v3;
  *(_OWORD *)(a1 + 32) = v4;
  *(__n128 *)a1 = result;
  return result;
}

_QWORD *_s11HexDumpLineVwta(_QWORD *a1, _QWORD *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

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
  a1[6] = a2[6];
  return a1;
}

uint64_t _s11HexDumpLineVwet(uint64_t a1, int a2)
{
  unint64_t v2;

  if (a2)
  {
    if (a2 < 0 && *(_BYTE *)(a1 + 56))
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

uint64_t _s11HexDumpLineVwst(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 56) = 1;
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
    *(_BYTE *)(result + 56) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for Data.HexDumpLine()
{
  return &type metadata for Data.HexDumpLine;
}

void type metadata accessor for MRPlaybackState(uint64_t a1)
{
  sub_1D7152354(a1, &qword_1F00AF7B8, (uint64_t)&unk_1E9BE6368, MEMORY[0x1E0DEEC78]);
}

void type metadata accessor for MRDisabledReason(uint64_t a1)
{
  sub_1D7152354(a1, &qword_1F00AF7C0, (uint64_t)&unk_1E9BE6430, MEMORY[0x1E0DEEC78]);
}

void type metadata accessor for MRContentItemMediaSubType(uint64_t a1)
{
  sub_1D7152354(a1, &qword_1F00AF7C8, (uint64_t)&unk_1E9BE6510, MEMORY[0x1E0DEEC78]);
}

void type metadata accessor for MRContentItemRadioStationType(uint64_t a1)
{
  sub_1D7152354(a1, &qword_1F00AF7D0, (uint64_t)&unk_1E9BE6580, MEMORY[0x1E0DEEC78]);
}

void type metadata accessor for MRContentItemPlaylistType(uint64_t a1)
{
  sub_1D7152354(a1, &qword_1F00AF7D8, (uint64_t)&unk_1E9BE6548, MEMORY[0x1E0DEEC78]);
}

void type metadata accessor for MRContentItemEpisodeType(uint64_t a1)
{
  sub_1D7152354(a1, &qword_1F00AF7E0, (uint64_t)&unk_1E9BE64D8, MEMORY[0x1E0DEEC78]);
}

void type metadata accessor for MRContentItemMediaType(uint64_t a1)
{
  sub_1D7152354(a1, &qword_1F00AF7E8, (uint64_t)&unk_1E9BE64A0, MEMORY[0x1E0DEEC78]);
}

void type metadata accessor for MRContentItemMetadataAudioRouteType(uint64_t a1)
{
  sub_1D7152354(a1, &qword_1F00AF7F0, (uint64_t)&unk_1E9BE65F0, MEMORY[0x1E0DEEC78]);
}

void type metadata accessor for MRQueueEndAction(uint64_t a1)
{
  sub_1D7152354(a1, &qword_1F00AF7F8, (uint64_t)&unk_1E9BE6468, MEMORY[0x1E0DEEC78]);
}

void type metadata accessor for MRMediaRemoteCommandHandlerStatus(uint64_t a1)
{
  sub_1D7152354(a1, &qword_1F00AF800, (uint64_t)&unk_1E9BE65B8, MEMORY[0x1E0DEEC78]);
}

char *sub_1D7151BA8(char *a1, int64_t a2, char a3)
{
  char **v3;
  char *result;

  result = sub_1D7151F10(a1, a2, a3, *v3);
  *v3 = result;
  return result;
}

_QWORD *sub_1D7151BC4(_QWORD *a1, int64_t a2, char a3)
{
  _QWORD **v3;
  _QWORD *result;

  result = sub_1D715202C(a1, a2, a3, *v3);
  *v3 = result;
  return result;
}

char *sub_1D7151BE0(char *result, int64_t a2, char a3, char *a4)
{
  char v5;
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
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
    sub_1D7152354(0, &qword_1F00AF858, MEMORY[0x1E0CB0338], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0DED1E8]);
    v10 = (char *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    *((_QWORD *)v10 + 2) = v8;
    *((_QWORD *)v10 + 3) = 2 * ((uint64_t)(v11 - 32) / 16);
  }
  else
  {
    v10 = (char *)MEMORY[0x1E0DEE9D8];
  }
  v12 = v10 + 32;
  v13 = a4 + 32;
  if ((v5 & 1) != 0)
  {
    if (v10 != a4 || &v13[16 * v8] <= v12)
      memmove(v12, v13, 16 * v8);
    *((_QWORD *)a4 + 2) = 0;
  }
  else
  {
    swift_arrayInitWithCopy();
  }
  swift_release();
  return v10;
}

char *sub_1D7151CF0(char *result, int64_t a2, char a3, char *a4)
{
  char v5;
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
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
    sub_1D7152354(0, &qword_1F00AF840, MEMORY[0x1E0DEA2D0], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0DED1E8]);
    v10 = (char *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    *((_QWORD *)v10 + 2) = v8;
    *((_QWORD *)v10 + 3) = 2 * ((uint64_t)(v11 - 32) / 16);
  }
  else
  {
    v10 = (char *)MEMORY[0x1E0DEE9D8];
  }
  v12 = v10 + 32;
  v13 = a4 + 32;
  if ((v5 & 1) != 0)
  {
    if (v10 != a4 || &v13[16 * v8] <= v12)
      memmove(v12, v13, 16 * v8);
    *((_QWORD *)a4 + 2) = 0;
  }
  else
  {
    swift_arrayInitWithCopy();
  }
  swift_release();
  return v10;
}

char *sub_1D7151E00(char *result, int64_t a2, char a3, char *a4)
{
  char v5;
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
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
    sub_1D7152354(0, &qword_1F00AF810, MEMORY[0x1E0DEA968], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0DED1E8]);
    v10 = (char *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    *((_QWORD *)v10 + 2) = v8;
    *((_QWORD *)v10 + 3) = 2 * ((uint64_t)(v11 - 32) / 16);
  }
  else
  {
    v10 = (char *)MEMORY[0x1E0DEE9D8];
  }
  v12 = v10 + 32;
  v13 = a4 + 32;
  if ((v5 & 1) != 0)
  {
    if (v10 != a4 || &v13[16 * v8] <= v12)
      memmove(v12, v13, 16 * v8);
    *((_QWORD *)a4 + 2) = 0;
  }
  else
  {
    swift_arrayInitWithCopy();
  }
  swift_release();
  return v10;
}

char *sub_1D7151F10(char *result, int64_t a2, char a3, char *a4)
{
  char v5;
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
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
    sub_1D7152354(0, &qword_1F00AF808, (uint64_t)&type metadata for MediaRemoteCommand.Option, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0DED1E8]);
    v10 = (char *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    *((_QWORD *)v10 + 2) = v8;
    *((_QWORD *)v10 + 3) = 2 * ((uint64_t)(v11 - 32) / 40);
  }
  else
  {
    v10 = (char *)MEMORY[0x1E0DEE9D8];
  }
  v12 = v10 + 32;
  v13 = a4 + 32;
  if ((v5 & 1) != 0)
  {
    if (v10 != a4 || &v13[40 * v8] <= v12)
      memmove(v12, v13, 40 * v8);
    *((_QWORD *)a4 + 2) = 0;
  }
  else
  {
    swift_arrayInitWithCopy();
  }
  swift_release();
  return v10;
}

_QWORD *sub_1D715202C(_QWORD *result, int64_t a2, char a3, _QWORD *a4)
{
  char v5;
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  size_t v11;

  v5 = (char)result;
  if ((a3 & 1) != 0)
  {
    v6 = a4[3];
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
  v8 = a4[2];
  if (v7 <= v8)
    v9 = a4[2];
  else
    v9 = v7;
  if (v9)
  {
    sub_1D7152168(0, &qword_1ED56FB60, (unint64_t *)&qword_1ED56FB58);
    v10 = (_QWORD *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    v10[2] = v8;
    v10[3] = 2 * ((uint64_t)(v11 - 32) / 8);
  }
  else
  {
    v10 = (_QWORD *)MEMORY[0x1E0DEE9D8];
  }
  if ((v5 & 1) != 0)
  {
    if (v10 != a4 || &a4[v8 + 4] <= v10 + 4)
      memmove(v10 + 4, a4 + 4, 8 * v8);
    a4[2] = 0;
  }
  else
  {
    sub_1D71521B0(0, (unint64_t *)&qword_1ED56FB58);
    swift_arrayInitWithCopy();
  }
  swift_release();
  return v10;
}

void sub_1D7152168(uint64_t a1, unint64_t *a2, unint64_t *a3)
{
  unint64_t v4;
  uint64_t v5;

  if (!*a2)
  {
    sub_1D71521B0(255, a3);
    v4 = OUTLINED_FUNCTION_16();
    if (!v5)
      atomic_store(v4, a2);
  }
  OUTLINED_FUNCTION_7();
}

void sub_1D71521B0(uint64_t a1, unint64_t *a2)
{
  if (!*a2)
    atomic_store(swift_getExistentialTypeMetadata(), a2);
  OUTLINED_FUNCTION_20();
}

void sub_1D71521F8(uint64_t a1, unint64_t *a2, void (*a3)(uint64_t))
{
  unint64_t v4;
  uint64_t v5;

  if (!*a2)
  {
    a3(255);
    v4 = OUTLINED_FUNCTION_16();
    if (!v5)
      atomic_store(v4, a2);
  }
  OUTLINED_FUNCTION_7();
}

unint64_t sub_1D7152238()
{
  unint64_t result;

  result = qword_1F00AF820;
  if (!qword_1F00AF820)
  {
    sub_1D7152288();
    result = swift_getFunctionTypeMetadata1();
    atomic_store(result, (unint64_t *)&qword_1F00AF820);
  }
  return result;
}

unint64_t sub_1D7152288()
{
  unint64_t result;

  result = qword_1F00AF828;
  if (!qword_1F00AF828)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_1F00AF828);
  }
  return result;
}

unint64_t sub_1D71522C4()
{
  unint64_t result;

  result = qword_1F00AF830;
  if (!qword_1F00AF830)
  {
    result = swift_getFunctionTypeMetadata0();
    atomic_store(result, (unint64_t *)&qword_1F00AF830);
  }
  return result;
}

void sub_1D7152304()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_1F00AF850)
  {
    v0 = sub_1D71610F4();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_1F00AF850);
  }
}

void sub_1D7152354(uint64_t a1, unint64_t *a2, uint64_t a3, uint64_t (*a4)(uint64_t, uint64_t))
{
  unint64_t v5;
  uint64_t v6;

  if (!*a2)
  {
    v5 = a4(a1, a3);
    if (!v6)
      atomic_store(v5, a2);
  }
  OUTLINED_FUNCTION_7();
}

void OUTLINED_FUNCTION_1()
{
  char v0;
  uint64_t v1;
  uint64_t v2;

  *(_BYTE *)(v2 - 145) = v0;
  *(_WORD *)(v2 - 144) = v1;
  *(_BYTE *)(v2 - 142) = BYTE2(v1);
  *(_BYTE *)(v2 - 141) = BYTE3(v1);
  *(_BYTE *)(v2 - 140) = BYTE4(v1);
  *(_BYTE *)(v2 - 139) = BYTE5(v1);
}

uint64_t OUTLINED_FUNCTION_3()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_6(uint64_t a1, uint64_t a2)
{
  uint64_t (*v2)(uint64_t, uint64_t, uint64_t);
  uint64_t v3;

  return v2(a1, a2, v3);
}

uint64_t OUTLINED_FUNCTION_9()
{
  unint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return sub_1D7150370(v2, v1, v0);
}

uint64_t OUTLINED_FUNCTION_10(uint64_t a1)
{
  uint64_t v1;
  uint64_t (*v2)(uint64_t, uint64_t);

  return v2(a1, v1);
}

uint64_t OUTLINED_FUNCTION_11()
{
  return swift_bridgeObjectRetain();
}

uint64_t OUTLINED_FUNCTION_12(uint64_t a1)
{
  unint64_t v1;

  return sub_1D71517A0(a1, v1);
}

size_t OUTLINED_FUNCTION_13(_QWORD *a1)
{
  uint64_t v1;
  size_t result;

  result = _swift_stdlib_malloc_size(a1);
  a1[2] = v1;
  a1[3] = 2 * ((uint64_t)(result - 32) / 16);
  return result;
}

uint64_t OUTLINED_FUNCTION_14()
{
  unint64_t v0;
  uint64_t v1;

  return sub_1D715048C(v1, v0);
}

uint64_t OUTLINED_FUNCTION_15()
{
  return swift_allocObject();
}

uint64_t OUTLINED_FUNCTION_16()
{
  return sub_1D71612EC();
}

uint64_t OUTLINED_FUNCTION_18()
{
  return sub_1D7160DF4();
}

uint64_t OUTLINED_FUNCTION_22()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_23(uint64_t a1, uint64_t a2)
{
  uint64_t (*v2)(uint64_t, uint64_t, uint64_t);
  uint64_t v3;

  return v2(a1, a2, v3);
}

uint64_t OUTLINED_FUNCTION_24()
{
  return 0;
}

uint64_t OUTLINED_FUNCTION_25()
{
  return swift_allocObject();
}

uint64_t OUTLINED_FUNCTION_26()
{
  uint64_t v0;

  return v0;
}

uint64_t OUTLINED_FUNCTION_27()
{
  return swift_getAssociatedTypeWitness();
}

uint64_t NSURLSession.dataProgress(for:)()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;

  sub_1D71527F4();
  v0[2] = swift_task_alloc();
  v1 = OUTLINED_FUNCTION_16_0();
  v0[3] = v1;
  v2 = *(_QWORD *)(v1 - 8);
  v0[4] = v2;
  v0[5] = *(_QWORD *)(v2 + 64);
  v0[6] = swift_task_alloc();
  v0[7] = swift_task_alloc();
  v3 = (_QWORD *)swift_task_alloc();
  v0[8] = v3;
  *v3 = v0;
  v3[1] = sub_1D71525C8;
  return sub_1D7161118();
}

uint64_t sub_1D71525C8(uint64_t a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v4;

  v4 = *v2;
  *(_QWORD *)(*v2 + 72) = v1;
  swift_task_dealloc();
  if (!v1)
    *(_QWORD *)(v4 + 80) = a1;
  OUTLINED_FUNCTION_2_0();
  return OUTLINED_FUNCTION_3_0();
}

uint64_t sub_1D715262C()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  char *v14;
  id v15;
  uint64_t v16;
  uint64_t v18;

  v1 = *(void **)(v0 + 80);
  v2 = *(_QWORD *)(v0 + 48);
  v3 = *(_QWORD *)(v0 + 56);
  v5 = *(_QWORD *)(v0 + 32);
  v4 = *(_QWORD *)(v0 + 40);
  v6 = *(_QWORD *)(v0 + 16);
  v7 = *(_QWORD *)(v0 + 24);
  v18 = v6;
  v8 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0CB38A8]), sel_init);
  v9 = objc_msgSend(v1, sel_expectedContentLength);
  objc_msgSend(v8, sel_setTotalUnitCount_, v9);
  v10 = sub_1D7161088();
  __swift_storeEnumTagSinglePayload(v6, 1, 1, v10);
  v11 = v2;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 16))(v2, v3, v7);
  v12 = (*(unsigned __int8 *)(v5 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  v13 = (v4 + v12 + 7) & 0xFFFFFFFFFFFFFFF8;
  v14 = (char *)swift_allocObject();
  *((_QWORD *)v14 + 2) = 0;
  *((_QWORD *)v14 + 3) = 0;
  *((_QWORD *)v14 + 4) = v9;
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 32))(&v14[v12], v11, v7);
  *(_QWORD *)&v14[v13] = v8;
  v15 = v8;
  v16 = sub_1D7153500(v18, (uint64_t)&unk_1F00AF878, (uint64_t)v14);
  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v3, v7);
  swift_task_dealloc();
  OUTLINED_FUNCTION_8_0();
  swift_task_dealloc();
  return (*(uint64_t (**)(id, _QWORD, uint64_t))(v0 + 8))(v15, *(_QWORD *)(v0 + 80), v16);
}

uint64_t sub_1D71527B0()
{
  uint64_t v0;

  swift_task_dealloc();
  swift_task_dealloc();
  OUTLINED_FUNCTION_8_0();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

void sub_1D71527F4()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_1F00AF868)
  {
    sub_1D7161088();
    v0 = sub_1D7161160();
    if (!v1)
      atomic_store(v0, &qword_1F00AF868);
  }
}

uint64_t __swift_storeEnumTagSinglePayload(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a4 - 8) + 56))();
}

uint64_t sub_1D7152854(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  _QWORD *v6;
  uint64_t v7;

  v6[23] = a5;
  v6[24] = a6;
  v6[21] = a1;
  v6[22] = a4;
  v7 = sub_1D716110C();
  v6[25] = v7;
  v6[26] = *(_QWORD *)(v7 - 8);
  v6[27] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_1D71528E4()
{
  uint64_t v0;
  id v1;
  uint64_t v2;
  void (*v3)(uint64_t);
  uint64_t v4;
  uint64_t v5;

  v1 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0C99E48]), sel_initToMemory);
  *(_QWORD *)(v0 + 224) = v1;
  objc_msgSend(v1, sel_open);
  *(_OWORD *)(v0 + 144) = xmmword_1D71618F0;
  sub_1D7160E3C();
  v2 = OUTLINED_FUNCTION_13_0();
  v3(v2);
  *(_QWORD *)(v0 + 120) = sub_1D7161100();
  *(_QWORD *)(v0 + 128) = v4;
  *(_QWORD *)(v0 + 136) = v5;
  *(_QWORD *)(v0 + 232) = 0;
  OUTLINED_FUNCTION_2_0();
  return swift_task_switch();
}

uint64_t sub_1D71529D8()
{
  uint64_t v0;
  _BYTE *v1;
  _QWORD *v3;

  v1 = *(_BYTE **)(v0 + 128);
  if (v1 == *(_BYTE **)(v0 + 136))
  {
    v3 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 240) = v3;
    *v3 = v0;
    v3[1] = sub_1D7152A94;
    return sub_1D7160E00();
  }
  else
  {
    *(_BYTE *)(v0 + 259) = *v1;
    *(_QWORD *)(v0 + 128) = v1 + 1;
    OUTLINED_FUNCTION_2_0();
    return OUTLINED_FUNCTION_4_0();
  }
}

uint64_t sub_1D7152A94(__int16 a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v4;

  v4 = *v2;
  *(_QWORD *)(*v2 + 248) = v1;
  swift_task_dealloc();
  if (!v1)
    *(_WORD *)(v4 + 256) = a1;
  OUTLINED_FUNCTION_2_0();
  return OUTLINED_FUNCTION_3_0();
}

uint64_t sub_1D7152B3C()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;

  v1 = *(_QWORD *)(v0 + 232);
  sub_1D71610AC();
  if (!v1)
  {
    OUTLINED_FUNCTION_12_0();
    __asm { BR              X12 }
  }
  OUTLINED_FUNCTION_9_0();
  sub_1D71517A0(*(_QWORD *)(v0 + 144), *(_QWORD *)(v0 + 152));
  v2 = *(void **)(v0 + 224);
  objc_msgSend(v2, sel_close);

  OUTLINED_FUNCTION_8_0();
  return OUTLINED_FUNCTION_6_0(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_1D7152D5C()
{
  uint64_t v0;

  *(_QWORD *)(v0 + 160) = *(_QWORD *)(v0 + 248);
  sub_1D7153C90();
  swift_willThrowTypedImpl();
  OUTLINED_FUNCTION_2_0();
  return OUTLINED_FUNCTION_4_0();
}

uint64_t sub_1D7152DD8()
{
  uint64_t v0;
  void *v1;

  OUTLINED_FUNCTION_9_0();
  sub_1D71517A0(*(_QWORD *)(v0 + 144), *(_QWORD *)(v0 + 152));
  v1 = *(void **)(v0 + 224);
  objc_msgSend(v1, sel_close);

  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_1D7152E64()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;

  if ((*(_WORD *)(v0 + 256) & 0x100) != 0)
  {
    OUTLINED_FUNCTION_9_0();
    __asm { BR              X10 }
  }
  v1 = *(_QWORD *)(v0 + 248);
  sub_1D71610AC();
  if (!v1)
  {
    OUTLINED_FUNCTION_12_0();
    __asm { BR              X12 }
  }
  OUTLINED_FUNCTION_9_0();
  sub_1D71517A0(*(_QWORD *)(v0 + 144), *(_QWORD *)(v0 + 152));
  v2 = *(void **)(v0 + 224);
  objc_msgSend(v2, sel_close);

  OUTLINED_FUNCTION_8_0();
  return OUTLINED_FUNCTION_6_0(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_1D7153208()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v1 = OUTLINED_FUNCTION_16_0();
  v2 = *(_QWORD *)(v1 - 8);
  v3 = (*(unsigned __int8 *)(v2 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  v4 = (*(_QWORD *)(v2 + 64) + v3 + 7) & 0xFFFFFFFFFFFFFFF8;
  swift_unknownObjectRelease();
  (*(void (**)(unint64_t, uint64_t))(v2 + 8))(v0 + v3, v1);

  return swift_deallocObject();
}

uint64_t sub_1D7153294(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;

  v4 = *(_QWORD *)(OUTLINED_FUNCTION_16_0() - 8);
  v5 = (*(unsigned __int8 *)(v4 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  v6 = v1[2];
  v7 = v1[3];
  v8 = v1[4];
  v9 = (uint64_t)v1 + v5;
  v10 = *(_QWORD *)((char *)v1 + ((*(_QWORD *)(v4 + 64) + v5 + 7) & 0xFFFFFFFFFFFFF8));
  v11 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v11;
  *v11 = v2;
  v11[1] = sub_1D715333C;
  return sub_1D7152854(a1, v6, v7, v8, v9, v10);
}

uint64_t sub_1D715333C()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

void NSOutputStream.write(_:)(uint64_t a1, uint64_t a2)
{
  __asm { BR              X10 }
}

void sub_1D71533C4()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;

  sub_1D7153854(v2, v1 & 0xFFFFFFFFFFFFLL, BYTE6(v1), v0);
}

uint64_t sub_1D71534F0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_1D7153500(a1, a2, a3);
}

uint64_t sub_1D7153500(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;

  v5 = sub_1D7161088();
  if (__swift_getEnumTagSinglePayload(a1, 1, v5) == 1)
  {
    sub_1D7153B4C(a1);
  }
  else
  {
    sub_1D716107C();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(a1, v5);
  }
  if (*(_QWORD *)(a3 + 16))
  {
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_1D7161040();
    swift_unknownObjectRelease();
  }
  return swift_task_create();
}

BOOL static NSOutputStream.OutputStreamError.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t NSOutputStream.OutputStreamError.hash(into:)()
{
  return sub_1D716137C();
}

uint64_t NSOutputStream.OutputStreamError.hashValue.getter()
{
  sub_1D7161370();
  sub_1D716137C();
  return sub_1D7161388();
}

uint64_t sub_1D71536AC()
{
  sub_1D7161370();
  sub_1D716137C();
  return sub_1D7161388();
}

uint64_t sub_1D71536FC(uint64_t result, uint64_t a2, id a3)
{
  uint64_t v3;
  uint64_t v4;
  BOOL v6;
  char v7;
  char *v8;

  if (result)
  {
    v3 = result;
    v4 = a2 - result;
    if (a2 - result < 1)
      return result;
    while (1)
    {
      result = (uint64_t)objc_msgSend(a3, sel_write_maxLength_, v3, v4);
      if (result < 0)
        break;
      v3 += result;
      v6 = v4 <= result;
      v4 -= result;
      if (v6)
        return result;
    }
    v7 = 1;
  }
  else
  {
    v7 = 0;
  }
  sub_1D7153B88();
  swift_allocError();
  *v8 = v7;
  return swift_willThrow();
}

void sub_1D71537A8(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  uint64_t v7;
  uint64_t v8;
  BOOL v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  v7 = sub_1D7160DDC();
  if (v7)
  {
    v8 = sub_1D7160DF4();
    if (__OFSUB__(a1, v8))
    {
LABEL_13:
      __break(1u);
      return;
    }
    v7 += a1 - v8;
  }
  v9 = __OFSUB__(a2, a1);
  v10 = a2 - a1;
  if (v9)
  {
    __break(1u);
    goto LABEL_13;
  }
  v11 = sub_1D7160DE8();
  if (v11 >= v10)
    v12 = v10;
  else
    v12 = v11;
  v13 = v7 + v12;
  if (v7)
    v14 = v13;
  else
    v14 = 0;
  sub_1D71536FC(v7, v14, a4);

}

void sub_1D7153854(uint64_t a1, uint64_t a2, uint64_t a3, id a4)
{
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  BOOL v8;
  _BYTE *v9;
  uint64_t v10;
  __int16 v11;
  char v12;
  char v13;
  char v14;
  char v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v10 = a1;
  v11 = a2;
  v12 = BYTE2(a2);
  v13 = BYTE3(a2);
  v14 = BYTE4(a2);
  v15 = BYTE5(a2);
  if (a3 >= 1)
  {
    v5 = a3;
    v6 = &v10;
    while (1)
    {
      v7 = (uint64_t)objc_msgSend(a4, sel_write_maxLength_, v6, v5);
      if (v7 < 0)
        break;
      v6 = (uint64_t *)((char *)v6 + v7);
      v8 = v5 <= v7;
      v5 -= v7;
      if (v8)
        goto LABEL_8;
    }
    sub_1D7153B88();
    swift_allocError();
    *v9 = 1;
    swift_willThrow();
  }
LABEL_8:

}

unint64_t sub_1D7153998()
{
  unint64_t result;

  result = qword_1F00AF880;
  if (!qword_1F00AF880)
  {
    result = MEMORY[0x1D82937B8](&protocol conformance descriptor for NSOutputStream.OutputStreamError, &type metadata for NSOutputStream.OutputStreamError);
    atomic_store(result, (unint64_t *)&qword_1F00AF880);
  }
  return result;
}

_BYTE *__swift_memcpy1_1(_BYTE *result, _BYTE *a2)
{
  *result = *a2;
  return result;
}

uint64_t _s17OutputStreamErrorOwet(unsigned __int8 *a1, unsigned int a2)
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

uint64_t _s17OutputStreamErrorOwst(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_1D7153AB8 + 4 * byte_1D7161905[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_1D7153AEC + 4 * byte_1D7161900[v4]))();
}

uint64_t sub_1D7153AEC(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_1D7153AF4(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x1D7153AFCLL);
  return result;
}

uint64_t sub_1D7153B08(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x1D7153B10);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_1D7153B14(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1D7153B1C(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1D7153B28(unsigned __int8 *a1)
{
  return *a1;
}

_BYTE *sub_1D7153B30(_BYTE *result, char a2)
{
  *result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for NSOutputStream.OutputStreamError()
{
  return &type metadata for NSOutputStream.OutputStreamError;
}

uint64_t sub_1D7153B4C(uint64_t a1)
{
  uint64_t v2;

  sub_1D71527F4();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_1D7153B88()
{
  unint64_t result;

  result = qword_1F00AF888;
  if (!qword_1F00AF888)
  {
    result = MEMORY[0x1D82937B8](&protocol conformance descriptor for NSOutputStream.OutputStreamError, &type metadata for NSOutputStream.OutputStreamError);
    atomic_store(result, (unint64_t *)&qword_1F00AF888);
  }
  return result;
}

void sub_1D7153BC4()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_1F00AF890)
  {
    v0 = sub_1D7161214();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_1F00AF890);
  }
}

unint64_t sub_1D7153C0C()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1F00AF898;
  if (!qword_1F00AF898)
  {
    sub_1D7153BC4();
    result = MEMORY[0x1D82937B8](MEMORY[0x1E0CB25E0], v1);
    atomic_store(result, (unint64_t *)&qword_1F00AF898);
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

uint64_t __swift_destroy_boxed_opaque_existential_1(uint64_t a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(*(_QWORD *)(a1 + 24) - 8);
  if ((*(_BYTE *)(v1 + 82) & 2) != 0)
    return swift_release();
  else
    return (*(uint64_t (**)(void))(v1 + 8))();
}

unint64_t sub_1D7153C90()
{
  unint64_t result;

  result = qword_1ED56FB58;
  if (!qword_1ED56FB58)
  {
    result = swift_getExistentialTypeMetadata();
    atomic_store(result, (unint64_t *)&qword_1ED56FB58);
  }
  return result;
}

_OWORD *sub_1D7153CE4(_OWORD *a1, _OWORD *a2)
{
  __int128 v2;

  v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t OUTLINED_FUNCTION_1_0()
{
  uint64_t v0;
  unint64_t v1;

  return sub_1D71517A0(v0, v1);
}

uint64_t OUTLINED_FUNCTION_3_0()
{
  return swift_task_switch();
}

uint64_t OUTLINED_FUNCTION_4_0()
{
  return swift_task_switch();
}

uint64_t OUTLINED_FUNCTION_5_0()
{
  return swift_task_switch();
}

uint64_t OUTLINED_FUNCTION_6_0(uint64_t (*a1)(void))
{
  return a1();
}

void OUTLINED_FUNCTION_7_0()
{
  uint64_t v0;
  uint64_t v1;

  NSOutputStream.write(_:)(v0, v1);
}

uint64_t OUTLINED_FUNCTION_8_0()
{
  return swift_task_dealloc();
}

uint64_t OUTLINED_FUNCTION_9_0()
{
  return swift_unknownObjectRelease();
}

uint64_t OUTLINED_FUNCTION_10_0()
{
  return sub_1D7160E30();
}

uint64_t OUTLINED_FUNCTION_11_0()
{
  uint64_t v0;
  unint64_t v1;

  return sub_1D715048C(v0, v1);
}

uint64_t OUTLINED_FUNCTION_13_0()
{
  uint64_t v0;

  return v0;
}

uint64_t OUTLINED_FUNCTION_14_0()
{
  uint64_t v0;
  unint64_t v1;

  return sub_1D71517A0(v0, v1);
}

unint64_t OUTLINED_FUNCTION_15_0(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(v1 + 40) = a1;
  return sub_1D7153C0C();
}

uint64_t OUTLINED_FUNCTION_16_0()
{
  return sub_1D716110C();
}

uint64_t waitForDebugger(for:)(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v2[9] = a1;
  v2[10] = a2;
  v3 = sub_1D7161070();
  v2[11] = v3;
  v2[12] = *(_QWORD *)(v3 - 8);
  v2[13] = OUTLINED_FUNCTION_2_1();
  v4 = sub_1D7160E9C();
  v2[14] = v4;
  v2[15] = *(_QWORD *)(v4 - 8);
  v2[16] = OUTLINED_FUNCTION_2_1();
  v5 = sub_1D7160EC0();
  v2[17] = v5;
  v2[18] = *(_QWORD *)(v5 - 8);
  v2[19] = OUTLINED_FUNCTION_2_1();
  sub_1D7154B54(0, &qword_1F00AF868, (uint64_t (*)(uint64_t))MEMORY[0x1E0DF0750], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0DEB940]);
  v2[20] = OUTLINED_FUNCTION_2_1();
  v6 = OUTLINED_FUNCTION_25_0();
  v2[21] = v6;
  v7 = *(_QWORD *)(v6 - 8);
  v2[22] = v7;
  v2[23] = *(_QWORD *)(v7 + 64);
  v2[24] = OUTLINED_FUNCTION_18_0();
  v2[25] = swift_task_alloc();
  v8 = OUTLINED_FUNCTION_24_0();
  v2[26] = v8;
  v9 = *(_QWORD *)(v8 - 8);
  v2[27] = v9;
  v2[28] = *(_QWORD *)(v9 + 64);
  v2[29] = OUTLINED_FUNCTION_18_0();
  v2[30] = swift_task_alloc();
  return OUTLINED_FUNCTION_4_0();
}

uint64_t sub_1D7153EC4()
{
  _QWORD *v0;
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
  unint64_t v11;
  unint64_t v12;
  uint64_t v13;
  _QWORD *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  FILE *v20;
  void (__cdecl *v21)(int);
  void (__cdecl *v22)(int);
  uint64_t v23;
  void *v24;
  _QWORD *v25;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;

  v1 = v0[29];
  v2 = v0[30];
  v3 = v0[27];
  v5 = v0[25];
  v4 = v0[26];
  v6 = v0[24];
  v27 = v1;
  v28 = v0[23];
  v7 = v0[21];
  v8 = v0[22];
  v9 = v0[20];
  v29 = v0[28];
  v31 = v0[9];
  v33 = v0[10];
  sub_1D716125C();
  sub_1D7161220();
  v10 = sub_1D7161088();
  __swift_storeEnumTagSinglePayload(v9, 1, 1, v10);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v8 + 16))(v6, v5, v7);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16))(v1, v2, v4);
  v11 = (*(unsigned __int8 *)(v8 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80);
  v12 = (v28 + *(unsigned __int8 *)(v3 + 80) + v11) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  v13 = swift_allocObject();
  *(_QWORD *)(v13 + 16) = 0;
  *(_QWORD *)(v13 + 24) = 0;
  (*(void (**)(unint64_t, uint64_t, uint64_t))(v8 + 32))(v13 + v11, v6, v7);
  (*(void (**)(unint64_t, uint64_t, uint64_t))(v3 + 32))(v13 + v12, v27, v4);
  v14 = (_QWORD *)(v13 + ((v29 + v12 + 7) & 0xFFFFFFFFFFFFFFF8));
  *v14 = v31;
  v14[1] = v33;
  v15 = sub_1D71534F0(v9, (uint64_t)&unk_1F00AF8B0, v13);
  v0[31] = v15;
  LODWORD(v9) = OUTLINED_FUNCTION_19_0();
  OUTLINED_FUNCTION_20_0();
  v16 = OUTLINED_FUNCTION_8_1();
  *(_OWORD *)(v16 + 16) = xmmword_1D7161760;
  *(_QWORD *)(v16 + 56) = MEMORY[0x1E0DEA968];
  if ((_DWORD)v9 == 1)
  {
    v17 = v0[19];
    v18 = v0[16];
    v32 = v0[18];
    v34 = v0[17];
    v19 = v0[15];
    v30 = v0[14];
    *(_QWORD *)(v16 + 32) = 0x1000000000000028;
    *(_QWORD *)(v16 + 40) = 0x80000001D71640D0;
    sub_1D7161364();
    OUTLINED_FUNCTION_16_1();
    v20 = (FILE *)sub_1D7160E78();
    fflush(v20);
    v21 = (void (__cdecl *)(int))sub_1D7160E90();
    v22 = OUTLINED_FUNCTION_17_0((uint64_t)v21, v21);
    sub_1D71549B8();
    v23 = sub_1D7161130();
    swift_getObjectType();
    v0[2] = MEMORY[0x1E0C809B0];
    v0[6] = sub_1D7154A34;
    v0[7] = v15;
    v0[3] = 1107296256;
    v0[4] = sub_1D7154A3C;
    v0[5] = &block_descriptor;
    v24 = _Block_copy(v0 + 2);
    OUTLINED_FUNCTION_21_0();
    swift_retain();
    sub_1D7160EB4();
    sub_1D7154A80();
    sub_1D716113C();
    _Block_release(v24);
    OUTLINED_FUNCTION_10_1();
    (*(void (**)(uint64_t, uint64_t))(v19 + 8))(v18, v30);
    (*(void (**)(uint64_t, uint64_t))(v32 + 8))(v17, v34);
    swift_release();
    OUTLINED_FUNCTION_21_0();
    sub_1D7161154();
    OUTLINED_FUNCTION_10_1();
  }
  else
  {
    *(_QWORD *)(v16 + 32) = 0x1000000000000017;
    *(_QWORD *)(v16 + 40) = 0x80000001D71640B0;
    sub_1D7161364();
    OUTLINED_FUNCTION_16_1();
    v22 = 0;
    v23 = 0;
  }
  v0[32] = v22;
  v0[33] = v23;
  v25 = (_QWORD *)swift_task_alloc();
  v0[34] = v25;
  v0[35] = sub_1D7153C90();
  *v25 = v0;
  v25[1] = sub_1D7154240;
  return sub_1D7161094();
}

uint64_t sub_1D7154240()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 288) = v0;
  swift_task_dealloc();
  return OUTLINED_FUNCTION_4_0();
}

uint64_t sub_1D715429C()
{
  uint64_t v0;
  uint64_t v1;
  void (__cdecl *v2)(int);
  __n128 *v3;
  FILE *v4;
  uint64_t (*v5)(void);

  if (*(_QWORD *)(v0 + 264))
  {
    swift_getObjectType();
    OUTLINED_FUNCTION_21_0();
    sub_1D7161148();
    OUTLINED_FUNCTION_10_1();
  }
  v1 = OUTLINED_FUNCTION_19_0();
  if ((_DWORD)v1 == 1)
  {
    v2 = *(void (__cdecl **)(int))(v0 + 256);
    if (!v2)
    {
      v1 = sub_1D7160E84();
      v2 = (void (__cdecl *)(int))v1;
    }
    OUTLINED_FUNCTION_17_0(v1, v2);
    OUTLINED_FUNCTION_20_0();
    v3 = (__n128 *)OUTLINED_FUNCTION_8_1();
    OUTLINED_FUNCTION_1_1(v3, MEMORY[0x1E0DEA968], (__n128)xmmword_1D7161760);
    OUTLINED_FUNCTION_16_1();
    v4 = (FILE *)sub_1D7160E78();
    fflush(v4);
  }
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_7_1();
  OUTLINED_FUNCTION_6_1();
  OUTLINED_FUNCTION_10_1();
  OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_23_0();
  OUTLINED_FUNCTION_36();
  OUTLINED_FUNCTION_35();
  OUTLINED_FUNCTION_34();
  OUTLINED_FUNCTION_33();
  OUTLINED_FUNCTION_32();
  OUTLINED_FUNCTION_30();
  v5 = (uint64_t (*)(void))OUTLINED_FUNCTION_26_0();
  return OUTLINED_FUNCTION_3_1(v5);
}

uint64_t sub_1D715436C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void (__cdecl *v5)(int);
  __n128 *v6;
  FILE *v7;
  uint64_t (*v8)(void);
  uint64_t v9;
  void (__cdecl *v10)(int);
  __n128 *v11;
  FILE *v12;

  *(_QWORD *)(v0 + 64) = *(_QWORD *)(v0 + 288);
  MEMORY[0x1D8293728]();
  if ((swift_dynamicCast() & 1) != 0)
  {
    v2 = *(_QWORD *)(v0 + 96);
    v1 = *(_QWORD *)(v0 + 104);
    v3 = *(_QWORD *)(v0 + 88);

    (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
    if (*(_QWORD *)(v0 + 264))
    {
      swift_getObjectType();
      OUTLINED_FUNCTION_21_0();
      sub_1D7161148();
      OUTLINED_FUNCTION_10_1();
    }
    v4 = OUTLINED_FUNCTION_19_0();
    if ((_DWORD)v4 == 1)
    {
      v5 = *(void (__cdecl **)(int))(v0 + 256);
      if (!v5)
      {
        v4 = sub_1D7160E84();
        v5 = (void (__cdecl *)(int))v4;
      }
      OUTLINED_FUNCTION_17_0(v4, v5);
      OUTLINED_FUNCTION_20_0();
      v6 = (__n128 *)OUTLINED_FUNCTION_8_1();
      OUTLINED_FUNCTION_1_1(v6, MEMORY[0x1E0DEA968], (__n128)xmmword_1D7161760);
      OUTLINED_FUNCTION_16_1();
      v7 = (FILE *)sub_1D7160E78();
      fflush(v7);
    }
    OUTLINED_FUNCTION_0_1();
    OUTLINED_FUNCTION_7_1();
    OUTLINED_FUNCTION_6_1();
    OUTLINED_FUNCTION_10_1();
    OUTLINED_FUNCTION_8_0();
    OUTLINED_FUNCTION_23_0();
    OUTLINED_FUNCTION_36();
    OUTLINED_FUNCTION_35();
    OUTLINED_FUNCTION_34();
    OUTLINED_FUNCTION_33();
    OUTLINED_FUNCTION_32();
    OUTLINED_FUNCTION_30();
    v8 = (uint64_t (*)(void))OUTLINED_FUNCTION_26_0();
  }
  else
  {

    v9 = OUTLINED_FUNCTION_19_0();
    if ((_DWORD)v9 == 1)
    {
      v10 = *(void (__cdecl **)(int))(v0 + 256);
      if (!v10)
      {
        v9 = sub_1D7160E84();
        v10 = (void (__cdecl *)(int))v9;
      }
      OUTLINED_FUNCTION_17_0(v9, v10);
      OUTLINED_FUNCTION_20_0();
      v11 = (__n128 *)OUTLINED_FUNCTION_8_1();
      OUTLINED_FUNCTION_1_1(v11, MEMORY[0x1E0DEA968], (__n128)xmmword_1D7161760);
      OUTLINED_FUNCTION_16_1();
      v12 = (FILE *)sub_1D7160E78();
      fflush(v12);
    }
    OUTLINED_FUNCTION_0_1();
    OUTLINED_FUNCTION_7_1();
    OUTLINED_FUNCTION_6_1();
    OUTLINED_FUNCTION_10_1();
    OUTLINED_FUNCTION_8_0();
    OUTLINED_FUNCTION_23_0();
    OUTLINED_FUNCTION_36();
    OUTLINED_FUNCTION_35();
    OUTLINED_FUNCTION_34();
    OUTLINED_FUNCTION_33();
    OUTLINED_FUNCTION_32();
    OUTLINED_FUNCTION_30();
    v8 = *(uint64_t (**)(void))(v0 + 8);
  }
  return OUTLINED_FUNCTION_3_1(v8);
}

uint64_t sub_1D715452C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  _QWORD *v7;
  uint64_t v8;

  v7[4] = a6;
  v7[5] = a7;
  v7[2] = a4;
  v7[3] = a5;
  v8 = sub_1D7161250();
  v7[6] = v8;
  v7[7] = *(_QWORD *)(v8 - 8);
  v7[8] = swift_task_alloc();
  v7[9] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_1D71545A0()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  void (*v4)(uint64_t, uint64_t);
  uint64_t (*v5)(void);

  v1 = v0[9];
  v2 = v0[6];
  v3 = v0[7];
  sub_1D7161220();
  OUTLINED_FUNCTION_27_0();
  v4 = *(void (**)(uint64_t, uint64_t))(v3 + 8);
  v0[10] = v4;
  v4(v1, v2);
  if ((OUTLINED_FUNCTION_15_1() & 1) != 0 && (MSVProcessIsDebugging() & 1) == 0)
  {
    OUTLINED_FUNCTION_14_1();
    OUTLINED_FUNCTION_11_1();
  }
  OUTLINED_FUNCTION_22_0();
  OUTLINED_FUNCTION_31();
  v5 = (uint64_t (*)(void))OUTLINED_FUNCTION_26_0();
  return OUTLINED_FUNCTION_4_1(v5);
}

uint64_t sub_1D7154624()
{
  uint64_t v0;
  _QWORD *v1;

  OUTLINED_FUNCTION_29();
  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 88) = v1;
  OUTLINED_FUNCTION_9_1(v1, (uint64_t)sub_1D7154650);
  return OUTLINED_FUNCTION_5_1();
}

uint64_t sub_1D7154650()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;

  v2 = *v1;
  *(_QWORD *)(*v1 + 96) = v0;
  swift_task_dealloc();
  (*(void (**)(_QWORD, _QWORD))(v2 + 80))(*(_QWORD *)(v2 + 64), *(_QWORD *)(v2 + 48));
  return swift_task_switch();
}

uint64_t sub_1D71546C4()
{
  _QWORD *v0;
  uint64_t v1;
  void (*v2)(uint64_t, uint64_t);
  uint64_t v3;
  uint64_t (*v4)(void);

  v1 = v0[9];
  v2 = (void (*)(uint64_t, uint64_t))v0[10];
  v3 = v0[6];
  sub_1D7161220();
  OUTLINED_FUNCTION_27_0();
  v2(v1, v3);
  if ((OUTLINED_FUNCTION_15_1() & 1) != 0 && (MSVProcessIsDebugging() & 1) == 0)
  {
    OUTLINED_FUNCTION_14_1();
    OUTLINED_FUNCTION_11_1();
  }
  OUTLINED_FUNCTION_22_0();
  OUTLINED_FUNCTION_31();
  v4 = (uint64_t (*)(void))OUTLINED_FUNCTION_26_0();
  return OUTLINED_FUNCTION_4_1(v4);
}

uint64_t sub_1D7154740()
{
  uint64_t v0;
  _QWORD *v1;

  OUTLINED_FUNCTION_29();
  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 88) = v1;
  OUTLINED_FUNCTION_9_1(v1, (uint64_t)sub_1D7154650);
  return OUTLINED_FUNCTION_5_1();
}

uint64_t sub_1D715476C()
{
  uint64_t v0;

  OUTLINED_FUNCTION_22_0();
  OUTLINED_FUNCTION_31();
  return OUTLINED_FUNCTION_13_1(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_1D7154798()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;

  v1 = OUTLINED_FUNCTION_25_0();
  v2 = *(_QWORD *)(v1 - 8);
  v3 = (*(unsigned __int8 *)(v2 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  v4 = *(_QWORD *)(v2 + 64);
  v5 = OUTLINED_FUNCTION_24_0();
  v6 = *(_QWORD *)(v5 - 8);
  v7 = (v3 + v4 + *(unsigned __int8 *)(v6 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80);
  swift_unknownObjectRelease();
  (*(void (**)(unint64_t, uint64_t))(v2 + 8))(v0 + v3, v1);
  (*(void (**)(unint64_t, uint64_t))(v6 + 8))(v0 + v7, v5);
  return swift_deallocObject();
}

uint64_t sub_1D7154858(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD *v16;

  v4 = *(_QWORD *)(OUTLINED_FUNCTION_25_0() - 8);
  v5 = (*(unsigned __int8 *)(v4 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  v6 = *(_QWORD *)(v4 + 64);
  v7 = *(_QWORD *)(OUTLINED_FUNCTION_24_0() - 8);
  v8 = (v5 + v6 + *(unsigned __int8 *)(v7 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
  v9 = *(_QWORD *)(v1 + 16);
  v10 = *(_QWORD *)(v1 + 24);
  v11 = v1 + v5;
  v12 = v1 + v8;
  v13 = (uint64_t *)(v1 + ((*(_QWORD *)(v7 + 64) + v8 + 7) & 0xFFFFFFFFFFFFFFF8));
  v14 = *v13;
  v15 = v13[1];
  v16 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v16;
  *v16 = v2;
  v16[1] = sub_1D715492C;
  return sub_1D715452C(a1, v9, v10, v11, v12, v14, v15);
}

uint64_t sub_1D715492C()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc();
  return OUTLINED_FUNCTION_13_1(*(uint64_t (**)(void))(v2 + 8));
}

void sub_1D715496C()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_1F00AF8B8)
  {
    v0 = sub_1D71612EC();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_1F00AF8B8);
  }
}

unint64_t sub_1D71549B8()
{
  unint64_t result;

  result = qword_1ED56FB50;
  if (!qword_1ED56FB50)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_1ED56FB50);
  }
  return result;
}

uint64_t sub_1D71549F4()
{
  sub_1D7153C90();
  return sub_1D71610A0();
}

uint64_t sub_1D7154A34()
{
  return sub_1D71549F4();
}

uint64_t sub_1D7154A3C(uint64_t a1)
{
  void (*v1)(uint64_t);
  uint64_t v2;

  v1 = *(void (**)(uint64_t))(a1 + 32);
  v2 = swift_retain();
  v1(v2);
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

uint64_t block_destroy_helper()
{
  return swift_release();
}

uint64_t sub_1D7154A80()
{
  uint64_t (*v0)(uint64_t);

  sub_1D7160E9C();
  v0 = (uint64_t (*)(uint64_t))MEMORY[0x1E0DEF4F8];
  sub_1D7154B14();
  sub_1D7154B54(0, &qword_1F00AF8C0, v0, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0DEAEC8]);
  sub_1D7154BAC();
  return sub_1D71611B4();
}

unint64_t sub_1D7154B14()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1ED56FB30;
  if (!qword_1ED56FB30)
  {
    v1 = sub_1D7160E9C();
    result = MEMORY[0x1D82937B8](MEMORY[0x1E0DEF510], v1);
    atomic_store(result, (unint64_t *)&qword_1ED56FB30);
  }
  return result;
}

void sub_1D7154B54(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t), uint64_t (*a4)(uint64_t, uint64_t))
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

unint64_t sub_1D7154BAC()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1ED56FB38;
  if (!qword_1ED56FB38)
  {
    sub_1D7154B54(255, &qword_1F00AF8C0, (uint64_t (*)(uint64_t))MEMORY[0x1E0DEF4F8], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0DEAEC8]);
    result = MEMORY[0x1D82937B8](MEMORY[0x1E0DEAF38], v1);
    atomic_store(result, (unint64_t *)&qword_1ED56FB38);
  }
  return result;
}

uint64_t OUTLINED_FUNCTION_1_1@<X0>(__n128 *a1@<X0>, unint64_t a2@<X8>, __n128 a3@<Q0>)
{
  a1[1] = a3;
  a1[3].n128_u64[1] = a2;
  a1[2].n128_u64[0] = 0x4B325B1B0DLL;
  a1[2].n128_u64[1] = 0xE500000000000000;
  return sub_1D7161364();
}

uint64_t OUTLINED_FUNCTION_2_1()
{
  return swift_task_alloc();
}

uint64_t OUTLINED_FUNCTION_3_1(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t OUTLINED_FUNCTION_4_1(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t OUTLINED_FUNCTION_5_1()
{
  return sub_1D716122C();
}

uint64_t OUTLINED_FUNCTION_6_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 8))(v0, v1);
}

uint64_t OUTLINED_FUNCTION_7_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 8))(v0, v1);
}

uint64_t OUTLINED_FUNCTION_8_1()
{
  return swift_allocObject();
}

uint64_t OUTLINED_FUNCTION_9_1@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;

  *a1 = v2;
  a1[1] = a2;
  return *(_QWORD *)(v2 + 64);
}

uint64_t OUTLINED_FUNCTION_10_1()
{
  return swift_unknownObjectRelease();
}

void OUTLINED_FUNCTION_11_1()
{
  JUMPOUT(0x1D829335CLL);
}

uint64_t OUTLINED_FUNCTION_13_1(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t OUTLINED_FUNCTION_14_1()
{
  return sub_1D7161220();
}

uint64_t OUTLINED_FUNCTION_15_1()
{
  return sub_1D71613B8();
}

uint64_t OUTLINED_FUNCTION_16_1()
{
  return swift_bridgeObjectRelease();
}

void (__cdecl *OUTLINED_FUNCTION_17_0(uint64_t a1, void (__cdecl *a2)(int)))(int)
{
  return signal(2, a2);
}

uint64_t OUTLINED_FUNCTION_18_0()
{
  return swift_task_alloc();
}

uint64_t OUTLINED_FUNCTION_19_0()
{
  return isatty(0);
}

void OUTLINED_FUNCTION_20_0()
{
  sub_1D715496C();
}

uint64_t OUTLINED_FUNCTION_21_0()
{
  return swift_unknownObjectRetain();
}

uint64_t OUTLINED_FUNCTION_22_0()
{
  return swift_task_dealloc();
}

uint64_t OUTLINED_FUNCTION_23_0()
{
  return swift_task_dealloc();
}

uint64_t OUTLINED_FUNCTION_24_0()
{
  return sub_1D7161268();
}

uint64_t OUTLINED_FUNCTION_25_0()
{
  return sub_1D7161250();
}

uint64_t OUTLINED_FUNCTION_26_0()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + 8);
}

uint64_t OUTLINED_FUNCTION_27_0()
{
  return sub_1D7161244();
}

uint64_t OUTLINED_FUNCTION_29()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t (*v2)(uint64_t, uint64_t);

  return v2(v0, v1);
}

uint64_t OUTLINED_FUNCTION_30()
{
  return swift_task_dealloc();
}

uint64_t OUTLINED_FUNCTION_31()
{
  return swift_task_dealloc();
}

uint64_t OUTLINED_FUNCTION_32()
{
  return swift_task_dealloc();
}

uint64_t OUTLINED_FUNCTION_33()
{
  return swift_task_dealloc();
}

uint64_t OUTLINED_FUNCTION_34()
{
  return swift_task_dealloc();
}

uint64_t OUTLINED_FUNCTION_35()
{
  return swift_task_dealloc();
}

uint64_t OUTLINED_FUNCTION_36()
{
  return swift_task_dealloc();
}

_QWORD *sub_1D7154DF0(int64_t a1)
{
  _QWORD **v1;
  _QWORD *v3;
  _QWORD *result;
  int64_t v5;

  v3 = *v1;
  result = (_QWORD *)swift_isUniquelyReferenced_nonNull_native();
  if (!(_DWORD)result || a1 > v3[3] >> 1)
  {
    if (v3[2] <= a1)
      v5 = a1;
    else
      v5 = v3[2];
    result = sub_1D7151568(result, v5, 0, v3);
    v3 = result;
  }
  *v1 = v3;
  return result;
}

void MSVSQLStatement.bindNull(to:)(uint64_t a1)
{
  void *v1;
  id v2;

  if (*(_BYTE *)(a1 + 16) == 1)
  {
    v2 = (id)sub_1D7160F14();
    objc_msgSend(v1, sel_bindNullValueToParameterNamed_, v2);

  }
  else
  {
    objc_msgSend(v1, sel_bindNullValueToParameterAtIndex_, *(_QWORD *)a1);
  }
}

void MSVSQLStatement.bind(_:to:)(uint64_t a1, char a2, uint64_t a3)
{
  sub_1D7154EE4(a1, a2, a3, (void (*)(uint64_t, _QWORD, _QWORD *))MSVSQLStatement.bind(_:to:));
}

{
  sub_1D7154F3C(a1, a2, a3, (const char **)&selRef_bindInt64Value_toParameterNamed_, (SEL *)&selRef_bindInt64Value_toParameterAtIndex_);
}

{
  sub_1D7154EE4(a1, a2, a3, (void (*)(uint64_t, _QWORD, _QWORD *))MSVSQLStatement.bind(_:to:));
}

{
  sub_1D7154F3C(a1, a2, a3, (const char **)&selRef_bindUInt64Value_toParameterNamed_, (SEL *)&selRef_bindUInt64Value_toParameterAtIndex_);
}

{
  void *v3;
  uint64_t v5;
  char v6;
  void *v8;
  _QWORD v9[2];
  char v10;

  v5 = *(_QWORD *)(a3 + 8);
  v6 = *(_BYTE *)(a3 + 16);
  if ((a2 & 1) != 0)
  {
    v9[0] = *(_QWORD *)a3;
    v9[1] = v5;
    v10 = v6;
    MSVSQLStatement.bindNull(to:)((uint64_t)v9);
    OUTLINED_FUNCTION_39();
  }
  else if (*(_BYTE *)(a3 + 16))
  {
    v8 = (void *)sub_1D7160F14();
    objc_msgSend(v3, sel_bindDoubleValue_toParameterNamed_, v8, *(double *)&a1);
    OUTLINED_FUNCTION_10_2(v8);
  }
  else
  {
    objc_msgSend(v3, sel_bindDoubleValue_toParameterAtIndex_, *(_QWORD *)a3, *(double *)&a1);
  }
}

void sub_1D7154EE4(uint64_t a1, char a2, uint64_t a3, void (*a4)(uint64_t, _QWORD, _QWORD *))
{
  uint64_t v4;
  char v5;
  uint64_t v6;
  _QWORD v7[2];
  char v8;

  v4 = *(_QWORD *)(a3 + 8);
  v5 = *(_BYTE *)(a3 + 16);
  if ((a2 & 1) != 0)
  {
    OUTLINED_FUNCTION_9_2(v5, v6, *(_QWORD *)a3, v4, v8);
  }
  else
  {
    v7[0] = *(_QWORD *)a3;
    v7[1] = v4;
    v8 = v5;
    a4(a1, 0, v7);
  }
}

void sub_1D7154F3C(uint64_t a1, char a2, uint64_t a3, const char **a4, SEL *a5)
{
  void *v5;
  uint64_t v8;
  char v9;
  uint64_t v10;
  void *v11;
  _QWORD v12[2];
  char v13;

  v8 = *(_QWORD *)(a3 + 8);
  v9 = *(_BYTE *)(a3 + 16);
  if ((a2 & 1) != 0)
  {
    v12[0] = *(_QWORD *)a3;
    v12[1] = v8;
    v13 = v9;
    MSVSQLStatement.bindNull(to:)((uint64_t)v12);
    OUTLINED_FUNCTION_6_2();
  }
  else if (*(_BYTE *)(a3 + 16))
  {
    sub_1D7160F14();
    OUTLINED_FUNCTION_34_0();
    OUTLINED_FUNCTION_41(v10, *a4);
    OUTLINED_FUNCTION_4_2(v11);
  }
  else
  {
    OUTLINED_FUNCTION_15_2(v5, *a5);
  }
}

void MSVSQLStatement.bind(_:to:)(uint64_t a1, uint64_t *a2, double a3)
{
  void *v3;
  uint64_t v5;
  uint64_t v6;
  int v7;
  int v8;
  double v9;
  uint64_t v10;
  void *v11;
  char v12;

  v6 = *a2;
  v5 = a2[1];
  v7 = *((unsigned __int8 *)a2 + 16);
  if ((a1 & 0x100000000) != 0)
  {
    OUTLINED_FUNCTION_9_2(v7, v10, v6, v5, v12);
    OUTLINED_FUNCTION_39();
  }
  else
  {
    v8 = a1;
    if (v7)
    {
      v11 = (void *)sub_1D7160F14();
      LODWORD(v9) = v8;
      objc_msgSend(v3, sel_bindFloatValue_toParameterNamed_, v11, v9);
      OUTLINED_FUNCTION_10_2(v11);
    }
    else
    {
      LODWORD(a3) = a1;
      objc_msgSend(v3, sel_bindFloatValue_toParameterAtIndex_, v6, a3);
    }
  }
}

void MSVSQLStatement.bind(_:to:)(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  char v7;

  v4 = *a3;
  if (a2)
  {
    if (*((_BYTE *)a3 + 16))
    {
      v5 = (void *)sub_1D7160F14();
      sub_1D7160F14();
      OUTLINED_FUNCTION_34_0();
      objc_msgSend(v3, sel_bindStringValue_toParameterNamed_, v5);

    }
    else
    {
      v6 = (void *)sub_1D7160F14();
      objc_msgSend(v3, sel_bindStringValue_toParameterAtIndex_, v6, v4);
    }
    OUTLINED_FUNCTION_4_2(v6);
  }
  else
  {
    OUTLINED_FUNCTION_9_2(*((_BYTE *)a3 + 16), (uint64_t)v6, *a3, a3[1], v7);
    OUTLINED_FUNCTION_6_2();
  }
}

void MSVSQLStatement.bind<A>(_:to:)()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char v5;
  int v6;
  uint64_t v7;
  _QWORD v8[2];
  char v9;

  OUTLINED_FUNCTION_22_1();
  v3 = OUTLINED_FUNCTION_16_2();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x1E0C80A78](v3);
  OUTLINED_FUNCTION_43();
  v5 = *(_BYTE *)(v0 + 16);
  OUTLINED_FUNCTION_31_0(*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v4 + 16));
  v6 = OUTLINED_FUNCTION_32_0();
  if (v6 == 1)
  {
    OUTLINED_FUNCTION_40(*(uint64_t (**)(uint64_t, uint64_t))(v4 + 8));
    v7 = 0;
  }
  else
  {
    OUTLINED_FUNCTION_29_0();
    v7 = v8[0];
    OUTLINED_FUNCTION_25_1();
  }
  v8[0] = v1;
  v8[1] = v2;
  v9 = v5;
  MSVSQLStatement.bind(_:to:)(v7, v6 == 1, (uint64_t)v8);
  OUTLINED_FUNCTION_4();
}

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
  char v10;

  OUTLINED_FUNCTION_22_1();
  v3 = OUTLINED_FUNCTION_16_2();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x1E0C80A78](v3);
  OUTLINED_FUNCTION_43();
  v5 = *(_BYTE *)(v0 + 16);
  OUTLINED_FUNCTION_31_0(*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v4 + 16));
  if (OUTLINED_FUNCTION_32_0() == 1)
  {
    OUTLINED_FUNCTION_40(*(uint64_t (**)(uint64_t, uint64_t))(v4 + 8));
    v6 = 0;
    v7 = 0;
  }
  else
  {
    OUTLINED_FUNCTION_29_0();
    v6 = v8;
    v7 = v9;
    OUTLINED_FUNCTION_25_1();
  }
  v8 = v1;
  v9 = v2;
  v10 = v5;
  MSVSQLStatement.bind(_:to:)(v6, v7, &v8);
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_4();
}

void MSVSQLStatement.bind(_:to:)(char a1, uint64_t *a2)
{
  void *v2;
  uint64_t v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  void *v8;
  char v9;

  v5 = *a2;
  v4 = a2[1];
  v6 = *((unsigned __int8 *)a2 + 16);
  if (a1 == 2)
  {
    OUTLINED_FUNCTION_9_2(v6, (uint64_t)v8, v5, v4, v9);
    OUTLINED_FUNCTION_39();
  }
  else if (v6)
  {
    v7 = a1 & 1;
    sub_1D7160F14();
    OUTLINED_FUNCTION_34_0();
    objc_msgSend(v2, sel_bindBoolValue_toParameterNamed_, v7);
    OUTLINED_FUNCTION_10_2(v8);
  }
  else
  {
    objc_msgSend(v2, sel_bindBoolValue_toParameterAtIndex_, a1 & 1, v5);
  }
}

void MSVSQLStatement.bind(_:to:)()
{
  void *v0;
  void *v1;
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  int v15;
  void *v16;
  void *v17;
  _QWORD v19[2];
  char v20;

  OUTLINED_FUNCTION_22_1();
  v1 = v0;
  v3 = v2;
  v5 = v4;
  OUTLINED_FUNCTION_27_1();
  MEMORY[0x1E0C80A78](v6);
  v8 = (char *)&v19[-1] - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = sub_1D7160E6C();
  v10 = *(_QWORD *)(v9 - 8);
  MEMORY[0x1E0C80A78](v9);
  v12 = (char *)&v19[-1] - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = *v3;
  v14 = v3[1];
  v15 = *((unsigned __int8 *)v3 + 16);
  sub_1D71556CC(v5, (uint64_t)v8, (uint64_t (*)(_QWORD))sub_1D71554DC);
  if (__swift_getEnumTagSinglePayload((uint64_t)v8, 1, v9) == 1)
  {
    sub_1D7155744((uint64_t)v8, (uint64_t (*)(_QWORD))sub_1D71554DC);
    v19[0] = v13;
    v19[1] = v14;
    v20 = v15;
    MSVSQLStatement.bindNull(to:)((uint64_t)v19);
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v10 + 32))(v12, v8, v9);
    if (v15)
    {
      v16 = (void *)sub_1D7160E60();
      v17 = (void *)sub_1D7160F14();
      objc_msgSend(v1, sel_bindDateValue_toParameterNamed_, v16, v17);

    }
    else
    {
      v17 = (void *)sub_1D7160E60();
      objc_msgSend(v1, sel_bindDateValue_toParameterAtIndex_, v17, v13);
    }

    (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
  }
  OUTLINED_FUNCTION_4();
}

void sub_1D71554DC()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_1F00AF8C8)
  {
    sub_1D7160E6C();
    v0 = sub_1D7161160();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_1F00AF8C8);
  }
}

void MSVSQLStatement.bind(json:to:)(uint64_t a1, uint64_t *a2)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  void *v7;
  unsigned __int8 v8;
  void *v9;
  id v10;
  uint64_t v11;
  unsigned int v12;
  id v13;
  __int128 v14;
  uint64_t v15;
  __int128 v16;
  char v17;
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = *a2;
  v4 = a2[1];
  v5 = *((unsigned __int8 *)a2 + 16);
  sub_1D71556CC(a1, (uint64_t)&v14, (uint64_t (*)(_QWORD))sub_1D71556F8);
  if (!v15)
  {
    sub_1D7155744((uint64_t)&v14, (uint64_t (*)(_QWORD))sub_1D71556F8);
    *(_QWORD *)&v16 = v3;
    *((_QWORD *)&v16 + 1) = v4;
    v17 = v5;
    MSVSQLStatement.bindNull(to:)((uint64_t)&v16);
    return;
  }
  sub_1D7153CE4(&v14, &v16);
  if (!v5)
  {
    __swift_project_boxed_opaque_existential_1(&v16, v18);
    v11 = sub_1D7161304();
    *(_QWORD *)&v14 = 0;
    v12 = objc_msgSend(v2, sel_bindJSONValue_toParameterAtIndex_error_, v11, v3, &v14);
    swift_unknownObjectRelease();
    v9 = (void *)v14;
    if (!v12)
      goto LABEL_4;
LABEL_7:
    v13 = v9;
    goto LABEL_8;
  }
  __swift_project_boxed_opaque_existential_1(&v16, v18);
  v6 = sub_1D7161304();
  v7 = (void *)sub_1D7160F14();
  *(_QWORD *)&v14 = 0;
  v8 = objc_msgSend(v2, sel_bindJSONValue_toParameterNamed_error_, v6, v7, &v14);
  swift_unknownObjectRelease();

  v9 = (void *)v14;
  if ((v8 & 1) != 0)
    goto LABEL_7;
LABEL_4:
  v10 = v9;
  sub_1D7160E18();

  swift_willThrow();
LABEL_8:
  __swift_destroy_boxed_opaque_existential_1((uint64_t)&v16);
}

void sub_1D71556CC(uint64_t a1, uint64_t a2, uint64_t (*a3)(_QWORD))
{
  uint64_t v3;

  v3 = OUTLINED_FUNCTION_28(a1, a2, a3);
  OUTLINED_FUNCTION_38(*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 16));
  OUTLINED_FUNCTION_7();
}

void sub_1D71556F8()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_1F00AF8D0)
  {
    v0 = sub_1D7161160();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_1F00AF8D0);
  }
}

void sub_1D7155744(uint64_t a1, uint64_t (*a2)(_QWORD))
{
  uint64_t v3;

  v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  OUTLINED_FUNCTION_7();
}

void MSVSQLStatement.bind(functionContext:to:)(uint64_t a1, uint64_t a2)
{
  void *v2;
  uint64_t v3;
  void *v4;
  char v5;

  if (a1)
  {
    if (*(_BYTE *)(a2 + 16))
    {
      swift_unknownObjectRetain();
      sub_1D7160F14();
      OUTLINED_FUNCTION_34_0();
      OUTLINED_FUNCTION_41(v3, sel_bindFunctionContext_toParameterNamed_);
      swift_unknownObjectRelease();
      OUTLINED_FUNCTION_4_2(v4);
    }
    else
    {
      OUTLINED_FUNCTION_15_2(v2, sel_bindFunctionContext_toParameterAtIndex_);
    }
  }
  else
  {
    OUTLINED_FUNCTION_9_2(*(_BYTE *)(a2 + 16), (uint64_t)v4, *(_QWORD *)a2, *(_QWORD *)(a2 + 8), v5);
    OUTLINED_FUNCTION_6_2();
  }
}

_QWORD *MSVSQLDatabase.StatementInterpolation.StringInterpolation.init(literalCapacity:interpolationCount:)@<X0>(_QWORD *result@<X0>, int64_t a2@<X1>, _QWORD *a3@<X8>)
{
  uint64_t v3;
  int64_t v5;
  BOOL v6;

  *a3 = 0;
  a3[1] = 0xE000000000000000;
  a3[2] = MEMORY[0x1E0DEE9D8];
  v3 = *MEMORY[0x1E0D4CF70] + 1;
  if (__OFADD__(*MEMORY[0x1E0D4CF70], 1))
  {
    __break(1u);
    goto LABEL_6;
  }
  v5 = a2 * v3;
  if ((unsigned __int128)(a2 * (__int128)v3) >> 64 != (a2 * v3) >> 63)
  {
LABEL_6:
    __break(1u);
    goto LABEL_7;
  }
  v6 = __OFADD__(result, v5);
  result = (_QWORD *)((char *)result + v5);
  if (!v6)
  {
    MEMORY[0x1D8293074](result);
    return sub_1D7154DF0(a2);
  }
LABEL_7:
  __break(1u);
  return result;
}

Swift::Void __swiftcall MSVSQLDatabase.StatementInterpolation.StringInterpolation.appendInterpolation(_:)(Swift::Int_optional a1)
{
  sub_1D7155928(a1.value, a1.is_nil, (uint64_t)&unk_1E9BE6790, (uint64_t)sub_1D71558CC);
}

uint64_t sub_1D71558A8()
{
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_1D71558CC(uint64_t a1)
{
  return sub_1D71564BC(a1, (void (*)(uint64_t, uint64_t, _QWORD *))MSVSQLStatement.bind(_:to:));
}

Swift::Void __swiftcall MSVSQLDatabase.StatementInterpolation.StringInterpolation.appendInterpolation(_:)(Swift::UInt_optional a1)
{
  sub_1D7155928(a1.value, a1.is_nil, (uint64_t)&unk_1E9BE67B8, (uint64_t)sub_1D71564B0);
}

Swift::Void __swiftcall MSVSQLDatabase.StatementInterpolation.StringInterpolation.appendInterpolation(_:)(Swift::Int64_optional a1)
{
  sub_1D7155928(a1.value, a1.is_nil, (uint64_t)&unk_1E9BE67E0, (uint64_t)sub_1D71564E0);
}

Swift::Void __swiftcall MSVSQLDatabase.StatementInterpolation.StringInterpolation.appendInterpolation(_:)(Swift::UInt64_optional a1)
{
  sub_1D7155928(a1.value, a1.is_nil, (uint64_t)&unk_1E9BE6808, (uint64_t)sub_1D71564EC);
}

Swift::Void __swiftcall MSVSQLDatabase.StatementInterpolation.StringInterpolation.appendInterpolation(_:)(Swift::Double_optional a1)
{
  char v1;

  sub_1D7155928(*(uint64_t *)&a1.is_nil, v1, (uint64_t)&unk_1E9BE6830, (uint64_t)sub_1D71564F8);
}

void sub_1D7155928(uint64_t a1, char a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  id v8;
  uint64_t v9;
  _QWORD *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  v8 = (id)OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_13_2();
  OUTLINED_FUNCTION_33_0();
  OUTLINED_FUNCTION_37();
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_14_2();
  v9 = OUTLINED_FUNCTION_23_1();
  *(_QWORD *)(v9 + 16) = a1;
  *(_BYTE *)(v9 + 24) = a2 & 1;
  *(_QWORD *)(v9 + 32) = v13;
  *(_QWORD *)(v9 + 40) = v14;
  OUTLINED_FUNCTION_20_1();
  v10 = *(_QWORD **)(*(_QWORD *)(v4 + 16) + 16);
  sub_1D7156474(v10);
  v11 = *(_QWORD *)(v4 + 16);
  *(_QWORD *)(v11 + 16) = (char *)v10 + 1;
  v12 = v11 + 16 * (_QWORD)v10;
  *(_QWORD *)(v12 + 32) = a4;
  *(_QWORD *)(v12 + 40) = v9;
  *(_QWORD *)(v4 + 16) = v11;
  OUTLINED_FUNCTION_21_1();
}

uint64_t sub_1D71559E0(uint64_t a1, uint64_t a2, char a3, uint64_t a4, uint64_t a5, void (*a6)(uint64_t, uint64_t, _QWORD *))
{
  uint64_t v8;
  _QWORD v10[2];
  char v11;

  v8 = a3 & 1;
  v10[0] = a4;
  v10[1] = a5;
  v11 = 1;
  swift_bridgeObjectRetain();
  a6(a2, v8, v10);
  return OUTLINED_FUNCTION_12_1();
}

Swift::Void __swiftcall MSVSQLDatabase.StatementInterpolation.StringInterpolation.appendInterpolation(_:)(Swift::Float_optional *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v5 = (id)OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_13_2();
  OUTLINED_FUNCTION_17_1();
  OUTLINED_FUNCTION_7_2();
  OUTLINED_FUNCTION_26_1();
  OUTLINED_FUNCTION_5_2();
  v6 = OUTLINED_FUNCTION_23_1();
  *(_DWORD *)(v6 + 16) = (_DWORD)a1;
  *(_BYTE *)(v6 + 20) = BYTE4(a1) & 1;
  *(_QWORD *)(v6 + 24) = v2;
  *(_QWORD *)(v6 + 32) = v3;
  OUTLINED_FUNCTION_20_1();
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_3_2();
  *(_QWORD *)(v7 + 32) = sub_1D7156528;
  *(_QWORD *)(v7 + 40) = v6;
  *(_QWORD *)(v1 + 16) = v8;
  OUTLINED_FUNCTION_8_2();
}

uint64_t sub_1D7155AC4(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4)
{
  double v5;
  uint64_t v7[2];
  char v8;

  v7[0] = a3;
  v7[1] = a4;
  v8 = 1;
  swift_bridgeObjectRetain();
  MSVSQLStatement.bind(_:to:)(a2 | ((HIDWORD(a2) & 1) << 32), v7, v5);
  return swift_bridgeObjectRelease();
}

Swift::Void __swiftcall MSVSQLDatabase.StatementInterpolation.StringInterpolation.appendInterpolation(_:)(Swift::String_optional a1)
{
  _QWORD *v1;
  void *object;
  uint64_t countAndFlagsBits;
  id v4;
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  object = a1.value._object;
  countAndFlagsBits = a1.value._countAndFlagsBits;
  v4 = (id)OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_13_2();

  _sSo14MSVSQLDatabaseC15MediaFoundationE22StatementInterpolationV06StringE0V13appendLiteralyySSF_0();
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_14_2();
  v5 = (_QWORD *)OUTLINED_FUNCTION_23_1();
  v5[2] = countAndFlagsBits;
  v5[3] = object;
  v5[4] = v8;
  v5[5] = v9;
  swift_bridgeObjectRetain();
  sub_1D715642C();
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_3_2();
  *(_QWORD *)(v6 + 32) = sub_1D7156578;
  *(_QWORD *)(v6 + 40) = v5;
  v1[2] = v7;
  OUTLINED_FUNCTION_21_1();
}

uint64_t sub_1D7155BDC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v8[2];
  char v9;

  v8[0] = a4;
  v8[1] = a5;
  v9 = 1;
  swift_bridgeObjectRetain();
  MSVSQLStatement.bind(_:to:)(a2, a3, v8);
  return swift_bridgeObjectRelease();
}

void MSVSQLDatabase.StatementInterpolation.StringInterpolation.appendInterpolation<A>(_:)()
{
  sub_1D7155C64();
}

{
  sub_1D7155C64();
}

void sub_1D7155C64()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  _QWORD *v20;
  uint64_t v21;
  uint64_t v22;
  _QWORD v23[2];
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;

  OUTLINED_FUNCTION_22_1();
  v24 = v1;
  v25 = v2;
  v23[1] = v3;
  v4 = v0;
  v6 = v5;
  v8 = v7;
  v9 = sub_1D7161160();
  v10 = *(_QWORD *)(v9 - 8);
  v11 = *(_QWORD *)(v10 + 64);
  MEMORY[0x1E0C80A78](v9);
  v13 = (char *)v23 - v12;
  v14 = (id)OUTLINED_FUNCTION_30_0();
  OUTLINED_FUNCTION_13_2();

  _sSo14MSVSQLDatabaseC15MediaFoundationE22StatementInterpolationV06StringE0V13appendLiteralyySSF_0();
  swift_bridgeObjectRelease();
  v15 = v26;
  v16 = v27;
  OUTLINED_FUNCTION_14_2();
  (*(void (**)(char *, uint64_t, uint64_t))(v10 + 16))(v13, v8, v9);
  v17 = (*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  v18 = swift_allocObject();
  v19 = v24;
  *(_QWORD *)(v18 + 16) = v6;
  *(_QWORD *)(v18 + 24) = v19;
  (*(void (**)(unint64_t, char *, uint64_t))(v10 + 32))(v18 + v17, v13, v9);
  v20 = (_QWORD *)(v18 + ((v11 + v17 + 7) & 0xFFFFFFFFFFFFFFF8));
  *v20 = v15;
  v20[1] = v16;
  OUTLINED_FUNCTION_20_1();
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_3_2();
  *(_QWORD *)(v21 + 32) = v25;
  *(_QWORD *)(v21 + 40) = v18;
  v4[2] = v22;
  OUTLINED_FUNCTION_4();
}

uint64_t sub_1D7155D94(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, void (*a7)(uint64_t, _QWORD *, uint64_t, uint64_t))
{
  _QWORD v12[2];
  char v13;

  v12[0] = a3;
  v12[1] = a4;
  v13 = 1;
  swift_bridgeObjectRetain();
  a7(a2, v12, a5, a6);
  return OUTLINED_FUNCTION_12_1();
}

Swift::Void __swiftcall MSVSQLDatabase.StatementInterpolation.StringInterpolation.appendInterpolation(_:)(Swift::Bool_optional a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v5 = (id)OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_13_2();
  OUTLINED_FUNCTION_17_1();
  OUTLINED_FUNCTION_7_2();
  OUTLINED_FUNCTION_26_1();
  OUTLINED_FUNCTION_5_2();
  v6 = OUTLINED_FUNCTION_23_1();
  *(Swift::Bool_optional *)(v6 + 16) = a1;
  *(_QWORD *)(v6 + 24) = v2;
  *(_QWORD *)(v6 + 32) = v3;
  OUTLINED_FUNCTION_20_1();
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_3_2();
  *(_QWORD *)(v7 + 32) = sub_1D715668C;
  *(_QWORD *)(v7 + 40) = v6;
  *(_QWORD *)(v1 + 16) = v8;
  OUTLINED_FUNCTION_8_2();
}

uint64_t sub_1D7155E78(uint64_t a1, char a2, uint64_t a3, uint64_t a4)
{
  uint64_t v6[2];
  char v7;

  v6[0] = a3;
  v6[1] = a4;
  v7 = 1;
  swift_bridgeObjectRetain();
  MSVSQLStatement.bind(_:to:)(a2, v6);
  return swift_bridgeObjectRelease();
}

void MSVSQLDatabase.StatementInterpolation.StringInterpolation.appendInterpolation(_:)()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  uint64_t v13;
  _QWORD *v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD v17[2];

  OUTLINED_FUNCTION_22_1();
  v1 = v0;
  v3 = v2;
  OUTLINED_FUNCTION_27_1();
  v5 = *(_QWORD *)(v4 - 8);
  v6 = *(_QWORD *)(v5 + 64);
  MEMORY[0x1E0C80A78](v4);
  v7 = (char *)v17 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = (id)OUTLINED_FUNCTION_30_0();
  OUTLINED_FUNCTION_13_2();
  OUTLINED_FUNCTION_33_0();
  OUTLINED_FUNCTION_37();
  swift_bridgeObjectRelease();
  v9 = v17[0];
  v10 = v17[1];
  OUTLINED_FUNCTION_14_2();
  sub_1D71556CC(v3, (uint64_t)v7, (uint64_t (*)(_QWORD))sub_1D71554DC);
  v11 = (*(unsigned __int8 *)(v5 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  v12 = (v6 + v11 + 7) & 0xFFFFFFFFFFFFFFF8;
  v13 = swift_allocObject();
  sub_1D715678C((uint64_t)v7, v13 + v11, (uint64_t (*)(_QWORD))sub_1D71554DC);
  v14 = (_QWORD *)(v13 + v12);
  *v14 = v9;
  v14[1] = v10;
  OUTLINED_FUNCTION_20_1();
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_3_2();
  *(_QWORD *)(v15 + 32) = sub_1D7156714;
  *(_QWORD *)(v15 + 40) = v13;
  *(_QWORD *)(v1 + 16) = v16;
  OUTLINED_FUNCTION_4();
}

uint64_t sub_1D7155FDC()
{
  swift_bridgeObjectRetain();
  MSVSQLStatement.bind(_:to:)();
  return swift_bridgeObjectRelease();
}

_QWORD *MSVSQLDatabase.StatementInterpolation.StringInterpolation.appendInterpolation(json:)(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  id v5;
  uint64_t v6;
  _QWORD *v7;
  _QWORD *result;
  uint64_t v9;
  uint64_t v10;
  _BYTE v11[32];

  v5 = (id)OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_13_2();
  OUTLINED_FUNCTION_17_1();
  OUTLINED_FUNCTION_7_2();
  OUTLINED_FUNCTION_26_1();
  OUTLINED_FUNCTION_5_2();
  sub_1D71556CC(a1, (uint64_t)v11, (uint64_t (*)(_QWORD))sub_1D71556F8);
  v6 = OUTLINED_FUNCTION_23_1();
  sub_1D715678C((uint64_t)v11, v6 + 16, (uint64_t (*)(_QWORD))sub_1D71556F8);
  *(_QWORD *)(v6 + 48) = v2;
  *(_QWORD *)(v6 + 56) = v3;
  OUTLINED_FUNCTION_20_1();
  v7 = *(_QWORD **)(*(_QWORD *)(v1 + 16) + 16);
  result = sub_1D7156474(v7);
  v9 = *(_QWORD *)(v1 + 16);
  *(_QWORD *)(v9 + 16) = (char *)v7 + 1;
  v10 = v9 + 16 * (_QWORD)v7;
  *(_QWORD *)(v10 + 32) = sub_1D71567B8;
  *(_QWORD *)(v10 + 40) = v6;
  *(_QWORD *)(v1 + 16) = v9;
  return result;
}

uint64_t sub_1D7156100(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v6[2];
  char v7;

  v6[0] = a3;
  v6[1] = a4;
  v7 = 1;
  swift_bridgeObjectRetain();
  MSVSQLStatement.bind(json:to:)(a2, v6);
  return swift_bridgeObjectRelease();
}

void MSVSQLDatabase.StatementInterpolation.StringInterpolation.appendInterpolation(functionContext:)(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  id v5;
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;

  v5 = (id)OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_13_2();
  OUTLINED_FUNCTION_17_1();
  OUTLINED_FUNCTION_7_2();
  OUTLINED_FUNCTION_26_1();
  OUTLINED_FUNCTION_5_2();
  v6 = (_QWORD *)OUTLINED_FUNCTION_23_1();
  v6[2] = a1;
  v6[3] = v2;
  v6[4] = v3;
  swift_unknownObjectRetain();
  sub_1D715642C();
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_3_2();
  *(_QWORD *)(v7 + 32) = sub_1D71567F0;
  *(_QWORD *)(v7 + 40) = v6;
  *(_QWORD *)(v1 + 16) = v8;
  OUTLINED_FUNCTION_8_2();
}

uint64_t sub_1D7156210(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _QWORD v6[2];
  char v7;

  v6[0] = a3;
  v6[1] = a4;
  v7 = 1;
  swift_bridgeObjectRetain();
  MSVSQLStatement.bind(functionContext:to:)(a2, (uint64_t)v6);
  return swift_bridgeObjectRelease();
}

void sub_1D715626C(Swift::String *a1)
{
  MSVSQLDatabase.StatementInterpolation.StringInterpolation.appendLiteral(_:)(*a1);
}

void MSVSQLDatabase.StatementInterpolation.init(stringLiteral:)(uint64_t a1@<X0>, uint64_t a2@<X1>, _QWORD *a3@<X8>)
{
  uint64_t v6;
  _QWORD *v7;

  v6 = sub_1D7160F74();
  MEMORY[0x1D8293074](v6);
  v7 = sub_1D7151568(0, 0, 0, MEMORY[0x1E0DEE9D8]);
  swift_bridgeObjectRelease();
  *a3 = a1;
  a3[1] = a2;
  a3[2] = v7;
  OUTLINED_FUNCTION_6_2();
}

__n128 MSVSQLDatabase.StatementInterpolation.init(stringInterpolation:)@<Q0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  __n128 result;

  *(_QWORD *)a2 = *(_QWORD *)a1;
  result = *(__n128 *)(a1 + 8);
  *(__n128 *)(a2 + 8) = result;
  return result;
}

void sub_1D71562F4(uint64_t *a1@<X0>, _QWORD *a2@<X8>)
{
  MSVSQLDatabase.StatementInterpolation.init(stringLiteral:)(*a1, a1[1], a2);
}

id MSVSQLDatabase.statement(_:)(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  void *v3;
  id v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  void (*v8)(id *);
  id v9;
  id v10;
  id v12[2];

  v12[1] = *(id *)MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 16);
  v3 = (void *)sub_1D7160F14();
  v12[0] = 0;
  v4 = objc_msgSend(v1, sel_statementWithString_error_, v3, v12);

  if (v4)
  {
    v5 = *(_QWORD *)(v2 + 16);
    if (v5)
    {
      v6 = v12[0];
      swift_bridgeObjectRetain();
      v7 = v2 + 40;
      do
      {
        v8 = *(void (**)(id *))(v7 - 8);
        v12[0] = v4;
        swift_retain();
        v8(v12);
        swift_release();
        v7 += 16;
        --v5;
      }
      while (v5);
      swift_bridgeObjectRelease();
    }
    else
    {
      v10 = v12[0];
    }
  }
  else
  {
    v9 = v12[0];
    sub_1D7160E18();

    swift_willThrow();
  }
  return v4;
}

_QWORD *sub_1D715642C()
{
  _QWORD **v0;
  _QWORD *v1;
  _QWORD *result;

  v1 = *v0;
  result = (_QWORD *)swift_isUniquelyReferenced_nonNull_native();
  *v0 = v1;
  if (!(_DWORD)result)
  {
    result = sub_1D7151568(result, v1[2] + 1, 1, v1);
    *v0 = result;
  }
  return result;
}

_QWORD *sub_1D7156474(_QWORD *result)
{
  _QWORD **v1;
  unint64_t v2;

  v2 = (*v1)[3];
  if ((uint64_t)result + 1 > (uint64_t)(v2 >> 1))
  {
    result = sub_1D7151568((_QWORD *)(v2 > 1), (int64_t)result + 1, 1, *v1);
    *v1 = result;
  }
  return result;
}

uint64_t sub_1D71564B0(uint64_t a1)
{
  return sub_1D71564BC(a1, (void (*)(uint64_t, uint64_t, _QWORD *))MSVSQLStatement.bind(_:to:));
}

uint64_t sub_1D71564BC(uint64_t a1, void (*a2)(uint64_t, uint64_t, _QWORD *))
{
  uint64_t v2;

  return sub_1D71559E0(a1, *(_QWORD *)(v2 + 16), *(_BYTE *)(v2 + 24), *(_QWORD *)(v2 + 32), *(_QWORD *)(v2 + 40), a2);
}

uint64_t sub_1D71564E0(uint64_t a1)
{
  return sub_1D71564BC(a1, (void (*)(uint64_t, uint64_t, _QWORD *))MSVSQLStatement.bind(_:to:));
}

uint64_t sub_1D71564EC(uint64_t a1)
{
  return sub_1D71564BC(a1, (void (*)(uint64_t, uint64_t, _QWORD *))MSVSQLStatement.bind(_:to:));
}

uint64_t sub_1D71564F8(uint64_t a1)
{
  return sub_1D71564BC(a1, (void (*)(uint64_t, uint64_t, _QWORD *))MSVSQLStatement.bind(_:to:));
}

uint64_t sub_1D7156504()
{
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_1D7156528(uint64_t a1)
{
  uint64_t v1;

  return sub_1D7155AC4(a1, *(unsigned int *)(v1 + 16) | ((unint64_t)*(unsigned __int8 *)(v1 + 20) << 32), *(_QWORD *)(v1 + 24), *(_QWORD *)(v1 + 32));
}

uint64_t sub_1D715654C()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_1D7156578(uint64_t a1)
{
  uint64_t *v1;

  return sub_1D7155BDC(a1, v1[2], v1[3], v1[4], v1[5]);
}

uint64_t sub_1D7156588(uint64_t a1)
{
  return sub_1D7156620(a1, (void (*)(uint64_t, _QWORD *, uint64_t, uint64_t))MSVSQLStatement.bind<A>(_:to:));
}

uint64_t objectdestroy_20Tm()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;

  v1 = *(_QWORD *)(v0 + 16);
  v2 = sub_1D7161160();
  v3 = (*(unsigned __int8 *)(*(_QWORD *)(v2 - 8) + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(v2 - 8) + 80);
  if (!__swift_getEnumTagSinglePayload(v0 + v3, 1, v1))
    (*(void (**)(unint64_t, uint64_t))(*(_QWORD *)(v1 - 8) + 8))(v0 + v3, v1);
  OUTLINED_FUNCTION_11_2();
  return OUTLINED_FUNCTION_19_1();
}

uint64_t sub_1D7156614(uint64_t a1)
{
  return sub_1D7156620(a1, (void (*)(uint64_t, _QWORD *, uint64_t, uint64_t))MSVSQLStatement.bind<A>(_:to:));
}

uint64_t sub_1D7156620(uint64_t a1, void (*a2)(uint64_t, _QWORD *, uint64_t, uint64_t))
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v5 = *(_QWORD *)(v2 + 16);
  v6 = *(_QWORD *)(v2 + 24);
  sub_1D7161160();
  OUTLINED_FUNCTION_18_1();
  return sub_1D7155D94(a1, v7, v8, v9, v5, v6, a2);
}

uint64_t sub_1D715668C(uint64_t a1)
{
  uint64_t v1;

  return sub_1D7155E78(a1, *(_BYTE *)(v1 + 16), *(_QWORD *)(v1 + 24), *(_QWORD *)(v1 + 32));
}

uint64_t sub_1D7156698()
{
  uint64_t v0;
  uint64_t v1;
  unint64_t v2;
  uint64_t v3;

  OUTLINED_FUNCTION_27_1();
  v2 = (*(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80);
  v3 = sub_1D7160E6C();
  if (!__swift_getEnumTagSinglePayload(v0 + v2, 1, v3))
    (*(void (**)(unint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(v0 + v2, v3);
  OUTLINED_FUNCTION_11_2();
  return OUTLINED_FUNCTION_19_1();
}

uint64_t sub_1D7156714()
{
  OUTLINED_FUNCTION_27_1();
  OUTLINED_FUNCTION_18_1();
  return sub_1D7155FDC();
}

uint64_t sub_1D7156758()
{
  uint64_t v0;

  if (*(_QWORD *)(v0 + 40))
    __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

void sub_1D715678C(uint64_t a1, uint64_t a2, uint64_t (*a3)(_QWORD))
{
  uint64_t v3;

  v3 = OUTLINED_FUNCTION_28(a1, a2, a3);
  OUTLINED_FUNCTION_38(*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 32));
  OUTLINED_FUNCTION_7();
}

uint64_t sub_1D71567B8(uint64_t a1)
{
  uint64_t v1;

  return sub_1D7156100(a1, v1 + 16, *(_QWORD *)(v1 + 48), *(_QWORD *)(v1 + 56));
}

uint64_t sub_1D71567C4()
{
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_1D71567F0(uint64_t a1)
{
  uint64_t *v1;

  return sub_1D7156210(a1, v1[2], v1[3], v1[4]);
}

uint64_t sub_1D71567FC()
{
  return MEMORY[0x1E0DEA9F0];
}

unint64_t sub_1D715680C()
{
  unint64_t result;

  result = qword_1F00AF8D8;
  if (!qword_1F00AF8D8)
  {
    result = MEMORY[0x1D82937B8](&protocol conformance descriptor for MSVSQLDatabase.StatementInterpolation, &type metadata for MSVSQLDatabase.StatementInterpolation);
    atomic_store(result, (unint64_t *)&qword_1F00AF8D8);
  }
  return result;
}

unint64_t sub_1D715684C()
{
  unint64_t result;

  result = qword_1F00AF8E0;
  if (!qword_1F00AF8E0)
  {
    result = MEMORY[0x1D82937B8](&protocol conformance descriptor for MSVSQLDatabase.StatementInterpolation, &type metadata for MSVSQLDatabase.StatementInterpolation);
    atomic_store(result, (unint64_t *)&qword_1F00AF8E0);
  }
  return result;
}

unint64_t sub_1D715688C()
{
  unint64_t result;

  result = qword_1F00AF8E8;
  if (!qword_1F00AF8E8)
  {
    result = MEMORY[0x1D82937B8](&protocol conformance descriptor for MSVSQLDatabase.StatementInterpolation.StringInterpolation, &type metadata for MSVSQLDatabase.StatementInterpolation.StringInterpolation);
    atomic_store(result, (unint64_t *)&qword_1F00AF8E8);
  }
  return result;
}

unint64_t sub_1D71568CC()
{
  unint64_t result;

  result = qword_1F00AF8F0;
  if (!qword_1F00AF8F0)
  {
    result = MEMORY[0x1D82937B8](&protocol conformance descriptor for MSVSQLDatabase.StatementInterpolation, &type metadata for MSVSQLDatabase.StatementInterpolation);
    atomic_store(result, (unint64_t *)&qword_1F00AF8F0);
  }
  return result;
}

uint64_t sub_1D7156908()
{
  return MEMORY[0x1E0DEAA00];
}

uint64_t sub_1D7156914()
{
  return MEMORY[0x1E0DEA9F8];
}

uint64_t sub_1D7156924(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t result;

  if ((a3 & 1) != 0)
    return swift_bridgeObjectRetain();
  return result;
}

uint64_t _s9ParameterOwxx(uint64_t a1)
{
  return sub_1D7156944(*(_QWORD *)a1, *(_QWORD *)(a1 + 8), *(_BYTE *)(a1 + 16));
}

uint64_t sub_1D7156944(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t result;

  if ((a3 & 1) != 0)
    return swift_bridgeObjectRelease();
  return result;
}

void _s9ParameterOwCP_0(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  char v5;

  v3 = *(_QWORD *)a2;
  v4 = *(_QWORD *)(a2 + 8);
  v5 = *(_BYTE *)(a2 + 16);
  sub_1D7156924(*(_QWORD *)a2, v4, v5);
  *(_QWORD *)a1 = v3;
  *(_QWORD *)(a1 + 8) = v4;
  *(_BYTE *)(a1 + 16) = v5;
  OUTLINED_FUNCTION_8();
}

uint64_t _s9ParameterOwca(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  char v5;
  uint64_t v6;
  uint64_t v7;
  char v8;

  v3 = *(_QWORD *)a2;
  v4 = *(_QWORD *)(a2 + 8);
  v5 = *(_BYTE *)(a2 + 16);
  sub_1D7156924(*(_QWORD *)a2, v4, v5);
  v6 = *(_QWORD *)a1;
  v7 = *(_QWORD *)(a1 + 8);
  v8 = *(_BYTE *)(a1 + 16);
  *(_QWORD *)a1 = v3;
  *(_QWORD *)(a1 + 8) = v4;
  *(_BYTE *)(a1 + 16) = v5;
  sub_1D7156944(v6, v7, v8);
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

uint64_t _s9ParameterOwta(uint64_t a1, uint64_t a2)
{
  char v3;
  uint64_t v4;
  uint64_t v5;
  char v6;

  v3 = *(_BYTE *)(a2 + 16);
  v4 = *(_QWORD *)a1;
  v5 = *(_QWORD *)(a1 + 8);
  v6 = *(_BYTE *)(a1 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_BYTE *)(a1 + 16) = v3;
  sub_1D7156944(v4, v5, v6);
  return a1;
}

uint64_t _s9ParameterOwet(uint64_t a1, unsigned int a2)
{
  int v2;
  unsigned int v3;

  if (a2)
  {
    if (a2 >= 0xFF && *(_BYTE *)(a1 + 17))
    {
      v2 = *(_DWORD *)a1 + 254;
    }
    else
    {
      v3 = *(unsigned __int8 *)(a1 + 16);
      if (v3 <= 1)
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

uint64_t _s9ParameterOwst(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFE)
  {
    *(_BYTE *)(result + 16) = 0;
    *(_QWORD *)result = a2 - 255;
    *(_QWORD *)(result + 8) = 0;
    if (a3 >= 0xFF)
      *(_BYTE *)(result + 17) = 1;
  }
  else
  {
    if (a3 >= 0xFF)
      *(_BYTE *)(result + 17) = 0;
    if (a2)
      *(_BYTE *)(result + 16) = -(char)a2;
  }
  return result;
}

uint64_t sub_1D7156AC4(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 16);
}

uint64_t sub_1D7156ACC(uint64_t result, char a2)
{
  *(_BYTE *)(result + 16) = a2 & 1;
  return result;
}

void type metadata accessor for MSVSQLStatement.Parameter()
{
  OUTLINED_FUNCTION_35_0();
}

__n128 __swift_memcpy24_8(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  a1[1].n128_u64[0] = a2[1].n128_u64[0];
  *a1 = result;
  return result;
}

void type metadata accessor for MSVSQLDatabase.StatementInterpolation()
{
  OUTLINED_FUNCTION_35_0();
}

uint64_t _s22StatementInterpolationV19StringInterpolationVwxx_0()
{
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

void _s22StatementInterpolationV19StringInterpolationVwCP_0(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  a1[2] = a2[2];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  OUTLINED_FUNCTION_7();
}

void _s22StatementInterpolationV19StringInterpolationVwca_0(_QWORD *a1, _QWORD *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_36_0(a1, a2);
  *(_QWORD *)(v3 + 8) = *(_QWORD *)(v4 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(v3 + 16) = *(_QWORD *)(v2 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_8();
}

void _s22StatementInterpolationV19StringInterpolationVwta_0(_QWORD *a1, _QWORD *a2)
{
  uint64_t v2;
  uint64_t v3;

  OUTLINED_FUNCTION_36_0(a1, a2);
  swift_bridgeObjectRelease();
  *(_OWORD *)(v3 + 8) = *(_OWORD *)(v2 + 8);
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_7();
}

uint64_t _s22StatementInterpolationV19StringInterpolationVwet_0(uint64_t a1, int a2)
{
  unint64_t v2;

  if (a2)
  {
    if (a2 < 0 && *(_BYTE *)(a1 + 24))
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

uint64_t sub_1D7156C40(uint64_t result, int a2, int a3)
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
      *(_QWORD *)(result + 8) = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 24) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

void type metadata accessor for MSVSQLDatabase.StatementInterpolation.StringInterpolation()
{
  OUTLINED_FUNCTION_35_0();
}

uint64_t OUTLINED_FUNCTION_1_2()
{
  return MSVNanoIDCreateTaggedPointer();
}

_QWORD *OUTLINED_FUNCTION_2_2()
{
  uint64_t v0;

  return sub_1D7156474(*(_QWORD **)(*(_QWORD *)(v0 + 16) + 16));
}

void OUTLINED_FUNCTION_3_2()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)(v0 + 16) + 16) = v1 + 1;
}

void OUTLINED_FUNCTION_4_2(id a1)
{

}

uint64_t OUTLINED_FUNCTION_5_2()
{
  return _sSo14MSVSQLDatabaseC15MediaFoundationE22StatementInterpolationV06StringE0V13appendLiteralyySSF_0();
}

uint64_t OUTLINED_FUNCTION_7_2()
{
  return _sSo14MSVSQLDatabaseC15MediaFoundationE22StatementInterpolationV06StringE0V13appendLiteralyySSF_0();
}

void OUTLINED_FUNCTION_9_2(char a1@<W8>, uint64_t a2, char a3, uint64_t a4, char a5)
{
  a5 = a1;
  MSVSQLStatement.bindNull(to:)((uint64_t)&a3);
}

void OUTLINED_FUNCTION_10_2(id a1)
{

}

uint64_t OUTLINED_FUNCTION_11_2()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_12_1()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_13_2()
{
  return sub_1D7160F20();
}

uint64_t OUTLINED_FUNCTION_14_2()
{
  return _sSo14MSVSQLDatabaseC15MediaFoundationE22StatementInterpolationV06StringE0V13appendLiteralyySSF_0();
}

id OUTLINED_FUNCTION_15_2(id a1, SEL a2)
{
  return objc_msgSend(a1, a2);
}

uint64_t OUTLINED_FUNCTION_16_2()
{
  return sub_1D7161160();
}

void OUTLINED_FUNCTION_17_1()
{
  void *v0;

}

uint64_t OUTLINED_FUNCTION_19_1()
{
  return swift_deallocObject();
}

_QWORD *OUTLINED_FUNCTION_20_1()
{
  return sub_1D715642C();
}

uint64_t OUTLINED_FUNCTION_23_1()
{
  return swift_allocObject();
}

uint64_t OUTLINED_FUNCTION_25_1()
{
  uint64_t v0;
  uint64_t v1;

  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v1 - 8) + 8))(v0, v1);
}

uint64_t OUTLINED_FUNCTION_26_1()
{
  return swift_bridgeObjectRelease();
}

void OUTLINED_FUNCTION_27_1()
{
  sub_1D71554DC();
}

uint64_t OUTLINED_FUNCTION_28(uint64_t a1, uint64_t a2, uint64_t (*a3)(_QWORD))
{
  return a3(0);
}

uint64_t OUTLINED_FUNCTION_29_0()
{
  return sub_1D7160FC8();
}

uint64_t OUTLINED_FUNCTION_30_0()
{
  uint64_t v0;

  *(_QWORD *)(v0 - 96) = 64;
  *(_QWORD *)(v0 - 88) = 0xE100000000000000;
  return MSVNanoIDCreateTaggedPointer();
}

uint64_t OUTLINED_FUNCTION_31_0@<X0>(uint64_t (*a1)(uint64_t, uint64_t, uint64_t)@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  return a1(v1, v3, v2);
}

uint64_t OUTLINED_FUNCTION_32_0()
{
  uint64_t v0;
  uint64_t v1;

  return __swift_getEnumTagSinglePayload(v0, 1, v1);
}

void OUTLINED_FUNCTION_33_0()
{
  void *v0;

}

_QWORD *OUTLINED_FUNCTION_36_0(_QWORD *result, _QWORD *a2)
{
  *result = *a2;
  return result;
}

uint64_t OUTLINED_FUNCTION_37()
{
  return _sSo14MSVSQLDatabaseC15MediaFoundationE22StatementInterpolationV06StringE0V13appendLiteralyySSF_0();
}

uint64_t OUTLINED_FUNCTION_38@<X0>(uint64_t (*a1)(uint64_t, uint64_t)@<X8>)
{
  uint64_t v1;
  uint64_t v2;

  return a1(v1, v2);
}

uint64_t OUTLINED_FUNCTION_40@<X0>(uint64_t (*a1)(uint64_t, uint64_t)@<X8>)
{
  uint64_t v1;
  uint64_t v2;

  return a1(v1, v2);
}

id OUTLINED_FUNCTION_41(uint64_t a1, const char *a2)
{
  uint64_t v2;
  void *v3;

  return objc_msgSend(v3, a2, v2);
}

uint64_t sub_1D7156F2C@<X0>(uint64_t result@<X0>, uint64_t a2@<X8>)
{
  *(_QWORD *)(a2 + 24) = &type metadata for RepeatMode;
  *(_QWORD *)(a2 + 32) = &protocol witness table for RepeatMode;
  *(_BYTE *)a2 = result;
  return result;
}

uint64_t sub_1D7156F48@<X0>(uint64_t result@<X0>, uint64_t a2@<X8>)
{
  *(_QWORD *)(a2 + 24) = &type metadata for ShuffleMode;
  *(_QWORD *)(a2 + 32) = &protocol witness table for ShuffleMode;
  *(_BYTE *)a2 = result;
  return result;
}

void sub_1D7156F64(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v4;

  type metadata accessor for MRContentItemMediaType(0);
  a2[3] = v4;
  a2[4] = &protocol witness table for MRContentItemMediaType;
  *a2 = a1;
}

void sub_1D7156F9C(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v4;

  type metadata accessor for MRContentItemMediaSubType(0);
  a2[3] = v4;
  a2[4] = &protocol witness table for MRContentItemMediaSubType;
  *a2 = a1;
}

void sub_1D7156FD4(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v4;

  type metadata accessor for MRContentItemEpisodeType(0);
  a2[3] = v4;
  a2[4] = &protocol witness table for MRContentItemEpisodeType;
  *a2 = a1;
}

void sub_1D715700C(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v4;

  type metadata accessor for MRContentItemPlaylistType(0);
  a2[3] = v4;
  a2[4] = &protocol witness table for MRContentItemPlaylistType;
  *a2 = a1;
}

void sub_1D7157044(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v4;

  type metadata accessor for MRContentItemRadioStationType(0);
  a2[3] = v4;
  a2[4] = &protocol witness table for MRContentItemRadioStationType;
  *a2 = a1;
}

uint64_t sub_1D715707C@<X0>(uint64_t result@<X0>, uint64_t a2@<X8>)
{
  *(_QWORD *)(a2 + 24) = &type metadata for SystemAppPlaybackQueueInsertionPosition;
  *(_QWORD *)(a2 + 32) = &protocol witness table for SystemAppPlaybackQueueInsertionPosition;
  *(_BYTE *)a2 = result;
  return result;
}

void sub_1D7157098(int a1@<W0>, uint64_t a2@<X8>)
{
  uint64_t v4;

  type metadata accessor for MRMediaRemoteCommandHandlerStatus(0);
  *(_QWORD *)(a2 + 24) = v4;
  *(_QWORD *)(a2 + 32) = &protocol witness table for MRMediaRemoteCommandHandlerStatus;
  *(_DWORD *)a2 = a1;
}

void sub_1D71570D0(int a1@<W0>, uint64_t a2@<X8>)
{
  uint64_t v4;

  type metadata accessor for MRQueueEndAction(0);
  *(_QWORD *)(a2 + 24) = v4;
  *(_QWORD *)(a2 + 32) = &protocol witness table for MRQueueEndAction;
  *(_DWORD *)a2 = a1;
}

void sub_1D7157108(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v4;

  type metadata accessor for MRContentItemMetadataAudioRouteType(0);
  a2[3] = v4;
  a2[4] = &protocol witness table for MRContentItemMetadataAudioRouteType;
  *a2 = a1;
}

void sub_1D7157140(int a1@<W0>, uint64_t a2@<X8>)
{
  uint64_t v4;

  type metadata accessor for MRDisabledReason(0);
  *(_QWORD *)(a2 + 24) = v4;
  *(_QWORD *)(a2 + 32) = &protocol witness table for MRDisabledReason;
  *(_DWORD *)a2 = a1;
}

void sub_1D7157178(int a1@<W0>, uint64_t a2@<X8>)
{
  uint64_t v4;

  type metadata accessor for MRPlaybackState(0);
  *(_QWORD *)(a2 + 24) = v4;
  *(_QWORD *)(a2 + 32) = &protocol witness table for MRPlaybackState;
  *(_DWORD *)a2 = a1;
}

uint64_t NamedEnum._namedEnum.getter@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  uint64_t v3;
  uint64_t *boxed_opaque_existential_1;

  a3[3] = a1;
  a3[4] = a2;
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(a3);
  return (*(uint64_t (**)(uint64_t *, uint64_t, uint64_t))(*(_QWORD *)(a1 - 8) + 16))(boxed_opaque_existential_1, v3, a1);
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

id MRPlayerPath.init(_:)(void *a1)
{
  id v2;
  id v3;
  id v4;
  id v5;
  id v6;
  id v7;

  v2 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  v3 = a1;
  v4 = objc_msgSend(v3, sel_origin);
  v5 = objc_msgSend(v3, sel_client);
  v6 = objc_msgSend(v3, sel_player);
  v7 = objc_msgSend(v2, sel_initWithOrigin_client_player_, v4, v5, v6);

  return v7;
}

uint64_t static MRPlayerPath.Error.== infix(_:_:)()
{
  return 1;
}

void MRPlayerPath.Error.hash(into:)()
{
  OUTLINED_FUNCTION_65();
  OUTLINED_FUNCTION_7();
}

void MRPlayerPath.Error.hashValue.getter()
{
  OUTLINED_FUNCTION_16_3();
  OUTLINED_FUNCTION_35_1();
  OUTLINED_FUNCTION_26_2();
  OUTLINED_FUNCTION_9_3();
}

uint64_t sub_1D7157330()
{
  return 1;
}

void sub_1D7157338()
{
  MRPlayerPath.Error.hashValue.getter();
}

void sub_1D715734C()
{
  MRPlayerPath.Error.hash(into:)();
}

uint64_t MRPlayerPath.resolve()()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(v1 + 24) = v0;
  return OUTLINED_FUNCTION_24_1();
}

uint64_t sub_1D7157374()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;

  v1 = v0[3];
  v2 = swift_task_alloc();
  v0[4] = v2;
  *(_QWORD *)(v2 + 16) = v1;
  v3 = (_QWORD *)swift_task_alloc();
  v0[5] = v3;
  OUTLINED_FUNCTION_59((uint64_t)v3, &qword_1F00AF908);
  *v3 = v0;
  v3[1] = sub_1D7157428;
  OUTLINED_FUNCTION_2_0();
  return sub_1D716131C();
}

uint64_t sub_1D7157428()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 48) = v0;
  swift_task_dealloc();
  if (!v0)
    swift_task_dealloc();
  OUTLINED_FUNCTION_2_0();
  return OUTLINED_FUNCTION_20_2();
}

uint64_t sub_1D715748C()
{
  uint64_t v0;

  swift_task_dealloc();
  return OUTLINED_FUNCTION_13_1(*(uint64_t (**)(void))(v0 + 8));
}

void sub_1D71574B8(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  void *v11;
  unint64_t v12;
  uint64_t v13;
  void *v14;
  _QWORD aBlock[6];

  sub_1D716049C(0, (uint64_t)&unk_1F00AFA60);
  v3 = v2;
  v4 = *(_QWORD *)(v2 - 8);
  MEMORY[0x1E0C80A78](v2);
  v6 = (char *)aBlock - v5;
  v7 = sub_1D7160EA8();
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x1E0C80A78](v7);
  v10 = (char *)aBlock - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1D7160214(0, &qword_1ED56FB48);
  (*(void (**)(char *, _QWORD, uint64_t))(v8 + 104))(v10, *MEMORY[0x1E0DEF540], v7);
  v11 = (void *)sub_1D7161124();
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  (*(void (**)(char *, uint64_t, uint64_t))(v4 + 16))(v6, a1, v3);
  v12 = (*(unsigned __int8 *)(v4 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  v13 = swift_allocObject();
  (*(void (**)(unint64_t, char *, uint64_t))(v4 + 32))(v13 + v12, v6, v3);
  aBlock[4] = sub_1D7160554;
  aBlock[5] = v13;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_1D715777C;
  aBlock[3] = &block_descriptor_362;
  v14 = _Block_copy(aBlock);
  swift_release();
  MRMediaRemoteNowPlayingResolvePlayerPath();
  _Block_release(v14);

}

void sub_1D7157690(uint64_t a1)
{
  sub_1D71574B8(a1);
}

uint64_t sub_1D7157698(void *a1)
{
  if (a1)
  {
    sub_1D7160214(0, &qword_1F00AF908);
    MRPlayerPath.init(_:)(a1);
    sub_1D716049C(0, (uint64_t)&unk_1F00AFA60);
    return sub_1D7161058();
  }
  else
  {
    sub_1D71605B4();
    swift_allocError();
    sub_1D716049C(0, (uint64_t)&unk_1F00AFA60);
    return sub_1D716104C();
  }
}

void sub_1D715777C(uint64_t a1, uint64_t a2, void *a3)
{
  void (*v5)(uint64_t, void *);
  id v6;

  v5 = *(void (**)(uint64_t, void *))(a1 + 32);
  swift_retain();
  v6 = a3;
  v5(a2, a3);
  swift_release();

}

uint64_t static MROrigin.available.getter()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 24) = v1;
  sub_1D715E8EC(0, (uint64_t)&unk_1F00AF918);
  *v1 = v0;
  v1[1] = sub_1D715787C;
  OUTLINED_FUNCTION_2_0();
  return sub_1D71612F8();
}

uint64_t sub_1D715787C()
{
  swift_task_dealloc();
  OUTLINED_FUNCTION_2_0();
  return swift_task_switch();
}

void sub_1D71578CC(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  void *v10;
  unint64_t v11;
  uint64_t v12;
  void *v13;
  _QWORD aBlock[6];

  sub_1D71603C8();
  v3 = v2;
  v4 = *(_QWORD *)(v2 - 8);
  v5 = *(_QWORD *)(v4 + 64);
  MEMORY[0x1E0C80A78](v2);
  v6 = sub_1D7160EA8();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x1E0C80A78](v6);
  v9 = (char *)aBlock - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1D7160214(0, &qword_1ED56FB48);
  (*(void (**)(char *, _QWORD, uint64_t))(v7 + 104))(v9, *MEMORY[0x1E0DEF540], v6);
  v10 = (void *)sub_1D7161124();
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  (*(void (**)(char *, uint64_t, uint64_t))(v4 + 16))((char *)aBlock - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v3);
  v11 = (*(unsigned __int8 *)(v4 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  v12 = swift_allocObject();
  (*(void (**)(unint64_t, char *, uint64_t))(v4 + 32))(v12 + v11, (char *)aBlock - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0), v3);
  aBlock[4] = sub_1D7160474;
  aBlock[5] = v12;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_1D7157B04;
  aBlock[3] = &block_descriptor_356;
  v13 = _Block_copy(aBlock);
  swift_release();
  MRMediaRemoteGetAvailableOrigins();
  _Block_release(v13);

}

uint64_t sub_1D7157A84(uint64_t a1)
{
  if (a1)
  {
    sub_1D7160214(0, &qword_1F00AF920);
    sub_1D7160FE0();
  }
  sub_1D71603C8();
  return sub_1D7161058();
}

void MediaRemoteCommand.name.getter()
{
  char *v0;
  uint64_t v1;
  uint64_t (*v2)(_QWORD);
  id v3;

  v1 = *v0;
  v2 = (uint64_t (*)(_QWORD))dlsym((void *)0xFFFFFFFFFFFFFFFELL, "MPCRemoteCommandDescriptionCopy");
  v3 = (id)v2(dword_1D716367C[v1]);
  OUTLINED_FUNCTION_73();
  OUTLINED_FUNCTION_18_2();
  OUTLINED_FUNCTION_51();
  OUTLINED_FUNCTION_8();
}

uint64_t MediaRemoteCommand.rawValue.getter()
{
  char *v0;

  return qword_1D71637A0[*v0];
}

void sub_1D7157B70()
{
  OUTLINED_FUNCTION_65();
  OUTLINED_FUNCTION_7();
}

void sub_1D7157B88()
{
  OUTLINED_FUNCTION_16_3();
  OUTLINED_FUNCTION_35_1();
  OUTLINED_FUNCTION_26_2();
  OUTLINED_FUNCTION_9_3();
}

void sub_1D7157BB4()
{
  sub_1D7161370();
  OUTLINED_FUNCTION_35_1();
  OUTLINED_FUNCTION_26_2();
  OUTLINED_FUNCTION_9_3();
}

uint64_t MediaRemoteCommand.send(_:sendOptions:to:)(uint64_t a1, int a2, uint64_t a3)
{
  _BYTE *v3;
  uint64_t v4;

  *(_DWORD *)(v4 + 64) = a2;
  *(_QWORD *)(v4 + 24) = a1;
  *(_QWORD *)(v4 + 32) = a3;
  *(_BYTE *)(v4 + 68) = *v3;
  return OUTLINED_FUNCTION_24_1();
}

uint64_t sub_1D7157BF8()
{
  uint64_t v0;
  char v1;
  int v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;

  v1 = *(_BYTE *)(v0 + 68);
  v2 = *(_DWORD *)(v0 + 64);
  v4 = *(_QWORD *)(v0 + 24);
  v3 = *(_QWORD *)(v0 + 32);
  v5 = swift_task_alloc();
  *(_QWORD *)(v0 + 40) = v5;
  *(_BYTE *)(v5 + 16) = v1;
  *(_QWORD *)(v5 + 24) = v4;
  *(_QWORD *)(v5 + 32) = v3;
  *(_DWORD *)(v5 + 40) = v2;
  v6 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 48) = v6;
  OUTLINED_FUNCTION_59((uint64_t)v6, &qword_1F00AF930);
  *v6 = v0;
  v6[1] = sub_1D7157CC4;
  OUTLINED_FUNCTION_2_0();
  return sub_1D716131C();
}

uint64_t sub_1D7157CC4()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 56) = v0;
  swift_task_dealloc();
  if (!v0)
    swift_task_dealloc();
  OUTLINED_FUNCTION_2_0();
  return OUTLINED_FUNCTION_20_2();
}

uint64_t sub_1D7157D24()
{
  uint64_t v0;

  swift_task_dealloc();
  return OUTLINED_FUNCTION_13_1(*(uint64_t (**)(void))(v0 + 8));
}

void sub_1D7157D50(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  void *v15;
  void *v16;
  unint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  int v23;
  _QWORD aBlock[6];

  v23 = a5;
  v21 = a1;
  v22 = a4;
  sub_1D716049C(0, (uint64_t)&unk_1F00AFA38);
  v7 = v6;
  v8 = *(_QWORD *)(v6 - 8);
  MEMORY[0x1E0C80A78](v6);
  v10 = (char *)&v20 - v9;
  v11 = sub_1D7160EA8();
  v12 = *(_QWORD *)(v11 - 8);
  MEMORY[0x1E0C80A78](v11);
  v14 = (char *)&v20 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1D7157F98(a3);
  v15 = (void *)sub_1D7160ED8();
  swift_bridgeObjectRelease();
  sub_1D7160214(0, &qword_1ED56FB48);
  (*(void (**)(char *, _QWORD, uint64_t))(v12 + 104))(v14, *MEMORY[0x1E0DEF540], v11);
  v16 = (void *)sub_1D7161124();
  (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v11);
  (*(void (**)(char *, uint64_t, uint64_t))(v8 + 16))(v10, v21, v7);
  v17 = (*(unsigned __int8 *)(v8 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80);
  v18 = swift_allocObject();
  (*(void (**)(unint64_t, char *, uint64_t))(v8 + 32))(v18 + v17, v10, v7);
  aBlock[4] = sub_1D7160264;
  aBlock[5] = v18;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_1D7157B04;
  aBlock[3] = &block_descriptor_0;
  v19 = _Block_copy(aBlock);
  swift_release();
  MRMediaRemoteSendCommandToPlayerWithResult();
  _Block_release(v19);

}

void sub_1D7157F88(uint64_t a1)
{
  uint64_t v1;

  sub_1D7157D50(a1, *(unsigned __int8 *)(v1 + 16), *(_QWORD *)(v1 + 24), *(_QWORD *)(v1 + 32), *(_DWORD *)(v1 + 40));
}

uint64_t sub_1D7157F98(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t result;
  int64_t v8;
  unint64_t v9;
  unint64_t v10;
  int64_t v11;
  unint64_t v12;
  int64_t v13;
  int64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  unint64_t v20;
  unint64_t v21;
  char v22;
  unint64_t v23;
  BOOL v24;
  uint64_t v25;
  uint64_t v26;
  int64_t v27;
  uint64_t v28;
  __int128 v29;
  __int128 v30;
  uint64_t v31;
  __int128 v32;
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
    sub_1D71602F4(0, &qword_1F00AFA48, MEMORY[0x1E0DEC198], MEMORY[0x1E0DEC1A0], MEMORY[0x1E0DECD58]);
    v2 = sub_1D71612BC();
  }
  else
  {
    v2 = MEMORY[0x1E0DEE9E0];
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
  if (!v5)
    goto LABEL_9;
LABEL_8:
  v9 = __clz(__rbit64(v5));
  v5 &= v5 - 1;
  v10 = v9 | (v8 << 6);
  while (1)
  {
    v15 = (uint64_t *)(*(_QWORD *)(a1 + 48) + 16 * v10);
    v17 = *v15;
    v16 = v15[1];
    sub_1D7160344(*(_QWORD *)(a1 + 56) + 32 * v10, (uint64_t)v40);
    *(_QWORD *)&v39 = v17;
    *((_QWORD *)&v39 + 1) = v16;
    v37[2] = v39;
    v38[0] = v40[0];
    v38[1] = v40[1];
    swift_bridgeObjectRetain();
    swift_dynamicCast();
    sub_1D7153CE4(v38, v37);
    sub_1D7160380();
    swift_dynamicCast();
    v33 = v29;
    v34 = v30;
    v35 = v31;
    sub_1D7153CE4(&v32, v36);
    v29 = v33;
    v30 = v34;
    v31 = v35;
    sub_1D7153CE4(v36, v37);
    sub_1D7153CE4(v37, &v33);
    result = sub_1D71611C0();
    v18 = -1 << *(_BYTE *)(v2 + 32);
    v19 = result & ~v18;
    v20 = v19 >> 6;
    if (((-1 << v19) & ~*(_QWORD *)(v6 + 8 * (v19 >> 6))) == 0)
    {
      v22 = 0;
      v23 = (unint64_t)(63 - v18) >> 6;
      while (++v20 != v23 || (v22 & 1) == 0)
      {
        v24 = v20 == v23;
        if (v20 == v23)
          v20 = 0;
        v22 |= v24;
        v25 = *(_QWORD *)(v6 + 8 * v20);
        if (v25 != -1)
        {
          v21 = __clz(__rbit64(~v25)) + (v20 << 6);
          goto LABEL_34;
        }
      }
      __break(1u);
LABEL_38:
      __break(1u);
      goto LABEL_39;
    }
    v21 = __clz(__rbit64((-1 << v19) & ~*(_QWORD *)(v6 + 8 * (v19 >> 6)))) | v19 & 0x7FFFFFFFFFFFFFC0;
LABEL_34:
    *(_QWORD *)(v6 + ((v21 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v21;
    v26 = *(_QWORD *)(v2 + 48) + 40 * v21;
    *(_OWORD *)v26 = v29;
    *(_OWORD *)(v26 + 16) = v30;
    *(_QWORD *)(v26 + 32) = v31;
    result = (uint64_t)sub_1D7153CE4(&v33, (_OWORD *)(*(_QWORD *)(v2 + 56) + 32 * v21));
    ++*(_QWORD *)(v2 + 16);
    if (v5)
      goto LABEL_8;
LABEL_9:
    v11 = v8 + 1;
    if (__OFADD__(v8, 1))
      goto LABEL_38;
    if (v11 >= v27)
      goto LABEL_36;
    v12 = *(_QWORD *)(v28 + 8 * v11);
    v13 = v8 + 1;
    if (!v12)
    {
      v13 = v8 + 2;
      if (v8 + 2 >= v27)
        goto LABEL_36;
      v12 = *(_QWORD *)(v28 + 8 * v13);
      if (!v12)
      {
        v13 = v8 + 3;
        if (v8 + 3 >= v27)
          goto LABEL_36;
        v12 = *(_QWORD *)(v28 + 8 * v13);
        if (!v12)
        {
          v13 = v8 + 4;
          if (v8 + 4 >= v27)
            goto LABEL_36;
          v12 = *(_QWORD *)(v28 + 8 * v13);
          if (!v12)
            break;
        }
      }
    }
LABEL_24:
    v5 = (v12 - 1) & v12;
    v10 = __clz(__rbit64(v12)) + (v13 << 6);
    v8 = v13;
  }
  v14 = v8 + 5;
  if (v8 + 5 >= v27)
  {
LABEL_36:
    swift_release();
    sub_1D716020C();
    return v2;
  }
  v12 = *(_QWORD *)(v28 + 8 * v14);
  if (v12)
  {
    v13 = v8 + 5;
    goto LABEL_24;
  }
  while (1)
  {
    v13 = v14 + 1;
    if (__OFADD__(v14, 1))
      break;
    if (v13 >= v27)
      goto LABEL_36;
    v12 = *(_QWORD *)(v28 + 8 * v13);
    ++v14;
    if (v12)
      goto LABEL_24;
  }
LABEL_39:
  __break(1u);
  return result;
}

uint64_t sub_1D71583A0(void *a1)
{
  id v2;

  if (a1)
  {
    sub_1D716049C(0, (uint64_t)&unk_1F00AFA38);
    v2 = a1;
    return sub_1D7161058();
  }
  else
  {
    sub_1D71602B8();
    swift_allocError();
    sub_1D716049C(0, (uint64_t)&unk_1F00AFA38);
    return sub_1D716104C();
  }
}

void sub_1D715845C(uint64_t a1, void *a2)
{
  void (*v3)(void *);
  id v4;

  v3 = *(void (**)(void *))(a1 + 32);
  swift_retain();
  v4 = a2;
  v3(a2);
  swift_release();

}

MediaFoundation::MediaRemoteCommand_optional __swiftcall MediaRemoteCommand.init(rawValue:)(Swift::Int rawValue)
{
  char *v1;
  char v2;
  char v3;

  v2 = 0;
  v3 = 54;
  switch(rawValue)
  {
    case 0:
      goto LABEL_66;
    case 1:
      v2 = 1;
      goto LABEL_66;
    case 2:
      v2 = 2;
      goto LABEL_66;
    case 3:
      v2 = 3;
      goto LABEL_66;
    case 4:
      v2 = 4;
      goto LABEL_66;
    case 5:
      v2 = 5;
      goto LABEL_66;
    case 6:
      v2 = 6;
      goto LABEL_66;
    case 7:
      v2 = 7;
      goto LABEL_66;
    case 8:
      v2 = 8;
      goto LABEL_66;
    case 9:
      v2 = 9;
      goto LABEL_66;
    case 10:
      v2 = 10;
      goto LABEL_66;
    case 11:
      v2 = 11;
      goto LABEL_66;
    case 12:
    case 13:
    case 14:
    case 15:
    case 29:
    case 30:
    case 31:
    case 32:
    case 33:
    case 34:
    case 35:
    case 36:
    case 37:
    case 38:
    case 39:
    case 40:
    case 41:
    case 42:
    case 43:
    case 44:
    case 45:
    case 46:
    case 47:
    case 48:
    case 49:
    case 50:
    case 51:
    case 52:
    case 53:
    case 54:
    case 55:
    case 56:
    case 57:
    case 58:
    case 59:
    case 60:
    case 61:
    case 62:
    case 63:
    case 64:
    case 65:
    case 66:
    case 67:
    case 68:
    case 69:
    case 70:
    case 71:
    case 72:
    case 73:
    case 74:
    case 75:
    case 76:
    case 77:
    case 78:
    case 79:
    case 80:
    case 81:
    case 82:
    case 83:
    case 84:
    case 85:
    case 86:
    case 87:
    case 88:
    case 89:
    case 90:
    case 91:
    case 92:
    case 93:
    case 94:
    case 95:
    case 96:
    case 97:
    case 98:
    case 99:
    case 141:
      goto LABEL_8;
    case 16:
      v2 = 12;
      goto LABEL_66;
    case 17:
      v2 = 13;
      goto LABEL_66;
    case 18:
      v2 = 14;
      goto LABEL_66;
    case 19:
      v2 = 15;
      goto LABEL_66;
    case 20:
      v2 = 16;
      goto LABEL_66;
    case 21:
      v2 = 17;
      goto LABEL_66;
    case 22:
      v2 = 18;
      goto LABEL_66;
    case 23:
      v2 = 19;
      goto LABEL_66;
    case 24:
      v2 = 20;
      goto LABEL_66;
    case 25:
      v2 = 21;
      goto LABEL_66;
    case 26:
      v2 = 22;
      goto LABEL_66;
    case 27:
      v2 = 23;
      goto LABEL_66;
    case 28:
      v2 = 24;
      goto LABEL_66;
    case 100:
      v2 = 25;
      goto LABEL_66;
    case 101:
      v2 = 26;
      goto LABEL_66;
    case 102:
      v2 = 27;
      goto LABEL_66;
    case 103:
      v2 = 28;
      goto LABEL_66;
    case 104:
      v2 = 29;
      goto LABEL_66;
    case 105:
      v2 = 30;
      goto LABEL_66;
    case 106:
      v3 = 63;
      break;
    case 107:
      v3 = 64;
      break;
    case 108:
      v3 = 65;
      break;
    case 109:
      v2 = 31;
      goto LABEL_66;
    case 110:
      v2 = 32;
      goto LABEL_66;
    case 111:
      v2 = 33;
      goto LABEL_66;
    case 112:
      v2 = 34;
      goto LABEL_66;
    case 113:
      v2 = 35;
      goto LABEL_66;
    case 114:
      v2 = 36;
      goto LABEL_66;
    case 115:
      v2 = 37;
      goto LABEL_66;
    case 116:
      v2 = 38;
      goto LABEL_66;
    case 117:
      v2 = 39;
      goto LABEL_66;
    case 118:
      v2 = 40;
      goto LABEL_66;
    case 119:
      v2 = 41;
      goto LABEL_66;
    case 120:
      v2 = 42;
      goto LABEL_66;
    case 121:
      v2 = 43;
      goto LABEL_66;
    case 122:
      v2 = 44;
      goto LABEL_66;
    case 123:
      v2 = 45;
      goto LABEL_66;
    case 124:
      v2 = 46;
      goto LABEL_66;
    case 125:
      v2 = 47;
      goto LABEL_66;
    case 126:
      v2 = 48;
      goto LABEL_66;
    case 127:
      v3 = 66;
      break;
    case 128:
      v3 = 67;
      break;
    case 129:
      v2 = 49;
      goto LABEL_66;
    case 130:
      v2 = 50;
      goto LABEL_66;
    case 131:
      v2 = 51;
      goto LABEL_66;
    case 132:
      v2 = 52;
      goto LABEL_66;
    case 133:
      v2 = 53;
LABEL_66:
      v3 = v2;
      break;
    case 134:
      break;
    case 135:
      v3 = 55;
      break;
    case 136:
      v3 = 56;
      break;
    case 137:
      v3 = 57;
      break;
    case 138:
      v3 = 58;
      break;
    case 139:
      v3 = 59;
      break;
    case 140:
      v3 = 60;
      break;
    case 142:
      v3 = 61;
      break;
    case 143:
      v3 = 62;
      break;
    default:
      switch(rawValue)
      {
        case 25001:
          v3 = 68;
          break;
        case 25010:
          v3 = 69;
          break;
        case 25020:
          v3 = 70;
          break;
        case 99990:
          v3 = 71;
          break;
        default:
LABEL_8:
          v3 = 72;
          break;
      }
      break;
  }
  *v1 = v3;
  return (MediaFoundation::MediaRemoteCommand_optional)rawValue;
}

uint64_t sub_1D715874C()
{
  return sub_1D7158754();
}

uint64_t sub_1D7158754()
{
  sub_1D7161370();
  sub_1D716137C();
  return sub_1D7161388();
}

void sub_1D71587A4()
{
  OUTLINED_FUNCTION_16_3();
  OUTLINED_FUNCTION_60();
  OUTLINED_FUNCTION_26_2();
  OUTLINED_FUNCTION_9_3();
}

uint64_t sub_1D71587CC()
{
  return sub_1D71587F8();
}

uint64_t sub_1D71587D4()
{
  return sub_1D716137C();
}

uint64_t sub_1D71587F8()
{
  return sub_1D716137C();
}

uint64_t sub_1D7158828()
{
  return sub_1D7158830();
}

uint64_t sub_1D7158830()
{
  sub_1D7161370();
  sub_1D716137C();
  return sub_1D7161388();
}

void sub_1D715887C()
{
  sub_1D7161370();
  OUTLINED_FUNCTION_60();
  OUTLINED_FUNCTION_26_2();
  OUTLINED_FUNCTION_9_3();
}

MediaFoundation::MediaRemoteCommand_optional sub_1D71588A8(Swift::Int *a1)
{
  return MediaRemoteCommand.init(rawValue:)(*a1);
}

uint64_t sub_1D71588B0@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  result = MediaRemoteCommand.rawValue.getter();
  *a1 = result;
  return result;
}

BOOL sub_1D71588D4(char *a1, char *a2)
{
  return sub_1D71588F0(*a1, *a2);
}

BOOL sub_1D71588E0(char a1, char a2)
{
  return a1 == a2;
}

BOOL sub_1D71588F0(char a1, char a2)
{
  return qword_1D71637A0[a1] == qword_1D71637A0[a2];
}

void MRMediaRemoteCommandHandlerStatus.name.getter(uint64_t a1)
{
  sub_1D715B7EC(a1, MEMORY[0x1E0D4BE60]);
}

void sub_1D7158920()
{
  unsigned int *v0;

  MRMediaRemoteCommandHandlerStatus.name.getter(*v0);
}

void sub_1D7158928(uint64_t a1@<X8>)
{
  int *v1;

  sub_1D7157098(*v1, a1);
}

uint64_t RepeatMode.name.getter()
{
  uint64_t v0;
  uint64_t v1;

  v0 = OUTLINED_FUNCTION_47();
  return ((uint64_t (*)(uint64_t))((char *)j__OUTLINED_FUNCTION_46 + 4 * byte_1D7161C10[v1]))(v0);
}

uint64_t sub_1D715895C()
{
  return 6647375;
}

uint64_t sub_1D715896C()
{
  return 7105601;
}

MediaFoundation::RepeatMode_optional __swiftcall RepeatMode.init(rawValue:)(Swift::Int rawValue)
{
  char *v1;
  char v2;

  v2 = 4;
  if ((unint64_t)rawValue < 4)
    v2 = rawValue;
  *v1 = v2;
  return (MediaFoundation::RepeatMode_optional)rawValue;
}

uint64_t RepeatMode.rawValue.getter()
{
  unsigned __int8 *v0;

  return *v0;
}

BOOL sub_1D7158998(char *a1, char *a2)
{
  return sub_1D71588E0(*a1, *a2);
}

void sub_1D71589A4()
{
  sub_1D71587A4();
}

uint64_t sub_1D71589BC()
{
  return sub_1D71587D4();
}

void sub_1D71589C4()
{
  sub_1D715887C();
}

MediaFoundation::RepeatMode_optional sub_1D71589DC(Swift::Int *a1)
{
  return RepeatMode.init(rawValue:)(*a1);
}

uint64_t sub_1D71589E4@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  result = RepeatMode.rawValue.getter();
  *a1 = result;
  return result;
}

uint64_t sub_1D7158A0C@<X0>(uint64_t a1@<X8>)
{
  unsigned __int8 *v1;

  return sub_1D7156F2C(*v1, a1);
}

uint64_t ShuffleMode.name.getter()
{
  uint64_t v0;
  uint64_t v1;

  v0 = OUTLINED_FUNCTION_47();
  return ((uint64_t (*)(uint64_t))((char *)j__OUTLINED_FUNCTION_46_0 + 4 * byte_1D7161C14[v1]))(v0);
}

uint64_t sub_1D7158A40()
{
  return 0x736D75626C41;
}

uint64_t sub_1D7158A54()
{
  return 0x73676E6F53;
}

uint64_t sub_1D7158A6C@<X0>(uint64_t a1@<X8>)
{
  unsigned __int8 *v1;

  return sub_1D7156F48(*v1, a1);
}

uint64_t MRQueueEndAction.name.getter(int a1)
{
  uint64_t result;

  result = 0x7261656C43;
  switch(a1)
  {
    case 0:
      return result;
    case 1:
      result = OUTLINED_FUNCTION_44();
      break;
    case 2:
      result = 0x7465736552;
      break;
    case 3:
      result = 0x79616C706F747541;
      break;
    default:
      sub_1D71612E0();
      OUTLINED_FUNCTION_6_3();
      OUTLINED_FUNCTION_3();
      result = 0x206E776F6E6B6E55;
      break;
  }
  return result;
}

uint64_t sub_1D7158B38()
{
  int *v0;

  return MRQueueEndAction.name.getter(*v0);
}

void sub_1D7158B40(uint64_t a1@<X8>)
{
  int *v1;

  sub_1D71570D0(*v1, a1);
}

unint64_t MRCommandInfo._options.getter()
{
  void *v0;
  uint64_t v1;
  unint64_t v2;
  unint64_t result;
  uint64_t v4;
  uint64_t v5;
  _OWORD v6[2];
  unint64_t v7;

  sub_1D715D768(v0, (SEL *)&selRef_options);
  if (!v1 || (v2 = sub_1D7158C00(v1), OUTLINED_FUNCTION_16_1(), !v2))
  {
    v2 = sub_1D7160EF0();
    swift_bridgeObjectRelease();
  }
  v7 = v2;
  result = *MEMORY[0x1E0D4C798];
  if (*MEMORY[0x1E0D4C798])
  {
    v4 = sub_1D7160F20();
    sub_1D715D0D4(v4, v5, v6);
    OUTLINED_FUNCTION_3();
    sub_1D715D220((uint64_t)v6);
    return v7;
  }
  else
  {
    __break(1u);
  }
  return result;
}

unint64_t sub_1D7158C00(uint64_t a1)
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  _BYTE *v6;
  _BYTE *v7;
  uint64_t *v8;
  uint64_t *v9;
  unint64_t result;
  unint64_t i;
  int64_t v12;
  unint64_t v13;
  int64_t v14;
  int64_t v15;
  __int128 v16;
  unint64_t v17;
  char v18;
  uint64_t *v19;
  uint64_t *v20;
  _BYTE *v21;
  uint64_t v22;
  _BYTE *v23;
  _OWORD *v24;
  _OWORD *v25;
  uint64_t v26;
  BOOL v27;
  uint64_t v28;
  int64_t v29;
  uint64_t v30;
  uint64_t v31;
  int64_t v32;
  __int128 v33;
  _OWORD v34[2];
  uint64_t v35;
  __int128 v36;
  uint64_t v37;
  _OWORD v38[2];
  _BYTE __dst[72];
  _BYTE __src[72];
  _QWORD v41[6];

  if (*(_QWORD *)(a1 + 16))
  {
    sub_1D71602F4(0, &qword_1F00AFA20, MEMORY[0x1E0DEA968], MEMORY[0x1E0DEA978], MEMORY[0x1E0DECD58]);
    v2 = (_QWORD *)sub_1D71612BC();
  }
  else
  {
    v2 = (_QWORD *)MEMORY[0x1E0DEE9E0];
  }
  sub_1D715D09C(a1, v41);
  v3 = v41[0];
  v4 = v41[3];
  v29 = (unint64_t)(v41[2] + 64) >> 6;
  v30 = v41[1];
  v5 = v41[4];
  v6 = &__src[40];
  v7 = &__dst[40];
  v8 = &v35;
  v9 = &v37;
  result = swift_bridgeObjectRetain();
  if (!v5)
    goto LABEL_6;
LABEL_5:
  v31 = (v5 - 1) & v5;
  v32 = v4;
  for (i = __clz(__rbit64(v5)) | (v4 << 6); ; i = __clz(__rbit64(v13)) + (v14 << 6))
  {
    sub_1D7160134(*(_QWORD *)(v3 + 48) + 40 * i, (uint64_t)__src);
    sub_1D7160344(*(_QWORD *)(v3 + 56) + 32 * i, (uint64_t)v6);
    memcpy(__dst, __src, sizeof(__dst));
    sub_1D7160134((uint64_t)__dst, (uint64_t)v34);
    if (!swift_dynamicCast())
    {
      sub_1D7160170((uint64_t)__dst);
      swift_bridgeObjectRelease();
      sub_1D716020C();
      swift_release();
      return 0;
    }
    sub_1D7160344((uint64_t)v7, (uint64_t)v34);
    sub_1D7160170((uint64_t)__dst);
    sub_1D7153CE4(v34, v8);
    v36 = v33;
    sub_1D7153CE4(v8, v9);
    v16 = v36;
    sub_1D7153CE4(v9, v38);
    sub_1D7153CE4(v38, &v36);
    result = sub_1D715CE94(v16, *((uint64_t *)&v16 + 1));
    v17 = result;
    if ((v18 & 1) != 0)
    {
      v19 = v9;
      v20 = v8;
      v21 = v7;
      v22 = v3;
      v23 = v6;
      v24 = (_OWORD *)(v2[6] + 16 * result);
      swift_bridgeObjectRelease();
      *v24 = v16;
      v6 = v23;
      v3 = v22;
      v7 = v21;
      v8 = v20;
      v9 = v19;
      v25 = (_OWORD *)(v2[7] + 32 * v17);
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v25);
      result = (unint64_t)sub_1D7153CE4(&v36, v25);
      goto LABEL_28;
    }
    if (v2[2] >= v2[3])
      break;
    *(_QWORD *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    *(_OWORD *)(v2[6] + 16 * result) = v16;
    result = (unint64_t)sub_1D7153CE4(&v36, (_OWORD *)(v2[7] + 32 * result));
    v26 = v2[2];
    v27 = __OFADD__(v26, 1);
    v28 = v26 + 1;
    if (v27)
      goto LABEL_34;
    v2[2] = v28;
LABEL_28:
    v5 = v31;
    v4 = v32;
    if (v31)
      goto LABEL_5;
LABEL_6:
    v12 = v4 + 1;
    if (__OFADD__(v4, 1))
      goto LABEL_35;
    if (v12 >= v29)
      goto LABEL_31;
    v13 = *(_QWORD *)(v30 + 8 * v12);
    v14 = v4 + 1;
    if (!v13)
    {
      v14 = v4 + 2;
      if (v4 + 2 >= v29)
        goto LABEL_31;
      v13 = *(_QWORD *)(v30 + 8 * v14);
      if (!v13)
      {
        v14 = v4 + 3;
        if (v4 + 3 >= v29)
          goto LABEL_31;
        v13 = *(_QWORD *)(v30 + 8 * v14);
        if (!v13)
        {
          v14 = v4 + 4;
          if (v4 + 4 >= v29)
            goto LABEL_31;
          v13 = *(_QWORD *)(v30 + 8 * v14);
          if (!v13)
          {
            v14 = v4 + 5;
            if (v4 + 5 >= v29)
              goto LABEL_31;
            v13 = *(_QWORD *)(v30 + 8 * v14);
            if (!v13)
            {
              v15 = v4 + 6;
              while (v15 < v29)
              {
                v13 = *(_QWORD *)(v30 + 8 * v15++);
                if (v13)
                {
                  v14 = v15 - 1;
                  goto LABEL_21;
                }
              }
LABEL_31:
              sub_1D716020C();
              return (unint64_t)v2;
            }
          }
        }
      }
    }
LABEL_21:
    v31 = (v13 - 1) & v13;
    v32 = v14;
  }
  __break(1u);
LABEL_34:
  __break(1u);
LABEL_35:
  __break(1u);
  return result;
}

unint64_t MRCommandInfo.disabledReason.getter()
{
  void *v0;
  unsigned __int8 v1;
  uint64_t v2;
  unint64_t v3;
  unint64_t result;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unsigned int v8;
  __int128 v9;
  uint64_t v10;

  v1 = objc_msgSend(v0, sel_isEnabled);
  if ((v1 & 1) != 0)
    goto LABEL_9;
  sub_1D715D768(v0, (SEL *)&selRef_options);
  if (!v2)
    goto LABEL_9;
  v3 = sub_1D7158C00(v2);
  OUTLINED_FUNCTION_41_0();
  if (!v3)
    goto LABEL_9;
  result = *MEMORY[0x1E0D4C798];
  if (*MEMORY[0x1E0D4C798])
  {
    v5 = sub_1D7160F20();
    sub_1D71590AC(v5, v6, v3, &v9);
    OUTLINED_FUNCTION_41_0();
    OUTLINED_FUNCTION_16_1();
    if (v10)
    {
      if ((OUTLINED_FUNCTION_67() & 1) != 0)
      {
        v7 = v8;
LABEL_10:
        LOBYTE(v9) = v1;
        return v7 | ((unint64_t)v1 << 32);
      }
    }
    else
    {
      sub_1D715D220((uint64_t)&v9);
    }
LABEL_9:
    v7 = 0;
    goto LABEL_10;
  }
  __break(1u);
  return result;
}

double sub_1D71590AC@<D0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, _OWORD *a4@<X8>)
{
  unint64_t v6;
  char v7;
  double result;

  if (*(_QWORD *)(a3 + 16) && (v6 = sub_1D715CE94(a1, a2), (v7 & 1) != 0))
  {
    sub_1D7160344(*(_QWORD *)(a3 + 56) + 32 * v6, (uint64_t)a4);
  }
  else
  {
    result = 0.0;
    *a4 = 0u;
    a4[1] = 0u;
  }
  return result;
}

double sub_1D71590FC@<D0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _OWORD *a3@<X8>)
{
  unint64_t v5;
  char v6;
  double result;

  if (*(_QWORD *)(a2 + 16) && (v5 = sub_1D715CE64(a1), (v6 & 1) != 0))
  {
    sub_1D7160344(*(_QWORD *)(a2 + 56) + 32 * v5, (uint64_t)a3);
  }
  else
  {
    result = 0.0;
    *a3 = 0u;
    a3[1] = 0u;
  }
  return result;
}

uint64_t MRContentItemMetadataAudioRouteType.name.getter()
{
  uint64_t result;
  uint64_t v1;
  unsigned int v2;
  uint64_t v3;

  result = OUTLINED_FUNCTION_47();
  switch(v1)
  {
    case 0:
      return result;
    case 1:
      result = 0x5320656369766544;
      break;
    case 2:
      result = 0x74754F20656E694CLL;
      break;
    case 3:
    case 4:
      result = 0x6E6F687064616548;
      break;
    case 5:
      result = 0x72656B61657053;
      break;
    case 6:
      v2 = 541217621;
      goto LABEL_9;
    case 7:
      v2 = 544366915;
LABEL_9:
      result = v2 | 0x6964754100000000;
      break;
    case 8:
      result = 1229800520;
      break;
    case 9:
      result = 0x79616C50726941;
      break;
    default:
      OUTLINED_FUNCTION_4_3();
      OUTLINED_FUNCTION_25_2();
      OUTLINED_FUNCTION_6_3();
      OUTLINED_FUNCTION_3();
      result = v3;
      break;
  }
  return result;
}

uint64_t sub_1D7159278()
{
  return MRContentItemMetadataAudioRouteType.name.getter();
}

void sub_1D7159280(_QWORD *a1@<X8>)
{
  uint64_t *v1;

  sub_1D7157108(*v1, a1);
}

uint64_t MRContentItem._identifier.getter()
{
  void *v0;
  uint64_t result;
  uint64_t v2;

  result = sub_1D715D278(v0);
  if (!v2)
    return 0x5F4C4C554E5FLL;
  return result;
}

id MRContentItem._metadata.getter()
{
  void *v0;
  id result;

  result = objc_msgSend(v0, sel_metadata);
  if (!result)
    return objc_msgSend(objc_allocWithZone(MEMORY[0x1E0D4C530]), sel_init);
  return result;
}

uint64_t MRContentItem.playPerformance.getter()
{
  id v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  id v8[5];
  __int128 v9;
  __int128 v10;

  v0 = MRContentItem._metadata.getter();
  v1 = sub_1D715D2D8(v0);
  if (!v1)
  {
    v9 = 0u;
    v10 = 0u;
    goto LABEL_6;
  }
  v2 = v1;
  sub_1D71611D8();
  sub_1D71590FC((uint64_t)v8, v2, &v9);
  sub_1D715D34C((uint64_t)v8);
  v3 = OUTLINED_FUNCTION_3();
  if (!*((_QWORD *)&v10 + 1))
  {
LABEL_6:
    sub_1D715D220((uint64_t)&v9);
    return 0;
  }
  OUTLINED_FUNCTION_59(v3, &qword_1F00AF938);
  if ((OUTLINED_FUNCTION_67() & 1) != 0)
  {
    v4 = v8[0];
    objc_msgSend(v8[0], sel_doubleValue);
    v6 = v5;

    return v6;
  }
  return 0;
}

void MRContentItem.title.getter()
{
  id v0;
  uint64_t v1;
  id v2;

  v0 = MRContentItem._metadata.getter();
  sub_1D715D3EC(v0, (SEL *)&selRef_localizedTitle);
  if (!v1)
  {
    v2 = MRContentItem._metadata.getter();
    sub_1D715D3EC(v2, (SEL *)&selRef_title);
  }
}

uint64_t MRContentItem.subtitle.getter()
{
  id v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t inited;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  unint64_t v20;
  unint64_t v21;
  uint64_t v22;
  unint64_t v23;
  unint64_t v24;
  uint64_t v25;
  uint64_t v26;
  _QWORD *v28;
  unint64_t v29;
  uint64_t v30;
  unint64_t v31;

  v0 = MRContentItem._metadata.getter();
  sub_1D715D3EC(v0, (SEL *)&selRef_subtitle);
  if (v2)
    return v1;
  sub_1D715D380();
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_1D7163CA0;
  v5 = MRContentItem._metadata.getter();
  sub_1D715D3EC(v5, (SEL *)&selRef_trackArtistName);
  v7 = v6;
  v9 = v8;
  *(_QWORD *)(inited + 32) = v6;
  *(_QWORD *)(inited + 40) = v8;
  v10 = MRContentItem._metadata.getter();
  sub_1D715D3EC(v10, (SEL *)&selRef_albumName);
  v13 = v12;
  v14 = v11;
  *(_QWORD *)(inited + 48) = v12;
  *(_QWORD *)(inited + 56) = v11;
  if (v9)
  {
    v15 = swift_bridgeObjectRetain();
    v18 = OUTLINED_FUNCTION_52(v15, v16, v17, MEMORY[0x1E0DEE9D8]);
    v19 = *(_QWORD *)(v18 + 16);
    v20 = *(_QWORD *)(v18 + 24);
    v21 = v19 + 1;
    if (v19 >= v20 >> 1)
    {
      v31 = v19 + 1;
      v28 = (_QWORD *)v18;
      v29 = *(_QWORD *)(v18 + 16);
      v30 = sub_1D7151664(v20 > 1, v19 + 1, 1, v28);
      v19 = v29;
      v21 = v31;
      v18 = v30;
    }
    *(_QWORD *)(v18 + 16) = v21;
    v22 = v18 + 16 * v19;
    *(_QWORD *)(v22 + 32) = v7;
    *(_QWORD *)(v22 + 40) = v9;
    if (!v14)
      goto LABEL_14;
    goto LABEL_9;
  }
  v18 = MEMORY[0x1E0DEE9D8];
  if (v11)
  {
LABEL_9:
    OUTLINED_FUNCTION_11();
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      v18 = OUTLINED_FUNCTION_70(0, *(_QWORD *)(v18 + 16) + 1);
    v24 = *(_QWORD *)(v18 + 16);
    v23 = *(_QWORD *)(v18 + 24);
    if (v24 >= v23 >> 1)
      v18 = OUTLINED_FUNCTION_70(v23 > 1, v24 + 1);
    *(_QWORD *)(v18 + 16) = v24 + 1;
    v25 = v18 + 16 * v24;
    *(_QWORD *)(v25 + 32) = v13;
    *(_QWORD *)(v25 + 40) = v14;
  }
LABEL_14:
  v26 = OUTLINED_FUNCTION_50();
  if (*(_QWORD *)(v18 + 16))
  {
    OUTLINED_FUNCTION_2_3(v26, &qword_1F00AF7A0, MEMORY[0x1E0DEA968], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0DEAEC8]);
    sub_1D715D440();
    v3 = sub_1D7160EFC();
    OUTLINED_FUNCTION_41_0();
  }
  else
  {
    OUTLINED_FUNCTION_41_0();
    return 0x9380E29380E2;
  }
  return v3;
}

BOOL static MRContentItem.MetadataOutline.BoolType.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

void MRContentItem.MetadataOutline.BoolType.hash(into:)()
{
  sub_1D716137C();
  OUTLINED_FUNCTION_7();
}

void MRContentItem.MetadataOutline.BoolType.hashValue.getter()
{
  OUTLINED_FUNCTION_16_3();
  sub_1D716137C();
  OUTLINED_FUNCTION_26_2();
  OUTLINED_FUNCTION_9_3();
}

void MRContentItem.MetadataOutline.hasValue(in:)(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_57(a1, (uint64_t)&qword_1F00AF8C8);
  OUTLINED_FUNCTION_23_2();
  v3 = MEMORY[0x1E0C80A78](v2);
  OUTLINED_FUNCTION_57(v3, (uint64_t)&unk_1F00AF950);
  OUTLINED_FUNCTION_23_2();
  MEMORY[0x1E0C80A78](v4);
  __asm { BR              X10 }
}

uint64_t sub_1D7159774()
{
  void *v0;
  uint64_t v1;

  OUTLINED_FUNCTION_22_2();
  OUTLINED_FUNCTION_39_0();
  OUTLINED_FUNCTION_53();
  OUTLINED_FUNCTION_43_0();

  swift_release();
  return *(unsigned __int8 *)(v1 - 88);
}

double sub_1D7159A3C()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t KeyPath;
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
  _QWORD *v15;
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
  _QWORD *v32;
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
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  _QWORD *v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  _QWORD *v70;
  uint64_t v71;
  _QWORD *v72;
  uint64_t v73;
  _QWORD *v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  _QWORD *v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  _QWORD *v90;
  uint64_t v91;
  _QWORD *v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  _QWORD *v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  _QWORD *v102;
  uint64_t v103;
  _QWORD *v104;
  uint64_t v105;
  double result;

  sub_1D7152354(0, &qword_1F00AFA18, (uint64_t)&type metadata for MRContentItem.MetadataOutline, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0DED1E8]);
  v0 = swift_allocObject();
  *(_OWORD *)(v0 + 16) = xmmword_1D7163CB0;
  *(_OWORD *)(v0 + 32) = 0u;
  *(_OWORD *)(v0 + 48) = 0u;
  *(_QWORD *)(v0 + 64) = 0;
  *(_QWORD *)(v0 + 72) = 0xD000000000000000;
  v1 = (_QWORD *)swift_allocObject();
  v1[2] = 0x696669746E656449;
  v1[3] = 0xEB00000000737265;
  v2 = swift_allocObject();
  *(_OWORD *)(v2 + 16) = xmmword_1D7163CC0;
  KeyPath = swift_getKeyPath();
  *(_OWORD *)(v2 + 32) = xmmword_1D7163CD0;
  *(_QWORD *)(v2 + 48) = KeyPath;
  *(_OWORD *)(v2 + 56) = 0u;
  *(_QWORD *)(v2 + 72) = 0x1000000000000000;
  v4 = swift_getKeyPath();
  *(_OWORD *)(v2 + 80) = xmmword_1D7163CE0;
  *(_QWORD *)(v2 + 96) = v4;
  *(_OWORD *)(v2 + 104) = 0u;
  *(_QWORD *)(v2 + 120) = 0x1000000000000000;
  v5 = swift_getKeyPath();
  *(_OWORD *)(v2 + 128) = xmmword_1D7163CF0;
  *(_QWORD *)(v2 + 144) = v5;
  *(_OWORD *)(v2 + 152) = 0u;
  *(_QWORD *)(v2 + 168) = 0x1000000000000000;
  v6 = swift_getKeyPath();
  *(_OWORD *)(v2 + 176) = xmmword_1D7163D00;
  *(_QWORD *)(v2 + 192) = v6;
  *(_OWORD *)(v2 + 200) = 0u;
  *(_QWORD *)(v2 + 216) = 0x1000000000000000;
  v7 = swift_getKeyPath();
  v8 = swift_getKeyPath();
  *(_OWORD *)(v2 + 224) = xmmword_1D7163D10;
  *(_QWORD *)(v2 + 240) = v7;
  *(_QWORD *)(v2 + 248) = v8;
  *(_OWORD *)(v2 + 256) = xmmword_1D7163D20;
  v9 = swift_getKeyPath();
  v10 = swift_getKeyPath();
  *(_OWORD *)(v2 + 272) = xmmword_1D7163D30;
  *(_QWORD *)(v2 + 288) = v9;
  *(_QWORD *)(v2 + 296) = v10;
  *(_OWORD *)(v2 + 304) = xmmword_1D7163D20;
  v11 = swift_getKeyPath();
  *(_OWORD *)(v2 + 320) = xmmword_1D7163D40;
  *(_QWORD *)(v2 + 336) = v11;
  *(_OWORD *)(v2 + 344) = 0u;
  *(_QWORD *)(v2 + 360) = 0x1000000000000000;
  v12 = swift_getKeyPath();
  *(_OWORD *)(v2 + 368) = xmmword_1D7163D50;
  *(_QWORD *)(v2 + 384) = v12;
  *(_OWORD *)(v2 + 392) = 0u;
  *(_QWORD *)(v2 + 408) = 0x1000000000000000;
  v13 = swift_getKeyPath();
  v14 = swift_getKeyPath();
  *(_OWORD *)(v2 + 416) = xmmword_1D7163D60;
  *(_QWORD *)(v2 + 432) = v13;
  *(_QWORD *)(v2 + 440) = v14;
  *(_OWORD *)(v2 + 448) = xmmword_1D7163D20;
  v1[4] = v2;
  *(_QWORD *)(v0 + 80) = v1;
  *(_OWORD *)(v0 + 88) = 0u;
  *(_OWORD *)(v0 + 104) = 0u;
  *(_QWORD *)(v0 + 120) = 0;
  v15 = (_QWORD *)swift_allocObject();
  v15[2] = 0x6B63616279616C50;
  v15[3] = 0xE800000000000000;
  v16 = swift_allocObject();
  *(_OWORD *)(v16 + 16) = xmmword_1D7163D70;
  v17 = swift_getKeyPath();
  v18 = swift_getKeyPath();
  *(_OWORD *)(v16 + 32) = xmmword_1D7163D80;
  *(_QWORD *)(v16 + 48) = 2;
  *(_QWORD *)(v16 + 56) = v17;
  *(_QWORD *)(v16 + 64) = v18;
  *(_QWORD *)(v16 + 72) = 0xB000000000000000;
  v19 = swift_getKeyPath();
  v20 = swift_getKeyPath();
  *(_OWORD *)(v16 + 80) = xmmword_1D7163D90;
  *(_QWORD *)(v16 + 96) = 2;
  *(_QWORD *)(v16 + 104) = v19;
  *(_QWORD *)(v16 + 112) = v20;
  *(_QWORD *)(v16 + 120) = 0xB000000000000000;
  v21 = swift_getKeyPath();
  v22 = swift_getKeyPath();
  v23 = swift_getKeyPath();
  *(_OWORD *)(v16 + 128) = xmmword_1D7163DA0;
  *(_QWORD *)(v16 + 144) = v21;
  *(_QWORD *)(v16 + 152) = v22;
  *(_QWORD *)(v16 + 160) = v23;
  *(_QWORD *)(v16 + 168) = 0xA000000000000000;
  v24 = swift_getKeyPath();
  v25 = swift_getKeyPath();
  *(_OWORD *)(v16 + 176) = xmmword_1D7163DB0;
  *(_QWORD *)(v16 + 192) = v24;
  *(_QWORD *)(v16 + 200) = v25;
  *(_OWORD *)(v16 + 208) = xmmword_1D7163DC0;
  v26 = swift_getKeyPath();
  v27 = swift_getKeyPath();
  *(_OWORD *)(v16 + 224) = xmmword_1D7163DD0;
  *(_OWORD *)(v16 + 240) = xmmword_1D7163DE0;
  *(_QWORD *)(v16 + 256) = v26;
  *(_QWORD *)(v16 + 264) = v27 | 0x6000000000000000;
  v28 = swift_getKeyPath();
  v29 = swift_getKeyPath();
  *(_OWORD *)(v16 + 272) = xmmword_1D7163DF0;
  *(_OWORD *)(v16 + 288) = xmmword_1D7163DE0;
  *(_QWORD *)(v16 + 304) = v28;
  *(_QWORD *)(v16 + 312) = v29 | 0x6000000000000000;
  v30 = swift_getKeyPath();
  v31 = swift_getKeyPath();
  *(_OWORD *)(v16 + 320) = xmmword_1D7163E00;
  *(_QWORD *)(v16 + 336) = v30;
  *(_QWORD *)(v16 + 344) = v31;
  *(_OWORD *)(v16 + 352) = xmmword_1D7163DC0;
  v15[4] = v16;
  *(_QWORD *)(v0 + 128) = v15;
  *(_OWORD *)(v0 + 136) = 0u;
  *(_OWORD *)(v0 + 152) = 0u;
  *(_QWORD *)(v0 + 168) = 0;
  v32 = (_QWORD *)swift_allocObject();
  v32[2] = 0x617461646174654DLL;
  v32[3] = 0xE800000000000000;
  v33 = swift_allocObject();
  *(_OWORD *)(v33 + 16) = xmmword_1D7163E10;
  v34 = swift_getKeyPath();
  *(_OWORD *)(v33 + 32) = xmmword_1D7163E20;
  *(_QWORD *)(v33 + 48) = v34;
  *(_OWORD *)(v33 + 56) = 0u;
  *(_QWORD *)(v33 + 72) = 0x1000000000000000;
  v35 = swift_getKeyPath();
  *(_OWORD *)(v33 + 80) = xmmword_1D7163E30;
  *(_QWORD *)(v33 + 96) = v35;
  *(_OWORD *)(v33 + 104) = 0u;
  *(_QWORD *)(v33 + 120) = 0x1000000000000000;
  v36 = swift_getKeyPath();
  v37 = swift_getKeyPath();
  *(_OWORD *)(v33 + 128) = xmmword_1D7163E40;
  *(_QWORD *)(v33 + 144) = v36;
  *(_QWORD *)(v33 + 152) = v37;
  *(_OWORD *)(v33 + 160) = xmmword_1D7163E50;
  v38 = swift_getKeyPath();
  v39 = swift_getKeyPath();
  *(_OWORD *)(v33 + 176) = xmmword_1D7163E60;
  *(_QWORD *)(v33 + 192) = v38;
  *(_QWORD *)(v33 + 200) = v39;
  *(_OWORD *)(v33 + 208) = xmmword_1D7163E50;
  v40 = swift_getKeyPath();
  v41 = swift_getKeyPath();
  *(_OWORD *)(v33 + 224) = xmmword_1D7163E70;
  *(_QWORD *)(v33 + 240) = 2;
  *(_QWORD *)(v33 + 248) = v40;
  *(_QWORD *)(v33 + 256) = v41;
  *(_QWORD *)(v33 + 264) = 0xB000000000000000;
  v42 = swift_getKeyPath();
  v43 = swift_getKeyPath();
  *(_OWORD *)(v33 + 272) = xmmword_1D7163E80;
  *(_QWORD *)(v33 + 288) = 2;
  *(_QWORD *)(v33 + 296) = v42;
  *(_QWORD *)(v33 + 304) = v43;
  *(_QWORD *)(v33 + 312) = 0xB000000000000000;
  v44 = swift_getKeyPath();
  *(_OWORD *)(v33 + 320) = xmmword_1D7163E90;
  *(_QWORD *)(v33 + 336) = v44;
  *(_OWORD *)(v33 + 344) = 0u;
  *(_QWORD *)(v33 + 360) = 0x3000000000000000;
  v45 = swift_getKeyPath();
  *(_OWORD *)(v33 + 368) = xmmword_1D7163EA0;
  *(_QWORD *)(v33 + 384) = v45;
  *(_OWORD *)(v33 + 392) = 0u;
  *(_QWORD *)(v33 + 408) = 0x1000000000000000;
  v46 = swift_getKeyPath();
  *(_OWORD *)(v33 + 416) = xmmword_1D7163EB0;
  *(_QWORD *)(v33 + 432) = v46;
  *(_OWORD *)(v33 + 440) = 0u;
  *(_QWORD *)(v33 + 456) = 0x1000000000000000;
  v47 = swift_getKeyPath();
  *(_OWORD *)(v33 + 464) = xmmword_1D7163EC0;
  *(_QWORD *)(v33 + 480) = v47;
  *(_OWORD *)(v33 + 488) = 0u;
  *(_QWORD *)(v33 + 504) = 0x1000000000000000;
  v48 = swift_getKeyPath();
  *(_OWORD *)(v33 + 512) = xmmword_1D7163ED0;
  *(_QWORD *)(v33 + 528) = v48;
  *(_OWORD *)(v33 + 536) = 0u;
  *(_QWORD *)(v33 + 552) = 0x1000000000000000;
  v49 = swift_getKeyPath();
  *(_OWORD *)(v33 + 560) = xmmword_1D7163EE0;
  *(_QWORD *)(v33 + 576) = v49;
  *(_OWORD *)(v33 + 584) = 0u;
  *(_QWORD *)(v33 + 600) = 0x1000000000000000;
  v50 = swift_getKeyPath();
  v51 = swift_getKeyPath();
  *(_OWORD *)(v33 + 608) = xmmword_1D7163EF0;
  *(_QWORD *)(v33 + 624) = v50;
  *(_QWORD *)(v33 + 632) = v51;
  *(_OWORD *)(v33 + 640) = xmmword_1D7163F00;
  v52 = swift_getKeyPath();
  v53 = swift_getKeyPath();
  *(_OWORD *)(v33 + 656) = xmmword_1D7163F10;
  *(_QWORD *)(v33 + 672) = v52;
  *(_QWORD *)(v33 + 680) = v53;
  *(_OWORD *)(v33 + 688) = xmmword_1D7163F00;
  v54 = swift_getKeyPath();
  v55 = swift_getKeyPath();
  *(_OWORD *)(v33 + 704) = xmmword_1D7163F20;
  *(_QWORD *)(v33 + 720) = v54;
  *(_QWORD *)(v33 + 728) = v55;
  *(_OWORD *)(v33 + 736) = xmmword_1D7163F00;
  v56 = swift_getKeyPath();
  v57 = swift_getKeyPath();
  *(_OWORD *)(v33 + 752) = xmmword_1D7163F30;
  *(_QWORD *)(v33 + 768) = v56;
  *(_QWORD *)(v33 + 776) = v57;
  *(_OWORD *)(v33 + 784) = xmmword_1D7163F00;
  v58 = swift_getKeyPath();
  *(_OWORD *)(v33 + 800) = xmmword_1D7163F40;
  *(_QWORD *)(v33 + 816) = v58;
  *(_OWORD *)(v33 + 824) = 0u;
  *(_QWORD *)(v33 + 840) = 0x1000000000000000;
  v59 = swift_getKeyPath();
  v60 = swift_getKeyPath();
  *(_OWORD *)(v33 + 848) = xmmword_1D7163F50;
  *(_QWORD *)(v33 + 864) = v59;
  *(_QWORD *)(v33 + 872) = v60;
  *(_OWORD *)(v33 + 880) = xmmword_1D7163E50;
  v61 = swift_getKeyPath();
  *(_OWORD *)(v33 + 896) = xmmword_1D7163F60;
  *(_QWORD *)(v33 + 912) = v61;
  *(_QWORD *)(v33 + 920) = 0;
  *(_QWORD *)(v33 + 928) = 0;
  *(_QWORD *)(v33 + 936) = 0x1000000000000000;
  v62 = swift_getKeyPath();
  v63 = swift_getKeyPath();
  *(_OWORD *)(v33 + 944) = xmmword_1D7163F70;
  *(_QWORD *)(v33 + 960) = v62;
  *(_QWORD *)(v33 + 968) = v63;
  *(_OWORD *)(v33 + 976) = xmmword_1D7163F00;
  v64 = swift_getKeyPath();
  v65 = swift_getKeyPath();
  *(_OWORD *)(v33 + 992) = xmmword_1D7163F80;
  *(_QWORD *)(v33 + 1008) = v64;
  *(_QWORD *)(v33 + 1016) = v65;
  *(_OWORD *)(v33 + 1024) = xmmword_1D7163F00;
  v32[4] = v33;
  *(_QWORD *)(v0 + 176) = v32;
  *(_OWORD *)(v0 + 184) = 0u;
  *(_OWORD *)(v0 + 200) = 0u;
  *(_QWORD *)(v0 + 216) = 0;
  v66 = (_QWORD *)swift_allocObject();
  v66[2] = 0x7069636974726150;
  v66[3] = 0xEB00000000746E61;
  v67 = swift_allocObject();
  *(_OWORD *)(v67 + 16) = xmmword_1D7163CA0;
  v68 = swift_getKeyPath();
  *(_OWORD *)(v67 + 32) = xmmword_1D7163F90;
  *(_QWORD *)(v67 + 48) = v68;
  *(_QWORD *)(v67 + 56) = 0;
  *(_QWORD *)(v67 + 64) = 0;
  *(_QWORD *)(v67 + 72) = 0x1000000000000000;
  v69 = swift_getKeyPath();
  *(_OWORD *)(v67 + 80) = xmmword_1D7163FA0;
  *(_QWORD *)(v67 + 96) = v69;
  *(_QWORD *)(v67 + 104) = 0;
  *(_QWORD *)(v67 + 112) = 0;
  *(_QWORD *)(v67 + 120) = 0x1000000000000000;
  v66[4] = v67;
  *(_QWORD *)(v0 + 224) = v66;
  *(_OWORD *)(v0 + 232) = 0u;
  *(_OWORD *)(v0 + 248) = 0u;
  *(_QWORD *)(v0 + 264) = 0;
  v70 = (_QWORD *)swift_allocObject();
  v70[2] = 1868983881;
  v70[3] = 0xE400000000000000;
  v71 = swift_allocObject();
  *(_OWORD *)(v71 + 16) = xmmword_1D7161760;
  *(_QWORD *)(v71 + 32) = swift_getKeyPath();
  *(_OWORD *)(v71 + 40) = 0u;
  *(_OWORD *)(v71 + 56) = 0u;
  *(_QWORD *)(v71 + 72) = 0x7000000000000000;
  v70[4] = v71;
  *(_QWORD *)(v0 + 272) = v70;
  *(_OWORD *)(v0 + 280) = 0u;
  *(_OWORD *)(v0 + 296) = 0u;
  *(_QWORD *)(v0 + 312) = 0;
  v72 = (_QWORD *)swift_allocObject();
  v72[2] = 0x656E6961746E6F43;
  v72[3] = 0xE900000000000072;
  v73 = swift_allocObject();
  *(_OWORD *)(v73 + 16) = xmmword_1D7163FB0;
  v74 = (_QWORD *)swift_allocObject();
  v74[2] = 0x696669746E656449;
  v74[3] = 0xEB00000000737265;
  v75 = swift_allocObject();
  *(_OWORD *)(v75 + 16) = xmmword_1D7163FB0;
  v76 = swift_getKeyPath();
  *(_OWORD *)(v75 + 32) = xmmword_1D7163FC0;
  *(_QWORD *)(v75 + 48) = v76;
  *(_QWORD *)(v75 + 56) = 0;
  *(_QWORD *)(v75 + 64) = 0;
  *(_QWORD *)(v75 + 72) = 0x1000000000000000;
  v77 = swift_getKeyPath();
  *(_OWORD *)(v75 + 80) = xmmword_1D7163FD0;
  *(_QWORD *)(v75 + 96) = v77;
  *(_QWORD *)(v75 + 104) = 0;
  *(_QWORD *)(v75 + 112) = 0;
  *(_QWORD *)(v75 + 120) = 0x1000000000000000;
  v78 = swift_getKeyPath();
  v79 = swift_getKeyPath();
  *(_OWORD *)(v75 + 128) = xmmword_1D7163FD0;
  *(_QWORD *)(v75 + 144) = v78;
  *(_QWORD *)(v75 + 152) = v79;
  *(_OWORD *)(v75 + 160) = xmmword_1D7163D20;
  v74[4] = v75;
  *(_QWORD *)(v73 + 32) = v74;
  *(_OWORD *)(v73 + 40) = 0u;
  *(_OWORD *)(v73 + 56) = 0u;
  *(_QWORD *)(v73 + 72) = 0;
  v80 = (_QWORD *)swift_allocObject();
  v80[2] = 0x617461646174654DLL;
  v80[3] = 0xE800000000000000;
  v81 = swift_allocObject();
  *(_OWORD *)(v81 + 16) = xmmword_1D7163FE0;
  v82 = swift_getKeyPath();
  *(_OWORD *)(v81 + 32) = xmmword_1D7163FF0;
  *(_QWORD *)(v81 + 48) = v82;
  *(_QWORD *)(v81 + 56) = 0;
  *(_QWORD *)(v81 + 64) = 0;
  *(_QWORD *)(v81 + 72) = 0x1000000000000000;
  v83 = swift_getKeyPath();
  *(_OWORD *)(v81 + 80) = xmmword_1D7164000;
  *(_QWORD *)(v81 + 96) = v83;
  *(_QWORD *)(v81 + 104) = 0;
  *(_QWORD *)(v81 + 112) = 0;
  *(_QWORD *)(v81 + 120) = 0x1000000000000000;
  v84 = swift_getKeyPath();
  *(_OWORD *)(v81 + 128) = xmmword_1D7164010;
  *(_QWORD *)(v81 + 144) = v84;
  *(_QWORD *)(v81 + 152) = 0;
  *(_QWORD *)(v81 + 160) = 0;
  *(_QWORD *)(v81 + 168) = 0x1000000000000000;
  v85 = swift_getKeyPath();
  v86 = swift_getKeyPath();
  *(_OWORD *)(v81 + 176) = xmmword_1D7164020;
  *(_QWORD *)(v81 + 192) = v85;
  *(_QWORD *)(v81 + 200) = v86;
  *(_OWORD *)(v81 + 208) = xmmword_1D7163E50;
  v87 = swift_getKeyPath();
  v88 = swift_getKeyPath();
  *(_QWORD *)(v81 + 224) = 0xD000000000000012;
  *(_QWORD *)(v81 + 232) = 0x80000001D7164280;
  *(_QWORD *)(v81 + 240) = v87;
  *(_QWORD *)(v81 + 248) = v88;
  *(_OWORD *)(v81 + 256) = xmmword_1D7163E50;
  v89 = swift_getKeyPath();
  *(_OWORD *)(v81 + 272) = xmmword_1D7164030;
  *(_QWORD *)(v81 + 288) = v89;
  *(_QWORD *)(v81 + 296) = 0;
  *(_QWORD *)(v81 + 304) = 0;
  *(_QWORD *)(v81 + 312) = 0x1000000000000000;
  v80[4] = v81;
  *(_QWORD *)(v73 + 80) = v80;
  *(_OWORD *)(v73 + 88) = 0u;
  *(_OWORD *)(v73 + 104) = 0u;
  *(_QWORD *)(v73 + 120) = 0;
  v90 = (_QWORD *)swift_allocObject();
  v90[2] = 1868983881;
  v90[3] = 0xE400000000000000;
  v91 = swift_allocObject();
  *(_OWORD *)(v91 + 16) = xmmword_1D7161760;
  *(_QWORD *)(v91 + 32) = swift_getKeyPath();
  *(_OWORD *)(v91 + 40) = 0u;
  *(_OWORD *)(v91 + 56) = 0u;
  *(_QWORD *)(v91 + 72) = 0xC000000000000000;
  v90[4] = v91;
  *(_QWORD *)(v73 + 128) = v90;
  *(_OWORD *)(v73 + 136) = 0u;
  *(_OWORD *)(v73 + 152) = 0u;
  *(_QWORD *)(v73 + 168) = 0;
  v72[4] = v73;
  *(_QWORD *)(v0 + 320) = v72;
  *(_OWORD *)(v0 + 328) = 0u;
  *(_OWORD *)(v0 + 344) = 0u;
  *(_QWORD *)(v0 + 360) = 0;
  v92 = (_QWORD *)swift_allocObject();
  v92[2] = 0x737465737341;
  v92[3] = 0xE600000000000000;
  v93 = swift_allocObject();
  *(_OWORD *)(v93 + 16) = xmmword_1D7163CA0;
  v94 = swift_getKeyPath();
  *(_OWORD *)(v93 + 32) = xmmword_1D7164040;
  *(_QWORD *)(v93 + 48) = v94;
  *(_QWORD *)(v93 + 56) = 0;
  *(_QWORD *)(v93 + 64) = 0;
  *(_QWORD *)(v93 + 72) = 0x2000000000000000;
  v95 = swift_getKeyPath();
  *(_OWORD *)(v93 + 80) = xmmword_1D7164050;
  *(_QWORD *)(v93 + 96) = v95;
  *(_QWORD *)(v93 + 104) = 0;
  *(_QWORD *)(v93 + 112) = 0;
  *(_QWORD *)(v93 + 120) = 0x2000000000000000;
  v92[4] = v93;
  *(_QWORD *)(v0 + 368) = v92;
  *(_OWORD *)(v0 + 376) = 0u;
  *(_OWORD *)(v0 + 392) = 0u;
  *(_QWORD *)(v0 + 408) = 0;
  v96 = (_QWORD *)swift_allocObject();
  v96[2] = 0x6B726F77747241;
  v96[3] = 0xE700000000000000;
  v97 = swift_allocObject();
  *(_OWORD *)(v97 + 16) = xmmword_1D7164060;
  v98 = swift_getKeyPath();
  *(_OWORD *)(v97 + 32) = xmmword_1D7163F90;
  *(_QWORD *)(v97 + 48) = v98;
  *(_QWORD *)(v97 + 56) = 0;
  *(_QWORD *)(v97 + 64) = 0;
  *(_QWORD *)(v97 + 72) = 0x1000000000000000;
  v99 = swift_getKeyPath();
  *(_OWORD *)(v97 + 80) = xmmword_1D7164070;
  *(_QWORD *)(v97 + 96) = v99;
  *(_QWORD *)(v97 + 104) = 0;
  *(_QWORD *)(v97 + 112) = 0;
  *(_QWORD *)(v97 + 120) = 0x2000000000000000;
  v100 = swift_getKeyPath();
  *(_OWORD *)(v97 + 128) = xmmword_1D7164080;
  *(_QWORD *)(v97 + 144) = v100;
  *(_QWORD *)(v97 + 152) = 0;
  *(_QWORD *)(v97 + 160) = 0;
  *(_QWORD *)(v97 + 168) = 0x2000000000000000;
  v101 = swift_getKeyPath();
  *(_OWORD *)(v97 + 176) = xmmword_1D7164090;
  *(_QWORD *)(v97 + 192) = v101;
  *(_QWORD *)(v97 + 200) = 0;
  *(_QWORD *)(v97 + 208) = 0;
  *(_OWORD *)(v97 + 216) = xmmword_1D71640A0;
  *(_OWORD *)(v97 + 232) = 0u;
  *(_OWORD *)(v97 + 248) = 0u;
  *(_QWORD *)(v97 + 264) = 0xD000000000000000;
  v96[4] = v97;
  *(_QWORD *)(v0 + 416) = v96;
  *(_OWORD *)(v0 + 424) = 0u;
  *(_OWORD *)(v0 + 440) = 0u;
  *(_QWORD *)(v0 + 456) = 0;
  v102 = (_QWORD *)swift_allocObject();
  v102[2] = 0x666E492072657355;
  v102[3] = 0xE90000000000006FLL;
  v103 = swift_allocObject();
  *(_OWORD *)(v103 + 16) = xmmword_1D7161760;
  *(_QWORD *)(v103 + 32) = swift_getKeyPath();
  *(_OWORD *)(v103 + 40) = 0u;
  *(_OWORD *)(v103 + 56) = 0u;
  *(_QWORD *)(v103 + 72) = 0xC000000000000000;
  v102[4] = v103;
  *(_QWORD *)(v0 + 464) = v102;
  *(_OWORD *)(v0 + 472) = 0u;
  *(_OWORD *)(v0 + 488) = 0u;
  *(_QWORD *)(v0 + 504) = 0;
  v104 = (_QWORD *)swift_allocObject();
  v104[2] = 0xD000000000000010;
  v104[3] = 0x80000001D71642A0;
  v105 = swift_allocObject();
  *(_OWORD *)(v105 + 16) = xmmword_1D7161760;
  *(_QWORD *)(v105 + 32) = swift_getKeyPath();
  result = 0.0;
  *(_OWORD *)(v105 + 40) = 0u;
  *(_OWORD *)(v105 + 56) = 0u;
  *(_QWORD *)(v105 + 72) = 0xC000000000000000;
  v104[4] = v105;
  *(_QWORD *)(v0 + 512) = v104;
  *(_OWORD *)(v0 + 520) = 0u;
  *(_OWORD *)(v0 + 536) = 0u;
  *(_QWORD *)(v0 + 552) = 0;
  qword_1F00AF8F8 = v0;
  return result;
}

id sub_1D715AA54@<X0>(_QWORD *a1@<X8>)
{
  id result;

  result = MRContentItem._metadata.getter();
  *a1 = result;
  return result;
}

void sub_1D715AA7C(uint64_t a1, void **a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t (*a6)(_QWORD), uint64_t (*a7)(void), SEL *a8)
{
  uint64_t v14;
  uint64_t v15;
  char *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;

  sub_1D715D498(0, a5);
  OUTLINED_FUNCTION_23_2();
  MEMORY[0x1E0C80A78](v14);
  v16 = (char *)&v20 - v15;
  sub_1D71600EC(a1, (uint64_t)&v20 - v15, a5);
  v17 = *a2;
  v18 = a6(0);
  v19 = 0;
  if (__swift_getEnumTagSinglePayload((uint64_t)v16, 1, v18) != 1)
  {
    v19 = (void *)a7();
    (*(void (**)(char *, uint64_t))(*(_QWORD *)(v18 - 8) + 8))(v16, v18);
  }
  objc_msgSend(v17, *a8, v19);

}

uint64_t sub_1D715AB64(id *a1, uint64_t a2, uint64_t a3, SEL *a4, void (*a5)(void), uint64_t (*a6)(_QWORD))
{
  uint64_t v6;
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;

  v9 = OUTLINED_FUNCTION_14_3(a1, a2, a3, a4);
  if (v9)
  {
    v10 = v9;
    a5();

    v11 = 0;
  }
  else
  {
    v11 = 1;
  }
  v12 = a6(0);
  return __swift_storeEnumTagSinglePayload(v6, v11, 1, v12);
}

void sub_1D715ABD0(id *a1, uint64_t a2, uint64_t a3, SEL *a4)
{
  uint64_t *v4;
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v5 = OUTLINED_FUNCTION_14_3(a1, a2, a3, a4);
  if (v5)
  {
    v6 = v5;
    v7 = sub_1D7160F20();
    v9 = v8;

  }
  else
  {
    v7 = 0;
    v9 = 0;
  }
  *v4 = v7;
  v4[1] = v9;
  OUTLINED_FUNCTION_8();
}

void sub_1D715AC1C(uint64_t a1, uint64_t a2, uint64_t a3, int a4, int a5, int a6, int a7, int a8)
{
  uint64_t v8;
  int v9;
  uint64_t v10;
  uint64_t v11;
  id v12;

  v8 = *(_QWORD *)(a1 + 8);
  if (v8)
  {
    LODWORD(a1) = sub_1D7160F14();
    v9 = a1;
  }
  else
  {
    v9 = 0;
  }
  OUTLINED_FUNCTION_45(a1, v8, v9, a4, a5, a6, a7, a8, v10, v11);
  OUTLINED_FUNCTION_29_1(v12);
}

void sub_1D715AC64(id *a1, uint64_t a2, uint64_t a3, SEL *a4)
{
  uint64_t *v4;
  id v5;
  void *v6;
  uint64_t v7;

  v5 = OUTLINED_FUNCTION_14_3(a1, a2, a3, a4);
  if (v5)
  {
    v6 = v5;
    v7 = sub_1D7160EE4();

  }
  else
  {
    v7 = 0;
  }
  *v4 = v7;
  OUTLINED_FUNCTION_8();
}

void sub_1D715ACC4(uint64_t *a1, int a2, uint64_t a3, int a4, int a5, int a6, int a7, int a8)
{
  uint64_t v8;
  int v9;
  uint64_t v10;
  uint64_t v11;
  id v12;

  v8 = *a1;
  if (v8)
  {
    LODWORD(v8) = sub_1D7160ED8();
    v9 = v8;
  }
  else
  {
    v9 = 0;
  }
  OUTLINED_FUNCTION_45(v8, a2, v9, a4, a5, a6, a7, a8, v10, v11);
  OUTLINED_FUNCTION_29_1(v12);
}

uint64_t static MRContentItem.metadataOutline.getter()
{
  if (qword_1F00AF780 != -1)
    swift_once();
  return swift_bridgeObjectRetain();
}

uint64_t MRContentItemMetadata.identifiers.getter()
{
  uint64_t inited;
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
  unint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  uint64_t v18;

  sub_1D715D380();
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_1D7163CA0;
  MRContentItemMetadata.subscriptionAdamID.getter();
  if (!v2)
    MRContentItemMetadata.adamID.getter();
  *(_QWORD *)(inited + 32) = v1;
  *(_QWORD *)(inited + 40) = v2;
  v3 = MRContentItemMetadata.univeralLibraryID.getter();
  *(_QWORD *)(inited + 48) = v3;
  *(_QWORD *)(inited + 56) = v4;
  v5 = *(_QWORD *)(inited + 40);
  if (!v5)
  {
    v15 = v3;
    v14 = v4;
    v10 = MEMORY[0x1E0DEE9D8];
    if (!v4)
      goto LABEL_14;
    goto LABEL_9;
  }
  v6 = *(_QWORD *)(inited + 32);
  v7 = swift_bridgeObjectRetain();
  v10 = OUTLINED_FUNCTION_52(v7, v8, v9, MEMORY[0x1E0DEE9D8]);
  v12 = *(_QWORD *)(v10 + 16);
  v11 = *(_QWORD *)(v10 + 24);
  if (v12 >= v11 >> 1)
    v10 = OUTLINED_FUNCTION_40_0(v11 > 1, v12 + 1);
  *(_QWORD *)(v10 + 16) = v12 + 1;
  v13 = v10 + 16 * v12;
  *(_QWORD *)(v13 + 32) = v6;
  *(_QWORD *)(v13 + 40) = v5;
  v15 = *(_QWORD *)(inited + 48);
  v14 = *(_QWORD *)(inited + 56);
  if (v14)
  {
LABEL_9:
    swift_bridgeObjectRetain();
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      v10 = OUTLINED_FUNCTION_40_0(0, *(_QWORD *)(v10 + 16) + 1);
    v17 = *(_QWORD *)(v10 + 16);
    v16 = *(_QWORD *)(v10 + 24);
    if (v17 >= v16 >> 1)
      v10 = OUTLINED_FUNCTION_40_0(v16 > 1, v17 + 1);
    *(_QWORD *)(v10 + 16) = v17 + 1;
    v18 = v10 + 16 * v17;
    *(_QWORD *)(v18 + 32) = v15;
    *(_QWORD *)(v18 + 40) = v14;
  }
LABEL_14:
  OUTLINED_FUNCTION_3();
  return v10;
}

void MRContentItemMetadata.subscriptionAdamID.getter()
{
  sub_1D715AEC0((SEL *)&selRef_iTunesStoreSubscriptionIdentifier);
}

void MRContentItemMetadata.adamID.getter()
{
  sub_1D715AEC0((SEL *)&selRef_iTunesStoreIdentifier);
}

void sub_1D715AEC0(SEL *a1)
{
  void *v1;

  if ((uint64_t)objc_msgSend(v1, *a1) >= 1)
  {
    objc_msgSend(v1, *a1);
    sub_1D715D72C();
    sub_1D716119C();
  }
  OUTLINED_FUNCTION_20();
}

uint64_t MRContentItemMetadata.univeralLibraryID.getter()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  __int128 v5;
  __int128 v6;

  sub_1D715D768(v0, (SEL *)&selRef_deviceSpecificUserInfo);
  if (!v1)
  {
    v5 = 0u;
    v6 = 0u;
    goto LABEL_8;
  }
  v2 = v1;
  *(_QWORD *)&v5 = 1684630645;
  *((_QWORD *)&v5 + 1) = 0xE400000000000000;
  sub_1D71611D8();
  sub_1D71590FC((uint64_t)&v4, v2, &v5);
  sub_1D715D34C((uint64_t)&v4);
  OUTLINED_FUNCTION_3();
  if (!*((_QWORD *)&v6 + 1))
  {
LABEL_8:
    sub_1D715D220((uint64_t)&v5);
    return 0;
  }
  if (OUTLINED_FUNCTION_67())
    return v4;
  else
    return 0;
}

uint64_t MRContentItemMetadata.allAudioFormats.getter()
{
  void *v0;
  uint64_t v1;
  unint64_t v2;
  uint64_t v4;

  v1 = MEMORY[0x1E0DEE9D8];
  v4 = MEMORY[0x1E0DEE9D8];
  v2 = sub_1D715D7C8(v0);
  if (v2)
  {
    sub_1D715B040(v2);
    return v4;
  }
  return v1;
}

uint64_t sub_1D715B040(unint64_t a1)
{
  uint64_t *v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  int isUniquelyReferenced_nonNull_bridgeObject;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t result;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  BOOL v18;
  uint64_t v19;

  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    v3 = sub_1D71612B0();
    swift_bridgeObjectRelease();
  }
  else
  {
    v3 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
  }
  if ((unint64_t)*v1 >> 62)
  {
    swift_bridgeObjectRetain();
    v4 = sub_1D71612B0();
    swift_bridgeObjectRelease();
  }
  else
  {
    v4 = *(_QWORD *)((*v1 & 0xFFFFFFFFFFFFF8) + 0x10);
  }
  v5 = v4 + v3;
  if (__OFADD__(v4, v3))
  {
    __break(1u);
    goto LABEL_25;
  }
  v6 = *v1;
  isUniquelyReferenced_nonNull_bridgeObject = swift_isUniquelyReferenced_nonNull_bridgeObject();
  *v1 = v6;
  v8 = 0;
  if (isUniquelyReferenced_nonNull_bridgeObject && (v6 & 0x8000000000000000) == 0 && (v6 & 0x4000000000000000) == 0)
  {
    v9 = v6 & 0xFFFFFFFFFFFFFF8;
    if (v5 <= *(_QWORD *)((v6 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
      goto LABEL_16;
    v8 = 1;
  }
  if (v6 >> 62)
  {
    swift_bridgeObjectRetain();
    v10 = sub_1D71612B0();
    swift_bridgeObjectRelease();
  }
  else
  {
    v10 = *(_QWORD *)((v6 & 0xFFFFFFFFFFFFF8) + 0x10);
  }
  if (v10 <= v5)
    v10 = v5;
  swift_bridgeObjectRetain();
  v11 = MEMORY[0x1D8293314](v8, v10, 1, v6);
  swift_bridgeObjectRelease();
  *v1 = v11;
  v9 = v11 & 0xFFFFFFFFFFFFFF8;
LABEL_16:
  v12 = *(_QWORD *)(v9 + 16);
  v13 = (*(_QWORD *)(v9 + 24) >> 1) - v12;
  result = sub_1D715E734(v9 + 8 * v12 + 32, v13, a1);
  if (v15 < v3)
  {
LABEL_25:
    __break(1u);
    goto LABEL_26;
  }
  v16 = v15;
  if (v15 < 1)
    goto LABEL_20;
  v17 = *(_QWORD *)((*v1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  v18 = __OFADD__(v17, v15);
  v19 = v17 + v15;
  if (!v18)
  {
    *(_QWORD *)((*v1 & 0xFFFFFFFFFFFFFF8) + 0x10) = v19;
LABEL_20:
    swift_bridgeObjectRelease();
    if (v16 != v13)
      return sub_1D7160FF8();
LABEL_26:
    sub_1D715E8EC(0, (uint64_t)&unk_1F00AFA00);
    return sub_1D7160FF8();
  }
  __break(1u);
  return result;
}

void MRContentItemMediaType.name.getter(uint64_t a1)
{
  if (a1)
  {
    if (a1 != 2 && a1 != 1)
    {
      OUTLINED_FUNCTION_27_2();
      OUTLINED_FUNCTION_25_2();
      OUTLINED_FUNCTION_6_3();
      OUTLINED_FUNCTION_3();
      OUTLINED_FUNCTION_61();
    }
  }
  else
  {
    OUTLINED_FUNCTION_44();
  }
}

void sub_1D715B2A0()
{
  uint64_t *v0;

  MRContentItemMediaType.name.getter(*v0);
}

void sub_1D715B2A8(_QWORD *a1@<X8>)
{
  uint64_t *v1;

  sub_1D7156F64(*v1, a1);
}

void MRContentItemEpisodeType.name.getter()
{
  uint64_t v0;

  OUTLINED_FUNCTION_47();
  switch(v0)
  {
    case 0:
    case 1:
    case 4:
    case 5:
    case 6:
      return;
    case 2:
      OUTLINED_FUNCTION_38_0();
      break;
    case 3:
      OUTLINED_FUNCTION_55();
      break;
    default:
      OUTLINED_FUNCTION_4_3();
      OUTLINED_FUNCTION_25_2();
      OUTLINED_FUNCTION_6_3();
      OUTLINED_FUNCTION_3();
      break;
  }
}

void sub_1D715B3A0()
{
  MRContentItemEpisodeType.name.getter();
}

void sub_1D715B3A8(_QWORD *a1@<X8>)
{
  uint64_t *v1;

  sub_1D7156FD4(*v1, a1);
}

uint64_t MRContentItemPlaylistType.name.getter(uint64_t a1)
{
  uint64_t result;
  uint64_t v3;

  result = 0x72616C75676552;
  switch(a1)
  {
    case 0:
      return result;
    case 1:
      result = 0x7375696E6547;
      break;
    case 2:
      result = 0x7472616D53;
      break;
    case 3:
      result = 0x7265646C6F46;
      break;
    case 4:
      result = 0x4D207375696E6547;
      break;
    default:
      OUTLINED_FUNCTION_4_3();
      OUTLINED_FUNCTION_25_2();
      OUTLINED_FUNCTION_6_3();
      OUTLINED_FUNCTION_3();
      result = v3;
      break;
  }
  return result;
}

uint64_t sub_1D715B484()
{
  uint64_t *v0;

  return MRContentItemPlaylistType.name.getter(*v0);
}

void sub_1D715B48C(_QWORD *a1@<X8>)
{
  uint64_t *v1;

  sub_1D715700C(*v1, a1);
}

void MRContentItemRadioStationType.name.getter(unint64_t a1)
{
  if (a1 > 1)
  {
    OUTLINED_FUNCTION_27_2();
    OUTLINED_FUNCTION_25_2();
    OUTLINED_FUNCTION_6_3();
    OUTLINED_FUNCTION_3();
    OUTLINED_FUNCTION_61();
  }
}

void sub_1D715B50C()
{
  unint64_t *v0;

  MRContentItemRadioStationType.name.getter(*v0);
}

void sub_1D715B514(_QWORD *a1@<X8>)
{
  uint64_t *v1;

  sub_1D7157044(*v1, a1);
}

uint64_t MRContentItemMediaSubType.name.getter(uint64_t a1)
{
  uint64_t result;
  uint64_t v3;

  result = 1701736270;
  switch(a1)
  {
    case 0:
      return result;
    case 1:
      result = 0x636973754DLL;
      break;
    case 2:
      result = 0x776F6853205654;
      break;
    case 3:
      result = 0x6569766F4DLL;
      break;
    case 4:
      result = 0x74736163646F50;
      break;
    case 5:
      result = 0x6F6F626F69647541;
      break;
    case 6:
      result = 0x552073656E755469;
      break;
    case 7:
      result = 0x64654D20656D6F48;
      break;
    default:
      OUTLINED_FUNCTION_4_3();
      OUTLINED_FUNCTION_25_2();
      OUTLINED_FUNCTION_6_3();
      OUTLINED_FUNCTION_3();
      result = v3;
      break;
  }
  return result;
}

uint64_t sub_1D715B638()
{
  uint64_t *v0;

  return MRContentItemMediaSubType.name.getter(*v0);
}

void sub_1D715B640(_QWORD *a1@<X8>)
{
  uint64_t *v1;

  sub_1D7156F9C(*v1, a1);
}

void MRDisabledReason.name.getter(int a1)
{
  switch(a1)
  {
    case 0:
    case 1:
    case 2:
    case 5:
    case 6:
      return;
    case 3:
      OUTLINED_FUNCTION_55();
      break;
    case 4:
      OUTLINED_FUNCTION_38_0();
      break;
    default:
      sub_1D71612E0();
      OUTLINED_FUNCTION_6_3();
      OUTLINED_FUNCTION_3();
      _sSo14MSVSQLDatabaseC15MediaFoundationE22StatementInterpolationV06StringE0V13appendLiteralyySSF_0();
      break;
  }
}

void sub_1D715B790()
{
  int *v0;

  MRDisabledReason.name.getter(*v0);
}

void sub_1D715B798(uint64_t a1@<X8>)
{
  int *v1;

  sub_1D7157140(*v1, a1);
}

void SystemAppPlaybackQueueInsertionPosition.name.getter()
{
  if (MRMediaRemoteCopyPlaybackQueueInsertionPositionDescription())
  {
    OUTLINED_FUNCTION_73();
    OUTLINED_FUNCTION_18_2();
    OUTLINED_FUNCTION_51();
    OUTLINED_FUNCTION_8();
  }
  else
  {
    __break(1u);
  }
}

uint64_t sub_1D715B7D8@<X0>(uint64_t a1@<X8>)
{
  unsigned __int8 *v1;

  return sub_1D715707C(*v1, a1);
}

void MRPlaybackState.name.getter(uint64_t a1)
{
  sub_1D715B7EC(a1, MEMORY[0x1E0D4BE98]);
}

void sub_1D715B7EC(uint64_t a1, uint64_t (*a2)(void))
{
  if (a2())
  {
    OUTLINED_FUNCTION_73();
    OUTLINED_FUNCTION_18_2();
    OUTLINED_FUNCTION_51();
    OUTLINED_FUNCTION_8();
  }
  else
  {
    __break(1u);
  }
}

void sub_1D715B81C()
{
  unsigned int *v0;

  MRPlaybackState.name.getter(*v0);
}

void sub_1D715B824(uint64_t a1@<X8>)
{
  int *v1;

  sub_1D7157178(*v1, a1);
}

void MRContentItem.MetadataOutline.id.getter()
{
  __asm { BR              X11 }
}

uint64_t sub_1D715B86C()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 16);
  OUTLINED_FUNCTION_11();
  return v1;
}

void sub_1D715BA80()
{
  sub_1D715D924();
  JUMPOUT(0x1D715BA8CLL);
}

void sub_1D715BAB0()
{
  JUMPOUT(0x1D715BA60);
}

void sub_1D715BB10(_QWORD *a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;

  MRContentItem.MetadataOutline.id.getter();
  *a1 = v2;
  a1[1] = v3;
}

void MediaRemoteCommand.symbol.getter()
{
  OUTLINED_FUNCTION_54();
}

void MRMediaRemoteCommandHandlerStatus.symbol.getter()
{
  OUTLINED_FUNCTION_54();
}

uint64_t RepeatMode.symbol.getter()
{
  char *v0;

  return qword_1D7163C20[*v0];
}

uint64_t ShuffleMode.symbol.getter()
{
  char *v0;

  return qword_1D7163C40[*v0];
}

void MRQueueEndAction.symbol.getter(unsigned int a1)
{
  if (a1 > 3)
    OUTLINED_FUNCTION_35_0();
  else
    OUTLINED_FUNCTION_54();
}

void MediaRemoteCommand.Option.id.getter()
{
  __asm { BR              X10 }
}

uint64_t sub_1D715BC50()
{
  uint64_t v0;

  swift_bridgeObjectRetain();
  return v0;
}

void sub_1D715BC7C(char *a1)
{
  uint64_t v1;
  uint64_t v2;
  int64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v2 = *(_QWORD *)(v1 + 16);
  v3 = *(_QWORD *)(v2 + 16);
  if (v3)
  {
    v11 = MEMORY[0x1E0DEE9D8];
    sub_1D7151784(0, v3, 0);
    v4 = v2 + 64;
    do
    {
      MediaRemoteCommand.Option.id.getter();
      v5 = a1;
      v7 = v6;
      v9 = *(_QWORD *)(v11 + 16);
      v8 = *(_QWORD *)(v11 + 24);
      if (v9 >= v8 >> 1)
        a1 = sub_1D7151784((char *)(v8 > 1), v9 + 1, 1);
      *(_QWORD *)(v11 + 16) = v9 + 1;
      v10 = v11 + 16 * v9;
      *(_QWORD *)(v10 + 32) = v5;
      *(_QWORD *)(v10 + 40) = v7;
      v4 += 40;
      --v3;
    }
    while (v3);
  }
  OUTLINED_FUNCTION_2_3((uint64_t)a1, &qword_1F00AF7A0, MEMORY[0x1E0DEA968], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0DEAEC8]);
  sub_1D715D440();
  sub_1D7160EFC();
  OUTLINED_FUNCTION_3();
  JUMPOUT(0x1D715BC58);
}

void MediaRemoteCommand.Option.isRequired.getter()
{
  __asm { BR              X10 }
}

uint64_t sub_1D715BDBC()
{
  return 0;
}

unint64_t MediaRemoteCommand.Option.name.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  char v8;
  uint64_t v9;
  uint64_t v10;

  OUTLINED_FUNCTION_34_1();
  if (v0 == 1869828432 && v1 == 0xE400000000000000)
  {
    v5 = 0xD000000000000022;
    goto LABEL_8;
  }
  v3 = v0;
  v4 = v1;
  if ((OUTLINED_FUNCTION_30_1() & 1) != 0)
  {
    v5 = 0xD000000000000022;
LABEL_8:
    swift_bridgeObjectRelease();
    return v5;
  }
  v5 = 0x496563616C706552;
  if (v3 == 1769099600 && v4 == 0xE400000000000000)
    goto LABEL_8;
  v8 = OUTLINED_FUNCTION_30_1();
  OUTLINED_FUNCTION_41_0();
  if ((v8 & 1) == 0)
  {
    OUTLINED_FUNCTION_34_1();
    sub_1D71506F8();
    OUTLINED_FUNCTION_15_3();
    OUTLINED_FUNCTION_3();
    v9 = OUTLINED_FUNCTION_15_3();
    swift_bridgeObjectRelease();
    v10 = v9;
    OUTLINED_FUNCTION_11();
    LOBYTE(v9) = sub_1D7160F98();
    OUTLINED_FUNCTION_16_1();
    if ((v9 & 1) != 0)
      sub_1D715C0F8(3uLL);
    return v10;
  }
  return v5;
}

unint64_t sub_1D715C0F8(unint64_t result)
{
  _QWORD *v1;
  unint64_t v2;
  uint64_t v3;
  char v4;

  if (result)
  {
    if ((result & 0x8000000000000000) != 0)
    {
      __break(1u);
    }
    else
    {
      v2 = v1[1];
      if ((v2 & 0x2000000000000000) != 0)
        v3 = HIBYTE(v2) & 0xF;
      else
        v3 = *v1 & 0xFFFFFFFFFFFFLL;
      result = sub_1D7160F80();
      if ((v4 & 1) != 0)
        goto LABEL_12;
      if (4 * v3 >= result >> 14)
        return sub_1D7160F44();
    }
    __break(1u);
LABEL_12:
    __break(1u);
  }
  return result;
}

void sub_1D715C194(_QWORD *a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;

  MediaRemoteCommand.Option.id.getter();
  *a1 = v2;
  a1[1] = v3;
}

void MediaRemoteCommand.options.getter()
{
  __asm { BR              X10 }
}

uint64_t sub_1D715C1F0()
{
  uint64_t v0;

  return v0;
}

uint64_t sub_1D715C208(uint64_t a1)
{
  char v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_2_3(a1, &qword_1F00AF808, (uint64_t)&type metadata for MediaRemoteCommand.Option, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0DED1E8]);
  v2 = OUTLINED_FUNCTION_23_1();
  *(_OWORD *)(v2 + 16) = xmmword_1D7163CA0;
  if (!*MEMORY[0x1E0D4CBC8])
  {
    __break(1u);
    JUMPOUT(0x1D715CC90);
  }
  v3 = sub_1D7160F20();
  OUTLINED_FUNCTION_72(v3, v4);
  if (!*MEMORY[0x1E0D4CCD0])
  {
    __break(1u);
    JUMPOUT(0x1D715C268);
  }
  *(_QWORD *)(v2 + 72) = sub_1D7160F20();
  *(_QWORD *)(v2 + 80) = v5;
  *(_QWORD *)(v2 + 88) = 0;
  *(_QWORD *)(v2 + 96) = 0;
  *(_BYTE *)(v2 + 104) = v1;
  return sub_1D715C1F0();
}

unint64_t sub_1D715CE40(unint64_t result, char a2, uint64_t a3)
{
  if ((a2 & 1) != 0)
  {
    if ((result & 0x8000000000000000) != 0)
    {
      __break(1u);
    }
    else if (*(_QWORD *)((a3 & 0xFFFFFFFFFFFFF8) + 0x10) > result)
    {
      return result;
    }
    __break(1u);
  }
  return result;
}

unint64_t sub_1D715CE64(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_1D71611C0();
  return sub_1D715CEF8(a1, v2);
}

unint64_t sub_1D715CE94(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  sub_1D7161370();
  sub_1D7160F68();
  v4 = sub_1D7161388();
  return sub_1D715CFBC(a1, a2, v4);
}

unint64_t sub_1D715CEF8(uint64_t a1, uint64_t a2)
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
      sub_1D7160134(*(_QWORD *)(v2 + 48) + 40 * v4, (uint64_t)v9);
      v7 = MEMORY[0x1D82932F0](v9, a1);
      sub_1D715D34C((uint64_t)v9);
      if ((v7 & 1) != 0)
        break;
      v4 = (v4 + 1) & v6;
    }
    while (((*(_QWORD *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFF8)) >> v4) & 1) != 0);
  }
  return v4;
}

unint64_t sub_1D715CFBC(uint64_t a1, uint64_t a2, uint64_t a3)
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
    if (!v11 && (sub_1D7161310() & 1) == 0)
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
      while (!v14 && (sub_1D7161310() & 1) == 0);
    }
  }
  return v6;
}

uint64_t sub_1D715D09C@<X0>(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t result;
  uint64_t v5;
  uint64_t v6;

  v2 = -1;
  v3 = -1 << *(_BYTE *)(a1 + 32);
  *a2 = a1;
  v6 = *(_QWORD *)(a1 + 64);
  result = a1 + 64;
  v5 = v6;
  if (-v3 < 64)
    v2 = ~(-1 << -(char)v3);
  a2[1] = result;
  a2[2] = ~v3;
  a2[3] = 0;
  a2[4] = v2 & v5;
  return result;
}

double sub_1D715D0D4@<D0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _OWORD *a3@<X8>)
{
  uint64_t *v3;
  uint64_t *v4;
  unint64_t v8;
  char v9;
  double result;
  uint64_t v11;

  v4 = v3;
  swift_bridgeObjectRetain();
  v8 = sub_1D715CE94(a1, a2);
  LOBYTE(a2) = v9;
  swift_bridgeObjectRelease();
  if ((a2 & 1) != 0)
  {
    swift_isUniquelyReferenced_nonNull_native();
    v11 = *v4;
    *v4 = 0x8000000000000000;
    sub_1D71602F4(0, &qword_1F00AFA30, MEMORY[0x1E0DEA968], MEMORY[0x1E0DEA978], MEMORY[0x1E0DECB20]);
    sub_1D7161298();
    swift_bridgeObjectRelease();
    sub_1D7153CE4((_OWORD *)(*(_QWORD *)(v11 + 56) + 32 * v8), a3);
    sub_1D71612A4();
    *v4 = v11;
    swift_bridgeObjectRelease();
  }
  else
  {
    result = 0.0;
    *a3 = 0u;
    a3[1] = 0u;
  }
  return result;
}

uint64_t sub_1D715D220(uint64_t a1)
{
  uint64_t v2;

  sub_1D7152354(0, (unint64_t *)&qword_1F00AF8D0, MEMORY[0x1E0DEE9B8] + 8, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0DEB940]);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_1D715D278(void *a1)
{
  id v1;
  void *v2;
  uint64_t v3;

  v1 = objc_msgSend(a1, sel_identifier);
  if (!v1)
    return 0;
  v2 = v1;
  v3 = sub_1D7160F20();

  return v3;
}

uint64_t sub_1D715D2D8(void *a1)
{
  id v2;
  uint64_t v3;

  v2 = objc_msgSend(a1, sel_userInfo);

  if (!v2)
    return 0;
  v3 = sub_1D7160EE4();

  return v3;
}

uint64_t sub_1D715D34C(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(MEMORY[0x1E0DEC198] - 8) + 8))();
  return a1;
}

void sub_1D715D380()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_1F00AF940)
  {
    sub_1D7152354(255, &qword_1F00AF948, MEMORY[0x1E0DEA968], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0DEB940]);
    v0 = sub_1D71612EC();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_1F00AF940);
  }
}

void sub_1D715D3EC(void *a1, SEL *a2)
{
  id v3;

  v3 = objc_msgSend(a1, *a2);

  if (v3)
  {
    sub_1D7160F20();
    OUTLINED_FUNCTION_18_2();
  }
  OUTLINED_FUNCTION_51();
  OUTLINED_FUNCTION_8();
}

unint64_t sub_1D715D440()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1ED56FB40;
  if (!qword_1ED56FB40)
  {
    sub_1D7152354(255, &qword_1F00AF7A0, MEMORY[0x1E0DEA968], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0DEAEC8]);
    result = MEMORY[0x1D82937B8](MEMORY[0x1E0DEAF20], v1);
    atomic_store(result, (unint64_t *)&qword_1ED56FB40);
  }
  return result;
}

void sub_1D715D498(uint64_t a1, uint64_t a2)
{
  unint64_t *v2;
  void (*v3)(uint64_t);
  unint64_t *v4;
  unint64_t v5;
  uint64_t v6;

  if (!OUTLINED_FUNCTION_66(a1, a2))
  {
    v4 = v2;
    v3(255);
    v5 = sub_1D7161160();
    if (!v6)
      atomic_store(v5, v4);
  }
  OUTLINED_FUNCTION_7();
}

uint64_t sub_1D715D4DC(void *a1)
{
  id v2;
  uint64_t v3;

  v2 = objc_msgSend(a1, sel_artworkURLTemplates);

  if (!v2)
    return 0;
  sub_1D71602F4(0, &qword_1F00AF9B0, MEMORY[0x1E0DEC198], MEMORY[0x1E0DEC1A0], MEMORY[0x1E0DEA048]);
  v3 = sub_1D7160FEC();

  return v3;
}

uint64_t sub_1D715D560(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, unint64_t a6)
{
  uint64_t result;

  switch(a6 >> 60)
  {
    case 0uLL:
    case 7uLL:
    case 0xCuLL:
      goto LABEL_8;
    case 1uLL:
    case 2uLL:
    case 3uLL:
      swift_bridgeObjectRetain();
      goto LABEL_8;
    case 4uLL:
    case 5uLL:
    case 8uLL:
    case 9uLL:
      swift_bridgeObjectRetain();
      swift_retain();
      goto LABEL_8;
    case 6uLL:
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_retain();
      goto LABEL_8;
    case 0xAuLL:
      swift_bridgeObjectRetain();
      swift_retain();
      goto LABEL_7;
    case 0xBuLL:
      swift_bridgeObjectRetain();
LABEL_7:
      swift_retain();
LABEL_8:
      result = swift_retain();
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_1D715D62C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, unint64_t a6)
{
  uint64_t result;

  switch(a6 >> 60)
  {
    case 0uLL:
    case 7uLL:
    case 0xCuLL:
      goto LABEL_8;
    case 1uLL:
    case 2uLL:
    case 3uLL:
      swift_bridgeObjectRelease();
      goto LABEL_8;
    case 4uLL:
    case 5uLL:
    case 8uLL:
    case 9uLL:
      swift_bridgeObjectRelease();
      swift_release();
      goto LABEL_8;
    case 6uLL:
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_release();
      goto LABEL_8;
    case 0xAuLL:
      swift_bridgeObjectRelease();
      swift_release();
      goto LABEL_7;
    case 0xBuLL:
      swift_bridgeObjectRelease();
LABEL_7:
      swift_release();
LABEL_8:
      result = swift_release();
      break;
    default:
      return result;
  }
  return result;
}

void sub_1D715D6F8(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  OUTLINED_FUNCTION_57(a1, a2);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  OUTLINED_FUNCTION_7();
}

unint64_t sub_1D715D72C()
{
  unint64_t result;

  result = qword_1F00AF958;
  if (!qword_1F00AF958)
  {
    result = MEMORY[0x1D82937B8](MEMORY[0x1E0DEDCA0], MEMORY[0x1E0DEDC60]);
    atomic_store(result, (unint64_t *)&qword_1F00AF958);
  }
  return result;
}

void sub_1D715D768(void *a1, SEL *a2)
{
  id v2;
  void *v3;

  v2 = objc_msgSend(a1, *a2);
  if (v2)
  {
    v3 = v2;
    sub_1D7160EE4();

  }
  OUTLINED_FUNCTION_7();
}

uint64_t sub_1D715D7C8(void *a1)
{
  id v1;
  void *v2;
  uint64_t v3;

  v1 = objc_msgSend(a1, sel_alternativeFormats);
  if (!v1)
    return 0;
  v2 = v1;
  sub_1D7160214(0, &qword_1F00AFA08);
  v3 = sub_1D7160FEC();

  return v3;
}

void sub_1D715D834()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_1F00AF988)
  {
    sub_1D7160214(255, &qword_1F00AF968);
    sub_1D7152354(255, &qword_1F00AF948, MEMORY[0x1E0DEA968], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0DEB940]);
    v0 = sub_1D71613AC();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_1F00AF988);
  }
}

void sub_1D715D8C0(uint64_t a1, unint64_t *a2)
{
  unint64_t v3;
  uint64_t v4;

  if (!*a2)
  {
    sub_1D7160214(255, &qword_1F00AF968);
    v3 = sub_1D71613AC();
    if (!v4)
      atomic_store(v3, a2);
  }
  OUTLINED_FUNCTION_8();
}

void sub_1D715D924()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_1F00AF9A0)
  {
    sub_1D7160214(255, &qword_1F00AF968);
    sub_1D715D998();
    v0 = sub_1D71613AC();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_1F00AF9A0);
  }
}

void sub_1D715D998()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_1F00AF9A8)
  {
    sub_1D71602F4(255, &qword_1F00AF9B0, MEMORY[0x1E0DEC198], MEMORY[0x1E0DEC1A0], MEMORY[0x1E0DEA048]);
    v0 = sub_1D7161160();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_1F00AF9A8);
  }
}

void sub_1D715DA0C(uint64_t a1, uint64_t a2)
{
  unint64_t *v2;
  uint64_t v3;
  uint64_t v4;
  void (*v5)(uint64_t, uint64_t, uint64_t);
  void (*v6)(uint64_t, uint64_t, uint64_t);
  uint64_t v7;
  uint64_t v8;
  unint64_t *v9;
  unint64_t v10;
  uint64_t v11;

  if (!OUTLINED_FUNCTION_66(a1, a2))
  {
    v6 = v5;
    v7 = v4;
    v8 = v3;
    v9 = v2;
    sub_1D7160214(255, &qword_1F00AF968);
    v6(255, v8, v7);
    v10 = sub_1D71613AC();
    if (!v11)
      atomic_store(v10, v9);
  }
}

uint64_t sub_1D715DA98(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, unsigned __int8 a5)
{
  uint64_t result;

  switch(a5 >> 5)
  {
    case 0:
    case 2:
      goto LABEL_3;
    case 1:
    case 3:
      swift_bridgeObjectRetain();
LABEL_3:
      result = swift_bridgeObjectRetain();
      break;
    case 4:
      result = swift_retain();
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_1D715DB04(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, unsigned __int8 a5)
{
  uint64_t result;

  switch(a5 >> 5)
  {
    case 0:
    case 2:
      goto LABEL_3;
    case 1:
    case 3:
      swift_bridgeObjectRelease();
LABEL_3:
      result = swift_bridgeObjectRelease();
      break;
    case 4:
      result = swift_release();
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_1D715DB70()
{
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

unint64_t sub_1D715DB98()
{
  unint64_t result;

  result = qword_1F00AF9D0;
  if (!qword_1F00AF9D0)
  {
    result = MEMORY[0x1D82937B8](&protocol conformance descriptor for MRPlayerPath.Error, &type metadata for MRPlayerPath.Error);
    atomic_store(result, (unint64_t *)&qword_1F00AF9D0);
  }
  return result;
}

unint64_t sub_1D715DBD8()
{
  unint64_t result;

  result = qword_1F00AF9D8;
  if (!qword_1F00AF9D8)
  {
    result = MEMORY[0x1D82937B8](&protocol conformance descriptor for MediaRemoteCommand, &type metadata for MediaRemoteCommand);
    atomic_store(result, (unint64_t *)&qword_1F00AF9D8);
  }
  return result;
}

unint64_t sub_1D715DC18()
{
  unint64_t result;

  result = qword_1F00AF9E0;
  if (!qword_1F00AF9E0)
  {
    result = MEMORY[0x1D82937B8](&protocol conformance descriptor for RepeatMode, &type metadata for RepeatMode);
    atomic_store(result, (unint64_t *)&qword_1F00AF9E0);
  }
  return result;
}

unint64_t sub_1D715DC58()
{
  unint64_t result;

  result = qword_1F00AF9E8;
  if (!qword_1F00AF9E8)
  {
    result = MEMORY[0x1D82937B8](&protocol conformance descriptor for ShuffleMode, &type metadata for ShuffleMode);
    atomic_store(result, (unint64_t *)&qword_1F00AF9E8);
  }
  return result;
}

unint64_t sub_1D715DC98()
{
  unint64_t result;

  result = qword_1F00AF9F0;
  if (!qword_1F00AF9F0)
  {
    result = MEMORY[0x1D82937B8](&protocol conformance descriptor for MRContentItem.MetadataOutline.BoolType, &type metadata for MRContentItem.MetadataOutline.BoolType);
    atomic_store(result, (unint64_t *)&qword_1F00AF9F0);
  }
  return result;
}

unint64_t sub_1D715DCD8()
{
  unint64_t result;

  result = qword_1F00AF9F8;
  if (!qword_1F00AF9F8)
  {
    result = MEMORY[0x1D82937B8](&protocol conformance descriptor for SystemAppPlaybackQueueInsertionPosition, &type metadata for SystemAppPlaybackQueueInsertionPosition);
    atomic_store(result, (unint64_t *)&qword_1F00AF9F8);
  }
  return result;
}

uint64_t sub_1D715DD14()
{
  return MEMORY[0x1E0DEA978];
}

uint64_t dispatch thunk of NamedEnum.name.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t dispatch thunk of NamedEnum._namedEnum.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

uint64_t sub_1D715DD3C()
{
  return 0;
}

void type metadata accessor for MRPlayerPath.Error()
{
  OUTLINED_FUNCTION_35_0();
}

uint64_t getEnumTagSinglePayload for MediaRemoteCommand(unsigned __int8 *a1, unsigned int a2)
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
  if (a2 >= 0xB9)
  {
    if (a2 + 71 >= 0xFFFF00)
      v2 = 4;
    else
      v2 = 2;
    if ((a2 + 71) >> 8 < 0xFF)
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
    v5 = (*a1 | (v4 << 8)) - 72;
    return (v5 + 1);
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 0x48;
  v5 = v6 - 72;
  if (!v7)
    v5 = -1;
  return (v5 + 1);
}

uint64_t storeEnumTagSinglePayload for MediaRemoteCommand(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 71 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 71) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xB9)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xB8)
    return ((uint64_t (*)(void))((char *)&loc_1D715DE24 + 4 * byte_1D7161C9B[v4]))();
  *a1 = a2 + 71;
  return ((uint64_t (*)(void))((char *)sub_1D715DE58 + 4 * byte_1D7161C96[v4]))();
}

uint64_t sub_1D715DE58(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_1D715DE60(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x1D715DE68);
  return result;
}

uint64_t sub_1D715DE74(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x1D715DE7CLL);
  *(_BYTE *)result = a2 + 71;
  return result;
}

uint64_t sub_1D715DE80(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1D715DE88(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

_BYTE *sub_1D715DE94(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

void type metadata accessor for MediaRemoteCommand()
{
  OUTLINED_FUNCTION_35_0();
}

void type metadata accessor for RepeatMode()
{
  OUTLINED_FUNCTION_35_0();
}

void type metadata accessor for ShuffleMode()
{
  OUTLINED_FUNCTION_35_0();
}

uint64_t _s15MetadataOutlineOwxx(uint64_t a1)
{
  return sub_1D715D62C(*(_QWORD *)a1, *(_QWORD *)(a1 + 8), *(_QWORD *)(a1 + 16), *(_QWORD *)(a1 + 24), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

uint64_t *_s15MetadataOutlineOwcp(uint64_t *a1, uint64_t *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;

  v3 = *a2;
  v4 = a2[1];
  v5 = a2[2];
  v6 = a2[3];
  v7 = a2[4];
  v8 = a2[5];
  sub_1D715D560(*a2, v4, v5, v6, v7, v8);
  *a1 = v3;
  a1[1] = v4;
  a1[2] = v5;
  a1[3] = v6;
  a1[4] = v7;
  a1[5] = v8;
  return a1;
}

uint64_t *_s15MetadataOutlineOwca(uint64_t *a1, uint64_t *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;

  v3 = *a2;
  v4 = a2[1];
  v5 = a2[2];
  v6 = a2[3];
  v7 = a2[4];
  v8 = a2[5];
  sub_1D715D560(*a2, v4, v5, v6, v7, v8);
  v9 = *a1;
  v10 = a1[1];
  v11 = a1[2];
  v12 = a1[3];
  v13 = a1[4];
  v14 = a1[5];
  *a1 = v3;
  a1[1] = v4;
  a1[2] = v5;
  a1[3] = v6;
  a1[4] = v7;
  a1[5] = v8;
  sub_1D715D62C(v9, v10, v11, v12, v13, v14);
  return a1;
}

__n128 __swift_memcpy48_8(uint64_t a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;

  result = *(__n128 *)a2;
  v3 = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(a1 + 32) = v3;
  *(__n128 *)a1 = result;
  return result;
}

uint64_t *_s15MetadataOutlineOwta(uint64_t *a1, _OWORD *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  __int128 v9;

  v3 = *a1;
  v5 = a1[1];
  v4 = a1[2];
  v6 = a1[3];
  v7 = a1[4];
  v8 = a1[5];
  v9 = a2[1];
  *(_OWORD *)a1 = *a2;
  *((_OWORD *)a1 + 1) = v9;
  *((_OWORD *)a1 + 2) = a2[2];
  sub_1D715D62C(v3, v5, v4, v6, v7, v8);
  return a1;
}

uint64_t _s15MetadataOutlineOwet(uint64_t a1, unsigned int a2)
{
  unsigned int v2;

  if (a2)
  {
    if (a2 >= 0x3FF3 && *(_BYTE *)(a1 + 48))
    {
      v2 = *(_DWORD *)a1 + 16370;
    }
    else
    {
      v2 = ((*(_QWORD *)(a1 + 40) >> 60) | (16
                                          * ((*(_QWORD *)(a1 + 32) >> 57) & 0x78 | *(_QWORD *)(a1 + 32) & 7 | ((*(_QWORD *)(a1 + 40) & 7) << 7)))) ^ 0x3FFF;
      if (v2 >= 0x3FF2)
        v2 = -1;
    }
  }
  else
  {
    v2 = -1;
  }
  return v2 + 1;
}

uint64_t _s15MetadataOutlineOwst(uint64_t result, unsigned int a2, unsigned int a3)
{
  unint64_t v3;

  if (a2 > 0x3FF2)
  {
    *(_QWORD *)(result + 40) = 0;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_QWORD *)result = a2 - 16371;
    if (a3 >= 0x3FF3)
      *(_BYTE *)(result + 48) = 1;
  }
  else
  {
    if (a3 >= 0x3FF3)
      *(_BYTE *)(result + 48) = 0;
    if (a2)
    {
      v3 = (-a2 >> 4) & 0x3FF | ((-a2 & 0x3FFF) << 10);
      *(_OWORD *)result = 0u;
      *(_OWORD *)(result + 16) = 0u;
      *(_QWORD *)(result + 32) = (v3 | (v3 << 57)) & 0xF000000000000007;
      *(_QWORD *)(result + 40) = ((v3 >> 7) | (v3 << 50)) & 0xF000000000000007;
    }
  }
  return result;
}

uint64_t sub_1D715E108(uint64_t a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(a1 + 40) >> 60;
  if (v1 <= 0xC)
    return v1;
  else
    return (*(_DWORD *)a1 + 13);
}

uint64_t sub_1D715E124(uint64_t result)
{
  *(_QWORD *)(result + 40) &= 0xFFFFFFFFFFFFFFFuLL;
  return result;
}

uint64_t sub_1D715E134(uint64_t result, uint64_t a2)
{
  uint64_t v2;

  if (a2 < 0xD)
  {
    v2 = *(_QWORD *)(result + 40) & 0xFFFFFFFFFFFFFF8 | (a2 << 60);
    *(_QWORD *)(result + 32) &= 0xFFFFFFFFFFFFFF8uLL;
    *(_QWORD *)(result + 40) = v2;
  }
  else
  {
    *(_QWORD *)result = (a2 - 13);
    *(_OWORD *)(result + 8) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_QWORD *)(result + 40) = 0xD000000000000000;
  }
  return result;
}

void type metadata accessor for MRContentItem.MetadataOutline()
{
  OUTLINED_FUNCTION_35_0();
}

uint64_t _s15MetadataOutlineO8BoolTypeOwet(unsigned __int8 *a1, unsigned int a2)
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
  if (a2 >= 0xFE)
  {
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
    v5 = (*a1 | (v4 << 8)) - 3;
    return (v5 + 1);
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 3;
  v5 = v6 - 3;
  if (!v7)
    v5 = -1;
  return (v5 + 1);
}

uint64_t _s15MetadataOutlineO8BoolTypeOwst(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_1D715E250 + 4 * byte_1D7161CA5[v4]))();
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)sub_1D715E284 + 4 * byte_1D7161CA0[v4]))();
}

uint64_t sub_1D715E284(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_1D715E28C(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x1D715E294);
  return result;
}

uint64_t sub_1D715E2A0(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x1D715E2A8);
  *(_BYTE *)result = a2 + 2;
  return result;
}

uint64_t sub_1D715E2AC(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1D715E2B4(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

void type metadata accessor for MRContentItem.MetadataOutline.BoolType()
{
  OUTLINED_FUNCTION_35_0();
}

uint64_t _s15MediaFoundation10RepeatModeOwet_0(unsigned __int8 *a1, unsigned int a2)
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

uint64_t _s15MediaFoundation10RepeatModeOwst_0(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_1D715E3A0 + 4 * byte_1D7161CAF[v4]))();
  *a1 = a2 + 3;
  return ((uint64_t (*)(void))((char *)sub_1D715E3D4 + 4 * byte_1D7161CAA[v4]))();
}

uint64_t sub_1D715E3D4(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_1D715E3DC(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x1D715E3E4);
  return result;
}

uint64_t sub_1D715E3F0(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x1D715E3F8);
  *(_BYTE *)result = a2 + 3;
  return result;
}

uint64_t sub_1D715E3FC(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1D715E404(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

void type metadata accessor for SystemAppPlaybackQueueInsertionPosition()
{
  OUTLINED_FUNCTION_35_0();
}

uint64_t destroy for MediaRemoteCommand.Option(uint64_t a1)
{
  return sub_1D715DB04(*(_QWORD *)a1, *(_QWORD *)(a1 + 8), *(_QWORD *)(a1 + 16), *(_QWORD *)(a1 + 24), *(_BYTE *)(a1 + 32));
}

uint64_t initializeWithCopy for MediaRemoteCommand.Option(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unsigned __int8 v7;

  v3 = *(_QWORD *)a2;
  v4 = *(_QWORD *)(a2 + 8);
  v5 = *(_QWORD *)(a2 + 16);
  v6 = *(_QWORD *)(a2 + 24);
  v7 = *(_BYTE *)(a2 + 32);
  sub_1D715DA98(*(_QWORD *)a2, v4, v5, v6, v7);
  *(_QWORD *)a1 = v3;
  *(_QWORD *)(a1 + 8) = v4;
  *(_QWORD *)(a1 + 16) = v5;
  *(_QWORD *)(a1 + 24) = v6;
  *(_BYTE *)(a1 + 32) = v7;
  return a1;
}

uint64_t assignWithCopy for MediaRemoteCommand.Option(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unsigned __int8 v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unsigned __int8 v12;

  v3 = *(_QWORD *)a2;
  v4 = *(_QWORD *)(a2 + 8);
  v5 = *(_QWORD *)(a2 + 16);
  v6 = *(_QWORD *)(a2 + 24);
  v7 = *(_BYTE *)(a2 + 32);
  sub_1D715DA98(*(_QWORD *)a2, v4, v5, v6, v7);
  v8 = *(_QWORD *)a1;
  v9 = *(_QWORD *)(a1 + 8);
  v10 = *(_QWORD *)(a1 + 16);
  v11 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)a1 = v3;
  *(_QWORD *)(a1 + 8) = v4;
  *(_QWORD *)(a1 + 16) = v5;
  *(_QWORD *)(a1 + 24) = v6;
  v12 = *(_BYTE *)(a1 + 32);
  *(_BYTE *)(a1 + 32) = v7;
  sub_1D715DB04(v8, v9, v10, v11, v12);
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

uint64_t assignWithTake for MediaRemoteCommand.Option(uint64_t a1, uint64_t a2)
{
  char v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  unsigned __int8 v9;

  v3 = *(_BYTE *)(a2 + 32);
  v4 = *(_QWORD *)a1;
  v6 = *(_QWORD *)(a1 + 8);
  v5 = *(_QWORD *)(a1 + 16);
  v7 = *(_QWORD *)(a1 + 24);
  v8 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v8;
  v9 = *(_BYTE *)(a1 + 32);
  *(_BYTE *)(a1 + 32) = v3;
  sub_1D715DB04(v4, v6, v5, v7, v9);
  return a1;
}

uint64_t getEnumTagSinglePayload for MediaRemoteCommand.Option(uint64_t a1, unsigned int a2)
{
  unsigned int v2;

  if (a2)
  {
    if (a2 >= 0x7C && *(_BYTE *)(a1 + 33))
    {
      v2 = *(_DWORD *)a1 + 123;
    }
    else
    {
      v2 = ((*(unsigned __int8 *)(a1 + 32) >> 5) & 0xFFFFFF87 | (8 * ((*(unsigned __int8 *)(a1 + 32) >> 1) & 0xF))) ^ 0x7F;
      if (v2 >= 0x7B)
        v2 = -1;
    }
  }
  else
  {
    v2 = -1;
  }
  return v2 + 1;
}

uint64_t storeEnumTagSinglePayload for MediaRemoteCommand.Option(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7B)
  {
    *(_QWORD *)(result + 16) = 0;
    *(_QWORD *)(result + 24) = 0;
    *(_BYTE *)(result + 32) = 0;
    *(_QWORD *)result = a2 - 124;
    *(_QWORD *)(result + 8) = 0;
    if (a3 >= 0x7C)
      *(_BYTE *)(result + 33) = 1;
  }
  else
  {
    if (a3 >= 0x7C)
      *(_BYTE *)(result + 33) = 0;
    if (a2)
    {
      *(_OWORD *)result = 0u;
      *(_OWORD *)(result + 16) = 0u;
      *(_BYTE *)(result + 32) = 2 * (((-a2 >> 3) & 0xF) - 16 * a2);
    }
  }
  return result;
}

uint64_t sub_1D715E604(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 32) >> 5;
}

uint64_t sub_1D715E610(uint64_t result)
{
  *(_BYTE *)(result + 32) &= 0x1Fu;
  return result;
}

uint64_t sub_1D715E620(uint64_t result, char a2)
{
  *(_BYTE *)(result + 32) = *(_BYTE *)(result + 32) & 1 | (32 * a2);
  return result;
}

void type metadata accessor for MediaRemoteCommand.Option()
{
  OUTLINED_FUNCTION_35_0();
}

void (*sub_1D715E640(_QWORD *a1, unint64_t a2, uint64_t a3))(_QWORD *a1)
{
  _QWORD *v6;

  v6 = malloc(0x28uLL);
  *a1 = v6;
  v6[4] = sub_1D715E6C0(v6, a2, a3);
  return sub_1D715E694;
}

void sub_1D715E694(_QWORD *a1)
{
  void *v1;

  v1 = (void *)*a1;
  (*(void (**)(_QWORD))(*a1 + 32))(*a1);
  free(v1);
}

void (*sub_1D715E6C0(_QWORD *a1, unint64_t a2, uint64_t a3))(id *a1)
{
  unint64_t v6;
  id v7;

  v6 = a3 & 0xC000000000000001;
  sub_1D715CE40(a2, (a3 & 0xC000000000000001) == 0, a3);
  if (v6)
    v7 = (id)MEMORY[0x1D8293308](a2, a3);
  else
    v7 = *(id *)(a3 + 8 * a2 + 32);
  *a1 = v7;
  return sub_1D715E72C;
}

void sub_1D715E72C(id *a1)
{

}

uint64_t sub_1D715E734(uint64_t result, uint64_t a2, unint64_t a3)
{
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t i;
  void (*v10)(_QWORD *);
  id *v11;
  id v12;
  _QWORD v13[4];

  v5 = result;
  v6 = a3 >> 62;
  if (a3 >> 62)
  {
    swift_bridgeObjectRetain();
    v7 = sub_1D71612B0();
    result = swift_bridgeObjectRelease();
    if (!v7)
      return a3;
  }
  else
  {
    v7 = *(_QWORD *)((a3 & 0xFFFFFFFFFFFFF8) + 0x10);
    if (!v7)
      return a3;
  }
  if (v5)
  {
    if (v6)
    {
      swift_bridgeObjectRetain();
      v8 = sub_1D71612B0();
      result = swift_bridgeObjectRelease();
      if (v8 <= a2)
      {
        if (v7 >= 1)
        {
          sub_1D715E8EC(0, (uint64_t)&unk_1F00AFA00);
          sub_1D715E928();
          swift_bridgeObjectRetain();
          for (i = 0; i != v7; ++i)
          {
            v10 = sub_1D715E640(v13, i, a3);
            v12 = *v11;
            ((void (*)(_QWORD *, _QWORD))v10)(v13, 0);
            *(_QWORD *)(v5 + 8 * i) = v12;
          }
          swift_bridgeObjectRelease();
          return a3;
        }
        goto LABEL_16;
      }
    }
    else
    {
      if (*(_QWORD *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10) <= a2)
      {
        sub_1D7160214(0, &qword_1F00AFA08);
        swift_arrayInitWithCopy();
        return a3;
      }
      __break(1u);
    }
    __break(1u);
LABEL_16:
    __break(1u);
  }
  __break(1u);
  return result;
}

void sub_1D715E8EC(uint64_t a1, uint64_t a2)
{
  unint64_t *v2;
  uint64_t v3;
  unint64_t *v4;
  unint64_t v5;
  uint64_t v6;

  if (!OUTLINED_FUNCTION_66(a1, a2))
  {
    OUTLINED_FUNCTION_32_1(0, v3, v4);
    v5 = sub_1D7161034();
    if (!v6)
      atomic_store(v5, v2);
  }
  OUTLINED_FUNCTION_7();
}

unint64_t sub_1D715E928()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1F00AFA10;
  if (!qword_1F00AFA10)
  {
    sub_1D715E8EC(255, (uint64_t)&unk_1F00AFA00);
    result = MEMORY[0x1D82937B8](MEMORY[0x1E0DEAF50], v1);
    atomic_store(result, (unint64_t *)&qword_1F00AFA10);
  }
  return result;
}

uint64_t sub_1D715E980()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

char *keypath_get_selector_identifier()
{
  return sel_identifier;
}

void sub_1D715E9B8(id *a1, uint64_t a2, uint64_t a3)
{
  sub_1D715ABD0(a1, a2, a3, (SEL *)&selRef_identifier);
}

void sub_1D715E9D4(uint64_t a1, uint64_t a2, uint64_t a3, int a4, uint64_t a5, int a6, int a7, int a8)
{
  sub_1D715AC1C(a1, a2, a3, a4, (int)&selRef_setIdentifier_, a6, a7, a8);
}

void sub_1D715E9F0(id *a1@<X8>)
{
  *a1 = MRContentItem._metadata.getter();
  OUTLINED_FUNCTION_7();
}

char *keypath_get_selector_contentIdentifier()
{
  return sel_contentIdentifier;
}

void sub_1D715EA20(id *a1, uint64_t a2, uint64_t a3)
{
  sub_1D715ABD0(a1, a2, a3, (SEL *)&selRef_contentIdentifier);
}

void sub_1D715EA3C(uint64_t a1, uint64_t a2, uint64_t a3, int a4, uint64_t a5, int a6, int a7, int a8)
{
  sub_1D715AC1C(a1, a2, a3, a4, (int)&selRef_setContentIdentifier_, a6, a7, a8);
}

char *keypath_get_selector_queueIdentifier()
{
  return sel_queueIdentifier;
}

void sub_1D715EA64(id *a1, uint64_t a2, uint64_t a3)
{
  sub_1D715ABD0(a1, a2, a3, (SEL *)&selRef_queueIdentifier);
}

void sub_1D715EA80(uint64_t a1, uint64_t a2, uint64_t a3, int a4, uint64_t a5, int a6, int a7, int a8)
{
  sub_1D715AC1C(a1, a2, a3, a4, (int)&selRef_setQueueIdentifier_, a6, a7, a8);
}

char *keypath_get_selector_profileIdentifier()
{
  return sel_profileIdentifier;
}

void sub_1D715EAA8(id *a1, uint64_t a2, uint64_t a3)
{
  sub_1D715ABD0(a1, a2, a3, (SEL *)&selRef_profileIdentifier);
}

void sub_1D715EAC4(uint64_t a1, uint64_t a2, uint64_t a3, int a4, uint64_t a5, int a6, int a7, int a8)
{
  sub_1D715AC1C(a1, a2, a3, a4, (int)&selRef_setProfileIdentifier_, a6, a7, a8);
}

char *keypath_get_selector_hasITunesStoreIdentifier()
{
  return sel_hasITunesStoreIdentifier;
}

void sub_1D715EAEC(uint64_t a1)
{
  _BYTE *v1;

  *v1 = objc_msgSend((id)OUTLINED_FUNCTION_1_3(a1), sel_hasITunesStoreIdentifier);
  OUTLINED_FUNCTION_7();
}

id sub_1D715EB14(unsigned __int8 *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setHasITunesStoreIdentifier_, *a1);
}

char *keypath_get_selector_iTunesStoreIdentifier()
{
  return sel_iTunesStoreIdentifier;
}

void sub_1D715EB34(uint64_t a1)
{
  _QWORD *v1;

  *v1 = objc_msgSend((id)OUTLINED_FUNCTION_1_3(a1), sel_iTunesStoreIdentifier);
  OUTLINED_FUNCTION_7();
}

id sub_1D715EB5C(_QWORD *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setITunesStoreIdentifier_, *a1);
}

char *keypath_get_selector_hasITunesStoreSubscriptionIdentifier()
{
  return sel_hasITunesStoreSubscriptionIdentifier;
}

void sub_1D715EB7C(uint64_t a1)
{
  _BYTE *v1;

  *v1 = objc_msgSend((id)OUTLINED_FUNCTION_1_3(a1), sel_hasITunesStoreSubscriptionIdentifier);
  OUTLINED_FUNCTION_7();
}

id sub_1D715EBA4(unsigned __int8 *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setHasITunesStoreSubscriptionIdentifier_, *a1);
}

char *keypath_get_selector_iTunesStoreSubscriptionIdentifier()
{
  return sel_iTunesStoreSubscriptionIdentifier;
}

void sub_1D715EBC4(uint64_t a1)
{
  _QWORD *v1;

  *v1 = objc_msgSend((id)OUTLINED_FUNCTION_1_3(a1), sel_iTunesStoreSubscriptionIdentifier);
  OUTLINED_FUNCTION_7();
}

id sub_1D715EBEC(_QWORD *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setITunesStoreSubscriptionIdentifier_, *a1);
}

char *keypath_get_selector_brandIdentifier()
{
  return sel_brandIdentifier;
}

void sub_1D715EC0C(id *a1, uint64_t a2, uint64_t a3)
{
  sub_1D715ABD0(a1, a2, a3, (SEL *)&selRef_brandIdentifier);
}

void sub_1D715EC28(uint64_t a1, uint64_t a2, uint64_t a3, int a4, uint64_t a5, int a6, int a7, int a8)
{
  sub_1D715AC1C(a1, a2, a3, a4, (int)&selRef_setBrandIdentifier_, a6, a7, a8);
}

char *keypath_get_selector_serviceIdentifier()
{
  return sel_serviceIdentifier;
}

void sub_1D715EC50(id *a1, uint64_t a2, uint64_t a3)
{
  sub_1D715ABD0(a1, a2, a3, (SEL *)&selRef_serviceIdentifier);
}

void sub_1D715EC6C(uint64_t a1, uint64_t a2, uint64_t a3, int a4, uint64_t a5, int a6, int a7, int a8)
{
  sub_1D715AC1C(a1, a2, a3, a4, (int)&selRef_setServiceIdentifier_, a6, a7, a8);
}

char *keypath_get_selector_hasLegacyUniqueIdentifier()
{
  return sel_hasLegacyUniqueIdentifier;
}

void sub_1D715EC94(uint64_t a1)
{
  _BYTE *v1;

  *v1 = objc_msgSend((id)OUTLINED_FUNCTION_1_3(a1), sel_hasLegacyUniqueIdentifier);
  OUTLINED_FUNCTION_7();
}

id sub_1D715ECBC(unsigned __int8 *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setHasLegacyUniqueIdentifier_, *a1);
}

char *keypath_get_selector_legacyUniqueIdentifier()
{
  return sel_legacyUniqueIdentifier;
}

void sub_1D715ECDC(uint64_t a1)
{
  _QWORD *v1;

  *v1 = objc_msgSend((id)OUTLINED_FUNCTION_1_3(a1), sel_legacyUniqueIdentifier);
  OUTLINED_FUNCTION_7();
}

id sub_1D715ED04(_QWORD *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setLegacyUniqueIdentifier_, *a1);
}

char *keypath_get_selector_hasAlwaysLive()
{
  return sel_hasAlwaysLive;
}

void sub_1D715ED24(uint64_t a1)
{
  _BYTE *v1;

  *v1 = objc_msgSend((id)OUTLINED_FUNCTION_1_3(a1), sel_hasAlwaysLive);
  OUTLINED_FUNCTION_7();
}

id sub_1D715ED4C(unsigned __int8 *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setHasAlwaysLive_, *a1);
}

char *keypath_get_selector_isAlwaysLive()
{
  return sel_isAlwaysLive;
}

void sub_1D715ED6C(uint64_t a1)
{
  _BYTE *v1;

  *v1 = objc_msgSend((id)OUTLINED_FUNCTION_1_3(a1), sel_isAlwaysLive);
  OUTLINED_FUNCTION_7();
}

id sub_1D715ED94(unsigned __int8 *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setAlwaysLive_, *a1);
}

char *keypath_get_selector_hasLoading()
{
  return sel_hasLoading;
}

void sub_1D715EDB4(uint64_t a1)
{
  _BYTE *v1;

  *v1 = objc_msgSend((id)OUTLINED_FUNCTION_1_3(a1), sel_hasLoading);
  OUTLINED_FUNCTION_7();
}

id sub_1D715EDDC(unsigned __int8 *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setHasLoading_, *a1);
}

char *keypath_get_selector_hasElapsedTime()
{
  return sel_hasElapsedTime;
}

void sub_1D715EDFC(uint64_t a1)
{
  _BYTE *v1;

  *v1 = objc_msgSend((id)OUTLINED_FUNCTION_1_3(a1), sel_hasElapsedTime);
  OUTLINED_FUNCTION_7();
}

id sub_1D715EE24(unsigned __int8 *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setHasElapsedTime_, *a1);
}

char *keypath_get_selector_playbackRate()
{
  return sel_playbackRate;
}

void sub_1D715EE44(uint64_t a1)
{
  _DWORD *v1;
  int v2;

  objc_msgSend((id)OUTLINED_FUNCTION_1_3(a1), sel_playbackRate);
  *v1 = v2;
  OUTLINED_FUNCTION_7();
}

id sub_1D715EE6C(_DWORD *a1, id *a2, double a3)
{
  LODWORD(a3) = *a1;
  return objc_msgSend(*a2, sel_setPlaybackRate_, a3);
}

char *keypath_get_selector_calculatedPlaybackPosition()
{
  return sel_calculatedPlaybackPosition;
}

void sub_1D715EE8C(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;

  objc_msgSend((id)OUTLINED_FUNCTION_1_3(a1), sel_calculatedPlaybackPosition);
  *v1 = v2;
  OUTLINED_FUNCTION_7();
}

char *keypath_get_selector_hasDuration()
{
  return sel_hasDuration;
}

void sub_1D715EEC0(uint64_t a1)
{
  _BYTE *v1;

  *v1 = objc_msgSend((id)OUTLINED_FUNCTION_1_3(a1), sel_hasDuration);
  OUTLINED_FUNCTION_7();
}

id sub_1D715EEE8(unsigned __int8 *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setHasDuration_, *a1);
}

char *keypath_get_selector_duration()
{
  return sel_duration;
}

void sub_1D715EF08(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;

  objc_msgSend((id)OUTLINED_FUNCTION_1_3(a1), sel_duration);
  *v1 = v2;
  OUTLINED_FUNCTION_7();
}

id sub_1D715EF30(double *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setDuration_, *a1);
}

char *keypath_get_selector_hasPlaybackRate()
{
  return sel_hasPlaybackRate;
}

void sub_1D715EF50(uint64_t a1)
{
  _BYTE *v1;

  *v1 = objc_msgSend((id)OUTLINED_FUNCTION_1_3(a1), sel_hasPlaybackRate);
  OUTLINED_FUNCTION_7();
}

id sub_1D715EF78(unsigned __int8 *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setHasPlaybackRate_, *a1);
}

char *keypath_get_selector_hasDefaultPlaybackRate()
{
  return sel_hasDefaultPlaybackRate;
}

void sub_1D715EF98(uint64_t a1)
{
  _BYTE *v1;

  *v1 = objc_msgSend((id)OUTLINED_FUNCTION_1_3(a1), sel_hasDefaultPlaybackRate);
  OUTLINED_FUNCTION_7();
}

id sub_1D715EFC0(unsigned __int8 *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setHasDefaultPlaybackRate_, *a1);
}

char *keypath_get_selector_defaultPlaybackRate()
{
  return sel_defaultPlaybackRate;
}

void sub_1D715EFE0(uint64_t a1)
{
  _DWORD *v1;
  int v2;

  objc_msgSend((id)OUTLINED_FUNCTION_1_3(a1), sel_defaultPlaybackRate);
  *v1 = v2;
  OUTLINED_FUNCTION_7();
}

id sub_1D715F008(_DWORD *a1, id *a2, double a3)
{
  LODWORD(a3) = *a1;
  return objc_msgSend(*a2, sel_setDefaultPlaybackRate_, a3);
}

char *keypath_get_selector_hasStartTime()
{
  return sel_hasStartTime;
}

void sub_1D715F028(uint64_t a1)
{
  _BYTE *v1;

  *v1 = objc_msgSend((id)OUTLINED_FUNCTION_1_3(a1), sel_hasStartTime);
  OUTLINED_FUNCTION_7();
}

id sub_1D715F050(unsigned __int8 *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setHasStartTime_, *a1);
}

char *keypath_get_selector_startTime()
{
  return sel_startTime;
}

void sub_1D715F070(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;

  objc_msgSend((id)OUTLINED_FUNCTION_1_3(a1), sel_startTime);
  *v1 = v2;
  OUTLINED_FUNCTION_7();
}

id sub_1D715F098(double *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setStartTime_, *a1);
}

char *keypath_get_selector_title()
{
  return sel_title;
}

void sub_1D715F0B8(id *a1, uint64_t a2, uint64_t a3)
{
  sub_1D715ABD0(a1, a2, a3, (SEL *)&selRef_title);
}

void sub_1D715F0D4(uint64_t a1, uint64_t a2, uint64_t a3, int a4, uint64_t a5, int a6, int a7, int a8)
{
  sub_1D715AC1C(a1, a2, a3, a4, (int)&selRef_setTitle_, a6, a7, a8);
}

char *keypath_get_selector_subtitle()
{
  return sel_subtitle;
}

void sub_1D715F0FC(id *a1, uint64_t a2, uint64_t a3)
{
  sub_1D715ABD0(a1, a2, a3, (SEL *)&selRef_subtitle);
}

void sub_1D715F118(uint64_t a1, uint64_t a2, uint64_t a3, int a4, uint64_t a5, int a6, int a7, int a8)
{
  sub_1D715AC1C(a1, a2, a3, a4, (int)&selRef_setSubtitle_, a6, a7, a8);
}

char *keypath_get_selector_hasMediaType()
{
  return sel_hasMediaType;
}

void sub_1D715F140(uint64_t a1)
{
  _BYTE *v1;

  *v1 = objc_msgSend((id)OUTLINED_FUNCTION_1_3(a1), sel_hasMediaType);
  OUTLINED_FUNCTION_7();
}

id sub_1D715F168(unsigned __int8 *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setHasMediaType_, *a1);
}

char *keypath_get_selector_mediaType()
{
  return sel_mediaType;
}

void sub_1D715F188(uint64_t a1)
{
  _QWORD *v1;

  *v1 = objc_msgSend((id)OUTLINED_FUNCTION_1_3(a1), sel_mediaType);
  OUTLINED_FUNCTION_7();
}

id sub_1D715F1B0(_QWORD *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setMediaType_, *a1);
}

void sub_1D715F1C4(uint64_t *a1@<X0>, _QWORD *a2@<X8>)
{
  sub_1D7156F64(*a1, a2);
}

char *keypath_get_selector_hasMediaSubType()
{
  return sel_hasMediaSubType;
}

void sub_1D715F1D8(uint64_t a1)
{
  _BYTE *v1;

  *v1 = objc_msgSend((id)OUTLINED_FUNCTION_1_3(a1), sel_hasMediaSubType);
  OUTLINED_FUNCTION_7();
}

id sub_1D715F200(unsigned __int8 *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setHasMediaSubType_, *a1);
}

char *keypath_get_selector_mediaSubType()
{
  return sel_mediaSubType;
}

void sub_1D715F220(uint64_t a1)
{
  _QWORD *v1;

  *v1 = objc_msgSend((id)OUTLINED_FUNCTION_1_3(a1), sel_mediaSubType);
  OUTLINED_FUNCTION_7();
}

id sub_1D715F248(_QWORD *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setMediaSubType_, *a1);
}

void sub_1D715F25C(uint64_t *a1@<X0>, _QWORD *a2@<X8>)
{
  sub_1D7156F9C(*a1, a2);
}

char *keypath_get_selector_hasExplicitItem()
{
  return sel_hasExplicitItem;
}

void sub_1D715F270(uint64_t a1)
{
  _BYTE *v1;

  *v1 = objc_msgSend((id)OUTLINED_FUNCTION_1_3(a1), sel_hasExplicitItem);
  OUTLINED_FUNCTION_7();
}

id sub_1D715F298(unsigned __int8 *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setHasExplicitItem_, *a1);
}

char *keypath_get_selector_isExplicitItem()
{
  return sel_isExplicitItem;
}

void sub_1D715F2B8(uint64_t a1)
{
  _BYTE *v1;

  *v1 = objc_msgSend((id)OUTLINED_FUNCTION_1_3(a1), sel_isExplicitItem);
  OUTLINED_FUNCTION_7();
}

id sub_1D715F2E0(unsigned __int8 *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setExplicitItem_, *a1);
}

char *keypath_get_selector_hasAdvertisement()
{
  return sel_hasAdvertisement;
}

void sub_1D715F300(uint64_t a1)
{
  _BYTE *v1;

  *v1 = objc_msgSend((id)OUTLINED_FUNCTION_1_3(a1), sel_hasAdvertisement);
  OUTLINED_FUNCTION_7();
}

id sub_1D715F328(unsigned __int8 *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setHasAdvertisement_, *a1);
}

char *keypath_get_selector_isAdvertisement()
{
  return sel_isAdvertisement;
}

void sub_1D715F348(uint64_t a1)
{
  _BYTE *v1;

  *v1 = objc_msgSend((id)OUTLINED_FUNCTION_1_3(a1), sel_isAdvertisement);
  OUTLINED_FUNCTION_7();
}

id sub_1D715F370(unsigned __int8 *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setAdvertisement_, *a1);
}

char *keypath_get_selector_releaseDate()
{
  return sel_releaseDate;
}

uint64_t sub_1D715F390(id *a1, uint64_t a2, uint64_t a3)
{
  return sub_1D715AB64(a1, a2, a3, (SEL *)&selRef_releaseDate, MEMORY[0x1E0CB07E8], (uint64_t (*)(_QWORD))MEMORY[0x1E0CB0870]);
}

void sub_1D715F3BC(uint64_t a1, void **a2, uint64_t a3, uint64_t a4)
{
  sub_1D715AA7C(a1, a2, a3, a4, (uint64_t)&qword_1F00AF8C8, (uint64_t (*)(_QWORD))MEMORY[0x1E0CB0870], MEMORY[0x1E0CB06B8], (SEL *)&selRef_setReleaseDate_);
}

char *keypath_get_selector_localizedContentRating()
{
  return sel_localizedContentRating;
}

void sub_1D715F3FC(id *a1, uint64_t a2, uint64_t a3)
{
  sub_1D715ABD0(a1, a2, a3, (SEL *)&selRef_localizedContentRating);
}

void sub_1D715F418(uint64_t a1, uint64_t a2, uint64_t a3, int a4, uint64_t a5, int a6, int a7, int a8)
{
  sub_1D715AC1C(a1, a2, a3, a4, (int)&selRef_setLocalizedContentRating_, a6, a7, a8);
}

char *keypath_get_selector_trackArtistName()
{
  return sel_trackArtistName;
}

void sub_1D715F440(id *a1, uint64_t a2, uint64_t a3)
{
  sub_1D715ABD0(a1, a2, a3, (SEL *)&selRef_trackArtistName);
}

void sub_1D715F45C(uint64_t a1, uint64_t a2, uint64_t a3, int a4, uint64_t a5, int a6, int a7, int a8)
{
  sub_1D715AC1C(a1, a2, a3, a4, (int)&selRef_setTrackArtistName_, a6, a7, a8);
}

char *keypath_get_selector_genre()
{
  return sel_genre;
}

void sub_1D715F484(id *a1, uint64_t a2, uint64_t a3)
{
  sub_1D715ABD0(a1, a2, a3, (SEL *)&selRef_genre);
}

void sub_1D715F4A0(uint64_t a1, uint64_t a2, uint64_t a3, int a4, uint64_t a5, int a6, int a7, int a8)
{
  sub_1D715AC1C(a1, a2, a3, a4, (int)&selRef_setGenre_, a6, a7, a8);
}

char *keypath_get_selector_composer()
{
  return sel_composer;
}

void sub_1D715F4C8(id *a1, uint64_t a2, uint64_t a3)
{
  sub_1D715ABD0(a1, a2, a3, (SEL *)&selRef_composer);
}

void sub_1D715F4E4(uint64_t a1, uint64_t a2, uint64_t a3, int a4, uint64_t a5, int a6, int a7, int a8)
{
  sub_1D715AC1C(a1, a2, a3, a4, (int)&selRef_setComposer_, a6, a7, a8);
}

char *keypath_get_selector_classicalWork()
{
  return sel_classicalWork;
}

void sub_1D715F50C(id *a1, uint64_t a2, uint64_t a3)
{
  sub_1D715ABD0(a1, a2, a3, (SEL *)&selRef_classicalWork);
}

void sub_1D715F528(uint64_t a1, uint64_t a2, uint64_t a3, int a4, uint64_t a5, int a6, int a7, int a8)
{
  sub_1D715AC1C(a1, a2, a3, a4, (int)&selRef_setClassicalWork_, a6, a7, a8);
}

char *keypath_get_selector_hasDiscNumber()
{
  return sel_hasDiscNumber;
}

void sub_1D715F550(uint64_t a1)
{
  _BYTE *v1;

  *v1 = objc_msgSend((id)OUTLINED_FUNCTION_1_3(a1), sel_hasDiscNumber);
  OUTLINED_FUNCTION_7();
}

id sub_1D715F578(unsigned __int8 *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setHasDiscNumber_, *a1);
}

char *keypath_get_selector_discNumber()
{
  return sel_discNumber;
}

void sub_1D715F598(uint64_t a1)
{
  _QWORD *v1;

  *v1 = objc_msgSend((id)OUTLINED_FUNCTION_1_3(a1), sel_discNumber);
  OUTLINED_FUNCTION_7();
}

id sub_1D715F5C0(_QWORD *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setDiscNumber_, *a1);
}

char *keypath_get_selector_hasTotalDiscCount()
{
  return sel_hasTotalDiscCount;
}

void sub_1D715F5E0(uint64_t a1)
{
  _BYTE *v1;

  *v1 = objc_msgSend((id)OUTLINED_FUNCTION_1_3(a1), sel_hasTotalDiscCount);
  OUTLINED_FUNCTION_7();
}

id sub_1D715F608(unsigned __int8 *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setHasTotalDiscCount_, *a1);
}

char *keypath_get_selector_totalDiscCount()
{
  return sel_totalDiscCount;
}

void sub_1D715F628(uint64_t a1)
{
  _QWORD *v1;

  *v1 = objc_msgSend((id)OUTLINED_FUNCTION_1_3(a1), sel_totalDiscCount);
  OUTLINED_FUNCTION_7();
}

id sub_1D715F650(_QWORD *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setTotalDiscCount_, *a1);
}

char *keypath_get_selector_hasTrackNumber()
{
  return sel_hasTrackNumber;
}

void sub_1D715F670(uint64_t a1)
{
  _BYTE *v1;

  *v1 = objc_msgSend((id)OUTLINED_FUNCTION_1_3(a1), sel_hasTrackNumber);
  OUTLINED_FUNCTION_7();
}

id sub_1D715F698(unsigned __int8 *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setHasTrackNumber_, *a1);
}

char *keypath_get_selector_trackNumber()
{
  return sel_trackNumber;
}

void sub_1D715F6B8(uint64_t a1)
{
  _QWORD *v1;

  *v1 = objc_msgSend((id)OUTLINED_FUNCTION_1_3(a1), sel_trackNumber);
  OUTLINED_FUNCTION_7();
}

id sub_1D715F6E0(_QWORD *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setTrackNumber_, *a1);
}

char *keypath_get_selector_hasTotalTrackCount()
{
  return sel_hasTotalTrackCount;
}

void sub_1D715F700(uint64_t a1)
{
  _BYTE *v1;

  *v1 = objc_msgSend((id)OUTLINED_FUNCTION_1_3(a1), sel_hasTotalTrackCount);
  OUTLINED_FUNCTION_7();
}

id sub_1D715F728(unsigned __int8 *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setHasTotalTrackCount_, *a1);
}

char *keypath_get_selector_totalTrackCount()
{
  return sel_totalTrackCount;
}

void sub_1D715F748(uint64_t a1)
{
  _QWORD *v1;

  *v1 = objc_msgSend((id)OUTLINED_FUNCTION_1_3(a1), sel_totalTrackCount);
  OUTLINED_FUNCTION_7();
}

id sub_1D715F770(_QWORD *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setTotalTrackCount_, *a1);
}

char *keypath_get_selector_directorName()
{
  return sel_directorName;
}

void sub_1D715F790(id *a1, uint64_t a2, uint64_t a3)
{
  sub_1D715ABD0(a1, a2, a3, (SEL *)&selRef_directorName);
}

void sub_1D715F7AC(uint64_t a1, uint64_t a2, uint64_t a3, int a4, uint64_t a5, int a6, int a7, int a8)
{
  sub_1D715AC1C(a1, a2, a3, a4, (int)&selRef_setDirectorName_, a6, a7, a8);
}

char *keypath_get_selector_hasEpisodeType()
{
  return sel_hasEpisodeType;
}

void sub_1D715F7D4(uint64_t a1)
{
  _BYTE *v1;

  *v1 = objc_msgSend((id)OUTLINED_FUNCTION_1_3(a1), sel_hasEpisodeType);
  OUTLINED_FUNCTION_7();
}

id sub_1D715F7FC(unsigned __int8 *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setHasEpisodeType_, *a1);
}

char *keypath_get_selector_episodeType()
{
  return sel_episodeType;
}

void sub_1D715F81C(uint64_t a1)
{
  _QWORD *v1;

  *v1 = objc_msgSend((id)OUTLINED_FUNCTION_1_3(a1), sel_episodeType);
  OUTLINED_FUNCTION_7();
}

id sub_1D715F844(_QWORD *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setEpisodeType_, *a1);
}

void sub_1D715F858(uint64_t *a1@<X0>, _QWORD *a2@<X8>)
{
  sub_1D7156FD4(*a1, a2);
}

char *keypath_get_selector_seriesName()
{
  return sel_seriesName;
}

void sub_1D715F86C(id *a1, uint64_t a2, uint64_t a3)
{
  sub_1D715ABD0(a1, a2, a3, (SEL *)&selRef_seriesName);
}

void sub_1D715F888(uint64_t a1, uint64_t a2, uint64_t a3, int a4, uint64_t a5, int a6, int a7, int a8)
{
  sub_1D715AC1C(a1, a2, a3, a4, (int)&selRef_setSeriesName_, a6, a7, a8);
}

char *keypath_get_selector_hasEpisodeNumber()
{
  return sel_hasEpisodeNumber;
}

void sub_1D715F8B0(uint64_t a1)
{
  _BYTE *v1;

  *v1 = objc_msgSend((id)OUTLINED_FUNCTION_1_3(a1), sel_hasEpisodeNumber);
  OUTLINED_FUNCTION_7();
}

id sub_1D715F8D8(unsigned __int8 *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setHasEpisodeNumber_, *a1);
}

char *keypath_get_selector_episodeNumber()
{
  return sel_episodeNumber;
}

void sub_1D715F8F8(uint64_t a1)
{
  _QWORD *v1;

  *v1 = objc_msgSend((id)OUTLINED_FUNCTION_1_3(a1), sel_episodeNumber);
  OUTLINED_FUNCTION_7();
}

id sub_1D715F920(_QWORD *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setEpisodeNumber_, *a1);
}

char *keypath_get_selector_hasSeasonNumber()
{
  return sel_hasSeasonNumber;
}

void sub_1D715F940(uint64_t a1)
{
  _BYTE *v1;

  *v1 = objc_msgSend((id)OUTLINED_FUNCTION_1_3(a1), sel_hasSeasonNumber);
  OUTLINED_FUNCTION_7();
}

id sub_1D715F968(unsigned __int8 *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setHasSeasonNumber_, *a1);
}

char *keypath_get_selector_seasonNumber()
{
  return sel_seasonNumber;
}

void sub_1D715F988(uint64_t a1)
{
  _QWORD *v1;

  *v1 = objc_msgSend((id)OUTLINED_FUNCTION_1_3(a1), sel_seasonNumber);
  OUTLINED_FUNCTION_7();
}

id sub_1D715F9B0(_QWORD *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setSeasonNumber_, *a1);
}

char *keypath_get_selector_participantIdentifier()
{
  return sel_participantIdentifier;
}

void sub_1D715F9D0(id *a1, uint64_t a2, uint64_t a3)
{
  sub_1D715ABD0(a1, a2, a3, (SEL *)&selRef_participantIdentifier);
}

void sub_1D715F9EC(uint64_t a1, uint64_t a2, uint64_t a3, int a4, uint64_t a5, int a6, int a7, int a8)
{
  sub_1D715AC1C(a1, a2, a3, a4, (int)&selRef_setParticipantIdentifier_, a6, a7, a8);
}

char *keypath_get_selector_participantName()
{
  return sel_participantName;
}

void sub_1D715FA14(id *a1, uint64_t a2, uint64_t a3)
{
  sub_1D715ABD0(a1, a2, a3, (SEL *)&selRef_participantName);
}

void sub_1D715FA30(uint64_t a1, uint64_t a2, uint64_t a3, int a4, uint64_t a5, int a6, int a7, int a8)
{
  sub_1D715AC1C(a1, a2, a3, a4, (int)&selRef_setParticipantName_, a6, a7, a8);
}

char *keypath_get_selector_info()
{
  return sel_info;
}

void sub_1D715FA58(id *a1, uint64_t a2, uint64_t a3)
{
  sub_1D715ABD0(a1, a2, a3, (SEL *)&selRef_info);
}

void sub_1D715FA74(uint64_t a1, uint64_t a2, uint64_t a3, int a4, uint64_t a5, int a6, int a7, int a8)
{
  sub_1D715AC1C(a1, a2, a3, a4, (int)&selRef_setInfo_, a6, a7, a8);
}

char *keypath_get_selector_collectionIdentifier()
{
  return sel_collectionIdentifier;
}

void sub_1D715FA9C(id *a1, uint64_t a2, uint64_t a3)
{
  sub_1D715ABD0(a1, a2, a3, (SEL *)&selRef_collectionIdentifier);
}

void sub_1D715FAB8(uint64_t a1, uint64_t a2, uint64_t a3, int a4, uint64_t a5, int a6, int a7, int a8)
{
  sub_1D715AC1C(a1, a2, a3, a4, (int)&selRef_setCollectionIdentifier_, a6, a7, a8);
}

char *keypath_get_selector_radioStationString()
{
  return sel_radioStationString;
}

void sub_1D715FAE0(id *a1, uint64_t a2, uint64_t a3)
{
  sub_1D715ABD0(a1, a2, a3, (SEL *)&selRef_radioStationString);
}

void sub_1D715FAFC(uint64_t a1, uint64_t a2, uint64_t a3, int a4, uint64_t a5, int a6, int a7, int a8)
{
  sub_1D715AC1C(a1, a2, a3, a4, (int)&selRef_setRadioStationString_, a6, a7, a8);
}

char *keypath_get_selector_hasRadioStationIdentifier()
{
  return sel_hasRadioStationIdentifier;
}

void sub_1D715FB24(uint64_t a1)
{
  _BYTE *v1;

  *v1 = objc_msgSend((id)OUTLINED_FUNCTION_1_3(a1), sel_hasRadioStationIdentifier);
  OUTLINED_FUNCTION_7();
}

id sub_1D715FB4C(unsigned __int8 *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setHasRadioStationIdentifier_, *a1);
}

char *keypath_get_selector_radioStationIdentifier()
{
  return sel_radioStationIdentifier;
}

void sub_1D715FB6C(uint64_t a1)
{
  _QWORD *v1;

  *v1 = objc_msgSend((id)OUTLINED_FUNCTION_1_3(a1), sel_radioStationIdentifier);
  OUTLINED_FUNCTION_7();
}

id sub_1D715FB94(_QWORD *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setRadioStationIdentifier_, *a1);
}

char *keypath_get_selector_radioStationName()
{
  return sel_radioStationName;
}

void sub_1D715FBB4(id *a1, uint64_t a2, uint64_t a3)
{
  sub_1D715ABD0(a1, a2, a3, (SEL *)&selRef_radioStationName);
}

void sub_1D715FBD0(uint64_t a1, uint64_t a2, uint64_t a3, int a4, uint64_t a5, int a6, int a7, int a8)
{
  sub_1D715AC1C(a1, a2, a3, a4, (int)&selRef_setRadioStationName_, a6, a7, a8);
}

char *keypath_get_selector_albumName()
{
  return sel_albumName;
}

void sub_1D715FBF8(id *a1, uint64_t a2, uint64_t a3)
{
  sub_1D715ABD0(a1, a2, a3, (SEL *)&selRef_albumName);
}

void sub_1D715FC14(uint64_t a1, uint64_t a2, uint64_t a3, int a4, uint64_t a5, int a6, int a7, int a8)
{
  sub_1D715AC1C(a1, a2, a3, a4, (int)&selRef_setAlbumName_, a6, a7, a8);
}

char *keypath_get_selector_albumArtistName()
{
  return sel_albumArtistName;
}

void sub_1D715FC3C(id *a1, uint64_t a2, uint64_t a3)
{
  sub_1D715ABD0(a1, a2, a3, (SEL *)&selRef_albumArtistName);
}

void sub_1D715FC58(uint64_t a1, uint64_t a2, uint64_t a3, int a4, uint64_t a5, int a6, int a7, int a8)
{
  sub_1D715AC1C(a1, a2, a3, a4, (int)&selRef_setAlbumArtistName_, a6, a7, a8);
}

char *keypath_get_selector_hasPlaylistType()
{
  return sel_hasPlaylistType;
}

void sub_1D715FC80(uint64_t a1)
{
  _BYTE *v1;

  *v1 = objc_msgSend((id)OUTLINED_FUNCTION_1_3(a1), sel_hasPlaylistType);
  OUTLINED_FUNCTION_7();
}

id sub_1D715FCA8(unsigned __int8 *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setHasPlaylistType_, *a1);
}

char *keypath_get_selector_playlistType()
{
  return sel_playlistType;
}

void sub_1D715FCC8(uint64_t a1)
{
  _QWORD *v1;

  *v1 = objc_msgSend((id)OUTLINED_FUNCTION_1_3(a1), sel_playlistType);
  OUTLINED_FUNCTION_7();
}

id sub_1D715FCF0(_QWORD *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setPlaylistType_, *a1);
}

void sub_1D715FD04(uint64_t *a1@<X0>, _QWORD *a2@<X8>)
{
  sub_1D715700C(*a1, a2);
}

char *keypath_get_selector_hasRadioStationType()
{
  return sel_hasRadioStationType;
}

void sub_1D715FD18(uint64_t a1)
{
  _BYTE *v1;

  *v1 = objc_msgSend((id)OUTLINED_FUNCTION_1_3(a1), sel_hasRadioStationType);
  OUTLINED_FUNCTION_7();
}

id sub_1D715FD40(unsigned __int8 *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setHasRadioStationType_, *a1);
}

char *keypath_get_selector_radioStationType()
{
  return sel_radioStationType;
}

void sub_1D715FD60(uint64_t a1)
{
  _QWORD *v1;

  *v1 = objc_msgSend((id)OUTLINED_FUNCTION_1_3(a1), sel_radioStationType);
  OUTLINED_FUNCTION_7();
}

id sub_1D715FD88(_QWORD *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setRadioStationType_, *a1);
}

void sub_1D715FD9C(uint64_t *a1@<X0>, _QWORD *a2@<X8>)
{
  sub_1D7157044(*a1, a2);
}

char *keypath_get_selector_albumYear()
{
  return sel_albumYear;
}

void sub_1D715FDB0(id *a1, uint64_t a2, uint64_t a3)
{
  sub_1D715ABD0(a1, a2, a3, (SEL *)&selRef_albumYear);
}

void sub_1D715FDCC(uint64_t a1, uint64_t a2, uint64_t a3, int a4, uint64_t a5, int a6, int a7, int a8)
{
  sub_1D715AC1C(a1, a2, a3, a4, (int)&selRef_setAlbumYear_, a6, a7, a8);
}

char *keypath_get_selector_collectionInfo()
{
  return sel_collectionInfo;
}

void sub_1D715FDF4(id *a1, uint64_t a2, uint64_t a3)
{
  sub_1D715AC64(a1, a2, a3, (SEL *)&selRef_collectionInfo);
}

void sub_1D715FE10(uint64_t *a1, int a2, uint64_t a3, int a4, uint64_t a5, int a6, int a7, int a8)
{
  sub_1D715ACC4(a1, a2, a3, a4, (int)&selRef_setCollectionInfo_, a6, a7, a8);
}

char *keypath_get_selector_assetURL()
{
  return sel_assetURL;
}

uint64_t sub_1D715FE38(id *a1, uint64_t a2, uint64_t a3)
{
  return sub_1D715AB64(a1, a2, a3, (SEL *)&selRef_assetURL, MEMORY[0x1E0CAFF00], (uint64_t (*)(_QWORD))MEMORY[0x1E0CAFFF8]);
}

void sub_1D715FE64(uint64_t a1, void **a2, uint64_t a3, uint64_t a4)
{
  sub_1D715AA7C(a1, a2, a3, a4, (uint64_t)&unk_1F00AF950, (uint64_t (*)(_QWORD))MEMORY[0x1E0CAFFF8], MEMORY[0x1E0CAFE38], (SEL *)&selRef_setAssetURL_);
}

char *keypath_get_selector_lyricsURL()
{
  return sel_lyricsURL;
}

uint64_t sub_1D715FEA4(id *a1, uint64_t a2, uint64_t a3)
{
  return sub_1D715AB64(a1, a2, a3, (SEL *)&selRef_lyricsURL, MEMORY[0x1E0CAFF00], (uint64_t (*)(_QWORD))MEMORY[0x1E0CAFFF8]);
}

void sub_1D715FED0(uint64_t a1, void **a2, uint64_t a3, uint64_t a4)
{
  sub_1D715AA7C(a1, a2, a3, a4, (uint64_t)&unk_1F00AF950, (uint64_t (*)(_QWORD))MEMORY[0x1E0CAFFF8], MEMORY[0x1E0CAFE38], (SEL *)&selRef_setLyricsURL_);
}

char *keypath_get_selector_artworkIdentifier()
{
  return sel_artworkIdentifier;
}

void sub_1D715FF10(id *a1, uint64_t a2, uint64_t a3)
{
  sub_1D715ABD0(a1, a2, a3, (SEL *)&selRef_artworkIdentifier);
}

void sub_1D715FF2C(uint64_t a1, uint64_t a2, uint64_t a3, int a4, uint64_t a5, int a6, int a7, int a8)
{
  sub_1D715AC1C(a1, a2, a3, a4, (int)&selRef_setArtworkIdentifier_, a6, a7, a8);
}

char *keypath_get_selector_artworkURL()
{
  return sel_artworkURL;
}

uint64_t sub_1D715FF54(id *a1, uint64_t a2, uint64_t a3)
{
  return sub_1D715AB64(a1, a2, a3, (SEL *)&selRef_artworkURL, MEMORY[0x1E0CAFF00], (uint64_t (*)(_QWORD))MEMORY[0x1E0CAFFF8]);
}

void sub_1D715FF80(uint64_t a1, void **a2, uint64_t a3, uint64_t a4)
{
  sub_1D715AA7C(a1, a2, a3, a4, (uint64_t)&unk_1F00AF950, (uint64_t (*)(_QWORD))MEMORY[0x1E0CAFFF8], MEMORY[0x1E0CAFE38], (SEL *)&selRef_setArtworkURL_);
}

char *keypath_get_selector_artworkFileURL()
{
  return sel_artworkFileURL;
}

uint64_t sub_1D715FFC0(id *a1, uint64_t a2, uint64_t a3)
{
  return sub_1D715AB64(a1, a2, a3, (SEL *)&selRef_artworkFileURL, MEMORY[0x1E0CAFF00], (uint64_t (*)(_QWORD))MEMORY[0x1E0CAFFF8]);
}

void sub_1D715FFEC(uint64_t a1, void **a2, uint64_t a3, uint64_t a4)
{
  sub_1D715AA7C(a1, a2, a3, a4, (uint64_t)&unk_1F00AF950, (uint64_t (*)(_QWORD))MEMORY[0x1E0CAFFF8], MEMORY[0x1E0CAFE38], (SEL *)&selRef_setArtworkFileURL_);
}

char *keypath_get_selector_artworkMIMEType()
{
  return sel_artworkMIMEType;
}

void sub_1D716002C(id *a1, uint64_t a2, uint64_t a3)
{
  sub_1D715ABD0(a1, a2, a3, (SEL *)&selRef_artworkMIMEType);
}

void sub_1D7160048(uint64_t a1, uint64_t a2, uint64_t a3, int a4, uint64_t a5, int a6, int a7, int a8)
{
  sub_1D715AC1C(a1, a2, a3, a4, (int)&selRef_setArtworkMIMEType_, a6, a7, a8);
}

char *keypath_get_selector_userInfo()
{
  return sel_userInfo;
}

void sub_1D7160070(id *a1, uint64_t a2, uint64_t a3)
{
  sub_1D715AC64(a1, a2, a3, (SEL *)&selRef_userInfo);
}

void sub_1D716008C(uint64_t *a1, int a2, uint64_t a3, int a4, uint64_t a5, int a6, int a7, int a8)
{
  sub_1D715ACC4(a1, a2, a3, a4, (int)&selRef_setUserInfo_, a6, a7, a8);
}

char *keypath_get_selector_deviceSpecificUserInfo()
{
  return sel_deviceSpecificUserInfo;
}

void sub_1D71600B4(id *a1, uint64_t a2, uint64_t a3)
{
  sub_1D715AC64(a1, a2, a3, (SEL *)&selRef_deviceSpecificUserInfo);
}

void sub_1D71600D0(uint64_t *a1, int a2, uint64_t a3, int a4, uint64_t a5, int a6, int a7, int a8)
{
  sub_1D715ACC4(a1, a2, a3, a4, (int)&selRef_setDeviceSpecificUserInfo_, a6, a7, a8);
}

void sub_1D71600EC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;

  sub_1D715D498(0, a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, a1, v5);
  OUTLINED_FUNCTION_7();
}

uint64_t sub_1D7160134(uint64_t a1, uint64_t a2)
{
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(MEMORY[0x1E0DEC198] - 8) + 16))(a2, a1);
  return a2;
}

uint64_t sub_1D7160170(uint64_t a1)
{
  uint64_t v2;

  sub_1D71601AC();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

void sub_1D71601AC()
{
  unint64_t TupleTypeMetadata2;
  uint64_t v1;

  if (!qword_1F00AFA28)
  {
    TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
    if (!v1)
      atomic_store(TupleTypeMetadata2, (unint64_t *)&qword_1F00AFA28);
  }
}

uint64_t sub_1D716020C()
{
  return swift_release();
}

void sub_1D7160214(uint64_t a1, unint64_t *a2)
{
  if (!*a2)
  {
    objc_opt_self();
    atomic_store(swift_getObjCClassMetadata(), a2);
  }
  OUTLINED_FUNCTION_7();
}

uint64_t sub_1D7160248()
{
  return objectdestroy_349Tm((uint64_t)&unk_1F00AFA38);
}

uint64_t sub_1D7160264(uint64_t a1)
{
  void *v1;

  OUTLINED_FUNCTION_58(a1, (uint64_t)&unk_1F00AFA38);
  v1 = (void *)OUTLINED_FUNCTION_31_1();
  return sub_1D71583A0(v1);
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

unint64_t sub_1D71602B8()
{
  unint64_t result;

  result = qword_1F00AFA40;
  if (!qword_1F00AFA40)
  {
    result = MEMORY[0x1D82937B8](&unk_1D7163638, &unk_1E9BE5C68);
    atomic_store(result, (unint64_t *)&qword_1F00AFA40);
  }
  return result;
}

void sub_1D71602F4(uint64_t a1, unint64_t *a2, uint64_t a3, uint64_t a4, uint64_t (*a5)(uint64_t, uint64_t, uint64_t))
{
  unint64_t v6;
  uint64_t v7;

  if (!*a2)
  {
    v6 = a5(a1, a3, MEMORY[0x1E0DEE9B8] + 8);
    if (!v7)
      atomic_store(v6, a2);
  }
  OUTLINED_FUNCTION_7();
}

uint64_t sub_1D7160344(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

unint64_t sub_1D7160380()
{
  unint64_t result;

  result = qword_1F00AFA50;
  if (!qword_1F00AFA50)
  {
    result = swift_getExistentialTypeMetadata();
    atomic_store(result, (unint64_t *)&qword_1F00AFA50);
  }
  return result;
}

void sub_1D71603C8()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_1F00AFA58)
  {
    sub_1D715E8EC(255, (uint64_t)&unk_1F00AF918);
    v0 = sub_1D7161064();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_1F00AFA58);
  }
}

uint64_t sub_1D7160444()
{
  uint64_t v0;

  sub_1D71603C8();
  OUTLINED_FUNCTION_11_3(v0);
  return OUTLINED_FUNCTION_28_0();
}

uint64_t sub_1D7160474()
{
  uint64_t v0;

  sub_1D71603C8();
  v0 = OUTLINED_FUNCTION_31_1();
  return sub_1D7157A84(v0);
}

void sub_1D716049C(uint64_t a1, uint64_t a2)
{
  unint64_t *v2;
  uint64_t v3;
  unint64_t *v4;
  unint64_t v5;
  uint64_t v6;

  if (!OUTLINED_FUNCTION_66(a1, a2))
  {
    OUTLINED_FUNCTION_32_1(0, v3, v4);
    sub_1D71521B0(255, (unint64_t *)&qword_1ED56FB58);
    OUTLINED_FUNCTION_51();
    v5 = sub_1D7161064();
    if (!v6)
      atomic_store(v5, v2);
  }
  OUTLINED_FUNCTION_8();
}

uint64_t sub_1D7160500()
{
  return objectdestroy_349Tm((uint64_t)&unk_1F00AFA60);
}

uint64_t objectdestroy_349Tm(uint64_t a1)
{
  uint64_t v1;

  OUTLINED_FUNCTION_58(a1, a1);
  OUTLINED_FUNCTION_11_3(v1);
  return OUTLINED_FUNCTION_28_0();
}

uint64_t sub_1D7160554(void *a1)
{
  OUTLINED_FUNCTION_58((uint64_t)a1, (uint64_t)&unk_1F00AFA60);
  return sub_1D7157698(a1);
}

unint64_t sub_1D71605B4()
{
  unint64_t result;

  result = qword_1F00AFA68;
  if (!qword_1F00AFA68)
  {
    result = MEMORY[0x1D82937B8](&protocol conformance descriptor for MRPlayerPath.Error, &type metadata for MRPlayerPath.Error);
    atomic_store(result, (unint64_t *)&qword_1F00AFA68);
  }
  return result;
}

uint64_t _s5ErrorOwet_0(unsigned int *a1, int a2)
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

uint64_t _s5ErrorOwst_0(uint64_t a1, int a2, int a3)
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
    return ((uint64_t (*)(void))((char *)sub_1D7160680 + 4 * byte_1D7161CB4[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_1D71606A0 + 4 * byte_1D7161CB9[v4]))();
}

_BYTE *sub_1D7160680(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_1D71606A0(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_1D71606A8(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_1D71606B0(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_1D71606B8(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_1D71606C0(_DWORD *result)
{
  *result = 0;
  return result;
}

void type metadata accessor for MediaRemoteCommand.Error()
{
  OUTLINED_FUNCTION_35_0();
}

unint64_t sub_1D71606DC()
{
  unint64_t result;

  result = qword_1F00AFA70;
  if (!qword_1F00AFA70)
  {
    result = MEMORY[0x1D82937B8](&unk_1D7163610, &unk_1E9BE5C68);
    atomic_store(result, (unint64_t *)&qword_1F00AFA70);
  }
  return result;
}

uint64_t OUTLINED_FUNCTION_1_3(uint64_t a1)
{
  return *(_QWORD *)a1;
}

void OUTLINED_FUNCTION_2_3(uint64_t a1, unint64_t *a2, uint64_t a3, uint64_t (*a4)(uint64_t, uint64_t))
{
  sub_1D7152354(0, a2, a3, a4);
}

uint64_t OUTLINED_FUNCTION_5_3(uint64_t result, uint64_t a2)
{
  uint64_t v2;

  *(_QWORD *)(v2 + 32) = result;
  *(_QWORD *)(v2 + 40) = a2;
  *(_QWORD *)(v2 + 48) = 0;
  *(_QWORD *)(v2 + 56) = 0;
  *(_BYTE *)(v2 + 64) = 0;
  return result;
}

uint64_t OUTLINED_FUNCTION_6_3()
{
  return _sSo14MSVSQLDatabaseC15MediaFoundationE22StatementInterpolationV06StringE0V13appendLiteralyySSF_0();
}

uint64_t OUTLINED_FUNCTION_8_3()
{
  uint64_t v0;

  return (*(uint64_t (**)(_QWORD))(v0 + 8))(*(_QWORD *)(v0 + 16));
}

uint64_t OUTLINED_FUNCTION_11_3(uint64_t a1)
{
  uint64_t v1;

  return (*(uint64_t (**)(unint64_t, uint64_t))(*(_QWORD *)(a1 - 8) + 8))(v1+ ((*(unsigned __int8 *)(*(_QWORD *)(a1 - 8) + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(a1 - 8) + 80)), a1);
}

uint64_t OUTLINED_FUNCTION_13_3()
{
  uint64_t v0;
  uint64_t v1;
  unint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  return sub_1D715D560(v3, v4, v0, v1, v5, v2);
}

id OUTLINED_FUNCTION_14_3(id *a1, uint64_t a2, uint64_t a3, SEL *a4)
{
  return objc_msgSend(*a1, *a4);
}

uint64_t OUTLINED_FUNCTION_15_3()
{
  return sub_1D7161184();
}

uint64_t OUTLINED_FUNCTION_16_3()
{
  return sub_1D7161370();
}

uint64_t OUTLINED_FUNCTION_17_2()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;

  return sub_1D715D62C(v0, v1, v2, v3, v4, v5);
}

void OUTLINED_FUNCTION_18_2()
{
  void *v0;

}

uint64_t OUTLINED_FUNCTION_19_2()
{
  uint64_t v0;
  uint64_t v1;
  unint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  return sub_1D715D62C(v3, v4, v0, v1, v5, v2);
}

uint64_t OUTLINED_FUNCTION_20_2()
{
  return swift_task_switch();
}

id OUTLINED_FUNCTION_22_2()
{
  void *v0;
  uint64_t v1;

  *(_QWORD *)(v1 - 136) = v0;
  return v0;
}

uint64_t OUTLINED_FUNCTION_24_1()
{
  return swift_task_switch();
}

uint64_t OUTLINED_FUNCTION_25_2()
{
  return sub_1D71612E0();
}

uint64_t OUTLINED_FUNCTION_26_2()
{
  return sub_1D7161388();
}

uint64_t OUTLINED_FUNCTION_28_0()
{
  return swift_deallocObject();
}

void OUTLINED_FUNCTION_29_1(id a1)
{

}

uint64_t OUTLINED_FUNCTION_30_1()
{
  return sub_1D7161310();
}

uint64_t OUTLINED_FUNCTION_31_1()
{
  uint64_t v0;

  return v0;
}

void OUTLINED_FUNCTION_32_1(uint64_t a1, uint64_t a2, unint64_t *a3)
{
  sub_1D7160214(255, a3);
}

void OUTLINED_FUNCTION_34_1()
{
  MediaRemoteCommand.Option.id.getter();
}

uint64_t OUTLINED_FUNCTION_35_1()
{
  return sub_1D716137C();
}

uint64_t OUTLINED_FUNCTION_36_1()
{
  return swift_bridgeObjectRetain();
}

uint64_t OUTLINED_FUNCTION_37_0()
{
  return sub_1D7160F38();
}

unint64_t OUTLINED_FUNCTION_38_0()
{
  return 0xD000000000000010;
}

uint64_t OUTLINED_FUNCTION_39_0()
{
  return swift_retain();
}

uint64_t OUTLINED_FUNCTION_40_0(uint64_t a1, int64_t a2)
{
  _QWORD *v2;

  return sub_1D7151664(a1, a2, 1, v2);
}

uint64_t OUTLINED_FUNCTION_41_0()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_43_0()
{
  return swift_getAtKeyPath();
}

uint64_t OUTLINED_FUNCTION_44()
{
  return 1701736270;
}

id OUTLINED_FUNCTION_45(int a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10)
{
  SEL *v10;
  void *v11;

  return objc_msgSend(v11, *v10);
}

uint64_t OUTLINED_FUNCTION_46()
{
  return 6710863;
}

uint64_t OUTLINED_FUNCTION_47()
{
  return 0x6E776F6E6B6E55;
}

uint64_t OUTLINED_FUNCTION_48()
{
  uint64_t v0;

  return v0;
}

uint64_t OUTLINED_FUNCTION_49(uint64_t result, uint64_t a2)
{
  uint64_t v2;

  *(_QWORD *)(v2 + 72) = result;
  *(_QWORD *)(v2 + 80) = a2;
  *(_QWORD *)(v2 + 88) = 0;
  *(_QWORD *)(v2 + 96) = 0;
  *(_BYTE *)(v2 + 104) = 0;
  return result;
}

uint64_t OUTLINED_FUNCTION_50()
{
  return swift_release();
}

uint64_t OUTLINED_FUNCTION_51()
{
  uint64_t v0;

  return v0;
}

uint64_t OUTLINED_FUNCTION_52(uint64_t a1, uint64_t a2, uint64_t a3, _QWORD *a4)
{
  return sub_1D7151664(0, 1, 1, a4);
}

uint64_t OUTLINED_FUNCTION_53()
{
  uint64_t v0;

  return v0 - 136;
}

uint64_t OUTLINED_FUNCTION_56()
{
  return swift_retain_n();
}

void OUTLINED_FUNCTION_57(uint64_t a1, uint64_t a2)
{
  sub_1D715D498(0, a2);
}

void OUTLINED_FUNCTION_58(uint64_t a1, uint64_t a2)
{
  sub_1D716049C(0, a2);
}

void OUTLINED_FUNCTION_59(uint64_t a1, unint64_t *a2)
{
  sub_1D7160214(0, a2);
}

uint64_t OUTLINED_FUNCTION_60()
{
  return sub_1D716137C();
}

uint64_t OUTLINED_FUNCTION_64()
{
  return sub_1D7160F20();
}

uint64_t OUTLINED_FUNCTION_65()
{
  return sub_1D716137C();
}

uint64_t OUTLINED_FUNCTION_66(uint64_t a1, uint64_t a2)
{
  return *(_QWORD *)a2;
}

uint64_t OUTLINED_FUNCTION_67()
{
  return swift_dynamicCast();
}

uint64_t OUTLINED_FUNCTION_70(uint64_t a1, int64_t a2)
{
  _QWORD *v2;

  return sub_1D7151664(a1, a2, 1, v2);
}

uint64_t OUTLINED_FUNCTION_72(uint64_t result, uint64_t a2)
{
  uint64_t v2;

  *(_QWORD *)(v2 + 32) = result;
  *(_QWORD *)(v2 + 40) = a2;
  *(_QWORD *)(v2 + 48) = 0;
  *(_QWORD *)(v2 + 56) = 0;
  *(_BYTE *)(v2 + 64) = 64;
  return result;
}

uint64_t OUTLINED_FUNCTION_73()
{
  return sub_1D7160F20();
}

uint64_t NSError.wrapWith<A>(domain:code:userInfo:debugDescription:)()
{
  return sub_1D714F59C(MEMORY[0x1E0DEE9D8], (void (*)(uint64_t *__return_ptr, uint64_t))sub_1D7160C90);
}

void sub_1D7160B40(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v11;

  v2 = (void *)objc_opt_self();
  v3 = (void *)sub_1D7160F14();
  sub_1D7160FC8();
  v4 = (void *)sub_1D7160E0C();
  sub_1D7153C90();
  v5 = (void *)sub_1D7160FD4();
  v6 = (void *)sub_1D7160ED8();
  v7 = (void *)sub_1D7160F14();
  v8 = objc_msgSend(v2, sel__msv_errorWithDomain_code_underlyingError_underlyingErrors_userInfo_debugDescriptionFormat_arguments_, v3, v11, v4, v5, v6, v7, a1);

  *a2 = v8;
}

void sub_1D7160C90()
{
  uint64_t v0;
  _QWORD *v1;

  OUTLINED_FUNCTION_0_2();
  sub_1D7160B40(v0, v1);
}

uint64_t sub_1D7160CB4(unint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  id v5;
  id v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t v10;

  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    v2 = sub_1D71612B0();
    swift_bridgeObjectRelease();
  }
  else
  {
    v2 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
  }
  v3 = MEMORY[0x1E0DEE9D8];
  if (!v2)
    return v3;
  v10 = MEMORY[0x1E0DEE9D8];
  sub_1D7151BC4(0, v2 & ~(v2 >> 63), 0);
  if ((v2 & 0x8000000000000000) == 0)
  {
    v4 = 0;
    v3 = v10;
    do
    {
      if ((a1 & 0xC000000000000001) != 0)
        v5 = (id)MEMORY[0x1D8293308](v4, a1);
      else
        v5 = *(id *)(a1 + 8 * v4 + 32);
      v6 = v5;
      v8 = *(_QWORD *)(v10 + 16);
      v7 = *(_QWORD *)(v10 + 24);
      if (v8 >= v7 >> 1)
        sub_1D7151BC4((_QWORD *)(v7 > 1), v8 + 1, 1);
      ++v4;
      *(_QWORD *)(v10 + 16) = v8 + 1;
      *(_QWORD *)(v10 + 8 * v8 + 32) = v6;
    }
    while (v2 != v4);
    return v3;
  }
  __break(1u);
  return sub_1D7160DDC();
}

uint64_t sub_1D7160DDC()
{
  return MEMORY[0x1E0CAE8D0]();
}

uint64_t sub_1D7160DE8()
{
  return MEMORY[0x1E0CAE8F0]();
}

uint64_t sub_1D7160DF4()
{
  return MEMORY[0x1E0CAE8F8]();
}

uint64_t sub_1D7160E00()
{
  return MEMORY[0x1E0CAF3E8]();
}

uint64_t sub_1D7160E0C()
{
  return MEMORY[0x1E0CAF980]();
}

uint64_t sub_1D7160E18()
{
  return MEMORY[0x1E0CAF990]();
}

uint64_t sub_1D7160E24()
{
  return MEMORY[0x1E0CAFFF8]();
}

uint64_t sub_1D7160E30()
{
  return MEMORY[0x1E0CB0160]();
}

uint64_t sub_1D7160E3C()
{
  return MEMORY[0x1E0CB0170]();
}

uint64_t sub_1D7160E48()
{
  return MEMORY[0x1E0CB0260]();
}

uint64_t sub_1D7160E54()
{
  return MEMORY[0x1E0CB02B0]();
}

uint64_t sub_1D7160E60()
{
  return MEMORY[0x1E0CB06B8]();
}

uint64_t sub_1D7160E6C()
{
  return MEMORY[0x1E0CB0870]();
}

uint64_t sub_1D7160E78()
{
  return MEMORY[0x1E0DF2068]();
}

uint64_t sub_1D7160E84()
{
  return MEMORY[0x1E0DF2050]();
}

uint64_t sub_1D7160E90()
{
  return MEMORY[0x1E0DF2058]();
}

uint64_t sub_1D7160E9C()
{
  return MEMORY[0x1E0DEF4F8]();
}

uint64_t sub_1D7160EA8()
{
  return MEMORY[0x1E0DEF560]();
}

uint64_t sub_1D7160EB4()
{
  return MEMORY[0x1E0DEF578]();
}

uint64_t sub_1D7160EC0()
{
  return MEMORY[0x1E0DEF5B0]();
}

uint64_t sub_1D7160ECC()
{
  return MEMORY[0x1E0DE9D70]();
}

uint64_t sub_1D7160ED8()
{
  return MEMORY[0x1E0CB17D8]();
}

uint64_t sub_1D7160EE4()
{
  return MEMORY[0x1E0CB1808]();
}

uint64_t sub_1D7160EF0()
{
  return MEMORY[0x1E0DE9E78]();
}

uint64_t sub_1D7160EFC()
{
  return MEMORY[0x1E0DEA3B0]();
}

uint64_t sub_1D7160F08()
{
  return MEMORY[0x1E0DEA3D0]();
}

uint64_t sub_1D7160F14()
{
  return MEMORY[0x1E0CB1940]();
}

uint64_t sub_1D7160F20()
{
  return MEMORY[0x1E0CB1980]();
}

uint64_t sub_1D7160F2C()
{
  return MEMORY[0x1E0CB19C0]();
}

uint64_t sub_1D7160F38()
{
  return MEMORY[0x1E0DEA5F8]();
}

uint64_t sub_1D7160F44()
{
  return MEMORY[0x1E0DEA668]();
}

uint64_t sub_1D7160F50()
{
  return MEMORY[0x1E0DEA688]();
}

uint64_t sub_1D7160F5C()
{
  return MEMORY[0x1E0DEA6F8]();
}

uint64_t sub_1D7160F68()
{
  return MEMORY[0x1E0DEA758]();
}

uint64_t sub_1D7160F74()
{
  return MEMORY[0x1E0DEA7B8]();
}

uint64_t sub_1D7160F80()
{
  return MEMORY[0x1E0DEA7D0]();
}

uint64_t _sSo14MSVSQLDatabaseC15MediaFoundationE22StatementInterpolationV06StringE0V13appendLiteralyySSF_0()
{
  return MEMORY[0x1E0DEA800]();
}

uint64_t sub_1D7160F98()
{
  return MEMORY[0x1E0DEA948]();
}

uint64_t sub_1D7160FA4()
{
  return MEMORY[0x1E0DEAA38]();
}

uint64_t sub_1D7160FB0()
{
  return MEMORY[0x1E0DEAA58]();
}

uint64_t sub_1D7160FBC()
{
  return MEMORY[0x1E0DEAA68]();
}

uint64_t sub_1D7160FC8()
{
  return MEMORY[0x1E0DEAC88]();
}

uint64_t sub_1D7160FD4()
{
  return MEMORY[0x1E0CB1AC0]();
}

uint64_t sub_1D7160FE0()
{
  return MEMORY[0x1E0CB1AE0]();
}

uint64_t sub_1D7160FEC()
{
  return MEMORY[0x1E0CB1AE8]();
}

uint64_t sub_1D7160FF8()
{
  return MEMORY[0x1E0DEADB8]();
}

uint64_t sub_1D7161004()
{
  return MEMORY[0x1E0DEADD8]();
}

uint64_t sub_1D7161010()
{
  return MEMORY[0x1E0DEAE60]();
}

uint64_t sub_1D716101C()
{
  return MEMORY[0x1E0DEAE80]();
}

uint64_t sub_1D7161028()
{
  return MEMORY[0x1E0DEAEB8]();
}

uint64_t sub_1D7161034()
{
  return MEMORY[0x1E0DEAEC8]();
}

uint64_t sub_1D7161040()
{
  return MEMORY[0x1E0DF05B8]();
}

uint64_t sub_1D716104C()
{
  return MEMORY[0x1E0DF05C8]();
}

uint64_t sub_1D7161058()
{
  return MEMORY[0x1E0DF05D0]();
}

uint64_t sub_1D7161064()
{
  return MEMORY[0x1E0DF05D8]();
}

uint64_t sub_1D7161070()
{
  return MEMORY[0x1E0DF05E0]();
}

uint64_t sub_1D716107C()
{
  return MEMORY[0x1E0DF0748]();
}

uint64_t sub_1D7161088()
{
  return MEMORY[0x1E0DF0750]();
}

uint64_t sub_1D7161094()
{
  return MEMORY[0x1E0DF0860]();
}

uint64_t sub_1D71610A0()
{
  return MEMORY[0x1E0DF0870]();
}

uint64_t sub_1D71610AC()
{
  return MEMORY[0x1E0DF08C8]();
}

uint64_t sub_1D71610B8()
{
  return MEMORY[0x1E0DEB4A0]();
}

uint64_t sub_1D71610C4()
{
  return MEMORY[0x1E0DEB528]();
}

uint64_t sub_1D71610D0()
{
  return MEMORY[0x1E0DEB560]();
}

uint64_t sub_1D71610DC()
{
  return MEMORY[0x1E0DEB5A8]();
}

uint64_t sub_1D71610E8()
{
  return MEMORY[0x1E0DEB660]();
}

uint64_t sub_1D71610F4()
{
  return MEMORY[0x1E0DEB848]();
}

uint64_t sub_1D7161100()
{
  return MEMORY[0x1E0CB1D38]();
}

uint64_t sub_1D716110C()
{
  return MEMORY[0x1E0CB1D40]();
}

uint64_t sub_1D7161118()
{
  return MEMORY[0x1E0CB1D90]();
}

uint64_t sub_1D7161124()
{
  return MEMORY[0x1E0DEF920]();
}

uint64_t sub_1D7161130()
{
  return MEMORY[0x1E0DEF988]();
}

uint64_t sub_1D716113C()
{
  return MEMORY[0x1E0DEF9F0]();
}

uint64_t sub_1D7161148()
{
  return MEMORY[0x1E0DEFA18]();
}

uint64_t sub_1D7161154()
{
  return MEMORY[0x1E0DEFA20]();
}

uint64_t sub_1D7161160()
{
  return MEMORY[0x1E0DEB940]();
}

uint64_t sub_1D716116C()
{
  return MEMORY[0x1E0DEBB68]();
}

uint64_t sub_1D7161178()
{
  return MEMORY[0x1E0DEBCB0]();
}

uint64_t sub_1D7161184()
{
  return MEMORY[0x1E0CB24A8]();
}

uint64_t sub_1D7161190()
{
  return MEMORY[0x1E0CB2578]();
}

uint64_t sub_1D716119C()
{
  return MEMORY[0x1E0DEBE30]();
}

uint64_t sub_1D71611A8()
{
  return MEMORY[0x1E0DEBE50]();
}

uint64_t sub_1D71611B4()
{
  return MEMORY[0x1E0DEC060]();
}

uint64_t sub_1D71611C0()
{
  return MEMORY[0x1E0DEC168]();
}

uint64_t sub_1D71611CC()
{
  return MEMORY[0x1E0DEC178]();
}

uint64_t sub_1D71611D8()
{
  return MEMORY[0x1E0DEC1B0]();
}

uint64_t sub_1D71611E4()
{
  return MEMORY[0x1E0DEC3E0]();
}

uint64_t sub_1D71611F0()
{
  return MEMORY[0x1E0DEC3E8]();
}

uint64_t sub_1D71611FC()
{
  return MEMORY[0x1E0DEC568]();
}

uint64_t sub_1D7161208()
{
  return MEMORY[0x1E0DEC570]();
}

uint64_t sub_1D7161214()
{
  return MEMORY[0x1E0DEC628]();
}

uint64_t sub_1D7161220()
{
  return MEMORY[0x1E0DF0B18]();
}

uint64_t sub_1D716122C()
{
  return MEMORY[0x1E0DF0B28]();
}

uint64_t sub_1D7161238()
{
  return MEMORY[0x1E0DF0B50]();
}

uint64_t sub_1D7161244()
{
  return MEMORY[0x1E0DF0B58]();
}

uint64_t sub_1D7161250()
{
  return MEMORY[0x1E0DF0B60]();
}

uint64_t sub_1D716125C()
{
  return MEMORY[0x1E0DF0B98]();
}

uint64_t sub_1D7161268()
{
  return MEMORY[0x1E0DF0BA0]();
}

uint64_t sub_1D7161274()
{
  return MEMORY[0x1E0DEC8B8]();
}

uint64_t sub_1D7161280()
{
  return MEMORY[0x1E0DEC8C8]();
}

uint64_t sub_1D716128C()
{
  return MEMORY[0x1E0DEC8D0]();
}

uint64_t sub_1D7161298()
{
  return MEMORY[0x1E0DECAE0]();
}

uint64_t sub_1D71612A4()
{
  return MEMORY[0x1E0DECB00]();
}

uint64_t sub_1D71612B0()
{
  return MEMORY[0x1E0DECD18]();
}

uint64_t sub_1D71612BC()
{
  return MEMORY[0x1E0DECD50]();
}

uint64_t sub_1D71612C8()
{
  return MEMORY[0x1E0DECEB0]();
}

uint64_t sub_1D71612D4()
{
  return MEMORY[0x1E0DECEB8]();
}

uint64_t sub_1D71612E0()
{
  return MEMORY[0x1E0DED1D0]();
}

uint64_t sub_1D71612EC()
{
  return MEMORY[0x1E0DED1E8]();
}

uint64_t sub_1D71612F8()
{
  return MEMORY[0x1E0DF0DD0]();
}

uint64_t sub_1D7161304()
{
  return MEMORY[0x1E0DED5F0]();
}

uint64_t sub_1D7161310()
{
  return MEMORY[0x1E0DED600]();
}

uint64_t sub_1D716131C()
{
  return MEMORY[0x1E0DF0EC0]();
}

uint64_t sub_1D7161328()
{
  return MEMORY[0x1E0DEDA20]();
}

uint64_t sub_1D7161334()
{
  return MEMORY[0x1E0DEDB10]();
}

uint64_t sub_1D7161340()
{
  return MEMORY[0x1E0DEDB18]();
}

uint64_t sub_1D716134C()
{
  return MEMORY[0x1E0DEDB20]();
}

uint64_t sub_1D7161358()
{
  return MEMORY[0x1E0DEDB28]();
}

uint64_t sub_1D7161364()
{
  return MEMORY[0x1E0DEDED8]();
}

uint64_t sub_1D7161370()
{
  return MEMORY[0x1E0DEDEF8]();
}

uint64_t sub_1D716137C()
{
  return MEMORY[0x1E0DEDF10]();
}

uint64_t sub_1D7161388()
{
  return MEMORY[0x1E0DEDF40]();
}

uint64_t sub_1D7161394()
{
  return MEMORY[0x1E0DEE200]();
}

uint64_t sub_1D71613A0()
{
  return MEMORY[0x1E0DEE210]();
}

uint64_t sub_1D71613AC()
{
  return MEMORY[0x1E0DEE298]();
}

uint64_t sub_1D71613B8()
{
  return MEMORY[0x1E0DEE780]();
}

uint64_t MRMediaRemoteCopyPlaybackQueueInsertionPositionDescription()
{
  return MEMORY[0x1E0D4BE90]();
}

uint64_t MRMediaRemoteGetAvailableOrigins()
{
  return MEMORY[0x1E0D4BEE0]();
}

uint64_t MRMediaRemoteNowPlayingResolvePlayerPath()
{
  return MEMORY[0x1E0D4BFB0]();
}

uint64_t MRMediaRemoteSendCommandToPlayerWithResult()
{
  return MEMORY[0x1E0D4C0C8]();
}

uint64_t MSVNanoIDCreateTaggedPointer()
{
  return MEMORY[0x1E0D4CF68]();
}

uint64_t MSVProcessIsDebugging()
{
  return MEMORY[0x1E0D4CF78]();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x1E0C80928](aBlock);
}

void _Block_release(const void *aBlock)
{
  MEMORY[0x1E0C80958](aBlock);
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x1E0C83050](__handle, __symbol);
}

int fflush(FILE *a1)
{
  return MEMORY[0x1E0C83370](a1);
}

void free(void *a1)
{
  MEMORY[0x1E0C834A8](a1);
}

int isatty(int a1)
{
  return MEMORY[0x1E0C839A8](*(_QWORD *)&a1);
}

int isprint(int _c)
{
  return MEMORY[0x1E0C839B0](*(_QWORD *)&_c);
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

uint64_t objc_opt_self()
{
  return MEMORY[0x1E0DE7D58]();
}

void objc_release(id a1)
{
  MEMORY[0x1E0DE7D78](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7E68](a1);
}

void (__cdecl *__cdecl signal(int a1, void (__cdecl *a2)(int)))(int)
{
  return (void (__cdecl *)(int))MEMORY[0x1E0C853F0](*(_QWORD *)&a1, a2);
}

uint64_t swift_allocBox()
{
  return MEMORY[0x1E0DEEA98]();
}

uint64_t swift_allocError()
{
  return MEMORY[0x1E0DEEAA8]();
}

uint64_t swift_allocObject()
{
  return MEMORY[0x1E0DEEAB0]();
}

uint64_t swift_arrayInitWithCopy()
{
  return MEMORY[0x1E0DEEAE0]();
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x1E0DEEB08]();
}

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x1E0DEEB18]();
}

uint64_t swift_deallocObject()
{
  return MEMORY[0x1E0DEEB60]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x1E0DEEB80]();
}

uint64_t swift_errorRelease()
{
  return MEMORY[0x1E0DEEBF0]();
}

uint64_t swift_errorRetain()
{
  return MEMORY[0x1E0DEEBF8]();
}

uint64_t swift_getAssociatedConformanceWitness()
{
  return MEMORY[0x1E0DEEC00]();
}

uint64_t swift_getAssociatedTypeWitness()
{
  return MEMORY[0x1E0DEEC08]();
}

uint64_t swift_getAtKeyPath()
{
  return MEMORY[0x1E0DEEC18]();
}

uint64_t swift_getExistentialTypeMetadata()
{
  return MEMORY[0x1E0DEEC60]();
}

uint64_t swift_getFunctionTypeMetadata0()
{
  return MEMORY[0x1E0DEEC90]();
}

uint64_t swift_getFunctionTypeMetadata1()
{
  return MEMORY[0x1E0DEEC98]();
}

uint64_t swift_getKeyPath()
{
  return MEMORY[0x1E0DEECB8]();
}

uint64_t swift_getObjCClassFromMetadata()
{
  return MEMORY[0x1E0DEECC8]();
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

uint64_t swift_initStackObject()
{
  return MEMORY[0x1E0DEED78]();
}

uint64_t swift_isUniquelyReferenced_nonNull_bridgeObject()
{
  return MEMORY[0x1E0DEEDC8]();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x1E0DEEDD0]();
}

uint64_t swift_once()
{
  return MEMORY[0x1E0DEEE00]();
}

uint64_t swift_release()
{
  return MEMORY[0x1E0DEEE30]();
}

uint64_t swift_retain()
{
  return MEMORY[0x1E0DEEE48]();
}

uint64_t swift_retain_n()
{
  return MEMORY[0x1E0DEEE50]();
}

uint64_t swift_task_alloc()
{
  return MEMORY[0x1E0DF1000]();
}

uint64_t swift_task_create()
{
  return MEMORY[0x1E0DF1008]();
}

uint64_t swift_task_dealloc()
{
  return MEMORY[0x1E0DF1010]();
}

uint64_t swift_task_switch()
{
  return MEMORY[0x1E0DF1050]();
}

uint64_t swift_unexpectedError()
{
  return MEMORY[0x1E0DEEEB8]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x1E0DEEEC0]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x1E0DEEED0]();
}

uint64_t swift_willThrow()
{
  return MEMORY[0x1E0DEEFC0]();
}

