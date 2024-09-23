uint64_t initializeBufferWithCopyOfBuffer for AccountLoginView(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_QWORD *)(a1 + 16) = v3;
  swift_retain();
  return a1;
}

uint64_t destroy for AccountLoginView()
{
  return swift_release();
}

_QWORD *assignWithCopy for AccountLoginView(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;

  *a1 = *a2;
  v3 = a2[2];
  a1[1] = a2[1];
  a1[2] = v3;
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

uint64_t assignWithTake for AccountLoginView(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_QWORD *)(a1 + 16) = v3;
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for AccountLoginView(uint64_t *a1, int a2)
{
  uint64_t v2;

  if (a2)
  {
    if (a2 < 0 && *((_BYTE *)a1 + 24))
    {
      LODWORD(v2) = *(_DWORD *)a1 + 0x7FFFFFFF;
    }
    else
    {
      v2 = *a1;
      if ((unint64_t)*a1 >= 0xFFFFFFFF)
        LODWORD(v2) = -1;
    }
  }
  else
  {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for AccountLoginView(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for AccountLoginView()
{
  return &type metadata for AccountLoginView;
}

void type metadata accessor for Code(uint64_t a1)
{
  sub_21EB6702C(a1, &qword_255477718);
}

void _s3__C4CodeOMa_0(uint64_t a1)
{
  sub_21EB6702C(a1, &qword_255477720);
}

void type metadata accessor for WKNavigationActionPolicy(uint64_t a1)
{
  sub_21EB6702C(a1, &qword_255477728);
}

uint64_t sub_21EB63734@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t *a4@<X8>)
{
  uint64_t result;
  uint64_t v8;

  result = dynamic_cast_existential_1_conditional(a1);
  if (result)
    result = (*(uint64_t (**)(uint64_t, uint64_t))(v8 + 8))(a2, a3);
  *a4 = result;
  return result;
}

uint64_t sub_21EB63794@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(a2 - 8) + 16))(a3, a1);
}

uint64_t sub_21EB637B4()
{
  return sub_21EBB78D8();
}

uint64_t sub_21EB637CC@<X0>(uint64_t *a1@<X8>)
{
  uint64_t *v1;

  return sub_21EB63734(*v1, v1[1], v1[2], a1);
}

void sub_21EB637D8(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD v6[22];

  v6[7] = a2;
  v3 = sub_21EBB7818();
  v6[6] = *(_QWORD *)(v3 - 8);
  v6[0] = v3;
  MEMORY[0x24BDAC7A8](v3);
  v5 = *(_QWORD *)(a1 + 24);
  v6[3] = *(_QWORD *)(a1 + 16);
  v6[4] = (char *)v6 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6[2] = v5;
  sub_21EBB7848();
  sub_21EBB7788();
  sub_21EBB79B0();
  OUTLINED_FUNCTION_6();
}

void sub_21EB63894(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  *(_QWORD *)(v4 - 104) = v1;
  *(_QWORD *)(v4 - 96) = a1;
  *(_QWORD *)(v4 - 112) = MEMORY[0x2207B8330](MEMORY[0x24BDEF3E0], v2, v4 - 104);
  v5 = MEMORY[0x2207B8330](MEMORY[0x24BDF3F50], v3, v4 - 112);
  *(_QWORD *)(v4 - 144) = v3;
  *(_QWORD *)(v4 - 136) = v5;
  OUTLINED_FUNCTION_2();
}

void sub_21EB638E4(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;

  *(_QWORD *)(v3 - 144) = v2;
  *(_QWORD *)(v3 - 136) = v1;
  v5 = OUTLINED_FUNCTION_1();
  v6 = sub_21EB67308();
  v7 = MEMORY[0x24BEE0D00];
  *(_QWORD *)(v3 - 144) = a1;
  *(_QWORD *)(v3 - 136) = v7;
  *(_QWORD *)(v3 - 128) = v5;
  *(_QWORD *)(v3 - 120) = v6;
  OUTLINED_FUNCTION_2();
}

void sub_21EB6392C(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v7 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_255477950);
  *(_QWORD *)(v5 - 144) = v4;
  *(_QWORD *)(v5 - 136) = v2;
  *(_QWORD *)(v5 - 128) = v1;
  *(_QWORD *)(v5 - 120) = v3;
  v8 = OUTLINED_FUNCTION_1();
  sub_21EB67618(&qword_255477958, &qword_255477950);
  *(_QWORD *)(v5 - 144) = a1;
  *(_QWORD *)(v5 - 136) = v7;
  *(_QWORD *)(v5 - 128) = v8;
  *(_QWORD *)(v5 - 120) = v9;
  OUTLINED_FUNCTION_2();
}

void sub_21EB63998()
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

  *(_QWORD *)(v5 - 144) = v4;
  *(_QWORD *)(v5 - 136) = v3;
  *(_QWORD *)(v5 - 128) = v0;
  *(_QWORD *)(v5 - 120) = v2;
  OUTLINED_FUNCTION_1();
  v6 = sub_21EBB75A8();
  *(_QWORD *)(v5 - 248) = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v7 = MEMORY[0x2207B8330](MEMORY[0x24BDEC988], v6);
  sub_21EB65BBC(&qword_255477960, (void (*)(uint64_t))MEMORY[0x24BDF0620]);
  *(_QWORD *)(v5 - 144) = v6;
  *(_QWORD *)(v5 - 136) = v1;
  *(_QWORD *)(v5 - 128) = v7;
  *(_QWORD *)(v5 - 120) = v8;
  OUTLINED_FUNCTION_2();
}

void sub_21EB63A44(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void (*v22)(char *, char *, uint64_t);
  void (*v23)(char *, uint64_t);

  v13 = *(_QWORD *)(a1 - 8);
  v14 = MEMORY[0x24BDAC7A8](a1);
  v16 = (char *)&a9 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v14);
  v18 = (char *)&a9 - v17;
  v19 = *(_QWORD *)(v11 - 240);
  *(_QWORD *)(v11 - 176) = *(_QWORD *)(v11 - 232);
  *(_QWORD *)(v11 - 168) = v19;
  *(_QWORD *)(v11 - 160) = *(_QWORD *)(v11 - 216);
  sub_21EBB759C();
  v20 = *(_QWORD *)(v11 - 224);
  sub_21EBB780C();
  v21 = *(_QWORD *)(v11 - 256);
  sub_21EBB7884();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v11 - 208) + 8))(v20, v21);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v11 - 248) + 8))(v10, v9);
  v22 = *(void (**)(char *, char *, uint64_t))(v13 + 16);
  v22(v18, v16, a1);
  v23 = *(void (**)(char *, uint64_t))(v13 + 8);
  v23(v16, a1);
  v22(*(char **)(v11 - 200), v18, a1);
  v23(v18, a1);
  OUTLINED_FUNCTION_3();
}

uint64_t sub_21EB63B64@<X0>(_OWORD *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, char *a4@<X8>)
{
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
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t OpaqueTypeConformance2;
  unint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  unint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  char *v32;
  uint64_t v33;
  char *v34;
  _OWORD *v35;
  uint64_t v36;
  char *v37;
  uint64_t v38;
  char *v39;
  uint64_t v40;
  char *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  void (*v45)(char *, char *, uint64_t);
  void (*v46)(char *, uint64_t);
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  unint64_t v51;
  uint64_t v52;
  uint64_t v53;
  unint64_t v54;
  uint64_t v55;
  uint64_t v56;
  char *v57;
  char *v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  char *v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  _OWORD *v69;
  char *v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  _OWORD *v74;
  uint64_t v75;
  uint64_t v76;
  _OWORD *v77;
  __int128 v78;
  uint64_t v79;
  unint64_t v80;
  uint64_t v81;
  _QWORD v82[2];

  v71 = a2;
  v69 = a1;
  v70 = a4;
  v67 = sub_21EBB76BC();
  v64 = *(_QWORD *)(v67 - 8);
  MEMORY[0x24BDAC7A8](v67);
  v63 = (char *)&v48 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = a3;
  v7 = sub_21EBB7848();
  v8 = sub_21EBB7788();
  v59 = v8;
  v9 = sub_21EBB79B0();
  v68 = *(_QWORD *)(v9 - 8);
  MEMORY[0x24BDAC7A8](v9);
  v11 = (char *)&v48 - v10;
  v12 = MEMORY[0x2207B8330](MEMORY[0x24BDF1988], v7);
  v82[0] = v6;
  v82[1] = v12;
  v13 = v6;
  v48 = v6;
  v62 = MEMORY[0x2207B8330](MEMORY[0x24BDEF3E0], v8, v82);
  v81 = v62;
  v14 = MEMORY[0x2207B8330](MEMORY[0x24BDF3F50], v9, &v81);
  *(_QWORD *)&v78 = v9;
  *((_QWORD *)&v78 + 1) = v14;
  v15 = v9;
  v60 = v9;
  v16 = v14;
  v61 = v14;
  v17 = MEMORY[0x2207B82F4](0, &v78, MEMORY[0x24BDF33A8], 0);
  v66 = *(_QWORD *)(v17 - 8);
  v18 = v17;
  MEMORY[0x24BDAC7A8](v17);
  v58 = (char *)&v48 - v19;
  *(_QWORD *)&v78 = v15;
  *((_QWORD *)&v78 + 1) = v16;
  OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
  v21 = sub_21EB67308();
  v22 = MEMORY[0x24BEE0D00];
  *(_QWORD *)&v78 = v18;
  *((_QWORD *)&v78 + 1) = MEMORY[0x24BEE0D00];
  v50 = v18;
  v79 = OpaqueTypeConformance2;
  v80 = v21;
  v52 = OpaqueTypeConformance2;
  v51 = v21;
  v23 = MEMORY[0x2207B82F4](0, &v78, MEMORY[0x24BDF28C0], 0);
  v65 = *(_QWORD *)(v23 - 8);
  v24 = v23;
  v53 = v23;
  MEMORY[0x24BDAC7A8](v23);
  v57 = (char *)&v48 - v25;
  v26 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_255477950);
  v56 = v26;
  *(_QWORD *)&v78 = v18;
  *((_QWORD *)&v78 + 1) = v22;
  v79 = OpaqueTypeConformance2;
  v80 = v21;
  v27 = swift_getOpaqueTypeConformance2();
  v55 = v27;
  sub_21EB67618(&qword_255477958, &qword_255477950);
  v54 = v28;
  *(_QWORD *)&v78 = v24;
  *((_QWORD *)&v78 + 1) = v26;
  v79 = v27;
  v80 = v28;
  v29 = MEMORY[0x2207B82F4](0, &v78, MEMORY[0x24BDF3858], 0);
  v49 = *(_QWORD *)(v29 - 8);
  v30 = MEMORY[0x24BDAC7A8](v29);
  v32 = (char *)&v48 - ((v31 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v30);
  v34 = (char *)&v48 - v33;
  v75 = v71;
  v76 = v13;
  v35 = v69;
  v77 = v69;
  sub_21EBB79A4();
  v36 = v64;
  v37 = v63;
  v38 = v67;
  (*(void (**)(char *, _QWORD, uint64_t))(v64 + 104))(v63, *MEMORY[0x24BDEE5F0], v67);
  v39 = v58;
  v40 = v60;
  sub_21EBB7908();
  (*(void (**)(char *, uint64_t))(v36 + 8))(v37, v38);
  (*(void (**)(char *, uint64_t))(v68 + 8))(v11, v40);
  v78 = *v35;
  v41 = v57;
  v42 = v50;
  sub_21EBB78E4();
  (*(void (**)(char *, uint64_t))(v66 + 8))(v39, v42);
  v72 = v71;
  v73 = v48;
  v74 = v35;
  v43 = v53;
  sub_21EBB7938();
  (*(void (**)(char *, uint64_t))(v65 + 8))(v41, v43);
  v44 = v49;
  v45 = *(void (**)(char *, char *, uint64_t))(v49 + 16);
  v45(v34, v32, v29);
  v46 = *(void (**)(char *, uint64_t))(v44 + 8);
  v46(v32, v29);
  v45(v70, v34, v29);
  return ((uint64_t (*)(char *, uint64_t))v46)(v34, v29);
}

uint64_t sub_21EB64090@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  uint64_t v23;
  uint64_t v24;
  void (*v25)(char *, char *, uint64_t);
  void (*v26)(char *, uint64_t);
  void (*v27)(char *, char *, uint64_t);
  void (*v28)(char *, uint64_t);
  uint64_t v29;
  uint64_t v30;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  _QWORD v36[2];

  v34 = a4;
  v35 = a3;
  v6 = sub_21EBB7848();
  v32 = *(_QWORD *)(v6 - 8);
  v7 = MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v32 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = MEMORY[0x24BDAC7A8](v7);
  v12 = (char *)&v32 - v11;
  v13 = *(_QWORD *)(a2 - 8);
  v14 = MEMORY[0x24BDAC7A8](v10);
  v16 = (char *)&v32 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v14);
  v18 = (char *)&v32 - v17;
  v19 = sub_21EBB7788();
  v33 = *(_QWORD *)(v19 - 8);
  v20 = MEMORY[0x24BDAC7A8](v19);
  v22 = (char *)&v32 - v21;
  if ((*(_BYTE *)(a1 + 17) & 1) != 0)
  {
    (*(void (**)(uint64_t))(a1 + 24))(v20);
    v27 = *(void (**)(char *, char *, uint64_t))(v13 + 16);
    v27(v18, v16, a2);
    v28 = *(void (**)(char *, uint64_t))(v13 + 8);
    v28(v16, a2);
    v27(v16, v18, a2);
    MEMORY[0x2207B8330](MEMORY[0x24BDF1988], v6);
    sub_21EB64364((uint64_t)v16, a2);
    v28(v16, a2);
    v28(v18, a2);
  }
  else
  {
    MEMORY[0x24BDAC7A8](v20);
    v23 = v35;
    *(&v32 - 4) = a2;
    *(&v32 - 3) = v23;
    *(&v32 - 2) = a1;
    sub_21EBB783C();
    MEMORY[0x2207B8330](MEMORY[0x24BDF1988], v6);
    v24 = v32;
    v25 = *(void (**)(char *, char *, uint64_t))(v32 + 16);
    v25(v12, v9, v6);
    v26 = *(void (**)(char *, uint64_t))(v24 + 8);
    v26(v9, v6);
    v25(v9, v12, v6);
    sub_21EB644F0((uint64_t)v9, a2, v6);
    v26(v9, v6);
    v26(v12, v6);
  }
  v29 = MEMORY[0x2207B8330](MEMORY[0x24BDF1988], v6);
  v36[0] = v35;
  v36[1] = v29;
  MEMORY[0x2207B8330](MEMORY[0x24BDEF3E0], v19, v36);
  v30 = v33;
  (*(void (**)(uint64_t, char *, uint64_t))(v33 + 16))(v34, v22, v19);
  return (*(uint64_t (**)(char *, uint64_t))(v30 + 8))(v22, v19);
}

uint64_t sub_21EB64364(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v7;

  v4 = sub_21EBB7770();
  MEMORY[0x24BDAC7A8](v4);
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(a2 - 8) + 16))((char *)&v7 - v5, a1, a2);
  swift_storeEnumTagMultiPayload();
  return sub_21EBB777C();
}

uint64_t sub_21EB64428@<X0>(uint64_t a1@<X1>, char *a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  void (*v11)(char *, char *, uint64_t);
  void (*v12)(char *, uint64_t);
  uint64_t v14;

  v4 = *(_QWORD *)(a1 - 8);
  v5 = ((uint64_t (*)(void))MEMORY[0x24BDAC7A8])();
  v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = MEMORY[0x24BDAC7A8](v5);
  v10 = (char *)&v14 - v9;
  (*(void (**)(void))(v8 + 24))();
  v11 = *(void (**)(char *, char *, uint64_t))(v4 + 16);
  v11(v10, v7, a1);
  v12 = *(void (**)(char *, uint64_t))(v4 + 8);
  v12(v7, a1);
  v11(a2, v10, a1);
  return ((uint64_t (*)(char *, uint64_t))v12)(v10, a1);
}

uint64_t sub_21EB644F0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v8;

  v5 = sub_21EBB7770();
  MEMORY[0x24BDAC7A8](v5);
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(a3 - 8) + 16))((char *)&v8 - v6, a1, a3);
  swift_storeEnumTagMultiPayload();
  return sub_21EBB777C();
}

uint64_t sub_21EB645B4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  char *v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
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

  v25 = a4;
  v24 = __swift_instantiateConcreteTypeFromMangledName(&qword_255477968);
  MEMORY[0x24BDAC7A8](v24);
  v8 = (char *)&v22 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_255477970);
  v22 = *(_QWORD *)(v9 - 8);
  v23 = v9;
  MEMORY[0x24BDAC7A8](v9);
  v11 = (char *)&v22 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = sub_21EBB77C4();
  MEMORY[0x24BDAC7A8](v12);
  v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_255477978);
  v14 = *(_QWORD *)(v13 - 8);
  MEMORY[0x24BDAC7A8](v13);
  v16 = (char *)&v22 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_21EBB77AC();
  v29 = a2;
  v30 = a3;
  v31 = a1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_255477980);
  sub_21EB673B4();
  sub_21EBB7548();
  sub_21EBB77B8();
  v26 = a2;
  v27 = a3;
  v28 = a1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2554779A0);
  sub_21EB6746C();
  sub_21EBB7548();
  v17 = &v8[*(int *)(v24 + 48)];
  (*(void (**)(char *, char *, uint64_t))(v14 + 16))(v8, v16, v13);
  v18 = v22;
  v19 = v17;
  v20 = v23;
  (*(void (**)(char *, char *, uint64_t))(v22 + 16))(v19, v11, v23);
  sub_21EBB76E0();
  (*(void (**)(char *, uint64_t))(v18 + 8))(v11, v20);
  return (*(uint64_t (**)(char *, uint64_t))(v14 + 8))(v16, v13);
}

uint64_t sub_21EB647E4@<X0>(uint64_t a1@<X1>, uint64_t a2@<X2>, uint64_t a3@<X3>, uint64_t a4@<X8>)
{
  type metadata accessor for AccountLoginLayoutView(0, a1, a2, a3);
  return sub_21EB64814(a4);
}

uint64_t sub_21EB64814@<X0>(uint64_t a1@<X8>)
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
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  void *v17;
  void *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;

  v3 = sub_21EBB75CC();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v6 = (char *)&v27 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_255477990);
  v32 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7);
  v9 = (char *)&v27 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_255477A38);
  MEMORY[0x24BDAC7A8](v10);
  v13 = (char *)&v27 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = *(_QWORD *)(v1 + 40);
  if (!v14)
    return __swift_storeEnumTagSinglePayload(a1, 1, 1, v10);
  v27 = v11;
  v28 = v7;
  v29 = v4;
  v30 = v3;
  v31 = a1;
  v15 = *(_QWORD *)(v1 + 48);
  swift_retain();
  sub_21EBB7B78();
  if (qword_2554776B0 != -1)
    swift_once();
  v16 = (id)qword_255478EA8;
  v17 = (void *)sub_21EBB7B48();
  v18 = (void *)sub_21EBB7B48();
  swift_bridgeObjectRelease();
  v19 = objc_msgSend(v16, sel_localizedStringForKey_value_table_, v17, v18, 0);

  v20 = sub_21EBB7B60();
  v22 = v21;

  v33 = v20;
  v34 = v22;
  v23 = swift_allocObject();
  *(_QWORD *)(v23 + 16) = v14;
  *(_QWORD *)(v23 + 24) = v15;
  sub_21EB67308();
  swift_retain();
  sub_21EBB7A10();
  sub_21EBB75B4();
  sub_21EB67618(&qword_255478DC0, (uint64_t *)&unk_255477990);
  v24 = v28;
  sub_21EBB78F0();
  sub_21EB67AE0(v14);
  (*(void (**)(char *, uint64_t))(v29 + 8))(v6, v30);
  (*(void (**)(char *, uint64_t))(v32 + 8))(v9, v24);
  v25 = v31;
  (*(void (**)(uint64_t, char *, uint64_t))(v27 + 32))(v31, v13, v10);
  return __swift_storeEnumTagSinglePayload(v25, 0, 1, v10);
}

void sub_21EB64B10(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
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
  uint64_t v16;
  uint64_t v17;
  uint64_t v18[2];
  __int128 v19;
  char v20;

  v18[0] = a3;
  v18[1] = a4;
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2554779C8);
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)v18 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2554779F0);
  MEMORY[0x24BDAC7A8](v9);
  v11 = (char *)v18 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_2554779B8);
  v13 = *(_QWORD *)(v12 - 8);
  MEMORY[0x24BDAC7A8](v12);
  v15 = (char *)v18 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v19 = *(_OWORD *)(a1 + 72);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2554787A0);
  sub_21EBB79D4();
  if (v20 == 1)
  {
    sub_21EBB7554();
    (*(void (**)(char *, char *, uint64_t))(v13 + 16))(v11, v15, v12);
    swift_storeEnumTagMultiPayload();
    sub_21EB67618(&qword_2554779B0, &qword_2554779B8);
    sub_21EB674F0();
    sub_21EBB777C();
    (*(void (**)(char *, uint64_t))(v13 + 8))(v15, v12);
  }
  else
  {
    v17 = type metadata accessor for AccountLoginLayoutView(0, a2, v18[0], v16);
    sub_21EB64D44(v17, (uint64_t)v8);
    sub_21EB67644((uint64_t)v8, (uint64_t)v11);
    swift_storeEnumTagMultiPayload();
    sub_21EB67618(&qword_2554779B0, &qword_2554779B8);
    sub_21EB674F0();
    sub_21EBB777C();
    sub_21EB67980((uint64_t)v8, &qword_2554779C8);
  }
}

uint64_t sub_21EB64D44@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
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
  char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  void *v20;
  void *v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  char v27;
  uint64_t v29;
  uint64_t v30;
  uint64_t KeyPath;
  uint64_t v32;
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  void (*v36)(char *, uint64_t, uint64_t);
  char *v37;
  uint64_t v38;
  char *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  char v48;
  __int128 v49;

  v5 = sub_21EBB75CC();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v39 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_255477990);
  v46 = *(_QWORD *)(v9 - 8);
  MEMORY[0x24BDAC7A8](v9);
  v11 = (char *)&v39 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v47 = __swift_instantiateConcreteTypeFromMangledName(&qword_2554779D0);
  MEMORY[0x24BDAC7A8](v47);
  v13 = (char *)&v39 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_255477A00);
  v15 = MEMORY[0x24BDAC7A8](v14);
  MEMORY[0x24BDAC7A8](v15);
  if (!*(_QWORD *)(v2 + 56))
    return __swift_storeEnumTagSinglePayload(a2, 1, 1, v14);
  v39 = (char *)&v39 - v16;
  v40 = v18;
  v41 = v17;
  v42 = v9;
  v43 = v6;
  v44 = v5;
  v45 = a2;
  sub_21EBB7B78();
  if (qword_2554776B0 != -1)
    swift_once();
  v19 = (id)qword_255478EA8;
  v20 = (void *)sub_21EBB7B48();
  v21 = (void *)sub_21EBB7B48();
  swift_bridgeObjectRelease();
  v22 = objc_msgSend(v19, sel_localizedStringForKey_value_table_, v20, v21, 0);

  v23 = sub_21EBB7B60();
  v25 = v24;

  *(_QWORD *)&v49 = v23;
  *((_QWORD *)&v49 + 1) = v25;
  v26 = swift_allocObject();
  *(_OWORD *)(v26 + 16) = *(_OWORD *)(a1 + 16);
  memcpy((void *)(v26 + 32), (const void *)v2, 0x58uLL);
  sub_21EB676EC(v2);
  sub_21EB67308();
  sub_21EBB7A10();
  if ((*(_BYTE *)(v2 + 16) & 1) != 0)
  {
    v49 = *(_OWORD *)(v2 + 72);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2554787A0);
    sub_21EBB79D4();
    v27 = v48;
  }
  else
  {
    v27 = 1;
  }
  v30 = v42;
  v29 = v43;
  KeyPath = swift_getKeyPath();
  v32 = swift_allocObject();
  *(_BYTE *)(v32 + 16) = v27;
  v33 = v46;
  (*(void (**)(char *, char *, uint64_t))(v46 + 16))(v13, v11, v30);
  v34 = (uint64_t *)&v13[*(int *)(v47 + 36)];
  *v34 = KeyPath;
  v34[1] = (uint64_t)sub_21EB67860;
  v34[2] = v32;
  (*(void (**)(char *, uint64_t))(v33 + 8))(v11, v30);
  sub_21EBB75C0();
  sub_21EB6757C();
  v35 = v40;
  sub_21EBB78F0();
  (*(void (**)(char *, uint64_t))(v29 + 8))(v8, v44);
  sub_21EB67980((uint64_t)v13, &qword_2554779D0);
  v36 = *(void (**)(char *, uint64_t, uint64_t))(v41 + 32);
  v37 = v39;
  v36(v39, v35, v14);
  v38 = v45;
  v36((char *)v45, (uint64_t)v37, v14);
  return __swift_storeEnumTagSinglePayload(v38, 0, 1, v14);
}

uint64_t sub_21EB65138(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;

  v4 = type metadata accessor for AccountLoginLayoutView(0, a2, a3, a4);
  return sub_21EB65160(v4);
}

uint64_t sub_21EB65160(uint64_t a1)
{
  uint64_t v1;
  const void *v2;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12;

  v2 = (const void *)v1;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_255478630);
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)&v12 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_21EBB7C38();
  __swift_storeEnumTagSinglePayload((uint64_t)v6, 1, 1, v7);
  sub_21EBB7C20();
  sub_21EB676EC(v1);
  v8 = sub_21EBB7C14();
  v9 = swift_allocObject();
  v10 = MEMORY[0x24BEE6930];
  *(_QWORD *)(v9 + 16) = v8;
  *(_QWORD *)(v9 + 24) = v10;
  *(_OWORD *)(v9 + 32) = *(_OWORD *)(a1 + 16);
  memcpy((void *)(v9 + 48), v2, 0x58uLL);
  sub_21EB6549C((uint64_t)v6, (uint64_t)&unk_255477A18, v9);
  return swift_release();
}

uint64_t sub_21EB65258(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v4;
  uint64_t v5;

  v4[9] = a4;
  sub_21EBB7C20();
  v4[10] = sub_21EBB7C14();
  v4[11] = sub_21EBB7BF0();
  v4[12] = v5;
  return swift_task_switch();
}

uint64_t sub_21EB652C4()
{
  uint64_t v0;
  uint64_t v1;
  int *v2;
  _QWORD *v3;
  uint64_t (*v5)(void);

  v1 = *(_QWORD *)(v0 + 72);
  if ((*(_BYTE *)(v1 + 16) & 1) != 0 && (v2 = *(int **)(v1 + 56), (*(_QWORD *)(v0 + 104) = v2) != 0))
  {
    *(_QWORD *)(v0 + 112) = *(_QWORD *)(v1 + 64);
    *(_OWORD *)(v0 + 16) = *(_OWORD *)(v1 + 72);
    sub_21EB67A70(v0 + 24, v0 + 64);
    *(_OWORD *)(v0 + 32) = *(_OWORD *)(v0 + 16);
    *(_BYTE *)(v0 + 136) = 1;
    swift_retain();
    *(_QWORD *)(v0 + 120) = __swift_instantiateConcreteTypeFromMangledName(&qword_2554787A0);
    sub_21EBB79E0();
    v5 = (uint64_t (*)(void))((char *)v2 + *v2);
    v3 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 128) = v3;
    *v3 = v0;
    v3[1] = sub_21EB653BC;
    return v5();
  }
  else
  {
    swift_release();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
}

uint64_t sub_21EB653BC()
{
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_21EB65408()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 104);
  swift_release();
  *(_OWORD *)(v0 + 48) = *(_OWORD *)(v0 + 16);
  *(_BYTE *)(v0 + 137) = 0;
  sub_21EB67AB8(v0 + 64);
  sub_21EBB79E0();
  sub_21EB67AE0(v1);
  sub_21EB67AF0(v0 + 16);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_21EB6549C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;

  v6 = sub_21EBB7C38();
  if (__swift_getEnumTagSinglePayload(a1, 1, v6) == 1)
  {
    sub_21EB67980(a1, &qword_255478630);
  }
  else
  {
    sub_21EBB7C2C();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 8))(a1, v6);
  }
  if (*(_QWORD *)(a3 + 16))
  {
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_21EBB7BF0();
    swift_unknownObjectRelease();
  }
  v7 = swift_allocObject();
  *(_QWORD *)(v7 + 16) = a2;
  *(_QWORD *)(v7 + 24) = a3;
  return swift_task_create();
}

void sub_21EB655E0(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  const void *v2;
  _BYTE __dst[88];

  memcpy(__dst, v2, sizeof(__dst));
  sub_21EB637D8(a1, a2);
}

void sub_21EB65630(uint64_t a1@<X0>, char *a2@<X8>)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(char *, char *, uint64_t);
  void (*v18)(char *, uint64_t);
  uint64_t v19;
  uint64_t v20;
  _QWORD v21[3];
  uint64_t v22;
  char *v23;
  _QWORD v24[3];
  __int128 v25;
  __int128 v26;
  _OWORD v27[2];

  v23 = a2;
  v4 = *(_QWORD *)(a1 + 24);
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](a1);
  v7 = (char *)v21 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_255477938);
  v21[1] = *(_QWORD *)(a1 + 16);
  v21[2] = v8;
  v9 = sub_21EBB7A94();
  v22 = *(_QWORD *)(v9 - 8);
  v10 = MEMORY[0x24BDAC7A8](v9);
  v12 = (char *)v21 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v10);
  v14 = (char *)v21 - v13;
  sub_21EB657F0((uint64_t *)v27);
  v25 = v27[0];
  v26 = v27[1];
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, v2 + *(int *)(a1 + 52), v4);
  v15 = sub_21EB672BC((unint64_t *)&unk_255477940, &qword_255477938);
  v19 = *(_QWORD *)(a1 + 32);
  v20 = *(_QWORD *)(a1 + 40);
  sub_21EBB7A7C();
  v24[0] = v15;
  v24[1] = v19;
  v24[2] = v20;
  MEMORY[0x2207B8330](MEMORY[0x24BDF4AF8], v9, v24);
  v16 = v22;
  v17 = *(void (**)(char *, char *, uint64_t))(v22 + 16);
  v17(v14, v12, v9);
  v18 = *(void (**)(char *, uint64_t))(v16 + 8);
  v18(v12, v9);
  v17(v23, v14, v9);
  v18(v14, v9);
  OUTLINED_FUNCTION_3();
}

uint64_t sub_21EB657F0@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v1;
  uint64_t result;
  uint64_t v4;
  uint64_t v5;
  char v6;
  uint64_t v7;

  if (*(_QWORD *)(v1 + 8))
  {
    sub_21EB67308();
    swift_bridgeObjectRetain();
    result = sub_21EBB7878();
    v7 = v6 & 1;
  }
  else
  {
    result = 0;
    v4 = 0;
    v7 = 0;
    v5 = 0;
  }
  *a1 = result;
  a1[1] = v4;
  a1[2] = v7;
  a1[3] = v5;
  return result;
}

uint64_t sub_21EB65874@<X0>(uint64_t result@<X0>, _QWORD *a2@<X8>)
{
  *a2 = result;
  return result;
}

id sub_21EB6587C()
{
  id *v0;

  return *v0;
}

uint64_t sub_21EB65888()
{
  return sub_21EBB7B60();
}

uint64_t sub_21EB65898()
{
  sub_21EB65BBC(&qword_255477788, type metadata accessor for ASWebAuthenticationSessionError);
  return sub_21EBB7410();
}

uint64_t sub_21EB658D8()
{
  sub_21EB65BBC(&qword_255477788, type metadata accessor for ASWebAuthenticationSessionError);
  return sub_21EBB73EC();
}

uint64_t sub_21EB65918(void *a1)
{
  id v2;

  sub_21EB65BBC(&qword_255477788, type metadata accessor for ASWebAuthenticationSessionError);
  v2 = a1;
  return sub_21EBB73E0();
}

uint64_t sub_21EB6597C(void *a1)
{
  id v1;
  uint64_t v2;

  v1 = a1;
  v2 = sub_21EBB7CB0();

  return v2;
}

uint64_t sub_21EB659AC()
{
  sub_21EB65BBC(&qword_255477788, type metadata accessor for ASWebAuthenticationSessionError);
  return sub_21EBB7404();
}

BOOL sub_21EB65A00(uint64_t a1, uint64_t a2)
{
  return a1 == a2;
}

uint64_t sub_21EB65A10()
{
  return sub_21EBB7B60();
}

uint64_t sub_21EB65A20()
{
  sub_21EB65BBC(&qword_255477738, type metadata accessor for WFOAuth2Error);
  return sub_21EBB7410();
}

uint64_t sub_21EB65A60()
{
  sub_21EB65BBC(&qword_255477738, type metadata accessor for WFOAuth2Error);
  return sub_21EBB73EC();
}

uint64_t sub_21EB65AA0(void *a1)
{
  id v2;

  sub_21EB65BBC(&qword_255477738, type metadata accessor for WFOAuth2Error);
  v2 = a1;
  return sub_21EBB73E0();
}

uint64_t sub_21EB65B04()
{
  sub_21EB65BBC(&qword_255477738, type metadata accessor for WFOAuth2Error);
  return sub_21EBB7404();
}

uint64_t sub_21EB65B54()
{
  return swift_getOpaqueTypeConformance2();
}

void sub_21EB65B64()
{
  sub_21EB65BBC(&qword_255477730, type metadata accessor for Code);
}

void sub_21EB65B90()
{
  sub_21EB65BBC(&qword_255477738, type metadata accessor for WFOAuth2Error);
}

void sub_21EB65BBC(_QWORD *a1, void (*a2)(uint64_t))
{
  if (!*a1)
  {
    a2(255);
    OUTLINED_FUNCTION_7();
  }
  OUTLINED_FUNCTION_5();
}

void type metadata accessor for WFOAuth2Error(uint64_t a1)
{
  sub_21EB6702C(a1, &qword_2554778D0);
}

void sub_21EB65C04()
{
  sub_21EB65BBC(&qword_255477740, type metadata accessor for WFOAuth2Error);
}

void sub_21EB65C30()
{
  sub_21EB65BBC(&qword_255477748, type metadata accessor for WFOAuth2Error);
}

void sub_21EB65C5C()
{
  sub_21EB65BBC(&qword_255477750, type metadata accessor for WFOAuth2Error);
}

void sub_21EB65C88()
{
  sub_21EB65BBC(&qword_255477758, type metadata accessor for Code);
}

void sub_21EB65CB4()
{
  sub_21EB65BBC(&qword_255477760, type metadata accessor for Code);
}

unint64_t sub_21EB65CE4()
{
  unint64_t result;

  result = qword_255477768;
  if (!qword_255477768)
  {
    result = MEMORY[0x2207B8330](MEMORY[0x24BEE17C8], MEMORY[0x24BEE1768]);
    atomic_store(result, (unint64_t *)&qword_255477768);
  }
  return result;
}

void sub_21EB65D20()
{
  sub_21EB65BBC(&qword_255477770, type metadata accessor for WFOAuth2Error);
}

uint64_t sub_21EB65D50()
{
  return sub_21EBB7B60();
}

uint64_t sub_21EB65D60()
{
  sub_21EB65BBC(&qword_2554778F8, type metadata accessor for ENError);
  return sub_21EBB7410();
}

uint64_t sub_21EB65DA0()
{
  sub_21EB65BBC(&qword_2554778F8, type metadata accessor for ENError);
  return sub_21EBB73EC();
}

uint64_t sub_21EB65DE0(void *a1)
{
  id v2;

  sub_21EB65BBC(&qword_2554778F8, type metadata accessor for ENError);
  v2 = a1;
  return sub_21EBB73E0();
}

uint64_t sub_21EB65E44()
{
  void **v0;

  return sub_21EB6597C(*v0);
}

uint64_t sub_21EB65E4C()
{
  sub_21EB65BBC(&qword_2554778F8, type metadata accessor for ENError);
  return sub_21EBB7404();
}

uint64_t sub_21EB65E9C()
{
  sub_21EBB7DC4();
  sub_21EBB7B24();
  return sub_21EBB7DD0();
}

void sub_21EB65EF8(uint64_t a1@<X8>)
{
  uint64_t v2;
  char v3;

  sub_21EB65F28();
  *(_QWORD *)a1 = v2;
  *(_BYTE *)(a1 + 8) = v3 & 1;
}

uint64_t sub_21EB65F30@<X0>(uint64_t *a1@<X8>)
{
  _QWORD *v1;
  uint64_t result;

  result = nullsub_1(*v1);
  *a1 = result;
  return result;
}

BOOL sub_21EB65F5C(uint64_t *a1, uint64_t *a2)
{
  return sub_21EB65A00(*a1, *a2);
}

uint64_t sub_21EB65F68()
{
  sub_21EB65BBC(&qword_255477790, type metadata accessor for ASWebAuthenticationSessionError);
  return sub_21EBB7DAC();
}

uint64_t sub_21EB65FA8()
{
  sub_21EB65BBC(&qword_255477790, type metadata accessor for ASWebAuthenticationSessionError);
  return sub_21EBB7DA0();
}

uint64_t sub_21EB65FEC()
{
  sub_21EB65BBC(&qword_255477788, type metadata accessor for ASWebAuthenticationSessionError);
  return sub_21EBB73D4();
}

uint64_t sub_21EB6602C()
{
  sub_21EB65BBC(&qword_255477788, type metadata accessor for ASWebAuthenticationSessionError);
  return sub_21EBB73F8();
}

uint64_t sub_21EB66084()
{
  sub_21EB65BBC(&qword_255477740, type metadata accessor for WFOAuth2Error);
  return sub_21EBB7DAC();
}

uint64_t sub_21EB660C4()
{
  sub_21EB65BBC(&qword_255477740, type metadata accessor for WFOAuth2Error);
  return sub_21EBB7DA0();
}

uint64_t sub_21EB66104()
{
  sub_21EB65BBC(&qword_255477738, type metadata accessor for WFOAuth2Error);
  return sub_21EBB73D4();
}

uint64_t sub_21EB66144()
{
  sub_21EB65BBC(&qword_255477738, type metadata accessor for WFOAuth2Error);
  return sub_21EBB73F8();
}

void sub_21EB6619C()
{
  sub_21EB65BBC(&qword_255477778, type metadata accessor for WFOAuth2Error);
}

void sub_21EB661C8()
{
  sub_21EB65BBC(&qword_255477780, _s3__C4CodeOMa_0);
}

void sub_21EB661F4()
{
  sub_21EB65BBC(&qword_255477788, type metadata accessor for ASWebAuthenticationSessionError);
}

void type metadata accessor for ASWebAuthenticationSessionError(uint64_t a1)
{
  sub_21EB6702C(a1, &qword_2554778D8);
}

void sub_21EB66234()
{
  sub_21EB65BBC(&qword_255477790, type metadata accessor for ASWebAuthenticationSessionError);
}

void sub_21EB66260()
{
  sub_21EB65BBC(&qword_255477798, type metadata accessor for ASWebAuthenticationSessionError);
}

void sub_21EB6628C()
{
  sub_21EB65BBC(qword_2554777A0, type metadata accessor for ASWebAuthenticationSessionError);
}

void sub_21EB662B8()
{
  sub_21EB65BBC(qword_255477DD0, _s3__C4CodeOMa_0);
}

void sub_21EB662E4()
{
  sub_21EB65BBC(&qword_2554777B0, _s3__C4CodeOMa_0);
}

void sub_21EB66310()
{
  sub_21EB65BBC(&qword_2554777B8, type metadata accessor for ASWebAuthenticationSessionError);
}

void sub_21EB6633C()
{
  sub_21EB65BBC(&qword_2554777C0, type metadata accessor for ASWebAuthenticationSessionError);
}

uint64_t dynamic_cast_existential_1_conditional(uint64_t a1)
{
  if (swift_conformsToProtocol2())
    return a1;
  else
    return 0;
}

void _s3__C4CodeOMa_1(uint64_t a1)
{
  sub_21EB6702C(a1, qword_2554777C8);
}

uint64_t sub_21EB663B0()
{
  return swift_allocateGenericValueMetadata();
}

uint64_t sub_21EB663B8()
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

uint64_t *sub_21EB6643C(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(uint64_t, uint64_t, uint64_t);
  _QWORD *v15;
  uint64_t v16;
  _QWORD *v17;

  v4 = *(_QWORD *)(a3 + 24);
  v5 = *(_QWORD *)(v4 - 8);
  v6 = *(_DWORD *)(v5 + 80);
  v7 = *(_QWORD *)(v5 + 64) + 7;
  if (v6 > 7
    || (*(_DWORD *)(v5 + 80) & 0x100000) != 0
    || ((v7 + ((v6 + 16) & ~v6)) & 0xFFFFFFFFFFFFFFF8) + 16 > 0x18)
  {
    v10 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v10 + ((v6 & 0xF8 ^ 0x1F8) & (v6 + 16)));
  }
  else
  {
    v11 = a2[1];
    *a1 = *a2;
    a1[1] = v11;
    v12 = ((unint64_t)a1 + v6 + 16) & ~v6;
    v13 = ((unint64_t)a2 + v6 + 16) & ~v6;
    v14 = *(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 16);
    swift_bridgeObjectRetain();
    v14(v12, v13, v4);
    v15 = (_QWORD *)((v7 + v13) & 0xFFFFFFFFFFFFFFF8);
    v16 = v15[1];
    v17 = (_QWORD *)((v7 + v12) & 0xFFFFFFFFFFFFFFF8);
    *v17 = *v15;
    v17[1] = v16;
  }
  swift_retain();
  return a1;
}

uint64_t sub_21EB66520(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRelease();
  (*(void (**)(unint64_t))(*(_QWORD *)(*(_QWORD *)(a2 + 24) - 8) + 8))((a1
                                                                                            + *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a2 + 24) - 8) + 80)
                                                                                            + 16) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a2 + 24) - 8) + 80));
  return swift_release();
}

_QWORD *sub_21EB66588(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(uint64_t, uint64_t, uint64_t);
  uint64_t v11;
  _QWORD *v12;
  _QWORD *v13;
  uint64_t v14;

  v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  v5 = *(_QWORD *)(a3 + 24);
  v6 = *(_QWORD *)(v5 - 8);
  v7 = *(unsigned __int8 *)(v6 + 80);
  v8 = ((unint64_t)a1 + v7 + 16) & ~v7;
  v9 = ((unint64_t)a2 + v7 + 16) & ~v7;
  v10 = *(void (**)(uint64_t, uint64_t, uint64_t))(v6 + 16);
  swift_bridgeObjectRetain();
  v10(v8, v9, v5);
  v11 = *(_QWORD *)(v6 + 64) + 7;
  v12 = (_QWORD *)((v11 + v8) & 0xFFFFFFFFFFFFFFF8);
  v13 = (_QWORD *)((v11 + v9) & 0xFFFFFFFFFFFFFFF8);
  v14 = v13[1];
  *v12 = *v13;
  v12[1] = v14;
  swift_retain();
  return a1;
}

_QWORD *sub_21EB6661C(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  _QWORD *v12;
  uint64_t v13;

  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v6 = *(_QWORD *)(*(_QWORD *)(a3 + 24) - 8);
  v7 = *(unsigned __int8 *)(v6 + 80);
  v8 = ((unint64_t)a1 + v7 + 16) & ~v7;
  v9 = ((unint64_t)a2 + v7 + 16) & ~v7;
  (*(void (**)(uint64_t, uint64_t))(v6 + 24))(v8, v9);
  v10 = *(_QWORD *)(v6 + 64) + 7;
  v11 = (_QWORD *)((v10 + v8) & 0xFFFFFFFFFFFFFFF8);
  v12 = (_QWORD *)((v10 + v9) & 0xFFFFFFFFFFFFFFF8);
  v13 = v12[1];
  *v11 = *v12;
  v11[1] = v13;
  swift_retain();
  swift_release();
  return a1;
}

_OWORD *sub_21EB666CC(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  *a1 = *a2;
  v4 = *(_QWORD *)(*(_QWORD *)(a3 + 24) - 8);
  v5 = *(unsigned __int8 *)(v4 + 80);
  v6 = ((unint64_t)a1 + v5 + 16) & ~v5;
  v7 = ((unint64_t)a2 + v5 + 16) & ~v5;
  (*(void (**)(uint64_t, uint64_t))(v4 + 32))(v6, v7);
  *(_OWORD *)((*(_QWORD *)(v4 + 64) + 7 + v6) & 0xFFFFFFFFFFFFF8) = *(_OWORD *)((*(_QWORD *)(v4 + 64) + 7 + v7) & 0xFFFFFFFFFFFFF8);
  return a1;
}

_QWORD *sub_21EB6674C(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  swift_bridgeObjectRelease();
  v7 = *(_QWORD *)(*(_QWORD *)(a3 + 24) - 8);
  v8 = *(unsigned __int8 *)(v7 + 80);
  v9 = ((unint64_t)a1 + v8 + 16) & ~v8;
  v10 = ((unint64_t)a2 + v8 + 16) & ~v8;
  (*(void (**)(uint64_t, uint64_t))(v7 + 40))(v9, v10);
  *(_OWORD *)((*(_QWORD *)(v7 + 64) + 7 + v9) & 0xFFFFFFFFFFFFFFF8) = *(_OWORD *)((*(_QWORD *)(v7 + 64) + 7 + v10) & 0xFFFFFFFFFFFFF8);
  swift_release();
  return a1;
}

uint64_t sub_21EB667E4(uint64_t a1, unsigned int a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unsigned int v7;
  uint64_t v8;
  uint64_t v9;
  unsigned int v10;
  unsigned int v11;
  uint64_t v12;
  uint64_t v14;
  unint64_t v15;

  v4 = *(_QWORD *)(a3 + 24);
  v5 = *(_QWORD *)(v4 - 8);
  v6 = *(unsigned int *)(v5 + 84);
  if (v6 <= 0x7FFFFFFF)
    v7 = 0x7FFFFFFF;
  else
    v7 = *(_DWORD *)(v5 + 84);
  if (!a2)
    return 0;
  v8 = *(unsigned __int8 *)(v5 + 80);
  v9 = *(_QWORD *)(v5 + 64) + 7;
  if (v7 >= a2)
  {
    v14 = (a1 + v8 + 16) & ~v8;
    if (v6 < 0x7FFFFFFF)
    {
      v15 = *(_QWORD *)((v9 + v14) & 0xFFFFFFFFFFFFF8);
      if (v15 >= 0xFFFFFFFF)
        LODWORD(v15) = -1;
      return (v15 + 1);
    }
    else
    {
      return __swift_getEnumTagSinglePayload(v14, v6, v4);
    }
  }
  else
  {
    if (((((v9 + ((v8 + 16) & ~v8)) & 0xFFFFFFFFFFFFFFF8) + 16) & 0xFFFFFFF8) != 0)
      v10 = 2;
    else
      v10 = a2 - v7 + 1;
    if (v10 >= 0x10000)
      v11 = 4;
    else
      v11 = 2;
    if (v10 < 0x100)
      v11 = 1;
    if (v10 >= 2)
      v12 = v11;
    else
      v12 = 0;
    return ((uint64_t (*)(void))((char *)&loc_21EB66870 + 4 * byte_21EBBB8D0[v12]))();
  }
}

uint64_t __swift_getEnumTagSinglePayload(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a3 - 8) + 48))();
}

void sub_21EB66908(unsigned int *a1, unsigned int a2, unsigned int a3, uint64_t a4)
{
  uint64_t v5;
  unsigned int v6;
  uint64_t v7;
  unsigned int v8;
  int v9;
  int v10;
  unsigned int v11;

  v5 = *(_QWORD *)(*(_QWORD *)(a4 + 24) - 8);
  if (*(_DWORD *)(v5 + 84) <= 0x7FFFFFFFu)
    v6 = 0x7FFFFFFF;
  else
    v6 = *(_DWORD *)(v5 + 84);
  v7 = *(unsigned __int8 *)(v5 + 80);
  if (v6 >= a3)
  {
    v10 = 0;
  }
  else
  {
    if (((*(_DWORD *)(v5 + 64) + 7 + (((_DWORD)v7 + 16) & ~(_DWORD)v7)) & 0xFFFFFFF8) == 0xFFFFFFF0)
      v8 = a3 - v6 + 1;
    else
      v8 = 2;
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
  }
  if (a2 > v6)
  {
    if (((*(_DWORD *)(v5 + 64) + 7 + (((_DWORD)v7 + 16) & ~(_DWORD)v7)) & 0xFFFFFFF8) != 0xFFFFFFF0)
    {
      v11 = ~v6 + a2;
      bzero(a1, ((*(_QWORD *)(v5 + 64) + 7 + ((v7 + 16) & ~v7)) & 0xFFFFFFFFFFFFFFF8) + 16);
      *a1 = v11;
    }
    __asm { BR              X10 }
  }
  __asm { BR              X13 }
}

void sub_21EB66A08(uint64_t a1@<X1>, uint64_t a2@<X2>, uint64_t a3@<X3>, uint64_t a4@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  uint64_t v10;

  *(_BYTE *)(v6 + v7) = 0;
  if ((_DWORD)a1)
  {
    v8 = (v6 + v5 + 16) & a4;
    if (a2 < 0x7FFFFFFF)
    {
      v9 = (_QWORD *)((v4 + v8) & 0xFFFFFFFFFFFFFFF8);
      if ((a1 & 0x80000000) != 0)
      {
        v10 = a1 ^ 0x80000000;
        v9[1] = 0;
      }
      else
      {
        v10 = (a1 - 1);
      }
      *v9 = v10;
    }
    else
    {
      __swift_storeEnumTagSinglePayload(v8, a1, a2, a3);
    }
  }
}

uint64_t __swift_storeEnumTagSinglePayload(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a4 - 8) + 56))();
}

void type metadata accessor for AccountLoginSection()
{
  JUMPOUT(0x2207B82ACLL);
}

uint64_t initializeBufferWithCopyOfBuffer for InstapaperLoginView(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *a2;
  *a1 = *a2;
  v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t sub_21EB66AE4(uint64_t a1)
{
  swift_bridgeObjectRelease();
  swift_release();
  if (*(_QWORD *)(a1 + 40))
    swift_release();
  if (*(_QWORD *)(a1 + 56))
    swift_release();
  return swift_release();
}

uint64_t sub_21EB66B34(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _OWORD *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v4 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v4;
  *(_WORD *)(a1 + 16) = *(_WORD *)(a2 + 16);
  v5 = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 32) = v5;
  v7 = (_OWORD *)(a2 + 40);
  v6 = *(_QWORD *)(a2 + 40);
  swift_bridgeObjectRetain();
  swift_retain();
  if (v6)
  {
    v8 = *(_QWORD *)(a2 + 48);
    *(_QWORD *)(a1 + 40) = v6;
    *(_QWORD *)(a1 + 48) = v8;
    swift_retain();
  }
  else
  {
    *(_OWORD *)(a1 + 40) = *v7;
  }
  v9 = *(_QWORD *)(a2 + 56);
  if (v9)
  {
    v10 = *(_QWORD *)(a2 + 64);
    *(_QWORD *)(a1 + 56) = v9;
    *(_QWORD *)(a1 + 64) = v10;
    swift_retain();
  }
  else
  {
    *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);
  }
  *(_BYTE *)(a1 + 72) = *(_BYTE *)(a2 + 72);
  *(_QWORD *)(a1 + 80) = *(_QWORD *)(a2 + 80);
  swift_retain();
  return a1;
}

uint64_t sub_21EB66BF0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
  *(_BYTE *)(a1 + 17) = *(_BYTE *)(a2 + 17);
  v4 = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 32) = v4;
  swift_retain();
  swift_release();
  v5 = *(_QWORD *)(a2 + 40);
  if (*(_QWORD *)(a1 + 40))
  {
    if (v5)
    {
      v6 = *(_QWORD *)(a2 + 48);
      *(_QWORD *)(a1 + 40) = v5;
      *(_QWORD *)(a1 + 48) = v6;
      swift_retain();
      swift_release();
      goto LABEL_8;
    }
    swift_release();
  }
  else if (v5)
  {
    v7 = *(_QWORD *)(a2 + 48);
    *(_QWORD *)(a1 + 40) = v5;
    *(_QWORD *)(a1 + 48) = v7;
    swift_retain();
    goto LABEL_8;
  }
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
LABEL_8:
  v8 = *(_QWORD *)(a2 + 56);
  if (!*(_QWORD *)(a1 + 56))
  {
    if (v8)
    {
      v10 = *(_QWORD *)(a2 + 64);
      *(_QWORD *)(a1 + 56) = v8;
      *(_QWORD *)(a1 + 64) = v10;
      swift_retain();
      goto LABEL_15;
    }
LABEL_14:
    *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);
    goto LABEL_15;
  }
  if (!v8)
  {
    swift_release();
    goto LABEL_14;
  }
  v9 = *(_QWORD *)(a2 + 64);
  *(_QWORD *)(a1 + 56) = v8;
  *(_QWORD *)(a1 + 64) = v9;
  swift_retain();
  swift_release();
LABEL_15:
  *(_BYTE *)(a1 + 72) = *(_BYTE *)(a2 + 72);
  *(_QWORD *)(a1 + 80) = *(_QWORD *)(a2 + 80);
  swift_retain();
  swift_release();
  return a1;
}

void *__swift_memcpy88_8(void *a1, const void *a2)
{
  return memcpy(a1, a2, 0x58uLL);
}

uint64_t sub_21EB66D3C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v4 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
  *(_BYTE *)(a1 + 17) = *(_BYTE *)(a2 + 17);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  swift_release();
  v5 = *(_QWORD *)(a2 + 40);
  if (*(_QWORD *)(a1 + 40))
  {
    if (v5)
    {
      v6 = *(_QWORD *)(a2 + 48);
      *(_QWORD *)(a1 + 40) = v5;
      *(_QWORD *)(a1 + 48) = v6;
      swift_release();
      goto LABEL_8;
    }
    swift_release();
  }
  else if (v5)
  {
    v7 = *(_QWORD *)(a2 + 48);
    *(_QWORD *)(a1 + 40) = v5;
    *(_QWORD *)(a1 + 48) = v7;
    goto LABEL_8;
  }
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
LABEL_8:
  v8 = *(_QWORD *)(a2 + 56);
  if (!*(_QWORD *)(a1 + 56))
  {
    if (v8)
    {
      v10 = *(_QWORD *)(a2 + 64);
      *(_QWORD *)(a1 + 56) = v8;
      *(_QWORD *)(a1 + 64) = v10;
      goto LABEL_15;
    }
LABEL_14:
    *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);
    goto LABEL_15;
  }
  if (!v8)
  {
    swift_release();
    goto LABEL_14;
  }
  v9 = *(_QWORD *)(a2 + 64);
  *(_QWORD *)(a1 + 56) = v8;
  *(_QWORD *)(a1 + 64) = v9;
  swift_release();
LABEL_15:
  *(_BYTE *)(a1 + 72) = *(_BYTE *)(a2 + 72);
  *(_QWORD *)(a1 + 80) = *(_QWORD *)(a2 + 80);
  swift_release();
  return a1;
}

uint64_t sub_21EB66E48(uint64_t a1, int a2)
{
  unint64_t v2;

  if (a2)
  {
    if (a2 < 0 && *(_BYTE *)(a1 + 88))
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

uint64_t sub_21EB66E88(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 88) = 1;
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
    *(_BYTE *)(result + 88) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

uint64_t type metadata accessor for AccountLoginLayoutView(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for AccountLoginLayoutView);
}

uint64_t sub_21EB66EE8()
{
  return sub_21EB672BC(&qword_2554778E0, &qword_2554778E8);
}

uint64_t __swift_instantiateConcreteTypeFromMangledNameAbstract(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x2207B8324](255, (char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t sub_21EB66F58()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_21EB66F8C()
{
  return swift_getOpaqueTypeConformance2();
}

void sub_21EB66FC0()
{
  sub_21EB65BBC(&qword_2554778F0, _s3__C4CodeOMa_1);
}

void sub_21EB66FEC()
{
  sub_21EB65BBC(&qword_2554778F8, type metadata accessor for ENError);
}

void type metadata accessor for ENError(uint64_t a1)
{
  sub_21EB6702C(a1, (unint64_t *)&unk_255477A40);
}

void sub_21EB6702C(uint64_t a1, unint64_t *a2)
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

void sub_21EB67070()
{
  sub_21EB65BBC(&qword_255477900, type metadata accessor for ENError);
}

void sub_21EB6709C()
{
  sub_21EB65BBC(&qword_255477908, type metadata accessor for ENError);
}

void sub_21EB670C8()
{
  sub_21EB65BBC(qword_255477910, type metadata accessor for ENError);
}

void sub_21EB670F4()
{
  sub_21EB65BBC(qword_2554781A0, _s3__C4CodeOMa_1);
}

void sub_21EB67120()
{
  sub_21EB65BBC(&qword_255477920, _s3__C4CodeOMa_1);
}

void sub_21EB6714C()
{
  sub_21EB65BBC(&qword_255477928, type metadata accessor for ENError);
}

uint64_t sub_21EB67178()
{
  sub_21EB65BBC(&qword_255477900, type metadata accessor for ENError);
  return sub_21EBB7DAC();
}

uint64_t sub_21EB671B8()
{
  sub_21EB65BBC(&qword_255477900, type metadata accessor for ENError);
  return sub_21EBB7DA0();
}

uint64_t sub_21EB671F8()
{
  sub_21EB65BBC(&qword_2554778F8, type metadata accessor for ENError);
  return sub_21EBB73D4();
}

uint64_t sub_21EB67238()
{
  sub_21EB65BBC(&qword_2554778F8, type metadata accessor for ENError);
  return sub_21EBB73F8();
}

void sub_21EB67290()
{
  sub_21EB65BBC(&qword_255477930, type metadata accessor for ENError);
}

uint64_t sub_21EB672BC(unint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t result;
  uint64_t v5;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v5 = OUTLINED_FUNCTION_8(0, a2);
    v6 = v2;
    result = MEMORY[0x2207B8330](MEMORY[0x24BDF5578], v5, &v6);
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_21EB67308()
{
  unint64_t result;

  result = qword_255477CA0;
  if (!qword_255477CA0)
  {
    result = MEMORY[0x2207B8330](MEMORY[0x24BEE0D50], MEMORY[0x24BEE0D00]);
    atomic_store(result, (unint64_t *)&qword_255477CA0);
  }
  return result;
}

uint64_t sub_21EB67344@<X0>(char *a1@<X8>)
{
  uint64_t v1;

  return sub_21EB63B64(*(_OWORD **)(v1 + 32), *(_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 24), a1);
}

uint64_t sub_21EB67350@<X0>(uint64_t a1@<X8>)
{
  uint64_t *v1;

  return sub_21EB64090(v1[4], v1[2], v1[3], a1);
}

uint64_t sub_21EB6735C@<X0>(uint64_t a1@<X8>)
{
  uint64_t *v1;

  return sub_21EB645B4(v1[4], v1[2], v1[3], a1);
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x2207B8318]((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t sub_21EB673A8@<X0>(uint64_t a1@<X3>, uint64_t a2@<X8>)
{
  uint64_t v2;

  return sub_21EB647E4(*(_QWORD *)(v2 + 16), *(_QWORD *)(v2 + 24), a1, a2);
}

unint64_t sub_21EB673B4()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD v4[3];

  result = qword_255477988;
  if (!qword_255477988)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_255477980);
    v2 = __swift_instantiateConcreteTypeFromMangledNameAbstract((uint64_t *)&unk_255477990);
    sub_21EB67618(&qword_255478DC0, (uint64_t *)&unk_255477990);
    v4[1] = v2;
    v4[2] = v3;
    v4[0] = swift_getOpaqueTypeConformance2();
    result = MEMORY[0x2207B8330](MEMORY[0x24BDF5578], v1, v4);
    atomic_store(result, (unint64_t *)&qword_255477988);
  }
  return result;
}

void sub_21EB67460(uint64_t a1@<X8>)
{
  uint64_t *v1;

  sub_21EB64B10(v1[4], v1[2], v1[3], a1);
}

unint64_t sub_21EB6746C()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;
  _QWORD v3[2];

  result = qword_2554779A8;
  if (!qword_2554779A8)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2554779A0);
    sub_21EB67618(&qword_2554779B0, &qword_2554779B8);
    v3[0] = v2;
    v3[1] = sub_21EB674F0();
    result = MEMORY[0x2207B8330](MEMORY[0x24BDEF3E0], v1, v3);
    atomic_store(result, (unint64_t *)&qword_2554779A8);
  }
  return result;
}

unint64_t sub_21EB674F0()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[3];

  result = qword_2554779C0;
  if (!qword_2554779C0)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2554779C8);
    v2[1] = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2554779D0);
    v2[2] = sub_21EB6757C();
    v2[0] = swift_getOpaqueTypeConformance2();
    result = MEMORY[0x2207B8330](MEMORY[0x24BDF5578], v1, v2);
    atomic_store(result, (unint64_t *)&qword_2554779C0);
  }
  return result;
}

unint64_t sub_21EB6757C()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD v5[2];

  result = qword_2554779D8;
  if (!qword_2554779D8)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2554779D0);
    sub_21EB67618(&qword_255478DC0, (uint64_t *)&unk_255477990);
    v3 = v2;
    sub_21EB67618(&qword_2554779E0, &qword_2554779E8);
    v5[0] = v3;
    v5[1] = v4;
    result = MEMORY[0x2207B8330](MEMORY[0x24BDED308], v1, v5);
    atomic_store(result, (unint64_t *)&qword_2554779D8);
  }
  return result;
}

void sub_21EB67618(_QWORD *a1, uint64_t *a2)
{
  if (!*a1)
  {
    OUTLINED_FUNCTION_8(0, a2);
    OUTLINED_FUNCTION_7();
  }
  OUTLINED_FUNCTION_5();
}

uint64_t sub_21EB67644(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2554779C8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_21EB6768C()
{
  uint64_t v0;

  swift_bridgeObjectRelease();
  swift_release();
  if (*(_QWORD *)(v0 + 72))
    swift_release();
  if (*(_QWORD *)(v0 + 88))
    swift_release();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_21EB676E0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;

  return sub_21EB65138(v4 + 32, *(_QWORD *)(v4 + 16), *(_QWORD *)(v4 + 24), a4);
}

uint64_t sub_21EB676EC(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *(_QWORD *)(a1 + 40);
  v3 = *(_QWORD *)(a1 + 56);
  swift_bridgeObjectRetain();
  swift_retain();
  sub_21EB67764(v2);
  sub_21EB67764(v3);
  swift_retain();
  return a1;
}

uint64_t sub_21EB67764(uint64_t result)
{
  if (result)
    return swift_retain();
  return result;
}

uint64_t sub_21EB67774(uint64_t a1, int *a2)
{
  uint64_t v2;
  _QWORD *v4;
  uint64_t (*v6)(uint64_t);

  v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v4;
  *v4 = v2;
  v4[1] = sub_21EB677D8;
  return v6(a1);
}

uint64_t sub_21EB677D8()
{
  uint64_t v0;

  OUTLINED_FUNCTION_0();
  return OUTLINED_FUNCTION_4(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_21EB67800@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = sub_21EBB7674();
  *a1 = result & 1;
  return result;
}

uint64_t sub_21EB6782C()
{
  return sub_21EBB7680();
}

uint64_t sub_21EB67850()
{
  return swift_deallocObject();
}

_BYTE *sub_21EB67860(_BYTE *result)
{
  uint64_t v1;

  *result &= ~*(_BYTE *)(v1 + 16) & 1;
  return result;
}

uint64_t sub_21EB67878()
{
  uint64_t v0;

  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  if (*(_QWORD *)(v0 + 88))
    swift_release();
  if (*(_QWORD *)(v0 + 104))
    swift_release();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_21EB678D4(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;

  v4 = *(_QWORD *)(v1 + 16);
  v5 = *(_QWORD *)(v1 + 24);
  v6 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v6;
  *v6 = v2;
  v6[1] = sub_21EB67954;
  return sub_21EB65258(a1, v4, v5, v1 + 48);
}

uint64_t sub_21EB67954()
{
  uint64_t v0;

  OUTLINED_FUNCTION_0();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

void sub_21EB67980(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  OUTLINED_FUNCTION_5();
}

uint64_t sub_21EB679B8()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_21EB679DC(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  int *v4;
  _QWORD *v5;

  v4 = *(int **)(v1 + 16);
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_21EB67A4C;
  return ((uint64_t (*)(uint64_t, int *))((char *)&dword_255477A20 + dword_255477A20))(a1, v4);
}

uint64_t sub_21EB67A4C()
{
  uint64_t v0;

  OUTLINED_FUNCTION_0();
  return OUTLINED_FUNCTION_4(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_21EB67A70(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_255477A30);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_21EB67AB8(uint64_t a1)
{
  swift_retain();
  return a1;
}

uint64_t sub_21EB67AE0(uint64_t result)
{
  if (result)
    return swift_release();
  return result;
}

uint64_t sub_21EB67AF0(uint64_t a1)
{
  swift_release();
  return a1;
}

uint64_t sub_21EB67B18()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 16))();
}

uint64_t sub_21EB67B38@<X0>(char *a1@<X8>)
{
  uint64_t v1;

  return sub_21EB64428(*(_QWORD *)(v1 + 16), a1);
}

uint64_t __swift_instantiateGenericMetadata(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _QWORD v6[3];

  v6[0] = a2;
  v6[1] = a3;
  v6[2] = a4;
  return MEMORY[0x2207B82AC](a1, v6, a5);
}

uint64_t sub_21EB67B70(uint64_t a1)
{
  uint64_t v2;
  uint64_t v4;
  __int128 v5;

  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_255477938);
  v2 = sub_21EBB7A94();
  v4 = sub_21EB672BC((unint64_t *)&unk_255477940, &qword_255477938);
  v5 = *(_OWORD *)(a1 + 16);
  return MEMORY[0x2207B8330](MEMORY[0x24BDF4AF8], v2, &v4);
}

void sub_21EB67C00()
{
  uint64_t v0;

  v0 = sub_21EBB7848();
  sub_21EBB7788();
  sub_21EBB79B0();
  MEMORY[0x2207B8330](MEMORY[0x24BDF1988], v0);
  OUTLINED_FUNCTION_6();
}

void sub_21EB67C7C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14)
{
  uint64_t v14;

  a14 = a1;
  MEMORY[0x2207B8330](MEMORY[0x24BDF3F50], v14, &a14);
  OUTLINED_FUNCTION_2();
}

void sub_21EB67CB4()
{
  OUTLINED_FUNCTION_1();
  sub_21EB67308();
  OUTLINED_FUNCTION_2();
}

void sub_21EB67CFC()
{
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_255477950);
  OUTLINED_FUNCTION_1();
  sub_21EB67618(&qword_255477958, &qword_255477950);
  OUTLINED_FUNCTION_2();
}

void sub_21EB67D68()
{
  OUTLINED_FUNCTION_1();
  sub_21EBB75A8();
  sub_21EBB7818();
  OUTLINED_FUNCTION_6();
}

uint64_t sub_21EB67DB4()
{
  void (*v0)(uint64_t);

  sub_21EB65BBC(&qword_255477960, v0);
  return OUTLINED_FUNCTION_1();
}

uint64_t OUTLINED_FUNCTION_0()
{
  _QWORD *v0;
  uint64_t v1;

  *(_QWORD *)(v1 - 8) = *v0;
  *(_QWORD *)(v1 - 8) = *v0;
  return swift_task_dealloc();
}

uint64_t OUTLINED_FUNCTION_1()
{
  return swift_getOpaqueTypeConformance2();
}

void OUTLINED_FUNCTION_2()
{
  JUMPOUT(0x2207B82F4);
}

uint64_t OUTLINED_FUNCTION_4(uint64_t (*a1)(void))
{
  return a1();
}

void OUTLINED_FUNCTION_6()
{
  JUMPOUT(0x2207B8330);
}

void OUTLINED_FUNCTION_7()
{
  JUMPOUT(0x2207B8330);
}

uint64_t OUTLINED_FUNCTION_8(uint64_t a1, uint64_t *a2)
{
  return __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
}

void sub_21EB67EA4(uint64_t a1, uint64_t a2)
{
  void *v2;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  void *v12;
  _QWORD *v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD aBlock[6];

  v5 = sub_21EBB7ADC();
  v17 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)&v16 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_21EBB7B00();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)&v16 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_21EB6AA68(0, (unint64_t *)&qword_255477C20);
  v12 = (void *)sub_21EBB7C80();
  v13 = (_QWORD *)swift_allocObject();
  v13[2] = v2;
  v13[3] = a1;
  v13[4] = a2;
  aBlock[4] = sub_21EB6A3D0;
  aBlock[5] = v13;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_21EB83A60;
  aBlock[3] = &block_descriptor;
  v14 = _Block_copy(aBlock);
  v15 = v2;
  swift_retain();
  swift_release();
  sub_21EBB7AF4();
  aBlock[0] = MEMORY[0x24BEE4AF8];
  sub_21EB6A3F4();
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_255477C30);
  sub_21EB6AC18((unint64_t *)&qword_255477EA0, (uint64_t *)&unk_255477C30, MEMORY[0x24BEE12C8]);
  sub_21EBB7CEC();
  MEMORY[0x2207B78E0](0, v11, v7, v14);
  _Block_release(v14);

  (*(void (**)(char *, uint64_t))(v17 + 8))(v7, v5);
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  OUTLINED_FUNCTION_3();
}

uint64_t sub_21EB6809C()
{
  id v0;
  void *v1;
  void *v2;
  id v3;
  void *v5;

  swift_retain();
  sub_21EBB79C8();
  sub_21EBB79C8();
  __swift_instantiateConcreteTypeFromMangledName(&qword_255477C40);
  sub_21EBB79C8();
  sub_21EBB7B78();
  if (qword_2554776B0 != -1)
    swift_once();
  v0 = (id)qword_255478EA8;
  v1 = (void *)sub_21EBB7B48();
  v2 = (void *)sub_21EBB7B48();
  swift_bridgeObjectRelease();
  v3 = objc_msgSend(v0, sel_localizedStringForKey_value_table_, v1, v2, 0);

  sub_21EBB7B60();
  sub_21EB6A434();
  sub_21EBB7CA4();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_release();

  return swift_release();
}

id sub_21EB6830C(void *a1, void *a2)
{
  void *v2;
  id v5;
  objc_super v7;

  v7.receiver = v2;
  v7.super_class = (Class)type metadata accessor for WFInstapaperAccessResourceUserInterface();
  v5 = objc_msgSendSuper2(&v7, sel_initWithUserInterfaceType_attribution_, a1, a2);

  return v5;
}

id sub_21EB683AC(uint64_t a1)
{
  return sub_21EB6A100(a1, type metadata accessor for WFInstapaperAccessResourceUserInterface);
}

uint64_t type metadata accessor for WFInstapaperAccessResourceUserInterface()
{
  return objc_opt_self();
}

uint64_t sub_21EB683D8@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  const void *v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  BOOL v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t result;
  __int128 v13;
  _BYTE v14[6];
  unint64_t v15;

  v2 = (const void *)v1;
  v5 = *(_QWORD *)(v1 + 80);
  v4 = *(_QWORD *)(v1 + 88);
  v13 = *(_OWORD *)(v1 + 16);
  swift_bridgeObjectRetain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_255477C50);
  sub_21EBB79D4();
  swift_bridgeObjectRelease();
  v6 = HIBYTE(v15) & 0xF;
  if ((v15 & 0x2000000000000000) == 0)
    v6 = *(_QWORD *)v14 & 0xFFFFFFFFFFFFLL;
  if (v6)
  {
    v13 = *(_OWORD *)(v1 + 40);
    sub_21EBB79D4();
    swift_bridgeObjectRelease();
    v7 = HIBYTE(v15) & 0xF;
    if ((v15 & 0x2000000000000000) == 0)
      v7 = *(_QWORD *)v14 & 0xFFFFFFFFFFFFLL;
    v8 = v7 != 0;
  }
  else
  {
    v8 = 0;
  }
  v9 = swift_allocObject();
  memcpy((void *)(v9 + 16), v2, 0x60uLL);
  v10 = swift_allocObject();
  memcpy((void *)(v10 + 16), v2, 0x60uLL);
  v11 = swift_allocObject();
  memcpy((void *)(v11 + 16), v2, 0x60uLL);
  sub_21EB6A8AC((uint64_t)v2);
  sub_21EB6A8AC((uint64_t)v2);
  sub_21EB6A8AC((uint64_t)v2);
  result = sub_21EBB79C8();
  *(_QWORD *)a1 = v5;
  *(_QWORD *)(a1 + 8) = v4;
  *(_BYTE *)(a1 + 16) = v8;
  *(_BYTE *)(a1 + 17) = 0;
  *(_QWORD *)(a1 + 24) = sub_21EB6A7F4;
  *(_QWORD *)(a1 + 32) = v9;
  *(_QWORD *)(a1 + 40) = sub_21EB6A800;
  *(_QWORD *)(a1 + 48) = v10;
  *(_QWORD *)(a1 + 56) = &unk_255477C60;
  *(_QWORD *)(a1 + 64) = v11;
  *(_BYTE *)(a1 + 72) = v13;
  *(_QWORD *)(a1 + 80) = *((_QWORD *)&v13 + 1);
  return result;
}

uint64_t sub_21EB685A4@<X0>(_OWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  id v18;
  void *v19;
  void *v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t result;
  char *v27;
  uint64_t v28;
  _OWORD *v29;
  uint64_t v30;
  uint64_t (**v31)@<X0>(char *@<X8>);
  void *v32;
  char *v33;
  uint64_t v34;
  uint64_t v35;
  char *v36;
  uint64_t v37;
  uint64_t v38;
  _OWORD *v39;
  char *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  __int128 v44;
  uint64_t v45;
  uint64_t v46;
  void *v47;

  v39 = a1;
  v43 = a2;
  v2 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_255477C80);
  MEMORY[0x24BDAC7A8](v2);
  v4 = (char *)&v34 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_255477F30);
  v37 = *(_QWORD *)(v5 - 8);
  v38 = v5;
  MEMORY[0x24BDAC7A8](v5);
  v36 = (char *)&v34 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_255477C90);
  MEMORY[0x24BDAC7A8](v7);
  v9 = (uint64_t *)((char *)&v34 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0));
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_255477C98);
  v41 = *(_QWORD *)(v10 - 8);
  v42 = v10;
  MEMORY[0x24BDAC7A8](v10);
  v40 = (char *)&v34 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_21EBB7B78();
  if (qword_2554776B0 != -1)
    swift_once();
  v12 = (id)qword_255478EA8;
  v13 = (void *)sub_21EBB7B48();
  v14 = (void *)sub_21EBB7B48();
  swift_bridgeObjectRelease();
  v15 = objc_msgSend(v12, sel_localizedStringForKey_value_table_, v13, v14, 0);

  v16 = sub_21EBB7B60();
  v35 = v17;

  sub_21EBB7B78();
  v18 = (id)qword_255478EA8;
  v19 = (void *)sub_21EBB7B48();
  v20 = (void *)sub_21EBB7B48();
  swift_bridgeObjectRelease();
  v21 = objc_msgSend(v18, sel_localizedStringForKey_value_table_, v19, v20, 0);

  v22 = sub_21EBB7B60();
  v24 = v23;

  v45 = v22;
  v46 = v24;
  sub_21EBB7458();
  v25 = sub_21EBB7464();
  result = __swift_getEnumTagSinglePayload((uint64_t)v4, 1, v25);
  if ((_DWORD)result == 1)
  {
    __break(1u);
  }
  else
  {
    sub_21EB67308();
    v27 = v36;
    sub_21EBB7854();
    v28 = swift_allocObject();
    v29 = v39;
    memcpy((void *)(v28 + 16), v39, 0x60uLL);
    v30 = v35;
    *v9 = v16;
    v9[1] = v30;
    (*(void (**)(char *, char *, uint64_t))(v37 + 32))((char *)v9 + *(int *)(v7 + 52), v27, v38);
    v31 = (uint64_t (**)@<X0>(char *@<X8>))((char *)v9 + *(int *)(v7 + 56));
    *v31 = sub_21EB6AA60;
    v31[1] = (uint64_t (*)@<X0>(char *@<X8>))v28;
    v44 = v29[4];
    sub_21EB6A8AC((uint64_t)v29);
    __swift_instantiateConcreteTypeFromMangledName(&qword_255477C78);
    sub_21EBB79EC();
    v32 = v47;
    sub_21EB6AA68(0, (unint64_t *)&qword_255477EF0);
    sub_21EB6AC18((unint64_t *)&unk_255477CB0, &qword_255477C90, (uint64_t)&unk_21EBBC03C);
    sub_21EB6AAA0();
    v33 = v40;
    sub_21EBB7920();
    swift_release();
    swift_release();

    sub_21EB67980((uint64_t)v9, &qword_255477C90);
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v41 + 32))(v43, v33, v42);
  }
  return result;
}

uint64_t sub_21EB689DC@<X0>(uint64_t a1@<X0>, char *a2@<X8>)
{
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
  char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  void *v20;
  void *v21;
  id v22;
  uint64_t v23;
  unint64_t v24;
  unint64_t v25;
  uint64_t KeyPath;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t *v32;
  unint64_t v33;
  char *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  id v38;
  void *v39;
  void *v40;
  id v41;
  uint64_t v42;
  unint64_t v43;
  unint64_t v44;
  char *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t *v53;
  uint64_t v54;
  void (*v55)(char *, char *, uint64_t);
  char *v56;
  char *v57;
  uint64_t v58;
  void (*v59)(char *, uint64_t);
  _QWORD v61[3];
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  char *v67;
  uint64_t v68;
  uint64_t v69;
  char *v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  char *v74;
  char *v75;
  char *v76;
  __int128 v77;
  uint64_t v78;
  uint64_t v79;
  unint64_t v80;

  v75 = a2;
  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_255477CC0);
  v71 = *(_QWORD *)(v3 - 8);
  v72 = v3;
  MEMORY[0x24BDAC7A8](v3);
  v70 = (char *)v61 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v69 = __swift_instantiateConcreteTypeFromMangledName(&qword_255477CC8);
  v5 = MEMORY[0x24BDAC7A8](v69);
  v74 = (char *)v61 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v5);
  v73 = (uint64_t)v61 - v7;
  v63 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_255477CD0);
  v62 = *(_QWORD *)(v63 - 8);
  MEMORY[0x24BDAC7A8](v63);
  v9 = (char *)v61 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_255477F60);
  MEMORY[0x24BDAC7A8](v10);
  v12 = (char *)v61 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_255477CE0);
  v64 = *(_QWORD *)(v13 - 8);
  v65 = v13;
  MEMORY[0x24BDAC7A8](v13);
  v15 = (char *)v61 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v68 = __swift_instantiateConcreteTypeFromMangledName(&qword_255477F70);
  v66 = *(_QWORD *)(v68 - 8);
  v16 = MEMORY[0x24BDAC7A8](v68);
  v67 = (char *)v61 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v16);
  v76 = (char *)v61 - v18;
  sub_21EBB7B78();
  if (qword_2554776B0 != -1)
    swift_once();
  v19 = (id)qword_255478EA8;
  v20 = (void *)sub_21EBB7B48();
  v21 = (void *)sub_21EBB7B48();
  swift_bridgeObjectRelease();
  v22 = objc_msgSend(v19, sel_localizedStringForKey_value_table_, v20, v21, 0);

  v23 = sub_21EBB7B60();
  v25 = v24;

  v77 = *(_OWORD *)(a1 + 16);
  v78 = *(_QWORD *)(a1 + 32);
  v61[2] = __swift_instantiateConcreteTypeFromMangledName(&qword_255477C50);
  sub_21EBB79EC();
  v61[0] = a1;
  v79 = v23;
  v80 = v25;
  v61[1] = sub_21EB67308();
  sub_21EBB7AD0();
  KeyPath = swift_getKeyPath();
  v27 = sub_21EBB7B60();
  v29 = v28;
  v30 = v62;
  v31 = v63;
  (*(void (**)(char *, char *, uint64_t))(v62 + 16))(v12, v9, v63);
  v32 = (uint64_t *)&v12[*(int *)(v10 + 36)];
  *v32 = KeyPath;
  v32[1] = v27;
  v32[2] = v29;
  (*(void (**)(char *, uint64_t))(v30 + 8))(v9, v31);
  v33 = sub_21EB6AAF8();
  sub_21EBB78C0();
  sub_21EB67980((uint64_t)v12, (uint64_t *)&unk_255477F60);
  v79 = v10;
  v80 = v33;
  swift_getOpaqueTypeConformance2();
  v34 = v67;
  v35 = v65;
  sub_21EBB78FC();
  (*(void (**)(char *, uint64_t))(v64 + 8))(v15, v35);
  v36 = v66;
  v37 = v68;
  (*(void (**)(char *, char *, uint64_t))(v66 + 32))(v76, v34, v68);
  sub_21EBB7B78();
  v38 = (id)qword_255478EA8;
  v39 = (void *)sub_21EBB7B48();
  v40 = (void *)sub_21EBB7B48();
  swift_bridgeObjectRelease();
  v41 = objc_msgSend(v38, sel_localizedStringForKey_value_table_, v39, v40, 0);

  v42 = sub_21EBB7B60();
  v44 = v43;

  v77 = *(_OWORD *)(v61[0] + 40);
  v78 = *(_QWORD *)(v61[0] + 56);
  sub_21EBB79EC();
  v79 = v42;
  v80 = v44;
  v45 = v70;
  sub_21EBB7530();
  v46 = swift_getKeyPath();
  v47 = sub_21EBB7B60();
  v49 = v48;
  v51 = v71;
  v50 = v72;
  v52 = (uint64_t)v74;
  (*(void (**)(char *, char *, uint64_t))(v71 + 16))(v74, v45, v72);
  v53 = (uint64_t *)(v52 + *(int *)(v69 + 36));
  *v53 = v46;
  v53[1] = v47;
  v53[2] = v49;
  (*(void (**)(char *, uint64_t))(v51 + 8))(v45, v50);
  v54 = v73;
  sub_21EB6AB94(v52, v73, &qword_255477CC8);
  v55 = *(void (**)(char *, char *, uint64_t))(v36 + 16);
  v56 = v76;
  v55(v34, v76, v37);
  sub_21EB6ABC0(v54, v52, &qword_255477CC8);
  v57 = v75;
  v55(v75, v34, v37);
  v58 = __swift_instantiateConcreteTypeFromMangledName(&qword_255477D10);
  sub_21EB6ABC0(v52, (uint64_t)&v57[*(int *)(v58 + 48)], &qword_255477CC8);
  sub_21EB67980(v54, &qword_255477CC8);
  v59 = *(void (**)(char *, uint64_t))(v36 + 8);
  v59(v56, v37);
  sub_21EB67980(v52, &qword_255477CC8);
  return ((uint64_t (*)(char *, uint64_t))v59)(v34, v37);
}

uint64_t sub_21EB6905C(id *a1)
{
  id v1;

  v1 = *a1;
  return sub_21EBB795C();
}

uint64_t sub_21EB69084()
{
  _QWORD *v0;
  _QWORD *v1;

  v0[2] = sub_21EBB7C20();
  v0[3] = sub_21EBB7C14();
  v1 = (_QWORD *)swift_task_alloc();
  v0[4] = v1;
  *v1 = v0;
  v1[1] = sub_21EB690E8;
  return sub_21EB69170();
}

uint64_t sub_21EB690E8()
{
  OUTLINED_FUNCTION_6_0();
  sub_21EBB7BF0();
  return OUTLINED_FUNCTION_0_0();
}

uint64_t sub_21EB69148()
{
  uint64_t v0;

  swift_release();
  return OUTLINED_FUNCTION_4(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_21EB69170()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;

  v1[27] = v0;
  sub_21EBB7C20();
  v1[28] = sub_21EBB7C14();
  v1[29] = sub_21EBB7BF0();
  v1[30] = v2;
  return swift_task_switch();
}

uint64_t sub_21EB691DC()
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
  id v9;
  _QWORD *v10;

  v1 = *(_QWORD *)(v0 + 216);
  v2 = *(_QWORD *)(v1 + 32);
  *(_OWORD *)(v0 + 16) = *(_OWORD *)(v1 + 16);
  *(_QWORD *)(v0 + 32) = v2;
  v3 = *(_QWORD *)(v1 + 32);
  *(_OWORD *)(v0 + 88) = *(_OWORD *)(v1 + 16);
  *(_QWORD *)(v0 + 104) = v3;
  *(_QWORD *)(v0 + 248) = __swift_instantiateConcreteTypeFromMangledName(&qword_255477C50);
  sub_21EBB79D4();
  v4 = *(_QWORD *)(v0 + 112);
  v5 = *(_QWORD *)(v0 + 120);
  v6 = *(_QWORD *)(v1 + 56);
  *(_OWORD *)(v0 + 40) = *(_OWORD *)(v1 + 40);
  *(_QWORD *)(v0 + 56) = v6;
  sub_21EBB79D4();
  v8 = *(_QWORD *)(v0 + 144);
  v7 = *(_QWORD *)(v0 + 152);
  v9 = objc_allocWithZone((Class)type metadata accessor for InstapaperLoginSession());
  *(_QWORD *)(v0 + 256) = sub_21EB6959C(v4, v5, v8, v7);
  v10 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 264) = v10;
  *v10 = v0;
  v10[1] = sub_21EB692E0;
  return sub_21EB69650();
}

uint64_t sub_21EB692E0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  _QWORD *v10;

  v10 = *(_QWORD **)v5;
  *(_QWORD *)(*(_QWORD *)v5 + 272) = v4;
  swift_task_dealloc();
  if (!v4)
  {
    v10[35] = a4;
    v10[36] = a3;
    v10[37] = a2;
    v10[38] = a1;
  }
  return OUTLINED_FUNCTION_0_0();
}

uint64_t sub_21EB69368()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void (**v5)(uint64_t, _QWORD);
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v10;

  v2 = *(_QWORD *)(v0 + 296);
  v1 = *(_QWORD *)(v0 + 304);
  v4 = *(_QWORD *)(v0 + 280);
  v3 = *(_QWORD *)(v0 + 288);
  v10 = *(void **)(v0 + 256);
  v5 = *(void (***)(uint64_t, _QWORD))(v0 + 216);
  swift_release();
  objc_opt_self();
  *(_OWORD *)(v0 + 64) = *(_OWORD *)(v0 + 16);
  *(_QWORD *)(v0 + 80) = *(_QWORD *)(v0 + 32);
  sub_21EBB79D4();
  OUTLINED_FUNCTION_12(*(_QWORD *)(v0 + 160), *(_QWORD *)(v0 + 168), v6, (SEL *)&selRef_setInstapaperUsername_);
  OUTLINED_FUNCTION_12(v1, v2, v7, (SEL *)&selRef_setInstapaperToken_);
  OUTLINED_FUNCTION_12(v3, v4, v8, (SEL *)&selRef_setInstapaperTokenSecret_);
  (*v5)(1, 0);

  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_21EB6944C()
{
  uint64_t v0;
  void *v1;
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;

  v1 = *(void **)(v0 + 272);
  v2 = *(void **)(v0 + 256);
  v3 = *(_QWORD *)(v0 + 216);
  swift_release();

  v4 = (void *)sub_21EBB741C();
  *(_OWORD *)(v0 + 128) = *(_OWORD *)(v3 + 64);
  sub_21EB6AB94(v0 + 128, v0 + 200, &qword_255477C40);
  sub_21EB6AB94(v0 + 136, v0 + 208, &qword_255477C70);
  *(_OWORD *)(v0 + 176) = *(_OWORD *)(v0 + 128);
  *(_QWORD *)(v0 + 192) = v4;
  sub_21EB6A930((id *)(v0 + 200));
  sub_21EB67AB8(v0 + 208);
  v5 = v4;
  __swift_instantiateConcreteTypeFromMangledName(&qword_255477C78);
  sub_21EBB79E0();

  sub_21EB6A958((id *)(v0 + 200));
  sub_21EB6A980(v0 + 208);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_21EB69548@<X0>(uint64_t a1@<X8>)
{
  const void *v1;
  _BYTE v4[96];

  memcpy(v4, v1, sizeof(v4));
  return sub_21EB683D8(a1);
}

void sub_21EB69588(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  v2 = *(void **)(v1 + OBJC_IVAR____TtC11ActionKitUI22InstapaperLoginSession_engine);
  *(_QWORD *)(v1 + OBJC_IVAR____TtC11ActionKitUI22InstapaperLoginSession_engine) = a1;

}

id sub_21EB6959C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  char *v4;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  char *v12;
  objc_super v14;

  *(_QWORD *)&v4[OBJC_IVAR____TtC11ActionKitUI22InstapaperLoginSession_engine] = 0;
  v9 = (uint64_t)&v4[OBJC_IVAR____TtC11ActionKitUI22InstapaperLoginSession_continuation];
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_255477C00);
  __swift_storeEnumTagSinglePayload(v9, 1, 1, v10);
  v11 = &v4[OBJC_IVAR____TtC11ActionKitUI22InstapaperLoginSession_username];
  *(_QWORD *)v11 = a1;
  *((_QWORD *)v11 + 1) = a2;
  v12 = &v4[OBJC_IVAR____TtC11ActionKitUI22InstapaperLoginSession_password];
  *(_QWORD *)v12 = a3;
  *((_QWORD *)v12 + 1) = a4;
  v14.receiver = v4;
  v14.super_class = (Class)type metadata accessor for InstapaperLoginSession();
  return objc_msgSendSuper2(&v14, sel_init);
}

uint64_t sub_21EB69650()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;

  v1[6] = v0;
  v1[7] = sub_21EBB7C20();
  v1[8] = sub_21EBB7C14();
  v1[9] = sub_21EBB7BF0();
  v1[10] = v2;
  return OUTLINED_FUNCTION_0_0();
}

id sub_21EB696BC()
{
  _QWORD *v0;
  id result;
  id v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;

  result = objc_msgSend(objc_allocWithZone(MEMORY[0x24BE00F70]), sel_initWithDelegate_, v0[6]);
  v0[11] = result;
  if (result)
  {
    v2 = result;
    v3 = v0[6];
    v0[12] = sub_21EBB7C14();
    v4 = swift_task_alloc();
    v0[13] = v4;
    *(_QWORD *)(v4 + 16) = v3;
    *(_QWORD *)(v4 + 24) = v2;
    v5 = (_QWORD *)swift_task_alloc();
    v0[14] = v5;
    __swift_instantiateConcreteTypeFromMangledName(&qword_255477C18);
    *v5 = v0;
    v5[1] = sub_21EB697B0;
    return (id)sub_21EBB7D94();
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_21EB697B0()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 120) = v0;
  swift_task_dealloc();
  if (!v0)
  {
    swift_release();
    swift_task_dealloc();
  }
  return OUTLINED_FUNCTION_0_0();
}

uint64_t sub_21EB69820()
{
  uint64_t v0;

  swift_release();
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD))(v0 + 8))(*(_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 24), *(_QWORD *)(v0 + 32), *(_QWORD *)(v0 + 40));
}

uint64_t sub_21EB69868()
{
  uint64_t v0;
  void *v1;

  v1 = *(void **)(v0 + 88);
  swift_release();

  swift_release();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

void sub_21EB698C0(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_255477C08);
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)&v14 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_255477C00);
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 16))(v8, a1, v9);
  __swift_storeEnumTagSinglePayload((uint64_t)v8, 0, 1, v9);
  v10 = a2 + OBJC_IVAR____TtC11ActionKitUI22InstapaperLoginSession_continuation;
  swift_beginAccess();
  sub_21EB6A2A8((uint64_t)v8, v10);
  swift_endAccess();
  v11 = (void *)sub_21EBB7B48();
  v12 = (void *)sub_21EBB7B48();

  v13 = a3;
  sub_21EB69588((uint64_t)a3);
}

void sub_21EB69A10(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v6;
  uint64_t v7;
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
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;

  v22 = a3;
  v23 = a5;
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_255477C00);
  v11 = *(_QWORD *)(v10 - 8);
  MEMORY[0x24BDAC7A8](v10);
  OUTLINED_FUNCTION_4_0();
  v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_255477C08);
  v13 = MEMORY[0x24BDAC7A8](v12);
  v15 = (char *)&v21 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v13);
  v17 = (char *)&v21 - v16;
  v18 = v6 + OBJC_IVAR____TtC11ActionKitUI22InstapaperLoginSession_continuation;
  OUTLINED_FUNCTION_5_0();
  sub_21EB6ABC0(v18, (uint64_t)v17, &qword_255477C08);
  if (__swift_getEnumTagSinglePayload((uint64_t)v17, 1, v10))
  {
    sub_21EB67980((uint64_t)v17, &qword_255477C08);
LABEL_6:
    __swift_storeEnumTagSinglePayload((uint64_t)v15, 1, 1, v10);
    OUTLINED_FUNCTION_5_0();
    sub_21EB6A2A8((uint64_t)v15, v18);
    swift_endAccess();
    OUTLINED_FUNCTION_3();
    return;
  }
  v20 = v22;
  v19 = v23;
  (*(void (**)(uint64_t, char *, uint64_t))(v11 + 16))(v7, v17, v10);
  sub_21EB67980((uint64_t)v17, &qword_255477C08);
  if (a4)
  {
    if (a6)
    {
      v24 = v20;
      v25 = a4;
      v26 = v19;
      v27 = a6;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      sub_21EBB7C08();
      (*(void (**)(uint64_t, uint64_t))(v11 + 8))(v7, v10);
      goto LABEL_6;
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
}

void sub_21EB69C88(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  char *v13;
  id v14;
  id v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t inited;
  uint64_t v27;
  id v28;
  void *v29;
  void *v30;
  id v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  id v36;
  id v37;
  uint64_t v38;
  uint64_t v39;
  id v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  id v46;

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_255477C00);
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  OUTLINED_FUNCTION_4_0();
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_255477C08);
  v9 = MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)&v41 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v9);
  v13 = (char *)&v41 - v12;
  if (!a3)
    goto LABEL_17;
  v44 = v4;
  v45 = v3;
  v14 = a3;
  v15 = (id)sub_21EBB741C();
  v16 = objc_msgSend(v15, sel_domain);
  v17 = sub_21EBB7B60();
  v19 = v18;

  if (v17 == OUTLINED_FUNCTION_11() && v19 == v20)
  {
    swift_bridgeObjectRelease_n();
LABEL_9:
    v23 = objc_msgSend(v15, sel_code);

    if (v23 == (id)401)
    {
      v43 = v7;
      v24 = OUTLINED_FUNCTION_11();
      v41 = v25;
      v42 = v24;
      __swift_instantiateConcreteTypeFromMangledName(&qword_255477C10);
      inited = swift_initStackObject();
      *(_OWORD *)(inited + 16) = xmmword_21EBBC2B0;
      *(_QWORD *)(inited + 32) = sub_21EBB7B60();
      *(_QWORD *)(inited + 40) = v27;
      sub_21EBB7B78();
      if (qword_2554776B0 != -1)
        swift_once();
      v28 = (id)qword_255478EA8;
      v29 = (void *)OUTLINED_FUNCTION_8_0();
      v30 = (void *)OUTLINED_FUNCTION_8_0();
      swift_bridgeObjectRelease();
      v31 = objc_msgSend(v28, sel_localizedStringForKey_value_table_, v29, v30, 0);

      v32 = OUTLINED_FUNCTION_11();
      v34 = v33;

      *(_QWORD *)(inited + 72) = MEMORY[0x24BEE0D00];
      *(_QWORD *)(inited + 48) = v32;
      *(_QWORD *)(inited + 56) = v34;
      v35 = sub_21EBB7B18();
      v36 = objc_allocWithZone(MEMORY[0x24BDD1540]);
      v37 = sub_21EB6A2F0(v42, v41, 401, v35);

      v15 = v37;
      v7 = v43;
    }
    goto LABEL_13;
  }
  v22 = sub_21EBB7D88();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if ((v22 & 1) != 0)
    goto LABEL_9;

LABEL_13:
  v38 = v45 + OBJC_IVAR____TtC11ActionKitUI22InstapaperLoginSession_continuation;
  OUTLINED_FUNCTION_5_0();
  sub_21EB6ABC0(v38, (uint64_t)v13, &qword_255477C08);
  if (__swift_getEnumTagSinglePayload((uint64_t)v13, 1, v6))
  {
    sub_21EB67980((uint64_t)v13, &qword_255477C08);
  }
  else
  {
    v39 = v44;
    (*(void (**)(uint64_t, char *, uint64_t))(v7 + 16))(v44, v13, v6);
    sub_21EB67980((uint64_t)v13, &qword_255477C08);
    v46 = v15;
    v40 = v15;
    sub_21EBB7BFC();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v39, v6);
  }
  __swift_storeEnumTagSinglePayload((uint64_t)v11, 1, 1, v6);
  OUTLINED_FUNCTION_5_0();
  sub_21EB6A2A8((uint64_t)v11, v38);
  swift_endAccess();

LABEL_17:
  OUTLINED_FUNCTION_3();
}

void sub_21EB6A0B8()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

id sub_21EB6A0F0()
{
  return sub_21EB6A100(0, type metadata accessor for InstapaperLoginSession);
}

id sub_21EB6A100(uint64_t a1, uint64_t (*a2)(void))
{
  void *v2;
  objc_super v4;

  v4.receiver = v2;
  v4.super_class = (Class)a2();
  return objc_msgSendSuper2(&v4, sel_dealloc);
}

uint64_t sub_21EB6A18C()
{
  return type metadata accessor for InstapaperLoginSession();
}

uint64_t type metadata accessor for InstapaperLoginSession()
{
  uint64_t result;

  result = qword_255477BE0;
  if (!qword_255477BE0)
    return swift_getSingletonMetadata();
  return result;
}

void sub_21EB6A1CC()
{
  unint64_t v0;

  sub_21EB6A250();
  if (v0 <= 0x3F)
    swift_updateClassMetadata2();
}

void sub_21EB6A250()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_255477BF8)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_255477C00);
    v0 = sub_21EBB7CBC();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_255477BF8);
  }
}

uint64_t sub_21EB6A2A8(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_255477C08);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

id sub_21EB6A2F0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  void *v4;
  void *v7;
  void *v8;
  id v9;

  v7 = (void *)sub_21EBB7B48();
  swift_bridgeObjectRelease();
  if (a4)
  {
    v8 = (void *)sub_21EBB7B0C();
    swift_bridgeObjectRelease();
  }
  else
  {
    v8 = 0;
  }
  v9 = objc_msgSend(v4, sel_initWithDomain_code_userInfo_, v7, a3, v8);

  return v9;
}

void sub_21EB6A39C(uint64_t a1)
{
  uint64_t v1;

  sub_21EB698C0(a1, *(_QWORD *)(v1 + 16), *(void **)(v1 + 24));
}

uint64_t sub_21EB6A3A4()
{
  uint64_t v0;

  swift_release();
  return swift_deallocObject();
}

uint64_t sub_21EB6A3D0()
{
  return sub_21EB6809C();
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

unint64_t sub_21EB6A3F4()
{
  unint64_t result;
  uint64_t v1;

  result = qword_255477E90;
  if (!qword_255477E90)
  {
    v1 = sub_21EBB7ADC();
    result = MEMORY[0x2207B8330](MEMORY[0x24BEE5468], v1);
    atomic_store(result, (unint64_t *)&qword_255477E90);
  }
  return result;
}

unint64_t sub_21EB6A434()
{
  unint64_t result;

  result = qword_255477C48;
  if (!qword_255477C48)
  {
    result = MEMORY[0x2207B8330](&unk_21EBBC354, &type metadata for InstapaperLoginView);
    atomic_store(result, (unint64_t *)&qword_255477C48);
  }
  return result;
}

uint64_t sub_21EB6A470()
{
  uint64_t v0;

  _Block_release(*(const void **)(v0 + 16));
  return swift_deallocObject();
}

void sub_21EB6A494(char a1, uint64_t a2)
{
  uint64_t v2;

  sub_21EB83A64(a1, a2, *(_QWORD *)(v2 + 16));
}

uint64_t destroy for InstapaperLoginView(uint64_t a1)
{
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();

  swift_release();
  return swift_bridgeObjectRelease();
}

_QWORD *initializeWithCopy for InstapaperLoginView(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  id v10;

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
  v8 = (void *)a2[8];
  v7 = a2[9];
  a1[8] = v8;
  a1[9] = v7;
  v9 = a2[11];
  a1[10] = a2[10];
  a1[11] = v9;
  swift_retain();
  swift_bridgeObjectRetain();
  swift_retain();
  swift_bridgeObjectRetain();
  swift_retain();
  v10 = v8;
  swift_retain();
  swift_bridgeObjectRetain();
  return a1;
}

_QWORD *assignWithCopy for InstapaperLoginView(_QWORD *a1, _QWORD *a2)
{
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  swift_retain();
  swift_release();
  a1[2] = a2[2];
  a1[3] = a2[3];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[4] = a2[4];
  swift_retain();
  swift_release();
  a1[5] = a2[5];
  a1[6] = a2[6];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[7] = a2[7];
  swift_retain();
  swift_release();
  v5 = (void *)a1[8];
  v6 = (void *)a2[8];
  a1[8] = v6;
  v7 = v6;

  a1[9] = a2[9];
  swift_retain();
  swift_release();
  a1[10] = a2[10];
  a1[11] = a2[11];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

void *__swift_memcpy96_8(void *a1, const void *a2)
{
  return memcpy(a1, a2, 0x60uLL);
}

uint64_t assignWithTake for InstapaperLoginView(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  *(_OWORD *)a1 = *(_OWORD *)a2;
  swift_release();
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  swift_release();
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 48) = *(_OWORD *)(a2 + 48);
  swift_release();

  *(_OWORD *)(a1 + 64) = *(_OWORD *)(a2 + 64);
  swift_release();
  v4 = *(_QWORD *)(a2 + 88);
  *(_QWORD *)(a1 + 80) = *(_QWORD *)(a2 + 80);
  *(_QWORD *)(a1 + 88) = v4;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for InstapaperLoginView(uint64_t *a1, int a2)
{
  uint64_t v2;

  if (a2)
  {
    if (a2 < 0 && *((_BYTE *)a1 + 96))
    {
      LODWORD(v2) = *(_DWORD *)a1 + 0x7FFFFFFF;
    }
    else
    {
      v2 = *a1;
      if ((unint64_t)*a1 >= 0xFFFFFFFF)
        LODWORD(v2) = -1;
    }
  }
  else
  {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for InstapaperLoginView(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_QWORD *)(result + 88) = 0;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 96) = 1;
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
    *(_BYTE *)(result + 96) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for InstapaperLoginView()
{
  return &type metadata for InstapaperLoginView;
}

uint64_t sub_21EB6A7E0()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_21EB6A7F4@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_21EB685A4((_OWORD *)(v1 + 16), a1);
}

uint64_t sub_21EB6A800()
{
  uint64_t v0;

  return (*(uint64_t (**)(_QWORD, _QWORD))(v0 + 16))(0, 0);
}

uint64_t sub_21EB6A82C()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 16) = v1;
  *v1 = v0;
  v1[1] = sub_21EB6A878;
  return sub_21EB69084();
}

uint64_t sub_21EB6A878()
{
  uint64_t v0;

  OUTLINED_FUNCTION_6_0();
  return OUTLINED_FUNCTION_4(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_21EB6A8AC(uint64_t a1)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 64);
  swift_retain();
  swift_bridgeObjectRetain();
  swift_retain();
  swift_bridgeObjectRetain();
  swift_retain();
  swift_bridgeObjectRetain();
  swift_retain();
  v3 = v2;
  return a1;
}

id *sub_21EB6A930(id *a1)
{
  id v2;

  v2 = *a1;
  return a1;
}

id *sub_21EB6A958(id *a1)
{

  return a1;
}

uint64_t sub_21EB6A980(uint64_t a1)
{
  swift_release();
  return a1;
}

void sub_21EB6A9A8(uint64_t a1, uint64_t a2, void *a3, SEL *a4)
{
  id v6;

  v6 = (id)sub_21EBB7B48();
  swift_bridgeObjectRelease();
  objc_msgSend(a3, *a4, v6);

}

uint64_t objectdestroy_9Tm()
{
  uint64_t v0;

  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();

  swift_release();
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_21EB6AA60@<X0>(char *a1@<X8>)
{
  uint64_t v1;

  return sub_21EB689DC(v1 + 16, a1);
}

uint64_t sub_21EB6AA68(uint64_t a1, unint64_t *a2)
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

unint64_t sub_21EB6AAA0()
{
  unint64_t result;
  uint64_t v1;

  result = qword_255477F10;
  if (!qword_255477F10)
  {
    v1 = sub_21EB6AA68(255, (unint64_t *)&qword_255477EF0);
    result = MEMORY[0x2207B8330](MEMORY[0x24BEC5138], v1);
    atomic_store(result, (unint64_t *)&qword_255477F10);
  }
  return result;
}

unint64_t sub_21EB6AAF8()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD v5[2];

  result = qword_255477CF0;
  if (!qword_255477CF0)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract((uint64_t *)&unk_255477F60);
    sub_21EB6AC18(&qword_255477CF8, (uint64_t *)&unk_255477CD0, MEMORY[0x24BDF53E0]);
    v3 = v2;
    sub_21EB6AC18(&qword_255477D00, &qword_255477D08, MEMORY[0x24BDF1028]);
    v5[0] = v3;
    v5[1] = v4;
    result = MEMORY[0x2207B8330](MEMORY[0x24BDED308], v1, v5);
    atomic_store(result, (unint64_t *)&qword_255477CF0);
  }
  return result;
}

void sub_21EB6AB94(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v3;

  v3 = OUTLINED_FUNCTION_3_0(a1, a2, a3);
  OUTLINED_FUNCTION_9(*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 32));
  OUTLINED_FUNCTION_5();
}

void sub_21EB6ABC0(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v3;

  v3 = OUTLINED_FUNCTION_3_0(a1, a2, a3);
  OUTLINED_FUNCTION_9(*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 16));
  OUTLINED_FUNCTION_5();
}

void sub_21EB6ABEC()
{
  sub_21EB6AC18(&qword_255477D18, (uint64_t *)&unk_255477D20, (uint64_t)&unk_21EBBBF8C);
}

void sub_21EB6AC18(unint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v5;

  if (!*a1)
  {
    v5 = __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    atomic_store(MEMORY[0x2207B8330](a3, v5), a1);
  }
  OUTLINED_FUNCTION_5();
}

uint64_t OUTLINED_FUNCTION_0_0()
{
  return swift_task_switch();
}

uint64_t OUTLINED_FUNCTION_3_0(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  return __swift_instantiateConcreteTypeFromMangledName(a3);
}

uint64_t OUTLINED_FUNCTION_5_0()
{
  return swift_beginAccess();
}

uint64_t OUTLINED_FUNCTION_6_0()
{
  _QWORD *v0;
  uint64_t v1;

  *(_QWORD *)(v1 - 8) = *v0;
  return swift_task_dealloc();
}

uint64_t OUTLINED_FUNCTION_8_0()
{
  return sub_21EBB7B48();
}

uint64_t OUTLINED_FUNCTION_9@<X0>(uint64_t (*a1)(uint64_t, uint64_t)@<X8>)
{
  uint64_t v1;
  uint64_t v2;

  return a1(v1, v2);
}

uint64_t OUTLINED_FUNCTION_10()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_11()
{
  return sub_21EBB7B60();
}

void OUTLINED_FUNCTION_12(uint64_t a1, uint64_t a2, uint64_t a3, SEL *a4)
{
  void *v4;

  sub_21EB6A9A8(a1, a2, v4, a4);
}

void sub_21EB6ACD0(uint64_t a1, uint64_t a2, void *a3, void (**a4)(_QWORD, _QWORD, _QWORD))
{
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  NSString *v13;
  Class v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  _QWORD *v18;
  void *v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  _QWORD aBlock[6];

  v6 = sub_21EBB7ADC();
  v22 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)&v21 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v21 = sub_21EBB7B00();
  v9 = *(_QWORD *)(v21 - 8);
  MEMORY[0x24BDAC7A8](v21);
  v11 = (char *)&v21 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = swift_allocObject();
  *(_QWORD *)(v12 + 16) = a4;
  _Block_copy(a4);
  v13 = (NSString *)sub_21EBB7B48();
  v14 = NSClassFromString(v13);

  if (v14
    && (swift_getObjCClassMetadata(),
        sub_21EB6AA68(0, (unint64_t *)&qword_255477DE0),
        (v15 = swift_dynamicCastMetatype()) != 0))
  {
    v16 = v15;
    sub_21EB6AA68(0, (unint64_t *)&qword_255477C20);
    v17 = (void *)sub_21EBB7C80();
    v18 = (_QWORD *)swift_allocObject();
    v18[2] = v16;
    v18[3] = a3;
    v18[4] = sub_21EB6C5A4;
    v18[5] = v12;
    aBlock[4] = sub_21EB6C5D4;
    aBlock[5] = v18;
    aBlock[0] = MEMORY[0x24BDAC760];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_21EB83A60;
    aBlock[3] = &block_descriptor_32;
    v19 = _Block_copy(aBlock);
    v20 = a3;
    swift_retain();
    swift_release();
    sub_21EBB7AF4();
    aBlock[0] = MEMORY[0x24BEE4AF8];
    sub_21EB6C4FC((unint64_t *)&qword_255477E90, (uint64_t (*)(uint64_t))MEMORY[0x24BEE5458], MEMORY[0x24BEE5468]);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_255477C30);
    sub_21EB6C53C();
    sub_21EBB7CEC();
    MEMORY[0x2207B78E0](0, v11, v8, v19);
    _Block_release(v19);

    (*(void (**)(char *, uint64_t))(v22 + 8))(v8, v6);
    (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v21);
    swift_release();
    _Block_release(a4);
  }
  else
  {
    a4[2](a4, 0, 0);
    swift_release();
    _Block_release(a4);
  }
}

void sub_21EB6AFB4(uint64_t a1, uint64_t a2, void (*a3)(_QWORD, _QWORD, _QWORD), void *a4)
{
  uint64_t v7;
  _QWORD *v8;

  sub_21EB6AA68(0, &qword_255477DE8);
  v7 = swift_dynamicCastMetatype();
  if (v7)
  {
    sub_21EB6B210(v7, a3, a4);
  }
  else
  {
    v8 = (_QWORD *)swift_allocObject();
    v8[2] = a1;
    v8[3] = a3;
    v8[4] = a4;
    sub_21EB6C610();
    swift_retain();
    sub_21EBB7CA4();
    swift_release();
  }
}

uint64_t sub_21EB6B088(void *a1, uint64_t a2, void (*a3)(uint64_t, void *, _QWORD))
{
  void *v4;
  id v5;
  uint64_t v6;
  void *v7;

  v4 = a1;
  if (a1)
  {
    objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_saveAccount_, a1);
    v5 = objc_msgSend(v4, sel_accountID);
    v6 = sub_21EBB7B60();
    v4 = v7;

  }
  else
  {
    v6 = 0;
  }
  a3(v6, v4, 0);
  return swift_bridgeObjectRelease();
}

void sub_21EB6B198(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  void *v6;
  uint64_t v7;
  id v8;

  if (!a2)
  {
    v6 = 0;
    if (a3)
      goto LABEL_3;
LABEL_5:
    v7 = 0;
    goto LABEL_6;
  }
  v6 = (void *)sub_21EBB7B48();
  if (!a3)
    goto LABEL_5;
LABEL_3:
  v7 = sub_21EBB741C();
LABEL_6:
  v8 = (id)v7;
  (*(void (**)(uint64_t, void *))(a4 + 16))(a4, v6);

}

void sub_21EB6B210(uint64_t a1, void (*a2)(_QWORD, _QWORD, _QWORD), void *a3)
{
  void *v3;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  void *ObjCClassFromMetadata;
  id v19;
  void *v20;
  void (*v21)(char *, char *, uint64_t);
  char *v22;
  id v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  id v27;
  void *v28;
  _QWORD *v29;
  void *v30;
  id v31;
  id v32;
  id v33;
  void *v34;
  id v35;
  id *v36;
  void *v37;
  uint64_t v38;
  void *v39;
  id v40;
  id v41;
  id v42;
  char *v43;
  uint64_t v44;
  uint64_t v45;
  void *v46;
  id v47;
  void *v48;
  void *v49;
  id v50;
  void *v51;
  uint64_t v52;
  id v53;
  uint64_t v54;
  char *v55;
  id v56;
  char *v57;
  id v58;
  id v59;
  uint64_t v60;
  uint64_t v61;
  void *v62;
  _QWORD *v63;

  v58 = a3;
  v6 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_255477C80);
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)&v52 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = sub_21EBB7464();
  v10 = *(_QWORD *)(v9 - 8);
  v11 = MEMORY[0x24BDAC7A8](v9);
  v13 = (char *)&v52 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = MEMORY[0x24BDAC7A8](v11);
  v16 = (char *)&v52 - v15;
  MEMORY[0x24BDAC7A8](v14);
  v57 = (char *)&v52 - v17;
  ObjCClassFromMetadata = (void *)swift_getObjCClassFromMetadata();
  v59 = objc_msgSend(ObjCClassFromMetadata, sel_sessionManager);
  v19 = objc_msgSend(ObjCClassFromMetadata, sel_redirectURI);
  if (!v19)
  {
    OUTLINED_FUNCTION_6_1((uint64_t)v8, 1);
    goto LABEL_8;
  }
  v20 = v19;
  sub_21EBB7440();

  v21 = *(void (**)(char *, char *, uint64_t))(v10 + 32);
  v21(v8, v16, v9);
  OUTLINED_FUNCTION_6_1((uint64_t)v8, 0);
  if (__swift_getEnumTagSinglePayload((uint64_t)v8, 1, v9) == 1)
  {
LABEL_8:
    sub_21EB6C368((uint64_t)v8);
    a2(0, 0, 0);
    OUTLINED_FUNCTION_1_0();
    return;
  }
  v55 = v13;
  v56 = v3;
  v22 = v57;
  v21(v57, v8, v9);
  v53 = objc_msgSend((id)objc_opt_self(), sel_sharedManager);
  sub_21EB6AA68(0, &qword_255477DC0);
  v54 = v10;
  (*(void (**)(char *, char *, uint64_t))(v10 + 16))(v16, v22, v9);
  v23 = sub_21EB6B804((uint64_t)v16, 0, 0);
  v24 = objc_msgSend(ObjCClassFromMetadata, sel_responseType);
  if (!v24)
  {
    sub_21EBB7B60();
    v24 = (id)sub_21EBB7B48();
    OUTLINED_FUNCTION_5_1();
  }
  v25 = sub_21EB6C3A8(ObjCClassFromMetadata);
  if (v25)
  {
    sub_21EB6B8B8(v25);
    OUTLINED_FUNCTION_5_1();
    v26 = OUTLINED_FUNCTION_2_0();
    *(_QWORD *)(v26 + 16) = 0;
    sub_21EB6AA68(0, &qword_255477DC8);
    v52 = sub_21EBB7BCC();
    swift_bridgeObjectRelease();
  }
  else
  {
    v26 = OUTLINED_FUNCTION_2_0();
    v52 = 0;
    *(_QWORD *)(v26 + 16) = 0;
  }
  v27 = v53;
  v28 = (void *)sub_21EBB7434();
  v29 = (_QWORD *)OUTLINED_FUNCTION_2_0();
  v29[2] = v26;
  v29[3] = v27;
  v29[4] = v23;
  v29[5] = a1;
  v29[6] = a2;
  v29[7] = v58;
  v62 = sub_21EB6C458;
  v63 = v29;
  v60 = MEMORY[0x24BDAC760];
  v61 = 1107296256;
  v30 = OUTLINED_FUNCTION_4_1((uint64_t)sub_21EB6BFCC);
  OUTLINED_FUNCTION_3_1();
  v31 = v27;
  v32 = v23;
  swift_retain();
  swift_release();
  v58 = v24;
  v33 = v24;
  v34 = (void *)v52;
  v35 = objc_msgSend(v59, sel_authorizationSessionWithResponseType_scopes_redirectURI_completionHandler_, v33, v52, v28, v30);
  _Block_release(v30);

  v36 = (id *)(v26 + 16);
  swift_beginAccess();
  v37 = *(void **)(v26 + 16);
  *(_QWORD *)(v26 + 16) = v35;

  v38 = OUTLINED_FUNCTION_2_0();
  *(_QWORD *)(v38 + 16) = v26;
  *(_QWORD *)(v38 + 24) = v31;
  v62 = sub_21EB6C4A8;
  v63 = (_QWORD *)v38;
  v60 = MEMORY[0x24BDAC760];
  v61 = 1107296256;
  v39 = OUTLINED_FUNCTION_4_1((uint64_t)sub_21EB6C288);
  OUTLINED_FUNCTION_3_1();
  v40 = v31;
  swift_release();
  v41 = objc_msgSend(v32, sel_action);
  if (!v41)
  {
    sub_21EBB7B60();
    v41 = (id)sub_21EBB7B48();
    OUTLINED_FUNCTION_5_1();
  }
  v53 = v32;
  v42 = objc_msgSend(v32, sel_URL, v52);
  v43 = v55;
  sub_21EBB7440();

  sub_21EBB744C();
  v45 = v44;
  (*(void (**)(char *, uint64_t))(v54 + 8))(v43, v9);
  if (v45)
  {
    v46 = (void *)sub_21EBB7B48();
    swift_bridgeObjectRelease();
  }
  else
  {
    v46 = 0;
  }
  objc_msgSend(v40, sel_registerHandler_forIncomingRequestsWithAction_scheme_, v39, v41, v46);

  _Block_release(v39);
  v47 = objc_msgSend(v56, sel_presentationAnchor);
  v48 = v58;
  if (!v47)
  {
    OUTLINED_FUNCTION_0_1();
    OUTLINED_FUNCTION_7_0();
    OUTLINED_FUNCTION_1_0();

LABEL_21:
    return;
  }
  v49 = v47;
  swift_beginAccess();
  if (*v36)
  {
    v50 = objc_msgSend(*v36, sel_authenticationSessionWithPresentationAnchor_, v49);
    if (v50)
    {
      v51 = v50;
      objc_msgSend(v50, sel_start);

      OUTLINED_FUNCTION_1_0();
      OUTLINED_FUNCTION_0_1();
      OUTLINED_FUNCTION_7_0();
      return;
    }
    OUTLINED_FUNCTION_0_1();
    OUTLINED_FUNCTION_7_0();
    OUTLINED_FUNCTION_1_0();

    goto LABEL_21;
  }
  __break(1u);
}

id sub_21EB6B804(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;

  v5 = (void *)sub_21EBB7434();
  if (a3)
  {
    v6 = (void *)sub_21EBB7B48();
    swift_bridgeObjectRelease();
  }
  else
  {
    v6 = 0;
  }
  v7 = objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_requestWithURL_fromSourceApplication_, v5, v6);

  v8 = sub_21EBB7464();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 8))(a1, v8);
  return v7;
}

uint64_t sub_21EB6B8B8(uint64_t a1)
{
  uint64_t v2;
  uint64_t result;
  uint64_t v4;
  uint64_t v5;

  v2 = *(_QWORD *)(a1 + 16);
  result = MEMORY[0x24BEE4AF8];
  if (v2)
  {
    v5 = MEMORY[0x24BEE4AF8];
    sub_21EBB7D34();
    v4 = a1 + 40;
    do
    {
      swift_bridgeObjectRetain();
      sub_21EBB7B48();
      swift_bridgeObjectRelease();
      sub_21EBB7D1C();
      sub_21EBB7D40();
      sub_21EBB7D4C();
      sub_21EBB7D28();
      v4 += 16;
      --v2;
    }
    while (v2);
    return v5;
  }
  return result;
}

void sub_21EB6B978(void *a1, void *a2, uint64_t a3, void *a4, void *a5, uint64_t a6, void (*a7)(_QWORD, _QWORD, void *), uint64_t a8)
{
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  void *v17;
  id v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *ObjCClassFromMetadata;
  id v24;
  id v25;
  _QWORD *v26;
  uint64_t v27;
  void *v28;
  id v29;
  id v30;
  void *v31;
  id v32;
  char v33;
  id v34;
  void (*v35)(_QWORD, _QWORD, void *);
  uint64_t v36;
  _QWORD aBlock[6];

  v35 = a7;
  v36 = a8;
  v13 = sub_21EBB7464();
  v14 = *(_QWORD *)(v13 - 8);
  MEMORY[0x24BDAC7A8](v13);
  v16 = (char *)&v35 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_beginAccess();
  swift_beginAccess();
  v17 = *(void **)(a3 + 16);
  *(_QWORD *)(a3 + 16) = 0;

  v18 = objc_msgSend(a5, sel_action);
  if (!v18)
  {
    sub_21EBB7B60();
    v18 = (id)sub_21EBB7B48();
    swift_bridgeObjectRelease();
  }
  v19 = objc_msgSend(a5, sel_URL, v35);
  sub_21EBB7440();

  sub_21EBB744C();
  v21 = v20;
  (*(void (**)(char *, uint64_t))(v14 + 8))(v16, v13);
  if (v21)
  {
    v22 = (void *)sub_21EBB7B48();
    swift_bridgeObjectRelease();
  }
  else
  {
    v22 = 0;
  }
  objc_msgSend(a4, sel_removeHandlerForIncomingRequestsWithAction_scheme_, v18, v22);

  if (a1)
  {
    ObjCClassFromMetadata = (void *)swift_getObjCClassFromMetadata();
    v24 = a1;
    v25 = objc_msgSend(ObjCClassFromMetadata, sel_accountWithCredential_, v24);
    if ((objc_msgSend(ObjCClassFromMetadata, sel_saveAccount_, v25) & 1) != 0)
    {
      v26 = (_QWORD *)swift_allocObject();
      v27 = v36;
      v26[2] = v35;
      v26[3] = v27;
      v26[4] = v25;
      aBlock[4] = sub_21EB6C4B4;
      aBlock[5] = v26;
      aBlock[0] = MEMORY[0x24BDAC760];
      aBlock[1] = 1107296256;
      aBlock[2] = sub_21EB6BF78;
      aBlock[3] = &block_descriptor_17;
      v28 = _Block_copy(aBlock);
      swift_retain();
      v29 = v25;
      swift_release();
      objc_msgSend(v29, sel_refreshWithCompletionHandler_, v28);
      _Block_release(v28);

    }
    else
    {

    }
  }
  else if (a2)
  {
    _s3__C4CodeOMa_0(0);
    aBlock[0] = 1;
    v30 = a2;
    sub_21EB6C4FC(qword_255477DD0, (uint64_t (*)(uint64_t))_s3__C4CodeOMa_0, (uint64_t)&unk_21EBBBC78);
    v31 = 0;
    if ((sub_21EBB73C8() & 1) == 0)
    {
      type metadata accessor for Code(0);
      aBlock[0] = 106;
      v32 = a2;
      sub_21EB6C4FC(&qword_255477758, (uint64_t (*)(uint64_t))type metadata accessor for Code, (uint64_t)&unk_21EBBBAC0);
      v33 = sub_21EBB73C8();

      v31 = 0;
      if ((v33 & 1) == 0)
      {
        v34 = a2;
        v31 = a2;
      }
    }
    v35(0, 0, v31);

  }
}

uint64_t sub_21EB6BCF8(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  uint64_t v7;
  uint64_t (*v8)(uint64_t);
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  void *v14;
  _QWORD *v15;
  void *v16;
  id v17;
  uint64_t v19;
  uint64_t v20;
  _QWORD aBlock[6];

  v7 = sub_21EBB7ADC();
  v8 = (uint64_t (*)(uint64_t))MEMORY[0x24BEE5458];
  v20 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7);
  v10 = (char *)&v19 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v19 = sub_21EBB7B00();
  v11 = *(_QWORD *)(v19 - 8);
  MEMORY[0x24BDAC7A8](v19);
  v13 = (char *)&v19 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_21EB6AA68(0, (unint64_t *)&qword_255477C20);
  v14 = (void *)sub_21EBB7C80();
  v15 = (_QWORD *)swift_allocObject();
  v15[2] = a2;
  v15[3] = a3;
  v15[4] = a4;
  aBlock[4] = sub_21EB6C4F0;
  aBlock[5] = v15;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_21EB83A60;
  aBlock[3] = &block_descriptor_23;
  v16 = _Block_copy(aBlock);
  swift_retain();
  v17 = a4;
  swift_release();
  sub_21EBB7AF4();
  aBlock[0] = MEMORY[0x24BEE4AF8];
  sub_21EB6C4FC((unint64_t *)&qword_255477E90, v8, MEMORY[0x24BEE5468]);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_255477C30);
  sub_21EB6C53C();
  sub_21EBB7CEC();
  MEMORY[0x2207B78E0](0, v13, v10, v16);
  _Block_release(v16);

  (*(void (**)(char *, uint64_t))(v20 + 8))(v10, v7);
  return (*(uint64_t (**)(char *, uint64_t))(v11 + 8))(v13, v19);
}

uint64_t sub_21EB6BF08(void (*a1)(uint64_t, uint64_t, _QWORD), int a2, id a3)
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v4 = objc_msgSend(a3, sel_accountID);
  v5 = sub_21EBB7B60();
  v7 = v6;

  a1(v5, v7, 0);
  return swift_bridgeObjectRelease();
}

void sub_21EB6BF78(uint64_t a1, void *a2)
{
  void (*v3)(void *);
  id v4;

  v3 = *(void (**)(void *))(a1 + 32);
  swift_retain();
  v4 = a2;
  v3(a2);
  swift_release();

}

void sub_21EB6BFCC(uint64_t a1, void *a2, void *a3)
{
  void (*v5)(void *, void *);
  id v6;
  id v7;

  v5 = *(void (**)(void *, void *))(a1 + 32);
  swift_retain();
  v7 = a2;
  v6 = a3;
  v5(a2, a3);
  swift_release();

}

void sub_21EB6C040(void *a1, uint64_t a2, void *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  char *v12;
  void *v13;
  id v14;
  id v15;
  void *v16;
  void (*v17)(char *, uint64_t);
  unsigned int v18;
  id v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;

  v6 = sub_21EBB7464();
  v7 = *(_QWORD *)(v6 - 8);
  v8 = MEMORY[0x24BDAC7A8](v6);
  v10 = (char *)&v24 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v8);
  v12 = (char *)&v24 - v11;
  swift_beginAccess();
  v13 = *(void **)(a2 + 16);
  if (v13)
  {
    v14 = v13;
    v15 = objc_msgSend(a1, sel_URL);
    sub_21EBB7440();

    v16 = (void *)sub_21EBB7434();
    v17 = *(void (**)(char *, uint64_t))(v7 + 8);
    v17(v12, v6);
    v18 = objc_msgSend(v14, sel_resumeSessionWithURL_, v16);

    if (v18)
    {
      v19 = objc_msgSend(a1, sel_action);
      if (!v19)
      {
        sub_21EBB7B60();
        v19 = (id)sub_21EBB7B48();
        swift_bridgeObjectRelease();
      }
      v20 = objc_msgSend(a1, sel_URL);
      sub_21EBB7440();

      sub_21EBB744C();
      v22 = v21;
      v17(v10, v6);
      if (v22)
      {
        v23 = sub_21EBB7B48();
        swift_bridgeObjectRelease();
      }
      else
      {
        v23 = 0;
      }
      objc_msgSend(a3, sel_removeHandlerForIncomingRequestsWithAction_scheme_, v19, v23);

      v14 = (id)v23;
    }

  }
}

id sub_21EB6C228(void *a1, void *a2)
{
  void *v2;
  id v5;
  objc_super v7;

  v7.receiver = v2;
  v7.super_class = (Class)type metadata accessor for WFAccountAccessResourceUserInterface();
  v5 = objc_msgSendSuper2(&v7, sel_initWithUserInterfaceType_attribution_, a1, a2);

  return v5;
}

void sub_21EB6C288(uint64_t a1, void *a2)
{
  void (*v3)(void);
  id v4;

  v3 = *(void (**)(void))(a1 + 32);
  swift_retain();
  v4 = a2;
  v3();
  swift_release();

}

id sub_21EB6C318()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for WFAccountAccessResourceUserInterface();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for WFAccountAccessResourceUserInterface()
{
  return objc_opt_self();
}

uint64_t sub_21EB6C368(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_255477C80);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_21EB6C3A8(void *a1)
{
  id v1;
  void *v2;
  uint64_t v3;

  v1 = objc_msgSend(a1, sel_scopes);
  if (!v1)
    return 0;
  v2 = v1;
  v3 = sub_21EBB7BD8();

  return v3;
}

uint64_t sub_21EB6C3FC()
{
  uint64_t v0;

  return swift_deallocObject();
}

uint64_t sub_21EB6C420()
{
  uint64_t v0;

  swift_release();
  OUTLINED_FUNCTION_8_1();

  swift_release();
  return swift_deallocObject();
}

void sub_21EB6C458(void *a1, void *a2)
{
  uint64_t v2;

  sub_21EB6B978(a1, a2, *(_QWORD *)(v2 + 16), *(void **)(v2 + 24), *(void **)(v2 + 32), *(_QWORD *)(v2 + 40), *(void (**)(_QWORD, _QWORD, void *))(v2 + 48), *(_QWORD *)(v2 + 56));
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

uint64_t sub_21EB6C480()
{
  swift_release();
  OUTLINED_FUNCTION_8_1();
  return swift_deallocObject();
}

void sub_21EB6C4A8(void *a1)
{
  uint64_t v1;

  sub_21EB6C040(a1, *(_QWORD *)(v1 + 16), *(void **)(v1 + 24));
}

uint64_t sub_21EB6C4B4(uint64_t a1)
{
  uint64_t v1;

  return sub_21EB6BCF8(a1, *(_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 24), *(void **)(v1 + 32));
}

uint64_t objectdestroy_13Tm()
{
  uint64_t v0;

  swift_release();

  return swift_deallocObject();
}

uint64_t sub_21EB6C4F0()
{
  uint64_t v0;

  return sub_21EB6BF08(*(void (**)(uint64_t, uint64_t, _QWORD))(v0 + 16), *(_QWORD *)(v0 + 24), *(id *)(v0 + 32));
}

uint64_t sub_21EB6C4FC(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = a2(255);
    result = MEMORY[0x2207B8330](a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_21EB6C53C()
{
  unint64_t result;
  uint64_t v1;

  result = qword_255477EA0;
  if (!qword_255477EA0)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract((uint64_t *)&unk_255477C30);
    result = MEMORY[0x2207B8330](MEMORY[0x24BEE12C8], v1);
    atomic_store(result, (unint64_t *)&qword_255477EA0);
  }
  return result;
}

uint64_t sub_21EB6C580()
{
  uint64_t v0;

  _Block_release(*(const void **)(v0 + 16));
  return swift_deallocObject();
}

void sub_21EB6C5A4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;

  sub_21EB6B198(a1, a2, a3, *(_QWORD *)(v3 + 16));
}

uint64_t sub_21EB6C5AC()
{
  OUTLINED_FUNCTION_8_1();
  swift_release();
  return swift_deallocObject();
}

void sub_21EB6C5D4()
{
  uint64_t v0;

  sub_21EB6AFB4(*(_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 24), *(void (**)(_QWORD, _QWORD, _QWORD))(v0 + 32), *(void **)(v0 + 40));
}

uint64_t sub_21EB6C5E0()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_21EB6C604(void *a1)
{
  uint64_t v1;

  return sub_21EB6B088(a1, *(_QWORD *)(v1 + 16), *(void (**)(uint64_t, void *, _QWORD))(v1 + 24));
}

unint64_t sub_21EB6C610()
{
  unint64_t result;

  result = qword_255477DF0;
  if (!qword_255477DF0)
  {
    result = MEMORY[0x2207B8330](&unk_21EBBBA70, &type metadata for AccountLoginView);
    atomic_store(result, (unint64_t *)&qword_255477DF0);
  }
  return result;
}

uint64_t OUTLINED_FUNCTION_0_1()
{
  uint64_t v0;
  uint64_t (*v1)(_QWORD, uint64_t);
  uint64_t v2;

  return v1(*(_QWORD *)(v2 - 200), v0);
}

void OUTLINED_FUNCTION_1_0()
{
  uint64_t v0;

}

uint64_t OUTLINED_FUNCTION_2_0()
{
  return swift_allocObject();
}

uint64_t OUTLINED_FUNCTION_3_1()
{
  return swift_retain();
}

void *OUTLINED_FUNCTION_4_1@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v2 - 136) = a1;
  *(_QWORD *)(v2 - 128) = v1;
  return _Block_copy((const void *)(v2 - 152));
}

uint64_t OUTLINED_FUNCTION_5_1()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_6_1(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  return __swift_storeEnumTagSinglePayload(a1, a2, 1, v2);
}

uint64_t OUTLINED_FUNCTION_7_0()
{
  return swift_release();
}

void OUTLINED_FUNCTION_8_1()
{
  uint64_t v0;

}

uint64_t sub_21EB6C6C4(uint64_t a1, uint64_t a2)
{
  void *v2;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  void *v12;
  _QWORD *v13;
  void *v14;
  id v15;
  uint64_t v17;
  uint64_t v18;
  _QWORD aBlock[6];

  v5 = sub_21EBB7ADC();
  v18 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)&v17 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_21EBB7B00();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)&v17 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_21EB6AA68(0, (unint64_t *)&qword_255477C20);
  v12 = (void *)sub_21EBB7C80();
  v13 = (_QWORD *)swift_allocObject();
  v13[2] = v2;
  v13[3] = a1;
  v13[4] = a2;
  aBlock[4] = sub_21EB6CCA8;
  aBlock[5] = v13;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_21EB83A60;
  aBlock[3] = &block_descriptor_1;
  v14 = _Block_copy(aBlock);
  v15 = v2;
  swift_retain();
  swift_release();
  sub_21EBB7AF4();
  aBlock[0] = MEMORY[0x24BEE4AF8];
  sub_21EB6A3F4();
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_255477C30);
  sub_21EB6AC18((unint64_t *)&qword_255477EA0, (uint64_t *)&unk_255477C30, MEMORY[0x24BEE12C8]);
  sub_21EBB7CEC();
  MEMORY[0x2207B78E0](0, v11, v7, v14);
  _Block_release(v14);

  (*(void (**)(char *, uint64_t))(v18 + 8))(v7, v5);
  return (*(uint64_t (**)(char *, uint64_t))(v9 + 8))(v11, v8);
}

uint64_t sub_21EB6C8D0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  char v24;
  _QWORD __dst[17];
  _QWORD __src[18];

  swift_retain();
  sub_21EBB79C8();
  v24 = __src[0];
  v23 = __src[1];
  sub_21EBB79C8();
  v21 = __src[1];
  v22 = __src[0];
  v20 = __src[2];
  sub_21EBB79C8();
  v18 = __src[1];
  v19 = __src[0];
  v17 = __src[2];
  __dst[1] = 0xE000000000000000;
  sub_21EBB79C8();
  v4 = __src[0];
  v5 = __src[1];
  v6 = __src[2];
  __dst[0] = 0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_255477C40);
  sub_21EBB79C8();
  v7 = __src[0];
  v8 = __src[1];
  sub_21EBB7B78();
  if (qword_2554776B0 != -1)
    swift_once();
  v9 = (id)qword_255478EA8;
  v10 = (void *)sub_21EBB7B48();
  v11 = (void *)sub_21EBB7B48();
  swift_bridgeObjectRelease();
  v12 = objc_msgSend(v9, sel_localizedStringForKey_value_table_, v10, v11, 0);

  v13 = sub_21EBB7B60();
  v15 = v14;

  __src[0] = a2;
  __src[1] = a3;
  LOBYTE(__src[2]) = v24;
  __src[3] = v23;
  __src[4] = v22;
  __src[5] = v21;
  __src[6] = v20;
  __src[7] = v19;
  __src[8] = v18;
  __src[9] = v17;
  __src[10] = v4;
  __src[11] = v5;
  __src[12] = v6;
  __src[13] = v7;
  __src[14] = v8;
  __src[15] = v13;
  __src[16] = v15;
  memcpy(__dst, __src, sizeof(__dst));
  sub_21EB6ED90();
  sub_21EBB7CA4();
  return sub_21EB6EDCC((uint64_t)__src);
}

id sub_21EB6CB8C(void *a1, void *a2)
{
  void *v2;
  id v5;
  objc_super v7;

  v7.receiver = v2;
  v7.super_class = (Class)type metadata accessor for WFPinboardAccessResourceUserInterface();
  v5 = objc_msgSendSuper2(&v7, sel_initWithUserInterfaceType_attribution_, a1, a2);

  return v5;
}

id sub_21EB6CC2C()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for WFPinboardAccessResourceUserInterface();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for WFPinboardAccessResourceUserInterface()
{
  return objc_opt_self();
}

uint64_t sub_21EB6CC7C()
{
  uint64_t v0;

  swift_release();
  return swift_deallocObject();
}

uint64_t sub_21EB6CCA8()
{
  uint64_t *v0;

  return sub_21EB6C8D0(v0[2], v0[3], v0[4]);
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

uint64_t sub_21EB6CCCC@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  const void *v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t result;
  __int128 v14;
  __int128 v15;

  v2 = (const void *)v1;
  v5 = *(_QWORD *)(v1 + 120);
  v4 = *(_QWORD *)(v1 + 128);
  swift_bridgeObjectRetain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2554787A0);
  sub_21EBB79D4();
  if (v14 == 1)
  {
    v14 = *(_OWORD *)(v1 + 80);
    __swift_instantiateConcreteTypeFromMangledName(&qword_255477C50);
    sub_21EBB79D4();
    swift_bridgeObjectRelease();
    v6 = HIBYTE(*((_QWORD *)&v15 + 1)) & 0xFLL;
    if ((*((_QWORD *)&v15 + 1) & 0x2000000000000000) == 0)
      v6 = v15 & 0xFFFFFFFFFFFFLL;
    if (v6)
    {
      sub_21EBB79D4();
      v14 = v15;
      sub_21EB67308();
      v7 = sub_21EBB7CD4();
      swift_bridgeObjectRelease();
      goto LABEL_13;
    }
LABEL_12:
    v7 = 0;
    goto LABEL_13;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_255477C50);
  sub_21EBB79D4();
  swift_bridgeObjectRelease();
  v8 = HIBYTE(*((_QWORD *)&v14 + 1)) & 0xFLL;
  if ((*((_QWORD *)&v14 + 1) & 0x2000000000000000) == 0)
    v8 = v14 & 0xFFFFFFFFFFFFLL;
  if (!v8)
    goto LABEL_12;
  sub_21EBB79D4();
  swift_bridgeObjectRelease();
  v9 = HIBYTE(*((_QWORD *)&v14 + 1)) & 0xFLL;
  if ((*((_QWORD *)&v14 + 1) & 0x2000000000000000) == 0)
    v9 = v14 & 0xFFFFFFFFFFFFLL;
  v7 = v9 != 0;
LABEL_13:
  v10 = swift_allocObject();
  memcpy((void *)(v10 + 16), v2, 0x88uLL);
  v11 = swift_allocObject();
  memcpy((void *)(v11 + 16), v2, 0x88uLL);
  v12 = swift_allocObject();
  memcpy((void *)(v12 + 16), v2, 0x88uLL);
  sub_21EB6F3A0((uint64_t)v2);
  sub_21EB6F3A0((uint64_t)v2);
  sub_21EB6F3A0((uint64_t)v2);
  result = sub_21EBB79C8();
  *(_QWORD *)a1 = v5;
  *(_QWORD *)(a1 + 8) = v4;
  *(_BYTE *)(a1 + 16) = v7 & 1;
  *(_BYTE *)(a1 + 17) = 0;
  *(_QWORD *)(a1 + 24) = sub_21EB6F2F4;
  *(_QWORD *)(a1 + 32) = v10;
  *(_QWORD *)(a1 + 40) = sub_21EB6F300;
  *(_QWORD *)(a1 + 48) = v11;
  *(_QWORD *)(a1 + 56) = &unk_255477EC0;
  *(_QWORD *)(a1 + 64) = v12;
  *(_BYTE *)(a1 + 72) = v14;
  *(_QWORD *)(a1 + 80) = *((_QWORD *)&v14 + 1);
  return result;
}

void sub_21EB6CF8C(_OWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  void *v5;
  __int128 v6;
  void *v7;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_255477EE8);
  MEMORY[0x24BDAC7A8](v2);
  v4 = (_QWORD *)((char *)&v6 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0));
  sub_21EB6D0C4(a1, v4);
  v6 = *(_OWORD *)((char *)a1 + 104);
  __swift_instantiateConcreteTypeFromMangledName(&qword_255477C78);
  sub_21EBB79EC();
  v5 = v7;
  sub_21EB6AA68(0, (unint64_t *)&qword_255477EF0);
  sub_21EB6F4B4();
  sub_21EB6AAA0();
  sub_21EBB7920();
  swift_release();
  swift_release();

  sub_21EB67980((uint64_t)v4, &qword_255477EE8);
}

uint64_t sub_21EB6D0C4@<X0>(_OWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
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
  char *v23;
  uint64_t v24;
  char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  id v30;
  void *v31;
  void *v32;
  id v33;
  uint64_t v34;
  uint64_t v35;
  id v36;
  void *v37;
  void *v38;
  id v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t result;
  uint64_t v45;
  uint64_t v46;
  uint64_t (**v47)();
  uint64_t v48;
  uint64_t v49;
  uint64_t *v50;
  id v51;
  void *v52;
  void *v53;
  id v54;
  uint64_t v55;
  uint64_t v56;
  id v57;
  void *v58;
  void *v59;
  id v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t (**v67)@<X0>(char *@<X8>);
  uint64_t v68;
  _QWORD *v69;
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
  char *v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  _QWORD *v84;
  __int128 v85;
  char v86;

  v83 = __swift_instantiateConcreteTypeFromMangledName(&qword_255477C90);
  v4 = MEMORY[0x24BDAC7A8](v83);
  v6 = (uint64_t *)((char *)&v73 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0));
  MEMORY[0x24BDAC7A8](v4);
  v74 = (uint64_t)&v73 - v7;
  v78 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_255477F20);
  MEMORY[0x24BDAC7A8](v78);
  v82 = (uint64_t)&v73 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_255477C80);
  v10 = MEMORY[0x24BDAC7A8](v9);
  v12 = (char *)&v73 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v10);
  v14 = (char *)&v73 - v13;
  v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_255477F30);
  v75 = *(_QWORD *)(v15 - 8);
  v76 = v15;
  v16 = MEMORY[0x24BDAC7A8](v15);
  v18 = (char *)&v73 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v16);
  v20 = (char *)&v73 - v19;
  v77 = __swift_instantiateConcreteTypeFromMangledName(&qword_255477F38);
  v21 = MEMORY[0x24BDAC7A8](v77);
  v23 = (char *)&v73 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v21);
  v25 = (char *)&v73 - v24;
  v26 = __swift_instantiateConcreteTypeFromMangledName(&qword_255477F40);
  v27 = MEMORY[0x24BDAC7A8](v26);
  v81 = (uint64_t)&v73 - ((v28 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v27);
  v80 = (char *)&v73 - v29;
  v79 = swift_allocObject();
  memcpy((void *)(v79 + 16), a1, 0x88uLL);
  v85 = a1[1];
  sub_21EB6F3A0((uint64_t)a1);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2554787A0);
  sub_21EBB79D4();
  v84 = a2;
  if (v86 == 1)
  {
    sub_21EBB7B78();
    if (qword_2554776B0 != -1)
      swift_once();
    v30 = (id)qword_255478EA8;
    v31 = (void *)sub_21EBB7B48();
    v32 = (void *)sub_21EBB7B48();
    swift_bridgeObjectRelease();
    v33 = objc_msgSend(v30, sel_localizedStringForKey_value_table_, v31, v32, 0);

    v74 = sub_21EBB7B60();
    v35 = v34;

    sub_21EBB7B78();
    v36 = (id)qword_255478EA8;
    v37 = (void *)sub_21EBB7B48();
    v38 = (void *)sub_21EBB7B48();
    swift_bridgeObjectRelease();
    v39 = objc_msgSend(v36, sel_localizedStringForKey_value_table_, v37, v38, 0);

    v40 = sub_21EBB7B60();
    v42 = v41;

    *(_QWORD *)&v85 = v40;
    *((_QWORD *)&v85 + 1) = v42;
    sub_21EBB7458();
    v43 = sub_21EBB7464();
    result = __swift_getEnumTagSinglePayload((uint64_t)v14, 1, v43);
    if ((_DWORD)result != 1)
    {
      sub_21EB67308();
      sub_21EBB7854();
      v45 = swift_allocObject();
      memcpy((void *)(v45 + 16), a1, 0x88uLL);
      *(_QWORD *)v23 = v74;
      *((_QWORD *)v23 + 1) = v35;
      v46 = v77;
      (*(void (**)(char *, char *, uint64_t))(v75 + 32))(&v23[*(int *)(v77 + 52)], v20, v76);
      v47 = (uint64_t (**)())&v23[*(int *)(v46 + 56)];
      *v47 = sub_21EB6F5C0;
      v47[1] = (uint64_t (*)())v45;
      sub_21EB6AB94((uint64_t)v23, (uint64_t)v25, &qword_255477F38);
      sub_21EB6ABC0((uint64_t)v25, v82, &qword_255477F38);
      swift_storeEnumTagMultiPayload();
      sub_21EB6F3A0((uint64_t)a1);
      sub_21EB6AC18((unint64_t *)&unk_255477F48, &qword_255477F38, (uint64_t)&unk_21EBBC03C);
      sub_21EB6AC18((unint64_t *)&unk_255477CB0, &qword_255477C90, (uint64_t)&unk_21EBBC03C);
      v48 = (uint64_t)v80;
      sub_21EBB777C();
      v49 = (uint64_t)v25;
      v50 = &qword_255477F38;
LABEL_10:
      sub_21EB67980(v49, v50);
      v69 = v84;
      v70 = v81;
      v71 = v79;
      sub_21EB6ABC0(v48, v81, &qword_255477F40);
      *v69 = 0;
      v69[1] = 0;
      v69[2] = sub_21EB6F534;
      v69[3] = v71;
      v72 = __swift_instantiateConcreteTypeFromMangledName(&qword_255477F58);
      sub_21EB6ABC0(v70, (uint64_t)v69 + *(int *)(v72 + 48), &qword_255477F40);
      swift_retain();
      sub_21EB67980(v48, &qword_255477F40);
      sub_21EB67980(v70, &qword_255477F40);
      swift_release();
      return swift_bridgeObjectRelease();
    }
    __break(1u);
  }
  else
  {
    sub_21EBB7B78();
    if (qword_2554776B0 != -1)
      swift_once();
    v51 = (id)qword_255478EA8;
    v52 = (void *)sub_21EBB7B48();
    v53 = (void *)sub_21EBB7B48();
    swift_bridgeObjectRelease();
    v54 = objc_msgSend(v51, sel_localizedStringForKey_value_table_, v52, v53, 0);

    v73 = sub_21EBB7B60();
    v56 = v55;

    sub_21EBB7B78();
    v57 = (id)qword_255478EA8;
    v58 = (void *)sub_21EBB7B48();
    v59 = (void *)sub_21EBB7B48();
    swift_bridgeObjectRelease();
    v60 = objc_msgSend(v57, sel_localizedStringForKey_value_table_, v58, v59, 0);

    v61 = sub_21EBB7B60();
    v63 = v62;

    *(_QWORD *)&v85 = v61;
    *((_QWORD *)&v85 + 1) = v63;
    sub_21EBB7458();
    v64 = sub_21EBB7464();
    result = __swift_getEnumTagSinglePayload((uint64_t)v12, 1, v64);
    if ((_DWORD)result != 1)
    {
      sub_21EB67308();
      sub_21EBB7854();
      v65 = swift_allocObject();
      memcpy((void *)(v65 + 16), a1, 0x88uLL);
      *v6 = v73;
      v6[1] = v56;
      v66 = v83;
      (*(void (**)(char *, char *, uint64_t))(v75 + 32))((char *)v6 + *(int *)(v83 + 52), v18, v76);
      v67 = (uint64_t (**)@<X0>(char *@<X8>))((char *)v6 + *(int *)(v66 + 56));
      *v67 = sub_21EB6F540;
      v67[1] = (uint64_t (*)@<X0>(char *@<X8>))v65;
      v68 = v74;
      sub_21EB6AB94((uint64_t)v6, v74, &qword_255477C90);
      sub_21EB6ABC0(v68, v82, &qword_255477C90);
      swift_storeEnumTagMultiPayload();
      sub_21EB6F3A0((uint64_t)a1);
      sub_21EB6AC18((unint64_t *)&unk_255477F48, &qword_255477F38, (uint64_t)&unk_21EBBC03C);
      sub_21EB6AC18((unint64_t *)&unk_255477CB0, &qword_255477C90, (uint64_t)&unk_21EBBC03C);
      v48 = (uint64_t)v80;
      sub_21EBB777C();
      v49 = v68;
      v50 = &qword_255477C90;
      goto LABEL_10;
    }
  }
  __break(1u);
  return result;
}

uint64_t sub_21EB6D97C()
{
  id v0;
  void *v1;
  void *v2;
  id v3;

  sub_21EBB7B78();
  if (qword_2554776B0 != -1)
    swift_once();
  v0 = (id)qword_255478EA8;
  v1 = (void *)sub_21EBB7B48();
  v2 = (void *)sub_21EBB7B48();
  swift_bridgeObjectRelease();
  v3 = objc_msgSend(v0, sel_localizedStringForKey_value_table_, v1, v2, 0);

  sub_21EBB7B60();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2554787A0);
  sub_21EBB79EC();
  sub_21EB67308();
  return sub_21EBB7A28();
}

uint64_t sub_21EB6DAC8(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  __int128 v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;

  v2 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_255477CD0);
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v14 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_21EBB7B78();
  if (qword_2554776B0 != -1)
    swift_once();
  v6 = (id)qword_255478EA8;
  v7 = (void *)sub_21EBB7B48();
  v8 = (void *)sub_21EBB7B48();
  swift_bridgeObjectRelease();
  v9 = objc_msgSend(v6, sel_localizedStringForKey_value_table_, v7, v8, 0);

  v10 = sub_21EBB7B60();
  v12 = v11;

  v14 = *(_OWORD *)(a1 + 80);
  v15 = *(_QWORD *)(a1 + 96);
  __swift_instantiateConcreteTypeFromMangledName(&qword_255477C50);
  sub_21EBB79EC();
  v16 = v10;
  v17 = v12;
  sub_21EB67308();
  sub_21EBB7AD0();
  sub_21EB6AC18(&qword_255477CF8, (uint64_t *)&unk_255477CD0, MEMORY[0x24BDF53E0]);
  sub_21EBB78FC();
  return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
}

uint64_t sub_21EB6DCD0@<X0>(uint64_t a1@<X0>, char *a2@<X8>)
{
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
  char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  void *v20;
  void *v21;
  id v22;
  uint64_t v23;
  unint64_t v24;
  unint64_t v25;
  uint64_t KeyPath;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t *v32;
  unint64_t v33;
  char *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  id v38;
  void *v39;
  void *v40;
  id v41;
  uint64_t v42;
  unint64_t v43;
  unint64_t v44;
  char *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t *v53;
  uint64_t v54;
  void (*v55)(char *, char *, uint64_t);
  char *v56;
  char *v57;
  uint64_t v58;
  void (*v59)(char *, uint64_t);
  _QWORD v61[3];
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  char *v67;
  uint64_t v68;
  uint64_t v69;
  char *v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  char *v74;
  char *v75;
  char *v76;
  __int128 v77;
  uint64_t v78;
  uint64_t v79;
  unint64_t v80;

  v75 = a2;
  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_255477CC0);
  v71 = *(_QWORD *)(v3 - 8);
  v72 = v3;
  MEMORY[0x24BDAC7A8](v3);
  v70 = (char *)v61 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v69 = __swift_instantiateConcreteTypeFromMangledName(&qword_255477CC8);
  v5 = MEMORY[0x24BDAC7A8](v69);
  v74 = (char *)v61 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v5);
  v73 = (uint64_t)v61 - v7;
  v63 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_255477CD0);
  v62 = *(_QWORD *)(v63 - 8);
  MEMORY[0x24BDAC7A8](v63);
  v9 = (char *)v61 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_255477F60);
  MEMORY[0x24BDAC7A8](v10);
  v12 = (char *)v61 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_255477CE0);
  v64 = *(_QWORD *)(v13 - 8);
  v65 = v13;
  MEMORY[0x24BDAC7A8](v13);
  v15 = (char *)v61 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v68 = __swift_instantiateConcreteTypeFromMangledName(&qword_255477F70);
  v66 = *(_QWORD *)(v68 - 8);
  v16 = MEMORY[0x24BDAC7A8](v68);
  v67 = (char *)v61 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v16);
  v76 = (char *)v61 - v18;
  sub_21EBB7B78();
  if (qword_2554776B0 != -1)
    swift_once();
  v19 = (id)qword_255478EA8;
  v20 = (void *)sub_21EBB7B48();
  v21 = (void *)sub_21EBB7B48();
  swift_bridgeObjectRelease();
  v22 = objc_msgSend(v19, sel_localizedStringForKey_value_table_, v20, v21, 0);

  v23 = sub_21EBB7B60();
  v25 = v24;

  v77 = *(_OWORD *)(a1 + 32);
  v78 = *(_QWORD *)(a1 + 48);
  v61[2] = __swift_instantiateConcreteTypeFromMangledName(&qword_255477C50);
  sub_21EBB79EC();
  v61[0] = a1;
  v79 = v23;
  v80 = v25;
  v61[1] = sub_21EB67308();
  sub_21EBB7AD0();
  KeyPath = swift_getKeyPath();
  v27 = sub_21EBB7B60();
  v29 = v28;
  v30 = v62;
  v31 = v63;
  (*(void (**)(char *, char *, uint64_t))(v62 + 16))(v12, v9, v63);
  v32 = (uint64_t *)&v12[*(int *)(v10 + 36)];
  *v32 = KeyPath;
  v32[1] = v27;
  v32[2] = v29;
  (*(void (**)(char *, uint64_t))(v30 + 8))(v9, v31);
  v33 = sub_21EB6AAF8();
  sub_21EBB78C0();
  sub_21EB67980((uint64_t)v12, (uint64_t *)&unk_255477F60);
  v79 = v10;
  v80 = v33;
  swift_getOpaqueTypeConformance2();
  v34 = v67;
  v35 = v65;
  sub_21EBB78FC();
  (*(void (**)(char *, uint64_t))(v64 + 8))(v15, v35);
  v36 = v66;
  v37 = v68;
  (*(void (**)(char *, char *, uint64_t))(v66 + 32))(v76, v34, v68);
  sub_21EBB7B78();
  v38 = (id)qword_255478EA8;
  v39 = (void *)sub_21EBB7B48();
  v40 = (void *)sub_21EBB7B48();
  swift_bridgeObjectRelease();
  v41 = objc_msgSend(v38, sel_localizedStringForKey_value_table_, v39, v40, 0);

  v42 = sub_21EBB7B60();
  v44 = v43;

  v77 = *(_OWORD *)(v61[0] + 56);
  v78 = *(_QWORD *)(v61[0] + 72);
  sub_21EBB79EC();
  v79 = v42;
  v80 = v44;
  v45 = v70;
  sub_21EBB7530();
  v46 = swift_getKeyPath();
  v47 = sub_21EBB7B60();
  v49 = v48;
  v51 = v71;
  v50 = v72;
  v52 = (uint64_t)v74;
  (*(void (**)(char *, char *, uint64_t))(v71 + 16))(v74, v45, v72);
  v53 = (uint64_t *)(v52 + *(int *)(v69 + 36));
  *v53 = v46;
  v53[1] = v47;
  v53[2] = v49;
  (*(void (**)(char *, uint64_t))(v51 + 8))(v45, v50);
  v54 = v73;
  sub_21EB6AB94(v52, v73, &qword_255477CC8);
  v55 = *(void (**)(char *, char *, uint64_t))(v36 + 16);
  v56 = v76;
  v55(v34, v76, v37);
  sub_21EB6ABC0(v54, v52, &qword_255477CC8);
  v57 = v75;
  v55(v75, v34, v37);
  v58 = __swift_instantiateConcreteTypeFromMangledName(&qword_255477D10);
  sub_21EB6ABC0(v52, (uint64_t)&v57[*(int *)(v58 + 48)], &qword_255477CC8);
  sub_21EB67980(v54, &qword_255477CC8);
  v59 = *(void (**)(char *, uint64_t))(v36 + 8);
  v59(v56, v37);
  sub_21EB67980(v52, &qword_255477CC8);
  return ((uint64_t (*)(char *, uint64_t))v59)(v34, v37);
}

uint64_t sub_21EB6E350()
{
  _QWORD *v0;
  _QWORD *v1;

  v0[2] = sub_21EBB7C20();
  v0[3] = sub_21EBB7C14();
  v1 = (_QWORD *)swift_task_alloc();
  v0[4] = v1;
  *v1 = v0;
  v1[1] = sub_21EB6E3B4;
  return sub_21EB6E410();
}

uint64_t sub_21EB6E3B4()
{
  OUTLINED_FUNCTION_8_2();
  OUTLINED_FUNCTION_6_0();
  sub_21EBB7BF0();
  return swift_task_switch();
}

uint64_t sub_21EB6E410()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;

  v1[75] = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_255477ED8);
  v1[76] = swift_task_alloc();
  sub_21EBB7C20();
  v1[77] = sub_21EBB7C14();
  v1[78] = sub_21EBB7BF0();
  v1[79] = v2;
  return swift_task_switch();
}

uint64_t sub_21EB6E4A4()
{
  uint64_t v0;
  uint64_t v1;
  id v2;
  uint64_t *v3;
  uint64_t v4;
  uint64_t v5;
  char **v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  uint64_t v11;
  _QWORD *v12;

  v1 = *(_QWORD *)(v0 + 600);
  v2 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BE00FE8]), sel_init);
  *(_QWORD *)(v0 + 640) = v2;
  *(_OWORD *)(v0 + 480) = *(_OWORD *)(v1 + 16);
  *(_QWORD *)(v0 + 648) = __swift_instantiateConcreteTypeFromMangledName(&qword_2554787A0);
  sub_21EBB79D4();
  if (*(_BYTE *)(v0 + 664) == 1)
  {
    v3 = (uint64_t *)(v0 + 368);
    v4 = *(_QWORD *)(v0 + 600);
    v5 = *(_QWORD *)(v4 + 96);
    *(_OWORD *)(v0 + 192) = *(_OWORD *)(v4 + 80);
    *(_QWORD *)(v0 + 208) = v5;
    __swift_instantiateConcreteTypeFromMangledName(&qword_255477C50);
    sub_21EBB79D4();
    v6 = &selRef_setApiToken_;
    v7 = 376;
  }
  else
  {
    v3 = (uint64_t *)(v0 + 416);
    v8 = *(_QWORD *)(v0 + 600);
    v9 = *(_QWORD *)(v8 + 48);
    *(_OWORD *)(v0 + 216) = *(_OWORD *)(v8 + 32);
    *(_QWORD *)(v0 + 232) = v9;
    __swift_instantiateConcreteTypeFromMangledName(&qword_255477C50);
    sub_21EBB79D4();
    sub_21EB6A9A8(*(_QWORD *)(v0 + 448), *(_QWORD *)(v0 + 456), v2, (SEL *)&selRef_setUsername_);
    v10 = *(_OWORD *)(v8 + 56);
    *(_QWORD *)(v0 + 280) = *(_QWORD *)(v8 + 72);
    *(_OWORD *)(v0 + 264) = v10;
    sub_21EBB79D4();
    v6 = &selRef_setPassword_;
    v7 = 424;
  }
  sub_21EB6A9A8(*v3, *(_QWORD *)(v0 + v7), v2, (SEL *)v6);
  *(_QWORD *)(v0 + 56) = *(_QWORD *)(v0 + 608);
  *(_QWORD *)(v0 + 16) = v0;
  *(_QWORD *)(v0 + 24) = sub_21EB6E670;
  v11 = swift_continuation_init();
  *(_QWORD *)(v0 + 80) = MEMORY[0x24BDAC760];
  v12 = (_QWORD *)(v0 + 80);
  v12[1] = 0x40000000;
  v12[2] = sub_21EB6EBA8;
  v12[3] = &block_descriptor_16;
  v12[4] = v11;
  objc_msgSend(v2, sel_getModifiedDateWithCompletion_, v12);
  return swift_continuation_await();
}

uint64_t sub_21EB6E670()
{
  _QWORD *v0;
  _QWORD *v1;
  uint64_t v2;

  OUTLINED_FUNCTION_8_2();
  *v1 = *v0;
  *(_QWORD *)(v2 + 656) = *(_QWORD *)(v2 + 48);
  return swift_task_switch();
}

uint64_t sub_21EB6E6C8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  id v16;
  uint64_t v17;
  void *v18;
  __int128 v19;
  void *v20;
  void *v21;
  __int128 v22;
  void *v23;
  __int128 v24;
  void *v25;
  void (**v26)(uint64_t, _QWORD);

  v1 = *(_QWORD *)(v0 + 608);
  v2 = *(_QWORD *)(v0 + 600);
  swift_release();
  sub_21EB67980(v1, &qword_255477ED8);
  *(_OWORD *)(v0 + 384) = *(_OWORD *)(v2 + 16);
  sub_21EBB79D4();
  if (*(_BYTE *)(v0 + 665) == 1)
  {
    v3 = *(_QWORD *)(v0 + 600);
    v4 = *(_QWORD *)(v3 + 96);
    *(_OWORD *)(v0 + 120) = *(_OWORD *)(v3 + 80);
    *(_QWORD *)(v0 + 136) = v4;
    __swift_instantiateConcreteTypeFromMangledName(&qword_255477C50);
    sub_21EBB79D4();
    v5 = *(_QWORD *)(v0 + 536);
    *(_QWORD *)(v0 + 560) = *(_QWORD *)(v0 + 528);
    *(_QWORD *)(v0 + 568) = v5;
    *(_QWORD *)(v0 + 512) = 58;
    *(_QWORD *)(v0 + 520) = 0xE100000000000000;
    sub_21EB67308();
    v6 = sub_21EBB7CC8();
    swift_bridgeObjectRelease();
    if (!*(_QWORD *)(v6 + 16))
    {
      v25 = *(void **)(v0 + 640);
      swift_bridgeObjectRelease();
      goto LABEL_7;
    }
    v7 = v3 + 80;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    v8 = objc_msgSend((id)objc_opt_self(), sel_workflowUserDefaults);
    v9 = (void *)OUTLINED_FUNCTION_3_2();
    objc_msgSend(v8, sel_setObject_forKey_, v9, *MEMORY[0x24BE01090]);

    v10 = (void *)OUTLINED_FUNCTION_3_2();
    v11 = *(_QWORD *)(v7 + 16);
    *(_OWORD *)(v0 + 288) = *(_OWORD *)v7;
    *(_QWORD *)(v0 + 304) = v11;
    sub_21EBB79D4();
    v12 = (void *)OUTLINED_FUNCTION_5_2();
    OUTLINED_FUNCTION_5_1();
    v13 = (void *)OUTLINED_FUNCTION_2_1();
    WFPinboardStoreSecretForUsername();

    OUTLINED_FUNCTION_3_2();
    OUTLINED_FUNCTION_11_0();
    v14 = (void *)OUTLINED_FUNCTION_0_2();
    WFPinboardStoreSecretForUsername();
  }
  else
  {
    v15 = *(_QWORD *)(v0 + 600);
    v16 = objc_msgSend((id)objc_opt_self(), sel_workflowUserDefaults);
    v17 = *(_QWORD *)(v15 + 48);
    *(_OWORD *)(v0 + 240) = *(_OWORD *)(v15 + 32);
    *(_QWORD *)(v0 + 256) = v17;
    __swift_instantiateConcreteTypeFromMangledName(&qword_255477C50);
    sub_21EBB79D4();
    v18 = (void *)OUTLINED_FUNCTION_5_2();
    OUTLINED_FUNCTION_5_1();
    objc_msgSend(v16, sel_setObject_forKey_, v18, *MEMORY[0x24BE01090]);

    v19 = *(_OWORD *)(v15 + 32);
    *(_QWORD *)(v0 + 328) = *(_QWORD *)(v15 + 48);
    *(_OWORD *)(v0 + 312) = v19;
    sub_21EBB79D4();
    v20 = (void *)OUTLINED_FUNCTION_5_2();
    OUTLINED_FUNCTION_5_1();
    v21 = (void *)OUTLINED_FUNCTION_2_1();
    WFPinboardStoreSecretForUsername();

    v22 = *(_OWORD *)(v15 + 32);
    *(_QWORD *)(v0 + 184) = *(_QWORD *)(v15 + 48);
    *(_OWORD *)(v0 + 168) = v22;
    sub_21EBB79D4();
    v23 = (void *)OUTLINED_FUNCTION_5_2();
    OUTLINED_FUNCTION_5_1();
    v24 = *(_OWORD *)(v15 + 56);
    *(_QWORD *)(v0 + 160) = *(_QWORD *)(v15 + 72);
    *(_OWORD *)(v0 + 144) = v24;
    v13 = (void *)(v0 + 144);
    sub_21EBB79D4();
    sub_21EBB7B48();
    OUTLINED_FUNCTION_11_0();
    v14 = (void *)OUTLINED_FUNCTION_0_2();
    WFPinboardStoreSecretForUsername();

  }
  v25 = *(void **)(v0 + 640);
  v26 = *(void (***)(uint64_t, _QWORD))(v0 + 600);

  (*v26)(1, 0);
LABEL_7:

  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_21EB6EA90()
{
  uint64_t v0;
  void *v1;
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;

  v1 = *(void **)(v0 + 656);
  v2 = *(void **)(v0 + 640);
  v3 = *(_QWORD *)(v0 + 600);
  swift_release();
  swift_willThrow();

  v4 = (void *)sub_21EBB741C();
  *(_OWORD *)(v0 + 544) = *(_OWORD *)(v3 + 104);
  sub_21EB6AB94(v0 + 544, v0 + 592, &qword_255477C40);
  sub_21EB6AB94(v0 + 552, v0 + 584, &qword_255477C70);
  *(_OWORD *)(v0 + 336) = *(_OWORD *)(v0 + 544);
  *(_QWORD *)(v0 + 576) = v4;
  sub_21EB6A930((id *)(v0 + 592));
  sub_21EB67AB8(v0 + 584);
  v5 = v4;
  __swift_instantiateConcreteTypeFromMangledName(&qword_255477C78);
  sub_21EBB79E0();

  sub_21EB6A958((id *)(v0 + 592));
  sub_21EB6A980(v0 + 584);
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_21EB6EBA8(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_255477ED8);
  v7 = MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v7);
  v11 = (char *)&v16 - v10;
  v12 = *(_QWORD *)(a1 + 32);
  if (a3)
    return sub_21EB6ECB4(v12, (uint64_t)a3);
  if (a2)
  {
    sub_21EBB7470();
    v14 = sub_21EBB747C();
    v15 = 0;
  }
  else
  {
    v14 = sub_21EBB747C();
    v15 = 1;
  }
  __swift_storeEnumTagSinglePayload((uint64_t)v9, v15, 1, v14);
  sub_21EB6AB94((uint64_t)v9, (uint64_t)v11, &qword_255477ED8);
  return sub_21EB6ED04(v12, (uint64_t)v11);
}

uint64_t sub_21EB6ECB4(uint64_t a1, uint64_t a2)
{
  _QWORD *v3;

  __swift_instantiateConcreteTypeFromMangledName(&qword_255477EE0);
  swift_allocError();
  *v3 = a2;
  return swift_continuation_throwingResumeWithError();
}

uint64_t sub_21EB6ED04(uint64_t a1, uint64_t a2)
{
  sub_21EB6AB94(a2, *(_QWORD *)(*(_QWORD *)(a1 + 64) + 40), &qword_255477ED8);
  return swift_continuation_throwingResume();
}

uint64_t sub_21EB6ED40(uint64_t a1, uint64_t a2)
{
  **(_QWORD **)(*(_QWORD *)(a1 + 64) + 40) = a2;
  return swift_continuation_throwingResume();
}

uint64_t sub_21EB6ED50@<X0>(uint64_t a1@<X8>)
{
  const void *v1;
  _BYTE __dst[136];

  memcpy(__dst, v1, sizeof(__dst));
  return sub_21EB6CCCC(a1);
}

unint64_t sub_21EB6ED90()
{
  unint64_t result;

  result = qword_255477EB0;
  if (!qword_255477EB0)
  {
    result = MEMORY[0x2207B8330](&unk_21EBBC454, &type metadata for PinboardLoginView);
    atomic_store(result, &qword_255477EB0);
  }
  return result;
}

uint64_t sub_21EB6EDCC(uint64_t a1)
{
  void *v2;

  v2 = *(void **)(a1 + 104);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();

  swift_release();
  return a1;
}

uint64_t sub_21EB6EE84()
{
  uint64_t v0;

  _Block_release(*(const void **)(v0 + 16));
  return swift_deallocObject();
}

uint64_t destroy for PinboardLoginView(uint64_t a1)
{
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();

  swift_release();
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for PinboardLoginView(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  id v12;

  v3 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v3;
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
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
  v10 = *(void **)(a2 + 104);
  v9 = *(_QWORD *)(a2 + 112);
  *(_QWORD *)(a1 + 104) = v10;
  *(_QWORD *)(a1 + 112) = v9;
  v11 = *(_QWORD *)(a2 + 128);
  *(_QWORD *)(a1 + 120) = *(_QWORD *)(a2 + 120);
  *(_QWORD *)(a1 + 128) = v11;
  swift_retain();
  swift_retain();
  swift_bridgeObjectRetain();
  swift_retain();
  swift_bridgeObjectRetain();
  swift_retain();
  swift_bridgeObjectRetain();
  swift_retain();
  v12 = v10;
  swift_retain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for PinboardLoginView(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;

  v4 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v4;
  swift_retain();
  swift_release();
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  swift_retain();
  swift_release();
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  swift_retain();
  swift_release();
  *(_QWORD *)(a1 + 56) = *(_QWORD *)(a2 + 56);
  *(_QWORD *)(a1 + 64) = *(_QWORD *)(a2 + 64);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 72) = *(_QWORD *)(a2 + 72);
  swift_retain();
  swift_release();
  *(_QWORD *)(a1 + 80) = *(_QWORD *)(a2 + 80);
  *(_QWORD *)(a1 + 88) = *(_QWORD *)(a2 + 88);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 96) = *(_QWORD *)(a2 + 96);
  swift_retain();
  swift_release();
  v5 = *(void **)(a1 + 104);
  v6 = *(void **)(a2 + 104);
  *(_QWORD *)(a1 + 104) = v6;
  v7 = v6;

  *(_QWORD *)(a1 + 112) = *(_QWORD *)(a2 + 112);
  swift_retain();
  swift_release();
  *(_QWORD *)(a1 + 120) = *(_QWORD *)(a2 + 120);
  *(_QWORD *)(a1 + 128) = *(_QWORD *)(a2 + 128);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

void *__swift_memcpy136_8(void *a1, const void *a2)
{
  return memcpy(a1, a2, 0x88uLL);
}

uint64_t assignWithTake for PinboardLoginView(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  *(_OWORD *)a1 = *(_OWORD *)a2;
  swift_release();
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  swift_release();
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  swift_release();
  *(_QWORD *)(a1 + 56) = *(_QWORD *)(a2 + 56);
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 64) = *(_OWORD *)(a2 + 64);
  swift_release();
  *(_QWORD *)(a1 + 80) = *(_QWORD *)(a2 + 80);
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 88) = *(_OWORD *)(a2 + 88);
  swift_release();

  *(_OWORD *)(a1 + 104) = *(_OWORD *)(a2 + 104);
  swift_release();
  v4 = *(_QWORD *)(a2 + 128);
  *(_QWORD *)(a1 + 120) = *(_QWORD *)(a2 + 120);
  *(_QWORD *)(a1 + 128) = v4;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for PinboardLoginView(uint64_t *a1, int a2)
{
  uint64_t v2;

  if (a2)
  {
    if (a2 < 0 && *((_BYTE *)a1 + 136))
    {
      LODWORD(v2) = *(_DWORD *)a1 + 0x7FFFFFFF;
    }
    else
    {
      v2 = *a1;
      if ((unint64_t)*a1 >= 0xFFFFFFFF)
        LODWORD(v2) = -1;
    }
  }
  else
  {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for PinboardLoginView(uint64_t result, int a2, int a3)
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
    *(_OWORD *)(result + 120) = 0u;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 136) = 1;
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
    *(_BYTE *)(result + 136) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for PinboardLoginView()
{
  return &type metadata for PinboardLoginView;
}

uint64_t sub_21EB6F2E0()
{
  return swift_getOpaqueTypeConformance2();
}

void sub_21EB6F2F4()
{
  uint64_t v0;

  sub_21EB6CF8C((_OWORD *)(v0 + 16));
}

void sub_21EB6F300()
{
  uint64_t v0;

  (*(void (**)(_QWORD, _QWORD))(v0 + 16))(0, 0);
  OUTLINED_FUNCTION_5();
}

uint64_t sub_21EB6F328()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 16) = v1;
  *v1 = v0;
  v1[1] = sub_21EB6F374;
  return sub_21EB6E350();
}

uint64_t sub_21EB6F374()
{
  uint64_t v0;

  OUTLINED_FUNCTION_8_2();
  OUTLINED_FUNCTION_6_0();
  return OUTLINED_FUNCTION_4(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_21EB6F3A0(uint64_t a1)
{
  id v2;
  void *v4;

  v4 = *(void **)(a1 + 104);
  swift_retain();
  swift_bridgeObjectRetain();
  swift_retain();
  swift_retain();
  swift_bridgeObjectRetain();
  swift_retain();
  swift_bridgeObjectRetain();
  swift_retain();
  swift_bridgeObjectRetain();
  swift_retain();
  v2 = v4;
  return a1;
}

void sub_21EB6F45C()
{
  uint64_t *v0;
  uint64_t v1;

  *v0 = OUTLINED_FUNCTION_10_0();
  v0[1] = v1;
  OUTLINED_FUNCTION_5();
}

uint64_t sub_21EB6F478()
{
  swift_bridgeObjectRetain();
  return sub_21EBB7620();
}

unint64_t sub_21EB6F4B4()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  result = qword_255477EF8;
  if (!qword_255477EF8)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_255477EE8);
    sub_21EB6AC18(&qword_255477F00, &qword_255477F08, MEMORY[0x24BDF5428]);
    v3 = v2;
    result = MEMORY[0x2207B8330](MEMORY[0x24BDF3F50], v1, &v3);
    atomic_store(result, (unint64_t *)&qword_255477EF8);
  }
  return result;
}

uint64_t sub_21EB6F534()
{
  return sub_21EB6D97C();
}

uint64_t sub_21EB6F540@<X0>(char *a1@<X8>)
{
  uint64_t v1;

  return sub_21EB6DCD0(v1 + 16, a1);
}

uint64_t objectdestroy_6Tm()
{
  uint64_t v0;

  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();

  swift_release();
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_21EB6F5C0()
{
  uint64_t v0;

  return sub_21EB6DAC8(v0 + 16);
}

void sub_21EB6F5C8()
{
  uint64_t *v0;
  uint64_t v1;

  *v0 = OUTLINED_FUNCTION_10_0();
  v0[1] = v1;
  OUTLINED_FUNCTION_5();
}

void sub_21EB6F5E8()
{
  sub_21EB6AC18(&qword_255477F78, (uint64_t *)&unk_255477F80, (uint64_t)&unk_21EBBBF8C);
}

uint64_t OUTLINED_FUNCTION_0_2()
{
  return sub_21EBB7B48();
}

uint64_t OUTLINED_FUNCTION_2_1()
{
  return sub_21EBB7B48();
}

uint64_t OUTLINED_FUNCTION_3_2()
{
  return sub_21EBB7B48();
}

uint64_t OUTLINED_FUNCTION_5_2()
{
  return sub_21EBB7B48();
}

void OUTLINED_FUNCTION_8_2()
{
  _QWORD *v0;
  uint64_t v1;

  *(_QWORD *)(v1 - 8) = *v0;
}

uint64_t OUTLINED_FUNCTION_10_0()
{
  return sub_21EBB7614();
}

uint64_t OUTLINED_FUNCTION_11_0()
{
  return swift_bridgeObjectRelease();
}

void sub_21EB6F67C(void *a1, void (**a2)(_QWORD, _QWORD, _QWORD))
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  void *v12;
  id v13;
  _QWORD *v14;
  void *v15;
  const void *v16;
  id v17;
  void *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  _QWORD aBlock[6];

  v4 = sub_21EBB7ADC();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v19 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_21EBB7B00();
  v22 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v10 = (char *)&v19 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = swift_allocObject();
  *(_QWORD *)(v11 + 16) = a2;
  v12 = (void *)objc_opt_self();
  _Block_copy(a2);
  v13 = objc_msgSend(v12, sel_evernoteSession);
  if (objc_msgSend(v13, sel_isAuthenticated))
  {
    a2[2](a2, 1, 0);
    swift_release();

  }
  else
  {
    objc_msgSend(v13, sel_setAuthenticator_, 0);
    sub_21EB6FC70();
    v21 = sub_21EBB7C80();
    v14 = (_QWORD *)swift_allocObject();
    v14[2] = a1;
    v14[3] = v13;
    v14[4] = sub_21EB6A494;
    v14[5] = v11;
    aBlock[4] = sub_21EB6FCE0;
    aBlock[5] = v14;
    aBlock[0] = MEMORY[0x24BDAC760];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_21EB83A60;
    aBlock[3] = &block_descriptor_2;
    v15 = _Block_copy(aBlock);
    v20 = v5;
    v16 = v15;
    v17 = a1;
    v19 = v13;
    swift_retain();
    swift_release();
    sub_21EBB7AF4();
    aBlock[0] = MEMORY[0x24BEE4AF8];
    sub_21EB65BBC(&qword_255477E90, (void (*)(uint64_t))MEMORY[0x24BEE5458]);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_255477C30);
    sub_21EB72A50(&qword_255477EA0, (uint64_t *)&unk_255477C30);
    sub_21EBB7CEC();
    v18 = (void *)v21;
    MEMORY[0x2207B78E0](0, v10, v7, v16);
    _Block_release(v16);

    (*(void (**)(char *, uint64_t))(v20 + 8))(v7, v4);
    (*(void (**)(char *, uint64_t))(v22 + 8))(v10, v8);
    swift_release();
  }
  _Block_release(a2);
}

void sub_21EB6F978(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD *v15;
  uint64_t v16;
  id v17;
  _QWORD *v18;
  _QWORD v19[2];

  v19[1] = a1;
  v7 = type metadata accessor for EvernoteWebView.LoadingState(0);
  v8 = MEMORY[0x24BDAC7A8](v7);
  v10 = (char *)v19 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v8);
  v12 = (char *)v19 - v11;
  v13 = type metadata accessor for EvernoteWebView(0);
  MEMORY[0x24BDAC7A8](v13);
  v15 = (_QWORD *)((char *)v19 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0));
  *v15 = a2;
  v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_255478018);
  __swift_storeEnumTagSinglePayload((uint64_t)v12, 1, 2, v16);
  sub_21EB722D8((uint64_t)v12, (uint64_t)v10, type metadata accessor for EvernoteWebView.LoadingState);
  v17 = a2;
  swift_retain();
  sub_21EBB79C8();
  sub_21EB6FD5C((uint64_t)v12, type metadata accessor for EvernoteWebView.LoadingState);
  v18 = (_QWORD *)((char *)v15 + *(int *)(v13 + 24));
  *v18 = a3;
  v18[1] = a4;
  sub_21EB65BBC(&qword_255478020, (void (*)(uint64_t))type metadata accessor for EvernoteWebView);
  sub_21EBB7CA4();
  sub_21EB6FD5C((uint64_t)v15, type metadata accessor for EvernoteWebView);
}

id sub_21EB6FB5C(void *a1, void *a2)
{
  void *v2;
  id v5;
  objc_super v7;

  v7.receiver = v2;
  v7.super_class = (Class)type metadata accessor for WFEvernoteAccessResourceUserInterface();
  v5 = objc_msgSendSuper2(&v7, sel_initWithUserInterfaceType_attribution_, a1, a2);

  return v5;
}

id sub_21EB6FBFC()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for WFEvernoteAccessResourceUserInterface();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for WFEvernoteAccessResourceUserInterface()
{
  return objc_opt_self();
}

uint64_t sub_21EB6FC4C()
{
  uint64_t v0;

  _Block_release(*(const void **)(v0 + 16));
  return swift_deallocObject();
}

unint64_t sub_21EB6FC70()
{
  unint64_t result;

  result = qword_255477C20;
  if (!qword_255477C20)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_255477C20);
  }
  return result;
}

uint64_t sub_21EB6FCAC()
{
  uint64_t v0;

  swift_release();
  return swift_deallocObject();
}

void sub_21EB6FCE0()
{
  uint64_t v0;

  sub_21EB6F978(*(_QWORD *)(v0 + 16), *(void **)(v0 + 24), *(_QWORD *)(v0 + 32), *(_QWORD *)(v0 + 40));
}

uint64_t block_copy_helper_2(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_2()
{
  return swift_release();
}

uint64_t type metadata accessor for EvernoteWebView.LoadingState(uint64_t a1)
{
  return sub_21EB6FD2C(a1, (uint64_t *)&unk_255478140);
}

uint64_t type metadata accessor for EvernoteWebView(uint64_t a1)
{
  return sub_21EB6FD2C(a1, (uint64_t *)&unk_255478088);
}

uint64_t sub_21EB6FD2C(uint64_t a1, uint64_t *a2)
{
  uint64_t result;

  result = *a2;
  if (!*a2)
    return swift_getSingletonMetadata();
  return result;
}

void sub_21EB6FD5C(uint64_t a1, uint64_t (*a2)(_QWORD))
{
  uint64_t v2;

  v2 = a2(0);
  OUTLINED_FUNCTION_5_3(v2);
  OUTLINED_FUNCTION_5();
}

void **sub_21EB6FD84(void **a1, void **a2, uint64_t a3)
{
  int v3;
  char *v4;
  void **v7;
  uint64_t v8;
  char *v9;
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
  char *v20;
  char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  _QWORD *v25;
  _QWORD *v26;
  uint64_t v27;

  v3 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  v4 = (char *)*a2;
  *a1 = *a2;
  if ((v3 & 0x20000) != 0)
  {
    v7 = (void **)&v4[(v3 + 16) & ~(unint64_t)v3];
  }
  else
  {
    v7 = a1;
    v8 = *(int *)(a3 + 20);
    v9 = (char *)a1 + v8;
    v10 = (char *)a2 + v8;
    v11 = v4;
    v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_255478018);
    if (__swift_getEnumTagSinglePayload((uint64_t)v10, 2, v12))
    {
      v13 = type metadata accessor for EvernoteWebView.LoadingState(0);
      memcpy(v9, v10, *(_QWORD *)(*(_QWORD *)(v13 - 8) + 64));
    }
    else
    {
      v14 = sub_21EBB7464();
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v14 - 8) + 16))(v9, v10, v14);
      v15 = *(int *)(v12 + 48);
      v16 = &v9[v15];
      v17 = &v10[v15];
      v18 = *((_QWORD *)v17 + 1);
      *(_QWORD *)v16 = *(_QWORD *)v17;
      *((_QWORD *)v16 + 1) = v18;
      v19 = *(int *)(v12 + 64);
      v20 = &v9[v19];
      v21 = &v10[v19];
      v22 = *((_QWORD *)v21 + 1);
      *(_QWORD *)v20 = *(_QWORD *)v21;
      *((_QWORD *)v20 + 1) = v22;
      swift_bridgeObjectRetain();
      swift_retain();
      __swift_storeEnumTagSinglePayload((uint64_t)v9, 0, 2, v12);
    }
    v23 = __swift_instantiateConcreteTypeFromMangledName(qword_255478028);
    *(_QWORD *)&v9[*(int *)(v23 + 28)] = *(_QWORD *)&v10[*(int *)(v23 + 28)];
    v24 = *(int *)(a3 + 24);
    v25 = (void **)((char *)v7 + v24);
    v26 = (void **)((char *)a2 + v24);
    v27 = v26[1];
    *v25 = *v26;
    v25[1] = v27;
    swift_retain();
  }
  swift_retain();
  return v7;
}

uint64_t sub_21EB6FEE0(id *a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v4 = (uint64_t)a1 + *(int *)(a2 + 20);
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_255478018);
  if (!__swift_getEnumTagSinglePayload(v4, 2, v5))
  {
    v6 = sub_21EBB7464();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 8))(v4, v6);
    swift_bridgeObjectRelease();
    swift_release();
  }
  __swift_instantiateConcreteTypeFromMangledName(qword_255478028);
  swift_release();
  return swift_release();
}

void **sub_21EB6FF9C(void **a1, void **a2, uint64_t a3)
{
  void *v6;
  uint64_t v7;
  char *v8;
  char *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  _QWORD *v24;
  _QWORD *v25;
  uint64_t v26;

  v6 = *a2;
  *a1 = *a2;
  v7 = *(int *)(a3 + 20);
  v8 = (char *)a1 + v7;
  v9 = (char *)a2 + v7;
  v10 = v6;
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_255478018);
  if (__swift_getEnumTagSinglePayload((uint64_t)v9, 2, v11))
  {
    v12 = type metadata accessor for EvernoteWebView.LoadingState(0);
    memcpy(v8, v9, *(_QWORD *)(*(_QWORD *)(v12 - 8) + 64));
  }
  else
  {
    v13 = sub_21EBB7464();
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v13 - 8) + 16))(v8, v9, v13);
    v14 = *(int *)(v11 + 48);
    v15 = &v8[v14];
    v16 = &v9[v14];
    v17 = *((_QWORD *)v16 + 1);
    *(_QWORD *)v15 = *(_QWORD *)v16;
    *((_QWORD *)v15 + 1) = v17;
    v18 = *(int *)(v11 + 64);
    v19 = &v8[v18];
    v20 = &v9[v18];
    v21 = *((_QWORD *)v20 + 1);
    *(_QWORD *)v19 = *(_QWORD *)v20;
    *((_QWORD *)v19 + 1) = v21;
    swift_bridgeObjectRetain();
    swift_retain();
    __swift_storeEnumTagSinglePayload((uint64_t)v8, 0, 2, v11);
  }
  v22 = __swift_instantiateConcreteTypeFromMangledName(qword_255478028);
  *(_QWORD *)&v8[*(int *)(v22 + 28)] = *(_QWORD *)&v9[*(int *)(v22 + 28)];
  v23 = *(int *)(a3 + 24);
  v24 = (void **)((char *)a1 + v23);
  v25 = (void **)((char *)a2 + v23);
  v26 = v25[1];
  *v24 = *v25;
  v24[1] = v26;
  swift_retain();
  swift_retain();
  return a1;
}

void **sub_21EB700D8(void **a1, void **a2, uint64_t a3)
{
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  char *v10;
  char *v11;
  uint64_t v12;
  int EnumTagSinglePayload;
  int v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  char *v18;
  uint64_t v19;
  char *v20;
  char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  _QWORD *v26;
  _QWORD *v27;
  uint64_t v28;
  uint64_t v30;
  uint64_t v31;
  char *v32;
  char *v33;
  uint64_t v34;
  char *v35;
  char *v36;
  uint64_t v37;

  v6 = *a2;
  v7 = *a1;
  *a1 = *a2;
  v8 = v6;

  v9 = *(int *)(a3 + 20);
  v10 = (char *)a1 + v9;
  v11 = (char *)a2 + v9;
  v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_255478018);
  EnumTagSinglePayload = __swift_getEnumTagSinglePayload((uint64_t)v10, 2, v12);
  v14 = __swift_getEnumTagSinglePayload((uint64_t)v11, 2, v12);
  if (!EnumTagSinglePayload)
  {
    if (!v14)
    {
      v30 = sub_21EBB7464();
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v30 - 8) + 24))(v10, v11, v30);
      v31 = *(int *)(v12 + 48);
      v32 = &v10[v31];
      v33 = &v11[v31];
      *(_QWORD *)v32 = *(_QWORD *)v33;
      *((_QWORD *)v32 + 1) = *((_QWORD *)v33 + 1);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      v34 = *(int *)(v12 + 64);
      v35 = &v10[v34];
      v36 = &v11[v34];
      v37 = *((_QWORD *)v36 + 1);
      *(_QWORD *)v35 = *(_QWORD *)v36;
      *((_QWORD *)v35 + 1) = v37;
      swift_retain();
      swift_release();
      goto LABEL_7;
    }
    sub_21EB72984((uint64_t)v10, &qword_255478018);
    goto LABEL_6;
  }
  if (v14)
  {
LABEL_6:
    v23 = type metadata accessor for EvernoteWebView.LoadingState(0);
    memcpy(v10, v11, *(_QWORD *)(*(_QWORD *)(v23 - 8) + 64));
    goto LABEL_7;
  }
  v15 = sub_21EBB7464();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v15 - 8) + 16))(v10, v11, v15);
  v16 = *(int *)(v12 + 48);
  v17 = &v10[v16];
  v18 = &v11[v16];
  *(_QWORD *)v17 = *(_QWORD *)v18;
  *((_QWORD *)v17 + 1) = *((_QWORD *)v18 + 1);
  v19 = *(int *)(v12 + 64);
  v20 = &v10[v19];
  v21 = &v11[v19];
  v22 = *((_QWORD *)v21 + 1);
  *(_QWORD *)v20 = *(_QWORD *)v21;
  *((_QWORD *)v20 + 1) = v22;
  swift_bridgeObjectRetain();
  swift_retain();
  __swift_storeEnumTagSinglePayload((uint64_t)v10, 0, 2, v12);
LABEL_7:
  v24 = __swift_instantiateConcreteTypeFromMangledName(qword_255478028);
  *(_QWORD *)&v10[*(int *)(v24 + 28)] = *(_QWORD *)&v11[*(int *)(v24 + 28)];
  swift_retain();
  swift_release();
  v25 = *(int *)(a3 + 24);
  v26 = (void **)((char *)a1 + v25);
  v27 = (void **)((char *)a2 + v25);
  v28 = v27[1];
  *v26 = *v27;
  v26[1] = v28;
  swift_retain();
  swift_release();
  return a1;
}

_QWORD *sub_21EB702D8(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v6;
  char *v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  *a1 = *a2;
  v6 = *(int *)(a3 + 20);
  v7 = (char *)a1 + v6;
  v8 = (char *)a2 + v6;
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_255478018);
  if (__swift_getEnumTagSinglePayload((uint64_t)v8, 2, v9))
  {
    v10 = type metadata accessor for EvernoteWebView.LoadingState(0);
    memcpy(v7, v8, *(_QWORD *)(*(_QWORD *)(v10 - 8) + 64));
  }
  else
  {
    v11 = sub_21EBB7464();
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v11 - 8) + 32))(v7, v8, v11);
    *(_OWORD *)&v7[*(int *)(v9 + 48)] = *(_OWORD *)&v8[*(int *)(v9 + 48)];
    *(_OWORD *)&v7[*(int *)(v9 + 64)] = *(_OWORD *)&v8[*(int *)(v9 + 64)];
    __swift_storeEnumTagSinglePayload((uint64_t)v7, 0, 2, v9);
  }
  v12 = __swift_instantiateConcreteTypeFromMangledName(qword_255478028);
  *(_QWORD *)&v7[*(int *)(v12 + 28)] = *(_QWORD *)&v8[*(int *)(v12 + 28)];
  *(_OWORD *)((char *)a1 + *(int *)(a3 + 24)) = *(_OWORD *)((char *)a2 + *(int *)(a3 + 24));
  return a1;
}

void **sub_21EB703D8(void **a1, void **a2, uint64_t a3)
{
  void *v6;
  uint64_t v7;
  char *v8;
  char *v9;
  uint64_t v10;
  int EnumTagSinglePayload;
  int v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  char *v20;
  uint64_t v21;
  uint64_t v22;

  v6 = *a1;
  *a1 = *a2;

  v7 = *(int *)(a3 + 20);
  v8 = (char *)a1 + v7;
  v9 = (char *)a2 + v7;
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_255478018);
  EnumTagSinglePayload = __swift_getEnumTagSinglePayload((uint64_t)v8, 2, v10);
  v12 = __swift_getEnumTagSinglePayload((uint64_t)v9, 2, v10);
  if (!EnumTagSinglePayload)
  {
    if (!v12)
    {
      v17 = sub_21EBB7464();
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v17 - 8) + 40))(v8, v9, v17);
      v18 = *(int *)(v10 + 48);
      v19 = &v8[v18];
      v20 = &v9[v18];
      v22 = *(_QWORD *)v20;
      v21 = *((_QWORD *)v20 + 1);
      *(_QWORD *)v19 = v22;
      *((_QWORD *)v19 + 1) = v21;
      swift_bridgeObjectRelease();
      *(_OWORD *)&v8[*(int *)(v10 + 64)] = *(_OWORD *)&v9[*(int *)(v10 + 64)];
      swift_release();
      goto LABEL_7;
    }
    sub_21EB72984((uint64_t)v8, &qword_255478018);
    goto LABEL_6;
  }
  if (v12)
  {
LABEL_6:
    v14 = type metadata accessor for EvernoteWebView.LoadingState(0);
    memcpy(v8, v9, *(_QWORD *)(*(_QWORD *)(v14 - 8) + 64));
    goto LABEL_7;
  }
  v13 = sub_21EBB7464();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v13 - 8) + 32))(v8, v9, v13);
  *(_OWORD *)&v8[*(int *)(v10 + 48)] = *(_OWORD *)&v9[*(int *)(v10 + 48)];
  *(_OWORD *)&v8[*(int *)(v10 + 64)] = *(_OWORD *)&v9[*(int *)(v10 + 64)];
  __swift_storeEnumTagSinglePayload((uint64_t)v8, 0, 2, v10);
LABEL_7:
  v15 = __swift_instantiateConcreteTypeFromMangledName(qword_255478028);
  *(_QWORD *)&v8[*(int *)(v15 + 28)] = *(_QWORD *)&v9[*(int *)(v15 + 28)];
  swift_release();
  *(_OWORD *)((char *)a1 + *(int *)(a3 + 24)) = *(_OWORD *)((char *)a2 + *(int *)(a3 + 24));
  swift_release();
  return a1;
}

uint64_t sub_21EB70580()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_21EB7058C(uint64_t *a1, uint64_t a2, uint64_t a3)
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
    v8 = __swift_instantiateConcreteTypeFromMangledName(qword_255478028);
    return __swift_getEnumTagSinglePayload((uint64_t)a1 + *(int *)(a3 + 20), a2, v8);
  }
}

uint64_t sub_21EB70604()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

_QWORD *sub_21EB70610(_QWORD *result, uint64_t a2, int a3, uint64_t a4)
{
  _QWORD *v5;
  uint64_t v7;

  v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *result = (a2 - 1);
  }
  else
  {
    v7 = __swift_instantiateConcreteTypeFromMangledName(qword_255478028);
    return (_QWORD *)OUTLINED_FUNCTION_3_3((uint64_t)v5 + *(int *)(a4 + 20), a2, a2, v7);
  }
  return result;
}

void sub_21EB70678()
{
  unint64_t v0;

  sub_21EB706FC();
  if (v0 <= 0x3F)
    swift_initStructMetadata();
}

void sub_21EB706FC()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_255478098[0])
  {
    type metadata accessor for EvernoteWebView.LoadingState(255);
    v0 = sub_21EBB79F8();
    if (!v1)
      atomic_store(v0, qword_255478098);
  }
}

uint64_t *sub_21EB70750(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v5;
  int v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  _QWORD *v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD *v15;
  _QWORD *v16;
  uint64_t v17;

  v5 = *(_QWORD *)(a3 - 8);
  v6 = *(_DWORD *)(v5 + 80);
  if ((v6 & 0x20000) != 0)
  {
    v8 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v8 + ((v6 + 16) & ~(unint64_t)v6));
    swift_retain();
  }
  else
  {
    v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_255478018);
    if (__swift_getEnumTagSinglePayload((uint64_t)a2, 2, v7))
    {
      memcpy(a1, a2, *(_QWORD *)(v5 + 64));
    }
    else
    {
      v9 = sub_21EBB7464();
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v9 - 8) + 16))(a1, a2, v9);
      v10 = *(int *)(v7 + 48);
      v11 = (uint64_t *)((char *)a1 + v10);
      v12 = (uint64_t *)((char *)a2 + v10);
      v13 = v12[1];
      *v11 = *v12;
      v11[1] = v13;
      v14 = *(int *)(v7 + 64);
      v15 = (uint64_t *)((char *)a1 + v14);
      v16 = (uint64_t *)((char *)a2 + v14);
      v17 = v16[1];
      *v15 = *v16;
      v15[1] = v17;
      swift_bridgeObjectRetain();
      swift_retain();
      __swift_storeEnumTagSinglePayload((uint64_t)a1, 0, 2, v7);
    }
  }
  return a1;
}

uint64_t sub_21EB70848(uint64_t a1)
{
  uint64_t v2;
  uint64_t result;
  uint64_t v4;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_255478018);
  result = __swift_getEnumTagSinglePayload(a1, 2, v2);
  if (!(_DWORD)result)
  {
    v4 = sub_21EBB7464();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(a1, v4);
    swift_bridgeObjectRelease();
    return swift_release();
  }
  return result;
}

char *sub_21EB708CC(char *a1, char *a2, uint64_t a3)
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

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_255478018);
  if (__swift_getEnumTagSinglePayload((uint64_t)a2, 2, v6))
  {
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64));
  }
  else
  {
    v7 = sub_21EBB7464();
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a1, a2, v7);
    v8 = *(int *)(v6 + 48);
    v9 = &a1[v8];
    v10 = &a2[v8];
    v11 = *((_QWORD *)v10 + 1);
    *(_QWORD *)v9 = *(_QWORD *)v10;
    *((_QWORD *)v9 + 1) = v11;
    v12 = *(int *)(v6 + 64);
    v13 = &a1[v12];
    v14 = &a2[v12];
    v15 = *((_QWORD *)v14 + 1);
    *(_QWORD *)v13 = *(_QWORD *)v14;
    *((_QWORD *)v13 + 1) = v15;
    swift_bridgeObjectRetain();
    swift_retain();
    __swift_storeEnumTagSinglePayload((uint64_t)a1, 0, 2, v6);
  }
  return a1;
}

char *sub_21EB709A0(char *a1, char *a2, uint64_t a3)
{
  uint64_t v6;
  int EnumTagSinglePayload;
  int v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  char *v12;
  uint64_t v13;
  char *v14;
  char *v15;
  uint64_t v16;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  char *v21;
  uint64_t v22;
  char *v23;
  char *v24;
  uint64_t v25;

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_255478018);
  EnumTagSinglePayload = __swift_getEnumTagSinglePayload((uint64_t)a1, 2, v6);
  v8 = __swift_getEnumTagSinglePayload((uint64_t)a2, 2, v6);
  if (!EnumTagSinglePayload)
  {
    if (!v8)
    {
      v18 = sub_21EBB7464();
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v18 - 8) + 24))(a1, a2, v18);
      v19 = *(int *)(v6 + 48);
      v20 = &a1[v19];
      v21 = &a2[v19];
      *(_QWORD *)v20 = *(_QWORD *)v21;
      *((_QWORD *)v20 + 1) = *((_QWORD *)v21 + 1);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      v22 = *(int *)(v6 + 64);
      v23 = &a1[v22];
      v24 = &a2[v22];
      v25 = *((_QWORD *)v24 + 1);
      *(_QWORD *)v23 = *(_QWORD *)v24;
      *((_QWORD *)v23 + 1) = v25;
      swift_retain();
      swift_release();
      return a1;
    }
    sub_21EB72984((uint64_t)a1, &qword_255478018);
    goto LABEL_6;
  }
  if (v8)
  {
LABEL_6:
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64));
    return a1;
  }
  v9 = sub_21EBB7464();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v9 - 8) + 16))(a1, a2, v9);
  v10 = *(int *)(v6 + 48);
  v11 = &a1[v10];
  v12 = &a2[v10];
  *(_QWORD *)v11 = *(_QWORD *)v12;
  *((_QWORD *)v11 + 1) = *((_QWORD *)v12 + 1);
  v13 = *(int *)(v6 + 64);
  v14 = &a1[v13];
  v15 = &a2[v13];
  v16 = *((_QWORD *)v15 + 1);
  *(_QWORD *)v14 = *(_QWORD *)v15;
  *((_QWORD *)v14 + 1) = v16;
  swift_bridgeObjectRetain();
  swift_retain();
  __swift_storeEnumTagSinglePayload((uint64_t)a1, 0, 2, v6);
  return a1;
}

char *sub_21EB70B24(char *a1, char *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_255478018);
  if (__swift_getEnumTagSinglePayload((uint64_t)a2, 2, v6))
  {
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64));
  }
  else
  {
    v7 = sub_21EBB7464();
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v7 - 8) + 32))(a1, a2, v7);
    *(_OWORD *)&a1[*(int *)(v6 + 48)] = *(_OWORD *)&a2[*(int *)(v6 + 48)];
    *(_OWORD *)&a1[*(int *)(v6 + 64)] = *(_OWORD *)&a2[*(int *)(v6 + 64)];
    __swift_storeEnumTagSinglePayload((uint64_t)a1, 0, 2, v6);
  }
  return a1;
}

char *sub_21EB70BDC(char *a1, char *a2, uint64_t a3)
{
  uint64_t v6;
  int EnumTagSinglePayload;
  int v8;
  uint64_t v9;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_255478018);
  EnumTagSinglePayload = __swift_getEnumTagSinglePayload((uint64_t)a1, 2, v6);
  v8 = __swift_getEnumTagSinglePayload((uint64_t)a2, 2, v6);
  if (!EnumTagSinglePayload)
  {
    if (!v8)
    {
      v11 = sub_21EBB7464();
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v11 - 8) + 40))(a1, a2, v11);
      v12 = *(int *)(v6 + 48);
      v13 = &a1[v12];
      v14 = &a2[v12];
      v16 = *(_QWORD *)v14;
      v15 = *((_QWORD *)v14 + 1);
      *(_QWORD *)v13 = v16;
      *((_QWORD *)v13 + 1) = v15;
      swift_bridgeObjectRelease();
      *(_OWORD *)&a1[*(int *)(v6 + 64)] = *(_OWORD *)&a2[*(int *)(v6 + 64)];
      swift_release();
      return a1;
    }
    sub_21EB72984((uint64_t)a1, &qword_255478018);
    goto LABEL_6;
  }
  if (v8)
  {
LABEL_6:
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64));
    return a1;
  }
  v9 = sub_21EBB7464();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v9 - 8) + 32))(a1, a2, v9);
  *(_OWORD *)&a1[*(int *)(v6 + 48)] = *(_OWORD *)&a2[*(int *)(v6 + 48)];
  *(_OWORD *)&a1[*(int *)(v6 + 64)] = *(_OWORD *)&a2[*(int *)(v6 + 64)];
  __swift_storeEnumTagSinglePayload((uint64_t)a1, 0, 2, v6);
  return a1;
}

uint64_t sub_21EB70D20()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_21EB70D2C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  unsigned int EnumTagSinglePayload;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_255478018);
  EnumTagSinglePayload = __swift_getEnumTagSinglePayload(a1, a2, v4);
  if (EnumTagSinglePayload >= 3)
    return EnumTagSinglePayload - 2;
  else
    return 0;
}

uint64_t sub_21EB70D74()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_21EB70D80(uint64_t a1, int a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;

  if (a2)
    v5 = (a2 + 2);
  else
    v5 = 0;
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_255478018);
  return OUTLINED_FUNCTION_3_3(a1, v5, a3, v6);
}

uint64_t sub_21EB70DC8(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_255478018);
  return __swift_getEnumTagSinglePayload(a1, 2, v2);
}

uint64_t sub_21EB70DFC(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_255478018);
  return __swift_storeEnumTagSinglePayload(a1, a2, 2, v4);
}

uint64_t sub_21EB70E38()
{
  uint64_t result;
  unint64_t v1;

  result = sub_21EBB7464();
  if (v1 <= 0x3F)
  {
    swift_getTupleTypeLayout3();
    swift_initEnumMetadataSinglePayload();
    return 0;
  }
  return result;
}

uint64_t sub_21EB70EB4()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_21EB70EC4@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  char *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t result;
  char v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  char v24;
  char v25;
  uint64_t v26;

  v2 = type metadata accessor for EvernoteWebView(0);
  v22 = *(_QWORD *)(v2 - 8);
  v3 = *(_QWORD *)(v22 + 64);
  v4 = MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v21 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v21 - v6;
  sub_21EBB7B78();
  if (qword_2554776B0 != -1)
    swift_once();
  v8 = (id)qword_255478EA8;
  v9 = (void *)sub_21EBB7B48();
  v10 = (void *)sub_21EBB7B48();
  swift_bridgeObjectRelease();
  v11 = objc_msgSend(v8, sel_localizedStringForKey_value_table_, v9, v10, 0);

  v21 = sub_21EBB7B60();
  v13 = v12;

  v14 = v23;
  sub_21EB722D8(v23, (uint64_t)v7, type metadata accessor for EvernoteWebView);
  v15 = (*(unsigned __int8 *)(v22 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v22 + 80);
  v16 = swift_allocObject();
  sub_21EB72308((uint64_t)v7, v16 + v15);
  sub_21EB722D8(v14, (uint64_t)v5, type metadata accessor for EvernoteWebView);
  v17 = swift_allocObject();
  sub_21EB72308((uint64_t)v5, v17 + v15);
  v24 = 0;
  result = sub_21EBB79C8();
  v19 = v25;
  v20 = v26;
  *(_QWORD *)a1 = v21;
  *(_QWORD *)(a1 + 8) = v13;
  *(_WORD *)(a1 + 16) = 257;
  *(_QWORD *)(a1 + 24) = sub_21EB7234C;
  *(_QWORD *)(a1 + 32) = v16;
  *(_QWORD *)(a1 + 40) = sub_21EB7246C;
  *(_QWORD *)(a1 + 48) = v17;
  *(_QWORD *)(a1 + 56) = 0;
  *(_QWORD *)(a1 + 64) = 0;
  *(_BYTE *)(a1 + 72) = v19;
  *(_QWORD *)(a1 + 80) = v20;
  return result;
}

void sub_21EB71100(uint64_t a1@<X8>)
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
  char *v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  char *v22;
  uint64_t v23;
  uint64_t v24;
  char *v25;
  uint64_t v26;
  uint64_t v27;
  unint64_t v28;
  uint64_t v29;
  uint64_t (**v30)();
  char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  char *v35;
  void (*v36)(char *, char *, uint64_t);
  uint64_t v37;
  char *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  _QWORD *v42;
  uint64_t v43;
  char *v44;
  char *v45;
  uint64_t v46;
  uint64_t v47;
  char *v48;
  uint64_t v49;
  uint64_t v50;
  char *v51;
  uint64_t v52;
  __int128 v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;

  v58 = a1;
  v2 = sub_21EBB73BC();
  v46 = *(_QWORD *)(v2 - 8);
  v47 = v2;
  MEMORY[0x24BDAC7A8](v2);
  v45 = (char *)&v43 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v57 = type metadata accessor for WebView(0);
  MEMORY[0x24BDAC7A8](v57);
  v51 = (char *)&v43 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = sub_21EBB7464();
  v49 = *(_QWORD *)(v5 - 8);
  v50 = v5;
  v6 = MEMORY[0x24BDAC7A8](v5);
  v44 = (char *)&v43 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v6);
  v48 = (char *)&v43 - v8;
  v55 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_255478150);
  MEMORY[0x24BDAC7A8](v55);
  v56 = (uint64_t)&v43 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = type metadata accessor for EvernoteWebView(0);
  *(_QWORD *)&v53 = *(_QWORD *)(v10 - 8);
  v11 = *(_QWORD *)(v53 + 64);
  MEMORY[0x24BDAC7A8](v10);
  v52 = __swift_instantiateConcreteTypeFromMangledName(&qword_2554779B8);
  v12 = *(_QWORD *)(v52 - 8);
  MEMORY[0x24BDAC7A8](v52);
  v14 = (char *)&v43 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_255478160);
  MEMORY[0x24BDAC7A8](v15);
  v17 = (char *)&v43 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v54 = __swift_instantiateConcreteTypeFromMangledName(&qword_255478168);
  v18 = MEMORY[0x24BDAC7A8](v54);
  v20 = (char *)&v43 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v18);
  v22 = (char *)&v43 - v21;
  v23 = type metadata accessor for EvernoteWebView.LoadingState(0);
  MEMORY[0x24BDAC7A8](v23);
  v25 = (char *)&v43 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  v26 = v1;
  __swift_instantiateConcreteTypeFromMangledName(qword_255478028);
  sub_21EBB79D4();
  v27 = __swift_instantiateConcreteTypeFromMangledName(&qword_255478018);
  if (__swift_getEnumTagSinglePayload((uint64_t)v25, 2, v27))
  {
    sub_21EBB7554();
    sub_21EBB7AAC();
    sub_21EB7F1A8(0.0, 1, 0.0, 1, INFINITY, 0, 0.0, 1, (uint64_t)v17, 0.0, 1, INFINITY, 0);
    (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v52);
    sub_21EB722D8(v26, (uint64_t)&v43 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0), type metadata accessor for EvernoteWebView);
    v28 = (*(unsigned __int8 *)(v53 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v53 + 80);
    v29 = swift_allocObject();
    sub_21EB72308((uint64_t)&v43 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0), v29 + v28);
    sub_21EB726D8((uint64_t)v17, (uint64_t)v20, &qword_255478160);
    v30 = (uint64_t (**)())&v20[*(int *)(v54 + 36)];
    *v30 = sub_21EB7265C;
    v30[1] = (uint64_t (*)())v29;
    v30[2] = 0;
    v30[3] = 0;
    sub_21EB72984((uint64_t)v17, &qword_255478160);
    sub_21EB72690((uint64_t)v20, (uint64_t)v22);
    sub_21EB726D8((uint64_t)v22, v56, &qword_255478168);
    swift_storeEnumTagMultiPayload();
    sub_21EB72568();
    sub_21EB65BBC(&qword_255478198, (void (*)(uint64_t))type metadata accessor for WebView);
    sub_21EBB777C();
    sub_21EB72984((uint64_t)v22, &qword_255478168);
  }
  else
  {
    v31 = &v25[*(int *)(v27 + 48)];
    v32 = *(_QWORD *)v31;
    v33 = *((_QWORD *)v31 + 1);
    v35 = v48;
    v34 = v49;
    v36 = *(void (**)(char *, char *, uint64_t))(v49 + 32);
    v53 = *(_OWORD *)&v25[*(int *)(v27 + 64)];
    v37 = v50;
    v36(v48, v25, v50);
    (*(void (**)(char *, char *, uint64_t))(v34 + 16))(v44, v35, v37);
    v38 = v45;
    sub_21EBB73A4();
    v39 = swift_allocObject();
    *(_QWORD *)(v39 + 16) = v32;
    *(_QWORD *)(v39 + 24) = v33;
    *(_OWORD *)(v39 + 32) = v53;
    v40 = (uint64_t)v51;
    (*(void (**)(char *, char *, uint64_t))(v46 + 32))(v51, v38, v47);
    v41 = v56;
    v42 = (_QWORD *)(v40 + *(int *)(v57 + 20));
    *v42 = &unk_255478178;
    v42[1] = v39;
    sub_21EB722D8(v40, v41, type metadata accessor for WebView);
    swift_storeEnumTagMultiPayload();
    sub_21EB72568();
    sub_21EB65BBC(&qword_255478198, (void (*)(uint64_t))type metadata accessor for WebView);
    sub_21EBB777C();
    sub_21EB6FD5C(v40, type metadata accessor for WebView);
    (*(void (**)(char *, uint64_t))(v34 + 8))(v35, v37);
  }
}

uint64_t sub_21EB7168C(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata accessor for EvernoteWebView(0);
  return (*(uint64_t (**)(_QWORD, _QWORD))(a1 + *(int *)(v2 + 24)))(0, 0);
}

uint64_t sub_21EB716C8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;

  v5[9] = a4;
  v5[10] = a5;
  v5[7] = a2;
  v5[8] = a3;
  v5[6] = a1;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_255477C80);
  v5[11] = swift_task_alloc();
  v6 = sub_21EBB73BC();
  v5[12] = v6;
  v5[13] = *(_QWORD *)(v6 - 8);
  v5[14] = swift_task_alloc();
  v7 = sub_21EBB7464();
  v5[15] = v7;
  v5[16] = *(_QWORD *)(v7 - 8);
  v5[17] = swift_task_alloc();
  sub_21EBB7C20();
  v5[18] = sub_21EBB7C14();
  sub_21EBB7BF0();
  return swift_task_switch();
}

uint64_t sub_21EB717B0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  v2 = *(_QWORD *)(v0 + 112);
  v1 = *(_QWORD *)(v0 + 120);
  v3 = *(_QWORD *)(v0 + 104);
  v4 = *(_QWORD *)(v0 + 88);
  v5 = *(void **)(v0 + 48);
  swift_release();
  v6 = objc_msgSend(v5, sel_request);
  sub_21EBB7398();

  sub_21EBB73B0();
  OUTLINED_FUNCTION_6_2(v2, *(uint64_t (**)(uint64_t, uint64_t))(v3 + 8));
  if (__swift_getEnumTagSinglePayload(v4, 1, v1) == 1)
  {
    sub_21EB72984(*(_QWORD *)(v0 + 88), (uint64_t *)&unk_255477C80);
LABEL_6:
    v13 = 1;
    goto LABEL_7;
  }
  v8 = *(_QWORD *)(v0 + 56);
  v7 = *(_QWORD *)(v0 + 64);
  (*(void (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(v0 + 128) + 32))(*(_QWORD *)(v0 + 136), *(_QWORD *)(v0 + 88), *(_QWORD *)(v0 + 120));
  *(_QWORD *)(v0 + 16) = sub_21EBB7428();
  *(_QWORD *)(v0 + 24) = v9;
  *(_QWORD *)(v0 + 32) = v8;
  *(_QWORD *)(v0 + 40) = v7;
  sub_21EB729AC();
  sub_21EB729E8();
  v10 = sub_21EBB7B30();
  swift_bridgeObjectRelease();
  v12 = *(_QWORD *)(v0 + 128);
  v11 = *(_QWORD *)(v0 + 136);
  if ((v10 & 1) == 0)
  {
    OUTLINED_FUNCTION_6_2(*(_QWORD *)(v0 + 136), *(uint64_t (**)(uint64_t, uint64_t))(v12 + 8));
    goto LABEL_6;
  }
  (*(void (**)(_QWORD))(v0 + 72))(*(_QWORD *)(v0 + 136));
  OUTLINED_FUNCTION_6_2(v11, *(uint64_t (**)(uint64_t, uint64_t))(v12 + 8));
  v13 = 0;
LABEL_7:
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(uint64_t))(v0 + 8))(v13);
}

void sub_21EB71934(void **a1)
{
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  int EnumTagSinglePayload;
  void *v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t aBlock;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;

  v2 = type metadata accessor for EvernoteWebView(0);
  v24 = *(_QWORD *)(v2 - 8);
  v3 = *(_QWORD *)(v24 + 64);
  MEMORY[0x24BDAC7A8](v2);
  v4 = (char *)&v23 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = type metadata accessor for EvernoteWebView.LoadingState(0);
  v6 = MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v23 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = MEMORY[0x24BDAC7A8](v6);
  v11 = (char *)&v23 - v10;
  MEMORY[0x24BDAC7A8](v9);
  v13 = (char *)&v23 - v12;
  __swift_instantiateConcreteTypeFromMangledName(qword_255478028);
  sub_21EBB79D4();
  v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_255478018);
  EnumTagSinglePayload = __swift_getEnumTagSinglePayload((uint64_t)v13, 2, v14);
  sub_21EB6FD5C((uint64_t)v13, type metadata accessor for EvernoteWebView.LoadingState);
  if (EnumTagSinglePayload == 1)
  {
    __swift_storeEnumTagSinglePayload((uint64_t)v11, 2, 2, v14);
    sub_21EB722D8((uint64_t)v11, (uint64_t)v8, type metadata accessor for EvernoteWebView.LoadingState);
    sub_21EBB79E0();
    sub_21EB6FD5C((uint64_t)v11, type metadata accessor for EvernoteWebView.LoadingState);
    v16 = *a1;
    sub_21EB722D8((uint64_t)a1, (uint64_t)&v23 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0), type metadata accessor for EvernoteWebView);
    v17 = (*(unsigned __int8 *)(v24 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v24 + 80);
    v18 = swift_allocObject();
    sub_21EB72308((uint64_t)v4, v18 + v17);
    v29 = sub_21EB72708;
    v30 = v18;
    v19 = MEMORY[0x24BDAC760];
    aBlock = MEMORY[0x24BDAC760];
    v26 = 1107296256;
    v27 = sub_21EB7208C;
    v28 = &block_descriptor_25;
    v20 = _Block_copy(&aBlock);
    swift_release();
    sub_21EB722D8((uint64_t)a1, (uint64_t)v4, type metadata accessor for EvernoteWebView);
    v21 = swift_allocObject();
    sub_21EB72308((uint64_t)v4, v21 + v17);
    v29 = sub_21EB72764;
    v30 = v21;
    aBlock = v19;
    v26 = 1107296256;
    v27 = sub_21EB6BF78;
    v28 = &block_descriptor_31;
    v22 = _Block_copy(&aBlock);
    swift_release();
    objc_msgSend(v16, sel_authenticateWithAuthorizationBlock_preferRegistration_completion_, v20, 0, v22);
    _Block_release(v22);
    _Block_release(v20);
  }
}

uint64_t sub_21EB71C08(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
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
  char *v18;
  unint64_t v19;
  unint64_t v20;
  unint64_t v21;
  uint64_t v22;
  _QWORD *v23;
  uint64_t v24;
  _QWORD *v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  char *v29;
  void *v30;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  char *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  _QWORD aBlock[6];

  v33 = a6;
  v34 = a2;
  v37 = a4;
  v38 = a5;
  v35 = a3;
  v40 = sub_21EBB7ADC();
  v43 = *(_QWORD *)(v40 - 8);
  MEMORY[0x24BDAC7A8](v40);
  v39 = (char *)&v32 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_21EBB7B00();
  v41 = *(_QWORD *)(v8 - 8);
  v42 = v8;
  MEMORY[0x24BDAC7A8](v8);
  v10 = (char *)&v32 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = sub_21EBB7464();
  v12 = *(_QWORD *)(v11 - 8);
  v13 = *(_QWORD *)(v12 + 64);
  MEMORY[0x24BDAC7A8](v11);
  v14 = (char *)&v32 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = type metadata accessor for EvernoteWebView(0);
  v16 = *(_QWORD *)(v15 - 8);
  v17 = *(_QWORD *)(v16 + 64);
  MEMORY[0x24BDAC7A8](v15);
  v18 = (char *)&v32 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_21EB6FC70();
  v36 = sub_21EBB7C80();
  sub_21EB722D8(v33, (uint64_t)v18, type metadata accessor for EvernoteWebView);
  (*(void (**)(char *, uint64_t, uint64_t))(v12 + 16))(v14, a1, v11);
  v19 = (*(unsigned __int8 *)(v16 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v16 + 80);
  v20 = (v17 + *(unsigned __int8 *)(v12 + 80) + v19) & ~(unint64_t)*(unsigned __int8 *)(v12 + 80);
  v21 = (v13 + v20 + 7) & 0xFFFFFFFFFFFFFFF8;
  v22 = swift_allocObject();
  sub_21EB72308((uint64_t)v18, v22 + v19);
  (*(void (**)(unint64_t, char *, uint64_t))(v12 + 32))(v22 + v20, v14, v11);
  v23 = (_QWORD *)(v22 + v21);
  v24 = v35;
  *v23 = v34;
  v23[1] = v24;
  v25 = (_QWORD *)(v22 + ((v21 + 23) & 0xFFFFFFFFFFFFFFF8));
  v26 = v38;
  *v25 = v37;
  v25[1] = v26;
  aBlock[4] = sub_21EB72900;
  aBlock[5] = v22;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_21EB83A60;
  aBlock[3] = &block_descriptor_40;
  v27 = _Block_copy(aBlock);
  swift_bridgeObjectRetain();
  swift_retain();
  swift_release();
  sub_21EBB7AF4();
  aBlock[0] = MEMORY[0x24BEE4AF8];
  sub_21EB65BBC(&qword_255477E90, (void (*)(uint64_t))MEMORY[0x24BEE5458]);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_255477C30);
  sub_21EB72A50(&qword_255477EA0, (uint64_t *)&unk_255477C30);
  v29 = v39;
  v28 = v40;
  sub_21EBB7CEC();
  v30 = (void *)v36;
  MEMORY[0x2207B78E0](0, v10, v29, v27);
  _Block_release(v27);

  (*(void (**)(char *, uint64_t))(v43 + 8))(v29, v28);
  return (*(uint64_t (**)(char *, uint64_t))(v41 + 8))(v10, v42);
}

void sub_21EB71F28(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  char *v18;
  char *v19;
  uint64_t v20;
  _QWORD v21[2];

  v21[1] = a1;
  v11 = type metadata accessor for EvernoteWebView.LoadingState(0);
  v12 = MEMORY[0x24BDAC7A8](v11);
  v14 = (char *)v21 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v12);
  v16 = (char *)v21 - v15;
  v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_255478018);
  v18 = &v16[*(int *)(v17 + 48)];
  v19 = &v16[*(int *)(v17 + 64)];
  v20 = sub_21EBB7464();
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v20 - 8) + 16))(v16, a2, v20);
  *(_QWORD *)v18 = a3;
  *((_QWORD *)v18 + 1) = a4;
  *(_QWORD *)v19 = a5;
  *((_QWORD *)v19 + 1) = a6;
  __swift_storeEnumTagSinglePayload((uint64_t)v16, 0, 2, v17);
  type metadata accessor for EvernoteWebView(0);
  sub_21EB722D8((uint64_t)v16, (uint64_t)v14, type metadata accessor for EvernoteWebView.LoadingState);
  swift_bridgeObjectRetain();
  swift_retain();
  __swift_instantiateConcreteTypeFromMangledName(qword_255478028);
  sub_21EBB79E0();
  sub_21EB6FD5C((uint64_t)v16, type metadata accessor for EvernoteWebView.LoadingState);
}

uint64_t sub_21EB7208C(uint64_t a1, uint64_t a2, uint64_t a3, const void *a4)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  void (*v10)(char *, uint64_t, uint64_t, void (*)(uint64_t), uint64_t);
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v17;

  v6 = sub_21EBB7464();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = *(void (**)(char *, uint64_t, uint64_t, void (*)(uint64_t), uint64_t))(a1 + 32);
  sub_21EBB7440();
  v11 = sub_21EBB7B60();
  v13 = v12;
  v14 = _Block_copy(a4);
  v15 = swift_allocObject();
  *(_QWORD *)(v15 + 16) = v14;
  swift_retain();
  v10(v9, v11, v13, sub_21EB7278C, v15);
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  return (*(uint64_t (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

void sub_21EB721A8(uint64_t a1, uint64_t a2)
{
  id v3;

  v3 = (id)sub_21EBB7434();
  (*(void (**)(uint64_t, id))(a2 + 16))(a2, v3);

}

void sub_21EB721EC(void *a1, uint64_t a2)
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;

  if (a1)
  {
    _s3__C4CodeOMa_1(0);
    v4 = a1;
    sub_21EB65BBC(qword_2554781A0, _s3__C4CodeOMa_1);
    v5 = 0;
    if ((sub_21EBB73C8() & 1) == 0)
    {
      v6 = a1;
      v5 = a1;
    }
    v7 = type metadata accessor for EvernoteWebView(0);
    (*(void (**)(_QWORD, void *))(a2 + *(int *)(v7 + 24)))(0, v5);

  }
  else
  {
    v8 = type metadata accessor for EvernoteWebView(0);
    (*(void (**)(uint64_t, _QWORD))(a2 + *(int *)(v8 + 24)))(1, 0);
  }
}

void sub_21EB722D8(uint64_t a1, uint64_t a2, uint64_t (*a3)(_QWORD))
{
  uint64_t v3;

  v3 = a3(0);
  OUTLINED_FUNCTION_2_2(v3);
  OUTLINED_FUNCTION_5();
}

uint64_t sub_21EB72308(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for EvernoteWebView(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

void sub_21EB7234C(uint64_t a1@<X8>)
{
  OUTLINED_FUNCTION_0_3();
  sub_21EB71100(a1);
}

uint64_t objectdestroy_8Tm()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  id *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v1 = type metadata accessor for EvernoteWebView(0);
  v2 = *(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80);
  v3 = (id *)(v0 + ((v2 + 16) & ~v2));

  v4 = (uint64_t)v3 + *(int *)(v1 + 20);
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_255478018);
  if (!__swift_getEnumTagSinglePayload(v4, 2, v5))
  {
    v6 = OUTLINED_FUNCTION_8_3();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 8))(v4, v6);
    OUTLINED_FUNCTION_7_1();
    OUTLINED_FUNCTION_4_2();
  }
  __swift_instantiateConcreteTypeFromMangledName(qword_255478028);
  swift_release();
  OUTLINED_FUNCTION_4_2();
  return swift_deallocObject();
}

uint64_t sub_21EB7246C()
{
  return sub_21EB72668(sub_21EB7168C);
}

uint64_t sub_21EB72478()
{
  swift_bridgeObjectRelease();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_21EB724A4(uint64_t a1)
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
  v8[1] = sub_21EB72518;
  return sub_21EB716C8(a1, v4, v5, v7, v6);
}

uint64_t sub_21EB72518(uint64_t a1)
{
  uint64_t *v1;
  uint64_t v4;

  v4 = *v1;
  swift_task_dealloc();
  return (*(uint64_t (**)(uint64_t))(v4 + 8))(a1);
}

unint64_t sub_21EB72568()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_255478180;
  if (!qword_255478180)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_255478168);
    v2[0] = sub_21EB725D4();
    v2[1] = MEMORY[0x24BDF0910];
    result = MEMORY[0x2207B8330](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_255478180);
  }
  return result;
}

unint64_t sub_21EB725D4()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;
  _QWORD v3[2];

  result = qword_255478188;
  if (!qword_255478188)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_255478160);
    sub_21EB72A50(&qword_2554779B0, &qword_2554779B8);
    v3[0] = v2;
    v3[1] = MEMORY[0x24BDEDBB8];
    result = MEMORY[0x2207B8330](MEMORY[0x24BDED308], v1, v3);
    atomic_store(result, (unint64_t *)&qword_255478188);
  }
  return result;
}

uint64_t sub_21EB7265C()
{
  return sub_21EB72668((uint64_t (*)(uint64_t))sub_21EB71934);
}

uint64_t sub_21EB72668(uint64_t (*a1)(uint64_t))
{
  uint64_t v1;
  uint64_t v2;

  OUTLINED_FUNCTION_0_3();
  return a1(v1 + v2);
}

uint64_t sub_21EB72690(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_255478168);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

void sub_21EB726D8(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v3;

  v3 = __swift_instantiateConcreteTypeFromMangledName(a3);
  OUTLINED_FUNCTION_2_2(v3);
  OUTLINED_FUNCTION_5();
}

uint64_t sub_21EB72708(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;
  uint64_t v11;

  OUTLINED_FUNCTION_0_3();
  return sub_21EB71C08(a1, a2, a3, a4, a5, v5 + v11);
}

void sub_21EB72764(void *a1)
{
  uint64_t v1;
  uint64_t v3;

  OUTLINED_FUNCTION_0_3();
  sub_21EB721EC(a1, v1 + v3);
}

void sub_21EB7278C(uint64_t a1)
{
  uint64_t v1;

  sub_21EB721A8(a1, *(_QWORD *)(v1 + 16));
}

uint64_t sub_21EB72794()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v10;

  v1 = type metadata accessor for EvernoteWebView(0);
  v2 = *(_QWORD *)(v1 - 8);
  v3 = (*(unsigned __int8 *)(v2 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  v10 = *(_QWORD *)(v2 + 64);
  v4 = OUTLINED_FUNCTION_8_3();
  v5 = *(_QWORD *)(v4 - 8);
  v6 = *(unsigned __int8 *)(v5 + 80);

  v7 = v0 + v3 + *(int *)(v1 + 20);
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_255478018);
  if (!__swift_getEnumTagSinglePayload(v7, 2, v8))
  {
    OUTLINED_FUNCTION_6_2(v7, *(uint64_t (**)(uint64_t, uint64_t))(v5 + 8));
    OUTLINED_FUNCTION_7_1();
    OUTLINED_FUNCTION_4_2();
  }
  __swift_instantiateConcreteTypeFromMangledName(qword_255478028);
  swift_release();
  OUTLINED_FUNCTION_4_2();
  (*(void (**)(unint64_t, uint64_t))(v5 + 8))(v0 + ((v3 + v10 + v6) & ~v6), v4);
  OUTLINED_FUNCTION_7_1();
  OUTLINED_FUNCTION_4_2();
  return swift_deallocObject();
}

void sub_21EB72900()
{
  uint64_t v0;
  uint64_t v1;
  unint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;

  v1 = *(_QWORD *)(type metadata accessor for EvernoteWebView(0) - 8);
  v2 = (*(unsigned __int8 *)(v1 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80);
  v3 = *(_QWORD *)(v1 + 64);
  v4 = *(_QWORD *)(OUTLINED_FUNCTION_8_3() - 8);
  v5 = (v2 + v3 + *(unsigned __int8 *)(v4 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  v6 = (*(_QWORD *)(v4 + 64) + v5 + 7) & 0xFFFFFFFFFFFFFFF8;
  sub_21EB71F28(v0 + v2, v0 + v5, *(_QWORD *)(v0 + v6), *(_QWORD *)(v0 + v6 + 8), *(_QWORD *)(v0 + ((v6 + 23) & 0xFFFFFFFFFFFFFFF8)), *(_QWORD *)(v0 + ((v6 + 23) & 0xFFFFFFFFFFFFFFF8) + 8));
}

void sub_21EB72984(uint64_t a1, uint64_t *a2)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(a2);
  OUTLINED_FUNCTION_5_3(v2);
  OUTLINED_FUNCTION_5();
}

unint64_t sub_21EB729AC()
{
  unint64_t result;

  result = qword_2554781B0;
  if (!qword_2554781B0)
  {
    result = MEMORY[0x2207B8330](MEMORY[0x24BEE0D18], MEMORY[0x24BEE0D00]);
    atomic_store(result, (unint64_t *)&qword_2554781B0);
  }
  return result;
}

unint64_t sub_21EB729E8()
{
  unint64_t result;

  result = qword_2554781B8;
  if (!qword_2554781B8)
  {
    result = MEMORY[0x2207B8330](MEMORY[0x24BEE5E60], MEMORY[0x24BEE0D00]);
    atomic_store(result, (unint64_t *)&qword_2554781B8);
  }
  return result;
}

void sub_21EB72A24()
{
  sub_21EB72A50(qword_2554781C0, (uint64_t *)&unk_255479120);
}

void sub_21EB72A50(_QWORD *a1, uint64_t *a2)
{
  if (!*a1)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    OUTLINED_FUNCTION_7();
  }
  OUTLINED_FUNCTION_5();
}

uint64_t OUTLINED_FUNCTION_0_3()
{
  return type metadata accessor for EvernoteWebView(0);
}

uint64_t OUTLINED_FUNCTION_2_2(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(a1 - 8) + 16))(v1, v2, a1);
}

uint64_t OUTLINED_FUNCTION_3_3(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_storeEnumTagSinglePayload(a1, a2, a3, a4);
}

uint64_t OUTLINED_FUNCTION_4_2()
{
  return swift_release();
}

uint64_t OUTLINED_FUNCTION_5_3(uint64_t a1)
{
  uint64_t v1;

  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(a1 - 8) + 8))(v1, a1);
}

uint64_t OUTLINED_FUNCTION_6_2@<X0>(uint64_t a1@<X0>, uint64_t (*a2)(uint64_t, uint64_t)@<X8>)
{
  uint64_t v2;

  return a2(a1, v2);
}

uint64_t OUTLINED_FUNCTION_7_1()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_8_3()
{
  return sub_21EBB7464();
}

uint64_t sub_21EB72B1C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_21EB73D00(v1, a1);
}

id sub_21EB72B2C()
{
  id v0;
  id v1;
  void *v3;

  v0 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDFA920]), sel_init);
  v1 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDFA918]), sel_initWithFrame_configuration_, v0, 0.0, 0.0, 0.0, 0.0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_255478390);
  sub_21EBB7824();
  objc_msgSend(v1, sel_setUIDelegate_, v3);

  sub_21EBB7824();
  objc_msgSend(v1, sel_setNavigationDelegate_, v3);

  return v1;
}

void sub_21EB72C10(void *a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
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
  uint64_t v19;
  uint64_t v20;
  char *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void (*v30)(char *, uint64_t, uint64_t);
  uint64_t v31;
  uint64_t v32;
  char *v33;
  uint64_t v34;
  void (*v35)(char *, uint64_t);
  void *v36;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  char *v41;
  uint64_t v42;
  uint64_t v43;
  id v44;
  char *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  void *v49;
  void *v50;

  v3 = v2;
  v44 = a1;
  v5 = sub_21EBB73BC();
  v47 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v41 = (char *)&v40 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v48 = __swift_instantiateConcreteTypeFromMangledName(&qword_255478380);
  MEMORY[0x24BDAC7A8](v48);
  v8 = (char *)&v40 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_255478388);
  v10 = MEMORY[0x24BDAC7A8](v9);
  v45 = (char *)&v40 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = MEMORY[0x24BDAC7A8](v10);
  v42 = (uint64_t)&v40 - v13;
  v14 = MEMORY[0x24BDAC7A8](v12);
  v16 = (char *)&v40 - v15;
  MEMORY[0x24BDAC7A8](v14);
  v18 = (char *)&v40 - v17;
  v19 = type metadata accessor for WebView(0);
  MEMORY[0x24BDAC7A8](v19);
  v21 = (char *)&v40 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  v22 = __swift_instantiateConcreteTypeFromMangledName(&qword_255478390);
  sub_21EBB7824();
  v23 = v49;
  sub_21EB73D00(v2, (uint64_t)v21);
  v24 = (uint64_t)v23
      + OBJC_IVAR____TtCV11ActionKitUIP33_95B3E30599CAF9D678AD3209E5191A0514WebHostingView11Coordinator_configuration;
  swift_beginAccess();
  sub_21EB73D80((uint64_t)v21, v24);
  swift_endAccess();

  v43 = v22;
  v46 = a2;
  v25 = v47;
  sub_21EBB7824();
  v26 = v49;
  v27 = (uint64_t)v49
      + OBJC_IVAR____TtCV11ActionKitUIP33_95B3E30599CAF9D678AD3209E5191A0514WebHostingView11Coordinator_loadedRequest;
  swift_beginAccess();
  sub_21EB73DC4(v27, (uint64_t)v18);

  v28 = v3;
  v29 = (uint64_t)v8;
  v30 = *(void (**)(char *, uint64_t, uint64_t))(v25 + 16);
  v30(v16, v28, v5);
  __swift_storeEnumTagSinglePayload((uint64_t)v16, 0, 1, v5);
  v31 = v29 + *(int *)(v48 + 48);
  sub_21EB73DC4((uint64_t)v18, v29);
  sub_21EB73DC4((uint64_t)v16, v31);
  if (__swift_getEnumTagSinglePayload(v29, 1, v5) == 1)
  {
    sub_21EB73E0C((uint64_t)v16, &qword_255478388);
    sub_21EB73E0C((uint64_t)v18, &qword_255478388);
    if (__swift_getEnumTagSinglePayload(v31, 1, v5) == 1)
    {
      sub_21EB73E0C(v29, &qword_255478388);
      return;
    }
  }
  else
  {
    v32 = v42;
    sub_21EB73DC4(v29, v42);
    if (__swift_getEnumTagSinglePayload(v31, 1, v5) != 1)
    {
      v33 = v41;
      (*(void (**)(char *, uint64_t, uint64_t))(v25 + 32))(v41, v31, v5);
      sub_21EB6C4FC(&qword_255478398, (uint64_t (*)(uint64_t))MEMORY[0x24BDCB0C0], MEMORY[0x24BDCB0D8]);
      LODWORD(v48) = sub_21EBB7B3C();
      v34 = v32;
      v35 = *(void (**)(char *, uint64_t))(v25 + 8);
      v35(v33, v5);
      sub_21EB73E0C((uint64_t)v16, &qword_255478388);
      sub_21EB73E0C((uint64_t)v18, &qword_255478388);
      v35((char *)v34, v5);
      sub_21EB73E0C(v29, &qword_255478388);
      if ((v48 & 1) != 0)
        return;
      goto LABEL_8;
    }
    sub_21EB73E0C((uint64_t)v16, &qword_255478388);
    sub_21EB73E0C((uint64_t)v18, &qword_255478388);
    (*(void (**)(uint64_t, uint64_t))(v25 + 8))(v32, v5);
  }
  sub_21EB73E0C(v29, &qword_255478380);
LABEL_8:
  v36 = (void *)sub_21EBB738C();

  sub_21EBB7824();
  v37 = v50;
  v38 = (uint64_t)v45;
  v30(v45, v28, v5);
  __swift_storeEnumTagSinglePayload(v38, 0, 1, v5);
  v39 = (uint64_t)v37
      + OBJC_IVAR____TtCV11ActionKitUIP33_95B3E30599CAF9D678AD3209E5191A0514WebHostingView11Coordinator_loadedRequest;
  swift_beginAccess();
  sub_21EB73E48(v38, v39);
  swift_endAccess();

}

id sub_21EB730D0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  id v4;
  uint64_t v6;

  v1 = type metadata accessor for WebView(0);
  MEMORY[0x24BDAC7A8](v1);
  v3 = (char *)&v6 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_21EB73D00(v0, (uint64_t)v3);
  v4 = objc_allocWithZone((Class)type metadata accessor for WebHostingView.Coordinator(0));
  return sub_21EB73144((uint64_t)v3);
}

id sub_21EB73144(uint64_t a1)
{
  void *v1;
  uint64_t v3;
  uint64_t v4;
  id v5;
  objc_super v7;

  v3 = (uint64_t)v1
     + OBJC_IVAR____TtCV11ActionKitUIP33_95B3E30599CAF9D678AD3209E5191A0514WebHostingView11Coordinator_loadedRequest;
  v4 = sub_21EBB73BC();
  __swift_storeEnumTagSinglePayload(v3, 1, 1, v4);
  sub_21EB73D00(a1, (uint64_t)v1+ OBJC_IVAR____TtCV11ActionKitUIP33_95B3E30599CAF9D678AD3209E5191A0514WebHostingView11Coordinator_configuration);
  v7.receiver = v1;
  v7.super_class = (Class)type metadata accessor for WebHostingView.Coordinator(0);
  v5 = objc_msgSendSuper2(&v7, sel_init);
  sub_21EB73D44(a1);
  return v5;
}

uint64_t sub_21EB731D8(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;

  v3[5] = a2;
  v3[6] = v2;
  sub_21EBB7C20();
  v3[7] = sub_21EBB7C14();
  v3[8] = sub_21EBB7BF0();
  v3[9] = v4;
  return swift_task_switch();
}

uint64_t sub_21EB73244()
{
  _QWORD *v0;
  uint64_t v1;
  int **v2;
  int *v3;
  _QWORD *v4;
  uint64_t (*v6)(_QWORD);

  v1 = v0[6]
     + OBJC_IVAR____TtCV11ActionKitUIP33_95B3E30599CAF9D678AD3209E5191A0514WebHostingView11Coordinator_configuration;
  swift_beginAccess();
  v2 = (int **)(v1 + *(int *)(type metadata accessor for WebView(0) + 20));
  v3 = *v2;
  v0[10] = v2[1];
  v6 = (uint64_t (*)(_QWORD))((char *)v3 + *v3);
  swift_retain();
  v4 = (_QWORD *)swift_task_alloc();
  v0[11] = v4;
  *v4 = v0;
  v4[1] = sub_21EB732E8;
  return v6(v0[5]);
}

uint64_t sub_21EB732E8(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 96) = a1;
  swift_task_dealloc();
  swift_release();
  return swift_task_switch();
}

uint64_t sub_21EB73348()
{
  uint64_t v0;

  swift_release();
  return (*(uint64_t (**)(_QWORD))(v0 + 8))(*(_QWORD *)(v0 + 96));
}

uint64_t sub_21EB733F4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v4;

  v4[4] = a3;
  v4[5] = a4;
  v4[2] = a1;
  v4[3] = a2;
  sub_21EBB7C20();
  v4[6] = sub_21EBB7C14();
  sub_21EBB7BF0();
  return swift_task_switch();
}

uint64_t sub_21EB73464()
{
  uint64_t *v0;
  void *v1;
  const void *v2;
  void *v3;
  void *v4;
  id v5;
  id v6;
  id v7;
  _QWORD *v8;

  v1 = (void *)v0[5];
  v3 = (void *)v0[3];
  v2 = (const void *)v0[4];
  v4 = (void *)v0[2];
  swift_release();
  v0[7] = (uint64_t)_Block_copy(v2);
  v5 = v4;
  v6 = v3;
  v7 = v1;
  v8 = (_QWORD *)swift_task_alloc();
  v0[8] = (uint64_t)v8;
  *v8 = v0;
  v8[1] = sub_21EB734E8;
  return sub_21EB731D8(v0[2], v0[3]);
}

uint64_t sub_21EB734E8(uint64_t a1)
{
  uint64_t (**v1)(void);
  void (**v3)(_QWORD, _QWORD);
  void *v4;
  void *v5;
  void *v6;

  v3 = (void (**)(_QWORD, _QWORD))*((_QWORD *)*v1 + 7);
  v4 = (void *)*((_QWORD *)*v1 + 5);
  v6 = (void *)*((_QWORD *)*v1 + 2);
  v5 = (void *)*((_QWORD *)*v1 + 3);
  OUTLINED_FUNCTION_6_0();

  v3[2](v3, a1);
  _Block_release(v3);
  return v1[1]();
}

void sub_21EB73564()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

id sub_21EB735B0()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for WebHostingView.Coordinator(0);
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_21EB73628()
{
  return type metadata accessor for WebHostingView.Coordinator(0);
}

uint64_t type metadata accessor for WebHostingView.Coordinator(uint64_t a1)
{
  return sub_21EB6FD2C(a1, (uint64_t *)&unk_2554782C8);
}

void sub_21EB73644()
{
  unint64_t v0;
  unint64_t v1;

  type metadata accessor for WebView(319);
  if (v0 <= 0x3F)
  {
    sub_21EB736E0();
    if (v1 <= 0x3F)
      swift_updateClassMetadata2();
  }
}

uint64_t type metadata accessor for WebView(uint64_t a1)
{
  return sub_21EB6FD2C(a1, qword_255478340);
}

void sub_21EB736E0()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_2554782E0)
  {
    sub_21EBB73BC();
    v0 = sub_21EBB7CBC();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_2554782E0);
  }
}

uint64_t *sub_21EB73734(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  _QWORD *v10;
  uint64_t v11;
  uint64_t v12;

  v5 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v12 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v12 + ((v5 + 16) & ~(unint64_t)v5));
  }
  else
  {
    v7 = sub_21EBB73BC();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a1, a2, v7);
    v8 = *(int *)(a3 + 20);
    v9 = (uint64_t *)((char *)a1 + v8);
    v10 = (uint64_t *)((char *)a2 + v8);
    v11 = v10[1];
    *v9 = *v10;
    v9[1] = v11;
  }
  swift_retain();
  return a1;
}

uint64_t sub_21EB737C4(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_21EBB73BC();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return swift_release();
}

uint64_t sub_21EB7380C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  _QWORD *v9;
  uint64_t v10;

  v6 = sub_21EBB73BC();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(a1, a2, v6);
  v7 = *(int *)(a3 + 20);
  v8 = (_QWORD *)(a1 + v7);
  v9 = (_QWORD *)(a2 + v7);
  v10 = v9[1];
  *v8 = *v9;
  v8[1] = v10;
  swift_retain();
  return a1;
}

uint64_t sub_21EB73874(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  _QWORD *v9;
  uint64_t v10;

  v6 = sub_21EBB73BC();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 24))(a1, a2, v6);
  v7 = *(int *)(a3 + 20);
  v8 = (_QWORD *)(a1 + v7);
  v9 = (_QWORD *)(a2 + v7);
  v10 = v9[1];
  *v8 = *v9;
  v8[1] = v10;
  swift_retain();
  swift_release();
  return a1;
}

uint64_t sub_21EB738E8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;

  v6 = sub_21EBB73BC();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 32))(a1, a2, v6);
  *(_OWORD *)(a1 + *(int *)(a3 + 20)) = *(_OWORD *)(a2 + *(int *)(a3 + 20));
  return a1;
}

uint64_t sub_21EB73944(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;

  v6 = sub_21EBB73BC();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 40))(a1, a2, v6);
  *(_OWORD *)(a1 + *(int *)(a3 + 20)) = *(_OWORD *)(a2 + *(int *)(a3 + 20));
  swift_release();
  return a1;
}

uint64_t sub_21EB739AC()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_21EB739B8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  unint64_t v8;

  v6 = sub_21EBB73BC();
  if (*(_DWORD *)(*(_QWORD *)(v6 - 8) + 84) == (_DWORD)a2)
    return __swift_getEnumTagSinglePayload(a1, a2, v6);
  v8 = *(_QWORD *)(a1 + *(int *)(a3 + 20));
  if (v8 >= 0xFFFFFFFF)
    LODWORD(v8) = -1;
  return (v8 + 1);
}

uint64_t sub_21EB73A30()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_21EB73A3C(uint64_t a1, int a2, int a3, uint64_t a4)
{
  uint64_t result;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  result = sub_21EBB73BC();
  if (*(_DWORD *)(*(_QWORD *)(result - 8) + 84) == a3)
  {
    v9 = OUTLINED_FUNCTION_2_3();
    return __swift_storeEnumTagSinglePayload(v9, v10, v11, v12);
  }
  else
  {
    *(_QWORD *)(a1 + *(int *)(a4 + 20)) = (a2 - 1);
  }
  return result;
}

uint64_t sub_21EB73AA4()
{
  uint64_t result;
  unint64_t v1;

  result = sub_21EBB73BC();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t sub_21EB73B18()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_21EB73B28()
{
  return MEMORY[0x24BDF5560];
}

id sub_21EB73B4C@<X0>(_QWORD *a1@<X8>)
{
  id result;

  result = sub_21EB730D0();
  *a1 = result;
  return result;
}

uint64_t sub_21EB73B74()
{
  return sub_21EBB7704();
}

uint64_t sub_21EB73BB4()
{
  sub_21EB6C4FC(&qword_2554783A0, type metadata accessor for WebHostingView, (uint64_t)"=Rx/");
  return sub_21EBB7764();
}

uint64_t sub_21EB73C1C()
{
  sub_21EB6C4FC(&qword_2554783A0, type metadata accessor for WebHostingView, (uint64_t)"=Rx/");
  return sub_21EBB7710();
}

void sub_21EB73C84()
{
  sub_21EB6C4FC(&qword_2554783A0, type metadata accessor for WebHostingView, (uint64_t)"=Rx/");
  sub_21EBB7758();
  __break(1u);
}

uint64_t sub_21EB73CC0()
{
  return sub_21EB6C4FC(&qword_255478378, type metadata accessor for WebHostingView, (uint64_t)"URx/PJ");
}

uint64_t type metadata accessor for WebHostingView(uint64_t a1)
{
  return sub_21EB6FD2C(a1, qword_255478410);
}

uint64_t sub_21EB73D00(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for WebView(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_21EB73D44(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata accessor for WebView(0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_21EB73D80(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for WebView(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t sub_21EB73DC4(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_255478388);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_21EB73E0C(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_21EB73E48(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_255478388);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t sub_21EB73E90()
{
  uint64_t v0;

  _Block_release(*(const void **)(v0 + 32));
  return swift_deallocObject();
}

uint64_t sub_21EB73ECC()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;

  v2 = v0[2];
  v3 = v0[3];
  v5 = v0[4];
  v4 = v0[5];
  v6 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v6;
  *v6 = v1;
  v6[1] = sub_21EB73F44;
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))((char *)&dword_2554783A8 + dword_2554783A8))(v2, v3, v5, v4);
}

uint64_t sub_21EB73F44()
{
  uint64_t v0;

  OUTLINED_FUNCTION_6_0();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t *sub_21EB73F80(uint64_t *a1, uint64_t *a2)
{
  uint64_t v4;
  int v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  _QWORD *v10;
  uint64_t v11;
  uint64_t v12;

  v4 = type metadata accessor for WebView(0);
  v5 = *(_DWORD *)(*(_QWORD *)(v4 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v12 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v12 + ((v5 + 16) & ~(unint64_t)v5));
  }
  else
  {
    v6 = v4;
    v7 = sub_21EBB73BC();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a1, a2, v7);
    v8 = *(int *)(v6 + 20);
    v9 = (uint64_t *)((char *)a1 + v8);
    v10 = (uint64_t *)((char *)a2 + v8);
    v11 = v10[1];
    *v9 = *v10;
    v9[1] = v11;
  }
  swift_retain();
  return a1;
}

uint64_t sub_21EB74018(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_21EBB73BC();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  type metadata accessor for WebView(0);
  return swift_release();
}

uint64_t sub_21EB74064(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;
  _QWORD *v7;
  uint64_t v8;

  v4 = sub_21EBB73BC();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a1, a2, v4);
  v5 = *(int *)(type metadata accessor for WebView(0) + 20);
  v6 = (_QWORD *)(a1 + v5);
  v7 = (_QWORD *)(a2 + v5);
  v8 = v7[1];
  *v6 = *v7;
  v6[1] = v8;
  swift_retain();
  return a1;
}

uint64_t sub_21EB740C8(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;
  _QWORD *v7;
  uint64_t v8;

  v4 = sub_21EBB73BC();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 24))(a1, a2, v4);
  v5 = *(int *)(type metadata accessor for WebView(0) + 20);
  v6 = (_QWORD *)(a1 + v5);
  v7 = (_QWORD *)(a2 + v5);
  v8 = v7[1];
  *v6 = *v7;
  v6[1] = v8;
  swift_retain();
  swift_release();
  return a1;
}

uint64_t sub_21EB74138(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;

  v4 = sub_21EBB73BC();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a1, a2, v4);
  v5 = type metadata accessor for WebView(0);
  *(_OWORD *)(a1 + *(int *)(v5 + 20)) = *(_OWORD *)(a2 + *(int *)(v5 + 20));
  return a1;
}

uint64_t sub_21EB74190(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;

  v4 = sub_21EBB73BC();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 40))(a1, a2, v4);
  v5 = type metadata accessor for WebView(0);
  *(_OWORD *)(a1 + *(int *)(v5 + 20)) = *(_OWORD *)(a2 + *(int *)(v5 + 20));
  swift_release();
  return a1;
}

uint64_t sub_21EB741F4()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_21EB74200()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v2 = OUTLINED_FUNCTION_1_1();
  return __swift_getEnumTagSinglePayload(v1, v0, v2);
}

uint64_t sub_21EB74228()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_21EB74234()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  OUTLINED_FUNCTION_1_1();
  v0 = OUTLINED_FUNCTION_2_3();
  return __swift_storeEnumTagSinglePayload(v0, v1, v2, v3);
}

uint64_t sub_21EB74254()
{
  uint64_t result;
  unint64_t v1;

  result = type metadata accessor for WebView(319);
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t sub_21EB742BC()
{
  return sub_21EB6C4FC(&qword_255478378, type metadata accessor for WebHostingView, (uint64_t)"URx/PJ");
}

uint64_t OUTLINED_FUNCTION_1_1()
{
  return type metadata accessor for WebView(0);
}

uint64_t OUTLINED_FUNCTION_2_3()
{
  uint64_t v0;

  return v0;
}

uint64_t sub_21EB7430C()
{
  id v0;
  void *v1;
  void *v2;
  id v3;

  swift_retain();
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_0_4();
  __swift_instantiateConcreteTypeFromMangledName(&qword_255477C40);
  sub_21EBB79C8();
  sub_21EBB7B78();
  if (qword_2554776B0 != -1)
    swift_once();
  v0 = (id)qword_255478EA8;
  v1 = (void *)OUTLINED_FUNCTION_5_4();
  v2 = (void *)OUTLINED_FUNCTION_5_4();
  swift_bridgeObjectRelease();
  v3 = objc_msgSend(v0, sel_localizedStringForKey_value_table_, v1, v2, 0);

  sub_21EBB7B60();
  sub_21EB75A44();
  return sub_21EBB7A34();
}

uint64_t sub_21EB744F0()
{
  return sub_21EB7430C();
}

uint64_t sub_21EB74504@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  const void *v2;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  uint64_t v10;
  __int128 v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  BOOL v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t result;
  char v22;
  uint64_t v23;
  __int128 v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;
  __int128 v28;
  uint64_t v29;

  v2 = (const void *)v1;
  v4 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_255477C80);
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)&v24 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = *(_QWORD *)(v1 + 104);
  v7 = *(_QWORD *)(v1 + 112);
  v28 = *(_OWORD *)(v1 + 16);
  v29 = *(_QWORD *)(v1 + 32);
  swift_bridgeObjectRetain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_255477C50);
  sub_21EBB79D4();
  v9 = v24;
  swift_bridgeObjectRelease();
  v10 = HIBYTE(*((_QWORD *)&v9 + 1)) & 0xFLL;
  if ((*((_QWORD *)&v9 + 1) & 0x2000000000000000) == 0)
    v10 = v9 & 0xFFFFFFFFFFFFLL;
  if (!v10)
    goto LABEL_11;
  v28 = *(_OWORD *)(v1 + 40);
  v29 = *(_QWORD *)(v1 + 56);
  sub_21EBB79D4();
  v11 = v24;
  swift_bridgeObjectRelease();
  v12 = HIBYTE(*((_QWORD *)&v11 + 1)) & 0xFLL;
  if ((*((_QWORD *)&v11 + 1) & 0x2000000000000000) == 0)
    v12 = v11 & 0xFFFFFFFFFFFFLL;
  if (!v12)
    goto LABEL_11;
  v28 = *(_OWORD *)(v1 + 64);
  v29 = *(_QWORD *)(v1 + 80);
  v24 = *(_OWORD *)(v1 + 64);
  v25 = *(_QWORD *)(v1 + 80);
  sub_21EBB79D4();
  v14 = v26;
  v13 = v27;
  swift_bridgeObjectRelease();
  v15 = HIBYTE(v13) & 0xF;
  if ((v13 & 0x2000000000000000) == 0)
    v15 = v14 & 0xFFFFFFFFFFFFLL;
  if (v15)
  {
    v24 = v28;
    v25 = v29;
    sub_21EBB79D4();
    sub_21EBB7458();
    swift_bridgeObjectRelease();
    v16 = sub_21EBB7464();
    v17 = __swift_getEnumTagSinglePayload((uint64_t)v6, 1, v16) != 1;
    sub_21EB67980((uint64_t)v6, (uint64_t *)&unk_255477C80);
  }
  else
  {
LABEL_11:
    v17 = 0;
  }
  v18 = swift_allocObject();
  memcpy((void *)(v18 + 16), v2, 0x78uLL);
  v19 = swift_allocObject();
  memcpy((void *)(v19 + 16), v2, 0x78uLL);
  v20 = swift_allocObject();
  memcpy((void *)(v20 + 16), v2, 0x78uLL);
  sub_21EB75EEC((uint64_t)v2);
  LOBYTE(v26) = 0;
  sub_21EB75EEC((uint64_t)v2);
  sub_21EB75EEC((uint64_t)v2);
  result = sub_21EBB79C8();
  v22 = v24;
  v23 = *((_QWORD *)&v24 + 1);
  *(_QWORD *)a1 = v8;
  *(_QWORD *)(a1 + 8) = v7;
  *(_BYTE *)(a1 + 16) = v17;
  *(_BYTE *)(a1 + 17) = 0;
  *(_QWORD *)(a1 + 24) = sub_21EB75E6C;
  *(_QWORD *)(a1 + 32) = v18;
  *(_QWORD *)(a1 + 40) = sub_21EB75E78;
  *(_QWORD *)(a1 + 48) = v19;
  *(_QWORD *)(a1 + 56) = &unk_255478460;
  *(_QWORD *)(a1 + 64) = v20;
  *(_BYTE *)(a1 + 72) = v22;
  *(_QWORD *)(a1 + 80) = v23;
  return result;
}

uint64_t sub_21EB747BC(const void *a1)
{
  char v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  _QWORD v6[8];
  char v7;

  sub_21EB74924(a1, (uint64_t)v6);
  v3 = v6[7];
  v4 = v6[6];
  v2 = v7;
  __swift_instantiateConcreteTypeFromMangledName(&qword_255477C78);
  sub_21EBB79EC();
  __swift_instantiateConcreteTypeFromMangledName(&qword_255478470);
  sub_21EB75F8C();
  sub_21EB75FC8();
  sub_21EB6AAA0();
  sub_21EBB7920();
  swift_release();
  swift_release();
  swift_release();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_21EB76044(v4, v3, v2);
  swift_release();
  return swift_bridgeObjectRelease();
}

uint64_t sub_21EB74924@<X0>(const void *a1@<X0>, uint64_t a2@<X8>)
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  void *v18;
  void *v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  char v26;
  uint64_t v27;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;

  sub_21EBB7B78();
  if (qword_2554776B0 != -1)
    swift_once();
  v4 = (id)qword_255478EA8;
  v5 = (void *)sub_21EBB7B48();
  v6 = (void *)sub_21EBB7B48();
  swift_bridgeObjectRelease();
  v7 = objc_msgSend(v4, sel_localizedStringForKey_value_table_, v5, v6, 0);

  v8 = sub_21EBB7B60();
  v30 = v9;
  v31 = v8;

  v10 = swift_allocObject();
  memcpy((void *)(v10 + 16), a1, 0x78uLL);
  sub_21EB75EEC((uint64_t)a1);
  sub_21EBB7B78();
  v11 = (id)qword_255478EA8;
  v12 = (void *)sub_21EBB7B48();
  v13 = (void *)sub_21EBB7B48();
  swift_bridgeObjectRelease();
  v14 = objc_msgSend(v11, sel_localizedStringForKey_value_table_, v12, v13, 0);

  v29 = sub_21EBB7B60();
  v16 = v15;

  sub_21EBB7B78();
  v17 = (id)qword_255478EA8;
  v18 = (void *)sub_21EBB7B48();
  v19 = (void *)sub_21EBB7B48();
  swift_bridgeObjectRelease();
  v20 = objc_msgSend(v17, sel_localizedStringForKey_value_table_, v18, v19, 0);

  sub_21EBB7B60();
  sub_21EB67308();
  v21 = sub_21EBB7878();
  v23 = v22;
  v25 = v24;
  LOBYTE(v19) = v26 & 1;
  v27 = swift_allocObject();
  memcpy((void *)(v27 + 16), a1, 0x78uLL);
  *(_QWORD *)a2 = v31;
  *(_QWORD *)(a2 + 8) = v30;
  *(_QWORD *)(a2 + 16) = sub_21EB76058;
  *(_QWORD *)(a2 + 24) = v10;
  *(_QWORD *)(a2 + 32) = v29;
  *(_QWORD *)(a2 + 40) = v16;
  *(_QWORD *)(a2 + 48) = v21;
  *(_QWORD *)(a2 + 56) = v23;
  *(_BYTE *)(a2 + 64) = (_BYTE)v19;
  *(_QWORD *)(a2 + 72) = v25;
  *(_QWORD *)(a2 + 80) = sub_21EB760D0;
  *(_QWORD *)(a2 + 88) = v27;
  sub_21EB75EEC((uint64_t)a1);
  swift_bridgeObjectRetain();
  swift_retain();
  swift_bridgeObjectRetain();
  sub_21EB760D8(v21, v23, (char)v19);
  swift_bridgeObjectRetain();
  swift_retain();
  swift_bridgeObjectRelease();
  sub_21EB76044(v21, v23, (char)v19);
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  return swift_bridgeObjectRelease();
}

uint64_t sub_21EB74C78@<X0>(uint64_t a1@<X0>, char *a2@<X8>)
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
  char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  void *v18;
  void *v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t KeyPath;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t *v29;
  char *v30;
  uint64_t v31;
  uint64_t v32;
  id v33;
  void *v34;
  void *v35;
  id v36;
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
  uint64_t *v48;
  uint64_t v49;
  void (*v50)(char *, char *, uint64_t);
  char *v51;
  char *v52;
  uint64_t v53;
  void (*v54)(char *, uint64_t);
  uint64_t v56;
  uint64_t v57;
  unint64_t v58;
  uint64_t v59;
  uint64_t v60;
  char *v61;
  char *v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  char *v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  char *v70;
  char *v71;
  __int128 v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;

  v70 = a2;
  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_255477CC0);
  v67 = *(_QWORD *)(v3 - 8);
  v68 = v3;
  MEMORY[0x24BDAC7A8](v3);
  v66 = (char *)&v56 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v64 = __swift_instantiateConcreteTypeFromMangledName(&qword_255477CC8);
  v5 = MEMORY[0x24BDAC7A8](v64);
  v62 = (char *)&v56 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v5);
  v69 = (uint64_t)&v56 - v7;
  v60 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_255477CD0);
  v8 = *(_QWORD *)(v60 - 8);
  MEMORY[0x24BDAC7A8](v60);
  v10 = (char *)&v56 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_255477F60);
  MEMORY[0x24BDAC7A8](v11);
  v13 = (char *)&v56 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v65 = __swift_instantiateConcreteTypeFromMangledName(&qword_2554784A0);
  v63 = *(_QWORD *)(v65 - 8);
  v14 = MEMORY[0x24BDAC7A8](v65);
  v61 = (char *)&v56 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v14);
  v71 = (char *)&v56 - v16;
  sub_21EBB7B78();
  if (qword_2554776B0 != -1)
    swift_once();
  v17 = (id)qword_255478EA8;
  v18 = (void *)sub_21EBB7B48();
  v19 = (void *)sub_21EBB7B48();
  swift_bridgeObjectRelease();
  v20 = objc_msgSend(v17, sel_localizedStringForKey_value_table_, v18, v19, 0);

  v21 = sub_21EBB7B60();
  v23 = v22;

  v72 = *(_OWORD *)(a1 + 16);
  v73 = *(_QWORD *)(a1 + 32);
  v59 = __swift_instantiateConcreteTypeFromMangledName(&qword_255477C50);
  sub_21EBB79EC();
  v57 = a1;
  v74 = v21;
  v75 = v23;
  v58 = sub_21EB67308();
  sub_21EBB7AD0();
  KeyPath = swift_getKeyPath();
  v25 = sub_21EBB7B60();
  v27 = v26;
  v28 = v60;
  (*(void (**)(char *, char *, uint64_t))(v8 + 16))(v13, v10, v60);
  v29 = (uint64_t *)&v13[*(int *)(v11 + 36)];
  *v29 = KeyPath;
  v29[1] = v25;
  v29[2] = v27;
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v28);
  sub_21EB6AAF8();
  v30 = v61;
  sub_21EBB78FC();
  sub_21EB67980((uint64_t)v13, (uint64_t *)&unk_255477F60);
  v31 = v63;
  v32 = v65;
  (*(void (**)(char *, char *, uint64_t))(v63 + 32))(v71, v30, v65);
  sub_21EBB7B78();
  v33 = (id)qword_255478EA8;
  v34 = (void *)sub_21EBB7B48();
  v35 = (void *)sub_21EBB7B48();
  swift_bridgeObjectRelease();
  v36 = objc_msgSend(v33, sel_localizedStringForKey_value_table_, v34, v35, 0);

  v37 = sub_21EBB7B60();
  v39 = v38;

  v72 = *(_OWORD *)(v57 + 40);
  v73 = *(_QWORD *)(v57 + 56);
  sub_21EBB79EC();
  v74 = v37;
  v75 = v39;
  v40 = v66;
  sub_21EBB7530();
  v41 = swift_getKeyPath();
  v42 = sub_21EBB7B60();
  v44 = v43;
  v46 = v67;
  v45 = v68;
  v47 = (uint64_t)v62;
  (*(void (**)(char *, char *, uint64_t))(v67 + 16))(v62, v40, v68);
  v48 = (uint64_t *)(v47 + *(int *)(v64 + 36));
  *v48 = v41;
  v48[1] = v42;
  v48[2] = v44;
  (*(void (**)(char *, uint64_t))(v46 + 8))(v40, v45);
  v49 = v69;
  sub_21EB760F0(v47, v69, &qword_255477CC8);
  v50 = *(void (**)(char *, char *, uint64_t))(v31 + 16);
  v51 = v71;
  v50(v30, v71, v32);
  sub_21EB76130(v49, v47);
  v52 = v70;
  v50(v70, v30, v32);
  v53 = __swift_instantiateConcreteTypeFromMangledName(&qword_2554784A8);
  sub_21EB76130(v47, (uint64_t)&v52[*(int *)(v53 + 48)]);
  sub_21EB67980(v49, &qword_255477CC8);
  v54 = *(void (**)(char *, uint64_t))(v31 + 8);
  v54(v51, v32);
  sub_21EB67980(v47, &qword_255477CC8);
  return ((uint64_t (*)(char *, uint64_t))v54)(v30, v32);
}

uint64_t sub_21EB75248@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t KeyPath;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v17;
  uint64_t v18;
  __int128 v19;
  uint64_t v20;

  v18 = a2;
  v3 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_255477CD0);
  v17 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v5 = (char *)&v17 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_255478490);
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_21EBB76D4();
  v19 = *(_OWORD *)(a1 + 64);
  v20 = *(_QWORD *)(a1 + 80);
  __swift_instantiateConcreteTypeFromMangledName(&qword_255477C50);
  sub_21EBB79EC();
  sub_21EBB7AC4();
  sub_21EB6AC18(&qword_255477CF8, (uint64_t *)&unk_255477CD0, MEMORY[0x24BDF53E0]);
  sub_21EBB78C0();
  (*(void (**)(char *, uint64_t))(v17 + 8))(v5, v3);
  KeyPath = swift_getKeyPath();
  v11 = sub_21EBB7B60();
  v13 = v12;
  v14 = v18;
  (*(void (**)(uint64_t, char *, uint64_t))(v7 + 16))(v18, v9, v6);
  v15 = (uint64_t *)(v14 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_255478498) + 36));
  *v15 = KeyPath;
  v15[1] = v11;
  v15[2] = v13;
  return (*(uint64_t (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

uint64_t sub_21EB75448()
{
  _QWORD *v0;
  _QWORD *v1;

  v0[2] = sub_21EBB7C20();
  v0[3] = sub_21EBB7C14();
  v1 = (_QWORD *)swift_task_alloc();
  v0[4] = v1;
  *v1 = v0;
  v1[1] = sub_21EB6E3B4;
  return sub_21EB754AC();
}

uint64_t sub_21EB754AC()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;

  v1[38] = v0;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_255477C80);
  v1[39] = swift_task_alloc();
  v2 = sub_21EBB7464();
  v1[40] = v2;
  v1[41] = *(_QWORD *)(v2 - 8);
  v1[42] = swift_task_alloc();
  sub_21EBB7C20();
  v1[43] = sub_21EBB7C14();
  v1[44] = sub_21EBB7BF0();
  v1[45] = v3;
  return swift_task_switch();
}

uint64_t sub_21EB75564()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD *v14;
  id v15;

  v2 = *(_QWORD *)(v0 + 312);
  v1 = *(_QWORD *)(v0 + 320);
  v3 = *(_QWORD *)(v0 + 304);
  v4 = *(_QWORD *)(v3 + 80);
  *(_OWORD *)(v0 + 168) = *(_OWORD *)(v3 + 64);
  *(_QWORD *)(v0 + 184) = v4;
  __swift_instantiateConcreteTypeFromMangledName(&qword_255477C50);
  sub_21EBB79D4();
  sub_21EBB7458();
  OUTLINED_FUNCTION_5_1();
  if (__swift_getEnumTagSinglePayload(v2, 1, v1) == 1)
  {
    v5 = *(_QWORD *)(v0 + 312);
    swift_release();
    sub_21EB67980(v5, (uint64_t *)&unk_255477C80);
    OUTLINED_FUNCTION_2_4();
    OUTLINED_FUNCTION_7_2();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
  else
  {
    v7 = *(_QWORD *)(v0 + 304);
    (*(void (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(v0 + 328) + 32))(*(_QWORD *)(v0 + 336), *(_QWORD *)(v0 + 312), *(_QWORD *)(v0 + 320));
    v15 = (id)objc_opt_self();
    v8 = *(_QWORD *)(v7 + 32);
    *(_OWORD *)(v0 + 120) = *(_OWORD *)(v7 + 16);
    *(_QWORD *)(v0 + 136) = v8;
    sub_21EBB79D4();
    v9 = sub_21EBB7B48();
    *(_QWORD *)(v0 + 368) = v9;
    OUTLINED_FUNCTION_5_1();
    v10 = *(_OWORD *)(v7 + 40);
    *(_QWORD *)(v0 + 160) = *(_QWORD *)(v7 + 56);
    *(_OWORD *)(v0 + 144) = v10;
    sub_21EBB79D4();
    v11 = sub_21EBB7B48();
    *(_QWORD *)(v0 + 376) = v11;
    OUTLINED_FUNCTION_5_1();
    v12 = sub_21EBB7434();
    *(_QWORD *)(v0 + 384) = v12;
    *(_QWORD *)(v0 + 56) = v0 + 280;
    *(_QWORD *)(v0 + 16) = v0;
    *(_QWORD *)(v0 + 24) = sub_21EB75780;
    v13 = swift_continuation_init();
    *(_QWORD *)(v0 + 80) = MEMORY[0x24BDAC760];
    v14 = (_QWORD *)(v0 + 80);
    v14[1] = 0x40000000;
    v14[2] = sub_21EB759B8;
    v14[3] = &block_descriptor_3;
    v14[4] = v13;
    objc_msgSend(v15, sel_loginWithUsername_password_blogURL_completionHandler_, v9, v11, v12, v14);
    return swift_continuation_await();
  }
}

uint64_t sub_21EB75780()
{
  _QWORD *v0;
  _QWORD *v1;
  uint64_t v2;

  OUTLINED_FUNCTION_8_2();
  *v1 = *v0;
  *(_QWORD *)(v2 + 392) = *(_QWORD *)(v2 + 48);
  return swift_task_switch();
}

uint64_t sub_21EB757D4()
{
  uint64_t v0;
  void *v1;
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void (**v7)(void *);
  void *v8;
  void (*v9)(void *);
  id v10;

  v2 = *(void **)(v0 + 376);
  v1 = *(void **)(v0 + 384);
  v3 = *(void **)(v0 + 368);
  v4 = *(_QWORD *)(v0 + 336);
  v5 = *(_QWORD *)(v0 + 320);
  v6 = *(_QWORD *)(v0 + 328);
  v7 = *(void (***)(void *))(v0 + 304);
  swift_release();
  v8 = *(void **)(v0 + 280);

  v9 = *v7;
  v10 = v8;
  v9(v8);

  (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v4, v5);
  OUTLINED_FUNCTION_2_4();
  OUTLINED_FUNCTION_7_2();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_21EB75870()
{
  uint64_t v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;

  v2 = *(void **)(v0 + 384);
  v1 = *(void **)(v0 + 392);
  v4 = *(void **)(v0 + 368);
  v3 = *(void **)(v0 + 376);
  v5 = *(_QWORD *)(v0 + 336);
  v7 = *(_QWORD *)(v0 + 320);
  v6 = *(_QWORD *)(v0 + 328);
  v8 = *(_QWORD *)(v0 + 304);
  swift_release();
  swift_willThrow();
  (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v5, v7);

  v9 = (void *)sub_21EBB741C();
  *(_OWORD *)(v0 + 192) = *(_OWORD *)(v8 + 88);
  sub_21EB760F0(v0 + 200, v0 + 272, &qword_255477C70);
  sub_21EB760F0(v0 + 192, v0 + 288, &qword_255477C40);
  *(_OWORD *)(v0 + 224) = *(_OWORD *)(v0 + 192);
  *(_QWORD *)(v0 + 296) = v9;
  sub_21EB6A930((id *)(v0 + 288));
  sub_21EB67AB8(v0 + 272);
  v10 = v9;
  __swift_instantiateConcreteTypeFromMangledName(&qword_255477C78);
  sub_21EBB79E0();

  sub_21EB6A958((id *)(v0 + 288));
  sub_21EB6A980(v0 + 272);
  OUTLINED_FUNCTION_2_4();
  OUTLINED_FUNCTION_7_2();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_21EB759B8(uint64_t result, void *a2, void *a3)
{
  uint64_t v3;

  v3 = *(_QWORD *)(result + 32);
  if (a3)
    return sub_21EB6ECB0(v3, a3);
  if (a2)
    return sub_21EB6ED40(v3, (uint64_t)a2);
  __break(1u);
  return result;
}

uint64_t sub_21EB75A04@<X0>(uint64_t a1@<X8>)
{
  const void *v1;
  _BYTE __dst[120];

  memcpy(__dst, v1, sizeof(__dst));
  return sub_21EB74504(a1);
}

unint64_t sub_21EB75A44()
{
  unint64_t result;

  result = qword_255478450;
  if (!qword_255478450)
  {
    result = MEMORY[0x2207B8330](&unk_21EBBC734, &type metadata for WordPressLoginView);
    atomic_store(result, &qword_255478450);
  }
  return result;
}

uint64_t destroy for WordPressLoginView(uint64_t a1)
{
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();

  swift_release();
  return swift_bridgeObjectRelease();
}

_QWORD *initializeWithCopy for WordPressLoginView(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  id v10;

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
  v8 = (void *)a2[11];
  a1[10] = a2[10];
  a1[11] = v8;
  v9 = a2[13];
  a1[12] = a2[12];
  a1[13] = v9;
  a1[14] = a2[14];
  swift_retain();
  swift_bridgeObjectRetain();
  swift_retain();
  swift_bridgeObjectRetain();
  swift_retain();
  swift_bridgeObjectRetain();
  swift_retain();
  v10 = v8;
  swift_retain();
  swift_bridgeObjectRetain();
  return a1;
}

_QWORD *assignWithCopy for WordPressLoginView(_QWORD *a1, _QWORD *a2)
{
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  swift_retain();
  swift_release();
  a1[2] = a2[2];
  a1[3] = a2[3];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[4] = a2[4];
  swift_retain();
  swift_release();
  a1[5] = a2[5];
  a1[6] = a2[6];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[7] = a2[7];
  swift_retain();
  swift_release();
  a1[8] = a2[8];
  a1[9] = a2[9];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[10] = a2[10];
  swift_retain();
  swift_release();
  v5 = (void *)a1[11];
  v6 = (void *)a2[11];
  a1[11] = v6;
  v7 = v6;

  a1[12] = a2[12];
  swift_retain();
  swift_release();
  a1[13] = a2[13];
  a1[14] = a2[14];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

void *__swift_memcpy120_8(void *a1, const void *a2)
{
  return memcpy(a1, a2, 0x78uLL);
}

uint64_t assignWithTake for WordPressLoginView(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  *(_OWORD *)a1 = *(_OWORD *)a2;
  swift_release();
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  swift_release();
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 48) = *(_OWORD *)(a2 + 48);
  swift_release();
  *(_QWORD *)(a1 + 64) = *(_QWORD *)(a2 + 64);
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 72) = *(_OWORD *)(a2 + 72);
  swift_release();

  *(_OWORD *)(a1 + 88) = *(_OWORD *)(a2 + 88);
  swift_release();
  v4 = *(_QWORD *)(a2 + 112);
  *(_QWORD *)(a1 + 104) = *(_QWORD *)(a2 + 104);
  *(_QWORD *)(a1 + 112) = v4;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for WordPressLoginView(uint64_t *a1, int a2)
{
  uint64_t v2;

  if (a2)
  {
    if (a2 < 0 && *((_BYTE *)a1 + 120))
    {
      LODWORD(v2) = *(_DWORD *)a1 + 0x7FFFFFFF;
    }
    else
    {
      v2 = *a1;
      if ((unint64_t)*a1 >= 0xFFFFFFFF)
        LODWORD(v2) = -1;
    }
  }
  else
  {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for WordPressLoginView(uint64_t result, int a2, int a3)
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
      *(_QWORD *)result = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 120) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for WordPressLoginView()
{
  return &type metadata for WordPressLoginView;
}

uint64_t sub_21EB75E58()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_21EB75E6C()
{
  uint64_t v0;

  return sub_21EB747BC((const void *)(v0 + 16));
}

uint64_t sub_21EB75E78()
{
  uint64_t v0;

  return (*(uint64_t (**)(_QWORD))(v0 + 16))(0);
}

uint64_t sub_21EB75EA0()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 16) = v1;
  *v1 = v0;
  v1[1] = sub_21EB6F374;
  return sub_21EB75448();
}

uint64_t sub_21EB75EEC(uint64_t a1)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 88);
  swift_retain();
  swift_bridgeObjectRetain();
  swift_retain();
  swift_bridgeObjectRetain();
  swift_retain();
  swift_bridgeObjectRetain();
  swift_retain();
  swift_bridgeObjectRetain();
  swift_retain();
  v3 = v2;
  return a1;
}

unint64_t sub_21EB75F8C()
{
  unint64_t result;

  result = qword_255477EF0;
  if (!qword_255477EF0)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_255477EF0);
  }
  return result;
}

unint64_t sub_21EB75FC8()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  result = qword_255478478;
  if (!qword_255478478)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_255478470);
    sub_21EB6AC18(&qword_255478480, &qword_255478488, MEMORY[0x24BDF5428]);
    v3 = v2;
    result = MEMORY[0x2207B8330](MEMORY[0x24BDF3F50], v1, &v3);
    atomic_store(result, (unint64_t *)&qword_255478478);
  }
  return result;
}

uint64_t sub_21EB76044(uint64_t a1, uint64_t a2, char a3)
{
  if ((a3 & 1) != 0)
    return swift_release();
  else
    return swift_bridgeObjectRelease();
}

uint64_t sub_21EB76058@<X0>(char *a1@<X8>)
{
  uint64_t v1;

  return sub_21EB74C78(v1 + 16, a1);
}

uint64_t objectdestroyTm()
{
  uint64_t v0;

  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();

  swift_release();
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_21EB760D0@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_21EB75248(v1 + 16, a1);
}

uint64_t sub_21EB760D8(uint64_t a1, uint64_t a2, char a3)
{
  if ((a3 & 1) != 0)
    return swift_retain();
  else
    return swift_bridgeObjectRetain();
}

void sub_21EB760F0(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 32))(a2, a1, v5);
  OUTLINED_FUNCTION_5();
}

uint64_t sub_21EB76130(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_255477CC8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

void sub_21EB76178()
{
  sub_21EB6AC18(&qword_2554784B0, &qword_2554784B8, (uint64_t)&unk_21EBBBF8C);
}

uint64_t OUTLINED_FUNCTION_0_4()
{
  return sub_21EBB79C8();
}

uint64_t OUTLINED_FUNCTION_2_4()
{
  return swift_task_dealloc();
}

uint64_t OUTLINED_FUNCTION_5_4()
{
  return sub_21EBB7B48();
}

uint64_t OUTLINED_FUNCTION_7_2()
{
  return swift_task_dealloc();
}

uint64_t sub_21EB761D4@<X0>(uint64_t **a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  char v26;
  uint64_t v28;

  v2 = a1[1];
  v4 = **a1;
  v3 = (*a1)[1];
  v5 = (*a1)[2];
  v6 = (*a1)[3];
  v7 = *((_BYTE *)*a1 + 32);
  v8 = *v2;
  v9 = v2[1];
  v10 = v2[2];
  v11 = v2[3];
  LOBYTE(v2) = *((_BYTE *)v2 + 32);
  v12 = a1[2];
  v13 = a1[3];
  v14 = *v12;
  v15 = v12[1];
  v16 = v12[2];
  v17 = v12[3];
  LOBYTE(v12) = *((_BYTE *)v12 + 32);
  v19 = *v13;
  v18 = v13[1];
  v21 = v13[2];
  v20 = v13[3];
  v22 = a1[4];
  v23 = *v22;
  v25 = v22[2];
  v24 = v22[1];
  v28 = v22[3];
  LOBYTE(v22) = *((_BYTE *)v22 + 32);
  v26 = *((_BYTE *)v13 + 32);
  *(_QWORD *)a2 = v4;
  *(_QWORD *)(a2 + 8) = v3;
  *(_QWORD *)(a2 + 16) = v5;
  *(_QWORD *)(a2 + 24) = v6;
  *(_BYTE *)(a2 + 32) = v7;
  *(_QWORD *)(a2 + 40) = v8;
  *(_QWORD *)(a2 + 48) = v9;
  *(_QWORD *)(a2 + 56) = v10;
  *(_QWORD *)(a2 + 64) = v11;
  *(_BYTE *)(a2 + 72) = (_BYTE)v2;
  *(_QWORD *)(a2 + 80) = v14;
  *(_QWORD *)(a2 + 88) = v15;
  *(_QWORD *)(a2 + 96) = v16;
  *(_QWORD *)(a2 + 104) = v17;
  *(_BYTE *)(a2 + 112) = (_BYTE)v12;
  *(_QWORD *)(a2 + 120) = v19;
  *(_QWORD *)(a2 + 128) = v18;
  *(_QWORD *)(a2 + 136) = v21;
  *(_QWORD *)(a2 + 144) = v20;
  *(_BYTE *)(a2 + 152) = v26;
  *(_QWORD *)(a2 + 160) = v23;
  *(_QWORD *)(a2 + 168) = v24;
  *(_QWORD *)(a2 + 176) = v25;
  *(_QWORD *)(a2 + 184) = v28;
  *(_BYTE *)(a2 + 192) = (_BYTE)v22;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_21EB7DBA8(v19, v18);
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRetain();
}

void sub_21EB762F0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;
  _QWORD *v8;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_255478630);
  MEMORY[0x24BDAC7A8](v5);
  OUTLINED_FUNCTION_8_4();
  v6 = sub_21EBB7C38();
  __swift_storeEnumTagSinglePayload(v2, 1, 1, v6);
  v7 = (_QWORD *)OUTLINED_FUNCTION_2_0();
  v7[2] = 0;
  v7[3] = 0;
  v7[4] = a1;
  v7[5] = a2;
  v8 = (_QWORD *)OUTLINED_FUNCTION_2_0();
  v8[2] = 0;
  v8[3] = 0;
  v8[4] = &unk_255478640;
  v8[5] = v7;
  sub_21EB7CA88(v2, (uint64_t)&unk_255478650, (uint64_t)v8);
  swift_release();
  OUTLINED_FUNCTION_11_1();
}

uint64_t WFSSHKeyParameter.view(with:)()
{
  void *v0;
  uint64_t v1;
  id v2;

  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_2554784C0);
  MEMORY[0x24BDAC7A8](v1);
  v2 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2554784C8);
  sub_21EB72A50(&qword_2554784D0, &qword_2554784C8);
  sub_21EBB74E8();
  sub_21EB72A50(&qword_2554784D8, &qword_2554784C0);
  return sub_21EBB7A34();
}

uint64_t sub_21EB764C4(void *a1)
{
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  id v6;
  uint64_t v8;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2554786A0);
  MEMORY[0x24BDAC7A8](v2);
  v4 = (char *)&v8 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2554786A8);
  __swift_storeEnumTagSinglePayload((uint64_t)v4, 1, 1, v5);
  sub_21EB6AA68(0, &qword_255478678);
  v6 = a1;
  swift_retain();
  return sub_21EBB74F4();
}

uint64_t sub_21EB76598()
{
  uint64_t v0;

  return sub_21EB764C4(*(void **)(v0 + 16));
}

uint64_t WFSSHKeyParameter.moduleSummarySlots(for:)(uint64_t a1)
{
  void *v1;
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  id v14;
  id v15;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v23;

  OUTLINED_FUNCTION_15(a1, &qword_2554784E0);
  v2 = objc_msgSend(v1, sel_localizedLabel);
  v3 = sub_21EBB7B60();
  v5 = v4;

  sub_21EBB7B78();
  if (qword_2554776B0 != -1)
    swift_once();
  v6 = (id)qword_255478EA8;
  v7 = (void *)OUTLINED_FUNCTION_16();
  v8 = (void *)OUTLINED_FUNCTION_16();
  swift_bridgeObjectRelease();
  v9 = objc_msgSend(v6, sel_localizedStringForKey_value_table_, v7, v8, 0);

  v10 = sub_21EBB7B60();
  v12 = v11;

  v13 = (void *)sub_21EBB7B48();
  v14 = sub_21EB7679C(v3, v5, v10, v12, v13);
  v15 = objc_msgSend((id)objc_opt_self(), sel_sharedKeyPair);
  if (v15)
  {
    v16 = v15;
    v17 = objc_msgSend(v15, sel_localizedDescription);
    v18 = sub_21EBB7B60();
    v20 = v19;

    sub_21EB7CD38(0, v18, v20, v14);
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_2554784E8);
  v21 = OUTLINED_FUNCTION_2_0();
  *(_OWORD *)(v21 + 16) = xmmword_21EBBC7C0;
  *(_QWORD *)(v21 + 32) = v14;
  v23 = v21;
  sub_21EBB7BE4();
  return v23;
}

id sub_21EB7679C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  void *v7;
  void *v8;
  id v9;

  if (!a2)
  {
    v7 = 0;
    if (a4)
      goto LABEL_3;
LABEL_5:
    v8 = 0;
    goto LABEL_6;
  }
  v7 = (void *)sub_21EBB7B48();
  swift_bridgeObjectRelease();
  if (!a4)
    goto LABEL_5;
LABEL_3:
  v8 = (void *)sub_21EBB7B48();
  swift_bridgeObjectRelease();
LABEL_6:
  v9 = objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_slotWithLocalizedName_localizedPlaceholder_key_, v7, v8, a5);

  return v9;
}

id sub_21EB76854(void *a1)
{
  id v1;
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v1 = a1;
  v2 = swift_unknownObjectRetain();
  v3 = WFSSHKeyParameter.moduleSummarySlots(for:)(v2);
  swift_unknownObjectRelease();

  if (v3)
  {
    sub_21EB6AA68(0, &qword_2554784E0);
    v4 = (void *)sub_21EBB7BCC();
    swift_bridgeObjectRelease();
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

uint64_t sub_21EB768E0()
{
  static WFSSHKeyParameter.moduleSummaryEditorClass()();
  return swift_getObjCClassFromMetadata();
}

void sub_21EB768F4(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  v2 = *(void **)(v1 + OBJC_IVAR____TtC11ActionKitUI28SSHKeyParameterSummaryEditor_modal);
  *(_QWORD *)(v1 + OBJC_IVAR____TtC11ActionKitUI28SSHKeyParameterSummaryEditor_modal) = a1;

}

void sub_21EB76908()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _BYTE *v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;
  _BYTE v14[16];
  void *v15;

  v2 = sub_21EBB74A0();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = &v14[-((v4 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v6 = sub_21EBB74AC();
  MEMORY[0x24BDAC7A8](v6);
  OUTLINED_FUNCTION_8_4();
  v15 = v0;
  (*(void (**)(uint64_t, _QWORD))(v7 + 104))(v1, *MEMORY[0x24BEC2CE8]);
  (*(void (**)(_BYTE *, _QWORD, uint64_t))(v3 + 104))(v5, *MEMORY[0x24BEC2CD8], v2);
  objc_allocWithZone((Class)sub_21EBB74D0());
  v8 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_255478670);
  v9 = type metadata accessor for SSHKeyParameterSummaryEditor();
  v10 = OUTLINED_FUNCTION_15(v9, &qword_255478678);
  OUTLINED_FUNCTION_15(v10, &qword_255478680);
  sub_21EB72A50(&qword_255478688, &qword_255478670);
  v11 = sub_21EBB74DC();
  sub_21EB768F4(v11);
  v12 = *(void **)&v8[OBJC_IVAR____TtC11ActionKitUI28SSHKeyParameterSummaryEditor_modal];
  if (v12)
  {
    v13 = v12;
    sub_21EBB74C4();

  }
}

uint64_t sub_21EB76AC8()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_255478690);
  type metadata accessor for SSHKeyConfigurationView();
  sub_21EB65BBC(&qword_255478698, (void (*)(uint64_t))type metadata accessor for SSHKeyConfigurationView);
  swift_getOpaqueTypeConformance2();
  return sub_21EBB759C();
}

uint64_t sub_21EB76B64()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v8;

  v0 = sub_21EBB76BC();
  v1 = *(_QWORD *)(v0 - 8);
  MEMORY[0x24BDAC7A8](v0);
  v3 = (char *)&v8 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = type metadata accessor for SSHKeyConfigurationView();
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)&v8 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_21EB77010((uint64_t)v6);
  (*(void (**)(char *, _QWORD, uint64_t))(v1 + 104))(v3, *MEMORY[0x24BDEE5F0], v0);
  sub_21EB65BBC(&qword_255478698, (void (*)(uint64_t))type metadata accessor for SSHKeyConfigurationView);
  sub_21EBB7908();
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  return sub_21EB7D09C((uint64_t)v6);
}

uint64_t sub_21EB76CD8()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;

  v1[17] = v0;
  sub_21EBB7C20();
  v1[18] = sub_21EBB7C14();
  v1[19] = sub_21EBB7BF0();
  v1[20] = v2;
  return swift_task_switch();
}

uint64_t sub_21EB76D44()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v1 = *(_QWORD *)(v0 + 136);
  *(_QWORD *)(v0 + 16) = v0;
  *(_QWORD *)(v0 + 24) = sub_21EB76DE4;
  *(_QWORD *)(v0 + 112) = swift_continuation_init();
  *(_QWORD *)(v0 + 80) = MEMORY[0x24BDAC760];
  *(_QWORD *)(v0 + 88) = 0x40000000;
  *(_QWORD *)(v0 + 96) = sub_21EB76E70;
  *(_QWORD *)(v0 + 104) = &block_descriptor_4;
  v2 = type metadata accessor for SSHKeyParameterSummaryEditor();
  *(_QWORD *)(v0 + 120) = v1;
  *(_QWORD *)(v0 + 128) = v2;
  objc_msgSendSuper2((objc_super *)(v0 + 120), sel_cancelEditingWithCompletionHandler_, v0 + 80);
  return swift_continuation_await();
}

uint64_t sub_21EB76DE4()
{
  return swift_task_switch();
}

uint64_t sub_21EB76E28()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  id v3;

  v1 = *(_QWORD *)(v0 + 136);
  swift_release();
  v2 = *(void **)(v1 + OBJC_IVAR____TtC11ActionKitUI28SSHKeyParameterSummaryEditor_modal);
  if (v2)
  {
    v3 = v2;
    sub_21EBB74B8();

  }
  return OUTLINED_FUNCTION_4(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_21EB76E70(uint64_t a1)
{
  return j__swift_continuation_resume(*(_QWORD *)(a1 + 32));
}

uint64_t sub_21EB76ED8(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;

  v2[2] = a1;
  v2[3] = a2;
  sub_21EBB7C20();
  v2[4] = sub_21EBB7C14();
  sub_21EBB7BF0();
  return swift_task_switch();
}

uint64_t sub_21EB76F44()
{
  _QWORD *v0;
  void *v1;
  const void *v2;
  id v3;
  _QWORD *v4;

  v1 = (void *)v0[3];
  v2 = (const void *)v0[2];
  swift_release();
  v0[5] = _Block_copy(v2);
  v3 = v1;
  v4 = (_QWORD *)swift_task_alloc();
  v0[6] = v4;
  *v4 = v0;
  v4[1] = sub_21EB76FAC;
  return sub_21EB76CD8();
}

uint64_t sub_21EB76FAC()
{
  uint64_t *v0;
  void (**v1)(_QWORD);
  void *v2;
  uint64_t v4;

  v1 = *(void (***)(_QWORD))(*v0 + 40);
  v2 = *(void **)(*v0 + 24);
  v4 = *v0;
  swift_task_dealloc();

  v1[2](v1);
  _Block_release(v1);
  return (*(uint64_t (**)(void))(v4 + 8))();
}

uint64_t sub_21EB77010@<X0>(uint64_t a1@<X8>)
{
  void *v1;
  id v3;
  uint64_t v4;
  id v5;

  v3 = objc_msgSend((id)objc_opt_self(), sel_sharedKeyPair);
  v4 = OUTLINED_FUNCTION_2_0();
  *(_QWORD *)(v4 + 16) = v1;
  v5 = v1;
  return sub_21EB770C8((uint64_t)sub_21EB7CDE4, v4, a1);
}

void sub_21EB77088(void *a1)
{
  id v1;

  v1 = objc_msgSend(a1, sel_parameter);
  objc_msgSend(v1, sel_attributesDidChange);

}

uint64_t sub_21EB770C8@<X0>(uint64_t a1@<X1>, uint64_t a2@<X2>, uint64_t a3@<X8>)
{
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t result;
  __int128 v10;

  __swift_instantiateConcreteTypeFromMangledName(&qword_255478610);
  sub_21EBB79C8();
  *(_OWORD *)a3 = v10;
  *(_QWORD *)(a3 + 16) = a1;
  *(_QWORD *)(a3 + 24) = a2;
  v6 = type metadata accessor for SSHKeyConfigurationView();
  v7 = (uint64_t *)(a3 + *(int *)(v6 + 24));
  *v7 = swift_getKeyPath();
  __swift_instantiateConcreteTypeFromMangledName(&qword_255478618);
  swift_storeEnumTagMultiPayload();
  v8 = a3 + *(int *)(v6 + 28);
  result = sub_21EBB79C8();
  *(_BYTE *)v8 = v10;
  *(_QWORD *)(v8 + 8) = *((_QWORD *)&v10 + 1);
  return result;
}

void sub_21EB77198(void *a1, uint64_t a2, char a3)
{
  char *v3;
  objc_super v7;

  *(_QWORD *)&v3[OBJC_IVAR____TtC11ActionKitUI28SSHKeyParameterSummaryEditor_modal] = 0;
  v7.receiver = v3;
  v7.super_class = (Class)type metadata accessor for SSHKeyParameterSummaryEditor();
  objc_msgSendSuper2(&v7, sel_initWithParameter_arrayIndex_processing_, a1, a2, a3 & 1);

  OUTLINED_FUNCTION_5_5();
}

id sub_21EB77244()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for SSHKeyParameterSummaryEditor();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_21EB77284@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
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
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t OpaqueTypeConformance2;
  uint64_t v19;
  char v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void (*v29)(uint64_t);
  uint64_t v30;
  uint64_t v31;
  char *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  char *v36;
  uint64_t v37;
  id v38;
  void *v39;
  void *v40;
  id v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  char *v47;
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
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;

  v2 = v1;
  v56 = a1;
  v48 = type metadata accessor for SSHKeyConfigurationView();
  v50 = *(_QWORD *)(v48 - 8);
  v3 = *(_QWORD *)(v50 + 64);
  MEMORY[0x24BDAC7A8](v48);
  v49 = (uint64_t)&v47 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_255478758);
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v47 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_255478760);
  v9 = *(_QWORD *)(v8 - 8);
  v52 = v8;
  v53 = v9;
  MEMORY[0x24BDAC7A8](v8);
  v47 = (char *)&v47 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_255478768);
  v54 = *(_QWORD *)(v11 - 8);
  v55 = v11;
  MEMORY[0x24BDAC7A8](v11);
  v51 = (char *)&v47 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v58 = v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_255478770);
  sub_21EB72A50(&qword_255478778, &qword_255478770);
  sub_21EBB783C();
  v57 = v2;
  v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_255478780);
  sub_21EB72A50(&qword_255478788, &qword_255478758);
  v15 = v14;
  v16 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_255478790);
  sub_21EB72A50(&qword_255478798, &qword_255478790);
  v59 = v16;
  v60 = v17;
  OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
  sub_21EBB7938();
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  v19 = v2 + *(int *)(v48 + 28);
  v20 = *(_BYTE *)v19;
  v21 = *(_QWORD *)(v19 + 8);
  LOBYTE(v63) = v20;
  v64 = v21;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2554787A0);
  sub_21EBB79EC();
  LODWORD(v48) = v61;
  v22 = v49;
  sub_21EB7D8B8(v2, v49);
  v23 = (*(unsigned __int8 *)(v50 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v50 + 80);
  v24 = swift_allocObject();
  sub_21EB7D900(v22, v24 + v23);
  v25 = __swift_instantiateConcreteTypeFromMangledName(&qword_2554787A8);
  v59 = v4;
  v60 = v13;
  v61 = v15;
  v62 = OpaqueTypeConformance2;
  v26 = swift_getOpaqueTypeConformance2();
  v27 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2554787B0);
  v28 = sub_21EBB7818();
  v29 = (void (*)(uint64_t))MEMORY[0x24BDF0620];
  sub_21EB72A50(&qword_2554787B8, &qword_2554787B0);
  v31 = v30;
  sub_21EB65BBC(&qword_255477960, v29);
  v59 = v27;
  v60 = v28;
  v32 = v51;
  v61 = v31;
  v62 = v33;
  v34 = swift_getOpaqueTypeConformance2();
  v35 = v52;
  v36 = v47;
  sub_21EBB792C();
  swift_release();
  v37 = v35;
  swift_release();
  swift_release();
  (*(void (**)(char *, uint64_t))(v53 + 8))(v36, v35);
  sub_21EBB7B78();
  if (qword_2554776B0 != -1)
    swift_once();
  v38 = (id)qword_255478EA8;
  v39 = (void *)sub_21EBB7B48();
  v40 = (void *)sub_21EBB7B48();
  swift_bridgeObjectRelease();
  v41 = objc_msgSend(v38, sel_localizedStringForKey_value_table_, v39, v40, 0);

  v42 = sub_21EBB7B60();
  v44 = v43;

  v63 = v42;
  v64 = v44;
  v59 = v37;
  v60 = v25;
  v61 = v26;
  v62 = v34;
  swift_getOpaqueTypeConformance2();
  sub_21EB67308();
  v45 = v55;
  sub_21EBB78E4();
  swift_bridgeObjectRelease();
  return (*(uint64_t (**)(char *, uint64_t))(v54 + 8))(v32, v45);
}

void sub_21EB777AC(uint64_t a1@<X8>)
{
  _OWORD *v1;
  _OWORD *v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void (*v22)(char *, char *, uint64_t);
  uint64_t v23;
  void (*v24)(char *, uint64_t);
  uint64_t v25;
  uint64_t v26;
  __int128 v27;
  void *v28;

  v2 = v1;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_255478840);
  v26 = *(_QWORD *)(v4 - 8);
  v5 = MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v25 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v5);
  v9 = (char *)&v25 - v8;
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_255478848);
  v11 = MEMORY[0x24BDAC7A8](v10);
  v13 = (char *)&v25 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v11);
  v15 = (char *)&v25 - v14;
  v27 = *v1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_255478838);
  v16 = sub_21EBB79D4();
  v17 = v28;
  if (v28)
  {
    v25 = (uint64_t)&v25;
    MEMORY[0x24BDAC7A8](v16);
    *(&v25 - 2) = (uint64_t)v17;
    __swift_instantiateConcreteTypeFromMangledName(&qword_255478870);
    sub_21EB72A50(&qword_255478878, &qword_255478870);
    sub_21EBB7A88();

    v18 = 0;
  }
  else
  {
    v18 = 1;
  }
  v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_255478850);
  v20 = __swift_storeEnumTagSinglePayload((uint64_t)v15, v18, 1, v19);
  MEMORY[0x24BDAC7A8](v20);
  *(&v25 - 2) = (uint64_t)v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_255478858);
  sub_21EB72A50(&qword_255478860, &qword_255478858);
  sub_21EBB7A88();
  sub_21EB7ECD0((uint64_t)v15, (uint64_t)v13, &qword_255478848);
  v21 = v26;
  v22 = *(void (**)(char *, char *, uint64_t))(v26 + 16);
  v22(v7, v9, v4);
  sub_21EB7ECD0((uint64_t)v13, a1, &qword_255478848);
  v23 = __swift_instantiateConcreteTypeFromMangledName(&qword_255478868);
  v22((char *)(a1 + *(int *)(v23 + 48)), v7, v4);
  v24 = *(void (**)(char *, uint64_t))(v21 + 8);
  v24(v9, v4);
  sub_21EB67980((uint64_t)v15, &qword_255478848);
  v24(v7, v4);
  sub_21EB67980((uint64_t)v13, &qword_255478848);
}

uint64_t sub_21EB77A80(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _BYTE *v6;
  uint64_t v7;
  _BYTE v9[16];
  uint64_t v10;

  v2 = sub_21EBB77C4();
  MEMORY[0x24BDAC7A8](v2);
  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_255478790);
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v6 = &v9[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  sub_21EBB77B8();
  v10 = a1;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_255477990);
  sub_21EB72A50(&qword_255478DC0, (uint64_t *)&unk_255477990);
  sub_21EBB7548();
  sub_21EB72A50(&qword_255478798, &qword_255478790);
  MEMORY[0x2207B743C](v6, v3, v7);
  return (*(uint64_t (**)(_BYTE *, uint64_t))(v4 + 8))(v6, v3);
}

uint64_t sub_21EB77BC8(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  _QWORD v15[2];

  v2 = type metadata accessor for SSHKeyConfigurationView();
  v3 = *(_QWORD *)(v2 - 8);
  v4 = *(_QWORD *)(v3 + 64);
  MEMORY[0x24BDAC7A8](v2);
  sub_21EBB7B78();
  if (qword_2554776B0 != -1)
    swift_once();
  v5 = (id)qword_255478EA8;
  v6 = (void *)sub_21EBB7B48();
  v7 = (void *)sub_21EBB7B48();
  swift_bridgeObjectRelease();
  v8 = objc_msgSend(v5, sel_localizedStringForKey_value_table_, v6, v7, 0);

  v9 = sub_21EBB7B60();
  v11 = v10;

  v15[0] = v9;
  v15[1] = v11;
  sub_21EB7D8B8(a1, (uint64_t)v15 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0));
  v12 = (*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  v13 = swift_allocObject();
  sub_21EB7D900((uint64_t)v15 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0), v13 + v12);
  sub_21EB67308();
  return sub_21EBB7A10();
}

uint64_t sub_21EB77D6C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v5;

  v0 = sub_21EBB756C();
  v1 = *(_QWORD *)(v0 - 8);
  MEMORY[0x24BDAC7A8](v0);
  v3 = (char *)&v5 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for SSHKeyConfigurationView();
  sub_21EB81AA8();
  sub_21EBB7560();
  return (*(uint64_t (**)(char *, uint64_t))(v1 + 8))(v3, v0);
}

uint64_t sub_21EB77E04(uint64_t a1)
{
  uint64_t v2;
  void (*v3)(uint64_t);
  uint64_t v4;
  uint64_t v5;
  _BYTE *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _BYTE *v10;
  _BYTE v12[16];
  uint64_t v13;

  v2 = sub_21EBB7818();
  v3 = (void (*)(uint64_t))MEMORY[0x24BDF0620];
  v4 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v6 = &v12[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_2554787B0);
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7);
  v10 = &v12[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v13 = a1;
  sub_21EB7D974();
  sub_21EBB759C();
  sub_21EBB780C();
  sub_21EB72A50(&qword_2554787B8, &qword_2554787B0);
  sub_21EB65BBC(&qword_255477960, v3);
  sub_21EBB7884();
  (*(void (**)(_BYTE *, uint64_t))(v4 + 8))(v6, v2);
  return (*(uint64_t (**)(_BYTE *, uint64_t))(v8 + 8))(v10, v7);
}

void *sub_21EB77F70@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  void *v8;
  _BYTE __src[136];

  v4 = type metadata accessor for SSHKeyConfigurationView();
  v5 = *(_QWORD *)(v4 - 8);
  v6 = *(_QWORD *)(v5 + 64);
  MEMORY[0x24BDAC7A8](v4);
  sub_21EB7D8B8(a1, (uint64_t)&__src[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0) - 8]);
  v7 = (*(unsigned __int8 *)(v5 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  v8 = (void *)swift_allocObject();
  sub_21EB7D900((uint64_t)&__src[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0) - 8], (uint64_t)v8 + v7);
  sub_21EB78CE0(sub_21EB7D9B4, v8, __src);
  return memcpy(a2, __src, 0x88uLL);
}

uint64_t sub_21EB7803C@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  id v22;
  void *v23;
  void *v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  id v29;
  uint64_t v30;
  uint64_t v31;
  id v32;
  void *v33;
  uint64_t *v34;
  id v35;
  void *v36;
  void *v37;
  id v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  id v44;
  void *v45;
  void *v46;
  id v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  id v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
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
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  _QWORD v69[4];
  char v70;
  uint64_t v71;
  uint64_t v72;
  void *v73;
  uint64_t v74;
  char v75;
  _QWORD v76[4];
  char v77;
  _QWORD v78[4];
  char v79;
  _QWORD v80[4];
  char v81;
  uint64_t *v82[6];

  sub_21EBB7B78();
  if (qword_2554776B0 != -1)
    swift_once();
  v4 = (id)qword_255478EA8;
  v5 = (void *)sub_21EBB7B48();
  v6 = (void *)sub_21EBB7B48();
  swift_bridgeObjectRelease();
  v7 = objc_msgSend(v4, sel_localizedStringForKey_value_table_, v5, v6, 0);

  v8 = sub_21EBB7B60();
  v66 = v9;

  v10 = objc_msgSend(a1, sel_localizedType);
  v11 = sub_21EBB7B60();
  v64 = v12;
  v65 = v11;

  sub_21EBB7B78();
  v13 = (id)qword_255478EA8;
  v14 = (void *)sub_21EBB7B48();
  v15 = (void *)sub_21EBB7B48();
  swift_bridgeObjectRelease();
  v16 = objc_msgSend(v13, sel_localizedStringForKey_value_table_, v14, v15, 0);

  v17 = sub_21EBB7B60();
  v62 = v18;
  v63 = v17;

  v19 = objc_msgSend(a1, sel_publicKeyFingerprintWithType_, 0);
  v20 = sub_21EBB7B60();
  v60 = v21;
  v61 = v20;

  sub_21EBB7B78();
  v22 = (id)qword_255478EA8;
  v23 = (void *)sub_21EBB7B48();
  v24 = (void *)sub_21EBB7B48();
  swift_bridgeObjectRelease();
  v25 = objc_msgSend(v22, sel_localizedStringForKey_value_table_, v23, v24, 0);

  v26 = sub_21EBB7B60();
  v28 = v27;

  v29 = objc_msgSend(a1, sel_publicKeyFingerprintWithType_, 1);
  v30 = sub_21EBB7B60();
  v56 = v31;
  v57 = v30;

  v32 = objc_msgSend(a1, sel_keySize);
  v33 = v32;
  v67 = v8;
  v68 = a2;
  v58 = v28;
  v59 = v26;
  if (!v32)
  {
    v39 = 0;
    v41 = 0;
LABEL_8:
    v43 = 0;
    goto LABEL_9;
  }
  v34 = (uint64_t *)objc_msgSend(v32, sel_integerValue);

  if ((uint64_t)v34 < 1)
  {
    v39 = 0;
    v41 = 0;
    v33 = 0;
    goto LABEL_8;
  }
  sub_21EBB7B78();
  v35 = (id)qword_255478EA8;
  v36 = (void *)sub_21EBB7B48();
  v37 = (void *)sub_21EBB7B48();
  swift_bridgeObjectRelease();
  v38 = objc_msgSend(v35, sel_localizedStringForKey_value_table_, v36, v37, 0);

  v39 = sub_21EBB7B60();
  v41 = v40;

  v82[0] = v34;
  v33 = (void *)sub_21EBB7D70();
  v43 = v42;
LABEL_9:
  sub_21EBB7B78();
  v44 = (id)qword_255478EA8;
  v45 = (void *)sub_21EBB7B48();
  v46 = (void *)sub_21EBB7B48();
  swift_bridgeObjectRelease();
  v47 = objc_msgSend(v44, sel_localizedStringForKey_value_table_, v45, v46, 0);

  v48 = sub_21EBB7B60();
  v50 = v49;

  v51 = objc_msgSend(a1, sel_comment);
  v52 = sub_21EBB7B60();
  v54 = v53;

  v80[0] = v67;
  v80[1] = v66;
  v80[2] = v65;
  v80[3] = v64;
  v81 = 0;
  v78[0] = v63;
  v78[1] = v62;
  v78[2] = v61;
  v78[3] = v60;
  v79 = 1;
  v82[0] = v80;
  v82[1] = v78;
  v76[0] = v59;
  v76[1] = v58;
  v76[2] = v57;
  v76[3] = v56;
  v77 = 1;
  v71 = v39;
  v72 = v41;
  v73 = v33;
  v74 = v43;
  v75 = 0;
  v82[2] = v76;
  v82[3] = &v71;
  v69[0] = v48;
  v69[1] = v50;
  v69[2] = v52;
  v69[3] = v54;
  v70 = 0;
  v82[4] = v69;
  sub_21EB761D4(v82, v68);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_21EB7DB78(v71, v72);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

void sub_21EB785B0(uint64_t a1@<X8>)
{
  _OWORD *v1;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  char *v18;
  void *v19;
  uint64_t v20;
  unint64_t v21;
  uint64_t v22;
  void (*v23)(char *, char *, uint64_t);
  uint64_t v24;
  void (*v25)(char *, uint64_t);
  id v26;
  uint64_t v27;
  uint64_t v28;
  _OWORD *v29;
  __int128 v30;
  void *v31;

  v3 = type metadata accessor for SSHKeyConfigurationView();
  v27 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v28 = v4;
  v5 = (char *)&v26 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_255478880);
  v7 = *(_QWORD *)(v6 - 8);
  v8 = MEMORY[0x24BDAC7A8](v6);
  v10 = (char *)&v26 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v8);
  v12 = (char *)&v26 - v11;
  v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_255478888);
  v14 = MEMORY[0x24BDAC7A8](v13);
  v16 = (char *)&v26 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v14);
  v18 = (char *)&v26 - v17;
  v29 = v1;
  v30 = *v1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_255478838);
  sub_21EBB79D4();
  v19 = v31;
  if (v31)
  {
    *(_QWORD *)(swift_allocObject() + 16) = v19;
    v26 = v19;
    __swift_instantiateConcreteTypeFromMangledName(&qword_255478890);
    sub_21EB72A50(&qword_255478898, &qword_255478890);
    sub_21EBB7A04();

    v20 = 0;
  }
  else
  {
    v20 = 1;
  }
  __swift_storeEnumTagSinglePayload((uint64_t)v18, v20, 1, v6);
  sub_21EB7D8B8((uint64_t)v29, (uint64_t)v5);
  v21 = (*(unsigned __int8 *)(v27 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v27 + 80);
  v22 = swift_allocObject();
  sub_21EB7D900((uint64_t)v5, v22 + v21);
  __swift_instantiateConcreteTypeFromMangledName(&qword_255478890);
  sub_21EB72A50(&qword_255478898, &qword_255478890);
  sub_21EBB7A04();
  sub_21EB7ECD0((uint64_t)v18, (uint64_t)v16, &qword_255478888);
  v23 = *(void (**)(char *, char *, uint64_t))(v7 + 16);
  v23(v10, v12, v6);
  sub_21EB7ECD0((uint64_t)v16, a1, &qword_255478888);
  v24 = __swift_instantiateConcreteTypeFromMangledName(&qword_2554788A0);
  v23((char *)(a1 + *(int *)(v24 + 48)), v10, v6);
  v25 = *(void (**)(char *, uint64_t))(v7 + 8);
  v25(v12, v6);
  sub_21EB67980((uint64_t)v18, &qword_255478888);
  v25(v10, v6);
  sub_21EB67980((uint64_t)v16, &qword_255478888);
}

void sub_21EB788DC(void *a1)
{
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  id v5;

  v1 = objc_msgSend(a1, sel_publicKey);
  v2 = sub_21EBB7B60();
  v4 = v3;

  v5 = objc_msgSend((id)objc_opt_self(), sel_generalPasteboard);
  sub_21EB7DCF4(v2, v4, v5);

}

uint64_t sub_21EB78964()
{
  id v0;
  void *v1;
  void *v2;
  id v3;

  sub_21EBB7B78();
  if (qword_2554776B0 != -1)
    swift_once();
  v0 = (id)qword_255478EA8;
  v1 = (void *)sub_21EBB7B48();
  v2 = (void *)sub_21EBB7B48();
  swift_bridgeObjectRelease();
  v3 = objc_msgSend(v0, sel_localizedStringForKey_value_table_, v1, v2, 0);

  sub_21EBB7B60();
  sub_21EB67308();
  return sub_21EBB79BC();
}

uint64_t sub_21EB78A90()
{
  type metadata accessor for SSHKeyConfigurationView();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2554787A0);
  return sub_21EBB79E0();
}

uint64_t sub_21EB78AF8()
{
  id v0;
  void *v1;
  void *v2;
  id v3;

  sub_21EBB7B78();
  if (qword_2554776B0 != -1)
    swift_once();
  v0 = (id)qword_255478EA8;
  v1 = (void *)sub_21EBB7B48();
  v2 = (void *)sub_21EBB7B48();
  swift_bridgeObjectRelease();
  v3 = objc_msgSend(v0, sel_localizedStringForKey_value_table_, v1, v2, 0);

  sub_21EBB7B60();
  sub_21EB67308();
  return sub_21EBB79BC();
}

uint64_t sub_21EB78C24(void *a1)
{
  id v1;

  if (a1)
  {
    v1 = a1;
    __swift_instantiateConcreteTypeFromMangledName(&qword_255478838);
    sub_21EBB79E0();
    objc_msgSend((id)objc_opt_self(), sel_setSharedKeyPair_, v1);
  }
  type metadata accessor for SSHKeyConfigurationView();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2554787A0);
  return sub_21EBB79E0();
}

void *sub_21EB78CE0@<X0>(void *a1@<X0>, void *a2@<X1>, void *a3@<X8>)
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  uint64_t v24;
  void *v25;
  id v26;
  id v27;
  void *result;
  void *v29;
  id v30;
  id v31;
  id v32;
  char v33;
  char v34;
  id v36;
  id __src[20];

  sub_21EBB79C8();
  v34 = (char)__src[0];
  v36 = __src[1];
  swift_retain();
  sub_21EBB79C8();
  v33 = (char)__src[0];
  v32 = __src[1];
  swift_retain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2554787C8);
  sub_21EBB79C8();
  v4 = (void *)objc_opt_self();
  v5 = objc_msgSend(v4, sel_defaultKeyComment);
  v6 = (void *)sub_21EBB7B60();
  v8 = v7;

  __src[17] = v6;
  __src[18] = v8;
  sub_21EBB79C8();
  v30 = __src[0];
  v9 = __src[2];
  swift_retain();
  v31 = __src[1];
  swift_bridgeObjectRetain();
  sub_21EBB7B78();
  if (qword_2554776B0 != -1)
    swift_once();
  v10 = (id)qword_255478EA8;
  v11 = (void *)sub_21EBB7B48();
  v12 = (void *)sub_21EBB7B48();
  swift_bridgeObjectRelease();
  v13 = objc_msgSend(v10, sel_localizedStringForKey_value_table_, v11, v12, 0);

  v29 = (void *)sub_21EBB7B60();
  v15 = v14;

  swift_bridgeObjectRetain();
  sub_21EBB7B78();
  v16 = (id)qword_255478EA8;
  v17 = (void *)sub_21EBB7B48();
  v18 = (void *)sub_21EBB7B48();
  swift_bridgeObjectRelease();
  v19 = objc_msgSend(v16, sel_localizedStringForKey_value_table_, v17, v18, 0);

  v20 = (void *)sub_21EBB7B60();
  v22 = v21;

  swift_bridgeObjectRetain();
  swift_retain();
  v23 = objc_msgSend(v4, sel_keyFormats);
  __swift_instantiateConcreteTypeFromMangledName(&qword_255478830);
  v24 = sub_21EBB7BD8();

  if (*(_QWORD *)(v24 + 16))
  {
    v25 = *(void **)(v24 + 32);
    swift_bridgeObjectRelease();
    v26 = objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_defaultKeySize);
    v27 = v26;

    swift_release();
    __src[0] = a1;
    __src[1] = a2;
    LOBYTE(__src[2]) = v34;
    __src[3] = v36;
    LOBYTE(__src[4]) = v33;
    __src[5] = v32;
    __src[6] = v25;
    __src[7] = 0;
    __src[8] = v26;
    __src[9] = 0;
    __src[10] = v30;
    __src[11] = v31;
    __src[12] = v9;
    __src[13] = v29;
    __src[14] = v15;
    __src[15] = v20;
    __src[16] = v22;
    sub_21EB7D9EC((uint64_t)__src);
    swift_release();
    swift_release();

    swift_release();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_release();
    sub_21EB7DA94((uint64_t)__src);
    return memcpy(a3, __src, 0x88uLL);
  }
  else
  {
    result = (void *)swift_bridgeObjectRelease();
    __break(1u);
  }
  return result;
}

void sub_21EB790C0(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  uint64_t OpaqueTypeConformance2;
  uint64_t v22;
  _QWORD v23[5];
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  unint64_t v28;

  v23[4] = a1;
  v24 = __swift_instantiateConcreteTypeFromMangledName(&qword_255478A20);
  MEMORY[0x24BDAC7A8](v24);
  v3 = (char *)v23 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_255478A28);
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)v23 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_255478A30);
  MEMORY[0x24BDAC7A8](v7);
  v9 = (char *)v23 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_255478A38);
  v11 = *(_QWORD *)(v10 - 8);
  MEMORY[0x24BDAC7A8](v10);
  v13 = (char *)v23 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  if ((*(_BYTE *)(v1 + 32) & 1) != 0 && (v14 = sub_21EBB7B90(), v14 >= 13))
  {
    v23[3] = v23;
    MEMORY[0x24BDAC7A8](v14);
    v23[2] = &v23[-4];
    v23[-2] = v1;
    sub_21EB7943C((_OWORD *)v1, (uint64_t)v9);
    sub_21EB72A50(&qword_255478A50, &qword_255478A20);
    v23[1] = v15;
    v16 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_255478A58);
    v17 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_255478A60);
    sub_21EB72A50(&qword_255478A68, &qword_255478A60);
    v19 = v18;
    v20 = sub_21EB67308();
    v25 = v17;
    v26 = MEMORY[0x24BEE0D00];
    v27 = v19;
    v28 = v20;
    OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
    v25 = v16;
    v26 = OpaqueTypeConformance2;
    swift_getOpaqueTypeConformance2();
    sub_21EBB7590();
    (*(void (**)(char *, char *, uint64_t))(v11 + 16))(v6, v13, v10);
    swift_storeEnumTagMultiPayload();
    sub_21EB72A50(&qword_255478A48, &qword_255478A38);
    sub_21EBB777C();
    (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v10);
  }
  else
  {
    *(_QWORD *)v3 = sub_21EBB76C8();
    *((_QWORD *)v3 + 1) = 0;
    v3[16] = 1;
    v22 = __swift_instantiateConcreteTypeFromMangledName(&qword_255478A40);
    sub_21EB798C8(v1, (uint64_t)&v3[*(int *)(v22 + 44)]);
    sub_21EB7ECD0((uint64_t)v3, (uint64_t)v6, &qword_255478A20);
    swift_storeEnumTagMultiPayload();
    sub_21EB72A50(&qword_255478A48, &qword_255478A38);
    sub_21EB72A50(&qword_255478A50, &qword_255478A20);
    sub_21EBB777C();
    sub_21EB67980((uint64_t)v3, &qword_255478A20);
  }
}

uint64_t sub_21EB7943C@<X0>(_OWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;
  char *v4;
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
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  _OWORD *v23;
  __int128 v24;
  uint64_t v25;
  unint64_t v26;

  v22 = a2;
  v21 = sub_21EBB76BC();
  v19 = *(_QWORD *)(v21 - 8);
  MEMORY[0x24BDAC7A8](v21);
  v4 = (char *)&v19 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_255478A60);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v19 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_255478A58);
  v20 = *(_QWORD *)(v9 - 8);
  MEMORY[0x24BDAC7A8](v9);
  v11 = (char *)&v19 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v23 = a1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_255478A70);
  sub_21EB7EB44();
  sub_21EBB783C();
  v24 = *a1;
  sub_21EB72A50(&qword_255478A68, &qword_255478A60);
  v13 = v12;
  v14 = sub_21EB67308();
  v15 = MEMORY[0x24BEE0D00];
  sub_21EBB78E4();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  v16 = v19;
  v17 = v21;
  (*(void (**)(char *, _QWORD, uint64_t))(v19 + 104))(v4, *MEMORY[0x24BDEE5F0], v21);
  *(_QWORD *)&v24 = v5;
  *((_QWORD *)&v24 + 1) = v15;
  v25 = v13;
  v26 = v14;
  swift_getOpaqueTypeConformance2();
  sub_21EBB7908();
  (*(void (**)(char *, uint64_t))(v16 + 8))(v4, v17);
  return (*(uint64_t (**)(char *, uint64_t))(v20 + 8))(v11, v9);
}

void sub_21EB79654(uint64_t a1@<X0>, uint64_t a2@<X8>)
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
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char v17;
  uint64_t v18;
  uint64_t KeyPath;
  char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  char v28;
  uint64_t v29;

  v25 = a2;
  v3 = sub_21EBB7800();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v6 = (char *)&v24 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_255478AB0);
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7);
  v10 = (char *)&v24 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_255478A88);
  MEMORY[0x24BDAC7A8](v11);
  v13 = (char *)&v24 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = *(_QWORD *)(a1 + 16);
  v15 = *(_QWORD *)(a1 + 24);
  v26 = v14;
  v27 = v15;
  sub_21EB67308();
  swift_bridgeObjectRetain();
  v26 = sub_21EBB7878();
  v27 = v16;
  v28 = v17 & 1;
  v29 = v18;
  sub_21EBB77F4();
  sub_21EBB78CC();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  sub_21EB76044(v26, v27, v28);
  swift_bridgeObjectRelease();
  KeyPath = swift_getKeyPath();
  (*(void (**)(char *, char *, uint64_t))(v8 + 16))(v13, v10, v7);
  v20 = &v13[*(int *)(v11 + 36)];
  *(_QWORD *)v20 = KeyPath;
  *((_QWORD *)v20 + 1) = 1;
  v20[16] = 0;
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  v21 = swift_getKeyPath();
  v22 = v25;
  sub_21EB7ECD0((uint64_t)v13, v25, &qword_255478A88);
  v23 = (uint64_t *)(v22 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_255478A70) + 36));
  *v23 = v21;
  v23[1] = 0x3FE0000000000000;
  sub_21EB67980((uint64_t)v13, &qword_255478A88);
}

uint64_t sub_21EB7987C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4;

  *(_QWORD *)a2 = sub_21EBB76C8();
  *(_QWORD *)(a2 + 8) = 0;
  *(_BYTE *)(a2 + 16) = 1;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_255478A40);
  return sub_21EB798C8(a1, a2 + *(int *)(v4 + 44));
}

uint64_t sub_21EB798C8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
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
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  int v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  char v28;
  char v29;
  uint64_t v30;
  char *v31;
  char *v32;
  int v33;
  uint64_t *v34;
  char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  char v40;
  char v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  char v46;
  char v47;
  uint64_t v48;
  uint64_t v49;
  char v50;
  char v51;
  char *v52;
  uint64_t v53;
  uint64_t v54;
  char *v55;
  uint64_t v56;
  uint64_t v57;
  char *v58;
  char *v59;
  uint64_t v60;
  char v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  char *v69;
  char *v70;
  char *v71;
  char *v72;
  char *v73;
  uint64_t v74;
  int v75;
  uint64_t *v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;

  v77 = sub_21EBB7800();
  v4 = *(_QWORD *)(v77 - 8);
  MEMORY[0x24BDAC7A8](v77);
  v72 = (char *)&v66 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_255478AB0);
  v7 = *(_QWORD *)(v6 - 8);
  v8 = MEMORY[0x24BDAC7A8](v6);
  v73 = (char *)&v66 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)&v66 - v10;
  v74 = __swift_instantiateConcreteTypeFromMangledName(&qword_255478AB8);
  MEMORY[0x24BDAC7A8](v74);
  v76 = (uint64_t *)((char *)&v66 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0));
  v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_255478AC0);
  v14 = MEMORY[0x24BDAC7A8](v13);
  v16 = (char *)&v66 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v14);
  v18 = (char *)&v66 - v17;
  v19 = *(_QWORD *)(a1 + 8);
  v81 = *(_QWORD *)a1;
  v82 = v19;
  sub_21EB67308();
  swift_bridgeObjectRetain();
  v20 = sub_21EBB7878();
  v78 = v21;
  v79 = v20;
  v75 = v22;
  v80 = v23;
  if ((*(_BYTE *)(a1 + 32) & 1) != 0 && sub_21EBB7B90() >= 13)
  {
    v81 = sub_21EB79DDC();
    v82 = v24;
    v25 = sub_21EBB7878();
    v27 = v26;
    v29 = v28 & 1;
    sub_21EBB7998();
    v30 = sub_21EBB786C();
    v72 = v31;
    v73 = v32;
    LODWORD(v71) = v33;
    swift_release();
    sub_21EB76044(v25, v27, v29);
    swift_bridgeObjectRelease();
    v34 = v76;
    v35 = v72;
    *v76 = v30;
    v34[1] = (uint64_t)v35;
    *((_BYTE *)v34 + 16) = v71 & 1;
    v34[3] = (uint64_t)v73;
    swift_storeEnumTagMultiPayload();
    v81 = MEMORY[0x24BDF1FA8];
    v82 = v77;
    v83 = MEMORY[0x24BDF1F80];
    v84 = MEMORY[0x24BDF04A0];
    swift_getOpaqueTypeConformance2();
    sub_21EBB777C();
  }
  else
  {
    v81 = sub_21EB79DDC();
    v82 = v36;
    v37 = sub_21EBB7878();
    v39 = v38;
    v71 = v16;
    v41 = v40 & 1;
    sub_21EBB7998();
    v66 = v4;
    v42 = sub_21EBB786C();
    v69 = v11;
    v70 = v18;
    v43 = v42;
    v67 = v7;
    v68 = v6;
    v45 = v44;
    v47 = v46;
    v49 = v48;
    swift_release();
    v50 = v41;
    v16 = v71;
    sub_21EB76044(v37, v39, v50);
    swift_bridgeObjectRelease();
    v81 = v43;
    v82 = v45;
    v51 = v47 & 1;
    v18 = v70;
    LOBYTE(v83) = v51;
    v84 = v49;
    v52 = v72;
    sub_21EBB77F4();
    v53 = MEMORY[0x24BDF1FA8];
    v54 = MEMORY[0x24BDF1F80];
    v55 = v73;
    v56 = v77;
    sub_21EBB78CC();
    (*(void (**)(char *, uint64_t))(v66 + 8))(v52, v56);
    sub_21EB76044(v81, v82, v83);
    swift_bridgeObjectRelease();
    v57 = v67;
    v58 = v69;
    v59 = v55;
    v60 = v68;
    (*(void (**)(char *, char *, uint64_t))(v67 + 32))(v69, v59, v68);
    (*(void (**)(uint64_t *, char *, uint64_t))(v57 + 16))(v76, v58, v60);
    swift_storeEnumTagMultiPayload();
    v81 = v53;
    v82 = v56;
    v83 = v54;
    v84 = MEMORY[0x24BDF04A0];
    swift_getOpaqueTypeConformance2();
    sub_21EBB777C();
    (*(void (**)(char *, uint64_t))(v57 + 8))(v58, v60);
  }
  v61 = v75 & 1;
  sub_21EB7ECD0((uint64_t)v18, (uint64_t)v16, &qword_255478AC0);
  v63 = v78;
  v62 = v79;
  *(_QWORD *)a2 = v79;
  *(_QWORD *)(a2 + 8) = v63;
  *(_BYTE *)(a2 + 16) = v61;
  *(_QWORD *)(a2 + 24) = v80;
  *(_QWORD *)(a2 + 32) = 0;
  *(_BYTE *)(a2 + 40) = 1;
  v64 = __swift_instantiateConcreteTypeFromMangledName(qword_255478AC8);
  sub_21EB7ECD0((uint64_t)v16, a2 + *(int *)(v64 + 64), &qword_255478AC0);
  sub_21EB760D8(v62, v63, v61);
  swift_bridgeObjectRetain();
  sub_21EB67980((uint64_t)v18, &qword_255478AC0);
  sub_21EB67980((uint64_t)v16, &qword_255478AC0);
  sub_21EB76044(v62, v63, v61);
  return swift_bridgeObjectRelease();
}

uint64_t sub_21EB79DDC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v1 = *(_QWORD *)(v0 + 16);
  if ((*(_BYTE *)(v0 + 32) & 1) != 0 && sub_21EBB7B90() >= 13)
  {
    sub_21EBB7B9C();
    v2 = sub_21EBB7BC0();
    v3 = MEMORY[0x2207B77C0](v2);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRetain();
    sub_21EBB7BA8();
    swift_bridgeObjectRelease();
    return v3;
  }
  else
  {
    swift_bridgeObjectRetain();
  }
  return v1;
}

void sub_21EB79EA4(uint64_t a1@<X8>)
{
  sub_21EB790C0(a1);
}

uint64_t sub_21EB79EDC()
{
  id v0;

  v0 = objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_localizedDisplayName);
  sub_21EBB7B60();

  sub_21EBB7B84();
  return swift_bridgeObjectRelease();
}

uint64_t sub_21EB79F44()
{
  id v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char v9;

  v0 = objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_localizedDisplayName);
  v1 = sub_21EBB7B60();
  v3 = v2;

  v4 = objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_localizedDisplayName);
  v5 = sub_21EBB7B60();
  v7 = v6;

  if (v1 == v5 && v3 == v7)
    v9 = 1;
  else
    v9 = sub_21EBB7D88();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v9 & 1;
}

uint64_t sub_21EB7A010()
{
  id v0;

  sub_21EBB7DC4();
  v0 = objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_localizedDisplayName);
  sub_21EBB7B60();

  sub_21EBB7B84();
  swift_bridgeObjectRelease();
  return sub_21EBB7DD0();
}

uint64_t sub_21EB7A098()
{
  return sub_21EB7A010();
}

uint64_t sub_21EB7A0A0()
{
  return sub_21EB79EDC();
}

uint64_t sub_21EB7A0A8()
{
  id v0;

  sub_21EBB7DC4();
  v0 = objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_localizedDisplayName);
  sub_21EBB7B60();

  sub_21EBB7B84();
  swift_bridgeObjectRelease();
  return sub_21EBB7DD0();
}

uint64_t sub_21EB7A12C()
{
  return sub_21EB79F44();
}

void sub_21EB7A138(uint64_t a1@<X8>)
{
  _OWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  id v18;
  void *v19;
  void *v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t OpaqueTypeConformance2;
  unint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  char *v30;
  uint64_t v31;
  uint64_t v32;
  char *v33;
  uint64_t v34;
  _OWORD *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  _OWORD *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  char *v45;
  char *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  char *v52;
  uint64_t v53;
  _OWORD *v54;
  _OWORD *v55;
  __int128 v56;
  uint64_t v57;
  unint64_t v58;
  __int128 v59;

  v53 = a1;
  v50 = sub_21EBB76BC();
  v48 = *(_QWORD *)(v50 - 8);
  MEMORY[0x24BDAC7A8](v50);
  v46 = (char *)&v40 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_2554788A8);
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v6 = (char *)&v40 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v42 = __swift_instantiateConcreteTypeFromMangledName(&qword_2554788B0);
  v40 = *(_QWORD *)(v42 - 8);
  MEMORY[0x24BDAC7A8](v42);
  v8 = (char *)&v40 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v44 = __swift_instantiateConcreteTypeFromMangledName(&qword_2554788B8);
  v43 = *(_QWORD *)(v44 - 8);
  MEMORY[0x24BDAC7A8](v44);
  v10 = (char *)&v40 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v49 = __swift_instantiateConcreteTypeFromMangledName(&qword_2554788C0);
  v47 = *(_QWORD *)(v49 - 8);
  MEMORY[0x24BDAC7A8](v49);
  v45 = (char *)&v40 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v51 = __swift_instantiateConcreteTypeFromMangledName(&qword_2554788C8);
  MEMORY[0x24BDAC7A8](v51);
  v52 = (char *)&v40 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v55 = v1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2554788D0);
  sub_21EB72A50(&qword_2554788D8, &qword_2554788D0);
  sub_21EBB783C();
  v41 = v1;
  v54 = v1;
  v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_2554788E0);
  sub_21EB72A50(&qword_2554788E8, &qword_2554788A8);
  v15 = v14;
  sub_21EB72A50(&qword_2554788F0, &qword_2554788E0);
  v17 = v16;
  sub_21EBB7938();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  sub_21EBB7B78();
  if (qword_2554776B0 != -1)
    swift_once();
  v18 = (id)qword_255478EA8;
  v19 = (void *)sub_21EBB7B48();
  v20 = (void *)sub_21EBB7B48();
  swift_bridgeObjectRelease();
  v21 = objc_msgSend(v18, sel_localizedStringForKey_value_table_, v19, v20, 0);

  v22 = sub_21EBB7B60();
  v24 = v23;

  *(_QWORD *)&v59 = v22;
  *((_QWORD *)&v59 + 1) = v24;
  *(_QWORD *)&v56 = v3;
  *((_QWORD *)&v56 + 1) = v13;
  v57 = v15;
  v58 = v17;
  OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
  v26 = sub_21EB67308();
  v27 = MEMORY[0x24BEE0D00];
  v28 = v42;
  sub_21EBB78E4();
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v40 + 8))(v8, v28);
  v29 = v48;
  v30 = v46;
  v31 = v50;
  (*(void (**)(char *, _QWORD, uint64_t))(v48 + 104))(v46, *MEMORY[0x24BDEE5F0], v50);
  *(_QWORD *)&v56 = v28;
  *((_QWORD *)&v56 + 1) = v27;
  v57 = OpaqueTypeConformance2;
  v58 = v26;
  v32 = swift_getOpaqueTypeConformance2();
  v33 = v45;
  v34 = v44;
  sub_21EBB7908();
  (*(void (**)(char *, uint64_t))(v29 + 8))(v30, v31);
  (*(void (**)(char *, uint64_t))(v43 + 8))(v10, v34);
  v35 = v41;
  v59 = v41[1];
  __swift_instantiateConcreteTypeFromMangledName(&qword_2554787A0);
  v36 = sub_21EBB79EC();
  MEMORY[0x24BDAC7A8](v36);
  *(&v40 - 2) = (uint64_t)v35;
  *(_QWORD *)&v56 = v34;
  *((_QWORD *)&v56 + 1) = v32;
  swift_getOpaqueTypeConformance2();
  v37 = (uint64_t)v52;
  v38 = v49;
  sub_21EBB7914();
  swift_release();
  swift_release();
  (*(void (**)(char *, uint64_t))(v47 + 8))(v33, v38);
  v56 = v35[3];
  __swift_instantiateConcreteTypeFromMangledName(&qword_2554788F8);
  sub_21EBB79D4();
  v39 = swift_allocObject();
  memcpy((void *)(v39 + 16), v35, 0x88uLL);
  sub_21EB7D9EC((uint64_t)v35);
  sub_21EB7E448();
  sub_21EB7E5C4();
  sub_21EBB7944();
  swift_release();
  sub_21EB67980(v37, &qword_2554788C8);
}

__n128 sub_21EB7A748@<Q0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  __n128 result;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  uint64_t v9;
  __n128 v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  uint64_t v14;
  __int128 v15;
  uint64_t v16;

  sub_21EB7A7B0(&v9);
  v2 = v11;
  v3 = v14;
  v4 = v16;
  result = v10;
  v6 = v15;
  v7 = v12;
  v8 = v13;
  *(_QWORD *)a1 = v9;
  *(__n128 *)(a1 + 8) = result;
  *(_QWORD *)(a1 + 24) = v2;
  *(_OWORD *)(a1 + 32) = v7;
  *(_OWORD *)(a1 + 48) = v8;
  *(_QWORD *)(a1 + 64) = v3;
  *(_OWORD *)(a1 + 72) = v6;
  *(_QWORD *)(a1 + 88) = v4;
  return result;
}

uint64_t sub_21EB7A7B0@<X0>(uint64_t *a1@<X8>)
{
  const void *v1;
  const void *v2;
  id v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  const void *v9;
  id v10;
  unint64_t v11;
  uint64_t v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  const void *v20;
  uint64_t (*v21)@<X0>(uint64_t@<X8>);
  id v22;
  void *v23;
  void *v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;

  v2 = v1;
  sub_21EBB7B78();
  if (qword_2554776B0 != -1)
    swift_once();
  v4 = (id)qword_255478EA8;
  v5 = (void *)sub_21EBB7B48();
  v6 = (void *)sub_21EBB7B48();
  swift_bridgeObjectRelease();
  v7 = objc_msgSend(v4, sel_localizedStringForKey_value_table_, v5, v6, 0);

  v34 = sub_21EBB7B60();
  v35 = v8;

  v33 = swift_allocObject();
  memcpy((void *)(v33 + 16), v2, 0x88uLL);
  v9 = v2;
  sub_21EB7D9EC((uint64_t)v2);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2554788F8);
  sub_21EBB79D4();
  v10 = objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_possibleKeySizes);
  sub_21EB6AA68(0, &qword_255478958);
  v11 = sub_21EBB7BD8();

  if (v11 >> 62)
  {
    swift_bridgeObjectRetain();
    v12 = sub_21EBB7D64();
    swift_bridgeObjectRelease();
  }
  else
  {
    v12 = *(_QWORD *)((v11 & 0xFFFFFFFFFFFFF8) + 0x10);
  }
  swift_bridgeObjectRelease();
  if (v12)
  {
    sub_21EBB7B78();
    v13 = (id)qword_255478EA8;
    v14 = (void *)sub_21EBB7B48();
    v15 = (void *)sub_21EBB7B48();
    swift_bridgeObjectRelease();
    v16 = objc_msgSend(v13, sel_localizedStringForKey_value_table_, v14, v15, 0);

    v17 = sub_21EBB7B60();
    v31 = v18;
    v32 = v17;

    v19 = swift_allocObject();
    v20 = v9;
    memcpy((void *)(v19 + 16), v9, 0x88uLL);
    sub_21EB7D9EC((uint64_t)v9);
    v21 = sub_21EB7E800;
  }
  else
  {
    v31 = 0;
    v32 = 0;
    v21 = 0;
    v19 = 0;
    v20 = v9;
  }
  sub_21EBB7B78();
  v22 = (id)qword_255478EA8;
  v23 = (void *)sub_21EBB7B48();
  v24 = (void *)sub_21EBB7B48();
  swift_bridgeObjectRelease();
  v25 = objc_msgSend(v22, sel_localizedStringForKey_value_table_, v23, v24, 0);

  v26 = sub_21EBB7B60();
  v28 = v27;

  v29 = swift_allocObject();
  memcpy((void *)(v29 + 16), v20, 0x88uLL);
  *a1 = v34;
  a1[1] = v35;
  a1[2] = (uint64_t)sub_21EB7E7F4;
  a1[3] = v33;
  a1[4] = v32;
  a1[5] = v31;
  a1[6] = (uint64_t)v21;
  a1[7] = v19;
  a1[8] = v26;
  a1[9] = v28;
  a1[10] = (uint64_t)sub_21EB7E870;
  a1[11] = v29;
  sub_21EB7D9EC((uint64_t)v20);
  swift_bridgeObjectRetain();
  swift_retain();
  sub_21EB7E878(v32, v31);
  sub_21EB7E8A8(v32, v31);
  swift_release();
  return swift_bridgeObjectRelease();
}

uint64_t sub_21EB7ABBC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
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
  uint64_t v18;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;

  v23 = a2;
  v22 = __swift_instantiateConcreteTypeFromMangledName(&qword_255478920);
  MEMORY[0x24BDAC7A8](v22);
  v4 = (char *)&v20 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_255478928);
  v20 = *(_QWORD *)(v5 - 8);
  v21 = v5;
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)&v20 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_21EBB77C4();
  MEMORY[0x24BDAC7A8](v8);
  v9 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_255478930);
  v10 = *(_QWORD *)(v9 - 8);
  MEMORY[0x24BDAC7A8](v9);
  v12 = (char *)&v20 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_21EBB77AC();
  v25 = a1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_255477A38);
  v13 = __swift_instantiateConcreteTypeFromMangledNameAbstract((uint64_t *)&unk_255477990);
  sub_21EB72A50(&qword_255478DC0, (uint64_t *)&unk_255477990);
  v26 = v13;
  v27 = v14;
  swift_getOpaqueTypeConformance2();
  sub_21EBB7548();
  sub_21EBB77B8();
  v24 = a1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_255478940);
  sub_21EB7E6F4();
  sub_21EBB7548();
  v15 = &v4[*(int *)(v22 + 48)];
  (*(void (**)(char *, char *, uint64_t))(v10 + 16))(v4, v12, v9);
  v16 = v20;
  v17 = v15;
  v18 = v21;
  (*(void (**)(char *, char *, uint64_t))(v20 + 16))(v17, v7, v21);
  sub_21EBB76E0();
  (*(void (**)(char *, uint64_t))(v16 + 8))(v7, v18);
  return (*(uint64_t (**)(char *, uint64_t))(v10 + 8))(v12, v9);
}

uint64_t sub_21EB7AE18(const void *a1)
{
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;

  v2 = sub_21EBB75CC();
  v18 = *(_QWORD *)(v2 - 8);
  v19 = v2;
  MEMORY[0x24BDAC7A8](v2);
  v4 = (char *)&v18 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_255477990);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v18 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_21EBB7B78();
  if (qword_2554776B0 != -1)
    swift_once();
  v9 = (id)qword_255478EA8;
  v10 = (void *)sub_21EBB7B48();
  v11 = (void *)sub_21EBB7B48();
  swift_bridgeObjectRelease();
  v12 = objc_msgSend(v9, sel_localizedStringForKey_value_table_, v10, v11, 0);

  v13 = sub_21EBB7B60();
  v15 = v14;

  v20 = v13;
  v21 = v15;
  v16 = swift_allocObject();
  memcpy((void *)(v16 + 16), a1, 0x88uLL);
  sub_21EB7D9EC((uint64_t)a1);
  sub_21EB67308();
  sub_21EBB7A10();
  sub_21EBB75B4();
  sub_21EB72A50(&qword_255478DC0, (uint64_t *)&unk_255477990);
  sub_21EBB78F0();
  (*(void (**)(char *, uint64_t))(v18 + 8))(v4, v19);
  return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

uint64_t sub_21EB7B04C@<X0>(uint64_t a1@<X8>)
{
  _OWORD *v1;
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
  char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  id v21;
  void *v22;
  void *v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  char *v32;
  uint64_t v33;
  uint64_t v34;
  char *v35;
  uint64_t v36;
  uint64_t v37;
  const void *v38;
  char *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  char *v43;
  uint64_t v44;
  uint64_t v45;
  __int128 v46;
  char v47;

  v45 = a1;
  v2 = sub_21EBB75CC();
  v41 = *(_QWORD *)(v2 - 8);
  v42 = v2;
  MEMORY[0x24BDAC7A8](v2);
  v4 = (char *)&v36 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_255477990);
  v40 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)&v36 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_255477A38);
  v44 = *(_QWORD *)(v8 - 8);
  v9 = MEMORY[0x24BDAC7A8](v8);
  v39 = (char *)&v36 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v9);
  v43 = (char *)&v36 - v11;
  v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_255478950);
  MEMORY[0x24BDAC7A8](v12);
  v14 = (char *)&v36 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_2554779B8);
  v16 = *(_QWORD *)(v15 - 8);
  MEMORY[0x24BDAC7A8](v15);
  v18 = (char *)&v36 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v38 = v1;
  v46 = v1[2];
  __swift_instantiateConcreteTypeFromMangledName(&qword_2554787A0);
  sub_21EBB79D4();
  if (v47 == 1)
  {
    sub_21EBB7554();
    (*(void (**)(char *, char *, uint64_t))(v16 + 16))(v14, v18, v15);
    swift_storeEnumTagMultiPayload();
    sub_21EB72A50(&qword_2554779B0, &qword_2554779B8);
    sub_21EB72A50(&qword_255478DC0, (uint64_t *)&unk_255477990);
    *(_QWORD *)&v46 = v5;
    *((_QWORD *)&v46 + 1) = v19;
    swift_getOpaqueTypeConformance2();
    sub_21EBB777C();
    return (*(uint64_t (**)(char *, uint64_t))(v16 + 8))(v18, v15);
  }
  else
  {
    v36 = v12;
    v37 = v5;
    sub_21EBB7B78();
    if (qword_2554776B0 != -1)
      swift_once();
    v21 = (id)qword_255478EA8;
    v22 = (void *)sub_21EBB7B48();
    v23 = (void *)sub_21EBB7B48();
    swift_bridgeObjectRelease();
    v24 = objc_msgSend(v21, sel_localizedStringForKey_value_table_, v22, v23, 0);

    v25 = sub_21EBB7B60();
    v27 = v26;

    *(_QWORD *)&v46 = v25;
    *((_QWORD *)&v46 + 1) = v27;
    v28 = swift_allocObject();
    v29 = (uint64_t)v38;
    memcpy((void *)(v28 + 16), v38, 0x88uLL);
    sub_21EB7D9EC(v29);
    sub_21EB67308();
    sub_21EBB7A10();
    sub_21EBB75C0();
    sub_21EB72A50(&qword_255478DC0, (uint64_t *)&unk_255477990);
    v31 = v30;
    v32 = v39;
    v33 = v37;
    sub_21EBB78F0();
    (*(void (**)(char *, uint64_t))(v41 + 8))(v4, v42);
    (*(void (**)(char *, uint64_t))(v40 + 8))(v7, v33);
    v35 = v43;
    v34 = v44;
    (*(void (**)(char *, char *, uint64_t))(v44 + 32))(v43, v32, v8);
    (*(void (**)(char *, char *, uint64_t))(v34 + 16))(v14, v35, v8);
    swift_storeEnumTagMultiPayload();
    sub_21EB72A50(&qword_2554779B0, &qword_2554779B8);
    *(_QWORD *)&v46 = v33;
    *((_QWORD *)&v46 + 1) = v31;
    swift_getOpaqueTypeConformance2();
    sub_21EBB777C();
    return (*(uint64_t (**)(char *, uint64_t))(v34 + 8))(v35, v8);
  }
}

uint64_t sub_21EB7B4F0(const void *a1)
{
  uint64_t v2;
  uint64_t v3;
  id v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char v11;
  uint64_t v12;

  v2 = sub_21EBB798C();
  v3 = MEMORY[0x24BDAC7A8](v2);
  MEMORY[0x24BDAC7A8](v3);
  sub_21EB67308();
  swift_bridgeObjectRetain();
  sub_21EBB7878();
  swift_bridgeObjectRetain();
  sub_21EBB7878();
  sub_21EBB7980();
  sub_21EBB7B78();
  if (qword_2554776B0 != -1)
    swift_once();
  v4 = (id)qword_255478EA8;
  v5 = (void *)sub_21EBB7B48();
  v6 = (void *)sub_21EBB7B48();
  swift_bridgeObjectRelease();
  v7 = objc_msgSend(v4, sel_localizedStringForKey_value_table_, v5, v6, 0);

  sub_21EBB7B60();
  v8 = sub_21EBB7878();
  v10 = v9;
  LOBYTE(v6) = v11 & 1;
  v12 = swift_allocObject();
  memcpy((void *)(v12 + 16), a1, 0x88uLL);
  sub_21EB7D9EC((uint64_t)a1);
  sub_21EBB7974();
  swift_release();
  sub_21EB76044(v8, v10, (char)v6);
  swift_bridgeObjectRelease();
  return sub_21EBB7968();
}

uint64_t sub_21EB7B788()
{
  _OWORD *v0;
  const void *v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  __int128 aBlock;
  uint64_t (*v21)();
  void *v22;
  uint64_t (*v23)();
  uint64_t v24;

  v1 = v0;
  v2 = sub_21EBB7ADC();
  v18 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v4 = (char *)&v16 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17 = sub_21EBB7B00();
  v5 = *(_QWORD *)(v17 - 8);
  MEMORY[0x24BDAC7A8](v17);
  v7 = (char *)&v16 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_21EBB7AE8();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)&v16 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  aBlock = v0[2];
  LOBYTE(v19) = 1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2554787A0);
  sub_21EBB79E0();
  sub_21EB6AA68(0, (unint64_t *)&qword_255477C20);
  (*(void (**)(char *, _QWORD, uint64_t))(v9 + 104))(v11, *MEMORY[0x24BEE5480], v8);
  v12 = (void *)sub_21EBB7C98();
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  v13 = swift_allocObject();
  memcpy((void *)(v13 + 16), v1, 0x88uLL);
  v23 = sub_21EB7E624;
  v24 = v13;
  *(_QWORD *)&aBlock = MEMORY[0x24BDAC760];
  *((_QWORD *)&aBlock + 1) = 1107296256;
  v21 = sub_21EB83A60;
  v22 = &block_descriptor_46;
  v14 = _Block_copy(&aBlock);
  sub_21EB7D9EC((uint64_t)v1);
  sub_21EBB7AF4();
  v19 = MEMORY[0x24BEE4AF8];
  sub_21EB65BBC(&qword_255477E90, (void (*)(uint64_t))MEMORY[0x24BEE5458]);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_255477C30);
  sub_21EB72A50(&qword_255477EA0, (uint64_t *)&unk_255477C30);
  sub_21EBB7CEC();
  MEMORY[0x2207B78E0](0, v7, v4, v14);
  _Block_release(v14);

  (*(void (**)(char *, uint64_t))(v18 + 8))(v4, v2);
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v17);
  return swift_release();
}

uint64_t sub_21EB7BA3C()
{
  id v0;

  v0 = objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_defaultKeySize);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_255478910);
  return sub_21EBB79E0();
}

uint64_t sub_21EB7BAA4(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  __int128 v11;

  v2 = sub_21EBB77A0();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v11 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2554789E0);
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v11 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = *(_OWORD *)(a1 + 48);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2554788F8);
  sub_21EBB79EC();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2554789E8);
  sub_21EB7EA98();
  sub_21EB7EAD4();
  sub_21EBB7A1C();
  sub_21EBB7794();
  sub_21EB72A50(&qword_255478A00, &qword_2554789E0);
  sub_21EBB78B4();
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  return (*(uint64_t (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

uint64_t sub_21EB7BC50@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  id v6;
  uint64_t v7;
  int64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v15;
  uint64_t v16;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2554789E8);
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v15 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = objc_msgSend((id)objc_opt_self(), sel_keyFormats);
  __swift_instantiateConcreteTypeFromMangledName(&qword_255478830);
  v7 = sub_21EBB7BD8();

  v8 = *(_QWORD *)(v7 + 16);
  if (v8)
  {
    v15 = a1;
    v16 = MEMORY[0x24BEE4AF8];
    sub_21EB7CBCC(0, v8, 0);
    v9 = 0;
    v10 = v16;
    v11 = *(_QWORD *)(v16 + 16);
    do
    {
      v12 = *(_QWORD *)(v7 + 8 * v9 + 32);
      v16 = v10;
      v13 = *(_QWORD *)(v10 + 24);
      if (v11 >= v13 >> 1)
      {
        sub_21EB7CBCC((char *)(v13 > 1), v11 + 1, 1);
        v10 = v16;
      }
      ++v9;
      *(_QWORD *)(v10 + 16) = v11 + 1;
      *(_QWORD *)(v10 + 8 * v11++ + 32) = v12;
    }
    while (v8 != v9);
    swift_bridgeObjectRelease();
    a1 = v15;
  }
  else
  {
    swift_bridgeObjectRelease();
    v10 = MEMORY[0x24BEE4AF8];
  }
  v16 = v10;
  swift_getKeyPath();
  __swift_instantiateConcreteTypeFromMangledName(&qword_255478A08);
  sub_21EB72A50(&qword_255478A10, &qword_255478A08);
  sub_21EB7EA98();
  sub_21EBB7A64();
  return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v3 + 32))(a1, v5, v2);
}

uint64_t sub_21EB7BE64@<X0>(uint64_t a1@<X8>)
{
  id v2;
  uint64_t result;
  uint64_t v4;
  char v5;
  uint64_t v6;

  v2 = objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_localizedDisplayName);
  sub_21EBB7B60();

  sub_21EB67308();
  result = sub_21EBB7878();
  *(_QWORD *)a1 = result;
  *(_QWORD *)(a1 + 8) = v4;
  *(_BYTE *)(a1 + 16) = v5 & 1;
  *(_QWORD *)(a1 + 24) = v6;
  return result;
}

uint64_t sub_21EB7BEEC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  _QWORD v12[6];
  __int128 v13;

  v12[1] = a2;
  v3 = sub_21EBB77A0();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v6 = (char *)v12 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_255478960);
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7);
  v10 = (char *)v12 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = *(_OWORD *)(a1 + 64);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_255478910);
  sub_21EBB79EC();
  v12[4] = a1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2554787C8);
  __swift_instantiateConcreteTypeFromMangledName(&qword_255478968);
  sub_21EB7E930(&qword_255478970, &qword_2554787C8, (uint64_t (*)(void))sub_21EB7E8E0, MEMORY[0x24BEE4AB0]);
  sub_21EB7E930(&qword_255478980, &qword_255478968, (uint64_t (*)(void))sub_21EB7E990, MEMORY[0x24BDF4A08]);
  sub_21EBB7A1C();
  sub_21EBB7794();
  sub_21EB72A50(&qword_2554789C8, &qword_255478960);
  sub_21EBB78B4();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  return (*(uint64_t (**)(char *, uint64_t))(v8 + 8))(v10, v7);
}

uint64_t sub_21EB7C0E8()
{
  id v0;

  __swift_instantiateConcreteTypeFromMangledName(&qword_2554788F8);
  sub_21EBB79D4();
  v0 = objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_possibleKeySizes);
  sub_21EB6AA68(0, &qword_255478958);
  sub_21EBB7BD8();

  swift_getKeyPath();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2554789D0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_255478990);
  sub_21EB72A50(&qword_2554789D8, &qword_2554789D0);
  sub_21EB7E8E0();
  sub_21EB7E990();
  return sub_21EBB7A64();
}

id sub_21EB7C218@<X0>(id *a1@<X0>, uint64_t a2@<X8>)
{
  id v3;
  id v4;
  uint64_t v5;
  char v6;
  uint64_t v7;

  v3 = *a1;
  v4 = objc_msgSend(*a1, sel_stringValue);
  sub_21EBB7B60();

  sub_21EB67308();
  *(_QWORD *)a2 = sub_21EBB7878();
  *(_QWORD *)(a2 + 8) = v5;
  *(_BYTE *)(a2 + 16) = v6 & 1;
  *(_QWORD *)(a2 + 24) = v7;
  *(_QWORD *)(a2 + 32) = v3;
  *(_QWORD *)(a2 + 40) = v3;
  return v3;
}

uint64_t sub_21EB7C2B0()
{
  id v0;
  void *v1;
  void *v2;
  id v3;

  sub_21EBB7B78();
  if (qword_2554776B0 != -1)
    swift_once();
  v0 = (id)qword_255478EA8;
  v1 = (void *)sub_21EBB7B48();
  v2 = (void *)sub_21EBB7B48();
  swift_bridgeObjectRelease();
  v3 = objc_msgSend(v0, sel_localizedStringForKey_value_table_, v1, v2, 0);

  sub_21EBB7B60();
  __swift_instantiateConcreteTypeFromMangledName(&qword_255477C50);
  sub_21EBB79EC();
  sub_21EB67308();
  return sub_21EBB7AD0();
}

uint64_t sub_21EB7C428()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_2554787A0);
  return sub_21EBB79E0();
}

uint64_t sub_21EB7C474(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  id v8;
  id v9;
  void *ObjCClassFromMetadata;
  void *v11;
  id v12;
  void *v13;
  uint64_t v14;
  void *v15;
  id v16;
  uint64_t v18;
  uint64_t v19;
  __int128 aBlock;
  uint64_t (*v21)();
  void *v22;
  void (*v23)();
  uint64_t v24;
  id v25;

  v2 = sub_21EBB7ADC();
  v19 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v4 = (char *)&v18 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18 = sub_21EBB7B00();
  v5 = *(_QWORD *)(v18 - 8);
  MEMORY[0x24BDAC7A8](v18);
  v7 = (char *)&v18 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  aBlock = *(_OWORD *)(a1 + 48);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2554788F8);
  sub_21EBB79D4();
  aBlock = *(_OWORD *)(a1 + 64);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_255478910);
  sub_21EBB79D4();
  v8 = v25;
  if (v25)
  {
    v9 = objc_msgSend(v25, sel_integerValue);

  }
  else
  {
    v9 = 0;
  }
  ObjCClassFromMetadata = (void *)swift_getObjCClassFromMetadata();
  aBlock = *(_OWORD *)(a1 + 80);
  v21 = *(uint64_t (**)())(a1 + 96);
  __swift_instantiateConcreteTypeFromMangledName(&qword_255477C50);
  sub_21EBB79D4();
  v11 = (void *)sub_21EBB7B48();
  swift_bridgeObjectRelease();
  v12 = objc_msgSend(ObjCClassFromMetadata, sel_generateKeyPairWithKeySize_comment_, v9, v11);

  sub_21EB6AA68(0, (unint64_t *)&qword_255477C20);
  v13 = (void *)sub_21EBB7C80();
  v14 = swift_allocObject();
  memcpy((void *)(v14 + 16), (const void *)a1, 0x88uLL);
  *(_QWORD *)(v14 + 152) = v12;
  v23 = sub_21EB7E6B0;
  v24 = v14;
  *(_QWORD *)&aBlock = MEMORY[0x24BDAC760];
  *((_QWORD *)&aBlock + 1) = 1107296256;
  v21 = sub_21EB83A60;
  v22 = &block_descriptor_52;
  v15 = _Block_copy(&aBlock);
  sub_21EB7D9EC(a1);
  v16 = v12;
  swift_release();
  sub_21EBB7AF4();
  *(_QWORD *)&aBlock = MEMORY[0x24BEE4AF8];
  sub_21EB65BBC(&qword_255477E90, (void (*)(uint64_t))MEMORY[0x24BEE5458]);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_255477C30);
  sub_21EB72A50(&qword_255477EA0, (uint64_t *)&unk_255477C30);
  sub_21EBB7CEC();
  MEMORY[0x2207B78E0](0, v7, v4, v15);
  _Block_release(v15);

  (*(void (**)(char *, uint64_t))(v19 + 8))(v4, v2);
  return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v18);
}

void sub_21EB7C784(uint64_t a1@<X8>)
{
  const void *v1;
  _BYTE __dst[136];

  memcpy(__dst, v1, sizeof(__dst));
  sub_21EB7A138(a1);
}

uint64_t sub_21EB7C7C4@<X0>(uint64_t a1@<X5>, uint64_t a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  void (*v10)(char *, uint64_t);
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD v15[3];
  __int128 v16;
  char v17;
  uint64_t v18;
  __int128 v19;
  char v20;
  uint64_t v21;

  v14 = a2;
  v3 = sub_21EBB7A94();
  v13 = *(_QWORD *)(v3 - 8);
  v4 = MEMORY[0x24BDAC7A8](v3);
  v6 = (char *)&v12 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v4);
  v8 = (char *)&v12 - v7;
  sub_21EB7C964((uint64_t)&v19);
  v16 = v19;
  v17 = v20;
  v18 = v21;
  v9 = MEMORY[0x24BDF1F80];
  sub_21EBB7A70();
  v15[0] = v9;
  v15[1] = a1;
  v15[2] = MEMORY[0x24BDF5138];
  MEMORY[0x2207B8330](MEMORY[0x24BDF4AF8], v3, v15);
  sub_21EB67E04((uint64_t)v6, v3, (uint64_t)v8);
  v10 = *(void (**)(char *, uint64_t))(v13 + 8);
  v10(v6, v3);
  sub_21EB63794((uint64_t)v8, v3, v14);
  return ((uint64_t (*)(char *, uint64_t))v10)(v8, v3);
}

uint64_t sub_21EB7C964@<X0>(uint64_t a1@<X8>)
{
  uint64_t result;
  uint64_t v3;
  char v4;
  uint64_t v5;

  sub_21EB67308();
  swift_bridgeObjectRetain();
  result = sub_21EBB7878();
  *(_QWORD *)a1 = result;
  *(_QWORD *)(a1 + 8) = v3;
  *(_BYTE *)(a1 + 16) = v4 & 1;
  *(_QWORD *)(a1 + 24) = v5;
  return result;
}

uint64_t sub_21EB7C9CC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return sub_21EB7C7C4(*(_QWORD *)(a1 + 24), a2);
}

uint64_t sub_21EB7C9E0(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v3;
  _QWORD *v4;
  uint64_t (*v6)(void);

  v6 = (uint64_t (*)(void))((char *)a3 + *a3);
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v3 + 16) = v4;
  *v4 = v3;
  v4[1] = sub_21EB7F118;
  return v6();
}

uint64_t sub_21EB7CA34(uint64_t a1, uint64_t a2, uint64_t a3, int *a4)
{
  uint64_t v4;
  _QWORD *v5;
  uint64_t (*v7)(void);

  v7 = (uint64_t (*)(void))((char *)a4 + *a4);
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v4 + 16) = v5;
  *v5 = v4;
  v5[1] = sub_21EB7F118;
  return v7();
}

uint64_t sub_21EB7CA88(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;

  v6 = sub_21EBB7C38();
  if (__swift_getEnumTagSinglePayload(a1, 1, v6) == 1)
  {
    sub_21EB67980(a1, &qword_255478630);
  }
  else
  {
    sub_21EBB7C2C();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 8))(a1, v6);
  }
  if (*(_QWORD *)(a3 + 16))
  {
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_21EBB7BF0();
    swift_unknownObjectRelease();
  }
  v7 = swift_allocObject();
  *(_QWORD *)(v7 + 16) = a2;
  *(_QWORD *)(v7 + 24) = a3;
  return swift_task_create();
}

char *sub_21EB7CBCC(char *a1, int64_t a2, char a3)
{
  char **v3;
  char *result;

  result = sub_21EB7CBE8(a1, a2, a3, *v3);
  *v3 = result;
  return result;
}

char *sub_21EB7CBE8(char *result, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_255478A18);
    v10 = (char *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    *((_QWORD *)v10 + 2) = v8;
    *((_QWORD *)v10 + 3) = 2 * ((uint64_t)(v11 - 32) / 8);
  }
  else
  {
    v10 = (char *)MEMORY[0x24BEE4AF8];
  }
  v12 = v10 + 32;
  v13 = a4 + 32;
  if ((v5 & 1) != 0)
  {
    if (v10 != a4 || &v13[8 * v8] <= v12)
      memmove(v12, v13, 8 * v8);
    *((_QWORD *)a4 + 2) = 0;
  }
  else
  {
    memcpy(v12, v13, 8 * v8);
  }
  swift_release();
  return v10;
}

uint64_t sub_21EB7CCDC@<X0>(uint64_t a1@<X8>)
{
  uint64_t result;
  char v3;

  result = sub_21EBB768C();
  *(_QWORD *)a1 = result;
  *(_BYTE *)(a1 + 8) = v3 & 1;
  return result;
}

uint64_t sub_21EB7CD0C()
{
  return sub_21EBB7698();
}

void sub_21EB7CD38(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v6;

  v6 = (id)sub_21EBB7B48();
  swift_bridgeObjectRelease();
  objc_msgSend(a4, sel_populateWithIcon_string_, a1, v6);

}

uint64_t type metadata accessor for SSHKeyParameterSummaryEditor()
{
  return objc_opt_self();
}

uint64_t sub_21EB7CDC0()
{
  uint64_t v0;

  return swift_deallocObject();
}

void sub_21EB7CDE4()
{
  uint64_t v0;

  sub_21EB77088(*(void **)(v0 + 16));
}

uint64_t type metadata accessor for SSHKeyConfigurationView()
{
  uint64_t result;

  result = qword_255478710;
  if (!qword_255478710)
    return swift_getSingletonMetadata();
  return result;
}

void sub_21EB7CE24()
{
  sub_21EBB7650();
  OUTLINED_FUNCTION_5();
}

uint64_t sub_21EB7CE40()
{
  uint64_t v0;

  _Block_release(*(const void **)(v0 + 16));

  return swift_deallocObject();
}

uint64_t sub_21EB7CE6C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;

  v2 = *(_QWORD *)(v0 + 16);
  v3 = *(_QWORD *)(v0 + 24);
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v4;
  *v4 = v1;
  v4[1] = sub_21EB67A4C;
  return ((uint64_t (*)(uint64_t, uint64_t))((char *)&dword_255478620 + dword_255478620))(v2, v3);
}

uint64_t sub_21EB7CED4()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  int *v4;
  _QWORD *v5;

  v2 = v0[2];
  v3 = v0[3];
  v4 = (int *)v0[4];
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v5;
  *v5 = v1;
  v5[1] = sub_21EB7F118;
  return ((uint64_t (*)(uint64_t, uint64_t, int *))((char *)&dword_255478638 + dword_255478638))(v2, v3, v4);
}

uint64_t objectdestroy_6Tm_0()
{
  swift_unknownObjectRelease();
  OUTLINED_FUNCTION_13();
  return swift_deallocObject();
}

uint64_t sub_21EB7CF78(uint64_t a1)
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
  v7[1] = sub_21EB7F118;
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, int *))((char *)&dword_255478648 + dword_255478648))(a1, v4, v5, v6);
}

uint64_t sub_21EB7CFFC()
{
  OUTLINED_FUNCTION_12_0();
  return swift_deallocObject();
}

uint64_t sub_21EB7D01C(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  int *v4;
  _QWORD *v5;

  v4 = *(int **)(v1 + 16);
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_21EB67A4C;
  return ((uint64_t (*)(uint64_t, int *))((char *)&dword_255478658 + dword_255478658))(a1, v4);
}

uint64_t sub_21EB7D08C()
{
  return sub_21EB76AC8();
}

uint64_t sub_21EB7D094()
{
  return sub_21EB76B64();
}

uint64_t sub_21EB7D09C(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata accessor for SSHKeyConfigurationView();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

char *sub_21EB7D0D8(char *a1, char **a2, uint64_t a3)
{
  int v4;
  char *v5;
  char *v8;
  uint64_t v9;
  char *v10;
  _QWORD *v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;

  v4 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  v5 = *a2;
  *(_QWORD *)a1 = *a2;
  if ((v4 & 0x20000) != 0)
  {
    a1 = &v5[(v4 + 16) & ~(unint64_t)v4];
  }
  else
  {
    v8 = a2[3];
    *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 1);
    *((_QWORD *)a1 + 3) = v8;
    v9 = *(int *)(a3 + 24);
    v10 = &a1[v9];
    v11 = (char **)((char *)a2 + v9);
    v12 = v5;
    swift_retain();
    swift_retain();
    __swift_instantiateConcreteTypeFromMangledName(&qword_255478618);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v13 = sub_21EBB756C();
      (*(void (**)(char *, _QWORD *, uint64_t))(*(_QWORD *)(v13 - 8) + 16))(v10, v11, v13);
    }
    else
    {
      *(_QWORD *)v10 = *v11;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
    v14 = *(int *)(a3 + 28);
    v15 = &a1[v14];
    v16 = (uint64_t)a2 + v14;
    *v15 = *(_BYTE *)v16;
    *((_QWORD *)v15 + 1) = *(_QWORD *)(v16 + 8);
  }
  swift_retain();
  return a1;
}

uint64_t sub_21EB7D200(id *a1, uint64_t a2)
{
  char *v4;
  uint64_t v5;

  swift_release();
  swift_release();
  v4 = (char *)a1 + *(int *)(a2 + 24);
  __swift_instantiateConcreteTypeFromMangledName(&qword_255478618);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v5 = sub_21EBB756C();
    (*(void (**)(char *, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(v4, v5);
  }
  else
  {
    swift_release();
  }
  return swift_release();
}

uint64_t sub_21EB7D29C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  _QWORD *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  v6 = *(void **)a2;
  *(_QWORD *)a1 = *(_QWORD *)a2;
  v7 = *(_QWORD *)(a2 + 24);
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  *(_QWORD *)(a1 + 24) = v7;
  v8 = *(int *)(a3 + 24);
  v9 = (_QWORD *)(a1 + v8);
  v10 = (_QWORD *)(a2 + v8);
  v11 = v6;
  swift_retain();
  swift_retain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_255478618);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v12 = sub_21EBB756C();
    (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v12 - 8) + 16))(v9, v10, v12);
  }
  else
  {
    *v9 = *v10;
    swift_retain();
  }
  swift_storeEnumTagMultiPayload();
  v13 = *(int *)(a3 + 28);
  v14 = a1 + v13;
  v15 = a2 + v13;
  *(_BYTE *)v14 = *(_BYTE *)v15;
  *(_QWORD *)(v14 + 8) = *(_QWORD *)(v15 + 8);
  swift_retain();
  return a1;
}

uint64_t sub_21EB7D3A4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  _QWORD *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  v6 = *(void **)a1;
  v7 = *(void **)a2;
  *(_QWORD *)a1 = *(_QWORD *)a2;
  v8 = v7;

  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  swift_retain();
  swift_release();
  v9 = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = v9;
  swift_retain();
  swift_release();
  if (a1 != a2)
  {
    v10 = *(int *)(a3 + 24);
    v11 = (_QWORD *)(a1 + v10);
    v12 = (_QWORD *)(a2 + v10);
    sub_21EB67980(a1 + v10, &qword_255478618);
    __swift_instantiateConcreteTypeFromMangledName(&qword_255478618);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v13 = sub_21EBB756C();
      (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v13 - 8) + 16))(v11, v12, v13);
    }
    else
    {
      *v11 = *v12;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
  }
  v14 = *(int *)(a3 + 28);
  v15 = a1 + v14;
  v16 = a2 + v14;
  *(_BYTE *)v15 = *(_BYTE *)v16;
  *(_QWORD *)(v15 + 8) = *(_QWORD *)(v16 + 8);
  swift_retain();
  swift_release();
  return a1;
}

_OWORD *sub_21EB7D4D8(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  __int128 v6;
  uint64_t v7;
  char *v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;

  v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  v7 = *(int *)(a3 + 24);
  v8 = (char *)a1 + v7;
  v9 = (char *)a2 + v7;
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_255478618);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v11 = sub_21EBB756C();
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v11 - 8) + 32))(v8, v9, v11);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(v8, v9, *(_QWORD *)(*(_QWORD *)(v10 - 8) + 64));
  }
  *(_OWORD *)((char *)a1 + *(int *)(a3 + 28)) = *(_OWORD *)((char *)a2 + *(int *)(a3 + 28));
  return a1;
}

uint64_t sub_21EB7D59C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v6;
  uint64_t v7;
  void *v8;
  const void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  v6 = *(void **)a1;
  *(_QWORD *)a1 = *(_QWORD *)a2;

  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  swift_release();
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  swift_release();
  if (a1 != a2)
  {
    v7 = *(int *)(a3 + 24);
    v8 = (void *)(a1 + v7);
    v9 = (const void *)(a2 + v7);
    sub_21EB67980(a1 + v7, &qword_255478618);
    v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_255478618);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v11 = sub_21EBB756C();
      (*(void (**)(void *, const void *, uint64_t))(*(_QWORD *)(v11 - 8) + 32))(v8, v9, v11);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(v8, v9, *(_QWORD *)(*(_QWORD *)(v10 - 8) + 64));
    }
  }
  v12 = *(int *)(a3 + 28);
  v13 = a1 + v12;
  v14 = a2 + v12;
  *(_BYTE *)v13 = *(_BYTE *)v14;
  *(_QWORD *)(v13 + 8) = *(_QWORD *)(v14 + 8);
  swift_release();
  return a1;
}

uint64_t sub_21EB7D6B8()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_21EB7D6C4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v4;
  uint64_t v8;

  if ((_DWORD)a2 == 0x7FFFFFFF)
  {
    v4 = *(_QWORD *)(a1 + 16);
    if (v4 >= 0xFFFFFFFF)
      LODWORD(v4) = -1;
    return (v4 + 1);
  }
  else
  {
    v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_2554786B0);
    return __swift_getEnumTagSinglePayload(a1 + *(int *)(a3 + 24), a2, v8);
  }
}

uint64_t sub_21EB7D73C()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

void sub_21EB7D748(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v7;

  if (a3 == 0x7FFFFFFF)
  {
    *(_QWORD *)(a1 + 16) = (a2 - 1);
    OUTLINED_FUNCTION_11_1();
  }
  else
  {
    v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_2554786B0);
    __swift_storeEnumTagSinglePayload(a1 + *(int *)(a4 + 24), a2, a2, v7);
  }
}

void sub_21EB7D7B0()
{
  unint64_t v0;

  sub_21EB7D830();
  if (v0 <= 0x3F)
    swift_initStructMetadata();
}

void sub_21EB7D830()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_255478720)
  {
    sub_21EBB756C();
    v0 = sub_21EBB7524();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_255478720);
  }
}

uint64_t sub_21EB7D884()
{
  return swift_getOpaqueTypeConformance2();
}

void sub_21EB7D894(uint64_t a1@<X8>)
{
  sub_21EB777AC(a1);
  OUTLINED_FUNCTION_5();
}

uint64_t sub_21EB7D8B0()
{
  uint64_t v0;

  return sub_21EB77A80(*(_QWORD *)(v0 + 16));
}

uint64_t sub_21EB7D8B8(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for SSHKeyConfigurationView();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_21EB7D900(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for SSHKeyConfigurationView();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_21EB7D944()
{
  uint64_t v0;
  uint64_t v1;

  v0 = OUTLINED_FUNCTION_7_3();
  v1 = OUTLINED_FUNCTION_9_0(v0);
  return sub_21EB77E04(v1);
}

void *sub_21EB7D96C@<X0>(void *a1@<X8>)
{
  uint64_t v1;

  return sub_21EB77F70(*(_QWORD *)(v1 + 16), a1);
}

unint64_t sub_21EB7D974()
{
  unint64_t result;

  result = qword_2554787C0;
  if (!qword_2554787C0)
  {
    result = MEMORY[0x2207B8330](&unk_21EBBC984, &type metadata for SSHKeyGenerationView);
    atomic_store(result, (unint64_t *)&qword_2554787C0);
  }
  return result;
}

uint64_t sub_21EB7D9B4(void *a1)
{
  OUTLINED_FUNCTION_7_3();
  return sub_21EB78C24(a1);
}

uint64_t sub_21EB7D9EC(uint64_t a1)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 64);
  swift_retain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  v3 = v2;
  swift_retain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t sub_21EB7DA94(uint64_t a1)
{
  void *v2;

  v2 = *(void **)(a1 + 64);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_release();
  swift_release();

  swift_release();
  swift_release();
  return a1;
}

uint64_t sub_21EB7DB3C()
{
  uint64_t v0;

  return sub_21EB77BC8(*(_QWORD *)(v0 + 16));
}

uint64_t sub_21EB7DB48()
{
  return sub_21EB7DCC4((uint64_t (*)(uint64_t))sub_21EB77D6C);
}

void sub_21EB7DB54(uint64_t a1@<X8>)
{
  sub_21EB785B0(a1);
  OUTLINED_FUNCTION_5();
}

uint64_t sub_21EB7DB70@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_21EB7803C(*(void **)(v1 + 16), a1);
}

uint64_t sub_21EB7DB78(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  if (a2)
  {
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_21EB7DBA8(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  if (a2)
  {
    swift_bridgeObjectRetain();
    return swift_bridgeObjectRetain();
  }
  return result;
}

uint64_t objectdestroy_22Tm()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  id *v3;
  char *v4;
  uint64_t v5;

  v1 = OUTLINED_FUNCTION_7_3();
  v2 = *(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80);
  v3 = (id *)(v0 + ((v2 + 16) & ~v2));

  swift_release();
  swift_release();
  v4 = (char *)v3 + *(int *)(v1 + 24);
  __swift_instantiateConcreteTypeFromMangledName(&qword_255478618);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v5 = sub_21EBB756C();
    (*(void (**)(char *, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(v4, v5);
  }
  else
  {
    swift_release();
  }
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_21EB7DCB8()
{
  return sub_21EB7DCC4((uint64_t (*)(uint64_t))sub_21EB78A90);
}

uint64_t sub_21EB7DCC4(uint64_t (*a1)(uint64_t))
{
  uint64_t v1;
  uint64_t v2;

  v1 = OUTLINED_FUNCTION_7_3();
  v2 = OUTLINED_FUNCTION_9_0(v1);
  return a1(v2);
}

void sub_21EB7DCEC()
{
  uint64_t v0;

  sub_21EB788DC(*(void **)(v0 + 16));
}

void sub_21EB7DCF4(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;

  v4 = (id)sub_21EBB7B48();
  swift_bridgeObjectRelease();
  objc_msgSend(a3, sel_setString_, v4);

}

uint64_t destroy for SSHKeyGenerationView(uint64_t a1)
{
  swift_release();
  swift_release();
  swift_release();
  swift_release();

  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for SSHKeyGenerationView(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;

  v3 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v3;
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  *(_BYTE *)(a1 + 32) = *(_BYTE *)(a2 + 32);
  v4 = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 48) = v4;
  v5 = *(void **)(a2 + 64);
  *(_QWORD *)(a1 + 56) = *(_QWORD *)(a2 + 56);
  *(_QWORD *)(a1 + 64) = v5;
  v6 = *(_QWORD *)(a2 + 80);
  *(_QWORD *)(a1 + 72) = *(_QWORD *)(a2 + 72);
  *(_QWORD *)(a1 + 80) = v6;
  v7 = *(_QWORD *)(a2 + 96);
  *(_QWORD *)(a1 + 88) = *(_QWORD *)(a2 + 88);
  *(_QWORD *)(a1 + 96) = v7;
  v8 = *(_QWORD *)(a2 + 112);
  *(_QWORD *)(a1 + 104) = *(_QWORD *)(a2 + 104);
  *(_QWORD *)(a1 + 112) = v8;
  v9 = *(_QWORD *)(a2 + 128);
  *(_QWORD *)(a1 + 120) = *(_QWORD *)(a2 + 120);
  *(_QWORD *)(a1 + 128) = v9;
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  v10 = v5;
  swift_retain();
  swift_bridgeObjectRetain();
  swift_retain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for SSHKeyGenerationView(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;

  v4 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v4;
  swift_retain();
  swift_release();
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  swift_retain();
  swift_release();
  *(_BYTE *)(a1 + 32) = *(_BYTE *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  swift_retain();
  swift_release();
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(a1 + 56) = *(_QWORD *)(a2 + 56);
  swift_retain();
  swift_release();
  v5 = *(void **)(a1 + 64);
  v6 = *(void **)(a2 + 64);
  *(_QWORD *)(a1 + 64) = v6;
  v7 = v6;

  *(_QWORD *)(a1 + 72) = *(_QWORD *)(a2 + 72);
  swift_retain();
  swift_release();
  *(_QWORD *)(a1 + 80) = *(_QWORD *)(a2 + 80);
  *(_QWORD *)(a1 + 88) = *(_QWORD *)(a2 + 88);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 96) = *(_QWORD *)(a2 + 96);
  swift_retain();
  swift_release();
  *(_QWORD *)(a1 + 104) = *(_QWORD *)(a2 + 104);
  *(_QWORD *)(a1 + 112) = *(_QWORD *)(a2 + 112);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 120) = *(_QWORD *)(a2 + 120);
  *(_QWORD *)(a1 + 128) = *(_QWORD *)(a2 + 128);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t assignWithTake for SSHKeyGenerationView(uint64_t a1, uint64_t a2)
{
  void *v4;
  uint64_t v5;
  uint64_t v6;

  *(_OWORD *)a1 = *(_OWORD *)a2;
  swift_release();
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  swift_release();
  *(_BYTE *)(a1 + 32) = *(_BYTE *)(a2 + 32);
  swift_release();
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  swift_release();
  v4 = *(void **)(a1 + 64);
  *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);

  *(_QWORD *)(a1 + 72) = *(_QWORD *)(a2 + 72);
  swift_release();
  *(_QWORD *)(a1 + 80) = *(_QWORD *)(a2 + 80);
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 88) = *(_OWORD *)(a2 + 88);
  swift_release();
  v5 = *(_QWORD *)(a2 + 112);
  *(_QWORD *)(a1 + 104) = *(_QWORD *)(a2 + 104);
  *(_QWORD *)(a1 + 112) = v5;
  swift_bridgeObjectRelease();
  v6 = *(_QWORD *)(a2 + 128);
  *(_QWORD *)(a1 + 120) = *(_QWORD *)(a2 + 120);
  *(_QWORD *)(a1 + 128) = v6;
  swift_bridgeObjectRelease();
  return a1;
}

ValueMetadata *type metadata accessor for SSHKeyGenerationView()
{
  return &type metadata for SSHKeyGenerationView;
}

uint64_t destroy for SSHKeyValueRowView(uint64_t a1, uint64_t a2)
{
  return sub_21EB7ED24(a1, a2, (uint64_t (*)(_QWORD))MEMORY[0x24BEE4BC0]);
}

uint64_t initializeWithCopy for SSHKeyValueRowView(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;

  v3 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v3;
  v4 = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = v4;
  *(_BYTE *)(a1 + 32) = *(_BYTE *)(a2 + 32);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for SSHKeyValueRowView(uint64_t a1, uint64_t a2)
{
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + 32) = *(_BYTE *)(a2 + 32);
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

uint64_t assignWithTake for SSHKeyValueRowView(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;

  v4 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  v5 = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = v5;
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + 32) = *(_BYTE *)(a2 + 32);
  return a1;
}

uint64_t getEnumTagSinglePayload for SSHKeyValueRowView(uint64_t a1, int a2)
{
  unint64_t v2;

  if (a2)
  {
    if (a2 < 0 && *(_BYTE *)(a1 + 33))
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

uint64_t storeEnumTagSinglePayload for SSHKeyValueRowView(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_QWORD *)(result + 16) = 0;
    *(_QWORD *)(result + 24) = 0;
    *(_BYTE *)(result + 32) = 0;
    *(_QWORD *)result = a2 ^ 0x80000000;
    *(_QWORD *)(result + 8) = 0;
    if (a3 < 0)
      *(_BYTE *)(result + 33) = 1;
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
    *(_BYTE *)(result + 33) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for SSHKeyValueRowView()
{
  return &type metadata for SSHKeyValueRowView;
}

uint64_t sub_21EB7E260()
{
  void (*v0)(uint64_t);

  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_255478768);
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_255478760);
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2554787A8);
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_255478758);
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_255478780);
  sub_21EB72A50(&qword_255478788, &qword_255478758);
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_255478790);
  sub_21EB72A50(&qword_255478798, &qword_255478790);
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_1_2();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2554787B0);
  sub_21EBB7818();
  v0 = (void (*)(uint64_t))MEMORY[0x24BDF0620];
  sub_21EB72A50(&qword_2554787B8, &qword_2554787B0);
  sub_21EB65BBC(&qword_255477960, v0);
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_1_2();
  sub_21EB67308();
  return OUTLINED_FUNCTION_1_2();
}

uint64_t sub_21EB7E404()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_21EB7E414()
{
  return swift_getOpaqueTypeConformance2();
}

double sub_21EB7E424@<D0>(uint64_t a1@<X8>)
{
  double result;

  *(_QWORD *)&result = sub_21EB7A748(a1).n128_u64[0];
  return result;
}

uint64_t sub_21EB7E42C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_21EB7ABBC(*(_QWORD *)(v1 + 16), a1);
}

uint64_t sub_21EB7E434()
{
  uint64_t v0;

  return sub_21EB7B4F0(*(const void **)(v0 + 16));
}

uint64_t sub_21EB7E440()
{
  return sub_21EB7BA3C();
}

unint64_t sub_21EB7E448()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;
  _QWORD v3[5];

  result = qword_255478900;
  if (!qword_255478900)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2554788C8);
    v2 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2554788C0);
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2554788B8);
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2554788B0);
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2554788A8);
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2554788E0);
    sub_21EB72A50(&qword_2554788E8, &qword_2554788A8);
    sub_21EB72A50(&qword_2554788F0, &qword_2554788E0);
    v3[3] = swift_getOpaqueTypeConformance2();
    v3[4] = sub_21EB67308();
    swift_getOpaqueTypeConformance2();
    v3[1] = v2;
    v3[2] = swift_getOpaqueTypeConformance2();
    v3[0] = swift_getOpaqueTypeConformance2();
    result = MEMORY[0x2207B8330](MEMORY[0x24BDF3F50], v1, v3);
    atomic_store(result, (unint64_t *)&qword_255478900);
  }
  return result;
}

unint64_t sub_21EB7E5C4()
{
  unint64_t result;

  result = qword_255478908;
  if (!qword_255478908)
  {
    result = MEMORY[0x2207B8330](&unk_21EBBCB3C, &type metadata for SSHKeyGenerationView.KeyFormat);
    atomic_store(result, (unint64_t *)&qword_255478908);
  }
  return result;
}

void sub_21EB7E604()
{
  sub_21EB7B788();
  OUTLINED_FUNCTION_5();
}

uint64_t sub_21EB7E624()
{
  uint64_t v0;

  return sub_21EB7C474(v0 + 16);
}

uint64_t block_copy_helper_3(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_3()
{
  return swift_release();
}

uint64_t sub_21EB7E644()
{
  uint64_t v0;

  OUTLINED_FUNCTION_12_0();
  OUTLINED_FUNCTION_13();
  swift_release();
  swift_release();

  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return swift_deallocObject();
}

void sub_21EB7E6B0()
{
  uint64_t v0;

  (*(void (**)(_QWORD))(v0 + 16))(*(_QWORD *)(v0 + 152));
  OUTLINED_FUNCTION_5();
}

uint64_t sub_21EB7E6D0()
{
  uint64_t v0;

  return sub_21EB7AE18(*(const void **)(v0 + 16));
}

void sub_21EB7E6D8(uint64_t a1@<X8>)
{
  sub_21EB7B04C(a1);
  OUTLINED_FUNCTION_5();
}

unint64_t sub_21EB7E6F4()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD v6[4];

  result = qword_255478948;
  if (!qword_255478948)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_255478940);
    sub_21EB72A50(&qword_2554779B0, &qword_2554779B8);
    v3 = v2;
    v4 = __swift_instantiateConcreteTypeFromMangledNameAbstract((uint64_t *)&unk_255477990);
    sub_21EB72A50(&qword_255478DC0, (uint64_t *)&unk_255477990);
    v6[2] = v4;
    v6[3] = v5;
    v6[0] = v3;
    v6[1] = swift_getOpaqueTypeConformance2();
    result = MEMORY[0x2207B8330](MEMORY[0x24BDEF3E0], v1, v6);
    atomic_store(result, (unint64_t *)&qword_255478948);
  }
  return result;
}

uint64_t sub_21EB7E7C4()
{
  return sub_21EB7C428();
}

void sub_21EB7E7D0()
{
  uint64_t v0;

  (*(void (**)(_QWORD))(v0 + 16))(0);
  OUTLINED_FUNCTION_5();
}

uint64_t sub_21EB7E7F4()
{
  uint64_t v0;

  return sub_21EB7BAA4(v0 + 16);
}

uint64_t sub_21EB7E800@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_21EB7BEEC(v1 + 16, a1);
}

uint64_t objectdestroy_38Tm()
{
  uint64_t v0;

  OUTLINED_FUNCTION_12_0();
  OUTLINED_FUNCTION_13();
  swift_release();
  swift_release();

  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_21EB7E870()
{
  return sub_21EB7C2B0();
}

uint64_t sub_21EB7E878(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  if (a2)
  {
    swift_bridgeObjectRetain();
    return swift_retain();
  }
  return result;
}

uint64_t sub_21EB7E8A8(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  if (a2)
  {
    swift_bridgeObjectRelease();
    return swift_release();
  }
  return result;
}

uint64_t sub_21EB7E8D8()
{
  return sub_21EB7C0E8();
}

unint64_t sub_21EB7E8E0()
{
  unint64_t result;
  uint64_t v1;

  result = qword_255478978;
  if (!qword_255478978)
  {
    v1 = sub_21EB6AA68(255, &qword_255478958);
    result = MEMORY[0x2207B8330](MEMORY[0x24BEE5BD8], v1);
    atomic_store(result, (unint64_t *)&qword_255478978);
  }
  return result;
}

void sub_21EB7E930(unint64_t *a1, uint64_t *a2, uint64_t (*a3)(void), uint64_t a4)
{
  uint64_t v7;
  uint64_t v8;

  if (!*a1)
  {
    v7 = __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    v8 = a3();
    atomic_store(MEMORY[0x2207B8330](a4, v7, &v8), a1);
  }
  OUTLINED_FUNCTION_5_5();
}

unint64_t sub_21EB7E990()
{
  unint64_t result;
  uint64_t v1;
  unint64_t v2;
  uint64_t v3;
  _QWORD v4[2];

  result = qword_255478988;
  if (!qword_255478988)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_255478990);
    v2 = sub_21EB7EA14();
    sub_21EB72A50(&qword_2554789B8, &qword_2554789C0);
    v4[0] = v2;
    v4[1] = v3;
    result = MEMORY[0x2207B8330](MEMORY[0x24BDED308], v1, v4);
    atomic_store(result, (unint64_t *)&qword_255478988);
  }
  return result;
}

unint64_t sub_21EB7EA14()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;
  _QWORD v3[2];

  result = qword_255478998;
  if (!qword_255478998)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2554789A0);
    sub_21EB72A50(&qword_2554789A8, &qword_2554789B0);
    v3[0] = MEMORY[0x24BDF1F80];
    v3[1] = v2;
    result = MEMORY[0x2207B8330](MEMORY[0x24BDED308], v1, v3);
    atomic_store(result, (unint64_t *)&qword_255478998);
  }
  return result;
}

unint64_t sub_21EB7EA98()
{
  unint64_t result;

  result = qword_2554789F0;
  if (!qword_2554789F0)
  {
    result = MEMORY[0x2207B8330](&unk_21EBBCAFC, &type metadata for SSHKeyGenerationView.KeyFormat);
    atomic_store(result, (unint64_t *)&qword_2554789F0);
  }
  return result;
}

unint64_t sub_21EB7EAD4()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;

  result = qword_2554789F8;
  if (!qword_2554789F8)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2554789E8);
    v2 = MEMORY[0x24BDF1F80];
    result = MEMORY[0x2207B8330](MEMORY[0x24BDF4A08], v1, &v2);
    atomic_store(result, (unint64_t *)&qword_2554789F8);
  }
  return result;
}

uint64_t sub_21EB7EB34@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_21EB7987C(*(_QWORD *)(v1 + 16), a1);
}

void sub_21EB7EB3C(uint64_t a1@<X8>)
{
  uint64_t v1;

  sub_21EB79654(*(_QWORD *)(v1 + 16), a1);
}

unint64_t sub_21EB7EB44()
{
  unint64_t result;
  uint64_t v1;
  unint64_t v2;
  uint64_t v3;
  _QWORD v4[2];

  result = qword_255478A78;
  if (!qword_255478A78)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_255478A70);
    v2 = sub_21EB7EBC8();
    sub_21EB72A50(&qword_255478AA0, &qword_255478AA8);
    v4[0] = v2;
    v4[1] = v3;
    result = MEMORY[0x2207B8330](MEMORY[0x24BDED308], v1, v4);
    atomic_store(result, (unint64_t *)&qword_255478A78);
  }
  return result;
}

unint64_t sub_21EB7EBC8()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;
  uint64_t OpaqueTypeConformance2;
  uint64_t v4;
  _QWORD v5[6];

  result = qword_255478A80;
  if (!qword_255478A80)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_255478A88);
    v2 = sub_21EBB7800();
    v5[2] = MEMORY[0x24BDF1FA8];
    v5[3] = v2;
    v5[4] = MEMORY[0x24BDF1F80];
    v5[5] = MEMORY[0x24BDF04A0];
    OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
    sub_21EB72A50(&qword_255478A90, &qword_255478A98);
    v5[0] = OpaqueTypeConformance2;
    v5[1] = v4;
    result = MEMORY[0x2207B8330](MEMORY[0x24BDED308], v1, v5);
    atomic_store(result, (unint64_t *)&qword_255478A80);
  }
  return result;
}

void sub_21EB7EC8C(_QWORD *a1@<X8>)
{
  uint64_t v2;

  sub_21EBB7638();
  *a1 = v2;
  OUTLINED_FUNCTION_5();
}

void sub_21EB7ECB0()
{
  sub_21EBB7644();
  OUTLINED_FUNCTION_5();
}

void sub_21EB7ECD0(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, a1, v5);
  OUTLINED_FUNCTION_5();
}

uint64_t sub_21EB7ED10()
{
  return swift_allocateGenericValueMetadata();
}

uint64_t sub_21EB7ED18(uint64_t a1, uint64_t a2)
{
  return sub_21EB7ED24(a1, a2, (uint64_t (*)(_QWORD))MEMORY[0x24BEE4EF8]);
}

uint64_t sub_21EB7ED24(uint64_t a1, uint64_t a2, uint64_t (*a3)(_QWORD))
{
  swift_bridgeObjectRelease();
  return a3(*(_QWORD *)(a1 + 24));
}

uint64_t sub_21EB7ED5C(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  v3 = *(_QWORD *)(a2 + 24);
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  *(_QWORD *)(a1 + 24) = v3;
  swift_bridgeObjectRetain();
  swift_retain();
  return a1;
}

_QWORD *sub_21EB7EDA4(_QWORD *a1, _QWORD *a2)
{
  uint64_t v4;

  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v4 = a2[3];
  a1[2] = a2[2];
  a1[3] = v4;
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

uint64_t sub_21EB7EE14(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  swift_bridgeObjectRelease();
  v4 = *(_QWORD *)(a2 + 24);
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  *(_QWORD *)(a1 + 24) = v4;
  swift_release();
  return a1;
}

uint64_t sub_21EB7EE60(uint64_t a1, int a2)
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

uint64_t sub_21EB7EEA0(uint64_t result, int a2, int a3)
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

uint64_t type metadata accessor for SSHKeySection(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for SSHKeySection);
}

_QWORD *__swift_memcpy8_8(_QWORD *result, _QWORD *a2)
{
  *result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for SSHKeyGenerationView.KeyFormat(uint64_t *a1, int a2)
{
  uint64_t v2;

  if (a2)
  {
    if (a2 < 0 && *((_BYTE *)a1 + 8))
    {
      LODWORD(v2) = *(_DWORD *)a1 + 0x7FFFFFFF;
    }
    else
    {
      v2 = *a1;
      if ((unint64_t)*a1 >= 0xFFFFFFFF)
        LODWORD(v2) = -1;
    }
  }
  else
  {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for SSHKeyGenerationView.KeyFormat(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 8) = 1;
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
    *(_BYTE *)(result + 8) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for SSHKeyGenerationView.KeyFormat()
{
  return &type metadata for SSHKeyGenerationView.KeyFormat;
}

void sub_21EB7EF88()
{
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2554788C8);
  sub_21EB7E448();
  sub_21EB7E5C4();
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_5_5();
}

unint64_t sub_21EB7EFE0()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD v5[2];

  result = qword_255478B50;
  if (!qword_255478B50)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_255478B58);
    sub_21EB72A50(&qword_255478A48, &qword_255478A38);
    v3 = v2;
    sub_21EB72A50(&qword_255478A50, &qword_255478A20);
    v5[0] = v3;
    v5[1] = v4;
    result = MEMORY[0x2207B8330](MEMORY[0x24BDEF3E0], v1, v5);
    atomic_store(result, (unint64_t *)&qword_255478B50);
  }
  return result;
}

uint64_t sub_21EB7F07C()
{
  return swift_getOpaqueTypeConformance2();
}

void sub_21EB7F0B4(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  _QWORD v3[3];

  v1 = *(_QWORD *)(a1 + 8);
  v2 = sub_21EBB7A94();
  v3[0] = MEMORY[0x24BDF1F80];
  v3[1] = v1;
  v3[2] = MEMORY[0x24BDF5138];
  MEMORY[0x2207B8330](MEMORY[0x24BDF4AF8], v2, v3);
  OUTLINED_FUNCTION_5_5();
}

uint64_t OUTLINED_FUNCTION_1_2()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t OUTLINED_FUNCTION_7_3()
{
  return type metadata accessor for SSHKeyConfigurationView();
}

uint64_t OUTLINED_FUNCTION_9_0(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  v2 = *(unsigned __int8 *)(*(_QWORD *)(a1 - 8) + 80);
  return v1 + ((v2 + 16) & ~v2);
}

uint64_t OUTLINED_FUNCTION_12_0()
{
  return swift_release();
}

uint64_t OUTLINED_FUNCTION_13()
{
  return swift_release();
}

uint64_t OUTLINED_FUNCTION_15(uint64_t a1, unint64_t *a2)
{
  return sub_21EB6AA68(0, a2);
}

uint64_t OUTLINED_FUNCTION_16()
{
  return sub_21EBB7B48();
}

void *sub_21EB7F1A8@<X0>(double a1@<X0>, char a2@<W1>, double a3@<X2>, char a4@<W3>, double a5@<X4>, char a6@<W5>, double a7@<X6>, char a8@<W7>, uint64_t a9@<X8>, double a10, char a11, double a12, char a13)
{
  uint64_t v13;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  _BYTE __src[112];

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
    sub_21EBB7C74();
    v23 = (void *)sub_21EBB7830();
    sub_21EBB7500();

  }
  sub_21EBB75F0();
  v24 = __swift_instantiateConcreteTypeFromMangledName(&qword_2554779B8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v24 - 8) + 16))(a9, v13, v24);
  v25 = __swift_instantiateConcreteTypeFromMangledName(&qword_255478160);
  return memcpy((void *)(a9 + *(int *)(v25 + 36)), __src, 0x70uLL);
}

uint64_t sub_21EB7F354@<X0>(double a1@<X0>, char a2@<W1>, double a3@<X2>, char a4@<W3>, double a5@<X4>, char a6@<W5>, double a7@<X6>, char a8@<W7>, uint64_t a9@<X8>, double a10, char a11, double a12, char a13)
{
  __int128 *v13;
  void *v23;
  __int128 v24;
  __int128 v25;
  _BYTE __src[112];
  __int128 v28;
  __int128 v29;
  uint64_t v30;
  _BYTE v31[32];

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
    sub_21EBB7C74();
    v23 = (void *)sub_21EBB7830();
    sub_21EBB7500();

  }
  sub_21EBB75F0();
  v24 = v13[1];
  v28 = *v13;
  v29 = v24;
  sub_21EB8341C((uint64_t)&v28, (uint64_t)v31);
  v30 = *((_QWORD *)&v29 + 1);
  v25 = v13[1];
  *(_OWORD *)a9 = *v13;
  *(_OWORD *)(a9 + 16) = v25;
  *(_BYTE *)(a9 + 32) = *((_BYTE *)v13 + 32);
  memcpy((void *)(a9 + 40), __src, 0x70uLL);
  sub_21EB83458((uint64_t)v31);
  return sub_21EB83488((uint64_t)&v30);
}

uint64_t sub_21EB7F504(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t result;
  uint64_t v10;
  uint64_t (*v11)(_BYTE *, _QWORD);
  unint64_t *v12;
  unint64_t v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  _BYTE v22[32];
  uint64_t v23;

  v4 = sub_21EBB7488();
  v17 = *(_QWORD *)(v4 - 8);
  v18 = v4;
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)&v16 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_21EBB7494();
  sub_21EB65BBC(&qword_255478E98, (void (*)(uint64_t))MEMORY[0x24BDCF428]);
  v7 = sub_21EBB7C50();
  if (!v7)
  {
    swift_bridgeObjectRelease();
    return MEMORY[0x24BEE4AF8];
  }
  v8 = v7;
  v23 = MEMORY[0x24BEE4AF8];
  sub_21EBB7D34();
  result = sub_21EBB7C44();
  if (v8 < 0)
    goto LABEL_15;
  v16 = v2;
  v20 = a2 & 0xFFFFFFFFFFFFFF8;
  v21 = a2 & 0xC000000000000001;
  v19 = a2 + 32;
  v10 = a2;
  while (1)
  {
    v11 = (uint64_t (*)(_BYTE *, _QWORD))sub_21EBB7C68();
    v13 = *v12;
    result = v11(v22, 0);
    if (v21)
    {
      MEMORY[0x2207B7958](v13, a2);
      goto LABEL_9;
    }
    if ((v13 & 0x8000000000000000) != 0)
      break;
    if (v13 >= *(_QWORD *)(v20 + 16))
      goto LABEL_14;
    v14 = *(id *)(v19 + 8 * v13);
LABEL_9:
    sub_21EBB7D1C();
    sub_21EBB7D40();
    sub_21EBB7D4C();
    sub_21EBB7D28();
    sub_21EBB7C5C();
    --v8;
    a2 = v10;
    if (!v8)
    {
      (*(void (**)(char *, uint64_t))(v17 + 8))(v6, v18);
      v15 = v23;
      swift_bridgeObjectRelease();
      return v15;
    }
  }
  __break(1u);
LABEL_14:
  __break(1u);
LABEL_15:
  __break(1u);
  return result;
}

uint64_t WFAccountAccessResource.accountConfigurationView.getter()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v11;

  v2 = OUTLINED_FUNCTION_2_5();
  MEMORY[0x24BDAC7A8](v2);
  OUTLINED_FUNCTION_8_4();
  v4 = (uint64_t *)(v1 + *(int *)(v3 + 28));
  *v4 = swift_getKeyPath();
  __swift_instantiateConcreteTypeFromMangledName(&qword_255478B60);
  swift_storeEnumTagMultiPayload();
  v5 = v1 + *(int *)(v2 + 32);
  *(_QWORD *)v5 = swift_getKeyPath();
  *(_BYTE *)(v5 + 8) = 0;
  v6 = *(int *)(v2 + 36);
  v7 = v0;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_255478B68);
  sub_21EBB79C8();
  *(_OWORD *)(v1 + v6) = v11;
  *(_QWORD *)v1 = v7;
  objc_msgSend(v7, sel_accountClass);
  swift_getObjCClassMetadata();
  sub_21EB820A0();
  v8 = swift_dynamicCastMetatypeUnconditional();
  *(_QWORD *)(v1 + 8) = v8;
  v9 = swift_allocObject();
  *(_QWORD *)(v9 + 16) = v8;
  *(_QWORD *)(v1 + 16) = sub_21EB820EC;
  *(_QWORD *)(v1 + 24) = v9;
  *(_BYTE *)(v1 + 32) = 0;
  sub_21EB65BBC(&qword_255478B78, (void (*)(uint64_t))type metadata accessor for AccountManagementView);
  return sub_21EBB7A34();
}

uint64_t type metadata accessor for AccountManagementView()
{
  uint64_t result;

  result = qword_255478CB8;
  if (!qword_255478CB8)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_21EB7F8C4(uint64_t a1)
{
  uint64_t v1;
  void *ObjCClassFromMetadata;
  uint64_t v3;
  void *v4;
  id v5;
  _QWORD aBlock[6];

  *(_OWORD *)(v1 + 40) = 0u;
  *(_OWORD *)(v1 + 24) = 0u;
  *(_QWORD *)(v1 + 16) = a1;
  ObjCClassFromMetadata = (void *)swift_getObjCClassFromMetadata();
  v3 = swift_allocObject();
  swift_weakInit();
  aBlock[4] = sub_21EB83728;
  aBlock[5] = v3;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_21EB83A60;
  aBlock[3] = &block_descriptor_27;
  v4 = _Block_copy(aBlock);
  swift_release();
  v5 = objc_msgSend(ObjCClassFromMetadata, sel_addAccountObserver_, v4);
  _Block_release(v4);
  sub_21EBB7CE0();
  swift_unknownObjectRelease();
  swift_beginAccess();
  sub_21EB83730((uint64_t)aBlock, v1 + 24);
  swift_endAccess();
  return v1;
}

uint64_t sub_21EB7F9E0()
{
  uint64_t result;

  swift_beginAccess();
  result = swift_weakLoadStrong();
  if (result)
  {
    type metadata accessor for AccountListViewModel();
    sub_21EB65BBC(&qword_255478DA8, (void (*)(uint64_t))type metadata accessor for AccountListViewModel);
    sub_21EBB750C();
    swift_release();
    sub_21EBB7518();
    return swift_release();
  }
  return result;
}

uint64_t sub_21EB7FA78()
{
  uint64_t v0;
  void *ObjCClassFromMetadata;
  __int128 v3;
  uint64_t v4;
  __int128 v5;
  uint64_t v6;

  swift_beginAccess();
  sub_21EB83818(v0 + 24, (uint64_t)&v3, &qword_255478EA0);
  if (v4)
  {
    sub_21EB836D0(&v3, &v5);
    ObjCClassFromMetadata = (void *)swift_getObjCClassFromMetadata();
    __swift_project_boxed_opaque_existential_0(&v5, v6);
    objc_msgSend(ObjCClassFromMetadata, sel_removeAccountObserver_, sub_21EBB7D7C());
    swift_unknownObjectRelease();
    __swift_destroy_boxed_opaque_existential_0((uint64_t)&v5);
  }
  else
  {
    sub_21EB67980((uint64_t)&v3, &qword_255478EA0);
  }
  sub_21EB67980(v0 + 24, &qword_255478EA0);
  return v0;
}

uint64_t sub_21EB7FB54()
{
  sub_21EB7FA78();
  return swift_deallocClassInstance();
}

uint64_t sub_21EB7FB70()
{
  id v0;
  uint64_t v1;

  v0 = objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_accounts);
  sub_21EB820A0();
  v1 = sub_21EBB7BD8();

  return v1;
}

uint64_t sub_21EB7FBC8()
{
  id v0;
  uint64_t v1;

  v0 = objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_localizedServiceName);
  v1 = sub_21EBB7B60();

  return v1;
}

uint64_t sub_21EB7FC20@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  type metadata accessor for AccountListViewModel();
  result = sub_21EBB750C();
  *a1 = result;
  return result;
}

uint64_t sub_21EB7FC5C(uint64_t a1)
{
  type metadata accessor for AccountListViewModel();
  swift_allocObject();
  return sub_21EB7F8C4(a1);
}

uint64_t sub_21EB7FC98@<X0>(uint64_t a1@<X8>)
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
  uint64_t OpaqueTypeConformance2;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  unint64_t v30;
  unint64_t v31;

  v26 = a1;
  v2 = sub_21EBB7818();
  v25 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v4 = (char *)&v23 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_255478D08);
  v24 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)&v23 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v27 = v1;
  v23 = __swift_instantiateConcreteTypeFromMangledName(&qword_255478D10);
  v8 = __swift_instantiateConcreteTypeFromMangledNameAbstract((uint64_t *)&unk_255478D18);
  v9 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_255478780);
  v10 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_255478D28);
  v11 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_255478D30);
  v12 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_255478D38);
  v13 = sub_21EBB7584();
  v14 = sub_21EB82B3C();
  v28 = v12;
  v29 = v13;
  v30 = v14;
  v31 = MEMORY[0x24BDEC720];
  OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
  v16 = sub_21EB67308();
  v28 = v11;
  v29 = MEMORY[0x24BEE0D00];
  v30 = OpaqueTypeConformance2;
  v31 = v16;
  v17 = swift_getOpaqueTypeConformance2();
  v28 = v10;
  v29 = v17;
  v18 = swift_getOpaqueTypeConformance2();
  v19 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_255478790);
  sub_21EB72A50(&qword_255478798, &qword_255478790);
  v28 = v19;
  v29 = v20;
  v21 = swift_getOpaqueTypeConformance2();
  v28 = v8;
  v29 = v9;
  v30 = v18;
  v31 = v21;
  swift_getOpaqueTypeConformance2();
  sub_21EBB759C();
  sub_21EBB780C();
  sub_21EB72A50(qword_255478D70, &qword_255478D08);
  sub_21EB65BBC(&qword_255477960, (void (*)(uint64_t))MEMORY[0x24BDF0620]);
  sub_21EBB7884();
  (*(void (**)(char *, uint64_t))(v25 + 8))(v4, v2);
  return (*(uint64_t (**)(char *, uint64_t))(v24 + 8))(v7, v5);
}

uint64_t sub_21EB7FF40@<X0>(char *a1@<X0>, uint64_t a2@<X8>)
{
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
  char *v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t KeyPath;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  char *v31;
  unint64_t v32;
  unint64_t v33;
  id v34;
  void *v35;
  void *v36;
  id v37;
  uint64_t v38;
  char *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t OpaqueTypeConformance2;
  unint64_t v48;
  uint64_t v49;
  char *v50;
  uint64_t v51;
  uint64_t v52;
  char *v53;
  uint64_t v54;
  uint64_t v55;
  char *v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  char *v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  char *v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  char *v73;
  uint64_t v74;
  uint64_t v75;
  char *v76;
  uint64_t v77;
  uint64_t v78;
  char *v79;
  uint64_t v80;
  char *v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  unint64_t v85;
  uint64_t v86;
  uint64_t v87;

  v80 = a2;
  v3 = sub_21EBB76BC();
  v77 = *(_QWORD *)(v3 - 8);
  v78 = v3;
  MEMORY[0x24BDAC7A8](v3);
  v76 = (char *)&v63 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v64 = sub_21EBB7584();
  v65 = *(_QWORD *)(v64 - 8);
  MEMORY[0x24BDAC7A8](v64);
  v63 = (char *)&v63 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_21EBB7AA0();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v63 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_255478D80);
  MEMORY[0x24BDAC7A8](v10);
  v12 = (char *)&v63 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v67 = __swift_instantiateConcreteTypeFromMangledName(&qword_255478D50);
  v66 = *(_QWORD *)(v67 - 8);
  MEMORY[0x24BDAC7A8](v67);
  v14 = (char *)&v63 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_255478D38);
  MEMORY[0x24BDAC7A8](v15);
  v17 = (char *)&v63 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v70 = __swift_instantiateConcreteTypeFromMangledName(&qword_255478D30);
  v68 = *(_QWORD *)(v70 - 8);
  MEMORY[0x24BDAC7A8](v70);
  v19 = (char *)&v63 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_255478D28);
  v71 = *(_QWORD *)(v20 - 8);
  v72 = v20;
  MEMORY[0x24BDAC7A8](v20);
  v69 = (char *)&v63 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  v22 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_255478D18);
  v74 = *(_QWORD *)(v22 - 8);
  v75 = v22;
  MEMORY[0x24BDAC7A8](v22);
  v73 = (char *)&v63 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  v79 = a1;
  v81 = a1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_255478D88);
  sub_21EB72A50(&qword_255478D90, &qword_255478D88);
  sub_21EBB7860();
  KeyPath = swift_getKeyPath();
  (*(void (**)(char *, _QWORD, uint64_t))(v7 + 104))(v9, *MEMORY[0x24BDF4C90], v6);
  sub_21EBB7A58();
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  v25 = __swift_instantiateConcreteTypeFromMangledName(&qword_255478D98);
  __swift_storeEnumTagSinglePayload((uint64_t)v12, 0, 1, v25);
  v26 = (uint64_t *)&v17[*(int *)(v15 + 36)];
  v27 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_255478D60);
  sub_21EB83818((uint64_t)v12, (uint64_t)v26 + *(int *)(v27 + 28), &qword_255478D80);
  *v26 = KeyPath;
  v28 = v66;
  v29 = v67;
  (*(void (**)(char *, char *, uint64_t))(v66 + 16))(v17, v14, v67);
  sub_21EB67980((uint64_t)v12, &qword_255478D80);
  v30 = v64;
  (*(void (**)(char *, uint64_t))(v28 + 8))(v14, v29);
  v31 = v63;
  sub_21EBB7578();
  v32 = sub_21EB82B3C();
  v67 = (uint64_t)v19;
  v66 = v15;
  v33 = v32;
  sub_21EBB7950();
  (*(void (**)(char *, uint64_t))(v65 + 8))(v31, v30);
  sub_21EB67980((uint64_t)v17, &qword_255478D38);
  sub_21EBB7B78();
  if (qword_2554776B0 != -1)
    swift_once();
  v34 = (id)qword_255478EA8;
  v35 = (void *)sub_21EBB7B48();
  v36 = (void *)sub_21EBB7B48();
  swift_bridgeObjectRelease();
  v37 = objc_msgSend(v34, sel_localizedStringForKey_value_table_, v35, v36, 0);

  sub_21EBB7B60();
  __swift_instantiateConcreteTypeFromMangledName(&qword_255478DA0);
  v38 = swift_allocObject();
  *(_OWORD *)(v38 + 16) = xmmword_21EBBC2B0;
  v39 = v79;
  type metadata accessor for AccountListViewModel();
  sub_21EB65BBC(&qword_255478DA8, (void (*)(uint64_t))type metadata accessor for AccountListViewModel);
  sub_21EBB753C();
  v40 = sub_21EB7FBC8();
  v42 = v41;
  swift_release();
  v43 = MEMORY[0x24BEE0D00];
  *(_QWORD *)(v38 + 56) = MEMORY[0x24BEE0D00];
  *(_QWORD *)(v38 + 64) = sub_21EB82C00();
  *(_QWORD *)(v38 + 32) = v40;
  *(_QWORD *)(v38 + 40) = v42;
  v44 = sub_21EBB7B54();
  v46 = v45;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v86 = v44;
  v87 = v46;
  v82 = v66;
  v83 = v30;
  v84 = v33;
  v85 = MEMORY[0x24BDEC720];
  OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
  v48 = sub_21EB67308();
  v50 = v69;
  v49 = v70;
  v51 = v67;
  sub_21EBB78E4();
  swift_bridgeObjectRelease();
  (*(void (**)(uint64_t, uint64_t))(v68 + 8))(v51, v49);
  v53 = v76;
  v52 = v77;
  v54 = v78;
  (*(void (**)(char *, _QWORD, uint64_t))(v77 + 104))(v76, *MEMORY[0x24BDEE5F0], v78);
  v82 = v49;
  v83 = v43;
  v84 = OpaqueTypeConformance2;
  v85 = v48;
  v55 = swift_getOpaqueTypeConformance2();
  v57 = v72;
  v56 = v73;
  sub_21EBB7908();
  (*(void (**)(char *, uint64_t))(v52 + 8))(v53, v54);
  v58 = (*(uint64_t (**)(char *, uint64_t))(v71 + 8))(v50, v57);
  MEMORY[0x24BDAC7A8](v58);
  *(&v63 - 2) = v39;
  __swift_instantiateConcreteTypeFromMangledName(&qword_255478780);
  v82 = v57;
  v83 = v55;
  swift_getOpaqueTypeConformance2();
  v59 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_255478790);
  sub_21EB72A50(&qword_255478798, &qword_255478790);
  v82 = v59;
  v83 = v60;
  swift_getOpaqueTypeConformance2();
  v61 = v75;
  sub_21EBB7938();
  return (*(uint64_t (**)(char *, uint64_t))(v74 + 8))(v56, v61);
}

uint64_t sub_21EB806E4@<X0>(uint64_t a1@<X0>, char *a2@<X8>)
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
  char *v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(uint64_t);
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  uint64_t v22;
  void (*v23)(char *, char *, uint64_t);
  void (*v24)(char *, char *, uint64_t);
  uint64_t v25;
  char *v26;
  uint64_t v27;
  void (*v28)(char *, uint64_t);
  void (*v29)(char *, uint64_t);
  uint64_t v31;
  char *v32;
  char *v33;
  char *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  char *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;

  v38 = a2;
  v37 = __swift_instantiateConcreteTypeFromMangledName(&qword_255478DD0);
  v3 = *(_QWORD *)(v37 - 8);
  v4 = MEMORY[0x24BDAC7A8](v37);
  v6 = (char *)&v31 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v4);
  v8 = (char *)&v31 - v7;
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_255478DD8);
  v36 = *(_QWORD *)(v9 - 8);
  v10 = MEMORY[0x24BDAC7A8](v9);
  v12 = (char *)&v31 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v10);
  v14 = (char *)&v31 - v13;
  v40 = a1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_255478DE0);
  sub_21EB831B0();
  v34 = v14;
  sub_21EBB7A88();
  v39 = a1;
  v35 = __swift_instantiateConcreteTypeFromMangledName(&qword_255478E20);
  v15 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_255478E28);
  v16 = sub_21EBB77DC();
  v17 = (void (*)(uint64_t))MEMORY[0x24BDEF8D0];
  sub_21EB72A50(&qword_255478E30, &qword_255478E28);
  v19 = v18;
  sub_21EB65BBC(&qword_255478E38, v17);
  v41 = v15;
  v42 = v16;
  v43 = v19;
  v44 = v20;
  swift_getOpaqueTypeConformance2();
  v21 = v8;
  v32 = v8;
  sub_21EBB7A88();
  v22 = v36;
  v23 = *(void (**)(char *, char *, uint64_t))(v36 + 16);
  v33 = v12;
  v23(v12, v14, v9);
  v24 = *(void (**)(char *, char *, uint64_t))(v3 + 16);
  v25 = v37;
  v24(v6, v21, v37);
  v26 = v38;
  v23(v38, v12, v9);
  v27 = __swift_instantiateConcreteTypeFromMangledName(&qword_255478E40);
  v24(&v26[*(int *)(v27 + 48)], v6, v25);
  v28 = *(void (**)(char *, uint64_t))(v3 + 8);
  v28(v32, v25);
  v29 = *(void (**)(char *, uint64_t))(v22 + 8);
  v29(v34, v9);
  v28(v6, v25);
  return ((uint64_t (*)(char *, uint64_t))v29)(v33, v9);
}

void sub_21EB80974(uint64_t a1@<X8>)
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
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void (**v23)();
  uint64_t v24;
  id v25;
  void *v26;
  void *v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  char v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  char v39;
  char v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  char *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;

  v2 = v1;
  v53 = a1;
  v3 = type metadata accessor for AccountManagementView();
  v44 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v45 = v4;
  v46 = (uint64_t)&v43 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_255478E08);
  v48 = *(_QWORD *)(v5 - 8);
  v49 = v5;
  MEMORY[0x24BDAC7A8](v5);
  v47 = (char *)&v43 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v52 = __swift_instantiateConcreteTypeFromMangledName(&qword_255478DF8);
  v7 = MEMORY[0x24BDAC7A8](v52);
  v9 = (char *)&v43 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v7);
  v50 = (uint64_t)&v43 - v10;
  v51 = __swift_instantiateConcreteTypeFromMangledName(&qword_255478E78);
  MEMORY[0x24BDAC7A8](v51);
  v12 = (char *)&v43 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for AccountListViewModel();
  sub_21EB65BBC(&qword_255478DA8, (void (*)(uint64_t))type metadata accessor for AccountListViewModel);
  sub_21EBB753C();
  v13 = sub_21EB7FB70();
  swift_release();
  if (v13 >> 62)
  {
    swift_bridgeObjectRetain();
    v14 = sub_21EBB7D64();
    swift_bridgeObjectRelease();
  }
  else
  {
    v14 = *(_QWORD *)((v13 & 0xFFFFFFFFFFFFF8) + 0x10);
  }
  swift_bridgeObjectRelease();
  if (v14)
  {
    sub_21EBB753C();
    v15 = sub_21EB7FB70();
    swift_release();
    v54 = v15;
    swift_getKeyPath();
    __swift_instantiateConcreteTypeFromMangledName(&qword_255478E80);
    sub_21EB72A50(&qword_255478E88, &qword_255478E80);
    sub_21EB65BBC(&qword_255478E90, (void (*)(uint64_t))sub_21EB820A0);
    v16 = v47;
    sub_21EBB7A64();
    v17 = v46;
    sub_21EB82C4C(v2, v46);
    v18 = (*(unsigned __int8 *)(v44 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v44 + 80);
    v19 = swift_allocObject();
    sub_21EB82C94(v17, v19 + v18);
    v20 = swift_allocObject();
    *(_QWORD *)(v20 + 16) = sub_21EB835DC;
    *(_QWORD *)(v20 + 24) = v19;
    v22 = v48;
    v21 = v49;
    (*(void (**)(char *, char *, uint64_t))(v48 + 16))(v9, v16, v49);
    v23 = (void (**)())&v9[*(int *)(v52 + 36)];
    *v23 = sub_21EB8362C;
    v23[1] = (void (*)())v20;
    (*(void (**)(char *, uint64_t))(v22 + 8))(v16, v21);
    v24 = v50;
    sub_21EB83648((uint64_t)v9, v50, &qword_255478DF8);
    sub_21EB83818(v24, (uint64_t)v12, &qword_255478DF8);
    swift_storeEnumTagMultiPayload();
    sub_21EB8321C();
    sub_21EBB777C();
    sub_21EB67980(v24, &qword_255478DF8);
  }
  else
  {
    sub_21EBB7B78();
    if (qword_2554776B0 != -1)
      swift_once();
    v25 = (id)qword_255478EA8;
    v26 = (void *)sub_21EBB7B48();
    v27 = (void *)sub_21EBB7B48();
    swift_bridgeObjectRelease();
    v28 = objc_msgSend(v25, sel_localizedStringForKey_value_table_, v26, v27, 0);

    v29 = sub_21EBB7B60();
    v31 = v30;

    v54 = v29;
    v55 = v31;
    sub_21EB67308();
    v32 = sub_21EBB7878();
    v34 = v33;
    LOBYTE(v26) = v35 & 1;
    sub_21EBB7998();
    v36 = sub_21EBB786C();
    v38 = v37;
    v40 = v39;
    v42 = v41;
    swift_release();
    sub_21EB76044(v32, v34, (char)v26);
    swift_bridgeObjectRelease();
    *(_QWORD *)v12 = v36;
    *((_QWORD *)v12 + 1) = v38;
    v12[16] = v40 & 1;
    *((_QWORD *)v12 + 3) = v42;
    swift_storeEnumTagMultiPayload();
    sub_21EB8321C();
    sub_21EBB777C();
  }
}

uint64_t sub_21EB80EE4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  unint64_t v13;
  uint64_t v14;
  _QWORD v16[2];

  v16[1] = a2;
  v3 = sub_21EBB77DC();
  v16[0] = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v5 = (char *)v16 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = type metadata accessor for AccountManagementView();
  v7 = *(_QWORD *)(v6 - 8);
  v8 = *(_QWORD *)(v7 + 64);
  MEMORY[0x24BDAC7A8](v6);
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_255478E28);
  v10 = *(_QWORD *)(v9 - 8);
  MEMORY[0x24BDAC7A8](v9);
  v12 = (char *)v16 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_21EB82C4C(a1, (uint64_t)v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0));
  v13 = (*(unsigned __int8 *)(v7 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
  v14 = swift_allocObject();
  sub_21EB82C94((uint64_t)v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0), v14 + v13);
  __swift_instantiateConcreteTypeFromMangledName(&qword_255478E48);
  sub_21EB8332C();
  sub_21EBB7A04();
  sub_21EBB77D0();
  sub_21EB72A50(&qword_255478E30, &qword_255478E28);
  sub_21EB65BBC(&qword_255478E38, (void (*)(uint64_t))MEMORY[0x24BDEF8D0]);
  sub_21EBB78A8();
  (*(void (**)(char *, uint64_t))(v16[0] + 8))(v5, v3);
  return (*(uint64_t (**)(char *, uint64_t))(v10 + 8))(v12, v9);
}

uint64_t sub_21EB810D8()
{
  void **v0;
  void **v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  char v9;
  uint64_t v10;
  uint64_t result;
  void *v12;
  void *v13;
  _QWORD aBlock[6];

  v1 = v0;
  v2 = sub_21EBB75E4();
  MEMORY[0x24BDAC7A8](v2);
  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_255478C50);
  MEMORY[0x24BDAC7A8](v3);
  v5 = (char *)aBlock - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = type metadata accessor for AccountManagementView();
  sub_21EB81C94((uint64_t)v5);
  MEMORY[0x2207B7694](v3);
  sub_21EBB75D8();
  sub_21EBB7A4C();
  sub_21EB67980((uint64_t)v5, &qword_255478C50);
  v7 = (char *)v0 + *(int *)(v6 + 32);
  v8 = *(_QWORD *)v7;
  v9 = v7[8];
  sub_21EB8229C(*(_QWORD *)v7, v9);
  v10 = sub_21EB81E98(v8, v9);
  result = sub_21EB82380(v8, v9);
  if (v10)
  {
    v12 = *v1;
    aBlock[4] = nullsub_1;
    aBlock[5] = 0;
    aBlock[0] = MEMORY[0x24BDAC760];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_21EB81A44;
    aBlock[3] = &block_descriptor_5;
    v13 = _Block_copy(aBlock);
    objc_msgSend(v12, sel_makeAvailableWithUserInterface_completionHandler_, v10, v13);
    _Block_release(v13);
    return swift_unknownObjectRelease();
  }
  return result;
}

void *sub_21EB81284@<X0>(void *a1@<X8>)
{
  id v2;
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char v12;
  char v13;
  uint64_t v14;
  _QWORD __src[21];
  char v17;
  uint64_t v18;
  char v19;

  sub_21EBB7B78();
  if (qword_2554776B0 != -1)
    swift_once();
  v2 = (id)qword_255478EA8;
  v3 = (void *)sub_21EBB7B48();
  v4 = (void *)sub_21EBB7B48();
  swift_bridgeObjectRelease();
  v5 = objc_msgSend(v2, sel_localizedStringForKey_value_table_, v3, v4, 0);

  v6 = sub_21EBB7B60();
  v8 = v7;

  __src[0] = v6;
  __src[1] = v8;
  sub_21EB67308();
  v9 = sub_21EBB7878();
  v11 = v10;
  __src[19] = v9;
  __src[20] = v10;
  v13 = v12 & 1;
  v17 = v12 & 1;
  v18 = v14;
  v19 = 0;
  sub_21EBB7AB8();
  sub_21EB7F354(0.0, 1, 0.0, 1, INFINITY, 0, 0.0, 1, (uint64_t)__src, 0.0, 1, 0.0, 1);
  sub_21EB76044(v9, v11, v13);
  swift_bridgeObjectRelease();
  return memcpy(a1, __src, 0x98uLL);
}

uint64_t sub_21EB8142C(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_255478D80);
  MEMORY[0x24BDAC7A8](v2);
  sub_21EB83818(a1, (uint64_t)&v5 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0), &qword_255478D80);
  return sub_21EBB7668();
}

uint64_t sub_21EB814AC(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _BYTE *v6;
  uint64_t v7;
  _BYTE v9[16];
  uint64_t v10;

  v2 = sub_21EBB77C4();
  MEMORY[0x24BDAC7A8](v2);
  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_255478790);
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v6 = &v9[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  sub_21EBB77B8();
  v10 = a1;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_255477990);
  sub_21EB72A50(&qword_255478DC0, (uint64_t *)&unk_255477990);
  sub_21EBB7548();
  sub_21EB72A50(&qword_255478798, &qword_255478790);
  MEMORY[0x2207B743C](v6, v3, v7);
  return (*(uint64_t (**)(_BYTE *, uint64_t))(v4 + 8))(v6, v3);
}

uint64_t sub_21EB815F4(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  _QWORD v15[2];

  v2 = type metadata accessor for AccountManagementView();
  v3 = *(_QWORD *)(v2 - 8);
  v4 = *(_QWORD *)(v3 + 64);
  MEMORY[0x24BDAC7A8](v2);
  sub_21EBB7B78();
  if (qword_2554776B0 != -1)
    swift_once();
  v5 = (id)qword_255478EA8;
  v6 = (void *)sub_21EBB7B48();
  v7 = (void *)sub_21EBB7B48();
  swift_bridgeObjectRelease();
  v8 = objc_msgSend(v5, sel_localizedStringForKey_value_table_, v6, v7, 0);

  v9 = sub_21EBB7B60();
  v11 = v10;

  v15[0] = v9;
  v15[1] = v11;
  sub_21EB82C4C(a1, (uint64_t)v15 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0));
  v12 = (*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  v13 = swift_allocObject();
  sub_21EB82C94((uint64_t)v15 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0), v13 + v12);
  sub_21EB67308();
  return sub_21EBB7A10();
}

void sub_21EB81798()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;

  v0 = sub_21EBB75E4();
  MEMORY[0x24BDAC7A8](v0);
  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_255478C50);
  MEMORY[0x24BDAC7A8](v1);
  v3 = (char *)&v4 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for AccountManagementView();
  sub_21EB81C94((uint64_t)v3);
  MEMORY[0x2207B7694](v1);
  sub_21EBB75D8();
  sub_21EBB7A4C();
  sub_21EB67980((uint64_t)v3, &qword_255478C50);
}

uint64_t sub_21EB81888@<X0>(void **a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t result;
  uint64_t v4;
  char v5;
  uint64_t v6;

  sub_21EB83670(*a1);
  sub_21EB67308();
  result = sub_21EBB7878();
  *(_QWORD *)a2 = result;
  *(_QWORD *)(a2 + 8) = v4;
  *(_BYTE *)(a2 + 16) = v5 & 1;
  *(_QWORD *)(a2 + 24) = v6;
  return result;
}

uint64_t sub_21EB818F0(uint64_t a1)
{
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;
  uint64_t result;
  void *v6;
  uint64_t i;
  id v8;
  void *v9;

  type metadata accessor for AccountListViewModel();
  sub_21EB65BBC(&qword_255478DA8, (void (*)(uint64_t))type metadata accessor for AccountListViewModel);
  sub_21EBB753C();
  v2 = sub_21EB7FB70();
  swift_release();
  v3 = sub_21EB7F504(a1, v2);
  if (!(v3 >> 62))
  {
    v4 = *(_QWORD *)((v3 & 0xFFFFFFFFFFFFF8) + 0x10);
    if (v4)
      goto LABEL_3;
    return swift_bridgeObjectRelease();
  }
  v4 = sub_21EBB7D64();
  if (!v4)
    return swift_bridgeObjectRelease();
LABEL_3:
  result = swift_getObjCClassFromMetadata();
  if (v4 >= 1)
  {
    v6 = (void *)result;
    for (i = 0; i != v4; ++i)
    {
      if ((v3 & 0xC000000000000001) != 0)
        v8 = (id)MEMORY[0x2207B7958](i, v3);
      else
        v8 = *(id *)(v3 + 8 * i + 32);
      v9 = v8;
      objc_msgSend(v6, sel_deleteAccount_, v8);

    }
    return swift_bridgeObjectRelease();
  }
  __break(1u);
  return result;
}

void sub_21EB81A44(uint64_t a1, uint64_t a2, void *a3)
{
  void (*v5)(uint64_t, void *);
  id v6;

  v5 = *(void (**)(uint64_t, void *))(a1 + 32);
  swift_retain();
  v6 = a3;
  v5(a2, a3);
  swift_release();

}

uint64_t sub_21EB81AA8()
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
  uint64_t (*v9)(uint64_t, char *);
  os_log_type_t v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  v2 = v0;
  v3 = sub_21EBB76B0();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  OUTLINED_FUNCTION_8_4();
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_255478618);
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_21EB83818(v2, (uint64_t)v7, &qword_255478618);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    sub_21EBB756C();
    v8 = OUTLINED_FUNCTION_7_4();
    return v9(v8, v7);
  }
  else
  {
    v11 = sub_21EBB7C74();
    v12 = sub_21EBB7830();
    if (os_log_type_enabled(v12, v11))
    {
      v13 = swift_slowAlloc();
      v15 = swift_slowAlloc();
      *(_DWORD *)v13 = 136315138;
      *(_QWORD *)(v13 + 4) = sub_21EB82CF4(0x417373696D736944, 0xED00006E6F697463, &v15);
      _os_log_impl(&dword_21EB60000, v12, v11, "Accessing Environment<%s>'s value outside of being installed on a View. This will always read the default value and will not update.", (uint8_t *)v13, 0xCu);
      swift_arrayDestroy();
      OUTLINED_FUNCTION_8_5();
    }

    sub_21EBB76A4();
    swift_getAtKeyPath();
    swift_release();
    return (*(uint64_t (**)(uint64_t, uint64_t))(v4 + 8))(v1, v3);
  }
}

void sub_21EB81C94(uint64_t a1@<X8>)
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
  os_log_type_t v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  v2 = v1;
  v4 = sub_21EBB76B0();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v15 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_255478B60);
  MEMORY[0x24BDAC7A8](v8);
  v10 = (char *)&v15 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_21EB83818(v2, (uint64_t)v10, &qword_255478B60);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    sub_21EB83648((uint64_t)v10, a1, &qword_255478C50);
  }
  else
  {
    v11 = sub_21EBB7C74();
    v12 = sub_21EBB7830();
    if (os_log_type_enabled(v12, v11))
    {
      v13 = swift_slowAlloc();
      v14 = swift_slowAlloc();
      v16 = v14;
      *(_DWORD *)v13 = 136315138;
      *(_QWORD *)(v13 + 4) = sub_21EB82CF4(0xD000000000000019, 0x800000021EBC2450, &v16);
      _os_log_impl(&dword_21EB60000, v12, v11, "Accessing Environment<%s>'s value outside of being installed on a View. This will always read the default value and will not update.", (uint8_t *)v13, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x2207B839C](v14, -1, -1);
      MEMORY[0x2207B839C](v13, -1, -1);
    }

    sub_21EBB76A4();
    swift_getAtKeyPath();
    swift_release();
    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  }
}

uint64_t sub_21EB81E98(uint64_t a1, char a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  os_log_type_t v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v13;
  uint64_t v14;

  v4 = sub_21EBB76B0();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if ((a2 & 1) != 0)
  {
    swift_unknownObjectRetain();
  }
  else
  {
    swift_retain();
    v8 = sub_21EBB7C74();
    v9 = sub_21EBB7830();
    if (os_log_type_enabled(v9, v8))
    {
      v10 = swift_slowAlloc();
      v11 = swift_slowAlloc();
      v14 = v11;
      *(_DWORD *)v10 = 136315138;
      *(_QWORD *)(v10 + 4) = sub_21EB82CF4(0xD00000000000001DLL, 0x800000021EBC24D0, &v14);
      _os_log_impl(&dword_21EB60000, v9, v8, "Accessing Environment<%s>'s value outside of being installed on a View. This will always read the default value and will not update.", (uint8_t *)v10, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x2207B839C](v11, -1, -1);
      MEMORY[0x2207B839C](v10, -1, -1);
    }

    sub_21EBB76A4();
    swift_getAtKeyPath();
    sub_21EB82380(a1, 0);
    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
    return v14;
  }
  return a1;
}

void sub_21EB82034()
{
  sub_21EBB762C();
  OUTLINED_FUNCTION_5();
}

void sub_21EB82050(uint64_t *a1@<X8>)
{
  *a1 = sub_21EBB75FC();
  OUTLINED_FUNCTION_5();
}

uint64_t sub_21EB82074()
{
  swift_unknownObjectRetain();
  return sub_21EBB7608();
}

unint64_t sub_21EB820A0()
{
  unint64_t result;

  result = qword_255477DE0;
  if (!qword_255477DE0)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_255477DE0);
  }
  return result;
}

uint64_t sub_21EB820DC()
{
  return swift_deallocObject();
}

uint64_t sub_21EB820EC()
{
  uint64_t v0;

  return sub_21EB7FC5C(*(_QWORD *)(v0 + 16));
}

uint64_t type metadata accessor for AccountListViewModel()
{
  return objc_opt_self();
}

char *sub_21EB82114(char *a1, char **a2, int *a3)
{
  int v3;
  char *v4;
  char *v7;
  char *v8;
  char *v9;
  char v10;
  char *v11;
  uint64_t v12;
  char *v13;
  _QWORD *v14;
  int EnumCaseMultiPayload;
  uint64_t v16;
  char *v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  uint64_t v22;
  uint64_t v23;
  char v24;
  uint64_t v25;
  char *v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  id v30;

  v3 = *(_DWORD *)(*((_QWORD *)a3 - 1) + 80);
  v4 = *a2;
  *(_QWORD *)a1 = *a2;
  if ((v3 & 0x20000) != 0)
  {
    v7 = &v4[(v3 + 16) & ~(unint64_t)v3];
  }
  else
  {
    v7 = a1;
    v8 = a2[2];
    *((_QWORD *)a1 + 1) = a2[1];
    v9 = a2[3];
    v10 = *((_BYTE *)a2 + 32);
    v11 = v4;
    sub_21EB82294();
    *((_QWORD *)v7 + 2) = v8;
    *((_QWORD *)v7 + 3) = v9;
    v7[32] = v10;
    v12 = a3[7];
    v13 = &v7[v12];
    v14 = (char **)((char *)a2 + v12);
    __swift_instantiateConcreteTypeFromMangledName(&qword_255478B60);
    EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    *(_QWORD *)v13 = *v14;
    if (EnumCaseMultiPayload == 1)
    {
      *((_QWORD *)v13 + 1) = v14[1];
      swift_retain();
      swift_retain();
      v16 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_255478C50) + 32);
      v17 = &v13[v16];
      v18 = (char *)v14 + v16;
      v19 = sub_21EBB75E4();
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v19 - 8) + 16))(v17, v18, v19);
    }
    else
    {
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
    v20 = a3[8];
    v21 = &v7[v20];
    v22 = (uint64_t)a2 + v20;
    v23 = *(_QWORD *)v22;
    v24 = *(_BYTE *)(v22 + 8);
    sub_21EB8229C(*(_QWORD *)v22, v24);
    *(_QWORD *)v21 = v23;
    v21[8] = v24;
    v25 = a3[9];
    v26 = &v7[v25];
    v27 = (uint64_t)a2 + v25;
    v28 = *(void **)v27;
    v29 = *(_QWORD *)(v27 + 8);
    *(_QWORD *)v26 = *(_QWORD *)v27;
    *((_QWORD *)v26 + 1) = v29;
    v30 = v28;
  }
  swift_retain();
  return v7;
}

uint64_t sub_21EB82294()
{
  return swift_retain();
}

uint64_t sub_21EB8229C(uint64_t a1, char a2)
{
  if ((a2 & 1) != 0)
    return swift_unknownObjectRetain();
  else
    return swift_retain();
}

uint64_t sub_21EB822A8(id *a1, int *a2)
{
  char *v4;
  int EnumCaseMultiPayload;
  char *v6;
  uint64_t v7;

  sub_21EB82378();
  v4 = (char *)a1 + a2[7];
  __swift_instantiateConcreteTypeFromMangledName(&qword_255478B60);
  EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  swift_release();
  if (EnumCaseMultiPayload == 1)
  {
    swift_release();
    v6 = &v4[*(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_255478C50) + 32)];
    v7 = sub_21EBB75E4();
    (*(void (**)(char *, uint64_t))(*(_QWORD *)(v7 - 8) + 8))(v6, v7);
  }
  sub_21EB82380(*(uint64_t *)((char *)a1 + a2[8]), *((_BYTE *)a1 + a2[8] + 8));

  return swift_release();
}

uint64_t sub_21EB82378()
{
  return swift_release();
}

uint64_t sub_21EB82380(uint64_t a1, char a2)
{
  if ((a2 & 1) != 0)
    return swift_unknownObjectRelease();
  else
    return swift_release();
}

uint64_t sub_21EB8238C(uint64_t a1, __int128 *a2, int *a3)
{
  __int128 v6;
  uint64_t v7;
  uint64_t v8;
  char v9;
  id v10;
  uint64_t v11;
  _QWORD *v12;
  _QWORD *v13;
  int EnumCaseMultiPayload;
  uint64_t v15;
  char *v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  char v23;
  uint64_t v24;
  _QWORD *v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  id v29;

  v6 = *a2;
  *(_OWORD *)a1 = *a2;
  v7 = *((_QWORD *)a2 + 2);
  v8 = *((_QWORD *)a2 + 3);
  v9 = *((_BYTE *)a2 + 32);
  v10 = (id)v6;
  sub_21EB82294();
  *(_QWORD *)(a1 + 16) = v7;
  *(_QWORD *)(a1 + 24) = v8;
  *(_BYTE *)(a1 + 32) = v9;
  v11 = a3[7];
  v12 = (_QWORD *)(a1 + v11);
  v13 = (_QWORD *)((char *)a2 + v11);
  __swift_instantiateConcreteTypeFromMangledName(&qword_255478B60);
  EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  *v12 = *v13;
  if (EnumCaseMultiPayload == 1)
  {
    v12[1] = v13[1];
    swift_retain();
    swift_retain();
    v15 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_255478C50) + 32);
    v16 = (char *)v12 + v15;
    v17 = (char *)v13 + v15;
    v18 = sub_21EBB75E4();
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v18 - 8) + 16))(v16, v17, v18);
  }
  else
  {
    swift_retain();
  }
  swift_storeEnumTagMultiPayload();
  v19 = a3[8];
  v20 = a1 + v19;
  v21 = (uint64_t)a2 + v19;
  v22 = *(_QWORD *)v21;
  v23 = *(_BYTE *)(v21 + 8);
  sub_21EB8229C(*(_QWORD *)v21, v23);
  *(_QWORD *)v20 = v22;
  *(_BYTE *)(v20 + 8) = v23;
  v24 = a3[9];
  v25 = (_QWORD *)(a1 + v24);
  v26 = (uint64_t)a2 + v24;
  v27 = *(void **)v26;
  v28 = *(_QWORD *)(v26 + 8);
  *v25 = *(_QWORD *)v26;
  v25[1] = v28;
  v29 = v27;
  swift_retain();
  return a1;
}

uint64_t sub_21EB824E8(uint64_t a1, uint64_t a2, int *a3)
{
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  char v11;
  uint64_t v12;
  _QWORD *v13;
  _QWORD *v14;
  int EnumCaseMultiPayload;
  uint64_t v16;
  char *v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  char v24;
  uint64_t v25;
  char v26;
  uint64_t v27;
  _QWORD *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  id v32;

  v6 = *(void **)a2;
  v7 = *(void **)a1;
  *(_QWORD *)a1 = *(_QWORD *)a2;
  v8 = v6;

  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  v9 = *(_QWORD *)(a2 + 16);
  v10 = *(_QWORD *)(a2 + 24);
  v11 = *(_BYTE *)(a2 + 32);
  sub_21EB82294();
  *(_QWORD *)(a1 + 16) = v9;
  *(_QWORD *)(a1 + 24) = v10;
  *(_BYTE *)(a1 + 32) = v11;
  sub_21EB82378();
  if (a1 != a2)
  {
    v12 = a3[7];
    v13 = (_QWORD *)(a1 + v12);
    v14 = (_QWORD *)(a2 + v12);
    sub_21EB67980(a1 + v12, &qword_255478B60);
    __swift_instantiateConcreteTypeFromMangledName(&qword_255478B60);
    EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    *v13 = *v14;
    if (EnumCaseMultiPayload == 1)
    {
      v13[1] = v14[1];
      swift_retain();
      swift_retain();
      v16 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_255478C50) + 32);
      v17 = (char *)v13 + v16;
      v18 = (char *)v14 + v16;
      v19 = sub_21EBB75E4();
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v19 - 8) + 16))(v17, v18, v19);
    }
    else
    {
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
  }
  v20 = a3[8];
  v21 = a1 + v20;
  v22 = a2 + v20;
  v23 = *(_QWORD *)v22;
  v24 = *(_BYTE *)(v22 + 8);
  sub_21EB8229C(*(_QWORD *)v22, v24);
  v25 = *(_QWORD *)v21;
  v26 = *(_BYTE *)(v21 + 8);
  *(_QWORD *)v21 = v23;
  *(_BYTE *)(v21 + 8) = v24;
  sub_21EB82380(v25, v26);
  v27 = a3[9];
  v28 = (_QWORD *)(a1 + v27);
  v29 = a2 + v27;
  v30 = *(void **)(a1 + v27);
  v31 = *(void **)v29;
  *v28 = *(_QWORD *)v29;
  v32 = v31;

  v28[1] = *(_QWORD *)(v29 + 8);
  swift_retain();
  swift_release();
  return a1;
}

uint64_t sub_21EB82698(uint64_t a1, uint64_t a2, int *a3)
{
  __int128 v6;
  uint64_t v7;
  _QWORD *v8;
  _QWORD *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;

  v6 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v6;
  *(_BYTE *)(a1 + 32) = *(_BYTE *)(a2 + 32);
  v7 = a3[7];
  v8 = (_QWORD *)(a1 + v7);
  v9 = (_QWORD *)(a2 + v7);
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_255478B60);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v11 = v9[1];
    *v8 = *v9;
    v8[1] = v11;
    v12 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_255478C50) + 32);
    v13 = (char *)v8 + v12;
    v14 = (char *)v9 + v12;
    v15 = sub_21EBB75E4();
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v15 - 8) + 32))(v13, v14, v15);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(v8, v9, *(_QWORD *)(*(_QWORD *)(v10 - 8) + 64));
  }
  v16 = a3[8];
  v17 = a3[9];
  v18 = a1 + v16;
  v19 = a2 + v16;
  *(_QWORD *)v18 = *(_QWORD *)v19;
  *(_BYTE *)(v18 + 8) = *(_BYTE *)(v19 + 8);
  *(_OWORD *)(a1 + v17) = *(_OWORD *)(a2 + v17);
  return a1;
}

uint64_t sub_21EB827A4(uint64_t a1, uint64_t a2, int *a3)
{
  void *v6;
  char v7;
  uint64_t v8;
  _QWORD *v9;
  _QWORD *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;
  char v22;
  uint64_t v23;
  _QWORD *v24;
  _QWORD *v25;
  void *v26;

  v6 = *(void **)a1;
  *(_QWORD *)a1 = *(_QWORD *)a2;

  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  v7 = *(_BYTE *)(a2 + 32);
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  *(_BYTE *)(a1 + 32) = v7;
  sub_21EB82378();
  if (a1 != a2)
  {
    v8 = a3[7];
    v9 = (_QWORD *)(a1 + v8);
    v10 = (_QWORD *)(a2 + v8);
    sub_21EB67980(a1 + v8, &qword_255478B60);
    v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_255478B60);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v12 = v10[1];
      *v9 = *v10;
      v9[1] = v12;
      v13 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_255478C50) + 32);
      v14 = (char *)v9 + v13;
      v15 = (char *)v10 + v13;
      v16 = sub_21EBB75E4();
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v16 - 8) + 32))(v14, v15, v16);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(v9, v10, *(_QWORD *)(*(_QWORD *)(v11 - 8) + 64));
    }
  }
  v17 = a3[8];
  v18 = a1 + v17;
  v19 = (uint64_t *)(a2 + v17);
  v20 = *v19;
  LOBYTE(v19) = *((_BYTE *)v19 + 8);
  v21 = *(_QWORD *)v18;
  v22 = *(_BYTE *)(v18 + 8);
  *(_QWORD *)v18 = v20;
  *(_BYTE *)(v18 + 8) = (_BYTE)v19;
  sub_21EB82380(v21, v22);
  v23 = a3[9];
  v24 = (_QWORD *)(a1 + v23);
  v25 = (_QWORD *)(a2 + v23);
  v26 = *(void **)(a1 + v23);
  *v24 = *v25;

  v24[1] = v25[1];
  swift_release();
  return a1;
}

uint64_t sub_21EB8291C()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_21EB82928(uint64_t *a1, uint64_t a2, uint64_t a3)
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
    v8 = __swift_instantiateConcreteTypeFromMangledName(qword_255478C58);
    return __swift_getEnumTagSinglePayload((uint64_t)a1 + *(int *)(a3 + 28), a2, v8);
  }
}

uint64_t sub_21EB829A0()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

_QWORD *sub_21EB829AC(_QWORD *result, uint64_t a2, int a3, uint64_t a4)
{
  _QWORD *v5;
  uint64_t v7;

  v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *result = (a2 - 1);
  }
  else
  {
    v7 = __swift_instantiateConcreteTypeFromMangledName(qword_255478C58);
    return (_QWORD *)__swift_storeEnumTagSinglePayload((uint64_t)v5 + *(int *)(a4 + 28), a2, a2, v7);
  }
  return result;
}

void sub_21EB82A1C()
{
  unint64_t v0;

  sub_21EB82AC0();
  if (v0 <= 0x3F)
    swift_initStructMetadata();
}

void sub_21EB82AC0()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_255478CC8[0])
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_255478C50);
    v0 = sub_21EBB7524();
    if (!v1)
      atomic_store(v0, qword_255478CC8);
  }
}

uint64_t sub_21EB82B18()
{
  return MEMORY[0x24BDB9D70];
}

uint64_t sub_21EB82B24()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_21EB82B34@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_21EB7FF40(*(char **)(v1 + 16), a1);
}

unint64_t sub_21EB82B3C()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD v5[2];

  result = qword_255478D40;
  if (!qword_255478D40)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_255478D38);
    sub_21EB72A50(&qword_255478D48, &qword_255478D50);
    v3 = v2;
    sub_21EB72A50(&qword_255478D58, (uint64_t *)&unk_255478D60);
    v5[0] = v3;
    v5[1] = v4;
    result = MEMORY[0x2207B8330](MEMORY[0x24BDED308], v1, v5);
    atomic_store(result, (unint64_t *)&qword_255478D40);
  }
  return result;
}

uint64_t sub_21EB82BD8@<X0>(char *a1@<X8>)
{
  uint64_t v1;

  return sub_21EB806E4(*(_QWORD *)(v1 + 16), a1);
}

void sub_21EB82BE0()
{
  sub_21EBB765C();
  OUTLINED_FUNCTION_5();
}

unint64_t sub_21EB82C00()
{
  unint64_t result;

  result = qword_255478DB0;
  if (!qword_255478DB0)
  {
    result = MEMORY[0x2207B8330](MEMORY[0x24BDCFB50], MEMORY[0x24BEE0D00]);
    atomic_store(result, (unint64_t *)&qword_255478DB0);
  }
  return result;
}

uint64_t sub_21EB82C3C()
{
  uint64_t v0;

  return sub_21EB814AC(*(_QWORD *)(v0 + 16));
}

uint64_t sub_21EB82C44()
{
  uint64_t v0;

  return sub_21EB815F4(*(_QWORD *)(v0 + 16));
}

uint64_t sub_21EB82C4C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for AccountManagementView();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_21EB82C94(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for AccountManagementView();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

void sub_21EB82CD8()
{
  OUTLINED_FUNCTION_2_5();
  OUTLINED_FUNCTION_0_5();
  sub_21EB81798();
}

unint64_t sub_21EB82CF4(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v12[3];
  uint64_t ObjectType;

  v6 = sub_21EB82DC4(v12, 0, 0, 1, a1, a2);
  v7 = v12[0];
  if (v6)
  {
    v8 = v6;
    ObjectType = swift_getObjectType();
    v12[0] = v8;
    v9 = *a3;
    if (*a3)
    {
      sub_21EB82EE0((uint64_t)v12, *a3);
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
      sub_21EB82EE0((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v12);
  return v7;
}

unint64_t sub_21EB82DC4(unint64_t *a1, void *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
    result = sub_21EB82F1C(a5, a6);
    *a1 = v11;
    return result;
  }
  if ((a5 & 0x1000000000000000) != 0)
  {
    result = (a6 & 0xFFFFFFFFFFFFFFFLL) + 32;
  }
  else
  {
    result = sub_21EBB7D10();
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

uint64_t __swift_destroy_boxed_opaque_existential_0(uint64_t a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(*(_QWORD *)(a1 + 24) - 8);
  if ((*(_BYTE *)(v1 + 82) & 2) != 0)
    return swift_release();
  else
    return (*(uint64_t (**)(void))(v1 + 8))();
}

uint64_t sub_21EB82EE0(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_21EB82F1C(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v2 = sub_21EB82FB0(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v2 = (uint64_t)sub_21EB830AC(0, *(_QWORD *)(v2 + 16) + 1, 1, (char *)v2);
  v4 = *(_QWORD *)(v2 + 16);
  v3 = *(_QWORD *)(v2 + 24);
  if (v4 >= v3 >> 1)
    v2 = (uint64_t)sub_21EB830AC((char *)(v3 > 1), v4 + 1, 1, (char *)v2);
  *(_QWORD *)(v2 + 16) = v4 + 1;
  *(_BYTE *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_21EB82FB0(uint64_t a1, unint64_t a2)
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
      v3 = sub_21EB83048(v2, 0);
      result = sub_21EBB7CF8();
      if ((v5 & 1) != 0)
        break;
      if (result == v2)
        return (uint64_t)v3;
      __break(1u);
LABEL_9:
      v2 = sub_21EBB7BB4();
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

_QWORD *sub_21EB83048(uint64_t a1, uint64_t a2)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_255478DC8);
  v4 = (_QWORD *)swift_allocObject();
  v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

char *sub_21EB830AC(char *result, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_255478DC8);
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
    if (v10 != a4 || &v13[v8] <= v12)
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

void sub_21EB83194(uint64_t a1@<X8>)
{
  sub_21EB80974(a1);
  OUTLINED_FUNCTION_5();
}

unint64_t sub_21EB831B0()
{
  unint64_t result;
  uint64_t v1;
  unint64_t v2;
  _QWORD v3[2];

  result = qword_255478DE8;
  if (!qword_255478DE8)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_255478DE0);
    v2 = sub_21EB8321C();
    v3[0] = MEMORY[0x24BDF1F80];
    v3[1] = v2;
    result = MEMORY[0x2207B8330](MEMORY[0x24BDEF3E0], v1, v3);
    atomic_store(result, (unint64_t *)&qword_255478DE8);
  }
  return result;
}

unint64_t sub_21EB8321C()
{
  unint64_t result;
  uint64_t v1;
  unint64_t v2;
  uint64_t v3;
  _QWORD v4[2];

  result = qword_255478DF0;
  if (!qword_255478DF0)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_255478DF8);
    v2 = sub_21EB832A0();
    sub_21EB72A50(&qword_255478E10, &qword_255478E18);
    v4[0] = v2;
    v4[1] = v3;
    result = MEMORY[0x2207B8330](MEMORY[0x24BDED308], v1, v4);
    atomic_store(result, (unint64_t *)&qword_255478DF0);
  }
  return result;
}

unint64_t sub_21EB832A0()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;

  result = qword_255478E00;
  if (!qword_255478E00)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_255478E08);
    v2 = MEMORY[0x24BDF1F80];
    result = MEMORY[0x2207B8330](MEMORY[0x24BDF4A08], v1, &v2);
    atomic_store(result, (unint64_t *)&qword_255478E00);
  }
  return result;
}

uint64_t sub_21EB832FC@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_21EB80EE4(*(_QWORD *)(v1 + 16), a1);
}

void sub_21EB83308()
{
  OUTLINED_FUNCTION_2_5();
  OUTLINED_FUNCTION_0_5();
  sub_21EB810D8();
  OUTLINED_FUNCTION_5();
}

unint64_t sub_21EB8332C()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_255478E50;
  if (!qword_255478E50)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_255478E48);
    v2[0] = sub_21EB83398();
    v2[1] = MEMORY[0x24BDEDBB8];
    result = MEMORY[0x2207B8330](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_255478E50);
  }
  return result;
}

unint64_t sub_21EB83398()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;
  _QWORD v3[2];

  result = qword_255478E58;
  if (!qword_255478E58)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_255478E60);
    sub_21EB72A50(&qword_255478E68, &qword_255478E70);
    v3[0] = MEMORY[0x24BDF1F80];
    v3[1] = v2;
    result = MEMORY[0x2207B8330](MEMORY[0x24BDED308], v1, v3);
    atomic_store(result, (unint64_t *)&qword_255478E58);
  }
  return result;
}

uint64_t sub_21EB8341C(uint64_t a1, uint64_t a2)
{
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(MEMORY[0x24BDF1EB8] - 8) + 32))(a2, a1);
  return a2;
}

uint64_t sub_21EB83458(uint64_t a1)
{
  sub_21EB760D8(*(_QWORD *)a1, *(_QWORD *)(a1 + 8), *(_BYTE *)(a1 + 16));
  return a1;
}

uint64_t sub_21EB83488(uint64_t a1)
{
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t block_copy_helper_4(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_4()
{
  return swift_release();
}

uint64_t objectdestroy_9Tm_0()
{
  uint64_t v0;
  int *v1;
  uint64_t v2;
  id *v3;
  char *v4;
  int EnumCaseMultiPayload;
  char *v6;
  uint64_t v7;

  v1 = (int *)OUTLINED_FUNCTION_2_5();
  v2 = *(unsigned __int8 *)(*((_QWORD *)v1 - 1) + 80);
  v3 = (id *)(v0 + ((v2 + 16) & ~v2));

  sub_21EB82378();
  v4 = (char *)v3 + v1[7];
  __swift_instantiateConcreteTypeFromMangledName(&qword_255478B60);
  EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  swift_release();
  if (EnumCaseMultiPayload == 1)
  {
    swift_release();
    v6 = &v4[*(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_255478C50) + 32)];
    v7 = sub_21EBB75E4();
    (*(void (**)(char *, uint64_t))(*(_QWORD *)(v7 - 8) + 8))(v6, v7);
  }
  sub_21EB82380(*(uint64_t *)((char *)v3 + v1[8]), *((_BYTE *)v3 + v1[8] + 8));

  swift_release();
  return swift_deallocObject();
}

uint64_t sub_21EB835DC(uint64_t a1)
{
  OUTLINED_FUNCTION_2_5();
  OUTLINED_FUNCTION_0_5();
  return sub_21EB818F0(a1);
}

uint64_t sub_21EB83608()
{
  swift_release();
  return swift_deallocObject();
}

void sub_21EB8362C()
{
  uint64_t v0;

  (*(void (**)(void))(v0 + 16))();
  OUTLINED_FUNCTION_5();
}

void sub_21EB83648(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v3;
  uint64_t v4;
  void (*v5)(uint64_t, uint64_t);

  OUTLINED_FUNCTION_3_0(a1, a2, a3);
  v4 = OUTLINED_FUNCTION_7_4();
  v5(v4, v3);
  OUTLINED_FUNCTION_5();
}

uint64_t sub_21EB83670(void *a1)
{
  id v1;
  void *v2;
  uint64_t v3;

  v1 = objc_msgSend(a1, sel_localizedName);
  if (!v1)
    return 0;
  v2 = v1;
  v3 = sub_21EBB7B60();

  return v3;
}

_OWORD *sub_21EB836D0(_OWORD *a1, _OWORD *a2)
{
  __int128 v2;

  v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

_QWORD *__swift_project_boxed_opaque_existential_0(_QWORD *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) & 0x20000) != 0)
    return (_QWORD *)(*result
                    + ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80)));
  return result;
}

uint64_t sub_21EB83704()
{
  swift_weakDestroy();
  return swift_deallocObject();
}

uint64_t sub_21EB83728()
{
  return sub_21EB7F9E0();
}

uint64_t sub_21EB83730(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_255478EA0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t sub_21EB83778()
{
  void (*v0)(uint64_t);

  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_255478D08);
  sub_21EBB7818();
  v0 = (void (*)(uint64_t))MEMORY[0x24BDF0620];
  sub_21EB72A50(qword_255478D70, &qword_255478D08);
  sub_21EB65BBC(&qword_255477960, v0);
  return swift_getOpaqueTypeConformance2();
}

void sub_21EB83818(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v5 = OUTLINED_FUNCTION_3_0(a1, a2, a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(v3, v4, v5);
  OUTLINED_FUNCTION_5();
}

uint64_t OUTLINED_FUNCTION_2_5()
{
  return type metadata accessor for AccountManagementView();
}

uint64_t OUTLINED_FUNCTION_7_4()
{
  uint64_t v0;

  return v0;
}

void OUTLINED_FUNCTION_8_5()
{
  JUMPOUT(0x2207B839CLL);
}

unint64_t StaticString._asString.getter(unint64_t result, uint64_t a2, char a3)
{
  if ((a3 & 1) == 0)
  {
    if (result)
      return sub_21EBB7B78();
    __break(1u);
  }
  if (HIDWORD(result))
  {
    __break(1u);
LABEL_11:
    __break(1u);
    return sub_21EBB7B78();
  }
  if (result >> 11 == 27)
    goto LABEL_14;
  if (WORD1(result) > 0x10u)
    goto LABEL_11;
  if ((result & 0xFFFFFF80) != 0 || result <= 0xFF)
    return sub_21EBB7B78();
  __break(1u);
LABEL_14:
  __break(1u);
  return result;
}

id static NSBundle._current.getter()
{
  if (qword_2554776B0 != -1)
    swift_once();
  return (id)qword_255478EA8;
}

id sub_21EB839DC()
{
  uint64_t ObjCClassFromMetadata;
  id result;

  _s2__CMa();
  ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  result = objc_msgSend((id)objc_opt_self(), sel_bundleForClass_, ObjCClassFromMetadata);
  qword_255478EA8 = (uint64_t)result;
  return result;
}

uint64_t sub_21EB83A30()
{
  return swift_deallocClassInstance();
}

uint64_t _s2__CMa()
{
  return objc_opt_self();
}

void sub_21EB83A64(char a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  id v6;

  if (a2)
    v5 = sub_21EBB741C();
  else
    v5 = 0;
  v6 = (id)v5;
  (*(void (**)(uint64_t, _QWORD))(a3 + 16))(a3, a1 & 1);

}

uint64_t sub_21EB83ABC(uint64_t a1)
{
  void (*v1)(uint64_t);
  uint64_t v2;

  v1 = *(void (**)(uint64_t))(a1 + 32);
  v2 = swift_retain();
  v1(v2);
  return swift_release();
}

id sub_21EB83AE8(uint64_t a1, uint64_t a2)
{
  void *v2;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  id result;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  _QWORD *v18;
  void *v19;
  id v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  _QWORD aBlock[6];

  v5 = sub_21EBB7ADC();
  v23 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)&v22 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v22 = sub_21EBB7B00();
  v8 = *(_QWORD *)(v22 - 8);
  MEMORY[0x24BDAC7A8](v22);
  v10 = (char *)&v22 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  result = objc_msgSend((id)objc_opt_self(), sel_sharedInstance);
  if (result)
  {
    v12 = result;
    v13 = sub_21EBB7B60();
    sub_21EB6A9A8(v13, v14, v12, (SEL *)&selRef_setOAuthConsumerKey_);
    v15 = sub_21EBB7B60();
    sub_21EB6A9A8(v15, v16, v12, (SEL *)&selRef_setOAuthConsumerSecret_);
    sub_21EB6FC70();
    v17 = (void *)sub_21EBB7C80();
    v18 = (_QWORD *)swift_allocObject();
    v18[2] = v2;
    v18[3] = v12;
    v18[4] = a1;
    v18[5] = a2;
    aBlock[4] = sub_21EB8551C;
    aBlock[5] = v18;
    aBlock[0] = MEMORY[0x24BDAC760];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_21EB83A60;
    aBlock[3] = &block_descriptor_6;
    v19 = _Block_copy(aBlock);
    v20 = v2;
    v21 = v12;
    swift_retain();
    swift_release();
    sub_21EBB7AF4();
    aBlock[0] = MEMORY[0x24BEE4AF8];
    sub_21EB65BBC(&qword_255477E90, (void (*)(uint64_t))MEMORY[0x24BEE5458]);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_255477C30);
    sub_21EB72A50(&qword_255477EA0, (uint64_t *)&unk_255477C30);
    sub_21EBB7CEC();
    MEMORY[0x2207B78E0](0, v10, v7, v19);
    _Block_release(v19);

    (*(void (**)(char *, uint64_t))(v23 + 8))(v7, v5);
    return (id)(*(uint64_t (**)(char *, uint64_t))(v8 + 8))(v10, v22);
  }
  else
  {
    __break(1u);
  }
  return result;
}

void sub_21EB83D74(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD *v15;
  uint64_t v16;
  id v17;
  _QWORD *v18;
  _QWORD v19[2];

  v19[1] = a1;
  v7 = type metadata accessor for TumblrWebView.LoadingState(0);
  v8 = MEMORY[0x24BDAC7A8](v7);
  v10 = (char *)v19 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v8);
  v12 = (char *)v19 - v11;
  v13 = type metadata accessor for TumblrWebView(0);
  MEMORY[0x24BDAC7A8](v13);
  v15 = (_QWORD *)((char *)v19 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0));
  *v15 = a2;
  v15[1] = 0x726C626D75746677;
  v15[2] = 0xE800000000000000;
  v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_255478FD8);
  __swift_storeEnumTagSinglePayload((uint64_t)v12, 1, 2, v16);
  sub_21EB722D8((uint64_t)v12, (uint64_t)v10, type metadata accessor for TumblrWebView.LoadingState);
  v17 = a2;
  swift_retain();
  sub_21EBB79C8();
  sub_21EB6FD5C((uint64_t)v12, type metadata accessor for TumblrWebView.LoadingState);
  v18 = (_QWORD *)((char *)v15 + *(int *)(v13 + 28));
  *v18 = a3;
  v18[1] = a4;
  sub_21EB65BBC(&qword_255478FE0, (void (*)(uint64_t))type metadata accessor for TumblrWebView);
  sub_21EBB7CA4();
  sub_21EB6FD5C((uint64_t)v15, type metadata accessor for TumblrWebView);
}

id sub_21EB83F8C(void *a1, void *a2)
{
  void *v2;
  id v5;
  objc_super v7;

  v7.receiver = v2;
  v7.super_class = (Class)type metadata accessor for WFTumblrAccessResourceUserInterface();
  v5 = objc_msgSendSuper2(&v7, sel_initWithUserInterfaceType_attribution_, a1, a2);

  return v5;
}

id sub_21EB8402C()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for WFTumblrAccessResourceUserInterface();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for WFTumblrAccessResourceUserInterface()
{
  return objc_opt_self();
}

uint64_t sub_21EB8407C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  char *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t result;
  char v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  char v24;
  char v25;
  uint64_t v26;

  v2 = type metadata accessor for TumblrWebView(0);
  v22 = *(_QWORD *)(v2 - 8);
  v3 = *(_QWORD *)(v22 + 64);
  v4 = MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v21 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v21 - v6;
  sub_21EBB7B78();
  if (qword_2554776B0 != -1)
    swift_once();
  v8 = (id)qword_255478EA8;
  v9 = (void *)sub_21EBB7B48();
  v10 = (void *)sub_21EBB7B48();
  swift_bridgeObjectRelease();
  v11 = objc_msgSend(v8, sel_localizedStringForKey_value_table_, v9, v10, 0);

  v21 = sub_21EBB7B60();
  v13 = v12;

  v14 = v23;
  sub_21EB722D8(v23, (uint64_t)v7, type metadata accessor for TumblrWebView);
  v15 = (*(unsigned __int8 *)(v22 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v22 + 80);
  v16 = swift_allocObject();
  sub_21EB86410((uint64_t)v7, v16 + v15);
  sub_21EB722D8(v14, (uint64_t)v5, type metadata accessor for TumblrWebView);
  v17 = swift_allocObject();
  sub_21EB86410((uint64_t)v5, v17 + v15);
  v24 = 0;
  result = sub_21EBB79C8();
  v19 = v25;
  v20 = v26;
  *(_QWORD *)a1 = v21;
  *(_QWORD *)(a1 + 8) = v13;
  *(_WORD *)(a1 + 16) = 257;
  *(_QWORD *)(a1 + 24) = sub_21EB86454;
  *(_QWORD *)(a1 + 32) = v16;
  *(_QWORD *)(a1 + 40) = sub_21EB86568;
  *(_QWORD *)(a1 + 48) = v17;
  *(_QWORD *)(a1 + 56) = 0;
  *(_QWORD *)(a1 + 64) = 0;
  *(_BYTE *)(a1 + 72) = v19;
  *(_QWORD *)(a1 + 80) = v20;
  return result;
}

void sub_21EB842B8(uint64_t a1@<X8>)
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
  char *v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  char *v22;
  uint64_t v23;
  uint64_t v24;
  char *v25;
  uint64_t v26;
  unint64_t v27;
  uint64_t v28;
  uint64_t (**v29)();
  uint64_t v30;
  char *v31;
  uint64_t v32;
  char *v33;
  unint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  _QWORD *v38;
  uint64_t v39;
  char *v40;
  char *v41;
  uint64_t v42;
  uint64_t v43;
  char *v44;
  uint64_t v45;
  uint64_t v46;
  char *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;

  v53 = a1;
  v1 = sub_21EBB73BC();
  v42 = *(_QWORD *)(v1 - 8);
  v43 = v1;
  MEMORY[0x24BDAC7A8](v1);
  v41 = (char *)&v39 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v52 = type metadata accessor for WebView(0);
  MEMORY[0x24BDAC7A8](v52);
  v47 = (char *)&v39 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = sub_21EBB7464();
  v45 = *(_QWORD *)(v4 - 8);
  v46 = v4;
  v5 = MEMORY[0x24BDAC7A8](v4);
  v40 = (char *)&v39 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v5);
  v44 = (char *)&v39 - v7;
  v50 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_255478150);
  MEMORY[0x24BDAC7A8](v50);
  v51 = (uint64_t)&v39 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = type metadata accessor for TumblrWebView(0);
  v48 = *(_QWORD *)(v9 - 8);
  v10 = *(_QWORD *)(v48 + 64);
  MEMORY[0x24BDAC7A8](v9);
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_2554779B8);
  v12 = *(_QWORD *)(v11 - 8);
  MEMORY[0x24BDAC7A8](v11);
  v14 = (char *)&v39 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_255478160);
  MEMORY[0x24BDAC7A8](v15);
  v17 = (char *)&v39 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v49 = __swift_instantiateConcreteTypeFromMangledName(&qword_255478168);
  v18 = MEMORY[0x24BDAC7A8](v49);
  v20 = (char *)&v39 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v18);
  v22 = (char *)&v39 - v21;
  v23 = type metadata accessor for TumblrWebView.LoadingState(0);
  MEMORY[0x24BDAC7A8](v23);
  v25 = (char *)&v39 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(qword_255478FE8);
  sub_21EBB79D4();
  v26 = __swift_instantiateConcreteTypeFromMangledName(&qword_255478FD8);
  if (__swift_getEnumTagSinglePayload((uint64_t)v25, 2, v26))
  {
    sub_21EBB7554();
    sub_21EBB7AAC();
    sub_21EB7F1A8(0.0, 1, 0.0, 1, INFINITY, 0, 0.0, 1, (uint64_t)v17, 0.0, 1, INFINITY, 0);
    (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v11);
    sub_21EB722D8(v54, (uint64_t)&v39 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0), type metadata accessor for TumblrWebView);
    v27 = (*(unsigned __int8 *)(v48 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v48 + 80);
    v28 = swift_allocObject();
    sub_21EB86410((uint64_t)&v39 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0), v28 + v27);
    sub_21EB726D8((uint64_t)v17, (uint64_t)v20, &qword_255478160);
    v29 = (uint64_t (**)())&v20[*(int *)(v49 + 36)];
    *v29 = sub_21EB865D8;
    v29[1] = (uint64_t (*)())v28;
    v29[2] = 0;
    v29[3] = 0;
    sub_21EB72984((uint64_t)v17, &qword_255478160);
    sub_21EB72690((uint64_t)v20, (uint64_t)v22);
    sub_21EB726D8((uint64_t)v22, v51, &qword_255478168);
    swift_storeEnumTagMultiPayload();
    sub_21EB72568();
    sub_21EB65BBC(&qword_255478198, (void (*)(uint64_t))type metadata accessor for WebView);
    sub_21EBB777C();
    sub_21EB72984((uint64_t)v22, &qword_255478168);
  }
  else
  {
    v31 = v44;
    v30 = v45;
    v32 = v46;
    (*(void (**)(char *, char *, uint64_t))(v45 + 32))(v44, v25, v46);
    (*(void (**)(char *, char *, uint64_t))(v30 + 16))(v40, v31, v32);
    v33 = v41;
    sub_21EBB73A4();
    sub_21EB722D8(v54, (uint64_t)&v39 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0), type metadata accessor for TumblrWebView);
    v34 = (*(unsigned __int8 *)(v48 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v48 + 80);
    v35 = swift_allocObject();
    sub_21EB86410((uint64_t)&v39 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0), v35 + v34);
    v36 = (uint64_t)v47;
    (*(void (**)(char *, char *, uint64_t))(v42 + 32))(v47, v33, v43);
    v37 = v51;
    v38 = (_QWORD *)(v36 + *(int *)(v52 + 20));
    *v38 = &unk_255479118;
    v38[1] = v35;
    sub_21EB722D8(v36, v37, type metadata accessor for WebView);
    swift_storeEnumTagMultiPayload();
    sub_21EB72568();
    sub_21EB65BBC(&qword_255478198, (void (*)(uint64_t))type metadata accessor for WebView);
    sub_21EBB777C();
    sub_21EB6FD5C(v36, type metadata accessor for WebView);
    (*(void (**)(char *, uint64_t))(v30 + 8))(v31, v32);
  }
}

uint64_t sub_21EB8484C(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata accessor for TumblrWebView(0);
  return (*(uint64_t (**)(_QWORD, _QWORD))(a1 + *(int *)(v2 + 28)))(0, 0);
}

uint64_t sub_21EB84888(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;

  v2[2] = a1;
  v2[3] = a2;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_255477C80);
  v2[4] = swift_task_alloc();
  v3 = sub_21EBB73BC();
  v2[5] = v3;
  v2[6] = *(_QWORD *)(v3 - 8);
  v2[7] = swift_task_alloc();
  v4 = sub_21EBB7464();
  v2[8] = v4;
  v2[9] = *(_QWORD *)(v4 - 8);
  v2[10] = swift_task_alloc();
  sub_21EBB7C20();
  v2[11] = sub_21EBB7C14();
  sub_21EBB7BF0();
  return swift_task_switch();
}

uint64_t sub_21EB84968()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;

  v2 = *(_QWORD *)(v0 + 56);
  v1 = *(_QWORD *)(v0 + 64);
  v3 = *(_QWORD *)(v0 + 48);
  v4 = *(_QWORD *)(v0 + 32);
  v5 = *(void **)(v0 + 16);
  swift_release();
  v6 = objc_msgSend(v5, sel_request);
  sub_21EBB7398();

  sub_21EBB73B0();
  OUTLINED_FUNCTION_6_2(v2, *(uint64_t (**)(uint64_t, uint64_t))(v3 + 8));
  if (__swift_getEnumTagSinglePayload(v4, 1, v1) != 1)
  {
    v7 = *(_QWORD *)(v0 + 24);
    (*(void (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(v0 + 72) + 32))(*(_QWORD *)(v0 + 80), *(_QWORD *)(v0 + 32), *(_QWORD *)(v0 + 64));
    v8 = sub_21EBB744C();
    if (v9)
    {
      if (v8 == *(_QWORD *)(v7 + 8) && v9 == *(_QWORD *)(v7 + 16))
      {
        swift_bridgeObjectRelease();
      }
      else
      {
        v11 = sub_21EBB7D88();
        swift_bridgeObjectRelease();
        if ((v11 & 1) == 0)
          goto LABEL_9;
      }
      v14 = *(_QWORD *)(v0 + 72);
      v13 = *(_QWORD *)(v0 + 80);
      v15 = *(_QWORD *)(v0 + 64);
      v16 = **(void ***)(v0 + 24);
      v17 = (void *)sub_21EBB7434();
      objc_msgSend(v16, sel_handleOpenURL_, v17);

      (*(void (**)(uint64_t, uint64_t))(v14 + 8))(v13, v15);
      v12 = 0;
      goto LABEL_13;
    }
LABEL_9:
    (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 72) + 8))(*(_QWORD *)(v0 + 80), *(_QWORD *)(v0 + 64));
    goto LABEL_10;
  }
  sub_21EB72984(*(_QWORD *)(v0 + 32), (uint64_t *)&unk_255477C80);
LABEL_10:
  v12 = 1;
LABEL_13:
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(uint64_t))(v0 + 8))(v12);
}

void sub_21EB84AF8(void **a1)
{
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  int EnumTagSinglePayload;
  void *v16;
  uint64_t v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t aBlock;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;

  v2 = type metadata accessor for TumblrWebView(0);
  v27 = *(_QWORD *)(v2 - 8);
  v3 = *(_QWORD *)(v27 + 64);
  MEMORY[0x24BDAC7A8](v2);
  v4 = (char *)&v24 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = type metadata accessor for TumblrWebView.LoadingState(0);
  v6 = MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v24 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = MEMORY[0x24BDAC7A8](v6);
  v11 = (char *)&v24 - v10;
  MEMORY[0x24BDAC7A8](v9);
  v13 = (char *)&v24 - v12;
  __swift_instantiateConcreteTypeFromMangledName(qword_255478FE8);
  sub_21EBB79D4();
  v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_255478FD8);
  EnumTagSinglePayload = __swift_getEnumTagSinglePayload((uint64_t)v13, 2, v14);
  sub_21EB6FD5C((uint64_t)v13, type metadata accessor for TumblrWebView.LoadingState);
  if (EnumTagSinglePayload == 1)
  {
    __swift_storeEnumTagSinglePayload((uint64_t)v11, 2, 2, v14);
    sub_21EB722D8((uint64_t)v11, (uint64_t)v8, type metadata accessor for TumblrWebView.LoadingState);
    sub_21EBB79E0();
    sub_21EB6FD5C((uint64_t)v11, type metadata accessor for TumblrWebView.LoadingState);
    v16 = *a1;
    v17 = (uint64_t)a1[2];
    v25 = a1[1];
    v26 = v16;
    sub_21EB722D8((uint64_t)a1, (uint64_t)&v24 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0), type metadata accessor for TumblrWebView);
    v18 = (*(unsigned __int8 *)(v27 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v27 + 80);
    v19 = swift_allocObject();
    sub_21EB86410((uint64_t)v4, v19 + v18);
    v32 = sub_21EB86610;
    v33 = v19;
    v20 = MEMORY[0x24BDAC760];
    aBlock = MEMORY[0x24BDAC760];
    v29 = 1107296256;
    v30 = sub_21EB852A4;
    v31 = &block_descriptor_25_0;
    v21 = _Block_copy(&aBlock);
    swift_bridgeObjectRetain();
    swift_release();
    sub_21EB722D8((uint64_t)a1, (uint64_t)v4, type metadata accessor for TumblrWebView);
    v22 = swift_allocObject();
    sub_21EB86410((uint64_t)v4, v22 + v18);
    v32 = sub_21EB8663C;
    v33 = v22;
    aBlock = v20;
    v29 = 1107296256;
    v30 = sub_21EB8542C;
    v31 = &block_descriptor_31_0;
    v23 = _Block_copy(&aBlock);
    swift_release();
    sub_21EB86694((uint64_t)v25, v17, (uint64_t)v21, (uint64_t)v23, v26);
    swift_bridgeObjectRelease();
    _Block_release(v23);
    _Block_release(v21);
  }
}

void sub_21EB84DE0(uint64_t a1, uint64_t a2)
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
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  void (*v20)(char *, char *, uint64_t);
  uint64_t v21;
  unint64_t v22;
  unint64_t v23;
  uint64_t v24;
  void *v25;
  char *v26;
  char *v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  char *v32;
  uint64_t v33;
  char *v34;
  uint64_t v35;
  uint64_t v36;
  char *v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  uint64_t v41;
  _QWORD aBlock[6];

  v33 = a2;
  v40 = (void *)a1;
  v2 = sub_21EBB7ADC();
  v38 = *(_QWORD *)(v2 - 8);
  v39 = v2;
  MEMORY[0x24BDAC7A8](v2);
  v37 = (char *)&v30 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = sub_21EBB7B00();
  v35 = *(_QWORD *)(v4 - 8);
  v36 = v4;
  MEMORY[0x24BDAC7A8](v4);
  v34 = (char *)&v30 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = type metadata accessor for TumblrWebView(0);
  v7 = *(_QWORD *)(v6 - 8);
  v8 = *(_QWORD *)(v7 + 64);
  MEMORY[0x24BDAC7A8](v6);
  v9 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_255477C80);
  MEMORY[0x24BDAC7A8](v9);
  v11 = (char *)&v30 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = sub_21EBB7464();
  v13 = *(_QWORD *)(v12 - 8);
  v14 = *(_QWORD *)(v13 + 64);
  v15 = MEMORY[0x24BDAC7A8](v12);
  v16 = (char *)&v30 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v15);
  v18 = (char *)&v30 - v17;
  sub_21EB726D8((uint64_t)v40, (uint64_t)v11, (uint64_t *)&unk_255477C80);
  if (__swift_getEnumTagSinglePayload((uint64_t)v11, 1, v12) == 1)
  {
    sub_21EB72984((uint64_t)v11, (uint64_t *)&unk_255477C80);
  }
  else
  {
    v19 = v13;
    v20 = *(void (**)(char *, char *, uint64_t))(v13 + 32);
    v30 = v7;
    v21 = v19;
    v32 = v18;
    v20(v18, v11, v12);
    sub_21EB6FC70();
    v40 = (void *)sub_21EBB7C80();
    sub_21EB722D8(v33, (uint64_t)&v30 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0), type metadata accessor for TumblrWebView);
    v31 = v21;
    (*(void (**)(char *, char *, uint64_t))(v21 + 16))(v16, v18, v12);
    v22 = (*(unsigned __int8 *)(v30 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v30 + 80);
    v23 = (v8 + *(unsigned __int8 *)(v21 + 80) + v22) & ~(unint64_t)*(unsigned __int8 *)(v21 + 80);
    v24 = swift_allocObject();
    sub_21EB86410((uint64_t)&v30 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0), v24 + v22);
    v20((char *)(v24 + v23), v16, v12);
    aBlock[4] = sub_21EB86894;
    aBlock[5] = v24;
    aBlock[0] = MEMORY[0x24BDAC760];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_21EB83A60;
    aBlock[3] = &block_descriptor_37;
    v25 = _Block_copy(aBlock);
    v26 = v34;
    sub_21EBB7AF4();
    v41 = MEMORY[0x24BEE4AF8];
    sub_21EB65BBC(&qword_255477E90, (void (*)(uint64_t))MEMORY[0x24BEE5458]);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_255477C30);
    sub_21EB72A50(&qword_255477EA0, (uint64_t *)&unk_255477C30);
    v27 = v37;
    v28 = v39;
    sub_21EBB7CEC();
    v29 = v40;
    MEMORY[0x2207B78E0](0, v26, v27, v25);
    _Block_release(v25);

    (*(void (**)(char *, uint64_t))(v38 + 8))(v27, v28);
    (*(void (**)(char *, uint64_t))(v35 + 8))(v26, v36);
    (*(void (**)(char *, uint64_t))(v31 + 8))(v32, v12);
    swift_release();
  }
}

void sub_21EB85194(uint64_t a1, uint64_t a2)
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

  v3 = type metadata accessor for TumblrWebView.LoadingState(0);
  v4 = MEMORY[0x24BDAC7A8](v3);
  v6 = (char *)&v11 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v4);
  v8 = (char *)&v11 - v7;
  v9 = sub_21EBB7464();
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 16))(v8, a2, v9);
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_255478FD8);
  __swift_storeEnumTagSinglePayload((uint64_t)v8, 0, 2, v10);
  type metadata accessor for TumblrWebView(0);
  sub_21EB722D8((uint64_t)v8, (uint64_t)v6, type metadata accessor for TumblrWebView.LoadingState);
  __swift_instantiateConcreteTypeFromMangledName(qword_255478FE8);
  sub_21EBB79E0();
  sub_21EB6FD5C((uint64_t)v8, type metadata accessor for TumblrWebView.LoadingState);
}

void sub_21EB852A4(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
  void (*v7)(char *);
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v4 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_255477C80);
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)&v10 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = *(void (**)(char *))(a1 + 32);
  if (a2)
  {
    sub_21EBB7440();
    v8 = sub_21EBB7464();
    v9 = 0;
  }
  else
  {
    v8 = sub_21EBB7464();
    v9 = 1;
  }
  __swift_storeEnumTagSinglePayload((uint64_t)v6, v9, 1, v8);
  swift_retain();
  v7(v6);
  swift_release();
  sub_21EB72984((uint64_t)v6, (uint64_t *)&unk_255477C80);
}

uint64_t sub_21EB85374(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  void *v12;
  uint64_t (*v13)(uint64_t, _QWORD);
  uint64_t (*v15)(_QWORD, uint64_t);

  if (a2 && a4)
  {
    v12 = (void *)objc_opt_self();
    sub_21EB866F0(a1, a2, v12);
    sub_21EB86734(a3, a4, v12);
    v13 = *(uint64_t (**)(uint64_t, _QWORD))(a6 + *(int *)(type metadata accessor for TumblrWebView(0) + 28));
    return v13(1, 0);
  }
  else
  {
    v15 = *(uint64_t (**)(_QWORD, uint64_t))(a6 + *(int *)(type metadata accessor for TumblrWebView(0) + 28));
    return v15(0, a5);
  }
}

uint64_t sub_21EB8542C(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  uint64_t v5;
  void (*v6)(uint64_t, uint64_t, uint64_t, uint64_t, void *);
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;

  v5 = a3;
  v6 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t, void *))(a1 + 32);
  if (!a2)
  {
    v7 = 0;
    v9 = 0;
    if (a3)
      goto LABEL_3;
LABEL_5:
    v10 = 0;
    goto LABEL_6;
  }
  v7 = sub_21EBB7B60();
  v9 = v8;
  if (!v5)
    goto LABEL_5;
LABEL_3:
  v10 = sub_21EBB7B60();
  v5 = v11;
LABEL_6:
  swift_retain();
  v12 = a4;
  v6(v7, v9, v10, v5, a4);
  swift_release();

  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t sub_21EB854E8()
{
  uint64_t v0;

  swift_release();
  return swift_deallocObject();
}

void sub_21EB8551C()
{
  uint64_t v0;

  sub_21EB83D74(*(_QWORD *)(v0 + 16), *(void **)(v0 + 24), *(_QWORD *)(v0 + 32), *(_QWORD *)(v0 + 40));
}

uint64_t block_copy_helper_5(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_5()
{
  return swift_release();
}

uint64_t type metadata accessor for TumblrWebView.LoadingState(uint64_t a1)
{
  return sub_21EB6FD2C(a1, (uint64_t *)&unk_255479100);
}

uint64_t type metadata accessor for TumblrWebView(uint64_t a1)
{
  return sub_21EB6FD2C(a1, (uint64_t *)&unk_255479048);
}

uint64_t sub_21EB85568()
{
  uint64_t v0;

  _Block_release(*(const void **)(v0 + 16));
  return swift_deallocObject();
}

char *sub_21EB8558C(char *a1, char **a2, uint64_t a3)
{
  int v3;
  char *v4;
  char *v7;
  char *v8;
  uint64_t v9;
  char *v10;
  char *v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  _QWORD *v19;
  uint64_t v20;

  v3 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  v4 = *a2;
  *(_QWORD *)a1 = *a2;
  if ((v3 & 0x20000) != 0)
  {
    v7 = &v4[(v3 + 16) & ~(unint64_t)v3];
  }
  else
  {
    v7 = a1;
    v8 = a2[2];
    *((_QWORD *)a1 + 1) = a2[1];
    *((_QWORD *)a1 + 2) = v8;
    v9 = *(int *)(a3 + 24);
    v10 = &a1[v9];
    v11 = (char *)a2 + v9;
    v12 = v4;
    swift_bridgeObjectRetain();
    v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_255478FD8);
    if (__swift_getEnumTagSinglePayload((uint64_t)v11, 2, v13))
    {
      v14 = type metadata accessor for TumblrWebView.LoadingState(0);
      memcpy(v10, v11, *(_QWORD *)(*(_QWORD *)(v14 - 8) + 64));
    }
    else
    {
      v15 = sub_21EBB7464();
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v15 - 8) + 16))(v10, v11, v15);
      __swift_storeEnumTagSinglePayload((uint64_t)v10, 0, 2, v13);
    }
    v16 = __swift_instantiateConcreteTypeFromMangledName(qword_255478FE8);
    *(_QWORD *)&v10[*(int *)(v16 + 28)] = *(_QWORD *)&v11[*(int *)(v16 + 28)];
    v17 = *(int *)(a3 + 28);
    v18 = &v7[v17];
    v19 = (char **)((char *)a2 + v17);
    v20 = v19[1];
    *(_QWORD *)v18 = *v19;
    *((_QWORD *)v18 + 1) = v20;
    swift_retain();
  }
  swift_retain();
  return v7;
}

uint64_t sub_21EB856C4(id *a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  swift_bridgeObjectRelease();
  v4 = (uint64_t)a1 + *(int *)(a2 + 24);
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_255478FD8);
  if (!__swift_getEnumTagSinglePayload(v4, 2, v5))
  {
    v6 = sub_21EBB7464();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 8))(v4, v6);
  }
  __swift_instantiateConcreteTypeFromMangledName(qword_255478FE8);
  swift_release();
  return swift_release();
}

_QWORD *sub_21EB85764(_QWORD *a1, uint64_t a2, uint64_t a3)
{
  void *v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  char *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD *v17;
  _QWORD *v18;
  uint64_t v19;

  v6 = *(void **)a2;
  v7 = *(_QWORD *)(a2 + 8);
  *a1 = *(_QWORD *)a2;
  a1[1] = v7;
  a1[2] = *(_QWORD *)(a2 + 16);
  v8 = *(int *)(a3 + 24);
  v9 = (char *)a1 + v8;
  v10 = (char *)(a2 + v8);
  v11 = v6;
  swift_bridgeObjectRetain();
  v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_255478FD8);
  if (__swift_getEnumTagSinglePayload((uint64_t)v10, 2, v12))
  {
    v13 = type metadata accessor for TumblrWebView.LoadingState(0);
    memcpy(v9, v10, *(_QWORD *)(*(_QWORD *)(v13 - 8) + 64));
  }
  else
  {
    v14 = sub_21EBB7464();
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v14 - 8) + 16))(v9, v10, v14);
    __swift_storeEnumTagSinglePayload((uint64_t)v9, 0, 2, v12);
  }
  v15 = __swift_instantiateConcreteTypeFromMangledName(qword_255478FE8);
  *(_QWORD *)&v9[*(int *)(v15 + 28)] = *(_QWORD *)&v10[*(int *)(v15 + 28)];
  v16 = *(int *)(a3 + 28);
  v17 = (_QWORD *)((char *)a1 + v16);
  v18 = (_QWORD *)(a2 + v16);
  v19 = v18[1];
  *v17 = *v18;
  v17[1] = v19;
  swift_retain();
  swift_retain();
  return a1;
}

uint64_t sub_21EB85874(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  char *v10;
  char *v11;
  uint64_t v12;
  int EnumTagSinglePayload;
  int v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  _QWORD *v19;
  _QWORD *v20;
  uint64_t v21;
  uint64_t v23;

  v6 = *(void **)a2;
  v7 = *(void **)a1;
  *(_QWORD *)a1 = *(_QWORD *)a2;
  v8 = v6;

  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v9 = *(int *)(a3 + 24);
  v10 = (char *)(a1 + v9);
  v11 = (char *)(a2 + v9);
  v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_255478FD8);
  EnumTagSinglePayload = __swift_getEnumTagSinglePayload((uint64_t)v10, 2, v12);
  v14 = __swift_getEnumTagSinglePayload((uint64_t)v11, 2, v12);
  if (!EnumTagSinglePayload)
  {
    if (!v14)
    {
      v23 = sub_21EBB7464();
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v23 - 8) + 24))(v10, v11, v23);
      goto LABEL_7;
    }
    sub_21EB72984((uint64_t)v10, &qword_255478FD8);
    goto LABEL_6;
  }
  if (v14)
  {
LABEL_6:
    v16 = type metadata accessor for TumblrWebView.LoadingState(0);
    memcpy(v10, v11, *(_QWORD *)(*(_QWORD *)(v16 - 8) + 64));
    goto LABEL_7;
  }
  v15 = sub_21EBB7464();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v15 - 8) + 16))(v10, v11, v15);
  __swift_storeEnumTagSinglePayload((uint64_t)v10, 0, 2, v12);
LABEL_7:
  v17 = __swift_instantiateConcreteTypeFromMangledName(qword_255478FE8);
  *(_QWORD *)&v10[*(int *)(v17 + 28)] = *(_QWORD *)&v11[*(int *)(v17 + 28)];
  swift_retain();
  swift_release();
  v18 = *(int *)(a3 + 28);
  v19 = (_QWORD *)(a1 + v18);
  v20 = (_QWORD *)(a2 + v18);
  v21 = v20[1];
  *v19 = *v20;
  v19[1] = v21;
  swift_retain();
  swift_release();
  return a1;
}

uint64_t sub_21EB85A08(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  char *v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  v6 = *(int *)(a3 + 24);
  v7 = (char *)(a1 + v6);
  v8 = (char *)(a2 + v6);
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_255478FD8);
  if (__swift_getEnumTagSinglePayload((uint64_t)v8, 2, v9))
  {
    v10 = type metadata accessor for TumblrWebView.LoadingState(0);
    memcpy(v7, v8, *(_QWORD *)(*(_QWORD *)(v10 - 8) + 64));
  }
  else
  {
    v11 = sub_21EBB7464();
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v11 - 8) + 32))(v7, v8, v11);
    __swift_storeEnumTagSinglePayload((uint64_t)v7, 0, 2, v9);
  }
  v12 = __swift_instantiateConcreteTypeFromMangledName(qword_255478FE8);
  *(_QWORD *)&v7[*(int *)(v12 + 28)] = *(_QWORD *)&v8[*(int *)(v12 + 28)];
  *(_OWORD *)(a1 + *(int *)(a3 + 28)) = *(_OWORD *)(a2 + *(int *)(a3 + 28));
  return a1;
}

uint64_t sub_21EB85AF8(uint64_t a1, _QWORD *a2, uint64_t a3)
{
  void *v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  char *v10;
  uint64_t v11;
  int EnumTagSinglePayload;
  int v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v18;

  v6 = *(void **)a1;
  *(_QWORD *)a1 = *a2;

  v7 = a2[2];
  *(_QWORD *)(a1 + 8) = a2[1];
  *(_QWORD *)(a1 + 16) = v7;
  swift_bridgeObjectRelease();
  v8 = *(int *)(a3 + 24);
  v9 = (char *)(a1 + v8);
  v10 = (char *)a2 + v8;
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_255478FD8);
  EnumTagSinglePayload = __swift_getEnumTagSinglePayload((uint64_t)v9, 2, v11);
  v13 = __swift_getEnumTagSinglePayload((uint64_t)v10, 2, v11);
  if (!EnumTagSinglePayload)
  {
    if (!v13)
    {
      v18 = sub_21EBB7464();
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v18 - 8) + 40))(v9, v10, v18);
      goto LABEL_7;
    }
    sub_21EB72984((uint64_t)v9, &qword_255478FD8);
    goto LABEL_6;
  }
  if (v13)
  {
LABEL_6:
    v15 = type metadata accessor for TumblrWebView.LoadingState(0);
    memcpy(v9, v10, *(_QWORD *)(*(_QWORD *)(v15 - 8) + 64));
    goto LABEL_7;
  }
  v14 = sub_21EBB7464();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v14 - 8) + 32))(v9, v10, v14);
  __swift_storeEnumTagSinglePayload((uint64_t)v9, 0, 2, v11);
LABEL_7:
  v16 = __swift_instantiateConcreteTypeFromMangledName(qword_255478FE8);
  *(_QWORD *)&v9[*(int *)(v16 + 28)] = *(_QWORD *)&v10[*(int *)(v16 + 28)];
  swift_release();
  *(_OWORD *)(a1 + *(int *)(a3 + 28)) = *(_OWORD *)((char *)a2 + *(int *)(a3 + 28));
  swift_release();
  return a1;
}

uint64_t sub_21EB85C64()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_21EB85C70(uint64_t *a1, uint64_t a2, uint64_t a3)
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
    v8 = __swift_instantiateConcreteTypeFromMangledName(qword_255478FE8);
    return __swift_getEnumTagSinglePayload((uint64_t)a1 + *(int *)(a3 + 24), a2, v8);
  }
}

uint64_t sub_21EB85CE8()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

_QWORD *sub_21EB85CF4(_QWORD *result, uint64_t a2, int a3, uint64_t a4)
{
  _QWORD *v5;
  uint64_t v7;

  v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *result = (a2 - 1);
  }
  else
  {
    v7 = __swift_instantiateConcreteTypeFromMangledName(qword_255478FE8);
    return (_QWORD *)OUTLINED_FUNCTION_3_3((uint64_t)v5 + *(int *)(a4 + 24), a2, a2, v7);
  }
  return result;
}

void sub_21EB85D5C()
{
  unint64_t v0;

  sub_21EB85DE8();
  if (v0 <= 0x3F)
    swift_initStructMetadata();
}

void sub_21EB85DE8()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_255479058[0])
  {
    type metadata accessor for TumblrWebView.LoadingState(255);
    v0 = sub_21EBB79F8();
    if (!v1)
      atomic_store(v0, qword_255479058);
  }
}

uint64_t *sub_21EB85E3C(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v5;
  int v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v5 = *(_QWORD *)(a3 - 8);
  v6 = *(_DWORD *)(v5 + 80);
  if ((v6 & 0x20000) != 0)
  {
    v8 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v8 + ((v6 + 16) & ~(unint64_t)v6));
    swift_retain();
  }
  else
  {
    v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_255478FD8);
    if (__swift_getEnumTagSinglePayload((uint64_t)a2, 2, v7))
    {
      memcpy(a1, a2, *(_QWORD *)(v5 + 64));
    }
    else
    {
      v9 = sub_21EBB7464();
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v9 - 8) + 16))(a1, a2, v9);
      __swift_storeEnumTagSinglePayload((uint64_t)a1, 0, 2, v7);
    }
  }
  return a1;
}

uint64_t sub_21EB85F00(uint64_t a1)
{
  uint64_t v2;
  uint64_t result;
  uint64_t v4;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_255478FD8);
  result = __swift_getEnumTagSinglePayload(a1, 2, v2);
  if (!(_DWORD)result)
  {
    v4 = sub_21EBB7464();
    return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(a1, v4);
  }
  return result;
}

void *sub_21EB85F60(void *a1, const void *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_255478FD8);
  if (__swift_getEnumTagSinglePayload((uint64_t)a2, 2, v6))
  {
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64));
  }
  else
  {
    v7 = sub_21EBB7464();
    (*(void (**)(void *, const void *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a1, a2, v7);
    __swift_storeEnumTagSinglePayload((uint64_t)a1, 0, 2, v6);
  }
  return a1;
}

void *sub_21EB86000(void *a1, const void *a2, uint64_t a3)
{
  uint64_t v6;
  int EnumTagSinglePayload;
  int v8;
  uint64_t v9;
  uint64_t v11;

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_255478FD8);
  EnumTagSinglePayload = __swift_getEnumTagSinglePayload((uint64_t)a1, 2, v6);
  v8 = __swift_getEnumTagSinglePayload((uint64_t)a2, 2, v6);
  if (!EnumTagSinglePayload)
  {
    if (!v8)
    {
      v11 = sub_21EBB7464();
      (*(void (**)(void *, const void *, uint64_t))(*(_QWORD *)(v11 - 8) + 24))(a1, a2, v11);
      return a1;
    }
    sub_21EB72984((uint64_t)a1, &qword_255478FD8);
    goto LABEL_6;
  }
  if (v8)
  {
LABEL_6:
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64));
    return a1;
  }
  v9 = sub_21EBB7464();
  (*(void (**)(void *, const void *, uint64_t))(*(_QWORD *)(v9 - 8) + 16))(a1, a2, v9);
  __swift_storeEnumTagSinglePayload((uint64_t)a1, 0, 2, v6);
  return a1;
}

void *sub_21EB860F8(void *a1, const void *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_255478FD8);
  if (__swift_getEnumTagSinglePayload((uint64_t)a2, 2, v6))
  {
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64));
  }
  else
  {
    v7 = sub_21EBB7464();
    (*(void (**)(void *, const void *, uint64_t))(*(_QWORD *)(v7 - 8) + 32))(a1, a2, v7);
    __swift_storeEnumTagSinglePayload((uint64_t)a1, 0, 2, v6);
  }
  return a1;
}

void *sub_21EB86198(void *a1, const void *a2, uint64_t a3)
{
  uint64_t v6;
  int EnumTagSinglePayload;
  int v8;
  uint64_t v9;
  uint64_t v11;

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_255478FD8);
  EnumTagSinglePayload = __swift_getEnumTagSinglePayload((uint64_t)a1, 2, v6);
  v8 = __swift_getEnumTagSinglePayload((uint64_t)a2, 2, v6);
  if (!EnumTagSinglePayload)
  {
    if (!v8)
    {
      v11 = sub_21EBB7464();
      (*(void (**)(void *, const void *, uint64_t))(*(_QWORD *)(v11 - 8) + 40))(a1, a2, v11);
      return a1;
    }
    sub_21EB72984((uint64_t)a1, &qword_255478FD8);
    goto LABEL_6;
  }
  if (v8)
  {
LABEL_6:
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64));
    return a1;
  }
  v9 = sub_21EBB7464();
  (*(void (**)(void *, const void *, uint64_t))(*(_QWORD *)(v9 - 8) + 32))(a1, a2, v9);
  __swift_storeEnumTagSinglePayload((uint64_t)a1, 0, 2, v6);
  return a1;
}

uint64_t sub_21EB86290()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_21EB8629C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  unsigned int EnumTagSinglePayload;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_255478FD8);
  EnumTagSinglePayload = __swift_getEnumTagSinglePayload(a1, a2, v4);
  if (EnumTagSinglePayload >= 3)
    return EnumTagSinglePayload - 2;
  else
    return 0;
}

uint64_t sub_21EB862E4()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_21EB862F0(uint64_t a1, int a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;

  if (a2)
    v5 = (a2 + 2);
  else
    v5 = 0;
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_255478FD8);
  return OUTLINED_FUNCTION_3_3(a1, v5, a3, v6);
}

uint64_t sub_21EB86338(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_255478FD8);
  return __swift_getEnumTagSinglePayload(a1, 2, v2);
}

uint64_t sub_21EB8636C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_255478FD8);
  return __swift_storeEnumTagSinglePayload(a1, a2, 2, v4);
}

uint64_t sub_21EB863A8()
{
  uint64_t result;
  unint64_t v1;

  result = sub_21EBB7464();
  if (v1 <= 0x3F)
  {
    swift_initEnumMetadataSinglePayload();
    return 0;
  }
  return result;
}

uint64_t sub_21EB863FC()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_21EB86410(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for TumblrWebView(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

void sub_21EB86454(uint64_t a1@<X8>)
{
  type metadata accessor for TumblrWebView(0);
  OUTLINED_FUNCTION_5_6();
  sub_21EB842B8(a1);
}

uint64_t objectdestroy_8Tm_0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  id *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v1 = type metadata accessor for TumblrWebView(0);
  v2 = *(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80);
  v3 = (id *)(v0 + ((v2 + 16) & ~v2));

  swift_bridgeObjectRelease();
  v4 = (uint64_t)v3 + *(int *)(v1 + 24);
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_255478FD8);
  if (!__swift_getEnumTagSinglePayload(v4, 2, v5))
  {
    v6 = OUTLINED_FUNCTION_8_3();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 8))(v4, v6);
  }
  __swift_instantiateConcreteTypeFromMangledName(qword_255478FE8);
  swift_release();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_21EB86568()
{
  return sub_21EB865E4(sub_21EB8484C);
}

uint64_t sub_21EB86578(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  _QWORD *v4;

  type metadata accessor for TumblrWebView(0);
  OUTLINED_FUNCTION_5_6();
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v4;
  *v4 = v2;
  v4[1] = sub_21EB72518;
  return sub_21EB84888(a1, v1);
}

uint64_t sub_21EB865D8()
{
  return sub_21EB865E4((uint64_t (*)(uint64_t))sub_21EB84AF8);
}

uint64_t sub_21EB865E4(uint64_t (*a1)(uint64_t))
{
  uint64_t v1;
  uint64_t v2;

  OUTLINED_FUNCTION_0_6();
  return a1(v1 + v2);
}

void sub_21EB86610(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;

  OUTLINED_FUNCTION_0_6();
  sub_21EB84DE0(a1, v1 + v3);
}

uint64_t sub_21EB8663C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;
  uint64_t v11;

  OUTLINED_FUNCTION_0_6();
  return sub_21EB85374(a1, a2, a3, a4, a5, v5 + v11);
}

void sub_21EB86694(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v8;

  v8 = (id)sub_21EBB7B48();
  objc_msgSend(a5, sel_authenticate_urlBlock_callback_, v8, a3, a4);

}

void sub_21EB866F0(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;

  v4 = (id)sub_21EBB7B48();
  objc_msgSend(a3, sel_setTumblrOAuthToken_, v4);

}

void sub_21EB86734(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;

  v4 = (id)sub_21EBB7B48();
  objc_msgSend(a3, sel_setTumblrOAuthTokenSecret_, v4);

}

uint64_t sub_21EB86778()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v9;

  v1 = type metadata accessor for TumblrWebView(0);
  v2 = *(_QWORD *)(v1 - 8);
  v3 = (*(unsigned __int8 *)(v2 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  v9 = *(_QWORD *)(v2 + 64);
  v4 = *(_QWORD *)(OUTLINED_FUNCTION_8_3() - 8);
  v5 = *(unsigned __int8 *)(v4 + 80);

  swift_bridgeObjectRelease();
  v6 = v0 + v3 + *(int *)(v1 + 24);
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_255478FD8);
  if (!__swift_getEnumTagSinglePayload(v6, 2, v7))
    OUTLINED_FUNCTION_6_2(v6, *(uint64_t (**)(uint64_t, uint64_t))(v4 + 8));
  __swift_instantiateConcreteTypeFromMangledName(qword_255478FE8);
  swift_release();
  swift_release();
  OUTLINED_FUNCTION_6_2(v0 + ((v3 + v9 + v5) & ~v5), *(uint64_t (**)(uint64_t, uint64_t))(v4 + 8));
  return swift_deallocObject();
}

void sub_21EB86894()
{
  uint64_t v0;
  uint64_t v1;
  unint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v1 = *(_QWORD *)(type metadata accessor for TumblrWebView(0) - 8);
  v2 = (*(unsigned __int8 *)(v1 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80);
  v3 = *(_QWORD *)(v1 + 64);
  v4 = *(unsigned __int8 *)(*(_QWORD *)(OUTLINED_FUNCTION_8_3() - 8) + 80);
  sub_21EB85194(v0 + v2, v0 + ((v2 + v3 + v4) & ~v4));
}

void sub_21EB868F0()
{
  sub_21EB72A50(qword_2554781C0, (uint64_t *)&unk_255479120);
}

uint64_t OUTLINED_FUNCTION_0_6()
{
  return type metadata accessor for TumblrWebView(0);
}

uint64_t sub_21EB86994()
{
  return sub_21EB6AA68(0, &qword_255479198);
}

uint64_t sub_21EB869EC()
{
  void *v0;
  id v1;
  objc_super v3;

  v3.receiver = v0;
  v3.super_class = (Class)swift_getObjectType();
  v1 = objc_msgSendSuper2(&v3, sel_layer);
  objc_opt_self();
  return swift_dynamicCastObjCClassUnconditional();
}

id sub_21EB86A58(double a1, double a2, double a3, double a4)
{
  void *v4;
  objc_super v10;

  v10.receiver = v4;
  v10.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v10, sel_initWithFrame_, a1, a2, a3, a4);
}

id sub_21EB86ADC(void *a1)
{
  void *v1;
  id v3;
  objc_super v5;

  v5.receiver = v1;
  v5.super_class = (Class)swift_getObjectType();
  v3 = objc_msgSendSuper2(&v5, sel_initWithCoder_, a1);

  return v3;
}

id sub_21EB86B54()
{
  objc_class *v0;
  id v1;
  id v2;
  objc_super v4;

  v0 = (objc_class *)type metadata accessor for WFShazamMediaActionView.ListeningView();
  v1 = objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_init);
  v4.receiver = v1;
  v4.super_class = v0;
  v2 = objc_msgSendSuper2(&v4, sel_layer);
  objc_opt_self();
  objc_msgSend((id)swift_dynamicCastObjCClassUnconditional(), sel_startActiveListeningAnimation);

  objc_msgSend(v1, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
  return v1;
}

id WFShazamMediaActionView.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

char *WFShazamMediaActionView.init()()
{
  char *v0;
  char *v1;
  objc_class *ObjectType;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  id v15;
  char *v16;
  uint64_t v17;
  void *v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;
  id v34;
  id v35;
  id v36;
  id v37;
  id v38;
  void *v39;
  uint64_t v40;
  objc_super v42;

  v1 = v0;
  ObjectType = (objc_class *)swift_getObjectType();
  v3 = OBJC_IVAR___WFShazamMediaActionView_listeningView;
  v4 = v0;
  *(_QWORD *)&v1[v3] = sub_21EB86B54();
  v5 = OBJC_IVAR___WFShazamMediaActionView_label;
  v6 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD708]), sel_init);
  sub_21EBB7B78();
  if (qword_2554776B0 != -1)
    swift_once();
  v7 = (id)qword_255478EA8;
  v8 = (void *)OUTLINED_FUNCTION_16();
  v9 = (void *)OUTLINED_FUNCTION_16();
  swift_bridgeObjectRelease();
  v10 = objc_msgSend(v7, sel_localizedStringForKey_value_table_, v8, v9, 0);

  v11 = sub_21EBB7B60();
  v13 = v12;

  sub_21EB8746C(v11, v13, v6);
  v14 = objc_msgSend((id)objc_opt_self(), sel_boldSystemFontOfSize_, 14.0);
  OUTLINED_FUNCTION_0_7((uint64_t)v14, sel_setFont_);

  v15 = objc_msgSend((id)objc_opt_self(), sel_labelColor);
  OUTLINED_FUNCTION_0_7((uint64_t)v15, sel_setTextColor_);

  objc_msgSend(v6, sel_setTextAlignment_, 1);
  objc_msgSend(v6, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
  *(_QWORD *)&v4[v5] = v6;

  v42.receiver = v4;
  v42.super_class = ObjectType;
  v16 = (char *)objc_msgSendSuper2(&v42, sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);
  v17 = OBJC_IVAR___WFShazamMediaActionView_listeningView;
  v18 = *(void **)&v16[OBJC_IVAR___WFShazamMediaActionView_listeningView];
  v19 = v16;
  objc_msgSend(v19, sel_addSubview_, v18);
  v20 = OBJC_IVAR___WFShazamMediaActionView_label;
  objc_msgSend(v19, sel_addSubview_, *(_QWORD *)&v19[OBJC_IVAR___WFShazamMediaActionView_label]);
  objc_opt_self();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2554784E8);
  v21 = swift_allocObject();
  *(_OWORD *)(v21 + 16) = xmmword_21EBBCE70;
  v22 = objc_msgSend(objc_msgSend(v18, sel_widthAnchor), sel_constraintEqualToConstant_, 100.0);
  OUTLINED_FUNCTION_2_6();
  *(_QWORD *)(v21 + 32) = v8;
  v23 = objc_msgSend(objc_msgSend(*(id *)&v16[v17], sel_heightAnchor), sel_constraintEqualToConstant_, 100.0);
  OUTLINED_FUNCTION_2_6();
  *(_QWORD *)(v21 + 40) = v8;
  v24 = objc_msgSend(*(id *)&v16[v17], sel_centerXAnchor);
  v25 = OUTLINED_FUNCTION_1_3((uint64_t)v24, sel_centerXAnchor);
  v26 = objc_msgSend(v24, sel_constraintEqualToAnchor_, v25);

  *(_QWORD *)(v21 + 48) = v26;
  v27 = objc_msgSend(*(id *)&v16[v17], sel_centerYAnchor);
  v28 = OUTLINED_FUNCTION_1_3((uint64_t)v27, sel_centerYAnchor);
  v29 = objc_msgSend(v27, sel_constraintEqualToAnchor_, v28);

  *(_QWORD *)(v21 + 56) = v29;
  v30 = objc_msgSend(*(id *)&v19[v20], sel_leadingAnchor);
  v31 = objc_msgSend(OUTLINED_FUNCTION_1_3((uint64_t)v30, sel_layoutMarginsGuide), sel_leadingAnchor);
  OUTLINED_FUNCTION_2_6();
  v32 = OUTLINED_FUNCTION_3_4();

  *(_QWORD *)(v21 + 64) = v32;
  v33 = objc_msgSend(*(id *)&v19[v20], sel_trailingAnchor);
  v34 = objc_msgSend(OUTLINED_FUNCTION_1_3((uint64_t)v33, sel_layoutMarginsGuide), sel_trailingAnchor);
  OUTLINED_FUNCTION_2_6();
  v35 = OUTLINED_FUNCTION_3_4();

  *(_QWORD *)(v21 + 72) = v35;
  v36 = objc_msgSend(*(id *)&v19[v20], sel_centerYAnchor);
  v37 = OUTLINED_FUNCTION_1_3((uint64_t)v36, sel_centerYAnchor);
  v38 = objc_msgSend(v36, sel_constraintEqualToAnchor_constant_, v37, 72.0);

  *(_QWORD *)(v21 + 80) = v38;
  sub_21EBB7BE4();
  sub_21EB6AA68(0, &qword_255479140);
  v39 = (void *)sub_21EBB7BCC();
  v40 = swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_0_7(v40, sel_activateConstraints_);

  return v19;
}

void sub_21EB87178()
{
  char *v0;
  uint64_t v1;
  uint64_t v2;
  id v3;
  id v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  id v12;

  v1 = OBJC_IVAR___WFShazamMediaActionView_listeningView;
  *(_QWORD *)&v0[v1] = sub_21EB86B54();
  v2 = OBJC_IVAR___WFShazamMediaActionView_label;
  v3 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD708]), sel_init);
  sub_21EBB7B78();
  if (qword_2554776B0 != -1)
    swift_once();
  v4 = (id)qword_255478EA8;
  v5 = (void *)OUTLINED_FUNCTION_5_4();
  v6 = (void *)OUTLINED_FUNCTION_5_4();
  swift_bridgeObjectRelease();
  v7 = objc_msgSend(v4, sel_localizedStringForKey_value_table_, v5, v6, 0);

  v8 = sub_21EBB7B60();
  v10 = v9;

  sub_21EB8746C(v8, v10, v3);
  v11 = objc_msgSend((id)objc_opt_self(), sel_boldSystemFontOfSize_, 14.0);
  OUTLINED_FUNCTION_6_3((uint64_t)v11, sel_setFont_);

  v12 = objc_msgSend((id)objc_opt_self(), sel_labelColor);
  OUTLINED_FUNCTION_6_3((uint64_t)v12, sel_setTextColor_);

  objc_msgSend(v3, sel_setTextAlignment_, 1);
  objc_msgSend(v3, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
  *(_QWORD *)&v0[v2] = v3;

  sub_21EBB7D58();
  __break(1u);
}

id WFShazamMediaActionView.__allocating_init(frame:)(double a1, double a2, double a3, double a4)
{
  objc_class *v4;

  return objc_msgSend(objc_allocWithZone(v4), sel_initWithFrame_, a1, a2, a3, a4);
}

void WFShazamMediaActionView.init(frame:)()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

id sub_21EB87400()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

void sub_21EB8746C(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;

  v4 = (id)sub_21EBB7B48();
  swift_bridgeObjectRelease();
  objc_msgSend(a3, sel_setText_, v4);

}

uint64_t type metadata accessor for WFShazamMediaActionView()
{
  return objc_opt_self();
}

uint64_t type metadata accessor for WFShazamMediaActionView.ListeningView()
{
  return objc_opt_self();
}

id OUTLINED_FUNCTION_0_7(uint64_t a1, const char *a2)
{
  void *v2;
  uint64_t v3;

  return objc_msgSend(v2, a2, v3);
}

id OUTLINED_FUNCTION_1_3(uint64_t a1, const char *a2)
{
  void *v2;

  return objc_msgSend(v2, a2);
}

void OUTLINED_FUNCTION_2_6()
{
  void *v0;

}

id OUTLINED_FUNCTION_3_4()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;

  return objc_msgSend(v0, (SEL)(v2 + 3918), v1);
}

id OUTLINED_FUNCTION_6_3(uint64_t a1, const char *a2)
{
  void *v2;
  uint64_t v3;

  return objc_msgSend(v2, a2, v3);
}

id WFLocalizedString(void *a1)
{
  id v1;
  void *v2;
  void *v3;

  v1 = a1;
  WFCurrentBundle();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", v1, v1, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id WFCurrentBundle()
{
  if (WFCurrentBundle_onceToken != -1)
    dispatch_once(&WFCurrentBundle_onceToken, &__block_literal_global);
  return (id)WFCurrentBundle_bundle;
}

id WFLocalizedStringWithKey(void *a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  void *v6;

  v3 = a2;
  v4 = a1;
  WFCurrentBundle();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localizedStringForKey:value:table:", v4, v3, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

void sub_21EB88634(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_21EB8C37C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31)
{
  id *v31;

  _Block_object_dispose(&a31, 8);
  objc_destroyWeak(v31);
  _Unwind_Resume(a1);
}

void __Block_byref_object_copy_(uint64_t a1, uint64_t a2)
{
  objc_moveWeak((id *)(a1 + 40), (id *)(a2 + 40));
}

void __Block_byref_object_dispose_(uint64_t a1)
{
  objc_destroyWeak((id *)(a1 + 40));
}

void sub_21EB8E1B4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__406(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__407(uint64_t a1)
{

}

void sub_21EB90758(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  uint64_t v8;
  va_list va;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  va_list va1;

  va_start(va1, a7);
  va_start(va, a7);
  v8 = va_arg(va1, _QWORD);
  v10 = va_arg(va1, _QWORD);
  v11 = va_arg(va1, _QWORD);
  v12 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_21EB92DF8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_21EB94F04(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_21EB9A4B0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __getWKWebViewClass_block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;

  WebKitLibrary();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_getClass("WKWebView");
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getWKWebViewClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Class getWKWebViewClass(void)_block_invoke");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("WFShowWebPageActionUIKitUserInterface.m"), 18, CFSTR("Unable to find class %s"), "WKWebView");

    __break(1u);
  }
}

void __getWKWebViewConfigurationClass_block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;

  WebKitLibrary();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_getClass("WKWebViewConfiguration");
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getWKWebViewConfigurationClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Class getWKWebViewConfigurationClass(void)_block_invoke");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("WFShowWebPageActionUIKitUserInterface.m"), 19, CFSTR("Unable to find class %s"), "WKWebViewConfiguration");

    __break(1u);
  }
}

void WebKitLibrary()
{
  void *v0;
  void *v1;
  void *v2;

  if (!WebKitLibraryCore_frameworkLibrary)
    WebKitLibraryCore_frameworkLibrary = _sl_dlopen();
  if (!WebKitLibraryCore_frameworkLibrary)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v0 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "void *WebKitLibrary(void)");
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("WFShowWebPageActionUIKitUserInterface.m"), 17, CFSTR("%s"), 0);

    __break(1u);
    free(v2);
  }
}

void sub_21EB9A9BC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __getSFSafariViewControllerConfigurationClass_block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;

  SafariServicesLibrary();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_getClass("SFSafariViewControllerConfiguration");
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getSFSafariViewControllerConfigurationClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Class getSFSafariViewControllerConfigurationClass(void)_block_invoke");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("WFShowWebPageActionUIKitUserInterface.m"), 23, CFSTR("Unable to find class %s"), "SFSafariViewControllerConfiguration");

    __break(1u);
  }
}

void __getSFSafariViewControllerClass_block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;

  SafariServicesLibrary();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_getClass("SFSafariViewController");
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getSFSafariViewControllerClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Class getSFSafariViewControllerClass(void)_block_invoke");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("WFShowWebPageActionUIKitUserInterface.m"), 22, CFSTR("Unable to find class %s"), "SFSafariViewController");

    __break(1u);
  }
}

void SafariServicesLibrary()
{
  void *v0;
  void *v1;
  void *v2;

  if (!SafariServicesLibraryCore_frameworkLibrary)
    SafariServicesLibraryCore_frameworkLibrary = _sl_dlopen();
  if (!SafariServicesLibraryCore_frameworkLibrary)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v0 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "void *SafariServicesLibrary(void)");
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("WFShowWebPageActionUIKitUserInterface.m"), 21, CFSTR("%s"), 0);

    __break(1u);
    free(v2);
  }
}

void sub_21EB9D358(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, ...)
{
  va_list va;

  va_start(va, a14);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *AVFoundationLibrary()
{
  void *v0;
  void *v2;
  void *v3;

  if (!AVFoundationLibraryCore_frameworkLibrary)
    AVFoundationLibraryCore_frameworkLibrary = _sl_dlopen();
  v0 = (void *)AVFoundationLibraryCore_frameworkLibrary;
  if (!AVFoundationLibraryCore_frameworkLibrary)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v0 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "void *AVFoundationLibrary(void)");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v2, CFSTR("WFScanMachineReadableCodeActionUIKitUserInterface.m"), 17, CFSTR("%s"), 0);

    __break(1u);
    free(v3);
  }
  return v0;
}

void sub_21EB9DCA4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21EB9DD98(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21EB9E328(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_list va;

  va_start(va, a8);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21EB9E5E0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __getAVCaptureSessionClass_block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;

  AVFoundationLibrary_2388();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_getClass("AVCaptureSession");
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getAVCaptureSessionClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Class getAVCaptureSessionClass(void)_block_invoke");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("WFTakePhotoImmediateModeManager.m"), 15, CFSTR("Unable to find class %s"), "AVCaptureSession");

    __break(1u);
  }
}

void *AVFoundationLibrary_2388()
{
  void *v0;
  void *v2;
  void *v3;

  if (!AVFoundationLibraryCore_frameworkLibrary_2392)
    AVFoundationLibraryCore_frameworkLibrary_2392 = _sl_dlopen();
  v0 = (void *)AVFoundationLibraryCore_frameworkLibrary_2392;
  if (!AVFoundationLibraryCore_frameworkLibrary_2392)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v0 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "void *AVFoundationLibrary(void)");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v2, CFSTR("WFTakePhotoImmediateModeManager.m"), 13, CFSTR("%s"), 0);

    __break(1u);
    free(v3);
  }
  return v0;
}

void __getAVCaptureDeviceInputClass_block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;

  AVFoundationLibrary_2388();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_getClass("AVCaptureDeviceInput");
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getAVCaptureDeviceInputClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Class getAVCaptureDeviceInputClass(void)_block_invoke");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("WFTakePhotoImmediateModeManager.m"), 16, CFSTR("Unable to find class %s"), "AVCaptureDeviceInput");

    __break(1u);
  }
}

void __getAVCaptureDeviceDiscoverySessionClass_block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;

  AVFoundationLibrary_2388();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_getClass("AVCaptureDeviceDiscoverySession");
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getAVCaptureDeviceDiscoverySessionClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Class getAVCaptureDeviceDiscoverySessionClass(void)_block_invoke");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("WFTakePhotoImmediateModeManager.m"), 14, CFSTR("Unable to find class %s"), "AVCaptureDeviceDiscoverySession");

    __break(1u);
  }
}

void getAVFoundationErrorDomain()
{
  id *v0;
  void *v1;
  id v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v0 = (id *)getAVFoundationErrorDomainSymbolLoc_ptr;
  v8 = getAVFoundationErrorDomainSymbolLoc_ptr;
  if (!getAVFoundationErrorDomainSymbolLoc_ptr)
  {
    v1 = AVFoundationLibrary_2388();
    v0 = (id *)dlsym(v1, "AVFoundationErrorDomain");
    v6[3] = (uint64_t)v0;
    getAVFoundationErrorDomainSymbolLoc_ptr = (uint64_t)v0;
  }
  _Block_object_dispose(&v5, 8);
  if (v0)
  {
    v2 = *v0;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "NSErrorDomain getAVFoundationErrorDomain(void)");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, CFSTR("WFTakePhotoImmediateModeManager.m"), 23, CFSTR("%s"), dlerror());

    __break(1u);
  }
}

void sub_21EB9EC50(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __getAVCapturePhotoSettingsClass_block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;

  AVFoundationLibrary_2388();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_getClass("AVCapturePhotoSettings");
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getAVCapturePhotoSettingsClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Class getAVCapturePhotoSettingsClass(void)_block_invoke");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("WFTakePhotoImmediateModeManager.m"), 18, CFSTR("Unable to find class %s"), "AVCapturePhotoSettings");

    __break(1u);
  }
}

void __getAVCapturePhotoOutputClass_block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;

  AVFoundationLibrary_2388();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_getClass("AVCapturePhotoOutput");
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getAVCapturePhotoOutputClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Class getAVCapturePhotoOutputClass(void)_block_invoke");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("WFTakePhotoImmediateModeManager.m"), 17, CFSTR("Unable to find class %s"), "AVCapturePhotoOutput");

    __break(1u);
  }
}

void sub_21EBA0520(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getQLPreviewControllerClass_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;
  void *v4;
  void *v5;

  if (!QuickLookLibraryCore_frameworkLibrary)
    QuickLookLibraryCore_frameworkLibrary = _sl_dlopen();
  if (!QuickLookLibraryCore_frameworkLibrary)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "void *QuickLookLibrary(void)");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, CFSTR("WFMarkupActionUIKitUserInterface.m"), 18, CFSTR("%s"), 0);

    goto LABEL_8;
  }
  result = objc_getClass("QLPreviewController");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Class getQLPreviewControllerClass(void)_block_invoke");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v5, CFSTR("WFMarkupActionUIKitUserInterface.m"), 19, CFSTR("Unable to find class %s"), "QLPreviewController");

LABEL_8:
    __break(1u);
  }
  getQLPreviewControllerClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_21EBA0FC4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,char a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,id location)
{
  _Block_object_dispose(&a30, 8);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__2850(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__2851(uint64_t a1)
{

}

void sub_21EBA23AC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id *location, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,char a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,char a59)
{
  id *v59;

  objc_destroyWeak(v59);
  _Block_object_dispose(&a41, 8);
  _Unwind_Resume(a1);
}

id getSLComposeViewControllerClass()
{
  void *v0;
  id v1;
  _QWORD v3[5];
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2050000000;
  v0 = (void *)getSLComposeViewControllerClass_softClass;
  v7 = getSLComposeViewControllerClass_softClass;
  if (!getSLComposeViewControllerClass_softClass)
  {
    v3[0] = MEMORY[0x24BDAC760];
    v3[1] = 3221225472;
    v3[2] = __getSLComposeViewControllerClass_block_invoke;
    v3[3] = &unk_24E343A50;
    v3[4] = &v4;
    __getSLComposeViewControllerClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_21EBA2668(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id WFExtensionCommunicationError(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[2];
  _QWORD v10[3];

  v10[2] = *MEMORY[0x24BDAC8D0];
  v1 = a1;
  WFLocalizedStringWithKey(CFSTR("App Communication Failure (iOS)"), CFSTR("App Communication Failure"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  WFLocalizedStringWithKey(CFSTR("Unable to communicate with selected app. (iOS)"), CFSTR("Unable to communicate with selected app."));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *MEMORY[0x24BDD0FC8];
  v9[0] = *MEMORY[0x24BDD0FD8];
  v9[1] = v4;
  v10[0] = v2;
  v10[1] = v3;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v10, v9, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "mutableCopy");

  if (v1)
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v1, *MEMORY[0x24BDD1398]);
  objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("WFShareActionUIKitUserInterfaceErrorDomain"), 1, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

Class __getSLComposeViewControllerClass_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;
  void *v4;
  void *v5;

  if (!SocialLibraryCore_frameworkLibrary)
    SocialLibraryCore_frameworkLibrary = _sl_dlopen();
  if (!SocialLibraryCore_frameworkLibrary)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "void *SocialLibrary(void)");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, CFSTR("WFShareActionUIKitUserInterface.m"), 24, CFSTR("%s"), 0);

    goto LABEL_8;
  }
  result = objc_getClass("SLComposeViewController");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Class getSLComposeViewControllerClass(void)_block_invoke");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v5, CFSTR("WFShareActionUIKitUserInterface.m"), 25, CFSTR("Unable to find class %s"), "SLComposeViewController");

LABEL_8:
    __break(1u);
  }
  getSLComposeViewControllerClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_21EBA2E50(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_21EBA6D70(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getMPMediaPickerControllerClass_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;
  void *v4;
  void *v5;

  if (!MediaPlayerLibraryCore_frameworkLibrary)
    MediaPlayerLibraryCore_frameworkLibrary = _sl_dlopen();
  if (!MediaPlayerLibraryCore_frameworkLibrary)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "void *MediaPlayerLibrary(void)");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, CFSTR("WFSelectMusicActionUIKitUserInterface.m"), 16, CFSTR("%s"), 0);

    goto LABEL_8;
  }
  result = objc_getClass("MPMediaPickerController");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Class getMPMediaPickerControllerClass(void)_block_invoke");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v5, CFSTR("WFSelectMusicActionUIKitUserInterface.m"), 17, CFSTR("Unable to find class %s"), "MPMediaPickerController");

LABEL_8:
    __break(1u);
  }
  getMPMediaPickerControllerClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_21EBAA294(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, id *location, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  _Block_object_dispose(&a27, 8);
  objc_destroyWeak(location);
  _Unwind_Resume(a1);
}

void __Block_byref_object_copy__4277(uint64_t a1, uint64_t a2)
{
  objc_moveWeak((id *)(a1 + 40), (id *)(a2 + 40));
}

void __Block_byref_object_dispose__4278(uint64_t a1)
{
  objc_destroyWeak((id *)(a1 + 40));
}

id getSLComposeViewControllerClass_4381()
{
  void *v0;
  id v1;
  _QWORD v3[5];
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2050000000;
  v0 = (void *)getSLComposeViewControllerClass_softClass_4391;
  v7 = getSLComposeViewControllerClass_softClass_4391;
  if (!getSLComposeViewControllerClass_softClass_4391)
  {
    v3[0] = MEMORY[0x24BDAC760];
    v3[1] = 3221225472;
    v3[2] = __getSLComposeViewControllerClass_block_invoke_4392;
    v3[3] = &unk_24E343A50;
    v3[4] = &v4;
    __getSLComposeViewControllerClass_block_invoke_4392((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_21EBAC5C8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21EBAC6D0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

Class __getSLComposeViewControllerClass_block_invoke_4392(uint64_t a1)
{
  Class result;
  void *v3;
  void *v4;
  void *v5;

  if (!SocialLibraryCore_frameworkLibrary_4393)
    SocialLibraryCore_frameworkLibrary_4393 = _sl_dlopen();
  if (!SocialLibraryCore_frameworkLibrary_4393)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "void *SocialLibrary(void)");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, CFSTR("WFShareExtensionActionUIKitUserInterface.m"), 24, CFSTR("%s"), 0);

    goto LABEL_8;
  }
  result = objc_getClass("SLComposeViewController");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Class getSLComposeViewControllerClass(void)_block_invoke");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v5, CFSTR("WFShareExtensionActionUIKitUserInterface.m"), 25, CFSTR("Unable to find class %s"), "SLComposeViewController");

LABEL_8:
    __break(1u);
  }
  getSLComposeViewControllerClass_softClass_4391 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_21EBACBE0(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_21EBAD034(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_21EBAD83C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_list va;

  va_start(va, a8);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getSBFWallpaperOptionsClass_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;
  void *v4;
  void *v5;

  if (!SpringBoardFoundationLibraryCore_frameworkLibrary)
    SpringBoardFoundationLibraryCore_frameworkLibrary = _sl_dlopen();
  if (!SpringBoardFoundationLibraryCore_frameworkLibrary)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "void *SpringBoardFoundationLibrary(void)");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, CFSTR("WFSetWallpaperActionUIKitUserInterface.m"), 21, CFSTR("%s"), 0);

    goto LABEL_8;
  }
  result = objc_getClass("SBFWallpaperOptions");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Class getSBFWallpaperOptionsClass(void)_block_invoke");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v5, CFSTR("WFSetWallpaperActionUIKitUserInterface.m"), 22, CFSTR("Unable to find class %s"), "SBFWallpaperOptions");

LABEL_8:
    __break(1u);
  }
  getSBFWallpaperOptionsClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

Class __getSBSUIWallpaperPreviewViewControllerClass_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;
  void *v4;
  void *v5;

  if (!SpringBoardUIServicesLibraryCore_frameworkLibrary)
    SpringBoardUIServicesLibraryCore_frameworkLibrary = _sl_dlopen();
  if (!SpringBoardUIServicesLibraryCore_frameworkLibrary)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "void *SpringBoardUIServicesLibrary(void)");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, CFSTR("WFSetWallpaperActionUIKitUserInterface.m"), 23, CFSTR("%s"), 0);

    goto LABEL_8;
  }
  result = objc_getClass("SBSUIWallpaperPreviewViewController");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Class getSBSUIWallpaperPreviewViewControllerClass(void)_block_invoke");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v5, CFSTR("WFSetWallpaperActionUIKitUserInterface.m"), 24, CFSTR("Unable to find class %s"), "SBSUIWallpaperPreviewViewController");

LABEL_8:
    __break(1u);
  }
  getSBSUIWallpaperPreviewViewControllerClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void __getPRSServiceClass_block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;

  PosterBoardServicesLibrary();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_getClass("PRSService");
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getPRSServiceClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Class getPRSServiceClass(void)_block_invoke");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("WFSetWallpaperActionUIKitUserInterface.m"), 31, CFSTR("Unable to find class %s"), "PRSService");

    __break(1u);
  }
}

void sub_21EBADF80(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __getPRSPosterUpdateSessionInfoClass_block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;

  PosterBoardServicesLibrary();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_getClass("PRSPosterUpdateSessionInfo");
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getPRSPosterUpdateSessionInfoClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Class getPRSPosterUpdateSessionInfoClass(void)_block_invoke");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("WFSetWallpaperActionUIKitUserInterface.m"), 32, CFSTR("Unable to find class %s"), "PRSPosterUpdateSessionInfo");

    __break(1u);
  }
}

void __getPRUISModalEntryPointEditingClass_block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;

  PosterBoardUILibrary();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_getClass("PRUISModalEntryPointEditing");
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getPRUISModalEntryPointEditingClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Class getPRUISModalEntryPointEditingClass(void)_block_invoke");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("WFSetWallpaperActionUIKitUserInterface.m"), 27, CFSTR("Unable to find class %s"), "PRUISModalEntryPointEditing");

    __break(1u);
  }
}

void __getPRUISModalRemoteViewControllerClass_block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;

  PosterBoardUILibrary();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_getClass("PRUISModalRemoteViewController");
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getPRUISModalRemoteViewControllerClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Class getPRUISModalRemoteViewControllerClass(void)_block_invoke");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("WFSetWallpaperActionUIKitUserInterface.m"), 28, CFSTR("Unable to find class %s"), "PRUISModalRemoteViewController");

    __break(1u);
  }
}

void PosterBoardUILibrary()
{
  void *v0;
  void *v1;
  void *v2;

  if (!PosterBoardUILibraryCore_frameworkLibrary)
    PosterBoardUILibraryCore_frameworkLibrary = _sl_dlopen();
  if (!PosterBoardUILibraryCore_frameworkLibrary)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v0 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "void *PosterBoardUILibrary(void)");
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("WFSetWallpaperActionUIKitUserInterface.m"), 26, CFSTR("%s"), 0);

    __break(1u);
    free(v2);
  }
}

void PosterBoardServicesLibrary()
{
  void *v0;
  void *v1;
  void *v2;

  if (!PosterBoardServicesLibraryCore_frameworkLibrary)
    PosterBoardServicesLibraryCore_frameworkLibrary = _sl_dlopen();
  if (!PosterBoardServicesLibraryCore_frameworkLibrary)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v0 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "void *PosterBoardServicesLibrary(void)");
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("WFSetWallpaperActionUIKitUserInterface.m"), 30, CFSTR("%s"), 0);

    __break(1u);
    free(v2);
  }
}

void sub_21EBB0A34(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getWKWebViewClass_block_invoke_4881(uint64_t a1)
{
  Class result;
  void *v3;
  void *v4;
  void *v5;

  if (!WebKitLibraryCore_frameworkLibrary_4884)
    WebKitLibraryCore_frameworkLibrary_4884 = _sl_dlopen();
  if (!WebKitLibraryCore_frameworkLibrary_4884)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "void *WebKitLibrary(void)");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, CFSTR("WFContentItemViewController.m"), 16, CFSTR("%s"), 0);

    goto LABEL_8;
  }
  result = objc_getClass("WKWebView");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Class getWKWebViewClass(void)_block_invoke");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v5, CFSTR("WFContentItemViewController.m"), 17, CFSTR("Unable to find class %s"), "WKWebView");

LABEL_8:
    __break(1u);
  }
  getWKWebViewClass_softClass_4880 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_21EBB23D4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21EBB2910(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,id location)
{
  id *v22;

  objc_destroyWeak(v22);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_21EBB32E4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21EBB34D8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *AVFoundationLibrary_5304()
{
  void *v0;
  void *v2;
  void *v3;

  if (!AVFoundationLibraryCore_frameworkLibrary_5305)
    AVFoundationLibraryCore_frameworkLibrary_5305 = _sl_dlopen();
  v0 = (void *)AVFoundationLibraryCore_frameworkLibrary_5305;
  if (!AVFoundationLibraryCore_frameworkLibrary_5305)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v0 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "void *AVFoundationLibrary(void)");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v2, CFSTR("CDZQRScanningViewController.m"), 25, CFSTR("%s"), 0);

    __break(1u);
    free(v3);
  }
  return v0;
}

void __getAVCaptureSessionClass_block_invoke_5313(uint64_t a1)
{
  void *v2;
  void *v3;

  AVFoundationLibrary_5304();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_getClass("AVCaptureSession");
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getAVCaptureSessionClass_softClass_5312 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Class getAVCaptureSessionClass(void)_block_invoke");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("CDZQRScanningViewController.m"), 26, CFSTR("Unable to find class %s"), "AVCaptureSession");

    __break(1u);
  }
}

void sub_21EBB4130(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,char a43)
{
  _Block_object_dispose(&a43, 8);
  _Unwind_Resume(a1);
}

void __getAVCaptureVideoPreviewLayerClass_block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;

  AVFoundationLibrary_5304();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_getClass("AVCaptureVideoPreviewLayer");
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getAVCaptureVideoPreviewLayerClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Class getAVCaptureVideoPreviewLayerClass(void)_block_invoke");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("CDZQRScanningViewController.m"), 30, CFSTR("Unable to find class %s"), "AVCaptureVideoPreviewLayer");

    __break(1u);
  }
}

void __getAVCaptureDeviceClass_block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;

  AVFoundationLibrary_5304();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_getClass("AVCaptureDevice");
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getAVCaptureDeviceClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Class getAVCaptureDeviceClass(void)_block_invoke");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("CDZQRScanningViewController.m"), 27, CFSTR("Unable to find class %s"), "AVCaptureDevice");

    __break(1u);
  }
}

void __getAVCaptureDeviceInputClass_block_invoke_5318(uint64_t a1)
{
  void *v2;
  void *v3;

  AVFoundationLibrary_5304();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_getClass("AVCaptureDeviceInput");
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getAVCaptureDeviceInputClass_softClass_5317 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Class getAVCaptureDeviceInputClass(void)_block_invoke");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("CDZQRScanningViewController.m"), 28, CFSTR("Unable to find class %s"), "AVCaptureDeviceInput");

    __break(1u);
  }
}

void __getAVCaptureMetadataOutputClass_block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;

  AVFoundationLibrary_5304();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_getClass("AVCaptureMetadataOutput");
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getAVCaptureMetadataOutputClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Class getAVCaptureMetadataOutputClass(void)_block_invoke");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("CDZQRScanningViewController.m"), 29, CFSTR("Unable to find class %s"), "AVCaptureMetadataOutput");

    __break(1u);
  }
}

void getAVCaptureSessionRuntimeErrorNotification()
{
  id *v0;
  void *v1;
  id v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v0 = (id *)getAVCaptureSessionRuntimeErrorNotificationSymbolLoc_ptr;
  v8 = getAVCaptureSessionRuntimeErrorNotificationSymbolLoc_ptr;
  if (!getAVCaptureSessionRuntimeErrorNotificationSymbolLoc_ptr)
  {
    v1 = AVFoundationLibrary_5304();
    v0 = (id *)dlsym(v1, "AVCaptureSessionRuntimeErrorNotification");
    v6[3] = (uint64_t)v0;
    getAVCaptureSessionRuntimeErrorNotificationSymbolLoc_ptr = (uint64_t)v0;
  }
  _Block_object_dispose(&v5, 8);
  if (v0)
  {
    v2 = *v0;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "NSNotificationName getAVCaptureSessionRuntimeErrorNotification(void)");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, CFSTR("CDZQRScanningViewController.m"), 32, CFSTR("%s"), dlerror());

    __break(1u);
  }
}

void sub_21EBB4790(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void getAVCaptureSessionWasInterruptedNotification()
{
  id *v0;
  void *v1;
  id v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v0 = (id *)getAVCaptureSessionWasInterruptedNotificationSymbolLoc_ptr;
  v8 = getAVCaptureSessionWasInterruptedNotificationSymbolLoc_ptr;
  if (!getAVCaptureSessionWasInterruptedNotificationSymbolLoc_ptr)
  {
    v1 = AVFoundationLibrary_5304();
    v0 = (id *)dlsym(v1, "AVCaptureSessionWasInterruptedNotification");
    v6[3] = (uint64_t)v0;
    getAVCaptureSessionWasInterruptedNotificationSymbolLoc_ptr = (uint64_t)v0;
  }
  _Block_object_dispose(&v5, 8);
  if (v0)
  {
    v2 = *v0;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "NSNotificationName getAVCaptureSessionWasInterruptedNotification(void)");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, CFSTR("CDZQRScanningViewController.m"), 33, CFSTR("%s"), dlerror());

    __break(1u);
  }
}

void sub_21EBB4888(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void getAVCaptureSessionInterruptionEndedNotification()
{
  id *v0;
  void *v1;
  id v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v0 = (id *)getAVCaptureSessionInterruptionEndedNotificationSymbolLoc_ptr;
  v8 = getAVCaptureSessionInterruptionEndedNotificationSymbolLoc_ptr;
  if (!getAVCaptureSessionInterruptionEndedNotificationSymbolLoc_ptr)
  {
    v1 = AVFoundationLibrary_5304();
    v0 = (id *)dlsym(v1, "AVCaptureSessionInterruptionEndedNotification");
    v6[3] = (uint64_t)v0;
    getAVCaptureSessionInterruptionEndedNotificationSymbolLoc_ptr = (uint64_t)v0;
  }
  _Block_object_dispose(&v5, 8);
  if (v0)
  {
    v2 = *v0;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "NSNotificationName getAVCaptureSessionInterruptionEndedNotification(void)");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, CFSTR("CDZQRScanningViewController.m"), 34, CFSTR("%s"), dlerror());

    __break(1u);
  }
}

void sub_21EBB4980(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21EBB51D4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getCNContactPickerViewControllerClass_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;
  void *v4;
  void *v5;

  if (!ContactsUILibraryCore_frameworkLibrary)
    ContactsUILibraryCore_frameworkLibrary = _sl_dlopen();
  if (!ContactsUILibraryCore_frameworkLibrary)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "void *ContactsUILibrary(void)");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, CFSTR("WFSelectContactsActionUIKitUserInterface.m"), 21, CFSTR("%s"), 0);

    goto LABEL_8;
  }
  result = objc_getClass("CNContactPickerViewController");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Class getCNContactPickerViewControllerClass(void)_block_invoke");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v5, CFSTR("WFSelectContactsActionUIKitUserInterface.m"), 22, CFSTR("Unable to find class %s"), "CNContactPickerViewController");

LABEL_8:
    __break(1u);
  }
  getCNContactPickerViewControllerClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t sub_21EBB738C()
{
  return MEMORY[0x24BDCB030]();
}

uint64_t sub_21EBB7398()
{
  return MEMORY[0x24BDCB068]();
}

uint64_t sub_21EBB73A4()
{
  return MEMORY[0x24BDCB070]();
}

uint64_t sub_21EBB73B0()
{
  return MEMORY[0x24BDCB088]();
}

uint64_t sub_21EBB73BC()
{
  return MEMORY[0x24BDCB0C0]();
}

uint64_t sub_21EBB73C8()
{
  return MEMORY[0x24BDCC930]();
}

uint64_t sub_21EBB73D4()
{
  return MEMORY[0x24BDCD280]();
}

uint64_t sub_21EBB73E0()
{
  return MEMORY[0x24BDCD288]();
}

uint64_t sub_21EBB73EC()
{
  return MEMORY[0x24BDCD290]();
}

uint64_t sub_21EBB73F8()
{
  return MEMORY[0x24BDCD298]();
}

uint64_t sub_21EBB7404()
{
  return MEMORY[0x24BDCD2A8]();
}

uint64_t sub_21EBB7410()
{
  return MEMORY[0x24BDCD2B8]();
}

uint64_t sub_21EBB741C()
{
  return MEMORY[0x24BDCD2F0]();
}

uint64_t sub_21EBB7428()
{
  return MEMORY[0x24BDCD820]();
}

uint64_t sub_21EBB7434()
{
  return MEMORY[0x24BDCD8D0]();
}

uint64_t sub_21EBB7440()
{
  return MEMORY[0x24BDCD9C0]();
}

uint64_t sub_21EBB744C()
{
  return MEMORY[0x24BDCDA48]();
}

uint64_t sub_21EBB7458()
{
  return MEMORY[0x24BDCDA68]();
}

uint64_t sub_21EBB7464()
{
  return MEMORY[0x24BDCDAC0]();
}

uint64_t sub_21EBB7470()
{
  return MEMORY[0x24BDCE878]();
}

uint64_t sub_21EBB747C()
{
  return MEMORY[0x24BDCE900]();
}

uint64_t sub_21EBB7488()
{
  return MEMORY[0x24BDCF320]();
}

uint64_t sub_21EBB7494()
{
  return MEMORY[0x24BDCF428]();
}

uint64_t sub_21EBB74A0()
{
  return MEMORY[0x24BEC2CE0]();
}

uint64_t sub_21EBB74AC()
{
  return MEMORY[0x24BEC2CF0]();
}

uint64_t sub_21EBB74B8()
{
  return MEMORY[0x24BEC2CF8]();
}

uint64_t sub_21EBB74C4()
{
  return MEMORY[0x24BEC2D00]();
}

uint64_t sub_21EBB74D0()
{
  return MEMORY[0x24BEC2D08]();
}

uint64_t sub_21EBB74DC()
{
  return MEMORY[0x24BEC2D18]();
}

uint64_t sub_21EBB74E8()
{
  return MEMORY[0x24BEC2DA8]();
}

uint64_t sub_21EBB74F4()
{
  return MEMORY[0x24BEC2DF0]();
}

uint64_t sub_21EBB7500()
{
  return MEMORY[0x24BEE76F0]();
}

uint64_t sub_21EBB750C()
{
  return MEMORY[0x24BDB9C48]();
}

uint64_t sub_21EBB7518()
{
  return MEMORY[0x24BDB9D68]();
}

uint64_t sub_21EBB7524()
{
  return MEMORY[0x24BDEB560]();
}

uint64_t sub_21EBB7530()
{
  return MEMORY[0x24BDEB750]();
}

uint64_t sub_21EBB753C()
{
  return MEMORY[0x24BDEB790]();
}

uint64_t sub_21EBB7548()
{
  return MEMORY[0x24BDEB828]();
}

uint64_t sub_21EBB7554()
{
  return MEMORY[0x24BDEBBC8]();
}

uint64_t sub_21EBB7560()
{
  return MEMORY[0x24BDEC030]();
}

uint64_t sub_21EBB756C()
{
  return MEMORY[0x24BDEC038]();
}

uint64_t sub_21EBB7578()
{
  return MEMORY[0x24BDEC728]();
}

uint64_t sub_21EBB7584()
{
  return MEMORY[0x24BDEC730]();
}

uint64_t sub_21EBB7590()
{
  return MEMORY[0x24BDEC888]();
}

uint64_t sub_21EBB759C()
{
  return MEMORY[0x24BDEC970]();
}

uint64_t sub_21EBB75A8()
{
  return MEMORY[0x24BDEC978]();
}

uint64_t sub_21EBB75B4()
{
  return MEMORY[0x24BDED6C0]();
}

uint64_t sub_21EBB75C0()
{
  return MEMORY[0x24BDED6C8]();
}

uint64_t sub_21EBB75CC()
{
  return MEMORY[0x24BDED6D0]();
}

uint64_t sub_21EBB75D8()
{
  return MEMORY[0x24BDED8C8]();
}

uint64_t sub_21EBB75E4()
{
  return MEMORY[0x24BDED8D0]();
}

uint64_t sub_21EBB75F0()
{
  return MEMORY[0x24BDEDBA8]();
}

uint64_t sub_21EBB75FC()
{
  return MEMORY[0x24BEC4F88]();
}

uint64_t sub_21EBB7608()
{
  return MEMORY[0x24BEC4F90]();
}

uint64_t sub_21EBB7614()
{
  return MEMORY[0x24BDEE090]();
}

uint64_t sub_21EBB7620()
{
  return MEMORY[0x24BDEE098]();
}

uint64_t sub_21EBB762C()
{
  return MEMORY[0x24BDEE0D0]();
}

uint64_t sub_21EBB7638()
{
  return MEMORY[0x24BDEE190]();
}

uint64_t sub_21EBB7644()
{
  return MEMORY[0x24BDEE198]();
}

uint64_t sub_21EBB7650()
{
  return MEMORY[0x24BDEE3F0]();
}

uint64_t sub_21EBB765C()
{
  return MEMORY[0x24BDEE438]();
}

uint64_t sub_21EBB7668()
{
  return MEMORY[0x24BDEE440]();
}

uint64_t sub_21EBB7674()
{
  return MEMORY[0x24BDEE468]();
}

uint64_t sub_21EBB7680()
{
  return MEMORY[0x24BDEE478]();
}

uint64_t sub_21EBB768C()
{
  return MEMORY[0x24BDEE490]();
}

uint64_t sub_21EBB7698()
{
  return MEMORY[0x24BDEE4A0]();
}

uint64_t sub_21EBB76A4()
{
  return MEMORY[0x24BDEE4E0]();
}

uint64_t sub_21EBB76B0()
{
  return MEMORY[0x24BDEE4F8]();
}

uint64_t sub_21EBB76BC()
{
  return MEMORY[0x24BDEE608]();
}

uint64_t sub_21EBB76C8()
{
  return MEMORY[0x24BDEE730]();
}

uint64_t sub_21EBB76D4()
{
  return MEMORY[0x24BDEEA50]();
}

uint64_t sub_21EBB76E0()
{
  return MEMORY[0x24BDEF168]();
}

uint64_t sub_21EBB76EC()
{
  return MEMORY[0x24BDEF228]();
}

uint64_t sub_21EBB76F8()
{
  return MEMORY[0x24BDEF238]();
}

uint64_t sub_21EBB7704()
{
  return MEMORY[0x24BDEF248]();
}

uint64_t sub_21EBB7710()
{
  return MEMORY[0x24BDEF260]();
}

uint64_t sub_21EBB771C()
{
  return MEMORY[0x24BDEF270]();
}

uint64_t sub_21EBB7728()
{
  return MEMORY[0x24BDEF278]();
}

uint64_t sub_21EBB7734()
{
  return MEMORY[0x24BDEF288]();
}

uint64_t sub_21EBB7740()
{
  return MEMORY[0x24BDEF298]();
}

uint64_t sub_21EBB774C()
{
  return MEMORY[0x24BDEF2A8]();
}

uint64_t sub_21EBB7758()
{
  return MEMORY[0x24BDEF2C0]();
}

uint64_t sub_21EBB7764()
{
  return MEMORY[0x24BDEF2C8]();
}

uint64_t sub_21EBB7770()
{
  return MEMORY[0x24BDEF380]();
}

uint64_t sub_21EBB777C()
{
  return MEMORY[0x24BDEF3A0]();
}

uint64_t sub_21EBB7788()
{
  return MEMORY[0x24BDEF3B8]();
}

uint64_t sub_21EBB7794()
{
  return MEMORY[0x24BDEF6A8]();
}

uint64_t sub_21EBB77A0()
{
  return MEMORY[0x24BDEF6B0]();
}

uint64_t sub_21EBB77AC()
{
  return MEMORY[0x24BDEF6F0]();
}

uint64_t sub_21EBB77B8()
{
  return MEMORY[0x24BDEF700]();
}

uint64_t sub_21EBB77C4()
{
  return MEMORY[0x24BDEF740]();
}

uint64_t sub_21EBB77D0()
{
  return MEMORY[0x24BDEF8C0]();
}

uint64_t sub_21EBB77DC()
{
  return MEMORY[0x24BDEF8D0]();
}

uint64_t sub_21EBB77E8()
{
  return MEMORY[0x24BDEFA78]();
}

uint64_t sub_21EBB77F4()
{
  return MEMORY[0x24BDF04A8]();
}

uint64_t sub_21EBB7800()
{
  return MEMORY[0x24BDF04B0]();
}

uint64_t sub_21EBB780C()
{
  return MEMORY[0x24BDF0618]();
}

uint64_t sub_21EBB7818()
{
  return MEMORY[0x24BDF0620]();
}

uint64_t sub_21EBB7824()
{
  return MEMORY[0x24BDF0AF0]();
}

uint64_t sub_21EBB7830()
{
  return MEMORY[0x24BDF1430]();
}

uint64_t sub_21EBB783C()
{
  return MEMORY[0x24BDF1960]();
}

uint64_t sub_21EBB7848()
{
  return MEMORY[0x24BDF1970]();
}

uint64_t sub_21EBB7854()
{
  return MEMORY[0x24BDF19C8]();
}

uint64_t sub_21EBB7860()
{
  return MEMORY[0x24BDF1A00]();
}

uint64_t sub_21EBB786C()
{
  return MEMORY[0x24BDF1D08]();
}

uint64_t sub_21EBB7878()
{
  return MEMORY[0x24BDF1FF0]();
}

uint64_t sub_21EBB7884()
{
  return MEMORY[0x24BDF2040]();
}

uint64_t sub_21EBB7890()
{
  return MEMORY[0x24BDF2088]();
}

uint64_t sub_21EBB789C()
{
  return MEMORY[0x24BDF20A0]();
}

uint64_t sub_21EBB78A8()
{
  return MEMORY[0x24BDF22B0]();
}

uint64_t sub_21EBB78B4()
{
  return MEMORY[0x24BDF23E0]();
}

uint64_t sub_21EBB78C0()
{
  return MEMORY[0x24BDF2500]();
}

uint64_t sub_21EBB78CC()
{
  return MEMORY[0x24BDF2688]();
}

uint64_t sub_21EBB78D8()
{
  return MEMORY[0x24BDF2698]();
}

uint64_t sub_21EBB78E4()
{
  return MEMORY[0x24BDF28B8]();
}

uint64_t sub_21EBB78F0()
{
  return MEMORY[0x24BDF2968]();
}

uint64_t sub_21EBB78FC()
{
  return MEMORY[0x24BDF2B78]();
}

uint64_t sub_21EBB7908()
{
  return MEMORY[0x24BDF3390]();
}

uint64_t sub_21EBB7914()
{
  return MEMORY[0x24BDF3510]();
}

uint64_t sub_21EBB7920()
{
  return MEMORY[0x24BDF3530]();
}

uint64_t sub_21EBB792C()
{
  return MEMORY[0x24BDF3640]();
}

uint64_t sub_21EBB7938()
{
  return MEMORY[0x24BDF3840]();
}

uint64_t sub_21EBB7944()
{
  return MEMORY[0x24BDF38E0]();
}

uint64_t sub_21EBB7950()
{
  return MEMORY[0x24BDF3A68]();
}

uint64_t sub_21EBB795C()
{
  return MEMORY[0x24BEC50E0]();
}

uint64_t sub_21EBB7968()
{
  return MEMORY[0x24BDF3B30]();
}

uint64_t sub_21EBB7974()
{
  return MEMORY[0x24BDF3B38]();
}

uint64_t sub_21EBB7980()
{
  return MEMORY[0x24BDF3B50]();
}

uint64_t sub_21EBB798C()
{
  return MEMORY[0x24BDF3B70]();
}

uint64_t sub_21EBB7998()
{
  return MEMORY[0x24BDF3E08]();
}

uint64_t sub_21EBB79A4()
{
  return MEMORY[0x24BDF3F18]();
}

uint64_t sub_21EBB79B0()
{
  return MEMORY[0x24BDF3F28]();
}

uint64_t sub_21EBB79BC()
{
  return MEMORY[0x24BDF4170]();
}

uint64_t sub_21EBB79C8()
{
  return MEMORY[0x24BDF4280]();
}

uint64_t sub_21EBB79D4()
{
  return MEMORY[0x24BDF4290]();
}

uint64_t sub_21EBB79E0()
{
  return MEMORY[0x24BDF42A8]();
}

uint64_t sub_21EBB79EC()
{
  return MEMORY[0x24BDF42B0]();
}

uint64_t sub_21EBB79F8()
{
  return MEMORY[0x24BDF42C0]();
}

uint64_t sub_21EBB7A04()
{
  return MEMORY[0x24BDF4340]();
}

uint64_t sub_21EBB7A10()
{
  return MEMORY[0x24BDF4380]();
}

uint64_t sub_21EBB7A1C()
{
  return MEMORY[0x24BDF4518]();
}

uint64_t sub_21EBB7A28()
{
  return MEMORY[0x24BDF46A8]();
}

uint64_t sub_21EBB7A34()
{
  return MEMORY[0x24BDF4790]();
}

uint64_t sub_21EBB7A40()
{
  return MEMORY[0x24BDF47B0]();
}

uint64_t sub_21EBB7A4C()
{
  return MEMORY[0x24BDF47B8]();
}

uint64_t sub_21EBB7A58()
{
  return MEMORY[0x24BDF4808]();
}

uint64_t sub_21EBB7A64()
{
  return MEMORY[0x24BDF49A0]();
}

uint64_t sub_21EBB7A70()
{
  return MEMORY[0x24BDF4AA0]();
}

uint64_t sub_21EBB7A7C()
{
  return MEMORY[0x24BDF4AB8]();
}

uint64_t sub_21EBB7A88()
{
  return MEMORY[0x24BDF4AC8]();
}

uint64_t sub_21EBB7A94()
{
  return MEMORY[0x24BDF4AE0]();
}

uint64_t sub_21EBB7AA0()
{
  return MEMORY[0x24BDF4CA8]();
}

uint64_t sub_21EBB7AAC()
{
  return MEMORY[0x24BDF4F18]();
}

uint64_t sub_21EBB7AB8()
{
  return MEMORY[0x24BDF4F20]();
}

uint64_t sub_21EBB7AC4()
{
  return MEMORY[0x24BDF5380]();
}

uint64_t sub_21EBB7AD0()
{
  return MEMORY[0x24BDF5388]();
}

uint64_t sub_21EBB7ADC()
{
  return MEMORY[0x24BEE5458]();
}

uint64_t sub_21EBB7AE8()
{
  return MEMORY[0x24BEE54B0]();
}

uint64_t sub_21EBB7AF4()
{
  return MEMORY[0x24BEE54C8]();
}

uint64_t sub_21EBB7B00()
{
  return MEMORY[0x24BEE5500]();
}

uint64_t sub_21EBB7B0C()
{
  return MEMORY[0x24BDCF808]();
}

uint64_t sub_21EBB7B18()
{
  return MEMORY[0x24BEE02B0]();
}

uint64_t sub_21EBB7B24()
{
  return MEMORY[0x24BEE0618]();
}

uint64_t sub_21EBB7B30()
{
  return MEMORY[0x24BEE75F0]();
}

uint64_t sub_21EBB7B3C()
{
  return MEMORY[0x24BEE0980]();
}

uint64_t sub_21EBB7B48()
{
  return MEMORY[0x24BDCF9E0]();
}

uint64_t sub_21EBB7B54()
{
  return MEMORY[0x24BDCF9F0]();
}

uint64_t sub_21EBB7B60()
{
  return MEMORY[0x24BDCFA28]();
}

uint64_t sub_21EBB7B6C()
{
  return MEMORY[0x24BEE0A50]();
}

uint64_t sub_21EBB7B78()
{
  return MEMORY[0x24BEE0AD0]();
}

uint64_t sub_21EBB7B84()
{
  return MEMORY[0x24BEE0B20]();
}

uint64_t sub_21EBB7B90()
{
  return MEMORY[0x24BEE0B68]();
}

uint64_t sub_21EBB7B9C()
{
  return MEMORY[0x24BEE0B88]();
}

uint64_t sub_21EBB7BA8()
{
  return MEMORY[0x24BEE0BC0]();
}

uint64_t sub_21EBB7BB4()
{
  return MEMORY[0x24BEE0C10]();
}

uint64_t sub_21EBB7BC0()
{
  return MEMORY[0x24BEE0DE0]();
}

uint64_t sub_21EBB7BCC()
{
  return MEMORY[0x24BDCFBA8]();
}

uint64_t sub_21EBB7BD8()
{
  return MEMORY[0x24BDCFBC8]();
}

uint64_t sub_21EBB7BE4()
{
  return MEMORY[0x24BEE1128]();
}

uint64_t sub_21EBB7BF0()
{
  return MEMORY[0x24BEE6800]();
}

uint64_t sub_21EBB7BFC()
{
  return MEMORY[0x24BEE6820]();
}

uint64_t sub_21EBB7C08()
{
  return MEMORY[0x24BEE6828]();
}

uint64_t sub_21EBB7C14()
{
  return MEMORY[0x24BEE6920]();
}

uint64_t sub_21EBB7C20()
{
  return MEMORY[0x24BEE6928]();
}

uint64_t sub_21EBB7C2C()
{
  return MEMORY[0x24BEE6988]();
}

uint64_t sub_21EBB7C38()
{
  return MEMORY[0x24BEE6990]();
}

uint64_t sub_21EBB7C44()
{
  return MEMORY[0x24BEE18A0]();
}

uint64_t sub_21EBB7C50()
{
  return MEMORY[0x24BEE18D0]();
}

uint64_t sub_21EBB7C5C()
{
  return MEMORY[0x24BEE1918]();
}

uint64_t sub_21EBB7C68()
{
  return MEMORY[0x24BEE1A28]();
}

uint64_t sub_21EBB7C74()
{
  return MEMORY[0x24BEE7920]();
}

uint64_t sub_21EBB7C80()
{
  return MEMORY[0x24BEE5770]();
}

uint64_t sub_21EBB7C8C()
{
  return MEMORY[0x24BEE5790]();
}

uint64_t sub_21EBB7C98()
{
  return MEMORY[0x24BEE57B0]();
}

uint64_t sub_21EBB7CA4()
{
  return MEMORY[0x24BEC5130]();
}

uint64_t sub_21EBB7CB0()
{
  return MEMORY[0x24BEE5BD0]();
}

uint64_t sub_21EBB7CBC()
{
  return MEMORY[0x24BEE1C68]();
}

uint64_t sub_21EBB7CC8()
{
  return MEMORY[0x24BDD04C8]();
}

uint64_t sub_21EBB7CD4()
{
  return MEMORY[0x24BDD0638]();
}

uint64_t sub_21EBB7CE0()
{
  return MEMORY[0x24BEE20A8]();
}

uint64_t sub_21EBB7CEC()
{
  return MEMORY[0x24BEE22C0]();
}

uint64_t sub_21EBB7CF8()
{
  return MEMORY[0x24BEE2518]();
}

uint64_t sub_21EBB7D04()
{
  return MEMORY[0x24BEE2658]();
}

uint64_t sub_21EBB7D10()
{
  return MEMORY[0x24BEE2838]();
}

uint64_t sub_21EBB7D1C()
{
  return MEMORY[0x24BEE2908]();
}

uint64_t sub_21EBB7D28()
{
  return MEMORY[0x24BEE2938]();
}

uint64_t sub_21EBB7D34()
{
  return MEMORY[0x24BEE2958]();
}

uint64_t sub_21EBB7D40()
{
  return MEMORY[0x24BEE2980]();
}

uint64_t sub_21EBB7D4C()
{
  return MEMORY[0x24BEE2988]();
}

uint64_t sub_21EBB7D58()
{
  return MEMORY[0x24BEE2F48]();
}

uint64_t sub_21EBB7D64()
{
  return MEMORY[0x24BEE3068]();
}

uint64_t sub_21EBB7D70()
{
  return MEMORY[0x24BEE3568]();
}

uint64_t sub_21EBB7D7C()
{
  return MEMORY[0x24BEE3A20]();
}

uint64_t sub_21EBB7D88()
{
  return MEMORY[0x24BEE3A30]();
}

uint64_t sub_21EBB7D94()
{
  return MEMORY[0x24BEE70E0]();
}

uint64_t sub_21EBB7DA0()
{
  return MEMORY[0x24BDD06E0]();
}

uint64_t sub_21EBB7DAC()
{
  return MEMORY[0x24BDD06F0]();
}

uint64_t sub_21EBB7DB8()
{
  return MEMORY[0x24BEE3F10]();
}

uint64_t sub_21EBB7DC4()
{
  return MEMORY[0x24BEE42E0]();
}

uint64_t sub_21EBB7DD0()
{
  return MEMORY[0x24BEE4328]();
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x24BDBC298](cf);
}

CGAffineTransform *__cdecl CGAffineTransformConcat(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t1, CGAffineTransform *t2)
{
  return (CGAffineTransform *)MEMORY[0x24BDBD8A0](retstr, t1, t2);
}

CGAffineTransform *__cdecl CGAffineTransformMakeRotation(CGAffineTransform *__return_ptr retstr, CGFloat angle)
{
  return (CGAffineTransform *)MEMORY[0x24BDBD8D8](retstr, angle);
}

CGAffineTransform *__cdecl CGAffineTransformMakeScale(CGAffineTransform *__return_ptr retstr, CGFloat sx, CGFloat sy)
{
  return (CGAffineTransform *)MEMORY[0x24BDBD8E0](retstr, sx, sy);
}

CGAffineTransform *__cdecl CGAffineTransformMakeTranslation(CGAffineTransform *__return_ptr retstr, CGFloat tx, CGFloat ty)
{
  return (CGAffineTransform *)MEMORY[0x24BDBD8E8](retstr, tx, ty);
}

CGAffineTransform *__cdecl CGAffineTransformRotate(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t, CGFloat angle)
{
  return (CGAffineTransform *)MEMORY[0x24BDBD8F8](retstr, t, angle);
}

CGAffineTransform *__cdecl CGAffineTransformScale(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t, CGFloat sx, CGFloat sy)
{
  return (CGAffineTransform *)MEMORY[0x24BDBD900](retstr, t, sx, sy);
}

CGAffineTransform *__cdecl CGAffineTransformTranslate(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t, CGFloat tx, CGFloat ty)
{
  return (CGAffineTransform *)MEMORY[0x24BDBD908](retstr, t, tx, ty);
}

CGContextRef CGBitmapContextCreate(void *data, size_t width, size_t height, size_t bitsPerComponent, size_t bytesPerRow, CGColorSpaceRef space, uint32_t bitmapInfo)
{
  return (CGContextRef)MEMORY[0x24BDBD918](data, width, height, bitsPerComponent, bytesPerRow, space, *(_QWORD *)&bitmapInfo);
}

CGImageRef CGBitmapContextCreateImage(CGContextRef context)
{
  return (CGImageRef)MEMORY[0x24BDBD920](context);
}

void CGContextConcatCTM(CGContextRef c, CGAffineTransform *transform)
{
  MEMORY[0x24BDBDD50](c, transform);
}

void CGContextDrawImage(CGContextRef c, CGRect rect, CGImageRef image)
{
  MEMORY[0x24BDBDDD8](c, image, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

void CGContextRelease(CGContextRef c)
{
  MEMORY[0x24BDBDF30](c);
}

CGBitmapInfo CGImageGetBitmapInfo(CGImageRef image)
{
  return MEMORY[0x24BDBE628](image);
}

size_t CGImageGetBitsPerComponent(CGImageRef image)
{
  return MEMORY[0x24BDBE630](image);
}

CGColorSpaceRef CGImageGetColorSpace(CGImageRef image)
{
  return (CGColorSpaceRef)MEMORY[0x24BDBE658](image);
}

void CGImageRelease(CGImageRef image)
{
  MEMORY[0x24BDBE770](image);
}

void CGPathAddArc(CGMutablePathRef path, const CGAffineTransform *m, CGFloat x, CGFloat y, CGFloat radius, CGFloat startAngle, CGFloat endAngle, BOOL clockwise)
{
  MEMORY[0x24BDBEDA8](path, m, clockwise, x, y, radius, startAngle, endAngle);
}

void CGPathAddLineToPoint(CGMutablePathRef path, const CGAffineTransform *m, CGFloat x, CGFloat y)
{
  MEMORY[0x24BDBEDC8](path, m, x, y);
}

CGMutablePathRef CGPathCreateMutable(void)
{
  return (CGMutablePathRef)MEMORY[0x24BDBEE80]();
}

void CGPathMoveToPoint(CGMutablePathRef path, const CGAffineTransform *m, CGFloat x, CGFloat y)
{
  MEMORY[0x24BDBEF40](path, m, x, y);
}

void CGPathRelease(CGPathRef path)
{
  MEMORY[0x24BDBEF48](path);
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

BOOL CGRectContainsPoint(CGRect rect, CGPoint point)
{
  return MEMORY[0x24BDBEFC0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, (__n128)point, *(__n128 *)&point.y);
}

void CGRectDivide(CGRect rect, CGRect *slice, CGRect *remainder, CGFloat amount, CGRectEdge edge)
{
  MEMORY[0x24BDBEFD8](slice, remainder, *(_QWORD *)&edge, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, amount);
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

CGRect CGRectInset(CGRect rect, CGFloat dx, CGFloat dy)
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  MEMORY[0x24BDBF030]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, dx, dy);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

CGRect CGRectIntegral(CGRect rect)
{
  double v1;
  double v2;
  double v3;
  double v4;
  CGRect result;

  MEMORY[0x24BDBF038]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  result.size.height = v4;
  result.size.width = v3;
  result.origin.y = v2;
  result.origin.x = v1;
  return result;
}

BOOL CGRectIsNull(CGRect rect)
{
  return MEMORY[0x24BDBF060]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x24BDD0B80](aClassName);
}

void NSLog(NSString *format, ...)
{
  MEMORY[0x24BDD1000](format);
}

NSString *__cdecl NSStringFromCGPoint(CGPoint point)
{
  return (NSString *)MEMORY[0x24BEBD2B8]((__n128)point, *(__n128 *)&point.y);
}

NSString *__cdecl NSStringFromCGRect(CGRect rect)
{
  return (NSString *)MEMORY[0x24BEBD2C0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x24BDD1240](aClass);
}

void UIGraphicsBeginImageContextWithOptions(CGSize size, BOOL opaque, CGFloat scale)
{
  MEMORY[0x24BEBE280](opaque, (__n128)size, *(__n128 *)&size.height, scale);
}

void UIGraphicsEndImageContext(void)
{
  MEMORY[0x24BEBE298]();
}

UIImage *UIGraphicsGetImageFromCurrentImageContext(void)
{
  return (UIImage *)MEMORY[0x24BEBE2B0]();
}

NSData *__cdecl UIImageJPEGRepresentation(UIImage *image, CGFloat compressionQuality)
{
  return (NSData *)MEMORY[0x24BEBE2D8](image, compressionQuality);
}

uint64_t WFCNPropertyKeysFromActionProperties()
{
  return MEMORY[0x24BE01038]();
}

uint64_t WFContactFromCNContactProperty()
{
  return MEMORY[0x24BE19760]();
}

uint64_t WFContactPropertyIDsFromActionProperties()
{
  return MEMORY[0x24BE01040]();
}

uint64_t WFContentCollectionFromStorageServiceResult()
{
  return MEMORY[0x24BE01048]();
}

uint64_t WFFooterTextForHomeAction()
{
  return MEMORY[0x24BEC49C0]();
}

uint64_t WFGetWorkflowEventStore()
{
  return MEMORY[0x24BE19828]();
}

uint64_t WFImageAtIndexFromImageSource()
{
  return MEMORY[0x24BE19840]();
}

uint64_t WFImageSourceCreateFromFile()
{
  return MEMORY[0x24BE19880]();
}

uint64_t WFLivePhotoFileType()
{
  return MEMORY[0x24BE19890]();
}

uint64_t WFPinboardStoreSecretForUsername()
{
  return MEMORY[0x24BE01088]();
}

uint64_t WFPredicateForEnablingPerson()
{
  return MEMORY[0x24BE198D0]();
}

uint64_t WFPredicateForSelectionOfPerson()
{
  return MEMORY[0x24BE198D8]();
}

uint64_t WFUserInterfaceFromViewController()
{
  return MEMORY[0x24BEC5200]();
}

uint64_t WFViewControllerFromUserInterface()
{
  return MEMORY[0x24BEC5208]();
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

uint64_t _CFBundleCopyBundleURLForExecutableURL()
{
  return MEMORY[0x24BDBCF60]();
}

NSDictionary *_NSDictionaryOfVariableBindings(NSString *commaSeparatedKeysString, id firstValue, ...)
{
  return (NSDictionary *)MEMORY[0x24BDD19C0](commaSeparatedKeysString, firstValue);
}

uint64_t _NSExtensionItemsFromActivityItemValues()
{
  return MEMORY[0x24BE8F718]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x24BDAC780](exception_object);
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

uint32_t arc4random_uniform(uint32_t __upper_bound)
{
  return MEMORY[0x24BDAD170](*(_QWORD *)&__upper_bound);
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x24BDAD320](a1, a2);
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADC60](when, queue, block);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADCC0](queue, block);
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

void dispatch_group_notify(dispatch_group_t group, dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADDE0](group, queue, block);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x24BDADE98](predicate, block);
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x24BDADFF8](when, delta);
}

int dladdr(const void *a1, Dl_info *a2)
{
  return MEMORY[0x24BDAE058](a1, a2);
}

char *dlerror(void)
{
  return (char *)MEMORY[0x24BDAE068]();
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x24BDAE088](__handle, __symbol);
}

void free(void *a1)
{
  MEMORY[0x24BDAE450](a1);
}

uint64_t getWFActionsLogObject()
{
  return MEMORY[0x24BEC1D60]();
}

uint64_t getWFGeneralLogObject()
{
  return MEMORY[0x24BEC1DA0]();
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

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDCFD0](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x24BEDCFE8]();
}

void objc_copyWeak(id *to, id *from)
{
  MEMORY[0x24BEDD030](to, from);
}

void objc_destroyWeak(id *location)
{
  MEMORY[0x24BEDD038](location);
}

void objc_enumerationMutation(id obj)
{
  MEMORY[0x24BEDD068](obj);
}

id objc_getAssociatedObject(id object, const void *key)
{
  return (id)MEMORY[0x24BEDD080](object, key);
}

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x24BEDD088](name);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x24BEDD0C0](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x24BEDD0E8](location);
}

void objc_moveWeak(id *to, id *from)
{
  MEMORY[0x24BEDD0F8](to, from);
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

void objc_setAssociatedObject(id object, const void *key, id value, void *policy)
{
  MEMORY[0x24BEDD3C0](object, key, value, policy);
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

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD458](a1);
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

uint64_t swift_checkMetadataState()
{
  return MEMORY[0x24BEE4BE0]();
}

uint64_t swift_conformsToProtocol2()
{
  return MEMORY[0x24BEE4BF0]();
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

uint64_t swift_dynamicCastMetatype()
{
  return MEMORY[0x24BEE4C50]();
}

uint64_t swift_dynamicCastMetatypeUnconditional()
{
  return MEMORY[0x24BEE4C58]();
}

uint64_t swift_dynamicCastObjCClassUnconditional()
{
  return MEMORY[0x24BEE4C68]();
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

uint64_t swift_getOpaqueTypeMetadata2()
{
  return MEMORY[0x24BEE4DC8]();
}

uint64_t swift_getSingletonMetadata()
{
  return MEMORY[0x24BEE4DD0]();
}

uint64_t swift_getTupleTypeLayout3()
{
  return MEMORY[0x24BEE4DE8]();
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

uint64_t swift_initEnumMetadataSinglePayload()
{
  return MEMORY[0x24BEE4E40]();
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

